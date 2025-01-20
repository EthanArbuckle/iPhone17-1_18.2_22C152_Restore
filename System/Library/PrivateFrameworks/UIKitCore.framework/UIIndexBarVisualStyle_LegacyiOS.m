@interface UIIndexBarVisualStyle_LegacyiOS
- (BOOL)canBecomeFocused;
- (BOOL)overlay;
- (BOOL)updateSectionForTouch:(id)a3 withEvent:(id)a4;
- (CGRect)_visibleBoundsForRect:(CGRect)a3 stride:(double *)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
- (UIColor)nonTrackingBackgroundColor;
- (UIIndexBarVisualStyle_LegacyiOS)initWithView:(id)a3;
- (double)_lineSpacingForCurrentIdiom;
- (double)indexWidth;
- (double)lineSpacing;
- (double)minLineHeight;
- (double)renderingHeightForDisplayEntry:(id)a3;
- (double)trackingChangeHysteresis;
- (id)displayEntryFromEntry:(id)a3;
- (id)font;
- (void)displayEntriesUpdated;
- (void)drawRect:(CGRect)a3;
- (void)indexColorUpdated;
- (void)legibilityWeightOrPreferredContentSizeUpdated;
- (void)setNonTrackingBackgroundColor:(id)a3;
- (void)sizeUpdated;
@end

@implementation UIIndexBarVisualStyle_LegacyiOS

- (id)displayEntryFromEntry:(id)a3
{
  v22[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = objc_alloc_init(UIIndexBarDisplayEntry_LegacyIOS);
  [(UIIndexBarDisplayEntry *)v5 setEntry:v4];
  switch([v4 type])
  {
    case 0:
      v21[0] = *(void *)off_1E52D2040;
      v6 = [(UIIndexBarVisualStyle_LegacyiOS *)self font];
      v21[1] = *MEMORY[0x1E4F24748];
      v22[0] = v6;
      v22[1] = *MEMORY[0x1E4F1CFD0];
      v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:2];

      id v8 = objc_alloc(MEMORY[0x1E4F28B18]);
      v9 = [v4 title];
      CFAttributedStringRef v10 = (const __CFAttributedString *)[v8 initWithString:v9 attributes:v7];

      CTLineRef v11 = CTLineCreateWithAttributedString(v10);
      [(UIIndexBarDisplayEntry_LegacyIOS *)v5 setLine:v11];

      CGRect BoundsWithOptions = CTLineGetBoundsWithOptions(v11, 0x10uLL);
      -[UIIndexBarDisplayEntry_LegacyIOS setBounds:](v5, "setBounds:", BoundsWithOptions.origin.x, BoundsWithOptions.origin.y, BoundsWithOptions.size.width, BoundsWithOptions.size.height);
      CGRect v25 = CTLineGetBoundsWithOptions(v11, 8uLL);
      -[UIIndexBarDisplayEntry_LegacyIOS setTypeBounds:](v5, "setTypeBounds:", v25.origin.x, v25.origin.y, v25.size.width, v25.size.height);

      break;
    case 1:
      v12 = [(UIIndexBarVisualStyle_Base *)self indexBarView];
      v13 = +[UIIndexBarEntry _dotImageInView:v12];
      [(UIIndexBarDisplayEntry_LegacyIOS *)v5 setImage:v13];

      goto LABEL_7;
    case 2:
      v14 = @"UISectionListPoundSign";
      goto LABEL_6;
    case 3:
      v14 = @"UITableViewIndexSearchGlyph";
LABEL_6:
      v12 = _UIImageWithName(v14);
      [(UIIndexBarDisplayEntry_LegacyIOS *)v5 setImage:v12];
LABEL_7:

      double v15 = *MEMORY[0x1E4F1DAD8];
      double v16 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
      v17 = [v4 image];
      [v17 size];
      -[UIIndexBarDisplayEntry_LegacyIOS setBounds:](v5, "setBounds:", v15, v16, v18, v19);

      [(UIIndexBarDisplayEntry_LegacyIOS *)v5 bounds];
      -[UIIndexBarDisplayEntry_LegacyIOS setTypeBounds:](v5, "setTypeBounds:");
      break;
    default:
      break;
  }

  return v5;
}

- (id)font
{
  v2 = [(UIIndexBarVisualStyle_Base *)self indexBarView];
  v3 = [v2 traitCollection];
  [v3 userInterfaceIdiom];

  id v4 = [off_1E52D39B8 boldSystemFontOfSize:11.0];
  return v4;
}

