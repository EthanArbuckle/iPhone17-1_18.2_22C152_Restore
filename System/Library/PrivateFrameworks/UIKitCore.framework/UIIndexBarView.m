@interface UIIndexBarView
+ (id)_visualStyleForIdiom:(uint64_t)a1;
+ (id)visualStyleForIndexBarView:(id)a3;
+ (void)makeIndexBarView:(id *)a3 containerView:(id *)a4 forTraits:(id)a5;
+ (void)registerVisualStyle:(Class)a3 forIdiom:(int64_t)a4;
- (BOOL)_accessibilityHUDGestureManager:(id)a3 canCancelGestureRecognizer:(id)a4;
- (BOOL)_accessibilityHUDGestureManager:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)_accessibilityHUDGestureManagerCancelsTouchesInView:(id)a3;
- (BOOL)_canDrawContent;
- (BOOL)_defaultCanBecomeFocused;
- (BOOL)_didSelectEntry:(id)a3 atIndex:(int64_t)a4 location:(CGPoint)a5;
- (BOOL)_selectEntry:(id)a3 atIndex:(int64_t)a4;
- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (BOOL)canBecomeFocused;
- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (CGPoint)trackingStartLocationInWindow;
- (CGRect)effectiveBounds;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSArray)displayEntries;
- (NSArray)entries;
- (UIAccessibilityHUDGestureManager)axHUDGestureManager;
- (UIColor)indexColor;
- (UIColor)nonTrackingBackgroundColor;
- (UIColor)trackingBackgroundColor;
- (UIEdgeInsets)drawingInsets;
- (UIIndexBarView)initWithFrame:(CGRect)a3;
- (UIIndexBarViewDelegate)delegate;
- (UIIndexBarVisualStyle)visualStyle;
- (UISelectionFeedbackGenerator)selectionFeedbackGenerator;
- (double)cachedDisplayHighlightedIndex;
- (double)deflection;
- (double)displayHighlightedIndex;
- (double)highlightedIndex;
- (id)_accessibilityHUDGestureManager:(id)a3 HUDItemForPoint:(CGPoint)a4;
- (id)backgroundColor;
- (int64_t)highlightStyle;
- (unint64_t)drawingInsetsMask;
- (void)_handleTouches:(id)a3 withEvent:(id)a4;
- (void)_horizontalSizeClassDidChange;
- (void)_legibilityWeightOrPreferredContentSizeTraitsDidChange;
- (void)_setupAXHUDGestureIfNecessary;
- (void)_updateBackgroundColor;
- (void)_updateDisplayEntries;
- (void)_userInteractionStarted;
- (void)_userInteractionStopped;
- (void)cancelTrackingWithEvent:(id)a3;
- (void)didMoveToWindow;
- (void)drawRect:(CGRect)a3;
- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (void)layoutSubviews;
- (void)resetDeflection:(BOOL)a3;
- (void)setAxHUDGestureManager:(id)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setCachedDisplayHighlightedIndex:(double)a3;
- (void)setDeflection:(double)a3;
- (void)setDelegate:(id)a3;
- (void)setDisplayEntries:(id)a3;
- (void)setDrawingInsets:(UIEdgeInsets)a3;
- (void)setDrawingInsetsMask:(unint64_t)a3;
- (void)setEntries:(id)a3;
- (void)setFrame:(CGRect)a3;
- (void)setHighlightStyle:(int64_t)a3;
- (void)setHighlightedIndex:(double)a3;
- (void)setIndexColor:(id)a3;
- (void)setNonTrackingBackgroundColor:(id)a3;
- (void)setSelectionFeedbackGenerator:(id)a3;
- (void)setTrackingBackgroundColor:(id)a3;
- (void)setTrackingStartLocationInWindow:(CGPoint)a3;
- (void)setVisualStyle:(id)a3;
- (void)tintColorDidChange;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation UIIndexBarView

- (void)didMoveToWindow
{
  v3.receiver = self;
  v3.super_class = (Class)UIIndexBarView;
  [(UIView *)&v3 didMoveToWindow];
  [(UIIndexBarView *)self _setupAXHUDGestureIfNecessary];
}

- (void)_setupAXHUDGestureIfNecessary
{
  if (!self->_axHUDGestureManager)
  {
    if (dyld_program_sdk_at_least())
    {
      objc_super v3 = [(UIView *)self traitCollection];
      int v4 = [v3 _isLargeContentViewerEnabled];

      if (v4)
      {
        v5 = [[UIAccessibilityHUDGestureManager alloc] initWithView:self delegate:self];
        axHUDGestureManager = self->_axHUDGestureManager;
        self->_axHUDGestureManager = v5;
      }
    }
  }
}

- (void)layoutSubviews
{
  if ((*(_WORD *)&self->_visualStyleImplements & 0x40) != 0)
  {
    id v2 = [(UIIndexBarView *)self visualStyle];
    [v2 layoutSubviews];
  }
  else
  {
    v3.receiver = self;
    v3.super_class = (Class)UIIndexBarView;
    [(UIView *)&v3 layoutSubviews];
  }
}

- (void)drawRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if ((*(_WORD *)&self->_visualStyleImplements & 0x80) != 0)
  {
    id v7 = [(UIIndexBarView *)self visualStyle];
    objc_msgSend(v7, "drawRect:", x, y, width, height);
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)UIIndexBarView;
    -[UIView drawRect:](&v8, sel_drawRect_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  }
}

- (BOOL)_canDrawContent
{
  return (*(_WORD *)&self->_visualStyleImplements >> 7) & 1;
}

uint64_t __39__UIIndexBarView__updateDisplayEntries__block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __39__UIIndexBarView__updateDisplayEntries__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v5 = *(void **)(a1 + 32);
  id v6 = a2;
  id v7 = [v5 visualStyle];
  id v11 = [v7 displayEntryFromEntry:v6];

  [v11 setEntryIndex:a3];
  ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  objc_msgSend(v11, "setDisplayEntryIndex:");
  objc_super v8 = [*(id *)(a1 + 32) visualStyle];
  [v8 renderingHeightForDisplayEntry:v11];

  UIRoundToViewScale(*(void **)(a1 + 32));
  double v10 = v9;
  [*(id *)(a1 + 40) addObject:v11];
  *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v10
                                                              + *(double *)(a1 + 64)
                                                              + *(double *)(*(void *)(*(void *)(a1 + 56) + 8)
                                                                          + 24);
}

