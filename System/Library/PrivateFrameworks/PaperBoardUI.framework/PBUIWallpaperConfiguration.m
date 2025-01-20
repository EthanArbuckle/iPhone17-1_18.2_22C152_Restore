@interface PBUIWallpaperConfiguration
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)needsInactiveAppearanceTreatment;
- (BOOL)needsWallpaperDimmingTreatment;
- (NSData)wallpaperImageHashData;
- (NSData)wallpaperThumbnailImageData;
- (NSDictionary)proceduralWallpaperInfo;
- (NSDictionary)proceduralWallpaperOptions;
- (NSString)description;
- (NSString)proceduralWallpaperIdentifier;
- (NSString)wallpaperColorName;
- (NSURL)originalVideoURL;
- (NSURL)videoURL;
- (PBUIWallpaperConfiguration)init;
- (PBUIWallpaperConfiguration)initWithCoder:(id)a3;
- (PBUIWallpaperConfiguration)initWithVariant:(int64_t)a3 type:(int64_t)a4;
- (PBUIWallpaperGradient)wallpaperGradient;
- (PBUIWallpaperImage)wallpaperImage;
- (PBUIWallpaperOptions)wallpaperOptions;
- (UIColor)wallpaperColor;
- (UIImage)wallpaperOriginalImage;
- (UIImage)wallpaperThumbnailImage;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int64_t)variant;
- (int64_t)wallpaperType;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setNeedsInactiveAppearanceTreatment:(BOOL)a3;
- (void)setNeedsWallpaperDimmingTreatment:(BOOL)a3;
- (void)setOriginalVideoURL:(id)a3;
- (void)setProceduralWallpaperInfo:(id)a3;
- (void)setVideoURL:(id)a3;
- (void)setWallpaperColor:(id)a3;
- (void)setWallpaperColorName:(id)a3;
- (void)setWallpaperGradient:(id)a3;
- (void)setWallpaperImage:(id)a3;
- (void)setWallpaperImageHashData:(id)a3;
- (void)setWallpaperOptions:(id)a3;
- (void)setWallpaperOriginalImage:(id)a3;
- (void)setWallpaperThumbnailImage:(id)a3;
- (void)setWallpaperThumbnailImageData:(id)a3;
@end

@implementation PBUIWallpaperConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wallpaperGradient, 0);
  objc_storeStrong((id *)&self->_wallpaperColorName, 0);
  objc_storeStrong((id *)&self->_wallpaperColor, 0);
  objc_storeStrong((id *)&self->_originalVideoURL, 0);
  objc_storeStrong((id *)&self->_videoURL, 0);
  objc_storeStrong((id *)&self->_proceduralWallpaperInfo, 0);
  objc_storeStrong((id *)&self->_wallpaperOptions, 0);
  objc_storeStrong((id *)&self->_wallpaperImageHashData, 0);
  objc_storeStrong((id *)&self->_wallpaperThumbnailImageData, 0);
  objc_storeStrong((id *)&self->_wallpaperThumbnailImage, 0);
  objc_storeStrong((id *)&self->_wallpaperOriginalImage, 0);
  objc_storeStrong((id *)&self->_wallpaperImage, 0);
}

- (PBUIWallpaperOptions)wallpaperOptions
{
  return self->_wallpaperOptions;
}

- (BOOL)needsWallpaperDimmingTreatment
{
  return self->_needsWallpaperDimmingTreatment;
}

- (PBUIWallpaperConfiguration)initWithVariant:(int64_t)a3 type:(int64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)PBUIWallpaperConfiguration;
  result = [(PBUIWallpaperConfiguration *)&v7 init];
  if (result)
  {
    result->_variant = a3;
    result->_wallpaperType = a4;
  }
  return result;
}

- (PBUIWallpaperConfiguration)init
{
  id v2 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"Use a designated initializer" userInfo:0];
  objc_exception_throw(v2);
}

