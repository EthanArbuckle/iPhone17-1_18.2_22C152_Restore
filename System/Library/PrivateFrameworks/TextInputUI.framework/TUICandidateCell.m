@interface TUICandidateCell
+ (UIEdgeInsets)outsetsForText:(id)a3 font:(id)a4;
+ (double)widthForCandidate:(id)a3 showCandidateNumber:(BOOL)a4 style:(id)a5;
+ (double)widthForText:(id)a3 font:(id)a4 layoutOrientation:(int64_t)a5;
+ (id)reuseIdentifier;
- (BOOL)_canFocusProgrammatically;
- (BOOL)rowSelected;
- (BOOL)shouldShowCandidateNumber;
- (TIKeyboardCandidate)candidate;
- (TUICandidateCell)initWithCoder:(id)a3;
- (TUICandidateCell)initWithFrame:(CGRect)a3;
- (TUICandidateLabel)alternativeTextLabel;
- (TUICandidateLabel)annotationTextLabel;
- (TUICandidateLabel)textLabel;
- (UIImage)image;
- (UIImageView)imageView;
- (UILabel)candidateNumberLabel;
- (UIView)customView;
- (double)minimumTextLabelHeight;
- (id)cellBackgroundColor;
- (id)cellBackgroundImage;
- (int64_t)alignment;
- (unint64_t)candidateNumber;
- (void)_computeImageViewFrame;
- (void)applyLayoutAttributes:(id)a3;
- (void)commonInit;
- (void)flipHorizontallyForFrame:(CGRect *)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)rotateBy90DegreesForFrame:(CGRect *)a3;
- (void)setAlignment:(int64_t)a3;
- (void)setAlternativeTextLabel:(id)a3;
- (void)setAnnotationTextLabel:(id)a3;
- (void)setCandidate:(id)a3;
- (void)setCandidateNumber:(unint64_t)a3;
- (void)setCandidateNumberLabel:(id)a3;
- (void)setCustomView:(id)a3;
- (void)setImage:(id)a3;
- (void)setImageView:(id)a3;
- (void)setMinimumTextLabelHeight:(double)a3;
- (void)setRowSelected:(BOOL)a3;
- (void)setShouldShowCandidateNumber:(BOOL)a3;
- (void)setStyle:(id)a3;
- (void)setTextLabel:(id)a3;
- (void)updateColors;
- (void)updateLabels;
- (void)updateStyle;
@end

@implementation TUICandidateCell

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_annotationTextLabel, 0);
  objc_storeStrong((id *)&self->_candidateNumberLabel, 0);
  objc_storeStrong((id *)&self->_alternativeTextLabel, 0);
  objc_storeStrong((id *)&self->_textLabel, 0);
  objc_storeStrong((id *)&self->_customView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_candidate, 0);
}

- (void)setAnnotationTextLabel:(id)a3
{
}

- (void)setCandidateNumberLabel:(id)a3
{
}

- (void)setAlternativeTextLabel:(id)a3
{
}

- (void)setTextLabel:(id)a3
{
}

- (UIView)customView
{
  return self->_customView;
}

- (void)setImageView:(id)a3
{
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setMinimumTextLabelHeight:(double)a3
{
  self->_minimumTextLabelHeight = a3;
}

- (double)minimumTextLabelHeight
{
  return self->_minimumTextLabelHeight;
}

- (int64_t)alignment
{
  return self->_alignment;
}

- (BOOL)rowSelected
{
  return self->_rowSelected;
}

- (BOOL)shouldShowCandidateNumber
{
  return self->_shouldShowCandidateNumber;
}

- (unint64_t)candidateNumber
{
  return self->_candidateNumber;
}

- (TIKeyboardCandidate)candidate
{
  return self->_candidate;
}

- (id)cellBackgroundColor
{
  if ([(TUICandidateCell *)self isSelected]) {
    int v3 = 1;
  }
  else {
    int v3 = [(TUICandidateCell *)self isHighlighted];
  }
  v4 = [(TUICandidateCell *)self candidate];
  char v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0
    && ([(TUICandidateCell *)self candidate],
        v6 = objc_claimAutoreleasedReturnValue(),
        int v7 = [v6 isTransliterationCandidate],
        v6,
        ((v3 | v7 ^ 1) & 1) == 0))
  {
    v9 = [(TUICandidateBaseCell *)self style];
    v8 = [v9 transliterationCandidateBackgroundColor];
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)TUICandidateCell;
    v8 = [(TUICandidateBaseCell *)&v11 cellBackgroundColor];
  }
  return v8;
}

- (id)cellBackgroundImage
{
  if ([(TUICandidateCell *)self isSelected]) {
    int v3 = 1;
  }
  else {
    int v3 = [(TUICandidateCell *)self isHighlighted];
  }
  v4 = [(TUICandidateCell *)self candidate];
  char v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0
    && ([(TUICandidateCell *)self candidate],
        v6 = objc_claimAutoreleasedReturnValue(),
        int v7 = [v6 isTransliterationCandidate],
        v6,
        ((v3 | v7 ^ 1) & 1) == 0))
  {
    v9 = [(TUICandidateBaseCell *)self style];
    v8 = [v9 transliterationCandidateBackgroundImage];
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)TUICandidateCell;
    v8 = [(TUICandidateBaseCell *)&v11 cellBackgroundImage];
  }
  return v8;
}

