@interface _UIImageCIImageRenderer
- (uint64_t)_targetColorSpaceForHDR:(uint64_t)result;
- (void)_updateContextForHDRRendering:(uint64_t)a1;
- (void)_updateSurfaceForSize:(double)a3 usingHDR:(double)a4;
- (void)dealloc;
- (void)renderContent:(int)a3 usingHDR:(void *)a4 withEffects:;
@end

@implementation _UIImageCIImageRenderer

- (void)dealloc
{
  surface = self->_surface;
  if (surface) {
    CFRelease(surface);
  }
  v4.receiver = self;
  v4.super_class = (Class)_UIImageCIImageRenderer;
  [(_UIImageCIImageRenderer *)&v4 dealloc];
}

- (uint64_t)_targetColorSpaceForHDR:(uint64_t)result
{
  if (result)
  {
    if (a2)
    {
      if (qword_1EB25B1E0 == -1)
      {
        v2 = &qword_1EB25B1D8;
        return *v2;
      }
      v2 = &qword_1EB25B1D8;
      v3 = &qword_1EB25B1E0;
      objc_super v4 = &__block_literal_global_302;
    }
    else
    {
      if (qword_1EB25B1F0 == -1)
      {
        v2 = &qword_1EB25B1E8;
        return *v2;
      }
      v2 = &qword_1EB25B1E8;
      v3 = &qword_1EB25B1F0;
      objc_super v4 = &__block_literal_global_305;
    }
    dispatch_once(v3, v4);
    return *v2;
  }
  return result;
}

- (void)_updateSurfaceForSize:(double)a3 usingHDR:(double)a4
{
  v28[6] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    if (a2)
    {
      int v7 = 1;
    }
    else
    {
      v8 = +[UIDevice currentDevice];
      int v7 = [v8 _supportsDeepColor];
    }
    float v9 = a3;
    unint64_t v10 = vcvtps_s32_f32(v9);
    float v11 = a4;
    unint64_t v12 = vcvtps_s32_f32(v11);
    if ((*(unsigned char *)(a1 + 32) & 1) == 0
      || v7 == ((*(unsigned char *)(a1 + 32) & 2) == 0)
      || *(void *)(a1 + 16) != v10
      || *(void *)(a1 + 24) != v12)
    {
      *(void *)(a1 + 16) = v10;
      *(void *)(a1 + 24) = v12;
      if (v7) {
        uint64_t v13 = 1380411457;
      }
      else {
        uint64_t v13 = 1380401729;
      }
      if (v7) {
        uint64_t v14 = 8;
      }
      else {
        uint64_t v14 = 4;
      }
      uint64_t AlignedBytesPerRow = CGBitmapGetAlignedBytesPerRow();
      unint64_t v16 = AlignedBytesPerRow * v12;
      v27[0] = *MEMORY[0x1E4F2F2C0];
      v17 = [NSNumber numberWithInteger:v10];
      v28[0] = v17;
      v27[1] = *MEMORY[0x1E4F2F0E8];
      v18 = [NSNumber numberWithInteger:v12];
      v28[1] = v18;
      v27[2] = *MEMORY[0x1E4F2EFE0];
      v19 = [NSNumber numberWithUnsignedLong:AlignedBytesPerRow];
      v28[2] = v19;
      v27[3] = *MEMORY[0x1E4F2EFB8];
      v20 = [NSNumber numberWithUnsignedLong:v16];
      v28[3] = v20;
      v27[4] = *MEMORY[0x1E4F2EFD8];
      v21 = [NSNumber numberWithUnsignedLong:v14];
      v28[4] = v21;
      v27[5] = *MEMORY[0x1E4F2F150];
      v22 = [NSNumber numberWithUnsignedInt:v13];
      v28[5] = v22;
      CFDictionaryRef v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:6];

      v24 = *(const void **)(a1 + 8);
      if (v24) {
        CFRelease(v24);
      }
      IOSurfaceRef v25 = IOSurfaceCreate(v23);
      *(void *)(a1 + 8) = v25;
      if (v7) {
        char v26 = 2;
      }
      else {
        char v26 = 0;
      }
      *(unsigned char *)(a1 + 32) = v26 | *(unsigned char *)(a1 + 32) & 0xFC | (v25 != 0);
    }
  }
}

- (void)_updateContextForHDRRendering:(uint64_t)a1
{
  v14[1] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    if ((a2 & 1) != 0
      || (+[UIDevice currentDevice],
          v3 = objc_claimAutoreleasedReturnValue(),
          int v4 = [v3 _supportsDeepColor],
          v3,
          v4))
    {
      v5 = (unsigned int *)MEMORY[0x1E4F1E300];
    }
    else
    {
      v5 = (unsigned int *)MEMORY[0x1E4F1E2F0];
    }
    uint64_t v6 = *v5;
    int v7 = *(void **)(a1 + 40);
    if (!v7 || [v7 workingFormat] != v6)
    {
      v8 = (void *)MEMORY[0x1E4F1E018];
      uint64_t v13 = *MEMORY[0x1E4F1E248];
      float v9 = [NSNumber numberWithInt:v6];
      v14[0] = v9;
      unint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
      uint64_t v11 = [v8 contextWithOptions:v10];
      unint64_t v12 = *(void **)(a1 + 40);
      *(void *)(a1 + 40) = v11;
    }
  }
}

- (void)renderContent:(int)a3 usingHDR:(void *)a4 withEffects:
{
  v15 = a4;
  if (a1)
  {
    int v7 = [a2 CIImage];
    v8 = v7;
    if (v7)
    {
      id v9 = v7;
      if (v15
        && (v15[2](),
            unint64_t v10 = objc_claimAutoreleasedReturnValue(),
            v9,
            [v9 extent],
            objc_msgSend(v10, "imageByCroppingToRect:"),
            id v9 = (id)objc_claimAutoreleasedReturnValue(),
            v10,
            !v9))
      {
        *(unsigned char *)(a1 + 32) &= ~1u;
      }
      else
      {
        [v9 extent];
        double v12 = v11;
        double v14 = v13;
        [(_UIImageCIImageRenderer *)a1 _updateSurfaceForSize:v11 usingHDR:v13];
        -[_UIImageCIImageRenderer _updateContextForHDRRendering:](a1, a3);
        if (*(unsigned char *)(a1 + 32)) {
          objc_msgSend(*(id *)(a1 + 40), "render:toIOSurface:bounds:colorSpace:", v9, *(void *)(a1 + 8), -[_UIImageCIImageRenderer _targetColorSpaceForHDR:](a1, a3), *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), v12, v14);
        }
      }
    }
    else
    {
      *(unsigned char *)(a1 + 32) &= ~1u;
    }
  }
}

- (void).cxx_destruct
{
}

@end