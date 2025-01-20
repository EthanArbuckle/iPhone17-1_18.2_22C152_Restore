@interface STStatusBarDataAdditionsStatusDomainData
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (STDictionaryData)entryDictionaryData;
- (STStatusBarDataActivityEntry)activityEntry;
- (STStatusBarDataAdditionsStatusDomainData)init;
- (STStatusBarDataAdditionsStatusDomainData)initWithCoder:(id)a3;
- (STStatusBarDataAdditionsStatusDomainData)initWithEntryDictionaryData:(id)a3;
- (STStatusBarDataBluetoothEntry)bluetoothEntry;
- (STStatusBarDataBoolEntry)ringerSilenceEntry;
- (STStatusBarDataLockEntry)lockEntry;
- (STStatusBarDataQuietModeEntry)focusModeEntry;
- (STStatusBarDataStringEntry)personNameEntry;
- (STStatusBarDataTetheringEntry)tetheringEntry;
- (STStatusBarDataThermalEntry)thermalEntry;
- (id)_descriptionBuilderWithMultilinePrefix:(uint64_t)a3 forDebug:;
- (id)_expectedClassForKey:(id)a1;
- (id)_initWithEntryDictionaryData:(id *)a1;
- (id)dataByApplyingDiff:(id)a3;
- (id)debugDescriptionWithMultilinePrefix:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)diffFromData:(id)a3;
- (id)initWithData:(void *)a1;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation STStatusBarDataAdditionsStatusDomainData

- (STStatusBarDataAdditionsStatusDomainData)init
{
  v3 = objc_alloc_init(STDictionaryData);
  v4 = [(STStatusBarDataAdditionsStatusDomainData *)self initWithEntryDictionaryData:v3];

  return v4;
}

- (id)initWithData:(void *)a1
{
  id v2 = a1;
  if (a1)
  {
    v3 = [a2 entryDictionaryData];
    id v2 = (id)[v2 initWithEntryDictionaryData:v3];
  }
  return v2;
}

- (STStatusBarDataAdditionsStatusDomainData)initWithEntryDictionaryData:(id)a3
{
  v4 = (void *)[a3 copy];
  v5 = (STStatusBarDataAdditionsStatusDomainData *)-[STStatusBarDataAdditionsStatusDomainData _initWithEntryDictionaryData:]((id *)&self->super.isa, v4);

  return v5;
}

- (id)_initWithEntryDictionaryData:(id *)a1
{
  id v4 = a2;
  if (a1)
  {
    v7.receiver = a1;
    v7.super_class = (Class)STStatusBarDataAdditionsStatusDomainData;
    v5 = (id *)objc_msgSendSuper2(&v7, sel_init);
    a1 = v5;
    if (v5) {
      objc_storeStrong(v5 + 1, a2);
    }
  }

  return a1;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F4F738] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
  v6 = [(STStatusBarDataAdditionsStatusDomainData *)self entryDictionaryData];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __52__STStatusBarDataAdditionsStatusDomainData_isEqual___block_invoke;
  v10[3] = &unk_1E6B63058;
  id v11 = v4;
  id v7 = v4;
  id v8 = (id)[v5 appendObject:v6 counterpart:v10];

  LOBYTE(v6) = [v5 isEqual];
  return (char)v6;
}

uint64_t __52__STStatusBarDataAdditionsStatusDomainData_isEqual___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) entryDictionaryData];
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = [(STStatusBarDataAdditionsStatusDomainData *)self entryDictionaryData];
  id v5 = (id)[v3 appendObject:v4];

  unint64_t v6 = [v3 hash];
  return v6;
}

- (NSString)description
{
  return (NSString *)[(STStatusBarDataAdditionsStatusDomainData *)self descriptionWithMultilinePrefix:0];
}

- (STStatusBarDataStringEntry)personNameEntry
{
  id v2 = [(STStatusBarDataAdditionsStatusDomainData *)self entryDictionaryData];
  v3 = [v2 objectForKey:@"personNameEntry"];

  return (STStatusBarDataStringEntry *)v3;
}

- (STStatusBarDataBluetoothEntry)bluetoothEntry
{
  id v2 = [(STStatusBarDataAdditionsStatusDomainData *)self entryDictionaryData];
  v3 = [v2 objectForKey:@"bluetoothEntry"];

  return (STStatusBarDataBluetoothEntry *)v3;
}

- (STStatusBarDataThermalEntry)thermalEntry
{
  id v2 = [(STStatusBarDataAdditionsStatusDomainData *)self entryDictionaryData];
  v3 = [v2 objectForKey:@"thermalEntry"];

  return (STStatusBarDataThermalEntry *)v3;
}

- (STStatusBarDataActivityEntry)activityEntry
{
  id v2 = [(STStatusBarDataAdditionsStatusDomainData *)self entryDictionaryData];
  v3 = [v2 objectForKey:@"activityEntry"];

  return (STStatusBarDataActivityEntry *)v3;
}

- (STStatusBarDataTetheringEntry)tetheringEntry
{
  id v2 = [(STStatusBarDataAdditionsStatusDomainData *)self entryDictionaryData];
  v3 = [v2 objectForKey:@"tetheringEntry"];

  return (STStatusBarDataTetheringEntry *)v3;
}

- (STStatusBarDataLockEntry)lockEntry
{
  id v2 = [(STStatusBarDataAdditionsStatusDomainData *)self entryDictionaryData];
  v3 = [v2 objectForKey:@"lockEntry"];

  return (STStatusBarDataLockEntry *)v3;
}

