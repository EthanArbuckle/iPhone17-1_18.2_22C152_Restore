@interface PXGFocusGuideView
- (BOOL)_isEligibleForFocusInteraction;
- (CGRect)clippingRect;
- (PXGFocusGuideView)initWithFrame:(CGRect)a3;
- (PXGFocusGuideViewConfiguration)userData;
- (void)didMoveToSuperview;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setClippingRect:(CGRect)a3;
- (void)setUserData:(id)a3;
- (void)willMoveToSuperview:(id)a3;
@end

@implementation PXGFocusGuideView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userData, 0);
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_focusGuide, 0);
}

- (PXGFocusGuideViewConfiguration)userData
{
  return self->_userData;
}

- (void)setClippingRect:(CGRect)a3
{
  self->_clippingRect = a3;
}

- (CGRect)clippingRect
{
  double x = self->_clippingRect.origin.x;
  double y = self->_clippingRect.origin.y;
  double width = self->_clippingRect.size.width;
  double height = self->_clippingRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)prepareForReuse
{
}

- (void)setUserData:(id)a3
{
  v8 = (PXGFocusGuideViewConfiguration *)a3;
  v5 = self->_userData;
  if (v5 == v8)
  {
  }
  else
  {
    v6 = v5;
    BOOL v7 = [(PXGFocusGuideViewConfiguration *)v5 isEqual:v8];

    if (!v7)
    {
      objc_storeStrong((id *)&self->_userData, a3);
      [(PXGFocusGuideView *)self setNeedsLayout];
    }
  }
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)PXGFocusGuideView;
  [(PXGFocusGuideView *)&v5 layoutSubviews];
  v3 = [(PXGFocusGuideView *)self userData];
  v4 = [v3 preferredFocusEnvironments];
  [(UIFocusGuide *)self->_focusGuide setPreferredFocusEnvironments:v4];
}

- (void)didMoveToSuperview
{
  v3 = [(PXGFocusGuideView *)self superview];

  if (v3)
  {
    v4 = [(PXGFocusGuideView *)self superview];
    [v4 addLayoutGuide:self->_focusGuide];

    [MEMORY[0x1E4F28DC8] activateConstraints:self->_constraints];
  }
  v5.receiver = self;
  v5.super_class = (Class)PXGFocusGuideView;
  [(PXGFocusGuideView *)&v5 didMoveToSuperview];
}

- (void)willMoveToSuperview:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PXGFocusGuideView;
  [(PXGFocusGuideView *)&v5 willMoveToSuperview:a3];
  [MEMORY[0x1E4F28DC8] deactivateConstraints:self->_constraints];
  v4 = [(PXGFocusGuideView *)self superview];
  [v4 removeLayoutGuide:self->_focusGuide];
}

- (BOOL)_isEligibleForFocusInteraction
{
  return 0;
}

- (PXGFocusGuideView)initWithFrame:(CGRect)a3
{
  v24[4] = *MEMORY[0x1E4F143B8];
  v23.receiver = self;
  v23.super_class = (Class)PXGFocusGuideView;
  v3 = -[PXGFocusGuideView initWithFrame:](&v23, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UIFocusGuide *)objc_alloc_init(MEMORY[0x1E4FB1780]);
    focusGuide = v3->_focusGuide;
    v3->_focusGuide = v4;

    v6 = (objc_class *)objc_opt_class();
    BOOL v7 = NSStringFromClass(v6);
    [(UIFocusGuide *)v3->_focusGuide setIdentifier:v7];

    v22 = [(UIFocusGuide *)v3->_focusGuide leadingAnchor];
    v21 = [(PXGFocusGuideView *)v3 leadingAnchor];
    v20 = [v22 constraintEqualToAnchor:v21];
    v24[0] = v20;
    v8 = [(UIFocusGuide *)v3->_focusGuide widthAnchor];
    v9 = [(PXGFocusGuideView *)v3 widthAnchor];
    v10 = [v8 constraintEqualToAnchor:v9];
    v24[1] = v10;
    v11 = [(UIFocusGuide *)v3->_focusGuide topAnchor];
    v12 = [(PXGFocusGuideView *)v3 topAnchor];
    v13 = [v11 constraintEqualToAnchor:v12];
    v24[2] = v13;
    v14 = [(UIFocusGuide *)v3->_focusGuide heightAnchor];
    v15 = [(PXGFocusGuideView *)v3 heightAnchor];
    v16 = [v14 constraintEqualToAnchor:v15];
    v24[3] = v16;
    uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:4];
    constraints = v3->_constraints;
    v3->_constraints = (NSArray *)v17;
  }
  return v3;
}

@end