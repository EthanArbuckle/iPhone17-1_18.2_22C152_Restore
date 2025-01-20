@interface UIDynamicAnimator
+ (id)_allDynamicAnimators;
+ (void)_clearReferenceViewFromAnimators:(id)a3;
+ (void)_referenceViewSizeChanged:(id)a3;
+ (void)_registerAnimator:(id)a3;
+ (void)_unregisterAnimator:(id)a3;
+ (void)initialize;
- (BOOL)_alwaysDisableDisplayLink;
- (BOOL)_animatorStep:(double)a3;
- (BOOL)_containsBehavior:(id)a3;
- (BOOL)_isWorldActive;
- (BOOL)isDebugEnabled;
- (BOOL)isSettling;
- (CGRect)_referenceSystemBounds;
- (NSArray)behaviors;
- (NSArray)itemsInRect:(CGRect)rect;
- (NSTimeInterval)elapsedTime;
- (UICollectionViewLayoutAttributes)layoutAttributesForCellAtIndexPath:(NSIndexPath *)indexPath;
- (UICollectionViewLayoutAttributes)layoutAttributesForDecorationViewOfKind:(NSString *)decorationViewKind atIndexPath:(NSIndexPath *)indexPath;
- (UICollectionViewLayoutAttributes)layoutAttributesForSupplementaryViewOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath;
- (UIDynamicAnimator)init;
- (UIDynamicAnimator)initWithReferenceView:(UIView *)view;
- (UIDynamicAnimatorTicker)ticker;
- (UIView)referenceView;
- (double)_animatorInterval;
- (double)_ptmRatio;
- (double)_realElapsedTime;
- (double)_speed;
- (double)settlingAngularVelocityThreshold;
- (double)settlingDuration;
- (double)settlingLinearVelocityThreshold;
- (id)_bodyForItem:(id)a3;
- (id)_delegate;
- (id)_keyForItem:(id)a3;
- (id)_newBodyForItem:(id)a3 inItemGroup:(id)a4;
- (id)_referenceSystem;
- (id)_registerBodyForItem:(id)a3;
- (id)_world;
- (id)delegate;
- (id)description;
- (id)recursiveDescription;
- (int)_debugInterval;
- (int)_registerCollisionGroup;
- (int64_t)_ticks;
- (unint64_t)_animatorIntegralization;
- (unint64_t)_referenceSystemType;
- (unint64_t)debugFrameInterval;
- (void)_activateUIUpdateSequenceItem;
- (void)_checkBehavior:(id)a3;
- (void)_clearReferenceView;
- (void)_configureUpdateRequestFrameRateForSettling:(BOOL)a3;
- (void)_deactivateUIUpdateSequenceItem;
- (void)_defaultMapper:(id)a3 position:(CGPoint)a4 angle:(double)a5 itemType:(unint64_t)a6;
- (void)_evaluateLocalBehaviors;
- (void)_invalidateCollectionViewLayout:(id)a3;
- (void)_performAnimationTickForTimestamp:(double)a3;
- (void)_postSolverStep;
- (void)_preSolverStep;
- (void)_reevaluateImplicitBounds;
- (void)_registerBehavior:(id)a3;
- (void)_registerFieldCategoryForFieldBehavior:(id)a3;
- (void)_registerImplicitBounds;
- (void)_reportBeginContacts;
- (void)_reportEndContacts;
- (void)_runBlockPostSolverIfNeeded:(id)a3;
- (void)_setAction:(id)a3;
- (void)_setAlwaysDisableDisplayLink:(BOOL)a3;
- (void)_setAnimatorIntegralization:(unint64_t)a3;
- (void)_setDebugInterval:(int)a3;
- (void)_setReferenceSystem:(id)a3;
- (void)_setRunning:(BOOL)a3;
- (void)_setSpeed:(double)a3;
- (void)_setupWorld;
- (void)_shouldReevaluateLocalBehaviors;
- (void)_start;
- (void)_stop;
- (void)_tickle;
- (void)_traverseBehaviorHierarchy:(id)a3;
- (void)_unregisterBehavior:(id)a3;
- (void)_unregisterBodyForItem:(id)a3 action:(id)a4;
- (void)_unregisterCollisionGroup;
- (void)_unregisterFieldCategoryForFieldBehavior:(id)a3;
- (void)_unregisterImplicitBounds;
- (void)_updateRequestedFrameRateIfNeeded;
- (void)addBehavior:(UIDynamicBehavior *)behavior;
- (void)dealloc;
- (void)didBeginContact:(id)a3;
- (void)didEndContact:(id)a3;
- (void)removeAllBehaviors;
- (void)removeBehavior:(UIDynamicBehavior *)behavior;
- (void)setDebugEnabled:(BOOL)a3;
- (void)setDebugFrameInterval:(unint64_t)a3;
- (void)setDelegate:(id)delegate;
- (void)setSettlingAngularVelocityThreshold:(double)a3;
- (void)setSettlingDuration:(double)a3;
- (void)setSettlingLinearVelocityThreshold:(double)a3;
- (void)setTicker:(id)a3;
- (void)updateItemUsingCurrentState:(id)item;
@end

@implementation UIDynamicAnimator

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    _UISetupPhysicsKit();
  }
}

+ (void)_registerAnimator:(id)a3
{
  id v3 = a3;
  v4 = (void *)__dynamicAnimatorsTable;
  id v7 = v3;
  if (!__dynamicAnimatorsTable)
  {
    uint64_t v5 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    v6 = (void *)__dynamicAnimatorsTable;
    __dynamicAnimatorsTable = v5;

    id v3 = v7;
    v4 = (void *)__dynamicAnimatorsTable;
  }
  [v4 addObject:v3];
}

+ (void)_unregisterAnimator:(id)a3
{
  [(id)__dynamicAnimatorsTable removeObject:a3];
  if (![(id)__dynamicAnimatorsTable count])
  {
    id v3 = (void *)__dynamicAnimatorsTable;
    __dynamicAnimatorsTable = 0;
  }
}

- (void)_registerFieldCategoryForFieldBehavior:(id)a3
{
  id v8 = a3;
  if (!-[UIDynamicAnimator _containsBehavior:](self, "_containsBehavior:"))
  {
    uint64_t v4 = [(NSMutableIndexSet *)self->_availableFieldCategories lastIndex];
    if (v4 == 0x7FFFFFFFFFFFFFFFLL)
    {
      [MEMORY[0x1E4F1CA00] raise:@"Invalid Association" format:@"UIDynamicAnimator supports a maximum of 32 distinct fields"];
    }
    else
    {
      char v5 = v4;
      [(NSMutableIndexSet *)self->_availableFieldCategories removeIndex:v4];
      uint64_t v6 = (1 << v5);
      id v7 = [v8 _field];
      [v7 setCategoryBitMask:v6];
    }
  }
}

- (void)_unregisterFieldCategoryForFieldBehavior:(id)a3
{
  id v6 = a3;
  if (-[UIDynamicAnimator _containsBehavior:](self, "_containsBehavior:"))
  {
    uint64_t v4 = [v6 _field];
    unsigned int v5 = [v4 categoryBitMask];

    [(NSMutableIndexSet *)self->_availableFieldCategories addIndex:(unint64_t)log2((double)v5)];
  }
}

- (UIDynamicAnimator)initWithReferenceView:(UIView *)view
{
  uint64_t v4 = view;
  v39.receiver = self;
  v39.super_class = (Class)UIDynamicAnimator;
  unsigned int v5 = [(UIDynamicAnimator *)&v39 init];
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
    id v8 = v4;
    v7->_elapsedTime = 0.0;
    v7->_ticks = 0;
    objc_storeWeak((id *)&v7->_referenceSystem, v8);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7->_referenceSystemType = 1;
      [(UIView *)v8 bounds];
      v7->_referenceSystemBounds.origin.x = v9;
      v7->_referenceSystemBounds.origin.y = v10;
      v7->_referenceSystemBounds.size.width = v11;
      v7->_referenceSystemBounds.size.height = v12;
      if (v8) {
        *((void *)&v8->_viewFlags + 1) |= 0x2000000000uLL;
      }
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v7->_referenceSystemType = 2;
        id WeakRetained = objc_loadWeakRetained((id *)&v7->_referenceSystem);
        [WeakRetained _setDynamicAnimator:v7];

        [(UIView *)v8 _dynamicReferenceBounds];
        v7->_referenceSystemBounds.origin.x = v14;
        v7->_referenceSystemBounds.origin.y = v15;
        v7->_referenceSystemBounds.size.width = v16;
        v7->_referenceSystemBounds.size.height = v17;
      }
      else
      {
        v7->_referenceSystemType = 0;
        id v18 = objc_loadWeakRetained((id *)&v7->_referenceSystem);

        if (v18)
        {
          id v19 = objc_loadWeakRetained((id *)&v7->_referenceSystem);
          [v19 bounds];
          v7->_referenceSystemBounds.origin.x = v20;
          v7->_referenceSystemBounds.origin.y = v21;
          v7->_referenceSystemBounds.size.width = v22;
          v7->_referenceSystemBounds.size.height = v23;
        }
        else
        {
          CGSize v24 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
          v7->_referenceSystemBounds.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
          v7->_referenceSystemBounds.size = v24;
        }
        objc_storeWeak((id *)&v7->_referenceSystem, 0);
      }
    }
    v25 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    registeredBehaviors = v7->_registeredBehaviors;
    v7->_registeredBehaviors = v25;

    v27 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    topLevelBehaviors = v7->_topLevelBehaviors;
    v7->_topLevelBehaviors = v27;

    v29 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    postSolverActions = v7->_postSolverActions;
    v7->_postSolverActions = v29;

    uint64_t v31 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28E60]), "initWithIndexesInRange:", 0, 32);
    availableFieldCategories = v7->_availableFieldCategories;
    v7->_availableFieldCategories = (NSMutableIndexSet *)v31;

    v33 = +[UIScreen mainScreen];
    [v33 scale];
    v7->_accuracy = v34;

    v7->_registeredCollisionGroups = 0;
    v7->_speed = 1.0;
    v7->_debugInterval = 1;
    v35 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    bodies = v7->_bodies;
    v7->_bodies = v35;

    v7->_integralization = [(id)UIApp _isSpringBoard];
    v7->_uiUpdateSequenceItem = 0;
    if ([MEMORY[0x1E4F91408] instancesRespondToSelector:sel_settlingLinearVelocityThreshold])char v37 = 4; {
    else
    }
      char v37 = 0;
    *(unsigned char *)&v7->_stateFlags = *(unsigned char *)&v7->_stateFlags & 0xFB | v37;
    if (pthread_main_np() == 1)
    {
      +[UIDynamicAnimator _registerAnimator:v7];
    }
    else
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = ___commonInitWithReferenceSystem_block_invoke;
      block[3] = &unk_1E52D9F70;
      v41 = v7;
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
  }

  return v6;
}

