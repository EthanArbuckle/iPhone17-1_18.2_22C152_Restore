@interface PXGMetalRecordingMetalSpriteTextureSerializable
- (BOOL)isAtlas;
- (CGSize)size;
- (PXGMetalRecordingMetalSpriteTextureSerializable)initWithSerializableObject:(id)a3;
- (id)createSerializableObject;
- (unint64_t)pixelFormat;
- (unint64_t)texture;
- (void)setIsAtlas:(BOOL)a3;
- (void)setPixelFormat:(unint64_t)a3;
- (void)setSize:(CGSize)a3;
- (void)setTexture:(unint64_t)a3;
@end

@implementation PXGMetalRecordingMetalSpriteTextureSerializable

- (void)setPixelFormat:(unint64_t)a3
{
  self->_pixelFormat = a3;
}

- (unint64_t)pixelFormat
{
  return self->_pixelFormat;
}

- (void)setIsAtlas:(BOOL)a3
{
  self->_isAtlas = a3;
}

- (BOOL)isAtlas
{
  return self->_isAtlas;
}

- (void)setSize:(CGSize)a3
{
  self->_size = a3;
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setTexture:(unint64_t)a3
{
  self->_texture = a3;
}

- (unint64_t)texture
{
  return self->_texture;
}

- (id)createSerializableObject
{
  v18[2] = *MEMORY[0x1E4F143B8];
  v16[0] = @"texture";
  unint64_t v3 = [(PXGMetalRecordingMetalSpriteTextureSerializable *)self texture];
  v4 = [NSNumber numberWithUnsignedInteger:v3];
  v17[0] = v4;
  v16[1] = @"size";
  [(PXGMetalRecordingMetalSpriteTextureSerializable *)self size];
  double v6 = v5;
  v7 = objc_msgSend(NSNumber, "numberWithDouble:");
  v18[0] = v7;
  v8 = [NSNumber numberWithDouble:v6];
  v18[1] = v8;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];

  v17[1] = v9;
  v16[2] = @"isAtlas";
  BOOL v10 = [(PXGMetalRecordingMetalSpriteTextureSerializable *)self isAtlas];
  v11 = [NSNumber numberWithBool:v10];
  v17[2] = v11;
  v16[3] = @"pixelFormat";
  unint64_t v12 = [(PXGMetalRecordingMetalSpriteTextureSerializable *)self pixelFormat];
  v13 = [NSNumber numberWithInteger:v12];
  v17[3] = v13;
  v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:4];

  return v14;
}

- (PXGMetalRecordingMetalSpriteTextureSerializable)initWithSerializableObject:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)PXGMetalRecordingMetalSpriteTextureSerializable;
  double v5 = [(PXGMetalRecordingMetalSpriteTextureSerializable *)&v22 init];
  if (v5)
  {
    id v6 = v4;
    id v7 = [v6 objectForKeyedSubscript:@"texture"];
    uint64_t v8 = [v7 unsignedIntValue];

    [(PXGMetalRecordingMetalSpriteTextureSerializable *)v5 setTexture:v8];
    v9 = [v6 objectForKeyedSubscript:@"size"];
    BOOL v10 = [v9 objectAtIndexedSubscript:0];
    [v10 floatValue];
    double v12 = v11;
    v13 = [v9 objectAtIndexedSubscript:1];
    [v13 floatValue];
    double v15 = v14;

    -[PXGMetalRecordingMetalSpriteTextureSerializable setSize:](v5, "setSize:", v12, v15);
    id v16 = [v6 objectForKeyedSubscript:@"isAtlas"];
    uint64_t v17 = [v16 BOOLValue];

    [(PXGMetalRecordingMetalSpriteTextureSerializable *)v5 setIsAtlas:v17];
    v18 = [v6 objectForKeyedSubscript:@"pixelFormat"];

    id v19 = v18;
    uint64_t v20 = (int)[v19 intValue];

    [(PXGMetalRecordingMetalSpriteTextureSerializable *)v5 setPixelFormat:v20];
  }

  return v5;
}

@end