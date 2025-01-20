@interface _UICalendarDateViewCell
+ (id)reuseIdentifier;
- (UICalendarView)calendarView;
- (_UICalendarDateViewCell)initWithFrame:(CGRect)a3;
- (id)_currentCellState;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4;
- (unint64_t)selectionRoundedEdge;
- (void)_updateBackgroundView;
- (void)_updateFontDesign;
- (void)_updateForPreferredContentSizeCategoryChange;
- (void)_updateLabelColor;
- (void)configureWithDay:(id)a3 formatter:(id)a4 fontDesign:(id)a5 decorations:(id)a6 outOfRange:(BOOL)a7 renderOverhangDays:(BOOL)a8 highlightsToday:(BOOL)a9;
- (void)layoutSubviews;
- (void)setCalendarView:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setSelected:(BOOL)a3;
- (void)setSelectionRoundedEdge:(unint64_t)a3;
- (void)tintColorDidChange;
@end

@implementation _UICalendarDateViewCell

+ (id)reuseIdentifier
{
  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (_UICalendarDateViewCell)initWithFrame:(CGRect)a3
{
  v21[2] = *MEMORY[0x1E4F143B8];
  v20.receiver = self;
  v20.super_class = (Class)_UICalendarDateViewCell;
  v3 = -[UICollectionViewCell initWithFrame:](&v20, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(UICollectionViewCell *)v3 setAutomaticallyUpdatesBackgroundConfiguration:0];
    [(UICollectionViewCell *)v4 setAutomaticallyUpdatesContentConfiguration:0];
    v5 = [[UIPointerInteraction alloc] initWithDelegate:v4];
    [(UIView *)v4 addInteraction:v5];
    objc_storeStrong((id *)&v4->_pointerInteraction, v5);
    uint64_t v6 = objc_opt_new();
    labelContentView = v4->_labelContentView;
    v4->_labelContentView = (UIView *)v6;

    v8 = [(UICollectionViewCell *)v4 contentView];
    [v8 addSubview:v4->_labelContentView];

    uint64_t v9 = objc_opt_new();
    backgroundView = v4->_backgroundView;
    v4->_backgroundView = (UIVisualEffectView *)v9;

    v11 = [(UIView *)v4->_backgroundView layer];
    [v11 setAllowsEdgeAntialiasing:1];

    [(UIView *)v4->_labelContentView addSubview:v4->_backgroundView];
    uint64_t v12 = objc_opt_new();
    decorationContentView = v4->_decorationContentView;
    v4->_decorationContentView = (UIView *)v12;

    [(UIView *)v4->_decorationContentView setClipsToBounds:1];
    [(UIView *)v4->_decorationContentView setUserInteractionEnabled:0];
    v14 = [(UICollectionViewCell *)v4 contentView];
    [v14 addSubview:v4->_decorationContentView];

    uint64_t v15 = objc_opt_new();
    dayLabel = v4->_dayLabel;
    v4->_dayLabel = (UILabel *)v15;

    [(UILabel *)v4->_dayLabel setTextAlignment:1];
    [(UIView *)v4->_labelContentView addSubview:v4->_dayLabel];
    [(_UICalendarDateViewCell *)v4 _updateForPreferredContentSizeCategoryChange];
    v21[0] = objc_opt_class();
    v21[1] = objc_opt_class();
    v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:2];
    id v18 = [(UIView *)v4 registerForTraitChanges:v17 withAction:sel__updateForPreferredContentSizeCategoryChange];
  }
  return v4;
}

