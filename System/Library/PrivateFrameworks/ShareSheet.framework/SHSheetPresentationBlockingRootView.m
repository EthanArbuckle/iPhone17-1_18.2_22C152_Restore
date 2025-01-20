@interface SHSheetPresentationBlockingRootView
- (BOOL)hasAppliedConstraints;
- (SHSheetPresentationBlockingRootView)initWithFrame:(CGRect)a3;
- (UILabel)descriptionLabel;
- (UILabel)titleLabel;
- (UIView)containerView;
- (void)didMoveToSuperview;
- (void)setContainerView:(id)a3;
- (void)setDescriptionLabel:(id)a3;
- (void)setHasAppliedConstraints:(BOOL)a3;
- (void)setTitleLabel:(id)a3;
- (void)updateConstraints;
@end

@implementation SHSheetPresentationBlockingRootView

- (SHSheetPresentationBlockingRootView)initWithFrame:(CGRect)a3
{
  v23.receiver = self;
  v23.super_class = (Class)SHSheetPresentationBlockingRootView;
  v3 = -[SHSheetPresentationBlockingRootView initWithFrame:](&v23, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = objc_opt_new();
    containerView = v3->_containerView;
    v3->_containerView = (UIView *)v4;

    [(UIView *)v3->_containerView setTranslatesAutoresizingMaskIntoConstraints:0];
    uint64_t v6 = objc_opt_new();
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = (UILabel *)v6;

    v8 = _ShareSheetBundle();
    v9 = [v8 localizedStringForKey:@"SHARE_SHEET_SHARING_UNAVAILABLE_TITLE" value:&stru_1EF308000 table:@"Localizable"];
    [(UILabel *)v3->_titleLabel setText:v9];

    [(UILabel *)v3->_titleLabel setTextAlignment:1];
    [(UILabel *)v3->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v3->_titleLabel setNumberOfLines:0];
    v10 = (void *)MEMORY[0x1E4FB1798];
    v11 = [MEMORY[0x1E4FB17A0] defaultFontDescriptorWithTextStyle:*MEMORY[0x1E4FB2988]];
    v12 = [v10 fontWithDescriptor:v11 size:0.0];
    [(UILabel *)v3->_titleLabel setFont:v12];

    v13 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [(UILabel *)v3->_titleLabel setTextColor:v13];

    uint64_t v14 = objc_opt_new();
    descriptionLabel = v3->_descriptionLabel;
    v3->_descriptionLabel = (UILabel *)v14;

    v16 = _ShareSheetBundle();
    v17 = [v16 localizedStringForKey:@"SHARE_SHEET_SHARING_UNAVAILABLE_DESCRIPTION" value:&stru_1EF308000 table:@"Localizable"];
    [(UILabel *)v3->_descriptionLabel setText:v17];

    [(UILabel *)v3->_descriptionLabel setTextAlignment:1];
    [(UILabel *)v3->_descriptionLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v3->_descriptionLabel setNumberOfLines:0];
    v18 = (void *)MEMORY[0x1E4FB1798];
    v19 = [MEMORY[0x1E4FB17A0] defaultFontDescriptorWithTextStyle:*MEMORY[0x1E4FB28C8]];
    v20 = [v18 fontWithDescriptor:v19 size:0.0];
    [(UILabel *)v3->_descriptionLabel setFont:v20];

    v21 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [(UILabel *)v3->_descriptionLabel setTextColor:v21];
  }
  return v3;
}

- (void)didMoveToSuperview
{
  v9.receiver = self;
  v9.super_class = (Class)SHSheetPresentationBlockingRootView;
  [(SHSheetPresentationBlockingRootView *)&v9 didMoveToSuperview];
  v3 = [(SHSheetPresentationBlockingRootView *)self containerView];
  uint64_t v4 = [v3 superview];

  if (!v4)
  {
    v5 = [(SHSheetPresentationBlockingRootView *)self containerView];
    [(SHSheetPresentationBlockingRootView *)self addSubview:v5];

    uint64_t v6 = [(SHSheetPresentationBlockingRootView *)self containerView];
    v7 = [(SHSheetPresentationBlockingRootView *)self titleLabel];
    [v6 addSubview:v7];

    v8 = [(SHSheetPresentationBlockingRootView *)self descriptionLabel];
    [v6 addSubview:v8];
  }
}

