@interface LevelPageViewController
+ (void)initialize;
- (BOOL)_updateForRotation:(double)a3 shiftAngle:(double)a4;
- (BOOL)prefersStatusBarHidden;
- (BOOL)shouldAutorotate;
- (CMAttitude)holdAttitude;
- (LevelPageViewController)init;
- (LevelPageViewController)initWithCoder:(id)a3;
- (LevelPageViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)labelFont;
- (void)_enableIdleTimer;
- (void)_updateOffsetLabel:(double)a3;
- (void)configure;
- (void)dealloc;
- (void)notifyViewHidden;
- (void)notifyViewShown;
- (void)setHoldAttitude:(id)a3;
- (void)toggleHold:(id)a3;
- (void)updateColors;
- (void)updateDegreesLabel;
- (void)updateDisplay:(id)a3;
- (void)updateLevelWithForcedInterfaceUpdate:(BOOL)a3;
- (void)updateTicsForOrientation:(int64_t)a3;
- (void)userDefaultsChanged:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation LevelPageViewController

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v2 = +[NSUserDefaults standardUserDefaults];
    CFStringRef v4 = @"0.5";
    v5 = &off_10049D578;
    v3 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];
    [v2 registerDefaults:v3];
  }
}

- (LevelPageViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)LevelPageViewController;
  CFStringRef v4 = [(LevelPageViewController *)&v7 initWithNibName:a3 bundle:a4];
  v5 = v4;
  if (v4) {
    [(LevelPageViewController *)v4 configure];
  }
  return v5;
}

- (LevelPageViewController)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)LevelPageViewController;
  v3 = [(LevelPageViewController *)&v6 initWithCoder:a3];
  CFStringRef v4 = v3;
  if (v3) {
    [(LevelPageViewController *)v3 configure];
  }
  return v4;
}

- (LevelPageViewController)init
{
  return [(LevelPageViewController *)self initWithNibName:0 bundle:0];
}

- (void)configure
{
  v3 = (CMMotionManager *)objc_alloc_init((Class)CMMotionManager);
  manager = self->_manager;
  self->_manager = v3;

  [(CMMotionManager *)self->_manager setShowsDeviceMovementDisplay:1];
  [(CMMotionManager *)self->_manager setDeviceMotionUpdateInterval:0.00999999978];
  [(CMMotionManager *)self->_manager startDeviceMotionUpdatesUsingReferenceFrame:1];
  self->_orientation = 1;
  self->_previousOrientation = 1;
  self->_lastLevelChange = 1.79769313e308;
  self->_lastDisplayDegrees = 0x7FFFFFFFFFFFFFFFLL;
  self->_previousRotation = 1.79769313e308;
  self->_previousShift = 1.79769313e308;
  id v6 = +[NSUserDefaults standardUserDefaults];
  [v6 floatForKey:@"0.5"];
  self->_zeroRange = v5;
}

- (void)dealloc
{
  [(NSTimer *)self->_levelIdleTimer invalidate];
  levelIdleTimer = self->_levelIdleTimer;
  self->_levelIdleTimer = 0;

  v4.receiver = self;
  v4.super_class = (Class)LevelPageViewController;
  [(LevelPageViewController *)&v4 dealloc];
}

- (BOOL)prefersStatusBarHidden
{
  return 1;
}

