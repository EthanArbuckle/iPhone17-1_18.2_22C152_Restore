@interface SFQuickLookDocumentInfoView
- (NSString)fileName;
- (NSString)fileSize;
- (NSString)fileType;
- (SFQuickLookDocumentInfoView)initWithFrame:(CGRect)a3;
- (UIImageView)iconImageView;
- (void)_updateDocumentSizeLabel;
- (void)_updateOrientationBasedConstraints;
- (void)_updatePropertiesDefinedByContentSizeCategory;
- (void)setFileName:(id)a3;
- (void)setFileSize:(id)a3;
- (void)setFileType:(id)a3;
- (void)setIconImageView:(id)a3;
@end

@implementation SFQuickLookDocumentInfoView

- (SFQuickLookDocumentInfoView)initWithFrame:(CGRect)a3
{
  v48[7] = *MEMORY[0x1E4F143B8];
  v46.receiver = self;
  v46.super_class = (Class)SFQuickLookDocumentInfoView;
  v3 = -[SFQuickLookDocumentInfoView initWithFrame:](&v46, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UIStackView *)objc_alloc_init(MEMORY[0x1E4FB1C60]);
    stackView = v3->_stackView;
    v3->_stackView = v4;

    [(UIStackView *)v3->_stackView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIStackView *)v3->_stackView setAxis:1];
    [(UIStackView *)v3->_stackView setSpacing:3.0];
    [(UIStackView *)v3->_stackView setAlignment:3];
    [(UIStackView *)v3->_stackView setSpacing:24.0];
    [(UIStackView *)v3->_stackView setBaselineRelativeArrangement:1];
    [(UIStackView *)v3->_stackView setDistribution:0];
    [(SFQuickLookDocumentInfoView *)v3 addSubview:v3->_stackView];
    v6 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
    iconImageView = v3->_iconImageView;
    v3->_iconImageView = v6;

    [(UIImageView *)v3->_iconImageView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIImageView *)v3->_iconImageView setContentMode:1];
    [(UIImageView *)v3->_iconImageView setAccessibilityIgnoresInvertColors:1];
    [(UIStackView *)v3->_stackView addArrangedSubview:v3->_iconImageView];
    v8 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    spacingView = v3->_spacingView;
    v3->_spacingView = v8;

    [(UIView *)v3->_spacingView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIStackView *)v3->_stackView addArrangedSubview:v3->_spacingView];
    v10 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    fileNameLabel = v3->_fileNameLabel;
    v3->_fileNameLabel = v10;

    [(UILabel *)v3->_fileNameLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v3->_fileNameLabel setLineBreakMode:5];
    v12 = [MEMORY[0x1E4FB1618] labelColor];
    [(UILabel *)v3->_fileNameLabel setTextColor:v12];

    [(UIStackView *)v3->_stackView addArrangedSubview:v3->_fileNameLabel];
    v13 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    fileSizeLabel = v3->_fileSizeLabel;
    v3->_fileSizeLabel = v13;

    [(UILabel *)v3->_fileSizeLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v15 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [(UILabel *)v3->_fileSizeLabel setTextColor:v15];

    [(UIStackView *)v3->_stackView addArrangedSubview:v3->_fileSizeLabel];
    v16 = [(UIImageView *)v3->_iconImageView heightAnchor];
    uint64_t v17 = [v16 constraintEqualToConstant:0.0];
    iconHeightConstraint = v3->_iconHeightConstraint;
    v3->_iconHeightConstraint = (NSLayoutConstraint *)v17;

    v19 = [(UIImageView *)v3->_iconImageView widthAnchor];
    uint64_t v20 = [v19 constraintEqualToConstant:0.0];
    iconWidthConstraint = v3->_iconWidthConstraint;
    v3->_iconWidthConstraint = (NSLayoutConstraint *)v20;

    v22 = [(UIView *)v3->_spacingView heightAnchor];
    uint64_t v23 = [v22 constraintEqualToConstant:0.0];
    lineHeightBetweenIconAndFileNameLabelConstraint = v3->_lineHeightBetweenIconAndFileNameLabelConstraint;
    v3->_lineHeightBetweenIconAndFileNameLabelConstraint = (NSLayoutConstraint *)v23;

    v40 = (void *)MEMORY[0x1E4F28DC8];
    v45 = [(UIStackView *)v3->_stackView widthAnchor];
    v44 = [(SFQuickLookDocumentInfoView *)v3 widthAnchor];
    v43 = [v45 constraintEqualToAnchor:v44];
    v48[0] = v43;
    v42 = [(UIStackView *)v3->_stackView heightAnchor];
    v41 = [(SFQuickLookDocumentInfoView *)v3 heightAnchor];
    v25 = [v42 constraintEqualToAnchor:v41];
    v48[1] = v25;
    v26 = [(UIStackView *)v3->_stackView centerXAnchor];
    v27 = [(SFQuickLookDocumentInfoView *)v3 centerXAnchor];
    v28 = [v26 constraintEqualToAnchor:v27];
    v48[2] = v28;
    v29 = [(UIStackView *)v3->_stackView centerYAnchor];
    v30 = [(SFQuickLookDocumentInfoView *)v3 centerYAnchor];
    v31 = [v29 constraintEqualToAnchor:v30];
    v48[3] = v31;
    v48[4] = v3->_iconHeightConstraint;
    v48[5] = v3->_iconWidthConstraint;
    v48[6] = v3->_lineHeightBetweenIconAndFileNameLabelConstraint;
    v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:v48 count:7];
    [v40 activateConstraints:v32];

    [(SFQuickLookDocumentInfoView *)v3 _updateOrientationBasedConstraints];
    LODWORD(v33) = 1148846080;
    [(UILabel *)v3->_fileNameLabel setContentCompressionResistancePriority:0 forAxis:v33];
    LODWORD(v34) = 1148846080;
    [(UILabel *)v3->_fileNameLabel setContentHuggingPriority:0 forAxis:v34];
    v35 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v35 addObserver:v3 selector:sel__updatePropertiesDefinedByContentSizeCategory name:*MEMORY[0x1E4FB27A8] object:0];

    [(SFQuickLookDocumentInfoView *)v3 _updatePropertiesDefinedByContentSizeCategory];
    uint64_t v47 = objc_opt_class();
    v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v47 count:1];
    id v37 = (id)[(SFQuickLookDocumentInfoView *)v3 registerForTraitChanges:v36 withTarget:v3 action:sel__updateOrientationBasedConstraints];

    v38 = v3;
  }

  return v3;
}

