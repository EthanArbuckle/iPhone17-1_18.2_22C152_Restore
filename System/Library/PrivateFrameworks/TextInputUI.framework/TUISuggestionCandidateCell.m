@interface TUISuggestionCandidateCell
+ (id)reuseIdentifier;
- (NSLayoutConstraint)bottomPaddingConstraint;
- (NSLayoutConstraint)leftPaddingConstraint;
- (NSLayoutConstraint)paddingBetweenConstraint;
- (NSLayoutConstraint)rightPaddingConstraint;
- (NSLayoutConstraint)topPaddingConstraint;
- (TIKeyboardCandidate)candidate;
- (TUISuggestionCandidateCell)initWithCoder:(id)a3;
- (TUISuggestionCandidateCell)initWithFrame:(CGRect)a3;
- (UIImageView)iconImageView;
- (UILabel)textLabel;
- (UILayoutGuide)centeredContainer;
- (UILayoutGuide)paddedContainer;
- (id)bodyText;
- (id)headerText;
- (id)image;
- (id)textSuggestion;
- (void)commonInit;
- (void)didMoveToWindow;
- (void)layoutSubviews;
- (void)setBottomPaddingConstraint:(id)a3;
- (void)setCandidate:(id)a3;
- (void)setCenteredContainer:(id)a3;
- (void)setIconImageView:(id)a3;
- (void)setLeftPaddingConstraint:(id)a3;
- (void)setPaddedContainer:(id)a3;
- (void)setPaddingBetweenConstraint:(id)a3;
- (void)setRightPaddingConstraint:(id)a3;
- (void)setStyle:(id)a3;
- (void)setTextLabel:(id)a3;
- (void)setTopPaddingConstraint:(id)a3;
- (void)updateLabel;
@end

@implementation TUISuggestionCandidateCell

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rightPaddingConstraint, 0);
  objc_storeStrong((id *)&self->_bottomPaddingConstraint, 0);
  objc_storeStrong((id *)&self->_leftPaddingConstraint, 0);
  objc_storeStrong((id *)&self->_topPaddingConstraint, 0);
  objc_storeStrong((id *)&self->_paddingBetweenConstraint, 0);
  objc_storeStrong((id *)&self->_centeredContainer, 0);
  objc_storeStrong((id *)&self->_paddedContainer, 0);
  objc_storeStrong((id *)&self->_iconImageView, 0);
  objc_storeStrong((id *)&self->_textLabel, 0);
  objc_storeStrong((id *)&self->_candidate, 0);
}

- (void)setRightPaddingConstraint:(id)a3
{
}

- (NSLayoutConstraint)rightPaddingConstraint
{
  return self->_rightPaddingConstraint;
}

- (void)setBottomPaddingConstraint:(id)a3
{
}

- (NSLayoutConstraint)bottomPaddingConstraint
{
  return self->_bottomPaddingConstraint;
}

- (void)setLeftPaddingConstraint:(id)a3
{
}

- (NSLayoutConstraint)leftPaddingConstraint
{
  return self->_leftPaddingConstraint;
}

- (void)setTopPaddingConstraint:(id)a3
{
}

- (NSLayoutConstraint)topPaddingConstraint
{
  return self->_topPaddingConstraint;
}

- (void)setPaddingBetweenConstraint:(id)a3
{
}

- (NSLayoutConstraint)paddingBetweenConstraint
{
  return self->_paddingBetweenConstraint;
}

- (void)setCenteredContainer:(id)a3
{
}

- (UILayoutGuide)centeredContainer
{
  return self->_centeredContainer;
}

- (void)setPaddedContainer:(id)a3
{
}

- (UILayoutGuide)paddedContainer
{
  return self->_paddedContainer;
}

- (void)setIconImageView:(id)a3
{
}

- (UIImageView)iconImageView
{
  return self->_iconImageView;
}

- (void)setTextLabel:(id)a3
{
}

- (UILabel)textLabel
{
  return self->_textLabel;
}

