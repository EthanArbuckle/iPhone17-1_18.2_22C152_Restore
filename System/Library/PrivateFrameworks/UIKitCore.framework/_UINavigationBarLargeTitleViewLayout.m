@interface _UINavigationBarLargeTitleViewLayout
- (BOOL)alignAccessoryViewToTitleBaseline;
- (BOOL)overlaysContentView;
- (BOOL)providesExtraSpaceForExcessiveLineHeights;
- (CGRect)_contentLayoutBounds;
- (CGRect)_contentLayoutBoundsUsingRestingTitleHeight:(BOOL)a3;
- (CGSize)_cachedTitleHeightSizeAndUpdateRestingSizeForWidth:(double)a3;
- (CGSize)_cachedTitleHeightSizeAndUpdateRestingSizeForWidthSupportingMultiLineShrinkToFit:(double)a3;
- (CGSize)sizeFittingSize:(CGSize)a3 titleType:(int64_t)a4;
- (NSDirectionalEdgeInsets)layoutMargins;
- (UILabel)titleLabel;
- (UIView)accessoryView;
- (_UINavigationBarLargeTitleView)contentView;
- (_UINavigationBarLargeTitleViewLayout)initWithContentView:(id)a3;
- (double)_textHeightForSize:(CGSize)a3 titleType:(int64_t)a4;
- (double)restingTitleHeightForSize:(CGSize)a3 type:(int64_t)a4;
- (double)titleRestingHeight;
- (id)description;
- (int64_t)titleType;
- (unint64_t)accessoryViewHorizontalAlignment;
- (unint64_t)twoLineMode;
- (void)_enforceLayoutOrdering;
- (void)_invalidateTitleHeightCache;
- (void)layoutViews;
- (void)layoutViewsWithOffset:(UIOffset)a3 useRestingTitleHeight:(BOOL)a4;
- (void)layoutViewsWithOffsetSupportingMultiLineShrinkToFit:(UIOffset)a3 useRestingTitleHeight:(BOOL)a4;
- (void)removeContent;
- (void)setAccessoryView:(id)a3;
- (void)setAccessoryViewHorizontalAlignment:(unint64_t)a3;
- (void)setAlignAccessoryViewToTitleBaseline:(BOOL)a3;
- (void)setContentAlpha:(double)a3;
- (void)setContentHidden:(BOOL)a3;
- (void)setContentView:(id)a3;
- (void)setLayoutMargins:(NSDirectionalEdgeInsets)a3;
- (void)setOverlaysContentView:(BOOL)a3;
- (void)setProvidesExtraSpaceForExcessiveLineHeights:(BOOL)a3;
- (void)setTitleType:(int64_t)a3;
- (void)setTwoLineMode:(unint64_t)a3;
- (void)updateLayoutData:(id)a3 layoutWidth:(double)a4;
- (void)updateRestingTitleHeight;
@end

@implementation _UINavigationBarLargeTitleViewLayout

- (void)setOverlaysContentView:(BOOL)a3
{
  if (self->_overlaysContentView != a3)
  {
    self->_overlaysContentView = a3;
    [(_UINavigationBarLargeTitleViewLayout *)self updateRestingTitleHeight];
  }
}

- (void)updateLayoutData:(id)a3 layoutWidth:(double)a4
{
  v9 = (char *)a3;
  -[_UINavigationBarLargeTitleViewLayout restingTitleHeightForSize:type:](self, "restingTitleHeightForSize:type:", 1, a4, 10000.0);
  if (self->_overlaysContentView)
  {
    v7 = v9;
    if (!v9) {
      goto LABEL_7;
    }
    uint64_t v8 = 40;
  }
  else
  {
    v7 = v9;
    if (!v9) {
      goto LABEL_7;
    }
    *((void *)v9 + 5) = v6;
    uint64_t v8 = 32;
  }
  *(void *)&v7[v8] = v6;
LABEL_7:
}

- (double)restingTitleHeightForSize:(CGSize)a3 type:(int64_t)a4
{
  double width = a3.width;
  double result = 0.0;
  if (width >= 0.0)
  {
    -[_UINavigationBarLargeTitleViewLayout _textHeightForSize:titleType:](self, "_textHeightForSize:titleType:", self->_titleType, width, a3.height);
    if (result <= 0.0) {
      double result = _largeTitleRestingHeight();
    }
  }
  if (self->_overlaysContentView) {
    return result + 10.0;
  }
  return result;
}

- (double)_textHeightForSize:(CGSize)a3 titleType:(int64_t)a4
{
  if (!a4) {
    return 0.0;
  }
  double width = a3.width;
  accessoryView = self->_accessoryView;
  if (accessoryView)
  {
    -[UIView sizeThatFits:](accessoryView, "sizeThatFits:", a3.width, a3.height);
    if (v8 == *(double *)(MEMORY[0x1E4F1DB30] + 8) && v7 == *MEMORY[0x1E4F1DB30]) {
      double v7 = 0.0;
    }
    double width = width - v7;
  }
  [(_UINavigationBarLargeTitleViewLayout *)self _cachedTitleHeightSizeAndUpdateRestingSizeForWidth:width - (self->_layoutMargins.leading + self->_layoutMargins.trailing)];
  return self->_cachedRestingHeight;
}

