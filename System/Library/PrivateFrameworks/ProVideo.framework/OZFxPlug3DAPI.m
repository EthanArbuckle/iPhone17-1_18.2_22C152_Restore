@interface OZFxPlug3DAPI
- (BOOL)conformsToProtocol:(id)a3 version:(unsigned int)a4;
- (BOOL)is3D;
- (BOOL)isUsingCamera;
- (double)focalLengthAtFxTime:(id)a3;
- (double)focalLengthAtTime:(double)a3;
- (id)cameraMatrixAtTime:(double)a3;
- (id)layerMatrixAtTime:(double)a3;
- (id)worldToEyeMatrix;
- (id)worldToFilmMatrix;
- (id)worldToLayerMatrix;
- (id)worldToObjectMatrix;
- (void)_setCameraMatrix:(PCMatrix44Tmpl<double> *)a3;
- (void)_setFocalLength:(double)a3;
- (void)_setIs3D:(BOOL)a3;
- (void)_setLayerMatrix:(PCMatrix44Tmpl<double> *)a3;
- (void)_setWorldToEyeMatrix:(PCMatrix44Tmpl<double> *)a3;
- (void)_setWorldToFilmMatrix:(PCMatrix44Tmpl<double> *)a3;
- (void)_setWorldToLayerMatrix:(PCMatrix44Tmpl<double> *)a3;
- (void)_setWorldToObjectMatrix:(PCMatrix44Tmpl<double> *)a3;
@end

@implementation OZFxPlug3DAPI

- (void)_setCameraMatrix:(PCMatrix44Tmpl<double> *)a3
{
  v4 = (PCMatrix44Tmpl<double> *)get3DAPIData();
  if (v4 != a3)
  {
    for (uint64_t i = 0; i != 4; ++i)
    {
      for (uint64_t j = 0; j != 4; ++j)
        v4->var0[0][j] = a3->var0[0][j];
      v4 = (PCMatrix44Tmpl<double> *)((char *)v4 + 32);
      a3 = (PCMatrix44Tmpl<double> *)((char *)a3 + 32);
    }
  }
}

- (void)_setWorldToFilmMatrix:(PCMatrix44Tmpl<double> *)a3
{
  v4 = (PCMatrix44Tmpl<double> *)((char *)get3DAPIData() + 128);
  if (v4 != a3)
  {
    for (uint64_t i = 0; i != 4; ++i)
    {
      for (uint64_t j = 0; j != 4; ++j)
        v4->var0[0][j] = a3->var0[0][j];
      v4 = (PCMatrix44Tmpl<double> *)((char *)v4 + 32);
      a3 = (PCMatrix44Tmpl<double> *)((char *)a3 + 32);
    }
  }
}

- (void)_setLayerMatrix:(PCMatrix44Tmpl<double> *)a3
{
  v4 = (PCMatrix44Tmpl<double> *)((char *)get3DAPIData() + 256);
  if (v4 != a3)
  {
    for (uint64_t i = 0; i != 4; ++i)
    {
      for (uint64_t j = 0; j != 4; ++j)
        v4->var0[0][j] = a3->var0[0][j];
      v4 = (PCMatrix44Tmpl<double> *)((char *)v4 + 32);
      a3 = (PCMatrix44Tmpl<double> *)((char *)a3 + 32);
    }
  }
}

- (void)_setWorldToLayerMatrix:(PCMatrix44Tmpl<double> *)a3
{
  v4 = (PCMatrix44Tmpl<double> *)((char *)get3DAPIData() + 384);
  if (v4 != a3)
  {
    for (uint64_t i = 0; i != 4; ++i)
    {
      for (uint64_t j = 0; j != 4; ++j)
        v4->var0[0][j] = a3->var0[0][j];
      v4 = (PCMatrix44Tmpl<double> *)((char *)v4 + 32);
      a3 = (PCMatrix44Tmpl<double> *)((char *)a3 + 32);
    }
  }
}

- (void)_setWorldToObjectMatrix:(PCMatrix44Tmpl<double> *)a3
{
  v4 = (PCMatrix44Tmpl<double> *)((char *)get3DAPIData() + 512);
  if (v4 != a3)
  {
    for (uint64_t i = 0; i != 4; ++i)
    {
      for (uint64_t j = 0; j != 4; ++j)
        v4->var0[0][j] = a3->var0[0][j];
      v4 = (PCMatrix44Tmpl<double> *)((char *)v4 + 32);
      a3 = (PCMatrix44Tmpl<double> *)((char *)a3 + 32);
    }
  }
}

- (void)_setWorldToEyeMatrix:(PCMatrix44Tmpl<double> *)a3
{
  v4 = (PCMatrix44Tmpl<double> *)((char *)get3DAPIData() + 640);
  if (v4 != a3)
  {
    for (uint64_t i = 0; i != 4; ++i)
    {
      for (uint64_t j = 0; j != 4; ++j)
        v4->var0[0][j] = a3->var0[0][j];
      v4 = (PCMatrix44Tmpl<double> *)((char *)v4 + 32);
      a3 = (PCMatrix44Tmpl<double> *)((char *)a3 + 32);
    }
  }
}

- (void)_setIs3D:(BOOL)a3
{
}

- (void)_setFocalLength:(double)a3
{
  *((double *)get3DAPIData() + 96) = a3;
}

- (id)cameraMatrixAtTime:(double)a3
{
  v3 = get3DAPIData();
  v4 = (void *)MEMORY[0x1E4F1C9B8];

  return (id)[v4 dataWithBytes:v3 length:128];
}

- (id)worldToFilmMatrix
{
  v2 = (char *)get3DAPIData() + 128;
  v3 = (void *)MEMORY[0x1E4F1C9B8];

  return (id)[v3 dataWithBytes:v2 length:128];
}

- (id)layerMatrixAtTime:(double)a3
{
  v3 = (char *)get3DAPIData() + 256;
  v4 = (void *)MEMORY[0x1E4F1C9B8];

  return (id)[v4 dataWithBytes:v3 length:128];
}

- (id)worldToLayerMatrix
{
  v2 = (char *)get3DAPIData() + 384;
  v3 = (void *)MEMORY[0x1E4F1C9B8];

  return (id)[v3 dataWithBytes:v2 length:128];
}

- (id)worldToObjectMatrix
{
  v2 = (char *)get3DAPIData() + 512;
  v3 = (void *)MEMORY[0x1E4F1C9B8];

  return (id)[v3 dataWithBytes:v2 length:128];
}

- (id)worldToEyeMatrix
{
  v2 = (char *)get3DAPIData() + 640;
  v3 = (void *)MEMORY[0x1E4F1C9B8];

  return (id)[v3 dataWithBytes:v2 length:128];
}

- (BOOL)is3D
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_is3D);
  return v2 & 1;
}

- (BOOL)isUsingCamera
{
  return 1;
}

- (double)focalLengthAtTime:(double)a3
{
  return *((double *)get3DAPIData() + 96);
}

- (double)focalLengthAtFxTime:(id)a3
{
  -[OZFxPlug3DAPI focalLengthAtTime:](self, "focalLengthAtTime:", a3.var1, 0.0);
  return result;
}

- (BOOL)conformsToProtocol:(id)a3 version:(unsigned int)a4
{
  return &unk_1F121E2C8 == a3;
}

@end