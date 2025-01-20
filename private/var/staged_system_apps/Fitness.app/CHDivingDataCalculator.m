@interface CHDivingDataCalculator
- (CHDivingDataCalculator)init;
- (CHDivingDataCalculator)initWithHealthStore:(id)a3 diveSession:(id)a4 formattingManager:(id)a5;
- (CHDivingDataCalculatorDelegate)delegate;
- (void)setDelegate:(id)a3;
@end

@implementation CHDivingDataCalculator

- (CHDivingDataCalculatorDelegate)delegate
{
  swift_beginAccess();
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (CHDivingDataCalculatorDelegate *)Strong;
}

- (void)setDelegate:(id)a3
{
}

- (CHDivingDataCalculator)initWithHealthStore:(id)a3 diveSession:(id)a4 formattingManager:(id)a5
{
  return (CHDivingDataCalculator *)sub_10068C368(a3, a4, a5);
}

- (CHDivingDataCalculator)init
{
  result = (CHDivingDataCalculator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_10019B9F8((uint64_t)self + OBJC_IVAR___CHDivingDataCalculator_delegate);

  v3 = (char *)self + OBJC_IVAR___CHDivingDataCalculator__metrics;
  uint64_t v4 = sub_1000AFA94(&qword_100968168);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end