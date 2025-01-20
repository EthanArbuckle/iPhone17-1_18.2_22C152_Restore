@interface _UIPreviewInteractionCrossBlurViewControllerTransition
- (BOOL)isDismissTransition;
- (void)performAppearanceTransitionFromView:(id)a3 toView:(id)a4 containerView:(id)a5;
- (void)performDisappearanceTransitionFromView:(id)a3 toView:(id)a4 containerView:(id)a5;
- (void)performTransitionFromView:(id)a3 toView:(id)a4 containerView:(id)a5;
- (void)prepareAppearanceTransitionFromView:(id)a3 toView:(id)a4 containerView:(id)a5;
- (void)prepareTransitionFromView:(id)a3 toView:(id)a4 containerView:(id)a5;
- (void)setDismissTransition:(BOOL)a3;
@end

@implementation _UIPreviewInteractionCrossBlurViewControllerTransition

- (void)prepareTransitionFromView:(id)a3 toView:(id)a4 containerView:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  if ([(_UIPreviewInteractionCrossBlurViewControllerTransition *)self isDismissTransition]) {
    [(_UIPreviewInteractionCrossBlurViewControllerTransition *)self prepareDisappearanceTransitionFromView:v10 toView:v9 containerView:v8];
  }
  else {
    [(_UIPreviewInteractionCrossBlurViewControllerTransition *)self prepareAppearanceTransitionFromView:v10 toView:v9 containerView:v8];
  }
}

- (void)performTransitionFromView:(id)a3 toView:(id)a4 containerView:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  if ([(_UIPreviewInteractionCrossBlurViewControllerTransition *)self isDismissTransition]) {
    [(_UIPreviewInteractionCrossBlurViewControllerTransition *)self performDisappearanceTransitionFromView:v10 toView:v9 containerView:v8];
  }
  else {
    [(_UIPreviewInteractionCrossBlurViewControllerTransition *)self performAppearanceTransitionFromView:v10 toView:v9 containerView:v8];
  }
}

- (void)prepareAppearanceTransitionFromView:(id)a3 toView:(id)a4 containerView:(id)a5
{
  id v7 = a4;
  id v8 = a3;
  [v7 frame];
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  [v8 frame];
  CGFloat v18 = v17;
  CGFloat v20 = v19;
  CGFloat v22 = v21;
  CGFloat v24 = v23;
  CGFloat rect_8 = v23;

  v39.origin.x = v18;
  v39.origin.y = v20;
  v39.size.width = v22;
  v39.size.height = v24;
  double Height = CGRectGetHeight(v39);
  v40.origin.x = v10;
  v40.origin.y = v12;
  CGFloat v31 = v14;
  v40.size.width = v14;
  v40.size.height = v16;
  double sx = Height / CGRectGetHeight(v40);
  long long v33 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)&v37.a = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&v37.c = v33;
  *(_OWORD *)&v37.tx = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  v41.origin.x = v18;
  v41.origin.y = v20;
  v41.size.width = v22;
  v41.size.height = rect_8;
  double MidX = CGRectGetMidX(v41);
  v42.origin.x = v10;
  v42.origin.y = v12;
  v42.size.width = v14;
  v42.size.height = v16;
  CGFloat v27 = MidX - CGRectGetMidX(v42);
  v43.origin.x = v18;
  v43.origin.y = v20;
  v43.size.width = v22;
  v43.size.height = rect_8;
  double MidY = CGRectGetMidY(v43);
  v44.origin.x = v10;
  v44.origin.y = v12;
  v44.size.width = v31;
  v44.size.height = v16;
  CGFloat v29 = CGRectGetMidY(v44);
  *(_OWORD *)&v38.a = *(_OWORD *)&v37.a;
  *(_OWORD *)&v38.c = v33;
  *(_OWORD *)&v38.tx = *(_OWORD *)&v37.tx;
  CGAffineTransformTranslate(&v37, &v38, v27, MidY - v29);
  CGAffineTransform v36 = v37;
  CGAffineTransformScale(&v38, &v36, sx, sx);
  CGAffineTransform v37 = v38;
  v45.origin.x = v10;
  v45.origin.y = v12;
  v45.size.width = v31;
  v45.size.height = v16;
  self->_initialPlatterRect = CGRectApplyAffineTransform(v45, &v37);
  self->_finalPlatterRect.origin.x = v10;
  self->_finalPlatterRect.origin.y = v12;
  self->_finalPlatterRect.size.width = v31;
  self->_finalPlatterRect.size.height = v16;
  CGAffineTransform v35 = v38;
  [v7 setTransform:&v35];
  id v30 = v7;
  [v30 setBlurRadius:128.0];
  [v30 setDropShadowEnabled:0];
  [v30 setAlpha:0.0];
}

