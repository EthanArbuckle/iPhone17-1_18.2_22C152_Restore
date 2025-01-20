@interface _ICQOpportunityBubbleReportingSpecification
- (BOOL)displayRuleServerAlwaysShow;
- (NSDictionary)dimissServerParam;
- (_ICQOpportunityBubbleReportingSpecification)initWithServerDictionary:(id)a3;
- (id)_getDismissReportingRuleFromServerDict:(id)a3;
- (unint64_t)dismissRuleType;
- (unint64_t)displayRuleType;
- (void)_setDisplayRuleFromServerDict:(id)a3;
- (void)setDimissServerParam:(id)a3;
- (void)setDismissRuleType:(unint64_t)a3;
- (void)setDisplayRuleServerAlwaysShow:(BOOL)a3;
- (void)setDisplayRuleType:(unint64_t)a3;
@end

@implementation _ICQOpportunityBubbleReportingSpecification

- (_ICQOpportunityBubbleReportingSpecification)initWithServerDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_ICQOpportunityBubbleReportingSpecification;
  v5 = [(_ICQOpportunityBubbleReportingSpecification *)&v10 init];
  v6 = v5;
  if (v5)
  {
    [(_ICQOpportunityBubbleReportingSpecification *)v5 _setDisplayRuleFromServerDict:v4];
    uint64_t v7 = [(_ICQOpportunityBubbleReportingSpecification *)v6 _getDismissReportingRuleFromServerDict:v4];
    dimissServerParam = v6->_dimissServerParam;
    v6->_dimissServerParam = (NSDictionary *)v7;
  }
  return v6;
}

- (void)_setDisplayRuleFromServerDict:(id)a3
{
  id v7 = [a3 objectForKeyedSubscript:@"rulesForDisplay"];
  id v4 = [v7 objectForKey:@"delegateDecision"];

  if (v4)
  {
    self->_displayRuleType = 1;
  }
  else
  {
    self->_displayRuleType = 2;
    v5 = [v7 objectForKeyedSubscript:@"alwaysShow"];
    int v6 = [v5 isEqualToString:@"true"];

    if (v6) {
      self->_displayRuleServerAlwaysShow = 1;
    }
    else {
      self->_displayRuleServerAlwaysShow = 0;
    }
  }
}

- (id)_getDismissReportingRuleFromServerDict:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = [a3 objectForKeyedSubscript:@"onDismiss"];
  v5 = [v4 objectForKeyedSubscript:@"onDismiss"];
  int v6 = [v5 isEqualToString:@"UNIFIED_MESSAGING"];

  if (v6)
  {
    self->_dismissRuleType = 1;
LABEL_4:
    id v7 = v4;
    goto LABEL_10;
  }
  self->_dismissRuleType = 2;
  objc_storeStrong((id *)&self->_dimissServerParam, v4);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_4;
  }
  if (v4)
  {
    v8 = _ICQGetLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = (objc_class *)objc_opt_class();
      int v11 = 136315394;
      Name = class_getName(v9);
      __int16 v13 = 2112;
      v14 = v4;
      _os_log_impl(&dword_1D5851000, v8, OS_LOG_TYPE_DEFAULT, "GUARD_OBJECT_CLASS: expected %s, got %@", (uint8_t *)&v11, 0x16u);
    }
  }
  id v7 = 0;
LABEL_10:

  return v7;
}

- (NSDictionary)dimissServerParam
{
  return self->_dimissServerParam;
}

- (void)setDimissServerParam:(id)a3
{
}

- (unint64_t)displayRuleType
{
  return self->_displayRuleType;
}

- (void)setDisplayRuleType:(unint64_t)a3
{
  self->_displayRuleType = a3;
}

- (unint64_t)dismissRuleType
{
  return self->_dismissRuleType;
}

- (void)setDismissRuleType:(unint64_t)a3
{
  self->_dismissRuleType = a3;
}

- (BOOL)displayRuleServerAlwaysShow
{
  return self->_displayRuleServerAlwaysShow;
}

- (void)setDisplayRuleServerAlwaysShow:(BOOL)a3
{
  self->_displayRuleServerAlwaysShow = a3;
}

- (void).cxx_destruct
{
}

@end