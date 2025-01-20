@interface PBUIWallpaperDefaultConfiguration
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSDictionary)proceduralWallpaperOptions;
- (NSString)description;
- (NSString)proceduralWallpaperIdentifier;
- (NSString)wallpaperColorName;
- (NSURL)staticImageURL;
- (NSURL)videoURL;
- (PBUIWallpaperDefaultConfiguration)init;
- (PBUIWallpaperDefaultConfiguration)initWithCoder:(id)a3;
- (PBUIWallpaperGradient)wallpaperGradient;
- (UIColor)wallpaperColor;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)initColorWithColor:(id)a3;
- (id)initColorWithColorName:(id)a3;
- (id)initGradientWithGradient:(id)a3;
- (id)initProceduralWithIdentifier:(id)a3 options:(id)a4;
- (id)initStaticWithImageURL:(id)a3;
- (id)initVideoWithStaticImageURL:(id)a3 videoURL:(id)a4;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int64_t)wallpaperType;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PBUIWallpaperDefaultConfiguration

- (id)initStaticWithImageURL:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PBUIWallpaperDefaultConfiguration;
  v5 = [(PBUIWallpaperDefaultConfiguration *)&v10 init];
  v6 = v5;
  if (v5)
  {
    v5->_wallpaperType = 1;
    uint64_t v7 = [v4 copy];
    staticImageURL = v6->_staticImageURL;
    v6->_staticImageURL = (NSURL *)v7;
  }
  return v6;
}

- (id)initVideoWithStaticImageURL:(id)a3 videoURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)PBUIWallpaperDefaultConfiguration;
  v8 = [(PBUIWallpaperDefaultConfiguration *)&v15 init];
  v9 = v8;
  if (v8)
  {
    v8->_wallpaperType = 3;
    uint64_t v10 = [v6 copy];
    staticImageURL = v9->_staticImageURL;
    v9->_staticImageURL = (NSURL *)v10;

    uint64_t v12 = [v7 copy];
    videoURL = v9->_videoURL;
    v9->_videoURL = (NSURL *)v12;
  }
  return v9;
}

- (id)initProceduralWithIdentifier:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)PBUIWallpaperDefaultConfiguration;
  v8 = [(PBUIWallpaperDefaultConfiguration *)&v15 init];
  v9 = v8;
  if (v8)
  {
    v8->_wallpaperType = 2;
    uint64_t v10 = [v6 copy];
    proceduralWallpaperIdentifier = v9->_proceduralWallpaperIdentifier;
    v9->_proceduralWallpaperIdentifier = (NSString *)v10;

    uint64_t v12 = [v7 copy];
    proceduralWallpaperOptions = v9->_proceduralWallpaperOptions;
    v9->_proceduralWallpaperOptions = (NSDictionary *)v12;
  }
  return v9;
}

- (id)initColorWithColor:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PBUIWallpaperDefaultConfiguration;
  v5 = [(PBUIWallpaperDefaultConfiguration *)&v10 init];
  id v6 = v5;
  if (v5)
  {
    v5->_wallpaperType = 4;
    uint64_t v7 = [v4 copy];
    wallpaperColor = v6->_wallpaperColor;
    v6->_wallpaperColor = (UIColor *)v7;
  }
  return v6;
}

- (id)initColorWithColorName:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PBUIWallpaperDefaultConfiguration;
  v5 = [(PBUIWallpaperDefaultConfiguration *)&v10 init];
  id v6 = v5;
  if (v5)
  {
    v5->_wallpaperType = 4;
    uint64_t v7 = [v4 copy];
    wallpaperColorName = v6->_wallpaperColorName;
    v6->_wallpaperColorName = (NSString *)v7;
  }
  return v6;
}

