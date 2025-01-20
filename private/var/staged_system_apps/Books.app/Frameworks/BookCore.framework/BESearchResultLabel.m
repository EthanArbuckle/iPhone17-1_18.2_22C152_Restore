@interface BESearchResultLabel
- (CGRect)p_boundingRect;
- (CGSize)intrinsicContentSize;
- (NSArray)lines;
- (UIColor)boldColor;
- (_NSRange)boldRange;
- (double)_labelLineSpacing;
- (void)dealloc;
- (void)drawRect:(CGRect)a3;
- (void)layoutLines;
- (void)layoutSubviews;
- (void)setBoldColor:(id)a3;
- (void)setBoldRange:(_NSRange)a3;
- (void)setLines:(id)a3;
- (void)setPreferredMaxLayoutWidth:(double)a3;
- (void)updateConstraints;
@end

@implementation BESearchResultLabel

- (void)dealloc
{
  [(BESearchResultLabel *)self setBoldColor:0];
  v3.receiver = self;
  v3.super_class = (Class)BESearchResultLabel;
  [(BESearchResultLabel *)&v3 dealloc];
}

- (void)updateConstraints
{
  [(BESearchResultLabel *)self layoutLines];
  v3.receiver = self;
  v3.super_class = (Class)BESearchResultLabel;
  [(BESearchResultLabel *)&v3 updateConstraints];
}

- (void)setBoldColor:(id)a3
{
  objc_storeStrong((id *)&self->_boldColor, a3);

  [(BESearchResultLabel *)self invalidateIntrinsicContentSize];
}

- (void)setBoldRange:(_NSRange)a3
{
  self->_boldRange = a3;
  [(BESearchResultLabel *)self invalidateIntrinsicContentSize];
}

- (void)setPreferredMaxLayoutWidth:(double)a3
{
  v4.receiver = self;
  v4.super_class = (Class)BESearchResultLabel;
  [(BESearchResultLabel *)&v4 setPreferredMaxLayoutWidth:a3];
  [(BESearchResultLabel *)self layoutLines];
  [(BESearchResultLabel *)self invalidateIntrinsicContentSize];
}

