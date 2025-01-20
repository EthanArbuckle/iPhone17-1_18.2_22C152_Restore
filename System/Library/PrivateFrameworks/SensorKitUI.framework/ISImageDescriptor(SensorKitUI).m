@interface ISImageDescriptor(SensorKitUI)
+ (id)skui_imageDescriptorForAuthorization;
@end

@implementation ISImageDescriptor(SensorKitUI)

+ (id)skui_imageDescriptorForAuthorization
{
  id v0 = objc_alloc(MEMORY[0x263F4B558]);
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C920], "mainScreen"), "scale");
  v2 = objc_msgSend(v0, "initWithSize:scale:", 80.0, 80.0, v1);
  return v2;
}

@end