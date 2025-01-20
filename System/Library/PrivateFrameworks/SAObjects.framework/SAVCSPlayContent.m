@interface SAVCSPlayContent
+ (id)playContent;
- (BOOL)playTrailer;
- (BOOL)requiresResponse;
- (NSString)contentType;
- (NSString)utsId;
- (NSURL)hiresTrailerUri;
- (NSURL)lowresTrailerUri;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setContentType:(id)a3;
- (void)setHiresTrailerUri:(id)a3;
- (void)setLowresTrailerUri:(id)a3;
- (void)setPlayTrailer:(BOOL)a3;
- (void)setUtsId:(id)a3;
@end

@implementation SAVCSPlayContent

- (id)groupIdentifier
{
  return @"com.apple.ace.videocontent";
}

- (id)encodedClassName
{
  return @"PlayContent";
}

+ (id)playContent
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

- (NSURL)lowresTrailerUri
{
  return (NSURL *)AceObjectURLForProperty(self, @"lowresTrailerUri");
}

- (void)setLowresTrailerUri:(id)a3
{
}

- (BOOL)playTrailer
{
  return AceObjectBoolForProperty(self, @"playTrailer");
}

- (void)setPlayTrailer:(BOOL)a3
{
}

- (NSString)utsId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"utsId"];
}

- (void)setUtsId:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end