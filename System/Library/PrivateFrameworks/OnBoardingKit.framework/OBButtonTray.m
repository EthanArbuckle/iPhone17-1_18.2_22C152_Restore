@interface OBButtonTray
- (BOOL)_shouldHandleLandscapeiPhoneLayout;
- (BOOL)hasContent;
- (BOOL)isDetached;
- (CGSize)detachedSize;
- (CGSize)intrinsicContentSize;
- (NSArray)allButtons;
- (NSLayoutConstraint)buttonViewBottomConstraint;
- (NSLayoutConstraint)buttonViewLeadingConstraint;
- (NSLayoutConstraint)buttonViewTopConstraint;
- (NSLayoutConstraint)buttonViewTrailingConstraint;
- (NSLayoutConstraint)privacyLinkControllerLeadingConstraint;
- (NSLayoutConstraint)privacyLinkControllerTrailingConstraint;
- (NSMutableArray)buttons;
- (OBButtonTray)initWithFrame:(CGRect)a3;
- (OBButtonTrayLayoutGuide)buttonLayoutGuide;
- (OBLinkableTemplateLabel)captionLabel;
- (OBPrivacyLinkController)privacyLinkController;
- (UIStackView)stackView;
- (UIView)backdropContainer;
- (UIView)effectView;
- (UIView)privacyContainer;
- (UIViewController)parentViewController;
- (double)_privacyLinkControllerBottomPadding;
- (double)bottomPadding;
- (double)topPadding;
- (int64_t)backdropStyle;
- (int64_t)captionStyle;
- (unint64_t)templateType;
- (void)_setUpBackdrops;
- (void)_updateButtonConstraints;
- (void)_updateCaptionTextAppearance;
- (void)_updateTrayVisibility;
- (void)addButton:(id)a3;
- (void)didMoveToSuperview;
- (void)didMoveToWindow;
- (void)layoutSubviews;
- (void)removeAllButtons;
- (void)removeButton:(id)a3;
- (void)removeFromSuperview;
- (void)setBackdropContainer:(id)a3;
- (void)setBackdropStyle:(int64_t)a3;
- (void)setButtonLayoutGuide:(id)a3;
- (void)setButtonViewBottomConstraint:(id)a3;
- (void)setButtonViewLeadingConstraint:(id)a3;
- (void)setButtonViewTopConstraint:(id)a3;
- (void)setButtonViewTrailingConstraint:(id)a3;
- (void)setButtons:(id)a3;
- (void)setCaptionLabel:(id)a3;
- (void)setCaptionStyle:(int64_t)a3;
- (void)setCaptionText:(id)a3;
- (void)setCaptionText:(id)a3 instructionsForUseAction:(id)a4;
- (void)setCaptionText:(id)a3 learnMoreURL:(id)a4;
- (void)setCaptionText:(id)a3 style:(int64_t)a4;
- (void)setCaptionText:(id)a3 style:(int64_t)a4 instructionsForUseAction:(id)a5;
- (void)setCaptionText:(id)a3 style:(int64_t)a4 learnMoreURL:(id)a5;
- (void)setDetached:(BOOL)a3;
- (void)setEffectView:(id)a3;
- (void)setParentViewController:(id)a3;
- (void)setPrivacyContainer:(id)a3;
- (void)setPrivacyLinkController:(id)a3;
- (void)setPrivacyLinkControllerLeadingConstraint:(id)a3;
- (void)setPrivacyLinkControllerTrailingConstraint:(id)a3;
- (void)setPrivacyLinkForBundles:(id)a3;
- (void)setStackView:(id)a3;
- (void)setTemplateType:(unint64_t)a3;
- (void)showButtonsAvailable;
- (void)showButtonsBusy;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation OBButtonTray

