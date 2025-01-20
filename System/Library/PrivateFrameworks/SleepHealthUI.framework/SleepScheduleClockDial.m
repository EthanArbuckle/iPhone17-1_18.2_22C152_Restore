@interface SleepScheduleClockDial
- (_TtC13SleepHealthUI22SleepScheduleClockDial)initWithCoder:(id)a3;
- (_TtC13SleepHealthUI22SleepScheduleClockDial)initWithFrame:(CGRect)a3;
- (void)drawRect:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation SleepScheduleClockDial

- (_TtC13SleepHealthUI22SleepScheduleClockDial)initWithCoder:(id)a3
{
  result = (_TtC13SleepHealthUI22SleepScheduleClockDial *)sub_1AD9E0140();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1AD9141CC();
}

- (void)drawRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v7 = self;
  sub_1AD914460(x, y, width, height);
}

- (_TtC13SleepHealthUI22SleepScheduleClockDial)initWithFrame:(CGRect)a3
{
  result = (_TtC13SleepHealthUI22SleepScheduleClockDial *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  long long v2 = *(_OWORD *)((char *)&self->super._minimumSafeAreaInsets.bottom
                 + OBJC_IVAR____TtC13SleepHealthUI22SleepScheduleClockDial_configuration);
  v8[8] = *(_OWORD *)((char *)&self->super._minimumSafeAreaInsets.top
                    + OBJC_IVAR____TtC13SleepHealthUI22SleepScheduleClockDial_configuration);
  v8[9] = v2;
  long long v3 = *(_OWORD *)((char *)&self->super._minXVariable
                 + OBJC_IVAR____TtC13SleepHealthUI22SleepScheduleClockDial_configuration);
  v8[10] = *(_OWORD *)((char *)&self->super._layer
                     + OBJC_IVAR____TtC13SleepHealthUI22SleepScheduleClockDial_configuration);
  v8[11] = v3;
  long long v4 = *(_OWORD *)((char *)&self->super._gestureRecognizers
                 + OBJC_IVAR____TtC13SleepHealthUI22SleepScheduleClockDial_configuration);
  v8[4] = *(_OWORD *)((char *)&self->super._subviewCache
                    + OBJC_IVAR____TtC13SleepHealthUI22SleepScheduleClockDial_configuration);
  v8[5] = v4;
  long long v5 = *(_OWORD *)((char *)&self->super._viewFlags
                 + OBJC_IVAR____TtC13SleepHealthUI22SleepScheduleClockDial_configuration
                 + 16);
  v8[6] = *(_OWORD *)((char *)&self->super._viewFlags
                    + OBJC_IVAR____TtC13SleepHealthUI22SleepScheduleClockDial_configuration);
  v8[7] = v5;
  long long v6 = *(_OWORD *)((char *)&self->super.super.__layeringSceneIdentity
                 + OBJC_IVAR____TtC13SleepHealthUI22SleepScheduleClockDial_configuration);
  v8[0] = *(_OWORD *)((char *)&self->super.super.super.isa
                    + OBJC_IVAR____TtC13SleepHealthUI22SleepScheduleClockDial_configuration);
  v8[1] = v6;
  long long v7 = *(_OWORD *)((char *)&self->super._traitChangeRegistry
                 + OBJC_IVAR____TtC13SleepHealthUI22SleepScheduleClockDial_configuration);
  v8[2] = *(_OWORD *)((char *)&self->super._cachedTraitCollection
                    + OBJC_IVAR____TtC13SleepHealthUI22SleepScheduleClockDial_configuration);
  v8[3] = v7;
  sub_1AD8975C0((uint64_t)v8);
}

@end