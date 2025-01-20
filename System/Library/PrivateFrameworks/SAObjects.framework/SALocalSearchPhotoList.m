@interface SALocalSearchPhotoList
+ (id)photoList;
- (NSArray)photos;
- (NSString)providerId;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setPhotos:(id)a3;
- (void)setProviderId:(id)a3;
@end

@implementation SALocalSearchPhotoList

- (id)groupIdentifier
{
  return @"com.apple.ace.localsearch";
}

- (id)encodedClassName
{
  return @"PhotoList";
}

+ (id)photoList
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)photos
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"photos", v3);
}

- (void)setPhotos:(id)a3
{
}

- (NSString)providerId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"providerId"];
}

- (void)setProviderId:(id)a3
{
}

@end