@interface VUISecondaryController
- (void)viewDidLoad;
@end

@implementation VUISecondaryController

- (void)viewDidLoad
{
  v26[4] = *MEMORY[0x1E4F143B8];
  v25.receiver = self;
  v25.super_class = (Class)VUISecondaryController;
  [(VUISecondaryController *)&v25 viewDidLoad];
  if (_os_feature_enabled_impl())
  {
    id v3 = objc_alloc(MEMORY[0x1E4FB1F00]);
    v4 = [MEMORY[0x1E4FB14C8] effectWithStyle:8];
    v5 = (void *)[v3 initWithEffect:v4];

    v6 = [(VUISecondaryController *)self view];
    [v6 addSubview:v5];

    v18 = (void *)MEMORY[0x1E4F28DC8];
    v7 = [v5 topAnchor];
    v24 = [(VUISecondaryController *)self view];
    v23 = [v24 topAnchor];
    v22 = [v7 constraintEqualToAnchor:v23];
    v26[0] = v22;
    v20 = [v5 leadingAnchor];
    v21 = [(VUISecondaryController *)self view];
    v19 = [v21 leadingAnchor];
    v17 = [v20 constraintEqualToAnchor:v19];
    v26[1] = v17;
    v16 = [v5 bottomAnchor];
    v8 = [(VUISecondaryController *)self view];
    v9 = [v8 bottomAnchor];
    v10 = [v16 constraintEqualToAnchor:v9];
    v26[2] = v10;
    v11 = [v5 topAnchor];
    v12 = [(VUISecondaryController *)self view];
    v13 = [v12 topAnchor];
    v14 = [v11 constraintEqualToAnchor:v13];
    v26[3] = v14;
    v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:4];
    [v18 activateConstraints:v15];
  }
  else
  {
    v5 = [(VUISecondaryController *)self view];
    v7 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
    [v5 setBackgroundColor:v7];
  }
}

@end