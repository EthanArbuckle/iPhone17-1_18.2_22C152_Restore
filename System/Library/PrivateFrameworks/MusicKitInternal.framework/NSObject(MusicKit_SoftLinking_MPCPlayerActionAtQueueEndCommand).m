@interface NSObject(MusicKit_SoftLinking_MPCPlayerActionAtQueueEndCommand)
- (id)_musicKit_self_actionAtQueueEndCommand;
- (id)musicKit_actionAtQueueEndCommand_setQueueEndActionCommandRequest:()MusicKit_SoftLinking_MPCPlayerActionAtQueueEndCommand;
- (uint64_t)musicKit_actionAtQueueEndCommand_isAutoPlaySupported;
@end

@implementation NSObject(MusicKit_SoftLinking_MPCPlayerActionAtQueueEndCommand)

- (id)_musicKit_self_actionAtQueueEndCommand
{
  if ([a1 conformsToProtocol:&unk_1F3B8F1E8]) {
    id v2 = a1;
  }
  else {
    id v2 = 0;
  }
  return v2;
}

- (id)musicKit_actionAtQueueEndCommand_setQueueEndActionCommandRequest:()MusicKit_SoftLinking_MPCPlayerActionAtQueueEndCommand
{
  if ((unint64_t)(a3 - 1) >= 3) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = a3;
  }
  v4 = objc_msgSend(a1, "_musicKit_self_actionAtQueueEndCommand");
  v5 = [v4 setQueueEndAction:v3];

  return v5;
}

- (uint64_t)musicKit_actionAtQueueEndCommand_isAutoPlaySupported
{
  v1 = objc_msgSend(a1, "_musicKit_self_actionAtQueueEndCommand");
  id v2 = [v1 supportedActions];
  uint64_t v3 = [NSNumber numberWithInteger:3];
  uint64_t v4 = [v2 containsObject:v3];

  return v4;
}

@end