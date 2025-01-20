@interface CNVCardImage
+ (CGSize)sizeOfImageData:(id)a3;
- (CGSize)size;
- (CNVCardImage)init;
- (CNVCardImage)initWithData:(id)a3 cropRects:(id)a4;
- (CNVCardImage)initWithData:(id)a3 cropRects:(id)a4 size:(CGSize)a5;
- (NSData)data;
- (NSDictionary)cropRects;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (void)describePropertiesWithBuilder:(id)a3;
@end

@implementation CNVCardImage

- (CNVCardImage)init
{
  v2 = self;
  CNInitializerUnavailableException();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (CNVCardImage)initWithData:(id)a3 cropRects:(id)a4
{
  v4 = (CNVCardImage *)a3;
  if (a3)
  {
    id v6 = a4;
    v7 = v4;
    [(id)objc_opt_class() sizeOfImageData:v7];
    v8 = -[CNVCardImage initWithData:cropRects:size:](self, "initWithData:cropRects:size:", v7, v6);

    self = v8;
    v4 = self;
  }

  return v4;
}

- (CNVCardImage)initWithData:(id)a3 cropRects:(id)a4 size:(CGSize)a5
{
  CGFloat height = a5.height;
  CGFloat width = a5.width;
  id v9 = a3;
  id v10 = a4;
  if (v9
    && (v17.receiver = self,
        v17.super_class = (Class)CNVCardImage,
        (self = [(CNVCardImage *)&v17 init]) != 0))
  {
    v11 = (NSData *)[v9 copy];
    data = self->_data;
    self->_data = v11;

    v13 = (NSDictionary *)[v10 copy];
    cropRects = self->_cropRects;
    self->_cropRects = v13;

    self->_size.CGFloat width = width;
    self->_size.CGFloat height = height;
    self = self;
    v15 = self;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)description
{
  id v3 = [MEMORY[0x1E4F5A3A8] descriptionBuilderWithObject:self];
  [(CNVCardImage *)self describePropertiesWithBuilder:v3];
  v4 = [v3 build];

  return v4;
}

- (void)describePropertiesWithBuilder:(id)a3
{
  id v20 = a3;
  v4 = NSString;
  v5 = NSNumber;
  id v6 = [(CNVCardImage *)self data];
  v7 = objc_msgSend(v5, "numberWithUnsignedInteger:", objc_msgSend(v6, "length"));
  v8 = [v4 stringWithFormat:@"%@ bytes", v7];
  id v9 = (id)[v20 appendName:@"data" object:v8];

  id v10 = [(CNVCardImage *)self cropRects];
  id v11 = (id)[v20 appendName:@"cropRects" object:v10];

  v12 = NSString;
  v13 = NSNumber;
  [(CNVCardImage *)self size];
  v14 = objc_msgSend(v13, "numberWithDouble:");
  v15 = NSNumber;
  [(CNVCardImage *)self size];
  objc_super v17 = [v15 numberWithDouble:v16];
  v18 = [v12 stringWithFormat:@"%@x%@", v14, v17];
  id v19 = (id)[v20 appendName:@"size" object:v18];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v4 = [CNVCardMutableImage alloc];
  v5 = [(CNVCardImage *)self data];
  id v6 = [(CNVCardImage *)self cropRects];
  [(CNVCardImage *)self size];
  v7 = -[CNVCardMutableImage initWithData:cropRects:size:](v4, "initWithData:cropRects:size:", v5, v6);

  return v7;
}

+ (CGSize)sizeOfImageData:(id)a3
{
  uint64_t v3 = softLinkCGImageSourceCreateWithData_0((uint64_t)a3, 0);
  if (v3)
  {
    v4 = (const void *)v3;
    v5 = (void *)softLinkCGImageSourceCopyPropertiesAtIndex(v3, 0, 0);
    CFRelease(v4);
    id v6 = [v5 objectForKeyedSubscript:getkCGImagePropertyPixelWidth()];
    [v6 doubleValue];
    double v8 = v7;

    id v9 = [v5 objectForKeyedSubscript:getkCGImagePropertyPixelHeight()];
    [v9 doubleValue];
    double v11 = v10;
  }
  else
  {
    double v8 = 0.0;
    double v11 = 0.0;
  }
  double v12 = v8;
  double v13 = v11;
  result.CGFloat height = v13;
  result.CGFloat width = v12;
  return result;
}

- (NSData)data
{
  return self->_data;
}

- (NSDictionary)cropRects
{
  return self->_cropRects;
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cropRects, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

@end