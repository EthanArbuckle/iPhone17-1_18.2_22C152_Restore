@interface SXEmbedVideoComponent
+ (id)typeString;
- (unint64_t)traits;
@end

@implementation SXEmbedVideoComponent

+ (id)typeString
{
  return @"embed_video";
}

- (unint64_t)traits
{
  return 34;
}

@end