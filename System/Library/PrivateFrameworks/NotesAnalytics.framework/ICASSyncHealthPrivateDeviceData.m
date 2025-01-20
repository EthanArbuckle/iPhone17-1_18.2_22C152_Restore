@interface ICASSyncHealthPrivateDeviceData
+ (BOOL)requiresDiagnosticsConsent;
+ (NSString)dataName;
- (ICASSyncHealthPrivateDeviceData)initWithSyncHealthPrivateDeviceID:(id)a3;
- (NSString)syncHealthPrivateDeviceID;
- (id)toDict;
@end

@implementation ICASSyncHealthPrivateDeviceData

- (ICASSyncHealthPrivateDeviceData)initWithSyncHealthPrivateDeviceID:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICASSyncHealthPrivateDeviceData;
  v6 = [(ICASSyncHealthPrivateDeviceData *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_syncHealthPrivateDeviceID, a3);
  }

  return v7;
}

+ (NSString)dataName
{
  return (NSString *)@"SyncHealthPrivateDeviceData";
}

+ (BOOL)requiresDiagnosticsConsent
{
  return 0;
}

- (id)toDict
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v8 = @"syncHealthPrivateDeviceID";
  v3 = [(ICASSyncHealthPrivateDeviceData *)self syncHealthPrivateDeviceID];
  if (v3)
  {
    uint64_t v4 = [(ICASSyncHealthPrivateDeviceData *)self syncHealthPrivateDeviceID];
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

- (NSString)syncHealthPrivateDeviceID
{
  return self->_syncHealthPrivateDeviceID;
}

- (void).cxx_destruct
{
}

@end