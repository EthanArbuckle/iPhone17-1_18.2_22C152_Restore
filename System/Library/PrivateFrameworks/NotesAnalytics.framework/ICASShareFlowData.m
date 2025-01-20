@interface ICASShareFlowData
+ (BOOL)requiresDiagnosticsConsent;
+ (NSString)dataName;
- (ICASShareFlowData)initWithShareFlowType:(id)a3;
- (ICASShareFlowType)shareFlowType;
- (id)toDict;
@end

@implementation ICASShareFlowData

- (ICASShareFlowData)initWithShareFlowType:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICASShareFlowData;
  v6 = [(ICASShareFlowData *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_shareFlowType, a3);
  }

  return v7;
}

+ (NSString)dataName
{
  return (NSString *)@"ShareFlowData";
}

+ (BOOL)requiresDiagnosticsConsent
{
  return 0;
}

- (id)toDict
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v8 = @"shareFlowType";
  v3 = [(ICASShareFlowData *)self shareFlowType];
  if (v3)
  {
    uint64_t v4 = [(ICASShareFlowData *)self shareFlowType];
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

- (ICASShareFlowType)shareFlowType
{
  return self->_shareFlowType;
}

- (void).cxx_destruct
{
}

@end