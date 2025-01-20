@interface UIMorphingLabel
+ (id)preferredFontWithSize:(double)a3;
- (BOOL)_isRTL;
- (BOOL)canFitText:(id)a3;
- (BOOL)enableAnimation;
- (BOOL)suppressLayoutSubviews;
- (CGRect)visibleRect;
- (NSString)text;
- (UIColor)textColor;
- (UIFont)font;
- (UIMorphingLabel)initWithCoder:(id)a3;
- (UIMorphingLabel)initWithFrame:(CGRect)a3;
- (_NSRange)dstRangeOfAlignmentHunkAtIndex:(unint64_t)a3;
- (_NSRange)srcRangeOfAlignmentHunkAtIndex:(unint64_t)a3;
- (double)_rippleDurationForEndInsertion:(BOOL)a3;
- (double)alphaForFrame:(CGRect)a3;
- (double)changeInWidthDueToAlignmentHunkAtIndex:(unint64_t)a3;
- (double)currentMediaTime;
- (double)flushAmount;
- (double)glyphScaleAnimationSpeed;
- (double)initialScale;
- (double)requiredWidthForText:(id)a3;
- (double)rippleDuration;
- (double)totalLeftOffsetForAlignmentHunkAtIndex:(unint64_t)a3;
- (double)totalRightOffsetForAlignmentHunkAtIndex:(unint64_t)a3;
- (id)attributedString;
- (id)attributedStringForText:(id)a3;
- (id)glyphViewWithImage:(id)a3 isColorGlyph:(BOOL)a4;
- (id)uniqueString;
- (int64_t)textAlignment;
- (unint64_t)calculateHardAlignmentAtIndex:(unint64_t)a3 fromGlyphsInRange:(_NSRange)a4 toGlyphsInRange:(_NSRange)a5;
- (void)animateAlignmentHunkAtIndex:(unint64_t)a3;
- (void)animateChangeInWidthOutsideAlignmentHunkAtIndex:(unint64_t)a3;
- (void)animateDeletionAlignmentHunkAtIndex:(unint64_t)a3;
- (void)animateGlyph:(id)a3 toAlpha:(double)a4 duration:(double)a5 delay:(double)a6;
- (void)animateGlyph:(id)a3 toPosition:(CGPoint)a4 delay:(double)a5;
- (void)animateGlyph:(id)a3 toScale:(double)a4 delay:(double)a5;
- (void)animateGlyphs;
- (void)animateGlyphsInRange:(_NSRange)a3 ofGlyphSet:(id)a4 byOffset:(double)a5 delay:(double)a6;
- (void)animateHideGlyph:(id)a3 alphaDuration:(double)a4 delay:(double)a5;
- (void)animateInsertionAlignmentHunkAtIndex:(unint64_t)a3;
- (void)animateMovementAlignmentHunkAtIndex:(unint64_t)a3;
- (void)animateShowGlyph:(id)a3 alpha:(double)a4 alphaDuration:(double)a5 delay:(double)a6;
- (void)animateShowGlyph:(id)a3 alphaDuration:(double)a4 delay:(double)a5;
- (void)animateSubstitutionAlignmentHunkAtIndex:(unint64_t)a3;
- (void)baseInit;
- (void)calculateGlyphAlignment;
- (void)contentSizeDidChange:(id)a3;
- (void)copyStateFromGlyph:(id)a3 toGlyph:(id)a4;
- (void)hideGlyph:(id)a3;
- (void)initAlignmentHunkAtIndex:(unint64_t)a3;
- (void)initInsertionAlignmentHunkAtIndex:(unint64_t)a3;
- (void)initMovementAlignmentHunkAtIndex:(unint64_t)a3;
- (void)initSubstitutionAlignmentHunkAtIndex:(unint64_t)a3;
- (void)layoutSubviews;
- (void)setEnableAnimation:(BOOL)a3;
- (void)setFont:(id)a3;
- (void)setGlyphScaleAnimationSpeed:(double)a3;
- (void)setInitialScale:(double)a3;
- (void)setRippleDuration:(double)a3;
- (void)setSuppressLayoutSubviews:(BOOL)a3;
- (void)setText:(id)a3;
- (void)setTextAlignment:(int64_t)a3;
- (void)setTextColor:(id)a3;
- (void)setVisibleRect:(CGRect)a3;
@end

@implementation UIMorphingLabel

+ (id)preferredFontWithSize:(double)a3
{
  v4 = [(id)UIApp preferredContentSizeCategory];
  if (([v4 isEqualToString:@"UICTContentSizeCategoryL"] & 1) == 0)
  {
    if ([v4 isEqualToString:@"UICTContentSizeCategoryXL"])
    {
      double v5 = 2.0;
LABEL_9:
      a3 = a3 + v5;
      goto LABEL_10;
    }
    if ([v4 isEqualToString:@"UICTContentSizeCategoryXXL"])
    {
      double v5 = 4.0;
      goto LABEL_9;
    }
    if (([v4 isEqualToString:@"UICTContentSizeCategoryXXXL"] & 1) != 0
      || _UIContentSizeCategoryIsAccessibilityContentSizeCategory(v4, v6))
    {
      double v5 = 6.0;
      goto LABEL_9;
    }
  }
LABEL_10:
  v7 = [off_1E52D39B8 systemFontOfSize:a3];

  return v7;
}

- (void)baseInit
{
  v16[1] = *MEMORY[0x1E4F143B8];
  [(UIMorphingLabel *)self setText:0];
  [(UIMorphingLabel *)self setTextAlignment:1];
  v3 = +[UIMorphingLabel preferredFontWithSize:17.0];
  [(UIMorphingLabel *)self setFont:v3];

  v4 = +[UIColor blackColor];
  [(UIMorphingLabel *)self setTextColor:v4];

  double v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  hiddenGlyphViews = self->_hiddenGlyphViews;
  self->_hiddenGlyphViews = v5;

  CGSize v7 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
  self->_visibleRect.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
  self->_visibleRect.size = v7;
  self->_lastUpdateTime = 0.0;
  self->_isDoingFastAnimation = 0;
  self->_enableAnimation = 1;
  v8 = [UIView alloc];
  v9 = -[UIView initWithFrame:](v8, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  colorView = self->_colorView;
  self->_colorView = v9;

  [(UIView *)self addSubview:self->_colorView];
  v11 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A2A8]];
  [v11 setName:@"color"];
  id v12 = [(UIMorphingLabel *)self textColor];
  objc_msgSend(v11, "setValue:forKey:", objc_msgSend(v12, "CGColor"), @"inputColor");

  v16[0] = v11;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
  v14 = [(UIView *)self->_colorView layer];
  [v14 setFilters:v13];

  self->_rippleDuration = -1.0;
  self->_initialScale = 0.6;
  self->_glyphScaleAnimationSpeed = 1.4;
  v15 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v15 addObserver:self selector:sel_contentSizeDidChange_ name:@"UIContentSizeCategoryDidChangeNotification" object:0];
}

- (UIMorphingLabel)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)UIMorphingLabel;
  v3 = -[UIView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(UIMorphingLabel *)v3 baseInit];
  }
  return v4;
}

- (UIMorphingLabel)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)UIMorphingLabel;
  v3 = [(UIView *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(UIMorphingLabel *)v3 baseInit];
  }
  return v4;
}

- (double)alphaForFrame:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  double v8 = 1.0;
  if (!CGRectIsNull(self->_visibleRect))
  {
    [(UIMorphingLabel *)self visibleRect];
    CGRect v11 = CGRectInset(v10, -1.0, 0.0);
    v14.origin.CGFloat x = x;
    v14.origin.CGFloat y = y;
    v14.size.CGFloat width = width;
    v14.size.CGFloat height = height;
    if (!CGRectContainsRect(v11, v14))
    {
      [(UIMorphingLabel *)self visibleRect];
      CGRect v13 = CGRectInset(v12, -8.0, 0.0);
      v15.origin.CGFloat x = x;
      v15.origin.CGFloat y = y;
      v15.size.CGFloat width = width;
      v15.size.CGFloat height = height;
      if (CGRectContainsRect(v13, v15)) {
        return 0.5;
      }
      else {
        return 0.3;
      }
    }
  }
  return v8;
}

- (void)setVisibleRect:(CGRect)a3
{
  self->_visibleRect = a3;
  if ([(UIMorphingLabelGlyphSet *)self->_dstGlyphSet glyphCount])
  {
    uint64_t v4 = 0;
    unint64_t v5 = 0;
    do
    {
      objc_super v6 = [(UIMorphingLabelGlyphSet *)self->_dstGlyphSet glyphViews];
      CGSize v7 = [v6 objectAtIndexedSubscript:v5];

      double v8 = [(UIMorphingLabelGlyphSet *)self->_dstGlyphSet glyphFrames];
      -[UIMorphingLabel alphaForFrame:](self, "alphaForFrame:", v8[v4].origin.x, v8[v4].origin.y, v8[v4].size.width, v8[v4].size.height);
      float v10 = v9;
      CGRect v11 = [v7 layer];
      *(float *)&double v12 = v10;
      [v11 setOpacity:v12];

      ++v5;
      ++v4;
    }
    while (v5 < [(UIMorphingLabelGlyphSet *)self->_dstGlyphSet glyphCount]);
  }
}

- (double)_rippleDurationForEndInsertion:(BOOL)a3
{
  double result = self->_rippleDuration;
  if (result <= 0.0)
  {
    double v4 = 0.1;
    if (a3) {
      double v4 = 0.125;
    }
    return v4 * self->_rippleFactor;
  }
  return result;
}

