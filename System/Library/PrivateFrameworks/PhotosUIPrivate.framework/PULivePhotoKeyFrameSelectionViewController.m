@interface PULivePhotoKeyFrameSelectionViewController
- (CGSize)preferredContentSize;
- (NSString)selectionTitle;
- (PULivePhotoKeyFrameSelectionViewController)initWithCoder:(id)a3;
- (PULivePhotoKeyFrameSelectionViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (PULivePhotoKeyFrameSelectionViewControllerDelegate)delegate;
- (UIButton)makeKeyPhotoBtn;
- (int64_t)preferredUserInterfaceStyle;
- (void)_updateButtonTitle;
- (void)setDelegate:(id)a3;
- (void)setMakeKeyPhotoBtn:(id)a3;
- (void)setSelectionTitle:(id)a3;
- (void)tapMakeKeyPhoto:(id)a3;
- (void)viewDidLoad;
@end

@implementation PULivePhotoKeyFrameSelectionViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_makeKeyPhotoBtn, 0);
  objc_storeStrong((id *)&self->_selectionTitle, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setMakeKeyPhotoBtn:(id)a3
{
}

- (UIButton)makeKeyPhotoBtn
{
  return self->_makeKeyPhotoBtn;
}

- (NSString)selectionTitle
{
  return self->_selectionTitle;
}

- (void)setDelegate:(id)a3
{
}

- (PULivePhotoKeyFrameSelectionViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PULivePhotoKeyFrameSelectionViewControllerDelegate *)WeakRetained;
}

- (void)_updateButtonTitle
{
  id v4 = [(PULivePhotoKeyFrameSelectionViewController *)self makeKeyPhotoBtn];
  v3 = [(PULivePhotoKeyFrameSelectionViewController *)self selectionTitle];
  [v4 setTitle:v3 forState:0];
}

- (void)tapMakeKeyPhoto:(id)a3
{
  id v4 = [(PULivePhotoKeyFrameSelectionViewController *)self delegate];
  [v4 userDidRequestToMakeKeyPhoto:self];
}

- (void)setSelectionTitle:(id)a3
{
  v8 = (NSString *)a3;
  id v4 = self->_selectionTitle;
  if (v4 == v8)
  {
  }
  else
  {
    char v5 = [(NSString *)v4 isEqual:v8];

    if ((v5 & 1) == 0)
    {
      v6 = (NSString *)[(NSString *)v8 copy];
      selectionTitle = self->_selectionTitle;
      self->_selectionTitle = v6;

      [(PULivePhotoKeyFrameSelectionViewController *)self _updateButtonTitle];
    }
  }
}

- (int64_t)preferredUserInterfaceStyle
{
  v2 = +[PUPhotoEditProtoSettings sharedInstance];
  if ([v2 lightModeEditor]) {
    int64_t v3 = 0;
  }
  else {
    int64_t v3 = 2;
  }

  return v3;
}

- (CGSize)preferredContentSize
{
  v2 = [(PULivePhotoKeyFrameSelectionViewController *)self makeKeyPhotoBtn];
  [v2 intrinsicContentSize];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)viewDidLoad
{
  v26.receiver = self;
  v26.super_class = (Class)PULivePhotoKeyFrameSelectionViewController;
  [(PULivePhotoKeyFrameSelectionViewController *)&v26 viewDidLoad];
  double v3 = +[PUInterfaceManager currentTheme];
  double v4 = [MEMORY[0x1E4FB14D0] buttonWithType:1];
  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v4 addTarget:self action:sel_tapMakeKeyPhoto_ forControlEvents:64];
  double v5 = [v3 photoEditingKeyPhotoSelectionNormalColor];
  [v4 setTitleColor:v5 forState:0];

  double v6 = [v3 photoEditingToolbarButtonNormalFont];
  double v7 = [v4 titleLabel];
  [v7 setFont:v6];

  objc_msgSend(v4, "setContentEdgeInsets:", 12.0, 12.0, 12.0, 12.0);
  [(PULivePhotoKeyFrameSelectionViewController *)self setMakeKeyPhotoBtn:v4];
  double v8 = [(PULivePhotoKeyFrameSelectionViewController *)self view];
  v9 = [v3 photoEditingPopoverBackgroundColor];
  [v8 setBackgroundColor:v9];

  [v8 addSubview:v4];
  v10 = [v4 leadingAnchor];
  v11 = [v8 safeAreaLayoutGuide];
  v12 = [v11 leadingAnchor];
  v13 = [v10 constraintEqualToAnchor:v12];
  [v13 setActive:1];

  v14 = [v4 trailingAnchor];
  v15 = [v8 safeAreaLayoutGuide];
  v16 = [v15 trailingAnchor];
  v17 = [v14 constraintEqualToAnchor:v16];
  [v17 setActive:1];

  v18 = [v4 topAnchor];
  v19 = [v8 safeAreaLayoutGuide];
  v20 = [v19 topAnchor];
  v21 = [v18 constraintEqualToAnchor:v20];
  [v21 setActive:1];

  v22 = [v4 bottomAnchor];
  v23 = [v8 safeAreaLayoutGuide];
  v24 = [v23 bottomAnchor];
  v25 = [v22 constraintEqualToAnchor:v24];
  [v25 setActive:1];

  [(PULivePhotoKeyFrameSelectionViewController *)self _updateButtonTitle];
}

- (PULivePhotoKeyFrameSelectionViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)PULivePhotoKeyFrameSelectionViewController;
  double v4 = [(PULivePhotoKeyFrameSelectionViewController *)&v7 initWithNibName:a3 bundle:a4];
  double v5 = v4;
  if (v4) {
    commonInit_42076(v4);
  }
  return v5;
}

- (PULivePhotoKeyFrameSelectionViewController)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PULivePhotoKeyFrameSelectionViewController;
  double v3 = [(PULivePhotoKeyFrameSelectionViewController *)&v6 initWithCoder:a3];
  double v4 = v3;
  if (v3) {
    commonInit_42076(v3);
  }
  return v4;
}

@end