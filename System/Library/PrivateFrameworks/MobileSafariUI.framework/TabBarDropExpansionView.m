@interface TabBarDropExpansionView
- (BOOL)dropInteraction:(id)a3 canHandleSession:(id)a4;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (TabBarDropExpansionView)initWithCoder:(id)a3;
- (TabBarDropExpansionView)initWithFrame:(CGRect)a3;
- (TabBarDropExpansionViewDelegate)delegate;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (int64_t)_dropInteraction:(id)a3 dataOwnerForSession:(id)a4;
- (void)dropInteraction:(id)a3 sessionDidEnd:(id)a4;
- (void)dropInteraction:(id)a3 sessionDidEnter:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation TabBarDropExpansionView

- (void)setDelegate:(id)a3
{
}

- (TabBarDropExpansionView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)TabBarDropExpansionView;
  v3 = -[TabBarDropExpansionView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = [(TabBarDropExpansionView *)v3 layer];
  [v4 setHitTestsAsOpaque:1];

  v5 = (void *)[objc_alloc(MEMORY[0x1E4FB1738]) initWithDelegate:v3];
  [(TabBarDropExpansionView *)v3 addInteraction:v5];

  return v3;
}

- (TabBarDropExpansionView)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)TabBarDropExpansionView;
  return [(TabBarDropExpansionView *)&v4 initWithCoder:a3];
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  if ([v7 type] == 9)
  {
    v10.receiver = self;
    v10.super_class = (Class)TabBarDropExpansionView;
    BOOL v8 = -[TabBarDropExpansionView pointInside:withEvent:](&v10, sel_pointInside_withEvent_, v7, x, y);
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  if ([v7 type] == 9)
  {
    v10.receiver = self;
    v10.super_class = (Class)TabBarDropExpansionView;
    BOOL v8 = -[TabBarDropExpansionView hitTest:withEvent:](&v10, sel_hitTest_withEvent_, v7, x, y);
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)dropInteraction:(id)a3 canHandleSession:(id)a4
{
  return +[TabDocumentDropHandler canHandleSession:a4];
}

- (void)dropInteraction:(id)a3 sessionDidEnter:(id)a4
{
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained tabBarDropExpansionView:self didBeginTrackingDropSession:v6];
  }
}

- (void)dropInteraction:(id)a3 sessionDidEnd:(id)a4
{
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained tabBarDropExpansionView:self didEndTrackingDropSession:v6];
  }
}

- (int64_t)_dropInteraction:(id)a3 dataOwnerForSession:(id)a4
{
  return 3;
}

- (TabBarDropExpansionViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (TabBarDropExpansionViewDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end