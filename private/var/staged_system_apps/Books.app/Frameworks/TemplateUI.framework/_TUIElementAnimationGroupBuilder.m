@interface _TUIElementAnimationGroupBuilder
- (NSString)groupName;
- (id)finalizeAnimationGroup;
- (void)addAnimationGroupPhase:(id)a3 withName:(id)a4;
- (void)setGroupName:(id)a3;
@end

@implementation _TUIElementAnimationGroupBuilder

- (void)addAnimationGroupPhase:(id)a3 withName:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  phases = self->_phases;
  if (!phases)
  {
    v8 = (NSMutableDictionary *)objc_opt_new();
    v9 = self->_phases;
    self->_phases = v8;

    phases = self->_phases;
  }
  [(NSMutableDictionary *)phases setObject:v10 forKeyedSubscript:v6];
}

- (id)finalizeAnimationGroup
{
  v3 = objc_alloc_init(TUIAnimationGroup);
  [(TUIAnimationGroup *)v3 setPhases:self->_phases];

  return v3;
}

- (NSString)groupName
{
  return self->_groupName;
}

- (void)setGroupName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupName, 0);

  objc_storeStrong((id *)&self->_phases, 0);
}

@end