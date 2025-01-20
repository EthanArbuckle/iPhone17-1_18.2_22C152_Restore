@interface ICViewOnlyPopoverViewController
+ (id)viewOnlyPopoverViewController:(id)a3 sourceView:(id)a4;
- (CGSize)preferredContentSize;
- (ICViewOnlyPopoverDelegate)popoverDelegate;
- (ICViewOnlyPopoverViewController)initWithDelegate:(id)a3;
- (UILabel)label;
- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4;
- (void)presentationControllerDidDismiss:(id)a3;
- (void)setLabel:(id)a3;
- (void)setPopoverDelegate:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation ICViewOnlyPopoverViewController

- (ICViewOnlyPopoverViewController)initWithDelegate:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)ICViewOnlyPopoverViewController;
  v5 = [(ICViewOnlyPopoverViewController *)&v23 initWithNibName:0 bundle:0];
  v6 = v5;
  if (v5)
  {
    [(ICViewOnlyPopoverViewController *)v5 setPopoverDelegate:v4];
    id v7 = objc_alloc_init(MEMORY[0x263F828E0]);
    [(ICViewOnlyPopoverViewController *)v6 setLabel:v7];

    v8 = [(ICViewOnlyPopoverViewController *)v6 label];
    [v8 setTextAlignment:1];

    v9 = [MEMORY[0x263F086E0] mainBundle];
    v10 = [v9 localizedStringForKey:@"This document has been modified using a newer OS version. Upgrade to the latest OS to modify it on this device." value:&stru_26C10E100 table:0];

    v11 = [(ICViewOnlyPopoverViewController *)v6 label];
    [v11 setText:v10];

    [(ICViewOnlyPopoverViewController *)v6 setAccessibilityLabel:v10];
    v12 = [(ICViewOnlyPopoverViewController *)v6 label];
    [v12 setNumberOfLines:0];

    v13 = [(ICViewOnlyPopoverViewController *)v6 label];
    [v13 setAdjustsFontForContentSizeCategory:1];

    uint64_t v14 = *MEMORY[0x263F83418];
    v15 = [(ICViewOnlyPopoverViewController *)v6 label];
    [v15 setMaximumContentSizeCategory:v14];

    v16 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F835B8]];
    v17 = objc_msgSend(v16, "ic_fontWithSingleLineA");
    v18 = [(ICViewOnlyPopoverViewController *)v6 label];
    [v18 setFont:v17];

    v19 = [MEMORY[0x263F825C8] darkGrayColor];
    v20 = [(ICViewOnlyPopoverViewController *)v6 label];
    [v20 setTextColor:v19];

    v21 = [(ICViewOnlyPopoverViewController *)v6 label];
    [v21 setAdjustsFontSizeToFitWidth:1];
  }
  return v6;
}

+ (id)viewOnlyPopoverViewController:(id)a3 sourceView:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [[ICViewOnlyPopoverViewController alloc] initWithDelegate:v6];

  [(ICViewOnlyPopoverViewController *)v7 setModalPresentationStyle:7];
  v8 = [(ICViewOnlyPopoverViewController *)v7 popoverPresentationController];
  [v8 setDelegate:v7];
  [v8 setPermittedArrowDirections:2];
  [v8 setSourceView:v5];
  v9 = [MEMORY[0x263F825C8] whiteColor];
  [v8 setBackgroundColor:v9];

  [v5 bounds];
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;

  v20.origin.x = v11;
  v20.origin.y = v13;
  v20.size.width = v15;
  v20.size.height = v17;
  CGRect v21 = CGRectInset(v20, 0.0, -4.0);
  objc_msgSend(v8, "setSourceRect:", v21.origin.x, v21.origin.y, v21.size.width, v21.size.height);

  return v7;
}

- (CGSize)preferredContentSize
{
  v2 = [(ICViewOnlyPopoverViewController *)self label];
  objc_msgSend(v2, "sizeThatFits:", 400.0, 1.79769313e308);
  double v4 = v3;
  double v6 = v5;

  double v7 = v4 + 24.0;
  double v8 = v6 + 20.0;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)viewWillAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ICViewOnlyPopoverViewController;
  [(ICViewOnlyPopoverViewController *)&v6 viewWillAppear:a3];
  double v4 = [(ICViewOnlyPopoverViewController *)self label];
  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
  double v5 = [(ICViewOnlyPopoverViewController *)self view];
  [v5 addSubview:v4];

  objc_msgSend(v4, "ic_addAnchorsToFillSuperviewWithLeadingPadding:trailingPadding:verticalPadding:usesSafeAreaLayoutGuideHorizontally:usesSafeAreaLayoutGuideVertically:", 1, 1, 12.0, 12.0, 10.0);
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4
{
  return -1;
}

- (void)presentationControllerDidDismiss:(id)a3
{
  id v3 = [(ICViewOnlyPopoverViewController *)self popoverDelegate];
  [v3 popoverDidDismiss];
}

- (UILabel)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (ICViewOnlyPopoverDelegate)popoverDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_popoverDelegate);

  return (ICViewOnlyPopoverDelegate *)WeakRetained;
}

- (void)setPopoverDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_popoverDelegate);

  objc_storeStrong((id *)&self->_label, 0);
}

@end