@interface Reporter
- (void)failWithReason:(id)a3;
- (void)warnWithMessage:(id)a3;
@end

@implementation Reporter

- (void)failWithReason:(id)a3
{
  uint64_t v4 = sub_1B3A702C0();
  uint64_t v6 = v5;
  v7 = (void (*)(uint64_t, uint64_t))*((void *)self->super.isa + 29);
  swift_retain();
  v7(v4, v6);
  swift_release();

  swift_bridgeObjectRelease();
}

- (void)warnWithMessage:(id)a3
{
  sub_1B3A702C0();
  swift_retain();
  sub_1B3A703A0();
  (*((void (**)(uint64_t, unint64_t, uint64_t, void))self->super.isa + 27))(0x3A676E696E726177, 0xE900000000000020, 1, 0);
  swift_release();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end