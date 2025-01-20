@interface UIPickerView
+ (BOOL)_allowsUnsupportedMacIdiomBehavior;
+ (CGSize)defaultSizeForMainScreenTraits;
+ (CGSize)defaultSizeForTraits:(id)a3;
+ (CGSize)sizeForMainScreenTraitsThatFits:(CGSize)a3;
+ (CGSize)sizeThatFits:(CGSize)a3 forTraits:(id)a4;
+ (id)_styleForIdiom:(int64_t)a3;
+ (void)_prepareStyleStorageIfNecessary;
+ (void)_registerStyle:(id)a3 forIdiom:(int64_t)a4;
+ (void)_setAllowsUnsupportedMacIdiomBehavior:(BOOL)a3;
+ (void)initialize;
- (BOOL)_canHostViewControllerContentScrollView;
- (BOOL)_contentHuggingDefault_isUsuallyFixedHeight;
- (BOOL)_contentHuggingDefault_isUsuallyFixedWidth;
- (BOOL)_drawsBackground;
- (BOOL)_enabled;
- (BOOL)_forceTextAlignmentCentered;
- (BOOL)_magnifierEnabled;
- (BOOL)_needsLayout;
- (BOOL)_selectionBarIgnoresInset;
- (BOOL)_soundsEnabled;
- (BOOL)_usesCheckSelection;
- (BOOL)_usesCheckedSelection;
- (BOOL)_usesDynamicRowHeight;
- (BOOL)allowsMultipleSelection;
- (BOOL)isAccessibilityElementByDefault;
- (BOOL)showsSelectionIndicator;
- (CATransform3D)_perspectiveTransform;
- (CGRect)_effectiveTableViewFrameForColumn:(int64_t)a3;
- (CGRect)_selectionBarRectForHeight:(double)a3;
- (CGSize)_contentSizeForRow:(int64_t)a3 inComponent:(int64_t)a4;
- (CGSize)_sizeThatFits:(CGSize)a3;
- (CGSize)defaultSize;
- (CGSize)rowSizeForComponent:(NSInteger)component;
- (NSInteger)numberOfComponents;
- (NSInteger)numberOfRowsInComponent:(NSInteger)component;
- (NSInteger)selectedRowInComponent:(NSInteger)component;
- (UIColor)_magnifierLineColor;
- (UIColor)_textColor;
- (UIColor)_textShadowColor;
- (UIPickerView)init;
- (UIPickerView)initWithCoder:(id)a3;
- (UIPickerView)initWithFrame:(CGRect)a3;
- (UISelectionFeedbackGenerator)_selectionFeedbackGenerator;
- (UIView)viewForRow:(NSInteger)row forComponent:(NSInteger)component;
- (_NSRange)visibleRowsForColumn:(int)a3;
- (_UIPickerViewStyle)_style;
- (double)_delegateRowHeightForComponent:(int64_t)a3;
- (double)_delegateWidthForComponent:(int64_t)a3 ofCount:(int)a4 withSizeLeft:(double)a5;
- (double)_rowHeightForDefaultFont;
- (double)_selectionBarSideInset;
- (double)_tableRowHeight;
- (double)_wheelShift;
- (double)scrollAnimationDuration;
- (id)_contentView;
- (id)_createColumnWithTableFrame:(CGRect)a3 rowHeight:(double)a4 paddingAroundWheels:(double)a5;
- (id)_createTableWithFrame:(CGRect)a3 forComponent:(int64_t)a4;
- (id)_delegateAttributedTitleForRow:(int64_t)a3 forComponent:(int64_t)a4;
- (id)_delegateTitleForRow:(int64_t)a3 forComponent:(int64_t)a4;
- (id)_scalarStatisticsForUserValueChangedEvent;
- (id)_selectionBarSuffix;
- (id)_systemDefaultFocusGroupIdentifier;
- (id)dataSource;
- (id)delegate;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableViewForColumn:(int64_t)a3;
- (int)selectedRowForColumn:(int)a3;
- (int64_t)_delegateNumberOfComponents;
- (int64_t)_delegateNumberOfRowsInComponent:(int64_t)a3;
- (int64_t)_magnifierStyle;
- (int64_t)columnForTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_addHighlightRectForRowHeight:(double)a3;
- (void)_addMagnifierForRowHeight:(double)a3;
- (void)_addMagnifierLinesForRowHeight:(double)a3;
- (void)_completeCurrentTest;
- (void)_iterateOnCurrentTest;
- (void)_noteScrollingFinishedForComponent:(int64_t)a3;
- (void)_performScrollTest:(id)a3 withIterations:(int64_t)a4 rowsToScroll:(int64_t)a5 inComponent:(int64_t)a6;
- (void)_populateArchivedSubviews:(id)a3;
- (void)_resetSelectionOfTables;
- (void)_selectRow:(int64_t)a3 inComponent:(int64_t)a4 animated:(BOOL)a5 notify:(BOOL)a6;
- (void)_sendCheckedRow:(int64_t)a3 inTableView:(id)a4 checked:(BOOL)a5;
- (void)_sendSelectionChangedForComponent:(int64_t)a3 notify:(BOOL)a4;
- (void)_sendSelectionChangedFromTable:(id)a3 notify:(BOOL)a4;
- (void)_setColumnView:(id)a3 enabled:(BOOL)a4;
- (void)_setDrawsBackground:(BOOL)a3;
- (void)_setEnabled:(BOOL)a3;
- (void)_setHighlightColor:(id)a3;
- (void)_setMagnifierEnabled:(BOOL)a3;
- (void)_setMagnifierLineColor:(id)a3;
- (void)_setMagnifierStyle:(int64_t)a3;
- (void)_setSelectionBarIgnoresInset:(BOOL)a3;
- (void)_setSelectionFeedbackGenerator:(id)a3;
- (void)_setTextColor:(id)a3;
- (void)_setTextShadowColor:(id)a3;
- (void)_setUsesCheckedSelection:(BOOL)a3;
- (void)_setUsesDynamicRowHeight:(BOOL)a3;
- (void)_updateSelectedRows;
- (void)_willPlayClickSound;
- (void)dealloc;
- (void)didMoveToWindow;
- (void)encodeWithCoder:(id)a3;
- (void)layoutSubviews;
- (void)reloadAllComponents;
- (void)reloadAllPickerPieces;
- (void)reloadComponent:(NSInteger)component;
- (void)reloadDataForColumn:(int)a3;
- (void)selectRow:(NSInteger)row inComponent:(NSInteger)component animated:(BOOL)animated;
- (void)selectRow:(int)a3 inColumn:(int)a4 animated:(BOOL)a5;
- (void)setAllowsMultipleSelection:(BOOL)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setBounds:(CGRect)a3;
- (void)setDataSource:(id)dataSource;
- (void)setDelegate:(id)delegate;
- (void)setFrame:(CGRect)a3;
- (void)setNeedsLayout;
- (void)setShowsSelectionIndicator:(BOOL)showsSelectionIndicator;
- (void)setSoundsEnabled:(BOOL)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation UIPickerView

- (BOOL)isAccessibilityElementByDefault
{
  return 0;
}

- (void)setBackgroundColor:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)UIPickerView;
  [(UIView *)&v3 setBackgroundColor:a3];
}

+ (CGSize)sizeThatFits:(CGSize)a3 forTraits:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v6 = a4;
  v7 = +[UIPickerView _styleForIdiom:](UIPickerView, "_styleForIdiom:", [v6 userInterfaceIdiom]);
  objc_msgSend(v7, "sizeThatFits:forTraitCollection:", v6, width, height);
  double v9 = v8;
  double v11 = v10;

  double v12 = v9;
  double v13 = v11;
  result.double height = v13;
  result.double width = v12;
  return result;
}

+ (CGSize)sizeForMainScreenTraitsThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id v6 = +[UIScreen mainScreen];
  v7 = [v6 traitCollection];
  objc_msgSend(a1, "sizeThatFits:forTraits:", v7, width, height);
  double v9 = v8;
  double v11 = v10;

  double v12 = v9;
  double v13 = v11;
  result.double height = v13;
  result.double width = v12;
  return result;
}

+ (CGSize)defaultSizeForTraits:(id)a3
{
  id v3 = a3;
  v4 = +[UIPickerView _styleForIdiom:](UIPickerView, "_styleForIdiom:", [v3 userInterfaceIdiom]);
  [v4 defaultSizeForTraitCollection:v3];
  double v6 = v5;
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.double height = v10;
  result.double width = v9;
  return result;
}

+ (CGSize)defaultSizeForMainScreenTraits
{
  id v3 = +[UIScreen mainScreen];
  v4 = [v3 traitCollection];
  [a1 defaultSizeForTraits:v4];
  double v6 = v5;
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.double height = v10;
  result.double width = v9;
  return result;
}

- (CGSize)defaultSize
{
  int v3 = dyld_program_sdk_at_least();
  v4 = objc_opt_class();
  double v5 = v4;
  if (v3)
  {
    double v6 = [(UIView *)self traitCollection];
    [v5 defaultSizeForTraits:v6];
    double v8 = v7;
    double v10 = v9;

    double v11 = v8;
    double v12 = v10;
  }
  else
  {
    [v4 defaultSizeForMainScreenTraits];
  }
  result.double height = v12;
  result.double width = v11;
  return result;
}

- (void)_setUsesDynamicRowHeight:(BOOL)a3
{
  int v3 = a3;
  int v5 = [(UIPickerView *)self _usesDynamicRowHeight];
  if (v3) {
    int v6 = 0x10000;
  }
  else {
    int v6 = 0;
  }
  self->_pickerViewFlags = ($76755D4DEA27573399A7BF6CD45D6B19)(*(_DWORD *)&self->_pickerViewFlags & 0xFFFEFFFF | v6);
  if (v5 != v3)
  {
    [(UIPickerView *)self reloadAllComponents];
  }
}

- (BOOL)_usesDynamicRowHeight
{
  if (*((unsigned char *)&self->_pickerViewFlags + 2)) {
    return 1;
  }
  if (_UIInternalPreferencesRevisionOnce != -1) {
    dispatch_once(&_UIInternalPreferencesRevisionOnce, &__block_literal_global_5_8);
  }
  int v2 = _UIInternalPreferencesRevisionVar;
  if (_UIInternalPreferencesRevisionVar < 1
    || (int v5 = _UIInternalPreference_PickerViewForceDynamicRowHeight,
        _UIInternalPreferencesRevisionVar == _UIInternalPreference_PickerViewForceDynamicRowHeight))
  {
    BOOL v3 = 0;
  }
  else
  {
    do
    {
      BOOL v3 = v2 < v5;
      if (v2 < v5) {
        break;
      }
      _UIInternalPreferenceSync(v2, &_UIInternalPreference_PickerViewForceDynamicRowHeight, @"PickerViewForceDynamicRowHeight", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool);
      int v5 = _UIInternalPreference_PickerViewForceDynamicRowHeight;
    }
    while (v2 != _UIInternalPreference_PickerViewForceDynamicRowHeight);
  }
  return byte_1E8FD53BC && v3;
}

