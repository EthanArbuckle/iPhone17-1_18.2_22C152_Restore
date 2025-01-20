@interface _UITextSelectionRangeAdjustmentContainerView
- (BOOL)areSelectionGrabbersConcreteImpl;
- (BOOL)areSelectionGrabbersHidden;
- (BOOL)isVertical;
- (BOOL)portalsLollipopDotsToContainerWindow;
- (CGRect)endEdge;
- (CGRect)startEdge;
- (NSArray)selectionGrabbers;
- (UITextSelectionHandleView)leadingLollipopView;
- (UITextSelectionHandleView)trailingLollipopView;
- (_UITextSelectionRangeAdjustmentContainerView)initWithFrame:(CGRect)a3;
- (double)shapeScale;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)textInputView;
- (void)_getBounds:(CGRect *)a3 position:(CGPoint *)a4 fromPreferredFrame:(CGRect)a5;
- (void)_setPortalsLollipopDotsToContainerWindow:(BOOL)a3;
- (void)layoutSubviews;
- (void)setEndEdge:(CGRect)a3;
- (void)setHidden:(BOOL)a3;
- (void)setPortalsLollipopDotsToContainerWindow:(BOOL)a3;
- (void)setSelectionGrabbers:(id)a3;
- (void)setSelectionGrabbersHidden:(BOOL)a3;
- (void)setShapeScale:(double)a3;
- (void)setStartEdge:(CGRect)a3;
- (void)setVertical:(BOOL)a3;
@end

@implementation _UITextSelectionRangeAdjustmentContainerView

- (_UITextSelectionRangeAdjustmentContainerView)initWithFrame:(CGRect)a3
{
  v26[2] = *MEMORY[0x1E4F143B8];
  v24.receiver = self;
  v24.super_class = (Class)_UITextSelectionRangeAdjustmentContainerView;
  v3 = -[UIView initWithFrame:](&v24, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_shapeScale = 1.0;
    v3->_selectionGrabbersAreConcreteImpl = 1;
    v5 = [_UITextSelectionLollipopView alloc];
    double v6 = *MEMORY[0x1E4F1DB28];
    double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    v10 = -[_UITextSelectionLollipopView initWithFrame:](v5, "initWithFrame:", *MEMORY[0x1E4F1DB28], v7, v8, v9);
    v26[0] = v10;
    v11 = -[_UITextSelectionLollipopView initWithFrame:]([_UITextSelectionLollipopView alloc], "initWithFrame:", v6, v7, v8, v9);
    v26[1] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:2];
    selectionGrabbers = v4->_selectionGrabbers;
    v4->_selectionGrabbers = (NSArray *)v12;

    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    v14 = v4->_selectionGrabbers;
    uint64_t v15 = [(NSArray *)v14 countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v21 != v17) {
            objc_enumerationMutation(v14);
          }
          -[UIView addSubview:](v4, "addSubview:", *(void *)(*((void *)&v20 + 1) + 8 * i), (void)v20);
        }
        uint64_t v16 = [(NSArray *)v14 countByEnumeratingWithState:&v20 objects:v25 count:16];
      }
      while (v16);
    }
  }
  return v4;
}

- (void)setSelectionGrabbersHidden:(BOOL)a3
{
  self->_selectionGrabbersHidden = a3;
  [(UIView *)self setNeedsLayout];
}

- (void)setSelectionGrabbers:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  objc_storeStrong((id *)&self->_selectionGrabbers, a3);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    while (2)
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          BOOL v11 = 0;
          goto LABEL_11;
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  BOOL v11 = 1;
LABEL_11:

  self->_selectionGrabbersAreConcreteImpl = v11;
}

- (void)setShapeScale:(double)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  self->_shapeScale = a3;
  if (self->_selectionGrabbersAreConcreteImpl)
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    v4 = self->_selectionGrabbers;
    uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v10;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v4);
          }
          objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v8++), "_setShapeScale:", a3, (void)v9);
        }
        while (v6 != v8);
        uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v6);
    }
  }
}

