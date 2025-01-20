@interface _UIConstraintBasedLayoutHostingView
+ (BOOL)requiresConstraintBasedLayout;
- ($F24F406B2B787EFB06265DBA3D28CBD5)_baselineOffsetsAtSize:(CGSize)a3;
- (BOOL)_layoutHeightDependsOnWidth;
- (CGSize)_layoutSizeThatFits:(CGSize)a3 fixedAxes:(unint64_t)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
- (UIEdgeInsets)alignmentRectInsets;
- (UIView)hostedView;
- (_UIConstraintBasedLayoutHostingView)initWithHostedView:(id)a3;
- (void)_intrinsicContentSizeInvalidatedForChildView:(id)a3;
- (void)_scheduleUpdateConstraintsPassAsEngineHostNeedingLayout:(BOOL)a3;
- (void)_setFrameWithAlignmentRect:(CGRect)a3;
- (void)constraintsDidChangeInEngine:(id)a3;
- (void)setHostedView:(id)a3;
- (void)updateConstraints;
- (void)willRemoveSubview:(id)a3;
@end

@implementation _UIConstraintBasedLayoutHostingView

- (void)willRemoveSubview:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_UIConstraintBasedLayoutHostingView;
  -[UIView willRemoveSubview:](&v5, sel_willRemoveSubview_);
  if (self->_hostedView == a3) {
    self->_hostedView = 0;
  }
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)_baselineOffsetsAtSize:(CGSize)a3
{
  -[UIView _baselineOffsetsAtSize:](self->_hostedView, "_baselineOffsetsAtSize:", a3.width, a3.height);
  result.var1 = v4;
  result.var0 = v3;
  return result;
}

+ (BOOL)requiresConstraintBasedLayout
{
  return 0;
}

- (_UIConstraintBasedLayoutHostingView)initWithHostedView:(id)a3
{
  double v5 = *MEMORY[0x1E4F1DAD8];
  double v6 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  [a3 size];
  v12.receiver = self;
  v12.super_class = (Class)_UIConstraintBasedLayoutHostingView;
  v9 = -[UIView initWithFrame:](&v12, sel_initWithFrame_, v5, v6, v7, v8);
  v10 = v9;
  if (v9)
  {
    [(UIView *)v9 _setHostsLayoutEngine:1];
    [(_UIConstraintBasedLayoutHostingView *)v10 setHostedView:a3];
  }
  return v10;
}

- (UIView)hostedView
{
  return self->_hostedView;
}

- (void)setHostedView:(id)a3
{
  hostedView = self->_hostedView;
  if (hostedView != a3)
  {
    if (hostedView) {
      [(UIView *)hostedView removeFromSuperview];
    }
    self->_hostedView = (UIView *)a3;
    self->_hasAddedConstraints = 0;
    if (a3)
    {
      [(UIView *)self bounds];
      objc_msgSend(a3, "setFrame:");
      [a3 setAutoresizingMask:18];
      [(UIView *)self addSubview:a3];
    }
  }
}

- (void)_intrinsicContentSizeInvalidatedForChildView:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_UIConstraintBasedLayoutHostingView;
  -[UIView _intrinsicContentSizeInvalidatedForChildView:](&v5, sel__intrinsicContentSizeInvalidatedForChildView_);
  if (self->_hostedView == a3 && (*((void *)&self->super._viewFlags + 1) & 0x1000) == 0) {
    [(_UIConstraintBasedLayoutHostingView *)self _layoutMetricsInvalidatedForHostedView];
  }
}

- (void)updateConstraints
{
  v5[4] = *MEMORY[0x1E4F143B8];
  v4.receiver = self;
  v4.super_class = (Class)_UIConstraintBasedLayoutHostingView;
  [(UIView *)&v4 updateConstraints];
  if (!self->_hasAddedConstraints)
  {
    if ([(UIView *)self->_hostedView _wantsConstraintBasedLayout])
    {
      self->_hasAddedConstraints = 1;
      double v3 = (void *)MEMORY[0x1E4F5B268];
      v5[0] = [(NSLayoutYAxisAnchor *)[(UIView *)self topAnchor] constraintEqualToAnchor:[(UIView *)self->_hostedView topAnchor]];
      v5[1] = [(NSLayoutYAxisAnchor *)[(UIView *)self bottomAnchor] constraintEqualToAnchor:[(UIView *)self->_hostedView bottomAnchor]];
      v5[2] = [(NSLayoutXAxisAnchor *)[(UIView *)self leadingAnchor] constraintEqualToAnchor:[(UIView *)self->_hostedView leadingAnchor]];
      v5[3] = [(NSLayoutXAxisAnchor *)[(UIView *)self trailingAnchor] constraintEqualToAnchor:[(UIView *)self->_hostedView trailingAnchor]];
      objc_msgSend(v3, "activateConstraints:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v5, 4));
    }
  }
}

- (void)_setFrameWithAlignmentRect:(CGRect)a3
{
  v3.receiver = self;
  v3.super_class = (Class)_UIConstraintBasedLayoutHostingView;
  -[UIView _setFrameWithAlignmentRect:](&v3, sel__setFrameWithAlignmentRect_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)constraintsDidChangeInEngine:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_UIConstraintBasedLayoutHostingView;
  [(UIView *)&v4 constraintsDidChangeInEngine:a3];
  if ((*((void *)&self->super._viewFlags + 1) & 4) == 0) {
    [(_UIConstraintBasedLayoutHostingView *)self _layoutMetricsInvalidatedForHostedView];
  }
}

- (void)_scheduleUpdateConstraintsPassAsEngineHostNeedingLayout:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)_UIConstraintBasedLayoutHostingView;
  [(UIView *)&v5 _scheduleUpdateConstraintsPassAsEngineHostNeedingLayout:sel__scheduleUpdateConstraintsPassAsEngineHostNeedingLayout_];
  if (v3 && (*((void *)&self->super._viewFlags + 1) & 0x1000) == 0) {
    [(_UIConstraintBasedLayoutHostingView *)self _layoutMetricsInvalidatedForHostedView];
  }
}

