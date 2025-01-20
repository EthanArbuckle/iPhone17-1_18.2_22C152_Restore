@interface STCallingStatusDomainCallDescriptor
+ (BOOL)supportsSecureCoding;
+ (id)audioCallDescriptorWithState:(unint64_t)a3;
+ (id)copresenceCallDescriptorWithActivityType:(unint64_t)a3;
+ (id)videoCallDescriptorWithState:(unint64_t)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (STActivityAttribution)callProviderAttribution;
- (STCallingStatusDomainCallDescriptor)initWithCallType:(unint64_t)a3 callState:(unint64_t)a4 copresenceActivityType:(unint64_t)a5;
- (STCallingStatusDomainCallDescriptor)initWithCallType:(unint64_t)a3 callState:(unint64_t)a4 copresenceActivityType:(unint64_t)a5 callProviderAttribution:(id)a6;
- (STCallingStatusDomainCallDescriptor)initWithCoder:(id)a3;
- (id)_descriptionBuilderWithMultilinePrefix:(uint64_t)a3 forDebug:;
- (id)debugDescriptionWithMultilinePrefix:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)callState;
- (unint64_t)callType;
- (unint64_t)copresenceActivityType;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation STCallingStatusDomainCallDescriptor

+ (id)audioCallDescriptorWithState:(unint64_t)a3
{
  v3 = [[STCallingStatusDomainCallDescriptor alloc] initWithCallType:0 callState:a3 copresenceActivityType:0];

  return v3;
}

+ (id)videoCallDescriptorWithState:(unint64_t)a3
{
  v3 = [[STCallingStatusDomainCallDescriptor alloc] initWithCallType:1 callState:a3 copresenceActivityType:0];

  return v3;
}

+ (id)copresenceCallDescriptorWithActivityType:(unint64_t)a3
{
  v3 = [[STCallingStatusDomainCallDescriptor alloc] initWithCallType:2 callState:0 copresenceActivityType:a3];

  return v3;
}

- (STCallingStatusDomainCallDescriptor)initWithCallType:(unint64_t)a3 callState:(unint64_t)a4 copresenceActivityType:(unint64_t)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  switch(a3)
  {
    case 0uLL:
      if (a4 == 2) {
        goto LABEL_11;
      }
      break;
    case 1uLL:
      if (a4 <= 6)
      {
        uint64_t v9 = 1 << a4;
        uint64_t v10 = 84;
        goto LABEL_10;
      }
      break;
    case 2uLL:
      if (a4 <= 6)
      {
        uint64_t v9 = 1 << a4;
        uint64_t v10 = 92;
        goto LABEL_10;
      }
      break;
    case 3uLL:
      if (a4 <= 6)
      {
        uint64_t v9 = 1 << a4;
        uint64_t v10 = 90;
LABEL_10:
        if ((v9 & v10) != 0) {
          goto LABEL_11;
        }
      }
      break;
    default:
LABEL_11:
      v11 = STSystemStatusLogCallingDomain();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        if (a4 - 1 > 5) {
          v16 = @"active";
        }
        else {
          v16 = off_1E6B636F0[a4 - 1];
        }
        if (a3 - 1 > 2) {
          v17 = @"audio";
        }
        else {
          v17 = off_1E6B636D8[a3 - 1];
        }
        *(_DWORD *)buf = 138543618;
        v20 = v16;
        __int16 v21 = 2114;
        v22 = v17;
        _os_log_error_impl(&dword_1D9514000, v11, OS_LOG_TYPE_ERROR, "state %{public}@ is not valid for call type %{public}@, behavior is undefined", buf, 0x16u);
      }

      break;
  }
  v18.receiver = self;
  v18.super_class = (Class)STCallingStatusDomainCallDescriptor;
  v12 = [(STCallingStatusDomainCallDescriptor *)&v18 init];
  v13 = v12;
  if (v12)
  {
    v12->_callType = a3;
    v12->_callState = a4;
    callProviderAttribution = v12->_callProviderAttribution;
    v12->_copresenceActivityType = a5;
    v12->_callProviderAttribution = 0;
  }
  return v13;
}

- (STCallingStatusDomainCallDescriptor)initWithCallType:(unint64_t)a3 callState:(unint64_t)a4 copresenceActivityType:(unint64_t)a5 callProviderAttribution:(id)a6
{
  id v10 = a6;
  v11 = [(STCallingStatusDomainCallDescriptor *)self initWithCallType:a3 callState:a4 copresenceActivityType:a5];
  if (v11)
  {
    uint64_t v12 = [v10 copy];
    callProviderAttribution = v11->_callProviderAttribution;
    v11->_callProviderAttribution = (STActivityAttribution *)v12;
  }
  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F4F738] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
  unint64_t v6 = [(STCallingStatusDomainCallDescriptor *)self callType];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __47__STCallingStatusDomainCallDescriptor_isEqual___block_invoke;
  v28[3] = &unk_1E6B63670;
  id v7 = v4;
  id v29 = v7;
  id v8 = (id)[v5 appendUnsignedInteger:v6 counterpart:v28];
  unint64_t v9 = [(STCallingStatusDomainCallDescriptor *)self callState];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __47__STCallingStatusDomainCallDescriptor_isEqual___block_invoke_2;
  v26[3] = &unk_1E6B63670;
  id v10 = v7;
  id v27 = v10;
  id v11 = (id)[v5 appendUnsignedInteger:v9 counterpart:v26];
  unint64_t v12 = [(STCallingStatusDomainCallDescriptor *)self copresenceActivityType];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __47__STCallingStatusDomainCallDescriptor_isEqual___block_invoke_3;
  v24[3] = &unk_1E6B63670;
  id v13 = v10;
  id v25 = v13;
  id v14 = (id)[v5 appendUnsignedInteger:v12 counterpart:v24];
  v15 = [(STCallingStatusDomainCallDescriptor *)self callProviderAttribution];
  uint64_t v19 = MEMORY[0x1E4F143A8];
  uint64_t v20 = 3221225472;
  __int16 v21 = __47__STCallingStatusDomainCallDescriptor_isEqual___block_invoke_4;
  v22 = &unk_1E6B63058;
  id v23 = v13;
  id v16 = v13;
  id v17 = (id)[v5 appendObject:v15 counterpart:&v19];

  LOBYTE(v15) = objc_msgSend(v5, "isEqual", v19, v20, v21, v22);
  return (char)v15;
}

