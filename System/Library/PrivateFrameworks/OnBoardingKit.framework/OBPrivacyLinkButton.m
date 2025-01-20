@interface OBPrivacyLinkButton
- (BOOL)_isButtonAboveCaptionText;
- (BOOL)largeIcon;
- (BOOL)underlineLinks;
- (CGSize)contentSize;
- (CGSize)intrinsicContentSize;
- (NSString)buttonText;
- (NSString)captionText;
- (NSString)displayLanguage;
- (OBPrivacyLinkButton)initWithCaption:(id)a3 buttonText:(id)a4 image:(id)a5 imageSize:(CGSize)a6 useLargeIcon:(BOOL)a7 displayLanguage:(id)a8;
- (UIImageView)iconView;
- (UILabel)buttonLabel;
- (UITextView)textView;
- (UIView)containerView;
- (_NSRange)_rangeForButtonText;
- (id)_font;
- (id)buttonAttributes;
- (id)labelText;
- (id)titleForState:(unint64_t)a3;
- (id)viewForLastBaselineLayout;
- (void)_updateButtonColorWithColor:(id)a3;
- (void)layoutSubviews;
- (void)setContentSize:(CGSize)a3;
- (void)setDisplayLanguage:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setLargeIcon:(BOOL)a3;
- (void)setUnderlineLinks:(BOOL)a3;
- (void)tintColorDidChange;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation OBPrivacyLinkButton