- (void)viewDidLoad
{
  v127.receiver = self;
  v127.super_class = (Class)LevelPageViewController;
  [(LevelPageViewController *)&v127 viewDidLoad];
  v3 = [(LevelPageViewController *)self view];
  [v3 setClipsToBounds:1];

  objc_super v4 = [(LevelPageViewController *)self view];
  float v5 = +[UIColor whiteColor];
  [v4 setBackgroundColor:v5];

  id v6 = +[UIScreen mainScreen];
  [v6 _referenceBounds];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;

  v15 = [(LevelPageViewController *)self view];
  [v15 setFrame:v8, v10, v12, v14];

  v16 = [objc_alloc((Class)UIView) initWithFrame:v8, v10, v12, v14];
  filterContainer = self->_filterContainer;
  self->_filterContainer = v16;

  v18 = self->_filterContainer;
  v19 = +[UIColor clearColor];
  [(UIView *)v18 setBackgroundColor:v19];

  [(UIView *)self->_filterContainer setClipsToBounds:1];
  [(UIView *)self->_filterContainer setAutoresizingMask:18];
  v20 = [objc_alloc((Class)UIView) initWithFrame:v8, v10, v12, v14];
  levelContainer = self->_levelContainer;
  self->_levelContainer = v20;

  v22 = self->_levelContainer;
  v23 = +[UIColor clearColor];
  [(UIView *)v22 setBackgroundColor:v23];

  [(UIView *)self->_levelContainer setAutoresizingMask:18];
  v24 = [objc_alloc((Class)UIView) initWithFrame:v8, v10, v12, v14];
  levelHoldContainer = self->_levelHoldContainer;
  self->_levelHoldContainer = v24;

  v26 = self->_levelHoldContainer;
  v27 = +[UIColor clearColor];
  [(UIView *)v26 setBackgroundColor:v27];

  [(UIView *)self->_levelHoldContainer setAutoresizingMask:18];
  v28 = [objc_alloc((Class)UIView) initWithFrame:v8, v10, v12, v14];
  bubbleContainer = self->_bubbleContainer;
  self->_bubbleContainer = v28;

  v30 = self->_bubbleContainer;
  v31 = +[UIColor clearColor];
  [(UIView *)v30 setBackgroundColor:v31];

  [(UIView *)self->_bubbleContainer setAutoresizingMask:18];
  v32 = [objc_alloc((Class)UIView) initWithFrame:v8, v10, v12, v14];
  ticContainer = self->_ticContainer;
  self->_ticContainer = v32;

  v34 = self->_ticContainer;
  v35 = +[UIColor clearColor];
  [(UIView *)v34 setBackgroundColor:v35];

  [(UIView *)self->_ticContainer setAutoresizingMask:18];
  v36 = [(UIView *)self->_ticContainer layer];
  uint64_t v126 = kCAFilterXor;
  v37 = +[CAFilter filterWithType:](CAFilter, "filterWithType:");
  [v36 setCompositingFilter:v37];

  v128.origin.x = v8;
  v128.origin.y = v10;
  v128.size.width = v12;
  v128.size.height = v14;
  CGFloat v38 = v10 + CGRectGetHeight(v128) * 0.5;
  v129.origin.x = v8;
  v129.origin.y = v38;
  v129.size.width = v12;
  v129.size.height = v14;
  double Width = CGRectGetWidth(v129);
  v130.origin.x = v8;
  v130.origin.y = v38;
  v130.size.width = v12;
  v130.size.height = v14;
  CGFloat Height = CGRectGetHeight(v130);
  CGFloat v41 = Height + Height;
  v131.origin.x = v8;
  v131.origin.y = v38;
  v131.size.width = v12;
  v131.size.height = v14;
  double v42 = v8 - Width;
  CGFloat v43 = v38 + 0.0;
  double v44 = v12 - (-CGRectGetWidth(v131) - Width);
  double v45 = v14 - (0.0 - v41);
  v46 = +[CALayer layer];
  heldLevelBottomBacking = self->_heldLevelBottomBacking;
  self->_heldLevelBottomBacking = v46;

  -[CALayer setAnchorPoint:](self->_heldLevelBottomBacking, "setAnchorPoint:", 0.5, 0.0);
  -[CALayer setFrame:](self->_heldLevelBottomBacking, "setFrame:", v42, v43, v44, v45);
  v48 = self->_heldLevelBottomBacking;
  id v49 = +[UIColor systemRedColor];
  -[CALayer setBackgroundColor:](v48, "setBackgroundColor:", [v49 CGColor]);

  [(CALayer *)self->_heldLevelBottomBacking setAllowsEdgeAntialiasing:1];
  [(CALayer *)self->_heldLevelBottomBacking setHidden:1];
  v50 = [(UIView *)self->_levelContainer layer];
  [v50 addSublayer:self->_heldLevelBottomBacking];

  v51 = +[CALayer layer];
  heldLevelBottom = self->_heldLevelBottom;
  self->_heldLevelBottom = v51;

  -[CALayer setAnchorPoint:](self->_heldLevelBottom, "setAnchorPoint:", 0.5, 0.0);
  -[CALayer setFrame:](self->_heldLevelBottom, "setFrame:", v42, v43, v44, v45);
  v53 = self->_heldLevelBottom;
  id v54 = +[UIColor systemRedColor];
  -[CALayer setBackgroundColor:](v53, "setBackgroundColor:", [v54 CGColor]);

  [(CALayer *)self->_heldLevelBottom setAllowsEdgeAntialiasing:1];
  [(CALayer *)self->_heldLevelBottom setHidden:1];
  v55 = self->_heldLevelBottom;
  v56 = +[CAFilter filterWithType:v126];
  [(CALayer *)v55 setCompositingFilter:v56];

  v57 = [(UIView *)self->_levelHoldContainer layer];
  [v57 addSublayer:self->_heldLevelBottom];

  v58 = +[CALayer layer];
  divergenceLevelBottom = self->_divergenceLevelBottom;
  self->_divergenceLevelBottom = v58;

  -[CALayer setAnchorPoint:](self->_divergenceLevelBottom, "setAnchorPoint:", 0.5, 0.0);
  -[CALayer setFrame:](self->_divergenceLevelBottom, "setFrame:", v42, v43, v44, v45);
  v60 = self->_divergenceLevelBottom;
  id v61 = +[UIColor systemRedColor];
  -[CALayer setBackgroundColor:](v60, "setBackgroundColor:", [v61 CGColor]);

  [(CALayer *)self->_divergenceLevelBottom setAllowsEdgeAntialiasing:1];
  [(CALayer *)self->_divergenceLevelBottom setHidden:1];
  v62 = self->_divergenceLevelBottom;
  v63 = +[CAFilter filterWithType:v126];
  [(CALayer *)v62 setCompositingFilter:v63];

  v64 = [(UIView *)self->_levelHoldContainer layer];
  [v64 addSublayer:self->_divergenceLevelBottom];

  v65 = +[CALayer layer];
  levelBottom = self->_levelBottom;
  self->_levelBottom = v65;

  -[CALayer setAnchorPoint:](self->_levelBottom, "setAnchorPoint:", 0.5, 0.0);
  -[CALayer setFrame:](self->_levelBottom, "setFrame:", v42, v43, v44, v45);
  v67 = self->_levelBottom;
  id v68 = +[UIColor blackColor];
  -[CALayer setBackgroundColor:](v67, "setBackgroundColor:", [v68 CGColor]);

  [(CALayer *)self->_levelBottom setAllowsEdgeAntialiasing:1];
  v69 = [(UIView *)self->_levelContainer layer];
  [v69 addSublayer:self->_levelBottom];

  [(UIView *)self->_filterContainer addSubview:self->_levelContainer];
  [(UIView *)self->_levelContainer addSubview:self->_levelHoldContainer];
  v70 = +[CAShapeLayer layer];
  topOuterCircle = self->_topOuterCircle;
  self->_topOuterCircle = v70;

  -[CAShapeLayer setFrame:](self->_topOuterCircle, "setFrame:", 0.0, 0.0, 200.0, 200.0);
  v72 = self->_topOuterCircle;
  +[UIBezierPath bezierPathWithOvalInRect:](UIBezierPath, "bezierPathWithOvalInRect:", 0.0, 0.0, 200.0, 200.0);
  id v73 = objc_claimAutoreleasedReturnValue();
  -[CAShapeLayer setPath:](v72, "setPath:", [v73 CGPath]);

  v74 = self->_topOuterCircle;
  id v75 = +[UIColor blackColor];
  -[CAShapeLayer setFillColor:](v74, "setFillColor:", [v75 CGColor]);

  v76 = self->_topOuterCircle;
  v77 = +[CAFilter filterWithType:v126];
  [(CAShapeLayer *)v76 setCompositingFilter:v77];

  v78 = +[CAShapeLayer layer];
  topInnerCircle = self->_topInnerCircle;
  self->_topInnerCircle = v78;

  -[CAShapeLayer setFrame:](self->_topInnerCircle, "setFrame:", 0.0, 0.0, 195.0, 195.0);
  v80 = self->_topInnerCircle;
  +[UIBezierPath bezierPathWithOvalInRect:](UIBezierPath, "bezierPathWithOvalInRect:", 0.0, 0.0, 195.0, 195.0);
  id v81 = objc_claimAutoreleasedReturnValue();
  -[CAShapeLayer setPath:](v80, "setPath:", [v81 CGPath]);

  v82 = self->_topInnerCircle;
  id v83 = +[UIColor blackColor];
  -[CAShapeLayer setFillColor:](v82, "setFillColor:", [v83 CGColor]);

  v84 = self->_topInnerCircle;
  v85 = +[CAFilter filterWithType:v126];
  [(CAShapeLayer *)v84 setCompositingFilter:v85];

  v86 = +[CAShapeLayer layer];
  bottomOuterCircle = self->_bottomOuterCircle;
  self->_bottomOuterCircle = v86;

  -[CAShapeLayer setFrame:](self->_bottomOuterCircle, "setFrame:", 0.0, 0.0, 200.0, 200.0);
  v88 = self->_bottomOuterCircle;
  +[UIBezierPath bezierPathWithOvalInRect:](UIBezierPath, "bezierPathWithOvalInRect:", 0.0, 0.0, 200.0, 200.0);
  id v89 = objc_claimAutoreleasedReturnValue();
  -[CAShapeLayer setPath:](v88, "setPath:", [v89 CGPath]);

  v90 = self->_bottomOuterCircle;
  id v91 = +[UIColor blackColor];
  -[CAShapeLayer setFillColor:](v90, "setFillColor:", [v91 CGColor]);

  v92 = self->_bottomOuterCircle;
  v93 = +[CAFilter filterWithType:v126];
  [(CAShapeLayer *)v92 setCompositingFilter:v93];

  v94 = +[CAShapeLayer layer];
  bottomInnerCircle = self->_bottomInnerCircle;
  self->_bottomInnerCircle = v94;

  -[CAShapeLayer setFrame:](self->_bottomInnerCircle, "setFrame:", 0.0, 0.0, 195.0, 195.0);
  v96 = self->_bottomInnerCircle;
  +[UIBezierPath bezierPathWithOvalInRect:](UIBezierPath, "bezierPathWithOvalInRect:", 0.0, 0.0, 195.0, 195.0);
  id v97 = objc_claimAutoreleasedReturnValue();
  -[CAShapeLayer setPath:](v96, "setPath:", [v97 CGPath]);

  v98 = self->_bottomInnerCircle;
  id v99 = +[UIColor blackColor];
  -[CAShapeLayer setFillColor:](v98, "setFillColor:", [v99 CGColor]);

  v100 = self->_bottomInnerCircle;
  v101 = +[CAFilter filterWithType:v126];
  [(CAShapeLayer *)v100 setCompositingFilter:v101];

  v102 = [(UIView *)self->_filterContainer layer];
  [v102 addSublayer:self->_topOuterCircle];

  v103 = [(UIView *)self->_filterContainer layer];
  [v103 addSublayer:self->_topInnerCircle];

  v104 = [(UIView *)self->_filterContainer layer];
  [v104 addSublayer:self->_bottomOuterCircle];

  v105 = [(UIView *)self->_filterContainer layer];
  [v105 addSublayer:self->_bottomInnerCircle];

  v106 = [objc_alloc((Class)UILabel) initWithFrame:0.0, 0.0, 100.0, 100.0];
  degreesLabel = self->_degreesLabel;
  self->_degreesLabel = v106;

  v108 = self->_degreesLabel;
  v109 = +[UIColor blackColor];
  [(UILabel *)v108 setTextColor:v109];

  [(LevelPageViewController *)self updateDegreesLabel];
  v110 = [(UILabel *)self->_degreesLabel layer];
  v111 = +[CAFilter filterWithType:v126];
  [v110 setCompositingFilter:v111];

  [(UIView *)self->_filterContainer addSubview:self->_degreesLabel];
  v112 = +[CALayer layer];
  rightLevelTic = self->_rightLevelTic;
  self->_rightLevelTic = v112;

  -[CALayer setFrame:](self->_rightLevelTic, "setFrame:", 0.0, 0.0, 40.5, 1.5);
  v114 = self->_rightLevelTic;
  id v115 = +[UIColor blackColor];
  -[CALayer setBackgroundColor:](v114, "setBackgroundColor:", [v115 CGColor]);

  [(CALayer *)self->_rightLevelTic setAllowsEdgeAntialiasing:1];
  v116 = [(UIView *)self->_ticContainer layer];
  [v116 addSublayer:self->_rightLevelTic];

  v117 = +[CALayer layer];
  leftLevelTic = self->_leftLevelTic;
  self->_leftLevelTic = v117;

  -[CALayer setFrame:](self->_leftLevelTic, "setFrame:", 0.0, 0.0, 40.5, 1.5);
  v119 = self->_leftLevelTic;
  id v120 = +[UIColor blackColor];
  -[CALayer setBackgroundColor:](v119, "setBackgroundColor:", [v120 CGColor]);

  [(CALayer *)self->_leftLevelTic setAllowsEdgeAntialiasing:1];
  v121 = [(UIView *)self->_ticContainer layer];
  [v121 addSublayer:self->_leftLevelTic];

  [(UIView *)self->_filterContainer addSubview:self->_ticContainer];
  v122 = [(LevelPageViewController *)self view];
  [v122 addSubview:self->_filterContainer];

  v123 = (UITapGestureRecognizer *)[objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"toggleHold:"];
  holdRecognizer = self->_holdRecognizer;
  self->_holdRecognizer = v123;

  v125 = [(LevelPageViewController *)self view];
  [v125 addGestureRecognizer:self->_holdRecognizer];
}

