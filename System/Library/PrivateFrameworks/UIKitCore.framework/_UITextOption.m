@interface _UITextOption
+ (double)baseSymbolSize;
- (BOOL)selectionVisibilityForState:(unint64_t)a3;
- (CGSize)intrinsicContentSize;
- (CGSize)secureCandidateSize;
- (NSArray)insetConstraints;
- (NSDirectionalEdgeInsets)contentInsetsForType:(int64_t)a3 dividerWidth:(double)a4;
- (NSDirectionalEdgeInsets)currentEdgeInsets;
- (NSLayoutConstraint)minimumLabelWidth;
- (NSString)originalText;
- (NSString)textChoice;
- (TIKeyboardCandidate)sourceCandidate;
- (UIColor)optionalTintColor;
- (UIImageView)symbolImageView;
- (UILabel)contentsLabel;
- (UILayoutGuide)accessorySymbolSpacingGuide;
- (UIView)lineView;
- (UIView)secureCandidateLabel;
- (UIVisualEffectView)contentsLabelEffectView;
- (UIVisualEffectView)selectionVibrancyView;
- (_UITextOption)initWithTitle:(id)a3 type:(int64_t)a4;
- (_UITextOption)initWithTitle:(id)a3 type:(int64_t)a4 optionalTintColor:(id)a5;
- (double)horizontalPadding;
- (double)insetMultiplierForContentSizeCategory:(id)a3;
- (double)leadingSpace;
- (id)buttonImage;
- (id)createSelectionVibrancyView;
- (id)fontForLabel;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)imageName;
- (id)textColor;
- (id)textToUse;
- (id)viewForLastBaselineLayout;
- (int64_t)type;
- (unint64_t)state;
- (void)setAccessorySymbolSpacingGuide:(id)a3;
- (void)setContentsLabel:(id)a3;
- (void)setContentsLabelEffectView:(id)a3;
- (void)setCurrentEdgeInsets:(NSDirectionalEdgeInsets)a3;
- (void)setHorizontalPadding:(double)a3;
- (void)setInsetConstraints:(id)a3;
- (void)setLightingEffectEnabled:(BOOL)a3 atPosition:(int64_t)a4;
- (void)setLineView:(id)a3;
- (void)setMinimumLabelWidth:(id)a3;
- (void)setOptionalTintColor:(id)a3;
- (void)setOriginalText:(id)a3;
- (void)setSecureCandidateLabel:(id)a3;
- (void)setSecureCandidateSize:(CGSize)a3;
- (void)setSelectionVibrancyView:(id)a3;
- (void)setSourceCandidate:(id)a3;
- (void)setState:(unint64_t)a3;
- (void)setSymbolImageView:(id)a3;
- (void)setTextChoice:(id)a3;
- (void)setType:(int64_t)a3;
- (void)showSeparator:(BOOL)a3;
- (void)updateContentView;
- (void)updateSourceCandidate:(id)a3 secureCandidateHeight:(double)a4;
- (void)updateText:(id)a3 type:(int64_t)a4;
@end

@implementation _UITextOption

- (_UITextOption)initWithTitle:(id)a3 type:(int64_t)a4
{
  return [(_UITextOption *)self initWithTitle:a3 type:a4 optionalTintColor:0];
}

- (_UITextOption)initWithTitle:(id)a3 type:(int64_t)a4 optionalTintColor:(id)a5
{
  id v9 = a3;
  v10 = (UIColor *)a5;
  v14.receiver = self;
  v14.super_class = (Class)_UITextOption;
  v11 = [(UIView *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_textChoice, a3);
    v12->_type = a4;
    v12->_state = 0;
    v12->_optionalTintColor = v10;
    [(_UITextOption *)v12 updateContentView];
  }

  return v12;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  if (-[UIView pointInside:withEvent:](self, "pointInside:withEvent:", v7, x, y))
  {
    v8 = self;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)_UITextOption;
    -[UIView hitTest:withEvent:](&v11, sel_hitTest_withEvent_, v7, x, y);
    v8 = (_UITextOption *)objc_claimAutoreleasedReturnValue();
  }
  id v9 = v8;

  return v9;
}

- (void)showSeparator:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(_UITextOption *)self lineView];
  [v4 setHidden:!v3];
}

- (id)viewForLastBaselineLayout
{
  v2 = self;
  if ([(_UITextOption *)self type] == 2
    || [(_UITextOption *)v2 type] == 3
    || [(_UITextOption *)v2 type] == 4)
  {
    BOOL v3 = &OBJC_IVAR____UITextOption__contentsLabel;
LABEL_5:
    v2 = *(_UITextOption **)((char *)&v2->super.super.super.isa + *v3);
    goto LABEL_6;
  }
  if (![(_UITextOption *)v2 type]
    || [(_UITextOption *)v2 type] == 1
    || [(_UITextOption *)v2 type] == 5)
  {
    BOOL v3 = &OBJC_IVAR____UITextOption__symbolImageView;
    goto LABEL_5;
  }
LABEL_6:
  return v2;
}

- (double)leadingSpace
{
  [(_UITextOption *)self currentEdgeInsets];
  if (v3 <= 0.0) {
    [(_UITextOption *)self contentInsetsForType:[(_UITextOption *)self type] dividerWidth:1.0];
  }
  else {
    [(_UITextOption *)self currentEdgeInsets];
  }
  return v4;
}