- (UIIndexBarVisualStyle)visualStyle
{
  return self->_visualStyle;
}

- (void)setDrawingInsets:(UIEdgeInsets)a3
{
  if (a3.left != self->_drawingInsets.left
    || a3.top != self->_drawingInsets.top
    || a3.right != self->_drawingInsets.right
    || a3.bottom != self->_drawingInsets.bottom)
  {
    self->_drawingInsets = a3;
    [(UIIndexBarView *)self _updateDisplayEntries];
  }
}

- (void)setDelegate:(id)a3
{
}

- (void)setEntries:(id)a3
{
  v5 = (NSArray *)a3;
  if (self->_entries != v5)
  {
    id v7 = v5;
    objc_storeStrong((id *)&self->_entries, a3);
    self->_cachedDisplayHighlightedIndedouble x = -1.0;
    if (*(_WORD *)&self->_visualStyleImplements)
    {
      id v6 = [(UIIndexBarView *)self visualStyle];
      [v6 entriesUpdated];
    }
    [(UIIndexBarView *)self _updateDisplayEntries];
    v5 = v7;
  }
}

- (void)tintColorDidChange
{
  v4.receiver = self;
  v4.super_class = (Class)UIIndexBarView;
  [(UIView *)&v4 tintColorDidChange];
  if (!self->_indexColor && (*(_WORD *)&self->_visualStyleImplements & 0x2000) != 0)
  {
    objc_super v3 = [(UIIndexBarView *)self visualStyle];
    [v3 indexColorUpdated];
  }
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v17.receiver = self;
  v17.super_class = (Class)UIIndexBarView;
  [(UIView *)&v17 frame];
  v19.origin.double x = v8;
  v19.origin.double y = v9;
  double v11 = v10;
  double v13 = v12;
  v18.origin.double x = x;
  v18.origin.double y = y;
  v18.size.double width = width;
  v18.size.double height = height;
  v19.size.double width = v11;
  v19.size.double height = v13;
  if (!CGRectEqualToRect(v18, v19))
  {
    v16.receiver = self;
    v16.super_class = (Class)UIIndexBarView;
    -[UIView setFrame:](&v16, sel_setFrame_, x, y, width, height);
    if (width != v11 || height != v13)
    {
      if ((*(_WORD *)&self->_visualStyleImplements & 4) != 0)
      {
        v15 = [(UIIndexBarView *)self visualStyle];
        [v15 sizeUpdated];
      }
      [(UIIndexBarView *)self _updateDisplayEntries];
    }
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v5 = [(UIIndexBarView *)self visualStyle];
  objc_msgSend(v5, "sizeThatFits:", width, height);
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.double height = v11;
  result.double width = v10;
  return result;
}

- (void)_updateDisplayEntries
{
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  if (![(NSArray *)self->_entries count]
    || ([(UIIndexBarView *)self effectiveBounds], CGRectIsEmpty(v83)))
  {
LABEL_3:
    uint64_t v3 = MEMORY[0x1E4F1CBF0];
    [(UIIndexBarView *)self setDisplayEntries:v3];
    return;
  }
  objc_super v4 = [(UIIndexBarView *)self visualStyle];
  [v4 minLineHeight];
  double v6 = v5;

  if (v6 <= 0.0)
  {
    if (os_variant_has_internal_diagnostics())
    {
      v44 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_FAULT))
      {
        v45 = [(UIIndexBarView *)self visualStyle];
        *(_DWORD *)buf = 138412546;
        *(void *)&buf[4] = self;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v45;
        _os_log_fault_impl(&dword_1853B0000, v44, OS_LOG_TYPE_FAULT, "UIIndexBarView visual style returned line height <= 0.0. Index bar view: %@; Visual style: %@",
          buf,
          0x16u);
      }
    }
    else
    {
      double v12 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_updateDisplayEntries___s_category) + 8);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        double v13 = v12;
        v14 = [(UIIndexBarView *)self visualStyle];
        *(_DWORD *)buf = 138412546;
        *(void *)&buf[4] = self;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v14;
        _os_log_impl(&dword_1853B0000, v13, OS_LOG_TYPE_ERROR, "UIIndexBarView visual style returned line height <= 0.0. Index bar view: %@; Visual style: %@",
          buf,
          0x16u);
      }
    }
    [(UIIndexBarView *)self setDisplayEntries:MEMORY[0x1E4F1CBF0]];
  }
  else
  {
    char v7 = [(UIIndexBarView *)self drawingInsetsMask];
    [(UIIndexBarView *)self effectiveBounds];
    double v9 = v8;
    unint64_t v10 = vcvtmd_u64_f64(v8 / v6);
    if ([(NSArray *)self->_entries count] <= v10)
    {
      if ((v7 & 1) == 0)
      {
        [(UIIndexBarView *)self drawingInsets];
        double v9 = v9 - v15;
        unint64_t v16 = vcvtmd_u64_f64(v9 / v6);
        if ([(NSArray *)self->_entries count] <= v16)
        {
          [(UIIndexBarView *)self setDrawingInsetsMask:[(UIIndexBarView *)self drawingInsetsMask] | 1];
          unint64_t v10 = v16;
        }
      }
    }
    else if (v7)
    {
      [(UIIndexBarView *)self setDrawingInsetsMask:[(UIIndexBarView *)self drawingInsetsMask] & 0xFFFFFFFFFFFFFFFELL];
      [(UIIndexBarView *)self drawingInsets];
      double v9 = v9 + v11;
      unint64_t v10 = vcvtmd_u64_f64(v9 / v6);
    }
    NSUInteger v17 = [(NSArray *)self->_entries count];
    if (v10 > v17)
    {
      NSUInteger v17 = [(NSArray *)self->_entries count];
      unint64_t v10 = v17;
    }
    if (!v10) {
      goto LABEL_3;
    }
    id v21 = 0;
    uint64_t v73 = 0;
    v74 = (double *)&v73;
    uint64_t v75 = 0x2020000000;
    uint64_t v76 = 0;
    v48 = v57;
    v49 = v61;
    v46 = v53;
    v47 = v55;
    while (1)
    {
      context = (void *)MEMORY[0x18C108260](v17, v18, v19, v20);
      v22 = [(UIIndexBarView *)self visualStyle];
      [v22 lineSpacing];
      double v24 = v23;

      v74[3] = 0.0;
      v25 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v10];

      v72[0] = 0;
      v72[1] = v72;
      v72[2] = 0x2020000000;
      v72[3] = 0;
      v64[0] = MEMORY[0x1E4F143A8];
      v64[1] = 3221225472;
      v65 = __39__UIIndexBarView__updateDisplayEntries__block_invoke;
      v66 = &unk_1E530F300;
      v67 = self;
      v69 = v72;
      id v21 = v25;
      id v68 = v21;
      v70 = &v73;
      double v71 = v24;
      if (v10 >= [(NSArray *)self->_entries count])
      {
        entries = self->_entries;
        v51[0] = MEMORY[0x1E4F143A8];
        v51[1] = 3221225472;
        v51[2] = __39__UIIndexBarView__updateDisplayEntries__block_invoke_6;
        v51[3] = &__block_descriptor_40_e32_v32__0__UIIndexBarEntry_8Q16_B24lu32l8;
        v51[4] = v64;
        [(NSArray *)entries enumerateObjectsUsingBlock:v51];
      }
      else
      {
        *(void *)buf = 0;
        *(void *)&buf[8] = buf;
        *(void *)&buf[16] = 0x3010000000;
        v78 = &unk_186D7DBA7;
        uint64_t v79 = 0;
        NSUInteger v80 = 0;
        NSUInteger v26 = [(NSArray *)self->_entries count];
        uint64_t v79 = 0;
        NSUInteger v80 = v26;
        v27 = [MEMORY[0x1E4F1CA48] array];
        v28 = self->_entries;
        v60[0] = MEMORY[0x1E4F143A8];
        v60[1] = 3221225472;
        v61[0] = __39__UIIndexBarView__updateDisplayEntries__block_invoke_2;
        v61[1] = &unk_1E530F328;
        id v29 = v27;
        id v62 = v29;
        v63 = buf;
        [(NSArray *)v28 enumerateObjectsUsingBlock:v60];
        v30 = [MEMORY[0x1E4F1CA48] array];
        v31 = self->_entries;
        v56[0] = MEMORY[0x1E4F143A8];
        v56[1] = 3221225472;
        v57[0] = __39__UIIndexBarView__updateDisplayEntries__block_invoke_3;
        v57[1] = &unk_1E530F328;
        id v32 = v30;
        id v58 = v32;
        v59 = buf;
        [(NSArray *)v31 enumerateObjectsWithOptions:2 usingBlock:v56];
        v54[0] = MEMORY[0x1E4F143A8];
        v54[1] = 3221225472;
        v55[0] = __39__UIIndexBarView__updateDisplayEntries__block_invoke_4;
        v55[1] = &__block_descriptor_40_e32_v32__0__UIIndexBarEntry_8Q16_B24lu32l8;
        v55[2] = v64;
        [v29 enumerateObjectsUsingBlock:v54];
        uint64_t v33 = [v29 count];
        uint64_t v34 = [v32 count];
        uint64_t v35 = v10 - (v33 + v34) + ((v10 - (v33 + v34)) & 1) - 1;
        if (v35 > 0)
        {
          unint64_t v37 = *(void *)(*(void *)&buf[8] + 32);
          unint64_t v36 = *(void *)(*(void *)&buf[8] + 40);
          double v38 = (double)v37;
          if ((double)v37 < (double)(v37 + v36))
          {
            double v39 = (double)v36 / (double)v35;
            char v40 = 1;
            do
            {
              unint64_t v41 = vcvtmd_s64_f64(v38);
              if (v40) {
                +[UIIndexBarEntry entryForDotInView:self];
              }
              else {
              v42 = [(NSArray *)self->_entries objectAtIndexedSubscript:v41];
              }
              v65((uint64_t)v64, v42, v41);

              v40 ^= 1u;
              double v38 = v39 + v38;
            }
            while (v38 < (double)(unint64_t)(*(void *)(*(void *)&buf[8] + 40)
                                                   + *(void *)(*(void *)&buf[8] + 32)));
          }
        }
        v52[0] = MEMORY[0x1E4F143A8];
        v52[1] = 3221225472;
        v53[0] = __39__UIIndexBarView__updateDisplayEntries__block_invoke_5;
        v53[1] = &unk_1E530F370;
        v53[2] = self;
        v53[3] = v64;
        [v32 enumerateObjectsUsingBlock:v52];

        _Block_object_dispose(buf, 8);
      }
      v74[3] = v74[3] - v24;

      _Block_object_dispose(v72, 8);
      if (!--v10) {
        break;
      }
      if (v74[3] <= v9) {
        goto LABEL_35;
      }
    }
    [v21 removeAllObjects];
