@interface UIInputViewControllerInterfaceClient
+ (id)_extensionAuxiliaryHostProtocol;
+ (id)_extensionAuxiliaryVendorProtocol;
- (_UIIVCInterface)forwardingInterface;
- (id)responseDelegate;
- (void)_handleInputViewControllerState:(id)a3;
- (void)_tearDownRemoteService;
- (void)dealloc;
- (void)setForwardingInterface:(id)a3;
@end

@implementation UIInputViewControllerInterfaceClient

- (id)responseDelegate
{
  v2 = [(UIInputViewControllerInterfaceClient *)self _auxiliaryConnection];
  v3 = [v2 remoteObjectProxy];

  return v3;
}

- (void)_tearDownRemoteService
{
}

- (void)_handleInputViewControllerState:(id)a3
{
  id v4 = a3;
  id v5 = [(UIInputViewControllerInterfaceClient *)self forwardingInterface];
  [v5 _handleInputViewControllerState:v4];
}

+ (id)_extensionAuxiliaryHostProtocol
{
  return +[UIRemoteInputViewControllerInterface _extensionAuxiliaryHostProtocol];
}

+ (id)_extensionAuxiliaryVendorProtocol
{
  return +[UIRemoteInputViewControllerInterface _extensionAuxiliaryVendorProtocol];
}

- (void)setForwardingInterface:(id)a3
{
  id v4 = (_UIIVCInterface *)a3;
  [(_UIIVCInterface *)self->_forwardingInterface setResponseDelegate:0];
  forwardingInterface = self->_forwardingInterface;
  self->_forwardingInterface = v4;
  v6 = v4;

  id v7 = [(UIInputViewControllerInterfaceClient *)self responseDelegate];
  [(_UIIVCInterface *)self->_forwardingInterface setResponseDelegate:v7];
}

- (void)dealloc
{
  [(_UIIVCInterface *)self->_forwardingInterface setResponseDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)UIInputViewControllerInterfaceClient;
  [(UIInputViewControllerInterfaceClient *)&v3 dealloc];
}

- (_UIIVCInterface)forwardingInterface
{
  return self->_forwardingInterface;
}

- (void).cxx_destruct
{
}

@end