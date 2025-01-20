@interface MOSuggestionAssetMediaItem
+ (BOOL)supportsSecureCoding;
- (MOSuggestionAssetMediaItem)initWithCoder:(id)a3;
- (NSString)albumTitle;
- (NSString)artistName;
- (NSString)title;
- (NSString)trackIdentifier;
- (NSURL)imageURL;
- (NSURL)previewURL;
- (UIColor)bgColor;
- (UIImage)albumArt;
- (id)initTitle:(id)a3 albumTitle:(id)a4 artistName:(id)a5 albumArt:(id)a6 trackIdentifier:(id)a7 previewURL:(id)a8 mediaType:(unint64_t)a9;
- (id)initTitle:(id)a3 albumTitle:(id)a4 artistName:(id)a5 albumArt:(id)a6 trackIdentifier:(id)a7 previewURL:(id)a8 mediaType:(unint64_t)a9 imageURL:(id)a10;
- (id)initTitle:(id)a3 albumTitle:(id)a4 artistName:(id)a5 albumArt:(id)a6 trackIdentifier:(id)a7 previewURL:(id)a8 mediaType:(unint64_t)a9 imageURL:(id)a10 bgColor:(id)a11 bgColorVariant:(unint64_t)a12;
- (unint64_t)bgColorVariant;
- (unint64_t)mediaType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MOSuggestionAssetMediaItem

- (id)initTitle:(id)a3 albumTitle:(id)a4 artistName:(id)a5 albumArt:(id)a6 trackIdentifier:(id)a7 previewURL:(id)a8 mediaType:(unint64_t)a9
{
  return [(MOSuggestionAssetMediaItem *)self initTitle:a3 albumTitle:a4 artistName:a5 albumArt:a6 trackIdentifier:a7 previewURL:a8 mediaType:a9 imageURL:0];
}

- (id)initTitle:(id)a3 albumTitle:(id)a4 artistName:(id)a5 albumArt:(id)a6 trackIdentifier:(id)a7 previewURL:(id)a8 mediaType:(unint64_t)a9 imageURL:(id)a10
{
  return [(MOSuggestionAssetMediaItem *)self initTitle:a3 albumTitle:a4 artistName:a5 albumArt:a6 trackIdentifier:a7 previewURL:a8 mediaType:a9 imageURL:a10 bgColor:0 bgColorVariant:0];
}

- (id)initTitle:(id)a3 albumTitle:(id)a4 artistName:(id)a5 albumArt:(id)a6 trackIdentifier:(id)a7 previewURL:(id)a8 mediaType:(unint64_t)a9 imageURL:(id)a10 bgColor:(id)a11 bgColorVariant:(unint64_t)a12
{
  id v30 = a3;
  id v19 = a4;
  id v29 = a5;
  id v20 = a5;
  id v32 = a6;
  id v27 = a7;
  id v31 = a7;
  id v28 = a8;
  id v21 = a8;
  id v22 = a10;
  id v23 = a11;
  v33.receiver = self;
  v33.super_class = (Class)MOSuggestionAssetMediaItem;
  v24 = [(MOSuggestionAssetMediaItem *)&v33 init];
  v25 = v24;
  if (v24)
  {
    objc_storeStrong((id *)&v24->_title, a3);
    objc_storeStrong((id *)&v25->_albumTitle, a4);
    objc_storeStrong((id *)&v25->_albumArt, a6);
    objc_storeStrong((id *)&v25->_trackIdentifier, v27);
    objc_storeStrong((id *)&v25->_previewURL, v28);
    v25->_mediaType = a9;
    objc_storeStrong((id *)&v25->_artistName, v29);
    objc_storeStrong((id *)&v25->_imageURL, a10);
    objc_storeStrong((id *)&v25->_bgColor, a11);
    v25->_bgColorVariant = a12;
  }

  return v25;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  title = self->_title;
  id v5 = a3;
  [v5 encodeObject:title forKey:@"kCoderKeyMediaAssetTitle"];
  [v5 encodeObject:self->_albumTitle forKey:@"kCoderKeyMediaAssetAlbumTitle"];
  [v5 encodeObject:self->_artistName forKey:@"kCoderKeyMediaAssetArtistName"];
  [v5 encodeObject:self->_albumArt forKey:@"kCoderKeyMediaAssetAlbumArt"];
  [v5 encodeObject:self->_trackIdentifier forKey:@"kCoderKeyMediaAssetTrackIdentifier"];
  [v5 encodeObject:self->_previewURL forKey:@"kCoderKeyMediaAssetPreviewURL"];
  [v5 encodeObject:self->_imageURL forKey:@"kCoderKeyMediaAssetImageURL"];
  v6 = [NSNumber numberWithUnsignedInteger:self->_mediaType];
  [v5 encodeObject:v6 forKey:@"kCoderKeyMediaAssetMediaType"];

  [v5 encodeObject:self->_bgColor forKey:@"kCoderKeyMediaAssetBgColor"];
  id v7 = [NSNumber numberWithUnsignedInteger:self->_bgColorVariant];
  [v5 encodeObject:v7 forKey:@"kCoderKeyMediaAssetBgColorVariant"];
}

- (MOSuggestionAssetMediaItem)initWithCoder:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)MOSuggestionAssetMediaItem;
  id v5 = [(MOSuggestionAssetMediaItem *)&v25 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCoderKeyMediaAssetTitle"];
    title = v5->_title;
    v5->_title = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCoderKeyMediaAssetAlbumTitle"];
    albumTitle = v5->_albumTitle;
    v5->_albumTitle = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCoderKeyMediaAssetArtistName"];
    artistName = v5->_artistName;
    v5->_artistName = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCoderKeyMediaAssetAlbumArt"];
    albumArt = v5->_albumArt;
    v5->_albumArt = (UIImage *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCoderKeyMediaAssetTrackIdentifier"];
    trackIdentifier = v5->_trackIdentifier;
    v5->_trackIdentifier = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCoderKeyMediaAssetPreviewURL"];
    previewURL = v5->_previewURL;
    v5->_previewURL = (NSURL *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCoderKeyMediaAssetImageURL"];
    imageURL = v5->_imageURL;
    v5->_imageURL = (NSURL *)v18;

    id v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCoderKeyMediaAssetMediaType"];
    v5->_mediaType = (int)[v20 intValue];

    uint64_t v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCoderKeyMediaAssetBgColor"];
    bgColor = v5->_bgColor;
    v5->_bgColor = (UIColor *)v21;

    id v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCoderKeyMediaAssetBgColorVariant"];
    v5->_bgColorVariant = (int)[v23 intValue];
  }
  return v5;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)albumTitle
{
  return self->_albumTitle;
}

- (NSString)artistName
{
  return self->_artistName;
}

- (unint64_t)mediaType
{
  return self->_mediaType;
}

- (UIImage)albumArt
{
  return self->_albumArt;
}

- (NSString)trackIdentifier
{
  return self->_trackIdentifier;
}

- (NSURL)previewURL
{
  return self->_previewURL;
}

- (NSURL)imageURL
{
  return self->_imageURL;
}

- (UIColor)bgColor
{
  return self->_bgColor;
}

- (unint64_t)bgColorVariant
{
  return self->_bgColorVariant;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bgColor, 0);
  objc_storeStrong((id *)&self->_imageURL, 0);
  objc_storeStrong((id *)&self->_previewURL, 0);
  objc_storeStrong((id *)&self->_trackIdentifier, 0);
  objc_storeStrong((id *)&self->_albumArt, 0);
  objc_storeStrong((id *)&self->_artistName, 0);
  objc_storeStrong((id *)&self->_albumTitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end