- (BOOL)_updateForRotation:(double)a3 shiftAngle:(double)a4
{
  self->_currentShift = a4;
  self->_currentRotation = a3;
  double v7 = a3 * 180.0 / 3.14159265;
  if (self->_isHeld)
  {
    uint64_t v8 = 216;
LABEL_3:
    int64_t v9 = *(int64_t *)((char *)&self->super.super.super.isa + v8);
    goto LABEL_18;
  }
  if (fabs(a4 * 180.0 / 3.14159265) <= 40.0)
  {
    double v10 = fabs(v7);
    if (v10 >= 20.0)
    {
      if (v10 <= 160.0)
      {
        if (v7 <= 70.0 || v7 >= 110.0)
        {
          if (v7 >= -70.0 || v7 <= -110.0)
          {
            uint64_t v8 = 200;
            goto LABEL_3;
          }
          int64_t v9 = 4;
        }
        else
        {
          int64_t v9 = 3;
        }
      }
      else
      {
        int64_t v9 = 2;
      }
    }
    else
    {
      int64_t v9 = 1;
    }
  }
  else if (a4 <= 0.0)
  {
    int64_t v9 = 6;
  }
  else
  {
    int64_t v9 = 5;
  }
LABEL_18:
  +[CATransaction begin];
  +[CATransaction setDisableActions:1];
  int64_t orientation = self->_orientation;
  BOOL v12 = v9 != orientation;
  if (v9 != orientation)
  {
    double v13 = [(LevelPageViewController *)self traitCollection];
    id v14 = [v13 verticalSizeClass];

    if (v14 == (id)2)
    {
      self->_previousOrientation = v9;
      [(LevelPageViewController *)self updateTicsForOrientation:v9];
    }
    else
    {
      v15 = [(LevelPageViewController *)self traitCollection];
      id v16 = [v15 verticalSizeClass];

      if (v16 == (id)1) {
        self->_previousOrientation = v9;
      }
    }
    [(LevelPageViewController *)self updateTicsForOrientation:v9];
  }
  self->_int64_t orientation = v9;
  if (self->_isHeld)
  {
    if (v9 == 5)
    {
LABEL_30:
      double v21 = -1.57079633;
    }
    else
    {
      if (v9 != 6)
      {
        double holdAngle = self->_holdAngle;
        double v18 = holdAngle - sub_100005FD8(holdAngle, self->_currentRotation);
LABEL_33:
        double v7 = v18 * 180.0 / 3.14159265;
        goto LABEL_34;
      }
LABEL_31:
      double v21 = 1.57079633;
    }
    double v18 = a4 + v21;
    goto LABEL_33;
  }
  switch(v9)
  {
    case 1:
      break;
    case 2:
      double v19 = sub_100005FD8(3.14159265, a3) * 180.0 / 3.14159265;
      double v20 = -180.0;
      goto LABEL_57;
    case 3:
      double v19 = sub_100005FD8(1.57079633, a3) * 180.0 / 3.14159265;
      double v20 = -90.0;
      goto LABEL_57;
    case 4:
      double v19 = sub_100005FD8(-2.35619449, a3) * 180.0 / 3.14159265;
      double v20 = 90.0;
LABEL_57:
      double v7 = v19 + v20;
      break;
    case 5:
      goto LABEL_30;
    case 6:
      goto LABEL_31;
    default:
      double v7 = 0.0;
      break;
  }
LABEL_34:
  +[CATransaction commit];
  if (fabs(v7) >= self->_zeroRange)
  {
    uint64_t framesLevel = 0;
  }
  else
  {
    uint64_t framesLevel = self->_framesLevel;
    if (framesLevel > 29) {
      goto LABEL_39;
    }
    ++framesLevel;
    BOOL v12 = 1;
  }
  self->_uint64_t framesLevel = framesLevel;
LABEL_39:
  BOOL v23 = framesLevel > 29;
  if (self->_isLevel != v23)
  {
    if (self->_isLevel && vabdd_f64(self->_lastLevelChange, v7) <= 0.5)
    {
      BOOL v12 = 0;
      self->_uint64_t framesLevel = 30;
      return v12;
    }
    self->_isLevel = v23;
    if (framesLevel >= 30)
    {
      if (!self->_impactConfig)
      {
        v24 = +[_UIImpactFeedbackGeneratorConfiguration defaultConfiguration];
        v25 = [v24 tweakedConfigurationForCaller:self usage:@"levelDetent"];
        impactConfig = self->_impactConfig;
        self->_impactConfig = v25;
      }
      [(UIImpactFeedbackGenerator *)self->_impactGenerator deactivate];
      impactGenerator = self->_impactGenerator;
      if (!impactGenerator)
      {
        id v28 = objc_alloc((Class)UIImpactFeedbackGenerator);
        v29 = self->_impactConfig;
        v30 = [(LevelPageViewController *)self view];
        v31 = (UIImpactFeedbackGenerator *)[v28 initWithConfiguration:v29 view:v30];
        v32 = self->_impactGenerator;
        self->_impactGenerator = v31;

        impactGenerator = self->_impactGenerator;
      }
      v35[0] = _NSConcreteStackBlock;
      v35[1] = 3221225472;
      v35[2] = sub_100007784;
      v35[3] = &unk_100485258;
      v35[4] = self;
      [(UIImpactFeedbackGenerator *)impactGenerator activateWithCompletionBlock:v35];
    }
    self->_lastLevelChange = v7;
    [(LevelPageViewController *)self updateColors];
    BOOL v12 = 1;
  }
  double v33 = 0.0;
  if (framesLevel <= 29) {
    double v33 = v7;
  }
  [(LevelPageViewController *)self _updateOffsetLabel:v33];
  return v12;
}

