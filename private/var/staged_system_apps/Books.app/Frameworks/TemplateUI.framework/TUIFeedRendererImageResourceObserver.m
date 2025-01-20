@interface TUIFeedRendererImageResourceObserver
- (NSHashTable)enteredImageResources;
- (NSHashTable)imageResources;
- (OS_dispatch_group)group;
- (TUIFeedRendererImageResourceObserver)initWithRenderModel:(id)a3 timeout:(double)a4;
- (TUIRenderModelLayer)renderModel;
- (void)_leaveGroupIfImageResourceLoaded:(id)a3;
- (void)imageResourceDidChangeImage:(id)a3;
- (void)setEnteredImageResources:(id)a3;
- (void)setImageResources:(id)a3;
- (void)waitForImageResources:(id)a3;
@end

@implementation TUIFeedRendererImageResourceObserver

- (TUIFeedRendererImageResourceObserver)initWithRenderModel:(id)a3 timeout:(double)a4
{
  id v7 = a3;
  v17.receiver = self;
  v17.super_class = (Class)TUIFeedRendererImageResourceObserver;
  v8 = [(TUIFeedRendererImageResourceObserver *)&v17 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_renderModel, a3);
    dispatch_group_t v10 = dispatch_group_create();
    group = v9->_group;
    v9->_group = (OS_dispatch_group *)v10;

    v12 = (NSHashTable *)objc_alloc_init((Class)NSHashTable);
    enteredImageResources = v9->_enteredImageResources;
    v9->_enteredImageResources = v12;

    dispatch_queue_t v14 = dispatch_queue_create("TUIFeedRendererImageResourceObserver.completionQueue", 0);
    completionQueue = v9->_completionQueue;
    v9->_completionQueue = (OS_dispatch_queue *)v14;

    v9->_timeout = a4;
    v9->_lock._os_unfair_lock_opaque = 0;
  }

  return v9;
}

- (void)waitForImageResources:(id)a3
{
  id v21 = a3;
  long long v4 = *(_OWORD *)&CGAffineTransformIdentity.c;
  long long v28 = *(_OWORD *)&CGAffineTransformIdentity.a;
  long long v29 = v4;
  long long v30 = *(_OWORD *)&CGAffineTransformIdentity.tx;
  v5 = +[TUIResourceCollector createImageResourceCollector];
  [(TUIRenderModelLayer *)self->_renderModel appendResourcesToCollector:v5 transform:&v28];
  v6 = [v5 imageResources];
  id v7 = (NSHashTable *)[v6 copy];
  imageResources = self->_imageResources;
  self->_imageResources = v7;

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  v9 = self->_imageResources;
  id v10 = [(NSHashTable *)v9 countByEnumeratingWithState:&v24 objects:v31 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v25;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v25 != v11) {
          objc_enumerationMutation(v9);
        }
        v13 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        [v13 addInterest];
        [v13 addNonVolatileInterest];
        dispatch_queue_t v14 = [v13 imageContentWithOptions:1];
        v15 = [v14 image];
        BOOL v16 = v15 == 0;

        if (v16)
        {
          os_unfair_lock_lock(&self->_lock);
          if ([(NSHashTable *)self->_enteredImageResources containsObject:v13])
          {
            os_unfair_lock_unlock(&self->_lock);
          }
          else
          {
            [(NSHashTable *)self->_enteredImageResources addObject:v13];
            dispatch_group_enter((dispatch_group_t)self->_group);
            os_unfair_lock_unlock(&self->_lock);
            [v13 addObserver:self];
          }
        }
      }
      id v10 = [(NSHashTable *)v9 countByEnumeratingWithState:&v24 objects:v31 count:16];
    }
    while (v10);
  }

  *(void *)&long long v28 = 0;
  *((void *)&v28 + 1) = &v28;
  *(void *)&long long v29 = 0x3032000000;
  *((void *)&v29 + 1) = sub_902EC;
  *(void *)&long long v30 = sub_90318;
  *((void *)&v30 + 1) = objc_retainBlock(v21);
  dispatch_time_t v17 = dispatch_time(0, (uint64_t)(self->_timeout * 1000000000.0));
  completionQueue = self->_completionQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_90320;
  block[3] = &unk_2542E0;
  block[4] = &v28;
  dispatch_after(v17, completionQueue, block);
  group = self->_group;
  v20 = self->_completionQueue;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_9038C;
  v22[3] = &unk_2542E0;
  v22[4] = &v28;
  TUIDispatchGroupNotifyViaRunloopIfMain(group, v20, v22);
  _Block_object_dispose(&v28, 8);
}

- (void)_leaveGroupIfImageResourceLoaded:(id)a3
{
  id v4 = a3;
  v5 = [v4 imageContentWithOptions:1];
  v6 = [v5 image];

  if (v6)
  {
    os_unfair_lock_lock(&self->_lock);
    if ([(NSHashTable *)self->_enteredImageResources containsObject:v4])
    {
      [(NSHashTable *)self->_enteredImageResources removeObject:v4];
      dispatch_group_leave((dispatch_group_t)self->_group);
    }
    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    id v7 = TUIDefaultLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1914C8((uint64_t)v4, v7);
    }
  }
}

- (void)imageResourceDidChangeImage:(id)a3
{
}

- (NSHashTable)imageResources
{
  return self->_imageResources;
}

- (void)setImageResources:(id)a3
{
}

- (NSHashTable)enteredImageResources
{
  return self->_enteredImageResources;
}

- (void)setEnteredImageResources:(id)a3
{
}

- (OS_dispatch_group)group
{
  return self->_group;
}

- (TUIRenderModelLayer)renderModel
{
  return self->_renderModel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_renderModel, 0);
  objc_storeStrong((id *)&self->_group, 0);
  objc_storeStrong((id *)&self->_enteredImageResources, 0);
  objc_storeStrong((id *)&self->_imageResources, 0);

  objc_storeStrong((id *)&self->_completionQueue, 0);
}

@end