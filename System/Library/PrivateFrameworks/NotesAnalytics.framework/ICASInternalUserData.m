@interface ICASInternalUserData
+ (BOOL)requiresDiagnosticsConsent;
+ (NSString)dataName;
- (ICASInternalUserData)initWithRawUserDSID:(id)a3;
- (NSString)rawUserDSID;
- (id)toDict;
@end

@implementation ICASInternalUserData

- (ICASInternalUserData)initWithRawUserDSID:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICASInternalUserData;
  v6 = [(ICASInternalUserData *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_rawUserDSID, a3);
  }

  return v7;
}

+ (NSString)dataName
{
  return (NSString *)@"InternalUserData";
}

+ (BOOL)requiresDiagnosticsConsent
{
  return 0;
}

- (id)toDict
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v8 = @"rawUserDSID";
  v3 = [(ICASInternalUserData *)self rawUserDSID];
  if (v3)
  {
    uint64_t v4 = [(ICASInternalUserData *)self rawUserDSID];
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

- (NSString)rawUserDSID
{
  return self->_rawUserDSID;
}

- (void).cxx_destruct
{
}

@end