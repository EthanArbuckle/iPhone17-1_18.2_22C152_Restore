@interface THGlossaryDefinitionsViewController
- (CGRect)p_contentFrameForEntryIndex:(int64_t)a3;
- (CGRect)p_definitionViewFrame;
- (CGRect)p_scrollViewFrameForPaging:(BOOL)a3;
- (IMTheme)theme;
- (THGlossaryController)glossaryController;
- (THGlossaryDefinitionsViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (THGlossaryDefinitionsViewControllerDelegate)delegate;
- (THGlossaryViewController)glossaryViewController;
- (UIScrollView)scrollView;
- (id)didLayoutBlock;
- (id)displayedEntry;
- (id)p_createGlossaryEntryViewController;
- (id)p_dequeueRecycledEntryController;
- (id)p_layoutStyleProvider;
- (int64_t)p_currentEntryIndex;
- (int64_t)p_entryIndexForContentFrame:(CGRect)a3;
- (void)_stylizeForTheme;
- (void)awakeFromNib;
- (void)dealloc;
- (void)didReceiveMemoryWarning;
- (void)displayIndex:(id)a3 withEntry:(id)a4 animated:(BOOL)a5;
- (void)layoutScrollView;
- (void)loadView;
- (void)p_initCommon;
- (void)p_loadEntryAtIndex:(int64_t)a3 scrollLocation:(int)a4;
- (void)p_recycleEntry:(id)a3;
- (void)p_releaseControllerForIndex:(int64_t)a3;
- (void)p_showEntry:(id)a3 animated:(BOOL)a4;
- (void)p_updateForContentFrame:(CGRect)a3;
- (void)scrollViewDidEndDecelerating:(id)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDidLayoutBlock:(id)a3;
- (void)setGlossaryController:(id)a3;
- (void)setGlossaryViewController:(id)a3;
- (void)setTheme:(id)a3;
- (void)unload;
- (void)viewDidLayoutSubviews;
@end

@implementation THGlossaryDefinitionsViewController

- (void)p_initCommon
{
  self->mRecycledEntries = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
  self->mScrollTargetEntryIndex = 0x7FFFFFFFFFFFFFFFLL;
}

- (THGlossaryDefinitionsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)THGlossaryDefinitionsViewController;
  v4 = [(THGlossaryDefinitionsViewController *)&v7 initWithNibName:a3 bundle:a4];
  v5 = v4;
  if (v4) {
    [(THGlossaryDefinitionsViewController *)v4 p_initCommon];
  }
  return v5;
}

- (void)dealloc
{
  [(THGlossaryDefinitionsViewController *)self setDidLayoutBlock:0];
  [(NSMutableSet *)self->mRecycledEntries makeObjectsPerformSelector:"teardown"];
  [(NSMutableSet *)self->mRecycledEntries removeAllObjects];

  self->mScrollView = 0;
  self->mEntryViewControllers = 0;

  self->mEntryIndex = 0;
  self->mRecycledEntries = 0;

  self->_theme = 0;
  v3.receiver = self;
  v3.super_class = (Class)THGlossaryDefinitionsViewController;
  [(THGlossaryDefinitionsViewController *)&v3 dealloc];
}

- (void)awakeFromNib
{
  v3.receiver = self;
  v3.super_class = (Class)THGlossaryDefinitionsViewController;
  [(THGlossaryDefinitionsViewController *)&v3 awakeFromNib];
  [(THGlossaryDefinitionsViewController *)self p_initCommon];
}

- (CGRect)p_definitionViewFrame
{
  mDelegate = self->mDelegate;
  if (mDelegate)
  {
    [mDelegate glossaryEntryLayoutStyleProvider].glossaryEntryLayoutViewFrame;
  }
  else
  {
    double x = CGRectZero.origin.x;
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
  }
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)p_contentFrameForEntryIndex:(int64_t)a3
{
  [(THGlossaryDefinitionsViewController *)self p_definitionViewFrame];
  double v7 = (v6 + 1.0) * (double)a3;
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.double y = v7;
  result.origin.double x = v4;
  return result;
}

