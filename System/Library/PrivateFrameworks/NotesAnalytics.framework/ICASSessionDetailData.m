@interface ICASSessionDetailData
+ (BOOL)requiresDiagnosticsConsent;
+ (NSString)dataName;
- (ICASSessionDetailData)initWithSessionDetailArray:(id)a3;
- (NSArray)sessionDetailArray;
- (id)toDict;
@end

@implementation ICASSessionDetailData

- (ICASSessionDetailData)initWithSessionDetailArray:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICASSessionDetailData;
  v6 = [(ICASSessionDetailData *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_sessionDetailArray, a3);
  }

  return v7;
}

+ (NSString)dataName
{
  return (NSString *)@"SessionDetailData";
}

+ (BOOL)requiresDiagnosticsConsent
{
  return 0;
}

- (id)toDict
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v8 = @"sessionDetailArray";
  v3 = [(ICASSessionDetailData *)self sessionDetailArray];
  if (v3)
  {
    uint64_t v4 = [(ICASSessionDetailData *)self sessionDetailArray];
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

- (NSArray)sessionDetailArray
{
  return self->_sessionDetailArray;
}

- (void).cxx_destruct
{
}

@end