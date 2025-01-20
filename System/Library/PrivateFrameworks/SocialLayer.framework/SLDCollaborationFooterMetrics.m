@interface SLDCollaborationFooterMetrics
- (CGColor)labelColor;
- (CGColor)secondaryLabelColor;
- (CGRect)boundingRectForString:(id)a3;
- (NSAttributedString)subtitleAttributedString;
- (NSAttributedString)titleAttributedString;
- (SLDCollaborationFooterMetrics)initWithSlotStyle:(id)a3 tag:(id)a4;
- (SLDCollaborationFooterSlotTag)tag;
- (UISSlotStyle)style;
- (double)expectedHeight;
- (id)attributedStringWithString:(id)a3 textStyle:(__CFString *)a4 color:(CGColor *)a5;
@end

@implementation SLDCollaborationFooterMetrics

- (SLDCollaborationFooterMetrics)initWithSlotStyle:(id)a3 tag:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SLDCollaborationFooterMetrics;
  v9 = [(SLDCollaborationFooterMetrics *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_style, a3);
    objc_storeStrong((id *)&v10->_tag, a4);
  }

  return v10;
}

- (NSAttributedString)titleAttributedString
{
  v3 = [(SLDCollaborationFooterMetrics *)self tag];
  v4 = [v3 title];

  if (v4)
  {
    v5 = [(SLDCollaborationFooterMetrics *)self labelColor];
    v6 = [(SLDCollaborationFooterMetrics *)self tag];
    id v7 = [v6 title];
    id v8 = [(SLDCollaborationFooterMetrics *)self attributedStringWithString:v7 textStyle:*MEMORY[0x1E4F24828] color:v5];
  }
  else
  {
    id v8 = 0;
  }
  return (NSAttributedString *)v8;
}

- (NSAttributedString)subtitleAttributedString
{
  v3 = [(SLDCollaborationFooterMetrics *)self tag];
  v4 = [v3 subtitle];

  if (v4) {
    goto LABEL_2;
  }
  id v7 = [(SLDCollaborationFooterMetrics *)self tag];
  id v8 = [v7 title];

  if (!v8)
  {
    v4 = @"Collaboration";
LABEL_2:
    v5 = [(SLDCollaborationFooterMetrics *)self secondaryLabelColor];
    v6 = [(SLDCollaborationFooterMetrics *)self attributedStringWithString:v4 textStyle:*MEMORY[0x1E4F24820] color:v5];

    goto LABEL_5;
  }
  v6 = 0;
LABEL_5:
  return (NSAttributedString *)v6;
}

- (id)attributedStringWithString:(id)a3 textStyle:(__CFString *)a4 color:(CGColor *)a5
{
  v25[1] = *MEMORY[0x1E4F143B8];
  uint64_t v24 = *MEMORY[0x1E4F24620];
  uint64_t v22 = *MEMORY[0x1E4F24610];
  v23 = &unk_1EEC28070;
  id v7 = (void *)MEMORY[0x1E4F1C9E8];
  id v8 = a3;
  v9 = [v7 dictionaryWithObjects:&v23 forKeys:&v22 count:1];
  v25[0] = v9;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:&v24 count:1];

  v11 = [(SLDCollaborationFooterMetrics *)self style];
  CTContentSizeCategoryForSlotStyle(v11);

  objc_super v12 = (const __CTFontDescriptor *)CTFontDescriptorCreateWithTextStyleAndAttributes();
  CTFontRef v13 = CTFontCreateWithFontDescriptor(v12, 0.0, 0);
  CFRelease(v12);
  id v14 = objc_alloc_init(MEMORY[0x1E4FB0848]);
  [v14 setLineBreakStrategy:0xFFFFLL];
  uint64_t v15 = *MEMORY[0x1E4FB06F8];
  v20[0] = *MEMORY[0x1E4FB0700];
  v20[1] = v15;
  v21[0] = a5;
  v21[1] = v13;
  v20[2] = *MEMORY[0x1E4FB0738];
  v16 = (void *)[v14 copy];
  v21[2] = v16;
  v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:3];

  v18 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v8 attributes:v17];
  return v18;
}

