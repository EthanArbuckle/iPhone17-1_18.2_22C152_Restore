@interface _UIGravityWellEffect
+ (id)effectWithDescriptor:(id)a3 continuationPreview:(id)a4;
- (NSArray)secondaryBodies;
- (NSArray)secondaryBodyPreviews;
- (NSMutableArray)completions;
- (UITargetedPreview)continuationPreview;
- (_UIContentEffectDescriptor)descriptor;
- (_UIGravityWellEffectBody)primaryBody;
- (double)baseZOffset;
- (double)effectProgress;
- (id)_criticallyDampedEffectSpringBehavior;
- (id)_effectSpringBehavior;
- (id)previewForContinuingToEffectWithPreview:(id)a3;
- (int64_t)state;
- (unint64_t)animationCount;
- (void)_installEffectViews;
- (void)_performAllCompletions;
- (void)_tearDownEffectViews;
- (void)_updateToProgress:(double)a3 state:(int64_t)a4;
- (void)addCompletion:(id)a3;
- (void)begin;
- (void)end;
- (void)endForHandOff;
- (void)setAnimationCount:(unint64_t)a3;
- (void)setBaseZOffset:(double)a3;
- (void)setContinuationPreview:(id)a3;
- (void)setDescriptor:(id)a3 andKey:(id)a4;
- (void)setEffectProgress:(double)a3;
- (void)setPrimaryBody:(id)a3;
- (void)setSecondaryBodies:(id)a3;
- (void)setState:(int64_t)a3;
- (void)updateWithProgress:(double)a3;
@end

@implementation _UIGravityWellEffect

+ (id)effectWithDescriptor:(id)a3 continuationPreview:(id)a4
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 primaryPreview];
  v9 = [v8 target];

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __65___UIGravityWellEffect_effectWithDescriptor_continuationPreview___block_invoke;
  aBlock[3] = &unk_1E52E6970;
  id v10 = v9;
  id v48 = v10;
  v11 = (void (**)(void *, void *))_Block_copy(aBlock);
  v12 = (id *)objc_opt_new();
  objc_storeStrong(v12 + 1, a3);
  [v12 setContinuationPreview:v7];
  v13 = [v6 primaryPreview];
  v14 = v11[2](v11, v13);
  [v12 setPrimaryBody:v14];

  v15 = +[UIDevice currentDevice];
  v16 = _UIContextMenuGetPlatformMetrics([v15 userInterfaceIdiom]);
  [v16 baseMenuOffset];
  [v12 setBaseZOffset:v17];

  v18 = [v6 secondaryPreviews];
  uint64_t v19 = [v18 count];

  if (v19)
  {
    v39 = v12;
    id v40 = v7;
    v20 = objc_opt_new();
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id v41 = v6;
    obunint64_t j = [v6 secondaryPreviews];
    uint64_t v21 = [obj countByEnumeratingWithState:&v43 objects:v49 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v44;
      do
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v44 != v23) {
            objc_enumerationMutation(obj);
          }
          v25 = v11[2](v11, *(void **)(*((void *)&v43 + 1) + 8 * i));
          [v25 positionInPrimaryContainer];
          double v27 = v26;
          double v29 = v28;
          [v10 center];
          [v25 setDistanceFromPrimaryBody:sqrt((v30 - v27) * (v30 - v27) + (v31 - v29) * (v31 - v29))];
          for (unint64_t j = 0; j < [v20 count]; ++j)
          {
            v33 = objc_msgSend(v20, "objectAtIndexedSubscript:", j, v39);
            [v33 distanceFromPrimaryBody];
            double v35 = v34;
            [v25 distanceFromPrimaryBody];
            double v37 = v36;

            if (v35 >= v37) {
              break;
            }
          }
          objc_msgSend(v20, "insertObject:atIndex:", v25, j, v39);
        }
        uint64_t v22 = [obj countByEnumeratingWithState:&v43 objects:v49 count:16];
      }
      while (v22);
    }

    v12 = v39;
    [v39 setSecondaryBodies:v20];

    id v7 = v40;
    id v6 = v41;
  }

  return v12;
}

- (NSArray)secondaryBodyPreviews
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA48] array];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v4 = [(_UIGravityWellEffect *)self secondaryBodies];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        id v10 = [UITargetedPreview alloc];
        v11 = [v9 effectView];
        v12 = [(UITargetedPreview *)v10 initWithView:v11];

        v13 = [v9 preview];
        v14 = [v13 _internalIdentifier];
        [(UITargetedPreview *)v12 set_internalIdentifier:v14];

        [v3 addObject:v12];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (void)begin
{
  v3 = [(_UIGravityWellEffect *)self primaryBody];
  v4 = [v3 effectView];
  uint64_t v5 = [v4 window];

  if (!v5) {
    [(_UIGravityWellEffect *)self _installEffectViews];
  }
  [(_UIGravityWellEffect *)self effectProgress];
  -[_UIGravityWellEffect _updateToProgress:state:](self, "_updateToProgress:state:", 1);
}

