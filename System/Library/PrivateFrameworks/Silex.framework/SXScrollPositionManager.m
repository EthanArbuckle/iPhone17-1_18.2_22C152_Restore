@interface SXScrollPositionManager
- (SXScrollPositionRestoring)scrollPositionRestoring;
- (void)setScrollPositionRestoring:(id)a3;
- (void)updateScrollPosition:(id)a3 animated:(BOOL)a4;
@end

@implementation SXScrollPositionManager

- (void)updateScrollPosition:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(SXScrollPositionManager *)self scrollPositionRestoring];
  [v7 updateScrollPosition:v6 animated:v4];
}

- (SXScrollPositionRestoring)scrollPositionRestoring
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scrollPositionRestoring);
  return (SXScrollPositionRestoring *)WeakRetained;
}

- (void)setScrollPositionRestoring:(id)a3
{
}

- (void).cxx_destruct
{
}

@end