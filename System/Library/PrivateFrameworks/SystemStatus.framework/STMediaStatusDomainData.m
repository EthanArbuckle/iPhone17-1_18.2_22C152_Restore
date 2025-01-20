@interface STMediaStatusDomainData
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSArray)cameraAttributions;
- (NSArray)microphoneAttributions;
- (NSArray)mutedMicrophoneRecordingAttributions;
- (NSArray)screenCaptureAttributions;
- (NSArray)systemAudioRecordingAttributions;
- (NSString)description;
- (STListData)cameraAttributionListData;
- (STListData)microphoneAttributionListData;
- (STListData)mutedMicrophoneRecordingAttributionListData;
- (STListData)screenCaptureAttributionListData;
- (STListData)systemAudioRecordingAttributionListData;
- (STMediaStatusDomainData)init;
- (STMediaStatusDomainData)initWithCoder:(id)a3;
- (STMediaStatusDomainData)initWithMicrophoneAttributionListData:(id)a3 mutedMicrophoneRecordingAttributionListData:(id)a4 systemAudioRecordingAttributionListData:(id)a5 cameraAttributionListData:(id)a6 screenCaptureAttributionListData:(id)a7;
- (id)_descriptionBuilderWithMultilinePrefix:(uint64_t)a3 forDebug:;
- (id)_initWithMicrophoneAttributionListData:(id)a3 mutedMicrophoneRecordingAttributionListData:(id)a4 systemAudioRecordingAttributionListData:(id)a5 cameraAttributionListData:(id)a6 screenCaptureAttributionListData:(id)a7;
- (id)audioRecordingAttributions;
- (id)cameraCaptureAttributionList;
- (id)cameraCaptureAttributions;
- (id)camerasInUseMatchingAttribution:(id)a3;
- (id)dataByApplyingDiff:(id)a3;
- (id)debugDescriptionWithMultilinePrefix:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)diffFromData:(id)a3;
- (id)initWithData:(void *)a1;
- (id)microphoneRecordingAttributions;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)mutedAudioRecordingAttributions;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation STMediaStatusDomainData

uint64_t __35__STMediaStatusDomainData_isEqual___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) microphoneAttributionListData];
}

uint64_t __35__STMediaStatusDomainData_isEqual___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) cameraAttributionListData];
}

uint64_t __35__STMediaStatusDomainData_isEqual___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) systemAudioRecordingAttributionListData];
}

uint64_t __35__STMediaStatusDomainData_isEqual___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) mutedMicrophoneRecordingAttributionListData];
}

- (NSArray)cameraAttributions
{
  v2 = [(STMediaStatusDomainData *)self cameraAttributionListData];
  v3 = [v2 objects];

  return (NSArray *)v3;
}

- (NSArray)mutedMicrophoneRecordingAttributions
{
  v2 = [(STMediaStatusDomainData *)self mutedMicrophoneRecordingAttributionListData];
  v3 = [v2 objects];

  return (NSArray *)v3;
}

- (STMediaStatusDomainData)init
{
  v3 = objc_alloc_init(STListData);
  v4 = objc_alloc_init(STListData);
  v5 = objc_alloc_init(STListData);
  v6 = objc_alloc_init(STListData);
  v7 = objc_alloc_init(STListData);
  v8 = [(STMediaStatusDomainData *)self initWithMicrophoneAttributionListData:v3 mutedMicrophoneRecordingAttributionListData:v4 systemAudioRecordingAttributionListData:v5 cameraAttributionListData:v6 screenCaptureAttributionListData:v7];

  return v8;
}

- (id)initWithData:(void *)a1
{
  id v2 = a1;
  if (a1)
  {
    id v3 = a2;
    v4 = [v3 microphoneAttributionListData];
    v5 = [v3 mutedMicrophoneRecordingAttributionListData];
    v6 = [v3 systemAudioRecordingAttributionListData];
    v7 = [v3 cameraAttributionListData];
    v8 = [v3 screenCaptureAttributionListData];

    id v2 = (id)[v2 initWithMicrophoneAttributionListData:v4 mutedMicrophoneRecordingAttributionListData:v5 systemAudioRecordingAttributionListData:v6 cameraAttributionListData:v7 screenCaptureAttributionListData:v8];
  }
  return v2;
}

- (STListData)mutedMicrophoneRecordingAttributionListData
{
  return self->_mutedMicrophoneRecordingAttributionListData;
}

- (STListData)cameraAttributionListData
{
  return self->_cameraAttributionListData;
}

- (STListData)systemAudioRecordingAttributionListData
{
  return self->_systemAudioRecordingAttributionListData;
}

