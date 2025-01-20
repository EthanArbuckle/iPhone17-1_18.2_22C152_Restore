@interface _UIFocusDebuggerStringOutput
+ (id)outputWithString:(id)a3;
- (NSString)description;
- (_UIFocusDebuggerStringOutput)init;
- (_UIFocusDebuggerStringOutput)initWithString:(id)a3;
@end

@implementation _UIFocusDebuggerStringOutput

+ (id)outputWithString:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithString:v4];

  return v5;
}

- (_UIFocusDebuggerStringOutput)init
{
  return [(_UIFocusDebuggerStringOutput *)self initWithString:&stru_1ED0E84C0];
}

- (_UIFocusDebuggerStringOutput)initWithString:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"UIFocusDebugger.m", 73, @"Invalid parameter not satisfying: %@", @"outputString" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)_UIFocusDebuggerStringOutput;
  v6 = [(_UIFocusDebuggerStringOutput *)&v11 init];
  if (v6)
  {
    uint64_t v7 = [v5 copy];
    outputString = v6->_outputString;
    v6->_outputString = (NSString *)v7;
  }
  return v6;
}

- (NSString)description
{
  if (self->_outputString) {
    return self->_outputString;
  }
  else {
    return (NSString *)&stru_1ED0E84C0;
  }
}

- (void).cxx_destruct
{
}

@end