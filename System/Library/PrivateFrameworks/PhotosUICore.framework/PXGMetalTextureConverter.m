@interface PXGMetalTextureConverter
- (BOOL)hasExtendedColorTarget;
- (BOOL)lowMemoryMode;
- (BOOL)supportsMipmaps;
- (CGColorSpace)destinationColorSpace;
- (CIContext)renderContext;
- (OS_dispatch_queue)layoutQueue;
- (OS_dispatch_queue)processingQueue;
- (OS_dispatch_queue)requestQueue;
- (PXGColorProgramLibrary)colorProgramLibrary;
- (PXGImageTexture)transparentTexture;
- (PXGMetalRenderContext)metalRenderContext;
- (PXGMetalTextureCache)renderTextureCache;
- (PXGMetalTextureConverter)init;
- (PXGMetalTextureConverter)initWithContext:(id)a3 presentationType:(unsigned __int8)a4 destinationColorspaceName:(unint64_t)a5 layoutQueue:(id)a6;
- (PXGMetalTextureConverterDelegate)delegate;
- (__CVMetalTextureCache)videoTextureCache;
- (id)_applyAdjustment:(id)a3 toMetalTexture:(id)a4 options:(id)a5;
- (id)_createTextureFromCIImage:(id)a3 source:(id)a4 options:(id)a5;
- (id)_createTransparentTexture;
- (id)_generateMipmapsForMetalTexture:(id)a3;
- (id)applyAdjustment:(id)a3 toTexture:(id)a4 options:(id)a5;
- (id)createAtlasForTextureAtlasManager:(id)a3;
- (id)createPayloadTextureFromPayload:(id)a3;
- (id)createTextureAtlasManagerForImageDataSpec:(id *)a3 mipmapped:(BOOL)a4;
- (id)createTextureFromCGImage:(CGImage *)a3 transform:(float)a4 alpha:(id)a5 options:(id *)a6 error:;
- (id)createTextureFromCVPixelBuffer:(__CVBuffer *)a3 transform:(float)a4 alpha:(id)a5 options:(id *)a6 error:;
- (unint64_t)destinationColorSpaceName;
- (unint64_t)supportedContentTypes;
- (unsigned)presentationType;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)setLowMemoryMode:(BOOL)a3;
- (void)setProcessingQueue:(id)a3;
- (void)setRequestQueue:(id)a3;
@end

@implementation PXGMetalTextureConverter

- (id)createTextureFromCGImage:(CGImage *)a3 transform:(float)a4 alpha:(id)a5 options:(id *)a6 error:
{
}

- (PXGMetalRenderContext)metalRenderContext
{
  return self->_metalRenderContext;
}

- (unsigned)presentationType
{
  return self->_presentationType;
}

- (CGColorSpace)destinationColorSpace
{
  return self->_destinationColorSpace;
}

- (PXGMetalTextureConverterDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PXGMetalTextureConverterDelegate *)WeakRetained;
}

- (PXGColorProgramLibrary)colorProgramLibrary
{
  return self->_colorProgramLibrary;
}

- (void)setDelegate:(id)a3
{
}

- (PXGMetalTextureConverter)initWithContext:(id)a3 presentationType:(unsigned __int8)a4 destinationColorspaceName:(unint64_t)a5 layoutQueue:(id)a6
{
  id v12 = a3;
  id v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)PXGMetalTextureConverter;
  v14 = [(PXGMetalTextureConverter *)&v24 init];
  if (v14)
  {
    v15 = [v12 device];

    if (!v15)
    {
      v23 = [MEMORY[0x1E4F28B00] currentHandler];
      [v23 handleFailureInMethod:a2, v14, @"PXGMetalTextureConverter.m", 73, @"Invalid parameter not satisfying: %@", @"context.device != nil" object file lineNumber description];
    }
    objc_storeStrong((id *)&v14->_metalRenderContext, a3);
    v14->_presentationType = a4;
    objc_storeStrong((id *)&v14->_layoutQueue, a6);
    v14->_screenPixelCount = +[PXGView screenPixelCount];
    v14->_destinationColorSpaceName = a5;
    v14->_destinationColorSpace = (CGColorSpace *)MEMORY[0x1AD10B240](a5);
    v14->_hasExtendedColorTarget = MEMORY[0x1AD10B170](a5);
    v16 = [[PXGColorProgramLibrary alloc] initWithContext:v12 destinationColorSpace:[(PXGMetalTextureConverter *)v14 destinationColorSpace]];
    colorProgramLibrary = v14->_colorProgramLibrary;
    v14->_colorProgramLibrary = v16;

    uint64_t v18 = [(PXGMetalTextureConverter *)v14 _createTransparentTexture];
    transparentTexture = v14->_transparentTexture;
    v14->_transparentTexture = (PXGImageTexture *)v18;

    v20 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    failedPixelFormats = v14->_failedPixelFormats;
    v14->_failedPixelFormats = v20;
  }
  return v14;
}

