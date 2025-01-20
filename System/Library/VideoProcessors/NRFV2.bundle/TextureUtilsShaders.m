@interface TextureUtilsShaders
- (TextureUtilsShaders)initWithMetal:(id)a3;
@end

@implementation TextureUtilsShaders

- (TextureUtilsShaders)initWithMetal:(id)a3
{
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)TextureUtilsShaders;
  v6 = [(TextureUtilsShaders *)&v26 init];
  if (!v6) {
    goto LABEL_8;
  }
  uint64_t v7 = objc_msgSend_computePipelineStateFor_constants_(v4, v5, @"fillTexturePaddedArea", 0);
  fillTexturePaddedArea = v6->_fillTexturePaddedArea;
  v6->_fillTexturePaddedArea = (MTLComputePipelineState *)v7;

  if (!v6->_fillTexturePaddedArea) {
    goto LABEL_10;
  }
  uint64_t v10 = objc_msgSend_computePipelineStateFor_constants_(v4, v9, @"fillTexturePaddedArea10BitPacked_Luma", 0);
  fillTexturePaddedArea10BitPacked_Luma = v6->_fillTexturePaddedArea10BitPacked_Luma;
  v6->_fillTexturePaddedArea10BitPacked_Luma = (MTLComputePipelineState *)v10;

  if (!v6->_fillTexturePaddedArea10BitPacked_Luma) {
    goto LABEL_10;
  }
  uint64_t v13 = objc_msgSend_computePipelineStateFor_constants_(v4, v12, @"fillTexturePaddedArea10BitPacked_Chroma", 0);
  fillTexturePaddedArea10BitPacked_Chroma = v6->_fillTexturePaddedArea10BitPacked_Chroma;
  v6->_fillTexturePaddedArea10BitPacked_Chroma = (MTLComputePipelineState *)v13;

  if (!v6->_fillTexturePaddedArea10BitPacked_Chroma) {
    goto LABEL_10;
  }
  uint64_t v16 = objc_msgSend_computePipelineStateFor_constants_(v4, v15, @"kernelPack10BitY", 0);
  kernelPack10BitY = v6->_kernelPack10BitY;
  v6->_kernelPack10BitY = (MTLComputePipelineState *)v16;

  if (!v6->_kernelPack10BitY) {
    goto LABEL_10;
  }
  uint64_t v19 = objc_msgSend_computePipelineStateFor_constants_(v4, v18, @"kernelPack10BitCbCr", 0);
  kernelPack10BitCbCr = v6->_kernelPack10BitCbCr;
  v6->_kernelPack10BitCbCr = (MTLComputePipelineState *)v19;

  if (!v6->_kernelPack10BitCbCr) {
    goto LABEL_10;
  }
  uint64_t v22 = objc_msgSend_computePipelineStateFor_constants_(v4, v21, @"copyTexture", 0);
  copyTexture = v6->_copyTexture;
  v6->_copyTexture = (MTLComputePipelineState *)v22;

  if (v6->_copyTexture)
  {
LABEL_8:
    v24 = v6;
  }
  else
  {
LABEL_10:
    FigDebugAssert3();
    FigSignalErrorAt();
    v24 = 0;
  }

  return v24;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_copyTexture, 0);
  objc_storeStrong((id *)&self->_kernelPack10BitCbCr, 0);
  objc_storeStrong((id *)&self->_kernelPack10BitY, 0);
  objc_storeStrong((id *)&self->_fillTexturePaddedArea10BitPacked_Chroma, 0);
  objc_storeStrong((id *)&self->_fillTexturePaddedArea10BitPacked_Luma, 0);

  objc_storeStrong((id *)&self->_fillTexturePaddedArea, 0);
}

@end