LABEL_35:
    [(UIIndexBarView *)self setDisplayEntries:v21];
    _Block_object_dispose(&v73, 8);
  }
}

- (CGRect)effectiveBounds
{
  [(UIIndexBarView *)self drawingInsets];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  unint64_t v11 = [(UIIndexBarView *)self drawingInsetsMask];
  if ((v11 & 1) == 0) {
    double v4 = 0.0;
  }
  if ((~v11 & 2) != 0) {
    double v6 = 0.0;
  }
  if ((~v11 & 4) != 0) {
    double v8 = 0.0;
  }
  if ((~v11 & 8) != 0) {
    double v10 = 0.0;
  }
  [(UIView *)self bounds];
  double v13 = v12 + v6;
  double v15 = v14 + v4;
  double v17 = v16 - (v6 + v10);
  double v19 = v18 - (v4 + v8);
  result.size.double height = v19;
  result.size.double width = v17;
  result.origin.double y = v15;
  result.origin.double x = v13;
  return result;
}

- (unint64_t)drawingInsetsMask
{
  return self->_drawingInsetsMask;
}

- (UIEdgeInsets)drawingInsets
{
  double top = self->_drawingInsets.top;
  double left = self->_drawingInsets.left;
  double bottom = self->_drawingInsets.bottom;
  double right = self->_drawingInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setDisplayEntries:(id)a3
{
  double v5 = (NSArray *)a3;
  if (self->_displayEntries != v5)
  {
    double v7 = v5;
    objc_storeStrong((id *)&self->_displayEntries, a3);
    double v5 = v7;
    self->_cachedDisplayHighlightedIndedouble x = -1.0;
    if ((*(_WORD *)&self->_visualStyleImplements & 2) != 0)
    {
      double v6 = [(UIIndexBarView *)self visualStyle];
      [v6 displayEntriesUpdated];

      double v5 = v7;
    }
  }
}

- (NSArray)displayEntries
{
  return self->_displayEntries;
}

- (UIColor)indexColor
{
  indexColor = self->_indexColor;
  if (indexColor)
  {
    double v3 = indexColor;
  }
  else
  {
    double v3 = [(UIView *)self _inheritedInteractionTintColor];
  }
  return v3;
}

- (id)backgroundColor
{
  BOOL v3 = [(UIControl *)self isTracking];
  uint64_t v4 = 12;
  if (v3) {
    uint64_t v4 = 11;
  }
  double v5 = *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___UIIndexBarView__drawingInsetsMask[v4]);
  return v5;
}

