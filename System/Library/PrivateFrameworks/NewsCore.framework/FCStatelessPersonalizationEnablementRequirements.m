@interface FCStatelessPersonalizationEnablementRequirements
- (FCStatelessPersonalizationEnablementRequirements)initWithDictionary:(id)a3;
- (id)description;
- (int64_t)minimumAggregateCount;
- (int64_t)minimumEventCount;
- (void)setMinimumAggregateCount:(int64_t)a3;
- (void)setMinimumEventCount:(int64_t)a3;
@end

@implementation FCStatelessPersonalizationEnablementRequirements

- (int64_t)minimumEventCount
{
  return self->_minimumEventCount;
}

- (FCStatelessPersonalizationEnablementRequirements)initWithDictionary:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)FCStatelessPersonalizationEnablementRequirements;
  v5 = [(FCStatelessPersonalizationEnablementRequirements *)&v15 init];
  if (v5)
  {
    uint64_t v6 = FCAppConfigurationNumberValue(v4, @"minimumAggregateCount", 0);
    uint64_t v7 = FCAppConfigurationNumberValue(v4, @"minumumEventCount", 0);
    if (v6 | v7)
    {
      if (v6) {
        uint64_t v8 = [(id)v6 longLongValue];
      }
      else {
        uint64_t v8 = -1;
      }
      v5->_minimumAggregateCount = v8;
      if (NFInternalBuild()
        && (NewsCoreUserDefaults(),
            v9 = objc_claimAutoreleasedReturnValue(),
            uint64_t v10 = [v9 integerForKey:@"news.features.statelessPersonalization"],
            v9,
            v10 == 1))
      {
        v11 = FCStatelessPersonalizationLog;
        if (os_log_type_enabled((os_log_t)FCStatelessPersonalizationLog, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v14 = 0;
          _os_log_impl(&dword_1A460D000, v11, OS_LOG_TYPE_DEFAULT, "Stateless Personalization Enabled, overriding enablement requirements to have minimum event count of 10", v14, 2u);
        }
        v5->_minimumEventCount = 10;
      }
      else
      {
        if (v7) {
          uint64_t v12 = [(id)v7 longLongValue];
        }
        else {
          uint64_t v12 = -1;
        }
        v5->_minimumEventCount = v12;
      }
    }
    else
    {

      v5 = 0;
    }
  }
  return v5;
}

- (int64_t)minimumAggregateCount
{
  return self->_minimumAggregateCount;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@; %p", objc_opt_class(), self];
  objc_msgSend(v3, "appendFormat:", @"; minimumAggregateCount: %lld",
    [(FCStatelessPersonalizationEnablementRequirements *)self minimumAggregateCount]);
  objc_msgSend(v3, "appendFormat:", @"; minimumEventCount: %lld",
    [(FCStatelessPersonalizationEnablementRequirements *)self minimumEventCount]);
  [v3 appendString:@">"];
  return v3;
}

- (void)setMinimumAggregateCount:(int64_t)a3
{
  self->_minimumAggregateCount = a3;
}

- (void)setMinimumEventCount:(int64_t)a3
{
  self->_minimumEventCount = a3;
}

@end