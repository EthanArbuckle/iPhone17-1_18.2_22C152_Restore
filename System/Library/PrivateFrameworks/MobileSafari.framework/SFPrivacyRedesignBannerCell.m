@interface SFPrivacyRedesignBannerCell
+ (NSString)reuseIdentifier;
- (SFPrivacyRedesignBannerCell)initWithFrame:(CGRect)a3;
- (UIView)gridAndTitleView;
- (WBSPrivacyReportData)privacyReportData;
- (id)_createGridLabel;
- (void)_changeActionTextForState:(unint64_t)a3;
- (void)_createGrid;
- (void)_updateGridVisibilityIfNeeded;
- (void)_updateState;
- (void)configureUsingBanner:(id)a3;
- (void)gridViewDidUpdateContentSize:(id)a3;
- (void)layoutSubviews;
@end

@implementation SFPrivacyRedesignBannerCell

+ (NSString)reuseIdentifier
{
  return (NSString *)@"SFPrivacyRedesignBannerCell";
}

- (SFPrivacyRedesignBannerCell)initWithFrame:(CGRect)a3
{
  v82[1] = *MEMORY[0x1E4F143B8];
  v79.receiver = self;
  v79.super_class = (Class)SFPrivacyRedesignBannerCell;
  v3 = -[SFStartPageFilledBackgroundCell initWithFrame:](&v79, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v78 = [(SFStartPageFilledBackgroundCell *)v3 defaultBackgroundConfiguration];
    [v78 setCornerRadius:10.0];
    [(SFPrivacyRedesignBannerCell *)v4 setBackgroundConfiguration:v78];
    v5 = [(SFPrivacyRedesignBannerCell *)v4 contentView];
    objc_msgSend(v5, "setLayoutMargins:", 20.0, 20.0, 20.0, 20.0);
    id v6 = objc_alloc_init(MEMORY[0x1E4FB1838]);
    [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
    v7 = [MEMORY[0x1E4FB1818] systemImageNamed:@"shield.lefthalf.fill"];
    [v6 setImage:v7];

    v8 = (void *)MEMORY[0x1E4FB1830];
    v9 = [MEMORY[0x1E4FB1618] systemGreenColor];
    v82[0] = v9;
    v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v82 count:1];
    v77 = [v8 configurationWithPaletteColors:v10];

    [v6 setPreferredSymbolConfiguration:v77];
    v11 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    textLabel = v4->_textLabel;
    v4->_textLabel = v11;

    [(UILabel *)v4->_textLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v4->_textLabel setLineBreakMode:0];
    [(UILabel *)v4->_textLabel setLineBreakStrategy:1];
    [(UILabel *)v4->_textLabel setNumberOfLines:0];
    [(UILabel *)v4->_textLabel setAdjustsFontForContentSizeCategory:1];
    [(SFPrivacyRedesignBannerCell *)v4 _updateState];
    v13 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    actionLabel = v4->_actionLabel;
    v4->_actionLabel = v13;

    [(UILabel *)v4->_actionLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v15 = _WBSLocalizedString();
    [(UILabel *)v4->_actionLabel setText:v15];

    v16 = [MEMORY[0x1E4FB1618] systemBlueColor];
    [(UILabel *)v4->_actionLabel setTextColor:v16];

    id v17 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    [v17 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v17 addSubview:v6];
    [v17 addSubview:v4->_textLabel];
    v18 = v17;
    [v17 addSubview:v4->_actionLabel];
    id v19 = objc_alloc(MEMORY[0x1E4FB1C60]);
    v81 = v18;
    v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v81 count:1];
    uint64_t v21 = [v19 initWithArrangedSubviews:v20];
    privacyCellStackView = v4->_privacyCellStackView;
    v4->_privacyCellStackView = (UIStackView *)v21;

    [(UIStackView *)v4->_privacyCellStackView setAxis:0];
    [(UIStackView *)v4->_privacyCellStackView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIStackView *)v4->_privacyCellStackView setSpacing:8.0];
    LODWORD(v23) = 1144750080;
    [(UIStackView *)v4->_privacyCellStackView setContentCompressionResistancePriority:1 forAxis:v23];
    [(UIStackView *)v4->_privacyCellStackView setDistribution:1];
    v76 = v5;
    [v5 addSubview:v4->_privacyCellStackView];
    v24 = [v5 layoutMarginsGuide];
    v57 = (void *)MEMORY[0x1E4F28DC8];
    v75 = [v6 widthAnchor];
    v74 = [v75 constraintEqualToConstant:56.0];
    v80[0] = v74;
    v73 = [v6 heightAnchor];
    v72 = [v73 constraintEqualToConstant:56.0];
    v80[1] = v72;
    v70 = [v6 leadingAnchor];
    v69 = [v18 leadingAnchor];
    v68 = [v70 constraintEqualToAnchor:v69];
    v80[2] = v68;
    v71 = v6;
    v67 = [v6 topAnchor];
    v66 = [v18 topAnchor];
    v65 = [v67 constraintEqualToAnchor:v66];
    v80[3] = v65;
    v64 = [(UILabel *)v4->_textLabel topAnchor];
    v63 = [v6 bottomAnchor];
    v62 = [v64 constraintGreaterThanOrEqualToAnchor:v63 constant:8.0];
    v80[4] = v62;
    v61 = [(UILabel *)v4->_textLabel leadingAnchor];
    v59 = [v18 leadingAnchor];
    v58 = [v61 constraintEqualToAnchor:v59];
    v80[5] = v58;
    v56 = [(UILabel *)v4->_textLabel trailingAnchor];
    v55 = [v18 trailingAnchor];
    v54 = [v56 constraintEqualToAnchor:v55];
    v80[6] = v54;
    v53 = [(UILabel *)v4->_textLabel centerYAnchor];
    v52 = [v18 centerYAnchor];
    v51 = [v53 constraintEqualToAnchor:v52];
    v80[7] = v51;
    v50 = [(UILabel *)v4->_actionLabel leadingAnchor];
    v60 = v18;
    v48 = [v18 leadingAnchor];
    v47 = [v50 constraintEqualToAnchor:v48];
    v80[8] = v47;
    v46 = [(UILabel *)v4->_actionLabel bottomAnchor];
    v45 = [v18 bottomAnchor];
    v44 = [v46 constraintEqualToAnchor:v45];
    v80[9] = v44;
    v43 = [(UILabel *)v4->_actionLabel widthAnchor];
    v42 = [v43 constraintGreaterThanOrEqualToConstant:50.0];
    v80[10] = v42;
    v41 = [(UIStackView *)v4->_privacyCellStackView leadingAnchor];
    v40 = [v24 leadingAnchor];
    v39 = [v41 constraintEqualToAnchor:v40];
    v80[11] = v39;
    v38 = [(UIStackView *)v4->_privacyCellStackView trailingAnchor];
    v25 = v24;
    v26 = [v24 trailingAnchor];
    v27 = [v38 constraintEqualToAnchor:v26];
    v80[12] = v27;
    v28 = [(UIStackView *)v4->_privacyCellStackView topAnchor];
    v29 = v25;
    v49 = v25;
    v30 = [v25 topAnchor];
    v31 = [v28 constraintEqualToAnchor:v30];
    v80[13] = v31;
    v32 = [(UIStackView *)v4->_privacyCellStackView bottomAnchor];
    v33 = [v29 bottomAnchor];
    v34 = [v32 constraintEqualToAnchor:v33];
    v80[14] = v34;
    v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:v80 count:15];
    [v57 activateConstraints:v35];

    v36 = v4;
  }

  return v4;
}

