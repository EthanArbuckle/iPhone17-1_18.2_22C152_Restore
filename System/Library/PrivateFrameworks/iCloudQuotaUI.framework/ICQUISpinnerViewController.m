@interface ICQUISpinnerViewController
- (void)viewDidLoad;
@end

@implementation ICQUISpinnerViewController

- (void)viewDidLoad
{
  v18[2] = *MEMORY[0x263EF8340];
  v17.receiver = self;
  v17.super_class = (Class)ICQUISpinnerViewController;
  [(ICQUISpinnerViewController *)&v17 viewDidLoad];
  v3 = [MEMORY[0x263F825C8] systemBackgroundColor];
  v4 = [(ICQUISpinnerViewController *)self view];
  [v4 setBackgroundColor:v3];

  v5 = (void *)[objc_alloc(MEMORY[0x263F823E8]) initWithActivityIndicatorStyle:100];
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
  v6 = [(ICQUISpinnerViewController *)self view];
  [v6 addSubview:v5];

  v16 = (void *)MEMORY[0x263F08938];
  v7 = [v5 centerXAnchor];
  v8 = [(ICQUISpinnerViewController *)self view];
  v9 = [v8 centerXAnchor];
  v10 = [v7 constraintEqualToAnchor:v9];
  v18[0] = v10;
  v11 = [v5 centerYAnchor];
  v12 = [(ICQUISpinnerViewController *)self view];
  v13 = [v12 centerYAnchor];
  v14 = [v11 constraintEqualToAnchor:v13];
  v18[1] = v14;
  v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:2];
  [v16 activateConstraints:v15];

  [v5 startAnimating];
}

@end