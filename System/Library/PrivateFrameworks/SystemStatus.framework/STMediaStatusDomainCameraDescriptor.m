@interface STMediaStatusDomainCameraDescriptor
+ (BOOL)supportsSecureCoding;
- (BOOL)isEligibleForPrivacyIndicator;
- (BOOL)isEqual:(id)a3;
- (NSString)cameraIdentifier;
- (NSString)description;
- (STMediaStatusDomainCameraDescriptor)init;
- (STMediaStatusDomainCameraDescriptor)initWithCameraIdentifier:(id)a3;
- (STMediaStatusDomainCameraDescriptor)initWithCameraIdentifier:(id)a3 eligibleForPrivacyIndicator:(BOOL)a4;
- (STMediaStatusDomainCameraDescriptor)initWithCoder:(id)a3;
- (id)_descriptionBuilderWithMultilinePrefix:(uint64_t)a3 forDebug:;
- (id)debugDescriptionWithMultilinePrefix:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation STMediaStatusDomainCameraDescriptor

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F4F738] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
  v6 = [(STMediaStatusDomainCameraDescriptor *)self cameraIdentifier];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __47__STMediaStatusDomainCameraDescriptor_isEqual___block_invoke;
  v18[3] = &unk_1E6B630A8;
  id v7 = v4;
  id v19 = v7;
  id v8 = (id)[v5 appendString:v6 counterpart:v18];

  uint64_t v9 = [(STMediaStatusDomainCameraDescriptor *)self isEligibleForPrivacyIndicator];
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  v15 = __47__STMediaStatusDomainCameraDescriptor_isEqual___block_invoke_2;
  v16 = &unk_1E6B630D0;
  id v17 = v7;
  id v10 = v7;
  id v11 = (id)[v5 appendBool:v9 counterpart:&v13];
  LOBYTE(v9) = objc_msgSend(v5, "isEqual", v13, v14, v15, v16);

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  id v4 = [(STMediaStatusDomainCameraDescriptor *)self cameraIdentifier];
  [v5 encodeObject:v4 forKey:@"cameraIdentifier"];

  objc_msgSend(v5, "encodeBool:forKey:", -[STMediaStatusDomainCameraDescriptor isEligibleForPrivacyIndicator](self, "isEligibleForPrivacyIndicator"), @"eligibleForPrivacyIndicator");
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = [(STMediaStatusDomainCameraDescriptor *)self cameraIdentifier];
  id v5 = (id)[v3 appendString:v4];

  id v6 = (id)objc_msgSend(v3, "appendBool:", -[STMediaStatusDomainCameraDescriptor isEligibleForPrivacyIndicator](self, "isEligibleForPrivacyIndicator"));
  unint64_t v7 = [v3 hash];

  return v7;
}

- (BOOL)isEligibleForPrivacyIndicator
{
  return self->_eligibleForPrivacyIndicator;
}

- (NSString)cameraIdentifier
{
  return self->_cameraIdentifier;
}

- (STMediaStatusDomainCameraDescriptor)init
{
  return [(STMediaStatusDomainCameraDescriptor *)self initWithCameraIdentifier:0];
}

- (STMediaStatusDomainCameraDescriptor)initWithCameraIdentifier:(id)a3
{
  id v4 = a3;
  self;
  id v5 = [(STMediaStatusDomainCameraDescriptor *)self initWithCameraIdentifier:v4 eligibleForPrivacyIndicator:1];

  return v5;
}

- (STMediaStatusDomainCameraDescriptor)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cameraIdentifier"];
  uint64_t v6 = [v4 decodeBoolForKey:@"eligibleForPrivacyIndicator"];

  unint64_t v7 = [(STMediaStatusDomainCameraDescriptor *)self initWithCameraIdentifier:v5 eligibleForPrivacyIndicator:v6];
  return v7;
}

- (STMediaStatusDomainCameraDescriptor)initWithCameraIdentifier:(id)a3 eligibleForPrivacyIndicator:(BOOL)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)STMediaStatusDomainCameraDescriptor;
  unint64_t v7 = [(STMediaStatusDomainCameraDescriptor *)&v11 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    cameraIdentifier = v7->_cameraIdentifier;
    v7->_cameraIdentifier = (NSString *)v8;

    v7->_eligibleForPrivacyIndicator = a4;
  }

  return v7;
}

uint64_t __47__STMediaStatusDomainCameraDescriptor_isEqual___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) isEligibleForPrivacyIndicator];
}

uint64_t __47__STMediaStatusDomainCameraDescriptor_isEqual___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) cameraIdentifier];
}

- (void).cxx_destruct
{
}

- (NSString)description
{
  return (NSString *)[(STMediaStatusDomainCameraDescriptor *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(STMediaStatusDomainCameraDescriptor *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(STMediaStatusDomainCameraDescriptor *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  v3 = -[STMediaStatusDomainCameraDescriptor _descriptionBuilderWithMultilinePrefix:forDebug:](self, a3, 1);
  id v4 = [v3 build];

  return v4;
}

- (id)_descriptionBuilderWithMultilinePrefix:(uint64_t)a3 forDebug:
{
  id v3 = a1;
  if (a1)
  {
    id v5 = a2;
    id v6 = [v3 succinctDescriptionBuilder];
    [v6 setUseDebugDescription:a3];
    [v6 setActiveMultilinePrefix:v5];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __87__STMediaStatusDomainCameraDescriptor__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke;
    v9[3] = &unk_1E6B63080;
    id v7 = v6;
    id v10 = v7;
    id v11 = v3;
    [v7 appendBodySectionWithName:0 multilinePrefix:v5 block:v9];

    id v3 = v7;
  }

  return v3;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  return -[STMediaStatusDomainCameraDescriptor _descriptionBuilderWithMultilinePrefix:forDebug:](self, a3, 0);
}

id __87__STMediaStatusDomainCameraDescriptor__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) cameraIdentifier];
  [v2 appendString:v3 withName:@"cameraIdentifier"];

  return (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "isEligibleForPrivacyIndicator"), @"eligibleForPrivacyIndicator");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end