- (int64_t)p_entryIndexForContentFrame:(CGRect)a3
{
  double y = a3.origin.y;
  -[THGlossaryDefinitionsViewController p_contentFrameForEntryIndex:](self, "p_contentFrameForEntryIndex:", 1, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  return (uint64_t)(y / v4 + 0.5);
}

- (CGRect)p_scrollViewFrameForPaging:(BOOL)a3
{
  BOOL v3 = a3;
  [(THGlossaryDefinitionsViewController *)self p_contentFrameForEntryIndex:0];
  double v7 = v6;
  double v9 = v8;
  if (v3)
  {
    [(THGlossaryDefinitionsViewController *)self p_contentFrameForEntryIndex:1];
    double v11 = v10;
  }
  else
  {
    double v11 = v5;
  }
  [self view].safeAreaInsets
  double v13 = v12;
  double v14 = v7;
  double v15 = v9;
  double v16 = v11;
  result.size.double height = v16;
  result.size.double width = v15;
  result.origin.double y = v14;
  result.origin.double x = v13;
  return result;
}

- (void)layoutScrollView
{
  int64_t v3 = [(THGlossaryDefinitionsViewController *)self p_currentEntryIndex];
  id v4 = [(TSUIntegerKeyDictionary *)self->mEntryViewControllers keyEnumerator];
  if (v4)
  {
    double v5 = v4;
    id v6 = [v4 nextKey];
    if (v6 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      for (id i = v6; i != (id)0x7FFFFFFFFFFFFFFFLL; id i = [v5 nextKey])
        [(THGlossaryDefinitionsViewController *)self p_releaseControllerForIndex:i];
    }
  }
  [(THGlossaryDefinitionsViewController *)self p_scrollViewFrameForPaging:1];
  -[UIScrollView setFrame:](self->mScrollView, "setFrame:");
  [(UIScrollView *)self->mScrollView frame];
  double v9 = v8;
  [(THGlossaryDefinitionsViewController *)self p_contentFrameForEntryIndex:[(THGlossaryIndex *)self->mEntryIndex numberOfEntries]];
  [(UIScrollView *)self->mScrollView setContentSize:v9];
  [(THGlossaryDefinitionsViewController *)self p_contentFrameForEntryIndex:v3];
  -[THGlossaryDefinitionsViewController p_updateForContentFrame:](self, "p_updateForContentFrame:");
  id v10 = [(THGlossaryIndex *)self->mEntryIndex entryAtIndex:v3];

  [(THGlossaryDefinitionsViewController *)self p_showEntry:v10 animated:0];
}

- (void)loadView
{
  id v3 = +[UIColor bc_booksBackground];
  [(THGlossaryDefinitionsViewController *)self setView:objc_alloc_init((Class)UIView)];
  [self view].backgroundColor = v3;
  [self view].clipsToBounds = 1;
  id v4 = objc_alloc((Class)UIScrollView);
  [(THGlossaryDefinitionsViewController *)self p_scrollViewFrameForPaging:1];
  double v5 = [v4 initWithFrame:];
  self->mScrollView = v5;
  [(UIScrollView *)v5 setContentInsetAdjustmentBehavior:2];
  [(UIScrollView *)self->mScrollView setScrollEnabled:1];
  [(UIScrollView *)self->mScrollView setClipsToBounds:0];
  [(UIScrollView *)self->mScrollView setBackgroundColor:v3];
  [(UIScrollView *)self->mScrollView setDelegate:self];
  [(UIScrollView *)self->mScrollView setPagingEnabled:1];
  id v6 = [(THGlossaryDefinitionsViewController *)self view];
  mScrollView = self->mScrollView;

  [v6 addSubview:mScrollView];
}

- (void)didReceiveMemoryWarning
{
  id v3 = [(TSUIntegerKeyDictionary *)self->mEntryViewControllers count];
  if ((unint64_t)v3 >= 2)
  {
    id v4 = v3;
    id v5 = [(TSUIntegerKeyDictionary *)self->mEntryViewControllers keyEnumerator];
    int64_t v6 = [(THGlossaryDefinitionsViewController *)self p_currentEntryIndex];
    id v7 = [objc_alloc((Class)NSMutableArray) initWithCapacity:v4];
    id v8 = [v5 nextKey];
    if (v8 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      for (id i = v8; i != (id)0x7FFFFFFFFFFFFFFFLL; id i = [v5 nextKey])
      {
        if (i != (id)v6)
        {
          id v10 = [objc_alloc((Class)NSNumber) initWithInteger:i];
          [v7 addObject:v10];
        }
      }
    }
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v11 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v17;
      do
      {
        for (j = 0; j != v12; j = (char *)j + 1)
        {
          if (*(void *)v17 != v13) {
            objc_enumerationMutation(v7);
          }
          -[THGlossaryDefinitionsViewController p_releaseControllerForIndex:](self, "p_releaseControllerForIndex:", (int)[*(id *)(*((void *)&v16 + 1) + 8 * (void)j) intValue]);
        }
        id v12 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v12);
    }
  }
  [(NSMutableSet *)self->mRecycledEntries makeObjectsPerformSelector:"teardown"];
  [(NSMutableSet *)self->mRecycledEntries removeAllObjects];
  v15.receiver = self;
  v15.super_class = (Class)THGlossaryDefinitionsViewController;
  [(THGlossaryDefinitionsViewController *)&v15 didReceiveMemoryWarning];
}

