@interface UITableViewIndex
+ (id)idiomToVisualStyleClassMap;
+ (id)visualStyleForIdiom:(uint64_t)a1;
+ (id)visualStyleForTableViewIndex:(id)a3;
+ (void)makeTableViewIndex:(id *)a3 containerView:(id *)a4 forTraits:(id)a5;
+ (void)registerVisualStyle:(Class)a3 forIdiom:(int64_t)a4;
- (BOOL)_accessibilityHUDGestureManager:(id)a3 canCancelGestureRecognizer:(id)a4;
- (BOOL)_accessibilityHUDGestureManager:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)_accessibilityHUDGestureManagerCancelsTouchesInView:(id)a3;
- (BOOL)_shouldAnimatePropertyWithKey:(id)a3;
- (BOOL)_updateSectionForTouch:(id)a3 withEvent:(id)a4;
- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (BOOL)canBecomeFocused;
- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (BOOL)pastBottom;
- (BOOL)pastTop;
- (CGRect)_effectiveBounds;
- (CGRect)_visibleBoundsForRect:(CGRect)a3 stride:(double *)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSArray)titles;
- (NSString)selectedSectionTitle;
- (UIColor)indexBackgroundColor;
- (UIColor)indexColor;
- (UIColor)indexTrackingBackgroundColor;
- (UIEdgeInsets)drawingInsets;
- (UIFont)font;
- (UITableView)tableView;
- (UITableViewIndex)initWithFrame:(CGRect)a3;
- (UITableViewIndexVisualStyle)visualStyle;
- (double)_minLineSpacingForIdiom:(int64_t)a3;
- (id)_accessibilityHUDGestureManager:(id)a3 HUDItemForPoint:(CGPoint)a4;
- (id)_displayTitles;
- (id)_dotImage;
- (id)_externalDotImage;
- (int64_t)_coreIdiom;
- (int64_t)_idiom;
- (int64_t)_indexForEntryAtPoint:(CGPoint)a3;
- (int64_t)selectedSection;
- (unint64_t)drawingInsetsMask;
- (unint64_t)maximumNumberOfTitlesWithoutTruncationForHeight:(double)a3;
- (void)_cacheAndMeasureTitles;
- (void)_handleTouches:(id)a3 withEvent:(id)a4;
- (void)_horizontalSizeClassDidChange;
- (void)_legibilityWeightOrPreferredContentSizeTraitsDidChange;
- (void)_setIdiom:(int64_t)a3;
- (void)_setupAXHUDGestureIfNecessary;
- (void)cancelTrackingWithEvent:(id)a3;
- (void)didMoveToWindow;
- (void)drawRect:(CGRect)a3;
- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (void)setDrawingInsets:(UIEdgeInsets)a3;
- (void)setDrawingInsetsMask:(unint64_t)a3;
- (void)setFont:(id)a3;
- (void)setFrame:(CGRect)a3;
- (void)setIndexBackgroundColor:(id)a3;
- (void)setIndexColor:(id)a3;
- (void)setIndexTrackingBackgroundColor:(id)a3;
- (void)setTableView:(id)a3;
- (void)setTitles:(id)a3;
- (void)setVisualStyle:(id)a3;
- (void)tintColorDidChange;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation UITableViewIndex

- (int64_t)_coreIdiom
{
  return self->_idiom;
}

- (int64_t)_idiom
{
  if (self->_idiom != -1) {
    return self->_idiom;
  }
  v3 = [(UIView *)self window];
  v4 = [v3 _screen];
  int64_t v5 = [v4 _userInterfaceIdiom];

  return v5;
}

- (void)_setIdiom:(int64_t)a3
{
  self->_idiom = a3;
  v4 = [(id)objc_opt_class() visualStyleForTableViewIndex:self];
  visualStyle = self->_visualStyle;
  self->_visualStyle = v4;

  if (self->_titles) {
    [(UITableViewIndex *)self _cacheAndMeasureTitles];
  }
  [(UIView *)self setNeedsDisplay];
}

- (double)_minLineSpacingForIdiom:(int64_t)a3
{
  v3 = [(UITableViewIndex *)self visualStyle];
  [v3 minLineSpacing];
  double v5 = v4;

  return v5;
}

