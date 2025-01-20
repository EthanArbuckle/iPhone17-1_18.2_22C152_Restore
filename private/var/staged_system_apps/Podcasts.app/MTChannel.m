@interface MTChannel
- (void)setSubscriptionActive:(BOOL)a3;
@end

@implementation MTChannel

- (void)setSubscriptionActive:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(MTChannel *)self subscriptionActive] != a3)
  {
    uint64_t v5 = kChannelSubscriptionActive;
    [(MTChannel *)self willChangeValueForKey:kChannelSubscriptionActive];
    v6 = +[NSNumber numberWithBool:v3];
    [(MTChannel *)self setPrimitiveValue:v6 forKey:v5];

    [(MTChannel *)self didChangeValueForKey:v5];
  }
}

@end