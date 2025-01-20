@interface COSSEIDDetailsController
- (NRDevice)device;
- (id)SEIDString;
- (id)specifiers;
- (void)setDevice:(id)a3;
@end

@implementation COSSEIDDetailsController

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  v4 = *(void **)&self->BPSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    v5 = [(COSSEIDDetailsController *)self SEIDString];
    if (v5)
    {
      v6 = +[PSSpecifier preferenceSpecifierNamed:0 target:self set:0 get:"SEIDString:" detail:0 cell:4 edit:0];
      [v6 setProperty:objc_opt_class() forKey:PSCellClassKey];
      [v6 setProperty:&__kCFBooleanTrue forKey:PSCopyableCellKey];
      [v6 setProperty:&__kCFBooleanTrue forKey:PSUseHighLegibilityAlternateKey];
      v10 = v6;
      uint64_t v7 = +[NSArray arrayWithObjects:&v10 count:1];
      v8 = *(void **)&self->BPSListController_opaque[v3];
      *(void *)&self->BPSListController_opaque[v3] = v7;
    }
    v4 = *(void **)&self->BPSListController_opaque[v3];
  }

  return v4;
}

- (id)SEIDString
{
  v2 = [(COSSEIDDetailsController *)self device];
  uint64_t v3 = [v2 valueForProperty:NRDevicePropertySEID];

  return v3;
}

- (NRDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
}

- (void).cxx_destruct
{
}

@end