@interface WGGraphicsQuality
@end

@implementation WGGraphicsQuality

void ___WGGraphicsQuality_block_invoke()
{
  v0 = [MEMORY[0x263F1C5C0] currentDevice];
  _WGGraphicsQuality___graphicsQuality = [v0 _graphicsQuality];

  if (_WGGraphicsQuality___graphicsQuality == -1)
  {
    id v2 = [MEMORY[0x263F08690] currentHandler];
    v1 = [NSString stringWithUTF8String:"_UIDeviceGraphicsQuality _WGGraphicsQuality(void)_block_invoke"];
    [v2 handleFailureInFunction:v1 file:@"WGUtilities.m" lineNumber:28 description:@"Failed to initialized graphics quality!"];
  }
}

@end