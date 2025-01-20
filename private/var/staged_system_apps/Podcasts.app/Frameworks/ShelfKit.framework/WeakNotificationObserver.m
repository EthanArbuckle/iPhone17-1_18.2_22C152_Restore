@interface WeakNotificationObserver
- (void)handleWithNotification:(id)a3;
@end

@implementation WeakNotificationObserver

- (void)handleWithNotification:(id)a3
{
  uint64_t v4 = sub_3D1F60();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_3D1F50();
  v8 = *(void (**)(char *))self->block;
  swift_retain();
  v8(v7);
  swift_release();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

@end