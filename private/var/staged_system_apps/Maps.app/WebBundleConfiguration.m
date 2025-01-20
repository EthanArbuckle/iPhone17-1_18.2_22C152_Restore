@interface WebBundleConfiguration
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)temporarilyUseOnDeviceDirectory;
- (NSString)manifestKey;
- (NSString)manifestSignedResourceName;
- (NSString)messageHandlerName;
- (NSString)onDeviceDirectory;
- (NSString)onDeviceDirectoryWritable;
- (NSString)rootDirectory;
- (NSString)urlScheme;
- (NSURL)absoluteBuiltInWebBundleDirectory;
- (NSURL)absoluteCachedWebBundleDirectory;
- (NSURL)debugOverrideServerURL;
- (NSURL)entryPointUrl;
- (NSURL)entryPointUrlBase;
- (NSURL)serverURL;
- (NSURL)webBundleDirectory;
- (WebBundleConfiguration)initWithCoder:(id)a3;
- (id)_webBundleConfigurationStorageDirectory;
- (id)copyWithZone:(_NSZone *)a3;
- (id)directoryForNewWebBundleName:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setTemporarilyUseOnDeviceDirectory:(BOOL)a3;
- (void)setWebBundleDirectory:(id)a3;
@end

@implementation WebBundleConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webBundleDirectory, 0);
  objc_storeStrong((id *)&self->_onDeviceDirectoryWritable, 0);

  objc_storeStrong((id *)&self->_onDeviceDirectory, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = [(WebBundleConfiguration *)self webBundleDirectory];
  [v4 setWebBundleDirectory:v5];

  return v4;
}

- (NSURL)absoluteBuiltInWebBundleDirectory
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 pathForResource:@"index" ofType:@"html" inDirectory:@"OnDeviceWebBundle"];

  id v4 = [v3 stringByDeletingLastPathComponent];

  v5 = +[NSURL fileURLWithPath:v4];

  return (NSURL *)v5;
}

- (WebBundleConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)WebBundleConfiguration;
  v5 = [(WebBundleConfiguration *)&v8 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WebBundleConfigurationDirectory"];
    [(WebBundleConfiguration *)v5 setWebBundleDirectory:v6];
  }
  return v5;
}

- (NSURL)webBundleDirectory
{
  if (!self->_webBundleDirectory)
  {
    v3 = [(WebBundleConfiguration *)self absoluteBuiltInWebBundleDirectory];
    webBundleDirectory = self->_webBundleDirectory;
    self->_webBundleDirectory = v3;
  }
  if ([(WebBundleConfiguration *)self temporarilyUseOnDeviceDirectory])
  {
    v5 = [(WebBundleConfiguration *)self absoluteCachedWebBundleDirectory];
  }
  else
  {
    v5 = self->_webBundleDirectory;
  }

  return v5;
}

- (BOOL)temporarilyUseOnDeviceDirectory
{
  return self->_temporarilyUseOnDeviceDirectory;
}

- (NSURL)absoluteCachedWebBundleDirectory
{
  v3 = [(WebBundleConfiguration *)self onDeviceDirectoryWritable];
  id v4 = [(WebBundleConfiguration *)self directoryForNewWebBundleName:v3];

  return (NSURL *)v4;
}

- (id)directoryForNewWebBundleName:(id)a3
{
  id v4 = a3;
  v5 = [(WebBundleConfiguration *)self _webBundleConfigurationStorageDirectory];
  id v12 = 0;
  [v5 setResourceValue:&__kCFBooleanTrue forKey:NSURLIsExcludedFromBackupKey error:&v12];
  id v6 = v12;
  if (v6)
  {
    v7 = sub_1000B8184();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Marking directory as excluded from backup error: %@", buf, 0xCu);
    }
  }
  objc_super v8 = [(WebBundleConfiguration *)self rootDirectory];
  v9 = [v5 URLByAppendingPathComponent:v8];

  v10 = [v9 URLByAppendingPathComponent:v4];

  return v10;
}

- (id)_webBundleConfigurationStorageDirectory
{
  v2 = NSHomeDirectory();
  v3 = [v2 stringByAppendingPathComponent:@"Library/Caches"];
  id v4 = +[NSURL fileURLWithPath:v3];

  return v4;
}

- (void)setWebBundleDirectory:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(WebBundleConfiguration *)self webBundleDirectory];
  [v4 encodeObject:v5 forKey:@"WebBundleConfigurationDirectory"];
}

- (unint64_t)hash
{
  v2 = [(WebBundleConfiguration *)self webBundleDirectory];
  id v3 = [v2 hash];

  return (unint64_t)v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (WebBundleConfiguration *)a3;
  id v5 = v4;
  if (v4 == self)
  {
    unsigned __int8 v8 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v6 = [(WebBundleConfiguration *)v5 webBundleDirectory];
    v7 = [(WebBundleConfiguration *)self webBundleDirectory];
    if (v6 == v7) {
      unsigned __int8 v8 = 1;
    }
    else {
      unsigned __int8 v8 = [v6 isEqual:v7];
    }
  }
  else
  {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (NSString)rootDirectory
{
  return (NSString *)&stru_101324E70;
}

- (NSString)messageHandlerName
{
  return (NSString *)&stru_101324E70;
}

- (NSString)urlScheme
{
  return (NSString *)&stru_101324E70;
}

- (NSURL)entryPointUrl
{
  return 0;
}

- (NSURL)entryPointUrlBase
{
  id v3 = [(WebBundleConfiguration *)self urlScheme];
  id v4 = [(WebBundleConfiguration *)self rootDirectory];
  id v5 = +[NSString stringWithFormat:@"%@://%@/", v3, v4];
  id v6 = +[NSURL URLWithString:v5];

  return (NSURL *)v6;
}

- (NSURL)serverURL
{
  return 0;
}

- (NSURL)debugOverrideServerURL
{
  return 0;
}

- (NSString)manifestSignedResourceName
{
  return 0;
}

- (NSString)manifestKey
{
  return 0;
}

- (NSString)onDeviceDirectory
{
  return self->_onDeviceDirectory;
}

- (NSString)onDeviceDirectoryWritable
{
  return self->_onDeviceDirectoryWritable;
}

- (void)setTemporarilyUseOnDeviceDirectory:(BOOL)a3
{
  self->_temporarilyUseOnDeviceDirectory = a3;
}

@end