@interface SBHLibraryPodFolderController
+ (Class)_contentViewClass;
+ (Class)configurationClass;
+ (id)iconLocation;
- (ATXAppDirectoryClient)loggingClient;
- (BOOL)_isViewControllerVisible;
- (BOOL)_ourFolderContainsFolder:(id)a3;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)isDisplayingIcon:(id)a3;
- (BOOL)isDisplayingIcon:(id)a3 inLocation:(id)a4;
- (BOOL)isDisplayingIcon:(id)a3 inLocations:(id)a4;
- (BOOL)isDisplayingIconView:(id)a3;
- (BOOL)isDisplayingIconView:(id)a3 inLocation:(id)a4;
- (BOOL)isOpen;
- (BOOL)isPresentingIconLocation:(id)a3;
- (BOOL)shouldOpenFolderIcon:(id)a3;
- (BSUIScrollViewDelegate)librarySearchControllerScrollViewDelegate;
- (Class)controllerClassForFolder:(id)a3;
- (NSSet)presentedIconLocations;
- (SBHIconImageCache)iconImageCache;
- (SBHLibraryCategoriesFolderDataSource)dataSource;
- (SBHLibraryCategoryMap)libraryCategoryMap;
- (SBHLibraryPodFolderController)initWithConfiguration:(id)a3;
- (SBHLibraryPodFolderControllerDelegate)podFolderControllerDelegate;
- (SBIconListLayoutProvider)listLayoutProvider;
- (SBIconListView)currentIconListView;
- (UITapGestureRecognizer)tapToDismissRecognizer;
- (UIView)containerView;
- (id)_nestingViewControllerForPushing;
- (id)contentScrollView;
- (id)firstIconViewForIcon:(id)a3;
- (id)firstIconViewForIcon:(id)a3 excludingLocations:(id)a4;
- (id)firstIconViewForIcon:(id)a3 inLocations:(id)a4;
- (id)firstNonSuggestionsOrRecentsIconViewForIcon:(id)a3;
- (id)folderIconViewForIcon:(id)a3 folderRelativeIconIndexPath:(id *)a4;
- (id)iconViewForIcon:(id)a3 location:(id)a4;
- (id)iconViewForIcon:(id)a3 location:(id)a4 options:(unint64_t)a5;
- (void)_reloadAppIcons;
- (void)categoriesDataSource:(id)a3 shouldAnimateLayoutForCategories:(id)a4;
- (void)categoriesDataSourceNeedsAnimatedReload:(id)a3;
- (void)configureInnerFolderControllerConfiguration:(id)a3;
- (void)dismissDisplayedContextMenu;
- (void)enumerateDisplayedIconViewsForIcon:(id)a3 usingBlock:(id)a4;
- (void)enumerateDisplayedIconViewsUsingBlock:(id)a3;
- (void)enumerateNonSuggestionsOrRecentsViewControllersUsingBlock:(id)a3;
- (void)enumerateViewControllersUsingBlock:(id)a3;
- (void)handleTapGesture:(id)a3;
- (void)iconListView:(id)a3 didAddIconView:(id)a4;
- (void)iconListView:(id)a3 didRemoveIconView:(id)a4;
- (void)iconViewDidHandleTap:(id)a3;
- (void)pushNestedViewController:(id)a3 animated:(BOOL)a4 withCompletion:(id)a5;
- (void)setContentAlpha:(double)a3;
- (void)setIconImageCache:(id)a3;
- (void)setLibraryCategoryMap:(id)a3;
- (void)setLibrarySearchControllerScrollViewDelegate:(id)a3;
- (void)setListLayoutProvider:(id)a3;
- (void)setPodFolderControllerDelegate:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation SBHLibraryPodFolderController

- (void)enumerateViewControllersUsingBlock:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  v4 = (void (**)(id, void *, unsigned char *))a3;
  unsigned __int8 v31 = 0;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  v5 = [(SBFolderController *)self folderView];
  v6 = [v5 iconListViews];

  uint64_t v20 = [v6 countByEnumeratingWithState:&v27 objects:v33 count:16];
  if (v20)
  {
    uint64_t v7 = *(void *)v28;
    v22 = v6;
    uint64_t v19 = *(void *)v28;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v28 != v7) {
          objc_enumerationMutation(v6);
        }
        uint64_t v21 = v8;
        v9 = *(void **)(*((void *)&v27 + 1) + 8 * v8);
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        v10 = objc_msgSend(v9, "icons", v19);
        uint64_t v11 = [v10 countByEnumeratingWithState:&v23 objects:v32 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v24;
          while (2)
          {
            for (uint64_t i = 0; i != v12; ++i)
            {
              if (*(void *)v24 != v13) {
                objc_enumerationMutation(v10);
              }
              v15 = [v9 displayedIconViewForIcon:*(void *)(*((void *)&v23 + 1) + 8 * i)];
              v16 = v15;
              if (v15)
              {
                v17 = [v15 customIconImageViewController];
                v4[2](v4, v17, &v31);
                int v18 = v31;

                if (v18)
                {

                  v6 = v22;
                  goto LABEL_19;
                }
              }
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v23 objects:v32 count:16];
            if (v12) {
              continue;
            }
            break;
          }
        }

        uint64_t v8 = v21 + 1;
        v6 = v22;
        uint64_t v7 = v19;
      }
      while (v21 + 1 != v20);
      uint64_t v20 = [v22 countByEnumeratingWithState:&v27 objects:v33 count:16];
    }
    while (v20);
  }
LABEL_19:
}

uint64_t __71__SBHLibraryPodFolderController_enumerateDisplayedIconViewsUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  return [a2 enumerateDisplayedIconViewsUsingBlock:*(void *)(a1 + 32)];
}

