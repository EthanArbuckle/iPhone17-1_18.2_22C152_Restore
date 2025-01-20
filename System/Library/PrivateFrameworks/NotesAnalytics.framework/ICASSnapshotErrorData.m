@interface ICASSnapshotErrorData
+ (BOOL)requiresDiagnosticsConsent;
+ (NSString)dataName;
- (ICASSnapshotErrorData)initWithErrorDomain:(id)a3 errorCode:(id)a4;
- (NSNumber)errorCode;
- (NSString)errorDomain;
- (id)toDict;
@end

@implementation ICASSnapshotErrorData

- (ICASSnapshotErrorData)initWithErrorDomain:(id)a3 errorCode:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ICASSnapshotErrorData;
  v9 = [(ICASSnapshotErrorData *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_errorDomain, a3);
    objc_storeStrong((id *)&v10->_errorCode, a4);
  }

  return v10;
}

+ (NSString)dataName
{
  return (NSString *)@"SnapshotErrorData";
}

+ (BOOL)requiresDiagnosticsConsent
{
  return 0;
}

- (id)toDict
{
  v12[2] = *MEMORY[0x1E4F143B8];
  v11[0] = @"errorDomain";
  v3 = [(ICASSnapshotErrorData *)self errorDomain];
  if (v3)
  {
    uint64_t v4 = [(ICASSnapshotErrorData *)self errorDomain];
  }
  else
  {
    uint64_t v4 = objc_opt_new();
  }
  v5 = (void *)v4;
  v11[1] = @"errorCode";
  v12[0] = v4;
  v6 = [(ICASSnapshotErrorData *)self errorCode];
  if (v6)
  {
    uint64_t v7 = [(ICASSnapshotErrorData *)self errorCode];
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

- (NSString)errorDomain
{
  return self->_errorDomain;
}

- (NSNumber)errorCode
{
  return self->_errorCode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorCode, 0);
  objc_storeStrong((id *)&self->_errorDomain, 0);
}

@end