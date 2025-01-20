@interface MFMessageHeaderViewBlock
- (BOOL)interactivelyResizing;
- (BOOL)separatorDrawsFlushWithLeadingEdge;
- (BOOL)separatorDrawsFlushWithTrailingEdge;
- (BOOL)separatorIsHidden;
- (BOOL)usingLargeTextLayout;
- (EFCancelable)observableCancelable;
- (MFMessageDisplayMetrics)displayMetrics;
- (MFMessageHeaderViewBlock)initWithFrame:(CGRect)a3;
- (MessageHeaderViewModel)viewModel;
- (NSLayoutConstraint)separatorLeading;
- (NSLayoutConstraint)separatorTrailing;
- (NSLayoutConstraint)trailingAccessoryViewLayoutGuideTrailing;
- (NSLayoutConstraint)trailingAccessoryViewLayoutGuideWidth;
- (SeparatorLayer)separator;
- (UILayoutGuide)trailingAccessoryViewLayoutGuide;
- (void)createPrimaryViews;
- (void)displayMessageUsingViewModel:(id)a3;
- (void)initializePrimaryLayoutConstraints;
- (void)prepareForReuse;
- (void)setDisplayMetrics:(id)a3;
- (void)setInteractivelyResizing:(BOOL)a3;
- (void)setObservableCancelable:(id)a3;
- (void)setSeparator:(id)a3;
- (void)setSeparatorDrawsFlushWithLeadingEdge:(BOOL)a3;
- (void)setSeparatorDrawsFlushWithTrailingEdge:(BOOL)a3;
- (void)setSeparatorIsHidden:(BOOL)a3;
- (void)setSeparatorLeading:(id)a3;
- (void)setSeparatorTrailing:(id)a3;
- (void)setTrailingAccessoryViewLayoutGuide:(id)a3;
- (void)setTrailingAccessoryViewLayoutGuideTrailing:(id)a3;
- (void)setTrailingAccessoryViewLayoutGuideWidth:(id)a3;
- (void)setUsingLargeTextLayout:(BOOL)a3;
- (void)setViewModel:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateConstraints;
@end

@implementation MFMessageHeaderViewBlock

- (MFMessageHeaderViewBlock)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)MFMessageHeaderViewBlock;
  v3 = -[MFMessageHeaderViewBlock initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [(id)*MEMORY[0x1E4FB2608] preferredContentSizeCategory];
    BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v4);

    v3->_usingLargeTextLayout = IsAccessibilityCategory;
    [(MFMessageHeaderViewBlock *)v3 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(MFMessageHeaderViewBlock *)v3 setPreservesSuperviewLayoutMargins:1];
    [(MFMessageHeaderViewBlock *)v3 setInsetsLayoutMarginsFromSafeArea:0];
    v6 = [MEMORY[0x1E4FB1618] mailConversationViewExpandedCellBackgroundColor];
    [(MFMessageHeaderViewBlock *)v3 setBackgroundColor:v6];

    [(MFMessageHeaderViewBlock *)v3 createPrimaryViews];
    [(MFMessageHeaderViewBlock *)v3 initializePrimaryLayoutConstraints];
    [(MFMessageHeaderViewBlock *)v3 setSeparatorDrawsFlushWithLeadingEdge:0];
    [(MFMessageHeaderViewBlock *)v3 setSeparatorDrawsFlushWithTrailingEdge:1];
  }
  return v3;
}

