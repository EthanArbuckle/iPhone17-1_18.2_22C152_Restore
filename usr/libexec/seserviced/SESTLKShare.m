@interface SESTLKShare
- (NSDictionary)dumpState;
- (NSString)description;
@end

@implementation SESTLKShare

- (NSString)description
{
  return (NSString *)sub_10023FA38(self, (uint64_t)a2, (void (*)(void))SESTLKShare.description.getter);
}

- (NSDictionary)dumpState
{
  v2 = self;
  v3 = (void *)sub_10023F2F4();

  return (NSDictionary *)v3;
}

@end