@interface FCSimulatorSearchAPITokenProvider
+ (id)apiToken;
@end

@implementation FCSimulatorSearchAPITokenProvider

+ (id)apiToken
{
  if (FeldsparCoreInternalExtrasEnabled())
  {
    v2 = objc_msgSend(MEMORY[0x1E4F28B50], "fc_feldsparCoreInternalExtrasBundle");
    [v2 load];

    v3 = objc_msgSend(MEMORY[0x1E4F28B50], "fc_feldsparCoreInternalExtrasBundle");
    v4 = (void *)[v3 classNamed:@"FCSimulatorSearchAPITokenProvider_Internal"];

    v5 = [v4 apiToken];
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

@end