- (BOOL)_isRTL
{
  return [(UIView *)self effectiveUserInterfaceLayoutDirection] == UIUserInterfaceLayoutDirectionRightToLeft;
}

- (unint64_t)calculateHardAlignmentAtIndex:(unint64_t)a3 fromGlyphsInRange:(_NSRange)a4 toGlyphsInRange:(_NSRange)a5
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  NSUInteger v7 = a4.length;
  NSUInteger v8 = a4.location;
  if (!calculateHardAlignmentAtIndex_fromGlyphsInRange_toGlyphsInRange__memoTable)
  {
    calculateHardAlignmentAtIndex_fromGlyphsInRange_toGlyphsInRange__memoTable = (uint64_t)malloc_type_malloc(0x1452uLL, 0x30CA8487uLL);
    bzero((void *)calculateHardAlignmentAtIndex_fromGlyphsInRange_toGlyphsInRange__memoTable, 0x1452uLL);
  }
  CGRect v11 = [(UIMorphingLabelGlyphSet *)self->_srcGlyphSet glyphs];
  double v12 = [(UIMorphingLabelGlyphSet *)self->_dstGlyphSet glyphs];
  unint64_t result = 0x7FFFFFFFFFFFFFFFLL;
  if (v7 <= 0x32 && length <= 0x32)
  {
    uint64_t v14 = 0;
    CGRect v15 = &v11[v8];
    v16 = &v12[location];
    uint64_t v17 = calculateHardAlignmentAtIndex_fromGlyphsInRange_toGlyphsInRange__memoTable;
    uint64_t v18 = calculateHardAlignmentAtIndex_fromGlyphsInRange_toGlyphsInRange__memoTable + 1;
    while (1)
    {
      uint64_t v19 = -1;
      v20 = (unsigned char *)v18;
      do
      {
        if (!v14 || v19 == -1)
        {
          *(v20 - 1) = 0;
          unsigned char *v20 = 2 * (v14 == 0);
          goto LABEL_19;
        }
        unint64_t v21 = *(v20 - 103);
        unint64_t v22 = *(v20 - 3);
        if (v15[v14 - 1] == v16[v19]) {
          unint64_t v23 = *(v20 - 105) + 1;
        }
        else {
          unint64_t v23 = *(v20 - 105);
        }
        if (v23 < v21)
        {
          if (v21 >= v22)
          {
            *(_WORD *)(v20 - 1) = v21;
            goto LABEL_19;
          }
LABEL_17:
          *(v20 - 1) = v22;
          unsigned char *v20 = 2;
          goto LABEL_19;
        }
        if (v23 < v22) {
          goto LABEL_17;
        }
        *(v20 - 1) = v23;
        unsigned char *v20 = 1;
LABEL_19:
        ++v19;
        v20 += 2;
      }
      while (length != v19);
      v18 += 102;
      if (v14++ == v7)
      {
        if (v7 | length)
        {
          int v25 = *(unsigned __int8 *)(v17 + 2 * (length + 51 * v7) + 1);
          NSUInteger v26 = length;
          NSUInteger v27 = v7;
          while (1)
          {
            if (v25 == 2)
            {
              --v26;
              char v28 = 5;
              goto LABEL_30;
            }
            if (v25 == 1) {
              break;
            }
            if (!v25)
            {
              --v27;
              char v28 = 3;
LABEL_30:
              uint64_t v29 = v17 + 2 * (v26 + 51 * v27);
              int v25 = *(unsigned __int8 *)(v29 + 1);
              *(unsigned char *)(v29 + 1) = v28;
            }
            if (!(v27 | v26)) {
              goto LABEL_32;
            }
          }
          --v27;
          --v26;
          char v28 = 4;
          goto LABEL_30;
        }
LABEL_32:
        NSUInteger v30 = 0;
        for (NSUInteger i = 0; ; NSUInteger i = v33)
        {
          if (v30 >= v7)
          {
            if (i >= length || a3 >= 0x64)
            {
LABEL_64:
              if (i >= length && v30 >= v7) {
                return a3;
              }
              else {
                return 0x7FFFFFFFFFFFFFFFLL;
              }
            }
          }
          else if (a3 > 0x63)
          {
            goto LABEL_64;
          }
          if (*(unsigned char *)(v17 + 2 * (i + 51 * v30) + 1) != 4 || v15[v30] != v16[i]) {
            break;
          }
          if (v30 >= v7 && i >= length)
          {
            BOOL v32 = 1;
LABEL_46:
            NSUInteger j = v30;
            NSUInteger v33 = i;
            goto LABEL_63;
          }
          v36 = (unsigned __int8 *)(v17 + 1 + 102 * v30 + 2 * i);
          NSUInteger v33 = i;
          for (NSUInteger j = v30; j < v7 || v33 < length; ++j)
          {
            int v37 = *v36;
            v36 += 104;
            if (v37 != 4) {
              break;
            }
            if (v15[j] != v16[v33]) {
              break;
            }
            ++v33;
          }
          BOOL v32 = 1;
LABEL_63:
          self->_alignmentSrc[a3] = v30 + v8;
          self->_alignmentDst[a3] = i + location;
          self->_alignmentIsEqual[a3++] = v32;
          NSUInteger v30 = j;
        }
        NSUInteger v33 = i;
        NSUInteger j = v30;
        if (v30 >= v7)
        {
          NSUInteger v33 = i;
          NSUInteger j = v30;
          if (i >= length)
          {
            BOOL v32 = 0;
            goto LABEL_46;
          }
        }
        while (2)
        {
          int v35 = *(unsigned __int8 *)(v17 + 2 * (v33 + 51 * j) + 1);
          switch(v35)
          {
            case 3:
              ++j;
              break;
            case 5:
              goto LABEL_52;
            case 4:
              if (v15[j] == v16[v33]) {
                goto LABEL_56;
              }
              ++j;
LABEL_52:
              ++v33;
              break;
          }
          if (j >= v7 && v33 >= length)
          {
LABEL_56:
            BOOL v32 = 0;
            goto LABEL_63;
          }
          continue;
        }
      }
    }
  }
  return result;
}

- (void)calculateGlyphAlignment
{
  unint64_t v3 = [(UIMorphingLabelGlyphSet *)self->_srcGlyphSet glyphCount];
  unint64_t v4 = [(UIMorphingLabelGlyphSet *)self->_dstGlyphSet glyphCount];
  unint64_t v5 = [(UIMorphingLabelGlyphSet *)self->_srcGlyphSet glyphs];
  objc_super v6 = [(UIMorphingLabelGlyphSet *)self->_dstGlyphSet glyphs];
  unint64_t v7 = 0;
  if (v3 >= v4) {
    unint64_t v8 = v4;
  }
  else {
    unint64_t v8 = v3;
  }
  if (v8)
  {
    while (v5[v7] == v6[v7])
    {
      if (v8 == ++v7)
      {
        unint64_t v9 = 0;
        unint64_t v7 = v8;
        goto LABEL_15;
      }
    }
  }
  unint64_t v9 = v8 - v7;
  if (v8 > v7 && (float v10 = &v5[v3], v11 = &v6[v4], *(v10 - 1) == *(v11 - 1)))
  {
    uint64_t v12 = 0;
    CGRect v13 = v10 - 2;
    uint64_t v14 = v11 - 2;
    while (v7 - v8 + 1 != v12)
    {
      int v15 = v13[v12];
      int v16 = v14[v12--];
      if (v15 != v16)
      {
        unint64_t v8 = v7 - v12;
        unint64_t v9 = -v12;
        break;
      }
    }
  }
  else
  {
    unint64_t v9 = 0;
    unint64_t v8 = v7;
  }
LABEL_15:
  if (v7)
  {
    self->_alignmentSrc[0] = 0;
    self->_alignmentDst[0] = 0;
    unint64_t v17 = 1;
    self->_alignmentIsEqual[0] = 1;
  }
  else
  {
    unint64_t v17 = 0;
  }
  if (v7 != v3 || v7 != v4)
  {
    if (v3 == v8
      || v4 == v8
      || (unint64_t v18 = -[UIMorphingLabel calculateHardAlignmentAtIndex:fromGlyphsInRange:toGlyphsInRange:](self, "calculateHardAlignmentAtIndex:fromGlyphsInRange:toGlyphsInRange:", v17, v7, v3 - v8, v7, v4 - v8), v18 == 0x7FFFFFFFFFFFFFFFLL))
    {
      self->_alignmentSrc[v17] = v7;
      self->_alignmentDst[v17] = v7;
      self->_alignmentIsEqual[v17] = 0;
      unint64_t v18 = v17 + 1;
    }
    if (v9)
    {
      self->_alignmentSrc[v18] = v3 - v9;
      self->_alignmentDst[v18] = v4 - v9;
      self->_alignmentIsEqual[v18] = 1;
      unint64_t v17 = v18 + 1;
    }
    else
    {
      unint64_t v17 = v18;
    }
  }
  self->_alignmentSize = v17;
}

- (_NSRange)srcRangeOfAlignmentHunkAtIndex:(unint64_t)a3
{
  unint64_t v3 = self->_alignmentSrc[a3];
  if (self->_alignmentSize - 1 <= a3) {
    unint64_t v4 = [(UIMorphingLabelGlyphSet *)self->_srcGlyphSet glyphCount];
  }
  else {
    unint64_t v4 = self->_alignmentSrc[a3 + 1];
  }
  NSUInteger v5 = v4 - v3;
  NSUInteger v6 = v3;
  result.NSUInteger length = v5;
  result.NSUInteger location = v6;
  return result;
}