+ (void)makeIndexBarView:(id *)a3 containerView:(id *)a4 forTraits:(id)a5
{
  id v16 = a5;
  if (a3)
  {
    if (a4) {
      goto LABEL_3;
    }
  }
  else
  {
    double v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, a1, @"UIIndexBarView.m", 66, @"Invalid parameter not satisfying: %@", @"index != nil" object file lineNumber description];

    if (a4) {
      goto LABEL_3;
    }
  }
  double v15 = [MEMORY[0x1E4F28B00] currentHandler];
  [v15 handleFailureInMethod:a2, a1, @"UIIndexBarView.m", 67, @"Invalid parameter not satisfying: %@", @"view != nil" object file lineNumber description];

LABEL_3:
  id v9 = objc_alloc_init((Class)a1);
  id v10 = +[UIIndexBarView _visualStyleForIdiom:]((uint64_t)a1, [v16 userInterfaceIdiom]);
  if (objc_opt_respondsToSelector())
  {
    unint64_t v11 = [v10 containerViewForIndexBar:v9];
  }
  else
  {
    unint64_t v11 = 0;
  }
  id v12 = v9;
  double v13 = v12;
  *a3 = v12;
  if (v11) {
    id v12 = v11;
  }
  *a4 = v12;
}

+ (id)_visualStyleForIdiom:(uint64_t)a1
{
  self;
  BOOL v3 = (void *)__IdiomsToVisualStyles;
  uint64_t v4 = [NSNumber numberWithInteger:a2];
  double v5 = (void *)[v3 objectForKey:v4];

  if (!v5) {
    double v5 = objc_opt_class();
  }
  return v5;
}

- (UIIndexBarView)initWithFrame:(CGRect)a3
{
  v20[1] = *MEMORY[0x1E4F143B8];
  v17.receiver = self;
  v17.super_class = (Class)UIIndexBarView;
  BOOL v3 = -[UIControl initWithFrame:](&v17, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  uint64_t v4 = [(id)objc_opt_class() visualStyleForIndexBarView:v3];
  [(UIIndexBarView *)v3 setVisualStyle:v4];

  v3->_drawingInsetsMask = 15;
  if (!v3->_selectionFeedbackGenerator)
  {
    double v5 = +[_UISelectionFeedbackGeneratorConfiguration strongConfiguration];
    double v6 = [v5 tweakedConfigurationForClass:objc_opt_class() usage:@"indexRetarget"];

    double v7 = [(UIFeedbackGenerator *)[UISelectionFeedbackGenerator alloc] initWithConfiguration:v6 view:v3];
    selectionFeedbackGenerator = v3->_selectionFeedbackGenerator;
    v3->_selectionFeedbackGenerator = v7;
  }
  v20[0] = 0x1ED3F5A30;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
  id v10 = [(UIView *)v3 _registerForTraitTokenChanges:v9 withTarget:v3 action:sel__setupAXHUDGestureIfNecessary];

  unint64_t v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v11 addObserver:v3 selector:sel__largeContentViewerEnabledStatusDidChange_ name:@"UILargeContentViewerInteractionEnabledStatusDidChangeNotification" object:0];

  v19[0] = 0x1ED3F5AD8;
  v19[1] = 0x1ED3F5B38;
  id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];
  id v13 = [(UIView *)v3 _registerForTraitTokenChanges:v12 withTarget:v3 action:sel__legibilityWeightOrPreferredContentSizeTraitsDidChange];

  uint64_t v18 = 0x1ED3F5A90;
  double v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v18 count:1];
  id v15 = [(UIView *)v3 _registerForTraitTokenChanges:v14 withTarget:v3 action:sel__horizontalSizeClassDidChange];

  return v3;
}

