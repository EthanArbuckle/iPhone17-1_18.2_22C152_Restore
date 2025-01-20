@interface _UIContextMenuDismissToWindowSceneActivationAnimation
+ (id)animationWithUIController:(id)a3;
- (_UIContextMenuUIController)menuUIController;
- (void)animateAlongsideScenePlatter:(id)a3;
- (void)setMenuUIController:(id)a3;
@end

@implementation _UIContextMenuDismissToWindowSceneActivationAnimation

+ (id)animationWithUIController:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 setMenuUIController:v3];

  return v4;
}

- (void)animateAlongsideScenePlatter:(id)a3
{
  id v4 = a3;
  v5 = [(_UIContextMenuDismissToWindowSceneActivationAnimation *)self menuUIController];
  v6 = [v5 platterContainerView];
  [v6 setUserInteractionEnabled:0];

  v7 = [(_UIContextMenuDismissToWindowSceneActivationAnimation *)self menuUIController];
  v8 = [v7 contentPlatterView];

  v9 = [(_UIContextMenuDismissToWindowSceneActivationAnimation *)self menuUIController];
  v10 = [v9 menuView];

  if (v8)
  {
    v65[0] = MEMORY[0x1E4F143A8];
    v65[1] = 3221225472;
    v65[2] = __86___UIContextMenuDismissToWindowSceneActivationAnimation_animateAlongsideScenePlatter___block_invoke;
    v65[3] = &unk_1E52D9F70;
    id v11 = v8;
    id v66 = v11;
    +[UIView performWithoutAnimation:v65];
    v12 = [v4 _velocityForKey:@"position"];
    if (v12) {
      [v10 _setVelocity:v12 forKey:@"position"];
    }
    uint64_t v64 = 0;
    long long v62 = 0u;
    long long v63 = 0u;
    v13 = [(_UIContextMenuDismissToWindowSceneActivationAnimation *)self menuUIController];
    v14 = [v13 currentLayout];
    v15 = v14;
    if (v14)
    {
      [v14 anchor];
    }
    else
    {
      uint64_t v64 = 0;
      long long v62 = 0u;
      long long v63 = 0u;
    }

    v16 = [v10 superview];
    [v4 frame];
    double v18 = v17;
    double v20 = v19;
    double v22 = v21;
    double v24 = v23;
    v25 = [v4 superview];
    objc_msgSend(v16, "convertRect:fromView:", v25, v18, v20, v22, v24);
    CGFloat v58 = v27;
    CGFloat v59 = v26;
    CGFloat v56 = v29;
    CGFloat v57 = v28;

    uint64_t v30 = v62 - 1;
    double v31 = 0.5;
    double v32 = 0.5;
    if ((unint64_t)(v62 - 1) <= 7)
    {
      double v31 = dbl_186B9AB38[v30];
      double v32 = dbl_186B9AB78[v30];
    }
    switch(*((void *)&v62 + 1))
    {
      case 1:
        double v31 = 0.0;
        break;
      case 2:
        double v32 = 0.0;
        break;
      case 4:
        double v31 = 1.0;
        break;
      case 8:
        double v32 = 1.0;
        break;
      default:
        break;
    }
    double v54 = v32;
    double v55 = v31;
    [v11 frame];
    CGFloat x = v67.origin.x;
    CGFloat y = v67.origin.y;
    CGFloat width = v67.size.width;
    CGFloat height = v67.size.height;
    double MinX = CGRectGetMinX(v67);
    v68.origin.CGFloat x = x;
    v68.origin.CGFloat y = y;
    v68.size.CGFloat width = width;
    v68.size.CGFloat height = height;
    double v38 = MinX + v32 * CGRectGetWidth(v68);
    v69.origin.CGFloat x = x;
    v69.origin.CGFloat y = y;
    v69.size.CGFloat width = width;
    v69.size.CGFloat height = height;
    double MinY = CGRectGetMinY(v69);
    v70.origin.CGFloat x = x;
    v70.origin.CGFloat y = y;
    v70.size.CGFloat width = width;
    v70.size.CGFloat height = height;
    double v40 = MinY + v31 * CGRectGetHeight(v70);
    [v10 center];
    double v42 = v41 - v38;
    [v10 center];
    double v44 = v43 - v40;
    v71.origin.CGFloat x = v59;
    v71.origin.CGFloat y = v58;
    v71.size.CGFloat width = v57;
    v71.size.CGFloat height = v56;
    double v45 = CGRectGetMinX(v71);
    v72.origin.CGFloat x = v59;
    v72.origin.CGFloat y = v58;
    v72.size.CGFloat width = v57;
    v72.size.CGFloat height = v56;
    double v46 = v42 + v45 + v54 * CGRectGetWidth(v72);
    v73.origin.CGFloat x = v59;
    v73.origin.CGFloat y = v58;
    v73.size.CGFloat width = v57;
    v73.size.CGFloat height = v56;
    double v47 = CGRectGetMinY(v73);
    v74.origin.CGFloat x = v59;
    v74.origin.CGFloat y = v58;
    v74.size.CGFloat width = v57;
    v74.size.CGFloat height = v56;
    objc_msgSend(v10, "setCenter:", v46, v44 + v47 + v55 * CGRectGetHeight(v74));
  }
  v48 = +[_UIWindowSceneActivationSettingsDomain rootSettings];
  v49 = [v48 morphMenuDismissal];
  v50 = [v49 springAnimationBehavior];
  v60[0] = MEMORY[0x1E4F143A8];
  v60[1] = 3221225472;
  v60[2] = __86___UIContextMenuDismissToWindowSceneActivationAnimation_animateAlongsideScenePlatter___block_invoke_2;
  v60[3] = &unk_1E52D9F70;
  id v61 = v10;
  id v51 = v10;
  +[UIView _animateUsingSpringBehavior:v50 tracking:0 animations:v60 completion:0];

  v52 = [(_UIContextMenuDismissToWindowSceneActivationAnimation *)self menuUIController];
  v53 = [v52 backgroundEffectView];
  [v53 setAlpha:0.0];
}

- (_UIContextMenuUIController)menuUIController
{
  return self->_menuUIController;
}

- (void)setMenuUIController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end