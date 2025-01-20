@interface MTEpisode(Library_App)
+ (id)dateLabelDescriptionForEpisode:()Library_App download:;
+ (uint64_t)downloadSizeLimitForEpisode:()Library_App;
+ (uint64_t)downloadSizeLimitForVideo:()Library_App;
- (BOOL)isPlayable;
- (int64_t)reasonForNotPlayable;
- (uint64_t)setPlayCount:()Library_App;
- (uint64_t)setPlayhead:()Library_App;
- (void)didChangePersistentID;
- (void)setAuthor:()Library_App;
- (void)setGuid:()Library_App;
- (void)setTitle:()Library_App;
@end

@implementation MTEpisode(Library_App)

+ (id)dateLabelDescriptionForEpisode:()Library_App download:
{
  id v5 = a3;
  id v6 = a4;
  if (!v6) {
    goto LABEL_14;
  }
  v7 = +[MTReachability sharedInstance];
  uint64_t v8 = [v7 reasonForNoInternet];

  uint64_t v9 = [MEMORY[0x263F5E9E0] downloadSizeLimitForEpisode:v5];
  if ([v6 downloadBytes] <= v9)
  {
    int v11 = 0;
  }
  else
  {
    v10 = +[MTReachability sharedInstance];
    int v11 = [v10 isReachableViaCellular];
  }
  if ((v8 & 0xFFFFFFFFFFFFFFFDLL) != 1)
  {
    if (v8 == 2) {
      int v14 = 1;
    }
    else {
      int v14 = v11;
    }
    if (v14 == 1)
    {
      int v15 = MGGetBoolAnswer();
      v16 = @"WIFI_CONNECT_RESUME";
      if (v15) {
        v16 = @"WLAN_CONNECT_RESUME";
      }
      v17 = (void *)MEMORY[0x263F086E0];
      v18 = v16;
      v19 = [v17 mainBundle];
      v20 = [v19 localizedStringForKey:v18 value:&stru_26F2CCBC8 table:0];

      goto LABEL_23;
    }
LABEL_14:
    switch([v6 downloadPhase])
    {
      case 1:
        v21 = [MEMORY[0x263F086E0] mainBundle];
        v12 = v21;
        v22 = @"Preparing to download...";
        goto LABEL_21;
      case 2:
        v20 = [v6 downloadDescription];
        goto LABEL_23;
      case 3:
        v21 = [MEMORY[0x263F086E0] mainBundle];
        v12 = v21;
        v22 = @"TAP_TO_RESUME_DOWNLOAD";
        goto LABEL_21;
      case 4:
        v21 = [MEMORY[0x263F086E0] mainBundle];
        v12 = v21;
        v22 = @"Waiting";
        goto LABEL_21;
      case 5:
        v21 = [MEMORY[0x263F086E0] mainBundle];
        v12 = v21;
        v22 = @"DOWNLOAD_ERROR_TAP_TO_RETRY";
LABEL_21:
        uint64_t v13 = [v21 localizedStringForKey:v22 value:&stru_26F2CCBC8 table:0];
        goto LABEL_22;
      default:
        v20 = 0;
        goto LABEL_23;
    }
  }
  v12 = +[MTReachability sharedInstance];
  uint64_t v13 = [v12 reasonTextForNoInternet];
LABEL_22:
  v20 = (void *)v13;

LABEL_23:
  return v20;
}

+ (uint64_t)downloadSizeLimitForEpisode:()Library_App
{
  uint64_t v4 = [a3 isVideo];
  return [a1 downloadSizeLimitForVideo:v4];
}

+ (uint64_t)downloadSizeLimitForVideo:()Library_App
{
  return 0;
}