- (void)updateConstraints
{
  v73[1] = *MEMORY[0x1E4F143B8];
  v70.receiver = self;
  v70.super_class = (Class)SHSheetPresentationBlockingRootView;
  [(SHSheetPresentationBlockingRootView *)&v70 updateConstraints];
  if (![(SHSheetPresentationBlockingRootView *)self hasAppliedConstraints])
  {
    [(SHSheetPresentationBlockingRootView *)self frame];
    double Width = CGRectGetWidth(v74);
    uint64_t v4 = [(SHSheetPresentationBlockingRootView *)self titleLabel];
    v5 = [v4 text];
    uint64_t v72 = *MEMORY[0x1E4FB12B0];
    uint64_t v6 = [(SHSheetPresentationBlockingRootView *)self titleLabel];
    v7 = [v6 font];
    v73[0] = v7;
    v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v73 forKeys:&v72 count:1];
    objc_msgSend(v5, "boundingRectWithSize:options:attributes:context:", 3, v8, 0, Width, 1.79769313e308);
    CGFloat v10 = v9;
    CGFloat v12 = v11;
    CGFloat v14 = v13;
    CGFloat v16 = v15;

    v75.origin.x = v10;
    v75.origin.y = v12;
    v75.size.width = v14;
    v75.size.height = v16;
    CGFloat v17 = CGRectGetWidth(v75) + 8.0;
    v48 = (void *)MEMORY[0x1E4F28DC8];
    v69 = [(SHSheetPresentationBlockingRootView *)self containerView];
    v68 = [v69 widthAnchor];
    v67 = [(SHSheetPresentationBlockingRootView *)self widthAnchor];
    v66 = [v68 constraintLessThanOrEqualToAnchor:v67 multiplier:0.8 constant:0.0];
    v71[0] = v66;
    v65 = [(SHSheetPresentationBlockingRootView *)self containerView];
    v64 = [v65 centerXAnchor];
    v63 = [(SHSheetPresentationBlockingRootView *)self centerXAnchor];
    v62 = [v64 constraintEqualToAnchor:v63];
    v71[1] = v62;
    v61 = [(SHSheetPresentationBlockingRootView *)self containerView];
    v60 = [v61 centerYAnchor];
    v59 = [(SHSheetPresentationBlockingRootView *)self centerYAnchor];
    v58 = [v60 constraintEqualToAnchor:v59];
    v71[2] = v58;
    v57 = [(SHSheetPresentationBlockingRootView *)self titleLabel];
    v56 = [v57 widthAnchor];
    v55 = [v56 constraintEqualToConstant:v17];
    v71[3] = v55;
    v54 = [(SHSheetPresentationBlockingRootView *)self titleLabel];
    v52 = [v54 topAnchor];
    v53 = [(SHSheetPresentationBlockingRootView *)self containerView];
    v51 = [v53 topAnchor];
    v50 = [v52 constraintEqualToAnchor:v51];
    v71[4] = v50;
    v49 = [(SHSheetPresentationBlockingRootView *)self titleLabel];
    v46 = [v49 leadingAnchor];
    v47 = [(SHSheetPresentationBlockingRootView *)self containerView];
    v45 = [v47 leadingAnchor];
    v44 = [v46 constraintEqualToAnchor:v45];
    v71[5] = v44;
    v43 = [(SHSheetPresentationBlockingRootView *)self titleLabel];
    v41 = [v43 trailingAnchor];
    v42 = [(SHSheetPresentationBlockingRootView *)self containerView];
    v40 = [v42 trailingAnchor];
    v39 = [v41 constraintEqualToAnchor:v40];
    v71[6] = v39;
    v38 = [(SHSheetPresentationBlockingRootView *)self descriptionLabel];
    v36 = [v38 topAnchor];
    v37 = [(SHSheetPresentationBlockingRootView *)self titleLabel];
    v35 = [v37 bottomAnchor];
    v34 = [v36 constraintEqualToAnchor:v35 constant:8.0];
    v71[7] = v34;
    v33 = [(SHSheetPresentationBlockingRootView *)self descriptionLabel];
    v31 = [v33 leadingAnchor];
    v32 = [(SHSheetPresentationBlockingRootView *)self titleLabel];
    v30 = [v32 leadingAnchor];
    v29 = [v31 constraintEqualToAnchor:v30];
    v71[8] = v29;
    v28 = [(SHSheetPresentationBlockingRootView *)self descriptionLabel];
    v27 = [v28 trailingAnchor];
    v18 = [(SHSheetPresentationBlockingRootView *)self titleLabel];
    v19 = [v18 trailingAnchor];
    v20 = [v27 constraintEqualToAnchor:v19];
    v71[9] = v20;
    v21 = [(SHSheetPresentationBlockingRootView *)self descriptionLabel];
    v22 = [v21 bottomAnchor];
    objc_super v23 = [(SHSheetPresentationBlockingRootView *)self containerView];
    v24 = [v23 bottomAnchor];
    v25 = [v22 constraintEqualToAnchor:v24];
    v71[10] = v25;
    v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v71 count:11];
    [v48 activateConstraints:v26];

    [(SHSheetPresentationBlockingRootView *)self setHasAppliedConstraints:1];
  }
}

- (UIView)containerView
{
  return self->_containerView;
}

- (void)setContainerView:(id)a3
{
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UILabel)descriptionLabel
{
  return self->_descriptionLabel;
}

- (void)setDescriptionLabel:(id)a3
{
}

- (BOOL)hasAppliedConstraints
{
  return self->_hasAppliedConstraints;
}

- (void)setHasAppliedConstraints:(BOOL)a3
{
  self->_hasAppliedConstraints = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptionLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
}

@end