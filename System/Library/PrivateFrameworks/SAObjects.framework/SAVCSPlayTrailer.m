@interface SAVCSPlayTrailer
+ (id)playTrailer;
- (NSString)contentType;
- (NSString)utsId;
- (NSURL)hiresTrailerUri;
- (NSURL)lowresTrailerUri;
- (NSURL)url;
- (SAUIImageResource)image;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setContentType:(id)a3;
- (void)setHiresTrailerUri:(id)a3;
- (void)setImage:(id)a3;
- (void)setLowresTrailerUri:(id)a3;
- (void)setUrl:(id)a3;
- (void)setUtsId:(id)a3;
@end

@implementation SAVCSPlayTrailer

- (id)groupIdentifier
{
  return @"com.apple.ace.videocontent";
}

- (id)encodedClassName
{
  return @"PlayTrailer";
}

+ (id)playTrailer
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)contentType
{
  return (NSString *)[(AceObject *)self propertyForKey:@"contentType"];
}

- (void)setContentType:(id)a3
{
}

- (NSURL)hiresTrailerUri
{
  return (NSURL *)AceObjectURLForProperty(self, @"hiresTrailerUri");
}

- (void)setHiresTrailerUri:(id)a3
{
}

- (SAUIImageResource)image
{
  return (SAUIImageResource *)AceObjectAceObjectForProperty(self, @"image");
}

- (void)setImage:(id)a3
{
}

- (NSURL)lowresTrailerUri
{
  return (NSURL *)AceObjectURLForProperty(self, @"lowresTrailerUri");
}

- (void)setLowresTrailerUri:(id)a3
{
}

- (NSURL)url
{
  return (NSURL *)AceObjectURLForProperty(self, @"url");
}

- (void)setUrl:(id)a3
{
}

- (NSString)utsId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"utsId"];
}

- (void)setUtsId:(id)a3
{
}

@end