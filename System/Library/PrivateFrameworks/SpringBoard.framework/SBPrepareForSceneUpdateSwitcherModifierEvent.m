@interface SBPrepareForSceneUpdateSwitcherModifierEvent
- (NSArray)liveAppLayouts;
- (SBPrepareForSceneUpdateSwitcherModifierEvent)initWithLiveAppLayouts:(id)a3;
- (int64_t)type;
@end

@implementation SBPrepareForSceneUpdateSwitcherModifierEvent

- (int64_t)type
{
  return 30;
}

- (SBPrepareForSceneUpdateSwitcherModifierEvent)initWithLiveAppLayouts:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBPrepareForSceneUpdateSwitcherModifierEvent;
  v6 = [(SBPrepareForSceneUpdateSwitcherModifierEvent *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_liveAppLayouts, a3);
  }

  return v7;
}

- (NSArray)liveAppLayouts
{
  return self->_liveAppLayouts;
}

- (void).cxx_destruct
{
}

@end