- (void)setTheme:(id)a3
{
  if ((-[IMTheme isEqual:](self->_theme, "isEqual:") & 1) == 0)
  {
    id v5 = a3;

    self->_theme = (IMTheme *)a3;
    [(THGlossaryDefinitionsViewController *)self _stylizeForTheme];
  }
}

- (void)_stylizeForTheme
{
  id v3 = [(IMTheme *)[(THGlossaryDefinitionsViewController *)self theme] backgroundColorForTraitEnvironment:self];
  [self view].backgroundColor = v3;
  [(UIScrollView *)[(THGlossaryDefinitionsViewController *)self scrollView] setBackgroundColor:v3];
  int64_t v4 = [(THGlossaryDefinitionsViewController *)self p_currentEntryIndex];

  [(THGlossaryDefinitionsViewController *)self p_loadEntryAtIndex:v4 scrollLocation:0];
}

- (void)p_recycleEntry:(id)a3
{
  [a3 viewWillDisappear:0];
  objc_msgSend(objc_msgSend(a3, "view"), "removeFromSuperview");
  [a3 viewDidDisappear:0];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_BF19C;
  v5[3] = &unk_458EC0;
  v5[4] = self;
  v5[5] = a3;
  [a3 unloadEntryOnComplete:v5];
}

- (void)p_releaseControllerForIndex:(int64_t)a3
{
  id v5 = -[TSUIntegerKeyDictionary objectForKey:](self->mEntryViewControllers, "objectForKey:");
  [(TSUIntegerKeyDictionary *)self->mEntryViewControllers removeObjectForKey:a3];
  [(THGlossaryDefinitionsViewController *)self p_recycleEntry:v5];
}

- (id)p_dequeueRecycledEntryController
{
  id v3 = [(NSMutableSet *)self->mRecycledEntries anyObject];
  int64_t v4 = v3;
  if (v3)
  {
    id v5 = v3;
    [(NSMutableSet *)self->mRecycledEntries removeObject:v4];
  }
  return v4;
}