- (TIKeyboardCandidate)candidate
{
  return self->_candidate;
}

- (void)updateLabel
{
  v84[2] = *MEMORY[0x1E4F143B8];
  v5 = [(TUICandidateBaseCell *)self style];
  [v5 extraCellPadding];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  v14 = [(TUISuggestionCandidateCell *)self topPaddingConstraint];
  [v14 setConstant:v7];

  v15 = [(TUISuggestionCandidateCell *)self leftPaddingConstraint];
  [v15 setConstant:v9];

  v16 = [(TUISuggestionCandidateCell *)self bottomPaddingConstraint];
  [v16 setConstant:v11];

  v17 = [(TUISuggestionCandidateCell *)self rightPaddingConstraint];
  [v17 setConstant:v13];

  id v18 = objc_alloc_init(MEMORY[0x1E4F28E48]);
  v19 = [(TUISuggestionCandidateCell *)self headerText];
  uint64_t v20 = [(TUISuggestionCandidateCell *)self bodyText];
  if (!v20)
  {
    v26 = [(TUISuggestionCandidateCell *)self textLabel];
    [v26 setAttributedText:0];

    goto LABEL_30;
  }
  v21 = (void *)v20;
  v22 = [(TUICandidateBaseCell *)self style];
  v23 = [v22 textColor];
  v24 = v23;
  if (v23)
  {
    id v25 = v23;
  }
  else
  {
    id v25 = [MEMORY[0x1E4FB1618] clearColor];
  }
  v27 = v25;

  [(TUISuggestionCandidateCell *)self bounds];
  double v29 = v28 - v9 - v13;
  v30 = [(TUICandidateBaseCell *)self style];
  [v30 minimumCellPadding];
  double v32 = v29 + v31 * -2.0;

  unint64_t v33 = 0x1E4FB1000uLL;
  unint64_t v34 = 0x1E4F1C000;
  if (!v19)
  {
    uint64_t v37 = *MEMORY[0x1E4FB06F8];
    uint64_t v38 = *MEMORY[0x1E4FB0700];
    goto LABEL_20;
  }
  v35 = [(TUISuggestionCandidateCell *)self textSuggestion];
  v36 = [(TUISuggestionCandidateCell *)self candidate];
  v79 = v35;
  if (([v36 customInfoType] & 0x18) != 0)
  {

LABEL_11:
    v40 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v41 = [v40 userInterfaceIdiom];

    BOOL v42 = (v41 & 0xFFFFFFFFFFFFFFFBLL) == 1;
    double v43 = 14.0;
    double v44 = 12.0;
    goto LABEL_12;
  }
  char v39 = [v35 displayStylePlain];

  if (v39) {
    goto LABEL_11;
  }
  v77 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v78 = [v77 userInterfaceIdiom];

  BOOL v42 = (v78 & 0xFFFFFFFFFFFFFFFBLL) == 1;
  double v43 = 12.0;
  double v44 = 11.0;
LABEL_12:
  if (v42) {
    double v45 = v44;
  }
  else {
    double v45 = v43;
  }
  v46 = [(TUISuggestionCandidateCell *)self window];
  [v46 interfaceOrientation];

  uint64_t v37 = *MEMORY[0x1E4FB06F8];
  v83[0] = *MEMORY[0x1E4FB06F8];
  v47 = [MEMORY[0x1E4FB08E0] systemFontOfSize:v45];
  uint64_t v38 = *MEMORY[0x1E4FB0700];
  v83[1] = *MEMORY[0x1E4FB0700];
  v84[0] = v47;
  v80 = v27;
  v84[1] = v27;
  v48 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v84 forKeys:v83 count:2];

  v49 = [(TUICandidateBaseCell *)self style];
  if (objc_opt_respondsToSelector())
  {
    id v50 = v18;
    v51 = [(TUICandidateBaseCell *)self style];
    v52 = [v51 suggestionCandidateHeaderFontAttributes];

    if (!v52)
    {
      id v18 = v50;
      unint64_t v33 = 0x1E4FB1000;
      goto LABEL_19;
    }
    v49 = [(TUICandidateBaseCell *)self style];
    uint64_t v53 = [v49 suggestionCandidateHeaderFontAttributes];

    v48 = (void *)v53;
    id v18 = v50;
    unint64_t v33 = 0x1E4FB1000uLL;
  }

