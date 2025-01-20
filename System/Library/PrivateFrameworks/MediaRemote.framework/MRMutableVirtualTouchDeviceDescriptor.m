@interface MRMutableVirtualTouchDeviceDescriptor
- (void)setAbsolute:(BOOL)a3;
- (void)setIntegratedDisplay:(BOOL)a3;
- (void)setScreenSize:(_MRHIDSize)a3;
@end

@implementation MRMutableVirtualTouchDeviceDescriptor

- (void)setAbsolute:(BOOL)a3
{
  self->super._absolute = a3;
}

- (void)setIntegratedDisplay:(BOOL)a3
{
  self->super._integratedDisplay = a3;
}

- (void)setScreenSize:(_MRHIDSize)a3
{
  self->super._screenSize = a3;
}

@end