- (void)enumerateDisplayedIconViewsUsingBlock:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  v4 = (void (**)(id, void *, unsigned char *))a3;
  v5 = [(SBFolderController *)self folder];
  char v6 = [v5 isRootFolder];

  if (v6)
  {
    if (v4)
    {
      char v32 = 0;
      long long v28 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      uint64_t v7 = [(SBFolderController *)self folderView];
      uint64_t v8 = [v7 iconListViews];

      uint64_t v20 = [v8 countByEnumeratingWithState:&v28 objects:v35 count:16];
      if (v20)
      {
        uint64_t v9 = *(void *)v29;
        uint64_t v21 = v8;
        uint64_t v19 = *(void *)v29;
        do
        {
          uint64_t v10 = 0;
          do
          {
            if (*(void *)v29 != v9) {
              objc_enumerationMutation(v8);
            }
            uint64_t v11 = *(void **)(*((void *)&v28 + 1) + 8 * v10);
            long long v24 = 0u;
            long long v25 = 0u;
            long long v26 = 0u;
            long long v27 = 0u;
            uint64_t v12 = objc_msgSend(v11, "icons", v19);
            uint64_t v13 = [v12 countByEnumeratingWithState:&v24 objects:v34 count:16];
            if (v13)
            {
              uint64_t v14 = v13;
              uint64_t v15 = *(void *)v25;
              while (2)
              {
                uint64_t v16 = 0;
                do
                {
                  if (*(void *)v25 != v15) {
                    objc_enumerationMutation(v12);
                  }
                  v17 = [v11 displayedIconViewForIcon:*(void *)(*((void *)&v24 + 1) + 8 * v16)];
                  if (v17)
                  {
                    v4[2](v4, v17, &v32);
                    if (v32)
                    {

                      int v18 = v21;
                      goto LABEL_22;
                    }
                  }

                  ++v16;
                }
                while (v14 != v16);
                uint64_t v14 = [v12 countByEnumeratingWithState:&v24 objects:v34 count:16];
                if (v14) {
                  continue;
                }
                break;
              }
            }

            ++v10;
            uint64_t v8 = v21;
            uint64_t v9 = v19;
          }
          while (v10 != v20);
          uint64_t v20 = [v21 countByEnumeratingWithState:&v28 objects:v35 count:16];
        }
        while (v20);
      }

      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __71__SBHLibraryPodFolderController_enumerateDisplayedIconViewsUsingBlock___block_invoke;
      v22[3] = &unk_1E6AAEC40;
      long long v23 = v4;
      [(SBHLibraryPodFolderController *)self enumerateViewControllersUsingBlock:v22];
      int v18 = v23;
LABEL_22:
    }
  }
  else
  {
    v33.receiver = self;
    v33.super_class = (Class)SBHLibraryPodFolderController;
    [(SBFolderController *)&v33 enumerateDisplayedIconViewsUsingBlock:v4];
  }
}

- (SBHLibraryPodFolderController)initWithConfiguration:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;
  v18.receiver = self;
  v18.super_class = (Class)SBHLibraryPodFolderController;
  uint64_t v7 = [(SBFolderController *)&v18 initWithConfiguration:v4];
  if (v7)
  {
    uint64_t v8 = [(id)objc_opt_class() iconLocation];
    int v9 = [v8 isEqualToString:@"SBIconLocationAppLibrary"];

    if (v9)
    {
      uint64_t v10 = [SBHLibraryCategoriesFolderDataSource alloc];
      uint64_t v11 = [v6 categoriesFolder];
      uint64_t v12 = [(SBHLibraryCategoriesFolderDataSource *)v10 initWithCategoriesFolder:v11];
      dataSource = v7->_dataSource;
      v7->_dataSource = (SBHLibraryCategoriesFolderDataSource *)v12;

      [(SBHLibraryCategoriesFolderDataSource *)v7->_dataSource addObserver:v7];
      uint64_t v14 = [(SBHLibraryCategoriesFolderDataSource *)v7->_dataSource categoriesFolder];
      [(SBFolderController *)v7 setFolder:v14];
    }
    uint64_t v15 = [MEMORY[0x1E4F4AEB8] sharedInstance];
    loggingClient = v7->_loggingClient;
    v7->_loggingClient = (ATXAppDirectoryClient *)v15;
  }
  return v7;
}

- (void)viewDidLoad
{
  v8.receiver = self;
  v8.super_class = (Class)SBHLibraryPodFolderController;
  [(SBFolderController *)&v8 viewDidLoad];
  v3 = [(SBHLibraryPodFolderController *)self podFolderView];
  id v4 = [(SBFolderController *)self folder];
  [v3 setFolder:v4];
  v5 = (UITapGestureRecognizer *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:self action:sel_handleTapGesture_];
  tapToDismissRecognizer = self->_tapToDismissRecognizer;
  self->_tapToDismissRecognizer = v5;

  [(UITapGestureRecognizer *)self->_tapToDismissRecognizer setAllowableMovement:10.0];
  [(UITapGestureRecognizer *)self->_tapToDismissRecognizer setDelegate:self];
  uint64_t v7 = [v3 scalingView];
  [v7 addGestureRecognizer:self->_tapToDismissRecognizer];
}

+ (id)iconLocation
{
  return @"SBIconLocationAppLibrary";
}

+ (Class)configurationClass
{
  return (Class)self;
}

+ (Class)_contentViewClass
{
  return (Class)objc_opt_class();
}

- (id)contentScrollView
{
  v2 = [(SBHLibraryPodFolderController *)self podFolderView];
  v3 = [v2 podScrollView];

  return v3;
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SBHLibraryPodFolderController;
  [(SBFolderController *)&v4 viewWillAppear:a3];
  [(SBHLibraryPodFolderController *)self _updateContentOverlayInsetsForSelfAndChildren];
  [(SBHLibraryPodFolderController *)self _reloadAppIcons];
}

- (void)handleTapGesture:(id)a3
{
  id v8 = a3;
  id v4 = [(SBHLibraryPodFolderController *)self tapToDismissRecognizer];

  v5 = v8;
  if (v4 == v8)
  {
    BOOL v6 = [v8 state] == 3;
    v5 = v8;
    if (v6)
    {
      uint64_t v7 = [(SBHLibraryPodFolderController *)self podFolderControllerDelegate];
      [v7 libraryPodFolderControllerRequestsDismissal:self];

      v5 = v8;
    }
  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(SBHLibraryPodFolderController *)self tapToDismissRecognizer];

  if (v8 == v7)
  {
    uint64_t v10 = [(SBHLibraryPodFolderController *)self contentScrollView];
    id v11 = [v10 panGestureRecognizer];
    BOOL v9 = v11 == v6;
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v6 = a4;
  id v7 = [(SBHLibraryPodFolderController *)self tapToDismissRecognizer];

  BOOL v8 = 1;
  if (v7 == v15)
  {
    uint64_t v23 = 0;
    long long v24 = &v23;
    uint64_t v25 = 0x2020000000;
    char v26 = 1;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    BOOL v9 = [(SBFolderController *)self iconListViews];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v27 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v20 != v11) {
            objc_enumerationMutation(v9);
          }
          uint64_t v13 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          v16[0] = MEMORY[0x1E4F143A8];
          v16[1] = 3221225472;
          v16[2] = __70__SBHLibraryPodFolderController_gestureRecognizer_shouldReceiveTouch___block_invoke;
          v16[3] = &unk_1E6AAEB50;
          id v17 = v6;
          objc_super v18 = &v23;
          [v13 enumerateIconViewsUsingBlock:v16];
        }
        uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v27 count:16];
      }
      while (v10);
    }

    BOOL v8 = *((unsigned char *)v24 + 24) != 0;
    _Block_object_dispose(&v23, 8);
  }

  return v8;
}