- (OBPrivacyLinkButton)initWithCaption:(id)a3 buttonText:(id)a4 image:(id)a5 imageSize:(CGSize)a6 useLargeIcon:(BOOL)a7 displayLanguage:(id)a8
{
  BOOL v9 = a7;
  v237[6] = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a8;
  v225.receiver = self;
  v225.super_class = (Class)OBPrivacyLinkButton;
  v18 = [(OBPrivacyLinkButton *)&v225 init];
  v19 = v18;
  if (v18)
  {
    if (v9) {
      double v20 = 24.0;
    }
    else {
      double v20 = 15.0;
    }
    if (v9) {
      double v21 = 16.0;
    }
    else {
      double v21 = 6.0;
    }
    [(OBPrivacyLinkButton *)v18 setIsAccessibilityElement:0];
    v19->_largeIcon = v9;
    objc_storeStrong((id *)&v19->_captionText, a3);
    if (v14)
    {
      v22 = [v15 stringByReplacingOccurrencesOfString:@" " withString:@" "];
    }
    else
    {
      v22 = v15;
    }
    BOOL v212 = v9;
    id v203 = v17;
    id v204 = v15;
    id v213 = v16;
    objc_storeStrong((id *)&v19->_buttonText, v22);
    id v205 = v14;
    if (v14) {

    }
    objc_storeStrong((id *)&v19->_displayLanguage, a8);
    v23 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    containerView = v19->_containerView;
    v19->_containerView = v23;

    [(UIView *)v19->_containerView setIsAccessibilityElement:0];
    [(UIView *)v19->_containerView setUserInteractionEnabled:0];
    [(UIView *)v19->_containerView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(OBPrivacyLinkButton *)v19 addSubview:v19->_containerView];
    v187 = (void *)MEMORY[0x1E4F28DC8];
    v215 = [(UIView *)v19->_containerView centerXAnchor];
    v214 = [(OBPrivacyLinkButton *)v19 centerXAnchor];
    v208 = [v215 constraintEqualToAnchor:v214];
    v237[0] = v208;
    v206 = [(UIView *)v19->_containerView centerYAnchor];
    v199 = [(OBPrivacyLinkButton *)v19 centerYAnchor];
    v195 = [v206 constraintEqualToAnchor:v199];
    v237[1] = v195;
    v191 = [(UIView *)v19->_containerView bottomAnchor];
    v183 = [(OBPrivacyLinkButton *)v19 bottomAnchor];
    v179 = [v191 constraintLessThanOrEqualToAnchor:v183];
    v237[2] = v179;
    v175 = [(UIView *)v19->_containerView topAnchor];
    v171 = [(OBPrivacyLinkButton *)v19 topAnchor];
    v25 = [v175 constraintGreaterThanOrEqualToAnchor:v171];
    v237[3] = v25;
    v26 = [(UIView *)v19->_containerView leftAnchor];
    v27 = [(OBPrivacyLinkButton *)v19 leftAnchor];
    v28 = [v26 constraintGreaterThanOrEqualToAnchor:v27];
    v237[4] = v28;
    v29 = [(UIView *)v19->_containerView rightAnchor];
    v30 = [(OBPrivacyLinkButton *)v19 rightAnchor];
    v31 = [v29 constraintLessThanOrEqualToAnchor:v30];
    v237[5] = v31;
    v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:v237 count:6];
    [v187 activateConstraints:v32];

    LODWORD(v33) = 1148846080;
    [(UIView *)v19->_containerView setContentHuggingPriority:0 forAxis:v33];
    LODWORD(v34) = 1148846080;
    [(UIView *)v19->_containerView setContentHuggingPriority:1 forAxis:v34];
    v216 = [(UIView *)v19->_containerView bottomAnchor];
    v209 = [(OBPrivacyLinkButton *)v19 bottomAnchor];
    v207 = [v216 constraintEqualToAnchor:v209];
    v236[0] = v207;
    v35 = [(UIView *)v19->_containerView topAnchor];
    v36 = [(OBPrivacyLinkButton *)v19 topAnchor];
    v37 = [v35 constraintEqualToAnchor:v36];
    v236[1] = v37;
    v38 = [(UIView *)v19->_containerView leftAnchor];
    v39 = [(OBPrivacyLinkButton *)v19 leftAnchor];
    v40 = [v38 constraintEqualToAnchor:v39];
    v236[2] = v40;
    v41 = [(UIView *)v19->_containerView rightAnchor];
    v42 = [(OBPrivacyLinkButton *)v19 rightAnchor];
    v43 = [v41 constraintEqualToAnchor:v42];
    v236[3] = v43;
    v200 = [MEMORY[0x1E4F1C978] arrayWithObjects:v236 count:4];

    long long v223 = 0u;
    long long v224 = 0u;
    long long v221 = 0u;
    long long v222 = 0u;
    id v44 = v200;
    uint64_t v45 = [v44 countByEnumeratingWithState:&v221 objects:v235 count:16];
    if (v45)
    {
      uint64_t v47 = v45;
      uint64_t v48 = *(void *)v222;
      do
      {
        for (uint64_t i = 0; i != v47; ++i)
        {
          if (*(void *)v222 != v48) {
            objc_enumerationMutation(v44);
          }
          v50 = *(void **)(*((void *)&v221 + 1) + 8 * i);
          LODWORD(v46) = 1144750080;
          [v50 setPriority:v46];
          [v50 setActive:1];
        }
        uint64_t v47 = [v44 countByEnumeratingWithState:&v221 objects:v235 count:16];
      }
      while (v47);
    }

    v51 = [(UIView *)v19->_containerView topAnchor];
    v52 = [(OBPrivacyLinkButton *)v19 topAnchor];
    v53 = [v51 constraintEqualToAnchor:v52];
    v234[0] = v53;
    v54 = [(UIView *)v19->_containerView bottomAnchor];
    v55 = [(OBPrivacyLinkButton *)v19 bottomAnchor];
    v56 = [v54 constraintEqualToAnchor:v55];
    v234[1] = v56;
    v57 = [MEMORY[0x1E4F1C978] arrayWithObjects:v234 count:2];

    long long v219 = 0u;
    long long v220 = 0u;
    long long v217 = 0u;
    long long v218 = 0u;
    id v58 = v57;
    uint64_t v59 = [v58 countByEnumeratingWithState:&v217 objects:v233 count:16];
    if (v59)
    {
      uint64_t v61 = v59;
      uint64_t v62 = *(void *)v218;
      do
      {
        for (uint64_t j = 0; j != v61; ++j)
        {
          if (*(void *)v218 != v62) {
            objc_enumerationMutation(v58);
          }
          v64 = *(void **)(*((void *)&v217 + 1) + 8 * j);
          LODWORD(v60) = 1144750080;
          [v64 setPriority:v60];
          [v64 setActive:1];
        }
        uint64_t v61 = [v58 countByEnumeratingWithState:&v217 objects:v233 count:16];
      }
      while (v61);
    }

    v65 = (UITextView *)objc_alloc_init(MEMORY[0x1E4FB1DD8]);
    textView = v19->_textView;
    v19->_textView = v65;

    v67 = v19->_textView;
    v68 = [(OBPrivacyLinkButton *)v19 labelText];
    [(UITextView *)v67 setAttributedText:v68];

    v69 = v19->_textView;
    v70 = [(OBPrivacyLinkButton *)v19 _font];
    [(UITextView *)v69 setFont:v70];

    [(UITextView *)v19->_textView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UITextView *)v19->_textView setTextAlignment:1];
    -[UITextView setTextContainerInset:](v19->_textView, "setTextContainerInset:", *MEMORY[0x1E4FB2848], *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 16), *(double *)(MEMORY[0x1E4FB2848] + 24));
    v71 = [(UITextView *)v19->_textView textContainer];
    [v71 setLineFragmentPadding:0.0];

    [(UITextView *)v19->_textView setEditable:0];
    [(UITextView *)v19->_textView setSelectable:0];
    [(UITextView *)v19->_textView setScrollEnabled:0];
    [(UITextView *)v19->_textView setUserInteractionEnabled:0];
    v72 = v19->_textView;
    v73 = [MEMORY[0x1E4FB1618] clearColor];
    [(UITextView *)v72 setBackgroundColor:v73];

    [(UIView *)v19->_containerView addSubview:v19->_textView];
    if ([(OBPrivacyLinkButton *)v19 _isButtonAboveCaptionText])
    {
      id v74 = objc_alloc(MEMORY[0x1E4FB1930]);
      uint64_t v75 = objc_msgSend(v74, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      buttonLabel = v19->_buttonLabel;
      v19->_buttonLabel = (UILabel *)v75;

      v77 = [(OBPrivacyLinkButton *)v19 _font];
      [(UILabel *)v19->_buttonLabel setFont:v77];

      [(UILabel *)v19->_buttonLabel setTranslatesAutoresizingMaskIntoConstraints:0];
      [(UILabel *)v19->_buttonLabel setUserInteractionEnabled:0];
      [(UILabel *)v19->_buttonLabel setLineBreakMode:0];
      [(UILabel *)v19->_buttonLabel setText:v19->_buttonText];
      [(UILabel *)v19->_buttonLabel setNumberOfLines:0];
      LODWORD(v78) = 1148846080;
      [(UILabel *)v19->_buttonLabel setContentCompressionResistancePriority:0 forAxis:v78];
      LODWORD(v79) = 1148846080;
      [(UILabel *)v19->_buttonLabel setContentCompressionResistancePriority:1 forAxis:v79];
    }
    v80 = [(OBPrivacyLinkButton *)v19 tintColor];
    [(OBPrivacyLinkButton *)v19 _updateButtonColorWithColor:v80];

    v210 = (void *)MEMORY[0x1E4F28DC8];
    v81 = [(UITextView *)v19->_textView bottomAnchor];
    v82 = [(UIView *)v19->_containerView bottomAnchor];
    v83 = [v81 constraintEqualToAnchor:v82];
    v232[0] = v83;
    v84 = [(UITextView *)v19->_textView trailingAnchor];
    v85 = [(UIView *)v19->_containerView trailingAnchor];
    v86 = [v84 constraintLessThanOrEqualToAnchor:v85];
    v232[1] = v86;
    v87 = [MEMORY[0x1E4F1C978] arrayWithObjects:v232 count:2];
    [v210 activateConstraints:v87];

    v88 = [OBTintInheritingImageView alloc];
    v89 = [(OBPrivacyLinkButton *)v19 tintColor];
    uint64_t v90 = [(OBTintInheritingImageView *)v88 initWithImage:v213 highlightedImage:0 tintColor:v89];
    iconView = v19->_iconView;
    v19->_iconView = (UIImageView *)v90;

    [(UIImageView *)v19->_iconView setContentMode:1];
    v92 = [(OBPrivacyLinkButton *)v19 _iconTintColor];
    [(UIImageView *)v19->_iconView setTintColor:v92];

    [(UIImageView *)v19->_iconView setTranslatesAutoresizingMaskIntoConstraints:0];
    if (v19->_buttonLabel)
    {
      id v93 = objc_alloc(MEMORY[0x1E4FB1C60]);
      v231[0] = v19->_iconView;
      v231[1] = v19->_buttonLabel;
      v94 = [MEMORY[0x1E4F1C978] arrayWithObjects:v231 count:2];
      v95 = (UIImageView *)[v93 initWithArrangedSubviews:v94];

      [(UIImageView *)v95 setAxis:0];
      [(UIImageView *)v95 setSpacing:v21];
      [(UIImageView *)v95 setAlignment:3];
      [(UIImageView *)v95 setTranslatesAutoresizingMaskIntoConstraints:0];
      v211 = v95;
    }
    else
    {
      v211 = 0;
      v95 = v19->_iconView;
    }
    [(UIView *)v19->_containerView addSubview:v95];
    v96 = v19->_iconView;
    if (v213)
    {
      v97 = [(UIImageView *)v96 heightAnchor];
      v98 = [v97 constraintEqualToConstant:v20];
      [v98 setActive:1];

      v99 = [(UIImageView *)v19->_iconView widthAnchor];
      v100 = [(UIImageView *)v19->_iconView image];
      [v100 size];
      double v102 = v20 * v101;
      v103 = [(UIImageView *)v19->_iconView image];
      [v103 size];
      v105 = [v99 constraintEqualToConstant:v102 / v104];
      [v105 setActive:1];
    }
    else
    {
      v106 = [(UIImageView *)v96 widthAnchor];
      v107 = [v106 constraintEqualToConstant:0.0];
      [v107 setActive:1];

      v99 = [(UIImageView *)v19->_iconView heightAnchor];
      v100 = [v99 constraintEqualToConstant:0.0];
      [v100 setActive:1];
    }

    LODWORD(v108) = 1148846080;
    [(UIImageView *)v19->_iconView setContentHuggingPriority:1 forAxis:v108];
    LODWORD(v109) = 1148846080;
    [(UIImageView *)v19->_iconView setContentHuggingPriority:0 forAxis:v109];
    if (v212)
    {
      v176 = (void *)MEMORY[0x1E4F28DC8];
      v201 = [(UIImageView *)v19->_iconView topAnchor];
      v196 = [(UIView *)v19->_containerView topAnchor];
      v192 = [v201 constraintEqualToAnchor:v196];
      v230[0] = v192;
      v188 = [(UIImageView *)v19->_iconView centerXAnchor];
      v184 = [(UIView *)v19->_containerView centerXAnchor];
      v180 = [v188 constraintEqualToAnchor:v184];
      v230[1] = v180;
      v172 = [(UIImageView *)v19->_iconView bottomAnchor];
      v168 = [(UITextView *)v19->_textView topAnchor];
      v166 = [v172 constraintLessThanOrEqualToAnchor:v168];
      v230[2] = v166;
      v163 = [(UITextView *)v19->_textView leadingAnchor];
      v110 = [(UIView *)v19->_containerView leadingAnchor];
      v111 = [v163 constraintGreaterThanOrEqualToAnchor:v110];
      v230[3] = v111;
      v112 = [(UITextView *)v19->_textView centerXAnchor];
      v113 = [(UIImageView *)v19->_iconView centerXAnchor];
      v114 = [v112 constraintEqualToAnchor:v113];
      v230[4] = v114;
      v115 = [MEMORY[0x1E4F1C978] arrayWithObjects:v230 count:5];
      [v176 activateConstraints:v115];

      v116 = [(UIImageView *)v19->_iconView bottomAnchor];
      v117 = [(UITextView *)v19->_textView firstBaselineAnchor];
      id v16 = v213;
      double v118 = -16.0;
      if (!v213) {
        double v118 = 0.0;
      }
      v119 = [v116 constraintEqualToAnchor:v117 constant:v118];

      LODWORD(v120) = 1144750080;
      [v119 setPriority:v120];
      [v119 setActive:1];
    }
    else
    {
      v202 = (void *)MEMORY[0x1E4F28DC8];
      if (v19->_buttonLabel)
      {
        v197 = [(UIImageView *)v211 topAnchor];
        v193 = [(UIView *)v19->_containerView topAnchor];
        v189 = [v197 constraintEqualToAnchor:v193];
        v229[0] = v189;
        v185 = [(UIImageView *)v211 leadingAnchor];
        v181 = [(UIView *)v19->_containerView leadingAnchor];
        v177 = [v185 constraintGreaterThanOrEqualToAnchor:v181];
        v229[1] = v177;
        v173 = [(UIImageView *)v211 trailingAnchor];
        v169 = [(UIView *)v19->_containerView trailingAnchor];
        v167 = [v173 constraintLessThanOrEqualToAnchor:v169];
        v229[2] = v167;
        v164 = [(UIImageView *)v211 centerXAnchor];
        v161 = [(UIView *)v19->_containerView centerXAnchor];
        v159 = [v164 constraintEqualToAnchor:v161];
        v229[3] = v159;
        v157 = [(UIImageView *)v211 bottomAnchor];
        v156 = [(UITextView *)v19->_textView topAnchor];
        v155 = [v157 constraintEqualToAnchor:v156];
        v229[4] = v155;
        v154 = [(UITextView *)v19->_textView bottomAnchor];
        v153 = [(UIView *)v19->_containerView bottomAnchor];
        v152 = [v154 constraintEqualToAnchor:v153];
        v229[5] = v152;
        v121 = [(UITextView *)v19->_textView leadingAnchor];
        v122 = [(UIView *)v19->_containerView leadingAnchor];
        v123 = [v121 constraintEqualToAnchor:v122];
        v229[6] = v123;
        v124 = [(UITextView *)v19->_textView trailingAnchor];
        v125 = [(UIView *)v19->_containerView trailingAnchor];
        v126 = [v124 constraintEqualToAnchor:v125];
        v229[7] = v126;
        v127 = [MEMORY[0x1E4F1C978] arrayWithObjects:v229 count:8];
        [v202 activateConstraints:v127];
      }
      else
      {
        v198 = [(UIImageView *)v19->_iconView leadingAnchor];
        v194 = [(UIView *)v19->_containerView leadingAnchor];
        v190 = [v198 constraintEqualToAnchor:v194];
        v228[0] = v190;
        v129 = [(UIImageView *)v19->_iconView trailingAnchor];
        v186 = v129;
        uint64_t v130 = [(UITextView *)v19->_textView leadingAnchor];
        v182 = (void *)v130;
        double v131 = -6.0;
        if (!v213) {
          double v131 = 0.0;
        }
        v178 = [v129 constraintEqualToAnchor:v130 constant:v131];
        v228[1] = v178;
        v174 = [(UIImageView *)v19->_iconView centerYAnchor];
        v170 = [(UITextView *)v19->_textView centerYAnchor];
        v165 = [v174 constraintEqualToAnchor:v170];
        v228[2] = v165;
        v162 = [(UITextView *)v19->_textView centerYAnchor];
        v160 = [(UIView *)v19->_containerView centerYAnchor];
        v158 = [v162 constraintEqualToAnchor:v160];
        v228[3] = v158;
        v132 = [(UITextView *)v19->_textView topAnchor];
        v133 = [(UIView *)v19->_containerView topAnchor];
        v134 = [v132 constraintGreaterThanOrEqualToAnchor:v133];
        v228[4] = v134;
        v135 = [(UITextView *)v19->_textView bottomAnchor];
        v136 = [(UIView *)v19->_containerView bottomAnchor];
        v137 = [v135 constraintLessThanOrEqualToAnchor:v136];
        v228[5] = v137;
        v138 = [MEMORY[0x1E4F1C978] arrayWithObjects:v228 count:6];
        [v202 activateConstraints:v138];

        if (![(NSString *)v19->_captionText length])
        {
          v139 = [(UITextView *)v19->_textView trailingAnchor];
          v140 = [(UIView *)v19->_containerView trailingAnchor];
          v141 = [v139 constraintEqualToAnchor:v140];
          [v141 setActive:1];

          LODWORD(v142) = 1148846080;
          [(UITextView *)v19->_textView setContentHuggingPriority:0 forAxis:v142];
        }
      }
      LODWORD(v128) = 1148846080;
      [(UITextView *)v19->_textView setContentHuggingPriority:1 forAxis:v128];
      id v16 = v213;
    }
    id v17 = v203;
    if (!v16)
    {
      v143 = [(UITextView *)v19->_textView centerXAnchor];
      v144 = [(UIView *)v19->_containerView centerXAnchor];
      v145 = [v143 constraintEqualToAnchor:v144];
      [v145 setActive:1];
    }
    v146 = v19->_buttonLabel;
    if (v146)
    {
      v227[0] = v19->_iconView;
      v227[1] = v146;
      v227[2] = v19->_textView;
      v147 = (void *)MEMORY[0x1E4F1C978];
      v148 = v227;
      uint64_t v149 = 3;
    }
    else
    {
      v226[0] = v19->_iconView;
      v226[1] = v19->_textView;
      v147 = (void *)MEMORY[0x1E4F1C978];
      v148 = v226;
      uint64_t v149 = 2;
    }
    v150 = [v147 arrayWithObjects:v148 count:v149];
    [(OBPrivacyLinkButton *)v19 setAccessibilityElements:v150];

    id v15 = v204;
    id v14 = v205;
  }

  return v19;
}

