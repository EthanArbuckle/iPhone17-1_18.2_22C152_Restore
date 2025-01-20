@interface ICASPartialCloudErrorItemData
+ (BOOL)requiresDiagnosticsConsent;
+ (NSString)dataName;
- (ICASPartialCloudErrorItemData)initWithSyncableDataType:(id)a3 errorCode:(id)a4 count:(id)a5 errorString:(id)a6;
- (NSNumber)count;
- (NSNumber)errorCode;
- (NSString)errorString;
- (NSString)syncableDataType;
- (id)toDict;
@end

@implementation ICASPartialCloudErrorItemData

- (ICASPartialCloudErrorItemData)initWithSyncableDataType:(id)a3 errorCode:(id)a4 count:(id)a5 errorString:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)ICASPartialCloudErrorItemData;
  v15 = [(ICASPartialCloudErrorItemData *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_syncableDataType, a3);
    objc_storeStrong((id *)&v16->_errorCode, a4);
    objc_storeStrong((id *)&v16->_count, a5);
    objc_storeStrong((id *)&v16->_errorString, a6);
  }

  return v16;
}

+ (NSString)dataName
{
  return (NSString *)@"PartialCloudErrorItemData";
}

+ (BOOL)requiresDiagnosticsConsent
{
  return 0;
}

- (id)toDict
{
  v18[4] = *MEMORY[0x1E4F143B8];
  v17[0] = @"syncableDataType";
  v3 = [(ICASPartialCloudErrorItemData *)self syncableDataType];
  if (v3)
  {
    uint64_t v4 = [(ICASPartialCloudErrorItemData *)self syncableDataType];
  }
  else
  {
    uint64_t v4 = objc_opt_new();
  }
  v5 = (void *)v4;
  v18[0] = v4;
  v17[1] = @"errorCode";
  v6 = [(ICASPartialCloudErrorItemData *)self errorCode];
  if (v6)
  {
    uint64_t v7 = [(ICASPartialCloudErrorItemData *)self errorCode];
  }
  else
  {
    uint64_t v7 = objc_opt_new();
  }
  v8 = (void *)v7;
  v18[1] = v7;
  v17[2] = @"count";
  v9 = [(ICASPartialCloudErrorItemData *)self count];
  if (v9)
  {
    uint64_t v10 = [(ICASPartialCloudErrorItemData *)self count];
  }
  else
  {
    uint64_t v10 = objc_opt_new();
  }
  id v11 = (void *)v10;
  v18[2] = v10;
  v17[3] = @"errorString";
  id v12 = [(ICASPartialCloudErrorItemData *)self errorString];
  if (v12)
  {
    uint64_t v13 = [(ICASPartialCloudErrorItemData *)self errorString];
  }
  else
  {
    uint64_t v13 = objc_opt_new();
  }
  id v14 = (void *)v13;
  v18[3] = v13;
  v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:4];

  return v15;
}

- (NSString)syncableDataType
{
  return self->_syncableDataType;
}

- (NSNumber)errorCode
{
  return self->_errorCode;
}

- (NSNumber)count
{
  return self->_count;
}

- (NSString)errorString
{
  return self->_errorString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorString, 0);
  objc_storeStrong((id *)&self->_count, 0);
  objc_storeStrong((id *)&self->_errorCode, 0);
  objc_storeStrong((id *)&self->_syncableDataType, 0);
}

@end