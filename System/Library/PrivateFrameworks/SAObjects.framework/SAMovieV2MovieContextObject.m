@interface SAMovieV2MovieContextObject
+ (id)movieContextObject;
- (NSString)movieName;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setMovieName:(id)a3;
@end

@implementation SAMovieV2MovieContextObject

- (id)groupIdentifier
{
  return @"com.apple.ace.movieV2";
}

- (id)encodedClassName
{
  return @"MovieContextObject";
}

+ (id)movieContextObject
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)movieName
{
  return (NSString *)[(AceObject *)self propertyForKey:@"movieName"];
}

- (void)setMovieName:(id)a3
{
}

@end