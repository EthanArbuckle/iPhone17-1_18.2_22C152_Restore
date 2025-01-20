@interface VUIPlaybackUtilities
+ (BOOL)isDownloadLimitError:(id)a3;
+ (BOOL)isMPMediaLibraryAssociationError:(id)a3;
+ (BOOL)isOutOfSpaceError:(id)a3;
+ (BOOL)playerIsLive:(id)a3;
+ (double)playedThresholdTimeForDuration:(double)a3;
+ (double)suggestedBookmarkTimeForElapsedTime:(double)a3 duration:(double)a4;
+ (id)updatedHLSURL:(id)a3 forPlaybackContext:(unint64_t)a4;
+ (int64_t)playedStateForDuration:(double)a3 elapsedTime:(double)a4 hasBeenPlayed:(BOOL)a5 playCount:(unint64_t)a6;
+ (int64_t)playedStateForDuration:(double)a3 elapsedTime:(double)a4 hasBeenPlayed:(BOOL)a5 playCount:(unint64_t)a6 respectPlayCount:(BOOL)a7;
+ (void)updateReportingForStartOfPreloadedPlayer:(id)a3;
@end

@implementation VUIPlaybackUtilities

+ (double)playedThresholdTimeForDuration:(double)a3
{
  double v3 = 0.0;
  if (a3 > 0.0 && a3 != 3.40282347e38)
  {
    if (a3 < 10.0) {
      return a3;
    }
    if (a3 >= 900.0)
    {
      if (a3 >= 1800.0)
      {
        if (a3 >= 3900.0)
        {
          if (a3 >= 6000.0)
          {
            double v4 = -660.0;
            return a3 + v4;
          }
          unint64_t v5 = 0xC07E000000000000;
        }
        else
        {
          unint64_t v5 = 0xC06E000000000000;
        }
        double v4 = *(double *)&v5;
      }
      else
      {
        double v4 = -180.0;
      }
    }
    else
    {
      double v4 = -10.0;
    }
    return a3 + v4;
  }
  return v3;
}

+ (double)suggestedBookmarkTimeForElapsedTime:(double)a3 duration:(double)a4
{
  double result = 0.0;
  if (a3 >= 15.0 && a4 > 0.0 && a4 != 3.40282347e38)
  {
    [a1 playedThresholdTimeForDuration:a4];
    BOOL v7 = v6 <= a3;
    double result = 0.0;
    if (!v7) {
      return a3;
    }
  }
  return result;
}

+ (int64_t)playedStateForDuration:(double)a3 elapsedTime:(double)a4 hasBeenPlayed:(BOOL)a5 playCount:(unint64_t)a6
{
  return [a1 playedStateForDuration:a5 elapsedTime:a6 hasBeenPlayed:1 playCount:a3 respectPlayCount:a4];
}

+ (int64_t)playedStateForDuration:(double)a3 elapsedTime:(double)a4 hasBeenPlayed:(BOOL)a5 playCount:(unint64_t)a6 respectPlayCount:(BOOL)a7
{
  if (!a6 || a7)
  {
    int64_t v8 = 3;
    if (a6) {
      return v8;
    }
    int64_t v8 = 1;
    if (!a5) {
      return v8;
    }
    if (a4 < 15.0) {
      return 1;
    }
  }
  else if (a4 < 15.0)
  {
    return 3;
  }
  objc_msgSend(a1, "playedThresholdTimeForDuration:", a5, a3);
  int64_t v8 = 3;
  if (v9 > a4) {
    return 2;
  }
  return v8;
}

+ (BOOL)playerIsLive:(id)a3
{
  [a3 duration];
  return v3 == *MEMORY[0x1E4FA9DC0];
}