- (void)setLightingEffectEnabled:(BOOL)a3 atPosition:(int64_t)a4
{
  if (a3)
  {
    v6 = [_UIDirectionalLightConfiguration alloc];
    id v7 = +[_UIColorPalette intelligenceAmbientPalette];
    v8 = [(_UIDirectionalLightConfiguration *)v6 initWithColorPalette:v7];

    [(_UIDirectionalLightConfiguration *)v8 setDirection:0];
    [(_UIDirectionalLightConfiguration *)v8 setDuration:2.0];
    id v9 = +[_UIIntelligenceLightSourceDescriptor directionalLightWithConfiguration:v8];
    v10 = [[_UIIntelligenceContentLightEffect alloc] initWithLightSource:v9 blurStyle:8];
    [(UIVisualEffectView *)self->_contentsLabelEffectView setEffect:v10];

    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __53___UITextOption_setLightingEffectEnabled_atPosition___block_invoke;
    v12[3] = &unk_1E52D9F70;
    v12[4] = self;
    +[UIView animateWithDuration:0x10000 delay:v12 options:0 animations:0.5 completion:(float)((float)a4 * 0.625) + 2.0];
    [(_UITextOption *)self updateContentView];
  }
  else
  {
    contentsLabelEffectView = self->_contentsLabelEffectView;
    -[UIVisualEffectView setEffect:](contentsLabelEffectView, "setEffect:", 0, a4);
  }
}

- (NSDirectionalEdgeInsets)contentInsetsForType:(int64_t)a3 dividerWidth:(double)a4
{
  double v5 = 8.0;
  double v6 = 3.0;
  double v7 = 0.0;
  double v8 = 3.0;
  switch(a3)
  {
    case 2:
    case 7:
      double v5 = 14.0;
      double v7 = a4 + 14.0;
      double v8 = 5.0;
      goto LABEL_4;
    case 3:
      break;
    case 4:
      double v7 = a4 + 26.0;
      double v8 = 5.0;
      double v5 = 14.0;
LABEL_4:
      double v6 = 6.0;
      break;
    default:
      a4 = 23.0;
      double v7 = 0.0;
      double v9 = 38.0;
      if (a3 != 5) {
        double v9 = 0.0;
      }
      if ((unint64_t)a3 >= 2) {
        double v5 = v9;
      }
      else {
        double v5 = 23.0;
      }
      double v6 = 0.0;
      double v8 = 0.0;
      break;
  }
  v10 = [(UIView *)self traitCollection];
  objc_super v11 = [v10 preferredContentSizeCategory];
  [(_UITextOption *)self insetMultiplierForContentSizeCategory:v11];
  double v13 = v12;

  double v14 = fmax(v13, 1.0);
  double v15 = v7 * v14;
  double v16 = v5 * v14;
  double v17 = v8;
  double v18 = v6;
  result.trailing = v15;
  result.bottom = v18;
  result.leading = v16;
  result.top = v17;
  return result;
}

- (double)insetMultiplierForContentSizeCategory:(id)a3
{
  id v3 = a3;
  if (qword_1EB25E730 != -1) {
    dispatch_once(&qword_1EB25E730, &__block_literal_global_225);
  }
  double v4 = [(id)_MergedGlobals_23_1 objectForKeyedSubscript:v3];
  double v5 = v4;
  if (v4)
  {
    [v4 floatValue];
    double v7 = v6;
  }
  else
  {
    double v7 = 1.0;
  }

  return v7;
}

- (id)createSelectionVibrancyView
{
  v23[4] = *MEMORY[0x1E4F143B8];
  v2 = objc_alloc_init(UIView);
  id v3 = +[UIColor blackColor];
  [(UIView *)v2 setBackgroundColor:v3];

  double v4 = +[UIBlurEffect effectWithStyle:9];
  v22 = +[UIVibrancyEffect effectForBlurEffect:v4 style:6];

  double v5 = [[UIVisualEffectView alloc] initWithEffect:v22];
  [(UIView *)v5 setTranslatesAutoresizingMaskIntoConstraints:0];
  float v6 = [(UIVisualEffectView *)v5 contentView];
  [v6 addSubview:v2];

  [(UIView *)v2 setTranslatesAutoresizingMaskIntoConstraints:0];
  double v16 = (void *)MEMORY[0x1E4F5B268];
  v21 = [(UIView *)v2 leadingAnchor];
  v20 = [(UIView *)v5 leadingAnchor];
  v19 = [v21 constraintEqualToAnchor:v20];
  v23[0] = v19;
  double v18 = [(UIView *)v2 trailingAnchor];
  double v17 = [(UIView *)v5 trailingAnchor];
  double v7 = [v18 constraintEqualToAnchor:v17];
  v23[1] = v7;
  double v8 = [(UIView *)v2 topAnchor];
  double v9 = [(UIView *)v5 topAnchor];
  v10 = [v8 constraintEqualToAnchor:v9];
  v23[2] = v10;
  objc_super v11 = [(UIView *)v2 bottomAnchor];
  double v12 = [(UIView *)v5 bottomAnchor];
  double v13 = [v11 constraintEqualToAnchor:v12];
  v23[3] = v13;
  double v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:4];
  [v16 activateConstraints:v14];

  return v5;
}