- (OBButtonTray)initWithFrame:(CGRect)a3
{
  v77[12] = *MEMORY[0x1E4F143B8];
  v76.receiver = self;
  v76.super_class = (Class)OBButtonTray;
  v3 = -[OBButtonTray initWithFrame:](&v76, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [(OBButtonTray *)v3 setButtons:v4];

    id v5 = objc_alloc_init(MEMORY[0x1E4FB1C60]);
    [(OBButtonTray *)v3 setStackView:v5];

    v6 = [(OBButtonTray *)v3 stackView];
    [v6 setAxis:1];

    v7 = [(OBButtonTray *)v3 stackView];
    [v7 setSpacing:5.0];

    id v8 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    [(OBButtonTray *)v3 setPrivacyContainer:v8];

    v9 = [(OBButtonTray *)v3 privacyContainer];
    [v9 setTranslatesAutoresizingMaskIntoConstraints:0];

    id v10 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    [(OBButtonTray *)v3 setBackdropContainer:v10];

    v11 = [(OBButtonTray *)v3 stackView];
    [v11 setTranslatesAutoresizingMaskIntoConstraints:0];

    v12 = [(OBButtonTray *)v3 backdropContainer];
    [v12 setTranslatesAutoresizingMaskIntoConstraints:0];

    v13 = objc_alloc_init(OBButtonTrayLayoutGuide);
    [(OBButtonTray *)v3 setButtonLayoutGuide:v13];

    v14 = [(OBButtonTray *)v3 buttonLayoutGuide];
    [(OBButtonTray *)v3 addLayoutGuide:v14];

    v15 = [(OBButtonTray *)v3 backdropContainer];
    [(OBButtonTray *)v3 addSubview:v15];

    v16 = [(OBButtonTray *)v3 stackView];
    [(OBButtonTray *)v3 addSubview:v16];

    v17 = [(OBButtonTray *)v3 privacyContainer];
    [(OBButtonTray *)v3 addSubview:v17];

    v18 = [(OBButtonTray *)v3 privacyContainer];
    v19 = [v18 topAnchor];
    v20 = [(OBButtonTray *)v3 topAnchor];
    v21 = [v19 constraintEqualToAnchor:v20];
    [(OBButtonTray *)v3 setButtonViewTopConstraint:v21];

    v22 = [(OBButtonTray *)v3 buttonLayoutGuide];
    v23 = [v22 bottomAnchor];
    v24 = [(OBButtonTray *)v3 stackView];
    v25 = [v24 bottomAnchor];
    v26 = [v23 constraintEqualToAnchor:v25];
    [(OBButtonTray *)v3 setButtonViewBottomConstraint:v26];

    v27 = [(OBButtonTray *)v3 buttonLayoutGuide];
    v28 = [v27 leadingAnchor];
    v29 = [(OBButtonTray *)v3 stackView];
    v30 = [v29 leadingAnchor];
    v31 = [v28 constraintEqualToAnchor:v30];
    [(OBButtonTray *)v3 setButtonViewLeadingConstraint:v31];

    v32 = [(OBButtonTray *)v3 buttonLayoutGuide];
    v33 = [v32 trailingAnchor];
    v34 = [(OBButtonTray *)v3 stackView];
    v35 = [v34 trailingAnchor];
    v36 = [v33 constraintEqualToAnchor:v35];
    [(OBButtonTray *)v3 setButtonViewTrailingConstraint:v36];

    v59 = (void *)MEMORY[0x1E4F28DC8];
    v75 = [(OBButtonTray *)v3 stackView];
    v73 = [v75 topAnchor];
    v74 = [(OBButtonTray *)v3 privacyContainer];
    v72 = [v74 bottomAnchor];
    v71 = [v73 constraintEqualToAnchor:v72];
    v77[0] = v71;
    v70 = [(OBButtonTray *)v3 privacyContainer];
    v69 = [v70 leadingAnchor];
    v68 = [(OBButtonTray *)v3 leadingAnchor];
    v67 = [v69 constraintEqualToAnchor:v68];
    v77[1] = v67;
    v66 = [(OBButtonTray *)v3 privacyContainer];
    v65 = [v66 trailingAnchor];
    v64 = [(OBButtonTray *)v3 trailingAnchor];
    v63 = [v65 constraintEqualToAnchor:v64];
    v77[2] = v63;
    v62 = [(OBButtonTray *)v3 buttonViewTopConstraint];
    v77[3] = v62;
    v61 = [(OBButtonTray *)v3 buttonViewBottomConstraint];
    v77[4] = v61;
    v60 = [(OBButtonTray *)v3 buttonViewLeadingConstraint];
    v77[5] = v60;
    v58 = [(OBButtonTray *)v3 buttonViewTrailingConstraint];
    v77[6] = v58;
    v57 = [(OBButtonTray *)v3 buttonLayoutGuide];
    v56 = [v57 heightAnchor];
    v55 = [v56 constraintEqualToConstant:0.0];
    v77[7] = v55;
    v53 = [(OBButtonTray *)v3 widthAnchor];
    v54 = [(OBButtonTray *)v3 backdropContainer];
    v52 = [v54 widthAnchor];
    v51 = [v53 constraintEqualToAnchor:v52 multiplier:1.0];
    v77[8] = v51;
    v49 = [(OBButtonTray *)v3 heightAnchor];
    v50 = [(OBButtonTray *)v3 backdropContainer];
    v48 = [v50 heightAnchor];
    v47 = [v49 constraintEqualToAnchor:v48 multiplier:1.0];
    v77[9] = v47;
    v37 = [(OBButtonTray *)v3 leadingAnchor];
    v38 = [(OBButtonTray *)v3 backdropContainer];
    v39 = [v38 leadingAnchor];
    v40 = [v37 constraintEqualToAnchor:v39];
    v77[10] = v40;
    v41 = [(OBButtonTray *)v3 bottomAnchor];
    v42 = [(OBButtonTray *)v3 backdropContainer];
    v43 = [v42 bottomAnchor];
    v44 = [v41 constraintEqualToAnchor:v43];
    v77[11] = v44;
    v45 = [MEMORY[0x1E4F1C978] arrayWithObjects:v77 count:12];
    [v59 activateConstraints:v45];

    [(OBButtonTray *)v3 setBackdropStyle:1];
    [(OBButtonTray *)v3 _setUpBackdrops];
  }
  return v3;
}

