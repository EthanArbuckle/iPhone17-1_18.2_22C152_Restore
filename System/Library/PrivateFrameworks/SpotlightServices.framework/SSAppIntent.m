@interface SSAppIntent
+ (id)sharedInstance;
- (BOOL)filterEvent:(id)a3;
- (SSAppIntent)init;
- (id)_attributesUpdatesForEvent:(id)a3;
- (id)_extractIdentifiersForIndex:(id)a3 interaction:(id)a4;
- (id)_getInteraction:(id)a3;
- (id)_itemUpdatesForEvent:(id)a3 itemIdentifiers:(id)a4 bundleToUpdate:(id)a5;
- (id)consumerLabel;
- (id)stream;
- (void)handleEvent:(id)a3;
@end

@implementation SSAppIntent

- (void)handleEvent:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    uint64_t v6 = [v5 bundleID];
    if (!v6) {
      goto LABEL_21;
    }
    v7 = (void *)v6;
    v8 = [v5 bundleID];
    uint64_t v9 = [v8 length];

    if (!v9 || [(SSAppIntent *)self filterEvent:v5]) {
      goto LABEL_21;
    }
    v10 = [(SSAppIntent *)self _getInteraction:v5];
    v11 = [v10 intent];
    v12 = [(SSAppIntent *)self _extractIdentifiersForIndex:v5 interaction:v10];
    v13 = [v5 bundleID];
    v14 = SSRedactString(v13, 1);

    if (v14)
    {
      v15 = SSGeneralLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v16 = [(SSBaseConsumer *)self identifier];
        int v21 = 138412802;
        v22 = v16;
        __int16 v23 = 2112;
        v24 = v14;
        __int16 v25 = 2112;
        uint64_t v26 = objc_opt_class();
        _os_log_impl(&dword_1BDB2A000, v15, OS_LOG_TYPE_DEFAULT, "%@: processing event for bundle %@ with intent: %@", (uint8_t *)&v21, 0x20u);
      }
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v17 = SSShortcutsBundleIdentifier;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v19 = 0;
LABEL_20:

LABEL_21:
          goto LABEL_22;
        }
      }
      v17 = SSContactsBundleIdentifier;
    }
    v18 = *v17;
    v19 = v18;
    if (v18 && [(__CFString *)v18 length])
    {
      v20 = [(SSAppIntent *)self _itemUpdatesForEvent:v5 itemIdentifiers:v12 bundleToUpdate:v19];
      if ([v20 count]) {
        [(SSBaseConsumer *)self indexItems:v20 protectionClass:@"Priority" bundleID:v19];
      }
    }
    goto LABEL_20;
  }
LABEL_22:
}

- (BOOL)filterEvent:(id)a3
{
  v3 = [a3 intentClass];
  id v4 = [(id)objc_opt_class() description];
  if ([v3 isEqualToString:v4])
  {
    char v5 = 1;
  }
  else
  {
    uint64_t v6 = [(id)objc_opt_class() description];
    if ([v3 isEqualToString:v6])
    {
      char v5 = 1;
    }
    else
    {
      v7 = [(id)objc_opt_class() description];
      char v5 = [v3 isEqualToString:v7];
    }
  }

  return v5 ^ 1;
}

- (id)consumerLabel
{
  if (consumerLabel_onceToken_2 != -1) {
    dispatch_once(&consumerLabel_onceToken_2, &__block_literal_global_30);
  }
  v2 = (void *)consumerLabel_label_2;
  return v2;
}

void __28__SSAppIntent_consumerLabel__block_invoke()
{
  v0 = (void *)consumerLabel_label_2;
  consumerLabel_label_2 = @"SSAppIntent";
}

- (id)stream
{
  v2 = BiomeLibrary();
  v3 = [v2 App];
  id v4 = [v3 Intent];

  return v4;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_5 != -1) {
    dispatch_once(&sharedInstance_onceToken_5, &__block_literal_global_81_2);
  }
  v2 = (void *)sharedInstance_sharedInstance_2;
  return v2;
}

uint64_t __29__SSAppIntent_sharedInstance__block_invoke()
{
  sharedInstance_sharedInstance_2 = objc_alloc_init(SSAppIntent);
  return MEMORY[0x1F41817F8]();
}

- (SSAppIntent)init
{
  v6.receiver = self;
  v6.super_class = (Class)SSAppIntent;
  v2 = [(SSBaseConsumer *)&v6 init];
  v3 = v2;
  if (v2) {
    id v4 = v2;
  }

  return v3;
}