- (id)p_createGlossaryEntryViewController
{
  id v3 = (THGlossaryEntryViewController *)[(THGlossaryDefinitionsViewController *)self p_dequeueRecycledEntryController];
  if (!v3)
  {
    id v3 = [[THGlossaryEntryViewController alloc] initWithDocumentRoot:[(THGlossaryController *)[(THGlossaryDefinitionsViewController *)self glossaryController] documentRoot] bookNavigator:[(THGlossaryDefinitionsViewControllerDelegate *)[(THGlossaryDefinitionsViewController *)self delegate] bookNavigator]];
    [(THGlossaryEntryViewController *)v3 setGlossaryController:[(THGlossaryDefinitionsViewController *)self glossaryController]];
    [(THGlossaryEntryViewController *)v3 setModalViewControllerProvider:[(THGlossaryDefinitionsViewControllerDelegate *)[(THGlossaryDefinitionsViewController *)self delegate] modalViewControllerProviderForGlossaryDefinitionsViewController:self]];
    [(THGlossaryEntryViewController *)v3 setLinkHandler:[(THGlossaryDefinitionsViewController *)self glossaryViewController]];
    [(THGlossaryEntryViewController *)v3 setTheme:[(THGlossaryDefinitionsViewController *)self theme]];
  }
  return v3;
}

- (id)p_layoutStyleProvider
{
  return [(THGlossaryDefinitionsViewControllerDelegate *)self->mDelegate glossaryEntryLayoutStyleProvider];
}

- (void)p_loadEntryAtIndex:(int64_t)a3 scrollLocation:(int)a4
{
  id v7 = -[THGlossaryIndex entryAtIndex:](self->mEntryIndex, "entryAtIndex:");
  if (v7)
  {
    id v8 = v7;
    id v9 = [(TSUIntegerKeyDictionary *)self->mEntryViewControllers objectForKey:a3];
    if (!v9)
    {
      id v9 = [(THGlossaryDefinitionsViewController *)self p_createGlossaryEntryViewController];
      [(TSUIntegerKeyDictionary *)self->mEntryViewControllers setObject:v9 forKey:a3];

      [(THGlossaryDefinitionsViewController *)self p_contentFrameForEntryIndex:a3];
      objc_msgSend(objc_msgSend(v9, "view"), "setFrame:", v10, v11, v12, v13);
      [v9 viewWillAppear:0];
      -[UIScrollView addSubview:](self->mScrollView, "addSubview:", [v9 view]);
      [v9 viewDidAppear:0];
    }
    [v9 setTheme:[self theme]];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_BF4F8;
    v14[3] = &unk_458EE8;
    v14[4] = self;
    v14[5] = v9;
    int v15 = a4;
    [v9 loadEntry:v8 withLayoutStyleProvider:[self p_layoutStyleProvider] onComplete:v14];
  }
}

