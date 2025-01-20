@interface SBWebApplication
+ (id)_webAppIdentifierFromWebClipIdentifier:(id)a3;
+ (id)_webClipIdentifierFromWebAppIdentifier:(id)a3;
- (BOOL)isWebApplication;
- (BOOL)supportsMultitaskingShelf;
- (id)iconIdentifier;
@end

@implementation SBWebApplication

+ (id)_webAppIdentifierFromWebClipIdentifier:(id)a3
{
  return (id)[@"sceneID:com.apple.webapp-" stringByAppendingString:a3];
}

+ (id)_webClipIdentifierFromWebAppIdentifier:(id)a3
{
  id v3 = a3;
  unint64_t v4 = [v3 length];
  if (v4 > [@"sceneID:com.apple.webapp-" length]
    && [v3 hasPrefix:@"sceneID:com.apple.webapp-"])
  {
    v5 = [v3 substringFromIndex:objc_msgSend(@"sceneID:com.apple.webapp-", "length")];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)iconIdentifier
{
  return 0;
}

- (BOOL)isWebApplication
{
  return 1;
}

- (BOOL)supportsMultitaskingShelf
{
  return 0;
}

@end