- (STListData)screenCaptureAttributionListData
{
  return self->_screenCaptureAttributionListData;
}

- (NSArray)microphoneAttributions
{
  id v2 = [(STMediaStatusDomainData *)self microphoneAttributionListData];
  id v3 = [v2 objects];

  return (NSArray *)v3;
}

- (STListData)microphoneAttributionListData
{
  return self->_microphoneAttributionListData;
}

- (id)diffFromData:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = +[STMediaStatusDomainDataDiff diffFromData:v4 toData:self];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = +[STMutableMediaStatusDomainData allocWithZone:a3];

  return -[STMediaStatusDomainData initWithData:](v4, self);
}

- (STMediaStatusDomainData)initWithMicrophoneAttributionListData:(id)a3 mutedMicrophoneRecordingAttributionListData:(id)a4 systemAudioRecordingAttributionListData:(id)a5 cameraAttributionListData:(id)a6 screenCaptureAttributionListData:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  v16 = (void *)[a3 copy];
  v17 = (void *)[v15 copy];

  v18 = (void *)[v14 copy];
  v19 = (void *)[v13 copy];

  v20 = (void *)[v12 copy];
  v21 = [(STMediaStatusDomainData *)self _initWithMicrophoneAttributionListData:v16 mutedMicrophoneRecordingAttributionListData:v17 systemAudioRecordingAttributionListData:v18 cameraAttributionListData:v19 screenCaptureAttributionListData:v20];

  return v21;
}

- (id)_initWithMicrophoneAttributionListData:(id)a3 mutedMicrophoneRecordingAttributionListData:(id)a4 systemAudioRecordingAttributionListData:(id)a5 cameraAttributionListData:(id)a6 screenCaptureAttributionListData:(id)a7
{
  id v20 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)STMediaStatusDomainData;
  v17 = [(STMediaStatusDomainData *)&v21 init];
  p_isa = (id *)&v17->super.isa;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_microphoneAttributionListData, a3);
    objc_storeStrong(p_isa + 2, a4);
    objc_storeStrong(p_isa + 3, a5);
    objc_storeStrong(p_isa + 4, a6);
    objc_storeStrong(p_isa + 5, a7);
  }

  return p_isa;
}

- (id)dataByApplyingDiff:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([v4 isEmpty])
    {
      v5 = (void *)[(STMediaStatusDomainData *)self copy];
    }
    else
    {
      v5 = (void *)[(STMediaStatusDomainData *)self mutableCopy];
      [v4 applyToMutableData:v5];
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_screenCaptureAttributionListData, 0);
  objc_storeStrong((id *)&self->_cameraAttributionListData, 0);
  objc_storeStrong((id *)&self->_systemAudioRecordingAttributionListData, 0);
  objc_storeStrong((id *)&self->_mutedMicrophoneRecordingAttributionListData, 0);

  objc_storeStrong((id *)&self->_microphoneAttributionListData, 0);
}

uint64_t __35__STMediaStatusDomainData_isEqual___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) screenCaptureAttributionListData];
}

- (NSArray)systemAudioRecordingAttributions
{
  id v2 = [(STMediaStatusDomainData *)self systemAudioRecordingAttributionListData];
  id v3 = [v2 objects];

  return (NSArray *)v3;
}

- (NSArray)screenCaptureAttributions
{
  id v2 = [(STMediaStatusDomainData *)self screenCaptureAttributionListData];
  id v3 = [v2 objects];

  return (NSArray *)v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F4F738] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
  id v6 = v4;
  v7 = [(STMediaStatusDomainData *)self microphoneAttributionListData];
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __35__STMediaStatusDomainData_isEqual___block_invoke;
  v31[3] = &unk_1E6B64280;
  id v8 = v6;
  id v32 = v8;
  id v9 = (id)[v5 appendObject:v7 counterpart:v31];

  v10 = [(STMediaStatusDomainData *)self mutedMicrophoneRecordingAttributionListData];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __35__STMediaStatusDomainData_isEqual___block_invoke_2;
  v29[3] = &unk_1E6B64280;
  id v11 = v8;
  id v30 = v11;
  id v12 = (id)[v5 appendObject:v10 counterpart:v29];

  id v13 = [(STMediaStatusDomainData *)self systemAudioRecordingAttributionListData];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __35__STMediaStatusDomainData_isEqual___block_invoke_3;
  v27[3] = &unk_1E6B63058;
  id v14 = v11;
  id v28 = v14;
  id v15 = (id)[v5 appendObject:v13 counterpart:v27];

  id v16 = [(STMediaStatusDomainData *)self cameraAttributionListData];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __35__STMediaStatusDomainData_isEqual___block_invoke_4;
  v25[3] = &unk_1E6B64280;
  id v17 = v14;
  id v26 = v17;
  id v18 = (id)[v5 appendObject:v16 counterpart:v25];

  v19 = [(STMediaStatusDomainData *)self screenCaptureAttributionListData];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __35__STMediaStatusDomainData_isEqual___block_invoke_5;
  v23[3] = &unk_1E6B64280;
  id v24 = v17;
  id v20 = v17;
  id v21 = (id)[v5 appendObject:v19 counterpart:v23];

  LOBYTE(v19) = [v5 isEqual];
  return (char)v19;
}

