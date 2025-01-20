@interface SiriUISnippetControllerCell
+ (CGRect)contentBoundsForCollectionViewCellBounds:(CGRect)a3 snippetViewController:(id)a4;
+ (double)defaultHeight;
+ (id)elementKind;
+ (id)reuseIdentifier;
- (SiriUISnippetControllerCell)initWithFrame:(CGRect)a3;
- (SiriUISnippetViewController)snippetViewController;
- (UIEdgeInsets)_snippetEdgeInsets;
- (double)_heightForFooterView;
- (double)_heightForHeaderView;
- (double)_heightForTransparentFooterView;
- (double)_heightForTransparentHeaderView;
- (id)accessibilityIdentifier;
- (void)_configureSubviewsForCurrentInset;
- (void)_setFooterView:(id)a3;
- (void)_setHeaderView:(id)a3;
- (void)_setSnippetEdgeInsets:(UIEdgeInsets)a3;
- (void)_setTransparentFooterView:(id)a3;
- (void)_setTransparentHeaderView:(id)a3;
- (void)_snippetPunchOutButtonTapped:(id)a3;
- (void)animateSnippetCancellationWithCompletion:(id)a3;
- (void)animateSnippetConfirmationWithCompletion:(id)a3;
- (void)animateSnippetResizeToSize:(CGSize)a3 completion:(id)a4;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setShowBackgroundView:(BOOL)a3;
- (void)setSnippetViewController:(id)a3;
- (void)setTopPadding:(double)a3;
@end

@implementation SiriUISnippetControllerCell

+ (CGRect)contentBoundsForCollectionViewCellBounds:(CGRect)a3 snippetViewController:(id)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v8 = a4;
  if (([v8 usePlatterStyle] & 1) != 0
    || [v8 _hasConfirmationOrCancelledInsets])
  {
    UIRectInset();
    CGFloat x = v9;
    CGFloat y = v10;
    CGFloat width = v11;
    CGFloat height = v12;
  }

  double v13 = x;
  double v14 = y;
  double v15 = width;
  double v16 = height;
  result.size.CGFloat height = v16;
  result.size.CGFloat width = v15;
  result.origin.CGFloat y = v14;
  result.origin.CGFloat x = v13;
  return result;
}

- (SiriUISnippetControllerCell)initWithFrame:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v29.receiver = self;
  v29.super_class = (Class)SiriUISnippetControllerCell;
  v7 = -[SiriUISnippetControllerCell initWithFrame:](&v29, sel_initWithFrame_);
  if (v7)
  {
    uint64_t v8 = +[SiriUIKeyline keyline];
    bottomKeyline = v7->_bottomKeyline;
    v7->_bottomKeyline = (SiriUIKeyline *)v8;

    uint64_t v10 = +[SiriUIContentButton button];
    snippetPunchOutButton = v7->_snippetPunchOutButton;
    v7->_snippetPunchOutButton = (SiriUIContentButton *)v10;

    [(SiriUIContentButton *)v7->_snippetPunchOutButton addTarget:v7 action:sel__snippetPunchOutButtonTapped_ forControlEvents:64];
    *(_OWORD *)&v7->_snippetEdgeInsets.top = SiriUIDefaultSnippetViewInsets;
    *(_OWORD *)&v7->_snippetEdgeInsets.bottom = *(_OWORD *)&qword_22323EA30;
    [(SiriUISnippetControllerCell *)v7 setPreservesSuperviewLayoutMargins:1];
    double v12 = [(SiriUISnippetControllerCell *)v7 contentView];
    [v12 setPreservesSuperviewLayoutMargins:1];

    uint64_t v13 = [MEMORY[0x263F74480] labelWithHeaderFont];
    cancelledLabel = v7->_cancelledLabel;
    v7->_cancelledLabel = (UILabel *)v13;

    double v15 = v7->_cancelledLabel;
    double v16 = objc_msgSend(MEMORY[0x263F1C550], "siriui_textColor");
    [(UILabel *)v15 setTextColor:v16];

    v17 = v7->_cancelledLabel;
    v18 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.SiriUI"];
    v19 = [v18 siriUILocalizedStringForKey:@"CANCELED"];
    [(UILabel *)v17 setText:v19];

    id v20 = objc_alloc(MEMORY[0x263F1CB60]);
    uint64_t v21 = objc_msgSend(v20, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    cancelledTouchPreventionView = v7->_cancelledTouchPreventionView;
    v7->_cancelledTouchPreventionView = (UIView *)v21;

    id v23 = objc_alloc(MEMORY[0x263F1CB60]);
    v30.origin.CGFloat x = x;
    v30.origin.CGFloat y = y;
    v30.size.CGFloat width = width;
    v30.size.CGFloat height = height;
    double v24 = CGRectGetWidth(v30);
    v31.origin.CGFloat x = x;
    v31.origin.CGFloat y = y;
    v31.size.CGFloat width = width;
    v31.size.CGFloat height = height;
    uint64_t v25 = objc_msgSend(v23, "initWithFrame:", 0.0, 0.0, v24, CGRectGetHeight(v31));
    clippingContainerView = v7->_clippingContainerView;
    v7->_clippingContainerView = (UIView *)v25;

    v27 = [(SiriUISnippetControllerCell *)v7 contentView];
    [v27 addSubview:v7->_clippingContainerView];
  }
  return v7;
}

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)SiriUISnippetControllerCell;
  [(SiriUISnippetControllerCell *)&v4 prepareForReuse];
  v3 = [(SiriUISnippetControllerCell *)self snippetViewController];
  [v3 setContainingView:0];
  [(UILabel *)self->_cancelledLabel removeFromSuperview];
  [(SiriUIContentButton *)self->_snippetPunchOutButton removeFromSuperview];
  [(SiriUIKeyline *)self->_bottomKeyline removeFromSuperview];
  [(UIView *)self->_cancelledTouchPreventionView removeFromSuperview];
  [(SiriUIKeyline *)self->_bottomKeyline setAlpha:1.0];
  self->_topPadding = 0.0;
  [(SiriUISnippetControllerCell *)self setSnippetViewController:0];
}