- (_NSRange)dstRangeOfAlignmentHunkAtIndex:(unint64_t)a3
{
  unint64_t v3 = self->_alignmentDst[a3];
  if (self->_alignmentSize - 1 <= a3) {
    unint64_t v4 = [(UIMorphingLabelGlyphSet *)self->_dstGlyphSet glyphCount];
  }
  else {
    unint64_t v4 = self->_alignmentDst[a3 + 1];
  }
  NSUInteger v5 = v4 - v3;
  NSUInteger v6 = v3;
  result.NSUInteger length = v5;
  result.NSUInteger location = v6;
  return result;
}

- (id)glyphViewWithImage:(id)a3 isColorGlyph:(BOOL)a4
{
  NSUInteger v5 = self;
  hiddenGlyphViews = self->_hiddenGlyphViews;
  id v7 = a3;
  if (![(NSMutableArray *)hiddenGlyphViews count] || a4)
  {
    unint64_t v8 = [[UIMorphingLabelImageView alloc] initWithImage:v7];

    if (!a4) {
      NSUInteger v5 = (UIMorphingLabel *)v5->_colorView;
    }
    [(UIView *)v5 addSubview:v8];
  }
  else
  {
    unint64_t v8 = [(NSMutableArray *)v5->_hiddenGlyphViews lastObject];
    [(NSMutableArray *)v5->_hiddenGlyphViews removeLastObject];
    [(UIMorphingLabelImageView *)v8 setImage:v7];
    double v9 = *MEMORY[0x1E4F1DAD8];
    double v10 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    [v7 size];
    double v12 = v11;
    double v14 = v13;

    -[UIView setFrame:](v8, "setFrame:", v9, v10, v12, v14);
    [(UIView *)v8 setAlpha:1.0];
    [(UIView *)v8 setHidden:0];
    [(UIView *)v5->_colorView bringSubviewToFront:v8];
  }
  return v8;
}

- (void)hideGlyph:(id)a3
{
  id v7 = a3;
  unint64_t v4 = [v7 superview];
  colorView = self->_colorView;

  if (v4 == colorView)
  {
    [v7 setHidden:1];
    [v7 setImage:0];
    NSUInteger v6 = [v7 layer];
    [v6 removeAllAnimations];

    [(NSMutableArray *)self->_hiddenGlyphViews addObject:v7];
  }
  else
  {
    [v7 removeFromSuperview];
  }
}

- (id)uniqueString
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v2 = (unsigned __int16)uniqueString_nextId++;
  int v3 = snprintf(__str, 0x100uLL, "%u", v2);
  unint64_t v4 = (void *)[[NSString alloc] initWithBytes:__str length:v3 & ~(v3 >> 31) encoding:4];
  return v4;
}

- (double)currentMediaTime
{
  int v2 = [(UIView *)self layer];
  [v2 convertTime:0 fromLayer:CACurrentMediaTime()];
  double v4 = v3;

  return v4;
}

- (void)animateGlyph:(id)a3 toPosition:(CGPoint)a4 delay:(double)a5
{
  double y = a4.y;
  double x = a4.x;
  id v49 = a3;
  unint64_t v8 = [v49 layer];
  [v8 position];
  double v10 = v9;
  double v12 = v11;

  if (v10 != x || v12 != y)
  {
    [(UIMorphingLabel *)self visibleRect];
    CGFloat v15 = v14;
    CGFloat v17 = v16;
    CGFloat v19 = v18;
    CGFloat v21 = v20;
    [v49 bounds];
    -[UIView convertRect:fromView:](self, "convertRect:fromView:", v49);
    v53.origin.double x = v22;
    v53.origin.double y = v23;
    v53.size.CGFloat width = v24;
    v53.size.CGFloat height = v25;
    v51.origin.double x = v15;
    v51.origin.double y = v17;
    v51.size.CGFloat width = v19;
    v51.size.CGFloat height = v21;
    BOOL v26 = CGRectIntersectsRect(v51, v53);
    NSUInteger v27 = [v49 layer];
    objc_msgSend(v27, "setPosition:", x, y);

    if (v26) {
      goto LABEL_7;
    }
    [(UIMorphingLabel *)self visibleRect];
    CGFloat v29 = v28;
    CGFloat v31 = v30;
    CGFloat v33 = v32;
    CGFloat v35 = v34;
    [v49 bounds];
    -[UIView convertRect:fromView:](self, "convertRect:fromView:", v49);
    v54.origin.double x = v36;
    v54.origin.double y = v37;
    v54.size.CGFloat width = v38;
    v54.size.CGFloat height = v39;
    v52.origin.double x = v29;
    v52.origin.double y = v31;
    v52.size.CGFloat width = v33;
    v52.size.CGFloat height = v35;
    if (CGRectIntersectsRect(v52, v54))
    {
LABEL_7:
      v40 = objc_msgSend(MEMORY[0x1E4F39C90], "animationWithKeyPath:", @"position", *(void *)&a5);
      [v40 setMass:2.0];
      [v40 setStiffness:300.0];
      [v40 setDamping:400.0];
      v41 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", v10 - x, v12 - y);
      [v40 setFromValue:v41];

      v42 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
      [v40 setToValue:v42];

      double v43 = 1.4 / self->_slowdown;
      *(float *)&double v43 = v43;
      [v40 setSpeed:v43];
      [v40 setDuration:1.0];
      [(UIMorphingLabel *)self currentMediaTime];
      [v40 setBeginTime:v44 + self->_slowdown * v48];
      [(_UIViewAnimationAttributes *)self->_textAnimationAttributes _frameInterval];
      objc_msgSend(v40, "setFrameInterval:");
      [v40 setFillMode:*MEMORY[0x1E4F39F98]];
      [v40 setAdditive:1];
      v45 = [v49 layer];
      v46 = [(UIMorphingLabel *)self uniqueString];
      [v45 addAnimation:v40 forKey:v46];
    }
  }
}

- (void)animateGlyph:(id)a3 toAlpha:(double)a4 duration:(double)a5 delay:(double)a6
{
  id v10 = a3;
  double v11 = [v10 layer];
  [v11 opacity];
  double v13 = v12;

  CGFloat v15 = [v10 layer];
  float v14 = a4;
  *(float *)&double v16 = v14;
  [v15 setOpacity:v16];

  if (v13 == a4) {
    goto LABEL_5;
  }
  [(UIMorphingLabel *)self visibleRect];
  CGFloat v18 = v17;
  CGFloat v20 = v19;
  CGFloat v22 = v21;
  CGFloat v24 = v23;
  [v10 bounds];
  -[UIView convertRect:fromView:](self, "convertRect:fromView:", v10);
  v47.origin.double x = v25;
  v47.origin.double y = v26;
  v47.size.CGFloat width = v27;
  v47.size.CGFloat height = v28;
  v46.origin.double x = v18;
  v46.origin.double y = v20;
  v46.size.CGFloat width = v22;
  v46.size.CGFloat height = v24;
  if (!CGRectIntersectsRect(v46, v47))
  {
LABEL_5:
    if (a4 == 0.0) {
      [(UIMorphingLabel *)self hideGlyph:v10];
    }
  }
  else
  {
    CGFloat v29 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"opacity"];
    double v30 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A480]];
    [v29 setTimingFunction:v30];

    CGFloat v31 = [NSNumber numberWithDouble:v13 - a4];
    [v29 setFromValue:v31];

    [v29 setToValue:&unk_1ED3F5880];
    double v32 = 1.0 / self->_slowdown;
    *(float *)&double v32 = v32;
    [v29 setSpeed:v32];
    [v29 setDuration:a5];
    [(UIMorphingLabel *)self currentMediaTime];
    [v29 setBeginTime:v33 + self->_slowdown * a6];
    [(_UIViewAnimationAttributes *)self->_textAnimationAttributes _frameInterval];
    objc_msgSend(v29, "setFrameInterval:");
    [v29 setFillMode:*MEMORY[0x1E4F39F98]];
    [v29 setAdditive:1];
    if (a4 == 0.0)
    {
      [MEMORY[0x1E4F39CF8] begin];
      double v34 = (void *)MEMORY[0x1E4F39CF8];
      uint64_t v40 = MEMORY[0x1E4F143A8];
      uint64_t v41 = 3221225472;
      v42 = __55__UIMorphingLabel_animateGlyph_toAlpha_duration_delay___block_invoke;
      double v43 = &unk_1E52D9F98;
      double v44 = self;
      id v35 = v10;
      id v45 = v35;
      [v34 setCompletionBlock:&v40];

      CGFloat v36 = objc_msgSend(v35, "layer", v40, v41, v42, v43, v44);
      CGFloat v37 = [(UIMorphingLabel *)self uniqueString];
      [v36 addAnimation:v29 forKey:v37];

      [MEMORY[0x1E4F39CF8] commit];
    }
    else
    {
      CGFloat v38 = [v10 layer];
      CGFloat v39 = [(UIMorphingLabel *)self uniqueString];
      [v38 addAnimation:v29 forKey:v39];
    }
  }
}

uint64_t __55__UIMorphingLabel_animateGlyph_toAlpha_duration_delay___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) hideGlyph:*(void *)(a1 + 40)];
}

