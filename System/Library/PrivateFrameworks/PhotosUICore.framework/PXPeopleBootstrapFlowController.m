@interface PXPeopleBootstrapFlowController
- (BOOL)hasNextViewController;
- (BOOL)hasPreviousViewController;
- (BOOL)shouldPresentConfirmationForPerson:(id)a3;
- (BOOL)shouldPresentNaming;
- (BOOL)shouldPresentPostNaming;
- (BOOL)wantsCancelButton;
- (NSArray)viewControllers;
- (PXPeopleBootstrapContext)context;
- (PXPeopleBootstrapFlowController)init;
- (PXPeopleBootstrapFlowController)initWithContext:(id)a3;
- (PXPeopleBootstrapFlowDelegate)bootstrapDelegate;
- (PXPeopleFlowViewController)nextViewController;
- (PXPeopleFlowViewController)previousViewController;
- (PXPeopleSuggestionManagerDataSource)bootstrapDataSource;
- (id)initEmptyFlowWithContext:(id)a3;
- (unint64_t)namingResultType;
- (unint64_t)viewControllerIndex;
- (void)cancel:(id)a3;
- (void)commonInitWithContext:(id)a3;
- (void)dealloc;
- (void)done:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setBootstrapDataSource:(id)a3;
- (void)setBootstrapDelegate:(id)a3;
- (void)setNamingResultType:(unint64_t)a3;
- (void)setViewControllerIndex:(unint64_t)a3;
- (void)setViewControllers:(id)a3;
@end

@implementation PXPeopleBootstrapFlowController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewControllers, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_bootstrapDataSource, 0);
  objc_storeStrong((id *)&self->_bootstrapDelegate, 0);
}

- (void)setViewControllerIndex:(unint64_t)a3
{
  self->_viewControllerIndex = a3;
}

- (unint64_t)viewControllerIndex
{
  return self->_viewControllerIndex;
}

- (void)setViewControllers:(id)a3
{
}

- (NSArray)viewControllers
{
  return self->_viewControllers;
}

- (void)setNamingResultType:(unint64_t)a3
{
  self->_namingResultType = a3;
}

- (unint64_t)namingResultType
{
  return self->_namingResultType;
}

- (PXPeopleBootstrapContext)context
{
  return self->_context;
}

- (void)setBootstrapDataSource:(id)a3
{
}

- (PXPeopleSuggestionManagerDataSource)bootstrapDataSource
{
  return self->_bootstrapDataSource;
}

- (void)setBootstrapDelegate:(id)a3
{
}

- (PXPeopleBootstrapFlowDelegate)bootstrapDelegate
{
  return self->_bootstrapDelegate;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v7 = a3;
  if ([v7 isEqualToString:@"nameSelection"]) {
    [(PXPeopleBootstrapFlowController *)self recomputeViewControllersForChangeInKeyPath:v7];
  }
}

- (BOOL)shouldPresentConfirmationForPerson:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(PXPeopleBootstrapFlowController *)self context];
  if (([v5 wantsMergeCandidateSuggestions] & 1) == 0)
  {
    v9 = PLUIGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v21 = 138412290;
      v22 = v5;
      _os_log_impl(&dword_1A9AE7000, v9, OS_LOG_TYPE_INFO, "People UI: Not creating bootstrap confirmation view controller; context doesn't want candidate suggestions for context: %@",
        (uint8_t *)&v21,
        0xCu);
    }

    +[PXPeopleUtilities shouldShowBootstrapForPerson:v4 context:v5];
    goto LABEL_8;
  }
  if (!+[PXPeopleUtilities shouldShowBootstrapForPerson:v4 context:v5])
  {
LABEL_8:
    BOOL v10 = 0;
    goto LABEL_15;
  }
  v6 = [v5 prefetchedDataSource];
  id v7 = v6;
  if (v6) {
    v8 = v6;
  }
  else {
    v8 = [[PXPeopleSuggestionDataSource alloc] initWithFlowType:1];
  }
  v11 = v8;

  v12 = (void *)MEMORY[0x1E4F1CA48];
  v13 = [(PXPeopleSuggestionDataSource *)v11 fetchAndCacheMergeCandidatesForPerson:v4];
  v14 = [v13 fetchedObjects];
  v15 = [v12 arrayWithArray:v14];

  v16 = [v5 nameSelection];
  v17 = [v16 person];

  [v15 removeObject:v17];
  uint64_t v18 = [v15 count];
  BOOL v10 = v18 != 0;
  if (!v18)
  {
    v19 = PLUIGetLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      int v21 = 138412290;
      v22 = v5;
      _os_log_impl(&dword_1A9AE7000, v19, OS_LOG_TYPE_INFO, "People UI: Not creating bootstrap confirmation view controller; no merge candidates for context: %@",
        (uint8_t *)&v21,
        0xCu);
    }
  }
LABEL_15:

  return v10;
}

- (void)cancel:(id)a3
{
  id v7 = [(PXPeopleBootstrapFlowController *)self context];
  id v4 = [v7 cancelBlock];

  if (v4)
  {
    v5 = [v7 cancelBlock];
    v5[2]();
  }
  v6 = [(PXPeopleBootstrapFlowController *)self bootstrapDelegate];
  [v6 bootstrapFlowController:self didFinishWithSuccess:0];
}

