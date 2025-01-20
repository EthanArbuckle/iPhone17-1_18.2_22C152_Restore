@interface FRAnalyticsAssembly
- (void)loadInRegistry:(id)a3;
@end

@implementation FRAnalyticsAssembly

- (void)loadInRegistry:(id)a3
{
  id v3 = a3;
  v4 = [v3 publicContainer];
  id v5 = [v4 registerProtocol:&OBJC_PROTOCOL___NSSNewsAnalyticsSessionManager factory:&stru_1000C9378];

  id v7 = [v3 publicContainer];

  id v6 = [v7 registerProtocol:&OBJC_PROTOCOL___NSSNewsAnalyticsUserIDProvider factory:&stru_1000C93B8];
}

@end