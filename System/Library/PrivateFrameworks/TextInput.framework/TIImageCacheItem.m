@interface TIImageCacheItem
+ (BOOL)supportsSecureCoding;
+ (id)cacheItemWithSize:(CGSize)a3 format:(unsigned __int8)a4 formatColor:(CGColor *)a5 scale:(double)a6 data:(id)a7;
+ (id)cacheItemWithSize:(CGSize)a3 format:(unsigned __int8)a4 formatColor:(CGColor *)a5 scale:(double)a6 data:(id)a7 dataReleaseHandler:(id)a8;
- (CGColor)formatColor;
- (CGSize)size;
- (NSData)data;
- (TIImageCacheItem)initWithCoder:(id)a3;
- (double)scale;
- (id)dataReleaseHandler;
- (unsigned)format;
- (void)_callDataReleaseHandler;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setData:(id)a3;
- (void)setDataReleaseHandler:(id)a3;
- (void)setFormat:(unsigned __int8)a3;
- (void)setFormatColor:(CGColor *)a3;
- (void)setScale:(double)a3;
- (void)setSize:(CGSize)a3;
@end

@implementation TIImageCacheItem

- (void).cxx_destruct
{
  objc_storeStrong(&self->_dataReleaseHandler, 0);

  objc_storeStrong((id *)&self->_data, 0);
}

- (void)setDataReleaseHandler:(id)a3
{
}

- (id)dataReleaseHandler
{
  return self->_dataReleaseHandler;
}

- (void)setData:(id)a3
{
}

- (NSData)data
{
  return self->_data;
}

- (void)setFormatColor:(CGColor *)a3
{
  self->_formatColor = a3;
}

- (CGColor)formatColor
{
  return self->_formatColor;
}

- (void)setFormat:(unsigned __int8)a3
{
  self->_format = a3;
}

- (unsigned)format
{
  return self->_format;
}

- (void)setScale:(double)a3
{
  self->_scale = a3;
}

- (double)scale
{
  return self->_scale;
}

- (void)setSize:(CGSize)a3
{
  self->_size = a3;
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  v4 = [MEMORY[0x1E4F29238] valueWithBytes:&self->_size objCType:"{CGSize=dd}"];
  [v6 encodeObject:v4 forKey:@"size"];
  [v6 encodeDouble:@"scale" forKey:self->_scale];
  [v6 encodeInteger:self->_format forKey:@"format"];
  if (self->_formatColor)
  {
    [v6 encodeBool:1 forKey:@"hasFormatColor"];
    Components = CGColorGetComponents(self->_formatColor);
    [v6 encodeDouble:@"formatColor_0" forKey:*Components];
    [v6 encodeDouble:@"formatColor_1" forKey:Components[1]];
    [v6 encodeDouble:@"formatColor_2" forKey:Components[2]];
    [v6 encodeDouble:@"formatColor_3" forKey:Components[3]];
  }
  [v6 encodeObject:self->_data forKey:@"data"];
}

- (TIImageCacheItem)initWithCoder:(id)a3
{
  components[4] = *(CGFloat *)MEMORY[0x1E4F143B8];
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)TIImageCacheItem;
  v5 = [(TIImageCacheItem *)&v18 init];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"size"];
    v7 = v6;
    if (v6 && (id v8 = objc_retainAutorelease(v6), !strcmp((const char *)[v8 objCType], "{CGSize=dd}"))) {
      [v8 getValue:&v5->_size];
    }
    else {
      v5->_size = (CGSize)*MEMORY[0x1E4F1DB30];
    }
    [v4 decodeDoubleForKey:@"scale"];
    v5->_scale = v9;
    v5->_format = [v4 decodeIntegerForKey:@"format"];
    if ([v4 decodeBoolForKey:@"hasFormatColor"])
    {
      [v4 decodeDoubleForKey:@"formatColor_0"];
      components[0] = v10;
      [v4 decodeDoubleForKey:@"formatColor_1"];
      components[1] = v11;
      [v4 decodeDoubleForKey:@"formatColor_2"];
      components[2] = v12;
      [v4 decodeDoubleForKey:@"formatColor_3"];
      components[3] = v13;
      DeviceRGB = CGColorSpaceCreateDeviceRGB();
      v5->_formatColor = CGColorCreate(DeviceRGB, components);
      CGColorSpaceRelease(DeviceRGB);
    }
    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"data"];
    data = v5->_data;
    v5->_data = (NSData *)v15;
  }
  return v5;
}

- (void)_callDataReleaseHandler
{
  dataReleaseHandler = (void (**)(id, SEL))self->_dataReleaseHandler;
  if (dataReleaseHandler)
  {
    dataReleaseHandler[2](dataReleaseHandler, a2);
    id v4 = self->_dataReleaseHandler;
    self->_dataReleaseHandler = 0;
  }
}

- (void)dealloc
{
  [(TIImageCacheItem *)self _callDataReleaseHandler];
  CGColorRelease(self->_formatColor);
  v3.receiver = self;
  v3.super_class = (Class)TIImageCacheItem;
  [(TIImageCacheItem *)&v3 dealloc];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)cacheItemWithSize:(CGSize)a3 format:(unsigned __int8)a4 formatColor:(CGColor *)a5 scale:(double)a6 data:(id)a7 dataReleaseHandler:(id)a8
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  id v15 = a7;
  id v16 = a8;
  v17 = (CGFloat *)objc_alloc_init((Class)a1);
  v17[6] = width;
  v17[7] = height;
  *((unsigned char *)v17 + 8) = a4;
  CGColorRef v18 = CGColorRetain(a5);
  v17[2] = a6;
  v19 = (void *)*((void *)v17 + 4);
  *((void *)v17 + 3) = v18;
  *((void *)v17 + 4) = v15;
  id v20 = v15;

  uint64_t v21 = [v16 copy];
  v22 = (void *)*((void *)v17 + 5);
  *((void *)v17 + 5) = v21;

  return v17;
}

+ (id)cacheItemWithSize:(CGSize)a3 format:(unsigned __int8)a4 formatColor:(CGColor *)a5 scale:(double)a6 data:(id)a7
{
  return (id)objc_msgSend(a1, "cacheItemWithSize:format:formatColor:scale:data:dataReleaseHandler:", a4, a5, a7, 0, a3.width, a3.height, a6);
}

@end