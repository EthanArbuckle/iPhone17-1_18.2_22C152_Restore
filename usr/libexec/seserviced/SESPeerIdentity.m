@interface SESPeerIdentity
- (NSDictionary)dumpState;
- (NSString)description;
@end

@implementation SESPeerIdentity

- (NSString)description
{
  return (NSString *)sub_10023FA38(self, (uint64_t)a2, (void (*)(void))SESPeerIdentity.description.getter);
}

- (NSDictionary)dumpState
{
  v2 = self;
  v3 = (void *)sub_10023E3C0();

  return (NSDictionary *)v3;
}

@end