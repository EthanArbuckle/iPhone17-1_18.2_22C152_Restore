@interface RPSignedInUserProvider
- (BOOL)supportsMultipleUsers;
- (unsigned)signedInUserID;
@end

@implementation RPSignedInUserProvider

- (BOOL)supportsMultipleUsers
{
  return 0;
}

- (unsigned)signedInUserID
{
  return 0;
}

@end