- (id)accessibilityIdentifier
{
  return @"SiriUISnippetControllerCellAccessibilityIdentifier";
}

- (void)layoutSubviews
{
  [(UIView *)self recursive_setSemanticContentAttribute:SiriLanguageSemanticContentAttribute()];
  v6.receiver = self;
  v6.super_class = (Class)SiriUISnippetControllerCell;
  [(SiriUISnippetControllerCell *)&v6 layoutSubviews];
  v3 = [(SiriUISnippetControllerCell *)self snippetViewController];
  [v3 siriWillLayoutSnippetView];

  [(SiriUISnippetControllerCell *)self _configureSubviewsForCurrentInset];
  objc_super v4 = [(SiriUISnippetControllerCell *)self snippetViewController];
  [v4 _cellDidLayoutSubviews];

  v5 = [(SiriUISnippetControllerCell *)self snippetViewController];
  [v5 siriDidLayoutSnippetView];
}

- (void)_configureSubviewsForCurrentInset
{
  [(SiriUISnippetControllerCell *)self bounds];
  UIRectInset();
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v11 = [(SiriUISnippetControllerCell *)self snippetViewController];
  if ([v11 _hasConfirmationButtons])
  {
    double v12 = [(SiriUISnippetControllerCell *)self snippetViewController];
    if ([v12 _willAnimateConfirmation])
    {

LABEL_6:
      double v15 = [(SiriUISnippetControllerCell *)self snippetViewController];
      objc_msgSend((id)objc_msgSend(v15, "footerViewClass"), "defaultHeight");
      double v17 = v16;

      double v77 = v17;
      double v10 = v10 + v17;
      goto LABEL_8;
    }
    uint64_t v13 = [(SiriUISnippetControllerCell *)self snippetViewController];
    int v14 = [v13 _willAnimateCancellation];

    if (v14) {
      goto LABEL_6;
    }
  }
  else
  {
  }
  [(SiriUISnippetControllerCell *)self _heightForFooterView];
  double v77 = v18;
LABEL_8:
  v19 = objc_opt_class();
  id v20 = [(SiriUISnippetControllerCell *)self snippetViewController];
  objc_msgSend(v19, "contentBoundsForCollectionViewCellBounds:snippetViewController:", v20, v4, v6, v8, v10);
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;
  CGFloat v28 = v27;

  [(SiriUISnippetControllerCell *)self _heightForTransparentHeaderView];
  CGFloat v30 = v29;
  -[SiriUIReusableView setFrame:](self->_transparentHeaderView, "setFrame:", v22, v24, v26, v29);
  [(SiriUISnippetControllerCell *)self _heightForTransparentFooterView];
  double v32 = v31;
  v82.origin.double x = v22;
  v82.origin.double y = v24;
  v82.size.double width = v26;
  v82.size.CGFloat height = v28;
  double Height = CGRectGetHeight(v82);
  v83.origin.double x = v22;
  v83.origin.double y = v24;
  v83.size.double width = v26;
  v83.size.CGFloat height = v32;
  CGFloat v34 = Height - CGRectGetHeight(v83);
  -[SiriUIReusableView setFrame:](self->_transparentFooterView, "setFrame:", v22, v34, v26, v32);
  v84.origin.double x = v22;
  v84.origin.double y = v24;
  v84.size.double width = v26;
  v84.size.CGFloat height = v30;
  CGRectGetHeight(v84);
  v85.origin.double x = v22;
  v85.origin.double y = v34;
  v85.size.double width = v26;
  v85.size.CGFloat height = v32;
  CGRectGetHeight(v85);
  UIRectInset();
  -[UIView setFrame:](self->_clippingContainerView, "setFrame:");
  [(UIView *)self->_clippingContainerView bounds];
  double v36 = v35;
  double v38 = v37;
  double v40 = v39;
  double v42 = v41;
  -[UIView setFrame:](self->_snippetBackgroundView, "setFrame:");
  -[UIView setFrame:](self->_cancelledTouchPreventionView, "setFrame:", v36, v38, v40, v42);
  [(SiriUISnippetControllerCell *)self _heightForHeaderView];
  CGFloat v44 = v43;
  -[SiriUIReusableView setFrame:](self->_headerView, "setFrame:", v36, v38, v40, v43);
  if (objc_opt_respondsToSelector())
  {
    [(SiriUIReusableView *)self->_footerView edgeInsets];
    double v46 = v36 + v45;
    double v48 = v38 + v47;
    double v50 = v40 - (v45 + v49);
  }
  else
  {
    double v46 = v36;
    double v48 = v38;
    double v50 = v40;
  }
  v86.origin.double x = v36;
  v86.origin.double y = v38;
  v86.size.double width = v40;
  v86.size.CGFloat height = v42;
  double v79 = v42;
  double v51 = CGRectGetHeight(v86);
  v87.origin.double x = v46;
  v87.origin.double y = v48;
  v87.size.double width = v50;
  v87.size.CGFloat height = v77;
  CGFloat v52 = v51 - CGRectGetHeight(v87);
  -[SiriUIReusableView setFrame:](self->_footerView, "setFrame:", v46, v52, v50, v77);
  v88.origin.double x = v36;
  v88.origin.double y = v38;
  v88.size.double width = v40;
  v88.size.CGFloat height = v44;
  CGFloat v74 = v38 + CGRectGetHeight(v88);
  v89.origin.double x = v36;
  v89.origin.double y = v38;
  v89.size.double width = v40;
  v89.size.CGFloat height = v44;
  CGFloat v53 = CGRectGetHeight(v89);
  CGFloat v54 = v46;
  CGFloat v55 = v44;
  double v56 = v53;
  v90.origin.double x = v54;
  v90.origin.double y = v52;
  v90.size.double width = v50;
  v90.size.CGFloat height = v77;
  CGFloat v57 = v79 - (v56 + CGRectGetHeight(v90));
  v91.origin.double x = v36;
  v91.origin.double y = v38;
  v91.size.double width = v40;
  v91.size.CGFloat height = v55;
  v95.origin.double x = v36;
  v95.origin.double y = v74;
  v95.size.double width = v40;
  v95.size.CGFloat height = v57;
  CGRect v92 = CGRectUnion(v91, v95);
  double x = v92.origin.x;
  double y = v92.origin.y;
  double v78 = v92.size.height;
  double width = v92.size.width;
  [(SiriUISnippetControllerCell *)self _snippetEdgeInsets];
  double v59 = v36 + v58;
  CGFloat v61 = v74 + v60;
  double v63 = v40 - (v58 + v62);
  CGFloat v65 = v57 - (v60 + v64);
  v66 = [(SiriUISnippetControllerCell *)self snippetViewController];
  v67 = [v66 view];
  objc_msgSend(v67, "setFrame:", v59, v61, v63, v65);

  -[SiriUIKeyline sizeThatFits:](self->_bottomKeyline, "sizeThatFits:", v40, v57);
  double v69 = v68;
  double v71 = v70;
  v93.origin.double x = v36;
  v93.origin.double y = v74;
  v93.size.double width = v40;
  v93.size.CGFloat height = v57;
  double MaxY = CGRectGetMaxY(v93);
  v94.origin.double x = v36;
  v94.origin.double y = v74;
  v94.size.double width = v69;
  v94.size.CGFloat height = v71;
  -[SiriUIKeyline setFrame:](self->_bottomKeyline, "setFrame:", v36, MaxY - CGRectGetHeight(v94), v69, v71);
  -[SiriUIContentButton setFrame:](self->_snippetPunchOutButton, "setFrame:", x, y, width, v78);
  -[UILabel sizeThatFits:](self->_cancelledLabel, "sizeThatFits:", width, v78);
  UIRectCenteredIntegralRect();
  cancelledLabel = self->_cancelledLabel;
  -[UILabel setFrame:](cancelledLabel, "setFrame:");
}