- (id)_displayTitles
{
  id v3 = (id)[(NSArray *)self->_titles mutableCopy];
  if (![v3 count])
  {
    v31 = (void *)MEMORY[0x1E4F1CBF0];
    goto LABEL_21;
  }
  [(UITableViewIndex *)self _effectiveBounds];
  double v5 = v4;
  double v6 = (double)(uint64_t)floor(v4 / (double)(unint64_t)[v3 count]);
  [(UITableViewIndex *)self _minLineSpacingForIdiom:[(UITableViewIndex *)self _idiom]];
  if (v7 <= v6)
  {
    v22 = v3;
    goto LABEL_20;
  }
  v8 = [v3 indexesOfObjectsPassingTest:&__block_literal_global_539];
  [v3 removeObjectsAtIndexes:v8];

  unint64_t v9 = [(UITableViewIndex *)self maximumNumberOfTitlesWithoutTruncationForHeight:v5];
  v10 = [v3 objectAtIndex:0];
  int v11 = [v10 isEqualToString:@"{search}"];

  v12 = [v3 lastObject];
  LODWORD(v10) = [v12 isEqualToString:@"{search}"];

  v13 = [v3 objectAtIndex:0];
  unsigned int v14 = [v13 isEqualToString:@"#"];

  v15 = [v3 lastObject];
  unsigned int v16 = [v15 isEqualToString:@"#"];

  int v33 = (int)v10;
  unint64_t v17 = (v14 | v16) + (unint64_t)(v11 | v10);
  uint64_t v18 = v9 - v17 + ((v9 - v17) & 1);
  if (v18 - 1 >= 0) {
    uint64_t v19 = v18 - 1;
  }
  else {
    uint64_t v19 = v9 - v17 + ((v9 - v17) & 1);
  }
  uint64_t v20 = [v3 count];
  v21 = [MEMORY[0x1E4F1CA48] array];
  v22 = v21;
  if (v11) {
    [v21 addObject:@"{search}"];
  }
  if (v14) {
    [v22 addObject:@"#"];
  }
  uint64_t v23 = v11 | v14;
  uint64_t v24 = v20 + ~v17;
  float v25 = (float)v24;
  for (float i = (float)v23; i < v25; float i = (float)(v25 / (float)((v19 >> 1) & ~(v19 >> 63))) + i)
  {
    v27 = [v3 objectAtIndex:llroundf(i)];
    [v22 addObject:v27];

    [v22 addObject:@"•"];
  }
  v28 = [v3 objectAtIndex:v24 + v23];
  if ([v22 containsObject:v28])
  {
    v29 = [v22 lastObject];
    int v30 = [v29 isEqual:@"•"];

    if (!v30)
    {
      if (!v33) {
        goto LABEL_15;
      }
LABEL_27:
      [v22 addObject:@"{search}"];
      if (!v16) {
        goto LABEL_17;
      }
      goto LABEL_16;
    }
    [v22 removeLastObject];
    if (v33) {
      goto LABEL_27;
    }
  }
  else
  {
    [v22 addObject:v28];
    if (v33) {
      goto LABEL_27;
    }
  }
LABEL_15:
  if (v16) {
LABEL_16:
  }
    [v22 addObject:@"#"];
LABEL_17:

LABEL_20:
  id v3 = v22;
  v31 = v3;
LABEL_21:

  return v31;
}

uint64_t __34__UITableViewIndex__displayTitles__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isEqualToString:@"•"];
}

- (void)_cacheAndMeasureTitles
{
  v2 = self;
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  entries = self->_entries;
  if (entries)
  {
    self->_entries = 0;
  }
  [(UITableViewIndex *)v2 _minLineSpacingForIdiom:[(UITableViewIndex *)v2 _idiom]];
  double v5 = v4;
  char v6 = [(UITableViewIndex *)v2 drawingInsetsMask];
  [(UITableViewIndex *)v2 _effectiveBounds];
  double v8 = v7;
  if (v5 <= (double)(uint64_t)floor(v7 / (double)[(NSArray *)v2->_titles count]))
  {
    if (v6) {
      goto LABEL_10;
    }
    [(UITableViewIndex *)v2 drawingInsets];
    if (v5 >= (double)(uint64_t)floor((v8 - v10) / (double)[(NSArray *)v2->_titles count])) {
      goto LABEL_10;
    }
    unint64_t v9 = [(UITableViewIndex *)v2 drawingInsetsMask] | 1;
    goto LABEL_9;
  }
  if (v6)
  {
    unint64_t v9 = [(UITableViewIndex *)v2 drawingInsetsMask] & 0xFFFFFFFFFFFFFFFELL;
LABEL_9:
    [(UITableViewIndex *)v2 setDrawingInsetsMask:v9];
  }
LABEL_10:
  int v11 = [(UITableViewIndex *)v2 _displayTitles];
  v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v11, "count"));
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v13 = v11;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v42 objects:v48 count:16];
  if (!v14) {
    goto LABEL_29;
  }
  uint64_t v15 = v14;
  uint64_t v16 = *(void *)v43;
  unint64_t v17 = @"{search}";
  uint64_t v40 = *(void *)off_1E52D2040;
  double v18 = *MEMORY[0x1E4F1DAD8];
  double v19 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  uint64_t v38 = *MEMORY[0x1E4F1CFD0];
  uint64_t v39 = *MEMORY[0x1E4F24748];
  id v41 = v13;
  do
  {
    uint64_t v20 = 0;
    do
    {
      if (*(void *)v43 != v16) {
        objc_enumerationMutation(v13);
      }
      v21 = *(void **)(*((void *)&v42 + 1) + 8 * v20);
      v22 = objc_alloc_init(_UITableViewIndexEntry);
      if ([v21 isEqualToString:@"#"])
      {
        uint64_t v23 = @"UISectionListPoundSign";
        goto LABEL_19;
      }
      if ([v21 isEqualToString:v17])
      {
        uint64_t v23 = @"UITableViewIndexSearchGlyph";
LABEL_19:
        uint64_t v24 = _UIImageWithName(v23);
LABEL_20:
        float v25 = (void *)v24;
        [(_UITableViewIndexEntry *)v22 setImage:v24];

        v26 = [(_UITableViewIndexEntry *)v22 image];
        [v26 size];
        -[_UITableViewIndexEntry setBounds:](v22, "setBounds:", v18, v19, v27, v28);

        [(_UITableViewIndexEntry *)v22 bounds];
        -[_UITableViewIndexEntry setTypeBounds:](v22, "setTypeBounds:");
        goto LABEL_21;
      }
      if ([v21 isEqualToString:@"•"])
      {
        uint64_t v24 = [(UITableViewIndex *)v2 _dotImage];
        goto LABEL_20;
      }
      if ([v21 isEqualToString:@"{appclip}"])
      {
        uint64_t v24 = +[UIImage _systemImageNamed:@"appclip"];
        goto LABEL_20;
      }
      v46[0] = v40;
      v29 = [(UITableViewIndex *)v2 font];
      v46[1] = v39;
      v47[0] = v29;
      v47[1] = v38;
      [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v47 forKeys:v46 count:2];
      int v30 = v17;
      v32 = v31 = v2;

      CFAttributedStringRef v33 = (const __CFAttributedString *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v21 attributes:v32];
      CTLineRef v34 = CTLineCreateWithAttributedString(v33);
      [(_UITableViewIndexEntry *)v22 setLine:v34];

      CGRect BoundsWithOptions = CTLineGetBoundsWithOptions(v34, 0x10uLL);
      -[_UITableViewIndexEntry setBounds:](v22, "setBounds:", BoundsWithOptions.origin.x, BoundsWithOptions.origin.y, BoundsWithOptions.size.width, BoundsWithOptions.size.height);
      CGRect v51 = CTLineGetBoundsWithOptions(v34, 8uLL);
      -[_UITableViewIndexEntry setTypeBounds:](v22, "setTypeBounds:", v51.origin.x, v51.origin.y, v51.size.width, v51.size.height);

      id v13 = v41;
      v2 = v31;
      unint64_t v17 = v30;
LABEL_21:
      [v12 addObject:v22];

      ++v20;
    }
    while (v15 != v20);
    uint64_t v35 = [v13 countByEnumeratingWithState:&v42 objects:v48 count:16];
    uint64_t v15 = v35;
  }
  while (v35);