- (void)animateGlyph:(id)a3 toScale:(double)a4 delay:(double)a5
{
  id v37 = a3;
  unint64_t v8 = [v37 layer];
  double v9 = [v8 valueForKeyPath:@"transform.scale.xy"];
  [v9 floatValue];
  double v11 = v10;

  if (v11 != a4)
  {
    float v12 = [v37 layer];
    double v13 = [NSNumber numberWithDouble:a4];
    [v12 setValue:v13 forKeyPath:@"transform.scale.xy"];

    [(UIMorphingLabel *)self visibleRect];
    CGFloat v15 = v14;
    CGFloat v17 = v16;
    CGFloat v19 = v18;
    CGFloat v21 = v20;
    [v37 bounds];
    -[UIView convertRect:fromView:](self, "convertRect:fromView:", v37);
    v40.origin.double x = v22;
    v40.origin.double y = v23;
    v40.size.CGFloat width = v24;
    v40.size.CGFloat height = v25;
    v39.origin.double x = v15;
    v39.origin.double y = v17;
    v39.size.CGFloat width = v19;
    v39.size.CGFloat height = v21;
    if (CGRectIntersectsRect(v39, v40))
    {
      double glyphScaleAnimationSpeed = self->_glyphScaleAnimationSpeed;
      CGFloat v27 = [MEMORY[0x1E4F39C90] animationWithKeyPath:@"transform.scale.xy"];
      CGFloat v28 = v27;
      double v29 = 1.0;
      double v30 = dbl_186B9B0B0[a4 < 1.0];
      if (a4 >= 1.0)
      {
        double v31 = 45.0;
      }
      else
      {
        double v29 = 2.0;
        double v31 = 34.0;
      }
      [v27 setMass:v29];
      [v28 setStiffness:v30];
      [v28 setDamping:v31];
      double v32 = [NSNumber numberWithDouble:v11 - a4];
      [v28 setFromValue:v32];

      [v28 setToValue:&unk_1ED3F5880];
      double v33 = glyphScaleAnimationSpeed / self->_slowdown;
      *(float *)&double v33 = v33;
      [v28 setSpeed:v33];
      [v28 setDuration:1.0];
      [(UIMorphingLabel *)self currentMediaTime];
      [v28 setBeginTime:v34 + self->_slowdown * a5];
      [(_UIViewAnimationAttributes *)self->_textAnimationAttributes _frameInterval];
      objc_msgSend(v28, "setFrameInterval:");
      [v28 setFillMode:*MEMORY[0x1E4F39F98]];
      [v28 setAdditive:1];
      id v35 = [v37 layer];
      CGFloat v36 = [(UIMorphingLabel *)self uniqueString];
      [v35 addAnimation:v28 forKey:v36];
    }
  }
}

- (void)animateShowGlyph:(id)a3 alphaDuration:(double)a4 delay:(double)a5
{
}

- (void)animateShowGlyph:(id)a3 alpha:(double)a4 alphaDuration:(double)a5 delay:(double)a6
{
  double scaleFactor = self->_scaleFactor;
  id v11 = a3;
  CATransform3DMakeScale(&v15, scaleFactor, scaleFactor, 1.0);
  float v12 = [v11 layer];
  CATransform3D v14 = v15;
  [v12 setTransform:&v14];

  double v13 = [v11 layer];
  [v13 setOpacity:0.0];

  [(UIMorphingLabel *)self animateGlyph:v11 toScale:1.0 delay:a6];
  [(UIMorphingLabel *)self animateGlyph:v11 toAlpha:a4 duration:a5 delay:a6];
}

- (void)animateHideGlyph:(id)a3 alphaDuration:(double)a4 delay:(double)a5
{
  double scaleFactor = self->_scaleFactor;
  id v9 = a3;
  [(UIMorphingLabel *)self animateGlyph:v9 toScale:scaleFactor delay:a5];
  [(UIMorphingLabel *)self animateGlyph:v9 toAlpha:0.0 duration:a4 delay:a5];
}

- (double)totalLeftOffsetForAlignmentHunkAtIndex:(unint64_t)a3
{
  uint64_t v5 = -[UIMorphingLabel srcRangeOfAlignmentHunkAtIndex:](self, "srcRangeOfAlignmentHunkAtIndex:");
  uint64_t v6 = [(UIMorphingLabel *)self dstRangeOfAlignmentHunkAtIndex:a3];
  if (self->_alignmentIsEqual[a3])
  {
    double v7 = (double)[(UIMorphingLabelGlyphSet *)self->_srcGlyphSet glyphPositions][16 * v5];
    double v8 = (double)[(UIMorphingLabelGlyphSet *)self->_dstGlyphSet glyphPositions][16 * v6];
  }
  else
  {
    srcGlyphSet = self->_srcGlyphSet;
    if (v5)
    {
      double v7 = *(double *)([(UIMorphingLabelGlyphSet *)srcGlyphSet glyphPositions] + 16 * v5 - 16);
      double v8 = *(double *)([(UIMorphingLabelGlyphSet *)self->_dstGlyphSet glyphPositions] + 16 * v6 - 16);
    }
    else
    {
      [(UIMorphingLabelGlyphSet *)srcGlyphSet lineOrigin];
      double v7 = v10;
      [(UIMorphingLabelGlyphSet *)self->_dstGlyphSet lineOrigin];
    }
  }
  return v8 - v7;
}

- (double)totalRightOffsetForAlignmentHunkAtIndex:(unint64_t)a3
{
  uint64_t v5 = -[UIMorphingLabel srcRangeOfAlignmentHunkAtIndex:](self, "srcRangeOfAlignmentHunkAtIndex:");
  uint64_t v7 = v6;
  uint64_t v8 = [(UIMorphingLabel *)self dstRangeOfAlignmentHunkAtIndex:a3];
  uint64_t v10 = v9;
  if (self->_alignmentIsEqual[a3])
  {
    double v11 = *(double *)([(UIMorphingLabelGlyphSet *)self->_srcGlyphSet glyphPositions]
                    + 16 * (v7 + v5)
                    - 16);
    double v12 = *(double *)([(UIMorphingLabelGlyphSet *)self->_dstGlyphSet glyphPositions]
                    + 16 * (v10 + v8)
                    - 16);
  }
  else
  {
    uint64_t v13 = v5 + v7;
    unint64_t v14 = [(UIMorphingLabelGlyphSet *)self->_srcGlyphSet glyphCount];
    srcGlyphSet = self->_srcGlyphSet;
    if (v13 == v14)
    {
      [(UIMorphingLabelGlyphSet *)srcGlyphSet lineOrigin];
      double v17 = v16;
      [(UIMorphingLabelGlyphSet *)self->_srcGlyphSet lineWidth];
      double v11 = v17 + v18;
      [(UIMorphingLabelGlyphSet *)self->_dstGlyphSet lineOrigin];
      double v20 = v19;
      [(UIMorphingLabelGlyphSet *)self->_dstGlyphSet lineWidth];
      double v12 = v20 + v21;
    }
    else
    {
      double v11 = (double)[(UIMorphingLabelGlyphSet *)srcGlyphSet glyphPositions][16 * v13];
      double v12 = (double)[(UIMorphingLabelGlyphSet *)self->_dstGlyphSet glyphPositions][16 * (v8 + v10)];
    }
  }
  return v12 - v11;
}

- (double)changeInWidthDueToAlignmentHunkAtIndex:(unint64_t)a3
{
  -[UIMorphingLabel totalRightOffsetForAlignmentHunkAtIndex:](self, "totalRightOffsetForAlignmentHunkAtIndex:");
  double v6 = v5;
  [(UIMorphingLabel *)self totalLeftOffsetForAlignmentHunkAtIndex:a3];
  return v6 - v7;
}

- (void)animateGlyphsInRange:(_NSRange)a3 ofGlyphSet:(id)a4 byOffset:(double)a5 delay:(double)a6
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v11 = a4;
  if (a5 != 0.0 && location < location + length)
  {
    double v20 = v11;
    do
    {
      uint64_t v13 = [v20 glyphViews];
      unint64_t v14 = [v13 objectAtIndexedSubscript:location];

      CATransform3D v15 = [v14 layer];
      [v15 position];
      double v17 = v16;
      double v19 = v18;

      -[UIMorphingLabel animateGlyph:toPosition:delay:](self, "animateGlyph:toPosition:delay:", v14, v17 + a5, v19, a6);
      id v11 = v20;
      ++location;
      --length;
    }
    while (length);
  }
}

- (void)animateChangeInWidthOutsideAlignmentHunkAtIndex:(unint64_t)a3
{
  if (!self->_alignmentIsEqual[a3])
  {
    -[UIMorphingLabel changeInWidthDueToAlignmentHunkAtIndex:](self, "changeInWidthDueToAlignmentHunkAtIndex:");
    if (v5 != 0.0)
    {
      double v6 = v5;
      double v7 = self->_alignmentDelays[a3];
      [(UIMorphingLabel *)self flushAmount];
      double v9 = -(v6 * v8);
      [(UIMorphingLabel *)self flushAmount];
      double v11 = v6 * (1.0 - v10);
      uint64_t v12 = [(UIMorphingLabel *)self srcRangeOfAlignmentHunkAtIndex:a3];
      uint64_t v14 = v13;
      uint64_t v15 = [(UIMorphingLabel *)self dstRangeOfAlignmentHunkAtIndex:a3];
      uint64_t v17 = v16;
      uint64_t v18 = v12 + v14;
      uint64_t v19 = [(UIMorphingLabelGlyphSet *)self->_srcGlyphSet glyphCount] - v18;
      uint64_t v20 = v15 + v17;
      uint64_t v21 = [(UIMorphingLabelGlyphSet *)self->_dstGlyphSet glyphCount] - v20;
      -[UIMorphingLabel animateGlyphsInRange:ofGlyphSet:byOffset:delay:](self, "animateGlyphsInRange:ofGlyphSet:byOffset:delay:", 0, v12, self->_srcGlyphSet, v9, v7);
      -[UIMorphingLabel animateGlyphsInRange:ofGlyphSet:byOffset:delay:](self, "animateGlyphsInRange:ofGlyphSet:byOffset:delay:", v18, v19, self->_srcGlyphSet, v11, v7);
      -[UIMorphingLabel animateGlyphsInRange:ofGlyphSet:byOffset:delay:](self, "animateGlyphsInRange:ofGlyphSet:byOffset:delay:", 0, v15, self->_dstGlyphSet, v9, v7);
      dstGlyphSet = self->_dstGlyphSet;
      -[UIMorphingLabel animateGlyphsInRange:ofGlyphSet:byOffset:delay:](self, "animateGlyphsInRange:ofGlyphSet:byOffset:delay:", v20, v21, dstGlyphSet, v11, v7);
    }
  }
}

