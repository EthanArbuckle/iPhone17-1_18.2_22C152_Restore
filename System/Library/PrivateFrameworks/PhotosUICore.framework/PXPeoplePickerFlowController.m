@interface PXPeoplePickerFlowController
+ (id)new;
- (BOOL)_hasMergeCandidatesForDataSource:(id)a3 person:(id)a4;
- (BOOL)hasNextViewController;
- (BOOL)hasPreviousViewController;
- (NSArray)contexts;
- (NSArray)people;
- (NSArray)viewControllers;
- (NSMutableArray)bootstrappedSourceUUIDs;
- (PXPeopleFlowDelegate)flowDelegate;
- (PXPeopleFlowViewController)nextViewController;
- (PXPeopleFlowViewController)previousViewController;
- (PXPeoplePickerFlowController)init;
- (PXPeoplePickerFlowController)initWithPeople:(id)a3;
- (PXPeoplePickerFlowController)initWithPeople:(id)a3 backingScaleFactor:(double)a4;
- (double)backingScaleFactor;
- (id)_dataSource;
- (int64_t)viewControllerIndex;
- (void)_computeViewControllersForPeople:(id)a3;
- (void)cancel:(id)a3;
- (void)done:(id)a3;
- (void)setBackingScaleFactor:(double)a3;
- (void)setBootstrappedSourceUUIDs:(id)a3;
- (void)setContexts:(id)a3;
- (void)setFlowDelegate:(id)a3;
- (void)setViewControllerIndex:(int64_t)a3;
- (void)setViewControllers:(id)a3;
@end

@implementation PXPeoplePickerFlowController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contexts, 0);
  objc_storeStrong((id *)&self->_viewControllers, 0);
  objc_storeStrong((id *)&self->_people, 0);
  objc_storeStrong((id *)&self->_bootstrappedSourceUUIDs, 0);
  objc_destroyWeak((id *)&self->_flowDelegate);
}

- (void)setBackingScaleFactor:(double)a3
{
  self->_backingScaleFactor = a3;
}

- (double)backingScaleFactor
{
  return self->_backingScaleFactor;
}

- (void)setViewControllerIndex:(int64_t)a3
{
  self->_viewControllerIndex = a3;
}

- (int64_t)viewControllerIndex
{
  return self->_viewControllerIndex;
}

- (void)setContexts:(id)a3
{
}

- (NSArray)contexts
{
  return self->_contexts;
}

- (void)setViewControllers:(id)a3
{
}

- (NSArray)people
{
  return self->_people;
}

- (void)setBootstrappedSourceUUIDs:(id)a3
{
}

- (void)setFlowDelegate:(id)a3
{
}

- (PXPeopleFlowDelegate)flowDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_flowDelegate);
  return (PXPeopleFlowDelegate *)WeakRetained;
}

- (PXPeoplePickerFlowController)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXPeoplePickerFlowController.m", 162, @"%s is not available as initializer", "-[PXPeoplePickerFlowController init]");

  abort();
}

- (BOOL)_hasMergeCandidatesForDataSource:(id)a3 person:(id)a4
{
  v4 = [a3 fetchAndCacheMergeCandidatesForPerson:a4];
  BOOL v5 = [v4 count] != 0;

  return v5;
}

- (id)_dataSource
{
  v2 = [[PXPeopleSuggestionDataSource alloc] initWithFlowType:1];
  [(PXPeopleSuggestionDataSource *)v2 setSuggestionFetchType:0];
  return v2;
}

- (void)_computeViewControllersForPeople:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x2020000000;
  v17[3] = 0;
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  v11 = __65__PXPeoplePickerFlowController__computeViewControllersForPeople___block_invoke;
  v12 = &unk_1E5DD3408;
  v13 = self;
  id v7 = v6;
  id v14 = v7;
  id v8 = v5;
  id v15 = v8;
  v16 = v17;
  [v4 enumerateObjectsUsingBlock:&v9];
  -[PXPeoplePickerFlowController setViewControllers:](self, "setViewControllers:", v8, v9, v10, v11, v12, v13);
  [(PXPeoplePickerFlowController *)self setContexts:v7];

  _Block_object_dispose(v17, 8);
}

