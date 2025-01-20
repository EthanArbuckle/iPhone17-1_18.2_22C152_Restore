@interface PKAccountUserCollection
+ (BOOL)supportsSecureCoding;
- (BOOL)_isEqualToAccountUserCollection:(id)a3;
- (BOOL)isCoOwner;
- (BOOL)isEqual:(id)a3;
- (NSSet)accountUsers;
- (PKAccountUser)coOwnerAccountUser;
- (PKAccountUser)currentAccountUser;
- (PKAccountUserCollection)initWithAccountUsers:(id)a3;
- (PKAccountUserCollection)initWithCoder:(id)a3;
- (id)accountUserForTransaction:(id)a3;
- (id)accountUserWithAltDSID:(id)a3;
- (id)accountUsersExcludingCurrentAccountUser;
- (id)activeAccountUsers;
- (id)activeAccountUsersExcludingCurrentAccountUser;
- (id)description;
- (id)transactionSourceIdentifiers;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (unint64_t)hash;
- (void)_updateWithAccountUsers:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKAccountUserCollection

- (PKAccountUserCollection)initWithAccountUsers:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PKAccountUserCollection;
  v5 = [(PKAccountUserCollection *)&v8 init];
  v6 = v5;
  if (v5) {
    [(PKAccountUserCollection *)v5 _updateWithAccountUsers:v4];
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKAccountUserCollection)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKAccountUserCollection;
  v5 = [(PKAccountUserCollection *)&v11 init];
  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v7 = objc_opt_class();
    objc_super v8 = objc_msgSend(v6, "initWithObjects:", v7, objc_opt_class(), 0);
    v9 = [v4 decodeObjectOfClasses:v8 forKey:@"accountUsers"];

    [(PKAccountUserCollection *)v5 _updateWithAccountUsers:v9];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PKAccountUserCollection *)a3;
  v5 = v4;
  if (self == v4) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PKAccountUserCollection *)self _isEqualToAccountUserCollection:v5];

  return v6;
}

- (BOOL)_isEqualToAccountUserCollection:(id)a3
{
  if (!a3) {
    return 0;
  }
  accountUsers = self->_accountUsers;
  id v4 = (NSSet *)*((void *)a3 + 3);
  if (accountUsers) {
    BOOL v5 = v4 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5) {
    return accountUsers == v4;
  }
  else {
    return -[NSSet isEqual:](accountUsers, "isEqual:");
  }
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 safelyAddObject:self->_accountUsers];
  unint64_t v4 = PKCombinedHash(17, v3);

  return v4;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return [(NSSet *)self->_accountUsers countByEnumeratingWithState:a3 objects:a4 count:a5];
}

- (id)accountUserWithAltDSID:(id)a3
{
  if (a3)
  {
    unint64_t v4 = -[NSDictionary objectForKeyedSubscript:](self->_accountUsersByAltDSID, "objectForKeyedSubscript:");
  }
  else
  {
    unint64_t v4 = 0;
  }
  return v4;
}

- (id)accountUserForTransaction:(id)a3
{
  unint64_t v4 = [a3 altDSID];
  if (v4) {
    [(PKAccountUserCollection *)self accountUserWithAltDSID:v4];
  }
  else {
  BOOL v5 = [(PKAccountUserCollection *)self currentAccountUser];
  }

  return v5;
}

- (id)accountUsersExcludingCurrentAccountUser
{
  return [(NSSet *)self->_accountUsers objectsPassingTest:&__block_literal_global_227];
}

uint64_t __66__PKAccountUserCollection_accountUsersExcludingCurrentAccountUser__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isCurrentUser] ^ 1;
}

- (id)activeAccountUsersExcludingCurrentAccountUser
{
  return [(NSSet *)self->_accountUsers objectsPassingTest:&__block_literal_global_17];
}