- (UIDynamicAnimator)init
{
  return [(UIDynamicAnimator *)self initWithReferenceView:0];
}

- (void)_activateUIUpdateSequenceItem
{
  if (_UIUpdateCycleEnabled())
  {
    if (!self->_uiUpdateSequenceItem)
    {
      *(void *)&self->_lastUpdateTime = _currentModelMediaTime;
      *(void *)&self->_updateRequest.minRate = 0;
      *(unint64_t *)((char *)&self->_updateRequest.phase + 4) = 0;
      *(void *)&self->_updateRequest.maxRate = 0;
      HIDWORD(self->_updateRequest.load) = 0;
      self->_updateRequest.flags = 5;
      [(UIDynamicAnimator *)self _configureUpdateRequestFrameRateForSettling:0];
      _UIUpdateRequestRegistryAddRecord((uint64_t)&mainRegistry, (int *)&self->_updateRequest, 0x100035u);
      id v3 = [(UIDynamicAnimator *)self ticker];
      v5[0] = MEMORY[0x1E4F143A8];
      v5[1] = 3221225472;
      v5[2] = __50__UIDynamicAnimator__activateUIUpdateSequenceItem__block_invoke;
      v5[3] = &unk_1E52DC470;
      id v6 = v3;
      id v4 = v3;
      self->_uiUpdateSequenceItem = (_UIUpdateSequenceItemInternal *)_UIUpdateSequenceInsertItem(_UIUpdateSequenceCADisplayLinksItemInternal, 1, (uint64_t)"DynamicAnimator", 0, 0, v5);
    }
  }
}

void __50__UIDynamicAnimator__activateUIUpdateSequenceItem__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_uiUpdateSequenceTick:");
  id v2 = [*(id *)(a1 + 32) animator];
  [v2 _updateRequestedFrameRateIfNeeded];
}

- (void)_deactivateUIUpdateSequenceItem
{
  if (_UIUpdateCycleEnabled())
  {
    uiUpdateSequenceItem = self->_uiUpdateSequenceItem;
    if (uiUpdateSequenceItem)
    {
      int v4 = *((_DWORD *)uiUpdateSequenceItem + 6);
      if (v4) {
        *((_DWORD *)uiUpdateSequenceItem + 6) = v4 | 2;
      }
      else {
        _removeItem(uiUpdateSequenceItem);
      }
      self->_uiUpdateSequenceItem = 0;
      _UIUpdateRequestRegistryRemoveRecord((uint64_t)&mainRegistry, &self->_updateRequest.flags, 0x100035u);
    }
  }
}

- (void)_updateRequestedFrameRateIfNeeded
{
  BOOL v3 = [(UIDynamicAnimator *)self isSettling];
  if (self->_updateRequestIsConfiguredForSettling != v3)
  {
    [(UIDynamicAnimator *)self _configureUpdateRequestFrameRateForSettling:v3];
    _UIUpdateRequestRegistryMutableRequestChanged((uint64_t)&mainRegistry, &self->_updateRequest);
  }
}

- (void)_configureUpdateRequestFrameRateForSettling:(BOOL)a3
{
  if (a3) {
    unsigned int v3 = 30;
  }
  else {
    unsigned int v3 = 80;
  }
  if (a3) {
    unsigned int v4 = 60;
  }
  else {
    unsigned int v4 = 120;
  }
  self->_updateRequest.minRate = v3;
  self->_updateRequest.preferredRate = v4;
  self->_updateRequest.maxRate = v4;
  self->_updateRequestIsConfiguredForSettling = a3;
}

- (void)dealloc
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  objc_storeWeak((id *)&self->_delegate, 0);
  [(UIDynamicAnimator *)self removeAllBehaviors];
  +[UIDynamicAnimator _unregisterAnimator:self];
  if (_UIUpdateCycleEnabled())
  {
    [(UIDynamicAnimator *)self _deactivateUIUpdateSequenceItem];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_displaylink);
    [WeakRetained invalidate];
  }
  unint64_t referenceSystemType = self->_referenceSystemType;
  if (referenceSystemType != 1)
  {
    if (referenceSystemType == 2)
    {
      id v5 = objc_loadWeakRetained((id *)&self->_referenceSystem);
      [v5 _setDynamicAnimator:0];
    }
    goto LABEL_22;
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = (id)__dynamicAnimatorsTable;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (!v7)
  {

LABEL_19:
    CGFloat v14 = objc_loadWeakRetained((id *)&self->_referenceSystem);
    if (v14) {
      v14[13] &= ~0x2000000000uLL;
    }

    goto LABEL_22;
  }
  uint64_t v8 = v7;
  int v9 = 0;
  uint64_t v10 = *(void *)v17;
  do
  {
    for (uint64_t i = 0; i != v8; ++i)
    {
      if (*(void *)v17 != v10) {
        objc_enumerationMutation(v6);
      }
      id v12 = [*(id *)(*((void *)&v16 + 1) + 8 * i) referenceView];
      id v13 = objc_loadWeakRetained((id *)&self->_referenceSystem);

      if (v12 == v13) {
        ++v9;
      }
    }
    uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  }
  while (v8);

  if (!v9) {
    goto LABEL_19;
  }
LABEL_22:
  v15.receiver = self;
  v15.super_class = (Class)UIDynamicAnimator;
  [(UIDynamicAnimator *)&v15 dealloc];
}

+ (void)_referenceViewSizeChanged:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (__dynamicAnimatorsTable)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v4 = (id)__dynamicAnimatorsTable;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v12;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v12 != v7) {
            objc_enumerationMutation(v4);
          }
          int v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
          objc_msgSend(v9, "referenceView", (void)v11);
          id v10 = (id)objc_claimAutoreleasedReturnValue();

          if (v10 == v3) {
            [v9 _tickle];
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v6);
    }
  }
}

+ (void)_clearReferenceViewFromAnimators:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (__dynamicAnimatorsTable)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v4 = (id)__dynamicAnimatorsTable;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v12;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v12 != v7) {
            objc_enumerationMutation(v4);
          }
          int v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
          objc_msgSend(v9, "referenceView", (void)v11);
          id v10 = (id)objc_claimAutoreleasedReturnValue();

          if (v10 == v3) {
            [v9 _clearReferenceView];
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v6);
    }
  }
}

+ (id)_allDynamicAnimators
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4F1CA48] array];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = (id)__dynamicAnimatorsTable;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(v2, "addObject:", *(void *)(*((void *)&v9 + 1) + 8 * i), (void)v9);
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  return v2;
}

- (id)description
{
  id v3 = (void *)MEMORY[0x1E4F28E78];
  v13.receiver = self;
  v13.super_class = (Class)UIDynamicAnimator;
  uint64_t v4 = [(UIDynamicAnimator *)&v13 description];
  uint64_t v5 = [v3 stringWithString:v4];

  if (![(UIDynamicAnimator *)self isRunning]) {
    [v5 appendString:@" Stopped"];
  }
  [(UIDynamicAnimator *)self elapsedTime];
  objc_msgSend(v5, "appendFormat:", @" (%fs)", v6);
  uint64_t v7 = [(UIDynamicAnimator *)self _referenceSystem];
  uint64_t v8 = (objc_class *)objc_opt_class();
  long long v9 = NSStringFromClass(v8);
  long long v10 = [(UIDynamicAnimator *)self _referenceSystem];
  long long v11 = NSStringFromCGRect(self->_referenceSystemBounds);
  [v5 appendFormat:@" in <%@: %p> %@", v9, v10, v11];

  return v5;
}

- (id)recursiveDescription
{
  id v3 = [MEMORY[0x1E4F28E78] string];
  uint64_t v4 = [(UIDynamicAnimator *)self description];
  [v3 appendString:v4];

  [v3 appendString:@"\n"];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __41__UIDynamicAnimator_recursiveDescription__block_invoke;
  aBlock[3] = &unk_1E52EC668;
  id v5 = v3;
  id v10 = v5;
  uint64_t v6 = _Block_copy(aBlock);
  [(UIDynamicAnimator *)self _traverseBehaviorHierarchy:v6];
  id v7 = v5;

  return v7;
}

void __41__UIDynamicAnimator_recursiveDescription__block_invoke(uint64_t a1, void *a2, int a3)
{
  id v8 = a2;
  if (a3 >= 1)
  {
    id v5 = [MEMORY[0x1E4F28E78] string];
    do
    {
      [v5 appendString:@" | "];
      --a3;
    }
    while (a3);
    [*(id *)(a1 + 32) appendString:v5];
  }
  uint64_t v6 = *(void **)(a1 + 32);
  id v7 = [v8 description];
  [v6 appendString:v7];

  [*(id *)(a1 + 32) appendString:@"\n"];
}

