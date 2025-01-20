@interface UIInputLayoutHostingItem
+ (BOOL)requiresConstraintBasedLayout;
- (BOOL)isFloating;
- (BOOL)isOnScreen;
- (CGRect)visibleFrame;
- (NSArray)guideConstraints;
- (NSArray)inputSetConstraints;
- (NSArray)offscreenConstraints;
- (NSArray)onscreenConstraints;
- (NSLayoutConstraint)bottomConstraint;
- (NSLayoutConstraint)keyplaneWidthConstraint;
- (NSLayoutConstraint)leftConstraint;
- (NSLayoutConstraint)rightConstraint;
- (UIInputLayoutHostingItem)initWithContainer:(id)a3;
- (UIInputLayoutHostingItem)initWithInputViewSet:(id)a3 container:(id)a4;
- (UIInputViewSet)inputViewSet;
- (UIInputWindowControllerHosting)hosting;
- (UIKBInputBackdropView)standardBackgroundView;
- (UILayoutGuide)accessoryLayoutGuide;
- (UILayoutGuide)assistantLayoutGuide;
- (UILayoutGuide)belowInputLayoutGuide;
- (UILayoutGuide)inputViewLayoutGuide;
- (UIPinchGestureRecognizer)pinchGesture;
- (UIView)containerView;
- (UIView)inputLayoutAccessoryView;
- (UIView)inputLayoutAssistantView;
- (UIView)inputLayoutView;
- (UIView)pillView;
- (UIView)platterView;
- (id)constraintsForView:(id)a3 embeddedInGuide:(id)a4;
- (id)constraintsForView:(id)a3 embeddedInView:(id)a4 insets:(UIEdgeInsets)a5;
- (id)inputAccessoryView;
- (id)inputAssistantView;
- (id)inputView;
- (void)changeOnScreen:(BOOL)a3 animated:(BOOL)a4;
- (void)constrainGuidesIfNeeded;
- (void)constrainViewsToGuidesIfNeeded;
- (void)createBackdropView;
- (void)createPlatterBackdropView;
- (void)hideBackdrop:(BOOL)a3;
- (void)setAccessoryLayoutGuide:(id)a3;
- (void)setAssistantLayoutGuide:(id)a3;
- (void)setBelowInputLayoutGuide:(id)a3;
- (void)setBottomConstraint:(id)a3;
- (void)setContainerView:(id)a3;
- (void)setGuideConstraints:(id)a3;
- (void)setHosting:(id)a3;
- (void)setInputLayoutAccessoryView:(id)a3;
- (void)setInputLayoutAssistantView:(id)a3;
- (void)setInputLayoutView:(id)a3;
- (void)setInputSetConstraints:(id)a3;
- (void)setInputViewLayoutGuide:(id)a3;
- (void)setInputViewSet:(id)a3;
- (void)setIsFloating:(BOOL)a3;
- (void)setIsOnScreen:(BOOL)a3;
- (void)setKeyplaneWidthConstraint:(id)a3;
- (void)setLeftConstraint:(id)a3;
- (void)setOffscreenConstraints:(id)a3;
- (void)setOnscreenConstraints:(id)a3;
- (void)setPillView:(id)a3;
- (void)setPinchGesture:(id)a3;
- (void)setPlatterView:(id)a3;
- (void)setRightConstraint:(id)a3;
- (void)setStandardBackgroundView:(id)a3;
- (void)trackPinch:(id)a3;
- (void)updateInputViewSet:(id)a3;
- (void)updateVisibilityConstraintsForPlacement:(id)a3;
@end

@implementation UIInputLayoutHostingItem

- (UIInputLayoutHostingItem)initWithContainer:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)UIInputLayoutHostingItem;
  v5 = [(UIInputWindowControllerHostingItem *)&v18 initWithContainer:v4];
  v6 = v5;
  if (v5)
  {
    uint64_t v7 = [(UIInputWindowControllerHostingItem *)v5 hostView];
    containerView = v6->_containerView;
    v6->_containerView = (UIView *)v7;

    [(UIView *)v6->_containerView setTranslatesAutoresizingMaskIntoConstraints:0];
    objc_storeWeak((id *)&v6->_hosting, v4);
    v9 = objc_alloc_init(UILayoutGuide);
    belowInputLayoutGuide = v6->_belowInputLayoutGuide;
    v6->_belowInputLayoutGuide = v9;

    [(UILayoutGuide *)v6->_belowInputLayoutGuide setIdentifier:@"belowInputLayoutGuide"];
    v11 = objc_alloc_init(UILayoutGuide);
    inputViewLayoutGuide = v6->_inputViewLayoutGuide;
    v6->_inputViewLayoutGuide = v11;

    [(UILayoutGuide *)v6->_inputViewLayoutGuide setIdentifier:@"inputViewLayoutGuide"];
    v13 = objc_alloc_init(UILayoutGuide);
    assistantLayoutGuide = v6->_assistantLayoutGuide;
    v6->_assistantLayoutGuide = v13;

    [(UILayoutGuide *)v6->_assistantLayoutGuide setIdentifier:@"assistantLayoutGuide"];
    v15 = objc_alloc_init(UILayoutGuide);
    accessoryLayoutGuide = v6->_accessoryLayoutGuide;
    v6->_accessoryLayoutGuide = v15;

    [(UILayoutGuide *)v6->_accessoryLayoutGuide setIdentifier:@"accessoryLayoutGuide"];
  }

  return v6;
}

- (UIInputLayoutHostingItem)initWithInputViewSet:(id)a3 container:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)UIInputLayoutHostingItem;
  v8 = [(UIInputWindowControllerHostingItem *)&v21 initWithContainer:v7];
  v9 = v8;
  if (v8)
  {
    uint64_t v10 = [(UIInputWindowControllerHostingItem *)v8 hostView];
    containerView = v9->_containerView;
    v9->_containerView = (UIView *)v10;

    [(UIView *)v9->_containerView setTranslatesAutoresizingMaskIntoConstraints:0];
    objc_storeWeak((id *)&v9->_hosting, v7);
    v12 = objc_alloc_init(UILayoutGuide);
    belowInputLayoutGuide = v9->_belowInputLayoutGuide;
    v9->_belowInputLayoutGuide = v12;

    [(UILayoutGuide *)v9->_belowInputLayoutGuide setIdentifier:@"belowInputLayoutGuide"];
    v14 = objc_alloc_init(UILayoutGuide);
    inputViewLayoutGuide = v9->_inputViewLayoutGuide;
    v9->_inputViewLayoutGuide = v14;

    [(UILayoutGuide *)v9->_inputViewLayoutGuide setIdentifier:@"inputViewLayoutGuide"];
    v16 = objc_alloc_init(UILayoutGuide);
    assistantLayoutGuide = v9->_assistantLayoutGuide;
    v9->_assistantLayoutGuide = v16;

    [(UILayoutGuide *)v9->_assistantLayoutGuide setIdentifier:@"assistantLayoutGuide"];
    objc_super v18 = objc_alloc_init(UILayoutGuide);
    accessoryLayoutGuide = v9->_accessoryLayoutGuide;
    v9->_accessoryLayoutGuide = v18;

    [(UILayoutGuide *)v9->_accessoryLayoutGuide setIdentifier:@"accessoryLayoutGuide"];
    [(UIInputLayoutHostingItem *)v9 updateInputViewSet:v6];
  }

  return v9;
}