LABEL_29:

  v36 = *(Class *)((char *)&v2->super.super.super.super.isa + v37);
  *(Class *)((char *)&v2->super.super.super.super.isa + v37) = (Class)v12;
}

+ (void)makeTableViewIndex:(id *)a3 containerView:(id *)a4 forTraits:(id)a5
{
  id v17 = a5;
  if (a3)
  {
    if (a4) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, a1, @"UITableViewIndex.m", 269, @"Invalid parameter not satisfying: %@", @"index != nil" object file lineNumber description];

    if (a4) {
      goto LABEL_3;
    }
  }
  uint64_t v16 = [MEMORY[0x1E4F28B00] currentHandler];
  [v16 handleFailureInMethod:a2, a1, @"UITableViewIndex.m", 270, @"Invalid parameter not satisfying: %@", @"view != nil" object file lineNumber description];

LABEL_3:
  id v9 = objc_alloc((Class)a1);
  double v10 = objc_msgSend(v9, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  id v11 = +[UITableViewIndex visualStyleForIdiom:]((uint64_t)a1, [v17 userInterfaceIdiom]);
  if (objc_opt_respondsToSelector())
  {
    v12 = [v11 containerViewForTableViewIndex:v10];
  }
  else
  {
    v12 = 0;
  }
  id v13 = v10;
  uint64_t v14 = v13;
  *a3 = v13;
  if (v12) {
    id v13 = v12;
  }
  *a4 = v13;
}

+ (id)visualStyleForIdiom:(uint64_t)a1
{
  self;
  id v3 = +[UITableViewIndex idiomToVisualStyleClassMap]();
  double v4 = [NSNumber numberWithInteger:a2];
  double v5 = (void *)[v3 objectForKey:v4];

  if (!v5) {
    double v5 = objc_opt_class();
  }
  return v5;
}

- (UITableViewIndex)initWithFrame:(CGRect)a3
{
  v19[1] = *MEMORY[0x1E4F143B8];
  v16.receiver = self;
  v16.super_class = (Class)UITableViewIndex;
  id v3 = -[UIControl initWithFrame:](&v16, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v4 = v3;
  if (v3)
  {
    v3->_idiom = -1;
    uint64_t v5 = [(id)objc_opt_class() visualStyleForTableViewIndex:v3];
    visualStyle = v4->_visualStyle;
    v4->_visualStyle = (UITableViewIndexVisualStyle *)v5;

    [(UIView *)v4 setOpaque:0];
    [(UIControl *)v4 setRequiresDisplayOnTracking:1];
    [(UIView *)v4 setNeedsDisplayOnBoundsChange:1];
    [(UIView *)v4 setDeliversTouchesForGesturesToSuperview:0];
    [(UIView *)v4 setExclusiveTouch:1];
    v4->_selectedSection = 0x7FFFFFFFFFFFFFFFLL;
    CGSize v7 = (CGSize)*MEMORY[0x1E4F1DB30];
    v4->_cachedSize = (CGSize)*MEMORY[0x1E4F1DB30];
    v4->_cachedSizeToFit = v7;
    v4->_drawingInsetsMask = 15;
    v19[0] = 0x1ED3F5A30;
    double v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
    id v9 = [(UIView *)v4 _registerForTraitTokenChanges:v8 withTarget:v4 action:sel__setupAXHUDGestureIfNecessary];

    double v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v10 addObserver:v4 selector:sel__largeContentViewerEnabledStatusDidChange_ name:@"UILargeContentViewerInteractionEnabledStatusDidChangeNotification" object:0];

    v18[0] = 0x1ED3F5AD8;
    v18[1] = 0x1ED3F5B38;
    id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];
    id v12 = [(UIView *)v4 _registerForTraitTokenChanges:v11 withTarget:v4 action:sel__legibilityWeightOrPreferredContentSizeTraitsDidChange];

    uint64_t v17 = 0x1ED3F5A90;
    id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v17 count:1];
    id v14 = [(UIView *)v4 _registerForTraitTokenChanges:v13 withTarget:v4 action:sel__horizontalSizeClassDidChange];
  }
  return v4;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  p_cachedSize = &self->_cachedSize;
  double v7 = self->_cachedSize.width;
  double v8 = self->_cachedSize.height;
  BOOL v9 = v7 == *MEMORY[0x1E4F1DB30] && v8 == *(double *)(MEMORY[0x1E4F1DB30] + 8);
  if (v9 || (self->_cachedSizeToFit.width == width ? (BOOL v10 = self->_cachedSizeToFit.height == height) : (BOOL v10 = 0), !v10))
  {
    [(UITableViewIndex *)self _cacheAndMeasureTitles];
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v11 = self->_entries;
    uint64_t v12 = [(NSArray *)v11 countByEnumeratingWithState:&v33 objects:v37 count:16];
    double v13 = 0.0;
    double v14 = 0.0;
    if (v12)
    {
      uint64_t v15 = v12;
      uint64_t v16 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v34 != v16) {
            objc_enumerationMutation(v11);
          }
          double v18 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          objc_msgSend(v18, "bounds", (void)v33);
          double v20 = v19;
          v21 = [(UITableViewIndex *)self visualStyle];
          [v21 lineSpacing];
          double v23 = v22;

          [v18 bounds];
          if (v24 > v14)
          {
            [v18 bounds];
            double v14 = v25;
          }
          double v13 = v13 + v20 + v23 + v23;
        }
        uint64_t v15 = [(NSArray *)v11 countByEnumeratingWithState:&v33 objects:v37 count:16];
      }
      while (v15);
    }

    double v26 = fmax((height - v13) * 0.5, 0.0);
    self->_bottomPadding = v26;
    self->_topPadding = v26;
    UICeilToViewScale(self);
    double v28 = v27;
    v29 = [(UITableViewIndex *)self visualStyle];
    [v29 indexWidth];
    double v31 = fmax(v28, v30);

    if (v31 > width) {
      double v32 = width;
    }
    else {
      double v32 = v31;
    }
    p_cachedSize->double width = v32;
    p_cachedSize->double height = height;
    self->_cachedSizeToFit.double width = width;
    self->_cachedSizeToFit.double height = height;
    double v7 = p_cachedSize->width;
    double v8 = p_cachedSize->height;
  }
  result.double height = v8;
  result.double width = v7;
  return result;
}