- (STStatusBarDataQuietModeEntry)focusModeEntry
{
  id v2 = [(STStatusBarDataAdditionsStatusDomainData *)self entryDictionaryData];
  v3 = [v2 objectForKey:@"focusModeEntry"];

  return (STStatusBarDataQuietModeEntry *)v3;
}

- (STStatusBarDataBoolEntry)ringerSilenceEntry
{
  id v2 = [(STStatusBarDataAdditionsStatusDomainData *)self entryDictionaryData];
  v3 = [v2 objectForKey:@"ringerSilenceEntry"];

  return (STStatusBarDataBoolEntry *)v3;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = +[STMutableStatusBarDataAdditionsStatusDomainData allocWithZone:a3];

  return -[STStatusBarDataAdditionsStatusDomainData initWithData:](v4, self);
}

- (id)succinctDescription
{
  id v2 = [(STStatusBarDataAdditionsStatusDomainData *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(STStatusBarDataAdditionsStatusDomainData *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  v3 = -[STStatusBarDataAdditionsStatusDomainData _descriptionBuilderWithMultilinePrefix:forDebug:](self, a3, 1);
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
    v9[2] = __92__STStatusBarDataAdditionsStatusDomainData__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke;
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
  return -[STStatusBarDataAdditionsStatusDomainData _descriptionBuilderWithMultilinePrefix:forDebug:](self, a3, 0);
}

void __92__STStatusBarDataAdditionsStatusDomainData__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) entryDictionaryData];
  id v2 = (id)[v1 appendObject:v3 withName:0 skipIfNil:1];
}

- (id)diffFromData:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = +[STStatusBarDataAdditionsStatusDomainDataDiff diffFromData:v4 toData:self];
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
      id v5 = (void *)[(STStatusBarDataAdditionsStatusDomainData *)self copy];
    }
    else
    {
      id v5 = (void *)[(STStatusBarDataAdditionsStatusDomainData *)self mutableCopy];
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
  id v5 = [(STStatusBarDataAdditionsStatusDomainData *)self entryDictionaryData];
  [v4 encodeObject:v5 forKey:@"entryDictionaryData"];
}

- (id)_expectedClassForKey:(id)a1
{
  id v3 = a2;
  if (a1)
  {
    if (_MergedGlobals_8 != -1) {
      dispatch_once(&_MergedGlobals_8, &__block_literal_global_9);
    }
    id v4 = (void *)[(id)qword_1EB5A3568 objectForKeyedSubscript:v3];
    if (!v4) {
      id v4 = objc_opt_class();
    }
    a1 = v4;
  }

  return a1;
}

void __65__STStatusBarDataAdditionsStatusDomainData__expectedClassForKey___block_invoke()
{
  v3[8] = *MEMORY[0x1E4F143B8];
  v2[0] = @"activityEntry";
  v3[0] = objc_opt_class();
  v2[1] = @"bluetoothEntry";
  v3[1] = objc_opt_class();
  v2[2] = @"focusModeEntry";
  v3[2] = objc_opt_class();
  v2[3] = @"lockEntry";
  v3[3] = objc_opt_class();
  v2[4] = @"personNameEntry";
  v3[4] = objc_opt_class();
  v2[5] = @"tetheringEntry";
  v3[5] = objc_opt_class();
  v2[6] = @"thermalEntry";
  v3[6] = objc_opt_class();
  v2[7] = @"ringerSilenceEntry";
  v3[7] = objc_opt_class();
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:8];
  v1 = (void *)qword_1EB5A3568;
  qword_1EB5A3568 = v0;
}

- (STStatusBarDataAdditionsStatusDomainData)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"entryDictionaryData"];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __58__STStatusBarDataAdditionsStatusDomainData_initWithCoder___block_invoke;
  v11[3] = &unk_1E6B63AB0;
  unint64_t v6 = self;
  v12 = v6;
  id v7 = (void (**)(void, void))MEMORY[0x1E01644A0](v11);
  id v8 = ((void (**)(void, void *))v7)[2](v7, v5);

  if (v8)
  {
    unint64_t v6 = [(STStatusBarDataAdditionsStatusDomainData *)v6 initWithEntryDictionaryData:v8];
    v9 = v6;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

id __58__STStatusBarDataAdditionsStatusDomainData_initWithCoder___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __58__STStatusBarDataAdditionsStatusDomainData_initWithCoder___block_invoke_2;
  v6[3] = &unk_1E6B63A88;
  id v7 = *(id *)(a1 + 32);
  id v8 = &v9;
  [v3 enumerateKeysAndObjectsUsingBlock:v6];
  if (*((unsigned char *)v10 + 24)) {
    id v4 = 0;
  }
  else {
    id v4 = v3;
  }

  _Block_object_dispose(&v9, 8);

  return v4;
}

void __58__STStatusBarDataAdditionsStatusDomainData_initWithCoder___block_invoke_2(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v8 = a3;
  id v7 = -[STStatusBarDataAdditionsStatusDomainData _expectedClassForKey:](*(id *)(a1 + 32), a2);
  if (!a2 || ([v7 isEqual:objc_opt_class()] & 1) != 0 || (objc_opt_isKindOfClass() & 1) == 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
}

- (STDictionaryData)entryDictionaryData
{
  return self->_entryDictionaryData;
}

- (void).cxx_destruct
{
}

@end