- (void)updateColors
{
  v22.receiver = self;
  v22.super_class = (Class)TUICandidateCell;
  [(TUICandidateBaseCell *)&v22 updateColors];
  if (([(TUICandidateCell *)self isSelected] & 1) != 0
    || ([(TUICandidateCell *)self isHighlighted] & 1) != 0)
  {
    int v3 = [(TUICandidateBaseCell *)self style];
    v4 = [v3 highlightedTextColor];
    [(TUICandidateLabel *)self->_textLabel setTextColor:v4];

    char v5 = [(TUICandidateBaseCell *)self style];
    v6 = [v5 highlightedCandidateNumberColor];
    [(UILabel *)self->_candidateNumberLabel setTextColor:v6];

    int v7 = [(TUICandidateBaseCell *)self style];
    v8 = [v7 highlightedAlternativeTextColor];
    [(TUICandidateLabel *)self->_alternativeTextLabel setTextColor:v8];

    v9 = [(TUICandidateBaseCell *)self style];
    uint64_t v10 = [v9 highlightedTextColor];
  }
  else
  {
    objc_super v11 = [(TUICandidateBaseCell *)self style];
    v12 = [v11 textColor];
    [(TUICandidateLabel *)self->_textLabel setTextColor:v12];

    v13 = [(TUICandidateBaseCell *)self style];
    v14 = [v13 candidateNumberColor];
    [(UILabel *)self->_candidateNumberLabel setTextColor:v14];

    v15 = [(TUICandidateBaseCell *)self style];
    v16 = [v15 alternativeTextColor];
    [(TUICandidateLabel *)self->_alternativeTextLabel setTextColor:v16];

    v9 = [(TUICandidateBaseCell *)self style];
    uint64_t v10 = [v9 textColor];
  }
  v17 = (void *)v10;
  [(TUICandidateLabel *)self->_annotationTextLabel setTextColor:v10];

  v18 = [(TUICandidateBaseCell *)self style];
  if (objc_opt_respondsToSelector())
  {
    v19 = [(TUICandidateBaseCell *)self style];
    int v20 = [v19 showCellBorderForSpaceConfirmationCandidate];

    if (!v20) {
      return;
    }
    v18 = [(TUICandidateCell *)self layer];
    [v18 setBorderWidth:0.0];
    if (([(TUICandidateCell *)self isHighlighted] & 1) == 0)
    {
      if ([(TUICandidateCell *)self isSelected])
      {
        [v18 setBorderWidth:1.0];
        id v21 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
        objc_msgSend(v18, "setBorderColor:", objc_msgSend(v21, "CGColor"));
      }
    }
  }
}

- (void)flipHorizontallyForFrame:(CGRect *)a3
{
  [(TUICandidateCell *)self bounds];
  a3->origin.x = v4 - CGRectGetMaxX(*a3);
}

- (void)rotateBy90DegreesForFrame:(CGRect *)a3
{
  CGSize v3 = (CGSize)vextq_s8((int8x16_t)a3->size, (int8x16_t)a3->size, 8uLL);
  a3->origin = (CGPoint)vextq_s8((int8x16_t)a3->origin, (int8x16_t)a3->origin, 8uLL);
  a3->size = v3;
}

