@interface UISlidingBarConfiguration
- (BOOL)_leadingBorderWidthIsInPixels;
- (BOOL)_supplementaryAdoptsPrimaryBackgroundStyle;
- (BOOL)_trailingBorderWidthIsInPixels;
- (BOOL)allowMixedSideBySideAndOverlay;
- (BOOL)allowTotalWidthGreaterThanParent;
- (BOOL)borderAbuttingMainRendersAsShadow;
- (BOOL)forceOverlay;
- (BOOL)isEqual:(id)a3;
- (BOOL)leadingMayBeHidden;
- (BOOL)shouldFadeStaticNavBarButton;
- (BOOL)supplementaryMayBeHidden;
- (BOOL)trailingMayBeHidden;
- (NSArray)leadingWidths;
- (NSArray)supplementaryWidths;
- (NSArray)trailingWidths;
- (UIColor)borderColor;
- (UISlidingBarConfiguration)init;
- (double)_rawLeadingBorderWidth;
- (double)_rawTrailingBorderWidth;
- (double)leadingBorderWidthForScale:(double)a3;
- (double)maximumMainWidth;
- (double)minimumMainWidthFraction;
- (double)minimumMainWidthFractionForSecondColumn;
- (double)rubberBandExtension;
- (double)trailingBorderWidthForScale:(double)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)_leadingBackgroundStyle;
- (int64_t)_trailingBackgroundStyle;
- (int64_t)supplementaryEdge;
- (unint64_t)hash;
- (void)_setLeadingBackgroundStyle:(int64_t)a3;
- (void)_setLeadingBorderWidthIsInPixels:(BOOL)a3;
- (void)_setRawLeadingBorderWidth:(double)a3;
- (void)_setRawTrailingBorderWidth:(double)a3;
- (void)_setSupplementaryAdoptsPrimaryBackgroundStyle:(BOOL)a3;
- (void)_setTrailingBackgroundStyle:(int64_t)a3;
- (void)_setTrailingBorderWidthIsInPixels:(BOOL)a3;
- (void)setAllowMixedSideBySideAndOverlay:(BOOL)a3;
- (void)setAllowTotalWidthGreaterThanParent:(BOOL)a3;
- (void)setBorderAbuttingMainRendersAsShadow:(BOOL)a3;
- (void)setBorderColor:(id)a3;
- (void)setForceOverlay:(BOOL)a3;
- (void)setLeadingBorderWidthInPixels:(double)a3;
- (void)setLeadingBorderWidthInPoints:(double)a3;
- (void)setLeadingMayBeHidden:(BOOL)a3;
- (void)setLeadingWidths:(id)a3;
- (void)setMaximumMainWidth:(double)a3;
- (void)setMinimumMainWidthFraction:(double)a3;
- (void)setMinimumMainWidthFractionForSecondColumn:(double)a3;
- (void)setRubberBandExtension:(double)a3;
- (void)setShouldFadeStaticNavBarButton:(BOOL)a3;
- (void)setSupplementaryEdge:(int64_t)a3;
- (void)setSupplementaryMayBeHidden:(BOOL)a3;
- (void)setSupplementaryWidths:(id)a3;
- (void)setTrailingBorderWidthInPixels:(double)a3;
- (void)setTrailingBorderWidthInPoints:(double)a3;
- (void)setTrailingMayBeHidden:(BOOL)a3;
- (void)setTrailingWidths:(id)a3;
@end

