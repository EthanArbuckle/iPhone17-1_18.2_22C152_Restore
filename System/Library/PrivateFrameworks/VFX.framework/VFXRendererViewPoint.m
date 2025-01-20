@interface VFXRendererViewPoint
- ($54B668FA3CFF7C50914A1C899F2834C0)viewport;
- (__n128)projectionMatrix;
- (__n128)setProjectionMatrix:(__n128)a3;
- (__n128)setViewMatrix:(__n128)a3;
- (__n128)viewMatrix;
- (id)passDescriptor;
- (void)dealloc;
- (void)setPassDescriptor:(id)a3;
- (void)setViewport:(id *)a3;
@end

@implementation VFXRendererViewPoint

- ($54B668FA3CFF7C50914A1C899F2834C0)viewport
{
  long long v3 = *(_OWORD *)&self->var4;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self->var2;
  *(_OWORD *)&retstr->var2 = v3;
  *(_OWORD *)&retstr->var4 = *(_OWORD *)&self[1].var0;
  return self;
}

- (void)setViewport:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  long long v4 = *(_OWORD *)&a3->var4;
  *(_OWORD *)&self->_viewport.width = *(_OWORD *)&a3->var2;
  *(_OWORD *)&self->_viewport.znear = v4;
  *(_OWORD *)&self->_viewport.originX = v3;
}

- (id)passDescriptor
{
  return self->_passDescriptor;
}

- (void)setPassDescriptor:(id)a3
{
  self->_passDescriptor = (MTLRenderPassDescriptor *)a3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)VFXRendererViewPoint;
  [(VFXRendererViewPoint *)&v3 dealloc];
}

- (__n128)viewMatrix
{
  return a1[4];
}

- (__n128)setViewMatrix:(__n128)a3
{
  result[4] = a2;
  result[5] = a3;
  result[6] = a4;
  result[7] = a5;
  return result;
}

- (__n128)projectionMatrix
{
  return a1[8];
}

- (__n128)setProjectionMatrix:(__n128)a3
{
  result[8] = a2;
  result[9] = a3;
  result[10] = a4;
  result[11] = a5;
  return result;
}

@end