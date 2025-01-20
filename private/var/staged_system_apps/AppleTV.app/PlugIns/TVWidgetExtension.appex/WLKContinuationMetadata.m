@interface WLKContinuationMetadata
- (id)tvun_channelImageURLString:(BOOL *)a3;
- (id)tvun_punchoutURL;
- (id)tvun_punchoutURL:(BOOL)a3;
@end

@implementation WLKContinuationMetadata

- (id)tvun_channelImageURLString:(BOOL *)a3
{
  v4 = [(WLKContinuationMetadata *)self playable];
  v5 = [v4 channelDetails];

  v6 = [v5 images];
  v7 = [v6 artworkVariantOfType:10];

  v8 = [v5 images];
  v9 = [v8 artworkVariantOfType:18];

  if ([v5 isApSubscription] && v9)
  {
    v10 = [v9 artworkURLString];
    if (!a3) {
      goto LABEL_10;
    }
    BOOL v11 = 1;
LABEL_8:
    *a3 = v11;
    goto LABEL_10;
  }
  if (v7)
  {
    v10 = [v7 artworkURLString];
    if (!a3) {
      goto LABEL_10;
    }
    BOOL v11 = 0;
    goto LABEL_8;
  }
  v10 = 0;
LABEL_10:

  return v10;
}

- (id)tvun_punchoutURL
{
  return [(WLKContinuationMetadata *)self tvun_punchoutURL:1];
}

- (id)tvun_punchoutURL:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(WLKContinuationMetadata *)self playable];
  v6 = [v5 playPunchoutURL];
  v7 = [(WLKContinuationMetadata *)self playable];
  v8 = [v7 channelDetails];

  if ([v5 isiTunes]) {
    char v9 = 0;
  }
  else {
    char v9 = [v8 isApSubscription] ^ 1;
  }
  v10 = [v5 tvAppDeeplinkURL];
  BOOL v11 = v10;
  if (!v10 || (v9 & 1) != 0)
  {
  }
  else
  {
    unsigned int v12 = [v5 isEntitled];

    if (v12)
    {
      v13 = [v5 tvAppDeeplinkURL];
      v14 = +[WLKPlayableUtilities _punchoutURLForDirectPlayback:v13 ignoreExtras:1];

      goto LABEL_16;
    }
  }
  if (v3
    && [v5 isEntitled]
    && [v5 isAppInstalled]
    && [v6 length])
  {
    uint64_t v15 = +[NSURL URLWithString:v6];
  }
  else
  {
    uint64_t v15 = [(WLKContinuationMetadata *)self contentTVAppDeeplinkURL];
  }
  v14 = (void *)v15;
LABEL_16:

  return v14;
}

@end