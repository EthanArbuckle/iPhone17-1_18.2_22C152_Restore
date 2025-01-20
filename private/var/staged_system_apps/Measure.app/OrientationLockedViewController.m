@interface OrientationLockedViewController
- (BOOL)prefersStatusBarHidden;
- (BOOL)shouldAutorotate;
- (CGRect)correctionRotationBoundsForReferenceOrientation:(int64_t)a3 targetOrientation:(int64_t)a4 bounds:(CGRect)result;
- (NSArray)viewControllers;
- (OrientationLockedViewController)init;
- (OrientationLockedViewController)initWithCoder:(id)a3;
- (OrientationLockedViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (UIView)orientationLockedView;
- (double)correctionRotationAngleForReferenceOrientation:(int64_t)a3 targetOrientation:(int64_t)a4;
- (double)rotationAngleForOrientation:(int64_t)a3;
- (id)isAutorotationEnabled;
- (int64_t)orientationToLockTo;
- (int64_t)previousOrientation;
- (void)configure;
- (void)counterRotateChildrenForBoundsOrOrientationChange;
- (void)setIsAutorotationEnabled:(id)a3;
- (void)setOrientationLockedView:(id)a3;
- (void)setOrientationToLockTo:(int64_t)a3;
- (void)setPreviousOrientation:(int64_t)a3;
- (void)setViewControllers:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation OrientationLockedViewController

- (OrientationLockedViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)OrientationLockedViewController;
  v4 = [(OrientationLockedViewController *)&v7 initWithNibName:a3 bundle:a4];
  v5 = v4;
  if (v4) {
    [(OrientationLockedViewController *)v4 configure];
  }
  return v5;
}

- (OrientationLockedViewController)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)OrientationLockedViewController;
  v3 = [(OrientationLockedViewController *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(OrientationLockedViewController *)v3 configure];
  }
  return v4;
}

- (OrientationLockedViewController)init
{
  return [(OrientationLockedViewController *)self initWithNibName:0 bundle:0];
}

- (void)configure
{
  viewControllers = self->_viewControllers;
  self->_viewControllers = 0;

  self->_previousOrientation = 0;
  self->_orientationToLockTo = 1;
  v4 = (UIView *)objc_alloc_init((Class)UIView);
  [(UIView *)v4 setAutoresizingMask:0];
  orientationLockedView = self->_orientationLockedView;
  self->_orientationLockedView = v4;
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)OrientationLockedViewController;
  [(OrientationLockedViewController *)&v4 viewDidLoad];
  v3 = [(OrientationLockedViewController *)self view];
  [v3 addSubview:self->_orientationLockedView];

  [(OrientationLockedViewController *)self counterRotateChildrenForBoundsOrOrientationChange];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(OrientationLockedViewController *)self view];
  objc_super v6 = [v5 superview];
  [v6 setClipsToBounds:0];

  v9.receiver = self;
  v9.super_class = (Class)OrientationLockedViewController;
  [(OrientationLockedViewController *)&v9 viewWillAppear:v3];
  objc_super v7 = [(OrientationLockedViewController *)self transitionCoordinator];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10000D940;
  v8[3] = &unk_100485280;
  v8[4] = self;
  [v7 animateAlongsideTransition:v8 completion:0];
}

- (void)setOrientationToLockTo:(int64_t)a3
{
  self->_orientationToLockTo = a3;
  [(OrientationLockedViewController *)self counterRotateChildrenForBoundsOrOrientationChange];
}

- (void)setViewControllers:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_viewControllers, a3);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        -[OrientationLockedViewController addChildViewController:](self, "addChildViewController:", v11, (void)v14);
        orientationLockedView = self->_orientationLockedView;
        v13 = [v11 view];
        [(UIView *)orientationLockedView addSubview:v13];

        [v11 didMoveToParentViewController:self];
      }
      id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  [(OrientationLockedViewController *)self counterRotateChildrenForBoundsOrOrientationChange];
}

