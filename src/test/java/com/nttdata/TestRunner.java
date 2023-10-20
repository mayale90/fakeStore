package com.nttdata;

import com.intuit.karate.junit5.Karate;

public class TestRunner {
    @Karate.Test
    Karate testPet() {
        return Karate.run("features/fakeStore").relativeTo(getClass());
    }
}
