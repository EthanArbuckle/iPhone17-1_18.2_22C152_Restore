@interface SASProximitySessionTransport
- (id)receivedDataBlock;
- (void)setReceivedDataBlock:(id)a3;
@end

@implementation SASProximitySessionTransport

- (id)receivedDataBlock
{
  return objc_getProperty(self, a2, 8, 1);
}

- (void)setReceivedDataBlock:(id)a3
{
}

- (void).cxx_destruct
{
}

@end