- (NSString)proceduralWallpaperIdentifier
{
  id v2 = [(PBUIWallpaperConfiguration *)self proceduralWallpaperInfo];
  v3 = [v2 objectForKey:@"kSBUIMagicWallpaperIdentifierKey"];

  return (NSString *)v3;
}

- (NSDictionary)proceduralWallpaperOptions
{
  id v2 = [(PBUIWallpaperConfiguration *)self proceduralWallpaperInfo];
  v3 = [v2 objectForKey:@"kSBUIMagicWallpaperPresetOptionsKey"];

  return (NSDictionary *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithVariant:type:", -[PBUIWallpaperConfiguration variant](self, "variant"), -[PBUIWallpaperConfiguration wallpaperType](self, "wallpaperType"));
  if (v4)
  {
    *(unsigned char *)(v4 + 8) = [(PBUIWallpaperConfiguration *)self needsWallpaperDimmingTreatment];
    *(unsigned char *)(v4 + 9) = [(PBUIWallpaperConfiguration *)self needsInactiveAppearanceTreatment];
    uint64_t v5 = [(PBUIWallpaperConfiguration *)self wallpaperImage];
    v6 = *(void **)(v4 + 24);
    *(void *)(v4 + 24) = v5;

    uint64_t v7 = [(PBUIWallpaperConfiguration *)self wallpaperOriginalImage];
    v8 = *(void **)(v4 + 32);
    *(void *)(v4 + 32) = v7;

    uint64_t v9 = [(PBUIWallpaperConfiguration *)self wallpaperThumbnailImage];
    v10 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v9;

    v11 = [(PBUIWallpaperConfiguration *)self wallpaperThumbnailImageData];
    uint64_t v12 = [v11 copy];
    v13 = *(void **)(v4 + 48);
    *(void *)(v4 + 48) = v12;

    v14 = [(PBUIWallpaperConfiguration *)self wallpaperImageHashData];
    uint64_t v15 = [v14 copy];
    v16 = *(void **)(v4 + 56);
    *(void *)(v4 + 56) = v15;

    v17 = [(PBUIWallpaperConfiguration *)self proceduralWallpaperInfo];
    uint64_t v18 = [v17 copy];
    v19 = *(void **)(v4 + 72);
    *(void *)(v4 + 72) = v18;

    v20 = [(PBUIWallpaperConfiguration *)self videoURL];
    uint64_t v21 = [v20 copy];
    v22 = *(void **)(v4 + 80);
    *(void *)(v4 + 80) = v21;

    v23 = [(PBUIWallpaperConfiguration *)self originalVideoURL];
    uint64_t v24 = [v23 copy];
    v25 = *(void **)(v4 + 88);
    *(void *)(v4 + 88) = v24;

    v26 = [(PBUIWallpaperConfiguration *)self wallpaperOptions];
    uint64_t v27 = [v26 copy];
    v28 = *(void **)(v4 + 64);
    *(void *)(v4 + 64) = v27;

    v29 = [(PBUIWallpaperConfiguration *)self wallpaperColor];
    uint64_t v30 = [v29 copy];
    v31 = *(void **)(v4 + 96);
    *(void *)(v4 + 96) = v30;

    v32 = [(PBUIWallpaperConfiguration *)self wallpaperColorName];
    uint64_t v33 = [v32 copy];
    v34 = *(void **)(v4 + 104);
    *(void *)(v4 + 104) = v33;

    v35 = [(PBUIWallpaperConfiguration *)self wallpaperGradient];
    uint64_t v36 = [v35 copy];
    v37 = *(void **)(v4 + 112);
    *(void *)(v4 + 112) = v36;

    id v38 = (id)v4;
  }

  return (id)v4;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (PBUIWallpaperConfiguration *)a3;
  if (self == v4)
  {
    LOBYTE(v47) = 1;
  }
  else
  {
    uint64_t v5 = self;
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      uint64_t v7 = v4;
      int64_t v8 = [(PBUIWallpaperConfiguration *)self variant];
      if (v8 != [(PBUIWallpaperConfiguration *)v7 variant]) {
        goto LABEL_18;
      }
      int64_t v9 = [(PBUIWallpaperConfiguration *)self wallpaperType];
      if (v9 != [(PBUIWallpaperConfiguration *)v7 wallpaperType]) {
        goto LABEL_18;
      }
      v10 = [(PBUIWallpaperConfiguration *)self wallpaperImage];
      v11 = [(PBUIWallpaperConfiguration *)v7 wallpaperImage];
      int v12 = BSEqualObjects();

      if (!v12) {
        goto LABEL_18;
      }
      v13 = [(PBUIWallpaperConfiguration *)self wallpaperOriginalImage];
      v14 = [(PBUIWallpaperConfiguration *)v7 wallpaperOriginalImage];
      char v15 = (v13 != 0) ^ (v14 != 0);

      if (v15) {
        goto LABEL_18;
      }
      v16 = [(PBUIWallpaperConfiguration *)self wallpaperThumbnailImage];
      v17 = [(PBUIWallpaperConfiguration *)v7 wallpaperThumbnailImage];
      char v18 = (v16 != 0) ^ (v17 != 0);

      if (v18) {
        goto LABEL_18;
      }
      v19 = [(PBUIWallpaperConfiguration *)self wallpaperThumbnailImageData];
      v20 = [(PBUIWallpaperConfiguration *)v7 wallpaperThumbnailImageData];
      int v21 = BSEqualObjects();

      if (!v21) {
        goto LABEL_18;
      }
      v22 = [(PBUIWallpaperConfiguration *)self wallpaperImageHashData];
      v23 = [(PBUIWallpaperConfiguration *)v7 wallpaperImageHashData];
      int v24 = BSEqualObjects();

      if (!v24) {
        goto LABEL_18;
      }
      v25 = [(PBUIWallpaperConfiguration *)self proceduralWallpaperInfo];
      v26 = [(PBUIWallpaperConfiguration *)v7 proceduralWallpaperInfo];
      int v27 = BSEqualObjects();

      if (!v27) {
        goto LABEL_18;
      }
      v28 = [(PBUIWallpaperConfiguration *)self videoURL];
      v29 = [(PBUIWallpaperConfiguration *)v7 videoURL];
      int v30 = BSEqualObjects();

      if (!v30) {
        goto LABEL_18;
      }
      v31 = [(PBUIWallpaperConfiguration *)self originalVideoURL];
      v32 = [(PBUIWallpaperConfiguration *)v7 originalVideoURL];
      int v33 = BSEqualObjects();

      if (!v33) {
        goto LABEL_18;
      }
      v34 = [(PBUIWallpaperConfiguration *)self wallpaperOptions];
      v35 = [(PBUIWallpaperConfiguration *)v7 wallpaperOptions];
      int v36 = BSEqualObjects();

      if (!v36) {
        goto LABEL_18;
      }
      v37 = [(PBUIWallpaperConfiguration *)self wallpaperColor];
      id v38 = [(PBUIWallpaperConfiguration *)v7 wallpaperColor];
      int v39 = BSEqualObjects();

      if (!v39) {
        goto LABEL_18;
      }
      v40 = [(PBUIWallpaperConfiguration *)self wallpaperColorName];
      v41 = [(PBUIWallpaperConfiguration *)v7 wallpaperColorName];
      int v42 = BSEqualObjects();

      if (!v42) {
        goto LABEL_18;
      }
      v43 = [(PBUIWallpaperConfiguration *)self wallpaperGradient];
      v44 = [(PBUIWallpaperConfiguration *)v7 wallpaperGradient];
      int v45 = BSEqualObjects();

      if (!v45) {
        goto LABEL_18;
      }
      BOOL v46 = [(PBUIWallpaperConfiguration *)self needsWallpaperDimmingTreatment];
      if (v46 == [(PBUIWallpaperConfiguration *)v7 needsWallpaperDimmingTreatment])
      {
        BOOL v49 = [(PBUIWallpaperConfiguration *)self needsInactiveAppearanceTreatment];
        BOOL v47 = v49 ^ [(PBUIWallpaperConfiguration *)v7 needsInactiveAppearanceTreatment] ^ 1;
      }
      else
      {
LABEL_18:
        LOBYTE(v47) = 0;
      }
    }
    else
    {
      LOBYTE(v47) = 0;
    }
  }

  return v47;
}