- (double)_ptmRatio
{
  PKGet_PTM_RATIO();
  return v2;
}

- (void)addBehavior:(UIDynamicBehavior *)behavior
{
  uint64_t v4 = behavior;
  if (v4)
  {
    uint64_t v6 = v4;
    char v5 = [(NSMutableArray *)self->_topLevelBehaviors containsObject:v4];
    uint64_t v4 = v6;
    if ((v5 & 1) == 0)
    {
      [(UIDynamicAnimator *)self _checkBehavior:v6];
      [(NSMutableArray *)self->_topLevelBehaviors addObject:v6];
      [(UIDynamicAnimator *)self _registerBehavior:v6];
      uint64_t v4 = v6;
    }
  }
}

- (void)removeBehavior:(UIDynamicBehavior *)behavior
{
  uint64_t v4 = behavior;
  if (v4)
  {
    uint64_t v6 = v4;
    int v5 = [(NSMutableArray *)self->_topLevelBehaviors containsObject:v4];
    uint64_t v4 = v6;
    if (v5)
    {
      [(NSMutableArray *)self->_topLevelBehaviors removeObject:v6];
      [(UIDynamicAnimator *)self _unregisterBehavior:v6];
      uint64_t v4 = v6;
    }
  }
}

- (void)_checkBehavior:(id)a3
{
  id v4 = a3;
  if (-[NSMutableSet containsObject:](self->_registeredBehaviors, "containsObject:")) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"Adding the same behavior twice to the same animator is not supported %@", v4 format];
  }
}

- (BOOL)_containsBehavior:(id)a3
{
  return [(NSMutableSet *)self->_registeredBehaviors containsObject:a3];
}

- (void)_registerBehavior:(id)a3
{
  id v4 = a3;
  if (self->_isInWorldStepMethod)
  {
    if ([(NSMutableSet *)self->_behaviorsToRemove containsObject:v4]) {
      [(NSMutableSet *)self->_behaviorsToRemove removeObject:v4];
    }
    if (([(NSMutableSet *)self->_registeredBehaviors containsObject:v4] & 1) == 0)
    {
      behaviorsToAdd = self->_behaviorsToAdd;
      if (behaviorsToAdd)
      {
        [(NSMutableSet *)behaviorsToAdd addObject:v4];
      }
      else
      {
        id v8 = (NSMutableSet *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithObjects:", v4, 0);
        long long v9 = self->_behaviorsToAdd;
        self->_behaviorsToAdd = v8;
      }
    }
  }
  else
  {
    if (!self->_world) {
      [(UIDynamicAnimator *)self _setupWorld];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(UIDynamicAnimator *)self _registerFieldCategoryForFieldBehavior:v4];
    }
    [v4 _setContext:self];
    [v4 willMoveToAnimator:self];
    [v4 _associate];
    [(NSMutableSet *)self->_registeredBehaviors addObject:v4];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(UIDynamicAnimator *)self _shouldReevaluateLocalBehaviors];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v11 = 0;
      long long v12 = (int *)&v11;
      uint64_t v13 = 0x2020000000;
      int v14 = 0;
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __39__UIDynamicAnimator__registerBehavior___block_invoke;
      aBlock[3] = &unk_1E52EC690;
      void aBlock[4] = &v11;
      uint64_t v6 = _Block_copy(aBlock);
      [(UIDynamicAnimator *)self _traverseBehaviorHierarchy:v6];
      if (v12[6] >= 2) {
        NSLog(&cfstr_MultipleGravit.isa);
      }

      _Block_object_dispose(&v11, 8);
    }
    if (self->_registeredCollisionGroups >= 1)
    {
      id v7 = [(PKExtendedPhysicsWorld *)self->_world contactDelegate];

      if (!v7) {
        [(PKExtendedPhysicsWorld *)self->_world setContactDelegate:self];
      }
    }
    [(UIDynamicAnimator *)self _tickle];
  }
}

void __39__UIDynamicAnimator__registerBehavior___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass) {
    ++*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
}

- (void)_unregisterBehavior:(id)a3
{
  id v4 = a3;
  int v5 = v4;
  if (v4)
  {
    id v10 = v4;
    if (!self->_isInWorldStepMethod)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [(UIDynamicAnimator *)self _unregisterFieldCategoryForFieldBehavior:v10];
      }
      [v10 _dissociate];
      [v10 _setContext:0];
      [v10 willMoveToAnimator:0];
      [(NSMutableSet *)self->_registeredBehaviors removeObject:v10];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [(UIDynamicAnimator *)self _shouldReevaluateLocalBehaviors];
      }
      if (!self->_registeredCollisionGroups) {
        [(PKExtendedPhysicsWorld *)self->_world setContactDelegate:0];
      }
      [(UIDynamicAnimator *)self _tickle];
      goto LABEL_16;
    }
    if ([(NSMutableSet *)self->_behaviorsToAdd containsObject:v4]) {
      [(NSMutableSet *)self->_behaviorsToAdd removeObject:v10];
    }
    int v6 = [(NSMutableSet *)self->_registeredBehaviors containsObject:v10];
    int v5 = v10;
    if (v6)
    {
      behaviorsToRemove = self->_behaviorsToRemove;
      if (behaviorsToRemove)
      {
        [(NSMutableSet *)behaviorsToRemove addObject:v10];
      }
      else
      {
        id v8 = (NSMutableSet *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithObjects:", v10, 0);
        long long v9 = self->_behaviorsToRemove;
        self->_behaviorsToRemove = v8;
      }
LABEL_16:
      int v5 = v10;
    }
  }
}

- (void)didBeginContact:(id)a3
{
  id v4 = a3;
  beginContacts = self->_beginContacts;
  id v8 = v4;
  if (!beginContacts)
  {
    int v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v7 = self->_beginContacts;
    self->_beginContacts = v6;

    id v4 = v8;
    beginContacts = self->_beginContacts;
  }
  [(NSMutableArray *)beginContacts addObject:v4];
}

- (void)didEndContact:(id)a3
{
  id v4 = a3;
  endContacts = self->_endContacts;
  id v8 = v4;
  if (!endContacts)
  {
    int v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v7 = self->_endContacts;
    self->_endContacts = v6;

    id v4 = v8;
    endContacts = self->_endContacts;
  }
  [(NSMutableArray *)endContacts addObject:v4];
}

- (void)_reportBeginContacts
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __41__UIDynamicAnimator__reportBeginContacts__block_invoke;
  aBlock[3] = &unk_1E52EC668;
  void aBlock[4] = self;
  id v3 = _Block_copy(aBlock);
  [(UIDynamicAnimator *)self _traverseBehaviorHierarchy:v3];
  beginContacts = self->_beginContacts;
  self->_beginContacts = 0;
}

void __41__UIDynamicAnimator__reportBeginContacts__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v4 = *(id *)(*(void *)(a1 + 32) + 136);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v13;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v13 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void *)(*((void *)&v12 + 1) + 8 * v8);
          id v10 = v3;
          uint64_t v11 = objc_msgSend(v10, "collisionDelegate", (void)v12);

          if (v11) {
            [v10 _didBeginContact:v9];
          }

          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v6);
    }
  }
}

- (void)_reportEndContacts
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __39__UIDynamicAnimator__reportEndContacts__block_invoke;
  aBlock[3] = &unk_1E52EC668;
  void aBlock[4] = self;
  id v3 = _Block_copy(aBlock);
  [(UIDynamicAnimator *)self _traverseBehaviorHierarchy:v3];
  endContacts = self->_endContacts;
  self->_endContacts = 0;
}

void __39__UIDynamicAnimator__reportEndContacts__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v4 = *(id *)(*(void *)(a1 + 32) + 144);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v13;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v13 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void *)(*((void *)&v12 + 1) + 8 * v8);
          id v10 = v3;
          uint64_t v11 = objc_msgSend(v10, "collisionDelegate", (void)v12);

          if (v11) {
            [v10 _didEndContact:v9];
          }

          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v6);
    }
  }
}

- (void)_shouldReevaluateLocalBehaviors
{
  self->_needsLocalBehaviorReevaluation = 1;
  [(UIDynamicAnimator *)self _tickle];
}

- (void)_evaluateLocalBehaviors
{
}

uint64_t __44__UIDynamicAnimator__evaluateLocalBehaviors__block_invoke(uint64_t a1, void *a2)
{
  return [a2 _reevaluate:0];
}

- (void)_reevaluateImplicitBounds
{
  [(UIDynamicAnimator *)self _traverseBehaviorHierarchy:&__block_literal_global_55_0];
  [(UIDynamicAnimator *)self _tickle];
}

uint64_t __46__UIDynamicAnimator__reevaluateImplicitBounds__block_invoke(uint64_t a1, void *a2)
{
  return [a2 _reevaluate:1];
}

- (void)_registerImplicitBounds
{
}

- (void)_unregisterImplicitBounds
{
}

- (void)_traverseBehaviorHierarchy:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v18 = 0;
  long long v19 = &v18;
  uint64_t v20 = 0x2050000000;
  uint64_t v21 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __48__UIDynamicAnimator__traverseBehaviorHierarchy___block_invoke;
  aBlock[3] = &unk_1E52EC6D8;
  id v5 = v4;
  id v16 = v5;
  uint64_t v17 = &v18;
  uint64_t v6 = (void (**)(void *, void, uint64_t))_Block_copy(aBlock);
  v19[3] = (uint64_t)v6;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v7 = [(UIDynamicAnimator *)self behaviors];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v11 objects:v22 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v7);
        }
        v6[2](v6, *(void *)(*((void *)&v11 + 1) + 8 * v10++), 1);
      }
      while (v8 != v10);
      uint64_t v8 = [v7 countByEnumeratingWithState:&v11 objects:v22 count:16];
    }
    while (v8);
  }

  _Block_object_dispose(&v18, 8);
}

