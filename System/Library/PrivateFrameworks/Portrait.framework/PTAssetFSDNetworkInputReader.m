@interface PTAssetFSDNetworkInputReader
- (BOOL)_readRGBABufferFromFile:(id)a3 to:(__CVBuffer *)a4;
- (PTAssetFSDNetworkInputReader)initWithURL:(id)a3;
- (id)copyNextFrame;
- (id)globals;
- (void)copyNextFrame;
@end

@implementation PTAssetFSDNetworkInputReader

- (PTAssetFSDNetworkInputReader)initWithURL:(id)a3
{
  v16[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PTAssetFSDNetworkInputReader;
  v6 = [(PTAssetFSDNetworkInputReader *)&v14 init];
  if (v6)
  {
    v7 = [MEMORY[0x1E4F28CB8] defaultManager];
    v8 = [v5 path];
    int v9 = [v7 fileExistsAtPath:v8 isDirectory:0];

    v10 = 0;
    if (v9)
    {
      objc_storeStrong((id *)&v6->_url, a3);
      v6->_frameIndex = 0;
      uint64_t v11 = *MEMORY[0x1E4F24C98];
      v15[0] = *MEMORY[0x1E4F24D20];
      v15[1] = v11;
      v16[0] = MEMORY[0x1E4F1CC08];
      v16[1] = &unk_1F26C0B08;
      CFDictionaryRef v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];
      CVPixelBufferCreate(0, 0x200uLL, 0x120uLL, 0x52476841u, v12, &v6->_refBuffer);
      CVPixelBufferCreate(0, 0x240uLL, 0x160uLL, 0x52476841u, v12, &v6->_auxBuffer);
      v10 = v6;
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)_readRGBABufferFromFile:(id)a3 to:(__CVBuffer *)a4
{
  id v5 = a3;
  if (!a4)
  {
    v16 = _PTLogSystem();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[PTAssetFSDNetworkInputReader _readRGBABufferFromFile:to:](v16, v17, v18, v19, v20, v21, v22, v23);
    }
    goto LABEL_10;
  }
  size_t Width = CVPixelBufferGetWidth(a4);
  size_t Height = CVPixelBufferGetHeight(a4);
  id v8 = v5;
  int v9 = fopen((const char *)[v8 UTF8String], "r");
  if (!v9)
  {
    v16 = _PTLogSystem();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[PTAssetFSDNetworkInputReader _readRGBABufferFromFile:to:]((uint64_t)v8, v16, v24, v25, v26, v27, v28, v29);
    }
    goto LABEL_10;
  }
  v10 = v9;
  CVPixelBufferLockBaseAddress(a4, 0);
  BaseAddress = CVPixelBufferGetBaseAddress(a4);
  size_t v12 = Width * Height;
  uint64_t v13 = 8 * Width * Height;
  BOOL v14 = 1;
  size_t v15 = fread(BaseAddress, 1uLL, v13, v10);
  CVPixelBufferUnlockBaseAddress(a4, 0);
  fclose(v10);
  if (v15 != 8 * v12)
  {
    v16 = _PTLogSystem();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[PTAssetFSDNetworkInputReader _readRGBABufferFromFile:to:](v13, v15, v16);
    }
LABEL_10:

    BOOL v14 = 0;
  }

  return v14;
}

- (id)copyNextFrame
{
  v3 = NSString;
  v4 = [(NSURL *)self->_url path];
  id v5 = [v3 stringWithFormat:@"%@/Undistorted/%08i_rectifiedReference.RGhA", v4, self->_frameIndex];

  v6 = NSString;
  v7 = [(NSURL *)self->_url path];
  id v8 = [v6 stringWithFormat:@"%@/Undistorted/%08i_rectifiedAuxiliaryPadded.RGhA", v7, self->_frameIndex];

  LODWORD(v7) = [(PTAssetFSDNetworkInputReader *)self _readRGBABufferFromFile:v5 to:self->_refBuffer];
  BOOL v9 = [(PTAssetFSDNetworkInputReader *)self _readRGBABufferFromFile:v8 to:self->_auxBuffer];
  if (v7 && v9)
  {
    v10 = NSString;
    uint64_t v11 = [(NSURL *)self->_url path];
    size_t v12 = [v10 stringWithFormat:@"%@/Inputs/%08i_options.metadata.plist", v11, self->_frameIndex];

    uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F1CA10]) initWithFileAtPath:v12];
    BOOL v14 = v13;
    if (v13)
    {
      [v13 open];
      id v48 = 0;
      size_t v15 = [MEMORY[0x1E4F28F98] propertyListWithStream:v14 options:0 format:0 error:&v48];
      v16 = v48;
      if (v16)
      {
        uint64_t v17 = _PTLogSystem();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          [(PTAssetFSDNetworkInputReader *)(uint64_t)v16 copyNextFrame];
        }
      }
      [v14 close];
      uint64_t v24 = [v15 objectForKeyedSubscript:@"CorrectedCalibration"];

      if (v24) {
        goto LABEL_18;
      }
      uint64_t v25 = _PTLogSystem();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        [(PTAssetFSDNetworkInputReader *)v25 copyNextFrame];
      }
    }
    else
    {
      uint64_t v25 = _PTLogSystem();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        [(PTAssetFSDNetworkInputReader *)(uint64_t)v12 copyNextFrame];
      }
      v16 = 0;
    }

    uint64_t v24 = 0;
LABEL_18:
    v40 = [[PTAssetFSDNetworkInputFrame alloc] initWithRef:self->_refBuffer aux:self->_auxBuffer unrectifyData:v24 index:self->_frameIndex++];

    goto LABEL_19;
  }
  v16 = _PTLogSystem();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
    [(PTAssetFSDNetworkInputReader *)v16 copyNextFrame];
  }
  v40 = 0;
LABEL_19:

  return v40;
}

- (id)globals
{
  return 0;
}

- (void).cxx_destruct
{
}

- (void)_readRGBABufferFromFile:(uint64_t)a3 to:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_readRGBABufferFromFile:(uint64_t)a3 to:(uint64_t)a4 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_readRGBABufferFromFile:(os_log_t)log to:.cold.3(int a1, int a2, os_log_t log)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 67109376;
  v3[1] = a1;
  __int16 v4 = 1024;
  int v5 = a2;
  _os_log_error_impl(&dword_1D0778000, log, OS_LOG_TYPE_ERROR, "Failed to read file (expected %i vs read %i)", (uint8_t *)v3, 0xEu);
}

- (void)copyNextFrame
{
}

@end