- (void)updateInputViewSet:(id)a3
{
  id v38 = a3;
  [(UIInputLayoutHostingItem *)self constrainGuidesIfNeeded];
  [(UIInputLayoutHostingItem *)self createPlatterBackdropView];
  id v4 = v38;
  if (v38)
  {
    char v5 = [v38 isEmpty];
    id v4 = v38;
    if ((v5 & 1) == 0)
    {
      id v6 = (void *)MEMORY[0x1E4F5B268];
      id v7 = [(UIInputLayoutHostingItem *)self inputSetConstraints];
      [v6 deactivateConstraints:v7];

      [(UIInputLayoutHostingItem *)self setInputViewSet:v38];
      v8 = [(UIInputLayoutHostingItem *)self inputLayoutView];
      v9 = [(UIInputLayoutHostingItem *)self pinchGesture];
      [v8 removeGestureRecognizer:v9];

      uint64_t v10 = [(UIInputLayoutHostingItem *)self inputLayoutView];
      [v10 removeFromSuperview];

      v11 = [(UIInputLayoutHostingItem *)self inputLayoutAccessoryView];
      [v11 removeFromSuperview];

      v12 = [(UIInputLayoutHostingItem *)self inputLayoutAssistantView];
      [v12 removeFromSuperview];

      v13 = [v38 inputView];
      [(UIInputLayoutHostingItem *)self setInputLayoutView:v13];

      v14 = [(UIInputLayoutHostingItem *)self inputLayoutView];
      [v14 setTranslatesAutoresizingMaskIntoConstraints:0];

      v15 = [(UIInputLayoutHostingItem *)self inputLayoutView];
      [v15 setAccessibilityIdentifier:@"inputLayoutView"];

      v16 = [v38 inputAssistantView];
      [(UIInputLayoutHostingItem *)self setInputLayoutAssistantView:v16];

      v17 = [(UIInputLayoutHostingItem *)self inputLayoutAssistantView];
      [v17 setTranslatesAutoresizingMaskIntoConstraints:0];

      objc_super v18 = [(UIInputLayoutHostingItem *)self inputLayoutAssistantView];
      [v18 setAccessibilityIdentifier:@"inputLayoutAssistantView"];

      v19 = [v38 inputAccessoryView];
      [(UIInputLayoutHostingItem *)self setInputLayoutAccessoryView:v19];

      v20 = [(UIInputLayoutHostingItem *)self inputLayoutAccessoryView];
      [v20 setTranslatesAutoresizingMaskIntoConstraints:0];

      objc_super v21 = [(UIInputLayoutHostingItem *)self inputLayoutAccessoryView];
      [v21 setAccessibilityIdentifier:@"inputLayoutAccessoryView"];

      v22 = [(UIInputLayoutHostingItem *)self containerView];
      v23 = [(UIInputLayoutHostingItem *)self inputLayoutView];
      [v22 addSubview:v23];

      v24 = [(UIInputLayoutHostingItem *)self containerView];
      v25 = [(UIInputLayoutHostingItem *)self inputLayoutAssistantView];
      [v24 addSubview:v25];

      v26 = [(UIInputLayoutHostingItem *)self containerView];
      v27 = [(UIInputLayoutHostingItem *)self inputLayoutAccessoryView];
      [v26 addSubview:v27];

      v28 = [(UIInputLayoutHostingItem *)self pinchGesture];

      if (!v28)
      {
        v29 = [(UIGestureRecognizer *)[UIPinchGestureRecognizer alloc] initWithTarget:self action:sel_trackPinch_];
        [(UIInputLayoutHostingItem *)self setPinchGesture:v29];
      }
      v30 = [(UIInputLayoutHostingItem *)self inputLayoutView];
      v31 = [(UIInputLayoutHostingItem *)self pinchGesture];
      [v30 addGestureRecognizer:v31];

      if ([v38 isInputViewPlaceholder])
      {
        [(UIInputLayoutHostingItem *)self hideBackdrop:1];
      }
      else
      {
        [(UIInputLayoutHostingItem *)self hideBackdrop:0];
        v32 = [v38 inputViewController];
        v33 = [v32 traitCollection];
        if ([v33 userInterfaceIdiom] == 1)
        {
          v34 = [v38 inputViewController];
          v35 = [v34 traitCollection];
          BOOL v36 = [v35 horizontalSizeClass] != 1;
        }
        else
        {
          BOOL v36 = 1;
        }

        v37 = [(UIInputLayoutHostingItem *)self pillView];
        [v37 setHidden:v36];
      }
      [(UIInputLayoutHostingItem *)self constrainViewsToGuidesIfNeeded];
      id v4 = v38;
    }
  }
}

- (void)hideBackdrop:(BOOL)a3
{
  BOOL v3 = a3;
  char v5 = [(UIInputLayoutHostingItem *)self standardBackgroundView];

  if (v5)
  {
    id v6 = [(UIInputLayoutHostingItem *)self standardBackgroundView];
    [v6 setHidden:v3];
  }
  id v7 = [(UIInputLayoutHostingItem *)self platterView];

  if (v7)
  {
    id v8 = [(UIInputLayoutHostingItem *)self platterView];
    [v8 setHidden:v3];
  }
}

- (void)changeOnScreen:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __52__UIInputLayoutHostingItem_changeOnScreen_animated___block_invoke;
  aBlock[3] = &unk_1E52DC3A0;
  aBlock[4] = self;
  id v7 = (void (**)(void *, uint64_t))_Block_copy(aBlock);
  if ([(UIInputLayoutHostingItem *)self isOnScreen] || !v5)
  {
    if (![(UIInputLayoutHostingItem *)self isOnScreen] || v5)
    {
      if ([(UIInputLayoutHostingItem *)self isOnScreen]
        || [(UIInputLayoutHostingItem *)self isFloating])
      {
        v9 = [(UIInputLayoutHostingItem *)self onscreenConstraints];
        uint64_t v10 = [v9 firstObject];
        char v11 = [v10 isActive];

        if (v11) {
          goto LABEL_16;
        }
LABEL_13:
        v7[2](v7, 1);
        goto LABEL_16;
      }
      v12 = [(UIInputLayoutHostingItem *)self offscreenConstraints];
      v13 = [v12 firstObject];
      char v14 = [v13 isActive];

      if (v14) {
        goto LABEL_16;
      }
    }
    else if (v4)
    {
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __52__UIInputLayoutHostingItem_changeOnScreen_animated___block_invoke_4;
      v15[3] = &unk_1E52DA040;
      v16 = v7;
      +[UIView animateWithDuration:458752 delay:v15 options:&__block_literal_global_27_1 animations:0.25 completion:0.0];
      id v8 = v16;
      goto LABEL_9;
    }
    v7[2](v7, 0);
    goto LABEL_16;
  }
  if (!v4) {
    goto LABEL_13;
  }
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __52__UIInputLayoutHostingItem_changeOnScreen_animated___block_invoke_2;
  v17[3] = &unk_1E52DA040;
  objc_super v18 = v7;
  +[UIView animateWithDuration:458752 delay:v17 options:&__block_literal_global_636 animations:0.25 completion:0.0];
  id v8 = v18;