- (void)setTitles:(id)a3
{
  if (self->_titles != a3)
  {
    double v4 = (NSArray *)[a3 copy];
    titles = self->_titles;
    self->_titles = v4;

    CGSize v6 = (CGSize)*MEMORY[0x1E4F1DB30];
    self->_cachedSize = (CGSize)*MEMORY[0x1E4F1DB30];
    self->_cachedSizeToFit = v6;
    [(UITableViewIndex *)self _cacheAndMeasureTitles];
    [(UIView *)self setNeedsDisplay];
  }
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v16.receiver = self;
  v16.super_class = (Class)UITableViewIndex;
  [(UIView *)&v16 frame];
  v18.origin.double x = v8;
  v18.origin.double y = v9;
  double v11 = v10;
  double v13 = v12;
  v17.origin.double x = x;
  v17.origin.double y = y;
  v17.size.double width = width;
  v17.size.double height = height;
  v18.size.double width = v11;
  v18.size.double height = v13;
  if (!CGRectEqualToRect(v17, v18))
  {
    v15.receiver = self;
    v15.super_class = (Class)UITableViewIndex;
    -[UIView setFrame:](&v15, sel_setFrame_, x, y, width, height);
    if (width != v11 || height != v13) {
      [(UITableViewIndex *)self _cacheAndMeasureTitles];
    }
  }
}

- (void)setDrawingInsets:(UIEdgeInsets)a3
{
  if (a3.left != self->_drawingInsets.left
    || a3.top != self->_drawingInsets.top
    || a3.right != self->_drawingInsets.right
    || a3.bottom != self->_drawingInsets.bottom)
  {
    self->_drawingInsets = a3;
    [(UITableViewIndex *)self _cacheAndMeasureTitles];
  }
}

- (CGRect)_effectiveBounds
{
  [(UITableViewIndex *)self drawingInsets];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  unint64_t v11 = [(UITableViewIndex *)self drawingInsetsMask];
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

- (NSArray)titles
{
  return self->_titles;
}

- (void)setFont:(id)a3
{
  double v4 = (UIFont *)a3;
  double v5 = [(UITableViewIndex *)self visualStyle];
  [v5 setFont:v4];

  font = self->_font;
  if (font != v4)
  {
    [(UIView *)self setNeedsDisplay];
  }
}

- (UIFont)font
{
  v2 = [(UITableViewIndex *)self visualStyle];
  double v3 = [v2 font];

  return (UIFont *)v3;
}

- (NSString)selectedSectionTitle
{
  if (self->_selectedSection == 0x7FFFFFFFFFFFFFFFLL)
  {
    v2 = 0;
  }
  else
  {
    v2 = -[NSArray objectAtIndex:](self->_titles, "objectAtIndex:");
  }
  return (NSString *)v2;
}

- (unint64_t)maximumNumberOfTitlesWithoutTruncationForHeight:(double)a3
{
  [(UITableViewIndex *)self _minLineSpacingForIdiom:[(UITableViewIndex *)self _idiom]];
  return vcvtmd_u64_f64(a3 / v4);
}

- (CGRect)_visibleBoundsForRect:(CGRect)a3 stride:(double *)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  if ([(NSArray *)self->_entries count])
  {
    double v10 = [(UITableViewIndex *)self visualStyle];
    [v10 lineSpacing];
    double v12 = v11;

    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    double v13 = self->_entries;
    uint64_t v14 = [(NSArray *)v13 countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v31;
      double v17 = 0.0;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v31 != v16) {
            objc_enumerationMutation(v13);
          }
          objc_msgSend(*(id *)(*((void *)&v30 + 1) + 8 * i), "typeBounds", (void)v30);
          UIRoundToViewScale(self);
          double v17 = v17 + v19;
        }
        uint64_t v15 = [(NSArray *)v13 countByEnumeratingWithState:&v30 objects:v34 count:16];
      }
      while (v15);
    }
    else
    {
      double v17 = 0.0;
    }

    double v22 = v17 + v12 * (double)([(NSArray *)self->_entries count] - 1);
    double v23 = [(NSArray *)self->_entries objectAtIndexedSubscript:[(NSArray *)self->_entries count] - 1];
    [v23 typeBounds];
    double v21 = v22 - v24;
    v36.origin.CGFloat x = x;
    v36.origin.CGFloat y = y;
    v36.size.CGFloat width = width;
    v36.size.CGFloat height = height;
    CGRectGetMinY(v36);
    v37.origin.CGFloat x = x;
    v37.origin.CGFloat y = y;
    v37.size.CGFloat width = width;
    v37.size.CGFloat height = height;
    CGRectGetHeight(v37);
    UIRoundToViewScale(self);
    double v20 = v25;
    if (a4) {
      *a4 = v12;
    }
  }
  else
  {
    CGFloat x = *MEMORY[0x1E4F1DB28];
    double v20 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    CGFloat width = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v21 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }
  double v26 = x;
  double v27 = v20;
  double v28 = width;
  double v29 = v21;
  result.size.CGFloat height = v29;
  result.size.CGFloat width = v28;
  result.origin.CGFloat y = v27;
  result.origin.CGFloat x = v26;
  return result;
}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"contents"])
  {
    BOOL v5 = 0;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)UITableViewIndex;
    BOOL v5 = [(UIView *)&v7 _shouldAnimatePropertyWithKey:v4];
  }

  return v5;
}

