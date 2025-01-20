@interface MSMessage(NPKRemotePassActionAdditions)
- (NPKRemotePassAction)remotePassAction;
- (uint64_t)updateDataURLForRemoteAction:()NPKRemotePassActionAdditions;
@end

@implementation MSMessage(NPKRemotePassActionAdditions)

- (NPKRemotePassAction)remotePassAction
{
  v1 = [[NPKRemotePassAction alloc] initWithUnderlyingMessage:a1];
  return v1;
}

- (uint64_t)updateDataURLForRemoteAction:()NPKRemotePassActionAdditions
{
  return [a3 _updateDataURL];
}

@end