@interface OBSetupAssistantSpinnerController
- (BOOL)_shouldUseScrollView;
- (BOOL)isActivityIndicatorHidden;
- (OBPrivacyLinkController)privacyLinkController;
- (OBSetupAssistantSpinnerController)initWithSpinnerText:(id)a3;
- (UIActivityIndicatorView)activityIndicator;
- (UILabel)label;
- (UIScrollView)scrollView;
- (UIView)scrollContentView;
- (id)_textStyle;
- (int64_t)_activityIndicatorViewStyle;
- (void)_updateLayout;
- (void)_updateTextColor;
- (void)loadView;
- (void)setActivityIndicator:(id)a3;
- (void)setActivityIndicatorHidden:(BOOL)a3;
- (void)setLabel:(id)a3;
- (void)setPrivacyLinkController:(id)a3;
- (void)setScrollContentView:(id)a3;
- (void)setScrollView:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateDirectionalLayoutMargins;
- (void)viewDidLayoutSubviews;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation OBSetupAssistantSpinnerController

- (OBSetupAssistantSpinnerController)initWithSpinnerText:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)OBSetupAssistantSpinnerController;
  v5 = [(OBSetupAssistantSpinnerController *)&v14 initWithNibName:0 bundle:0];
  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x1E4FB1930]);
    uint64_t v7 = objc_msgSend(v6, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    label = v5->_label;
    v5->_label = (UILabel *)v7;

    [(UILabel *)v5->_label setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v5->_label setNumberOfLines:0];
    v9 = (void *)MEMORY[0x1E4FB08E0];
    v10 = [(OBSetupAssistantSpinnerController *)v5 _textStyle];
    v11 = [v9 preferredFontForTextStyle:v10];
    [(UILabel *)v5->_label setFont:v11];

    v12 = (void *)[v4 copy];
    [(UILabel *)v5->_label setText:v12];
  }
  return v5;
}

- (void)loadView
{
  v5.receiver = self;
  v5.super_class = (Class)OBSetupAssistantSpinnerController;
  [(OBBaseWelcomeController *)&v5 loadView];
  v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1400]), "initWithActivityIndicatorStyle:", -[OBSetupAssistantSpinnerController _activityIndicatorViewStyle](self, "_activityIndicatorViewStyle"));
  [(OBSetupAssistantSpinnerController *)self setActivityIndicator:v3];

  id v4 = [(OBSetupAssistantSpinnerController *)self activityIndicator];
  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];

  [(OBSetupAssistantSpinnerController *)self _updateLayout];
  [(OBSetupAssistantSpinnerController *)self _updateTextColor];
}

