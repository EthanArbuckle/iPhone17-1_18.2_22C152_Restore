@interface MSVSystemDialogOptions
- (BOOL)dismissOverlaysOnLockscreen;
- (BOOL)forceModalAlertAppearance;
- (BOOL)showAsTopmost;
- (BOOL)showOnLockscreen;
- (NSArray)allowedApplicationBundleIDs;
- (NSString)alertHeader;
- (NSString)alertMessage;
- (NSString)alternateButtonTitle;
- (NSString)defaultButtonTitle;
- (NSURL)alertIconURL;
- (void)setAlertHeader:(id)a3;
- (void)setAlertIconURL:(id)a3;
- (void)setAlertMessage:(id)a3;
- (void)setAllowedApplicationBundleIDs:(id)a3;
- (void)setAlternateButtonTitle:(id)a3;
- (void)setDefaultButtonTitle:(id)a3;
- (void)setDismissOverlaysOnLockscreen:(BOOL)a3;
- (void)setForceModalAlertAppearance:(BOOL)a3;
- (void)setShowAsTopmost:(BOOL)a3;
- (void)setShowOnLockscreen:(BOOL)a3;
@end

@implementation MSVSystemDialogOptions

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alternateButtonTitle, 0);
  objc_storeStrong((id *)&self->_defaultButtonTitle, 0);
  objc_storeStrong((id *)&self->_allowedApplicationBundleIDs, 0);
  objc_storeStrong((id *)&self->_alertIconURL, 0);
  objc_storeStrong((id *)&self->_alertMessage, 0);
  objc_storeStrong((id *)&self->_alertHeader, 0);
}

- (void)setDismissOverlaysOnLockscreen:(BOOL)a3
{
  self->_dismissOverlaysOnLockscreen = a3;
}

- (BOOL)dismissOverlaysOnLockscreen
{
  return self->_dismissOverlaysOnLockscreen;
}

- (void)setShowOnLockscreen:(BOOL)a3
{
  self->_showOnLockscreen = a3;
}

- (BOOL)showOnLockscreen
{
  return self->_showOnLockscreen;
}

- (void)setForceModalAlertAppearance:(BOOL)a3
{
  self->_forceModalAlertAppearance = a3;
}

- (BOOL)forceModalAlertAppearance
{
  return self->_forceModalAlertAppearance;
}

- (void)setShowAsTopmost:(BOOL)a3
{
  self->_showAsTopmost = a3;
}

- (BOOL)showAsTopmost
{
  return self->_showAsTopmost;
}

- (void)setAlternateButtonTitle:(id)a3
{
}

- (NSString)alternateButtonTitle
{
  return self->_alternateButtonTitle;
}

- (void)setDefaultButtonTitle:(id)a3
{
}

- (NSString)defaultButtonTitle
{
  return self->_defaultButtonTitle;
}

- (void)setAllowedApplicationBundleIDs:(id)a3
{
}

- (NSArray)allowedApplicationBundleIDs
{
  return self->_allowedApplicationBundleIDs;
}

- (void)setAlertIconURL:(id)a3
{
}

- (NSURL)alertIconURL
{
  return self->_alertIconURL;
}

- (void)setAlertMessage:(id)a3
{
}

- (NSString)alertMessage
{
  return self->_alertMessage;
}

- (void)setAlertHeader:(id)a3
{
}

- (NSString)alertHeader
{
  return self->_alertHeader;
}

@end