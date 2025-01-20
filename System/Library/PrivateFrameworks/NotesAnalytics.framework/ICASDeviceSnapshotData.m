@interface ICASDeviceSnapshotData
+ (BOOL)requiresDiagnosticsConsent;
+ (NSString)dataName;
- (ICASDeviceSnapshotData)initWithUserStartMonth:(id)a3 userStartYear:(id)a4 saltVersion:(id)a5 accountTypeSummary:(id)a6 collabFoldersSummary:(id)a7 totalCountOfPinnedNotes:(id)a8 deviceSnapshotSummary:(id)a9 userSnapshotSummary:(id)a10;
- (NSArray)accountTypeSummary;
- (NSArray)collabFoldersSummary;
- (NSArray)deviceSnapshotSummary;
- (NSArray)userSnapshotSummary;
- (NSNumber)totalCountOfPinnedNotes;
- (NSNumber)userStartMonth;
- (NSNumber)userStartYear;
- (NSString)saltVersion;
- (id)toDict;
@end

@implementation ICASDeviceSnapshotData

- (ICASDeviceSnapshotData)initWithUserStartMonth:(id)a3 userStartYear:(id)a4 saltVersion:(id)a5 accountTypeSummary:(id)a6 collabFoldersSummary:(id)a7 totalCountOfPinnedNotes:(id)a8 deviceSnapshotSummary:(id)a9 userSnapshotSummary:(id)a10
{
  id v27 = a3;
  id v26 = a4;
  id v25 = a5;
  id v24 = a6;
  id v23 = a7;
  id v22 = a8;
  id v21 = a9;
  id v17 = a10;
  v28.receiver = self;
  v28.super_class = (Class)ICASDeviceSnapshotData;
  v18 = [(ICASDeviceSnapshotData *)&v28 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_userStartMonth, a3);
    objc_storeStrong((id *)&v19->_userStartYear, a4);
    objc_storeStrong((id *)&v19->_saltVersion, a5);
    objc_storeStrong((id *)&v19->_accountTypeSummary, a6);
    objc_storeStrong((id *)&v19->_collabFoldersSummary, a7);
    objc_storeStrong((id *)&v19->_totalCountOfPinnedNotes, a8);
    objc_storeStrong((id *)&v19->_deviceSnapshotSummary, a9);
    objc_storeStrong((id *)&v19->_userSnapshotSummary, a10);
  }

  return v19;
}

+ (NSString)dataName
{
  return (NSString *)@"DeviceSnapshotData";
}

+ (BOOL)requiresDiagnosticsConsent
{
  return 0;
}

- (id)toDict
{
  v30[8] = *MEMORY[0x1E4F143B8];
  v29[0] = @"userStartMonth";
  objc_super v28 = [(ICASDeviceSnapshotData *)self userStartMonth];
  if (v28)
  {
    uint64_t v3 = [(ICASDeviceSnapshotData *)self userStartMonth];
  }
  else
  {
    uint64_t v3 = objc_opt_new();
  }
  id v27 = (void *)v3;
  v30[0] = v3;
  v29[1] = @"userStartYear";
  id v26 = [(ICASDeviceSnapshotData *)self userStartYear];
  if (v26)
  {
    uint64_t v4 = [(ICASDeviceSnapshotData *)self userStartYear];
  }
  else
  {
    uint64_t v4 = objc_opt_new();
  }
  id v25 = (void *)v4;
  v30[1] = v4;
  v29[2] = @"saltVersion";
  id v24 = [(ICASDeviceSnapshotData *)self saltVersion];
  if (v24)
  {
    uint64_t v5 = [(ICASDeviceSnapshotData *)self saltVersion];
  }
  else
  {
    uint64_t v5 = objc_opt_new();
  }
  id v23 = (void *)v5;
  v30[2] = v5;
  v29[3] = @"accountTypeSummary";
  id v22 = [(ICASDeviceSnapshotData *)self accountTypeSummary];
  if (v22)
  {
    uint64_t v6 = [(ICASDeviceSnapshotData *)self accountTypeSummary];
  }
  else
  {
    uint64_t v6 = objc_opt_new();
  }
  v7 = (void *)v6;
  v30[3] = v6;
  v29[4] = @"collabFoldersSummary";
  v8 = [(ICASDeviceSnapshotData *)self collabFoldersSummary];
  if (v8)
  {
    uint64_t v9 = [(ICASDeviceSnapshotData *)self collabFoldersSummary];
  }
  else
  {
    uint64_t v9 = objc_opt_new();
  }
  v10 = (void *)v9;
  v30[4] = v9;
  v29[5] = @"totalCountOfPinnedNotes";
  v11 = [(ICASDeviceSnapshotData *)self totalCountOfPinnedNotes];
  if (v11)
  {
    uint64_t v12 = [(ICASDeviceSnapshotData *)self totalCountOfPinnedNotes];
  }
  else
  {
    uint64_t v12 = objc_opt_new();
  }
  v13 = (void *)v12;
  v30[5] = v12;
  v29[6] = @"deviceSnapshotSummary";
  v14 = [(ICASDeviceSnapshotData *)self deviceSnapshotSummary];
  if (v14)
  {
    uint64_t v15 = [(ICASDeviceSnapshotData *)self deviceSnapshotSummary];
  }
  else
  {
    uint64_t v15 = objc_opt_new();
  }
  v16 = (void *)v15;
  v30[6] = v15;
  v29[7] = @"userSnapshotSummary";
  id v17 = [(ICASDeviceSnapshotData *)self userSnapshotSummary];
  if (v17)
  {
    uint64_t v18 = [(ICASDeviceSnapshotData *)self userSnapshotSummary];
  }
  else
  {
    uint64_t v18 = objc_opt_new();
  }
  v19 = (void *)v18;
  v30[7] = v18;
  v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:8];

  return v20;
}

- (NSNumber)userStartMonth
{
  return self->_userStartMonth;
}

- (NSNumber)userStartYear
{
  return self->_userStartYear;
}

- (NSString)saltVersion
{
  return self->_saltVersion;
}

- (NSArray)accountTypeSummary
{
  return self->_accountTypeSummary;
}

- (NSArray)collabFoldersSummary
{
  return self->_collabFoldersSummary;
}

- (NSNumber)totalCountOfPinnedNotes
{
  return self->_totalCountOfPinnedNotes;
}

- (NSArray)deviceSnapshotSummary
{
  return self->_deviceSnapshotSummary;
}

- (NSArray)userSnapshotSummary
{
  return self->_userSnapshotSummary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userSnapshotSummary, 0);
  objc_storeStrong((id *)&self->_deviceSnapshotSummary, 0);
  objc_storeStrong((id *)&self->_totalCountOfPinnedNotes, 0);
  objc_storeStrong((id *)&self->_collabFoldersSummary, 0);
  objc_storeStrong((id *)&self->_accountTypeSummary, 0);
  objc_storeStrong((id *)&self->_saltVersion, 0);
  objc_storeStrong((id *)&self->_userStartYear, 0);
  objc_storeStrong((id *)&self->_userStartMonth, 0);
}

@end