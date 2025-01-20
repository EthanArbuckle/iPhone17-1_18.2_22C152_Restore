@interface UIKeyboardInputManagerClient
+ (BOOL)instancesRespondToSelector:(SEL)a3;
- (BOOL)conformsToProtocol:(id)a3;
- (BOOL)isKindOfClass:(Class)a3;
- (BOOL)respondsToSelector:(SEL)a3;
- (NSXPCConnection)connection;
- (UIKeyboardInputManagerClient)initWithImplProxy:(id)a3;
- (id)methodSignatureForSelector:(SEL)a3;
- (void)dealloc;
- (void)forwardInvocation:(id)a3;
- (void)handleError:(id)a3 forRequest:(id)a4;
- (void)handleRequest:(id)a3;
- (void)setConnection:(id)a3;
@end

@implementation UIKeyboardInputManagerClient

- (void)dealloc
{
  [(NSXPCConnection *)self->_connection invalidate];
  v3.receiver = self;
  v3.super_class = (Class)UIKeyboardInputManagerClient;
  [(UIKeyboardInputManagerClient *)&v3 dealloc];
}

- (UIKeyboardInputManagerClient)initWithImplProxy:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)UIKeyboardInputManagerClient;
  v5 = [(UIKeyboardInputManagerClient *)&v14 init];
  if (v5)
  {
    uint64_t v6 = [objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.TextInput" options:4096];
    connection = v5->_connection;
    v5->_connection = (NSXPCConnection *)v6;

    v8 = [MEMORY[0x1E4FAE348] serverInterface];
    [(NSXPCConnection *)v5->_connection setRemoteObjectInterface:v8];

    [(NSXPCConnection *)v5->_connection setExportedObject:v4];
    v9 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1ED4C5198];
    [(NSXPCConnection *)v5->_connection setExportedInterface:v9];

    v10 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    v11 = dispatch_queue_create("com.apple.keyboard.xpc", v10);
    if (v11)
    {
      v12 = dispatch_get_global_queue(33, 2uLL);
      dispatch_set_target_queue(v11, v12);

      [(NSXPCConnection *)v5->_connection _setQueue:v11];
    }
    [(NSXPCConnection *)v5->_connection resume];
  }
  return v5;
}

+ (BOOL)instancesRespondToSelector:(SEL)a3
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___UIKeyboardInputManagerClient;
  if (objc_msgSendSuper2(&v5, sel_instancesRespondToSelector_)) {
    return 1;
  }
  else {
    return [MEMORY[0x1E4FAE348] instancesRespondToSelector:a3];
  }
}

- (BOOL)respondsToSelector:(SEL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)UIKeyboardInputManagerClient;
  if (-[UIKeyboardInputManagerClient respondsToSelector:](&v5, sel_respondsToSelector_)) {
    return 1;
  }
  else {
    return [MEMORY[0x1E4FAE348] instancesRespondToSelector:a3];
  }
}

- (BOOL)isKindOfClass:(Class)a3
{
  v5.receiver = self;
  v5.super_class = (Class)UIKeyboardInputManagerClient;
  if (-[UIKeyboardInputManagerClient isKindOfClass:](&v5, sel_isKindOfClass_)) {
    return 1;
  }
  else {
    return [(objc_class *)a3 isSubclassOfClass:objc_opt_class()];
  }
}

- (BOOL)conformsToProtocol:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)UIKeyboardInputManagerClient;
  if ([(UIKeyboardInputManagerClient *)&v7 conformsToProtocol:v4]) {
    char v5 = 1;
  }
  else {
    char v5 = [MEMORY[0x1E4FAE348] conformsToProtocol:v4];
  }

  return v5;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)UIKeyboardInputManagerClient;
  id v4 = -[UIKeyboardInputManagerClient methodSignatureForSelector:](&v9, sel_methodSignatureForSelector_);
  char v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [MEMORY[0x1E4FAE348] instanceMethodSignatureForSelector:a3];
  }
  objc_super v7 = v6;

  return v7;
}

- (void)forwardInvocation:(id)a3
{
  id v4 = a3;
  if (objc_msgSend(MEMORY[0x1E4FAE348], "instancesRespondToSelector:", objc_msgSend(v4, "selector")))
  {
    char v5 = [[UIKeyboardInputManagerClientRequest alloc] initWithInvocation:v4];
    [(UIKeyboardInputManagerClient *)self handleRequest:v5];
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)UIKeyboardInputManagerClient;
    [(UIKeyboardInputManagerClient *)&v6 forwardInvocation:v4];
  }
}

- (void)handleRequest:(id)a3
{
  id v4 = a3;
  char v5 = [(UIKeyboardInputManagerClient *)self connection];

  if (v5)
  {
    objc_super v6 = [v4 invocation];
    objc_super v7 = [(UIKeyboardInputManagerClient *)self connection];
    uint64_t v11 = MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    v13 = __46__UIKeyboardInputManagerClient_handleRequest___block_invoke;
    objc_super v14 = &unk_1E52EF7F8;
    v15 = self;
    id v16 = v4;
    v8 = [v7 remoteObjectProxyWithErrorHandler:&v11];
    objc_msgSend(v6, "invokeWithTarget:", v8, v11, v12, v13, v14, v15);
  }
  else
  {
    objc_super v9 = objc_opt_new();
    v10 = [v4 invocation];
    [v10 invokeWithTarget:v9];
  }
}

uint64_t __46__UIKeyboardInputManagerClient_handleRequest___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) handleError:a2 forRequest:*(void *)(a1 + 40)];
}

- (void)handleError:(id)a3 forRequest:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  objc_msgSend(v6, "setErrorCount:", objc_msgSend(v6, "errorCount") + 1);
  if ((unint64_t)[v6 errorCount] > 1)
  {
    objc_super v9 = [(UIKeyboardInputManagerClient *)self connection];
    [v9 invalidate];

    [(UIKeyboardInputManagerClient *)self setConnection:0];
    objc_super v7 = [v6 invocation];
    v8 = NSStringFromSelector((SEL)[v7 selector]);
    NSLog(&cfstr_PleaseCheckFor.isa, "-[UIKeyboardInputManagerClient handleError:forRequest:]", v8);
  }
  else
  {
    objc_super v7 = [v6 invocation];
    v8 = NSStringFromSelector((SEL)[v7 selector]);
    NSLog(&cfstr_SWillRetrySend.isa, "-[UIKeyboardInputManagerClient handleError:forRequest:]", v8, v10);
  }

  [(UIKeyboardInputManagerClient *)self handleRequest:v6];
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (void).cxx_destruct
{
}

@end