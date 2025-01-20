@interface VKFeedbackProviderViewController
- (BOOL)_canShowWhileLocked;
- (VKFeedbackProviderViewController)initWithOptions:(unint64_t)a3 attachments:(id)a4;
- (VKFeedbackProviderViewControllerDelegate)delegate;
- (id)_contentRowButtonWithTitle:(id)a3 tag:(int64_t)a4 allowToggle:(BOOL)a5;
- (void)_createContentView;
- (void)_toggleContentRowButton:(id)a3;
- (void)dealloc;
- (void)loadView;
- (void)present;
- (void)setDelegate:(id)a3;
- (void)viewDidLoad;
@end

@implementation VKFeedbackProviderViewController

- (VKFeedbackProviderViewController)initWithOptions:(unint64_t)a3 attachments:(id)a4
{
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)VKFeedbackProviderViewController;
  v8 = [(VKFeedbackProviderViewController *)&v13 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_attachments, a4);
    v9->_options = a3;
    uint64_t v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(v7, "count"));
    selectedAttachments = v9->_selectedAttachments;
    v9->_selectedAttachments = (NSMutableSet *)v10;
  }
  return v9;
}

- (void)loadView
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F42FF0]);
  [(VKFeedbackProviderViewController *)self setView:v3];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)VKFeedbackProviderViewController;
  [(VKFeedbackProviderViewController *)&v3 viewDidLoad];
  [(VKFeedbackProviderViewController *)self _createContentView];
}

- (void)dealloc
{
  [(UIWindow *)self->_window resignKeyWindow];
  window = self->_window;
  self->_window = 0;

  v4.receiver = self;
  v4.super_class = (Class)VKFeedbackProviderViewController;
  [(VKFeedbackProviderViewController *)&v4 dealloc];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)_createContentView
{
  v30[4] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F42E20]);
  [v3 setAxis:1];
  [v3 setDistribution:0];
  [v3 setAlignment:1];
  [v3 setSpacing:10.0];
  unint64_t options = self->_options;
  if ((options & 4) != 0)
  {
    v5 = [(VKFeedbackProviderViewController *)self _contentRowButtonWithTitle:@"Sysdiagnose" tag:-1 allowToggle:1];
    [v3 addArrangedSubview:v5];

    unint64_t options = self->_options;
  }
  if (options)
  {
    v6 = [(VKFeedbackProviderViewController *)self _contentRowButtonWithTitle:@"Screenshot" tag:-2 allowToggle:1];
    [v3 addArrangedSubview:v6];
  }
  if ([(NSArray *)self->_attachments count])
  {
    unint64_t v7 = 0;
    do
    {
      v8 = [(NSArray *)self->_attachments objectAtIndexedSubscript:v7];
      [(NSMutableSet *)self->_selectedAttachments addObject:v8];
      v9 = [v8 label];
      uint64_t v10 = -[VKFeedbackProviderViewController _contentRowButtonWithTitle:tag:allowToggle:](self, "_contentRowButtonWithTitle:tag:allowToggle:", v9, v7, [v8 isOptional]);
      [v3 addArrangedSubview:v10];

      ++v7;
    }
    while (v7 < [(NSArray *)self->_attachments count]);
  }
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  v11 = [(VKFeedbackProviderViewController *)self view];
  [v11 addSubview:v3];

  v22 = (void *)MEMORY[0x1E4F28DC8];
  v28 = [v3 leadingAnchor];
  v29 = [(VKFeedbackProviderViewController *)self view];
  v27 = [v29 leadingAnchor];
  v26 = [v28 constraintEqualToSystemSpacingAfterAnchor:v27 multiplier:2.0];
  v30[0] = v26;
  v25 = [(VKFeedbackProviderViewController *)self view];
  v24 = [v25 trailingAnchor];
  v23 = [v3 trailingAnchor];
  v21 = [v24 constraintEqualToSystemSpacingAfterAnchor:v23 multiplier:2.0];
  v30[1] = v21;
  v12 = [v3 topAnchor];
  objc_super v13 = [(VKFeedbackProviderViewController *)self view];
  v14 = [v13 topAnchor];
  v15 = [v12 constraintEqualToAnchor:v14];
  v30[2] = v15;
  v16 = [(VKFeedbackProviderViewController *)self view];
  v17 = [v16 bottomAnchor];
  v18 = [v3 bottomAnchor];
  v19 = [v17 constraintEqualToSystemSpacingBelowAnchor:v18 multiplier:1.0];
  v30[3] = v19;
  v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:4];
  [v22 activateConstraints:v20];
}

