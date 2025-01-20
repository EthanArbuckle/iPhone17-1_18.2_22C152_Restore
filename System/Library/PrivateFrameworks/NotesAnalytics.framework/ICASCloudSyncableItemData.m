@interface ICASCloudSyncableItemData
+ (BOOL)requiresDiagnosticsConsent;
+ (NSString)dataName;
- (ICASCloudSyncableItemData)initWithSyncableDataType:(id)a3 count:(id)a4;
- (NSNumber)count;
- (NSString)syncableDataType;
- (id)toDict;
@end

@implementation ICASCloudSyncableItemData

- (ICASCloudSyncableItemData)initWithSyncableDataType:(id)a3 count:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ICASCloudSyncableItemData;
  v9 = [(ICASCloudSyncableItemData *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_syncableDataType, a3);
    objc_storeStrong((id *)&v10->_count, a4);
  }

  return v10;
}

+ (NSString)dataName
{
  return (NSString *)@"CloudSyncableItemData";
}

+ (BOOL)requiresDiagnosticsConsent
{
  return 0;
}

- (id)toDict
{
  v12[2] = *MEMORY[0x1E4F143B8];
  v11[0] = @"syncableDataType";
  v3 = [(ICASCloudSyncableItemData *)self syncableDataType];
  if (v3)
  {
    uint64_t v4 = [(ICASCloudSyncableItemData *)self syncableDataType];
  }
  else
  {
    uint64_t v4 = objc_opt_new();
  }
  v5 = (void *)v4;
  v11[1] = @"count";
  v12[0] = v4;
  v6 = [(ICASCloudSyncableItemData *)self count];
  if (v6)
  {
    uint64_t v7 = [(ICASCloudSyncableItemData *)self count];
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

- (NSString)syncableDataType
{
  return self->_syncableDataType;
}

- (NSNumber)count
{
  return self->_count;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_count, 0);
  objc_storeStrong((id *)&self->_syncableDataType, 0);
}

@end