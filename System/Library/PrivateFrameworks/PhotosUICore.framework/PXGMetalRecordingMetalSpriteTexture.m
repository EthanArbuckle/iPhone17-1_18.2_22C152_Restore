@interface PXGMetalRecordingMetalSpriteTexture
- (BOOL)isAtlas;
- (NSIndexSet)spriteIndexes;
- (NSNumber)textureAddress;
- (PXGMetalRecordingMetalSpriteTexture)initWithTexture:(id)a3;
- (id)serializable;
- (unint64_t)height;
- (unint64_t)mipmapLevelCount;
- (unint64_t)pixelFormat;
- (unint64_t)width;
@end

@implementation PXGMetalRecordingMetalSpriteTexture

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spriteIndexes, 0);
  objc_storeStrong((id *)&self->_textureAddress, 0);
}

- (NSIndexSet)spriteIndexes
{
  return self->_spriteIndexes;
}

- (unint64_t)mipmapLevelCount
{
  return self->_mipmapLevelCount;
}

- (unint64_t)pixelFormat
{
  return self->_pixelFormat;
}

- (unint64_t)height
{
  return self->_height;
}

- (unint64_t)width
{
  return self->_width;
}

- (BOOL)isAtlas
{
  return self->_isAtlas;
}

- (NSNumber)textureAddress
{
  return self->_textureAddress;
}

- (id)serializable
{
  v3 = objc_alloc_init(PXGMetalRecordingMetalSpriteTextureSerializable);
  v4 = [(PXGMetalRecordingMetalSpriteTexture *)self textureAddress];
  -[PXGMetalRecordingMetalSpriteTextureSerializable setTexture:](v3, "setTexture:", [v4 unsignedIntegerValue]);

  -[PXGMetalRecordingMetalSpriteTextureSerializable setSize:](v3, "setSize:", (double)[(PXGMetalRecordingMetalSpriteTexture *)self width], (double)[(PXGMetalRecordingMetalSpriteTexture *)self height]);
  [(PXGMetalRecordingMetalSpriteTextureSerializable *)v3 setIsAtlas:[(PXGMetalRecordingMetalSpriteTexture *)self isAtlas]];
  [(PXGMetalRecordingMetalSpriteTextureSerializable *)v3 setPixelFormat:[(PXGMetalRecordingMetalSpriteTexture *)self pixelFormat]];
  return v3;
}

- (PXGMetalRecordingMetalSpriteTexture)initWithTexture:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PXGMetalRecordingMetalSpriteTexture;
  v5 = [(PXGMetalRecordingMetalSpriteTexture *)&v18 init];
  if (v5)
  {
    v5->_isAtlas = [v4 isAtlas];
    v6 = [v4 texture];
    v5->_width = [v6 width];

    v7 = [v4 texture];
    v5->_height = [v7 height];

    v8 = [v4 texture];
    v5->_pixelFormat = [v8 pixelFormat];

    v9 = [v4 texture];
    v5->_mipmapLevelCount = [v9 mipmapLevelCount];

    v10 = NSNumber;
    v11 = [v4 texture];
    uint64_t v12 = [v10 numberWithUnsignedInteger:v11];
    textureAddress = v5->_textureAddress;
    v5->_textureAddress = (NSNumber *)v12;

    v14 = [v4 spriteIndexes];
    uint64_t v15 = [v14 copy];
    spriteIndexes = v5->_spriteIndexes;
    v5->_spriteIndexes = (NSIndexSet *)v15;
  }
  return v5;
}

@end