@interface NSError(NFStateMachine)
+ (id)fc_createStateMachineErrorForCode:()NFStateMachine userInfo:;
- (BOOL)fc_isStateMachineError:()NFStateMachine;
@end

@implementation NSError(NFStateMachine)

+ (id)fc_createStateMachineErrorForCode:()NFStateMachine userInfo:
{
  v5 = (objc_class *)MEMORY[0x263F087E8];
  id v6 = a4;
  v7 = (void *)[[v5 alloc] initWithDomain:@"com.apple.news.state.machine" code:a3 userInfo:v6];

  return v7;
}

- (BOOL)fc_isStateMachineError:()NFStateMachine
{
  v5 = [a1 domain];
  int v6 = [v5 isEqualToString:@"com.apple.news.state.machine"];

  return v6 && [a1 code] == a3;
}

@end