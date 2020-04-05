# Mongodb Cookbook

# Chef and Test Kitchen Lab

## Timings

60 - 90 Minutes

## Summary

We need to create a resuable chef cookbook for installing and managing mongodb servers.

## Tasks

Create a new cookbook called mongo

Create a ChefSpec suite that tests for the following:

* Sources list is updated
* mongodb-org is added to the sources list ( there is a matcher for this )
* MongoDB will be installed

And InSpec tests for the following:

* MongoDB is installed
* MongoDB is version 3.*

Create a recipe that installs and configures this cookbook correctly to pass all these tests.

.
