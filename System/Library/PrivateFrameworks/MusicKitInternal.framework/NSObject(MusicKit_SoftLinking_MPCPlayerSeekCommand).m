@interface NSObject(MusicKit_SoftLinking_MPCPlayerSeekCommand)
- (id)_musicKit_self_seekCommand;
- (id)musicKit_seekCommand_beginSeekCommandRequestWithDirection:()MusicKit_SoftLinking_MPCPlayerSeekCommand;
- (id)musicKit_seekCommand_changePositionCommandRequestToElapsedInterval:()MusicKit_SoftLinking_MPCPlayerSeekCommand;
- (id)musicKit_seekCommand_endSeekCommandRequest;
- (id)musicKit_seekCommand_jumpCommandRequestByInterval:()MusicKit_SoftLinking_MPCPlayerSeekCommand;
- (id)musicKit_seekCommand_preferredBackwardJumpInterval;
- (id)musicKit_seekCommand_preferredForwardJumpInterval;
@end

@implementation NSObject(MusicKit_SoftLinking_MPCPlayerSeekCommand)

- (id)musicKit_seekCommand_jumpCommandRequestByInterval:()MusicKit_SoftLinking_MPCPlayerSeekCommand
{
  v3 = objc_msgSend(a1, "_musicKit_self_seekCommand");
  v4 = [v3 jumpByInterval:a2];

  return v4;
}

- (id)musicKit_seekCommand_changePositionCommandRequestToElapsedInterval:()MusicKit_SoftLinking_MPCPlayerSeekCommand
{
  v3 = objc_msgSend(a1, "_musicKit_self_seekCommand");
  v4 = [v3 changePositionToElapsedInterval:a2];

  return v4;
}

- (id)musicKit_seekCommand_beginSeekCommandRequestWithDirection:()MusicKit_SoftLinking_MPCPlayerSeekCommand
{
  if ((unint64_t)(a3 + 2) > 7) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = qword_1E099D5D8[a3 + 2];
  }
  v4 = objc_msgSend(a1, "_musicKit_self_seekCommand");
  v5 = [v4 beginSeekWithDirection:v3];

  return v5;
}

- (id)_musicKit_self_seekCommand
{
  if ([a1 conformsToProtocol:&unk_1F3B8F248]) {
    id v2 = a1;
  }
  else {
    id v2 = 0;
  }
  return v2;
}

- (id)musicKit_seekCommand_preferredForwardJumpInterval
{
  v1 = objc_msgSend(a1, "_musicKit_self_seekCommand");
  id v2 = [v1 preferredForwardJumpIntervals];
  uint64_t v3 = [v2 firstObject];

  if (v3) {
    v4 = (void *)v3;
  }
  else {
    v4 = &unk_1F3B84980;
  }
  return v4;
}

- (id)musicKit_seekCommand_preferredBackwardJumpInterval
{
  v1 = objc_msgSend(a1, "_musicKit_self_seekCommand");
  id v2 = [v1 preferredBackwardJumpIntervals];
  uint64_t v3 = [v2 firstObject];

  if (v3) {
    v4 = (void *)v3;
  }
  else {
    v4 = &unk_1F3B84998;
  }
  return v4;
}

- (id)musicKit_seekCommand_endSeekCommandRequest
{
  v1 = objc_msgSend(a1, "_musicKit_self_seekCommand");
  id v2 = [v1 endSeek];

  return v2;
}

@end