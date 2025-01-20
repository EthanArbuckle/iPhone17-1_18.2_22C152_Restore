@interface PLQuickEnergySnapshot
- (NSDate)timestamp;
- (PLQuickEnergySnapshot)initWithEnergies:(double)a3 andNetworkEnergy:(double)a4;
- (double)computeEnergyDiff:(id)a3;
- (double)cpuEnergy;
- (double)getTotalEnergy;
- (double)networkEnergy;
- (id)description;
- (void)setCpuEnergy:(double)a3;
- (void)setNetworkEnergy:(double)a3;
- (void)setTimestamp:(id)a3;
@end

@implementation PLQuickEnergySnapshot

- (void).cxx_destruct
{
}

- (PLQuickEnergySnapshot)initWithEnergies:(double)a3 andNetworkEnergy:(double)a4
{
  v10.receiver = self;
  v10.super_class = (Class)PLQuickEnergySnapshot;
  v6 = [(PLQuickEnergySnapshot *)&v10 init];
  v7 = v6;
  if (v6)
  {
    [(PLQuickEnergySnapshot *)v6 setCpuEnergy:a3];
    [(PLQuickEnergySnapshot *)v7 setNetworkEnergy:a4];
    v8 = [MEMORY[0x1E4F1C9C8] date];
    [(PLQuickEnergySnapshot *)v7 setTimestamp:v8];
  }
  return v7;
}

- (void)setTimestamp:(id)a3
{
}

- (void)setNetworkEnergy:(double)a3
{
  self->_networkEnergy = a3;
}

- (void)setCpuEnergy:(double)a3
{
  self->_cpuEnergy = a3;
}

- (double)computeEnergyDiff:(id)a3
{
  id v4 = a3;
  [(PLQuickEnergySnapshot *)self cpuEnergy];
  double v6 = v5;
  [v4 cpuEnergy];
  double v8 = v6 - v7;
  [(PLQuickEnergySnapshot *)self networkEnergy];
  double v10 = v8 + v9;
  [v4 networkEnergy];
  double v12 = v11;

  return v10 - v12;
}

- (double)networkEnergy
{
  return self->_networkEnergy;
}

- (double)cpuEnergy
{
  return self->_cpuEnergy;
}

- (double)getTotalEnergy
{
  [(PLQuickEnergySnapshot *)self cpuEnergy];
  double v4 = v3;
  [(PLQuickEnergySnapshot *)self networkEnergy];
  return v4 + v5;
}

- (id)description
{
  double v3 = NSString;
  double v4 = [(PLQuickEnergySnapshot *)self timestamp];
  [(PLQuickEnergySnapshot *)self cpuEnergy];
  uint64_t v6 = v5;
  [(PLQuickEnergySnapshot *)self networkEnergy];
  double v8 = [v3 stringWithFormat:@"timestamp=%@, cpuEnergy=%f, networkEnergy=%f", v4, v6, v7];

  return v8;
}

- (NSDate)timestamp
{
  return (NSDate *)objc_getProperty(self, a2, 8, 1);
}

@end