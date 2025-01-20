@interface GetButtonForInputMode
@end

@implementation GetButtonForInputMode

void ___GetButtonForInputMode_block_invoke(uint64_t a1)
{
  id v3 = +[UIKeyboardImpl activeInstance];
  v2 = [*(id *)(a1 + 32) identifier];
  [v3 setInputMode:v2 userInitiated:1];
}

@end