void __48__UIDynamicAnimator__traverseBehaviorHierarchy___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v4 = objc_msgSend(v3, "childBehaviors", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        (*(void (**)(void))(*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) + 16))();
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)removeAllBehaviors
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (self->_isInWorldStepMethod)
  {
    behaviorsToRemove = self->_behaviorsToRemove;
    if (behaviorsToRemove)
    {
      registeredBehaviors = self->_registeredBehaviors;
      [(NSMutableSet *)behaviorsToRemove unionSet:registeredBehaviors];
    }
    else
    {
      long long v12 = (NSMutableSet *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithSet:self->_registeredBehaviors];
      long long v13 = self->_behaviorsToRemove;
      self->_behaviorsToRemove = v12;
    }
  }
  else
  {
    uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithSet:self->_registeredBehaviors];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v6 = v5;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          long long v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          objc_msgSend(v11, "_dissociate", (void)v14);
          [v11 _setContext:0];
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            [(UIDynamicAnimator *)self _unregisterFieldCategoryForFieldBehavior:v11];
          }
          [v11 willMoveToAnimator:0];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v8);
    }

    [(NSMutableArray *)self->_topLevelBehaviors removeAllObjects];
    [(NSMutableSet *)self->_registeredBehaviors removeAllObjects];
  }
}

- (NSTimeInterval)elapsedTime
{
  return self->_elapsedTime;
}

- (NSArray)behaviors
{
  return (NSArray *)[MEMORY[0x1E4F1C978] arrayWithArray:self->_topLevelBehaviors];
}

- (int)_registerCollisionGroup
{
  int v2 = self->_registeredCollisionGroups + 1;
  self->_registeredCollisionGroups = v2;
  return v2;
}

- (void)_unregisterCollisionGroup
{
}

- (void)_setAnimatorIntegralization:(unint64_t)a3
{
  self->_integralization = a3;
}

- (unint64_t)_animatorIntegralization
{
  return self->_integralization;
}

- (void)_defaultMapper:(id)a3 position:(CGPoint)a4 angle:(double)a5 itemType:(unint64_t)a6
{
  double y = a4.y;
  double x = a4.x;
  id v11 = a3;
  if (a6 == 1 && self->_referenceSystemType == 1)
  {
    long long v12 = [(UIDynamicAnimator *)self referenceView];
    long long v13 = [v11 superview];
    objc_msgSend(v12, "convertPoint:toView:", v13, x, y);
    double x = v14;
    double y = v15;
  }
  unint64_t integralization = self->_integralization;
  uint64_t v17 = 1;
  if (!a6) {
    uint64_t v17 = 2;
  }
  if (!integralization) {
    unint64_t integralization = v17;
  }
  switch(integralization)
  {
    case 4uLL:
      accuracdouble y = self->_accuracy;
      if (accuracy == 1.0)
      {
        double x = round(x);
      }
      else
      {
        double v22 = floor(x);
        double x = v22 + round((x - v22) * accuracy) / accuracy;
      }
      goto LABEL_23;
    case 3uLL:
      double v23 = self->_accuracy;
      if (v23 != 1.0)
      {
LABEL_19:
        double v25 = floor(y);
        double y = v25 + round((y - v25) * v23) / v23;
        goto LABEL_23;
      }
      break;
    case 2uLL:
      objc_msgSend(v11, "setCenter:", x, y);
      uint64_t v18 = v29;
      uint64_t v19 = (CGAffineTransform *)v29;
      double v20 = a5;
      goto LABEL_27;
    default:
      double v23 = self->_accuracy;
      if (v23 != 1.0)
      {
        double v24 = floor(x);
        double x = v24 + round((x - v24) * v23) / v23;
        goto LABEL_19;
      }
      double x = round(x);
      break;
  }
  double y = round(y);
LABEL_23:
  [v11 center];
  if (v27 != x || v26 != y) {
    objc_msgSend(v11, "setCenter:", x, y);
  }
  double v20 = round(a5 * 5000.0) / 5000.0;
  uint64_t v18 = v28;
  uint64_t v19 = (CGAffineTransform *)v28;
LABEL_27:
  CGAffineTransformMakeRotation(v19, v20);
  [v11 setTransform:v18];
}

- (void)_unregisterBodyForItem:(id)a3 action:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void *))a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    if (self->_referenceSystemType != 2) {
      goto LABEL_8;
    }
    uint64_t v8 = @"Can't use view as item (%@) in an animator with layout reference %@";
  }
  else
  {
    if (self->_referenceSystemType != 1) {
      goto LABEL_8;
    }
    uint64_t v8 = @"Can't use layout attributes as item (%@) in an animator with view reference %@";
  }
  objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3C8], v8, v6, self);
LABEL_8:
  bodies = self->_bodies;
  long long v10 = [(UIDynamicAnimator *)self _keyForItem:v6];
  id v11 = [(NSMutableDictionary *)bodies objectForKey:v10];

  if (v11)
  {
    id v12 = [v11 representedObject];

    if (v12 != v6) {
      NSLog(&cfstr_BodyWithoutRep.isa, self, v11, v6);
    }
    if ([v11 dissociate])
    {
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __51__UIDynamicAnimator__unregisterBodyForItem_action___block_invoke;
      v13[3] = &unk_1E52DCB30;
      v13[4] = self;
      id v14 = v11;
      id v15 = v6;
      [(UIDynamicAnimator *)self _runBlockPostSolverIfNeeded:v13];
    }
    else if (v7)
    {
      v7[2](v7, v11);
    }
  }
}

uint64_t __51__UIDynamicAnimator__unregisterBodyForItem_action___block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) _world];
  [v2 removeBody:*(void *)(a1 + 40)];

  id v3 = *(void **)(a1 + 32);
  id v4 = (void *)v3[10];
  uint64_t v5 = [v3 _keyForItem:*(void *)(a1 + 48)];
  [v4 removeObjectForKey:v5];

  id v6 = *(void **)(a1 + 32);
  return [v6 _tickle];
}

- (NSArray)itemsInRect:(CGRect)rect
{
  double height = rect.size.height;
  double width = rect.size.width;
  double y = rect.origin.y;
  double x = rect.origin.x;
  uint64_t v8 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v9 = [(UIDynamicAnimator *)self _world];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __33__UIDynamicAnimator_itemsInRect___block_invoke;
  v12[3] = &unk_1E52EC700;
  id v10 = v8;
  id v13 = v10;
  objc_msgSend(v9, "enumerateBodiesInRect:usingBlock:", v12, x, y, width, height);

  return (NSArray *)v10;
}

void __33__UIDynamicAnimator_itemsInRect___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 representedObject];
  if (v3)
  {
    id v4 = v3;
    [*(id *)(a1 + 32) addObject:v3];
    id v3 = v4;
  }
}

- (UICollectionViewLayoutAttributes)layoutAttributesForSupplementaryViewOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
  if (self->_referenceSystemType == 2)
  {
    uint64_t v5 = +[_UICollectionViewItemKey collectionItemKeyForSupplementaryViewOfKind:andIndexPath:]((uint64_t)_UICollectionViewItemKey, kind, indexPath);
    id v6 = [(NSMutableDictionary *)self->_bodies objectForKey:v5];
    uint64_t v7 = [v6 representedObject];
  }
  else
  {
    uint64_t v7 = 0;
  }
  return (UICollectionViewLayoutAttributes *)v7;
}

- (UICollectionViewLayoutAttributes)layoutAttributesForDecorationViewOfKind:(NSString *)decorationViewKind atIndexPath:(NSIndexPath *)indexPath
{
  if (self->_referenceSystemType == 2)
  {
    uint64_t v5 = +[_UICollectionViewItemKey collectionItemKeyForDecorationViewOfKind:andIndexPath:]((uint64_t)_UICollectionViewItemKey, decorationViewKind, indexPath);
    id v6 = [(NSMutableDictionary *)self->_bodies objectForKey:v5];
    uint64_t v7 = [v6 representedObject];
  }
  else
  {
    uint64_t v7 = 0;
  }
  return (UICollectionViewLayoutAttributes *)v7;
}

- (UICollectionViewLayoutAttributes)layoutAttributesForCellAtIndexPath:(NSIndexPath *)indexPath
{
  if (self->_referenceSystemType == 2)
  {
    id v4 = +[_UICollectionViewItemKey collectionItemKeyForCellWithIndexPath:]((uint64_t)_UICollectionViewItemKey, indexPath);
    uint64_t v5 = [(NSMutableDictionary *)self->_bodies objectForKey:v4];
    id v6 = [v5 representedObject];
  }
  else
  {
    id v6 = 0;
  }
  return (UICollectionViewLayoutAttributes *)v6;
}