LABEL_19:
  uint64_t v54 = objc_msgSend(v19, "tui_centerTruncatedStringWithAttributes:fittingWidth:", v48, v32);

  id v55 = objc_alloc(MEMORY[0x1E4F28E48]);
  v56 = [NSString stringWithFormat:@"%@%@", v54, @"\n"];
  v57 = (void *)[v55 initWithString:v56 attributes:v48];

  [v18 appendAttributedString:v57];
  v19 = (void *)v54;
  v27 = v80;
  unint64_t v34 = 0x1E4F1C000uLL;
LABEL_20:
  v58 = [*(id *)(v33 + 1736) currentDevice];
  uint64_t v59 = [v58 userInterfaceIdiom];

  double v60 = 16.0;
  if ((v59 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    double v60 = 14.0;
  }
  v81[0] = v37;
  v61 = [MEMORY[0x1E4FB08E0] systemFontOfSize:v60];
  v81[1] = v38;
  v82[0] = v61;
  v82[1] = v27;
  v2 = [*(id *)(v34 + 2536) dictionaryWithObjects:v82 forKeys:v81 count:2];

  v62 = [(TUICandidateBaseCell *)self style];
  if (objc_opt_respondsToSelector())
  {
    v63 = v27;
    v64 = [(TUICandidateBaseCell *)self style];
    v65 = [v64 suggestionCandidateBodyFontAttributes];

    if (!v65)
    {
      v27 = v63;
      goto LABEL_26;
    }
    v62 = [(TUICandidateBaseCell *)self style];
    uint64_t v66 = [v62 suggestionCandidateBodyFontAttributes];

    v2 = (void *)v66;
    v27 = v63;
  }

LABEL_26:
  objc_msgSend(v21, "tui_centerTruncatedStringWithAttributes:fittingWidth:", v2, v32);
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();

  id v67 = objc_alloc(MEMORY[0x1E4F28B18]);
  if (v3) {
    v68 = v3;
  }
  else {
    v68 = &stru_1EDC653C0;
  }
  v69 = (void *)[v67 initWithString:v68 attributes:v2];
  [v18 appendAttributedString:v69];
  v70 = [(TUISuggestionCandidateCell *)self textLabel];
  [v70 setAttributedText:v18];

LABEL_30:
  v71 = [(TUISuggestionCandidateCell *)self image];
  v72 = [(TUISuggestionCandidateCell *)self iconImageView];
  [v72 setImage:v71];

  v73 = [(TUISuggestionCandidateCell *)self textLabel];
  v74 = [v73 text];
  if (v74)
  {
    v2 = [(TUISuggestionCandidateCell *)self iconImageView];
    v3 = [v2 image];
    if (v3) {
      double v75 = 10.0;
    }
    else {
      double v75 = 0.0;
    }
  }
  else
  {
    double v75 = 0.0;
  }
  v76 = [(TUISuggestionCandidateCell *)self paddingBetweenConstraint];
  [v76 setConstant:v75];

  if (v74)
  {
  }
}

- (id)image
{
  v2 = [(TUISuggestionCandidateCell *)self textSuggestion];
  v3 = [v2 image];

  return v3;
}

- (id)bodyText
{
  v2 = [(TUISuggestionCandidateCell *)self textSuggestion];
  v3 = [v2 displayText];

  return v3;
}

- (id)headerText
{
  v2 = [(TUISuggestionCandidateCell *)self textSuggestion];
  v3 = [v2 headerText];

  return v3;
}

- (id)textSuggestion
{
  v3 = [(TUISuggestionCandidateCell *)self candidate];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v5 = [(TUISuggestionCandidateCell *)self candidate];
    double v6 = [v5 textSuggestion];
  }
  else
  {
    double v6 = 0;
  }
  return v6;
}