void __65__PXPeoplePickerFlowController__computeViewControllersForPeople___block_invoke(uint64_t a1, void *a2, unint64_t a3, BOOL *a4)
{
  v21[2] = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = [*(id *)(a1 + 32) _dataSource];
  if ([*(id *)(a1 + 32) _hasMergeCandidatesForDataSource:v8 person:v7])
  {
    uint64_t v9 = +[PXPeopleBootstrapContext contextWithPerson:v7 type:3];
    [v9 setWantsNaming:0];
    [*(id *)(a1 + 32) backingScaleFactor];
    objc_msgSend(v9, "setBackingScaleFactor:");
    uint64_t v10 = NSString;
    v11 = [MEMORY[0x1E4F28F80] processInfo];
    v12 = [v11 processName];
    v13 = [@"/Library/Caches/com.apple.xbs/Sources/Photos_UICore/workspaces/photosshared/PhotosUICore/PhotosUICore/Photo Picker/People Picker/Shared/PXPeoplePickerFlowController.m" lastPathComponent];
    id v14 = [v10 stringWithFormat:@"%@:%@:%s:%d", v12, v13, "-[PXPeoplePickerFlowController _computeViewControllersForPeople:]_block_invoke", 125];
    [v9 setCallerInfo:v14];

    [*(id *)(a1 + 40) addObject:v9];
    id v15 = [[PXPeopleBootstrapConfirmationViewController alloc] initWithContext:v9 dataSource:v8];
    [(PXPeopleBootstrapConfirmationViewController *)v15 setUseLowMemoryMode:1];
    v16 = [[PXPeopleBootstrapSummaryViewController alloc] initWithContext:v9];
    [(PXPeopleBootstrapSummaryViewController *)v16 setUseLowMemoryMode:1];
    v17 = *(void **)(a1 + 48);
    v21[0] = v15;
    v21[1] = v16;
    v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:2];
    [v17 addObjectsFromArray:v18];

    ++*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
  }
  BOOL v20 = a3 > 9 || *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) > 4;
  *a4 = v20;
}

- (void)cancel:(id)a3
{
  id v4 = a3;
  id v5 = [(PXPeoplePickerFlowController *)self flowDelegate];
  [v5 cancel:v4];
}

- (void)done:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v20 = a3;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = [(PXPeoplePickerFlowController *)self contexts];
  uint64_t v4 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v23;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v23 != v6) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v22 + 1) + 8 * v7);
        uint64_t v9 = [v8 sourcePerson];
        if (v9)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            goto LABEL_8;
          }
          v12 = [MEMORY[0x1E4F28B00] currentHandler];
          id v15 = (objc_class *)objc_opt_class();
          id v14 = NSStringFromClass(v15);
          v18 = objc_msgSend(v9, "px_descriptionForAssertionMessage");
          [v12 handleFailureInMethod:a2, self, @"PXPeoplePickerFlowController.m", 101, @"%@ should be an instance inheriting from %@, but it is %@", @"context.sourcePerson", v14, v18 object file lineNumber description];
        }
        else
        {
          v12 = [MEMORY[0x1E4F28B00] currentHandler];
          v13 = (objc_class *)objc_opt_class();
          id v14 = NSStringFromClass(v13);
          [v12 handleFailureInMethod:a2, self, @"PXPeoplePickerFlowController.m", 101, @"%@ should be an instance inheriting from %@, but it is nil", @"context.sourcePerson", v14 object file lineNumber description];
        }

LABEL_8:
        +[PXPeopleBootstrap performBootstrapWithSourcePerson:v9 context:v8 synchronous:0 completion:0];
        bootstrappedSourceUUIDs = self->_bootstrappedSourceUUIDs;
        v11 = [v9 uuid];
        [(NSMutableArray *)bootstrappedSourceUUIDs addObject:v11];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v16 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
      uint64_t v5 = v16;
    }
    while (v16);
  }

  v17 = [(PXPeoplePickerFlowController *)self flowDelegate];
  [v17 done:v20];
}

