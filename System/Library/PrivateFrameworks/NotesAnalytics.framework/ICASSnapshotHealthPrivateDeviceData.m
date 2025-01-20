@interface ICASSnapshotHealthPrivateDeviceData
+ (BOOL)requiresDiagnosticsConsent;
+ (NSString)dataName;
- (ICASSnapshotHealthPrivateDeviceData)initWithSnapshotHealthPrivateDeviceID:(id)a3;
- (NSString)snapshotHealthPrivateDeviceID;
- (id)toDict;
@end

@implementation ICASSnapshotHealthPrivateDeviceData

- (ICASSnapshotHealthPrivateDeviceData)initWithSnapshotHealthPrivateDeviceID:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICASSnapshotHealthPrivateDeviceData;
  v6 = [(ICASSnapshotHealthPrivateDeviceData *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_snapshotHealthPrivateDeviceID, a3);
  }

  return v7;
}

+ (NSString)dataName
{
  return (NSString *)@"SnapshotHealthPrivateDeviceData";
}

+ (BOOL)requiresDiagnosticsConsent
{
  return 0;
}

- (id)toDict
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v8 = @"snapshotHealthPrivateDeviceID";
  v3 = [(ICASSnapshotHealthPrivateDeviceData *)self snapshotHealthPrivateDeviceID];
  if (v3)
  {
    uint64_t v4 = [(ICASSnapshotHealthPrivateDeviceData *)self snapshotHealthPrivateDeviceID];
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

- (NSString)snapshotHealthPrivateDeviceID
{
  return self->_snapshotHealthPrivateDeviceID;
}

- (void).cxx_destruct
{
}

@end