- (void)removeFromSuperview
{
  v20[2] = *MEMORY[0x1E4F143B8];
  v3 = [(OBButtonTray *)self stackView];
  id v4 = [(OBButtonTray *)self buttonViewLeadingConstraint];
  v20[0] = v4;
  id v5 = [(OBButtonTray *)self buttonViewTrailingConstraint];
  v20[1] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:2];
  [v3 removeConstraints:v6];

  v7 = [(OBButtonTray *)self buttonLayoutGuide];
  id v8 = [v7 widthConstraint];
  [v8 setActive:0];

  v19.receiver = self;
  v19.super_class = (Class)OBButtonTray;
  [(OBButtonTray *)&v19 removeFromSuperview];
  v9 = [(OBButtonTray *)self buttonLayoutGuide];
  id v10 = [v9 leadingAnchor];
  v11 = [(OBButtonTray *)self stackView];
  v12 = [v11 leadingAnchor];
  v13 = [v10 constraintEqualToAnchor:v12];
  [(OBButtonTray *)self setButtonViewLeadingConstraint:v13];

  v14 = [(OBButtonTray *)self buttonLayoutGuide];
  v15 = [v14 trailingAnchor];
  v16 = [(OBButtonTray *)self stackView];
  v17 = [v16 trailingAnchor];
  v18 = [v15 constraintEqualToAnchor:v17];
  [(OBButtonTray *)self setButtonViewTrailingConstraint:v18];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)OBButtonTray;
  [(OBButtonTray *)&v3 layoutSubviews];
  [(OBButtonTray *)self _updateTrayVisibility];
}

- (NSArray)allButtons
{
  v2 = [(OBButtonTray *)self buttons];
  objc_super v3 = (void *)[v2 copy];

  return (NSArray *)v3;
}

- (void)showButtonsBusy
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  objc_super v3 = [(OBButtonTray *)self buttons];
  id v4 = [v3 firstObject];
  [v4 showsBusyIndicator];

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = [(OBButtonTray *)self buttons];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * v9++) setEnabled:0];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)showButtonsAvailable
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  objc_super v3 = [(OBButtonTray *)self buttons];
  id v4 = [v3 firstObject];
  [v4 hidesBusyIndicator];

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = [(OBButtonTray *)self buttons];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * v9++) setEnabled:1];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)addButton:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v20 = 0u;
    id v5 = [(OBButtonTray *)self buttons];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v20 != v8) {
            objc_enumerationMutation(v5);
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v18 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"A link button cannot be placed above a bold button." userInfo:0];
            objc_exception_throw(v18);
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v7);
    }
  }
  long long v10 = [(OBButtonTray *)self stackView];
  [v10 addArrangedSubview:v4];

  long long v11 = [(OBButtonTray *)self buttons];
  [v11 addObject:v4];

  [(OBButtonTray *)self _updateButtonConstraints];
  long long v12 = [(OBButtonTray *)self parentViewController];
  int v13 = [v12 isViewLoaded];

  if (v13)
  {
    v14 = [(OBButtonTray *)self parentViewController];
    uint64_t v15 = [v14 view];
    [v15 setNeedsLayout];

    v16 = [(OBButtonTray *)self parentViewController];
    v17 = [v16 view];
    [v17 layoutIfNeeded];
  }
}

- (void)removeButton:(id)a3
{
  id v4 = a3;
  id v5 = [(OBButtonTray *)self stackView];
  [v5 removeArrangedSubview:v4];

  uint64_t v6 = [(OBButtonTray *)self buttons];
  [v6 removeObject:v4];

  [v4 removeFromSuperview];
  [(OBButtonTray *)self _updateButtonConstraints];
  uint64_t v7 = [(OBButtonTray *)self parentViewController];
  LODWORD(v6) = [v7 isViewLoaded];

  if (v6)
  {
    uint64_t v8 = [(OBButtonTray *)self parentViewController];
    uint64_t v9 = [v8 view];
    [v9 setNeedsLayout];

    id v11 = [(OBButtonTray *)self parentViewController];
    long long v10 = [v11 view];
    [v10 layoutIfNeeded];
  }
}

