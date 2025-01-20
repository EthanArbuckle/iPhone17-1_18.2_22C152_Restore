@interface MentalHealthDemoDataGenerator
+ (BOOL)supportsSecureCoding;
- (_TtC18MentalHealthDaemon29MentalHealthDemoDataGenerator)init;
- (_TtC18MentalHealthDaemon29MentalHealthDemoDataGenerator)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)generateFirstRunObjectsForDemoPerson:(id)a3 firstDate:(id)a4 objectCollection:(id)a5;
- (void)generateObjectsForDemoPerson:(id)a3 fromTime:(double)a4 toTime:(double)a5 currentDate:(id)a6 objectCollection:(id)a7;
- (void)setDemoDataGenerationContextWithProfile:(id)a3 generatorState:(id)a4;
@end

@implementation MentalHealthDemoDataGenerator

- (_TtC18MentalHealthDaemon29MentalHealthDemoDataGenerator)init
{
  return (_TtC18MentalHealthDaemon29MentalHealthDemoDataGenerator *)sub_255F4218C();
}

- (void)setDemoDataGenerationContextWithProfile:(id)a3 generatorState:(id)a4
{
  swift_unknownObjectWeakAssign();
  id v7 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC18MentalHealthDaemon29MentalHealthDemoDataGenerator_generatorState);
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC18MentalHealthDaemon29MentalHealthDemoDataGenerator_generatorState) = (Class)a4;
  id v6 = a4;
}

- (void)generateFirstRunObjectsForDemoPerson:(id)a3 firstDate:(id)a4 objectCollection:(id)a5
{
  uint64_t v5 = sub_255F497F0();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388]();
  v8 = (char *)&v9 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_255F497E0();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (void)generateObjectsForDemoPerson:(id)a3 fromTime:(double)a4 toTime:(double)a5 currentDate:(id)a6 objectCollection:(id)a7
{
  uint64_t v11 = sub_255F497F0();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  v14 = (char *)&v18 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_255F497E0();
  id v15 = a3;
  id v16 = a7;
  v17 = self;
  sub_255F44A7C((uint64_t)v14, v16, a5);

  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_255F43CE0(v4);
}

- (_TtC18MentalHealthDaemon29MentalHealthDemoDataGenerator)initWithCoder:(id)a3
{
  id v3 = a3;
  id v4 = (_TtC18MentalHealthDaemon29MentalHealthDemoDataGenerator *)sub_255F44D84(v3);

  return v4;
}

- (void).cxx_destruct
{
  id v3 = (char *)self + OBJC_IVAR____TtC18MentalHealthDaemon29MentalHealthDemoDataGenerator_calendar;
  uint64_t v4 = sub_255F49860();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_unknownObjectWeakDestroy();
  uint64_t v5 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC18MentalHealthDaemon29MentalHealthDemoDataGenerator_generatorState);
}

@end