- (void)viewDidLayoutSubviews
{
  v61[9] = *MEMORY[0x1E4F143B8];
  v60.receiver = self;
  v60.super_class = (Class)OBSetupAssistantSpinnerController;
  [(OBBaseWelcomeController *)&v60 viewDidLayoutSubviews];
  v3 = [(OBSetupAssistantSpinnerController *)self scrollView];
  if (v3)
  {
  }
  else if ([(OBSetupAssistantSpinnerController *)self _shouldUseScrollView])
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4FB1BE0]);
    [(OBSetupAssistantSpinnerController *)self setScrollView:v4];

    objc_super v5 = [(OBSetupAssistantSpinnerController *)self scrollView];
    [v5 setTranslatesAutoresizingMaskIntoConstraints:0];

    id v6 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    uint64_t v7 = objc_msgSend(v6, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    [(OBSetupAssistantSpinnerController *)self setScrollContentView:v7];

    v8 = [(OBSetupAssistantSpinnerController *)self scrollContentView];
    [v8 setTranslatesAutoresizingMaskIntoConstraints:0];

    v9 = [(OBSetupAssistantSpinnerController *)self view];
    v10 = [(OBSetupAssistantSpinnerController *)self scrollView];
    [v9 addSubview:v10];

    v11 = [(OBSetupAssistantSpinnerController *)self scrollView];
    v12 = [(OBSetupAssistantSpinnerController *)self scrollContentView];
    [v11 addSubview:v12];

    v39 = (void *)MEMORY[0x1E4F28DC8];
    v59 = [(OBSetupAssistantSpinnerController *)self view];
    v57 = [v59 topAnchor];
    v58 = [(OBSetupAssistantSpinnerController *)self scrollView];
    v56 = [v58 topAnchor];
    v55 = [v57 constraintEqualToAnchor:v56];
    v61[0] = v55;
    v54 = [(OBSetupAssistantSpinnerController *)self view];
    v52 = [v54 rightAnchor];
    v53 = [(OBSetupAssistantSpinnerController *)self scrollView];
    v51 = [v53 rightAnchor];
    v50 = [v52 constraintEqualToAnchor:v51];
    v61[1] = v50;
    v49 = [(OBSetupAssistantSpinnerController *)self view];
    v47 = [v49 bottomAnchor];
    v48 = [(OBSetupAssistantSpinnerController *)self scrollView];
    v46 = [v48 bottomAnchor];
    v45 = [v47 constraintEqualToAnchor:v46];
    v61[2] = v45;
    v44 = [(OBSetupAssistantSpinnerController *)self view];
    v42 = [v44 leftAnchor];
    v43 = [(OBSetupAssistantSpinnerController *)self scrollView];
    v41 = [v43 leftAnchor];
    v40 = [v42 constraintEqualToAnchor:v41];
    v61[3] = v40;
    v38 = [(OBSetupAssistantSpinnerController *)self scrollContentView];
    v36 = [v38 topAnchor];
    v37 = [(OBSetupAssistantSpinnerController *)self scrollView];
    v35 = [v37 topAnchor];
    v34 = [v36 constraintEqualToAnchor:v35];
    v61[4] = v34;
    v33 = [(OBSetupAssistantSpinnerController *)self scrollContentView];
    v31 = [v33 rightAnchor];
    v32 = [(OBSetupAssistantSpinnerController *)self scrollView];
    v30 = [v32 rightAnchor];
    v29 = [v31 constraintEqualToAnchor:v30];
    v61[5] = v29;
    v28 = [(OBSetupAssistantSpinnerController *)self scrollContentView];
    v26 = [v28 bottomAnchor];
    v27 = [(OBSetupAssistantSpinnerController *)self scrollView];
    v25 = [v27 bottomAnchor];
    v24 = [v26 constraintEqualToAnchor:v25];
    v61[6] = v24;
    v23 = [(OBSetupAssistantSpinnerController *)self scrollContentView];
    v22 = [v23 leftAnchor];
    v13 = [(OBSetupAssistantSpinnerController *)self scrollView];
    objc_super v14 = [v13 leftAnchor];
    v15 = [v22 constraintEqualToAnchor:v14];
    v61[7] = v15;
    v16 = [(OBSetupAssistantSpinnerController *)self scrollContentView];
    v17 = [v16 widthAnchor];
    v18 = [(OBSetupAssistantSpinnerController *)self scrollView];
    v19 = [v18 widthAnchor];
    v20 = [v17 constraintEqualToAnchor:v19];
    v61[8] = v20;
    v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v61 count:9];
    [v39 activateConstraints:v21];

    [(OBSetupAssistantSpinnerController *)self _updateLayout];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)OBSetupAssistantSpinnerController;
  [(OBSetupAssistantSpinnerController *)&v5 viewWillAppear:a3];
  if (![(OBSetupAssistantSpinnerController *)self isActivityIndicatorHidden])
  {
    id v4 = [(OBSetupAssistantSpinnerController *)self activityIndicator];
    [v4 startAnimating];
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)OBSetupAssistantSpinnerController;
  [(OBSetupAssistantSpinnerController *)&v5 viewWillDisappear:a3];
  id v4 = [(OBSetupAssistantSpinnerController *)self activityIndicator];
  [v4 stopAnimating];
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4FB08E0];
  objc_super v5 = [(OBSetupAssistantSpinnerController *)self _textStyle];
  id v6 = [v4 preferredFontForTextStyle:v5];
  uint64_t v7 = [(OBSetupAssistantSpinnerController *)self label];
  [v7 setFont:v6];

  [(OBSetupAssistantSpinnerController *)self _updateLayout];
}

- (void)setActivityIndicatorHidden:(BOOL)a3
{
  BOOL v3 = a3;
  self->_activityIndicatorHidden = a3;
  objc_super v5 = [(OBSetupAssistantSpinnerController *)self activityIndicator];
  id v6 = v5;
  if (v3) {
    [v5 stopAnimating];
  }
  else {
    [v5 startAnimating];
  }

  [(OBSetupAssistantSpinnerController *)self _updateTextColor];
}

