@interface ICASDeviceSnapshotItemData
+ (BOOL)requiresDiagnosticsConsent;
+ (NSString)dataName;
- (ICASDeviceSnapshotItemData)initWithDeviceModel:(id)a3 devicePlatform:(id)a4 bioAuthEnabled:(id)a5 localNotesEnabled:(id)a6 osVersion:(id)a7 deviceID:(id)a8 audioTranscriptEnabled:(id)a9 audioSummaryEnabled:(id)a10 mathTextEnabled:(id)a11 mathHandwritingEnabled:(id)a12;
- (NSNumber)audioSummaryEnabled;
- (NSNumber)audioTranscriptEnabled;
- (NSNumber)bioAuthEnabled;
- (NSNumber)localNotesEnabled;
- (NSNumber)mathHandwritingEnabled;
- (NSNumber)mathTextEnabled;
- (NSString)deviceID;
- (NSString)deviceModel;
- (NSString)devicePlatform;
- (NSString)osVersion;
- (id)toDict;
@end

@implementation ICASDeviceSnapshotItemData

- (ICASDeviceSnapshotItemData)initWithDeviceModel:(id)a3 devicePlatform:(id)a4 bioAuthEnabled:(id)a5 localNotesEnabled:(id)a6 osVersion:(id)a7 deviceID:(id)a8 audioTranscriptEnabled:(id)a9 audioSummaryEnabled:(id)a10 mathTextEnabled:(id)a11 mathHandwritingEnabled:(id)a12
{
  id v34 = a3;
  id obj = a4;
  id v33 = a4;
  id v32 = a5;
  id v26 = a6;
  id v31 = a6;
  id v27 = a7;
  id v30 = a7;
  id v29 = a8;
  id v18 = a9;
  id v19 = a10;
  id v20 = a11;
  id v21 = a12;
  v35.receiver = self;
  v35.super_class = (Class)ICASDeviceSnapshotItemData;
  v22 = [(ICASDeviceSnapshotItemData *)&v35 init];
  v23 = v22;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_deviceModel, a3);
    objc_storeStrong((id *)&v23->_devicePlatform, obj);
    objc_storeStrong((id *)&v23->_bioAuthEnabled, a5);
    objc_storeStrong((id *)&v23->_localNotesEnabled, v26);
    objc_storeStrong((id *)&v23->_osVersion, v27);
    objc_storeStrong((id *)&v23->_deviceID, a8);
    objc_storeStrong((id *)&v23->_audioTranscriptEnabled, a9);
    objc_storeStrong((id *)&v23->_audioSummaryEnabled, a10);
    objc_storeStrong((id *)&v23->_mathTextEnabled, a11);
    objc_storeStrong((id *)&v23->_mathHandwritingEnabled, a12);
  }

  return v23;
}

+ (NSString)dataName
{
  return (NSString *)@"DeviceSnapshotItemData";
}

+ (BOOL)requiresDiagnosticsConsent
{
  return 0;
}

