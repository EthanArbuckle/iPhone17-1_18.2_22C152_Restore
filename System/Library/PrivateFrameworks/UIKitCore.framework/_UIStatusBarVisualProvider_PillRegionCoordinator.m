@interface _UIStatusBarVisualProvider_PillRegionCoordinator
- (BOOL)handledUpdateOfActionable:(id)a3 highlighted:(BOOL)a4 initialPress:(BOOL)a5;
- (NSTimer)backgroundActivityDetailTimer;
- (_UIStatusBarDisplayItemPlacement)backgroundActivityDetailPlacement;
- (_UIStatusBarDisplayItemPlacement)pillIconPlacement;
- (_UIStatusBarPillRegionVisualProvider)visualProvider;
- (_UIStatusBarRegion)pillRegion;
- (id)animationForBackgroundActivityIcon;
- (id)animationForBackgroundActivityPill;
- (id)animationForBackgroundActivityPillWithDuration:(double)a3 scale:(double)a4;
- (void)_hideActivityDetailAndUpdate:(BOOL)a3;
- (void)_updateBackgroundActivityWithEntry:(id)a3 timeEntry:(id)a4 needsUpdate:(BOOL)a5;
- (void)setBackgroundActivityDetailPlacement:(id)a3;
- (void)setBackgroundActivityDetailTimer:(id)a3;
- (void)setPillIconPlacement:(id)a3;
- (void)setPillRegion:(id)a3;
- (void)setVisualProvider:(id)a3;
- (void)updateDataForBackgroundActivity:(id)a3;
- (void)updatePill;
- (void)updateRegion:(id)a3 highlighted:(BOOL)a4 initialPress:(BOOL)a5 cornerRadius:(double)a6;
@end

@implementation _UIStatusBarVisualProvider_PillRegionCoordinator

- (void)setPillRegion:(id)a3
{
  v5 = (_UIStatusBarRegion *)a3;
  pillRegion = self->_pillRegion;
  p_pillRegion = &self->_pillRegion;
  if (pillRegion != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_pillRegion, a3);
    [(_UIStatusBarRegion *)*p_pillRegion disableWithToken:11];
    v5 = v8;
  }
}

- (void)setPillIconPlacement:(id)a3
{
  v5 = (_UIStatusBarDisplayItemPlacement *)a3;
  objc_storeStrong((id *)&self->_pillIconPlacement, a3);
  backgroundActivityDetailPlacement = self->_backgroundActivityDetailPlacement;
  self->_backgroundActivityDetailPlacement = v5;
}

- (void)setVisualProvider:(id)a3
{
  id obj = a3;
  self->_visualProviderImplementsBackgroundActivityPillAnimation = objc_opt_respondsToSelector() & 1;
  objc_storeWeak((id *)&self->_visualProvider, obj);
}

- (void)updateDataForBackgroundActivity:(id)a3
{
  id v4 = a3;
  if (self->_pillRegion || self->_backgroundActivityDetailPlacement)
  {
    id v27 = v4;
    v5 = [v4 backgroundActivityEntry];
    v6 = v5;
    pillRegion = self->_pillRegion;
    if (v5)
    {
      if (!pillRegion) {
        goto LABEL_18;
      }
      int v8 = [v5 isEnabled];
      v9 = self->_pillRegion;
      if (v8)
      {
        [(_UIStatusBarRegion *)v9 enableWithToken:11];
        v10 = +[_UIStatusBarActivityAction actionForBackgroundActivityType:](_UIStatusBarActivityAction, "actionForBackgroundActivityType:", [v6 type]);
        [(_UIStatusBarRegion *)self->_pillRegion setAction:v10];

        v11 = [(_UIStatusBarVisualProvider_PillRegionCoordinator *)self visualProvider];
        v12 = [v11 statusBar];
        v13 = [v12 currentAggregatedData];
        v14 = [MEMORY[0x1E4F1CAD0] setWithObject:@"backNavigationEntry"];
        v15 = [v13 dataByApplyingUpdate:v27 keys:v14];

        v16 = [v15 backNavigationEntry];
        if ([v16 isEnabled])
        {
          v17 = +[_UIStatusBarDataEntry disabledEntry];
          [v27 setBackNavigationEntry:v17];
        }
      }
      else
      {
        [(_UIStatusBarRegion *)v9 disableWithToken:11];
      }
      if (!self->_pillRegion) {
        goto LABEL_18;
      }
    }
    else if (!pillRegion)
    {
      goto LABEL_20;
    }
    v18 = [v27 shortTimeEntry];

    if (v18)
    {
      v19 = [v27 shortTimeEntry];
      int v20 = [v19 isEnabled];
      v21 = [(_UIStatusBarVisualProvider_PillRegionCoordinator *)self visualProvider];
      v22 = [v21 statusBar];
      v23 = [v22 currentAggregatedData];
      v24 = [v23 shortTimeEntry];
      int v25 = [v24 isEnabled];

      if (v6 || ((v20 ^ v25) & 1) != 0)
      {
LABEL_18:
        if (self->_backgroundActivityDetailPlacement)
        {
          v26 = [v27 shortTimeEntry];
          [(_UIStatusBarVisualProvider_PillRegionCoordinator *)self _updateBackgroundActivityWithEntry:v6 timeEntry:v26 needsUpdate:0];
        }
      }
    }
    else if (v6)
    {
      goto LABEL_18;
    }
LABEL_20:

    id v4 = v27;
  }
}

