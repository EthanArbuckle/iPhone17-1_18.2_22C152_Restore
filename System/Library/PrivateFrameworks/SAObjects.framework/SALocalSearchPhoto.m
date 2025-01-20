@interface SALocalSearchPhoto
+ (id)photo;
- (NSString)identifier;
- (NSURL)fullsize;
- (NSURL)largeSize;
- (NSURL)maximumSize;
- (NSURL)thumbnail;
- (SAUIAppPunchOut)photoPunchOut;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setFullsize:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setLargeSize:(id)a3;
- (void)setMaximumSize:(id)a3;
- (void)setPhotoPunchOut:(id)a3;
- (void)setThumbnail:(id)a3;
@end

@implementation SALocalSearchPhoto

- (id)groupIdentifier
{
  return @"com.apple.ace.localsearch";
}

- (id)encodedClassName
{
  return @"Photo";
}

+ (id)photo
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSURL)fullsize
{
  return (NSURL *)AceObjectURLForProperty(self, @"fullsize");
}

- (void)setFullsize:(id)a3
{
}

- (NSString)identifier
{
  return (NSString *)[(AceObject *)self propertyForKey:@"identifier"];
}

- (void)setIdentifier:(id)a3
{
}

- (NSURL)largeSize
{
  return (NSURL *)AceObjectURLForProperty(self, @"largeSize");
}

- (void)setLargeSize:(id)a3
{
}

- (NSURL)maximumSize
{
  return (NSURL *)AceObjectURLForProperty(self, @"maximumSize");
}

- (void)setMaximumSize:(id)a3
{
}

- (SAUIAppPunchOut)photoPunchOut
{
  return (SAUIAppPunchOut *)AceObjectAceObjectForProperty(self, @"photoPunchOut");
}

- (void)setPhotoPunchOut:(id)a3
{
}

- (NSURL)thumbnail
{
  return (NSURL *)AceObjectURLForProperty(self, @"thumbnail");
}

- (void)setThumbnail:(id)a3
{
}

@end