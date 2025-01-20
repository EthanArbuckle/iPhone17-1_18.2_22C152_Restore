@interface ShowViewControllerOperation
- (BOOL)isConcurrent;
- (BOOL)isExecuting;
- (BOOL)isFinished;
- (BOOL)shouldBeModal;
- (BOOL)shouldShowWithAnimation;
- (OS_dispatch_queue)queue;
- (ShowViewControllerOperation)initWithViewControllerToShow:(id)a3 toBeShownInViewController:(id)a4 shouldBeModal:(BOOL)a5 shouldShowWithAnimation:(BOOL)a6;
- (UIViewController)parentOfShownViewController;
- (UIViewController)shownViewController;
- (id)description;
- (void)cancel;
- (void)doInternalPresentation;
- (void)finish;
- (void)main;
- (void)setParentOfShownViewController:(id)a3;
- (void)setQueue:(id)a3;
- (void)setShouldBeModal:(BOOL)a3;
- (void)setShouldShowWithAnimation:(BOOL)a3;
- (void)setShownViewController:(id)a3;
- (void)start;
@end

@implementation ShowViewControllerOperation

- (ShowViewControllerOperation)initWithViewControllerToShow:(id)a3 toBeShownInViewController:(id)a4 shouldBeModal:(BOOL)a5 shouldShowWithAnimation:(BOOL)a6
{
  id v11 = a3;
  id v12 = a4;
  v21.receiver = self;
  v21.super_class = (Class)ShowViewControllerOperation;
  v13 = [(ShowViewControllerOperation *)&v21 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_shownViewController, a3);
    objc_storeStrong((id *)&v14->_parentOfShownViewController, a4);
    v14->_shouldBeModal = a5;
    v14->_shouldShowWithAnimation = a6;
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    id v16 = objc_claimAutoreleasedReturnValue();
    v17 = (const char *)[v16 UTF8String];

    v18 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    dispatch_queue_t v19 = dispatch_queue_create(v17, v18);
    [(ShowViewControllerOperation *)v14 setQueue:v19];
  }
  return v14;
}

- (id)description
{
  uint64_t v3 = objc_opt_class();
  v4 = +[NSString stringWithFormat:@"%@ shows view controller %@", v3, objc_opt_class()];
  [(ShowViewControllerOperation *)self setName:v4];

  id v5 = objc_alloc((Class)CalDescriptionBuilder);
  v10.receiver = self;
  v10.super_class = (Class)ShowViewControllerOperation;
  v6 = [(ShowViewControllerOperation *)&v10 description];
  id v7 = [v5 initWithSuperclassDescription:v6];

  [v7 setKey:@"_shouldBeModal" withBoolean:self->_shouldBeModal];
  v8 = [v7 build];

  return v8;
}

- (void)doInternalPresentation
{
  uint64_t v3 = (void *)kCalUILogHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    id v5 = (UIViewController *)objc_opt_class();
    v6 = v5;
    id v7 = objc_opt_class();
    id v8 = v7;
    *(_DWORD *)buf = 138412802;
    v24 = v5;
    __int16 v25 = 2112;
    v26 = v7;
    __int16 v27 = 2112;
    id v28 = (id)objc_opt_class();
    id v9 = v28;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%@ operation instructing %@ to modally present %@.", buf, 0x20u);
  }
  objc_super v10 = [(UIViewController *)self->_shownViewController presentingViewController];

  if (v10)
  {
    id v11 = (void *)kCalUILogHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_ERROR))
    {
      shownViewController = self->_shownViewController;
      v13 = v11;
      v14 = [(UIViewController *)shownViewController presentingViewController];
      *(_DWORD *)buf = 138412546;
      v24 = shownViewController;
      __int16 v25 = 2112;
      v26 = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "[51150180] Requested to present %@ but it's already presented by %@", buf, 0x16u);
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v15 = [(UIViewController *)self->_parentOfShownViewController delegate];
  }
  else
  {
    v15 = 0;
  }
  if (objc_opt_respondsToSelector()) {
    [v15 navigationController:self->_parentOfShownViewController willShowViewController:self->_shownViewController animated:self->_shouldShowWithAnimation];
  }
  parentOfShownViewController = self->_parentOfShownViewController;
  v17 = self->_shownViewController;
  BOOL shouldShowWithAnimation = self->_shouldShowWithAnimation;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10012B5A4;
  v20[3] = &unk_1001D28A8;
  id v21 = v15;
  v22 = self;
  id v19 = v15;
  [(UIViewController *)parentOfShownViewController presentViewController:v17 animated:shouldShowWithAnimation completion:v20];
}