- (id)_createTransparentTexture
{
  v3 = (CGImage *)MEMORY[0x1AD10B1D0](0, 0, &__block_literal_global_204139, 1.0, 1.0);
  v4 = [(PXGMetalTextureConverter *)self createTextureFromCGImage:v3 transform:0 alpha:0 options:*(double *)off_1E5DAAFA0 error:0.0];
  CGImageRelease(v3);
  return v4;
}

uint64_t __53__PXGMetalTextureConverter__createTransparentTexture__block_invoke(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F40D9D30](a2);
}

- (id)createPayloadTextureFromPayload:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v5 = [[PXGMetalCaptureSpriteTexture alloc] initWithPayload:v4 presentationType:[(PXGMetalTextureConverter *)self presentationType]];
  }
  else {
    v5 = 0;
  }

  return v5;
}

- (PXGImageTexture)transparentTexture
{
  return self->_transparentTexture;
}

- (unint64_t)supportedContentTypes
{
  return 15;
}

- (void)setRequestQueue:(id)a3
{
}

- (void)setProcessingQueue:(id)a3
{
}

- (void)setLowMemoryMode:(BOOL)a3
{
  self->_lowMemoryMode = a3;
}

- (id)createTextureAtlasManagerForImageDataSpec:(id *)a3 mipmapped:(BOOL)a4
{
  unsigned int var2 = a3->var2;
  unsigned int var3 = a3->var3;
  [(PXGMetalTextureConverter *)self lowMemoryMode];
  +[PXGMetalTextureAtlas maxCapacityForThumbnailSize:pixelFormat:](PXGMetalTextureAtlas, "maxCapacityForThumbnailSize:pixelFormat:", a3->var0, (double)var2, (double)var3);
  PXGColorSpaceNameFromCFStringRef();
}

- (OS_dispatch_queue)requestQueue
{
  return self->_requestQueue;
}

- (BOOL)lowMemoryMode
{
  return self->_lowMemoryMode;
}

- (id)createAtlasForTextureAtlasManager:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_3;
    }
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    v23 = (objc_class *)objc_opt_class();
    v22 = NSStringFromClass(v23);
    objc_super v24 = objc_msgSend(v5, "px_descriptionForAssertionMessage");
    [v20 handleFailureInMethod:a2, self, @"PXGMetalTextureConverter.m", 585, @"%@ should be an instance inheriting from %@, but it is %@", @"textureAtlasManager", v22, v24 object file lineNumber description];
  }
  else
  {
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    v21 = (objc_class *)objc_opt_class();
    v22 = NSStringFromClass(v21);
    [v20 handleFailureInMethod:a2, self, @"PXGMetalTextureConverter.m", 585, @"%@ should be an instance inheriting from %@, but it is nil", @"textureAtlasManager", v22 object file lineNumber description];
  }

LABEL_3:
  v6 = [PXGMetalTextureAtlas alloc];
  [v5 thumbnailSize];
  double v8 = v7;
  double v10 = v9;
  uint64_t v11 = [v5 pixelFormat];
  uint64_t v12 = [v5 capacityPerAtlas];
  uint64_t v13 = [v5 mipmapped];
  v14 = [v5 colorProgram];
  v15 = [(PXGMetalTextureConverter *)self metalRenderContext];
  v16 = [(PXGMetalTextureConverter *)self layoutQueue];
  v17 = -[PXGMetalTextureAtlas initWithThumbnailSize:pixelFormat:capacity:mipmapped:colorProgram:context:layoutQueue:](v6, "initWithThumbnailSize:pixelFormat:capacity:mipmapped:colorProgram:context:layoutQueue:", v11, v12, v13, v14, v15, v16, v8, v10);

  uint64_t v18 = [(PXGMetalTextureConverter *)self delegate];
  [v18 metalTextureConverter:self didCreateTexture:v17 options:0];

  return v17;
}

