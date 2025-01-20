@interface NTKContainerView
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (NTKContainerViewLayoutDelegate)layoutDelegate;
- (void)layoutSubviews;
- (void)setLayoutDelegate:(id)a3;
@end

@implementation NTKContainerView

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)NTKContainerView;
  [(NTKContainerView *)&v4 layoutSubviews];
  if (*(unsigned char *)&self->_delegateRespondsTo)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_layoutDelegate);
    [WeakRetained layoutContainerView:self];
  }
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  id v7 = a4;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  v8 = [(NTKContainerView *)self subviews];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __42__NTKContainerView_pointInside_withEvent___block_invoke;
  v11[3] = &unk_1E62C68B0;
  v11[4] = self;
  CGFloat v14 = x;
  CGFloat v15 = y;
  id v9 = v7;
  id v12 = v9;
  v13 = &v16;
  [v8 enumerateObjectsUsingBlock:v11];

  LOBYTE(v8) = *((unsigned char *)v17 + 24);
  _Block_object_dispose(&v16, 8);

  return (char)v8;
}

void __42__NTKContainerView_pointInside_withEvent___block_invoke(double *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  v6 = (void *)*((void *)a1 + 4);
  double v7 = a1[7];
  double v8 = a1[8];
  id v9 = a2;
  objc_msgSend(v6, "convertPoint:toView:", v9, v7, v8);
  LODWORD(v6) = objc_msgSend(v9, "pointInside:withEvent:", *((void *)a1 + 5));

  if (v6)
  {
    *(unsigned char *)(*(void *)(*((void *)a1 + 6) + 8) + 24) = 1;
    *a4 = 1;
  }
}

- (void)setLayoutDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_layoutDelegate);

  if (WeakRetained != obj)
  {
    id v5 = objc_storeWeak((id *)&self->_layoutDelegate, obj);
    *(unsigned char *)&self->_delegateRespondsTo = *(unsigned char *)&self->_delegateRespondsTo & 0xFE | objc_opt_respondsToSelector() & 1;
  }
}

- (NTKContainerViewLayoutDelegate)layoutDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_layoutDelegate);

  return (NTKContainerViewLayoutDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end