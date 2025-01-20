@interface PXGVisionRecordingRenderTextureSerializable
- (BOOL)hasFallbackMaterial;
- (BOOL)removed;
- (BOOL)wantsMaterial;
- (BOOL)wantsMaterialUpdate;
- (NSArray)spriteIndices;
- (PXGMetalRecordingMetalSpriteTextureSerializable)texture;
- (PXGVisionRecordingRenderTextureSerializable)initWithSerializableObject:(id)a3;
- (id)createSerializableObject;
- (int64_t)instanceCount;
- (int64_t)materialIdentifier;
- (int64_t)reuseType;
- (unint64_t)entity;
- (void)setEntity:(unint64_t)a3;
- (void)setHasFallbackMaterial:(BOOL)a3;
- (void)setInstanceCount:(int64_t)a3;
- (void)setMaterialIdentifier:(int64_t)a3;
- (void)setRemoved:(BOOL)a3;
- (void)setReuseType:(int64_t)a3;
- (void)setSpriteIndices:(id)a3;
- (void)setTexture:(id)a3;
- (void)setWantsMaterial:(BOOL)a3;
- (void)setWantsMaterialUpdate:(BOOL)a3;
@end

@implementation PXGVisionRecordingRenderTextureSerializable

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spriteIndices, 0);
  objc_storeStrong((id *)&self->_texture, 0);
}

- (void)setRemoved:(BOOL)a3
{
  self->_removed = a3;
}

- (BOOL)removed
{
  return self->_removed;
}

- (void)setSpriteIndices:(id)a3
{
}

- (NSArray)spriteIndices
{
  return self->_spriteIndices;
}

- (void)setInstanceCount:(int64_t)a3
{
  self->_instanceCount = a3;
}

- (int64_t)instanceCount
{
  return self->_instanceCount;
}

- (void)setReuseType:(int64_t)a3
{
  self->_reuseType = a3;
}

- (int64_t)reuseType
{
  return self->_reuseType;
}

- (void)setHasFallbackMaterial:(BOOL)a3
{
  self->_hasFallbackMaterial = a3;
}

- (BOOL)hasFallbackMaterial
{
  return self->_hasFallbackMaterial;
}

- (void)setWantsMaterialUpdate:(BOOL)a3
{
  self->_wantsMaterialUpdate = a3;
}

- (BOOL)wantsMaterialUpdate
{
  return self->_wantsMaterialUpdate;
}

- (void)setWantsMaterial:(BOOL)a3
{
  self->_wantsMaterial = a3;
}

- (BOOL)wantsMaterial
{
  return self->_wantsMaterial;
}

- (void)setMaterialIdentifier:(int64_t)a3
{
  self->_materialIdentifier = a3;
}

- (int64_t)materialIdentifier
{
  return self->_materialIdentifier;
}

- (void)setTexture:(id)a3
{
}

- (PXGMetalRecordingMetalSpriteTextureSerializable)texture
{
  return self->_texture;
}

- (void)setEntity:(unint64_t)a3
{
  self->_entity = a3;
}

- (unint64_t)entity
{
  return self->_entity;
}

- (id)createSerializableObject
{
  v25[10] = *MEMORY[0x1E4F143B8];
  v24[0] = @"entity";
  unint64_t v3 = [(PXGVisionRecordingRenderTextureSerializable *)self entity];
  v23 = [NSNumber numberWithUnsignedInteger:v3];
  v25[0] = v23;
  v24[1] = @"texture";
  v22 = [(PXGVisionRecordingRenderTextureSerializable *)self texture];
  v4 = [v22 createSerializableObject];
  v25[1] = v4;
  v24[2] = @"materialIdentifier";
  int64_t v5 = [(PXGVisionRecordingRenderTextureSerializable *)self materialIdentifier];
  v6 = [NSNumber numberWithInteger:v5];
  v25[2] = v6;
  v24[3] = @"wantsMaterial";
  BOOL v7 = [(PXGVisionRecordingRenderTextureSerializable *)self wantsMaterial];
  v8 = [NSNumber numberWithBool:v7];
  v25[3] = v8;
  v24[4] = @"wantsMaterialUpdate";
  BOOL v9 = [(PXGVisionRecordingRenderTextureSerializable *)self wantsMaterialUpdate];
  v10 = [NSNumber numberWithBool:v9];
  v25[4] = v10;
  v24[5] = @"hasFallbackMaterial";
  BOOL v11 = [(PXGVisionRecordingRenderTextureSerializable *)self hasFallbackMaterial];
  v12 = [NSNumber numberWithBool:v11];
  v25[5] = v12;
  v24[6] = @"reuseType";
  int64_t v13 = [(PXGVisionRecordingRenderTextureSerializable *)self reuseType];
  v14 = [NSNumber numberWithInteger:v13];
  v25[6] = v14;
  v24[7] = @"instanceCount";
  int64_t v15 = [(PXGVisionRecordingRenderTextureSerializable *)self instanceCount];
  v16 = [NSNumber numberWithInteger:v15];
  v25[7] = v16;
  v24[8] = @"spriteIndices";
  v17 = [(PXGVisionRecordingRenderTextureSerializable *)self spriteIndices];
  v25[8] = v17;
  v24[9] = @"removed";
  BOOL v18 = [(PXGVisionRecordingRenderTextureSerializable *)self removed];
  v19 = [NSNumber numberWithBool:v18];
  v25[9] = v19;
  v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:10];

  return v20;
}

