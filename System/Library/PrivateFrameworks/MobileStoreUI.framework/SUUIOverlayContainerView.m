@interface SUUIOverlayContainerView
- (void)setFrame:(CGRect)a3;
@end

@implementation SUUIOverlayContainerView

- (void)setFrame:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SUUIOverlayContainerView;
  -[SUUIOverlayContainerView setFrame:](&v4, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(SUUIOverlayContainerView *)self sendActionsForControlEvents:4096];
}

@end