- (void)_updateBackgroundActivityWithEntry:(id)a3 timeEntry:(id)a4 needsUpdate:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v10 = [(_UIStatusBarVisualProvider_PillRegionCoordinator *)self backgroundActivityDetailTimer];
  [v10 invalidate];

  [(_UIStatusBarVisualProvider_PillRegionCoordinator *)self setBackgroundActivityDetailTimer:0];
  if (!v8)
  {
    v12 = [(_UIStatusBarVisualProvider_PillRegionCoordinator *)self visualProvider];
    v13 = [v12 statusBar];
    v14 = [v13 currentAggregatedData];
    id v8 = [v14 backgroundActivityEntry];

    if (v9) {
      goto LABEL_3;
    }
LABEL_9:
    v15 = [(_UIStatusBarVisualProvider_PillRegionCoordinator *)self visualProvider];
    v16 = [v15 statusBar];
    v17 = [v16 currentAggregatedData];
    id v9 = [v17 shortTimeEntry];

    goto LABEL_3;
  }
  if (!v9) {
    goto LABEL_9;
  }
  if (![v8 isEnabled]) {
    goto LABEL_13;
  }
LABEL_3:
  if (self->_pillRegion)
  {
    if (+[_UIStatusBarPillBackgroundActivityItem shouldKeepIconVisibleForActivityType:](_UIStatusBarPillBackgroundActivityItem, "shouldKeepIconVisibleForActivityType:", [v8 type]))
    {
LABEL_14:
      [(_UIStatusBarDisplayItemPlacement *)self->_backgroundActivityDetailPlacement setEnabled:1];
      goto LABEL_15;
    }
    v11 = [(_UIStatusBarVisualProvider_PillRegionCoordinator *)self visualProvider];
    if ([v11 expanded])
    {

      goto LABEL_14;
    }
    int v18 = [v9 isEnabled];

    if (!v18) {
      goto LABEL_14;
    }
  }
  [v8 displayStartDate];
  double v20 = v19 + 3.0 - CACurrentMediaTime();
  if (v20 > 0.0)
  {
    [(_UIStatusBarDisplayItemPlacement *)self->_backgroundActivityDetailPlacement setEnabled:1];
    objc_initWeak(&location, self);
    v21 = (void *)MEMORY[0x1E4F1CB00];
    uint64_t v23 = MEMORY[0x1E4F143A8];
    uint64_t v24 = 3221225472;
    int v25 = __109___UIStatusBarVisualProvider_PillRegionCoordinator__updateBackgroundActivityWithEntry_timeEntry_needsUpdate___block_invoke;
    v26 = &unk_1E52DAB28;
    objc_copyWeak(&v27, &location);
    v22 = [v21 scheduledTimerWithTimeInterval:0 repeats:&v23 block:v20];
    -[_UIStatusBarVisualProvider_PillRegionCoordinator setBackgroundActivityDetailTimer:](self, "setBackgroundActivityDetailTimer:", v22, v23, v24, v25, v26);

    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
  }
  else
  {
LABEL_13:
    [(_UIStatusBarVisualProvider_PillRegionCoordinator *)self _hideActivityDetailAndUpdate:v5];
  }
LABEL_15:
}

- (void)updatePill
{
}

- (void)_hideActivityDetailAndUpdate:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(_UIStatusBarVisualProvider_PillRegionCoordinator *)self visualProvider];
  char v6 = [v5 expanded];

  if ((v6 & 1) == 0)
  {
    [(_UIStatusBarDisplayItemPlacement *)self->_backgroundActivityDetailPlacement setEnabled:0];
    if (v3)
    {
      id v8 = [(_UIStatusBarVisualProvider_PillRegionCoordinator *)self visualProvider];
      v7 = [v8 statusBar];
      [v7 updateWithAnimations:MEMORY[0x1E4F1CBF0]];
    }
  }
}

- (id)animationForBackgroundActivityIcon
{
  v2 = +[_UIStatusBarAnimationFactory fadeAnimationWithDuration:0.5];
  BOOL v3 = +[_UIStatusBarAnimationFactory fadeAnimationWithDuration:0.5];
  [v3 setPriority:15];
  id v4 = +[_UIStatusBarBackgroundActivityItem secondaryIconDisplayIdentifier];
  [v2 addSubAnimation:v3 forDisplayItemWithIdentifier:v4];

  BOOL v5 = +[_UIStatusBarAnimationFactory fadeAnimationWithDuration:0.5];
  [v5 setPriority:10];
  char v6 = +[_UIStatusBarTimeItem pillTimeDisplayIdentifier];
  [v2 addSubAnimation:v5 forDisplayItemWithIdentifier:v6];

  v7 = +[_UIStatusBarItem defaultDisplayIdentifier];
  [v2 addSubAnimation:v5 forDisplayItemWithIdentifier:v7];

  [v2 setDelaysDependentItems:1];
  return v2;
}