- (CGSize)_cachedTitleHeightSizeAndUpdateRestingSizeForWidth:(double)a3
{
  double v3 = a3;
  if (self->_twoLineMode == 2)
  {
    [(_UINavigationBarLargeTitleViewLayout *)self _cachedTitleHeightSizeAndUpdateRestingSizeForWidthSupportingMultiLineShrinkToFit:a3];
    double v6 = v5;
    double v8 = v7;
  }
  else
  {
    v9 = [(UILabel *)self->_titleLabel text];
    uint64_t v10 = [v9 length];

    if (v10)
    {
      v11 = self->_titleLabel;
    }
    else
    {
      v12 = [(_UINavigationBarLargeTitleView *)self->_contentView effectiveTitleAttributes];
      BOOL v13 = self->_twoLineMode == 2;
      v14 = [(UIView *)self->_contentView window];
      _UINavigationBarLargeTitleViewLabelForMeasuring(v12, v13, v14);
      v11 = (UILabel *)objc_claimAutoreleasedReturnValue();

      [(UILabel *)v11 setNumberOfLines:[(UILabel *)self->_titleLabel numberOfLines]];
    }
    BOOL v15 = v3 > 0.0 || [(UILabel *)v11 numberOfLines] == 1;
    v16 = [NSNumber numberWithDouble:v3];
    v17 = [(NSMutableDictionary *)self->_titleHeightCache objectForKey:v16];
    v18 = v17;
    if (v17)
    {
      [v17 CGSizeValue];
      double v6 = v19;
      double v8 = v20;
    }
    else if (v15)
    {
      if (v3 <= 0.0) {
        double v3 = 500.0;
      }
      if (self->_twoLineMode == 1) {
        uint64_t v21 = 2;
      }
      else {
        uint64_t v21 = 1;
      }
      uint64_t v42 = 0;
      v43 = &v42;
      uint64_t v44 = 0x2020000000;
      char v45 = 0;
      if (![(UILabel *)v11 lineBreakStrategy])
      {
        v22 = [(UILabel *)v11 _synthesizedAttributedText];
        uint64_t v23 = [v22 length];
        v41[0] = MEMORY[0x1E4F143A8];
        v41[1] = 3221225472;
        v41[2] = __91___UINavigationBarLargeTitleViewLayout__cachedTitleHeightSizeAndUpdateRestingSizeForWidth___block_invoke;
        v41[3] = &unk_1E52DE5D8;
        v41[4] = &v42;
        objc_msgSend(v22, "enumerateAttribute:inRange:options:usingBlock:", @"kTUIAllCapsAttributeName", 0, v23, 0, v41);
      }
      if (*((unsigned char *)v43 + 24)) {
        [(UILabel *)v11 setLineBreakStrategy:0xFFFFLL];
      }
      -[UILabel textRectForBounds:limitedToNumberOfLines:](v11, "textRectForBounds:limitedToNumberOfLines:", v21, 0.0, 0.0, v3, 1.79769313e308);
      double v6 = v24;
      double v8 = v25;
      if (*((unsigned char *)v43 + 24)) {
        [(UILabel *)v11 setLineBreakStrategy:0];
      }
      if (self->_providesExtraSpaceForExcessiveLineHeights)
      {
        v26 = [(UILabel *)v11 font];
        _UINavigationBarExcessiveLineHeightOutsetsForFontInView((uint64_t)v26, v11);
        double v28 = v27;

        double v8 = v8 + v28;
      }
      if (!self->_titleHeightCache)
      {
        v29 = (NSMutableDictionary *)objc_opt_new();
        titleHeightCache = self->_titleHeightCache;
        self->_titleHeightCache = v29;
      }
      *(double *)v40 = v6;
      *(double *)&v40[1] = v8;
      v31 = [MEMORY[0x1E4F29238] valueWithBytes:v40 objCType:"{CGSize=dd}"];
      [(NSMutableDictionary *)self->_titleHeightCache setObject:v31 forKeyedSubscript:v16];

      _Block_object_dispose(&v42, 8);
    }
    else
    {
      double v6 = *MEMORY[0x1E4F1DB30];
      double v8 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    }
    v32 = [(NSMutableDictionary *)self->_restingHeightCache objectForKey:v16];
    v33 = v32;
    if (v32)
    {
      [v32 doubleValue];
      self->_cachedRestingHeight = v34;
    }
    else
    {
      if (!self->_restingHeightCache)
      {
        v35 = (NSMutableDictionary *)objc_opt_new();
        restingHeightCache = self->_restingHeightCache;
        self->_restingHeightCache = v35;
      }
      self->_cachedRestingHeight = _UINavigationBarLargeTitleViewCalculateRestingHeight(v11, v8);
      v37 = objc_msgSend(NSNumber, "numberWithDouble:");
      [(NSMutableDictionary *)self->_restingHeightCache setObject:v37 forKeyedSubscript:v16];
    }
  }
  double v38 = v6;
  double v39 = v8;
  result.height = v39;
  result.double width = v38;
  return result;
}

- (unint64_t)twoLineMode
{
  return self->_twoLineMode;
}

- (UIView)accessoryView
{
  return self->_accessoryView;
}

- (void)setTitleType:(int64_t)a3
{
  self->_titleType = a3;
}

- (void)setLayoutMargins:(NSDirectionalEdgeInsets)a3
{
  self->_layoutMargins = a3;
}

