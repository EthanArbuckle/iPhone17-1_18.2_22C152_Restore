@interface UIAnimatorScreenLink
+ (id)startTimerWithScreen:(id)a3 action:(id)a4;
- (unsigned)animationCount;
- (void)dealloc;
- (void)invalidate;
- (void)onDisplayLink:(id)a3;
- (void)setAnimationCount:(unsigned __int16)a3;
@end

@implementation UIAnimatorScreenLink

+ (id)startTimerWithScreen:(id)a3 action:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = objc_alloc_init(UIAnimatorScreenLink);
  v8 = _Block_copy(v6);

  id updateAction = v7->_updateAction;
  v7->_id updateAction = v8;

  v7->_animationCount = 1;
  if (_UIUpdateCycleEnabled() && [v5 _isEmbeddedScreen])
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __52__UIAnimatorScreenLink_startTimerWithScreen_action___block_invoke;
    v16[3] = &unk_1E52DC470;
    v17 = v7;
    v17->_updateSequenceItem = (_UIUpdateSequenceItemInternal *)_UIUpdateSequenceInsertItem(_UIUpdateSequenceCADisplayLinksItemInternal, 1, (uint64_t)"UIAnimation", 0, 0, v16);
    _UIUpdateRequestRegistryAddRecord((uint64_t)&mainRegistry, _animatorUpdateRequest, 0x10002Au);
    displayLink = (CADisplayLink *)v17;
  }
  else
  {
    if (v5) {
      v11 = v5;
    }
    else {
      v11 = (void *)MEMORY[0x1E4F39B68];
    }
    uint64_t v12 = [v11 displayLinkWithTarget:v7 selector:sel_onDisplayLink_];
    displayLink = v7->_displayLink;
    v7->_displayLink = (CADisplayLink *)v12;
  }

  v13 = v7->_displayLink;
  if (v13)
  {
    v14 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
    [(CADisplayLink *)v13 addToRunLoop:v14 forMode:*MEMORY[0x1E4F1C4B0]];
  }
  return v7;
}

uint64_t __52__UIAnimatorScreenLink_startTimerWithScreen_action___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 24) + 16))();
}

- (void)onDisplayLink:(id)a3
{
  id updateAction = self->_updateAction;
  [a3 timestamp];
  v4 = (void (*)(void *))updateAction[2];
  v4(updateAction);
}

- (void)invalidate
{
  self->_animationCount = 0;
  displayLink = self->_displayLink;
  if (displayLink)
  {
    [(CADisplayLink *)displayLink invalidate];
    v4 = self->_displayLink;
    self->_displayLink = 0;
  }
  if (_UIUpdateCycleEnabled())
  {
    updateSequenceItem = self->_updateSequenceItem;
    if (updateSequenceItem)
    {
      int v6 = *((_DWORD *)updateSequenceItem + 6);
      if (v6) {
        *((_DWORD *)updateSequenceItem + 6) = v6 | 2;
      }
      else {
        _removeItem(updateSequenceItem);
      }
      self->_updateSequenceItem = 0;
      _UIUpdateRequestRegistryRemoveRecord((uint64_t)&mainRegistry, _animatorUpdateRequest, 0x10002Au);
    }
  }
}

- (void)dealloc
{
  [(UIAnimatorScreenLink *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)UIAnimatorScreenLink;
  [(UIAnimatorScreenLink *)&v3 dealloc];
}

- (unsigned)animationCount
{
  return self->_animationCount;
}

- (void)setAnimationCount:(unsigned __int16)a3
{
  self->_animationCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_updateAction, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
}

@end