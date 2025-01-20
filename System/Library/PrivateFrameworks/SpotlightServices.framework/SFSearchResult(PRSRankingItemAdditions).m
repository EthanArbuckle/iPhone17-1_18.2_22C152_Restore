@interface SFSearchResult(PRSRankingItemAdditions)
- (float)PRSRankingItemAdditions_albumNumYearsAgo:()PRSRankingItemAdditions;
- (float)PRSRankingItemAdditions_albumStarRating;
- (float)PRSRankingItemAdditions_anyTophitMustBe;
- (float)PRSRankingItemAdditions_anyTophitNo;
- (float)PRSRankingItemAdditions_appNumReviews;
- (float)PRSRankingItemAdditions_appStarRating;
- (float)PRSRankingItemAdditions_epubBookNumReviews;
- (float)PRSRankingItemAdditions_epubBookNumYearsAgo:()PRSRankingItemAdditions;
- (float)PRSRankingItemAdditions_epubBookStarRating;
- (float)PRSRankingItemAdditions_movieNumYearsAgo:()PRSRankingItemAdditions;
- (float)PRSRankingItemAdditions_movieReviewRating;
- (float)PRSRankingItemAdditions_movieStarRating;
- (float)PRSRankingItemAdditions_podcastStarRating;
- (float)PRSRankingItemAdditions_profileNumFollowers;
- (float)PRSRankingItemAdditions_songNumYearsAgo:()PRSRankingItemAdditions;
- (float)PRSRankingItemAdditions_tvshowNumYearsAgo:()PRSRankingItemAdditions;
- (float)PRSRankingItemAdditions_webVideoNumViews;
- (float)PRSRankingItemAdditions_webVideoNumYearsAgo:()PRSRankingItemAdditions;
- (id)PRSRankingItemAdditions_description;
- (id)PRSRankingItemAdditions_title;
- (id)PRSRankingItemAdditions_url;
@end

@implementation SFSearchResult(PRSRankingItemAdditions)

- (float)PRSRankingItemAdditions_albumStarRating
{
  v2 = [a1 sectionBundleIdentifier];
  int v3 = [v2 isEqualToString:@"com.apple.parsec.itunes.album"];

  float v4 = -1.0;
  if (v3)
  {
    v5 = getDetailedRowCardSectionDescriptionRichText(a1, 0, 2uLL);
    v6 = v5;
    if (v5)
    {
      [v5 starRating];
      float v4 = v7;
    }
  }
  return v4;
}

- (float)PRSRankingItemAdditions_appNumReviews
{
  v2 = [a1 sectionBundleIdentifier];
  int v3 = [v2 isEqualToString:@"com.apple.parsec.itunes.iosSoftware"];

  float NumReviews = -1.0;
  if (v3)
  {
    v5 = getDetailedRowCardSectionFootnoteRichText(a1, 0);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v6 = [v5 formattedTextPieces];
      if ([v6 count])
      {
        double v7 = [v6 objectAtIndex:0];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v8 = [v7 text];
          float NumReviews = getNumReviews(v8);
        }
      }
    }
  }
  return NumReviews;
}

- (float)PRSRankingItemAdditions_epubBookNumReviews
{
  v2 = [a1 sectionBundleIdentifier];
  int v3 = [v2 isEqualToString:@"com.apple.parsec.itunes.epubBook"];

  float NumReviewsInParens = -1.0;
  if (v3)
  {
    v5 = getDetailedRowCardSectionDescriptionFormattedText(a1, 0, 4uLL, 0);
    v6 = v5;
    if (v5) {
      float NumReviewsInParens = getNumReviewsInParens(v5);
    }
  }
  return NumReviewsInParens;
}

