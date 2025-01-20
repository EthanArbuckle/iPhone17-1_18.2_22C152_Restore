@interface SiriAnalyticsSensitiveConditionsLedger
- (SiriAnalyticsSensitiveConditionsLedger)init;
- (SiriAnalyticsSensitiveConditionsLedger)initWithClockIdentifier:(id)a3 metastore:(id)a4;
- (void)endWithSensitiveCondition:(int)a3 at:(unint64_t)a4;
- (void)startWithSensitiveCondition:(int)a3 at:(unint64_t)a4;
@end

@implementation SiriAnalyticsSensitiveConditionsLedger

- (SiriAnalyticsSensitiveConditionsLedger)initWithClockIdentifier:(id)a3 metastore:(id)a4
{
  uint64_t v5 = sub_1A2C0CE20();
  MEMORY[0x1F4188790](v5 - 8);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A2C0CE00();
  return (SiriAnalyticsSensitiveConditionsLedger *)SensitiveConditionsLedger.init(clockIdentifier:metastore:)((uint64_t)v7, (uint64_t)a4);
}

- (void)startWithSensitiveCondition:(int)a3 at:(unint64_t)a4
{
  uint64_t v6 = self;
  sub_1A2B81158(a3, a4);
}

- (void)endWithSensitiveCondition:(int)a3 at:(unint64_t)a4
{
  uint64_t v6 = self;
  sub_1A2B81BA4(a3, a4);
}

- (SiriAnalyticsSensitiveConditionsLedger)init
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR___SiriAnalyticsSensitiveConditionsLedger_clockIdentifier;
  sub_1A2C0CE20();
  OUTLINED_FUNCTION_2_9();
  (*(void (**)(char *))(v4 + 8))(v3);
  uint64_t v5 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___SiriAnalyticsSensitiveConditionsLedger_metastore);
}

@end