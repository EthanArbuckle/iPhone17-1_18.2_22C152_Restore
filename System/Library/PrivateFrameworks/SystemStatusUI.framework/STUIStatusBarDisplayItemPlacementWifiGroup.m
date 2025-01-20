@interface STUIStatusBarDisplayItemPlacementWifiGroup
- (STUIStatusBarDisplayItemPlacement)iconPlacement;
- (STUIStatusBarDisplayItemPlacement)rawPlacement;
- (STUIStatusBarDisplayItemPlacement)signalStrengthPlacement;
- (void)setIconPlacement:(id)a3;
- (void)setRawPlacement:(id)a3;
- (void)setSignalStrengthPlacement:(id)a3;
@end

@implementation STUIStatusBarDisplayItemPlacementWifiGroup

- (void)setSignalStrengthPlacement:(id)a3
{
}

- (void)setIconPlacement:(id)a3
{
}

- (STUIStatusBarDisplayItemPlacement)signalStrengthPlacement
{
  return self->_signalStrengthPlacement;
}

- (STUIStatusBarDisplayItemPlacement)iconPlacement
{
  return self->_iconPlacement;
}

- (void)setRawPlacement:(id)a3
{
}

- (STUIStatusBarDisplayItemPlacement)rawPlacement
{
  return self->_rawPlacement;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rawPlacement, 0);
  objc_storeStrong((id *)&self->_iconPlacement, 0);
  objc_storeStrong((id *)&self->_signalStrengthPlacement, 0);
}

@end