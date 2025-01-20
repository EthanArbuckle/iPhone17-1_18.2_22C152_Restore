@interface SiriCorePingInfo
- (double)avgPingTime;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)pingAcknowledgedCount;
- (unint64_t)numberOfUnacknowledgedPings;
- (void)markPingSentWithIndex:(int64_t)a3;
- (void)markPongReceivedWithIndex:(int64_t)a3;
@end

@implementation SiriCorePingInfo

- (void).cxx_destruct
{
}

- (double)avgPingTime
{
  return self->_avgPingTime;
}

- (int64_t)pingAcknowledgedCount
{
  return self->_pingAcknowledgedCount;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = objc_alloc_init(SiriCorePingInfo);
  *((void *)result + 2) = self->_pingAcknowledgedCount;
  *((void *)result + 3) = *(void *)&self->_avgPingTime;
  return result;
}

- (unint64_t)numberOfUnacknowledgedPings
{
  return [(NSMapTable *)self->_outstandingPings count];
}

- (void)markPongReceivedWithIndex:(int64_t)a3
{
  outstandingPings = self->_outstandingPings;
  if (outstandingPings)
  {
    v6 = NSMapGet(outstandingPings, (const void *)a3);
    if (v6)
    {
      id v13 = v6;
      NSMapRemove(self->_outstandingPings, (const void *)a3);
      v7 = [MEMORY[0x263F08AB0] processInfo];
      [v7 systemUptime];
      double v9 = v8;
      [v13 doubleValue];
      double v11 = v9 - v10;

      int64_t v12 = self->_pingAcknowledgedCount + 1;
      self->_pingAcknowledgedCount = v12;
      self->_avgPingTime = self->_avgPingTime + (v11 - self->_avgPingTime) / (double)v12;
    }
  }
}

- (void)markPingSentWithIndex:(int64_t)a3
{
  outstandingPings = self->_outstandingPings;
  if (!outstandingPings)
  {
    v6 = (NSMapTable *)[objc_alloc(MEMORY[0x263F08968]) initWithKeyOptions:1282 valueOptions:0 capacity:1];
    v7 = self->_outstandingPings;
    self->_outstandingPings = v6;

    outstandingPings = self->_outstandingPings;
  }
  double v8 = NSNumber;
  id v9 = [MEMORY[0x263F08AB0] processInfo];
  [v9 systemUptime];
  NSMapInsert(outstandingPings, (const void *)a3, (const void *)objc_msgSend(v8, "numberWithDouble:"));
}

@end