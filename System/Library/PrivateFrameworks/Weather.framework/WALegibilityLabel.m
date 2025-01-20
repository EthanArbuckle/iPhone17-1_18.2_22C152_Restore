@interface WALegibilityLabel
- (BOOL)adjustsFontSizeToFitWidth;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSAttributedString)attributedText;
- (NSString)text;
- (UIColor)textColor;
- (UIFont)font;
- (WALegibilityLabel)initWithCoder:(id)a3;
- (WALegibilityLabel)initWithFrame:(CGRect)a3;
- (WALegibilityLabel)initWithSettings:(id)a3 strength:(double)a4;
- (WALegibilityLabel)initWithSettings:(id)a3 strength:(double)a4 text:(id)a5 font:(id)a6;
- (WALegibilityLabel)initWithSettings:(id)a3 strength:(double)a4 text:(id)a5 font:(id)a6 options:(int64_t)a7;
- (_UILegibilitySettings)legibilitySettings;
- (double)_layoutGuideOffsetFromBottom:(id)a3;
- (double)firstBaselineOffsetFromBottom;
- (double)lastBaselineOffsetFromBottom;
- (double)minimumScaleFactor;
- (double)strength;
- (id)viewForFirstBaselineLayout;
- (id)viewForLastBaselineLayout;
- (int64_t)numberOfLines;
- (void)_markOurselfDirty;
- (void)_updateLabelForLegibilitySettings;
- (void)_updateLegibilityView;
- (void)layoutSubviews;
- (void)setAdjustsFontSizeToFitWidth:(BOOL)a3;
- (void)setAttributedText:(id)a3;
- (void)setBounds:(CGRect)a3;
- (void)setFont:(id)a3;
- (void)setFrame:(CGRect)a3;
- (void)setLegibilitySettings:(id)a3;
- (void)setMinimumScaleFactor:(double)a3;
- (void)setNumberOfLines:(int64_t)a3;
- (void)setOptions:(int64_t)a3;
- (void)setStrength:(double)a3;
- (void)setText:(id)a3;
- (void)setTextColor:(id)a3;
- (void)updateConstraints;
@end

@implementation WALegibilityLabel

