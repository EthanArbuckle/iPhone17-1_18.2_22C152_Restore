@interface PKPeerPaymentFamilyMemberRowModel
+ (id)sortedPeerPaymentFamilyMemberRowModelsForFamilyMembers:(id)a3 peerPaymentAccount:(id)a4;
- (NSString)detailText;
- (NSString)titleText;
- (PKFamilyMember)familyMember;
- (PKPeerPaymentAccount)account;
- (PKPeerPaymentAccountInvitation)invitation;
- (PKPeerPaymentFamilyMemberRowModel)initWithFamilyMember:(id)a3;
- (UIImage)image;
- (int64_t)accessoryType;
- (int64_t)cellStyle;
- (int64_t)compare:(id)a3;
- (unint64_t)state;
- (void)setAccount:(id)a3;
- (void)setImage:(id)a3;
- (void)setInvitation:(id)a3;
@end

@implementation PKPeerPaymentFamilyMemberRowModel

+ (id)sortedPeerPaymentFamilyMemberRowModelsForFamilyMembers:(id)a3 peerPaymentAccount:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        if ((objc_msgSend(v13, "isMe", (void)v20) & 1) == 0 && (objc_msgSend(v13, "isOrganizer") & 1) == 0)
        {
          v14 = [v13 altDSID];
          uint64_t v15 = [v6 peerPaymentAccountWithAltDSID:v14];
          uint64_t v16 = [v6 accountInvitationWithAltDSID:v14];
          if (v16 | v15 || [v13 memberType] == 2 || objc_msgSend(v13, "memberType") == 1)
          {
            v17 = [[PKPeerPaymentFamilyMemberRowModel alloc] initWithFamilyMember:v13];
            [(PKPeerPaymentFamilyMemberRowModel *)v17 setAccount:v15];
            [(PKPeerPaymentFamilyMemberRowModel *)v17 setInvitation:v16];
            [v7 addObject:v17];
          }
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v10);
  }

  [v7 sortUsingSelector:sel_compare_];
  v18 = (void *)[v7 copy];

  return v18;
}

- (PKPeerPaymentFamilyMemberRowModel)initWithFamilyMember:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPeerPaymentFamilyMemberRowModel;
  id v6 = [(PKPeerPaymentFamilyMemberRowModel *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_familyMember, a3);
  }

  return v7;
}

- (unint64_t)state
{
  account = self->_account;
  if (account)
  {
    BOOL v4 = [(PKPeerPaymentAccount *)account isParticipantAccountLockedByOwner] == 0;
    unint64_t v5 = 1;
  }
  else
  {
    BOOL v4 = self->_invitation == 0;
    unint64_t v5 = 3;
  }
  if (v4) {
    return v5;
  }
  else {
    return v5 + 1;
  }
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(PKPeerPaymentFamilyMemberRowModel *)self state];
  unint64_t v6 = [v4 state];
  if (v5 > 4) {
    unint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    unint64_t v7 = qword_1A0444410[v5];
  }
  if (v6 > 4) {
    unint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    unint64_t v8 = qword_1A0444410[v6];
  }
  if (v7 == v8)
  {
    objc_super v9 = [(PKFamilyMember *)self->_familyMember labelName];
    uint64_t v10 = [v4 familyMember];
    uint64_t v11 = [v10 labelName];
    int64_t v12 = [v9 compare:v11];
  }
  else if (v7 < v8)
  {
    int64_t v12 = -1;
  }
  else
  {
    int64_t v12 = 1;
  }

  return v12;
}

- (int64_t)accessoryType
{
  return [(PKPeerPaymentFamilyMemberRowModel *)self state] - 1 < 3;
}

- (int64_t)cellStyle
{
  return 1;
}

- (NSString)titleText
{
  return (NSString *)[(PKFamilyMember *)self->_familyMember labelName];
}

- (NSString)detailText
{
  unint64_t v2 = [(PKPeerPaymentFamilyMemberRowModel *)self state] - 1;
  if (v2 > 3)
  {
    v3 = 0;
  }
  else
  {
    v3 = PKLocalizedPaymentString(&off_1E59D6638[v2]->isa);
  }

  return (NSString *)v3;
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

- (PKPeerPaymentAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
}

- (PKPeerPaymentAccountInvitation)invitation
{
  return self->_invitation;
}

- (void)setInvitation:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invitation, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_image, 0);

  objc_storeStrong((id *)&self->_familyMember, 0);
}

@end