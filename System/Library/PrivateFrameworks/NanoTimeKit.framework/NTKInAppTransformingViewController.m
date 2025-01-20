@interface NTKInAppTransformingViewController
- (CGRect)overrideFrame;
- (NTKFaceViewController)faceViewController;
- (NTKInAppTransformingViewController)initWithFace:(id)a3;
- (void)setOverrideFrame:(CGRect)a3;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation NTKInAppTransformingViewController

- (NTKInAppTransformingViewController)initWithFace:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NTKInAppTransformingViewController;
  v6 = [(NTKInAppTransformingViewController *)&v9 initWithNibName:0 bundle:0];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_face, a3);
  }

  return v7;
}

- (void)viewDidLoad
{
  v23[4] = *MEMORY[0x1E4F143B8];
  v22.receiver = self;
  v22.super_class = (Class)NTKInAppTransformingViewController;
  [(NTKInAppTransformingViewController *)&v22 viewDidLoad];
  v3 = [[NTKFaceViewController alloc] initWithFace:self->_face configuration:&__block_literal_global_153];
  v4 = [(NTKInAppTransformingViewController *)self view];
  id v5 = [(NTKFaceViewController *)v3 view];
  v21 = v3;
  [(NTKInAppTransformingViewController *)self addChildViewController:v3];
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v4 addSubview:v5];
  [(NTKFaceViewController *)v3 didMoveToParentViewController:self];
  v15 = (void *)MEMORY[0x1E4F28DC8];
  v20 = [v5 widthAnchor];
  v19 = [v4 widthAnchor];
  v18 = [v20 constraintEqualToAnchor:v19];
  v23[0] = v18;
  v17 = [v5 heightAnchor];
  v16 = [v4 heightAnchor];
  v14 = [v17 constraintEqualToAnchor:v16];
  v23[1] = v14;
  v6 = [v5 centerXAnchor];
  v7 = [v4 centerXAnchor];
  v8 = [v6 constraintEqualToAnchor:v7];
  v23[2] = v8;
  objc_super v9 = [v5 centerYAnchor];
  v10 = [v4 centerYAnchor];
  v11 = [v9 constraintEqualToAnchor:v10];
  v23[3] = v11;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:4];
  [v15 activateConstraints:v12];

  [(NTKFaceViewController *)v21 setDelegate:self];
  faceViewController = self->_faceViewController;
  self->_faceViewController = v21;
}

- (void)setOverrideFrame:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  p_overrideFrame = &self->_overrideFrame;
  if (!CGRectEqualToRect(a3, self->_overrideFrame))
  {
    p_overrideFrame->origin.CGFloat x = x;
    p_overrideFrame->origin.CGFloat y = y;
    p_overrideFrame->size.CGFloat width = width;
    p_overrideFrame->size.CGFloat height = height;
    if ([(NTKInAppTransformingViewController *)self isViewLoaded])
    {
      id v9 = [(NTKInAppTransformingViewController *)self view];
      [v9 setNeedsLayout];
    }
  }
}

- (void)viewWillLayoutSubviews
{
  v3 = [(NTKInAppTransformingViewController *)self view];
  [v3 bounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;

  CGFloat x = self->_overrideFrame.origin.x;
  CGFloat y = self->_overrideFrame.origin.y;
  CGFloat width = self->_overrideFrame.size.width;
  CGFloat height = self->_overrideFrame.size.height;
  v16 = [(NTKFaceViewController *)self->_faceViewController view];
  v34.origin.CGFloat x = x;
  v34.origin.CGFloat y = y;
  v34.size.CGFloat width = width;
  v34.size.CGFloat height = height;
  if (CGRectIsEmpty(v34))
  {
    long long v17 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&v33.a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&v33.c = v17;
    *(_OWORD *)&v33.tCGFloat x = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    p_CGAffineTransform t1 = &v33;
LABEL_9:
    objc_msgSend(v16, "setTransform:", p_t1, *(void *)&tx);
    goto LABEL_10;
  }
  v35.origin.CGFloat x = v5;
  v35.origin.CGFloat y = v7;
  v35.size.CGFloat width = v9;
  v35.size.CGFloat height = v11;
  if (!CGRectIsEmpty(v35))
  {
    v36.origin.CGFloat x = x;
    v36.origin.CGFloat y = y;
    v36.size.CGFloat width = width;
    v36.size.CGFloat height = height;
    double sxa = CGRectGetWidth(v36);
    v37.origin.CGFloat x = v5;
    v37.origin.CGFloat y = v7;
    v37.size.CGFloat width = v9;
    v37.size.CGFloat height = v11;
    sCGFloat x = sxa / CGRectGetWidth(v37);
    v38.origin.CGFloat x = x;
    v38.origin.CGFloat y = y;
    v38.size.CGFloat width = width;
    v38.size.CGFloat height = height;
    double txa = CGRectGetHeight(v38);
    v39.origin.CGFloat x = v5;
    v39.origin.CGFloat y = v7;
    v39.size.CGFloat width = v9;
    v39.size.CGFloat height = v11;
    double v19 = txa / CGRectGetHeight(v39);
    if (sx < v19) {
      double v19 = sx;
    }
    if (v19 > 1.0) {
      double v19 = 1.0;
    }
    CGFloat sxb = fmax(v19, 0.0);
    v40.origin.CGFloat x = x;
    v40.origin.CGFloat y = y;
    v40.size.CGFloat width = width;
    v40.size.CGFloat height = height;
    double txb = CGRectGetMidX(v40);
    v41.origin.CGFloat x = v5;
    v41.origin.CGFloat y = v7;
    v41.size.CGFloat width = v9;
    v41.size.CGFloat height = v11;
    tCGFloat x = txb - CGRectGetMidX(v41);
    v42.origin.CGFloat x = x;
    v42.origin.CGFloat y = y;
    v42.size.CGFloat width = width;
    v42.size.CGFloat height = height;
    double MidY = CGRectGetMidY(v42);
    v43.origin.CGFloat x = v5;
    v43.origin.CGFloat y = v7;
    v43.size.CGFloat width = v9;
    v43.size.CGFloat height = v11;
    CGFloat v21 = CGRectGetMidY(v43);
    memset(&v33, 0, sizeof(v33));
    CGAffineTransformMakeTranslation(&v33, tx, MidY - v21);
    memset(&v32, 0, sizeof(v32));
    CGAffineTransformMakeScale(&v32, sxb, sxb);
    CGAffineTransform t1 = v33;
    memset(&v31, 0, sizeof(v31));
    CGAffineTransform t2 = v32;
    CGAffineTransformConcat(&v31, &t1, &t2);
    CGAffineTransform t1 = v31;
    p_CGAffineTransform t1 = &t1;
    goto LABEL_9;
  }
LABEL_10:
  v28.receiver = self;
  v28.super_class = (Class)NTKInAppTransformingViewController;
  [(NTKInAppTransformingViewController *)&v28 viewWillLayoutSubviews];
}

- (CGRect)overrideFrame
{
  double x = self->_overrideFrame.origin.x;
  double y = self->_overrideFrame.origin.y;
  double width = self->_overrideFrame.size.width;
  double height = self->_overrideFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (NTKFaceViewController)faceViewController
{
  return self->_faceViewController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_faceViewController, 0);
  objc_storeStrong((id *)&self->_face, 0);
}

@end