@interface PKDashboardAvatarItem
+ (id)identifier;
- (PKAccountUser)accountUser;
- (PKFamilyMember)familyMember;
- (void)setAccountUser:(id)a3;
- (void)setFamilyMember:(id)a3;
@end

@implementation PKDashboardAvatarItem

+ (id)identifier
{
  return @"avatar";
}

- (PKFamilyMember)familyMember
{
  return self->_familyMember;
}

- (void)setFamilyMember:(id)a3
{
}

- (PKAccountUser)accountUser
{
  return self->_accountUser;
}

- (void)setAccountUser:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountUser, 0);

  objc_storeStrong((id *)&self->_familyMember, 0);
}

@end