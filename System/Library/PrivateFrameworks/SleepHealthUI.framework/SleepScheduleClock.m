@interface SleepScheduleClock
- (BOOL)accessibilityAlarmEnabled;
- (BOOL)accessibilityIsForSingleDayOverride;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (_TtC13SleepHealthUI18SleepScheduleClock)initWithCoder:(id)a3;
- (_TtC13SleepHealthUI18SleepScheduleClock)initWithFrame:(CGRect)a3;
- (double)accessibilityMaximumTimeInBed;
- (double)accessibilityMinimumTimeInBed;
- (double)accessibilityTimeInBed;
- (double)accessibilityTimeInBedGoal;
- (id)accessibilityBedtimeHand;
- (id)accessibilityRoundedBedtimeComponents;
- (id)accessibilityRoundedWakeUpComponents;
- (id)accessibilityWakeUpHand;
- (void)accessibilitySetBedtimeAngle:(double)a3 minimumTimeInBed:(double)a4 maximumTimeInBed:(double)a5;
- (void)accessibilitySetModel:(id)a3 wakeUpComponents:(id)a4 timeInBedGoal:(double)a5 alarmEnabled:(BOOL)a6;
- (void)accessibilitySetModel:(id)a3 wakeUpComponents:(id)a4 timeInBedGoal:(double)a5 alarmEnabled:(BOOL)a6 isForSingleDayOverride:(BOOL)a7;
- (void)accessibilitySetWakeupAngle:(double)a3 minimumTimeInBed:(double)a4 maximumTimeInBed:(double)a5;
- (void)gestureRecognizerDidEnd:(id)a3;
- (void)gestureRecognizerDidMove:(id)a3;
- (void)gestureRecognizerDidStart:(id)a3;
- (void)gestureReconizerDidChange:(id)a3;
- (void)layoutSublayersOfLayer:(id)a3;
- (void)layoutSubviews;
@end

@implementation SleepScheduleClock

- (_TtC13SleepHealthUI18SleepScheduleClock)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1AD8F9AC0();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1AD8F4AD8();
}

- (void)layoutSublayersOfLayer:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1AD8F4D20((uint64_t)v4);
}

- (id)accessibilityBedtimeHand
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                 + OBJC_IVAR____TtC13SleepHealthUI18SleepScheduleClock_bedtimeHand));
}

- (id)accessibilityWakeUpHand
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                 + OBJC_IVAR____TtC13SleepHealthUI18SleepScheduleClock_wakeUpHand));
}

- (BOOL)accessibilityIsForSingleDayOverride
{
  v2 = (char *)self + OBJC_IVAR____TtC13SleepHealthUI18SleepScheduleClock_model;
  swift_beginAccess();
  return v2[42];
}

- (BOOL)accessibilityAlarmEnabled
{
  v2 = (char *)self + OBJC_IVAR____TtC13SleepHealthUI18SleepScheduleClock_model;
  swift_beginAccess();
  return v2[41];
}

- (double)accessibilityTimeInBed
{
  sub_1AD8F52F0();
  return result;
}

- (double)accessibilityTimeInBedGoal
{
  v2 = (double *)((char *)self + OBJC_IVAR____TtC13SleepHealthUI18SleepScheduleClock_model);
  swift_beginAccess();
  double result = v2[4];
  if (*((unsigned char *)v2 + 40)) {
    return 0.0;
  }
  return result;
}

- (_TtC13SleepHealthUI18SleepScheduleClock)initWithFrame:(CGRect)a3
{
  double result = (_TtC13SleepHealthUI18SleepScheduleClock *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  memcpy(__dst, (char *)self + OBJC_IVAR____TtC13SleepHealthUI18SleepScheduleClock_configuration, sizeof(__dst));
  sub_1AD89742C((uint64_t)__dst);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13SleepHealthUI18SleepScheduleClock_gestureRecognizer));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13SleepHealthUI18SleepScheduleClock_track));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13SleepHealthUI18SleepScheduleClock_ring));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13SleepHealthUI18SleepScheduleClock_grabber));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13SleepHealthUI18SleepScheduleClock_dial));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13SleepHealthUI18SleepScheduleClock_bedtimeHand));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13SleepHealthUI18SleepScheduleClock_wakeUpHand));
  sub_1AD8FA350((uint64_t)self + OBJC_IVAR____TtC13SleepHealthUI18SleepScheduleClock_majorFeedbackGenerator);
  sub_1AD8FA350((uint64_t)self + OBJC_IVAR____TtC13SleepHealthUI18SleepScheduleClock_minorFeedbackGenerator);
  objc_release(*(id *)((char *)&self->super.super._swiftAnimationInfo
                     + OBJC_IVAR____TtC13SleepHealthUI18SleepScheduleClock_dragState));
}

