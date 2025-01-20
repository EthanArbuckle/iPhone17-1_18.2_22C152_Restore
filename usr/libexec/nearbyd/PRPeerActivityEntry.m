@interface PRPeerActivityEntry
+ (id)entryWithActivityType:(int)a3;
+ (id)entryWithActivityType:(int)a3 timestamp:(double)a4;
- (BOOL)peerLostCallbackReceived;
- (double)latestActivityTimestamp;
- (int)latestActivityType;
- (void)setLatestActivityTimestamp:(double)a3;
- (void)setLatestActivityType:(int)a3;
- (void)setPeerLostCallbackReceived:(BOOL)a3;
@end

@implementation PRPeerActivityEntry

+ (id)entryWithActivityType:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  double v4 = sub_100006C38();

  return +[PRPeerActivityEntry entryWithActivityType:v3 timestamp:v4];
}

+ (id)entryWithActivityType:(int)a3 timestamp:(double)a4
{
  uint64_t v5 = *(void *)&a3;
  v6 = objc_opt_new();
  [v6 setLatestActivityType:v5];
  [v6 setLatestActivityTimestamp:a4];

  return v6;
}

- (int)latestActivityType
{
  return self->_latestActivityType;
}

- (void)setLatestActivityType:(int)a3
{
  self->_latestActivityType = a3;
}

- (double)latestActivityTimestamp
{
  return self->_latestActivityTimestamp;
}

- (void)setLatestActivityTimestamp:(double)a3
{
  self->_latestActivityTimestamp = a3;
}

- (BOOL)peerLostCallbackReceived
{
  return self->_peerLostCallbackReceived;
}

- (void)setPeerLostCallbackReceived:(BOOL)a3
{
  self->_peerLostCallbackReceived = a3;
}

@end