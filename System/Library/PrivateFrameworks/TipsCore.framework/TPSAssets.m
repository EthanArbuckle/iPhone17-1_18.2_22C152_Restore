@interface TPSAssets
+ (BOOL)supportsSecureCoding;
+ (id)assetsFromDictionary:(id)a3;
- (BOOL)hasImage;
- (BOOL)hasVideo;
- (BOOL)isEqual:(id)a3;
- (NSString)alt;
- (NSString)caption;
- (NSString)fallbackId;
- (NSString)imageId;
- (NSString)posterId;
- (NSString)symbolColor;
- (NSString)symbolId;
- (NSString)symbolSize;
- (NSString)thumbnailId;
- (NSString)videoId;
- (NSURL)baseURL;
- (TPSAssets)initWithCoder:(id)a3;
- (TPSAssets)initWithDictionary:(id)a3 metadata:(id)a4;
- (TPSAssets)initWithSymbolId:(id)a3 symbolColor:(id)a4 symbolSize:(id)a5 alt:(id)a6 gradientColorStrings:(id)a7;
- (TPSGradient)gradient;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (id)identifierForKey:(id)a3 dictionary:(id)a4;
- (id)imageIdentifier;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAlt:(id)a3;
- (void)setBaseURL:(id)a3;
- (void)setCaption:(id)a3;
- (void)setFallbackId:(id)a3;
- (void)setGradient:(id)a3;
- (void)setImageId:(id)a3;
- (void)setPosterId:(id)a3;
- (void)setSymbolColor:(id)a3;
- (void)setSymbolId:(id)a3;
- (void)setSymbolSize:(id)a3;
- (void)setThumbnailId:(id)a3;
- (void)setVideoId:(id)a3;
@end

@implementation TPSAssets

uint64_t __24__TPSAssets_na_identity__block_invoke_9(uint64_t a1, void *a2)
{
  return [a2 imageId];
}

uint64_t __24__TPSAssets_na_identity__block_invoke_8(uint64_t a1, void *a2)
{
  return [a2 fallbackId];
}

uint64_t __24__TPSAssets_na_identity__block_invoke_7(uint64_t a1, void *a2)
{
  return [a2 videoId];
}

uint64_t __24__TPSAssets_na_identity__block_invoke_6(uint64_t a1, void *a2)
{
  return [a2 posterId];
}

uint64_t __24__TPSAssets_na_identity__block_invoke_5(uint64_t a1, void *a2)
{
  return [a2 caption];
}

uint64_t __24__TPSAssets_na_identity__block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 alt];
}

uint64_t __24__TPSAssets_na_identity__block_invoke_15(uint64_t a1, void *a2)
{
  return [a2 gradient];
}

uint64_t __24__TPSAssets_na_identity__block_invoke_14(uint64_t a1, void *a2)
{
  return [a2 baseURL];
}

uint64_t __24__TPSAssets_na_identity__block_invoke_13(uint64_t a1, void *a2)
{
  return [a2 symbolSize];
}

uint64_t __24__TPSAssets_na_identity__block_invoke_12(uint64_t a1, void *a2)
{
  return [a2 symbolColor];
}

uint64_t __24__TPSAssets_na_identity__block_invoke_11(uint64_t a1, void *a2)
{
  return [a2 symbolId];
}

uint64_t __24__TPSAssets_na_identity__block_invoke_10(uint64_t a1, void *a2)
{
  return [a2 thumbnailId];
}