LABEL_9:

LABEL_16:
  [(UIInputLayoutHostingItem *)self setIsOnScreen:v5];
}

uint64_t __52__UIInputLayoutHostingItem_changeOnScreen_animated___block_invoke(uint64_t a1, int a2)
{
  BOOL v3 = (void *)MEMORY[0x1E4F5B268];
  BOOL v4 = *(void **)(a1 + 32);
  if (a2)
  {
    BOOL v5 = [v4 offscreenConstraints];
    [v3 deactivateConstraints:v5];

    id v6 = (void *)MEMORY[0x1E4F5B268];
    [*(id *)(a1 + 32) onscreenConstraints];
  }
  else
  {
    id v7 = [v4 onscreenConstraints];
    [v3 deactivateConstraints:v7];

    id v6 = (void *)MEMORY[0x1E4F5B268];
    [*(id *)(a1 + 32) offscreenConstraints];
  id v8 = };
  [v6 activateConstraints:v8];

  v9 = *(void **)(*(void *)(a1 + 32) + 384);
  return [v9 layoutIfNeeded];
}

uint64_t __52__UIInputLayoutHostingItem_changeOnScreen_animated___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __52__UIInputLayoutHostingItem_changeOnScreen_animated___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (CGRect)visibleFrame
{
  inputLayoutView = self->_inputLayoutView;
  if (inputLayoutView)
  {
    [(UIView *)inputLayoutView bounds];
  }
  else
  {
    double v3 = 0.0;
    double v6 = 280.0;
    double v5 = 320.0;
    double v4 = 0.0;
  }
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (id)inputView
{
  return self->_inputLayoutView;
}

- (id)inputAssistantView
{
  return self->_inputLayoutAssistantView;
}

- (id)inputAccessoryView
{
  return self->_inputLayoutAccessoryView;
}

- (void)updateVisibilityConstraintsForPlacement:(id)a3
{
  id v8 = a3;
  double v4 = [(UIInputLayoutHostingItem *)self inputViewSet];

  if (!v4)
  {
    double v5 = [(UIInputWindowControllerHostingItem *)self owner];
    double v6 = [v5 inputViewSet];
    [(UIInputLayoutHostingItem *)self updateInputViewSet:v6];
  }
  if (![v8 isVisible] || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v7 = 0;
LABEL_6:
    [(UIInputLayoutHostingItem *)self changeOnScreen:v7 animated:1];
    goto LABEL_7;
  }
  if ([v8 isVisible])
  {
    uint64_t v7 = 1;
    goto LABEL_6;
  }
LABEL_7:
}

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

- (void)constrainGuidesIfNeeded
{
  v146[4] = *MEMORY[0x1E4F143B8];
  double v3 = [(UIInputLayoutHostingItem *)self bottomConstraint];

  if (!v3)
  {
    double v4 = [(UIInputLayoutHostingItem *)self containerView];
    double v5 = [v4 superview];
    double v6 = [(UIInputWindowControllerHostingItem *)self ownerView];

    if (v5 != v6)
    {
      uint64_t v7 = [(UIInputWindowControllerHostingItem *)self ownerView];
      id v8 = [(UIInputLayoutHostingItem *)self containerView];
      [v7 addSubview:v8];
    }
    v107 = (void *)MEMORY[0x1E4F5B268];
    v138 = [(UIInputLayoutHostingItem *)self containerView];
    v130 = [v138 topAnchor];
    v134 = [(UIInputWindowControllerHostingItem *)self ownerView];
    v126 = [v134 topAnchor];
    v122 = [v130 constraintEqualToAnchor:v126];
    v146[0] = v122;
    v118 = [(UIInputLayoutHostingItem *)self containerView];
    v110 = [v118 leadingAnchor];
    v114 = [(UIInputWindowControllerHostingItem *)self ownerView];
    v108 = [v114 leadingAnchor];
    v106 = [v110 constraintEqualToAnchor:v108];
    v146[1] = v106;
    v105 = [(UIInputLayoutHostingItem *)self containerView];
    v104 = [v105 bottomAnchor];
    v9 = [(UIInputWindowControllerHostingItem *)self ownerView];
    uint64_t v10 = [v9 bottomAnchor];
    char v11 = [v104 constraintEqualToAnchor:v10];
    v146[2] = v11;
    v12 = [(UIInputLayoutHostingItem *)self containerView];
    v13 = [v12 trailingAnchor];
    char v14 = [(UIInputWindowControllerHostingItem *)self ownerView];
    v15 = [v14 trailingAnchor];
    v16 = [v13 constraintEqualToAnchor:v15];
    v146[3] = v16;
    v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v146 count:4];
    [v107 activateConstraints:v17];

    objc_super v18 = [(UIInputLayoutHostingItem *)self inputViewLayoutGuide];
    v19 = [v18 owningView];

    if (!v19)
    {
      v20 = [(UIInputLayoutHostingItem *)self containerView];
      objc_super v21 = [(UIInputLayoutHostingItem *)self belowInputLayoutGuide];
      [v20 addLayoutGuide:v21];

      v22 = [(UIInputLayoutHostingItem *)self containerView];
      v23 = [(UIInputLayoutHostingItem *)self inputViewLayoutGuide];
      [v22 addLayoutGuide:v23];

      v24 = [(UIInputLayoutHostingItem *)self containerView];
      v25 = [(UIInputLayoutHostingItem *)self assistantLayoutGuide];
      [v24 addLayoutGuide:v25];

      v26 = [(UIInputLayoutHostingItem *)self containerView];
      v27 = [(UIInputLayoutHostingItem *)self accessoryLayoutGuide];
      [v26 addLayoutGuide:v27];
    }
    id v139 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v135 = [(UIInputLayoutHostingItem *)self accessoryLayoutGuide];
    v127 = [v135 leadingAnchor];
    v131 = [(UIInputLayoutHostingItem *)self assistantLayoutGuide];
    v123 = [v131 leadingAnchor];
    v119 = [v127 constraintEqualToAnchor:v123];
    v145[0] = v119;
    v115 = [(UIInputLayoutHostingItem *)self assistantLayoutGuide];
    v111 = [v115 topAnchor];
    v28 = [(UIInputLayoutHostingItem *)self accessoryLayoutGuide];
    v29 = [v28 bottomAnchor];
    v30 = [v111 constraintEqualToAnchor:v29];
    v145[1] = v30;
    v31 = [(UIInputLayoutHostingItem *)self assistantLayoutGuide];
    v32 = [v31 trailingAnchor];
    v33 = [(UIInputLayoutHostingItem *)self accessoryLayoutGuide];
    v34 = [v33 trailingAnchor];
    v35 = [v32 constraintEqualToAnchor:v34];
    v145[2] = v35;
    BOOL v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:v145 count:3];
    [v139 addObjectsFromArray:v36];

    v136 = [(UIInputLayoutHostingItem *)self inputViewLayoutGuide];
    v128 = [v136 topAnchor];
    v132 = [(UIInputLayoutHostingItem *)self assistantLayoutGuide];
    v124 = [v132 bottomAnchor];
    v120 = [v128 constraintEqualToAnchor:v124];
    v144[0] = v120;
    v116 = [(UIInputLayoutHostingItem *)self assistantLayoutGuide];
    v112 = [v116 leadingAnchor];
    v37 = [(UIInputLayoutHostingItem *)self inputViewLayoutGuide];
    id v38 = [v37 leadingAnchor];
    v39 = [v112 constraintEqualToAnchor:v38];
    v144[1] = v39;
    v40 = [(UIInputLayoutHostingItem *)self assistantLayoutGuide];
    v41 = [v40 trailingAnchor];
    v42 = [(UIInputLayoutHostingItem *)self inputViewLayoutGuide];
    v43 = [v42 trailingAnchor];
    v44 = [v41 constraintEqualToAnchor:v43];
    v144[2] = v44;
    v45 = [MEMORY[0x1E4F1C978] arrayWithObjects:v144 count:3];
    [v139 addObjectsFromArray:v45];

    v46 = [(UIInputLayoutHostingItem *)self belowInputLayoutGuide];
    v47 = [v46 topAnchor];
    v48 = [(UIInputWindowControllerHostingItem *)self ownerView];
    v49 = [v48 safeAreaLayoutGuide];
    v50 = [v49 bottomAnchor];
    v137 = [v47 constraintEqualToAnchor:v50];

    LODWORD(v51) = 1144750080;
    [v137 setPriority:v51];
    v133 = [(UIInputLayoutHostingItem *)self belowInputLayoutGuide];
    v125 = [v133 topAnchor];
    v129 = [(UIInputLayoutHostingItem *)self inputViewLayoutGuide];
    v121 = [v129 bottomAnchor];
    v117 = [v125 constraintEqualToAnchor:v121];
    v143[0] = v117;
    v113 = [(UIInputLayoutHostingItem *)self belowInputLayoutGuide];
    v109 = [v113 leadingAnchor];
    v52 = [(UIInputLayoutHostingItem *)self inputViewLayoutGuide];
    v53 = [v52 leadingAnchor];
    v54 = [v109 constraintEqualToAnchor:v53];
    v143[1] = v54;
    v55 = [(UIInputLayoutHostingItem *)self belowInputLayoutGuide];
    v56 = [v55 trailingAnchor];
    v57 = [(UIInputLayoutHostingItem *)self inputViewLayoutGuide];
    v58 = [v57 trailingAnchor];
    v59 = [v56 constraintEqualToAnchor:v58];
    v143[2] = v59;
    v60 = [MEMORY[0x1E4F1C978] arrayWithObjects:v143 count:3];
    [v139 addObjectsFromArray:v60];

    v61 = [(UIInputLayoutHostingItem *)self containerView];
    v62 = [v61 bottomAnchor];
    v63 = [(UIInputLayoutHostingItem *)self belowInputLayoutGuide];
    v64 = [v63 bottomAnchor];
    v65 = [v62 constraintEqualToAnchor:v64 constant:0.0];
    [(UIInputLayoutHostingItem *)self setBottomConstraint:v65];

    v66 = [(UIInputLayoutHostingItem *)self bottomConstraint];
    [v66 setIdentifier:@"inputViewLayoutGuide.bottomAnchor"];

    v67 = [(UIInputLayoutHostingItem *)self inputViewLayoutGuide];
    v68 = [v67 leadingAnchor];
    v69 = [(UIInputLayoutHostingItem *)self containerView];
    v70 = [v69 leadingAnchor];
    v71 = [v68 constraintEqualToAnchor:v70 constant:0.0];
    [(UIInputLayoutHostingItem *)self setLeftConstraint:v71];

    v72 = [(UIInputLayoutHostingItem *)self leftConstraint];
    [v72 setIdentifier:@"inputViewLayoutGuide.leadingAnchor"];

    v73 = [(UIInputLayoutHostingItem *)self containerView];
    v74 = [v73 trailingAnchor];
    v75 = [(UIInputLayoutHostingItem *)self inputViewLayoutGuide];
    v76 = [v75 trailingAnchor];
    v77 = [v74 constraintEqualToAnchor:v76];
    [(UIInputLayoutHostingItem *)self setRightConstraint:v77];

    v78 = [(UIInputLayoutHostingItem *)self rightConstraint];
    [v78 setIdentifier:@"inputViewLayoutGuide.trailingAnchor"];

    v79 = [(UIInputLayoutHostingItem *)self inputViewLayoutGuide];
    v80 = [v79 widthAnchor];
    v81 = +[UIScreen mainScreen];
    [v81 bounds];
    v83 = [v80 constraintEqualToConstant:v82];
    [(UIInputLayoutHostingItem *)self setKeyplaneWidthConstraint:v83];

    v84 = [(UIInputLayoutHostingItem *)self keyplaneWidthConstraint];
    [v84 setIdentifier:@"inputViewLayoutGuide.widthAnchor"];

    v85 = [(UIInputLayoutHostingItem *)self leftConstraint];
    v142[0] = v85;
    v86 = [(UIInputLayoutHostingItem *)self rightConstraint];
    v142[1] = v86;
    v87 = [MEMORY[0x1E4F1C978] arrayWithObjects:v142 count:2];
    [v139 addObjectsFromArray:v87];

    v88 = [(UIInputLayoutHostingItem *)self assistantLayoutGuide];
    v89 = [v88 topAnchor];
    v90 = [(UIInputLayoutHostingItem *)self containerView];
    v91 = [v90 bottomAnchor];
    v92 = [v89 constraintEqualToAnchor:v91];
    v141 = v92;
    v93 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v141 count:1];
    [(UIInputLayoutHostingItem *)self setOffscreenConstraints:v93];

    v94 = [(UIInputWindowControllerHostingItem *)self ownerView];
    v95 = [v94 safeAreaLayoutGuide];
    v96 = [v95 bottomAnchor];
    v97 = [(UIInputLayoutHostingItem *)self belowInputLayoutGuide];
    v98 = [v97 topAnchor];
    v99 = [v96 constraintGreaterThanOrEqualToAnchor:v98];
    v140[0] = v99;
    v140[1] = v137;
    v100 = [(UIInputLayoutHostingItem *)self bottomConstraint];
    v140[2] = v100;
    v101 = [MEMORY[0x1E4F1C978] arrayWithObjects:v140 count:3];
    [(UIInputLayoutHostingItem *)self setOnscreenConstraints:v101];

    v102 = (void *)MEMORY[0x1E4F5B268];
    v103 = [(UIInputLayoutHostingItem *)self offscreenConstraints];
    [v102 activateConstraints:v103];

    [MEMORY[0x1E4F5B268] activateConstraints:v139];
    [(UIInputLayoutHostingItem *)self setGuideConstraints:v139];
  }
}

