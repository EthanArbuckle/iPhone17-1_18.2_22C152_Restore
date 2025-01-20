@interface RUIModalPresentationController
- (RUIModalPresentationController)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4 modalPresentationStyle:(unint64_t)a5;
- (RUIModalPresentationController)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4 modalPresentationStyle:(unint64_t)a5 style:(id)a6;
- (double)_sheetHeightWithSize:(CGSize)a3;
- (unint64_t)modalPresentationStyle;
- (unint64_t)ruiModalPresentationStyle;
- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5;
- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3;
- (void)presentationTransitionWillBegin;
- (void)setRUIModalPresentationStyle:(unint64_t)a3;
@end

@implementation RUIModalPresentationController

- (RUIModalPresentationController)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4 modalPresentationStyle:(unint64_t)a5
{
  return [(RUIModalPresentationController *)self initWithPresentedViewController:a3 presentingViewController:a4 modalPresentationStyle:a5 style:0];
}

- (RUIModalPresentationController)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4 modalPresentationStyle:(unint64_t)a5 style:(id)a6
{
  id v11 = a6;
  v15.receiver = self;
  v15.super_class = (Class)RUIModalPresentationController;
  v12 = [(RUIModalPresentationController *)&v15 initWithPresentedViewController:a3 presentingViewController:a4];
  v13 = v12;
  if (v12)
  {
    [(RUIModalPresentationController *)v12 setRUIModalPresentationStyle:a5];
    objc_storeStrong((id *)&v13->_style, a6);
  }

  return v13;
}

- (void)setRUIModalPresentationStyle:(unint64_t)a3
{
  v13[1] = *MEMORY[0x263EF8340];
  self->_ruiModalPresentationStyle = a3;
  if (a3 == 2)
  {
    [(RUIModalPresentationController *)self _setShouldDismissWhenTappedOutside:1];
    [(RUIModalPresentationController *)self _setWantsFloatingInRegularWidthCompactHeight:1];
  }
  else
  {
    if (a3 == 1)
    {
      -[RUIModalPresentationController _setShouldDismissWhenTappedOutside:](self, "_setShouldDismissWhenTappedOutside:");
      v4 = objc_alloc_init(RUIHalfSheetDetent);
      v13[0] = v4;
      v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:1];
      [(RUIModalPresentationController *)self setDetents:v5];

      v6 = [(RUIModalPresentationController *)self presentedViewController];
      v7 = [v6 traitCollection];
      LOBYTE(v4) = +[RUIHalfSheetDetent shouldUsePadHeightForTraitCollection:v7];

      if (v4) {
        return;
      }
      [(RUIModalPresentationController *)self _setWantsFloatingInRegularWidthCompactHeight:1];
      v8 = self;
      uint64_t v9 = 1;
    }
    else
    {
      v10 = [MEMORY[0x263F82BD0] largeDetent];
      v12 = v10;
      id v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v12 count:1];
      [(RUIModalPresentationController *)self setDetents:v11];

      [(RUIModalPresentationController *)self _setShouldDismissWhenTappedOutside:0];
      [(RUIModalPresentationController *)self _setWantsFloatingInRegularWidthCompactHeight:0];
      v8 = self;
      uint64_t v9 = 0;
    }
    [(RUIModalPresentationController *)v8 setWidthFollowsPreferredContentSizeWhenEdgeAttached:v9];
  }
}

