@interface SingleColorCubeCorrectionStage
- (id)cubeTexture;
- (id)init:(id)a3 cubeSize:(unsigned int)a4 data:(const char *)a5;
- (int)load3DTextureFromData:(const char *)a3 cubeSize:(unsigned int)a4 metal:(id)a5 outTexture:(id *)a6;
@end

@implementation SingleColorCubeCorrectionStage

- (id)init:(id)a3 cubeSize:(unsigned int)a4 data:(const char *)a5
{
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SingleColorCubeCorrectionStage;
  v9 = [(SingleColorCubeCorrectionStage *)&v14 init];
  v10 = v9;
  if (v9)
  {
    if (![(SingleColorCubeCorrectionStage *)v9 load3DTextureFromData:a5 cubeSize:v6 metal:v8 outTexture:&v9->_defaultCubeTexture])
    {
      v12 = v10;
      goto LABEL_8;
    }
    v11 = _PTLogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[SingleColorCubeCorrectionStage init:cubeSize:data:](v11);
    }
  }
  v12 = 0;
LABEL_8:

  return v12;
}

- (int)load3DTextureFromData:(const char *)a3 cubeSize:(unsigned int)a4 metal:(id)a5 outTexture:(id *)a6
{
  v9 = (objc_class *)MEMORY[0x1E4F35330];
  id v10 = a5;
  id v11 = objc_alloc_init(v9);
  if (!v11)
  {
    v12 = _PTLogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[SingleColorCubeCorrectionStage load3DTextureFromData:cubeSize:metal:outTexture:](v12);
    }
  }
  [v11 setTextureType:7];
  [v11 setWidth:a4];
  [v11 setHeight:a4];
  [v11 setDepth:a4];
  [v11 setPixelFormat:70];
  [v11 setUsage:1];
  v13 = (void *)[v10 newTextureWithDescriptor:v11];

  id v14 = *a6;
  *a6 = v13;

  id v15 = *a6;
  if (*a6)
  {
    memset(v18, 0, 24);
    v18[3] = a4;
    v18[4] = a4;
    v18[5] = a4;
    [v15 replaceRegion:v18 mipmapLevel:0 slice:0 withBytes:a3 bytesPerRow:4 * a4 bytesPerImage:4 * a4 * a4];
    int v16 = 0;
  }
  else
  {
    int v16 = -1;
  }

  return v16;
}

- (id)cubeTexture
{
  return self->_defaultCubeTexture;
}

- (void).cxx_destruct
{
}

- (void)load3DTextureFromData:(os_log_t)log cubeSize:metal:outTexture:.cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136315138;
  v2 = "texDesc";
  _os_log_error_impl(&dword_1D0778000, log, OS_LOG_TYPE_ERROR, "Assertion failed %s", (uint8_t *)&v1, 0xCu);
}

- (void)init:(os_log_t)log cubeSize:data:.cold.1(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl(&dword_1D0778000, log, OS_LOG_TYPE_ERROR, "SingleColorCubeCorrectionStage: cannot load 3d LUT from data!", v1, 2u);
}

@end