- (WALegibilityLabel)initWithFrame:(CGRect)a3
{
  v4 = objc_msgSend(MEMORY[0x263F1CCD0], "sharedInstanceForStyle:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = [(WALegibilityLabel *)self initWithSettings:v4 strength:*MEMORY[0x263F1D888]];

  return v5;
}

- (WALegibilityLabel)initWithCoder:(id)a3
{
  v5 = objc_msgSend(MEMORY[0x263F08690], "currentHandler", a3);
  [v5 handleFailureInMethod:a2 object:self file:@"WALegibilityLabel.m" lineNumber:50 description:@"Not supported"];

  double v6 = *MEMORY[0x263F001A8];
  double v7 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v8 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v9 = *(double *)(MEMORY[0x263F001A8] + 24);
  return -[WALegibilityLabel initWithFrame:](self, "initWithFrame:", v6, v7, v8, v9);
}

- (WALegibilityLabel)initWithSettings:(id)a3 strength:(double)a4
{
  double v6 = (void *)MEMORY[0x263F1C658];
  id v7 = a3;
  [v6 systemFontSize];
  double v8 = objc_msgSend(v6, "systemFontOfSize:");
  double v9 = [(WALegibilityLabel *)self initWithSettings:v7 strength:0 text:v8 font:a4];

  return v9;
}

- (WALegibilityLabel)initWithSettings:(id)a3 strength:(double)a4 text:(id)a5 font:(id)a6
{
  return [(WALegibilityLabel *)self initWithSettings:a3 strength:a5 text:a6 font:0 options:a4];
}

- (WALegibilityLabel)initWithSettings:(id)a3 strength:(double)a4 text:(id)a5 font:(id)a6 options:(int64_t)a7
{
  v74[4] = *MEMORY[0x263EF8340];
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  v72.receiver = self;
  v72.super_class = (Class)WALegibilityLabel;
  double v16 = *MEMORY[0x263F001A8];
  double v17 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v18 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v19 = *(double *)(MEMORY[0x263F001A8] + 24);
  v20 = -[WALegibilityLabel initWithFrame:](&v72, sel_initWithFrame_, *MEMORY[0x263F001A8], v17, v18, v19);
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_legibilitySettings, a3);
    v21->_strength = a4;
    uint64_t v22 = [v14 copy];
    text = v21->_text;
    v21->_text = (NSString *)v22;

    objc_storeStrong((id *)&v21->_font, a6);
    v21->_options = a7;
    uint64_t v24 = objc_msgSend(objc_alloc(MEMORY[0x263F1C768]), "initWithFrame:", v16, v17, v18, v19);
    id v71 = v13;
    lookasideLabel = v21->_lookasideLabel;
    v21->_lookasideLabel = (UILabel *)v24;

    [(UILabel *)v21->_lookasideLabel setHidden:1];
    [(UILabel *)v21->_lookasideLabel setText:v21->_text];
    [(UILabel *)v21->_lookasideLabel setFont:v21->_font];
    [(UILabel *)v21->_lookasideLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(WALegibilityLabel *)v21 addSubview:v21->_lookasideLabel];
    v57 = (void *)MEMORY[0x263F08938];
    v67 = [(UILabel *)v21->_lookasideLabel topAnchor];
    v65 = [(WALegibilityLabel *)v21 topAnchor];
    v63 = [v67 constraintEqualToAnchor:v65];
    v74[0] = v63;
    v61 = [(UILabel *)v21->_lookasideLabel leadingAnchor];
    v59 = [(WALegibilityLabel *)v21 leadingAnchor];
    [v61 constraintEqualToAnchor:v59];
    v26 = id v69 = v15;
    v74[1] = v26;
    v27 = [(UILabel *)v21->_lookasideLabel widthAnchor];
    v28 = [(WALegibilityLabel *)v21 widthAnchor];
    [v27 constraintEqualToAnchor:v28];
    v29 = id v70 = v14;
    v74[2] = v29;
    v30 = [(UILabel *)v21->_lookasideLabel heightAnchor];
    v31 = [(WALegibilityLabel *)v21 heightAnchor];
    v32 = [v30 constraintEqualToAnchor:v31];
    v74[3] = v32;
    v33 = [MEMORY[0x263EFF8C0] arrayWithObjects:v74 count:4];
    [v57 activateConstraints:v33];

    v34 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x263F1C778]);
    firstBaselineLayoutGuide = v21->_firstBaselineLayoutGuide;
    v21->_firstBaselineLayoutGuide = v34;

    [(WALegibilityLabel *)v21 addLayoutGuide:v21->_firstBaselineLayoutGuide];
    v36 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x263F1C778]);
    lastBaselineLayoutGuide = v21->_lastBaselineLayoutGuide;
    v21->_lastBaselineLayoutGuide = v36;

    [(WALegibilityLabel *)v21 addLayoutGuide:v21->_lastBaselineLayoutGuide];
    v54 = (void *)MEMORY[0x263F08938];
    v68 = [(UILayoutGuide *)v21->_firstBaselineLayoutGuide topAnchor];
    v66 = [(UILabel *)v21->_lookasideLabel firstBaselineAnchor];
    v64 = [v68 constraintEqualToAnchor:v66];
    v73[0] = v64;
    v62 = [(UILayoutGuide *)v21->_firstBaselineLayoutGuide heightAnchor];
    v60 = [v62 constraintEqualToConstant:0.0];
    v73[1] = v60;
    v58 = [(UILayoutGuide *)v21->_firstBaselineLayoutGuide leadingAnchor];
    v56 = [(WALegibilityLabel *)v21 leadingAnchor];
    v55 = [v58 constraintEqualToAnchor:v56];
    v73[2] = v55;
    v53 = [(UILayoutGuide *)v21->_firstBaselineLayoutGuide trailingAnchor];
    v52 = [(WALegibilityLabel *)v21 trailingAnchor];
    v51 = [v53 constraintEqualToAnchor:v52];
    v73[3] = v51;
    v50 = [(UILayoutGuide *)v21->_lastBaselineLayoutGuide topAnchor];
    v49 = [(UILabel *)v21->_lookasideLabel lastBaselineAnchor];
    v48 = [v50 constraintEqualToAnchor:v49];
    v73[4] = v48;
    v38 = [(UILayoutGuide *)v21->_lastBaselineLayoutGuide heightAnchor];
    v39 = [v38 constraintEqualToConstant:0.0];
    v73[5] = v39;
    v40 = [(UILayoutGuide *)v21->_lastBaselineLayoutGuide leadingAnchor];
    v41 = [(WALegibilityLabel *)v21 leadingAnchor];
    v42 = [v40 constraintEqualToAnchor:v41];
    v73[6] = v42;
    v43 = [(UILayoutGuide *)v21->_lastBaselineLayoutGuide trailingAnchor];
    v44 = [(WALegibilityLabel *)v21 trailingAnchor];
    v45 = [v43 constraintEqualToAnchor:v44];
    v73[7] = v45;
    v46 = [MEMORY[0x263EFF8C0] arrayWithObjects:v73 count:8];
    [v54 activateConstraints:v46];

    id v15 = v69;
    id v14 = v70;

    id v13 = v71;
    [(WALegibilityLabel *)v21 _markOurselfDirty];
  }

  return v21;
}

