@interface ICASContextPathData
+ (BOOL)requiresDiagnosticsConsent;
+ (NSString)dataName;
- (ICASContextPath)contextPath;
- (ICASContextPathData)initWithContextPath:(id)a3;
- (id)toDict;
@end

@implementation ICASContextPathData

- (ICASContextPathData)initWithContextPath:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICASContextPathData;
  v6 = [(ICASContextPathData *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_contextPath, a3);
  }

  return v7;
}

+ (NSString)dataName
{
  return (NSString *)@"ContextPathData";
}

+ (BOOL)requiresDiagnosticsConsent
{
  return 0;
}

- (id)toDict
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v8 = @"contextPath";
  v3 = [(ICASContextPathData *)self contextPath];
  if (v3)
  {
    uint64_t v4 = [(ICASContextPathData *)self contextPath];
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

- (ICASContextPath)contextPath
{
  return self->_contextPath;
}

- (void).cxx_destruct
{
}

@end