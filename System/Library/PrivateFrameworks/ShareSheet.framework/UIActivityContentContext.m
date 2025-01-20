@interface UIActivityContentContext
- (BOOL)canRenderPeople;
- (BOOL)configureForCloudSharing;
- (BOOL)configureForPhotosEdit;
- (BOOL)hideHeaderView;
- (BOOL)hideNavigationBar;
- (BOOL)isRemote;
- (BOOL)sharingExpanded;
- (BOOL)showHeroActionsHorizontally;
- (BSAuditToken)hostAuditToken;
- (NSArray)applicationActivityTypes;
- (NSArray)heroActionActivityTypes;
- (NSString)topContentSectionText;
- (UIColor)tintColor;
- (void)setApplicationActivityTypes:(id)a3;
- (void)setCanRenderPeople:(BOOL)a3;
- (void)setConfigureForCloudSharing:(BOOL)a3;
- (void)setConfigureForPhotosEdit:(BOOL)a3;
- (void)setHeroActionActivityTypes:(id)a3;
- (void)setHideHeaderView:(BOOL)a3;
- (void)setHideNavigationBar:(BOOL)a3;
- (void)setHostAuditToken:(id)a3;
- (void)setIsRemote:(BOOL)a3;
- (void)setSharingExpanded:(BOOL)a3;
- (void)setShowHeroActionsHorizontally:(BOOL)a3;
- (void)setTintColor:(id)a3;
- (void)setTopContentSectionText:(id)a3;
@end

@implementation UIActivityContentContext

- (BOOL)isRemote
{
  return self->_isRemote;
}

- (void)setIsRemote:(BOOL)a3
{
  self->_isRemote = a3;
}

- (BSAuditToken)hostAuditToken
{
  return self->_hostAuditToken;
}

- (void)setHostAuditToken:(id)a3
{
}

- (BOOL)canRenderPeople
{
  return self->_canRenderPeople;
}

- (void)setCanRenderPeople:(BOOL)a3
{
  self->_canRenderPeople = a3;
}

- (BOOL)configureForCloudSharing
{
  return self->_configureForCloudSharing;
}

- (void)setConfigureForCloudSharing:(BOOL)a3
{
  self->_configureForCloudSharing = a3;
}

- (BOOL)configureForPhotosEdit
{
  return self->_configureForPhotosEdit;
}

- (void)setConfigureForPhotosEdit:(BOOL)a3
{
  self->_configureForPhotosEdit = a3;
}

- (BOOL)hideHeaderView
{
  return self->_hideHeaderView;
}

- (void)setHideHeaderView:(BOOL)a3
{
  self->_hideHeaderView = a3;
}

- (BOOL)hideNavigationBar
{
  return self->_hideNavigationBar;
}

- (void)setHideNavigationBar:(BOOL)a3
{
  self->_hideNavigationBar = a3;
}

- (BOOL)sharingExpanded
{
  return self->_sharingExpanded;
}

- (void)setSharingExpanded:(BOOL)a3
{
  self->_sharingExpanded = a3;
}

- (BOOL)showHeroActionsHorizontally
{
  return self->_showHeroActionsHorizontally;
}

- (void)setShowHeroActionsHorizontally:(BOOL)a3
{
  self->_showHeroActionsHorizontally = a3;
}

- (NSString)topContentSectionText
{
  return self->_topContentSectionText;
}

- (void)setTopContentSectionText:(id)a3
{
}

- (NSArray)applicationActivityTypes
{
  return self->_applicationActivityTypes;
}

- (void)setApplicationActivityTypes:(id)a3
{
}

- (NSArray)heroActionActivityTypes
{
  return self->_heroActionActivityTypes;
}

- (void)setHeroActionActivityTypes:(id)a3
{
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (void)setTintColor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_storeStrong((id *)&self->_heroActionActivityTypes, 0);
  objc_storeStrong((id *)&self->_applicationActivityTypes, 0);
  objc_storeStrong((id *)&self->_topContentSectionText, 0);
  objc_storeStrong((id *)&self->_hostAuditToken, 0);
}

@end