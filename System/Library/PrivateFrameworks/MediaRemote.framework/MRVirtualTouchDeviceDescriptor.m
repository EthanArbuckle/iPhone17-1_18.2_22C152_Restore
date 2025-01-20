@interface MRVirtualTouchDeviceDescriptor
- (BOOL)isAbsolute;
- (BOOL)isIntegratedDisplay;
- (_MRHIDSize)screenSize;
- (id)copyWithZone:(_NSZone *)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
@end

@implementation MRVirtualTouchDeviceDescriptor

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_opt_class();
  if (!self) {
    return 0;
  }
  id result = (id)objc_msgSend((id)objc_msgSend(v5, "allocWithZone:", a3), "init");
  *((unsigned char *)result + 8) = self->_absolute;
  *((unsigned char *)result + 9) = self->_integratedDisplay;
  *(_MRHIDSize *)((char *)result + 12) = self->_screenSize;
  return result;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v5 = objc_opt_class();
  if (!self) {
    return 0;
  }
  id result = (id)objc_msgSend((id)objc_msgSend(v5, "allocWithZone:", a3), "init");
  *((unsigned char *)result + 8) = self->_absolute;
  *((unsigned char *)result + 9) = self->_integratedDisplay;
  *(_MRHIDSize *)((char *)result + 12) = self->_screenSize;
  return result;
}

- (BOOL)isAbsolute
{
  return self->_absolute;
}

- (BOOL)isIntegratedDisplay
{
  return self->_integratedDisplay;
}

- (_MRHIDSize)screenSize
{
  float width = self->_screenSize.var0.width;
  float height = self->_screenSize.var0.height;
  result.var0.float height = height;
  result.var0.float width = width;
  return result;
}

@end