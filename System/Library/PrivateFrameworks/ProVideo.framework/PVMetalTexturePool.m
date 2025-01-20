@interface PVMetalTexturePool
- (HGMetalTexturePool)texturePool;
- (PVMetalTexturePool)init;
- (id)getTexture:(id)a3;
- (void)releaseTexture:(id)a3;
@end

@implementation PVMetalTexturePool

- (PVMetalTexturePool)init
{
  v3.receiver = self;
  v3.super_class = (Class)PVMetalTexturePool;
  return [(PVMetalTexturePool *)&v3 init];
}

- (id)getTexture:(id)a3
{
  id v4 = a3;
  v5 = [(PVMetalTexturePool *)self texturePool];
  if (v5)
  {
    *((void *)&v7 + 1) = objc_msgSend(v4, "height", objc_msgSend(v4, "width"));
    uint64_t v8 = [v4 pixelFormat];
    int v9 = [v4 usage];
    uint64_t v10 = [v4 storageMode];
    uint64_t v11 = 0x100000002;
    v5 = (HGMetalTexturePool *) (id) HGMetalTexturePool::newTexture((uint64_t *)v5, &v7, 0);
  }

  return v5;
}

- (void)releaseTexture:(id)a3
{
  id v4 = a3;
  v5 = [(PVMetalTexturePool *)self texturePool];
  id v6 = v4;
  HGMetalTexturePool::releaseTexture((uint64_t *)v5, (uint64_t)v6);
}

- (HGMetalTexturePool)texturePool
{
  result = (HGMetalTexturePool *)HGMetalDeviceInfo::getMainDevice((HGMetalDeviceInfo *)self);
  if (result) {
    return (HGMetalTexturePool *)*((void *)HGGPUResources::getDeviceResources((HGGPUResources *)result, v3) + 5);
  }
  return result;
}

@end