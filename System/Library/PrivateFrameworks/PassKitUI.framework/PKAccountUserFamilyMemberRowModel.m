@interface PKAccountUserFamilyMemberRowModel
+ (id)sortedAccountUserFamilyMemberRowModelsForFamilyMemberCollection:(id)a3 account:(id)a4 accountUserCollection:(id)a5 invitations:(id)a6;
- (NSString)detailText;
- (NSString)titleText;
- (PKAccountUser)accountUser;
- (PKAccountUserCollection)accountUserCollection;
- (PKAccountUserFamilyMemberRowModel)initWithFamilyMember:(id)a3;
- (PKFamilyMember)familyMember;
- (PKFeatureApplication)invitation;
- (UIImage)image;
- (int64_t)accessoryType;
- (int64_t)cellStyle;
- (int64_t)compare:(id)a3;
- (void)setAccountUser:(id)a3;
- (void)setAccountUserCollection:(id)a3;
- (void)setImage:(id)a3;
- (void)setInvitation:(id)a3;
@end

@implementation PKAccountUserFamilyMemberRowModel

+ (id)sortedAccountUserFamilyMemberRowModelsForFamilyMemberCollection:(id)a3 account:(id)a4 accountUserCollection:(id)a5 invitations:(id)a6
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id v32 = a6;
  id v34 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  v33 = v9;
  v11 = [v9 accountUsers];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v39 objects:v44 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v40 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = *(void **)(*((void *)&v39 + 1) + 8 * i);
        v17 = [v16 altDSID];
        v18 = [v8 familyMemberForAltDSID:v17];
        [v16 accountState];
        if (([v16 isCurrentUser] & 1) == 0
          && (PKAccountStateIsTerminal() & 1) == 0
          && ([v10 containsObject:v17] & 1) == 0)
        {
          v19 = [[PKAccountUserFamilyMemberRowModel alloc] initWithFamilyMember:v18];
          [(PKAccountUserFamilyMemberRowModel *)v19 setAccountUser:v16];
          [(PKAccountUserFamilyMemberRowModel *)v19 setAccountUserCollection:v33];
          [v34 addObject:v19];
          [v10 addObject:v17];
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v39 objects:v44 count:16];
    }
    while (v13);
  }

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v20 = v32;
  uint64_t v21 = [v20 countByEnumeratingWithState:&v35 objects:v43 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v36;
    do
    {
      for (uint64_t j = 0; j != v22; ++j)
      {
        if (*(void *)v36 != v23) {
          objc_enumerationMutation(v20);
        }
        v25 = *(void **)(*((void *)&v35 + 1) + 8 * j);
        v26 = [v25 invitationDetails];
        v27 = [v26 accountUserAltDSID];

        v28 = [v8 familyMemberForAltDSID:v27];
        if (([v10 containsObject:v27] & 1) == 0)
        {
          v29 = [[PKAccountUserFamilyMemberRowModel alloc] initWithFamilyMember:v28];
          [(PKAccountUserFamilyMemberRowModel *)v29 setInvitation:v25];
          [v34 addObject:v29];
          [v10 addObject:v27];
        }
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v35 objects:v43 count:16];
    }
    while (v22);
  }

  [v34 sortUsingSelector:sel_compare_];
  v30 = (void *)[v34 copy];

  return v30;
}

- (PKAccountUserFamilyMemberRowModel)initWithFamilyMember:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKAccountUserFamilyMemberRowModel;
  v6 = [(PKAccountUserFamilyMemberRowModel *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_familyMember, a3);
  }

  return v7;
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  unint64_t v5 = PKAccountUserFamilyRowPriorityFromRow(self);
  unint64_t v6 = PKAccountUserFamilyRowPriorityFromRow(v4);
  if (v5 == v6)
  {
    v7 = [(PKFamilyMember *)self->_familyMember labelName];
    id v8 = [v4 familyMember];
    objc_super v9 = [v8 labelName];
    int64_t v10 = [v7 compare:v9];
  }
  else if (v5 < v6)
  {
    int64_t v10 = -1;
  }
  else
  {
    int64_t v10 = 1;
  }

  return v10;
}

- (int64_t)accessoryType
{
  return 1;
}

- (int64_t)cellStyle
{
  return 0;
}

- (NSString)titleText
{
  v3 = [(PKAccountUser *)self->_accountUser nameComponents];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    unint64_t v6 = [(PKFeatureApplication *)self->_invitation invitationDetails];
    id v5 = [v6 accountUserNameComponents];
  }
  v7 = [MEMORY[0x1E4F845E8] contactForFamilyMember:self->_familyMember nameComponents:v5 imageData:0];
  id v8 = [v7 pkFullName];

  return (NSString *)v8;
}

- (NSString)detailText
{
  accountUser = self->_accountUser;
  if (accountUser)
  {
    uint64_t v4 = [(PKAccountUser *)accountUser accessLevel];
    if (v4 == 2)
    {
      id v5 = @"ACCOUNT_USER_PARTICIPANT_SUBTITLE";
    }
    else
    {
      if (v4 != 1)
      {
        invitation = 0;
        goto LABEL_18;
      }
      if ([(PKAccountUserCollection *)self->_accountUserCollection isCoOwner]) {
        id v5 = @"ACCOUNT_USER_CO_OWNER_SUBTITLE";
      }
      else {
        id v5 = @"ACCOUNT_USER_OWNER_SUBTITLE";
      }
    }
  }
  else
  {
    invitation = self->_invitation;
    if (!invitation) {
      goto LABEL_18;
    }
    uint64_t v7 = [invitation applicationState];
    if (v7 == 6)
    {
      id v5 = @"ACCOUNT_USER_OFFER_READY";
    }
    else if (v7 == 5)
    {
      if ([(PKFeatureApplication *)self->_invitation applicationStateReason] == 9) {
        id v5 = @"ACCOUNT_USER_INVITATION_SENT";
      }
      else {
        id v5 = @"ACCOUNT_USER_INVITATION_PENDING";
      }
    }
    else
    {
      id v5 = @"ACCOUNT_USER_INVITATION_PENDING";
    }
  }
  invitation = PKLocalizedMadisonString(&v5->isa);
LABEL_18:

  return (NSString *)invitation;
}

- (PKFamilyMember)familyMember
{
  return self->_familyMember;
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
}

- (PKAccountUser)accountUser
{
  return self->_accountUser;
}

- (void)setAccountUser:(id)a3
{
}

- (PKFeatureApplication)invitation
{
  return self->_invitation;
}

- (void)setInvitation:(id)a3
{
}

- (PKAccountUserCollection)accountUserCollection
{
  return self->_accountUserCollection;
}

- (void)setAccountUserCollection:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountUserCollection, 0);
  objc_storeStrong((id *)&self->_invitation, 0);
  objc_storeStrong((id *)&self->_accountUser, 0);
  objc_storeStrong((id *)&self->_image, 0);

  objc_storeStrong((id *)&self->_familyMember, 0);
}

@end