@implementation UISlidingBarConfiguration

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      if (self->_configurationFlags.value != v5[2]) {
        goto LABEL_18;
      }
      [(UISlidingBarConfiguration *)self minimumMainWidthFraction];
      double v7 = v6;
      [v5 minimumMainWidthFraction];
      if (v7 != v8) {
        goto LABEL_18;
      }
      [(UISlidingBarConfiguration *)self minimumMainWidthFractionForSecondColumn];
      double v10 = v9;
      [v5 minimumMainWidthFractionForSecondColumn];
      if (v10 != v11
        || ([(UISlidingBarConfiguration *)self maximumMainWidth],
            double v13 = v12,
            [v5 maximumMainWidth],
            v13 != v14)
        || (int64_t v15 = [(UISlidingBarConfiguration *)self supplementaryEdge],
            v15 != [v5 supplementaryEdge])
        || ([(UISlidingBarConfiguration *)self rubberBandExtension],
            double v17 = v16,
            [v5 rubberBandExtension],
            v17 != v18))
      {
LABEL_18:
        BOOL v37 = 0;
LABEL_19:

        goto LABEL_20;
      }
      v19 = [(UISlidingBarConfiguration *)self leadingWidths];
      v20 = [v5 leadingWidths];
      if (![v19 isEqual:v20])
      {
        BOOL v37 = 0;
LABEL_26:

        goto LABEL_19;
      }
      v21 = [(UISlidingBarConfiguration *)self trailingWidths];
      v22 = [v5 trailingWidths];
      if (![v21 isEqual:v22])
      {
        BOOL v37 = 0;
LABEL_25:

        goto LABEL_26;
      }
      v23 = [(UISlidingBarConfiguration *)self supplementaryWidths];
      v24 = [v5 supplementaryWidths];
      if (![v23 isEqual:v24]
        || ([(UISlidingBarConfiguration *)self _rawLeadingBorderWidth],
            double v26 = v25,
            [v5 _rawLeadingBorderWidth],
            v26 != v27)
        || ([(UISlidingBarConfiguration *)self _rawTrailingBorderWidth],
            double v29 = v28,
            [v5 _rawTrailingBorderWidth],
            v29 != v30))
      {
        BOOL v37 = 0;
LABEL_24:

        goto LABEL_25;
      }
      uint64_t v31 = [(UISlidingBarConfiguration *)self borderColor];
      v43 = [v5 borderColor];
      v44 = (void *)v31;
      if ((void *)v31 == v43)
      {
        int64_t v36 = [(UISlidingBarConfiguration *)self _leadingBackgroundStyle];
      }
      else
      {
        uint64_t v32 = [(UISlidingBarConfiguration *)self borderColor];
        uint64_t v33 = [v5 borderColor];
        v42 = (void *)v32;
        v34 = (void *)v32;
        v35 = (void *)v33;
        if (![v34 isEqual:v33])
        {
          BOOL v37 = 0;
LABEL_33:

LABEL_34:
          goto LABEL_24;
        }
        int64_t v36 = [(UISlidingBarConfiguration *)self _leadingBackgroundStyle];
      }
      if (v36 == [v5 _leadingBackgroundStyle])
      {
        int64_t v39 = [(UISlidingBarConfiguration *)self _trailingBackgroundStyle];
        BOOL v37 = v39 == [v5 _trailingBackgroundStyle];
      }
      else
      {
        BOOL v37 = 0;
      }
      v35 = v41;
      if (v44 == v43) {
        goto LABEL_34;
      }
      goto LABEL_33;
    }
  }
  BOOL v37 = 0;
LABEL_20:

  return v37;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  v4[2] = self->_configurationFlags.value;
  [(UISlidingBarConfiguration *)self minimumMainWidthFraction];
  objc_msgSend(v4, "setMinimumMainWidthFraction:");
  [(UISlidingBarConfiguration *)self minimumMainWidthFractionForSecondColumn];
  objc_msgSend(v4, "setMinimumMainWidthFractionForSecondColumn:");
  [(UISlidingBarConfiguration *)self maximumMainWidth];
  objc_msgSend(v4, "setMaximumMainWidth:");
  objc_msgSend(v4, "setSupplementaryEdge:", -[UISlidingBarConfiguration supplementaryEdge](self, "supplementaryEdge"));
  [(UISlidingBarConfiguration *)self rubberBandExtension];
  objc_msgSend(v4, "setRubberBandExtension:");
  v5 = [(UISlidingBarConfiguration *)self leadingWidths];
  [v4 setLeadingWidths:v5];

  double v6 = [(UISlidingBarConfiguration *)self trailingWidths];
  [v4 setTrailingWidths:v6];

  double v7 = [(UISlidingBarConfiguration *)self supplementaryWidths];
  [v4 setSupplementaryWidths:v7];

  [(UISlidingBarConfiguration *)self _rawLeadingBorderWidth];
  objc_msgSend(v4, "_setRawLeadingBorderWidth:");
  [(UISlidingBarConfiguration *)self _rawTrailingBorderWidth];
  objc_msgSend(v4, "_setRawTrailingBorderWidth:");
  double v8 = [(UISlidingBarConfiguration *)self borderColor];
  [v4 setBorderColor:v8];

  objc_msgSend(v4, "_setLeadingBackgroundStyle:", -[UISlidingBarConfiguration _leadingBackgroundStyle](self, "_leadingBackgroundStyle"));
  objc_msgSend(v4, "_setTrailingBackgroundStyle:", -[UISlidingBarConfiguration _trailingBackgroundStyle](self, "_trailingBackgroundStyle"));
  return v4;
}

