@interface ICASSnapshotHealthPrivateUserData
+ (BOOL)requiresDiagnosticsConsent;
+ (NSString)dataName;
- (ICASSnapshotHealthPrivateUserData)initWithSnapshotHealthPrivateUserID:(id)a3;
- (NSString)snapshotHealthPrivateUserID;
- (id)toDict;
@end

@implementation ICASSnapshotHealthPrivateUserData

- (ICASSnapshotHealthPrivateUserData)initWithSnapshotHealthPrivateUserID:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICASSnapshotHealthPrivateUserData;
  v6 = [(ICASSnapshotHealthPrivateUserData *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_snapshotHealthPrivateUserID, a3);
  }

  return v7;
}

+ (NSString)dataName
{
  return (NSString *)@"SnapshotHealthPrivateUserData";
}

+ (BOOL)requiresDiagnosticsConsent
{
  return 0;
}

- (id)toDict
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v8 = @"snapshotHealthPrivateUserID";
  v3 = [(ICASSnapshotHealthPrivateUserData *)self snapshotHealthPrivateUserID];
  if (v3)
  {
    uint64_t v4 = [(ICASSnapshotHealthPrivateUserData *)self snapshotHealthPrivateUserID];
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

- (NSString)snapshotHealthPrivateUserID
{
  return self->_snapshotHealthPrivateUserID;
}

- (void).cxx_destruct
{
}

@end