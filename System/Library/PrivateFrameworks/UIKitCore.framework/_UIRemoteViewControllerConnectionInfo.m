@interface _UIRemoteViewControllerConnectionInfo
- (BSMachPortSendRight)serviceAccessibilityServerPortWrapper;
- (NSArray)serviceViewControllerSupportedInterfaceOrientations;
- (_UIHostedWindowHostingHandle)hostedWindowHostingHandle;
- (_UIHostedWindowHostingHandle)remoteKeyboardsWindowHostingHandle;
- (_UIHostedWindowHostingHandle)textEffectsWindowAboveStatusBarHostingHandle;
- (_UIHostedWindowHostingHandle)textEffectsWindowHostingHandle;
- (_UIViewServiceInterface)interface;
- (id)serviceViewControllerControlMessageProxy;
- (id)serviceViewControllerProxy;
- (id)textEffectsOperatorProxy;
- (id)viewControllerOperatorProxy;
- (int)preferredStatusBarVisibility;
- (int64_t)preferredStatusBarStyle;
- (void)setHostedWindowHostingHandle:(id)a3;
- (void)setInterface:(id)a3;
- (void)setPreferredStatusBarStyle:(int64_t)a3;
- (void)setPreferredStatusBarVisibility:(int)a3;
- (void)setRemoteKeyboardsWindowHostingHandle:(id)a3;
- (void)setServiceAccessibilityServerPortWrapper:(id)a3;
- (void)setServiceViewControllerControlMessageProxy:(id)a3;
- (void)setServiceViewControllerProxy:(id)a3;
- (void)setServiceViewControllerSupportedInterfaceOrientations:(id)a3;
- (void)setTextEffectsOperatorProxy:(id)a3;
- (void)setTextEffectsWindowAboveStatusBarHostingHandle:(id)a3;
- (void)setTextEffectsWindowHostingHandle:(id)a3;
- (void)setViewControllerOperatorProxy:(id)a3;
@end

@implementation _UIRemoteViewControllerConnectionInfo

- (_UIViewServiceInterface)interface
{
  return (_UIViewServiceInterface *)objc_getProperty(self, a2, 16, 1);
}

- (void)setInterface:(id)a3
{
}

- (id)viewControllerOperatorProxy
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void)setViewControllerOperatorProxy:(id)a3
{
}

- (id)serviceViewControllerProxy
{
  return objc_getProperty(self, a2, 32, 1);
}

- (void)setServiceViewControllerProxy:(id)a3
{
}

- (id)serviceViewControllerControlMessageProxy
{
  return objc_getProperty(self, a2, 40, 1);
}

- (void)setServiceViewControllerControlMessageProxy:(id)a3
{
}

- (id)textEffectsOperatorProxy
{
  return objc_getProperty(self, a2, 48, 1);
}

- (void)setTextEffectsOperatorProxy:(id)a3
{
}

- (NSArray)serviceViewControllerSupportedInterfaceOrientations
{
  return (NSArray *)objc_getProperty(self, a2, 56, 1);
}

- (void)setServiceViewControllerSupportedInterfaceOrientations:(id)a3
{
}

- (BSMachPortSendRight)serviceAccessibilityServerPortWrapper
{
  return (BSMachPortSendRight *)objc_getProperty(self, a2, 64, 1);
}

- (void)setServiceAccessibilityServerPortWrapper:(id)a3
{
}

- (int64_t)preferredStatusBarStyle
{
  return self->_preferredStatusBarStyle;
}

- (void)setPreferredStatusBarStyle:(int64_t)a3
{
  self->_preferredStatusBarStyle = a3;
}

- (int)preferredStatusBarVisibility
{
  return self->_preferredStatusBarVisibility;
}

- (void)setPreferredStatusBarVisibility:(int)a3
{
  self->_preferredStatusBarVisibility = a3;
}

- (_UIHostedWindowHostingHandle)hostedWindowHostingHandle
{
  return (_UIHostedWindowHostingHandle *)objc_getProperty(self, a2, 80, 1);
}

- (void)setHostedWindowHostingHandle:(id)a3
{
}

- (_UIHostedWindowHostingHandle)textEffectsWindowHostingHandle
{
  return (_UIHostedWindowHostingHandle *)objc_getProperty(self, a2, 88, 1);
}

- (void)setTextEffectsWindowHostingHandle:(id)a3
{
}

- (_UIHostedWindowHostingHandle)textEffectsWindowAboveStatusBarHostingHandle
{
  return (_UIHostedWindowHostingHandle *)objc_getProperty(self, a2, 96, 1);
}

- (void)setTextEffectsWindowAboveStatusBarHostingHandle:(id)a3
{
}

- (_UIHostedWindowHostingHandle)remoteKeyboardsWindowHostingHandle
{
  return (_UIHostedWindowHostingHandle *)objc_getProperty(self, a2, 104, 1);
}

- (void)setRemoteKeyboardsWindowHostingHandle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteKeyboardsWindowHostingHandle, 0);
  objc_storeStrong((id *)&self->_textEffectsWindowAboveStatusBarHostingHandle, 0);
  objc_storeStrong((id *)&self->_textEffectsWindowHostingHandle, 0);
  objc_storeStrong((id *)&self->_hostedWindowHostingHandle, 0);
  objc_storeStrong((id *)&self->_serviceAccessibilityServerPortWrapper, 0);
  objc_storeStrong((id *)&self->_serviceViewControllerSupportedInterfaceOrientations, 0);
  objc_storeStrong(&self->_textEffectsOperatorProxy, 0);
  objc_storeStrong(&self->_serviceViewControllerControlMessageProxy, 0);
  objc_storeStrong(&self->_serviceViewControllerProxy, 0);
  objc_storeStrong(&self->_viewControllerOperatorProxy, 0);
  objc_storeStrong((id *)&self->_interface, 0);
}

@end