@interface STMutableAirPlayStatusDomainData
- (BOOL)applyDiff:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setAirPlayState:(unint64_t)a3;
- (void)setBundleIdentifier:(id)a3;
@end

@implementation STMutableAirPlayStatusDomainData

- (void)setAirPlayState:(unint64_t)a3
{
  if (self->super._airPlayState != a3) {
    self->super._airPlayState = a3;
  }
}

- (void)setBundleIdentifier:(id)a3
{
  id v6 = a3;
  if (!-[NSString isEqualToString:](self->super._bundleIdentifier, "isEqualToString:"))
  {
    v4 = (NSString *)[v6 copy];
    bundleIdentifier = self->super._bundleIdentifier;
    self->super._bundleIdentifier = v4;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[STAirPlayStatusDomainData allocWithZone:a3];

  return -[STAirPlayStatusDomainData initWithData:]((id *)&v4->super.isa, self);
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