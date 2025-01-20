@interface STCallingStatusDomainData
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSArray)callDescriptors;
- (NSSet)activeCallAttributions;
- (NSSet)activeVideoConferenceAttributions;
- (NSSet)ringingCallAttributions;
- (NSSet)ringingVideoConferenceAttributions;
- (NSString)description;
- (STCallingStatusDomainData)init;
- (STCallingStatusDomainData)initWithCallDescriptorListData:(id)a3;
- (STCallingStatusDomainData)initWithCoder:(id)a3;
- (STCallingStatusDomainData)initWithData:(id)a3;
- (STListData)callDescriptorListData;
- (id)_activeAudioCallDescriptors;
- (id)_descriptionBuilderWithMultilinePrefix:(uint64_t)a3 forDebug:;
- (id)_initWithCallDescriptorListData:(id)a3;
- (id)_ringingAudioCallDescriptors;
- (id)_videoOrCopresenceCallDescriptorsWithCallState:(void *)a1;
- (id)dataByApplyingDiff:(id)a3;
- (id)debugDescriptionWithMultilinePrefix:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)diffFromData:(id)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation STCallingStatusDomainData

- (STCallingStatusDomainData)init
{
  v3 = objc_alloc_init(STListData);
  v4 = [(STCallingStatusDomainData *)self initWithCallDescriptorListData:v3];

  return v4;
}

- (STCallingStatusDomainData)initWithData:(id)a3
{
  v4 = [a3 callDescriptorListData];
  v5 = [(STCallingStatusDomainData *)self initWithCallDescriptorListData:v4];

  return v5;
}

- (STCallingStatusDomainData)initWithCallDescriptorListData:(id)a3
{
  v4 = (void *)[a3 copy];
  v5 = [(STCallingStatusDomainData *)self _initWithCallDescriptorListData:v4];

  return v5;
}

- (id)_initWithCallDescriptorListData:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)STCallingStatusDomainData;
  v6 = [(STCallingStatusDomainData *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_callDescriptorListData, a3);
  }

  return v7;
}

- (NSArray)callDescriptors
{
  v2 = [(STCallingStatusDomainData *)self callDescriptorListData];
  v3 = [v2 objects];

  return (NSArray *)v3;
}

- (NSSet)activeCallAttributions
{
  v7[0] = 0;
  v7[1] = v7;
  v7[2] = 0x2020000000;
  int v8 = 0;
  v2 = -[STCallingStatusDomainData _activeAudioCallDescriptors](self);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __51__STCallingStatusDomainData_activeCallAttributions__block_invoke;
  v6[3] = &unk_1E6B63FA0;
  v6[4] = v7;
  v3 = objc_msgSend(v2, "bs_map:", v6);

  v4 = [MEMORY[0x1E4F1CAD0] setWithArray:v3];

  _Block_object_dispose(v7, 8);

  return (NSSet *)v4;
}

