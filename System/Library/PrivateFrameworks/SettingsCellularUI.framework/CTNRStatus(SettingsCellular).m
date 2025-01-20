@interface CTNRStatus(SettingsCellular)
- (BOOL)are5GRATModeCellsUserInteractable;
- (BOOL)isDisabledReasonRelevantTo5GRATModeCellsUserInteractableState;
@end

@implementation CTNRStatus(SettingsCellular)

- (BOOL)are5GRATModeCellsUserInteractable
{
  return ![a1 isNSADisabled]
      || ([a1 isDisabledReasonRelevantTo5GRATModeCellsUserInteractableState] & 1) == 0;
}

- (BOOL)isDisabledReasonRelevantTo5GRATModeCellsUserInteractableState
{
  return ([a1 nsaDisabledReasonMask] & 0x80000002) != 0;
}

@end