- (void)constrainViewsToGuidesIfNeeded
{
  double v3 = [(UIInputLayoutHostingItem *)self inputLayoutView];

  if (v3)
  {
    double v4 = [(UIInputLayoutHostingItem *)self inputLayoutView];
    double v5 = [v4 superview];
    double v6 = [(UIInputLayoutHostingItem *)self containerView];
    char v7 = [v5 isEqual:v6];

    if ((v7 & 1) == 0)
    {
      id v8 = [(UIInputLayoutHostingItem *)self containerView];
      v9 = [(UIInputLayoutHostingItem *)self inputLayoutView];
      [v8 addSubview:v9];

      uint64_t v10 = [(UIInputLayoutHostingItem *)self containerView];
      char v11 = [(UIInputLayoutHostingItem *)self inputLayoutAssistantView];
      [v10 addSubview:v11];

      v12 = [(UIInputLayoutHostingItem *)self containerView];
      v13 = [(UIInputLayoutHostingItem *)self inputLayoutAccessoryView];
      [v12 addSubview:v13];
    }
    id v35 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    char v14 = [(UIInputLayoutHostingItem *)self inputLayoutView];
    v15 = [(UIInputLayoutHostingItem *)self inputViewLayoutGuide];
    v16 = [(UIInputLayoutHostingItem *)self constraintsForView:v14 embeddedInGuide:v15];
    [v35 addObjectsFromArray:v16];

    v17 = [(UIInputLayoutHostingItem *)self inputLayoutAssistantView];

    if (v17)
    {
      objc_super v18 = [(UIInputLayoutHostingItem *)self inputLayoutAssistantView];
      v19 = [(UIInputLayoutHostingItem *)self assistantLayoutGuide];
      v20 = [(UIInputLayoutHostingItem *)self constraintsForView:v18 embeddedInGuide:v19];
      [v35 addObjectsFromArray:v20];

      objc_super v21 = [(UIInputLayoutHostingItem *)self assistantLayoutGuide];
      v22 = [v21 heightAnchor];
      v23 = [v22 constraintEqualToConstant:55.0];
      [v35 addObject:v23];
    }
    v24 = [(UIInputLayoutHostingItem *)self inputLayoutAccessoryView];

    if (v24)
    {
      v25 = [(UIInputLayoutHostingItem *)self inputLayoutAccessoryView];
      v26 = [(UIInputLayoutHostingItem *)self accessoryLayoutGuide];
      v27 = [(UIInputLayoutHostingItem *)self constraintsForView:v25 embeddedInGuide:v26];
      [v35 addObjectsFromArray:v27];
    }
    v28 = [(UIInputWindowControllerHostingItem *)self dockView];

    if (v28)
    {
      v29 = [(UIInputLayoutHostingItem *)self containerView];
      v30 = [(UIInputWindowControllerHostingItem *)self dockView];
      [v29 addSubview:v30];

      v31 = [(UIInputWindowControllerHostingItem *)self dockView];
      v32 = [(UIInputLayoutHostingItem *)self belowInputLayoutGuide];
      v33 = [(UIInputLayoutHostingItem *)self constraintsForView:v31 embeddedInGuide:v32];
      [v35 addObjectsFromArray:v33];
    }
    [MEMORY[0x1E4F5B268] activateConstraints:v35];
    [(UIInputLayoutHostingItem *)self setInputSetConstraints:v35];
    v34 = [(UIInputLayoutHostingItem *)self containerView];
    [v34 layoutIfNeeded];
  }
}

