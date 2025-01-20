@interface NRRepeatingAlertEngineItemLostIDSPairing
- (id)alertName;
- (id)radarDescription;
- (id)radarTitle;
@end

@implementation NRRepeatingAlertEngineItemLostIDSPairing

- (id)radarTitle
{
  return @"Device unexpectedly unpaired in IDS";
}

- (id)radarDescription
{
  return @"Please let us know if you recently tried to unpair a watch, if this is a phone restored from a recent backup.  Anything on the history of your setup could be helpful!";
}

- (id)alertName
{
  return @"InternalIDSPairingLost";
}

@end