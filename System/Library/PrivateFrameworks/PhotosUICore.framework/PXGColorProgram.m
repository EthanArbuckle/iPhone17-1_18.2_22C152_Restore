@interface PXGColorProgram
- (BOOL)_compactProgramWithConversionInfo:(CGColorConversionInfo *)a3 cubeSize:(int)a4 cubeOnly:(BOOL)a5;
- (BOOL)_generateProgram;
- (BOOL)needsHDRToSDRConversion;
- (CGColorSpace)destinationColorSpace;
- (CGColorSpace)sourceColorSpace;
- (MTLBuffer)params;
- (MTLTexture)TRCLUTs;
- (MTLTexture)colorCube;
- (PXGColorProgram)init;
- (PXGColorProgram)initWithContext:(id)a3 sourceColorSpace:(CGColorSpace *)a4 destinationColorSpace:(CGColorSpace *)a5 flags:(unint64_t)a6;
- (PXGMetalRenderContext)metalRenderContext;
- (id)description;
- (id)diagnosticDescription;
- (unint64_t)flags;
- (unsigned)numInputs;
- (unsigned)opcodes;
- (unsigned)paramCount;
- (void)dealloc;
@end

@implementation PXGColorProgram

- (CGColorSpace)sourceColorSpace
{
  return self->_sourceColorSpace;
}

- (unint64_t)flags
{
  return self->_flags;
}

- (MTLBuffer)params
{
  return self->_params;
}

- (MTLTexture)colorCube
{
  return self->_colorCube;
}

- (MTLTexture)TRCLUTs
{
  return self->_TRCLUTs;
}

- (PXGColorProgram)initWithContext:(id)a3 sourceColorSpace:(CGColorSpace *)a4 destinationColorSpace:(CGColorSpace *)a5 flags:(unint64_t)a6
{
  id v12 = a3;
  v19.receiver = self;
  v19.super_class = (Class)PXGColorProgram;
  v13 = [(PXGColorProgram *)&v19 init];
  if (!v13) {
    goto LABEL_7;
  }
  v14 = [v12 device];

  if (v14)
  {
    if (a4) {
      goto LABEL_4;
    }
LABEL_9:
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, v13, @"PXGColorProgram.m", 97, @"Invalid parameter not satisfying: %@", @"sourceColorSpace != nil" object file lineNumber description];

    if (a5) {
      goto LABEL_5;
    }
    goto LABEL_10;
  }
  v16 = [MEMORY[0x1E4F28B00] currentHandler];
  [v16 handleFailureInMethod:a2, v13, @"PXGColorProgram.m", 96, @"Invalid parameter not satisfying: %@", @"context.device != nil" object file lineNumber description];

  if (!a4) {
    goto LABEL_9;
  }
LABEL_4:
  if (a5) {
    goto LABEL_5;
  }
LABEL_10:
  v18 = [MEMORY[0x1E4F28B00] currentHandler];
  [v18 handleFailureInMethod:a2, v13, @"PXGColorProgram.m", 98, @"Invalid parameter not satisfying: %@", @"destinationColorSpace != nil" object file lineNumber description];

LABEL_5:
  objc_storeStrong((id *)&v13->_metalRenderContext, a3);
  v13->_sourceColorSpace = CGColorSpaceRetain(a4);
  v13->_destinationColorSpace = CGColorSpaceRetain(a5);
  v13->_flags = a6;
  if (![(PXGColorProgram *)v13 _generateProgram])
  {

    v13 = 0;
  }
LABEL_7:

  return v13;
}