- (void)_legibilityWeightOrPreferredContentSizeTraitsDidChange
{
  double v3 = [(UITableViewIndex *)self visualStyle];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    BOOL v5 = [(UITableViewIndex *)self visualStyle];
    [v5 legibilityWeightOrPreferredContentSizeUpdated];
  }
  [(UITableViewIndex *)self _cacheAndMeasureTitles];
}

- (void)_horizontalSizeClassDidChange
{
  CGSize v2 = (CGSize)*MEMORY[0x1E4F1DB30];
  self->_cachedSizeToFit = (CGSize)*MEMORY[0x1E4F1DB30];
  self->_cachedSize = v2;
  id v3 = [(UITableViewIndex *)self tableView];
  [v3 _updateIndexFrame];
}

- (void)drawRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v8 = [(UITableViewIndex *)self visualStyle];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    id v69 = [(UITableViewIndex *)self visualStyle];
    objc_msgSend(v69, "drawRect:", x, y, width, height);

    return;
  }
  [(UITableViewIndex *)self _effectiveBounds];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  ContextStack = GetContextStack(0);
  if (*(int *)ContextStack < 1) {
    double v19 = 0;
  }
  else {
    double v19 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
  }
  if ([(UIControl *)self isTracking]
    && (indexTrackingBackgroundColor = self->_indexTrackingBackgroundColor) != 0
    || (indexTrackingBackgroundColor = self->_indexBackgroundColor) != 0)
  {
    [(UIColor *)indexTrackingBackgroundColor set];
  }
  else
  {
    v63 = [(UIView *)self traitCollection];
    if ([v63 userInterfaceIdiom] == 3)
    {

      goto LABEL_13;
    }
    char v64 = dyld_program_sdk_at_least();

    if (v64) {
      goto LABEL_13;
    }
    v65 = +[UIColor colorWithWhite:1.0 alpha:0.9];
    [v65 set];
  }
  v73.origin.double x = v11;
  v73.origin.double y = v13;
  v73.size.double width = v15;
  v73.size.double height = v17;
  CGContextFillRect(v19, v73);
