@interface NavJunctionViewController
+ (void)updateJunctionImageSizeForScreenSize:(CGSize)a3;
- (BOOL)_canShowWhileLocked;
- (CAGradientLayer)skyGradientLayer;
- (NSLayoutConstraint)heightConstraint;
- (NSLayoutConstraint)junctionViewBottomConstraint;
- (NSLayoutConstraint)junctionViewHeightConstraint;
- (NavJunctionViewController)init;
- (NavJunctionViewControllerDelegate)delegate;
- (NavJunctionViewInfo)junctionViewInfo;
- (UIImage)junctionImage;
- (UIImageView)junctionView;
- (double)availableHeight;
- (double)calculateAvailableHeight;
- (unint64_t)lightModeSource;
- (void)_pressedJunctionView;
- (void)fitImageForHeight:(double)a3;
- (void)lightLevelController:(id)a3 didUpdateLightLevel:(int64_t)a4;
- (void)setAvailableHeight:(double)a3;
- (void)setDelegate:(id)a3;
- (void)setHeightConstraint:(id)a3;
- (void)setJunctionImage:(id)a3;
- (void)setJunctionView:(id)a3;
- (void)setJunctionViewBottomConstraint:(id)a3;
- (void)setJunctionViewHeightConstraint:(id)a3;
- (void)setJunctionViewInfo:(id)a3;
- (void)setLightModeSource:(unint64_t)a3;
- (void)setSkyGradientLayer:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateSkyColor;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation NavJunctionViewController

