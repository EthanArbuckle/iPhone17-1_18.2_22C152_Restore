@interface AVCSessionParticipant
- (int64_t)captionsToken;
@end

@implementation AVCSessionParticipant

- (int64_t)captionsToken
{
  return (int64_t)[(AVCSessionParticipant *)self streamTokenForStreamGroupID:1667330164];
}

@end