- (void)updateLabels
{
  CGSize v3 = [(TUICandidateCell *)self candidate];

  if (!v3) {
    return;
  }
  [(TUICandidateCell *)self bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  v12 = [(TUICandidateBaseCell *)self style];
  [v12 extraCellPadding];
  double x = v5 + v13;
  double y = v7 + v15;
  double width = v9 - (v13 + v17);
  v169.origin.double x = x;
  v169.origin.double y = y;
  double height = v11 - (v15 + v19);
  v169.size.double width = width;
  v169.size.double height = height;

  id v21 = [(TUICandidateBaseCell *)self style];
  uint64_t v22 = [v21 layoutOrientation];

  if (v22 == 1)
  {
    [(TUICandidateCell *)self rotateBy90DegreesForFrame:&v169];
    double x = v169.origin.x;
    double y = v169.origin.y;
    double width = v169.size.width;
    double height = v169.size.height;
  }
  v170.origin.double x = x;
  v170.origin.double y = y;
  v170.size.double width = width;
  v170.size.double height = height;
  double v23 = CGRectGetHeight(v170);
  double v147 = CGRectGetWidth(v169);
  v24 = [(TUICandidateBaseCell *)self style];
  [v24 minimumCellPadding];
  double v26 = v25;

  CGFloat MinY = CGRectGetMinY(v169);
  v28 = objc_opt_class();
  v29 = [(TUICandidateLabel *)self->_textLabel text];
  v30 = [(TUICandidateLabel *)self->_textLabel font];
  v31 = [(TUICandidateBaseCell *)self style];
  objc_msgSend(v28, "widthForText:font:layoutOrientation:", v29, v30, objc_msgSend(v31, "layoutOrientation"));
  CGFloat v33 = v32;
  v168.origin.double x = 0.0;
  v168.size.double width = v32;

  [(TUICandidateCell *)self minimumTextLabelHeight];
  if (v23 >= v34) {
    CGFloat v35 = v23;
  }
  else {
    CGFloat v35 = v34;
  }
  v168.size.double height = v35;
  double v36 = CGRectGetMinY(v169);
  v171.origin.double x = 0.0;
  v171.origin.double y = MinY;
  v171.size.double width = v33;
  v171.size.double height = v35;
  v168.origin.double y = v36 + ceil((v23 - CGRectGetHeight(v171)) * 0.5);
  CGFloat v37 = CGRectGetMinY(v169);
  v38 = [(UILabel *)self->_candidateNumberLabel text];
  v39 = [(UILabel *)self->_candidateNumberLabel font];
  objc_msgSend(v38, "tui_optimizedSizeWithFont:", v39);
  double v164 = 0.0;
  double v165 = v37;
  double v166 = v40;
  double rect = v23;

  CGFloat v148 = CGRectGetMinY(v169);
  v41 = objc_opt_class();
  v42 = [(TUICandidateLabel *)self->_alternativeTextLabel text];
  v43 = [(TUICandidateLabel *)self->_alternativeTextLabel font];
  v44 = [(TUICandidateBaseCell *)self style];
  objc_msgSend(v41, "widthForText:font:layoutOrientation:", v42, v43, objc_msgSend(v44, "layoutOrientation"));
  CGFloat v146 = v45;
  double v160 = 0.0;
  double v161 = v148;
  double v162 = v45;
  double v163 = v23;

  CGFloat v46 = CGRectGetMinY(v169);
  v47 = [(TUICandidateLabel *)self->_annotationTextLabel text];
  v48 = [(TUICandidateLabel *)self->_annotationTextLabel font];
  objc_msgSend(v47, "tui_optimizedSizeWithFont:", v48);
  CGFloat v50 = v49;
  v51 = [(TUICandidateLabel *)self->_annotationTextLabel font];
  [v51 lineHeight];
  double v156 = 0.0;
  double v157 = v46;
  double v158 = v50;
  double v149 = v52;
  double v159 = v52;

  v53 = [(TUICandidateCell *)self imageView];
  [v53 frame];
  double v55 = v54;
  CGFloat v57 = v56;
  CGFloat v59 = v58;
  CGFloat v151 = v60;
  double v152 = v60;
  double v153 = v54;
  double v154 = v56;
  double v155 = v58;

  v61 = [(TUICandidateCell *)self image];
  BOOL v62 = v168.size.width <= 0.00000011920929 || v61 == 0;
  double v63 = 6.0;
  if (v62) {
    double v63 = 0.0;
  }
  double v142 = v63;

  v64 = [(UILabel *)self->_candidateNumberLabel text];
  uint64_t v65 = [v64 length];

  CGFloat v150 = v55;
  CGFloat v66 = v23;
  if (v65)
  {
    v67 = [(TUICandidateBaseCell *)self style];
    uint64_t v68 = [v67 layoutOrientation];

    v69 = [(TUICandidateBaseCell *)self style];
    v70 = [v69 candidateNumberFont];
    objc_msgSend(@"0", "_legacy_sizeWithFont:", v70);
    if (v68)
    {
      double v73 = v72;
      double v166 = v72;

      CGFloat v74 = v73;
    }
    else
    {
      CGFloat v74 = v71;
      double v166 = v71;
    }
  }
  else
  {
    CGFloat v74 = v166;
  }
  double v140 = v26;
  v172.origin.double y = v150;
  v172.origin.double x = v151;
  CGFloat v144 = v57;
  CGFloat v145 = v59;
  v172.size.double width = v57;
  v172.size.double height = v59;
  BOOL v62 = CGRectGetWidth(v172) == 0.0;
  double v75 = -0.0;
  if (!v62) {
    double v75 = v142;
  }
  double v76 = v26 + v26 + v75;
  v173.origin.double x = v164;
  v173.size.double height = rect;
  v173.origin.double y = v165;
  v173.size.double width = v74;
  if (CGRectGetWidth(v173) != 0.0) {
    double v76 = v76 + 5.0;
  }
  v174.origin.double x = 0.0;
  v174.origin.double y = v46;
  v174.size.double width = v50;
  v174.size.double height = v149;
  if (CGRectGetWidth(v174) == 0.0) {
    double v77 = v76;
  }
  else {
    double v77 = v76 + 5.0;
  }
  v175.origin.double x = 0.0;
  v175.origin.double y = v148;
  v175.size.double width = v146;
  v175.size.double height = v66;
  double v143 = v74;
  if (CGRectGetWidth(v175) != 0.0)
  {
    v78 = [(TUICandidateBaseCell *)self style];
    char v79 = objc_opt_respondsToSelector();

    if (v79)
    {
      v80 = [(TUICandidateBaseCell *)self style];
      [v80 alternativeTextLeftSpacing];
      double v77 = v77 + v81;
    }
    else
    {
      double v77 = v77 + 5.0;
    }
  }
  double v82 = v26;
  CGFloat v83 = v50;
  double rect = v66;
  double v163 = v66;
  v84 = [(TUICandidateBaseCell *)self style];
  uint64_t v85 = [v84 layoutOrientation];

  if (v85 == 1) {
    double v86 = v169.origin.y + (v169.size.height - v149) * 0.5;
  }
  else {
    double v86 = v169.origin.y + 4.0;
  }
  double v157 = v86;
  v176.origin.double x = 0.0;
  v176.origin.double y = v148;
  CGFloat v87 = v146;
  v176.size.double width = v146;
  v176.size.double height = v66;
  BOOL v88 = CGRectGetWidth(v176) > 0.0;
  v177.origin.double y = v150;
  v177.origin.double x = v151;
  v177.size.double width = v144;
  v177.size.double height = v145;
  double v89 = v77 + CGRectGetWidth(v177);
  double v90 = v89 + CGRectGetWidth(v168);
  v178.origin.double x = v164;
  v178.origin.double y = v165;
  v178.size.double width = v74;
  v178.size.double height = v66;
  double v91 = v90 + CGRectGetWidth(v178);
  v179.origin.double x = 0.0;
  v179.origin.double y = v148;
  v179.size.double width = v146;
  v179.size.double height = v66;
  double v92 = v91 + CGRectGetWidth(v179);
  v180.origin.double x = 0.0;
  CGFloat v139 = v86;
  v180.origin.double y = v86;
  v180.size.double width = v83;
  v180.size.double height = v149;
  double v93 = v92 + CGRectGetWidth(v180);
  CGFloat v94 = v83;
  if (v93 <= v147)
  {
    int v96 = 0;
    CGFloat v100 = v165;
    CGFloat v99 = v74;
    CGFloat v95 = v66;
  }
  else
  {
    v181.origin.double x = 0.0;
    v181.origin.double y = v148;
    v181.size.double width = v146;
    CGFloat v95 = v66;
    v181.size.double height = v66;
    int v96 = 1;
    if (CGRectGetWidth(v181) == 0.0 || v93 - v147 <= 1.0)
    {
      CGFloat v100 = v165;
      CGFloat v99 = v143;
    }
    else
    {
      v97 = [(TUICandidateBaseCell *)self style];
      char v98 = objc_opt_respondsToSelector();

      CGFloat v100 = v165;
      CGFloat v99 = v143;
      if (v98)
      {
        v101 = [(TUICandidateBaseCell *)self style];
        [v101 alternativeTextLeftSpacing];
        double v103 = v102;
        v182.origin.double x = 0.0;
        v182.origin.double y = v148;
        v182.size.double width = v146;
        v182.size.double height = v66;
        double v104 = v103 + CGRectGetWidth(v182);
      }
      else
      {
        v183.origin.double x = 0.0;
        v183.origin.double y = v148;
        v183.size.double width = v146;
        v183.size.double height = v66;
        double v104 = CGRectGetWidth(v183) + 5.0;
      }
      double v93 = v93 - v104;
      if (v93 <= v147) {
        int v96 = 0;
      }
      BOOL v88 = 0;
      double v82 = v140;
      CGFloat v87 = v146;
    }
  }
  v105 = [(TUICandidateBaseCell *)self style];
  BOOL v141 = v88;
  if (objc_opt_respondsToSelector())
  {
    v106 = [(TUICandidateBaseCell *)self style];
    BOOL v107 = [v106 alternativeTextAlignment] == 2;
  }
  else
  {
    BOOL v107 = 0;
  }

  if ((v96 | v107) != 1)
  {
    int64_t alignment = self->_alignment;
    if (alignment == 2)
    {
      double v82 = v82 + v147 - v93;
      CGFloat v111 = v144;
      CGFloat v110 = v145;
    }
    else
    {
      CGFloat v111 = v144;
      CGFloat v110 = v145;
      if (alignment == 1) {
        double v82 = v82 + (v147 - v93) * 0.5;
      }
    }
    v189.origin.double x = v164;
    v189.origin.double y = v100;
    v189.size.double width = v99;
    v189.size.double height = v95;
    if (CGRectGetWidth(v189) != 0.0)
    {
      double v164 = v82;
      v190.origin.double x = v82;
      v190.origin.double y = v100;
      v190.size.double width = v99;
      v190.size.double height = v95;
      double v82 = v82 + CGRectGetWidth(v190) + 5.0;
    }
    BOOL v112 = v141;
    v191.origin.double x = v151;
    v191.origin.double y = v150;
    v191.size.double width = v111;
    v191.size.double height = v110;
    if (CGRectGetWidth(v191) != 0.0)
    {
      double v152 = v82;
      v192.origin.double x = v82;
      v192.origin.double y = v150;
      v192.size.double width = v111;
      v192.size.double height = v110;
      double v82 = v82 + v142 + CGRectGetWidth(v192);
    }
    v120 = objc_opt_class();
    v121 = [(TUICandidateLabel *)self->_textLabel text];
    v122 = [(TUICandidateLabel *)self->_textLabel font];
    [v120 outsetsForText:v121 font:v122];
    v168.origin.double x = v82 + ceil(v123);

    v193.origin.double x = v168.origin.x;
    v193.origin.double y = v138;
    v193.size.double width = v168.size.width;
    v193.size.double height = v168.size.height;
    double v124 = v82 + CGRectGetWidth(v193);
    v194.origin.double x = 0.0;
    v194.origin.double y = v139;
    v194.size.double width = v94;
    v194.size.double height = v149;
    if (CGRectGetWidth(v194) != 0.0)
    {
      v195.origin.double x = v124 + 5.0;
      double v156 = v124 + 5.0;
      v195.origin.double y = v139;
      v195.size.double width = v94;
      v195.size.double height = v149;
      double v124 = v124 + CGRectGetWidth(v195) + 5.0;
    }
    if (v141)
    {
      v125 = [(TUICandidateBaseCell *)self style];
      char v126 = objc_opt_respondsToSelector();

      if (v126)
      {
        v127 = [(TUICandidateBaseCell *)self style];
        [v127 alternativeTextLeftSpacing];
        double v160 = v124 + v128;
      }
      else
      {
        double v160 = v124 + 5.0;
      }
    }
    goto LABEL_81;
  }
  v184.origin.double x = v164;
  v184.origin.double y = v100;
  v184.size.double width = v99;
  v184.size.double height = v95;
  if (CGRectGetWidth(v184) == 0.0)
  {
    double v108 = v82;
  }
  else
  {
    double v164 = v82;
    v185.origin.double x = v82;
    v185.origin.double y = v100;
    v185.size.double width = v99;
    v185.size.double height = v95;
    double v108 = v82 + CGRectGetWidth(v185) + 5.0;
  }
  v186.origin.double x = v151;
  v186.origin.double y = v150;
  v186.size.double width = v144;
  v186.size.double height = v145;
  if (CGRectGetWidth(v186) != 0.0)
  {
    double v152 = v108;
    v187.origin.double x = v108;
    v187.origin.double y = v150;
    v187.size.double width = v144;
    v187.size.double height = v145;
    double v108 = v108 + v142 + CGRectGetWidth(v187);
  }
  BOOL v112 = v141;
  double v113 = v147 - v82;
  if (!v141) {
    goto LABEL_59;
  }
  v114 = [(TUICandidateBaseCell *)self style];
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {

    CGFloat v117 = v148;
    goto LABEL_71;
  }
  v115 = [(TUICandidateBaseCell *)self style];
  uint64_t v116 = [v115 alternativeTextAlignment];

  CGFloat v117 = v148;
  if (v116 != 2)
  {
LABEL_71:
    v196.origin.double x = 0.0;
    v196.origin.double y = v117;
    v196.size.double width = v87;
    v196.size.double height = v95;
    double v160 = v113 - CGRectGetWidth(v196);
    v129 = [(TUICandidateBaseCell *)self style];
    char v130 = objc_opt_respondsToSelector();

    v197.origin.double x = v160;
    v197.origin.double y = v117;
    v197.size.double width = v87;
    v197.size.double height = v95;
    double v131 = CGRectGetWidth(v197);
    if (v130)
    {
      v132 = [(TUICandidateBaseCell *)self style];
      [v132 alternativeTextLeftSpacing];
      double v113 = v113 - (v131 + v133);
    }
    else
    {
      double v113 = v113 - (v131 + 5.0);
    }
    CGFloat v119 = v149;
    CGFloat v118 = v139;
    goto LABEL_76;
  }
  v188.origin.double x = 0.0;
  v188.origin.double y = v148;
  v188.size.double width = v87;
  v188.size.double height = v95;
  double v160 = v113 - CGRectGetWidth(v188);
LABEL_59:
  CGFloat v118 = v139;
  CGFloat v119 = v149;
LABEL_76:
  v198.origin.double x = 0.0;
  v198.origin.double y = v118;
  v198.size.double width = v94;
  v198.size.double height = v119;
  if (CGRectGetWidth(v198) != 0.0)
  {
    v199.origin.double x = 0.0;
    v199.origin.double y = v118;
    v199.size.double width = v94;
    v199.size.double height = v119;
    v200.origin.double x = v113 - CGRectGetWidth(v199);
    double v156 = v200.origin.x;
    v200.origin.double y = v118;
    v200.size.double width = v94;
    v200.size.double height = v119;
    double v113 = v113 - (CGRectGetWidth(v200) + 5.0);
  }
  double v134 = v113 - v108;
  if (v113 - v108 < 0.0) {
    double v134 = 0.0;
  }
  v168.origin.double x = v108;
  v168.size.double width = v134;
LABEL_81:
  v135 = [(TUICandidateBaseCell *)self style];
  uint64_t v136 = [v135 layoutOrientation];

  if (v136 == 1)
  {
    [(TUICandidateCell *)self rotateBy90DegreesForFrame:&v168];
    [(TUICandidateCell *)self rotateBy90DegreesForFrame:&v164];
    [(TUICandidateCell *)self rotateBy90DegreesForFrame:&v152];
    [(TUICandidateCell *)self rotateBy90DegreesForFrame:&v160];
    [(TUICandidateCell *)self rotateBy90DegreesForFrame:&v156];
  }
  if ([(TUICandidateCell *)self effectiveUserInterfaceLayoutDirection] == 1)
  {
    [(TUICandidateCell *)self flipHorizontallyForFrame:&v168];
    [(TUICandidateCell *)self flipHorizontallyForFrame:&v164];
    [(TUICandidateCell *)self flipHorizontallyForFrame:&v152];
    [(TUICandidateCell *)self flipHorizontallyForFrame:&v160];
    [(TUICandidateCell *)self flipHorizontallyForFrame:&v156];
  }
  double v137 = TUIScreenScaleForView(self);
  [(TUICandidateLabel *)self->_textLabel setFrame:TUIRectIntegralWithScale(v168.origin.x, v168.origin.y, v168.size.width, v168.size.height, v137)];
  [(UILabel *)self->_candidateNumberLabel setFrame:TUIRectIntegralWithScale(v164, v165, v166, rect, v137)];
  [(UIImageView *)self->_imageView setFrame:TUIRectIntegralWithScale(v152, v153, v154, v155, v137)];
  [(TUICandidateLabel *)self->_alternativeTextLabel setHidden:!v112];
  [(TUICandidateLabel *)self->_alternativeTextLabel setFrame:TUIRectIntegralWithScale(v160, v161, v162, v163, v137)];
  [(TUICandidateLabel *)self->_annotationTextLabel setFrame:TUIRectIntegralWithScale(v156, v157, v158, v159, v137)];
}

- (void)updateStyle
{
  if (self->_candidateNumberLabel)
  {
    double v5 = [(TUICandidateBaseCell *)self style];
    double v6 = [v5 candidateNumberFont];
    [(UILabel *)self->_candidateNumberLabel setFont:v6];
  }
  if (self->_annotationTextLabel)
  {
    double v7 = [(TUICandidateBaseCell *)self style];
    double v8 = [v7 annotationTextFont];
    [(TUICandidateLabel *)self->_annotationTextLabel setFont:v8];
  }
  if (self->_alternativeTextLabel)
  {
    double v9 = [(TUICandidateBaseCell *)self style];
    double v10 = [v9 alternativeTextFont];
    [(TUICandidateLabel *)self->_alternativeTextLabel setFont:v10];

    double v11 = [(TUICandidateBaseCell *)self style];
    -[TUICandidateLabel setLayoutOrientation:](self->_alternativeTextLabel, "setLayoutOrientation:", [v11 layoutOrientation]);
  }
  v12 = [(TUICandidateBaseCell *)self style];
  uint64_t v13 = [v12 layoutOrientation];
  v14 = [(TUICandidateCell *)self textLabel];
  [v14 setLayoutOrientation:v13];

  double v15 = [(TUICandidateBaseCell *)self style];
  uint64_t v16 = [v15 lineBreakMode];
  double v17 = [(TUICandidateCell *)self textLabel];
  [v17 setLineBreakMode:v16];

  v18 = [(TUICandidateCell *)self candidate];
  int v19 = [v18 isSupplementalItemCandidate];
  if (v19
    && ([(TUICandidateBaseCell *)self style],
        id v34 = (id)objc_claimAutoreleasedReturnValue(),
        [v34 supplementalLexiconCandidateFont],
        (uint64_t v20 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v21 = (void *)v20;
    v2 = [(TUICandidateBaseCell *)self style];
    uint64_t v22 = [v2 supplementalLexiconCandidateFont];
    int v23 = 0;
    int v24 = 1;
  }
  else
  {
    CGSize v3 = [(TUICandidateBaseCell *)self style];
    uint64_t v22 = [v3 candidateFont];
    int v24 = 0;
    id v21 = 0;
    int v23 = 1;
  }
  double v25 = [(TUICandidateCell *)self textLabel];
  [v25 setFont:v22];

  if (v23)
  {
  }
  if (v24)
  {
  }
  if (v19)
  {
  }
  double v26 = [(TUICandidateCell *)self textLabel];
  v27 = [v26 font];
  [v27 pointSize];
  double v29 = 16.0 / v28;

  if (v29 > 0.9) {
    double v29 = 0.9;
  }
  v30 = [(TUICandidateCell *)self textLabel];
  [v30 setMinimumScaleFactor:v29];

  id v35 = [(TUICandidateBaseCell *)self style];
  [v35 cellCornerRadius];
  double v32 = v31;
  CGFloat v33 = [(TUICandidateCell *)self layer];
  [v33 setCornerRadius:v32];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)TUICandidateCell;
  [(TUICandidateBaseCell *)&v3 layoutSubviews];
  [(TUICandidateCell *)self updateStyle];
  [(TUICandidateCell *)self updateColors];
  [(TUICandidateCell *)self _computeImageViewFrame];
  [(TUICandidateCell *)self updateLabels];
}

- (void)_computeImageViewFrame
{
  imageView = self->_imageView;
  if (imageView)
  {
    [(UIImageView *)imageView frame];
    double v4 = [(TUICandidateCell *)self image];
    [v4 size];

    double v5 = [(TUICandidateBaseCell *)self style];
    if (objc_opt_respondsToSelector())
    {
      double v6 = [(TUICandidateBaseCell *)self style];
      [v6 maximumIconWidth];
    }
    [(TUICandidateCell *)self bounds];
    double v7 = [(TUICandidateBaseCell *)self style];
    [v7 extraCellPadding];
    UIRectCenteredYInRect();
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;

    id v16 = [(TUICandidateCell *)self imageView];
    objc_msgSend(v16, "setFrame:", v9, v11, v13, v15);
  }
}

- (void)applyLayoutAttributes:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)TUICandidateCell;
  id v4 = a3;
  [(TUICandidateCell *)&v8 applyLayoutAttributes:v4];
  objc_msgSend(v4, "contentAlpha", v8.receiver, v8.super_class);
  double v6 = v5;

  double v7 = [(TUICandidateCell *)self contentView];
  [v7 setAlpha:v6];

  [(TUICandidateCell *)self layoutIfNeeded];
}

