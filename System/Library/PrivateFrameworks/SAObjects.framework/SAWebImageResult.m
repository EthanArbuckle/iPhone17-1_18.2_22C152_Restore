@interface SAWebImageResult
+ (id)imageResult;
- (NSArray)thumbNails;
- (NSNumber)fileSize;
- (SAWebAcePicture)picture;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setFileSize:(id)a3;
- (void)setPicture:(id)a3;
- (void)setThumbNails:(id)a3;
@end

@implementation SAWebImageResult

- (id)groupIdentifier
{
  return @"com.apple.ace.websearch";
}

- (id)encodedClassName
{
  return @"ImageResult";
}

+ (id)imageResult
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSNumber)fileSize
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"fileSize"];
}

- (void)setFileSize:(id)a3
{
}

- (SAWebAcePicture)picture
{
  return (SAWebAcePicture *)AceObjectAceObjectForProperty(self, @"picture");
}

- (void)setPicture:(id)a3
{
}

- (NSArray)thumbNails
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"thumbNails", v3);
}

- (void)setThumbNails:(id)a3
{
}

@end