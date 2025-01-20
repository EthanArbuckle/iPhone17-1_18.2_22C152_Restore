@interface SBCaptureApplicationTerminationInfo
+ (BOOL)supportsSecureCoding;
+ (id)__buildVersion;
- (BOOL)isEqual:(id)a3;
- (NSString)buildVersion;
- (NSString)processName;
- (NSString)terminationReason;
- (SBCaptureApplicationTerminationInfo)initWithCoder:(id)a3;
- (SBCaptureApplicationTerminationInfo)initWithProcessName:(id)a3 terminationReason:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SBCaptureApplicationTerminationInfo

+ (id)__buildVersion
{
  v2 = (void *)_CFCopySystemVersionDictionaryValue();
  return v2;
}

- (SBCaptureApplicationTerminationInfo)initWithProcessName:(id)a3 terminationReason:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SBCaptureApplicationTerminationInfo;
  v9 = [(SBCaptureApplicationTerminationInfo *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_processName, a3);
    uint64_t v11 = objc_msgSend((id)objc_opt_class(), "__buildVersion");
    buildVersion = v10->_buildVersion;
    v10->_buildVersion = (NSString *)v11;

    objc_storeStrong((id *)&v10->_terminationReason, a4);
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v6 = v4;
  if (v5)
  {
    if (objc_opt_isKindOfClass()) {
      id v7 = v6;
    }
    else {
      id v7 = 0;
    }
  }
  else
  {
    id v7 = 0;
  }
  id v8 = v7;

  v9 = [MEMORY[0x1E4F4F738] builderWithObject:self ofExpectedClass:objc_opt_class()];
  v10 = [(SBCaptureApplicationTerminationInfo *)self processName];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __47__SBCaptureApplicationTerminationInfo_isEqual___block_invoke;
  v24[3] = &unk_1E6AF5180;
  id v11 = v8;
  id v25 = v11;
  id v12 = (id)[v9 appendString:v10 counterpart:v24];

  v13 = [(SBCaptureApplicationTerminationInfo *)self buildVersion];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __47__SBCaptureApplicationTerminationInfo_isEqual___block_invoke_2;
  v22[3] = &unk_1E6AF5180;
  id v14 = v11;
  id v23 = v14;
  id v15 = (id)[v9 appendString:v13 counterpart:v22];

  v16 = [(SBCaptureApplicationTerminationInfo *)self terminationReason];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __47__SBCaptureApplicationTerminationInfo_isEqual___block_invoke_3;
  v20[3] = &unk_1E6AF5180;
  id v21 = v14;
  id v17 = v14;
  id v18 = (id)[v9 appendString:v16 counterpart:v20];

  LOBYTE(v16) = [v9 isEqual];
  return (char)v16;
}

id __47__SBCaptureApplicationTerminationInfo_isEqual___block_invoke(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 8);
}

id __47__SBCaptureApplicationTerminationInfo_isEqual___block_invoke_2(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 16);
}

id __47__SBCaptureApplicationTerminationInfo_isEqual___block_invoke_3(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 24);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SBCaptureApplicationTerminationInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"processName"];
  processName = self->_processName;
  self->_processName = v5;

  id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"buildVersion"];
  buildVersion = self->_buildVersion;
  self->_buildVersion = v7;

  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"terminationReason"];

  terminationReason = self->_terminationReason;
  self->_terminationReason = v9;

  return self;
}

- (void)encodeWithCoder:(id)a3
{
  processName = self->_processName;
  id v5 = a3;
  [v5 encodeObject:processName forKey:@"processName"];
  [v5 encodeObject:self->_buildVersion forKey:@"buildVersion"];
  [v5 encodeObject:self->_terminationReason forKey:@"terminationReason"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (id *)objc_opt_new();
  objc_storeStrong(v4 + 1, self->_processName);
  objc_storeStrong(v4 + 2, self->_buildVersion);
  objc_storeStrong(v4 + 3, self->_terminationReason);
  return v4;
}

- (NSString)processName
{
  return self->_processName;
}

- (NSString)buildVersion
{
  return self->_buildVersion;
}

- (NSString)terminationReason
{
  return self->_terminationReason;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_terminationReason, 0);
  objc_storeStrong((id *)&self->_buildVersion, 0);
  objc_storeStrong((id *)&self->_processName, 0);
}

@end