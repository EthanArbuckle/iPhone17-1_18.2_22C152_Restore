@interface PXGMetalTextureCacheEntry
- (MTLTexture)texture;
- (NSDate)time;
- (PXGMetalTextureCacheEntry)initWithTexture:(id)a3;
- (id)description;
@end

@implementation PXGMetalTextureCacheEntry

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_time, 0);

  objc_storeStrong((id *)&self->_texture, 0);
}

- (NSDate)time
{
  return self->_time;
}

- (MTLTexture)texture
{
  return self->_texture;
}

- (id)description
{
  v3 = NSString;
  texture = self->_texture;
  uint64_t v5 = [(MTLTexture *)texture width];
  uint64_t v6 = [(MTLTexture *)self->_texture height];
  uint64_t v7 = [(MTLTexture *)self->_texture pixelFormat];
  double v8 = (double)(unint64_t)[(MTLTexture *)self->_texture allocatedSize]
     * 0.0009765625
     * 0.0009765625;
  [(NSDate *)self->_time timeIntervalSinceNow];
  return (id)objc_msgSend(v3, "stringWithFormat:", @"<texture:%p dim:%lux%lu fmt:%lu size:%0.1fMB age:%0.3fs>", texture, v5, v6, v7, *(void *)&v8, v9);
}

- (PXGMetalTextureCacheEntry)initWithTexture:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PXGMetalTextureCacheEntry;
  uint64_t v6 = [(PXGMetalTextureCacheEntry *)&v11 init];
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_texture, a3);
    uint64_t v8 = [MEMORY[0x263EFF910] now];
    time = v7->_time;
    v7->_time = (NSDate *)v8;
  }
  return v7;
}

@end