- (void)_updateState
{
  id v13 = [MEMORY[0x1E4F98CF0] sharedManager];
  int v3 = [v13 isPrivacyProxyActive];
  uint64_t v4 = [v13 state];
  if (self->_privateBrowsingEnabled)
  {
    [(SFPrivacyRedesignBannerCell *)self _changeActionTextForState:0];
    v5 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
    int v6 = objc_msgSend(v5, "safari_enableAdvancedPrivacyProtections:", 1);

    if (v6)
    {
      int v7 = v4 ? v3 : 0;
      if (self->_numberOfTrackers)
      {
        if (!v7) {
          goto LABEL_15;
        }
        if (v4 == 2)
        {
          v8 = NSString;
          goto LABEL_18;
        }
        if (v4 == 1) {
          v8 = NSString;
        }
        else {
LABEL_15:
        }
          v8 = NSString;
LABEL_18:
        v11 = _WBSLocalizedString();
        v12 = objc_msgSend(v8, "localizedStringWithFormat:", v11, self->_numberOfTrackers);
        [(UILabel *)self->_textLabel setText:v12];

        goto LABEL_20;
      }
    }
  }
  else
  {
    v9 = [MEMORY[0x1E4F28D18] sharedHTTPCookieStorage];
    char v10 = objc_msgSend(v9, "webui_trackerProtectionEnabled");

    if (v10) {
      [(SFPrivacyRedesignBannerCell *)self _changeActionTextForState:0];
    }
    else {
      [(SFPrivacyRedesignBannerCell *)self _changeActionTextForState:1];
    }
  }
  v11 = _WBSLocalizedString();
  [(UILabel *)self->_textLabel setText:v11];
LABEL_20:
}