- (void)setPrivacyLinkController:(id)a3
{
  id v6 = a3;
  objc_storeStrong((id *)&self->_privacyLinkController, a3);
  [v6 willMoveToParentViewController:self];
  [(OBSetupAssistantSpinnerController *)self addChildViewController:v6];
  [v6 didMoveToParentViewController:self];
  objc_super v5 = [v6 view];
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];

  if ([(OBSetupAssistantSpinnerController *)self isViewLoaded]) {
    [(OBSetupAssistantSpinnerController *)self _updateLayout];
  }
}

- (void)updateDirectionalLayoutMargins
{
  v15.receiver = self;
  v15.super_class = (Class)OBSetupAssistantSpinnerController;
  [(OBBaseWelcomeController *)&v15 updateDirectionalLayoutMargins];
  BOOL v3 = [(OBSetupAssistantSpinnerController *)self scrollContentView];
  [v3 directionalLayoutMargins];
  double v5 = v4;
  double v7 = v6;

  v8 = [(OBSetupAssistantSpinnerController *)self view];
  [v8 directionalLayoutMargins];
  double v10 = v9;

  v11 = [(OBSetupAssistantSpinnerController *)self view];
  [v11 directionalLayoutMargins];
  double v13 = v12;

  objc_super v14 = [(OBSetupAssistantSpinnerController *)self scrollContentView];
  objc_msgSend(v14, "setDirectionalLayoutMargins:", v5, v10, v7, v13);
}

- (id)_textStyle
{
  return (id)*MEMORY[0x1E4FB28C8];
}

- (void)_updateTextColor
{
  if ([(OBSetupAssistantSpinnerController *)self isActivityIndicatorHidden]) {
    [MEMORY[0x1E4FB1618] secondaryLabelColor];
  }
  else {
  id v4 = [MEMORY[0x1E4FB1618] labelColor];
  }
  BOOL v3 = [(OBSetupAssistantSpinnerController *)self label];
  [v3 setTextColor:v4];
}