uint64_t __72__PKAccountUserCollection_activeAccountUsersExcludingCurrentAccountUser__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 isCurrentUser])
  {
    uint64_t v3 = 0;
  }
  else
  {
    unint64_t v4 = [v2 accountState];
    if (v4 <= 5) {
      uint64_t v3 = (0xFu >> v4) & 1;
    }
    else {
      uint64_t v3 = 1;
    }
  }

  return v3;
}

- (id)activeAccountUsers
{
  return [(NSSet *)self->_accountUsers objectsPassingTest:&__block_literal_global_19_0];
}

uint64_t __45__PKAccountUserCollection_activeAccountUsers__block_invoke(uint64_t a1, void *a2)
{
  unint64_t v2 = [a2 accountState];
  return (v2 > 5) | (0xFu >> v2) & 1;
}

- (id)transactionSourceIdentifiers
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  unint64_t v4 = self->_accountUsers;
  uint64_t v5 = [(NSSet *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "transactionSourceIdentifiers", (void)v12);
        if (v9) {
          [v3 unionSet:v9];
        }
      }
      uint64_t v6 = [(NSSet *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  v10 = (void *)[v3 copy];
  return v10;
}

- (id)description
{
  id v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"users: '%@'; ", self->_accountUsers];
  [v3 appendFormat:@">"];
  return v3;
}

- (void)_updateWithAccountUsers:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  unint64_t v4 = (NSSet *)a3;
  accountUsers = self->_accountUsers;
  if (v4 && accountUsers)
  {
    if ([(NSSet *)accountUsers isEqual:v4]) {
      goto LABEL_18;
    }
  }
  else if (accountUsers == v4)
  {
    goto LABEL_18;
  }
  uint64_t v6 = (NSSet *)[(NSSet *)v4 copy];
  uint64_t v7 = self->_accountUsers;
  self->_accountUsers = v6;

  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  v9 = v4;
  uint64_t v10 = [(NSSet *)v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v23 != v12) {
          objc_enumerationMutation(v9);
        }
        long long v14 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        long long v15 = objc_msgSend(v14, "altDSID", (void)v22);
        if (v15) {
          [v8 setObject:v14 forKeyedSubscript:v15];
        }
      }
      uint64_t v11 = [(NSSet *)v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v11);
  }

  v16 = (NSDictionary *)[v8 copy];
  accountUsersByAltDSID = self->_accountUsersByAltDSID;
  self->_accountUsersByAltDSID = v16;

  v18 = [(NSSet *)v9 pk_anyObjectPassingTest:&__block_literal_global_34_0];
  currentAccountUser = self->_currentAccountUser;
  self->_currentAccountUser = v18;

  if ([(PKAccountUser *)self->_currentAccountUser accessLevel] == 1)
  {
    v20 = [(NSSet *)v9 pk_anyObjectPassingTest:&__block_literal_global_36_0];
    coOwnerAccountUser = self->_coOwnerAccountUser;
    self->_coOwnerAccountUser = v20;
  }
  self->_coOwner = self->_coOwnerAccountUser != 0;

LABEL_18:
}

uint64_t __51__PKAccountUserCollection__updateWithAccountUsers___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isCurrentUser];
}

BOOL __51__PKAccountUserCollection__updateWithAccountUsers___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v3 = ([v2 isCurrentUser] & 1) == 0 && objc_msgSend(v2, "accessLevel") == 1;

  return v3;
}

- (NSSet)accountUsers
{
  return self->_accountUsers;
}

- (PKAccountUser)currentAccountUser
{
  return self->_currentAccountUser;
}

- (PKAccountUser)coOwnerAccountUser
{
  return self->_coOwnerAccountUser;
}

- (BOOL)isCoOwner
{
  return self->_coOwner;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coOwnerAccountUser, 0);
  objc_storeStrong((id *)&self->_currentAccountUser, 0);
  objc_storeStrong((id *)&self->_accountUsers, 0);
  objc_storeStrong((id *)&self->_accountUsersByAltDSID, 0);
}

@end