- (void)updateWithProgress:(double)a3
{
  int64_t v5 = [(_UIGravityWellEffect *)self state];
  [(_UIGravityWellEffect *)self _updateToProgress:v5 state:a3];
}

- (void)end
{
  if (+[UIView areAnimationsEnabled])
  {
    [(_UIGravityWellEffect *)self _updateToProgress:0 state:0.0];
  }
  else
  {
    [(_UIGravityWellEffect *)self _tearDownEffectViews];
    [(_UIGravityWellEffect *)self _performAllCompletions];
    [(_UIGravityWellEffect *)self setEffectProgress:0.0];
    [(_UIGravityWellEffect *)self setState:0];
  }
}

- (void)endForHandOff
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __37___UIGravityWellEffect_endForHandOff__block_invoke;
  v3[3] = &unk_1E52D9F70;
  v3[4] = self;
  +[UIView performWithoutAnimation:v3];
  [(_UIGravityWellEffect *)self setState:2];
}

- (void)setDescriptor:(id)a3 andKey:(id)a4
{
}

- (id)previewForContinuingToEffectWithPreview:(id)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  v4 = [(_UIGravityWellEffect *)self primaryBody];
  int64_t v5 = [v4 anchorView];

  uint64_t v6 = [v5 window];

  if (v6)
  {
    uint64_t v7 = [v5 layer];
    v8 = [v7 presentationLayer];
    v9 = v8;
    if (v8)
    {
      id v10 = v8;
    }
    else
    {
      id v10 = [v5 layer];
    }
    v12 = v10;

    memset(&v44, 0, sizeof(v44));
    double v36 = v12;
    if (v12) {
      [v12 transform];
    }
    else {
      memset(&v43, 0, sizeof(v43));
    }
    CATransform3DGetAffineTransform(&v44, &v43);
    v13 = [UIPreviewTarget alloc];
    v14 = [v5 superview];
    double v37 = v5;
    [v5 center];
    CGAffineTransform v42 = v44;
    uint64_t v15 = -[UIPreviewTarget initWithContainer:center:transform:](v13, "initWithContainer:center:transform:", v14, &v42);

    long long v16 = [(_UIGravityWellEffect *)self primaryBody];
    long long v17 = [v16 preview];
    double v35 = (void *)v15;
    v11 = [v17 retargetedPreviewWithTarget:v15];

    long long v18 = [(_UIGravityWellEffect *)self primaryBody];
    long long v19 = [v18 anchorView];
    v20 = [v19 layer];

    uint64_t v21 = [v20 animationKeys];
    objc_msgSend(v11, "set_transferrableAnimationKeys:", v21);

    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    uint64_t v22 = [v11 _transferrableAnimationKeys];
    uint64_t v23 = [v22 countByEnumeratingWithState:&v38 objects:v45 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v39;
      do
      {
        for (uint64_t i = 0; i != v24; ++i)
        {
          if (*(void *)v39 != v25) {
            objc_enumerationMutation(v22);
          }
          uint64_t v27 = *(void *)(*((void *)&v38 + 1) + 8 * i);
          double v28 = [v20 animationForKey:v27];
          double v29 = (void *)[v28 copy];

          if (v29)
          {
            [v20 removeAnimationForKey:v27];
            double v30 = [v11 view];
            double v31 = [v30 layer];
            [v31 addAnimation:v29 forKey:v27];
          }
        }
        uint64_t v24 = [v22 countByEnumeratingWithState:&v38 objects:v45 count:16];
      }
      while (v24);
    }

    int64_t v5 = v37;
  }
  else
  {
    if (os_variant_has_internal_diagnostics())
    {
      if (os_variant_has_internal_diagnostics())
      {
        double v34 = __UIFaultDebugAssertLog();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT))
        {
          LOWORD(v44.a) = 0;
          _os_log_fault_impl(&dword_1853B0000, v34, OS_LOG_TYPE_FAULT, "Presenting while the highlight platter isn't in a window. If you see this, please file a bug against UIKit | Context Menu with reproduction steps.", (uint8_t *)&v44, 2u);
        }
      }
      else
      {
        v33 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &previewForContinuingToEffectWithPreview____s_category)+ 8);
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          LOWORD(v44.a) = 0;
          _os_log_impl(&dword_1853B0000, v33, OS_LOG_TYPE_ERROR, "Presenting while the highlight platter isn't in a window. If you see this, please file a bug against UIKit | Context Menu with reproduction steps.", (uint8_t *)&v44, 2u);
        }
      }
    }
    v11 = 0;
  }

  return v11;
}

- (void)addCompletion:(id)a3
{
  id v4 = a3;
  completions = self->_completions;
  aBlock = v4;
  if (!completions)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_completions;
    self->_completions = v6;

    id v4 = aBlock;
    completions = self->_completions;
  }
  v8 = _Block_copy(v4);
  [(NSMutableArray *)completions addObject:v8];
}

- (void)_installEffectViews
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __43___UIGravityWellEffect__installEffectViews__block_invoke;
  v2[3] = &unk_1E52D9F70;
  v2[4] = self;
  +[UIView performWithoutAnimation:v2];
}

