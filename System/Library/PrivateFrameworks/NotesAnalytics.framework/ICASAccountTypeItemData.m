@interface ICASAccountTypeItemData
+ (BOOL)requiresDiagnosticsConsent;
+ (NSString)dataName;
- (ICASAccountType)accountType;
- (ICASAccountTypeItemData)initWithAccountType:(id)a3 countOfAccounts:(id)a4 countOfNotes:(id)a5;
- (NSNumber)countOfAccounts;
- (NSNumber)countOfNotes;
- (id)toDict;
@end

@implementation ICASAccountTypeItemData

- (ICASAccountTypeItemData)initWithAccountType:(id)a3 countOfAccounts:(id)a4 countOfNotes:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)ICASAccountTypeItemData;
  v12 = [(ICASAccountTypeItemData *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_accountType, a3);
    objc_storeStrong((id *)&v13->_countOfAccounts, a4);
    objc_storeStrong((id *)&v13->_countOfNotes, a5);
  }

  return v13;
}

+ (NSString)dataName
{
  return (NSString *)@"AccountTypeItemData";
}

+ (BOOL)requiresDiagnosticsConsent
{
  return 0;
}

- (id)toDict
{
  v15[3] = *MEMORY[0x1E4F143B8];
  v14[0] = @"accountType";
  v3 = [(ICASAccountTypeItemData *)self accountType];
  if (v3)
  {
    uint64_t v4 = [(ICASAccountTypeItemData *)self accountType];
  }
  else
  {
    uint64_t v4 = objc_opt_new();
  }
  v5 = (void *)v4;
  v15[0] = v4;
  v14[1] = @"countOfAccounts";
  v6 = [(ICASAccountTypeItemData *)self countOfAccounts];
  if (v6)
  {
    uint64_t v7 = [(ICASAccountTypeItemData *)self countOfAccounts];
  }
  else
  {
    uint64_t v7 = objc_opt_new();
  }
  v8 = (void *)v7;
  v15[1] = v7;
  v14[2] = @"countOfNotes";
  id v9 = [(ICASAccountTypeItemData *)self countOfNotes];
  if (v9)
  {
    uint64_t v10 = [(ICASAccountTypeItemData *)self countOfNotes];
  }
  else
  {
    uint64_t v10 = objc_opt_new();
  }
  id v11 = (void *)v10;
  v15[2] = v10;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:3];

  return v12;
}

- (ICASAccountType)accountType
{
  return self->_accountType;
}

- (NSNumber)countOfAccounts
{
  return self->_countOfAccounts;
}

- (NSNumber)countOfNotes
{
  return self->_countOfNotes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_countOfNotes, 0);
  objc_storeStrong((id *)&self->_countOfAccounts, 0);
  objc_storeStrong((id *)&self->_accountType, 0);
}

@end