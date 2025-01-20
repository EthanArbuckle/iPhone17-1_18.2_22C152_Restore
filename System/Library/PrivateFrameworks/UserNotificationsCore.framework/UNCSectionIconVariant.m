@interface UNCSectionIconVariant
+ (BOOL)supportsSecureCoding;
+ (id)variantWithFormat:(int64_t)a3 applicationIdentifier:(id)a4;
+ (id)variantWithFormat:(int64_t)a3 imageData:(id)a4;
+ (id)variantWithFormat:(int64_t)a3 imageName:(id)a4 inBundle:(id)a5;
+ (id)variantWithFormat:(int64_t)a3 imageName:(id)a4 inBundleAtPath:(id)a5;
+ (id)variantWithFormat:(int64_t)a3 imagePath:(id)a4;
+ (id)variantWithFormat:(int64_t)a3 systemImageName:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPrecomposed;
- (NSData)imageData;
- (NSString)applicationIdentifier;
- (NSString)bundlePath;
- (NSString)imageName;
- (NSString)imagePath;
- (NSString)systemImageName;
- (UNCSectionIconVariant)initWithCoder:(id)a3;
- (UNCSectionIconVariant)initWithFormat:(int64_t)a3 imageInfo:(id)a4 imageInfoType:(int64_t)a5 bundlePath:(id)a6 precomposed:(BOOL)a7;
- (id)_processImageInfo:(id)a3 imageInfoType:(int64_t)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)format;
- (unint64_t)hash;
- (void)_setImageInfo:(id)a3 ofType:(int64_t)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setApplicationIdentifier:(id)a3;
- (void)setBundlePath:(id)a3;
- (void)setFormat:(int64_t)a3;
- (void)setImageData:(id)a3;
- (void)setImageName:(id)a3;
- (void)setImagePath:(id)a3;
- (void)setPrecomposed:(BOOL)a3;
- (void)setSystemImageName:(id)a3;
@end

@implementation UNCSectionIconVariant

+ (id)variantWithFormat:(int64_t)a3 imageData:(id)a4
{
  id v5 = a4;
  v6 = [[UNCSectionIconVariant alloc] initWithFormat:a3 imageInfo:v5 imageInfoType:1 bundlePath:0 precomposed:0];

  return v6;
}

+ (id)variantWithFormat:(int64_t)a3 applicationIdentifier:(id)a4
{
  id v5 = a4;
  v6 = [[UNCSectionIconVariant alloc] initWithFormat:a3 imageInfo:v5 imageInfoType:4 bundlePath:0 precomposed:0];

  return v6;
}

+ (id)variantWithFormat:(int64_t)a3 imagePath:(id)a4
{
  id v5 = a4;
  v6 = [[UNCSectionIconVariant alloc] initWithFormat:a3 imageInfo:v5 imageInfoType:2 bundlePath:0 precomposed:0];

  return v6;
}

+ (id)variantWithFormat:(int64_t)a3 imageName:(id)a4 inBundle:(id)a5
{
  id v8 = a4;
  v9 = [a5 bundlePath];
  v10 = [a1 variantWithFormat:a3 imageName:v8 inBundleAtPath:v9];

  return v10;
}

+ (id)variantWithFormat:(int64_t)a3 imageName:(id)a4 inBundleAtPath:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  v9 = [[UNCSectionIconVariant alloc] initWithFormat:a3 imageInfo:v8 imageInfoType:3 bundlePath:v7 precomposed:0];

  return v9;
}

+ (id)variantWithFormat:(int64_t)a3 systemImageName:(id)a4
{
  id v5 = a4;
  v6 = [[UNCSectionIconVariant alloc] initWithFormat:a3 imageInfo:v5 imageInfoType:5 bundlePath:0 precomposed:0];

  return v6;
}

- (NSData)imageData
{
  if (self->_imageInfoType == 1)
  {
    id imageInfo = self->_imageInfo;
    uint64_t v3 = objc_opt_class();
    id v4 = imageInfo;
    if (v3)
    {
      if (objc_opt_isKindOfClass()) {
        id v5 = v4;
      }
      else {
        id v5 = 0;
      }
    }
    else
    {
      id v5 = 0;
    }
    id v6 = v5;
  }
  else
  {
    id v6 = 0;
  }

  return (NSData *)v6;
}