- (int64_t)supplementaryEdge
{
  return self->_supplementaryEdge;
}

- (UIColor)borderColor
{
  return self->_borderColor;
}

- (NSArray)trailingWidths
{
  return self->_trailingWidths;
}

- (NSArray)supplementaryWidths
{
  return self->_supplementaryWidths;
}

- (double)rubberBandExtension
{
  return self->_rubberBandExtension;
}

- (double)minimumMainWidthFraction
{
  return self->_minimumMainWidthFraction;
}

- (double)minimumMainWidthFractionForSecondColumn
{
  return self->_minimumMainWidthFractionForSecondColumn;
}

- (double)maximumMainWidth
{
  return self->_maximumMainWidth;
}

- (NSArray)leadingWidths
{
  return self->_leadingWidths;
}

- (double)_rawTrailingBorderWidth
{
  return self->__rawTrailingBorderWidth;
}

- (double)_rawLeadingBorderWidth
{
  return self->__rawLeadingBorderWidth;
}

- (int64_t)_leadingBackgroundStyle
{
  return self->__leadingBackgroundStyle;
}

- (UISlidingBarConfiguration)init
{
  v6.receiver = self;
  v6.super_class = (Class)UISlidingBarConfiguration;
  v2 = [(UISlidingBarConfiguration *)&v6 init];
  v3 = v2;
  if (v2)
  {
    [(UISlidingBarConfiguration *)v2 setMinimumMainWidthFraction:0.59];
    [(UISlidingBarConfiguration *)v3 setMinimumMainWidthFractionForSecondColumn:0.44];
    [(UISlidingBarConfiguration *)v3 setMaximumMainWidth:1.79769313e308];
    v3->_configurationFlags.value |= 7u;
    uint64_t v4 = MEMORY[0x1E4F1CBF0];
    [(UISlidingBarConfiguration *)v3 setLeadingWidths:MEMORY[0x1E4F1CBF0]];
    [(UISlidingBarConfiguration *)v3 setTrailingWidths:v4];
    [(UISlidingBarConfiguration *)v3 setSupplementaryWidths:v4];
    [(UISlidingBarConfiguration *)v3 setLeadingBorderWidthInPixels:1.0];
    [(UISlidingBarConfiguration *)v3 setTrailingBorderWidthInPixels:1.0];
    [(UISlidingBarConfiguration *)v3 setBorderColor:0];
    [(UISlidingBarConfiguration *)v3 setAllowMixedSideBySideAndOverlay:0];
    [(UISlidingBarConfiguration *)v3 _setLeadingBackgroundStyle:0];
    [(UISlidingBarConfiguration *)v3 _setTrailingBackgroundStyle:0];
    [(UISlidingBarConfiguration *)v3 setBorderAbuttingMainRendersAsShadow:1];
  }
  return v3;
}

- (void)_setTrailingBackgroundStyle:(int64_t)a3
{
  self->__trailingBackgroundStyle = a3;
}

- (void)_setLeadingBackgroundStyle:(int64_t)a3
{
  self->__leadingBackgroundStyle = a3;
}

- (void)setBorderColor:(id)a3
{
}

- (void)setTrailingWidths:(id)a3
{
  filterAndCopyWidths(a3);
  uint64_t v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
  trailingWidths = self->_trailingWidths;
  self->_trailingWidths = v4;
}

- (void)setSupplementaryWidths:(id)a3
{
}