- (void)layoutLines
{
  v2 = self;
  replacement = [(BESearchResultLabel *)self text];
  id v3 = [(__CFString *)replacement length];
  objc_super v4 = replacement;
  if (v3)
  {
    Mutable = CFAttributedStringCreateMutable(0, (CFIndex)[(__CFString *)replacement length]);
    v65.CFIndex location = 0;
    v65.length = 0;
    CFAttributedStringReplaceString(Mutable, v65, replacement);
    v6 = [(BESearchResultLabel *)v2 font];

    v66.length = (CFIndex)[(__CFString *)replacement length];
    v66.CFIndex location = 0;
    v60 = v6;
    CFAttributedStringSetAttribute(Mutable, v66, kCTFontAttributeName, v6);
    id v7 = [(__CFString *)replacement length];
    id v8 = [(BESearchResultLabel *)v2 textColor];
    id v9 = [v8 CGColor];
    v67.CFIndex location = 0;
    v67.length = (CFIndex)v7;
    CFAttributedStringSetAttribute(Mutable, v67, kCTForegroundColorAttributeName, v9);

    v10 = [(BESearchResultLabel *)v2 font];
    v11 = [v10 fontDescriptor];
    uint64_t v12 = [v11 fontDescriptorWithSymbolicTraits:2];

    v13 = [(BESearchResultLabel *)v2 font];
    [v13 pointSize];
    +[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v12);
    v14 = (const void *)objc_claimAutoreleasedReturnValue();

    id v15 = [(BESearchResultLabel *)v2 boldRange];
    [(BESearchResultLabel *)v2 boldRange];
    CFIndex v17 = v16;
    v68.CFIndex location = (CFIndex)v15;
    v68.length = v17;
    CFAttributedStringSetAttribute(Mutable, v68, kCTFontAttributeName, v14);
    v18 = [(BESearchResultLabel *)v2 boldColor];

    if (v18)
    {
      id v19 = [(BESearchResultLabel *)v2 boldColor];
      id v20 = [v19 CGColor];
      v69.CFIndex location = (CFIndex)v15;
      v69.length = v17;
      CFAttributedStringSetAttribute(Mutable, v69, kCTForegroundColorAttributeName, v20);
    }
    typesetter = CTTypesetterCreateWithAttributedString(Mutable);
    [(BESearchResultLabel *)v2 preferredMaxLayoutWidth];
    double v22 = v21;
    CFArrayRef v23 = CFArrayCreateMutable(0, 5, &kCFTypeArrayCallBacks);
    v57 = (void *)v12;
    cf = Mutable;
    v55 = v14;
    if ([(__CFString *)replacement length])
    {
      unint64_t v24 = 0;
      CFIndex Count = 0;
      v26 = typesetter;
      do
      {
        CFIndex v27 = CTTypesetterSuggestLineBreak(typesetter, v24, v22);
        v70.CFIndex location = v24;
        v70.length = v27;
        CTLineRef Line = CTTypesetterCreateLine(typesetter, v70);
        if (!Line) {
          break;
        }
        CTLineRef v29 = Line;
        unint64_t v30 = v27 + v24;
        if (v24 <= (unint64_t)[(BESearchResultLabel *)v2 boldRange]
          && v30 >= (unint64_t)[(BESearchResultLabel *)v2 boldRange])
        {
          CFIndex Count = CFArrayGetCount(v23);
        }
        CFArrayAppendValue(v23, v29);
        CFRelease(v29);
        v24 += v27;
      }
      while (v30 < (unint64_t)[(__CFString *)replacement length]);
    }
    else
    {
      CFIndex Count = 0;
      v26 = typesetter;
    }
    id v31 = [(BESearchResultLabel *)v2 numberOfLines];
    if ((uint64_t)v31 <= 1) {
      CFIndex v32 = 1;
    }
    else {
      CFIndex v32 = (CFIndex)v31;
    }
    v33 = CFArrayCreateMutable(0, v32, &kCFTypeArrayCallBacks);
    if (CFArrayGetCount(v23) <= v32)
    {
      v73.length = CFArrayGetCount(v23);
      v73.CFIndex location = 0;
      CFArrayAppendArray(v33, v23, v73);
    }
    else
    {
      if (Count <= 1) {
        uint64_t v34 = 1;
      }
      else {
        uint64_t v34 = Count;
      }
      uint64_t v35 = v34 - 1;
      if (v34 - 1 > CFArrayGetCount(v23) - v32) {
        uint64_t v35 = CFArrayGetCount(v23) - v32;
      }
      uint64_t v36 = 0;
      CFIndex v37 = v35 + v32;
      CFIndex v38 = v32 - 1;
      theArray = v33;
      CFIndex v59 = v32 - 1;
      do
      {
        ValueAtIndex = (const __CTLine *)CFArrayGetValueAtIndex(v23, v35 + v36);
        CTLineTruncationType v41 = v37 < CFArrayGetCount(v23) && v38 == v36;
        if (v36) {
          BOOL v42 = 1;
        }
        else {
          BOOL v42 = v35 <= 0;
        }
        if (!v42 || v41)
        {
          CFRange StringRange = CTLineGetStringRange(ValueAtIndex);
          CFIndex location = StringRange.location;
          if (v41)
          {
            v45.length = (CFIndex)[(__CFString *)replacement length] - StringRange.location;
          }
          else
          {
            v45.length = StringRange.length + StringRange.location;
            CFIndex location = 0;
          }
          v45.CFIndex location = location;
          v46 = CTTypesetterCreateLine(v26, v45);
          id v47 = [objc_alloc((Class)NSMutableAttributedString) initWithString:@"…"];
          v71.length = (CFIndex)[v47 length];
          v71.CFIndex location = 0;
          CFAttributedStringSetAttribute((CFMutableAttributedStringRef)v47, v71, kCTFontAttributeName, v60);
          id v48 = [v47 length];
          v49 = v2;
          id v50 = [(BESearchResultLabel *)v2 textColor];
          id v51 = [v50 CGColor];
          v72.CFIndex location = 0;
          v72.length = (CFIndex)v48;
          CFAttributedStringSetAttribute((CFMutableAttributedStringRef)v47, v72, kCTForegroundColorAttributeName, v51);

          v52 = CTLineCreateWithAttributedString((CFAttributedStringRef)v47);
          TruncatedCTLineRef Line = CTLineCreateTruncatedLine(v46, v22, v41, v52);
          if (TruncatedLine)
          {
            CTLineRef v54 = TruncatedLine;
            CFArrayAppendValue(theArray, TruncatedLine);
            CFRelease(v54);
          }
          CFRelease(v46);
          CFRelease(v52);

          v2 = v49;
          v26 = typesetter;
          v33 = theArray;
          CFIndex v38 = v59;
        }
        else
        {
          CFArrayAppendValue(v33, ValueAtIndex);
        }
        ++v36;
      }
      while (v35 + v36 < v37);
    }
    [(BESearchResultLabel *)v2 setLines:v33];
    CFRelease(cf);
    CFRelease(v26);
    CFRelease(v23);
    CFRelease(v33);

    objc_super v4 = replacement;
  }

  _objc_release_x1(v3, v4);
}