- (void)createPrimaryViews
{
  v3 = [SeparatorLayer alloc];
  v4 = -[SeparatorLayer initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  -[MFMessageHeaderViewBlock setSeparator:](self, "setSeparator:");

  id v5 = [(MFMessageHeaderViewBlock *)self separator];
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v6 = [(MFMessageHeaderViewBlock *)self separator];
  -[MFMessageHeaderViewBlock addSubview:](self, "addSubview:");

  id v7 = objc_alloc_init(MEMORY[0x1E4FB1940]);
  [(MFMessageHeaderViewBlock *)self setTrailingAccessoryViewLayoutGuide:"setTrailingAccessoryViewLayoutGuide:"];

  id v8 = [(MFMessageHeaderViewBlock *)self trailingAccessoryViewLayoutGuide];
  [(MFMessageHeaderViewBlock *)self addLayoutGuide:"addLayoutGuide:"];
}

- (void)initializePrimaryLayoutConstraints
{
  v21[4] = *MEMORY[0x1E4F143B8];
  v3 = [(MFMessageHeaderViewBlock *)self trailingAccessoryViewLayoutGuide];
  v4 = [v3 widthAnchor];
  +[MFMessageDisplayMetrics avatarDiameter];
  id v5 = objc_msgSend(v4, "constraintEqualToConstant:");
  [(MFMessageHeaderViewBlock *)self setTrailingAccessoryViewLayoutGuideWidth:v5];

  id v6 = [(MFMessageHeaderViewBlock *)self trailingAccessoryViewLayoutGuide];
  id v7 = [v6 trailingAnchor];
  id v8 = [(MFMessageHeaderViewBlock *)self trailingAnchor];
  v9 = [v7 constraintEqualToAnchor:v8];
  [(MFMessageHeaderViewBlock *)self setTrailingAccessoryViewLayoutGuideTrailing:v9];

  v20 = [(MFMessageHeaderViewBlock *)self trailingAccessoryViewLayoutGuideWidth];
  v21[0] = v20;
  v10 = [(MFMessageHeaderViewBlock *)self trailingAccessoryViewLayoutGuide];
  v11 = [v10 heightAnchor];
  v12 = [(MFMessageHeaderViewBlock *)self heightAnchor];
  v13 = [v11 constraintEqualToAnchor:v12];
  v21[1] = v13;
  v14 = [(MFMessageHeaderViewBlock *)self trailingAccessoryViewLayoutGuideTrailing];
  v21[2] = v14;
  v15 = [(MFMessageHeaderViewBlock *)self bottomAnchor];
  v16 = [(MFMessageHeaderViewBlock *)self separator];
  v17 = [v16 bottomAnchor];
  v18 = [v15 constraintEqualToAnchor:v17];
  v21[3] = v18;
  v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:4];

  [MEMORY[0x1E4F28DC8] activateConstraints:v19];
}

- (void)updateConstraints
{
  v15.receiver = self;
  v15.super_class = (Class)MFMessageHeaderViewBlock;
  [(MFMessageHeaderViewBlock *)&v15 updateConstraints];
  v3 = [(MFMessageHeaderViewBlock *)self displayMetrics];
  [v3 avatarDiameterForCurrentContentSize];
  double v5 = v4;
  id v6 = [(MFMessageHeaderViewBlock *)self trailingAccessoryViewLayoutGuideWidth];
  [v6 setConstant:v5];

  [(MFMessageHeaderViewBlock *)self directionalLayoutMargins];
  double v8 = v7;
  v9 = [(MFMessageHeaderViewBlock *)self displayMetrics];
  LODWORD(v6) = [v9 prefersFlushSeparator];

  if (v6)
  {
    v10 = [(MFMessageHeaderViewBlock *)self displayMetrics];
    [v10 minHorizontalSpacing];
    double v12 = v11;

    if (v12 >= v8 + -10.0) {
      double v8 = v12;
    }
    else {
      double v8 = v8 + -10.0;
    }
  }
  v13 = [(MFMessageHeaderViewBlock *)self trailingAccessoryViewLayoutGuideTrailing];
  [v13 setConstant:-v8];

  v14 = [(MFMessageHeaderViewBlock *)self separator];
  [(MFMessageHeaderViewBlock *)self bringSubviewToFront:v14];
}

