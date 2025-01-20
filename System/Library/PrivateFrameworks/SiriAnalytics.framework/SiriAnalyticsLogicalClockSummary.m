@interface SiriAnalyticsLogicalClockSummary
+ (BOOL)supportsSecureCoding;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- (SiriAnalyticsLogicalClockSummary)init;
- (SiriAnalyticsLogicalClockSummary)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SiriAnalyticsLogicalClockSummary

+ (BOOL)supportsSecureCoding
{
  return static LogicalClockSummary.supportsSecureCoding.getter() & 1;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
}

- (SiriAnalyticsLogicalClockSummary)initWithCoder:(id)a3
{
  id v3 = a3;
  LogicalClockSummary.init(coder:)();
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1A2B8DD7C(v4);
}

- (SiriAnalyticsLogicalClockSummary)init
{
}

- (void).cxx_destruct
{
  sub_1A2C0CE20();
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_25();
  v2();
  swift_bridgeObjectRelease();
}

@end