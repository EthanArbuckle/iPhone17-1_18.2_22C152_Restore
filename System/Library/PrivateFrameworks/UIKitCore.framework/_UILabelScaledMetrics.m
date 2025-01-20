@interface _UILabelScaledMetrics
- (double)initWithConfiguration:(double)a3 size:(double)a4;
- (double)initWithConfiguration:(void *)a3 size:(double)a4 associatedScaledMetrics:(double)a5;
- (id)description;
- (id)scaledAttributedText;
- (void)_calculateIfNecessary;
- (void)_calculateIfNecessaryWithAssociatedMetrics;
- (void)_calculateIfNecessaryWithConfiguration;
@end

@implementation _UILabelScaledMetrics

- (double)initWithConfiguration:(double)a3 size:(double)a4
{
  id v7 = a2;
  v8 = v7;
  if (!a1) {
    goto LABEL_19;
  }
  v9 = 0;
  BOOL v10 = a4 >= 3.40282347e38 && a3 >= 3.40282347e38;
  if (!v7 || v10) {
    goto LABEL_20;
  }
  if (![v7 adjustsFontSizeToFitWidth]
    || ([v8 minimumScaleFactor], v11 >= 1.0))
  {
LABEL_19:
    v9 = 0;
    goto LABEL_20;
  }
  v21.receiver = a1;
  v21.super_class = (Class)_UILabelScaledMetrics;
  v12 = (double *)objc_msgSendSuper2(&v21, sel_init);
  if (v12)
  {
    uint64_t v13 = [v8 copy];
    v14 = (void *)*((void *)v12 + 15);
    *((void *)v12 + 15) = v13;

    double v15 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    if (*MEMORY[0x1E4F1DB30] == a3 && v15 == a4)
    {
      v17 = (void *)*((void *)v12 + 15);
      if (v17)
      {
        objc_msgSend(v17, "bounds", *MEMORY[0x1E4F1DB30], v15);
        a3 = v18;
        a4 = v19;
      }
      else
      {
        a3 = 0.0;
        a4 = 0.0;
      }
    }
    v12[1] = a3;
    v12[2] = a4;
  }
  a1 = v12;
  v9 = a1;
LABEL_20:

  return v9;
}

