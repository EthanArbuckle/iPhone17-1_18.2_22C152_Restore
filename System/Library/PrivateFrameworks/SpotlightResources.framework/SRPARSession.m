@interface SRPARSession
+ (id)spotlightResourcesPARSessionForClient:(id)a3;
+ (id)spotlightResourcesPARSessionMail;
+ (id)spotlightResourcesPARSessionSpotlight;
@end

@implementation SRPARSession

+ (id)spotlightResourcesPARSessionSpotlight
{
  v2 = (void *)sSpotlightPARSession;
  if (!sSpotlightPARSession)
  {
    v3 = [MEMORY[0x263F086E0] bundleWithPath:@"/System/Library/PrivateFrameworks/Search.framework"];
    v4 = [v3 infoDictionary];
    v5 = [v4 objectForKeyedSubscript:@"CFBundleVersion"];

    v6 = [NSString stringWithFormat:@"Spotlight/%@", v5];
    v7 = (void *)[objc_alloc(MEMORY[0x263F36D70]) initWithId:@"com.apple.spotlight" userAgent:v6 factory:0];
    uint64_t v8 = [MEMORY[0x263F36D68] sessionWithConfiguration:v7];
    v9 = (void *)sSpotlightPARSession;
    sSpotlightPARSession = v8;

    v2 = (void *)sSpotlightPARSession;
  }
  return v2;
}

+ (id)spotlightResourcesPARSessionMail
{
  v2 = (void *)sMailPARSession;
  if (!sMailPARSession)
  {
    v3 = (void *)[objc_alloc(MEMORY[0x263F36D70]) initWithId:@"com.apple.mail" userAgent:@"mail/1.0" factory:0];
    uint64_t v4 = [MEMORY[0x263F36D68] sessionWithConfiguration:v3];
    v5 = (void *)sMailPARSession;
    sMailPARSession = v4;

    v2 = (void *)sMailPARSession;
  }
  return v2;
}

+ (id)spotlightResourcesPARSessionForClient:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Spotlight"])
  {
    uint64_t v4 = +[SRPARSession spotlightResourcesPARSessionSpotlight];
LABEL_5:
    v5 = (void *)v4;
    goto LABEL_7;
  }
  if ([v3 isEqualToString:@"Mail"])
  {
    uint64_t v4 = +[SRPARSession spotlightResourcesPARSessionMail];
    goto LABEL_5;
  }
  v5 = 0;
LABEL_7:

  return v5;
}

@end