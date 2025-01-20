@interface VUIGroupWatchActivityPreviewMetadata
+ (id)metadataFromSerializedData:(id)a3;
- (BOOL)allowsSceneAssociation;
- (CGImage)artworkImage;
- (NSNumber)episodeNumber;
- (NSNumber)seasonNumber;
- (NSString)imageUrlFormat;
- (NSString)seasonTitle;
- (NSString)title;
- (NSURL)fallbackUrl;
- (TVImageProxy)imageProxy;
- (VUIGroupWatchActivityPreviewMetadata)initWithContextData:(id)a3;
- (VUIGroupWatchActivityPreviewMetadata)initWithMediaItem:(id)a3 fallbackUrl:(id)a4;
- (VUIGroupWatchActivityPreviewMetadata)initWithPlayable:(id)a3 fallbackUrl:(id)a4;
- (VUIGroupWatchActivityPreviewMetadata)initWithTitle:(id)a3 showTitle:(id)a4 seasonTitle:(id)a5 seasonNumber:(id)a6 episodeNumber:(id)a7 imageUrlFormat:(id)a8 artworkImage:(CGImage *)a9 fallbackUrl:(id)a10 isTVShow:(BOOL)a11 allowsSceneAssociation:(BOOL)a12;
- (VUIGroupWatchActivityPreviewMetadata)initWithTitle:(id)a3 subtitle:(id)a4 imageUrlFormat:(id)a5 artworkImage:(CGImage *)a6 fallbackUrl:(id)a7 allowsSceneAssociation:(BOOL)a8;
- (id)localizedSubtitleForSeasonNumber:(id)a3 episodeNumber:(id)a4;
- (id)serializedDataWithSeasonTitlesEnabled:(BOOL)a3;
- (id)subtitleWithSeasonTitlesEnabled:(BOOL)a3;
- (void)setEpisodeNumber:(id)a3;
- (void)setSeasonNumber:(id)a3;
- (void)setSeasonTitle:(id)a3;
@end

@implementation VUIGroupWatchActivityPreviewMetadata

- (VUIGroupWatchActivityPreviewMetadata)initWithTitle:(id)a3 subtitle:(id)a4 imageUrlFormat:(id)a5 artworkImage:(CGImage *)a6 fallbackUrl:(id)a7 allowsSceneAssociation:(BOOL)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  v22.receiver = self;
  v22.super_class = (Class)VUIGroupWatchActivityPreviewMetadata;
  v18 = [(VUIGroupWatchActivityPreviewMetadata *)&v22 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_title, a3);
    objc_storeStrong((id *)&v19->_seasonTitle, a4);
    objc_storeStrong((id *)&v19->_imageUrlFormat, a5);
    v19->_artworkImage = a6;
    objc_storeStrong((id *)&v19->_fallbackUrl, a7);
    v19->_allowsSceneAssociation = a8;
  }

  return v19;
}

- (VUIGroupWatchActivityPreviewMetadata)initWithContextData:(id)a3
{
  id v3 = a3;
  v4 = objc_msgSend(v3, "vui_stringForKey:", @"title");
  v5 = objc_msgSend(v3, "vui_stringForKey:", @"showTitle");
  v6 = objc_msgSend(v3, "vui_stringForKey:", @"seasonTitle");
  v7 = objc_msgSend(v3, "vui_numberForKey:", @"seasonNumber");
  v8 = objc_msgSend(v3, "vui_numberForKey:", @"episodeNumber");
  v9 = objc_msgSend(v3, "vui_stringForKey:", @"imageUrlFormat");
  v10 = objc_msgSend(v3, "vui_URLForKey:", @"fallbackUrl");
  char v11 = objc_msgSend(v3, "vui_BOOLForKey:defaultValue:", @"isTVShow", 0);
  char v12 = objc_msgSend(v3, "vui_BOOLForKey:defaultValue:", @"allowsSceneAssociation", 1);

  BYTE1(v15) = v12;
  LOBYTE(v15) = v11;
  v13 = -[VUIGroupWatchActivityPreviewMetadata initWithTitle:showTitle:seasonTitle:seasonNumber:episodeNumber:imageUrlFormat:artworkImage:fallbackUrl:isTVShow:allowsSceneAssociation:](self, "initWithTitle:showTitle:seasonTitle:seasonNumber:episodeNumber:imageUrlFormat:artworkImage:fallbackUrl:isTVShow:allowsSceneAssociation:", v4, v5, v6, v7, v8, v9, 0, v10, v15);

  return v13;
}

