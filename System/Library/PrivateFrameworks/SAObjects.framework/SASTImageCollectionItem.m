@interface SASTImageCollectionItem
+ (id)imageCollectionItem;
- (NSArray)images;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setImages:(id)a3;
@end

@implementation SASTImageCollectionItem

- (id)groupIdentifier
{
  return @"com.apple.ace.templates";
}

- (id)encodedClassName
{
  return @"ImageCollectionItem";
}

+ (id)imageCollectionItem
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