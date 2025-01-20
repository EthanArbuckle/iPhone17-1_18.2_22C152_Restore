@interface PAEKeyerSetupUtil
- (BOOL)addTolerance;
- (BOOL)autoScale;
- (BOOL)defineEdge;
- (BOOL)keyerActiveAt:(id)a3;
- (BOOL)tight;
- (PAEKeyerSetupUtil)initWithAPIManager:(id)a3 colorPrimaries:(int)a4 atTime:(id)a5;
- (PAEKeyerSetupUtil)initWithOMSamples:(void *)a3 colorPrimaries:(int)a4 atTime:(id)a5;
- (double)autoAdjustSoftGap;
- (double)autoKeySoftness;
- (double)highlightsGain;
- (double)shadowsGain;
- (double)simpleKeyAmount;
- (double)spreadGain;
- (void)dealloc;
- (void)omKeyer;
@end

@implementation PAEKeyerSetupUtil

- (PAEKeyerSetupUtil)initWithAPIManager:(id)a3 colorPrimaries:(int)a4 atTime:(id)a5
{
  v6.receiver = self;
  v6.super_class = (Class)PAEKeyerSetupUtil;
  if ([(PAEKeyerSetupUtil *)&v6 init]) {
    operator new();
  }
  return 0;
}

- (PAEKeyerSetupUtil)initWithOMSamples:(void *)a3 colorPrimaries:(int)a4 atTime:(id)a5
{
  v8.receiver = self;
  v8.super_class = (Class)PAEKeyerSetupUtil;
  objc_super v6 = [(PAEKeyerSetupUtil *)&v8 init];
  if (v6)
  {
    v6->_omSamples = a3;
    operator new();
  }
  return 0;
}

- (void)dealloc
{
  omKeyer = self->_omKeyer;
  if (omKeyer) {
    (*(void (**)(void *, SEL))(*(void *)omKeyer + 8))(omKeyer, a2);
  }

  v4.receiver = self;
  v4.super_class = (Class)PAEKeyerSetupUtil;
  [(PAEKeyerSetupUtil *)&v4 dealloc];
}

- (BOOL)tight
{
  return 0;
}

- (double)autoAdjustSoftGap
{
  return 9.0;
}

- (double)simpleKeyAmount
{
  return 0.0;
}

- (double)autoKeySoftness
{
  return 9.0;
}

- (double)shadowsGain
{
  return 2.5;
}

- (double)highlightsGain
{
  return 2.5;
}

- (double)spreadGain
{
  return 1.0;
}

- (BOOL)addTolerance
{
  return 1;
}

- (BOOL)defineEdge
{
  return 0;
}

- (BOOL)autoScale
{
  return 0;
}

- (BOOL)keyerActiveAt:(id)a3
{
  return 1;
}

- (void)omKeyer
{
  return self->_omKeyer;
}

@end