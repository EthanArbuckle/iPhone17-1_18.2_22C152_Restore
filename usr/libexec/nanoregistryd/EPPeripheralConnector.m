@interface EPPeripheralConnector
- (void)peripheralWasInvalidated;
- (void)setPeripheralConnectorShouldForceDisconnect;
@end

@implementation EPPeripheralConnector

- (void)setPeripheralConnectorShouldForceDisconnect
{
  id v2 = [(EPResource *)self resourceManager];
  [v2 setPeripheralConnectorShouldForceDisconnect];
}

- (void)peripheralWasInvalidated
{
  id v2 = [(EPResource *)self resourceManager];
  [v2 peripheralWasInvalidated];
}

@end