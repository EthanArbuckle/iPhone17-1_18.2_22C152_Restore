@interface _UILabelViewTextAttachment
- (UIView)view;
- (_UILabelViewTextAttachment)initWithViewProvider:(id)a3;
- (id)layoutInRect;
- (id)viewProvider;
- (void)_drawInAlignedRect:(CGRect)a3 attributes:(id)a4 location:(id)a5 textContainer:(id)a6 applicationFrameworkContext:(int64_t)a7;
- (void)setLayoutInRect:(id)a3;
- (void)setViewProvider:(id)a3;
@end

@implementation _UILabelViewTextAttachment

- (_UILabelViewTextAttachment)initWithViewProvider:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UILabelViewTextAttachment;
  v5 = [(_UILabelViewTextAttachment *)&v9 initWithData:0 ofType:0];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    id viewProvider = v5->_viewProvider;
    v5->_id viewProvider = (id)v6;
  }
  return v5;
}

- (UIView)view
{
  view = self->_view;
  if (!view)
  {
    id v4 = [(_UILabelViewTextAttachment *)self viewProvider];
    v4[2]();
    v5 = (UIView *)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = self->_view;
    self->_view = v5;

    view = self->_view;
  }
  return view;
}

- (void)_drawInAlignedRect:(CGRect)a3 attributes:(id)a4 location:(id)a5 textContainer:(id)a6 applicationFrameworkContext:(int64_t)a7
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v12 = [(_UILabelViewTextAttachment *)self layoutInRect];

  if (v12)
  {
    v13 = [(_UILabelViewTextAttachment *)self layoutInRect];
    v13[2](floor(x + 0.5), floor(y - height + 0.5), width, height);
  }
}

- (id)viewProvider
{
  return self->_viewProvider;
}

- (void)setViewProvider:(id)a3
{
}

- (id)layoutInRect
{
  return self->_layoutInRect;
}

- (void)setLayoutInRect:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_layoutInRect, 0);
  objc_storeStrong(&self->_viewProvider, 0);
  objc_storeStrong((id *)&self->_view, 0);
}

@end