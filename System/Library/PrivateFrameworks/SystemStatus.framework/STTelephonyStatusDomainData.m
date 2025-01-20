@interface STTelephonyStatusDomainData
+ (BOOL)supportsSecureCoding;
- (BOOL)isCellularRadioCapabilityEnabled;
- (BOOL)isDualSIMEnabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)isInactiveSOSEnabled;
- (BOOL)isRadioModuleDead;
- (BOOL)isUsingStewieConnection;
- (BOOL)isUsingStewieForSOS;
- (NSString)description;
- (STTelephonyStatusDomainData)init;
- (STTelephonyStatusDomainData)initWithCoder:(id)a3;
- (STTelephonyStatusDomainSIMInfo)SIMOneInfo;
- (STTelephonyStatusDomainSIMInfo)SIMTwoInfo;
- (STTelephonyStatusDomainSIMInfo)primarySIMInfo;
- (STTelephonyStatusDomainSIMInfo)secondarySIMInfo;
- (id)_descriptionBuilderWithMultilinePrefix:(uint64_t)a3 forDebug:;
- (id)dataByApplyingDiff:(id)a3;
- (id)debugDescriptionWithMultilinePrefix:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)diffFromData:(id)a3;
- (id)initWithData:(void *)a1;
- (id)initWithSIMOneInfo:(void *)a3 SIMTwoInfo:(char)a4 cellularRadioCapabilityEnabled:(char)a5 dualSIMEnabled:(char)a6 radioModuleDead:(char)a7 usingStewieForSOS:(char)a8 inactiveSOSEnabled:(char)a9 usingStewieConnection:;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation STTelephonyStatusDomainData

- (id)initWithData:(void *)a1
{
  id v2 = a1;
  if (a1)
  {
    id v3 = a2;
    v4 = [v3 SIMOneInfo];
    v5 = [v3 SIMTwoInfo];
    char v6 = [v3 isCellularRadioCapabilityEnabled];
    char v7 = [v3 isDualSIMEnabled];
    char v8 = [v3 isRadioModuleDead];
    char v9 = [v3 isUsingStewieForSOS];
    char v10 = [v3 isInactiveSOSEnabled];
    char v11 = [v3 isUsingStewieConnection];

    id v2 = -[STTelephonyStatusDomainData initWithSIMOneInfo:SIMTwoInfo:cellularRadioCapabilityEnabled:dualSIMEnabled:radioModuleDead:usingStewieForSOS:inactiveSOSEnabled:usingStewieConnection:](v2, v4, v5, v6, v7, v8, v9, v10, v11);
  }
  return v2;
}

- (BOOL)isCellularRadioCapabilityEnabled
{
  return self->_cellularRadioCapabilityEnabled;
}

- (BOOL)isUsingStewieForSOS
{
  return self->_usingStewieForSOS;
}

- (BOOL)isUsingStewieConnection
{
  return self->_usingStewieConnection;
}

- (BOOL)isRadioModuleDead
{
  return self->_radioModuleDead;
}

- (BOOL)isInactiveSOSEnabled
{
  return self->_inactiveSOSEnabled;
}

- (BOOL)isDualSIMEnabled
{
  return self->_dualSIMEnabled;
}