- (void)trackPinch:(id)a3
{
  id v4 = a3;
  if ([v4 state] == 1)
  {
    double v5 = +[UIScreen mainScreen];
    [v5 bounds];
    _MergedGlobals_5_15 = v6;

    qword_1EB25CA98 = 0x4079000000000000;
    char v7 = [(UIInputLayoutHostingItem *)self keyplaneWidthConstraint];

    if (!v7)
    {
      id v8 = [(UIInputLayoutHostingItem *)self inputViewLayoutGuide];
      v9 = [v8 widthAnchor];
      uint64_t v10 = [v9 constraintEqualToConstant:*(double *)&_MergedGlobals_5_15];
      [(UIInputLayoutHostingItem *)self setKeyplaneWidthConstraint:v10];
    }
    double v11 = *(double *)&_MergedGlobals_5_15;
    v12 = [(UIInputLayoutHostingItem *)self keyplaneWidthConstraint];
    [v12 setConstant:v11];

    v13 = [(UIInputLayoutHostingItem *)self keyplaneWidthConstraint];
    [v13 setActive:1];

    char v14 = [(UIInputLayoutHostingItem *)self rightConstraint];
    [v14 setActive:0];

    v15 = [(UIInputLayoutHostingItem *)self containerView];
    v16 = [v15 trailingAnchor];
    v17 = [(UIInputLayoutHostingItem *)self inputViewLayoutGuide];
    objc_super v18 = [v17 trailingAnchor];
    v19 = [v16 constraintGreaterThanOrEqualToAnchor:v18];
    [(UIInputLayoutHostingItem *)self setRightConstraint:v19];

    v20 = [(UIInputLayoutHostingItem *)self rightConstraint];
    [v20 setIdentifier:@"inputViewLayoutGuide.trailingAnchor"];

    objc_super v21 = [(UIInputLayoutHostingItem *)self rightConstraint];
    [v21 setActive:1];
LABEL_15:

    goto LABEL_16;
  }
  if ([v4 state] == 2)
  {
    double v22 = *(double *)&_MergedGlobals_5_15 - *(double *)&qword_1EB25CA98;
    [v4 scale];
    double v24 = v22 * v23 + *(double *)&qword_1EB25CA98;
    if (v24 <= *(double *)&_MergedGlobals_5_15) {
      double v25 = v24;
    }
    else {
      double v25 = *(double *)&_MergedGlobals_5_15;
    }
    v26 = [(UIInputLayoutHostingItem *)self keyplaneWidthConstraint];
    [v26 setConstant:v25];

    v27 = [(UIInputLayoutHostingItem *)self containerView];
    [v4 locationInView:v27];
    double v29 = v28;
    double v31 = v30;

    v32 = [(UIInputLayoutHostingItem *)self containerView];
    [v32 bounds];
    double v34 = v33 - v31;
    id v35 = [(UIInputLayoutHostingItem *)self bottomConstraint];
    [v35 setConstant:v34];

    double v36 = v29 + v25 * -0.5;
    if (v25 + v36 > *(double *)&_MergedGlobals_5_15) {
      double v36 = *(double *)&_MergedGlobals_5_15 - v25;
    }
    if (v36 >= 0.0) {
      double v37 = v36;
    }
    else {
      double v37 = 0.0;
    }
    objc_super v21 = [(UIInputLayoutHostingItem *)self leftConstraint];
    [v21 setConstant:v37];
    goto LABEL_15;
  }
  if ([v4 state] == 3)
  {
    [v4 scale];
    if (v38 <= 1.0)
    {
      [v4 scale];
      if (v39 < 1.0)
      {
        v40[0] = MEMORY[0x1E4F143A8];
        v40[1] = 3221225472;
        v40[2] = __39__UIInputLayoutHostingItem_trackPinch___block_invoke_2;
        v40[3] = &unk_1E52D9F98;
        v40[4] = self;
        id v41 = v4;
        +[UIView animateWithDuration:458752 delay:v40 options:0 animations:0.2 completion:0.0];
      }
    }
    else
    {
      v42[0] = MEMORY[0x1E4F143A8];
      v42[1] = 3221225472;
      v42[2] = __39__UIInputLayoutHostingItem_trackPinch___block_invoke;
      v42[3] = &unk_1E52D9F70;
      v42[4] = self;
      +[UIView animateWithDuration:458752 delay:v42 options:0 animations:0.2 completion:0.0];
    }
  }
LABEL_16:
}

