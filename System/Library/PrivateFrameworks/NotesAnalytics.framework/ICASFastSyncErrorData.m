@interface ICASFastSyncErrorData
+ (BOOL)requiresDiagnosticsConsent;
+ (NSString)dataName;
- (ICASFastSyncErrorData)initWithErrorCode:(id)a3 countOfIgnoredMessages:(id)a4;
- (NSNumber)countOfIgnoredMessages;
- (NSNumber)errorCode;
- (id)toDict;
@end

@implementation ICASFastSyncErrorData

- (ICASFastSyncErrorData)initWithErrorCode:(id)a3 countOfIgnoredMessages:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ICASFastSyncErrorData;
  v9 = [(ICASFastSyncErrorData *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_errorCode, a3);
    objc_storeStrong((id *)&v10->_countOfIgnoredMessages, a4);
  }

  return v10;
}

+ (NSString)dataName
{
  return (NSString *)@"FastSyncErrorData";
}

+ (BOOL)requiresDiagnosticsConsent
{
  return 0;
}

- (id)toDict
{
  v12[2] = *MEMORY[0x1E4F143B8];
  v11[0] = @"errorCode";
  v3 = [(ICASFastSyncErrorData *)self errorCode];
  if (v3)
  {
    uint64_t v4 = [(ICASFastSyncErrorData *)self errorCode];
  }
  else
  {
    uint64_t v4 = objc_opt_new();
  }
  v5 = (void *)v4;
  v11[1] = @"countOfIgnoredMessages";
  v12[0] = v4;
  v6 = [(ICASFastSyncErrorData *)self countOfIgnoredMessages];
  if (v6)
  {
    uint64_t v7 = [(ICASFastSyncErrorData *)self countOfIgnoredMessages];
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

- (NSNumber)errorCode
{
  return self->_errorCode;
}

- (NSNumber)countOfIgnoredMessages
{
  return self->_countOfIgnoredMessages;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_countOfIgnoredMessages, 0);
  objc_storeStrong((id *)&self->_errorCode, 0);
}

@end