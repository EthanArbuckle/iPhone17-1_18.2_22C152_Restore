@interface ICASTableSnapshotItemData
+ (BOOL)requiresDiagnosticsConsent;
+ (NSString)dataName;
- (ICASTableSnapshotItemData)initWithTableRowCount:(id)a3 tableColumnCount:(id)a4;
- (NSNumber)tableColumnCount;
- (NSNumber)tableRowCount;
- (id)toDict;
@end

@implementation ICASTableSnapshotItemData

- (ICASTableSnapshotItemData)initWithTableRowCount:(id)a3 tableColumnCount:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ICASTableSnapshotItemData;
  v9 = [(ICASTableSnapshotItemData *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_tableRowCount, a3);
    objc_storeStrong((id *)&v10->_tableColumnCount, a4);
  }

  return v10;
}

+ (NSString)dataName
{
  return (NSString *)@"TableSnapshotItemData";
}

+ (BOOL)requiresDiagnosticsConsent
{
  return 0;
}

- (id)toDict
{
  v12[2] = *MEMORY[0x1E4F143B8];
  v11[0] = @"tableRowCount";
  v3 = [(ICASTableSnapshotItemData *)self tableRowCount];
  if (v3)
  {
    uint64_t v4 = [(ICASTableSnapshotItemData *)self tableRowCount];
  }
  else
  {
    uint64_t v4 = objc_opt_new();
  }
  v5 = (void *)v4;
  v11[1] = @"tableColumnCount";
  v12[0] = v4;
  v6 = [(ICASTableSnapshotItemData *)self tableColumnCount];
  if (v6)
  {
    uint64_t v7 = [(ICASTableSnapshotItemData *)self tableColumnCount];
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

- (NSNumber)tableRowCount
{
  return self->_tableRowCount;
}

- (NSNumber)tableColumnCount
{
  return self->_tableColumnCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableColumnCount, 0);
  objc_storeStrong((id *)&self->_tableRowCount, 0);
}

@end