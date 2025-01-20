@interface PXNavigationTitleView
- (BOOL)_isSubtitleVisible;
- (BOOL)_needsUpdate;
- (NSArray)_constraints;
- (NSString)subtitle;
- (NSString)title;
- (PXNavigationTitleView)initWithFrame:(CGRect)a3;
- (UIColor)subtitleTextColor;
- (UIColor)titleTextColor;
- (UIEdgeInsets)margins;
- (UIFont)subtitleFont;
- (UIFont)titleFont;
- (UILabel)_subtitleLabel;
- (UILabel)_titleLabel;
- (double)subviewsAlpha;
- (int64_t)textAlignment;
- (int64_t)verticalSizeClass;
- (void)_invalidateConstraints;
- (void)_invalidateFonts;
- (void)_invalidateSize;
- (void)_invalidateTexts;
- (void)_setConstraints:(id)a3;
- (void)_setNeedsUpdate;
- (void)_setSubtitleVisible:(BOOL)a3;
- (void)_updateConstraintsIfNeeded;
- (void)_updateFontsIfNeeded;
- (void)_updateIfNeeded;
- (void)_updateSizeIfNeeded;
- (void)_updateTextsIfNeeded;
- (void)performChanges:(id)a3;
- (void)setMargins:(UIEdgeInsets)a3;
- (void)setSubtitle:(id)a3;
- (void)setSubtitleFont:(id)a3;
- (void)setSubtitleTextColor:(id)a3;
- (void)setSubviewsAlpha:(double)a3;
- (void)setTextAlignment:(int64_t)a3;
- (void)setTitle:(id)a3;
- (void)setTitleFont:(id)a3;
- (void)setTitleTextColor:(id)a3;
- (void)setVerticalSizeClass:(int64_t)a3;
- (void)updateConstraints;
@end

