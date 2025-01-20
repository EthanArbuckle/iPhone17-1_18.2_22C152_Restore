@interface PKCloudStoreContainerDiagnosticSnapshot
+ (BOOL)supportsSecureCoding;
- (NSDictionary)localRecordIDs;
- (NSDictionary)recordIDs;
- (PKCloudStoreContainerDiagnosticSnapshot)initWithCoder:(id)a3;
- (PKCloudStoreContainerDiagnosticSnapshot)initWithRecordIDs:(id)a3 localRecordIDs:(id)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKCloudStoreContainerDiagnosticSnapshot

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKCloudStoreContainerDiagnosticSnapshot)initWithRecordIDs:(id)a3 localRecordIDs:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PKCloudStoreContainerDiagnosticSnapshot;
  v9 = [(PKCloudStoreContainerDiagnosticSnapshot *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_recordIDs, a3);
    objc_storeStrong((id *)&v10->_localRecordIDs, a4);
  }

  return v10;
}

- (PKCloudStoreContainerDiagnosticSnapshot)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)PKCloudStoreContainerDiagnosticSnapshot;
  v5 = [(PKCloudStoreContainerDiagnosticSnapshot *)&v19 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    v9 = objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"recordIDs"];
    recordIDs = v5->_recordIDs;
    v5->_recordIDs = (NSDictionary *)v10;

    objc_super v12 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_opt_class();
    v15 = objc_msgSend(v12, "setWithObjects:", v13, v14, objc_opt_class(), 0);
    uint64_t v16 = [v4 decodeObjectOfClasses:v15 forKey:@"localRecordIDs"];
    localRecordIDs = v5->_localRecordIDs;
    v5->_localRecordIDs = (NSDictionary *)v16;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  recordIDs = self->_recordIDs;
  id v5 = a3;
  [v5 encodeObject:recordIDs forKey:@"recordIDs"];
  [v5 encodeObject:self->_localRecordIDs forKey:@"localRecordIDs"];
}

- (NSDictionary)recordIDs
{
  return self->_recordIDs;
}

- (NSDictionary)localRecordIDs
{
  return self->_localRecordIDs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localRecordIDs, 0);
  objc_storeStrong((id *)&self->_recordIDs, 0);
}

@end