- (void)setVisualStyle:(id)a3
{
  objc_storeStrong((id *)&self->_visualStyle, a3);
  id v5 = a3;
  *(_WORD *)&self->_visualStyleImplements = *(_WORD *)&self->_visualStyleImplements & 0xFFFE | objc_opt_respondsToSelector() & 1;
  if (objc_opt_respondsToSelector()) {
    __int16 v6 = 2;
  }
  else {
    __int16 v6 = 0;
  }
  *(_WORD *)&self->_visualStyleImplements = *(_WORD *)&self->_visualStyleImplements & 0xFFFD | v6;
  if (objc_opt_respondsToSelector()) {
    __int16 v7 = 4;
  }
  else {
    __int16 v7 = 0;
  }
  *(_WORD *)&self->_visualStyleImplements = *(_WORD *)&self->_visualStyleImplements & 0xFFFB | v7;
  if (objc_opt_respondsToSelector()) {
    __int16 v8 = 8;
  }
  else {
    __int16 v8 = 0;
  }
  *(_WORD *)&self->_visualStyleImplements = *(_WORD *)&self->_visualStyleImplements & 0xFFF7 | v8;
  if (objc_opt_respondsToSelector()) {
    __int16 v9 = 16;
  }
  else {
    __int16 v9 = 0;
  }
  *(_WORD *)&self->_visualStyleImplements = *(_WORD *)&self->_visualStyleImplements & 0xFFEF | v9;
  if (objc_opt_respondsToSelector()) {
    __int16 v10 = 32;
  }
  else {
    __int16 v10 = 0;
  }
  *(_WORD *)&self->_visualStyleImplements = *(_WORD *)&self->_visualStyleImplements & 0xFFDF | v10;
  if (objc_opt_respondsToSelector()) {
    __int16 v11 = 64;
  }
  else {
    __int16 v11 = 0;
  }
  *(_WORD *)&self->_visualStyleImplements = *(_WORD *)&self->_visualStyleImplements & 0xFFBF | v11;
  if (objc_opt_respondsToSelector()) {
    __int16 v12 = 128;
  }
  else {
    __int16 v12 = 0;
  }
  *(_WORD *)&self->_visualStyleImplements = *(_WORD *)&self->_visualStyleImplements & 0xFF7F | v12;
  if (objc_opt_respondsToSelector()) {
    __int16 v13 = 256;
  }
  else {
    __int16 v13 = 0;
  }
  *(_WORD *)&self->_visualStyleImplements = *(_WORD *)&self->_visualStyleImplements & 0xFEFF | v13;
  if (objc_opt_respondsToSelector()) {
    __int16 v14 = 512;
  }
  else {
    __int16 v14 = 0;
  }
  *(_WORD *)&self->_visualStyleImplements = *(_WORD *)&self->_visualStyleImplements & 0xFDFF | v14;
  if (objc_opt_respondsToSelector()) {
    __int16 v15 = 1024;
  }
  else {
    __int16 v15 = 0;
  }
  *(_WORD *)&self->_visualStyleImplements = *(_WORD *)&self->_visualStyleImplements & 0xFBFF | v15;
  if (objc_opt_respondsToSelector()) {
    __int16 v16 = 2048;
  }
  else {
    __int16 v16 = 0;
  }
  *(_WORD *)&self->_visualStyleImplements = *(_WORD *)&self->_visualStyleImplements & 0xF7FF | v16;
  if (objc_opt_respondsToSelector()) {
    __int16 v17 = 4096;
  }
  else {
    __int16 v17 = 0;
  }
  *(_WORD *)&self->_visualStyleImplements = *(_WORD *)&self->_visualStyleImplements & 0xEFFF | v17;
  if (objc_opt_respondsToSelector()) {
    __int16 v18 = 0x2000;
  }
  else {
    __int16 v18 = 0;
  }
  *(_WORD *)&self->_visualStyleImplements = *(_WORD *)&self->_visualStyleImplements & 0xDFFF | v18;
  char v19 = objc_opt_respondsToSelector();

  if (v19) {
    __int16 v20 = 0x4000;
  }
  else {
    __int16 v20 = 0;
  }
  *(_WORD *)&self->_visualStyleImplements = *(_WORD *)&self->_visualStyleImplements & 0xBFFF | v20;
}

+ (id)visualStyleForIndexBarView:(id)a3
{
  id v4 = a3;
  id v5 = [v4 traitCollection];
  __int16 v6 = (objc_class *)+[UIIndexBarView _visualStyleForIdiom:]((uint64_t)a1, [v5 userInterfaceIdiom]);

  __int16 v7 = (void *)[[v6 alloc] initWithView:v4];
  return v7;
}

- (void)setBackgroundColor:(id)a3
{
  id v5 = (UIColor *)a3;
  if (self->_nonTrackingBackgroundColor != v5)
  {
    __int16 v7 = v5;
    objc_storeStrong((id *)&self->_nonTrackingBackgroundColor, a3);
    BOOL v6 = [(UIControl *)self isTracking];
    id v5 = v7;
    if (!v6)
    {
      [(UIIndexBarView *)self _updateBackgroundColor];
      id v5 = v7;
    }
  }
}

- (void)setHighlightedIndex:(double)a3
{
  if (self->_highlightedIndex != a3)
  {
    self->_highlightedIndedouble x = a3;
    self->_cachedDisplayHighlightedIndedouble x = -1.0;
    if ((*(unsigned char *)&self->_visualStyleImplements & 8) != 0)
    {
      id v3 = [(UIIndexBarView *)self visualStyle];
      [v3 highlightedIndexUpdated];
    }
  }
}

- (void)setDeflection:(double)a3
{
  if (self->_deflection != a3)
  {
    self->_deflection = a3;
    if ((*(_WORD *)&self->_visualStyleImplements & 0x10) != 0)
    {
      id v3 = [(UIIndexBarView *)self visualStyle];
      [v3 deflectionUpdated];
    }
  }
}

- (void)resetDeflection:(BOOL)a3
{
  self->_deflection = 0.0;
  if ((*(_WORD *)&self->_visualStyleImplements & 0x20) != 0)
  {
    BOOL v3 = a3;
    id v4 = [(UIIndexBarView *)self visualStyle];
    [v4 deflectionReset:v3];
  }
}

- (BOOL)canBecomeFocused
{
  id v2 = [(UIIndexBarView *)self visualStyle];
  char v3 = [v2 canBecomeFocused];

  return v3;
}

- (BOOL)_defaultCanBecomeFocused
{
  v3.receiver = self;
  v3.super_class = (Class)UIIndexBarView;
  return [(UIControl *)&v3 canBecomeFocused];
}

- (void)_legibilityWeightOrPreferredContentSizeTraitsDidChange
{
  if ((*(_WORD *)&self->_visualStyleImplements & 0x4000) != 0)
  {
    objc_super v3 = [(UIIndexBarView *)self visualStyle];
    [v3 legibilityWeightOrPreferredContentSizeUpdated];
  }
  [(UIIndexBarView *)self _updateDisplayEntries];
}

- (void)_horizontalSizeClassDidChange
{
  if ((*(_WORD *)&self->_visualStyleImplements & 4) != 0)
  {
    id v2 = [(UIIndexBarView *)self visualStyle];
    [v2 sizeUpdated];
  }
}

void __39__UIIndexBarView__updateDisplayEntries__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  [*(id *)(a1 + 32) addObject:v6];
  ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 32);
  --*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (([v6 hasPoundTitle] & 1) == 0 && (!objc_msgSend(v6, "type") || objc_msgSend(v6, "type") == 1)) {
    *a4 = 1;
  }
}

