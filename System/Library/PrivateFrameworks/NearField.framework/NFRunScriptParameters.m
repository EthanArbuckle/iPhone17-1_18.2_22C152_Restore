@interface NFRunScriptParameters
+ (BOOL)supportsSecureCoding;
+ (id)internalParameterWithParameter:(id)a3;
- (BOOL)checkAIDAllowList;
- (BOOL)deactivateAllApps;
- (BOOL)disableCompletionNotification;
- (BOOL)includeAPDUDuration;
- (BOOL)initialSelectBeforeRun;
- (BOOL)outFailureResponseDetected;
- (BOOL)outIncompleteExecution;
- (BOOL)toSystemOS;
- (NFRunScriptParameters)initWithCoder:(id)a3;
- (NSArray)AIDAllowList;
- (NSString)seid;
- (double)outTotalAPDUExecutionDuration;
- (unint64_t)outFinalSWStatus;
- (void)encodeWithCoder:(id)a3;
- (void)setAIDAllowList:(id)a3;
- (void)setCheckAIDAllowList:(BOOL)a3;
- (void)setDeactivateAllApps:(BOOL)a3;
- (void)setDisableCompletionNotification:(BOOL)a3;
- (void)setIncludeAPDUDuration:(BOOL)a3;
- (void)setInitialSelectBeforeRun:(BOOL)a3;
- (void)setOutFailureResponseDetected:(BOOL)a3;
- (void)setOutFinalSWStatus:(unint64_t)a3;
- (void)setOutIncompleteExecution:(BOOL)a3;
- (void)setOutTotalAPDUExecutionDuration:(double)a3;
- (void)setSeid:(id)a3;
- (void)setToSystemOS:(BOOL)a3;
@end

@implementation NFRunScriptParameters

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
  [v5 encodeDouble:@"outTotalAPDUExecutionDuration" forKey:self->_outTotalAPDUExecutionDuration];
  [v5 encodeInteger:self->_outFinalSWStatus forKey:@"outFinalSWStatus"];
  [v5 encodeBool:self->_toSystemOS forKey:@"systemOS"];
  [v5 encodeBool:self->_disableCompletionNotification forKey:@"disableCompletionNotification"];
  [v5 encodeBool:self->_outIncompleteExecution forKey:@"outIncompleteExecution"];
  [v5 encodeBool:self->_outFailureResponseDetected forKey:@"outFailureResponseDetected"];
}

- (NFRunScriptParameters)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)NFRunScriptParameters;
  id v5 = [(NFRunScriptParameters *)&v12 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"seid"];
    seid = v5->_seid;
    v5->_seid = (NSString *)v6;

    v5->_checkAIDAllowList = [v4 decodeBoolForKey:@"checkAIDAllowList"];
    uint64_t v8 = [MEMORY[0x1E4FBA858] coder:v4 decodeArrayOfClass:objc_opt_class() forKey:@"AIDAllowList"];
    AIDAllowList = v5->_AIDAllowList;
    v5->_AIDAllowList = (NSArray *)v8;

    v5->_initialSelectBeforeRun = [v4 decodeBoolForKey:@"initialSelectBeforeRun"];
    v5->_includeAPDUDuration = [v4 decodeBoolForKey:@"includeAPDUDuration"];
    v5->_deactivateAllApps = [v4 decodeBoolForKey:@"deactivateAllApps"];
    [v4 decodeDoubleForKey:@"outTotalAPDUExecutionDuration"];
    v5->_outTotalAPDUExecutionDuration = v10;
    v5->_outFinalSWStatus = [v4 decodeIntegerForKey:@"outFinalSWStatus"];
    v5->_toSystemOS = [v4 decodeBoolForKey:@"systemOS"];
    v5->_disableCompletionNotification = [v4 decodeBoolForKey:@"disableCompletionNotification"];
    v5->_outIncompleteExecution = [v4 decodeBoolForKey:@"outIncompleteExecution"];
    v5->_outFailureResponseDetected = [v4 decodeBoolForKey:@"outFailureResponseDetected"];
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

- (double)outTotalAPDUExecutionDuration
{
  return self->_outTotalAPDUExecutionDuration;
}

- (void)setOutTotalAPDUExecutionDuration:(double)a3
{
  self->_outTotalAPDUExecutionDuration = a3;
}

- (unint64_t)outFinalSWStatus
{
  return self->_outFinalSWStatus;
}

- (void)setOutFinalSWStatus:(unint64_t)a3
{
  self->_outFinalSWStatus = a3;
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

- (BOOL)outIncompleteExecution
{
  return self->_outIncompleteExecution;
}

- (void)setOutIncompleteExecution:(BOOL)a3
{
  self->_outIncompleteExecution = a3;
}

- (BOOL)outFailureResponseDetected
{
  return self->_outFailureResponseDetected;
}

- (void)setOutFailureResponseDetected:(BOOL)a3
{
  self->_outFailureResponseDetected = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_AIDAllowList, 0);
  objc_storeStrong((id *)&self->_seid, 0);
}

+ (id)internalParameterWithParameter:(id)a3
{
  v3 = (objc_class *)MEMORY[0x1E4FBA878];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  uint64_t v6 = [v4 seid];
  [v5 setSeid:v6];

  objc_msgSend(v5, "setCheckAIDAllowList:", objc_msgSend(v4, "checkAIDAllowList"));
  v7 = [v4 AIDAllowList];
  [v5 setAIDAllowList:v7];

  objc_msgSend(v5, "setInitialSelectBeforeRun:", objc_msgSend(v4, "initialSelectBeforeRun"));
  objc_msgSend(v5, "setIncludeAPDUDuration:", objc_msgSend(v4, "includeAPDUDuration"));
  objc_msgSend(v5, "setDeactivateAllApps:", objc_msgSend(v4, "deactivateAllApps"));
  uint64_t v8 = [v4 toSystemOS];

  [v5 setToSystemOS:v8];
  return v5;
}

@end