- (OS_dispatch_queue)layoutQueue
{
  return self->_layoutQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorProgramLibrary, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_layoutQueue, 0);
  objc_storeStrong((id *)&self->_metalRenderContext, 0);
  objc_storeStrong((id *)&self->_renderContext, 0);
  objc_storeStrong((id *)&self->_renderTextureCache, 0);
  objc_storeStrong((id *)&self->_transparentTexture, 0);
  objc_storeStrong((id *)&self->_processingQueue, 0);
  objc_storeStrong((id *)&self->_requestQueue, 0);
  objc_storeStrong((id *)&self->_failedPixelFormats, 0);
}

- (BOOL)hasExtendedColorTarget
{
  return self->_hasExtendedColorTarget;
}

- (unint64_t)destinationColorSpaceName
{
  return self->_destinationColorSpaceName;
}

- (OS_dispatch_queue)processingQueue
{
  return self->_processingQueue;
}

- (BOOL)supportsMipmaps
{
  return 1;
}

- (id)_createTextureFromCIImage:(id)a3 source:(id)a4 options:(id)a5
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  int v10 = 0;
  [(PXGMetalTextureConverter *)self renderTextureCache];
  objc_claimAutoreleasedReturnValue();
  [v7 extent];
  PXGMetalPixelFormatForCIImage();
}

