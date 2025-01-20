@interface DIPSystemNotificationListener
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (_TtC8coreidvd29DIPSystemNotificationListener)init;
- (void)dealloc;
@end

@implementation DIPSystemNotificationListener

- (_TtC8coreidvd29DIPSystemNotificationListener)init
{
  return (_TtC8coreidvd29DIPSystemNotificationListener *)sub_100218A10();
}

- (void)dealloc
{
  v2 = self;
  sub_100218C64();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8coreidvd29DIPSystemNotificationListener_systemNotificationListener));
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  char v9 = sub_10021A598(v7);

  return v9 & 1;
}

@end