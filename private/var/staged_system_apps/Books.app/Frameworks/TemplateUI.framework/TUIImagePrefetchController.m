@interface TUIImagePrefetchController
- (NSUUID)controllerID;
- (TUIImagePrefetchController)initWithResourceLoader:(id)a3;
- (TUIImagePrefetchControllerDelegate)delegate;
- (float)_adjustedPriority:(float)result;
- (float)priority;
- (void)_checkInitialResourcesAndInvokeDelegateIfNeeded;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)setPriority:(float)a3;
- (void)updatePrioritiesForRenderModel:(id)a3 visibleRect:(CGRect)a4 viewState:(id)a5;
- (void)urlLoaded:(id)a3;
@end

@implementation TUIImagePrefetchController

- (TUIImagePrefetchController)initWithResourceLoader:(id)a3
{
  id v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)TUIImagePrefetchController;
  v6 = [(TUIImagePrefetchController *)&v19 init];
  v7 = v6;
  if (v6)
  {
    v6->_priority = 0.5;
    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v9 = dispatch_queue_create("TUIImagePrefetchController.workQueue", v8);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v9;

    dispatch_queue_t v11 = dispatch_queue_create("TUIImagePrefetchController.access", 0);
    access = v7->_access;
    v7->_access = (OS_dispatch_queue *)v11;

    objc_storeStrong((id *)&v7->_resourceLoader, a3);
    uint64_t v13 = +[NSUUID UUID];
    controllerID = v7->_controllerID;
    v7->_controllerID = (NSUUID *)v13;

    uint64_t v15 = +[NSDate dateWithTimeIntervalSince1970:0.0];
    lastUpdate = v7->_lastUpdate;
    v7->_lastUpdate = (NSDate *)v15;

    v17 = +[TUIImagePrefetchControllerManager sharedManager];
    [v17 registerPrefetchController:v7];
  }
  return v7;
}

- (void)dealloc
{
  v3 = +[TUIImagePrefetchControllerManager sharedManager];
  [v3 unregisterPrefetchController:self];

  v4.receiver = self;
  v4.super_class = (Class)TUIImagePrefetchController;
  [(TUIImagePrefetchController *)&v4 dealloc];
}

- (float)_adjustedPriority:(float)result
{
  float priority = self->_priority;
  float v4 = 0.75;
  if (priority < 0.5) {
    return TUIPriorityClamp(v4 * result);
  }
  float v4 = 1.25;
  if (priority > 0.5) {
    return TUIPriorityClamp(v4 * result);
  }
  return result;
}

- (void)updatePrioritiesForRenderModel:(id)a3 visibleRect:(CGRect)a4 viewState:(id)a5
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  id v11 = a3;
  id v12 = a5;
  [(NSDate *)self->_lastUpdate timeIntervalSinceNow];
  if (v13 >= 0.0) {
    double v14 = v13;
  }
  else {
    double v14 = -v13;
  }
  v27.origin.CGFloat x = x;
  v27.origin.CGFloat y = y;
  v27.size.CGFloat width = width;
  v27.size.CGFloat height = height;
  if (!CGRectIsEmpty(v27) && v14 > 0.25)
  {
    uint64_t v15 = +[NSDate date];
    lastUpdate = self->_lastUpdate;
    self->_lastUpdate = v15;

    id v17 = [v12 copy];
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_6EF0;
    block[3] = &unk_2517D8;
    id v20 = v11;
    CGFloat v23 = x;
    CGFloat v24 = y;
    CGFloat v25 = width;
    CGFloat v26 = height;
    id v12 = v17;
    id v21 = v12;
    v22 = self;
    dispatch_async(queue, block);
  }
}

- (void)urlLoaded:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_76F4;
  v7[3] = &unk_251828;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)_checkInitialResourcesAndInvokeDelegateIfNeeded
{
  if (![(NSMutableSet *)self->_initialResourcesToLoad count])
  {
    initialResources = self->_initialResources;
    self->_initialResources = 0;

    initialResourcesToLoad = self->_initialResourcesToLoad;
    self->_initialResourcesToLoad = 0;

    initialResourcesLoaded = self->_initialResourcesLoaded;
    self->_initialResourcesLoaded = 0;

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      id v8 = objc_loadWeakRetained((id *)&self->_delegate);
      [v8 imagePrefetchControllerDidLoadInitialResources:self];
    }
    self->_hasNotifyInitialResourcesLoad = 1;
  }
}

- (TUIImagePrefetchControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (TUIImagePrefetchControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSUUID)controllerID
{
  return self->_controllerID;
}

- (float)priority
{
  return self->_priority;
}

- (void)setPriority:(float)a3
{
  self->_float priority = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_controllerID, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_resourceLoader, 0);
  objc_storeStrong((id *)&self->_lastUpdate, 0);
  objc_storeStrong((id *)&self->_resourcesToLoad, 0);
  objc_storeStrong((id *)&self->_initialResourcesLoaded, 0);
  objc_storeStrong((id *)&self->_initialResourcesToLoad, 0);
  objc_storeStrong((id *)&self->_initialResources, 0);
  objc_storeStrong((id *)&self->_access, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end