- (void)removeAllButtons
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  objc_super v3 = [(OBButtonTray *)self buttons];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v16;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v15 + 1) + 8 * v7);
        uint64_t v9 = [(OBButtonTray *)self stackView];
        [v9 removeArrangedSubview:v8];

        [v8 removeFromSuperview];
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v5);
  }

  long long v10 = [(OBButtonTray *)self buttons];
  [v10 removeAllObjects];

  [(OBButtonTray *)self _updateButtonConstraints];
  id v11 = [(OBButtonTray *)self parentViewController];
  long long v12 = [v11 view];
  [v12 setNeedsLayout];

  int v13 = [(OBButtonTray *)self parentViewController];
  v14 = [v13 view];
  [v14 layoutIfNeeded];
}

- (void)setBackdropStyle:(int64_t)a3
{
  self->_backdropStyle = a3;
  [(OBButtonTray *)self _updateTrayVisibility];
}

- (void)setPrivacyLinkForBundles:(id)a3
{
  id v4 = +[OBPrivacyLinkController linkWithBundleIdentifiers:a3];
  [(OBButtonTray *)self setPrivacyLinkController:v4];
}

- (double)_privacyLinkControllerBottomPadding
{
  uint64_t v2 = MGGetProductType();
  BOOL v3 = v2 == 1895344378 || v2 == 2903084588;
  double result = 24.0;
  if (v3) {
    return 14.0;
  }
  return result;
}

- (void)setPrivacyLinkController:(id)a3
{
  v61[5] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [(OBButtonTray *)self captionLabel];

  if (v6)
  {
    id v46 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"Privacy link not permitted with caption text." userInfo:0];
    objc_exception_throw(v46);
  }
  uint64_t v7 = [(OBButtonTray *)self privacyLinkController];

  if (v7)
  {
    uint64_t v8 = [(OBButtonTray *)self privacyLinkController];
    uint64_t v9 = [v8 view];
    [v9 removeFromSuperview];

    long long v10 = [(OBButtonTray *)self privacyLinkController];
    [v10 removeFromParentViewController];

    privacyLinkController = self->_privacyLinkController;
    self->_privacyLinkController = 0;
  }
  if (v5)
  {
    objc_storeStrong((id *)&self->_privacyLinkController, a3);
    long long v12 = [(OBButtonTray *)self parentViewController];
    int v13 = [(OBButtonTray *)self privacyLinkController];
    [v12 addChildViewController:v13];

    v14 = [(OBButtonTray *)self privacyLinkController];
    long long v15 = [v14 view];
    [v15 setTranslatesAutoresizingMaskIntoConstraints:0];

    long long v16 = [(OBButtonTray *)self privacyContainer];
    long long v17 = [(OBButtonTray *)self privacyLinkController];
    long long v18 = [v17 view];
    [v16 addSubview:v18];

    [(OBButtonTray *)self _privacyLinkControllerBottomPadding];
    double v20 = v19;
    long long v21 = [(OBButtonTray *)self privacyLinkController];
    long long v22 = [v21 view];
    v23 = [v22 leadingAnchor];
    uint64_t v24 = [(OBButtonTray *)self leadingAnchor];
    [(OBButtonTray *)self parentViewController];
    v25 = id v60 = v5;
    v26 = [v25 view];
    [v26 directionalLayoutMargins];
    v28 = [v23 constraintGreaterThanOrEqualToAnchor:v24 constant:v27];
    [(OBButtonTray *)self setPrivacyLinkControllerLeadingConstraint:v28];

    v29 = [(OBButtonTray *)self privacyLinkController];
    v30 = [v29 view];
    v31 = [v30 trailingAnchor];
    v32 = [(OBButtonTray *)self trailingAnchor];
    v33 = [(OBButtonTray *)self parentViewController];
    v34 = [v33 view];
    [v34 directionalLayoutMargins];
    v36 = [v31 constraintLessThanOrEqualToAnchor:v32 constant:-v35];
    [(OBButtonTray *)self setPrivacyLinkControllerTrailingConstraint:v36];

    v50 = (void *)MEMORY[0x1E4F28DC8];
    v59 = [(OBButtonTray *)self privacyLinkControllerLeadingConstraint];
    v61[0] = v59;
    v58 = [(OBButtonTray *)self privacyLinkControllerTrailingConstraint];
    v61[1] = v58;
    v57 = [(OBButtonTray *)self privacyLinkController];
    v56 = [v57 view];
    v54 = [v56 centerXAnchor];
    v55 = [(OBButtonTray *)self privacyContainer];
    v53 = [v55 centerXAnchor];
    v52 = [v54 constraintEqualToAnchor:v53];
    v61[2] = v52;
    v51 = [(OBButtonTray *)self privacyLinkController];
    v49 = [v51 view];
    v47 = [v49 topAnchor];
    v48 = [(OBButtonTray *)self privacyContainer];
    v37 = [v48 topAnchor];
    v38 = [v47 constraintEqualToAnchor:v37];
    v61[3] = v38;
    v39 = [(OBButtonTray *)self privacyLinkController];
    v40 = [v39 textView];
    v41 = [v40 lastBaselineAnchor];
    v42 = [(OBButtonTray *)self privacyContainer];
    v43 = [v42 bottomAnchor];
    v44 = [v41 constraintEqualToAnchor:v43 constant:-v20];
    v61[4] = v44;
    v45 = [MEMORY[0x1E4F1C978] arrayWithObjects:v61 count:5];
    [v50 activateConstraints:v45];

    id v5 = v60;
    [(OBButtonTray *)self _updateButtonConstraints];
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)OBButtonTray;
  [(OBButtonTray *)&v4 traitCollectionDidChange:a3];
  [(OBButtonTray *)self _updateCaptionTextAppearance];
}