- (void)setAttributedText:(id)a3
{
  v4 = (NSAttributedString *)[a3 copy];
  attributedText = self->_attributedText;
  self->_attributedText = v4;

  [(UILabel *)self->_lookasideLabel setAttributedText:self->_attributedText];
  [(WALegibilityLabel *)self _markOurselfDirty];
}

- (void)setText:(id)a3
{
  v4 = (NSString *)[a3 copy];
  text = self->_text;
  self->_text = v4;

  [(UILabel *)self->_lookasideLabel setText:self->_text];
  [(WALegibilityLabel *)self _markOurselfDirty];
}

- (UIColor)textColor
{
  textColorOverride = self->_textColorOverride;
  if (textColorOverride)
  {
    v3 = textColorOverride;
  }
  else
  {
    v3 = [(_UILegibilitySettings *)self->_legibilitySettings primaryColor];
  }
  return v3;
}

- (void)setTextColor:(id)a3
{
  p_textColorOverride = &self->_textColorOverride;
  objc_storeStrong((id *)&self->_textColorOverride, a3);
  id v6 = a3;
  [(UILabel *)self->_lookasideLabel setTextColor:*p_textColorOverride];

  [(WALegibilityLabel *)self _markOurselfDirty];
}

- (void)setFont:(id)a3
{
  objc_storeStrong((id *)&self->_font, a3);
  id v5 = a3;
  [(UILabel *)self->_lookasideLabel setFont:v5];

  [(WALegibilityLabel *)self _markOurselfDirty];
}

- (int64_t)numberOfLines
{
  return [(UILabel *)self->_lookasideLabel numberOfLines];
}

- (void)setNumberOfLines:(int64_t)a3
{
  [(UILabel *)self->_lookasideLabel setNumberOfLines:a3];
  [(WALegibilityLabel *)self _markOurselfDirty];
}

- (BOOL)adjustsFontSizeToFitWidth
{
  return [(UILabel *)self->_lookasideLabel adjustsFontSizeToFitWidth];
}

- (void)setAdjustsFontSizeToFitWidth:(BOOL)a3
{
  [(UILabel *)self->_lookasideLabel setAdjustsFontSizeToFitWidth:a3];
  [(WALegibilityLabel *)self _markOurselfDirty];
}

- (double)minimumScaleFactor
{
  [(UILabel *)self->_lookasideLabel minimumScaleFactor];
  return result;
}

- (void)setMinimumScaleFactor:(double)a3
{
  [(UILabel *)self->_lookasideLabel setMinimumScaleFactor:a3];
  [(WALegibilityLabel *)self _markOurselfDirty];
}

- (void)setOptions:(int64_t)a3
{
  self->_options = a3;
  -[_UILegibilityView setOptions:](self->_legibilityView, "setOptions:");
}