- (double)_heightForHeaderView
{
  double v3 = [(SiriUISnippetControllerCell *)self snippetViewController];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    double v5 = [(SiriUISnippetControllerCell *)self snippetViewController];
    [v5 desiredHeightForHeaderView];
    double v7 = v6;

    return v7;
  }
  else
  {
    double v9 = objc_opt_class();
    [v9 defaultHeight];
  }
  return result;
}

- (double)_heightForFooterView
{
  double v3 = [(SiriUISnippetControllerCell *)self snippetViewController];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    double v5 = [(SiriUISnippetControllerCell *)self snippetViewController];
    [v5 desiredHeightForFooterView];
    double v7 = v6;

    return v7;
  }
  else
  {
    double v9 = objc_opt_class();
    [v9 defaultHeight];
  }
  return result;
}

- (double)_heightForTransparentHeaderView
{
  double v3 = [(SiriUISnippetControllerCell *)self snippetViewController];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    double v5 = [(SiriUISnippetControllerCell *)self snippetViewController];
    [v5 desiredHeightForTransparentHeaderView];
    double v7 = v6;

    return v7;
  }
  else
  {
    double v9 = objc_opt_class();
    [v9 defaultHeight];
  }
  return result;
}

- (double)_heightForTransparentFooterView
{
  double v3 = [(SiriUISnippetControllerCell *)self snippetViewController];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    double v5 = [(SiriUISnippetControllerCell *)self snippetViewController];
    [v5 desiredHeightForTransparentFooterView];
    double v7 = v6;

    return v7;
  }
  else
  {
    double v9 = objc_opt_class();
    [v9 defaultHeight];
  }
  return result;
}

