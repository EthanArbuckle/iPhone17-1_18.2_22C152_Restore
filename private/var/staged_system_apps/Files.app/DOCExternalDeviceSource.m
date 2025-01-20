@interface DOCExternalDeviceSource
- (UIImage)iconPreferingSymbolImages;
- (unint64_t)status;
@end

@implementation DOCExternalDeviceSource

- (unint64_t)status
{
  return 2;
}

- (UIImage)iconPreferingSymbolImages
{
  v2 = self;
  id v3 = sub_1005236C4(0x6C616E7265747865, 0xED00006576697264, 0, 1);

  return (UIImage *)v3;
}

@end