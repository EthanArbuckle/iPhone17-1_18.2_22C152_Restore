@interface SFOneTimeCodeCredentialIdentity
- (int64_t)type;
@end

@implementation SFOneTimeCodeCredentialIdentity

- (int64_t)type
{
  return 4;
}

@end