+ (BOOL)isOutOfSpaceError:(id)a3
{
  id v3 = a3;
  double v4 = [v3 domain];
  if ([v4 isEqualToString:@"CoreMediaErrorDomain"]) {
    BOOL v5 = [v3 code] == 28;
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

+ (BOOL)isMPMediaLibraryAssociationError:(id)a3
{
  id v3 = [a3 userInfo];
  double v4 = objc_msgSend(v3, "vui_numberForKey:", *MEMORY[0x1E4F4DA48]);

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [v4 integerValue];
    BOOL v7 = v5 == 3047 || v5 == 3050;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

+ (BOOL)isDownloadLimitError:(id)a3
{
  id v3 = a3;
  double v4 = [v3 domain];
  int v5 = [v4 isEqualToString:*MEMORY[0x1E4FAA418]];

  if (v5)
  {
    uint64_t v6 = [v3 code];
    uint64_t v7 = [v3 code];
    uint64_t v8 = [v3 code];
    BOOL v11 = v6 == -345025 || v7 == -345026 || v8 == -345027;
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

+ (id)updatedHLSURL:(id)a3 forPlaybackContext:(unint64_t)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = v5;
  if (!v5)
  {
    id v9 = 0;
    goto LABEL_33;
  }
  uint64_t v7 = [v5 pathExtension];
  int v8 = [v7 isEqualToString:@"m3u8"];

  id v9 = v6;
  if (!v8) {
    goto LABEL_33;
  }
  v10 = +[VUIInterfaceFactory sharedInstance];
  BOOL v11 = [v10 groupActivitiesManager];
  int v12 = [v11 isSessionActive];

  v13 = +[VUIFeaturesConfiguration sharedInstance];
  v14 = [v13 playbackUpNextConfig];
  int v15 = [v14 disablePostPlayTypeHLSQueryParam];

  if (a4 == 11)
  {
    if ((v12 & 1) == 0 && (v15 & 1) == 0)
    {
      v16 = @"postPlayType";
      v20 = @"other";
      v19 = 0;
      v18 = 0;
      goto LABEL_17;
    }
    goto LABEL_11;
  }
  if (a4 != 10)
  {
    if (a4 == 9)
    {
      if (((v12 | v15) & 1) == 0)
      {
        v16 = @"postPlayType";
        v17 = VUIURLQueryParamValueNextEpisodeSameSeason;
LABEL_15:
        v20 = *v17;
        v23 = 0;
        v24 = 0;
        v21 = @"bingeWatching";
        v22 = @"true";
        goto LABEL_16;
      }
      goto LABEL_13;
    }
LABEL_11:
    v18 = 0;
    v19 = 0;
    v20 = 0;
    v16 = 0;
    goto LABEL_31;
  }
  if (((v12 | v15) & 1) == 0)
  {
    v16 = @"postPlayType";
    v17 = VUIURLQueryParamValueNextEpisodeDifferentSeason;
    goto LABEL_15;
  }
LABEL_13:
  v21 = @"bingeWatching";
  v22 = @"true";
  v16 = 0;
  v20 = 0;
  v23 = v21;
  v24 = v22;
LABEL_16:
  v19 = v21;

  v18 = v22;
LABEL_17:
  id v9 = v6;
  if (v16)
  {
    id v9 = v6;
    if (v20)
    {
      v25 = objc_msgSend(v6, "vui_URLByAddingQueryParamWithName:value:", v16, v20);
      v26 = v25;
      id v9 = v6;
      if (v25)
      {
        id v9 = v25;
      }
    }
  }
  if (v19 && v18)
  {
    v27 = objc_msgSend(v9, "vui_URLByAddingQueryParamWithName:value:", v19, v18);
    v28 = v27;
    if (v27)
    {
      id v29 = v27;

      id v9 = v29;
    }
  }
  if (v9 != v6)
  {
    v30 = VUIDefaultLogObject();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      int v32 = 138412290;
      id v33 = v9;
      _os_log_impl(&dword_1E2BD7000, v30, OS_LOG_TYPE_DEFAULT, "HLS URL after adding post play param(s): %@", (uint8_t *)&v32, 0xCu);
    }

    goto LABEL_32;
  }
LABEL_31:
  id v9 = v6;
LABEL_32:

LABEL_33:
  return v9;
}

+ (void)updateReportingForStartOfPreloadedPlayer:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v9 = v3;
    id v4 = (id)*MEMORY[0x1E4FAA3B0];
    unint64_t v5 = [v9 loadingSubstate] - 1;
    if (v5 <= 2)
    {
      id v6 = **((id **)&unk_1E6DF81C8 + v5);

      id v4 = v6;
    }
    uint64_t v7 = [v9 currentMediaItem];
    int v8 = [v7 mediaItemMetadataForProperty:*MEMORY[0x1E4FAA148]];

    [v8 addOrReplaceStartEventWithName:*MEMORY[0x1E4FAA370] date:0];
    [v8 addOrReplaceStartEventWithName:*MEMORY[0x1E4FAA388] date:0];
    [v8 addSingleShotEventWithName:*MEMORY[0x1E4FAA328] value:v4];

    id v3 = v9;
  }
}

@end