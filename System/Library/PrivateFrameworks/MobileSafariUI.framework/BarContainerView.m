@interface BarContainerView
- (BarContainerView)initWithFrame:(CGRect)a3;
- (NSSet)barViews;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)didMoveToSuperview;
- (void)registerBarView:(id)a3;
- (void)unregisterBarView:(id)a3;
@end

@implementation BarContainerView

- (void)registerBarView:(id)a3
{
}

- (BarContainerView)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)BarContainerView;
  v3 = -[BarContainerView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = [MEMORY[0x1E4F1CA80] set];
    barViews = v3->_barViews;
    v3->_barViews = (NSMutableSet *)v4;

    v6 = v3;
  }

  return v3;
}

- (void)didMoveToSuperview
{
  v2.receiver = self;
  v2.super_class = (Class)BarContainerView;
  [(BarContainerView *)&v2 didMoveToSuperview];
}

- (void)unregisterBarView:(id)a3
{
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  objc_super v8 = self->_barViews;
  uint64_t v9 = [(NSMutableSet *)v8 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v31;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v31 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        [(BarContainerView *)self bounds];
        CGFloat v15 = v14;
        CGFloat v17 = v16;
        CGFloat v19 = v18;
        CGFloat v21 = v20;
        [v13 bounds];
        -[BarContainerView convertRect:fromView:](self, "convertRect:fromView:", v13);
        v39.origin.double x = v22;
        v39.origin.double y = v23;
        v39.size.width = v24;
        v39.size.height = v25;
        v37.origin.double x = v15;
        v37.origin.double y = v17;
        v37.size.width = v19;
        v37.size.height = v21;
        CGRect v38 = CGRectIntersection(v37, v39);
        if (!CGRectIsEmpty(v38))
        {
          -[BarContainerView convertPoint:toView:](self, "convertPoint:toView:", v13, x, y);
          uint64_t v26 = objc_msgSend(v13, "hitTest:withEvent:", v7);
          if (v26)
          {
            v27 = (void *)v26;

            goto LABEL_12;
          }
        }
      }
      uint64_t v10 = [(NSMutableSet *)v8 countByEnumeratingWithState:&v30 objects:v34 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

  v29.receiver = self;
  v29.super_class = (Class)BarContainerView;
  v27 = -[BarContainerView hitTest:withEvent:](&v29, sel_hitTest_withEvent_, v7, x, y);
LABEL_12:

  return v27;
}

- (NSSet)barViews
{
  return &self->_barViews->super;
}

- (void).cxx_destruct
{
}

@end