- (id)_applyAdjustment:(id)a3 toMetalTexture:(id)a4 options:(id)a5
{
  v101[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  double v9 = [v8 colorProgram];
  int v10 = (CGColorSpace *)[v9 sourceColorSpace];
  if (!v10) {
    int v10 = [(PXGMetalTextureConverter *)self destinationColorSpace];
  }

  uint64_t v11 = [v8 chromaTexture];

  uint64_t v12 = (uint64_t *)MEMORY[0x1E4F1E3A0];
  uint64_t v13 = MEMORY[0x1E4F1CC38];
  if (v11)
  {
    id v81 = v7;
    v14 = (void *)MEMORY[0x1E4F1E050];
    v15 = [v8 texture];
    uint64_t v16 = *v12;
    uint64_t v100 = v16;
    v101[0] = v13;
    v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v101 forKeys:&v100 count:1];
    uint64_t v18 = [v14 imageWithMTLTexture:v15 options:v17];

    v19 = (void *)MEMORY[0x1E4F1E050];
    v20 = [v8 chromaTexture];
    uint64_t v98 = v16;
    uint64_t v99 = v13;
    v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v99 forKeys:&v98 count:1];
    v22 = [v19 imageWithMTLTexture:v20 options:v21];

    uint64_t v23 = 0;
    switch(([v8 shaderFlags] >> 8) & 0xF)
    {
      case 1u:
        goto LABEL_6;
      case 2u:
        uint64_t v23 = 1;
LABEL_6:
        uint64_t v24 = 601;
        break;
      case 3u:
        goto LABEL_22;
      case 4u:
        uint64_t v23 = 1;
LABEL_22:
        uint64_t v24 = 709;
        break;
      case 5u:
        goto LABEL_24;
      case 6u:
        uint64_t v23 = 1;
LABEL_24:
        uint64_t v24 = 2020;
        break;
      case 7u:
        goto LABEL_26;
      case 8u:
        uint64_t v23 = 1;
LABEL_26:
        uint64_t v24 = 240;
        break;
      default:
        uint64_t v24 = 0;
        break;
    }
    unint64_t v50 = 0x1E4F1C000uLL;
    [v18 extent];
    int v57 = (int)v56;
    [v22 extent];
    uint64_t v59 = v24;
    unint64_t v48 = 0x1E4F1E000uLL;
    v30 = [MEMORY[0x1E4F1E050] imageWithYImage:v18 CrCbImage:v22 CrCbScale:(v57 / (int)v58) matrix:v59 fullRange:v23 colorSpace:v10];
  }
  else
  {
    v25 = (void *)MEMORY[0x1E4F1CA60];
    uint64_t v26 = *MEMORY[0x1E4F1E3A0];
    v96[0] = *MEMORY[0x1E4F1E390];
    v96[1] = v26;
    v97[0] = v10;
    v97[1] = MEMORY[0x1E4F1CC38];
    v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v97 forKeys:v96 count:2];
    uint64_t v18 = [v25 dictionaryWithDictionary:v27];

    if (([v8 shaderFlags] & 3) != 0) {
      [v18 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:*MEMORY[0x1E4F1E3B0]];
    }
    v28 = (void *)MEMORY[0x1E4F1E050];
    v29 = [v8 texture];
    v30 = [v28 imageWithMTLTexture:v29 options:v18];

    if (!v30) {
      PXGTungstenGetLog();
    }
    id v81 = v7;
    if (([v8 shaderFlags] & 4) != 0)
    {
      v94[0] = @"inputRVector";
      v31 = [MEMORY[0x1E4F1E080] vectorWithX:1.0 Y:0.0 Z:0.0 W:0.0];
      v95[0] = v31;
      v94[1] = @"inputGVector";
      v32 = [MEMORY[0x1E4F1E080] vectorWithX:1.0 Y:0.0 Z:0.0 W:0.0];
      v95[1] = v32;
      v94[2] = @"inputBVector";
      v33 = [MEMORY[0x1E4F1E080] vectorWithX:1.0 Y:0.0 Z:0.0 W:0.0];
      v95[2] = v33;
      v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v95 forKeys:v94 count:3];
      uint64_t v35 = [v30 imageByApplyingFilter:@"CIColorMatrix" withInputParameters:v34];

      v30 = (void *)v35;
    }
    if (([v8 shaderFlags] & 8) != 0)
    {
      v92[0] = @"inputRVector";
      v36 = [MEMORY[0x1E4F1E080] vectorWithX:1.0 Y:0.0 Z:0.0 W:0.0];
      v93[0] = v36;
      v92[1] = @"inputGVector";
      v37 = [MEMORY[0x1E4F1E080] vectorWithX:1.0 Y:0.0 Z:0.0 W:0.0];
      v93[1] = v37;
      v92[2] = @"inputBVector";
      v38 = [MEMORY[0x1E4F1E080] vectorWithX:1.0 Y:0.0 Z:0.0 W:0.0];
      v93[2] = v38;
      v92[3] = @"inputAVector";
      v39 = [MEMORY[0x1E4F1E080] vectorWithX:0.0 Y:1.0 Z:0.0 W:0.0];
      v93[3] = v39;
      v40 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v93 forKeys:v92 count:4];
      uint64_t v41 = [v30 imageByApplyingFilter:@"CIColorMatrix" withInputParameters:v40];

      v30 = (void *)v41;
    }
    if ([v8 shaderFlags])
    {
      v90[0] = @"inputRVector";
      v42 = [MEMORY[0x1E4F1E080] vectorWithX:0.0 Y:1.0 Z:0.0 W:0.0];
      v91[0] = v42;
      v90[1] = @"inputGVector";
      v43 = [MEMORY[0x1E4F1E080] vectorWithX:0.0 Y:0.0 Z:1.0 W:0.0];
      v91[1] = v43;
      v90[2] = @"inputBVector";
      v44 = [MEMORY[0x1E4F1E080] vectorWithX:0.0 Y:0.0 Z:0.0 W:1.0];
      v91[2] = v44;
      v90[3] = @"inputAVector";
      v45 = [MEMORY[0x1E4F1E080] vectorWithX:1.0 Y:0.0 Z:0.0 W:0.0];
      v91[3] = v45;
      v46 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v91 forKeys:v90 count:4];
      uint64_t v47 = [v30 imageByApplyingFilter:@"CIColorMatrix" withInputParameters:v46];

      v30 = (void *)v47;
    }
    unint64_t v48 = 0x1E4F1E000;
    if (([v8 shaderFlags] & 2) == 0)
    {
      v49 = v81;
      unint64_t v50 = 0x1E4F1C000;
      goto LABEL_29;
    }
    v88[0] = @"inputRVector";
    v22 = [MEMORY[0x1E4F1E080] vectorWithX:0.0 Y:0.0 Z:0.0 W:1.0];
    v89[0] = v22;
    v88[1] = @"inputGVector";
    v51 = [MEMORY[0x1E4F1E080] vectorWithX:1.0 Y:0.0 Z:0.0 W:0.0];
    v89[1] = v51;
    v88[2] = @"inputBVector";
    v52 = [MEMORY[0x1E4F1E080] vectorWithX:0.0 Y:1.0 Z:0.0 W:0.0];
    v89[2] = v52;
    v88[3] = @"inputAVector";
    v53 = [MEMORY[0x1E4F1E080] vectorWithX:0.0 Y:0.0 Z:1.0 W:0.0];
    v89[3] = v53;
    v54 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v89 forKeys:v88 count:4];
    uint64_t v55 = [v30 imageByApplyingFilter:@"CIColorMatrix" withInputParameters:v54];

    unint64_t v48 = 0x1E4F1E000;
    v30 = (void *)v55;
    unint64_t v50 = 0x1E4F1C000;
  }
  v49 = v81;