- (void)updateContentView
{
  v249[4] = *MEMORY[0x1E4F143B8];
  if (!self->_selectionVibrancyView)
  {
    id v3 = [(_UITextOption *)self createSelectionVibrancyView];
    selectionVibrancyView = self->_selectionVibrancyView;
    self->_selectionVibrancyView = v3;

    [(UIView *)self addSubview:self->_selectionVibrancyView];
    if ([(_UITextOption *)self type] == 1 || (double v5 = 0.0, ![(_UITextOption *)self type])) {
      double v5 = 4.0;
    }
    v208 = (void *)MEMORY[0x1E4F5B268];
    v238 = [(UIView *)self->_selectionVibrancyView leadingAnchor];
    v232 = [(UIView *)self leadingAnchor];
    v226 = [v238 constraintEqualToAnchor:v232];
    v249[0] = v226;
    v220 = [(UIView *)self->_selectionVibrancyView trailingAnchor];
    v214 = [(UIView *)self trailingAnchor];
    float v6 = [v220 constraintEqualToAnchor:v214 constant:v5];
    v249[1] = v6;
    double v7 = [(UIView *)self->_selectionVibrancyView topAnchor];
    double v8 = [(UIView *)self topAnchor];
    double v9 = [v7 constraintEqualToAnchor:v8];
    v249[2] = v9;
    v10 = [(UIView *)self->_selectionVibrancyView bottomAnchor];
    objc_super v11 = [(UIView *)self bottomAnchor];
    double v12 = [v10 constraintEqualToAnchor:v11];
    v249[3] = v12;
    double v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v249 count:4];
    [v208 activateConstraints:v13];

    [(UIView *)self->_selectionVibrancyView setHidden:[(_UITextOption *)self selectionVisibilityForState:self->_state] ^ 1];
  }
  [(UIView *)self->_contentsLabel setHidden:1];
  [(UIImageView *)self->_symbolImageView setHidden:1];
  [(UIView *)self->_secureCandidateLabel setHidden:1];
  double v14 = &xmmword_186B92000;
  if ([(_UITextOption *)self type] == 6)
  {
    if (!self->_secureCandidateLabel)
    {
      double v15 = [UIView alloc];
      double v16 = -[UIView initWithFrame:](v15, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      secureCandidateLabel = self->_secureCandidateLabel;
      self->_secureCandidateLabel = v16;

      double v18 = +[UIScreen mainScreen];
      [v18 scale];
      double v20 = v19;
      v21 = [(UIView *)self->_secureCandidateLabel layer];
      [v21 setContentsScale:v20];

      v22 = +[UIScreen mainScreen];
      [v22 scale];
      double v24 = v23;
      v25 = [(UIView *)self->_secureCandidateLabel layer];
      [v25 setRasterizationScale:v24];

      uint64_t v26 = *MEMORY[0x1E4F3A3C0];
      v27 = [(UIView *)self->_secureCandidateLabel layer];
      [v27 setContentsGravity:v26];

      [(UIView *)self->_secureCandidateLabel setUserInteractionEnabled:0];
      [(UIView *)self->_secureCandidateLabel setTranslatesAutoresizingMaskIntoConstraints:0];
      [(UIView *)self addSubview:self->_secureCandidateLabel];
      v209 = (void *)MEMORY[0x1E4F5B268];
      v239 = [(UIView *)self->_secureCandidateLabel topAnchor];
      v233 = [(UIView *)self topAnchor];
      v227 = [v239 constraintEqualToAnchor:v233];
      v248[0] = v227;
      v221 = [(UIView *)self->_secureCandidateLabel leadingAnchor];
      v215 = [(UIView *)self leadingAnchor];
      v28 = [v221 constraintEqualToAnchor:v215];
      v248[1] = v28;
      v29 = [(UIView *)self bottomAnchor];
      v30 = [(UIView *)self->_secureCandidateLabel bottomAnchor];
      v31 = [v29 constraintEqualToAnchor:v30];
      v248[2] = v31;
      v32 = [(UIView *)self trailingAnchor];
      v33 = [(UIView *)self->_secureCandidateLabel trailingAnchor];
      v34 = [v32 constraintEqualToAnchor:v33];
      v248[3] = v34;
      v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:v248 count:4];
      [v209 activateConstraints:v35];

      double v14 = &xmmword_186B92000;
    }
    v36 = (void *)MEMORY[0x1E4F39B58];
    v37 = [(_UITextOption *)self sourceCandidate];
    v38 = objc_msgSend(v36, "objectForSlot:", objc_msgSend(v37, "slotID"));
    v39 = [(UIView *)self->_secureCandidateLabel layer];
    [v39 setContents:v38];

    [(UIView *)self->_secureCandidateLabel setHidden:0];
    double v40 = 0.0;
    double v41 = 0.0;
    double v42 = 0.0;
    double v43 = 0.0;
    goto LABEL_54;
  }
  if ([(_UITextOption *)self type] != 2
    && [(_UITextOption *)self type] != 3
    && [(_UITextOption *)self type] != 4
    && [(_UITextOption *)self type] != 7
    && [(_UITextOption *)self type] != 8)
  {
    if ([(_UITextOption *)self type] != 1)
    {
      if ([(_UITextOption *)self type])
      {
        double v40 = 0.0;
        double v41 = 0.0;
        double v42 = 0.0;
        double v43 = 0.0;
        if ([(_UITextOption *)self type] != 5) {
          goto LABEL_54;
        }
      }
    }
    [(_UITextOption *)self contentInsetsForType:[(_UITextOption *)self type] dividerWidth:0.0];
    double v43 = v149;
    double v42 = v150;
    double v41 = v151;
    double v40 = v152;
    symbolImageView = self->_symbolImageView;
    if (!symbolImageView)
    {
      v154 = [UIImageView alloc];
      v155 = [(_UITextOption *)self buttonImage];
      v156 = [(UIImageView *)v154 initWithImage:v155];
      v157 = self->_symbolImageView;
      self->_symbolImageView = v156;

      [(UIImageView *)self->_symbolImageView setTranslatesAutoresizingMaskIntoConstraints:0];
      [(UIView *)self addSubview:self->_symbolImageView];
      v158 = objc_alloc_init(UILayoutGuide);
      [(UIView *)self addLayoutGuide:v158];
      v195 = (void *)MEMORY[0x1E4F5B268];
      v242 = [(UILayoutGuide *)v158 topAnchor];
      v237 = [(UIView *)self topAnchor];
      v231 = [v242 constraintEqualToAnchor:v237];
      v243[0] = v231;
      v225 = [(UILayoutGuide *)v158 leadingAnchor];
      v219 = [(UIView *)self leadingAnchor];
      v213 = [v225 constraintEqualToAnchor:v219];
      v243[1] = v213;
      v207 = [(UIView *)self bottomAnchor];
      v203 = [(UILayoutGuide *)v158 bottomAnchor];
      v199 = [v207 constraintEqualToAnchor:v203];
      v243[2] = v199;
      v191 = [(UIView *)self trailingAnchor];
      v187 = [(UILayoutGuide *)v158 trailingAnchor];
      v184 = [v191 constraintEqualToAnchor:v187 constant:v40];
      v243[3] = v184;
      v181 = [(UILayoutGuide *)v158 widthAnchor];
      v178 = [v181 constraintEqualToConstant:v42];
      v243[4] = v178;
      v159 = [(UIView *)self->_symbolImageView centerYAnchor];
      v160 = [(UILayoutGuide *)v158 centerYAnchor];
      v161 = [v159 constraintEqualToAnchor:v160];
      v243[5] = v161;
      v162 = [(UIView *)self->_symbolImageView centerXAnchor];
      v163 = [(UILayoutGuide *)v158 centerXAnchor];
      v164 = [v162 constraintEqualToAnchor:v163];
      v243[6] = v164;
      v165 = [MEMORY[0x1E4F1C978] arrayWithObjects:v243 count:7];
      [v195 activateConstraints:v165];

      double v14 = &xmmword_186B92000;
      symbolImageView = self->_symbolImageView;
    }
    [(UIImageView *)symbolImageView setHidden:0];
    v166 = self->_symbolImageView;
    v167 = [(_UITextOption *)self buttonImage];
    [(UIImageView *)v166 setImage:v167];

    v168 = [(_UITextOption *)self optionalTintColor];

    v143 = self->_symbolImageView;
    if (v168)
    {
      uint64_t v144 = [(_UITextOption *)self optionalTintColor];
      goto LABEL_53;
    }
    goto LABEL_51;
  }
  [(_UITextOption *)self contentInsetsForType:[(_UITextOption *)self type] dividerWidth:1.0];
  double v43 = v44;
  double v42 = v45;
  double v41 = v46;
  double v40 = v47;
  if (self->_contentsLabel)
  {
    uint64_t v48 = [(_UITextOption *)self insetConstraints];
    if (v48)
    {
      v49 = (void *)v48;
      v50 = [(_UITextOption *)self insetConstraints];
      uint64_t v51 = [v50 count];

      if (v51 == 8)
      {
        v52 = [(_UITextOption *)self insetConstraints];
        v53 = [v52 objectAtIndexedSubscript:0];
        [v53 setConstant:v43];

        v54 = [(_UITextOption *)self insetConstraints];
        v55 = [v54 objectAtIndexedSubscript:1];
        [v55 setConstant:v42];

        v56 = [(_UITextOption *)self insetConstraints];
        v57 = [v56 objectAtIndexedSubscript:2];
        [v57 setConstant:v41];

        v58 = [(_UITextOption *)self insetConstraints];
        v59 = [v58 objectAtIndexedSubscript:3];
        [v59 setConstant:v40];
      }
    }
  }
  else
  {
    if (!self->_contentsLabelEffectView)
    {
      v60 = [[UIVisualEffectView alloc] initWithEffect:0];
      contentsLabelEffectView = self->_contentsLabelEffectView;
      self->_contentsLabelEffectView = v60;

      [(UIView *)self->_contentsLabelEffectView setTranslatesAutoresizingMaskIntoConstraints:0];
      [(UIView *)self addSubview:self->_contentsLabelEffectView];
    }
    v62 = objc_alloc_init(UILabel);
    contentsLabel = self->_contentsLabel;
    self->_contentsLabel = v62;

    [(UIView *)self->_contentsLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)self->_contentsLabel setTextAlignment:1];
    v64 = [(UIVisualEffectView *)self->_contentsLabelEffectView contentView];
    [v64 addSubview:self->_contentsLabel];

    v65 = [(_UITextOption *)self insetConstraints];

    if (v65)
    {
      v66 = (void *)MEMORY[0x1E4F5B268];
      v67 = [(_UITextOption *)self insetConstraints];
      [v66 deactivateConstraints:v67];
    }
    v234 = [(UIView *)self->_contentsLabelEffectView topAnchor];
    v228 = [(UIView *)self topAnchor];
    v222 = [v234 constraintEqualToAnchor:v228 constant:v43];
    v247[0] = v222;
    v216 = [(UIView *)self->_contentsLabelEffectView leadingAnchor];
    v210 = [(UIView *)self leadingAnchor];
    v204 = [v216 constraintEqualToAnchor:v210 constant:v42];
    v247[1] = v204;
    v200 = [(UIView *)self bottomAnchor];
    v196 = [(UIView *)self->_contentsLabelEffectView bottomAnchor];
    v192 = [v200 constraintEqualToAnchor:v196 constant:v41];
    v247[2] = v192;
    v188 = [(UIView *)self trailingAnchor];
    v185 = [(UIView *)self->_contentsLabelEffectView trailingAnchor];
    v182 = [v188 constraintEqualToAnchor:v185 constant:v40];
    v247[3] = v182;
    v179 = [(UIView *)self->_contentsLabel topAnchor];
    v176 = [(UIView *)self->_contentsLabelEffectView topAnchor];
    v174 = [v179 constraintEqualToAnchor:v176];
    v247[4] = v174;
    v172 = [(UIView *)self->_contentsLabel leadingAnchor];
    v170 = [(UIView *)self->_contentsLabelEffectView leadingAnchor];
    v68 = [v172 constraintEqualToAnchor:v170];
    v247[5] = v68;
    v69 = [(UIView *)self->_contentsLabelEffectView bottomAnchor];
    v70 = [(UIView *)self->_contentsLabel bottomAnchor];
    v71 = [v69 constraintEqualToAnchor:v70];
    v247[6] = v71;
    v72 = [(UIView *)self->_contentsLabelEffectView trailingAnchor];
    v73 = [(UIView *)self->_contentsLabel trailingAnchor];
    v74 = [v72 constraintEqualToAnchor:v73];
    v247[7] = v74;
    v75 = [MEMORY[0x1E4F1C978] arrayWithObjects:v247 count:8];
    [(_UITextOption *)self setInsetConstraints:v75];

    v76 = [(UIView *)self->_contentsLabel widthAnchor];
    v77 = [v76 constraintGreaterThanOrEqualToConstant:16.0];
    [(_UITextOption *)self setMinimumLabelWidth:v77];

    v78 = (void *)MEMORY[0x1E4F5B268];
    v79 = [(_UITextOption *)self insetConstraints];
    [v78 activateConstraints:v79];

    double v14 = &xmmword_186B92000;
    LODWORD(v80) = 1144750080;
    [(UIView *)self->_contentsLabel setContentHuggingPriority:0 forAxis:v80];
  }
  [(UIView *)self->_contentsLabel setHidden:0];
  int64_t v81 = [(_UITextOption *)self type];
  v82 = [(_UITextOption *)self minimumLabelWidth];
  int v83 = [v82 isActive];

  if (v81 == 2)
  {
    if (v83) {
      goto LABEL_30;
    }
    v84 = [(_UITextOption *)self minimumLabelWidth];
    v85 = v84;
    uint64_t v86 = 1;
  }
  else
  {
    if (!v83) {
      goto LABEL_30;
    }
    v84 = [(_UITextOption *)self minimumLabelWidth];
    v85 = v84;
    uint64_t v86 = 0;
  }
  [v84 setActive:v86];