- (double)_rowHeightForDefaultFont
{
  BOOL v3 = [(UIPickerView *)self _style];
  v4 = [(UIView *)self traitCollection];
  int v5 = [v3 centerCellFontWithTraitCollection:v4];

  CTFontGetLanguageAwareOutsets();
  objc_msgSend(v5, "ascender", 0, 0);
  [v5 descender];
  UICeilToViewScale(self);
  double v7 = v6;

  return v7;
}

- (double)_tableRowHeight
{
  if ([(UIPickerView *)self _usesDynamicRowHeight])
  {
    [(UIPickerView *)self _rowHeightForDefaultFont];
  }
  else
  {
    v4 = [(UIPickerView *)self _style];
    [(UIView *)self bounds];
    objc_msgSend(v4, "defaultRowHeightForSize:", v5, v6);
    double v8 = v7;

    return v8;
  }
  return result;
}

- (void)setSoundsEnabled:(BOOL)a3
{
  if (a3) {
    int v3 = 0;
  }
  else {
    int v3 = 4096;
  }
  self->_pickerViewFlags = ($76755D4DEA27573399A7BF6CD45D6B19)(*(_DWORD *)&self->_pickerViewFlags & 0xFFFFEFFF | v3);
}

- (BOOL)_soundsEnabled
{
  return (*((unsigned char *)&self->_pickerViewFlags + 1) & 0x10) == 0;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1 && (dyld_program_sdk_at_least() & 1) == 0)
  {
    +[UIView _performSystemAppearanceModifications:&__block_literal_global_442];
  }
}

void __26__UIPickerView_initialize__block_invoke()
{
  v0 = +[UITraitCollection traitCollectionWithUserInterfaceStyle:1];
  id v7 = +[UIView appearanceForTraitCollection:v0];

  v1 = +[UITraitCollection traitCollectionWithUserInterfaceStyle:2];
  int v2 = +[UIView appearanceForTraitCollection:v1];

  int v3 = +[UIColor blackColor];
  [v7 _setTextColor:v3];

  v4 = +[UIColor colorWithWhite:0.0 alpha:0.198];
  [v7 _setMagnifierLineColor:v4];

  double v5 = +[UIColor whiteColor];
  [v2 _setTextColor:v5];

  double v6 = +[UIColor colorWithWhite:1.0 alpha:0.198];
  [v2 _setMagnifierLineColor:v6];
}

- (UIPickerView)init
{
  return -[UIPickerView initWithFrame:](self, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
}

- (UIPickerView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (!dyld_program_sdk_at_least()
    || (*MEMORY[0x1E4F1DB30] == width ? (BOOL v8 = *(double *)(MEMORY[0x1E4F1DB30] + 8) == height) : (BOOL v8 = 0), v8))
  {
    objc_msgSend((id)objc_opt_class(), "sizeForMainScreenTraitsThatFits:", width, height);
    double width = v9;
    double height = v10;
  }
  v14.receiver = self;
  v14.super_class = (Class)UIPickerView;
  double v11 = -[UIView initWithFrame:](&v14, sel_initWithFrame_, x, y, width, height);
  double v12 = v11;
  if (v11)
  {
    *(_DWORD *)&v11->_pickerViewFlags |= 0x800u;
    _UIPickerViewCommonInit(v11);
  }
  return v12;
}

- (UIPickerView)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)UIPickerView;
  double v5 = [(UIView *)&v11 initWithCoder:v4];
  if (v5)
  {
    double v6 = [v4 decodeObjectForKey:@"UIDelegate"];
    objc_storeWeak((id *)&v5->_delegate, v6);

    if ([v4 decodeBoolForKey:@"UIShowsSelectionBar"]) {
      int v7 = 512;
    }
    else {
      int v7 = 0;
    }
    v5->_pickerViewFlags = ($76755D4DEA27573399A7BF6CD45D6B19)(*(_DWORD *)&v5->_pickerViewFlags & 0xFFFFFDFF | v7);
    if ([v4 decodeBoolForKey:@"UIAllowSelectingCells"]) {
      int v8 = 2048;
    }
    else {
      int v8 = 0;
    }
    v5->_pickerViewFlags = ($76755D4DEA27573399A7BF6CD45D6B19)(*(_DWORD *)&v5->_pickerViewFlags & 0xFFFFF7FF | v8);
    if ([v4 containsValueForKey:@"UISkipsBackground"])
    {
      if ([v4 decodeBoolForKey:@"UISkipsBackground"]) {
        int v9 = 0x4000;
      }
      else {
        int v9 = 0;
      }
      v5->_pickerViewFlags = ($76755D4DEA27573399A7BF6CD45D6B19)(*(_DWORD *)&v5->_pickerViewFlags & 0xFFFFBFFF | v9);
    }
    _UIPickerViewCommonInit(v5);
  }

  return v5;
}

- (void)_populateArchivedSubviews:(id)a3
{
  v9[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)UIPickerView;
  [(UIView *)&v8 _populateArchivedSubviews:v4];
  v9[0] = self->_foregroundView;
  v9[1] = self->_topLineOrFillView;
  double v5 = self->_bottomLineView;
  uint64_t v6 = 0;
  v9[2] = v5;
  do
  {
    if (v9[v6]) {
      objc_msgSend(v4, "removeObject:");
    }
    ++v6;
  }
  while (v6 != 3);
  for (uint64_t i = 2; i != -1; --i)
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)UIPickerView;
  [(UIView *)&v7 encodeWithCoder:v4];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained) {
    [v4 encodeObject:WeakRetained forKey:@"UIDelegate"];
  }
  $76755D4DEA27573399A7BF6CD45D6B19 pickerViewFlags = self->_pickerViewFlags;
  if ((*(_WORD *)&pickerViewFlags & 0x200) == 0)
  {
    if ((*(_WORD *)&pickerViewFlags & 0x800) == 0) {
      goto LABEL_5;
    }
LABEL_9:
    [v4 encodeBool:1 forKey:@"UIAllowSelectingCells"];
    if ((*(_DWORD *)&self->_pickerViewFlags & 0x4000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  [v4 encodeBool:1 forKey:@"UIShowsSelectionBar"];
  $76755D4DEA27573399A7BF6CD45D6B19 pickerViewFlags = self->_pickerViewFlags;
  if ((*(_WORD *)&pickerViewFlags & 0x800) != 0) {
    goto LABEL_9;
  }
LABEL_5:
  if ((*(_WORD *)&pickerViewFlags & 0x4000) != 0) {
LABEL_6:
  }
    [v4 encodeBool:1 forKey:@"UISkipsBackground"];
LABEL_7:
}

- (void)dealloc
{
  int v3 = +[UIDevice currentDevice];
  [v3 _unregisterForSystemSounds:self];

  v4.receiver = self;
  v4.super_class = (Class)UIPickerView;
  [(UIView *)&v4 dealloc];
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  if ((UIViewIgnoresTouchEvents(self) & 1) == 0
    && [(UIPickerView *)self _enabled]
    && ([(UIView *)self bounds], v37.x = x, v37.double y = y, CGRectContainsPoint(v38, v37)))
  {
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    objc_super v8 = self->_tables;
    uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v29 objects:v34 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v30;
      uint64_t v23 = *(void *)v30;
      v24 = v8;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v30 != v11) {
            objc_enumerationMutation(v8);
          }
          double v13 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          long long v25 = 0u;
          long long v26 = 0u;
          long long v27 = 0u;
          long long v28 = 0u;
          objc_msgSend(v13, "_allVisibleCells", v23);
          id v14 = (id)objc_claimAutoreleasedReturnValue();
          uint64_t v15 = [v14 countByEnumeratingWithState:&v25 objects:v33 count:16];
          if (v15)
          {
            uint64_t v16 = v15;
            uint64_t v17 = *(void *)v26;
            while (2)
            {
              for (uint64_t j = 0; j != v16; ++j)
              {
                if (*(void *)v26 != v17) {
                  objc_enumerationMutation(v14);
                }
                v19 = *(void **)(*((void *)&v25 + 1) + 8 * j);
                objc_msgSend(v19, "convertPoint:fromView:", self, x, y);
                if (objc_msgSend(v19, "pointInside:withEvent:", v7)
                  && ![v19 isHidden])
                {
                  id v20 = v19;
                  objc_super v8 = v24;
                  goto LABEL_27;
                }
              }
              uint64_t v16 = [v14 countByEnumeratingWithState:&v25 objects:v33 count:16];
              if (v16) {
                continue;
              }
              break;
            }
          }

          if (objc_msgSend(v13, "_pointLiesWithinEffectiveTableBounds:", x, y))
          {
            v22 = objc_msgSend(v13, "_visibleCellClosestToPoint:inView:", self, x, y);
            objc_super v8 = v24;
            if (v22)
            {
              id v14 = v22;
              id v20 = v14;
            }
            else
            {
              id v20 = [v13 _preferredTable];
              id v14 = 0;
            }
LABEL_27:

            goto LABEL_29;
          }
          uint64_t v11 = v23;
          objc_super v8 = v24;
        }
        uint64_t v10 = [(NSMutableArray *)v24 countByEnumeratingWithState:&v29 objects:v34 count:16];
        id v20 = 0;
        if (v10) {
          continue;
        }
        break;
      }
    }
    else
    {
      id v20 = 0;
    }
LABEL_29:
  }
  else
  {
    id v20 = 0;
  }

  return v20;
}

- (void)setNeedsLayout
{
  *(_DWORD *)&self->_pickerViewFlags |= 1u;
  v2.receiver = self;
  v2.super_class = (Class)UIPickerView;
  [(UIView *)&v2 setNeedsLayout];
}

- (void)_updateSelectedRows
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0 && [(UIPickerView *)self numberOfComponents] >= 1)
  {
    NSInteger v5 = 0;
    do
    {
      [(UIPickerView *)self _selectRow:[(UIPickerView *)self selectedRowInComponent:v5] inComponent:v5 animated:0 notify:0];
      ++v5;
    }
    while (v5 < [(UIPickerView *)self numberOfComponents]);
  }
}

- (void)didMoveToWindow
{
  v4.receiver = self;
  v4.super_class = (Class)UIPickerView;
  [(UIView *)&v4 didMoveToWindow];
  int v3 = [(UIView *)self window];

  if (v3) {
    [(UIPickerView *)self _updateSelectedRows];
  }
}

- (void)_setColumnView:(id)a3 enabled:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  id v7 = v5;
  if (v4) {
    double v6 = 1.0;
  }
  else {
    double v6 = 0.4;
  }
  [v5 setUserInteractionEnabled:v4];
  [v7 setAlpha:v6];
}

