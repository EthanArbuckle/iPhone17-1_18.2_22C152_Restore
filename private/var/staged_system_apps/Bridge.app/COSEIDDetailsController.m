@interface COSEIDDetailsController
- (NRDevice)device;
- (id)EIDString:(id)a3;
- (id)specifiers;
- (void)setDevice:(id)a3;
@end

@implementation COSEIDDetailsController

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  v4 = *(void **)&self->BPSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    v5 = +[PSSpecifier preferenceSpecifierNamed:0 target:self set:0 get:"EIDString:" detail:0 cell:4 edit:0];
    [v5 setProperty:objc_opt_class() forKey:PSCellClassKey];
    [v5 setProperty:&__kCFBooleanTrue forKey:PSCopyableCellKey];
    [v5 setProperty:&__kCFBooleanTrue forKey:PSUseHighLegibilityAlternateKey];
    v9 = v5;
    uint64_t v6 = +[NSArray arrayWithObjects:&v9 count:1];
    v7 = *(void **)&self->BPSListController_opaque[v3];
    *(void *)&self->BPSListController_opaque[v3] = v6;

    v4 = *(void **)&self->BPSListController_opaque[v3];
  }

  return v4;
}

- (id)EIDString:(id)a3
{
  uint64_t v3 = [(COSEIDDetailsController *)self device];
  v4 = [v3 valueForProperty:NRDevicePropertyCSN];

  if (v4)
  {
    v5 = sub_100057F84(v4);
  }
  else
  {
    uint64_t v6 = +[NSBundle mainBundle];
    v5 = [v6 localizedStringForKey:@"N/A" value:&stru_100249230 table:@"About"];
  }

  return v5;
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