- (double)firstBaselineOffsetFromBottom
{
  [(WALegibilityLabel *)self layoutIfNeeded];
  firstBaselineLayoutGuide = self->_firstBaselineLayoutGuide;
  [(WALegibilityLabel *)self _layoutGuideOffsetFromBottom:firstBaselineLayoutGuide];
  return result;
}

- (double)lastBaselineOffsetFromBottom
{
  [(WALegibilityLabel *)self layoutIfNeeded];
  lastBaselineLayoutGuide = self->_lastBaselineLayoutGuide;
  [(WALegibilityLabel *)self _layoutGuideOffsetFromBottom:lastBaselineLayoutGuide];
  return result;
}

- (void)updateConstraints
{
  v30[4] = *MEMORY[0x263EF8340];
  v28.receiver = self;
  v28.super_class = (Class)WALegibilityLabel;
  [(WALegibilityLabel *)&v28 updateConstraints];
  legibilityView = self->_legibilityView;
  if (legibilityView)
  {
    v23 = [(_UILegibilityView *)legibilityView leadingAnchor];
    uint64_t v22 = [(WALegibilityLabel *)self leadingAnchor];
    v21 = [v23 constraintEqualToAnchor:v22];
    v30[0] = v21;
    v20 = [(_UILegibilityView *)self->_legibilityView trailingAnchor];
    v4 = [(WALegibilityLabel *)self trailingAnchor];
    id v5 = [v20 constraintEqualToAnchor:v4];
    v30[1] = v5;
    id v6 = [(_UILegibilityView *)self->_legibilityView bottomAnchor];
    id v7 = [(WALegibilityLabel *)self lastBaselineAnchor];
    [(UILabel *)self->_lookasideLabel _baselineOffsetFromBottom];
    double v8 = objc_msgSend(v6, "constraintEqualToAnchor:constant:", v7);
    v30[2] = v8;
    double v9 = [(_UILegibilityView *)self->_legibilityView topAnchor];
    v10 = [(WALegibilityLabel *)self topAnchor];
    v11 = [v9 constraintEqualToAnchor:v10];
    v30[3] = v11;
    v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v30 count:4];

    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v13 = v12;
    uint64_t v14 = [(NSArray *)v13 countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v14)
    {
      uint64_t v16 = v14;
      uint64_t v17 = *(void *)v25;
      do
      {
        uint64_t v18 = 0;
        do
        {
          if (*(void *)v25 != v17) {
            objc_enumerationMutation(v13);
          }
          LODWORD(v15) = 1144750080;
          [*(id *)(*((void *)&v24 + 1) + 8 * v18++) setPriority:v15];
        }
        while (v16 != v18);
        uint64_t v16 = [(NSArray *)v13 countByEnumeratingWithState:&v24 objects:v29 count:16];
      }
      while (v16);
    }

    [MEMORY[0x263F08938] activateConstraints:v13];
    legibilityConstraints = self->_legibilityConstraints;
    self->_legibilityConstraints = v13;
  }
}

- (id)viewForFirstBaselineLayout
{
  return self->_lookasideLabel;
}

- (id)viewForLastBaselineLayout
{
  return self->_lookasideLabel;
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(WALegibilityLabel *)self frame];
  double v9 = v8;
  double v11 = v10;
  v13.receiver = self;
  v13.super_class = (Class)WALegibilityLabel;
  -[WALegibilityLabel setFrame:](&v13, sel_setFrame_, x, y, width, height);
  if (width != v9 || height != v11)
  {
    [(UILabel *)self->_lookasideLabel setNeedsLayout];
    [(WALegibilityLabel *)self _markOurselfDirty];
  }
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(WALegibilityLabel *)self bounds];
  double v9 = v8;
  double v11 = v10;
  v13.receiver = self;
  v13.super_class = (Class)WALegibilityLabel;
  -[WALegibilityLabel setBounds:](&v13, sel_setBounds_, x, y, width, height);
  if (width != v9 || height != v11)
  {
    [(UILabel *)self->_lookasideLabel setNeedsLayout];
    [(WALegibilityLabel *)self _markOurselfDirty];
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[UILabel sizeThatFits:](self->_lookasideLabel, "sizeThatFits:", a3.width, a3.height);
  result.double height = v4;
  result.double width = v3;
  return result;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)WALegibilityLabel;
  [(WALegibilityLabel *)&v3 layoutSubviews];
  if (self->_isDirty)
  {
    self->_isDirtdouble y = 0;
    [(WALegibilityLabel *)self _updateLegibilityView];
  }
}

