@interface CMIColourConstancyFrameParamsV1
- (NSDictionary)lscParams;
- (__CVBuffer)lscGains;
- (void)dealloc;
- (void)setLscGains:(__CVBuffer *)a3;
- (void)setLscParams:(id)a3;
@end

@implementation CMIColourConstancyFrameParamsV1

- (void)dealloc
{
  CVPixelBufferRelease(self->_lscGains);
  v3.receiver = self;
  v3.super_class = (Class)CMIColourConstancyFrameParamsV1;
  [(CMIColourConstancyFrameParamsV1 *)&v3 dealloc];
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

- (void).cxx_destruct
{
}

@end