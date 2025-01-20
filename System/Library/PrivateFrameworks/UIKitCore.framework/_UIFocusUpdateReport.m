@interface _UIFocusUpdateReport
- (BOOL)shouldLog;
- (UIFocusSystem)focusSystem;
- (UIFocusUpdateContext)context;
- (_UIFocusUpdateReport)init;
- (_UIFocusUpdateReport)initWithFocusSystem:(id)a3;
- (void)setContext:(id)a3;
@end

@implementation _UIFocusUpdateReport

- (_UIFocusUpdateReport)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"_UIFocusUpdateReport.m" lineNumber:20 description:@"-init is not a valid initializer for this class."];

  return 0;
}

- (_UIFocusUpdateReport)initWithFocusSystem:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"_UIFocusUpdateReport.m", 26, @"Invalid parameter not satisfying: %@", @"focusSystem" object file lineNumber description];
  }
  v10.receiver = self;
  v10.super_class = (Class)_UIFocusUpdateReport;
  v6 = [(_UIFocusUpdateReport *)&v10 init];
  v7 = v6;
  if (v6) {
    objc_storeWeak((id *)&v6->_focusSystem, v5);
  }

  return v7;
}

- (BOOL)shouldLog
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_focusSystem);
  if (WeakRetained && (context = self->_context) != 0)
  {
    id v5 = context;
    BOOL v6 = [(UIFocusUpdateContext *)v5 _isValidInFocusSystem:WeakRetained];
    v7 = [(UIFocusUpdateContext *)v5 _validationReport];
    v8 = [(UIFocusUpdateContext *)v5 _preferredFocusReport];

    if (v6)
    {
      BOOL v9 = 0;
    }
    else if (v7)
    {
      v11 = [v7 issues];
      if ([v11 count])
      {
        BOOL v9 = 0;
      }
      else if (v8)
      {
        BOOL v9 = [v8 messageCount] == 0;
      }
      else
      {
        BOOL v9 = 1;
      }
    }
    else if (v8)
    {
      BOOL v9 = [v8 messageCount] == 0;
    }
    else
    {
      BOOL v9 = 1;
    }
    BOOL v10 = !v9;
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (UIFocusSystem)focusSystem
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_focusSystem);
  return (UIFocusSystem *)WeakRetained;
}

- (UIFocusUpdateContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_destroyWeak((id *)&self->_focusSystem);
}

@end