- (void)_setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if ([(UIPickerView *)self _enabled] != a3)
  {
    self->_enabled = v3;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v5 = self->_tables;
    uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v11;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v5);
          }
          -[UIPickerView _setColumnView:enabled:](self, "_setColumnView:enabled:", *(void *)(*((void *)&v10 + 1) + 8 * v9++), v3, (void)v10);
        }
        while (v7 != v9);
        uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v7);
    }
  }
}

- (void)reloadAllComponents
{
  uint64_t v3 = [(NSMutableArray *)self->_tables count];
  int64_t v4 = [(UIPickerView *)self _delegateNumberOfComponents];
  if (v3) {
    BOOL v5 = v3 == v4;
  }
  else {
    BOOL v5 = 0;
  }
  if (v5)
  {
    if (v3 >= 1)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        uint64_t v7 = [(NSMutableArray *)self->_tables objectAtIndex:i];
        [v7 reloadData];
      }
    }
  }
  else
  {
    [(UIPickerView *)self setNeedsLayout];
  }
}

- (void)reloadDataForColumn:(int)a3
{
}

- (void)reloadComponent:(NSInteger)component
{
  if ((*(unsigned char *)&self->_pickerViewFlags & 1) == 0)
  {
    id v3 = [(NSMutableArray *)self->_tables objectAtIndex:component];
    [v3 reloadData];
  }
}

- (id)_selectionBarSuffix
{
  if ((*(_DWORD *)&self->_pickerViewFlags & 0x200) != 0) {
    return @"-Bar";
  }
  else {
    return &stru_1ED0E84C0;
  }
}

- (CGRect)_selectionBarRectForHeight:(double)a3
{
  [(UIView *)self bounds];
  double v6 = v5;
  UIRoundToViewScale(self);
  double v8 = v7;
  double v9 = 0.0;
  double v10 = v6;
  double v11 = a3;
  result.size.double height = v11;
  result.size.double width = v10;
  result.origin.double y = v8;
  result.origin.double x = v9;
  return result;
}

- (double)_selectionBarSideInset
{
  if ((*((unsigned char *)&self->_pickerViewFlags + 2) & 2) != 0) {
    return 0.0;
  }
  objc_super v2 = [(UIPickerView *)self _style];
  [v2 selectionBarSideInset];
  double v4 = v3;

  return v4;
}

- (BOOL)_selectionBarIgnoresInset
{
  return (*((unsigned __int8 *)&self->_pickerViewFlags + 2) >> 1) & 1;
}

- (void)_setSelectionBarIgnoresInset:(BOOL)a3
{
  $76755D4DEA27573399A7BF6CD45D6B19 pickerViewFlags = self->_pickerViewFlags;
  if (((((*(_DWORD *)&pickerViewFlags & 0x20000) == 0) ^ a3) & 1) == 0)
  {
    if (a3) {
      int v4 = 0x20000;
    }
    else {
      int v4 = 0;
    }
    self->_$76755D4DEA27573399A7BF6CD45D6B19 pickerViewFlags = ($76755D4DEA27573399A7BF6CD45D6B19)(*(_DWORD *)&pickerViewFlags & 0xFFFDFFFF | v4);
    [(UIPickerView *)self setNeedsLayout];
  }
}

- (BOOL)_contentHuggingDefault_isUsuallyFixedHeight
{
  return 1;
}

- (BOOL)_contentHuggingDefault_isUsuallyFixedWidth
{
  return 1;
}

- (CGSize)_sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  int v6 = dyld_program_sdk_at_least();
  double v7 = objc_opt_class();
  double v8 = v7;
  if (v6)
  {
    double v9 = [(UIView *)self traitCollection];
    objc_msgSend(v8, "sizeThatFits:forTraits:", v9, width, height);
    double v11 = v10;
    double v13 = v12;

    double v14 = v11;
    double v15 = v13;
  }
  else
  {
    objc_msgSend(v7, "sizeForMainScreenTraitsThatFits:", width, height);
  }
  result.double height = v15;
  result.double width = v14;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  if (dyld_program_sdk_at_least())
  {
    [(UIView *)self invalidateIntrinsicContentSize];
  }
}

- (void)_sendCheckedRow:(int64_t)a3 inTableView:(id)a4 checked:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(WeakRetained, "pickerView:row:column:checked:", self, a3, -[UIPickerView columnForTableView:](self, "columnForTableView:", v9), v5);
  }
}

- (double)scrollAnimationDuration
{
  return 0.3;
}

- (int64_t)_delegateNumberOfComponents
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  int v4 = WeakRetained;
  if (WeakRetained)
  {
    int64_t v5 = [WeakRetained numberOfComponentsInPickerView:self];
  }
  else if ((*(unsigned char *)&self->_pickerViewFlags & 2) != 0)
  {
    id v6 = objc_loadWeakRetained((id *)&self->_delegate);
    int64_t v5 = [v6 numberOfComponentsInPickerView:self];
  }
  else
  {
    int64_t v5 = 1;
  }

  return v5;
}

- (int64_t)_delegateNumberOfRowsInComponent:(int64_t)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  id v6 = WeakRetained;
  if (WeakRetained)
  {
    int64_t v7 = [WeakRetained pickerView:self numberOfRowsInComponent:a3];
  }
  else if ((*(unsigned char *)&self->_pickerViewFlags & 4) != 0)
  {
    id v8 = objc_loadWeakRetained((id *)&self->_delegate);
    int64_t v7 = [v8 pickerView:self numberOfRowsInComponent:a3];
  }
  else
  {
    int64_t v7 = 0;
  }

  return v7;
}

- (id)_delegateTitleForRow:(int64_t)a3 forComponent:(int64_t)a4
{
  if ((*(unsigned char *)&self->_pickerViewFlags & 0x20) != 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    int v4 = [WeakRetained pickerView:self titleForRow:a3 forComponent:a4];
  }
  else
  {
    int v4 = 0;
  }
  return v4;
}

- (id)_delegateAttributedTitleForRow:(int64_t)a3 forComponent:(int64_t)a4
{
  if ((*(unsigned char *)&self->_pickerViewFlags & 0x40) != 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    int v4 = [WeakRetained pickerView:self attributedTitleForRow:a3 forComponent:a4];
  }
  else
  {
    int v4 = 0;
  }
  return v4;
}

- (double)_delegateWidthForComponent:(int64_t)a3 ofCount:(int)a4 withSizeLeft:(double)a5
{
  if ((*(unsigned char *)&self->_pickerViewFlags & 0x80) == 0) {
    return round(a5 / (double)(a4 - a3));
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained pickerView:self widthForComponent:a3];
  double v10 = v9;

  return v10;
}

- (double)_delegateRowHeightForComponent:(int64_t)a3
{
  if (*((unsigned char *)&self->_pickerViewFlags + 1))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained pickerView:self rowHeightForComponent:a3];
    double v8 = v7;

    return v8;
  }
  else
  {
    [(UIPickerView *)self _tableRowHeight];
  }
  return result;
}

- (void)_addMagnifierForRowHeight:(double)a3
{
  if ([(UIPickerView *)self _magnifierEnabled])
  {
    if ([(UIPickerView *)self _magnifierStyle])
    {
      [(UIPickerView *)self _addHighlightRectForRowHeight:a3];
    }
    else
    {
      [(UIPickerView *)self _addMagnifierLinesForRowHeight:a3];
    }
  }
}

- (void)_addHighlightRectForRowHeight:(double)a3
{
  [(UIView *)self bounds];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  double v13 = [(UIPickerView *)self _style];
  [v13 verticalPaddingForCenterHighlightView];
  double v15 = v14 + a3;

  v31.origin.double x = v6;
  v31.origin.double y = v8;
  v31.size.double width = v10;
  v31.size.double height = v12;
  CGRectGetMidY(v31);
  UIRoundToViewScale(self);
  double v17 = v16;
  double v18 = 0.0;
  if ((*((unsigned char *)&self->_pickerViewFlags + 2) & 2) == 0)
  {
    v19 = [(UIPickerView *)self _style];
    [v19 horizontalPaddingForCenterHighlightView];
    double v18 = v20;
  }
  v32.origin.double x = v6;
  v32.origin.double y = v8;
  v32.size.double width = v10;
  v32.size.double height = v12;
  double v21 = CGRectGetWidth(v32) - (v18 + v18);
  topLineOrFillView = self->_topLineOrFillView;
  if (!topLineOrFillView)
  {
    uint64_t v23 = [(UIPickerView *)self _style];
    v24 = [v23 createCenterHighlightView];
    long long v25 = self->_topLineOrFillView;
    self->_topLineOrFillView = v24;

    topLineOrFillView = self->_topLineOrFillView;
  }
  -[UIView setFrame:](topLineOrFillView, "setFrame:", v18, v17, v21, v15);
  if (self->_topLineOrFillView)
  {
    long long v26 = [(UIPickerView *)self _style];
    char v27 = [v26 highlightViewIsOverlay];

    if (v27)
    {
      long long v28 = self->_topLineOrFillView;
      [(UIView *)self addSubview:v28];
    }
    else
    {
      id v29 = [(UIPickerView *)self _contentView];
      [v29 addSubview:self->_topLineOrFillView];
    }
  }
}

- (void)_addMagnifierLinesForRowHeight:(double)a3
{
  UIRoundToViewScale(self);
  double v5 = v4;
  [(UIView *)self bounds];
  CGFloat v6 = [(UIPickerView *)self _style];
  [v6 verticalPaddingForCenterHighlightView];
  double v8 = v7;

  UIRoundToViewScale(self);
  double v10 = v9;
  UIRoundToViewScale(self);
  double v12 = v11;
  UIRoundToViewScale(self);
  double v14 = v13;
  [(UIView *)self bounds];
  double v16 = v15;
  [(UIView *)self bounds];
  double v18 = v17;
  if (!self->_topLineOrFillView)
  {
    v19 = objc_alloc_init(UIView);
    topLineOrFillView = self->_topLineOrFillView;
    self->_topLineOrFillView = v19;

    [(UIView *)self->_topLineOrFillView setBackgroundColor:self->_magnifierLineColor];
  }
  if (!self->_bottomLineView)
  {
    double v21 = objc_alloc_init(UIView);
    bottomLineView = self->_bottomLineView;
    self->_bottomLineView = v21;

    [(UIView *)self->_bottomLineView setBackgroundColor:self->_magnifierLineColor];
  }
  -[UIView setFrame:](self->_topLineOrFillView, "setFrame:", 0.0, v10 - v12 - v8 * 0.5, v16, v5);
  -[UIView setFrame:](self->_bottomLineView, "setFrame:", 0.0, v8 * 0.5 + v14, v18, v5);
  [(UIView *)self addSubview:self->_topLineOrFillView];
  [(UIView *)self bringSubviewToFront:self->_topLineOrFillView];
  [(UIView *)self addSubview:self->_bottomLineView];
  uint64_t v23 = self->_bottomLineView;
  [(UIView *)self bringSubviewToFront:v23];
}