- (float)PRSRankingItemAdditions_profileNumFollowers
{
  v2 = [a1 sectionBundleIdentifier];
  int v3 = [v2 isEqualToString:@"com.apple.parsec.profiles.profile"];

  float NumReviews = -1.0;
  if (v3)
  {
    v5 = getDetailedRowCardSection(a1, 0);
    v6 = v5;
    if (v5)
    {
      uint64_t v7 = [v5 footnote];
      if (v7)
      {
        v8 = (void *)v7;
        v9 = [v6 footnote];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
          v11 = [v6 footnote];
          v12 = [v11 text];

          if (v12)
          {
            if ([v12 length])
            {
              v13 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
              uint64_t v14 = [v12 rangeOfCharacterFromSet:v13];

              if (v14 != 0x7FFFFFFFFFFFFFFFLL)
              {
                v15 = [v12 substringToIndex:v14];
                float NumReviews = getNumReviews(v15);
              }
            }
          }
        }
      }
    }
  }
  return NumReviews;
}

- (float)PRSRankingItemAdditions_webVideoNumViews
{
  v2 = [a1 sectionBundleIdentifier];
  int v3 = [v2 isEqualToString:@"com.apple.parsec.web_video"];

  float NumReviews = -1.0;
  if (v3)
  {
    v5 = getDetailedRowCardSectionDescriptionRichTextText(a1, 0, 1uLL);
    v6 = v5;
    if (v5 && [v5 length])
    {
      uint64_t v7 = getSecondNumberStr(v6, 1);
      v8 = v7;
      if (v7 && [v7 length]) {
        float NumReviews = getNumReviews(v8);
      }
    }
  }
  return NumReviews;
}

- (float)PRSRankingItemAdditions_appStarRating
{
  v2 = [a1 sectionBundleIdentifier];
  int v3 = [v2 isEqualToString:@"com.apple.parsec.itunes.iosSoftware"];

  float v4 = -1.0;
  if (v3)
  {
    v5 = getDetailedRowCardSection(a1, 0);
    v6 = v5;
    if (v5)
    {
      uint64_t v7 = [v5 footnote];

      if (v7)
      {
        v8 = [v6 footnote];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v8 starRating];
          float v4 = v9;
        }
      }
    }
  }
  return v4;
}

- (float)PRSRankingItemAdditions_epubBookStarRating
{
  v2 = [a1 sectionBundleIdentifier];
  int v3 = [v2 isEqualToString:@"com.apple.parsec.itunes.epubBook"];

  float v4 = -1.0;
  if (v3)
  {
    v5 = getDetailedRowCardSectionDescriptionRichText(a1, 0, 4uLL);
    v6 = v5;
    if (v5)
    {
      [v5 starRating];
      float v4 = v7;
    }
  }
  return v4;
}

- (float)PRSRankingItemAdditions_podcastStarRating
{
  v2 = [a1 sectionBundleIdentifier];
  int v3 = [v2 isEqualToString:@"com.apple.parsec.itunes.podcast"];

  float v4 = -1.0;
  if (v3)
  {
    v5 = getDetailedRowCardSectionDescriptionRichText(a1, 0, 3uLL);
    v6 = v5;
    if (v5)
    {
      [v5 starRating];
      float v4 = v7;
    }
  }
  return v4;
}

- (float)PRSRankingItemAdditions_movieReviewRating
{
  v2 = [a1 sectionBundleIdentifier];
  int v3 = [v2 isEqualToString:@"com.apple.parsec.ondemandmovies.movie"];

  float ReviewRating = -1.0;
  if (v3)
  {
    v5 = getDetailedRowCardSectionDescriptionFormattedText(a1, 0, 0, 0);
    v6 = v5;
    if (v5) {
      float ReviewRating = getReviewRating(v5);
    }
  }
  return ReviewRating;
}

- (float)PRSRankingItemAdditions_movieStarRating
{
  objc_msgSend(a1, "PRSRankingItemAdditions_movieReviewRating");
  if (result != -1.0) {
    return result * 5.0;
  }
  return result;
}

