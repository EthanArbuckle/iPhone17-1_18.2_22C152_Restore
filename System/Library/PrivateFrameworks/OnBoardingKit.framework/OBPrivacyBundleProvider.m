@interface OBPrivacyBundleProvider
- (NSString)enclosingBundleIdentifier;
- (NSString)path;
- (NSString)privacyBundleName;
- (OBPrivacyBundleProvider)initWithEnclosingBundleIdentifier:(id)a3 privacyBundleName:(id)a4;
- (id)_bundleRecordWithError:(id *)a3;
- (void)path;
- (void)setEnclosingBundleIdentifier:(id)a3;
- (void)setPrivacyBundleName:(id)a3;
@end

@implementation OBPrivacyBundleProvider

- (OBPrivacyBundleProvider)initWithEnclosingBundleIdentifier:(id)a3 privacyBundleName:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)OBPrivacyBundleProvider;
  v9 = [(OBPrivacyBundleProvider *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_enclosingBundleIdentifier, a3);
    objc_storeStrong((id *)&v10->_privacyBundleName, a4);
  }

  return v10;
}

- (NSString)path
{
  id v15 = 0;
  v3 = [(OBPrivacyBundleProvider *)self _bundleRecordWithError:&v15];
  id v4 = v15;
  v5 = v4;
  if (!v3 || v4)
  {
    id v8 = _OBLoggingFacility();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      [(OBPrivacyBundleProvider *)self path];
    }
    v13 = 0;
  }
  else
  {
    v6 = (void *)MEMORY[0x1E4F28B50];
    id v7 = [v3 URL];
    id v8 = [v6 bundleWithURL:v7];

    if (v8)
    {
      v9 = [(OBPrivacyBundleProvider *)self privacyBundleName];
      v10 = [v9 stringByDeletingPathExtension];
      v11 = [(OBPrivacyBundleProvider *)self privacyBundleName];
      objc_super v12 = [v11 pathExtension];
      v13 = [v8 pathForResource:v10 ofType:v12 inDirectory:0 forLocalization:0];
    }
    else
    {
      v9 = _OBLoggingFacility();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        [(OBPrivacyBundleProvider *)self path];
      }
      v13 = 0;
    }
  }
  return (NSString *)v13;
}

- (id)_bundleRecordWithError:(id *)a3
{
  id v4 = (void *)MEMORY[0x1E4F223F8];
  v5 = [(OBPrivacyBundleProvider *)self enclosingBundleIdentifier];
  v6 = [v4 bundleRecordWithBundleIdentifier:v5 allowPlaceholder:0 error:a3];

  return v6;
}

- (NSString)enclosingBundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setEnclosingBundleIdentifier:(id)a3
{
}

- (NSString)privacyBundleName
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setPrivacyBundleName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privacyBundleName, 0);
  objc_storeStrong((id *)&self->_enclosingBundleIdentifier, 0);
}

- (void)path
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3 = [a1 enclosingBundleIdentifier];
  int v4 = 138543362;
  v5 = v3;
  _os_log_error_impl(&dword_19BF0F000, a2, OS_LOG_TYPE_ERROR, "Failed to create bundle for %{public}@", (uint8_t *)&v4, 0xCu);
}

@end