void __39__UIIndexBarView__updateDisplayEntries__block_invoke_3(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  [*(id *)(a1 + 32) addObject:v6];
  --*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (([v6 hasPoundTitle] & 1) == 0 && (!objc_msgSend(v6, "type") || objc_msgSend(v6, "type") == 1)) {
    *a4 = 1;
  }
}

uint64_t __39__UIIndexBarView__updateDisplayEntries__block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __39__UIIndexBarView__updateDisplayEntries__block_invoke_5(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = *(void **)(*(void *)(a1 + 32) + 472);
  id v6 = a2;
  (*(void (**)(uint64_t, id, uint64_t))(v4 + 16))(v4, v6, [v5 count] + ~a3);
}

- (double)displayHighlightedIndex
{
  cachedDisplayHighlightedIndedouble x = -1.0;
  if (![(NSArray *)self->_displayEntries count]) {
    return cachedDisplayHighlightedIndex;
  }
  [(UIIndexBarView *)self effectiveBounds];
  if (CGRectIsEmpty(v23)) {
    return cachedDisplayHighlightedIndex;
  }
  cachedDisplayHighlightedIndedouble x = self->_cachedDisplayHighlightedIndex;
  if (cachedDisplayHighlightedIndex != -1.0) {
    return cachedDisplayHighlightedIndex;
  }
  uint64_t v4 = [(UIIndexBarView *)self entries];
  uint64_t v5 = [v4 count];
  if (v5 == [(NSArray *)self->_displayEntries count]
    || ((highlightedIndedouble x = self->_highlightedIndex, highlightedIndex != -1.0)
      ? (BOOL v7 = highlightedIndex == -2.0)
      : (BOOL v7 = 1),
        v7))
  {

    return self->_highlightedIndex;
  }

  if (highlightedIndex == -3.0) {
    return self->_highlightedIndex;
  }
  int64_t v9 = [(NSArray *)self->_displayEntries count] - 1;
  double v10 = self->_highlightedIndex;
  NSUInteger v11 = [(NSArray *)self->_entries count];
  if (v9 < 2)
  {
    uint64_t v12 = 0;
  }
  else
  {
    uint64_t v12 = 0;
    unint64_t v13 = llround(v10 * (double)v9 / (double)(v11 - 1));
    do
    {
      __int16 v14 = [(NSArray *)self->_displayEntries objectAtIndexedSubscript:v13];
      uint64_t v15 = [v14 entryIndex];

      double v16 = self->_highlightedIndex;
      if (v16 <= (double)v15)
      {
        if (v16 < (double)v15)
        {
          unint64_t v17 = v13 - 1;
          int64_t v9 = v13;
          unint64_t v13 = v12;
        }
        else
        {
          int64_t v9 = v13;
          unint64_t v17 = v13;
        }
      }
      else
      {
        unint64_t v17 = v13 + 1;
      }
      uint64_t v12 = v13;
      uint64_t v18 = v9 - v13;
      unint64_t v13 = v17;
    }
    while (v18 > 1);
  }
  if (v12 == v9)
  {
    cachedDisplayHighlightedIndedouble x = (double)v9;
  }
  else
  {
    char v19 = [(NSArray *)self->_displayEntries objectAtIndexedSubscript:v12];
    uint64_t v20 = [v19 entryIndex];

    id v21 = [(NSArray *)self->_displayEntries objectAtIndexedSubscript:v9];
    uint64_t v22 = [v21 entryIndex];

    cachedDisplayHighlightedIndedouble x = (self->_highlightedIndex - (double)v20) / (double)(v22 - v20) + (double)v12;
  }
  self->_cachedDisplayHighlightedIndedouble x = cachedDisplayHighlightedIndex;
  return cachedDisplayHighlightedIndex;
}

- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  __int16 v8 = [(UIView *)self window];
  [v6 locationInView:v8];
  self->_trackingStartLocationInWindow.double x = v9;
  self->_trackingStartLocationInWindow.double y = v10;

  __int16 visualStyleImplements = (__int16)self->_visualStyleImplements;
  if ((visualStyleImplements & 0x100) != 0)
  {
    uint64_t v12 = [(UIIndexBarView *)self visualStyle];
    [v12 trackingDidBegin];

    __int16 visualStyleImplements = (__int16)self->_visualStyleImplements;
  }
  if ((visualStyleImplements & 0x800) != 0 && [(NSArray *)self->_entries count])
  {
    unint64_t v13 = [(UIIndexBarView *)self visualStyle];
    [v13 updateSectionForTouch:v6 withEvent:v7];

    __int16 v14 = [(UIIndexBarView *)self visualStyle];
    char v15 = objc_opt_respondsToSelector();

    if (v15)
    {
      double v16 = [(UIIndexBarView *)self visualStyle];
      [v16 setExpanded:1];
    }
    [(UIIndexBarView *)self _updateBackgroundColor];
    [(UIIndexBarView *)self _userInteractionStarted];
    BOOL v17 = 1;
  }
  else
  {
    BOOL v17 = 0;
  }

  return v17;
}

- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  $7470359F659C9B5BA7D170B769D567F5 visualStyleImplements = self->_visualStyleImplements;
  if ((*(_WORD *)&visualStyleImplements & 0x800) != 0)
  {
    if ((*(_WORD *)&visualStyleImplements & 0x200) == 0
      || ([(UIView *)self window],
          CGFloat v9 = objc_claimAutoreleasedReturnValue(),
          [v6 locationInView:v9],
          double v11 = v10,
          double v13 = v12,
          v9,
          [(UIIndexBarVisualStyle *)self->_visualStyle trackingChangeHysteresis],
          fabs(sqrt((self->_trackingStartLocationInWindow.x - v11) * (self->_trackingStartLocationInWindow.x - v11)+ (self->_trackingStartLocationInWindow.y - v13) * (self->_trackingStartLocationInWindow.y - v13))) > v14))
    {
      char v15 = [(UIIndexBarView *)self visualStyle];
      int v16 = [v15 updateSectionForTouch:v6 withEvent:v7];

      if (v16) {
        [(UIControl *)self _sendActionsForEvents:4096 withEvent:v7];
      }
    }
  }

  return (*(unsigned int *)&visualStyleImplements >> 11) & 1;
}

- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  __int16 visualStyleImplements = (__int16)self->_visualStyleImplements;
  if ((visualStyleImplements & 0x400) != 0)
  {
    CGFloat v9 = [(UIIndexBarView *)self visualStyle];
    [v9 trackingDidEnd];

    __int16 visualStyleImplements = (__int16)self->_visualStyleImplements;
  }
  if ((visualStyleImplements & 0x800) != 0)
  {
    if ((visualStyleImplements & 0x200) == 0
      || ([(UIView *)self window],
          double v10 = objc_claimAutoreleasedReturnValue(),
          [v6 locationInView:v10],
          double v12 = v11,
          double v14 = v13,
          v10,
          [(UIIndexBarVisualStyle *)self->_visualStyle trackingChangeHysteresis],
          fabs(sqrt((self->_trackingStartLocationInWindow.x - v12) * (self->_trackingStartLocationInWindow.x - v12)+ (self->_trackingStartLocationInWindow.y - v14) * (self->_trackingStartLocationInWindow.y - v14))) > v15))
    {
      int v16 = [(UIIndexBarView *)self visualStyle];
      [v16 updateSectionForTouch:v6 withEvent:v7];
    }
    BOOL v17 = [(UIIndexBarView *)self visualStyle];
    char v18 = objc_opt_respondsToSelector();

    if (v18)
    {
      char v19 = [(UIIndexBarView *)self visualStyle];
      [v19 setExpanded:0];
    }
    [(UIIndexBarView *)self _updateBackgroundColor];
  }
  v20.receiver = self;
  v20.super_class = (Class)UIIndexBarView;
  [(UIControl *)&v20 endTrackingWithTouch:v6 withEvent:v7];
  [(UIIndexBarView *)self _userInteractionStopped];
}

- (void)cancelTrackingWithEvent:(id)a3
{
  id v4 = a3;
  __int16 visualStyleImplements = (__int16)self->_visualStyleImplements;
  if ((visualStyleImplements & 0x400) != 0)
  {
    id v6 = [(UIIndexBarView *)self visualStyle];
    [v6 trackingDidEnd];

    __int16 visualStyleImplements = (__int16)self->_visualStyleImplements;
  }
  if ((visualStyleImplements & 0x800) != 0)
  {
    id v7 = [(UIIndexBarView *)self visualStyle];
    [v7 updateSectionForTouch:0 withEvent:v4];

    [(UIIndexBarView *)self _updateBackgroundColor];
  }
  v8.receiver = self;
  v8.super_class = (Class)UIIndexBarView;
  [(UIControl *)&v8 cancelTrackingWithEvent:v4];
  [(UIIndexBarView *)self _userInteractionStopped];
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)UIIndexBarView;
  id v6 = a4;
  id v7 = a3;
  [(UIControl *)&v8 touchesBegan:v7 withEvent:v6];
  -[UIIndexBarView _handleTouches:withEvent:](self, "_handleTouches:withEvent:", v7, v6, v8.receiver, v8.super_class);
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)UIIndexBarView;
  id v6 = a4;
  id v7 = a3;
  [(UIControl *)&v8 touchesMoved:v7 withEvent:v6];
  -[UIIndexBarView _handleTouches:withEvent:](self, "_handleTouches:withEvent:", v7, v6, v8.receiver, v8.super_class);
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)UIIndexBarView;
  id v6 = a4;
  [(UIControl *)&v7 touchesEnded:a3 withEvent:v6];
  -[UIIndexBarView _handleTouches:withEvent:](self, "_handleTouches:withEvent:", 0, v6, v7.receiver, v7.super_class);
}

- (void)_handleTouches:(id)a3 withEvent:(id)a4
{
  id v6 = a4;
  objc_super v7 = v6;
  if (a3)
  {
    id v17 = [v6 _firstTouchForView:self];
    [v17 locationInView:self];
    double v9 = v8;
    double v11 = v10;
    double v12 = [(UIIndexBarView *)self visualStyle];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      double v14 = [(UIIndexBarView *)self visualStyle];
      uint64_t v15 = objc_msgSend(v14, "_indexForEntryAtPoint:", v9, v11);
    }
    else
    {
      uint64_t v15 = 0x7FFFFFFFFFFFFFFFLL;
    }
    int v16 = [(UIIndexBarView *)self visualStyle];
    [v16 handleTouch:v17 withEvent:v7 touchedEntryIndex:v15];

    objc_super v7 = v16;
  }
  else
  {
    id v17 = [(UIIndexBarView *)self visualStyle];
    [v17 handleTouch:0 withEvent:v7 touchedEntryIndex:0x7FFFFFFFFFFFFFFFLL];
  }
}

+ (void)registerVisualStyle:(Class)a3 forIdiom:(int64_t)a4
{
  if (!__IdiomsToVisualStyles)
  {
    uint64_t v8 = [MEMORY[0x1E4F1CA60] dictionary];
    double v9 = (void *)__IdiomsToVisualStyles;
    __IdiomsToVisualStyles = v8;
  }
  if (([(objc_class *)a3 conformsToProtocol:&unk_1ED693648] & 1) == 0)
  {
    double v11 = [MEMORY[0x1E4F28B00] currentHandler];
    double v12 = NSStringFromClass(a3);
    [v11 handleFailureInMethod:a2, a1, @"UIIndexBarView.m", 658, @"visualStyle of type %@ does not conform to UIIndexBarVisualStyle.", v12 object file lineNumber description];
  }
  double v10 = (void *)__IdiomsToVisualStyles;
  id v13 = [NSNumber numberWithInteger:a4];
  [v10 setObject:a3 forKey:v13];
}

- (void)setHighlightStyle:(int64_t)a3
{
  if (self->_highlightStyle != a3)
  {
    self->_highlightStyle = a3;
    if ((*(_WORD *)&self->_visualStyleImplements & 0x1000) != 0)
    {
      id v3 = [(UIIndexBarView *)self visualStyle];
      [v3 highlightStyleUpdated];
    }
  }
}

- (void)_updateBackgroundColor
{
  if ([(UIControl *)self isTracking]) {
    -[UIView setBackgroundColor:](&v4, sel_setBackgroundColor_, self->_trackingBackgroundColor, v3.receiver, v3.super_class, self, UIIndexBarView);
  }
  else {
    -[UIView setBackgroundColor:](&v3, sel_setBackgroundColor_, self->_nonTrackingBackgroundColor, self, UIIndexBarView, v4.receiver, v4.super_class);
  }
}

