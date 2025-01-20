@interface NTKEditModeConfiguration
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NTKEditModeConfiguration)initWithCoder:(id)a3;
- (NTKEditModeConfiguration)initWithJSONObjectRepresentation:(id)a3 device:(id)a4 editOptionFactory:(id)a5;
- (NTKEditModeConfiguration)initWithJSONObjectRepresentation:(id)a3 editOptionClass:(Class)a4 forDevice:(id)a5;
- (id)JSONObjectRepresentation;
- (id)JSONObjectRepresentationForFace:(id)a3;
- (id)_alphabeticalSlots;
- (id)dailySnapshotKey;
- (id)description;
- (id)editOptionForSlot:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)enumerateSlotsWithBlock:(id)a3;
- (void)setEditOption:(id)a3 forSlot:(id)a4;
@end

@implementation NTKEditModeConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nilSlotOption, 0);
  objc_storeStrong((id *)&self->_optionsBySlot, 0);
}

- (void)enumerateSlotsWithBlock:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v4 = (void (**)(id, void, char *))a3;
  char v16 = 0;
  v5 = self;
  objc_sync_enter(v5);
  v6 = (void *)[(NSMutableDictionary *)v5->_optionsBySlot copy];
  v7 = v6;
  if (v6)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    v8 = objc_msgSend(v6, "allKeys", 0);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v12 objects:v17 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v13;
LABEL_4:
      uint64_t v11 = 0;
      while (1)
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v8);
        }
        v4[2](v4, *(void *)(*((void *)&v12 + 1) + 8 * v11), &v16);
        if (v16) {
          break;
        }
        if (v9 == ++v11)
        {
          uint64_t v9 = [v8 countByEnumeratingWithState:&v12 objects:v17 count:16];
          if (v9) {
            goto LABEL_4;
          }
          break;
        }
      }
    }
  }
  else
  {
    v4[2](v4, 0, &v16);
  }

  objc_sync_exit(v5);
}

- (void)setEditOption:(id)a3 forSlot:(id)a4
{
  id v15 = a3;
  id v7 = a4;
  v8 = self;
  objc_sync_enter(v8);
  nilSlotOption = v8->_nilSlotOption;
  if (!v7)
  {
    optionsBySlot = v8->_optionsBySlot;
    if (!optionsBySlot) {
      goto LABEL_10;
    }
    goto LABEL_5;
  }
  if (nilSlotOption)
  {
    optionsBySlot = v8->_optionsBySlot;
LABEL_5:
    uint64_t v11 = [NSString stringWithFormat:@"_nilSlotOption = %@, _optionsBySlot = %@, requested slot = %@", nilSlotOption, optionsBySlot, v7];
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8], @"Cannot have nil and non-nil custom edit mode slots for same edit mode. (%@)", v11 format];

    if (v7) {
      goto LABEL_6;
    }
LABEL_10:
    objc_storeStrong((id *)&v8->_nilSlotOption, a3);
    goto LABEL_12;
  }
LABEL_6:
  if (!v8->_optionsBySlot)
  {
    long long v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v13 = v8->_optionsBySlot;
    v8->_optionsBySlot = v12;
  }
  long long v14 = v8->_optionsBySlot;
  if (v15) {
    [(NSMutableDictionary *)v14 setObject:v15 forKey:v7];
  }
  else {
    [(NSMutableDictionary *)v14 removeObjectForKey:v7];
  }
LABEL_12:
  objc_sync_exit(v8);
}

- (id)editOptionForSlot:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  if (v4)
  {
    v6 = [(NSMutableDictionary *)v5->_optionsBySlot objectForKey:v4];
  }
  else
  {
    v6 = v5->_nilSlotOption;
  }
  id v7 = v6;
  objc_sync_exit(v5);

  return v7;
}

- (id)dailySnapshotKey
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)[(NSMutableDictionary *)v2->_optionsBySlot copy];
  v17 = [(NTKEditModeConfiguration *)v2 _alphabeticalSlots];
  objc_sync_exit(v2);

  if (v3)
  {
    id v4 = [MEMORY[0x1E4F28E78] string];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id obj = v17;
    uint64_t v5 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v20 != v6) {
            objc_enumerationMutation(obj);
          }
          v8 = [v3 objectForKey:*(void *)(*((void *)&v19 + 1) + 8 * i)];
          uint64_t v9 = [v8 dailySnapshotKey];
          uint64_t v10 = (void *)v9;
          if (v9) {
            uint64_t v11 = (__CFString *)v9;
          }
          else {
            uint64_t v11 = &stru_1F1635E90;
          }
          long long v12 = v11;

          [(__CFString *)v4 appendFormat:@"(%@)", v12];
        }
        uint64_t v5 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v5);
    }
  }
  else
  {
    uint64_t v13 = [(NTKEditOption *)v2->_nilSlotOption dailySnapshotKey];
    long long v14 = (void *)v13;
    id v15 = &stru_1F1635E90;
    if (v13) {
      id v15 = (__CFString *)v13;
    }
    id v4 = v15;
  }
  return v4;
}

- (id)description
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)[(NSMutableDictionary *)v2->_optionsBySlot copy];
  id v4 = [(NTKEditModeConfiguration *)v2 _alphabeticalSlots];
  objc_sync_exit(v2);

  if (v3)
  {
    uint64_t v5 = objc_msgSend(MEMORY[0x1E4F28E78], "stringWithString:", @"(");
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v6);
          }
          uint64_t v10 = objc_msgSend(v3, "objectForKey:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
          uint64_t v11 = [v10 description];

          if (v11)
          {
            if ((unint64_t)[v5 length] >= 2) {
              [v5 appendString:@", "];
            }
            [v5 appendString:v11];
          }
        }
        uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v7);
    }

    [v5 appendString:@""]);
  }
  else
  {
    uint64_t v5 = [(NTKEditOption *)v2->_nilSlotOption description];
  }

  return v5;
}