- (void)updateDegreesLabel
{
  degreesLabel = self->_degreesLabel;
  objc_super v4 = [(LevelPageViewController *)self labelFont];
  [(UILabel *)degreesLabel setFont:v4];

  [(UILabel *)self->_degreesLabel sizeToFit];
  float v5 = self->_degreesLabel;
  id v6 = [(LevelPageViewController *)self view];
  [v6 center];
  -[UILabel setCenter:](v5, "setCenter:");
}

- (void)updateColors
{
  BOOL v3 = self->_isHeld && (unint64_t)(self->_heldOrientation - 5) < 2;
  int v4 = !self->_isHeld || v3;
  id v28 = +[UIColor systemGreenColor];
  if (v3) {
    +[UIColor systemRedColor];
  }
  else {
  float v5 = +[UIColor blackColor];
  }
  id v6 = +[UIColor systemRedColor];
  double v7 = v6;
  heldLevelBottom = self->_heldLevelBottom;
  if (self->_isLevel)
  {
    id v9 = v28;
    -[CALayer setBackgroundColor:](heldLevelBottom, "setBackgroundColor:", [v9 CGColor]);
    heldLevelBottomBacking = self->_heldLevelBottomBacking;
    id v11 = v9;
    -[CALayer setBackgroundColor:](heldLevelBottomBacking, "setBackgroundColor:", [v11 CGColor]);
    divergenceLevelBottom = self->_divergenceLevelBottom;
    id v13 = v11;
    -[CALayer setBackgroundColor:](divergenceLevelBottom, "setBackgroundColor:", [v13 CGColor]);
    if (v4) {
      id v14 = v13;
    }
    else {
      id v14 = v5;
    }
    v15 = &OBJC_IVAR___LevelPageViewController__bottomOuterCircle;
    id v16 = &OBJC_IVAR___LevelPageViewController__bottomInnerCircle;
  }
  else
  {
    id v17 = v6;
    -[CALayer setBackgroundColor:](heldLevelBottom, "setBackgroundColor:", [v17 CGColor]);
    -[CALayer setBackgroundColor:](self->_heldLevelBottomBacking, "setBackgroundColor:", [v28 CGColor]);
    -[CALayer setBackgroundColor:](self->_divergenceLevelBottom, "setBackgroundColor:", [v17 CGColor]);
    v15 = &OBJC_IVAR___LevelPageViewController__bottomInnerCircle;
    id v14 = v5;
    id v13 = v5;
    id v16 = &OBJC_IVAR___LevelPageViewController__bottomOuterCircle;
  }
  -[CALayer setBackgroundColor:](self->_levelBottom, "setBackgroundColor:", [v14 CGColor]);
  topInnerCircle = self->_topInnerCircle;
  id v19 = v13;
  -[CAShapeLayer setFillColor:](topInnerCircle, "setFillColor:", [v19 CGColor]);
  topOuterCircle = self->_topOuterCircle;
  id v21 = v19;
  -[CAShapeLayer setFillColor:](topOuterCircle, "setFillColor:", [v21 CGColor]);
  v22 = *(Class *)((char *)&self->super.super.super.isa + *v16);
  id v23 = v21;
  [v22 setFillColor:[v23 CGColor]];
  v24 = *(Class *)((char *)&self->super.super.super.isa + *v15);
  id v25 = v23;
  objc_msgSend(v24, "setFillColor:", objc_msgSend(v25, "CGColor"));
  [(UILabel *)self->_degreesLabel setTextColor:v25];
  leftLevelTic = self->_leftLevelTic;
  id v27 = v25;
  -[CALayer setBackgroundColor:](leftLevelTic, "setBackgroundColor:", [v27 CGColor]);
  -[CALayer setBackgroundColor:](self->_rightLevelTic, "setBackgroundColor:", [v27 CGColor]);
}

