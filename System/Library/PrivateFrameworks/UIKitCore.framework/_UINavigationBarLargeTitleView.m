@interface _UINavigationBarLargeTitleView
- (BOOL)alignAccessoryViewToTitleBaseline;
- (BOOL)providesExtraSpaceForExcessiveLineHeights;
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CGSize)sizeThatFits:(CGSize)a3 titleType:(int64_t)a4;
- (NSArray)alternateTitles;
- (NSDictionary)effectiveTitleAttributes;
- (NSDictionary)titleAttributes;
- (NSString)title;
- (UIView)accessibilityTitleView;
- (UIView)accessoryView;
- (_UINavigationBarLargeTitleView)initWithFrame:(CGRect)a3;
- (_UINavigationBarLargeTitleViewLayout)layout;
- (_UIPointerInteractionAssistant)assistant;
- (double)restingHeightOfTitleView;
- (id)_effectiveTitle;
- (id)_layoutForMeasurement;
- (id)_newLayout;
- (id)_titleForCurrentWidth;
- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4;
- (int64_t)titleType;
- (unint64_t)accessoryViewHorizontalAlignment;
- (unint64_t)twoLineMode;
- (void)_clearAssistants;
- (void)_contentSizeCategoryDidChange;
- (void)_setAssistants;
- (void)_updateContentAndInvalidate:(BOOL)a3;
- (void)adoptLayout:(id)a3;
- (void)adoptNewLayout;
- (void)clearTransitionContext;
- (void)layoutSubviews;
- (void)pointerInteraction:(id)a3 willEnterRegion:(id)a4 animator:(id)a5;
- (void)pointerInteraction:(id)a3 willExitRegion:(id)a4 animator:(id)a5;
- (void)prepareToRecordToState:(id)a3;
- (void)recordFromStateForTransition:(id)a3;
- (void)recordToStateForTransition:(id)a3;
- (void)safeAreaInsetsDidChange;
- (void)setAccessoryView:(id)a3;
- (void)setAccessoryViewHorizontalAlignment:(unint64_t)a3;
- (void)setAlignAccessoryViewToTitleBaseline:(BOOL)a3;
- (void)setAlternateTitles:(id)a3;
- (void)setAssistant:(id)a3;
- (void)setProvidesExtraSpaceForExcessiveLineHeights:(BOOL)a3;
- (void)setTitle:(id)a3;
- (void)setTitleAttributes:(id)a3;
- (void)setTitleType:(int64_t)a3;
- (void)setTwoLineMode:(unint64_t)a3;
- (void)updateContent;
@end

@implementation _UINavigationBarLargeTitleView

- (_UINavigationBarLargeTitleViewLayout)layout
{
  return self->_layout;
}

- (void)_updateContentAndInvalidate:(BOOL)a3
{
  BOOL v3 = a3;
  [(UIView *)self updateTraitsIfNeeded];
  layout = self->_layout;
  if (!layout)
  {
    uint64_t v6 = [(_UINavigationBarTransitionContext *)self->_transitionContext toLayout];
    v7 = (void *)v6;
    if (v6 && (id v8 = *(id *)(v6 + 168)) != 0)
    {
      v9 = (_UINavigationBarLargeTitleViewLayout *)v8;
      v10 = v9;
    }
    else
    {
      v9 = [(_UINavigationBarLargeTitleView *)self _newLayout];
      v10 = 0;
    }
    v11 = self->_layout;
    self->_layout = v9;

    [(_UINavigationBarLargeTitleViewLayout *)self->_layout setContentView:self];
    layout = self->_layout;
  }
  [(_UINavigationBarLargeTitleViewLayout *)layout setTitleType:self->_titleType];
  if (self->_titleType)
  {
    v12 = [(_UINavigationBarLargeTitleView *)self _effectiveTitle];
    [(_UINavigationBarLargeTitleViewLayout *)self->_layout _invalidateTitleHeightCache];
    uint64_t v13 = [(__CFString *)v12 length];
    v14 = @" ";
    if (v13) {
      v14 = v12;
    }
    v15 = (objc_class *)MEMORY[0x1E4F28B18];
    v16 = v14;
    id v17 = [v15 alloc];
    v18 = [(_UINavigationBarLargeTitleView *)self effectiveTitleAttributes];
    v19 = (void *)[v17 initWithString:v16 attributes:v18];

    v20 = [(_UINavigationBarLargeTitleViewLayout *)self->_layout titleLabel];
    [v20 setAttributedText:v19];

    [(_UINavigationBarLargeTitleViewLayout *)self->_layout setAccessoryView:self->_accessoryView];
    [(_UINavigationBarLargeTitleViewLayout *)self->_layout setAlignAccessoryViewToTitleBaseline:self->_alignAccessoryViewToTitleBaseline];
    [(_UINavigationBarLargeTitleViewLayout *)self->_layout setAccessoryViewHorizontalAlignment:self->_accessoryViewHorizontalAlignment];
    [(_UINavigationBarLargeTitleViewLayout *)self->_layout setTwoLineMode:self->_twoLineMode];
    [(_UINavigationBarLargeTitleViewLayout *)self->_layout setProvidesExtraSpaceForExcessiveLineHeights:self->_providesExtraSpaceForExcessiveLineHeights];
    [(_UINavigationBarLargeTitleViewLayout *)self->_layout updateRestingTitleHeight];
  }
  [(_UINavigationBarLargeTitleView *)self _setAssistants];
  [(UIView *)self directionalLayoutMargins];
  [(_UINavigationBarLargeTitleViewLayout *)self->_layout setLayoutMargins:"setLayoutMargins:"];
  if (v3)
  {
    [(UIView *)self invalidateIntrinsicContentSize];
    [(UIView *)self setNeedsLayout];
  }
}

