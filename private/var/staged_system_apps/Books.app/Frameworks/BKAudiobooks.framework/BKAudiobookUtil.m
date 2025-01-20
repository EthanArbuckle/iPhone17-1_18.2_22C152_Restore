@interface BKAudiobookUtil
+ (id)_generateShortTimeRemainingStringFromControls:(id)a3 finishedString:(id)a4 unfinishedStringFormat:(id)a5;
+ (id)currentChapterInAudiobook:(id)a3;
+ (id)generateShortTimeRemainingStringFromControls:(id)a3;
+ (id)generateShorterTimeRemainingStringFromControls:(id)a3;
@end

@implementation BKAudiobookUtil

+ (id)currentChapterInAudiobook:(id)a3
{
  id v3 = a3;
  memset(&v17, 0, sizeof(v17));
  [v3 bookmarkTime];
  CMTimeMakeWithSeconds(&v17, v4, 1000000000);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v5 = [v3 chapters];
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (v9) {
          [*(id *)(*((void *)&v13 + 1) + 8 * i) timeRangeInAudiobook];
        }
        else {
          memset(&range, 0, sizeof(range));
        }
        CMTime v11 = v17;
        if (CMTimeRangeContainsTime(&range, &v11))
        {
          id v6 = v9;
          goto LABEL_14;
        }
      }
      id v6 = [v5 countByEnumeratingWithState:&v13 objects:v18 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_14:

  return v6;
}

+ (id)generateShortTimeRemainingStringFromControls:(id)a3
{
  id v4 = a3;
  v5 = BKAudiobooksBundle();
  id v6 = [v5 localizedStringForKey:@"You\\U2019ve finished this audiobook" value:&stru_3D468 table:&stru_3D468];
  uint64_t v7 = BKAudiobooksBundle();
  v8 = [v7 localizedStringForKey:@"%@ left" value:&stru_3D468 table:&stru_3D468];
  v9 = [a1 _generateShortTimeRemainingStringFromControls:v4 finishedString:v6 unfinishedStringFormat:v8];

  return v9;
}

+ (id)generateShorterTimeRemainingStringFromControls:(id)a3
{
  id v4 = a3;
  v5 = BKAudiobooksBundle();
  id v6 = [v5 localizedStringForKey:@"You\\U2019ve finished!" value:&stru_3D468 table:&stru_3D468];
  uint64_t v7 = BKAudiobooksBundle();
  v8 = [v7 localizedStringForKey:@"%@ left" value:&stru_3D468 table:&stru_3D468];
  v9 = [a1 _generateShortTimeRemainingStringFromControls:v4 finishedString:v6 unfinishedStringFormat:v8];

  return v9;
}

+ (id)_generateShortTimeRemainingStringFromControls:(id)a3 finishedString:(id)a4 unfinishedStringFormat:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (qword_48EE0 != -1) {
    dispatch_once(&qword_48EE0, &stru_3D018);
  }
  [v7 timeRemainingInCurrentAudiobook];
  double v11 = v10;
  [v7 playbackRate];
  if (v12 > 0.0)
  {
    [v7 playbackRate];
    double v11 = v11 / v13;
  }
  if (v11 <= 0.0)
  {
    long long v16 = (__CFString *)v8;
  }
  else
  {
    long long v14 = &qword_48ED0;
    if (v11 < 60.0) {
      long long v14 = &qword_48ED8;
    }
    long long v15 = [(id)*v14 stringFromTimeInterval:v11];
    if ([v15 length])
    {
      +[NSString stringWithFormat:](NSString, "stringWithFormat:", v9, v15);
      long long v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      long long v16 = &stru_3D468;
    }
  }

  return v16;
}

@end