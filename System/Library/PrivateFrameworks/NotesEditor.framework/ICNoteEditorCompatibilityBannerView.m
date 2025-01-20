@interface ICNoteEditorCompatibilityBannerView
+ (id)compatibilityAttributedString;
+ (void)checkShouldShowCompatibilityBannerViewForNote:(id)a3 parentViewController:(id)a4 completion:(id)a5;
- (BOOL)accessibilityActivate;
- (BOOL)isAccessibilityElement;
- (ICLearnMoreTextView)learnMoreTextView;
- (ICNoteEditorCompatibilityBannerView)initWithFrame:(CGRect)a3 parentViewController:(id)a4;
- (double)availableWidth;
- (double)preferredHeight;
- (id)accessibilityContainer;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (id)accessibilityUserInputLabels;
- (void)accessibilityElementDidBecomeFocused;
- (void)contentSizeCategoryDidChange;
- (void)setAvailableWidth:(double)a3;
- (void)setLearnMoreTextView:(id)a3;
- (void)updateConstraints;
@end

@implementation ICNoteEditorCompatibilityBannerView

+ (void)checkShouldShowCompatibilityBannerViewForNote:(id)a3 parentViewController:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  int v10 = [v7 hasVisibleInlineAttachments];
  v11 = [v7 folder];
  v12 = [v11 account];

  if (v10 && v12)
  {
    objc_initWeak(&location, v8);
    v13 = (void *)MEMORY[0x263F5B300];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __117__ICNoteEditorCompatibilityBannerView_checkShouldShowCompatibilityBannerViewForNote_parentViewController_completion___block_invoke;
    v14[3] = &unk_2640BB8D0;
    objc_copyWeak(&v16, &location);
    id v15 = v9;
    [v13 showCompatibilityAlertForInlineAttachmentsInAccountIfNeeded:v12 parentViewController:v8 completion:v14];

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  else if (v9)
  {
    (*((void (**)(id, void))v9 + 2))(v9, 0);
  }
}

- (ICNoteEditorCompatibilityBannerView)initWithFrame:(CGRect)a3 parentViewController:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  v27.receiver = self;
  v27.super_class = (Class)ICNoteEditorCompatibilityBannerView;
  int v10 = -[ICNoteEditorCompatibilityBannerView initWithFrame:](&v27, sel_initWithFrame_, x, y, width, height);
  if (v10)
  {
    v11 = objc_msgSend(objc_alloc(MEMORY[0x263F5B378]), "initWithFrame:", x, y, width, height);
    [(ICNoteEditorCompatibilityBannerView *)v10 setLearnMoreTextView:v11];

    v12 = [(ICNoteEditorCompatibilityBannerView *)v10 learnMoreTextView];
    [v12 setParentViewController:v9];

    v13 = [(ICNoteEditorCompatibilityBannerView *)v10 learnMoreTextView];
    [v13 setContentInsetAdjustmentBehavior:2];

    double v14 = *MEMORY[0x263F834E8];
    double v15 = *(double *)(MEMORY[0x263F834E8] + 8);
    double v16 = *(double *)(MEMORY[0x263F834E8] + 16);
    double v17 = *(double *)(MEMORY[0x263F834E8] + 24);
    v18 = [(ICNoteEditorCompatibilityBannerView *)v10 learnMoreTextView];
    objc_msgSend(v18, "setTextContainerInset:", v14, v15, v16, v17);

    v19 = [(ICNoteEditorCompatibilityBannerView *)v10 learnMoreTextView];
    v20 = [v19 textContainer];
    [v20 setLineFragmentPadding:0.0];

    v21 = [(ICNoteEditorCompatibilityBannerView *)v10 learnMoreTextView];
    [(ICNoteEditorCompatibilityBannerView *)v10 addSubview:v21];

    uint64_t v22 = *MEMORY[0x263F5B0C0];
    v23 = [(ICNoteEditorCompatibilityBannerView *)v10 learnMoreTextView];
    [v23 setHelpTopic:v22];

    v24 = [(ICNoteEditorCompatibilityBannerView *)v10 learnMoreTextView];
    v25 = [(id)objc_opt_class() compatibilityAttributedString];
    [v24 setAttributedText:v25 addLearnMore:1];
  }
  return v10;
}

+ (id)compatibilityAttributedString
{
  v12[2] = *MEMORY[0x263EF8340];
  v2 = objc_msgSend(MEMORY[0x263F81708], "ic_preferredFontForCompatibilityBannerText");
  uint64_t v3 = *MEMORY[0x263F81500];
  v11[0] = *MEMORY[0x263F814F0];
  v11[1] = v3;
  v12[0] = v2;
  v4 = objc_msgSend(MEMORY[0x263F825C8], "ic_noteEditorSecondaryLabelColor");
  v12[1] = v4;
  v5 = [NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:2];

  v6 = [MEMORY[0x263F086E0] mainBundle];
  id v7 = [v6 localizedStringForKey:@"This note is not supported on some of your devices." value:&stru_26C10E100 table:0];

  id v8 = (void *)[objc_alloc(MEMORY[0x263F089B8]) initWithString:v7 attributes:v5];
  id v9 = objc_alloc_init(MEMORY[0x263F81650]);
  [v9 setAlignment:1];
  objc_msgSend(v8, "addAttribute:value:range:", *MEMORY[0x263F81540], v9, 0, objc_msgSend(v8, "length"));

  return v8;
}