- (void)counterRotateChildrenForBoundsOrOrientationChange
{
  BOOL v3 = (char *)[(OrientationLockedViewController *)self interfaceOrientation];
  int64_t v4 = [(OrientationLockedViewController *)self orientationToLockTo];
  id v5 = [(OrientationLockedViewController *)self view];
  [v5 bounds];
  -[OrientationLockedViewController correctionRotationBoundsForReferenceOrientation:targetOrientation:bounds:](self, "correctionRotationBoundsForReferenceOrientation:targetOrientation:bounds:", v3, v4);
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  [(OrientationLockedViewController *)self correctionRotationAngleForReferenceOrientation:v3 targetOrientation:v4];
  CGFloat v15 = v14;
  long long v16 = [(OrientationLockedViewController *)self orientationLockedView];
  int64_t previousOrientation = self->_previousOrientation;
  if ((char *)previousOrientation == v3) {
    goto LABEL_24;
  }
  if ((unint64_t)(previousOrientation - 3) <= 1)
  {
    if ((unint64_t)(v3 - 3) >= 2) {
      goto LABEL_24;
    }
    goto LABEL_14;
  }
  BOOL v18 = previousOrientation == 2 && v3 == (char *)1;
  if (v18 || (previousOrientation == 1 ? (BOOL v19 = v3 == (char *)2) : (BOOL v19 = 0), v19))
  {
LABEL_14:
    -[OrientationLockedViewController correctionRotationAngleForReferenceOrientation:targetOrientation:](self, "correctionRotationAngleForReferenceOrientation:targetOrientation:");
    if (v20 == -3.14159265)
    {
      CGAffineTransformMakeRotation(&v45, 1.57079633);
      CGAffineTransform v44 = v45;
      v21 = &v44;
    }
    else if (v20 == -1.57079633)
    {
      CGAffineTransformMakeRotation(&v43, 3.14159265);
      CGAffineTransform v42 = v43;
      v21 = &v42;
    }
    else if (v20 == 1.57079633)
    {
      CGAffineTransformMakeRotation(&v41, 0.0);
      CGAffineTransform v40 = v41;
      v21 = &v40;
    }
    else if (v20 == 3.14159265)
    {
      CGAffineTransformMakeRotation(&v39, -1.57079633);
      CGAffineTransform v38 = v39;
      v21 = &v38;
    }
    else
    {
      CGAffineTransformMakeRotation(&v37, 6.28318531);
      CGAffineTransform v36 = v37;
      v21 = &v36;
    }
    [v16 setTransform:v21];
  }
LABEL_24:
  CGAffineTransformMakeRotation(&v35, v15);
  CGAffineTransform v34 = v35;
  [v16 setTransform:&v34];
  v22 = [(OrientationLockedViewController *)self view];
  [v22 bounds];
  [v16 setFrame:];

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  v23 = [(OrientationLockedViewController *)self childViewControllers];
  id v24 = [v23 countByEnumeratingWithState:&v30 objects:v46 count:16];
  if (v24)
  {
    id v25 = v24;
    uint64_t v26 = *(void *)v31;
    do
    {
      for (i = 0; i != v25; i = (char *)i + 1)
      {
        if (*(void *)v31 != v26) {
          objc_enumerationMutation(v23);
        }
        v28 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        if ([v28 isViewLoaded])
        {
          v29 = [v28 view];
          [v29 setFrame:v7, v9, v11, v13];
        }
      }
      id v25 = [v23 countByEnumeratingWithState:&v30 objects:v46 count:16];
    }
    while (v25);
  }

  [(OrientationLockedViewController *)self setPreviousOrientation:v3];
}

- (CGRect)correctionRotationBoundsForReferenceOrientation:(int64_t)a3 targetOrientation:(int64_t)a4 bounds:(CGRect)result
{
  CGFloat width = result.size.width;
  if ((unint64_t)(a3 - 3) > 1)
  {
    if (((a4 - 3) | (unint64_t)(a3 - 1)) > 1) {
      goto LABEL_3;
    }
LABEL_5:
    result.origin.x = 0.0;
    result.origin.y = 0.0;
    result.size.CGFloat width = result.size.height;
    goto LABEL_6;
  }
  if ((unint64_t)(a4 - 1) < 2) {
    goto LABEL_5;
  }
LABEL_3:
  CGFloat width = result.size.height;
LABEL_6:
  double v6 = width;
  result.size.height = v6;
  return result;
}

- (double)correctionRotationAngleForReferenceOrientation:(int64_t)a3 targetOrientation:(int64_t)a4
{
  [(OrientationLockedViewController *)self rotationAngleForOrientation:a3];
  double v7 = v6;
  [(OrientationLockedViewController *)self rotationAngleForOrientation:a4];
  return v8 - v7;
}

- (double)rotationAngleForOrientation:(int64_t)a3
{
  double result = 0.0;
  if ((unint64_t)(a3 - 2) <= 2) {
    return dbl_1003F63B8[a3 - 2];
  }
  return result;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)OrientationLockedViewController;
  id v7 = a4;
  -[OrientationLockedViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10000E034;
  v8[3] = &unk_100485280;
  v8[4] = self;
  [v7 animateAlongsideTransition:v8 completion:0];
}

- (BOOL)prefersStatusBarHidden
{
  return 1;
}

- (BOOL)shouldAutorotate
{
  BOOL v3 = [(OrientationLockedViewController *)self traitCollection];
  if ([v3 userInterfaceIdiom])
  {

LABEL_4:
    id v5 = [(OrientationLockedViewController *)self isAutorotationEnabled];
    char v6 = v5[2]();

    return v6;
  }
  unsigned __int8 v4 = +[UIDevice _hasHomeButton];

  if (v4) {
    goto LABEL_4;
  }
  return 0;
}

- (int64_t)orientationToLockTo
{
  return self->_orientationToLockTo;
}

- (NSArray)viewControllers
{
  return self->_viewControllers;
}

- (id)isAutorotationEnabled
{
  return self->_isAutorotationEnabled;
}

- (void)setIsAutorotationEnabled:(id)a3
{
}

- (UIView)orientationLockedView
{
  return self->_orientationLockedView;
}

- (void)setOrientationLockedView:(id)a3
{
}

- (int64_t)previousOrientation
{
  return self->_previousOrientation;
}

- (void)setPreviousOrientation:(int64_t)a3
{
  self->_int64_t previousOrientation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_orientationLockedView, 0);
  objc_storeStrong(&self->_isAutorotationEnabled, 0);

  objc_storeStrong((id *)&self->_viewControllers, 0);
}

@end