- (unint64_t)hash
{
  int64_t v3 = [(PBUIWallpaperConfiguration *)self variant];
  int64_t v4 = [(PBUIWallpaperConfiguration *)self wallpaperType] + v3;
  v26 = [(PBUIWallpaperConfiguration *)self wallpaperImage];
  int64_t v5 = v4 + [v26 hash];
  v25 = [(PBUIWallpaperConfiguration *)self wallpaperThumbnailImageData];
  uint64_t v6 = [v25 hash];
  int v24 = [(PBUIWallpaperConfiguration *)self wallpaperImageHashData];
  int64_t v7 = v5 + v6 + [v24 hash];
  int64_t v8 = [(PBUIWallpaperConfiguration *)self proceduralWallpaperInfo];
  uint64_t v9 = [v8 hash];
  v10 = [(PBUIWallpaperConfiguration *)self videoURL];
  uint64_t v11 = v9 + [v10 hash];
  int v12 = [(PBUIWallpaperConfiguration *)self originalVideoURL];
  uint64_t v13 = v7 + v11 + [v12 hash];
  v14 = [(PBUIWallpaperConfiguration *)self wallpaperOptions];
  uint64_t v15 = [v14 hash];
  v16 = [(PBUIWallpaperConfiguration *)self wallpaperColor];
  uint64_t v17 = v15 + [v16 hash];
  char v18 = [(PBUIWallpaperConfiguration *)self wallpaperColorName];
  uint64_t v19 = v17 + [v18 hash];
  v20 = [(PBUIWallpaperConfiguration *)self wallpaperGradient];
  uint64_t v21 = v13 + v19 + [v20 hash];
  uint64_t v22 = v21 + [(PBUIWallpaperConfiguration *)self needsWallpaperDimmingTreatment];

  return v22 + [(PBUIWallpaperConfiguration *)self needsInactiveAppearanceTreatment];
}

