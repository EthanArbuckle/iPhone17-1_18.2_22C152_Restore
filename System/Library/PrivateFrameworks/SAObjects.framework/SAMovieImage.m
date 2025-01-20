@interface SAMovieImage
+ (id)image;
- (NSURL)uri;
- (SAMovieResolution)resolution;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setResolution:(id)a3;
- (void)setUri:(id)a3;
@end

@implementation SAMovieImage

- (id)groupIdentifier
{
  return @"com.apple.ace.movie";
}

- (id)encodedClassName
{
  return @"Image";
}

+ (id)image
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (SAMovieResolution)resolution
{
  return (SAMovieResolution *)AceObjectAceObjectForProperty(self, @"resolution");
}

- (void)setResolution:(id)a3
{
}

- (NSURL)uri
{
  return (NSURL *)AceObjectURLForProperty(self, @"uri");
}

- (void)setUri:(id)a3
{
}

@end