LABEL_13:
  v71[0] = 0.0;
  -[UITableViewIndex _visibleBoundsForRect:stride:](self, "_visibleBoundsForRect:stride:", v71, v11, v13, v15, v17);
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;
  double v28 = v27;
  double v29 = [(UITableViewIndex *)self indexColor];

  if (v29) {
    [(UITableViewIndex *)self indexColor];
  }
  else {
  long long v30 = [(UIView *)self _inheritedInteractionTintColor];
  }
  [v30 set];
  NSUInteger v31 = [(NSArray *)self->_entries count];
  long long v32 = [(UITableViewIndex *)self visualStyle];
  char v33 = objc_opt_respondsToSelector();

  long long v34 = [(UITableViewIndex *)self visualStyle];
  char v35 = objc_opt_respondsToSelector();

  if (v31)
  {
    uint64_t v36 = 0;
    p_b = &v70.b;
    do
    {
      CGRect v37 = -[NSArray objectAtIndexedSubscript:](self->_entries, "objectAtIndexedSubscript:", v36, p_b);
      [v37 bounds];
      double v39 = v38;
      double v41 = v40;
      double v43 = v42;
      double v45 = v44;
      if (v33)
      {
        v46 = [(UITableViewIndex *)self visualStyle];
        objc_msgSend(v46, "willDrawEntryAtIndex:indexBounds:entryBounds:context:originalColor:", v36, v19, v30, v22, v24, v26, v28, v39, v41, v43, v45);
      }
      v47 = [v37 image];

      if (v47)
      {
        v48 = [v37 image];
        uint64_t v49 = [v48 imageWithTintColor:v30 renderingMode:1];

        v74.origin.double x = v22;
        v74.origin.double y = v24;
        v74.size.double width = v26;
        v74.size.double height = v28;
        CGRectGetMinX(v74);
        double v67 = v41;
        double v50 = v39;
        v75.origin.double x = v22;
        v75.origin.double y = v24;
        v75.size.double width = v26;
        v75.size.double height = v28;
        CGRectGetWidth(v75);
        UIRoundToViewScale(self);
        double v52 = v51;
        v76.origin.double x = v22;
        v76.origin.double y = v24;
        v76.size.double width = v26;
        v76.size.double height = v28;
        CGRectGetMinY(v76);
        UIRoundToViewScale(self);
        double v54 = v53;
        double v55 = v52;
        double v39 = v50;
        double v41 = v67;
        objc_msgSend(v49, "drawAtPoint:blendMode:alpha:", 0, v55, v54, 1.0);

        double v28 = v45;
      }
      else
      {
        v56 = [v37 line];

        if (v56)
        {
          CGContextSaveGState(v19);
          v77.origin.double x = v22;
          v77.origin.double y = v24;
          v77.size.double width = v26;
          v77.size.double height = v28;
          CGRectGetMinX(v77);
          double v68 = v39;
          v78.origin.double x = v22;
          v78.origin.double y = v24;
          v78.size.double width = v26;
          v78.size.double height = v28;
          CGRectGetWidth(v78);
          UIRoundToViewScale(self);
          CGFloat v58 = v57;
          v79.origin.double x = v22;
          v79.origin.double y = v24;
          v79.size.double width = v26;
          v79.size.double height = v28;
          CGRectGetMinY(v79);
          [v37 typeBounds];
          UIRoundToViewScale(self);
          double v60 = v59;
          CGFloat *p_b = 0.0;
          p_b[1] = 0.0;
          v70.a = 1.0;
          v70.d = -1.0;
          v70.tdouble x = v58;
          v70.tdouble y = v59;
          double v39 = v68;
          CGContextSetTextMatrix(v19, &v70);
          v61 = [v37 line];
          CTLineDraw(v61, v19);

          CGContextRestoreGState(v19);
          double v28 = v60 - v24;
        }
      }
      if (v35)
      {
        v62 = [(UITableViewIndex *)self visualStyle];
        objc_msgSend(v62, "didDrawEntryAtIndex:indexBounds:entryBounds:context:originalColor:", v36, v19, v30, v22, v24, v26, v28, v39, v41, v43, v45);
      }
      double v24 = v24 + v28 + v71[0];

      ++v36;
    }
    while (v31 != v36);
  }
}

- (BOOL)_updateSectionForTouch:(id)a3 withEvent:(id)a4
{
  id v5 = a3;
  [(UITableViewIndex *)self _effectiveBounds];
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  [v5 locationInView:self];
  double v15 = v14;
  double v17 = v16;

  int64_t v18 = -[UITableViewIndex _indexForEntryAtPoint:](self, "_indexForEntryAtPoint:", v15, v17);
  v28.origin.double x = v7;
  v28.origin.double y = v9;
  v28.size.double width = v11;
  v28.size.double height = v13;
  double MinY = CGRectGetMinY(v28);
  if (v17 >= MinY)
  {
    v29.origin.double x = v7;
    v29.origin.double y = v9;
    v29.size.double width = v11;
    v29.size.double height = v13;
    CGFloat MaxY = CGRectGetMaxY(v29);
    int64_t v21 = 0x7FFFFFFFFFFFFFFFLL;
    if (v17 > MaxY)
    {
      BOOL v20 = 1;
    }
    else
    {
      int64_t v21 = v18;
      BOOL v20 = 0;
    }
  }
  else
  {
    BOOL v20 = 0;
    int64_t v21 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if (v21 == self->_selectedSection)
  {
    BOOL v23 = v17 < MinY;
    if (self->_pastTop == v23 && self->_pastBottom == v20) {
      return 0;
    }
  }
  else
  {
    LOBYTE(v23) = v17 < MinY;
  }
  self->_selectedSection = v21;
  self->_pastTop = v23;
  self->_pastBottom = v20;
  double v25 = [(UITableViewIndex *)self visualStyle];
  char v26 = objc_opt_respondsToSelector();

  if (v26)
  {
    double v27 = [(UITableViewIndex *)self visualStyle];
    [v27 selectedSectionDidChange:self->_selectedSection];
  }
  return 1;
}

- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = [(UITableViewIndex *)self visualStyle];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    double v10 = [(UITableViewIndex *)self visualStyle];
    [v10 trackingDidBegin];
  }
  [(UITableViewIndex *)self _updateSectionForTouch:v6 withEvent:v7];
  [(UIView *)self setNeedsDisplay];

  return 1;
}

- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v6 = a4;
  if ([(UITableViewIndex *)self _updateSectionForTouch:a3 withEvent:v6]) {
    [(UIControl *)self _sendActionsForEvents:4096 withEvent:v6];
  }

  return 1;
}

- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  double v8 = [(UITableViewIndex *)self visualStyle];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    double v10 = [(UITableViewIndex *)self visualStyle];
    [v10 trackingDidEnd];
  }
  [(UITableViewIndex *)self _updateSectionForTouch:v7 withEvent:v6];
  self->_selectedSection = 0x7FFFFFFFFFFFFFFFLL;
  self->_pastTop = 0;
  self->_pastBottom = 0;
  [(UIView *)self setNeedsDisplay];
  v11.receiver = self;
  v11.super_class = (Class)UITableViewIndex;
  [(UIControl *)&v11 endTrackingWithTouch:v7 withEvent:v6];
}