- (void)_updateLayout
{
  v139[5] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(OBSetupAssistantSpinnerController *)self activityIndicator];
  [v3 removeFromSuperview];

  id v4 = [(OBSetupAssistantSpinnerController *)self label];
  [v4 removeFromSuperview];

  double v5 = [(OBSetupAssistantSpinnerController *)self privacyLinkController];
  double v6 = [v5 view];
  [v6 removeFromSuperview];

  BOOL v7 = [(OBSetupAssistantSpinnerController *)self _shouldUseScrollView];
  v8 = [(OBSetupAssistantSpinnerController *)self view];
  if (v7)
  {
    uint64_t v9 = [(OBSetupAssistantSpinnerController *)self scrollContentView];

    v8 = (void *)v9;
  }
  double v10 = [(OBSetupAssistantSpinnerController *)self activityIndicator];
  [v8 addSubview:v10];

  v11 = [(OBSetupAssistantSpinnerController *)self label];
  [v8 addSubview:v11];

  double v12 = [(OBSetupAssistantSpinnerController *)self privacyLinkController];
  double v13 = [v12 view];
  [v8 addSubview:v13];

  int64_t v14 = [(OBSetupAssistantSpinnerController *)self _activityIndicatorViewStyle];
  objc_super v15 = [(OBSetupAssistantSpinnerController *)self activityIndicator];
  [v15 setActivityIndicatorViewStyle:v14];

  LODWORD(v15) = +[OBViewUtilities shouldUseAccessibilityLayout];
  v16 = [(OBSetupAssistantSpinnerController *)self label];
  v17 = v16;
  v132 = v8;
  if (!v15)
  {
    [v16 setTextAlignment:1];

    v91 = (void *)MEMORY[0x1E4F28DC8];
    v130 = [(OBSetupAssistantSpinnerController *)self activityIndicator];
    v122 = [v130 bottomAnchor];
    v126 = [(OBSetupAssistantSpinnerController *)self label];
    v118 = [v126 topAnchor];
    v114 = [v122 constraintEqualToAnchor:v118 constant:-16.0];
    v135[0] = v114;
    v110 = [(OBSetupAssistantSpinnerController *)self activityIndicator];
    v106 = [v110 centerXAnchor];
    v102 = [v8 centerXAnchor];
    v98 = [v106 constraintEqualToAnchor:v102];
    v135[1] = v98;
    v94 = [(OBSetupAssistantSpinnerController *)self label];
    v86 = [v94 leftAnchor];
    v88 = [v8 layoutMarginsGuide];
    v84 = [v88 leftAnchor];
    v82 = [v86 constraintEqualToAnchor:v84];
    v135[2] = v82;
    v80 = [(OBSetupAssistantSpinnerController *)self label];
    v54 = [v80 rightAnchor];
    v55 = [v8 layoutMarginsGuide];
    v56 = [v55 rightAnchor];
    v57 = [v54 constraintEqualToAnchor:v56];
    v135[3] = v57;
    v58 = [(OBSetupAssistantSpinnerController *)self label];
    v59 = [v58 centerYAnchor];
    objc_super v60 = [v8 centerYAnchor];
    v61 = [v59 constraintEqualToAnchor:v60];
    v135[4] = v61;
    v62 = [MEMORY[0x1E4F1C978] arrayWithObjects:v135 count:5];
    [v91 activateConstraints:v62];

    v63 = [(OBSetupAssistantSpinnerController *)self privacyLinkController];

    v64 = (void *)MEMORY[0x1E4F28DC8];
    if (v63)
    {
      v131 = [(OBSetupAssistantSpinnerController *)self privacyLinkController];
      v127 = [v131 view];
      v123 = [v127 leftAnchor];
      v119 = [v132 layoutMarginsGuide];
      uint64_t v115 = [v119 leftAnchor];
      v40 = [v123 constraintEqualToAnchor:v115];
      v134[0] = v40;
      v111 = [(OBSetupAssistantSpinnerController *)self privacyLinkController];
      v107 = [v111 view];
      v99 = [v107 rightAnchor];
      v103 = [v132 layoutMarginsGuide];
      v95 = [v103 rightAnchor];
      [v99 constraintEqualToAnchor:v95];
      v66 = v65 = v64;
      v134[1] = v66;
      v67 = [(OBSetupAssistantSpinnerController *)self privacyLinkController];
      v68 = [v67 view];
      v69 = [v68 bottomAnchor];
      v70 = [v132 layoutMarginsGuide];
      v71 = [v70 bottomAnchor];
      v72 = [v69 constraintEqualToAnchor:v71];
      v134[2] = v72;
      v73 = [MEMORY[0x1E4F1C978] arrayWithObjects:v134 count:3];
      [v65 activateConstraints:v73];

      v51 = v127;
      v49 = (void *)v115;

      v50 = v119;
      v52 = v123;

      v53 = v131;
      v39 = v132;
      goto LABEL_13;
    }
    v53 = [(OBSetupAssistantSpinnerController *)self label];
    v51 = [v53 bottomAnchor];
    v39 = v132;
    v52 = [v132 layoutMarginsGuide];
    v50 = [v52 bottomAnchor];
    v49 = [v51 constraintLessThanOrEqualToAnchor:v50];
    v133 = v49;
    v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v133 count:1];
    v75 = v64;
