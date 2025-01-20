@interface ICASFullErrorData
+ (BOOL)requiresDiagnosticsConsent;
+ (NSString)dataName;
- (ICASFullErrorData)initWithFullErrorCode:(id)a3 errorString:(id)a4;
- (NSNumber)fullErrorCode;
- (NSString)errorString;
- (id)toDict;
@end

@implementation ICASFullErrorData

- (ICASFullErrorData)initWithFullErrorCode:(id)a3 errorString:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ICASFullErrorData;
  v9 = [(ICASFullErrorData *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_fullErrorCode, a3);
    objc_storeStrong((id *)&v10->_errorString, a4);
  }

  return v10;
}

+ (NSString)dataName
{
  return (NSString *)@"FullErrorData";
}

+ (BOOL)requiresDiagnosticsConsent
{
  return 0;
}

- (id)toDict
{
  v12[2] = *MEMORY[0x1E4F143B8];
  v11[0] = @"fullErrorCode";
  v3 = [(ICASFullErrorData *)self fullErrorCode];
  if (v3)
  {
    uint64_t v4 = [(ICASFullErrorData *)self fullErrorCode];
  }
  else
  {
    uint64_t v4 = objc_opt_new();
  }
  v5 = (void *)v4;
  v11[1] = @"errorString";
  v12[0] = v4;
  v6 = [(ICASFullErrorData *)self errorString];
  if (v6)
  {
    uint64_t v7 = [(ICASFullErrorData *)self errorString];
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

- (NSNumber)fullErrorCode
{
  return self->_fullErrorCode;
}

- (NSString)errorString
{
  return self->_errorString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorString, 0);
  objc_storeStrong((id *)&self->_fullErrorCode, 0);
}

@end