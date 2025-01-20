@interface RESleepScheduleEntry
+ (id)sleepEntryForDatesWithCurrent:(id)a3 next:(id)a4 schedule:(id)a5;
- (NSDate)bedtime;
- (NSDate)wakeupTime;
- (_TtC15RelevanceEngine20RESleepScheduleEntry)init;
- (_TtC15RelevanceEngine20RESleepScheduleEntry)initWithWakeupTime:(id)a3 bedtime:(id)a4;
- (void)setBedtime:(id)a3;
- (void)setWakeupTime:(id)a3;
@end

@implementation RESleepScheduleEntry

- (NSDate)wakeupTime
{
  return (NSDate *)sub_21E7D0F08((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC15RelevanceEngine20RESleepScheduleEntry_wakeupTime);
}

- (void)setWakeupTime:(id)a3
{
}

- (NSDate)bedtime
{
  return (NSDate *)sub_21E7D0F08((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC15RelevanceEngine20RESleepScheduleEntry_bedtime);
}

- (void)setBedtime:(id)a3
{
}

- (_TtC15RelevanceEngine20RESleepScheduleEntry)initWithWakeupTime:(id)a3 bedtime:(id)a4
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D44548);
  uint64_t v7 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  v9 = (char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  v11 = (char *)&v22 - v10;
  if (a3)
  {
    sub_21E7D9B30();
    uint64_t v12 = sub_21E7D9B40();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v11, 0, 1, v12);
  }
  else
  {
    uint64_t v13 = sub_21E7D9B40();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v11, 1, 1, v13);
  }
  if (a4)
  {
    sub_21E7D9B30();
    uint64_t v14 = sub_21E7D9B40();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v9, 0, 1, v14);
  }
  else
  {
    uint64_t v14 = sub_21E7D9B40();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v9, 1, 1, v14);
  }
  v15 = (char *)self + OBJC_IVAR____TtC15RelevanceEngine20RESleepScheduleEntry_wakeupTime;
  sub_21E7D9B40();
  v16 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56);
  v16(v15, 1, 1, v14);
  v17 = (char *)self + OBJC_IVAR____TtC15RelevanceEngine20RESleepScheduleEntry_bedtime;
  v16((char *)self + OBJC_IVAR____TtC15RelevanceEngine20RESleepScheduleEntry_bedtime, 1, 1, v14);
  swift_beginAccess();
  v18 = self;
  sub_21E7D151C((uint64_t)v11, (uint64_t)v15);
  swift_endAccess();
  swift_beginAccess();
  sub_21E7D151C((uint64_t)v9, (uint64_t)v17);
  swift_endAccess();

  v19 = (objc_class *)type metadata accessor for RESleepScheduleEntry();
  v23.receiver = v18;
  v23.super_class = v19;
  v20 = [(RESleepScheduleEntry *)&v23 init];
  sub_21E7D1584((uint64_t)v9);
  sub_21E7D1584((uint64_t)v11);
  return v20;
}

+ (id)sleepEntryForDatesWithCurrent:(id)a3 next:(id)a4 schedule:(id)a5
{
  uint64_t v6 = sub_21E7D9B40();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v17 - v11;
  sub_21E7D9B30();
  sub_21E7D9B30();
  id v13 = a5;
  id v14 = _s15RelevanceEngine20RESleepScheduleEntryC05sleepE8ForDates7current4next8scheduleAC10Foundation4DateV_AJSo09HKSPSleepD0CtFZ_0(v12, v10, v13);

  v15 = *(void (**)(char *, uint64_t))(v7 + 8);
  v15(v10, v6);
  v15(v12, v6);
  return v14;
}

- (_TtC15RelevanceEngine20RESleepScheduleEntry)init
{
  result = (_TtC15RelevanceEngine20RESleepScheduleEntry *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_21E7D1584((uint64_t)self + OBJC_IVAR____TtC15RelevanceEngine20RESleepScheduleEntry_wakeupTime);
  v3 = (char *)self + OBJC_IVAR____TtC15RelevanceEngine20RESleepScheduleEntry_bedtime;
  sub_21E7D1584((uint64_t)v3);
}

@end