LABEL_30:
  if ([(_UITextOption *)self type] == 8)
  {
    v87 = [(TIKeyboardCandidate *)self->_sourceCandidate textSuggestion];
    v88 = [v87 headerText];
    uint64_t v89 = [v88 length];

    if (v89)
    {
      v90 = NSString;
      v91 = [v87 headerText];
      v92 = [v87 displayText];
      v93 = [v90 stringWithFormat:@"%@\n%@", v91, v92];
      textChoice = self->_textChoice;
      self->_textChoice = v93;
    }
  }
  if ([(NSString *)self->_textChoice containsString:@"\n"]) {
    uint64_t v95 = 2;
  }
  else {
    uint64_t v95 = 1;
  }
  -[UILabel _setMultilineLabelRequiresCarefulMeasurement:](self->_contentsLabel, "_setMultilineLabelRequiresCarefulMeasurement:");
  [(UILabel *)self->_contentsLabel setNumberOfLines:v95];
  [(UILabel *)self->_contentsLabel setText:self->_textChoice];
  v96 = self->_contentsLabel;
  v97 = [(_UITextOption *)self fontForLabel];
  [(UILabel *)v96 setFont:v97];

  v98 = self->_contentsLabel;
  v99 = [(_UITextOption *)self textColor];
  [(UILabel *)v98 setTextColor:v99];

  if (!self->_lineView)
  {
    v100 = objc_alloc_init(UIView);
    lineView = self->_lineView;
    self->_lineView = v100;

    [(UIView *)self->_lineView setTranslatesAutoresizingMaskIntoConstraints:0];
    v102 = +[UIColor separatorColor];
    [(UIView *)self->_lineView setBackgroundColor:v102];

    v103 = +[UIBlurEffect effectWithStyle:9];
    v240 = +[UIVibrancyEffect effectForBlurEffect:v103 style:7];

    v104 = [[UIVisualEffectView alloc] initWithEffect:v240];
    [(UIView *)v104 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)self addSubview:v104];
    v105 = [(UIVisualEffectView *)v104 contentView];
    [v105 addSubview:self->_lineView];

    v189 = (void *)MEMORY[0x1E4F5B268];
    v235 = [(UIView *)self trailingAnchor];
    v229 = [(UIView *)v104 trailingAnchor];
    v223 = [v235 constraintEqualToAnchor:v229];
    v246[0] = v223;
    v217 = [(UIView *)v104 topAnchor];
    v211 = [(UIView *)self topAnchor];
    v205 = [v217 constraintEqualToAnchor:v211];
    v246[1] = v205;
    v201 = [(UIView *)v104 bottomAnchor];
    v197 = [(UIView *)self bottomAnchor];
    v193 = [v201 constraintEqualToAnchor:v197];
    v246[2] = v193;
    v186 = [(UIView *)v104 widthAnchor];
    v183 = [v186 constraintEqualToConstant:1.0];
    v246[3] = v183;
    v180 = [(UIView *)v104 trailingAnchor];
    v177 = [(UIView *)self->_lineView trailingAnchor];
    v175 = [v180 constraintEqualToAnchor:v177];
    v246[4] = v175;
    v173 = [(UIView *)self->_lineView topAnchor];
    v171 = [(UIView *)v104 topAnchor];
    v169 = [v173 constraintEqualToAnchor:v171];
    v246[5] = v169;
    v106 = [(UIView *)self->_lineView bottomAnchor];
    v107 = [(UIView *)v104 bottomAnchor];
    v108 = [v106 constraintEqualToAnchor:v107];
    v246[6] = v108;
    v109 = [(UIView *)self->_lineView widthAnchor];
    v110 = [v109 constraintEqualToConstant:1.0];
    v246[7] = v110;
    v111 = [MEMORY[0x1E4F1C978] arrayWithObjects:v246 count:8];
    [v189 activateConstraints:v111];

    double v14 = &xmmword_186B92000;
  }
  int64_t v112 = [(_UITextOption *)self type];
  v113 = self->_symbolImageView;
  if (v112 == 4)
  {
    if (!v113)
    {
      v114 = [UIImageView alloc];
      v115 = [(_UITextOption *)self buttonImage];
      v116 = [(UIImageView *)v114 initWithImage:v115];
      v117 = self->_symbolImageView;
      self->_symbolImageView = v116;

      [(UIImageView *)self->_symbolImageView setTranslatesAutoresizingMaskIntoConstraints:0];
      [(UIView *)self addSubview:self->_symbolImageView];
      if (self->_accessorySymbolSpacingGuide) {
        [(UIView *)self removeLayoutGuide:"removeLayoutGuide:"];
      }
      v118 = objc_alloc_init(UILayoutGuide);
      accessorySymbolSpacingGuide = self->_accessorySymbolSpacingGuide;
      self->_accessorySymbolSpacingGuide = v118;

      [(UIView *)self addLayoutGuide:self->_accessorySymbolSpacingGuide];
      int64_t v120 = [(_UITextOption *)self type];
      v212 = (void *)MEMORY[0x1E4F5B268];
      v121 = [(UILayoutGuide *)self->_accessorySymbolSpacingGuide topAnchor];
      v236 = [(UIView *)self topAnchor];
      v241 = v121;
      uint64_t v122 = [v121 constraintEqualToAnchor:v236 constant:v43];
      v230 = (void *)v122;
      if (v120 == 4)
      {
        v245[0] = v122;
        v123 = [(UIView *)self bottomAnchor];
        v218 = [(UILayoutGuide *)self->_accessorySymbolSpacingGuide bottomAnchor];
        v224 = v123;
        v206 = [v123 constraintEqualToAnchor:v218 constant:v41];
        v245[1] = v206;
        v124 = [(UILayoutGuide *)self->_accessorySymbolSpacingGuide trailingAnchor];
        v198 = [(UIView *)self->_lineView leadingAnchor];
        v202 = v124;
        v194 = [v124 constraintEqualToAnchor:v198];
        v245[2] = v194;
        v125 = [(UIView *)self->_symbolImageView centerXAnchor];
        v126 = [(UILayoutGuide *)self->_accessorySymbolSpacingGuide centerXAnchor];
        v190 = v125;
        v127 = [v125 constraintEqualToAnchor:v126 constant:-2.0];
        v245[3] = v127;
        v128 = [(UIView *)self->_symbolImageView centerYAnchor];
        v129 = [(UILayoutGuide *)self->_accessorySymbolSpacingGuide centerYAnchor];
        v130 = [v128 constraintEqualToAnchor:v129];
        v245[4] = v130;
        v131 = [(UILayoutGuide *)self->_accessorySymbolSpacingGuide widthAnchor];
        v132 = [v131 constraintEqualToConstant:v40];
        v245[5] = v132;
        v133 = v245;
      }
      else
      {
        v244[0] = v122;
        v136 = [(UIView *)self bottomAnchor];
        v218 = [(UILayoutGuide *)self->_accessorySymbolSpacingGuide bottomAnchor];
        v224 = v136;
        v206 = [v136 constraintEqualToAnchor:v218 constant:v41];
        v244[1] = v206;
        v137 = [(UILayoutGuide *)self->_accessorySymbolSpacingGuide leadingAnchor];
        v198 = [(UIView *)self leadingAnchor];
        v202 = v137;
        v194 = [v137 constraintEqualToAnchor:v198];
        v244[2] = v194;
        v138 = [(UIView *)self->_symbolImageView centerXAnchor];
        v126 = [(UILayoutGuide *)self->_accessorySymbolSpacingGuide centerXAnchor];
        v190 = v138;
        v127 = [v138 constraintEqualToAnchor:v126 constant:0.0];
        v244[3] = v127;
        v128 = [(UIView *)self->_symbolImageView centerYAnchor];
        v129 = [(UILayoutGuide *)self->_accessorySymbolSpacingGuide centerYAnchor];
        v130 = [v128 constraintEqualToAnchor:v129 constant:-2.0];
        v244[4] = v130;
        v131 = [(UILayoutGuide *)self->_accessorySymbolSpacingGuide widthAnchor];
        v132 = [v131 constraintEqualToConstant:v42];
        v244[5] = v132;
        v133 = v244;
      }
      v139 = [MEMORY[0x1E4F1C978] arrayWithObjects:v133 count:6];
      [v212 activateConstraints:v139];

      v113 = self->_symbolImageView;
      double v14 = &xmmword_186B92000;
    }
    [(UIImageView *)v113 setHidden:0];
    v140 = self->_symbolImageView;
    v141 = [(_UITextOption *)self buttonImage];
    [(UIImageView *)v140 setImage:v141];

    [(UIImageView *)self->_symbolImageView setContentMode:1];
    int64_t v142 = [(_UITextOption *)self type];
    v143 = self->_symbolImageView;
    if (v142 != 4)
    {
      uint64_t v144 = +[UIColor labelColor];
      goto LABEL_53;
    }
LABEL_51:
    uint64_t v144 = +[UIColor secondaryLabelColor];
LABEL_53:
    v145 = (void *)v144;
    [(UIView *)v143 setTintColor:v144];

    LODWORD(v146) = *((_DWORD *)v14 + 310);
    [(UIView *)self->_symbolImageView setContentHuggingPriority:0 forAxis:v146];
    goto LABEL_54;
  }
  if (v113)
  {
    [(UIView *)v113 removeFromSuperview];
    v134 = self->_symbolImageView;
    self->_symbolImageView = 0;

    if (self->_accessorySymbolSpacingGuide)
    {
      [(UIView *)self removeLayoutGuide:"removeLayoutGuide:"];
      v135 = self->_accessorySymbolSpacingGuide;
      self->_accessorySymbolSpacingGuide = 0;
    }
  }