- (void)layoutSubviews
{
  v35[1] = *MEMORY[0x1E4F143B8];
  v33.receiver = self;
  v33.super_class = (Class)OBPrivacyLinkButton;
  [(OBPrivacyLinkButton *)&v33 layoutSubviews];
  if (self->_buttonLabel
    && [(NSString *)self->_captionText length]
    && [(NSString *)self->_buttonText length]
    && [(NSString *)self->_buttonText containsString:@" "])
  {
    uint64_t v34 = *MEMORY[0x1E4FB06F8];
    v3 = [(OBPrivacyLinkButton *)self _font];
    v35[0] = v3;
    v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:&v34 count:1];

    v5 = [(UITextView *)self->_textView text];
    [(UITextView *)self->_textView frame];
    objc_msgSend(v5, "boundingRectWithSize:options:attributes:context:", 1, v4, 0, v6, 1.79769313e308);
    double v8 = v7;

    captionText = self->_captionText;
    [(UITextView *)self->_textView frame];
    -[NSString boundingRectWithSize:options:attributes:context:](captionText, "boundingRectWithSize:options:attributes:context:", 1, v4, 0, v10, 1.79769313e308);
    double v12 = v11;
    v13 = [(OBPrivacyLinkButton *)self _font];
    [v13 lineHeight];
    double v15 = v8 / v14;

    id v16 = [(OBPrivacyLinkButton *)self _font];
    [v16 lineHeight];
    double v18 = v12 / v17;

    if (round(v15 - v18) >= 2.0)
    {
      v19 = [(NSString *)self->_buttonText stringByReplacingOccurrencesOfString:@" " withString:@" "];
      buttonText = self->_buttonText;
      self->_buttonText = v19;

      textView = self->_textView;
      v22 = [(OBPrivacyLinkButton *)self labelText];
      [(UITextView *)textView setAttributedText:v22];

      v23 = self->_textView;
      v24 = [(OBPrivacyLinkButton *)self _font];
      [(UITextView *)v23 setFont:v24];

      v25 = [(OBPrivacyLinkButton *)self tintColor];
      [(OBPrivacyLinkButton *)self _updateButtonColorWithColor:v25];

      [(OBPrivacyLinkButton *)self setNeedsLayout];
    }
  }
  [(OBPrivacyLinkButton *)self contentSize];
  double v27 = v26;
  double v29 = v28;
  [(OBPrivacyLinkButton *)self intrinsicContentSize];
  if (v27 != v31 || v29 != v30)
  {
    [(OBPrivacyLinkButton *)self intrinsicContentSize];
    -[OBPrivacyLinkButton setContentSize:](self, "setContentSize:");
    [(OBPrivacyLinkButton *)self invalidateIntrinsicContentSize];
  }
}