@implementation PXNavigationTitleView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__constraints, 0);
  objc_storeStrong((id *)&self->__subtitleLabel, 0);
  objc_storeStrong((id *)&self->__titleLabel, 0);
  objc_storeStrong((id *)&self->_subtitleFont, 0);
  objc_storeStrong((id *)&self->_titleFont, 0);
  objc_storeStrong((id *)&self->_subtitleTextColor, 0);
  objc_storeStrong((id *)&self->_titleTextColor, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

- (void)_setConstraints:(id)a3
{
}

- (NSArray)_constraints
{
  return self->__constraints;
}

- (BOOL)_isSubtitleVisible
{
  return self->__subtitleVisible;
}

- (UILabel)_subtitleLabel
{
  return self->__subtitleLabel;
}

- (UILabel)_titleLabel
{
  return self->__titleLabel;
}

- (double)subviewsAlpha
{
  return self->_subviewsAlpha;
}

- (UIEdgeInsets)margins
{
  double top = self->_margins.top;
  double left = self->_margins.left;
  double bottom = self->_margins.bottom;
  double right = self->_margins.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (int64_t)textAlignment
{
  return self->_textAlignment;
}

- (UIFont)subtitleFont
{
  return self->_subtitleFont;
}

- (UIFont)titleFont
{
  return self->_titleFont;
}

- (UIColor)subtitleTextColor
{
  return self->_subtitleTextColor;
}

- (UIColor)titleTextColor
{
  return self->_titleTextColor;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (NSString)title
{
  return self->_title;
}

- (int64_t)verticalSizeClass
{
  return self->_verticalSizeClass;
}

- (void)setSubviewsAlpha:(double)a3
{
  if (self->_subviewsAlpha != a3)
  {
    self->_subviewsAlpha = a3;
    v5 = [(PXNavigationTitleView *)self _titleLabel];
    [v5 setAlpha:a3];

    id v6 = [(PXNavigationTitleView *)self _subtitleLabel];
    [v6 setAlpha:a3];
  }
}

- (void)_updateSizeIfNeeded
{
  if (self->_needsUpdateFlags.size)
  {
    self->_needsUpdateFlags.size = 0;
    v3 = (double *)MEMORY[0x1E4F1DB30];
    double v4 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    v5 = [(PXNavigationTitleView *)self _titleLabel];
    double v6 = *v3;
    objc_msgSend(v5, "sizeThatFits:", *v3, v4);
    double v8 = v7;

    if ([(PXNavigationTitleView *)self _isSubtitleVisible])
    {
      v9 = [(PXNavigationTitleView *)self _subtitleLabel];
      objc_msgSend(v9, "sizeThatFits:", v6, v4);
      double v11 = v10;

      if (v8 < v11) {
        double v8 = v11;
      }
    }
    int64_t v12 = [(PXNavigationTitleView *)self verticalSizeClass];
    if (v12 == 1)
    {
      if ([(PXNavigationTitleView *)self _isSubtitleVisible]) {
        double v13 = 42.0;
      }
      else {
        double v13 = 32.0;
      }
    }
    else if (v12)
    {
      double v13 = v4;
    }
    else
    {
      double v13 = 44.0;
    }
    -[PXNavigationTitleView setBounds:](self, "setBounds:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), v8, v13);
    id v14 = [(PXNavigationTitleView *)self superview];
    [v14 setNeedsLayout];
  }
}

- (void)_invalidateSize
{
  self->_needsUpdateFlags.size = 1;
  [(PXNavigationTitleView *)self _setNeedsUpdate];
}

- (void)_updateConstraintsIfNeeded
{
  if (self->_needsUpdateFlags.constraints)
  {
    self->_needsUpdateFlags.constraints = 0;
    id v3 = [(PXNavigationTitleView *)self _constraints];
    [MEMORY[0x1E4F28DC8] deactivateConstraints:v3];
    [(PXNavigationTitleView *)self removeConstraints:v3];
    [(PXNavigationTitleView *)self _setConstraints:0];
    [(PXNavigationTitleView *)self setNeedsUpdateConstraints];
  }
}

- (void)_invalidateConstraints
{
  self->_needsUpdateFlags.constraints = 1;
  [(PXNavigationTitleView *)self _setNeedsUpdate];
}

- (void)_updateFontsIfNeeded
{
  if (self->_needsUpdateFlags.fonts)
  {
    self->_needsUpdateFlags.fonts = 0;
    uint64_t v9 = 0;
    double v10 = &v9;
    uint64_t v11 = 0x2020000000;
    char v12 = 0;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __45__PXNavigationTitleView__updateFontsIfNeeded__block_invoke;
    aBlock[3] = &unk_1E5DB3DF0;
    aBlock[4] = &v9;
    id v3 = (void (**)(void *, void *, void *))_Block_copy(aBlock);
    double v4 = [(PXNavigationTitleView *)self _titleLabel];
    v5 = [(PXNavigationTitleView *)self titleFont];
    v3[2](v3, v4, v5);

    double v6 = [(PXNavigationTitleView *)self _subtitleLabel];
    double v7 = [(PXNavigationTitleView *)self subtitleFont];
    v3[2](v3, v6, v7);

    if (*((unsigned char *)v10 + 24)) {
      [(PXNavigationTitleView *)self _invalidateSize];
    }

    _Block_object_dispose(&v9, 8);
  }
}

void __45__PXNavigationTitleView__updateFontsIfNeeded__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  id v6 = [v9 font];
  if (v6 == v5)
  {
  }
  else
  {
    double v7 = v6;
    char v8 = [v5 isEqual:v6];

    if ((v8 & 1) == 0)
    {
      [v9 setFont:v5];
      *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    }
  }
}

- (void)_invalidateFonts
{
  self->_needsUpdateFlags.fonts = 1;
  [(PXNavigationTitleView *)self _setNeedsUpdate];
}

- (void)_updateTextsIfNeeded
{
  if (self->_needsUpdateFlags.texts)
  {
    self->_needsUpdateFlags.texts = 0;
    BOOL v3 = [(PXNavigationTitleView *)self _isSubtitleVisible];
    double v4 = [(PXNavigationTitleView *)self title];
    id v5 = [(PXNavigationTitleView *)self subtitle];
    if ([(PXNavigationTitleView *)self verticalSizeClass] == 1)
    {

      id v5 = 0;
    }
    id v6 = [(PXNavigationTitleView *)self titleFont];
    double v7 = __45__PXNavigationTitleView__updateTextsIfNeeded__block_invoke(v4, v6);

    char v8 = [(PXNavigationTitleView *)self subtitleFont];
    id v9 = __45__PXNavigationTitleView__updateTextsIfNeeded__block_invoke(v5, v8);
    uint64_t v14 = 0;
    v15 = &v14;
    uint64_t v16 = 0x2020000000;
    char v17 = 0;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __45__PXNavigationTitleView__updateTextsIfNeeded__block_invoke_2;
    aBlock[3] = &unk_1E5DB3DC8;
    aBlock[4] = &v14;
    double v10 = (void (**)(void *, void *, void *))_Block_copy(aBlock);
    uint64_t v11 = [(PXNavigationTitleView *)self _titleLabel];
    v10[2](v10, v11, v7);

    char v12 = [(PXNavigationTitleView *)self _subtitleLabel];
    v10[2](v10, v12, v9);

    -[PXNavigationTitleView _setSubtitleVisible:](self, "_setSubtitleVisible:", [v9 length] != 0);
    if (v3 != [(PXNavigationTitleView *)self _isSubtitleVisible]) {
      [(PXNavigationTitleView *)self _invalidateConstraints];
    }
    if (*((unsigned char *)v15 + 24)) {
      [(PXNavigationTitleView *)self _invalidateSize];
    }

    _Block_object_dispose(&v14, 8);
  }
}

id __45__PXNavigationTitleView__updateTextsIfNeeded__block_invoke(void *a1, void *a2)
{
  v12[1] = *MEMORY[0x1E4F143B8];
  BOOL v3 = a1;
  id v4 = a2;
  id v5 = objc_alloc(MEMORY[0x1E4F28B18]);
  id v6 = v5;
  if (v3) {
    double v7 = v3;
  }
  else {
    double v7 = &stru_1F00B0030;
  }
  if (v4)
  {
    uint64_t v11 = *MEMORY[0x1E4FB06F8];
    v12[0] = v4;
    char v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
    id v9 = (void *)[v6 initWithString:v7 attributes:v8];
  }
  else
  {
    id v9 = (void *)[v5 initWithString:v7 attributes:0];
  }

  return v9;
}

void __45__PXNavigationTitleView__updateTextsIfNeeded__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  id v6 = [v9 attributedText];
  if (v6 == v5)
  {
  }
  else
  {
    double v7 = v6;
    char v8 = [v5 isEqual:v6];

    if ((v8 & 1) == 0)
    {
      [v9 setAttributedText:v5];
      *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    }
  }
}

- (void)_invalidateTexts
{
  self->_needsUpdateFlags.texts = 1;
  [(PXNavigationTitleView *)self _setNeedsUpdate];
}

- (void)_setNeedsUpdate
{
  if (!self->_isPerformingChanges && !self->_isPerformingUpdates)
  {
    id v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:a2 object:self file:@"PXNavigationTitleView.m" lineNumber:263 description:@"not inside -performChanges: or _updateIfNeeded"];
  }
}

- (void)_updateIfNeeded
{
  if ([(PXNavigationTitleView *)self _needsUpdate])
  {
    BOOL isPerformingUpdates = self->_isPerformingUpdates;
    self->_BOOL isPerformingUpdates = 1;
    [(PXNavigationTitleView *)self _updateFontsIfNeeded];
    [(PXNavigationTitleView *)self _updateTextsIfNeeded];
    [(PXNavigationTitleView *)self _updateConstraintsIfNeeded];
    [(PXNavigationTitleView *)self _updateSizeIfNeeded];
    self->_BOOL isPerformingUpdates = isPerformingUpdates;
    if ([(PXNavigationTitleView *)self _needsUpdate])
    {
      id v5 = [MEMORY[0x1E4F28B00] currentHandler];
      [v5 handleFailureInMethod:a2 object:self file:@"PXNavigationTitleView.m" lineNumber:259 description:@"update still needed after update pass"];
    }
  }
}

- (BOOL)_needsUpdate
{
  return self->_needsUpdateFlags.texts
      || self->_needsUpdateFlags.fonts
      || self->_needsUpdateFlags.constraints
      || self->_needsUpdateFlags.size;
}

- (void)performChanges:(id)a3
{
  id v5 = a3;
  id v8 = v5;
  if (v5)
  {
    BOOL isPerformingChanges = self->_isPerformingChanges;
    self->_BOOL isPerformingChanges = 1;
    (*((void (**)(void))v5 + 2))();
    self->_BOOL isPerformingChanges = isPerformingChanges;
    if (isPerformingChanges) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  double v7 = [MEMORY[0x1E4F28B00] currentHandler];
  [v7 handleFailureInMethod:a2, self, @"PXNavigationTitleView.m", 221, @"Invalid parameter not satisfying: %@", @"nil != changeBlock" object file lineNumber description];

  if (!self->_isPerformingChanges) {
LABEL_3:
  }
    [(PXNavigationTitleView *)self _updateIfNeeded];
LABEL_4:
}

- (void)setTextAlignment:(int64_t)a3
{
  if (self->_textAlignment != a3)
  {
    self->_textAlignment = a3;
    id v5 = [(PXNavigationTitleView *)self _titleLabel];
    [v5 setTextAlignment:a3];

    id v6 = [(PXNavigationTitleView *)self _subtitleLabel];
    [v6 setTextAlignment:a3];
  }
}

- (void)setSubtitleFont:(id)a3
{
  id v5 = (UIFont *)a3;
  if (self->_subtitleFont != v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_subtitleFont, a3);
    [(PXNavigationTitleView *)self _invalidateFonts];
    id v5 = v6;
  }
}

- (void)setTitleFont:(id)a3
{
  id v5 = (UIFont *)a3;
  if (self->_titleFont != v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_titleFont, a3);
    [(PXNavigationTitleView *)self _invalidateFonts];
    id v5 = v6;
  }
}

