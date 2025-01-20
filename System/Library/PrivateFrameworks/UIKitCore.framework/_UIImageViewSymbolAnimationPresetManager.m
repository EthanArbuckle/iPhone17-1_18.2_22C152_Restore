@interface _UIImageViewSymbolAnimationPresetManager
+ (id)managerForClient:(id)a3;
- (BOOL)_symbolEffect:(id)a3 collidesWithSymbolEffect:(id)a4 forAddingEffect:(BOOL)a5;
- (BOOL)hasPendingAnimationsForImage:(id)a3;
- (BOOL)hasPendingContentTransition;
- (_UIImageViewSymbolAnimationPresetClient)client;
- (_UIImageViewSymbolAnimationPresetManager)init;
- (id)pendingSymbolContentTransitionForSettingSymbolImage:(id)a3;
- (void)_activateActiveSymbolEffectEntry:(id)a3;
- (void)_removeSymbolEffectsOfType:(id)a3 options:(id)a4 animated:(BOOL)a5 completion:(id)a6 forAddingNewEffect:(BOOL)a7;
- (void)activatePendingSymbolContentTransition:(id)a3;
- (void)activatePendingSymbolEffects;
- (void)activeSymbolContentTransitionDidComplete:(id)a3;
- (void)activeSymbolEffectDidComplete:(id)a3;
- (void)addActiveSymbolEffect:(id)a3 options:(id)a4 animated:(BOOL)a5 completion:(id)a6;
- (void)addPendingSymbolContentTransition:(id)a3 fromSymbolImage:(id)a4 toSymbolImage:(id)a5 options:(id)a6 completion:(id)a7;
- (void)addPendingSymbolEffect:(id)a3 options:(id)a4 animated:(BOOL)a5 completion:(id)a6;
- (void)discardPendingSymbolContentTransitions;
- (void)removeAllSymbolEffectsWithOptions:(id)a3 animated:(BOOL)a4;
- (void)removeSymbolEffectsOfType:(id)a3 options:(id)a4 animated:(BOOL)a5 completion:(id)a6;
- (void)setClient:(id)a3;
@end

@implementation _UIImageViewSymbolAnimationPresetManager

- (void)discardPendingSymbolContentTransitions
{
  v5 = self->_pendingSymbolContentTransition;
  pendingSymbolContentTransition = self->_pendingSymbolContentTransition;
  self->_pendingSymbolContentTransition = 0;

  if (v5)
  {
    v4 = [(_UIImageViewSymbolAnimationPresetManager *)self client];
    [v4 animationPresetManager:self didDiscardPendingContentTransition:v5];
  }
}

- (BOOL)hasPendingContentTransition
{
  return self->_pendingSymbolContentTransition != 0;
}

- (_UIImageViewSymbolAnimationPresetManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)_UIImageViewSymbolAnimationPresetManager;
  v2 = [(_UIImageViewSymbolAnimationPresetManager *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
    activeSymbolEffects = v2->_activeSymbolEffects;
    v2->_activeSymbolEffects = (NSMutableArray *)v3;

    uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
    pendingSymbolEffects = v2->_pendingSymbolEffects;
    v2->_pendingSymbolEffects = (NSMutableArray *)v5;
  }
  return v2;
}

- (BOOL)hasPendingAnimationsForImage:(id)a3
{
  id v4 = a3;
  if ([(NSMutableArray *)self->_pendingSymbolEffects count])
  {
    char v5 = 1;
  }
  else
  {
    pendingSymbolContentTransition = self->_pendingSymbolContentTransition;
    if (pendingSymbolContentTransition)
    {
      id v7 = [(_UIImageViewPendingSymbolContentTransition *)pendingSymbolContentTransition targetSymbolImage];
      id v8 = v4;
      v9 = v8;
      if (v7 == v8)
      {
        char v5 = 1;
      }
      else
      {
        char v5 = 0;
        if (v8 && v7) {
          char v5 = [v7 isEqual:v8];
        }
      }
    }
    else
    {
      char v5 = 0;
    }
  }

  return v5;
}