- (BOOL)_canFocusProgrammatically
{
  return 1;
}

- (void)setStyle:(id)a3
{
  id v4 = a3;
  double v5 = [(TUICandidateBaseCell *)self style];
  char v6 = [v5 isEqual:v4];

  if ((v6 & 1) == 0)
  {
    v7.receiver = self;
    v7.super_class = (Class)TUICandidateCell;
    [(TUICandidateBaseCell *)&v7 setStyle:v4];
    [(TUICandidateCell *)self setNeedsLayout];
  }
}

- (void)setAlignment:(int64_t)a3
{
  if (self->_alignment != a3)
  {
    self->_int64_t alignment = a3;
    [(TUICandidateCell *)self setNeedsLayout];
  }
}

- (void)setRowSelected:(BOOL)a3
{
  if (self->_rowSelected != a3)
  {
    self->_rowSelected = a3;
    [(TUICandidateCell *)self updateColors];
  }
}

- (void)setShouldShowCandidateNumber:(BOOL)a3
{
  if (self->_shouldShowCandidateNumber != a3)
  {
    self->_shouldShowCandidateNumber = a3;
    BOOL v4 = !a3;
    double v5 = [(TUICandidateCell *)self candidateNumberLabel];
    [v5 setHidden:v4];

    if (!self->_shouldShowCandidateNumber)
    {
      char v6 = [(TUICandidateBaseCell *)self style];
      uint64_t v7 = [v6 layoutOrientation];

      if (v7 == 1)
      {
        objc_super v8 = [(TUICandidateCell *)self candidateNumberLabel];
        [v8 setText:0];

        [(TUICandidateCell *)self setNeedsLayout];
      }
    }
  }
}

