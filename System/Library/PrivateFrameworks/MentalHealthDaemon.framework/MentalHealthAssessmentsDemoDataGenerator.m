@interface MentalHealthAssessmentsDemoDataGenerator
+ (BOOL)supportsSecureCoding;
- (_TtC18MentalHealthDaemon40MentalHealthAssessmentsDemoDataGenerator)init;
- (_TtC18MentalHealthDaemon40MentalHealthAssessmentsDemoDataGenerator)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)generateFirstRunObjectsForDemoPerson:(id)a3 firstDate:(id)a4 objectCollection:(id)a5;
- (void)generateObjectsForDemoPerson:(id)a3 fromTime:(double)a4 toTime:(double)a5 currentDate:(id)a6 objectCollection:(id)a7;
- (void)setDemoDataGenerationContextWithProfile:(id)a3 generatorState:(id)a4;
@end

@implementation MentalHealthAssessmentsDemoDataGenerator

- (_TtC18MentalHealthDaemon40MentalHealthAssessmentsDemoDataGenerator)init
{
  return (_TtC18MentalHealthDaemon40MentalHealthAssessmentsDemoDataGenerator *)sub_255F45728();
}

- (void)setDemoDataGenerationContextWithProfile:(id)a3 generatorState:(id)a4
{
  swift_unknownObjectWeakAssign();
  id v7 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC18MentalHealthDaemon40MentalHealthAssessmentsDemoDataGenerator_generatorState);
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC18MentalHealthDaemon40MentalHealthAssessmentsDemoDataGenerator_generatorState) = (Class)a4;
  id v6 = a4;
}

- (void)generateFirstRunObjectsForDemoPerson:(id)a3 firstDate:(id)a4 objectCollection:(id)a5
{
  uint64_t v8 = sub_255F497F0();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_255F497E0();
  id v12 = a3;
  id v13 = a5;
  v14 = self;
  sub_255F472AC();

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
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
  sub_255F47C84((uint64_t)v14, v16, a5);

  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  if (self->_anon_0[OBJC_IVAR____TtC18MentalHealthDaemon40MentalHealthAssessmentsDemoDataGenerator_nextSampleTime])
  {
    id v5 = a3;
    id v6 = self;
    uint64_t v7 = 0;
  }
  else
  {
    id v8 = a3;
    uint64_t v9 = self;
    uint64_t v7 = sub_255F49910();
  }
  id v10 = (id)sub_255F498C0();
  objc_msgSend(a3, sel_encodeObject_forKey_, v7, v10);

  swift_unknownObjectRelease();
}

- (_TtC18MentalHealthDaemon40MentalHealthAssessmentsDemoDataGenerator)initWithCoder:(id)a3
{
  id v3 = a3;
  v4 = (_TtC18MentalHealthDaemon40MentalHealthAssessmentsDemoDataGenerator *)sub_255F48074(v3);

  return v4;
}

- (void).cxx_destruct
{
  id v3 = (char *)self + OBJC_IVAR____TtC18MentalHealthDaemon40MentalHealthAssessmentsDemoDataGenerator_calendar;
  uint64_t v4 = sub_255F49860();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_unknownObjectWeakDestroy();
  id v5 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC18MentalHealthDaemon40MentalHealthAssessmentsDemoDataGenerator_generatorState);
}

@end