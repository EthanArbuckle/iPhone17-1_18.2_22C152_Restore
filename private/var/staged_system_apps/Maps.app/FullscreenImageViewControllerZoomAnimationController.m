@interface FullscreenImageViewControllerZoomAnimationController
- (FullscreenImageViewControllerZoomAnimationController)initWithOriginalImageView:(id)a3;
- (double)transitionDuration:(id)a3;
- (void)animateTransition:(id)a3;
@end

@implementation FullscreenImageViewControllerZoomAnimationController

- (FullscreenImageViewControllerZoomAnimationController)initWithOriginalImageView:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)FullscreenImageViewControllerZoomAnimationController;
  v6 = [(FullscreenImageViewControllerZoomAnimationController *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_originalImageView, a3);
    v8 = v7;
  }

  return v7;
}

- (double)transitionDuration:(id)a3
{
  return 0.200000003;
}

- (void)animateTransition:(id)a3
{
  id v4 = a3;
  id v5 = [v4 viewControllerForKey:UITransitionContextFromViewControllerKey];
  v6 = [v4 viewControllerForKey:UITransitionContextToViewControllerKey];
  unsigned int v7 = [v6 isBeingPresented];
  if (v7) {
    v8 = v6;
  }
  else {
    v8 = v5;
  }
  id v9 = v8;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_super v10 = [v9 contentView];
    [v10 setAlpha:0.0];

    [(UIImageView *)self->_originalImageView setAlpha:0.0];
    v11 = [v4 containerView];
    v12 = [v6 view];
    if (v7) {
      [v11 addSubview:v12];
    }
    else {
      [v11 sendSubviewToBack:v12];
    }

    id v13 = objc_alloc((Class)UIImageView);
    v14 = [(UIImageView *)self->_originalImageView image];
    id v15 = [v13 initWithImage:v14];

    [v15 setContentMode:[self->_originalImageView contentMode]];
    [v15 setClipsToBounds:1];
    v16 = [v4 containerView];
    [v16 addSubview:v15];

    v17 = [v4 containerView];
    [(UIImageView *)self->_originalImageView bounds];
    [v17 convertRect:self->_originalImageView fromView:];
    double v19 = v18;
    double v65 = v21;
    double v66 = v20;
    double v67 = v22;

    if (v7)
    {
      [v4 finalFrameForViewController:v6];
      CGFloat v24 = v23;
      CGFloat v26 = v25;
      double v28 = v27;
      double v30 = v29;
    }
    else
    {
      v31 = [v4 containerView];
      v32 = [v5 contentView];
      [v32 bounds];
      double v34 = v33;
      double v36 = v35;
      double v38 = v37;
      double v40 = v39;
      v41 = [v5 contentView];
      [v31 convertRect:v41 fromView:v34];
      CGFloat v24 = v42;
      CGFloat v26 = v43;
      double v28 = v44;
      double v30 = v45;
    }
    v46 = [(UIImageView *)self->_originalImageView image];
    [v46 size];
    double v48 = v28 / v47;

    v49 = [(UIImageView *)self->_originalImageView image];
    [v49 size];
    double v51 = v30 / v50;

    if (v48 >= v51) {
      double v48 = v51;
    }
    v52 = [(UIImageView *)self->_originalImageView image];
    [v52 size];
    double v54 = v48 * v53;
    v55 = [(UIImageView *)self->_originalImageView image];
    [v55 size];
    double v57 = v48 * v56;

    v80.origin.x = v24;
    v80.origin.y = v26;
    v80.size.width = v28;
    v80.size.height = v30;
    double v58 = CGRectGetMidX(v80) - v54 * 0.5;
    v81.origin.x = v24;
    v81.origin.y = v26;
    v81.size.width = v28;
    v81.size.height = v30;
    double v59 = CGRectGetMidY(v81) - v57 * 0.5;
    if (v7)
    {
      [v15 setFrame:v19, v66, v65, v67];
      v60 = [v6 view];
      [v60 setAlpha:0.0];

      double v61 = 1.0;
    }
    else
    {
      [v15 setFrame:v58, v59, v54, v57];
      double v61 = 0.0;
      double v57 = v67;
      double v54 = v65;
      double v59 = v66;
      double v58 = v19;
    }
    [(FullscreenImageViewControllerZoomAnimationController *)self transitionDuration:v4];
    double v63 = v62;
    v72[0] = _NSConcreteStackBlock;
    v72[1] = 3221225472;
    v72[2] = sub_1006867B8;
    v72[3] = &unk_1012F40F8;
    id v73 = v9;
    double v75 = v61;
    id v74 = v15;
    double v76 = v58;
    double v77 = v59;
    double v78 = v54;
    double v79 = v57;
    v68[0] = _NSConcreteStackBlock;
    v68[1] = 3221225472;
    v68[2] = sub_10068681C;
    v68[3] = &unk_1012F4120;
    v68[4] = self;
    id v69 = v73;
    id v70 = v74;
    id v71 = v4;
    id v64 = v74;
    +[UIView animateWithDuration:0x20000 delay:v72 options:v68 animations:v63 completion:0.0];
  }
  else
  {
    [v4 completeTransition:0];
  }
}

- (void).cxx_destruct
{
}

@end