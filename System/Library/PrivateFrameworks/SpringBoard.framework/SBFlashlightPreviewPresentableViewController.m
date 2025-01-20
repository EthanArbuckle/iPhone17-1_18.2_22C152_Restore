@interface SBFlashlightPreviewPresentableViewController
+ (NSString)requesterIdentifier;
- (BOOL)isFlashlightOn;
- (BOOL)shouldAcquireWindowLevelAssertion;
- (NSString)requestIdentifier;
- (NSString)requesterIdentifier;
- (SBBannerCustomTransitioningDelegate)customTransitioningDelegate;
- (SBFlashlightPreviewPresentableViewController)initWithFlashlightOn:(BOOL)a3;
- (id)_pillSubtitleContentItem;
- (id)_pillTitleContentItem;
- (void)setCustomTransitioningDelegate:(id)a3;
- (void)setFlashlightOn:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation SBFlashlightPreviewPresentableViewController

- (SBFlashlightPreviewPresentableViewController)initWithFlashlightOn:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SBFlashlightPreviewPresentableViewController;
  v4 = [(SBFlashlightPreviewPresentableViewController *)&v9 initWithNibName:0 bundle:0];
  v5 = v4;
  if (v4)
  {
    v4->_flashlightOn = a3;
    v6 = objc_alloc_init(SBBannerCustomTransitioningDelegate);
    customTransitioningDelegate = v5->_customTransitioningDelegate;
    v5->_customTransitioningDelegate = v6;

    [(SBFlashlightPreviewPresentableViewController *)v5 setTransitioningDelegate:v5->_customTransitioningDelegate];
  }
  return v5;
}

- (void)viewDidLoad
{
  v20[2] = *MEMORY[0x1E4F143B8];
  v19.receiver = self;
  v19.super_class = (Class)SBFlashlightPreviewPresentableViewController;
  [(SBFlashlightPreviewPresentableViewController *)&v19 viewDidLoad];
  v3 = [(SBFlashlightPreviewPresentableViewController *)self view];
  id v4 = objc_alloc(MEMORY[0x1E4F42AA0]);
  v5 = (void *)MEMORY[0x1E4F42A80];
  if (self->_flashlightOn) {
    v6 = @"flashlight.on.fill";
  }
  else {
    v6 = @"flashlight.off.fill";
  }
  v7 = (void *)MEMORY[0x1E4F42A98];
  v8 = [MEMORY[0x1E4F428B8] whiteColor];
  objc_super v9 = [v7 configurationWithHierarchicalColor:v8];
  v10 = [v5 systemImageNamed:v6 withConfiguration:v9];
  v11 = (void *)[v4 initWithImage:v10];

  v12 = (PLPillView *)[objc_alloc(MEMORY[0x1E4F91450]) initWithLeadingAccessoryView:v11 trailingAccessoryView:0];
  pillView = self->_pillView;
  self->_pillView = v12;

  v14 = self->_pillView;
  v15 = [(SBFlashlightPreviewPresentableViewController *)self _pillTitleContentItem];
  v20[0] = v15;
  v16 = [(SBFlashlightPreviewPresentableViewController *)self _pillSubtitleContentItem];
  v20[1] = v16;
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:2];
  [(PLPillView *)v14 setCenterContentItems:v17];

  v18 = self->_pillView;
  [v3 bounds];
  -[PLPillView setFrame:](v18, "setFrame:");
  [(PLPillView *)self->_pillView setAutoresizingMask:18];
  [(PLPillView *)self->_pillView setMaterialGroupNameBase:@"SBFlashlightPreviewPresentableViewControllerMaterialGroup"];
  [v3 addSubview:self->_pillView];
  [(PLPillView *)self->_pillView intrinsicContentSize];
  -[SBFlashlightPreviewPresentableViewController setPreferredContentSize:](self, "setPreferredContentSize:");
  [(SBFlashlightPreviewPresentableViewController *)self setOverrideUserInterfaceStyle:2];
}

- (id)_pillTitleContentItem
{
  v11[1] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F28B50] mainBundle];
  v3 = [v2 localizedStringForKey:@"FLASHLIGHT_TITLE" value:&stru_1F3084718 table:@"SpringBoard"];

  id v4 = objc_alloc(MEMORY[0x1E4F28B18]);
  uint64_t v10 = *MEMORY[0x1E4F42510];
  v5 = [MEMORY[0x1E4F428B8] labelColor];
  v11[0] = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
  v7 = (void *)[v4 initWithString:v3 attributes:v6];

  v8 = (void *)[objc_alloc(MEMORY[0x1E4F91440]) initWithAttributedText:v7];
  return v8;
}

- (id)_pillSubtitleContentItem
{
  v14[1] = *MEMORY[0x1E4F143B8];
  BOOL flashlightOn = self->_flashlightOn;
  v3 = [MEMORY[0x1E4F28B50] mainBundle];
  id v4 = v3;
  if (flashlightOn) {
    v5 = @"FLASHLIGHT_ON";
  }
  else {
    v5 = @"FLASHLIGHT_OFF";
  }
  v6 = [v3 localizedStringForKey:v5 value:&stru_1F3084718 table:@"SpringBoard"];

  id v7 = objc_alloc(MEMORY[0x1E4F28B18]);
  uint64_t v13 = *MEMORY[0x1E4F42510];
  v8 = [MEMORY[0x1E4F428B8] secondaryLabelColor];
  v14[0] = v8;
  objc_super v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
  uint64_t v10 = (void *)[v7 initWithString:v6 attributes:v9];

  v11 = (void *)[objc_alloc(MEMORY[0x1E4F91440]) initWithAttributedText:v10];
  return v11;
}

- (NSString)requestIdentifier
{
  return (NSString *)@"SBFlashlightPreviewPresentableViewControllerRequestIdentifier";
}

- (NSString)requesterIdentifier
{
  v2 = objc_opt_class();
  return (NSString *)[v2 requesterIdentifier];
}

+ (NSString)requesterIdentifier
{
  return (NSString *)@"SBFlashlightPreviewPresentableViewControllerRequesterIdentifier";
}

- (BOOL)shouldAcquireWindowLevelAssertion
{
  return 1;
}

- (BOOL)isFlashlightOn
{
  return self->_flashlightOn;
}

- (void)setFlashlightOn:(BOOL)a3
{
  self->_BOOL flashlightOn = a3;
}

- (SBBannerCustomTransitioningDelegate)customTransitioningDelegate
{
  return self->_customTransitioningDelegate;
}

- (void)setCustomTransitioningDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customTransitioningDelegate, 0);
  objc_storeStrong((id *)&self->_pillView, 0);
}

@end