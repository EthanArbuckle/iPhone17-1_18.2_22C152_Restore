@interface CRLAccessibilityBlockBasedCustomAction
+ (void)addActionToArray:(id)a3 withName:(id)a4 actionBlock:(id)a5;
+ (void)addActionToArray:(id)a3 withName:(id)a4 categoryName:(id)a5 actionBlock:(id)a6;
- (BOOL)_performActionBlock;
- (CRLAccessibilityBlockBasedCustomAction)initWithName:(id)a3 actionBlock:(id)a4;
- (CRLAccessibilityBlockBasedCustomAction)initWithName:(id)a3 actionBlock:(id)a4 identifier:(id)a5;
- (CRLAccessibilityBlockBasedCustomAction)initWithName:(id)a3 categoryName:(id)a4 actionBlock:(id)a5;
- (NSString)identifier;
- (id)_accessibilityCustomActionIdentifier;
- (id)actionBlock;
- (id)description;
- (void)setActionBlock:(id)a3;
- (void)setIdentifier:(id)a3;
@end

@implementation CRLAccessibilityBlockBasedCustomAction

+ (void)addActionToArray:(id)a3 withName:(id)a4 actionBlock:(id)a5
{
}

+ (void)addActionToArray:(id)a3 withName:(id)a4 categoryName:(id)a5 actionBlock:(id)a6
{
  id v21 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  int ShouldPerformValidationChecks = CRLAccessibilityShouldPerformValidationChecks();
  if (!v21)
  {
    if (ShouldPerformValidationChecks)
    {
      int ShouldCrashOnValidationErrorAfterLaunch = CRLAccessibilityShouldCrashOnValidationErrorAfterLaunch();
      if (__CRLAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, @"Array cannot be nil!", v14, v15, v16, v17, v18, v20))abort(); {
    }
      }
  }
  v19 = [[CRLAccessibilityBlockBasedCustomAction alloc] initWithName:v9 categoryName:v10 actionBlock:v11];
  [v21 addObject:v19];
}

- (CRLAccessibilityBlockBasedCustomAction)initWithName:(id)a3 actionBlock:(id)a4 identifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (CRLAccessibilityShouldPerformValidationChecks())
  {
    if (![v10 length])
    {
      int ShouldCrashOnValidationErrorAfterLaunch = CRLAccessibilityShouldCrashOnValidationErrorAfterLaunch();
      if (__CRLAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, @"An identifier is required to prevent issues with UIAccessibility!", v12, v13, v14, v15, v16, (uint64_t)v23.receiver))abort(); {
    }
      }
  }
  v23.receiver = self;
  v23.super_class = (Class)CRLAccessibilityBlockBasedCustomAction;
  uint64_t v17 = [(CRLAccessibilityBlockBasedCustomAction *)&v23 initWithName:v8 target:self selector:"_performActionBlock"];
  if (v17)
  {
    id v18 = [v9 copy];
    id actionBlock = v17->_actionBlock;
    v17->_id actionBlock = v18;

    uint64_t v20 = (NSString *)[v10 copy];
    identifier = v17->_identifier;
    v17->_identifier = v20;
  }
  return v17;
}

- (CRLAccessibilityBlockBasedCustomAction)initWithName:(id)a3 categoryName:(id)a4 actionBlock:(id)a5
{
  id v8 = a4;
  id v9 = [(CRLAccessibilityBlockBasedCustomAction *)self initWithName:a3 actionBlock:a5];
  if (v9 && (objc_opt_respondsToSelector() & 1) != 0) {
    [(CRLAccessibilityBlockBasedCustomAction *)v9 setLocalizedActionRotorCategory:v8];
  }

  return v9;
}

- (CRLAccessibilityBlockBasedCustomAction)initWithName:(id)a3 actionBlock:(id)a4
{
  return [(CRLAccessibilityBlockBasedCustomAction *)self initWithName:a3 actionBlock:a4 identifier:a3];
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
  id actionBlock = (uint64_t (**)(void))self->_actionBlock;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong(&self->_actionBlock, 0);
}

@end