- (void)tintColorDidChange
{
  v6.receiver = self;
  v6.super_class = (Class)OBPrivacyLinkButton;
  [(OBPrivacyLinkButton *)&v6 tintColorDidChange];
  v3 = [(OBPrivacyLinkButton *)self tintColor];

  if (v3)
  {
    v4 = [(OBPrivacyLinkButton *)self tintColor];
    [(OBPrivacyLinkButton *)self _updateButtonColorWithColor:v4];
  }
  v5 = [(OBPrivacyLinkButton *)self _iconTintColor];
  [(UIImageView *)self->_iconView setTintColor:v5];
}

- (CGSize)intrinsicContentSize
{
  v3 = [(OBPrivacyLinkButton *)self textView];
  [(OBPrivacyLinkButton *)self frame];
  double v5 = v4;
  LODWORD(v4) = 1112014848;
  LODWORD(v6) = 1132068864;
  objc_msgSend(v3, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", v5, 0.0, v4, v6);
  double v8 = v7;

  if ([(OBPrivacyLinkButton *)self largeIcon]
    && ([(UIImageView *)self->_iconView image],
        BOOL v9 = objc_claimAutoreleasedReturnValue(),
        v9,
        v9))
  {
    [(OBPrivacyLinkButton *)self frame];
    double v11 = v10;
    double v8 = v8 + 16.0 + 24.0;
  }
  else
  {
    [(OBPrivacyLinkButton *)self frame];
    double v11 = v12;
  }
  double v13 = v8;
  result.height = v13;
  result.width = v11;
  return result;
}

- (void)_updateButtonColorWithColor:(id)a3
{
  id v4 = a3;
  buttonLabel = self->_buttonLabel;
  id v15 = v4;
  if (buttonLabel || (buttonLabel = self->_textView, !self->_captionText))
  {
    [buttonLabel setTextColor:v4];
  }
  else
  {
    double v6 = [buttonLabel attributedText];
    double v7 = (void *)[v6 mutableCopy];

    uint64_t v8 = *MEMORY[0x1E4FB0700];
    uint64_t v9 = [(OBPrivacyLinkButton *)self _rangeForButtonText];
    objc_msgSend(v7, "addAttribute:value:range:", v8, v15, v9, v10);
    BOOL v11 = [(OBPrivacyLinkButton *)self underlineLinks];
    uint64_t v12 = *MEMORY[0x1E4FB0808];
    uint64_t v14 = [(OBPrivacyLinkButton *)self _rangeForButtonText];
    if (v11) {
      objc_msgSend(v7, "addAttribute:value:range:", v12, &unk_1EEC379B8, v14, v13);
    }
    else {
      objc_msgSend(v7, "removeAttribute:range:", v12, v14, v13);
    }
    [(UITextView *)self->_textView setAttributedText:v7];
  }
}

- (id)titleForState:(unint64_t)a3
{
  return [(UITextView *)self->_textView text];
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)OBPrivacyLinkButton;
  -[OBPrivacyLinkButton setEnabled:](&v6, sel_setEnabled_);
  if (v3)
  {
    [(OBPrivacyLinkButton *)self setTintColor:0];
  }
  else
  {
    double v5 = [MEMORY[0x1E4FB1618] grayColor];
    [(OBPrivacyLinkButton *)self setTintColor:v5];
  }
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)OBPrivacyLinkButton;
  if ([(OBPrivacyLinkButton *)&v9 isHighlighted] != a3)
  {
    v8.receiver = self;
    v8.super_class = (Class)OBPrivacyLinkButton;
    [(OBPrivacyLinkButton *)&v8 setHighlighted:v3];
    double v5 = 0.25;
    if (v3) {
      double v5 = 0.0;
    }
    double v6 = 0.3;
    v7[1] = 3221225472;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[2] = __38__OBPrivacyLinkButton_setHighlighted___block_invoke;
    v7[3] = &unk_1E58AEB30;
    if (!v3) {
      double v6 = 1.0;
    }
    v7[4] = self;
    *(double *)&v7[5] = v6;
    [MEMORY[0x1E4FB1EB0] animateWithDuration:v7 animations:v5];
  }
}