- (void)updateRestingTitleHeight
{
  [(UIView *)self->_contentView bounds];
  -[_UINavigationBarLargeTitleViewLayout restingTitleHeightForSize:type:](self, "restingTitleHeightForSize:type:", self->_titleType, v3, v4);
  self->_titleRestingHeight = v5;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTwoLineMode:(unint64_t)a3
{
  if (self->_twoLineMode != a3)
  {
    self->_twoLineMode = a3;
    if (a3) {
      uint64_t v4 = 2;
    }
    else {
      uint64_t v4 = 1;
    }
    [(UILabel *)self->_titleLabel setNumberOfLines:v4];
    BOOL v5 = self->_twoLineMode == 2;
    double v6 = 0.475;
    if (self->_twoLineMode != 2) {
      double v6 = 1.0;
    }
    [(UILabel *)self->_titleLabel setMinimumScaleFactor:v6];
    [(UILabel *)self->_titleLabel setAdjustsFontSizeToFitWidth:v5];
    -[UILabel _setSupportMultiLineShrinkToFit:]((uint64_t)self->_titleLabel, v5);
    [(_UINavigationBarLargeTitleViewLayout *)self _invalidateTitleHeightCache];
  }
}

- (void)setProvidesExtraSpaceForExcessiveLineHeights:(BOOL)a3
{
  self->_providesExtraSpaceForExcessiveLineHeights = a3;
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
  BOOL v5 = (UIView *)a3;
  p_accessoryView = &self->_accessoryView;
  accessoryView = self->_accessoryView;
  v9 = v5;
  if (accessoryView != v5)
  {
    [(UIView *)accessoryView removeFromSuperview];
    objc_storeStrong((id *)&self->_accessoryView, a3);
    [(UIView *)*p_accessoryView setTranslatesAutoresizingMaskIntoConstraints:1];
    BOOL v5 = *p_accessoryView;
  }
  if (v5)
  {
    double v8 = [(UIView *)v5 superview];

    if (!v8) {
      [(_UINavigationBarLargeTitleViewLayout *)self _enforceLayoutOrdering];
    }
  }
}

- (void)_invalidateTitleHeightCache
{
  titleHeightCache = self->_titleHeightCache;
  self->_titleHeightCache = 0;

  restingHeightCache = self->_restingHeightCache;
  self->_restingHeightCache = 0;
}

- (_UINavigationBarLargeTitleViewLayout)initWithContentView:(id)a3
{
  uint64_t v4 = (_UINavigationBarLargeTitleView *)a3;
  v10.receiver = self;
  v10.super_class = (Class)_UINavigationBarLargeTitleViewLayout;
  BOOL v5 = [(_UINavigationBarLargeTitleViewLayout *)&v10 init];
  double v6 = v5;
  if (v5)
  {
    v5->_contentView = v4;
    uint64_t v7 = _UINavigationBarLargeTitleViewNewLabel();
    titleLabel = v6->_titleLabel;
    v6->_titleLabel = (UILabel *)v7;

    v6->_titleType = 0;
    v6->_titleRestingHeight = 0.0;
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_restingHeightCache, 0);
  objc_storeStrong((id *)&self->_titleHeightCache, 0);
}

- (void)layoutViews
{
}

- (void)layoutViewsWithOffset:(UIOffset)a3 useRestingTitleHeight:(BOOL)a4
{
  BOOL v4 = a4;
  double vertical = a3.vertical;
  double horizontal = a3.horizontal;
  [(_UINavigationBarLargeTitleViewLayout *)self _enforceLayoutOrdering];
  if (self->_twoLineMode == 2)
  {
    -[_UINavigationBarLargeTitleViewLayout layoutViewsWithOffsetSupportingMultiLineShrinkToFit:useRestingTitleHeight:](self, "layoutViewsWithOffsetSupportingMultiLineShrinkToFit:useRestingTitleHeight:", v4, horizontal, vertical);
    return;
  }
  [(_UINavigationBarLargeTitleViewLayout *)self _contentLayoutBoundsUsingRestingTitleHeight:v4];
  double x = v88.origin.x;
  double y = v88.origin.y;
  double width = v88.size.width;
  double height = v88.size.height;
  if (CGRectIsNull(v88)) {
    return;
  }
  double v12 = horizontal + x;
  double rect = vertical + y;
  int v13 = *((_DWORD *)&self->_contentView->super._viewFlags + 4);
  uint64_t v14 = MEMORY[0x1E4F1DB28];
  double v15 = *MEMORY[0x1E4F1DB28];
  double v17 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v16 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  accessoryView = self->_accessoryView;
  double v19 = (double *)MEMORY[0x1E4F1DB30];
  if (!accessoryView)
  {
    double v77 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    double v22 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
LABEL_21:
    double v25 = v15;
    goto LABEL_22;
  }
  -[UIView sizeThatFits:](accessoryView, "sizeThatFits:", width, height);
  double v22 = v21;
  double v77 = v20;
  if (v21 == *v19 && v20 == v19[1]) {
    goto LABEL_21;
  }
  unint64_t accessoryViewHorizontalAlignment = self->_accessoryViewHorizontalAlignment;
  if (accessoryViewHorizontalAlignment) {
    double v25 = v15;
  }
  else {
    double v25 = v12;
  }
  if (!accessoryViewHorizontalAlignment && (v13 & 0x80000) == 0)
  {
    v89.origin.double x = v12;
    v89.origin.double y = rect;
    v89.size.double width = width;
    v89.size.double height = height;
    double v25 = CGRectGetMaxX(v89) - v22;
  }
  double v26 = -0.0;
  if ((*(void *)&v13 & 0x80000) != 0) {
    double v26 = v22;
  }
  double v12 = v12 + v26;
  double width = width - v22;
LABEL_22:
  double v81 = v15;
  v83.origin.double x = v12;
  double v78 = v25;
  double v79 = v22;
  double v27 = [(UIView *)self->_contentView traitCollection];
  [v27 displayScale];
  double v29 = v28;

  v83.origin.double y = v29;
  if (self->_titleType)
  {
    [(_UINavigationBarLargeTitleViewLayout *)self _cachedTitleHeightSizeAndUpdateRestingSizeForWidth:width];
    double v17 = v30;
    double v16 = v31;
    double v32 = fmod(v30 * 0.5, 1.0 / v29);
    double v33 = fmod(v16 * 0.5, 1.0 / v29);
  }
  else
  {
    double v33 = 0.0;
    double v32 = 0.0;
  }
  double v80 = *(double *)(v14 + 8);
  BOOL v34 = v16 == v19[1] && v17 == *v19;
  double v35 = 1.0;
  if (!v34)
  {
    v36 = +[UIScreen mainScreen];
    [v36 bounds];
    double v38 = v29 * (v37 * 0.66);

    double v39 = fmin((height - self->_titleRestingHeight) / v38 + 1.0, 1.1);
    if (v39 < 1.0) {
      double v39 = 1.0;
    }
    if (v17 * v39 <= width || v17 <= 0.0) {
      double v35 = v39;
    }
    else {
      double v35 = width / v17;
    }
    double v41 = v17 * 0.5 * v35;
    if ((v13 & 0x80000) != 0)
    {
      v90.origin.double y = rect;
      v90.origin.double x = v83.origin.x;
      v90.size.double width = width;
      v90.size.double height = height;
      double v42 = CGRectGetMaxX(v90) - v41;
    }
    else
    {
      double v42 = v83.origin.x + v41;
    }
    UIRoundToScale(v32 + v42, v83.origin.y);
    double v76 = v43 - v32;
    -[UILabel setBounds:](self->_titleLabel, "setBounds:", v81, v80, v17, v16);
    [(UILabel *)self->_titleLabel _lastLineBaseline];
    double v45 = v44;
    double v46 = v16 * 0.5;
    if (self->_twoLineMode == 2)
    {
      while (v45 > v16)
        double v45 = v45 - v46;
    }
    v91.origin.double y = rect;
    v91.origin.double x = v83.origin.x;
    v91.size.double width = width;
    v91.size.double height = height;
    CGFloat MaxY = CGRectGetMaxY(v91);
    UIRoundToScale(v33 + MaxY + -16.0 - v35 * (v45 - v46), v83.origin.y);
    -[UIView setCenter:](self->_titleLabel, "setCenter:", v76, v48 - v33);
    -[UILabel setBounds:](self->_titleLabel, "setBounds:", v81, v80, v17, v16);
    CGAffineTransformMakeScale(&v86, v35, v35);
    titleLabel = self->_titleLabel;
    v83.size = *(CGSize *)&v86.a;
    long long v84 = *(_OWORD *)&v86.c;
    long long v85 = *(_OWORD *)&v86.tx;
    [(UIView *)titleLabel setTransform:&v83.size];
  }
  if (self->_accessoryView)
  {
    double v50 = v78;
    if (self->_accessoryViewHorizontalAlignment != 1) {
      goto LABEL_55;
    }
    if (v34)
    {
      CGFloat v51 = v83.origin.x;
      if ((v13 & 0x80000) != 0)
      {
        double v52 = rect;
        double v53 = width;
        double v54 = height;
        double MaxX = CGRectGetMaxX(*(CGRect *)&v51);
LABEL_51:
        double v50 = MaxX - v79;
        goto LABEL_55;
      }
      double v60 = rect;
      double v61 = width;
      double v62 = height;
      double MinX = CGRectGetMinX(*(CGRect *)&v51);
    }
    else
    {
      [(UIView *)self->_titleLabel frame];
      if ((v13 & 0x80000) != 0)
      {
        double MaxX = CGRectGetMinX(*(CGRect *)&v56);
        goto LABEL_51;
      }
      double MinX = CGRectGetMaxX(*(CGRect *)&v56);
    }
    double v50 = MinX;
LABEL_55:
    if (self->_alignAccessoryViewToTitleBaseline)
    {
      if (!v34)
      {
        [(UIView *)self->_titleLabel frame];
        double v64 = v77;
        CGFloat v69 = CGRectGetMaxY(v94) - v77;
        v95.origin.double y = v80;
        v95.origin.double x = v81;
        v95.size.double width = v17;
        v95.size.double height = v16;
        double v70 = CGRectGetHeight(v95);
        [(UILabel *)self->_titleLabel _firstLineBaseline];
        double v68 = v69 - v35 * (v70 - v71);
        goto LABEL_65;
      }
      v92.origin.double y = rect;
      v92.origin.double x = v83.origin.x;
      v92.size.double width = width;
      v92.size.double height = height;
      double v64 = v77;
      double v65 = CGRectGetMaxY(v92) - v77;
      double v66 = -16.0;
    }
    else
    {
      if (!v34)
      {
        [(UIView *)self->_titleLabel frame];
        double MinY = CGRectGetMinY(v96);
        v73 = [(UILabel *)self->_titleLabel font];
        [v73 lineHeight];
        double v64 = v77;
        double v68 = MinY + v35 * (v74 * 0.5) - v77 * 0.5;

        goto LABEL_65;
      }
      double titleRestingHeight = height;
      if (v4) {
        double titleRestingHeight = self->_titleRestingHeight;
      }
      v93.origin.double y = rect;
      v93.origin.double x = v83.origin.x;
      v93.size.double width = width;
      v93.size.double height = height;
      double v65 = CGRectGetMaxY(v93);
      double v64 = v77;
      double v66 = (v77 + titleRestingHeight) * -0.5;
    }
    double v68 = v65 + v66;
LABEL_65:
    UIRoundToScale(v68, v83.origin.y);
    -[UIView setFrame:](self->_accessoryView, "setFrame:", v50, v75, v79, v64);
  }
}

- (void)_enforceLayoutOrdering
{
  v3[2] = *MEMORY[0x1E4F143B8];
  accessoryView = self->_accessoryView;
  v3[0] = self->_titleLabel;
  v3[1] = accessoryView;
  [(UIView *)self->_contentView _ensureViewsAreInstalledInRelativeOrder:v3 viewCount:2 insertionStartIndex:0];
}

- (CGRect)_contentLayoutBoundsUsingRestingTitleHeight:(BOOL)a3
{
  BOOL v3 = a3;
  [(UIView *)self->_contentView bounds];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  if (v3)
  {
    [(_UINavigationBarLargeTitleViewLayout *)self titleRestingHeight];
    double v5 = v12;
  }
  if (v11 <= 0.0 || v5 <= 0.0)
  {
    double v14 = *MEMORY[0x1E4F1DB20];
    double v9 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double v15 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double v5 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  }
  else
  {
    uint64_t v13 = 120;
    if ((*((_DWORD *)&self->_contentView->super._viewFlags + 4) & 0x80000) == 0) {
      uint64_t v13 = 104;
    }
    double v14 = v7 + *(double *)((char *)&self->super.isa + v13);
    double v15 = v11 - (self->_layoutMargins.leading + self->_layoutMargins.trailing);
  }
  double v16 = v9;
  result.size.double height = v5;
  result.size.double width = v15;
  result.origin.double y = v16;
  result.origin.double x = v14;
  return result;
}

- (double)titleRestingHeight
{
  return self->_titleRestingHeight;
}

- (NSDirectionalEdgeInsets)layoutMargins
{
  double top = self->_layoutMargins.top;
  double leading = self->_layoutMargins.leading;
  double bottom = self->_layoutMargins.bottom;
  double trailing = self->_layoutMargins.trailing;
  result.double trailing = trailing;
  result.double bottom = bottom;
  result.double leading = leading;
  result.double top = top;
  return result;
}

- (id)description
{
  v15.receiver = self;
  v15.super_class = (Class)_UINavigationBarLargeTitleViewLayout;
  BOOL v3 = [(_UINavigationBarLargeTitleViewLayout *)&v15 description];
  BOOL v4 = (void *)[v3 mutableCopy];

  if (self->_contentView)
  {
    int64_t titleType = self->_titleType;
    titleLabel = self->_titleLabel;
    unint64_t twoLineMode = self->_twoLineMode;
    double titleRestingHeight = self->_titleRestingHeight;
    if (self->_providesExtraSpaceForExcessiveLineHeights) {
      double v9 = @" usingExtendedLineHeight";
    }
    else {
      double v9 = &stru_1ED0E84C0;
    }
    double v10 = NSStringFromDirectionalEdgeInsets(self->_layoutMargins);
    [v4 appendFormat:@" label=%p type=%li twoLineMode=%li restingHeight=%.1f%@ layoutMargins=%@", titleLabel, titleType, twoLineMode, *(void *)&titleRestingHeight, v9, v10];

    accessoryView = self->_accessoryView;
    if (accessoryView)
    {
      double v12 = @"baseline";
      if (!self->_alignAccessoryViewToTitleBaseline) {
        double v12 = @"center";
      }
      if (self->_accessoryViewHorizontalAlignment) {
        uint64_t v13 = @"title";
      }
      else {
        uint64_t v13 = @"bar";
      }
      [v4 appendFormat:@" accessoryView=%p verticalAlignment=%@ horizontalAlignment=%@", accessoryView, v12, v13];
    }
    objc_msgSend(v4, "appendFormat:", @" cachedRestingHeight=%.1f titleHeightCache=%p restingHeightCache=%p", *(void *)&self->_cachedRestingHeight, self->_titleHeightCache, self->_restingHeightCache);
  }
  else
  {
    [v4 appendString:@" invalid"];
  }
  return v4;
}

- (void)setContentView:(id)a3
{
  if (self->_contentView != a3)
  {
    BOOL v4 = (_UINavigationBarLargeTitleView *)a3;
    [(_UINavigationBarLargeTitleViewLayout *)self removeContent];
    self->_contentView = v4;
    [(UIView *)v4 setNeedsLayout];
  }
}

- (CGRect)_contentLayoutBounds
{
  [(_UINavigationBarLargeTitleViewLayout *)self _contentLayoutBoundsUsingRestingTitleHeight:0];
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

- (void)layoutViewsWithOffsetSupportingMultiLineShrinkToFit:(UIOffset)a3 useRestingTitleHeight:(BOOL)a4
{
  BOOL v4 = a4;
  double vertical = a3.vertical;
  double horizontal = a3.horizontal;
  [(_UINavigationBarLargeTitleViewLayout *)self _contentLayoutBoundsUsingRestingTitleHeight:"_contentLayoutBoundsUsingRestingTitleHeight:"];
  double x = v92.origin.x;
  double y = v92.origin.y;
  double width = v92.size.width;
  double height = v92.size.height;
  if (CGRectIsNull(v92)) {
    return;
  }
  CGFloat v88 = horizontal + x;
  double rect = vertical + y;
  int v12 = *((_DWORD *)&self->_contentView->super._viewFlags + 4);
  uint64_t v13 = MEMORY[0x1E4F1DB28];
  double v14 = *MEMORY[0x1E4F1DB28];
  double v16 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v15 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  accessoryView = self->_accessoryView;
  v18 = (double *)MEMORY[0x1E4F1DB30];
  double v85 = *MEMORY[0x1E4F1DB28];
  if (!accessoryView)
  {
    double v22 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    double v87 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
LABEL_17:
    double v25 = v14;
    goto LABEL_18;
  }
  -[UIView sizeThatFits:](accessoryView, "sizeThatFits:", width, height);
  double v21 = v19;
  double v22 = v20;
  BOOL v23 = v19 == *v18 && v20 == v18[1];
  double v87 = v19;
  if (v23) {
    goto LABEL_17;
  }
  unint64_t accessoryViewHorizontalAlignment = self->_accessoryViewHorizontalAlignment;
  if (accessoryViewHorizontalAlignment) {
    double v25 = v14;
  }
  else {
    double v25 = v88;
  }
  if (!accessoryViewHorizontalAlignment && (v12 & 0x80000) == 0)
  {
    v93.origin.double x = v88;
    v93.origin.double y = rect;
    v93.size.double width = width;
    v93.size.double height = height;
    double v25 = CGRectGetMaxX(v93) - v21;
  }
  double v26 = -0.0;
  if ((*(void *)&v12 & 0x80000) != 0) {
    double v26 = v21;
  }
  CGFloat v88 = v88 + v26;
  double width = width - v21;
LABEL_18:
  double v27 = [(UIView *)self->_contentView traitCollection];
  [v27 displayScale];
  double v29 = v28;

  if (self->_titleType)
  {
    [(_UINavigationBarLargeTitleViewLayout *)self _cachedTitleHeightSizeAndUpdateRestingSizeForWidth:width];
    double v15 = v31;
    if (self->_twoLineMode == 1) {
      double v16 = width;
    }
    else {
      double v16 = v30;
    }
  }
  double v84 = *(double *)(v13 + 8);
  BOOL v32 = v15 == v18[1] && v16 == *v18;
  double v33 = 1.0;
  if (!v32)
  {
    double v83 = v15;
    BOOL v34 = +[UIScreen mainScreen];
    [v34 bounds];
    double v82 = v29;
    double v36 = v29 * (v35 * 0.66);

    double v37 = fmin((height - self->_titleRestingHeight) / v36 + 1.0, 1.1);
    if (v37 < 1.0) {
      double v37 = 1.0;
    }
    if (v16 * v37 <= width || v16 <= 0.0) {
      double v39 = v37;
    }
    else {
      double v39 = width / v16;
    }
    double v40 = v16 * 0.5 * v39;
    double v81 = v22;
    if ((v12 & 0x80000) != 0)
    {
      v94.origin.double x = v88;
      v94.origin.double y = rect;
      v94.size.double width = width;
      v94.size.double height = height;
      double v41 = CGRectGetMaxX(v94) - v40;
    }
    else
    {
      double v41 = v88 + v40;
    }
    UIRoundToScale(v41, v82);
    double v43 = v42;
    if (self->_twoLineMode == 2)
    {
      UIRoundToScale(v83 * 0.5 + height - self->_cachedRestingHeight, v82);
      double v45 = v44;
      -[UILabel setBounds:](self->_titleLabel, "setBounds:", v85, v84, v16, v83);
      -[UIView setCenter:](self->_titleLabel, "setCenter:", v43, v45);
      double v29 = v82;
    }
    else
    {
      if (os_variant_has_internal_diagnostics())
      {
        CGFloat v69 = __UIFaultDebugAssertLog();
        if (os_log_type_enabled(v69, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_1853B0000, v69, OS_LOG_TYPE_FAULT, "Shouldn’t get here!", buf, 2u);
        }

        double v47 = v85;
      }
      else
      {
        double v46 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_MergedGlobals_966) + 8);
        double v47 = v85;
        if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1853B0000, v46, OS_LOG_TYPE_ERROR, "Shouldn’t get here!", buf, 2u);
        }
      }
      -[UILabel setBounds:](self->_titleLabel, "setBounds:", v47, v84, v16, v83, *(void *)&v43);
      [(UILabel *)self->_titleLabel _lastLineBaseline];
      double v29 = v82;
      UIRoundToScale(height + -16.0 - v39 * (v48 + v83 * -0.5), v82);
      -[UIView setCenter:](self->_titleLabel, "setCenter:", v80, v49);
      -[UILabel setBounds:](self->_titleLabel, "setBounds:", v47, v84, v16, v83);
    }
    CGAffineTransformMakeScale(&v90, v39, v39);
    titleLabel = self->_titleLabel;
    CGAffineTransform v89 = v90;
    [(UIView *)titleLabel setTransform:&v89];
    double v22 = v81;
    double v33 = v39;
    double v15 = v83;
  }
  if (self->_accessoryView)
  {
    if (self->_accessoryViewHorizontalAlignment != 1) {
      goto LABEL_55;
    }
    if (v32)
    {
      if ((v12 & 0x80000) != 0)
      {
        v95.origin.double x = v88;
        v95.origin.double y = rect;
        v95.size.double width = width;
        v95.size.double height = height;
        double MaxX = CGRectGetMaxX(v95);
LABEL_51:
        double v25 = MaxX - v87;
        goto LABEL_55;
      }
      v96.origin.double x = v88;
      v96.origin.double y = rect;
      v96.size.double width = width;
      v96.size.double height = height;
      double MinX = CGRectGetMinX(v96);
    }
    else
    {
      [(UIView *)self->_titleLabel frame];
      if ((v12 & 0x80000) != 0)
      {
        double MaxX = CGRectGetMinX(*(CGRect *)&v52);
        goto LABEL_51;
      }
      double MinX = CGRectGetMaxX(*(CGRect *)&v52);
    }
    double v25 = MinX;
LABEL_55:
    if (self->_twoLineMode == 2)
    {
      [(UIView *)self->_titleLabel center];
      double v58 = v57 + v22 * -0.5;
      [(UIView *)self->_accessoryView contentScaleFactor];
      UIRoundToScale(v58, v59);
      double v61 = v60;
LABEL_82:
      UIRoundToScale(v61, v29);
      -[UIView setFrame:](self->_accessoryView, "setFrame:", v25, v79, v87, v22);
      return;
    }
    BOOL alignAccessoryViewToTitleBaseline = self->_alignAccessoryViewToTitleBaseline;
    int has_internal_diagnostics = os_variant_has_internal_diagnostics();
    if (alignAccessoryViewToTitleBaseline)
    {
      if (has_internal_diagnostics)
      {
        double v70 = __UIFaultDebugAssertLog();
        if (os_log_type_enabled(v70, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_1853B0000, v70, OS_LOG_TYPE_FAULT, "Shouldn’t get here!", buf, 2u);
        }

        if (v32) {
          goto LABEL_62;
        }
      }
      else
      {
        double v64 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB25F230) + 8);
        if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1853B0000, v64, OS_LOG_TYPE_ERROR, "Shouldn’t get here!", buf, 2u);
        }
        if (v32)
        {
LABEL_62:
          v97.origin.double x = v88;
          v97.origin.double y = rect;
          v97.size.double width = width;
          v97.size.double height = height;
          double MaxY = CGRectGetMaxY(v97) - v22;
          double v66 = -16.0;
LABEL_70:
          double v61 = MaxY + v66;
          goto LABEL_82;
        }
      }
      [(UIView *)self->_titleLabel frame];
      double v71 = v29;
      CGFloat v72 = CGRectGetMaxY(v99) - v22;
      v100.origin.double y = v84;
      v100.origin.double x = v85;
      v100.size.double width = v16;
      v100.size.double height = v15;
      double v73 = CGRectGetHeight(v100);
      [(UILabel *)self->_titleLabel _firstLineBaseline];
      double v61 = v72 - v33 * (v73 - v74);
      double v29 = v71;
      goto LABEL_82;
    }
    if (has_internal_diagnostics)
    {
      double v75 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v75, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1853B0000, v75, OS_LOG_TYPE_FAULT, "Shouldn’t get here!", buf, 2u);
      }

      if (v32) {
        goto LABEL_67;
      }
    }
    else
    {
      v67 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB25F238) + 8);
      if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1853B0000, v67, OS_LOG_TYPE_ERROR, "Shouldn’t get here!", buf, 2u);
      }
      if (v32)
      {
LABEL_67:
        double titleRestingHeight = height;
        if (v4) {
          double titleRestingHeight = self->_titleRestingHeight;
        }
        v98.origin.double x = v88;
        v98.origin.double y = rect;
        v98.size.double width = width;
        v98.size.double height = height;
        double MaxY = CGRectGetMaxY(v98);
        double v66 = (v22 + titleRestingHeight) * -0.5;
        goto LABEL_70;
      }
    }
    [(UIView *)self->_titleLabel frame];
    double MinY = CGRectGetMinY(v101);
    double v77 = [(UILabel *)self->_titleLabel font];
    [v77 lineHeight];
    double v61 = MinY + v33 * (v78 * 0.5) - v22 * 0.5;

    goto LABEL_82;
  }
}

