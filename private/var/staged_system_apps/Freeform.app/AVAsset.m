@interface AVAsset
+ (id)crl_codecTypesForProRes;
+ (id)crl_containsHDRContentKeys;
+ (id)crl_creatorArtistOrAuthorWithMetadataArray:(id)a3;
+ (id)crl_playableKeysWithKeys:(id)a3;
+ (id)crl_titleWithMetadataArray:(id)a3;
+ (id)keyPathsForValuesAffectingNaturalSizeWithPreferredTransforms;
+ (id)keyPathsForValuesAffectingTsu_isPlayable;
- (BOOL)crl_containsAudioTracks;
- (BOOL)crl_containsHDRContent;
- (BOOL)crl_containsTracksWithVisualCharacteristics;
- (BOOL)crl_containsVideoTracks;
- (BOOL)p_doesTrack:(id)a3 matchCodecTypes:(id)a4;
- (CGSize)naturalSizeWithPreferredTransforms;
- (id)crl_creatorArtistOrAuthor;
- (id)crl_firstTrackWithMediaType:(id)a3;
- (id)crl_title;
- (void)crl_loadValuesAsynchronouslyForKeys:(id)a3 completionQueue:(id)a4 completionHandler:(id)a5;
@end

@implementation AVAsset

- (CGSize)naturalSizeWithPreferredTransforms
{
  CGFloat width = CGRectZero.size.width;
  CGFloat height = CGRectZero.size.height;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v4 = [(AVAsset *)self tracksWithMediaType:AVMediaTypeVideo];
  id v5 = [v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v5)
  {
    id v6 = v5;
    CGFloat x = CGRectZero.origin.x;
    CGFloat y = CGRectZero.origin.y;
    uint64_t v9 = *(void *)v20;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v4);
        }
        v11 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        if (objc_msgSend(v11, "isEnabled", *(_OWORD *)&v18.a, *(_OWORD *)&v18.c, *(_OWORD *)&v18.tx))
        {
          [v11 naturalSize];
          CGFloat v13 = v12;
          CGFloat v15 = v14;
          if (v11) {
            [v11 preferredTransform];
          }
          else {
            memset(&v18, 0, sizeof(v18));
          }
          v25.origin.CGFloat x = 0.0;
          v25.origin.CGFloat y = 0.0;
          v25.size.CGFloat width = v13;
          v25.size.CGFloat height = v15;
          CGRect v28 = CGRectApplyAffineTransform(v25, &v18);
          v26.origin.CGFloat x = x;
          v26.origin.CGFloat y = y;
          v26.size.CGFloat width = width;
          v26.size.CGFloat height = height;
          CGRect v27 = CGRectUnion(v26, v28);
          CGFloat x = v27.origin.x;
          CGFloat y = v27.origin.y;
          CGFloat width = v27.size.width;
          CGFloat height = v27.size.height;
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v6);
  }

  double v16 = width;
  double v17 = height;
  result.CGFloat height = v17;
  result.CGFloat width = v16;
  return result;
}

+ (id)keyPathsForValuesAffectingNaturalSizeWithPreferredTransforms
{
  return +[NSSet setWithObject:@"tracks"];
}

+ (id)crl_playableKeysWithKeys:(id)a3
{
  return [&off_10155CED8 crl_arrayByAddingNonContainedObjectsFromArray:a3];
}

+ (id)crl_codecTypesForProRes
{
  return &off_10155CEF0;
}

+ (id)keyPathsForValuesAffectingTsu_isPlayable
{
  v2 = [a1 crl_playableKeysWithKeys:&__NSArray0__struct];
  v3 = +[NSSet setWithArray:v2];

  return v3;
}

- (BOOL)p_doesTrack:(id)a3 matchCodecTypes:(id)a4
{
  id v5 = a4;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = [a3 formatDescriptions];
  id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v6);
        }
        v10 = +[NSNumber numberWithUnsignedInt:CMFormatDescriptionGetMediaSubType(*(CMFormatDescriptionRef *)(*((void *)&v13 + 1) + 8 * i))];
        unsigned __int8 v11 = [v5 containsObject:v10];

        if (v11)
        {
          LOBYTE(v7) = 1;
          goto LABEL_11;
        }
      }
      id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (char)v7;
}

- (void)crl_loadValuesAsynchronouslyForKeys:(id)a3 completionQueue:(id)a4 completionHandler:(id)a5
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10036F5B4;
  v10[3] = &unk_1014CAE00;
  id v11 = a4;
  id v12 = a5;
  id v8 = v11;
  id v9 = v12;
  [(AVAsset *)self loadValuesAsynchronouslyForKeys:a3 completionHandler:v10];
}