- (BOOL)_generateProgram
{
  v17[4] = *MEMORY[0x1E4F143B8];
  if ([(PXGColorProgram *)self needsHDRToSDRConversion])
  {
    uint64_t v3 = *MEMORY[0x1E4F1CFC8];
    v16[0] = @"kCGPQEETF3DLut";
    v16[1] = @"kCGHLGSceneMapping3DLut";
    v17[0] = v3;
    v17[1] = v3;
    uint64_t v4 = *MEMORY[0x1E4F1CFD0];
    v16[2] = @"kCGApplyToneMappingForBT2100";
    v16[3] = @"kCGHDRMediaReferenceWhite";
    v17[2] = v4;
    v17[3] = &unk_1F02DBA28;
    CFDictionaryRef v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:4];
    v6 = [(PXGColorProgram *)self destinationColorSpace];
    uint64_t v7 = MEMORY[0x1AD10B240](12);
    if ((MEMORY[0x1AD10B150](v6, v7) & 1) == 0)
    {
      sourceColorSpace = self->_sourceColorSpace;
      uint64_t v9 = MEMORY[0x1AD10B240](11);
      CGColorConversionInfoRef v10 = CGColorConversionInfoCreateFromList(v5, sourceColorSpace, kCGColorConversionTransformFromSpace, kCGRenderingIntentDefault, v9, 2, 0, self->_destinationColorSpace, 1, 0, 0);
      goto LABEL_6;
    }
  }
  else
  {
    CFDictionaryRef v5 = 0;
  }
  CGColorConversionInfoRef v10 = CGColorConversionInfoCreateFromList(v5, self->_sourceColorSpace, kCGColorConversionTransformFromSpace, kCGRenderingIntentDefault, self->_destinationColorSpace, 1, 0, 0);
LABEL_6:
  CGColorConversionInfoRef v11 = v10;
  if (!v10) {
    PXGTungstenGetLog();
  }
  size_t NumberOfComponents = CGColorSpaceGetNumberOfComponents(self->_sourceColorSpace);
  switch(NumberOfComponents)
  {
    case 1uLL:
      uint64_t v13 = 256;
      break;
    case 4uLL:
      uint64_t v13 = 5;
      break;
    case 3uLL:
      uint64_t v13 = 32;
      break;
    default:
      PXGTungstenGetLog();
  }
  BOOL v14 = [(PXGColorProgram *)self _compactProgramWithConversionInfo:v11 cubeSize:v13 cubeOnly:0];
  CFRelease(v11);

  return v14;
}

- (unsigned)opcodes
{
  return self->_opcodes;
}

- (unsigned)numInputs
{
  return self->_numInputs;
}

- (BOOL)_compactProgramWithConversionInfo:(CGColorConversionInfo *)a3 cubeSize:(int)a4 cubeOnly:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v6 = *(void *)&a4;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x2020000000;
  int v28 = 0;
  uint64_t v9 = v23;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  int v24 = 0;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x2020000000;
  v22[3] = 0;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x2020000000;
  v21[3] = 0;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x2020000000;
  int v20 = 0;
  BOOL v10 = [(PXGColorProgram *)self needsHDRToSDRConversion];
  uint64_t v18 = MEMORY[0x1E4F143A8];
  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v14 = MEMORY[0x1E4F143A8];
  LOBYTE(v15) = v5;
  int v11 = CGColorConversionInfoIterateFunctionsWithCallbacks();
  if (v11)
  {
    if (!v11) {
      goto LABEL_12;
    }
    goto LABEL_7;
  }
  if (v5 || v10) {
    PXGTungstenGetLog();
  }
  LOBYTE(v9) = -[PXGColorProgram _compactProgramWithConversionInfo:cubeSize:cubeOnly:](self, "_compactProgramWithConversionInfo:cubeSize:cubeOnly:", a3, v6, 1, v14, 3221225472, __71__PXGColorProgram__compactProgramWithConversionInfo_cubeSize_cubeOnly___block_invoke_2, &unk_1E5DB9A18, self, v22, &v25, v23, v21, v15, v16, 3221225472, __71__PXGColorProgram__compactProgramWithConversionInfo_cubeSize_cubeOnly___block_invoke_35, &unk_1E5DB99F0,
                 v21,
                 v22,
                 &v25,
                 v23,
                 v17,
                 3221225472,
                 __71__PXGColorProgram__compactProgramWithConversionInfo_cubeSize_cubeOnly___block_invoke_33,
                 &unk_1E5DB99C8,
                 self,
                 v21,
                 v22,
                 v19,
                 &v25,
                 v23,
                 v18,
                 3221225472,
                 __71__PXGColorProgram__compactProgramWithConversionInfo_cubeSize_cubeOnly___block_invoke,
                 &unk_1E5DB99A0,
                 self,
                 v21,
                 v19,
                 v22);
  if (v11)
  {
LABEL_7:
    unsigned int v12 = *((_DWORD *)v26 + 6);
    if v6 == 5 || v12 && (self->_flags)
    {
      v12 |= 0x20000000u;
      *((_DWORD *)v26 + 6) = v12;
    }
    self->_opcodes = v12;
    self->_numInputs = CGColorSpaceGetNumberOfComponents(self->_sourceColorSpace);
    LOBYTE(v9) = 1;
  }
