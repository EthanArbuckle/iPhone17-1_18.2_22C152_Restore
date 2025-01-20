@interface SKUITextLayout
+ (__CFAttributedString)_newAttributedStringWithRequest:(id)a3;
+ (__CFAttributedString)newAttributedStringWithText:(id)a3;
- (BOOL)requiresTruncation;
- (CGSize)textSize;
- (CGSize)truncatedSize;
- (SKUITextLayout)initWithLayoutRequest:(id)a3;
- (__CTFrame)textFrame;
- (double)lineHeight;
- (void)dealloc;
@end

@implementation SKUITextLayout

- (SKUITextLayout)initWithLayoutRequest:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    -[SKUITextLayout initWithLayoutRequest:]();
  }
  v22.receiver = self;
  v22.super_class = (Class)SKUITextLayout;
  v5 = [(SKUITextLayout *)&v22 init];
  if (v5)
  {
    CFAttributedStringRef v6 = [v4 attributedText];
    if (v6
      || (CFAttributedStringRef v6 = (const __CFAttributedString *)[(id)objc_opt_class() _newAttributedStringWithRequest:v4]) != 0)
    {
      [v4 width];
      double v8 = v7;
      v9 = CTFramesetterCreateWithAttributedString(v6);
      v5->_framesetter = v9;
      v25.CGFloat height = 1.79769313e308;
      v23.location = 0;
      v23.length = 0;
      v25.double width = v8;
      CGSize v10 = CTFramesetterSuggestFrameSizeWithConstraints(v9, v23, 0, v25, 0);
      Mutable = CGPathCreateMutable();
      v12 = Mutable;
      CGFloat height = v10.height;
      if (v8 >= v10.width) {
        double width = v8;
      }
      else {
        double width = v10.width;
      }
      uint64_t v15 = 0;
      uint64_t v16 = 0;
      CGPathAddRect(Mutable, 0, *(CGRect *)(&height - 3));
      v24.location = 0;
      v24.length = 0;
      v5->_textFrame = CTFramesetterCreateFrame(v5->_framesetter, v24, v12, 0);
      CGPathRelease(v12);
      v5->_size = (CGSize)vcvtq_f64_f32(vrndp_f32(vcvt_f32_f64((float64x2_t)v10)));
      CFArrayRef Lines = CTFrameGetLines(v5->_textFrame);
      CFIndex Count = CFArrayGetCount(Lines);
      CFIndex v19 = [v4 numberOfLines];
      if (v19 && v19 < Count)
      {
        v5->_requiresTruncation = 1;
        v5->_truncatedSize.double width = SKUITextLayoutSizeForCTFrame(v5->_textFrame, v19);
        v5->_truncatedSize.CGFloat height = v20;
      }
      v5->_lineHeight = SKUIAttributedStringGetLineHeight(v6);
      CFRelease(v6);
    }
  }

  return v5;
}

- (void)dealloc
{
  textFrame = self->_textFrame;
  if (textFrame) {
    CFRelease(textFrame);
  }
  framesetter = self->_framesetter;
  if (framesetter) {
    CFRelease(framesetter);
  }
  v5.receiver = self;
  v5.super_class = (Class)SKUITextLayout;
  [(SKUITextLayout *)&v5 dealloc];
}

+ (__CFAttributedString)newAttributedStringWithText:(id)a3
{
  id v4 = a3;
  objc_super v5 = objc_alloc_init(SKUITextLayoutRequest);
  [(SKUITextLayoutRequest *)v5 setText:v4];

  CFAttributedStringRef v6 = (__CFAttributedString *)[a1 _newAttributedStringWithRequest:v5];
  return v6;
}

+ (__CFAttributedString)_newAttributedStringWithRequest:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4FB0848]);
  [v4 setMinimumLineHeight:16.0];
  [v4 setLineBreakMode:0];
  objc_msgSend(v4, "setAlignment:", NSTextAlignmentFromCTTextAlignment((CTTextAlignment)objc_msgSend(v3, "textAlignment")));
  objc_super v5 = 0;
  if ((unint64_t)[v3 fontWeight] <= 2)
  {
    CFAttributedStringRef v6 = (void *)MEMORY[0x1E4FB08E0];
    [v3 fontSize];
    double v7 = objc_msgSend(v6, "systemFontOfSize:weight:");
    objc_super v5 = [v7 fontName];
  }
  if (UIAccessibilityIsBoldTextEnabled())
  {
    double v8 = (void *)MEMORY[0x1E4FB08E0];
    [v3 fontSize];
    v9 = objc_msgSend(v8, "systemFontOfSize:");
    uint64_t v10 = [v9 fontName];

    objc_super v5 = (__CFString *)v10;
  }
  [v3 fontSize];
  CTFontRef v12 = CTFontCreateWithName(v5, v11, 0);
  id v13 = objc_alloc(MEMORY[0x1E4F1C9E8]);
  CFDictionaryRef v14 = (const __CFDictionary *)objc_msgSend(v13, "initWithObjectsAndKeys:", v12, *MEMORY[0x1E4F243F0], *MEMORY[0x1E4F1CFD0], *MEMORY[0x1E4F24748], v4, *MEMORY[0x1E4FB0738], 0);
  uint64_t v15 = [v3 text];
  uint64_t v16 = CFAttributedStringCreate(0, v15, v14);

  CFRelease(v12);
  return v16;
}

- (double)lineHeight
{
  return self->_lineHeight;
}

- (BOOL)requiresTruncation
{
  return self->_requiresTruncation;
}

- (CGSize)textSize
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGSize)truncatedSize
{
  double width = self->_truncatedSize.width;
  double height = self->_truncatedSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (__CTFrame)textFrame
{
  return self->_textFrame;
}

- (void)initWithLayoutRequest:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUITextLayout initWithLayoutRequest:]";
}

@end