- (void)indexColorUpdated
{
  id v2 = [(UIIndexBarVisualStyle_Base *)self indexBarView];
  [v2 setNeedsDisplay];
}

- (void)displayEntriesUpdated
{
  self->_cachedSizeToFit = (CGSize)*MEMORY[0x1E4F1DB30];
  id v2 = [(UIIndexBarVisualStyle_Base *)self indexBarView];
  [v2 setNeedsDisplay];
}

- (void)sizeUpdated
{
  CGSize v2 = (CGSize)*MEMORY[0x1E4F1DB30];
  self->_cachedSizeToFit = (CGSize)*MEMORY[0x1E4F1DB30];
  self->_cachedSize = v2;
  id v3 = [(UIIndexBarVisualStyle_Base *)self indexBarView];
  [v3 setNeedsDisplay];
}

- (double)minLineHeight
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v3 = [(UIIndexBarVisualStyle_Base *)self indexBarView];
  id v4 = [v3 traitCollection];
  uint64_t v5 = [v4 userInterfaceIdiom];

  if (v5 == 3)
  {
    [(UIIndexBarVisualStyle_LegacyiOS *)self _lineSpacingForCurrentIdiom];
    v6 = [(UIIndexBarVisualStyle_Base *)self indexBarView];
    UIRoundToViewScale(v6);
    double v8 = v7;

    return v8;
  }
  else
  {
    double verticalTextHeightEstimate = self->_verticalTextHeightEstimate;
    if (verticalTextHeightEstimate == 0.0)
    {
      uint64_t v17 = *(void *)off_1E52D2040;
      CTLineRef v11 = [(UIIndexBarVisualStyle_LegacyiOS *)self font];
      v18[0] = v11;
      v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];

      CFAttributedStringRef v13 = (const __CFAttributedString *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:0x1ED183200 attributes:v12];
      v14 = CTLineCreateWithAttributedString(v13);
      if (v14)
      {
        double v15 = v14;
        CGRect BoundsWithOptions = CTLineGetBoundsWithOptions(v14, 8uLL);
        self->_double verticalTextHeightEstimate = BoundsWithOptions.size.height;
        CFRelease(v15);
      }

      double verticalTextHeightEstimate = self->_verticalTextHeightEstimate;
    }
    [(UIIndexBarVisualStyle_LegacyiOS *)self _lineSpacingForCurrentIdiom];
    return verticalTextHeightEstimate + v16;
  }
}

- (double)lineSpacing
{
  CGSize v2 = [(UIIndexBarVisualStyle_Base *)self indexBarView];
  id v3 = [v2 traitCollection];
  if (([v3 userInterfaceIdiom] & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    double v4 = 16.0;
  }
  else {
    double v4 = 6.0;
  }

  return v4;
}

- (CGRect)_visibleBoundsForRect:(CGRect)a3 stride:(double *)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  CFAttributedStringRef v10 = [(UIIndexBarVisualStyle_Base *)self indexBarView];
  CTLineRef v11 = [v10 displayEntries];
  uint64_t v12 = [v11 count];

  if (v12)
  {
    [(UIIndexBarVisualStyle_LegacyiOS *)self _lineSpacingForCurrentIdiom];
    double v14 = v13;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    double v15 = [(UIIndexBarVisualStyle_Base *)self indexBarView];
    double v16 = [v15 displayEntries];

    uint64_t v17 = [v16 countByEnumeratingWithState:&v41 objects:v45 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v42;
      double v20 = 0.0;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v42 != v19) {
            objc_enumerationMutation(v16);
          }
          [*(id *)(*((void *)&v41 + 1) + 8 * i) typeBounds];
          v22 = [(UIIndexBarVisualStyle_Base *)self indexBarView];
          UIRoundToViewScale(v22);
          double v20 = v20 + v23;
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v41 objects:v45 count:16];
      }
      while (v18);
    }
    else
    {
      double v20 = 0.0;
    }

    v26 = [(UIIndexBarVisualStyle_Base *)self indexBarView];
    v27 = [v26 displayEntries];
    uint64_t v28 = [v27 count];

    uint64_t v29 = v28 - 1;
    double v30 = v20 + v14 * (double)(unint64_t)(v28 - 1);
    v31 = [(UIIndexBarVisualStyle_Base *)self indexBarView];
    v32 = [v31 displayEntries];
    v33 = [v32 objectAtIndexedSubscript:v29];

    [v33 typeBounds];
    double v25 = v30 - v34;
    v47.origin.CGFloat x = x;
    v47.origin.CGFloat y = y;
    v47.size.CGFloat width = width;
    v47.size.CGFloat height = height;
    CGRectGetMinY(v47);
    v48.origin.CGFloat x = x;
    v48.origin.CGFloat y = y;
    v48.size.CGFloat width = width;
    v48.size.CGFloat height = height;
    CGRectGetHeight(v48);
    v35 = [(UIIndexBarVisualStyle_Base *)self indexBarView];
    UIRoundToViewScale(v35);
    double v24 = v36;

    if (a4) {
      *a4 = v14;
    }
  }
  else
  {
    CGFloat x = *MEMORY[0x1E4F1DB28];
    double v24 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    CGFloat width = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v25 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }
  double v37 = x;
  double v38 = v24;
  double v39 = width;
  double v40 = v25;
  result.size.CGFloat height = v40;
  result.size.CGFloat width = v39;
  result.origin.CGFloat y = v38;
  result.origin.CGFloat x = v37;
  return result;
}

