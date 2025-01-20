@interface ICASPartialCloudErrorData
+ (BOOL)requiresDiagnosticsConsent;
+ (NSString)dataName;
- (ICASPartialCloudErrorData)initWithPartialErrorSummary:(id)a3;
- (NSArray)partialErrorSummary;
- (id)toDict;
@end

@implementation ICASPartialCloudErrorData

- (ICASPartialCloudErrorData)initWithPartialErrorSummary:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICASPartialCloudErrorData;
  v6 = [(ICASPartialCloudErrorData *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_partialErrorSummary, a3);
  }

  return v7;
}

+ (NSString)dataName
{
  return (NSString *)@"PartialCloudErrorData";
}

+ (BOOL)requiresDiagnosticsConsent
{
  return 0;
}

- (id)toDict
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v8 = @"partialErrorSummary";
  v3 = [(ICASPartialCloudErrorData *)self partialErrorSummary];
  if (v3)
  {
    uint64_t v4 = [(ICASPartialCloudErrorData *)self partialErrorSummary];
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

- (NSArray)partialErrorSummary
{
  return self->_partialErrorSummary;
}

- (void).cxx_destruct
{
}

@end