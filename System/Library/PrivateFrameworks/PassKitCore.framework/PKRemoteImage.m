@interface PKRemoteImage
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToRemoteImage:(id)a3;
- (NSURL)remoteURL;
- (PKRemoteImage)initWithCoder:(id)a3;
- (PKRemoteImage)initWithDictionary:(id)a3;
- (PKRemoteImage)initWithRemoteURL:(id)a3 scaleFactor:(unint64_t)a4;
- (PKRemoteImage)initWithRemoteURL:(id)a3 scaleFactor:(unint64_t)a4 width:(double)a5 height:(double)a6;
- (double)height;
- (double)width;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (unint64_t)scaleFactor;
- (void)encodeWithCoder:(id)a3;
- (void)fetchImageWithCompletion:(id)a3;
- (void)setHeight:(double)a3;
- (void)setRemoteURL:(id)a3;
- (void)setScaleFactor:(unint64_t)a3;
- (void)setWidth:(double)a3;
@end

@implementation PKRemoteImage

- (PKRemoteImage)initWithDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PKRemoteImage;
  v5 = [(PKRemoteImage *)&v12 init];
  if (v5)
  {
    uint64_t v6 = [v4 PKURLForKey:@"url"];
    remoteURL = v5->_remoteURL;
    v5->_remoteURL = (NSURL *)v6;

    v8 = [v4 PKStringForKey:@"scale"];
    v5->_scaleFactor = PKRemoteImageScaleFactorFromString(v8);

    v9 = [v4 PKNumberForKey:@"width"];
    v5->_width = PKRemoteImageDimensionFromValue(v9);

    v10 = [v4 PKNumberForKey:@"height"];
    v5->_height = PKRemoteImageDimensionFromValue(v10);
  }
  return v5;
}

- (PKRemoteImage)initWithRemoteURL:(id)a3 scaleFactor:(unint64_t)a4
{
  return [(PKRemoteImage *)self initWithRemoteURL:a3 scaleFactor:a4 width:-1.79769313e308 height:-1.79769313e308];
}

- (PKRemoteImage)initWithRemoteURL:(id)a3 scaleFactor:(unint64_t)a4 width:(double)a5 height:(double)a6
{
  id v11 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PKRemoteImage;
  objc_super v12 = [(PKRemoteImage *)&v16 init];
  v13 = v12;
  if (v12)
  {
    if (!v11)
    {
      v14 = 0;
      goto LABEL_6;
    }
    objc_storeStrong((id *)&v12->_remoteURL, a3);
    v13->_scaleFactor = a4;
    v13->_width = a5;
    v13->_height = a6;
  }
  v14 = v13;
LABEL_6:

  return v14;
}

- (void)fetchImageWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = (void (**)(void, void))v4;
  if (v4)
  {
    if (self->_remoteURL)
    {
      if (self->_scaleFactor == 3) {
        double v6 = 3.0;
      }
      else {
        double v6 = 2.0;
      }
      v7 = +[PKObjectDownloader sharedImageAssetDownloader];
      v8 = [v7 cachedDataForURL:self->_remoteURL];
      if (v8)
      {
        v9 = [[PKImage alloc] initWithData:v8 scale:v6];
        ((void (**)(void, PKImage *))v5)[2](v5, v9);
      }
      else
      {
        remoteURL = self->_remoteURL;
        v11[0] = MEMORY[0x1E4F143A8];
        v11[1] = 3221225472;
        v11[2] = __42__PKRemoteImage_fetchImageWithCompletion___block_invoke;
        v11[3] = &unk_1E56F3B08;
        objc_super v12 = v5;
        double v13 = v6;
        [v7 downloadFromUrl:remoteURL completionHandler:v11];
      }
    }
    else
    {
      (*((void (**)(id, void))v4 + 2))(v4, 0);
    }
  }
}

void __42__PKRemoteImage_fetchImageWithCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  if (a2 && !a4)
  {
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = a2;
    v7 = [[PKImage alloc] initWithData:v6 scale:*(double *)(a1 + 40)];

    (*(void (**)(uint64_t, PKImage *))(v5 + 16))(v5, v7);
  }
}