- (id)initGradientWithGradient:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PBUIWallpaperDefaultConfiguration;
  v5 = [(PBUIWallpaperDefaultConfiguration *)&v10 init];
  id v6 = v5;
  if (v5)
  {
    v5->_wallpaperType = 5;
    uint64_t v7 = [v4 copy];
    wallpaperGradient = v6->_wallpaperGradient;
    v6->_wallpaperGradient = (PBUIWallpaperGradient *)v7;
  }
  return v6;
}

- (PBUIWallpaperDefaultConfiguration)init
{
  v3.receiver = self;
  v3.super_class = (Class)PBUIWallpaperDefaultConfiguration;
  result = [(PBUIWallpaperDefaultConfiguration *)&v3 init];
  if (result) {
    result->_wallpaperType = 0;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PBUIWallpaperDefaultConfiguration *)a3;
  if (self == v4)
  {
    char v29 = 1;
  }
  else
  {
    v5 = self;
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      uint64_t v7 = v4;
      int64_t v8 = [(PBUIWallpaperDefaultConfiguration *)self wallpaperType];
      if (v8 != [(PBUIWallpaperDefaultConfiguration *)v7 wallpaperType]) {
        goto LABEL_13;
      }
      v9 = [(PBUIWallpaperDefaultConfiguration *)self staticImageURL];
      objc_super v10 = [(PBUIWallpaperDefaultConfiguration *)v7 staticImageURL];
      int v11 = BSEqualObjects();

      if (!v11) {
        goto LABEL_13;
      }
      uint64_t v12 = [(PBUIWallpaperDefaultConfiguration *)self videoURL];
      v13 = [(PBUIWallpaperDefaultConfiguration *)v7 videoURL];
      int v14 = BSEqualObjects();

      if (!v14) {
        goto LABEL_13;
      }
      objc_super v15 = [(PBUIWallpaperDefaultConfiguration *)self proceduralWallpaperIdentifier];
      v16 = [(PBUIWallpaperDefaultConfiguration *)v7 proceduralWallpaperIdentifier];
      int v17 = BSEqualObjects();

      if (!v17) {
        goto LABEL_13;
      }
      v18 = [(PBUIWallpaperDefaultConfiguration *)self proceduralWallpaperOptions];
      v19 = [(PBUIWallpaperDefaultConfiguration *)v7 proceduralWallpaperOptions];
      int v20 = BSEqualObjects();

      if (!v20) {
        goto LABEL_13;
      }
      v21 = [(PBUIWallpaperDefaultConfiguration *)self wallpaperColor];
      v22 = [(PBUIWallpaperDefaultConfiguration *)v7 wallpaperColor];
      int v23 = BSEqualObjects();

      if (!v23) {
        goto LABEL_13;
      }
      v24 = [(PBUIWallpaperDefaultConfiguration *)self wallpaperColorName];
      v25 = [(PBUIWallpaperDefaultConfiguration *)v7 wallpaperColorName];
      int v26 = BSEqualObjects();

      if (v26)
      {
        v27 = [(PBUIWallpaperDefaultConfiguration *)self wallpaperGradient];
        v28 = [(PBUIWallpaperDefaultConfiguration *)v7 wallpaperGradient];
        char v29 = BSEqualObjects();
      }
      else
      {
LABEL_13:
        char v29 = 0;
      }
    }
    else
    {
      char v29 = 0;
    }
  }

  return v29;
}

- (unint64_t)hash
{
  int64_t v3 = [(PBUIWallpaperDefaultConfiguration *)self wallpaperType];
  id v4 = [(PBUIWallpaperDefaultConfiguration *)self staticImageURL];
  uint64_t v5 = [v4 hash] + v3;
  id v6 = [(PBUIWallpaperDefaultConfiguration *)self videoURL];
  uint64_t v7 = [v6 hash];
  int64_t v8 = [(PBUIWallpaperDefaultConfiguration *)self proceduralWallpaperIdentifier];
  uint64_t v9 = v5 + v7 + [v8 hash];
  objc_super v10 = [(PBUIWallpaperDefaultConfiguration *)self proceduralWallpaperOptions];
  uint64_t v11 = [v10 hash];
  uint64_t v12 = [(PBUIWallpaperDefaultConfiguration *)self wallpaperColor];
  uint64_t v13 = v11 + [v12 hash];
  int v14 = [(PBUIWallpaperDefaultConfiguration *)self wallpaperColorName];
  uint64_t v15 = v9 + v13 + [v14 hash];
  v16 = [(PBUIWallpaperDefaultConfiguration *)self wallpaperGradient];
  unint64_t v17 = v15 + [v16 hash];

  return v17;
}

