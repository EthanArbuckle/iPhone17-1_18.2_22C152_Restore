@interface WCAXPCService
- (void)executeFetchRequest:(id)a3 completionHandler:(id)a4;
- (void)fetchWiFiAssetsFromServer;
@end

@implementation WCAXPCService

- (void)executeFetchRequest:(id)a3 completionHandler:(id)a4
{
  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v13 = 0;
  objc_storeStrong(&v13, a4);
  v6 = +[WCAServer sharedInstance];
  id v5 = location[0];
  v7 = _NSConcreteStackBlock;
  int v8 = -1073741824;
  int v9 = 0;
  v10 = sub_100009FB0;
  v11 = &unk_100010F58;
  id v12 = v13;
  -[WCAServer executeFetchRequest:completion:](v6, "executeFetchRequest:completion:", v5);

  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
}

- (void)fetchWiFiAssetsFromServer
{
  v2 = +[WCAServer sharedInstance];
  [(WCAServer *)v2 fetchWiFiAssetsFromServer];
}

@end