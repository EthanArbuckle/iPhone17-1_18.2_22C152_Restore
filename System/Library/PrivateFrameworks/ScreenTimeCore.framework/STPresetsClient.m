@interface STPresetsClient
- (void)currentConfigurationForUserID:(id)a3 completionHandler:(id)a4;
@end

@implementation STPresetsClient

- (void)currentConfigurationForUserID:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  id v6 = (id)objc_opt_new();
  (*((void (**)(id, id, void))a4 + 2))(v5, v6, 0);
}

@end