- (VUIGroupWatchActivityPreviewMetadata)initWithPlayable:(id)a3 fallbackUrl:(id)a4
{
  id v5 = a3;
  id v24 = a4;
  v6 = [v5 metadata];
  if ([v6 contentType] == 3)
  {
    BOOL v7 = 1;
  }
  else
  {
    v8 = [v5 metadata];
    if ([v8 contentType] == 1)
    {
      BOOL v7 = 1;
    }
    else
    {
      v9 = [v5 metadata];
      BOOL v7 = [v9 contentType] == 4;
    }
  }

  v25 = [v5 metadata];
  v27 = [v25 title];
  v23 = [v5 metadata];
  v10 = [v23 showTitle];
  objc_super v22 = [v5 metadata];
  char v11 = [v22 seasonTitle];
  v21 = [v5 metadata];
  char v12 = [v21 seasonNumber];
  v13 = [v5 metadata];
  id v14 = [v13 episodeNumber];
  uint64_t v15 = [v5 metadata];
  id v16 = [v15 artworkURLFormat];
  id v17 = [v5 playbackModes];
  BYTE1(v20) = [v17 containsObject:@"Immersive"] ^ 1;
  LOBYTE(v20) = v7;
  v18 = -[VUIGroupWatchActivityPreviewMetadata initWithTitle:showTitle:seasonTitle:seasonNumber:episodeNumber:imageUrlFormat:artworkImage:fallbackUrl:isTVShow:allowsSceneAssociation:](self, "initWithTitle:showTitle:seasonTitle:seasonNumber:episodeNumber:imageUrlFormat:artworkImage:fallbackUrl:isTVShow:allowsSceneAssociation:", v27, v10, v11, v12, v14, v16, 0, v24, v20);

  return v18;
}

- (VUIGroupWatchActivityPreviewMetadata)initWithMediaItem:(id)a3 fallbackUrl:(id)a4
{
  uint64_t v6 = *MEMORY[0x1E4FA9DF8];
  id v7 = a4;
  id v8 = a3;
  v9 = [v8 mediaItemMetadataForProperty:v6];
  imageProxy = self->_imageProxy;
  self->_imageProxy = v9;

  char v11 = [v8 mediaItemMetadataForProperty:*MEMORY[0x1E4FAA0E8]];
  char v12 = [v8 mediaItemMetadataForProperty:*MEMORY[0x1E4FAA068]];
  v13 = [v8 mediaItemMetadataForProperty:*MEMORY[0x1E4FAA060]];
  id v14 = [v8 mediaItemMetadataForProperty:*MEMORY[0x1E4FA9EC0]];
  uint64_t v15 = [v8 mediaItemMetadataForProperty:*MEMORY[0x1E4FA9E00]];
  id v16 = [v8 mediaItemMetadataForProperty:*MEMORY[0x1E4FA9FB0]];

  BYTE1(v19) = 1;
  LOBYTE(v19) = [v16 isEqualToString:*MEMORY[0x1E4FAA200]];
  id v17 = -[VUIGroupWatchActivityPreviewMetadata initWithTitle:showTitle:seasonTitle:seasonNumber:episodeNumber:imageUrlFormat:artworkImage:fallbackUrl:isTVShow:allowsSceneAssociation:](self, "initWithTitle:showTitle:seasonTitle:seasonNumber:episodeNumber:imageUrlFormat:artworkImage:fallbackUrl:isTVShow:allowsSceneAssociation:", v11, v12, 0, v13, v14, v15, 0, v7, v19);

  return v17;
}

- (VUIGroupWatchActivityPreviewMetadata)initWithTitle:(id)a3 showTitle:(id)a4 seasonTitle:(id)a5 seasonNumber:(id)a6 episodeNumber:(id)a7 imageUrlFormat:(id)a8 artworkImage:(CGImage *)a9 fallbackUrl:(id)a10 isTVShow:(BOOL)a11 allowsSceneAssociation:(BOOL)a12
{
  id v31 = a3;
  id v30 = a4;
  id v29 = a5;
  id v28 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = a10;
  v32.receiver = self;
  v32.super_class = (Class)VUIGroupWatchActivityPreviewMetadata;
  v21 = [(VUIGroupWatchActivityPreviewMetadata *)&v32 init];
  objc_super v22 = v21;
  if (v21)
  {
    p_title = (void **)&v21->_title;
    if (a11)
    {
      objc_storeStrong((id *)&v21->_title, a4);
      objc_storeStrong((id *)&v22->_seasonTitle, a5);
      objc_storeStrong((id *)&v22->_seasonNumber, a6);
      p_title = (void **)&v22->_episodeNumber;
      id v24 = v18;
    }
    else
    {
      id v24 = v31;
    }
    id v25 = v24;
    v26 = *p_title;
    *p_title = v25;

    objc_storeStrong((id *)&v22->_imageUrlFormat, a8);
    v22->_artworkImage = a9;
    objc_storeStrong((id *)&v22->_fallbackUrl, a10);
    v22->_allowsSceneAssociation = a12;
  }

  return v22;
}