+ (id)managerForClient:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  [v4 setClient:v3];

  return v4;
}

- (void)setClient:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_client);
  objc_storeStrong((id *)&self->_pendingSymbolContentTransition, 0);
  objc_storeStrong((id *)&self->_activeSymbolContentTransition, 0);
  objc_storeStrong((id *)&self->_pendingSymbolEffects, 0);
  objc_storeStrong((id *)&self->_activeSymbolEffects, 0);
}

- (void)addActiveSymbolEffect:(id)a3 options:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
  BOOL v6 = a5;
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  [(_UIImageViewSymbolAnimationPresetManager *)self _removeSymbolEffectsOfType:v12 options:v11 animated:v6 completion:0 forAddingNewEffect:1];
  id v13 = (id)objc_opt_new();
  [v13 setSymbolEffect:v12];

  [v13 setOptions:v11];
  [v13 setAnimated:v6];
  [v13 setCompletionHandler:v10];

  [(NSMutableArray *)self->_activeSymbolEffects addObject:v13];
  [(_UIImageViewSymbolAnimationPresetManager *)self _activateActiveSymbolEffectEntry:v13];
}

- (void)addPendingSymbolEffect:(id)a3 options:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
  BOOL v6 = a5;
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  [(_UIImageViewSymbolAnimationPresetManager *)self _removeSymbolEffectsOfType:v12 options:v11 animated:v6 completion:0 forAddingNewEffect:1];
  id v13 = (id)objc_opt_new();
  [v13 setSymbolEffect:v12];

  [v13 setOptions:v11];
  [v13 setAnimated:v6];
  [v13 setCompletionHandler:v10];

  [(NSMutableArray *)self->_pendingSymbolEffects addObject:v13];
}

- (void)activatePendingSymbolEffects
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)[(NSMutableArray *)self->_pendingSymbolEffects copy];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v10 + 1) + 8 * v8);
        -[NSMutableArray removeObjectAtIndex:](self->_pendingSymbolEffects, "removeObjectAtIndex:", 0, (void)v10);
        [(NSMutableArray *)self->_activeSymbolEffects addObject:v9];
        [(_UIImageViewSymbolAnimationPresetManager *)self _activateActiveSymbolEffectEntry:v9];
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (void)_activateActiveSymbolEffectEntry:(id)a3
{
  id v17 = a3;
  id v4 = [v17 symbolEffect];
  uint64_t v5 = [v4 _effectType];

  if ((unint64_t)(v5 - 5) >= 2)
  {
    if (v5 == 4)
    {
      uint64_t v9 = [v17 symbolEffect];
      if ([v9 _level] == 2) {
        uint64_t v14 = 0xFFFFFFFFLL;
      }
      else {
        uint64_t v14 = 1;
      }
      long long v10 = [(_UIImageViewSymbolAnimationPresetManager *)self client];
      long long v11 = [v17 options];
      uint64_t v15 = [v17 animated];
      long long v13 = [v17 completionHandler];
      [v10 animationPresetManager:self didSetScale:v14 usingEffect:v9 options:v11 animated:v15 completion:v13];
    }
    else
    {
      uint64_t v9 = [(_UIImageViewSymbolAnimationPresetManager *)self client];
      long long v10 = [v17 symbolEffect];
      long long v11 = [v17 options];
      uint64_t v16 = [v17 animated];
      long long v13 = [v17 completionHandler];
      [v9 animationPresetManager:self didActivateEffect:v10 options:v11 animated:v16 completion:v13];
    }
  }
  else
  {
    uint64_t v6 = [v17 symbolEffect];
    uint64_t v7 = [v6 _effectType];

    BOOL v8 = v7 == 6;
    uint64_t v9 = [(_UIImageViewSymbolAnimationPresetManager *)self client];
    long long v10 = [v17 symbolEffect];
    long long v11 = [v17 options];
    uint64_t v12 = [v17 animated];
    long long v13 = [v17 completionHandler];
    [v9 animationPresetManager:self didSetHiddenness:v8 usingEffect:v10 options:v11 animated:v12 completion:v13];
  }
}

