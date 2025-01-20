@interface SBBreadcrumbActionContext
@end

@implementation SBBreadcrumbActionContext

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_windowScene);
  objc_storeStrong((id *)&self->_displayConfiguration, 0);
  objc_storeStrong((id *)&self->_breadcrumbTitle, 0);
  objc_storeStrong((id *)&self->_breadcrumbSceneID, 0);
  objc_storeStrong((id *)&self->_breadcrumbAppBundleID, 0);
  objc_storeStrong((id *)&self->_previousSideBundleId, 0);
  objc_storeStrong((id *)&self->_appLinkState, 0);
}

@end