- (void)cancelTrackingWithEvent:(id)a3
{
  id v4 = a3;
  id v5 = [(UITableViewIndex *)self visualStyle];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(UITableViewIndex *)self visualStyle];
    [v7 trackingDidEnd];
  }
  self->_selectedSection = 0x7FFFFFFFFFFFFFFFLL;
  self->_pastTop = 0;
  self->_pastBottom = 0;
  [(UIView *)self setNeedsDisplay];
  v8.receiver = self;
  v8.super_class = (Class)UITableViewIndex;
  [(UIControl *)&v8 cancelTrackingWithEvent:v4];
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)UITableViewIndex;
  id v6 = a4;
  id v7 = a3;
  [(UIControl *)&v8 touchesBegan:v7 withEvent:v6];
  -[UITableViewIndex _handleTouches:withEvent:](self, "_handleTouches:withEvent:", v7, v6, v8.receiver, v8.super_class);
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)UITableViewIndex;
  id v6 = a4;
  id v7 = a3;
  [(UIControl *)&v8 touchesMoved:v7 withEvent:v6];
  -[UITableViewIndex _handleTouches:withEvent:](self, "_handleTouches:withEvent:", v7, v6, v8.receiver, v8.super_class);
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)UITableViewIndex;
  id v6 = a4;
  [(UIControl *)&v7 touchesEnded:a3 withEvent:v6];
  -[UITableViewIndex _handleTouches:withEvent:](self, "_handleTouches:withEvent:", 0, v6, v7.receiver, v7.super_class);
}

- (void)_handleTouches:(id)a3 withEvent:(id)a4
{
  id v5 = a4;
  id v8 = [v5 _firstTouchForView:self];
  [v8 locationInView:self];
  int64_t v6 = -[UITableViewIndex _indexForEntryAtPoint:](self, "_indexForEntryAtPoint:");
  objc_super v7 = [(UITableViewIndex *)self visualStyle];
  [v7 handleTouch:v8 withEvent:v5 touchedEntryIndex:v6];
}

- (UIColor)indexColor
{
  return self->_indexColor;
}

- (void)setIndexColor:(id)a3
{
  id v5 = (UIColor *)a3;
  if (self->_indexColor != v5)
  {
    int64_t v6 = v5;
    objc_storeStrong((id *)&self->_indexColor, a3);
    [(UIView *)self setNeedsDisplay];
    id v5 = v6;
  }
}

- (UIColor)indexTrackingBackgroundColor
{
  return self->_indexTrackingBackgroundColor;
}

- (void)setIndexTrackingBackgroundColor:(id)a3
{
  id v5 = (UIColor *)a3;
  if (self->_indexTrackingBackgroundColor != v5)
  {
    objc_super v7 = v5;
    objc_storeStrong((id *)&self->_indexTrackingBackgroundColor, a3);
    BOOL v6 = [(UIControl *)self isTracking];
    id v5 = v7;
    if (v6)
    {
      [(UIView *)self setNeedsDisplay];
      id v5 = v7;
    }
  }
}

- (UIColor)indexBackgroundColor
{
  return self->_indexBackgroundColor;
}

- (void)setIndexBackgroundColor:(id)a3
{
  id v5 = (UIColor *)a3;
  if (self->_indexBackgroundColor != v5)
  {
    objc_super v7 = v5;
    objc_storeStrong((id *)&self->_indexBackgroundColor, a3);
    BOOL v6 = [(UIControl *)self isTracking];
    id v5 = v7;
    if (!v6)
    {
      [(UIView *)self setNeedsDisplay];
      id v5 = v7;
    }
  }
}

- (void)tintColorDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)UITableViewIndex;
  [(UIView *)&v3 tintColorDidChange];
  [(UIView *)self setNeedsDisplay];
}

- (id)_dotImage
{
  objc_super v3 = [(UIView *)self traitCollection];
  uint64_t v4 = [v3 userInterfaceIdiom];

  if (v4 == 3) {
    [(UITableViewIndex *)self _externalDotImage];
  }
  else {
  id v5 = _UIImageWithName(@"UITableViewIndexDot");
  }
  return v5;
}

- (id)_externalDotImage
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__UITableViewIndex__externalDotImage__block_invoke;
  block[3] = &unk_1E52D9F70;
  block[4] = self;
  if (_MergedGlobals_15_4 != -1) {
    dispatch_once(&_MergedGlobals_15_4, block);
  }
  return (id)qword_1EB25E970;
}

void __37__UITableViewIndex__externalDotImage__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _currentScreenScale];
  _UIGraphicsBeginImageContextWithOptions(0, 0, 4.0, 4.0, v1);
  ContextStack = GetContextStack(0);
  if (*(int *)ContextStack < 1) {
    objc_super v3 = 0;
  }
  else {
    objc_super v3 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
  }
  v7.origin.double x = 0.0;
  v7.origin.double y = 0.0;
  v7.size.double width = 4.0;
  v7.size.double height = 4.0;
  CGContextFillEllipseInRect(v3, v7);
  uint64_t v4 = _UIGraphicsGetImageFromCurrentImageContext(0);
  id v5 = (void *)qword_1EB25E970;
  qword_1EB25E970 = v4;

  UIGraphicsEndImageContext();
}

- (BOOL)canBecomeFocused
{
  objc_super v3 = [(UIView *)self traitCollection];
  if ([v3 userInterfaceIdiom] == 3)
  {
    BOOL v4 = 0;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)UITableViewIndex;
    BOOL v4 = [(UIControl *)&v6 canBecomeFocused];
  }

  return v4;
}

- (void)didMoveToWindow
{
  v3.receiver = self;
  v3.super_class = (Class)UITableViewIndex;
  [(UIView *)&v3 didMoveToWindow];
  [(UITableViewIndex *)self _setupAXHUDGestureIfNecessary];
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
        id v5 = [[UIAccessibilityHUDGestureManager alloc] initWithView:self delegate:self];
        axHUDGestureManager = self->_axHUDGestureManager;
        self->_axHUDGestureManager = v5;
      }
    }
  }
}

