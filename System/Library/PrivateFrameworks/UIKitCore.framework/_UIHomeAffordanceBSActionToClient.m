@interface _UIHomeAffordanceBSActionToClient
- (_UIHomeAffordanceBSActionToClient)init;
- (int64_t)actionType;
- (void)appendDescriptionToStream:(id)a3;
@end

@implementation _UIHomeAffordanceBSActionToClient

- (_UIHomeAffordanceBSActionToClient)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2, self, @"_UIHomeAffordanceBSActionToClient.m", 40, @"%s: init is not allowed on %@", "-[_UIHomeAffordanceBSActionToClient init]", objc_opt_class() object file lineNumber description];

  return 0;
}

- (int64_t)actionType
{
  v2 = [(_UIHomeAffordanceBSActionToClient *)self info];
  v3 = [v2 objectForSetting:0];
  int64_t v4 = [v3 integerValue];

  return v4;
}

- (void)appendDescriptionToStream:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __63___UIHomeAffordanceBSActionToClient_appendDescriptionToStream___block_invoke;
  v6[3] = &unk_1E52D9F98;
  id v7 = v4;
  v8 = self;
  id v5 = v4;
  [v5 appendProem:self block:v6];
}

@end