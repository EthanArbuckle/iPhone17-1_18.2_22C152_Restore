@interface SiriAnalyticsTagShim
+ (BOOL)supportsSecureCoding;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- (NSString)description;
- (SiriAnalyticsTagShim)init;
- (SiriAnalyticsTagShim)initWithCoder:(id)a3;
- (SiriAnalyticsTagShim)initWithConditionType:(int)a3 componentId:(id)a4 componentName:(int)a5 joined:(BOOL)a6;
- (SiriAnalyticsTagShim)initWithConditionType:(int)a3 end:(unint64_t)a4;
- (SiriAnalyticsTagShim)initWithConditionType:(int)a3 requestId:(id)a4 joined:(BOOL)a5;
- (SiriAnalyticsTagShim)initWithConditionType:(int)a3 start:(unint64_t)a4;
- (SiriAnalyticsTagShim)initWithConditionType:(int)a3 start:(unint64_t)a4 end:(unint64_t)a5;
- (SiriAnalyticsTagShim)initWithConditionTypeAffectingEntireClock:(int)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SiriAnalyticsTagShim

- (SiriAnalyticsTagShim)initWithConditionType:(int)a3 start:(unint64_t)a4 end:(unint64_t)a5
{
  return (SiriAnalyticsTagShim *)TagShim.init(conditionType:start:end:)(*(uint64_t *)&a3, a4, a5);
}

- (SiriAnalyticsTagShim)initWithConditionType:(int)a3 start:(unint64_t)a4
{
  return (SiriAnalyticsTagShim *)TagShim.init(conditionType:start:)(*(uint64_t *)&a3, a4);
}

- (SiriAnalyticsTagShim)initWithConditionType:(int)a3 end:(unint64_t)a4
{
  return (SiriAnalyticsTagShim *)TagShim.init(conditionType:end:)(*(uint64_t *)&a3, a4);
}

- (SiriAnalyticsTagShim)initWithConditionTypeAffectingEntireClock:(int)a3
{
  return (SiriAnalyticsTagShim *)TagShim.init(conditionTypeAffectingEntireClock:)(a3);
}

- (SiriAnalyticsTagShim)initWithConditionType:(int)a3 componentId:(id)a4 componentName:(int)a5 joined:(BOOL)a6
{
  uint64_t v9 = sub_1A2C0CE20();
  MEMORY[0x1F4188790](v9 - 8);
  v11 = (char *)&v13 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A2C0CE00();
  return (SiriAnalyticsTagShim *)TagShim.init(conditionType:componentId:componentName:joined:)(a3, (uint64_t)v11, a5, a6);
}

- (SiriAnalyticsTagShim)initWithConditionType:(int)a3 requestId:(id)a4 joined:(BOOL)a5
{
  uint64_t v6 = *(void *)&a3;
  uint64_t v7 = sub_1A2C0CE20();
  MEMORY[0x1F4188790](v7 - 8);
  uint64_t v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A2C0CE00();
  return (SiriAnalyticsTagShim *)TagShim.init(conditionType:requestId:joined:)(v6, (uint64_t)v9, a5);
}

+ (BOOL)supportsSecureCoding
{
  return static TagShim.supportsSecureCoding.getter() & 1;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1A2BEF29C(v4);
}

- (SiriAnalyticsTagShim)initWithCoder:(id)a3
{
  return (SiriAnalyticsTagShim *)TagShim.init(coder:)(a3);
}

- (NSString)description
{
  v2 = self;
  sub_1A2BEFC3C();

  v3 = (void *)sub_1A2C0D470();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (SiriAnalyticsTagShim)init
{
}

- (void).cxx_destruct
{
  sub_1A2B653F8((uint64_t)self + OBJC_IVAR___SiriAnalyticsTagShim_identifier, &qword_1EB555500);
  v3 = (char *)self + OBJC_IVAR___SiriAnalyticsTagShim_underlying;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v3);
}

@end