BOOL __70__SBHLibraryPodFolderController_gestureRecognizer_shouldReceiveTouch___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = *(void **)(a1 + 32);
  id v7 = a2;
  [v6 locationInView:v7];
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  [v7 bounds];
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  CGFloat v19 = v18;

  v22.origin.x = v13;
  v22.origin.y = v15;
  v22.size.width = v17;
  v22.size.height = v19;
  v21.x = v9;
  v21.y = v11;
  BOOL result = CGRectContainsPoint(v22, v21);
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    *a4 = 1;
  }
  return result;
}

- (BOOL)shouldOpenFolderIcon:(id)a3
{
  id v4 = a3;
  v5 = [v4 folder];
  BOOL v6 = [(SBHLibraryPodFolderController *)self _ourFolderContainsFolder:v5];

  if (v6)
  {
    BOOL v7 = 1;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SBHLibraryPodFolderController;
    BOOL v7 = [(SBFolderController *)&v9 shouldOpenFolderIcon:v4];
  }

  return v7;
}

- (BOOL)isOpen
{
  return 1;
}

- (void)configureInnerFolderControllerConfiguration:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;
  if (v6)
  {
    BOOL v7 = [(SBHLibraryCategoriesFolderDataSource *)self->_dataSource categoriesFolder];
    [v6 setCategoriesFolder:v7];
  }
  v14.receiver = self;
  v14.super_class = (Class)SBHLibraryPodFolderController;
  [(SBFolderController *)&v14 configureInnerFolderControllerConfiguration:v4];
  objc_opt_class();
  double v8 = [v4 folder];
  objc_super v9 = [v8 icon];
  double v10 = SBFSafeCast();

  if (v10)
  {
    CGFloat v11 = [v10 category];
    double v12 = [v11 expandedPodFolder];
    [v4 setFolder:v12];

    CGFloat v13 = [v11 expandedPodFolder];
    [v13 setIcon:v10];
  }
}

- (Class)controllerClassForFolder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SBHLibraryPodFolderController;
  v5 = [(SBFolderController *)&v11 controllerClassForFolder:v4];
  if ([(objc_class *)v5 isEqual:objc_opt_class()])
  {
    id v6 = [(SBFolderController *)self folder];
    if (([v4 isEqual:v6] & 1) == 0)
    {
      BOOL v7 = [v4 rootFolder];
      int v8 = [v7 isEqual:v6];

      if (v8) {
        v5 = (objc_class *)objc_opt_class();
      }
    }
  }
  objc_super v9 = v5;

  return v9;
}

- (void)pushNestedViewController:(id)a3 animated:(BOOL)a4 withCompletion:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  double v10 = [(SBHLibraryPodFolderController *)self _nestingViewControllerForPushing];
  objc_super v11 = v10;
  if (v10 == self)
  {
    v12.receiver = self;
    v12.super_class = (Class)SBHLibraryPodFolderController;
    [(SBNestingViewController *)&v12 pushNestedViewController:v9 animated:v5 withCompletion:v8];
  }
  else
  {
    [(SBHLibraryPodFolderController *)v10 pushNestedViewController:v9 animated:v5 withCompletion:v8];
  }
}

- (UIView)containerView
{
  v2 = [(SBHLibraryPodFolderController *)self _nestingViewControllerForPushing];
  v3 = [v2 view];

  return (UIView *)v3;
}

- (SBIconListView)currentIconListView
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  v3 = [(SBHLibraryPodFolderController *)self _nestingViewControllerForPushing];
  id v4 = [v3 deepestNestedDescendantViewController];

  if (v4)
  {
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    BOOL v5 = [(SBFolderController *)self folderView];
    id v6 = [v5 iconListViews];

    id obj = v6;
    uint64_t v25 = [v6 countByEnumeratingWithState:&v31 objects:v36 count:16];
    if (v25)
    {
      uint64_t v24 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v25; ++i)
        {
          if (*(void *)v32 != v24) {
            objc_enumerationMutation(obj);
          }
          id v8 = *(void **)(*((void *)&v31 + 1) + 8 * i);
          long long v27 = 0u;
          long long v28 = 0u;
          long long v29 = 0u;
          long long v30 = 0u;
          char v26 = v8;
          id v9 = [v8 icons];
          uint64_t v10 = [v9 countByEnumeratingWithState:&v27 objects:v35 count:16];
          if (v10)
          {
            uint64_t v11 = v10;
            uint64_t v12 = *(void *)v28;
LABEL_9:
            uint64_t v13 = 0;
            while (1)
            {
              if (*(void *)v28 != v12) {
                objc_enumerationMutation(v9);
              }
              objc_super v14 = *(void **)(*((void *)&v27 + 1) + 8 * v13);
              CGFloat v15 = [v14 category];
              double v16 = [v15 expandedPodFolder];
              CGFloat v17 = [v4 folder];

              if (v16 == v17) {
                break;
              }

              if (v11 == ++v13)
              {
                uint64_t v11 = [v9 countByEnumeratingWithState:&v27 objects:v35 count:16];
                if (v11) {
                  goto LABEL_9;
                }
                goto LABEL_15;
              }
            }
            double v18 = [v26 iconViewForIcon:v14];
            CGFloat v19 = [v18 customIconImageViewController];
            long long v20 = [v19 iconListView];

            if (v20) {
              goto LABEL_20;
            }
          }
          else
          {
LABEL_15:
          }
        }
        uint64_t v25 = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
      }
      while (v25);
    }
    long long v20 = 0;
LABEL_20:
  }
  else
  {
    CGPoint v21 = [(SBHLibraryPodFolderController *)self podFolderView];
    long long v20 = [v21 currentIconListView];
  }
  return (SBIconListView *)v20;
}

- (void)setContentAlpha:(double)a3
{
  id v4 = [(SBHLibraryPodFolderController *)self view];
  [v4 setAlpha:a3];
}

- (void)setLibraryCategoryMap:(id)a3
{
  id v6 = a3;
  if (!-[SBHLibraryCategoryMap isEqualToCategoryMap:](self->_libraryCategoryMap, "isEqualToCategoryMap:"))
  {
    id v4 = (SBHLibraryCategoryMap *)[v6 copy];
    libraryCategoryMap = self->_libraryCategoryMap;
    self->_libraryCategoryMap = v4;

    [(SBHLibraryPodFolderController *)self _reloadAppIcons];
  }
}

- (void)dismissDisplayedContextMenu
{
}

void __60__SBHLibraryPodFolderController_dismissDisplayedContextMenu__block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v4 = a2;
  if ([v4 isShowingContextMenu])
  {
    [v4 dismissContextMenuWithCompletion:0];
    *a3 = 1;
  }
}

