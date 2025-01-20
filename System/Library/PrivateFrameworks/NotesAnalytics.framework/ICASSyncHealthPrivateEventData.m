@interface ICASSyncHealthPrivateEventData
+ (BOOL)requiresDiagnosticsConsent;
+ (NSString)dataName;
- (ICASSyncHealthPrivateEventData)initWithSyncHealthPrivateSessionID:(id)a3;
- (NSString)syncHealthPrivateSessionID;
- (id)toDict;
@end

@implementation ICASSyncHealthPrivateEventData

- (ICASSyncHealthPrivateEventData)initWithSyncHealthPrivateSessionID:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICASSyncHealthPrivateEventData;
  v6 = [(ICASSyncHealthPrivateEventData *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_syncHealthPrivateSessionID, a3);
  }

  return v7;
}

+ (NSString)dataName
{
  return (NSString *)@"SyncHealthPrivateEventData";
}

+ (BOOL)requiresDiagnosticsConsent
{
  return 0;
}

- (id)toDict
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v8 = @"syncHealthPrivateSessionID";
  v3 = [(ICASSyncHealthPrivateEventData *)self syncHealthPrivateSessionID];
  if (v3)
  {
    uint64_t v4 = [(ICASSyncHealthPrivateEventData *)self syncHealthPrivateSessionID];
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

- (NSString)syncHealthPrivateSessionID
{
  return self->_syncHealthPrivateSessionID;
}

- (void).cxx_destruct
{
}

@end