- (void)encodeWithCoder:(id)a3
{
  v17.receiver = self;
  v17.super_class = (Class)TPSAssets;
  id v4 = a3;
  [(TPSSerializableObject *)&v17 encodeWithCoder:v4];
  v5 = [(TPSAssets *)self alt];
  [v4 encodeObject:v5 forKey:@"alt"];

  v6 = [(TPSAssets *)self caption];
  [v4 encodeObject:v6 forKey:@"caption"];

  v7 = [(TPSAssets *)self posterId];
  [v4 encodeObject:v7 forKey:@"posterId"];

  v8 = [(TPSAssets *)self thumbnailId];
  [v4 encodeObject:v8 forKey:@"thumbnailId"];

  v9 = [(TPSAssets *)self videoId];
  [v4 encodeObject:v9 forKey:@"videoId"];

  v10 = [(TPSAssets *)self fallbackId];
  [v4 encodeObject:v10 forKey:@"fallbackId"];

  v11 = [(TPSAssets *)self imageId];
  [v4 encodeObject:v11 forKey:@"imageId"];

  v12 = [(TPSAssets *)self symbolId];
  [v4 encodeObject:v12 forKey:@"stringId"];

  v13 = [(TPSAssets *)self symbolColor];
  [v4 encodeObject:v13 forKey:@"color"];

  v14 = [(TPSAssets *)self symbolSize];
  [v4 encodeObject:v14 forKey:@"size"];

  v15 = [(TPSAssets *)self baseURL];
  [v4 encodeObject:v15 forKey:@"baseURL"];

  v16 = [(TPSAssets *)self gradient];
  [v4 encodeObject:v16 forKey:@"gradient"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v18.receiver = self;
  v18.super_class = (Class)TPSAssets;
  id v4 = [(TPSSerializableObject *)&v18 copyWithZone:a3];
  v5 = [(TPSAssets *)self alt];
  [v4 setAlt:v5];

  v6 = [(TPSAssets *)self caption];
  [v4 setCaption:v6];

  v7 = [(TPSAssets *)self posterId];
  [v4 setPosterId:v7];

  v8 = [(TPSAssets *)self thumbnailId];
  [v4 setThumbnailId:v8];

  v9 = [(TPSAssets *)self videoId];
  [v4 setVideoId:v9];

  v10 = [(TPSAssets *)self fallbackId];
  [v4 setFallbackId:v10];

  v11 = [(TPSAssets *)self imageId];
  [v4 setImageId:v11];

  v12 = [(TPSAssets *)self symbolId];
  [v4 setSymbolId:v12];

  v13 = [(TPSAssets *)self symbolColor];
  [v4 setSymbolColor:v13];

  v14 = [(TPSAssets *)self symbolSize];
  [v4 setSymbolSize:v14];

  v15 = [(TPSAssets *)self baseURL];
  [v4 setBaseURL:v15];

  v16 = [(TPSAssets *)self gradient];
  [v4 setGradient:v16];

  return v4;
}

- (NSString)symbolId
{
  return self->_symbolId;
}

- (TPSGradient)gradient
{
  return self->_gradient;
}

- (NSURL)baseURL
{
  return self->_baseURL;
}

- (NSString)videoId
{
  return self->_videoId;
}

- (NSString)posterId
{
  return self->_posterId;
}

- (NSString)thumbnailId
{
  return self->_thumbnailId;
}

- (NSString)symbolSize
{
  return self->_symbolSize;
}

- (NSString)symbolColor
{
  return self->_symbolColor;
}

- (NSString)imageId
{
  return self->_imageId;
}

- (NSString)fallbackId
{
  return self->_fallbackId;
}

- (NSString)caption
{
  return self->_caption;
}

- (NSString)alt
{
  return self->_alt;
}

- (void)setVideoId:(id)a3
{
}

- (void)setThumbnailId:(id)a3
{
}

- (void)setSymbolSize:(id)a3
{
}

- (void)setSymbolId:(id)a3
{
}

- (void)setSymbolColor:(id)a3
{
}

- (void)setPosterId:(id)a3
{
}

- (void)setImageId:(id)a3
{
}

- (void)setGradient:(id)a3
{
}

- (void)setFallbackId:(id)a3
{
}

- (void)setCaption:(id)a3
{
}

- (void)setBaseURL:(id)a3
{
}

- (void)setAlt:(id)a3
{
}

+ (id)assetsFromDictionary:(id)a3
{
  return (id)[a3 TPSSafeDictionaryForKey:@"assets"];
}

- (TPSAssets)initWithCoder:(id)a3
{
  id v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)TPSAssets;
  v5 = [(TPSSerializableObject *)&v31 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"alt"];
    alt = v5->_alt;
    v5->_alt = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"caption"];
    caption = v5->_caption;
    v5->_caption = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"posterId"];
    posterId = v5->_posterId;
    v5->_posterId = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"thumbnailId"];
    thumbnailId = v5->_thumbnailId;
    v5->_thumbnailId = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"videoId"];
    videoId = v5->_videoId;
    v5->_videoId = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"fallbackId"];
    fallbackId = v5->_fallbackId;
    v5->_fallbackId = (NSString *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"imageId"];
    imageId = v5->_imageId;
    v5->_imageId = (NSString *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"stringId"];
    symbolId = v5->_symbolId;
    v5->_symbolId = (NSString *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"color"];
    symbolColor = v5->_symbolColor;
    v5->_symbolColor = (NSString *)v22;

    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"size"];
    symbolSize = v5->_symbolSize;
    v5->_symbolSize = (NSString *)v24;

    uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"baseURL"];
    baseURL = v5->_baseURL;
    v5->_baseURL = (NSURL *)v26;

    uint64_t v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"gradient"];
    gradient = v5->_gradient;
    v5->_gradient = (TPSGradient *)v28;
  }
  return v5;
}