- (void)_enableIdleTimer
{
  id v2 = +[UIApplication sharedApplication];
  [v2 setIdleTimerDisabled:0];
}

- (void)_updateOffsetLabel:(double)a3
{
  int64_t v4 = (uint64_t)a3;
  double v5 = fabs(a3);
  if (v5 < 1.0 && v5 > self->_zeroRange) {
    int64_t v4 = (*(uint64_t *)&a3 >> 63) | 1;
  }
  int64_t lastDisplayDegrees = self->_lastDisplayDegrees;
  levelIdleTimer = self->_levelIdleTimer;
  if (lastDisplayDegrees == v4)
  {
    if (levelIdleTimer) {
      return;
    }
    id v14 = +[NSTimer scheduledTimerWithTimeInterval:self target:"_enableIdleTimer" selector:0 userInfo:0 repeats:60.0];
    v15 = self->_levelIdleTimer;
    self->_levelIdleTimer = v14;
  }
  else
  {
    [(NSTimer *)levelIdleTimer invalidate];
    uint64_t v8 = self->_levelIdleTimer;
    self->_levelIdleTimer = 0;

    id v9 = +[UIApplication sharedApplication];
    [v9 setIdleTimerDisabled:1];

    self->_int64_t lastDisplayDegrees = v4;
    double v10 = +[NSBundle mainBundle];
    id v11 = [v10 localizedStringForKey:@"COMPASS_DEGREES" value:&stru_10049CC90 table:0];
    uint64_t v16 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v11, v4);

    [(UILabel *)self->_degreesLabel setText:v16];
    [(UILabel *)self->_degreesLabel sizeToFit];
    degreesLabel = self->_degreesLabel;
    id v13 = [(LevelPageViewController *)self view];
    [v13 center];
    -[UILabel setCenter:](degreesLabel, "setCenter:");

    v15 = (NSTimer *)v16;
  }

  _objc_release_x1(v14, v15);
}

- (void)updateDisplay:(id)a3
{
}

