@interface BSUIScreenshotViewController
+ (void)createAsync:(id)a3 :(int64_t)a4 :(id)a5;
- (BOOL)_isRegularPad;
- (BSUIScreenshotLoader)screenshotLoader;
- (BSUIScreenshotViewController)initWithScreenshots:(id)a3 andSelectedIndex:(int64_t)a4;
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (NSArray)screenshots;
- (UICollectionView)collectionView;
- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5;
- (double)collectionView:(id)a3 layout:(id)a4 minimumInteritemSpacingForSectionAtIndex:(int64_t)a5;
- (double)collectionView:(id)a3 layout:(id)a4 minimumLineSpacingForSectionAtIndex:(int64_t)a5;
- (id)backgroundColor;
- (id)cellBorderColor;
- (id)cellPlaceholderColor;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)initialSelectedIndex;
- (int64_t)selectedIndex;
- (void)_dismiss:(id)a3;
- (void)_doneButtonPressed;
- (void)_setupSubviews;
- (void)_swipeGestureRecognizer:(id)a3;
- (void)_traitCollectionDidChange:(id)a3 previousTraitCollection:(id)a4;
- (void)_updateColors;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)screenshotLoader:(id)a3 failedToLoadImageforScreenshotAtIndex:(unint64_t)a4 withError:(id)a5;
- (void)screenshotLoader:(id)a3 loadedImage:(id)a4 forScreenshotAtIndex:(unint64_t)a5;
- (void)screenshotLoader:(id)a3 willLoadImageAtIndex:(unint64_t)a4 fromURL:(id)a5;
- (void)scrollViewDidEndDecelerating:(id)a3;
- (void)setCollectionView:(id)a3;
- (void)setInitialSelectedIndex:(int64_t)a3;
- (void)setNeedsColorUpdate;
- (void)setScreenshotLoader:(id)a3;
- (void)setScreenshots:(id)a3;
- (void)setSelectedIndex:(int64_t)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation BSUIScreenshotViewController

- (BSUIScreenshotViewController)initWithScreenshots:(id)a3 andSelectedIndex:(int64_t)a4
{
  id v6 = a3;
  v27.receiver = self;
  v27.super_class = (Class)BSUIScreenshotViewController;
  v7 = [(BSUIScreenshotViewController *)&v27 init];
  if (v7)
  {
    v8 = objc_opt_new();
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v9 = v6;
    id v10 = [v9 countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v24;
      do
      {
        v13 = 0;
        do
        {
          if (*(void *)v24 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void *)(*((void *)&v23 + 1) + 8 * (void)v13);
          v15 = [BSUIScreenshot alloc];
          v16 = -[BSUIScreenshot initWithDictionary:](v15, "initWithDictionary:", v14, (void)v23);
          [v8 addObject:v16];

          v13 = (char *)v13 + 1;
        }
        while (v11 != v13);
        id v11 = [v9 countByEnumeratingWithState:&v23 objects:v28 count:16];
      }
      while (v11);
    }

    objc_storeStrong((id *)&v7->_screenshots, v8);
    v7->_selectedIndex = a4;
    v7->_initialSelectedIndex = a4;
    v17 = [[BSUIScreenshotLoader alloc] initWithScreenshots:v8];
    screenshotLoader = v7->_screenshotLoader;
    v7->_screenshotLoader = v17;

    [(BSUIScreenshotLoader *)v7->_screenshotLoader setDelegate:v7];
    v19 = [(BSUIScreenshotViewController *)v7 navigationItem];
    [v19 setLargeTitleDisplayMode:2];

    v20 = +[UITraitCollection bc_allAPITraits];
    id v21 = [(BSUIScreenshotViewController *)v7 registerForTraitChanges:v20 withAction:"_traitCollectionDidChange:previousTraitCollection:"];
  }
  return v7;
}

