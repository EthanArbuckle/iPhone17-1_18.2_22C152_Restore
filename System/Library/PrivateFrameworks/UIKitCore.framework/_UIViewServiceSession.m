@interface _UIViewServiceSession
+ (id)sessionWithConnection:(id)a3 manager:(id)a4;
+ (void)initialize;
- (BOOL)requiresExtensionContextForViewControllerOperator:(id)a3;
- (NSUUID)uniqueIdentifier;
- (_UIViewServiceSessionManager)manager;
- (id)containingViewControllerClassNameForViewControllerOperator:(id)a3;
- (id)mainStoryboardNameForViewControllerOperator:(id)a3;
- (id)terminationHandler;
- (id)viewControllerClassNameForViewControllerOperator:(id)a3;
- (void)_invalidateUnconditionallyThen:(id)a3;
- (void)_objc_initiateDealloc;
- (void)connection:(id)a3 handleInvocation:(id)a4 isReply:(BOOL)a5;
- (void)dealloc;
- (void)deputy:(id)a3 didFailWithError:(id)a4;
- (void)deputyManager:(id)a3 didUpdateExportedInterface:(id)a4;
- (void)registerDeputyClass:(Class)a3 withConnectionHandler:(id)a4;
- (void)setTerminationHandler:(id)a3;
- (void)unregisterDeputyClass:(Class)a3;
- (void)viewControllerOperator:(id)a3 didCreateServiceViewController:(id)a4 contextToken:(id)a5;
- (void)viewControllerOperator:(id)a3 didCreateServiceViewControllerOfClass:(Class)a4;
@end

@implementation _UIViewServiceSession

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    _class_setCustomDeallocInitiation();
  }
}

- (void)_objc_initiateDealloc
{
  id v3 = [(_UIAsyncInvocation *)self->_invalidationInvocation invoke];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __46___UIViewServiceSession__objc_initiateDealloc__block_invoke;
  v4[3] = &__block_descriptor_40_e5_v8__0ls32l8;
  v4[4] = self;
  [v3 whenCompleteDo:v4];
}

+ (id)sessionWithConnection:(id)a3 manager:(id)a4
{
  _UIApplicationIsExtension();
  id v7 = objc_alloc_init((Class)a1);
  *((void *)v7 + 7) = objc_alloc_init(MEMORY[0x1E4F29128]);
  v8 = objc_alloc_init(_UIViewServiceDeputyManager);
  *((void *)v7 + 4) = v8;
  [(_UIViewServiceDeputyManager *)v8 setDelegate:v7];
  id v9 = a3;
  *((void *)v7 + 2) = v9;
  objc_msgSend(v9, "setExportedInterface:", objc_msgSend(MEMORY[0x1E4F29280], "interfaceWithProtocol:", &unk_1ED701900));
  [*((id *)v7 + 2) setExportedObject:*((void *)v7 + 4)];
  *((void *)v7 + 3) = a4;
  v10 = NSString;
  v11 = (objc_class *)objc_opt_class();
  v12 = (const char *)[(id)objc_msgSend(v10 stringWithFormat:@"com.apple.uikit.%@ %p", NSStringFromClass(v11), a1), "UTF8String"];
  *((void *)v7 + 1) = dispatch_queue_create(v12, 0);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __55___UIViewServiceSession_sessionWithConnection_manager___block_invoke;
  v18[3] = &__block_descriptor_40_e14_v16__0___v___8ls32l8;
  v18[4] = v7;
  *((void *)v7 + 5) = +[_UIAsyncInvocation invocationWithBlock:v18];
  v13 = (void *)*((void *)v7 + 2);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __55___UIViewServiceSession_sessionWithConnection_manager___block_invoke_2;
  v17[3] = &__block_descriptor_40_e5_v8__0ls32l8;
  v17[4] = v7;
  [v13 setInterruptionHandler:v17];
  v14 = (void *)*((void *)v7 + 2);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __55___UIViewServiceSession_sessionWithConnection_manager___block_invoke_3;
  v16[3] = &__block_descriptor_40_e5_v8__0ls32l8;
  v16[4] = v7;
  [v14 setInvalidationHandler:v16];
  [*((id *)v7 + 2) _setQueue:*((void *)v7 + 1)];
  [*((id *)v7 + 2) setDelegate:v7];
  return v7;
}

- (void)dealloc
{
  if (self->_connection) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"UIViewServiceSession.m", 139, @"session's connection should already have been torn down by this point; overrelease probable");
  }
  dispatch_release((dispatch_object_t)self->_queue);
  [(_UIViewServiceDeputyManager *)self->_deputyManager setDelegate:0];

  v3.receiver = self;
  v3.super_class = (Class)_UIViewServiceSession;
  [(_UIViewServiceSession *)&v3 dealloc];
}

- (void)deputyManager:(id)a3 didUpdateExportedInterface:(id)a4
{
}

- (void)connection:(id)a3 handleInvocation:(id)a4 isReply:(BOOL)a5
{
  objc_msgSend(a4, "retainArguments", a3);
  v6 = (void *)[(id)UIApp _systemAnimationFenceExemptQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __61___UIViewServiceSession_connection_handleInvocation_isReply___block_invoke;
  v7[3] = &unk_1E52DC580;
  v7[4] = a4;
  [v6 performAsync:v7];
}

- (void)setTerminationHandler:(id)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __47___UIViewServiceSession_setTerminationHandler___block_invoke;
  v4[3] = &unk_1E530D628;
  v4[4] = self;
  void v4[5] = a3;
  dispatch_async(queue, v4);
}

