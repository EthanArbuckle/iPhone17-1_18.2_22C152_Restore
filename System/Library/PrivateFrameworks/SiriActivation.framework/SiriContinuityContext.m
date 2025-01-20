@interface SiriContinuityContext
+ (BOOL)supportsSecureCoding;
- (AFRequestInfo)requestInfo;
- (BOOL)isTemporaryDevice;
- (NSDictionary)userActivity;
- (SiriContinuityContext)initWithCoder:(id)a3;
- (SiriContinuityContext)initWithRequestInfo:(id)a3;
- (SiriContinuityContext)initWithSpeechRequestOptions:(id)a3;
- (SiriContinuityContext)initWithUserActivity:(id)a3;
- (id)description;
- (id)speechRequestOptions;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SiriContinuityContext

- (SiriContinuityContext)initWithSpeechRequestOptions:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SiriContinuityContext;
  v5 = [(SiriContext *)&v16 initWithSpeechRequestOptions:v4];
  v6 = v5;
  if (v5)
  {
    isTemporaryDevice = v5->_isTemporaryDevice;
    v5->_isTemporaryDevice = (NSNumber *)MEMORY[0x1E4F1CC28];

    v8 = [v4 activationDeviceIdentifier];

    if (v8)
    {
      v9 = [v4 activationDeviceIdentifier];
      v10 = [MEMORY[0x1E4F50B70] sharedInstance];
      v11 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v9];
      v12 = [v10 deviceFromIdentifier:v11];

      if (v12)
      {
        [v12 device];
        BTDeviceIsTemporaryPaired();
        uint64_t v13 = [MEMORY[0x1E4F28ED0] numberWithInt:0];
        v14 = v6->_isTemporaryDevice;
        v6->_isTemporaryDevice = (NSNumber *)v13;
      }
    }
  }

  return v6;
}

- (SiriContinuityContext)initWithRequestInfo:(id)a3
{
  id v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)SiriContinuityContext;
  v6 = [(SiriContinuityContext *)&v19 init];
  v7 = v6;
  if (v6)
  {
    isTemporaryDevice = v6->_isTemporaryDevice;
    v6->_isTemporaryDevice = (NSNumber *)MEMORY[0x1E4F1CC28];

    v9 = [v5 speechRequestOptions];
    v10 = [v9 activationDeviceIdentifier];

    if (v10)
    {
      v11 = [v5 speechRequestOptions];
      v12 = [v11 activationDeviceIdentifier];

      uint64_t v13 = [MEMORY[0x1E4F50B70] sharedInstance];
      v14 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v12];
      v15 = [v13 deviceFromIdentifier:v14];

      if (v15)
      {
        [v15 device];
        BTDeviceIsTemporaryPaired();
        uint64_t v16 = [MEMORY[0x1E4F28ED0] numberWithInt:0];
        v17 = v7->_isTemporaryDevice;
        v7->_isTemporaryDevice = (NSNumber *)v16;
      }
    }
    objc_storeStrong((id *)&v7->_requestInfo, a3);
  }

  return v7;
}

- (SiriContinuityContext)initWithUserActivity:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SiriContinuityContext;
  v6 = [(SiriContinuityContext *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_userActivity, a3);
  }

  return v7;
}

- (id)speechRequestOptions
{
  v8.receiver = self;
  v8.super_class = (Class)SiriContinuityContext;
  v3 = [(SiriContext *)&v8 speechRequestOptions];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(AFRequestInfo *)self->_requestInfo speechRequestOptions];
  }
  v6 = v5;

  return v6;
}

- (BOOL)isTemporaryDevice
{
  return [(NSNumber *)self->_isTemporaryDevice BOOLValue];
}

- (id)description
{
  v3 = NSString;
  id v4 = [(SiriContext *)self contextOverride];
  isTemporaryDevice = self->_isTemporaryDevice;
  v6 = [(SiriContinuityContext *)self speechRequestOptions];
  v7 = [v3 stringWithFormat:@"<SiriContinuityContext contextOverride:%@ isTemporaryDevice:%@ speechRequestOptions:%@ requestInfo:%@ userActivity:%@>", v4, isTemporaryDevice, v6, self->_requestInfo, self->_userActivity];

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SiriContinuityContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)SiriContinuityContext;
  id v5 = [(SiriContext *)&v24 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"isTemporaryDevice"];
    isTemporaryDevice = v5->_isTemporaryDevice;
    v5->_isTemporaryDevice = (NSNumber *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"requestInfo"];
    requestInfo = v5->_requestInfo;
    v5->_requestInfo = (AFRequestInfo *)v8;

    v23 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v22 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = objc_opt_class();
    uint64_t v16 = objc_opt_class();
    uint64_t v17 = objc_opt_class();
    v18 = objc_msgSend(v23, "setWithObjects:", v22, v10, v11, v12, v13, v14, v15, v16, v17, objc_opt_class(), 0);
    uint64_t v19 = [v4 decodeObjectOfClasses:v18 forKey:@"userActivity"];
    userActivity = v5->_userActivity;
    v5->_userActivity = (NSDictionary *)v19;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SiriContinuityContext;
  id v4 = a3;
  [(SiriContext *)&v7 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_isTemporaryDevice, @"isTemporaryDevice", v7.receiver, v7.super_class);
  id v5 = [(SiriContinuityContext *)self requestInfo];
  [v4 encodeObject:v5 forKey:@"requestInfo"];

  uint64_t v6 = [(SiriContinuityContext *)self userActivity];
  [v4 encodeObject:v6 forKey:@"userActivity"];
}

- (AFRequestInfo)requestInfo
{
  return self->_requestInfo;
}

- (NSDictionary)userActivity
{
  return self->_userActivity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userActivity, 0);
  objc_storeStrong((id *)&self->_requestInfo, 0);
  objc_storeStrong((id *)&self->_isTemporaryDevice, 0);
}

@end