- (void)setSubtitleTextColor:(id)a3
{
  id v6 = (UIColor *)a3;
  if (self->_subtitleTextColor != v6)
  {
    objc_storeStrong((id *)&self->_subtitleTextColor, a3);
    id v5 = [(PXNavigationTitleView *)self _subtitleLabel];
    [v5 setTextColor:v6];
  }
}

- (void)setTitleTextColor:(id)a3
{
  id v6 = (UIColor *)a3;
  if (self->_titleTextColor != v6)
  {
    objc_storeStrong((id *)&self->_titleTextColor, a3);
    id v5 = [(PXNavigationTitleView *)self _titleLabel];
    [v5 setTextColor:v6];
  }
}

- (void)setSubtitle:(id)a3
{
  id v5 = (NSString *)a3;
  if (self->_subtitle != v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_subtitle, a3);
    [(PXNavigationTitleView *)self _invalidateTexts];
    id v5 = v6;
  }
}

- (void)setTitle:(id)a3
{
  id v5 = (NSString *)a3;
  if (self->_title != v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_title, a3);
    [(PXNavigationTitleView *)self _invalidateTexts];
    id v5 = v6;
  }
}

- (void)setVerticalSizeClass:(int64_t)a3
{
  if (self->_verticalSizeClass != a3)
  {
    self->_verticalSizeClass = a3;
    [(PXNavigationTitleView *)self _invalidateTexts];
    [(PXNavigationTitleView *)self _invalidateSize];
  }
}

