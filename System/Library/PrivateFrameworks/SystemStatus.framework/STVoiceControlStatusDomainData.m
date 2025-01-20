@interface STVoiceControlStatusDomainData
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isVoiceControlActive;
- (NSString)description;
- (STVoiceControlStatusDomainData)init;
- (STVoiceControlStatusDomainData)initWithCoder:(id)a3;
- (id)_descriptionBuilderWithMultilinePrefix:(uint64_t)a3 forDebug:;
- (id)dataByApplyingDiff:(id)a3;
- (id)debugDescriptionWithMultilinePrefix:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)diffFromData:(id)a3;
- (id)initWithData:(id)result;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)hash;
- (unint64_t)listeningState;
- (void)encodeWithCoder:(id)a3;
@end

@implementation STVoiceControlStatusDomainData

- (STVoiceControlStatusDomainData)init
{
  return (STVoiceControlStatusDomainData *)-[STVoiceControlStatusDomainData initWithData:](self, 0);
}

- (id)initWithData:(id)result
{
  if (result)
  {
    v2 = result;
    id v3 = a2;
    char v4 = [v3 isVoiceControlActive];
    uint64_t v5 = [v3 listeningState];

    v6.receiver = v2;
    v6.super_class = (Class)STVoiceControlStatusDomainData;
    result = objc_msgSendSuper2(&v6, sel_init);
    if (result)
    {
      *((unsigned char *)result + 8) = v4;
      *((void *)result + 2) = v5;
    }
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F4F738] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
  BOOL v6 = [(STVoiceControlStatusDomainData *)self isVoiceControlActive];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __42__STVoiceControlStatusDomainData_isEqual___block_invoke;
  v18[3] = &unk_1E6B630D0;
  id v7 = v4;
  id v19 = v7;
  id v8 = (id)[v5 appendBool:v6 counterpart:v18];
  unint64_t v9 = [(STVoiceControlStatusDomainData *)self listeningState];
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  v15 = __42__STVoiceControlStatusDomainData_isEqual___block_invoke_2;
  v16 = &unk_1E6B63670;
  id v17 = v7;
  id v10 = v7;
  id v11 = (id)[v5 appendUnsignedInteger:v9 counterpart:&v13];
  LOBYTE(v9) = objc_msgSend(v5, "isEqual", v13, v14, v15, v16);

  return v9;
}

uint64_t __42__STVoiceControlStatusDomainData_isEqual___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) isVoiceControlActive];
}

uint64_t __42__STVoiceControlStatusDomainData_isEqual___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) listeningState];
}

- (unint64_t)hash
{
  id v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = (id)objc_msgSend(v3, "appendBool:", -[STVoiceControlStatusDomainData isVoiceControlActive](self, "isVoiceControlActive"));
  id v5 = (id)objc_msgSend(v3, "appendUnsignedInteger:", -[STVoiceControlStatusDomainData listeningState](self, "listeningState"));
  unint64_t v6 = [v3 hash];

  return v6;
}

- (NSString)description
{
  return (NSString *)[(STVoiceControlStatusDomainData *)self descriptionWithMultilinePrefix:0];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = +[STMutableVoiceControlStatusDomainData allocWithZone:a3];

  return -[STVoiceControlStatusDomainData initWithData:](v4, self);
}

- (id)succinctDescription
{
  v2 = [(STVoiceControlStatusDomainData *)self succinctDescriptionBuilder];
  id v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  id v3 = [(STVoiceControlStatusDomainData *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  id v3 = -[STVoiceControlStatusDomainData _descriptionBuilderWithMultilinePrefix:forDebug:](self, a3, 1);
  id v4 = [v3 build];

  return v4;
}

- (id)_descriptionBuilderWithMultilinePrefix:(uint64_t)a3 forDebug:
{
  id v3 = a1;
  if (a1)
  {
    id v5 = a2;
    unint64_t v6 = [v3 succinctDescriptionBuilder];
    [v6 setUseDebugDescription:a3];
    [v6 setActiveMultilinePrefix:v5];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __82__STVoiceControlStatusDomainData__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke;
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
  return -[STVoiceControlStatusDomainData _descriptionBuilderWithMultilinePrefix:forDebug:](self, a3, 0);
}

uint64_t __82__STVoiceControlStatusDomainData__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke(uint64_t a1)
{
  id v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "isVoiceControlActive"), @"voiceControlActive");
  id v3 = *(void **)(a1 + 32);
  unint64_t v4 = [*(id *)(a1 + 40) listeningState];
  if (v4 > 2) {
    id v5 = @"(unknown)";
  }
  else {
    id v5 = off_1E6B64090[v4];
  }

  return [v3 appendString:v5 withName:@"listeningState"];
}

- (id)diffFromData:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = +[STVoiceControlStatusDomainDataDiff diffFromData:v4 toData:self];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)dataByApplyingDiff:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([v4 isEmpty])
    {
      id v5 = (void *)[(STVoiceControlStatusDomainData *)self copy];
    }
    else
    {
      id v5 = (void *)[(STVoiceControlStatusDomainData *)self mutableCopy];
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
  id v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[STVoiceControlStatusDomainData isVoiceControlActive](self, "isVoiceControlActive"), @"voiceControlActive");
  objc_msgSend(v4, "encodeInteger:forKey:", -[STVoiceControlStatusDomainData listeningState](self, "listeningState"), @"listeningState");
}

- (STVoiceControlStatusDomainData)initWithCoder:(id)a3
{
  id v4 = a3;
  char v5 = [v4 decodeBoolForKey:@"voiceControlActive"];
  unint64_t v6 = [v4 decodeIntegerForKey:@"listeningState"];

  if (!self) {
    return 0;
  }
  v8.receiver = self;
  v8.super_class = (Class)STVoiceControlStatusDomainData;
  result = [(STVoiceControlStatusDomainData *)&v8 init];
  if (result)
  {
    result->_voiceControlActive = v5;
    result->_listeningState = v6;
  }
  return result;
}

- (BOOL)isVoiceControlActive
{
  return self->_voiceControlActive;
}

- (unint64_t)listeningState
{
  return self->_listeningState;
}

@end