- (void)setSnippetViewController:(id)a3
{
  id v4 = a3;
  double v5 = [(SiriUISnippetControllerCell *)self contentView];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_snippetViewController);
  double v7 = [WeakRetained view];

  if ([v7 isDescendantOfView:v5])
  {
    id v8 = objc_loadWeakRetained((id *)&self->_snippetViewController);
    double v9 = [v8 view];
    [v9 removeFromSuperview];
  }
  id v10 = objc_storeWeak((id *)&self->_snippetViewController, v4);

  if (v4)
  {
    id v11 = objc_loadWeakRetained((id *)&self->_snippetViewController);
    [v11 setContainingView:self];

    id v12 = objc_loadWeakRetained((id *)&self->_snippetViewController);
    int v13 = [v12 usePlatterStyle];

    if (v13)
    {
      bottomKeyline = self->_bottomKeyline;
      double v15 = objc_msgSend(MEMORY[0x263F1C550], "siriui_platterKeylineColor");
      [(SiriUIKeyline *)bottomKeyline setCustomBackgroundColor:v15];
    }
    snippetBackgroundView = self->_snippetBackgroundView;
    CGFloat v53 = v5;
    if (!snippetBackgroundView || self->_cellIsUsingPlatterStyle != v13)
    {
      [(UIView *)snippetBackgroundView removeFromSuperview];
      id v17 = objc_alloc(MEMORY[0x263F1CB60]);
      double v18 = (UIView *)objc_msgSend(v17, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
      v19 = self->_snippetBackgroundView;
      self->_snippetBackgroundView = v18;

      if (v13)
      {
        BOOL v20 = 1;
        double v21 = [MEMORY[0x263F53FE8] materialViewWithRecipe:9 configuration:1];
        materialView = self->_materialView;
        self->_materialView = v21;

        [(UIView *)self->_materialView setAutoresizingMask:18];
        [(UIView *)self->_snippetBackgroundView addSubview:self->_materialView];
        double v23 = [(UIView *)self->_clippingContainerView layer];
        [v23 setCornerRadius:15.0];

        double v24 = [(UIView *)self->_clippingContainerView layer];
        [v24 setMasksToBounds:1];
      }
      else
      {
        double v25 = self->_snippetBackgroundView;
        double v26 = objc_msgSend(MEMORY[0x263F1C550], "siriui_snippetBackgroundColor");
        [(UIView *)v25 setBackgroundColor:v26];

        double v27 = [(UIView *)self->_clippingContainerView layer];
        [v27 setCornerRadius:0.0];

        double v24 = [(UIView *)self->_clippingContainerView layer];
        [v24 setMasksToBounds:0];
        BOOL v20 = 0;
      }

      self->_cellIsUsingPlatterStyle = v20;
      [(UIView *)self->_clippingContainerView addSubview:self->_snippetBackgroundView];
      [(UIView *)self->_clippingContainerView sendSubviewToBack:self->_snippetBackgroundView];
    }
    clippingContainerView = self->_clippingContainerView;
    id v29 = objc_loadWeakRetained((id *)&self->_snippetViewController);
    CGFloat v30 = [v29 view];
    [(UIView *)clippingContainerView addSubview:v30];

    id v31 = objc_loadWeakRetained((id *)&self->_snippetViewController);
    double v32 = [v31 _headerView];
    [(SiriUISnippetControllerCell *)self _setHeaderView:v32];

    id v33 = objc_loadWeakRetained((id *)&self->_snippetViewController);
    CGFloat v34 = [v33 _footerView];
    [(SiriUISnippetControllerCell *)self _setFooterView:v34];

    id v35 = objc_loadWeakRetained((id *)&self->_snippetViewController);
    double v36 = [v35 _transparentHeaderView];
    [(SiriUISnippetControllerCell *)self _setTransparentHeaderView:v36];

    id v37 = objc_loadWeakRetained((id *)&self->_snippetViewController);
    double v38 = [v37 _transparentFooterView];
    [(SiriUISnippetControllerCell *)self _setTransparentFooterView:v38];

    id v39 = objc_loadWeakRetained((id *)&self->_snippetViewController);
    [v39 defaultViewInsets];
    -[SiriUISnippetControllerCell _setSnippetEdgeInsets:](self, "_setSnippetEdgeInsets:");

    id v40 = objc_loadWeakRetained((id *)&self->_snippetViewController);
    LODWORD(v38) = [v40 isTransparent];

    if (v38)
    {
      [(UIView *)self->_snippetBackgroundView removeFromSuperview];
    }
    else
    {
      [(UIView *)self->_clippingContainerView addSubview:self->_snippetBackgroundView];
      [(UIView *)self->_clippingContainerView sendSubviewToBack:self->_snippetBackgroundView];
    }
    id v41 = objc_loadWeakRetained((id *)&self->_snippetViewController);
    double v42 = [v41 snippetPunchOut];

    if (v42)
    {
      [(UIView *)self->_clippingContainerView addSubview:self->_snippetPunchOutButton];
      [(UIView *)self->_clippingContainerView bringSubviewToFront:self->_snippetPunchOutButton];
    }
    id v43 = objc_loadWeakRetained((id *)&self->_snippetViewController);
    if ([v43 isCancelled])
    {
      id v44 = objc_loadWeakRetained((id *)&self->_snippetViewController);
      char v45 = [v44 _willAnimateCancellation];

      if ((v45 & 1) == 0)
      {
        double v46 = (void *)MEMORY[0x263F1CB60];
        v55[0] = MEMORY[0x263EF8330];
        v55[1] = 3221225472;
        v55[2] = __56__SiriUISnippetControllerCell_setSnippetViewController___block_invoke;
        v55[3] = &unk_26469EFA8;
        v55[4] = self;
        double v47 = v55;
        goto LABEL_24;
      }
    }
    else
    {
    }
    id v48 = objc_loadWeakRetained((id *)&self->_snippetViewController);
    if (([v48 isConfirmed] & 1) == 0)
    {

      goto LABEL_26;
    }
    id v49 = objc_loadWeakRetained((id *)&self->_snippetViewController);
    char v50 = [v49 _willAnimateConfirmation];

    if (v50)
    {
LABEL_26:
      id v51 = objc_loadWeakRetained((id *)&self->_snippetViewController);
      int v52 = [v51 _hasConfirmationButtons];

      if (v52) {
        [(UIView *)self->_clippingContainerView addSubview:self->_bottomKeyline];
      }
      [(SiriUISnippetControllerCell *)self setNeedsLayout];
      double v5 = v53;
      goto LABEL_29;
    }
    double v46 = (void *)MEMORY[0x263F1CB60];
    v54[0] = MEMORY[0x263EF8330];
    v54[1] = 3221225472;
    v54[2] = __56__SiriUISnippetControllerCell_setSnippetViewController___block_invoke_2;
    v54[3] = &unk_26469EFA8;
    v54[4] = self;
    double v47 = v54;
LABEL_24:
    [v46 performWithoutAnimation:v47];
    goto LABEL_26;
  }
LABEL_29:
}