uint64_t __38__OBPrivacyLinkButton_setHighlighted___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:*(double *)(a1 + 40)];
}

- (id)viewForLastBaselineLayout
{
  return self->_textView;
}

- (_NSRange)_rangeForButtonText
{
  if (self->_buttonText)
  {
    BOOL v3 = [(UITextView *)self->_textView attributedText];
    id v4 = (void *)MEMORY[0x1E4F28B18];
    double v5 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@"%@"];
    double v6 = objc_msgSend(v4, "localizedAttributedStringWithFormat:", v5, self->_buttonText);

    uint64_t v7 = [v3 length];
    NSUInteger v8 = v7 - [v6 length];
    uint64_t v9 = [v6 length];
  }
  else
  {
    NSUInteger v8 = 0;
    uint64_t v9 = 0;
  }
  NSUInteger v10 = v8;
  NSUInteger v11 = v9;
  result.length = v11;
  result.location = v10;
  return result;
}

- (id)_font
{
  BOOL v3 = [(OBPrivacyLinkButton *)self iconView];
  id v4 = [v3 image];
  if (v4)
  {

    double v5 = (id *)MEMORY[0x1E4FB28E0];
  }
  else
  {
    double v6 = [(OBPrivacyLinkButton *)self captionText];

    double v5 = (id *)MEMORY[0x1E4FB28C8];
    if (v6) {
      double v5 = (id *)MEMORY[0x1E4FB28E0];
    }
  }
  uint64_t v7 = (void *)MEMORY[0x1E4FB08E0];
  id v8 = *v5;
  uint64_t v9 = [(OBPrivacyLinkButton *)self traitCollection];
  NSUInteger v10 = [v7 preferredFontForTextStyle:v8 compatibleWithTraitCollection:v9];

  return v10;
}

