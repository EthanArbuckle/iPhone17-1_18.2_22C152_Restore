@interface STBackgroundActivitiesBundleRecord
+ (id)recordType;
- (NSSet)backgroundActivityIdentifiers;
- (STBackgroundActivitiesBundleRecord)initWithBundleInfoDictionary:(id)a3 bundleRecordIdentifier:(id)a4 bundleURL:(id)a5;
- (id)visualDescriptorForBackgroundActivityWithIdentifier:(id)a3;
@end

@implementation STBackgroundActivitiesBundleRecord

+ (id)recordType
{
  return @"BackgroundActivities";
}

- (STBackgroundActivitiesBundleRecord)initWithBundleInfoDictionary:(id)a3 bundleRecordIdentifier:(id)a4 bundleURL:(id)a5
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v35.receiver = self;
  v35.super_class = (Class)STBackgroundActivitiesBundleRecord;
  v9 = [(STBundleRecord_Base *)&v35 initWithBundleInfoDictionary:v8 bundleRecordIdentifier:a4 bundleURL:a5];
  v10 = v9;
  if (v9)
  {
    v28 = v9;
    v30 = [MEMORY[0x1E4F1CA60] dictionary];
    v29 = [MEMORY[0x1E4F1CA80] set];
    v11 = objc_msgSend(v8, "bs_safeArrayForKey:", @"STBackgroundActivities");
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
            v19 = [[STBackgroundActivityVisualDescriptor alloc] initWithPlistRepresentation:v18];
            v20 = v19;
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
                _os_log_error_impl(&dword_1D9514000, v22, OS_LOG_TYPE_ERROR, "No valid visual descriptor for background activity '%{private}@'", buf, 0xCu);
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
    backgroundActivitiesToVisualDescriptors = v28->_backgroundActivitiesToVisualDescriptors;
    v28->_backgroundActivitiesToVisualDescriptors = (NSDictionary *)v23;

    uint64_t v25 = [v29 copy];
    backgroundActivityIdentifiers = v28->_backgroundActivityIdentifiers;
    v28->_backgroundActivityIdentifiers = (NSSet *)v25;
  }
  return v10;
}

- (id)visualDescriptorForBackgroundActivityWithIdentifier:(id)a3
{
  return [(NSDictionary *)self->_backgroundActivitiesToVisualDescriptors objectForKeyedSubscript:a3];
}

- (NSSet)backgroundActivityIdentifiers
{
  return self->_backgroundActivityIdentifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundActivityIdentifiers, 0);

  objc_storeStrong((id *)&self->_backgroundActivitiesToVisualDescriptors, 0);
}

@end