@interface MRSystemMediaBundles
+ (BOOL)isBundleCurrentApplicationAirPlayReceiver;
+ (BOOL)isBundleID:(id)a3 systemMediaBundle:(unint64_t)a4;
+ (BOOL)isProcessNameAirPlayReceiver:(id)a3;
+ (BOOL)isSystemMediaBundle:(id)a3;
+ (id)_allSystemMediaBundles;
+ (id)_playbackProcessBundleIDForBundle:(unint64_t)a3;
+ (id)_uiApplicationBundleIDForBundle:(unint64_t)a3;
+ (id)airPlayBundleID;
+ (id)airPlayProcessName;
+ (id)systemMediaBundleIDForBundle:(unint64_t)a3 type:(unint64_t)a4;
+ (id)systemMediaBundleIDForBundleID:(id)a3 type:(unint64_t)a4;
@end

@implementation MRSystemMediaBundles

+ (BOOL)isSystemMediaBundle:(id)a3
{
  id v4 = a3;
  v5 = [a1 _allSystemMediaBundles];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __44__MRSystemMediaBundles_isSystemMediaBundle___block_invoke;
  v9[3] = &unk_1E57D2A28;
  id v10 = v4;
  id v11 = a1;
  id v6 = v4;
  v7 = objc_msgSend(v5, "msv_firstWhere:", v9);
  LOBYTE(v4) = v7 != 0;

  return (char)v4;
}

uint64_t __44__MRSystemMediaBundles_isSystemMediaBundle___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 integerValue];
  uint64_t v5 = *(void *)(a1 + 32);
  id v4 = *(void **)(a1 + 40);

  return [v4 isBundleID:v5 systemMediaBundle:v3];
}

+ (BOOL)isBundleID:(id)a3 systemMediaBundle:(unint64_t)a4
{
  id v5 = a3;
  switch(a4)
  {
    case 0uLL:
      if (isBundleID_systemMediaBundle____once != -1) {
        dispatch_once(&isBundleID_systemMediaBundle____once, &__block_literal_global_27);
      }
      id v6 = &isBundleID_systemMediaBundle____allKnownSystemMediaBundleIDs;
      goto LABEL_17;
    case 1uLL:
      if (isBundleID_systemMediaBundle____once_15 != -1) {
        dispatch_once(&isBundleID_systemMediaBundle____once_15, &__block_literal_global_17_0);
      }
      id v6 = &isBundleID_systemMediaBundle____allKnownSystemClassicalRoomBundleIDs;
      goto LABEL_17;
    case 2uLL:
      if (isBundleID_systemMediaBundle____once_21 != -1) {
        dispatch_once(&isBundleID_systemMediaBundle____once_21, &__block_literal_global_23_0);
      }
      id v6 = &isBundleID_systemMediaBundle____allKnownSystemPodcastBundleIDs;
      goto LABEL_17;
    case 3uLL:
      if (isBundleID_systemMediaBundle____once_30 != -1) {
        dispatch_once(&isBundleID_systemMediaBundle____once_30, &__block_literal_global_32_0);
      }
      id v6 = &isBundleID_systemMediaBundle____allKnownSystemAppleTVBundleIDs;
      goto LABEL_17;
    case 4uLL:
      if (isBundleID_systemMediaBundle____once_45 != -1) {
        dispatch_once(&isBundleID_systemMediaBundle____once_45, &__block_literal_global_47);
      }
      id v6 = &isBundleID_systemMediaBundle____allKnownSystemBooksBundleIDs;
LABEL_17:
      LOBYTE(a4) = [(id)*v6 containsObject:v5];
      break;
    default:
      break;
  }

  return a4 & 1;
}

uint64_t __53__MRSystemMediaBundles_isBundleID_systemMediaBundle___block_invoke()
{
  isBundleID_systemMediaBundle____allKnownSystemMediaBundleIDs = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"com.apple.NanoMusic", @"com.apple.TVMusic", @"com.apple.Music", @"com.apple.iTunes", @"com.apple.sonic.music", 0);

  return MEMORY[0x1F41817F8]();
}

uint64_t __53__MRSystemMediaBundles_isBundleID_systemMediaBundle___block_invoke_2()
{
  isBundleID_systemMediaBundle____allKnownSystemClassicalRoomBundleIDs = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"com.apple.music.classical", 0);

  return MEMORY[0x1F41817F8]();
}

uint64_t __53__MRSystemMediaBundles_isBundleID_systemMediaBundle___block_invoke_3()
{
  isBundleID_systemMediaBundle____allKnownSystemPodcastBundleIDs = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"com.apple.podcasts", @"com.apple.iTunes", @"com.apple.sonic.podcasts", 0);

  return MEMORY[0x1F41817F8]();
}