- (void)presentationTransitionWillBegin
{
  v37[1] = *MEMORY[0x263EF8340];
  if (self->_ruiModalPresentationStyle == 2)
  {
    v3 = [(RUIModalPresentationController *)self presentedViewController];
    [v3 loadViewIfNeeded];

    v4 = [(RUIModalPresentationController *)self presentingViewController];
    v5 = [v4 view];
    [v5 bounds];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    uint64_t v14 = [(RUIModalPresentationController *)self presentedViewController];
    objc_super v15 = [(id)v14 view];
    objc_msgSend(v15, "setBounds:", v7, v9, v11, v13);

    v16 = [(RUIModalPresentationController *)self presentedViewController];
    v17 = [v16 view];
    [v17 layoutIfNeeded];

    v18 = [(RUIModalPresentationController *)self presentedViewController];
    v19 = self;
    LOBYTE(v14) = objc_opt_isKindOfClass();

    if (v14)
    {
      v20 = [(RUIModalPresentationController *)self presentedViewController];
      v21 = [v20 topViewController];
      v22 = self;
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        v24 = [v20 topViewController];
        [v24 loadViewIfNeeded];
        v25 = [v24 view];
        [v25 layoutIfNeeded];

        [v24 updatePreferredContentSize];
      }
    }
    v26 = [(RUIModalPresentationController *)self presentedViewController];
    [v26 preferredContentSize];
    double v28 = v27;
    double v30 = v29;

    v31 = (void *)MEMORY[0x263F82BD0];
    -[RUIModalPresentationController _sheetHeightWithSize:](self, "_sheetHeightWithSize:", v28, v30);
    v32 = objc_msgSend(v31, "_detentWithIdentifier:constant:", @"RUIAdaptiveSheetDetent");
    v37[0] = v32;
    v33 = [MEMORY[0x263EFF8C0] arrayWithObjects:v37 count:1];
    [(RUIModalPresentationController *)self setDetents:v33];

    v36 = self;
    v34 = &v36;
  }
  else
  {
    v35 = self;
    v34 = &v35;
  }
  v34[1] = (RUIModalPresentationController *)RUIModalPresentationController;
  objc_msgSendSuper2((objc_super *)v34, sel_presentationTransitionWillBegin, v35);
}

- (double)_sheetHeightWithSize:(CGSize)a3
{
  double height = a3.height;
  [(RUIStyle *)self->_style minimumHeightOfAdaptiveSheet];
  if (height >= v5) {
    double v6 = height;
  }
  else {
    double v6 = v5;
  }
  double v7 = [(RUIModalPresentationController *)self containerView];
  [v7 bounds];
  double v9 = v8;

  if (v6 >= v9) {
    return v9;
  }
  else {
    return v6;
  }
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  id v4 = a3;
  double v5 = v4;
  if (self->_ruiModalPresentationStyle == 2)
  {
    [v4 preferredContentSize];
    -[RUIModalPresentationController _sheetHeightWithSize:](self, "_sheetHeightWithSize:");
    double v7 = round(v6);
    if (v7 > 0.0 && v7 != self->_sheetHeight)
    {
      self->_sheetHeight = v7;
      double v8 = [v5 transitionCoordinator];
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3221225472;
      v9[2] = __88__RUIModalPresentationController_preferredContentSizeDidChangeForChildContentContainer___block_invoke_2;
      v9[3] = &unk_264212040;
      v9[4] = self;
      *(double *)&v9[5] = v7;
      [v8 animateAlongsideTransition:&__block_literal_global_5 completion:v9];
    }
  }
}

uint64_t __88__RUIModalPresentationController_preferredContentSizeDidChangeForChildContentContainer___block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __88__RUIModalPresentationController_preferredContentSizeDidChangeForChildContentContainer___block_invoke_3;
  v3[3] = &unk_2642117E8;
  v3[4] = v1;
  v3[5] = *(void *)(a1 + 40);
  return [v1 animateChanges:v3];
}

uint64_t __88__RUIModalPresentationController_preferredContentSizeDidChangeForChildContentContainer___block_invoke_3(uint64_t a1)
{
  v5[1] = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F82BD0] _detentWithIdentifier:@"RUIAdaptiveSheetDetent" constant:*(double *)(a1 + 40)];
  v5[0] = v2;
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:1];
  [*(id *)(a1 + 32) setDetents:v3];

  return [*(id *)(a1 + 32) invalidateDetents];
}

- (unint64_t)modalPresentationStyle
{
  return self->_ruiModalPresentationStyle;
}

- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5
{
  id v14 = a3;
  id v6 = a4;
  [v14 preferredContentSize];
  double v8 = v7;
  double v10 = v9;
  [v6 preferredContentSize];
  if (v8 != v12 || v10 != v11)
  {
    [v6 preferredContentSize];
    objc_msgSend(v14, "setPreferredContentSize:");
  }
}

- (unint64_t)ruiModalPresentationStyle
{
  return self->_ruiModalPresentationStyle;
}

- (void).cxx_destruct
{
}

@end