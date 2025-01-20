@interface ICASDocScanSnapshotItemData
+ (BOOL)requiresDiagnosticsConsent;
+ (NSString)dataName;
- (ICASDocScanSnapshotItemData)initWithDocScanLength:(id)a3;
- (NSNumber)docScanLength;
- (id)toDict;
@end

@implementation ICASDocScanSnapshotItemData

- (ICASDocScanSnapshotItemData)initWithDocScanLength:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICASDocScanSnapshotItemData;
  v6 = [(ICASDocScanSnapshotItemData *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_docScanLength, a3);
  }

  return v7;
}

+ (NSString)dataName
{
  return (NSString *)@"DocScanSnapshotItemData";
}

+ (BOOL)requiresDiagnosticsConsent
{
  return 0;
}

- (id)toDict
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v8 = @"docScanLength";
  v3 = [(ICASDocScanSnapshotItemData *)self docScanLength];
  if (v3)
  {
    uint64_t v4 = [(ICASDocScanSnapshotItemData *)self docScanLength];
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

- (NSNumber)docScanLength
{
  return self->_docScanLength;
}

- (void).cxx_destruct
{
}

@end