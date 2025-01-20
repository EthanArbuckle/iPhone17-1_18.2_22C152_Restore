@interface SBWorkspaceEntityRemovalContext
- (SBWorkspaceEntityRemovalContext)initWithAnimationStyle:(unint64_t)a3 removalActionType:(unint64_t)a4;
- (unint64_t)animationStyle;
- (unint64_t)removalActionType;
@end

@implementation SBWorkspaceEntityRemovalContext

- (SBWorkspaceEntityRemovalContext)initWithAnimationStyle:(unint64_t)a3 removalActionType:(unint64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)SBWorkspaceEntityRemovalContext;
  result = [(SBWorkspaceEntityRemovalContext *)&v7 init];
  if (result)
  {
    result->_animationStyle = a3;
    result->_removalActionType = a4;
  }
  return result;
}

- (unint64_t)animationStyle
{
  return self->_animationStyle;
}

- (unint64_t)removalActionType
{
  return self->_removalActionType;
}

@end