- (void)updateLevelWithForcedInterfaceUpdate:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = [(CMMotionManager *)self->_manager deviceMotion];
  id v6 = [v5 attitude];

  if (self->_holdAttitude) {
    [v6 multiplyByInverseOfAttitude:];
  }
  double v64 = 0.0;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  double v7 = 0.0;
  double v8 = 0.0;
  double v9 = 0.0;
  if (v6)
  {
    [v6 rotationMatrix:0.0, 0.0];
    double v9 = *(double *)&v61;
    double v8 = *((double *)&v62 + 1);
    double v7 = v64;
  }
  double v10 = -v9;
  double v11 = -v7;
  double v12 = v8 * v8 + v9 * v9;
  double v13 = sqrt(v12);
  if (v12 <= 0.0) {
    double v14 = 0.0;
  }
  else {
    double v14 = v13;
  }
  v15 = +[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
  long double v16 = atan2(v10, v8);
  long double v17 = acos(v11);
  double v18 = -1.57079633;
  double v19 = v17 + -1.57079633;
  double holdAngle = self->_holdAngle;
  unsigned int v21 = [(LevelPageViewController *)self _updateForRotation:(double)v16 shiftAngle:(double)(v17 + -1.57079633)];
  if (v14 <= 0.100000001)
  {
    unint64_t v24 = self->_rotationOrientation - 2;
    double v25 = 0.0;
    if (v24 <= 2) {
      double v25 = dbl_1003F6360[v24];
    }
    double v18 = sub_100005FD8(v16, v25);
    double v26 = 1.0;
    if (v14 >= 0.0250000004) {
      double v26 = (v14 + -0.0250000004) / -0.0750000011 + 1.0;
    }
    long double v16 = sub_10000605C(v16, v18, v26);
  }
  else
  {
    double v22 = v16 * 180.0 / 3.14159265;
    double v23 = fabs(v22);
    if (v23 >= 45.0)
    {
      if (v23 <= 135.0)
      {
        if (v22 <= 45.0 || v22 >= 135.0)
        {
          self->_rotationOrientation = 4;
        }
        else
        {
          self->_rotationOrientation = 3;
          double v18 = 1.57079633;
        }
      }
      else
      {
        self->_rotationOrientation = 2;
        double v18 = -3.14159265;
      }
    }
    else
    {
      self->_rotationOrientation = 1;
      double v18 = 0.0;
    }
  }
  if (vabdd_f64(v19, self->_previousShift) <= 0.0000999999975
    && vabdd_f64(v16, self->_previousRotation) <= 0.0000999999975)
  {
    int v27 = v21 | v3;
  }
  else
  {
    int v27 = 1;
  }
  double v28 = v19 / 1.57079633;
  int64_t framesLevel = self->_framesLevel;
  if (framesLevel < 1)
  {
LABEL_30:
    if (!v27) {
      goto LABEL_37;
    }
    goto LABEL_31;
  }
  double v30 = (double)framesLevel / 30.0;
  int64_t orientation = self->_orientation;
  if (orientation != 5)
  {
    if (orientation == 6) {
      double v28 = v28 * (1.0 - v30) - v30;
    }
    goto LABEL_30;
  }
  double v28 = v30 + v28 * (1.0 - v30);
  if (!v27) {
    goto LABEL_37;
  }
LABEL_31:
  double v32 = self->_holdShift / 1.57079633;
  double v33 = [(LevelPageViewController *)self view];
  [v33 bounds];
  CGFloat v34 = CGRectGetHeight(v65) * 1.29999995;

  *(float *)&double v35 = v14;
  [v15 _solveForInput:v35];
  CGFloat v37 = v34 * (v36 * 0.399999976 + 0.600000024);
  memset(&v59, 0, sizeof(v59));
  CATransform3DMakeRotation(&v59, v16, 0.0, 0.0, -1.0);
  memset(&v58, 0, sizeof(v58));
  CATransform3DMakeRotation(&v58, holdAngle, 0.0, 0.0, -1.0);
  memset(&v57, 0, sizeof(v57));
  CATransform3D v56 = v59;
  CATransform3DTranslate(&v57, &v56, 0.0, -(v34 * v28), 0.0);
  memset(&v56, 0, sizeof(v56));
  CATransform3D v55 = v58;
  CATransform3DTranslate(&v56, &v55, 0.0, -(v34 * v32), 0.0);
  memset(&v55, 0, sizeof(v55));
  CATransform3D v54 = v59;
  CATransform3DTranslate(&v55, &v54, 0.0, -(v37 * (v28 + -1.0)), 0.0);
  memset(&v54, 0, sizeof(v54));
  CATransform3D v53 = v59;
  CATransform3DTranslate(&v54, &v53, 0.0, (v28 + -1.0) * v37, 0.0);
  memset(&v53, 0, sizeof(v53));
  CATransform3D v52 = v59;
  CATransform3DTranslate(&v53, &v52, 0.0, -(v37 * (v28 + 1.0)), 0.0);
  memset(&v52, 0, sizeof(v52));
  CATransform3D v51 = v59;
  CATransform3DTranslate(&v52, &v51, 0.0, (v28 + 1.0) * v37, 0.0);
  +[CATransaction begin];
  +[CATransaction setDisableActions:1];
  levelBottom = self->_levelBottom;
  CATransform3D v51 = v57;
  [(CALayer *)levelBottom setTransform:&v51];
  heldLevelBottom = self->_heldLevelBottom;
  CATransform3D v51 = v56;
  [(CALayer *)heldLevelBottom setTransform:&v51];
  heldLevelBottomBacking = self->_heldLevelBottomBacking;
  CATransform3D v51 = v56;
  [(CALayer *)heldLevelBottomBacking setTransform:&v51];
  divergenceLevelBottom = self->_divergenceLevelBottom;
  CATransform3D v51 = v57;
  [(CALayer *)divergenceLevelBottom setTransform:&v51];
  double v42 = [(UILabel *)self->_degreesLabel layer];
  CATransform3D v51 = v59;
  [v42 setTransform:&v51];

  bottomOuterCircle = self->_bottomOuterCircle;
  CATransform3D v51 = v55;
  [(CAShapeLayer *)bottomOuterCircle setTransform:&v51];
  bottomInnerCircle = self->_bottomInnerCircle;
  CATransform3D v51 = v54;
  [(CAShapeLayer *)bottomInnerCircle setTransform:&v51];
  topOuterCircle = self->_topOuterCircle;
  CATransform3D v51 = v53;
  [(CAShapeLayer *)topOuterCircle setTransform:&v51];
  topInnerCircle = self->_topInnerCircle;
  CATransform3D v51 = v52;
  [(CAShapeLayer *)topInnerCircle setTransform:&v51];
  BOOL isHeld = self->_isHeld;
  v48 = [(UIView *)self->_ticContainer layer];
  if (isHeld)
  {
    CATransform3D v51 = v58;
    id v49 = &v51;
  }
  else
  {
    CATransform3DMakeRotation(&v50, v18, 0.0, 0.0, 1.0);
    id v49 = &v50;
  }
  [v48 setTransform:v49];

  +[CATransaction commit];
LABEL_37:
  self->_previousShift = v19;
  self->_previousRotation = v16;
}

- (BOOL)shouldAutorotate
{
  return 0;
}

