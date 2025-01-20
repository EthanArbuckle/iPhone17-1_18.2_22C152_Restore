@interface RTTUITextView
- (BOOL)_accessibilityIsRealtimeElement;
- (BOOL)_isKeyboardPredictionsEnabled;
- (BOOL)_shouldShowTTYPredictions;
- (BOOL)disableInputBars;
- (BOOL)isHandlingKeyboardFrameChanged;
- (BOOL)showTTYPredictions;
- (NSArray)ttyAbbreviations;
- (RTTUITextView)initWithFrame:(CGRect)a3 textContainer:(id)a4;
- (UICollectionView)predictionsCollectionView;
- (double)ttyBarHeight;
- (float)_predictionsCellBuffer;
- (float)_predictionsCellHeight;
- (id)accessibilityIdentifier;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)inputAccessoryView;
- (id)keyCommands;
- (int)_predictionsPerPage;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)keyboardAppearance;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (unint64_t)accessibilityTraits;
- (void)_didPanPredictions:(id)a3;
- (void)_didSwipeLeft:(id)a3;
- (void)_inlineTTYAbbreviationSelected:(id)a3;
- (void)_insertWhitespaceIfNeeded;
- (void)_kbFrameChanged:(id)a3;
- (void)_keyboardWillHide:(id)a3;
- (void)_loadTTYAbbreviations;
- (void)_resetTTYBarPosition;
- (void)_setupOverlayPredictions;
- (void)_showInlineRTTAbbreviations:(BOOL)a3;
- (void)_tapTTYBarCell:(id)a3;
- (void)_updateBlackBarPositioning;
- (void)_updateTTYBarFrame;
- (void)_updateTTYBarPosition;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)dealloc;
- (void)overrideTTYPredictionsHidden:(BOOL)a3;
- (void)setIsHandlingKeyboardFrameChanged:(BOOL)a3;
- (void)setPredictionsCollectionView:(id)a3;
- (void)setShowTTYPredictions:(BOOL)a3;
- (void)setTtyAbbreviations:(id)a3;
- (void)updateTTYBar;
@end

@implementation RTTUITextView

- (RTTUITextView)initWithFrame:(CGRect)a3 textContainer:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)RTTUITextView;
  v4 = -[RTTUITextView initWithFrame:textContainer:](&v9, sel_initWithFrame_textContainer_, a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = v4;
  if (v4)
  {
    [(RTTUITextView *)v4 setKeyboardType:1];
    [(RTTUITextView *)v5 _loadTTYAbbreviations];
    v6 = [MEMORY[0x263F62AF8] sharedInstance];
    int v7 = [v6 rttInlineAbbreviationBarEnabled];

    if (v7)
    {
      [(RTTUITextView *)v5 _showInlineRTTAbbreviations:1];
    }
    else
    {
      [(RTTUITextView *)v5 _setupOverlayPredictions];
      v5->_showTTYPredictions = 1;
      [(RTTUITextView *)v5 setShowTTYPredictions:0];
    }
  }
  return v5;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  [(RTTUITextView *)self setPredictionsCollectionView:0];
  [(RTTUITextView *)self setTtyAbbreviations:0];
  v4.receiver = self;
  v4.super_class = (Class)RTTUITextView;
  [(RTTUITextView *)&v4 dealloc];
}

- (void)_setupOverlayPredictions
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 addObserver:self selector:sel__kbFrameChanged_ name:*MEMORY[0x263F1D478] object:0];

  objc_super v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 addObserver:self selector:sel__keyboardWillHide_ name:*MEMORY[0x263F1D480] object:0];

  self->_currentKeyboardWidth = -1.0;
  v5 = (UICollectionViewFlowLayout *)objc_alloc_init(MEMORY[0x263F1C508]);
  flowLayout = self->_flowLayout;
  self->_flowLayout = v5;

  [(UICollectionViewFlowLayout *)self->_flowLayout setMinimumInteritemSpacing:3.0];
  [(UICollectionViewFlowLayout *)self->_flowLayout setMinimumLineSpacing:1.0];
  [(UICollectionViewFlowLayout *)self->_flowLayout setScrollDirection:1];
  id v7 = objc_alloc(MEMORY[0x263F1C4E0]);
  [(RTTUITextView *)self _predictionsCellHeight];
  id v24 = (id)objc_msgSend(v7, "initWithFrame:collectionViewLayout:", self->_flowLayout, 0.0, 0.0, 768.0, v8);
  [(RTTUITextView *)self setPredictionsCollectionView:v24];
  objc_super v9 = [(RTTUITextView *)self predictionsCollectionView];
  [v9 setDataSource:self];

  v10 = [MEMORY[0x263F1C550] colorWithRed:0.5 green:0.5 blue:0.5 alpha:1.0];
  v11 = [(RTTUITextView *)self predictionsCollectionView];
  [v11 setBackgroundColor:v10];

  v12 = [(RTTUITextView *)self predictionsCollectionView];
  [v12 setDelegate:self];

  v13 = [(RTTUITextView *)self predictionsCollectionView];
  [v13 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"ttyAbbreviationsCell"];

  v14 = [(RTTUITextView *)self predictionsCollectionView];
  [v14 setScrollEnabled:0];

  v15 = [(RTTUITextView *)self predictionsCollectionView];
  [v15 setAccessibilityIdentifier:@"TTYAbbreviationsBar"];

  [(RTTUITextView *)self setIsHandlingKeyboardFrameChanged:0];
  id v16 = objc_alloc(MEMORY[0x263F1CB60]);
  v17 = (UIView *)objc_msgSend(v16, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  inputAccessoryPlaceholderView = self->_inputAccessoryPlaceholderView;
  self->_inputAccessoryPlaceholderView = v17;

  [(UIView *)self->_inputAccessoryPlaceholderView setUserInteractionEnabled:0];
  [(UIView *)self->_inputAccessoryPlaceholderView setAlpha:0.0];
  v19 = [MEMORY[0x263F1C550] clearColor];
  [(UIView *)self->_inputAccessoryPlaceholderView setBackgroundColor:v19];

  v20 = [(RTTUITextView *)self predictionsCollectionView];
  [v20 setAutoresizesSubviews:1];

  v21 = (void *)[objc_alloc(MEMORY[0x263F1C838]) initWithTarget:self action:sel__didPanPredictions_];
  [v21 setDelegate:self];
  v22 = [(RTTUITextView *)self predictionsCollectionView];
  [v22 addGestureRecognizer:v21];

  [(RTTUITextView *)self reloadInputViews];
  v23 = [(RTTUITextView *)self predictionsCollectionView];
  [v23 reloadData];
}

