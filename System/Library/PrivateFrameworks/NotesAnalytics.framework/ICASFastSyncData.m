@interface ICASFastSyncData
+ (BOOL)requiresDiagnosticsConsent;
+ (NSString)dataName;
- (ICASFastSyncData)initWithFastSyncSessionId:(id)a3 participantVersions:(id)a4;
- (NSArray)participantVersions;
- (NSString)fastSyncSessionId;
- (id)toDict;
@end

@implementation ICASFastSyncData

- (ICASFastSyncData)initWithFastSyncSessionId:(id)a3 participantVersions:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ICASFastSyncData;
  v9 = [(ICASFastSyncData *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_fastSyncSessionId, a3);
    objc_storeStrong((id *)&v10->_participantVersions, a4);
  }

  return v10;
}

+ (NSString)dataName
{
  return (NSString *)@"FastSyncData";
}

+ (BOOL)requiresDiagnosticsConsent
{
  return 0;
}

- (id)toDict
{
  v12[2] = *MEMORY[0x1E4F143B8];
  v11[0] = @"fastSyncSessionId";
  v3 = [(ICASFastSyncData *)self fastSyncSessionId];
  if (v3)
  {
    uint64_t v4 = [(ICASFastSyncData *)self fastSyncSessionId];
  }
  else
  {
    uint64_t v4 = objc_opt_new();
  }
  v5 = (void *)v4;
  v11[1] = @"participantVersions";
  v12[0] = v4;
  v6 = [(ICASFastSyncData *)self participantVersions];
  if (v6)
  {
    uint64_t v7 = [(ICASFastSyncData *)self participantVersions];
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

- (NSString)fastSyncSessionId
{
  return self->_fastSyncSessionId;
}

- (NSArray)participantVersions
{
  return self->_participantVersions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_participantVersions, 0);
  objc_storeStrong((id *)&self->_fastSyncSessionId, 0);
}

@end