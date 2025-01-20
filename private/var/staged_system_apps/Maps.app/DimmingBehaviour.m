@interface DimmingBehaviour
- (DimmingBehaviour)initWithDimming:(id)a3 threshold:(id)a4;
- (double)overlayContainer:(id)a3 dimmingPercentageForCurrentContaineeWithNewHeight:(double)a4;
- (id)dimming;
- (id)threshold;
- (unint64_t)overlayContainerLayoutForContaineeDimmingDismissal:(id)a3;
@end

@implementation DimmingBehaviour

- (DimmingBehaviour)initWithDimming:(id)a3 threshold:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)DimmingBehaviour;
  v8 = [(DimmingBehaviour *)&v14 init];
  if (v8)
  {
    id v9 = [v6 copy];
    id dimming = v8->_dimming;
    v8->_id dimming = v9;

    id v11 = [v7 copy];
    id threshold = v8->_threshold;
    v8->_id threshold = v11;
  }
  return v8;
}

- (double)overlayContainer:(id)a3 dimmingPercentageForCurrentContaineeWithNewHeight:(double)a4
{
  id v6 = a3;
  id v7 = [(DimmingBehaviour *)self dimming];
  double v8 = ((double (**)(void, id, double))v7)[2](v7, v6, a4);

  return v8;
}

- (unint64_t)overlayContainerLayoutForContaineeDimmingDismissal:(id)a3
{
  id v4 = a3;
  v5 = [(DimmingBehaviour *)self threshold];
  unint64_t v6 = ((uint64_t (**)(void, id))v5)[2](v5, v4);

  return v6;
}

- (id)dimming
{
  return self->_dimming;
}

- (id)threshold
{
  return self->_threshold;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_threshold, 0);

  objc_storeStrong(&self->_dimming, 0);
}

@end