uint64_t __56__SiriUISnippetControllerCell_setSnippetViewController___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) animateSnippetCancellationWithCompletion:0];
}

uint64_t __56__SiriUISnippetControllerCell_setSnippetViewController___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) animateSnippetConfirmationWithCompletion:0];
}

- (void)_setHeaderView:(id)a3
{
  id v5 = a3;
  [(SiriUIReusableView *)self->_headerView removeFromSuperview];
  objc_storeStrong((id *)&self->_headerView, a3);
  if (self->_headerView) {
    -[UIView addSubview:](self->_clippingContainerView, "addSubview:");
  }
}

- (void)_setFooterView:(id)a3
{
  id v5 = a3;
  [(SiriUIReusableView *)self->_footerView removeFromSuperview];
  objc_storeStrong((id *)&self->_footerView, a3);
  if (self->_footerView) {
    -[UIView addSubview:](self->_clippingContainerView, "addSubview:");
  }
}

- (void)_setTransparentHeaderView:(id)a3
{
  id v7 = a3;
  p_transparentHeaderView = &self->_transparentHeaderView;
  [(SiriUIReusableView *)self->_transparentHeaderView removeFromSuperview];
  objc_storeStrong((id *)&self->_transparentHeaderView, a3);
  if (self->_transparentHeaderView)
  {
    double v6 = [(SiriUISnippetControllerCell *)self contentView];
    [v6 addSubview:*p_transparentHeaderView];
  }
}

