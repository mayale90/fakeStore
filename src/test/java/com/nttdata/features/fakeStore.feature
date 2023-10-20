Feature: FakeStore Test

  Background:
    * def urlFakeStore = 'https://fakestoreapi.com/products'
    * def validar = read('classpath:data/dataValidar.json')

  @id:1 @consultaProductos
  Scenario: Obtener todos los productos de la tienda y validación de producto específico existente con categoria electronics id 11
    * def idPosicion = validar.data.id - 1
    Given url urlFakeStore
    When method GET
    Then status 200
    * print response
    * def regValidarJSON = response[idPosicion]
    * print regValidarJSON
    * match regValidarJSON.id == validar.data.id
    * match regValidarJSON.title contains validar.data.title
    * match regValidarJSON.category == validar.data.category
    * match regValidarJSON.rating.rate == validar.data.rate

  @id:2 @productoPorCategoria
    Scenario: Validar total de productos de categoria electronics
    Given url urlFakeStore
    And path '/category/' + validar.data.category
    When method GET
    Then status 200
    * print response
    * match response == '#[6]'
    * match $..id contains validar.data.id