- (UITextSelectionHandleView)leadingLollipopView
{
  return (UITextSelectionHandleView *)[(NSArray *)self->_selectionGrabbers objectAtIndexedSubscript:0];
}

- (UITextSelectionHandleView)trailingLollipopView
{
  return (UITextSelectionHandleView *)[(NSArray *)self->_selectionGrabbers objectAtIndexedSubscript:1];
}

- (BOOL)areSelectionGrabbersConcreteImpl
{
  return self->_selectionGrabbersAreConcreteImpl;
}

- (id)textInputView
{
  v2 = [(UIView *)self nextResponder];
  v3 = [v2 textInputView];

  return v3;
}

- (void)setHidden:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)_UITextSelectionRangeAdjustmentContainerView;
  -[UIView setHidden:](&v5, sel_setHidden_);
  if (v3) {
    [(_UITextSelectionRangeAdjustmentContainerView *)self _setPortalsLollipopDotsToContainerWindow:0];
  }
}

- (void)_setPortalsLollipopDotsToContainerWindow:(BOOL)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (self->_selectionGrabbersAreConcreteImpl)
  {
    BOOL v3 = a3;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    v4 = self->_selectionGrabbers;
    uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v10;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v4);
          }
          objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v8++), "setPortalsDotToContainerWindow:", v3, (void)v9);
        }
        while (v6 != v8);
        uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v6);
    }
  }
}

- (void)_getBounds:(CGRect *)a3 position:(CGPoint *)a4 fromPreferredFrame:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  a3->origin = (CGPoint)*MEMORY[0x1E4F1DB28];
  a3->size.double width = a5.size.width;
  a3->size.double height = a5.size.height;
  long long v10 = [(UIView *)self layer];
  [v10 anchorPoint];
  double v12 = v11;
  double v14 = v13;

  a4->double x = x + width * v12;
  a4->double y = y + height * v14;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  return 0;
}