- (void)configureUsingBanner:(id)a3
{
  id v4 = a3;
  self->_privateBrowsingEnabled = [v4 isPrivateBrowsingEnabled];
  v5 = [(WBSPrivacyReportData *)self->_privacyReportData knownTrackers];
  self->_numberOfTrackers = [v5 count];

  [(SFPrivacyRedesignBannerCell *)self _updateState];
  int v6 = [v4 privacyReportData];

  privacyReportData = self->_privacyReportData;
  self->_privacyReportData = v6;

  [(SFPrivacyRedesignBannerCell *)self _updateGridVisibilityIfNeeded];
}

- (void)layoutSubviews
{
  if (self->_gridAndTitleView)
  {
    [(SFPrivacyRedesignBannerCell *)self frame];
    CGFloat Width = CGRectGetWidth(v6);
    BOOL v4 = Width >= 400.0;
    [(UIStackView *)self->_privacyCellStackView setAxis:Width < 400.0];
    [(UIStackView *)self->_privacyCellStackView setDistribution:v4];
  }
  [(SFPrivacyRedesignBannerCell *)self _updateGridVisibilityIfNeeded];
  v5.receiver = self;
  v5.super_class = (Class)SFPrivacyRedesignBannerCell;
  [(SFPrivacyRedesignBannerCell *)&v5 layoutSubviews];
}

- (id)_createGridLabel
{
  id v2 = objc_alloc_init(MEMORY[0x1E4FB1930]);
  int v3 = [MEMORY[0x1E4F28EE0] localizedStringFromNumber:&unk_1EDA42450 numberStyle:0];
  BOOL v4 = NSString;
  objc_super v5 = _WBSLocalizedString();
  CGRect v6 = objc_msgSend(v4, "stringWithFormat:", v5, v3);
  [v2 setText:v6];

  [v2 setAdjustsFontForContentSizeCategory:1];
  [v2 setAutoresizingMask:10];
  int v7 = [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4FB28F0]];
  v8 = [v7 fontDescriptorWithSymbolicTraits:*MEMORY[0x1E4FB09D0]];

  v9 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v8 size:0.0];
  [v2 setFont:v9];

  char v10 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  [v2 setTextColor:v10];

  [v2 setTranslatesAutoresizingMaskIntoConstraints:0];

  return v2;
}

- (void)_updateGridVisibilityIfNeeded
{
  int v3 = [MEMORY[0x1E4F28D18] sharedHTTPCookieStorage];
  if (objc_msgSend(v3, "webui_trackerProtectionEnabled"))
  {
    int v4 = [(WBSPrivacyReportData *)self->_privacyReportData hasData];

    if (v4)
    {
      if (self->_gridAndTitleView) {
        return;
      }
      [(SFPrivacyRedesignBannerCell *)self _createGrid];
      goto LABEL_8;
    }
  }
  else
  {
  }
  if (!self->_gridAndTitleView) {
    return;
  }
  -[UIStackView removeArrangedSubview:](self->_privacyCellStackView, "removeArrangedSubview:");
  [(UIView *)self->_gridAndTitleView removeFromSuperview];
  gridAndTitleView = self->_gridAndTitleView;
  self->_gridAndTitleView = 0;

LABEL_8:

  [(SFPrivacyRedesignBannerCell *)self invalidateIntrinsicContentSize];
}