- (void)done:(id)a3
{
  id v4 = [PXPeopleConfirmationInfo alloc];
  v5 = [(PXPeopleBootstrapFlowController *)self context];
  v8 = [(PXPeopleConfirmationInfo *)v4 initWithBootstrapContext:v5];

  v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v6 postNotificationName:@"PXPeopleConfirmationDidFinish" object:v8];

  id v7 = [(PXPeopleBootstrapFlowController *)self bootstrapDelegate];
  [v7 bootstrapFlowController:self didFinishWithSuccess:1];
}

- (BOOL)wantsCancelButton
{
  unint64_t v3 = [(PXPeopleBootstrapFlowController *)self viewControllerIndex];
  id v4 = [(PXPeopleBootstrapFlowController *)self viewControllers];
  v5 = [v4 objectAtIndex:v3];

  LOBYTE(v4) = [v5 wantsCancelButton];
  return (char)v4;
}

- (PXPeopleFlowViewController)previousViewController
{
  if ([(PXPeopleBootstrapFlowController *)self hasPreviousViewController])
  {
    unint64_t v3 = [(PXPeopleBootstrapFlowController *)self viewControllerIndex] - 1;
    [(PXPeopleBootstrapFlowController *)self setViewControllerIndex:v3];
    id v4 = [(PXPeopleBootstrapFlowController *)self viewControllers];
    v5 = [v4 objectAtIndex:v3];
  }
  else
  {
    v5 = 0;
  }
  return (PXPeopleFlowViewController *)v5;
}

- (BOOL)hasPreviousViewController
{
  unint64_t v2 = [(PXPeopleBootstrapFlowController *)self viewControllerIndex];
  if (v2) {
    BOOL v3 = v2 == 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    BOOL v3 = 1;
  }
  return !v3;
}

- (PXPeopleFlowViewController)nextViewController
{
  if ([(PXPeopleBootstrapFlowController *)self hasNextViewController])
  {
    unint64_t v3 = [(PXPeopleBootstrapFlowController *)self viewControllerIndex];
    if (v3 == 0x7FFFFFFFFFFFFFFFLL) {
      unint64_t v4 = 0;
    }
    else {
      unint64_t v4 = v3 + 1;
    }
    [(PXPeopleBootstrapFlowController *)self setViewControllerIndex:v4];
    v5 = [(PXPeopleBootstrapFlowController *)self viewControllers];
    v6 = [v5 objectAtIndex:v4];
  }
  else
  {
    v6 = 0;
  }
  return (PXPeopleFlowViewController *)v6;
}

- (BOOL)hasNextViewController
{
  unint64_t v3 = [(PXPeopleBootstrapFlowController *)self viewControllers];
  uint64_t v4 = [v3 count];

  unint64_t v5 = [(PXPeopleBootstrapFlowController *)self viewControllerIndex];
  BOOL v7 = v5 == 0x7FFFFFFFFFFFFFFFLL || v5 < v4 - 1;
  return v4 && v7;
}

- (BOOL)shouldPresentPostNaming
{
  unint64_t v2 = [(PXPeopleBootstrapFlowController *)self context];
  char v3 = [v2 wantsPostNaming];

  return v3;
}

- (BOOL)shouldPresentNaming
{
  unint64_t v2 = [(PXPeopleBootstrapFlowController *)self context];
  char v3 = [v2 sourcePerson];
  uint64_t v4 = objc_msgSend(v3, "px_localizedName");
  uint64_t v5 = [v4 length];

  if (v5 && [v2 bootstrapType] != 1) {
    char v6 = 0;
  }
  else {
    char v6 = [v2 wantsNaming];
  }

  return v6;
}

- (void)dealloc
{
  char v3 = [(PXPeopleBootstrapFlowController *)self context];
  [v3 removeObserver:self forKeyPath:@"nameSelection"];

  v4.receiver = self;
  v4.super_class = (Class)PXPeopleBootstrapFlowController;
  [(PXPeopleBootstrapFlowController *)&v4 dealloc];
}

- (id)initEmptyFlowWithContext:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PXPeopleBootstrapFlowController;
  uint64_t v5 = [(PXPeopleBootstrapFlowController *)&v8 init];
  char v6 = v5;
  if (v5) {
    [(PXPeopleBootstrapFlowController *)v5 commonInitWithContext:v4];
  }

  return v6;
}

- (PXPeopleBootstrapFlowController)initWithContext:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PXPeopleBootstrapFlowController;
  uint64_t v5 = [(PXPeopleBootstrapFlowController *)&v10 init];
  char v6 = v5;
  if (v5)
  {
    [(PXPeopleBootstrapFlowController *)v5 commonInitWithContext:v4];
    [(PXPeopleBootstrapFlowController *)v6 computeViewControllersForBootstrapFlow];
    BOOL v7 = [v4 onInitBlock];

    if (v7)
    {
      objc_super v8 = [v4 onInitBlock];
      v8[2]();
    }
  }

  return v6;
}

- (void)commonInitWithContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
  id v5 = a3;
  self->_viewControllerIndex = 0x7FFFFFFFFFFFFFFFLL;
  [v5 addObserver:self forKeyPath:@"nameSelection" options:0 context:0];
}

- (PXPeopleBootstrapFlowController)init
{
  return 0;
}

@end