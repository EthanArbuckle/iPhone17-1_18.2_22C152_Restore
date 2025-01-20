@interface MainWindowSearchBar
- (SearchBarHeightObserver)heightObserver;
- (void)setFrame:(CGRect)a3;
- (void)setHeightObserver:(id)a3;
@end

@implementation MainWindowSearchBar

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(MainWindowSearchBar *)self frame];
  double v9 = v8;
  v11.receiver = self;
  v11.super_class = (Class)MainWindowSearchBar;
  -[MainWindowSearchBar setFrame:](&v11, "setFrame:", x, y, width, height);
  if (height != v9)
  {
    v10 = [(MainWindowSearchBar *)self heightObserver];
    [v10 searchBarHeightDidChange];
  }
}

- (SearchBarHeightObserver)heightObserver
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_heightObserver);

  return (SearchBarHeightObserver *)WeakRetained;
}

- (void)setHeightObserver:(id)a3
{
}

- (void).cxx_destruct
{
}

@end