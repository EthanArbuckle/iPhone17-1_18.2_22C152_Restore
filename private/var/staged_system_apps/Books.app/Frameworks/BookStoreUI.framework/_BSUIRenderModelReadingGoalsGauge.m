@interface _BSUIRenderModelReadingGoalsGauge
- (BOOL)handlesAlphaForFinalAppearance;
- (BOOL)handlesAlphaForInitialAppearance;
- (BOOL)isEqualToRenderModel:(id)a3;
- (BSUIReadingGoalsGaugeMetrics)metrics;
- (CGSize)size;
- (TUIAnimationGroupCollection)animationGroups;
- (TUIIdentifier)identifier;
- (unint64_t)hash;
- (unint64_t)kind;
- (void)setAnimationGroups:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setMetrics:(id)a3;
- (void)setSize:(CGSize)a3;
@end

@implementation _BSUIRenderModelReadingGoalsGauge

- (unint64_t)kind
{
  return 10;
}

- (BOOL)isEqualToRenderModel:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  v5 = BUDynamicCast();

  if (TUIRenderModelIsEqualToRenderModel())
  {
    v6 = [(_BSUIRenderModelReadingGoalsGauge *)self metrics];
    v7 = [v5 metrics];
    unsigned __int8 v8 = [v6 isEqual:v7];
  }
  else
  {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (BOOL)handlesAlphaForFinalAppearance
{
  return 0;
}

- (BOOL)handlesAlphaForInitialAppearance
{
  return 0;
}

- (unint64_t)hash
{
  v2 = [(_BSUIRenderModelReadingGoalsGauge *)self identifier];
  unint64_t v3 = TUIIdentifierHash();

  return v3;
}

- (TUIIdentifier)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setSize:(CGSize)a3
{
  self->_size = a3;
}

- (TUIAnimationGroupCollection)animationGroups
{
  return self->_animationGroups;
}

- (void)setAnimationGroups:(id)a3
{
}

- (BSUIReadingGoalsGaugeMetrics)metrics
{
  return self->_metrics;
}

- (void)setMetrics:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_animationGroups, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end