- (id)_activeAudioCallDescriptors
{
  if (a1)
  {
    v1 = [a1 callDescriptors];
    v2 = objc_msgSend(v1, "bs_filter:", &__block_literal_global_19);
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

STActivityAttribution *__51__STCallingStatusDomainData_activeCallAttributions__block_invoke(uint64_t a1)
{
  return +[STActivityAttribution attributionWithPID:](STActivityAttribution, "attributionWithPID:");
}

- (NSSet)ringingCallAttributions
{
  v7[0] = 0;
  v7[1] = v7;
  v7[2] = 0x2020000000;
  int v8 = 0;
  v2 = -[STCallingStatusDomainData _ringingAudioCallDescriptors](self);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __52__STCallingStatusDomainData_ringingCallAttributions__block_invoke;
  v6[3] = &unk_1E6B63FA0;
  v6[4] = v7;
  v3 = objc_msgSend(v2, "bs_map:", v6);

  v4 = [MEMORY[0x1E4F1CAD0] setWithArray:v3];

  _Block_object_dispose(v7, 8);

  return (NSSet *)v4;
}

- (id)_ringingAudioCallDescriptors
{
  if (a1)
  {
    v1 = [a1 callDescriptors];
    v2 = objc_msgSend(v1, "bs_filter:", &__block_literal_global_21_0);
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

STActivityAttribution *__52__STCallingStatusDomainData_ringingCallAttributions__block_invoke(uint64_t a1)
{
  return +[STActivityAttribution attributionWithPID:](STActivityAttribution, "attributionWithPID:");
}

- (NSSet)activeVideoConferenceAttributions
{
  v7[0] = 0;
  v7[1] = v7;
  v7[2] = 0x2020000000;
  int v8 = 0;
  v2 = -[STCallingStatusDomainData _videoOrCopresenceCallDescriptorsWithCallState:](self, 0);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __62__STCallingStatusDomainData_activeVideoConferenceAttributions__block_invoke;
  v6[3] = &unk_1E6B63FA0;
  v6[4] = v7;
  v3 = objc_msgSend(v2, "bs_map:", v6);

  v4 = [MEMORY[0x1E4F1CAD0] setWithArray:v3];

  _Block_object_dispose(v7, 8);

  return (NSSet *)v4;
}

- (id)_videoOrCopresenceCallDescriptorsWithCallState:(void *)a1
{
  if (a1)
  {
    v3 = [a1 callDescriptors];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __76__STCallingStatusDomainData__videoOrCopresenceCallDescriptorsWithCallState___block_invoke;
    v6[3] = &__block_descriptor_40_e45_B16__0__STCallingStatusDomainCallDescriptor_8l;
    v6[4] = a2;
    v4 = objc_msgSend(v3, "bs_filter:", v6);
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

STActivityAttribution *__62__STCallingStatusDomainData_activeVideoConferenceAttributions__block_invoke(uint64_t a1)
{
  return +[STActivityAttribution attributionWithPID:](STActivityAttribution, "attributionWithPID:");
}

- (NSSet)ringingVideoConferenceAttributions
{
  v7[0] = 0;
  v7[1] = v7;
  v7[2] = 0x2020000000;
  int v8 = 0;
  v2 = -[STCallingStatusDomainData _videoOrCopresenceCallDescriptorsWithCallState:](self, 1);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __63__STCallingStatusDomainData_ringingVideoConferenceAttributions__block_invoke;
  v6[3] = &unk_1E6B63FA0;
  v6[4] = v7;
  v3 = objc_msgSend(v2, "bs_map:", v6);

  v4 = [MEMORY[0x1E4F1CAD0] setWithArray:v3];

  _Block_object_dispose(v7, 8);

  return (NSSet *)v4;
}

STActivityAttribution *__63__STCallingStatusDomainData_ringingVideoConferenceAttributions__block_invoke(uint64_t a1)
{
  return +[STActivityAttribution attributionWithPID:](STActivityAttribution, "attributionWithPID:");
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F4F738] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
  v6 = [(STCallingStatusDomainData *)self callDescriptorListData];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __37__STCallingStatusDomainData_isEqual___block_invoke;
  v10[3] = &unk_1E6B63058;
  id v11 = v4;
  id v7 = v4;
  id v8 = (id)[v5 appendObject:v6 counterpart:v10];

  LOBYTE(v6) = [v5 isEqual];
  return (char)v6;
}

uint64_t __37__STCallingStatusDomainData_isEqual___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) callDescriptorListData];
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = [(STCallingStatusDomainData *)self callDescriptorListData];
  id v5 = (id)[v3 appendObject:v4];

  unint64_t v6 = [v3 hash];
  return v6;
}

- (NSString)description
{
  return (NSString *)[(STCallingStatusDomainData *)self descriptionWithMultilinePrefix:0];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = +[STMutableCallingStatusDomainData allocWithZone:a3];

  return [(STCallingStatusDomainData *)v4 initWithData:self];
}

- (id)succinctDescription
{
  v2 = [(STCallingStatusDomainData *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(STCallingStatusDomainData *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  v3 = -[STCallingStatusDomainData _descriptionBuilderWithMultilinePrefix:forDebug:](self, a3, 1);
  id v4 = [v3 build];

  return v4;
}

- (id)_descriptionBuilderWithMultilinePrefix:(uint64_t)a3 forDebug:
{
  if (a1)
  {
    id v5 = a2;
    unint64_t v6 = [a1 succinctDescriptionBuilder];
    [v6 setUseDebugDescription:a3];
    [v6 setActiveMultilinePrefix:v5];

    id v7 = [a1 callDescriptorListData];
    id v8 = (id)[v6 appendObject:v7 withName:@"callDescriptors"];
  }
  else
  {
    unint64_t v6 = 0;
  }

  return v6;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  return -[STCallingStatusDomainData _descriptionBuilderWithMultilinePrefix:forDebug:](self, a3, 0);
}

- (id)diffFromData:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = +[STCallingStatusDomainDataDiff diffFromData:v4 toData:self];
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
      id v5 = (void *)[(STCallingStatusDomainData *)self copy];
    }
    else
    {
      id v5 = (void *)[(STCallingStatusDomainData *)self mutableCopy];
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
  id v5 = [(STCallingStatusDomainData *)self callDescriptorListData];
  [v4 encodeObject:v5 forKey:@"callDescriptorListData"];
}

- (STCallingStatusDomainData)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"callDescriptorListData"];

  id v6 = v5;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __43__STCallingStatusDomainData_initWithCoder___block_invoke_2;
  v10[3] = &unk_1E6B63FC8;
  void v10[4] = &v11;
  [v6 enumerateObjectsUsingBlock:v10];
  if (*((unsigned char *)v12 + 24)) {
    id v7 = 0;
  }
  else {
    id v7 = v6;
  }
  _Block_object_dispose(&v11, 8);

  if (v7)
  {
    self = [(STCallingStatusDomainData *)self initWithCallDescriptorListData:v7];
    id v8 = self;
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

void __43__STCallingStatusDomainData_initWithCoder___block_invoke_2(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a3 = 1;
  }
}

BOOL __56__STCallingStatusDomainData__activeAudioCallDescriptors__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 callType]) {
    BOOL v3 = 0;
  }
  else {
    BOOL v3 = [v2 callState] == 0;
  }

  return v3;
}

BOOL __57__STCallingStatusDomainData__ringingAudioCallDescriptors__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 callType]) {
    BOOL v3 = 0;
  }
  else {
    BOOL v3 = [v2 callState] == 1;
  }

  return v3;
}

BOOL __56__STCallingStatusDomainData__activeVideoCallDescriptors__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v3 = [v2 callType] == 1 && objc_msgSend(v2, "callState") == 0;

  return v3;
}

BOOL __76__STCallingStatusDomainData__videoOrCopresenceCallDescriptorsWithCallState___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = ([v3 callType] == 1 || objc_msgSend(v3, "callType") == 2)
    && [v3 callState] == *(void *)(a1 + 32);

  return v4;
}

BOOL __57__STCallingStatusDomainData__ringingVideoCallDescriptors__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v3 = [v2 callType] == 1 && objc_msgSend(v2, "callState") == 1;

  return v3;
}

- (STListData)callDescriptorListData
{
  return self->_callDescriptorListData;
}

- (void).cxx_destruct
{
}

@end