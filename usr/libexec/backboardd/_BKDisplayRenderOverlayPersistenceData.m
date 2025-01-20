@interface _BKDisplayRenderOverlayPersistenceData
+ (BOOL)supportsSecureCoding;
+ (id)classesRequiredToDecode;
- (BKSDisplayRenderOverlayDescriptor)descriptor;
- (BOOL)isFrozen;
- (CGImage)image;
- (_BKDisplayRenderOverlayPersistenceData)initWithCoder:(id)a3;
- (float)level;
- (id)_initWithDescriptor:(id)a3 overlayType:(int64_t)a4 imageData:(id)a5 level:(float)a6 frozen:(BOOL)a7;
- (int64_t)overlayType;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setDescriptor:(id)a3;
- (void)setFrozen:(BOOL)a3;
- (void)setImage:(CGImage *)a3;
- (void)setLevel:(float)a3;
- (void)setOverlayType:(int64_t)a3;
@end

@implementation _BKDisplayRenderOverlayPersistenceData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageData, 0);

  objc_storeStrong((id *)&self->_descriptor, 0);
}

- (void)setFrozen:(BOOL)a3
{
  self->_frozen = a3;
}

- (BOOL)isFrozen
{
  return self->_frozen;
}

- (void)setLevel:(float)a3
{
  self->_level = a3;
}

- (float)level
{
  return self->_level;
}

- (CGImage)image
{
  return self->_image;
}

- (void)setDescriptor:(id)a3
{
}

- (BKSDisplayRenderOverlayDescriptor)descriptor
{
  return self->_descriptor;
}

- (void)setOverlayType:(int64_t)a3
{
  self->_overlayType = a3;
}

- (int64_t)overlayType
{
  return self->_overlayType;
}

- (_BKDisplayRenderOverlayPersistenceData)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeIntegerForKey:@"overlayType"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"descriptor"];
  [v4 decodeFloatForKey:@"level"];
  int v8 = v7;
  id v9 = [v4 decodeBoolForKey:@"frozen"];
  v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"imageData2"];

  if (v6) {
    BOOL v12 = v10 == 0;
  }
  else {
    BOOL v12 = 1;
  }
  if (v12)
  {
    v13 = 0;
  }
  else
  {
    LODWORD(v11) = v8;
    self = (_BKDisplayRenderOverlayPersistenceData *)[(_BKDisplayRenderOverlayPersistenceData *)self _initWithDescriptor:v6 overlayType:v5 imageData:v10 level:v9 frozen:v11];
    v13 = self;
  }

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  id v11 = a3;
  *(float *)&double v4 = self->_level;
  [v11 encodeFloat:@"level" forKey:v4];
  [v11 encodeInteger:self->_overlayType forKey:@"overlayType"];
  [v11 encodeBool:self->_frozen forKey:@"frozen"];
  [v11 encodeObject:self->_descriptor forKey:@"descriptor"];
  id v5 = v11;
  imageData = self->_imageData;
  if (imageData) {
    goto LABEL_2;
  }
  image = self->_image;
  if (image)
  {
    int v8 = +[NSMutableData data];
    id v9 = CGImageDestinationCreateWithData(v8, @"public.png", 1uLL, 0);
    CGImageDestinationAddImage(v9, image, 0);
    if (!CGImageDestinationFinalize(v9))
    {

      int v8 = 0;
    }
    CFRelease(v9);
    v10 = self->_imageData;
    self->_imageData = (NSData *)v8;

    imageData = self->_imageData;
    id v5 = v11;
    if (imageData)
    {
LABEL_2:
      [v11 encodeObject:imageData forKey:@"imageData2"];
      id v5 = v11;
    }
  }
}

- (void)setImage:(CGImage *)a3
{
  image = self->_image;
  if (image != a3)
  {
    if (image)
    {
      CGImageRelease(image);
      imageData = self->_imageData;
      self->_imageData = 0;
    }
    self->_image = CGImageRetain(a3);
  }
}

- (void)dealloc
{
  self->_overlayType = 0;
  image = self->_image;
  if (image) {
    CGImageRelease(image);
  }
  v4.receiver = self;
  v4.super_class = (Class)_BKDisplayRenderOverlayPersistenceData;
  [(_BKDisplayRenderOverlayPersistenceData *)&v4 dealloc];
}

- (id)_initWithDescriptor:(id)a3 overlayType:(int64_t)a4 imageData:(id)a5 level:(float)a6 frozen:(BOOL)a7
{
  id v13 = a3;
  CFDataRef v14 = (const __CFData *)a5;
  v20.receiver = self;
  v20.super_class = (Class)_BKDisplayRenderOverlayPersistenceData;
  v15 = [(_BKDisplayRenderOverlayPersistenceData *)&v20 init];
  v16 = v15;
  if (v15)
  {
    v15->_level = a6;
    v15->_overlayType = a4;
    objc_storeStrong((id *)&v15->_descriptor, a3);
    v17 = CGDataProviderCreateWithCFData(v14);
    CGImageRef v18 = CGImageCreateWithPNGDataProvider(v17, 0, 0, kCGRenderingIntentDefault);
    CGDataProviderRelease(v17);
    CFAutorelease(v18);
    v16->_image = v18;
    CFRetain(v18);
    objc_storeStrong((id *)&v16->_imageData, a5);
    v16->_frozen = a7;
  }

  return v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)classesRequiredToDecode
{
  v2 = +[BKSDisplayRenderOverlayDescriptor _classesRequiredToDecode];
  v3 = +[NSMutableSet setWithSet:v2];

  [v3 addObject:objc_opt_class()];

  return v3;
}

@end