- (NSString)description
{
  return (NSString *)[(PBUIWallpaperConfiguration *)self descriptionWithMultilinePrefix:@"\t"];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  int64_t v3 = [(PBUIWallpaperConfiguration *)self descriptionBuilderWithMultilinePrefix:a3];
  int64_t v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  int64_t v4 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  int64_t v5 = PBUIStringForWallpaperType([(PBUIWallpaperConfiguration *)self wallpaperType]);
  id v6 = (id)[v4 appendObject:v5 withName:@"wallpaperType"];

  int64_t v7 = [(PBUIWallpaperConfiguration *)self wallpaperImage];
  id v8 = (id)[v4 appendObject:v7 withName:@"wallpaperImage" skipIfNil:1];

  uint64_t v9 = [(PBUIWallpaperConfiguration *)self wallpaperOriginalImage];
  id v10 = (id)[v4 appendObject:v9 withName:@"wallpaperOriginalImage" skipIfNil:1];

  uint64_t v11 = [(PBUIWallpaperConfiguration *)self wallpaperThumbnailImage];
  id v12 = (id)[v4 appendObject:v11 withName:@"wallpaperThumbnailImage" skipIfNil:1];

  uint64_t v13 = [(PBUIWallpaperConfiguration *)self wallpaperThumbnailImageData];
  id v14 = (id)[v4 appendObject:v13 withName:@"wallpaperThumbnailImageData" skipIfNil:1];

  uint64_t v15 = [(PBUIWallpaperConfiguration *)self wallpaperImageHashData];
  id v16 = (id)[v4 appendObject:v15 withName:@"wallpaperImageHashData" skipIfNil:1];

  uint64_t v17 = [(PBUIWallpaperConfiguration *)self proceduralWallpaperInfo];
  id v18 = (id)[v4 appendObject:v17 withName:@"proceduralWallpaperInfo" skipIfNil:1];

  uint64_t v19 = [(PBUIWallpaperConfiguration *)self videoURL];
  id v20 = (id)[v4 appendObject:v19 withName:@"videoURL" skipIfNil:1];

  uint64_t v21 = [(PBUIWallpaperConfiguration *)self originalVideoURL];
  id v22 = (id)[v4 appendObject:v21 withName:@"originalVideoURL" skipIfNil:1];

  v23 = [(PBUIWallpaperConfiguration *)self wallpaperOptions];
  id v24 = (id)[v4 appendObject:v23 withName:@"wallpaperOptions" skipIfNil:1];

  v25 = [(PBUIWallpaperConfiguration *)self wallpaperColor];
  id v26 = (id)[v4 appendObject:v25 withName:@"wallpaperColor" skipIfNil:1];

  int v27 = [(PBUIWallpaperConfiguration *)self wallpaperColorName];
  id v28 = (id)[v4 appendObject:v27 withName:@"wallpaperColorName" skipIfNil:1];

  v29 = [(PBUIWallpaperConfiguration *)self wallpaperGradient];
  id v30 = (id)[v4 appendObject:v29 withName:@"wallpaperGradient" skipIfNil:1];

  id v31 = (id)objc_msgSend(v4, "appendBool:withName:ifEqualTo:", -[PBUIWallpaperConfiguration needsWallpaperDimmingTreatment](self, "needsWallpaperDimmingTreatment"), @"needsWallpaperDimmingTreatment", 1);
  id v32 = (id)objc_msgSend(v4, "appendBool:withName:ifEqualTo:", -[PBUIWallpaperConfiguration needsInactiveAppearanceTreatment](self, "needsInactiveAppearanceTreatment"), @"needsInactiveAppearanceTreatment", 1);
  return v4;
}

