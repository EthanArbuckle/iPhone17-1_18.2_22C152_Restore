@interface SXScalableImageComponent
+ (id)typeString;
- (unint64_t)traits;
@end

@implementation SXScalableImageComponent

+ (id)typeString
{
  return @"scalable_image";
}

- (unint64_t)traits
{
  return 8;
}

@end