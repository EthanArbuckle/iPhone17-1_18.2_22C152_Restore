@interface UIRemoteInputViewControllerInterface
+ (id)_extensionAuxiliaryHostProtocol;
+ (id)_extensionAuxiliaryVendorProtocol;
- (_UIIVCResponseDelegate)responseDelegate;
- (void)_handleInputViewControllerState:(id)a3;
- (void)_openURL:(id)a3 completion:(id)a4;
- (void)_performInputViewControllerOutput:(id)a3;
- (void)_tearDownRemoteService;
- (void)dealloc;
- (void)setResponseDelegate:(id)a3;
@end

@implementation UIRemoteInputViewControllerInterface

- (void)dealloc
{
  responseDelegate = self->_responseDelegate;
  self->_responseDelegate = 0;

  v4.receiver = self;
  v4.super_class = (Class)UIRemoteInputViewControllerInterface;
  [(UIRemoteInputViewControllerInterface *)&v4 dealloc];
}

+ (id)_extensionAuxiliaryHostProtocol
{
  if (qword_1EB25BE30 != -1) {
    dispatch_once(&qword_1EB25BE30, &__block_literal_global_316);
  }
  v2 = (void *)_MergedGlobals_1_16;
  return v2;
}

void __71__UIRemoteInputViewControllerInterface__extensionAuxiliaryHostProtocol__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1ED4C55D0];
  v1 = (void *)_MergedGlobals_1_16;
  _MergedGlobals_1_16 = v0;

  v2 = (void *)_MergedGlobals_1_16;
  objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v2 setClasses:v3 forSelector:sel__performInputViewControllerOutput_ argumentIndex:0 ofReply:0];
}

+ (id)_extensionAuxiliaryVendorProtocol
{
  if (qword_1EB25BE40 != -1) {
    dispatch_once(&qword_1EB25BE40, &__block_literal_global_90_0);
  }
  v2 = (void *)qword_1EB25BE38;
  return v2;
}

void __73__UIRemoteInputViewControllerInterface__extensionAuxiliaryVendorProtocol__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1ED5AEAC0];
  v1 = (void *)qword_1EB25BE38;
  qword_1EB25BE38 = v0;

  v2 = (void *)qword_1EB25BE38;
  objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v2 setClasses:v3 forSelector:sel__handleInputViewControllerState_ argumentIndex:0 ofReply:0];
}

- (void)_performInputViewControllerOutput:(id)a3
{
  id v4 = a3;
  id v5 = [(UIRemoteInputViewControllerInterface *)self responseDelegate];
  [v5 _performInputViewControllerOutput:v4];
}

- (void)_tearDownRemoteService
{
  id v3 = [(UIRemoteInputViewControllerInterface *)self _auxiliaryConnection];
  v2 = [v3 remoteObjectProxy];
  [v2 _tearDownRemoteService];
}

- (void)_handleInputViewControllerState:(id)a3
{
  id v4 = a3;
  id v6 = [(UIRemoteInputViewControllerInterface *)self _auxiliaryConnection];
  id v5 = [v6 remoteObjectProxy];
  [v5 _handleInputViewControllerState:v4];
}

- (void)_openURL:(id)a3 completion:(id)a4
{
  if (a4) {
    (*((void (**)(id, void))a4 + 2))(a4, 0);
  }
}

- (_UIIVCResponseDelegate)responseDelegate
{
  return self->_responseDelegate;
}

- (void)setResponseDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end