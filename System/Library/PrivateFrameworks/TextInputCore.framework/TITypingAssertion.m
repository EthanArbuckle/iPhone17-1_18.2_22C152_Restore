@interface TITypingAssertion
+ (id)sharedTypingAssertion;
- (BOOL)isActive;
- (NSTimer)timer;
- (PSPointerClientController)pointerClientController;
- (TITypingAssertion)init;
- (id)__restingPathIndices;
- (void)_sbsSetTypingActive:(BOOL)a3;
- (void)dealloc;
- (void)restResetTouches;
- (void)restTouchEndWithPathIndex:(int64_t)a3;
- (void)restTouchStartWithPathIndex:(int64_t)a3;
- (void)setActive:(BOOL)a3;
- (void)setPointerClientController:(id)a3;
- (void)setTimer:(id)a3;
- (void)timerFired:(id)a3;
- (void)touchWithDuration:(double)a3 reason:(int64_t)a4;
- (void)touchWithReason:(int64_t)a3;
@end

@implementation TITypingAssertion

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pointerClientController, 0);
  objc_storeStrong((id *)&self->_timer, 0);

  objc_storeStrong((id *)&self->_restingPathIndices, 0);
}

- (void)setPointerClientController:(id)a3
{
}

- (PSPointerClientController)pointerClientController
{
  return self->_pointerClientController;
}

- (void)setTimer:(id)a3
{
}

- (NSTimer)timer
{
  return self->_timer;
}

- (id)__restingPathIndices
{
  return self->_restingPathIndices;
}

- (void)touchWithReason:(int64_t)a3
{
}

- (void)touchWithDuration:(double)a3 reason:(int64_t)a4
{
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    if (a4 == 1 && !self->_active)
    {
      v7 = [(TITypingAssertion *)self pointerClientController];
      [v7 autohidePointerForReason:1];
    }
    [(TITypingAssertion *)self setActive:1];
    v8 = [(TITypingAssertion *)self timer];
    int v9 = [v8 isValid];

    if (v9)
    {
      id v14 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:a3];
      v10 = [(TITypingAssertion *)self timer];
      v11 = [v10 fireDate];
      id v12 = [v11 laterDate:v14];

      if (v12 == v14)
      {
        v13 = [(TITypingAssertion *)self timer];
        [v13 setFireDate:v14];
      }
    }
    else
    {
      id v14 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:self target:sel_timerFired_ selector:0 userInfo:0 repeats:a3];
      [(TITypingAssertion *)self setTimer:v14];
    }
  }
  else
  {
    TIDispatchAsync();
  }
}

uint64_t __46__TITypingAssertion_touchWithDuration_reason___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) touchWithDuration:*(void *)(a1 + 48) reason:*(double *)(a1 + 40)];
}

- (void)timerFired:(id)a3
{
  [(TITypingAssertion *)self setActive:0];
  v4 = [(TITypingAssertion *)self timer];
  [v4 invalidate];

  [(TITypingAssertion *)self setTimer:0];
}

- (void)_sbsSetTypingActive:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2020000000;
  v4 = (void (*)(BOOL))getSBSSetTypingActiveSymbolLoc_ptr;
  v10 = getSBSSetTypingActiveSymbolLoc_ptr;
  if (!getSBSSetTypingActiveSymbolLoc_ptr)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __getSBSSetTypingActiveSymbolLoc_block_invoke;
    v6[3] = &unk_1E6E2E248;
    v6[4] = &v7;
    __getSBSSetTypingActiveSymbolLoc_block_invoke((uint64_t)v6);
    v4 = (void (*)(BOOL))v8[3];
  }
  _Block_object_dispose(&v7, 8);
  if (v4)
  {
    v4(v3);
  }
  else
  {
    dlerror();
    uint64_t v5 = abort_report_np();
    __getSBSSetTypingActiveSymbolLoc_block_invoke(v5);
  }
}

