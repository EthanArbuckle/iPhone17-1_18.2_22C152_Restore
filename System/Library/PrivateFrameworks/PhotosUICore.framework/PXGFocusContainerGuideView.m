@interface PXGFocusContainerGuideView
- (BOOL)_isEligibleForFocusInteraction;
- (CGRect)clippingRect;
- (PXGFocusContainerGuideView)initWithFrame:(CGRect)a3;
- (PXGFocusContainerGuideViewConfiguration)userData;
- (void)didMoveToSuperview;
- (void)setClippingRect:(CGRect)a3;
- (void)setUserData:(id)a3;
- (void)willMoveToSuperview:(id)a3;
@end

@implementation PXGFocusContainerGuideView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userData, 0);
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_focusGuide, 0);
}

- (void)setUserData:(id)a3
{
}

- (PXGFocusContainerGuideViewConfiguration)userData
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

- (void)didMoveToSuperview
{
  v3 = [(PXGFocusContainerGuideView *)self superview];

  if (v3)
  {
    v4 = [(PXGFocusContainerGuideView *)self superview];
    [v4 addLayoutGuide:self->_focusGuide];

    [MEMORY[0x1E4F28DC8] activateConstraints:self->_constraints];
  }
  v5.receiver = self;
  v5.super_class = (Class)PXGFocusContainerGuideView;
  [(PXGFocusContainerGuideView *)&v5 didMoveToSuperview];
}

- (void)willMoveToSuperview:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PXGFocusContainerGuideView;
  [(PXGFocusContainerGuideView *)&v5 willMoveToSuperview:a3];
  [MEMORY[0x1E4F28DC8] deactivateConstraints:self->_constraints];
  v4 = [(PXGFocusContainerGuideView *)self superview];
  [v4 removeLayoutGuide:self->_focusGuide];
}

- (BOOL)_isEligibleForFocusInteraction
{
  return 0;
}

- (PXGFocusContainerGuideView)initWithFrame:(CGRect)a3
{
  v24[4] = *MEMORY[0x1E4F143B8];
  v23.receiver = self;
  v23.super_class = (Class)PXGFocusContainerGuideView;
  v3 = -[PXGFocusContainerGuideView initWithFrame:](&v23, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UIFocusContainerGuide *)objc_alloc_init(MEMORY[0x1E4FB1778]);
    focusGuide = v3->_focusGuide;
    v3->_focusGuide = v4;

    v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    [(UIFocusContainerGuide *)v3->_focusGuide setIdentifier:v7];

    v22 = [(UIFocusContainerGuide *)v3->_focusGuide leadingAnchor];
    v21 = [(PXGFocusContainerGuideView *)v3 leadingAnchor];
    v20 = [v22 constraintEqualToAnchor:v21];
    v24[0] = v20;
    v8 = [(UIFocusContainerGuide *)v3->_focusGuide widthAnchor];
    v9 = [(PXGFocusContainerGuideView *)v3 widthAnchor];
    v10 = [v8 constraintEqualToAnchor:v9];
    v24[1] = v10;
    v11 = [(UIFocusContainerGuide *)v3->_focusGuide topAnchor];
    v12 = [(PXGFocusContainerGuideView *)v3 topAnchor];
    v13 = [v11 constraintEqualToAnchor:v12];
    v24[2] = v13;
    v14 = [(UIFocusContainerGuide *)v3->_focusGuide heightAnchor];
    v15 = [(PXGFocusContainerGuideView *)v3 heightAnchor];
    v16 = [v14 constraintEqualToAnchor:v15];
    v24[3] = v16;
    uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:4];
    constraints = v3->_constraints;
    v3->_constraints = (NSArray *)v17;
  }
  return v3;
}

@end