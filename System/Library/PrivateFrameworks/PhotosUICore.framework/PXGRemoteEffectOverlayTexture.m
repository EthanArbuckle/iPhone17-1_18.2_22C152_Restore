@interface PXGRemoteEffectOverlayTexture
- (BOOL)containsSpriteIndex:(unsigned int)a3;
- (BOOL)hasPendingTextureRequestID:(int)a3 deliveryOrder:(unsigned int)a4;
- (BOOL)hasSprites;
- (BOOL)isDegraded;
- (BOOL)isOpaque;
- (CGImage)imageRepresentation;
- (CGSize)pixelSize;
- (NSIndexSet)spriteIndexes;
- (PXGRemoteEffectOverlayTexture)initWithMetalSpriteTexture:(id)a3;
- (PXGSpriteTexture)texture;
- (int64_t)estimatedByteSize;
- (unsigned)presentationType;
- (unsigned)spriteCount;
- (void)enumerateSpriteIndexes:(id)a3;
- (void)getSpriteIndexes:(unsigned int *)a3 maxSpriteCount:(unsigned int)a4;
- (void)getTextureInfos:(id *)a3 forSpriteIndexes:(const unsigned int *)a4 geometries:(id *)a5 spriteStyles:(id *)a6 spriteInfos:(id *)a7 screenScale:(double)a8 count:(unsigned int)a9;
@end

@implementation PXGRemoteEffectOverlayTexture

- (void).cxx_destruct
{
}

- (BOOL)isDegraded
{
  v2 = [(PXGRemoteEffectOverlayTexture *)self texture];
  char v3 = [v2 isDegraded];

  return v3;
}

- (BOOL)hasSprites
{
  v2 = [(PXGRemoteEffectOverlayTexture *)self texture];
  char v3 = [v2 hasSprites];

  return v3;
}

- (NSIndexSet)spriteIndexes
{
  v2 = [(PXGRemoteEffectOverlayTexture *)self texture];
  char v3 = [v2 spriteIndexes];

  return (NSIndexSet *)v3;
}

- (BOOL)isOpaque
{
  return 0;
}

- (CGSize)pixelSize
{
  v2 = [(PXGRemoteEffectOverlayTexture *)self texture];
  [v2 pixelSize];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (CGImage)imageRepresentation
{
  v2 = [(PXGRemoteEffectOverlayTexture *)self texture];
  double v3 = (CGImage *)[v2 imageRepresentation];

  return v3;
}

- (unsigned)presentationType
{
  return 1;
}

- (int64_t)estimatedByteSize
{
  v2 = [(PXGRemoteEffectOverlayTexture *)self texture];
  int64_t v3 = [v2 estimatedByteSize];

  return v3;
}

- (unsigned)spriteCount
{
  v2 = [(PXGRemoteEffectOverlayTexture *)self texture];
  unsigned int v3 = [v2 spriteCount];

  return v3;
}

- (BOOL)hasPendingTextureRequestID:(int)a3 deliveryOrder:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = *(void *)&a3;
  double v6 = [(PXGRemoteEffectOverlayTexture *)self texture];
  LOBYTE(v4) = [v6 hasPendingTextureRequestID:v5 deliveryOrder:v4];

  return v4;
}

- (BOOL)containsSpriteIndex:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v4 = [(PXGRemoteEffectOverlayTexture *)self texture];
  LOBYTE(v3) = [v4 containsSpriteIndex:v3];

  return v3;
}

- (void)enumerateSpriteIndexes:(id)a3
{
  id v4 = a3;
  id v5 = [(PXGRemoteEffectOverlayTexture *)self texture];
  [v5 enumerateSpriteIndexes:v4];
}

- (void)getSpriteIndexes:(unsigned int *)a3 maxSpriteCount:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = [(PXGRemoteEffectOverlayTexture *)self texture];
  [v6 getSpriteIndexes:a3 maxSpriteCount:v4];
}

- (void)getTextureInfos:(id *)a3 forSpriteIndexes:(const unsigned int *)a4 geometries:(id *)a5 spriteStyles:(id *)a6 spriteInfos:(id *)a7 screenScale:(double)a8 count:(unsigned int)a9
{
}

- (PXGSpriteTexture)texture
{
  return self->_metalSpriteTexture;
}

- (PXGRemoteEffectOverlayTexture)initWithMetalSpriteTexture:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXGRemoteEffectOverlayTexture;
  id v6 = [(PXGRemoteEffectOverlayTexture *)&v9 init];
  double v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_metalSpriteTexture, a3);
  }

  return v7;
}

@end