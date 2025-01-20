@interface SAMPGenreCollection
+ (id)genreCollection;
- (id)encodedClassName;
- (id)groupIdentifier;
@end

@implementation SAMPGenreCollection

- (id)groupIdentifier
{
  return @"com.apple.ace.media";
}

- (id)encodedClassName
{
  return @"GenreCollection";
}

+ (id)genreCollection
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

@end