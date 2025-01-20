@interface PTMSRResizeAdditionalOutput
- (PTMSRResizeAdditionalOutput)initWithSize:(id *)a3 colorSpace:(CGColorSpace *)a4;
- (__CVBuffer)pixelbuffer;
- (__IOSurface)ioSurface;
- (int)sourcePyramidIndex;
- (void)dealloc;
- (void)setIoSurface:(__IOSurface *)a3;
- (void)setPixelbuffer:(__CVBuffer *)a3;
- (void)setSourcePyramidIndex:(int)a3;
@end

@implementation PTMSRResizeAdditionalOutput

- (PTMSRResizeAdditionalOutput)initWithSize:(id *)a3 colorSpace:(CGColorSpace *)a4
{
  v20[2] = *MEMORY[0x1E4F143B8];
  v18.receiver = self;
  v18.super_class = (Class)PTMSRResizeAdditionalOutput;
  v6 = [(PTMSRResizeAdditionalOutput *)&v18 init];
  if (!v6)
  {
LABEL_6:
    v12 = 0;
    goto LABEL_11;
  }
  CFAllocatorRef v7 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  size_t var0 = a3->var0;
  size_t var1 = a3->var1;
  uint64_t v10 = *MEMORY[0x1E4F24C98];
  v19[0] = *MEMORY[0x1E4F24D20];
  v19[1] = v10;
  v20[0] = MEMORY[0x1E4F1CC08];
  v20[1] = &unk_1F26C0A00;
  if (CVPixelBufferCreate(v7, var0, var1, 0x42475241u, (CFDictionaryRef)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:2], &v6->_pixelbuffer))
  {
    v11 = _PTLogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[PTMSRResizeAdditionalOutput initWithSize:colorSpace:]();
    }

    goto LABEL_6;
  }
  IOSurfaceRef IOSurface = CVPixelBufferGetIOSurface(v6->_pixelbuffer);
  v6->_ioSurface = IOSurface;
  if (a4)
  {
    v14 = IOSurface;
    CFPropertyListRef v15 = CGColorSpaceCopyPropertyList(a4);
    if (v15)
    {
      v16 = v15;
      IOSurfaceSetValue(v14, (CFStringRef)*MEMORY[0x1E4F2F068], v15);
      CFRelease(v16);
    }
  }
  v12 = v6;
LABEL_11:

  return v12;
}

- (void)dealloc
{
  pixelbuffer = self->_pixelbuffer;
  if (pixelbuffer) {
    CVPixelBufferRelease(pixelbuffer);
  }
  v4.receiver = self;
  v4.super_class = (Class)PTMSRResizeAdditionalOutput;
  [(PTMSRResizeAdditionalOutput *)&v4 dealloc];
}

- (__CVBuffer)pixelbuffer
{
  return self->_pixelbuffer;
}

- (void)setPixelbuffer:(__CVBuffer *)a3
{
  self->_pixelbuffer = a3;
}

- (__IOSurface)ioSurface
{
  return self->_ioSurface;
}

- (void)setIoSurface:(__IOSurface *)a3
{
  self->_ioSurface = a3;
}

- (int)sourcePyramidIndex
{
  return self->_sourcePyramidIndex;
}

- (void)setSourcePyramidIndex:(int)a3
{
  self->_sourcePyramidIndex = a3;
}

- (void)initWithSize:colorSpace:.cold.1()
{
  OUTLINED_FUNCTION_3_5();
  OUTLINED_FUNCTION_1_3(&dword_1D0778000, v0, v1, "CVPixelBufferCreate failed %i", v2, v3, v4, v5, v6);
}

@end