- (id)initWithSIMOneInfo:(void *)a3 SIMTwoInfo:(char)a4 cellularRadioCapabilityEnabled:(char)a5 dualSIMEnabled:(char)a6 radioModuleDead:(char)a7 usingStewieForSOS:(char)a8 inactiveSOSEnabled:(char)a9 usingStewieConnection:
{
  id v16 = a2;
  id v17 = a3;
  if (a1)
  {
    v27.receiver = a1;
    v27.super_class = (Class)STTelephonyStatusDomainData;
    a1 = objc_msgSendSuper2(&v27, sel_init);
    if (a1)
    {
      v18 = (void *)[v16 copy];
      v19 = v18;
      if (v18) {
        v20 = v18;
      }
      else {
        v20 = objc_alloc_init(STTelephonyStatusDomainSIMInfo);
      }
      v21 = (void *)*((void *)a1 + 1);
      *((void *)a1 + 1) = v20;

      v22 = (void *)[v17 copy];
      v23 = v22;
      if (v22) {
        v24 = v22;
      }
      else {
        v24 = objc_alloc_init(STTelephonyStatusDomainSIMInfo);
      }
      v25 = (void *)*((void *)a1 + 2);
      *((void *)a1 + 2) = v24;

      *((unsigned char *)a1 + 24) = a4;
      *((unsigned char *)a1 + 25) = a5;
      *((unsigned char *)a1 + 26) = a6;
      *((unsigned char *)a1 + 27) = a7;
      *((unsigned char *)a1 + 28) = a8;
      *((unsigned char *)a1 + 29) = a9;
    }
  }

  return a1;
}

- (STTelephonyStatusDomainSIMInfo)primarySIMInfo
{
  id v3 = [(STTelephonyStatusDomainData *)self SIMOneInfo];
  if (![(STTelephonyStatusDomainData *)self isCellularRadioCapabilityEnabled])
  {
    id v6 = v3;
    goto LABEL_33;
  }
  if (!self) {
    goto LABEL_29;
  }
  v4 = [(STTelephonyStatusDomainData *)self SIMTwoInfo];
  if ([v4 isSIMPresent] && objc_msgSend(v4, "isPreferredForDataConnections"))
  {
    id v5 = v4;
  }
  else
  {
    char v7 = [(STTelephonyStatusDomainData *)self SIMOneInfo];
    if ([v7 isSIMPresent]) {
      id v5 = v7;
    }
    else {
      id v5 = 0;
    }
  }
  if (!v5)
  {
    char v9 = [(STTelephonyStatusDomainData *)self SIMOneInfo];
    if ([v9 isSIMPresent])
    {
      id v10 = v9;
    }
    else
    {
      char v11 = [(STTelephonyStatusDomainData *)self SIMTwoInfo];
      if ([v11 isSIMPresent]) {
        id v10 = v11;
      }
      else {
        id v10 = 0;
      }
    }
    if (v10)
    {
      id v12 = v10;
      id v6 = v12;
LABEL_31:

      id v8 = 0;
      goto LABEL_32;
    }
    v13 = [(STTelephonyStatusDomainData *)self SIMOneInfo];
    if ([v13 serviceState] == 3)
    {
      id v14 = v13;
    }
    else
    {
      v15 = [(STTelephonyStatusDomainData *)self SIMTwoInfo];
      if ([v15 serviceState] == 3) {
        id v14 = v15;
      }
      else {
        id v14 = 0;
      }
    }
    if (v14)
    {
      id v16 = v14;
      id v6 = v16;
LABEL_30:

      id v12 = 0;
      goto LABEL_31;
    }
LABEL_29:
    id v6 = v3;
    id v16 = 0;
    goto LABEL_30;
  }
  id v8 = v5;
  id v6 = v8;
LABEL_32:

LABEL_33:

  return (STTelephonyStatusDomainSIMInfo *)v6;
}

- (STTelephonyStatusDomainSIMInfo)SIMOneInfo
{
  return self->_SIMOneInfo;
}

- (STTelephonyStatusDomainSIMInfo)SIMTwoInfo
{
  return self->_SIMTwoInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_SIMTwoInfo, 0);

  objc_storeStrong((id *)&self->_SIMOneInfo, 0);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v4 = +[STMutableTelephonyStatusDomainData allocWithZone:a3];

  return -[STTelephonyStatusDomainData initWithData:](v4, self);
}

- (id)diffFromData:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = +[STTelephonyStatusDomainDataDiff diffFromData:v4 toData:self];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (STTelephonyStatusDomainData)init
{
  return (STTelephonyStatusDomainData *)-[STTelephonyStatusDomainData initWithData:](self, 0);
}

