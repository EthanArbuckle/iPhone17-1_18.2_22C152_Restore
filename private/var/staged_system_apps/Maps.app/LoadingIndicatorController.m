@interface LoadingIndicatorController
+ (id)sharedController;
+ (void)setAsSharedInstanceClass;
- (BOOL)_isLoading;
- (BOOL)isShowing;
- (BOOL)isSuppressed;
- (id)_allLoadingTokens;
- (id)beginShowingLoadingIndicator;
- (void)_didInvalidateLoadingToken;
- (void)_updateLoadingIndicator;
- (void)setSuppressed:(BOOL)a3;
@end

@implementation LoadingIndicatorController

- (void)_didInvalidateLoadingToken
{
  dispatch_time_t v3 = dispatch_time(0, 2000000000);
  if (!self->_updateScheduled)
  {
    self->_updateScheduled = 1;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100AD66C8;
    block[3] = &unk_1012E5D08;
    block[4] = self;
    dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (id)beginShowingLoadingIndicator
{
  if (+[NSThread isMainThread])
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100006BF0;
    v8[3] = &unk_1012E5D08;
    v8[4] = self;
    dispatch_time_t v3 = [[LoadingToken alloc] initWithInvalidationBlock:v8];
    loadingTokens = self->_loadingTokens;
    if (!loadingTokens)
    {
      v5 = +[NSHashTable weakObjectsHashTable];
      v6 = self->_loadingTokens;
      self->_loadingTokens = v5;

      loadingTokens = self->_loadingTokens;
    }
    [(NSHashTable *)loadingTokens addObject:v3];
    [(LoadingIndicatorController *)self _updateLoadingIndicator];
  }
  else
  {
    uint64_t v10 = 0;
    v11 = &v10;
    uint64_t v12 = 0x3032000000;
    v13 = sub_100104340;
    v14 = sub_100104A10;
    id v15 = 0;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100AD667C;
    block[3] = &unk_1012E73F0;
    block[4] = self;
    void block[5] = &v10;
    dispatch_sync((dispatch_queue_t)&_dispatch_main_q, block);
    dispatch_time_t v3 = (LoadingToken *)(id)v11[5];
    _Block_object_dispose(&v10, 8);
  }

  return v3;
}

- (void)_updateLoadingIndicator
{
  if ([(LoadingIndicatorController *)self _isLoading]) {
    BOOL v3 = !self->_suppressed;
  }
  else {
    BOOL v3 = 0;
  }
  if (self->_showing != v3)
  {
    self->_showing = v3;
    [(LoadingIndicatorController *)self showingDidChange];
  }
}

- (BOOL)_isLoading
{
  v2 = [(NSHashTable *)self->_loadingTokens allObjects];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

+ (id)sharedController
{
  BOOL v3 = (void *)qword_1016107B0;
  if (!qword_1016107B0)
  {
    id v4 = objc_alloc_init((Class)a1);
    v5 = (void *)qword_1016107B0;
    qword_1016107B0 = (uint64_t)v4;

    BOOL v3 = (void *)qword_1016107B0;
  }

  return v3;
}

+ (void)setAsSharedInstanceClass
{
  if ((id)objc_opt_class() != a1)
  {
    id v3 = objc_alloc_init((Class)a1);
    id v4 = (void *)qword_1016107B0;
    qword_1016107B0 = (uint64_t)v3;
  }
}

- (id)_allLoadingTokens
{
  return [(NSHashTable *)self->_loadingTokens allObjects];
}

- (void)setSuppressed:(BOOL)a3
{
  if (self->_suppressed != a3)
  {
    self->_suppressed = a3;
    [(LoadingIndicatorController *)self _updateLoadingIndicator];
  }
}

- (BOOL)isShowing
{
  return self->_showing;
}

- (BOOL)isSuppressed
{
  return self->_suppressed;
}

- (void).cxx_destruct
{
}

@end