- (void)p_updateForContentFrame:(CGRect)a3
{
  int64_t v4 = -[THGlossaryDefinitionsViewController p_entryIndexForContentFrame:](self, "p_entryIndexForContentFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(THGlossaryDefinitionsViewController *)self p_loadEntryAtIndex:v4 scrollLocation:0];
  -[THGlossaryDefinitionsViewController p_loadEntryAtIndex:scrollLocation:](self, "p_loadEntryAtIndex:scrollLocation:");
  -[THGlossaryDefinitionsViewController p_loadEntryAtIndex:scrollLocation:](self, "p_loadEntryAtIndex:scrollLocation:");
  id v5 = [(TSUIntegerKeyDictionary *)self->mEntryViewControllers keyEnumerator];
  if (v5)
  {
    int64_t v6 = v5;
    id v7 = [v5 nextKey];
    if (v7 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      id v8 = v7;
      int64_t v9 = v4 - 2;
      int64_t v10 = v4 + 2;
      do
      {
        if ((uint64_t)v8 < v9 || (uint64_t)v8 > v10) {
          -[THGlossaryDefinitionsViewController p_releaseControllerForIndex:](self, "p_releaseControllerForIndex:");
        }
        id v8 = [v6 nextKey];
      }
      while (v8 != (id)0x7FFFFFFFFFFFFFFFLL);
    }
  }
}

- (int64_t)p_currentEntryIndex
{
  [(UIScrollView *)self->mScrollView bounds];
  if (v3 == 0.0) {
    double v4 = 1.0;
  }
  else {
    double v4 = v3;
  }
  [(UIScrollView *)self->mScrollView contentOffset];
  return (uint64_t)(v5 / v4);
}

- (void)p_showEntry:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  int64_t v7 = [(THGlossaryDefinitionsViewController *)self p_currentEntryIndex];
  int64_t v8 = [(THGlossaryIndex *)self->mEntryIndex indexForEntry:a3];
  [(THGlossaryDefinitionsViewController *)self p_contentFrameForEntryIndex:v8];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  -[THGlossaryDefinitionsViewController p_updateForContentFrame:](self, "p_updateForContentFrame:");
  unint64_t v15 = v7 - v8;
  if (v7 - v8 < 0) {
    unint64_t v15 = v8 - v7;
  }
  BOOL v16 = v15 < 3;
  [(UIScrollView *)self->mScrollView frame];
  double v18 = v17;
  uint64_t v19 = v16 & v4;
  int64_t v20 = 0x7FFFFFFFFFFFFFFFLL;
  if (v19) {
    int64_t v20 = v8;
  }
  self->mScrollTargetEntryIndedouble x = v20;
  [self->mEntryViewControllers[v8] scrollToLocation:1 animated:v19];
  mScrollView = self->mScrollView;

  -[UIScrollView scrollRectToVisible:animated:](mScrollView, "scrollRectToVisible:animated:", v19, v10, v12, v14, v18);
}

- (void)displayIndex:(id)a3 withEntry:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  if (objc_msgSend(-[THGlossaryDefinitionsViewController view](self, "view"), "superview"))
  {
    if (![(THGlossaryIndex *)self->mEntryIndex isEqual:a3])
    {
      id v22 = a4;

      self->mEntryIndedouble x = (THGlossaryIndex *)a3;
      id v23 = [a3 numberOfEntries];
      id v9 = [objc_alloc((Class)TSUIntegerKeyDictionary) initWithCapacity:v23];
      long long v27 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      id v10 = [(TSUIntegerKeyDictionary *)self->mEntryViewControllers valueEnumerator];
      id v11 = [v10 countByEnumeratingWithState:&v27 objects:v31 count:16];
      if (v11)
      {
        uint64_t v12 = *(void *)v28;
        do
        {
          for (id i = 0; i != v11; id i = (char *)i + 1)
          {
            if (*(void *)v28 != v12) {
              objc_enumerationMutation(v10);
            }
            double v14 = *(void **)(*((void *)&v27 + 1) + 8 * i);
            id v15 = [a3 indexForEntry:[v14 entry]];
            if (v15 == (id)0x7FFFFFFFFFFFFFFFLL)
            {
              [(THGlossaryDefinitionsViewController *)self p_recycleEntry:v14];
            }
            else
            {
              [v9 setObject:v14 forKey:v15];
              [(THGlossaryDefinitionsViewController *)self p_contentFrameForEntryIndex:v15];
              objc_msgSend(objc_msgSend(v14, "view"), "setFrame:", v16, v17, v18, v19);
            }
          }
          id v11 = [v10 countByEnumeratingWithState:&v27 objects:v31 count:16];
        }
        while (v11);
      }

      self->mEntryViewControllers = (TSUIntegerKeyDictionary *)v9;
      [(UIScrollView *)self->mScrollView frame];
      double v21 = v20;
      [(THGlossaryDefinitionsViewController *)self p_contentFrameForEntryIndex:v23];
      [(UIScrollView *)self->mScrollView setContentSize:v21];
      BOOL v5 = 0;
      a4 = v22;
    }
    [(THGlossaryDefinitionsViewController *)self p_showEntry:a4 animated:v5];
  }
  else
  {
    v26[0] = 0;
    v26[1] = v26;
    v26[2] = 0x3052000000;
    v26[3] = sub_BFAA4;
    v26[4] = sub_BFAB4;
    v26[5] = self;
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_BFAC0;
    v24[3] = &unk_458F10;
    v24[5] = a4;
    v24[6] = v26;
    v24[4] = a3;
    BOOL v25 = v5;
    [(THGlossaryDefinitionsViewController *)self setDidLayoutBlock:v24];
    _Block_object_dispose(v26, 8);
  }
}