- (void)layoutSubviews
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  v70.receiver = self;
  v70.super_class = (Class)_UICalendarDateViewCell;
  [(UICollectionViewCell *)&v70 layoutSubviews];
  BOOL v3 = (*(unsigned char *)&self->_flags & 0x10) != 0 || self->_selectionRoundedEdge != 3;
  BOOL v58 = v3;
  BOOL v4 = self->_decorations == 0;
  [(UIView *)self bounds];
  remainder.origin.x = v5;
  remainder.origin.y = v6;
  remainder.size.width = v7;
  remainder.size.double height = v8;
  if (!v4)
  {
    CGSize v56 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
    CGPoint v57 = (CGPoint)*MEMORY[0x1E4F1DB28];
    slice.origin = (CGPoint)*MEMORY[0x1E4F1DB28];
    slice.size = v56;
    uint64_t v9 = [(UIView *)self traitCollection];
    +[UICalendarViewDecoration _referenceHeightForTraitCollection:v9];
    double v11 = v10;

    CGRectDivide(remainder, &slice, &remainder, v11 + 2.0, CGRectMaxYEdge);
    CGRect v76 = CGRectInset(slice, 2.0, 0.0);
    -[UIView setFrame:](self->_decorationContentView, "setFrame:", v76.origin.x, v76.origin.y, v76.size.width, v76.size.height);
    if ([(NSArray *)self->_decorations count])
    {
      uint64_t v64 = 0;
      v65 = (double *)&v64;
      uint64_t v66 = 0x2020000000;
      uint64_t v67 = 0;
      decorations = self->_decorations;
      v59[0] = MEMORY[0x1E4F143A8];
      v59[1] = 3221225472;
      CGRect v63 = slice;
      v60 = __41___UICalendarDateViewCell_layoutSubviews__block_invoke;
      v61 = &unk_1E530CED8;
      v62 = &v64;
      v13 = decorations;
      v14 = v59;
      uint64_t v15 = v13;
      v16 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[NSArray count](v15, "count"));
      long long v72 = 0u;
      long long v73 = 0u;
      memset(&v71, 0, sizeof(v71));
      v17 = v15;
      uint64_t v18 = [(NSArray *)v17 countByEnumeratingWithState:&v71 objects:&v74 count:16];
      if (v18)
      {
        uint64_t v19 = **(void **)&v71.size.width;
        do
        {
          for (uint64_t i = 0; i != v18; ++i)
          {
            if (**(void **)&v71.size.width != v19) {
              objc_enumerationMutation(v17);
            }
            v21 = v60((uint64_t)v14, *(void **)(*(void *)&v71.origin.y + 8 * i));
            if (v21) {
              [v16 addObject:v21];
            }
          }
          uint64_t v18 = [(NSArray *)v17 countByEnumeratingWithState:&v71 objects:&v74 count:16];
        }
        while (v18);
      }

      v22 = (void *)[v16 copy];
      uint64_t v23 = [v22 count];
      CGFloat v24 = (double)(unint64_t)(v23 - 1) + (double)(unint64_t)(v23 - 1) + v65[3];
      v65[3] = v24;
      double height = slice.size.height;
      [(UIView *)self->_decorationContentView bounds];
      v74.origin.x = v28 + (v26 - v24) * 0.5;
      v74.origin.y = v29 + (v27 - height) * 0.5;
      v74.size.width = v24;
      v74.size.double height = height;
      v71.origin = v57;
      v71.size = v56;
      v30 = +[UIScreen mainScreen];
      [v30 scale];
      double v32 = v31;

      for (unint64_t j = 0; j < [v22 count]; ++j)
      {
        v34 = [v22 objectAtIndex:j];
        [v34 bounds];
        CGRectDivide(v74, &v71, &v74, v35, CGRectMinXEdge);
        [v34 bounds];
        v71.size.double height = v36;
        objc_msgSend(v34, "setFrame:", UIRectCenteredYInRectScale(v71.origin.x, v71.origin.y, v71.size.width, v36, v74.origin.x, v74.origin.y, v74.size.width, v74.size.height, v32));
      }
      _Block_object_dispose(&v64, 8);
    }
  }
  -[UIView setFrame:](self->_labelContentView, "setFrame:");
  dayLabel = self->_dayLabel;
  [(UIView *)self bounds];
  -[UILabel sizeThatFits:](dayLabel, "sizeThatFits:", v38, v39);
  -[UILabel setFrame:](self->_dayLabel, "setFrame:", remainder.origin.x + (remainder.size.width - v40) * 0.5, remainder.origin.y + (remainder.size.height - v41) * 0.5);
  v42 = [(UIView *)self traitCollection];
  v43 = _UICalendarViewGetPlatformMetrics([v42 userInterfaceIdiom]);

  [v43 dateViewCellBackgroundSize];
  double v45 = fmin(v44, fmin(remainder.size.width, remainder.size.height));
  p_unint64_t selectionRoundedEdge = &self->_selectionRoundedEdge;
  unint64_t selectionRoundedEdge = self->_selectionRoundedEdge;
  double v48 = -0.0;
  if (selectionRoundedEdge) {
    double v49 = -0.0;
  }
  else {
    double v49 = (remainder.size.width - v45) * 0.5;
  }
  double v50 = v45 + v49;
  double v51 = 0.0;
  if ((selectionRoundedEdge & 1) == 0) {
    double v51 = (remainder.size.width - v45) * 0.5;
  }
  if ((selectionRoundedEdge & 2) == 0) {
    double v48 = (remainder.size.width - v45) * 0.5;
  }
  p_backgroundView = &self->_backgroundView;
  -[UIView setFrame:](self->_backgroundView, "setFrame:", remainder.origin.x + (remainder.size.width - v45) * 0.5 - v51, remainder.origin.y + (remainder.size.height - v45) * 0.5, v48 + v50, v45);
  if ((*p_selectionRoundedEdge & 2) != 0) {
    uint64_t v53 = ((uint64_t)(*p_selectionRoundedEdge << 63) >> 63) & 5 | 0xA;
  }
  else {
    uint64_t v53 = ((uint64_t)(*p_selectionRoundedEdge << 63) >> 63) & 5;
  }
  v54 = [(UIView *)*p_backgroundView layer];
  [v54 setMaskedCorners:v53];

  double v55 = v45 * 0.5;
  if (v58) {
    double v55 = 10.0;
  }
  [(UIVisualEffectView *)*p_backgroundView _setCornerRadius:v55];
}