- (id)_accessibilityHUDGestureManager:(id)a3 HUDItemForPoint:(CGPoint)a4
{
  int64_t v5 = -[UITableViewIndex _indexForEntryAtPoint:](self, "_indexForEntryAtPoint:", a3, a4.x, a4.y);
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_super v6 = 0;
  }
  else
  {
    int64_t v7 = v5;
    id v8 = [UIAccessibilityHUDItem alloc];
    char v9 = [(NSArray *)self->_titles objectAtIndex:v7];
    objc_super v6 = -[UIAccessibilityHUDItem initWithTitle:image:imageInsets:](v8, "initWithTitle:image:imageInsets:", v9, 0, 0.0, 0.0, 0.0, 0.0);
  }
  return v6;
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

- (int64_t)_indexForEntryAtPoint:(CGPoint)a3
{
  double y = a3.y;
  [(UITableViewIndex *)self _effectiveBounds];
  double x = v14.origin.x;
  double v6 = v14.origin.y;
  double width = v14.size.width;
  double height = v14.size.height;
  if (y < CGRectGetMinY(v14)) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  v15.origin.double x = x;
  v15.origin.double y = v6;
  v15.size.double width = width;
  v15.size.double height = height;
  if (y > CGRectGetMaxY(v15)) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  NSUInteger v9 = [(NSArray *)self->_titles count];
  if (!v9) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  uint64_t v10 = v9;
  -[UITableViewIndex _visibleBoundsForRect:stride:](self, "_visibleBoundsForRect:stride:", 0, x, v6, width, height);
  double v11 = v16.origin.y;
  double v12 = CGRectGetHeight(v16);
  if (v10 - 1 >= ((uint64_t)((y - v11) / (v12 / (double)v10)) & ~((uint64_t)((y - v11) / (v12 / (double)v10)) >> 63))) {
    return (uint64_t)((y - v11) / (v12 / (double)v10)) & ~((uint64_t)((y - v11) / (v12 / (double)v10)) >> 63);
  }
  else {
    return v10 - 1;
  }
}

+ (id)idiomToVisualStyleClassMap
{
  self;
  if (qword_1EB25E978 != -1) {
    dispatch_once(&qword_1EB25E978, &__block_literal_global_144_0);
  }
  v0 = (void *)qword_1EB25E980;
  return v0;
}

void __46__UITableViewIndex_idiomToVisualStyleClassMap__block_invoke()
{
  v4[7] = *MEMORY[0x1E4F143B8];
  v3[0] = &unk_1ED3F6AC8;
  v4[0] = objc_opt_class();
  v3[1] = &unk_1ED3F6AE0;
  v4[1] = objc_opt_class();
  v3[2] = &unk_1ED3F6AF8;
  v4[2] = objc_opt_class();
  v3[3] = &unk_1ED3F6B10;
  v4[3] = objc_opt_class();
  v3[4] = &unk_1ED3F6B28;
  v4[4] = objc_opt_class();
  v3[5] = &unk_1ED3F6B40;
  v4[5] = objc_opt_class();
  v3[6] = &unk_1ED3F6B58;
  v4[6] = objc_opt_class();
  v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:7];
  uint64_t v1 = [v0 mutableCopy];
  CGSize v2 = (void *)qword_1EB25E980;
  qword_1EB25E980 = v1;
}

+ (void)registerVisualStyle:(Class)a3 forIdiom:(int64_t)a4
{
  if (([(objc_class *)a3 conformsToProtocol:&unk_1ED68EB60] & 1) == 0)
  {
    NSUInteger v9 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v10 = NSStringFromClass(a3);
    [v9 handleFailureInMethod:a2, a1, @"UITableViewIndex.m", 903, @"visualStyle of type %@ does not conform to UITableViewIndexVisualStyle.", v10 object file lineNumber description];
  }
  +[UITableViewIndex idiomToVisualStyleClassMap]();
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  id v8 = [NSNumber numberWithInteger:a4];
  [v11 setObject:a3 forKey:v8];
}

+ (id)visualStyleForTableViewIndex:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 _coreIdiom];
  if (v5 == -1)
  {
    double v6 = [v4 traitCollection];
    uint64_t v5 = [v6 userInterfaceIdiom];
  }
  int64_t v7 = objc_msgSend(objc_alloc((Class)+[UITableViewIndex visualStyleForIdiom:]((uint64_t)a1, v5)), "initWithTableViewIndex:", v4);

  return v7;
}

- (int64_t)selectedSection
{
  return self->_selectedSection;
}

- (BOOL)pastTop
{
  return self->_pastTop;
}

- (BOOL)pastBottom
{
  return self->_pastBottom;
}

- (UITableView)tableView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tableView);
  return (UITableView *)WeakRetained;
}

- (void)setTableView:(id)a3
{
}

- (unint64_t)drawingInsetsMask
{
  return self->_drawingInsetsMask;
}

- (void)setDrawingInsetsMask:(unint64_t)a3
{
  self->_drawingInsetsMask = a3;
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

- (UITableViewIndexVisualStyle)visualStyle
{
  return self->_visualStyle;
}

- (void)setVisualStyle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visualStyle, 0);
  objc_destroyWeak((id *)&self->_tableView);
  objc_storeStrong((id *)&self->_axHUDGestureManager, 0);
  objc_storeStrong((id *)&self->_entries, 0);
  objc_storeStrong((id *)&self->_indexTrackingBackgroundColor, 0);
  objc_storeStrong((id *)&self->_indexBackgroundColor, 0);
  objc_storeStrong((id *)&self->_indexColor, 0);
  objc_storeStrong((id *)&self->_font, 0);
  objc_storeStrong((id *)&self->_titles, 0);
}

@end