- (TPSAssets)initWithDictionary:(id)a3 metadata:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v40.receiver = self;
  v40.super_class = (Class)TPSAssets;
  uint64_t v8 = [(TPSSerializableObject *)&v40 initWithDictionary:v6];
  if (!v8) {
    goto LABEL_15;
  }
  uint64_t v9 = [v7 assetBaseURL];
  baseURL = v8->_baseURL;
  v8->_baseURL = (NSURL *)v9;

  v11 = [v6 TPSSafeStringForKey:@"type"];
  if (v11)
  {
    uint64_t v12 = [v6 TPSSafeDictionaryForKey:@"attrs"];
    if (!v12)
    {
LABEL_17:

      v38 = 0;
      goto LABEL_16;
    }
    imageId = (void *)v12;
    if ([v11 isEqualToString:@"symbol"])
    {
      uint64_t v14 = [imageId TPSSafeStringForKey:@"stringId"];
      symbolId = v8->_symbolId;
      v8->_symbolId = (NSString *)v14;

      uint64_t v16 = [imageId TPSSafeStringForKey:@"color"];
      symbolColor = v8->_symbolColor;
      v8->_symbolColor = (NSString *)v16;

      uint64_t v18 = [imageId TPSSafeStringForKey:@"size"];
      uint64_t v19 = 88;
    }
    else
    {
      if (![v11 isEqualToString:@"inlineIcon"])
      {
LABEL_10:
        uint64_t v34 = [imageId TPSSafeStringForKey:@"alt"];
        alt = v8->_alt;
        v8->_alt = (NSString *)v34;

        v36 = [[TPSGradient alloc] initWithDictionary:imageId];
        gradient = v8->_gradient;
        v8->_gradient = v36;

        goto LABEL_11;
      }
      uint64_t v18 = [(TPSAssets *)v8 identifierForKey:@"imageId" dictionary:imageId];
      uint64_t v19 = 64;
    }
    v33 = *(Class *)((char *)&v8->super.super.isa + v19);
    *(Class *)((char *)&v8->super.super.isa + v19) = (Class)v18;

    goto LABEL_10;
  }
  uint64_t v20 = [v6 TPSSafeStringForKey:@"alt"];
  v21 = v8->_alt;
  v8->_alt = (NSString *)v20;

  uint64_t v22 = [v6 TPSSafeStringForKey:@"caption"];
  caption = v8->_caption;
  v8->_caption = (NSString *)v22;

  uint64_t v24 = [(TPSAssets *)v8 identifierForKey:@"posterId" dictionary:v6];
  posterId = v8->_posterId;
  v8->_posterId = (NSString *)v24;

  uint64_t v26 = [(TPSAssets *)v8 identifierForKey:@"thumbnailId" dictionary:v6];
  thumbnailId = v8->_thumbnailId;
  v8->_thumbnailId = (NSString *)v26;

  uint64_t v28 = [(TPSAssets *)v8 identifierForKey:@"videoId" dictionary:v6];
  videoId = v8->_videoId;
  v8->_videoId = (NSString *)v28;

  uint64_t v30 = [(TPSAssets *)v8 identifierForKey:@"fallbackId" dictionary:v6];
  fallbackId = v8->_fallbackId;
  v8->_fallbackId = (NSString *)v30;

  uint64_t v32 = [(TPSAssets *)v8 identifierForKey:@"imageId" dictionary:v6];
  imageId = v8->_imageId;
  v8->_imageId = (NSString *)v32;
