@interface TapToRadarView
- (_TtC7Measure14TapToRadarView)initWithCoder:(id)a3;
- (_TtC7Measure14TapToRadarView)initWithFrame:(CGRect)a3;
- (void)fileRadar;
- (void)updateForCurrentOrientation;
@end

@implementation TapToRadarView

- (_TtC7Measure14TapToRadarView)initWithFrame:(CGRect)a3
{
  return (_TtC7Measure14TapToRadarView *)sub_1001EB5DC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC7Measure14TapToRadarView)initWithCoder:(id)a3
{
  *(void *)&self->delegate[OBJC_IVAR____TtC7Measure14TapToRadarView_delegate] = 0;
  swift_unknownObjectWeakInit();
  uint64_t v5 = OBJC_IVAR____TtC7Measure14TapToRadarView_rtlFormat;
  v6 = self;
  id v7 = a3;
  id v8 = [v6 sharedApplication];
  id v9 = [v8 userInterfaceLayoutDirection];

  *((unsigned char *)&self->super.super.super.super.super.isa + v5) = v9 == (id)1;
  result = (_TtC7Measure14TapToRadarView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)fileRadar
{
  if (swift_unknownObjectWeakLoadStrong())
  {
    v3 = self;
    sub_1001DEFBC();

    swift_unknownObjectRelease();
  }
}

- (void)updateForCurrentOrientation
{
  v2 = self;
  sub_1001EB904();
}

- (void).cxx_destruct
{
}

@end