- (void)updateConstraints
{
  v4.receiver = self;
  v4.super_class = (Class)ICNoteEditorCompatibilityBannerView;
  [(ICNoteEditorCompatibilityBannerView *)&v4 updateConstraints];
  uint64_t v3 = [(ICNoteEditorCompatibilityBannerView *)self learnMoreTextView];
  objc_msgSend(v3, "ic_addAnchorsToFillSuperview");
}

- (double)preferredHeight
{
  double v3 = 0.0;
  if (([(ICNoteEditorCompatibilityBannerView *)self isHidden] & 1) == 0)
  {
    [(ICNoteEditorCompatibilityBannerView *)self availableWidth];
    if (v4 != 0.0)
    {
      v5 = [(ICNoteEditorCompatibilityBannerView *)self learnMoreTextView];
      v6 = [v5 attributedText];

      id v7 = (void *)[objc_alloc(MEMORY[0x263F816E8]) initWithAttributedString:v6];
      id v8 = objc_alloc(MEMORY[0x263F81680]);
      [(ICNoteEditorCompatibilityBannerView *)self availableWidth];
      id v9 = objc_msgSend(v8, "initWithSize:");
      id v10 = objc_alloc_init(MEMORY[0x263F81648]);
      [v10 addTextContainer:v9];
      [v7 addLayoutManager:v10];
      [v9 setLineFragmentPadding:0.0];
      [v10 glyphRangeForTextContainer:v9];
      [v10 usedRectForTextContainer:v9];
      float v12 = v11;
      double v3 = ceilf(v12);
    }
  }
  return v3;
}

uint64_t __117__ICNoteEditorCompatibilityBannerView_checkShouldShowCompatibilityBannerViewForNote_parentViewController_completion___block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  if (a3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    if (WeakRetained) {
      [MEMORY[0x263F5B338] presentWithTopic:*MEMORY[0x263F5B0C0] presentingViewController:WeakRetained];
    }
  }
  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    v6 = *(uint64_t (**)(void))(result + 16);
    return v6();
  }
  return result;
}

- (void)contentSizeCategoryDidChange
{
  objc_msgSend(MEMORY[0x263F81708], "ic_preferredFontForCompatibilityBannerText");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  double v3 = [(ICNoteEditorCompatibilityBannerView *)self learnMoreTextView];
  [v3 setFont:v4];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  v2 = [(ICNoteEditorCompatibilityBannerView *)self learnMoreTextView];
  double v3 = [v2 text];

  return v3;
}

- (id)accessibilityHint
{
  v2 = [(ICNoteEditorCompatibilityBannerView *)self learnMoreTextView];
  double v3 = [v2 accessibilityHint];

  return v3;
}

- (id)accessibilityUserInputLabels
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v4 = [MEMORY[0x263F086E0] mainBundle];
  v5 = [v4 localizedStringForKey:@"Learn More" value:&stru_26C10E100 table:0];
  [v3 addObject:v5];

  v9.receiver = self;
  v9.super_class = (Class)ICNoteEditorCompatibilityBannerView;
  v6 = [(ICNoteEditorCompatibilityBannerView *)&v9 accessibilityUserInputLabels];
  if (v6) {
    [v3 addObjectsFromArray:v6];
  }
  id v7 = (void *)[v3 copy];

  return v7;
}

- (BOOL)accessibilityActivate
{
  v2 = [(ICNoteEditorCompatibilityBannerView *)self learnMoreTextView];
  [v2 didTapLearnMore];

  return 1;
}

- (id)accessibilityContainer
{
  v7.receiver = self;
  v7.super_class = (Class)ICNoteEditorCompatibilityBannerView;
  id v2 = [(ICNoteEditorCompatibilityBannerView *)&v7 accessibilityContainer];
  id v3 = v2;
  if (v2)
  {
    id v4 = v2;
    while (![v4 conformsToProtocol:&unk_26C1E88C8])
    {
      uint64_t v5 = [v4 accessibilityContainer];

      id v4 = (id)v5;
      if (!v5) {
        goto LABEL_8;
      }
    }
    id v4 = v4;

    id v3 = v4;
  }
  else
  {
    id v4 = 0;
  }
LABEL_8:

  return v3;
}

- (void)accessibilityElementDidBecomeFocused
{
  v5.receiver = self;
  v5.super_class = (Class)ICNoteEditorCompatibilityBannerView;
  [(ICNoteEditorCompatibilityBannerView *)&v5 accessibilityElementDidBecomeFocused];
  if (UIAccessibilityIsVoiceOverRunning())
  {
    id v3 = [(ICNoteEditorCompatibilityBannerView *)self nextResponder];
    if (v3)
    {
      while (1)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          break;
        }
        uint64_t v4 = [v3 nextResponder];

        id v3 = (id)v4;
        if (!v4) {
          goto LABEL_7;
        }
      }
      id v3 = v3;
    }
LABEL_7:
    [v3 showOverscrollContentAndScrollToTop];
  }
}

- (double)availableWidth
{
  return self->_availableWidth;
}

- (void)setAvailableWidth:(double)a3
{
  self->_availableWidth = a3;
}

- (ICLearnMoreTextView)learnMoreTextView
{
  return self->_learnMoreTextView;
}

- (void)setLearnMoreTextView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end