void __39__UIInputLayoutHostingItem_trackPinch___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) bottomConstraint];
  [v2 setConstant:0.0];

  double v3 = [*(id *)(a1 + 32) leftConstraint];
  [v3 setConstant:0.0];

  id v4 = [*(id *)(a1 + 32) keyplaneWidthConstraint];
  [v4 setActive:0];

  double v5 = [*(id *)(a1 + 32) rightConstraint];
  [v5 setActive:0];

  uint64_t v6 = [*(id *)(a1 + 32) containerView];
  char v7 = [v6 trailingAnchor];
  id v8 = [*(id *)(a1 + 32) inputViewLayoutGuide];
  v9 = [v8 trailingAnchor];
  uint64_t v10 = [v7 constraintEqualToAnchor:v9];
  [*(id *)(a1 + 32) setRightConstraint:v10];

  double v11 = [*(id *)(a1 + 32) rightConstraint];
  [v11 setActive:1];

  id v12 = [*(id *)(a1 + 32) containerView];
  [v12 layoutIfNeeded];
}

void __39__UIInputLayoutHostingItem_trackPinch___block_invoke_2(uint64_t a1)
{
  double v2 = *(double *)&qword_1EB25CA98;
  double v3 = [*(id *)(a1 + 32) keyplaneWidthConstraint];
  [v3 setConstant:v2];

  id v4 = *(void **)(a1 + 40);
  double v5 = [*(id *)(a1 + 32) containerView];
  [v4 locationInView:v5];
  double v7 = v6;
  double v9 = v8;

  uint64_t v10 = [*(id *)(a1 + 32) containerView];
  [v10 bounds];
  double v12 = v11 - v9;
  v13 = [*(id *)(a1 + 32) bottomConstraint];
  [v13 setConstant:v12];

  double v14 = v7 + *(double *)&qword_1EB25CA98 * -0.5;
  if (*(double *)&qword_1EB25CA98 + v14 > *(double *)&_MergedGlobals_5_15) {
    double v14 = *(double *)&_MergedGlobals_5_15 - *(double *)&qword_1EB25CA98;
  }
  if (v14 >= 0.0) {
    double v15 = v14;
  }
  else {
    double v15 = 0.0;
  }
  v16 = [*(id *)(a1 + 32) leftConstraint];
  [v16 setConstant:v15];

  id v17 = [*(id *)(a1 + 32) containerView];
  [v17 layoutIfNeeded];
}

- (void)createBackdropView
{
  v34[4] = *MEMORY[0x1E4F143B8];
  double v3 = [(UIInputLayoutHostingItem *)self standardBackgroundView];

  if (!v3)
  {
    id v33 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v4 = [UIKBInputBackdropView alloc];
    double v5 = -[UIKBInputBackdropView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    [(UIInputLayoutHostingItem *)self setStandardBackgroundView:v5];

    double v6 = [(UIInputLayoutHostingItem *)self standardBackgroundView];
    [v6 setTranslatesAutoresizingMaskIntoConstraints:0];

    double v7 = [(UIInputLayoutHostingItem *)self standardBackgroundView];
    double v8 = +[UIKBRenderConfig defaultConfig];
    [v7 _setRenderConfig:v8];

    double v9 = [(UIInputLayoutHostingItem *)self containerView];
    uint64_t v10 = [(UIInputLayoutHostingItem *)self standardBackgroundView];
    [v9 insertSubview:v10 atIndex:0];

    double v11 = [(UIInputLayoutHostingItem *)self bottomConstraint];

    if (!v11) {
      [(UIInputLayoutHostingItem *)self constrainGuidesIfNeeded];
    }
    v32 = [(UIInputLayoutHostingItem *)self assistantLayoutGuide];
    double v30 = [v32 topAnchor];
    double v31 = [(UIInputLayoutHostingItem *)self standardBackgroundView];
    double v29 = [v31 topAnchor];
    double v28 = [v30 constraintEqualToAnchor:v29 constant:0.0];
    v34[0] = v28;
    v27 = [(UIInputLayoutHostingItem *)self inputViewLayoutGuide];
    double v25 = [v27 leadingAnchor];
    v26 = [(UIInputLayoutHostingItem *)self standardBackgroundView];
    double v24 = [v26 leadingAnchor];
    double v23 = [v25 constraintEqualToAnchor:v24 constant:0.0];
    v34[1] = v23;
    double v22 = [(UIInputLayoutHostingItem *)self standardBackgroundView];
    objc_super v21 = [v22 bottomAnchor];
    double v12 = [(UIInputLayoutHostingItem *)self belowInputLayoutGuide];
    v13 = [v12 bottomAnchor];
    double v14 = [v21 constraintEqualToAnchor:v13 constant:0.0];
    v34[2] = v14;
    double v15 = [(UIInputLayoutHostingItem *)self standardBackgroundView];
    v16 = [v15 trailingAnchor];
    id v17 = [(UIInputLayoutHostingItem *)self inputViewLayoutGuide];
    objc_super v18 = [v17 trailingAnchor];
    v19 = [v16 constraintEqualToAnchor:v18 constant:0.0];
    v34[3] = v19;
    v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:4];
    [v33 addObjectsFromArray:v20];

    [MEMORY[0x1E4F5B268] activateConstraints:v33];
  }
}

