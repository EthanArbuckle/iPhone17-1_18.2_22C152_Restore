@interface PLAccountingDistributionDependency
- (PLAccountingDistributionDependency)initWithDistributionEvent:(id)a3;
- (PLAccountingDistributionEventEntry)distributionEvent;
- (id)ID;
- (id)activationDate;
- (id)range;
- (void)setDistributionEvent:(id)a3;
- (void)setRange:(id)a3;
@end

@implementation PLAccountingDistributionDependency

- (id)activationDate
{
  v2 = [(PLAccountingDistributionDependency *)self distributionEvent];
  v3 = [v2 entryDate];

  return v3;
}

- (id)range
{
  v2 = [(PLAccountingDistributionDependency *)self distributionEvent];
  v3 = [v2 range];

  return v3;
}

- (PLAccountingDistributionEventEntry)distributionEvent
{
  return (PLAccountingDistributionEventEntry *)objc_getProperty(self, a2, 40, 1);
}

- (id)ID
{
  v2 = [(PLAccountingDistributionDependency *)self distributionEvent];
  v3 = [v2 distributionID];

  return v3;
}

- (void)setRange:(id)a3
{
  id v4 = a3;
  id v5 = [(PLAccountingDistributionDependency *)self distributionEvent];
  [v5 setRange:v4];
}

- (PLAccountingDistributionDependency)initWithDistributionEvent:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PLAccountingDistributionDependency;
  v6 = [(PLAccountingDistributionDependency *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_distributionEvent, a3);
  }

  return v7;
}

- (void).cxx_destruct
{
}

- (void)setDistributionEvent:(id)a3
{
}

@end