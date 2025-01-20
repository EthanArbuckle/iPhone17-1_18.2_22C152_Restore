@interface SFPrivacyReportOverviewCellContentView
- (SFPrivacyReportOverviewCellContentView)initWithFrame:(CGRect)a3;
- (UILabel)subtitleLabel;
- (UILabel)titleLabel;
@end

@implementation SFPrivacyReportOverviewCellContentView

- (SFPrivacyReportOverviewCellContentView)initWithFrame:(CGRect)a3
{
  v52[8] = *MEMORY[0x1E4F143B8];
  v51.receiver = self;
  v51.super_class = (Class)SFPrivacyReportOverviewCellContentView;
  v3 = -[SFPrivacyReportOverviewCellView initWithFrame:](&v51, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4FB1930]);
    double v5 = *MEMORY[0x1E4F1DB28];
    double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    uint64_t v9 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], v6, v7, v8);
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = (UILabel *)v9;

    [(UILabel *)v3->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v3->_titleLabel setNumberOfLines:0];
    [(UILabel *)v3->_titleLabel setLineBreakMode:0];
    [(UILabel *)v3->_titleLabel setLineBreakStrategy:1];
    v11 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
    [(UILabel *)v3->_titleLabel setFont:v11];

    [(UILabel *)v3->_titleLabel setAdjustsFontForContentSizeCategory:1];
    v12 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [(UILabel *)v3->_titleLabel setTextColor:v12];

    uint64_t v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", v5, v6, v7, v8);
    subtitleLabel = v3->_subtitleLabel;
    v3->_subtitleLabel = (UILabel *)v13;

    [(UILabel *)v3->_subtitleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v3->_subtitleLabel setNumberOfLines:0];
    [(UILabel *)v3->_subtitleLabel setLineBreakMode:0];
    [(UILabel *)v3->_subtitleLabel setLineBreakStrategy:1];
    v15 = [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4FB2998]];
    v50 = [v15 fontDescriptorWithSymbolicTraits:2];

    v16 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v50 size:0.0];
    [(UILabel *)v3->_subtitleLabel setFont:v16];

    [(UILabel *)v3->_subtitleLabel setAdjustsFontForContentSizeCategory:1];
    [(SFPrivacyReportOverviewCellContentView *)v3 addSubview:v3->_titleLabel];
    [(SFPrivacyReportOverviewCellContentView *)v3 addSubview:v3->_subtitleLabel];
    v17 = [(SFPrivacyReportOverviewCellContentView *)v3 layoutMarginsGuide];
    v40 = (void *)MEMORY[0x1E4F28DC8];
    v49 = [(UILabel *)v3->_titleLabel topAnchor];
    v48 = [v17 topAnchor];
    v47 = [v49 constraintEqualToAnchor:v48];
    v52[0] = v47;
    v46 = [(UILabel *)v3->_titleLabel leadingAnchor];
    v18 = v17;
    v45 = [v17 leadingAnchor];
    v44 = [v46 constraintEqualToAnchor:v45];
    v52[1] = v44;
    v43 = [(UILabel *)v3->_titleLabel centerXAnchor];
    v42 = [(SFPrivacyReportOverviewCellContentView *)v3 centerXAnchor];
    v41 = [v43 constraintEqualToAnchor:v42];
    v52[2] = v41;
    v39 = [(UILabel *)v3->_subtitleLabel topAnchor];
    v38 = [(UILabel *)v3->_titleLabel bottomAnchor];
    v37 = [v39 constraintGreaterThanOrEqualToAnchor:v38 constant:4.0];
    v52[3] = v37;
    v19 = [(UILabel *)v3->_subtitleLabel topAnchor];
    v20 = [(UILabel *)v3->_titleLabel bottomAnchor];
    v21 = [v19 constraintEqualToAnchor:v20 constant:4.0];

    LODWORD(v22) = 1131413504;
    [v21 setPriority:v22];
    v52[4] = v21;
    v35 = [(UILabel *)v3->_subtitleLabel leadingAnchor];
    v36 = v18;
    v23 = v18;
    v34 = [v18 leadingAnchor];
    v24 = [v35 constraintEqualToAnchor:v34];
    v52[5] = v24;
    v25 = [(UILabel *)v3->_subtitleLabel centerXAnchor];
    v26 = [(SFPrivacyReportOverviewCellContentView *)v3 centerXAnchor];
    v27 = [v25 constraintEqualToAnchor:v26];
    v52[6] = v27;
    v28 = [(UILabel *)v3->_subtitleLabel bottomAnchor];
    v29 = [v23 bottomAnchor];
    v30 = [v28 constraintEqualToAnchor:v29];
    v52[7] = v30;
    v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v52 count:8];
    [v40 activateConstraints:v31];

    v32 = v3;
  }

  return v3;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (UILabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitleLabel, 0);

  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end