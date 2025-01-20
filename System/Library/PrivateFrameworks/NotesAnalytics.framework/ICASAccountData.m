@interface ICASAccountData
+ (BOOL)requiresDiagnosticsConsent;
+ (NSString)dataName;
- (ICASAccountData)initWithAccountType:(id)a3 accountID:(id)a4;
- (ICASAccountType)accountType;
- (NSString)accountID;
- (id)toDict;
@end

@implementation ICASAccountData

- (ICASAccountData)initWithAccountType:(id)a3 accountID:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ICASAccountData;
  v9 = [(ICASAccountData *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_accountType, a3);
    objc_storeStrong((id *)&v10->_accountID, a4);
  }

  return v10;
}

+ (NSString)dataName
{
  return (NSString *)@"AccountData";
}

+ (BOOL)requiresDiagnosticsConsent
{
  return 0;
}

- (id)toDict
{
  v12[2] = *MEMORY[0x1E4F143B8];
  v11[0] = @"accountType";
  v3 = [(ICASAccountData *)self accountType];
  if (v3)
  {
    uint64_t v4 = [(ICASAccountData *)self accountType];
  }
  else
  {
    uint64_t v4 = objc_opt_new();
  }
  v5 = (void *)v4;
  v11[1] = @"accountID";
  v12[0] = v4;
  v6 = [(ICASAccountData *)self accountID];
  if (v6)
  {
    uint64_t v7 = [(ICASAccountData *)self accountID];
  }
  else
  {
    uint64_t v7 = objc_opt_new();
  }
  id v8 = (void *)v7;
  v12[1] = v7;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];

  return v9;
}

- (ICASAccountType)accountType
{
  return self->_accountType;
}

- (NSString)accountID
{
  return self->_accountID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountID, 0);
  objc_storeStrong((id *)&self->_accountType, 0);
}

@end