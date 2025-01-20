@interface SFSectionDisclosureButton
- (BOOL)isExpanded;
- (BOOL)isLabelHidden;
- (CGSize)sizeIncludingLabels;
- (SFSectionDisclosureButton)initWithFrame:(CGRect)a3 expanded:(BOOL)a4 modally:(BOOL)a5;
- (UIImageView)chevron;
- (void)buttonShapesEnabledDidChange;
- (void)dealloc;
- (void)setExpanded:(BOOL)a3;
- (void)setLabelHidden:(BOOL)a3;
- (void)toggleExpanded;
- (void)updateExpanded;
@end

@implementation SFSectionDisclosureButton

- (SFSectionDisclosureButton)initWithFrame:(CGRect)a3 expanded:(BOOL)a4 modally:(BOOL)a5
{
  v76[15] = *MEMORY[0x1E4F143B8];
  v75.receiver = self;
  v75.super_class = (Class)SFSectionDisclosureButton;
  v7 = -[SFSectionDisclosureButton initWithFrame:](&v75, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v8 = v7;
  if (v7)
  {
    v7->_expanded = a4;
    v7->_expandsModally = a5;
    uint64_t v9 = makeLabel();
    labelWhenExpanded = v8->_labelWhenExpanded;
    v8->_labelWhenExpanded = (UILabel *)v9;

    v11 = [(UILabel *)v8->_labelWhenExpanded leadingAnchor];
    v12 = [(SFSectionDisclosureButton *)v8 leadingAnchor];
    uint64_t v13 = [v11 constraintGreaterThanOrEqualToAnchor:v12];
    labelWhenExpandedLeadingConstraint = v8->_labelWhenExpandedLeadingConstraint;
    v8->_labelWhenExpandedLeadingConstraint = (NSLayoutConstraint *)v13;

    [(SFSectionDisclosureButton *)v8 addSubview:v8->_labelWhenExpanded];
    uint64_t v15 = makeLabel();
    labelWhenCollapsed = v8->_labelWhenCollapsed;
    v8->_labelWhenCollapsed = (UILabel *)v15;

    v17 = [(UILabel *)v8->_labelWhenCollapsed leadingAnchor];
    v18 = [(SFSectionDisclosureButton *)v8 leadingAnchor];
    uint64_t v19 = [v17 constraintGreaterThanOrEqualToAnchor:v18];
    labelWhenCollapsedLeadingConstraint = v8->_labelWhenCollapsedLeadingConstraint;
    v8->_labelWhenCollapsedLeadingConstraint = (NSLayoutConstraint *)v19;

    [(SFSectionDisclosureButton *)v8 addSubview:v8->_labelWhenCollapsed];
    uint64_t v21 = [objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:0];
    imageView = v8->_imageView;
    v8->_imageView = (UIImageView *)v21;

    [(UIImageView *)v8->_imageView setTranslatesAutoresizingMaskIntoConstraints:0];
    v23 = [MEMORY[0x1E4FB1830] configurationWithTextStyle:*MEMORY[0x1E4FB28D0] scale:1];
    [(UIImageView *)v8->_imageView setPreferredSymbolConfiguration:v23];

    [(SFSectionDisclosureButton *)v8 addSubview:v8->_imageView];
    v57 = (void *)MEMORY[0x1E4F28DC8];
    v74 = [(UILabel *)v8->_labelWhenExpanded centerYAnchor];
    v73 = [(SFSectionDisclosureButton *)v8 centerYAnchor];
    v72 = [v74 constraintEqualToAnchor:v73];
    v76[0] = v72;
    v71 = [(UILabel *)v8->_labelWhenCollapsed centerYAnchor];
    v70 = [(SFSectionDisclosureButton *)v8 centerYAnchor];
    v69 = [v71 constraintEqualToAnchor:v70];
    v76[1] = v69;
    v68 = [(UIImageView *)v8->_imageView centerYAnchor];
    v67 = [(SFSectionDisclosureButton *)v8 centerYAnchor];
    v66 = [v68 constraintEqualToAnchor:v67];
    v76[2] = v66;
    v65 = [(UILabel *)v8->_labelWhenExpanded heightAnchor];
    v64 = [(SFSectionDisclosureButton *)v8 heightAnchor];
    v63 = [v65 constraintLessThanOrEqualToAnchor:v64];
    v76[3] = v63;
    v62 = [(UILabel *)v8->_labelWhenCollapsed heightAnchor];
    v61 = [(SFSectionDisclosureButton *)v8 heightAnchor];
    v60 = [v62 constraintLessThanOrEqualToAnchor:v61];
    v76[4] = v60;
    v59 = [(UIImageView *)v8->_imageView heightAnchor];
    v58 = [(SFSectionDisclosureButton *)v8 heightAnchor];
    v56 = [v59 constraintLessThanOrEqualToAnchor:v58];
    v76[5] = v56;
    v55 = [(SFSectionDisclosureButton *)v8 heightAnchor];
    v54 = [v55 constraintEqualToConstant:0.0];
    LODWORD(v24) = 1132068864;
    v53 = objc_msgSend(v54, "sf_withPriority:", v24);
    v76[6] = v53;
    v52 = [(UILabel *)v8->_labelWhenExpanded leadingAnchor];
    v51 = [(SFSectionDisclosureButton *)v8 leadingAnchor];
    v50 = [v52 constraintEqualToAnchor:v51];
    LODWORD(v25) = 1131413504;
    v49 = objc_msgSend(v50, "sf_withPriority:", v25);
    v76[7] = v49;
    v76[8] = v8->_labelWhenExpandedLeadingConstraint;
    v48 = [(UILabel *)v8->_labelWhenCollapsed leadingAnchor];
    v47 = [(SFSectionDisclosureButton *)v8 leadingAnchor];
    v46 = [v48 constraintEqualToAnchor:v47];
    LODWORD(v26) = 1131413504;
    v45 = objc_msgSend(v46, "sf_withPriority:", v26);
    v76[9] = v45;
    v76[10] = v8->_labelWhenCollapsedLeadingConstraint;
    v44 = [(UIImageView *)v8->_imageView leadingAnchor];
    v43 = [(UILabel *)v8->_labelWhenExpanded trailingAnchor];
    v42 = [v44 constraintEqualToSystemSpacingAfterAnchor:v43 multiplier:0.75];
    v76[11] = v42;
    v41 = [(UIImageView *)v8->_imageView leadingAnchor];
    v40 = [(UILabel *)v8->_labelWhenCollapsed trailingAnchor];
    v27 = [v41 constraintEqualToSystemSpacingAfterAnchor:v40 multiplier:0.75];
    v76[12] = v27;
    v28 = [(UIImageView *)v8->_imageView leadingAnchor];
    v29 = [(SFSectionDisclosureButton *)v8 leadingAnchor];
    v30 = [v28 constraintEqualToAnchor:v29];
    LODWORD(v31) = 1132068864;
    v32 = objc_msgSend(v30, "sf_withPriority:", v31);
    v76[13] = v32;
    v33 = [(UIImageView *)v8->_imageView trailingAnchor];
    v34 = [(SFSectionDisclosureButton *)v8 trailingAnchor];
    v35 = [v33 constraintEqualToAnchor:v34];
    v76[14] = v35;
    v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:v76 count:15];
    [v57 activateConstraints:v36];

    [(SFSectionDisclosureButton *)v8 buttonShapesEnabledDidChange];
    v37 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v37 addObserver:v8 selector:sel_buttonShapesEnabledDidChange name:*MEMORY[0x1E4FB2428] object:0];

    [(SFSectionDisclosureButton *)v8 updateExpanded];
    [(SFSectionDisclosureButton *)v8 addTarget:v8 action:sel_toggleExpanded forControlEvents:0x2000];
    v38 = v8;
  }

  return v8;
}