- (void)_updateToProgress:(double)a3 state:(int64_t)a4
{
  if ([(_UIGravityWellEffect *)self state] != 2)
  {
    [(_UIGravityWellEffect *)self effectProgress];
    if (vabdd_f64(v8, a3) > 2.22044605e-16 || [(_UIGravityWellEffect *)self state] != a4)
    {
      [(_UIGravityWellEffect *)self setEffectProgress:a3];
      [(_UIGravityWellEffect *)self setState:a4];
      v9 = [(_UIGravityWellEffect *)self primaryBody];
      [v9 positionInPrimaryContainer];
      uint64_t v11 = v10;
      uint64_t v13 = v12;
      uint64_t v15 = v14;
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __48___UIGravityWellEffect__updateToProgress_state___block_invoke;
      aBlock[3] = &unk_1E52E69B8;
      void aBlock[4] = self;
      id v16 = v9;
      id v26 = v16;
      double v27 = a3;
      uint64_t v28 = v11;
      uint64_t v29 = v13;
      uint64_t v30 = v15;
      long long v17 = _Block_copy(aBlock);
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __48___UIGravityWellEffect__updateToProgress_state___block_invoke_2;
      v24[3] = &unk_1E52E69E0;
      v24[4] = self;
      v24[5] = a2;
      long long v18 = _Block_copy(v24);
      long long v19 = [v16 effectView];
      v20 = [v19 traitCollection];
      uint64_t v21 = [v20 userInterfaceIdiom];

      uint64_t v22 = [(_UIGravityWellEffect *)self _effectSpringBehavior];
      if (v21 == 6)
      {
        uint64_t v23 = [(_UIGravityWellEffect *)self _criticallyDampedEffectSpringBehavior];

        uint64_t v22 = (void *)v23;
      }
      +[UIView _animateUsingSpringBehavior:v22 tracking:0 animations:v17 completion:v18];
    }
  }
}

- (void)_tearDownEffectViews
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = [(_UIGravityWellEffect *)self primaryBody];
  id v4 = [v3 anchorView];
  [v4 removeFromSuperview];

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  int64_t v5 = [(_UIGravityWellEffect *)self secondaryBodies];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = [*(id *)(*((void *)&v11 + 1) + 8 * v9) anchorView];
        [v10 removeFromSuperview];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)_performAllCompletions
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = [(_UIGravityWellEffect *)self completions];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v7 + 1) + 8 * v6++) + 16))();
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (id)_effectSpringBehavior
{
  v2 = (void *)_effectSpringBehavior___behavior;
  if (!_effectSpringBehavior___behavior)
  {
    uint64_t v3 = +[UIViewSpringAnimationBehavior behaviorWithDampingRatio:0.6 response:0.4];
    uint64_t v4 = (void *)_effectSpringBehavior___behavior;
    _effectSpringBehavior___behavior = v3;

    v2 = (void *)_effectSpringBehavior___behavior;
  }
  return v2;
}

- (id)_criticallyDampedEffectSpringBehavior
{
  v2 = (void *)_criticallyDampedEffectSpringBehavior___behavior;
  if (!_criticallyDampedEffectSpringBehavior___behavior)
  {
    uint64_t v3 = +[UIViewSpringAnimationBehavior behaviorWithDampingRatio:1.0 response:0.4];
    uint64_t v4 = (void *)_criticallyDampedEffectSpringBehavior___behavior;
    _criticallyDampedEffectSpringBehavior___behavior = v3;

    v2 = (void *)_criticallyDampedEffectSpringBehavior___behavior;
  }
  return v2;
}

- (_UIContentEffectDescriptor)descriptor
{
  return self->_descriptor;
}

- (UITargetedPreview)continuationPreview
{
  return self->_continuationPreview;
}

- (void)setContinuationPreview:(id)a3
{
}

- (_UIGravityWellEffectBody)primaryBody
{
  return self->_primaryBody;
}

- (void)setPrimaryBody:(id)a3
{
}

- (NSArray)secondaryBodies
{
  return self->_secondaryBodies;
}

- (void)setSecondaryBodies:(id)a3
{
}

- (NSMutableArray)completions
{
  return self->_completions;
}

- (unint64_t)animationCount
{
  return self->_animationCount;
}

- (void)setAnimationCount:(unint64_t)a3
{
  self->_animationCount = a3;
}

- (double)effectProgress
{
  return self->_effectProgress;
}

- (void)setEffectProgress:(double)a3
{
  self->_effectProgress = a3;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (double)baseZOffset
{
  return self->_baseZOffset;
}

- (void)setBaseZOffset:(double)a3
{
  self->_baseZOffset = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completions, 0);
  objc_storeStrong((id *)&self->_secondaryBodies, 0);
  objc_storeStrong((id *)&self->_primaryBody, 0);
  objc_storeStrong((id *)&self->_continuationPreview, 0);
  objc_storeStrong((id *)&self->_descriptor, 0);
}

@end