LABEL_11:

  if (![(TPSAssets *)v8 hasImage] && ![(TPSAssets *)v8 hasVideo] && !v8->_thumbnailId) {
    goto LABEL_17;
  }

LABEL_15:
  v38 = v8;
LABEL_16:

  return v38;
}

- (id)identifierForKey:(id)a3 dictionary:(id)a4
{
  id v4 = [a4 TPSSafeStringForKey:a3];
  if (![v4 length])
  {

    id v4 = 0;
  }
  return v4;
}

- (BOOL)hasImage
{
  return [(NSString *)self->_posterId length]
      || [(NSString *)self->_imageId length]
      || [(NSString *)self->_fallbackId length]
      || [(NSString *)self->_symbolId length] != 0;
}

- (unint64_t)hash
{
  v3 = objc_msgSend((id)objc_opt_class(), "na_identity");
  unint64_t v4 = [v3 hashOfObject:self];

  return v4;
}

id __24__TPSAssets_na_identity__block_invoke()
{
  if (TPSAssetsGradientKey_block_invoke_na_once_token_0 != -1) {
    dispatch_once(&TPSAssetsGradientKey_block_invoke_na_once_token_0, &__block_literal_global_47);
  }
  v0 = (void *)TPSAssetsGradientKey_block_invoke_na_once_object_0;
  return v0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gradient, 0);
  objc_storeStrong((id *)&self->_symbolSize, 0);
  objc_storeStrong((id *)&self->_symbolColor, 0);
  objc_storeStrong((id *)&self->_symbolId, 0);
  objc_storeStrong((id *)&self->_imageId, 0);
  objc_storeStrong((id *)&self->_fallbackId, 0);
  objc_storeStrong((id *)&self->_videoId, 0);
  objc_storeStrong((id *)&self->_thumbnailId, 0);
  objc_storeStrong((id *)&self->_posterId, 0);
  objc_storeStrong((id *)&self->_caption, 0);
  objc_storeStrong((id *)&self->_alt, 0);
  objc_storeStrong((id *)&self->_baseURL, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

uint64_t __24__TPSAssets_na_identity__block_invoke_2()
{
  uint64_t v0 = __24__TPSAssets_na_identity__block_invoke_3();
  uint64_t v1 = TPSAssetsGradientKey_block_invoke_na_once_object_0;
  TPSAssetsGradientKey_block_invoke_na_once_object_0 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

id __24__TPSAssets_na_identity__block_invoke_3()
{
  uint64_t v0 = [MEMORY[0x1E4F7A0E0] builder];
  id v1 = (id)[v0 appendCharacteristic:&__block_literal_global_54];
  id v2 = (id)[v0 appendCharacteristic:&__block_literal_global_56];
  id v3 = (id)[v0 appendCharacteristic:&__block_literal_global_58];
  id v4 = (id)[v0 appendCharacteristic:&__block_literal_global_60];
  id v5 = (id)[v0 appendCharacteristic:&__block_literal_global_62];
  id v6 = (id)[v0 appendCharacteristic:&__block_literal_global_64_0];
  id v7 = (id)[v0 appendCharacteristic:&__block_literal_global_66];
  id v8 = (id)[v0 appendCharacteristic:&__block_literal_global_68];
  id v9 = (id)[v0 appendCharacteristic:&__block_literal_global_70];
  id v10 = (id)[v0 appendCharacteristic:&__block_literal_global_72];
  id v11 = (id)[v0 appendCharacteristic:&__block_literal_global_75];
  id v12 = (id)[v0 appendCharacteristic:&__block_literal_global_78];
  v13 = [v0 build];

  return v13;
}

- (TPSAssets)initWithSymbolId:(id)a3 symbolColor:(id)a4 symbolSize:(id)a5 alt:(id)a6 gradientColorStrings:(id)a7
{
  id v22 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v23.receiver = self;
  v23.super_class = (Class)TPSAssets;
  objc_super v17 = [(TPSAssets *)&v23 init];
  uint64_t v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_symbolId, a3);
    objc_storeStrong((id *)&v18->_symbolColor, a4);
    objc_storeStrong((id *)&v18->_symbolSize, a5);
    objc_storeStrong((id *)&v18->_alt, a6);
    uint64_t v19 = [[TPSGradient alloc] initWithColorStrings:v16];
    gradient = v18->_gradient;
    v18->_gradient = v19;
  }
  return v18;
}

