@interface _UIDuoShadowView
- (_UIDuoShadowView)initWithFrame:(CGRect)a3;
- (void)setBounds:(CGRect)a3;
- (void)setFrame:(CGRect)a3;
- (void)setPrimaryShadow:(uint64_t)a1;
- (void)setSecondaryShadow:(uint64_t)a1;
@end

@implementation _UIDuoShadowView

- (_UIDuoShadowView)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)_UIDuoShadowView;
  v3 = -[UIView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = [(UIView *)v3 layer];
    [v5 setShadowPathIsBounds:1];

    v6 = [(UIView *)v4 layer];
    [v6 setPunchoutShadow:1];
  }
  return v4;
}

- (void)setFrame:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_UIDuoShadowView;
  -[UIView setFrame:](&v4, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(UIView *)self bounds];
  -[UIView setFrame:](self->_secondaryShadowView, "setFrame:");
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)_UIDuoShadowView;
  -[UIView setBounds:](&v8, sel_setBounds_);
  -[UIView setFrame:](self->_secondaryShadowView, "setFrame:", x, y, width, height);
}

- (void)setPrimaryShadow:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    id v7 = v4;
    objc_storeStrong((id *)(a1 + 416), a2);
    if (v7) {
      id v5 = v7;
    }
    else {
      id v5 = (id)objc_opt_new();
    }
    v6 = v5;
    [v5 applyToView:a1];

    id v4 = v7;
  }
}

- (void)setSecondaryShadow:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    objc_storeStrong((id *)(a1 + 424), a2);
    if (v4)
    {
      if (*(void *)(a1 + 408))
      {
        v7[0] = MEMORY[0x1E4F143A8];
        v7[1] = 3221225472;
        v7[2] = __39___UIDuoShadowView_setSecondaryShadow___block_invoke;
        v7[3] = &unk_1E52D9F70;
        v7[4] = a1;
        +[UIView performWithoutAnimation:v7];
      }
      id v5 = v4;
    }
    else
    {
      id v5 = (id)objc_opt_new();
    }
    v6 = v5;
    [v5 applyToView:*(void *)(a1 + 408)];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryShadow, 0);
  objc_storeStrong((id *)&self->_primaryShadow, 0);
  objc_storeStrong((id *)&self->_secondaryShadowView, 0);
}

@end