LABEL_54:
  -[_UITextOption setCurrentEdgeInsets:](self, "setCurrentEdgeInsets:", v43, v42, v41, v40);
  [(_UITextOption *)self setHorizontalPadding:v40 + v42];
  LODWORD(v147) = *((_DWORD *)v14 + 310);
  [(UIView *)self setContentHuggingPriority:0 forAxis:v147];
  LODWORD(v148) = 1148829696;
  [(UIView *)self setContentCompressionResistancePriority:0 forAxis:v148];
}

- (void)updateSourceCandidate:(id)a3 secureCandidateHeight:(double)a4
{
  id v7 = a3;
  [v7 secureCandidateWidth];
  -[_UITextOption setSecureCandidateSize:](self, "setSecureCandidateSize:", v6 + 4.0, a4 + 4.0);
  [(_UITextOption *)self setSourceCandidate:v7];
}

- (void)updateText:(id)a3 type:(int64_t)a4
{
  id v31 = a3;
  objc_storeStrong((id *)&self->_textChoice, a3);
  if (self->_type == a4)
  {
    [(_UITextOption *)self updateContentView];
  }
  else
  {
    self->_type = a4;
    BOOL v7 = (unint64_t)(a4 - 2) < 6 && ((0x37u >> (a4 - 2)) & 1) != 0 || [(_UITextOption *)self type] == 8;
    symbolImageView = self->_symbolImageView;
    if (symbolImageView)
    {
      [(UIView *)symbolImageView removeFromSuperview];
      double v9 = self->_symbolImageView;
      self->_symbolImageView = 0;

      if (self->_accessorySymbolSpacingGuide)
      {
        [(UIView *)self removeLayoutGuide:"removeLayoutGuide:"];
        accessorySymbolSpacingGuide = self->_accessorySymbolSpacingGuide;
        self->_accessorySymbolSpacingGuide = 0;
      }
    }
    [(_UITextOption *)self updateContentView];
    if (v7)
    {
      if ((unint64_t)a4 > 7 || (double v11 = 1.0, ((1 << a4) & 0xC4) == 0))
      {
        int64_t v12 = [(_UITextOption *)self type];
        double v11 = 0.0;
        if (v12 == 8) {
          double v11 = 1.0;
        }
      }
      [(_UITextOption *)self contentInsetsForType:a4 dividerWidth:v11];
      double v14 = v13;
      double v16 = v15;
      double v18 = v17;
      double v20 = v19;
      v21 = [(_UITextOption *)self insetConstraints];
      uint64_t v22 = [v21 count];

      if (v22 == 8)
      {
        double v23 = [(_UITextOption *)self insetConstraints];
        double v24 = [v23 objectAtIndexedSubscript:0];
        [v24 setConstant:v14];

        v25 = [(_UITextOption *)self insetConstraints];
        uint64_t v26 = [v25 objectAtIndexedSubscript:1];
        [v26 setConstant:v16];

        v27 = [(_UITextOption *)self insetConstraints];
        v28 = [v27 objectAtIndexedSubscript:2];
        [v28 setConstant:v18];

        v29 = [(_UITextOption *)self insetConstraints];
        v30 = [v29 objectAtIndexedSubscript:3];
        [v30 setConstant:v20];
      }
    }
  }
  [(UIView *)self invalidateIntrinsicContentSize];
}