- (void)setMinimumMainWidthFractionForSecondColumn:(double)a3
{
  self->_minimumMainWidthFractionForSecondColumn = fmin(fmax(a3, 0.0), 1.0);
}

- (void)setMinimumMainWidthFraction:(double)a3
{
  self->_minimumMainWidthFraction = fmin(fmax(a3, 0.0), 1.0);
}

- (void)setMaximumMainWidth:(double)a3
{
  self->_maximumMainWidth = fmin(fmax(a3, 0.0), 1.79769313e308);
}

- (void)setLeadingWidths:(id)a3
{
  filterAndCopyWidths(a3);
  uint64_t v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
  leadingWidths = self->_leadingWidths;
  self->_leadingWidths = v4;
}

- (void)setTrailingBorderWidthInPixels:(double)a3
{
  if (a3 < 0.0) {
    a3 = 0.0;
  }
  self->__rawTrailingBorderWidth = a3;
  self->_configurationFlags.value |= 0x80u;
}

- (void)setLeadingBorderWidthInPixels:(double)a3
{
  if (a3 < 0.0) {
    a3 = 0.0;
  }
  self->__rawLeadingBorderWidth = a3;
  self->_configurationFlags.value |= 0x40u;
}

- (void)setBorderAbuttingMainRendersAsShadow:(BOOL)a3
{
  if (a3) {
    int v3 = 1024;
  }
  else {
    int v3 = 0;
  }
  self->_configurationFlags.value = self->_configurationFlags.value & 0xFFFFFBFF | v3;
}

- (void)setAllowMixedSideBySideAndOverlay:(BOOL)a3
{
  if (a3) {
    int v3 = 8;
  }
  else {
    int v3 = 0;
  }
  self->_configurationFlags.value = self->_configurationFlags.value & 0xFFFFFFF7 | v3;
}

- (int64_t)_trailingBackgroundStyle
{
  return self->__trailingBackgroundStyle;
}

- (void)setSupplementaryEdge:(int64_t)a3
{
  self->_supplementaryEdge = a3;
}

- (void)setRubberBandExtension:(double)a3
{
  self->_rubberBandExtension = a3;
}

- (void)_setRawTrailingBorderWidth:(double)a3
{
  self->__rawTrailingBorderWidth = a3;
}

- (void)_setRawLeadingBorderWidth:(double)a3
{
  self->__rawLeadingBorderWidth = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_borderColor, 0);
  objc_storeStrong((id *)&self->_supplementaryWidths, 0);
  objc_storeStrong((id *)&self->_trailingWidths, 0);
  objc_storeStrong((id *)&self->_leadingWidths, 0);
}

- (BOOL)forceOverlay
{
  return (LOBYTE(self->_configurationFlags.value) >> 5) & 1;
}

- (void)_setSupplementaryAdoptsPrimaryBackgroundStyle:(BOOL)a3
{
  if (a3) {
    int v3 = 512;
  }
  else {
    int v3 = 0;
  }
  self->_configurationFlags.value = self->_configurationFlags.value & 0xFFFFFDFF | v3;
}

- (BOOL)allowTotalWidthGreaterThanParent
{
  return (LOBYTE(self->_configurationFlags.value) >> 4) & 1;
}

- (BOOL)_supplementaryAdoptsPrimaryBackgroundStyle
{
  return (BYTE1(self->_configurationFlags.value) >> 1) & 1;
}

- (void)setTrailingBorderWidthInPoints:(double)a3
{
  if (a3 < 0.0) {
    a3 = 0.0;
  }
  self->__rawTrailingBorderWidth = a3;
  self->_configurationFlags.value &= ~0x80u;
}

- (void)setLeadingBorderWidthInPoints:(double)a3
{
  if (a3 < 0.0) {
    a3 = 0.0;
  }
  self->__rawLeadingBorderWidth = a3;
  self->_configurationFlags.value &= ~0x40u;
}

- (unint64_t)hash
{
  int v3 = [(UISlidingBarConfiguration *)self leadingWidths];
  uint64_t v4 = [v3 hash];
  v5 = [(UISlidingBarConfiguration *)self trailingWidths];
  uint64_t v6 = [v5 hash] ^ v4;
  double v7 = [(UISlidingBarConfiguration *)self supplementaryWidths];
  unint64_t v8 = v6 ^ [v7 hash];

  return v8;
}

