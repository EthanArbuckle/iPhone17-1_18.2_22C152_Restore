@interface TabSelectionPresentationAnimationController
- (TabSelectionPresentationAnimationController)initWithSourceView:(id)a3;
- (UIView)sourceView;
- (double)transitionDuration:(id)a3;
- (void)animateTransition:(id)a3;
- (void)setSourceView:(id)a3;
@end

@implementation TabSelectionPresentationAnimationController

- (TabSelectionPresentationAnimationController)initWithSourceView:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TabSelectionPresentationAnimationController;
  v6 = [(TabSelectionPresentationAnimationController *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_sourceView, a3);
  }

  return v7;
}

- (void)animateTransition:(id)a3
{
  id v4 = a3;
  [(TabSelectionPresentationAnimationController *)self transitionDuration:v4];
  double v6 = v5;
  v7 = [v4 viewForKey:UITransitionContextToViewKey];
  v8 = [v4 viewControllerForKey:UITransitionContextToViewControllerKey];
  objc_super v9 = [v4 containerView];
  v10 = [(TabSelectionPresentationAnimationController *)self sourceView];
  v11 = [v10 window];
  uint64_t v12 = [(TabSelectionPresentationAnimationController *)self sourceView];
  [(id)v12 frame];
  [v11 convertRect:v9 toView:];
  double x = v13;
  double y = v15;
  double width = v17;
  double height = v19;

  v21 = [(TabSelectionPresentationAnimationController *)self sourceView];
  v22 = [v21 superview];
  objc_opt_class();
  LOBYTE(v12) = objc_opt_isKindOfClass();

  if (v12)
  {
    v23 = [(TabSelectionPresentationAnimationController *)self sourceView];
    v24 = [v23 superview];

    [v24 contentOffset];
    CGFloat v26 = -v25;
    CGFloat v28 = -v27;
    v96.origin.double x = x;
    v96.origin.double y = y;
    v96.size.double width = width;
    v96.size.double height = height;
    CGRect v97 = CGRectOffset(v96, v26, v28);
    double x = v97.origin.x;
    double y = v97.origin.y;
    double width = v97.size.width;
    double height = v97.size.height;
  }
  *(void *)&long long v29 = -1;
  *((void *)&v29 + 1) = -1;
  long long v94 = v29;
  long long v95 = v29;
  long long v92 = v29;
  long long v93 = v29;
  long long v90 = v29;
  long long v91 = v29;
  long long v88 = v29;
  long long v89 = v29;
  v30 = [(TabSelectionPresentationAnimationController *)self sourceView];
  v31 = v30;
  if (v30)
  {
    [v30 transform3D];
  }
  else
  {
    long long v94 = 0u;
    long long v95 = 0u;
    long long v92 = 0u;
    long long v93 = 0u;
    long long v90 = 0u;
    long long v91 = 0u;
    long long v88 = 0u;
    long long v89 = 0u;
  }

  v32 = [(TabSelectionPresentationAnimationController *)self sourceView];
  v33 = [v32 layer];
  double v60 = v6;
  [v33 anchorPoint];
  double v35 = v34;
  double v37 = v36;

  [v4 finalFrameForViewController:v8];
  uint64_t v58 = v39;
  uint64_t v59 = v38;
  uint64_t v41 = v40;
  uint64_t v43 = v42;
  v44 = [(TabSelectionPresentationAnimationController *)self sourceView];
  v45 = [v44 superview];
  v46 = [v45 layer];
  v47 = v46;
  if (v46)
  {
    [v46 sublayerTransform];
  }
  else
  {
    long long v86 = 0u;
    long long v87 = 0u;
    long long v84 = 0u;
    long long v85 = 0u;
    long long v82 = 0u;
    long long v83 = 0u;
    long long v80 = 0u;
    long long v81 = 0u;
  }
  v48 = [v9 layer];
  v79[4] = v84;
  v79[5] = v85;
  v79[6] = v86;
  v79[7] = v87;
  v79[0] = v80;
  v79[1] = v81;
  v79[2] = v82;
  v79[3] = v83;
  [v48 setSublayerTransform:v79];

  [v9 addSubview:v7];
  v49 = [(TabSelectionPresentationAnimationController *)self sourceView];
  [v49 setHidden:1];

  v50 = [v7 layer];
  [v50 setAnchorPoint:v35, v37];

  v78[4] = v92;
  v78[5] = v93;
  v78[6] = v94;
  v78[7] = v95;
  v78[0] = v88;
  v78[1] = v89;
  v78[2] = v90;
  v78[3] = v91;
  [v7 setTransform3D:v78];
  [v7 setFrame:x, y, width, height];
  [v7 layoutIfNeeded];
  v64[0] = _NSConcreteStackBlock;
  v64[1] = 3221225472;
  v64[2] = sub_10021D978;
  v64[3] = &unk_10060E078;
  id v51 = v7;
  id v65 = v51;
  uint64_t v66 = v59;
  uint64_t v67 = v41;
  uint64_t v68 = v43;
  uint64_t v69 = v58;
  long long v52 = *(_OWORD *)&CATransform3DIdentity.m33;
  long long v74 = *(_OWORD *)&CATransform3DIdentity.m31;
  long long v75 = v52;
  long long v53 = *(_OWORD *)&CATransform3DIdentity.m43;
  long long v76 = *(_OWORD *)&CATransform3DIdentity.m41;
  long long v77 = v53;
  long long v54 = *(_OWORD *)&CATransform3DIdentity.m13;
  long long v70 = *(_OWORD *)&CATransform3DIdentity.m11;
  long long v71 = v54;
  long long v55 = *(_OWORD *)&CATransform3DIdentity.m23;
  long long v72 = *(_OWORD *)&CATransform3DIdentity.m21;
  long long v73 = v55;
  v61[0] = _NSConcreteStackBlock;
  v61[1] = 3221225472;
  v61[2] = sub_10021D9F4;
  v61[3] = &unk_100607958;
  id v56 = v4;
  id v62 = v56;
  id v57 = v8;
  id v63 = v57;
  +[UIView animateWithDuration:0 delay:v64 options:v61 animations:v60 completion:0.0];
}

- (double)transitionDuration:(id)a3
{
  return 0.22;
}

- (UIView)sourceView
{
  return self->_sourceView;
}

- (void)setSourceView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end