- (double)initWithConfiguration:(void *)a3 size:(double)a4 associatedScaledMetrics:(double)a5
{
  id v10 = a3;
  if (a1)
  {
    double v11 = [(_UILabelScaledMetrics *)a1 initWithConfiguration:a4 size:a5];
    v12 = v11;
    if (v11) {
      objc_storeStrong((id *)v11 + 16, a3);
    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)scaledAttributedText
{
  if (a1)
  {
    v2 = a1;
    [a1 _calculateIfNecessary];
    a1 = (id *)v2[10];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_calculateIfNecessary
{
  if ((*(unsigned char *)&self->_scaledMetricsFlags & 1) == 0)
  {
    *(unsigned char *)&self->_scaledMetricsFlags |= 1u;
    if (self->_sourceSize.width < 3.40282347e38 || self->_sourceSize.height < 3.40282347e38)
    {
      v3 = -[UIBarButtonItemGroup _items]((id *)&self->_configuration->super.isa);
      v4 = [v3 attributedString];

      if (v4)
      {
        if (self->_associatedScaledMetrics)
        {
          [(_UILabelScaledMetrics *)self _calculateIfNecessaryWithAssociatedMetrics];
        }
        else
        {
          [(_UILabelScaledMetrics *)self _calculateIfNecessaryWithConfiguration];
        }
      }
    }
  }
}

- (void)_calculateIfNecessaryWithAssociatedMetrics
{
  v3 = -[UIBarButtonItemGroup _items]((id *)&self->_configuration->super.isa);
  id v30 = [v3 attributedString];

  uint64_t v4 = [v30 length];
  associatedScaledMetrics = self->_associatedScaledMetrics;
  if (associatedScaledMetrics)
  {
    [(_UILabelScaledMetrics *)self->_associatedScaledMetrics _calculateIfNecessary];
    double actualScaleFactor = associatedScaledMetrics->_actualScaleFactor;
  }
  else
  {
    double actualScaleFactor = 0.0;
  }
  objc_msgSend(v30, "_ui_attributedSubstringFromRange:scaledByScaleFactor:", 0, v4, actualScaleFactor);
  id v7 = (NSAttributedString *)objc_claimAutoreleasedReturnValue();
  v8 = -[_UILabelConfiguration _resolvedStringDrawingContext]((void **)&self->_configuration->super.isa);
  [v8 setWantsNumberOfLineFragments:1];
  objc_msgSend(v8, "setMaximumNumberOfLines:", -[_UILabelConfiguration numberOfLines](self->_configuration, "numberOfLines"));
  [v8 setMinimumScaleFactor:1.0];
  [v8 setLayout:0];
  configuration = self->_configuration;
  if (configuration)
  {
    uint64_t v10 = 1048577;
    internal = configuration->_internal;
    if (internal)
    {
      $80F9FF894D804BF481F9E54DC1AB63BD configurationFlags = internal->_configurationFlags;
      uint64_t v13 = 1048705;
      if ((*(unsigned char *)&configurationFlags & 2) == 0) {
        uint64_t v13 = 1048577;
      }
      uint64_t v10 = v13 | (*(_WORD *)&configurationFlags << 7) & 0x200 | (*(_WORD *)&configurationFlags << 7) & 0x400;
    }
  }
  else
  {
    uint64_t v10 = 0;
  }
  objc_msgSend(v30, "boundingRectWithSize:options:context:", v10, v8, self->_sourceSize.width, self->_sourceSize.height);
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  [v8 setLayout:0];
  -[NSAttributedString boundingRectWithSize:options:context:](v7, "boundingRectWithSize:options:context:", v10, v8, self->_sourceSize.width, self->_sourceSize.height);
  self->_scaledSize.width = v18;
  self->_scaledSize.height = v19;
  self->_unscaledAndPossiblyTooLargeSize.width = v15;
  self->_unscaledAndPossiblyTooLargeSize.height = v17;
  v20 = self->_associatedScaledMetrics;
  if (!v20)
  {
    self->_double baselineOffset = 0.0;
    goto LABEL_19;
  }
  [(_UILabelScaledMetrics *)self->_associatedScaledMetrics _calculateIfNecessary];
  double baselineOffset = v20->_baselineOffset;
  v22 = self->_associatedScaledMetrics;
  self->_double baselineOffset = baselineOffset;
  if (!v22)
  {
LABEL_19:
    self->_double scaledFirstBaselineOffset = 0.0;
    goto LABEL_20;
  }
  [(_UILabelScaledMetrics *)v22 _calculateIfNecessary];
  double scaledFirstBaselineOffset = v22->_scaledFirstBaselineOffset;
  v24 = self->_associatedScaledMetrics;
  self->_double scaledFirstBaselineOffset = scaledFirstBaselineOffset;
  if (!v24)
  {
LABEL_20:
    self->_double scaledBaselineOffset = 0.0;
    goto LABEL_21;
  }
  [(_UILabelScaledMetrics *)v24 _calculateIfNecessary];
  double scaledBaselineOffset = v24->_scaledBaselineOffset;
  v26 = self->_associatedScaledMetrics;
  self->_double scaledBaselineOffset = scaledBaselineOffset;
  if (v26)
  {
    [(_UILabelScaledMetrics *)v26 _calculateIfNecessary];
    double v27 = v26->_actualScaleFactor;
    goto LABEL_13;
  }
LABEL_21:
  double v27 = 0.0;
LABEL_13:
  self->_double actualScaleFactor = v27;
  int64_t v28 = [v8 numberOfLineFragments];
  scaledAttributedText = self->_scaledAttributedText;
  self->_measuredNumberOfLines = v28;
  self->_scaledAttributedText = v7;
}

- (void)_calculateIfNecessaryWithConfiguration
{
  configuration = self->_configuration;
  if (configuration)
  {
    [(_UILabelConfiguration *)configuration minimumScaleFactor];
    double v5 = v4;
    if (v4 >= 1.0)
    {
LABEL_18:
      CGSize v33 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
      self->_totalBounds.origin = (CGPoint)*MEMORY[0x1E4F1DB28];
      self->_totalBounds.size = v33;
      self->_scaledSize = self->_sourceSize;
      self->_double actualScaleFactor = 1.0;
      return;
    }
    configuration = self->_configuration;
  }
  else
  {
    double v5 = 0.0;
  }
  -[_UILabelConfiguration _resolvedStringDrawingContext]((void **)&configuration->super.isa);
  id v34 = (id)objc_claimAutoreleasedReturnValue();
  v6 = -[UIBarButtonItemGroup _items]((id *)&self->_configuration->super.isa);
  id v7 = [v6 attributedString];

  double v8 = 0.01;
  if (v5 > 0.0) {
    double v8 = v5;
  }
  [v34 setMinimumScaleFactor:v8];
  [v34 setLayout:0];
  [v34 setWantsBaselineOffset:1];
  [v34 setWantsScaledBaselineOffset:1];
  [v34 setWantsScaledLineHeight:1];
  [v34 setWantsNumberOfLineFragments:1];
  objc_msgSend(v34, "setMaximumNumberOfLines:", -[_UILabelConfiguration numberOfLines](self->_configuration, "numberOfLines"));
  v9 = self->_configuration;
  if (v9)
  {
    uint64_t v10 = 1048577;
    internal = v9->_internal;
    if (internal)
    {
      $80F9FF894D804BF481F9E54DC1AB63BD configurationFlags = internal->_configurationFlags;
      uint64_t v13 = 1048705;
      if ((*(unsigned char *)&configurationFlags & 2) == 0) {
        uint64_t v13 = 1048577;
      }
      uint64_t v10 = v13 | (*(_WORD *)&configurationFlags << 7) & 0x200 | (*(_WORD *)&configurationFlags << 7) & 0x400;
    }
  }
  else
  {
    uint64_t v10 = 0;
  }
  objc_msgSend(v7, "boundingRectWithSize:options:context:", v10, v34, self->_sourceSize.width, self->_sourceSize.height);
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  [v34 scaledLineHeight];
  CGFloat v19 = v18;
  [v34 actualScaleFactor];
  if (v20 <= 0.0 || (double v21 = v20, v20 >= 1.0) || (v22 = 1.0 - v20, 1.0 - v21 <= 0.00000011920929))
  {

    goto LABEL_18;
  }
  self->_scaledSize.width = v15;
  self->_scaledSize.height = v19;
  self->_unscaledAndPossiblyTooLargeSize.width = v15;
  self->_unscaledAndPossiblyTooLargeSize.height = v17;
  objc_msgSend(v34, "baselineOffset", v22);
  self->_double baselineOffset = v23;
  [v34 firstBaselineOffset];
  self->_double scaledFirstBaselineOffset = v24;
  [v34 scaledBaselineOffset];
  self->_double scaledBaselineOffset = v25;
  self->_double actualScaleFactor = v21;
  self->_measuredNumberOfLines = [v34 numberOfLineFragments];
  uint64_t v26 = [v7 length];
  [v34 actualScaleFactor];
  objc_msgSend(v7, "_ui_attributedSubstringFromRange:scaledByScaleFactor:", 0, v26);
  double v27 = (NSAttributedString *)objc_claimAutoreleasedReturnValue();
  scaledAttributedText = self->_scaledAttributedText;
  self->_scaledAttributedText = v27;

  [v34 totalBounds];
  self->_totalBounds.origin.x = v29;
  self->_totalBounds.origin.y = v30;
  self->_totalBounds.size.width = v31;
  self->_totalBounds.size.height = v32;
}

- (id)description
{
  if (*(unsigned char *)&self->_scaledMetricsFlags) {
    v3 = &stru_1ED0E84C0;
  }
  else {
    v3 = @"{Calculated} ";
  }
  double v4 = NSString;
  double v5 = v3;
  uint64_t v6 = objc_opt_class();
  id v7 = NSStringFromCGSize(self->_sourceSize);
  double v8 = NSStringFromCGSize(self->_scaledSize);
  double actualScaleFactor = self->_actualScaleFactor;
  double scaledFirstBaselineOffset = self->_scaledFirstBaselineOffset;
  double scaledBaselineOffset = self->_scaledBaselineOffset;
  double scaledLineHeight = self->_scaledLineHeight;
  int64_t measuredNumberOfLines = self->_measuredNumberOfLines;
  double v14 = NSStringFromCGSize(self->_unscaledAndPossiblyTooLargeSize);
  CGFloat v15 = [v4 stringWithFormat:@"<%@:%p %@sourceSize=%@ scaledSize=%@ scaleFactor=%f scaledLineHeight=%f scaledFirstBaseline=%f scaledLastBaseline=%f numberOfLines=%ld unscaledSize=%@ scaledText=%@>", v6, self, v5, v7, v8, *(void *)&actualScaleFactor, *(void *)&scaledLineHeight, *(void *)&scaledFirstBaselineOffset, *(void *)&scaledBaselineOffset, measuredNumberOfLines, v14, self->_scaledAttributedText];

  return v15;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_associatedScaledMetrics, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_scaledAttributedText, 0);
}

@end