uint64_t __53__MRSystemMediaBundles_isBundleID_systemMediaBundle___block_invoke_4()
{
  isBundleID_systemMediaBundle____allKnownSystemAppleTVBundleIDs = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"com.apple.AppleTV", @"com.apple.TVWatchList", @"com.apple.TV", @"com.apple.tv", 0);

  return MEMORY[0x1F41817F8]();
}

uint64_t __53__MRSystemMediaBundles_isBundleID_systemMediaBundle___block_invoke_5()
{
  isBundleID_systemMediaBundle____allKnownSystemBooksBundleIDs = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"com.apple.NanoBooks", @"com.apple.TVBooks", @"com.apple.iBooksX", @"com.apple.iBooks", 0);

  return MEMORY[0x1F41817F8]();
}

+ (id)systemMediaBundleIDForBundleID:(id)a3 type:(unint64_t)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  [a1 _allSystemMediaBundles];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "integerValue", (void)v15);
        if ([a1 isBundleID:v6 systemMediaBundle:v12])
        {
          id v13 = [a1 systemMediaBundleIDForBundle:v12 type:a4];

          goto LABEL_11;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  id v13 = v6;
LABEL_11:

  return v13;
}

+ (id)systemMediaBundleIDForBundle:(unint64_t)a3 type:(unint64_t)a4
{
  if (a4 == 1)
  {
    id v4 = [a1 _uiApplicationBundleIDForBundle:a3];
  }
  else
  {
    if (a4) {
      goto LABEL_6;
    }
    id v4 = [a1 _playbackProcessBundleIDForBundle:a3];
  }
  a2 = v4;
LABEL_6:

  return (id)(id)a2;
}

+ (id)airPlayProcessName
{
  return 0;
}

+ (id)airPlayBundleID
{
  v2 = NSString;
  uint64_t v3 = [a1 airPlayProcessName];
  id v4 = [v2 stringWithFormat:@"com.apple.%@", v3];

  return v4;
}

+ (BOOL)isProcessNameAirPlayReceiver:(id)a3
{
  uint64_t v3 = isProcessNameAirPlayReceiver____once;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&isProcessNameAirPlayReceiver____once, &__block_literal_global_65);
  }
  char v5 = [(id)isProcessNameAirPlayReceiver____receivers containsObject:v4];

  return v5;
}

uint64_t __53__MRSystemMediaBundles_isProcessNameAirPlayReceiver___block_invoke()
{
  isProcessNameAirPlayReceiver____receivers = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"TVAirPlay", @"airtunesd", @"tvairplayd", 0);

  return MEMORY[0x1F41817F8]();
}

+ (BOOL)isBundleCurrentApplicationAirPlayReceiver
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__MRSystemMediaBundles_isBundleCurrentApplicationAirPlayReceiver__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (isBundleCurrentApplicationAirPlayReceiver___once != -1) {
    dispatch_once(&isBundleCurrentApplicationAirPlayReceiver___once, block);
  }
  return isBundleCurrentApplicationAirPlayReceiver_isAirPlayReceiver;
}

void __65__MRSystemMediaBundles_isBundleCurrentApplicationAirPlayReceiver__block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F28B50] mainBundle];
  uint64_t v3 = [v2 bundleIdentifier];
  id v4 = [v3 lastPathComponent];

  isBundleCurrentApplicationAirPlayReceiver_isAirPlayReceiver = [*(id *)(a1 + 32) isProcessNameAirPlayReceiver:v4];
}

+ (id)_allSystemMediaBundles
{
  if (_allSystemMediaBundles___once != -1) {
    dispatch_once(&_allSystemMediaBundles___once, &__block_literal_global_77_0);
  }
  v2 = (void *)_allSystemMediaBundles___allSystemMediaBundles;

  return v2;
}

void __46__MRSystemMediaBundles__allSystemMediaBundles__block_invoke()
{
  v0 = (void *)_allSystemMediaBundles___allSystemMediaBundles;
  _allSystemMediaBundles___allSystemMediaBundles = (uint64_t)&unk_1EE66F318;
}

+ (id)_playbackProcessBundleIDForBundle:(unint64_t)a3
{
  if (a3 == 2)
  {
    uint64_t v8 = +[MRUserSettings currentSettings];
    char v9 = [v8 sonicPodcastsEnabled];

    if (v9)
    {
      id v7 = @"com.apple.sonic.podcasts";
      goto LABEL_8;
    }
  }
  else if (!a3)
  {
    char v5 = +[MRUserSettings currentSettings];
    char v6 = [v5 sonicMusicEnabled];

    if (v6)
    {
      id v7 = @"com.apple.sonic.music";
      goto LABEL_8;
    }
  }
  id v7 = [a1 _uiApplicationBundleIDForBundle:a3];
LABEL_8:

  return v7;
}

+ (id)_uiApplicationBundleIDForBundle:(unint64_t)a3
{
  if (a3 - 1 > 3) {
    return @"com.apple.Music";
  }
  else {
    return off_1E57D2A48[a3 - 1];
  }
}

@end