- (double)ttyBarHeight
{
  v3 = [MEMORY[0x263F62AF8] sharedInstance];
  char v4 = [v3 rttInlineAbbreviationBarEnabled];

  double v5 = 0.0;
  if ((v4 & 1) == 0)
  {
    v6 = [(RTTUITextView *)self predictionsCollectionView];
    if (([v6 isHidden] & 1) == 0)
    {
      id v7 = [(RTTUITextView *)self predictionsCollectionView];
      [v7 frame];
      double Height = CGRectGetHeight(v11);
      [(RTTUITextView *)self _predictionsCellBuffer];
      double v5 = Height + v9;
    }
  }
  return v5;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v5 = [a3 cellForItemAtIndexPath:a4];
  [(RTTUITextView *)self _tapTTYBarCell:v5];
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 1;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v5 = [(RTTUITextView *)self ttyAbbreviations];
  int64_t v6 = [v5 count];

  id v7 = [(RTTUITextView *)self text];
  uint64_t v8 = [v7 length];

  if (v8) {
    return v6;
  }
  v10 = [(RTTUITextView *)self ttyAbbreviations];
  CGRect v11 = [v10 indexesOfObjectsPassingTest:&__block_literal_global_3];

  int64_t v12 = [v11 count];
  return v12;
}

uint64_t __55__RTTUITextView_collectionView_numberOfItemsInSection___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 objectForKey:@"requiresStringContent"];
  uint64_t v3 = [v2 BOOLValue] ^ 1;

  return v3;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = [a3 dequeueReusableCellWithReuseIdentifier:@"ttyAbbreviationsCell" forIndexPath:v6];
  uint64_t v8 = [(RTTUITextView *)self ttyAbbreviations];
  float v9 = [(RTTUITextView *)self text];
  uint64_t v10 = [v9 length];

  if (!v10)
  {
    CGRect v11 = [v8 indexesOfObjectsPassingTest:&__block_literal_global_311];
    uint64_t v12 = [v8 objectsAtIndexes:v11];

    uint64_t v8 = (void *)v12;
  }
  unint64_t v13 = [v8 count];
  if (v13 > [v6 row])
  {
    v14 = objc_msgSend(v8, "objectAtIndex:", objc_msgSend(v6, "row"));
    [v7 setAbbreviationData:v14];
  }
  return v7;
}

uint64_t __55__RTTUITextView_collectionView_cellForItemAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 objectForKey:@"requiresStringContent"];
  uint64_t v3 = [v2 BOOLValue] ^ 1;

  return v3;
}

- (void)_didPanPredictions:(id)a3
{
  id v15 = a3;
  char v4 = [(RTTUITextView *)self predictionsCollectionView];
  if ([v15 state] == 3)
  {
    [v15 translationInView:v4];
    double v6 = v5;
    [v15 velocityInView:v4];
    double v8 = self->_panContentOffset.x + v7 * -0.25 - v6;
    [v4 contentSize];
    double v10 = v9 + -1.0;
    if (v8 < v10) {
      double v10 = v8;
    }
    CGRect v11 = objc_msgSend(v4, "indexPathForItemAtPoint:", fmax(v10, 0.0));
    self->_leftIndex = [v11 row];
    [(RTTUITextView *)self _updateTTYBarPosition];
  }
  else
  {
    if ([v15 state] == 1)
    {
      [v4 contentOffset];
      self->_panContentOffset.x = v12;
      self->_panContentOffset.y = v13;
    }
    [v15 translationInView:v4];
    objc_msgSend(v4, "setContentOffset:", self->_panContentOffset.x - v14, 0.0);
  }
}