- (void)setExpanded:(BOOL)a3
{
  if (self->_expanded != a3)
  {
    self->_expanded = a3;
    [(SFSectionDisclosureButton *)self updateExpanded];
  }
}

- (void)updateExpanded
{
  LOBYTE(v2) = self->_expanded;
  [(UILabel *)self->_labelWhenExpanded setAlpha:(double)v2];
  double v4 = 0.0;
  if (!self->_expanded) {
    double v4 = 1.0;
  }
  [(UILabel *)self->_labelWhenCollapsed setAlpha:v4];
  long long v5 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)&v10.a = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&v10.c = v5;
  *(_OWORD *)&v10.tx = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  if (self->_expanded)
  {
    CGFloat v6 = 1.57079633;
LABEL_7:
    CGAffineTransformMakeRotation(&v10, v6);
    goto LABEL_8;
  }
  if (![(UIView *)self _sf_usesLeftToRightLayout])
  {
    CGFloat v6 = 3.14159265;
    goto LABEL_7;
  }
LABEL_8:
  CGAffineTransform v9 = v10;
  v7 = [(SFSectionDisclosureButton *)self chevron];
  CGAffineTransform v8 = v9;
  [v7 setTransform:&v8];
}

- (void)toggleExpanded
{
  if (!self->_expandsModally)
  {
    v2[0] = MEMORY[0x1E4F143A8];
    v2[1] = 3221225472;
    v2[2] = __43__SFSectionDisclosureButton_toggleExpanded__block_invoke;
    v2[3] = &unk_1E54E9858;
    v2[4] = self;
    [MEMORY[0x1E4FB1EB0] _animateUsingDefaultTimingWithOptions:0 animations:v2 completion:0];
  }
}

uint64_t __43__SFSectionDisclosureButton_toggleExpanded__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) isExpanded] ^ 1;
  v3 = *(void **)(a1 + 32);

  return [v3 setExpanded:v2];
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4FB2428] object:0];

  v4.receiver = self;
  v4.super_class = (Class)SFSectionDisclosureButton;
  [(SFSectionDisclosureButton *)&v4 dealloc];
}