- (void)createPlatterBackdropView
{
  v113[4] = *MEMORY[0x1E4F143B8];
  double v3 = [(UIInputLayoutHostingItem *)self platterView];

  if (!v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    double v5 = objc_alloc_init(UIView);
    [(UIInputLayoutHostingItem *)self setPlatterView:v5];

    double v6 = [(UIInputLayoutHostingItem *)self platterView];
    [v6 setTranslatesAutoresizingMaskIntoConstraints:0];

    +[UIKeyboardPopoverContainer shadowOffset];
    double v8 = v7;
    double v10 = v9;
    double v11 = [(UIInputLayoutHostingItem *)self platterView];
    double v12 = [v11 layer];
    objc_msgSend(v12, "setShadowOffset:", v8, v10);

    id v13 = +[UIKeyboardPopoverContainer shadowColor];
    uint64_t v14 = [v13 CGColor];
    double v15 = [(UIInputLayoutHostingItem *)self platterView];
    v16 = [v15 layer];
    [v16 setShadowColor:v14];

    +[UIKeyboardPopoverContainer shadowOpacity];
    *(float *)&double v8 = v17;
    objc_super v18 = [(UIInputLayoutHostingItem *)self platterView];
    v19 = [v18 layer];
    LODWORD(v20) = LODWORD(v8);
    [v19 setShadowOpacity:v20];

    +[UIKeyboardPopoverContainer shadowRadius];
    double v22 = v21;
    double v23 = [(UIInputLayoutHostingItem *)self platterView];
    double v24 = [v23 layer];
    [v24 setShadowRadius:v22];

    double v25 = objc_alloc_init(UIView);
    [(UIView *)v25 setTranslatesAutoresizingMaskIntoConstraints:0];
    v26 = [(UIView *)v25 layer];
    [v26 setMasksToBounds:1];

    +[UIKeyboardPopoverContainer cornerRadius];
    double v28 = v27;
    double v29 = [(UIView *)v25 layer];
    [v29 setCornerRadius:v28];

    id v30 = +[UIKeyboardPopoverContainer borderColor];
    uint64_t v31 = [v30 CGColor];
    v32 = [(UIView *)v25 layer];
    [v32 setBorderColor:v31];

    +[UIKeyboardPopoverContainer borderWidth];
    double v34 = v33;
    id v35 = [(UIView *)v25 layer];
    [v35 setBorderWidth:v34];

    double v36 = [(UIInputLayoutHostingItem *)self platterView];
    [v36 addSubview:v25];

    double v37 = [(UIInputLayoutHostingItem *)self platterView];
    double v38 = -[UIInputLayoutHostingItem constraintsForView:embeddedInView:insets:](self, "constraintsForView:embeddedInView:insets:", v25, v37, 0.0, 0.0, 0.0, 0.0);
    [v4 addObjectsFromArray:v38];

    double v39 = [_UIPopoverStandardChromeView alloc];
    double v40 = *MEMORY[0x1E4F1DB28];
    double v41 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v42 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v43 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    v44 = -[_UIPopoverStandardChromeView initWithFrame:](v39, "initWithFrame:", *MEMORY[0x1E4F1DB28], v41, v42, v43);
    [(UIView *)v44 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(_UIPopoverStandardChromeView *)v44 setBackgroundStyle:6];
    [(_UIPopoverStandardChromeView *)v44 setArrowDirection:0];
    [(UIView *)v44 setAlpha:1.0];
    [(UIView *)v25 addSubview:v44];
    v108 = v44;
    v45 = -[UIInputLayoutHostingItem constraintsForView:embeddedInView:insets:](self, "constraintsForView:embeddedInView:insets:", v44, v25, 0.0, 0.0, 0.0, 0.0);
    v111 = v4;
    [v4 addObjectsFromArray:v45];

    v46 = +[UIKBRenderConfig defaultConfig];
    uint64_t v47 = [v46 backdropStyle];

    v48 = -[UIKBBackdropView initWithFrame:style:]([UIKBVisualEffectView alloc], "initWithFrame:style:", v47, v40, v41, v42, v43);
    [(UIView *)v48 setTranslatesAutoresizingMaskIntoConstraints:0];
    v110 = v25;
    [(UIView *)v25 addSubview:v48];
    v49 = -[UIInputLayoutHostingItem constraintsForView:embeddedInView:insets:](self, "constraintsForView:embeddedInView:insets:", v48, v25, 0.0, 0.0, 0.0, 0.0);
    [v4 addObjectsFromArray:v49];

    v50 = -[UIView initWithFrame:]([UIView alloc], "initWithFrame:", v40, v41, v42, v43);
    [(UIInputLayoutHostingItem *)self setPillView:v50];

    double v51 = [(UIInputLayoutHostingItem *)self pillView];
    [v51 setTranslatesAutoresizingMaskIntoConstraints:0];

    v52 = +[UIKeyboardPopoverContainer pillColor];
    v53 = [(UIInputLayoutHostingItem *)self pillView];
    [v53 setBackgroundColor:v52];

    v54 = [(UIInputLayoutHostingItem *)self pillView];
    [v54 setAlpha:1.0];

    +[UIKeyboardPopoverContainer pillCornerRadius];
    double v56 = v55;
    v57 = [(UIInputLayoutHostingItem *)self pillView];
    v58 = [v57 layer];
    [v58 setCornerRadius:v56];

    v59 = [(UIVisualEffectView *)v48 contentView];
    v60 = [(UIInputLayoutHostingItem *)self pillView];
    [v59 addSubview:v60];

    +[UIKeyboardPopoverContainer pillSize];
    double v62 = v61;
    double v64 = v63;
    v109 = v48;
    v104 = [(UIView *)v48 bottomAnchor];
    v106 = [(UIInputLayoutHostingItem *)self pillView];
    v102 = [v106 bottomAnchor];
    +[UIKeyboardPopoverContainer pillDistanceToEdge];
    v100 = objc_msgSend(v104, "constraintEqualToAnchor:constant:", v102);
    v113[0] = v100;
    v98 = [(UIInputLayoutHostingItem *)self pillView];
    v96 = [v98 centerXAnchor];
    v65 = [(UIView *)v48 centerXAnchor];
    v66 = [v96 constraintEqualToAnchor:v65];
    v113[1] = v66;
    v67 = [(UIInputLayoutHostingItem *)self pillView];
    v68 = [v67 widthAnchor];
    v69 = [v68 constraintEqualToConstant:v62];
    v113[2] = v69;
    v70 = [(UIInputLayoutHostingItem *)self pillView];
    v71 = [v70 heightAnchor];
    v72 = [v71 constraintEqualToConstant:v64];
    v113[3] = v72;
    v73 = [MEMORY[0x1E4F1C978] arrayWithObjects:v113 count:4];
    [v111 addObjectsFromArray:v73];

    v74 = [(UIInputLayoutHostingItem *)self platterView];
    v75 = [v74 layer];
    [v75 setAllowsGroupBlending:0];

    v76 = [(UIView *)v110 layer];
    [v76 setAllowsGroupBlending:0];

    v77 = [(UIView *)v109 layer];
    [v77 setAllowsGroupBlending:0];

    v78 = [(UIInputLayoutHostingItem *)self containerView];
    v79 = [(UIInputLayoutHostingItem *)self platterView];
    [v78 addSubview:v79];

    v80 = [(UIInputLayoutHostingItem *)self bottomConstraint];

    if (!v80) {
      [(UIInputLayoutHostingItem *)self constrainGuidesIfNeeded];
    }
    v107 = [(UIInputLayoutHostingItem *)self assistantLayoutGuide];
    v103 = [v107 topAnchor];
    v105 = [(UIInputLayoutHostingItem *)self platterView];
    v101 = [v105 topAnchor];
    v99 = [v103 constraintEqualToAnchor:v101 constant:0.0];
    v112[0] = v99;
    v97 = [(UIInputLayoutHostingItem *)self inputViewLayoutGuide];
    v94 = [v97 leadingAnchor];
    v95 = [(UIInputLayoutHostingItem *)self platterView];
    v93 = [v95 leadingAnchor];
    v92 = [v94 constraintEqualToAnchor:v93 constant:0.0];
    v112[1] = v92;
    v91 = [(UIInputLayoutHostingItem *)self platterView];
    v90 = [v91 bottomAnchor];
    v81 = [(UIInputLayoutHostingItem *)self belowInputLayoutGuide];
    double v82 = [v81 bottomAnchor];
    v83 = [v90 constraintEqualToAnchor:v82 constant:0.0];
    v112[2] = v83;
    v84 = [(UIInputLayoutHostingItem *)self platterView];
    v85 = [v84 trailingAnchor];
    v86 = [(UIInputLayoutHostingItem *)self inputViewLayoutGuide];
    v87 = [v86 trailingAnchor];
    v88 = [v85 constraintEqualToAnchor:v87 constant:0.0];
    v112[3] = v88;
    v89 = [MEMORY[0x1E4F1C978] arrayWithObjects:v112 count:4];
    [v111 addObjectsFromArray:v89];

    [MEMORY[0x1E4F5B268] activateConstraints:v111];
  }
}