- (id)textToUse
{
  if ([(_UITextOption *)self type] == 6
    || [(_UITextOption *)self type] == 2
    || [(_UITextOption *)self type] == 3
    || [(_UITextOption *)self type] == 4
    || [(_UITextOption *)self type] == 7
    || [(_UITextOption *)self type] == 8)
  {
    id v3 = self->_textChoice;
  }
  else if ([(_UITextOption *)self type] == 1)
  {
    id v3 = @"autocorrection.revert";
  }
  else if ([(_UITextOption *)self type])
  {
    id v3 = 0;
  }
  else
  {
    id v3 = @"autocorrection.cancel";
  }
  return v3;
}

- (CGSize)intrinsicContentSize
{
  if ([(_UITextOption *)self type] == 6)
  {
    [(_UITextOption *)self secureCandidateSize];
    double v4 = v3;
    double v6 = v5;
  }
  else if ([(_UITextOption *)self type] == 2 {
         || [(_UITextOption *)self type] == 3
  }
         || [(_UITextOption *)self type] == 4
         || [(_UITextOption *)self type] == 7)
  {
    [(UILabel *)self->_contentsLabel intrinsicContentSize];
    double v4 = v7;
    double v6 = v8;
    if ([(_UITextOption *)self type] == 2)
    {
      double v9 = 32.0;
    }
    else
    {
      int64_t v10 = [(_UITextOption *)self type];
      double v9 = 32.0;
      if (v10 != 4) {
        double v9 = 27.0;
      }
    }
    if (v6 < v9) {
      double v6 = v9;
    }
  }
  else
  {
    double v6 = 27.0;
    double v4 = -1.0;
  }
  [(_UITextOption *)self horizontalPadding];
  double v12 = v4 + v11;
  double v13 = v6;
  result.height = v13;
  result.width = v12;
  return result;
}