- (id)_alphabeticalSlots
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = [(NSMutableDictionary *)v2->_optionsBySlot allKeys];
  id v4 = [v3 sortedArrayUsingSelector:sel_compare_];

  objc_sync_exit(v2);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  optionsBySlot = v4->_optionsBySlot;
  if (optionsBySlot) {
    [v6 encodeObject:optionsBySlot forKey:@"optionsBySlot"];
  }
  else {
    [v6 encodeObject:v4->_nilSlotOption forKey:@"nilSlotOption"];
  }
  objc_sync_exit(v4);
}

- (NTKEditModeConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NTKEditModeConfiguration *)self init];
  if (v5)
  {
    id v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"optionsBySlot"];
    if (v10)
    {
      uint64_t v11 = objc_opt_class();
      uint64_t v12 = objc_opt_class();
      NTKValidateDictionary(v10, v11, v12);
      if (![v10 count]) {
        [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F28498] format:@"_EditModeConfiguration archive contains empty options-by-slot dictionary. Dictionary should be nil or non-empty."];
      }
      uint64_t v13 = [v10 mutableCopy];
      optionsBySlot = v5->_optionsBySlot;
      v5->_optionsBySlot = (NSMutableDictionary *)v13;
    }
    else
    {
      uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"nilSlotOption"];
      optionsBySlot = v5->_nilSlotOption;
      v5->_nilSlotOption = (NTKEditOption *)v15;
    }
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (void **)a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && NTKEqualObjects(self->_optionsBySlot, v4[1]))
  {
    char v5 = NTKEqualObjects(self->_nilSlotOption, v4[2]);
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSMutableDictionary *)self->_optionsBySlot hash];
  return [(NTKEditOption *)self->_nilSlotOption hash] + v3;
}

- (id)JSONObjectRepresentation
{
  return [(NTKEditModeConfiguration *)self JSONObjectRepresentationForFace:0];
}

- (id)JSONObjectRepresentationForFace:(id)a3
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = self;
  objc_sync_enter(v5);
  id v6 = (void *)[(NSMutableDictionary *)v5->_optionsBySlot copy];
  objc_sync_exit(v5);

  if (v6)
  {
    uint64_t v7 = objc_opt_new();
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __60__NTKEditModeConfiguration_JSONObjectRepresentationForFace___block_invoke;
    v11[3] = &unk_1E62C6AD0;
    id v12 = v7;
    id v13 = v4;
    id v8 = v7;
    [v6 enumerateKeysAndObjectsUsingBlock:v11];
    long long v14 = @"slots";
    v15[0] = v8;
    uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
  }
  else
  {
    uint64_t v9 = [(NTKEditOption *)v5->_nilSlotOption JSONObjectRepresentationForFace:v4];
  }

  return v9;
}

void __60__NTKEditModeConfiguration_JSONObjectRepresentationForFace___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = a2;
  id v7 = [a3 JSONObjectRepresentationForFace:v5];
  [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:v6];
}

- (NTKEditModeConfiguration)initWithJSONObjectRepresentation:(id)a3 editOptionClass:(Class)a4 forDevice:(id)a5
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __87__NTKEditModeConfiguration_initWithJSONObjectRepresentation_editOptionClass_forDevice___block_invoke;
  v6[3] = &__block_descriptor_40_e47___NTKEditOption_24__0__NSString_8__CLKDevice_16lu32l8;
  v6[4] = a4;
  return [(NTKEditModeConfiguration *)self initWithJSONObjectRepresentation:a3 device:a5 editOptionFactory:v6];
}

id __87__NTKEditModeConfiguration_initWithJSONObjectRepresentation_editOptionClass_forDevice___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = *(objc_class **)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id v7 = (void *)[[v4 alloc] initWithJSONObjectRepresentation:v6 forDevice:v5];

  return v7;
}

- (NTKEditModeConfiguration)initWithJSONObjectRepresentation:(id)a3 device:(id)a4 editOptionFactory:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)NTKEditModeConfiguration;
  uint64_t v11 = [(NTKEditModeConfiguration *)&v20 init];
  if (v11)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && ([v8 objectForKeyedSubscript:@"slots"], (uint64_t v12 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      nilSlotOption = (void *)v12;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"value for '%@' must be a dictionary - invalid value: %@", @"slots", nilSlotOption format];
      }
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __86__NTKEditModeConfiguration_initWithJSONObjectRepresentation_device_editOptionFactory___block_invoke;
      v16[3] = &unk_1E62C8B18;
      id v19 = v10;
      id v17 = v9;
      uint64_t v18 = v11;
      [nilSlotOption enumerateKeysAndObjectsUsingBlock:v16];
    }
    else
    {
      uint64_t v14 = (*((void (**)(id, id, id))v10 + 2))(v10, v8, v9);
      nilSlotOption = v11->_nilSlotOption;
      v11->_nilSlotOption = (NTKEditOption *)v14;
    }
  }
  return v11;
}

void __86__NTKEditModeConfiguration_initWithJSONObjectRepresentation_device_editOptionFactory___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"key in '%@' dictionary must be a string - invalid value: %@", @"slots", v7 format];
  }
  id v6 = (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  [*(id *)(a1 + 40) setEditOption:v6 forSlot:v7];
}

@end