- (id)description
{
  v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28E78]), "initWithFormat:", @"<%@: %p; ",
                 objc_opt_class(),
                 self);
  [v3 appendFormat:@"remoteURL: '%@'; ", self->_remoteURL];
  unint64_t scaleFactor = self->_scaleFactor;
  if (scaleFactor > 3) {
    uint64_t v5 = @"unknown";
  }
  else {
    uint64_t v5 = off_1E56F3B28[scaleFactor];
  }
  [v3 appendFormat:@"scale: '%@'; ", v5];
  objc_msgSend(v3, "appendFormat:", @"width: '%f'; ", *(void *)&self->_width);
  objc_msgSend(v3, "appendFormat:", @"height: '%f'; ", *(void *)&self->_height);
  [v3 appendFormat:@">"];
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PKRemoteImage *)a3;
  uint64_t v5 = v4;
  if (self == v4) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PKRemoteImage *)self isEqualToRemoteImage:v5];

  return v6;
}

- (BOOL)isEqualToRemoteImage:(id)a3
{
  id v4 = (double *)a3;
  if (!v4) {
    goto LABEL_13;
  }
  remoteURL = self->_remoteURL;
  BOOL v6 = (NSURL *)*((void *)v4 + 1);
  if (remoteURL) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    if (remoteURL == v6) {
      goto LABEL_10;
    }
LABEL_13:
    BOOL v8 = 0;
    goto LABEL_14;
  }
  if ((-[NSURL isEqual:](remoteURL, "isEqual:") & 1) == 0) {
    goto LABEL_13;
  }
LABEL_10:
  if (self->_scaleFactor != *((void *)v4 + 2) || self->_width != v4[3]) {
    goto LABEL_13;
  }
  BOOL v8 = self->_height == v4[4];
LABEL_14:

  return v8;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 safelyAddObject:self->_remoteURL];
  uint64_t v4 = PKCombinedHash(17, v3);
  unint64_t v5 = self->_scaleFactor - v4 + 32 * v4;
  unint64_t v6 = (unint64_t)self->_width - v5 + 32 * v5;
  unint64_t v7 = (unint64_t)self->_height - v6 + 32 * v6;

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKRemoteImage)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PKRemoteImage;
  unint64_t v5 = [(PKRemoteImage *)&v12 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"url"];
    remoteURL = v5->_remoteURL;
    v5->_remoteURL = (NSURL *)v6;

    BOOL v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"scale"];
    v5->_unint64_t scaleFactor = PKRemoteImageScaleFactorFromString(v8);

    [v4 decodeDoubleForKey:@"width"];
    v5->_width = v9;
    [v4 decodeDoubleForKey:@"height"];
    v5->_height = v10;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  remoteURL = self->_remoteURL;
  id v7 = a3;
  [v7 encodeObject:remoteURL forKey:@"url"];
  unint64_t scaleFactor = self->_scaleFactor;
  if (scaleFactor > 3) {
    uint64_t v6 = @"unknown";
  }
  else {
    uint64_t v6 = off_1E56F3B28[scaleFactor];
  }
  [v7 encodeObject:v6 forKey:@"scale"];
  [v7 encodeDouble:@"width" forKey:self->_width];
  [v7 encodeDouble:@"height" forKey:self->_height];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSURL *)self->_remoteURL copyWithZone:a3];
  id v7 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v6;

  *(void *)(v5 + 16) = self->_scaleFactor;
  *(double *)(v5 + 24) = self->_width;
  *(double *)(v5 + 32) = self->_height;
  return (id)v5;
}

- (NSURL)remoteURL
{
  return self->_remoteURL;
}

- (void)setRemoteURL:(id)a3
{
}

- (unint64_t)scaleFactor
{
  return self->_scaleFactor;
}

- (void)setScaleFactor:(unint64_t)a3
{
  self->_unint64_t scaleFactor = a3;
}

- (double)width
{
  return self->_width;
}

- (void)setWidth:(double)a3
{
  self->_width = a3;
}

- (double)height
{
  return self->_height;
}

- (void)setHeight:(double)a3
{
  self->_height = a3;
}

- (void).cxx_destruct
{
}

@end