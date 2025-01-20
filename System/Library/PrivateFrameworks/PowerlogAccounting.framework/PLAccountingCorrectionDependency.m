@interface PLAccountingCorrectionDependency
- (PLAccountingCorrectionDependency)initWithEnergyEvent:(id)a3;
- (PLAccountingEnergyEventEntry)energyEvent;
- (id)ID;
- (id)activationDate;
- (id)range;
- (void)setEnergyEvent:(id)a3;
@end

@implementation PLAccountingCorrectionDependency

- (id)ID
{
  v2 = [(PLAccountingCorrectionDependency *)self energyEvent];
  v3 = [v2 nodeID];

  return v3;
}

- (id)range
{
  v2 = [(PLAccountingCorrectionDependency *)self energyEvent];
  v3 = [v2 range];

  return v3;
}

- (PLAccountingEnergyEventEntry)energyEvent
{
  return (PLAccountingEnergyEventEntry *)objc_getProperty(self, a2, 40, 1);
}

- (id)activationDate
{
  v2 = [(PLAccountingCorrectionDependency *)self energyEvent];
  v3 = [v2 entryDate];

  return v3;
}

- (PLAccountingCorrectionDependency)initWithEnergyEvent:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PLAccountingCorrectionDependency;
  v6 = [(PLAccountingCorrectionDependency *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_energyEvent, a3);
  }

  return v7;
}

- (void)setEnergyEvent:(id)a3
{
}

- (void).cxx_destruct
{
}

@end