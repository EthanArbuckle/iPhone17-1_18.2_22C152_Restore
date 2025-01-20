@interface PXUIFloatingContentView
- (BOOL)canBecomeFocused;
- (CGRect)contentsRect;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)setContentsRect:(CGRect)a3;
@end

@implementation PXUIFloatingContentView

- (CGRect)contentsRect
{
  double x = self->_contentsRect.origin.x;
  double y = self->_contentsRect.origin.y;
  double width = self->_contentsRect.size.width;
  double height = self->_contentsRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setContentsRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  p_contentsRect = &self->_contentsRect;
  if (!CGRectEqualToRect(self->_contentsRect, a3))
  {
    p_contentsRect->origin.double x = x;
    p_contentsRect->origin.double y = y;
    p_contentsRect->size.double width = width;
    p_contentsRect->size.double height = height;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    v9 = [(_UIFloatingContentView *)self contentView];
    v10 = [v9 subviews];

    uint64_t v11 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v17 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          if ([v15 conformsToProtocol:&unk_1F0441460]) {
            objc_msgSend(v15, "setContentsRect:", x, y, width, height);
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v12);
    }
  }
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v7 = a4;
  v6 = [a3 nextFocusedView];
  LODWORD(a3) = v6 == self;

  [(_UIFloatingContentView *)self setControlState:8 * a3 withAnimationCoordinator:v7];
}

- (BOOL)canBecomeFocused
{
  return 1;
}

@end