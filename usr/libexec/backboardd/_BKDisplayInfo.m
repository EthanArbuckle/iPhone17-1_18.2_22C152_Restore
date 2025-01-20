@interface _BKDisplayInfo
- (BOOL)isExternal;
- (CAWindowServerDisplay)windowServerDisplay;
- (CGRect)normalizedDigitizerRect;
- (CGSize)size;
- (_BKDisplayInfo)init;
- (double)scale;
- (id)description;
- (unsigned)nativeRotation;
- (void)setExternal:(BOOL)a3;
- (void)setNativeRotation:(unsigned __int8)a3;
- (void)setNormalizedDigitizerRect:(CGRect)a3;
- (void)setScale:(double)a3;
- (void)setSize:(CGSize)a3;
- (void)setWindowServerDisplay:(id)a3;
@end

@implementation _BKDisplayInfo

- (BOOL)isExternal
{
  return self->_external;
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (double)scale
{
  return self->_scale;
}

- (unsigned)nativeRotation
{
  return self->_nativeRotation;
}

- (CAWindowServerDisplay)windowServerDisplay
{
  return self->_windowServerDisplay;
}

- (CGRect)normalizedDigitizerRect
{
  double x = self->_normalizedDigitizerRect.origin.x;
  double y = self->_normalizedDigitizerRect.origin.y;
  double width = self->_normalizedDigitizerRect.size.width;
  double height = self->_normalizedDigitizerRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void).cxx_destruct
{
}

- (void)setExternal:(BOOL)a3
{
  self->_external = a3;
}

- (void)setNormalizedDigitizerRect:(CGRect)a3
{
  self->_normalizedDigitizerRect = a3;
}

- (void)setNativeRotation:(unsigned __int8)a3
{
  self->_nativeRotation = a3;
}

- (void)setScale:(double)a3
{
  self->_scale = a3;
}

- (void)setSize:(CGSize)a3
{
  self->_size = a3;
}

- (void)setWindowServerDisplay:(id)a3
{
}

- (id)description
{
  windowServerDispladouble y = self->_windowServerDisplay;
  CGSize size = self->_size;
  double scale = self->_scale;
  v5 = sub_100038810(self->_nativeRotation);
  v6 = +[NSString stringWithFormat:@"CAWindowServerDisplay:%p size:{%g,%g} scale:%g nativeRotation:%@ normalizedDigitizerRect:{{%g,%g},{%g,%g}} external:%d", windowServerDisplay, size, *(void *)&scale, v5, *(void *)&self->_normalizedDigitizerRect.origin.x, *(void *)&self->_normalizedDigitizerRect.origin.y, *(void *)&self->_normalizedDigitizerRect.size.width, *(void *)&self->_normalizedDigitizerRect.size.height, self->_external];

  return v6;
}

- (_BKDisplayInfo)init
{
  v8.receiver = self;
  v8.super_class = (Class)_BKDisplayInfo;
  CGRect result = [(_BKDisplayInfo *)&v8 init];
  if (result)
  {
    result->_normalizedDigitizerRect.origin.double x = 0.0;
    result->_normalizedDigitizerRect.origin.double y = 0.0;
    __asm { FMOV            V0.2D, #1.0 }
    result->_normalizedDigitizerRect.CGSize size = _Q0;
  }
  return result;
}

@end