- (void)_setAssistants
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_assistant);
  BOOL v3 = [(_UINavigationBarLargeTitleViewLayout *)self->_layout accessoryView];
  if (v3) {
    v4 = self;
  }
  else {
    v4 = 0;
  }
  [WeakRetained setAssistedView:v4 identifier:@"LargeTitle.accessoryView"];
}

- (void)setTitleType:(int64_t)a3
{
  if (self->_titleType != a3)
  {
    self->_titleType = a3;
    -[_UINavigationBarLargeTitleViewLayout setTitleType:](self->_layout, "setTitleType:");
    [(_UINavigationBarLargeTitleViewLayout *)self->_layout _invalidateTitleHeightCache];
  }
  [(_UINavigationBarLargeTitleViewLayout *)self->_layout updateRestingTitleHeight];
  [(UIView *)self invalidateIntrinsicContentSize];
}

- (id)_effectiveTitle
{
  effectiveTitle = self->__effectiveTitle;
  if (!effectiveTitle)
  {
    if (self->_alternateTitles)
    {
      v4 = [(_UINavigationBarLargeTitleView *)self _titleForCurrentWidth];
    }
    else
    {
      v4 = self->_title;
    }
    v5 = self->__effectiveTitle;
    self->__effectiveTitle = v4;

    effectiveTitle = self->__effectiveTitle;
  }
  return effectiveTitle;
}

- (void)setTitleAttributes:(id)a3
{
  id v6 = a3;
  if ((-[NSDictionary isEqual:](self->_titleAttributes, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_titleAttributes, a3);
    effectiveTitleAttributes = self->_effectiveTitleAttributes;
    self->_effectiveTitleAttributes = 0;

    [(_UINavigationBarLargeTitleViewLayout *)self->_layout _invalidateTitleHeightCache];
  }
}

- (void)updateContent
{
}

- (void)setTwoLineMode:(unint64_t)a3
{
  self->_twoLineMode = a3;
}

- (void)setTitle:(id)a3
{
  if (a3) {
    v4 = (__CFString *)a3;
  }
  else {
    v4 = &stru_1ED0E84C0;
  }
  id v6 = v4;
  if (!-[NSString isEqualToString:](self->_title, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_title, v4);
    [(_UINavigationBarLargeTitleViewLayout *)self->_layout _invalidateTitleHeightCache];
    effectiveTitle = self->__effectiveTitle;
    self->__effectiveTitle = 0;
  }
}

- (void)setProvidesExtraSpaceForExcessiveLineHeights:(BOOL)a3
{
  if (self->_providesExtraSpaceForExcessiveLineHeights != a3)
  {
    self->_providesExtraSpaceForExcessiveLineHeights = a3;
    [(_UINavigationBarLargeTitleViewLayout *)self->_layout _invalidateTitleHeightCache];
  }
}

- (void)setAlternateTitles:(id)a3
{
  v5 = (NSArray *)a3;
  if (self->_alternateTitles != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_alternateTitles, a3);
    [(_UINavigationBarLargeTitleViewLayout *)self->_layout _invalidateTitleHeightCache];
    effectiveTitle = self->__effectiveTitle;
    self->__effectiveTitle = 0;

    v5 = v7;
  }
}