LABEL_12:
  _Block_object_dispose(v19, 8);
  _Block_object_dispose(v21, 8);
  _Block_object_dispose(v22, 8);
  _Block_object_dispose(v23, 8);
  _Block_object_dispose(&v25, 8);
  return v9 & 1;
}

- (BOOL)needsHDRToSDRConversion
{
  if (CGColorSpaceUsesITUR_2100TF([(PXGColorProgram *)self destinationColorSpace])) {
    return 0;
  }
  uint64_t v4 = [(PXGColorProgram *)self sourceColorSpace];
  return CGColorSpaceUsesITUR_2100TF(v4);
}

- (CGColorSpace)destinationColorSpace
{
  return self->_destinationColorSpace;
}

BOOL __71__PXGColorProgram__compactProgramWithConversionInfo_cubeSize_cubeOnly___block_invoke_33(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  CGColorTRCGetFunction();
  uint64_t v9 = *((unsigned __int8 *)off_1E5DAAF38 + 2);
  if (*(void *)(*(void *)(a1[5] + 8) + 24) < a4) {
    a4 = *(void *)(*(void *)(a1[5] + 8) + 24);
  }
  if (a4 < 1)
  {
    BOOL v11 = 1;
  }
  else
  {
    uint64_t v10 = 0;
    BOOL v11 = 0;
    long long v12 = 0uLL;
    do
    {
      uint64_t v13 = *(void *)(a5 + 8 * v10);
      if (v13 < 0)
      {
        switch((int)v9)
        {
          case 1:
            goto LABEL_17;
          case 2:
            goto LABEL_16;
          case 3:
            goto LABEL_15;
          case 4:
            goto LABEL_14;
          case 5:
            goto LABEL_13;
          case 6:
            goto LABEL_12;
          case 7:
            *(_DWORD *)(*(void *)(*(void *)(a1[6] + 8) + 24) + 4 * v10 + 96) = 0;
LABEL_12:
            *(_DWORD *)(*(void *)(*(void *)(a1[6] + 8) + 24) + 4 * v10 + 80) = 0;
LABEL_13:
            *(_DWORD *)(*(void *)(*(void *)(a1[6] + 8) + 24) + 4 * v10 + 64) = 0;
LABEL_14:
            *(_DWORD *)(*(void *)(*(void *)(a1[6] + 8) + 24) + 4 * v10 + 48) = 0;
LABEL_15:
            *(_DWORD *)(*(void *)(*(void *)(a1[6] + 8) + 24) + 4 * v10 + 32) = 0;
LABEL_16:
            *(_DWORD *)(*(void *)(*(void *)(a1[6] + 8) + 24) + 4 * v10 + 16) = 1065353216;
LABEL_17:
            *(_DWORD *)(*(void *)(*(void *)(a1[6] + 8) + 24) + 4 * v10) = 1065353216;
            break;
          default:
            break;
        }
      }
      else
      {
        if (v13 >= *(void *)(a2 + 28)) {
          return v11;
        }
        long long v15 = v12;
        long long v16 = v12;
        CGColorTRCGetFunction();
        if (v10 && v15) {
          PXGTungstenGetLog();
        }
        switch((int)v9)
        {
          case 1:
            goto LABEL_25;
          case 2:
            goto LABEL_24;
          case 3:
            goto LABEL_23;
          case 4:
            goto LABEL_22;
          case 5:
            goto LABEL_21;
          case 6:
            goto LABEL_20;
          case 7:
            *(_DWORD *)(*(void *)(*(void *)(a1[6] + 8) + 24) + 4 * v10 + 96) = HIDWORD(v16);
LABEL_20:
            *(_DWORD *)(*(void *)(*(void *)(a1[6] + 8) + 24) + 4 * v10 + 80) = DWORD2(v16);
LABEL_21:
            *(_DWORD *)(*(void *)(*(void *)(a1[6] + 8) + 24) + 4 * v10 + 64) = DWORD1(v16);
LABEL_22:
            *(_DWORD *)(*(void *)(*(void *)(a1[6] + 8) + 24) + 4 * v10 + 48) = v16;
LABEL_23:
            *(_DWORD *)(*(void *)(*(void *)(a1[6] + 8) + 24) + 4 * v10 + 32) = HIDWORD(v15);
LABEL_24:
            *(_DWORD *)(*(void *)(*(void *)(a1[6] + 8) + 24) + 4 * v10 + 16) = DWORD2(v15);
LABEL_25:
            *(_DWORD *)(*(void *)(*(void *)(a1[6] + 8) + 24) + 4 * v10) = DWORD1(v15);
            break;
          default:
            break;
        }
        long long v12 = 0uLL;
      }
      BOOL v11 = a4 <= ++v10;
    }
    while (v10 != a4);
  }
  *(_DWORD *)(*(void *)(a1[8] + 8) + 24) |= 2 << *(_DWORD *)(*(void *)(a1[9] + 8) + 24);
  *(_DWORD *)(*(void *)(a1[9] + 8) + 24) += 4;
  *(void *)(*(void *)(a1[6] + 8) + 24) += 16 * v9;
  return v11;
}