- (id)animationForBackgroundActivityPill
{
  return [(_UIStatusBarVisualProvider_PillRegionCoordinator *)self animationForBackgroundActivityPillWithDuration:0.5 scale:0.5];
}

- (id)animationForBackgroundActivityPillWithDuration:(double)a3 scale:(double)a4
{
  v7 = +[_UIStatusBarAnimationFactory fadeAnimationWithDuration:scale:](_UIStatusBarAnimationFactory, "fadeAnimationWithDuration:scale:");
  id v8 = +[_UIStatusBarAnimationFactory fadeAnimationWithDuration:a3 scale:a4];
  [v8 setPriority:20];
  id v9 = +[_UIStatusBarAnimationFactory fadeAnimationWithDuration:scale:offset:](_UIStatusBarAnimationFactory, "fadeAnimationWithDuration:scale:offset:", a3, a4, 0.0, 0.0);
  [v9 setPriority:20];
  v10 = +[_UIStatusBarAnimationFactory fadeAnimationWithDuration:scale:offset:](_UIStatusBarAnimationFactory, "fadeAnimationWithDuration:scale:offset:", a3, a4, -0.0, 0.0);
  [v10 setPriority:20];
  v11 = +[_UIStatusBarItem defaultDisplayIdentifier];
  [v7 addSubAnimation:v9 forDisplayItemWithIdentifier:v11];

  v12 = +[_UIStatusBarBackgroundActivityItem secondaryIconDisplayIdentifier];
  [v7 addSubAnimation:v10 forDisplayItemWithIdentifier:v12];

  v13 = +[_UIStatusBarTimeItem pillTimeDisplayIdentifier];
  [v7 addSubAnimation:v8 forDisplayItemWithIdentifier:v13];

  [v7 setDelaysDependentItems:1];
  if (self->_visualProviderImplementsBackgroundActivityPillAnimation)
  {
    v14 = [(_UIStatusBarVisualProvider_PillRegionCoordinator *)self visualProvider];
    uint64_t v15 = [v14 animationForBackgroundActivityPillAnimation:v7 duration:a3 scale:a4];

    v7 = (void *)v15;
  }

  return v7;
}

- (void)updateRegion:(id)a3 highlighted:(BOOL)a4 initialPress:(BOOL)a5 cornerRadius:(double)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  v14[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  v10 = [v9 highlightView];
  if (!v10)
  {
    v10 = objc_alloc_init(_UIStatusBarRoundedCornerView);
    [(_UIStatusBarRoundedCornerView *)v10 setCornerRadius:a6];
    [v9 setHighlightView:v10];
  }
  v14[0] = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __103___UIStatusBarVisualProvider_PillRegionCoordinator_updateRegion_highlighted_initialPress_cornerRadius___block_invoke;
  v12[3] = &__block_descriptor_33_e16_v16__0__UIView_8l;
  BOOL v13 = v8;
  +[UIButton _setVisuallyHighlighted:v8 forViews:v11 initialPress:v7 highlightBlock:v12];
}

- (BOOL)handledUpdateOfActionable:(id)a3 highlighted:(BOOL)a4 initialPress:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v9 = 0;
LABEL_6:
    BOOL v11 = 0;
    goto LABEL_7;
  }
  id v9 = v8;
  if (!v9) {
    goto LABEL_6;
  }
  id v10 = [(_UIStatusBarVisualProvider_PillRegionCoordinator *)self pillRegion];

  if (v10 != v9) {
    goto LABEL_6;
  }
  [(_UIStatusBarVisualProvider_PillRegionCoordinator *)self updateRegion:v9 highlighted:v6 initialPress:v5 cornerRadius:-1.0];
  BOOL v11 = 1;
LABEL_7:

  return v11;
}

- (_UIStatusBarPillRegionVisualProvider)visualProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_visualProvider);
  return (_UIStatusBarPillRegionVisualProvider *)WeakRetained;
}

- (_UIStatusBarDisplayItemPlacement)backgroundActivityDetailPlacement
{
  return self->_backgroundActivityDetailPlacement;
}

- (void)setBackgroundActivityDetailPlacement:(id)a3
{
}

- (_UIStatusBarDisplayItemPlacement)pillIconPlacement
{
  return self->_pillIconPlacement;
}

- (_UIStatusBarRegion)pillRegion
{
  return self->_pillRegion;
}

- (NSTimer)backgroundActivityDetailTimer
{
  return self->_backgroundActivityDetailTimer;
}

- (void)setBackgroundActivityDetailTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundActivityDetailTimer, 0);
  objc_storeStrong((id *)&self->_pillRegion, 0);
  objc_storeStrong((id *)&self->_pillIconPlacement, 0);
  objc_storeStrong((id *)&self->_backgroundActivityDetailPlacement, 0);
  objc_destroyWeak((id *)&self->_visualProvider);
}

@end