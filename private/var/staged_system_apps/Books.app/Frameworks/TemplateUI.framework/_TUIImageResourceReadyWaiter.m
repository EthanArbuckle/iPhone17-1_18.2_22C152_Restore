@interface _TUIImageResourceReadyWaiter
- (NSHashTable)imageResources;
- (TUIAssertion)assertion;
- (_TUIImageResourceReadyWaiter)initWithImageResources:(id)a3 assertion:(id)a4 assertionQueue:(id)a5;
- (void)dealloc;
- (void)imageResourceDidChangeImage:(id)a3;
@end

@implementation _TUIImageResourceReadyWaiter

- (_TUIImageResourceReadyWaiter)initWithImageResources:(id)a3 assertion:(id)a4 assertionQueue:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v31.receiver = self;
  v31.super_class = (Class)_TUIImageResourceReadyWaiter;
  v11 = [(_TUIImageResourceReadyWaiter *)&v31 init];
  v12 = v11;
  if (v11)
  {
    v11->_lock._os_unfair_lock_opaque = 0;
    dispatch_group_t v13 = dispatch_group_create();
    group = v12->_group;
    v12->_group = (OS_dispatch_group *)v13;

    v15 = (NSHashTable *)[v8 copy];
    imageResources = v12->_imageResources;
    v12->_imageResources = v15;

    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v17 = v8;
    id v18 = [v17 countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v18)
    {
      id v19 = v18;
      uint64_t v20 = *(void *)v28;
      do
      {
        v21 = 0;
        do
        {
          if (*(void *)v28 != v20) {
            objc_enumerationMutation(v17);
          }
          v22 = *(void **)(*((void *)&v27 + 1) + 8 * (void)v21);
          dispatch_group_enter((dispatch_group_t)v12->_group);
          [v22 addObserver:v12];
          if (([v22 isImageLoading] & 1) == 0)
          {
            dispatch_group_leave((dispatch_group_t)v12->_group);
            [v22 removeObserver:v12];
            [(NSHashTable *)v12->_imageResources removeObject:v22];
          }
          v21 = (char *)v21 + 1;
        }
        while (v19 != v21);
        id v19 = [v17 countByEnumeratingWithState:&v27 objects:v32 count:16];
      }
      while (v19);
    }

    objc_storeStrong((id *)&v12->_assertion, a4);
    v23 = v12->_group;
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_117780;
    v25[3] = &unk_251990;
    id v26 = v9;
    TUIDispatchGroupNotifyViaRunloopIfMain(v23, v10, v25);
  }
  return v12;
}

- (void)dealloc
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v3 = self->_imageResources;
  id v4 = [(NSHashTable *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * (void)v7) removeObserver:self];
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [(NSHashTable *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  v8.receiver = self;
  v8.super_class = (Class)_TUIImageResourceReadyWaiter;
  [(_TUIImageResourceReadyWaiter *)&v8 dealloc];
}

- (void)imageResourceDidChangeImage:(id)a3
{
  id v5 = a3;
  unsigned int v4 = [v5 isImageLoaded];
  os_unfair_lock_lock(&self->_lock);
  if (v4 && [(NSHashTable *)self->_imageResources containsObject:v5])
  {
    [(NSHashTable *)self->_imageResources removeObject:v5];
    os_unfair_lock_unlock(&self->_lock);
    [v5 removeObserver:self];
    dispatch_group_leave((dispatch_group_t)self->_group);
  }
  else
  {
    os_unfair_lock_unlock(&self->_lock);
  }
}

- (NSHashTable)imageResources
{
  return self->_imageResources;
}

- (TUIAssertion)assertion
{
  return self->_assertion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assertion, 0);
  objc_storeStrong((id *)&self->_imageResources, 0);

  objc_storeStrong((id *)&self->_group, 0);
}

@end