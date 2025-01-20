@interface UISearchDisplayControllerContainerView
- (NSLayoutConstraint)topViewAttributeTopConstraint;
- (NSLayoutConstraint)topViewHeightConstraint;
- (UISearchDisplayControllerContainerView)initWithFrame:(CGRect)a3 topViewHeight:(double)a4;
- (UIView)behindView;
- (UIView)bottomView;
- (UIView)topView;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)_didMoveFromWindow:(id)a3 toWindow:(id)a4;
- (void)adjustTopAttributeConstantByDelta:(double)a3;
- (void)collapseTopView;
- (void)configureInteractionForContainment:(BOOL)a3;
- (void)setBottomViewUserInteractionEnabled:(BOOL)a3;
- (void)setTopViewAttributeTopConstraint:(id)a3;
- (void)setTopViewHeightConstraint:(id)a3;
- (void)updateTopAttributeConstant:(double)a3;
- (void)updateTopViewHeight:(double)a3;
- (void)updateTopViewHeight:(double)a3 animateUpdate:(BOOL)a4;
@end

@implementation UISearchDisplayControllerContainerView

- (UISearchDisplayControllerContainerView)initWithFrame:(CGRect)a3 topViewHeight:(double)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v44.receiver = self;
  v44.super_class = (Class)UISearchDisplayControllerContainerView;
  v9 = -[UIView initWithFrame:](&v44, sel_initWithFrame_);
  v10 = v9;
  if (v9)
  {
    [(UIView *)v9 setAutoresizingMask:18];
    memset(&slice, 0, sizeof(slice));
    memset(&remainder, 0, sizeof(remainder));
    v45.origin.double x = x;
    v45.origin.double y = y;
    v45.size.double width = width;
    v45.size.double height = height;
    CGRectDivide(v45, &slice, &remainder, a4, CGRectMinYEdge);
    v11 = (objc_class *)objc_opt_class();
    v12 = (objc_class *)objc_opt_class();
    v13 = (objc_class *)objc_opt_class();
    id v14 = [v11 alloc];
    uint64_t v15 = objc_msgSend(v14, "initWithFrame:", slice.origin.x, slice.origin.y, slice.size.width, slice.size.height);
    topView = v10->_topView;
    v10->_topView = (UIView *)v15;

    id v17 = [v12 alloc];
    uint64_t v18 = objc_msgSend(v17, "initWithFrame:", remainder.origin.x, remainder.origin.y, remainder.size.width, remainder.size.height);
    bottomView = v10->_bottomView;
    v10->_bottomView = (UIView *)v18;

    uint64_t v20 = objc_msgSend([v13 alloc], "initWithFrame:", x, y, width, height);
    behindView = v10->_behindView;
    v10->_behindView = (UIView *)v20;

    [(UIView *)v10->_topView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)v10->_bottomView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)v10->_behindView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)v10 addSubview:v10->_topView];
    [(UIView *)v10 addSubview:v10->_bottomView];
    [(UIView *)v10 insertSubview:v10->_behindView belowSubview:v10->_topView];
    v22 = (void *)MEMORY[0x1E4F5B268];
    v23 = objc_msgSend(NSString, "stringWithFormat:", @"V:[_topView(==%f)][_bottomView]", *(void *)&a4);
    v24 = _NSDictionaryOfVariableBindings(&cfstr_TopviewBottomv.isa, v10->_topView, v10->_bottomView, 0);
    v25 = [v22 constraintsWithVisualFormat:v23 options:0 metrics:0 views:v24];

    v26 = [v25 objectAtIndex:0];
    [(UISearchDisplayControllerContainerView *)v10 setTopViewHeightConstraint:v26];

    [(UIView *)v10 addConstraints:v25];
    v27 = (void *)MEMORY[0x1E4F5B268];
    v28 = _NSDictionaryOfVariableBindings(&cfstr_Topview.isa, v10->_topView, 0);
    v29 = [v27 constraintsWithVisualFormat:@"H:|[_topView]|" options:0 metrics:0 views:v28];

    [(UIView *)v10 addConstraints:v29];
    v30 = (void *)MEMORY[0x1E4F5B268];
    v31 = _NSDictionaryOfVariableBindings(&cfstr_Bottomview.isa, v10->_bottomView, 0);
    v32 = [v30 constraintsWithVisualFormat:@"H:|[_bottomView]|" options:0 metrics:0 views:v31];

    [(UIView *)v10 addConstraints:v32];
    v33 = [MEMORY[0x1E4F5B268] constraintWithItem:v10->_topView attribute:3 relatedBy:0 toItem:v10 attribute:3 multiplier:1.0 constant:0.0];
    [(UIView *)v10 addConstraint:v33];
    [(UISearchDisplayControllerContainerView *)v10 setTopViewAttributeTopConstraint:v33];
    v34 = [MEMORY[0x1E4F5B268] constraintWithItem:v10->_bottomView attribute:4 relatedBy:0 toItem:v10 attribute:4 multiplier:1.0 constant:0.0];

    [(UIView *)v10 addConstraint:v34];
    v35 = (void *)MEMORY[0x1E4F5B268];
    v36 = _NSDictionaryOfVariableBindings(&cfstr_Behindview.isa, v10->_behindView, 0);
    v37 = [v35 constraintsWithVisualFormat:@"H:|[_behindView]|" options:0 metrics:0 views:v36];

    [(UIView *)v10 addConstraints:v37];
    v38 = (void *)MEMORY[0x1E4F5B268];
    v39 = _NSDictionaryOfVariableBindings(&cfstr_Behindview.isa, v10->_behindView, 0);
    v40 = [v38 constraintsWithVisualFormat:@"V:|[_behindView]|" options:0 metrics:0 views:v39];

    [(UIView *)v10 addConstraints:v40];
  }
  return v10;
}

