@interface SLReplicatorView
+ (Class)layerClass;
- (NSLayoutConstraint)heightConstraint;
- (NSLayoutConstraint)targetViewLeadingConstraint;
- (NSLayoutConstraint)targetViewTopConstraint;
- (NSLayoutConstraint)widthConstraint;
- (SLReplicatorView)initWithFrame:(CGRect)a3 targetView:(id)a4;
- (UIView)targetView;
- (double)replicationPaddingX;
- (int64_t)instanceCount;
- (void)_updateReplicatorLayer;
- (void)setHeightConstraint:(id)a3;
- (void)setInstanceCount:(int64_t)a3;
- (void)setReplicationPaddingX:(double)a3;
- (void)setTargetView:(id)a3;
- (void)setTargetViewLeadingConstraint:(id)a3;
- (void)setTargetViewTopConstraint:(id)a3;
- (void)setWidthConstraint:(id)a3;
- (void)updateConstraints;
- (void)updateInstanceCount:(unint64_t)a3 replicationPaddingX:(double)a4;
@end

@implementation SLReplicatorView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (SLReplicatorView)initWithFrame:(CGRect)a3 targetView:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SLReplicatorView;
  v10 = -[SLReplicatorView initWithFrame:](&v14, sel_initWithFrame_, x, y, width, height);
  v11 = v10;
  if (v10)
  {
    [(SLReplicatorView *)v10 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(SLReplicatorView *)v11 setTargetView:v9];
    [(SLReplicatorView *)v11 setInstanceCount:1];
    [(SLReplicatorView *)v11 setReplicationPaddingX:0.0];
    v12 = [(SLReplicatorView *)v11 targetView];
    [(SLReplicatorView *)v11 addSubview:v12];

    [(SLReplicatorView *)v11 _updateReplicatorLayer];
  }

  return v11;
}

- (void)updateInstanceCount:(unint64_t)a3 replicationPaddingX:(double)a4
{
  int64_t v7 = [(SLReplicatorView *)self instanceCount];
  if (v7 != a3) {
    [(SLReplicatorView *)self setInstanceCount:a3];
  }
  [(SLReplicatorView *)self replicationPaddingX];
  if (!SL_CGFloatApproximatelyEqualToFloat(v8, a4))
  {
    [(SLReplicatorView *)self setReplicationPaddingX:a4];
    goto LABEL_7;
  }
  if (v7 != a3)
  {
LABEL_7:
    [(SLReplicatorView *)self setNeedsUpdateConstraints];
    [(SLReplicatorView *)self layoutIfNeeded];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __60__SLReplicatorView_updateInstanceCount_replicationPaddingX___block_invoke;
    block[3] = &unk_1E58A8720;
    block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __60__SLReplicatorView_updateInstanceCount_replicationPaddingX___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateReplicatorLayer];
}

- (void)_updateReplicatorLayer
{
  v3 = [(SLReplicatorView *)self layer];
  objc_msgSend(v3, "setInstanceCount:", -[SLReplicatorView instanceCount](self, "instanceCount"));
  v4 = [(SLReplicatorView *)self targetView];
  [v4 frame];
  double v6 = v5;
  [(SLReplicatorView *)self replicationPaddingX];
  CGFloat v8 = v7 + v6;

  CATransform3DMakeTranslation(&v10, v8, 0.0, 0.0);
  CATransform3D v9 = v10;
  [v3 setInstanceTransform:&v9];
  [(SLReplicatorView *)self setNeedsLayout];
  [(SLReplicatorView *)self layoutIfNeeded];
}

