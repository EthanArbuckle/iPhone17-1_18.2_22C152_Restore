@interface PKWebServiceContext
+ (BOOL)supportsSecureCoding;
+ (id)contextWithArchive:(id)a3;
+ (id)contextWithArchive:(id)a3 error:(id *)a4;
- (BOOL)archiveAtPath:(id)a3 error:(id *)a4;
- (PKWebServiceContext)initWithCoder:(id)a3;
- (void)archiveAtPath:(id)a3;
@end

@implementation PKWebServiceContext

+ (id)contextWithArchive:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v9 = 0;
  v3 = [a1 contextWithArchive:a3 error:&v9];
  id v4 = v9;
  if (v4)
  {
    v5 = PKLogFacilityTypeGetObject(0);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = objc_opt_class();
      *(_DWORD *)buf = 138412546;
      v11 = v6;
      __int16 v12 = 2112;
      id v13 = v4;
      id v7 = v6;
      _os_log_impl(&dword_190E10000, v5, OS_LOG_TYPE_DEFAULT, "%@: failed to unarchive web service context with error: %@", buf, 0x16u);
    }
  }

  return v3;
}

+ (id)contextWithArchive:(id)a3 error:(id *)a4
{
  id v5 = a3;
  if (a4) {
    *a4 = 0;
  }
  id v20 = 0;
  v6 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v5 options:1 error:&v20];
  id v7 = v20;
  if (v7)
  {
    id v8 = v7;
    id v9 = [NSString stringWithFormat:@"Failed to read contents of archived context"];
    v10 = 0;
    if (!a4) {
      goto LABEL_14;
    }
    goto LABEL_12;
  }
  id v19 = 0;
  v11 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v6 error:&v19];
  id v12 = v19;
  if (v12)
  {
    id v8 = v12;
    v10 = 0;
    id v13 = @"Failed to initialize archived context data for reading";
LABEL_10:
    id v9 = [NSString stringWithFormat:v13];
    goto LABEL_11;
  }
  uint64_t v14 = objc_opt_class();
  uint64_t v15 = *MEMORY[0x1E4F284E8];
  id v18 = 0;
  v10 = [v11 decodeTopLevelObjectOfClass:v14 forKey:v15 error:&v18];
  id v8 = v18;
  [v11 finishDecoding];
  if (v8)
  {
    id v13 = @"Failed to decode archived context data";
    goto LABEL_10;
  }
  id v9 = 0;
LABEL_11:

  if (!a4) {
    goto LABEL_14;
  }
LABEL_12:
  if (v8)
  {
    id v16 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [v16 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4F28A50]];
    [v16 setObject:v9 forKeyedSubscript:*MEMORY[0x1E4F28588]];
    [v16 setObject:v5 forKeyedSubscript:*MEMORY[0x1E4F28328]];
    *a4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKPassKitErrorDomain" code:-1 userInfo:v16];
  }
LABEL_14:

  return v10;
}

- (void)archiveAtPath:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v19 = 0;
  BOOL v3 = [(PKWebServiceContext *)self archiveAtPath:a3 error:&v19];
  id v4 = v19;
  if (!v3)
  {
    id v5 = PKLogFacilityTypeGetObject(0);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = objc_opt_class();
      *(_DWORD *)buf = 138412546;
      v21 = v6;
      __int16 v22 = 2112;
      id v23 = v4;
      id v7 = v6;
      _os_log_impl(&dword_190E10000, v5, OS_LOG_TYPE_DEFAULT, "%@: failed to archive web service context: %@", buf, 0x16u);
    }
    id v8 = [v4 underlyingErrors];
    id v9 = [v8 firstObject];

    if (v9) {
      v10 = v9;
    }
    else {
      v10 = v4;
    }
    v11 = (objc_class *)MEMORY[0x1E4F1CA60];
    id v12 = v10;
    id v13 = objc_alloc_init(v11);
    uint64_t v14 = [v12 localizedDescription];
    [v13 setObject:v14 forKeyedSubscript:*MEMORY[0x1E4F28568]];

    uint64_t v15 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v12, "code"));
    id v16 = [v15 stringValue];
    [v13 setObject:v16 forKeyedSubscript:@"ErrorCode"];

    v17 = objc_alloc_init(PKAutoBugCaptureReporter);
    id v18 = [v12 domain];

    [(PKAutoBugCaptureReporter *)v17 reportIssueWithDomain:@"Wallet" type:@"PKWebServiceContext" subtype:@"ContextArchiveFailed" subtypeContext:v18 payload:v13];
  }
}

- (BOOL)archiveAtPath:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (a4) {
    *a4 = 0;
  }
  id v12 = 0;
  id v7 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:self requiringSecureCoding:1 error:&v12];
  id v8 = v12;
  if (v8 || (v11 = 0, [v7 writeToFile:v6 options:1 error:&v11], (id v8 = v11) != 0))
  {
    if (a4)
    {
      id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      [v9 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4F28A50]];
      [v9 setObject:v6 forKeyedSubscript:*MEMORY[0x1E4F28328]];
      *a4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKPassKitErrorDomain" code:-1 userInfo:v9];
    }
  }
  else
  {
    PKExcludePathFromBackup((uint64_t)v6);
  }

  return v8 == 0;
}

- (PKWebServiceContext)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PKWebServiceContext;
  return [(PKWebServiceContext *)&v4 init];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end