- (id)imageIdentifier
{
  posterId = self->_posterId;
  if (posterId) {
    goto LABEL_2;
  }
  id v3 = self->_imageId;
  if (!v3)
  {
    posterId = self->_fallbackId;
LABEL_2:
    id v3 = posterId;
  }
  return v3;
}

- (BOOL)hasVideo
{
  id v2 = [(TPSAssets *)self videoId];
  BOOL v3 = [v2 length] != 0;

  return v3;
}

- (id)debugDescription
{
  id v3 = objc_alloc(MEMORY[0x1E4F28E78]);
  v32.receiver = self;
  v32.super_class = (Class)TPSAssets;
  id v4 = [(TPSSerializableObject *)&v32 debugDescription];
  id v5 = (void *)[v3 initWithString:v4];

  id v6 = [(TPSAssets *)self alt];

  if (v6)
  {
    id v7 = [(TPSAssets *)self alt];
    [v5 appendFormat:@"  %@ = %@\n", @"alt", v7];
  }
  id v8 = [(TPSAssets *)self caption];

  if (v8)
  {
    id v9 = [(TPSAssets *)self caption];
    [v5 appendFormat:@"  %@ = %@\n", @"caption", v9];
  }
  id v10 = [(TPSAssets *)self posterId];

  if (v10)
  {
    id v11 = [(TPSAssets *)self posterId];
    [v5 appendFormat:@"  %@ = %@\n", @"posterId", v11];
  }
  id v12 = [(TPSAssets *)self thumbnailId];

  if (v12)
  {
    id v13 = [(TPSAssets *)self thumbnailId];
    [v5 appendFormat:@"  %@ = %@\n", @"thumbnailId", v13];
  }
  id v14 = [(TPSAssets *)self videoId];

  if (v14)
  {
    id v15 = [(TPSAssets *)self videoId];
    [v5 appendFormat:@"  %@ = %@\n", @"videoId", v15];
  }
  id v16 = [(TPSAssets *)self fallbackId];

  if (v16)
  {
    objc_super v17 = [(TPSAssets *)self fallbackId];
    [v5 appendFormat:@"  %@ = %@\n", @"fallbackId", v17];
  }
  uint64_t v18 = [(TPSAssets *)self imageId];

  if (v18)
  {
    uint64_t v19 = [(TPSAssets *)self imageId];
    [v5 appendFormat:@"  %@ = %@\n", @"imageId", v19];
  }
  uint64_t v20 = [(TPSAssets *)self symbolId];

  if (v20)
  {
    v21 = [(TPSAssets *)self symbolId];
    [v5 appendFormat:@"  %@ = %@\n", @"stringId", v21];
  }
  id v22 = [(TPSAssets *)self symbolColor];

  if (v22)
  {
    objc_super v23 = [(TPSAssets *)self symbolColor];
    [v5 appendFormat:@"  %@ = %@\n", @"color", v23];
  }
  uint64_t v24 = [(TPSAssets *)self symbolColor];

  if (v24)
  {
    v25 = [(TPSAssets *)self symbolSize];
    [v5 appendFormat:@"  %@ = %@\n", @"size", v25];
  }
  uint64_t v26 = [(TPSAssets *)self baseURL];

  if (v26)
  {
    v27 = [(TPSAssets *)self baseURL];
    [v5 appendFormat:@"  %@ = %@\n", @"baseURL", v27];
  }
  uint64_t v28 = [(TPSAssets *)self gradient];

  if (v28)
  {
    v29 = [(TPSAssets *)self gradient];
    uint64_t v30 = [v29 debugDescription];
    [v5 appendFormat:@"  %@ = %@\n", @"gradient", v30];
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id v5 = objc_msgSend((id)objc_opt_class(), "na_identity");
  LOBYTE(self) = [v5 isObject:self equalToObject:v4];

  return (char)self;
}

@end