- (id)succinctDescription
{
  id v2 = [(PBUIWallpaperConfiguration *)self succinctDescriptionBuilder];
  int64_t v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v18 = a3;
  int64_t v4 = PBUIStringForWallpaperType([(PBUIWallpaperConfiguration *)self wallpaperType]);
  [v18 encodeObject:v4 forKey:@"wallpaperType"];

  int64_t v5 = PBUIStringForWallpaperVariant([(PBUIWallpaperConfiguration *)self variant]);
  [v18 encodeObject:v5 forKey:@"variant"];

  id v6 = [(PBUIWallpaperConfiguration *)self wallpaperImage];
  [v18 encodeObject:v6 forKey:@"wallpaperImage"];

  int64_t v7 = [(PBUIWallpaperConfiguration *)self wallpaperOriginalImage];
  [v18 encodeObject:v7 forKey:@"wallpaperOriginalImage"];

  id v8 = [(PBUIWallpaperConfiguration *)self wallpaperThumbnailImage];
  [v18 encodeObject:v8 forKey:@"wallpaperThumbnailImage"];

  uint64_t v9 = [(PBUIWallpaperConfiguration *)self wallpaperThumbnailImageData];
  [v18 encodeObject:v9 forKey:@"wallpaperThumbnailImageData"];

  id v10 = [(PBUIWallpaperConfiguration *)self wallpaperImageHashData];
  [v18 encodeObject:v10 forKey:@"wallpaperImageHashData"];

  uint64_t v11 = [(PBUIWallpaperConfiguration *)self proceduralWallpaperInfo];
  [v18 encodeObject:v11 forKey:@"proceduralWallpaperInfo"];

  id v12 = [(PBUIWallpaperConfiguration *)self videoURL];
  [v18 encodeObject:v12 forKey:@"videoURL"];

  uint64_t v13 = [(PBUIWallpaperConfiguration *)self originalVideoURL];
  [v18 encodeObject:v13 forKey:@"originalVideoURL"];

  id v14 = [(PBUIWallpaperConfiguration *)self wallpaperOptions];
  [v18 encodeObject:v14 forKey:@"wallpaperOptions"];

  uint64_t v15 = [(PBUIWallpaperConfiguration *)self wallpaperColor];
  [v18 encodeObject:v15 forKey:@"wallpaperColor"];

  id v16 = [(PBUIWallpaperConfiguration *)self wallpaperColorName];
  [v18 encodeObject:v16 forKey:@"wallpaperColorName"];

  uint64_t v17 = [(PBUIWallpaperConfiguration *)self wallpaperGradient];
  [v18 encodeObject:v17 forKey:@"wallpaperGradient"];

  objc_msgSend(v18, "encodeBool:forKey:", -[PBUIWallpaperConfiguration needsWallpaperDimmingTreatment](self, "needsWallpaperDimmingTreatment"), @"needsWallpaperDimmingTreatment");
  objc_msgSend(v18, "encodeBool:forKey:", -[PBUIWallpaperConfiguration needsInactiveAppearanceTreatment](self, "needsInactiveAppearanceTreatment"), @"needsInactiveAppearanceTreatment");
}

