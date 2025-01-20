@interface PKPassthroughView
- (BOOL)isHitTestEnabled;
- (BOOL)isPortalled;
- (PKPassthroughView)initWithFrame:(CGRect)a3;
- (PKPassthroughView)portal;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)dealloc;
- (void)setHitTestEnabled:(BOOL)a3;
- (void)setPortal:(id)a3;
@end

@implementation PKPassthroughView

- (PKPassthroughView)initWithFrame:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PKPassthroughView;
  result = -[PKPassthroughView initWithFrame:](&v4, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (result) {
    result->_hitTestEnabled = 1;
  }
  return result;
}

- (void)dealloc
{
  WeakRetained = objc_loadWeakRetained((id *)&self->_portal);
  if (WeakRetained) {
    --WeakRetained[52];
  }

  v4.receiver = self;
  v4.super_class = (Class)PKPassthroughView;
  [(PKPassthroughView *)&v4 dealloc];
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  if (self->_inHitTest || self->_portalTargetCount && !self->_inPortalHitTest)
  {
    v8 = 0;
    goto LABEL_17;
  }
  self->_inHitTest = 1;
  if (!self->_hitTestEnabled)
  {
LABEL_10:
    WeakRetained = objc_loadWeakRetained((id *)&self->_portal);
    if (WeakRetained)
    {
      [(PKPassthroughView *)self bounds];
      CGFloat v12 = v11;
      CGFloat v14 = v13;
      CGFloat v16 = v15;
      CGFloat v18 = v17;
      [WeakRetained bounds];
      v27.origin.double x = v19;
      v27.origin.double y = v20;
      v27.size.width = v21;
      v27.size.height = v22;
      v26.origin.double x = v12;
      v26.origin.double y = v14;
      v26.size.width = v16;
      v26.size.height = v18;
      if (CGRectEqualToRect(v26, v27))
      {
        WeakRetained[409] = 1;
        objc_msgSend(WeakRetained, "hitTest:withEvent:", v7, x, y);
        v8 = (unsigned char *)objc_claimAutoreleasedReturnValue();
        WeakRetained[409] = 0;
        if (v8 != WeakRetained)
        {
LABEL_15:

          goto LABEL_16;
        }
      }
    }
    v8 = 0;
    goto LABEL_15;
  }
  v24.receiver = self;
  v24.super_class = (Class)PKPassthroughView;
  -[PKPassthroughView hitTest:withEvent:](&v24, sel_hitTest_withEvent_, v7, x, y);
  v9 = (PKPassthroughView *)objc_claimAutoreleasedReturnValue();
  if (v9 == self)
  {

    goto LABEL_10;
  }
  v8 = v9;
  if (!v9) {
    goto LABEL_10;
  }
LABEL_16:
  self->_inHitTest = 0;
LABEL_17:

  return v8;
}

- (void)setPortal:(id)a3
{
  obj = a3;
  p_portal = &self->_portal;
  WeakRetained = objc_loadWeakRetained((id *)&self->_portal);
  v6 = WeakRetained;
  if (WeakRetained != obj)
  {
    if (WeakRetained) {
      --WeakRetained[52];
    }
    objc_storeWeak((id *)p_portal, obj);
    if (obj) {
      ++obj[52];
    }
  }
}

- (BOOL)isPortalled
{
  return self->_portalTargetCount != 0;
}

- (BOOL)isHitTestEnabled
{
  return self->_hitTestEnabled;
}

- (void)setHitTestEnabled:(BOOL)a3
{
  self->_hitTestEnabled = a3;
}

- (PKPassthroughView)portal
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_portal);

  return (PKPassthroughView *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end