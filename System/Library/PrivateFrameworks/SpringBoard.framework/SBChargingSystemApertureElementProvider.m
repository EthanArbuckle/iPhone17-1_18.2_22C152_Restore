@interface SBChargingSystemApertureElementProvider
- (NSString)elementIdentifier;
- (SBChargingSystemApertureElementProvider)init;
- (id)powerElementWithBatteryCapacity:(double)a3;
@end

@implementation SBChargingSystemApertureElementProvider

- (SBChargingSystemApertureElementProvider)init
{
  v7.receiver = self;
  v7.super_class = (Class)SBChargingSystemApertureElementProvider;
  v2 = [(SBChargingSystemApertureElementProvider *)&v7 init];
  if (v2)
  {
    v3 = (objc_class *)objc_opt_class();
    uint64_t v4 = NSStringFromClass(v3);
    elementIdentifier = v2->_elementIdentifier;
    v2->_elementIdentifier = (NSString *)v4;
  }
  return v2;
}

- (id)powerElementWithBatteryCapacity:(double)a3
{
  v5 = [MEMORY[0x1E4F28F80] processInfo];
  uint64_t v6 = [v5 isLowPowerModeEnabled];

  objc_super v7 = [[SBPowerAlertElement alloc] initWithIdentifier:self style:0 batteryPercentage:v6 lowPowerModeEnabled:0 action:a3];
  return v7;
}

- (NSString)elementIdentifier
{
  return self->_elementIdentifier;
}

- (void).cxx_destruct
{
}

@end