@interface VUIBaseView
- (CGSize)sizeThatFits:(CGSize)a3;
- (void)didMoveToWindow;
- (void)layoutSubviews;
- (void)willMoveToWindow:(id)a3;
@end

@implementation VUIBaseView

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[VUIBaseView vui_layoutSubviews:computationOnly:](self, "vui_layoutSubviews:computationOnly:", 1, a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)VUIBaseView;
  [(VUIBaseView *)&v5 layoutSubviews];
  [(VUIBaseView *)self bounds];
  -[VUIBaseView vui_layoutSubviews:computationOnly:](self, "vui_layoutSubviews:computationOnly:", 0, v3, v4);
}

- (void)didMoveToWindow
{
  v3.receiver = self;
  v3.super_class = (Class)VUIBaseView;
  [(VUIBaseView *)&v3 didMoveToWindow];
  [(VUIBaseView *)self vui_didMoveToWindow];
}

- (void)willMoveToWindow:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)VUIBaseView;
  id v4 = a3;
  [(VUIBaseView *)&v5 willMoveToWindow:v4];
  -[VUIBaseView vui_willMoveToWindow:](self, "vui_willMoveToWindow:", v4, v5.receiver, v5.super_class);
}

@end