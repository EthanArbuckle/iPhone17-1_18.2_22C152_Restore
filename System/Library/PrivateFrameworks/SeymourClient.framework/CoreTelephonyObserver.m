@interface CoreTelephonyObserver
- (_TtC13SeymourClient21CoreTelephonyObserver)init;
- (void)cellularDataStateChanged;
- (void)cellularDataStateChangedWithCellularDataEnabled:(BOOL)a3;
- (void)cellularDataStateChangedWithRoaming:(BOOL)a3;
@end

@implementation CoreTelephonyObserver

- (_TtC13SeymourClient21CoreTelephonyObserver)init
{
  result = (_TtC13SeymourClient21CoreTelephonyObserver *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1D59586BC((uint64_t)self + OBJC_IVAR____TtC13SeymourClient21CoreTelephonyObserver_delegate);

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13SeymourClient21CoreTelephonyObserver_coreTelephonyClient));
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13SeymourClient21CoreTelephonyObserver_queue);
}

- (void)cellularDataStateChanged
{
  v2 = self;
  sub_1D5A28C78();
}

- (void)cellularDataStateChangedWithCellularDataEnabled:(BOOL)a3
{
  v4 = self;
  sub_1D5A28E94(a3, &OBJC_IVAR____TtC13SeymourClient21CoreTelephonyObserver_isCellularDataEnabled, (void (*)(uint64_t))sub_1D5A28904);
}

- (void)cellularDataStateChangedWithRoaming:(BOOL)a3
{
  v4 = self;
  sub_1D5A28E94(a3, &OBJC_IVAR____TtC13SeymourClient21CoreTelephonyObserver_isRoaming, (void (*)(uint64_t))sub_1D5A28760);
}

@end