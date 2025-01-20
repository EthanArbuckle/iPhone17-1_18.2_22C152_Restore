@interface PKFamilyMemberCollection
- (BOOL)isEqual:(id)a3;
- (NSArray)familyMembers;
- (NSDictionary)familyMembersByAltDSID;
- (NSString)currentUserAltDSID;
- (PKFamilyMember)currentUser;
- (PKFamilyMemberCollection)initWithFamilyMembers:(id)a3;
- (id)familyMemberForAltDSID:(id)a3;
- (id)familyMemberForTransactionSource:(id)a3;
@end

@implementation PKFamilyMemberCollection

- (PKFamilyMemberCollection)initWithFamilyMembers:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)PKFamilyMemberCollection;
  v5 = [(PKFamilyMemberCollection *)&v25 init];
  if (v5)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v7 = v4;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v22 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          v13 = objc_msgSend(v12, "altDSID", (void)v21);
          [v6 setObject:v12 forKey:v13];

          if ([v12 isMe]) {
            objc_storeStrong((id *)&v5->_currentUser, v12);
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
      }
      while (v9);
    }

    uint64_t v14 = [v6 copy];
    familyMembersByAltDSID = v5->_familyMembersByAltDSID;
    v5->_familyMembersByAltDSID = (NSDictionary *)v14;

    uint64_t v16 = [v7 copy];
    familyMembers = v5->_familyMembers;
    v5->_familyMembers = (NSArray *)v16;

    uint64_t v18 = PKCurrentUserAltDSID();
    currentUserAltDSID = v5->_currentUserAltDSID;
    v5->_currentUserAltDSID = (NSString *)v18;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PKFamilyMemberCollection *)a3;
  v5 = v4;
  if (self == v4)
  {
    char v8 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    familyMembers = self->_familyMembers;
    id v7 = v5->_familyMembers;
    if (familyMembers && v7) {
      char v8 = -[NSArray isEqual:](familyMembers, "isEqual:");
    }
    else {
      char v8 = familyMembers == v7;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (id)familyMemberForTransactionSource:(id)a3
{
  id v4 = a3;
  switch([v4 type])
  {
    case 0:
    case 3:
      v5 = self->_currentUserAltDSID;
      if (!v5) {
        goto LABEL_7;
      }
      goto LABEL_3;
    case 1:
      id v7 = [v4 peerPaymentAccount];
      goto LABEL_6;
    case 2:
      id v7 = [v4 accountUser];
LABEL_6:
      char v8 = v7;
      v5 = [v7 altDSID];

      if (!v5) {
        goto LABEL_7;
      }
LABEL_3:
      id v6 = [(NSDictionary *)self->_familyMembersByAltDSID objectForKey:v5];

      break;
    default:
LABEL_7:
      id v6 = 0;
      break;
  }

  return v6;
}

- (id)familyMemberForAltDSID:(id)a3
{
  if (a3)
  {
    id v4 = -[NSDictionary objectForKey:](self->_familyMembersByAltDSID, "objectForKey:");
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (NSDictionary)familyMembersByAltDSID
{
  return self->_familyMembersByAltDSID;
}

- (NSArray)familyMembers
{
  return self->_familyMembers;
}

- (PKFamilyMember)currentUser
{
  return self->_currentUser;
}

- (NSString)currentUserAltDSID
{
  return self->_currentUserAltDSID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentUserAltDSID, 0);
  objc_storeStrong((id *)&self->_currentUser, 0);
  objc_storeStrong((id *)&self->_familyMembers, 0);
  objc_storeStrong((id *)&self->_familyMembersByAltDSID, 0);
}

@end