- (float)PRSRankingItemAdditions_albumNumYearsAgo:()PRSRankingItemAdditions
{
  v2 = [a1 sectionBundleIdentifier];
  int v3 = [v2 isEqualToString:@"com.apple.parsec.itunes.album"];

  if (v3)
  {
    float v4 = getDetailedRowCardSectionDescriptionRichTextText(a1, 0, 0);
    v5 = v4;
    if (v4 && [v4 length])
    {
      v6 = getSuffixYearStr(v5);
      double v7 = v6;
      if (v6 && [v6 length])
      {
        uint64_t v8 = [v7 integerValue];

        if (v8 != -1)
        {
          float NumYearsAgo = getNumYearsAgo(v8);
LABEL_11:

          return NumYearsAgo;
        }
      }
      else
      {
      }
    }
    float NumYearsAgo = 2147500000.0;
    goto LABEL_11;
  }
  return 2147500000.0;
}

- (float)PRSRankingItemAdditions_songNumYearsAgo:()PRSRankingItemAdditions
{
  v2 = [a1 sectionBundleIdentifier];
  int v3 = [v2 isEqualToString:@"com.apple.parsec.itunes.song"];

  if (v3)
  {
    float v4 = getDetailedRowCardSectionDescriptionRichTextText(a1, 0, 1uLL);
    v5 = v4;
    if (v4 && [v4 length])
    {
      v6 = getSuffixYearStr(v5);
      double v7 = v6;
      if (v6 && [v6 length])
      {
        uint64_t v8 = [v7 integerValue];

        if (v8 != -1)
        {
          float NumYearsAgo = getNumYearsAgo(v8);
LABEL_11:

          return NumYearsAgo;
        }
      }
      else
      {
      }
    }
    float NumYearsAgo = 2147500000.0;
    goto LABEL_11;
  }
  return 2147500000.0;
}