- (void)initInsertionAlignmentHunkAtIndex:(unint64_t)a3
{
  uint64_t v5 = -[UIMorphingLabel srcRangeOfAlignmentHunkAtIndex:](self, "srcRangeOfAlignmentHunkAtIndex:");
  unint64_t v6 = [(UIMorphingLabel *)self dstRangeOfAlignmentHunkAtIndex:a3];
  uint64_t v8 = v7;
  if ([(UIMorphingLabelGlyphSet *)self->_srcGlyphSet glyphCount])
  {
    if (v5 | v6) {
      [(UIMorphingLabel *)self totalLeftOffsetForAlignmentHunkAtIndex:a3];
    }
    else {
      [(UIMorphingLabel *)self totalRightOffsetForAlignmentHunkAtIndex:a3];
    }
    double v10 = v9;
  }
  else
  {
    double v10 = 0.0;
  }
  if (v6 < v6 + v8)
  {
    uint64_t v11 = v6;
    do
    {
      uint64_t v12 = [(UIMorphingLabelGlyphSet *)self->_dstGlyphSet glyphViews];
      uint64_t v13 = [v12 objectAtIndexedSubscript:v6];

      uint64_t v14 = [(UIMorphingLabelGlyphSet *)self->_dstGlyphSet glyphPositions];
      double y = v14[v11].y;
      CGFloat v16 = v14[v11].x - v10;
      uint64_t v17 = [v13 layer];
      objc_msgSend(v17, "setPosition:", v16, y);

      ++v6;
      ++v11;
      --v8;
    }
    while (v8);
  }
}

