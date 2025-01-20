@interface PXUIGenericViewTile
- (PXViewSpec)_spec;
- (UIView)view;
- (void)_setSpec:(id)a3;
- (void)becomeReusable;
- (void)didApplyGeometry:(PXTileGeometry *)a3 withUserData:(id)a4;
- (void)prepareForReuse;
@end

@implementation PXUIGenericViewTile

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__spec, 0);
  objc_storeStrong((id *)&self->_view, 0);
}

- (PXViewSpec)_spec
{
  return self->__spec;
}

- (void)prepareForReuse
{
}

- (void)becomeReusable
{
}

- (void)didApplyGeometry:(PXTileGeometry *)a3 withUserData:(id)a4
{
  objc_msgSend(a4, "viewSpec", a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [(PXUIGenericViewTile *)self _setSpec:v5];
}

- (UIView)view
{
  view = self->_view;
  if (!view)
  {
    v4 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    id v5 = self->_view;
    self->_view = v4;

    [(UIView *)self->_view setUserInteractionEnabled:0];
    [(UIView *)self->_view px_setSpec:self->__spec];
    view = self->_view;
  }
  return view;
}

- (void)_setSpec:(id)a3
{
  id v5 = (PXViewSpec *)a3;
  if (self->__spec != v5)
  {
    objc_storeStrong((id *)&self->__spec, a3);
    [(UIView *)self->_view px_setSpec:v5];
  }
}

@end