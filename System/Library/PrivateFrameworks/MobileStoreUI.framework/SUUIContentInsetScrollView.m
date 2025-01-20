@interface SUUIContentInsetScrollView
- (void)setScrollIndicatorInsets:(UIEdgeInsets)a3;
@end

@implementation SUUIContentInsetScrollView

- (void)setScrollIndicatorInsets:(UIEdgeInsets)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SUUIContentInsetScrollView;
  -[SUUIContentInsetScrollView setScrollIndicatorInsets:](&v5, sel_setScrollIndicatorInsets_, a3.top, a3.left, a3.bottom, a3.right);
  v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 postNotificationName:@"SUUIScrollViewContentInsetDidChangeNotification" object:self];
}

@end