+ (void)createAsync:(id)a3 :(int64_t)a4 :(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_590C;
  v15[3] = &unk_38E090;
  id v18 = a1;
  id v10 = v8;
  id v16 = v10;
  int64_t v19 = a4;
  id v11 = v9;
  id v17 = v11;
  uint64_t v12 = objc_retainBlock(v15);
  if (v12)
  {
    if (+[NSThread isMainThread])
    {
      ((void (*)(void *))v12[2])(v12);
    }
    else
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_59E0;
      block[3] = &unk_38E0B8;
      uint64_t v14 = v12;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    }
  }
}

- (void)viewDidLoad
{
  v15.receiver = self;
  v15.super_class = (Class)BSUIScreenshotViewController;
  [(BSUIScreenshotViewController *)&v15 viewDidLoad];
  [(BSUIScreenshotViewController *)self _setupSubviews];
  id v3 = [objc_alloc((Class)UISwipeGestureRecognizer) initWithTarget:self action:"_swipeGestureRecognizer:"];
  [v3 setDirection:8];
  v4 = [(BSUIScreenshotViewController *)self view];
  [v4 addGestureRecognizer:v3];

  [(BSUIScreenshotLoader *)self->_screenshotLoader startLoading];
  id v5 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:0 target:self action:"_dismiss:"];
  id v6 = [(BSUIScreenshotViewController *)self navigationItem];
  [v6 setRightBarButtonItem:v5];

  v7 = [(BSUIScreenshotViewController *)self backgroundColor];
  id v8 = [(BSUIScreenshotViewController *)self collectionView];
  [v8 setBackgroundColor:v7];

  id v9 = [(BSUIScreenshotViewController *)self collectionView];
  [v9 setAlwaysBounceHorizontal:1];

  id v10 = [(BSUIScreenshotViewController *)self collectionView];
  [v10 setShowsHorizontalScrollIndicator:0];

  id v11 = [(BSUIScreenshotViewController *)self collectionView];
  [v11 setDecelerationRate:UIScrollViewDecelerationRateFast];

  uint64_t v12 = [(BSUIScreenshotViewController *)self collectionView];
  [v12 setRemembersLastFocusedIndexPath:1];

  v13 = [(BSUIScreenshotViewController *)self collectionView];
  [v13 setContentInsetAdjustmentBehavior:2];

  uint64_t v14 = [(BSUIScreenshotViewController *)self collectionView];
  [v14 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"CellIdentifier"];

  [(BSUIScreenshotViewController *)self _updateColors];
}

- (void)viewWillAppear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)BSUIScreenshotViewController;
  [(BSUIScreenshotViewController *)&v3 viewWillAppear:a3];
}

- (void)viewDidLayoutSubviews
{
  v11.receiver = self;
  v11.super_class = (Class)BSUIScreenshotViewController;
  [(BSUIScreenshotViewController *)&v11 viewDidLayoutSubviews];
  if ([(BSUIScreenshotViewController *)self initialSelectedIndex] != 0x7FFFFFFFFFFFFFFFLL)
  {
    if ([(BSUIScreenshotViewController *)self initialSelectedIndex] >= 1)
    {
      unint64_t v3 = [(BSUIScreenshotViewController *)self initialSelectedIndex];
      v4 = [(BSUIScreenshotViewController *)self screenshots];
      id v5 = [v4 count];

      if (v3 < (unint64_t)v5)
      {
        objc_opt_class();
        id v6 = [(BSUIScreenshotViewController *)self collectionView];
        v7 = [v6 superview];
        id v8 = BUDynamicCast();

        [v8 layoutIfNeeded];
        id v9 = [(BSUIScreenshotViewController *)self collectionView];
        id v10 = +[NSIndexPath indexPathForRow:[(BSUIScreenshotViewController *)self initialSelectedIndex] inSection:0];
        [v9 scrollToItemAtIndexPath:v10 atScrollPosition:16 animated:0];
      }
    }
    [(BSUIScreenshotViewController *)self setInitialSelectedIndex:0x7FFFFFFFFFFFFFFFLL];
  }
}