- (void)animateInsertionAlignmentHunkAtIndex:(unint64_t)a3
{
  uint64_t v5 = -[UIMorphingLabel srcRangeOfAlignmentHunkAtIndex:](self, "srcRangeOfAlignmentHunkAtIndex:");
  unint64_t v6 = [(UIMorphingLabel *)self dstRangeOfAlignmentHunkAtIndex:a3];
  uint64_t v8 = v7;
  unint64_t v9 = [(UIMorphingLabelGlyphSet *)self->_srcGlyphSet glyphCount];
  if (v9) {
    BOOL v10 = (v5 | v6) == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (v10)
  {
    unsigned int v11 = (v9 != 0) ^ [(UIMorphingLabel *)self _isRTL];
    goto LABEL_7;
  }
  if (v5 == [(UIMorphingLabelGlyphSet *)self->_srcGlyphSet glyphCount])
  {
    unint64_t v13 = [(UIMorphingLabelGlyphSet *)self->_dstGlyphSet glyphCount];
    unsigned int v11 = [(UIMorphingLabel *)self _isRTL];
    if (v6 + v8 != v13) {
      goto LABEL_12;
    }
LABEL_7:
    uint64_t v12 = 1;
    goto LABEL_13;
  }
  unsigned int v11 = [(UIMorphingLabel *)self _isRTL];
LABEL_12:
  uint64_t v12 = 0;
LABEL_13:
  [(UIMorphingLabel *)self _rippleDurationForEndInsertion:v12];
  -[UIMorphingLabelGlyphSet boundingRectForGlyphsInRange:](self->_dstGlyphSet, "boundingRectForGlyphsInRange:", v6, v8);
  if (v6 < v6 + v8)
  {
    CGFloat v18 = v14;
    CGFloat v19 = v15;
    CGFloat v20 = v16;
    CGFloat v21 = v17;
    uint64_t v22 = (32 * v6) | 0x18;
    uint64_t v23 = (16 * v6) | 8;
    do
    {
      CGFloat v24 = [(UIMorphingLabelGlyphSet *)self->_dstGlyphSet glyphViews];
      CGFloat v25 = [v24 objectAtIndexedSubscript:v6];

      CGFloat v26 = [(UIMorphingLabelGlyphSet *)self->_dstGlyphSet glyphFrames];
      uint64_t v27 = *(void *)((char *)v26 + v22 - 24);
      uint64_t v28 = *(void *)((char *)v26 + v22 - 16);
      uint64_t v29 = *(void *)((char *)v26 + v22 - 8);
      uint64_t v30 = *(void *)((char *)&v26->origin.x + v22);
      if (v11) {
        CGRectGetMaxX(*(CGRect *)&v27);
      }
      else {
        CGRectGetMinX(*(CGRect *)&v27);
      }
      v33.origin.double x = v18;
      v33.origin.double y = v19;
      v33.size.CGFloat width = v20;
      v33.size.CGFloat height = v21;
      CGRectGetMinX(v33);
      v34.origin.double x = v18;
      v34.origin.double y = v19;
      v34.size.CGFloat width = v20;
      v34.size.CGFloat height = v21;
      CGRectGetMaxX(v34);
      double v31 = [(UIMorphingLabelGlyphSet *)self->_dstGlyphSet glyphPositions];
      -[UIMorphingLabel animateGlyph:toPosition:delay:](self, "animateGlyph:toPosition:delay:", v25, *(double *)((char *)v31 + v23 - 8), *(double *)((char *)&v31->x + v23), 0.0);
      double v32 = [(UIMorphingLabelGlyphSet *)self->_dstGlyphSet glyphFrames];
      -[UIMorphingLabel alphaForFrame:](self, "alphaForFrame:", *(double *)((char *)v32 + v22 - 24), *(double *)((char *)v32 + v22 - 16), *(double *)((char *)v32 + v22 - 8), *(double *)((char *)&v32->origin.x + v22));
      -[UIMorphingLabel animateShowGlyph:alpha:alphaDuration:delay:](self, "animateShowGlyph:alpha:alphaDuration:delay:", v25);

      ++v6;
      v22 += 32;
      v23 += 16;
      --v8;
    }
    while (v8);
  }
}

- (void)animateDeletionAlignmentHunkAtIndex:(unint64_t)a3
{
  unint64_t v5 = -[UIMorphingLabel srcRangeOfAlignmentHunkAtIndex:](self, "srcRangeOfAlignmentHunkAtIndex:");
  uint64_t v7 = v6;
  uint64_t v8 = [(UIMorphingLabel *)self dstRangeOfAlignmentHunkAtIndex:a3];
  if (![(UIMorphingLabelGlyphSet *)self->_dstGlyphSet glyphCount])
  {
    int v10 = 1;
    double v41 = 0.0;
    goto LABEL_5;
  }
  if (!(v5 | v8))
  {
    [(UIMorphingLabel *)self totalRightOffsetForAlignmentHunkAtIndex:a3];
    double v41 = v9;
    int v10 = 0;
LABEL_5:
    int v11 = v10 ^ [(UIMorphingLabel *)self _isRTL];
    unint64_t v12 = v5 + v7;
    double v13 = 0.1;
    *(double *)&uint64_t v14 = 0.14;
    goto LABEL_10;
  }
  unint64_t v12 = v5 + v7;
  if (v5 + v7 == [(UIMorphingLabelGlyphSet *)self->_srcGlyphSet glyphCount]
    && v8 == [(UIMorphingLabelGlyphSet *)self->_dstGlyphSet glyphCount])
  {
    [(UIMorphingLabel *)self totalLeftOffsetForAlignmentHunkAtIndex:a3];
    double v41 = v15;
    int v10 = 1;
    goto LABEL_5;
  }
  [(UIMorphingLabel *)self totalLeftOffsetForAlignmentHunkAtIndex:a3];
  double v41 = v16;
  int v11 = ![(UIMorphingLabel *)self _isRTL];
  double v13 = 0.12;
  *(double *)&uint64_t v14 = 0.1;
LABEL_10:
  double v42 = *(double *)&v14;
  double rippleFactor = self->_rippleFactor;
  -[UIMorphingLabelGlyphSet boundingRectForGlyphsInRange:](self->_srcGlyphSet, "boundingRectForGlyphsInRange:", v5, v7);
  CGFloat v45 = v19;
  CGFloat v46 = v18;
  CGFloat v43 = v21;
  CGFloat v44 = v20;
  if (v5 < v12)
  {
    double v40 = v13 * rippleFactor;
    uint64_t v22 = v5;
    uint64_t v23 = (16 * v5) | 8;
    do
    {
      CGFloat v24 = [(UIMorphingLabelGlyphSet *)self->_srcGlyphSet glyphViews];
      CGFloat v25 = [v24 objectAtIndexedSubscript:v5];

      CGFloat v26 = [(UIMorphingLabelGlyphSet *)self->_srcGlyphSet glyphPositions];
      double v27 = *(double *)((char *)v26 + v23 - 8);
      double v28 = *(double *)((char *)&v26->x + v23);
      uint64_t v29 = [(UIMorphingLabelGlyphSet *)self->_srcGlyphSet glyphFrames];
      CGFloat x = v29[v22].origin.x;
      CGFloat y = v29[v22].origin.y;
      CGFloat width = v29[v22].size.width;
      CGFloat height = v29[v22].size.height;
      if (v11) {
        double MaxX = CGRectGetMaxX(*(CGRect *)&x);
      }
      else {
        double MaxX = CGRectGetMinX(*(CGRect *)&x);
      }
      double v35 = MaxX;
      double v36 = v41 + v27;
      v47.origin.CGFloat x = v46;
      v47.origin.CGFloat y = v45;
      v47.size.CGFloat width = v44;
      v47.size.CGFloat height = v43;
      double MinX = CGRectGetMinX(v47);
      v48.origin.CGFloat x = v46;
      v48.origin.CGFloat y = v45;
      v48.size.CGFloat width = v44;
      v48.size.CGFloat height = v43;
      double v38 = v40 * ((v35 - MinX) / (CGRectGetMaxX(v48) - MinX));
      if (v11) {
        double v38 = v40 - v38;
      }
      if (v38 >= 0.0) {
        double v39 = v38;
      }
      else {
        double v39 = 0.0;
      }
      -[UIMorphingLabel animateGlyph:toPosition:delay:](self, "animateGlyph:toPosition:delay:", v25, v36, v28, 0.0);
      [(UIMorphingLabel *)self animateHideGlyph:v25 alphaDuration:v42 delay:v39];

      ++v5;
      ++v22;
      v23 += 16;
    }
    while (v12 != v5);
  }
}

- (void)initSubstitutionAlignmentHunkAtIndex:(unint64_t)a3
{
  uint64_t v5 = -[UIMorphingLabel srcRangeOfAlignmentHunkAtIndex:](self, "srcRangeOfAlignmentHunkAtIndex:");
  uint64_t v7 = v6;
  unint64_t v8 = [(UIMorphingLabel *)self dstRangeOfAlignmentHunkAtIndex:a3];
  uint64_t v10 = v9;
  if ([(UIMorphingLabelGlyphSet *)self->_srcGlyphSet glyphCount] == v7
    && [(UIMorphingLabelGlyphSet *)self->_dstGlyphSet glyphCount] == v10
    || v5 | v8)
  {
    [(UIMorphingLabel *)self totalLeftOffsetForAlignmentHunkAtIndex:a3];
  }
  else
  {
    [(UIMorphingLabel *)self totalRightOffsetForAlignmentHunkAtIndex:a3];
  }
  double v12 = v11;
  [(UIMorphingLabel *)self changeInWidthDueToAlignmentHunkAtIndex:a3];
  if (v13 > 0.0)
  {
    -[UIMorphingLabelGlyphSet boundingRectForGlyphsInRange:](self->_srcGlyphSet, "boundingRectForGlyphsInRange:", v5, v7);
    double v15 = v14;
    -[UIMorphingLabelGlyphSet boundingRectForGlyphsInRange:](self->_dstGlyphSet, "boundingRectForGlyphsInRange:", v8, v10);
    if (v15 < v16)
    {
      double v17 = v16;
      BOOL v18 = [(UIMorphingLabel *)self _isRTL];
      double v19 = v15 / v17 * 0.2;
      if (v18) {
        double v19 = 0.2 - v19;
      }
      if (v19 < 0.0) {
        double v19 = 0.0;
      }
      self->_alignmentDelays[a3] = v19;
    }
  }
  if (v8 < v8 + v10)
  {
    uint64_t v20 = v8;
    do
    {
      double v21 = [(UIMorphingLabelGlyphSet *)self->_dstGlyphSet glyphViews];
      uint64_t v22 = [v21 objectAtIndexedSubscript:v8];

      uint64_t v23 = [(UIMorphingLabelGlyphSet *)self->_dstGlyphSet glyphPositions];
      double y = v23[v20].y;
      CGFloat v25 = v23[v20].x - v12;
      CGFloat v26 = [v22 layer];
      objc_msgSend(v26, "setPosition:", v25, y);

      ++v8;
      ++v20;
      --v10;
    }
    while (v10);
  }
}

- (void)animateSubstitutionAlignmentHunkAtIndex:(unint64_t)a3
{
  unint64_t v5 = -[UIMorphingLabel srcRangeOfAlignmentHunkAtIndex:](self, "srcRangeOfAlignmentHunkAtIndex:");
  unint64_t v7 = v6;
  unint64_t v8 = [(UIMorphingLabel *)self dstRangeOfAlignmentHunkAtIndex:a3];
  uint64_t v10 = v9;
  double v11 = (double)[(UIMorphingLabelGlyphSet *)self->_dstGlyphSet glyphPositions][16 * v8];
  double v12 = [(UIMorphingLabelGlyphSet *)self->_dstGlyphSet glyphViews];
  double v13 = [v12 objectAtIndexedSubscript:v8];
  double v14 = [v13 layer];
  [v14 position];
  double v16 = v15;

  [(UIMorphingLabel *)self changeInWidthDueToAlignmentHunkAtIndex:a3];
  int v18 = v17 < 0.0;
  if (!(v5 | v8)) {
    int v18 = (v17 < 0.0) ^ (v7 < [(UIMorphingLabelGlyphSet *)self->_srcGlyphSet glyphCount]);
  }
  int v19 = v18 ^ [(UIMorphingLabel *)self _isRTL];
  -[UIMorphingLabelGlyphSet boundingRectForGlyphsInRange:](self->_dstGlyphSet, "boundingRectForGlyphsInRange:", v8, v10);
  CGFloat x = v20;
  CGFloat y = v22;
  CGFloat width = v24;
  CGFloat height = v26;
  v74 = (double *)(&self->super.super.super.isa + a3);
  if (v5 < v5 + v7)
  {
    int v73 = v19;
    double v28 = v11 - v16;
    uint64_t v29 = 408;
    unint64_t v30 = v7;
    unint64_t v31 = v5;
    do
    {
      [*(id *)((char *)&self->super.super.super.isa + v29) glyphViews];
      v33 = uint64_t v32 = v29;
      CGRect v34 = [v33 objectAtIndexedSubscript:v31];

      double v35 = [v34 layer];
      [v35 position];
      double v37 = v36;
      double v39 = v38;

      uint64_t v29 = v32;
      -[UIMorphingLabel animateGlyph:toPosition:delay:](self, "animateGlyph:toPosition:delay:", v34, v28 + v37, v39, v74[269]);
      [v34 frame];
      v81.origin.CGFloat x = v40;
      v81.origin.CGFloat y = v41;
      v81.size.CGFloat width = v42;
      v81.size.CGFloat height = v43;
      v75.origin.CGFloat x = x;
      v75.origin.CGFloat y = y;
      v75.size.CGFloat width = width;
      v75.size.CGFloat height = height;
      CGRect v76 = CGRectUnion(v75, v81);
      CGFloat x = v76.origin.x;
      CGFloat y = v76.origin.y;
      CGFloat width = v76.size.width;
      CGFloat height = v76.size.height;

      ++v31;
      --v30;
    }
    while (v30);
    int v19 = v73;
    do
    {
      CGFloat v44 = [*(id *)((char *)&self->super.super.super.isa + v29) glyphViews];
      CGFloat v45 = [v44 objectAtIndexedSubscript:v5];

      [v45 frame];
      if (v73) {
        double MaxX = CGRectGetMaxX(*(CGRect *)&v46);
      }
      else {
        double MaxX = CGRectGetMinX(*(CGRect *)&v46);
      }
      double v51 = MaxX;
      v77.origin.CGFloat x = x;
      v77.origin.CGFloat y = y;
      v77.size.CGFloat width = width;
      v77.size.CGFloat height = height;
      double MinX = CGRectGetMinX(v77);
      v78.origin.CGFloat x = x;
      v78.origin.CGFloat y = y;
      v78.size.CGFloat width = width;
      v78.size.CGFloat height = height;
      double v53 = (v51 - MinX) / (CGRectGetMaxX(v78) - MinX) * 0.2;
      if (v73) {
        double v53 = 0.2 - v53;
      }
      double v54 = 0.0;
      if (v53 >= 0.0) {
        double v54 = v53;
      }
      [(UIMorphingLabel *)self animateHideGlyph:v45 alphaDuration:0.1 delay:v54];

      ++v5;
      --v7;
    }
    while (v7);
  }
  if (v8 < v8 + v10)
  {
    uint64_t v55 = (32 * v8) | 0x18;
    uint64_t v56 = (16 * v8) | 8;
    do
    {
      v57 = [(UIMorphingLabelGlyphSet *)self->_dstGlyphSet glyphFrames];
      uint64_t v58 = *(void *)((char *)v57 + v55 - 24);
      uint64_t v59 = *(void *)((char *)v57 + v55 - 16);
      uint64_t v60 = *(void *)((char *)v57 + v55 - 8);
      uint64_t v61 = *(void *)((char *)&v57->origin.x + v55);
      if (v19) {
        double v62 = CGRectGetMaxX(*(CGRect *)&v58);
      }
      else {
        double v62 = CGRectGetMinX(*(CGRect *)&v58);
      }
      double v63 = v62;
      v64 = [(UIMorphingLabelGlyphSet *)self->_dstGlyphSet glyphViews];
      v65 = [v64 objectAtIndexedSubscript:v8];

      v66 = [(UIMorphingLabelGlyphSet *)self->_dstGlyphSet glyphPositions];
      -[UIMorphingLabel animateGlyph:toPosition:delay:](self, "animateGlyph:toPosition:delay:", v65, *(double *)((char *)v66 + v56 - 8), *(double *)((char *)&v66->x + v56), v74[269]);
      v67 = [(UIMorphingLabelGlyphSet *)self->_dstGlyphSet glyphFrames];
      -[UIMorphingLabel alphaForFrame:](self, "alphaForFrame:", *(double *)((char *)v67 + v55 - 24), *(double *)((char *)v67 + v55 - 16), *(double *)((char *)v67 + v55 - 8), *(double *)((char *)&v67->origin.x + v55));
      double v69 = v68;
      v79.origin.CGFloat x = x;
      v79.origin.CGFloat y = y;
      v79.size.CGFloat width = width;
      v79.size.CGFloat height = height;
      double v70 = CGRectGetMinX(v79);
      v80.origin.CGFloat x = x;
      v80.origin.CGFloat y = y;
      v80.size.CGFloat width = width;
      v80.size.CGFloat height = height;
      double v71 = (v63 - v70) / (CGRectGetMaxX(v80) - v70) * 0.2;
      if (v19) {
        double v71 = 0.2 - v71;
      }
      if (v71 >= 0.0) {
        double v72 = v71 + 0.02;
      }
      else {
        double v72 = 0.02;
      }
      [(UIMorphingLabel *)self animateShowGlyph:v65 alpha:v69 alphaDuration:0.14 delay:v72];

      ++v8;
      v55 += 32;
      v56 += 16;
      --v10;
    }
    while (v10);
  }
}

- (void)copyStateFromGlyph:(id)a3 toGlyph:(id)a4
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  unint64_t v7 = [v5 layer];
  [v7 position];
  double v9 = v8;
  double v11 = v10;
  double v12 = [v6 layer];
  objc_msgSend(v12, "setPosition:", v9, v11);

  double v13 = [v5 layer];
  [v13 opacity];
  LODWORD(v9) = v14;
  double v15 = [v6 layer];
  LODWORD(v16) = LODWORD(v9);
  [v15 setOpacity:v16];

  double v17 = [v5 layer];
  int v18 = v17;
  if (v17)
  {
    [v17 transform];
  }
  else
  {
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
  }
  int v19 = [v6 layer];
  v35[4] = v40;
  v35[5] = v41;
  v35[6] = v42;
  v35[7] = v43;
  v35[0] = v36;
  v35[1] = v37;
  v35[2] = v38;
  v35[3] = v39;
  [v19 setTransform:v35];

  double v20 = [v6 layer];
  [v20 removeAllAnimations];

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  double v21 = objc_msgSend(v5, "layer", 0);
  double v22 = [v21 animationKeys];

  uint64_t v23 = [v22 countByEnumeratingWithState:&v31 objects:v44 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v24; ++i)
      {
        if (*(void *)v32 != v25) {
          objc_enumerationMutation(v22);
        }
        uint64_t v27 = *(void *)(*((void *)&v31 + 1) + 8 * i);
        double v28 = [v6 layer];
        uint64_t v29 = [v5 layer];
        unint64_t v30 = [v29 animationForKey:v27];
        [v28 addAnimation:v30 forKey:v27];
      }
      uint64_t v24 = [v22 countByEnumeratingWithState:&v31 objects:v44 count:16];
    }
    while (v24);
  }
}

