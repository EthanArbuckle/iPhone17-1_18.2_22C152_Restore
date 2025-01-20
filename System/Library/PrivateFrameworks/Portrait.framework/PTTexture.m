@interface PTTexture
+ (id)createFromPixelbuffer:(__CVBuffer *)a3 device:(id)a4 read:(BOOL)a5 write:(BOOL)a6;
+ (id)createFromPixelbuffer:(__CVBuffer *)a3 device:(id)a4 textureCache:(__CVMetalTextureCache *)a5 read:(BOOL)a6 write:(BOOL)a7;
+ (id)createRGBA:(id)a3;
+ (id)createYUV420:(id)a3 chroma:(id)a4;
- (BOOL)YCbCrFullRange;
- (BOOL)isRGB;
- (NSString)YCbCrMatrix;
- (NSString)colorPrimaries;
- (NSString)transferFunction;
- (int64_t)YCbCrColorDepth;
- (unint64_t)height;
- (unint64_t)width;
- (void)copyMetadataTo:(id)a3;
- (void)setColorPrimaries:(id)a3;
- (void)setTransferFunction:(id)a3;
- (void)setYCbCrColorDepth:(int64_t)a3;
- (void)setYCbCrFullRange:(BOOL)a3;
- (void)setYCbCrMatrix:(id)a3;
- (void)width;
@end

@implementation PTTexture

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_YCbCrMatrix, 0);
  objc_storeStrong((id *)&self->_transferFunction, 0);

  objc_storeStrong((id *)&self->_colorPrimaries, 0);
}

- (void)copyMetadataTo:(id)a3
{
  colorPrimaries = self->_colorPrimaries;
  id v5 = a3;
  [v5 setColorPrimaries:colorPrimaries];
  [v5 setTransferFunction:self->_transferFunction];
  [v5 setYCbCrMatrix:self->_YCbCrMatrix];
  [v5 setYCbCrColorDepth:self->_YCbCrColorDepth];
  [v5 setYCbCrFullRange:self->_YCbCrFullRange];
}

+ (id)createFromPixelbuffer:(__CVBuffer *)a3 device:(id)a4 textureCache:(__CVMetalTextureCache *)a5 read:(BOOL)a6 write:(BOOL)a7
{
  BOOL v8 = a6;
  id v11 = a4;
  BOOL v12 = +[PTPixelBufferUtil isRGB:a3];
  if (v12)
  {
    v13 = +[PTPixelBufferUtil createTextureFromPixelBuffer:a3 device:v11 textureCache:a5 sRGB:0];

    v14 = +[PTTexture createRGBA:v13];
  }
  else
  {
    id v36 = 0;
    id v37 = 0;
    LOBYTE(v35) = a7;
    unsigned int v15 = +[PTPixelBufferUtil createTexturesFromPixelBuffer:a3 device:v11 textureCache:a5 outLuma:&v37 outChroma:&v36 read:v8 write:v35];

    if (v15)
    {

      v14 = 0;
      goto LABEL_21;
    }
    v14 = +[PTTexture createYUV420:v37 chroma:v36];
    v16 = +[PTPixelBufferUtil getAttachmentString:a3 forKey:*MEMORY[0x1E4F24C18]];
    [v14 setYCbCrMatrix:v16];

    v17 = [v14 YCbCrMatrix];

    if (!v17)
    {
      v18 = _PTLogSystem();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        +[PTTexture createFromPixelbuffer:device:textureCache:read:write:](v18, v19, v20, v21, v22, v23, v24, v25);
      }

      [v14 setYCbCrMatrix:*MEMORY[0x1E4F24C48]];
    }
    objc_msgSend(v14, "setYCbCrFullRange:", +[PTPixelBufferUtil isPixelBufferFullRange:](PTPixelBufferUtil, "isPixelBufferFullRange:", a3));
    if (+[PTPixelBufferUtil isPixelBuffer10Bit:a3]) {
      uint64_t v26 = 10;
    }
    else {
      uint64_t v26 = 8;
    }
    [v14 setYCbCrColorDepth:v26];
  }
  v27 = +[PTPixelBufferUtil getAttachmentString:a3 forKey:*MEMORY[0x1E4F24A90]];
  [v14 setColorPrimaries:v27];

  v28 = +[PTPixelBufferUtil getAttachmentString:a3 forKey:*MEMORY[0x1E4F24BC8]];
  [v14 setTransferFunction:v28];

  v29 = [v14 transferFunction];

  if (!v29)
  {
    v30 = +[PTPixelBufferUtil getAttachmentString:a3 forKey:*MEMORY[0x1E4F24B78]];
    [v14 setTransferFunction:v30];
  }
  v31 = [v14 transferFunction];

  if (!v31)
  {
    v32 = (void *)MEMORY[0x1E4F24BE8];
    if (!v12) {
      v32 = (void *)MEMORY[0x1E4F24BE0];
    }
    [v14 setTransferFunction:*v32];
    v33 = _PTLogSystem();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
      +[PTTexture createFromPixelbuffer:device:textureCache:read:write:](v14, v33);
    }
  }