- (void)setLeadingMayBeHidden:(BOOL)a3
{
  self->_configurationFlags.value = self->_configurationFlags.value & 0xFFFFFFFE | a3;
}

- (BOOL)leadingMayBeHidden
{
  return self->_configurationFlags.value & 1;
}

- (void)setTrailingMayBeHidden:(BOOL)a3
{
  if (a3) {
    int v3 = 2;
  }
  else {
    int v3 = 0;
  }
  self->_configurationFlags.value = self->_configurationFlags.value & 0xFFFFFFFD | v3;
}

- (BOOL)trailingMayBeHidden
{
  return (LOBYTE(self->_configurationFlags.value) >> 1) & 1;
}

- (void)setSupplementaryMayBeHidden:(BOOL)a3
{
  if (a3) {
    int v3 = 4;
  }
  else {
    int v3 = 0;
  }
  self->_configurationFlags.value = self->_configurationFlags.value & 0xFFFFFFFB | v3;
}

- (BOOL)supplementaryMayBeHidden
{
  return (LOBYTE(self->_configurationFlags.value) >> 2) & 1;
}

- (BOOL)allowMixedSideBySideAndOverlay
{
  return (LOBYTE(self->_configurationFlags.value) >> 3) & 1;
}

- (void)setAllowTotalWidthGreaterThanParent:(BOOL)a3
{
  if (a3) {
    int v3 = 16;
  }
  else {
    int v3 = 0;
  }
  self->_configurationFlags.value = self->_configurationFlags.value & 0xFFFFFFEF | v3;
}

- (void)setForceOverlay:(BOOL)a3
{
  if (a3) {
    int v3 = 32;
  }
  else {
    int v3 = 0;
  }
  self->_configurationFlags.value = self->_configurationFlags.value & 0xFFFFFFDF | v3;
}

- (void)setShouldFadeStaticNavBarButton:(BOOL)a3
{
  if (a3) {
    int v3 = 256;
  }
  else {
    int v3 = 0;
  }
  self->_configurationFlags.value = self->_configurationFlags.value & 0xFFFFFEFF | v3;
}

- (BOOL)shouldFadeStaticNavBarButton
{
  return BYTE1(self->_configurationFlags.value) & 1;
}

- (BOOL)borderAbuttingMainRendersAsShadow
{
  return (BYTE1(self->_configurationFlags.value) >> 2) & 1;
}

- (double)leadingBorderWidthForScale:(double)a3
{
  if ((self->_configurationFlags.value & 0x40) == 0) {
    a3 = 1.0;
  }
  return self->__rawLeadingBorderWidth / a3;
}

- (double)trailingBorderWidthForScale:(double)a3
{
  if ((self->_configurationFlags.value & 0x80) == 0) {
    a3 = 1.0;
  }
  return self->__rawTrailingBorderWidth / a3;
}

- (void)_setLeadingBorderWidthIsInPixels:(BOOL)a3
{
  if (a3) {
    int v3 = 64;
  }
  else {
    int v3 = 0;
  }
  self->_configurationFlags.value = self->_configurationFlags.value & 0xFFFFFFBF | v3;
}

- (BOOL)_leadingBorderWidthIsInPixels
{
  return (LOBYTE(self->_configurationFlags.value) >> 6) & 1;
}

- (void)_setTrailingBorderWidthIsInPixels:(BOOL)a3
{
  if (a3) {
    int v3 = 128;
  }
  else {
    int v3 = 0;
  }
  self->_configurationFlags.value = self->_configurationFlags.value & 0xFFFFFF7F | v3;
}

- (BOOL)_trailingBorderWidthIsInPixels
{
  return LOBYTE(self->_configurationFlags.value) >> 7;
}