- (void)setDetached:(BOOL)a3
{
  if (self->_detached != a3)
  {
    self->_detached = a3;
    [(OBButtonTray *)self _updateButtonConstraints];
    [(OBButtonTray *)self bounds];
    double v5 = v4;
    double v7 = v6;
    [(OBButtonTray *)self intrinsicContentSize];
    if (v5 != v9 || v7 != v8)
    {
      [(OBButtonTray *)self invalidateIntrinsicContentSize];
      [(OBButtonTray *)self setNeedsLayout];
    }
  }
}

- (BOOL)hasContent
{
  uint64_t v2 = [(OBButtonTray *)self stackView];
  BOOL v3 = [v2 subviews];
  BOOL v4 = v3 != 0;

  return v4;
}

- (void)setCaptionText:(id)a3
{
}

- (void)setCaptionText:(id)a3 learnMoreURL:(id)a4
{
}

- (void)setCaptionText:(id)a3 style:(int64_t)a4 learnMoreURL:(id)a5
{
  id v8 = a5;
  [(OBButtonTray *)self setCaptionText:a3 style:a4];
  id v9 = [(OBButtonTray *)self captionLabel];
  [v9 setLearnMoreURL:v8];
}

- (void)setCaptionText:(id)a3 instructionsForUseAction:(id)a4
{
}

- (void)setCaptionText:(id)a3 style:(int64_t)a4 instructionsForUseAction:(id)a5
{
  id v8 = a5;
  [(OBButtonTray *)self setCaptionText:a3 style:a4];
  id v9 = [(OBButtonTray *)self captionLabel];
  [v9 setInstructionsForUseTextWithAction:v8];
}

- (void)setCaptionText:(id)a3 style:(int64_t)a4
{
  id v20 = a3;
  double v6 = [(OBButtonTray *)self privacyLinkController];

  if (v6)
  {
    id v19 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"Caption text not permitted with a privacy link." userInfo:0];
    objc_exception_throw(v19);
  }
  double v7 = [(OBButtonTray *)self captionLabel];

  if (v7)
  {
    id v8 = [(OBButtonTray *)self stackView];
    id v9 = [(OBButtonTray *)self captionLabel];
    [v8 removeArrangedSubview:v9];

    long long v10 = [(OBButtonTray *)self captionLabel];
    [v10 removeFromSuperview];
  }
  if ([v20 length])
  {
    id v11 = objc_alloc_init(OBLinkableTemplateLabel);
    [(OBButtonTray *)self setCaptionLabel:v11];

    long long v12 = [(OBButtonTray *)self captionLabel];
    [v12 setTranslatesAutoresizingMaskIntoConstraints:0];

    int v13 = [(OBButtonTray *)self captionLabel];
    [v13 setText:v20];

    v14 = [(OBButtonTray *)self captionLabel];
    [v14 setNumberOfLines:0];

    long long v15 = [(OBButtonTray *)self stackView];
    long long v16 = [(OBButtonTray *)self captionLabel];
    [v15 insertArrangedSubview:v16 atIndex:0];

    long long v17 = [(OBButtonTray *)self stackView];
    long long v18 = [(OBButtonTray *)self captionLabel];
    [v17 setCustomSpacing:v18 afterView:24.0];

    [(OBButtonTray *)self setCaptionStyle:a4];
    [(OBButtonTray *)self _updateCaptionTextAppearance];
  }
}

- (void)_updateCaptionTextAppearance
{
  int64_t v3 = [(OBButtonTray *)self captionStyle];
  if (v3 == 2)
  {
    id v8 = [MEMORY[0x1E4FB1618] labelColor];
    id v9 = [(OBButtonTray *)self captionLabel];
    [v9 setTextColor:v8];

    double v6 = (void *)MEMORY[0x1E4FB08E0];
    double v7 = (void *)MEMORY[0x1E4FB28C8];
  }
  else
  {
    if (v3 != 1) {
      return;
    }
    BOOL v4 = [MEMORY[0x1E4FB1618] lightGrayColor];
    double v5 = [(OBButtonTray *)self captionLabel];
    [v5 setTextColor:v4];

    double v6 = (void *)MEMORY[0x1E4FB08E0];
    double v7 = (void *)MEMORY[0x1E4FB28E0];
  }
  id v11 = [v6 preferredFontForTextStyle:*v7];
  long long v10 = [(OBButtonTray *)self captionLabel];
  [v10 setFont:v11];
}

