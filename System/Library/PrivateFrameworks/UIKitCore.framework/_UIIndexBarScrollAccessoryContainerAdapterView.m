@interface _UIIndexBarScrollAccessoryContainerAdapterView
- (BOOL)overlay;
- (CGSize)sizeThatFits:(CGSize)a3;
- (UIScrollView)scrollView;
- (_UIIndexBarScrollAccessoryContainerAdapterView)initWithContents:(id)a3 delegatingToView:(id)a4;
- (int64_t)edge;
- (void)setEdge:(int64_t)a3;
- (void)setScrollView:(id)a3;
- (void)update;
@end

@implementation _UIIndexBarScrollAccessoryContainerAdapterView

- (_UIIndexBarScrollAccessoryContainerAdapterView)initWithContents:(id)a3 delegatingToView:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)_UIIndexBarScrollAccessoryContainerAdapterView;
  v8 = -[UIView initWithFrame:](&v11, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_delegatedView, a4);
    [(UIView *)v9 addSubview:v6];
    [v6 setTranslatesAutoresizingMaskIntoConstraints:1];
    [(UIView *)v9 bounds];
    objc_msgSend(v6, "setFrame:");
    [v6 setAutoresizingMask:18];
  }

  return v9;
}

- (UIScrollView)scrollView
{
  return (UIScrollView *)[(UIScrollAccessory *)self->_delegatedView scrollView];
}

- (void)setScrollView:(id)a3
{
}

- (int64_t)edge
{
  return [(UIScrollAccessory *)self->_delegatedView edge];
}

- (void)setEdge:(int64_t)a3
{
}

- (BOOL)overlay
{
  return [(UIScrollAccessory *)self->_delegatedView overlay];
}

- (void)update
{
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[UIScrollAccessory sizeThatFits:](self->_delegatedView, "sizeThatFits:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void).cxx_destruct
{
}

@end