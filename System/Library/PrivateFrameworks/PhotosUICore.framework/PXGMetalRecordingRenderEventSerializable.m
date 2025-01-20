@interface PXGMetalRecordingRenderEventSerializable
- (BOOL)isOpaque;
- (NSArray)spriteIndices;
- (PXGMetalRecordingMetalSpriteTextureSerializable)texture;
- (PXGMetalRecordingRenderEventSerializable)initWithSerializableObject:(id)a3;
- (_NSRange)bufferRange;
- (float)zPosition;
- (id)createSerializableObject;
- (unsigned)contentsGravity;
- (void)setBufferRange:(_NSRange)a3;
- (void)setContentsGravity:(unsigned __int8)a3;
- (void)setIsOpaque:(BOOL)a3;
- (void)setSpriteIndices:(id)a3;
- (void)setTexture:(id)a3;
- (void)setZPosition:(float)a3;
@end

@implementation PXGMetalRecordingRenderEventSerializable

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spriteIndices, 0);
  objc_storeStrong((id *)&self->_texture, 0);
}

- (void)setSpriteIndices:(id)a3
{
}

- (NSArray)spriteIndices
{
  return self->_spriteIndices;
}

- (void)setIsOpaque:(BOOL)a3
{
  self->_isOpaque = a3;
}

- (BOOL)isOpaque
{
  return self->_isOpaque;
}

- (void)setContentsGravity:(unsigned __int8)a3
{
  self->_contentsGravity = a3;
}

- (unsigned)contentsGravity
{
  return self->_contentsGravity;
}

- (void)setZPosition:(float)a3
{
  self->_zPosition = a3;
}

- (float)zPosition
{
  return self->_zPosition;
}

- (void)setBufferRange:(_NSRange)a3
{
  self->_bufferRange = a3;
}

- (_NSRange)bufferRange
{
  NSUInteger length = self->_bufferRange.length;
  NSUInteger location = self->_bufferRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setTexture:(id)a3
{
}

- (PXGMetalRecordingMetalSpriteTextureSerializable)texture
{
  return self->_texture;
}

- (id)createSerializableObject
{
  v21[2] = *MEMORY[0x1E4F143B8];
  v19[0] = @"texture";
  v3 = [(PXGMetalRecordingRenderEventSerializable *)self texture];
  v4 = [v3 createSerializableObject];
  v20[0] = v4;
  v19[1] = @"bufferRange";
  uint64_t v5 = [(PXGMetalRecordingRenderEventSerializable *)self bufferRange];
  uint64_t v7 = v6;
  v8 = [NSNumber numberWithUnsignedInteger:v5];
  v21[0] = v8;
  v9 = [NSNumber numberWithUnsignedInteger:v7];
  v21[1] = v9;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:2];

  v20[1] = v10;
  v19[2] = @"zPosition";
  [(PXGMetalRecordingRenderEventSerializable *)self zPosition];
  v11 = objc_msgSend(NSNumber, "numberWithFloat:");
  v20[2] = v11;
  v19[3] = @"contentsGravity";
  unsigned int v12 = [(PXGMetalRecordingRenderEventSerializable *)self contentsGravity];
  v13 = [NSNumber numberWithUnsignedInteger:v12];
  v20[3] = v13;
  v19[4] = @"isOpaque";
  BOOL v14 = [(PXGMetalRecordingRenderEventSerializable *)self isOpaque];
  v15 = [NSNumber numberWithBool:v14];
  v20[4] = v15;
  v19[5] = @"spriteIndices";
  v16 = [(PXGMetalRecordingRenderEventSerializable *)self spriteIndices];
  v20[5] = v16;
  v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:6];

  return v17;
}

- (PXGMetalRecordingRenderEventSerializable)initWithSerializableObject:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)PXGMetalRecordingRenderEventSerializable;
  uint64_t v5 = [(PXGMetalRecordingRenderEventSerializable *)&v24 init];
  if (v5)
  {
    id v6 = v4;
    uint64_t v7 = [PXGMetalRecordingMetalSpriteTextureSerializable alloc];
    v8 = [v6 objectForKeyedSubscript:@"texture"];
    uint64_t v9 = [(PXGMetalRecordingMetalSpriteTextureSerializable *)v7 initWithSerializableObject:v8];
    texture = v5->_texture;
    v5->_texture = (PXGMetalRecordingMetalSpriteTextureSerializable *)v9;

    v11 = [v6 objectForKeyedSubscript:@"bufferRange"];
    unsigned int v12 = [v11 objectAtIndexedSubscript:0];
    NSUInteger v13 = [v12 unsignedIntValue];
    BOOL v14 = [v11 objectAtIndexedSubscript:1];
    NSUInteger v15 = [v14 unsignedIntValue];

    v5->_bufferRange.NSUInteger location = v13;
    v5->_bufferRange.NSUInteger length = v15;

    id v16 = [v6 objectForKeyedSubscript:@"zPosition"];
    [v16 floatValue];
    float v18 = v17;

    v5->_zPosition = v18;
    id v19 = [v6 objectForKeyedSubscript:@"contentsGravity"];
    LOBYTE(v12) = [v19 unsignedIntValue];

    v5->_contentsGravity = v12;
    id v20 = [v6 objectForKeyedSubscript:@"isOpaque"];
    LOBYTE(v12) = [v20 BOOLValue];

    v5->_isOpaque = (char)v12;
    uint64_t v21 = [v6 objectForKeyedSubscript:@"spriteIndices"];

    spriteIndices = v5->_spriteIndices;
    v5->_spriteIndices = (NSArray *)v21;
  }
  return v5;
}

@end