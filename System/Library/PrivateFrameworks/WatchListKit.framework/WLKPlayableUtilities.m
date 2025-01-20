@interface WLKPlayableUtilities
+ (BOOL)_openITunesPlayableWatchListAppAvailable:(id)a3 forContentType:(unint64_t)a4 canonicalID:(id)a5 showCanonicalID:(id)a6 seasonCanonicalID:(id)a7;
+ (BOOL)_openITunesPlayableWatchListAppUnavailable:(id)a3 forContentType:(unint64_t)a4 canonicalID:(id)a5 showCanonicalID:(id)a6 seasonCanonicalID:(id)a7;
+ (BOOL)_openNonITunesPlayableWatchListAppAvailable:(id)a3 forContentType:(unint64_t)a4 canonicalID:(id)a5 showCanonicalID:(id)a6 seasonCanonicalID:(id)a7;
+ (BOOL)_openNonITunesPlayableWatchListAppUnavailable:(id)a3 forContentType:(unint64_t)a4 canonicalID:(id)a5 showCanonicalID:(id)a6 seasonCanonicalID:(id)a7;
+ (BOOL)_openPunchoutURL:(id)a3 isPlaybackURL:(BOOL)a4;
+ (BOOL)_playNonITunesPlayableUsingAssociatedApp:(id)a3;
+ (BOOL)openPlayable:(id)a3 forContentType:(unint64_t)a4 canonicalID:(id)a5;
+ (BOOL)openPlayable:(id)a3 forContentType:(unint64_t)a4 canonicalID:(id)a5 showCanonicalID:(id)a6;
+ (BOOL)openPlayable:(id)a3 forContentType:(unint64_t)a4 canonicalID:(id)a5 showCanonicalID:(id)a6 seasonCanonicalID:(id)a7;
+ (id)_defaultOpenPunchoutURLWithPlayable:(id)a3;
+ (id)_defaultPlayPunchoutURLWithPlayable:(id)a3;
+ (id)_defaultPunchoutURLWithPlayable:(id)a3 URLKey:(id)a4;
+ (id)_defaultPunchoutURLWithPlayable:(id)a3 isPlaybackURL:(BOOL *)a4;
+ (id)_punchoutURLForDirectPlayback:(id)a3 ignoreExtras:(BOOL)a4;
+ (id)_watchListAppOpenPunchoutURLWithITunesPlayable:(id)a3 forContentType:(unint64_t)a4 canonicalID:(id)a5 showCanonicalID:(id)a6 seasonCanonicalID:(id)a7;
+ (id)_watchListAppPunchoutURLWithPlayable:(id)a3 forContentType:(unint64_t)a4 canonicalID:(id)a5 showCanonicalID:(id)a6 seasonCanonicalID:(id)a7 allowPlayAction:(BOOL)a8 isPlaybackURL:(BOOL *)a9;
@end

@implementation WLKPlayableUtilities

+ (BOOL)openPlayable:(id)a3 forContentType:(unint64_t)a4 canonicalID:(id)a5
{
  return [a1 openPlayable:a3 forContentType:a4 canonicalID:a5 showCanonicalID:0 seasonCanonicalID:0];
}

+ (BOOL)openPlayable:(id)a3 forContentType:(unint64_t)a4 canonicalID:(id)a5 showCanonicalID:(id)a6
{
  return [a1 openPlayable:a3 forContentType:a4 canonicalID:a5 showCanonicalID:a6 seasonCanonicalID:0];
}

+ (BOOL)openPlayable:(id)a3 forContentType:(unint64_t)a4 canonicalID:(id)a5 showCanonicalID:(id)a6 seasonCanonicalID:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  int v16 = [(id)objc_opt_class() isFullTVAppEnabled];
  int v17 = [v12 isiTunes];
  if (v16)
  {
    if (v17) {
      unsigned int v18 = [a1 _openITunesPlayableWatchListAppAvailable:v12 forContentType:a4 canonicalID:v13 showCanonicalID:v14 seasonCanonicalID:v15];
    }
    else {
      unsigned int v18 = [a1 _openNonITunesPlayableWatchListAppAvailable:v12 forContentType:a4 canonicalID:v13 showCanonicalID:v14 seasonCanonicalID:v15];
    }
  }
  else if (v17)
  {
    unsigned int v18 = [a1 _openITunesPlayableWatchListAppUnavailable:v12 forContentType:a4 canonicalID:v13 showCanonicalID:v14 seasonCanonicalID:v15];
  }
  else
  {
    unsigned int v18 = [a1 _openNonITunesPlayableWatchListAppUnavailable:v12 forContentType:a4 canonicalID:v13 showCanonicalID:v14 seasonCanonicalID:v15];
  }
  BOOL v19 = v18;
  NSLog(&cfstr_Wlkplayableuti.isa, v18);

  return v19;
}

