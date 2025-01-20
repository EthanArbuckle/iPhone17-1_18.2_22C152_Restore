@interface scoredRule
- (NSNumber)recipientUniqueID;
- (float)ruleScore;
- (int64_t)compare:(id)a3;
- (int64_t)ruleLabel;
- (scoredRule)initWithLabel:(int64_t)a3 score:(float)a4 recipientUniqueID:(id)a5;
- (void)setRecipientUniqueID:(id)a3;
- (void)setRuleLabel:(int64_t)a3;
- (void)setRuleScore:(float)a3;
@end

@implementation scoredRule

- (scoredRule)initWithLabel:(int64_t)a3 score:(float)a4 recipientUniqueID:(id)a5
{
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)scoredRule;
  v10 = [(scoredRule *)&v13 init];
  v11 = v10;
  if (v10)
  {
    v10->_ruleLabel = a3;
    v10->_ruleScore = a4;
    objc_storeStrong((id *)&v10->_recipientUniqueID, a5);
  }

  return v11;
}

- (int64_t)compare:(id)a3
{
  v4 = NSNumber;
  id v5 = a3;
  [(scoredRule *)self ruleScore];
  v6 = objc_msgSend(v4, "numberWithFloat:");
  v7 = NSNumber;
  [v5 ruleScore];
  int v9 = v8;

  LODWORD(v10) = v9;
  v11 = [v7 numberWithFloat:v10];
  int64_t v12 = [v6 compare:v11];

  return v12;
}

- (int64_t)ruleLabel
{
  return self->_ruleLabel;
}

- (void)setRuleLabel:(int64_t)a3
{
  self->_ruleLabel = a3;
}

- (float)ruleScore
{
  return self->_ruleScore;
}

- (void)setRuleScore:(float)a3
{
  self->_ruleScore = a3;
}

- (NSNumber)recipientUniqueID
{
  return self->_recipientUniqueID;
}

- (void)setRecipientUniqueID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end