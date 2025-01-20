@interface ConnectedPeer
- (ConnectedPeer)init;
@end

@implementation ConnectedPeer

- (ConnectedPeer)init
{
  v3.receiver = self;
  v3.super_class = (Class)ConnectedPeer;
  result = [(ConnectedPeer *)&v3 init];
  if (result) {
    result->_flow = -1;
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceState, 0);

  objc_storeStrong((id *)&self->_deviceIntentConfidence, 0);
}

@end