@interface STBundleRecord_Base
+ (NSString)recordType;
+ (id)bundleRecordForBundleAtURL:(id)a3;
- (NSString)recordIdentifier;
- (NSURL)recordBundleURL;
- (STBundleRecord_Base)initWithBundleInfoDictionary:(id)a3 bundleRecordIdentifier:(id)a4 bundleURL:(id)a5;
@end

@implementation STBundleRecord_Base

+ (id)bundleRecordForBundleAtURL:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  CFURLRef v4 = (const __CFURL *)a3;
  CFDictionaryRef v5 = CFBundleCopyInfoDictionaryInDirectory(v4);
  CFDictionaryRef v6 = v5;
  if (!v5
    || ([(__CFDictionary *)v5 allKeys],
        v7 = objc_claimAutoreleasedReturnValue(),
        uint64_t v8 = [v7 count],
        v7,
        !v8))
  {
    v9 = STSystemStatusLogBundleLoading();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v14 = 138543362;
      CFURLRef v15 = v4;
      _os_log_error_impl(&dword_1D9514000, v9, OS_LOG_TYPE_ERROR, "Error loading data for bundle at %{public}@", (uint8_t *)&v14, 0xCu);
    }
  }
  v10 = [(__CFDictionary *)v6 bs_safeObjectForKey:*MEMORY[0x1E4F1CFF8] ofType:objc_opt_class()];
  v11 = [(__CFDictionary *)v6 bs_safeObjectForKey:@"STBundleRecordType" ofType:objc_opt_class()];
  if (v10) {
    v12 = (void *)[objc_alloc((Class)a1) initWithBundleInfoDictionary:v6 bundleRecordIdentifier:v10 bundleURL:v4];
  }
  else {
    v12 = 0;
  }

  return v12;
}

- (STBundleRecord_Base)initWithBundleInfoDictionary:(id)a3 bundleRecordIdentifier:(id)a4 bundleURL:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  v15.receiver = self;
  v15.super_class = (Class)STBundleRecord_Base;
  v9 = [(STBundleRecord_Base *)&v15 init];
  if (v9)
  {
    uint64_t v10 = [v7 copy];
    recordIdentifier = v9->_recordIdentifier;
    v9->_recordIdentifier = (NSString *)v10;

    uint64_t v12 = [v8 copy];
    recordBundleURL = v9->_recordBundleURL;
    v9->_recordBundleURL = (NSURL *)v12;
  }
  return v9;
}

+ (NSString)recordType
{
  return 0;
}

- (NSString)recordIdentifier
{
  return self->_recordIdentifier;
}

- (NSURL)recordBundleURL
{
  return self->_recordBundleURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordBundleURL, 0);

  objc_storeStrong((id *)&self->_recordIdentifier, 0);
}

@end