LABEL_21:

  return v14;
}

- (NSString)transferFunction
{
  return self->_transferFunction;
}

+ (id)createYUV420:(id)a3 chroma:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_opt_new();
  [v7 setTexLuma:v6];

  [v7 setTexChroma:v5];
  [v7 setColorPrimaries:*MEMORY[0x1E4F24AC0]];
  [v7 setTransferFunction:*MEMORY[0x1E4F24BE0]];
  [v7 setYCbCrMatrix:*MEMORY[0x1E4F24C48]];
  [v7 setYCbCrColorDepth:0];
  [v7 setYCbCrFullRange:1];

  return v7;
}

- (void)setYCbCrMatrix:(id)a3
{
}

- (void)setYCbCrFullRange:(BOOL)a3
{
  self->_YCbCrFullRange = a3;
}

- (void)setYCbCrColorDepth:(int64_t)a3
{
  self->_YCbCrColorDepth = a3;
}

- (void)setTransferFunction:(id)a3
{
}

- (void)setColorPrimaries:(id)a3
{
}

- (NSString)YCbCrMatrix
{
  return self->_YCbCrMatrix;
}

+ (id)createRGBA:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 setTexRGBA:v3];

  [v4 setColorPrimaries:*MEMORY[0x1E4F24AC0]];
  [v4 setTransferFunction:*MEMORY[0x1E4F24BE0]];
  [v4 setYCbCrMatrix:*MEMORY[0x1E4F24C48]];
  [v4 setYCbCrColorDepth:0];
  [v4 setYCbCrFullRange:1];

  return v4;
}

+ (id)createFromPixelbuffer:(__CVBuffer *)a3 device:(id)a4 read:(BOOL)a5 write:(BOOL)a6
{
  return (id)[a1 createFromPixelbuffer:a3 device:a4 textureCache:0 read:a5 write:a6];
}

- (unint64_t)width
{
  v2 = _PTLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    [(PTTexture *)v2 width];
  }

  return 0;
}

- (unint64_t)height
{
  v2 = _PTLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    [(PTTexture *)v2 width];
  }

  return 0;
}

- (NSString)colorPrimaries
{
  return self->_colorPrimaries;
}

- (int64_t)YCbCrColorDepth
{
  return self->_YCbCrColorDepth;
}

- (BOOL)YCbCrFullRange
{
  return self->_YCbCrFullRange;
}

- (BOOL)isRGB
{
  v2 = _PTLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    -[PTTexture(PTTextureAdditions) isRGB](v2);
  }

  return 0;
}

+ (void)createFromPixelbuffer:(void *)a1 device:(NSObject *)a2 textureCache:read:write:.cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 transferFunction];
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_error_impl(&dword_1D0778000, a2, OS_LOG_TYPE_ERROR, "createFromPixelbuffer: TransferFunctionKey not found. Using %@", (uint8_t *)&v4, 0xCu);
}

+ (void)createFromPixelbuffer:(uint64_t)a3 device:(uint64_t)a4 textureCache:(uint64_t)a5 read:(uint64_t)a6 write:(uint64_t)a7 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)width
{
}

@end