@interface SUSUIBaseSoftwareUpdateInstallFailureAlertItem
- (BOOL)actionTaken;
- (BOOL)allowInSetup;
- (void)dismissAlert;
- (void)setActionTaken:(BOOL)a3;
@end

@implementation SUSUIBaseSoftwareUpdateInstallFailureAlertItem

- (void)dismissAlert
{
  if ((BYTE1(self->super._controller) & 1) == 0)
  {
    v2 = [(SUSUIBaseSoftwareUpdateAlertItem *)self softwareUpdateController];
    [(SUSUISoftwareUpdateController *)v2 repopInstallAlertWithDefaultDurationFromNowForReason:@"Unable to install alert - no action taken"];
  }
}

- (BOOL)allowInSetup
{
  return 1;
}

- (BOOL)actionTaken
{
  return BYTE1(self->super._controller) & 1;
}

- (void)setActionTaken:(BOOL)a3
{
  BYTE1(self->super._controller) = a3;
}

@end