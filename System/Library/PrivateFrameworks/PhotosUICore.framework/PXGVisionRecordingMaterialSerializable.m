@interface PXGVisionRecordingMaterialSerializable
- (BOOL)hasPlatter;
- (BOOL)isOpaque;
- (NSString)colorProgram;
- (NSString)shader;
- (NSString)shaderFlags;
- (PXGVisionRecordingMaterialSerializable)initWithSerializableObject:(id)a3;
- (id)createSerializableObject;
- (int64_t)identifier;
- (void)setColorProgram:(id)a3;
- (void)setHasPlatter:(BOOL)a3;
- (void)setIdentifier:(int64_t)a3;
- (void)setIsOpaque:(BOOL)a3;
- (void)setShader:(id)a3;
- (void)setShaderFlags:(id)a3;
@end

@implementation PXGVisionRecordingMaterialSerializable

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shader, 0);
  objc_storeStrong((id *)&self->_colorProgram, 0);
  objc_storeStrong((id *)&self->_shaderFlags, 0);
}

- (void)setIdentifier:(int64_t)a3
{
  self->_identifier = a3;
}

- (int64_t)identifier
{
  return self->_identifier;
}

- (void)setHasPlatter:(BOOL)a3
{
  self->_hasPlatter = a3;
}

- (BOOL)hasPlatter
{
  return self->_hasPlatter;
}

- (void)setIsOpaque:(BOOL)a3
{
  self->_isOpaque = a3;
}

- (BOOL)isOpaque
{
  return self->_isOpaque;
}

- (void)setShader:(id)a3
{
}

- (NSString)shader
{
  return self->_shader;
}

- (void)setColorProgram:(id)a3
{
}

- (NSString)colorProgram
{
  return self->_colorProgram;
}

- (void)setShaderFlags:(id)a3
{
}

- (NSString)shaderFlags
{
  return self->_shaderFlags;
}

- (id)createSerializableObject
{
  v15[6] = *MEMORY[0x1E4F143B8];
  v14[0] = @"shaderFlags";
  v3 = [(PXGVisionRecordingMaterialSerializable *)self shaderFlags];
  v15[0] = v3;
  v14[1] = @"colorProgram";
  v4 = [(PXGVisionRecordingMaterialSerializable *)self colorProgram];
  v15[1] = v4;
  v14[2] = @"shader";
  v5 = [(PXGVisionRecordingMaterialSerializable *)self shader];
  v15[2] = v5;
  v14[3] = @"isOpaque";
  BOOL v6 = [(PXGVisionRecordingMaterialSerializable *)self isOpaque];
  v7 = [NSNumber numberWithBool:v6];
  v15[3] = v7;
  v14[4] = @"hasPlatter";
  BOOL v8 = [(PXGVisionRecordingMaterialSerializable *)self hasPlatter];
  v9 = [NSNumber numberWithBool:v8];
  v15[4] = v9;
  v14[5] = @"identifier";
  int64_t v10 = [(PXGVisionRecordingMaterialSerializable *)self identifier];
  v11 = [NSNumber numberWithInteger:v10];
  v15[5] = v11;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:6];

  return v12;
}

- (PXGVisionRecordingMaterialSerializable)initWithSerializableObject:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)PXGVisionRecordingMaterialSerializable;
  v5 = [(PXGVisionRecordingMaterialSerializable *)&v21 init];
  if (v5)
  {
    id v6 = v4;
    uint64_t v7 = [v6 objectForKeyedSubscript:@"shaderFlags"];
    shaderFlags = v5->_shaderFlags;
    v5->_shaderFlags = (NSString *)v7;

    uint64_t v9 = [v6 objectForKeyedSubscript:@"colorProgram"];
    colorProgram = v5->_colorProgram;
    v5->_colorProgram = (NSString *)v9;

    uint64_t v11 = [v6 objectForKeyedSubscript:@"shader"];
    shader = v5->_shader;
    v5->_shader = (NSString *)v11;

    id v13 = [v6 objectForKeyedSubscript:@"isOpaque"];
    char v14 = [v13 BOOLValue];

    v5->_isOpaque = v14;
    id v15 = [v6 objectForKeyedSubscript:@"hasPlatter"];
    char v16 = [v15 BOOLValue];

    v5->_hasPlatter = v16;
    v17 = [v6 objectForKeyedSubscript:@"identifier"];

    id v18 = v17;
    int64_t v19 = (int)[v18 intValue];

    v5->_identifier = v19;
  }

  return v5;
}

@end