- (id)description
{
  v15.receiver = self;
  v15.super_class = (Class)UISlidingBarConfiguration;
  int v3 = [(UISlidingBarConfiguration *)&v15 description];
  uint64_t v4 = (void *)[v3 mutableCopy];

  if (!os_variant_has_internal_diagnostics()) {
    goto LABEL_2;
  }
  unsigned int value = self->_configurationFlags.value;
  if (value)
  {
    [v4 appendString:@" leadingMayBeHidden"];
    unsigned int value = self->_configurationFlags.value;
    if ((value & 2) == 0)
    {
LABEL_7:
      if ((value & 4) == 0) {
        goto LABEL_8;
      }
      goto LABEL_22;
    }
  }
  else if ((value & 2) == 0)
  {
    goto LABEL_7;
  }
  [v4 appendString:@" trailingMayBeHidden"];
  unsigned int value = self->_configurationFlags.value;
  if ((value & 4) == 0)
  {
LABEL_8:
    if ((value & 8) == 0) {
      goto LABEL_9;
    }
    goto LABEL_23;
  }
LABEL_22:
  [v4 appendString:@" supplementaryMayBeHidden"];
  unsigned int value = self->_configurationFlags.value;
  if ((value & 8) == 0)
  {
LABEL_9:
    if ((value & 0x10) == 0) {
      goto LABEL_10;
    }
    goto LABEL_24;
  }
LABEL_23:
  [v4 appendString:@" allowMixedSideBySideAndOverlay"];
  unsigned int value = self->_configurationFlags.value;
  if ((value & 0x10) == 0)
  {
LABEL_10:
    if ((value & 0x20) == 0) {
      goto LABEL_11;
    }
LABEL_25:
    [v4 appendString:@" forceOverlay"];
    if ((self->_configurationFlags.value & 0x400) == 0) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
LABEL_24:
  [v4 appendString:@" allowTotalWidthGreaterThanParent"];
  unsigned int value = self->_configurationFlags.value;
  if ((value & 0x20) != 0) {
    goto LABEL_25;
  }
LABEL_11:
  if ((value & 0x400) != 0) {
LABEL_12:
  }
    [v4 appendFormat:@" borderAbuttingMainRendersAsShadow"];
LABEL_13:
  if ([(UISlidingBarConfiguration *)self _leadingBackgroundStyle] == 1
    || [(UISlidingBarConfiguration *)self _trailingBackgroundStyle] == 1)
  {
    [v4 appendString:@" sidebar-style primary"];
    if ((self->_configurationFlags.value & 0x200) != 0) {
      [v4 appendString:@" including supplementary"];
    }
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  double v12 = __40__UISlidingBarConfiguration_description__block_invoke;
  double v13 = &unk_1E52E9988;
  id v7 = v4;
  id v14 = v7;
  unint64_t v8 = [(UISlidingBarConfiguration *)self leadingWidths];
  __40__UISlidingBarConfiguration_description__block_invoke((uint64_t)v11, v8, @"leading");

  double v9 = [(UISlidingBarConfiguration *)self trailingWidths];
  v12((uint64_t)v11, v9, @"trailing");

  double v10 = [(UISlidingBarConfiguration *)self supplementaryWidths];
  v12((uint64_t)v11, v10, @"supplementary");

  if (self->_rubberBandExtension != 0.0) {
    [v7 appendFormat:@" %@=%g", @"extension", *(void *)&self->_rubberBandExtension];
  }

LABEL_2:
  return v4;
}

void __40__UISlidingBarConfiguration_description__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if ([v5 count])
  {
    id v16 = v6;
    [*(id *)(a1 + 32) appendFormat:@" %@Widths=[", v6];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v18;
      char v11 = 1;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v18 != v10) {
            objc_enumerationMutation(v7);
          }
          double v13 = *(void **)(a1 + 32);
          [*(id *)(*((void *)&v17 + 1) + 8 * v12) doubleValue];
          if (v11) {
            objc_super v15 = @"%g";
          }
          else {
            objc_super v15 = @" %g";
          }
          objc_msgSend(v13, "appendFormat:", v15, v14);
          char v11 = 0;
          ++v12;
        }
        while (v9 != v12);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
        char v11 = 0;
      }
      while (v9);
    }

    [*(id *)(a1 + 32) appendFormat:@"]"];
    id v6 = v16;
  }
}

@end