- (void)initMovementAlignmentHunkAtIndex:(unint64_t)a3
{
  unint64_t v5 = -[UIMorphingLabel srcRangeOfAlignmentHunkAtIndex:](self, "srcRangeOfAlignmentHunkAtIndex:");
  uint64_t v7 = v6;
  uint64_t v8 = [(UIMorphingLabel *)self dstRangeOfAlignmentHunkAtIndex:a3];
  if (v5 < v5 + v7)
  {
    uint64_t v9 = v8;
    do
    {
      double v10 = [(UIMorphingLabelGlyphSet *)self->_srcGlyphSet glyphViews];
      double v11 = [v10 objectAtIndexedSubscript:v5];

      double v12 = [(UIMorphingLabelGlyphSet *)self->_dstGlyphSet glyphViews];
      double v13 = [v12 objectAtIndexedSubscript:v9];

      [(UIMorphingLabel *)self copyStateFromGlyph:v11 toGlyph:v13];
      [(UIMorphingLabel *)self hideGlyph:v11];

      ++v5;
      ++v9;
      --v7;
    }
    while (v7);
  }
}

- (void)animateMovementAlignmentHunkAtIndex:(unint64_t)a3
{
  unint64_t v4 = [(UIMorphingLabel *)self dstRangeOfAlignmentHunkAtIndex:a3];
  if (v4 < v4 + v5)
  {
    unint64_t v6 = v4;
    uint64_t v7 = v5;
    uint64_t v8 = v4;
    uint64_t v9 = v4;
    do
    {
      double v10 = [(UIMorphingLabelGlyphSet *)self->_dstGlyphSet glyphViews];
      double v11 = [v10 objectAtIndexedSubscript:v6];

      double v12 = [(UIMorphingLabelGlyphSet *)self->_dstGlyphSet glyphPositions];
      double x = v12[v9].x;
      double y = v12[v9].y;
      double v15 = [v11 layer];
      objc_msgSend(v15, "setPosition:", x, y);

      double v16 = [(UIMorphingLabelGlyphSet *)self->_dstGlyphSet glyphFrames];
      -[UIMorphingLabel alphaForFrame:](self, "alphaForFrame:", v16[v8].origin.x, v16[v8].origin.y, v16[v8].size.width, v16[v8].size.height);
      -[UIMorphingLabel animateGlyph:toAlpha:duration:delay:](self, "animateGlyph:toAlpha:duration:delay:", v11);

      ++v6;
      ++v8;
      ++v9;
      --v7;
    }
    while (v7);
  }
}

- (void)initAlignmentHunkAtIndex:(unint64_t)a3
{
  -[UIMorphingLabel srcRangeOfAlignmentHunkAtIndex:](self, "srcRangeOfAlignmentHunkAtIndex:");
  uint64_t v6 = v5;
  [(UIMorphingLabel *)self dstRangeOfAlignmentHunkAtIndex:a3];
  BOOL v8 = self->_alignmentIsEqual[a3];
  self->_alignmentDelays[a3] = 0.0;
  if (v6)
  {
    if (v7)
    {
      if (v8)
      {
        [(UIMorphingLabel *)self initMovementAlignmentHunkAtIndex:a3];
      }
      else
      {
        [(UIMorphingLabel *)self initSubstitutionAlignmentHunkAtIndex:a3];
      }
    }
    else
    {
      [(UIMorphingLabel *)self initDeletionAlignmentHunkAtIndex:a3];
    }
  }
  else
  {
    [(UIMorphingLabel *)self initInsertionAlignmentHunkAtIndex:a3];
  }
}

- (void)animateAlignmentHunkAtIndex:(unint64_t)a3
{
  -[UIMorphingLabel srcRangeOfAlignmentHunkAtIndex:](self, "srcRangeOfAlignmentHunkAtIndex:");
  uint64_t v6 = v5;
  [(UIMorphingLabel *)self dstRangeOfAlignmentHunkAtIndex:a3];
  if (v6)
  {
    if (v7)
    {
      if (self->_alignmentIsEqual[a3])
      {
        [(UIMorphingLabel *)self animateMovementAlignmentHunkAtIndex:a3];
      }
      else
      {
        [(UIMorphingLabel *)self animateSubstitutionAlignmentHunkAtIndex:a3];
      }
    }
    else
    {
      [(UIMorphingLabel *)self animateDeletionAlignmentHunkAtIndex:a3];
    }
  }
  else
  {
    [(UIMorphingLabel *)self animateInsertionAlignmentHunkAtIndex:a3];
  }
}

- (void)animateGlyphs
{
  [(UIMorphingLabel *)self currentMediaTime];
  double lastUpdateTime = self->_lastUpdateTime;
  self->_isDoingFastAnimation = 0;
  double v5 = v4 - lastUpdateTime;
  double v6 = v5 + v5;
  BOOL v7 = v5 < 0.5;
  double v8 = 1.0;
  if (!v7) {
    double v6 = 1.0;
  }
  self->_double rippleFactor = v6;
  if (v6 >= 0.5) {
    double v8 = 1.0 - (v6 + -0.5 + v6 + -0.5) + (v6 + -0.5 + v6 + -0.5) * self->_initialScale;
  }
  self->_double scaleFactor = v8;
  self->_slowdown = self->_rippleFactor * UIAnimationDragCoefficient();
  [(UIMorphingLabel *)self calculateGlyphAlignment];
  if (self->_alignmentSize)
  {
    unint64_t v9 = 0;
    do
    {
      [(UIMorphingLabel *)self initAlignmentHunkAtIndex:v9++];
      unint64_t alignmentSize = self->_alignmentSize;
    }
    while (v9 < alignmentSize);
    if (alignmentSize)
    {
      for (unint64_t i = 0; i < v12; ++i)
      {
        [(UIMorphingLabel *)self animateChangeInWidthOutsideAlignmentHunkAtIndex:i];
        unint64_t v12 = self->_alignmentSize;
      }
      if (v12)
      {
        unint64_t v13 = 0;
        do
          [(UIMorphingLabel *)self animateAlignmentHunkAtIndex:v13++];
        while (v13 < self->_alignmentSize);
      }
    }
  }
  if ([(UIMorphingLabelGlyphSet *)self->_dstGlyphSet glyphCount])
  {
    unint64_t v14 = 0;
    do
    {
      double v15 = [(UIMorphingLabelGlyphSet *)self->_dstGlyphSet glyphViews];
      double v16 = [v15 objectAtIndexedSubscript:v14];

      [(UIMorphingLabelGlyphSet *)self->_dstGlyphSet glyphPositions];
      ++v14;
    }
    while (v14 < [(UIMorphingLabelGlyphSet *)self->_dstGlyphSet glyphCount]);
  }
}