- (void)activeSymbolEffectDidComplete:(id)a3
{
  id v4 = a3;
  activeSymbolEffects = self->_activeSymbolEffects;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __74___UIImageViewSymbolAnimationPresetManager_activeSymbolEffectDidComplete___block_invoke;
  v11[3] = &unk_1E5308598;
  id v6 = v4;
  id v12 = v6;
  uint64_t v7 = [(NSMutableArray *)activeSymbolEffects indexOfObjectPassingTest:v11];
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v8 = v7;
    uint64_t v9 = [(NSMutableArray *)self->_activeSymbolEffects objectAtIndexedSubscript:v7];
    long long v10 = [v9 symbolEffect];

    if ((unint64_t)([v10 _effectType] - 4) >= 3) {
      [(NSMutableArray *)self->_activeSymbolEffects removeObjectAtIndex:v8];
    }
  }
}

- (void)removeSymbolEffectsOfType:(id)a3 options:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
}

- (void)_removeSymbolEffectsOfType:(id)a3 options:(id)a4 animated:(BOOL)a5 completion:(id)a6 forAddingNewEffect:(BOOL)a7
{
  BOOL v9 = a5;
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  pendingSymbolEffects = self->_pendingSymbolEffects;
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __118___UIImageViewSymbolAnimationPresetManager__removeSymbolEffectsOfType_options_animated_completion_forAddingNewEffect___block_invoke;
  v37[3] = &unk_1E53085C0;
  v37[4] = self;
  id v16 = v12;
  id v38 = v16;
  BOOL v39 = a7;
  uint64_t v17 = [(NSMutableArray *)pendingSymbolEffects indexOfObjectPassingTest:v37];
  if (v17 == 0x7FFFFFFFFFFFFFFFLL)
  {
    activeSymbolEffects = self->_activeSymbolEffects;
    uint64_t v30 = MEMORY[0x1E4F143A8];
    uint64_t v31 = 3221225472;
    v32 = __118___UIImageViewSymbolAnimationPresetManager__removeSymbolEffectsOfType_options_animated_completion_forAddingNewEffect___block_invoke_2;
    v33 = &unk_1E53085C0;
    v34 = self;
    id v35 = v16;
    BOOL v36 = a7;
    uint64_t v19 = [(NSMutableArray *)activeSymbolEffects indexOfObjectPassingTest:&v30];
    if (v19 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v20 = v19;
      v21 = -[NSMutableArray objectAtIndexedSubscript:](self->_activeSymbolEffects, "objectAtIndexedSubscript:", v19, v30, v31, v32, v33, v34);
      [(NSMutableArray *)self->_activeSymbolEffects removeObjectAtIndex:v20];
      if (!a7)
      {
        v22 = [v21 symbolEffect];
        uint64_t v23 = [v22 _effectType];

        if ((unint64_t)(v23 - 5) >= 2)
        {
          if (v23 == 4)
          {
            v24 = [v21 symbolEffect];
            v25 = [(_UIImageViewSymbolAnimationPresetManager *)self client];
            [v25 animationPresetManager:self didSetScale:0 usingEffect:v24 options:v13 animated:v9 completion:v14];
          }
          else
          {
            v24 = [(_UIImageViewSymbolAnimationPresetManager *)self client];
            v25 = [v21 symbolEffect];
            [v24 animationPresetManager:self didRemoveEffect:v25 options:v13 animated:v9 completion:v14 wasActive:1];
          }
        }
        else
        {
          v24 = [(_UIImageViewSymbolAnimationPresetManager *)self client];
          v25 = [v21 symbolEffect];
          [v24 animationPresetManager:self didSetHiddenness:0 usingEffect:v25 options:v13 animated:v9 completion:v14];
        }
      }
    }
  }
  else
  {
    uint64_t v26 = v17;
    v27 = [(NSMutableArray *)self->_pendingSymbolEffects objectAtIndexedSubscript:v17];
    [(NSMutableArray *)self->_pendingSymbolEffects removeObjectAtIndex:v26];
    v28 = [(_UIImageViewSymbolAnimationPresetManager *)self client];
    v29 = [v27 symbolEffect];
    [v28 animationPresetManager:self didRemoveEffect:v29 options:v13 animated:v9 completion:v14 wasActive:0];
  }
}