- (void)setContentAlpha:(double)a3
{
  -[UIView setAlpha:](self->_titleLabel, "setAlpha:");
  accessoryView = self->_accessoryView;
  [(UIView *)accessoryView setAlpha:a3];
}

- (void)setContentHidden:(BOOL)a3
{
  double v3 = 1.0;
  if (a3) {
    double v3 = 0.0;
  }
  [(_UINavigationBarLargeTitleViewLayout *)self setContentAlpha:v3];
}

- (CGSize)_cachedTitleHeightSizeAndUpdateRestingSizeForWidthSupportingMultiLineShrinkToFit:(double)a3
{
  double v5 = [(UILabel *)self->_titleLabel text];
  uint64_t v6 = [v5 length];

  if (v6)
  {
    double v7 = self->_titleLabel;
  }
  else
  {
    double v8 = [(_UINavigationBarLargeTitleView *)self->_contentView effectiveTitleAttributes];
    BOOL v9 = self->_twoLineMode == 2;
    double v10 = [(UIView *)self->_contentView window];
    _UINavigationBarLargeTitleViewLabelForMeasuring(v8, v9, v10);
    double v7 = (UILabel *)objc_claimAutoreleasedReturnValue();

    [(UILabel *)v7 setNumberOfLines:[(UILabel *)self->_titleLabel numberOfLines]];
  }
  BOOL v11 = a3 > 0.0 || [(UILabel *)v7 numberOfLines] == 1;
  int v12 = [NSNumber numberWithDouble:a3];
  uint64_t v13 = [(NSMutableDictionary *)self->_titleHeightCache objectForKey:v12];
  double v14 = v13;
  if (v13)
  {
    [v13 CGSizeValue];
    double v16 = v15;
    double v18 = v17;
    goto LABEL_30;
  }
  double v16 = *MEMORY[0x1E4F1DB30];
  double v18 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  if (v11)
  {
    if (a3 <= 0.0) {
      a3 = 500.0;
    }
    unint64_t twoLineMode = self->_twoLineMode;
    switch(twoLineMode)
    {
      case 2uLL:
        double v18 = 50.0;
        double v16 = a3;
        break;
      case 1uLL:
        if (os_variant_has_internal_diagnostics())
        {
          double v42 = __UIFaultDebugAssertLog();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_fault_impl(&dword_1853B0000, v42, OS_LOG_TYPE_FAULT, "Shouldn’t get here", buf, 2u);
          }
        }
        else
        {
          double v24 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB25F248) + 8);
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1853B0000, v24, OS_LOG_TYPE_ERROR, "Shouldn’t get here", buf, 2u);
          }
        }
        double v21 = v7;
        double v22 = a3;
        uint64_t v23 = 2;
        goto LABEL_24;
      case 0uLL:
        if (os_variant_has_internal_diagnostics())
        {
          double v41 = __UIFaultDebugAssertLog();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_fault_impl(&dword_1853B0000, v41, OS_LOG_TYPE_FAULT, "Shouldn’t get here", buf, 2u);
          }
        }
        else
        {
          double v20 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB25F240) + 8);
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1853B0000, v20, OS_LOG_TYPE_ERROR, "Shouldn’t get here", buf, 2u);
          }
        }
        double v21 = v7;
        double v22 = a3;
        uint64_t v23 = 1;