- (void)_setSubtitleVisible:(BOOL)a3
{
  if (self->__subtitleVisible != a3)
  {
    self->__subtitleVisible = a3;
    [(PXNavigationTitleView *)self _invalidateConstraints];
  }
}

- (void)setMargins:(UIEdgeInsets)a3
{
  if (a3.left != self->_margins.left
    || a3.top != self->_margins.top
    || a3.right != self->_margins.right
    || a3.bottom != self->_margins.bottom)
  {
    self->_margins = a3;
    [(PXNavigationTitleView *)self _invalidateConstraints];
    [(PXNavigationTitleView *)self _invalidateSize];
  }
}

- (void)updateConstraints
{
  v50[2] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(PXNavigationTitleView *)self _constraints];

  if (!v3)
  {
    v49[0] = @"titleLabel";
    id v4 = [(PXNavigationTitleView *)self _titleLabel];
    v49[1] = @"subtitleLabel";
    v50[0] = v4;
    id v5 = [(PXNavigationTitleView *)self _subtitleLabel];
    v50[1] = v5;
    id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v50 forKeys:v49 count:2];

    [(PXNavigationTitleView *)self margins];
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    v47[0] = @"leftMargin";
    v15 = [NSNumber numberWithDouble:v9];
    v48[0] = v15;
    v47[1] = @"rightMargin";
    uint64_t v16 = [NSNumber numberWithDouble:v14];
    v48[1] = v16;
    v47[2] = @"topMargin";
    char v17 = [NSNumber numberWithDouble:v8];
    v48[2] = v17;
    v47[3] = @"bottomMargin";
    v18 = [NSNumber numberWithDouble:v12];
    v48[3] = v18;
    v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v48 forKeys:v47 count:4];

    v20 = [MEMORY[0x1E4F1CA48] array];
    if ([(PXNavigationTitleView *)self _isSubtitleVisible])
    {
      v43 = v19;
      v42 = [(UILabel *)self->__titleLabel centerXAnchor];
      v41 = [(PXNavigationTitleView *)self centerXAnchor];
      v40 = [v42 constraintEqualToAnchor:v41];
      v46[0] = v40;
      v44 = v6;
      v39 = [(UILabel *)self->__subtitleLabel centerXAnchor];
      v38 = [(PXNavigationTitleView *)self centerXAnchor];
      v21 = [v39 constraintEqualToAnchor:v38];
      v46[1] = v21;
      v22 = [(PXNavigationTitleView *)self widthAnchor];
      v23 = [(UILabel *)self->__titleLabel widthAnchor];
      double v24 = v10 + v14;
      v25 = [v22 constraintGreaterThanOrEqualToAnchor:v23 constant:v24];
      v46[2] = v25;
      v26 = [(PXNavigationTitleView *)self widthAnchor];
      v27 = [(UILabel *)self->__subtitleLabel widthAnchor];
      v28 = [v26 constraintGreaterThanOrEqualToAnchor:v27 constant:v24];
      v46[3] = v28;
      v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:4];
      [v20 addObjectsFromArray:v29];

      id v6 = v44;
      v19 = v43;

      v30 = [(PXNavigationTitleView *)self widthAnchor];
      v31 = [v30 constraintEqualToConstant:0.0];

      LODWORD(v32) = 1132068864;
      [v31 setPriority:v32];
      [v20 addObject:v31];
      v33 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"V:|-(>=topMargin@747)-[titleLabel]" options:0 metrics:v43 views:v44];
      [v20 addObjectsFromArray:v33];

      v34 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"V:[titleLabel]-[subtitleLabel]" options:0x80000 metrics:v43 views:v44];
      [v20 addObjectsFromArray:v34];

      v35 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"V:[subtitleLabel]-(>=bottomMargin@749)-|" options:0 metrics:v43 views:v44];
      [v20 addObjectsFromArray:v35];
    }
    else
    {
      v36 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"H:|-(==leftMargin)-[titleLabel]-(==rightMargin)-|" options:0 metrics:v19 views:v6];
      [v20 addObjectsFromArray:v36];

      v37 = (void *)MEMORY[0x1E4F28DC8];
      v31 = [(PXNavigationTitleView *)self _titleLabel];
      v35 = [v37 constraintWithItem:v31 attribute:10 relatedBy:0 toItem:self attribute:10 multiplier:1.0 constant:0.0];
      [v20 addObject:v35];
    }

    [MEMORY[0x1E4F28DC8] activateConstraints:v20];
    [(PXNavigationTitleView *)self addConstraints:v20];
    [(PXNavigationTitleView *)self _setConstraints:v20];
  }
  v45.receiver = self;
  v45.super_class = (Class)PXNavigationTitleView;
  [(PXNavigationTitleView *)&v45 updateConstraints];
}

