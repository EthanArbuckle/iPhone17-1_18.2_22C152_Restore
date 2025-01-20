@interface PXActivityProgressViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)showCheckmarkOnCompletion;
- (NSString)primaryText;
- (NSString)secondaryText;
- (double)fractionCompleted;
- (id)_checkmarkView;
- (id)_primaryLabel;
- (id)_progressView;
- (id)_secondaryLabel;
- (void)_updatePrimaryLabel;
- (void)_updateSecondaryLabel;
- (void)_updateViewVisibility;
- (void)reset;
- (void)setFractionCompleted:(double)a3;
- (void)setPrimaryText:(id)a3;
- (void)setSecondaryText:(id)a3;
- (void)setShowCheckmarkOnCompletion:(BOOL)a3;
- (void)updateViewConstraints;
@end

@implementation PXActivityProgressViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentConstraints, 0);
  objc_storeStrong((id *)&self->_labelConstraints, 0);
  objc_storeStrong((id *)&self->_secondaryText, 0);
  objc_storeStrong((id *)&self->_primaryText, 0);
  objc_storeStrong((id *)&self->_separatorView, 0);
  objc_storeStrong((id *)&self->_checkmarkView, 0);
  objc_storeStrong((id *)&self->_progressView, 0);
  objc_storeStrong((id *)&self->_secondaryLabel, 0);
  objc_storeStrong((id *)&self->_primaryLabel, 0);
}

- (double)fractionCompleted
{
  return self->_fractionCompleted;
}

- (void)setShowCheckmarkOnCompletion:(BOOL)a3
{
  self->_showCheckmarkOnCompletion = a3;
}

- (BOOL)showCheckmarkOnCompletion
{
  return self->_showCheckmarkOnCompletion;
}

- (NSString)secondaryText
{
  return self->_secondaryText;
}

- (NSString)primaryText
{
  return self->_primaryText;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)reset
{
  id v4 = [(PXActivityProgressViewController *)self _progressView];
  [v4 prepareForReuse];
  [v4 setHidden:0];
  v3 = [(PXActivityProgressViewController *)self _checkmarkView];
  [v3 setHidden:1];
}

