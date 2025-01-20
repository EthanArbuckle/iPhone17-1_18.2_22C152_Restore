@interface FCNewsPersonalizationFeaturePrior
- (FCNewsPersonalizationFeaturePrior)initWithDictionary:(id)a3;
- (double)clicks;
- (double)impressions;
- (id)description;
- (void)setClicks:(double)a3;
- (void)setImpressions:(double)a3;
@end

@implementation FCNewsPersonalizationFeaturePrior

- (FCNewsPersonalizationFeaturePrior)initWithDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)FCNewsPersonalizationFeaturePrior;
  v5 = [(FCNewsPersonalizationFeaturePrior *)&v10 init];
  if (!v5)
  {
LABEL_5:
    v6 = v5;
    goto LABEL_7;
  }
  FCAppConfigurationNumberValue(v4, @"clicks", 0);
  v6 = (FCNewsPersonalizationFeaturePrior *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    uint64_t v7 = FCAppConfigurationNumberValue(v4, @"impressions", 0);
    if (!v7)
    {

      v6 = 0;
      goto LABEL_7;
    }
    v8 = (void *)v7;
    [(FCNewsPersonalizationFeaturePrior *)v6 doubleValue];
    -[FCNewsPersonalizationFeaturePrior setClicks:](v5, "setClicks:");
    [v8 doubleValue];
    -[FCNewsPersonalizationFeaturePrior setImpressions:](v5, "setImpressions:");

    goto LABEL_5;
  }
LABEL_7:

  return v6;
}

- (void)setImpressions:(double)a3
{
  self->_impressions = a3;
}

- (void)setClicks:(double)a3
{
  self->_clicks = a3;
}

- (double)impressions
{
  return self->_impressions;
}

- (double)clicks
{
  return self->_clicks;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@; %p", objc_opt_class(), self];
  [(FCNewsPersonalizationFeaturePrior *)self clicks];
  objc_msgSend(v3, "appendFormat:", @"; clicks: %f", v4);
  [(FCNewsPersonalizationFeaturePrior *)self impressions];
  objc_msgSend(v3, "appendFormat:", @"; impressions: %f", v5);
  [v3 appendString:@">"];
  return v3;
}

@end