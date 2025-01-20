@interface PKReaderModeAnimationView
- (CGSize)sizeThatFits:(CGSize)a3;
- (PKReaderModeAnimationView)initWithAssetName:(id)a3 forPhoneTarget:(BOOL)a4;
- (PKReaderModeAnimationView)initWithFrame:(CGRect)a3 assetName:(id)a4 forPhoneTarget:(BOOL)a5;
- (unint64_t)animationStateForProvisioningViewState:(unint64_t)a3;
- (unint64_t)state;
- (void)_setState:(unint64_t)a3 animated:(BOOL)a4;
- (void)setDigitalCardImage:(id)a3;
- (void)setImage:(id)a3 forPublishedObjectWithName:(id)a4;
- (void)setPlasticCardImage:(id)a3;
- (void)setState:(unint64_t)a3;
- (void)setState:(unint64_t)a3 animated:(BOOL)a4;
- (void)setWatchAssetImage:(id)a3;
@end

@implementation PKReaderModeAnimationView

- (PKReaderModeAnimationView)initWithAssetName:(id)a3 forPhoneTarget:(BOOL)a4
{
  BOOL v4 = a4;
  v6 = (void *)MEMORY[0x1E4FB1BA8];
  id v7 = a3;
  v8 = [v6 mainScreen];
  [v8 bounds];
  v9 = -[PKReaderModeAnimationView initWithFrame:assetName:forPhoneTarget:](self, "initWithFrame:assetName:forPhoneTarget:", v7, v4, 0.0, 0.0);

  return v9;
}

- (PKReaderModeAnimationView)initWithFrame:(CGRect)a3 assetName:(id)a4 forPhoneTarget:(BOOL)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v11 = a4;
  v34.receiver = self;
  v34.super_class = (Class)PKReaderModeAnimationView;
  v12 = -[PKReaderModeAnimationView initWithFrame:](&v34, sel_initWithFrame_, x, y, width, height);
  if (v12)
  {
    v13 = PKPassKitUIBundle();
    v14 = [v13 URLForResource:v11 withExtension:@"caar"];

    uint64_t v15 = *MEMORY[0x1E4F3A4B8];
    id v33 = 0;
    uint64_t v16 = [MEMORY[0x1E4F39C38] packageWithContentsOfURL:v14 type:v15 options:0 error:&v33];
    id v17 = v33;
    package = v12->_package;
    v12->_package = (CAPackage *)v16;

    if (!v12->_package)
    {
      v19 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543874;
        v36 = v14;
        __int16 v37 = 2114;
        id v38 = v11;
        __int16 v39 = 2114;
        id v40 = v17;
        _os_log_impl(&dword_19F450000, v19, OS_LOG_TYPE_DEFAULT, "Error loading mica animation archive URL: %{public}@, asset name: %{public}@, error: %{public}@", buf, 0x20u);
      }
    }
    v12->_isPhoneTarget = a5;
    uint64_t v20 = [(CAPackage *)v12->_package rootLayer];
    phoneLayer = v12->_phoneLayer;
    v12->_phoneLayer = (CALayer *)v20;

    [(CALayer *)v12->_phoneLayer setGeometryFlipped:[(CAPackage *)v12->_package isGeometryFlipped]];
    [(CALayer *)v12->_phoneLayer size];
    CGFloat v23 = width / v22;
    v24 = [(PKReaderModeAnimationView *)v12 layer];
    CATransform3DMakeScale(&v32, v23, v23, 1.0);
    [v24 setTransform:&v32];

    [(CALayer *)v12->_phoneLayer size];
    CGFloat v26 = v23 * v25;
    [(CALayer *)v12->_phoneLayer size];
    -[PKReaderModeAnimationView setFrame:](v12, "setFrame:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), v26, v23 * v27);
    v28 = [(PKReaderModeAnimationView *)v12 layer];
    [v28 addSublayer:v12->_phoneLayer];

    uint64_t v29 = [objc_alloc(MEMORY[0x1E4F39CB0]) initWithLayer:v12->_phoneLayer];
    stateController = v12->_stateController;
    v12->_stateController = (CAStateController *)v29;
  }
  return v12;
}

- (void)setPlasticCardImage:(id)a3
{
}

- (void)setDigitalCardImage:(id)a3
{
  if (self->_isPhoneTarget) {
    v3 = @"Digital_Card_Phone";
  }
  else {
    v3 = @"Digital_Card";
  }
  [(PKReaderModeAnimationView *)self setImage:a3 forPublishedObjectWithName:v3];
}

- (void)setWatchAssetImage:(id)a3
{
}

- (void)setImage:(id)a3 forPublishedObjectWithName:(id)a4
{
  if (a3)
  {
    id v6 = a3;
    id v7 = a4;
    uint64_t v8 = [v6 CGImage];
    id v9 = [(CAPackage *)self->_package publishedObjectWithName:v7];

    [v9 setContents:v8];
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  [(CALayer *)self->_phoneLayer size];
  double v6 = width * (v5 / v4);
  double v7 = width;
  result.double height = v6;
  result.double width = v7;
  return result;
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
}

- (void)setState:(unint64_t)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  self->_state = a3;
  unint64_t v6 = -[PKReaderModeAnimationView animationStateForProvisioningViewState:](self, "animationStateForProvisioningViewState:");

  [(PKReaderModeAnimationView *)self _setState:v6 animated:v4];
}

- (unint64_t)animationStateForProvisioningViewState:(unint64_t)a3
{
  if (a3 - 1 > 4) {
    return 0;
  }
  else {
    return qword_1A0445650[a3 - 1];
  }
}

- (void)_setState:(unint64_t)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  if (a3)
  {
    if (a3 == 2)
    {
      if (self->_isPhoneTarget) {
        double v7 = @"Done_Phone";
      }
      else {
        double v7 = @"Done";
      }
      unint64_t v6 = v7;
    }
    else
    {
      if (a3 != 1) {
        return;
      }
      unint64_t v6 = @"Hold";
    }
  }
  else
  {
    unint64_t v6 = @"Animate On";
  }
  v12 = v6;
  uint64_t v8 = [(CALayer *)self->_phoneLayer stateWithName:v6];
  if (v8)
  {
    stateController = self->_stateController;
    phoneLayer = self->_phoneLayer;
    if (v4)
    {
      LODWORD(v9) = 1.0;
      [(CAStateController *)stateController setState:v8 ofLayer:phoneLayer transitionSpeed:v9];
    }
    else
    {
      [(CAStateController *)stateController setState:v8 ofLayer:phoneLayer];
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateController, 0);
  objc_storeStrong((id *)&self->_phoneLayer, 0);

  objc_storeStrong((id *)&self->_package, 0);
}

@end