- (void)setDisplayMetrics:(id)a3
{
  id v5 = a3;
  if (!-[MFMessageDisplayMetrics isEqual:](self->_displayMetrics, "isEqual:"))
  {
    objc_storeStrong((id *)&self->_displayMetrics, a3);
    [(MFMessageHeaderViewBlock *)self setNeedsUpdateConstraints];
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)MFMessageHeaderViewBlock;
  [(MFMessageHeaderViewBlock *)&v7 traitCollectionDidChange:v4];
  id v5 = [(id)*MEMORY[0x1E4FB2608] preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v5);

  [(MFMessageHeaderViewBlock *)self setUsingLargeTextLayout:IsAccessibilityCategory];
}

- (void)setSeparatorIsHidden:(BOOL)a3
{
  BOOL v3 = a3;
  self->_separatorIsHidden = a3;
  id v4 = [(MFMessageHeaderViewBlock *)self separator];
  [v4 setHidden:v3];
}

- (void)setSeparatorDrawsFlushWithLeadingEdge:(BOOL)a3
{
  int v3 = a3;
  id v5 = [(MFMessageHeaderViewBlock *)self separatorLeading];
  if (!v5
    || (int separatorDrawsFlushWithLeadingEdge = self->_separatorDrawsFlushWithLeadingEdge,
        v5,
        separatorDrawsFlushWithLeadingEdge != v3))
  {
    objc_super v7 = [(MFMessageHeaderViewBlock *)self separatorLeading];
    [v7 setActive:0];

    double v8 = [(MFMessageHeaderViewBlock *)self separator];
    v9 = [v8 leadingAnchor];
    if (v3)
    {
      v10 = [(MFMessageHeaderViewBlock *)self leadingAnchor];
      double v11 = [v9 constraintEqualToAnchor:v10 constant:-7.0];
      [(MFMessageHeaderViewBlock *)self setSeparatorLeading:v11];
    }
    else
    {
      v10 = [(MFMessageHeaderViewBlock *)self layoutMarginsGuide];
      double v11 = [v10 leadingAnchor];
      double v12 = [v9 constraintEqualToAnchor:v11 constant:-7.0];
      [(MFMessageHeaderViewBlock *)self setSeparatorLeading:v12];
    }
    v13 = [(MFMessageHeaderViewBlock *)self separatorLeading];
    [v13 setActive:1];
  }
  self->_int separatorDrawsFlushWithLeadingEdge = v3;
  [(MFMessageHeaderViewBlock *)self setNeedsUpdateConstraints];
}

- (void)setSeparatorDrawsFlushWithTrailingEdge:(BOOL)a3
{
  int v3 = a3;
  id v5 = [(MFMessageHeaderViewBlock *)self separatorTrailing];
  if (!v5
    || (int separatorDrawsFlushWithTrailingEdge = self->_separatorDrawsFlushWithTrailingEdge,
        v5,
        separatorDrawsFlushWithTrailingEdge != v3))
  {
    objc_super v7 = [(MFMessageHeaderViewBlock *)self separatorTrailing];
    [v7 setActive:0];

    double v8 = [(MFMessageHeaderViewBlock *)self separator];
    v9 = [v8 trailingAnchor];
    if (v3)
    {
      v10 = [(MFMessageHeaderViewBlock *)self trailingAnchor];
      double v11 = [v9 constraintEqualToAnchor:v10];
      [(MFMessageHeaderViewBlock *)self setSeparatorTrailing:v11];
    }
    else
    {
      v10 = [(MFMessageHeaderViewBlock *)self layoutMarginsGuide];
      double v11 = [v10 trailingAnchor];
      double v12 = [v9 constraintEqualToAnchor:v11 constant:7.0];
      [(MFMessageHeaderViewBlock *)self setSeparatorTrailing:v12];
    }
    v13 = [(MFMessageHeaderViewBlock *)self separatorTrailing];
    [v13 setActive:1];
  }
  self->_int separatorDrawsFlushWithTrailingEdge = v3;
  [(MFMessageHeaderViewBlock *)self setNeedsUpdateConstraints];
}

