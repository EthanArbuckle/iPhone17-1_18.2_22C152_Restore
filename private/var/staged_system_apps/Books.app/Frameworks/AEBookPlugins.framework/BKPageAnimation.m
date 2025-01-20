@interface BKPageAnimation
- (BKPageAnimationDelegate)pageAnimationDelegate;
- (BOOL)finished;
- (BOOL)isGoingToNextPage;
- (BOOL)isInteractive;
- (NSArray)existingPages;
- (int64_t)state;
- (void)setExistingPages:(id)a3;
- (void)setFinished:(BOOL)a3;
- (void)setIsGoingToNextPage:(BOOL)a3;
- (void)setIsInteractive:(BOOL)a3;
- (void)setPageAnimationDelegate:(id)a3;
- (void)setState:(int64_t)a3;
@end

@implementation BKPageAnimation

- (NSArray)existingPages
{
  return self->_existingPages;
}

- (void)setExistingPages:(id)a3
{
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (BOOL)finished
{
  return self->_finished;
}

- (void)setFinished:(BOOL)a3
{
  self->_finished = a3;
}

- (BOOL)isGoingToNextPage
{
  return self->_isGoingToNextPage;
}

- (void)setIsGoingToNextPage:(BOOL)a3
{
  self->_isGoingToNextPage = a3;
}

- (BOOL)isInteractive
{
  return self->_isInteractive;
}

- (void)setIsInteractive:(BOOL)a3
{
  self->_isInteractive = a3;
}

- (BKPageAnimationDelegate)pageAnimationDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pageAnimationDelegate);

  return (BKPageAnimationDelegate *)WeakRetained;
}

- (void)setPageAnimationDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_pageAnimationDelegate);

  objc_storeStrong((id *)&self->_existingPages, 0);
}

@end