- (void)_traitCollectionDidChange:(id)a3 previousTraitCollection:(id)a4
{
  unsigned int v5 = [a4 bc_userInterfaceStyleDark:a3];
  id v6 = [(BSUIScreenshotViewController *)self traitCollection];
  unsigned int v7 = [v6 bc_userInterfaceStyleDark];

  if (v5 != v7) {
    [(BSUIScreenshotViewController *)self _updateColors];
  }
  id v8 = [(BSUIScreenshotViewController *)self collectionView];
  id v9 = [v8 collectionViewLayout];
  [v9 invalidateLayout];

  id v10 = [(BSUIScreenshotViewController *)self collectionView];
  [v10 setNeedsLayout];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v12.receiver = self;
  v12.super_class = (Class)BSUIScreenshotViewController;
  id v7 = a4;
  -[BSUIScreenshotViewController viewWillTransitionToSize:withTransitionCoordinator:](&v12, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  id v8 = [(BSUIScreenshotViewController *)self collectionView];
  id v9 = [v8 collectionViewLayout];
  [v9 invalidateLayout];

  id v10 = [(BSUIScreenshotViewController *)self collectionView];
  [v10 setNeedsLayout];

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_5F40;
  v11[3] = &unk_38E0E0;
  v11[4] = self;
  [v7 animateAlongsideTransition:v11 completion:0];
}

- (void)setNeedsColorUpdate
{
  unint64_t v3 = [(BSUIScreenshotViewController *)self backgroundColor];
  v4 = [(BSUIScreenshotViewController *)self collectionView];
  [v4 setBackgroundColor:v3];

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  unsigned int v5 = [(BSUIScreenshotViewController *)self collectionView];
  id v6 = [v5 visibleCells];

  id v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v19;
    do
    {
      id v10 = 0;
      do
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_super v11 = *(void **)(*((void *)&v18 + 1) + 8 * (void)v10);
        objc_super v12 = [(BSUIScreenshotViewController *)self cellPlaceholderColor];
        v13 = [v11 imageView];
        [v13 setBackgroundColor:v12];

        id v14 = [(BSUIScreenshotViewController *)self cellBorderColor];
        id v15 = [v14 CGColor];
        id v16 = [v11 imageView];
        id v17 = [v16 layer];
        [v17 setBorderColor:v15];

        id v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v8);
  }
}

- (void)_doneButtonPressed
{
}

- (id)backgroundColor
{
  return +[UIColor bc_booksBackground];
}

- (id)cellPlaceholderColor
{
  v2 = +[UIColor colorWithRed:0.0 green:0.0 blue:0.0980392157 alpha:0.22];
  unint64_t v3 = +[UIColor colorWithRed:0.976470588 green:0.976470588 blue:0.988235294 alpha:0.16];
  v4 = +[UIColor bc_dynamicColorWithLightColor:v2 darkColor:v3];

  return v4;
}

- (id)cellBorderColor
{
  v2 = +[UIColor colorWithWhite:0.0 alpha:0.08];
  unint64_t v3 = +[UIColor colorWithWhite:0.0 alpha:0.92];
  v4 = +[UIColor bc_dynamicColorWithLightColor:v2 darkColor:v3];

  return v4;
}

- (void)setSelectedIndex:(int64_t)a3
{
  if (self->_selectedIndex != a3) {
    self->_selectedIndex = a3;
  }
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  v4 = [(BSUIScreenshotViewController *)self screenshots];
  id v5 = [v4 count];

  return (int64_t)v5;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  objc_opt_class();
  id v8 = [v7 dequeueReusableCellWithReuseIdentifier:@"CellIdentifier" forIndexPath:v6];

  uint64_t v9 = BUDynamicCast();

  id v10 = [(BSUIScreenshotViewController *)self screenshots];
  id v11 = [v6 row];

  objc_super v12 = [v10 objectAtIndexedSubscript:v11];

  v13 = [(BSUIScreenshotViewController *)self screenshotLoader];
  id v14 = [v13 imageForScreenshot:v12];

  [v9 configureWithScreenshot:v12 image:v14];
  id v15 = [(BSUIScreenshotViewController *)self cellPlaceholderColor];
  id v16 = [v9 imageView];
  [v16 setBackgroundColor:v15];

  id v17 = [(BSUIScreenshotViewController *)self cellBorderColor];
  id v18 = [v17 CGColor];
  long long v19 = [v9 imageView];
  long long v20 = [v19 layer];
  [v20 setBorderColor:v18];

  return v9;
}