- (void)updateItemUsingCurrentState:(id)item
{
  id v4 = item;
  uint64_t v5 = [(UIDynamicAnimator *)self _bodyForItem:v4];
  if (!v5) {
    goto LABEL_50;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    char v16 = objc_opt_isKindOfClass() ^ 1;
    goto LABEL_8;
  }
  if (self->_referenceSystemType != 1)
  {
    char v16 = 0;
LABEL_8:
    [v4 center];
    double v13 = v19;
    double v15 = v20;
    if (!v4) {
      goto LABEL_5;
    }
LABEL_9:
    [v4 transform];
    long double v18 = *((double *)&v60 + 1);
    [v4 transform];
    long double v17 = *(double *)&__x;
    goto LABEL_10;
  }
  id v6 = [(UIDynamicAnimator *)self referenceView];
  [v4 center];
  double v8 = v7;
  double v10 = v9;
  id v11 = [v4 superview];
  objc_msgSend(v6, "convertPoint:fromView:", v11, v8, v10);
  double v13 = v12;
  double v15 = v14;

  char v16 = 0;
  if (v4) {
    goto LABEL_9;
  }
LABEL_5:
  long long v61 = 0u;
  long long v62 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  __double x = 0u;
  long long v58 = 0u;
  long double v17 = 0.0;
  long double v18 = 0.0;
LABEL_10:
  double v21 = atan2(v18, v17);
  unint64_t integralization = self->_integralization;
  uint64_t v23 = 1;
  if (v16) {
    uint64_t v23 = 2;
  }
  if (!integralization) {
    unint64_t integralization = v23;
  }
  switch(integralization)
  {
    case 4uLL:
      accuracdouble y = self->_accuracy;
      [v5 position];
      if (accuracy == 1.0)
      {
        double v28 = round(v25);
      }
      else
      {
        double v26 = floor(v25);
        [v5 position];
        double v28 = v26 + round(self->_accuracy * (v27 - v26)) / self->_accuracy;
      }
      objc_msgSend(v5, "position", __x, v58, v59, v60, v61, v62);
      double v35 = v41;
      double v42 = self->_accuracy;
      if (v42 == 1.0)
      {
        double v44 = round(v13);
      }
      else
      {
        double v43 = floor(v13);
        double v44 = v43 + round((v13 - v43) * v42) / v42;
      }
      double v46 = v15;
      break;
    case 3uLL:
      [v5 position];
      double v28 = v29;
      double v30 = self->_accuracy;
      [v5 position];
      if (v30 == 1.0)
      {
        double v35 = round(v31);
        double v34 = self->_accuracy;
      }
      else
      {
        double v32 = floor(v31);
        [v5 position];
        double v34 = self->_accuracy;
        double v35 = v32 + round(v34 * (v33 - v32)) / v34;
      }
      if (v34 == 1.0)
      {
        double v46 = round(v15);
      }
      else
      {
        double v45 = floor(v15);
        double v46 = v45 + round((v15 - v45) * v34) / v34;
      }
      double v44 = v13;
      break;
    case 2uLL:
      objc_msgSend(v5, "setPosition:", v13, v15);
      [v5 setRotation:v21];
LABEL_49:
      objc_msgSend(v5, "setResting:", 0, (void)__x);
      [(UIDynamicAnimator *)self _tickle];
      goto LABEL_50;
    default:
      double v36 = self->_accuracy;
      [v5 position];
      if (v36 == 1.0)
      {
        double v28 = round(v37);
        double v40 = self->_accuracy;
      }
      else
      {
        double v38 = floor(v37);
        [v5 position];
        double v40 = self->_accuracy;
        double v28 = v38 + round(v40 * (v39 - v38)) / v40;
      }
      objc_msgSend(v5, "position", __x, v58, v59, v60, v61, v62);
      if (v40 == 1.0)
      {
        double v35 = round(v47);
        double v50 = self->_accuracy;
      }
      else
      {
        double v48 = floor(v47);
        [v5 position];
        double v50 = self->_accuracy;
        double v35 = v48 + round(v50 * (v49 - v48)) / v50;
      }
      if (v50 == 1.0)
      {
        double v44 = round(v13);
        double v46 = round(v15);
      }
      else
      {
        double v51 = floor(v13);
        double v44 = v51 + round((v13 - v51) * v50) / v50;
        double v52 = floor(v15);
        double v46 = v52 + round((v15 - v52) * v50) / v50;
      }
      break;
  }
  objc_msgSend(v5, "rotation", (void)__x);
  double v54 = round(v53 * 5000.0) / 5000.0;
  double v55 = round(v21 * 5000.0) / 5000.0;
  BOOL v56 = v35 != v46 || v28 != v44;
  if (v54 == v55)
  {
    [v5 setRotation:v21];
    if (!v56) {
      goto LABEL_49;
    }
    goto LABEL_48;
  }
  if (v56)
  {
LABEL_48:
    objc_msgSend(v5, "setPosition:", v13, v15);
    goto LABEL_49;
  }
LABEL_50:
}

- (id)_newBodyForItem:(id)a3 inItemGroup:(id)a4
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (_dynamicItemTypeForItem(v6) == 1)
  {
    id v8 = v6;
    id v9 = v8;
    id v58 = v6;
    if (self->_referenceSystemType == 1)
    {
      double v10 = [(UIDynamicAnimator *)self referenceView];
      char v11 = [v9 isDescendantOfView:v10];

      if ((v11 & 1) == 0) {
        [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"View item (%@) should be a descendant of reference view in %@", v9, self format];
      }
      double v12 = [(UIDynamicAnimator *)self referenceView];
      [v9 center];
      double v14 = v13;
      double v16 = v15;
      long double v17 = [v9 superview];
      objc_msgSend(v12, "convertPoint:fromView:", v17, v14, v16);
      double v19 = v18;
      double v21 = v20;
    }
    else
    {
      [v8 center];
      double v19 = v24;
      double v21 = v25;
    }
    double v26 = [MEMORY[0x1E4F1CA48] array];
    double v27 = [v9 superview];
    double v28 = [v27 constraints];

    long long v62 = 0u;
    long long v63 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    id v29 = v28;
    uint64_t v30 = [v29 countByEnumeratingWithState:&v60 objects:v64 count:16];
    if (v30)
    {
      uint64_t v31 = v30;
      uint64_t v32 = *(void *)v61;
      do
      {
        for (uint64_t i = 0; i != v31; ++i)
        {
          if (*(void *)v61 != v32) {
            objc_enumerationMutation(v29);
          }
          double v34 = *(void **)(*((void *)&v60 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            if (v34)
            {
              id v35 = (id)objc_msgSend((id)objc_msgSend(v34, "firstItem"), "_referenceView");
              if (v35 != v9)
              {
                double v36 = v35;
                double v37 = objc_msgSend((id)objc_msgSend(v34, "secondItem"), "_referenceView");
LABEL_17:
                id v38 = v37;

                if (v38 != v9) {
                  continue;
                }
LABEL_21:
                [v26 addObject:v34];
                continue;
              }
            }
            else
            {
              double v36 = 0;
              double v37 = 0;
              if (v9) {
                goto LABEL_17;
              }
            }

            goto LABEL_21;
          }
        }
        uint64_t v31 = [v29 countByEnumeratingWithState:&v60 objects:v64 count:16];
      }
      while (v31);
    }

    if ([v26 count])
    {
      double v39 = [v9 superview];
      [v39 removeConstraints:v26];

      [v9 setTranslatesAutoresizingMaskIntoConstraints:1];
      [v9 _setHostsLayoutEngine:1];
    }

    id v6 = v58;
  }
  else
  {
    [v6 center];
    double v19 = v22;
    double v21 = v23;
  }
  if (objc_opt_respondsToSelector())
  {
    uint64_t v40 = [v6 collisionBoundsType];
    if (v7)
    {
LABEL_29:
      [v7 center];
      double v42 = v19 - v41;
      double v44 = v21 - v43;
      goto LABEL_32;
    }
  }
  else
  {
    uint64_t v40 = 0;
    if (v7) {
      goto LABEL_29;
    }
  }
  double v42 = *MEMORY[0x1E4F1DAD8];
  double v44 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
LABEL_32:
  if (v40 == 2)
  {
    if ((objc_opt_respondsToSelector() & 1) == 0) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"UIDynamicItem (%@) MUST implement -[UIDynamicItem boundingPath] when specifying a collision bounds of UIDynamicItemCollisionBoundsPath", v6 format];
    }
    id v48 = [v6 collisionBoundingPath];
    double v49 = +[PKExtendedPhysicsBody bodyWithPolygonFromPath:](PKExtendedPhysicsBody, "bodyWithPolygonFromPath:", [v48 CGPath]);

    if (!v49) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"UIDynamicItem (%@) provided an invalid bounding path", v6 format];
    }
  }
  else
  {
    if (v40 == 1)
    {
      [v6 bounds];
      CGFloat x = v66.origin.x;
      CGFloat y = v66.origin.y;
      CGFloat width = v66.size.width;
      CGFloat height = v66.size.height;
      double v54 = CGRectGetWidth(v66);
      v67.origin.CGFloat x = x;
      v67.origin.CGFloat y = y;
      v67.size.CGFloat width = width;
      v67.size.CGFloat height = height;
      double v55 = CGRectGetHeight(v67);
      [v6 bounds];
      if (v54 == v55) {
        +[PKExtendedPhysicsBody bodyWithCircleOfRadius:v56 * 0.5];
      }
      else {
      uint64_t v47 = +[PKExtendedPhysicsBody bodyWithEllipseInRect:](PKExtendedPhysicsBody, "bodyWithEllipseInRect:");
      }
    }
    else
    {
      if (v40)
      {
        double v49 = 0;
        goto LABEL_46;
      }
      [v6 bounds];
      uint64_t v47 = +[PKExtendedPhysicsBody bodyWithRectangleOfSize:center:](PKExtendedPhysicsBody, "bodyWithRectangleOfSize:center:", v45, v46, v42, v44);
    }
    double v49 = (void *)v47;
  }
LABEL_46:
  [v49 setRepresentedObject:v6];
  if (v6) {
    [v6 transform];
  }
  else {
    memset(v59, 0, sizeof(v59));
  }
  _setupBodyWithCenterAndTransform(v49, (long double *)v59, v19, v21);

  return v49;
}