- (void)_setMagnifierLineColor:(id)a3
{
  objc_storeStrong((id *)&self->_magnifierLineColor, a3);
  id v5 = a3;
  [(UIView *)self->_topLineOrFillView setBackgroundColor:v5];
  [(UIView *)self->_bottomLineView setBackgroundColor:v5];
}

- (id)_createColumnWithTableFrame:(CGRect)a3 rowHeight:(double)a4 paddingAroundWheels:(double)a5
{
  double width = a3.size.width;
  double height = a3.size.height;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v9 = [(UIPickerView *)self _style];
  [v9 verticalPaddingForCenterHighlightView];
  double v11 = v10;

  double v12 = 0.0;
  if ((dyld_program_sdk_at_least() & 1) == 0 && dyld_program_sdk_at_least())
  {
    [(UIPickerView *)self _selectionBarSideInset];
    double v12 = v13;
  }
  [(UIView *)self bounds];
  double v15 = v14;
  double v17 = v12 + v16;
  double v19 = v18 - (v12 + v12);
  double v21 = v20 + 0.0;
  v22 = [UIPickerColumnView alloc];
  [(UIPickerView *)self _perspectiveTransform];
  uint64_t v23 = -[UIPickerColumnView initWithFrame:tableFrame:middleBarHeight:rowHeight:paddingAroundWheels:pickerView:transform:](v22, "initWithFrame:tableFrame:middleBarHeight:rowHeight:paddingAroundWheels:pickerView:transform:", self, v28, v17, v21, v19, v15, x, y, width, height, v11 + a4, *(void *)&a4, *(void *)&a5);
  [(NSMutableArray *)self->_tables addObject:v23];
  [(UIView *)v23 setAutoresizingMask:26];
  [(UIPickerColumnView *)v23 _setTextColor:self->_textColor];
  [(UIPickerView *)self _setColumnView:v23 enabled:[(UIPickerView *)self _enabled]];
  return v23;
}

- (id)_createTableWithFrame:(CGRect)a3 forComponent:(int64_t)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v10 = [UIPickerTableView alloc];
  double v11 = -[UIPickerTableView initWithFrame:style:visibleRect:](v10, "initWithFrame:style:visibleRect:", 0, x, y, width, height, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(NSMutableArray *)self->_tables addObject:v11];
  [(UITableView *)v11 setDataSource:self];
  [(UIPickerView *)self _delegateRowHeightForComponent:a4];
  -[UITableView setRowHeight:](v11, "setRowHeight:");
  [(UITableView *)v11 setEstimatedRowHeight:0.0];
  [(UIScrollView *)v11 setShowsVerticalScrollIndicator:0];
  [(UIView *)v11 setAutoresizingMask:26];
  return v11;
}

- (CGSize)rowSizeForComponent:(NSInteger)component
{
  if (*(unsigned char *)&self->_pickerViewFlags) {
    [(UIPickerView *)self layoutSubviews];
  }
  id v5 = [(UIPickerView *)self tableViewForColumn:component];
  if ([v5 numberOfRowsInSection:0] < 1)
  {
    double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v10 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }
  else
  {
    CGFloat v6 = [MEMORY[0x1E4F28D58] indexPathForRow:0 inSection:0];
    [v5 rectForRowAtIndexPath:v6];
    double v8 = v7;
    double v10 = v9;
  }
  double v11 = v8;
  double v12 = v10;
  result.double height = v12;
  result.double width = v11;
  return result;
}

- (NSInteger)numberOfRowsInComponent:(NSInteger)component
{
  if (*(unsigned char *)&self->_pickerViewFlags) {
    [(UIPickerView *)self layoutSubviews];
  }
  id v5 = [(UIPickerView *)self tableViewForColumn:component];
  NSInteger v6 = [v5 numberOfRowsInSection:0];

  return v6;
}

- (NSInteger)numberOfComponents
{
  if (*(unsigned char *)&self->_pickerViewFlags) {
    return [(UIPickerView *)self _delegateNumberOfComponents];
  }
  else {
    return [(NSMutableArray *)self->_tables count];
  }
}

- (UIView)viewForRow:(NSInteger)row forComponent:(NSInteger)component
{
  $76755D4DEA27573399A7BF6CD45D6B19 pickerViewFlags = self->_pickerViewFlags;
  if (*(unsigned char *)&pickerViewFlags)
  {
    [(UIPickerView *)self layoutSubviews];
    $76755D4DEA27573399A7BF6CD45D6B19 pickerViewFlags = self->_pickerViewFlags;
  }
  if ((*(unsigned char *)&pickerViewFlags & 0x10) != 0)
  {
    double v9 = [(UIPickerView *)self tableViewForColumn:component];
    double v10 = [MEMORY[0x1E4F28D58] indexPathForRow:row inSection:0];
    double v11 = [v9 cellForRowAtIndexPath:v10];

    if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v12 = [v11 wrappedView];
    }
    else
    {
      id v12 = v11;
    }
    double v8 = v12;
  }
  else
  {
    double v8 = 0;
  }
  return (UIView *)v8;
}

- (void)reloadAllPickerPieces
{
  if (self->_tables) {
    [(UIPickerView *)self setNeedsLayout];
  }
}

- (double)_wheelShift
{
  return 0.0;
}

- (id)_contentView
{
  return self->_foregroundView;
}

- (void)layoutSubviews
{
  $76755D4DEA27573399A7BF6CD45D6B19 pickerViewFlags = self->_pickerViewFlags;
  if ((*(_WORD *)&pickerViewFlags & 0x8000) != 0)
  {
    $76755D4DEA27573399A7BF6CD45D6B19 pickerViewFlags = ($76755D4DEA27573399A7BF6CD45D6B19)(*(_DWORD *)&pickerViewFlags & 0xFFFFFFFE);
    self->_$76755D4DEA27573399A7BF6CD45D6B19 pickerViewFlags = pickerViewFlags;
  }
  if (*(unsigned char *)&pickerViewFlags)
  {
    self->_$76755D4DEA27573399A7BF6CD45D6B19 pickerViewFlags = ($76755D4DEA27573399A7BF6CD45D6B19)(*(_DWORD *)&pickerViewFlags | 0x8000);
    double v4 = [(UIPickerView *)self _style];
    [v4 paddingBetweenWheels];
    uint64_t v6 = v5;
    [v4 paddingAroundWheels];
    uint64_t v8 = v7;
    [v4 horizontalPaddingForContents];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __30__UIPickerView_layoutSubviews__block_invoke;
    v11[3] = &unk_1E52DA260;
    v11[4] = self;
    v11[5] = v9;
    v11[6] = v8;
    v11[7] = v6;
    +[UIView performWithoutAnimation:v11];
    v10.receiver = self;
    v10.super_class = (Class)UIPickerView;
    [(UIView *)&v10 layoutSubviews];
    *(_DWORD *)&self->_pickerViewFlags &= 0xFFFF7FFE;
  }
}

