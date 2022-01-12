# Reel - Hiring project for Elixir

## Purpose

If you choose to apply for an Elixir Software Engineer job at Reel, you will be asked to complete this project as part of the interview process. Your solution to the project will be used as a starting point in our subsequent technical interview. The project is intended to be a small representation of the kind of work we do at Reel.

## Problem description

Allow us to set the scene: We receive raw electricity consumption data in a json format from a third party source. To map this data to our internal consumption data format, we need a parser. Your task is to write this parser, as specified in the next section.

We have set up this project and written a few helper functions so you can focus on developing the parser itself.

You can spend as much time as you want, but we expect the project to take 2-3 hours to complete. You are always more than welcome to reach out to us if something is missing or looks off.

## Your task

##### 1. Write the consumption data parser

The function `parse/1` is defined in the `Parser` module at 'lib/parser.ex'. A sample of json consumption data is read and passed to `parse/1` by the existing helper functions. The data contains hourly consumption readings from a single metering point for a 48 hour period. You can inspect the sample data at 'data/consumption_data.json'.

We want you to write the code that will parse the sample data provided to this function. The `parse/1` function is just a starting point - you can add functions and/or modules as you wish.

The output of the `parse/1` function needs to contain the 48 consumption readings from the sample data in the following format:

```
[
  %{
    "quantity": 0.1,
    "metering_point_id": "927613927390263674",
    "interval_start": "2021-12-31T23:00:00Z",
    "interval_end": "2022-01-01T00:00:00Z"
  },
  %{
    "quantity": 0.08,
    "metering_point_id": "927613927390263674",
    "interval_start": "2022-01-01T00:00:00Z",
    "interval_end": "2022-01-01T01:00:00Z"
  }
  ...
   %{
    "quantity": 0.06,
    "metering_point_id": "927613927390263674",
    "interval_start": "2022-01-02T22:00:00Z",
    "interval_end": "2022-01-02T23:00:00Z"
  }
]
```

##### 2. Write tests to verify your solution

Write tests in 'test/parser_test.exs'. Write as many or as few tests as you see fit to make you feel comfortable in the correctness of your solution. However, we only expect you to test the parser itself.

##### 3. Explain your solution

Write a short (1200 characters max) explanation of how your solution works and why you chose that particular solution.

## Running the program during development

1. Make sure you have Elixir installed (see https://elixir-lang.org/install.html)
2. Compile the project
   - `$ mix compile`
3. Start an iex session (interactive Elixir shell)
   - `$ iex -S mix`
4. Call the `run/0` function from within the iex session
   - `iex> Parser.run()`
5. Run your tests
   - `$ mix test`

## Submitting your work

1. Clone this repository locally
2. Create and switch to a local branch for development
3. Develop your solution
4. Once you're done and have committed everything, create a patch of your changes
   - `git diff main > <your_name>.patch`
5. Send the following to christian@reel.energy
   a. The patch file
   b. The description of your solution in pdf format

## How we evaluate

We focus on three main points in our evaluation:

1. The output of the `parse/1` function is correct. That is, the timestamps, quantity, and metering_point_id of each consumption reading matches the corresponding reading in the input data. Further, the format of the output is as described in the previous section.
2. How you solved the task
3. Your reasoning about choosing this solution
