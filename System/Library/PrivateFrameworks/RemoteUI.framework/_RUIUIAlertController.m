@interface _RUIUIAlertController
- (id)image;
@end

@implementation _RUIUIAlertController

- (id)image
{
  v2 = [MEMORY[0x263F086E0] bundleWithPath:@"/System/Library/PrivateFrameworks/RemoteUI.framework"];
  v3 = [MEMORY[0x263F827E8] imageNamed:@"appleAccountServiceIcon" inBundle:v2];

  return v3;
}

@end