- (void)accessibilitySetModel:(id)a3 wakeUpComponents:(id)a4 timeInBedGoal:(double)a5 alarmEnabled:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v9 = sub_1AD9DC990();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v12 = MEMORY[0x1F4188790](v9, v11);
  v14 = (char *)&v22 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v12, v15);
  v17 = (char *)&v22 - v16;
  sub_1AD9DC8C0();
  sub_1AD9DC8C0();
  v18 = self;
  v19 = (void *)sub_1AD9DC8B0();
  v20 = (void *)sub_1AD9DC8B0();
  [(SleepScheduleClock *)v18 accessibilitySetModel:v19 wakeUpComponents:v20 timeInBedGoal:v6 alarmEnabled:0 isForSingleDayOverride:a5];

  v21 = *(void (**)(char *, uint64_t))(v10 + 8);
  v21(v14, v9);
  v21(v17, v9);
}

- (void)accessibilitySetModel:(id)a3 wakeUpComponents:(id)a4 timeInBedGoal:(double)a5 alarmEnabled:(BOOL)a6 isForSingleDayOverride:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  uint64_t v11 = sub_1AD9DC990();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v14 = MEMORY[0x1F4188790](v11, v13);
  uint64_t v16 = (char *)&v25 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v14, v17);
  v19 = (char *)&v25 - v18;
  sub_1AD9DC8C0();
  sub_1AD9DC8C0();
  uint64_t v20 = *(void *)&a5;
  double v21 = *(double *)((char *)&self->super.super._minimumSafeAreaInsets.right
                  + OBJC_IVAR____TtC13SleepHealthUI18SleepScheduleClock_configuration);
  double v22 = *(double *)((char *)&self->super.super._layer + OBJC_IVAR____TtC13SleepHealthUI18SleepScheduleClock_configuration);
  swift_beginAccess();
  v23 = self;
  sub_1AD94B814((uint64_t)v19, (uint64_t)v16, v20, 0, v8, v7, v21, v22);
  swift_endAccess();
  sub_1AD8F3DFC();
  [(SleepScheduleClock *)v23 sendActionsForControlEvents:0x40000];
  sub_1AD8F3DFC();

  v24 = *(void (**)(char *, uint64_t))(v12 + 8);
  v24(v16, v11);
  v24(v19, v11);
}

- (id)accessibilityRoundedBedtimeComponents
{
  return sub_1AD8F5C3C((uint64_t)self, (uint64_t)a2, (void (*)(uint64_t, double))sub_1AD94B060);
}

- (id)accessibilityRoundedWakeUpComponents
{
  return sub_1AD8F5C3C((uint64_t)self, (uint64_t)a2, (void (*)(uint64_t, double))sub_1AD94B2E4);
}

- (void)gestureReconizerDidChange:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1AD8F63C4(v4);
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v4 = (char *)self + OBJC_IVAR____TtC13SleepHealthUI18SleepScheduleClock_dragState;
  swift_beginAccess();
  return *((void *)v4 + 5) == 0;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = self;
  objc_msgSend(v7, sel_locationInView_, v8);
  double v10 = v9;
  double v12 = v11;
  objc_msgSend(*(id *)((char *)&v8->super.super.super.super.isa + OBJC_IVAR____TtC13SleepHealthUI18SleepScheduleClock_bedtimeHand), sel_frame);
  v15.x = v10;
  v15.y = v12;
  BOOL v13 = CGRectContainsPoint(v17, v15)
     || (objc_msgSend(*(id *)((char *)&v8->super.super.super.super.isa+ OBJC_IVAR____TtC13SleepHealthUI18SleepScheduleClock_wakeUpHand), sel_frame), v16.x = v10, v16.y = v12, CGRectContainsPoint(v18, v16))|| sub_1AD8F6D68(v10, v12);

  return v13;
}

- (void)gestureRecognizerDidStart:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1AD8F71A8(v4);
}

- (void)gestureRecognizerDidMove:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1AD8F79D4(v4);
}

- (void)gestureRecognizerDidEnd:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1AD8F9C38();
}

- (double)accessibilityMinimumTimeInBed
{
  return *(double *)((char *)&self->super.super._minimumSafeAreaInsets.right
                   + OBJC_IVAR____TtC13SleepHealthUI18SleepScheduleClock_configuration);
}

- (double)accessibilityMaximumTimeInBed
{
  return *(double *)((char *)&self->super.super._layer
                   + OBJC_IVAR____TtC13SleepHealthUI18SleepScheduleClock_configuration);
}

- (void)accessibilitySetBedtimeAngle:(double)a3 minimumTimeInBed:(double)a4 maximumTimeInBed:(double)a5
{
  swift_beginAccess();
  BOOL v8 = self;
  sub_1AD94BFE0(a3, a4, a4);
  sub_1AD8F3DFC();
}

- (void)accessibilitySetWakeupAngle:(double)a3 minimumTimeInBed:(double)a4 maximumTimeInBed:(double)a5
{
  BOOL v8 = (char *)self + OBJC_IVAR____TtC13SleepHealthUI18SleepScheduleClock_model;
  swift_beginAccess();
  double v9 = self;
  *((void *)v8 + 2) = sub_1AD94BE0C(a3);
  *((void *)v8 + 3) = v10;
  sub_1AD94CA30(a4, a4);
  sub_1AD8F3DFC();
}

@end