- (id)labelText
{
  v21[1] = *MEMORY[0x1E4F143B8];
  if (self->_captionText)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F28B18]);
    captionText = self->_captionText;
    uint64_t v20 = *MEMORY[0x1E4FB0700];
    double v5 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    v21[0] = v5;
    double v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];
    uint64_t v7 = (void *)[v3 initWithString:captionText attributes:v6];
  }
  else
  {
    uint64_t v7 = 0;
  }
  if (self->_buttonText && ![(OBPrivacyLinkButton *)self _isButtonAboveCaptionText])
  {
    id v8 = objc_alloc(MEMORY[0x1E4F28B18]);
    uint64_t v9 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    NSUInteger v10 = [(OBPrivacyLinkButton *)self displayLanguage];
    NSUInteger v11 = +[OBUtilities localizedString:@"BUTTON_CAPTION_BUTTON_TITLE_FORMAT_STRING" forTable:@"Localizable" inBundle:v9 forLanguage:v10];
    uint64_t v12 = (void *)[v8 initWithString:v11];

    id v13 = objc_alloc(MEMORY[0x1E4F28B18]);
    buttonText = self->_buttonText;
    id v15 = [(OBPrivacyLinkButton *)self buttonAttributes];
    id v16 = (void *)[v13 initWithString:buttonText attributes:v15];

    if ([v7 length])
    {
      objc_msgSend(MEMORY[0x1E4F28B18], "localizedAttributedStringWithFormat:", v12, v7, v16);
      id v17 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v17 = v16;
    }
    id v18 = v17;

    uint64_t v7 = v18;
  }
  return v7;
}