- (void)setAlignAccessoryViewToTitleBaseline:(BOOL)a3
{
  self->_alignAccessoryViewToTitleBaseline = a3;
}

- (void)setAccessoryViewHorizontalAlignment:(unint64_t)a3
{
  self->_accessoryViewHorizontalAlignment = a3;
}

- (void)setAccessoryView:(id)a3
{
}

- (void)setAssistant:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_assistant);

  if (WeakRetained != obj)
  {
    [(_UINavigationBarLargeTitleView *)self _clearAssistants];
    objc_storeWeak((id *)&self->_assistant, obj);
    [(_UINavigationBarLargeTitleView *)self _setAssistants];
  }
}

- (_UINavigationBarLargeTitleView)initWithFrame:(CGRect)a3
{
  v13[2] = *MEMORY[0x1E4F143B8];
  v12.receiver = self;
  v12.super_class = (Class)_UINavigationBarLargeTitleView;
  BOOL v3 = -[UIView initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    uint64_t v5 = [(_UINavigationBarLargeTitleView *)v3 _newLayout];
    layout = v4->_layout;
    v4->_layout = (_UINavigationBarLargeTitleViewLayout *)v5;

    title = v4->_title;
    v4->_title = (NSString *)&stru_1ED0E84C0;

    titleAttributes = v4->_titleAttributes;
    v4->_titleAttributes = (NSDictionary *)MEMORY[0x1E4F1CC08];

    v13[0] = objc_opt_class();
    v13[1] = objc_opt_class();
    v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
    id v10 = [(UIView *)v4 registerForTraitChanges:v9 withAction:sel__contentSizeCategoryDidChange];
  }
  return v4;
}

- (id)_newLayout
{
  BOOL v3 = [_UINavigationBarLargeTitleViewLayout alloc];
  return [(_UINavigationBarLargeTitleViewLayout *)v3 initWithContentView:self];
}

- (void)_clearAssistants
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_assistant);
  [WeakRetained setAssistedView:0 identifier:@"LargeTitle.accessoryView"];
}

- (NSDictionary)effectiveTitleAttributes
{
  effectiveTitleAttributes = self->_effectiveTitleAttributes;
  if (!effectiveTitleAttributes)
  {
    uint64_t v4 = *(void *)off_1E52D2040;
    uint64_t v5 = [(NSDictionary *)self->_titleAttributes objectForKeyedSubscript:*(void *)off_1E52D2040];
    id v6 = [(UIView *)self traitCollection];
    v7 = [v5 _fontAdjustedForContentSizeCategoryCompatibleWithTraitCollection:v6];

    titleAttributes = self->_titleAttributes;
    if (v5 == v7)
    {
      v9 = titleAttributes;
    }
    else
    {
      v9 = (NSDictionary *)[(NSDictionary *)titleAttributes mutableCopy];
      [(NSDictionary *)v9 setObject:v7 forKeyedSubscript:v4];
    }
    id v10 = self->_effectiveTitleAttributes;
    self->_effectiveTitleAttributes = v9;

    effectiveTitleAttributes = self->_effectiveTitleAttributes;
  }
  return effectiveTitleAttributes;
}

- (void)layoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)_UINavigationBarLargeTitleView;
  [(UIView *)&v6 layoutSubviews];
  if (self->_alternateTitles)
  {
    if (self->__effectiveTitle)
    {
      BOOL v3 = [(_UINavigationBarLargeTitleView *)self _titleForCurrentWidth];
      char v4 = [v3 isEqualToString:self->__effectiveTitle];

      if ((v4 & 1) == 0)
      {
        effectiveTitle = self->__effectiveTitle;
        self->__effectiveTitle = 0;

        [(_UINavigationBarLargeTitleViewLayout *)self->_layout _invalidateTitleHeightCache];
        [(_UINavigationBarLargeTitleView *)self _updateContentAndInvalidate:0];
      }
    }
  }
  [(_UINavigationBarLargeTitleViewLayout *)self->_layout layoutViews];
}

