@interface SUBAppleConnectSSO
- (void)retrieveSSOToken:(id)a3;
@end

@implementation SUBAppleConnectSSO

- (void)retrieveSSOToken:(id)a3
{
  id v3 = a3;
  v4 = dispatch_get_global_queue(0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000136C8;
  block[3] = &unk_10002D0F8;
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, block);
}

@end