@interface WFLibraryLayoutMetrics
+ (id)metricsCompatibleWithTraitCollection:(id)a3 viewWidth:(double)a4 layoutMargins:(UIEdgeInsets)a5;
+ (id)metricsCompatibleWithTraitCollection:(id)a3 viewWidth:(double)a4 layoutMargins:(UIEdgeInsets)a5 needsTopPadding:(BOOL)a6;
+ (id)workflowSubtitleFontCompatibleWithTraitCollection:(id)a3;
+ (id)workflowTitleFontCompatibleWithTraitCollection:(id)a3;
+ (id)workflowTitleFontInDefaultSize;
- (CGSize)workflowGlyphSize;
- (CGSize)workflowSize;
- (UIEdgeInsets)scaledEdgeInsets:(UIEdgeInsets)a3;
- (UIEdgeInsets)sectionInset;
- (UIEdgeInsets)workflowContentEdgeInsets;
- (UIFont)workflowSubtitleFont;
- (UIFont)workflowTitleFont;
- (WFFloatingViewConfiguration)floatingViewConfiguration;
- (WFLibraryLayoutMetrics)initWithTraitCollection:(id)a3 viewWidth:(double)a4 layoutMargins:(UIEdgeInsets)a5 needsTopPadding:(BOOL)a6;
- (double)capEdgeInsets:(double)a3 min:(double)a4 max:(double)a5;
- (double)cornerRadius;
- (double)interitemSpacing;
- (double)lineSpacing;
- (double)scaledValueForValue:(double)a3;
- (double)workflowGlyphDimension;
- (double)workflowIconToLabelMargin;
- (unint64_t)appIconFormat;
- (unint64_t)itemsPerBanner;
- (unint64_t)itemsPerRow;
@end

@implementation WFLibraryLayoutMetrics

- (WFFloatingViewConfiguration)floatingViewConfiguration
{
  return self->_floatingViewConfiguration;
}

- (double)workflowGlyphDimension
{
  [(WFLibraryLayoutMetrics *)self scaledValueForValue:29.0];
  double result = fmax(v2, 29.0);
  if (result > 40.0) {
    return 40.0;
  }
  return result;
}

- (unint64_t)itemsPerRow
{
  return self->_itemsPerRow;
}

- (UIEdgeInsets)scaledEdgeInsets:(UIEdgeInsets)a3
{
  double right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  [(WFLibraryLayoutMetrics *)self scaledValueForValue:a3.top];
  double v8 = v7;
  [(WFLibraryLayoutMetrics *)self scaledValueForValue:left];
  double v10 = v9;
  [(WFLibraryLayoutMetrics *)self scaledValueForValue:bottom];
  double v12 = v11;
  [(WFLibraryLayoutMetrics *)self scaledValueForValue:right];
  double v14 = v13;
  double v15 = v8;
  double v16 = v10;
  double v17 = v12;
  result.double right = v14;
  result.double bottom = v17;
  result.double left = v16;
  result.top = v15;
  return result;
}

- (double)scaledValueForValue:(double)a3
{
  v4 = [(WFLibraryLayoutMetrics *)self workflowTitleFont];
  v5 = [(id)objc_opt_class() workflowTitleFontInDefaultSize];
  objc_msgSend(v4, "wf_scaledValueForValue:baseFont:", v5, a3);
  double v7 = v6;

  return v7;
}

- (UIFont)workflowTitleFont
{
  return self->_workflowTitleFont;
}

+ (id)workflowTitleFontInDefaultSize
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56__WFLibraryLayoutMetrics_workflowTitleFontInDefaultSize__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (workflowTitleFontInDefaultSize_onceToken != -1) {
    dispatch_once(&workflowTitleFontInDefaultSize_onceToken, block);
  }
  double v2 = (void *)workflowTitleFontInDefaultSize_font;
  return v2;
}

- (UIEdgeInsets)workflowContentEdgeInsets
{
  WFConvertEdgeInsetsToRTLIfNeeded();
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  WFConvertEdgeInsetsToRTLIfNeeded();
  uint64_t v12 = v11;
  uint64_t v14 = v13;
  uint64_t v16 = v15;
  uint64_t v18 = v17;
  -[WFLibraryLayoutMetrics scaledEdgeInsets:](self, "scaledEdgeInsets:", v4, v6, v8, v10);
  -[WFLibraryLayoutMetrics capEdgeInsets:min:max:](self, "capEdgeInsets:min:max:", v12, v14, v16, v18);
  result.double right = v22;
  result.double bottom = v21;
  result.double left = v20;
  result.top = v19;
  return result;
}