- (void)_didSwipeLeft:(id)a3
{
  unint64_t v4 = self->_leftIndex + [(RTTUITextView *)self _predictionsPerPage];
  self->_leftIndex = v4;
  double v5 = [(RTTUITextView *)self ttyAbbreviations];
  unint64_t v6 = [v5 count];

  if (v4 >= v6)
  {
    double v7 = [(RTTUITextView *)self ttyAbbreviations];
    int v8 = [v7 count];
    self->_leftIndex = v8 - [(RTTUITextView *)self _predictionsPerPage];
  }
  [(RTTUITextView *)self _updateTTYBarPosition];
}

- (void)_kbFrameChanged:(id)a3
{
  id v8 = a3;
  if (![(RTTUITextView *)self isHandlingKeyboardFrameChanged])
  {
    [(RTTUITextView *)self setIsHandlingKeyboardFrameChanged:1];
    unint64_t v4 = [v8 userInfo];
    double v5 = [v4 valueForKey:*MEMORY[0x263F1D428]];
    [v5 CGRectValue];
    double v7 = v6;

    if ([(RTTUITextView *)self _shouldShowTTYPredictions])
    {
      if (self->_currentKeyboardWidth != v7) {
        [(RTTUITextView *)self updateTTYBar];
      }
    }
    else
    {
      [(RTTUITextView *)self setShowTTYPredictions:0];
    }
    [(RTTUITextView *)self setIsHandlingKeyboardFrameChanged:0];
  }
}

- (void)_keyboardWillHide:(id)a3
{
  self->_showTTYPredictions = 0;
  [(UICollectionView *)self->_predictionsCollectionView setHidden:1];
  iPadBufferView = self->_iPadBufferView;
  [(UIView *)iPadBufferView setHidden:1];
}

- (id)keyCommands
{
  v5[1] = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F1C708] keyCommandWithInput:@"\r" modifierFlags:0 action:sel_gaButtonPressed_];
  v5[0] = v2;
  uint64_t v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:1];

  return v3;
}

- (int64_t)keyboardAppearance
{
  return 1;
}

- (id)inputAccessoryView
{
  uint64_t v3 = [MEMORY[0x263F62AF8] sharedInstance];
  char v4 = [v3 rttInlineAbbreviationBarEnabled];

  if (v4)
  {
    double v5 = 0;
  }
  else
  {
    [(RTTUITextView *)self _resetTTYBarPosition];
    [(RTTUITextView *)self _updateTTYBarFrame];
    double v5 = self->_inputAccessoryPlaceholderView;
  }
  return v5;
}

- (BOOL)disableInputBars
{
  uint64_t v3 = [MEMORY[0x263F62AF8] sharedInstance];
  char v4 = [v3 rttInlineAbbreviationBarEnabled];

  if ((v4 & 1) != 0 || !self->_showTTYPredictions)
  {
    LOBYTE(v6) = 0;
  }
  else
  {
    double v5 = [MEMORY[0x263F1C738] activeInstance];
    int v6 = [v5 accessibilityUsesExtendedKeyboardPredictionsEnabled] ^ 1;
  }
  return v6;
}

- (void)overrideTTYPredictionsHidden:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = [MEMORY[0x263F62AF8] sharedInstance];
  char v6 = [v5 rttInlineAbbreviationBarEnabled];

  if ((v6 & 1) == 0 && self->_showTTYPredictions == v3)
  {
    self->_showTTYPredictions = !v3;
    [(RTTUITextView *)self _resetTTYBarPosition];
    [(RTTUITextView *)self updateTTYBar];
  }
}

