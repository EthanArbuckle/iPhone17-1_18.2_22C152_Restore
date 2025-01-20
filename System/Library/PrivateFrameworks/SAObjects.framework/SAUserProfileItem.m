@interface SAUserProfileItem
- (BOOL)activeProfile;
- (NSData)profileImage;
- (NSString)fullName;
- (NSString)profileIdentifier;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setActiveProfile:(BOOL)a3;
- (void)setFullName:(id)a3;
- (void)setProfileIdentifier:(id)a3;
- (void)setProfileImage:(id)a3;
@end

@implementation SAUserProfileItem

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"UserProfileItem";
}

- (BOOL)activeProfile
{
  return AceObjectBoolForProperty(self, @"activeProfile");
}

- (void)setActiveProfile:(BOOL)a3
{
}

- (NSString)fullName
{
  return (NSString *)[(AceObject *)self propertyForKey:@"fullName"];
}

- (void)setFullName:(id)a3
{
}

- (NSString)profileIdentifier
{
  return (NSString *)[(AceObject *)self propertyForKey:@"profileIdentifier"];
}

- (void)setProfileIdentifier:(id)a3
{
}

- (NSData)profileImage
{
  return (NSData *)[(AceObject *)self propertyForKey:@"profileImage"];
}

- (void)setProfileImage:(id)a3
{
}

@end