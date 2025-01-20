@interface ICASSyncHealthPrivateUserData
+ (BOOL)requiresDiagnosticsConsent;
+ (NSString)dataName;
- (ICASSyncHealthPrivateUserData)initWithSyncHealthPrivateUserID:(id)a3;
- (NSString)syncHealthPrivateUserID;
- (id)toDict;
@end

@implementation ICASSyncHealthPrivateUserData

- (ICASSyncHealthPrivateUserData)initWithSyncHealthPrivateUserID:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICASSyncHealthPrivateUserData;
  v6 = [(ICASSyncHealthPrivateUserData *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_syncHealthPrivateUserID, a3);
  }

  return v7;
}

+ (NSString)dataName
{
  return (NSString *)@"SyncHealthPrivateUserData";
}

+ (BOOL)requiresDiagnosticsConsent
{
  return 0;
}

- (id)toDict
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v8 = @"syncHealthPrivateUserID";
  v3 = [(ICASSyncHealthPrivateUserData *)self syncHealthPrivateUserID];
  if (v3)
  {
    uint64_t v4 = [(ICASSyncHealthPrivateUserData *)self syncHealthPrivateUserID];
  }
  else
  {
    uint64_t v4 = objc_opt_new();
  }
  id v5 = (void *)v4;
  v9[0] = v4;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];

  return v6;
}

- (NSString)syncHealthPrivateUserID
{
  return self->_syncHealthPrivateUserID;
}

- (void).cxx_destruct
{
}

@end