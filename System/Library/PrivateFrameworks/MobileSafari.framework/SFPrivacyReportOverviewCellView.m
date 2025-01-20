@interface SFPrivacyReportOverviewCellView
- (BOOL)usesInsetStyle;
- (SFPrivacyReportGridItemDelegate)delegate;
- (SFPrivacyReportOverviewCellView)initWithFrame:(CGRect)a3;
- (UIColor)cellBackgroundColor;
- (double)cellBackgroundCornerRadius;
- (double)maxWidth;
- (id)action;
- (unint64_t)gridPosition;
- (void)_updateHairlinesIfNeeded;
- (void)_updateLayoutMargins;
- (void)setAction:(id)a3;
- (void)setCellBackgroundColor:(id)a3;
- (void)setCellBackgroundCornerRadius:(double)a3;
- (void)setDelegate:(id)a3;
- (void)setGridPosition:(unint64_t)a3;
- (void)setMaxWidth:(double)a3;
- (void)setUsesInsetStyle:(BOOL)a3;
- (void)willMoveToWindow:(id)a3;
@end

@implementation SFPrivacyReportOverviewCellView

- (SFPrivacyReportOverviewCellView)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SFPrivacyReportOverviewCellView;
  v3 = -[SFPrivacyReportOverviewCellView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(SFPrivacyReportOverviewCellView *)v3 setEdgesPreservingSuperviewLayoutMargins:10];
    [(SFPrivacyReportOverviewCellView *)v4 _updateLayoutMargins];
    v5 = [(SFPrivacyReportOverviewCellView *)v4 layer];
    [v5 setCornerCurve:*MEMORY[0x1E4F39EA8]];
    [(SFPrivacyReportOverviewCellView *)v4 setClipsToBounds:1];
    v6 = v4;
  }
  return v4;
}

- (void)willMoveToWindow:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SFPrivacyReportOverviewCellView;
  [(SFPrivacyReportOverviewCellView *)&v4 willMoveToWindow:a3];
  [(SFPrivacyReportOverviewCellView *)self _updateHairlinesIfNeeded];
}

- (void)setUsesInsetStyle:(BOOL)a3
{
  if (self->_usesInsetStyle != a3)
  {
    self->_usesInsetStyle = a3;
    if (a3) {
      double v4 = 8.0;
    }
    else {
      double v4 = 0.0;
    }
    v5 = [(SFPrivacyReportOverviewCellView *)self layer];
    [v5 setCornerRadius:v4];

    [(SFPrivacyReportOverviewCellView *)self _updateHairlinesIfNeeded];
    [(SFPrivacyReportOverviewCellView *)self _updateLayoutMargins];
  }
}

- (void)_updateLayoutMargins
{
  [(SFPrivacyReportOverviewCellView *)self layoutMargins];

  [(SFPrivacyReportOverviewCellView *)self setLayoutMargins:"setLayoutMargins:"];
}

- (void)setGridPosition:(unint64_t)a3
{
  if (self->_gridPosition != a3)
  {
    self->_gridPosition = a3;
    [(SFPrivacyReportOverviewCellView *)self _updateHairlinesIfNeeded];
  }
}