- (void)updateViewConstraints
{
  v69[13] = *MEMORY[0x1E4F143B8];
  v68.receiver = self;
  v68.super_class = (Class)PXActivityProgressViewController;
  [(PXActivityProgressViewController *)&v68 updateViewConstraints];
  v3 = [(PXActivityProgressViewController *)self view];
  id v4 = [(PXActivityProgressViewController *)self _primaryLabel];
  v5 = [(PXActivityProgressViewController *)self _secondaryLabel];
  v66 = [(PXActivityProgressViewController *)self _progressView];
  v67 = [(PXActivityProgressViewController *)self _checkmarkView];
  v6 = [(PXActivityProgressViewController *)self view];
  [v6 removeConstraints:self->_labelConstraints];

  v7 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v8 = [v3 topAnchor];
  if (v4)
  {
    v9 = [v3 centerXAnchor];
    v10 = [v4 centerXAnchor];
    v11 = [v9 constraintEqualToAnchor:v10];
    [(NSArray *)v7 addObject:v11];

    v12 = [v3 topAnchor];
    v13 = [v4 topAnchor];
    v14 = [v12 constraintEqualToAnchor:v13 constant:-18.0];
    [(NSArray *)v7 addObject:v14];

    uint64_t v15 = [v4 lastBaselineAnchor];

    v8 = (void *)v15;
  }
  v64 = v5;
  v65 = v4;
  if (v5)
  {
    v16 = [v3 centerXAnchor];
    v17 = [v5 centerXAnchor];
    v18 = [v16 constraintEqualToAnchor:v17];
    [(NSArray *)v7 addObject:v18];

    v19 = [v5 topAnchor];
    v20 = [v8 constraintEqualToAnchor:v19 constant:-8.0];
    [(NSArray *)v7 addObject:v20];

    uint64_t v21 = [v5 lastBaselineAnchor];

    v8 = (void *)v21;
  }
  v45 = v8;
  [MEMORY[0x1E4F28DC8] activateConstraints:v7];
  labelConstraints = self->_labelConstraints;
  self->_labelConstraints = v7;
  v63 = v7;

  v23 = [(PXActivityProgressViewController *)self view];
  [v23 removeConstraints:self->_contentConstraints];

  id v24 = objc_alloc_init(MEMORY[0x1E4FB1940]);
  [v3 addLayoutGuide:v24];
  v62 = [v3 leadingAnchor];
  v61 = [v24 leadingAnchor];
  v60 = [v62 constraintEqualToAnchor:v61];
  v69[0] = v60;
  v59 = [v3 trailingAnchor];
  v58 = [v24 trailingAnchor];
  v57 = [v59 constraintEqualToAnchor:v58];
  v69[1] = v57;
  v56 = [v24 topAnchor];
  v55 = [v8 constraintEqualToAnchor:v56 constant:0.0];
  v69[2] = v55;
  v54 = [v3 bottomAnchor];
  v53 = [v24 bottomAnchor];
  v51 = [v54 constraintEqualToAnchor:v53];
  v69[3] = v51;
  v50 = [v24 centerXAnchor];
  v49 = [v66 centerXAnchor];
  v48 = [v50 constraintEqualToAnchor:v49];
  v69[4] = v48;
  v46 = [v24 centerYAnchor];
  v44 = [v66 centerYAnchor];
  v43 = [v46 constraintEqualToAnchor:v44];
  v69[5] = v43;
  v42 = [v24 centerXAnchor];
  v41 = [v67 centerXAnchor];
  v40 = [v42 constraintEqualToAnchor:v41];
  v69[6] = v40;
  v38 = [v24 centerYAnchor];
  v37 = [v67 centerYAnchor];
  v36 = [v38 constraintEqualToAnchor:v37];
  v69[7] = v36;
  v35 = [v24 heightAnchor];
  [v35 constraintEqualToConstant:120.0];
  v25 = v52 = v3;
  v69[8] = v25;
  [v66 widthAnchor];
  v26 = v47 = self;
  v27 = [v26 constraintEqualToConstant:40.0];
  v69[9] = v27;
  v28 = [v66 heightAnchor];
  v29 = [v28 constraintEqualToConstant:40.0];
  v69[10] = v29;
  v30 = [v67 widthAnchor];
  v31 = [v30 constraintEqualToConstant:44.0];
  v69[11] = v31;
  v32 = [v67 heightAnchor];
  v33 = [v32 constraintEqualToConstant:44.0];
  v69[12] = v33;
  uint64_t v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:v69 count:13];

  [MEMORY[0x1E4F28DC8] activateConstraints:v39];
  contentConstraints = v47->_contentConstraints;
  v47->_contentConstraints = (NSArray *)v39;
}

- (id)_checkmarkView
{
  checkmarkView = self->_checkmarkView;
  if (!checkmarkView)
  {
    id v4 = [MEMORY[0x1E4FB1830] configurationWithPointSize:40.0];
    v5 = [MEMORY[0x1E4FB1818] systemImageNamed:@"checkmark.circle.fill"];
    v6 = [v5 imageWithSymbolConfiguration:v4];
    v7 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    v8 = objc_msgSend(v6, "px_tintedImageWithColor:", v7);

    v9 = (UIImageView *)[objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v8];
    v10 = self->_checkmarkView;
    self->_checkmarkView = v9;

    [(UIImageView *)self->_checkmarkView setTranslatesAutoresizingMaskIntoConstraints:0];
    v11 = [(PXActivityProgressViewController *)self view];
    [v11 addSubview:self->_checkmarkView];

    [(UIImageView *)self->_checkmarkView setHidden:1];
    checkmarkView = self->_checkmarkView;
  }
  return checkmarkView;
}

- (id)_progressView
{
  progressView = self->_progressView;
  if (!progressView)
  {
    id v4 = -[PXRoundProgressView initWithFrame:style:]([PXRoundProgressView alloc], "initWithFrame:style:", 5, 0.0, 0.0, 40.0, 40.0);
    [(PXRoundProgressView *)v4 setTranslatesAutoresizingMaskIntoConstraints:0];
    v5 = [(PXActivityProgressViewController *)self view];
    [v5 addSubview:v4];

    v6 = self->_progressView;
    self->_progressView = v4;

    progressView = self->_progressView;
  }
  return progressView;
}

