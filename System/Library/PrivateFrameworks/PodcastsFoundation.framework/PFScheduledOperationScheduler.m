@interface PFScheduledOperationScheduler
+ (PFScheduledOperationScheduler)weeklyScheduler;
- (PFScheduledOperationScheduler)init;
- (PFScheduledOperationScheduler)initWithSchedule:(id)a3 scheduleStorage:(id)a4;
- (void)evaluateOperationWithIdentifier:(id)a3 evaluationHandler:(id)a4;
@end

@implementation PFScheduledOperationScheduler

+ (PFScheduledOperationScheduler)weeklyScheduler
{
  if (qword_1EB769550 != -1) {
    swift_once();
  }
  v2 = (void *)qword_1EB76C918;
  return (PFScheduledOperationScheduler *)v2;
}

- (PFScheduledOperationScheduler)initWithSchedule:(id)a3 scheduleStorage:(id)a4
{
  swift_getObjectType();
  swift_getObjectType();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  return (PFScheduledOperationScheduler *)sub_1ACB52D24((uint64_t)a3, (uint64_t)a4, (char *)self);
}

- (void)evaluateOperationWithIdentifier:(id)a3 evaluationHandler:(id)a4
{
  v5 = _Block_copy(a4);
  uint64_t v6 = sub_1ACE761B8();
  uint64_t v8 = v7;
  _Block_copy(v5);
  v9 = self;
  sub_1ACB52E24(v6, v8, (uint64_t)v9, (uint64_t)v5);
  _Block_release(v5);
  _Block_release(v5);

  swift_bridgeObjectRelease();
}

- (PFScheduledOperationScheduler)init
{
  result = (PFScheduledOperationScheduler *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
}

@end