- (NavJunctionViewController)init
{
  v5.receiver = self;
  v5.super_class = (Class)NavJunctionViewController;
  v2 = [(NavJunctionViewController *)&v5 init];
  v3 = v2;
  if (v2) {
    [(NavJunctionViewController *)v2 setLightModeSource:1];
  }
  return v3;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewDidLoad
{
  v49.receiver = self;
  v49.super_class = (Class)NavJunctionViewController;
  [(NavJunctionViewController *)&v49 viewDidLoad];
  v3 = [(NavJunctionViewController *)self view];
  v4 = [v3 layer];
  [v4 setMasksToBounds:1];

  objc_super v5 = [(NavJunctionViewController *)self view];
  [v5 setClipsToBounds:1];

  v6 = objc_opt_new();
  [(NavJunctionViewController *)self setSkyGradientLayer:v6];

  v7 = [(NavJunctionViewController *)self skyGradientLayer];
  [v7 setLocations:&off_1013ADE78];

  v8 = [(NavJunctionViewController *)self skyGradientLayer];
  [v8 setStartPoint:0.5, 0.0];

  v9 = [(NavJunctionViewController *)self skyGradientLayer];
  [v9 setEndPoint:0.5, 1.0];

  v10 = [(NavJunctionViewController *)self view];
  v11 = [v10 layer];
  v12 = [(NavJunctionViewController *)self skyGradientLayer];
  [v11 addSublayer:v12];

  id v13 = [objc_alloc((Class)UIImageView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  [(NavJunctionViewController *)self setJunctionView:v13];

  v14 = [(NavJunctionViewController *)self junctionView];
  [v14 setTranslatesAutoresizingMaskIntoConstraints:0];

  v15 = [(NavJunctionViewController *)self junctionView];
  [v15 setContentMode:2];

  v16 = [(NavJunctionViewController *)self junctionView];
  [v16 setUserInteractionEnabled:1];

  v17 = [(NavJunctionViewController *)self junctionView];
  [v17 setAccessibilityIdentifier:@"NavJunctionView"];

  v18 = [(NavJunctionViewController *)self junctionView];
  id v19 = [objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"_pressedJunctionView"];
  [v18 addGestureRecognizer:v19];

  v20 = [(NavJunctionViewController *)self view];
  v21 = [(NavJunctionViewController *)self junctionView];
  [v20 addSubview:v21];

  v22 = [(NavJunctionViewController *)self junctionView];
  v23 = [v22 bottomAnchor];
  v24 = [(NavJunctionViewController *)self view];
  v25 = [v24 bottomAnchor];
  v26 = [v23 constraintEqualToAnchor:v25 constant:0.0];
  [(NavJunctionViewController *)self setJunctionViewBottomConstraint:v26];

  v27 = [(NavJunctionViewController *)self junctionView];
  v28 = [v27 heightAnchor];
  v29 = [v28 constraintEqualToConstant:0.0];
  [(NavJunctionViewController *)self setJunctionViewHeightConstraint:v29];

  v30 = [(NavJunctionViewController *)self view];
  v31 = [v30 heightAnchor];
  LODWORD(v32) = 1148846080;
  v33 = [v31 constraintEqualToConstant:0.0 priority:v32];
  [(NavJunctionViewController *)self setHeightConstraint:v33];

  v48 = [(NavJunctionViewController *)self junctionView];
  v46 = [v48 widthAnchor];
  v47 = [(NavJunctionViewController *)self view];
  v45 = [v47 widthAnchor];
  v44 = [v46 constraintEqualToAnchor:v45];
  v50[0] = v44;
  v34 = [(NavJunctionViewController *)self junctionView];
  v35 = [v34 centerXAnchor];
  v36 = [(NavJunctionViewController *)self view];
  v37 = [v36 centerXAnchor];
  v38 = [v35 constraintEqualToAnchor:v37];
  v50[1] = v38;
  v39 = [(NavJunctionViewController *)self junctionViewBottomConstraint];
  v50[2] = v39;
  v40 = [(NavJunctionViewController *)self junctionViewHeightConstraint];
  v50[3] = v40;
  v41 = [(NavJunctionViewController *)self heightConstraint];
  v50[4] = v41;
  v42 = +[NSArray arrayWithObjects:v50 count:5];
  +[NSLayoutConstraint activateConstraints:v42];

  v43 = +[MapsLightLevelController sharedController];
  [v43 addObserver:self];
}

- (void)setAvailableHeight:(double)a3
{
  self->_availableHeight = a3;
  -[NavJunctionViewController fitImageForHeight:](self, "fitImageForHeight:");
}

- (double)calculateAvailableHeight
{
  v3 = [(NavJunctionViewController *)self delegate];
  v4 = [(NavJunctionViewController *)self heightConstraint];
  [v4 constant];
  [v3 maxAvailableHeightForJunctionView:];
  double v6 = v5;

  return v6;
}

- (void)viewDidLayoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)NavJunctionViewController;
  [(NavJunctionViewController *)&v13 viewDidLayoutSubviews];
  v3 = [(NavJunctionViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  v12 = [(NavJunctionViewController *)self skyGradientLayer];
  [v12 setFrame:v5, v7, v9, v11];
}

- (void)fitImageForHeight:(double)a3
{
  double v5 = [(NavJunctionViewController *)self junctionImage];
  [v5 size];
  double v7 = v6;

  if (a3 == 0.0 || v7 == 0.0)
  {
    v20 = [(NavJunctionViewController *)self heightConstraint];
    double v21 = 0.0;
    id v23 = v20;
  }
  else
  {
    double v8 = [(NavJunctionViewController *)self junctionImage];
    [v8 size];
    double v9 = 0.0;
    if (v10 > 0.0)
    {
      double v11 = [(NavJunctionViewController *)self junctionImage];
      [v11 size];
      double v13 = v12;
      v14 = [(NavJunctionViewController *)self view];
      [v14 frame];
      double v16 = v13 * v15;
      v17 = [(NavJunctionViewController *)self junctionImage];
      [v17 size];
      double v9 = floor(v16 / v18);
    }
    id v19 = [(NavJunctionViewController *)self junctionViewBottomConstraint];
    if (v9 <= a3)
    {
      [v19 setConstant:0.0];
      a3 = v9;
    }
    else
    {
      [v19 setConstant:(v9 - a3) * 0.600000024];
    }

    v22 = [(NavJunctionViewController *)self junctionViewHeightConstraint];
    [v22 setConstant:v9];

    v20 = [(NavJunctionViewController *)self heightConstraint];
    id v23 = v20;
    double v21 = a3;
  }
  [v20 setConstant:v21];
}

- (void)setJunctionImage:(id)a3
{
  id v8 = a3;
  [(NavJunctionViewController *)self loadViewIfNeeded];
  objc_storeStrong((id *)&self->_junctionImage, a3);
  [(UIImage *)self->_junctionImage setAccessibilityIdentifier:@"NavJunctionImage"];
  double v5 = [(NavJunctionViewController *)self junctionView];
  [v5 setImage:v8];

  if (v8 && ([v8 size], v6 > 0.0))
  {
    [(NavJunctionViewController *)self calculateAvailableHeight];
    -[NavJunctionViewController setAvailableHeight:](self, "setAvailableHeight:");
  }
  else
  {
    double v7 = [(NavJunctionViewController *)self heightConstraint];
    [v7 setConstant:0.0];
  }
  [(NavJunctionViewController *)self updateSkyColor];
}

- (void)setJunctionViewInfo:(id)a3
{
  double v4 = (NavJunctionViewInfo *)a3;
  double v5 = v4;
  if (v4 && self->_junctionViewInfo != v4)
  {
    double v6 = +[NavigationFeedbackCollector sharedFeedbackCollector];
    double v7 = [(NavJunctionViewInfo *)v5 junctionViewId];
    [v6 setJunctionViewDisplayed:v7];
  }
  junctionViewInfo = self->_junctionViewInfo;
  self->_junctionViewInfo = v5;
  double v9 = v5;

  id v11 = [(NavJunctionViewController *)self traitCollection];
  if ([v11 userInterfaceStyle] == (id)2) {
    [(NavJunctionViewInfo *)v9 junctionViewDarkenedImage];
  }
  else {
  double v10 = [(NavJunctionViewInfo *)v9 junctionViewImage];
  }

  [(NavJunctionViewController *)self setJunctionImage:v10];
}

- (void)_pressedJunctionView
{
  id v2 = [(NavJunctionViewController *)self delegate];
  [v2 hideJunctionViewTemporarily];
}

- (void)updateSkyColor
{
  unint64_t v4 = [(NavJunctionViewController *)self lightModeSource];
  if (v4)
  {
    if ((id)[(NavJunctionViewController *)self lightModeSource] != (id)1) {
      goto LABEL_12;
    }
  }
  else
  {
    id v2 = +[MapsLightLevelController sharedController];
    if ([v2 shouldUseNightMode])
    {

      goto LABEL_10;
    }
    if ((id)[(NavJunctionViewController *)self lightModeSource] != (id)1)
    {

LABEL_12:
      id v7 = +[UIColor colorWithRed:0.709803922 green:0.866666667 blue:0.929411765 alpha:1.0];
      v12[0] = [v7 CGColor];
      id v8 = +[UIColor colorWithRed:0.929411765 green:0.929411765 blue:0.929411765 alpha:1.0];
      v12[1] = [v8 CGColor];
      double v9 = v12;
      goto LABEL_13;
    }
  }
  double v5 = [(NavJunctionViewController *)self traitCollection];
  id v6 = [v5 userInterfaceStyle];

  if (!v4) {
  if (v6 != (id)2)
  }
    goto LABEL_12;
LABEL_10:
  id v7 = +[UIColor colorWithRed:0.137254902 green:0.298039216 blue:0.478431373 alpha:1.0];
  v13[0] = [v7 CGColor];
  id v8 = +[UIColor colorWithRed:0.337254902 green:0.42745098 blue:0.647058824 alpha:1.0];
  v13[1] = [v8 CGColor];
  double v9 = v13;
LABEL_13:
  double v10 = +[NSArray arrayWithObjects:v9 count:2];
  id v11 = [(NavJunctionViewController *)self skyGradientLayer];
  [v11 setColors:v10];
}

+ (void)updateJunctionImageSizeForScreenSize:(CGSize)a3
{
  if (a3.width != 0.0)
  {
    double height = a3.height;
    if (a3.height != 0.0)
    {
      double width = a3.width;
LABEL_6:
      if (width >= height) {
        double v10 = 828.0;
      }
      else {
        double v10 = 415.0;
      }
      double v11 = trunc(width / v10) + 1.0;
      goto LABEL_11;
    }
  }
  double v5 = +[UIScreen mainScreen];
  if (v5)
  {
    id v6 = v5;
    id v7 = [v5 currentMode];
    [v7 size];
    double width = v8;
    double height = v9;

    goto LABEL_6;
  }
  double v11 = 2.0;
LABEL_11:
  id v12 = +[MNNavigationService sharedService];
  [v12 setJunctionViewImageWidth:v11 * 414.0 height:v11 * 292.0];
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NavJunctionViewController;
  [(NavJunctionViewController *)&v13 traitCollectionDidChange:v4];
  if ((id)[(NavJunctionViewController *)self lightModeSource] == (id)1)
  {
    double v5 = [(NavJunctionViewController *)self traitCollection];
    id v6 = [v5 userInterfaceStyle];
    id v7 = [v4 userInterfaceStyle];

    if (v6 != v7)
    {
      double v8 = [(NavJunctionViewController *)self traitCollection];
      id v9 = [v8 userInterfaceStyle];
      double v10 = [(NavJunctionViewController *)self junctionViewInfo];
      double v11 = v10;
      if (v9 == (id)2) {
        [v10 junctionViewDarkenedImage];
      }
      else {
      id v12 = [v10 junctionViewImage];
      }
      [(NavJunctionViewController *)self setJunctionImage:v12];
    }
  }
}

- (void)lightLevelController:(id)a3 didUpdateLightLevel:(int64_t)a4
{
  if (![(NavJunctionViewController *)self lightModeSource])
  {
    id v8 = +[MapsLightLevelController sharedController];
    unsigned __int8 v5 = [v8 shouldUseNightMode];
    junctionViewInfo = self->_junctionViewInfo;
    if (v5) {
      [(NavJunctionViewInfo *)junctionViewInfo junctionViewDarkenedImage];
    }
    else {
    id v7 = [(NavJunctionViewInfo *)junctionViewInfo junctionViewImage];
    }
    [(NavJunctionViewController *)self setJunctionImage:v7];
  }
}

- (NavJunctionViewInfo)junctionViewInfo
{
  return self->_junctionViewInfo;
}

- (NavJunctionViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NavJunctionViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (double)availableHeight
{
  return self->_availableHeight;
}

- (unint64_t)lightModeSource
{
  return self->_lightModeSource;
}

- (void)setLightModeSource:(unint64_t)a3
{
  self->_lightModeSource = a3;
}

- (UIImage)junctionImage
{
  return self->_junctionImage;
}

- (UIImageView)junctionView
{
  return self->_junctionView;
}

- (void)setJunctionView:(id)a3
{
}

- (NSLayoutConstraint)junctionViewBottomConstraint
{
  return self->_junctionViewBottomConstraint;
}

- (void)setJunctionViewBottomConstraint:(id)a3
{
}

- (NSLayoutConstraint)junctionViewHeightConstraint
{
  return self->_junctionViewHeightConstraint;
}

- (void)setJunctionViewHeightConstraint:(id)a3
{
}

- (NSLayoutConstraint)heightConstraint
{
  return self->_heightConstraint;
}

- (void)setHeightConstraint:(id)a3
{
}

- (CAGradientLayer)skyGradientLayer
{
  return self->_skyGradientLayer;
}

- (void)setSkyGradientLayer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_skyGradientLayer, 0);
  objc_storeStrong((id *)&self->_heightConstraint, 0);
  objc_storeStrong((id *)&self->_junctionViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_junctionViewBottomConstraint, 0);
  objc_storeStrong((id *)&self->_junctionView, 0);
  objc_storeStrong((id *)&self->_junctionImage, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_junctionViewInfo, 0);
}

@end