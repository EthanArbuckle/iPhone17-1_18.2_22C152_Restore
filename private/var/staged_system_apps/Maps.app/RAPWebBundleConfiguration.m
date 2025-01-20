@interface RAPWebBundleConfiguration
- (id)bundleName;
- (id)debugOverrideServerURL;
- (id)entryPointUrl;
- (id)manifestKey;
- (id)manifestSignedResourceName;
- (id)messageHandlerName;
- (id)onDeviceDirectory;
- (id)onDeviceDirectoryWritable;
- (id)rootDirectory;
- (id)serverURL;
- (id)urlScheme;
@end

@implementation RAPWebBundleConfiguration

- (id)manifestKey
{
  return @"RAPWebBundleManifestKey";
}

- (id)rootDirectory
{
  return @"RAPWebBundle";
}

- (id)onDeviceDirectoryWritable
{
  return @"RAPWebBundleWritable";
}

- (id)manifestSignedResourceName
{
  return @"manifest.cms-rap";
}

- (id)bundleName
{
  return @"RAPWebBundle";
}

- (id)urlScheme
{
  return @"rap";
}

- (id)entryPointUrl
{
  v2 = [(WebBundleConfiguration *)self entryPointUrlBase];
  v3 = [v2 URLByAppendingPathComponent:@"index.html"];

  return v3;
}

- (id)serverURL
{
  return (id)GEOGetURL();
}

- (id)debugOverrideServerURL
{
  v2 = GEOConfigGetString();
  if ([v2 length])
  {
    v3 = +[NSURL URLWithString:v2];
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)onDeviceDirectory
{
  return @"RAPWebBundle";
}

- (id)messageHandlerName
{
  return @"rapBundle";
}

@end