- (id)folderIconViewForIcon:(id)a3 folderRelativeIconIndexPath:(id *)a4
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v39 = a3;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id v6 = [(SBFolderController *)self folderView];
  BOOL v7 = [v6 iconListViews];

  uint64_t v32 = [v7 countByEnumeratingWithState:&v47 objects:v52 count:16];
  id v8 = 0;
  if (!v32)
  {
    char v26 = 0;
    goto LABEL_30;
  }
  uint64_t v9 = *(void *)v48;
  long long v34 = v7;
  v35 = a4;
  uint64_t v31 = *(void *)v48;
  do
  {
    uint64_t v10 = 0;
    do
    {
      if (*(void *)v48 != v9) {
        objc_enumerationMutation(v7);
      }
      uint64_t v33 = v10;
      uint64_t v11 = *(void **)(*((void *)&v47 + 1) + 8 * v10);
      long long v43 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      objc_msgSend(v11, "icons", v31);
      id obj = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v40 = [obj countByEnumeratingWithState:&v43 objects:v51 count:16];
      if (v40)
      {
        uint64_t v12 = *(void *)v44;
        uint64_t v36 = *(void *)v44;
        uint64_t v37 = v11;
        do
        {
          uint64_t v13 = 0;
          do
          {
            if (*(void *)v44 != v12) {
              objc_enumerationMutation(obj);
            }
            objc_super v14 = *(void **)(*((void *)&v43 + 1) + 8 * v13);
            CGFloat v15 = [v14 category];
            double v16 = [v11 displayedIconViewForIcon:v14];
            CGFloat v17 = v16;
            if (!v16) {
              goto LABEL_19;
            }
            double v18 = [v16 customIconImageViewController];
            CGFloat v19 = [v18 iconListView];
            long long v20 = [v19 model];
            CGPoint v21 = [v20 folder];

            CGRect v22 = [v21 indexPathForIcon:v39];
            v41 = v18;
            if (v22)
            {
              id v42 = v8;
              uint64_t v23 = [v21 folderContainingIndexPath:v22 relativeIndexPath:&v42];
              id v24 = v42;

              uint64_t v25 = [v23 icon];
              char v26 = [v19 displayedIconViewForIcon:v25];

              id v8 = v24;
              goto LABEL_14;
            }
            if (![v15 overflowBehavior])
            {
              long long v27 = [v15 expandedPodFolder];
              int v28 = [v27 containsIcon:v39];

              if (v28)
              {
                uint64_t v23 = [v15 additionalItemsIndicatorIcon];
                char v26 = [v19 displayedIconViewForIcon:v23];
LABEL_14:
              }
              else
              {
                char v26 = 0;
              }
              uint64_t v12 = v36;
              uint64_t v11 = v37;
              goto LABEL_18;
            }
            char v26 = 0;
LABEL_18:

            if (v26)
            {

              BOOL v7 = v34;
              a4 = v35;
              goto LABEL_30;
            }
LABEL_19:

            ++v13;
          }
          while (v40 != v13);
          uint64_t v29 = [obj countByEnumeratingWithState:&v43 objects:v51 count:16];
          uint64_t v40 = v29;
        }
        while (v29);
      }

      uint64_t v10 = v33 + 1;
      BOOL v7 = v34;
      a4 = v35;
      uint64_t v9 = v31;
    }
    while (v33 + 1 != v32);
    char v26 = 0;
    uint64_t v32 = [v34 countByEnumeratingWithState:&v47 objects:v52 count:16];
  }
  while (v32);
LABEL_30:

  if (a4) {
    *a4 = v8;
  }

  return v26;
}

- (void)iconListView:(id)a3 didAddIconView:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SBHLibraryPodFolderController;
  [(SBFolderController *)&v12 iconListView:a3 didAddIconView:v6];
  BOOL v7 = self;
  id v8 = [v6 customIconImageViewController];
  uint64_t v9 = SBFSafeCast();

  if (v9)
  {
    uint64_t v10 = [v9 iconListView];
    [v10 addLayoutObserver:self];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __61__SBHLibraryPodFolderController_iconListView_didAddIconView___block_invoke;
    v11[3] = &unk_1E6AAEB78;
    v11[4] = self;
    [v10 enumerateIconViewsUsingBlock:v11];
  }
  else
  {
    [v6 addObserver:self];
  }
}

uint64_t __61__SBHLibraryPodFolderController_iconListView_didAddIconView___block_invoke(uint64_t a1, void *a2)
{
  return [a2 addObserver:*(void *)(a1 + 32)];
}

- (void)iconListView:(id)a3 didRemoveIconView:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)SBHLibraryPodFolderController;
  id v6 = a4;
  [(SBFolderController *)&v7 iconListView:a3 didRemoveIconView:v6];
  objc_msgSend(v6, "removeObserver:", self, v7.receiver, v7.super_class);
}

- (void)iconViewDidHandleTap:(id)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v44.receiver = self;
  v44.super_class = (Class)SBHLibraryPodFolderController;
  [(SBFolderController *)&v44 iconViewDidHandleTap:v4];
  BOOL v5 = [v4 icon];
  id v6 = [(SBFolderController *)self folder];
  objc_super v7 = [(id)objc_opt_class() iconLocation];
  if (([v6 containsIcon:v5] & 1) == 0)
  {
    v38 = v7;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v8 = [(SBHLibraryCategoriesFolderDataSource *)self->_dataSource categoryIdentifiers];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v40 objects:v45 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      long long v34 = v6;
      id v36 = v4;
      uint64_t v11 = *(void *)v41;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v41 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = [(SBHLibraryCategoriesFolderDataSource *)self->_dataSource categoryForIdentifier:*(void *)(*((void *)&v40 + 1) + 8 * i)];
          objc_super v14 = [v13 compactPodFolder];
          int v15 = [v14 containsIcon:v5];

          if (v15)
          {
            uint64_t v16 = [v13 compactPodFolder];

            objc_super v7 = @"SBIconLocationAppLibraryCategoryPod";
            id v6 = (void *)v16;
            id v4 = v36;
            goto LABEL_13;
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v40 objects:v45 count:16];
        if (v10) {
          continue;
        }
        break;
      }
      id v6 = v34;
      id v4 = v36;
    }
