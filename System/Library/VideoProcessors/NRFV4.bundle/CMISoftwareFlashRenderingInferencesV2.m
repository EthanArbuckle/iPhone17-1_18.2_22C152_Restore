@interface CMISoftwareFlashRenderingInferencesV2
- (__CVBuffer)personMask;
- (__CVBuffer)skinMatte;
- (__CVBuffer)skyMatte;
- (int)status;
- (void)dealloc;
- (void)setPersonMask:(__CVBuffer *)a3;
- (void)setSkinMatte:(__CVBuffer *)a3;
- (void)setSkyMatte:(__CVBuffer *)a3;
- (void)setStatus:(int)a3;
@end

@implementation CMISoftwareFlashRenderingInferencesV2

- (void)dealloc
{
  CVPixelBufferRelease(self->_personMask);
  CVPixelBufferRelease(self->_skinMatte);
  CVPixelBufferRelease(self->_skyMatte);
  v3.receiver = self;
  v3.super_class = (Class)CMISoftwareFlashRenderingInferencesV2;
  [(CMISoftwareFlashRenderingInferencesV2 *)&v3 dealloc];
}

- (int)status
{
  return self->_status;
}

- (void)setStatus:(int)a3
{
  self->_status = a3;
}

- (__CVBuffer)personMask
{
  return self->_personMask;
}

- (void)setPersonMask:(__CVBuffer *)a3
{
}

- (__CVBuffer)skinMatte
{
  return self->_skinMatte;
}

- (void)setSkinMatte:(__CVBuffer *)a3
{
}

- (__CVBuffer)skyMatte
{
  return self->_skyMatte;
}

- (void)setSkyMatte:(__CVBuffer *)a3
{
}

@end