- (void)_setTransparentFooterView:(id)a3
{
  id v7 = a3;
  p_transparentFooterView = &self->_transparentFooterView;
  [(SiriUIReusableView *)self->_transparentFooterView removeFromSuperview];
  objc_storeStrong((id *)&self->_transparentFooterView, a3);
  if (self->_transparentFooterView)
  {
    double v6 = [(SiriUISnippetControllerCell *)self contentView];
    [v6 addSubview:*p_transparentFooterView];
  }
}

- (void)animateSnippetCancellationWithCompletion:(id)a3
{
  clippingContainerView = self->_clippingContainerView;
  cancelledTouchPreventionView = self->_cancelledTouchPreventionView;
  id v6 = a3;
  [(UIView *)clippingContainerView addSubview:cancelledTouchPreventionView];
  [(UIView *)self->_clippingContainerView bringSubviewToFront:self->_cancelledTouchPreventionView];
  [(UIView *)self->_clippingContainerView addSubview:self->_cancelledLabel];
  [(UIView *)self->_clippingContainerView bringSubviewToFront:self->_cancelledLabel];
  [(UILabel *)self->_cancelledLabel setAlpha:0.0];
  [(SiriUIReusableView *)self->_footerView frame];
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  [(UIView *)self->_clippingContainerView frame];
  uint64_t v16 = v15;
  uint64_t v18 = v17;
  uint64_t v20 = v19;
  double v22 = v21;
  v28.origin.double x = v8;
  v28.origin.double y = v10;
  v28.size.double width = v12;
  v28.size.CGFloat height = v14;
  CGFloat Height = CGRectGetHeight(v28);
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __72__SiriUISnippetControllerCell_animateSnippetCancellationWithCompletion___block_invoke;
  v24[3] = &unk_26469F568;
  v24[4] = self;
  *(CGFloat *)&v24[5] = v8;
  *(CGFloat *)&v24[6] = v10;
  *(CGFloat *)&v24[7] = v12;
  v24[8] = 0;
  v24[9] = v16;
  v24[10] = v18;
  v24[11] = v20;
  *(double *)&v24[12] = v22 - Height;
  long long v25 = *MEMORY[0x263F00148];
  uint64_t v26 = v20;
  double v27 = v22 - Height;
  [MEMORY[0x263F1CB60] animateWithDuration:v24 animations:v6 completion:0.3];
}