- (id)microphoneRecordingAttributions
{
  id v2 = [(STMediaStatusDomainData *)self microphoneAttributions];
  id v3 = objc_msgSend(v2, "bs_map:", &__block_literal_global_24);

  return v3;
}

uint64_t __58__STMediaStatusDomainData_microphoneRecordingAttributions__block_invoke(uint64_t a1, void *a2)
{
  return [a2 activityAttribution];
}

- (id)cameraCaptureAttributionList
{
  id v2 = [(STMediaStatusDomainData *)self cameraAttributions];
  id v3 = objc_msgSend(v2, "bs_map:", &__block_literal_global_16);

  return v3;
}

uint64_t __55__STMediaStatusDomainData_cameraCaptureAttributionList__block_invoke(uint64_t a1, void *a2)
{
  return [a2 activityAttribution];
}

- (id)audioRecordingAttributions
{
  id v2 = (void *)MEMORY[0x1E4F1CAD0];
  id v3 = [(STMediaStatusDomainData *)self audioRecordingAttributionList];
  id v4 = [v2 setWithArray:v3];

  return v4;
}

- (id)mutedAudioRecordingAttributions
{
  id v2 = (void *)MEMORY[0x1E4F1CAD0];
  id v3 = [(STMediaStatusDomainData *)self mutedAudioRecordingAttributionList];
  id v4 = [v2 setWithArray:v3];

  return v4;
}

- (id)cameraCaptureAttributions
{
  id v2 = (void *)MEMORY[0x1E4F1CAD0];
  id v3 = [(STMediaStatusDomainData *)self cameraCaptureAttributionList];
  id v4 = [v2 setWithArray:v3];

  return v4;
}

- (id)camerasInUseMatchingAttribution:(id)a3
{
  id v4 = a3;
  v5 = [(STMediaStatusDomainData *)self cameraAttributions];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __59__STMediaStatusDomainData_camerasInUseMatchingAttribution___block_invoke;
  v12[3] = &unk_1E6B647F8;
  id v13 = v4;
  id v6 = v4;
  v7 = objc_msgSend(v5, "bs_filter:", v12);
  id v8 = objc_msgSend(v7, "bs_map:", &__block_literal_global_20);

  id v9 = [MEMORY[0x1E4F1CAD0] setWithArray:v8];
  v10 = [v9 allObjects];

  return v10;
}

uint64_t __59__STMediaStatusDomainData_camerasInUseMatchingAttribution___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [a2 activityAttribution];
  uint64_t v4 = [v2 isEqual:v3];

  return v4;
}

uint64_t __59__STMediaStatusDomainData_camerasInUseMatchingAttribution___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 cameraDescriptor];
}

- (unint64_t)hash
{
  id v3 = [MEMORY[0x1E4F4F758] builder];
  uint64_t v4 = [(STMediaStatusDomainData *)self microphoneAttributionListData];
  id v5 = (id)[v3 appendObject:v4];

  id v6 = [(STMediaStatusDomainData *)self mutedMicrophoneRecordingAttributionListData];
  id v7 = (id)[v3 appendObject:v6];

  id v8 = [(STMediaStatusDomainData *)self systemAudioRecordingAttributionListData];
  id v9 = (id)[v3 appendObject:v8];

  v10 = [(STMediaStatusDomainData *)self cameraAttributionListData];
  id v11 = (id)[v3 appendObject:v10];

  id v12 = [(STMediaStatusDomainData *)self screenCaptureAttributionListData];
  id v13 = (id)[v3 appendObject:v12];

  unint64_t v14 = [v3 hash];
  return v14;
}