- (void)tintColorDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)_UICalendarDateViewCell;
  [(UIView *)&v3 tintColorDidChange];
  [(_UICalendarDateViewCell *)self _updateLabelColor];
}

- (void)configureWithDay:(id)a3 formatter:(id)a4 fontDesign:(id)a5 decorations:(id)a6 outOfRange:(BOOL)a7 renderOverhangDays:(BOOL)a8 highlightsToday:(BOOL)a9
{
  BOOL v9 = a8;
  BOOL v10 = a7;
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v52 = a4;
  id v51 = a5;
  id v16 = a6;
  if (v10) {
    char v17 = 2;
  }
  else {
    char v17 = 0;
  }
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFD | v17;
  if ([v15 isToday]) {
    char v18 = 4;
  }
  else {
    char v18 = 0;
  }
  char v19 = *(unsigned char *)&self->_flags & 0xFB | v18;
  *(unsigned char *)&self->_char flags = v19;
  BOOL v50 = v9;
  if (v9)
  {
    objc_super v20 = [v15 assignedMonth];
    *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFE | (v20 != 0);

    char flags = (char)self->_flags;
  }
  else
  {
    char flags = v19 & 0xFE;
  }
  if (a9) {
    char v22 = 8;
  }
  else {
    char v22 = 0;
  }
  *(unsigned char *)&self->_char flags = flags & 0xF7 | v22;
  objc_storeStrong((id *)&self->_fontDesign, a5);
  p_decorations = &self->_decorations;
  if (([(NSArray *)self->_decorations isEqual:v16] & 1) == 0)
  {
    obuint64_t j = a6;
    id v49 = v15;
    CGFloat v24 = [(_UICalendarDateViewCell *)self calendarView];
    v25 = [v24 decorationSystem];

    long long v59 = 0u;
    long long v60 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    double v26 = *p_decorations;
    uint64_t v27 = [(NSArray *)v26 countByEnumeratingWithState:&v57 objects:v62 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v58;
      do
      {
        for (uint64_t i = 0; i != v28; ++i)
        {
          if (*(void *)v58 != v29) {
            objc_enumerationMutation(v26);
          }
          double v31 = *(void **)(*((void *)&v57 + 1) + 8 * i);
          double v32 = [v31 _parent];

          if (v32 == self)
          {
            [v25 invalidateDecoration:v31];
            [v31 _setParent:0];
          }
        }
        uint64_t v28 = [(NSArray *)v26 countByEnumeratingWithState:&v57 objects:v62 count:16];
      }
      while (v28);
    }

    objc_storeStrong((id *)p_decorations, obj);
    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    v33 = *p_decorations;
    uint64_t v34 = [(NSArray *)v33 countByEnumeratingWithState:&v53 objects:v61 count:16];
    id v15 = v49;
    if (v34)
    {
      uint64_t v35 = v34;
      uint64_t v36 = *(void *)v54;
      do
      {
        for (uint64_t j = 0; j != v35; ++j)
        {
          if (*(void *)v54 != v36) {
            objc_enumerationMutation(v33);
          }
          double v38 = *(void **)(*((void *)&v53 + 1) + 8 * j);
          [v25 configureDecoration:v38];
          [v38 _setParent:self];
          decorationContentView = self->_decorationContentView;
          double v40 = [v38 _decorationView];
          [(UIView *)decorationContentView addSubview:v40];
        }
        uint64_t v35 = [(NSArray *)v33 countByEnumeratingWithState:&v53 objects:v61 count:16];
      }
      while (v35);
    }
  }
  double v41 = [v15 assignedMonth];
  if (v41) {
    uint64_t v42 = v50;
  }
  else {
    uint64_t v42 = 1;
  }

  if (v42)
  {
    v43 = [v15 date];
    double v44 = v52;
    double v45 = [v52 stringFromDate:v43];
    [(UILabel *)self->_dayLabel setText:v45];
  }
  else
  {
    [(UILabel *)self->_dayLabel setText:0];
    double v44 = v52;
  }
  [(UIView *)self->_decorationContentView setHidden:v42 ^ 1];
  if (v50)
  {
    v46 = [v15 assignedMonth];
    double v47 = 0.25;
    if (!v46) {
      double v47 = 1.0;
    }
    [(UIView *)self->_decorationContentView setAlpha:v47];
  }
  else
  {
    [(UIView *)self->_decorationContentView setAlpha:1.0];
  }
  [(UIPointerInteraction *)self->_pointerInteraction setEnabled:v42];
  [(_UICalendarDateViewCell *)self _updateFontDesign];
  [(_UICalendarDateViewCell *)self _updateLabelColor];
  [(_UICalendarDateViewCell *)self _updateBackgroundView];
  [(UIView *)self setNeedsLayout];
}

