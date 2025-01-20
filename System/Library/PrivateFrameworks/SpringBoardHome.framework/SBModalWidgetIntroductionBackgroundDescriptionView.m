@interface SBModalWidgetIntroductionBackgroundDescriptionView
- (SBModalWidgetIntroductionBackgroundDescriptionView)initWithFrame:(CGRect)a3 withOwner:(id)a4;
- (UIButton)continueButton;
- (UIImageView)homescreenPreview;
- (UILabel)introductionTextLabel;
- (UILabel)titleLabel;
- (UIView)backgroundView;
- (UIView)labelContainerView;
- (UIViewController)owner;
- (void)setBackgroundView:(id)a3;
- (void)setContinueButton:(id)a3;
- (void)setHomescreenPreview:(id)a3;
- (void)setIntroductionTextLabel:(id)a3;
- (void)setLabelContainerView:(id)a3;
- (void)setOwner:(id)a3;
- (void)setTitleLabel:(id)a3;
@end

@implementation SBModalWidgetIntroductionBackgroundDescriptionView

- (SBModalWidgetIntroductionBackgroundDescriptionView)initWithFrame:(CGRect)a3 withOwner:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v83[4] = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  v80.receiver = self;
  v80.super_class = (Class)SBModalWidgetIntroductionBackgroundDescriptionView;
  v10 = -[SBModalWidgetIntroductionBackgroundDescriptionView initWithFrame:](&v80, sel_initWithFrame_, x, y, width, height);
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_owner, v9);
    v12 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    backgroundView = v11->_backgroundView;
    v11->_backgroundView = v12;

    [(UIView *)v11->_backgroundView _setContinuousCornerRadius:40.0];
    [(UIView *)v11->_backgroundView setClipsToBounds:1];
    v14 = v11->_backgroundView;
    [MEMORY[0x1E4FB1618] systemBackgroundColor];
    v15 = id v79 = v9;
    [(UIView *)v14 setBackgroundColor:v15];

    [(UIView *)v11->_backgroundView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(SBModalWidgetIntroductionBackgroundDescriptionView *)v11 addSubview:v11->_backgroundView];
    id v16 = SBHPinViewWithinView(v11, v11->_backgroundView);
    v17 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    labelContainerView = v11->_labelContainerView;
    v11->_labelContainerView = v17;

    v19 = v11->_labelContainerView;
    v20 = [MEMORY[0x1E4FB1618] clearColor];
    [(UIView *)v19 setBackgroundColor:v20];

    [(UIView *)v11->_labelContainerView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(SBModalWidgetIntroductionBackgroundDescriptionView *)v11 addSubview:v11->_labelContainerView];
    v64 = (void *)MEMORY[0x1E4F28DC8];
    v76 = [(UIView *)v11->_labelContainerView leadingAnchor];
    v73 = [(SBModalWidgetIntroductionBackgroundDescriptionView *)v11 leadingAnchor];
    v70 = [v76 constraintEqualToAnchor:v73];
    v83[0] = v70;
    v67 = [(UIView *)v11->_labelContainerView trailingAnchor];
    v65 = [(SBModalWidgetIntroductionBackgroundDescriptionView *)v11 trailingAnchor];
    v21 = [v67 constraintEqualToAnchor:v65];
    v83[1] = v21;
    v22 = [(UIView *)v11->_labelContainerView topAnchor];
    v23 = [(SBModalWidgetIntroductionBackgroundDescriptionView *)v11 topAnchor];
    v24 = [v22 constraintEqualToAnchor:v23 constant:10.0];
    v83[2] = v24;
    v25 = [(UIView *)v11->_labelContainerView bottomAnchor];
    v26 = [(SBModalWidgetIntroductionBackgroundDescriptionView *)v11 bottomAnchor];
    v27 = [v25 constraintEqualToAnchor:v26];
    v83[3] = v27;
    v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v83 count:4];
    [v64 activateConstraints:v28];

    v29 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    titleLabel = v11->_titleLabel;
    v11->_titleLabel = v29;

    v31 = v11->_titleLabel;
    v32 = SBHBundle();
    v33 = [v32 localizedStringForKey:@"MODAL_WIDGET_DISCOVERABILITY_TITLE" value:&stru_1F2FA0300 table:@"SpringBoardHome"];
    [(UILabel *)v31 setText:v33];

    v34 = v11->_titleLabel;
    v35 = [MEMORY[0x1E4FB08E0] systemFontOfSize:30.0 weight:*MEMORY[0x1E4FB09C8]];
    [(UILabel *)v34 setFont:v35];

    v36 = v11->_titleLabel;
    v37 = [MEMORY[0x1E4FB1618] labelColor];
    [(UILabel *)v36 setTextColor:v37];

    [(UILabel *)v11->_titleLabel setAdjustsFontSizeToFitWidth:1];
    [(UILabel *)v11->_titleLabel setMinimumScaleFactor:0.6];
    [(UILabel *)v11->_titleLabel setNumberOfLines:2];
    [(UILabel *)v11->_titleLabel setTextAlignment:1];
    [(UILabel *)v11->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)v11->_labelContainerView addSubview:v11->_titleLabel];
    v68 = (void *)MEMORY[0x1E4F28DC8];
    v77 = [(UILabel *)v11->_titleLabel centerXAnchor];
    v74 = [(UIView *)v11->_labelContainerView centerXAnchor];
    v71 = [v77 constraintGreaterThanOrEqualToAnchor:v74];
    v82[0] = v71;
    v66 = [(UILabel *)v11->_titleLabel topAnchor];
    v38 = [(UIView *)v11->_labelContainerView topAnchor];
    v39 = [v66 constraintEqualToAnchor:v38 constant:100.0];
    v82[1] = v39;
    v40 = [(UILabel *)v11->_titleLabel widthAnchor];
    v41 = [v40 constraintEqualToConstant:200.0];
    v82[2] = v41;
    v42 = [(UILabel *)v11->_titleLabel heightAnchor];
    v43 = [v42 constraintEqualToConstant:50.0];
    v82[3] = v43;
    v44 = [MEMORY[0x1E4F1C978] arrayWithObjects:v82 count:4];
    [v68 activateConstraints:v44];

    v45 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    introductionTextLabel = v11->_introductionTextLabel;
    v11->_introductionTextLabel = v45;

    v47 = v11->_introductionTextLabel;
    v48 = SBHBundle();
    v49 = [v48 localizedStringForKey:@"MODAL_WIDGET_DISCOVERABILITY_DESCRIPTION" value:&stru_1F2FA0300 table:@"SpringBoardHome"];
    [(UILabel *)v47 setText:v49];

    v50 = v11->_introductionTextLabel;
    v51 = [MEMORY[0x1E4FB08E0] systemFontOfSize:15.0 weight:*MEMORY[0x1E4FB09D8]];
    [(UILabel *)v50 setFont:v51];

    v52 = v11->_introductionTextLabel;
    v53 = [MEMORY[0x1E4FB1618] labelColor];
    [(UILabel *)v52 setTextColor:v53];

    [(UILabel *)v11->_introductionTextLabel setAdjustsFontSizeToFitWidth:1];
    [(UILabel *)v11->_introductionTextLabel setMinimumScaleFactor:0.6];
    [(UILabel *)v11->_introductionTextLabel setNumberOfLines:2];
    [(UILabel *)v11->_introductionTextLabel setTextAlignment:1];
    [(UILabel *)v11->_introductionTextLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)v11->_labelContainerView addSubview:v11->_introductionTextLabel];
    v69 = (void *)MEMORY[0x1E4F28DC8];
    v78 = [(UILabel *)v11->_introductionTextLabel leadingAnchor];
    v75 = [(UIView *)v11->_labelContainerView leadingAnchor];
    v72 = [v78 constraintGreaterThanOrEqualToAnchor:v75 constant:30.0];
    v81[0] = v72;
    v54 = [(UILabel *)v11->_introductionTextLabel trailingAnchor];
    v55 = [(UIView *)v11->_labelContainerView trailingAnchor];
    v56 = [v54 constraintLessThanOrEqualToAnchor:v55 constant:-30.0];
    v81[1] = v56;
    v57 = [(UILabel *)v11->_introductionTextLabel topAnchor];
    v58 = [(UILabel *)v11->_titleLabel bottomAnchor];
    v59 = [v57 constraintEqualToAnchor:v58 constant:15.0];
    v81[2] = v59;
    v60 = [(UILabel *)v11->_introductionTextLabel heightAnchor];
    v61 = [v60 constraintEqualToConstant:60.0];
    v81[3] = v61;
    v62 = [MEMORY[0x1E4F1C978] arrayWithObjects:v81 count:4];
    [v69 activateConstraints:v62];

    id v9 = v79;
  }

  return v11;
}

- (UIViewController)owner
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_owner);
  return (UIViewController *)WeakRetained;
}

- (void)setOwner:(id)a3
{
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
}

- (UIView)labelContainerView
{
  return self->_labelContainerView;
}

- (void)setLabelContainerView:(id)a3
{
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UILabel)introductionTextLabel
{
  return self->_introductionTextLabel;
}

- (void)setIntroductionTextLabel:(id)a3
{
}

- (UIImageView)homescreenPreview
{
  return self->_homescreenPreview;
}

- (void)setHomescreenPreview:(id)a3
{
}

- (UIButton)continueButton
{
  return self->_continueButton;
}

- (void)setContinueButton:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_continueButton, 0);
  objc_storeStrong((id *)&self->_homescreenPreview, 0);
  objc_storeStrong((id *)&self->_introductionTextLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_labelContainerView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_destroyWeak((id *)&self->_owner);
}

@end