- (PXGVisionRecordingRenderTextureSerializable)initWithSerializableObject:(id)a3
{
  id v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)PXGVisionRecordingRenderTextureSerializable;
  int64_t v5 = [(PXGVisionRecordingRenderTextureSerializable *)&v30 init];
  if (v5)
  {
    id v6 = v4;
    id v7 = [v6 objectForKeyedSubscript:@"entity"];
    uint64_t v8 = [v7 unsignedIntValue];

    [(PXGVisionRecordingRenderTextureSerializable *)v5 setEntity:v8];
    BOOL v9 = [PXGMetalRecordingMetalSpriteTextureSerializable alloc];
    v10 = [v6 objectForKeyedSubscript:@"texture"];
    BOOL v11 = [(PXGMetalRecordingMetalSpriteTextureSerializable *)v9 initWithSerializableObject:v10];
    [(PXGVisionRecordingRenderTextureSerializable *)v5 setTexture:v11];

    id v12 = [v6 objectForKeyedSubscript:@"materialIdentifier"];
    uint64_t v13 = (int)[v12 intValue];

    [(PXGVisionRecordingRenderTextureSerializable *)v5 setMaterialIdentifier:v13];
    id v14 = [v6 objectForKeyedSubscript:@"wantsMaterial"];
    uint64_t v15 = [v14 BOOLValue];

    [(PXGVisionRecordingRenderTextureSerializable *)v5 setWantsMaterial:v15];
    id v16 = [v6 objectForKeyedSubscript:@"wantsMaterialUpdate"];
    uint64_t v17 = [v16 BOOLValue];

    [(PXGVisionRecordingRenderTextureSerializable *)v5 setWantsMaterialUpdate:v17];
    id v18 = [v6 objectForKeyedSubscript:@"hasFallbackMaterial"];
    uint64_t v19 = [v18 BOOLValue];

    [(PXGVisionRecordingRenderTextureSerializable *)v5 setHasFallbackMaterial:v19];
    id v20 = [v6 objectForKeyedSubscript:@"reuseType"];
    uint64_t v21 = (int)[v20 intValue];

    [(PXGVisionRecordingRenderTextureSerializable *)v5 setReuseType:v21];
    id v22 = [v6 objectForKeyedSubscript:@"instanceCount"];
    uint64_t v23 = (int)[v22 intValue];

    [(PXGVisionRecordingRenderTextureSerializable *)v5 setInstanceCount:v23];
    v24 = [v6 objectForKeyedSubscript:@"spriteIndices"];
    v25 = [v24 sortedArrayUsingComparator:&__block_literal_global_168002];
    [(PXGVisionRecordingRenderTextureSerializable *)v5 setSpriteIndices:v25];

    v26 = [v6 objectForKeyedSubscript:@"removed"];

    id v27 = v26;
    uint64_t v28 = [v27 BOOLValue];

    [(PXGVisionRecordingRenderTextureSerializable *)v5 setRemoved:v28];
  }

  return v5;
}

BOOL __74__PXGVisionRecordingRenderTextureSerializable_initWithSerializableObject___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  LODWORD(a2) = [a2 unsignedIntValue];
  unsigned int v5 = [v4 unsignedIntValue];

  return a2 > v5;
}

@end