void __30__UIPickerView_layoutSubviews__block_invoke(uint64_t a1)
{
  uint64_t v178 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  unsigned int v156 = *(_DWORD *)(v2 + 472);
  *(_DWORD *)(v2 + 472) = v156 | 0x1000;
  *(_DWORD *)(*(void *)(a1 + 32) + 472) &= ~1u;
  [*(id *)(a1 + 32) bounds];
  double v4 = v3;
  double v157 = v5;
  double v7 = v6;
  double v9 = v8;
  objc_super v10 = *(void **)(a1 + 32);
  double v11 = (void *)v10[55];
  [v10 bounds];
  objc_msgSend(v11, "setFrame:");
  [*(id *)(*(void *)(a1 + 32) + 440) setContentScaleFactor:4.0];
  [*(id *)(a1 + 32) insertSubview:*(void *)(*(void *)(a1 + 32) + 440) atIndex:0];
  [*(id *)(*(void *)(a1 + 32) + 440) setClipsToBounds:0];
  [*(id *)(a1 + 32) bounds];
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 448), "setFrame:");
  id v12 = *(void **)(*(void *)(a1 + 32) + 408);
  if (v12)
  {
    unint64_t v13 = [v12 count];
    uint64_t v14 = v13;
    if (v13 < 0x11) {
      double v15 = v177;
    }
    else {
      double v15 = malloc_type_malloc(8 * v13, 0x100004000313F17uLL);
    }
    if (v14 >= 1)
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        double v20 = [*(id *)(a1 + 32) tableViewForColumn:i];
        *(void *)&v15[8 * i] = [v20 selectionBarRow];
      }
    }
    long long v173 = 0u;
    long long v174 = 0u;
    long long v171 = 0u;
    long long v172 = 0u;
    id v21 = *(id *)(*(void *)(a1 + 32) + 408);
    uint64_t v22 = [v21 countByEnumeratingWithState:&v171 objects:v176 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v172;
      do
      {
        for (uint64_t j = 0; j != v23; ++j)
        {
          if (*(void *)v172 != v24) {
            objc_enumerationMutation(v21);
          }
          long long v26 = *(void **)(*((void *)&v171 + 1) + 8 * j);
          [v26 markAsNoLongerInUse];
          [v26 removeFromSuperview];
        }
        uint64_t v23 = [v21 countByEnumeratingWithState:&v171 objects:v176 count:16];
      }
      while (v23);
    }

    [*(id *)(*(void *)(a1 + 32) + 408) removeAllObjects];
  }
  else
  {
    uint64_t v16 = objc_opt_new();
    uint64_t v17 = *(void *)(a1 + 32);
    double v18 = *(void **)(v17 + 408);
    *(void *)(v17 + 408) = v16;

    double v15 = 0;
    uint64_t v14 = 0;
  }
  uint64_t v27 = [*(id *)(a1 + 32) _delegateNumberOfComponents];
  double v28 = *(double *)(a1 + 40);
  double v29 = v7 - (v28 + v28);
  long long v30 = *(_DWORD **)(a1 + 32);
  double v31 = *(double *)(a1 + 48) + *(double *)(a1 + 48);
  int v162 = v30[118];
  if ((v162 & 0x80) != 0)
  {
    double v32 = 0.0;
    if (v27 >= 1)
    {
      for (uint64_t k = 0; k != v27; ++k)
      {
        if (k) {
          double v31 = v31 + *(double *)(a1 + 56);
        }
        [*(id *)(a1 + 32) _delegateWidthForComponent:k ofCount:v27 withSizeLeft:v29];
        double v31 = v31 + v34;
      }
      long long v30 = *(_DWORD **)(a1 + 32);
    }
  }
  else
  {
    double v32 = floor((v29 - v31 - *(double *)(a1 + 56) * (double)(v27 - 1)) / (double)v27);
    double v31 = v29;
  }
  [v30 _wheelShift];
  double v36 = v35;
  [*(id *)(a1 + 32) _selectionBarSideInset];
  double v38 = v37;
  double v39 = ceil((v29 - v31) * 0.5);
  if (dyld_program_sdk_at_least())
  {
    if (v39 < -v38) {
      double v39 = -v38;
    }
  }
  else if (v39 < 0.0)
  {
    double v39 = 0.0;
  }
  double v40 = v4 + v28;
  if (v27 < 0)
  {
    double v42 = 0.0;
  }
  else
  {
    uint64_t v41 = 0;
    double v42 = 0.0;
    do
    {
      [*(id *)(a1 + 32) _delegateRowHeightForComponent:v41];
      if (v43 > v42) {
        double v42 = v43;
      }
      ++v41;
    }
    while (v27 + 1 != v41);
  }
  double v44 = v40 + v39;
  unsigned int v45 = *(_DWORD *)(*(void *)(a1 + 32) + 112);
  __int16 v46 = dyld_program_sdk_at_least();
  unsigned int v47 = v45;
  v155 = v15;
  if ((v45 & 0x80000) != 0)
  {
    [*(id *)(a1 + 32) _delegateWidthForComponent:0 ofCount:v27 withSizeLeft:v29];
    double v49 = floor(v48);
    int v50 = dyld_program_sdk_at_least();
    double v51 = v29;
    if (v50) {
      [*(id *)(a1 + 32) bounds];
    }
    double v44 = v51 - v44 - v49;
    if ((v46 & 1) == 0) {
      double v44 = v44 - *(double *)(a1 + 56);
    }
  }
  uint64_t v154 = v14;
  v52 = [*(id *)(a1 + 32) _style];
  char v53 = [v52 highlightViewIsOverlay];

  if ((v53 & 1) == 0) {
    [*(id *)(a1 + 32) _addMagnifierForRowHeight:v42];
  }
  unsigned int v54 = v45;
  if ((v27 & 0x8000000000000000) == 0 && v27)
  {
    uint64_t v55 = 0;
    int v56 = *(_DWORD *)&v46 & (v45 >> 19);
    double v57 = v9 + 75.0;
    double v58 = *(double *)(a1 + 48);
    double v59 = v29 - v58;
    double v60 = v36 + v58;
    if (v56) {
      double v60 = -v60;
    }
    double v61 = v44 + v60;
    uint64_t v62 = v27 - 1;
    do
    {
      if ((v162 & 0x80) != 0)
      {
        [*(id *)(a1 + 32) _delegateWidthForComponent:v55 ofCount:v27 withSizeLeft:v59];
        double v32 = floor(v63);
      }
      if ((v54 & 0x80000) != 0)
      {
        double v64 = v32;
        if (v62 != v55)
        {
          [*(id *)(a1 + 32) _delegateWidthForComponent:v55 + 1 ofCount:v27 withSizeLeft:v59 - v32];
          double v64 = floor(v65);
        }
        double v66 = v61 - v64;
      }
      else
      {
        double v66 = v61 + v32;
      }
      double v67 = v59 - v32;
      v68 = objc_msgSend(*(id *)(a1 + 32), "_createColumnWithTableFrame:rowHeight:paddingAroundWheels:", v61, v157 + -37.5, v32, v57, v42, *(double *)(a1 + 48));
      [v68 setAllowsMultipleSelection:(*(_DWORD *)(*(void *)(a1 + 32) + 472) >> 10) & 1];
      v69 = [*(id *)(a1 + 32) _contentView];
      [v69 addSubview:v68];

      uint64_t v70 = v55 + 1;
      uint64_t v71 = 56;
      if (v62 == v55) {
        uint64_t v71 = 48;
      }
      double v72 = *(double *)(a1 + v71);
      double v73 = v36 + v72;
      if (v56) {
        double v73 = -(v36 + v72);
      }
      double v61 = v66 + v73;
      double v59 = v67 - v72;
      ++v55;
      unsigned int v54 = v47;
    }
    while (v27 != v70);
  }
  if ([*(id *)(*(void *)(a1 + 32) + 408) count])
  {
    [*(id *)(a1 + 32) bounds];
    CGFloat v75 = v74;
    CGFloat v77 = v76;
    double v79 = v78;
    CGFloat v81 = v80;
    uint64_t v82 = [*(id *)(*(void *)(a1 + 32) + 408) count];
    uint64_t v83 = v82 - 2;
    if (v82 == 2)
    {
      v92 = *(void **)(*(void *)(a1 + 32) + 408);
      CGFloat rect = v79;
      CGFloat v147 = v75;
      CGFloat v149 = v77;
      if ((v54 & 0x80000) != 0)
      {
        v85 = [v92 lastObject];
        [*(id *)(*(void *)(a1 + 32) + 408) firstObject];
      }
      else
      {
        v85 = [v92 firstObject];
        [*(id *)(*(void *)(a1 + 32) + 408) lastObject];
      v94 = };
      [v85 _tableFrame];
      CGFloat v96 = v95;
      CGFloat v98 = v97;
      CGFloat v100 = v99;
      CGFloat v102 = v101;
      [v94 _tableFrame];
      CGFloat y = v183.origin.y;
      CGFloat x = v183.origin.x;
      CGFloat width = v183.size.width;
      CGFloat height = v183.size.height;
      double MinX = CGRectGetMinX(v183);
      v184.origin.CGFloat x = v96;
      v184.origin.CGFloat y = v98;
      v184.size.CGFloat width = v100;
      v184.size.CGFloat height = v102;
      double v105 = (MinX - CGRectGetMaxX(v184)) * 0.5;
      v185.origin.CGFloat x = v96;
      v185.origin.CGFloat y = v98;
      v185.size.CGFloat width = v100;
      v185.size.CGFloat height = v102;
      double v106 = CGRectGetMinX(v185);
      v186.origin.CGFloat x = v147;
      v186.origin.CGFloat y = v149;
      v186.size.CGFloat width = rect;
      v186.size.CGFloat height = v81;
      [v85 setLeftHitTestExtension:v106 - CGRectGetMinX(v186)];
      [v85 setRightHitTestExtension:v105];
      [v94 setLeftHitTestExtension:v105];
      v187.origin.CGFloat x = v147;
      v187.origin.CGFloat y = v149;
      v187.size.CGFloat width = rect;
      v187.size.CGFloat height = v81;
      double MaxX = CGRectGetMaxX(v187);
      CGFloat v109 = y;
      CGFloat v108 = x;
      CGFloat v110 = width;
      CGFloat v111 = height;
    }
    else
    {
      uint64_t v84 = v82;
      if (v82 == 1)
      {
        v85 = [*(id *)(*(void *)(a1 + 32) + 408) firstObject];
        [v85 _tableFrame];
        CGFloat v158 = v179.size.width;
        CGFloat v163 = v179.origin.x;
        CGFloat v86 = v179.origin.y;
        CGFloat v87 = v179.size.height;
        CGFloat v88 = v75;
        CGFloat v89 = v79;
        double v90 = CGRectGetMinX(v179);
        v180.origin.CGFloat x = v88;
        v180.origin.CGFloat y = v77;
        v180.size.CGFloat width = v89;
        v180.size.CGFloat height = v81;
        [v85 setLeftHitTestExtension:v90 - CGRectGetMinX(v180)];
        v181.origin.CGFloat x = v88;
        v181.origin.CGFloat y = v77;
        v181.size.CGFloat width = v89;
        v181.size.CGFloat height = v81;
        double v91 = CGRectGetMaxX(v181);
        v182.size.CGFloat width = v158;
        v182.origin.CGFloat x = v163;
        v182.origin.CGFloat y = v86;
        v182.size.CGFloat height = v87;
        [v85 setRightHitTestExtension:v91 - CGRectGetMaxX(v182)];
LABEL_85:

        goto LABEL_86;
      }
      v93 = *(void **)(*(void *)(a1 + 32) + 408);
      CGFloat recta = v79;
      if ((v54 & 0x80000) != 0) {
        [v93 lastObject];
      }
      else {
      v112 = [v93 firstObject];
      }
      [v112 _tableFrame];
      CGFloat v113 = v188.origin.x;
      CGFloat v114 = v188.origin.y;
      CGFloat v160 = v188.size.width;
      CGFloat v165 = v188.size.height;
      double v115 = CGRectGetMinX(v188);
      CGFloat v148 = v75;
      CGFloat v150 = v77;
      v189.origin.CGFloat x = v75;
      v189.origin.CGFloat y = v77;
      v189.size.CGFloat width = recta;
      CGFloat v151 = v81;
      v189.size.CGFloat height = v81;
      [v112 setLeftHitTestExtension:v115 - CGRectGetMinX(v189)];
      if (v84 < 3)
      {
        v85 = v112;
        CGFloat v118 = v113;
        CGFloat v119 = v114;
        CGFloat v120 = v160;
        CGFloat v121 = v165;
      }
      else
      {
        uint64_t v116 = 1;
        do
        {
          if ((*(void *)&v54 & 0x80000) != 0) {
            uint64_t v117 = v83;
          }
          else {
            uint64_t v117 = v116;
          }
          v85 = [*(id *)(*(void *)(a1 + 32) + 408) objectAtIndexedSubscript:v117];
          [v85 _tableFrame];
          CGFloat v118 = v190.origin.x;
          CGFloat v119 = v190.origin.y;
          CGFloat v120 = v190.size.width;
          CGFloat v121 = v190.size.height;
          double v122 = CGRectGetMinX(v190);
          v191.origin.CGFloat x = v113;
          v191.origin.CGFloat y = v114;
          v191.size.CGFloat width = v160;
          v191.size.CGFloat height = v165;
          double v123 = (v122 - CGRectGetMaxX(v191)) * 0.5;
          [v112 setRightHitTestExtension:v123];
          [v85 setLeftHitTestExtension:v123];

          ++v116;
          CGFloat v160 = v120;
          CGFloat v165 = v121;
          CGFloat v114 = v119;
          CGFloat v113 = v118;
          v112 = v85;
          --v83;
        }
        while (v83);
      }
      CGFloat v124 = v118;
      v125 = *(void **)(*(void *)(a1 + 32) + 408);
      if ((v54 & 0x80000) != 0) {
        [v125 firstObject];
      }
      else {
      v94 = [v125 lastObject];
      }
      CGFloat v126 = v119;
      [v94 _tableFrame];
      CGFloat v161 = v192.size.height;
      CGFloat v166 = v192.origin.x;
      CGFloat v127 = v192.origin.y;
      CGFloat v128 = v192.size.width;
      double v129 = CGRectGetMinX(v192);
      v193.origin.CGFloat x = v124;
      v193.origin.CGFloat y = v126;
      v193.size.CGFloat width = v120;
      v193.size.CGFloat height = v121;
      double v130 = (v129 - CGRectGetMaxX(v193)) * 0.5;
      [v85 setRightHitTestExtension:v130];
      [v94 setLeftHitTestExtension:v130];
      v194.origin.CGFloat x = v148;
      v194.origin.CGFloat y = v150;
      v194.size.CGFloat height = v151;
      v194.size.CGFloat width = recta;
      double MaxX = CGRectGetMaxX(v194);
      CGFloat v111 = v161;
      CGFloat v108 = v166;
      CGFloat v109 = v127;
      CGFloat v110 = v128;
    }
    [v94 setRightHitTestExtension:MaxX - CGRectGetMaxX(*(CGRect *)&v108)];

    goto LABEL_85;
  }