- (void)prepareForReuse
{
}

- (void)displayMessageUsingViewModel:(id)a3
{
  id v4 = a3;
  id v5 = [(MFMessageHeaderViewBlock *)self observableCancelable];
  [v5 cancel];

  [(MFMessageHeaderViewBlock *)self setViewModel:v4];
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  id v6 = [v4 modelObservable];
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  v10 = __57__MFMessageHeaderViewBlock_displayMessageUsingViewModel___block_invoke;
  double v11 = &unk_1E6D1B798;
  objc_copyWeak(&v12, &location);
  objc_super v7 = [v6 subscribeWithResultBlock:&v8];
  -[MFMessageHeaderViewBlock setObservableCancelable:](self, "setObservableCancelable:", v7, v8, v9, v10, v11);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __57__MFMessageHeaderViewBlock_displayMessageUsingViewModel___block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained setViewModel:v3];
}

- (MessageHeaderViewModel)viewModel
{
  return self->_viewModel;
}

- (void)setViewModel:(id)a3
{
}

- (MFMessageDisplayMetrics)displayMetrics
{
  return self->_displayMetrics;
}

- (SeparatorLayer)separator
{
  return self->_separator;
}

- (void)setSeparator:(id)a3
{
}

- (UILayoutGuide)trailingAccessoryViewLayoutGuide
{
  return self->_trailingAccessoryViewLayoutGuide;
}

- (void)setTrailingAccessoryViewLayoutGuide:(id)a3
{
}

- (BOOL)separatorIsHidden
{
  return self->_separatorIsHidden;
}

- (BOOL)separatorDrawsFlushWithLeadingEdge
{
  return self->_separatorDrawsFlushWithLeadingEdge;
}

- (BOOL)separatorDrawsFlushWithTrailingEdge
{
  return self->_separatorDrawsFlushWithTrailingEdge;
}

- (BOOL)usingLargeTextLayout
{
  return self->_usingLargeTextLayout;
}

- (void)setUsingLargeTextLayout:(BOOL)a3
{
  self->_usingLargeTextLayout = a3;
}

- (BOOL)interactivelyResizing
{
  return self->_interactivelyResizing;
}

- (void)setInteractivelyResizing:(BOOL)a3
{
  self->_interactivelyResizing = a3;
}

- (NSLayoutConstraint)trailingAccessoryViewLayoutGuideWidth
{
  return self->_trailingAccessoryViewLayoutGuideWidth;
}

- (void)setTrailingAccessoryViewLayoutGuideWidth:(id)a3
{
}

- (NSLayoutConstraint)trailingAccessoryViewLayoutGuideTrailing
{
  return self->_trailingAccessoryViewLayoutGuideTrailing;
}

- (void)setTrailingAccessoryViewLayoutGuideTrailing:(id)a3
{
}

- (NSLayoutConstraint)separatorLeading
{
  return self->_separatorLeading;
}

- (void)setSeparatorLeading:(id)a3
{
}

- (NSLayoutConstraint)separatorTrailing
{
  return self->_separatorTrailing;
}

- (void)setSeparatorTrailing:(id)a3
{
}

- (EFCancelable)observableCancelable
{
  return self->_observableCancelable;
}

- (void)setObservableCancelable:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observableCancelable, 0);
  objc_storeStrong((id *)&self->_separatorTrailing, 0);
  objc_storeStrong((id *)&self->_separatorLeading, 0);
  objc_storeStrong((id *)&self->_trailingAccessoryViewLayoutGuideTrailing, 0);
  objc_storeStrong((id *)&self->_trailingAccessoryViewLayoutGuideWidth, 0);
  objc_storeStrong((id *)&self->_trailingAccessoryViewLayoutGuide, 0);
  objc_storeStrong((id *)&self->_separator, 0);
  objc_storeStrong((id *)&self->_displayMetrics, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
}

@end