- (void)setStrength:(double)a3
{
  self->_strength = a3;
  -[_UILegibilityView setStrength:](self->_legibilityView, "setStrength:");
}

- (void)setLegibilitySettings:(id)a3
{
  objc_storeStrong((id *)&self->_legibilitySettings, a3);
  [(WALegibilityLabel *)self _markOurselfDirty];
}

- (void)_markOurselfDirty
{
  self->_isDirtdouble y = 1;
  [(WALegibilityLabel *)self setNeedsLayout];
}

- (double)_layoutGuideOffsetFromBottom:(id)a3
{
  id v4 = a3;
  [(WALegibilityLabel *)self bounds];
  double v6 = v5;
  double v8 = v7;
  [v4 layoutFrame];
  double v10 = v9;

  return v6 + v8 - v10;
}

- (void)_updateLabelForLegibilitySettings
{
  objc_super v3 = [(UILabel *)self->_lookasideLabel attributedText];
  id v7 = (id)[v3 mutableCopy];

  uint64_t v4 = [v7 length];
  double v5 = [(WALegibilityLabel *)self textColor];
  uint64_t v6 = *MEMORY[0x263F1C240];
  if (v5) {
    objc_msgSend(v7, "addAttribute:value:range:", v6, v5, 0, v4);
  }
  else {
    objc_msgSend(v7, "removeAttribute:range:", v6, 0, v4);
  }
  [(UILabel *)self->_lookasideLabel setAttributedText:v7];
}

- (void)_updateLegibilityView
{
  [(WALegibilityLabel *)self _updateLabelForLegibilitySettings];
  [(WALegibilityLabel *)self bounds];
  objc_super v3 = [MEMORY[0x263F1C920] mainScreen];
  [v3 scale];
  uint64_t v4 = _UIGraphicsDrawIntoImageContextWithOptions();

  legibilityConstraints = self->_legibilityConstraints;
  self->_legibilityConstraints = 0;

  [(_UILegibilityView *)self->_legibilityView removeFromSuperview];
  legibilityView = self->_legibilityView;
  self->_legibilityView = 0;

  id v7 = (_UILegibilityView *)[objc_alloc(MEMORY[0x263F1CCE0]) initWithSettings:self->_legibilitySettings strength:v4 image:0 shadowImage:self->_options options:self->_strength];
  double v8 = self->_legibilityView;
  self->_legibilityView = v7;

  [(_UILegibilityView *)self->_legibilityView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(WALegibilityLabel *)self addSubview:self->_legibilityView];
  [(WALegibilityLabel *)self setNeedsUpdateConstraints];
}

uint64_t __42__WALegibilityLabel__updateLegibilityView__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 408), "drawRect:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (NSAttributedString)attributedText
{
  return self->_attributedText;
}

- (NSString)text
{
  return self->_text;
}

- (UIFont)font
{
  return self->_font;
}

- (double)strength
{
  return self->_strength;
}

- (_UILegibilitySettings)legibilitySettings
{
  return self->_legibilitySettings;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
  objc_storeStrong((id *)&self->_textColorOverride, 0);
  objc_storeStrong((id *)&self->_attributedText, 0);
  objc_storeStrong((id *)&self->_font, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_lastBaselineLayoutGuide, 0);
  objc_storeStrong((id *)&self->_firstBaselineLayoutGuide, 0);
  objc_storeStrong((id *)&self->_legibilityConstraints, 0);
  objc_storeStrong((id *)&self->_legibilityView, 0);
  objc_storeStrong((id *)&self->_lookasideLabel, 0);
}

@end