- (PBUIWallpaperConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v47.receiver = self;
  v47.super_class = (Class)PBUIWallpaperConfiguration;
  int64_t v5 = [(PBUIWallpaperConfiguration *)&v47 init];
  if (v5)
  {
    id v6 = self;
    int64_t v7 = [v4 decodeObjectOfClass:v6 forKey:@"wallpaperType"];
    v5->_wallpaperType = PBUIWallpaperTypeForString(v7);

    id v8 = self;
    uint64_t v9 = [v4 decodeObjectOfClass:v8 forKey:@"variant"];
    v5->_variant = PBUIWallpaperVariantForString(v9);

    id v10 = self;
    uint64_t v11 = [v4 decodeObjectOfClass:v10 forKey:@"wallpaperImage"];
    wallpaperImage = v5->_wallpaperImage;
    v5->_wallpaperImage = (PBUIWallpaperImage *)v11;

    uint64_t v13 = self;
    uint64_t v14 = [v4 decodeObjectOfClass:v13 forKey:@"wallpaperOriginalImage"];
    wallpaperOriginalImage = v5->_wallpaperOriginalImage;
    v5->_wallpaperOriginalImage = (UIImage *)v14;

    id v16 = self;
    uint64_t v17 = [v4 decodeObjectOfClass:v16 forKey:@"wallpaperThumbnailImage"];
    wallpaperThumbnailImage = v5->_wallpaperThumbnailImage;
    v5->_wallpaperThumbnailImage = (UIImage *)v17;

    uint64_t v19 = self;
    uint64_t v20 = [v4 decodeObjectOfClass:v19 forKey:@"wallpaperThumbnailImageData"];
    wallpaperThumbnailImageData = v5->_wallpaperThumbnailImageData;
    v5->_wallpaperThumbnailImageData = (NSData *)v20;

    id v22 = self;
    uint64_t v23 = [v4 decodeObjectOfClass:v22 forKey:@"wallpaperImageHashData"];
    wallpaperImageHashData = v5->_wallpaperImageHashData;
    v5->_wallpaperImageHashData = (NSData *)v23;

    v25 = self;
    uint64_t v26 = [v4 decodeObjectOfClass:v25 forKey:@"proceduralWallpaperInfo"];
    proceduralWallpaperInfo = v5->_proceduralWallpaperInfo;
    v5->_proceduralWallpaperInfo = (NSDictionary *)v26;

    id v28 = self;
    uint64_t v29 = [v4 decodeObjectOfClass:v28 forKey:@"videoURL"];
    videoURL = v5->_videoURL;
    v5->_videoURL = (NSURL *)v29;

    id v31 = self;
    uint64_t v32 = [v4 decodeObjectOfClass:v31 forKey:@"originalVideoURL"];
    originalVideoURL = v5->_originalVideoURL;
    v5->_originalVideoURL = (NSURL *)v32;

    v34 = self;
    uint64_t v35 = [v4 decodeObjectOfClass:v34 forKey:@"wallpaperOptions"];
    wallpaperOptions = v5->_wallpaperOptions;
    v5->_wallpaperOptions = (PBUIWallpaperOptions *)v35;

    v37 = self;
    uint64_t v38 = [v4 decodeObjectOfClass:v37 forKey:@"wallpaperColor"];
    wallpaperColor = v5->_wallpaperColor;
    v5->_wallpaperColor = (UIColor *)v38;

    v40 = self;
    uint64_t v41 = [v4 decodeObjectOfClass:v40 forKey:@"wallpaperColorName"];
    wallpaperColorName = v5->_wallpaperColorName;
    v5->_wallpaperColorName = (NSString *)v41;

    v43 = self;
    uint64_t v44 = [v4 decodeObjectOfClass:v43 forKey:@"wallpaperGradient"];
    wallpaperGradient = v5->_wallpaperGradient;
    v5->_wallpaperGradient = (PBUIWallpaperGradient *)v44;

    v5->_needsWallpaperDimmingTreatment = [v4 decodeBoolForKey:@"needsWallpaperDimmingTreatment"];
    v5->_needsInactiveAppearanceTreatment = [v4 decodeBoolForKey:@"needsInactiveAppearanceTreatment"];
  }

  return v5;
}

