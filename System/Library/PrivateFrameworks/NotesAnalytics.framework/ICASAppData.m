@interface ICASAppData
+ (BOOL)requiresDiagnosticsConsent;
+ (NSString)dataName;
- (ICASAppData)initWithAppVersion:(id)a3 appBuild:(id)a4;
- (NSString)appBuild;
- (NSString)appVersion;
- (id)toDict;
@end

@implementation ICASAppData

- (ICASAppData)initWithAppVersion:(id)a3 appBuild:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ICASAppData;
  v9 = [(ICASAppData *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_appVersion, a3);
    objc_storeStrong((id *)&v10->_appBuild, a4);
  }

  return v10;
}

+ (NSString)dataName
{
  return (NSString *)@"AppData";
}

+ (BOOL)requiresDiagnosticsConsent
{
  return 0;
}

- (id)toDict
{
  v12[2] = *MEMORY[0x1E4F143B8];
  v11[0] = @"appVersion";
  v3 = [(ICASAppData *)self appVersion];
  if (v3)
  {
    uint64_t v4 = [(ICASAppData *)self appVersion];
  }
  else
  {
    uint64_t v4 = objc_opt_new();
  }
  v5 = (void *)v4;
  v11[1] = @"appBuild";
  v12[0] = v4;
  v6 = [(ICASAppData *)self appBuild];
  if (v6)
  {
    uint64_t v7 = [(ICASAppData *)self appBuild];
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

- (NSString)appVersion
{
  return self->_appVersion;
}

- (NSString)appBuild
{
  return self->_appBuild;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appBuild, 0);
  objc_storeStrong((id *)&self->_appVersion, 0);
}

@end