- (id)fontForLabel
{
  v2 = [(UIView *)self traitCollection];
  double v3 = [off_1E52D39B8 preferredFontForTextStyle:@"UICTFontTextStyleCallout" compatibleWithTraitCollection:v2];

  return v3;
}

- (id)textColor
{
  return +[UIColor labelColor];
}

+ (double)baseSymbolSize
{
  if (qword_1EB25E740 != -1) {
    dispatch_once(&qword_1EB25E740, &__block_literal_global_443);
  }
  v2 = [(id)UIApp preferredContentSizeCategory];
  double v3 = [(id)qword_1EB25E738 objectForKeyedSubscript:v2];
  [v3 floatValue];
  double v5 = v4 + 22.0;

  return v5;
}

- (id)buttonImage
{
  if ([(_UITextOption *)self type] == 5)
  {
    [(id)objc_opt_class() baseSymbolSize];
    double v3 = +[UIImageSymbolConfiguration configurationWithPointSize:weight:scale:](UIImageSymbolConfiguration, "configurationWithPointSize:weight:scale:", 6, -1);
    float v4 = [(_UITextOption *)self imageName];
    double v5 = +[UIImage systemImageNamed:v4 withConfiguration:v3];
    double v6 = [v5 imageWithRenderingMode:1];
  }
  else
  {
    double v3 = +[UIImageSymbolConfiguration configurationWithPointSize:7 weight:-1 scale:10.0];
    double v7 = [(UIView *)self traitCollection];
    double v8 = [v7 preferredContentSizeCategory];
    NSComparisonResult v9 = UIContentSizeCategoryCompareToCategory(v8, &cfstr_Uictcontentsiz_5.isa);

    if (v9 == NSOrderedDescending)
    {
      int64_t v10 = +[UIImageSymbolConfiguration configurationWithTextStyle:@"UICTFontTextStyleEmphasizedCaption2" scale:-1];

      double v11 = +[UIImageSymbolConfiguration configurationWithWeight:7];
      double v3 = [v10 configurationByApplyingConfiguration:v11];
    }
    float v4 = [(_UITextOption *)self imageName];
    double v6 = +[UIImage systemImageNamed:v4 withConfiguration:v3];
  }

  return v6;
}

