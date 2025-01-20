@interface WFSlotTemplateImageAttachment
- (CGRect)attachmentBoundsForTextContainer:(id)a3 proposedLineFragment:(CGRect)a4 glyphPosition:(CGPoint)a5 characterIndex:(unint64_t)a6;
- (UIFont)fontForAlignment;
- (void)setFontForAlignment:(id)a3;
@end

@implementation WFSlotTemplateImageAttachment

- (void).cxx_destruct
{
}

- (void)setFontForAlignment:(id)a3
{
}

- (UIFont)fontForAlignment
{
  return self->_fontForAlignment;
}

- (CGRect)attachmentBoundsForTextContainer:(id)a3 proposedLineFragment:(CGRect)a4 glyphPosition:(CGPoint)a5 characterIndex:(unint64_t)a6
{
  v7 = [(WFSlotTemplateImageAttachment *)self image];
  [v7 size];
  double v9 = v8;
  double v11 = v10;

  v12 = [(WFSlotTemplateImageAttachment *)self fontForAlignment];
  objc_msgSend(v12, "wf_lineHeight");
  double v14 = v13 * 0.75;

  if (v11 < v14) {
    double v14 = v11;
  }
  double v15 = v9 / v11 * v14;
  v16 = [(WFSlotTemplateImageAttachment *)self fontForAlignment];
  [v16 capHeight];
  double v18 = (v17 - v14) * 0.5;

  double v19 = 0.0;
  double v20 = v18;
  double v21 = v15;
  double v22 = v14;
  result.size.height = v22;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

@end