@interface VideosExtrasActivityIndicatorElementViewController
- (BOOL)matchParentHeight;
- (void)_prepareLayout;
- (void)viewDidLoad;
@end

@implementation VideosExtrasActivityIndicatorElementViewController

- (void)viewDidLoad
{
  v33[3] = *MEMORY[0x1E4F143B8];
  v32.receiver = self;
  v32.super_class = (Class)VideosExtrasActivityIndicatorElementViewController;
  [(VideosExtrasViewElementViewController *)&v32 viewDidLoad];
  v3 = (void *)[objc_alloc(MEMORY[0x1E4FB1FE0]) initWithPrivateStyle:2030];
  v4 = [v3 layer];
  [v4 setCornerRadius:5.0];

  v5 = [v3 layer];
  [v5 setMasksToBounds:1];

  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v3 setGroupName:@"VideosExtrasBlurGroupName"];
  v6 = [VideosExtrasActivityIndicator alloc];
  v7 = [(VideosExtrasViewElementViewController *)self viewElement];
  v8 = [(VideosExtrasActivityIndicator *)v6 initWithElement:v7];

  LODWORD(v9) = 1144750080;
  [(VideosExtrasActivityIndicator *)v8 setContentHuggingPriority:0 forAxis:v9];
  LODWORD(v10) = 1144750080;
  [(VideosExtrasActivityIndicator *)v8 setContentHuggingPriority:1 forAxis:v10];
  [(VideosExtrasActivityIndicator *)v8 setAlpha:1.0];
  v11 = [(VideosExtrasActivityIndicatorElementViewController *)self view];
  [v11 addSubview:v3];

  [(VideosExtrasActivityIndicator *)v8 setTranslatesAutoresizingMaskIntoConstraints:0];
  v12 = [(VideosExtrasActivityIndicatorElementViewController *)self view];
  [v12 addSubview:v8];

  activityView = self->_activityView;
  self->_activityView = v8;
  v14 = v8;

  v15 = objc_msgSend(MEMORY[0x1E4F28DC8], "constraintsByAttachingView:toView:alongEdges:insets:", v3, v14, 15, *MEMORY[0x1E4FB2848], *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 16), *(double *)(MEMORY[0x1E4FB2848] + 24));
  v16 = [(VideosExtrasActivityIndicatorElementViewController *)self view];
  [v16 addConstraints:v15];

  v17 = (void *)MEMORY[0x1E4F28DC8];
  v18 = [(VideosExtrasActivityIndicatorElementViewController *)self view];
  v19 = objc_msgSend(v17, "constraintsByCenteringView:withView:alongAxes:offset:", v14, v18, 3, *MEMORY[0x1E4FB2E10], *(double *)(MEMORY[0x1E4FB2E10] + 8));

  v20 = [(VideosExtrasActivityIndicatorElementViewController *)self view];
  [v20 addConstraints:v19];

  v21 = (void *)MEMORY[0x1E4F28DC8];
  v22 = [(VideosExtrasActivityIndicatorElementViewController *)self view];
  v23 = [v21 constraintWithItem:v14 attribute:7 relatedBy:1 toItem:v22 attribute:7 multiplier:0.1125 constant:0.0];

  LODWORD(v24) = 1148829696;
  [v23 setPriority:v24];
  v25 = (void *)MEMORY[0x1E4F28DC8];
  v26 = [(VideosExtrasActivityIndicatorElementViewController *)self view];
  v27 = [v25 constraintWithItem:v14 attribute:8 relatedBy:1 toItem:v26 attribute:8 multiplier:0.1125 constant:0.0];

  LODWORD(v28) = 1148829696;
  [v27 setPriority:v28];
  v29 = [MEMORY[0x1E4F28DC8] constraintWithItem:v14 attribute:8 relatedBy:0 toItem:v14 attribute:7 multiplier:1.0 constant:0.0];
  v30 = [(VideosExtrasActivityIndicatorElementViewController *)self view];
  v33[0] = v23;
  v33[1] = v27;
  v33[2] = v29;
  v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:3];

  [v30 addConstraints:v31];
}

- (BOOL)matchParentHeight
{
  return 1;
}

- (void)_prepareLayout
{
  v5.receiver = self;
  v5.super_class = (Class)VideosExtrasActivityIndicatorElementViewController;
  [(VideosExtrasElementViewController *)&v5 _prepareLayout];
  v3 = [(VideosExtrasElementViewController *)self backgroundViewController];
  [v3 setVignetteType:3];

  v4 = [(VideosExtrasActivityIndicatorElementViewController *)self view];
  [v4 bringSubviewToFront:self->_activityView];
}

- (void).cxx_destruct
{
}

@end