- (void)buttonShapesEnabledDidChange
{
  v14[1] = *MEMORY[0x1E4F143B8];
  BOOL v3 = UIAccessibilityButtonShapesEnabled();
  if (v3) {
    objc_super v4 = @"chevron.right.circle.fill";
  }
  else {
    objc_super v4 = @"chevron.right";
  }
  long long v5 = [MEMORY[0x1E4FB1818] systemImageNamed:v4];
  [(UIImageView *)self->_imageView setImage:v5];

  if (v3)
  {
    uint64_t v13 = *MEMORY[0x1E4FB0808];
    v14[0] = &unk_1EDA42270;
    CGFloat v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
  }
  else
  {
    CGFloat v6 = (void *)MEMORY[0x1E4F1CC08];
  }
  id v7 = objc_alloc(MEMORY[0x1E4F28B18]);
  CGAffineTransform v8 = _WBSLocalizedString();
  CGAffineTransform v9 = (void *)[v7 initWithString:v8 attributes:v6];
  [(UILabel *)self->_labelWhenCollapsed setAttributedText:v9];

  id v10 = objc_alloc(MEMORY[0x1E4F28B18]);
  v11 = _WBSLocalizedString();
  v12 = (void *)[v10 initWithString:v11 attributes:v6];
  [(UILabel *)self->_labelWhenExpanded setAttributedText:v12];
}

- (CGSize)sizeIncludingLabels
{
  [(UIImageView *)self->_imageView frame];
  CGFloat x = v3;
  CGFloat y = v4;
  CGFloat width = v5;
  CGFloat height = v6;
  if (self->_expanded)
  {
    memset(&v34, 0, sizeof(v34));
    double MidX = CGRectGetMidX(*(CGRect *)&v3);
    v36.origin.CGFloat x = x;
    v36.origin.CGFloat y = y;
    v36.size.CGFloat width = width;
    v36.size.CGFloat height = height;
    double MidY = CGRectGetMidY(v36);
    memset(&v33, 0, sizeof(v33));
    CGAffineTransformMakeTranslation(&v33, MidX, MidY);
    CGAffineTransform v31 = v33;
    CGAffineTransformRotate(&v32, &v31, 1.57079633);
    CGAffineTransform v33 = v32;
    CGAffineTransformTranslate(&v34, &v32, -MidX, -MidY);
    CGAffineTransform v33 = v34;
    v37.origin.CGFloat x = x;
    v37.origin.CGFloat y = y;
    v37.size.CGFloat width = width;
    v37.size.CGFloat height = height;
    CGRect v38 = CGRectApplyAffineTransform(v37, &v33);
    CGFloat x = v38.origin.x;
    CGFloat y = v38.origin.y;
    CGFloat width = v38.size.width;
    CGFloat height = v38.size.height;
  }
  if (self->_expandsModally)
  {
    [(UILabel *)self->_labelWhenCollapsed frame];
  }
  else
  {
    [(UILabel *)self->_labelWhenExpanded frame];
    CGFloat v18 = v17;
    CGFloat v20 = v19;
    CGFloat v22 = v21;
    CGFloat v24 = v23;
    [(UILabel *)self->_labelWhenCollapsed frame];
    v41.origin.CGFloat x = v25;
    v41.origin.CGFloat y = v26;
    v41.size.CGFloat width = v27;
    v41.size.CGFloat height = v28;
    v39.origin.CGFloat x = v18;
    v39.origin.CGFloat y = v20;
    v39.size.CGFloat width = v22;
    v39.size.CGFloat height = v24;
    *(CGRect *)&uint64_t v13 = CGRectUnion(v39, v41);
  }
  v42.origin.CGFloat x = x;
  v42.origin.CGFloat y = y;
  v42.size.CGFloat width = width;
  v42.size.CGFloat height = height;
  CGRect v40 = CGRectUnion(*(CGRect *)&v13, v42);
  double v29 = v40.size.width;
  double v30 = v40.size.height;
  result.CGFloat height = v30;
  result.CGFloat width = v29;
  return result;
}

- (UIImageView)chevron
{
  return self->_imageView;
}

- (void)setLabelHidden:(BOOL)a3
{
  if (self->_labelHidden != a3)
  {
    BOOL v3 = a3;
    self->_labelHidden = a3;
    -[UILabel setHidden:](self->_labelWhenExpanded, "setHidden:");
    [(UILabel *)self->_labelWhenCollapsed setHidden:v3];
    uint64_t v5 = v3 ^ 1;
    [(NSLayoutConstraint *)self->_labelWhenExpandedLeadingConstraint setActive:v5];
    labelWhenCollapsedLeadingConstraint = self->_labelWhenCollapsedLeadingConstraint;
    [(NSLayoutConstraint *)labelWhenCollapsedLeadingConstraint setActive:v5];
  }
}

- (BOOL)isExpanded
{
  return self->_expanded;
}

- (BOOL)isLabelHidden
{
  return self->_labelHidden;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_labelWhenExpandedLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_labelWhenExpanded, 0);
  objc_storeStrong((id *)&self->_labelWhenCollapsedLeadingConstraint, 0);

  objc_storeStrong((id *)&self->_labelWhenCollapsed, 0);
}

@end