LABEL_29:
  if (!v30)
  {
    v63 = [v8 texture];
    uint64_t v64 = [v63 iosurface];

    v65 = (uint64_t *)MEMORY[0x1E4F1E390];
    if (!v64) {
      goto LABEL_43;
    }
    v66 = *(void **)(v48 + 80);
    v67 = [v8 texture];
    v68 = v49;
    uint64_t v69 = [v67 iosurface];
    uint64_t v86 = *v65;
    v87 = v10;
    v70 = [*(id *)(v50 + 2536) dictionaryWithObjects:&v87 forKeys:&v86 count:1];
    uint64_t v71 = v69;
    v49 = v68;
    v30 = [v66 imageWithIOSurface:v71 options:v70];

    if (!v30)
    {
LABEL_43:
      if (![v8 sourceCVPixelBuffer]) {
        goto LABEL_42;
      }
      v72 = *(void **)(v48 + 80);
      uint64_t v73 = [v8 sourceCVPixelBuffer];
      uint64_t v84 = *v65;
      v85 = v10;
      [*(id *)(v50 + 2536) dictionaryWithObjects:&v85 forKeys:&v84 count:1];
      v75 = v74 = v49;
      v30 = [v72 imageWithCVPixelBuffer:v73 options:v75];

      v49 = v74;
      if (!v30)
      {
LABEL_42:
        if (![v8 sourceCGImage]) {
          goto LABEL_39;
        }
        v76 = *(void **)(v48 + 80);
        uint64_t v77 = [v8 sourceCGImage];
        uint64_t v82 = *v65;
        v83 = v10;
        [*(id *)(v50 + 2536) dictionaryWithObjects:&v83 forKeys:&v82 count:1];
        v79 = v78 = v49;
        v30 = [v76 imageWithCGImage:v77 options:v79];

        v49 = v78;
        if (!v30) {
LABEL_39:
        }
          PXAssertGetLog();
      }
    }
  }
  [v30 extent];
  v62 = objc_msgSend(v49, "applyToImage:targetSize:", v30, v60, v61);
  if (!v62) {
    PXAssertGetLog();
  }
  [v62 extent];
  PXSizeIsEmpty();
}

- (id)_generateMipmapsForMetalTexture:(id)a3
{
  id v4 = a3;
  id v5 = [v4 texture];
  if ((unint64_t)[v5 pixelFormat] > 0x1F3) {
    PXGTungstenGetLog();
  }
  v6 = [(PXGMetalTextureConverter *)self metalRenderContext];
  id v7 = (void *)[v6 newMipmappedTextureFromTexture:v5];

  id v8 = [PXGMetalImageTexture alloc];
  double v9 = [v4 colorProgram];
  uint64_t v10 = [v4 isOpaque];
  uint64_t v11 = [v4 shaderFlags];
  [v4 orientationTransform];
  double v19 = v12;
  [v4 alpha];
  int v14 = v13;
  uint64_t v15 = [(PXGMetalTextureConverter *)self presentationType];
  LODWORD(v16) = v14;
  v17 = [(PXGMetalImageTexture *)v8 initWithTexture:v7 colorProgram:v9 isOpaque:v10 shaderFlags:v11 orientationTransform:v15 alpha:v19 presentationType:v16];

  return v17;
}