- (void)didMoveToWindow
{
  v3.receiver = self;
  v3.super_class = (Class)TUISuggestionCandidateCell;
  [(TUISuggestionCandidateCell *)&v3 didMoveToWindow];
  [(TUISuggestionCandidateCell *)self setNeedsLayout];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)TUISuggestionCandidateCell;
  [(TUICandidateBaseCell *)&v3 layoutSubviews];
  [(TUISuggestionCandidateCell *)self updateLabel];
}

- (void)setStyle:(id)a3
{
  id v4 = a3;
  v5 = [(TUICandidateBaseCell *)self style];
  char v6 = [v5 isEqual:v4];

  if ((v6 & 1) == 0)
  {
    v7.receiver = self;
    v7.super_class = (Class)TUISuggestionCandidateCell;
    [(TUICandidateBaseCell *)&v7 setStyle:v4];
    [(TUISuggestionCandidateCell *)self updateLabel];
  }
}

- (void)setCandidate:(id)a3
{
  id v5 = a3;
  uint64_t candidate = (uint64_t)self->_candidate;
  if ((id)candidate != v5)
  {
    id v7 = v5;
    uint64_t candidate = [(id)candidate isEqual:v5];
    id v5 = v7;
    if ((candidate & 1) == 0)
    {
      objc_storeStrong((id *)&self->_candidate, a3);
      uint64_t candidate = [(TUISuggestionCandidateCell *)self updateLabel];
      id v5 = v7;
    }
  }
  MEMORY[0x1F41817F8](candidate, v5);
}

- (TUISuggestionCandidateCell)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TUISuggestionCandidateCell;
  objc_super v3 = [(TUISuggestionCandidateCell *)&v6 initWithCoder:a3];
  id v4 = v3;
  if (v3) {
    [(TUISuggestionCandidateCell *)v3 commonInit];
  }
  return v4;
}

- (TUISuggestionCandidateCell)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TUISuggestionCandidateCell;
  objc_super v3 = -[TUICandidateBaseCell initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  id v4 = v3;
  if (v3) {
    [(TUISuggestionCandidateCell *)v3 commonInit];
  }
  return v4;
}