LABEL_24:
        -[UILabel textRectForBounds:limitedToNumberOfLines:](v21, "textRectForBounds:limitedToNumberOfLines:", v23, 0.0, 0.0, v22, 1.79769313e308);
        double v16 = v25;
        double v18 = v26;
        break;
    }
    if (self->_providesExtraSpaceForExcessiveLineHeights)
    {
      double v27 = [(UILabel *)v7 font];
      _UINavigationBarExcessiveLineHeightOutsetsForFontInView((uint64_t)v27, v7);
      double v29 = v28;

      double v18 = v18 + v29;
    }
    if (!self->_titleHeightCache)
    {
      double v30 = (NSMutableDictionary *)objc_opt_new();
      titleHeightCache = self->_titleHeightCache;
      self->_titleHeightCache = v30;
    }
    *(double *)double v43 = v16;
    *(double *)&v43[1] = v18;
    BOOL v32 = [MEMORY[0x1E4F29238] valueWithBytes:v43 objCType:"{CGSize=dd}"];
    [(NSMutableDictionary *)self->_titleHeightCache setObject:v32 forKeyedSubscript:v12];
  }
LABEL_30:
  double v33 = [(NSMutableDictionary *)self->_restingHeightCache objectForKey:v12];
  BOOL v34 = v33;
  if (v33)
  {
    [v33 doubleValue];
    self->_cachedRestingHeight = v35;
  }
  else
  {
    if (!self->_restingHeightCache)
    {
      double v36 = (NSMutableDictionary *)objc_opt_new();
      restingHeightCache = self->_restingHeightCache;
      self->_restingHeightCache = v36;
    }
    self->_cachedRestingHeight = _UINavigationBarLargeTitleViewCalculateRestingHeight(v7, v18);
    double v38 = objc_msgSend(NSNumber, "numberWithDouble:");
    [(NSMutableDictionary *)self->_restingHeightCache setObject:v38 forKeyedSubscript:v12];
  }
  double v39 = v16;
  double v40 = v18;
  result.double height = v40;
  result.double width = v39;
  return result;
}