- (id)_contentRowButtonWithTitle:(id)a3 tag:(int64_t)a4 allowToggle:(BOOL)a5
{
  BOOL v5 = a5;
  v8 = (void *)MEMORY[0x1E4F427E8];
  id v9 = a3;
  uint64_t v10 = [v8 plainButtonConfiguration];
  [v10 setImagePadding:8.0];
  v11 = [MEMORY[0x1E4F427E0] buttonWithType:0];
  [v11 setConfiguration:v10];
  [v11 setTitle:v9 forState:0];

  v12 = [MEMORY[0x1E4F42A80] systemImageNamed:@"circle"];
  [v11 setImage:v12 forState:0];

  objc_super v13 = [MEMORY[0x1E4F42A80] systemImageNamed:@"checkmark.circle.fill"];
  [v11 setImage:v13 forState:4];

  v14 = [MEMORY[0x1E4F428B8] labelColor];
  [v11 setTitleColor:v14 forState:0];

  [v11 setSelected:1];
  if (v5)
  {
    [v11 addTarget:self action:sel__toggleContentRowButton_ forControlEvents:64];
  }
  else
  {
    [v11 setUserInteractionEnabled:0];
    v15 = [MEMORY[0x1E4F428B8] secondaryLabelColor];
    [v11 setTintColor:v15];
  }
  [v11 setTag:a4];

  return v11;
}

- (void)_toggleContentRowButton:(id)a3
{
  id v12 = a3;
  int v4 = [v12 isSelected];
  char v5 = v4;
  [v12 setSelected:v4 ^ 1u];
  uint64_t v6 = [v12 tag];
  if (v6 == -2)
  {
    unint64_t options = self->_options;
    if (v5) {
      unint64_t v8 = options & 0xFFFFFFFFFFFFFFFELL;
    }
    else {
      unint64_t v8 = options | 1;
    }
  }
  else
  {
    if (v6 != -1)
    {
      uint64_t v10 = -[NSArray objectAtIndexedSubscript:](self->_attachments, "objectAtIndexedSubscript:", [v12 tag]);
      selectedAttachments = self->_selectedAttachments;
      if (v5) {
        [(NSMutableSet *)selectedAttachments removeObject:v10];
      }
      else {
        [(NSMutableSet *)selectedAttachments addObject:v10];
      }

      goto LABEL_14;
    }
    unint64_t v7 = self->_options;
    if (v5) {
      unint64_t v8 = v7 & 0xFFFFFFFFFFFFFFFBLL;
    }
    else {
      unint64_t v8 = v7 | 4;
    }
  }
  self->_unint64_t options = v8;
LABEL_14:
}

- (void)present
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DB266000, log, OS_LOG_TYPE_ERROR, "Unable to find suitable active window scene or root view controller to present feedback provider alert controller.", v1, 2u);
}

uint64_t __43__VKFeedbackProviderViewController_present__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) feedbackProviderViewControllerDidCancel:*(void *)(a1 + 40)];
}

void __43__VKFeedbackProviderViewController_present__block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void *)(v2 + 984);
  id v4 = [*(id *)(v2 + 992) allObjects];
  [v1 feedbackProviderViewController:v2 submitWithOptions:v3 attachments:v4];
}

uint64_t __43__VKFeedbackProviderViewController_present__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) presentViewController:*(void *)(a1 + 40) animated:1 completion:0];
}

- (VKFeedbackProviderViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (VKFeedbackProviderViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_window, 0);
  objc_storeStrong((id *)&self->_selectedAttachments, 0);
  objc_storeStrong((id *)&self->_attachments, 0);
}

@end