- (double)renderingHeightForDisplayEntry:(id)a3
{
  [a3 typeBounds];
  return CGRectGetHeight(*(CGRect *)&v3);
}

- (void)drawRect:(CGRect)a3
{
  double v4 = [(UIIndexBarVisualStyle_Base *)self indexBarView];
  [v4 effectiveBounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  ContextStack = GetContextStack(0);
  if (*(int *)ContextStack < 1) {
    double v14 = 0;
  }
  else {
    double v14 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
  }
  double v15 = [(UIIndexBarVisualStyle_Base *)self indexBarView];
  double v16 = [v15 backgroundColor];

  if (v16) {
    goto LABEL_5;
  }
  double v16 = [(UIIndexBarVisualStyle_Base *)self indexBarView];
  uint64_t v17 = [v16 traitCollection];
  if ([v17 userInterfaceIdiom] == 3)
  {

    goto LABEL_8;
  }
  char v62 = dyld_program_sdk_at_least();

  if ((v62 & 1) == 0)
  {
    double v16 = +[UIColor colorWithWhite:1.0 alpha:0.9];
    if (v16)
    {
LABEL_5:
      [v16 set];
      v66.origin.CGFloat x = v6;
      v66.origin.CGFloat y = v8;
      v66.size.CGFloat width = v10;
      v66.size.CGFloat height = v12;
      CGContextFillRect(v14, v66);
LABEL_8:
    }
  }
  double v65 = 0.0;
  -[UIIndexBarVisualStyle_LegacyiOS _visibleBoundsForRect:stride:](self, "_visibleBoundsForRect:stride:", &v65, v6, v8, v10, v12);
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;
  v26 = [(UIIndexBarVisualStyle_Base *)self indexBarView];
  v27 = [v26 indexColor];

  [v27 set];
  uint64_t v28 = [(UIIndexBarVisualStyle_Base *)self indexBarView];
  uint64_t v29 = [v28 displayEntries];
  uint64_t v30 = [v29 count];

  if (v30)
  {
    for (uint64_t i = 0; i != v30; ++i)
    {
      v32 = [(UIIndexBarVisualStyle_Base *)self indexBarView];
      v33 = [v32 displayEntries];
      double v34 = [v33 objectAtIndexedSubscript:i];

      [v34 bounds];
      double v36 = v35;
      double v38 = v37;
      double v40 = v39;
      double v42 = v41;
      -[UIIndexBarVisualStyle_LegacyiOS willDrawEntryAtIndex:indexBounds:entryBounds:context:originalColor:](self, "willDrawEntryAtIndex:indexBounds:entryBounds:context:originalColor:", i, v14, v27, v19, v21, v23, v25, v35, v37, v39, v41);
      long long v43 = [v34 image];

      if (v43)
      {
        long long v44 = [v34 image];
        v45 = [v44 imageWithTintColor:v27 renderingMode:1];

        v67.origin.CGFloat x = v19;
        v67.origin.CGFloat y = v21;
        v67.size.CGFloat width = v23;
        v67.size.CGFloat height = v25;
        CGRectGetMinX(v67);
        double v63 = v38;
        double v46 = v36;
        v68.origin.CGFloat x = v19;
        v68.origin.CGFloat y = v21;
        v68.size.CGFloat width = v23;
        v68.size.CGFloat height = v25;
        CGRectGetWidth(v68);
        CGRect v47 = [(UIIndexBarVisualStyle_Base *)self indexBarView];
        UIRoundToViewScale(v47);
        double v49 = v48;
        v69.origin.CGFloat x = v19;
        v69.origin.CGFloat y = v21;
        v69.size.CGFloat width = v23;
        v69.size.CGFloat height = v25;
        CGRectGetMinY(v69);
        v50 = [(UIIndexBarVisualStyle_Base *)self indexBarView];
        UIRoundToViewScale(v50);
        double v52 = v51;

        double v53 = v49;
        double v36 = v46;
        double v38 = v63;
        objc_msgSend(v45, "drawAtPoint:blendMode:alpha:", 0, v53, v52, 1.0);

        double v25 = v42;
      }
      else
      {
        v54 = [v34 line];

        if (v54)
        {
          CGContextSaveGState(v14);
          v70.origin.CGFloat x = v19;
          v70.origin.CGFloat y = v21;
          v70.size.CGFloat width = v23;
          v70.size.CGFloat height = v25;
          CGRectGetMinX(v70);
          double v63 = v36;
          v71.origin.CGFloat x = v19;
          v71.origin.CGFloat y = v21;
          v71.size.CGFloat width = v23;
          v71.size.CGFloat height = v25;
          CGRectGetWidth(v71);
          v55 = [(UIIndexBarVisualStyle_Base *)self indexBarView];
          UIRoundToViewScale(v55);
          CGFloat v57 = v56;
          v72.origin.CGFloat x = v19;
          v72.origin.CGFloat y = v21;
          v72.size.CGFloat width = v23;
          v72.size.CGFloat height = v25;
          CGRectGetMinY(v72);
          [v34 typeBounds];
          v58 = [(UIIndexBarVisualStyle_Base *)self indexBarView];
          UIRoundToViewScale(v58);
          double v60 = v59;

          v64.b = 0.0;
          v64.c = 0.0;
          v64.a = 1.0;
          v64.d = -1.0;
          v64.tCGFloat x = v57;
          v64.tCGFloat y = v60;
          double v36 = v63;
          CGContextSetTextMatrix(v14, &v64);
          v61 = [v34 line];
          CTLineDraw(v61, v14);

          CGContextRestoreGState(v14);
          double v25 = v60 - v21;
        }
      }
      -[UIIndexBarVisualStyle_LegacyiOS didDrawEntryAtIndex:indexBounds:entryBounds:context:originalColor:](self, "didDrawEntryAtIndex:indexBounds:entryBounds:context:originalColor:", i, v14, v27, v19, v21, v23, v25, v36, v38, v40, v42, *(void *)&v63);
      double v21 = v21 + v25 + v65;
    }
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  p_cachedSize = &self->_cachedSize;
  double v7 = self->_cachedSize.width;
  double v8 = self->_cachedSize.height;
  BOOL v9 = v7 == *MEMORY[0x1E4F1DB30] && v8 == *(double *)(MEMORY[0x1E4F1DB30] + 8);
  if (v9 || (self->_cachedSizeToFit.width == width ? (BOOL v10 = self->_cachedSizeToFit.height == height) : (BOOL v10 = 0), !v10))
  {
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    double v11 = [(UIIndexBarVisualStyle_Base *)self indexBarView];
    double v12 = [v11 displayEntries];

    uint64_t v13 = [v12 countByEnumeratingWithState:&v31 objects:v35 count:16];
    double v14 = 0.0;
    double v15 = 0.0;
    if (v13)
    {
      uint64_t v16 = v13;
      uint64_t v17 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v32 != v17) {
            objc_enumerationMutation(v12);
          }
          double v19 = *(void **)(*((void *)&v31 + 1) + 8 * i);
          [v19 bounds];
          double v21 = v20;
          [(UIIndexBarVisualStyle_LegacyiOS *)self _lineSpacingForCurrentIdiom];
          double v23 = v22;
          [v19 bounds];
          if (v24 > v15)
          {
            [v19 bounds];
            double v15 = v25;
          }
          double v14 = v14 + v21 + v23 + v23;
        }
        uint64_t v16 = [v12 countByEnumeratingWithState:&v31 objects:v35 count:16];
      }
      while (v16);
    }

    double v26 = fmax((height - v14) * 0.5, 0.0);
    self->_bottomPadding = v26;
    self->_topPadding = v26;
    [(UIIndexBarVisualStyle_LegacyiOS *)self indexWidth];
    v27 = [(UIIndexBarVisualStyle_Base *)self indexBarView];
    UICeilToViewScale(v27);
    double v29 = v28;

    if (v29 > width) {
      double v30 = width;
    }
    else {
      double v30 = v29;
    }
    p_cachedSize->double width = v30;
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

- (double)_lineSpacingForCurrentIdiom
{
  CGSize v2 = [(UIIndexBarVisualStyle_Base *)self indexBarView];
  uint64_t v3 = [v2 traitCollection];
  if (([v3 userInterfaceIdiom] & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    double v4 = 16.0;
  }
  else {
    double v4 = 6.0;
  }

  return v4;
}

- (double)indexWidth
{
  CGSize v2 = [(UIIndexBarVisualStyle_Base *)self indexBarView];
  uint64_t v3 = [v2 traitCollection];

  double v4 = _UIDefaultIndexBarWidthForTraitCollection(v3);
  return v4;
}

- (UIIndexBarVisualStyle_LegacyiOS)initWithView:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)UIIndexBarVisualStyle_LegacyiOS;
  double v5 = [(UIIndexBarVisualStyle_Base *)&v8 initWithView:v4];
  if (v5)
  {
    [v4 setOpaque:0];
    [v4 setDeliversTouchesForGesturesToSuperview:0];
    [v4 setExclusiveTouch:1];
    CGSize v6 = (CGSize)*MEMORY[0x1E4F1DB30];
    v5->_cachedSize = (CGSize)*MEMORY[0x1E4F1DB30];
    v5->_cachedSizeToFit = v6;
    [v4 setClipsToBounds:0];
    [v4 setBackgroundColor:0];
  }

  return v5;
}