- (float)PRSRankingItemAdditions_tvshowNumYearsAgo:()PRSRankingItemAdditions
{
  v2 = [a1 sectionBundleIdentifier];
  int v3 = [v2 isEqualToString:@"com.apple.parsec.tv.tvShow"];

  if (v3)
  {
    float v4 = getDetailedRowCardSectionDescriptionRichTextText(a1, 0, 1uLL);
    if (v4
      || (getDetailedRowCardSectionDescriptionRichTextText(a1, 0, 0),
          (float v4 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      if ([v4 length])
      {
        v5 = getSuffixYearStr(v4);
        v6 = v5;
        if (v5 && [v5 length])
        {
          uint64_t v7 = [v6 integerValue];

          if (v7 != -1)
          {
            float NumYearsAgo = getNumYearsAgo(v7);
LABEL_12:

            return NumYearsAgo;
          }
        }
        else
        {
        }
      }
    }
    float NumYearsAgo = 2147500000.0;
    goto LABEL_12;
  }
  return 2147500000.0;
}

- (float)PRSRankingItemAdditions_movieNumYearsAgo:()PRSRankingItemAdditions
{
  v2 = [a1 sectionBundleIdentifier];
  int v3 = [v2 isEqualToString:@"com.apple.parsec.ondemandmovies.movie"];

  if (v3)
  {
    float v4 = getDetailedRowCardSectionDescriptionRichTextText(a1, 0, 1uLL);
    v5 = v4;
    if (v4 && [v4 length])
    {
      v6 = getSecondNumberStr(v5, 0);
      uint64_t v7 = v6;
      if (v6 && [v6 length])
      {
        uint64_t v8 = [v7 integerValue];

        if (v8 != -1)
        {
          float NumYearsAgo = getNumYearsAgo(v8);
LABEL_11:

          return NumYearsAgo;
        }
      }
      else
      {
      }
    }
    float NumYearsAgo = 2147500000.0;
    goto LABEL_11;
  }
  return 2147500000.0;
}

- (float)PRSRankingItemAdditions_epubBookNumYearsAgo:()PRSRankingItemAdditions
{
  v2 = [a1 sectionBundleIdentifier];
  int v3 = [v2 isEqualToString:@"com.apple.parsec.itunes.epubBook"];

  if (!v3) {
    return 2147500000.0;
  }
  float v4 = getDetailedRowCardSectionDescriptionRichTextText(a1, 0, 2uLL);
  v5 = v4;
  if (v4 && [v4 length] && (uint64_t v6 = objc_msgSend(v5, "integerValue"), v6 != -1)) {
    float NumYearsAgo = getNumYearsAgo(v6);
  }
  else {
    float NumYearsAgo = 2147500000.0;
  }

  return NumYearsAgo;
}

- (float)PRSRankingItemAdditions_anyTophitMustBe
{
  int v1 = [a1 topHit];
  float result = 0.0;
  if (v1 == 2) {
    return 1.0;
  }
  return result;
}

- (float)PRSRankingItemAdditions_anyTophitNo
{
  int v1 = [a1 topHit];
  float result = 0.0;
  if (!v1) {
    return 1.0;
  }
  return result;
}

- (float)PRSRankingItemAdditions_webVideoNumYearsAgo:()PRSRankingItemAdditions
{
  v2 = [a1 sectionBundleIdentifier];
  int v3 = [v2 isEqualToString:@"com.apple.parsec.web_video"];

  if (v3)
  {
    float v4 = getDetailedRowCardSectionDescriptionRichTextText(a1, 0, 1uLL);
    v5 = v4;
    if (v4 && [v4 length])
    {
      uint64_t v6 = getPrefixYearStr(v5);
      uint64_t v7 = v6;
      if (v6 && [v6 length])
      {
        uint64_t v8 = [v7 integerValue];

        if (v8 != -1)
        {
          float NumYearsAgo = getNumYearsAgo(v8);
LABEL_11:

          return NumYearsAgo;
        }
      }
      else
      {
      }
    }
    float NumYearsAgo = 2147500000.0;
    goto LABEL_11;
  }
  return 2147500000.0;
}

- (id)PRSRankingItemAdditions_title
{
  v2 = [a1 sectionBundleIdentifier];
  if ([v2 isEqualToString:@"com.apple.parsec.itunes.album"]) {
    goto LABEL_20;
  }
  int v3 = [a1 sectionBundleIdentifier];
  if ([v3 isEqualToString:@"com.apple.parsec.itunes.artist"])
  {
LABEL_19:

LABEL_20:
LABEL_21:
    uint64_t v12 = getDetailedRowCardSectionTitle(a1);
LABEL_22:
    v13 = (void *)v12;
    goto LABEL_23;
  }
  float v4 = [a1 sectionBundleIdentifier];
  if ([v4 isEqualToString:@"com.apple.parsec.itunes.iosSoftware"])
  {
LABEL_18:

    goto LABEL_19;
  }
  v5 = [a1 sectionBundleIdentifier];
  if ([v5 isEqualToString:@"com.apple.parsec.bing"])
  {
LABEL_17:

    goto LABEL_18;
  }
  uint64_t v6 = [a1 sectionBundleIdentifier];
  if ([v6 isEqualToString:@"com.apple.parsec.itunes.epubBook"])
  {
LABEL_16:

    goto LABEL_17;
  }
  uint64_t v7 = [a1 sectionBundleIdentifier];
  if ([v7 isEqualToString:@"com.apple.parsec.flights"])
  {
LABEL_15:

    goto LABEL_16;
  }
  uint64_t v8 = [a1 sectionBundleIdentifier];
  if ([v8 isEqualToString:@"com.apple.parsec.news"])
  {
LABEL_14:

    goto LABEL_15;
  }
  double v9 = [a1 sectionBundleIdentifier];
  if ([v9 isEqualToString:@"com.apple.parsec.ondemandmovies.movie"])
  {
LABEL_13:

    goto LABEL_14;
  }
  v10 = [a1 sectionBundleIdentifier];
  if ([v10 isEqualToString:@"com.apple.parsec.itunes.podcast"])
  {
LABEL_12:

    goto LABEL_13;
  }
  v34 = v10;
  v11 = [a1 sectionBundleIdentifier];
  if ([v11 isEqualToString:@"com.apple.parsec.profiles.profile"])
  {

    v10 = v34;
    goto LABEL_12;
  }
  v33 = v11;
  v32 = [a1 sectionBundleIdentifier];
  if ([v32 isEqualToString:@"com.apple.parsec.itunes.song"])
  {
    char v15 = 1;
  }
  else
  {
    v31 = [a1 sectionBundleIdentifier];
    if ([v31 isEqualToString:@"com.apple.parsec.stocks"])
    {
      char v15 = 1;
    }
    else
    {
      v30 = [a1 sectionBundleIdentifier];
      if ([v30 isEqualToString:@"com.apple.parsec.tv.tvEpisode"])
      {
        char v15 = 1;
      }
      else
      {
        v29 = [a1 sectionBundleIdentifier];
        if ([v29 isEqualToString:@"com.apple.parsec.tv.tvShow"])
        {
          char v15 = 1;
        }
        else
        {
          v28 = [a1 sectionBundleIdentifier];
          if ([v28 isEqualToString:@"com.apple.parsec.hashtags.tweet"])
          {
            char v15 = 1;
          }
          else
          {
            v27 = [a1 sectionBundleIdentifier];
            if ([v27 isEqualToString:@"com.apple.parsec.web_index"])
            {
              char v15 = 1;
            }
            else
            {
              v26 = [a1 sectionBundleIdentifier];
              char v15 = [v26 isEqualToString:@"com.apple.parsec.web_video"];
            }
          }
        }
      }
    }
  }

  if (v15) {
    goto LABEL_21;
  }
  v16 = [a1 sectionBundleIdentifier];
  int v17 = [v16 isEqualToString:@"com.apple.parsec.kg"];

  if (v17)
  {
LABEL_46:
    uint64_t v12 = getRichTitleCardSectionTitle(a1);
    goto LABEL_22;
  }
  v18 = [a1 sectionBundleIdentifier];
  int v19 = [v18 isEqualToString:@"com.apple.parsec.maps"];

  if (v19)
  {
    uint64_t v12 = getResultTitle(a1);
    goto LABEL_22;
  }
  v20 = [a1 sectionBundleIdentifier];
  int v21 = [v20 isEqualToString:@"com.apple.parsec.sports"];

  if (v21)
  {
    v22 = getCardSection(a1, 0);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v23 = getScoreboardCardSectionTitle(a1, 0);
LABEL_59:
      v13 = (void *)v23;
      goto LABEL_60;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v13 = 0;
LABEL_60:

      goto LABEL_23;
    }
LABEL_58:
    uint64_t v23 = getDetailedRowCardSectionTitle(a1);
    goto LABEL_59;
  }
  v24 = [a1 sectionBundleIdentifier];
  int v25 = [v24 isEqualToString:@"com.apple.parsec.wiki"];

  if (!v25)
  {
    v22 = getCardSection(a1, 0);
    objc_opt_class();
    v13 = 0;
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_60;
    }
    goto LABEL_58;
  }
  v13 = getDetailedRowCardSectionTitle(a1);
  if (!v13) {
    goto LABEL_46;
  }
LABEL_23:
  return v13;
}

