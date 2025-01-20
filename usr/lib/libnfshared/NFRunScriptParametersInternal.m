@interface NFRunScriptParametersInternal
+ (BOOL)supportsSecureCoding;
- (BOOL)checkAIDAllowList;
- (BOOL)deactivateAllApps;
- (BOOL)disableCompletionNotification;
- (BOOL)includeAPDUDuration;
- (BOOL)initialSelectBeforeRun;
- (BOOL)toSystemOS;
- (NFRunScriptParametersInternal)initWithCoder:(id)a3;
- (NSArray)AIDAllowList;
- (NSString)seid;
- (void)encodeWithCoder:(id)a3;
- (void)setAIDAllowList:(id)a3;
- (void)setCheckAIDAllowList:(BOOL)a3;
- (void)setDeactivateAllApps:(BOOL)a3;
- (void)setDisableCompletionNotification:(BOOL)a3;
- (void)setIncludeAPDUDuration:(BOOL)a3;
- (void)setInitialSelectBeforeRun:(BOOL)a3;
- (void)setSeid:(id)a3;
- (void)setToSystemOS:(BOOL)a3;
@end

@implementation NFRunScriptParametersInternal

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  seid = self->_seid;
  id v5 = a3;
  [v5 encodeObject:seid forKey:@"seid"];
  [v5 encodeBool:self->_checkAIDAllowList forKey:@"checkAIDAllowList"];
  [v5 encodeObject:self->_AIDAllowList forKey:@"AIDAllowList"];
  [v5 encodeBool:self->_initialSelectBeforeRun forKey:@"initialSelectBeforeRun"];
  [v5 encodeBool:self->_includeAPDUDuration forKey:@"includeAPDUDuration"];
  [v5 encodeBool:self->_deactivateAllApps forKey:@"deactivateAllApps"];
  [v5 encodeBool:self->_toSystemOS forKey:@"systemOS"];
  [v5 encodeBool:self->_disableCompletionNotification forKey:@"disableCompletionNotification"];
}

- (NFRunScriptParametersInternal)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NFRunScriptParametersInternal;
  id v5 = [(NFRunScriptParametersInternal *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"seid"];
    seid = v5->_seid;
    v5->_seid = (NSString *)v6;

    v5->_checkAIDAllowList = [v4 decodeBoolForKey:@"checkAIDAllowList"];
    uint64_t v8 = +[NFNSCheckedDecoder coder:v4 decodeArrayOfClass:objc_opt_class() forKey:@"AIDAllowList"];
    AIDAllowList = v5->_AIDAllowList;
    v5->_AIDAllowList = (NSArray *)v8;

    v5->_initialSelectBeforeRun = [v4 decodeBoolForKey:@"initialSelectBeforeRun"];
    v5->_includeAPDUDuration = [v4 decodeBoolForKey:@"includeAPDUDuration"];
    v5->_deactivateAllApps = [v4 decodeBoolForKey:@"deactivateAllApps"];
    v5->_toSystemOS = [v4 decodeBoolForKey:@"systemOS"];
    v5->_disableCompletionNotification = [v4 decodeBoolForKey:@"disableCompletionNotification"];
  }

  return v5;
}

- (NSString)seid
{
  return self->_seid;
}

- (void)setSeid:(id)a3
{
}

- (BOOL)checkAIDAllowList
{
  return self->_checkAIDAllowList;
}

- (void)setCheckAIDAllowList:(BOOL)a3
{
  self->_checkAIDAllowList = a3;
}

- (NSArray)AIDAllowList
{
  return self->_AIDAllowList;
}

- (void)setAIDAllowList:(id)a3
{
}

- (BOOL)initialSelectBeforeRun
{
  return self->_initialSelectBeforeRun;
}

- (void)setInitialSelectBeforeRun:(BOOL)a3
{
  self->_initialSelectBeforeRun = a3;
}

- (BOOL)includeAPDUDuration
{
  return self->_includeAPDUDuration;
}

- (void)setIncludeAPDUDuration:(BOOL)a3
{
  self->_includeAPDUDuration = a3;
}

- (BOOL)deactivateAllApps
{
  return self->_deactivateAllApps;
}

- (void)setDeactivateAllApps:(BOOL)a3
{
  self->_deactivateAllApps = a3;
}

- (BOOL)toSystemOS
{
  return self->_toSystemOS;
}

- (void)setToSystemOS:(BOOL)a3
{
  self->_toSystemOS = a3;
}

- (BOOL)disableCompletionNotification
{
  return self->_disableCompletionNotification;
}

- (void)setDisableCompletionNotification:(BOOL)a3
{
  self->_disableCompletionNotification = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_AIDAllowList, 0);

  objc_storeStrong((id *)&self->_seid, 0);
}

@end