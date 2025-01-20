@interface STStatusItemsBundleRecord
+ (id)recordType;
- (NSSet)statusItemIdentifiers;
- (STStatusItemsBundleRecord)initWithBundleInfoDictionary:(id)a3 bundleRecordIdentifier:(id)a4 bundleURL:(id)a5;
- (id)visualDescriptorForStatusItemWithIdentifier:(id)a3;
@end

@implementation STStatusItemsBundleRecord

+ (id)recordType
{
  return @"StatusItems";
}

- (STStatusItemsBundleRecord)initWithBundleInfoDictionary:(id)a3 bundleRecordIdentifier:(id)a4 bundleURL:(id)a5
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v35.receiver = self;
  v35.super_class = (Class)STStatusItemsBundleRecord;
  v9 = [(STBundleRecord_Base *)&v35 initWithBundleInfoDictionary:v8 bundleRecordIdentifier:a4 bundleURL:a5];
  v10 = v9;
  if (v9)
  {
    v28 = v9;
    v30 = [MEMORY[0x1E4F1CA60] dictionary];
    v29 = [MEMORY[0x1E4F1CA80] set];
    v11 = objc_msgSend(v8, "bs_safeArrayForKey:", @"STStatusItems");
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v31 objects:v38 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v32;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v32 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = *(void **)(*((void *)&v31 + 1) + 8 * v15);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v17 = objc_msgSend(v16, "bs_safeStringForKey:", @"Identifier");
            v18 = objc_msgSend(v16, "bs_safeDictionaryForKey:", @"VisualDescriptor");
            uint64_t v19 = [objc_alloc(MEMORY[0x1E4FA9510]) initWithPlistRepresentation:v18];
            v20 = (void *)v19;
            if (v17) {
              BOOL v21 = v19 == 0;
            }
            else {
              BOOL v21 = 1;
            }
            if (v21)
            {
              v22 = STSystemStatusLogBundleLoading();
              if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138477827;
                v37 = v17;
                _os_log_error_impl(&dword_1D8320000, v22, OS_LOG_TYPE_ERROR, "No valid visual descriptor for status item '%{private}@'", buf, 0xCu);
              }
            }
            else
            {
              [v30 setObject:v19 forKey:v17];
              [v29 addObject:v17];
            }
          }
          ++v15;
        }
        while (v13 != v15);
        uint64_t v13 = [v11 countByEnumeratingWithState:&v31 objects:v38 count:16];
      }
      while (v13);
    }
    uint64_t v23 = [v30 copy];
    v10 = v28;
    statusItemsToVisualDescriptors = v28->_statusItemsToVisualDescriptors;
    v28->_statusItemsToVisualDescriptors = (NSDictionary *)v23;

    uint64_t v25 = [v29 copy];
    statusItemIdentifiers = v28->_statusItemIdentifiers;
    v28->_statusItemIdentifiers = (NSSet *)v25;
  }
  return v10;
}

- (id)visualDescriptorForStatusItemWithIdentifier:(id)a3
{
  return [(NSDictionary *)self->_statusItemsToVisualDescriptors objectForKeyedSubscript:a3];
}

- (NSSet)statusItemIdentifiers
{
  return self->_statusItemIdentifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusItemIdentifiers, 0);
  objc_storeStrong((id *)&self->_statusItemsToVisualDescriptors, 0);
}

@end