- (CGRect)p_boundingRect
{
  CGFloat x = CGRectZero.origin.x;
  CGFloat y = CGRectZero.origin.y;
  CGFloat width = CGRectZero.size.width;
  CGFloat height = CGRectZero.size.height;
  CFArrayRef v7 = [(BESearchResultLabel *)self lines];
  CFArrayRef v8 = v7;
  if (v7)
  {
    id v9 = [(__CFArray *)v7 count];
    if (v9)
    {
      id v10 = v9;
      CFIndex v11 = 0;
      do
      {
        CGFloat v25 = height;
        ValueAtIndeCGFloat x = (const __CTLine *)CFArrayGetValueAtIndex(v8, v11);
        CGRect BoundsWithOptions = CTLineGetBoundsWithOptions(ValueAtIndex, 0);
        CGFloat v13 = BoundsWithOptions.origin.x;
        CGFloat v14 = BoundsWithOptions.origin.y;
        CGFloat v15 = BoundsWithOptions.size.width;
        CGFloat v16 = BoundsWithOptions.size.height;
        ++v11;
        [(BESearchResultLabel *)self _labelLineSpacing];
        double v18 = v17;
        v27.origin.CGFloat x = v13;
        v27.origin.CGFloat y = v14;
        v27.size.CGFloat width = v15;
        v27.size.CGFloat height = v16;
        CGFloat v19 = -(CGRectGetMaxY(v27) - (double)v11 * v18);
        v28.origin.CGFloat x = v13;
        v28.origin.CGFloat y = v14;
        v28.size.CGFloat width = v15;
        v28.size.CGFloat height = v16;
        CGFloat v20 = v19 - CGRectGetMinY(v28);
        v29.origin.CGFloat x = v13;
        v29.origin.CGFloat y = v14;
        v29.size.CGFloat width = v15;
        v29.size.CGFloat height = v16;
        CGRect v33 = CGRectOffset(v29, 0.0, v20);
        v30.origin.CGFloat x = x;
        v30.origin.CGFloat y = y;
        v30.size.CGFloat height = v25;
        v30.size.CGFloat width = width;
        CGRect v31 = CGRectUnion(v30, v33);
        CGFloat x = v31.origin.x;
        CGFloat y = v31.origin.y;
        CGFloat width = v31.size.width;
        CGFloat height = v31.size.height;
      }
      while (v10 != (id)v11);
    }
  }

  double v21 = x;
  double v22 = y;
  double v23 = width;
  double v24 = height;
  result.size.CGFloat height = v24;
  result.size.CGFloat width = v23;
  result.origin.CGFloat y = v22;
  result.origin.CGFloat x = v21;
  return result;
}

