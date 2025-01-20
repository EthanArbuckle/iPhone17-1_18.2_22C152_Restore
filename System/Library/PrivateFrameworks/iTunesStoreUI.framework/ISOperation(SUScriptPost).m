@interface ISOperation(SUScriptPost)
- (uint64_t)sendCompletionCallback:()SUScriptPost;
@end

@implementation ISOperation(SUScriptPost)

- (uint64_t)sendCompletionCallback:()SUScriptPost
{
  return WebThreadRun();
}

@end