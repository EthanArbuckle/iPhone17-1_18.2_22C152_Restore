@interface WFSettingsClient
+ (void)createClientWithCompletionHandler:(id)a3;
@end

@implementation WFSettingsClient

+ (void)createClientWithCompletionHandler:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F28C58];
  id v5 = a3;
  id v6 = [v4 errorWithDomain:@"WFSettingsClientErrorDomain" code:0 userInfo:0];
  (*((void (**)(id, void, id))a3 + 2))(v5, 0, v6);
}

@end