@interface ICASCloudErrorData
+ (BOOL)requiresDiagnosticsConsent;
+ (NSString)dataName;
- (ICASCloudErrorData)initWithErrorStatus:(id)a3;
- (ICASErrorStatus)errorStatus;
- (id)toDict;
@end

@implementation ICASCloudErrorData

- (ICASCloudErrorData)initWithErrorStatus:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICASCloudErrorData;
  v6 = [(ICASCloudErrorData *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_errorStatus, a3);
  }

  return v7;
}

+ (NSString)dataName
{
  return (NSString *)@"CloudErrorData";
}

+ (BOOL)requiresDiagnosticsConsent
{
  return 0;
}

- (id)toDict
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v8 = @"errorStatus";
  v3 = [(ICASCloudErrorData *)self errorStatus];
  if (v3)
  {
    uint64_t v4 = [(ICASCloudErrorData *)self errorStatus];
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

- (ICASErrorStatus)errorStatus
{
  return self->_errorStatus;
}

- (void).cxx_destruct
{
}

@end