- (id)PRSRankingItemAdditions_description
{
  v2 = [a1 sectionBundleIdentifier];
  int v3 = [v2 isEqualToString:@"com.apple.parsec.itunes.epubBook"];

  if (v3) {
    goto LABEL_2;
  }
  v5 = [a1 sectionBundleIdentifier];
  int v6 = [v5 isEqualToString:@"com.apple.parsec.kg"];

  if (v6) {
    goto LABEL_4;
  }
  uint64_t v7 = [a1 sectionBundleIdentifier];
  int v8 = [v7 isEqualToString:@"com.apple.parsec.news"];

  if (v8)
  {
    float v4 = getDetailedRowCardSectionDescription(a1, 0);
    goto LABEL_11;
  }
  double v9 = [a1 sectionBundleIdentifier];
  if ([v9 isEqualToString:@"com.apple.parsec.profiles.profile"])
  {

LABEL_10:
    float v4 = getDetailedRowCardSectionDescriptionFormattedText(a1, 0, 0, 0);
    goto LABEL_11;
  }
  v10 = [a1 sectionBundleIdentifier];
  int v11 = [v10 isEqualToString:@"com.apple.parsec.stocks"];

  if (v11) {
    goto LABEL_10;
  }
  v13 = [a1 sectionBundleIdentifier];
  if ([v13 isEqualToString:@"com.apple.parsec.itunes.album"]) {
    goto LABEL_17;
  }
  uint64_t v14 = [a1 sectionBundleIdentifier];
  if ([v14 isEqualToString:@"com.apple.parsec.itunes.song"])
  {

LABEL_17:
LABEL_2:
    float v4 = getDetailedRowCardSectionDescriptionRichTextText(a1, 0, 0);
    goto LABEL_11;
  }
  char v15 = [a1 sectionBundleIdentifier];
  char v16 = [v15 isEqualToString:@"com.apple.parsec.web_video"];

  if (v16) {
    goto LABEL_2;
  }
  int v17 = [a1 sectionBundleIdentifier];
  if ([v17 isEqualToString:@"com.apple.parsec.web_index"])
  {

    goto LABEL_22;
  }
  v18 = [a1 sectionBundleIdentifier];
  int v19 = [v18 isEqualToString:@"com.apple.parsec.bing"];

  if (v19)
  {
LABEL_22:
    float v4 = getDetailedRowCardSectionDescriptionMultipleFormattedTexts(a1, 0, 1uLL, 0, 0);
    if (v4) {
      goto LABEL_11;
    }
    goto LABEL_25;
  }
  v20 = [a1 sectionBundleIdentifier];
  int v21 = [v20 isEqualToString:@"com.apple.parsec.hashtags.tweet"];

  if (v21)
  {
LABEL_25:
    float v4 = getDetailedRowCardSectionDescriptionMultipleFormattedTexts(a1, 0, 0, 0, 0);
    goto LABEL_11;
  }
  v22 = [a1 sectionBundleIdentifier];
  int v23 = [v22 isEqualToString:@"com.apple.parsec.wiki"];

  if (v23)
  {
    float v4 = getDetailedRowCardSectionDescriptionFormattedText(a1, 0, 0, 0);
    if (!v4)
    {
LABEL_4:
      float v4 = getDescriptionCardSectionDescription(a1, 1uLL);
    }
  }
  else
  {
    v24 = [a1 sectionBundleIdentifier];
    int v25 = [v24 isEqualToString:@"com.apple.parsec.ondemandmovies.movie"];

    if ((v25 & 1) == 0) {
      goto LABEL_22;
    }
    float v4 = 0;
  }
LABEL_11:
  return v4;
}

- (id)PRSRankingItemAdditions_url
{
  v2 = [a1 sectionBundleIdentifier];
  if ([v2 isEqualToString:@"com.apple.parsec.web_index"]) {
    goto LABEL_4;
  }
  int v3 = [a1 sectionBundleIdentifier];
  if ([v3 isEqualToString:@"com.apple.parsec.bing"])
  {

LABEL_4:
LABEL_5:
    float v4 = getDetailedRowCardSectionFootnoteText(a1, 0);
    goto LABEL_6;
  }
  int v6 = [a1 identifier];
  char v7 = [v6 hasPrefix:@"wi:http"];

  if (v7) {
    goto LABEL_5;
  }
  float v4 = 0;
LABEL_6:
  return v4;
}

@end