@interface TVRCNowPlayingMetadata(NowPlayingInfoViewAdditions)
- (id)infoview_formattedReleaseDate;
- (id)tvrui_RTReviewPercentage;
- (id)tvrui_formattedDuration;
- (id)tvrui_formattedInfo;
@end

@implementation TVRCNowPlayingMetadata(NowPlayingInfoViewAdditions)

- (id)tvrui_formattedInfo
{
  id v2 = objc_alloc_init(MEMORY[0x263EFF980]);
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __74__TVRCNowPlayingMetadata_NowPlayingInfoViewAdditions__tvrui_formattedInfo__block_invoke;
  aBlock[3] = &unk_2648001E0;
  id v3 = v2;
  id v12 = v3;
  v4 = (void (**)(void *, void *))_Block_copy(aBlock);
  v5 = [a1 genre];
  v4[2](v4, v5);

  v6 = objc_msgSend(a1, "infoview_formattedReleaseDate");
  v4[2](v4, v6);

  v7 = objc_msgSend(a1, "tvrui_formattedDuration");
  v4[2](v4, v7);

  if (+[TVRUIFeatures includeRTReviewInInfoPanel])
  {
    v8 = objc_msgSend(a1, "tvrui_RTReviewPercentage");
    v4[2](v4, v8);
  }
  v9 = [v3 componentsJoinedByString:@" • "];

  return v9;
}

- (id)tvrui_formattedDuration
{
  id v2 = [a1 duration];

  if (v2
    && ([a1 duration],
        id v3 = objc_claimAutoreleasedReturnValue(),
        [v3 doubleValue],
        double v5 = v4,
        v3,
        v5 > 0.0))
  {
    v6 = +[TVRUIDateUtilities localizedPlaybackTimeForInterval:v5];
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)infoview_formattedReleaseDate
{
  id v2 = [a1 releaseDate];
  if (v2)
  {
    if ([a1 kind] == 2)
    {
      if (infoview_formattedReleaseDate_onceToken != -1) {
        dispatch_once(&infoview_formattedReleaseDate_onceToken, &__block_literal_global_183);
      }
      id v3 = [(id)infoview_formattedReleaseDate_formatter stringFromDate:v2];
    }
    else
    {
      double v4 = [MEMORY[0x263EFF8F0] currentCalendar];
      double v5 = [v4 components:4 fromDate:v2];

      uint64_t v6 = [v5 year];
      if (v6)
      {
        v7 = NSString;
        v8 = [NSNumber numberWithInteger:v6];
        id v3 = [v7 stringWithFormat:@"%@", v8];
      }
      else
      {
        id v3 = 0;
      }
    }
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

- (id)tvrui_RTReviewPercentage
{
  v1 = [a1 rottenTomatoesReview];
  id v2 = v1;
  if (v1)
  {
    id v3 = [v1 percentage];
    if ([v3 integerValue] < 1)
    {
      double v4 = 0;
    }
    else
    {
      double v4 = [NSString stringWithFormat:@"%@%%", v3];
    }
  }
  else
  {
    double v4 = 0;
  }

  return v4;
}

@end