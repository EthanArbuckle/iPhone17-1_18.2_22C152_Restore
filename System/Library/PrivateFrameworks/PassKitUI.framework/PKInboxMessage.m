@interface PKInboxMessage
+ (id)accountUserInvitationInboxMessageWithAccountUserInvitation:(id)a3 familyMember:(id)a4;
- (BOOL)_isEqualToInboxMessage:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isExpired;
- (BOOL)isHidden;
- (BOOL)shouldBadge;
- (NSString)identifier;
- (PKFamilyMember)familyMember;
- (PKFeatureApplication)accountUserInvitation;
- (PKInboxMessage)initWithType:(int64_t)a3 identifier:(id)a4;
- (int64_t)type;
@end

@implementation PKInboxMessage

- (PKInboxMessage)initWithType:(int64_t)a3 identifier:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PKInboxMessage;
  v7 = [(PKInboxMessage *)&v12 init];
  v8 = v7;
  if (v7)
  {
    v7->_type = a3;
    uint64_t v9 = [v6 copy];
    identifier = v8->_identifier;
    v8->_identifier = (NSString *)v9;
  }
  return v8;
}

+ (id)accountUserInvitationInboxMessageWithAccountUserInvitation:(id)a3 familyMember:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc((Class)a1);
  uint64_t v9 = [v6 applicationIdentifier];
  uint64_t v10 = [v8 initWithType:0 identifier:v9];

  v11 = *(void **)(v10 + 32);
  *(void *)(v10 + 32) = v6;
  id v12 = v6;

  v13 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v7;

  uint64_t v14 = [v12 applicationState];
  *(unsigned char *)(v10 + 8) = v14 == 14;

  return (id)v10;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PKInboxMessage *)a3;
  v5 = v4;
  if (self == v4) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PKInboxMessage *)self _isEqualToInboxMessage:v5];

  return v6;
}

- (BOOL)_isEqualToInboxMessage:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4 && self->_type == *((void *)v4 + 2) && PKEqualObjects() && PKEqualObjects()) {
    char v6 = PKEqualObjects();
  }
  else {
    char v6 = 0;
  }

  return v6;
}

- (BOOL)shouldBadge
{
  return !self->_type && [(PKFeatureApplication *)self->_accountUserInvitation applicationState] == 1;
}

- (BOOL)isExpired
{
  return !self->_type
      && [(PKFeatureApplication *)self->_accountUserInvitation applicationState] == 12;
}

- (int64_t)type
{
  return self->_type;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (BOOL)isHidden
{
  return self->_hidden;
}

- (PKFeatureApplication)accountUserInvitation
{
  return self->_accountUserInvitation;
}

- (PKFamilyMember)familyMember
{
  return self->_familyMember;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_familyMember, 0);
  objc_storeStrong((id *)&self->_accountUserInvitation, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end