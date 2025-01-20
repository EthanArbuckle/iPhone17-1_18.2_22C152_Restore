@interface BagContract
- (AMSBagValue)accountFlagsURL;
- (AMSBagValue)appleMusicDeviceOfferDeepLink;
- (AMSBagValue)iCloudDeviceOfferDeepLink;
- (AMSBagValue)trustedDomains;
- (id)_bagWithError:(id *)a3;
@end

@implementation BagContract

- (AMSBagValue)accountFlagsURL
{
  id v7 = 0;
  v2 = [(BagContract *)self _bagWithError:&v7];
  id v3 = v7;
  if (v2)
  {
    v4 = [v2 valueForKey:@"account-flags"];
    +[AMSBagValue frozenBagValueWithKey:@"account-flags" value:v4 valueType:5];
  }
  else
  {
    v4 = AMSError();
    +[AMSBagValue failingBagValueWithKey:@"account-flags" valueType:5 error:v4];
  v5 = };

  return (AMSBagValue *)v5;
}

- (AMSBagValue)trustedDomains
{
  id v7 = 0;
  v2 = [(BagContract *)self _bagWithError:&v7];
  id v3 = v7;
  if (v2)
  {
    v4 = [v2 valueForKey:@"trustedDomains"];
    +[AMSBagValue frozenBagValueWithKey:@"trustedDomains" value:v4 valueType:0];
  }
  else
  {
    v4 = AMSError();
    +[AMSBagValue failingBagValueWithKey:@"trustedDomains" valueType:0 error:v4];
  v5 = };

  return (AMSBagValue *)v5;
}

- (AMSBagValue)appleMusicDeviceOfferDeepLink
{
  id v7 = 0;
  v2 = [(BagContract *)self _bagWithError:&v7];
  id v3 = v7;
  if (v2)
  {
    v4 = [v2 valueForKey:@"appleMusicDeviceOfferDeepLink"];
    +[AMSBagValue frozenBagValueWithKey:@"appleMusicDeviceOfferDeepLink" value:v4 valueType:5];
  }
  else
  {
    v4 = AMSError();
    +[AMSBagValue failingBagValueWithKey:@"appleMusicDeviceOfferDeepLink" valueType:5 error:v4];
  v5 = };

  return (AMSBagValue *)v5;
}

- (AMSBagValue)iCloudDeviceOfferDeepLink
{
  id v7 = 0;
  v2 = [(BagContract *)self _bagWithError:&v7];
  id v3 = v7;
  if (v2)
  {
    v4 = [v2 valueForKey:@"iCloudDeviceOfferDeepLink"];
    +[AMSBagValue frozenBagValueWithKey:@"iCloudDeviceOfferDeepLink" value:v4 valueType:5];
  }
  else
  {
    v4 = AMSError();
    +[AMSBagValue failingBagValueWithKey:@"iCloudDeviceOfferDeepLink" valueType:5 error:v4];
  v5 = };

  return (AMSBagValue *)v5;
}

- (id)_bagWithError:(id *)a3
{
  id v4 = objc_alloc((Class)ISLoadURLBagOperation);
  v5 = +[SSURLBagContext contextWithBagType:0];
  id v6 = [v4 initWithBagContext:v5];

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100093E74;
  v13[3] = &unk_1003A3140;
  id v7 = dispatch_semaphore_create(0);
  v14 = v7;
  [v6 setCompletionBlock:v13];
  v8 = +[ISOperationQueue mainQueue];
  [v8 addOperation:v6];

  dispatch_time_t v9 = dispatch_time(0, 60000000000);
  intptr_t v10 = dispatch_semaphore_wait(v7, v9);
  if (a3 && v10)
  {
    AMSError();
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = [v6 URLBag];

  return v11;
}

@end