@interface STUIStatusBarDisplayItemPlacementCellularGroup
- (NSArray)placementsAffectedByAirplaneMode;
- (STUIStatusBarDisplayItemPlacement)badgePlacement;
- (STUIStatusBarDisplayItemPlacement)callForwardingPlacement;
- (STUIStatusBarDisplayItemPlacement)dualNameAndTypePlacement;
- (STUIStatusBarDisplayItemPlacement)dualNamePlacement;
- (STUIStatusBarDisplayItemPlacement)dualSignalStrengthPlacement;
- (STUIStatusBarDisplayItemPlacement)namePlacement;
- (STUIStatusBarDisplayItemPlacement)rawPlacement;
- (STUIStatusBarDisplayItemPlacement)signalStrengthPlacement;
- (STUIStatusBarDisplayItemPlacement)typePlacement;
- (STUIStatusBarDisplayItemPlacement)warningPlacement;
- (void)setBadgePlacement:(id)a3;
- (void)setCallForwardingPlacement:(id)a3;
- (void)setDualNameAndTypePlacement:(id)a3;
- (void)setDualNamePlacement:(id)a3;
- (void)setDualSignalStrengthPlacement:(id)a3;
- (void)setNamePlacement:(id)a3;
- (void)setPlacementsAffectedByAirplaneMode:(id)a3;
- (void)setRawPlacement:(id)a3;
- (void)setSignalStrengthPlacement:(id)a3;
- (void)setTypePlacement:(id)a3;
- (void)setWarningPlacement:(id)a3;
@end

@implementation STUIStatusBarDisplayItemPlacementCellularGroup

- (void)setWarningPlacement:(id)a3
{
}

- (void)setTypePlacement:(id)a3
{
}

- (void)setSignalStrengthPlacement:(id)a3
{
}

- (void)setRawPlacement:(id)a3
{
}

- (void)setPlacementsAffectedByAirplaneMode:(id)a3
{
}

- (void)setNamePlacement:(id)a3
{
}

- (void)setCallForwardingPlacement:(id)a3
{
}

- (STUIStatusBarDisplayItemPlacement)typePlacement
{
  return self->_typePlacement;
}

- (STUIStatusBarDisplayItemPlacement)dualNameAndTypePlacement
{
  return self->_dualNameAndTypePlacement;
}

- (STUIStatusBarDisplayItemPlacement)badgePlacement
{
  return self->_badgePlacement;
}

- (STUIStatusBarDisplayItemPlacement)warningPlacement
{
  return self->_warningPlacement;
}

- (STUIStatusBarDisplayItemPlacement)signalStrengthPlacement
{
  return self->_signalStrengthPlacement;
}

- (STUIStatusBarDisplayItemPlacement)rawPlacement
{
  return self->_rawPlacement;
}

- (STUIStatusBarDisplayItemPlacement)namePlacement
{
  return self->_namePlacement;
}

- (STUIStatusBarDisplayItemPlacement)callForwardingPlacement
{
  return self->_callForwardingPlacement;
}

- (void)setBadgePlacement:(id)a3
{
}

- (STUIStatusBarDisplayItemPlacement)dualSignalStrengthPlacement
{
  return self->_dualSignalStrengthPlacement;
}

- (STUIStatusBarDisplayItemPlacement)dualNamePlacement
{
  return self->_dualNamePlacement;
}

- (NSArray)placementsAffectedByAirplaneMode
{
  return self->_placementsAffectedByAirplaneMode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placementsAffectedByAirplaneMode, 0);
  objc_storeStrong((id *)&self->_dualNameAndTypePlacement, 0);
  objc_storeStrong((id *)&self->_dualNamePlacement, 0);
  objc_storeStrong((id *)&self->_dualSignalStrengthPlacement, 0);
  objc_storeStrong((id *)&self->_rawPlacement, 0);
  objc_storeStrong((id *)&self->_badgePlacement, 0);
  objc_storeStrong((id *)&self->_callForwardingPlacement, 0);
  objc_storeStrong((id *)&self->_namePlacement, 0);
  objc_storeStrong((id *)&self->_typePlacement, 0);
  objc_storeStrong((id *)&self->_warningPlacement, 0);
  objc_storeStrong((id *)&self->_signalStrengthPlacement, 0);
}

- (void)setDualSignalStrengthPlacement:(id)a3
{
}

- (void)setDualNamePlacement:(id)a3
{
}

- (void)setDualNameAndTypePlacement:(id)a3
{
}

@end