defmodule WhiteBreadContext do
  use WhiteBread.Context
  use Hound.Helpers
        
  feature_starting_state fn  ->
      Application.ensure_all_started(:hound)
      %{}
  end
  scenario_starting_state fn _state ->
      Hound.start_session
      %{}
  end
  scenario_finalize fn _status, _state -> 
      # Hound.end_session
      nil
  end



  given_ ~r/^the following taxis are on duty$/, fn state ->
    {:ok, state}
  end

  and_ ~r/^I want to go from "(?<argument_one>[^"]+)" to "(?<argument_two>[^"]+)"$/,
  fn state, %{argument_one: argument_one,argument_two: argument_two} ->
    {
      :ok, 
      state 
      |> Map.put(:arg1, argument_one)
      |> Map.put(:arg2, argument_two)
    }
  end

  and_ ~r/^I open STRS' web page$/, fn state ->
    navigate_to "/new"
    {:ok, state}
  end

  and_ ~r/^I enter the booking information$/, fn state ->
    fill_field({:id, "arg1"}, state[:arg1])
    fill_field({:id, "arg2"}, state[:arg2])
    {:ok, state}
  end

  when_ ~r/^I submit the booking request$/, fn state ->
    # click({:id, "submit_button"})
    {:ok, state}
  end

  then_ ~r/^I should receive a confirmation message$/, fn state ->
    # assert visible_in_page? ~r/Your taxi will arrive in \d+ minutes/
    {:ok, state}
  end


end
