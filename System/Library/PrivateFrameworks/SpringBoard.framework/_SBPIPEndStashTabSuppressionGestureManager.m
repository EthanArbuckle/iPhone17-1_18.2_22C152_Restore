@interface _SBPIPEndStashTabSuppressionGestureManager
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (_SBPIPEndStashTabSuppressionGestureManager)initWithSystemGestureManager:(id)a3;
- (void)_addSystemRecognizers;
- (void)_removeGestureRecognizers;
- (void)addTarget:(id)a3 action:(SEL)a4;
- (void)dealloc;
- (void)removeTarget:(id)a3 action:(SEL)a4;
@end

@implementation _SBPIPEndStashTabSuppressionGestureManager

- (_SBPIPEndStashTabSuppressionGestureManager)initWithSystemGestureManager:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_SBPIPEndStashTabSuppressionGestureManager;
  v6 = [(_SBPIPEndStashTabSuppressionGestureManager *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_systemGestureManager, a3);
  }

  return v7;
}

- (void)dealloc
{
  [(NSMutableSet *)self->_targets removeAllObjects];
  targets = self->_targets;
  self->_targets = 0;

  [(_SBPIPEndStashTabSuppressionGestureManager *)self _removeGestureRecognizers];
  v4.receiver = self;
  v4.super_class = (Class)_SBPIPEndStashTabSuppressionGestureManager;
  [(_SBPIPEndStashTabSuppressionGestureManager *)&v4 dealloc];
}

- (void)addTarget:(id)a3 action:(SEL)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = SBLogPIP();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412290;
    id v13 = v6;
    _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "[_SBPIPEndStashTabSuppressionGestureManager] addTarget %@", (uint8_t *)&v12, 0xCu);
  }

  if (([(NSMutableSet *)self->_targets containsObject:v6] & 1) == 0)
  {
    singleTapRecognizer = self->_singleTapRecognizer;
    if (!singleTapRecognizer)
    {
      [(_SBPIPEndStashTabSuppressionGestureManager *)self _addSystemRecognizers];
      singleTapRecognizer = self->_singleTapRecognizer;
    }
    [(UITapGestureRecognizer *)singleTapRecognizer addTarget:v6 action:a4];
    targets = self->_targets;
    if (!targets)
    {
      v10 = [MEMORY[0x1E4F1CA80] setWithCapacity:1];
      v11 = self->_targets;
      self->_targets = v10;

      targets = self->_targets;
    }
    [(NSMutableSet *)targets addObject:v6];
  }
}

- (void)removeTarget:(id)a3 action:(SEL)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = SBLogPIP();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v6;
    _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "[_SBPIPEndStashTabSuppressionGestureManager] removeTarget %@", (uint8_t *)&v9, 0xCu);
  }

  if ([(NSMutableSet *)self->_targets containsObject:v6])
  {
    [(UITapGestureRecognizer *)self->_singleTapRecognizer removeTarget:v6 action:a4];
    [(NSMutableSet *)self->_targets removeObject:v6];
    if (![(NSMutableSet *)self->_targets count])
    {
      targets = self->_targets;
      self->_targets = 0;

      [(_SBPIPEndStashTabSuppressionGestureManager *)self _removeGestureRecognizers];
    }
  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (void)_addSystemRecognizers
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (*(_OWORD *)&self->_singleTapRecognizer != 0)
  {
    uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"SBWindowScenePIPManager.m", 480, @"Re-adding recognizers to %@.", self object file lineNumber description];
  }
  objc_super v4 = SBLogPIP();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v13 = self;
    _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "[_SBPIPEndStashTabSuppressionGestureManager] _addSystemRecognizers %@", buf, 0xCu);
  }

  id v5 = (UITapGestureRecognizer *)objc_alloc_init(MEMORY[0x1E4F42EC8]);
  [(UITapGestureRecognizer *)v5 setName:@"pip.stashtab.endsuppression.tap"];
  [(UITapGestureRecognizer *)v5 setCancelsTouchesInView:0];
  [(UITapGestureRecognizer *)v5 setDelaysTouchesBegan:0];
  [(UITapGestureRecognizer *)v5 setDelaysTouchesEnded:0];
  [(UITapGestureRecognizer *)v5 setAllowedTouchTypes:&unk_1F3347508];
  [(UITapGestureRecognizer *)v5 sbf_setPencilTouchesAllowed:_os_feature_enabled_impl()];
  [(UITapGestureRecognizer *)v5 setDelegate:self];
  id v6 = (UITapGestureRecognizer *)objc_alloc_init(MEMORY[0x1E4F42EC8]);
  [(UITapGestureRecognizer *)v6 setName:@"pip.stashtab.endsuppression.doubletap"];
  [(UITapGestureRecognizer *)v6 setNumberOfTapsRequired:2];
  [(UITapGestureRecognizer *)v6 setCancelsTouchesInView:0];
  [(UITapGestureRecognizer *)v6 setDelaysTouchesBegan:0];
  [(UITapGestureRecognizer *)v6 setDelaysTouchesEnded:0];
  [(UITapGestureRecognizer *)v6 setAllowedTouchTypes:&unk_1F3347520];
  [(UITapGestureRecognizer *)v6 sbf_setPencilTouchesAllowed:_os_feature_enabled_impl()];
  [(UITapGestureRecognizer *)v6 setDelegate:self];
  [(UITapGestureRecognizer *)v5 requireGestureRecognizerToFail:v6];
  singleTapRecognizer = self->_singleTapRecognizer;
  self->_singleTapRecognizer = v5;
  v8 = v5;

  doubleTapRecognizer = self->_doubleTapRecognizer;
  self->_doubleTapRecognizer = v6;
  id v10 = v6;

  [(SBSystemGestureManager *)self->_systemGestureManager addGestureRecognizer:self->_singleTapRecognizer withType:124];
  [(SBSystemGestureManager *)self->_systemGestureManager addGestureRecognizer:self->_doubleTapRecognizer withType:125];
}

- (void)_removeGestureRecognizers
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  objc_super v4 = SBLogPIP();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    int v9 = self;
    _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "[_SBPIPEndStashTabSuppressionGestureManager] _removeGestureRecognizers %@", buf, 0xCu);
  }

  if ([(NSMutableSet *)self->_targets count])
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"SBWindowScenePIPManager.m", 513, @"[_SBPIPEndStashTabSuppressionGestureManager] removed gesture recognizers %@ with active targets.", self object file lineNumber description];
  }
  if (self->_singleTapRecognizer)
  {
    -[SBSystemGestureManager removeGestureRecognizer:](self->_systemGestureManager, "removeGestureRecognizer:");
    singleTapRecognizer = self->_singleTapRecognizer;
    self->_singleTapRecognizer = 0;
  }
  if (self->_doubleTapRecognizer)
  {
    -[SBSystemGestureManager removeGestureRecognizer:](self->_systemGestureManager, "removeGestureRecognizer:");
    doubleTapRecognizer = self->_doubleTapRecognizer;
    self->_doubleTapRecognizer = 0;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemGestureManager, 0);
  objc_storeStrong((id *)&self->_doubleTapRecognizer, 0);
  objc_storeStrong((id *)&self->_singleTapRecognizer, 0);
  objc_storeStrong((id *)&self->_targets, 0);
}

@end