- (id)applyAdjustment:(id)a3 toTexture:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v10 = 0;
    goto LABEL_13;
  }
  if (v8)
  {
    objc_opt_class();
    [v9 pixelSize];
    [v9 pixelSize];
    kdebug_trace();
    uint64_t v10 = [(PXGMetalTextureConverter *)self _applyAdjustment:v8 toMetalTexture:v9 options:a5];
    objc_opt_class();
    [v10 pixelSize];
    [v10 pixelSize];
    kdebug_trace();
    if ((*(void *)&a5 & 0x100000000) == 0) {
      goto LABEL_13;
    }
  }
  else
  {
    uint64_t v10 = 0;
    if ((*(void *)&a5 & 0x100000000) == 0) {
      goto LABEL_13;
    }
  }
  if (v10) {
    uint64_t v11 = v10;
  }
  else {
    uint64_t v11 = v9;
  }
  id v12 = v11;
  [v12 pixelSize];
  [v12 pixelSize];
  kdebug_trace();
  int v13 = [(PXGMetalTextureConverter *)self _generateMipmapsForMetalTexture:v12];
  [v13 pixelSize];
  [v13 pixelSize];
  kdebug_trace();
  if (v13)
  {
    id v14 = v13;

    uint64_t v10 = v14;
  }

LABEL_13:
  return v10;
}

- (id)createTextureFromCVPixelBuffer:(__CVBuffer *)a3 transform:(float)a4 alpha:(id)a5 options:(id *)a6 error:
{
}

- (PXGMetalTextureCache)renderTextureCache
{
  renderTextureCache = self->_renderTextureCache;
  if (!renderTextureCache)
  {
    id v4 = [off_1E5DA9658 sharedInstance];
    if ([v4 enableRenderTextureCache])
    {
      id v5 = objc_alloc((Class)off_1E5DA69D0);
      v6 = [(PXGMetalTextureConverter *)self metalRenderContext];
      id v7 = (PXGMetalTextureCache *)[v5 initWithContext:v6];
      id v8 = self->_renderTextureCache;
      self->_renderTextureCache = v7;

      -[PXGMetalTextureCache setCapacity:](self->_renderTextureCache, "setCapacity:", [v4 renderTextureCacheCapacity]);
      [v4 renderTextureCacheAgeLimit];
      -[PXGMetalTextureCache setAgeLimit:](self->_renderTextureCache, "setAgeLimit:");
      -[PXGMetalTextureCache setSizeLimit:](self->_renderTextureCache, "setSizeLimit:", [v4 renderTextureCacheSizeLimitMB] << 20);
    }

    renderTextureCache = self->_renderTextureCache;
  }
  return renderTextureCache;
}

- (CIContext)renderContext
{
  v12[1] = *MEMORY[0x1E4F143B8];
  renderContext = self->_renderContext;
  if (!renderContext)
  {
    id v4 = (void *)MEMORY[0x1E4F1E018];
    id v5 = [(PXGMetalTextureConverter *)self metalRenderContext];
    v6 = [v5 device];
    uint64_t v11 = *MEMORY[0x1E4F1E1E0];
    v12[0] = MEMORY[0x1E4F1CC28];
    id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
    id v8 = [v4 contextWithMTLDevice:v6 options:v7];
    id v9 = self->_renderContext;
    self->_renderContext = v8;

    renderContext = self->_renderContext;
  }
  return renderContext;
}

- (__CVMetalTextureCache)videoTextureCache
{
  p_videoTextureCache = &self->_videoTextureCache;
  result = self->_videoTextureCache;
  if (!result)
  {
    CFAllocatorRef v5 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    v6 = [(PXGMetalTextureConverter *)self metalRenderContext];
    id v7 = [v6 device];
    CVMetalTextureCacheCreate(v5, 0, v7, 0, p_videoTextureCache);

    return self->_videoTextureCache;
  }
  return result;
}

- (void)dealloc
{
  videoTextureCache = self->_videoTextureCache;
  if (videoTextureCache) {
    CFRelease(videoTextureCache);
  }
  v4.receiver = self;
  v4.super_class = (Class)PXGMetalTextureConverter;
  [(PXGMetalTextureConverter *)&v4 dealloc];
}

- (PXGMetalTextureConverter)init
{
  objc_super v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXGMetalTextureConverter.m", 89, @"%s is not available as initializer", "-[PXGMetalTextureConverter init]");

  abort();
}

@end