- (void)viewWillLayoutSubviews
{
  v39.receiver = self;
  v39.super_class = (Class)LevelPageViewController;
  [(LevelPageViewController *)&v39 viewWillLayoutSubviews];
  degreesLabel = self->_degreesLabel;
  int64_t v4 = [(LevelPageViewController *)self view];
  [v4 center];
  -[UILabel setCenter:](degreesLabel, "setCenter:");

  bottomOuterCircle = self->_bottomOuterCircle;
  id v6 = [(LevelPageViewController *)self view];
  [v6 center];
  -[CAShapeLayer setPosition:](bottomOuterCircle, "setPosition:");

  bottomInnerCircle = self->_bottomInnerCircle;
  double v8 = [(LevelPageViewController *)self view];
  [v8 center];
  -[CAShapeLayer setPosition:](bottomInnerCircle, "setPosition:");

  topOuterCircle = self->_topOuterCircle;
  double v10 = [(LevelPageViewController *)self view];
  [v10 center];
  -[CAShapeLayer setPosition:](topOuterCircle, "setPosition:");

  topInnerCircle = self->_topInnerCircle;
  double v12 = [(LevelPageViewController *)self view];
  [v12 center];
  -[CAShapeLayer setPosition:](topInnerCircle, "setPosition:");

  double v13 = [(LevelPageViewController *)self view];
  [v13 bounds];
  CGFloat v15 = v14;
  double v17 = v16;
  CGFloat v19 = v18;
  CGFloat v21 = v20;

  leftLevelTic = self->_leftLevelTic;
  v40.origin.x = v15;
  v40.origin.y = v17;
  v40.size.width = v19;
  v40.size.height = v21;
  double MidX = CGRectGetMidX(v40);
  v41.origin.x = v15;
  v41.origin.y = v17;
  v41.size.width = v19;
  v41.size.height = v21;
  double v24 = MidX - CGRectGetWidth(v41) * 0.5;
  [(CALayer *)self->_leftLevelTic bounds];
  double v25 = v24 + CGRectGetWidth(v42) * 0.5;
  v43.origin.x = v15;
  v43.origin.y = v17;
  v43.size.width = v19;
  v43.size.height = v21;
  -[CALayer setPosition:](leftLevelTic, "setPosition:", v25, CGRectGetMidY(v43));
  rightLevelTic = self->_rightLevelTic;
  v44.origin.x = v15;
  v44.origin.y = v17;
  v44.size.width = v19;
  v44.size.height = v21;
  double v27 = CGRectGetMidX(v44);
  v45.origin.x = v15;
  v45.origin.y = v17;
  v45.size.width = v19;
  v45.size.height = v21;
  double v28 = v27 + CGRectGetWidth(v45) * 0.5;
  [(CALayer *)self->_rightLevelTic bounds];
  double v29 = v28 - CGRectGetWidth(v46) * 0.5;
  v47.origin.x = v15;
  v47.origin.y = v17;
  v47.size.width = v19;
  v47.size.height = v21;
  -[CALayer setPosition:](rightLevelTic, "setPosition:", v29, CGRectGetMidY(v47));
  v48.origin.x = v15;
  v48.origin.y = v17;
  v48.size.width = v19;
  v48.size.height = v21;
  CGFloat v30 = v17 + CGRectGetHeight(v48) * 0.5;
  heldLevelBottom = self->_heldLevelBottom;
  v49.origin.x = v15;
  v49.origin.y = v30;
  v49.size.width = v19;
  v49.size.height = v21;
  double v32 = CGRectGetMidX(v49);
  v50.origin.x = v15;
  v50.origin.y = v30;
  v50.size.width = v19;
  v50.size.height = v21;
  -[CALayer setPosition:](heldLevelBottom, "setPosition:", v32, CGRectGetMinY(v50));
  heldLevelBottomBacking = self->_heldLevelBottomBacking;
  v51.origin.x = v15;
  v51.origin.y = v30;
  v51.size.width = v19;
  v51.size.height = v21;
  double v34 = CGRectGetMidX(v51);
  v52.origin.x = v15;
  v52.origin.y = v30;
  v52.size.width = v19;
  v52.size.height = v21;
  -[CALayer setPosition:](heldLevelBottomBacking, "setPosition:", v34, CGRectGetMinY(v52));
  divergenceLevelBottom = self->_divergenceLevelBottom;
  v53.origin.x = v15;
  v53.origin.y = v30;
  v53.size.width = v19;
  v53.size.height = v21;
  double v36 = CGRectGetMidX(v53);
  v54.origin.x = v15;
  v54.origin.y = v30;
  v54.size.width = v19;
  v54.size.height = v21;
  -[CALayer setPosition:](divergenceLevelBottom, "setPosition:", v36, CGRectGetMinY(v54));
  levelBottom = self->_levelBottom;
  v55.origin.x = v15;
  v55.origin.y = v30;
  v55.size.width = v19;
  v55.size.height = v21;
  double v38 = CGRectGetMidX(v55);
  v56.origin.x = v15;
  v56.origin.y = v30;
  v56.size.width = v19;
  v56.size.height = v21;
  -[CALayer setPosition:](levelBottom, "setPosition:", v38, CGRectGetMinY(v56));
  [(LevelPageViewController *)self updateLevelWithForcedInterfaceUpdate:1];
}

- (void)viewWillAppear:(BOOL)a3
{
  v10.receiver = self;
  v10.super_class = (Class)LevelPageViewController;
  [(LevelPageViewController *)&v10 viewWillAppear:a3];
  int64_t v4 = +[NSNotificationCenter defaultCenter];
  [v4 addObserver:self selector:"userDefaultsChanged:" name:NSUserDefaultsDidChangeNotification object:0];

  double v5 = +[NSNotificationCenter defaultCenter];
  [v5 addObserver:self selector:"contentSizeChanged:" name:UIContentSizeCategoryDidChangeNotification object:0];

  id v6 = +[CADisplayLink displayLinkWithTarget:self selector:"updateDisplay:"];
  displayLink = self->_displayLink;
  self->_displayLink = v6;

  double v8 = self->_displayLink;
  double v9 = +[NSRunLoop mainRunLoop];
  [(CADisplayLink *)v8 addToRunLoop:v9 forMode:NSDefaultRunLoopMode];

  [(LevelPageViewController *)self notifyViewShown];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v10.receiver = self;
  v10.super_class = (Class)LevelPageViewController;
  [(LevelPageViewController *)&v10 viewDidDisappear:a3];
  [(UIImpactFeedbackGenerator *)self->_impactGenerator deactivate];
  impactGenerator = self->_impactGenerator;
  self->_impactGenerator = 0;

  double v5 = +[NSNotificationCenter defaultCenter];
  [v5 removeObserver:self];

  id v6 = +[UIApplication sharedApplication];
  [v6 setIdleTimerDisabled:0];

  displayLink = self->_displayLink;
  double v8 = +[NSRunLoop mainRunLoop];
  [(CADisplayLink *)displayLink removeFromRunLoop:v8 forMode:NSDefaultRunLoopMode];

  double v9 = self->_displayLink;
  self->_displayLink = 0;

  [(LevelPageViewController *)self notifyViewHidden];
}

