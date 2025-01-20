@interface MPCPlayerPath(NanoMediaRemote)
+ (id)nmr_pathWithNowPlayingURL:()NanoMediaRemote;
- (uint64_t)nmr_isSystemBooksPath;
- (uint64_t)nmr_isSystemMindfulnessPath;
- (uint64_t)nmr_isSystemPodcastsPath;
- (uint64_t)nmr_isSystemRemotePath;
- (uint64_t)nmr_isSystemVoiceMemosPath;
- (uint64_t)nmr_isSystemWorkoutGuidedWalkPath;
- (uint64_t)nmr_isSystemWorkoutPath;
@end

@implementation MPCPlayerPath(NanoMediaRemote)

- (uint64_t)nmr_isSystemPodcastsPath
{
  v1 = [a1 representedBundleID];
  uint64_t IsSystemPodcastApplication = MRMediaRemoteApplicationIsSystemPodcastApplication();

  return IsSystemPodcastApplication;
}

- (uint64_t)nmr_isSystemBooksPath
{
  v1 = [a1 representedBundleID];
  uint64_t IsSystemBooksApplication = MRMediaRemoteApplicationIsSystemBooksApplication();

  return IsSystemBooksApplication;
}

- (uint64_t)nmr_isSystemWorkoutPath
{
  v1 = [a1 representedBundleID];
  uint64_t v2 = [v1 isEqualToString:@"com.apple.SessionTrackerApp"];

  return v2;
}

- (uint64_t)nmr_isSystemWorkoutGuidedWalkPath
{
  uint64_t result = objc_msgSend(a1, "nmr_isSystemWorkoutPath");
  if (result)
  {
    v3 = [a1 playerID];
    uint64_t v4 = [v3 isEqualToString:@"guidedWalk"];

    return v4;
  }
  return result;
}

- (uint64_t)nmr_isSystemVoiceMemosPath
{
  v1 = [a1 representedBundleID];
  uint64_t v2 = [v1 isEqualToString:@"com.apple.VoiceMemos"];

  return v2;
}

- (uint64_t)nmr_isSystemRemotePath
{
  v1 = [a1 representedBundleID];
  uint64_t v2 = [v1 isEqualToString:@"com.apple.NanoRemote"];

  return v2;
}

- (uint64_t)nmr_isSystemMindfulnessPath
{
  v1 = [a1 representedBundleID];
  uint64_t v2 = [v1 isEqualToString:@"com.apple.Mind"];

  return v2;
}

+ (id)nmr_pathWithNowPlayingURL:()NanoMediaRemote
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  v5 = [MEMORY[0x263F08BA0] componentsWithURL:a3 resolvingAgainstBaseURL:0];
  v6 = [v5 queryItems];
  uint64_t v7 = [v6 count];

  if (v7)
  {
    v8 = (void *)MEMORY[0x263EFF9A0];
    v9 = [v5 queryItems];
    v10 = objc_msgSend(v8, "dictionaryWithCapacity:", objc_msgSend(v9, "count"));

    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    v11 = objc_msgSend(v5, "queryItems", 0);
    uint64_t v12 = [v11 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v12)
    {
      v3 = (void *)v12;
      uint64_t v13 = *(void *)v28;
      do
      {
        for (i = 0; i != v3; i = (char *)i + 1)
        {
          if (*(void *)v28 != v13) {
            objc_enumerationMutation(v11);
          }
          v15 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          v16 = [v15 value];
          v17 = [v15 name];
          [v10 setObject:v16 forKeyedSubscript:v17];
        }
        v3 = (void *)[v11 countByEnumeratingWithState:&v27 objects:v31 count:16];
      }
      while (v3);
    }

    uint64_t v18 = [v10 objectForKeyedSubscript:@"deviceUID"];
    v19 = (void *)v18;
    if (v18)
    {
      int v20 = 0;
      v21 = (void *)v18;
    }
    else
    {
      uint64_t v23 = [v10 objectForKeyedSubscript:@"routeUID"];
      v3 = (void *)v23;
      if (v23)
      {
        int v20 = 0;
        v21 = (void *)v23;
      }
      else
      {
        v21 = [v10 objectForKeyedSubscript:@"deviceIdentifier"];
        int v20 = 1;
      }
    }
    v24 = [v10 objectForKeyedSubscript:@"bundleID"];
    v25 = [v10 objectForKeyedSubscript:@"playerID"];
    v22 = [a1 pathWithDeviceUID:v21 bundleID:v24 pid:0 playerID:v25];

    if (v20) {
    if (!v19)
    }
  }
  else
  {
    v22 = 0;
  }

  return v22;
}

@end