- (BOOL)overlay
{
  return 0;
}

- (BOOL)canBecomeFocused
{
  uint64_t v3 = [(UIIndexBarVisualStyle_Base *)self indexBarView];
  id v4 = [v3 traitCollection];
  if ([v4 userInterfaceIdiom] == 3)
  {
    BOOL v5 = 0;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)UIIndexBarVisualStyle_LegacyiOS;
    BOOL v5 = [(UIIndexBarVisualStyle_Base *)&v7 canBecomeFocused];
  }

  return v5;
}

- (void)legibilityWeightOrPreferredContentSizeUpdated
{
  self->_double verticalTextHeightEstimate = 0.0;
}

- (double)trackingChangeHysteresis
{
  uint64_t v3 = [(UIIndexBarVisualStyle_Base *)self indexBarView];
  id v4 = [v3 traitCollection];
  if ([v4 userInterfaceIdiom] == 1)
  {
  }
  else
  {
    BOOL v5 = [(UIIndexBarVisualStyle_Base *)self indexBarView];
    CGSize v6 = [v5 traitCollection];
    uint64_t v7 = [v6 userInterfaceIdiom];

    double result = 0.0;
    if (v7) {
      return result;
    }
  }
  return 11.0;
}

- (BOOL)updateSectionForTouch:(id)a3 withEvent:(id)a4
{
  id v5 = a3;
  CGSize v6 = [(UIIndexBarVisualStyle_Base *)self indexBarView];
  [v6 effectiveBounds];
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;

  double v15 = [(UIIndexBarVisualStyle_Base *)self indexBarView];
  [v5 locationInView:v15];
  double v17 = v16;
  double v19 = v18;

  double v20 = [(UIIndexBarVisualStyle_Base *)self indexBarView];
  double v21 = [v20 entries];

  if ([v21 count] >= 1)
  {
    int64_t v22 = -[UIIndexBarVisualStyle_Base _indexForEntryAtPoint:](self, "_indexForEntryAtPoint:", v17, v19);
    v26.origin.CGFloat x = v8;
    v26.origin.CGFloat y = v10;
    v26.size.double width = v12;
    v26.size.double height = v14;
    if (v19 >= CGRectGetMinY(v26))
    {
      v27.origin.CGFloat x = v8;
      v27.origin.CGFloat y = v10;
      v27.size.double width = v12;
      v27.size.double height = v14;
      if (v19 <= CGRectGetMaxY(v27) && v22 != 0x7FFFFFFFFFFFFFFFLL)
      {
        double v23 = [v21 objectAtIndexedSubscript:v22];
        double v24 = [(UIIndexBarVisualStyle_Base *)self indexBarView];
        objc_msgSend(v24, "_didSelectEntry:atIndex:location:", v23, v22, v17, v19);
      }
    }
  }

  return 0;
}

- (UIColor)nonTrackingBackgroundColor
{
  return self->_nonTrackingBackgroundColor;
}

- (void)setNonTrackingBackgroundColor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nonTrackingBackgroundColor, 0);
  objc_storeStrong((id *)&self->_font, 0);
  objc_storeStrong((id *)&self->_titles, 0);
}

@end