- (void)performAppearanceTransitionFromView:(id)a3 toView:(id)a4 containerView:(id)a5
{
  v37[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  [v7 frame];
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  long long v31 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)&v36.a = *MEMORY[0x1E4F1DAB8];
  long long v30 = *(_OWORD *)&v36.a;
  *(_OWORD *)&v36.c = v31;
  *(_OWORD *)&v36.tx = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  long long v29 = *(_OWORD *)&v36.tx;
  double MidX = CGRectGetMidX(self->_finalPlatterRect);
  v38.origin.x = v10;
  v38.origin.y = v12;
  v38.size.width = v14;
  v38.size.height = v16;
  CGFloat v18 = MidX - CGRectGetMidX(v38);
  double MidY = CGRectGetMidY(self->_finalPlatterRect);
  v39.origin.x = v10;
  v39.origin.y = v12;
  v39.size.width = v14;
  v39.size.height = v16;
  CGFloat v20 = CGRectGetMidY(v39);
  *(_OWORD *)&v35.a = *(_OWORD *)&v36.a;
  *(_OWORD *)&v35.c = v31;
  *(_OWORD *)&v35.tx = *(_OWORD *)&v36.tx;
  CGAffineTransformTranslate(&v36, &v35, v18, MidY - v20);
  double Width = CGRectGetWidth(self->_finalPlatterRect);
  v40.origin.x = v10;
  v40.origin.y = v12;
  v40.size.width = v14;
  v40.size.height = v16;
  CGFloat v22 = Width / CGRectGetWidth(v40);
  double Height = CGRectGetHeight(self->_finalPlatterRect);
  v41.origin.x = v10;
  v41.origin.y = v12;
  v41.size.width = v14;
  v41.size.height = v16;
  CGFloat v24 = CGRectGetHeight(v41);
  CGAffineTransform v34 = v36;
  CGAffineTransformScale(&v35, &v34, v22, Height / v24);
  *(_OWORD *)&v36.c = *(_OWORD *)&v35.c;
  *(_OWORD *)&v36.tx = *(_OWORD *)&v35.tx;
  *(_OWORD *)&v36.a = *(_OWORD *)&v35.a;
  CGAffineTransform v34 = v35;
  CGAffineTransformScale(&v35, &v34, 1.2, 1.0);
  *(_OWORD *)&v36.tx = *(_OWORD *)&v35.tx;
  CGAffineTransform v33 = v35;
  [v7 setTransform:&v33];
  [v7 setAlpha:0.0];
  id v25 = v7;
  v26 = +[UIBlurEffect effectWithBlurRadius:4.0];
  v37[0] = v26;
  CGFloat v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:1];
  [v25 setContentEffects:v27];

  v32[0] = v30;
  v32[1] = v31;
  v32[2] = v29;
  id v28 = v8;
  [v28 setTransform:v32];
  [v28 setAlpha:1.0];
  [v28 setBlurRadius:0.0];
  [v28 setDropShadowEnabled:1];
}

- (void)performDisappearanceTransitionFromView:(id)a3 toView:(id)a4 containerView:(id)a5
{
  id v6 = a4;
  long long v28 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v33[0] = *MEMORY[0x1E4F1DAB8];
  long long v27 = v33[0];
  v33[1] = v28;
  long long v34 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  long long v26 = v34;
  id v7 = a3;
  [v6 setTransform:v33];
  [v6 setAlpha:1.0];
  [v6 setContentEffects:MEMORY[0x1E4F1CBF0]];
  [v7 frame];
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  [v7 frame];
  CGFloat x = v35.origin.x;
  CGFloat y = v35.origin.y;
  CGFloat width = v35.size.width;
  CGFloat height = v35.size.height;
  double sx = CGRectGetHeight(v35);
  v36.origin.CGFloat x = v9;
  v36.origin.CGFloat y = v11;
  v36.size.CGFloat width = v13;
  v36.size.CGFloat height = v15;
  *(_OWORD *)&v32.a = v27;
  *(_OWORD *)&v32.c = v28;
  *(_OWORD *)&v32.tCGFloat x = v26;
  double sxa = sx / CGRectGetHeight(v36);
  v37.origin.CGFloat x = x;
  v37.origin.CGFloat y = y;
  v37.size.CGFloat width = width;
  v37.size.CGFloat height = height;
  tCGFloat x = CGRectGetMidX(v37);
  v38.origin.CGFloat x = v9;
  v38.origin.CGFloat y = v11;
  v38.size.CGFloat width = v13;
  v38.size.CGFloat height = v15;
  double txa = tx - CGRectGetMidX(v38);
  v39.origin.CGFloat x = x;
  v39.origin.CGFloat y = y;
  v39.size.CGFloat width = width;
  v39.size.CGFloat height = height;
  double MidY = CGRectGetMidY(v39);
  v40.origin.CGFloat x = v9;
  v40.origin.CGFloat y = v11;
  v40.size.CGFloat width = v13;
  v40.size.CGFloat height = v15;
  CGFloat v21 = CGRectGetMidY(v40);
  *(_OWORD *)&v31.a = v27;
  *(_OWORD *)&v31.c = v28;
  *(_OWORD *)&v31.tCGFloat x = v26;
  CGAffineTransformTranslate(&v32, &v31, txa, MidY - v21);
  CGAffineTransform v30 = v32;
  CGAffineTransformScale(&v31, &v30, sxa, sxa);
  *(_OWORD *)&v32.tCGFloat x = *(_OWORD *)&v31.tx;
  CGAffineTransform v29 = v31;
  [v7 setTransform:&v29];
  [v7 setAlpha:0.0];
}

- (BOOL)isDismissTransition
{
  return self->_dismissTransition;
}

- (void)setDismissTransition:(BOOL)a3
{
  self->_dismissTransition = a3;
}

@end