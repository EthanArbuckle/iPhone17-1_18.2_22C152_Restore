@interface NSObject(MusicKit_SoftLinking_MPCPlayerShuffleCommand)
- (id)_musicKit_self_shuffleCommand;
- (id)musicKit_shuffleCommand_setShuffleType:()MusicKit_SoftLinking_MPCPlayerShuffleCommand;
@end

@implementation NSObject(MusicKit_SoftLinking_MPCPlayerShuffleCommand)

- (id)_musicKit_self_shuffleCommand
{
  if ([a1 conformsToProtocol:&unk_1F3B8F128]) {
    id v2 = a1;
  }
  else {
    id v2 = 0;
  }
  return v2;
}

- (id)musicKit_shuffleCommand_setShuffleType:()MusicKit_SoftLinking_MPCPlayerShuffleCommand
{
  if (a3 == 2) {
    uint64_t v3 = 2;
  }
  else {
    uint64_t v3 = a3 == 1;
  }
  v4 = objc_msgSend(a1, "_musicKit_self_shuffleCommand");
  v5 = [v4 setShuffleType:v3];

  return v5;
}

@end