- (UIEdgeInsets)alignmentRectInsets
{
  [(UIView *)self->_hostedView alignmentRectInsets];
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (BOOL)_layoutHeightDependsOnWidth
{
  return [(UIView *)self->_hostedView _layoutHeightDependsOnWidth];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = 1.79769313e308;
  if (a3.width == 0.0) {
    double width = 1.79769313e308;
  }
  else {
    double width = a3.width;
  }
  if (a3.height != 0.0) {
    double height = a3.height;
  }
  -[UIView alignmentRectForFrame:](self, "alignmentRectForFrame:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), width, height);
  double v7 = v6;
  double v9 = v8;
  -[_UIConstraintBasedLayoutHostingView _layoutSizeThatFits:fixedAxes:](self, "_layoutSizeThatFits:fixedAxes:", 0, v10, v11);
  -[UIView frameForAlignmentRect:](self, "frameForAlignmentRect:", v7, v9, v12, v13);
  double v15 = v14;
  double v17 = v16;
  result.double height = v17;
  result.double width = v15;
  return result;
}

- (CGSize)_layoutSizeThatFits:(CGSize)a3 fixedAxes:(unint64_t)a4
{
  double height = a3.height;
  double width = a3.width;
  if ((*((void *)&self->super._viewFlags + 1) & 4) == 0) {
    [(UIView *)self updateConstraintsIfNeeded];
  }
  if ([(UIView *)self->_hostedView _wantsConstraintBasedLayout])
  {
    double v8 = fmax(fmin(width, 50000.0), 0.0);
    double v9 = fmin(height, 50000.0);
    double v10 = (void *)[MEMORY[0x1E4F1CA48] array];
    if (a4)
    {
      double v13 = (void *)[MEMORY[0x1E4F5B268] constraintWithItem:self attribute:7 relatedBy:0 constant:v8];
      LODWORD(v20) = 1144586240;
      [v13 setPriority:v20];
      double v15 = @"_UI-fixedSizeH";
    }
    else
    {
      if (v8 > 0.0)
      {
        double v11 = (void *)[MEMORY[0x1E4F5B268] constraintWithItem:self attribute:7 relatedBy:-1 constant:v8];
        LODWORD(v12) = 1144586240;
        [v11 setPriority:v12];
        [v11 setIdentifier:@"_UI-fittingSizeHLimit"];
        [v10 addObject:v11];
      }
      double v13 = (void *)[MEMORY[0x1E4F5B268] constraintWithItem:self attribute:7 relatedBy:0 constant:0.0];
      LODWORD(v14) = 1112014848;
      [v13 setPriority:v14];
      double v15 = @"_UI-fittingSizeHCompression";
    }
    [v13 setIdentifier:v15];
    double v21 = fmax(v9, 0.0);
    [v10 addObject:v13];
    if ((a4 & 2) != 0)
    {
      v25 = (void *)[MEMORY[0x1E4F5B268] constraintWithItem:self attribute:8 relatedBy:0 constant:v21];
      LODWORD(v28) = 1144586240;
      [v25 setPriority:v28];
      v27 = @"_UI-fixedSizeV";
    }
    else
    {
      if (v21 > 0.0)
      {
        v22 = (void *)[MEMORY[0x1E4F5B268] constraintWithItem:self attribute:8 relatedBy:-1 constant:v21];
        LODWORD(v23) = 1144586240;
        [v22 setPriority:v23];
        [v22 setIdentifier:@"_UI-fittingSizeVLimit"];
        [v10 addObject:v22];
      }
      v24 = (void *)[MEMORY[0x1E4F5B268] constraintWithItem:self attribute:8 relatedBy:0 constant:0.0];
      v25 = v24;
      LODWORD(v26) = 1112014848;
      if (v21 == 0.0) {
        *(float *)&double v26 = 740.0;
      }
      [v24 setPriority:v26];
      v27 = @"_UI-fittingSizeVCompression";
    }
    [v25 setIdentifier:v27];
    [v10 addObject:v25];
    uint64_t v32 = 0;
    v33 = (double *)&v32;
    uint64_t v34 = 0x3010000000;
    uint64_t v36 = 0;
    uint64_t v37 = 0;
    v35 = &unk_186D7DBA7;
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __69___UIConstraintBasedLayoutHostingView__layoutSizeThatFits_fixedAxes___block_invoke;
    v31[3] = &unk_1E52FB468;
    v31[4] = self;
    v31[5] = &v32;
    -[UIView _measureViewWithSize:temporaryConstraints:suspendingSystemConstraints:withOptimizedEngineBlock:](self, "_measureViewWithSize:temporaryConstraints:suspendingSystemConstraints:withOptimizedEngineBlock:", v10, 1, v31, v8, v21);
    double v17 = v33[4];
    double v19 = v33[5];
    _Block_object_dispose(&v32, 8);
  }
  else
  {
    *((void *)&self->super._viewFlags + 1) &= ~0x1000uLL;
    -[UIView _layoutSizeThatFits:fixedAxes:](self->_hostedView, "_layoutSizeThatFits:fixedAxes:", a4, width, height);
    double v17 = v16;
    double v19 = v18;
  }
  double v29 = v17;
  double v30 = v19;
  result.double height = v30;
  result.double width = v29;
  return result;
}

@end