- (void)_showInlineRTTAbbreviations:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = [(RTTUITextView *)self inputAssistantItem];
  char v6 = v5;
  if (v3)
  {
    double v7 = [v5 trailingBarButtonGroups];
    char v8 = objc_msgSend(v7, "ax_containsObjectUsingBlock:", &__block_literal_global_322);

    if ((v8 & 1) == 0)
    {
      [v6 _setShowsBarButtonItemsInline:1];
      double v9 = [MEMORY[0x263F1C5C0] currentDevice];
      uint64_t v10 = [v9 userInterfaceIdiom];

      if ((v10 & 0xFFFFFFFFFFFFFFFBLL) == 1)
      {
        CGRect v11 = [v6 trailingBarButtonGroups];
        CGFloat v12 = (void *)[v11 mutableCopy];
      }
      else
      {
        CGFloat v12 = [MEMORY[0x263EFF980] array];
      }
      double v14 = [MEMORY[0x263EFF980] array];
      id v15 = [MEMORY[0x263F1C738] activeInstance];
      [v15 frame];
      double v17 = v16;

      if (v17 == 0.0)
      {
        v18 = [MEMORY[0x263F1C920] mainScreen];
        [v18 bounds];
        double v17 = v19;
      }
      v20 = [RTTUIAbbreviationViewContainer alloc];
      [(RTTUITextView *)self _predictionsCellHeight];
      v22 = -[RTTUIAbbreviationViewContainer initWithFrame:](v20, "initWithFrame:", 0.0, 0.0, v17, v21);
      [(RTTUIAbbreviationViewContainer *)v22 setDelaysContentTouches:0];
      [(RTTUIAbbreviationViewContainer *)v22 setShowsHorizontalScrollIndicator:0];
      [(RTTUIAbbreviationViewContainer *)v22 setDirectionalLockEnabled:1];
      uint64_t v32 = 0;
      v33 = (double *)&v32;
      uint64_t v34 = 0x2020000000;
      uint64_t v35 = 0;
      v23 = [(RTTUITextView *)self ttyAbbreviations];
      v29[0] = MEMORY[0x263EF8330];
      v29[1] = 3221225472;
      v29[2] = __45__RTTUITextView__showInlineRTTAbbreviations___block_invoke_2;
      v29[3] = &unk_264638BE0;
      v29[4] = self;
      v31 = &v32;
      id v24 = v22;
      v30 = v24;
      [v23 enumerateObjectsUsingBlock:v29];

      double v25 = v33[3];
      [(RTTUITextView *)self _predictionsCellHeight];
      -[RTTUIAbbreviationViewContainer setContentSize:](v24, "setContentSize:", v25, v26);
      v27 = (void *)[objc_alloc(MEMORY[0x263F1C468]) initWithCustomView:v24];
      [v14 addObject:v27];

      v28 = (void *)[objc_alloc(MEMORY[0x263F1C470]) initWithBarButtonItems:v14 representativeItem:0];
      [v28 setAccessibilityIdentifier:@"RTTGroup"];
      [v12 addObject:v28];
      [v6 setLeadingBarButtonGroups:MEMORY[0x263EFFA68]];
      [v6 setTrailingBarButtonGroups:v12];

      _Block_object_dispose(&v32, 8);
    }
  }
  else
  {
    [v5 _setShowsBarButtonItemsInline:0];
    uint64_t v13 = MEMORY[0x263EFFA68];
    [v6 setTrailingBarButtonGroups:MEMORY[0x263EFFA68]];
    [v6 setLeadingBarButtonGroups:v13];
  }
}

uint64_t __45__RTTUITextView__showInlineRTTAbbreviations___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 accessibilityIdentifier];
  uint64_t v3 = [v2 isEqualToString:@"RTTGroup"];

  return v3;
}

void __45__RTTUITextView__showInlineRTTAbbreviations___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  char v6 = [RTTUIAbbreviationView alloc];
  uint64_t v13 = -[RTTUIAbbreviationView initWithFrame:](v6, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  [(RTTUIAbbreviationView *)v13 setAbbreviationData:v5];

  [*(id *)(a1 + 32) _predictionsCellHeight];
  -[RTTUIAbbreviationView sizeThatFits:](v13, "sizeThatFits:", 0.0, v7);
  double v9 = v8;
  double v10 = *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  [*(id *)(a1 + 32) _predictionsCellHeight];
  -[RTTUIAbbreviationView setFrame:](v13, "setFrame:", v10, 0.0, v9, v11);
  [(RTTUIAbbreviationView *)v13 setDrawLeftBorder:a3 != 0];
  CGFloat v12 = [[RTTAbbreviationTapGestureRecognizer alloc] initWithTarget:*(void *)(a1 + 32) action:sel__inlineTTYAbbreviationSelected_];
  [(RTTAbbreviationTapGestureRecognizer *)v12 setAbbrevationView:v13];
  [(RTTUIAbbreviationView *)v13 addGestureRecognizer:v12];
  [*(id *)(a1 + 40) addSubview:v13];
  *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v9
                                                              + *(double *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                          + 24);
}

- (void)_inlineTTYAbbreviationSelected:(id)a3
{
  char v4 = [a3 view];
  id v5 = NSString;
  id v19 = v4;
  char v6 = [v4 abbreviationText];
  float v7 = [v5 stringWithFormat:@"%@ ", v6];

  [(RTTUITextView *)self _insertWhitespaceIfNeeded];
  [(RTTUITextView *)self insertText:v7];
  [(RTTUITextView *)self setShowTTYPredictions:0];
  double v8 = [(RTTUITextView *)self inputAssistantItem];
  double v9 = [v8 trailingBarButtonGroups];
  int v10 = objc_msgSend(v9, "ax_containsObjectUsingBlock:", &__block_literal_global_341);

  if (v10)
  {
    float v11 = [(RTTUITextView *)self inputAssistantItem];
    CGFloat v12 = [v11 trailingBarButtonGroups];
    uint64_t v13 = [v12 firstObject];

    double v14 = [v13 barButtonItems];
    id v15 = [v14 firstObject];

    double v16 = [v15 customView];
    objc_msgSend(v16, "scrollRectToVisible:animated:", 0, 0.0, 0.0, 1.0, 1.0);
    double v17 = [(RTTUITextView *)self inputAssistantItem];
    [v17 _setShowsBarButtonItemsInline:0];

    [(RTTUITextView *)self reloadInputViews];
    v18 = [(RTTUITextView *)self inputAssistantItem];
    [v18 _setShowsBarButtonItemsInline:1];

    [(RTTUITextView *)self reloadInputViews];
  }
}

uint64_t __48__RTTUITextView__inlineTTYAbbreviationSelected___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 accessibilityIdentifier];
  uint64_t v3 = [v2 isEqualToString:@"RTTGroup"];

  return v3;
}

