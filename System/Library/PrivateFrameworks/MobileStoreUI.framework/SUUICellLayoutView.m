@interface SUUICellLayoutView
- (SUUICellLayout)layout;
- (void)layoutSubviews;
- (void)setBackgroundColor:(id)a3;
- (void)setLayout:(id)a3;
@end

@implementation SUUICellLayoutView

- (void)layoutSubviews
{
}

- (void)setBackgroundColor:(id)a3
{
  layout = self->_layout;
  id v5 = a3;
  [(SUUICellLayout *)layout setBackgroundColor:v5];
  v6.receiver = self;
  v6.super_class = (Class)SUUICellLayoutView;
  [(SUUICellLayoutView *)&v6 setBackgroundColor:v5];
}

- (SUUICellLayout)layout
{
  return self->_layout;
}

- (void)setLayout:(id)a3
{
}

- (void).cxx_destruct
{
}

@end