- (NSString)description
{
  return (NSString *)[(PBUIWallpaperDefaultConfiguration *)self descriptionWithMultilinePrefix:@"\t"];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  int64_t v3 = [(PBUIWallpaperDefaultConfiguration *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  uint64_t v5 = PBUIStringForWallpaperType([(PBUIWallpaperDefaultConfiguration *)self wallpaperType]);
  id v6 = (id)[v4 appendObject:v5 withName:@"wallpaperType"];

  uint64_t v7 = [(PBUIWallpaperDefaultConfiguration *)self staticImageURL];
  id v8 = (id)[v4 appendObject:v7 withName:@"staticImageURL"];

  uint64_t v9 = [(PBUIWallpaperDefaultConfiguration *)self videoURL];
  id v10 = (id)[v4 appendObject:v9 withName:@"videoURL"];

  uint64_t v11 = [(PBUIWallpaperDefaultConfiguration *)self proceduralWallpaperIdentifier];
  id v12 = (id)[v4 appendObject:v11 withName:@"proceduralWallpaperIdentifier"];

  uint64_t v13 = [(PBUIWallpaperDefaultConfiguration *)self proceduralWallpaperOptions];
  id v14 = (id)[v4 appendObject:v13 withName:@"proceduralWallpaperOptions"];

  uint64_t v15 = [(PBUIWallpaperDefaultConfiguration *)self wallpaperColor];
  id v16 = (id)[v4 appendObject:v15 withName:@"wallpaperColor"];

  unint64_t v17 = [(PBUIWallpaperDefaultConfiguration *)self wallpaperColorName];
  id v18 = (id)[v4 appendObject:v17 withName:@"wallpaperColorName"];

  v19 = [(PBUIWallpaperDefaultConfiguration *)self wallpaperGradient];
  id v20 = (id)[v4 appendObject:v19 withName:@"wallpaperGradient"];

  return v4;
}

- (id)succinctDescription
{
  v2 = [(PBUIWallpaperDefaultConfiguration *)self succinctDescriptionBuilder];
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
  id v4 = a3;
  uint64_t v5 = PBUIStringForWallpaperType([(PBUIWallpaperDefaultConfiguration *)self wallpaperType]);
  [v4 encodeObject:v5 forKey:@"wallpaperType"];

  id v6 = [(PBUIWallpaperDefaultConfiguration *)self staticImageURL];
  [v4 encodeObject:v6 forKey:@"staticImageURL"];

  uint64_t v7 = [(PBUIWallpaperDefaultConfiguration *)self videoURL];
  [v4 encodeObject:v7 forKey:@"videoURL"];

  id v8 = [(PBUIWallpaperDefaultConfiguration *)self proceduralWallpaperIdentifier];
  [v4 encodeObject:v8 forKey:@"proceduralWallpaperIdentifier"];

  uint64_t v9 = [(PBUIWallpaperDefaultConfiguration *)self proceduralWallpaperOptions];
  [v4 encodeObject:v9 forKey:@"proceduralWallpaperOptions"];

  id v10 = [(PBUIWallpaperDefaultConfiguration *)self wallpaperColor];
  [v4 encodeObject:v10 forKey:@"wallpaperColor"];

  uint64_t v11 = [(PBUIWallpaperDefaultConfiguration *)self wallpaperColorName];
  [v4 encodeObject:v11 forKey:@"wallpaperColorName"];

  id v12 = [(PBUIWallpaperDefaultConfiguration *)self wallpaperGradient];
  [v4 encodeObject:v12 forKey:@"wallpaperGradient"];
}

- (PBUIWallpaperDefaultConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)PBUIWallpaperDefaultConfiguration;
  uint64_t v5 = [(PBUIWallpaperDefaultConfiguration *)&v30 init];
  if (v5)
  {
    id v6 = self;
    uint64_t v7 = [v4 decodeObjectOfClass:v6 forKey:@"wallpaperType"];
    v5->_wallpaperType = PBUIWallpaperTypeForString(v7);

    id v8 = self;
    uint64_t v9 = [v4 decodeObjectOfClass:v8 forKey:@"staticImageURL"];
    staticImageURL = v5->_staticImageURL;
    v5->_staticImageURL = (NSURL *)v9;

    uint64_t v11 = self;
    uint64_t v12 = [v4 decodeObjectOfClass:v11 forKey:@"videoURL"];
    videoURL = v5->_videoURL;
    v5->_videoURL = (NSURL *)v12;

    id v14 = self;
    uint64_t v15 = [v4 decodeObjectOfClass:v14 forKey:@"proceduralWallpaperIdentifier"];
    proceduralWallpaperIdentifier = v5->_proceduralWallpaperIdentifier;
    v5->_proceduralWallpaperIdentifier = (NSString *)v15;

    unint64_t v17 = self;
    uint64_t v18 = [v4 decodeObjectOfClass:v17 forKey:@"wallpaperThumbnailImageData"];
    proceduralWallpaperOptions = v5->_proceduralWallpaperOptions;
    v5->_proceduralWallpaperOptions = (NSDictionary *)v18;

    id v20 = self;
    uint64_t v21 = [v4 decodeObjectOfClass:v20 forKey:@"wallpaperColor"];
    wallpaperColor = v5->_wallpaperColor;
    v5->_wallpaperColor = (UIColor *)v21;

    int v23 = self;
    uint64_t v24 = [v4 decodeObjectOfClass:v23 forKey:@"wallpaperColorName"];
    wallpaperColorName = v5->_wallpaperColorName;
    v5->_wallpaperColorName = (NSString *)v24;

    int v26 = self;
    uint64_t v27 = [v4 decodeObjectOfClass:v26 forKey:@"wallpaperGradient"];
    wallpaperGradient = v5->_wallpaperGradient;
    v5->_wallpaperGradient = (PBUIWallpaperGradient *)v27;
  }
  return v5;
}

- (int64_t)wallpaperType
{
  return self->_wallpaperType;
}

- (NSURL)staticImageURL
{
  return self->_staticImageURL;
}

- (NSURL)videoURL
{
  return self->_videoURL;
}

- (NSString)proceduralWallpaperIdentifier
{
  return self->_proceduralWallpaperIdentifier;
}

- (NSDictionary)proceduralWallpaperOptions
{
  return self->_proceduralWallpaperOptions;
}

- (UIColor)wallpaperColor
{
  return self->_wallpaperColor;
}

- (NSString)wallpaperColorName
{
  return self->_wallpaperColorName;
}

- (PBUIWallpaperGradient)wallpaperGradient
{
  return self->_wallpaperGradient;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wallpaperGradient, 0);
  objc_storeStrong((id *)&self->_wallpaperColorName, 0);
  objc_storeStrong((id *)&self->_wallpaperColor, 0);
  objc_storeStrong((id *)&self->_proceduralWallpaperOptions, 0);
  objc_storeStrong((id *)&self->_proceduralWallpaperIdentifier, 0);
  objc_storeStrong((id *)&self->_videoURL, 0);
  objc_storeStrong((id *)&self->_staticImageURL, 0);
}

@end