@interface PXUILabelTile
- (NSString)text;
- (UIView)view;
- (void)_setSpec:(id)a3;
- (void)becomeReusable;
- (void)didApplyGeometry:(PXTileGeometry *)a3 withUserData:(id)a4;
- (void)prepareForReuse;
- (void)setText:(id)a3;
@end

@implementation PXUILabelTile

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_spec, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

- (NSString)text
{
  return self->_text;
}

- (void)_setSpec:(id)a3
{
  v5 = (PXLabelSpec *)a3;
  if (self->_spec != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_spec, a3);
    [(PXUILabel *)self->_label setSpec:self->_spec];
    v5 = v6;
  }
}

- (void)setText:(id)a3
{
  if (self->_text != a3)
  {
    v4 = (NSString *)[a3 copy];
    text = self->_text;
    self->_text = v4;

    label = self->_label;
    v7 = self->_text;
    [(PXUILabel *)label setText:v7];
  }
}

- (void)prepareForReuse
{
}

- (void)becomeReusable
{
  [(PXUILabelTile *)self setText:0];
  label = self->_label;
  [(PXUILabel *)label setHidden:1];
}

- (void)didApplyGeometry:(PXTileGeometry *)a3 withUserData:(id)a4
{
  objc_msgSend(a4, "viewSpec", a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [(PXUILabelTile *)self _setSpec:v5];
}

- (UIView)view
{
  label = self->_label;
  if (!label)
  {
    v4 = objc_alloc_init(PXUILabel);
    id v5 = self->_label;
    self->_label = v4;

    [(PXUILabel *)self->_label setUserInteractionEnabled:0];
    [(PXUILabel *)self->_label setText:self->_text];
    [(PXUILabel *)self->_label setSpec:self->_spec];
    label = self->_label;
  }
  return (UIView *)label;
}

@end