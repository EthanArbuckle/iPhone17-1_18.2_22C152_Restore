@interface ICPreviewDeviceInfo
+ (id)previewDeviceInfoForPreviewImage:(id)a3;
- (BOOL)isEqual:(id)a3;
- (ICAppearanceInfo)appearanceInfo;
- (ICPreviewDeviceInfo)init;
- (ICPreviewDeviceInfo)initWithImageSize:(double)a3 scale:(double)a4;
- (ICPreviewDeviceInfo)initWithImageSize:(double)a3 scale:(double)a4 appearanceInfo:(id)a5;
- (double)imageSize;
- (double)scale;
- (id)description;
- (id)deviceInfoFromAddingAppearanceInfo:(id)a3;
- (unint64_t)hash;
- (void)setAppearanceInfo:(id)a3;
- (void)setImageSize:(double)a3;
- (void)setScale:(double)a3;
@end

@implementation ICPreviewDeviceInfo

- (ICPreviewDeviceInfo)init
{
  return 0;
}

- (ICPreviewDeviceInfo)initWithImageSize:(double)a3 scale:(double)a4
{
  v9.receiver = self;
  v9.super_class = (Class)ICPreviewDeviceInfo;
  v6 = [(ICPreviewDeviceInfo *)&v9 init];
  v7 = v6;
  if (v6)
  {
    [(ICPreviewDeviceInfo *)v6 setImageSize:a3];
    [(ICPreviewDeviceInfo *)v7 setScale:a4];
  }
  return v7;
}

- (ICPreviewDeviceInfo)initWithImageSize:(double)a3 scale:(double)a4 appearanceInfo:(id)a5
{
  id v8 = a5;
  objc_super v9 = [(ICPreviewDeviceInfo *)self initWithImageSize:a3 scale:a4];
  v10 = v9;
  if (v9) {
    [(ICPreviewDeviceInfo *)v9 setAppearanceInfo:v8];
  }

  return v10;
}

- (id)deviceInfoFromAddingAppearanceInfo:(id)a3
{
  id v4 = a3;
  v5 = [ICPreviewDeviceInfo alloc];
  [(ICPreviewDeviceInfo *)self imageSize];
  double v7 = v6;
  [(ICPreviewDeviceInfo *)self scale];
  objc_super v9 = [(ICPreviewDeviceInfo *)v5 initWithImageSize:v4 scale:v7 appearanceInfo:v8];

  return v9;
}

- (id)description
{
  v3 = NSString;
  [(ICPreviewDeviceInfo *)self imageSize];
  uint64_t v5 = v4;
  [(ICPreviewDeviceInfo *)self scale];
  uint64_t v7 = v6;
  double v8 = [(ICPreviewDeviceInfo *)self appearanceInfo];
  objc_super v9 = objc_msgSend(v3, "stringWithFormat:", @"size %f scale %f appearanceType %d", v5, v7, objc_msgSend(v8, "type"));

  return v9;
}

+ (id)previewDeviceInfoForPreviewImage:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    uint64_t v4 = [ICPreviewDeviceInfo alloc];
    [v3 size];
    double v6 = v5;
    [v3 scale];
    double v8 = v7;
    int v9 = [v3 appearanceType];

    v10 = +[ICAppearanceInfo appearanceInfoWithType:v9];
    v11 = [(ICPreviewDeviceInfo *)v4 initWithImageSize:v10 scale:v6 appearanceInfo:v8];
  }
  else
  {
    v11 = 0;
  }
  return v11;
}

- (unint64_t)hash
{
  unint64_t result = self->_hash;
  if (!result)
  {
    [(ICPreviewDeviceInfo *)self scale];
    uint64_t v5 = (unint64_t)v4;
    [(ICPreviewDeviceInfo *)self imageSize];
    unint64_t v7 = (unint64_t)v6;
    double v8 = [(ICPreviewDeviceInfo *)self appearanceInfo];
    [v8 hash];
    self->_hash = ICHashWithHashKeys(v5, v9, v10, v11, v12, v13, v14, v15, v7);

    return self->_hash;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  uint64_t v5 = ICDynamicCast();

  if (v5
    && ((-[ICPreviewDeviceInfo imageSize](self, "imageSize"), double v7 = v6, [v5 imageSize], v7 == v8)
     || vabdd_f64(v7, v8) < fabs(v8 * 0.000000999999997))
    && (-[ICPreviewDeviceInfo scale](self, "scale"), double v10 = v9, [v5 scale], v10 == v11))
  {
    uint64_t v12 = [(ICPreviewDeviceInfo *)self appearanceInfo];
    uint64_t v13 = [v5 appearanceInfo];
    char v14 = [v12 isEqual:v13];
  }
  else
  {
    char v14 = 0;
  }

  return v14;
}

- (double)imageSize
{
  return self->_imageSize;
}

- (void)setImageSize:(double)a3
{
  self->_imageSize = a3;
}

- (double)scale
{
  return self->_scale;
}

- (void)setScale:(double)a3
{
  self->_scale = a3;
}

- (ICAppearanceInfo)appearanceInfo
{
  return self->_appearanceInfo;
}

- (void)setAppearanceInfo:(id)a3
{
}

- (void).cxx_destruct
{
}

@end