uint64_t __71__PXGColorProgram__compactProgramWithConversionInfo_cubeSize_cubeOnly___block_invoke_35(void *a1, uint64_t a2)
{
  CGColorMatrixGetMatrix();
  *(void *)(*(void *)(a1[4] + 8) + 24) = *(void *)(a2 + 20);
  **(_DWORD **)(*(void *)(a1[5] + 8) + 24) = 0;
  *(_DWORD *)(*(void *)(*(void *)(a1[5] + 8) + 24) + 4) = 0;
  *(void *)(*(void *)(*(void *)(a1[5] + 8) + 24) + 8) = 0;
  *(_DWORD *)(*(void *)(*(void *)(a1[5] + 8) + 24) + 16) = 0;
  *(_DWORD *)(*(void *)(*(void *)(a1[5] + 8) + 24) + 20) = 0;
  *(_DWORD *)(*(void *)(*(void *)(a1[5] + 8) + 24) + 24) = 0;
  *(_DWORD *)(*(void *)(*(void *)(a1[5] + 8) + 24) + 28) = 0;
  *(_DWORD *)(*(void *)(*(void *)(a1[5] + 8) + 24) + 32) = 0;
  *(_DWORD *)(*(void *)(*(void *)(a1[5] + 8) + 24) + 36) = 0;
  *(_DWORD *)(*(void *)(*(void *)(a1[5] + 8) + 24) + 40) = 0;
  *(_DWORD *)(*(void *)(*(void *)(a1[5] + 8) + 24) + 44) = 0;
  *(_DWORD *)(*(void *)(*(void *)(a1[5] + 8) + 24) + 48) = 0;
  uint64_t v4 = *((unsigned __int8 *)off_1E5DAAF38 + 1);
  *(_DWORD *)(*(void *)(*(void *)(a1[5] + 8) + 24) + 52) = 0;
  *(_DWORD *)(*(void *)(*(void *)(a1[5] + 8) + 24) + 56) = 0;
  *(_DWORD *)(*(void *)(*(void *)(a1[5] + 8) + 24) + 60) = 0;
  *(_DWORD *)(*(void *)(a1[6] + 8) + 24) |= 1 << *(_DWORD *)(*(void *)(a1[7] + 8) + 24);
  *(_DWORD *)(*(void *)(a1[7] + 8) + 24) += 4;
  *(void *)(*(void *)(a1[5] + 8) + 24) += 16 * v4;
  return 1;
}

