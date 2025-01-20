@interface TPSAnalyticsEventRuleMatched
+ (BOOL)supportsSecureCoding;
+ (id)eventWithTipID:(id)a3 correlationID:(id)a4 ruleID:(id)a5;
- (NSString)correlationID;
- (NSString)ruleID;
- (NSString)tipID;
- (TPSAnalyticsEventRuleMatched)initWithCoder:(id)a3;
- (id)_initWithTipID:(id)a3 correlationID:(id)a4 ruleID:(id)a5;
- (id)eventName;
- (id)mutableAnalyticsEventRepresentation;
- (void)encodeWithCoder:(id)a3;
@end

@implementation TPSAnalyticsEventRuleMatched

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TPSAnalyticsEventRuleMatched)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)TPSAnalyticsEventRuleMatched;
  v5 = [(TPSAnalyticsEvent *)&v13 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"tip_ID"];
    tipID = v5->_tipID;
    v5->_tipID = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"tip_correlation_ID"];
    correlationID = v5->_correlationID;
    v5->_correlationID = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"rule_ID"];
    ruleID = v5->_ruleID;
    v5->_ruleID = (NSString *)v10;
  }
  return v5;
}

- (id)_initWithTipID:(id)a3 correlationID:(id)a4 ruleID:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)TPSAnalyticsEventRuleMatched;
  v12 = [(TPSAnalyticsEvent *)&v15 initWithDate:0];
  p_isa = (id *)&v12->super.super.isa;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_tipID, a3);
    objc_storeStrong(p_isa + 5, a4);
    objc_storeStrong(p_isa + 6, a5);
  }

  return p_isa;
}

+ (id)eventWithTipID:(id)a3 correlationID:(id)a4 ruleID:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = (void *)[objc_alloc((Class)a1) _initWithTipID:v10 correlationID:v9 ruleID:v8];

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TPSAnalyticsEventRuleMatched;
  id v4 = a3;
  [(TPSAnalyticsEvent *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_tipID, @"tip_ID", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_correlationID forKey:@"tip_correlation_ID"];
  [v4 encodeObject:self->_ruleID forKey:@"rule_ID"];
}

- (id)eventName
{
  return (id)[NSString stringWithFormat:@"%@.%@", @"com.apple.tips", @"rules_matched"];
}

- (id)mutableAnalyticsEventRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  [v3 setObject:self->_tipID forKeyedSubscript:@"tip_ID"];
  [v3 setObject:self->_correlationID forKeyedSubscript:@"tip_correlation_ID"];
  [v3 setObject:self->_ruleID forKeyedSubscript:@"rule_ID"];
  return v3;
}

- (NSString)tipID
{
  return self->_tipID;
}

- (NSString)correlationID
{
  return self->_correlationID;
}

- (NSString)ruleID
{
  return self->_ruleID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ruleID, 0);
  objc_storeStrong((id *)&self->_correlationID, 0);
  objc_storeStrong((id *)&self->_tipID, 0);
}

@end