- (double)collectionView:(id)a3 layout:(id)a4 minimumLineSpacingForSectionAtIndex:(int64_t)a5
{
  +[BSUIScreenshotCell minimumLineSpacingWithRegularPad:[(BSUIScreenshotViewController *)self _isRegularPad]];
  double v7 = v6;
  objc_opt_class();
  id v8 = [(BSUIScreenshotViewController *)self collectionView];
  uint64_t v9 = [v8 collectionViewLayout];
  id v10 = BUDynamicCast();

  [v10 setMinimumLineSpacing:v7];
  return v7;
}

- (double)collectionView:(id)a3 layout:(id)a4 minimumInteritemSpacingForSectionAtIndex:(int64_t)a5
{
  +[BSUIScreenshotCell minimumLineSpacingWithRegularPad:[(BSUIScreenshotViewController *)self _isRegularPad]];
  double v7 = v6;
  objc_opt_class();
  id v8 = [(BSUIScreenshotViewController *)self collectionView];
  uint64_t v9 = [v8 collectionViewLayout];
  id v10 = BUDynamicCast();

  [v10 setMinimumInteritemSpacing:v7];
  return v7;
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  id v6 = a3;
  BOOL v7 = [(BSUIScreenshotViewController *)self _isRegularPad];
  [v6 bounds];
  double v9 = v8;
  double v11 = v10;
  objc_super v12 = [(BSUIScreenshotViewController *)self screenshots];
  v13 = [v12 firstObject];
  [v13 size];
  +[BSUIScreenshotCell sectionInsetForRegularPad:maxSize:artworkSize:](BSUIScreenshotCell, "sectionInsetForRegularPad:maxSize:artworkSize:", v7, v9, v11, v14, v15);
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;

  BOOL v22 = [(BSUIScreenshotViewController *)self _isRegularPad];
  [v6 bounds];
  double v24 = v23;
  double v26 = v25;

  objc_super v27 = [(BSUIScreenshotViewController *)self screenshots];
  v28 = [v27 lastObject];
  [v28 size];
  +[BSUIScreenshotCell sectionInsetForRegularPad:maxSize:artworkSize:](BSUIScreenshotCell, "sectionInsetForRegularPad:maxSize:artworkSize:", v22, v24, v26, v29, v30);
  double v32 = v31;
  double v34 = v33;
  double v36 = v35;

  if (v17 >= v32) {
    double v17 = v32;
  }
  if (v21 >= v34) {
    double v21 = v34;
  }
  objc_opt_class();
  v37 = [(BSUIScreenshotViewController *)self collectionView];
  v38 = [v37 collectionViewLayout];
  v39 = BUDynamicCast();

  [v39 setSectionInset:v17, v19, v21, v36];
  double v40 = v17;
  double v41 = v19;
  double v42 = v21;
  double v43 = v36;
  result.right = v43;
  result.bottom = v42;
  result.left = v41;
  result.top = v40;
  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  id v6 = a3;
  BOOL v7 = [(BSUIScreenshotViewController *)self _isRegularPad];
  [v6 bounds];
  double v9 = v8;
  double v11 = v10;

  +[BSUIScreenshotCell itemSizeForRegularPad:maxSize:](BSUIScreenshotCell, "itemSizeForRegularPad:maxSize:", v7, v9, v11);
  result.double height = v13;
  result.double width = v12;
  return result;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v7 = a4;
  id v5 = [v7 item];
  if (v5 != (id)[(BSUIScreenshotViewController *)self selectedIndex])
  {
    id v6 = [(BSUIScreenshotViewController *)self collectionView];
    [v6 scrollToItemAtIndexPath:v7 atScrollPosition:16 animated:1];

    -[BSUIScreenshotViewController setSelectedIndex:](self, "setSelectedIndex:", [v7 item]);
  }
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  id v4 = a3;
  [v4 contentOffset];
  double v6 = v5;
  [v4 bounds];
  double v7 = v6 + CGRectGetWidth(v21) * 0.5;
  [v4 bounds];
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;

  v22.origin.x = v9;
  v22.origin.y = v11;
  v22.size.double width = v13;
  v22.size.double height = v15;
  CGFloat v16 = CGRectGetHeight(v22) * 0.5;
  double v17 = [(BSUIScreenshotViewController *)self collectionView];
  [v17 indexPathForItemAtPoint:v7, v16];
  id v19 = (id)objc_claimAutoreleasedReturnValue();

  double v18 = v19;
  if (v19)
  {
    -[BSUIScreenshotViewController setSelectedIndex:](self, "setSelectedIndex:", [v19 item]);
    double v18 = v19;
  }
}

