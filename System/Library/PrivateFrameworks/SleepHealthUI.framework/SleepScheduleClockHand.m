@interface SleepScheduleClockHand
- (BOOL)accessibilityHandIsBedtime;
- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (BOOL)isHighlighted;
- (_TtC13SleepHealthUI22SleepScheduleClockHand)initWithCoder:(id)a3;
- (_TtC13SleepHealthUI22SleepScheduleClockHand)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)setHighlighted:(BOOL)a3;
@end

@implementation SleepScheduleClockHand

- (_TtC13SleepHealthUI22SleepScheduleClockHand)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC13SleepHealthUI22SleepScheduleClockHand_background;
  id v6 = objc_allocWithZone(MEMORY[0x1E4F39C88]);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);

  result = (_TtC13SleepHealthUI22SleepScheduleClockHand *)sub_1AD9E0140();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1AD961034();
}

- (BOOL)isHighlighted
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SleepScheduleClockHand();
  return [(SleepScheduleClockHand *)&v3 isHighlighted];
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  v14.receiver = self;
  v14.super_class = (Class)type metadata accessor for SleepScheduleClockHand();
  v4 = (char *)v14.receiver;
  [(SleepScheduleClockHand *)&v14 setHighlighted:v3];
  id v6 = *(void **)&v4[OBJC_IVAR____TtC13SleepHealthUI22SleepScheduleClockHand_configuration + 8];
  id v7 = *(void **)&v4[OBJC_IVAR____TtC13SleepHealthUI22SleepScheduleClockHand_configuration + 16];
  v8 = *(void **)&v4[OBJC_IVAR____TtC13SleepHealthUI22SleepScheduleClockHand_configuration + 24];
  v15[0] = *(void *)&v4[OBJC_IVAR____TtC13SleepHealthUI22SleepScheduleClockHand_configuration];
  uint64_t v5 = (void *)v15[0];
  v15[1] = v6;
  v15[2] = v7;
  v15[3] = v8;
  long long v16 = *(_OWORD *)&v4[OBJC_IVAR____TtC13SleepHealthUI22SleepScheduleClockHand_configuration + 32];
  id v9 = (id)v16;
  id v10 = v5;
  id v11 = v6;
  id v12 = v7;
  id v13 = v8;
  sub_1AD9607A4((uint64_t)v15);
}

- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  return 0;
}

- (BOOL)accessibilityHandIsBedtime
{
  return (*(_WORD *)((unsigned char *)&self->super.super.super.super.isa
                   + OBJC_IVAR____TtC13SleepHealthUI22SleepScheduleClockHand_symbol) & 0xF0FF) == 0;
}

- (_TtC13SleepHealthUI22SleepScheduleClockHand)initWithFrame:(CGRect)a3
{
  result = (_TtC13SleepHealthUI22SleepScheduleClockHand *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13SleepHealthUI22SleepScheduleClockHand_background));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13SleepHealthUI22SleepScheduleClockHand_image));
  BOOL v3 = (char *)self + OBJC_IVAR____TtC13SleepHealthUI22SleepScheduleClockHand_configuration;
  v4 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC13SleepHealthUI22SleepScheduleClockHand_configuration);
  uint64_t v5 = (void *)*((void *)v3 + 1);
  id v6 = (void *)*((void *)v3 + 2);
  id v7 = (id)*((void *)v3 + 4);
}

@end