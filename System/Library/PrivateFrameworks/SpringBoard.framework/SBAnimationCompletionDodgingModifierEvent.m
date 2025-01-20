@interface SBAnimationCompletionDodgingModifierEvent
- (BOOL)finished;
- (BOOL)retargeted;
- (NSString)identifier;
- (SBAnimationCompletionDodgingModifierEvent)initWithIdentifier:(id)a3 finished:(BOOL)a4 retargeted:(BOOL)a5;
- (id)description;
- (unint64_t)type;
@end

@implementation SBAnimationCompletionDodgingModifierEvent

- (SBAnimationCompletionDodgingModifierEvent)initWithIdentifier:(id)a3 finished:(BOOL)a4 retargeted:(BOOL)a5
{
  id v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SBAnimationCompletionDodgingModifierEvent;
  v9 = [(SBAnimationCompletionDodgingModifierEvent *)&v13 init];
  if (v9)
  {
    uint64_t v10 = [v8 copy];
    identifier = v9->_identifier;
    v9->_identifier = (NSString *)v10;

    v9->_finished = a4;
    v9->_retargeted = a5;
  }

  return v9;
}

- (unint64_t)type
{
  return 3;
}

- (id)description
{
  v9.receiver = self;
  v9.super_class = (Class)SBAnimationCompletionDodgingModifierEvent;
  v3 = [(SBDodgingModifierEvent *)&v9 description];
  identifier = self->_identifier;
  v5 = NSStringFromBOOL();
  v6 = NSStringFromBOOL();
  v7 = [v3 stringByAppendingFormat:@" %@ finished:%@ retargeted:%@", identifier, v5, v6];

  return v7;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (BOOL)finished
{
  return self->_finished;
}

- (BOOL)retargeted
{
  return self->_retargeted;
}

- (void).cxx_destruct
{
}

@end