- (id)buttonAttributes
{
  v5[1] = *MEMORY[0x1E4F143B8];
  if (UIAccessibilityButtonShapesEnabled())
  {
    uint64_t v4 = *MEMORY[0x1E4FB0808];
    v5[0] = &unk_1EEC379B8;
    v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (void)traitCollectionDidChange:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)OBPrivacyLinkButton;
  [(OBPrivacyLinkButton *)&v8 traitCollectionDidChange:a3];
  textView = self->_textView;
  double v5 = [(OBPrivacyLinkButton *)self _font];
  [(UITextView *)textView setFont:v5];

  buttonLabel = self->_buttonLabel;
  uint64_t v7 = [(OBPrivacyLinkButton *)self _font];
  [(UILabel *)buttonLabel setFont:v7];
}

- (BOOL)_isButtonAboveCaptionText
{
  id v3 = [(UIImageView *)self->_iconView image];

  NSUInteger v4 = [(NSString *)self->_captionText length];
  if (v4) {
    LOBYTE(v4) = !self->_largeIcon && v3 != 0;
  }
  return v4;
}

- (void)setUnderlineLinks:(BOOL)a3
{
  self->_underlineLinks = a3;
  id v4 = [(OBPrivacyLinkButton *)self tintColor];
  [(OBPrivacyLinkButton *)self _updateButtonColorWithColor:v4];
}