uint64_t __71__PXGColorProgram__compactProgramWithConversionInfo_cubeSize_cubeOnly___block_invoke(void *a1, uint64_t a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  *(void *)(*(void *)(a1[5] + 8) + 24) = *(void *)(a2 + 12);
  if (*(uint64_t *)(a2 + 4) > 7) {
    PXGTungstenGetLog();
  }
  if (*(uint64_t *)(a2 + 28) < 1)
  {
    int v5 = 0;
  }
  else
  {
    uint64_t v4 = 0;
    int v5 = 0;
    do
    {
      LODWORD(v17) = 0;
      *(_OWORD *)buf = 0u;
      long long v16 = 0u;
      CGColorTRCGetFunction();
      v5 += *((unsigned __int8 *)off_1E5DAAF38 + 2);
      ++v4;
    }
    while (*(void *)(a2 + 28) > v4);
  }
  uint64_t v6 = *(void *)(a2 + 36);
  if (v6 <= 0) {
    int v7 = 0;
  }
  else {
    int v7 = *((unsigned __int8 *)off_1E5DAAF38 + 1) * v6;
  }
  unsigned int v8 = v5 + v7;
  uint64_t v9 = *(void *)(a2 + 44);
  if (v9 == 1)
  {
    LODWORD(v17) = 0;
    *(_OWORD *)buf = 0u;
    long long v16 = 0u;
    CGColorNxMTransformGetTransform();
    v8 += *((unsigned __int8 *)off_1E5DAAF38 + 8);
    uint64_t v9 = *(void *)(a2 + 44);
  }
  if (v9 >= 2) {
    PXGTungstenGetLog();
  }
  *(_WORD *)(a1[4] + 26) = v8;
  uint64_t v10 = [*(id *)(a1[4] + 32) device];
  uint64_t v11 = [v10 newBufferWithLength:16 * v8 options:0];
  uint64_t v12 = a1[4];
  uint64_t v13 = *(void **)(v12 + 64);
  *(void *)(v12 + 64) = v11;

  *(_DWORD *)(a1[4] + 8) = 0;
  *(void *)(*(void *)(a1[7] + 8) + 24) = [*(id *)(a1[4] + 64) contents];
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorCube, 0);
  objc_storeStrong((id *)&self->_TRCLUTs, 0);
  objc_storeStrong((id *)&self->_params, 0);
  objc_storeStrong((id *)&self->_metalRenderContext, 0);
}

- (unsigned)paramCount
{
  return self->_paramCount;
}

- (PXGMetalRenderContext)metalRenderContext
{
  return self->_metalRenderContext;
}

- (id)diagnosticDescription
{
}

- (id)description
{
  uint64_t v3 = NSString;
  v12.receiver = self;
  v12.super_class = (Class)PXGColorProgram;
  uint64_t v4 = [(PXGColorProgram *)&v12 description];
  Name = (void *)CGColorSpaceGetName([(PXGColorProgram *)self sourceColorSpace]);
  if (!Name)
  {
    CFStringRef v6 = CFCopyDescription([(PXGColorProgram *)self sourceColorSpace]);
    Name = (void *)CFAutorelease(v6);
  }
  CFStringRef v7 = CGColorSpaceGetName([(PXGColorProgram *)self destinationColorSpace]);
  if (self->_flags) {
    unsigned int v8 = @"YES";
  }
  else {
    unsigned int v8 = @"NO";
  }
  uint64_t v9 = v8;
  uint64_t v10 = [v3 stringWithFormat:@"<%@ source:%@ destination:%@ opaque:%@>", v4, Name, v7, v9];

  return v10;
}

uint64_t __71__PXGColorProgram__compactProgramWithConversionInfo_cubeSize_cubeOnly___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (*(void *)(*(void *)(a2 + 68) + 8 * a4))
  {
    memset(v7, 0, 20);
    CGColorNxMTransformGetTransform();
    uint64_t v5 = *(void *)(*(void *)(a1 + 64) + 8);
    if (*(void *)(v5 + 24)) {
      PXGTungstenGetLog();
    }
    *(void *)(v5 + 24) = *(void *)((char *)v7 + 12);
    PXGTungstenGetLog();
  }
  return 0;
}

- (void)dealloc
{
  CGColorSpaceRelease(self->_sourceColorSpace);
  CGColorSpaceRelease(self->_destinationColorSpace);
  free(self->_trc_lut_widths);
  v3.receiver = self;
  v3.super_class = (Class)PXGColorProgram;
  [(PXGColorProgram *)&v3 dealloc];
}

- (PXGColorProgram)init
{
  uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXGColorProgram.m", 114, @"%s is not available as initializer", "-[PXGColorProgram init]");

  abort();
}

@end