- (id)subtitleWithSeasonTitlesEnabled:(BOOL)a3
{
  if (!a3
    && ([(VUIGroupWatchActivityPreviewMetadata *)self seasonNumber],
        (uint64_t v4 = objc_claimAutoreleasedReturnValue()) != 0)
    && (id v5 = (void *)v4,
        [(VUIGroupWatchActivityPreviewMetadata *)self episodeNumber],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        v6,
        v5,
        v6))
  {
    id v7 = [(VUIGroupWatchActivityPreviewMetadata *)self seasonNumber];
    id v8 = [(VUIGroupWatchActivityPreviewMetadata *)self episodeNumber];
    v9 = [(VUIGroupWatchActivityPreviewMetadata *)self localizedSubtitleForSeasonNumber:v7 episodeNumber:v8];
  }
  else
  {
    v9 = [(VUIGroupWatchActivityPreviewMetadata *)self seasonTitle];
  }
  return v9;
}

- (id)localizedSubtitleForSeasonNumber:(id)a3 episodeNumber:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[VUILocalizationManager sharedInstance];
  id v8 = [v7 localizedStringForKey:@"TV.SeasonEpisode.Abbreviated"];
  v9 = objc_msgSend(v6, "vui_languageAwareDescription");

  v10 = [v8 stringByReplacingOccurrencesOfString:@"@@seasonNumber@@" withString:v9];
  char v11 = objc_msgSend(v5, "vui_languageAwareDescription");

  char v12 = [v10 stringByReplacingOccurrencesOfString:@"@@episodeNumber@@" withString:v11];

  return v12;
}

- (id)serializedDataWithSeasonTitlesEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [MEMORY[0x1E4F1CA60] dictionary];
  id v6 = [(VUIGroupWatchActivityPreviewMetadata *)self title];
  objc_msgSend(v5, "vui_setObjectIfNotNil:forKey:", v6, @"title");

  id v7 = [(VUIGroupWatchActivityPreviewMetadata *)self subtitleWithSeasonTitlesEnabled:v3];
  objc_msgSend(v5, "vui_setObjectIfNotNil:forKey:", v7, @"subtitle");

  id v8 = [(VUIGroupWatchActivityPreviewMetadata *)self imageUrlFormat];
  objc_msgSend(v5, "vui_setObjectIfNotNil:forKey:", v8, @"imageUrlFormat");

  v9 = [(VUIGroupWatchActivityPreviewMetadata *)self fallbackUrl];
  v10 = [v9 absoluteString];
  objc_msgSend(v5, "vui_setObjectIfNotNil:forKey:", v10, @"fallbackUrl");

  char v11 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[VUIGroupWatchActivityPreviewMetadata allowsSceneAssociation](self, "allowsSceneAssociation"));
  [v5 setObject:v11 forKey:@"allowsSceneAssociation"];

  uint64_t v14 = 0;
  char v12 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v5 options:0 error:&v14];

  return v12;
}

+ (id)metadataFromSerializedData:(id)a3
{
  uint64_t v10 = 0;
  BOOL v3 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v10];
  uint64_t v4 = objc_msgSend(v3, "vui_stringForKey:", @"title");
  id v5 = objc_msgSend(v3, "vui_stringForKey:", @"subtitle");
  id v6 = objc_msgSend(v3, "vui_stringForKey:", @"imageUrlFormat");
  id v7 = objc_msgSend(v3, "vui_URLForKey:", @"fallbackUrl");
  id v8 = -[VUIGroupWatchActivityPreviewMetadata initWithTitle:subtitle:imageUrlFormat:artworkImage:fallbackUrl:allowsSceneAssociation:]([VUIGroupWatchActivityPreviewMetadata alloc], "initWithTitle:subtitle:imageUrlFormat:artworkImage:fallbackUrl:allowsSceneAssociation:", v4, v5, v6, 0, v7, objc_msgSend(v3, "vui_BOOLForKey:defaultValue:", @"allowsSceneAssociation", 1));

  return v8;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)imageUrlFormat
{
  return self->_imageUrlFormat;
}

- (TVImageProxy)imageProxy
{
  return self->_imageProxy;
}

- (BOOL)allowsSceneAssociation
{
  return self->_allowsSceneAssociation;
}

- (CGImage)artworkImage
{
  return self->_artworkImage;
}

- (NSURL)fallbackUrl
{
  return self->_fallbackUrl;
}

- (NSString)seasonTitle
{
  return self->_seasonTitle;
}

- (void)setSeasonTitle:(id)a3
{
}

- (NSNumber)seasonNumber
{
  return self->_seasonNumber;
}

- (void)setSeasonNumber:(id)a3
{
}

- (NSNumber)episodeNumber
{
  return self->_episodeNumber;
}

- (void)setEpisodeNumber:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_episodeNumber, 0);
  objc_storeStrong((id *)&self->_seasonNumber, 0);
  objc_storeStrong((id *)&self->_seasonTitle, 0);
  objc_storeStrong((id *)&self->_fallbackUrl, 0);
  objc_storeStrong((id *)&self->_imageProxy, 0);
  objc_storeStrong((id *)&self->_imageUrlFormat, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end