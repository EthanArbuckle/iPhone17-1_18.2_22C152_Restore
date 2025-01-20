@interface RecentCallProvider
- (_TtC8FaceTime18RecentCallProvider)init;
- (void)recentsController:(id)a3 didChangeCalls:(id)a4;
@end

@implementation RecentCallProvider

- (void)recentsController:(id)a3 didChangeCalls:(id)a4
{
  id v5 = a3;
  v6 = self;
  sub_1000075F4();
}

- (_TtC8FaceTime18RecentCallProvider)init
{
  result = (_TtC8FaceTime18RecentCallProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_100017EC0((uint64_t)self + OBJC_IVAR____TtC8FaceTime18RecentCallProvider_delegate, (uint64_t *)&unk_1000BB490);
  sub_10000C128(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC8FaceTime18RecentCallProvider_presentScreenTimeShield));
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8FaceTime18RecentCallProvider_recentsController);
}

@end