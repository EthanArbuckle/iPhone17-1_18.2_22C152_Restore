@interface CMISoftwareFlashRenderingFrameParamsV2
- (NSDictionary)lscParams;
- (__CVBuffer)flashLSCGains;
- (__CVBuffer)lscGains;
- (void)dealloc;
- (void)setFlashLSCGains:(__CVBuffer *)a3;
- (void)setLscGains:(__CVBuffer *)a3;
- (void)setLscParams:(id)a3;
@end

@implementation CMISoftwareFlashRenderingFrameParamsV2

- (void)dealloc
{
  CVPixelBufferRelease(self->_lscGains);
  CVPixelBufferRelease(self->_flashLSCGains);
  v3.receiver = self;
  v3.super_class = (Class)CMISoftwareFlashRenderingFrameParamsV2;
  [(CMISoftwareFlashRenderingFrameParamsV2 *)&v3 dealloc];
}

- (__CVBuffer)lscGains
{
  return self->_lscGains;
}

- (void)setLscGains:(__CVBuffer *)a3
{
}

- (NSDictionary)lscParams
{
  return self->_lscParams;
}

- (void)setLscParams:(id)a3
{
}

- (__CVBuffer)flashLSCGains
{
  return self->_flashLSCGains;
}

- (void)setFlashLSCGains:(__CVBuffer *)a3
{
}

- (void).cxx_destruct
{
}

@end