- (id)_attributesUpdatesForEvent:(id)a3
{
  v10[2] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 absoluteTimestamp];

  if (v4)
  {
    v9[0] = @"_kMDItemLastOutOfSpotlightEngagementDate";
    char v5 = [v3 absoluteTimestamp];
    v10[0] = v5;
    v9[1] = *MEMORY[0x1E4F230F0];
    objc_super v6 = [v3 absoluteTimestamp];
    v10[1] = v6;
    v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];
  }
  else
  {
    v7 = (void *)MEMORY[0x1E4F1CC08];
  }

  return v7;
}

- (id)_itemUpdatesForEvent:(id)a3 itemIdentifiers:(id)a4 bundleToUpdate:(id)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v22 = [MEMORY[0x1E4F1CA48] array];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v11 = v9;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v24 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v23 + 1) + 8 * i);
        v17 = [(SSAppIntent *)self _attributesUpdatesForEvent:v8];
        v18 = v17;
        if (v17 && [v17 count])
        {
          id v19 = objc_alloc_init(MEMORY[0x1E4F23840]);
          [v19 setUniqueIdentifier:v16];
          [v19 setBundleID:v10];
          [v19 setIsUpdate:1];
          v20 = (void *)[objc_alloc(MEMORY[0x1E4F23850]) initWithAttributes:v18];
          [v19 setAttributeSet:v20];

          [v22 addObject:v19];
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v13);
  }

  return v22;
}

- (id)_getInteraction:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F28DC0];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  v7 = [v5 interaction];

  id v13 = 0;
  id v8 = [v4 unarchivedObjectOfClass:v6 fromData:v7 error:&v13];
  id v9 = v13;

  if (v8)
  {
    id v10 = v8;
  }
  else if (v9)
  {
    id v11 = SSGeneralLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      [(SSAppIntent *)self _getInteraction:v11];
    }
  }
  return v8;
}

- (id)_extractIdentifiersForIndex:(id)a3 interaction:(id)a4
{
  v42[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = [MEMORY[0x1E4F1CA48] array];
  id v8 = [v6 intent];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = [v5 groupIdentifier];
    uint64_t v10 = [v9 length];

    if (!v10) {
      goto LABEL_31;
    }
    id v11 = [v5 groupIdentifier];
    [v7 addObject:v11];
    goto LABEL_4;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v12 = v8;
    v31 = v12;
    if ([v6 direction] == 2)
    {
      id v13 = [v12 sender];

      if (v13)
      {
        uint64_t v14 = [v12 sender];
        v42[0] = v14;
        id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:1];
      }
    }
    else
    {
      id v13 = [v12 recipients];
    }
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v22 = v13;
    uint64_t v23 = [v22 countByEnumeratingWithState:&v36 objects:v41 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v37;
      do
      {
        for (uint64_t i = 0; i != v24; ++i)
        {
          if (*(void *)v37 != v25) {
            objc_enumerationMutation(v22);
          }
          uint64_t v27 = *(void **)(*((void *)&v36 + 1) + 8 * i);
          uint64_t v28 = [v27 contactIdentifier];

          if (v28)
          {
            v29 = [v27 contactIdentifier];
            [v7 addObject:v29];
          }
        }
        uint64_t v24 = [v22 countByEnumeratingWithState:&v36 objects:v41 count:16];
      }
      while (v24);
    }
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v34 = 0u;
      long long v35 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      id v11 = [v8 contacts];
      uint64_t v15 = [v11 countByEnumeratingWithState:&v32 objects:v40 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v33;
        do
        {
          for (uint64_t j = 0; j != v16; ++j)
          {
            if (*(void *)v33 != v17) {
              objc_enumerationMutation(v11);
            }
            id v19 = *(void **)(*((void *)&v32 + 1) + 8 * j);
            v20 = [v19 contactIdentifier];

            if (v20)
            {
              int v21 = [v19 contactIdentifier];
              [v7 addObject:v21];
            }
          }
          uint64_t v16 = [v11 countByEnumeratingWithState:&v32 objects:v40 count:16];
        }
        while (v16);
      }
LABEL_4:
    }
  }
LABEL_31:

  return v7;
}

- (void)_getInteraction:(NSObject *)a3 .cold.1(void *a1, void *a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = [a1 identifier];
  id v6 = [a2 localizedDescription];
  int v7 = 138412546;
  id v8 = v5;
  __int16 v9 = 2112;
  uint64_t v10 = v6;
  _os_log_error_impl(&dword_1BDB2A000, a3, OS_LOG_TYPE_ERROR, "%@ : Error decoding interaction data: %@", (uint8_t *)&v7, 0x16u);
}

@end