- (void)didMoveToSuperview
{
  v17.receiver = self;
  v17.super_class = (Class)OBButtonTray;
  [(OBButtonTray *)&v17 didMoveToSuperview];
  int64_t v3 = [(OBButtonTray *)self superview];
  BOOL v4 = [(OBButtonTray *)self parentViewController];
  double v5 = [v4 view];

  if (v3 == v5)
  {
    id v8 = [(OBButtonTray *)self parentViewController];
    id v9 = [v8 view];
    [v9 directionalLayoutMargins];
    double v11 = v10;
    long long v12 = [(OBButtonTray *)self privacyLinkControllerLeadingConstraint];
    [v12 setConstant:v11];

    double v7 = [(OBButtonTray *)self parentViewController];
    int v13 = [v7 view];
    [v13 directionalLayoutMargins];
    double v15 = -v14;
    long long v16 = [(OBButtonTray *)self privacyLinkControllerTrailingConstraint];
    [v16 setConstant:v15];
  }
  else
  {
    double v6 = [(OBButtonTray *)self privacyLinkControllerLeadingConstraint];
    [v6 setConstant:0.0];

    double v7 = [(OBButtonTray *)self privacyLinkControllerTrailingConstraint];
    [v7 setConstant:0.0];
  }
}

- (void)didMoveToWindow
{
  v3.receiver = self;
  v3.super_class = (Class)OBButtonTray;
  [(OBButtonTray *)&v3 didMoveToWindow];
  [(OBButtonTray *)self _updateButtonConstraints];
}

- (void)_updateButtonConstraints
{
  objc_super v3 = [(OBButtonTray *)self buttons];
  if (![v3 count])
  {
    BOOL v4 = [(OBButtonTray *)self captionLabel];
    if (!v4)
    {
      double v10 = [(OBButtonTray *)self privacyLinkController];

      if (!v10) {
        return;
      }
      goto LABEL_5;
    }
  }
LABEL_5:
  [(OBButtonTray *)self topPadding];
  double v6 = v5;
  double v7 = [(OBButtonTray *)self buttonViewTopConstraint];
  [v7 setConstant:v6];

  [(OBButtonTray *)self bottomPadding];
  double v9 = v8;
  id v11 = [(OBButtonTray *)self buttonViewBottomConstraint];
  [v11 setConstant:v9];
}

- (double)topPadding
{
  double v3 = 5.0;
  if (![(OBButtonTray *)self _shouldHandleLandscapeiPhoneLayout])
  {
    BOOL v4 = [(OBButtonTray *)self buttons];
    uint64_t v5 = [v4 count];

    double v3 = 24.0;
    if (v5 == 1)
    {
      double v6 = [(OBButtonTray *)self buttons];
      double v7 = [v6 firstObject];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        double v8 = [(OBButtonTray *)self parentViewController];
        double v9 = [v8 tabBarController];

        double v3 = 6.0;
        if (!v9)
        {
          double v10 = +[OBDevice currentDevice];
          if ([v10 type] == 2)
          {
            id v11 = [(OBButtonTray *)self parentViewController];
            int v12 = objc_msgSend(v11, "ob_isFormSheet") ^ 1;
          }
          else
          {
            int v12 = 1;
          }

          int v13 = +[OBDevice currentDevice];
          int v14 = [v13 hasHomeButton];

          if ((v12 & ~v14) != 0) {
            double v3 = 34.0;
          }
          else {
            double v3 = 5.0;
          }
        }
      }
    }
  }
  return v3;
}

- (double)bottomPadding
{
  BOOL v3 = [(OBButtonTray *)self isDetached];
  double result = 20.0;
  if (!v3)
  {
    uint64_t v5 = [(OBButtonTray *)self buttons];
    uint64_t v6 = [v5 count];

    double v7 = 0.0;
    if (v6 == 1)
    {
      double v8 = [(OBButtonTray *)self buttons];
      double v9 = [v8 firstObject];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        +[OBTrayButton standardHeight];
        double v7 = v10 + 5.0;
      }
    }
    id v11 = +[OBDevice currentDevice];
    if ([v11 type] == 2)
    {
      int v12 = [(OBButtonTray *)self parentViewController];
      int v13 = objc_msgSend(v12, "ob_isFormSheet");
    }
    else
    {
      int v13 = 0;
    }

    int v14 = [(OBButtonTray *)self parentViewController];
    double v15 = [v14 tabBarController];

    double v16 = 6.0;
    if (v15) {
      return v7 + v16;
    }
    double v16 = 5.0;
    uint64_t v17 = MGGetProductType();
    if (v17 == 1895344378 || v17 == 2903084588) {
      return v7 + v16;
    }
    long long v18 = +[OBDevice currentDevice];
    if (([v18 hasHomeButton] | v13))
    {
    }
    else
    {
      BOOL v19 = [(OBButtonTray *)self _shouldHandleLandscapeiPhoneLayout];

      if (!v19)
      {
        double v16 = 34.0;
        return v7 + v16;
      }
    }
    id v20 = [(OBButtonTray *)self buttons];
    long long v21 = [v20 lastObject];
    objc_opt_class();
    int isKindOfClass = objc_opt_isKindOfClass();

    v23 = [(OBButtonTray *)self buttons];
    LODWORD(v20) = (unint64_t)[v23 count] > 1;

    if ((v20 & isKindOfClass) != 0) {
      double v16 = 24.0;
    }
    else {
      double v16 = 5.0;
    }
    return v7 + v16;
  }
  return result;
}

