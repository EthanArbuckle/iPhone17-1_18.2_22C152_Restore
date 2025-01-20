@interface THIRDPartyApps
- (NSString)processName;
- (int)cellIn;
- (int)cellOut;
- (int)wifiIn;
- (int)wifiOut;
- (void)setCellIn:(int)a3;
- (void)setCellOut:(int)a3;
- (void)setProcessName:(id)a3;
- (void)setWifiIn:(int)a3;
- (void)setWifiOut:(int)a3;
@end

@implementation THIRDPartyApps

- (NSString)processName
{
  return self->processName;
}

- (void)setProcessName:(id)a3
{
}

- (int)wifiIn
{
  return self->wifiIn;
}

- (void)setWifiIn:(int)a3
{
  self->wifiIn = a3;
}

- (int)wifiOut
{
  return self->wifiOut;
}

- (void)setWifiOut:(int)a3
{
  self->wifiOut = a3;
}

- (int)cellIn
{
  return self->cellIn;
}

- (void)setCellIn:(int)a3
{
  self->cellIn = a3;
}

- (int)cellOut
{
  return self->cellOut;
}

- (void)setCellOut:(int)a3
{
  self->cellOut = a3;
}

- (void).cxx_destruct
{
}

@end