- (void)updateConstraints
{
  v45.receiver = self;
  v45.super_class = (Class)SLReplicatorView;
  [(SLReplicatorView *)&v45 updateConstraints];
  v3 = [MEMORY[0x1E4F1CA48] array];
  v4 = [MEMORY[0x1E4F1CA48] array];
  [(SLReplicatorView *)self replicationPaddingX];
  double v6 = v5 * (double)([(SLReplicatorView *)self instanceCount] - 1);
  uint64_t v7 = [(SLReplicatorView *)self widthConstraint];
  if (v7)
  {
    CGFloat v8 = (void *)v7;
    CATransform3D v9 = [(SLReplicatorView *)self widthConstraint];
    CATransform3D v10 = [v9 firstAnchor];
    v11 = [(SLReplicatorView *)self targetView];
    v12 = [v11 widthAnchor];
    if (v10 == v12)
    {
      v13 = [(SLReplicatorView *)self widthConstraint];
      [v13 multiplier];
      if (v14 == (double)[(SLReplicatorView *)self instanceCount])
      {
        v42 = [(SLReplicatorView *)self widthConstraint];
        [v42 constant];
        double v44 = v43;

        if (v44 == v6) {
          goto LABEL_9;
        }
        goto LABEL_6;
      }

      v12 = v10;
    }
  }
LABEL_6:
  v15 = [(SLReplicatorView *)self widthConstraint];

  if (v15)
  {
    v16 = [(SLReplicatorView *)self widthConstraint];
    [v4 addObject:v16];
  }
  v17 = [(SLReplicatorView *)self widthAnchor];
  v18 = [(SLReplicatorView *)self targetView];
  v19 = [v18 widthAnchor];
  v20 = objc_msgSend(v17, "constraintEqualToAnchor:multiplier:constant:", v19, (double)-[SLReplicatorView instanceCount](self, "instanceCount"), v6);
  [(SLReplicatorView *)self setWidthConstraint:v20];

  v21 = [(SLReplicatorView *)self widthConstraint];
  [v3 addObject:v21];

LABEL_9:
  v22 = [(SLReplicatorView *)self heightConstraint];

  if (!v22)
  {
    v25 = [(SLReplicatorView *)self heightAnchor];
    v26 = [(SLReplicatorView *)self targetView];
    v27 = [v26 heightAnchor];
    v28 = [v25 constraintEqualToAnchor:v27];
    [(SLReplicatorView *)self setHeightConstraint:v28];

    goto LABEL_13;
  }
  v23 = [(SLReplicatorView *)self heightConstraint];
  char v24 = [v23 isActive];

  if ((v24 & 1) == 0)
  {
LABEL_13:
    v29 = [(SLReplicatorView *)self heightConstraint];
    [v3 addObject:v29];
  }
  v30 = [(SLReplicatorView *)self targetViewLeadingConstraint];

  if (!v30)
  {
    v31 = [(SLReplicatorView *)self targetView];
    v32 = [v31 leadingAnchor];
    v33 = [(SLReplicatorView *)self leadingAnchor];
    v34 = [v32 constraintEqualToAnchor:v33];
    [(SLReplicatorView *)self setTargetViewLeadingConstraint:v34];

    v35 = [(SLReplicatorView *)self targetViewLeadingConstraint];
    [v3 addObject:v35];
  }
  v36 = [(SLReplicatorView *)self targetViewTopConstraint];

  if (!v36)
  {
    v37 = [(SLReplicatorView *)self targetView];
    v38 = [v37 topAnchor];
    v39 = [(SLReplicatorView *)self topAnchor];
    v40 = [v38 constraintEqualToAnchor:v39];
    [(SLReplicatorView *)self setTargetViewTopConstraint:v40];

    v41 = [(SLReplicatorView *)self targetViewTopConstraint];
    [v3 addObject:v41];
  }
  if ([v4 count]) {
    [MEMORY[0x1E4F28DC8] deactivateConstraints:v4];
  }
  if ([v3 count]) {
    [MEMORY[0x1E4F28DC8] activateConstraints:v3];
  }
}

- (UIView)targetView
{
  return self->_targetView;
}

- (void)setTargetView:(id)a3
{
}

- (int64_t)instanceCount
{
  return self->_instanceCount;
}

- (void)setInstanceCount:(int64_t)a3
{
  self->_instanceCount = a3;
}

- (double)replicationPaddingX
{
  return self->_replicationPaddingX;
}

- (void)setReplicationPaddingX:(double)a3
{
  self->_replicationPaddingX = a3;
}

- (NSLayoutConstraint)widthConstraint
{
  return self->_widthConstraint;
}

- (void)setWidthConstraint:(id)a3
{
}

- (NSLayoutConstraint)heightConstraint
{
  return self->_heightConstraint;
}

- (void)setHeightConstraint:(id)a3
{
}

- (NSLayoutConstraint)targetViewLeadingConstraint
{
  return self->_targetViewLeadingConstraint;
}

- (void)setTargetViewLeadingConstraint:(id)a3
{
}

- (NSLayoutConstraint)targetViewTopConstraint
{
  return self->_targetViewTopConstraint;
}

- (void)setTargetViewTopConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetViewTopConstraint, 0);
  objc_storeStrong((id *)&self->_targetViewLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_heightConstraint, 0);
  objc_storeStrong((id *)&self->_widthConstraint, 0);
  objc_storeStrong((id *)&self->_targetView, 0);
}

@end