- (CGSize)sizeFittingSize:(CGSize)a3 titleType:(int64_t)a4
{
  CGFloat width = a3.width;
  -[_UINavigationBarLargeTitleViewLayout _textHeightForSize:titleType:](self, "_textHeightForSize:titleType:", a4, a3.width, a3.height);
  double v6 = v5;
  double v7 = width;
  result.double height = v6;
  result.CGFloat width = v7;
  return result;
}

- (void)removeContent
{
  [(UIView *)self->_titleLabel removeFromSuperview];
  [(UIView *)self->_accessoryView removeFromSuperview];
  [(_UINavigationBarLargeTitleViewLayout *)self _invalidateTitleHeightCache];
}

- (_UINavigationBarLargeTitleView)contentView
{
  return self->_contentView;
}

- (int64_t)titleType
{
  return self->_titleType;
}

- (BOOL)alignAccessoryViewToTitleBaseline
{
  return self->_alignAccessoryViewToTitleBaseline;
}

- (BOOL)providesExtraSpaceForExcessiveLineHeights
{
  return self->_providesExtraSpaceForExcessiveLineHeights;
}

- (unint64_t)accessoryViewHorizontalAlignment
{
  return self->_accessoryViewHorizontalAlignment;
}

- (BOOL)overlaysContentView
{
  return self->_overlaysContentView;
}

@end