- (UIImageView)iconView
{
  return (UIImageView *)objc_getProperty(self, a2, 752, 1);
}

- (UITextView)textView
{
  return (UITextView *)objc_getProperty(self, a2, 760, 1);
}

- (UILabel)buttonLabel
{
  return (UILabel *)objc_getProperty(self, a2, 768, 1);
}

- (UIView)containerView
{
  return (UIView *)objc_getProperty(self, a2, 776, 1);
}

- (NSString)captionText
{
  return (NSString *)objc_getProperty(self, a2, 784, 1);
}

- (NSString)buttonText
{
  return (NSString *)objc_getProperty(self, a2, 792, 1);
}

- (BOOL)largeIcon
{
  return self->_largeIcon;
}

- (void)setLargeIcon:(BOOL)a3
{
  self->_largeIcon = a3;
}

- (BOOL)underlineLinks
{
  return self->_underlineLinks;
}

- (CGSize)contentSize
{
  objc_copyStruct(v4, &self->_contentSize, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setContentSize:(CGSize)a3
{
  CGSize v3 = a3;
  objc_copyStruct(&self->_contentSize, &v3, 16, 1, 0);
}

- (NSString)displayLanguage
{
  return self->_displayLanguage;
}

- (void)setDisplayLanguage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayLanguage, 0);
  objc_storeStrong((id *)&self->_buttonText, 0);
  objc_storeStrong((id *)&self->_captionText, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_buttonLabel, 0);
  objc_storeStrong((id *)&self->_textView, 0);
  objc_storeStrong((id *)&self->_iconView, 0);
}

@end