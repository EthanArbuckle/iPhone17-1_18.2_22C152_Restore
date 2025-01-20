@interface ICASDocScanData
+ (BOOL)requiresDiagnosticsConsent;
+ (NSString)dataName;
- (ICASDocScanActionType)docScanActionType;
- (ICASDocScanData)initWithDocScanID:(id)a3 docScanActionType:(id)a4 docScanStage:(id)a5;
- (ICASDocScanStage)docScanStage;
- (NSString)docScanID;
- (id)toDict;
@end

@implementation ICASDocScanData

- (ICASDocScanData)initWithDocScanID:(id)a3 docScanActionType:(id)a4 docScanStage:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)ICASDocScanData;
  v12 = [(ICASDocScanData *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_docScanID, a3);
    objc_storeStrong((id *)&v13->_docScanActionType, a4);
    objc_storeStrong((id *)&v13->_docScanStage, a5);
  }

  return v13;
}

+ (NSString)dataName
{
  return (NSString *)@"DocScanData";
}

+ (BOOL)requiresDiagnosticsConsent
{
  return 0;
}

- (id)toDict
{
  v15[3] = *MEMORY[0x1E4F143B8];
  v14[0] = @"docScanID";
  v3 = [(ICASDocScanData *)self docScanID];
  if (v3)
  {
    uint64_t v4 = [(ICASDocScanData *)self docScanID];
  }
  else
  {
    uint64_t v4 = objc_opt_new();
  }
  v5 = (void *)v4;
  v15[0] = v4;
  v14[1] = @"docScanActionType";
  v6 = [(ICASDocScanData *)self docScanActionType];
  if (v6)
  {
    uint64_t v7 = [(ICASDocScanData *)self docScanActionType];
  }
  else
  {
    uint64_t v7 = objc_opt_new();
  }
  v8 = (void *)v7;
  v15[1] = v7;
  v14[2] = @"docScanStage";
  id v9 = [(ICASDocScanData *)self docScanStage];
  if (v9)
  {
    uint64_t v10 = [(ICASDocScanData *)self docScanStage];
  }
  else
  {
    uint64_t v10 = objc_opt_new();
  }
  id v11 = (void *)v10;
  v15[2] = v10;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:3];

  return v12;
}

- (NSString)docScanID
{
  return self->_docScanID;
}

- (ICASDocScanActionType)docScanActionType
{
  return self->_docScanActionType;
}

- (ICASDocScanStage)docScanStage
{
  return self->_docScanStage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_docScanStage, 0);
  objc_storeStrong((id *)&self->_docScanActionType, 0);
  objc_storeStrong((id *)&self->_docScanID, 0);
}

@end