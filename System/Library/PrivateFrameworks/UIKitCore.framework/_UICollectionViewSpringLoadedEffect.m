@interface _UICollectionViewSpringLoadedEffect
- (NSTimer)stateBlinkTimer;
- (UISpringLoadedInteractionEffect)blinkEffect;
- (_UICollectionViewSpringLoadedEffect)init;
- (void)interaction:(id)a3 didChangeWithContext:(id)a4;
- (void)setBlinkEffect:(id)a3;
- (void)setStateBlinkTimer:(id)a3;
@end

@implementation _UICollectionViewSpringLoadedEffect

- (_UICollectionViewSpringLoadedEffect)init
{
  v5.receiver = self;
  v5.super_class = (Class)_UICollectionViewSpringLoadedEffect;
  v2 = [(_UICollectionViewSpringLoadedEffect *)&v5 init];
  if (v2)
  {
    v3 = +[UISpringLoadedInteraction _blinkEffect];
    [(_UICollectionViewSpringLoadedEffect *)v2 setBlinkEffect:v3];
  }
  return v2;
}

- (void)setBlinkEffect:(id)a3
{
}

- (void)interaction:(id)a3 didChangeWithContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 view];
  v9 = [v7 overrideTargetItem];
  v10 = [v7 overrideTargetView];

  if (v10)
  {
    v11 = [v7 overrideTargetView];
    [v7 setTargetView:v11];
  }
  v12 = [v7 overrideTargetView];

  v13 = [v7 targetView];

  v14 = [v7 targetView];
  if (!v14 || (v14, v13 == v8) && v12 != v8)
  {
    v15 = [v8 _cellForItemAtIndexPath:v9];
    [v7 setTargetView:v15];
  }
  uint64_t v16 = [v7 targetView];
  if (v16
    && (v17 = (void *)v16,
        [v7 targetView],
        v18 = objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        char isKindOfClass = objc_opt_isKindOfClass(),
        v18,
        v17,
        (isKindOfClass & 1) == 0))
  {
    id v23 = 0;
  }
  else
  {
    v20 = [v7 targetView];
    v21 = v20;
    if (v20)
    {
      id v22 = v20;
    }
    else
    {
      id v22 = [v8 _cellForItemAtIndexPath:v9];
    }
    v24 = v22;

    if ([v24 _usingBackgroundViewConfiguration]) {
      id v23 = v24;
    }
    else {
      id v23 = 0;
    }
  }
  uint64_t v25 = [v7 state];
  if (v25 == 2)
  {
    if (v23)
    {
      objc_initWeak(&location, v8);
      v27 = (void *)MEMORY[0x1E4F1CB00];
      uint64_t v32 = MEMORY[0x1E4F143A8];
      uint64_t v33 = 3221225472;
      v34 = __72___UICollectionViewSpringLoadedEffect_interaction_didChangeWithContext___block_invoke;
      v35 = &unk_1E52E6880;
      id v36 = v23;
      objc_copyWeak(&v38, &location);
      id v37 = v9;
      v28 = [v27 scheduledTimerWithTimeInterval:1 repeats:&v32 block:0.1];
      -[_UICollectionViewSpringLoadedEffect setStateBlinkTimer:](self, "setStateBlinkTimer:", v28, v32, v33, v34, v35);

      objc_destroyWeak(&v38);
      objc_destroyWeak(&location);
      goto LABEL_29;
    }
    goto LABEL_28;
  }
  if (v25 == 1)
  {
    v29 = [v7 overrideTargetView];

    if (v29) {
      goto LABEL_27;
    }
    [v7 setTargetView:0];
    if (v23) {
      goto LABEL_29;
    }
    [v8 _highlightSpringLoadedItemAtIndexPath:v9];
LABEL_28:
    v31 = [(_UICollectionViewSpringLoadedEffect *)self blinkEffect];
    [v31 interaction:v6 didChangeWithContext:v7];

    goto LABEL_29;
  }
  if (v25)
  {
    v30 = [(_UICollectionViewSpringLoadedEffect *)self stateBlinkTimer];
    [v30 invalidate];

    [(_UICollectionViewSpringLoadedEffect *)self setStateBlinkTimer:0];
  }
  else
  {
    v26 = [(_UICollectionViewSpringLoadedEffect *)self stateBlinkTimer];
    [v26 invalidate];

    [(_UICollectionViewSpringLoadedEffect *)self setStateBlinkTimer:0];
    [v8 _unhighlightSpringLoadedItem];
    [v7 setOverrideTargetItem:0];
  }
LABEL_27:
  if (!v23) {
    goto LABEL_28;
  }
LABEL_29:
}

- (UISpringLoadedInteractionEffect)blinkEffect
{
  return self->_blinkEffect;
}

- (NSTimer)stateBlinkTimer
{
  return self->_stateBlinkTimer;
}

- (void)setStateBlinkTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateBlinkTimer, 0);
  objc_storeStrong((id *)&self->_blinkEffect, 0);
}

@end