- (STTelephonyStatusDomainSIMInfo)secondarySIMInfo
{
  id v2 = self;
  if ([(STTelephonyStatusDomainData *)self isCellularRadioCapabilityEnabled]
    && [(STTelephonyStatusDomainData *)v2 isDualSIMEnabled])
  {
    id v3 = [(STTelephonyStatusDomainData *)v2 primarySIMInfo];
    id v4 = v3;
    if (v2)
    {
      id v5 = v3;
      id v6 = [(STTelephonyStatusDomainData *)v2 SIMOneInfo];

      if (v6 == v5)
      {
        char v7 = [(STTelephonyStatusDomainData *)v2 SIMTwoInfo];
      }
      else
      {
        char v7 = (STTelephonyStatusDomainData *)v6;
      }
      id v2 = v7;
    }
    if (([(STTelephonyStatusDomainData *)v2 isSIMPresent] & 1) != 0
      || [(STTelephonyStatusDomainData *)v2 serviceState] == 3)
    {
      id v8 = v2;
    }
    else
    {
      id v8 = 0;
    }
  }
  else
  {
    id v8 = 0;
  }

  return (STTelephonyStatusDomainSIMInfo *)v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F4F738] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
  id v6 = [(STTelephonyStatusDomainData *)self SIMOneInfo];
  v48[0] = MEMORY[0x1E4F143A8];
  v48[1] = 3221225472;
  v48[2] = __39__STTelephonyStatusDomainData_isEqual___block_invoke;
  v48[3] = &unk_1E6B63430;
  id v7 = v4;
  id v49 = v7;
  id v8 = (id)[v5 appendObject:v6 counterpart:v48];

  char v9 = [(STTelephonyStatusDomainData *)self SIMTwoInfo];
  v46[0] = MEMORY[0x1E4F143A8];
  v46[1] = 3221225472;
  v46[2] = __39__STTelephonyStatusDomainData_isEqual___block_invoke_2;
  v46[3] = &unk_1E6B63430;
  id v10 = v7;
  id v47 = v10;
  id v11 = (id)[v5 appendObject:v9 counterpart:v46];

  BOOL v12 = [(STTelephonyStatusDomainData *)self isCellularRadioCapabilityEnabled];
  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = __39__STTelephonyStatusDomainData_isEqual___block_invoke_3;
  v44[3] = &unk_1E6B630D0;
  id v13 = v10;
  id v45 = v13;
  id v14 = (id)[v5 appendBool:v12 counterpart:v44];
  BOOL v15 = [(STTelephonyStatusDomainData *)self isDualSIMEnabled];
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __39__STTelephonyStatusDomainData_isEqual___block_invoke_4;
  v42[3] = &unk_1E6B630D0;
  id v16 = v13;
  id v43 = v16;
  id v17 = (id)[v5 appendBool:v15 counterpart:v42];
  BOOL v18 = [(STTelephonyStatusDomainData *)self isRadioModuleDead];
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __39__STTelephonyStatusDomainData_isEqual___block_invoke_5;
  v40[3] = &unk_1E6B630D0;
  id v19 = v16;
  id v41 = v19;
  id v20 = (id)[v5 appendBool:v18 counterpart:v40];
  BOOL v21 = [(STTelephonyStatusDomainData *)self isUsingStewieForSOS];
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __39__STTelephonyStatusDomainData_isEqual___block_invoke_6;
  v38[3] = &unk_1E6B630D0;
  id v22 = v19;
  id v39 = v22;
  id v23 = (id)[v5 appendBool:v21 counterpart:v38];
  BOOL v24 = [(STTelephonyStatusDomainData *)self isInactiveSOSEnabled];
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __39__STTelephonyStatusDomainData_isEqual___block_invoke_7;
  v36[3] = &unk_1E6B630D0;
  id v25 = v22;
  id v37 = v25;
  id v26 = (id)[v5 appendBool:v24 counterpart:v36];
  BOOL v27 = [(STTelephonyStatusDomainData *)self isUsingStewieConnection];
  uint64_t v31 = MEMORY[0x1E4F143A8];
  uint64_t v32 = 3221225472;
  v33 = __39__STTelephonyStatusDomainData_isEqual___block_invoke_8;
  v34 = &unk_1E6B630D0;
  id v35 = v25;
  id v28 = v25;
  id v29 = (id)[v5 appendBool:v27 counterpart:&v31];
  LOBYTE(v25) = objc_msgSend(v5, "isEqual", v31, v32, v33, v34);

  return (char)v25;
}

