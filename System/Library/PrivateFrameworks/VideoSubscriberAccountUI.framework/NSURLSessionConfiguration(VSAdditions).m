@interface NSURLSessionConfiguration(VSAdditions)
+ (id)vs_defaultSessionConfigurationForSourceAppWithAuditToken:()VSAdditions;
@end

@implementation NSURLSessionConfiguration(VSAdditions)

+ (id)vs_defaultSessionConfigurationForSourceAppWithAuditToken:()VSAdditions
{
  id v4 = a3;
  v5 = [a1 defaultSessionConfiguration];
  v6 = (void *)[v5 copy];

  if (v4)
  {
    id v7 = v4;
    v8 = [v7 bundleIdentifier];
    v9 = [v7 tokenBytes];
  }
  else
  {
    v9 = 0;
    v8 = 0;
  }
  objc_msgSend(v6, "set_sourceApplicationBundleIdentifier:", v8);
  objc_msgSend(v6, "set_sourceApplicationAuditTokenData:", v9);

  return v6;
}

@end