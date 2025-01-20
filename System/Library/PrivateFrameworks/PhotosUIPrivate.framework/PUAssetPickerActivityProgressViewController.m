@interface PUAssetPickerActivityProgressViewController
- (PUAssetPickerActivityProgressViewController)init;
- (void)setProgress:(id)a3;
- (void)viewDidLoad;
@end

@implementation PUAssetPickerActivityProgressViewController

- (void).cxx_destruct
{
}

- (void)setProgress:(id)a3
{
}

- (void)viewDidLoad
{
  v19[4] = *MEMORY[0x1E4F143B8];
  v18.receiver = self;
  v18.super_class = (Class)PUAssetPickerActivityProgressViewController;
  [(PUAssetPickerActivityProgressViewController *)&v18 viewDidLoad];
  v3 = [(PUAssetPickerActivityProgressViewController *)self view];
  [v3 addSubview:self->_progressView];
  [(UIProgressView *)self->_progressView setTranslatesAutoresizingMaskIntoConstraints:0];
  v13 = (void *)MEMORY[0x1E4F28DC8];
  v17 = [(UIProgressView *)self->_progressView leadingAnchor];
  v16 = [v3 leadingAnchor];
  v15 = [v17 constraintEqualToAnchor:v16];
  v19[0] = v15;
  v14 = [(UIProgressView *)self->_progressView trailingAnchor];
  v4 = [v3 trailingAnchor];
  v5 = [v14 constraintEqualToAnchor:v4];
  v19[1] = v5;
  v6 = [(UIProgressView *)self->_progressView bottomAnchor];
  v7 = [v3 bottomAnchor];
  v8 = [v6 constraintEqualToAnchor:v7];
  v19[2] = v8;
  v9 = [(UIProgressView *)self->_progressView topAnchor];
  v10 = [v3 topAnchor];
  v11 = [v9 constraintEqualToAnchor:v10];
  v19[3] = v11;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:4];
  [v13 activateConstraints:v12];
}

- (PUAssetPickerActivityProgressViewController)init
{
  v6.receiver = self;
  v6.super_class = (Class)PUAssetPickerActivityProgressViewController;
  v2 = [(PUAssetPickerActivityProgressViewController *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4FB1B48]) initWithProgressViewStyle:1];
    progressView = v2->_progressView;
    v2->_progressView = (UIProgressView *)v3;
  }
  return v2;
}

@end