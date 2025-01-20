@interface SBBannerPanGestureRecognizer
- (BOOL)_shouldReceiveTouch:(id)a3 withEvent:(id)a4;
- (BOOL)clientWantsCancelsTouchesInView;
- (NSMutableSet)identifiersForTouchesDisablingTouchCancellation;
- (SBBannerPanGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4;
- (SBBannerPanGestureSystemDragCancellingDelegate)systemDragCancellingDelegate;
- (SBWindowScene)windowScene;
- (void)_actuallySetCancelsTouchesInView:(BOOL)a3;
- (void)_addTouchDisablingTouchCancellation:(id)a3;
- (void)_removeTouchDisablingTouchCancellation:(id)a3;
- (void)_removeTouchesDisablingTouchCancellation:(id)a3;
- (void)_updateCancelsTouchesInView;
- (void)setCancelsTouchesInView:(BOOL)a3;
- (void)setClientWantsCancelsTouchesInView:(BOOL)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setSystemDragCancellingDelegate:(id)a3;
- (void)setWindowScene:(id)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
@end

@implementation SBBannerPanGestureRecognizer

- (SBBannerPanGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  v9.receiver = self;
  v9.super_class = (Class)SBBannerPanGestureRecognizer;
  v4 = [(SBBannerPanGestureRecognizer *)&v9 initWithTarget:a3 action:a4];
  v5 = v4;
  if (v4)
  {
    v4->_clientWantsCancelsTouchesInView = [(SBBannerPanGestureRecognizer *)v4 cancelsTouchesInView];
    uint64_t v6 = [MEMORY[0x1E4F1CA80] set];
    identifiersForTouchesDisablingTouchCancellation = v5->_identifiersForTouchesDisablingTouchCancellation;
    v5->_identifiersForTouchesDisablingTouchCancellation = (NSMutableSet *)v6;
  }
  return v5;
}

- (void)setCancelsTouchesInView:(BOOL)a3
{
  self->_clientWantsCancelsTouchesInView = a3;
  [(SBBannerPanGestureRecognizer *)self _updateCancelsTouchesInView];
}

- (void)_actuallySetCancelsTouchesInView:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)SBBannerPanGestureRecognizer;
  [(SBBannerPanGestureRecognizer *)&v3 setCancelsTouchesInView:a3];
}

- (void)_addTouchDisablingTouchCancellation:(id)a3
{
  identifiersForTouchesDisablingTouchCancellation = self->_identifiersForTouchesDisablingTouchCancellation;
  v5 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(a3, "_touchIdentifier"));
  [(NSMutableSet *)identifiersForTouchesDisablingTouchCancellation addObject:v5];

  [(SBBannerPanGestureRecognizer *)self _updateCancelsTouchesInView];
}

- (void)_removeTouchDisablingTouchCancellation:(id)a3
{
  identifiersForTouchesDisablingTouchCancellation = self->_identifiersForTouchesDisablingTouchCancellation;
  v5 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(a3, "_touchIdentifier"));
  [(NSMutableSet *)identifiersForTouchesDisablingTouchCancellation removeObject:v5];

  [(SBBannerPanGestureRecognizer *)self _updateCancelsTouchesInView];
}

- (void)_updateCancelsTouchesInView
{
  BOOL v3 = self->_clientWantsCancelsTouchesInView
    && [(NSMutableSet *)self->_identifiersForTouchesDisablingTouchCancellation count] == 0;
  [(SBBannerPanGestureRecognizer *)self _actuallySetCancelsTouchesInView:v3];
}

- (void)_removeTouchesDisablingTouchCancellation:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [(SBBannerPanGestureRecognizer *)self _removeTouchDisablingTouchCancellation:*(void *)(*((void *)&v9 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (BOOL)_shouldReceiveTouch:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SBBannerPanGestureRecognizer;
  BOOL v8 = [(SBBannerPanGestureRecognizer *)&v12 _shouldReceiveTouch:v6 withEvent:v7];
  if (v8
    && ([(SBBannerPanGestureRecognizer *)self systemDragCancellingDelegate],
        long long v9 = objc_claimAutoreleasedReturnValue(),
        int v10 = [v9 bannerPanGestureRecognizer:self shouldDisableTouchCancellationForTouch:v6 event:v7],
        v9,
        v10))
  {
    [(SBBannerPanGestureRecognizer *)self _addTouchDisablingTouchCancellation:v6];
  }
  else
  {
    [(SBBannerPanGestureRecognizer *)self _removeTouchDisablingTouchCancellation:v6];
  }

  return v8;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [(SBBannerPanGestureRecognizer *)self systemDragCancellingDelegate];
  int v9 = [v8 bannerPanGestureRecognizer:self shouldCancelSystemDragGestureWithTouches:v6 event:v7];

  if (v9)
  {
    [(SBBannerPanGestureRecognizer *)self setState:5];
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)SBBannerPanGestureRecognizer;
    [(SBBannerPanGestureRecognizer *)&v10 touchesBegan:v6 withEvent:v7];
  }
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)SBBannerPanGestureRecognizer;
  id v6 = a3;
  [(SBBannerPanGestureRecognizer *)&v7 touchesEnded:v6 withEvent:a4];
  -[SBBannerPanGestureRecognizer _removeTouchesDisablingTouchCancellation:](self, "_removeTouchesDisablingTouchCancellation:", v6, v7.receiver, v7.super_class);
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)SBBannerPanGestureRecognizer;
  id v6 = a3;
  [(SBBannerPanGestureRecognizer *)&v7 touchesCancelled:v6 withEvent:a4];
  -[SBBannerPanGestureRecognizer _removeTouchesDisablingTouchCancellation:](self, "_removeTouchesDisablingTouchCancellation:", v6, v7.receiver, v7.super_class);
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(SBBannerPanGestureRecognizer *)self isEnabled] != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)SBBannerPanGestureRecognizer;
    [(SBBannerPanGestureRecognizer *)&v5 setEnabled:v3];
    if (!v3) {
      [(NSMutableSet *)self->_identifiersForTouchesDisablingTouchCancellation removeAllObjects];
    }
  }
}

- (SBBannerPanGestureSystemDragCancellingDelegate)systemDragCancellingDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_systemDragCancellingDelegate);
  return (SBBannerPanGestureSystemDragCancellingDelegate *)WeakRetained;
}

- (void)setSystemDragCancellingDelegate:(id)a3
{
}

- (SBWindowScene)windowScene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  return (SBWindowScene *)WeakRetained;
}

- (void)setWindowScene:(id)a3
{
}

- (NSMutableSet)identifiersForTouchesDisablingTouchCancellation
{
  return self->_identifiersForTouchesDisablingTouchCancellation;
}

- (BOOL)clientWantsCancelsTouchesInView
{
  return self->_clientWantsCancelsTouchesInView;
}

- (void)setClientWantsCancelsTouchesInView:(BOOL)a3
{
  self->_clientWantsCancelsTouchesInView = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifiersForTouchesDisablingTouchCancellation, 0);
  objc_destroyWeak((id *)&self->_windowScene);
  objc_destroyWeak((id *)&self->_systemDragCancellingDelegate);
}

@end