LABEL_13:
  }
  if ([v5 isLaunchEnabled]
    && [v5 isLeafIcon]
    && [v6 isLibraryCategoryFolder])
  {
    v35 = [(SBHLibraryPodFolderController *)self loggingClient];
    CGFloat v17 = self->_libraryCategoryMap;
    double v18 = [v6 libraryCategoryIdentifier];
    CGFloat v19 = [v5 leafIdentifier];
    uint64_t v33 = [v18 predictionCategoryID];
    uint64_t v20 = [v18 predictionCategoryIndex];
    uint64_t v37 = v18;
    CGPoint v21 = [(SBHLibraryCategoryMap *)v17 sortedApplicationIdentifiersForCategoryIdentifier:v18];
    uint64_t v22 = [v21 indexOfObject:v19];

    uint64_t v23 = [MEMORY[0x1E4F1C9C8] date];
    id v39 = v17;
    id v24 = [(SBHLibraryCategoryMap *)v17 metadata];
    uint64_t v25 = [v24 objectForKey:@"response"];

    if ([(__CFString *)v7 isEqual:@"SBIconLocationAppLibraryCategoryPodRecents"])
    {
      char v26 = v35;
      [v35 logLaunchFromCategoryPreviewWithDate:v23 categoryID:4 categoryIndex:v20 bundleID:v19 bundleIndex:v22 appDirectoryResponse:v25];
LABEL_19:
      long long v27 = v26;
LABEL_25:

      goto LABEL_26;
    }
    uint64_t v32 = v22;
    char v26 = v35;
    if ([(__CFString *)v7 isEqual:@"SBIconLocationAppLibraryCategoryPodSuggestions"])
    {
      long long v27 = v35;
      int v28 = v35;
      uint64_t v29 = v23;
      uint64_t v30 = 3;
    }
    else
    {
      long long v27 = v35;
      if (![(__CFString *)v7 isEqual:@"SBIconLocationAppLibraryCategoryPod"])
      {
        if ([(__CFString *)v7 isEqual:@"SBIconLocationAppLibraryCategoryPodExpanded"])
        {
          [v35 logLaunchFromExpandedCategoryWithDate:v23 categoryID:v33 categoryIndex:v20 bundleID:v19 bundleIndex:v32 appDirectoryResponse:v25];
          goto LABEL_25;
        }
        uint64_t v31 = SBLogProactiveAppLibrary();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
          [(SBHLibraryPodFolderController *)(uint64_t)v19 iconViewDidHandleTap:v31];
        }

        goto LABEL_19;
      }
      int v28 = v35;
      uint64_t v29 = v23;
      uint64_t v30 = v33;
    }
    [v28 logLaunchFromCategoryPreviewWithDate:v29 categoryID:v30 categoryIndex:v20 bundleID:v19 bundleIndex:v32 appDirectoryResponse:v25];
    goto LABEL_25;
  }
LABEL_26:
}

- (BOOL)isPresentingIconLocation:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(SBHLibraryPodFolderController *)self presentedIconLocations];
  char v6 = [v5 containsObject:v4];

  return v6;
}

- (NSSet)presentedIconLocations
{
  v9.receiver = self;
  v9.super_class = (Class)SBHLibraryPodFolderController;
  v3 = [(SBFolderController *)&v9 presentedIconLocations];
  id v4 = (void *)[v3 mutableCopy];

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55__SBHLibraryPodFolderController_presentedIconLocations__block_invoke;
  v7[3] = &unk_1E6AAEBA0;
  id v5 = v4;
  id v8 = v5;
  [(SBHLibraryPodFolderController *)self enumerateViewControllersUsingBlock:v7];

  return (NSSet *)v5;
}

void __55__SBHLibraryPodFolderController_presentedIconLocations__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 presentedIconLocations];
  [v2 unionSet:v3];
}

- (id)iconViewForIcon:(id)a3 location:(id)a4
{
  return [(SBHLibraryPodFolderController *)self iconViewForIcon:a3 location:a4 options:0];
}

- (id)iconViewForIcon:(id)a3 location:(id)a4 options:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [(SBFolderController *)self folder];
  char v11 = [v10 isRootFolder];

  if (v11)
  {
    id v12 = 0;
    if (v8 && v9)
    {
      uint64_t v18 = 0;
      CGFloat v19 = &v18;
      uint64_t v20 = 0x3032000000;
      CGPoint v21 = __Block_byref_object_copy__5;
      uint64_t v22 = __Block_byref_object_dispose__5;
      id v23 = 0;
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __66__SBHLibraryPodFolderController_iconViewForIcon_location_options___block_invoke;
      v14[3] = &unk_1E6AAEBC8;
      id v15 = v8;
      id v16 = v9;
      CGFloat v17 = &v18;
      [(SBHLibraryPodFolderController *)self enumerateViewControllersUsingBlock:v14];
      id v12 = (id)v19[5];

      _Block_object_dispose(&v18, 8);
    }
  }
  else
  {
    v24.receiver = self;
    v24.super_class = (Class)SBHLibraryPodFolderController;
    id v12 = [(SBFolderController *)&v24 iconViewForIcon:v8 location:v9 options:a5];
  }

  return v12;
}

void __66__SBHLibraryPodFolderController_iconViewForIcon_location_options___block_invoke(void *a1, void *a2, unsigned char *a3)
{
  uint64_t v5 = [a2 iconViewForIcon:a1[4] location:a1[5]];
  if (v5) {
    *a3 = 1;
  }
  uint64_t v6 = *(void *)(a1[6] + 8);
  objc_super v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (id)firstIconViewForIcon:(id)a3 inLocations:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SBFolderController *)self folder];
  char v9 = [v8 isRootFolder];

  if (v9)
  {
    id v10 = 0;
    if (v6 && v7)
    {
      uint64_t v16 = 0;
      CGFloat v17 = &v16;
      uint64_t v18 = 0x3032000000;
      CGFloat v19 = __Block_byref_object_copy__5;
      uint64_t v20 = __Block_byref_object_dispose__5;
      id v21 = 0;
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __66__SBHLibraryPodFolderController_firstIconViewForIcon_inLocations___block_invoke;
      v12[3] = &unk_1E6AAEBC8;
      id v13 = v6;
      id v14 = v7;
      id v15 = &v16;
      [(SBHLibraryPodFolderController *)self enumerateViewControllersUsingBlock:v12];
      id v10 = (id)v17[5];

      _Block_object_dispose(&v16, 8);
    }
  }
  else
  {
    v22.receiver = self;
    v22.super_class = (Class)SBHLibraryPodFolderController;
    id v10 = [(SBFolderController *)&v22 firstIconViewForIcon:v6 inLocations:v7];
  }

  return v10;
}

