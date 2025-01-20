@interface TextureUtilsShaders
- (TextureUtilsShaders)initWithMetal:(id)a3;
@end

@implementation TextureUtilsShaders

- (TextureUtilsShaders)initWithMetal:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)TextureUtilsShaders;
  v5 = [(TextureUtilsShaders *)&v20 init];
  if (!v5) {
    goto LABEL_8;
  }
  uint64_t v6 = [v4 computePipelineStateFor:@"fillTexturePaddedArea" constants:0];
  fillTexturePaddedArea = v5->_fillTexturePaddedArea;
  v5->_fillTexturePaddedArea = (MTLComputePipelineState *)v6;

  if (!v5->_fillTexturePaddedArea) {
    goto LABEL_10;
  }
  uint64_t v8 = [v4 computePipelineStateFor:@"fillTexturePaddedArea10BitPacked_Luma" constants:0];
  fillTexturePaddedArea10BitPacked_Luma = v5->_fillTexturePaddedArea10BitPacked_Luma;
  v5->_fillTexturePaddedArea10BitPacked_Luma = (MTLComputePipelineState *)v8;

  if (!v5->_fillTexturePaddedArea10BitPacked_Luma) {
    goto LABEL_10;
  }
  uint64_t v10 = [v4 computePipelineStateFor:@"fillTexturePaddedArea10BitPacked_Chroma" constants:0];
  fillTexturePaddedArea10BitPacked_Chroma = v5->_fillTexturePaddedArea10BitPacked_Chroma;
  v5->_fillTexturePaddedArea10BitPacked_Chroma = (MTLComputePipelineState *)v10;

  if (!v5->_fillTexturePaddedArea10BitPacked_Chroma) {
    goto LABEL_10;
  }
  uint64_t v12 = [v4 computePipelineStateFor:@"kernelPack10BitY" constants:0];
  kernelPack10BitY = v5->_kernelPack10BitY;
  v5->_kernelPack10BitY = (MTLComputePipelineState *)v12;

  if (!v5->_kernelPack10BitY) {
    goto LABEL_10;
  }
  uint64_t v14 = [v4 computePipelineStateFor:@"kernelPack10BitCbCr" constants:0];
  kernelPack10BitCbCr = v5->_kernelPack10BitCbCr;
  v5->_kernelPack10BitCbCr = (MTLComputePipelineState *)v14;

  if (!v5->_kernelPack10BitCbCr) {
    goto LABEL_10;
  }
  uint64_t v16 = [v4 computePipelineStateFor:@"copyTexture" constants:0];
  copyTexture = v5->_copyTexture;
  v5->_copyTexture = (MTLComputePipelineState *)v16;

  if (v5->_copyTexture)
  {
LABEL_8:
    v18 = v5;
  }
  else
  {
LABEL_10:
    FigDebugAssert3();
    FigSignalErrorAt();
    v18 = 0;
  }

  return v18;
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