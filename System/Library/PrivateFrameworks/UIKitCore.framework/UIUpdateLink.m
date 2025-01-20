@interface UIUpdateLink
+ (id)updateLinkForView:(id)a3;
+ (id)updateLinkForView:(id)a3 actionHandler:(id)a4;
+ (id)updateLinkForView:(id)a3 actionTarget:(id)a4 selector:(SEL)a5;
+ (id)updateLinkForWindowScene:(id)a3;
+ (id)updateLinkForWindowScene:(id)a3 actionHandler:(id)a4;
+ (id)updateLinkForWindowScene:(id)a3 actionTarget:(id)a4 selector:(SEL)a5;
- (BOOL)isEnabled;
- (BOOL)requiresContinuousUpdates;
- (BOOL)wantsImmediatePresentation;
- (BOOL)wantsLowLatencyEventDispatch;
- (CAFrameRateRange)preferredFrameRateRange;
- (id)_init;
- (id)currentUpdateInfo;
- (uint64_t)_modifyRequest:(uint64_t)result;
- (uint64_t)_modifyRequestFlags:(int)a3 on:;
- (void)_setActive:(uint64_t)a1;
- (void)addActionToPhase:(id)a3 handler:(id)a4;
- (void)addActionToPhase:(id)a3 target:(id)a4 selector:(SEL)a5;
- (void)addActionWithHandler:(id)a3;
- (void)addActionWithTarget:(id)a3 selector:(SEL)a4;
- (void)dealloc;
- (void)setEnabled:(BOOL)a3;
- (void)setPreferredFrameRateRange:(CAFrameRateRange)a3;
- (void)setRequiresContinuousUpdates:(BOOL)a3;
- (void)setWantsImmediatePresentation:(BOOL)a3;
- (void)setWantsLowLatencyEventDispatch:(BOOL)a3;
@end

@implementation UIUpdateLink

- (id)_init
{
  if (result)
  {
    v1.receiver = result;
    v1.super_class = (Class)UIUpdateLink;
    result = objc_msgSendSuper2(&v1, sel_init);
    if (result)
    {
      *((void *)result + 1) = 0;
      *((_DWORD *)result + 4) = 0;
    }
  }
  return result;
}

- (void)dealloc
{
  if (self && self->_engaged)
  {
    self->_engaged = 0;
    -[UIUpdateLink _setActive:]((uint64_t)self, 0);
  }
  slh_first = self->_actions.slh_first;
  if (slh_first)
  {
    do
    {
      v5 = *(ActionListItem **)slh_first;
      v4 = (void *)*((void *)slh_first + 1);
      *((void *)slh_first + 1) = 0;

      v6 = (void *)*((void *)slh_first + 2);
      *((void *)slh_first + 2) = 0;

      free(slh_first);
      slh_first = v5;
    }
    while (v5);
  }
  v7.receiver = self;
  v7.super_class = (Class)UIUpdateLink;
  [(UIUpdateLink *)&v7 dealloc];
}

- (void)addActionToPhase:(id)a3 handler:(id)a4
{
  objc_super v7 = (char *)malloc_type_calloc(1uLL, 0x28uLL, 0xA0040B0408BC2uLL);
  v8 = _Block_copy(a4);
  v9 = (void *)*((void *)v7 + 1);
  *((void *)v7 + 1) = v8;

  v10 = v7 + 16;
  objc_storeStrong((id *)v7 + 2, a3);
  *((void *)v7 + 3) = self;
  *(void *)objc_super v7 = self->_actions.slh_first;
  self->_actions.slh_first = (ActionListItem *)v7;
  if (self->_active)
  {
    if (*(void *)v10) {
      inserted = _UIUpdateSequenceInsertItem(*(void **)(*(void *)v10 + 16), *(_DWORD *)(*(void *)v10 + 8), (uint64_t)"UIUpdateLink", 0, (uint64_t)v7, &__block_literal_global_354);
    }
    else {
      inserted = 0;
    }
    *((void *)v7 + 4) = inserted;
  }
}

- (void)addActionToPhase:(id)a3 target:(id)a4 selector:(SEL)a5
{
  objc_initWeak(&location, a4);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __49__UIUpdateLink_addActionToPhase_target_selector___block_invoke;
  v8[3] = &unk_1E52FC5D0;
  objc_copyWeak(v9, &location);
  v9[1] = (id)a5;
  [(UIUpdateLink *)self addActionToPhase:a3 handler:v8];
  objc_destroyWeak(v9);
  objc_destroyWeak(&location);
}