void __66__SBHLibraryPodFolderController_firstIconViewForIcon_inLocations___block_invoke(void *a1, void *a2, unsigned char *a3)
{
  uint64_t v5 = [a2 firstIconViewForIcon:a1[4] inLocations:a1[5]];
  if (v5) {
    *a3 = 1;
  }
  uint64_t v6 = *(void *)(a1[6] + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (id)firstIconViewForIcon:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SBFolderController *)self folder];
  char v6 = [v5 isRootFolder];

  if (v6)
  {
    if (v4)
    {
      uint64_t v12 = 0;
      id v13 = &v12;
      uint64_t v14 = 0x3032000000;
      id v15 = __Block_byref_object_copy__5;
      uint64_t v16 = __Block_byref_object_dispose__5;
      id v17 = 0;
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __54__SBHLibraryPodFolderController_firstIconViewForIcon___block_invoke;
      v9[3] = &unk_1E6AAEBF0;
      id v10 = v4;
      char v11 = &v12;
      [(SBHLibraryPodFolderController *)self enumerateViewControllersUsingBlock:v9];
      id v7 = (id)v13[5];

      _Block_object_dispose(&v12, 8);
    }
    else
    {
      id v7 = 0;
    }
  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)SBHLibraryPodFolderController;
    id v7 = [(SBFolderController *)&v18 firstIconViewForIcon:v4];
  }

  return v7;
}

void __54__SBHLibraryPodFolderController_firstIconViewForIcon___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v5 = [a2 firstIconViewForIcon:*(void *)(a1 + 32)];
  if (v5) {
    *a3 = 1;
  }
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (id)firstNonSuggestionsOrRecentsIconViewForIcon:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SBFolderController *)self folder];
  char v6 = [v5 isRootFolder];

  if (v6)
  {
    if (v4)
    {
      uint64_t v12 = 0;
      id v13 = &v12;
      uint64_t v14 = 0x3032000000;
      id v15 = __Block_byref_object_copy__5;
      uint64_t v16 = __Block_byref_object_dispose__5;
      id v17 = 0;
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __77__SBHLibraryPodFolderController_firstNonSuggestionsOrRecentsIconViewForIcon___block_invoke;
      v9[3] = &unk_1E6AAEBF0;
      id v10 = v4;
      char v11 = &v12;
      [(SBHLibraryPodFolderController *)self enumerateNonSuggestionsOrRecentsViewControllersUsingBlock:v9];
      id v7 = (id)v13[5];

      _Block_object_dispose(&v12, 8);
    }
    else
    {
      id v7 = 0;
    }
  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)SBHLibraryPodFolderController;
    id v7 = [(SBFolderController *)&v18 firstIconViewForIcon:v4];
  }

  return v7;
}

void __77__SBHLibraryPodFolderController_firstNonSuggestionsOrRecentsIconViewForIcon___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v5 = [a2 firstIconViewForIcon:*(void *)(a1 + 32)];
  if (v5) {
    *a3 = 1;
  }
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (BOOL)isDisplayingIcon:(id)a3 inLocation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SBFolderController *)self folder];
  char v9 = [v8 isRootFolder];

  if (v9)
  {
    unsigned __int8 v10 = 0;
    if (v6 && v7)
    {
      uint64_t v16 = 0;
      id v17 = &v16;
      uint64_t v18 = 0x2020000000;
      char v19 = 0;
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __61__SBHLibraryPodFolderController_isDisplayingIcon_inLocation___block_invoke;
      v12[3] = &unk_1E6AAEBC8;
      id v13 = v6;
      id v14 = v7;
      id v15 = &v16;
      [(SBHLibraryPodFolderController *)self enumerateViewControllersUsingBlock:v12];
      unsigned __int8 v10 = *((unsigned char *)v17 + 24) != 0;

      _Block_object_dispose(&v16, 8);
    }
  }
  else
  {
    v20.receiver = self;
    v20.super_class = (Class)SBHLibraryPodFolderController;
    unsigned __int8 v10 = [(SBFolderController *)&v20 isDisplayingIcon:v6 inLocation:v7];
  }

  return v10;
}

uint64_t __61__SBHLibraryPodFolderController_isDisplayingIcon_inLocation___block_invoke(void *a1, void *a2, unsigned char *a3)
{
  uint64_t result = [a2 isDisplayingIcon:a1[4] inLocation:a1[5]];
  if (result)
  {
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

- (BOOL)isDisplayingIcon:(id)a3 inLocations:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SBFolderController *)self folder];
  char v9 = [v8 isRootFolder];

  if (v9)
  {
    unsigned __int8 v10 = 0;
    if (v6 && v7)
    {
      uint64_t v16 = 0;
      id v17 = &v16;
      uint64_t v18 = 0x2020000000;
      char v19 = 0;
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __62__SBHLibraryPodFolderController_isDisplayingIcon_inLocations___block_invoke;
      v12[3] = &unk_1E6AAEBC8;
      id v13 = v6;
      id v14 = v7;
      id v15 = &v16;
      [(SBHLibraryPodFolderController *)self enumerateViewControllersUsingBlock:v12];
      unsigned __int8 v10 = *((unsigned char *)v17 + 24) != 0;

      _Block_object_dispose(&v16, 8);
    }
  }
  else
  {
    v20.receiver = self;
    v20.super_class = (Class)SBHLibraryPodFolderController;
    unsigned __int8 v10 = [(SBFolderController *)&v20 isDisplayingIcon:v6 inLocations:v7];
  }

  return v10;
}

uint64_t __62__SBHLibraryPodFolderController_isDisplayingIcon_inLocations___block_invoke(void *a1, void *a2, unsigned char *a3)
{
  uint64_t result = [a2 isDisplayingIcon:a1[4] inLocations:a1[5]];
  if (result)
  {
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

- (BOOL)isDisplayingIcon:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SBFolderController *)self folder];
  char v6 = [v5 isRootFolder];

  if (v6)
  {
    if (v4)
    {
      uint64_t v12 = 0;
      id v13 = &v12;
      uint64_t v14 = 0x2020000000;
      char v15 = 0;
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __50__SBHLibraryPodFolderController_isDisplayingIcon___block_invoke;
      v9[3] = &unk_1E6AAEBF0;
      id v10 = v4;
      char v11 = &v12;
      [(SBHLibraryPodFolderController *)self enumerateViewControllersUsingBlock:v9];
      unsigned __int8 v7 = *((unsigned char *)v13 + 24) != 0;

      _Block_object_dispose(&v12, 8);
    }
    else
    {
      unsigned __int8 v7 = 0;
    }
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)SBHLibraryPodFolderController;
    unsigned __int8 v7 = [(SBFolderController *)&v16 isDisplayingIcon:v4];
  }

  return v7;
}

uint64_t __50__SBHLibraryPodFolderController_isDisplayingIcon___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t result = [a2 isDisplayingIcon:*(void *)(a1 + 32)];
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