- (id)imageName
{
  unint64_t v3 = [(_UITextOption *)self type];
  if (v3 < 2 || v3 == 5)
  {
    float v4 = self->_textChoice;
  }
  else if (v3 == 4)
  {
    float v4 = @"arrow.uturn.backward";
  }
  else
  {
    float v4 = 0;
  }
  return v4;
}

- (BOOL)selectionVisibilityForState:(unint64_t)a3
{
  return a3 == 4;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
  uint64_t v4 = -[_UITextOption selectionVisibilityForState:](self, "selectionVisibilityForState:") ^ 1;
  selectionVibrancyView = self->_selectionVibrancyView;
  [(UIView *)selectionVibrancyView setHidden:v4];
}

- (unint64_t)state
{
  return self->_state;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (NSString)originalText
{
  return self->_originalText;
}

- (void)setOriginalText:(id)a3
{
  self->_originalText = (NSString *)a3;
}

- (UIColor)optionalTintColor
{
  return self->_optionalTintColor;
}

- (void)setOptionalTintColor:(id)a3
{
  self->_optionalTintColor = (UIColor *)a3;
}

- (TIKeyboardCandidate)sourceCandidate
{
  return self->_sourceCandidate;
}

- (void)setSourceCandidate:(id)a3
{
}

- (CGSize)secureCandidateSize
{
  double width = self->_secureCandidateSize.width;
  double height = self->_secureCandidateSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setSecureCandidateSize:(CGSize)a3
{
  self->_secureCandidateSize = a3;
}

- (NSString)textChoice
{
  return self->_textChoice;
}

- (void)setTextChoice:(id)a3
{
}

- (UILabel)contentsLabel
{
  return self->_contentsLabel;
}

- (void)setContentsLabel:(id)a3
{
}

- (UIImageView)symbolImageView
{
  return self->_symbolImageView;
}

- (void)setSymbolImageView:(id)a3
{
}

- (UIView)lineView
{
  return self->_lineView;
}

- (void)setLineView:(id)a3
{
}

- (UIView)secureCandidateLabel
{
  return self->_secureCandidateLabel;
}

- (void)setSecureCandidateLabel:(id)a3
{
}

- (UIVisualEffectView)selectionVibrancyView
{
  return self->_selectionVibrancyView;
}

- (void)setSelectionVibrancyView:(id)a3
{
}

- (UIVisualEffectView)contentsLabelEffectView
{
  return self->_contentsLabelEffectView;
}

- (void)setContentsLabelEffectView:(id)a3
{
}

- (double)horizontalPadding
{
  return self->_horizontalPadding;
}

- (void)setHorizontalPadding:(double)a3
{
  self->_horizontalPadding = a3;
}

- (NSArray)insetConstraints
{
  return self->_insetConstraints;
}

- (void)setInsetConstraints:(id)a3
{
}

- (NSLayoutConstraint)minimumLabelWidth
{
  return self->_minimumLabelWidth;
}

- (void)setMinimumLabelWidth:(id)a3
{
}

- (UILayoutGuide)accessorySymbolSpacingGuide
{
  return self->_accessorySymbolSpacingGuide;
}

- (void)setAccessorySymbolSpacingGuide:(id)a3
{
}

- (NSDirectionalEdgeInsets)currentEdgeInsets
{
  double top = self->_currentEdgeInsets.top;
  double leading = self->_currentEdgeInsets.leading;
  double bottom = self->_currentEdgeInsets.bottom;
  double trailing = self->_currentEdgeInsets.trailing;
  result.double trailing = trailing;
  result.double bottom = bottom;
  result.double leading = leading;
  result.double top = top;
  return result;
}

- (void)setCurrentEdgeInsets:(NSDirectionalEdgeInsets)a3
{
  self->_currentEdgeInsets = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessorySymbolSpacingGuide, 0);
  objc_storeStrong((id *)&self->_minimumLabelWidth, 0);
  objc_storeStrong((id *)&self->_insetConstraints, 0);
  objc_storeStrong((id *)&self->_contentsLabelEffectView, 0);
  objc_storeStrong((id *)&self->_selectionVibrancyView, 0);
  objc_storeStrong((id *)&self->_secureCandidateLabel, 0);
  objc_storeStrong((id *)&self->_lineView, 0);
  objc_storeStrong((id *)&self->_symbolImageView, 0);
  objc_storeStrong((id *)&self->_contentsLabel, 0);
  objc_storeStrong((id *)&self->_textChoice, 0);
  objc_storeStrong((id *)&self->_sourceCandidate, 0);
}

@end