+ (BOOL)_openITunesPlayableWatchListAppAvailable:(id)a3 forContentType:(unint64_t)a4 canonicalID:(id)a5 showCanonicalID:(id)a6 seasonCanonicalID:(id)a7
{
  unsigned __int8 v13 = 0;
  v8 = [a1 _watchListAppPunchoutURLWithPlayable:a3 forContentType:a4 canonicalID:a5 showCanonicalID:a6 seasonCanonicalID:a7 allowPlayAction:1 isPlaybackURL:&v13];
  v9 = v8;
  if (v8)
  {
    v10 = [v8 absoluteString];
    NSLog(&cfstr_Wlkplayableuti_0.isa, v10);

    char v11 = [a1 _openPunchoutURL:v9 isPlaybackURL:v13];
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

+ (BOOL)_openNonITunesPlayableWatchListAppAvailable:(id)a3 forContentType:(unint64_t)a4 canonicalID:(id)a5 showCanonicalID:(id)a6 seasonCanonicalID:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  if ([v12 isEntitled]
    && ([a1 _playNonITunesPlayableUsingAssociatedApp:v12] & 1) != 0)
  {
    char v16 = 1;
  }
  else
  {
    int v17 = [a1 _watchListAppOpenPunchoutURLWithITunesPlayable:v12 forContentType:a4 canonicalID:v13 showCanonicalID:v14 seasonCanonicalID:v15];
    unsigned int v18 = v17;
    if (v17)
    {
      BOOL v19 = [v17 absoluteString];
      NSLog(&cfstr_Wlkplayableuti_1.isa, v19);

      char v16 = [a1 _openPunchoutURL:v18 isPlaybackURL:0];
    }
    else
    {
      char v16 = 0;
    }
  }
  return v16;
}

+ (BOOL)_openITunesPlayableWatchListAppUnavailable:(id)a3 forContentType:(unint64_t)a4 canonicalID:(id)a5 showCanonicalID:(id)a6 seasonCanonicalID:(id)a7
{
  unsigned __int8 v13 = 0;
  v8 = objc_msgSend(a1, "_defaultPunchoutURLWithPlayable:isPlaybackURL:", a3, &v13, a5, a6, a7);
  v9 = v8;
  if (v8)
  {
    v10 = [v8 absoluteString];
    NSLog(&cfstr_Wlkplayableuti_2.isa, v10);

    char v11 = [a1 _openPunchoutURL:v9 isPlaybackURL:v13];
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

+ (BOOL)_openNonITunesPlayableWatchListAppUnavailable:(id)a3 forContentType:(unint64_t)a4 canonicalID:(id)a5 showCanonicalID:(id)a6 seasonCanonicalID:(id)a7
{
  id v8 = a3;
  if ([v8 isEntitled]
    && ([a1 _playNonITunesPlayableUsingAssociatedApp:v8] & 1) != 0)
  {
    char v9 = 1;
  }
  else
  {
    unsigned __int8 v14 = 0;
    v10 = [a1 _defaultPunchoutURLWithPlayable:v8 isPlaybackURL:&v14];
    char v11 = v10;
    if (v10)
    {
      id v12 = [v10 absoluteString];
      NSLog(&cfstr_Wlkplayableuti_3.isa, v12);

      char v9 = [a1 _openPunchoutURL:v11 isPlaybackURL:v14];
    }
    else
    {
      char v9 = 0;
    }
  }
  return v9;
}

+ (id)_watchListAppOpenPunchoutURLWithITunesPlayable:(id)a3 forContentType:(unint64_t)a4 canonicalID:(id)a5 showCanonicalID:(id)a6 seasonCanonicalID:(id)a7
{
  return (id)[a1 _watchListAppPunchoutURLWithPlayable:a3 forContentType:a4 canonicalID:a5 showCanonicalID:a6 seasonCanonicalID:a7 allowPlayAction:0 isPlaybackURL:0];
}

+ (id)_watchListAppPunchoutURLWithPlayable:(id)a3 forContentType:(unint64_t)a4 canonicalID:(id)a5 showCanonicalID:(id)a6 seasonCanonicalID:(id)a7 allowPlayAction:(BOOL)a8 isPlaybackURL:(BOOL *)a9
{
  BOOL v9 = a8;
  unsigned __int8 v14 = a9;
  id v15 = a3;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  switch(a4)
  {
    case 1uLL:
      [NSString stringWithFormat:@"/movie/%@", v16];
      goto LABEL_12;
    case 2uLL:
      [NSString stringWithFormat:@"/show/%@", v16];
      goto LABEL_12;
    case 3uLL:
      if (!v17) {
        goto LABEL_6;
      }
      v20 = [NSString stringWithFormat:@"/season/%@", v16];
      v21 = (void *)[objc_alloc(MEMORY[0x1E4F290C8]) initWithName:@"showId" value:v17];
      [v19 addObject:v21];
      goto LABEL_10;
    case 4uLL:
      v20 = 0;
      if (!v17 || !v18) {
        break;
      }
      v20 = [NSString stringWithFormat:@"/episode/%@", v16];
      v21 = (void *)[objc_alloc(MEMORY[0x1E4F290C8]) initWithName:@"seasonId" value:v18];
      [v19 addObject:v21];
      uint64_t v22 = [objc_alloc(MEMORY[0x1E4F290C8]) initWithName:@"showId" value:v17];
      id v23 = v17;
      id v24 = v18;
      v25 = (void *)v22;
      [v19 addObject:v22];

      id v18 = v24;
      id v17 = v23;
LABEL_10:

      break;
    case 5uLL:
      [NSString stringWithFormat:@"/sportingevent/%@", v16];
      v20 = LABEL_12:;
      break;
    default:
LABEL_6:
      v20 = 0;
      break;
  }
  BOOL v26 = [v15 isEntitled] & v9;
  if (v26)
  {
    id v27 = v17;
    id v28 = v18;
    v29 = (void *)[objc_alloc(MEMORY[0x1E4F290C8]) initWithName:@"action" value:@"play"];
    [v19 addObject:v29];
    v30 = [v15 playEvent];

    if (v30)
    {
      v31 = [v15 playEvent];
      [v31 elapsedTime];
      double v33 = v32;

      if (v33 > 0.00000011920929)
      {
        v34 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", (unint64_t)v33);
        v35 = (void *)[objc_alloc(MEMORY[0x1E4F290C8]) initWithName:@"resumeTime" value:v34];
        [v19 addObject:v35];
      }
    }

    id v18 = v28;
    id v17 = v27;
    unsigned __int8 v14 = a9;
  }
  if (v20)
  {
    id v36 = objc_alloc_init(MEMORY[0x1E4F29088]);
    [v36 setScheme:@"com.apple.WatchList"];
    [v36 setHost:@"tv.apple.com"];
    [v36 setPath:v20];
    [v36 setQueryItems:v19];
    v37 = [v36 URL];

    if (!v14) {
      goto LABEL_21;
    }
    goto LABEL_20;
  }
  v37 = 0;
  LOBYTE(v26) = 0;
  if (v14) {
LABEL_20:
  }
    *unsigned __int8 v14 = v26;
LABEL_21:

  return v37;
}

+ (id)_punchoutURLForDirectPlayback:(id)a3 ignoreExtras:(BOOL)a4
{
  if (a3)
  {
    BOOL v4 = a4;
    v5 = [MEMORY[0x1E4F29088] componentsWithURL:a3 resolvingAgainstBaseURL:0];
    v6 = [v5 queryItems];
    v7 = (void *)[v6 mutableCopy];
    id v8 = v7;
    if (v7)
    {
      id v9 = v7;
    }
    else
    {
      id v9 = [MEMORY[0x1E4F1CA48] array];
    }
    char v11 = v9;

    id v12 = (void *)[objc_alloc(MEMORY[0x1E4F290C8]) initWithName:@"action" value:@"play"];
    [v11 addObject:v12];

    if (v4)
    {
      unsigned __int8 v13 = (void *)[objc_alloc(MEMORY[0x1E4F290C8]) initWithName:@"ignoreExtras" value:@"true"];
      [v11 addObject:v13];
    }
    [v5 setQueryItems:v11];
    v10 = [v5 URL];
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (BOOL)_playNonITunesPlayableUsingAssociatedApp:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 isEntitled])
  {
    BOOL v4 = [v3 punchoutUrls];
    v5 = [v4 objectForKey:@"play"];

    NSLog(&cfstr_Wlkplayableuti_4.isa, v5);
    if (v5)
    {
      uint64_t v6 = [MEMORY[0x1E4F1CB10] URLWithString:v5];
      v7 = (void *)v6;
      if (v6)
      {
        id v24 = (void *)v6;
        v25 = v5;
        long long v28 = 0u;
        long long v29 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        id v8 = [v3 channelDetails];
        id v9 = [v8 appBundleIDs];

        uint64_t v10 = [v9 countByEnumeratingWithState:&v26 objects:v30 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v27;
LABEL_6:
          uint64_t v13 = 0;
          while (1)
          {
            if (*(void *)v27 != v12) {
              objc_enumerationMutation(v9);
            }
            unsigned __int8 v14 = *(void **)(*((void *)&v26 + 1) + 8 * v13);
            id v15 = +[WLKAppLibrary defaultAppLibrary];
            id v16 = [v15 allAppBundleIdentifiers];
            char v17 = [v16 containsObject:v14];

            if (v17) {
              break;
            }
            if (v11 == ++v13)
            {
              uint64_t v11 = [v9 countByEnumeratingWithState:&v26 objects:v30 count:16];
              if (v11) {
                goto LABEL_6;
              }
              goto LABEL_12;
            }
          }
          id v19 = v14;

          if (!v19) {
            goto LABEL_17;
          }
          BOOL v18 = 1;
          v20 = WLKLaunchOptionsForPlayback(1);
          v21 = [MEMORY[0x1E4F223E0] defaultWorkspace];
          v7 = v24;
          uint64_t v22 = [v21 operationToOpenResource:v24 usingApplication:v19 uniqueDocumentIdentifier:0 isContentManaged:0 sourceAuditToken:0 userInfo:0 options:v20 delegate:0];

          [v22 main];
          v5 = v25;
        }
        else
        {
LABEL_12:

LABEL_17:
          id v19 = [v3 channelDetails];
          v20 = [v19 appBundleIDs];
          NSLog(&cfstr_Wlkplayableuti_5.isa, v20);
          BOOL v18 = 0;
          v7 = v24;
          v5 = v25;
        }
      }
      else
      {
        BOOL v18 = 0;
      }
    }
    else
    {
      BOOL v18 = 0;
    }
  }
  else
  {
    BOOL v18 = 0;
  }

  return v18;
}

+ (id)_defaultOpenPunchoutURLWithPlayable:(id)a3
{
  return (id)[a1 _defaultPunchoutURLWithPlayable:a3 URLKey:@"open"];
}

+ (id)_defaultPlayPunchoutURLWithPlayable:(id)a3
{
  return (id)[a1 _defaultPunchoutURLWithPlayable:a3 URLKey:@"play"];
}

+ (id)_defaultPunchoutURLWithPlayable:(id)a3 URLKey:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [a3 punchoutUrls];
  v7 = [v6 objectForKey:v5];

  if (v7)
  {
    id v8 = [MEMORY[0x1E4F1CB10] URLWithString:v7];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

+ (id)_defaultPunchoutURLWithPlayable:(id)a3 isPlaybackURL:(BOOL *)a4
{
  id v6 = a3;
  int v7 = [v6 isEntitled];
  BOOL v8 = v7;
  if (v7) {
    [a1 _defaultPlayPunchoutURLWithPlayable:v6];
  }
  else {
  id v9 = [a1 _defaultOpenPunchoutURLWithPlayable:v6];
  }

  if (a4) {
    *a4 = v8;
  }

  return v9;
}

+ (BOOL)_openPunchoutURL:(id)a3 isPlaybackURL:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = (void *)MEMORY[0x1E4F1C9C8];
  id v6 = a3;
  int v7 = [v5 date];
  BOOL v8 = WLKLaunchOptionsForPlayback(v4);
  id v9 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  id v15 = 0;
  unsigned int v10 = [v9 openURL:v6 withOptions:v8 error:&v15];

  id v11 = v15;
  uint64_t v12 = [MEMORY[0x1E4F1C9C8] date];
  [v12 timeIntervalSinceDate:v7];
  NSLog(&cfstr_Wlkplayableuti_6.isa, v10, v11, v13);

  return v10;
}

@end