@interface _TUIElementToggleBuilder
- (BOOL)enabled;
- (BOOL)isOn;
- (NSString)name;
- (TUIMutableDynamicValue)viewState;
- (id)finalizeAnimationGroups;
- (void)addAnimationGroup:(id)a3 withName:(id)a4;
- (void)setEnabled:(BOOL)a3;
- (void)setIsOn:(BOOL)a3;
- (void)setName:(id)a3;
- (void)setViewState:(id)a3;
@end

@implementation _TUIElementToggleBuilder

- (void)addAnimationGroup:(id)a3 withName:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  animations = self->_animations;
  if (!animations)
  {
    v8 = (NSMutableDictionary *)objc_opt_new();
    v9 = self->_animations;
    self->_animations = v8;

    animations = self->_animations;
  }
  [(NSMutableDictionary *)animations setObject:v10 forKeyedSubscript:v6];
}

- (id)finalizeAnimationGroups
{
  v3 = objc_alloc_init(TUIAnimationGroupCollection);
  [(TUIAnimationGroupCollection *)v3 setGroups:self->_animations];

  return v3;
}

- (TUIMutableDynamicValue)viewState
{
  return self->_viewState;
}

- (void)setViewState:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (BOOL)isOn
{
  return self->_isOn;
}

- (void)setIsOn:(BOOL)a3
{
  self->_isOn = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_viewState, 0);

  objc_storeStrong((id *)&self->_animations, 0);
}

@end