- (id)_registerBodyForItem:(id)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = (void *)_dynamicItemTypeForItem(v5);
  unint64_t referenceSystemType = self->_referenceSystemType;
  if (v6 == (void *)2)
  {
    if (referenceSystemType != 1) {
      goto LABEL_7;
    }
    id v8 = @"Can't use layout attributes as item (%@) in an animator with view reference %@";
  }
  else
  {
    if (referenceSystemType != 2) {
      goto LABEL_7;
    }
    id v8 = @"Can't use view as item (%@) in an animator with layout reference %@";
  }
  objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3C8], v8, v5, self);
LABEL_7:
  bodies = self->_bodies;
  double v10 = [(UIDynamicAnimator *)self _keyForItem:v5];
  char v11 = [(NSMutableDictionary *)bodies objectForKey:v10];

  if (v11)
  {
    id v12 = [v11 representedObject];

    if (v12 != v5) {
      NSLog(&cfstr_BodyWithoutRep.isa, self, v11, v5);
    }
    [v11 associate];
    id v13 = v11;
  }
  else
  {
    [v5 bounds];
    if (v14 == 0.0 || ([v5 bounds], v15 == 0.0))
    {
      uint64_t v32 = [MEMORY[0x1E4F28B00] currentHandler];
      [v5 bounds];
      v48.CGFloat width = v33;
      v48.CGFloat height = v34;
      id v35 = NSStringFromCGSize(v48);
      [v32 handleFailureInMethod:a2, self, @"UIDynamicAnimator.m", 959, @"Invalid size %@ for item %@ in Dynamics", v35, v5 object file lineNumber description];
    }
    if (v6 == (void *)3)
    {
      id v16 = v5;
      long double v17 = objc_opt_new();
      double v18 = [v16 items];
      long long v43 = 0u;
      long long v44 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      uint64_t v19 = [v18 countByEnumeratingWithState:&v41 objects:v45 count:16];
      if (v19)
      {
        uint64_t v20 = *(void *)v42;
        do
        {
          for (uint64_t i = 0; i != v19; ++i)
          {
            if (*(void *)v42 != v20) {
              objc_enumerationMutation(v18);
            }
            id v22 = [(UIDynamicAnimator *)self _newBodyForItem:*(void *)(*((void *)&v41 + 1) + 8 * i) inItemGroup:v16];
            [v17 addObject:v22];
          }
          uint64_t v19 = [v18 countByEnumeratingWithState:&v41 objects:v45 count:16];
        }
        while (v19);
      }
      id v23 = +[PKExtendedPhysicsBody bodyWithBodies:v17];
      [v23 setRepresentedObject:v16];
      [v16 center];
      double v25 = v24;
      double v27 = v26;
      if (v16) {
        [v16 transform];
      }
      else {
        memset(v40, 0, sizeof(v40));
      }
      _setupBodyWithCenterAndTransform(v23, (long double *)v40, v25, v27);
    }
    else
    {
      id v23 = [(UIDynamicAnimator *)self _newBodyForItem:v5 inItemGroup:0];
    }
    [v23 associate];
    objc_initWeak(&location, self);
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __42__UIDynamicAnimator__registerBodyForItem___block_invoke;
    v36[3] = &unk_1E52EC728;
    objc_copyWeak(v38, &location);
    id v28 = v5;
    id v37 = v28;
    v38[1] = v6;
    [v23 setPostStepBlock:v36];
    [(PKExtendedPhysicsWorld *)self->_world addBody:v23];
    id v29 = self->_bodies;
    uint64_t v30 = [(UIDynamicAnimator *)self _keyForItem:v28];
    [(NSMutableDictionary *)v29 setObject:v23 forKey:v30];

    [(UIDynamicAnimator *)self _tickle];
    id v13 = v23;

    objc_destroyWeak(v38);
    objc_destroyWeak(&location);
  }

  return v13;
}

void __42__UIDynamicAnimator__registerBodyForItem___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  uint64_t v5 = *(void *)(a1 + 32);
  [v4 position];
  double v7 = v6;
  double v9 = v8;
  [v4 rotation];
  double v11 = v10;

  objc_msgSend(WeakRetained, "_defaultMapper:position:angle:itemType:", v5, *(void *)(a1 + 48), v7, v9, v11);
}

- (id)_keyForItem:(id)a3
{
  if (self->_referenceSystemType == 2) {
    +[_UICollectionViewItemKey collectionItemKeyForLayoutAttributes:]((uint64_t)_UICollectionViewItemKey, (uint64_t)a3);
  }
  else {
  id v3 = [MEMORY[0x1E4F29238] valueWithPointer:a3];
  }
  return v3;
}

- (id)_bodyForItem:(id)a3
{
  bodies = self->_bodies;
  id v5 = a3;
  double v6 = [(UIDynamicAnimator *)self _keyForItem:v5];
  double v7 = [(NSMutableDictionary *)bodies objectForKey:v6];

  id v8 = [v7 representedObject];

  if (v8 == v5) {
    id v9 = v7;
  }
  else {
    id v9 = 0;
  }

  return v9;
}

- (id)_world
{
  return self->_world;
}

- (void)_setSpeed:(double)a3
{
  self->_speed = a3;
  -[PKExtendedPhysicsWorld setSpeed:](self->_world, "setSpeed:");
}

- (double)_speed
{
  return self->_speed;
}

- (void)_setupWorld
{
  id v3 = objc_alloc_init(PKExtendedPhysicsWorld);
  world = self->_world;
  self->_world = v3;

  double speed = self->_speed;
  double v6 = self->_world;
  [(PKExtendedPhysicsWorld *)v6 setSpeed:speed];
}

- (BOOL)_isWorldActive
{
  if (_UIUpdateCycleEnabled())
  {
    uiUpdateSequenceItem = self->_uiUpdateSequenceItem;
  }
  else
  {
    uiUpdateSequenceItem = objc_loadWeakRetained((id *)&self->_displaylink);
  }
  return uiUpdateSequenceItem != 0;
}

- (void)_setRunning:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(UIDynamicAnimator *)self isRunning] != a3)
  {
    if (v3)
    {
      [(UIDynamicAnimator *)self _start];
    }
    else
    {
      [(UIDynamicAnimator *)self _stop];
    }
  }
}

- (void)_stop
{
  if ([(UIDynamicAnimator *)self _isWorldActive])
  {
    self->_lastUpdateTime = 0.0;
    if (_UIUpdateCycleEnabled())
    {
      [(UIDynamicAnimator *)self _deactivateUIUpdateSequenceItem];
    }
    else
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_displaylink);
      [WeakRetained invalidate];

      objc_storeWeak((id *)&self->_displaylink, 0);
    }
    self->_stopping = 1;
    [(UIDynamicsDebug *)self->_dynamicsDebug captureDebugInformation];
    [(UIDynamicsDebug *)self->_dynamicsDebug setNeedsDisplay];
    if (*(unsigned char *)&self->_stateFlags)
    {
      id v4 = objc_loadWeakRetained((id *)&self->_delegate);
      [v4 dynamicAnimatorDidPause:self];
    }
    self->_stopping = 0;
  }
}

- (void)_clearReferenceView
{
  if (self->_referenceSystemType == 1)
  {
    objc_storeWeak((id *)&self->_referenceSystem, 0);
    [(UIDynamicAnimator *)self _stop];
  }
}

- (void)_tickle
{
  if (self->_stopping && __tickleTryCount <= 3)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __28__UIDynamicAnimator__tickle__block_invoke;
    block[3] = &unk_1E52D9F70;
    void block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
    ++__tickleTryCount;
  }
  else if (![(UIDynamicAnimator *)self _isWorldActive] {
         && [(NSMutableDictionary *)self->_bodies count])
  }
  {
    [(UIDynamicAnimator *)self _start];
  }
}

uint64_t __28__UIDynamicAnimator__tickle__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _tickle];
  __tickleTryCount = 0;
  return result;
}

- (void)_start
{
  __tickleTryCount = 0;
  if (self->_referenceSystemType == 1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_referenceSystem);

    if (!WeakRetained) {
      return;
    }
  }
  if ([(UIDynamicAnimator *)self _isWorldActive] || self->_disableDisplayLink) {
    return;
  }
  id v4 = objc_alloc_init(UIDynamicAnimatorTicker);
  ticker = self->_ticker;
  self->_ticker = v4;

  double v6 = [(UIDynamicAnimator *)self ticker];
  [v6 setAnimator:self];

  if (!_UIUpdateCycleEnabled())
  {
    self->_lastUpdateTime = CACurrentMediaTime();
    unint64_t referenceSystemType = self->_referenceSystemType;
    if (referenceSystemType == 1)
    {
      id v8 = objc_loadWeakRetained((id *)&self->_referenceSystem);
      id v9 = [v8 _screen];
      double v10 = [(UIDynamicAnimator *)self ticker];
      id v12 = [v9 displayLinkWithTarget:v10 selector:sel__displayLinkTick_];
    }
    else
    {
      if (referenceSystemType != 2) {
        goto LABEL_12;
      }
      id v8 = objc_loadWeakRetained((id *)&self->_referenceSystem);
      id v9 = [v8 collectionView];
      double v10 = [v9 _screen];
      double v11 = [(UIDynamicAnimator *)self ticker];
      id v12 = [v10 displayLinkWithTarget:v11 selector:sel__displayLinkTick_];
    }
    if (v12)
    {
LABEL_13:
      [v12 maximumRefreshRate];
      if (v15 != 0.0) {
        [v12 setPreferredFramesPerSecond:llround(1.0 / v15)];
      }
      id v16 = [MEMORY[0x1E4F1CAC0] currentRunLoop];
      [v12 addToRunLoop:v16 forMode:*MEMORY[0x1E4F1C4B0]];

      objc_storeWeak((id *)&self->_displaylink, v12);
      goto LABEL_16;
    }
LABEL_12:
    id v13 = (void *)MEMORY[0x1E4F39B68];
    double v14 = [(UIDynamicAnimator *)self ticker];
    id v12 = [v13 displayLinkWithTarget:v14 selector:sel__displayLinkTick_];

    goto LABEL_13;
  }
  [(UIDynamicAnimator *)self _activateUIUpdateSequenceItem];
