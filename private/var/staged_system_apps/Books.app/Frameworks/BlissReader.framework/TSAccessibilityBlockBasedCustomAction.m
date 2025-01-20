@interface TSAccessibilityBlockBasedCustomAction
+ (void)addActionToArray:(id)a3 withName:(id)a4 actionBlock:(id)a5;
- (BOOL)_performActionBlock;
- (NSString)identifier;
- (TSAccessibilityBlockBasedCustomAction)initWithName:(id)a3 actionBlock:(id)a4;
- (TSAccessibilityBlockBasedCustomAction)initWithName:(id)a3 actionBlock:(id)a4 identifier:(id)a5;
- (id)_accessibilityCustomActionIdentifier;
- (id)actionBlock;
- (id)description;
- (void)dealloc;
- (void)setActionBlock:(id)a3;
- (void)setIdentifier:(id)a3;
@end

@implementation TSAccessibilityBlockBasedCustomAction

+ (void)addActionToArray:(id)a3 withName:(id)a4 actionBlock:(id)a5
{
  int ShouldPerformValidationChecks = TSAccessibilityShouldPerformValidationChecks();
  if (!a3)
  {
    if (ShouldPerformValidationChecks)
    {
      int ShouldCrashOnValidationErrorAfterLaunch = TSAccessibilityShouldCrashOnValidationErrorAfterLaunch();
      if (__TSAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, @"Array cannot be nil!", v10, v11, v12, v13, v14, v15))abort(); {
    }
      }
  }
  v16 = [[TSAccessibilityBlockBasedCustomAction alloc] initWithName:a4 actionBlock:a5];
  [a3 addObject:v16];
}

- (TSAccessibilityBlockBasedCustomAction)initWithName:(id)a3 actionBlock:(id)a4 identifier:(id)a5
{
  if (TSAccessibilityShouldPerformValidationChecks())
  {
    if (![a5 length])
    {
      int ShouldCrashOnValidationErrorAfterLaunch = TSAccessibilityShouldCrashOnValidationErrorAfterLaunch();
      if (__TSAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, @"An identifier is required to prevent issues with UIAccessibility!", v10, v11, v12, v13, v14, (uint64_t)v17.receiver))abort(); {
    }
      }
  }
  v17.receiver = self;
  v17.super_class = (Class)TSAccessibilityBlockBasedCustomAction;
  uint64_t v15 = [(TSAccessibilityBlockBasedCustomAction *)&v17 initWithName:a3 target:self selector:"_performActionBlock"];
  if (v15)
  {
    v15->_actionBlock = [a4 copy];
    v15->_identifier = (NSString *)[a5 copy];
  }
  return v15;
}

- (TSAccessibilityBlockBasedCustomAction)initWithName:(id)a3 actionBlock:(id)a4
{
  return [(TSAccessibilityBlockBasedCustomAction *)self initWithName:a3 actionBlock:a4 identifier:a3];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TSAccessibilityBlockBasedCustomAction;
  [(TSAccessibilityBlockBasedCustomAction *)&v3 dealloc];
}

- (id)_accessibilityCustomActionIdentifier
{
  return +[NSString stringWithString:self->_identifier];
}

- (id)description
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<%@ %p; identifier=%@>",
           objc_opt_class(),
           self,
           self->_identifier);
}

- (BOOL)_performActionBlock
{
  actionBlock = (uint64_t (**)(void))self->_actionBlock;
  if (actionBlock) {
    LOBYTE(actionBlock) = actionBlock[2]();
  }
  return (char)actionBlock;
}

- (id)actionBlock
{
  return self->_actionBlock;
}

- (void)setActionBlock:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

@end