- (void)updateTopViewHeight:(double)a3
{
}

- (void)updateTopViewHeight:(double)a3 animateUpdate:(BOOL)a4
{
  BOOL v4 = a4;
  id v11 = [(UISearchDisplayControllerContainerView *)self topViewHeightConstraint];
  [v11 constant];
  if (v7 == a3)
  {
  }
  else
  {
    BOOL collapsedTopView = self->_collapsedTopView;

    if (!collapsedTopView)
    {
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __76__UISearchDisplayControllerContainerView_updateTopViewHeight_animateUpdate___block_invoke;
      aBlock[3] = &unk_1E52D9CD0;
      aBlock[4] = self;
      *(double *)&aBlock[5] = a3;
      v9 = _Block_copy(aBlock);
      v10 = v9;
      if (v4) {
        (*((void (**)(void *))v9 + 2))(v9);
      }
      else {
        +[UIView performWithoutAnimation:v9];
      }
    }
  }
}

uint64_t __76__UISearchDisplayControllerContainerView_updateTopViewHeight_animateUpdate___block_invoke(uint64_t a1)
{
  double v2 = *(double *)(a1 + 40);
  v3 = [*(id *)(a1 + 32) topViewHeightConstraint];
  [v3 setConstant:v2];

  BOOL v4 = *(void **)(a1 + 32);
  return [v4 layoutIfNeeded];
}

- (void)collapseTopView
{
  self->_BOOL collapsedTopView = 1;
}

- (void)setBottomViewUserInteractionEnabled:(BOOL)a3
{
}

- (void)updateTopAttributeConstant:(double)a3
{
  v5 = [(UISearchDisplayControllerContainerView *)self topViewAttributeTopConstraint];
  [v5 constant];
  double v7 = v6;

  if (v7 != a3)
  {
    v8 = [(UISearchDisplayControllerContainerView *)self topViewAttributeTopConstraint];
    [v8 setConstant:a3];

    [(UIView *)self layoutIfNeeded];
  }
}

- (void)adjustTopAttributeConstantByDelta:(double)a3
{
  id v6 = [(UISearchDisplayControllerContainerView *)self topViewAttributeTopConstraint];
  [v6 constant];
  [(UISearchDisplayControllerContainerView *)self updateTopAttributeConstant:v5 + a3];
}

- (void)configureInteractionForContainment:(BOOL)a3
{
  if (!a3)
  {
    [(UIView *)self->_topView setUserInteractionEnabled:0];
    behindView = self->_behindView;
    [(UIView *)behindView setUserInteractionEnabled:0];
  }
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)UISearchDisplayControllerContainerView;
  -[UIView hitTest:withEvent:](&v9, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  double v5 = (UISearchDisplayControllerContainerView *)objc_claimAutoreleasedReturnValue();
  id v6 = v5;
  if (v5 == self) {
    double v7 = 0;
  }
  else {
    double v7 = v5;
  }

  return v7;
}

- (void)_didMoveFromWindow:(id)a3 toWindow:(id)a4
{
  id v6 = a4;
  v7.receiver = self;
  v7.super_class = (Class)UISearchDisplayControllerContainerView;
  [(UIView *)&v7 _didMoveFromWindow:a3 toWindow:v6];
  if (v6) {
    [v6 updateConstraintsIfNeeded];
  }
}

- (NSLayoutConstraint)topViewHeightConstraint
{
  return self->_topViewHeightConstraint;
}

- (void)setTopViewHeightConstraint:(id)a3
{
}

- (NSLayoutConstraint)topViewAttributeTopConstraint
{
  return self->_topViewAttributeTopConstraint;
}

- (void)setTopViewAttributeTopConstraint:(id)a3
{
}

- (UIView)topView
{
  return self->_topView;
}

- (UIView)bottomView
{
  return self->_bottomView;
}

- (UIView)behindView
{
  return self->_behindView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_behindView, 0);
  objc_storeStrong((id *)&self->_bottomView, 0);
  objc_storeStrong((id *)&self->_topView, 0);
  objc_storeStrong((id *)&self->_topViewAttributeTopConstraint, 0);
  objc_storeStrong((id *)&self->_topViewHeightConstraint, 0);
}

@end