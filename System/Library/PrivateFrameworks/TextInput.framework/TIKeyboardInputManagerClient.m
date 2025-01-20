@interface TIKeyboardInputManagerClient
+ (BOOL)instancesRespondToSelector:(SEL)a3;
- (BOOL)conformsToProtocol:(id)a3;
- (BOOL)isKindOfClass:(Class)a3;
- (BOOL)respondsToSelector:(SEL)a3;
- (NSXPCConnection)connection;
- (TIKeyboardInputManagerClient)init;
- (TIKeyboardInputManagerClient)initWithImplProxy:(id)a3;
- (id)methodSignatureForSelector:(SEL)a3;
- (void)dealloc;
- (void)forwardInvocation:(id)a3;
- (void)handleError:(id)a3 forRequest:(id)a4;
- (void)handleRequest:(id)a3;
- (void)setConnection:(id)a3;
@end

@implementation TIKeyboardInputManagerClient

- (BOOL)isKindOfClass:(Class)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TIKeyboardInputManagerClient;
  if (-[TIKeyboardInputManagerClient isKindOfClass:](&v5, sel_isKindOfClass_)) {
    return 1;
  }
  else {
    return [(objc_class *)a3 isSubclassOfClass:objc_opt_class()];
  }
}

- (void).cxx_destruct
{
}

- (void)setConnection:(id)a3
{
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)handleError:(id)a3 forRequest:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  objc_msgSend(v6, "setErrorCount:", objc_msgSend(v6, "errorCount") + 1);
  if ((unint64_t)[v6 errorCount] > 1)
  {
    v9 = [(TIKeyboardInputManagerClient *)self connection];
    [v9 invalidate];

    [(TIKeyboardInputManagerClient *)self setConnection:0];
    v7 = [v6 invocation];
    v8 = NSStringFromSelector((SEL)[v7 selector]);
    NSLog(&cfstr_PleaseCheckFor.isa, "-[TIKeyboardInputManagerClient handleError:forRequest:]", v8);
  }
  else
  {
    v7 = [v6 invocation];
    v8 = NSStringFromSelector((SEL)[v7 selector]);
    NSLog(&cfstr_SWillRetrySend.isa, "-[TIKeyboardInputManagerClient handleError:forRequest:]", v8, v10);
  }

  [(TIKeyboardInputManagerClient *)self handleRequest:v6];
}

- (void)handleRequest:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(TIKeyboardInputManagerClient *)self connection];

  if (v5)
  {
    id v6 = [v4 invocation];
    v7 = [(TIKeyboardInputManagerClient *)self connection];
    uint64_t v11 = MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    v13 = __46__TIKeyboardInputManagerClient_handleRequest___block_invoke;
    v14 = &unk_1E5558DC8;
    v15 = self;
    id v16 = v4;
    v8 = [v7 remoteObjectProxyWithErrorHandler:&v11];
    objc_msgSend(v6, "invokeWithTarget:", v8, v11, v12, v13, v14, v15);
  }
  else
  {
    v9 = objc_opt_new();
    id v10 = [v4 invocation];
    [v10 invokeWithTarget:v9];
  }
}

uint64_t __46__TIKeyboardInputManagerClient_handleRequest___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) handleError:a2 forRequest:*(void *)(a1 + 40)];
}

- (void)forwardInvocation:(id)a3
{
  id v4 = a3;
  if (+[TIKeyboardInputManagerStub instancesRespondToSelector:](TIKeyboardInputManagerStub, "instancesRespondToSelector:", [v4 selector]))
  {
    objc_super v5 = [[TIKeyboardInputManagerClientRequest alloc] initWithInvocation:v4];
    [(TIKeyboardInputManagerClient *)self handleRequest:v5];
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)TIKeyboardInputManagerClient;
    [(TIKeyboardInputManagerClient *)&v6 forwardInvocation:v4];
  }
}

- (id)methodSignatureForSelector:(SEL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)TIKeyboardInputManagerClient;
  id v4 = -[TIKeyboardInputManagerClient methodSignatureForSelector:](&v9, sel_methodSignatureForSelector_);
  objc_super v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = +[TIKeyboardInputManagerStub instanceMethodSignatureForSelector:a3];
  }
  v7 = v6;

  return v7;
}

- (BOOL)conformsToProtocol:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)TIKeyboardInputManagerClient;
  if ([(TIKeyboardInputManagerClient *)&v7 conformsToProtocol:v4]) {
    char v5 = 1;
  }
  else {
    char v5 = +[TIKeyboardInputManagerStub conformsToProtocol:v4];
  }

  return v5;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TIKeyboardInputManagerClient;
  if (-[TIKeyboardInputManagerClient respondsToSelector:](&v5, sel_respondsToSelector_)) {
    return 1;
  }
  else {
    return +[TIKeyboardInputManagerStub instancesRespondToSelector:a3];
  }
}

- (TIKeyboardInputManagerClient)initWithImplProxy:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)TIKeyboardInputManagerClient;
  objc_super v5 = [(TIKeyboardInputManagerClient *)&v14 init];
  if (v5)
  {
    uint64_t v6 = [objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.TextInput" options:4096];
    connection = v5->_connection;
    v5->_connection = (NSXPCConnection *)v6;

    v8 = +[TIKeyboardInputManagerStub serverInterface];
    [(NSXPCConnection *)v5->_connection setRemoteObjectInterface:v8];

    [(NSXPCConnection *)v5->_connection setExportedObject:v4];
    objc_super v9 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EDC54AA0];
    [(NSXPCConnection *)v5->_connection setExportedInterface:v9];

    id v10 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    uint64_t v11 = dispatch_queue_create("com.apple.keyboard.xpc", v10);
    if (v11)
    {
      uint64_t v12 = dispatch_get_global_queue(33, 2uLL);
      dispatch_set_target_queue(v11, v12);

      [(NSXPCConnection *)v5->_connection _setQueue:v11];
    }
    [(NSXPCConnection *)v5->_connection resume];
  }
  return v5;
}

- (TIKeyboardInputManagerClient)init
{
  return 0;
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_connection invalidate];
  v3.receiver = self;
  v3.super_class = (Class)TIKeyboardInputManagerClient;
  [(TIKeyboardInputManagerClient *)&v3 dealloc];
}

+ (BOOL)instancesRespondToSelector:(SEL)a3
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___TIKeyboardInputManagerClient;
  if (objc_msgSendSuper2(&v5, sel_instancesRespondToSelector_)) {
    return 1;
  }
  else {
    return +[TIKeyboardInputManagerStub instancesRespondToSelector:a3];
  }
}

@end