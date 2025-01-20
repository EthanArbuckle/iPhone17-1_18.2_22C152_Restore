@interface SNLPSSUApplicationInfo
+ (id)applicationInfoWithBundleIdentifier:(id)a3 assetURL:(id)a4 forLocale:(id)a5 error:(id *)a6;
- (NSString)bundleIdentifier;
- (NSString)locale;
- (NSURL)assetURL;
- (SNLPSSUApplicationInfo)initWithBundleIdentifier:(id)a3 assetURL:(id)a4 forLocale:(id)a5;
- (id)description;
@end

@implementation SNLPSSUApplicationInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_assetURL, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

- (NSString)locale
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSURL)assetURL
{
  return (NSURL *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)bundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (SNLPSSUApplicationInfo)initWithBundleIdentifier:(id)a3 assetURL:(id)a4 forLocale:(id)a5
{
  v8 = (NSURL *)a4;
  v9 = (NSString *)a5;
  v18.receiver = self;
  v18.super_class = (Class)SNLPSSUApplicationInfo;
  id v10 = a3;
  v11 = [(SNLPSSUApplicationInfo *)&v18 init];
  uint64_t v12 = objc_msgSend(v10, "copy", v18.receiver, v18.super_class);

  bundleIdentifier = v11->_bundleIdentifier;
  v11->_bundleIdentifier = (NSString *)v12;

  assetURL = v11->_assetURL;
  v11->_assetURL = v8;
  v15 = v8;

  locale = v11->_locale;
  v11->_locale = v9;

  return v11;
}

- (id)description
{
  v2 = NSString;
  bundleIdentifier = self->_bundleIdentifier;
  v4 = [(NSURL *)self->_assetURL path];
  v5 = [v2 stringWithFormat:@"[SNLPSSUApplicationInfo bundleIdentifier='%@' assetURL='%@']", bundleIdentifier, v4];

  return v5;
}

+ (id)applicationInfoWithBundleIdentifier:(id)a3 assetURL:(id)a4 forLocale:(id)a5 error:(id *)a6
{
  v16[2] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if ([v10 isFileURL])
  {
    a6 = [[SNLPSSUApplicationInfo alloc] initWithBundleIdentifier:v9 assetURL:v10 forLocale:v11];
  }
  else if (a6)
  {
    uint64_t v12 = [NSString stringWithFormat:@"The given asset directory is not a file URL: %@.", v10, *MEMORY[0x1E4F28568], *MEMORY[0x1E4F28588], @"Could not build an SNLPSSUApplicationInfo object"];
    v16[1] = v12;
    v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:2];

    *a6 = [MEMORY[0x1E4F28C58] errorWithDomain:@"SNLPSSUErrorDomain" code:1 userInfo:v13];

    a6 = 0;
  }

  return a6;
}

@end