- (id)attributedStringForText:(id)a3
{
  v12[2] = *MEMORY[0x1E4F143B8];
  double v4 = (__CFString *)a3;
  if (v4) {
    double v5 = v4;
  }
  else {
    double v5 = &stru_1ED0E84C0;
  }
  uint64_t v6 = *(void *)off_1E52D2048;
  v11[0] = *(void *)off_1E52D2040;
  v11[1] = v6;
  textColor = self->_textColor;
  v12[0] = self->_font;
  v12[1] = textColor;
  double v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
  unint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v5 attributes:v8];

  return v9;
}

- (id)attributedString
{
  return [(UIMorphingLabel *)self attributedStringForText:self->_text];
}

- (void)setText:(id)a3
{
  double v4 = (NSString *)a3;
  if (self->_text != v4)
  {
    double v8 = v4;
    if (-[NSString isEqualToString:](v4, "isEqualToString:"))
    {
      double v4 = v8;
    }
    else
    {
      double v5 = (void *)[(NSString *)v8 copy];

      objc_storeStrong((id *)&self->_text, v5);
      self->_textDidChange = 1;
      if (!self->_textAnimationAttributes)
      {
        uint64_t v6 = +[UIView _currentAnimationAttributes];
        textAnimationAttributes = self->_textAnimationAttributes;
        self->_textAnimationAttributes = v6;
      }
      [(UIView *)self setNeedsLayout];
      double v4 = (NSString *)v5;
    }
  }
}

- (void)setTextColor:(id)a3
{
  id v6 = a3;
  if ([v6 isEqual:self->_textColor])
  {
    double v4 = v6;
  }
  else
  {
    double v5 = (void *)[v6 copy];

    objc_storeStrong((id *)&self->_textColor, v5);
    self->_textColorDidChange = 1;
    [(UIView *)self setNeedsLayout];
    double v4 = v5;
  }
}

- (void)setFont:(id)a3
{
  id v9 = a3;
  if ([v9 isEqual:self->_font])
  {
    double v4 = v9;
  }
  else
  {
    double v5 = v9;
    if (!v9)
    {
      double v5 = +[UIMorphingLabel preferredFontWithSize:17.0];
    }
    id v10 = v5;
    id v6 = (void *)[v5 copy];

    objc_storeStrong((id *)&self->_font, v6);
    self->_textDidChange = 1;
    if (!self->_textAnimationAttributes)
    {
      BOOL v7 = +[UIView _currentAnimationAttributes];
      textAnimationAttributes = self->_textAnimationAttributes;
      self->_textAnimationAttributes = v7;
    }
    [(UIView *)self setNeedsLayout];
    double v4 = v6;
  }
}

- (void)layoutSubviews
{
  if (![(UIMorphingLabel *)self suppressLayoutSubviews])
  {
    [(UIView *)self->_colorView frame];
    CGFloat v4 = v3;
    CGFloat v6 = v5;
    CGFloat v8 = v7;
    CGFloat v10 = v9;
    [(UIView *)self bounds];
    v26.origin.double x = v11;
    v26.origin.double y = v12;
    v26.size.CGFloat width = v13;
    v26.size.CGFloat height = v14;
    v25.origin.double x = v4;
    v25.origin.double y = v6;
    v25.size.CGFloat width = v8;
    v25.size.CGFloat height = v10;
    BOOL v15 = CGRectEqualToRect(v25, v26);
    if (!v15)
    {
      [(UIView *)self bounds];
      -[UIView setFrame:](self->_colorView, "setFrame:");
    }
    if (self->_enableAnimation && self->_dstGlyphSet && !_AXSReduceMotionEnabled())
    {
      double v22 = +[UIDevice currentDevice];
      BOOL v16 = [v22 _predictionGraphicsQuality] != 10;
    }
    else
    {
      BOOL v16 = 0;
    }
    if (self->_textDidChange || !v15)
    {
      objc_storeStrong((id *)&self->_srcGlyphSet, self->_dstGlyphSet);
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __33__UIMorphingLabel_layoutSubviews__block_invoke;
      v24[3] = &unk_1E52D9F70;
      v24[4] = self;
      +[UIView performWithoutAnimation:v24];
      if (v16 && self->_textAnimationAttributes)
      {
        [(UIMorphingLabel *)self animateGlyphs];
      }
      else
      {
        v23[0] = MEMORY[0x1E4F143A8];
        v23[1] = 3221225472;
        v23[2] = __33__UIMorphingLabel_layoutSubviews__block_invoke_2;
        v23[3] = &unk_1E52D9F70;
        v23[4] = self;
        +[UIView performWithoutAnimation:v23];
      }
      self->_textDidChange = 0;
      textAnimationAttributes = self->_textAnimationAttributes;
      self->_textAnimationAttributes = 0;
    }
    if (self->_textColorDidChange)
    {
      int v19 = [(UIView *)self->_colorView layer];
      objc_msgSend(v19, "setValue:forKeyPath:", -[UIColor CGColor](self->_textColor, "CGColor"), @"filters.color.inputColor");

      double v20 = [(UIView *)self->_colorView layer];
      [v20 removeAnimationForKey:@"textColor"];

      self->_textColorDidChange = 0;
    }
    [(UIMorphingLabel *)self currentMediaTime];
    self->_double lastUpdateTime = v21;
  }
}

void __33__UIMorphingLabel_layoutSubviews__block_invoke(uint64_t a1)
{
  int v2 = [UIMorphingLabelGlyphSet alloc];
  double v3 = *(void **)(a1 + 32);
  id v7 = [v3 attributedString];
  uint64_t v4 = [(UIMorphingLabelGlyphSet *)v2 initWithLabel:v3 attributedString:v7];
  uint64_t v5 = *(void *)(a1 + 32);
  CGFloat v6 = *(void **)(v5 + 416);
  *(void *)(v5 + 416) = v4;
}

uint64_t __33__UIMorphingLabel_layoutSubviews__block_invoke_2(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 408) removeGlyphs];
  uint64_t v2 = *(void *)(a1 + 32);
  double v3 = *(void **)(v2 + 408);
  *(void *)(v2 + 408) = 0;

  uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 416);
  return [v4 placeGlyphs];
}

- (BOOL)canFitText:(id)a3
{
  [(UIMorphingLabel *)self requiredWidthForText:a3];
  double v5 = v4;
  [(UIView *)self bounds];
  return v5 <= v6;
}

- (double)flushAmount
{
  int64_t textAlignment = self->_textAlignment;
  double result = 0.0;
  if (textAlignment == 1) {
    double result = 0.5;
  }
  if (textAlignment == 2) {
    return 1.0;
  }
  return result;
}

- (double)requiredWidthForText:(id)a3
{
  double v3 = [(UIMorphingLabel *)self attributedStringForText:a3];
  [v3 size];
  double v5 = v4;

  return v5;
}

- (void)contentSizeDidChange:(id)a3
{
  +[UIMorphingLabel preferredFontWithSize:](UIMorphingLabel, "preferredFontWithSize:", a3, 17.0);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(UIMorphingLabel *)self setFont:v4];
}

- (NSString)text
{
  return self->_text;
}

- (UIFont)font
{
  return self->_font;
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (int64_t)textAlignment
{
  return self->_textAlignment;
}

- (void)setTextAlignment:(int64_t)a3
{
  self->_int64_t textAlignment = a3;
}

- (CGRect)visibleRect
{
  double x = self->_visibleRect.origin.x;
  double y = self->_visibleRect.origin.y;
  double width = self->_visibleRect.size.width;
  double height = self->_visibleRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (BOOL)suppressLayoutSubviews
{
  return self->_suppressLayoutSubviews;
}

- (void)setSuppressLayoutSubviews:(BOOL)a3
{
  self->_suppressLayoutSubviews = a3;
}

- (BOOL)enableAnimation
{
  return self->_enableAnimation;
}

- (void)setEnableAnimation:(BOOL)a3
{
  self->_enableAnimation = a3;
}

- (double)initialScale
{
  return self->_initialScale;
}

- (void)setInitialScale:(double)a3
{
  self->_initialScale = a3;
}

- (double)glyphScaleAnimationSpeed
{
  return self->_glyphScaleAnimationSpeed;
}

- (void)setGlyphScaleAnimationSpeed:(double)a3
{
  self->_double glyphScaleAnimationSpeed = a3;
}

- (double)rippleDuration
{
  return self->_rippleDuration;
}

- (void)setRippleDuration:(double)a3
{
  self->_rippleDuration = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_font, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_textAnimationAttributes, 0);
  objc_storeStrong((id *)&self->_colorView, 0);
  objc_storeStrong((id *)&self->_hiddenGlyphViews, 0);
  objc_storeStrong((id *)&self->_dstGlyphSet, 0);
  objc_storeStrong((id *)&self->_srcGlyphSet, 0);
}

@end