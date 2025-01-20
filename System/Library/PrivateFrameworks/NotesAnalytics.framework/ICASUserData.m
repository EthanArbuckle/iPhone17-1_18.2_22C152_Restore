@interface ICASUserData
+ (BOOL)requiresDiagnosticsConsent;
+ (NSString)dataName;
- (ICASUserData)initWithUserID:(id)a3 userStorefrontID:(id)a4 saltVersion:(id)a5 userStartMonth:(id)a6 userStartYear:(id)a7;
- (NSNumber)userStartMonth;
- (NSNumber)userStartYear;
- (NSString)saltVersion;
- (NSString)userID;
- (NSString)userStorefrontID;
- (id)toDict;
@end

@implementation ICASUserData

- (ICASUserData)initWithUserID:(id)a3 userStorefrontID:(id)a4 saltVersion:(id)a5 userStartMonth:(id)a6 userStartYear:(id)a7
{
  id v20 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)ICASUserData;
  v17 = [(ICASUserData *)&v21 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_userID, a3);
    objc_storeStrong((id *)&v18->_userStorefrontID, a4);
    objc_storeStrong((id *)&v18->_saltVersion, a5);
    objc_storeStrong((id *)&v18->_userStartMonth, a6);
    objc_storeStrong((id *)&v18->_userStartYear, a7);
  }

  return v18;
}

+ (NSString)dataName
{
  return (NSString *)@"UserData";
}

+ (BOOL)requiresDiagnosticsConsent
{
  return 0;
}

- (id)toDict
{
  v22[5] = *MEMORY[0x1E4F143B8];
  v21[0] = @"userID";
  uint64_t v19 = [(ICASUserData *)self userID];
  if (v19)
  {
    uint64_t v3 = [(ICASUserData *)self userID];
  }
  else
  {
    uint64_t v3 = objc_opt_new();
  }
  v4 = (void *)v3;
  v22[0] = v3;
  v21[1] = @"userStorefrontID";
  v5 = [(ICASUserData *)self userStorefrontID];
  if (v5)
  {
    uint64_t v6 = [(ICASUserData *)self userStorefrontID];
  }
  else
  {
    uint64_t v6 = objc_opt_new();
  }
  v7 = (void *)v6;
  v22[1] = v6;
  v21[2] = @"saltVersion";
  v8 = [(ICASUserData *)self saltVersion];
  if (v8)
  {
    uint64_t v9 = [(ICASUserData *)self saltVersion];
  }
  else
  {
    uint64_t v9 = objc_opt_new();
  }
  v10 = (void *)v9;
  v22[2] = v9;
  v21[3] = @"userStartMonth";
  v11 = [(ICASUserData *)self userStartMonth];
  if (v11)
  {
    uint64_t v12 = [(ICASUserData *)self userStartMonth];
  }
  else
  {
    uint64_t v12 = objc_opt_new();
  }
  id v13 = (void *)v12;
  v22[3] = v12;
  v21[4] = @"userStartYear";
  id v14 = [(ICASUserData *)self userStartYear];
  if (v14)
  {
    uint64_t v15 = [(ICASUserData *)self userStartYear];
  }
  else
  {
    uint64_t v15 = objc_opt_new();
  }
  id v16 = (void *)v15;
  v22[4] = v15;
  v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:5];

  return v17;
}

- (NSString)userID
{
  return self->_userID;
}

- (NSString)userStorefrontID
{
  return self->_userStorefrontID;
}

- (NSString)saltVersion
{
  return self->_saltVersion;
}

- (NSNumber)userStartMonth
{
  return self->_userStartMonth;
}

- (NSNumber)userStartYear
{
  return self->_userStartYear;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userStartYear, 0);
  objc_storeStrong((id *)&self->_userStartMonth, 0);
  objc_storeStrong((id *)&self->_saltVersion, 0);
  objc_storeStrong((id *)&self->_userStorefrontID, 0);
  objc_storeStrong((id *)&self->_userID, 0);
}

@end