- (void)layoutSubviews
{
  v49.receiver = self;
  v49.super_class = (Class)_UITextSelectionRangeAdjustmentContainerView;
  [(UIView *)&v49 layoutSubviews];
  if (self->_selectionGrabbersHidden)
  {
    BOOL v3 = [(_UITextSelectionRangeAdjustmentContainerView *)self leadingLollipopView];
    [v3 setHidden:1];

LABEL_10:
    v27 = [(_UITextSelectionRangeAdjustmentContainerView *)self trailingLollipopView];
    [v27 setHidden:1];
    goto LABEL_15;
  }
  [(_UITextSelectionRangeAdjustmentContainerView *)self startEdge];
  CGFloat v4 = *MEMORY[0x1E4F1DB28];
  CGFloat v5 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  CGFloat v6 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  CGFloat v7 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  v52.origin.double x = *(CGFloat *)MEMORY[0x1E4F1DB28];
  v52.origin.double y = v5;
  v52.size.double width = v6;
  v52.size.double height = v7;
  BOOL v8 = CGRectEqualToRect(v50, v52);
  long long v9 = [(_UITextSelectionRangeAdjustmentContainerView *)self leadingLollipopView];
  long long v10 = v9;
  if (v8)
  {
    [v9 setHidden:1];
  }
  else
  {
    [v9 setHidden:0];

    if ([(_UITextSelectionRangeAdjustmentContainerView *)self isVertical]) {
      uint64_t v11 = 1;
    }
    else {
      uint64_t v11 = 2;
    }
    double v12 = [(_UITextSelectionRangeAdjustmentContainerView *)self leadingLollipopView];
    [v12 setDirection:v11];

    long long v47 = 0u;
    long long v48 = 0u;
    double v45 = 0.0;
    double v46 = 0.0;
    double v13 = [(_UITextSelectionRangeAdjustmentContainerView *)self leadingLollipopView];
    [(_UITextSelectionRangeAdjustmentContainerView *)self startEdge];
    objc_msgSend(v13, "preferredFrameForRect:");
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;
    double v21 = v20;

    -[_UITextSelectionRangeAdjustmentContainerView _getBounds:position:fromPreferredFrame:](self, "_getBounds:position:fromPreferredFrame:", &v47, &v45, v15, v17, v19, v21);
    long long v22 = v47;
    long long v23 = v48;
    objc_super v24 = [(_UITextSelectionRangeAdjustmentContainerView *)self leadingLollipopView];
    objc_msgSend(v24, "setBounds:", v22, v23);

    double v25 = v45;
    double v26 = v46;
    long long v10 = [(_UITextSelectionRangeAdjustmentContainerView *)self leadingLollipopView];
    objc_msgSend(v10, "setCenter:", v25, v26);
  }

  [(_UITextSelectionRangeAdjustmentContainerView *)self endEdge];
  v53.origin.double x = v4;
  v53.origin.double y = v5;
  v53.size.double width = v6;
  v53.size.double height = v7;
  if (CGRectEqualToRect(v51, v53)) {
    goto LABEL_10;
  }
  v28 = [(_UITextSelectionRangeAdjustmentContainerView *)self trailingLollipopView];
  [v28 setHidden:0];

  if ([(_UITextSelectionRangeAdjustmentContainerView *)self isVertical]) {
    uint64_t v29 = 4;
  }
  else {
    uint64_t v29 = 8;
  }
  v30 = [(_UITextSelectionRangeAdjustmentContainerView *)self trailingLollipopView];
  [v30 setDirection:v29];

  long long v47 = 0u;
  long long v48 = 0u;
  double v45 = 0.0;
  double v46 = 0.0;
  v31 = [(_UITextSelectionRangeAdjustmentContainerView *)self trailingLollipopView];
  [(_UITextSelectionRangeAdjustmentContainerView *)self endEdge];
  objc_msgSend(v31, "preferredFrameForRect:");
  double v33 = v32;
  double v35 = v34;
  double v37 = v36;
  double v39 = v38;

  -[_UITextSelectionRangeAdjustmentContainerView _getBounds:position:fromPreferredFrame:](self, "_getBounds:position:fromPreferredFrame:", &v47, &v45, v33, v35, v37, v39);
  long long v40 = v47;
  long long v41 = v48;
  v42 = [(_UITextSelectionRangeAdjustmentContainerView *)self trailingLollipopView];
  objc_msgSend(v42, "setBounds:", v40, v41);

  double v43 = v45;
  double v44 = v46;
  v27 = [(_UITextSelectionRangeAdjustmentContainerView *)self trailingLollipopView];
  objc_msgSend(v27, "setCenter:", v43, v44);
LABEL_15:
}

- (CGRect)startEdge
{
  double x = self->_startEdge.origin.x;
  double y = self->_startEdge.origin.y;
  double width = self->_startEdge.size.width;
  double height = self->_startEdge.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setStartEdge:(CGRect)a3
{
  self->_startEdge = a3;
}

- (CGRect)endEdge
{
  double x = self->_endEdge.origin.x;
  double y = self->_endEdge.origin.y;
  double width = self->_endEdge.size.width;
  double height = self->_endEdge.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setEndEdge:(CGRect)a3
{
  self->_endEdge = a3;
}

- (BOOL)isVertical
{
  return self->_vertical;
}

- (void)setVertical:(BOOL)a3
{
  self->_vertical = a3;
}

- (double)shapeScale
{
  return self->_shapeScale;
}

- (BOOL)portalsLollipopDotsToContainerWindow
{
  return self->_portalsLollipopDotsToContainerWindow;
}

- (void)setPortalsLollipopDotsToContainerWindow:(BOOL)a3
{
  self->_portalsLollipopDotsToContainerWindow = a3;
}

- (BOOL)areSelectionGrabbersHidden
{
  return self->_selectionGrabbersHidden;
}

- (NSArray)selectionGrabbers
{
  return self->_selectionGrabbers;
}

- (void).cxx_destruct
{
}

@end