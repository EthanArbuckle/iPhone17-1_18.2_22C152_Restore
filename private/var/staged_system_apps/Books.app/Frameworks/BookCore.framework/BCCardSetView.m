@interface BCCardSetView
- (BCCardSetViewAccessibilityDelegate)accessibilityDelegate;
- (BOOL)accessibilityPerformEscape;
- (id)accessibilityElements;
- (void)setAccessibilityDelegate:(id)a3;
@end

@implementation BCCardSetView

- (BOOL)accessibilityPerformEscape
{
  v2 = self;
  v3 = [(BCCardSetView *)self accessibilityDelegate];
  LOBYTE(v2) = [v3 accessibilityDismissCardSetView:v2];

  return (char)v2;
}

- (id)accessibilityElements
{
  id v3 = objc_alloc((Class)NSMutableArray);
  v10.receiver = self;
  v10.super_class = (Class)BCCardSetView;
  v4 = [(BCCardSetView *)&v10 accessibilityElements];
  id v5 = [v3 initWithArray:v4];

  if (!v5) {
    id v5 = objc_alloc_init((Class)NSMutableArray);
  }
  v6 = [(BCCardSetView *)self subviews];
  [v5 addObjectsFromArray:v6];

  v7 = [(BCCardSetView *)self accessibilityDelegate];
  v8 = [v7 additionalAccessibilityElementsForCardSetView];
  [v5 addObjectsFromArray:v8];

  return v5;
}

- (BCCardSetViewAccessibilityDelegate)accessibilityDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accessibilityDelegate);

  return (BCCardSetViewAccessibilityDelegate *)WeakRetained;
}

- (void)setAccessibilityDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end