LABEL_16:
  if (self->_referenceSystemType == 1)
  {
    long double v17 = [(UIDynamicAnimator *)self referenceView];
    double v18 = [v17 window];
    uint64_t v19 = [v18 screen];
    [v19 scale];
    self->_accuracCGFloat y = v20;
  }
  if (self->_accuracy == 0.0) {
    self->_accuracCGFloat y = 1.0;
  }
  if ((*(unsigned char *)&self->_stateFlags & 2) != 0)
  {
    id v21 = objc_loadWeakRetained((id *)&self->_delegate);
    [v21 dynamicAnimatorWillResume:self];
  }
}

- (BOOL)isDebugEnabled
{
  return self->_debugEnabled;
}

- (void)setDebugEnabled:(BOOL)a3
{
  if (self->_debugEnabled != a3)
  {
    self->_debugEnabled = a3;
    if (a3)
    {
      if (!self->_world) {
        [(UIDynamicAnimator *)self _setupWorld];
      }
      id v4 = [[UIDynamicsDebug alloc] initWithAnimator:self];
      dynamicsDebug = self->_dynamicsDebug;
      self->_dynamicsDebug = v4;

      double v6 = self->_dynamicsDebug;
      [(UIDynamicsDebug *)v6 setEnabled:1];
    }
    else
    {
      -[UIDynamicsDebug setEnabled:](self->_dynamicsDebug, "setEnabled:");
      double v7 = self->_dynamicsDebug;
      self->_dynamicsDebug = 0;
    }
  }
}

- (void)setDebugFrameInterval:(unint64_t)a3
{
  self->_debugInterval = a3;
}

- (unint64_t)debugFrameInterval
{
  return self->_debugInterval;
}

- (void)_setDebugInterval:(int)a3
{
}

- (int)_debugInterval
{
  return [(UIDynamicAnimator *)self debugFrameInterval];
}

- (void)_preSolverStep
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  if (self->_needsLocalBehaviorReevaluation)
  {
    [(UIDynamicAnimator *)self _evaluateLocalBehaviors];
    self->_needsLocalBehaviorReevaluation = 0;
  }
  if (self->_registeredImplicitBounds < 1) {
    goto LABEL_16;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_referenceSystem);

  if (!WeakRetained) {
    goto LABEL_16;
  }
  unint64_t referenceSystemType = self->_referenceSystemType;
  switch(referenceSystemType)
  {
    case 0uLL:
      id v18 = objc_loadWeakRetained((id *)&self->_referenceSystem);
      [v18 bounds];
      v46.origin.CGFloat x = v19;
      v46.origin.CGFloat y = v20;
      v46.size.CGFloat width = v21;
      v46.size.CGFloat height = v22;
      BOOL v23 = CGRectEqualToRect(self->_referenceSystemBounds, v46);

      if (v23) {
        break;
      }
      id v11 = objc_loadWeakRetained((id *)&self->_referenceSystem);
      [v11 bounds];
LABEL_14:
      self->_referenceSystemBounds.origin.CGFloat x = v24;
      self->_referenceSystemBounds.origin.CGFloat y = v25;
      self->_referenceSystemBounds.size.CGFloat width = v26;
      self->_referenceSystemBounds.size.CGFloat height = v27;
      goto LABEL_15;
    case 2uLL:
      id v28 = objc_loadWeakRetained((id *)&self->_referenceSystem);
      [v28 _dynamicReferenceBounds];
      v47.origin.CGFloat x = v29;
      v47.origin.CGFloat y = v30;
      v47.size.CGFloat width = v31;
      v47.size.CGFloat height = v32;
      BOOL v33 = CGRectEqualToRect(self->_referenceSystemBounds, v47);

      if (v33) {
        break;
      }
      id v11 = objc_loadWeakRetained((id *)&self->_referenceSystem);
      [v11 _dynamicReferenceBounds];
      goto LABEL_14;
    case 1uLL:
      id v5 = objc_loadWeakRetained((id *)&self->_referenceSystem);
      [v5 bounds];
      v45.origin.CGFloat x = v6;
      v45.origin.CGFloat y = v7;
      v45.size.CGFloat width = v8;
      v45.size.CGFloat height = v9;
      BOOL v10 = CGRectEqualToRect(self->_referenceSystemBounds, v45);

      if (!v10)
      {
        id v11 = objc_loadWeakRetained((id *)&self->_referenceSystem);
        id v12 = [v11 layer];
        id v13 = [v12 presentationLayer];
        [v13 bounds];
        self->_referenceSystemBounds.origin.CGFloat x = v14;
        self->_referenceSystemBounds.origin.CGFloat y = v15;
        self->_referenceSystemBounds.size.CGFloat width = v16;
        self->_referenceSystemBounds.size.CGFloat height = v17;

LABEL_15:
        [(UIDynamicAnimator *)self _reevaluateImplicitBounds];
      }
      break;
  }
LABEL_16:
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  CGFloat v34 = self->_registeredBehaviors;
  uint64_t v35 = [(NSMutableSet *)v34 countByEnumeratingWithState:&v39 objects:v43 count:16];
  if (v35)
  {
    uint64_t v36 = v35;
    uint64_t v37 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v36; ++i)
      {
        if (*(void *)v40 != v37) {
          objc_enumerationMutation(v34);
        }
        objc_msgSend(*(id *)(*((void *)&v39 + 1) + 8 * i), "_step", (void)v39);
      }
      uint64_t v36 = [(NSMutableSet *)v34 countByEnumeratingWithState:&v39 objects:v43 count:16];
    }
    while (v36);
  }

  [(UIDynamicsDebug *)self->_dynamicsDebug captureDebugInformation];
}

- (void)_runBlockPostSolverIfNeeded:(id)a3
{
  if (self->_isInWorldStepMethod)
  {
    postSolverActions = self->_postSolverActions;
    id v5 = _Block_copy(a3);
    [(NSMutableArray *)postSolverActions addObject:v5];
  }
  else
  {
    id v4 = (void (*)(id))*((void *)a3 + 2);
    v4(a3);
  }
}

- (void)_postSolverStep
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  self->_isInWorldStepMethod = 1;
  [(UIDynamicAnimator *)self _reportBeginContacts];
  [(UIDynamicAnimator *)self _reportEndContacts];
  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  BOOL v3 = self->_registeredBehaviors;
  uint64_t v4 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v54 objects:v62 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v55;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v55 != v6) {
          objc_enumerationMutation(v3);
        }
        CGFloat v8 = *(void **)(*((void *)&v54 + 1) + 8 * i);
        CGFloat v9 = [v8 action];

        if (v9)
        {
          BOOL v10 = [v8 action];
          v10[2]();
        }
      }
      uint64_t v5 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v54 objects:v62 count:16];
    }
    while (v5);
  }

  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id v11 = self->_topLevelBehaviors;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v50 objects:v61 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v51;
    while (2)
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v51 != v14) {
          objc_enumerationMutation(v11);
        }
        if (![*(id *)(*((void *)&v50 + 1) + 8 * j) allowsAnimatorToStop])
        {
          char v16 = 0;
          goto LABEL_20;
        }
      }
      uint64_t v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v50 objects:v61 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }
  char v16 = 1;
LABEL_20:

  self->_isInWorldStepMethod = 0;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  CGFloat v17 = self->_postSolverActions;
  uint64_t v18 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v46 objects:v60 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v47;
    do
    {
      for (uint64_t k = 0; k != v19; ++k)
      {
        if (*(void *)v47 != v20) {
          objc_enumerationMutation(v17);
        }
        uint64_t v22 = *(void *)(*((void *)&v46 + 1) + 8 * k);
        if (v22) {
          (*(void (**)(void))(v22 + 16))();
        }
      }
      uint64_t v19 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v46 objects:v60 count:16];
    }
    while (v19);
  }

  [(NSMutableArray *)self->_postSolverActions removeAllObjects];
  behaviorsToRemove = self->_behaviorsToRemove;
  if (behaviorsToRemove && [(NSMutableSet *)behaviorsToRemove count])
  {
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    CGFloat v24 = self->_behaviorsToRemove;
    uint64_t v25 = [(NSMutableSet *)v24 countByEnumeratingWithState:&v42 objects:v59 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = *(void *)v43;
      do
      {
        for (uint64_t m = 0; m != v26; ++m)
        {
          if (*(void *)v43 != v27) {
            objc_enumerationMutation(v24);
          }
          [(UIDynamicAnimator *)self _unregisterBehavior:*(void *)(*((void *)&v42 + 1) + 8 * m)];
        }
        uint64_t v26 = [(NSMutableSet *)v24 countByEnumeratingWithState:&v42 objects:v59 count:16];
      }
      while (v26);
    }

    CGFloat v29 = self->_behaviorsToRemove;
    self->_behaviorsToRemove = 0;
  }
  behaviorsToAdd = self->_behaviorsToAdd;
  if (behaviorsToAdd && [(NSMutableSet *)behaviorsToAdd count])
  {
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    CGFloat v31 = self->_behaviorsToAdd;
    uint64_t v32 = [(NSMutableSet *)v31 countByEnumeratingWithState:&v38 objects:v58 count:16];
    if (v32)
    {
      uint64_t v33 = v32;
      uint64_t v34 = *(void *)v39;
      do
      {
        for (uint64_t n = 0; n != v33; ++n)
        {
          if (*(void *)v39 != v34) {
            objc_enumerationMutation(v31);
          }
          -[UIDynamicAnimator _registerBehavior:](self, "_registerBehavior:", *(void *)(*((void *)&v38 + 1) + 8 * n), (void)v38);
        }
        uint64_t v33 = [(NSMutableSet *)v31 countByEnumeratingWithState:&v38 objects:v58 count:16];
      }
      while (v33);
    }

    uint64_t v36 = self->_behaviorsToAdd;
    self->_behaviorsToAdd = 0;
  }
  if ((v16 & 1) != 0 || ![(NSMutableSet *)self->_registeredBehaviors count]) {
    [(UIDynamicAnimator *)self _stop];
  }
  uint64_t debugInterval = self->_debugInterval;
  if (!debugInterval || !(self->_ticks % debugInterval)) {
    [(UIDynamicsDebug *)self->_dynamicsDebug setNeedsDisplay];
  }
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return WeakRetained;
}

