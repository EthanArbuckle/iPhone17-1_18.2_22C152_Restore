@interface ThermalLevelCC
- (ThermalLevelCC)initWithProduct:(id)a3;
- (void)defaultAction;
- (void)refreshFunctionalTelemetry;
@end

@implementation ThermalLevelCC

- (void)refreshFunctionalTelemetry
{
  unsigned int previousValue = self->super.previousValue;
  if (previousValue == 100) {
    unsigned int v3 = 0;
  }
  else {
    unsigned int v3 = (100 - previousValue) / 0xA + 1;
  }
  HIDWORD(self->product) = v3;
}

- (ThermalLevelCC)initWithProduct:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)ThermalLevelCC;
  v4 = [(ComponentControl *)&v7 initWithCC:5 :0];
  v5 = (ThermalLevelCC *)v4;
  if (v4)
  {
    *((_DWORD *)v4 + 18) = 100;
    *(void *)(v4 + 140) = a3;
    *((_DWORD *)v4 + 22) = 2;
    *((_DWORD *)v4 + 37) = 0;
    *((_DWORD *)v4 + 38) = 0;
    *((void *)v4 + 6) = CFStringCreateWithFormat(0, 0, @"%d Thermallevel ", 5);
  }
  return v5;
}

- (void)defaultAction
{
  if (HIDWORD(self->product) != self->currThermLevel)
  {
    [*(id *)(&self->super.currentPower + 1) setComponentThermalStatusLevel:];
    self->currThermLevel = HIDWORD(self->product);
  }
}

@end