- (void)setShowTTYPredictions:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [MEMORY[0x263F62AF8] sharedInstance];
  char v6 = [v5 rttInlineAbbreviationBarEnabled];

  if ((v6 & 1) == 0 && self->_showTTYPredictions != v3)
  {
    if (v3 && [(RTTUITextView *)self _shouldShowTTYPredictions]) {
      LOBYTE(v7) = 1;
    }
    else {
      BOOL v7 = ![(RTTUITextView *)self _isKeyboardPredictionsEnabled];
    }
    self->_showTTYPredictions = v7;
    [(RTTUITextView *)self _resetTTYBarPosition];
    [(RTTUITextView *)self updateTTYBar];
  }
}

- (BOOL)_shouldShowTTYPredictions
{
  if ([MEMORY[0x263F1C738] isSplit]) {
    return 0;
  }
  else {
    return [MEMORY[0x263F1C738] isFloating] ^ 1;
  }
}

- (BOOL)_isKeyboardPredictionsEnabled
{
  CFBooleanRef v2 = (const __CFBoolean *)CFPreferencesCopyValue(@"KeyboardShowPredictionBar", @"com.apple.Preferences", (CFStringRef)*MEMORY[0x263EFFE70], (CFStringRef)*MEMORY[0x263EFFE50]);
  if (!v2) {
    return 1;
  }
  CFBooleanRef v3 = v2;
  CFTypeID v4 = CFGetTypeID(v2);
  BOOL v5 = v4 != CFBooleanGetTypeID() || CFBooleanGetValue(v3) != 0;
  CFRelease(v3);
  return v5;
}

- (void)_updateBlackBarPositioning
{
  CFBooleanRef v3 = [(RTTUITextView *)self predictionsCollectionView];
  [v3 frame];
  double v5 = v4;

  char v6 = [(RTTUITextView *)self predictionsCollectionView];
  [v6 contentOffset];
  double v8 = v5 + v7 + -1.0;
  [(RTTUITextView *)self _predictionsCellHeight];
  -[UIView setFrame:](self->_rightBackgroundColorEdge, "setFrame:", v8, 0.0, 1.0, v9);

  int v10 = [(RTTUITextView *)self predictionsCollectionView];
  [v10 contentOffset];
  double v12 = v11;
  [(RTTUITextView *)self _predictionsCellHeight];
  -[UIView setFrame:](self->_leftBackgroundColorEdge, "setFrame:", v12, 0.0, 1.0, v13);

  double v14 = [(RTTUITextView *)self predictionsCollectionView];
  [v14 contentOffset];
  double v16 = v5 * 0.5 + v15 + -2.0;
  [(RTTUITextView *)self _predictionsCellHeight];
  -[UIView setFrame:](self->_middleBackgroundColorEdge, "setFrame:", v16, 0.0, 4.0, v17);

  id v18 = [(UIView *)self->_middleBackgroundColorEdge superview];
  [v18 sendSubviewToBack:self->_middleBackgroundColorEdge];
}

- (void)updateTTYBar
{
  CFBooleanRef v3 = [MEMORY[0x263F62AF8] sharedInstance];
  char v4 = [v3 rttInlineAbbreviationBarEnabled];

  if ((v4 & 1) == 0)
  {
    uint64_t v32 = 0;
    v33 = &v32;
    uint64_t v34 = 0x2020000000;
    double v5 = (unsigned int (*)(uint64_t, uint64_t, uint64_t, uint64_t))getAXUIKeyboardIsOnScreenSymbolLoc_ptr_0;
    uint64_t v35 = getAXUIKeyboardIsOnScreenSymbolLoc_ptr_0;
    if (!getAXUIKeyboardIsOnScreenSymbolLoc_ptr_0)
    {
      uint64_t v27 = MEMORY[0x263EF8330];
      uint64_t v28 = 3221225472;
      v29 = __getAXUIKeyboardIsOnScreenSymbolLoc_block_invoke_0;
      v30 = &unk_2646386E0;
      v31 = &v32;
      char v6 = (void *)AccessibilityUIUtilitiesLibrary();
      v33[3] = (uint64_t)dlsym(v6, "AXUIKeyboardIsOnScreen");
      getAXUIKeyboardIsOnScreenSymbolLoc_ptr_0 = *(_UNKNOWN **)(v31[1] + 24);
      double v5 = (unsigned int (*)(uint64_t, uint64_t, uint64_t, uint64_t))v33[3];
    }
    _Block_object_dispose(&v32, 8);
    if (v5)
    {
      if (!v5(v7, v8, v9, v10)) {
        goto LABEL_10;
      }
      uint64_t v32 = 0;
      v33 = &v32;
      uint64_t v34 = 0x2020000000;
      double v11 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))getAXUIKeyboardScreenFrameSymbolLoc_ptr;
      uint64_t v35 = getAXUIKeyboardScreenFrameSymbolLoc_ptr;
      if (!getAXUIKeyboardScreenFrameSymbolLoc_ptr)
      {
        uint64_t v27 = MEMORY[0x263EF8330];
        uint64_t v28 = 3221225472;
        v29 = __getAXUIKeyboardScreenFrameSymbolLoc_block_invoke;
        v30 = &unk_2646386E0;
        v31 = &v32;
        double v12 = (void *)AccessibilityUIUtilitiesLibrary();
        v33[3] = (uint64_t)dlsym(v12, "AXUIKeyboardScreenFrame");
        getAXUIKeyboardScreenFrameSymbolLoc_ptr = *(_UNKNOWN **)(v31[1] + 24);
        double v11 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v33[3];
      }
      _Block_object_dispose(&v32, 8);
      if (v11)
      {
        v11(v13, v14, v15, v16);
        if (v17 != 0.0)
        {
          v20 = [(RTTUITextView *)self predictionsCollectionView];
          float v21 = [v20 window];

          if (v21)
          {
            v22 = [(RTTUITextView *)self predictionsCollectionView];
            v23 = [v22 superview];
            id v24 = [(RTTUITextView *)self predictionsCollectionView];
            [v23 bringSubviewToFront:v24];
          }
          else
          {
            v22 = [(RTTUITextView *)self window];
            v23 = [v22 rootViewController];
            id v24 = [v23 view];
            double v25 = [(RTTUITextView *)self predictionsCollectionView];
            [v24 addSubview:v25];
          }
          [(RTTUITextView *)self reloadInputViews];
          [(RTTUITextView *)self _updateTTYBarFrame];
          id v19 = [(RTTUITextView *)self predictionsCollectionView];
          [v19 reloadData];
          goto LABEL_13;
        }
LABEL_10:
        id v18 = AXLogRTT();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v27) = 0;
          _os_log_impl(&dword_222978000, v18, OS_LOG_TYPE_DEFAULT, "No keyboard on screen, removing predictions", (uint8_t *)&v27, 2u);
        }

        id v19 = [(RTTUITextView *)self predictionsCollectionView];
        [v19 removeFromSuperview];
