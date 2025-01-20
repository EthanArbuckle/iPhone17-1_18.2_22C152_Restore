@interface SUDelayedQuitController
+ (BOOL)isDelayingTerminate;
+ (BOOL)viewControllerIsLongLived:(id)a3;
+ (id)checkedInViewControllerOfClass:(Class)a3;
+ (id)sharedInstance;
+ (void)beginDelayingTerminate;
+ (void)checkInLongLivedViewController:(id)a3;
+ (void)checkOutLongLivedViewController:(id)a3;
+ (void)endDelayingTerminate;
- (BOOL)_isDelayingTerminate;
- (BOOL)_viewControllerIsLongLived:(id)a3;
- (id)_checkedInViewControllerOfClass:(Class)a3;
- (void)_beginDelayingTerminate;
- (void)_checkInLongLivedViewController:(id)a3;
- (void)_checkOutLongLivedViewController:(id)a3;
- (void)_endDelayingTerminate;
- (void)dealloc;
@end

@implementation SUDelayedQuitController

- (void)dealloc
{
  self->_longLivedViewControllers = 0;
  v3.receiver = self;
  v3.super_class = (Class)SUDelayedQuitController;
  [(SUDelayedQuitController *)&v3 dealloc];
}

+ (id)sharedInstance
{
  return (id)__SharedInstance_4;
}

+ (void)checkInLongLivedViewController:(id)a3
{
  v4 = +[SUDelayedQuitController sharedInstance];

  [(SUDelayedQuitController *)v4 _checkInLongLivedViewController:a3];
}

+ (void)checkOutLongLivedViewController:(id)a3
{
  v4 = +[SUDelayedQuitController sharedInstance];

  [(SUDelayedQuitController *)v4 _checkOutLongLivedViewController:a3];
}

+ (BOOL)viewControllerIsLongLived:(id)a3
{
  v4 = +[SUDelayedQuitController sharedInstance];

  return [(SUDelayedQuitController *)v4 _viewControllerIsLongLived:a3];
}

+ (id)checkedInViewControllerOfClass:(Class)a3
{
  v4 = +[SUDelayedQuitController sharedInstance];

  return [(SUDelayedQuitController *)v4 _checkedInViewControllerOfClass:a3];
}

+ (BOOL)isDelayingTerminate
{
  v2 = +[SUDelayedQuitController sharedInstance];

  return [(SUDelayedQuitController *)v2 _isDelayingTerminate];
}

+ (void)beginDelayingTerminate
{
  v2 = (void *)[+[SUDelayedQuitController sharedInstance] mainThreadProxy];

  [v2 _beginDelayingTerminate];
}

+ (void)endDelayingTerminate
{
  v2 = (void *)[+[SUDelayedQuitController sharedInstance] mainThreadProxy];

  [v2 _endDelayingTerminate];
}

- (void)_beginDelayingTerminate
{
}

- (void)_checkInLongLivedViewController:(id)a3
{
  longLivedViewControllers = self->_longLivedViewControllers;
  if (!longLivedViewControllers)
  {
    longLivedViewControllers = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_longLivedViewControllers = longLivedViewControllers;
  }
  if (([(NSMutableArray *)longLivedViewControllers containsObject:a3] & 1) == 0)
  {
    [(NSMutableArray *)self->_longLivedViewControllers addObject:a3];
    [(SUDelayedQuitController *)self _beginDelayingTerminate];
  }
}

- (void)_checkOutLongLivedViewController:(id)a3
{
  longLivedViewControllers = self->_longLivedViewControllers;
  if (longLivedViewControllers
    && -[NSMutableArray containsObject:](longLivedViewControllers, "containsObject:"))
  {
    id v6 = a3;
    [(NSMutableArray *)self->_longLivedViewControllers removeObject:a3];
    v7 = (void *)[(SUDelayedQuitController *)self mainThreadProxy];
    [v7 _endDelayingTerminate];
  }
}

- (id)_checkedInViewControllerOfClass:(Class)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  longLivedViewControllers = self->_longLivedViewControllers;
  uint64_t v4 = [(NSMutableArray *)longLivedViewControllers countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (!v4) {
    return 0;
  }
  uint64_t v5 = v4;
  uint64_t v6 = *(void *)v11;
LABEL_3:
  uint64_t v7 = 0;
  while (1)
  {
    if (*(void *)v11 != v6) {
      objc_enumerationMutation(longLivedViewControllers);
    }
    v8 = *(void **)(*((void *)&v10 + 1) + 8 * v7);
    if (objc_opt_isKindOfClass()) {
      return v8;
    }
    if (v5 == ++v7)
    {
      uint64_t v5 = [(NSMutableArray *)longLivedViewControllers countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v5) {
        goto LABEL_3;
      }
      return 0;
    }
  }
}

- (void)_endDelayingTerminate
{
  int64_t delayTerminateCount = self->_delayTerminateCount;
  BOOL v3 = delayTerminateCount < 1;
  int64_t v4 = delayTerminateCount - 1;
  if (!v3)
  {
    self->_int64_t delayTerminateCount = v4;
    uint64_t v6 = (void *)[MEMORY[0x263F1C408] sharedApplication];
    if (!self->_delayTerminateCount)
    {
      uint64_t v7 = v6;
      if ([v6 isSuspended])
      {
        if (([v7 isSuspendedEventsOnly] & 1) == 0)
        {
          [v7 terminateWithSuccess];
        }
      }
    }
  }
}

- (BOOL)_isDelayingTerminate
{
  return self->_delayTerminateCount > 0;
}

- (BOOL)_viewControllerIsLongLived:(id)a3
{
  return [(NSMutableArray *)self->_longLivedViewControllers containsObject:a3];
}

@end