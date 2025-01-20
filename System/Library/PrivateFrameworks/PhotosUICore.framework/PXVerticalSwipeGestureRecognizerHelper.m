@interface PXVerticalSwipeGestureRecognizerHelper
- (BOOL)allowSwipeDown;
- (BOOL)allowSwipeUp;
- (BOOL)verticalSwipeGestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4;
- (BOOL)verticalSwipeGestureRecognizerShouldBegin:(id)a3;
- (BOOL)verticalSwipeGestureRecognizerShouldBegin:(id)a3 ignoringScrollViews:(BOOL)a4;
- (NSMapTable)dependentScrollViews;
- (PXVerticalSwipeGestureRecognizerHelper)init;
- (PXVerticalSwipeGestureRecognizerHelperDelegate)delegate;
- (id)_panGestureRecognizerForVerticalSwipeGestureRecognizer:(id)a3;
- (void)setAllowSwipeDown:(BOOL)a3;
- (void)setAllowSwipeUp:(BOOL)a3;
- (void)setDelegate:(id)a3;
@end

@implementation PXVerticalSwipeGestureRecognizerHelper

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dependentScrollViews, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (NSMapTable)dependentScrollViews
{
  return self->_dependentScrollViews;
}

- (void)setAllowSwipeDown:(BOOL)a3
{
  self->_allowSwipeDown = a3;
}

- (BOOL)allowSwipeDown
{
  return self->_allowSwipeDown;
}

- (void)setAllowSwipeUp:(BOOL)a3
{
  self->_allowSwipeUp = a3;
}

- (BOOL)allowSwipeUp
{
  return self->_allowSwipeUp;
}

- (PXVerticalSwipeGestureRecognizerHelperDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PXVerticalSwipeGestureRecognizerHelperDelegate *)WeakRetained;
}

- (id)_panGestureRecognizerForVerticalSwipeGestureRecognizer:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"PXVerticalSwipeGestureRecognizerHelper.m", 114, @"unexpected class for verticalSwipeGestureRecognizer %@", v5 object file lineNumber description];
  }
  return v5;
}

- (BOOL)verticalSwipeGestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4
{
  id v6 = a4;
  v7 = [(PXVerticalSwipeGestureRecognizerHelper *)self _panGestureRecognizerForVerticalSwipeGestureRecognizer:a3];
  id v15 = 0;
  int v8 = objc_msgSend(v6, "px_isPanGestureRecognizerOfScrollView:", &v15);

  id v9 = v15;
  v10 = v9;
  if (v8 && (objc_msgSend(v9, "px_hasHiddenAncestor") & 1) == 0)
  {
    v11 = [(PXVerticalSwipeGestureRecognizerHelper *)self dependentScrollViews];
    v12 = [v11 objectForKey:v7];

    if (!v12)
    {
      v12 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
      v13 = [(PXVerticalSwipeGestureRecognizerHelper *)self dependentScrollViews];
      [v13 setObject:v12 forKey:v7];
    }
    [v12 addObject:v10];
  }
  return v8;
}

- (BOOL)verticalSwipeGestureRecognizerShouldBegin:(id)a3 ignoringScrollViews:(BOOL)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v4 = [(PXVerticalSwipeGestureRecognizerHelper *)self _panGestureRecognizerForVerticalSwipeGestureRecognizer:a3];
  id v5 = [v4 view];
  [v4 velocityInView:v5];
  double v7 = v6;
  double v9 = v8;

  MEMORY[0x1AD10AEE0](fabs(v7), fabs(v9));
  PXRadiansToDegrees();
}

- (BOOL)verticalSwipeGestureRecognizerShouldBegin:(id)a3
{
  return [(PXVerticalSwipeGestureRecognizerHelper *)self verticalSwipeGestureRecognizerShouldBegin:a3 ignoringScrollViews:0];
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    self->_delegateRespondsTo.shouldRecognizeSwipeDownGestureRecognizer = objc_opt_respondsToSelector() & 1;
  }
}

- (PXVerticalSwipeGestureRecognizerHelper)init
{
  v6.receiver = self;
  v6.super_class = (Class)PXVerticalSwipeGestureRecognizerHelper;
  v2 = [(PXVerticalSwipeGestureRecognizerHelper *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
    v4 = (void *)*((void *)v2 + 3);
    *((void *)v2 + 3) = v3;

    *(_WORD *)(v2 + 9) = 257;
  }
  return (PXVerticalSwipeGestureRecognizerHelper *)v2;
}

@end