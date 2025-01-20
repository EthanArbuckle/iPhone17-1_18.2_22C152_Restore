@interface SAUIImageResource
+ (id)imageResource;
- (NSData)imageData;
- (NSString)urlFormatString;
- (NSString)userAgent;
- (NSURL)resourceUrl;
- (double)pixelHeight;
- (double)pixelWidth;
- (double)pointHeight;
- (double)pointWidth;
- (double)scaleFactor;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setImageData:(id)a3;
- (void)setPixelHeight:(double)a3;
- (void)setPixelWidth:(double)a3;
- (void)setPointHeight:(double)a3;
- (void)setPointWidth:(double)a3;
- (void)setResourceUrl:(id)a3;
- (void)setScaleFactor:(double)a3;
- (void)setUrlFormatString:(id)a3;
- (void)setUserAgent:(id)a3;
@end

@implementation SAUIImageResource

- (id)groupIdentifier
{
  return @"com.apple.ace.assistant";
}

- (id)encodedClassName
{
  return @"ImageResource";
}

+ (id)imageResource
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSData)imageData
{
  return (NSData *)[(AceObject *)self propertyForKey:@"imageData"];
}

- (void)setImageData:(id)a3
{
}

- (double)pixelHeight
{
  return AceObjectDoubleForProperty(self, @"pixelHeight");
}

- (void)setPixelHeight:(double)a3
{
}

- (double)pixelWidth
{
  return AceObjectDoubleForProperty(self, @"pixelWidth");
}

- (void)setPixelWidth:(double)a3
{
}

- (double)pointHeight
{
  return AceObjectDoubleForProperty(self, @"pointHeight");
}

- (void)setPointHeight:(double)a3
{
}

- (double)pointWidth
{
  return AceObjectDoubleForProperty(self, @"pointWidth");
}

- (void)setPointWidth:(double)a3
{
}

- (NSURL)resourceUrl
{
  return (NSURL *)AceObjectURLForProperty(self, @"resourceUrl");
}

- (void)setResourceUrl:(id)a3
{
}

- (double)scaleFactor
{
  return AceObjectDoubleForProperty(self, @"scaleFactor");
}

- (void)setScaleFactor:(double)a3
{
}

- (NSString)urlFormatString
{
  return (NSString *)[(AceObject *)self propertyForKey:@"urlFormatString"];
}

- (void)setUrlFormatString:(id)a3
{
}

- (NSString)userAgent
{
  return (NSString *)[(AceObject *)self propertyForKey:@"userAgent"];
}

- (void)setUserAgent:(id)a3
{
}

@end