- (void)setGuid:()Library_App
{
  unint64_t v9 = a3;
  uint64_t v4 = [a1 guid];
  unint64_t v5 = v9 | v4;

  if (v5)
  {
    id v6 = [a1 guid];
    char v7 = [v6 isEqualToString:v9];

    if ((v7 & 1) == 0)
    {
      uint64_t v8 = *MEMORY[0x263F5EAE8];
      [a1 willChangeValueForKey:*MEMORY[0x263F5EAE8]];
      [a1 setPrimitiveValue:v9 forKey:v8];
      [a1 didChangeValueForKey:v8];
      [a1 updateUPPIdentifierIfNeeded];
    }
  }
}

- (void)setTitle:()Library_App
{
  unint64_t v10 = a3;
  uint64_t v4 = [a1 title];
  unint64_t v5 = v10 | v4;

  if (v5)
  {
    id v6 = [a1 title];
    char v7 = [v6 isEqualToString:v10];

    if ((v7 & 1) == 0)
    {
      uint64_t v8 = *MEMORY[0x263F5EB60];
      [a1 willChangeValueForKey:*MEMORY[0x263F5EB60]];
      [a1 setPrimitiveValue:v10 forKey:v8];
      [a1 didChangeValueForKey:v8];
      unint64_t v9 = [a1 guid];

      if (!v9) {
        [a1 updateUPPIdentifierIfNeeded];
      }
    }
  }
}

- (void)setAuthor:()Library_App
{
  unint64_t v10 = a3;
  uint64_t v4 = [a1 author];
  unint64_t v5 = v10 | v4;

  if (v5)
  {
    id v6 = [a1 author];
    char v7 = [v6 isEqualToString:v10];

    if ((v7 & 1) == 0)
    {
      uint64_t v8 = *MEMORY[0x263F5EA80];
      [a1 willChangeValueForKey:*MEMORY[0x263F5EA80]];
      [a1 setPrimitiveValue:v10 forKey:v8];
      [a1 didChangeValueForKey:v8];
      unint64_t v9 = [a1 guid];

      if (!v9) {
        [a1 updateUPPIdentifierIfNeeded];
      }
    }
  }
}

- (BOOL)isPlayable
{
  return [a1 reasonForNotPlayable] == 0;
}

- (int64_t)reasonForNotPlayable
{
  return +[MTEpisodeUnavailableUtil unavailableReasonForEpisode:a1];
}

- (void)didChangePersistentID
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  v1 = objc_msgSend(a1, "playlists", 0);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v7;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v7 != v4) {
          objc_enumerationMutation(v1);
        }
        [*(id *)(*((void *)&v6 + 1) + 8 * v5++) updateUnplayedCount];
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }
    while (v3);
  }
}

- (uint64_t)setPlayCount:()Library_App
{
  uint64_t result = [a1 playCount];
  if (result != a3)
  {
    uint64_t v6 = *MEMORY[0x263F5EB10];
    [a1 willChangeValueForKey:*MEMORY[0x263F5EB10]];
    long long v7 = [NSNumber numberWithLongLong:a3];
    [a1 setPrimitiveValue:v7 forKey:v6];

    [a1 didChangeValueForKey:v6];
    return [a1 updateUPPTimestamp];
  }
  return result;
}

- (uint64_t)setPlayhead:()Library_App
{
  [a1 playhead];
  float v5 = v4;
  uint64_t result = [a1 playhead];
  if (*(float *)&v7 != a2)
  {
    *(float *)&double v7 = vabds_f32(v5, a2);
    if (a2 == 0.0 || *(float *)&v7 >= 0.5)
    {
      uint64_t v9 = *MEMORY[0x263F5EB28];
      objc_msgSend(a1, "willChangeValueForKey:", *MEMORY[0x263F5EB28], v7);
      *(float *)&double v10 = a2;
      uint64_t v11 = [NSNumber numberWithFloat:v10];
      [a1 setPrimitiveValue:v11 forKey:v9];

      [a1 didChangeValueForKey:v9];
      return [a1 updateUPPTimestamp];
    }
  }
  return result;
}

@end