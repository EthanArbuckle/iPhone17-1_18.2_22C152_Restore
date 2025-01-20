@interface CKContainer(Metadata)
- (id)wf_metaDataDeviceQueryOperation;
- (uint64_t)wf_fetchDeviceRecords:()Metadata;
- (void)wf_fetchDeviceRecordsWithCursor:()Metadata results:completion:;
@end

@implementation CKContainer(Metadata)

- (void)wf_fetchDeviceRecordsWithCursor:()Metadata results:completion:
{
  id v7 = a4;
  id v8 = a5;
  if (!v7) {
    id v7 = (id)objc_opt_new();
  }
  v9 = objc_msgSend(a1, "wf_metaDataDeviceQueryOperation");
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __76__CKContainer_Metadata__wf_fetchDeviceRecordsWithCursor_results_completion___block_invoke;
  v22[3] = &unk_1E65574D0;
  id v10 = v7;
  id v23 = v10;
  [v9 setRecordMatchedBlock:v22];
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  v17 = __76__CKContainer_Metadata__wf_fetchDeviceRecordsWithCursor_results_completion___block_invoke_2;
  v18 = &unk_1E65574F8;
  v19 = a1;
  id v20 = v10;
  id v21 = v8;
  id v11 = v8;
  id v12 = v10;
  [v9 setQueryCompletionBlock:&v15];
  v13 = objc_msgSend(MEMORY[0x1E4F19EC8], "wf_shortcutsContainer", v15, v16, v17, v18, v19);
  v14 = [v13 privateCloudDatabase];
  [v14 addOperation:v9];
}

- (id)wf_metaDataDeviceQueryOperation
{
  v7[2] = *MEMORY[0x1E4F143B8];
  v0 = [MEMORY[0x1E4F28F60] predicateWithValue:1];
  v1 = (void *)[objc_alloc(MEMORY[0x1E4F1A2A0]) initWithRecordType:@"metadata_device_type" predicate:v0];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F1A2B8]) initWithQuery:v1];
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F1A310]) initWithZoneName:@"metadata_zone"];
  v4 = [v3 zoneID];
  [v2 setZoneID:v4];

  v7[0] = @"DeviceOSType";
  v7[1] = @"DeviceOSVersionNumber";
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:2];
  [v2 setDesiredKeys:v5];

  return v2;
}

- (uint64_t)wf_fetchDeviceRecords:()Metadata
{
  return objc_msgSend(a1, "wf_fetchDeviceRecordsWithCursor:results:completion:", 0, 0, a3);
}

@end