@interface ShowKeyboardAction
- (BOOL)isCompatibleWithNavigation;
- (ShowKeyboardAction)initWithInteractionModel:(unint64_t)a3;
- (int)analyticsLaunchActionType;
- (unint64_t)interactionModel;
- (void)setInteractionModel:(unint64_t)a3;
@end

@implementation ShowKeyboardAction

- (ShowKeyboardAction)initWithInteractionModel:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ShowKeyboardAction;
  result = [(ShowKeyboardAction *)&v5 init];
  if (result) {
    result->_interactionModel = a3;
  }
  return result;
}

- (BOOL)isCompatibleWithNavigation
{
  return 1;
}

- (int)analyticsLaunchActionType
{
  return 31;
}

- (unint64_t)interactionModel
{
  return self->_interactionModel;
}

- (void)setInteractionModel:(unint64_t)a3
{
  self->_interactionModel = a3;
}

@end