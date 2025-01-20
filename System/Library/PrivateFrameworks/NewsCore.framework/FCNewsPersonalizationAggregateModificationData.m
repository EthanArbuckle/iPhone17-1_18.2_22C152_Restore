@interface FCNewsPersonalizationAggregateModificationData
- (FCNewsPersonalizationAggregateModificationData)initWithDictionary:(id)a3;
- (double)clicks;
- (double)impressions;
- (id)description;
- (void)setClicks:(double)a3;
- (void)setImpressions:(double)a3;
@end

@implementation FCNewsPersonalizationAggregateModificationData

- (FCNewsPersonalizationAggregateModificationData)initWithDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)FCNewsPersonalizationAggregateModificationData;
  v5 = [(FCNewsPersonalizationAggregateModificationData *)&v12 init];
  if (!v5)
  {
LABEL_5:
    v6 = v5;
    goto LABEL_7;
  }
  FCAppConfigurationNumberValue(v4, @"clicks", 0);
  v6 = (FCNewsPersonalizationAggregateModificationData *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    uint64_t v7 = FCAppConfigurationNumberValue(v4, @"impressions", 0);
    if (!v7)
    {

      v6 = 0;
      goto LABEL_7;
    }
    v8 = (void *)v7;
    [(FCNewsPersonalizationAggregateModificationData *)v6 doubleValue];
    v5->_clicks = v9;
    [v8 doubleValue];
    v5->_impressions = v10;

    goto LABEL_5;
  }
LABEL_7:

  return v6;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@; %p", objc_opt_class(), self];
  [(FCNewsPersonalizationAggregateModificationData *)self clicks];
  objc_msgSend(v3, "appendFormat:", @"; clicks: %f", v4);
  [(FCNewsPersonalizationAggregateModificationData *)self impressions];
  objc_msgSend(v3, "appendFormat:", @"; impressions: %f", v5);
  [v3 appendString:@">"];
  return v3;
}

- (double)clicks
{
  return self->_clicks;
}

- (void)setClicks:(double)a3
{
  self->_clicks = a3;
}

- (double)impressions
{
  return self->_impressions;
}

- (void)setImpressions:(double)a3
{
  self->_impressions = a3;
}

@end