void __49__UIUpdateLink_addActionToPhase_target_selector___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v8 = WeakRetained;
    objc_super v7 = *(const char **)(a1 + 40);
    if (dyld_program_sdk_at_least()) {
      objc_msgSend(v8, v7, a2, a3);
    }
    else {
      objc_msgSend(v8, sel_performSelector_withObject_withObject_, v7, a2, a3);
    }
    id WeakRetained = v8;
  }
}

- (void)setEnabled:(BOOL)a3
{
  if (self->_enabled != a3)
  {
    self->_enabled = a3;
    int v3 = a3 && self->_engaged;
    -[UIUpdateLink _setActive:]((uint64_t)self, v3);
  }
}

- (void)_setActive:(uint64_t)a1
{
  if (a1 && *(unsigned __int8 *)(a1 + 49) != a2)
  {
    *(unsigned char *)(a1 + 49) = a2;
    v4 = (int *)(a1 + 16);
    if (a2)
    {
      _UIUpdateRequestRegistryAddRecord((uint64_t)&mainRegistry, v4, 0x10003Au);
      for (i = *(void **)(a1 + 8); i; i = (void *)*i)
      {
        uint64_t v6 = i[2];
        if (v6) {
          inserted = _UIUpdateSequenceInsertItem(*(void **)(v6 + 16), *(_DWORD *)(v6 + 8), (uint64_t)"UIUpdateLink", 0, (uint64_t)i, &__block_literal_global_354);
        }
        else {
          inserted = 0;
        }
        i[4] = inserted;
      }
    }
    else
    {
      _UIUpdateRequestRegistryRemoveRecord((uint64_t)&mainRegistry, v4, 0x10003Au);
      for (j = *(void **)(a1 + 8); j; j = (void *)*j)
      {
        uint64_t v9 = j[4];
        if (v9)
        {
          int v10 = *(_DWORD *)(v9 + 24);
          if (v10) {
            *(_DWORD *)(v9 + 24) = v10 | 2;
          }
          else {
            _removeItem((_UIUpdateSequenceItemInternal *)v9);
          }
        }
        j[4] = 0;
      }
    }
  }
}

- (uint64_t)_modifyRequest:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    if (*(unsigned char *)(result + 49)) {
      _UIUpdateRequestRegistryRemoveRecord((uint64_t)&mainRegistry, (_DWORD *)(result + 16), 0x10003Au);
    }
    result = (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
    if (*(unsigned char *)(v3 + 49))
    {
      return _UIUpdateRequestRegistryAddRecord((uint64_t)&mainRegistry, (int *)(v3 + 16), 0x10003Au);
    }
  }
  return result;
}

- (uint64_t)_modifyRequestFlags:(int)a3 on:
{
  if (result)
  {
    int v3 = *(_DWORD *)(result + 16);
    int v4 = v3 | a2;
    if (!a3) {
      int v4 = v3 & ~a2;
    }
    if (v4 != v3)
    {
      v5[0] = MEMORY[0x1E4F143A8];
      v5[1] = 3221225472;
      v5[2] = __39__UIUpdateLink__modifyRequestFlags_on___block_invoke;
      v5[3] = &unk_1E52E7FF0;
      v5[4] = result;
      int v6 = v4;
      return -[UIUpdateLink _modifyRequest:](result, (uint64_t)v5);
    }
  }
  return result;
}

uint64_t __39__UIUpdateLink__modifyRequestFlags_on___block_invoke(uint64_t result)
{
  *(_DWORD *)(*(void *)(result + 32) + 16) = *(_DWORD *)(result + 40);
  return result;
}

- (BOOL)requiresContinuousUpdates
{
  return (LOBYTE(self->_request.flags) >> 2) & 1;
}

- (void)setRequiresContinuousUpdates:(BOOL)a3
{
  if (self->_actions.slh_first)
  {
    -[UIUpdateLink _modifyRequestFlags:on:]((uint64_t)self, 4, a3);
  }
  else
  {
    _os_crash();
    __break(1u);
  }
}