- (void)setSelected:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_UICalendarDateViewCell;
  [(UICollectionViewCell *)&v4 setSelected:a3];
  [(_UICalendarDateViewCell *)self _updateFontDesign];
  [(_UICalendarDateViewCell *)self _updateLabelColor];
  [(_UICalendarDateViewCell *)self _updateBackgroundView];
  [(UIView *)self setNeedsLayout];
  [(UIPointerInteraction *)self->_pointerInteraction invalidate];
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_UICalendarDateViewCell;
  -[UICollectionViewCell setHighlighted:](&v14, sel_setHighlighted_);
  [(_UICalendarDateViewCell *)self _updateFontDesign];
  [(_UICalendarDateViewCell *)self _updateLabelColor];
  [(_UICalendarDateViewCell *)self _updateBackgroundView];
  CGFloat v5 = [(UIView *)self traitCollection];
  CGFloat v6 = _UICalendarViewGetPlatformMetrics([v5 userInterfaceIdiom]);

  if (v3)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __42___UICalendarDateViewCell_setHighlighted___block_invoke;
    v12[3] = &unk_1E52D9F98;
    CGFloat v7 = &v13;
    v12[4] = self;
    v13 = v6;
    id v8 = v6;
    +[UIView animateWithDuration:2 delay:v12 options:0 animations:0.1 completion:0.0];
  }
  else
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __42___UICalendarDateViewCell_setHighlighted___block_invoke_2;
    v10[3] = &unk_1E52D9F98;
    CGFloat v7 = &v11;
    v10[4] = self;
    double v11 = v6;
    id v9 = v6;
    +[UIView animateWithDuration:0 delay:v10 usingSpringWithDamping:0 initialSpringVelocity:0.7 options:0.0 animations:0.7 completion:0.0];
  }
}

- (void)_updateLabelColor
{
  BOOL v3 = [(UIView *)self traitCollection];
  _UICalendarViewGetPlatformMetrics([v3 userInterfaceIdiom]);
  id v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_super v4 = [(_UICalendarDateViewCell *)self _currentCellState];
  CGFloat v5 = [v7 dateCellForegroundColorProvider];
  CGFloat v6 = ((void (**)(void, void *))v5)[2](v5, v4);
  [(UILabel *)self->_dayLabel setTextColor:v6];
}

- (void)_updateBackgroundView
{
  BOOL v3 = [(UIView *)self traitCollection];
  _UICalendarViewGetPlatformMetrics([v3 userInterfaceIdiom]);
  id v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_super v4 = [(_UICalendarDateViewCell *)self _currentCellState];
  -[UIView setHidden:](self->_backgroundView, "setHidden:", [v4 isOutOfRange]);
  CGFloat v5 = [v8 dateCellBackgroundColorProvider];
  CGFloat v6 = ((void (**)(void, void *))v5)[2](v5, v4);
  id v7 = [(UIVisualEffectView *)self->_backgroundView contentView];
  [v7 setBackgroundColor:v6];
}

