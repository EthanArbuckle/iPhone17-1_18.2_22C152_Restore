@interface VFXTextureOffscreenRenderingSource
- (float32x2_t)textureSize;
- (void)_buildMipmaps:(__CFXEngineContext *)a3;
@end

@implementation VFXTextureOffscreenRenderingSource

- (float32x2_t)textureSize
{
  return vcvt_f32_f64(a1[2]);
}

- (void)_buildMipmaps:(__CFXEngineContext *)a3
{
  sub_1B6445900((uint64_t)a3, (uint64_t)a2, (uint64_t)a3, v3, v4, v5, v6, v7);
}

@end