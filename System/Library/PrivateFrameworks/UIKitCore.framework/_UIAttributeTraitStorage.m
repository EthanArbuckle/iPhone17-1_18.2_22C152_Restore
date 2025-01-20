@interface _UIAttributeTraitStorage
- (_UIAttributeTraitStorage)initWithObject:(id)a3 keyPath:(id)a4;
- (void)addRecordWithTraitCollection:(id)a3 value:(id)a4;
- (void)applyRecordsMatchingTraitCollection:(id)a3;
@end

@implementation _UIAttributeTraitStorage

- (_UIAttributeTraitStorage)initWithObject:(id)a3 keyPath:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)_UIAttributeTraitStorage;
  return [(_UITraitStorage *)&v5 initWithObject:a3 keyPath:a4];
}

- (void)addRecordWithTraitCollection:(id)a3 value:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a3;
  v9 = -[UITraitCollection _traitCollectionWithNonDefaultValuesForTraitsThatCannotRepresentUnspecified]((uint64_t)v8);
  if (v9)
  {
    _UIIsPrivateMainBundle();
    if (dyld_program_sdk_at_least())
    {
      v11 = [MEMORY[0x1E4F28B00] currentHandler];
      v12 = [v9 _traitsDescription];
      [v11 handleFailureInMethod:a2, self, @"_UITraitStorage.m", 310, @"Invalid trait collection for trait storage, as it contains non-default values for the following traits that cannot represent unspecified values: %@", v12 object file lineNumber description];

      goto LABEL_2;
    }
    if (os_variant_has_internal_diagnostics())
    {
      v14 = __UIFaultDebugAssertLog();
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
        goto LABEL_9;
      }
      v15 = [v9 _traitsDescription];
      *(_DWORD *)buf = 138412290;
      v17 = v15;
      _os_log_fault_impl(&dword_1853B0000, v14, OS_LOG_TYPE_FAULT, "Invalid trait collection for trait storage, as it contains non-default values for the following traits that cannot represent unspecified values: %@  This will become an assert in a future version.", buf, 0xCu);
    }
    else
    {
      v13 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &addRecordWithTraitCollection_value____s_category) + 8);
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        goto LABEL_2;
      }
      v14 = v13;
      v15 = [v9 _traitsDescription];
      *(_DWORD *)buf = 138412290;
      v17 = v15;
      _os_log_impl(&dword_1853B0000, v14, OS_LOG_TYPE_ERROR, "Invalid trait collection for trait storage, as it contains non-default values for the following traits that cannot represent unspecified values: %@  This will become an assert in a future version.", buf, 0xCu);
    }

LABEL_9:
  }
LABEL_2:
  v10 = [[_UIAttributeTraitStorageRecord alloc] initWithTraitCollection:v8 value:v7];

  [(_UITraitStorage *)self addRecord:v10];
}

- (void)applyRecordsMatchingTraitCollection:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  objc_super v5 = [(_UITraitStorage *)self records];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v11 = [v10 traitCollection];
        v12 = (void *)v11;
        if (!v4 || v11)
        {
          BOOL v13 = -[UITraitCollection _containsTraitsInCollectionConsideringTraitsThatCanRepresentUnspecifiedOnly:]((uint64_t)v4, v11);

          if (!v13) {
            continue;
          }
        }
        v14 = [v10 value];
        if (objc_msgSend(v14, "_uikit_variesByTraitCollections"))
        {
          do
          {
            v15 = objc_msgSend(v14, "_uikit_valueForTraitCollection:", v4);

            if (v15 == v14) {
              break;
            }
            v14 = v15;
          }
          while ((objc_msgSend(v15, "_uikit_variesByTraitCollections") & 1) != 0);
        }
        v16 = [(_UITraitStorage *)self object];
        v17 = [(_UITraitStorage *)self keyPath];
        objc_msgSend(v16, "_uikit_applyValueFromTraitStorage:forKeyPath:", v14, v17);

        goto LABEL_16;
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_16:
}

@end