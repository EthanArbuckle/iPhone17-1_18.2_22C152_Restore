@interface SKIMusicInvocation
+ (id)searchMusicRequestInApp:(id)a3;
@end

@implementation SKIMusicInvocation

+ (id)searchMusicRequestInApp:(id)a3
{
  v11[1] = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = [[SKIDirectInvocationPayload alloc] initWithIdentifier:@"com.apple.siri.directInvocation.music.search"];
  if ([v3 length])
  {
    v10 = @"appBundleId";
    v11[0] = v3;
    v5 = [NSDictionary dictionaryWithObjects:v11 forKeys:&v10 count:1];
    [(SKIDirectInvocationPayload *)v4 setUserData:v5];
  }
  v6 = +[SKIDirectInvocationContext contextForCarPlayDirectAction];
  v7 = +[SKIDirectInvocation runSiriKitExecutorCommandWithContext:v6 payload:v4];
  v8 = +[SKIDirectInvocation wrapCommandInStartLocalRequest:v7];

  return v8;
}

@end