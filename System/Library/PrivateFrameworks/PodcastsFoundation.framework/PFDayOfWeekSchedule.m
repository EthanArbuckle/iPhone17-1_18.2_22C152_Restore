@interface PFDayOfWeekSchedule
+ (PFDayOfWeekSchedule)firstDayOfWeek;
- (BOOL)shouldExecuteOn:(id)a3 previousExecution:(id)a4;
- (PFDayOfWeekSchedule)init;
- (PFDayOfWeekSchedule)initWithDayOfWeek:(int64_t)a3 calendar:(id)a4;
@end

@implementation PFDayOfWeekSchedule

+ (PFDayOfWeekSchedule)firstDayOfWeek
{
  uint64_t v2 = sub_1ACE75208();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x1F4188790](v2);
  v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v4);
  v8 = (char *)&v16 - v7;
  sub_1ACE751D8();
  uint64_t v9 = sub_1ACE75168();
  v10 = *(void (**)(char *, char *, uint64_t))(v3 + 16);
  v10(v6, v8, v2);
  v11 = (objc_class *)type metadata accessor for DayOfWeekSchedule();
  v12 = (char *)objc_allocWithZone(v11);
  *(void *)&v12[OBJC_IVAR___PFDayOfWeekSchedule_dayOfWeek] = v9;
  v10(&v12[OBJC_IVAR___PFDayOfWeekSchedule_calendar], v6, v2);
  v16.receiver = v12;
  v16.super_class = v11;
  id v13 = objc_msgSendSuper2(&v16, sel_init);
  v14 = *(void (**)(char *, uint64_t))(v3 + 8);
  v14(v6, v2);
  v14(v8, v2);
  return (PFDayOfWeekSchedule *)v13;
}

- (PFDayOfWeekSchedule)initWithDayOfWeek:(int64_t)a3 calendar:(id)a4
{
  uint64_t v6 = sub_1ACE75208();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1ACE751B8();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___PFDayOfWeekSchedule_dayOfWeek) = (Class)a3;
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))((char *)self + OBJC_IVAR___PFDayOfWeekSchedule_calendar, v9, v6);
  v10 = (objc_class *)type metadata accessor for DayOfWeekSchedule();
  v13.receiver = self;
  v13.super_class = v10;
  v11 = [(PFDayOfWeekSchedule *)&v13 init];
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v11;
}

- (BOOL)shouldExecuteOn:(id)a3 previousExecution:(id)a4
{
  uint64_t v6 = sub_1ACE751E8();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v9 = (char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB773140);
  MEMORY[0x1F4188790](v10 - 8);
  v12 = (char *)&v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_1ACE750A8();
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x1F4188790](v13);
  objc_super v16 = (char *)&v22 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1ACE75078();
  if (a4)
  {
    sub_1ACE75078();
    uint64_t v17 = 0;
  }
  else
  {
    uint64_t v17 = 1;
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v14 + 56))(v12, v17, 1, v13);
  (*(void (**)(char *, void, uint64_t))(v7 + 104))(v9, *MEMORY[0x1E4F27C68], v6);
  v18 = self;
  uint64_t v19 = sub_1ACE751F8();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  uint64_t v20 = *(uint64_t *)((char *)&v18->super.isa + OBJC_IVAR___PFDayOfWeekSchedule_dayOfWeek);

  sub_1ACA3E034((uint64_t)v12);
  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
  return v19 == v20;
}

- (PFDayOfWeekSchedule)init
{
  result = (PFDayOfWeekSchedule *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t v2 = (char *)self + OBJC_IVAR___PFDayOfWeekSchedule_calendar;
  uint64_t v3 = sub_1ACE75208();
  uint64_t v4 = *(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8);
  v4(v2, v3);
}

@end