- (void)_updateOrientationBasedConstraints
{
  v3 = [(SFQuickLookDocumentInfoView *)self traitCollection];
  uint64_t v4 = [v3 verticalSizeClass];

  if (v4 == 1) {
    double v5 = 96.0;
  }
  else {
    double v5 = 128.0;
  }
  if (v4 == 1) {
    double v6 = 16.0;
  }
  else {
    double v6 = 56.0;
  }
  [(NSLayoutConstraint *)self->_iconHeightConstraint setConstant:v5];
  [(NSLayoutConstraint *)self->_iconWidthConstraint setConstant:v5];
  lineHeightBetweenIconAndFileNameLabelConstraint = self->_lineHeightBetweenIconAndFileNameLabelConstraint;

  [(NSLayoutConstraint *)lineHeightBetweenIconAndFileNameLabelConstraint setConstant:v6];
}

- (void)_updatePropertiesDefinedByContentSizeCategory
{
  id v4 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2950]];
  v3 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2990]];
  [(UILabel *)self->_fileNameLabel setFont:v3];

  [(UILabel *)self->_fileSizeLabel setFont:v4];
  [v4 _scaledValueForValue:24.0];
  -[UIStackView setSpacing:](self->_stackView, "setSpacing:");
}

- (void)_updateDocumentSizeLabel
{
  fileType = self->_fileType;
  fileSize = self->_fileSize;
  if (fileType && fileSize)
  {
    double v5 = NSString;
    double v6 = _WBSLocalizedString();
    objc_msgSend(v5, "stringWithFormat:", v6, self->_fileType, self->_fileSize);
    v8 = (NSString *)objc_claimAutoreleasedReturnValue();

    v7 = v8;
  }
  else
  {
    if (fileSize) {
      fileType = self->_fileSize;
    }
    v7 = fileType;
  }
  v9 = v7;
  [(UILabel *)self->_fileSizeLabel setText:v7];
}

- (void)setFileName:(id)a3
{
  p_fileName = &self->_fileName;
  id v6 = a3;
  if (([v6 isEqualToString:*p_fileName] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_fileName, a3);
    [(UILabel *)self->_fileNameLabel setText:*p_fileName];
  }
}

- (void)setFileSize:(id)a3
{
  id v5 = a3;
  if (([v5 isEqualToString:self->_fileSize] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_fileSize, a3);
    [(SFQuickLookDocumentInfoView *)self _updateDocumentSizeLabel];
  }
}

- (void)setFileType:(id)a3
{
  id v5 = a3;
  if (([v5 isEqualToString:self->_fileType] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_fileType, a3);
    [(SFQuickLookDocumentInfoView *)self _updateDocumentSizeLabel];
  }
}

- (UIImageView)iconImageView
{
  return self->_iconImageView;
}

- (void)setIconImageView:(id)a3
{
}

- (NSString)fileName
{
  return self->_fileName;
}

- (NSString)fileSize
{
  return self->_fileSize;
}

- (NSString)fileType
{
  return self->_fileType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileType, 0);
  objc_storeStrong((id *)&self->_fileSize, 0);
  objc_storeStrong((id *)&self->_fileName, 0);
  objc_storeStrong((id *)&self->_iconImageView, 0);
  objc_storeStrong((id *)&self->_lineHeightBetweenIconAndFileNameLabelConstraint, 0);
  objc_storeStrong((id *)&self->_iconWidthConstraint, 0);
  objc_storeStrong((id *)&self->_iconHeightConstraint, 0);
  objc_storeStrong((id *)&self->_spacingView, 0);
  objc_storeStrong((id *)&self->_fileSizeLabel, 0);
  objc_storeStrong((id *)&self->_fileNameLabel, 0);

  objc_storeStrong((id *)&self->_stackView, 0);
}

@end