- (BOOL)isDisplayingIconView:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SBFolderController *)self folder];
  char v6 = [v5 isRootFolder];

  if (v6)
  {
    if (v4)
    {
      uint64_t v12 = 0;
      id v13 = &v12;
      uint64_t v14 = 0x2020000000;
      char v15 = 0;
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __54__SBHLibraryPodFolderController_isDisplayingIconView___block_invoke;
      v9[3] = &unk_1E6AAEBF0;
      id v10 = v4;
      char v11 = &v12;
      [(SBHLibraryPodFolderController *)self enumerateViewControllersUsingBlock:v9];
      unsigned __int8 v7 = *((unsigned char *)v13 + 24) != 0;

      _Block_object_dispose(&v12, 8);
    }
    else
    {
      unsigned __int8 v7 = 0;
    }
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)SBHLibraryPodFolderController;
    unsigned __int8 v7 = [(SBFolderController *)&v16 isDisplayingIconView:v4];
  }

  return v7;
}

uint64_t __54__SBHLibraryPodFolderController_isDisplayingIconView___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t result = [a2 isDisplayingIconView:*(void *)(a1 + 32)];
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

- (BOOL)isDisplayingIconView:(id)a3 inLocation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SBFolderController *)self folder];
  char v9 = [v8 isRootFolder];

  if (v9)
  {
    unsigned __int8 v10 = 0;
    if (v6 && v7)
    {
      uint64_t v16 = 0;
      id v17 = &v16;
      uint64_t v18 = 0x2020000000;
      char v19 = 0;
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __65__SBHLibraryPodFolderController_isDisplayingIconView_inLocation___block_invoke;
      v12[3] = &unk_1E6AAEBC8;
      id v13 = v6;
      id v14 = v7;
      char v15 = &v16;
      [(SBHLibraryPodFolderController *)self enumerateViewControllersUsingBlock:v12];
      unsigned __int8 v10 = *((unsigned char *)v17 + 24) != 0;

      _Block_object_dispose(&v16, 8);
    }
  }
  else
  {
    v20.receiver = self;
    v20.super_class = (Class)SBHLibraryPodFolderController;
    unsigned __int8 v10 = [(SBFolderController *)&v20 isDisplayingIconView:v6 inLocation:v7];
  }

  return v10;
}

uint64_t __65__SBHLibraryPodFolderController_isDisplayingIconView_inLocation___block_invoke(void *a1, void *a2, unsigned char *a3)
{
  uint64_t result = [a2 isDisplayingIconView:a1[4] inLocation:a1[5]];
  if (result)
  {
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

- (void)enumerateDisplayedIconViewsForIcon:(id)a3 usingBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SBFolderController *)self folder];
  char v9 = [v8 isRootFolder];

  if (v9)
  {
    if (v6 && v7)
    {
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __79__SBHLibraryPodFolderController_enumerateDisplayedIconViewsForIcon_usingBlock___block_invoke;
      v10[3] = &unk_1E6AAEC18;
      id v11 = v6;
      id v12 = v7;
      [(SBHLibraryPodFolderController *)self enumerateViewControllersUsingBlock:v10];
    }
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)SBHLibraryPodFolderController;
    [(SBFolderController *)&v13 enumerateDisplayedIconViewsForIcon:v6 usingBlock:v7];
  }
}

uint64_t __79__SBHLibraryPodFolderController_enumerateDisplayedIconViewsForIcon_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  return [a2 enumerateDisplayedIconViewsForIcon:*(void *)(a1 + 32) usingBlock:*(void *)(a1 + 40)];
}

- (id)firstIconViewForIcon:(id)a3 excludingLocations:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SBFolderController *)self folder];
  char v9 = [v8 isRootFolder];

  if (v9)
  {
    if (v6 && [v7 count])
    {
      uint64_t v16 = 0;
      id v17 = &v16;
      uint64_t v18 = 0x3032000000;
      char v19 = __Block_byref_object_copy__5;
      objc_super v20 = __Block_byref_object_dispose__5;
      id v21 = 0;
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __73__SBHLibraryPodFolderController_firstIconViewForIcon_excludingLocations___block_invoke;
      v12[3] = &unk_1E6AAEBC8;
      id v13 = v6;
      id v14 = v7;
      char v15 = &v16;
      [(SBHLibraryPodFolderController *)self enumerateViewControllersUsingBlock:v12];
      id v10 = (id)v17[5];

      _Block_object_dispose(&v16, 8);
    }
    else
    {
      id v10 = 0;
    }
  }
  else
  {
    v22.receiver = self;
    v22.super_class = (Class)SBHLibraryPodFolderController;
    id v10 = [(SBFolderController *)&v22 firstIconViewForIcon:v6 excludingLocations:v7];
  }

  return v10;
}

void __73__SBHLibraryPodFolderController_firstIconViewForIcon_excludingLocations___block_invoke(void *a1, void *a2, unsigned char *a3)
{
  uint64_t v5 = [a2 firstIconViewForIcon:a1[4] excludingLocations:a1[5]];
  if (v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), v5);
    uint64_t v5 = v6;
    *a3 = 1;
  }
}

- (void)setLibrarySearchControllerScrollViewDelegate:(id)a3
{
  id v4 = a3;
  id v5 = [(SBHLibraryPodFolderController *)self podFolderView];
  [v5 setLibrarySearchControllerScrollViewDelegate:v4];
}

- (BSUIScrollViewDelegate)librarySearchControllerScrollViewDelegate
{
  v2 = [(SBHLibraryPodFolderController *)self podFolderView];
  id v3 = [v2 librarySearchControllerScrollViewDelegate];

  return (BSUIScrollViewDelegate *)v3;
}

- (BOOL)_ourFolderContainsFolder:(id)a3
{
  dataSource = self->_dataSource;
  id v4 = a3;
  id v5 = [(SBHLibraryCategoriesFolderDataSource *)dataSource categoriesFolder];
  id v6 = [v4 rootFolder];

  LOBYTE(v4) = [v5 isEqual:v6];
  return (char)v4;
}