- (void)removeAllSymbolEffectsWithOptions:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [(NSMutableArray *)self->_pendingSymbolEffects arrayByAddingObjectsFromArray:self->_activeSymbolEffects];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = [*(id *)(*((void *)&v13 + 1) + 8 * v11) symbolEffect];
        [(_UIImageViewSymbolAnimationPresetManager *)self removeSymbolEffectsOfType:v12 options:v6 animated:v4 completion:0];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }
}

- (BOOL)_symbolEffect:(id)a3 collidesWithSymbolEffect:(id)a4 forAddingEffect:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  id v8 = a4;
  if ((unint64_t)([v7 _effectType] - 5) > 1 || !v5)
  {
    uint64_t v10 = [v7 _effectType];
    uint64_t v11 = [v8 _effectType];
LABEL_10:
    BOOL v12 = v10 == v11;
    goto LABEL_11;
  }
  if ([v8 _effectType] != 5)
  {
    uint64_t v10 = [v8 _effectType];
    uint64_t v11 = 6;
    goto LABEL_10;
  }
  BOOL v12 = 1;
LABEL_11:

  return v12;
}

- (void)addPendingSymbolContentTransition:(id)a3 fromSymbolImage:(id)a4 toSymbolImage:(id)a5 options:(id)a6 completion:(id)a7
{
  id v8 = +[_UIImageViewPendingSymbolContentTransition transitionWithTransition:a3 sourceSymbolImage:a4 targetSymbolImage:a5 options:a6 completion:a7];
  pendingSymbolContentTransition = self->_pendingSymbolContentTransition;
  self->_pendingSymbolContentTransition = v8;
}

- (id)pendingSymbolContentTransitionForSettingSymbolImage:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(_UIImageViewPendingSymbolContentTransition *)self->_pendingSymbolContentTransition targetSymbolImage];
  id v6 = v4;
  id v7 = v5;
  if (v7 == v6)
  {

    goto LABEL_7;
  }
  id v8 = v7;
  if (v6 && v7)
  {
    int v9 = [v6 isEqual:v7];

    if (!v9) {
      goto LABEL_9;
    }
LABEL_7:
    uint64_t v10 = self->_pendingSymbolContentTransition;
    goto LABEL_10;
  }

LABEL_9:
  uint64_t v10 = 0;
LABEL_10:

  return v10;
}

- (void)activatePendingSymbolContentTransition:(id)a3
{
  id v4 = (_UIImageViewPendingSymbolContentTransition *)a3;
  if (self->_pendingSymbolContentTransition == v4)
  {
    self->_pendingSymbolContentTransition = 0;
    id v7 = v4;

    BOOL v5 = [(_UIImageViewPendingSymbolContentTransition *)v7 symbolContentTransition];
    activeSymbolContentTransition = self->_activeSymbolContentTransition;
    self->_activeSymbolContentTransition = v5;

    id v4 = v7;
  }
}

- (void)activeSymbolContentTransitionDidComplete:(id)a3
{
  id v4 = a3;
  activeSymbolContentTransition = self->_activeSymbolContentTransition;
  id v6 = (NSSymbolContentTransition *)v4;
  id v8 = v6;
  if (activeSymbolContentTransition == v6)
  {

    goto LABEL_7;
  }
  if (!v6 || !activeSymbolContentTransition)
  {

    goto LABEL_9;
  }
  int v7 = [(NSSymbolContentTransition *)activeSymbolContentTransition isEqual:v6];

  if (v7)
  {
LABEL_7:
    activeSymbolContentTransition = self->_activeSymbolContentTransition;
    self->_activeSymbolContentTransition = 0;
LABEL_9:
  }
}

- (_UIImageViewSymbolAnimationPresetClient)client
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_client);
  return (_UIImageViewSymbolAnimationPresetClient *)WeakRetained;
}

@end