- (void)_updateHairlinesIfNeeded
{
  v70[4] = *MEMORY[0x1E4F143B8];
  BOOL usesInsetStyle = self->_usesInsetStyle;
  if (self->_usesInsetStyle)
  {
    LODWORD(v4) = 0;
    BOOL v5 = 0;
  }
  else
  {
    unint64_t v4 = self->_gridPosition & 1;
    BOOL v5 = (self->_gridPosition & 8) == 0;
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __59__SFPrivacyReportOverviewCellView__updateHairlinesIfNeeded__block_invoke;
  aBlock[3] = &unk_1E54EC948;
  aBlock[4] = self;
  v6 = (void (**)(void))_Block_copy(aBlock);
  topHairline = self->_topHairline;
  if (v4)
  {
    if (topHairline) {
      goto LABEL_9;
    }
    v6[2](v6);
    objc_super v8 = (UIView *)objc_claimAutoreleasedReturnValue();
    v9 = self->_topHairline;
    self->_topHairline = v8;

    v50 = (void *)MEMORY[0x1E4F28DC8];
    v10 = [(UIView *)self->_topHairline topAnchor];
    v61 = [(SFPrivacyReportOverviewCellView *)self topAnchor];
    v58 = [v10 constraintEqualToAnchor:v61];
    v70[0] = v58;
    v55 = [(UIView *)self->_topHairline leadingAnchor];
    v52 = [(SFPrivacyReportOverviewCellView *)self leadingAnchor];
    v48 = [v55 constraintEqualToAnchor:v52];
    v70[1] = v48;
    v11 = [(UIView *)self->_topHairline trailingAnchor];
    v12 = [(SFPrivacyReportOverviewCellView *)self trailingAnchor];
    [v11 constraintEqualToAnchor:v12];
    v13 = v64 = v6;
    v70[2] = v13;
    v14 = [(UIView *)self->_topHairline heightAnchor];
    v15 = [v14 constraintEqualToConstant:_SFOnePixel()];
    v70[3] = v15;
    [MEMORY[0x1E4F1C978] arrayWithObjects:v70 count:4];
    v17 = BOOL v16 = v5;
    [v50 activateConstraints:v17];

    BOOL v5 = v16;
    v6 = v64;
  }
  else
  {
    [(UIView *)topHairline removeFromSuperview];
    v10 = self->_topHairline;
    self->_topHairline = 0;
  }

LABEL_9:
  bottomHairline = self->_bottomHairline;
  if (usesInsetStyle)
  {
    [(UIView *)bottomHairline removeFromSuperview];
    v19 = self->_bottomHairline;
    self->_bottomHairline = 0;
LABEL_11:

    goto LABEL_13;
  }
  if (!bottomHairline)
  {
    v6[2](v6);
    v33 = (UIView *)objc_claimAutoreleasedReturnValue();
    v34 = self->_bottomHairline;
    self->_bottomHairline = v33;

    v49 = (void *)MEMORY[0x1E4F28DC8];
    v19 = [(UIView *)self->_bottomHairline bottomAnchor];
    v63 = [(SFPrivacyReportOverviewCellView *)self bottomAnchor];
    v60 = objc_msgSend(v19, "constraintEqualToAnchor:");
    v69[0] = v60;
    v35 = [(UIView *)self->_bottomHairline leadingAnchor];
    unint64_t v54 = self->_gridPosition & 6;
    if (v54 == 4)
    {
      v51 = [(SFPrivacyReportOverviewCellView *)self layoutMarginsGuide];
      uint64_t v36 = [v51 leadingAnchor];
    }
    else
    {
      uint64_t v36 = [(SFPrivacyReportOverviewCellView *)self leadingAnchor];
      v51 = (void *)v36;
    }
    v66 = v6;
    v46 = (void *)v36;
    v37 = [v35 constraintEqualToAnchor:v36];
    v69[1] = v37;
    v38 = [(UIView *)self->_bottomHairline trailingAnchor];
    unint64_t v39 = self->_gridPosition & 0xA;
    BOOL v47 = v5;
    v57 = v35;
    if (v39 == 8)
    {
      v45 = [(SFPrivacyReportOverviewCellView *)self layoutMarginsGuide];
      [v45 trailingAnchor];
    }
    else
    {
      [(SFPrivacyReportOverviewCellView *)self trailingAnchor];
    v40 = };
    v41 = [v38 constraintEqualToAnchor:v40];
    v69[2] = v41;
    v42 = [(UIView *)self->_bottomHairline heightAnchor];
    v43 = [v42 constraintEqualToConstant:_SFOnePixel()];
    v69[3] = v43;
    v44 = [MEMORY[0x1E4F1C978] arrayWithObjects:v69 count:4];
    [v49 activateConstraints:v44];

    if (v39 == 8)
    {

      v40 = v45;
    }

    BOOL v5 = v47;
    if (v54 == 4) {

    }
    v6 = v66;
    goto LABEL_11;
  }
LABEL_13:
  trailingHairline = self->_trailingHairline;
  if (!v5)
  {
    [(UIView *)trailingHairline removeFromSuperview];
    v23 = self->_trailingHairline;
    self->_trailingHairline = 0;
    goto LABEL_17;
  }
  if (!trailingHairline)
  {
    v6[2](v6);
    v21 = (UIView *)objc_claimAutoreleasedReturnValue();
    v22 = self->_trailingHairline;
    self->_trailingHairline = v21;

    v53 = (void *)MEMORY[0x1E4F28DC8];
    v23 = [(UIView *)self->_trailingHairline topAnchor];
    v62 = [(SFPrivacyReportOverviewCellView *)self layoutMarginsGuide];
    v59 = [v62 topAnchor];
    v56 = [v23 constraintEqualToAnchor:v59];
    v68[0] = v56;
    v24 = [(UIView *)self->_trailingHairline bottomAnchor];
    v25 = [(SFPrivacyReportOverviewCellView *)self bottomAnchor];
    v26 = [v24 constraintEqualToAnchor:v25];
    v68[1] = v26;
    v27 = [(UIView *)self->_trailingHairline trailingAnchor];
    [(SFPrivacyReportOverviewCellView *)self trailingAnchor];
    v28 = v65 = v6;
    v29 = [v27 constraintEqualToAnchor:v28];
    v68[2] = v29;
    v30 = [(UIView *)self->_trailingHairline widthAnchor];
    v31 = [v30 constraintEqualToConstant:_SFOnePixel()];
    v68[3] = v31;
    v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:v68 count:4];
    [v53 activateConstraints:v32];

    v6 = v65;
LABEL_17:
  }
}

id __59__SFPrivacyReportOverviewCellView__updateHairlinesIfNeeded__block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  [v2 setTranslatesAutoresizingMaskIntoConstraints:0];
  v3 = [MEMORY[0x1E4FB1618] tertiaryLabelColor];
  [v2 setBackgroundColor:v3];

  [*(id *)(a1 + 32) addSubview:v2];

  return v2;
}

- (SFPrivacyReportGridItemDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SFPrivacyReportGridItemDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (unint64_t)gridPosition
{
  return self->_gridPosition;
}

- (UIColor)cellBackgroundColor
{
  return self->_cellBackgroundColor;
}

- (void)setCellBackgroundColor:(id)a3
{
}

- (double)cellBackgroundCornerRadius
{
  return self->_cellBackgroundCornerRadius;
}

- (void)setCellBackgroundCornerRadius:(double)a3
{
  self->_cellBackgroundCornerRadius = a3;
}

- (id)action
{
  return self->_action;
}

- (void)setAction:(id)a3
{
}

- (double)maxWidth
{
  return self->_maxWidth;
}

- (void)setMaxWidth:(double)a3
{
  self->_maxWidth = a3;
}

- (BOOL)usesInsetStyle
{
  return self->_usesInsetStyle;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_action, 0);
  objc_storeStrong((id *)&self->_cellBackgroundColor, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_trailingHairline, 0);
  objc_storeStrong((id *)&self->_bottomHairline, 0);

  objc_storeStrong((id *)&self->_topHairline, 0);
}

@end