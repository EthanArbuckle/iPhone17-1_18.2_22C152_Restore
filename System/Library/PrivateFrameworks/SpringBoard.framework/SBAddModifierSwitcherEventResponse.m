@interface SBAddModifierSwitcherEventResponse
- (NSString)key;
- (SBAddModifierSwitcherEventResponse)initWithModifier:(id)a3 level:(int64_t)a4;
- (SBAddModifierSwitcherEventResponse)initWithModifier:(id)a3 level:(int64_t)a4 key:(id)a5;
- (SBSwitcherModifier)modifier;
- (int64_t)level;
- (int64_t)type;
@end

@implementation SBAddModifierSwitcherEventResponse

- (SBAddModifierSwitcherEventResponse)initWithModifier:(id)a3 level:(int64_t)a4 key:(id)a5
{
  id v10 = a3;
  id v11 = a5;
  if (!v10)
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"SBAddModifierSwitcherEventResponse.m", 22, @"Invalid parameter not satisfying: %@", @"modifier" object file lineNumber description];
  }
  v18.receiver = self;
  v18.super_class = (Class)SBAddModifierSwitcherEventResponse;
  v12 = [(SBChainableModifierEventResponse *)&v18 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_modifier, a3);
    v13->_level = a4;
    uint64_t v14 = [v11 copy];
    key = v13->_key;
    v13->_key = (NSString *)v14;
  }
  return v13;
}

- (SBAddModifierSwitcherEventResponse)initWithModifier:(id)a3 level:(int64_t)a4
{
  return [(SBAddModifierSwitcherEventResponse *)self initWithModifier:a3 level:a4 key:0];
}

- (int64_t)type
{
  return 31;
}

- (SBSwitcherModifier)modifier
{
  return self->_modifier;
}

- (int64_t)level
{
  return self->_level;
}

- (NSString)key
{
  return self->_key;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_modifier, 0);
}

@end