- (void)setCandidateNumber:(unint64_t)a3
{
  if (self->_candidateNumber != a3)
  {
    self->_candidateNumber = a3;
    if (a3 - 1 > 8)
    {
      if ([(TUICandidateCell *)self shouldShowCandidateNumber])
      {
        double v5 = [(TUICandidateBaseCell *)self style];
        uint64_t v6 = [v5 layoutOrientation];

        if (v6 == 1) {
          uint64_t v7 = @" ";
        }
        else {
          uint64_t v7 = 0;
        }
        id v9 = v7;
      }
      else
      {
        id v9 = 0;
      }
    }
    else
    {
      BOOL v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
      id v9 = [v4 stringValue];
    }
    objc_super v8 = [(TUICandidateCell *)self candidateNumberLabel];
    [v8 setText:v9];

    [(TUICandidateCell *)self setNeedsLayout];
  }
}

- (void)setCandidate:(id)a3
{
  double v5 = (TIKeyboardCandidate *)a3;
  candidate = self->_candidate;
  if (candidate == v5) {
    goto LABEL_22;
  }
  int v24 = v5;
  if (-[TIKeyboardCandidate isEqual:](candidate, "isEqual:")) {
    goto LABEL_22;
  }
  objc_storeStrong((id *)&self->_candidate, a3);
  if (objc_opt_respondsToSelector())
  {
    uint64_t v7 = [(TIKeyboardCandidate *)v24 icon];
    [(TUICandidateCell *)self setImage:v7];
  }
  objc_super v8 = [(TIKeyboardCandidate *)v24 label];
  if ([v8 length])
  {
  }
  else
  {
    textLabel = self->_textLabel;

    double v10 = v24;
    if (!textLabel) {
      goto LABEL_9;
    }
  }
  double v11 = [(TIKeyboardCandidate *)v24 label];
  double v12 = [(TUICandidateCell *)self textLabel];
  [v12 setText:v11];

  double v10 = v24;
LABEL_9:
  double v13 = [(TIKeyboardCandidate *)v10 alternativeText];
  if ([v13 length])
  {

LABEL_12:
    id v16 = [(TIKeyboardCandidate *)v24 alternativeText];
    double v17 = [(TUICandidateCell *)self alternativeTextLabel];
    [v17 setText:v16];

    double v15 = v24;
    goto LABEL_13;
  }
  alternativeTextLabel = self->_alternativeTextLabel;

  double v15 = v24;
  if (alternativeTextLabel) {
    goto LABEL_12;
  }
LABEL_13:
  v18 = [(TIKeyboardCandidate *)v15 annotationText];
  uint64_t v19 = [v18 length];

  if (v19)
  {
    uint64_t v20 = [(TIKeyboardCandidate *)v24 annotationText];
    id v21 = UIKeyboardLocalizedString();
  }
  else
  {
    id v21 = 0;
  }
  if ([v21 length] || self->_annotationTextLabel)
  {
    uint64_t v22 = [(TUICandidateCell *)self annotationTextLabel];
    [v22 setText:v21];
  }
  if (objc_opt_respondsToSelector())
  {
    int v23 = [(TIKeyboardCandidate *)v24 customView];
    [(TUICandidateCell *)self setCustomView:v23];
  }
  [(TUICandidateCell *)self setNeedsLayout];

LABEL_22:
  MEMORY[0x1F4181820]();
}

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)TUICandidateCell;
  [(TUICandidateCell *)&v4 prepareForReuse];
  candidate = self->_candidate;
  self->_candidate = 0;

  [(TUICandidateCell *)self setCandidateNumber:0];
  [(TUICandidateCell *)self setShouldShowCandidateNumber:0];
  [(TUICandidateCell *)self setRowSelected:0];
  [(TUICandidateCell *)self setImage:0];
}