- (void)setImageData:(id)a3
{
}

- (NSString)imagePath
{
  if (self->_imageInfoType == 2)
  {
    id imageInfo = self->_imageInfo;
    uint64_t v3 = objc_opt_class();
    id v4 = imageInfo;
    if (v3)
    {
      if (objc_opt_isKindOfClass()) {
        id v5 = v4;
      }
      else {
        id v5 = 0;
      }
    }
    else
    {
      id v5 = 0;
    }
    id v6 = v5;
  }
  else
  {
    id v6 = 0;
  }

  return (NSString *)v6;
}

- (void)setImagePath:(id)a3
{
}

- (NSString)imageName
{
  if (self->_imageInfoType == 3)
  {
    id imageInfo = self->_imageInfo;
    uint64_t v3 = objc_opt_class();
    id v4 = imageInfo;
    if (v3)
    {
      if (objc_opt_isKindOfClass()) {
        id v5 = v4;
      }
      else {
        id v5 = 0;
      }
    }
    else
    {
      id v5 = 0;
    }
    id v6 = v5;
  }
  else
  {
    id v6 = 0;
  }

  return (NSString *)v6;
}

- (void)setImageName:(id)a3
{
}

- (NSString)applicationIdentifier
{
  if (self->_imageInfoType == 4)
  {
    id imageInfo = self->_imageInfo;
    uint64_t v3 = objc_opt_class();
    id v4 = imageInfo;
    if (v3)
    {
      if (objc_opt_isKindOfClass()) {
        id v5 = v4;
      }
      else {
        id v5 = 0;
      }
    }
    else
    {
      id v5 = 0;
    }
    id v6 = v5;
  }
  else
  {
    id v6 = 0;
  }

  return (NSString *)v6;
}

- (void)setApplicationIdentifier:(id)a3
{
}

- (NSString)systemImageName
{
  if (self->_imageInfoType == 5)
  {
    id imageInfo = self->_imageInfo;
    uint64_t v3 = objc_opt_class();
    id v4 = imageInfo;
    if (v3)
    {
      if (objc_opt_isKindOfClass()) {
        id v5 = v4;
      }
      else {
        id v5 = 0;
      }
    }
    else
    {
      id v5 = 0;
    }
    id v6 = v5;
  }
  else
  {
    id v6 = 0;
  }

  return (NSString *)v6;
}

- (void)setSystemImageName:(id)a3
{
}

- (unint64_t)hash
{
  int64_t v3 = [(UNCSectionIconVariant *)self format];
  uint64_t v4 = [self->_imageInfo hash] ^ v3 ^ self->_imageInfoType;
  id v5 = [(UNCSectionIconVariant *)self bundlePath];
  uint64_t v6 = [v5 hash];
  unint64_t v7 = v4 ^ v6 ^ [(UNCSectionIconVariant *)self isPrecomposed];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (UNCSectionIconVariant *)a3;
  if (self == v4)
  {
    LOBYTE(v10) = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      int64_t v6 = [(UNCSectionIconVariant *)self format];
      if (v6 == [(UNCSectionIconVariant *)v5 format]
        && BSEqualObjects()
        && self->_imageInfoType == v5->_imageInfoType)
      {
        unint64_t v7 = [(UNCSectionIconVariant *)self bundlePath];
        id v8 = [(UNCSectionIconVariant *)v5 bundlePath];
        if (BSEqualObjects())
        {
          BOOL v9 = [(UNCSectionIconVariant *)self isPrecomposed];
          BOOL v10 = v9 ^ [(UNCSectionIconVariant *)v5 isPrecomposed] ^ 1;
        }
        else
        {
          LOBYTE(v10) = 0;
        }
      }
      else
      {
        LOBYTE(v10) = 0;
      }
    }
    else
    {
      LOBYTE(v10) = 0;
    }
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  id imageInfo = self->_imageInfo;
  int64_t imageInfoType = self->_imageInfoType;
  int64_t format = self->_format;
  bundlePath = self->_bundlePath;
  BOOL precomposed = self->_precomposed;

  return (id)[v4 initWithFormat:format imageInfo:imageInfo imageInfoType:imageInfoType bundlePath:bundlePath precomposed:precomposed];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UNCSectionIconVariant)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(UNCSectionIconVariant *)self init];
  if (v5)
  {
    if ([v4 decodeIntegerForKey:@"codingVersion"] == 2)
    {
      v5->_int64_t imageInfoType = [v4 decodeIntegerForKey:@"imageInfoType"];
      uint64_t v6 = [v4 decodeObjectOfClass:(id)objc_opt_class() forKey:@"imageInfo"];
      id imageInfo = v5->_imageInfo;
      v5->_id imageInfo = (id)v6;
    }
    else
    {
      id imageInfo = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"imageData"];
      if (imageInfo) {
        [(UNCSectionIconVariant *)v5 setImageData:imageInfo];
      }
      id v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"imagePath"];
      if (v8) {
        [(UNCSectionIconVariant *)v5 setImageName:v8];
      }
      BOOL v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"applicationIdentifier"];
      if (v8) {
        [(UNCSectionIconVariant *)v5 setApplicationIdentifier:v9];
      }
    }
    v5->_int64_t format = [v4 decodeIntegerForKey:@"format"];
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundlePath"];
    bundlePath = v5->_bundlePath;
    v5->_bundlePath = (NSString *)v10;

    v5->_BOOL precomposed = [v4 decodeBoolForKey:@"precomposed"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeInteger:2 forKey:@"codingVersion"];
  [v4 encodeInteger:self->_format forKey:@"format"];
  [v4 encodeInteger:self->_imageInfoType forKey:@"imageInfoType"];
  [v4 encodeObject:self->_imageInfo forKey:@"imageInfo"];
  [v4 encodeObject:self->_bundlePath forKey:@"bundlePath"];
  [v4 encodeBool:self->_precomposed forKey:@"precomposed"];
}

