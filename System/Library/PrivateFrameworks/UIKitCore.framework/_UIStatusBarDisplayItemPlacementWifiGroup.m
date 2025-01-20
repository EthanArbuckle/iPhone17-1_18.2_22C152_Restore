@interface _UIStatusBarDisplayItemPlacementWifiGroup
- (_UIStatusBarDisplayItemPlacement)iconPlacement;
- (_UIStatusBarDisplayItemPlacement)rawPlacement;
- (_UIStatusBarDisplayItemPlacement)signalStrengthPlacement;
- (void)setIconPlacement:(id)a3;
- (void)setRawPlacement:(id)a3;
- (void)setSignalStrengthPlacement:(id)a3;
@end

@implementation _UIStatusBarDisplayItemPlacementWifiGroup

- (_UIStatusBarDisplayItemPlacement)signalStrengthPlacement
{
  return self->_signalStrengthPlacement;
}

- (void)setSignalStrengthPlacement:(id)a3
{
}

- (_UIStatusBarDisplayItemPlacement)iconPlacement
{
  return self->_iconPlacement;
}

- (void)setIconPlacement:(id)a3
{
}

- (_UIStatusBarDisplayItemPlacement)rawPlacement
{
  return self->_rawPlacement;
}

- (void)setRawPlacement:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rawPlacement, 0);
  objc_storeStrong((id *)&self->_iconPlacement, 0);
  objc_storeStrong((id *)&self->_signalStrengthPlacement, 0);
}

@end