uint64_t __47__STCallingStatusDomainCallDescriptor_isEqual___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) callType];
}

uint64_t __47__STCallingStatusDomainCallDescriptor_isEqual___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) callState];
}

uint64_t __47__STCallingStatusDomainCallDescriptor_isEqual___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) copresenceActivityType];
}

uint64_t __47__STCallingStatusDomainCallDescriptor_isEqual___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) callProviderAttribution];
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = (id)objc_msgSend(v3, "appendUnsignedInteger:", -[STCallingStatusDomainCallDescriptor callType](self, "callType"));
  id v5 = (id)objc_msgSend(v3, "appendUnsignedInteger:", -[STCallingStatusDomainCallDescriptor callState](self, "callState"));
  id v6 = (id)objc_msgSend(v3, "appendUnsignedInteger:", -[STCallingStatusDomainCallDescriptor copresenceActivityType](self, "copresenceActivityType"));
  id v7 = [(STCallingStatusDomainCallDescriptor *)self callProviderAttribution];
  id v8 = (id)[v3 appendObject:v7];

  unint64_t v9 = [v3 hash];
  return v9;
}

- (NSString)description
{
  return (NSString *)[(STCallingStatusDomainCallDescriptor *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(STCallingStatusDomainCallDescriptor *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(STCallingStatusDomainCallDescriptor *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  v3 = -[STCallingStatusDomainCallDescriptor _descriptionBuilderWithMultilinePrefix:forDebug:](self, a3, 1);
  id v4 = [v3 build];

  return v4;
}

- (id)_descriptionBuilderWithMultilinePrefix:(uint64_t)a3 forDebug:
{
  if (a1)
  {
    id v5 = a2;
    id v6 = [a1 succinctDescriptionBuilder];
    [v6 setUseDebugDescription:a3];
    [v6 setActiveMultilinePrefix:v5];

    unint64_t v7 = [a1 callType] - 1;
    if (v7 > 2) {
      id v8 = @"audio";
    }
    else {
      id v8 = off_1E6B636D8[v7];
    }
    [v6 appendString:v8 withName:@"callType"];
    unint64_t v9 = [a1 callState] - 1;
    if (v9 > 5) {
      id v10 = @"active";
    }
    else {
      id v10 = off_1E6B636F0[v9];
    }
    [v6 appendString:v10 withName:@"callState"];
    unint64_t v11 = [a1 copresenceActivityType] - 1;
    if (v11 > 4) {
      unint64_t v12 = @"none";
    }
    else {
      unint64_t v12 = off_1E6B63720[v11];
    }
    [v6 appendString:v12 withName:@"copresenceActivityType"];
    id v13 = [a1 callProviderAttribution];
    id v14 = [v13 description];
    [v6 appendString:v14 withName:@"callProviderAttribution"];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  return -[STCallingStatusDomainCallDescriptor _descriptionBuilderWithMultilinePrefix:forDebug:](self, a3, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[STCallingStatusDomainCallDescriptor callType](self, "callType"), @"callType");
  objc_msgSend(v4, "encodeInteger:forKey:", -[STCallingStatusDomainCallDescriptor callState](self, "callState"), @"callState");
  objc_msgSend(v4, "encodeInteger:forKey:", -[STCallingStatusDomainCallDescriptor copresenceActivityType](self, "copresenceActivityType"), @"copresenceActivityType");
  id v5 = [(STCallingStatusDomainCallDescriptor *)self callProviderAttribution];
  [v4 encodeObject:v5 forKey:@"callProviderAttribution"];
}

- (STCallingStatusDomainCallDescriptor)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"callType"];
  uint64_t v6 = [v4 decodeIntegerForKey:@"callState"];
  uint64_t v7 = [v4 decodeIntegerForKey:@"copresenceActivityType"];
  id v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"callProviderAttribution"];

  unint64_t v9 = [(STCallingStatusDomainCallDescriptor *)self initWithCallType:v5 callState:v6 copresenceActivityType:v7 callProviderAttribution:v8];
  return v9;
}

- (unint64_t)callType
{
  return self->_callType;
}

- (unint64_t)callState
{
  return self->_callState;
}

- (unint64_t)copresenceActivityType
{
  return self->_copresenceActivityType;
}

- (STActivityAttribution)callProviderAttribution
{
  return self->_callProviderAttribution;
}

- (void).cxx_destruct
{
}

@end