- (void)_setUpBackdrops
{
  v31[4] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4FB1F00]);
  BOOL v4 = [MEMORY[0x1E4FB14C8] effectWithStyle:1100];
  uint64_t v5 = (void *)[v3 initWithEffect:v4];
  [(OBButtonTray *)self setEffectView:v5];

  uint64_t v6 = [(OBButtonTray *)self effectView];
  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];

  double v7 = [(OBButtonTray *)self backdropContainer];
  double v8 = [(OBButtonTray *)self effectView];
  [v7 addSubview:v8];

  long long v22 = (void *)MEMORY[0x1E4F28DC8];
  v30 = [(OBButtonTray *)self backdropContainer];
  v28 = [v30 widthAnchor];
  v29 = [(OBButtonTray *)self effectView];
  double v27 = [v29 widthAnchor];
  v26 = [v28 constraintEqualToAnchor:v27 multiplier:1.0];
  v31[0] = v26;
  v25 = [(OBButtonTray *)self backdropContainer];
  v23 = [v25 heightAnchor];
  uint64_t v24 = [(OBButtonTray *)self effectView];
  long long v21 = [v24 heightAnchor];
  id v20 = [v23 constraintEqualToAnchor:v21 multiplier:1.0];
  v31[1] = v20;
  BOOL v19 = [(OBButtonTray *)self backdropContainer];
  long long v18 = [v19 leadingAnchor];
  double v9 = [(OBButtonTray *)self effectView];
  double v10 = [v9 leadingAnchor];
  id v11 = [v18 constraintEqualToAnchor:v10];
  v31[2] = v11;
  int v12 = [(OBButtonTray *)self backdropContainer];
  int v13 = [v12 bottomAnchor];
  int v14 = [(OBButtonTray *)self effectView];
  double v15 = [v14 bottomAnchor];
  double v16 = [v13 constraintEqualToAnchor:v15];
  v31[3] = v16;
  uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:4];
  [v22 activateConstraints:v17];

  [(OBButtonTray *)self _updateTrayVisibility];
}

- (void)_updateTrayVisibility
{
  id v3 = [(OBButtonTray *)self stackView];
  BOOL v4 = [v3 arrangedSubviews];
  if ([v4 count])
  {
    [(OBButtonTray *)self setHidden:0];
  }
  else
  {
    uint64_t v5 = [(OBButtonTray *)self privacyLinkController];
    [(OBButtonTray *)self setHidden:v5 == 0];
  }
  BOOL v6 = [(OBButtonTray *)self backdropStyle] == 1;
  id v7 = [(OBButtonTray *)self effectView];
  [v7 setHidden:v6];
}

- (CGSize)intrinsicContentSize
{
  id v3 = [(OBButtonTray *)self buttons];
  if ([v3 count]) {
    goto LABEL_4;
  }
  BOOL v4 = [(OBButtonTray *)self privacyLinkController];
  if (v4)
  {

LABEL_4:
    goto LABEL_5;
  }
  uint64_t v24 = [(OBButtonTray *)self captionLabel];

  if (!v24)
  {
    [(OBButtonTray *)self bounds];
    double v14 = v25;
    double v21 = 0.0;
    goto LABEL_8;
  }
LABEL_5:
  uint64_t v5 = [(OBButtonTray *)self privacyLinkController];
  BOOL v6 = [v5 view];
  [v6 intrinsicContentSize];
  double v8 = v7;

  if (v8 > 0.0)
  {
    [(OBButtonTray *)self _privacyLinkControllerBottomPadding];
    double v8 = v8 + v9;
  }
  double v10 = [(OBButtonTray *)self captionLabel];
  [v10 intrinsicContentSize];
  double v12 = v11;

  [(OBButtonTray *)self bounds];
  double v14 = v13;
  double v15 = [(OBButtonTray *)self stackView];
  [v15 bounds];
  double v17 = v16;
  [(OBButtonTray *)self bottomPadding];
  double v19 = v18 + v17;
  [(OBButtonTray *)self topPadding];
  double v21 = v8 + v12 + v20 + v19;

LABEL_8:
  double v22 = v14;
  double v23 = v21;
  result.height = v23;
  result.width = v22;
  return result;
}