- (id)constraintsForView:(id)a3 embeddedInView:(id)a4 insets:(UIEdgeInsets)a5
{
  double right = a5.right;
  double bottom = a5.bottom;
  double left = a5.left;
  double top = a5.top;
  v26[4] = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a3;
  double v25 = [v11 topAnchor];
  double v24 = [v10 topAnchor];
  double v23 = [v25 constraintEqualToAnchor:v24 constant:top];
  v26[0] = v23;
  double v12 = [v11 leadingAnchor];
  id v13 = [v10 leadingAnchor];
  uint64_t v14 = [v12 constraintEqualToAnchor:v13 constant:left];
  v26[1] = v14;
  double v15 = [v10 bottomAnchor];
  v16 = [v11 bottomAnchor];
  double v17 = [v15 constraintEqualToAnchor:v16 constant:bottom];
  v26[2] = v17;
  objc_super v18 = [v10 trailingAnchor];

  v19 = [v11 trailingAnchor];

  double v20 = [v18 constraintEqualToAnchor:v19 constant:right];
  v26[3] = v20;
  double v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:4];

  return v21;
}

- (id)constraintsForView:(id)a3 embeddedInGuide:(id)a4
{
  v21[4] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = a3;
  double v20 = [v6 topAnchor];
  v19 = [v5 topAnchor];
  objc_super v18 = [v20 constraintEqualToAnchor:v19];
  v21[0] = v18;
  double v7 = [v6 leadingAnchor];
  double v8 = [v5 leadingAnchor];
  double v9 = [v7 constraintEqualToAnchor:v8];
  v21[1] = v9;
  id v10 = [v6 bottomAnchor];
  id v11 = [v5 bottomAnchor];
  double v12 = [v10 constraintEqualToAnchor:v11];
  v21[2] = v12;
  id v13 = [v6 trailingAnchor];

  uint64_t v14 = [v5 trailingAnchor];

  double v15 = [v13 constraintEqualToAnchor:v14];
  v21[3] = v15;
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:4];

  return v16;
}

- (UILayoutGuide)belowInputLayoutGuide
{
  return self->_belowInputLayoutGuide;
}

- (void)setBelowInputLayoutGuide:(id)a3
{
}

- (UILayoutGuide)inputViewLayoutGuide
{
  return self->_inputViewLayoutGuide;
}

- (void)setInputViewLayoutGuide:(id)a3
{
}

- (UILayoutGuide)assistantLayoutGuide
{
  return self->_assistantLayoutGuide;
}

- (void)setAssistantLayoutGuide:(id)a3
{
}

- (UILayoutGuide)accessoryLayoutGuide
{
  return self->_accessoryLayoutGuide;
}

- (void)setAccessoryLayoutGuide:(id)a3
{
}

- (NSLayoutConstraint)bottomConstraint
{
  return self->_bottomConstraint;
}

- (void)setBottomConstraint:(id)a3
{
}

- (NSLayoutConstraint)leftConstraint
{
  return self->_leftConstraint;
}

- (void)setLeftConstraint:(id)a3
{
}

- (NSLayoutConstraint)rightConstraint
{
  return self->_rightConstraint;
}

- (void)setRightConstraint:(id)a3
{
}

- (NSLayoutConstraint)keyplaneWidthConstraint
{
  return self->_keyplaneWidthConstraint;
}

- (void)setKeyplaneWidthConstraint:(id)a3
{
}

- (NSArray)onscreenConstraints
{
  return self->_onscreenConstraints;
}

- (void)setOnscreenConstraints:(id)a3
{
}

- (NSArray)offscreenConstraints
{
  return self->_offscreenConstraints;
}

- (void)setOffscreenConstraints:(id)a3
{
}

- (UIView)containerView
{
  return self->_containerView;
}

- (void)setContainerView:(id)a3
{
}

- (UIView)inputLayoutView
{
  return self->_inputLayoutView;
}

- (void)setInputLayoutView:(id)a3
{
}

- (UIView)inputLayoutAssistantView
{
  return self->_inputLayoutAssistantView;
}

- (void)setInputLayoutAssistantView:(id)a3
{
}

- (UIView)inputLayoutAccessoryView
{
  return self->_inputLayoutAccessoryView;
}

- (void)setInputLayoutAccessoryView:(id)a3
{
}

- (UIInputViewSet)inputViewSet
{
  return self->_inputViewSet;
}

- (void)setInputViewSet:(id)a3
{
}

- (NSArray)guideConstraints
{
  return self->_guideConstraints;
}

- (void)setGuideConstraints:(id)a3
{
}

- (NSArray)inputSetConstraints
{
  return self->_inputSetConstraints;
}

- (void)setInputSetConstraints:(id)a3
{
}

- (UIInputWindowControllerHosting)hosting
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hosting);
  return (UIInputWindowControllerHosting *)WeakRetained;
}

- (void)setHosting:(id)a3
{
}

- (BOOL)isOnScreen
{
  return self->_isOnScreen;
}

- (void)setIsOnScreen:(BOOL)a3
{
  self->_isOnScreen = a3;
}

- (BOOL)isFloating
{
  return self->_isFloating;
}

- (void)setIsFloating:(BOOL)a3
{
  self->_isFloating = a3;
}

- (UIKBInputBackdropView)standardBackgroundView
{
  return self->_standardBackgroundView;
}

- (void)setStandardBackgroundView:(id)a3
{
}

- (UIView)platterView
{
  return self->_platterView;
}

- (void)setPlatterView:(id)a3
{
}

- (UIView)pillView
{
  return self->_pillView;
}

- (void)setPillView:(id)a3
{
}

- (UIPinchGestureRecognizer)pinchGesture
{
  return self->_pinchGesture;
}

- (void)setPinchGesture:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pinchGesture, 0);
  objc_storeStrong((id *)&self->_pillView, 0);
  objc_storeStrong((id *)&self->_platterView, 0);
  objc_storeStrong((id *)&self->_standardBackgroundView, 0);
  objc_destroyWeak((id *)&self->_hosting);
  objc_storeStrong((id *)&self->_inputSetConstraints, 0);
  objc_storeStrong((id *)&self->_guideConstraints, 0);
  objc_storeStrong((id *)&self->_inputViewSet, 0);
  objc_storeStrong((id *)&self->_inputLayoutAccessoryView, 0);
  objc_storeStrong((id *)&self->_inputLayoutAssistantView, 0);
  objc_storeStrong((id *)&self->_inputLayoutView, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_offscreenConstraints, 0);
  objc_storeStrong((id *)&self->_onscreenConstraints, 0);
  objc_storeStrong((id *)&self->_keyplaneWidthConstraint, 0);
  objc_storeStrong((id *)&self->_rightConstraint, 0);
  objc_storeStrong((id *)&self->_leftConstraint, 0);
  objc_storeStrong((id *)&self->_bottomConstraint, 0);
  objc_storeStrong((id *)&self->_accessoryLayoutGuide, 0);
  objc_storeStrong((id *)&self->_assistantLayoutGuide, 0);
  objc_storeStrong((id *)&self->_inputViewLayoutGuide, 0);
  objc_storeStrong((id *)&self->_belowInputLayoutGuide, 0);
}

@end