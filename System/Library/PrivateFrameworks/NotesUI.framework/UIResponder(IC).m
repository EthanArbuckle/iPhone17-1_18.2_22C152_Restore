@interface UIResponder(IC)
- (BOOL)ic_isInResponderChainOfFirstResponder:()IC;
- (BOOL)ic_isTextInputSourcePencil;
- (uint64_t)ic_inhibitsGlobalKeyCommands;
@end

@implementation UIResponder(IC)

- (uint64_t)ic_inhibitsGlobalKeyCommands
{
  return 0;
}

- (BOOL)ic_isInResponderChainOfFirstResponder:()IC
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = v4;
    do
    {
      BOOL v7 = v6 == a1;
      v8 = [v6 nextResponder];

      if (!v8) {
        break;
      }
      BOOL v9 = v6 == a1;
      v6 = v8;
    }
    while (!v9);
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)ic_isTextInputSourcePencil
{
  return (objc_opt_respondsToSelector() & 1) != 0 && [a1 _textInputSource] == 3;
}

@end