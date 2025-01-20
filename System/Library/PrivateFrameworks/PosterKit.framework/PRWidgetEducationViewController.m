@interface PRWidgetEducationViewController
- (void)_updatePreferredContentSize;
- (void)loadView;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)widgetEducationViewDidDismiss:(id)a3;
@end

@implementation PRWidgetEducationViewController

- (void)loadView
{
  v3 = objc_alloc_init(PRWidgetEducationView);
  [(PRWidgetEducationView *)v3 setDelegate:self];
  [(PRWidgetEducationViewController *)self setView:v3];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)PRWidgetEducationViewController;
  [(PRWidgetEducationViewController *)&v3 viewDidLoad];
  [(PRWidgetEducationViewController *)self setModalPresentationStyle:2];
  [(PRWidgetEducationViewController *)self _updatePreferredContentSize];
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PRWidgetEducationViewController;
  [(PRWidgetEducationViewController *)&v3 viewDidLayoutSubviews];
  [(PRWidgetEducationViewController *)self _updatePreferredContentSize];
}

- (void)_updatePreferredContentSize
{
  objc_super v3 = [(PRWidgetEducationViewController *)self view];
  uint64_t v4 = objc_opt_class();
  id v5 = v3;
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      v6 = v5;
    }
    else {
      v6 = 0;
    }
  }
  else
  {
    v6 = 0;
  }
  id v7 = v6;

  v8 = [v7 contentView];

  LODWORD(v9) = 1148846080;
  LODWORD(v10) = 1112014848;
  objc_msgSend(v8, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", 420.0, *(double *)(MEMORY[0x1E4FB2C68] + 8), v9, v10);
  double v12 = v11;
  double v14 = v13;

  -[PRWidgetEducationViewController setPreferredContentSize:](self, "setPreferredContentSize:", v12, v14);
}

- (void)widgetEducationViewDidDismiss:(id)a3
{
}

@end