- (int64_t)wallpaperType
{
  return self->_wallpaperType;
}

- (void)setNeedsWallpaperDimmingTreatment:(BOOL)a3
{
  self->_needsWallpaperDimmingTreatment = a3;
}

- (BOOL)needsInactiveAppearanceTreatment
{
  return self->_needsInactiveAppearanceTreatment;
}

- (void)setNeedsInactiveAppearanceTreatment:(BOOL)a3
{
  self->_needsInactiveAppearanceTreatment = a3;
}

- (PBUIWallpaperImage)wallpaperImage
{
  return self->_wallpaperImage;
}

- (void)setWallpaperImage:(id)a3
{
}

- (UIImage)wallpaperOriginalImage
{
  return self->_wallpaperOriginalImage;
}

- (void)setWallpaperOriginalImage:(id)a3
{
}

- (UIImage)wallpaperThumbnailImage
{
  return self->_wallpaperThumbnailImage;
}

- (void)setWallpaperThumbnailImage:(id)a3
{
}

- (NSData)wallpaperThumbnailImageData
{
  return self->_wallpaperThumbnailImageData;
}

- (void)setWallpaperThumbnailImageData:(id)a3
{
}

- (NSData)wallpaperImageHashData
{
  return self->_wallpaperImageHashData;
}

- (void)setWallpaperImageHashData:(id)a3
{
}

- (void)setWallpaperOptions:(id)a3
{
}

- (NSDictionary)proceduralWallpaperInfo
{
  return self->_proceduralWallpaperInfo;
}

- (void)setProceduralWallpaperInfo:(id)a3
{
}

- (NSURL)videoURL
{
  return self->_videoURL;
}

- (void)setVideoURL:(id)a3
{
}

- (NSURL)originalVideoURL
{
  return self->_originalVideoURL;
}

- (void)setOriginalVideoURL:(id)a3
{
}

- (UIColor)wallpaperColor
{
  return self->_wallpaperColor;
}

- (void)setWallpaperColor:(id)a3
{
}

- (NSString)wallpaperColorName
{
  return self->_wallpaperColorName;
}

- (void)setWallpaperColorName:(id)a3
{
}

- (PBUIWallpaperGradient)wallpaperGradient
{
  return self->_wallpaperGradient;
}

- (void)setWallpaperGradient:(id)a3
{
}

- (int64_t)variant
{
  return self->_variant;
}

@end