- (NSString)description
{
  return (NSString *)[(STMediaStatusDomainData *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  id v2 = [(STMediaStatusDomainData *)self succinctDescriptionBuilder];
  id v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  id v3 = [(STMediaStatusDomainData *)self descriptionBuilderWithMultilinePrefix:a3];
  uint64_t v4 = [v3 build];

  return v4;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  id v3 = -[STMediaStatusDomainData _descriptionBuilderWithMultilinePrefix:forDebug:](self, a3, 1);
  uint64_t v4 = [v3 build];

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
    v9[2] = __75__STMediaStatusDomainData__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke;
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
  return -[STMediaStatusDomainData _descriptionBuilderWithMultilinePrefix:forDebug:](self, a3, 0);
}

void __75__STMediaStatusDomainData__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) microphoneAttributionListData];
  id v4 = (id)[v2 appendObject:v3 withName:@"microphoneAttributions"];

  id v5 = *(void **)(a1 + 32);
  id v6 = [*(id *)(a1 + 40) mutedMicrophoneRecordingAttributionListData];
  id v7 = (id)[v5 appendObject:v6 withName:@"mutedMicrophoneRecordingAttributions"];

  id v8 = *(void **)(a1 + 32);
  id v9 = [*(id *)(a1 + 40) systemAudioRecordingAttributionListData];
  id v10 = (id)[v8 appendObject:v9 withName:@"systemAudioRecordingAttributions"];

  id v11 = *(void **)(a1 + 32);
  id v12 = [*(id *)(a1 + 40) cameraAttributionListData];
  id v13 = (id)[v11 appendObject:v12 withName:@"cameraAttributions"];

  unint64_t v14 = *(void **)(a1 + 32);
  id v16 = [*(id *)(a1 + 40) screenCaptureAttributionListData];
  id v15 = (id)[v14 appendObject:v16 withName:@"screenCaptureAttributions"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(STMediaStatusDomainData *)self microphoneAttributionListData];
  [v4 encodeObject:v5 forKey:@"microphoneAttributions"];

  id v6 = [(STMediaStatusDomainData *)self mutedMicrophoneRecordingAttributionListData];
  [v4 encodeObject:v6 forKey:@"mutedMicrophoneRecordingAttributions"];

  id v7 = [(STMediaStatusDomainData *)self systemAudioRecordingAttributionListData];
  [v4 encodeObject:v7 forKey:@"systemAudioRecordingAttributions"];

  id v8 = [(STMediaStatusDomainData *)self cameraAttributionListData];
  [v4 encodeObject:v8 forKey:@"cameraAttributions"];

  id v9 = [(STMediaStatusDomainData *)self screenCaptureAttributionListData];
  [v4 encodeObject:v9 forKey:@"screenCaptureAttributions"];
}

- (STMediaStatusDomainData)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"microphoneAttributions"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"mutedMicrophoneRecordingAttributions"];
  id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"systemAudioRecordingAttributions"];
  id v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cameraAttributions"];
  id v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"screenCaptureAttributions"];

  uint64_t v10 = objc_opt_class();
  id v11 = __41__STMediaStatusDomainData_initWithCoder___block_invoke(v5, v10);

  uint64_t v12 = objc_opt_class();
  id v13 = __41__STMediaStatusDomainData_initWithCoder___block_invoke(v6, v12);

  uint64_t v14 = objc_opt_class();
  id v15 = __41__STMediaStatusDomainData_initWithCoder___block_invoke(v7, v14);

  uint64_t v16 = objc_opt_class();
  id v17 = __41__STMediaStatusDomainData_initWithCoder___block_invoke(v8, v16);

  uint64_t v18 = objc_opt_class();
  v19 = __41__STMediaStatusDomainData_initWithCoder___block_invoke(v9, v18);

  id v20 = 0;
  if (v11 && v13 && v15 && v17 && v19)
  {
    self = [(STMediaStatusDomainData *)self initWithMicrophoneAttributionListData:v11 mutedMicrophoneRecordingAttributionListData:v13 systemAudioRecordingAttributionListData:v15 cameraAttributionListData:v17 screenCaptureAttributionListData:v19];
    id v20 = self;
  }

  return v20;
}

id __41__STMediaStatusDomainData_initWithCoder___block_invoke(void *a1, uint64_t a2)
{
  id v3 = a1;
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __41__STMediaStatusDomainData_initWithCoder___block_invoke_2;
  v6[3] = &unk_1E6B64820;
  v6[4] = &v7;
  v6[5] = a2;
  [v3 enumerateObjectsUsingBlock:v6];
  if (*((unsigned char *)v8 + 24)) {
    id v4 = 0;
  }
  else {
    id v4 = v3;
  }
  _Block_object_dispose(&v7, 8);

  return v4;
}

uint64_t __41__STMediaStatusDomainData_initWithCoder___block_invoke_2(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t result = objc_opt_isKindOfClass();
  if ((result & 1) == 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

@end