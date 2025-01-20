@interface _UIStatusBarDisplayItemPlacementCellularGroup
- (NSArray)placementsAffectedByAirplaneMode;
- (_UIStatusBarDisplayItemPlacement)badgePlacement;
- (_UIStatusBarDisplayItemPlacement)callForwardingPlacement;
- (_UIStatusBarDisplayItemPlacement)dualNameAndTypePlacement;
- (_UIStatusBarDisplayItemPlacement)dualNamePlacement;
- (_UIStatusBarDisplayItemPlacement)dualSignalStrengthPlacement;
- (_UIStatusBarDisplayItemPlacement)namePlacement;
- (_UIStatusBarDisplayItemPlacement)rawPlacement;
- (_UIStatusBarDisplayItemPlacement)signalStrengthPlacement;
- (_UIStatusBarDisplayItemPlacement)typePlacement;
- (_UIStatusBarDisplayItemPlacement)warningPlacement;
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

@implementation _UIStatusBarDisplayItemPlacementCellularGroup

- (_UIStatusBarDisplayItemPlacement)signalStrengthPlacement
{
  return self->_signalStrengthPlacement;
}

- (void)setSignalStrengthPlacement:(id)a3
{
}

- (_UIStatusBarDisplayItemPlacement)warningPlacement
{
  return self->_warningPlacement;
}

- (void)setWarningPlacement:(id)a3
{
}

- (_UIStatusBarDisplayItemPlacement)typePlacement
{
  return self->_typePlacement;
}

- (void)setTypePlacement:(id)a3
{
}

- (_UIStatusBarDisplayItemPlacement)namePlacement
{
  return self->_namePlacement;
}

- (void)setNamePlacement:(id)a3
{
}

- (_UIStatusBarDisplayItemPlacement)callForwardingPlacement
{
  return self->_callForwardingPlacement;
}

- (void)setCallForwardingPlacement:(id)a3
{
}

- (_UIStatusBarDisplayItemPlacement)badgePlacement
{
  return self->_badgePlacement;
}

- (void)setBadgePlacement:(id)a3
{
}

- (_UIStatusBarDisplayItemPlacement)rawPlacement
{
  return self->_rawPlacement;
}

- (void)setRawPlacement:(id)a3
{
}

- (_UIStatusBarDisplayItemPlacement)dualSignalStrengthPlacement
{
  return self->_dualSignalStrengthPlacement;
}

- (void)setDualSignalStrengthPlacement:(id)a3
{
}

- (_UIStatusBarDisplayItemPlacement)dualNamePlacement
{
  return self->_dualNamePlacement;
}

- (void)setDualNamePlacement:(id)a3
{
}

- (_UIStatusBarDisplayItemPlacement)dualNameAndTypePlacement
{
  return self->_dualNameAndTypePlacement;
}

- (void)setDualNameAndTypePlacement:(id)a3
{
}

- (NSArray)placementsAffectedByAirplaneMode
{
  return self->_placementsAffectedByAirplaneMode;
}

- (void)setPlacementsAffectedByAirplaneMode:(id)a3
{
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

@end