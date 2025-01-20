@interface _UIDragSessionProperties
- (BOOL)_avoidsKeyboardSuppression;
- (BOOL)_confineToLocalDevice;
- (BOOL)_resizable;
- (BOOL)_rotatable;
- (BOOL)_supportsSystemDrag;
- (BOOL)_wantsElasticEffects;
- (CGSize)_maximumResizableSize;
- (CGSize)_minimumResizableSize;
- (_UIDragSessionProperties)init;
- (void)set_avoidsKeyboardSuppression:(BOOL)a3;
- (void)set_confineToLocalDevice:(BOOL)a3;
- (void)set_maximumResizableSize:(CGSize)a3;
- (void)set_minimumResizableSize:(CGSize)a3;
- (void)set_resizable:(BOOL)a3;
- (void)set_rotatable:(BOOL)a3;
- (void)set_supportsSystemDrag:(BOOL)a3;
- (void)set_wantsElasticEffects:(BOOL)a3;
@end

@implementation _UIDragSessionProperties

- (_UIDragSessionProperties)init
{
  v3.receiver = self;
  v3.super_class = (Class)_UIDragSessionProperties;
  result = [(_UIDragSessionProperties *)&v3 init];
  if (result) {
    result->_supportsSystemDrag = 1;
  }
  return result;
}

- (BOOL)_supportsSystemDrag
{
  return self->_supportsSystemDrag;
}

- (void)set_supportsSystemDrag:(BOOL)a3
{
  self->_supportsSystemDrag = a3;
}

- (BOOL)_rotatable
{
  return self->__rotatable;
}

- (void)set_rotatable:(BOOL)a3
{
  self->__rotatable = a3;
}

- (BOOL)_resizable
{
  return self->__resizable;
}

- (void)set_resizable:(BOOL)a3
{
  self->__resizable = a3;
}

- (CGSize)_minimumResizableSize
{
  double width = self->__minimumResizableSize.width;
  double height = self->__minimumResizableSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)set_minimumResizableSize:(CGSize)a3
{
  self->__minimumResizableSize = a3;
}

- (CGSize)_maximumResizableSize
{
  double width = self->__maximumResizableSize.width;
  double height = self->__maximumResizableSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)set_maximumResizableSize:(CGSize)a3
{
  self->__maximumResizableSize = a3;
}

- (BOOL)_wantsElasticEffects
{
  return self->__wantsElasticEffects;
}

- (void)set_wantsElasticEffects:(BOOL)a3
{
  self->__wantsElasticEffects = a3;
}

- (BOOL)_confineToLocalDevice
{
  return self->__confineToLocalDevice;
}

- (void)set_confineToLocalDevice:(BOOL)a3
{
  self->__confineToLocalDevice = a3;
}

- (BOOL)_avoidsKeyboardSuppression
{
  return self->__avoidsKeyboardSuppression;
}

- (void)set_avoidsKeyboardSuppression:(BOOL)a3
{
  self->__avoidsKeyboardSuppression = a3;
}

@end