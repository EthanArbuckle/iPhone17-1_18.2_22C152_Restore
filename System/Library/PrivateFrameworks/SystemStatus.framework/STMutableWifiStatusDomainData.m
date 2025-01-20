@interface STMutableWifiStatusDomainData
- (BOOL)applyDiff:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setAssociatedToIOSHotspot:(BOOL)a3;
- (void)setSignalStrengthBars:(unint64_t)a3;
- (void)setWifiActive:(BOOL)a3;
@end

@implementation STMutableWifiStatusDomainData

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[STWifiStatusDomainData allocWithZone:a3];

  return -[STWifiStatusDomainData initWithData:](v4, self);
}

- (void)setWifiActive:(BOOL)a3
{
  if (self->super._wifiActive != a3) {
    self->super._wifiActive = a3;
  }
}

- (void)setSignalStrengthBars:(unint64_t)a3
{
  if (self->super._signalStrengthBars != a3) {
    self->super._signalStrengthBars = a3;
  }
}

- (void)setAssociatedToIOSHotspot:(BOOL)a3
{
  if (self->super._associatedToIOSHotspot != a3) {
    self->super._associatedToIOSHotspot = a3;
  }
}

- (BOOL)applyDiff:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (isKindOfClass) {
    [v4 applyToMutableData:self];
  }

  return isKindOfClass & 1;
}

@end