- (void)_createGrid
{
  v31[7] = *MEMORY[0x1E4F143B8];
  v24 = [(SFPrivacyRedesignBannerCell *)self _createGridLabel];
  int v3 = [[SFPrivacyReportOverviewView alloc] initWithPrivacyReportDataProvider:self->_privacyReportData];
  gridView = self->_gridView;
  self->_gridView = v3;

  [(SFPrivacyReportOverviewView *)self->_gridView setContextType:1];
  [(SFPrivacyReportOverviewView *)self->_gridView setUsesInsetStyle:1];
  [(SFPrivacyReportOverviewView *)self->_gridView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(SFPrivacyReportGridView *)self->_gridView setDelegate:self];
  objc_super v5 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  gridAndTitleView = self->_gridAndTitleView;
  self->_gridAndTitleView = v5;

  [(UIView *)self->_gridAndTitleView addSubview:v24];
  [(UIView *)self->_gridAndTitleView addSubview:self->_gridView];
  [(UIView *)self->_gridAndTitleView setPreservesSuperviewLayoutMargins:1];
  [(UIView *)self->_gridAndTitleView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIStackView *)self->_privacyCellStackView addArrangedSubview:self->_gridAndTitleView];
  v20 = (void *)MEMORY[0x1E4F28DC8];
  v30 = [v24 topAnchor];
  v29 = [(UIView *)self->_gridAndTitleView topAnchor];
  v28 = [v30 constraintEqualToAnchor:v29];
  v31[0] = v28;
  v27 = [v24 leadingAnchor];
  v26 = [(UIView *)self->_gridAndTitleView leadingAnchor];
  v25 = [v27 constraintEqualToAnchor:v26];
  v31[1] = v25;
  double v23 = [v24 trailingAnchor];
  v22 = [(UIView *)self->_gridAndTitleView trailingAnchor];
  uint64_t v21 = [v23 constraintEqualToAnchor:v22];
  v31[2] = v21;
  id v19 = [(SFPrivacyReportOverviewView *)self->_gridView topAnchor];
  v18 = [v24 bottomAnchor];
  id v17 = [v19 constraintEqualToAnchor:v18 constant:12.0];
  v31[3] = v17;
  int v7 = [(SFPrivacyReportOverviewView *)self->_gridView leadingAnchor];
  v8 = [(UIView *)self->_gridAndTitleView leadingAnchor];
  v9 = [v7 constraintEqualToAnchor:v8];
  v31[4] = v9;
  char v10 = [(SFPrivacyReportOverviewView *)self->_gridView trailingAnchor];
  v11 = [(UIView *)self->_gridAndTitleView trailingAnchor];
  v12 = [v10 constraintEqualToAnchor:v11];
  v31[5] = v12;
  id v13 = [(SFPrivacyReportOverviewView *)self->_gridView bottomAnchor];
  v14 = [(UIView *)self->_gridAndTitleView bottomAnchor];
  v15 = [v13 constraintEqualToAnchor:v14];
  v31[6] = v15;
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:7];
  [v20 activateConstraints:v16];
}

- (void)_changeActionTextForState:(unint64_t)a3
{
  if (a3 > 1)
  {
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v4 = _WBSLocalizedString();
  }
  id v5 = (id)v4;
  [(UILabel *)self->_actionLabel setText:v4];
}

- (void)gridViewDidUpdateContentSize:(id)a3
{
  [(SFPrivacyRedesignBannerCell *)self invalidateIntrinsicContentSize];

  [(SFPrivacyRedesignBannerCell *)self setNeedsLayout];
}

- (UIView)gridAndTitleView
{
  return self->_gridAndTitleView;
}

- (WBSPrivacyReportData)privacyReportData
{
  return self->_privacyReportData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privacyReportData, 0);
  objc_storeStrong((id *)&self->_gridAndTitleView, 0);
  objc_storeStrong((id *)&self->_gridView, 0);
  objc_storeStrong((id *)&self->_privacyCellStackView, 0);
  objc_storeStrong((id *)&self->_textLabel, 0);
  objc_storeStrong((id *)&self->_explanationView, 0);

  objc_storeStrong((id *)&self->_actionLabel, 0);
}

@end