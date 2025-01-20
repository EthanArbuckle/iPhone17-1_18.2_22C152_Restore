@interface SUSettingsStatefulUIOptions
- (BOOL)allowUnrestrictedCellularDownload;
- (BOOL)bypassTermsAndConditions;
- (BOOL)clientIsBuddy;
- (BOOL)shouldHideNonTargetedUpdatesPostUserSelection;
- (SUSettingsStatefulUIOptions)init;
- (void)setAllowUnrestrictedCellularDownload:(BOOL)a3;
- (void)setBypassTermsAndConditions:(BOOL)a3;
- (void)setClientIsBuddy:(BOOL)a3;
- (void)setShouldHideNonTargetedUpdatesPostUserSelection:(BOOL)a3;
@end

@implementation SUSettingsStatefulUIOptions

- (SUSettingsStatefulUIOptions)init
{
  SEL v6 = a2;
  v7 = 0;
  v5.receiver = self;
  v5.super_class = (Class)SUSettingsStatefulUIOptions;
  v4 = [(SUSettingsStatefulUIOptions *)&v5 init];
  v7 = v4;
  objc_storeStrong((id *)&v7, v4);
  if (v4) {
    v7->_shouldHideNonTargetedUpdatesPostUserSelection = 1;
  }
  v3 = v7;
  objc_storeStrong((id *)&v7, 0);
  return v3;
}

- (BOOL)allowUnrestrictedCellularDownload
{
  return self->_allowUnrestrictedCellularDownload;
}

- (void)setAllowUnrestrictedCellularDownload:(BOOL)a3
{
  self->_allowUnrestrictedCellularDownload = a3;
}

- (BOOL)clientIsBuddy
{
  return self->_clientIsBuddy;
}

- (void)setClientIsBuddy:(BOOL)a3
{
  self->_clientIsBuddy = a3;
}

- (BOOL)bypassTermsAndConditions
{
  return self->_bypassTermsAndConditions;
}

- (void)setBypassTermsAndConditions:(BOOL)a3
{
  self->_bypassTermsAndConditions = a3;
}

- (BOOL)shouldHideNonTargetedUpdatesPostUserSelection
{
  return self->_shouldHideNonTargetedUpdatesPostUserSelection;
}

- (void)setShouldHideNonTargetedUpdatesPostUserSelection:(BOOL)a3
{
  self->_shouldHideNonTargetedUpdatesPostUserSelection = a3;
}

@end