- (CGRect)boundingRectForString:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    v5 = [(SLDCollaborationFooterMetrics *)self tag];
    [v5 maxWidth];
    CGFloat v7 = v6;

    CFIndex v8 = [v4 length];
    v9 = CTFramesetterCreateWithAttributedString((CFAttributedStringRef)v4);
    v28.CGFloat height = 1.79769313e308;
    v27.location = 0;
    v27.length = v8;
    v28.CGFloat width = v7;
    CGSize v10 = CTFramesetterSuggestFrameSizeWithConstraints(v9, v27, 0, v28, 0);
    CGFloat width = v10.width;
    CGFloat height = v10.height;
    CFRelease(v9);
    CTFontRef v13 = CTLineCreateWithAttributedString((CFAttributedStringRef)v4);

    id v14 = [(SLDCollaborationFooterMetrics *)self style];
    double v15 = (double)[v14 displayScale];

    v16 = [(SLDCollaborationFooterMetrics *)self style];
    double v17 = 0.0;
    if ([v16 layoutDirection] == 1) {
      double v18 = 1.0;
    }
    else {
      double v18 = 0.0;
    }

    v19 = [(SLDCollaborationFooterMetrics *)self tag];
    [v19 maxWidth];
    double PenOffsetForFlush = CTLineGetPenOffsetForFlush(v13, v18, v20);
    double v22 = SLRoundToScale(PenOffsetForFlush, v15);

    CFRelease(v13);
  }
  else
  {
    double v22 = *MEMORY[0x1E4F1DB28];
    double v17 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    CGFloat width = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    CGFloat height = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }
  double v23 = v22;
  double v24 = v17;
  double v25 = width;
  double v26 = height;
  result.size.CGFloat height = v26;
  result.size.CGFloat width = v25;
  result.origin.y = v24;
  result.origin.x = v23;
  return result;
}

- (double)expectedHeight
{
  v3 = [(SLDCollaborationFooterMetrics *)self titleAttributedString];
  [(SLDCollaborationFooterMetrics *)self boundingRectForString:v3];
  double v5 = v4;

  double v6 = [(SLDCollaborationFooterMetrics *)self subtitleAttributedString];
  [(SLDCollaborationFooterMetrics *)self boundingRectForString:v6];
  double v8 = v7;

  return v5 + v8;
}

- (CGColor)labelColor
{
  v2 = [(SLDCollaborationFooterMetrics *)self style];
  if ([v2 userInterfaceStyle])
  {
    CGFloat v3 = 1.0;
    CGFloat v4 = 1.0;
    CGFloat v5 = 1.0;
  }
  else
  {
    CGFloat v3 = 0.0;
    CGFloat v4 = 0.0;
    CGFloat v5 = 0.0;
  }
  CGColorRef SRGB = CGColorCreateSRGB(v3, v4, v5, 1.0);

  return (CGColor *)CFAutorelease(SRGB);
}

- (CGColor)secondaryLabelColor
{
  v2 = [(SLDCollaborationFooterMetrics *)self style];
  if ([v2 userInterfaceStyle])
  {
    CGFloat v3 = 0.75;
    CGFloat v4 = 0.75;
    CGFloat v5 = 0.75;
  }
  else
  {
    CGFloat v3 = 0.25;
    CGFloat v4 = 0.25;
    CGFloat v5 = 0.25;
  }
  CGColorRef SRGB = CGColorCreateSRGB(v3, v4, v5, 0.6);

  return (CGColor *)CFAutorelease(SRGB);
}

- (UISSlotStyle)style
{
  return self->_style;
}

- (SLDCollaborationFooterSlotTag)tag
{
  return self->_tag;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tag, 0);
  objc_storeStrong((id *)&self->_style, 0);
}

@end