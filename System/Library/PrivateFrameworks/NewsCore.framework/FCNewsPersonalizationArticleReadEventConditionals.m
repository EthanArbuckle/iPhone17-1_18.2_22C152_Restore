@interface FCNewsPersonalizationArticleReadEventConditionals
- (FCNewsPersonalizationArticleReadEventConditionals)initWithDictionary:(id)a3;
- (double)minimumDuration;
- (id)description;
- (int64_t)minimumScrollEventCount;
- (void)setMinimumDuration:(double)a3;
- (void)setMinimumScrollEventCount:(int64_t)a3;
@end

@implementation FCNewsPersonalizationArticleReadEventConditionals

- (FCNewsPersonalizationArticleReadEventConditionals)initWithDictionary:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)FCNewsPersonalizationArticleReadEventConditionals;
  v5 = [(FCNewsPersonalizationArticleReadEventConditionals *)&v7 init];
  if (v5)
  {
    v5->_minimumDuration = FCAppConfigurationDoubleValue(v4, @"minimumDuration", 0.0);
    v5->_minimumScrollEventCount = FCAppConfigurationIntegerValue(v4, @"minimumScrollEventCount", 0);
  }

  return v5;
}

- (double)minimumDuration
{
  return self->_minimumDuration;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@; %p", objc_opt_class(), self];
  [(FCNewsPersonalizationArticleReadEventConditionals *)self minimumDuration];
  objc_msgSend(v3, "appendFormat:", @"; minimumDuration: %f", v4);
  objc_msgSend(v3, "appendFormat:", @"; minimumScrollEventCount: %lld",
    [(FCNewsPersonalizationArticleReadEventConditionals *)self minimumScrollEventCount]);
  [v3 appendString:@">"];
  return v3;
}

- (void)setMinimumDuration:(double)a3
{
  self->_minimumDuration = a3;
}

- (int64_t)minimumScrollEventCount
{
  return self->_minimumScrollEventCount;
}

- (void)setMinimumScrollEventCount:(int64_t)a3
{
  self->_minimumScrollEventCount = a3;
}

@end