- (void)updateTicsForOrientation:(int64_t)a3
{
  BOOL v4 = (unint64_t)(a3 - 5) < 0xFFFFFFFFFFFFFFFCLL;
  [(CALayer *)self->_leftLevelTic setHidden:v4];
  rightLevelTic = self->_rightLevelTic;

  [(CALayer *)rightLevelTic setHidden:v4];
}

- (void)userDefaultsChanged:(id)a3
{
  id v4 = +[NSUserDefaults standardUserDefaults];
  self->_zeroRange = (double)[v4 BOOLForKey:@"0.5"];
}

- (void)toggleHold:(id)a3
{
  +[CATransaction begin];
  +[CATransaction setDisableActions:1];
  if (self->_isHeld)
  {
    self->_BOOL isHeld = 0;
    [(CALayer *)self->_heldLevelBottom setHidden:1];
    [(CALayer *)self->_heldLevelBottomBacking setHidden:1];
    [(CALayer *)self->_divergenceLevelBottom setHidden:1];
    [(CAShapeLayer *)self->_topInnerCircle setHidden:0];
    [(CAShapeLayer *)self->_bottomInnerCircle setHidden:0];
    [(CAShapeLayer *)self->_topOuterCircle setHidden:0];
    [(CAShapeLayer *)self->_bottomOuterCircle setHidden:0];
    [(LevelPageViewController *)self setHoldAttitude:0];
    [(LevelPageViewController *)self updateTicsForOrientation:self->_orientation];
  }
  else
  {
    self->_BOOL isHeld = 1;
    int64_t orientation = self->_orientation;
    self->_heldOrientation = orientation;
    if ((unint64_t)(orientation - 5) > 1)
    {
      self->_double holdAngle = self->_currentRotation;
      self->_holdShift = self->_currentShift;
      [(CALayer *)self->_heldLevelBottom setHidden:0];
      [(CALayer *)self->_heldLevelBottomBacking setHidden:0];
      [(CALayer *)self->_divergenceLevelBottom setHidden:0];
      [(CAShapeLayer *)self->_topInnerCircle setHidden:1];
      [(CAShapeLayer *)self->_bottomInnerCircle setHidden:1];
      [(CAShapeLayer *)self->_topOuterCircle setHidden:1];
      [(CAShapeLayer *)self->_bottomOuterCircle setHidden:1];
    }
    else
    {
      double v5 = [(CMMotionManager *)self->_manager deviceMotion];
      id v6 = [v5 attitude];
      [(LevelPageViewController *)self setHoldAttitude:v6];
    }
  }
  [(LevelPageViewController *)self updateLevelWithForcedInterfaceUpdate:1];
  [(LevelPageViewController *)self updateColors];

  +[CATransaction commit];
}

- (CMAttitude)holdAttitude
{
  return self->_holdAttitude;
}

- (void)setHoldAttitude:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_impactConfig, 0);
  objc_storeStrong((id *)&self->_impactGenerator, 0);
  objc_storeStrong((id *)&self->_levelIdleTimer, 0);
  objc_storeStrong((id *)&self->_holdRecognizer, 0);
  objc_storeStrong((id *)&self->_holdAttitude, 0);
  objc_storeStrong((id *)&self->_rightLevelTic, 0);
  objc_storeStrong((id *)&self->_leftLevelTic, 0);
  objc_storeStrong((id *)&self->_topInnerCircle, 0);
  objc_storeStrong((id *)&self->_topOuterCircle, 0);
  objc_storeStrong((id *)&self->_bottomInnerCircle, 0);
  objc_storeStrong((id *)&self->_bottomOuterCircle, 0);
  objc_storeStrong((id *)&self->_manager, 0);
  objc_storeStrong((id *)&self->_degreesLabel, 0);
  objc_storeStrong((id *)&self->_ticContainer, 0);
  objc_storeStrong((id *)&self->_bubbleContainer, 0);
  objc_storeStrong((id *)&self->_levelHoldContainer, 0);
  objc_storeStrong((id *)&self->_levelContainer, 0);
  objc_storeStrong((id *)&self->_filterContainer, 0);
  objc_storeStrong((id *)&self->_heldLevelBottomBacking, 0);
  objc_storeStrong((id *)&self->_divergenceLevelBottom, 0);
  objc_storeStrong((id *)&self->_heldLevelBottom, 0);
  objc_storeStrong((id *)&self->_levelBottom, 0);

  objc_storeStrong((id *)&self->_displayLink, 0);
}

- (void)notifyViewShown
{
  uint64_t v2 = qword_1004C2C10;
  BOOL v3 = self;
  if (v2 != -1) {
    swift_once();
  }
  uint64_t v4 = qword_1004F8458;
  *(unsigned char *)(qword_1004F8458 + 16) = 1;
  uint64_t v5 = v4 + OBJC_IVAR____TtC7Measure14MetricsManager_measurementState;
  swift_beginAccess();
  *(unsigned char *)(v5 + 72) = 1;
}

- (void)notifyViewHidden
{
  uint64_t v2 = qword_1004C2C10;
  BOOL v3 = self;
  if (v2 != -1)
  {
    uint64_t v4 = v3;
    swift_once();
    BOOL v3 = v4;
  }
  *(unsigned char *)(qword_1004F8458 + 16) = 0;
}

- (id)labelFont
{
  id v2 = sub_1001CD98C();

  return v2;
}

@end