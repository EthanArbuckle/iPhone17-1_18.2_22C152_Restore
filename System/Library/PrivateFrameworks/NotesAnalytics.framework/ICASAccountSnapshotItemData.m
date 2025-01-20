@interface ICASAccountSnapshotItemData
+ (BOOL)requiresDiagnosticsConsent;
+ (NSString)dataName;
- (ICASAccountPurpose)accountPurpose;
- (ICASAccountSnapshotItemData)initWithAccountID:(id)a3 accountType:(id)a4 accountPurpose:(id)a5;
- (ICASAccountType)accountType;
- (NSString)accountID;
- (id)toDict;
@end

@implementation ICASAccountSnapshotItemData

- (ICASAccountSnapshotItemData)initWithAccountID:(id)a3 accountType:(id)a4 accountPurpose:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)ICASAccountSnapshotItemData;
  v12 = [(ICASAccountSnapshotItemData *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_accountID, a3);
    objc_storeStrong((id *)&v13->_accountType, a4);
    objc_storeStrong((id *)&v13->_accountPurpose, a5);
  }

  return v13;
}

+ (NSString)dataName
{
  return (NSString *)@"AccountSnapshotItemData";
}

+ (BOOL)requiresDiagnosticsConsent
{
  return 0;
}

- (id)toDict
{
  v15[3] = *MEMORY[0x1E4F143B8];
  v14[0] = @"accountID";
  v3 = [(ICASAccountSnapshotItemData *)self accountID];
  if (v3)
  {
    uint64_t v4 = [(ICASAccountSnapshotItemData *)self accountID];
  }
  else
  {
    uint64_t v4 = objc_opt_new();
  }
  v5 = (void *)v4;
  v15[0] = v4;
  v14[1] = @"accountType";
  v6 = [(ICASAccountSnapshotItemData *)self accountType];
  if (v6)
  {
    uint64_t v7 = [(ICASAccountSnapshotItemData *)self accountType];
  }
  else
  {
    uint64_t v7 = objc_opt_new();
  }
  v8 = (void *)v7;
  v15[1] = v7;
  v14[2] = @"accountPurpose";
  id v9 = [(ICASAccountSnapshotItemData *)self accountPurpose];
  if (v9)
  {
    uint64_t v10 = [(ICASAccountSnapshotItemData *)self accountPurpose];
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

- (NSString)accountID
{
  return self->_accountID;
}

- (ICASAccountType)accountType
{
  return self->_accountType;
}

- (ICASAccountPurpose)accountPurpose
{
  return self->_accountPurpose;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountPurpose, 0);
  objc_storeStrong((id *)&self->_accountType, 0);
  objc_storeStrong((id *)&self->_accountID, 0);
}

@end