- (void)restTouchEndWithPathIndex:(int64_t)a3
{
  if (self->_restingPathIndices)
  {
    BOOL v5 = [(TITypingAssertion *)self isActive];
    restingPathIndices = self->_restingPathIndices;
    uint64_t v7 = [NSNumber numberWithInteger:a3];
    [(NSMutableSet *)restingPathIndices removeObject:v7];

    BOOL v8 = [(TITypingAssertion *)self isActive];
    if (v5 != v8)
    {
      [(TITypingAssertion *)self _sbsSetTypingActive:v8];
    }
  }
}

- (void)restTouchStartWithPathIndex:(int64_t)a3
{
  if (!self->_restingPathIndices)
  {
    BOOL v5 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    restingPathIndices = self->_restingPathIndices;
    self->_restingPathIndices = v5;
  }
  BOOL v7 = [(TITypingAssertion *)self isActive];
  BOOL v8 = self->_restingPathIndices;
  uint64_t v9 = [NSNumber numberWithInteger:a3];
  [(NSMutableSet *)v8 addObject:v9];

  BOOL v10 = [(TITypingAssertion *)self isActive];
  if (v7 != v10)
  {
    [(TITypingAssertion *)self _sbsSetTypingActive:v10];
  }
}

- (void)restResetTouches
{
  if (self->_restingPathIndices)
  {
    BOOL v3 = [(TITypingAssertion *)self isActive];
    restingPathIndices = self->_restingPathIndices;
    self->_restingPathIndices = 0;

    BOOL v5 = [(TITypingAssertion *)self isActive];
    if (v3 != v5)
    {
      [(TITypingAssertion *)self _sbsSetTypingActive:v5];
    }
  }
}

- (void)setActive:(BOOL)a3
{
  if (self->_active != a3)
  {
    BOOL v5 = [(TITypingAssertion *)self isActive];
    self->_active = a3;
    BOOL v6 = [(TITypingAssertion *)self isActive];
    if (v5 != v6)
    {
      [(TITypingAssertion *)self _sbsSetTypingActive:v6];
    }
  }
}

- (BOOL)isActive
{
  return self->_active || (unint64_t)[(NSMutableSet *)self->_restingPathIndices count] > 2;
}

- (TITypingAssertion)init
{
  v8.receiver = self;
  v8.super_class = (Class)TITypingAssertion;
  v2 = [(TITypingAssertion *)&v8 init];
  BOOL v3 = v2;
  if (v2)
  {
    [(TITypingAssertion *)v2 _sbsSetTypingActive:0];
    uint64_t v10 = 0;
    v11 = &v10;
    uint64_t v12 = 0x2050000000;
    v4 = (void *)getPSPointerClientControllerClass_softClass;
    uint64_t v13 = getPSPointerClientControllerClass_softClass;
    if (!getPSPointerClientControllerClass_softClass)
    {
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __getPSPointerClientControllerClass_block_invoke;
      v9[3] = &unk_1E6E2E248;
      v9[4] = &v10;
      __getPSPointerClientControllerClass_block_invoke((uint64_t)v9);
      v4 = (void *)v11[3];
    }
    BOOL v5 = v4;
    _Block_object_dispose(&v10, 8);
    id v6 = objc_alloc_init(v5);
    [(TITypingAssertion *)v3 setPointerClientController:v6];
  }
  return v3;
}

- (void)dealloc
{
  [(NSTimer *)self->_timer invalidate];
  v3.receiver = self;
  v3.super_class = (Class)TITypingAssertion;
  [(TITypingAssertion *)&v3 dealloc];
}

+ (id)sharedTypingAssertion
{
  if (sharedTypingAssertion_onceToken != -1) {
    dispatch_once(&sharedTypingAssertion_onceToken, &__block_literal_global_18723);
  }
  v2 = (void *)sharedTypingAssertion___sharedInstance;

  return v2;
}

uint64_t __42__TITypingAssertion_sharedTypingAssertion__block_invoke()
{
  v0 = objc_alloc_init(TITypingAssertion);
  uint64_t v1 = sharedTypingAssertion___sharedInstance;
  sharedTypingAssertion___sharedInstance = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

@end