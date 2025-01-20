@interface _UIClientToHostRelationshipGestureInteraction
+ (id)_hostGestureRecognizersForFailureRelationshipsWithIdentifier:(id)a3;
+ (id)hostGestureRecognizerForFailureRelationshipsWithIdentifier:(id)a3;
+ (void)dispatchGestureRecognizerStateChange:(int64_t)a3 toHostGestureWithIdentifier:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (NSArray)gestureRecognizers;
- (NSString)hostIdentifier;
- (UIView)view;
- (_UIAssertion)pointerUpdatePauseAssertion;
- (_UIClientToHostRelationshipGestureInteraction)initWithHostIdentifier:(id)a3;
- (void)_invalidatePointerPauseAssertion;
- (void)_wrappedRecognizerDidRecognize:(id)a3;
- (void)addGestureRecognizer:(id)a3;
- (void)didMoveToView:(id)a3;
- (void)removeGestureRecognizer:(id)a3;
- (void)setPointerUpdatePauseAssertion:(id)a3;
- (void)willMoveToView:(id)a3;
@end

@implementation _UIClientToHostRelationshipGestureInteraction

+ (id)_hostGestureRecognizersForFailureRelationshipsWithIdentifier:(id)a3
{
  id v3 = a3;
  if (_MergedGlobals_1191 != -1) {
    dispatch_once(&_MergedGlobals_1191, &__block_literal_global_439);
  }
  v4 = [(id)qword_1EB262358 objectForKey:v3];
  if (!v4)
  {
    v4 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    [(id)qword_1EB262358 setObject:v4 forKey:v3];
  }

  return v4;
}

+ (id)hostGestureRecognizerForFailureRelationshipsWithIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [[_UIRelationshipGestureRecognizer alloc] initWithTarget:0 action:0];
  v6 = [NSString stringWithFormat:@"clientRelationshipGestureRecognizer:%@", v4];
  [(UIGestureRecognizer *)v5 setName:v6];

  [(_UIRelationshipGestureRecognizer *)v5 setSucceedsOnTouchesEnded:1];
  [(_UIRelationshipGestureRecognizer *)v5 setFailsOnTouchesCancelled:0];
  v7 = [a1 _hostGestureRecognizersForFailureRelationshipsWithIdentifier:v4];

  [v7 addObject:v5];
  return v5;
}

+ (void)dispatchGestureRecognizerStateChange:(int64_t)a3 toHostGestureWithIdentifier:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (a3 == 1)
  {
    id v4 = [a1 _hostGestureRecognizersForFailureRelationshipsWithIdentifier:a4];
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
          [*(id *)(*((void *)&v9 + 1) + 8 * v8++) _fail];
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v6);
    }
  }
}

- (_UIClientToHostRelationshipGestureInteraction)initWithHostIdentifier:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UIClientToHostRelationshipGestureInteraction;
  uint64_t v6 = [(_UIClientToHostRelationshipGestureInteraction *)&v9 init];
  uint64_t v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_hostIdentifier, a3);
  }

  return v7;
}

- (void)addGestureRecognizer:(id)a3
{
  id v4 = a3;
  gestureRecognizers = self->_gestureRecognizers;
  id v9 = v4;
  if (!gestureRecognizers)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_gestureRecognizers;
    self->_gestureRecognizers = v6;

    id v4 = v9;
    gestureRecognizers = self->_gestureRecognizers;
  }
  [(NSMutableArray *)gestureRecognizers addObject:v4];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  [WeakRetained addGestureRecognizer:v9];

  [v9 addTarget:self action:sel__wrappedRecognizerDidRecognize_];
  [v9 setDelegate:self];
}

- (void)removeGestureRecognizer:(id)a3
{
  id v4 = a3;
  [v4 setDelegate:0];
  [v4 removeTarget:self action:sel__wrappedRecognizerDidRecognize_];
  [(NSMutableArray *)self->_gestureRecognizers removeObject:v4];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  [WeakRetained removeGestureRecognizer:v4];
}