- (double)_labelLineSpacing
{
  if (!+[UIFont bc_accessibilityFontSizesEnabled])
  {
    v2 = &kBESearchResultLabelLineSpacing;
    return *(double *)v2;
  }
  if (+[UIFont bc_contentSizeCategoryIsGreaterThan:UIContentSizeCategoryAccessibilityExtraLarge])
  {
    v2 = &kBESearchResultLabelAccessibilityLargestLineSpacing;
    return *(double *)v2;
  }
  unsigned int v4 = +[UIFont bc_contentSizeCategoryIsGreaterThan:UIContentSizeCategoryAccessibilityLarge];
  double result = 40.0;
  if (!v4) {
    return 30.0;
  }
  return result;
}

- (void)layoutSubviews
{
  v2.receiver = self;
  v2.super_class = (Class)BESearchResultLabel;
  [(BESearchResultLabel *)&v2 layoutSubviews];
}

- (void)drawRect:(CGRect)a3
{
  CFArrayRef v4 = [(BESearchResultLabel *)self lines];
  CFArrayRef v5 = v4;
  if (v4)
  {
    id v6 = [(__CFArray *)v4 count];
    CurrentContext = UIGraphicsGetCurrentContext();
    CGAffineTransformMakeScale(&v19, 1.0, -1.0);
    CGContextSetTextMatrix(CurrentContext, &v19);
    if (v6)
    {
      CFIndex v8 = 0;
      double v9 = 0.0;
      do
      {
        ValueAtIndeCGFloat x = (const __CTLine *)CFArrayGetValueAtIndex(v5, v8);
        [(BESearchResultLabel *)self _labelLineSpacing];
        double v9 = v9 + v11;
        CGContextSetTextPosition(CurrentContext, 0.0, v9);
        uint64_t v12 = [(BESearchResultLabel *)self shadowColor];

        if (v12)
        {
          [(BESearchResultLabel *)self shadowOffset];
          CGFloat v14 = v13;
          CGFloat v16 = v15;
          id v17 = [(BESearchResultLabel *)self shadowColor];
          double v18 = (CGColor *)[v17 CGColor];
          v20.CGFloat width = v14;
          v20.CGFloat height = v16;
          CGContextSetShadowWithColor(CurrentContext, v20, 0.0, v18);
        }
        CTLineDraw(ValueAtIndex, CurrentContext);
        ++v8;
      }
      while (v6 != (id)v8);
    }
  }
}

- (CGSize)intrinsicContentSize
{
  v13.receiver = self;
  v13.super_class = (Class)BESearchResultLabel;
  [(BESearchResultLabel *)&v13 intrinsicContentSize];
  double v4 = v3;
  double v6 = v5;
  CFArrayRef v7 = [(BESearchResultLabel *)self text];
  id v8 = [v7 length];

  if (v8)
  {
    [(BESearchResultLabel *)self p_boundingRect];
    double v4 = v9;
    double v6 = v10;
  }
  double v11 = v4;
  double v12 = v6;
  result.CGFloat height = v12;
  result.CGFloat width = v11;
  return result;
}

- (_NSRange)boldRange
{
  p_boldRange = &self->_boldRange;
  NSUInteger location = self->_boldRange.location;
  NSUInteger length = p_boldRange->length;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (UIColor)boldColor
{
  return self->_boldColor;
}

- (NSArray)lines
{
  return self->_lines;
}

- (void)setLines:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lines, 0);

  objc_storeStrong((id *)&self->_boldColor, 0);
}

@end