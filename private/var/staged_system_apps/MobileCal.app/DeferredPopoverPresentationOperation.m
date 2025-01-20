@interface DeferredPopoverPresentationOperation
- (BOOL)isReady;
- (DeferredPopoverPresentationOperation)initWithViewController:(id)a3 shouldShowWithAnimation:(BOOL)a4;
- (id)description;
- (id)sourceViewController;
- (void)main;
@end

@implementation DeferredPopoverPresentationOperation

- (DeferredPopoverPresentationOperation)initWithViewController:(id)a3 shouldShowWithAnimation:(BOOL)a4
{
  id v7 = a3;
  v16.receiver = self;
  v16.super_class = (Class)DeferredPopoverPresentationOperation;
  v8 = [(DeferredPopoverPresentationOperation *)&v16 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_viewController, a3);
    v9->_shouldShowWithAnimation = a4;
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    id v11 = objc_claimAutoreleasedReturnValue();
    v12 = (const char *)[v11 UTF8String];

    v13 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    dispatch_queue_t v14 = dispatch_queue_create(v12, v13);
    [(ShowViewControllerOperation *)v9 setQueue:v14];
  }
  return v9;
}

- (id)description
{
  v3 = [(EnqueueableManagedNavigationController *)self->_viewController sourceViewController];
  uint64_t v4 = objc_opt_class();
  v5 = +[NSString stringWithFormat:@"%@ presents popover showing view controller %@", v4, objc_opt_class()];
  [(DeferredPopoverPresentationOperation *)self setName:v5];

  v6 = (objc_class *)objc_opt_class();
  id v7 = NSStringFromClass(v6);
  v8 = [(DeferredPopoverPresentationOperation *)self name];
  v9 = +[NSString stringWithFormat:@"<%@: %p{name = '%@'}>", v7, self, v8];

  id v10 = [objc_alloc((Class)CalDescriptionBuilder) initWithSuperclassDescription:v9];
  id v11 = [v10 build];

  return v11;
}

- (id)sourceViewController
{
  uint64_t v4 = [(EnqueueableManagedNavigationController *)self->_viewController sourceViewController];
  unsigned __int8 v5 = [v4 conformsToProtocol:&OBJC_PROTOCOL___EnqueuablePopoverPresentationManagedNavigationControllerDelegate];

  if ((v5 & 1) == 0)
  {
    v8 = +[NSAssertionHandler currentHandler];
    v9 = [(EnqueueableManagedNavigationController *)self->_viewController sourceViewController];
    [v8 handleFailureInMethod:a2, self, @"DeferredPopoverPresentationOperation.m", 53, @"Fatal: source view controller %@ does not support popover presentations.", v9 object file lineNumber description];
  }
  viewController = self->_viewController;

  return [(EnqueueableManagedNavigationController *)viewController sourceViewController];
}

- (BOOL)isReady
{
  v19.receiver = self;
  v19.super_class = (Class)DeferredPopoverPresentationOperation;
  unsigned int v3 = [(DeferredPopoverPresentationOperation *)&v19 isReady];
  uint64_t v4 = [(EnqueueableManagedNavigationController *)self->_viewController presentingViewController];

  if (v4)
  {
    uint64_t v5 = 0;
  }
  else
  {
    v6 = [(DeferredPopoverPresentationOperation *)self sourceViewController];
    id v7 = [v6 isReadyToShowViewControllersInsideEnqueueableManagedNavigationController:self->_viewController];

    v8 = (void *)kCalUILogHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEBUG))
    {
      v9 = v8;
      id v10 = objc_opt_class();
      id v11 = v10;
      v12 = +[NSNumber numberWithBool:v7];
      *(_DWORD *)buf = 138412546;
      v21 = v10;
      __int16 v22 = 2112;
      v23 = v12;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "Operation %@ sourceViewControllerClaimsReadiness: %@", buf, 0x16u);
    }
    uint64_t v5 = v3 & v7;
  }
  if (self->_isReady != v5)
  {
    [(DeferredPopoverPresentationOperation *)self willChangeValueForKey:@"isReady"];
    self->_isReady = v5;
    [(DeferredPopoverPresentationOperation *)self didChangeValueForKey:@"isReady"];
  }
  v13 = (void *)kCalUILogHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEBUG))
  {
    dispatch_queue_t v14 = v13;
    v15 = objc_opt_class();
    id v16 = v15;
    v17 = +[NSNumber numberWithBool:v5];
    *(_DWORD *)buf = 138412546;
    v21 = v15;
    __int16 v22 = 2112;
    v23 = v17;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "Operation %@ isReady: %@", buf, 0x16u);
  }
  return self->_isReady;
}

- (void)main
{
  unsigned int v3 = kCalUILogHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v6 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Executing operation: %@", buf, 0xCu);
  }
  [(DeferredPopoverPresentationOperation *)self willChangeValueForKey:@"isExecuting"];
  self->_isExecuting = 1;
  [(DeferredPopoverPresentationOperation *)self didChangeValueForKey:@"isExecuting"];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100081958;
  block[3] = &unk_1001D2740;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void).cxx_destruct
{
}

@end