LABEL_86:
  long long v169 = 0u;
  long long v170 = 0u;
  long long v167 = 0u;
  long long v168 = 0u;
  id v131 = *(id *)(*(void *)(a1 + 32) + 408);
  uint64_t v132 = [v131 countByEnumeratingWithState:&v167 objects:v175 count:16];
  if (v132)
  {
    uint64_t v133 = v132;
    uint64_t v134 = *(void *)v168;
    do
    {
      for (uint64_t m = 0; m != v133; ++m)
      {
        if (*(void *)v168 != v134) {
          objc_enumerationMutation(v131);
        }
        v136 = *(void **)(*((void *)&v167 + 1) + 8 * m);
        v137 = *(void **)(a1 + 32);
        [v136 rowHeight];
        objc_msgSend(v137, "_selectionBarRectForHeight:");
        objc_msgSend(v136, "setSelectionBarRect:");
      }
      uint64_t v133 = [v131 countByEnumeratingWithState:&v167 objects:v175 count:16];
    }
    while (v133);
  }

  v138 = [*(id *)(a1 + 32) _style];
  int v139 = [v138 highlightViewIsOverlay];

  if (v139) {
    [*(id *)(a1 + 32) _addMagnifierForRowHeight:v42];
  }
  uint64_t v140 = v154;
  if ([*(id *)(*(void *)(a1 + 32) + 408) count])
  {
    unint64_t v141 = 0;
    do
    {
      v142 = [*(id *)(*(void *)(a1 + 32) + 408) objectAtIndex:v141];
      [v142 reloadData];

      ++v141;
    }
    while (v141 < [*(id *)(*(void *)(a1 + 32) + 408) count]);
  }
  if (v155)
  {
    if (v27 < v154) {
      uint64_t v140 = v27;
    }
    if (v140 >= 1)
    {
      for (uint64_t n = 0; n != v140; ++n)
      {
        v144 = [*(id *)(*(void *)(a1 + 32) + 408) objectAtIndex:n];
        objc_msgSend(v144, "selectRow:animated:notify:updateChecked:", v155[n], 0, 0, objc_msgSend(*(id *)(a1 + 32), "allowsMultipleSelection") ^ 1);
      }
    }
    if (v155 != (void *)v177) {
      free(v155);
    }
  }
  else
  {
    [*(id *)(a1 + 32) _resetSelectionOfTables];
  }
  *(_DWORD *)(*(void *)(a1 + 32) + 472) = *(_DWORD *)(*(void *)(a1 + 32) + 472) & 0xFFFFEFFF | (((v156 >> 12) & 1) << 12);
  v145 = [*(id *)(*(void *)(a1 + 32) + 440) layer];
  [v145 addSublayer:*(void *)(*(void *)(a1 + 32) + 448)];
}

- (void)_resetSelectionOfTables
{
  uint64_t v3 = [(UIPickerView *)self _delegateNumberOfComponents];
  if (v3 >= 1)
  {
    uint64_t v4 = v3;
    for (uint64_t i = 0; i != v4; ++i)
    {
      if ([(UIPickerView *)self _delegateNumberOfRowsInComponent:i] >= 1
        && (*((unsigned char *)&self->_pickerViewFlags + 1) & 0x20) == 0)
      {
        double v6 = [(NSMutableArray *)self->_tables objectAtIndex:i];
        [v6 selectRow:0 animated:0 notify:0];
      }
    }
  }
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v8 = [(UIPickerView *)self _style];
  char v9 = objc_msgSend(v8, "sizeIsValid:", width, height);

  if ((v9 & 1) == 0)
  {
    -[UIPickerView _sizeThatFits:](self, "_sizeThatFits:", width, height);
    CGFloat v11 = v10;
    CGFloat v13 = v12;
    v21.double width = width;
    v21.double height = height;
    uint64_t v14 = NSStringFromCGSize(v21);
    v22.double width = v11;
    v22.double height = v13;
    double v15 = NSStringFromCGSize(v22);
    NSLog(&cfstr_UipickerviewSe.isa, v14, v15);

    double width = v11;
    double height = v13;
  }
  [(UIView *)self frame];
  double v17 = v16;
  double v19 = v18;
  v20.receiver = self;
  v20.super_class = (Class)UIPickerView;
  -[UIView setFrame:](&v20, sel_setFrame_, x, y, width, height);
  if (v17 != width || v19 != height) {
    -[UIPickerView _updateWithOldSize:newSize:](self, "_updateWithOldSize:newSize:", v17, v19, width, height);
  }
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if ((dyld_program_sdk_at_least() & 1) == 0)
  {
    objc_msgSend((id)objc_opt_class(), "sizeForMainScreenTraitsThatFits:", width, height);
    double width = v8;
    double height = v9;
  }
  [(UIView *)self bounds];
  double v11 = v10;
  double v13 = v12;
  v15.receiver = self;
  v15.super_class = (Class)UIPickerView;
  -[UIView setBounds:](&v15, sel_setBounds_, x, y, width, height);
  if (v11 != width || v13 != height) {
    -[UIPickerView _updateWithOldSize:newSize:](self, "_updateWithOldSize:newSize:", v11, v13, width, height);
  }
}

- (void)setDataSource:(id)dataSource
{
  objc_storeWeak((id *)&self->_dataSource, dataSource);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    int v4 = 32;
  }
  else {
    int v4 = 0;
  }
  self->_$76755D4DEA27573399A7BF6CD45D6B19 pickerViewFlags = ($76755D4DEA27573399A7BF6CD45D6B19)(*(_DWORD *)&self->_pickerViewFlags & 0xFFFFFFDF | v4);
  if (objc_opt_respondsToSelector()) {
    int v5 = 64;
  }
  else {
    int v5 = 0;
  }
  self->_$76755D4DEA27573399A7BF6CD45D6B19 pickerViewFlags = ($76755D4DEA27573399A7BF6CD45D6B19)(*(_DWORD *)&self->_pickerViewFlags & 0xFFFFFFBF | v5);
  if (objc_opt_respondsToSelector()) {
    int v6 = 16;
  }
  else {
    int v6 = 0;
  }
  self->_$76755D4DEA27573399A7BF6CD45D6B19 pickerViewFlags = ($76755D4DEA27573399A7BF6CD45D6B19)(*(_DWORD *)&self->_pickerViewFlags & 0xFFFFFFEF | v6);
  if (objc_opt_respondsToSelector()) {
    int v7 = 8;
  }
  else {
    int v7 = 0;
  }
  self->_$76755D4DEA27573399A7BF6CD45D6B19 pickerViewFlags = ($76755D4DEA27573399A7BF6CD45D6B19)(*(_DWORD *)&self->_pickerViewFlags & 0xFFFFFFF7 | v7);
  if (objc_opt_respondsToSelector()) {
    int v8 = 128;
  }
  else {
    int v8 = 0;
  }
  self->_$76755D4DEA27573399A7BF6CD45D6B19 pickerViewFlags = ($76755D4DEA27573399A7BF6CD45D6B19)(*(_DWORD *)&self->_pickerViewFlags & 0xFFFFFF7F | v8);
  if (objc_opt_respondsToSelector()) {
    int v9 = 256;
  }
  else {
    int v9 = 0;
  }
  self->_$76755D4DEA27573399A7BF6CD45D6B19 pickerViewFlags = ($76755D4DEA27573399A7BF6CD45D6B19)(*(_DWORD *)&self->_pickerViewFlags & 0xFFFFFEFF | v9);
  [(UIPickerView *)self setNeedsLayout];
}

- (void)setDelegate:(id)delegate
{
  p_delegate = &self->_delegate;
  id v5 = delegate;
  objc_storeWeak((id *)p_delegate, v5);
  if (objc_opt_respondsToSelector()) {
    int v6 = 32;
  }
  else {
    int v6 = 0;
  }
  self->_$76755D4DEA27573399A7BF6CD45D6B19 pickerViewFlags = ($76755D4DEA27573399A7BF6CD45D6B19)(*(_DWORD *)&self->_pickerViewFlags & 0xFFFFFFDF | v6);
  if (objc_opt_respondsToSelector()) {
    int v7 = 64;
  }
  else {
    int v7 = 0;
  }
  self->_$76755D4DEA27573399A7BF6CD45D6B19 pickerViewFlags = ($76755D4DEA27573399A7BF6CD45D6B19)(*(_DWORD *)&self->_pickerViewFlags & 0xFFFFFFBF | v7);
  if (objc_opt_respondsToSelector()) {
    int v8 = 16;
  }
  else {
    int v8 = 0;
  }
  self->_$76755D4DEA27573399A7BF6CD45D6B19 pickerViewFlags = ($76755D4DEA27573399A7BF6CD45D6B19)(*(_DWORD *)&self->_pickerViewFlags & 0xFFFFFFEF | v8);
  if (objc_opt_respondsToSelector()) {
    int v9 = 8;
  }
  else {
    int v9 = 0;
  }
  self->_$76755D4DEA27573399A7BF6CD45D6B19 pickerViewFlags = ($76755D4DEA27573399A7BF6CD45D6B19)(*(_DWORD *)&self->_pickerViewFlags & 0xFFFFFFF7 | v9);
  if (objc_opt_respondsToSelector()) {
    int v10 = 128;
  }
  else {
    int v10 = 0;
  }
  self->_$76755D4DEA27573399A7BF6CD45D6B19 pickerViewFlags = ($76755D4DEA27573399A7BF6CD45D6B19)(*(_DWORD *)&self->_pickerViewFlags & 0xFFFFFF7F | v10);
  if (objc_opt_respondsToSelector()) {
    int v11 = 256;
  }
  else {
    int v11 = 0;
  }
  self->_$76755D4DEA27573399A7BF6CD45D6B19 pickerViewFlags = ($76755D4DEA27573399A7BF6CD45D6B19)(*(_DWORD *)&self->_pickerViewFlags & 0xFFFFFEFF | v11);
  if (objc_opt_respondsToSelector()) {
    int v12 = 2;
  }
  else {
    int v12 = 0;
  }
  self->_$76755D4DEA27573399A7BF6CD45D6B19 pickerViewFlags = ($76755D4DEA27573399A7BF6CD45D6B19)(*(_DWORD *)&self->_pickerViewFlags & 0xFFFFFFFD | v12);
  char v13 = objc_opt_respondsToSelector();

  if (v13) {
    int v14 = 4;
  }
  else {
    int v14 = 0;
  }
  self->_$76755D4DEA27573399A7BF6CD45D6B19 pickerViewFlags = ($76755D4DEA27573399A7BF6CD45D6B19)(*(_DWORD *)&self->_pickerViewFlags & 0xFFFFFFFB | v14);
  [(UIPickerView *)self setNeedsLayout];
}