LABEL_13:

        return;
      }
    }
    else
    {
      -[RTTUIConversationControllerCoordinator registerForCallUpdates:]();
    }
    float v26 = (_Unwind_Exception *)-[RTTUIConversationControllerCoordinator registerForCallUpdates:]();
    _Block_object_dispose(&v32, 8);
    _Unwind_Resume(v26);
  }
}

- (void)_updateTTYBarFrame
{
  CFBooleanRef v3 = [MEMORY[0x263F1C738] activeInstance];
  [v3 frame];
  self->_double currentKeyboardWidth = v4;

  double currentKeyboardWidth = self->_currentKeyboardWidth;
  if (currentKeyboardWidth > 0.0)
  {
    double v6 = currentKeyboardWidth / (double)[(RTTUITextView *)self _predictionsPerPage] + -1.0;
    [(RTTUITextView *)self _predictionsCellHeight];
    -[UICollectionViewFlowLayout setItemSize:](self->_flowLayout, "setItemSize:", v6, v7);
  }
  uint64_t v8 = [(RTTUITextView *)self predictionsCollectionView];
  [v8 setHidden:!self->_showTTYPredictions];

  inputAccessoryPlaceholderView = self->_inputAccessoryPlaceholderView;
  [(UIView *)inputAccessoryPlaceholderView bounds];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  id v18 = [(RTTUITextView *)self predictionsCollectionView];
  id v19 = [v18 superview];
  -[UIView convertRect:toView:](inputAccessoryPlaceholderView, "convertRect:toView:", v19, v11, v13, v15, v17);
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;
  double v27 = v26;

  [(RTTUITextView *)self _predictionsCellHeight];
  double v29 = v23 - v28;
  [(RTTUITextView *)self _predictionsCellBuffer];
  double v31 = v29 - v30;
  double v32 = self->_currentKeyboardWidth;
  [(RTTUITextView *)self _predictionsCellHeight];
  double v34 = v33;
  uint64_t v35 = [(RTTUITextView *)self predictionsCollectionView];
  objc_msgSend(v35, "setFrame:", v21, v31, v32, v34);

  if ([MEMORY[0x263F472B0] deviceIsPad])
  {
    CGFloat rect = v27;
    if (!self->_iPadBufferView)
    {
      v36 = (UIView *)objc_alloc_init(MEMORY[0x263F1CB60]);
      iPadBufferView = self->_iPadBufferView;
      self->_iPadBufferView = v36;

      v38 = self->_iPadBufferView;
      v39 = [MEMORY[0x263F1C550] colorWithWhite:0.2 alpha:0.5];
      [(UIView *)v38 setBackgroundColor:v39];
    }
    CGFloat v40 = v25;
    v41 = [(RTTUITextView *)self predictionsCollectionView];
    if (([v41 isHidden] & 1) == 0)
    {
      v42 = [(UIView *)self->_iPadBufferView superview];

      if (v42)
      {
LABEL_10:
        v44 = self->_iPadBufferView;
        v70.origin.x = v21;
        v70.origin.y = v31;
        v70.size.width = v32;
        v70.size.height = v34;
        double MaxY = CGRectGetMaxY(v70);
        double v46 = self->_currentKeyboardWidth;
        v71.origin.x = v21;
        v71.origin.y = v23;
        v71.size.width = v40;
        v71.size.height = rect;
        double MinY = CGRectGetMinY(v71);
        v72.origin.x = v21;
        v72.origin.y = v31;
        v72.size.width = v32;
        v72.size.height = v34;
        -[UIView setFrame:](v44, "setFrame:", v21, MaxY, v46, MinY - CGRectGetMaxY(v72));
        v48 = self->_iPadBufferView;
        v49 = [(RTTUITextView *)self predictionsCollectionView];
        -[UIView setHidden:](v48, "setHidden:", [v49 isHidden]);

        goto LABEL_16;
      }
      v41 = [(RTTUITextView *)self predictionsCollectionView];
      v43 = [v41 superview];
      [v43 addSubview:self->_iPadBufferView];
    }
    goto LABEL_10;
  }
  v50 = [(RTTUITextView *)self predictionsCollectionView];
  v51 = [v50 superview];
  if (!v51) {
    goto LABEL_14;
  }
  leftBackgroundColorEdge = self->_leftBackgroundColorEdge;

  if (!leftBackgroundColorEdge)
  {
    v50 = [MEMORY[0x263F1C550] colorWithRed:0.15 green:0.15 blue:0.15 alpha:1.0];
    id v53 = objc_alloc(MEMORY[0x263F1CB60]);
    double v54 = *MEMORY[0x263F001A8];
    double v55 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v56 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v57 = *(double *)(MEMORY[0x263F001A8] + 24);
    v58 = (UIView *)objc_msgSend(v53, "initWithFrame:", *MEMORY[0x263F001A8], v55, v56, v57);
    v59 = self->_leftBackgroundColorEdge;
    self->_leftBackgroundColorEdge = v58;

    v60 = [(RTTUITextView *)self predictionsCollectionView];
    [v60 addSubview:self->_leftBackgroundColorEdge];

    [(UIView *)self->_leftBackgroundColorEdge setBackgroundColor:v50];
    v61 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x263F1CB60]), "initWithFrame:", v54, v55, v56, v57);
    rightBackgroundColorEdge = self->_rightBackgroundColorEdge;
    self->_rightBackgroundColorEdge = v61;

    v63 = [(RTTUITextView *)self predictionsCollectionView];
    [v63 addSubview:self->_rightBackgroundColorEdge];

    [(UIView *)self->_rightBackgroundColorEdge setBackgroundColor:v50];
    v64 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x263F1CB60]), "initWithFrame:", v54, v55, v56, v57);
    middleBackgroundColorEdge = self->_middleBackgroundColorEdge;
    self->_middleBackgroundColorEdge = v64;

    v66 = [(RTTUITextView *)self predictionsCollectionView];
    [v66 insertSubview:self->_middleBackgroundColorEdge atIndex:0];

    [(UIView *)self->_middleBackgroundColorEdge setBackgroundColor:v50];