- (BOOL)wantsLowLatencyEventDispatch
{
  return (LOBYTE(self->_request.flags) >> 4) & 1;
}

- (void)setWantsLowLatencyEventDispatch:(BOOL)a3
{
  BOOL v3 = a3;
  if (qword_1EB261BE0 != -1) {
    dispatch_once(&qword_1EB261BE0, &__block_literal_global_62_0);
  }
  if (_MergedGlobals_1140 == 1)
  {
    -[UIUpdateLink _modifyRequestFlags:on:]((uint64_t)self, 16, v3);
  }
}

- (BOOL)wantsImmediatePresentation
{
  return (LOBYTE(self->_request.flags) >> 6) & 1;
}

- (void)setWantsImmediatePresentation:(BOOL)a3
{
  BOOL v3 = a3;
  if (qword_1EB261BE0 != -1) {
    dispatch_once(&qword_1EB261BE0, &__block_literal_global_62_0);
  }
  if (_MergedGlobals_1140 == 1)
  {
    -[UIUpdateLink _modifyRequestFlags:on:]((uint64_t)self, 64, v3);
  }
}

- (CAFrameRateRange)preferredFrameRateRange
{
  return CAFrameRateRangeMake((float)self->_request.minRate, (float)self->_request.maxRate, (float)self->_request.preferredRate);
}

- (void)setPreferredFrameRateRange:(CAFrameRateRange)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __43__UIUpdateLink_setPreferredFrameRateRange___block_invoke;
  v3[3] = &unk_1E52FC5F8;
  v3[4] = self;
  CAFrameRateRange v4 = a3;
  -[UIUpdateLink _modifyRequest:]((uint64_t)self, (uint64_t)v3);
}

float __43__UIUpdateLink_setPreferredFrameRateRange___block_invoke(uint64_t a1)
{
  float v1 = *(float *)(a1 + 44);
  *(_DWORD *)(*(void *)(a1 + 32) + 20) = *(float *)(a1 + 40);
  *(_DWORD *)(*(void *)(a1 + 32) + 28) = v1;
  float result = *(float *)(a1 + 48);
  *(_DWORD *)(*(void *)(a1 + 32) + 24) = result;
  return result;
}

- (id)currentUpdateInfo
{
  if (off_1EB256BF8 && *((_DWORD *)off_1EB256BF8 + 160) == 1) {
    v2 = -[UIUpdateInfo initWithUpdateParameters:]([UIUpdateInfo alloc], (uint64_t)off_1EB256BF8 + 648);
  }
  else {
    v2 = 0;
  }
  return v2;
}

+ (id)updateLinkForWindowScene:(id)a3
{
  return _UIUpdateLinkMakeTrackingScene(a3);
}

+ (id)updateLinkForView:(id)a3
{
  return _UIUpdateLinkMakeTrackingView(a3);
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)addActionWithHandler:(id)a3
{
  id v5 = +[UIUpdateActionPhase afterCADisplayLinkDispatch];
  [(UIUpdateLink *)self addActionToPhase:v5 handler:a3];
}

- (void)addActionWithTarget:(id)a3 selector:(SEL)a4
{
  id v7 = +[UIUpdateActionPhase afterCADisplayLinkDispatch];
  [(UIUpdateLink *)self addActionToPhase:v7 target:a3 selector:a4];
}

+ (id)updateLinkForWindowScene:(id)a3 actionHandler:(id)a4
{
  id v5 = +[UIUpdateLink updateLinkForWindowScene:a3];
  [v5 addActionWithHandler:a4];
  return v5;
}

+ (id)updateLinkForWindowScene:(id)a3 actionTarget:(id)a4 selector:(SEL)a5
{
  id v7 = +[UIUpdateLink updateLinkForWindowScene:a3];
  [v7 addActionWithTarget:a4 selector:a5];
  return v7;
}

+ (id)updateLinkForView:(id)a3 actionHandler:(id)a4
{
  id v5 = +[UIUpdateLink updateLinkForView:a3];
  [v5 addActionWithHandler:a4];
  return v5;
}

+ (id)updateLinkForView:(id)a3 actionTarget:(id)a4 selector:(SEL)a5
{
  id v7 = +[UIUpdateLink updateLinkForView:a3];
  [v7 addActionWithTarget:a4 selector:a5];
  return v7;
}

@end