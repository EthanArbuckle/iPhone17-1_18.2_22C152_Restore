@interface WRM_iRATProximityRecommendation
- (BOOL)linkIsRecommended;
- (BOOL)linkRecommendationIsValid;
- (WRM_iRATProximityRecommendation)init;
- (WRM_iRATProximityRecommendationLogging)metrics;
- (int)RecommendationType;
- (void)dealloc;
- (void)setLinkIsRecommended:(BOOL)a3;
- (void)setLinkRecommendationIsValid:(BOOL)a3;
- (void)setMetrics:(id)a3;
- (void)setRecommendationType:(int)a3;
@end

@implementation WRM_iRATProximityRecommendation

- (WRM_iRATProximityRecommendation)init
{
  v4.receiver = self;
  v4.super_class = (Class)WRM_iRATProximityRecommendation;
  v2 = [(WRM_iRATProximityRecommendation *)&v4 init];
  if (v2) {
    [(WRM_iRATProximityRecommendation *)v2 setMetrics:objc_alloc_init(WRM_iRATProximityRecommendationLogging)];
  }
  return v2;
}

- (void)dealloc
{
  if ([(WRM_iRATProximityRecommendation *)self metrics])
  {

    [(WRM_iRATProximityRecommendation *)self setMetrics:0];
  }
  v3.receiver = self;
  v3.super_class = (Class)WRM_iRATProximityRecommendation;
  [(WRM_iRATProximityRecommendation *)&v3 dealloc];
}

- (int)RecommendationType
{
  return self->_RecommendationType;
}

- (void)setRecommendationType:(int)a3
{
  self->_RecommendationType = a3;
}

- (BOOL)linkRecommendationIsValid
{
  return self->_linkRecommendationIsValid;
}

- (void)setLinkRecommendationIsValid:(BOOL)a3
{
  self->_linkRecommendationIsValid = a3;
}

- (BOOL)linkIsRecommended
{
  return self->_linkIsRecommended;
}

- (void)setLinkIsRecommended:(BOOL)a3
{
  self->_linkIsRecommended = a3;
}

- (WRM_iRATProximityRecommendationLogging)metrics
{
  return self->_metrics;
}

- (void)setMetrics:(id)a3
{
}

@end