uint64_t __39__STTelephonyStatusDomainData_isEqual___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) SIMOneInfo];
}

uint64_t __39__STTelephonyStatusDomainData_isEqual___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) SIMTwoInfo];
}

uint64_t __39__STTelephonyStatusDomainData_isEqual___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) isCellularRadioCapabilityEnabled];
}

uint64_t __39__STTelephonyStatusDomainData_isEqual___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) isDualSIMEnabled];
}

uint64_t __39__STTelephonyStatusDomainData_isEqual___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) isRadioModuleDead];
}

uint64_t __39__STTelephonyStatusDomainData_isEqual___block_invoke_6(uint64_t a1)
{
  return [*(id *)(a1 + 32) isUsingStewieForSOS];
}

uint64_t __39__STTelephonyStatusDomainData_isEqual___block_invoke_7(uint64_t a1)
{
  return [*(id *)(a1 + 32) isInactiveSOSEnabled];
}

uint64_t __39__STTelephonyStatusDomainData_isEqual___block_invoke_8(uint64_t a1)
{
  return [*(id *)(a1 + 32) isUsingStewieConnection];
}

- (unint64_t)hash
{
  id v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = [(STTelephonyStatusDomainData *)self SIMOneInfo];
  id v5 = (id)[v3 appendObject:v4];

  id v6 = [(STTelephonyStatusDomainData *)self SIMTwoInfo];
  id v7 = (id)[v3 appendObject:v6];

  id v8 = (id)objc_msgSend(v3, "appendBool:", -[STTelephonyStatusDomainData isCellularRadioCapabilityEnabled](self, "isCellularRadioCapabilityEnabled"));
  id v9 = (id)objc_msgSend(v3, "appendBool:", -[STTelephonyStatusDomainData isDualSIMEnabled](self, "isDualSIMEnabled"));
  id v10 = (id)objc_msgSend(v3, "appendBool:", -[STTelephonyStatusDomainData isRadioModuleDead](self, "isRadioModuleDead"));
  id v11 = (id)objc_msgSend(v3, "appendBool:", -[STTelephonyStatusDomainData isUsingStewieForSOS](self, "isUsingStewieForSOS"));
  id v12 = (id)objc_msgSend(v3, "appendBool:", -[STTelephonyStatusDomainData isInactiveSOSEnabled](self, "isInactiveSOSEnabled"));
  id v13 = (id)objc_msgSend(v3, "appendBool:", -[STTelephonyStatusDomainData isUsingStewieConnection](self, "isUsingStewieConnection"));
  unint64_t v14 = [v3 hash];

  return v14;
}