- (BOOL)crl_containsHDRContent
{
  v2 = [(AVAsset *)self tracksWithMediaCharacteristic:AVMediaCharacteristicContainsHDRVideo];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

+ (id)crl_containsHDRContentKeys
{
  return &off_10155CF08;
}

- (BOOL)crl_containsVideoTracks
{
  v2 = [(AVAsset *)self crl_firstTrackWithMediaType:AVMediaTypeVideo];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)crl_containsAudioTracks
{
  v2 = [(AVAsset *)self crl_firstTrackWithMediaType:AVMediaTypeAudio];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)crl_containsTracksWithVisualCharacteristics
{
  [(AVAsset *)self tracksWithMediaCharacteristic:AVMediaCharacteristicVisual];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        if (objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * i), "isEnabled", (void)v9))
        {
          BOOL v7 = 0;
          goto LABEL_11;
        }
      }
      id v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  BOOL v7 = 1;
LABEL_11:

  return v7;
}

- (id)crl_firstTrackWithMediaType:(id)a3
{
  [(AVAsset *)self tracksWithMediaType:a3];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v3);
        }
        BOOL v7 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        if (objc_msgSend(v7, "isEnabled", (void)v9))
        {
          id v4 = v7;
          goto LABEL_11;
        }
      }
      id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v4;
}

- (id)crl_creatorArtistOrAuthor
{
  id v2 = [(AVAsset *)self metadata];
  id v3 = +[AVAsset crl_creatorArtistOrAuthorWithMetadataArray:v2];

  return v3;
}

+ (id)crl_creatorArtistOrAuthorWithMetadataArray:(id)a3
{
  id v3 = a3;
  v18[0] = AVMetadataCommonIdentifierCreator;
  v18[1] = AVMetadataCommonIdentifierArtist;
  v18[2] = AVMetadataCommonIdentifierAuthor;
  v18[3] = @"caaf/info-author";
  v18[4] = AVMetadataIdentifierQuickTimeUserDataArtist;
  v18[5] = AVMetadataIdentifierQuickTimeUserDataAuthor;
  v18[6] = AVMetadataIdentifierQuickTimeUserDataComposer;
  v18[7] = AVMetadataIdentifierQuickTimeUserDataDirector;
  v18[8] = AVMetadataIdentifierQuickTimeUserDataOriginalArtist;
  v18[9] = AVMetadataIdentifier3GPUserDataAuthor;
  v18[10] = AVMetadataIdentifier3GPUserDataPerformer;
  v18[11] = AVMetadataIdentifierQuickTimeMetadataAuthor;
  v18[12] = AVMetadataIdentifierQuickTimeMetadataDirector;
  v18[13] = AVMetadataIdentifierQuickTimeMetadataArtist;
  v18[14] = AVMetadataIdentifierQuickTimeMetadataArranger;
  v18[15] = AVMetadataIdentifierQuickTimeMetadataOriginalArtist;
  v18[16] = AVMetadataIdentifierQuickTimeMetadataPerformer;
  v18[17] = AVMetadataIdentifierQuickTimeMetadataComposer;
  +[NSArray arrayWithObjects:v18 count:18];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v14;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v14 != v7) {
        objc_enumerationMutation(v4);
      }
      long long v9 = +[AVMetadataItem metadataItemsFromArray:filteredByIdentifier:](AVMetadataItem, "metadataItemsFromArray:filteredByIdentifier:", v3, *(void *)(*((void *)&v13 + 1) + 8 * v8), (void)v13);
      long long v10 = [v9 firstObject];

      if (v10) {
        break;
      }
      if (v6 == (id)++v8)
      {
        id v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v6) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    long long v10 = 0;
  }

  long long v11 = [v10 stringValue];

  return v11;
}

- (id)crl_title
{
  id v2 = [(AVAsset *)self metadata];
  id v3 = +[AVAsset crl_titleWithMetadataArray:v2];

  return v3;
}

+ (id)crl_titleWithMetadataArray:(id)a3
{
  id v3 = a3;
  v18[0] = AVMetadataCommonIdentifierTitle;
  v18[1] = @"caaf/info-title";
  v18[2] = AVMetadataCommonIdentifierAlbumName;
  v18[3] = @"caaf/info-parent_title";
  v18[4] = AVMetadataIdentifierQuickTimeUserDataTrackName;
  v18[5] = AVMetadataIdentifier3GPUserDataTitle;
  v18[6] = AVMetadataIdentifier3GPUserDataAlbumAndTrack;
  v18[7] = AVMetadataIdentifierQuickTimeMetadataDisplayName;
  v18[8] = AVMetadataIdentifierQuickTimeMetadataAlbum;
  v18[9] = AVMetadataIdentifierQuickTimeMetadataTitle;
  +[NSArray arrayWithObjects:v18 count:10];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v14;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v14 != v7) {
        objc_enumerationMutation(v4);
      }
      long long v9 = +[AVMetadataItem metadataItemsFromArray:filteredByIdentifier:](AVMetadataItem, "metadataItemsFromArray:filteredByIdentifier:", v3, *(void *)(*((void *)&v13 + 1) + 8 * v8), (void)v13);
      long long v10 = [v9 firstObject];

      if (v10) {
        break;
      }
      if (v6 == (id)++v8)
      {
        id v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v6) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    long long v10 = 0;
  }

  long long v11 = [v10 stringValue];

  return v11;
}

@end