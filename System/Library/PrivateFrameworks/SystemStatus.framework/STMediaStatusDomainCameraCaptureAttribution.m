@interface STMediaStatusDomainCameraCaptureAttribution
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (STActivityAttribution)activityAttribution;
- (STMediaStatusDomainCameraCaptureAttribution)initWithCameraDescriptor:(id)a3 activityAttribution:(id)a4;
- (STMediaStatusDomainCameraCaptureAttribution)initWithCoder:(id)a3;
- (STMediaStatusDomainCameraDescriptor)cameraDescriptor;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation STMediaStatusDomainCameraCaptureAttribution

uint64_t __55__STMediaStatusDomainCameraCaptureAttribution_isEqual___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) activityAttribution];
}

uint64_t __55__STMediaStatusDomainCameraCaptureAttribution_isEqual___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) cameraDescriptor];
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(STMediaStatusDomainCameraCaptureAttribution *)self cameraDescriptor];
  [v4 encodeObject:v5 forKey:@"cameraDescriptor"];

  id v6 = [(STMediaStatusDomainCameraCaptureAttribution *)self activityAttribution];
  [v4 encodeObject:v6 forKey:@"activityAttribution"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F4F738] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
  id v6 = [(STMediaStatusDomainCameraCaptureAttribution *)self cameraDescriptor];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __55__STMediaStatusDomainCameraCaptureAttribution_isEqual___block_invoke;
  v18[3] = &unk_1E6B63058;
  id v7 = v4;
  id v19 = v7;
  id v8 = (id)[v5 appendObject:v6 counterpart:v18];

  v9 = [(STMediaStatusDomainCameraCaptureAttribution *)self activityAttribution];
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  v15 = __55__STMediaStatusDomainCameraCaptureAttribution_isEqual___block_invoke_2;
  v16 = &unk_1E6B63058;
  id v17 = v7;
  id v10 = v7;
  id v11 = (id)[v5 appendObject:v9 counterpart:&v13];

  LOBYTE(v9) = objc_msgSend(v5, "isEqual", v13, v14, v15, v16);
  return (char)v9;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = [(STMediaStatusDomainCameraCaptureAttribution *)self cameraDescriptor];
  id v5 = (id)[v3 appendObject:v4];

  id v6 = [(STMediaStatusDomainCameraCaptureAttribution *)self activityAttribution];
  id v7 = (id)[v3 appendObject:v6];

  unint64_t v8 = [v3 hash];
  return v8;
}

- (STActivityAttribution)activityAttribution
{
  return self->_activityAttribution;
}

- (STMediaStatusDomainCameraDescriptor)cameraDescriptor
{
  return self->_cameraDescriptor;
}

- (STMediaStatusDomainCameraCaptureAttribution)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cameraDescriptor"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"activityAttribution"];

  if (v5) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    unint64_t v8 = 0;
  }
  else
  {
    self = [(STMediaStatusDomainCameraCaptureAttribution *)self initWithCameraDescriptor:v5 activityAttribution:v6];
    unint64_t v8 = self;
  }

  return v8;
}

- (STMediaStatusDomainCameraCaptureAttribution)initWithCameraDescriptor:(id)a3 activityAttribution:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)STMediaStatusDomainCameraCaptureAttribution;
  unint64_t v8 = [(STMediaStatusDomainCameraCaptureAttribution *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    cameraDescriptor = v8->_cameraDescriptor;
    v8->_cameraDescriptor = (STMediaStatusDomainCameraDescriptor *)v9;

    uint64_t v11 = [v7 copy];
    activityAttribution = v8->_activityAttribution;
    v8->_activityAttribution = (STActivityAttribution *)v11;
  }
  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityAttribution, 0);

  objc_storeStrong((id *)&self->_cameraDescriptor, 0);
}

- (NSString)description
{
  return (NSString *)[(STMediaStatusDomainCameraCaptureAttribution *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(STMediaStatusDomainCameraCaptureAttribution *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(STMediaStatusDomainCameraCaptureAttribution *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  id v5 = [(STMediaStatusDomainCameraCaptureAttribution *)self succinctDescriptionBuilder];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __85__STMediaStatusDomainCameraCaptureAttribution_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E6B63080;
  id v6 = v5;
  id v10 = v6;
  uint64_t v11 = self;
  [v6 appendBodySectionWithName:0 multilinePrefix:v4 block:v9];

  id v7 = v6;
  return v7;
}

void __85__STMediaStatusDomainCameraCaptureAttribution_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3 = [*(id *)(a1 + 40) cameraDescriptor];
  id v4 = (id)[v2 appendObject:v3 withName:@"cameraDescriptor"];

  id v5 = *(void **)(a1 + 32);
  id v7 = [*(id *)(a1 + 40) activityAttribution];
  id v6 = (id)[v5 appendObject:v7 withName:@"activityAttribution"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end