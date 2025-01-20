@interface SBCancelSystemGesturesSwitcherEventResponse
- (NSSet)systemGestureTypes;
- (SBCancelSystemGesturesSwitcherEventResponse)init;
- (SBCancelSystemGesturesSwitcherEventResponse)initWithSystemGestureType:(unint64_t)a3;
- (SBCancelSystemGesturesSwitcherEventResponse)initWithSystemGestureTypes:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (int64_t)type;
@end

@implementation SBCancelSystemGesturesSwitcherEventResponse

- (SBCancelSystemGesturesSwitcherEventResponse)init
{
  return [(SBCancelSystemGesturesSwitcherEventResponse *)self initWithSystemGestureType:0];
}

- (SBCancelSystemGesturesSwitcherEventResponse)initWithSystemGestureType:(unint64_t)a3
{
  v4 = (void *)MEMORY[0x1E4F1CAD0];
  v5 = [NSNumber numberWithUnsignedInteger:a3];
  v6 = [v4 setWithObject:v5];
  v7 = [(SBCancelSystemGesturesSwitcherEventResponse *)self initWithSystemGestureTypes:v6];

  return v7;
}

- (SBCancelSystemGesturesSwitcherEventResponse)initWithSystemGestureTypes:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBCancelSystemGesturesSwitcherEventResponse;
  v5 = [(SBChainableModifierEventResponse *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    systemGestureTypes = v5->_systemGestureTypes;
    v5->_systemGestureTypes = (NSSet *)v6;
  }
  return v5;
}

- (int64_t)type
{
  return 45;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SBCancelSystemGesturesSwitcherEventResponse;
  id v4 = [(SBChainableModifierEventResponse *)&v7 descriptionBuilderWithMultilinePrefix:a3];
  id v5 = (id)[v4 appendObject:self->_systemGestureTypes withName:@"systemGestureTypes"];
  return v4;
}

- (NSSet)systemGestureTypes
{
  return self->_systemGestureTypes;
}

- (void).cxx_destruct
{
}

@end