LABEL_12:
    [v75 activateConstraints:v40];
    goto LABEL_13;
  }
  BOOL v76 = v7;
  [v16 setTextAlignment:4];

  v18 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v18 bounds];
  double v20 = v19 * 0.09;

  v87 = (void *)MEMORY[0x1E4F28DC8];
  v128 = [(OBSetupAssistantSpinnerController *)self activityIndicator];
  v120 = [v128 topAnchor];
  v124 = [v8 layoutMarginsGuide];
  v116 = [v124 topAnchor];
  v112 = [v120 constraintEqualToAnchor:v116 constant:v20];
  v139[0] = v112;
  v108 = [(OBSetupAssistantSpinnerController *)self activityIndicator];
  v100 = [v108 leadingAnchor];
  v104 = [v8 layoutMarginsGuide];
  v96 = [v104 leadingAnchor];
  v92 = [v100 constraintEqualToAnchor:v96];
  v139[1] = v92;
  v89 = [(OBSetupAssistantSpinnerController *)self label];
  v83 = [v89 topAnchor];
  v85 = [(OBSetupAssistantSpinnerController *)self activityIndicator];
  v81 = [v85 bottomAnchor];
  v79 = [v83 constraintEqualToAnchor:v81 constant:37.0];
  v139[2] = v79;
  v78 = [(OBSetupAssistantSpinnerController *)self label];
  v77 = [v78 leftAnchor];
  v21 = [v8 layoutMarginsGuide];
  v22 = [v21 leftAnchor];
  v23 = [v77 constraintEqualToAnchor:v22];
  v139[3] = v23;
  v24 = [(OBSetupAssistantSpinnerController *)self label];
  v25 = [v24 rightAnchor];
  v26 = [v8 layoutMarginsGuide];
  v27 = [v26 rightAnchor];
  v28 = [v25 constraintEqualToAnchor:v27];
  v139[4] = v28;
  v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v139 count:5];
  [v87 activateConstraints:v29];

  v30 = [(OBSetupAssistantSpinnerController *)self privacyLinkController];

  if (!v30)
  {
    v74 = (void *)MEMORY[0x1E4F28DC8];
    v53 = [(OBSetupAssistantSpinnerController *)self label];
    v51 = [v53 bottomAnchor];
    v39 = v132;
    v52 = [v132 layoutMarginsGuide];
    v50 = [v52 bottomAnchor];
    v49 = [v51 constraintLessThanOrEqualToAnchor:v50];
    v136 = v49;
    v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v136 count:1];
    v75 = v74;
    goto LABEL_12;
  }
  if (v76)
  {
    v31 = (void *)MEMORY[0x1E4F28DC8];
    v32 = [(OBSetupAssistantSpinnerController *)self privacyLinkController];
    v33 = [v32 view];
    v34 = [v33 topAnchor];
    v35 = [(OBSetupAssistantSpinnerController *)self label];
    v36 = [v35 bottomAnchor];
    v37 = [v34 constraintEqualToAnchor:v36 constant:20.0];
    v138 = v37;
    v38 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v138 count:1];
    [v31 activateConstraints:v38];
  }
  v105 = (void *)MEMORY[0x1E4F28DC8];
  v129 = [(OBSetupAssistantSpinnerController *)self privacyLinkController];
  v125 = [v129 view];
  v121 = [v125 leftAnchor];
  v39 = v132;
  v117 = [v132 layoutMarginsGuide];
  uint64_t v113 = [v117 leftAnchor];
  v40 = [v121 constraintEqualToAnchor:v113];
  v137[0] = v40;
  v109 = [(OBSetupAssistantSpinnerController *)self privacyLinkController];
  v101 = [v109 view];
  v93 = [v101 rightAnchor];
  v97 = [v132 layoutMarginsGuide];
  v90 = [v97 rightAnchor];
  v41 = [v93 constraintEqualToAnchor:v90];
  v137[1] = v41;
  v42 = [(OBSetupAssistantSpinnerController *)self privacyLinkController];
  v43 = [v42 view];
  v44 = [v43 bottomAnchor];
  v45 = [v132 layoutMarginsGuide];
  v46 = [v45 bottomAnchor];
  v47 = [v44 constraintEqualToAnchor:v46];
  v137[2] = v47;
  v48 = [MEMORY[0x1E4F1C978] arrayWithObjects:v137 count:3];
  [v105 activateConstraints:v48];

  v49 = (void *)v113;
  v50 = v117;

  v51 = v125;
  v52 = v121;

  v53 = v129;
LABEL_13:
}

- (int64_t)_activityIndicatorViewStyle
{
  if (+[OBViewUtilities shouldUseAccessibilityLayout]) {
    return 101;
  }
  else {
    return 100;
  }
}

- (BOOL)_shouldUseScrollView
{
  BOOL v3 = [(OBSetupAssistantSpinnerController *)self privacyLinkController];

  if (!v3) {
    return 0;
  }
  id v4 = [(OBSetupAssistantSpinnerController *)self scrollView];

  if (v4) {
    return 1;
  }
  double v6 = [(OBSetupAssistantSpinnerController *)self label];
  [v6 frame];
  double MaxY = CGRectGetMaxY(v11);
  v8 = [(OBSetupAssistantSpinnerController *)self privacyLinkController];
  uint64_t v9 = [v8 view];
  [v9 frame];
  BOOL v5 = MaxY > CGRectGetMinY(v12);

  return v5;
}

- (BOOL)isActivityIndicatorHidden
{
  return self->_activityIndicatorHidden;
}

- (OBPrivacyLinkController)privacyLinkController
{
  return self->_privacyLinkController;
}

- (UILabel)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (UIActivityIndicatorView)activityIndicator
{
  return self->_activityIndicator;
}

- (void)setActivityIndicator:(id)a3
{
}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

- (void)setScrollView:(id)a3
{
}

- (UIView)scrollContentView
{
  return self->_scrollContentView;
}

- (void)setScrollContentView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scrollContentView, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_activityIndicator, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_privacyLinkController, 0);
}

@end