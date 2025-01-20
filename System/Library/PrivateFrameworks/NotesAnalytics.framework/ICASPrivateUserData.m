@interface ICASPrivateUserData
+ (BOOL)requiresDiagnosticsConsent;
+ (NSString)dataName;
- (ICASPrivateUserData)initWithPrivateUserID:(id)a3 saltVersion:(id)a4 userStartMonth:(id)a5 userStartYear:(id)a6;
- (NSNumber)userStartMonth;
- (NSNumber)userStartYear;
- (NSString)privateUserID;
- (NSString)saltVersion;
- (id)toDict;
@end

@implementation ICASPrivateUserData

- (ICASPrivateUserData)initWithPrivateUserID:(id)a3 saltVersion:(id)a4 userStartMonth:(id)a5 userStartYear:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)ICASPrivateUserData;
  v15 = [(ICASPrivateUserData *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_privateUserID, a3);
    objc_storeStrong((id *)&v16->_saltVersion, a4);
    objc_storeStrong((id *)&v16->_userStartMonth, a5);
    objc_storeStrong((id *)&v16->_userStartYear, a6);
  }

  return v16;
}

+ (NSString)dataName
{
  return (NSString *)@"PrivateUserData";
}

+ (BOOL)requiresDiagnosticsConsent
{
  return 0;
}

- (id)toDict
{
  v18[4] = *MEMORY[0x1E4F143B8];
  v17[0] = @"privateUserID";
  v3 = [(ICASPrivateUserData *)self privateUserID];
  if (v3)
  {
    uint64_t v4 = [(ICASPrivateUserData *)self privateUserID];
  }
  else
  {
    uint64_t v4 = objc_opt_new();
  }
  v5 = (void *)v4;
  v18[0] = v4;
  v17[1] = @"saltVersion";
  v6 = [(ICASPrivateUserData *)self saltVersion];
  if (v6)
  {
    uint64_t v7 = [(ICASPrivateUserData *)self saltVersion];
  }
  else
  {
    uint64_t v7 = objc_opt_new();
  }
  v8 = (void *)v7;
  v18[1] = v7;
  v17[2] = @"userStartMonth";
  v9 = [(ICASPrivateUserData *)self userStartMonth];
  if (v9)
  {
    uint64_t v10 = [(ICASPrivateUserData *)self userStartMonth];
  }
  else
  {
    uint64_t v10 = objc_opt_new();
  }
  id v11 = (void *)v10;
  v18[2] = v10;
  v17[3] = @"userStartYear";
  id v12 = [(ICASPrivateUserData *)self userStartYear];
  if (v12)
  {
    uint64_t v13 = [(ICASPrivateUserData *)self userStartYear];
  }
  else
  {
    uint64_t v13 = objc_opt_new();
  }
  id v14 = (void *)v13;
  v18[3] = v13;
  v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:4];

  return v15;
}

- (NSString)privateUserID
{
  return self->_privateUserID;
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
  objc_storeStrong((id *)&self->_privateUserID, 0);
}

@end