- (void)_updateFontDesign
{
  BOOL v3 = [(UIView *)self traitCollection];
  _UICalendarViewGetPlatformMetrics([v3 userInterfaceIdiom]);
  id v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_super v4 = [(_UICalendarDateViewCell *)self _currentCellState];
  CGFloat v5 = [v9 dateCellFontProvider];
  fontDesign = self->_fontDesign;
  id v7 = [(UIView *)self traitCollection];
  id v8 = ((void (**)(void, void *, NSString *, void *))v5)[2](v5, v4, fontDesign, v7);
  [(UILabel *)self->_dayLabel setFont:v8];
}

- (void)_updateForPreferredContentSizeCategoryChange
{
  BOOL v3 = [(UIView *)self traitCollection];
  category = [v3 preferredContentSizeCategory];

  if (UIContentSizeCategoryIsAccessibilityCategory(category)) {
    char v4 = 16;
  }
  else {
    char v4 = 0;
  }
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xEF | v4;
  [(_UICalendarDateViewCell *)self _updateFontDesign];
  [(_UICalendarDateViewCell *)self _updateBackgroundView];
}

- (id)_currentCellState
{
  BOOL v3 = [_UICalendarDateViewCellState alloc];
  char v4 = [(UIView *)self traitCollection];
  CGFloat v5 = [(_UICalendarDateViewCellState *)v3 initWithTraits:v4];

  [(_UICalendarDateViewCellState *)v5 setOutOfRange:(*(unsigned char *)&self->_flags >> 1) & 1];
  [(_UICalendarDateViewCellState *)v5 setOverhangMonth:*(unsigned char *)&self->_flags & 1];
  [(_UICalendarDateViewCellState *)v5 setHighlightsToday:(*(unsigned char *)&self->_flags >> 3) & 1];
  [(_UICalendarDateViewCellState *)v5 setToday:(*(unsigned char *)&self->_flags >> 2) & 1];
  [(_UICalendarDateViewCellState *)v5 setSelected:[(UICollectionViewCell *)self isSelected]];
  [(_UICalendarDateViewCellState *)v5 setHighlighted:[(UICollectionViewCell *)self isHighlighted]];
  [(_UICalendarDateViewCellState *)v5 setForceEmphasizedFont:0];
  return v5;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  [(UIView *)self->_backgroundView bounds];
  double v6 = v5;
  [(UIView *)self->_labelContentView bounds];
  double v9 = v8 + (v7 - v6) * 0.5;
  double v12 = v11 + (v10 - v6) * 0.5;
  [(UIVisualEffectView *)self->_backgroundView _cornerRadius];
  double v14 = v13;
  id v15 = objc_opt_new();
  id v16 = +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", v9, v12, v6, v6, v14);
  [v15 setShadowPath:v16];

  char v17 = +[UIColor systemBackgroundColor];
  [v15 setBackgroundColor:v17];

  char v18 = [[UITargetedPreview alloc] initWithView:self->_labelContentView parameters:v15];
  BOOL v19 = [(UICollectionViewCell *)self isSelected];
  objc_super v20 = off_1E52D43F0;
  if (!v19) {
    objc_super v20 = off_1E52D43D8;
  }
  v21 = [(__objc2_class *)*v20 effectWithPreview:v18];
  labelContentView = self->_labelContentView;
  uint64_t v23 = [(UICollectionViewCell *)self contentView];
  -[UIView convertRect:toView:](labelContentView, "convertRect:toView:", v23, v9, v12, v6, v6);
  CGFloat v24 = +[UIPointerShape shapeWithRoundedRect:cornerRadius:](UIPointerShape, "shapeWithRoundedRect:cornerRadius:");

  v25 = +[UIPointerStyle styleWithEffect:v21 shape:v24];

  return v25;
}

- (unint64_t)selectionRoundedEdge
{
  return self->_selectionRoundedEdge;
}

- (void)setSelectionRoundedEdge:(unint64_t)a3
{
  self->_unint64_t selectionRoundedEdge = a3;
}

- (UICalendarView)calendarView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_calendarView);
  return (UICalendarView *)WeakRetained;
}

- (void)setCalendarView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_calendarView);
  objc_storeStrong((id *)&self->_labelContentView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_decorationContentView, 0);
  objc_storeStrong((id *)&self->_dayLabel, 0);
  objc_storeStrong((id *)&self->_decorations, 0);
  objc_storeStrong((id *)&self->_fontDesign, 0);
  objc_storeStrong((id *)&self->_pointerInteraction, 0);
}

@end