- (UNCSectionIconVariant)initWithFormat:(int64_t)a3 imageInfo:(id)a4 imageInfoType:(int64_t)a5 bundlePath:(id)a6 precomposed:(BOOL)a7
{
  id v12 = a4;
  id v13 = a6;
  v21.receiver = self;
  v21.super_class = (Class)UNCSectionIconVariant;
  v14 = [(UNCSectionIconVariant *)&v21 init];
  v15 = v14;
  if (v14)
  {
    v14->_int64_t format = a3;
    uint64_t v16 = [(UNCSectionIconVariant *)v14 _processImageInfo:v12 imageInfoType:a5];
    id imageInfo = v15->_imageInfo;
    v15->_id imageInfo = (id)v16;

    v15->_int64_t imageInfoType = a5;
    uint64_t v18 = [v13 copy];
    bundlePath = v15->_bundlePath;
    v15->_bundlePath = (NSString *)v18;

    v15->_BOOL precomposed = a7;
  }

  return v15;
}

- (id)_processImageInfo:(id)a3 imageInfoType:(int64_t)a4
{
  id v6 = a3;
  unint64_t v7 = v6;
  id v8 = v6;
  if (a4 == 1)
  {
    BOOL v9 = (void *)[v6 copy];
    uint64_t v10 = [self unc_objectCache];
    id v8 = [v10 cacheObject:v9];
  }

  return v8;
}

- (void)_setImageInfo:(id)a3 ofType:(int64_t)a4
{
  id v6 = a3;
  if (v6)
  {
    self->_int64_t imageInfoType = a4;
    unint64_t v7 = [(UNCSectionIconVariant *)self _processImageInfo:v6 imageInfoType:a4];
    id imageInfo = self->_imageInfo;
    self->_id imageInfo = v7;
  }
  else
  {
    if (self->_imageInfoType != a4) {
      goto LABEL_6;
    }
    id imageInfo = self->_imageInfo;
    self->_id imageInfo = 0;
    self->_int64_t imageInfoType = 0;
  }

LABEL_6:

  MEMORY[0x270F9A758]();
}

- (int64_t)format
{
  return self->_format;
}

- (void)setFormat:(int64_t)a3
{
  self->_int64_t format = a3;
}

- (NSString)bundlePath
{
  return self->_bundlePath;
}

- (void)setBundlePath:(id)a3
{
}

- (BOOL)isPrecomposed
{
  return self->_precomposed;
}

- (void)setPrecomposed:(BOOL)a3
{
  self->_BOOL precomposed = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundlePath, 0);

  objc_storeStrong(&self->_imageInfo, 0);
}

@end