uint64_t __72__SiriUISnippetControllerCell_animateSnippetCancellationWithCompletion___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 720), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 672), "setFrame:", *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96));
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 656), "setFrame:", *(double *)(a1 + 104), *(double *)(a1 + 112), *(double *)(a1 + 120), *(double *)(a1 + 128));
  v2 = [*(id *)(a1 + 32) snippetViewController];
  double v3 = [v2 view];
  [v3 setAlpha:0.08];

  [*(id *)(*(void *)(a1 + 32) + 720) setAlpha:0.08];
  [*(id *)(*(void *)(a1 + 32) + 712) setAlpha:0.08];
  [*(id *)(*(void *)(a1 + 32) + 640) setAlpha:0.0];
  id v4 = *(void **)(*(void *)(a1 + 32) + 688);
  return [v4 setAlpha:1.0];
}

- (void)animateSnippetConfirmationWithCompletion:(id)a3
{
  id v4 = a3;
  [(SiriUISnippetControllerCell *)self _heightForFooterView];
  double v6 = v5;
  [(UIView *)self->_clippingContainerView frame];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_snippetViewController);
  [WeakRetained desiredHeight];
  double v15 = v14;
  id v16 = objc_loadWeakRetained((id *)&self->_snippetViewController);
  [v16 desiredHeightForHeaderView];
  CGFloat v18 = v6 + v15 + v17;
  double v19 = v6;

  [(SiriUIReusableView *)self->_footerView frame];
  double v21 = v20;
  double v23 = v22;
  double v27 = v22;
  v29.origin.double x = v8;
  v29.origin.double y = v10;
  v29.size.double width = v12;
  v29.size.CGFloat height = v18;
  double MaxY = CGRectGetMaxY(v29);
  double v24 = *(double *)(MEMORY[0x263F00148] + 8);
  double v25 = *MEMORY[0x263F00148];
  -[SiriUIReusableView setFrame:](self->_footerView, "setFrame:", v21, MaxY, v23, v19);
  -[UIView setFrame:](self->_clippingContainerView, "setFrame:", v8, v10, v12, v18);
  -[UIView setFrame:](self->_snippetBackgroundView, "setFrame:", v25, v24, v12, v18);
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __72__SiriUISnippetControllerCell_animateSnippetConfirmationWithCompletion___block_invoke;
  v28[3] = &unk_26469F568;
  v28[4] = self;
  *(double *)&v28[5] = v21;
  *(double *)&v28[6] = MaxY;
  *(double *)&v28[7] = v27;
  v28[8] = 0;
  *(double *)&v28[9] = v8;
  *(double *)&v28[10] = v10;
  *(double *)&v28[11] = v12;
  *(double *)&v28[12] = v18 - v19;
  *(double *)&v28[13] = v25;
  *(double *)&v28[14] = v24;
  *(double *)&v28[15] = v12;
  *(double *)&v28[16] = v18 - v19;
  [MEMORY[0x263F1CB60] animateWithDuration:v28 animations:v4 completion:0.3];
}

uint64_t __72__SiriUISnippetControllerCell_animateSnippetConfirmationWithCompletion___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 720), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 672), "setFrame:", *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96));
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 656), "setFrame:", *(double *)(a1 + 104), *(double *)(a1 + 112), *(double *)(a1 + 120), *(double *)(a1 + 128));
  v2 = *(void **)(*(void *)(a1 + 32) + 640);
  return [v2 setAlpha:0.0];
}

