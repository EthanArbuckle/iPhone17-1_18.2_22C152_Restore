@interface _UICollectionTableIndexOverlayManager
- (id)initWithHost:(id *)a1;
- (uint64_t)handleWheelChangedEvent:(uint64_t)a1;
- (uint64_t)transitionIndexOverlaySelectionViewToVisible:(uint64_t)result;
- (void)_configureIndexOverlayIndicatorViewIfNecessary;
- (void)_configureIndexOverlaySelectionViewIfNecessary;
- (void)_hideIndicatorAfterDelay:(id)val;
- (void)_prolongIndicatorHideTimer;
- (void)handleMoveEvent:(uint64_t)a1;
- (void)hostDidMoveToWindow:(uint64_t)a1;
- (void)setIndexOverlayIndicatorViewText:(uint64_t)a1;
- (void)tearDown;
- (void)transitionIndexOverlayIndicatorViewToVisible:(int)a3 shouldFadeBackToInvisible:;
@end

@implementation _UICollectionTableIndexOverlayManager

- (id)initWithHost:(id *)a1
{
  id v3 = a2;
  if (a1)
  {
    v6.receiver = a1;
    v6.super_class = (Class)_UICollectionTableIndexOverlayManager;
    v4 = (id *)objc_msgSendSuper2(&v6, sel_init);
    a1 = v4;
    if (v4) {
      objc_storeWeak(v4 + 1, v3);
    }
  }

  return a1;
}

- (void)tearDown
{
  if (a1)
  {
    [*(id *)(a1 + 16) removeFromSuperview];
    v2 = *(void **)(a1 + 16);
    *(void *)(a1 + 16) = 0;

    [*(id *)(a1 + 24) removeFromSuperview];
    id v3 = *(void **)(a1 + 24);
    *(void *)(a1 + 24) = 0;
  }
}

- (void)hostDidMoveToWindow:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v8 = v3;
    if (v3)
    {
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
      v5 = WeakRetained;
      if (WeakRetained)
      {
        objc_super v6 = [WeakRetained _screen];
        uint64_t v7 = [v6 _userInterfaceIdiom];

        if (v7 == 3)
        {
          -[_UICollectionTableIndexOverlayManager _configureIndexOverlayIndicatorViewIfNecessary](a1);
          -[_UICollectionTableIndexOverlayManager _configureIndexOverlaySelectionViewIfNecessary](a1);
        }
        else
        {
          -[_UICollectionTableIndexOverlayManager tearDown](a1);
        }
      }
    }
    else
    {
      -[_UICollectionTableIndexOverlayManager tearDown](a1);
    }
    id v3 = v8;
  }
}

- (void)_configureIndexOverlayIndicatorViewIfNecessary
{
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    if (WeakRetained)
    {
      id v7 = WeakRetained;
      if (!*(void *)(a1 + 16))
      {
        id v3 = [[_UICollectionTableIndexOverlayIndicatorView alloc] initWithHost:WeakRetained];
        v4 = *(void **)(a1 + 16);
        *(void *)(a1 + 16) = v3;
      }
      v5 = [v7 window];
      [v5 bounds];
      objc_msgSend(*(id *)(a1 + 16), "setFrame:");

      [*(id *)(a1 + 16) setAlpha:0.0];
      [*(id *)(a1 + 16) setHidden:1];
      [*(id *)(a1 + 16) setAutoresizingMask:18];
      objc_super v6 = [v7 window];
      [v6 addSubview:*(void *)(a1 + 16)];

      id WeakRetained = v7;
    }
  }
}

- (void)_configureIndexOverlaySelectionViewIfNecessary
{
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    if (WeakRetained)
    {
      id v11 = WeakRetained;
      id v3 = [WeakRetained window];
      v4 = [v3 _screen];
      v5 = [v4 _capabilityForKey:@"UIScreenCapabilityTouchLevelsKey"];
      uint64_t v6 = [v5 integerValue];

      id WeakRetained = v11;
      if (v6 != 2)
      {
        if (!*(void *)(a1 + 24))
        {
          id v7 = [[_UICollectionTableIndexOverlaySelectionView alloc] initWithHost:v11];
          id v8 = *(void **)(a1 + 24);
          *(void *)(a1 + 24) = v7;
        }
        v9 = [v11 window];
        [v9 bounds];
        objc_msgSend(*(id *)(a1 + 24), "setFrame:");

        [*(id *)(a1 + 24) setAlpha:0.0];
        [*(id *)(a1 + 24) setHidden:1];
        [*(id *)(a1 + 24) setAutoresizingMask:18];
        v10 = [v11 window];
        [v10 addSubview:*(void *)(a1 + 24)];

        id WeakRetained = v11;
      }
    }
  }
}