- (double)capEdgeInsets:(double)a3 min:(double)a4 max:(double)a5
{
  if (a9 < result) {
    UIEdgeInsets result = a9;
  }
  if (a5 >= result) {
    return a5;
  }
  return result;
}

- (CGSize)workflowSize
{
  double width = self->_workflowSize.width;
  double height = self->_workflowSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (double)lineSpacing
{
  return self->_lineSpacing;
}

- (double)interitemSpacing
{
  return self->_interitemSpacing;
}

- (UIEdgeInsets)sectionInset
{
  double top = self->_sectionInset.top;
  double left = self->_sectionInset.left;
  double bottom = self->_sectionInset.bottom;
  double right = self->_sectionInset.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (double)workflowIconToLabelMargin
{
  [(WFLibraryLayoutMetrics *)self scaledValueForValue:4.0];
  return fmin(v2, 8.0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workflowSubtitleFont, 0);
  objc_storeStrong((id *)&self->_workflowTitleFont, 0);
  objc_storeStrong((id *)&self->_floatingViewConfiguration, 0);
}

void __56__WFLibraryLayoutMetrics_workflowTitleFontInDefaultSize__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v4 = [MEMORY[0x263F82DA0] traitCollectionWithPreferredContentSizeCategory:*MEMORY[0x263F83468]];
  uint64_t v2 = [v1 workflowTitleFontCompatibleWithTraitCollection:v4];
  double v3 = (void *)workflowTitleFontInDefaultSize_font;
  workflowTitleFontInDefaultSize_font = v2;
}

+ (id)metricsCompatibleWithTraitCollection:(id)a3 viewWidth:(double)a4 layoutMargins:(UIEdgeInsets)a5 needsTopPadding:(BOOL)a6
{
  BOOL v6 = a6;
  double right = a5.right;
  double bottom = a5.bottom;
  double left = a5.left;
  double top = a5.top;
  id v13 = a3;
  uint64_t v14 = objc_msgSend(objc_alloc((Class)a1), "initWithTraitCollection:viewWidth:layoutMargins:needsTopPadding:", v13, v6, a4, top, left, bottom, right);

  return v14;
}

- (WFLibraryLayoutMetrics)initWithTraitCollection:(id)a3 viewWidth:(double)a4 layoutMargins:(UIEdgeInsets)a5 needsTopPadding:(BOOL)a6
{
  BOOL v6 = a6;
  id v9 = a3;
  v43.receiver = self;
  v43.super_class = (Class)WFLibraryLayoutMetrics;
  double v10 = [(WFLibraryLayoutMetrics *)&v43 init];
  if (!v10) {
    goto LABEL_44;
  }
  uint64_t v11 = [(id)objc_opt_class() workflowTitleFontCompatibleWithTraitCollection:v9];
  workflowTitleFont = v10->_workflowTitleFont;
  v10->_workflowTitleFont = (UIFont *)v11;

  uint64_t v13 = [(id)objc_opt_class() workflowSubtitleFontCompatibleWithTraitCollection:v9];
  workflowSubtitleFont = v10->_workflowSubtitleFont;
  v10->_workflowSubtitleFont = (UIFont *)v13;

  WFConvertEdgeInsetsToRTLIfNeeded();
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  double v22 = v21 + 15.0;
  int v24 = [v9 verticalSizeClass] == 1 || v6;
  double v25 = v16 + 15.0;
  if (!v24) {
    double v25 = v16;
  }
  v10->_sectionInset.double top = v25;
  v10->_sectionInset.double left = v18;
  v10->_sectionInset.double bottom = v22;
  v10->_sectionInset.double right = v20;
  if (a4 <= 1500.0)
  {
    if (a4 > 1205.0)
    {
      *(void *)&long long v23 = 16.0;
      long long v42 = v23;
      unint64_t v26 = 6;
      goto LABEL_16;
    }
    if (a4 > 972.0)
    {
      *(void *)&long long v23 = 16.0;
      long long v42 = v23;
      unint64_t v26 = 5;
      goto LABEL_16;
    }
    if (a4 > 694.0)
    {
      *(void *)&long long v23 = 16.0;
      long long v42 = v23;
      unint64_t v26 = 4;
      goto LABEL_16;
    }
    *(void *)&long long v23 = 16.0;
    if (a4 <= 440.0) {
      unint64_t v26 = 2;
    }
    else {
      unint64_t v26 = 3;
    }
    if (a4 <= 440.0) {
      *(double *)&long long v23 = 10.0;
    }
  }
  else
  {
    unint64_t v26 = (unint64_t)(a4 / 215.0);
    *(void *)&long long v23 = 16.0;
  }
  long long v42 = v23;
LABEL_16:
  v10->_itemsPerBanner = 1;
  id v27 = (id)*MEMORY[0x263F83468];
  v28 = [MEMORY[0x263F33718] sharedContext];
  v29 = [v28 applicationOrNil];

  if (v29)
  {
    uint64_t v30 = [v29 preferredContentSizeCategory];

    id v27 = (id)v30;
  }
  if (UIContentSizeCategoryIsAccessibilityCategory((UIContentSizeCategory)v27))
  {
    --v26;
    v10->_itemsPerBanner = 1;
  }
  *(void *)&v31.f64[0] = v42;
  v31.f64[1] = *(double *)&v42 + 1.0;
  *(float64x2_t *)&v10->_interitemSpacing = vcvtq_f64_f32(vrndm_f32(vcvt_f32_f64(v31)));
  v10->_itemsPerRow = v26;
  double v32 = 132.0;
  if ((objc_msgSend(v27, "isEqualToString:", *MEMORY[0x263F83410], v42) & 1) == 0
    && ([v27 isEqualToString:*MEMORY[0x263F83408]] & 1) == 0)
  {
    if ([v27 isEqualToString:*MEMORY[0x263F83418]])
    {
      double v32 = 140.0;
    }
    else if ([v27 isEqualToString:*MEMORY[0x263F83420]])
    {
      double v32 = 148.0;
    }
    else if ([v27 isEqualToString:*MEMORY[0x263F83470]])
    {
      double v32 = 125.0;
    }
    else if ([v27 isEqualToString:*MEMORY[0x263F83488]])
    {
      double v32 = 126.0;
    }
    else if ([v27 isEqualToString:*MEMORY[0x263F83458]])
    {
      double v32 = 137.0;
    }
    else
    {
      double v32 = 122.0;
    }
  }
  double v33 = floor((a4 - v18 - v20 - (double)(v26 - 1) * v10->_interitemSpacing) / (double)v26);
  if (v33 >= 0.0) {
    double v34 = v33;
  }
  else {
    double v34 = 0.0;
  }
  [(WFLibraryLayoutMetrics *)v10 scaledValueForValue:v32];
  v10->_workflowSize.double width = v34;
  v10->_workflowSize.double height = v35;
  v36 = [MEMORY[0x263F87B48] materialWorkflowConfiguration];
  [v36 cornerRadius];
  -[WFLibraryLayoutMetrics scaledValueForValue:](v10, "scaledValueForValue:");
  if (v37 > 33.0) {
    double v37 = 33.0;
  }
  [v36 setCornerRadius:v37];
  [v36 cornerRadius];
  v10->_cornerRadius = v38;
  floatingViewConfiguration = v10->_floatingViewConfiguration;
  v10->_floatingViewConfiguration = (WFFloatingViewConfiguration *)v36;

  v40 = v10;
LABEL_44:

  return v10;
}

+ (id)workflowTitleFontCompatibleWithTraitCollection:(id)a3
{
  double v3 = [MEMORY[0x263F81720] preferredFontDescriptorWithTextStyle:*MEMORY[0x263F835D0] compatibleWithTraitCollection:a3];
  id v4 = [v3 fontDescriptorWithSymbolicTraits:2];

  double v5 = [MEMORY[0x263F81708] fontWithDescriptor:v4 size:0.0];

  return v5;
}

+ (id)workflowSubtitleFontCompatibleWithTraitCollection:(id)a3
{
  return (id)[MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83588] compatibleWithTraitCollection:a3];
}

- (unint64_t)itemsPerBanner
{
  return self->_itemsPerBanner;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (UIFont)workflowSubtitleFont
{
  return self->_workflowSubtitleFont;
}

- (unint64_t)appIconFormat
{
  return 0;
}

- (CGSize)workflowGlyphSize
{
  [(WFLibraryLayoutMetrics *)self workflowGlyphDimension];
  double v3 = v2;
  result.double height = v3;
  result.double width = v2;
  return result;
}

+ (id)metricsCompatibleWithTraitCollection:(id)a3 viewWidth:(double)a4 layoutMargins:(UIEdgeInsets)a5
{
  return (id)objc_msgSend(a1, "metricsCompatibleWithTraitCollection:viewWidth:layoutMargins:needsTopPadding:", a3, 0, a4, a5.top, a5.left, a5.bottom, a5.right);
}

@end