- (PXPeopleFlowViewController)previousViewController
{
  if ([(PXPeoplePickerFlowController *)self hasPreviousViewController])
  {
    int64_t v3 = [(PXPeoplePickerFlowController *)self viewControllerIndex] - 1;
    [(PXPeoplePickerFlowController *)self setViewControllerIndex:v3];
    uint64_t v4 = [(PXPeoplePickerFlowController *)self viewControllers];
    uint64_t v5 = [v4 objectAtIndex:v3];
  }
  else
  {
    uint64_t v5 = 0;
  }
  return (PXPeopleFlowViewController *)v5;
}

- (BOOL)hasPreviousViewController
{
  return [(PXPeoplePickerFlowController *)self viewControllerIndex] > 0;
}

- (PXPeopleFlowViewController)nextViewController
{
  if ([(PXPeoplePickerFlowController *)self hasNextViewController])
  {
    int64_t v3 = [(PXPeoplePickerFlowController *)self viewControllerIndex] + 1;
    [(PXPeoplePickerFlowController *)self setViewControllerIndex:v3];
    uint64_t v4 = [(PXPeoplePickerFlowController *)self viewControllers];
    uint64_t v5 = [v4 objectAtIndex:v3];
  }
  else
  {
    uint64_t v5 = 0;
  }
  return (PXPeopleFlowViewController *)v5;
}

- (BOOL)hasNextViewController
{
  int64_t v3 = [(PXPeoplePickerFlowController *)self viewControllers];
  uint64_t v4 = [v3 count];

  int64_t v5 = [(PXPeoplePickerFlowController *)self viewControllerIndex];
  return v4 > 0 && v5 < v4 - 1;
}

- (NSArray)viewControllers
{
  int64_t v3 = self->_viewControllers;
  if (!v3)
  {
    uint64_t v4 = [(PXPeoplePickerFlowController *)self people];
    [(PXPeoplePickerFlowController *)self _computeViewControllersForPeople:v4];

    int64_t v3 = self->_viewControllers;
  }
  return v3;
}

- (NSMutableArray)bootstrappedSourceUUIDs
{
  v2 = (void *)[(NSMutableArray *)self->_bootstrappedSourceUUIDs copy];
  return (NSMutableArray *)v2;
}

- (PXPeoplePickerFlowController)initWithPeople:(id)a3 backingScaleFactor:(double)a4
{
  id v7 = a3;
  if (a4 <= 0.0)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"PXPeoplePickerFlowController.m", 41, @"Invalid parameter not satisfying: %@", @"backingScaleFactor > 0" object file lineNumber description];
  }
  id v8 = [(PXPeoplePickerFlowController *)self initWithPeople:v7];
  uint64_t v9 = v8;
  if (v8) {
    v8->_backingScaleFactor = a4;
  }

  return v9;
}

- (PXPeoplePickerFlowController)initWithPeople:(id)a3
{
  id v6 = a3;
  if (![v6 count])
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"PXPeoplePickerFlowController.m", 30, @"Invalid parameter not satisfying: %@", @"people.count > 0" object file lineNumber description];
  }
  v13.receiver = self;
  v13.super_class = (Class)PXPeoplePickerFlowController;
  id v7 = [(PXPeoplePickerFlowController *)&v13 init];
  id v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_people, a3);
    v8->_viewControllerIndex = -1;
    uint64_t v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    bootstrappedSourceUUIDs = v8->_bootstrappedSourceUUIDs;
    v8->_bootstrappedSourceUUIDs = v9;
  }
  return v8;
}

+ (id)new
{
  uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"PXPeoplePickerFlowController.m", 166, @"%s is not available as initializer", "+[PXPeoplePickerFlowController new]");

  abort();
}

@end