- (void)transitionIndexOverlayIndicatorViewToVisible:(int)a3 shouldFadeBackToInvisible:
{
  if (a1 && ((((*(unsigned char *)(a1 + 48) & 1) == 0) ^ a2) & 1) == 0)
  {
    if (a2)
    {
      [*(id *)(a1 + 16) setHidden:0];
      double v6 = 0.15;
    }
    else
    {
      [*(id *)(a1 + 32) invalidate];
      id v7 = *(void **)(a1 + 32);
      *(void *)(a1 + 32) = 0;

      double v6 = 0.25;
    }
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __112___UICollectionTableIndexOverlayManager_transitionIndexOverlayIndicatorViewToVisible_shouldFadeBackToInvisible___block_invoke;
    v10[3] = &unk_1E52D9FC0;
    v10[4] = a1;
    char v11 = a2;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __112___UICollectionTableIndexOverlayManager_transitionIndexOverlayIndicatorViewToVisible_shouldFadeBackToInvisible___block_invoke_2;
    v8[3] = &unk_1E52E0478;
    char v9 = a2;
    v8[4] = a1;
    +[UIView animateWithDuration:2 delay:v10 options:v8 animations:v6 completion:0.0];
    if (a2)
    {
      *(unsigned char *)(a1 + 48) |= 1u;
      if (a3) {
        -[_UICollectionTableIndexOverlayManager _hideIndicatorAfterDelay:]((id)a1, 2.0);
      }
    }
  }
}

- (void)_hideIndicatorAfterDelay:(id)val
{
  if (val)
  {
    objc_initWeak(&location, val);
    v4 = (void *)MEMORY[0x1E4F1CB00];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __66___UICollectionTableIndexOverlayManager__hideIndicatorAfterDelay___block_invoke;
    v7[3] = &unk_1E52DAB28;
    objc_copyWeak(&v8, &location);
    uint64_t v5 = [v4 scheduledTimerWithTimeInterval:0 repeats:v7 block:a2];
    double v6 = (void *)*((void *)val + 4);
    *((void *)val + 4) = v5;

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

- (void)setIndexOverlayIndicatorViewText:(uint64_t)a1
{
  if (a1)
  {
    id v5 = a2;
    uint64_t v3 = [v5 copy];
    v4 = *(void **)(a1 + 56);
    *(void *)(a1 + 56) = v3;

    [*(id *)(a1 + 16) setCurrentText:v5];
  }
}

- (uint64_t)transitionIndexOverlaySelectionViewToVisible:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    if (((((*(unsigned char *)(result + 48) & 2) == 0) ^ a2) & 1) == 0)
    {
      double v4 = 0.25;
      if (a2)
      {
        objc_msgSend(*(id *)(result + 24), "setHidden:", 0, 0.25);
        double v4 = 0.15;
      }
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __86___UICollectionTableIndexOverlayManager_transitionIndexOverlaySelectionViewToVisible___block_invoke;
      v8[3] = &unk_1E52D9FC0;
      v8[4] = v3;
      char v9 = a2;
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __86___UICollectionTableIndexOverlayManager_transitionIndexOverlaySelectionViewToVisible___block_invoke_2;
      v6[3] = &unk_1E52E0478;
      char v7 = a2;
      v6[4] = v3;
      result = +[UIView animateWithDuration:2 delay:v8 options:v6 animations:v4 completion:0.0];
      if (a2)
      {
        *(unsigned char *)(v3 + 48) |= 2u;
        uint64_t v5 = *(void *)(v3 + 24);
      }
      else
      {
        uint64_t v5 = 0;
      }
      if (__UIAccessibilityBroadcastCallback) {
        return __UIAccessibilityBroadcastCallback(1000, v5);
      }
    }
  }
  return result;
}

- (uint64_t)handleWheelChangedEvent:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    if (WeakRetained)
    {
      [v3 _wheelVelocity];
      if ((*(unsigned char *)(a1 + 48) & 1) != 0 || fabs(v5) < 20.0)
      {
        -[_UICollectionTableIndexOverlayManager _prolongIndicatorHideTimer]((void *)a1);
        uint64_t v6 = 0;
      }
      else
      {
        [WeakRetained _recomputeSectionIndexTitleIndex];
        uint64_t v6 = 1;
        -[_UICollectionTableIndexOverlayManager transitionIndexOverlayIndicatorViewToVisible:shouldFadeBackToInvisible:](a1, 1, 1);
        *(CFTimeInterval *)(a1 + 40) = CACurrentMediaTime();
      }
    }
    else
    {
      uint64_t v6 = 1;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (void)_prolongIndicatorHideTimer
{
  if (a1)
  {
    v2 = (void *)a1[4];
    if (v2)
    {
      [v2 invalidate];
      id v3 = (void *)a1[4];
      a1[4] = 0;

      -[_UICollectionTableIndexOverlayManager _hideIndicatorAfterDelay:](a1, 2.0);
    }
  }
}

- (void)handleMoveEvent:(uint64_t)a1
{
  id v5 = a2;
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    if (WeakRetained && CACurrentMediaTime() - *(double *)(a1 + 40) >= 0.25)
    {
      if ([v5 _moveDirection] == 1) {
        uint64_t v4 = 1;
      }
      else {
        uint64_t v4 = -1;
      }
      [WeakRetained _shiftSectionIndexTitleIndexByAmount:v4];
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indexOverlayIndicatorViewText, 0);
  objc_storeStrong((id *)&self->_indicatorHideTimer, 0);
  objc_storeStrong((id *)&self->_selectionView, 0);
  objc_storeStrong((id *)&self->_indicatorView, 0);
  objc_destroyWeak((id *)&self->_host);
}

@end