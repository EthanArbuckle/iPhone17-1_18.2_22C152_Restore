@interface PMDeviceListController
+ (id)makeUIViewControllerWithDeviceSharingAvailability:(id)a3;
- (PMDeviceListController)init;
@end

@implementation PMDeviceListController

+ (id)makeUIViewControllerWithDeviceSharingAvailability:(id)a3
{
  id v4 = objc_allocWithZone(MEMORY[0x263F82E10]);
  id v5 = a3;
  id v6 = objc_msgSend(v4, sel_init);
  id v7 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_26A0ADD70));
  id v8 = v5;
  v9 = (void *)sub_258D6CB68();
  objc_msgSend(v6, sel_setView_, v9);

  return v6;
}

- (PMDeviceListController)init
{
  v3.receiver = self;
  v3.super_class = (Class)PMDeviceListController;
  return [(PMDeviceListController *)&v3 init];
}

@end