- (id)displayedEntry
{
  int64_t v3 = [(THGlossaryDefinitionsViewController *)self p_currentEntryIndex];
  mEntryIndedouble x = self->mEntryIndex;

  return [(THGlossaryIndex *)mEntryIndex entryAtIndex:v3];
}

- (void)unload
{
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v3 = [(TSUIntegerKeyDictionary *)self->mEntryViewControllers valueEnumerator];
  id v4 = [v3 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v18;
    do
    {
      for (id i = 0; i != v5; id i = (char *)i + 1)
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(v3);
        }
        [(THGlossaryDefinitionsViewController *)self p_recycleEntry:*(void *)(*((void *)&v17 + 1) + 8 * i)];
      }
      id v5 = [v3 countByEnumeratingWithState:&v17 objects:v22 count:16];
    }
    while (v5);
  }

  self->mEntryViewControllers = 0;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  mRecycledEntries = self->mRecycledEntries;
  id v9 = [(NSMutableSet *)mRecycledEntries countByEnumeratingWithState:&v13 objects:v21 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      for (j = 0; j != v10; j = (char *)j + 1)
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(mRecycledEntries);
        }
        [*(id *)(*((void *)&v13 + 1) + 8 * (void)j) teardown];
      }
      id v10 = [(NSMutableSet *)mRecycledEntries countByEnumeratingWithState:&v13 objects:v21 count:16];
    }
    while (v10);
  }
  [(NSMutableSet *)self->mRecycledEntries removeAllObjects];

  self->mEntryIndedouble x = 0;
}

- (void)scrollViewDidScroll:(id)a3
{
  [(UIScrollView *)self->mScrollView bounds];

  -[THGlossaryDefinitionsViewController p_updateForContentFrame:](self, "p_updateForContentFrame:");
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  self->mScrollTargetEntryIndedouble x = 0x7FFFFFFFFFFFFFFFLL;
  mDelegate = self->mDelegate;
  id v4 = [(THGlossaryDefinitionsViewController *)self displayedEntry];

  [(THGlossaryDefinitionsViewControllerDelegate *)mDelegate didScrollToEntry:v4];
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)THGlossaryDefinitionsViewController;
  [(THGlossaryDefinitionsViewController *)&v3 viewDidLayoutSubviews];
  [(THGlossaryDefinitionsViewController *)self layoutScrollView];
  if ([(THGlossaryDefinitionsViewController *)self didLayoutBlock])
  {
    (*((void (**)(void))[(THGlossaryDefinitionsViewController *)self didLayoutBlock] + 2))();
    [(THGlossaryDefinitionsViewController *)self setDidLayoutBlock:0];
  }
}

- (THGlossaryController)glossaryController
{
  return self->mGlossaryController;
}

- (void)setGlossaryController:(id)a3
{
  self->mGlossaryController = (THGlossaryController *)a3;
}

- (THGlossaryDefinitionsViewControllerDelegate)delegate
{
  return self->mDelegate;
}

- (void)setDelegate:(id)a3
{
  self->mDelegate = (THGlossaryDefinitionsViewControllerDelegate *)a3;
}

- (THGlossaryViewController)glossaryViewController
{
  return self->mGlossaryViewController;
}

- (void)setGlossaryViewController:(id)a3
{
  self->mGlossaryViewController = (THGlossaryViewController *)a3;
}

- (UIScrollView)scrollView
{
  return self->mScrollView;
}

- (IMTheme)theme
{
  return self->_theme;
}

- (id)didLayoutBlock
{
  return self->_didLayoutBlock;
}

- (void)setDidLayoutBlock:(id)a3
{
}

@end