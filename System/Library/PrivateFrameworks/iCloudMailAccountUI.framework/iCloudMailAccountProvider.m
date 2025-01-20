@interface iCloudMailAccountProvider
- (iCloudMailAccountProvider)initWithAccountStore:(id)a3 appleAccount:(id)a4 presenter:(id)a5;
- (void)presentWithAlert:(BOOL)a3 completionHandler:(id)a4;
- (void)presentWithCompletionHandler:(id)a3;
@end

@implementation iCloudMailAccountProvider

- (iCloudMailAccountProvider)initWithAccountStore:(id)a3 appleAccount:(id)a4 presenter:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)iCloudMailAccountProvider;
  v11 = [(iCloudMailAccountProvider *)&v15 init];
  if (v11)
  {
    v12 = [[iCloudMailAccountProviderSwift alloc] initWithPresenter:v10 appleAccount:v9 accountStore:v8];
    provider = v11->provider;
    v11->provider = v12;
  }
  return v11;
}

- (void)presentWithAlert:(BOOL)a3 completionHandler:(id)a4
{
}

- (void)presentWithCompletionHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end