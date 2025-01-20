@interface SASportsEntity
+ (id)entity;
- (NSArray)themeImages;
- (NSDictionary)images;
- (NSDictionary)largeImages;
- (NSDictionary)listImages;
- (NSString)name;
- (NSURL)image;
- (NSURL)largeImage;
- (NSURL)listImage;
- (SASportsLeague)league;
- (SAUIAppPunchOut)punchout;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setImage:(id)a3;
- (void)setImages:(id)a3;
- (void)setLargeImage:(id)a3;
- (void)setLargeImages:(id)a3;
- (void)setLeague:(id)a3;
- (void)setListImage:(id)a3;
- (void)setListImages:(id)a3;
- (void)setName:(id)a3;
- (void)setPunchout:(id)a3;
- (void)setThemeImages:(id)a3;
@end

@implementation SASportsEntity

- (id)groupIdentifier
{
  return @"com.apple.ace.sports";
}

- (id)encodedClassName
{
  return @"Entity";
}

+ (id)entity
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSURL)image
{
  return (NSURL *)AceObjectURLForProperty(self, @"image");
}

- (void)setImage:(id)a3
{
}

- (NSDictionary)images
{
  return (NSDictionary *)[(AceObject *)self propertyForKey:@"images"];
}

- (void)setImages:(id)a3
{
}

- (NSURL)largeImage
{
  return (NSURL *)AceObjectURLForProperty(self, @"largeImage");
}

- (void)setLargeImage:(id)a3
{
}

- (NSDictionary)largeImages
{
  return (NSDictionary *)[(AceObject *)self propertyForKey:@"largeImages"];
}

- (void)setLargeImages:(id)a3
{
}

- (SASportsLeague)league
{
  return (SASportsLeague *)AceObjectAceObjectForProperty(self, @"league");
}

- (void)setLeague:(id)a3
{
}

- (NSURL)listImage
{
  return (NSURL *)AceObjectURLForProperty(self, @"listImage");
}

- (void)setListImage:(id)a3
{
}

- (NSDictionary)listImages
{
  return (NSDictionary *)[(AceObject *)self propertyForKey:@"listImages"];
}

- (void)setListImages:(id)a3
{
}

- (NSString)name
{
  return (NSString *)[(AceObject *)self propertyForKey:@"name"];
}

- (void)setName:(id)a3
{
}

- (SAUIAppPunchOut)punchout
{
  return (SAUIAppPunchOut *)AceObjectAceObjectForProperty(self, @"punchout");
}

- (void)setPunchout:(id)a3
{
}

- (NSArray)themeImages
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"themeImages", v3);
}

- (void)setThemeImages:(id)a3
{
}

@end