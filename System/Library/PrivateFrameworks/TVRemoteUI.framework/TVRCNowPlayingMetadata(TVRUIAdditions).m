@interface TVRCNowPlayingMetadata(TVRUIAdditions)
- (BOOL)tvrui_isTVEpisode;
- (__CFString)tvrui_secondaryTitle;
- (id)metadataMergedFromTVRCMediaInfo:()TVRUIAdditions;
- (id)tvrui_localizedTitleWithFormatString:()TVRUIAdditions;
- (uint64_t)_nowPlayingKindForMediaInfoKind:()TVRUIAdditions;
@end

@implementation TVRCNowPlayingMetadata(TVRUIAdditions)

- (BOOL)tvrui_isTVEpisode
{
  v2 = [a1 episodeNumber];
  if (v2)
  {
    v3 = [a1 seasonNumber];
    if (v3)
    {
      v4 = [a1 episodeTitle];
      BOOL v5 = [v4 length] != 0;
    }
    else
    {
      BOOL v5 = 0;
    }
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (id)tvrui_localizedTitleWithFormatString:()TVRUIAdditions
{
  id v4 = a3;
  if (objc_msgSend(a1, "tvrui_isTVEpisode"))
  {
    BOOL v5 = [v4 componentsSeparatedByString:@"%@"];
    if ((unint64_t)[v5 count] < 4) {
      v6 = @"S%@, E%@ • %@";
    }
    else {
      v6 = (__CFString *)v4;
    }

    v8 = NSString;
    v9 = [a1 seasonNumber];
    v10 = [a1 episodeNumber];
    v11 = [a1 episodeTitle];
    v7 = objc_msgSend(v8, "stringWithFormat:", v6, v9, v10, v11);
  }
  else
  {
    v7 = [a1 title];
  }

  return v7;
}

- (__CFString)tvrui_secondaryTitle
{
  if (objc_msgSend(a1, "tvrui_isTVEpisode"))
  {
    v2 = [a1 title];
  }
  else
  {
    v2 = &stru_26DB4CAE0;
  }
  return v2;
}

- (id)metadataMergedFromTVRCMediaInfo:()TVRUIAdditions
{
  id v4 = a3;
  BOOL v5 = (void *)[a1 copy];
  uint64_t v6 = [v4 kind];
  v7 = [v4 title];

  if (v6 != 1)
  {
    if (!v7) {
      goto LABEL_9;
    }
    uint64_t v10 = [v4 title];
    goto LABEL_8;
  }
  if (v7)
  {
    v8 = [v4 title];
    [v5 setEpisodeTitle:v8];
  }
  v9 = [v4 showTitle];

  if (v9)
  {
    uint64_t v10 = [v4 showTitle];
LABEL_8:
    v11 = (void *)v10;
    [v5 setTitle:v10];
  }
LABEL_9:
  v12 = [v4 genre];

  if (v12)
  {
    v13 = [v4 genre];
    [v5 setGenre:v13];
  }
  v14 = [v5 duration];
  if (!v14)
  {
    v15 = [v4 duration];

    if (!v15) {
      goto LABEL_15;
    }
    v14 = [v4 duration];
    [v5 setDuration:v14];
  }

LABEL_15:
  v16 = [v5 showID];
  if (!v16)
  {
    v17 = [v4 showIdentifier];

    if (!v17) {
      goto LABEL_19;
    }
    v16 = [v4 showIdentifier];
    [v5 setShowID:v16];
  }

LABEL_19:
  v18 = [v5 seasonNumber];
  if (!v18)
  {
    v19 = [v4 seasonNumber];

    if (!v19) {
      goto LABEL_23;
    }
    v18 = [v4 seasonNumber];
    [v5 setSeasonNumber:v18];
  }

LABEL_23:
  v20 = [v5 episodeNumber];
  if (!v20)
  {
    v21 = [v4 episodeNumber];

    if (!v21) {
      goto LABEL_27;
    }
    v20 = [v4 episodeNumber];
    [v5 setEpisodeNumber:v20];
  }

LABEL_27:
  v22 = [v5 ratingDescription];
  if (!v22)
  {
    v23 = [v4 ratingDescription];

    if (!v23) {
      goto LABEL_31;
    }
    v22 = [v4 ratingDescription];
    [v5 setRatingDescription:v22];
  }

LABEL_31:
  v24 = [v5 extendedDescription];
  if (!v24)
  {
    v25 = [v4 extendedDescription];

    if (!v25) {
      goto LABEL_35;
    }
    v24 = [v4 extendedDescription];
    [v5 setExtendedDescription:v24];
  }

LABEL_35:
  v26 = [v5 productPageURL];
  if (!v26)
  {
    v27 = [v4 productURL];

    if (!v27) {
      goto LABEL_39;
    }
    v26 = [v4 productURL];
    [v5 setProductPageURL:v26];
  }

LABEL_39:
  v28 = [v5 showProductPageURL];
  if (!v28)
  {
    v29 = [v4 showURL];

    if (!v29) {
      goto LABEL_43;
    }
    v28 = [v4 showURL];
    [v5 setShowProductPageURL:v28];
  }

LABEL_43:
  v30 = [v5 releaseDate];
  if (!v30)
  {
    v31 = [v4 releaseDate];

    if (!v31) {
      goto LABEL_47;
    }
    v30 = [v4 releaseDate];
    [v5 setReleaseDate:v30];
  }

LABEL_47:
  v32 = [v5 rottenTomatoesReview];
  if (!v32)
  {
    v33 = [v4 rottenTomatoesReview];

    if (!v33) {
      goto LABEL_51;
    }
    v32 = [v4 rottenTomatoesReview];
    v34 = (void *)[v32 copy];
    [v5 setRottenTomatoesReview:v34];
  }
LABEL_51:
  objc_msgSend(v5, "setIsAppleOriginal:", objc_msgSend(v4, "isAppleOriginal"));
  objc_msgSend(v5, "setKind:", objc_msgSend(a1, "_nowPlayingKindForMediaInfoKind:", objc_msgSend(v4, "kind")));
  v35 = [v4 imageURLTemplate];
  [v5 setImageURLTemplate:v35];

  return v5;
}

- (uint64_t)_nowPlayingKindForMediaInfoKind:()TVRUIAdditions
{
  if ((unint64_t)(a3 - 1) > 4) {
    return 0;
  }
  else {
    return qword_2273F40A0[a3 - 1];
  }
}

@end