LABEL_14:
  }
  [(RTTUITextView *)self _updateBlackBarPositioning];
LABEL_16:
  recta = [(RTTUITextView *)self predictionsCollectionView];
  [recta reloadData];
}

- (void)_resetTTYBarPosition
{
  self->_int64_t leftIndex = 0;
  if (self->_showTTYPredictions)
  {
    CFBooleanRef v3 = [(RTTUITextView *)self predictionsCollectionView];
    uint64_t v4 = [v3 numberOfItemsInSection:0];
    int64_t leftIndex = self->_leftIndex;

    if (v4 > leftIndex)
    {
      id v7 = [(RTTUITextView *)self predictionsCollectionView];
      double v6 = [MEMORY[0x263F088C8] indexPathForRow:self->_leftIndex inSection:0];
      [v7 scrollToItemAtIndexPath:v6 atScrollPosition:8 animated:0];
    }
  }
}

- (void)_updateTTYBarPosition
{
  if (self->_showTTYPredictions)
  {
    CFBooleanRef v3 = [(RTTUITextView *)self predictionsCollectionView];
    uint64_t v4 = [MEMORY[0x263F088C8] indexPathForRow:self->_leftIndex inSection:0];
    [v3 scrollToItemAtIndexPath:v4 atScrollPosition:8 animated:1];

    [(RTTUITextView *)self _updateBlackBarPositioning];
  }
}

- (void)_tapTTYBarCell:(id)a3
{
  uint64_t v4 = NSString;
  double v5 = [a3 abbreviationText];
  id v6 = [v4 stringWithFormat:@"%@ ", v5];

  [(RTTUITextView *)self _insertWhitespaceIfNeeded];
  [(RTTUITextView *)self insertText:v6];
  [(RTTUITextView *)self setShowTTYPredictions:0];
}

- (void)_insertWhitespaceIfNeeded
{
  CFBooleanRef v3 = [(RTTUITextView *)self beginningOfDocument];
  uint64_t v4 = [(RTTUITextView *)self selectedTextRange];
  double v5 = [v4 start];
  uint64_t v6 = [(RTTUITextView *)self offsetFromPosition:v3 toPosition:v5];

  id v7 = [(RTTUITextView *)self text];
  unint64_t v8 = [v7 length];

  if (v6 >= 1 && v6 - 1 < v8)
  {
    uint64_t v9 = [(RTTUITextView *)self text];
    uint64_t v10 = [v9 characterAtIndex:v6 - 1];

    double v11 = [MEMORY[0x263F08708] whitespaceCharacterSet];
    LOBYTE(v10) = [v11 characterIsMember:v10];

    if ((v10 & 1) == 0)
    {
      [(RTTUITextView *)self insertText:@" "];
    }
  }
}

