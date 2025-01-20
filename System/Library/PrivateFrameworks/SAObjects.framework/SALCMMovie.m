@interface SALCMMovie
+ (id)movie;
- (id)encodedClassName;
- (id)groupIdentifier;
@end

@implementation SALCMMovie

- (id)groupIdentifier
{
  return @"com.apple.ace.livecontent";
}

- (id)encodedClassName
{
  return @"Movie";
}

+ (id)movie
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

@end