- (void)_updateSecondaryLabel
{
  v9[2] = *MEMORY[0x1E4F143B8];
  v3 = [(PXActivityProgressViewController *)self secondaryText];
  if (v3)
  {
    v8[0] = *MEMORY[0x1E4FB06F8];
    id v4 = [MEMORY[0x1E4FB08E0] systemFontOfSize:13.0];
    v9[0] = v4;
    v8[1] = *MEMORY[0x1E4FB0700];
    v5 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    v9[1] = v5;
    v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:2];

    v7 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v3 attributes:v6];
    [(UILabel *)self->_secondaryLabel setAttributedText:v7];
  }
  else
  {
    [(UILabel *)self->_secondaryLabel setAttributedText:0];
  }
}

- (void)_updatePrimaryLabel
{
  v9[2] = *MEMORY[0x1E4F143B8];
  v3 = [(PXActivityProgressViewController *)self primaryText];
  if (v3)
  {
    v8[0] = *MEMORY[0x1E4FB06F8];
    id v4 = [MEMORY[0x1E4FB08E0] boldSystemFontOfSize:17.0];
    v9[0] = v4;
    v8[1] = *MEMORY[0x1E4FB0700];
    v5 = [MEMORY[0x1E4FB1618] labelColor];
    v9[1] = v5;
    v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:2];

    v7 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v3 attributes:v6];
    [(UILabel *)self->_primaryLabel setAttributedText:v7];
  }
  else
  {
    [(UILabel *)self->_primaryLabel setAttributedText:0];
  }
}

- (id)_secondaryLabel
{
  v3 = [(PXActivityProgressViewController *)self secondaryText];
  if (v3 && !self->_secondaryLabel)
  {
    id v4 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    [(UILabel *)v4 setTranslatesAutoresizingMaskIntoConstraints:0];
    v5 = [(PXActivityProgressViewController *)self view];
    [v5 addSubview:v4];

    secondaryLabel = self->_secondaryLabel;
    self->_secondaryLabel = v4;

    [(PXActivityProgressViewController *)self _updateSecondaryLabel];
  }
  v7 = self->_secondaryLabel;

  return v7;
}

- (id)_primaryLabel
{
  v3 = [(PXActivityProgressViewController *)self primaryText];
  if (v3 && !self->_primaryLabel)
  {
    id v4 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    [(UILabel *)v4 setTranslatesAutoresizingMaskIntoConstraints:0];
    v5 = [(PXActivityProgressViewController *)self view];
    [v5 addSubview:v4];

    primaryLabel = self->_primaryLabel;
    self->_primaryLabel = v4;

    [(PXActivityProgressViewController *)self _updatePrimaryLabel];
  }
  v7 = self->_primaryLabel;

  return v7;
}

- (void)_updateViewVisibility
{
  [(PXActivityProgressViewController *)self fractionCompleted];
  double v4 = v3;
  BOOL v5 = [(PXActivityProgressViewController *)self showCheckmarkOnCompletion];
  v6 = [(PXActivityProgressViewController *)self _progressView];
  v7 = v6;
  if (v5 && v4 >= 1.0)
  {
    [v6 setHidden:1];

    v8 = [(PXActivityProgressViewController *)self _checkmarkView];
    id v10 = v8;
    uint64_t v9 = 0;
  }
  else
  {
    [v6 setHidden:0];

    v8 = [(PXActivityProgressViewController *)self _checkmarkView];
    id v10 = v8;
    uint64_t v9 = 1;
  }
  [v8 setHidden:v9];
}

- (void)setFractionCompleted:(double)a3
{
  self->_fractionCompleted = a3;
  BOOL v5 = [(PXActivityProgressViewController *)self _progressView];
  *(float *)&double v6 = a3;
  [v5 setProgress:v6];

  [(PXActivityProgressViewController *)self _updateViewVisibility];
}

- (void)setSecondaryText:(id)a3
{
  id v5 = a3;
  if (!-[NSString isEqualToString:](self->_secondaryText, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_secondaryText, a3);
    [(PXActivityProgressViewController *)self _updateSecondaryLabel];
    [(PXActivityProgressViewController *)self updateViewConstraints];
  }
}

- (void)setPrimaryText:(id)a3
{
  id v5 = a3;
  if (!-[NSString isEqualToString:](self->_primaryText, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_primaryText, a3);
    [(PXActivityProgressViewController *)self _updatePrimaryLabel];
    [(PXActivityProgressViewController *)self updateViewConstraints];
  }
}

@end