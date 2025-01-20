@interface UIStoryboardUnwindSegueSource
- (SEL)unwindAction;
- (UIStoryboardUnwindSegueSource)init;
- (UIViewController)sourceViewController;
- (id)_childContainingUnwindSourceForViewController:(id)a3;
- (id)_findDestination;
- (id)_initWithSourceViewController:(id)a3 action:(SEL)a4 sender:(id)a5;
- (id)sender;
@end

@implementation UIStoryboardUnwindSegueSource

- (UIStoryboardUnwindSegueSource)init
{
  return 0;
}

- (id)_initWithSourceViewController:(id)a3 action:(SEL)a4 sender:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)UIStoryboardUnwindSegueSource;
  v11 = [(UIStoryboardUnwindSegueSource *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_sourceViewController, a3);
    v12->_unwindAction = a4;
    objc_storeStrong(&v12->_sender, a5);
  }

  return v12;
}

- (id)_childContainingUnwindSourceForViewController:(id)a3
{
  id v4 = a3;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__186;
  v21 = __Block_byref_object_dispose__186;
  id v22 = 0;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x2020000000;
  char v16 = 0;
  searchChain = self->_searchChain;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __79__UIStoryboardUnwindSegueSource__childContainingUnwindSourceForViewController___block_invoke;
  v11[3] = &unk_1E5308208;
  v13 = v15;
  id v6 = v4;
  id v12 = v6;
  objc_super v14 = &v17;
  [(NSMutableArray *)searchChain enumerateObjectsWithOptions:2 usingBlock:v11];
  sourceViewController = (UIViewController *)v18[5];
  if (sourceViewController) {
    goto LABEL_2;
  }
  id v9 = [(UIViewController *)self->_sourceViewController parentViewController];

  if (v9 == v6)
  {
    sourceViewController = self->_sourceViewController;
LABEL_2:
    v8 = sourceViewController;
    goto LABEL_5;
  }
  v8 = 0;
LABEL_5:

  _Block_object_dispose(v15, 8);
  _Block_object_dispose(&v17, 8);

  return v8;
}

void __79__UIStoryboardUnwindSegueSource__childContainingUnwindSourceForViewController___block_invoke(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  uint64_t v8 = *(void *)(a1[5] + 8);
  id v12 = v7;
  if (*(unsigned char *)(v8 + 24))
  {
    uint64_t v9 = [v7 parentViewController];
    if (v9)
    {
      id v10 = (void *)v9;
      do
      {
        if (v10 == (void *)a1[4])
        {
          objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), a2);
          *a4 = 1;
        }
        uint64_t v11 = [v10 parentViewController];

        id v10 = (void *)v11;
      }
      while (v11);
    }
  }
  else if ((id)a1[4] == v7)
  {
    *(unsigned char *)(v8 + 24) = 1;
  }
}

- (id)_findDestination
{
  v3 = (NSMutableArray *)objc_opt_new();
  searchChain = self->_searchChain;
  self->_searchChain = v3;

  v5 = [MEMORY[0x1E4F28D30] hashTableWithOptions:512];
  id v6 = self->_sourceViewController;
  uint64_t v7 = [(UIViewController *)v6 _nextViewControllerForUnwindSegueSearch];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    while (1)
    {
      [(NSMutableArray *)self->_searchChain addObject:v8];
      uint64_t v9 = [v8 _destinationForUnwindingFromSource:self visitedViewControllers:v5];
      if (v9) {
        break;
      }
      id v10 = [v8 _nextViewControllerForUnwindSegueSearch];

      uint64_t v8 = v10;
      if (!v10) {
        goto LABEL_8;
      }
    }
    id v10 = (void *)v9;
  }
  else
  {
    id v10 = 0;
  }
LABEL_8:

  return v10;
}

- (UIViewController)sourceViewController
{
  return (UIViewController *)objc_getProperty(self, a2, 16, 1);
}

- (SEL)unwindAction
{
  return self->_unwindAction;
}

- (id)sender
{
  return objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_sender, 0);
  objc_storeStrong((id *)&self->_sourceViewController, 0);
  objc_storeStrong((id *)&self->_searchChain, 0);
}

@end