- (void)setShowsSelectionIndicator:(BOOL)showsSelectionIndicator
{
  if (((((*(_DWORD *)&self->_pickerViewFlags & 0x200) == 0) ^ showsSelectionIndicator) & 1) == 0)
  {
    if (showsSelectionIndicator) {
      int v3 = 512;
    }
    else {
      int v3 = 0;
    }
    self->_$76755D4DEA27573399A7BF6CD45D6B19 pickerViewFlags = ($76755D4DEA27573399A7BF6CD45D6B19)(*(_DWORD *)&self->_pickerViewFlags & 0xFFFFFDFF | v3);
    [(UIPickerView *)self setNeedsLayout];
  }
}

- (BOOL)showsSelectionIndicator
{
  return (*((unsigned __int8 *)&self->_pickerViewFlags + 1) >> 1) & 1;
}

- (void)_sendSelectionChangedForComponent:(int64_t)a3 notify:(BOOL)a4
{
  if ((*(unsigned char *)&self->_pickerViewFlags & 8) != 0 && a4)
  {
    NSInteger v6 = [(UIPickerView *)self selectedRowInComponent:a3];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained pickerView:self didSelectRow:v6 inComponent:a3];
  }
  -[UIPickerView _noteScrollingFinishedForComponent:](self, "_noteScrollingFinishedForComponent:", a3, a4);
}

- (void)setAllowsMultipleSelection:(BOOL)a3
{
  if (a3) {
    int v3 = 1024;
  }
  else {
    int v3 = 0;
  }
  self->_$76755D4DEA27573399A7BF6CD45D6B19 pickerViewFlags = ($76755D4DEA27573399A7BF6CD45D6B19)(*(_DWORD *)&self->_pickerViewFlags & 0xFFFFFBFF | v3);
  tables = self->_tables;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __43__UIPickerView_setAllowsMultipleSelection___block_invoke;
  v5[3] = &__block_descriptor_33_e15_v32__0_8Q16_B24l;
  BOOL v6 = a3;
  [(NSMutableArray *)tables enumerateObjectsUsingBlock:v5];
}

uint64_t __43__UIPickerView_setAllowsMultipleSelection___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setAllowsMultipleSelection:*(unsigned __int8 *)(a1 + 32)];
}

- (BOOL)allowsMultipleSelection
{
  return (*((unsigned __int8 *)&self->_pickerViewFlags + 1) >> 2) & 1;
}

- (BOOL)_usesCheckSelection
{
  return 0;
}

- (void)_sendSelectionChangedFromTable:(id)a3 notify:(BOOL)a4
{
  BOOL v4 = a4;
  int64_t v6 = [(UIPickerView *)self columnForTableView:a3];
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    [(UIPickerView *)self _sendSelectionChangedForComponent:v6 notify:v4];
  }
}

- (void)_setUsesCheckedSelection:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000;
  }
  else {
    int v3 = 0;
  }
  self->_$76755D4DEA27573399A7BF6CD45D6B19 pickerViewFlags = ($76755D4DEA27573399A7BF6CD45D6B19)(*(_DWORD *)&self->_pickerViewFlags & 0xFFFFDFFF | v3);
}

- (BOOL)_usesCheckedSelection
{
  return (*((unsigned __int8 *)&self->_pickerViewFlags + 1) >> 5) & 1;
}

- (void)_setDrawsBackground:(BOOL)a3
{
  if (a3) {
    int v4 = 0;
  }
  else {
    int v4 = 0x4000;
  }
  self->_$76755D4DEA27573399A7BF6CD45D6B19 pickerViewFlags = ($76755D4DEA27573399A7BF6CD45D6B19)(*(_DWORD *)&self->_pickerViewFlags & 0xFFFFBFFF | v4);
  if (a3)
  {
    id v5 = +[UIColor clearColor];
    [(UIPickerView *)self setBackgroundColor:v5];
  }
  else
  {
    [(UIPickerView *)self setBackgroundColor:0];
  }
  [(UIPickerView *)self setNeedsLayout];
}

- (BOOL)_drawsBackground
{
  return (*((unsigned char *)&self->_pickerViewFlags + 1) & 0x40) == 0;
}

- (BOOL)_needsLayout
{
  return *(_DWORD *)&self->_pickerViewFlags & 1;
}

- (CGSize)_contentSizeForRow:(int64_t)a3 inComponent:(int64_t)a4
{
  if ([(UIPickerView *)self numberOfComponents] <= a4)
  {
    double v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"UIPickerView.m", 1263, @"Invalid parameter not satisfying: %@", @"component < [self numberOfComponents]" object file lineNumber description];
  }
  if ([(UIPickerView *)self numberOfRowsInComponent:a4] <= a3)
  {
    double v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"UIPickerView.m", 1264, @"Invalid parameter not satisfying: %@", @"row < [self numberOfRowsInComponent:component]" object file lineNumber description];
  }
  int v8 = [(UIPickerView *)self tableViewForColumn:a4];
  int v9 = [MEMORY[0x1E4F28D58] indexPathForRow:a3 inSection:0];
  [v8 rectForRowAtIndexPath:v9];
  double v11 = v10;
  double v13 = v12;

  double v14 = v11;
  double v15 = v13;
  result.double height = v15;
  result.double width = v14;
  return result;
}

- (BOOL)_forceTextAlignmentCentered
{
  return 0;
}

- (_NSRange)visibleRowsForColumn:(int)a3
{
  int v3 = [(NSMutableArray *)self->_tables objectAtIndex:a3];
  int v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 _visibleGlobalRows];
    NSUInteger v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    NSUInteger v7 = 0;
  }

  NSUInteger v8 = v5;
  NSUInteger v9 = v7;
  result.length = v9;
  result.locatiouint64_t n = v8;
  return result;
}

- (NSInteger)selectedRowInComponent:(NSInteger)component
{
  if (*(unsigned char *)&self->_pickerViewFlags) {
    [(UIPickerView *)self layoutSubviews];
  }
  if ([(NSMutableArray *)self->_tables count] <= (unint64_t)component)
  {
    NSUInteger v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"UIPickerView.m", 1290, @"Tried to fetch selected row in component %ld, but there are only %ld tables.", component, -[NSMutableArray count](self->_tables, "count") object file lineNumber description];
  }
  NSUInteger v6 = [(NSMutableArray *)self->_tables objectAtIndex:component];
  NSInteger v7 = [v6 selectionBarRow];

  return v7;
}

- (int)selectedRowForColumn:(int)a3
{
  return [(UIPickerView *)self selectedRowInComponent:a3];
}

- (int64_t)columnForTableView:(id)a3
{
  id v4 = a3;
  if ([(NSMutableArray *)self->_tables count])
  {
    int64_t v5 = 0;
    while (1)
    {
      NSUInteger v6 = [(NSMutableArray *)self->_tables objectAtIndex:v5];
      char v7 = [v6 _containsTable:v4];

      if (v7) {
        break;
      }
      if (++v5 >= (unint64_t)[(NSMutableArray *)self->_tables count]) {
        goto LABEL_5;
      }
    }
  }
  else
  {
LABEL_5:
    int64_t v5 = -1;
  }

  return v5;
}

- (id)tableViewForColumn:(int64_t)a3
{
  int v3 = [(NSMutableArray *)self->_tables objectAtIndex:a3];
  id v4 = [v3 _preferredTable];

  return v4;
}

- (CGRect)_effectiveTableViewFrameForColumn:(int64_t)a3
{
  int v3 = [(NSMutableArray *)self->_tables objectAtIndex:a3];
  [v3 _tableFrame];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.size.double height = v15;
  result.size.double width = v14;
  result.origin.double y = v13;
  result.origin.double x = v12;
  return result;
}

- (void)_selectRow:(int64_t)a3 inComponent:(int64_t)a4 animated:(BOOL)a5 notify:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  $76755D4DEA27573399A7BF6CD45D6B19 pickerViewFlags = self->_pickerViewFlags;
  char v12 = (char)pickerViewFlags;
  if (!a5)
  {
    char v12 = (char)self->_pickerViewFlags;
    self->_$76755D4DEA27573399A7BF6CD45D6B19 pickerViewFlags = ($76755D4DEA27573399A7BF6CD45D6B19)(*(_DWORD *)&pickerViewFlags | 0x1000);
  }
  if (v12) {
    [(UIPickerView *)self layoutSubviews];
  }
  id v13 = [(NSMutableArray *)self->_tables objectAtIndex:a4];
  -[UIPickerView _sendSelectionChangedFromTable:notify:](self, "_sendSelectionChangedFromTable:notify:", v13, v6 & ~[v13 selectRow:a3 animated:v7 notify:v6]);
  self->_$76755D4DEA27573399A7BF6CD45D6B19 pickerViewFlags = ($76755D4DEA27573399A7BF6CD45D6B19)(*(_DWORD *)&self->_pickerViewFlags & 0xFFFFEFFF | (((*(unsigned int *)&pickerViewFlags >> 12) & 1) << 12));
}

- (void)selectRow:(NSInteger)row inComponent:(NSInteger)component animated:(BOOL)animated
{
}