- (double)restingHeightOfTitleView
{
  v2 = [(_UINavigationBarLargeTitleView *)self _layoutForMeasurement];
  [v2 titleRestingHeight];
  double v4 = v3;

  return v4;
}

- (id)_layoutForMeasurement
{
  layout = self->_layout;
  if (layout)
  {
    double v3 = layout;
  }
  else
  {
    transitionContext = self->_transitionContext;
    if (transitionContext)
    {
      uint64_t v5 = [(_UINavigationBarTransitionContext *)transitionContext toLayout];
      objc_super v6 = (void *)v5;
      if (v5) {
        v7 = *(void **)(v5 + 168);
      }
      else {
        v7 = 0;
      }
      double v3 = v7;
    }
    else
    {
      double v3 = 0;
    }
  }
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layout, 0);
  objc_storeStrong((id *)&self->_accessoryView, 0);
  objc_storeStrong((id *)&self->_titleAttributes, 0);
  objc_storeStrong((id *)&self->_alternateTitles, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_destroyWeak((id *)&self->_assistant);
  objc_storeStrong((id *)&self->_effectiveTitleAttributes, 0);
  objc_storeStrong((id *)&self->__effectiveTitle, 0);
  objc_storeStrong((id *)&self->_titleCandidates, 0);
}

- (void)safeAreaInsetsDidChange
{
  v20.receiver = self;
  v20.super_class = (Class)_UINavigationBarLargeTitleView;
  [(UIView *)&v20 safeAreaInsetsDidChange];
  uint64_t v3 = [(UIView *)self window];
  if (v3)
  {
    double v4 = (void *)v3;
    [(UIView *)self directionalLayoutMargins];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    [(_UINavigationBarLargeTitleViewLayout *)self->_layout layoutMargins];
    if (v8 == v16 && v6 == v13 && v12 == v15)
    {
      double v19 = v14;

      if (v10 == v19) {
        return;
      }
    }
    else
    {
    }
    [(_UINavigationBarLargeTitleView *)self _updateContentAndInvalidate:0];
    [(UIView *)self setNeedsLayout];
  }
}

- (UIView)accessibilityTitleView
{
  return (UIView *)[(_UINavigationBarLargeTitleViewLayout *)self->_layout titleLabel];
}