- (TUICandidateLabel)annotationTextLabel
{
  annotationTextLabel = self->_annotationTextLabel;
  if (!annotationTextLabel)
  {
    objc_super v4 = [TUICandidateLabel alloc];
    double v5 = -[TUICandidateLabel initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    uint64_t v6 = self->_annotationTextLabel;
    self->_annotationTextLabel = v5;

    [(TUICandidateLabel *)self->_annotationTextLabel setAlpha:0.4];
    uint64_t v7 = [(TUICandidateCell *)self contentView];
    [v7 addSubview:self->_annotationTextLabel];

    annotationTextLabel = self->_annotationTextLabel;
  }
  return annotationTextLabel;
}

- (UILabel)candidateNumberLabel
{
  candidateNumberLabel = self->_candidateNumberLabel;
  if (!candidateNumberLabel)
  {
    id v4 = objc_alloc(MEMORY[0x1E4FB1930]);
    double v5 = (UILabel *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    uint64_t v6 = self->_candidateNumberLabel;
    self->_candidateNumberLabel = v5;

    [(UILabel *)self->_candidateNumberLabel setHidden:[(TUICandidateCell *)self shouldShowCandidateNumber] ^ 1];
    [(UILabel *)self->_candidateNumberLabel setTextAlignment:1];
    uint64_t v7 = [(TUICandidateCell *)self contentView];
    [v7 addSubview:self->_candidateNumberLabel];

    candidateNumberLabel = self->_candidateNumberLabel;
  }
  return candidateNumberLabel;
}

- (TUICandidateLabel)alternativeTextLabel
{
  alternativeTextLabel = self->_alternativeTextLabel;
  if (!alternativeTextLabel)
  {
    id v4 = [TUICandidateLabel alloc];
    double v5 = -[TUICandidateLabel initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    uint64_t v6 = self->_alternativeTextLabel;
    self->_alternativeTextLabel = v5;

    [(TUICandidateLabel *)self->_alternativeTextLabel setAdjustsFontSizeToFitWidth:1];
    [(TUICandidateLabel *)self->_alternativeTextLabel setMinimumScaleFactor:0.9];
    uint64_t v7 = [(TUICandidateBaseCell *)self style];
    -[TUICandidateLabel setLayoutOrientation:](self->_alternativeTextLabel, "setLayoutOrientation:", [v7 layoutOrientation]);

    objc_super v8 = [(TUICandidateCell *)self contentView];
    [v8 addSubview:self->_alternativeTextLabel];

    alternativeTextLabel = self->_alternativeTextLabel;
  }
  return alternativeTextLabel;
}

- (TUICandidateLabel)textLabel
{
  textLabel = self->_textLabel;
  if (!textLabel)
  {
    id v4 = [TUICandidateLabel alloc];
    [(TUICandidateCell *)self bounds];
    double v5 = -[TUICandidateLabel initWithFrame:](v4, "initWithFrame:", 0.0, 0.0, CGRectGetWidth(v12), 42.0);
    uint64_t v6 = self->_textLabel;
    self->_textLabel = v5;

    [(TUICandidateLabel *)self->_textLabel setAdjustsFontSizeToFitWidth:1];
    uint64_t v7 = [(TUICandidateBaseCell *)self style];
    -[TUICandidateLabel setLineBreakMode:](self->_textLabel, "setLineBreakMode:", [v7 lineBreakMode]);

    objc_super v8 = [(TUICandidateBaseCell *)self style];
    -[TUICandidateLabel setLayoutOrientation:](self->_textLabel, "setLayoutOrientation:", [v8 layoutOrientation]);

    id v9 = [(TUICandidateCell *)self contentView];
    [v9 addSubview:self->_textLabel];

    textLabel = self->_textLabel;
  }
  return textLabel;
}

- (void)setCustomView:(id)a3
{
  id v9 = a3;
  id v5 = [(TUICandidateCell *)self customView];

  uint64_t v6 = v9;
  if (v5 != v9)
  {
    uint64_t v7 = self->_customView;
    objc_storeStrong((id *)&self->_customView, a3);
    [(UIView *)v7 removeFromSuperview];
    if (v9)
    {
      objc_super v8 = [(TUICandidateCell *)self contentView];
      [v8 addSubview:v9];

      [(TUICandidateCell *)self setNeedsLayout];
    }

    uint64_t v6 = v9;
  }
}

- (UIImage)image
{
  return [(UIImageView *)self->_imageView image];
}

- (void)setImage:(id)a3
{
  id v13 = a3;
  id v4 = [(TUICandidateCell *)self image];

  id v6 = v13;
  if (v4 != v13)
  {
    imageView = self->_imageView;
    if (v13)
    {
      if (!imageView)
      {
        id v8 = objc_alloc(MEMORY[0x1E4FB1838]);
        id v9 = (UIImageView *)objc_msgSend(v8, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
        double v10 = self->_imageView;
        self->_imageView = v9;

        double v11 = [(TUICandidateCell *)self contentView];
        [v11 addSubview:self->_imageView];

        imageView = self->_imageView;
      }
      [(UIImageView *)imageView setImage:v13];
      uint64_t v5 = [(TUICandidateCell *)self setNeedsLayout];
    }
    else
    {
      [(UIImageView *)imageView removeFromSuperview];
      CGRect v12 = self->_imageView;
      self->_imageView = 0;
    }
    id v6 = v13;
  }
  MEMORY[0x1F41817F8](v5, v6);
}

- (TUICandidateCell)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TUICandidateCell;
  objc_super v3 = [(TUICandidateCell *)&v6 initWithCoder:a3];
  id v4 = v3;
  if (v3) {
    [(TUICandidateCell *)v3 commonInit];
  }
  return v4;
}

- (TUICandidateCell)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TUICandidateCell;
  objc_super v3 = -[TUICandidateBaseCell initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  id v4 = v3;
  if (v3) {
    [(TUICandidateCell *)v3 commonInit];
  }
  return v4;
}

- (void)commonInit
{
  self->_int64_t alignment = 1;
  [(TUICandidateCell *)self _setFocusStyle:1];
  [(TUICandidateCell *)self setMinimumTextLabelHeight:42.0];
}

+ (UIEdgeInsets)outsetsForText:(id)a3 font:(id)a4
{
  objc_msgSend(a3, "tui_languageAwareOutsetsForFont:", a4);
  result.right = v7;
  result.bottom = v6;
  result.left = v5;
  result.top = v4;
  return result;
}

+ (double)widthForText:(id)a3 font:(id)a4 layoutOrientation:(int64_t)a5
{
  if (a5) {
    +[TUICandidateLabel lineWidthForText:a3 font:a4 layoutOrientation:a5];
  }
  else {
    objc_msgSend(a3, "tui_optimizedSizeWithFont:", a4);
  }
  double v8 = v7;
  [(id)objc_opt_class() outsetsForText:a3 font:a4];
  double v10 = v9;
  double v12 = v11;

  return v8 + ceil(v10 + v12);
}

+ (double)widthForCandidate:(id)a3 showCandidateNumber:(BOOL)a4 style:(id)a5
{
  BOOL v6 = a4;
  id v7 = a3;
  id v8 = a5;
  if ([v7 isSupplementalItemCandidate]
    && ([v8 supplementalLexiconCandidateFont], (uint64_t v9 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    double v10 = (void *)v9;
    double v11 = [v8 supplementalLexiconCandidateFont];
  }
  else
  {
    double v11 = [v8 candidateFont];
  }
  double v12 = objc_opt_class();
  id v13 = [v7 label];
  objc_msgSend(v12, "widthForText:font:layoutOrientation:", v13, v11, objc_msgSend(v8, "layoutOrientation"));
  double v15 = v14;

  id v16 = objc_opt_class();
  double v17 = [v7 alternativeText];
  v18 = [v8 alternativeTextFont];
  objc_msgSend(v16, "widthForText:font:layoutOrientation:", v17, v18, objc_msgSend(v8, "layoutOrientation"));
  double v20 = v19;

  id v21 = [v7 annotationText];
  uint64_t v22 = [v21 length];

  if (v22)
  {
    int v23 = [v7 annotationText];
    int v24 = UIKeyboardLocalizedString();
    double v25 = [v8 annotationTextFont];
    objc_msgSend(v24, "tui_optimizedSizeWithFont:", v25);
    double v27 = v26;
  }
  else
  {
    double v27 = *MEMORY[0x1E4F1DB30];
  }
  if (v20 > 0.0)
  {
    char v28 = objc_opt_respondsToSelector();
    double v29 = 5.0;
    if (v28) {
      objc_msgSend(v8, "alternativeTextLeftSpacing", 5.0);
    }
    double v15 = v15 + v20 + v29;
  }
  [v8 minimumCellPadding];
  double v31 = v15 + v30 * 2.0;
  double v32 = v27 + 5.0;
  if (v27 <= 0.0) {
    double v32 = -0.0;
  }
  double v33 = v32 + v31;
  if (v6)
  {
    uint64_t v34 = [v8 layoutOrientation];
    id v35 = [v8 candidateNumberFont];
    objc_msgSend(@"0", "_legacy_sizeWithFont:", v35);
    double v37 = v36;
    double v39 = v38;

    if (v34) {
      double v33 = v33 + v39 + 5.0;
    }
    else {
      double v33 = v33 + v37 + 5.0;
    }
  }
  if (objc_opt_respondsToSelector())
  {
    double v40 = [v7 icon];

    if (v40)
    {
      v41 = [v7 icon];
      [v41 size];
      double v43 = v42;

      char v44 = objc_opt_respondsToSelector();
      double v45 = 20.0;
      if (v44) {
        objc_msgSend(v8, "maximumIconWidth", 20.0);
      }
      if (v43 < v45) {
        double v45 = v43;
      }
      double v33 = v33 + v45 + 6.0;
    }
  }
  if (objc_opt_respondsToSelector())
  {
    CGFloat v46 = [v7 customView];

    if (v46)
    {
      v47 = [v7 customView];
      [v47 intrinsicContentSize];
      double v33 = v48;
    }
  }
  [v8 minimumCellWidth];
  if (v33 < v49) {
    double v33 = v49;
  }

  return v33;
}

+ (id)reuseIdentifier
{
  return @"TUICandidateCell";
}

@end