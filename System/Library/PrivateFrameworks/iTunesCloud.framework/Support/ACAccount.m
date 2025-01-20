@interface ACAccount
- (BOOL)isManageable;
- (NSString)accountDSID;
@end

@implementation ACAccount

- (BOOL)isManageable
{
  return [(ACAccount *)self ic_isManageable];
}

- (NSString)accountDSID
{
  v2 = [(ACAccount *)self ic_DSID];
  v3 = [v2 stringValue];

  return (NSString *)v3;
}

@end