- (PXNavigationTitleView)initWithFrame:(CGRect)a3
{
  v21.receiver = self;
  v21.super_class = (Class)PXNavigationTitleView;
  BOOL v3 = -[PXNavigationTitleView initWithFrame:](&v21, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  id v4 = v3;
  if (v3)
  {
    v3->_textAlignment = 1;
    id v5 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    titleLabel = v4->__titleLabel;
    v4->__titleLabel = v5;

    [(UILabel *)v4->__titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v4->__titleLabel setMinimumScaleFactor:0.75];
    [(UILabel *)v4->__titleLabel setAdjustsFontSizeToFitWidth:1];
    [(UILabel *)v4->__titleLabel setTextAlignment:v4->_textAlignment];
    LODWORD(v7) = 1144766464;
    [(UILabel *)v4->__titleLabel setContentHuggingPriority:1 forAxis:v7];
    [(PXNavigationTitleView *)v4 addSubview:v4->__titleLabel];
    double v8 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    subtitleLabel = v4->__subtitleLabel;
    v4->__subtitleLabel = v8;

    [(UILabel *)v4->__subtitleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v4->__subtitleLabel setTextAlignment:v4->_textAlignment];
    LODWORD(v10) = 1144733696;
    [(UILabel *)v4->__subtitleLabel setContentCompressionResistancePriority:1 forAxis:v10];
    [(PXNavigationTitleView *)v4 addSubview:v4->__subtitleLabel];
    uint64_t v11 = [MEMORY[0x1E4FB08E0] defaultFontForTextStyle:*MEMORY[0x1E4FB2950]];
    titleFont = v4->_titleFont;
    v4->_titleFont = (UIFont *)v11;

    uint64_t v13 = [MEMORY[0x1E4FB08E0] defaultFontForTextStyle:*MEMORY[0x1E4FB28E0]];
    subtitleFont = v4->_subtitleFont;
    v4->_subtitleFont = (UIFont *)v13;

    __asm { FMOV            V1.2D, #6.0 }
    *(_OWORD *)&v4->_margins.double top = xmmword_1AB359C90;
    *(_OWORD *)&v4->_margins.double bottom = _Q1;
    v4->_verticalSizeClass = 0;
    v4->_needsUpdateFlags = ($5C3876A65A6267886F64C983D29579CA)16843009;
    [(PXNavigationTitleView *)v4 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(PXNavigationTitleView *)v4 _updateIfNeeded];
  }
  return v4;
}

@end