- (void)selectRow:(int)a3 inColumn:(int)a4 animated:(BOOL)a5
{
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  int64_t v6 = -[UIPickerView columnForTableView:](self, "columnForTableView:", a3, a4);
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    double v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"UIPickerView.m" lineNumber:1352 description:@"column should exist in tables array"];
  }
  return [(UIPickerView *)self _delegateNumberOfRowsInComponent:v6];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int64_t v8 = [(UIPickerView *)self columnForTableView:v6];
  if ((*(unsigned char *)&self->_pickerViewFlags & 0x10) != 0)
  {
    double v9 = [v6 dequeueReusableCellWithIdentifier:@"UIPickerTableViewWrapperCell"];
    if (!v9) {
      double v9 = [[UIPickerTableViewWrapperCell alloc] initWithStyle:0 reuseIdentifier:@"UIPickerTableViewWrapperCell"];
    }
    double v14 = [(UIPickerTableViewWrapperCell *)v9 wrappedView];
    if (([v14 _canBeReusedInPickerView] & 1) == 0)
    {

      double v14 = 0;
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    double v16 = objc_msgSend(WeakRetained, "pickerView:viewForRow:forComponent:reusingView:", self, objc_msgSend(v7, "row"), v8, v14);

    [(UIPickerTableViewWrapperCell *)v9 setWrappedView:v16];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v6, "isRowChecked:", objc_msgSend(v7, "row"))) {
      [v16 setChecked:1];
    }

    goto LABEL_15;
  }
  double v9 = [v6 dequeueReusableCellWithIdentifier:@"UIPickerTableViewTitledCell"];
  if (!v9)
  {
    double v10 = [UIPickerTableViewTitledCell alloc];
    double v11 = [(UIPickerView *)self _textColor];
    double v9 = [(UIPickerTableViewTitledCell *)v10 initWithStyle:0 reuseIdentifier:@"UIPickerTableViewTitledCell" textColor:v11 forceTextAlignmentCentered:[(UIPickerView *)self _forceTextAlignmentCentered]];
  }
  $76755D4DEA27573399A7BF6CD45D6B19 pickerViewFlags = self->_pickerViewFlags;
  if ((*(unsigned char *)&pickerViewFlags & 0x40) != 0)
  {
    uint64_t v13 = -[UIPickerView _delegateAttributedTitleForRow:forComponent:](self, "_delegateAttributedTitleForRow:forComponent:", [v7 row], v8);
    if (v13)
    {
      double v14 = (void *)v13;
      [(UIPickerTableViewWrapperCell *)v9 setAttributedTitle:v13];
LABEL_15:

      goto LABEL_20;
    }
    $76755D4DEA27573399A7BF6CD45D6B19 pickerViewFlags = self->_pickerViewFlags;
  }
  if ((*(unsigned char *)&pickerViewFlags & 0x20) != 0)
  {
    double v17 = -[UIPickerView _delegateTitleForRow:forComponent:](self, "_delegateTitleForRow:forComponent:", [v7 row], v8);
    [(UIPickerTableViewWrapperCell *)v9 setTitle:v17];
  }
  else
  {
    [(UIPickerTableViewWrapperCell *)v9 setTitle:@"?"];
  }
LABEL_20:

  return v9;
}

- (void)_setMagnifierEnabled:(BOOL)a3
{
  self->_magnifierEnabled = a3;
  [(UIPickerView *)self setNeedsLayout];
}

- (void)_setHighlightColor:(id)a3
{
  [(UIView *)self _setInteractionTintColor:a3];
  [(UIPickerView *)self setNeedsLayout];
}

- (UIColor)_textColor
{
  return self->_textColor;
}

- (void)_setTextColor:(id)a3
{
  id v5 = a3;
  if (([v5 isEqual:self->_textColor] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_textColor, a3);
    [(UIPickerView *)self setNeedsLayout];
  }
}

- (UIColor)_textShadowColor
{
  return self->_textShadowColor;
}

- (void)_setTextShadowColor:(id)a3
{
  id v5 = a3;
  if (([v5 isEqual:self->_textColor] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_textShadowColor, a3);
    [(UIPickerView *)self setNeedsLayout];
  }
}

- (CATransform3D)_perspectiveTransform
{
  double v4 = [(UIPickerView *)self _style];
  if (v4)
  {
    id v6 = v4;
    [v4 perspectiveTransform];
    double v4 = v6;
  }
  else
  {
    *(_OWORD *)&retstr->m41 = 0u;
    *(_OWORD *)&retstr->m43 = 0u;
    *(_OWORD *)&retstr->m31 = 0u;
    *(_OWORD *)&retstr->m33 = 0u;
    *(_OWORD *)&retstr->m21 = 0u;
    *(_OWORD *)&retstr->m23 = 0u;
    *(_OWORD *)&retstr->m11 = 0u;
    *(_OWORD *)&retstr->m13 = 0u;
  }

  return result;
}

- (void)_willPlayClickSound
{
  id v2 = [(UIPickerView *)self _scalarStatisticsForUserValueChangedEvent];
  [v2 incrementValueBy:1];
}

- (id)_scalarStatisticsForUserValueChangedEvent
{
  id v2 = (objc_class *)objc_opt_class();
  int v3 = NSStringFromClass(v2);
  double v4 = +[_UIStatistics controlValueChangeEmittedCountWithCategory:@"picker" suffix:v3];

  return v4;
}

- (BOOL)_canHostViewControllerContentScrollView
{
  return 0;
}

- (id)_systemDefaultFocusGroupIdentifier
{
  int v3 = [(UIView *)self _focusBehavior];
  char v4 = [v3 focusGroupContainmentBehavior];

  if ((v4 & 0x10) != 0)
  {
    id v5 = 0;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)UIPickerView;
    id v5 = [(UIView *)&v7 _systemDefaultFocusGroupIdentifier];
  }
  return v5;
}

+ (void)_prepareStyleStorageIfNecessary
{
  if (_prepareStyleStorageIfNecessary_once_0[0] != -1) {
    dispatch_once(_prepareStyleStorageIfNecessary_once_0, &__block_literal_global_130_2);
  }
}

void __47__UIPickerView__prepareStyleStorageIfNecessary__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F1CA60] dictionary];
  v1 = (void *)__pickerViewIdiomsToStyles;
  __pickerViewIdiomsToStyles = v0;
}

+ (void)_registerStyle:(id)a3 forIdiom:(int64_t)a4
{
  id v6 = a3;
  [a1 _prepareStyleStorageIfNecessary];
  objc_super v7 = (void *)__pickerViewIdiomsToStyles;
  id v8 = [NSNumber numberWithInteger:a4];
  [v7 setObject:v6 forKey:v8];
}

+ (id)_styleForIdiom:(int64_t)a3
{
  [a1 _prepareStyleStorageIfNecessary];
  char v4 = (void *)__pickerViewIdiomsToStyles;
  id v5 = [NSNumber numberWithInteger:a3];
  id v6 = [v4 objectForKey:v5];

  if (v6) {
    objc_super v7 = v6;
  }
  else {
    objc_super v7 = objc_alloc_init(_UIPickerViewStyle_iOS);
  }
  id v8 = v7;

  return v8;
}

- (_UIPickerViewStyle)_style
{
  style = self->_style;
  if (!style)
  {
    char v4 = [(UIView *)self traitCollection];
    +[UIPickerView _styleForIdiom:](UIPickerView, "_styleForIdiom:", [v4 userInterfaceIdiom]);
    id v5 = (_UIPickerViewStyle *)objc_claimAutoreleasedReturnValue();

    id v6 = self->_style;
    self->_style = v5;

    style = self->_style;
  }
  return style;
}

- (id)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return WeakRetained;
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return WeakRetained;
}

- (BOOL)_magnifierEnabled
{
  return self->_magnifierEnabled;
}

- (BOOL)_enabled
{
  return self->_enabled;
}

- (int64_t)_magnifierStyle
{
  return self->_magnifierStyle;
}

- (void)_setMagnifierStyle:(int64_t)a3
{
  self->_magnifierStyle = a3;
}

- (UISelectionFeedbackGenerator)_selectionFeedbackGenerator
{
  return self->_selectionFeedbackGenerator;
}

- (void)_setSelectionFeedbackGenerator:(id)a3
{
}

- (UIColor)_magnifierLineColor
{
  return self->_magnifierLineColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_magnifierLineColor, 0);
  objc_storeStrong((id *)&self->_selectionFeedbackGenerator, 0);
  objc_storeStrong((id *)&self->_currentTestParameters, 0);
  objc_storeStrong((id *)&self->_style, 0);
  objc_storeStrong((id *)&self->_textShadowColor, 0);
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_bottomLineView, 0);
  objc_storeStrong((id *)&self->_topLineOrFillView, 0);
  objc_storeStrong((id *)&self->_maskGradientLayer, 0);
  objc_storeStrong((id *)&self->_foregroundView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_tables, 0);
}

- (void)_performScrollTest:(id)a3 withIterations:(int64_t)a4 rowsToScroll:(int64_t)a5 inComponent:(int64_t)a6
{
  double v11 = (NSString *)a3;
  if (self->_currentTestParameters)
  {
    double v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2 object:self file:@"UIPickerView.m" lineNumber:1518 description:@"Picker Testing: Only one test may be run at a time"];
  }
  if ([(UIPickerView *)self numberOfComponents] <= a6)
  {
    double v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2 object:self file:@"UIPickerView.m" lineNumber:1519 description:@"Picker Testing: Component specified does not exist"];
  }
  NSInteger v12 = [(UIPickerView *)self selectedRowInComponent:a6] + a5 * a4;
  if (v12 >= [(UIPickerView *)self _delegateNumberOfRowsInComponent:a6])
  {
    objc_super v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2 object:self file:@"UIPickerView.m" lineNumber:1521 description:@"Picker Testing: Rows to scroll would go past the end of the component"];
  }
  uint64_t v13 = objc_alloc_init(_UIPickerViewTestParameters);
  currentTestParameters = self->_currentTestParameters;
  self->_currentTestParameters = v13;

  double v15 = self->_currentTestParameters;
  testName = v15->_testName;
  v15->_testName = v11;
  double v17 = v11;

  self->_currentTestParameters->_remainingIterations = a4;
  self->_currentTestParameters->_rowsToScroll = a5;
  self->_currentTestParameters->_componentToScroll = a6;
  [(id)UIApp startedTest:v17];

  [(UIPickerView *)self _iterateOnCurrentTest];
}

- (void)_iterateOnCurrentTest
{
  currentTestParameters = self->_currentTestParameters;
  if (currentTestParameters->_remainingIterations)
  {
    int64_t componentToScroll = currentTestParameters->_componentToScroll;
    int64_t v5 = self->_currentTestParameters->_rowsToScroll
       + [(UIPickerView *)self selectedRowInComponent:componentToScroll];
    [(UIPickerView *)self selectRow:v5 inComponent:componentToScroll animated:1];
  }
  else
  {
    [(UIPickerView *)self _completeCurrentTest];
  }
}

- (void)_completeCurrentTest
{
  currentTestParameters = self->_currentTestParameters;
  testName = currentTestParameters->_testName;
  self->_currentTestParameters = 0;
  char v4 = testName;

  [(id)UIApp finishedTest:v4];
}

- (void)_noteScrollingFinishedForComponent:(int64_t)a3
{
  currentTestParameters = self->_currentTestParameters;
  if (currentTestParameters)
  {
    if (currentTestParameters->_componentToScroll == a3)
    {
      --currentTestParameters->_remainingIterations;
      [(UIPickerView *)self _iterateOnCurrentTest];
    }
  }
}

+ (void)_setAllowsUnsupportedMacIdiomBehavior:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  _UnsupportedFlags_0 = _UnsupportedFlags_0 & 0xFB | v3;
}

+ (BOOL)_allowsUnsupportedMacIdiomBehavior
{
  return (_UnsupportedFlags_0 >> 2) & 1;
}

@end