- (id)toDict
{
  v36[10] = *MEMORY[0x1E4F143B8];
  v35[0] = @"deviceModel";
  id v34 = [(ICASDeviceSnapshotItemData *)self deviceModel];
  if (v34)
  {
    uint64_t v3 = [(ICASDeviceSnapshotItemData *)self deviceModel];
  }
  else
  {
    uint64_t v3 = objc_opt_new();
  }
  id v33 = (void *)v3;
  v36[0] = v3;
  v35[1] = @"devicePlatform";
  id v32 = [(ICASDeviceSnapshotItemData *)self devicePlatform];
  if (v32)
  {
    uint64_t v4 = [(ICASDeviceSnapshotItemData *)self devicePlatform];
  }
  else
  {
    uint64_t v4 = objc_opt_new();
  }
  id v31 = (void *)v4;
  v36[1] = v4;
  v35[2] = @"bioAuthEnabled";
  id v30 = [(ICASDeviceSnapshotItemData *)self bioAuthEnabled];
  if (v30)
  {
    uint64_t v5 = [(ICASDeviceSnapshotItemData *)self bioAuthEnabled];
  }
  else
  {
    uint64_t v5 = objc_opt_new();
  }
  id v29 = (void *)v5;
  v36[2] = v5;
  v35[3] = @"localNotesEnabled";
  v28 = [(ICASDeviceSnapshotItemData *)self localNotesEnabled];
  if (v28)
  {
    uint64_t v6 = [(ICASDeviceSnapshotItemData *)self localNotesEnabled];
  }
  else
  {
    uint64_t v6 = objc_opt_new();
  }
  id v27 = (void *)v6;
  v36[3] = v6;
  v35[4] = @"osVersion";
  id v26 = [(ICASDeviceSnapshotItemData *)self osVersion];
  if (v26)
  {
    uint64_t v7 = [(ICASDeviceSnapshotItemData *)self osVersion];
  }
  else
  {
    uint64_t v7 = objc_opt_new();
  }
  v25 = (void *)v7;
  v36[4] = v7;
  v35[5] = @"deviceID";
  v24 = [(ICASDeviceSnapshotItemData *)self deviceID];
  if (v24)
  {
    uint64_t v8 = [(ICASDeviceSnapshotItemData *)self deviceID];
  }
  else
  {
    uint64_t v8 = objc_opt_new();
  }
  v9 = (void *)v8;
  v36[5] = v8;
  v35[6] = @"audioTranscriptEnabled";
  v10 = [(ICASDeviceSnapshotItemData *)self audioTranscriptEnabled];
  if (v10)
  {
    uint64_t v11 = [(ICASDeviceSnapshotItemData *)self audioTranscriptEnabled];
  }
  else
  {
    uint64_t v11 = objc_opt_new();
  }
  v12 = (void *)v11;
  v36[6] = v11;
  v35[7] = @"audioSummaryEnabled";
  v13 = [(ICASDeviceSnapshotItemData *)self audioSummaryEnabled];
  if (v13)
  {
    uint64_t v14 = [(ICASDeviceSnapshotItemData *)self audioSummaryEnabled];
  }
  else
  {
    uint64_t v14 = objc_opt_new();
  }
  v15 = (void *)v14;
  v36[7] = v14;
  v35[8] = @"mathTextEnabled";
  v16 = [(ICASDeviceSnapshotItemData *)self mathTextEnabled];
  if (v16)
  {
    uint64_t v17 = [(ICASDeviceSnapshotItemData *)self mathTextEnabled];
  }
  else
  {
    uint64_t v17 = objc_opt_new();
  }
  id v18 = (void *)v17;
  v36[8] = v17;
  v35[9] = @"mathHandwritingEnabled";
  id v19 = [(ICASDeviceSnapshotItemData *)self mathHandwritingEnabled];
  if (v19)
  {
    uint64_t v20 = [(ICASDeviceSnapshotItemData *)self mathHandwritingEnabled];
  }
  else
  {
    uint64_t v20 = objc_opt_new();
  }
  id v21 = (void *)v20;
  v36[9] = v20;
  v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:v35 count:10];

  return v22;
}

- (NSString)deviceModel
{
  return self->_deviceModel;
}

- (NSString)devicePlatform
{
  return self->_devicePlatform;
}

- (NSNumber)bioAuthEnabled
{
  return self->_bioAuthEnabled;
}

- (NSNumber)localNotesEnabled
{
  return self->_localNotesEnabled;
}

- (NSString)osVersion
{
  return self->_osVersion;
}

- (NSString)deviceID
{
  return self->_deviceID;
}

- (NSNumber)audioTranscriptEnabled
{
  return self->_audioTranscriptEnabled;
}

- (NSNumber)audioSummaryEnabled
{
  return self->_audioSummaryEnabled;
}

- (NSNumber)mathTextEnabled
{
  return self->_mathTextEnabled;
}

- (NSNumber)mathHandwritingEnabled
{
  return self->_mathHandwritingEnabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mathHandwritingEnabled, 0);
  objc_storeStrong((id *)&self->_mathTextEnabled, 0);
  objc_storeStrong((id *)&self->_audioSummaryEnabled, 0);
  objc_storeStrong((id *)&self->_audioTranscriptEnabled, 0);
  objc_storeStrong((id *)&self->_deviceID, 0);
  objc_storeStrong((id *)&self->_osVersion, 0);
  objc_storeStrong((id *)&self->_localNotesEnabled, 0);
  objc_storeStrong((id *)&self->_bioAuthEnabled, 0);
  objc_storeStrong((id *)&self->_devicePlatform, 0);
  objc_storeStrong((id *)&self->_deviceModel, 0);
}

@end