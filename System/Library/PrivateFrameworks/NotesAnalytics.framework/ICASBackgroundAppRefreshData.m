@interface ICASBackgroundAppRefreshData
+ (BOOL)requiresDiagnosticsConsent;
+ (NSString)dataName;
- (ICASBackgroundAppRefreshData)initWithAutomaticAppUpdatesAllowed:(id)a3;
- (NSNumber)automaticAppUpdatesAllowed;
- (id)toDict;
@end

@implementation ICASBackgroundAppRefreshData

- (ICASBackgroundAppRefreshData)initWithAutomaticAppUpdatesAllowed:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICASBackgroundAppRefreshData;
  v6 = [(ICASBackgroundAppRefreshData *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_automaticAppUpdatesAllowed, a3);
  }

  return v7;
}

+ (NSString)dataName
{
  return (NSString *)@"BackgroundAppRefreshData";
}

+ (BOOL)requiresDiagnosticsConsent
{
  return 0;
}

- (id)toDict
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v8 = @"automaticAppUpdatesAllowed";
  v3 = [(ICASBackgroundAppRefreshData *)self automaticAppUpdatesAllowed];
  if (v3)
  {
    uint64_t v4 = [(ICASBackgroundAppRefreshData *)self automaticAppUpdatesAllowed];
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

- (NSNumber)automaticAppUpdatesAllowed
{
  return self->_automaticAppUpdatesAllowed;
}

- (void).cxx_destruct
{
}

@end