- (NSString)description
{
  return (NSString *)[(STTelephonyStatusDomainData *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  id v2 = [(STTelephonyStatusDomainData *)self succinctDescriptionBuilder];
  id v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  id v3 = [(STTelephonyStatusDomainData *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  id v3 = -[STTelephonyStatusDomainData _descriptionBuilderWithMultilinePrefix:forDebug:](self, a3, 1);
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
    v9[2] = __79__STTelephonyStatusDomainData__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke;
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
  return -[STTelephonyStatusDomainData _descriptionBuilderWithMultilinePrefix:forDebug:](self, a3, 0);
}

id __79__STTelephonyStatusDomainData__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) SIMOneInfo];
  id v4 = (id)[v2 appendObject:v3 withName:@"SIMOneInfo"];

  id v5 = *(void **)(a1 + 32);
  id v6 = [*(id *)(a1 + 40) SIMTwoInfo];
  id v7 = (id)[v5 appendObject:v6 withName:@"SIMTwoInfo"];

  id v8 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "isCellularRadioCapabilityEnabled"), @"cellularRadioCapabilityEnabled");
  id v9 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "isDualSIMEnabled"), @"dualSIMEnabled");
  id v10 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "isRadioModuleDead"), @"radioModuleDead");
  id v11 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "isUsingStewieForSOS"), @"usingStewieForSOS");
  id v12 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "isInactiveSOSEnabled"), @"inactiveSOSEnabled");
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "isUsingStewieConnection"), @"usingStewieConnection");
}

- (id)dataByApplyingDiff:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([v4 isEmpty])
    {
      id v5 = (void *)[(STTelephonyStatusDomainData *)self copy];
    }
    else
    {
      id v5 = (void *)[(STTelephonyStatusDomainData *)self mutableCopy];
      [v4 applyToMutableData:v5];
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  id v4 = [(STTelephonyStatusDomainData *)self SIMOneInfo];
  [v6 encodeObject:v4 forKey:@"SIMOneInfo"];

  id v5 = [(STTelephonyStatusDomainData *)self SIMTwoInfo];
  [v6 encodeObject:v5 forKey:@"SIMTwoInfo"];

  objc_msgSend(v6, "encodeBool:forKey:", -[STTelephonyStatusDomainData isCellularRadioCapabilityEnabled](self, "isCellularRadioCapabilityEnabled"), @"cellularRadioCapabilityEnabled");
  objc_msgSend(v6, "encodeBool:forKey:", -[STTelephonyStatusDomainData isDualSIMEnabled](self, "isDualSIMEnabled"), @"dualSIMEnabled");
  objc_msgSend(v6, "encodeBool:forKey:", -[STTelephonyStatusDomainData isRadioModuleDead](self, "isRadioModuleDead"), @"radioModuleDead");
  objc_msgSend(v6, "encodeBool:forKey:", -[STTelephonyStatusDomainData isUsingStewieForSOS](self, "isUsingStewieForSOS"), @"usingStewieForSOS");
  objc_msgSend(v6, "encodeBool:forKey:", -[STTelephonyStatusDomainData isInactiveSOSEnabled](self, "isInactiveSOSEnabled"), @"inactiveSOSEnabled");
  objc_msgSend(v6, "encodeBool:forKey:", -[STTelephonyStatusDomainData isUsingStewieConnection](self, "isUsingStewieConnection"), @"usingStewieConnection");
}

- (STTelephonyStatusDomainData)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SIMOneInfo"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SIMTwoInfo"];
  char v7 = [v4 decodeBoolForKey:@"cellularRadioCapabilityEnabled"];
  char v8 = [v4 decodeBoolForKey:@"dualSIMEnabled"];
  char v9 = [v4 decodeBoolForKey:@"radioModuleDead"];
  char v10 = [v4 decodeBoolForKey:@"usingStewieForSOS"];
  char v11 = [v4 decodeBoolForKey:@"inactiveSOSEnabled"];
  char v12 = [v4 decodeBoolForKey:@"usingStewieConnection"];

  id v13 = (STTelephonyStatusDomainData *)-[STTelephonyStatusDomainData initWithSIMOneInfo:SIMTwoInfo:cellularRadioCapabilityEnabled:dualSIMEnabled:radioModuleDead:usingStewieForSOS:inactiveSOSEnabled:usingStewieConnection:](self, v5, v6, v7, v8, v9, v10, v11, v12);
  return v13;
}

@end