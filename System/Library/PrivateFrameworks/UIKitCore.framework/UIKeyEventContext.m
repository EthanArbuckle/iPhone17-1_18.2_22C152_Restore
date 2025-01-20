@interface UIKeyEventContext
- (BOOL)documentIsEditable;
- (BOOL)shouldEvaluateForInputSystemHandling;
- (BOOL)shouldInsertChar;
- (UIKeyEvent)keyEvent;
- (UIKeyEventContext)init;
- (UIKeyEventContext)initWithKeyEvent:(id)a3;
- (void)setDocumentIsEditable:(BOOL)a3;
- (void)setShouldEvaluateForInputSystemHandling:(BOOL)a3;
- (void)setShouldInsertChar:(BOOL)a3;
@end

@implementation UIKeyEventContext

- (UIKeyEventContext)initWithKeyEvent:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UIKeyEventContext;
  v6 = [(UIKeyEventContext *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_keyEvent, a3);
  }

  return v7;
}

- (UIKeyEventContext)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"UIKeyEventContext.m", 21, @"%s is not available. Use a designated initializer instead.", "-[UIKeyEventContext init]");

  return 0;
}

- (UIKeyEvent)keyEvent
{
  return self->_keyEvent;
}

- (BOOL)documentIsEditable
{
  return self->_documentIsEditable;
}

- (void)setDocumentIsEditable:(BOOL)a3
{
  self->_documentIsEditable = a3;
}

- (BOOL)shouldInsertChar
{
  return self->_shouldInsertChar;
}

- (void)setShouldInsertChar:(BOOL)a3
{
  self->_shouldInsertChar = a3;
}

- (BOOL)shouldEvaluateForInputSystemHandling
{
  return self->_shouldEvaluateForInputSystemHandling;
}

- (void)setShouldEvaluateForInputSystemHandling:(BOOL)a3
{
  self->_shouldEvaluateForInputSystemHandling = a3;
}

- (void).cxx_destruct
{
}

@end