- (BOOL)_shouldHandleLandscapeiPhoneLayout
{
  id v3 = +[OBDevice currentDevice];
  BOOL v4 = [v3 type] == 1
    && (unint64_t)(+[OBViewUtilities activeInterfaceOrientationForView:self]- 3) < 2;

  return v4;
}

- (CGSize)detachedSize
{
  id v3 = [(OBButtonTray *)self buttons];
  if ([v3 count]) {
    goto LABEL_4;
  }
  BOOL v4 = [(OBButtonTray *)self privacyLinkController];
  if (v4)
  {

LABEL_4:
    goto LABEL_5;
  }
  double v14 = [(OBButtonTray *)self captionLabel];

  if (!v14)
  {
    [(OBButtonTray *)self bounds];
    double v6 = v15;
    double v11 = 0.0;
    goto LABEL_6;
  }
LABEL_5:
  [(OBButtonTray *)self bounds];
  double v6 = v5;
  double v7 = [(OBButtonTray *)self stackView];
  [v7 bounds];
  double v9 = v8 + 20.0;
  [(OBButtonTray *)self topPadding];
  double v11 = v10 + v9;

LABEL_6:
  double v12 = v6;
  double v13 = v11;
  result.height = v13;
  result.width = v12;
  return result;
}

- (OBPrivacyLinkController)privacyLinkController
{
  return self->_privacyLinkController;
}

- (UIViewController)parentViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentViewController);
  return (UIViewController *)WeakRetained;
}

- (void)setParentViewController:(id)a3
{
}

- (int64_t)backdropStyle
{
  return self->_backdropStyle;
}

- (NSMutableArray)buttons
{
  return self->_buttons;
}

- (void)setButtons:(id)a3
{
}

- (OBButtonTrayLayoutGuide)buttonLayoutGuide
{
  return self->_buttonLayoutGuide;
}

- (void)setButtonLayoutGuide:(id)a3
{
}

- (OBLinkableTemplateLabel)captionLabel
{
  return self->_captionLabel;
}

- (void)setCaptionLabel:(id)a3
{
}

- (int64_t)captionStyle
{
  return self->_captionStyle;
}

- (void)setCaptionStyle:(int64_t)a3
{
  self->_captionStyle = a3;
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
}

- (UIView)backdropContainer
{
  return self->_backdropContainer;
}

- (void)setBackdropContainer:(id)a3
{
}

- (UIView)effectView
{
  return self->_effectView;
}

- (void)setEffectView:(id)a3
{
}

- (NSLayoutConstraint)buttonViewTopConstraint
{
  return self->_buttonViewTopConstraint;
}

- (void)setButtonViewTopConstraint:(id)a3
{
}

- (NSLayoutConstraint)buttonViewBottomConstraint
{
  return self->_buttonViewBottomConstraint;
}

- (void)setButtonViewBottomConstraint:(id)a3
{
}

- (NSLayoutConstraint)buttonViewLeadingConstraint
{
  return self->_buttonViewLeadingConstraint;
}

- (void)setButtonViewLeadingConstraint:(id)a3
{
}

- (NSLayoutConstraint)buttonViewTrailingConstraint
{
  return self->_buttonViewTrailingConstraint;
}

- (void)setButtonViewTrailingConstraint:(id)a3
{
}

- (NSLayoutConstraint)privacyLinkControllerLeadingConstraint
{
  return self->_privacyLinkControllerLeadingConstraint;
}

- (void)setPrivacyLinkControllerLeadingConstraint:(id)a3
{
}

- (NSLayoutConstraint)privacyLinkControllerTrailingConstraint
{
  return self->_privacyLinkControllerTrailingConstraint;
}

- (void)setPrivacyLinkControllerTrailingConstraint:(id)a3
{
}

- (UIView)privacyContainer
{
  return self->_privacyContainer;
}

- (void)setPrivacyContainer:(id)a3
{
}

- (BOOL)isDetached
{
  return self->_detached;
}

- (unint64_t)templateType
{
  return self->_templateType;
}

- (void)setTemplateType:(unint64_t)a3
{
  self->_templateType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privacyContainer, 0);
  objc_storeStrong((id *)&self->_privacyLinkControllerTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_privacyLinkControllerLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_buttonViewTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_buttonViewLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_buttonViewBottomConstraint, 0);
  objc_storeStrong((id *)&self->_buttonViewTopConstraint, 0);
  objc_storeStrong((id *)&self->_effectView, 0);
  objc_storeStrong((id *)&self->_backdropContainer, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_captionLabel, 0);
  objc_storeStrong((id *)&self->_buttonLayoutGuide, 0);
  objc_storeStrong((id *)&self->_buttons, 0);
  objc_destroyWeak((id *)&self->_parentViewController);
  objc_storeStrong((id *)&self->_privacyLinkController, 0);
}

@end