- (void)screenshotLoader:(id)a3 willLoadImageAtIndex:(unint64_t)a4 fromURL:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  CGFloat v9 = JSALog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    double v10 = +[NSNumber numberWithUnsignedInteger:a4];
    int v11 = 138543874;
    id v12 = v7;
    __int16 v13 = 2114;
    double v14 = v10;
    __int16 v15 = 2114;
    id v16 = v8;
    _os_log_debug_impl(&dword_0, v9, OS_LOG_TYPE_DEBUG, "%{public}@ about to load screenshot at index %{public}@ from url %{public}@", (uint8_t *)&v11, 0x20u);
  }
}

- (void)screenshotLoader:(id)a3 loadedImage:(id)a4 forScreenshotAtIndex:(unint64_t)a5
{
  id v7 = a4;
  objc_opt_class();
  id v8 = [(BSUIScreenshotViewController *)self collectionView];
  CGFloat v9 = +[NSIndexPath indexPathForRow:a5 inSection:0];
  double v10 = [v8 cellForItemAtIndexPath:v9];
  BUDynamicCast();
  id v12 = (id)objc_claimAutoreleasedReturnValue();

  int v11 = [v12 imageView];
  [v11 setImage:v7];
}

- (void)screenshotLoader:(id)a3 failedToLoadImageforScreenshotAtIndex:(unint64_t)a4 withError:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  CGFloat v9 = JSALog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    double v10 = +[NSNumber numberWithUnsignedInteger:a4];
    int v11 = 138543874;
    id v12 = v7;
    __int16 v13 = 2114;
    double v14 = v10;
    __int16 v15 = 2114;
    id v16 = v8;
    _os_log_error_impl(&dword_0, v9, OS_LOG_TYPE_ERROR, "%{public}@ failed to load screenshot at index %{public}@ with error %{public}@", (uint8_t *)&v11, 0x20u);
  }
}

- (BOOL)_isRegularPad
{
  id v4 = [(BSUIScreenshotViewController *)self traitCollection];
  double v5 = (char *)[v4 userInterfaceIdiom];
  if (v5 == (unsigned char *)&dword_0 + 1
    || ([(BSUIScreenshotViewController *)self traitCollection],
        v2 = objc_claimAutoreleasedReturnValue(),
        [v2 userInterfaceIdiom] == (char *)&dword_4 + 1))
  {
    double v6 = [(BSUIScreenshotViewController *)self traitCollection];
    BOOL v7 = [v6 horizontalSizeClass] == (char *)&dword_0 + 2;

    if (v5 == (unsigned char *)&dword_0 + 1) {
      goto LABEL_7;
    }
  }
  else
  {
    BOOL v7 = 0;
  }

LABEL_7:
  return v7;
}

- (void)_swipeGestureRecognizer:(id)a3
{
  if ([a3 state] == (char *)&dword_0 + 3)
  {
    [(BSUIScreenshotViewController *)self dismissViewControllerAnimated:1 completion:0];
  }
}

