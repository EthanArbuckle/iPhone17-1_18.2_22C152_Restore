@interface MTObject
- (MTMetricsKitTemplate)metricsKit;
- (MTObject)initWithMetricsKit:(id)a3;
- (void)setMetricsKit:(id)a3;
@end

@implementation MTObject

- (void).cxx_destruct
{
}

- (MTMetricsKitTemplate)metricsKit
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_metricsKit);

  return (MTMetricsKitTemplate *)WeakRetained;
}

- (MTObject)initWithMetricsKit:(id)a3
{
  id v4 = a3;
  v5 = [(MTObject *)self init];
  v6 = v5;
  if (v5) {
    [(MTObject *)v5 setMetricsKit:v4];
  }

  return v6;
}

- (void)setMetricsKit:(id)a3
{
}

@end