- (void)start
{
  uint64_t v3 = [(ShowViewControllerOperation *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10012B7A8;
  block[3] = &unk_1001D2740;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)main
{
  uint64_t v3 = kCalUILogHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v6 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Executing operation: %@", buf, 0xCu);
  }
  [(ShowViewControllerOperation *)self willChangeValueForKey:@"isExecuting"];
  self->_isExecuting = 1;
  [(ShowViewControllerOperation *)self didChangeValueForKey:@"isExecuting"];
  if ([(ShowViewControllerOperation *)self isCancelled])
  {
    [(ShowViewControllerOperation *)self finish];
  }
  else
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10012B950;
    block[3] = &unk_1001D2740;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (BOOL)isConcurrent
{
  return 0;
}

- (void)cancel
{
  v5.receiver = self;
  v5.super_class = (Class)ShowViewControllerOperation;
  [(ShowViewControllerOperation *)&v5 cancel];
  if ([(ShowViewControllerOperation *)self isExecuting])
  {
    uint64_t v3 = [(ShowViewControllerOperation *)self queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10012BC68;
    block[3] = &unk_1001D2740;
    block[4] = self;
    dispatch_async(v3, block);
  }
}

- (BOOL)isExecuting
{
  return self->_isExecuting;
}

- (BOOL)isFinished
{
  return self->_isFinished;
}

- (void)finish
{
  uint64_t v3 = (void *)kCalUILogHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    objc_super v5 = (objc_class *)objc_opt_class();
    v6 = NSStringFromClass(v5);
    int v7 = 138412546;
    id v8 = v6;
    __int16 v9 = 2048;
    objc_super v10 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Finishing %@ operation: [%p]", (uint8_t *)&v7, 0x16u);
  }
  if (!self->_isFinished)
  {
    if (self->_isExecuting)
    {
      [(ShowViewControllerOperation *)self willChangeValueForKey:@"isExecuting"];
      self->_isExecuting = 0;
      [(ShowViewControllerOperation *)self didChangeValueForKey:@"isExecuting"];
    }
    [(ShowViewControllerOperation *)self willChangeValueForKey:@"isFinished"];
    self->_isFinished = 1;
    [(ShowViewControllerOperation *)self didChangeValueForKey:@"isFinished"];
  }
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16, 1);
}

- (void)setQueue:(id)a3
{
}

- (BOOL)shouldBeModal
{
  return self->_shouldBeModal;
}

- (void)setShouldBeModal:(BOOL)a3
{
  self->_shouldBeModal = a3;
}

- (BOOL)shouldShowWithAnimation
{
  return self->_shouldShowWithAnimation;
}

- (void)setShouldShowWithAnimation:(BOOL)a3
{
  self->_BOOL shouldShowWithAnimation = a3;
}

- (UIViewController)shownViewController
{
  return (UIViewController *)objc_getProperty(self, a2, 24, 1);
}

- (void)setShownViewController:(id)a3
{
}

- (UIViewController)parentOfShownViewController
{
  return (UIViewController *)objc_getProperty(self, a2, 32, 1);
}

- (void)setParentOfShownViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parentOfShownViewController, 0);
  objc_storeStrong((id *)&self->_shownViewController, 0);

  objc_storeStrong((id *)&self->queue, 0);
}

@end