- (void)enumerateNonSuggestionsOrRecentsViewControllersUsingBlock:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void *, unsigned char *))a3;
  unsigned __int8 v34 = 0;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v5 = [(SBFolderController *)self folderView];
  id v6 = [v5 iconListViews];

  uint64_t v23 = [v6 countByEnumeratingWithState:&v30 objects:v36 count:16];
  if (v23)
  {
    uint64_t v7 = *(void *)v31;
    uint64_t v25 = v6;
    uint64_t v22 = *(void *)v31;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v31 != v7) {
          objc_enumerationMutation(v6);
        }
        uint64_t v24 = v8;
        char v9 = *(void **)(*((void *)&v30 + 1) + 8 * v8);
        long long v26 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        id v10 = [v9 icons];
        uint64_t v11 = [v10 countByEnumeratingWithState:&v26 objects:v35 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v27;
          while (2)
          {
            for (uint64_t i = 0; i != v12; ++i)
            {
              if (*(void *)v27 != v13) {
                objc_enumerationMutation(v10);
              }
              char v15 = *(void **)(*((void *)&v26 + 1) + 8 * i);
              if ([v15 isCategoryIcon])
              {
                uint64_t v16 = [v15 category];
                id v17 = [v16 categoryIdentifier];
                uint64_t v18 = [v17 predictionCategoryID];

                if ((unint64_t)(v18 - 3) < 2) {
                  continue;
                }
              }
              char v19 = [v9 displayedIconViewForIcon:v15];
              objc_super v20 = [v19 customIconImageViewController];
              v4[2](v4, v20, &v34);
              int v21 = v34;

              if (v21)
              {

                id v6 = v25;
                goto LABEL_20;
              }
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v26 objects:v35 count:16];
            if (v12) {
              continue;
            }
            break;
          }
        }

        uint64_t v8 = v24 + 1;
        id v6 = v25;
        uint64_t v7 = v22;
      }
      while (v24 + 1 != v23);
      uint64_t v23 = [v25 countByEnumeratingWithState:&v30 objects:v36 count:16];
    }
    while (v23);
  }
LABEL_20:
}

- (id)_nestingViewControllerForPushing
{
  v2 = self;
  id v3 = v2;
  if (v2)
  {
    id v4 = v2;
    id v5 = v2;
    do
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0
        || (id v6 = v5,
            v4,
            [v6 parentNestingViewController],
            uint64_t v7 = objc_claimAutoreleasedReturnValue(),
            id v4 = v6,
            !v7))
      {
        uint64_t v7 = [v5 parentViewController];
      }

      id v5 = (void *)v7;
    }
    while (v7);
  }
  else
  {
    id v4 = 0;
  }
  uint64_t v8 = [(SBHLibraryPodFolderController *)v3 podFolderControllerDelegate];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v9 = [v8 libraryPodFolderController:v3 nestingViewControllerForPushingWithProposedController:v4];

    id v4 = (void *)v9;
  }

  return v4;
}

- (void)categoriesDataSourceNeedsAnimatedReload:(id)a3
{
  id v4 = a3;
  id v5 = [(SBHLibraryPodFolderController *)self podFolderControllerDelegate];
  uint64_t v6 = [v4 categoryIdentifiersCount];

  [v5 libraryPodFolderController:self willLayoutDisplayedCategories:v6];
  if ([(SBHLibraryPodFolderController *)self _isViewControllerVisible])
  {
    id v7 = [(SBFolderController *)self folderView];
    [v7 layoutIconListsWithAnimationType:0 forceRelayout:1];
  }
}

- (void)categoriesDataSource:(id)a3 shouldAnimateLayoutForCategories:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(SBHLibraryPodFolderController *)self podFolderControllerDelegate];
  uint64_t v9 = [v7 categoryIdentifiersCount];

  [v8 libraryPodFolderController:self willLayoutDisplayedCategories:v9];
  int v10 = [(SBHLibraryPodFolderController *)self bs_isAppearingOrAppeared];
  if (((v10 ^ 1) & 1) == 0) {
    [MEMORY[0x1E4F39CF8] begin];
  }
  uint64_t v11 = [(SBFolderController *)self folderView];
  if ([v6 count])
  {
    uint64_t v12 = [v11 iconListViews];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __87__SBHLibraryPodFolderController_categoriesDataSource_shouldAnimateLayoutForCategories___block_invoke;
    v13[3] = &unk_1E6AAEC68;
    id v14 = v6;
    uint64_t v15 = (uint64_t)((unint64_t)(v10 ^ 1u) << 63) >> 63;
    [v12 enumerateObjectsUsingBlock:v13];
  }
  if (v10) {
    [MEMORY[0x1E4F39CF8] commit];
  }
}

void __87__SBHLibraryPodFolderController_categoriesDataSource_shouldAnimateLayoutForCategories___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id obj = [v3 icons];
  uint64_t v4 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v17;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v17 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = [v3 displayedIconViewForIcon:*(void *)(*((void *)&v16 + 1) + 8 * v7)];
        uint64_t v9 = v8;
        if (v8)
        {
          int v10 = [v8 icon];
          uint64_t v11 = [v10 category];
          uint64_t v12 = [v11 categoryIdentifier];

          if ([*(id *)(a1 + 32) containsObject:v12])
          {
            uint64_t v13 = [v9 customIconImageViewController];
            id v14 = [v13 iconListView];
            [v14 setNeedsLayout];
            [v14 layoutIconsIfNeededWithAnimationType:*(void *)(a1 + 40) options:0];
          }
        }

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v5);
  }
}

- (void)_reloadAppIcons
{
  dataSource = self->_dataSource;
  id v4 = [(SBHLibraryPodFolderController *)self libraryCategoryMap];
  id v3 = [(SBHLibraryCategoriesFolderDataSource *)dataSource reloadDataWithCategoryMap:v4];
}

- (BOOL)_isViewControllerVisible
{
  return [(SBHLibraryPodFolderController *)self _appearState] - 1 < 2;
}

- (SBHIconImageCache)iconImageCache
{
  return self->_iconImageCache;
}

- (void)setIconImageCache:(id)a3
{
}

- (SBIconListLayoutProvider)listLayoutProvider
{
  return self->_listLayoutProvider;
}

- (void)setListLayoutProvider:(id)a3
{
}

- (UITapGestureRecognizer)tapToDismissRecognizer
{
  return self->_tapToDismissRecognizer;
}

- (SBHLibraryCategoriesFolderDataSource)dataSource
{
  return self->_dataSource;
}

- (SBHLibraryCategoryMap)libraryCategoryMap
{
  return self->_libraryCategoryMap;
}

- (SBHLibraryPodFolderControllerDelegate)podFolderControllerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_podFolderControllerDelegate);
  return (SBHLibraryPodFolderControllerDelegate *)WeakRetained;
}

- (void)setPodFolderControllerDelegate:(id)a3
{
}

- (ATXAppDirectoryClient)loggingClient
{
  return self->_loggingClient;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loggingClient, 0);
  objc_destroyWeak((id *)&self->_podFolderControllerDelegate);
  objc_storeStrong((id *)&self->_libraryCategoryMap, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_tapToDismissRecognizer, 0);
  objc_storeStrong((id *)&self->_listLayoutProvider, 0);
  objc_storeStrong((id *)&self->_iconImageCache, 0);
}

- (void)iconViewDidHandleTap:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1D7F0A000, log, OS_LOG_TYPE_ERROR, "Launch of %{public}@ from %{public}@ not logged", (uint8_t *)&v3, 0x16u);
}

@end