- (void)commonInit
{
  id v3 = objc_alloc(MEMORY[0x1E4FB1838]);
  id v4 = (UIImageView *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  iconImageView = self->_iconImageView;
  self->_iconImageView = v4;

  [(UIImageView *)self->_iconImageView setTranslatesAutoresizingMaskIntoConstraints:0];
  objc_super v6 = [(TUISuggestionCandidateCell *)self contentView];
  [v6 addSubview:self->_iconImageView];

  id v7 = objc_alloc(MEMORY[0x1E4FB1930]);
  [(TUISuggestionCandidateCell *)self bounds];
  double v8 = (UILabel *)objc_msgSend(v7, "initWithFrame:");
  textLabel = self->_textLabel;
  self->_textLabel = v8;

  [(UILabel *)self->_textLabel setTextAlignment:1];
  [(UILabel *)self->_textLabel setNumberOfLines:0];
  [(UILabel *)self->_textLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  double v10 = [(TUISuggestionCandidateCell *)self contentView];
  [v10 addSubview:self->_textLabel];

  double v11 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x1E4FB1940]);
  paddedContainer = self->_paddedContainer;
  self->_paddedContainer = v11;

  double v13 = [(TUISuggestionCandidateCell *)self contentView];
  [v13 addLayoutGuide:self->_paddedContainer];

  v14 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x1E4FB1940]);
  centeredContainer = self->_centeredContainer;
  self->_centeredContainer = v14;

  v16 = [(TUISuggestionCandidateCell *)self contentView];
  [v16 addLayoutGuide:self->_centeredContainer];

  v17 = [(UILayoutGuide *)self->_paddedContainer topAnchor];
  id v18 = [(TUISuggestionCandidateCell *)self contentView];
  v19 = [v18 topAnchor];
  uint64_t v20 = [v17 constraintEqualToAnchor:v19];
  topPaddingConstraint = self->_topPaddingConstraint;
  self->_topPaddingConstraint = v20;

  v22 = [(UILayoutGuide *)self->_paddedContainer leftAnchor];
  v23 = [(TUISuggestionCandidateCell *)self contentView];
  v24 = [v23 leftAnchor];
  id v25 = [v22 constraintEqualToAnchor:v24];
  leftPaddingConstraint = self->_leftPaddingConstraint;
  self->_leftPaddingConstraint = v25;

  v27 = [(UILayoutGuide *)self->_paddedContainer bottomAnchor];
  double v28 = [(TUISuggestionCandidateCell *)self contentView];
  double v29 = [v28 bottomAnchor];
  v30 = [v27 constraintEqualToAnchor:v29];
  bottomPaddingConstraint = self->_bottomPaddingConstraint;
  self->_bottomPaddingConstraint = v30;

  double v32 = [(UILayoutGuide *)self->_paddedContainer rightAnchor];
  unint64_t v33 = [(TUISuggestionCandidateCell *)self contentView];
  unint64_t v34 = [v33 rightAnchor];
  v35 = [v32 constraintEqualToAnchor:v34];
  rightPaddingConstraint = self->_rightPaddingConstraint;
  self->_rightPaddingConstraint = v35;

  [(NSLayoutConstraint *)self->_topPaddingConstraint setActive:1];
  [(NSLayoutConstraint *)self->_leftPaddingConstraint setActive:1];
  [(NSLayoutConstraint *)self->_bottomPaddingConstraint setActive:1];
  [(NSLayoutConstraint *)self->_rightPaddingConstraint setActive:1];
  uint64_t v37 = [(UILayoutGuide *)self->_centeredContainer centerXAnchor];
  uint64_t v38 = [(UILayoutGuide *)self->_paddedContainer centerXAnchor];
  char v39 = [v37 constraintEqualToAnchor:v38];
  [v39 setActive:1];

  v40 = [(UILayoutGuide *)self->_centeredContainer centerYAnchor];
  uint64_t v41 = [(UILayoutGuide *)self->_paddedContainer centerYAnchor];
  BOOL v42 = [v40 constraintEqualToAnchor:v41];
  [v42 setActive:1];

  double v43 = [(UIImageView *)self->_iconImageView leadingAnchor];
  double v44 = [(UILayoutGuide *)self->_centeredContainer leadingAnchor];
  double v45 = [v43 constraintEqualToAnchor:v44];
  [v45 setActive:1];

  v46 = [(UIImageView *)self->_iconImageView centerYAnchor];
  v47 = [(UILayoutGuide *)self->_centeredContainer centerYAnchor];
  v48 = [v46 constraintEqualToAnchor:v47];
  [v48 setActive:1];

  v49 = [(UILabel *)self->_textLabel leadingAnchor];
  id v50 = [(UIImageView *)self->_iconImageView trailingAnchor];
  v51 = [v49 constraintEqualToAnchor:v50];
  paddingBetweenConstraint = self->_paddingBetweenConstraint;
  self->_paddingBetweenConstraint = v51;

  [(NSLayoutConstraint *)self->_paddingBetweenConstraint setActive:1];
  uint64_t v53 = [(UILabel *)self->_textLabel trailingAnchor];
  uint64_t v54 = [(UILayoutGuide *)self->_centeredContainer trailingAnchor];
  id v55 = [v53 constraintEqualToAnchor:v54];
  [v55 setActive:1];

  id v58 = [(UILabel *)self->_textLabel centerYAnchor];
  v56 = [(UILayoutGuide *)self->_centeredContainer centerYAnchor];
  v57 = [v58 constraintEqualToAnchor:v56];
  [v57 setActive:1];
}

+ (id)reuseIdentifier
{
  return @"TUISuggestionCandidateCell";
}

@end