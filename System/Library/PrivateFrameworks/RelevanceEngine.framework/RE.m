@interface RE
@end

@implementation RE

void ____RE_Cached_Get__ShowAllElements_block_invoke(uint64_t a1)
{
  if (RelevanceEngineLibraryCore_0())
  {
    v2 = [soft__REEngineDefaults() defaultsForEngine:*(void *)(a1 + 32)];
    if (v2)
    {
      v3 = v2;
      [v2 _registerCallback:&__block_literal_global_255_0 forKey:@"ShowAllElements"];
    }
  }
  if (RelevanceEngineLibraryCore_0())
  {
    v4 = [soft__REEngineDefaults() globalDefaults];
    if (v4)
    {
      id v5 = v4;
      [v4 _registerCallback:&__block_literal_global_257 forKey:@"ShowAllElements"];
    }
  }
}

void ____RE_Cached_Get__DisplayDebugProbabilities_block_invoke(uint64_t a1)
{
  if (RelevanceEngineLibraryCore_1())
  {
    v2 = [soft__REEngineDefaults_0() defaultsForEngine:*(void *)(a1 + 32)];
    if (v2)
    {
      v3 = v2;
      [v2 _registerCallback:&__block_literal_global_176 forKey:@"DisplayDebugProbabilities"];
    }
  }
  if (RelevanceEngineLibraryCore_1())
  {
    v4 = [soft__REEngineDefaults_0() globalDefaults];
    if (v4)
    {
      id v5 = v4;
      [v4 _registerCallback:&__block_literal_global_178_0 forKey:@"DisplayDebugProbabilities"];
    }
  }
}

void ____RE_Cached_Get__ShowAllElements_block_invoke_0(uint64_t a1)
{
  if (RelevanceEngineLibraryCore_2())
  {
    v2 = [soft__REEngineDefaults_1() defaultsForEngine:*(void *)(a1 + 32)];
    if (v2)
    {
      v3 = v2;
      [v2 _registerCallback:&__block_literal_global_41_0 forKey:@"ShowAllElements"];
    }
  }
  if (RelevanceEngineLibraryCore_2())
  {
    v4 = [soft__REEngineDefaults_1() globalDefaults];
    if (v4)
    {
      id v5 = v4;
      [v4 _registerCallback:&__block_literal_global_43_2 forKey:@"ShowAllElements"];
    }
  }
}

@end