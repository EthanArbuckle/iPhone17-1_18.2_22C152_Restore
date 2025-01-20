@interface TestPLCloudSharedAlbum
- (BOOL)cloudOwnerIsWhitelisted;
- (id)cloudGUID;
- (id)cloudOwnerDisplayNameIncludingEmail:(BOOL)a3 allowsEmail:(BOOL)a4;
- (id)cloudOwnerEmail;
- (id)cloudOwnerFirstName;
- (id)cloudOwnerLastName;
- (id)localizedTitle;
@end

@implementation TestPLCloudSharedAlbum

- (id)cloudGUID
{
  v2 = [MEMORY[0x1E4F29128] UUID];
  v3 = [v2 UUIDString];

  return v3;
}

- (id)cloudOwnerLastName
{
  return @"Appleseed";
}

- (id)cloudOwnerFirstName
{
  return @"Johnny";
}

- (id)cloudOwnerEmail
{
  return @"test@test.com";
}

- (BOOL)cloudOwnerIsWhitelisted
{
  return 1;
}

- (id)cloudOwnerDisplayNameIncludingEmail:(BOOL)a3 allowsEmail:(BOOL)a4
{
  return @"Mock User";
}

- (id)localizedTitle
{
  return @"Mock Shared Album";
}

@end