- (CGSize)intrinsicContentSize
{
  [(UIView *)self bounds];
  -[_UINavigationBarLargeTitleView sizeThatFits:](self, "sizeThatFits:", v3, v4);
  double v6 = -1.0;
  result.height = v5;
  result.width = v6;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3 titleType:(int64_t)a4
{
  double height = a3.height;
  double width = a3.width;
  double v7 = [(_UINavigationBarLargeTitleView *)self _layoutForMeasurement];
  objc_msgSend(v7, "sizeFittingSize:titleType:", a4, width, height);
  double v9 = v8;
  double v11 = v10;

  double v12 = v9;
  double v13 = v11;
  result.double height = v13;
  result.double width = v12;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[_UINavigationBarLargeTitleView sizeThatFits:titleType:](self, "sizeThatFits:titleType:", self->_titleType, a3.width, a3.height);
  result.double height = v4;
  result.double width = v3;
  return result;
}

- (id)_titleForCurrentWidth
{
  v2 = self;
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  [(UIView *)self bounds];
  double Width = CGRectGetWidth(v59);
  [(UIView *)v2 layoutMargins];
  double v5 = v4;
  [(UIView *)v2 layoutMargins];
  double v7 = v6;
  [(UIView *)v2->_accessoryView bounds];
  double v8 = CGRectGetWidth(v60);
  titleCandidates = v2->_titleCandidates;
  if (!titleCandidates)
  {
    double v43 = v5;
    double v44 = Width;
    double v10 = objc_alloc_init(UILabel);
    double v11 = v10;
    unint64_t twoLineMode = v2->_twoLineMode;
    double v13 = 0.0;
    if (twoLineMode <= 2)
    {
      double v13 = dbl_186B936E8[twoLineMode];
      [(UILabel *)v10 setNumberOfLines:qword_186B936D0[twoLineMode]];
    }
    double v14 = objc_opt_new();
    [v14 addObject:v2->_title];
    [v14 addObjectsFromArray:v2->_alternateTitles];
    double v15 = (NSArray *)objc_opt_new();
    v45 = v2;
    double v16 = [(_UINavigationBarLargeTitleView *)v2 effectiveTitleAttributes];
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    id obj = v14;
    uint64_t v17 = [obj countByEnumeratingWithState:&v51 objects:v56 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v52;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v52 != v19) {
            objc_enumerationMutation(obj);
          }
          uint64_t v21 = *(void *)(*((void *)&v51 + 1) + 8 * i);
          v22 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v21 attributes:v16];
          [(UILabel *)v11 setAttributedText:v22];

          -[UILabel textRectForBounds:limitedToNumberOfLines:](v11, "textRectForBounds:limitedToNumberOfLines:", [(UILabel *)v11 numberOfLines], 0.0, 0.0, 1.79769313e308, v13);
          CGFloat v24 = v23;
          CGFloat v26 = v25;
          CGFloat v28 = v27;
          CGFloat v30 = v29;
          v31 = objc_opt_new();
          [v31 setTitle:v21];
          v61.origin.x = v24;
          v61.origin.y = v26;
          v61.size.double width = v28;
          v61.size.double height = v30;
          [v31 setWidth:CGRectGetWidth(v61)];
          [(NSArray *)v15 addObject:v31];
        }
        uint64_t v18 = [obj countByEnumeratingWithState:&v51 objects:v56 count:16];
      }
      while (v18);
    }

    v2 = v45;
    v32 = v45->_titleCandidates;
    v45->_titleCandidates = v15;

    titleCandidates = v45->_titleCandidates;
    double v5 = v43;
    double Width = v44;
  }
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  v33 = titleCandidates;
  uint64_t v34 = [(NSArray *)v33 countByEnumeratingWithState:&v47 objects:v55 count:16];
  if (v34)
  {
    uint64_t v35 = v34;
    double v36 = Width - v5 - v7 - v8;
    uint64_t v37 = *(void *)v48;
LABEL_14:
    uint64_t v38 = 0;
    while (1)
    {
      if (*(void *)v48 != v37) {
        objc_enumerationMutation(v33);
      }
      v39 = *(NSArray **)(*((void *)&v47 + 1) + 8 * v38);
      [(NSArray *)v39 width];
      if (v40 <= v36) {
        break;
      }
      if (v35 == ++v38)
      {
        uint64_t v35 = [(NSArray *)v33 countByEnumeratingWithState:&v47 objects:v55 count:16];
        if (v35) {
          goto LABEL_14;
        }
        goto LABEL_20;
      }
    }
  }
  else
  {
LABEL_20:

    v39 = [(NSArray *)v2->_titleCandidates firstObject];
    v33 = v39;
  }
  v41 = [(NSArray *)v39 title];

  return v41;
}

- (void)_contentSizeCategoryDidChange
{
  effectiveTitleAttributes = self->_effectiveTitleAttributes;
  self->_effectiveTitleAttributes = 0;

  [(_UINavigationBarLargeTitleView *)self _updateContentAndInvalidate:1];
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    double v14 = 0;
    goto LABEL_15;
  }
  double v9 = [(_UINavigationBarLargeTitleViewLayout *)self->_layout accessoryView];
  [v7 request:v8 locationInView:v9];
  double v11 = v10;
  double v13 = v12;
  double v14 = 0;
  if (objc_msgSend(v9, "pointInside:withEvent:", 0))
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v15 = v9;
      if (!v15) {
        goto LABEL_12;
      }
    }
    else
    {
      double v16 = objc_msgSend(v9, "hitTest:withEvent:", 0, v11, v13);
      objc_opt_class();
      id v15 = 0;
      if (objc_opt_isKindOfClass()) {
        id v15 = v16;
      }

      if (!v15) {
        goto LABEL_12;
      }
    }
    if ([v15 isEnabled])
    {
      [v15 bounds];
      double v14 = objc_msgSend(v7, "createRegionFromRect:targetView:identifier:selected:", v15, @"com.apple.UIKit.UINavigationBar.LargeTitleView.UIButton", objc_msgSend(v15, "isSelected"), v17, v18, v19, v20);
LABEL_13:

      goto LABEL_14;
    }
LABEL_12:
    double v14 = 0;
    goto LABEL_13;
  }
LABEL_14:

LABEL_15:
  return v14;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = -[_UIPointerAssistantRegion targetViewAsButton]((uint64_t)v6);
    if (v7)
    {
      id v8 = [v5 createStyleForButton:v7 shapeProvider:0];
    }
    else
    {
      id v8 = 0;
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (void)pointerInteraction:(id)a3 willEnterRegion:(id)a4 animator:(id)a5
{
  id v6 = a5;
  -[_UIPointerAssistantRegion targetViewAsButton]((uint64_t)a4);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v7 = [v8 _visualProvider];
  [v7 pointerWillEnter:v6];
}

- (void)pointerInteraction:(id)a3 willExitRegion:(id)a4 animator:(id)a5
{
  id v6 = a5;
  -[_UIPointerAssistantRegion targetViewAsButton]((uint64_t)a4);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v7 = [v8 _visualProvider];
  [v7 pointerWillExit:v6];
}

- (void)recordFromStateForTransition:(id)a3
{
  layout = self->_layout;
  id v5 = (_UINavigationBarTransitionContext *)a3;
  id v6 = [(_UINavigationBarTransitionContext *)v5 fromLayout];
  [(_UINavigationBarLayout *)v6 setLargeTitleViewLayout:layout];

  self->_transitionContext = v5;
  id v7 = self->_layout;
  self->_layout = 0;

  [(_UINavigationBarLargeTitleView *)self _clearAssistants];
}

- (void)prepareToRecordToState:(id)a3
{
  id v6 = (_UINavigationBarTransitionContext *)a3;
  double v4 = [(_UINavigationBarLargeTitleView *)self _newLayout];
  if (!self->_transitionContext) {
    [(_UINavigationBarLargeTitleViewLayout *)self->_layout removeContent];
  }
  self->_transitionContext = v6;
  layout = self->_layout;
  self->_layout = v4;
}

- (void)recordToStateForTransition:(id)a3
{
  id v4 = a3;
  [(_UINavigationBarLargeTitleView *)self updateContent];
  layout = self->_layout;
  id v6 = [v4 toLayout];

  [(_UINavigationBarLayout *)v6 setLargeTitleViewLayout:layout];
  id v7 = self->_layout;
  self->_layout = 0;
}

- (void)clearTransitionContext
{
  if (self->_transitionContext)
  {
    if (!self->_layout)
    {
      double v3 = [[_UINavigationBarLargeTitleViewLayout alloc] initWithContentView:self];
      layout = self->_layout;
      self->_layout = v3;
    }
    self->_transitionContext = 0;
  }
}

- (void)adoptLayout:(id)a3
{
  id v6 = (_UINavigationBarLargeTitleViewLayout *)a3;
  if (!v6)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"_UINavigationBarLargeTitleView.m" lineNumber:445 description:@"Cannot adopt a nil layout!"];

    id v6 = 0;
  }
  layout = self->_layout;
  if (layout != v6)
  {
    double v9 = v6;
    [(_UINavigationBarLargeTitleViewLayout *)layout removeContent];
    objc_storeStrong((id *)&self->_layout, a3);
    [(_UINavigationBarLargeTitleViewLayout *)self->_layout setContentView:self];
    [(_UINavigationBarLargeTitleView *)self _setAssistants];
    id v6 = v9;
  }
  self->_transitionContext = 0;
}

- (void)adoptNewLayout
{
  if (!self->_layout)
  {
    double v3 = [(_UINavigationBarLargeTitleView *)self _newLayout];
    layout = self->_layout;
    self->_layout = v3;

    [(_UINavigationBarLargeTitleView *)self updateContent];
  }
}

- (_UIPointerInteractionAssistant)assistant
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_assistant);
  return (_UIPointerInteractionAssistant *)WeakRetained;
}

- (int64_t)titleType
{
  return self->_titleType;
}

- (NSString)title
{
  return self->_title;
}

- (NSArray)alternateTitles
{
  return self->_alternateTitles;
}

- (NSDictionary)titleAttributes
{
  return self->_titleAttributes;
}

- (unint64_t)twoLineMode
{
  return self->_twoLineMode;
}

- (BOOL)providesExtraSpaceForExcessiveLineHeights
{
  return self->_providesExtraSpaceForExcessiveLineHeights;
}

- (UIView)accessoryView
{
  return self->_accessoryView;
}

- (BOOL)alignAccessoryViewToTitleBaseline
{
  return self->_alignAccessoryViewToTitleBaseline;
}

- (unint64_t)accessoryViewHorizontalAlignment
{
  return self->_accessoryViewHorizontalAlignment;
}

@end