- (void)_loadTTYAbbreviations
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  CFBooleanRef v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v19 = [v2 pathForResource:@"TTYAbbreviationsOrder" ofType:@"plist"];
  id v18 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithContentsOfFile:");
  CFBooleanRef v3 = [MEMORY[0x263EFF9A0] dictionary];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v4 = [&unk_26D5228B0 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v21 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v25 != v21) {
          objc_enumerationMutation(&unk_26D5228B0);
        }
        id v7 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        unint64_t v8 = [v3 objectForKeyedSubscript:v7];
        if (!v8)
        {
          unint64_t v8 = [MEMORY[0x263EFF9A0] dictionary];
          [v3 setObject:v8 forKeyedSubscript:v7];
        }
        uint64_t v9 = [v7 stringByAppendingString:@"_Abbrevation"];
        uint64_t v10 = [v2 localizedStringForKey:v9 value:&stru_26D51E848 table:@"TTYAbbreviations"];

        if ([v10 length]) {
          [v8 setObject:v10 forKeyedSubscript:@"abbr"];
        }
        double v11 = [v7 stringByAppendingString:@"_Definition"];
        double v12 = [v2 localizedStringForKey:v11 value:&stru_26D51E848 table:@"TTYAbbreviations"];

        if ([v12 length]) {
          [v8 setObject:v12 forKeyedSubscript:@"hint"];
        }
      }
      uint64_t v5 = [&unk_26D5228B0 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v5);
  }
  double v13 = [v3 allKeys];
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __38__RTTUITextView__loadTTYAbbreviations__block_invoke;
  v22[3] = &unk_264638C08;
  id v23 = v18;
  id v14 = v18;
  double v15 = [v13 sortedArrayUsingComparator:v22];
  double v16 = [MEMORY[0x263EFF9D0] null];
  double v17 = [v3 objectsForKeys:v15 notFoundMarker:v16];

  [(RTTUITextView *)self setTtyAbbreviations:v17];
}

uint64_t __38__RTTUITextView__loadTTYAbbreviations__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = NSNumber;
  uint64_t v6 = *(void **)(a1 + 32);
  id v7 = a3;
  unint64_t v8 = objc_msgSend(v5, "numberWithUnsignedInteger:", objc_msgSend(v6, "indexOfObject:", a2));
  uint64_t v9 = NSNumber;
  uint64_t v10 = [*(id *)(a1 + 32) indexOfObject:v7];

  double v11 = [v9 numberWithUnsignedInteger:v10];
  uint64_t v12 = [v8 compare:v11];

  return v12;
}

- (float)_predictionsCellBuffer
{
  int v2 = [MEMORY[0x263F472B0] deviceIsPad];
  float result = 0.0;
  if (v2) {
    return 5.0;
  }
  return result;
}

- (float)_predictionsCellHeight
{
  if ([MEMORY[0x263F472B0] deviceIsPad]) {
    return 50.0;
  }
  CFBooleanRef v3 = [MEMORY[0x263F1C920] mainScreen];
  [v3 bounds];
  double Width = CGRectGetWidth(v5);

  float result = 38.0;
  if (Width > 320.0) {
    return 39.0;
  }
  return result;
}

- (int)_predictionsPerPage
{
  if ([MEMORY[0x263F472B0] deviceIsPad]) {
    return 3;
  }
  else {
    return 2;
  }
}

- (id)accessibilityIdentifier
{
  return @"RTTUITextView";
}

- (BOOL)_accessibilityIsRealtimeElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)RTTUITextView;
  [(RTTUITextView *)&v3 accessibilityTraits];
  return _AXTraitsRemoveTrait();
}

- (BOOL)showTTYPredictions
{
  return self->_showTTYPredictions;
}

- (NSArray)ttyAbbreviations
{
  return self->_ttyAbbreviations;
}

- (void)setTtyAbbreviations:(id)a3
{
}

- (UICollectionView)predictionsCollectionView
{
  return self->_predictionsCollectionView;
}

- (void)setPredictionsCollectionView:(id)a3
{
}

- (BOOL)isHandlingKeyboardFrameChanged
{
  return self->_isHandlingKeyboardFrameChanged;
}

- (void)setIsHandlingKeyboardFrameChanged:(BOOL)a3
{
  self->_isHandlingKeyboardFrameChanged = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_predictionsCollectionView, 0);
  objc_storeStrong((id *)&self->_ttyAbbreviations, 0);
  objc_storeStrong((id *)&self->_iPadBufferView, 0);
  objc_storeStrong((id *)&self->_inputAccessoryPlaceholderView, 0);
  objc_storeStrong((id *)&self->_middleBackgroundColorEdge, 0);
  objc_storeStrong((id *)&self->_rightBackgroundColorEdge, 0);
  objc_storeStrong((id *)&self->_leftBackgroundColorEdge, 0);
  objc_storeStrong((id *)&self->_flowLayout, 0);
}

@end