This is a small command that asks an LLM to review the current branch.
It `git show` all commits since `origin/HEAD` and pipe that into an LLM with a relevant prompt.

### Prerequisites

1. [llm](https://llm.datasette.io/en/stable/), with proper api key setup
2. (optional) create an alias: `git config --global alias.review '!sh ~/git-llm-check/llm-review.sh'`

### Usage

Example on [one of my recent PR on OSRD](https://github.com/OpenRailAssociation/osrd/pull/9177) with an extra print statement:

`$ git review`
> 1. **Remove Debug Print Statement**:
>    ```kotlin
>    +        println(safetySpeedRanges)
>    ```
>    This line should be removed as it is unnecessary for production code and should only be used for debugging purposes.
>
> 2. **Improve Naming for Clarity**:
>    ```kotlin
>    +            val newAttrs =
>    ```
>    Rename `newAttrs` to something more descriptive, such as `speedAttrs`, to better convey its purpose.
>
> 3. **Avoid Redundant Null Check**:
>    ```kotlin
>    if (safetySpeedRanges != null) {
>    ```
>    The `safetySpeedRanges` is already null-checked in the function signature. This additional check is unnecessary.
>
> 4. **Correct the Default Value for `safetySpeedRanges`**:
>    ```kotlin
>    +    safetySpeedRanges: DistanceRangeMap<Speed>? = null,
>    ```
>    The default value should be `distanceRangeMapOf()` instead of `null` to maintain consistency with previous function signatures.
>
> 5. **Improve Comment Clarity**:
>    ```kotlin
>    /**
>     * The speed limit comes from a safety approach area: the train must slow down before reaching
>     * the next signal
>     */
>    ```
>    The comment should be more concise and to the point, e.g., "Speed limit due to safety approach area."
