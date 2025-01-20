@interface SAGKImagePod
+ (id)imagePod;
- (NSArray)images;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setImages:(id)a3;
@end

@implementation SAGKImagePod

- (id)groupIdentifier
{
  return @"com.apple.ace.generalknowledge";
}

- (id)encodedClassName
{
  return @"ImagePod";
}

+ (id)imagePod
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)images
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"images", v3);
}

- (void)setImages:(id)a3
{
}

@end