- (void)_dismiss:(id)a3
{
}

- (void)_setupSubviews
{
  id v3 = objc_alloc((Class)UICollectionView);
  id v4 = objc_opt_new();
  id v5 = [v3 initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  [(BSUIScreenshotViewController *)self setCollectionView:v5];

  double v6 = [(BSUIScreenshotViewController *)self view];
  BOOL v7 = [v6 backgroundColor];
  id v8 = [(BSUIScreenshotViewController *)self collectionView];
  [v8 setBackgroundColor:v7];

  CGFloat v9 = [(BSUIScreenshotViewController *)self collectionView];
  [v9 setDelegate:self];

  double v10 = [(BSUIScreenshotViewController *)self collectionView];
  [v10 setDataSource:self];

  int v11 = [(BSUIScreenshotViewController *)self collectionView];
  [v11 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v12 = [(BSUIScreenshotViewController *)self collectionView];
  __int16 v13 = [v12 widthAnchor];
  double v14 = [(BSUIScreenshotViewController *)self view];
  [v14 bounds];
  id v16 = [v13 constraintEqualToConstant:v15];
  [v16 setActive:1];

  double v17 = [(BSUIScreenshotViewController *)self collectionView];
  double v42 = v17;
  double v40 = +[NSArray arrayWithObjects:&v42 count:1];

  id v18 = [objc_alloc((Class)UIStackView) initWithArrangedSubviews:v40];
  id v19 = [(BSUIScreenshotViewController *)self backgroundColor];
  id v20 = [v19 CGColor];
  CGRect v21 = [v18 layer];
  [v21 setBackgroundColor:v20];

  [v18 setAxis:0];
  [v18 setDistribution:3];
  [v18 setTranslatesAutoresizingMaskIntoConstraints:0];
  CGRect v22 = [(BSUIScreenshotViewController *)self view];
  [v22 addSubview:v18];

  v38 = [v18 leadingAnchor];
  v39 = [(BSUIScreenshotViewController *)self view];
  v37 = [v39 leadingAnchor];
  double v36 = [v38 constraintEqualToAnchor:v37];
  v41[0] = v36;
  double v34 = [v18 trailingAnchor];
  double v35 = [(BSUIScreenshotViewController *)self view];
  double v33 = [v35 trailingAnchor];
  double v32 = [v34 constraintEqualToAnchor:v33];
  v41[1] = v32;
  double v23 = [v18 topAnchor];
  double v24 = [(BSUIScreenshotViewController *)self view];
  double v25 = [v24 topAnchor];
  double v26 = [v23 constraintEqualToAnchor:v25 constant:0.0];
  v41[2] = v26;
  objc_super v27 = [v18 bottomAnchor];
  v28 = [(BSUIScreenshotViewController *)self view];
  double v29 = [v28 bottomAnchor];
  double v30 = [v27 constraintEqualToAnchor:v29];
  v41[3] = v30;
  double v31 = +[NSArray arrayWithObjects:v41 count:4];
  +[NSLayoutConstraint activateConstraints:v31];
}

- (void)_updateColors
{
  [(BSUIScreenshotViewController *)self setNeedsStatusBarAppearanceUpdate];

  [(BSUIScreenshotViewController *)self setNeedsColorUpdate];
}

- (NSArray)screenshots
{
  return self->_screenshots;
}

- (void)setScreenshots:(id)a3
{
}

- (int64_t)selectedIndex
{
  return self->_selectedIndex;
}

- (int64_t)initialSelectedIndex
{
  return self->_initialSelectedIndex;
}

- (void)setInitialSelectedIndex:(int64_t)a3
{
  self->_initialSelectedIndex = a3;
}

- (BSUIScreenshotLoader)screenshotLoader
{
  return self->_screenshotLoader;
}

- (void)setScreenshotLoader:(id)a3
{
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_screenshotLoader, 0);

  objc_storeStrong((id *)&self->_screenshots, 0);
}

@end