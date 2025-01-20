@interface TVRCMediaInfo(TVRUIAdditions)
- (id)tvrui_RTReviewPercentage;
- (id)tvrui_effectiveIdentifier;
- (id)tvrui_formattedDuration;
- (id)tvrui_formattedReleaseDate;
- (id)tvrui_formattedSummary;
@end

@implementation TVRCMediaInfo(TVRUIAdditions)

- (id)tvrui_formattedReleaseDate
{
  v2 = [a1 releaseDate];
  if (v2)
  {
    if ([a1 kind] == 1)
    {
      if (tvrui_formattedReleaseDate_onceToken != -1) {
        dispatch_once(&tvrui_formattedReleaseDate_onceToken, &__block_literal_global_455);
      }
      v3 = [(id)tvrui_formattedReleaseDate_formatter stringFromDate:v2];
    }
    else
    {
      v4 = [MEMORY[0x263EFF8F0] currentCalendar];
      v5 = [v4 components:4 fromDate:v2];

      uint64_t v6 = [v5 year];
      if (v6)
      {
        v7 = NSString;
        v8 = [NSNumber numberWithInteger:v6];
        v3 = [v7 stringWithFormat:@"%@", v8];
      }
      else
      {
        v3 = 0;
      }
    }
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)tvrui_formattedDuration
{
  v2 = [a1 duration];

  if (v2
    && ([a1 duration],
        v3 = objc_claimAutoreleasedReturnValue(),
        [v3 doubleValue],
        double v5 = v4,
        v3,
        v5 > 0.0))
  {
    uint64_t v6 = +[TVRUIDateUtilities localizedPlaybackTimeForInterval:v5];
  }
  else
  {
    uint64_t v6 = 0;
  }
  return v6;
}

- (id)tvrui_RTReviewPercentage
{
  v1 = [a1 rottenTomatoesReview];
  v2 = v1;
  if (v1)
  {
    v3 = [v1 percentage];
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

- (id)tvrui_formattedSummary
{
  id v2 = objc_alloc_init(MEMORY[0x263EFF980]);
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __55__TVRCMediaInfo_TVRUIAdditions__tvrui_formattedSummary__block_invoke;
  aBlock[3] = &unk_2648001E0;
  id v3 = v2;
  id v13 = v3;
  double v4 = (void (**)(void *, void *))_Block_copy(aBlock);
  double v5 = [a1 genre];
  v4[2](v4, v5);

  uint64_t v6 = objc_msgSend(a1, "tvrui_formattedReleaseDate");
  v4[2](v4, v6);

  v7 = objc_msgSend(a1, "tvrui_formattedDuration");
  v4[2](v4, v7);

  if (+[TVRUIFeatures includeRTReviewInInfoPanel])
  {
    v8 = objc_msgSend(a1, "tvrui_RTReviewPercentage");
    v4[2](v4, v8);
  }
  v9 = [a1 ratingDescription];
  v4[2](v4, v9);

  v10 = [v3 componentsJoinedByString:@" • "];

  return v10;
}

- (id)tvrui_effectiveIdentifier
{
  id v2 = [a1 identifier];
  if ([a1 kind] == 1)
  {
    id v3 = [a1 showIdentifier];
    uint64_t v4 = [v3 length];

    if (v4)
    {
      uint64_t v5 = [a1 showIdentifier];

      id v2 = (void *)v5;
    }
  }
  return v2;
}

@end