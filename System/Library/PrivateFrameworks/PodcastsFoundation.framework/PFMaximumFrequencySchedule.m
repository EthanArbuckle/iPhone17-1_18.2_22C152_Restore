@interface PFMaximumFrequencySchedule
- (BOOL)shouldExecuteOn:(id)a3 previousExecution:(id)a4;
- (PFMaximumFrequencySchedule)init;
- (PFMaximumFrequencySchedule)initWithFrequency:(int64_t)a3;
- (PFMaximumFrequencySchedule)initWithInterval:(double)a3;
@end

@implementation PFMaximumFrequencySchedule

- (PFMaximumFrequencySchedule)initWithFrequency:(int64_t)a3
{
  ScheduleFrequency.interval.getter(a3);
  return -[PFMaximumFrequencySchedule initWithInterval:](self, sel_initWithInterval_);
}

- (PFMaximumFrequencySchedule)initWithInterval:(double)a3
{
  *(double *)((char *)&self->super.isa + OBJC_IVAR___PFMaximumFrequencySchedule_interval) = a3;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for MaximumFrequencySchedule();
  return [(PFMaximumFrequencySchedule *)&v4 init];
}

- (BOOL)shouldExecuteOn:(id)a3 previousExecution:(id)a4
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB773140);
  MEMORY[0x1F4188790](v6 - 8);
  v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_1ACE750A8();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x1F4188790](v9);
  v12 = (char *)&v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1ACE75078();
  if (a4)
  {
    sub_1ACE75078();
    uint64_t v13 = 0;
  }
  else
  {
    uint64_t v13 = 1;
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56))(v8, v13, 1, v9);
  v14 = self;
  BOOL v15 = sub_1ACB76FC4((uint64_t)v12, (uint64_t)v8);

  sub_1ACA3E034((uint64_t)v8);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  return v15;
}

- (PFMaximumFrequencySchedule)init
{
  result = (PFMaximumFrequencySchedule *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end