- (void)setIndexColor:(id)a3
{
  uint64_t v5 = (UIColor *)a3;
  if (self->_indexColor != v5)
  {
    objc_super v7 = v5;
    objc_storeStrong((id *)&self->_indexColor, a3);
    uint64_t v5 = v7;
    if ((*(_WORD *)&self->_visualStyleImplements & 0x2000) != 0)
    {
      id v6 = [(UIIndexBarView *)self visualStyle];
      [v6 indexColorUpdated];

      uint64_t v5 = v7;
    }
  }
}

- (void)setTrackingBackgroundColor:(id)a3
{
  uint64_t v5 = (UIColor *)a3;
  if (self->_trackingBackgroundColor != v5)
  {
    objc_super v7 = v5;
    objc_storeStrong((id *)&self->_trackingBackgroundColor, a3);
    BOOL v6 = [(UIControl *)self isTracking];
    uint64_t v5 = v7;
    if (v6)
    {
      [(UIIndexBarView *)self _updateBackgroundColor];
      uint64_t v5 = v7;
    }
  }
}

- (void)_userInteractionStarted
{
  objc_super v3 = [(UIIndexBarView *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    uint64_t v5 = [(UIIndexBarView *)self delegate];
    [v5 userInteractionStartedWithIndexBarView:self];
  }
  selectionFeedbackGenerator = self->_selectionFeedbackGenerator;
  [(UISelectionFeedbackGenerator *)selectionFeedbackGenerator userInteractionStarted];
}

- (void)_userInteractionStopped
{
  objc_super v3 = [(UIIndexBarView *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    uint64_t v5 = [(UIIndexBarView *)self delegate];
    [v5 userInteractionStoppedWithIndexBarView:self];
  }
  selectionFeedbackGenerator = self->_selectionFeedbackGenerator;
  [(UISelectionFeedbackGenerator *)selectionFeedbackGenerator userInteractionEnded];
}

- (BOOL)_didSelectEntry:(id)a3 atIndex:(int64_t)a4 location:(CGPoint)a5
{
  double y = a5.y;
  double x = a5.x;
  BOOL v8 = [(UIIndexBarView *)self _selectEntry:a3 atIndex:a4];
  if (v8) {
    -[UISelectionFeedbackGenerator selectionChangedAtLocation:](self->_selectionFeedbackGenerator, "selectionChangedAtLocation:", x, y);
  }
  return v8;
}

- (BOOL)_selectEntry:(id)a3 atIndex:(int64_t)a4
{
  id v6 = a3;
  objc_super v7 = [(UIIndexBarView *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    double v9 = [(UIIndexBarView *)self delegate];
    char v10 = [v9 indexBarView:self didSelectEntry:v6 atIndex:a4];
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (id)_accessibilityHUDGestureManager:(id)a3 HUDItemForPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  objc_super v7 = [(UIIndexBarView *)self visualStyle];
  char v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0
    && ([(UIIndexBarView *)self visualStyle],
        double v9 = objc_claimAutoreleasedReturnValue(),
        uint64_t v10 = objc_msgSend(v9, "_accessibility_indexForEntryAtPoint:", x, y),
        v9,
        v10 != 0x7FFFFFFFFFFFFFFFLL))
  {
    double v12 = [(UIIndexBarView *)self entries];
    id v13 = [v12 objectAtIndex:v10];

    double v14 = [UIAccessibilityHUDItem alloc];
    uint64_t v15 = [v13 title];
    int v16 = [v13 image];
    double v11 = -[UIAccessibilityHUDItem initWithTitle:image:imageInsets:](v14, "initWithTitle:image:imageInsets:", v15, v16, 0.0, 0.0, 0.0, 0.0);
  }
  else
  {
    double v11 = 0;
  }
  return v11;
}

- (BOOL)_accessibilityHUDGestureManager:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (BOOL)_accessibilityHUDGestureManager:(id)a3 canCancelGestureRecognizer:(id)a4
{
  return 0;
}

- (BOOL)_accessibilityHUDGestureManagerCancelsTouchesInView:(id)a3
{
  return 0;
}

- (NSArray)entries
{
  return self->_entries;
}

- (UIIndexBarViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (UIIndexBarViewDelegate *)WeakRetained;
}

- (void)setDrawingInsetsMask:(unint64_t)a3
{
  self->_drawingInsetsMask = a3;
}

- (UIColor)trackingBackgroundColor
{
  return self->_trackingBackgroundColor;
}

- (int64_t)highlightStyle
{
  return self->_highlightStyle;
}

- (double)highlightedIndex
{
  return self->_highlightedIndex;
}

- (double)deflection
{
  return self->_deflection;
}

- (double)cachedDisplayHighlightedIndex
{
  return self->_cachedDisplayHighlightedIndex;
}

- (void)setCachedDisplayHighlightedIndex:(double)a3
{
  self->_cachedDisplayHighlightedIndedouble x = a3;
}

- (UIColor)nonTrackingBackgroundColor
{
  return self->_nonTrackingBackgroundColor;
}

- (void)setNonTrackingBackgroundColor:(id)a3
{
}

- (CGPoint)trackingStartLocationInWindow
{
  double x = self->_trackingStartLocationInWindow.x;
  double y = self->_trackingStartLocationInWindow.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setTrackingStartLocationInWindow:(CGPoint)a3
{
  self->_trackingStartLocationInWindow = a3;
}

- (UISelectionFeedbackGenerator)selectionFeedbackGenerator
{
  return self->_selectionFeedbackGenerator;
}

- (void)setSelectionFeedbackGenerator:(id)a3
{
}

- (UIAccessibilityHUDGestureManager)axHUDGestureManager
{
  return self->_axHUDGestureManager;
}

- (void)setAxHUDGestureManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_axHUDGestureManager, 0);
  objc_storeStrong((id *)&self->_selectionFeedbackGenerator, 0);
  objc_storeStrong((id *)&self->_nonTrackingBackgroundColor, 0);
  objc_storeStrong((id *)&self->_displayEntries, 0);
  objc_storeStrong((id *)&self->_visualStyle, 0);
  objc_storeStrong((id *)&self->_trackingBackgroundColor, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_entries, 0);
  objc_storeStrong((id *)&self->_indexColor, 0);
}

@end