- (void)willMoveToView:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v4 = self->_gestureRecognizers;
    uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v12;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v12 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void *)(*((void *)&v11 + 1) + 8 * v8);
          id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
          objc_msgSend(WeakRetained, "removeGestureRecognizer:", v9, (void)v11);

          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v6);
    }

    [(_UIClientToHostRelationshipGestureInteraction *)self _invalidatePointerPauseAssertion];
  }
}

- (void)didMoveToView:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  p_view = &self->_view;
  id v6 = objc_storeWeak((id *)&self->_view, a3);
  if (a3)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v7 = self->_gestureRecognizers;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v15;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v14 + 1) + 8 * v11);
          id WeakRetained = objc_loadWeakRetained((id *)p_view);
          objc_msgSend(WeakRetained, "addGestureRecognizer:", v12, (void)v14);

          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v9);
    }
  }
}

- (void)_invalidatePointerPauseAssertion
{
  [(_UIAssertion *)self->_pointerUpdatePauseAssertion _invalidate];
  pointerUpdatePauseAssertion = self->_pointerUpdatePauseAssertion;
  self->_pointerUpdatePauseAssertion = 0;
}

- (void)_wrappedRecognizerDidRecognize:(id)a3
{
  id v14 = a3;
  if ([v14 state] == 1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
    uint64_t v5 = [WeakRetained _window];

    id v6 = [_UIClientToHostGestureChangeAction alloc];
    uint64_t v7 = [(_UIClientToHostRelationshipGestureInteraction *)self hostIdentifier];
    uint64_t v8 = -[_UIClientToHostGestureChangeAction initWithHostGestureIdentifier:changeToState:](v6, "initWithHostGestureIdentifier:changeToState:", v7, [v14 state]);

    uint64_t v9 = [v5 rootViewController];
    int v10 = [v9 sendClientToHostAction:v8];

    if (v10)
    {
      [(_UIAssertion *)self->_pointerUpdatePauseAssertion _invalidate];
      uint64_t v11 = +[_UIPointerArbiter sharedArbiter];
      uint64_t v12 = [v11 obtainPointerUpdatePauseAssertion];
      pointerUpdatePauseAssertion = self->_pointerUpdatePauseAssertion;
      self->_pointerUpdatePauseAssertion = v12;
    }
  }
  else if ([v14 state] == 3 || objc_msgSend(v14, "state") == 5 || objc_msgSend(v14, "state") == 4)
  {
    [(_UIClientToHostRelationshipGestureInteraction *)self performSelector:sel__invalidatePointerPauseAssertion withObject:0 afterDelay:0.5];
  }
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v5 = a3;
  if ([(NSMutableArray *)self->_gestureRecognizers containsObject:v5]
    && [v5 _requiresSystemGesturesToFail])
  {
    uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"_UIClientToHostRelationshipGestureInteraction.m", 177, @"Wrapped recognizer for %@ must have requiresSystemGesturesToFail=NO, otherwise we'll be stuck waiting for the relationship recognizer to fail, causing a deadlock.", self object file lineNumber description];
  }
  return 1;
}

- (UIView)view
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  return (UIView *)WeakRetained;
}

- (NSString)hostIdentifier
{
  return self->_hostIdentifier;
}

- (NSArray)gestureRecognizers
{
  return &self->_gestureRecognizers->super;
}

- (_UIAssertion)pointerUpdatePauseAssertion
{
  return self->_pointerUpdatePauseAssertion;
}

- (void)setPointerUpdatePauseAssertion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pointerUpdatePauseAssertion, 0);
  objc_storeStrong((id *)&self->_hostIdentifier, 0);
  objc_destroyWeak((id *)&self->_view);
  objc_storeStrong((id *)&self->_gestureRecognizers, 0);
}

@end