- (void)animateSnippetResizeToSize:(CGSize)a3 completion:(id)a4
{
  double height = a3.height;
  id v6 = a4;
  [(SiriUISnippetControllerCell *)self _heightForFooterView];
  double v8 = v7;
  [(UIView *)self->_clippingContainerView frame];
  uint64_t v24 = v10;
  uint64_t v25 = v9;
  CGFloat v12 = v11;
  CGFloat v13 = *MEMORY[0x263F00148];
  CGFloat v14 = *(double *)(MEMORY[0x263F00148] + 8);
  [(SiriUIReusableView *)self->_footerView frame];
  uint64_t v22 = v15;
  uint64_t v23 = v16;
  v27.origin.double x = v13;
  v27.origin.double y = v14;
  v27.size.double width = v12;
  v27.size.double height = height;
  double v17 = CGRectGetMaxY(v27) - v8;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_snippetViewController);
  double v19 = [WeakRetained view];
  [v19 frame];
  double v20 = CGRectGetHeight(v28);

  v29.origin.double x = v13;
  v29.origin.double y = v14;
  v29.size.double width = v12;
  v29.size.double height = height - v8;
  double v21 = v20 - CGRectGetHeight(v29);
  if (v21 < 0.0) {
    double v21 = -v21;
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __69__SiriUISnippetControllerCell_animateSnippetResizeToSize_completion___block_invoke;
  v26[3] = &unk_26469F590;
  v26[4] = self;
  v26[5] = v22;
  *(double *)&v26[6] = v17;
  v26[7] = v23;
  *(double *)&v26[8] = v8;
  v26[9] = v25;
  v26[10] = v24;
  *(CGFloat *)&v26[11] = v12;
  *(double *)&v26[12] = height;
  *(CGFloat *)&v26[13] = v13;
  *(CGFloat *)&v26[14] = v14;
  *(CGFloat *)&v26[15] = v12;
  *(double *)&v26[16] = height;
  *(CGFloat *)&v26[17] = v13;
  *(CGFloat *)&v26[18] = v14;
  *(CGFloat *)&v26[19] = v12;
  *(double *)&v26[20] = height - v8;
  objc_msgSend(MEMORY[0x263F1CB60], "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 0, v26, v6, fmin(v21 * 0.00005 + 0.2, 0.4), 0.0, 1.0, 0.5);
}

void __69__SiriUISnippetControllerCell_animateSnippetResizeToSize_completion___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 720), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 672), "setFrame:", *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96));
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 656), "setFrame:", *(double *)(a1 + 104), *(double *)(a1 + 112), *(double *)(a1 + 120), *(double *)(a1 + 128));
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 744));
  v2 = [WeakRetained view];
  objc_msgSend(v2, "setFrame:", *(double *)(a1 + 136), *(double *)(a1 + 144), *(double *)(a1 + 152), *(double *)(a1 + 160));
}

- (void)_snippetPunchOutButtonTapped:(id)a3
{
  id v3 = [(SiriUISnippetControllerCell *)self snippetViewController];
  [v3 _snippetPunchOutButtonTapped];
}

+ (id)reuseIdentifier
{
  v2 = (objc_class *)objc_opt_class();
  id v3 = NSStringFromClass(v2);
  id v4 = [v3 stringByAppendingString:@"ReuseIdentifier"];

  return v4;
}

+ (double)defaultHeight
{
  return 0.0;
}

+ (id)elementKind
{
  return 0;
}

- (void)setShowBackgroundView:(BOOL)a3
{
  if (a3)
  {
    [(UIView *)self->_clippingContainerView addSubview:self->_snippetBackgroundView];
    clippingContainerView = self->_clippingContainerView;
    snippetBackgroundView = self->_snippetBackgroundView;
    [(UIView *)clippingContainerView sendSubviewToBack:snippetBackgroundView];
  }
  else
  {
    id v6 = self->_snippetBackgroundView;
    [(UIView *)v6 removeFromSuperview];
  }
}

- (void)setTopPadding:(double)a3
{
  self->_topPadding = a3;
  [(SiriUISnippetControllerCell *)self setNeedsLayout];
}

- (SiriUISnippetViewController)snippetViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_snippetViewController);
  return (SiriUISnippetViewController *)WeakRetained;
}

- (UIEdgeInsets)_snippetEdgeInsets
{
  double top = self->_snippetEdgeInsets.top;
  double left = self->_snippetEdgeInsets.left;
  double bottom = self->_snippetEdgeInsets.bottom;
  double right = self->_snippetEdgeInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)_setSnippetEdgeInsets:(UIEdgeInsets)a3
{
  self->_snippetEdgeInsets = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_snippetViewController);
  objc_storeStrong((id *)&self->_transparentFooterView, 0);
  objc_storeStrong((id *)&self->_transparentHeaderView, 0);
  objc_storeStrong((id *)&self->_footerView, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_cancelledLabel, 0);
  objc_storeStrong((id *)&self->_cancelledTouchPreventionView, 0);
  objc_storeStrong((id *)&self->_clippingContainerView, 0);
  objc_storeStrong((id *)&self->_materialView, 0);
  objc_storeStrong((id *)&self->_snippetBackgroundView, 0);
  objc_storeStrong((id *)&self->_snippetPunchOutButton, 0);
  objc_storeStrong((id *)&self->_bottomKeyline, 0);
}

@end