- (void)_invalidateUnconditionallyThen:(id)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __56___UIViewServiceSession__invalidateUnconditionallyThen___block_invoke;
  v4[3] = &unk_1E530DB88;
  v4[4] = a3;
  void v4[5] = self;
  dispatch_async(queue, v4);
}

- (void)deputy:(id)a3 didFailWithError:(id)a4
{
}

- (void)registerDeputyClass:(Class)a3 withConnectionHandler:(id)a4
{
  id v7 = +[_UIWeakReference weakReferenceWrappingObject:self];
  deputyManager = self->_deputyManager;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __67___UIViewServiceSession_registerDeputyClass_withConnectionHandler___block_invoke;
  v9[3] = &unk_1E530DBB0;
  v9[4] = v7;
  v9[5] = a4;
  [(_UIViewServiceDeputyManager *)deputyManager registerDeputyClass:a3 withConnectionHandler:v9];
}

- (void)unregisterDeputyClass:(Class)a3
{
}

- (void)viewControllerOperator:(id)a3 didCreateServiceViewControllerOfClass:(Class)a4
{
}

- (void)viewControllerOperator:(id)a3 didCreateServiceViewController:(id)a4 contextToken:(id)a5
{
  v8 = [(_UIViewServiceSessionManager *)[(_UIViewServiceSession *)self manager] delegate];
  id v9 = [(_UIViewServiceSession *)self manager];
  [(_UIViewServiceSessionManagerDelegate *)v8 viewServiceSessionManager:v9 didCreateViewController:a4 contextToken:a5];
}

- (BOOL)requiresExtensionContextForViewControllerOperator:(id)a3
{
  if (![(_UIViewServiceSessionManager *)[(_UIViewServiceSession *)self manager] delegate]) {
    return 1;
  }
  v4 = [(_UIViewServiceSessionManager *)[(_UIViewServiceSession *)self manager] delegate];
  v5 = [(_UIViewServiceSession *)self manager];
  return [(_UIViewServiceSessionManagerDelegate *)v4 requiresExtensionContextForViewServiceSessionManager:v5];
}

- (id)viewControllerClassNameForViewControllerOperator:(id)a3
{
  if ([(_UIViewServiceSessionManager *)[(_UIViewServiceSession *)self manager] delegate])
  {
    v4 = [(_UIViewServiceSessionManager *)[(_UIViewServiceSession *)self manager] delegate];
    v5 = [(_UIViewServiceSession *)self manager];
    return (id)[(_UIViewServiceSessionManagerDelegate *)v4 viewControllerClassNameForViewServiceSessionManager:v5];
  }
  else
  {
    id result = (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)-[objc_class performSelector:](NSClassFromString(&cfstr_UikitPksubsyst.isa), "performSelector:", sel_sharedInstance), "valueForKey:", @"infoDictionary"), "objectForKeyedSubscript:", @"NSExtension"), "objectForKeyedSubscript:", @"NSExtensionPrincipalClass");
    if (!result)
    {
      id v7 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B50], "mainBundle"), "infoDictionary");
      return (id)[v7 objectForKeyedSubscript:@"NSExtensionPrincipalClass"];
    }
  }
  return result;
}

- (id)containingViewControllerClassNameForViewControllerOperator:(id)a3
{
  if ([(_UIViewServiceSessionManager *)[(_UIViewServiceSession *)self manager] delegate])
  {
    v4 = [(_UIViewServiceSessionManager *)[(_UIViewServiceSession *)self manager] delegate];
    v5 = [(_UIViewServiceSession *)self manager];
    return (id)[(_UIViewServiceSessionManagerDelegate *)v4 containingViewControllerClassNameForViewServiceSessionManager:v5];
  }
  else
  {
    id v7 = objc_msgSend((id)objc_msgSend((id)-[objc_class performSelector:](NSClassFromString(&cfstr_UikitPksubsyst.isa), "performSelector:", sel_sharedInstance), "valueForKey:", @"infoDictionary"), "objectForKeyedSubscript:", @"NSExtension");
    return (id)[v7 objectForKeyedSubscript:@"NSExtensionContainingViewControllerClass"];
  }
}

- (id)mainStoryboardNameForViewControllerOperator:(id)a3
{
  if ([(_UIViewServiceSessionManager *)[(_UIViewServiceSession *)self manager] delegate])
  {
    v4 = [(_UIViewServiceSessionManager *)[(_UIViewServiceSession *)self manager] delegate];
    v5 = [(_UIViewServiceSession *)self manager];
    return (id)[(_UIViewServiceSessionManagerDelegate *)v4 mainStoryboardNameForViewServiceSessionManager:v5];
  }
  else
  {
    id v7 = objc_msgSend((id)objc_msgSend((id)-[objc_class performSelector:](NSClassFromString(&cfstr_UikitPksubsyst.isa), "performSelector:", sel_sharedInstance), "valueForKey:", @"infoDictionary"), "objectForKeyedSubscript:", @"NSExtension");
    return (id)[v7 objectForKeyedSubscript:@"NSExtensionMainStoryboard"];
  }
}

- (_UIViewServiceSessionManager)manager
{
  return self->_manager;
}

- (id)terminationHandler
{
  return self->_terminationHandler;
}

- (NSUUID)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

@end