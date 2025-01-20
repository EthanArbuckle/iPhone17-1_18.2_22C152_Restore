@interface AppNotificationEventListenerDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (_TtC17remoteappintentsd36AppNotificationEventListenerDelegate)init;
@end

@implementation AppNotificationEventListenerDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  char v9 = sub_1000082E8((uint64_t)v8, v7);

  return v9 & 1;
}

- (_TtC17remoteappintentsd36AppNotificationEventListenerDelegate)init
{
  return (_TtC17remoteappintentsd36AppNotificationEventListenerDelegate *)sub_100008618();
}

@end