- (id)_delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return WeakRetained;
}

- (void)setDelegate:(id)delegate
{
  obuint64_t j = delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  uint64_t v5 = obj;
  if (!obj || WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    if (objc_opt_respondsToSelector()) {
      char v6 = 2;
    }
    else {
      char v6 = 0;
    }
    *(unsigned char *)&self->_stateFlags = *(unsigned char *)&self->_stateFlags & 0xFD | v6;
    char v7 = objc_opt_respondsToSelector();
    uint64_t v5 = obj;
    *(unsigned char *)&self->_stateFlags = *(unsigned char *)&self->_stateFlags & 0xFE | v7 & 1;
  }
}

- (void)_setAction:(id)a3
{
  uint64_t v4 = (void *)[a3 copy];
  actiouint64_t n = self->_action;
  self->_actiouint64_t n = v4;
}

- (void)_setAlwaysDisableDisplayLink:(BOOL)a3
{
  self->_disableDisplayLinuint64_t k = a3;
}

- (BOOL)_alwaysDisableDisplayLink
{
  return self->_disableDisplayLink;
}

- (BOOL)_animatorStep:(double)a3
{
  ++self->_ticks;
  self->_lastInterval = a3;
  self->_elapsedTime = self->_elapsedTime + a3;
  [(UIDynamicAnimator *)self _preSolverStep];
  self->_isInWorldStepMethod = 1;
  char v5 = [(PKExtendedPhysicsWorld *)self->_world stepWithTime:8 velocityIterations:3 positionIterations:a3];
  self->_isInWorldStepMethod = 0;
  [(UIDynamicAnimator *)self _postSolverStep];
  actiouint64_t n = (void (**)(id, UIDynamicAnimator *))self->_action;
  if (action) {
    action[2](action, self);
  }
  if (self->_referenceSystemType == 2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_referenceSystem);
    [(UIDynamicAnimator *)self _invalidateCollectionViewLayout:WeakRetained];
  }
  return v5;
}

- (void)_invalidateCollectionViewLayout:(id)a3
{
  id v3 = a3;
  id v4 = [v3 _invalidationContextForRefreshingVisibleElementAttributes];
  [v3 invalidateLayoutWithContext:v4];
}

- (double)_animatorInterval
{
  return self->_lastInterval;
}

- (void)_performAnimationTickForTimestamp:(double)a3
{
  double v5 = a3 - self->_lastUpdateTime;
  if (v5 > 0.5) {
    double v5 = 0.0166666667;
  }
  self->_realElapsedTime = self->_realElapsedTime + v5;
  BOOL v6 = -[UIDynamicAnimator _animatorStep:](self, "_animatorStep:");
  self->_lastUpdateTime = a3;
  if (!v6)
  {
    [(UIDynamicAnimator *)self _stop];
  }
}

- (int64_t)_ticks
{
  return self->_ticks;
}

- (double)_realElapsedTime
{
  return self->_realElapsedTime;
}

- (BOOL)isSettling
{
  if (!self->_world) {
    [(UIDynamicAnimator *)self _setupWorld];
  }
  if ((*(unsigned char *)&self->_stateFlags & 4) == 0) {
    return 0;
  }
  world = self->_world;
  return [(PKExtendedPhysicsWorld *)world isSettling];
}

- (void)setSettlingLinearVelocityThreshold:(double)a3
{
  if (!self->_world) {
    [(UIDynamicAnimator *)self _setupWorld];
  }
  if ((*(unsigned char *)&self->_stateFlags & 4) != 0)
  {
    world = self->_world;
    [(PKExtendedPhysicsWorld *)world setSettlingLinearVelocityThreshold:a3];
  }
}

- (double)settlingLinearVelocityThreshold
{
  if (!self->_world) {
    [(UIDynamicAnimator *)self _setupWorld];
  }
  if ((*(unsigned char *)&self->_stateFlags & 4) == 0) {
    return 0.0;
  }
  world = self->_world;
  [(PKExtendedPhysicsWorld *)world settlingLinearVelocityThreshold];
  return result;
}

- (void)setSettlingAngularVelocityThreshold:(double)a3
{
  if (!self->_world) {
    [(UIDynamicAnimator *)self _setupWorld];
  }
  if ((*(unsigned char *)&self->_stateFlags & 4) != 0)
  {
    world = self->_world;
    [(PKExtendedPhysicsWorld *)world setSettlingAngularVelocityThreshold:a3];
  }
}

- (double)settlingAngularVelocityThreshold
{
  if (!self->_world) {
    [(UIDynamicAnimator *)self _setupWorld];
  }
  if ((*(unsigned char *)&self->_stateFlags & 4) == 0) {
    return 0.0;
  }
  world = self->_world;
  [(PKExtendedPhysicsWorld *)world settlingAngularVelocityThreshold];
  return result;
}

- (void)setSettlingDuration:(double)a3
{
  if (!self->_world) {
    [(UIDynamicAnimator *)self _setupWorld];
  }
  if ((*(unsigned char *)&self->_stateFlags & 4) != 0)
  {
    world = self->_world;
    [(PKExtendedPhysicsWorld *)world setSettlingDuration:a3];
  }
}

- (double)settlingDuration
{
  if (!self->_world) {
    [(UIDynamicAnimator *)self _setupWorld];
  }
  if ((*(unsigned char *)&self->_stateFlags & 4) == 0) {
    return 0.0;
  }
  world = self->_world;
  [(PKExtendedPhysicsWorld *)world settlingDuration];
  return result;
}

- (UIView)referenceView
{
  if (self->_referenceSystemType == 1) {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_referenceSystem);
  }
  else {
    id WeakRetained = 0;
  }
  return (UIView *)WeakRetained;
}

- (void)_setReferenceSystem:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    obuint64_t j = v4;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_referenceSystem);

    id v4 = obj;
    if (WeakRetained != obj)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v6 = objc_storeWeak((id *)&self->_referenceSystem, obj);
        self->_unint64_t referenceSystemType = 1;
        id v7 = v6;
        [obj bounds];
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          self->_unint64_t referenceSystemType = 0;
          CGSize v15 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
          self->_referenceSystemBounds.origiuint64_t n = (CGPoint)*MEMORY[0x1E4F1DB20];
          self->_referenceSystemBounds.size = v15;
          goto LABEL_9;
        }
        id v12 = objc_loadWeakRetained((id *)&self->_referenceSystem);
        [v12 _setDynamicAnimator:0];

        id v13 = objc_storeWeak((id *)&self->_referenceSystem, obj);
        self->_unint64_t referenceSystemType = 2;
        id v14 = v13;
        [obj _dynamicReferenceBounds];
      }
      self->_referenceSystemBounds.origin.CGFloat x = v8;
      self->_referenceSystemBounds.origin.CGFloat y = v9;
      self->_referenceSystemBounds.size.CGFloat width = v10;
      self->_referenceSystemBounds.size.CGFloat height = v11;

LABEL_9:
      id v4 = obj;
    }
  }
}

- (CGRect)_referenceSystemBounds
{
  double x = self->_referenceSystemBounds.origin.x;
  double y = self->_referenceSystemBounds.origin.y;
  double width = self->_referenceSystemBounds.size.width;
  double height = self->_referenceSystemBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (unint64_t)_referenceSystemType
{
  return self->_referenceSystemType;
}

- (id)_referenceSystem
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_referenceSystem);
  return WeakRetained;
}

- (UIDynamicAnimatorTicker)ticker
{
  return self->_ticker;
}

- (void)setTicker:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ticker, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_action, 0);
  objc_destroyWeak((id *)&self->_referenceSystem);
  objc_storeStrong((id *)&self->_endContacts, 0);
  objc_storeStrong((id *)&self->_beginContacts, 0);
  objc_storeStrong((id *)&self->_postSolverActions, 0);
  objc_storeStrong((id *)&self->_availableFieldCategories, 0);
  objc_storeStrong((id *)&self->_behaviorsToAdd, 0);
  objc_storeStrong((id *)&self->_behaviorsToRemove, 0);
  objc_storeStrong((id *)&self->_registeredBehaviors, 0);
  objc_storeStrong((id *)&self->_topLevelBehaviors, 0);
  objc_storeStrong((id *)&self->_bodies, 0);
  objc_storeStrong((id *)&self->_dynamicsDebug, 0);
  objc_destroyWeak((id *)&self->_displaylink);
  objc_storeStrong((id *)&self->_world, 0);
}

@end