@interface _UIFocusTest
+ (_UIFocusTest)currentTest;
+ (void)_setCurrentTest:(id)a3;
- (BOOL)_isApplicationTest;
- (NSString)identifier;
- (_UIFocusTest)initWithIdentifier:(id)a3;
- (_UIFocusTestDelegate)delegate;
- (id)runCompletionHandler;
- (int64_t)state;
- (void)_finish:(BOOL)a3;
- (void)_start;
- (void)cancel;
- (void)prepareWithCompletionHandler:(id)a3;
- (void)reset;
- (void)runWithCompletionHandler:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIsApplicationTest:(BOOL)a3;
- (void)setRunCompletionHandler:(id)a3;
- (void)setState:(int64_t)a3;
- (void)stop;
@end

@implementation _UIFocusTest

- (_UIFocusTest)initWithIdentifier:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"_UIFocusTest.m", 26, @"Invalid parameter not satisfying: %@", @"identifier" object file lineNumber description];
  }
  if ([v5 isEqualToString:&stru_1ED0E84C0])
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"_UIFocusTest.m" lineNumber:27 description:@"Focus tests require a non-empty identifier."];
  }
  v12.receiver = self;
  v12.super_class = (Class)_UIFocusTest;
  v6 = [(_UIFocusTest *)&v12 init];
  if (v6)
  {
    uint64_t v7 = [v5 copy];
    identifier = v6->_identifier;
    v6->_identifier = (NSString *)v7;

    v6->_state = 0;
    v6->_isApplicationTest = 1;
  }

  return v6;
}

+ (_UIFocusTest)currentTest
{
  return (_UIFocusTest *)(id)__currentTest;
}

+ (void)_setCurrentTest:(id)a3
{
  id v4 = a3;
  if ((id)__currentTest != v4)
  {
    id v5 = v4;
    [(id)__currentTest cancel];
    objc_storeStrong((id *)&__currentTest, a3);
    id v4 = v5;
  }
}

- (void)runWithCompletionHandler:(id)a3
{
  id v4 = a3;
  if ([(_UIFocusTest *)self state]) {
    [(_UIFocusTest *)self reset];
  }
  +[_UIFocusTest _setCurrentTest:self];
  [(_UIFocusTest *)self setState:1];
  [(_UIFocusTest *)self setRunCompletionHandler:v4];

  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __41___UIFocusTest_runWithCompletionHandler___block_invoke;
  v5[3] = &unk_1E52D9F70;
  v5[4] = self;
  [(_UIFocusTest *)self prepareWithCompletionHandler:v5];
}

- (void)prepareWithCompletionHandler:(id)a3
{
}

- (void)_start
{
  if ([(_UIFocusTest *)self state] != 1)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"_UIFocusTest.m" lineNumber:82 description:@"Cannot start a test that has already been started."];
  }
  id v7 = [(_UIFocusTest *)self delegate];
  if (v7 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v7 _focusTestWillStart:self];
  }
  [(_UIFocusTest *)self setState:2];
  if ([(_UIFocusTest *)self _isApplicationTest])
  {
    id v4 = (void *)UIApp;
    id v5 = [(_UIFocusTest *)self identifier];
    [v4 startedTest:v5];
  }
  [(_UIFocusTest *)self main];
}

- (void)stop
{
}

- (void)cancel
{
}

- (void)reset
{
  [(_UIFocusTest *)self cancel];
  [(_UIFocusTest *)self setState:0];
}

- (void)_finish:(BOOL)a3
{
  BOOL v3 = a3;
  v10 = self;
  if ([(_UIFocusTest *)v10 state] == 1 || [(_UIFocusTest *)v10 state] == 2)
  {
    if ([(_UIFocusTest *)v10 _isApplicationTest])
    {
      id v4 = (void *)UIApp;
      id v5 = [(_UIFocusTest *)v10 identifier];
      [v4 finishedTest:v5];
    }
    if (v3) {
      uint64_t v6 = 4;
    }
    else {
      uint64_t v6 = 3;
    }
    [(_UIFocusTest *)v10 setState:v6];
    +[_UIFocusTest _setCurrentTest:0];
    id v7 = [(_UIFocusTest *)v10 delegate];
    if (v7 && (objc_opt_respondsToSelector() & 1) != 0) {
      [v7 _focusTestDidFinish:v10];
    }
    v8 = [(_UIFocusTest *)v10 runCompletionHandler];

    if (v8)
    {
      v9 = [(_UIFocusTest *)v10 runCompletionHandler];
      v9[2]();

      [(_UIFocusTest *)v10 setRunCompletionHandler:0];
    }
  }
}

- (NSString)identifier
{
  return self->_identifier;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (_UIFocusTestDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (_UIFocusTestDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (id)runCompletionHandler
{
  return self->_runCompletionHandler;
}

- (void)setRunCompletionHandler:(id)a3
{
}

- (BOOL)_isApplicationTest
{
  return self->_isApplicationTest;
}

- (void)setIsApplicationTest:(BOOL)a3
{
  self->_isApplicationTest = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_runCompletionHandler, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end