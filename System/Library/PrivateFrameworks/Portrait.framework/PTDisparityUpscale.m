@interface PTDisparityUpscale
- (PTDisparityUpscale)initWithMetalContext:(id)a3 colorSize:(CGSize)a4 disparitySize:(CGSize)a5;
- (id)guidedUpsampling:(id)a3 inDisparity:(id)a4 inRGBA:(id)a5 colorDepth:(int64_t)a6;
- (id)upscaledTexture;
- (unint64_t)height;
- (unint64_t)width;
@end

@implementation PTDisparityUpscale

- (PTDisparityUpscale)initWithMetalContext:(id)a3 colorSize:(CGSize)a4 disparitySize:(CGSize)a5
{
  double height = a5.height;
  double width = a5.width;
  double v7 = a4.height;
  double v8 = a4.width;
  v65[1] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  v63.receiver = self;
  v63.super_class = (Class)PTDisparityUpscale;
  v12 = [(PTDisparityUpscale *)&v63 init];
  v13 = v12;
  if (!v12) {
    goto LABEL_28;
  }
  objc_storeStrong((id *)&v12->_metalContext, a3);
  v13->_double width = (unint64_t)width;
  v13->_double height = (unint64_t)height;
  v13->_float upscaleFactor = 2.0;
  char Bool = PTDefaultsPublicGetBool(@"harvesting.enabled", 0);
  v13->_isShaderHarvesting = Bool;
  float upscaleFactor = v13->_upscaleFactor;
  double v16 = width * upscaleFactor;
  if (v8 < v16) {
    double v16 = v8;
  }
  double v17 = height * upscaleFactor;
  if (v7 < v17) {
    double v17 = v7;
  }
  v13->_double width = (unint64_t)v16;
  v13->_double height = (unint64_t)v17;
  if (upscaleFactor <= 1.0 || (Bool & 1) != 0) {
    goto LABEL_19;
  }
  v18 = [[PTUtil alloc] initWithMetalContext:v13->_metalContext];
  portraitUtil = v13->_portraitUtil;
  v13->_portraitUtil = v18;

  if (!v13->_portraitUtil)
  {
    v24 = _PTLogSystem();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      -[PTDisparityUpscale initWithMetalContext:colorSize:disparitySize:](v24, v46, v47, v48, v49, v50, v51, v52);
    }
    goto LABEL_27;
  }
  v20 = [(PTMetalContext *)v13->_metalContext textureUtil];
  uint64_t v21 = [v20 createWithWidth:v13->_width height:v13->_height pixelFormat:25];
  disparityUpscaled = v13->_disparityUpscaled;
  v13->_disparityUpscaled = (MTLTexture *)v21;

  if (!v13->_disparityUpscaled)
  {
    v24 = _PTLogSystem();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      -[PTDisparityUpscale initWithMetalContext:colorSize:disparitySize:](v24);
    }
    goto LABEL_27;
  }
  LOBYTE(v62) = 0;
  LODWORD(v23) = 1000593162;
  v24 = [MEMORY[0x1E4F355D8] filterDescriptorWithWidth:(int)width height:(int)height arrayLength:1 kernelSpatialDiameter:3 kernelTemporalDiameter:1 epsilon:1 sourceChannels:v23 guideChannels:3 preallocateIntermediates:v62];
  if (!v24)
  {
    v25 = _PTLogSystem();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      -[PTDisparityUpscale initWithMetalContext:colorSize:disparitySize:].cold.4(v25, v26, v27, v28, v29, v30, v31, v32);
    }
  }
  id v33 = objc_alloc(MEMORY[0x1E4F355D0]);
  v34 = [(PTMetalContext *)v13->_metalContext device];
  uint64_t v35 = [v33 initWithDevice:v34 filterDescriptor:v24];
  guidedFilter = v13->_guidedFilter;
  v13->_guidedFilter = (MPSImageSpatioTemporalGuidedFilter *)v35;

  if (!v13->_guidedFilter)
  {
    v53 = _PTLogSystem();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR)) {
      -[PTRaytracingV3001 initWithMetalContext:renderEffects:colorSize:disparitySize:debugRendering:verbose:options:quality:]2(v53, v54, v55, v56, v57, v58, v59, v60);
    }

LABEL_27:
LABEL_28:
    v45 = 0;
    goto LABEL_29;
  }
  v37 = [MEMORY[0x1E4F35330] texture2DDescriptorWithPixelFormat:115 width:(unint64_t)width height:(unint64_t)height mipmapped:0];
  [v37 setUsage:19];
  v38 = [(PTMetalContext *)v13->_metalContext device];
  if ([v38 supportsFamily:1007]) {
    uint64_t v39 = 0;
  }
  else {
    uint64_t v39 = 32;
  }
  [v37 setResourceOptions:v39];

  [v37 setTextureType:3];
  v40 = [(PTMetalContext *)v13->_metalContext device];
  v41 = (void *)[v40 newTextureWithDescriptor:v37];
  v64 = v41;
  v42 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v64 count:1];
  v65[0] = v42;
  uint64_t v43 = [MEMORY[0x1E4F1C978] arrayWithObjects:v65 count:1];
  coefficientsTextureArray = v13->_coefficientsTextureArray;
  v13->_coefficientsTextureArray = (NSArray *)v43;

LABEL_19:
  v45 = v13;
LABEL_29:

  return v45;
}

- (id)guidedUpsampling:(id)a3 inDisparity:(id)a4 inRGBA:(id)a5 colorDepth:(int64_t)a6
{
  v32[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = (MTLTexture *)a4;
  id v12 = a5;
  v13 = v11;
  if (self->_upscaleFactor > 1.0)
  {
    if (!self->_guideConversionTexture)
    {
      uint64_t v14 = [v12 pixelFormat];
      v15 = [(PTMetalContext *)self->_metalContext textureUtil];
      double v16 = v15;
      if (v14 == 555) {
        uint64_t v17 = 71;
      }
      else {
        uint64_t v17 = 115;
      }
      v18 = [v15 createWithWidth:self->_width height:self->_height pixelFormat:v17];
      guideConversionTexture = self->_guideConversionTexture;
      self->_guideConversionTexture = v18;
    }
    v20 = [(PTMetalContext *)self->_metalContext textureUtil];
    uint64_t v21 = v20;
    LODWORD(v22) = 1042983595;
    if (a6 == 8) {
      *(float *)&double v22 = 1.0;
    }
    [v20 multiply:v10 inTex:v12 outTex:self->_guideConversionTexture multiplier:v22];

    guidedFilter = self->_guidedFilter;
    v32[0] = v11;
    v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:1];
    [(MPSImageSpatioTemporalGuidedFilter *)guidedFilter encodeRegressionToCommandBuffer:v10 sourceTextureArray:v24 guidanceTexture:self->_guideConversionTexture constraintsTextureArray:0 numberOfIterations:1 destinationCoefficientsTextureArray:self->_coefficientsTextureArray];

    v25 = self->_guideConversionTexture;
    coefficientsTextureArray = self->_coefficientsTextureArray;
    uint64_t v27 = self->_guidedFilter;
    disparityUpscaled = self->_disparityUpscaled;
    uint64_t v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:&disparityUpscaled count:1];
    [(MPSImageSpatioTemporalGuidedFilter *)v27 encodeReconstructionToCommandBuffer:v10 guidanceTexture:v25 coefficientsTextureArray:coefficientsTextureArray destinationTextureArray:v28];

    v13 = self->_disparityUpscaled;
  }
  uint64_t v29 = v13;

  return v29;
}

- (unint64_t)width
{
  return self->_width;
}

- (unint64_t)height
{
  return self->_height;
}

- (id)upscaledTexture
{
  return self->_disparityUpscaled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coefficientsTextureArray, 0);
  objc_storeStrong((id *)&self->_guideConversionTexture, 0);
  objc_storeStrong((id *)&self->_portraitUtil, 0);
  objc_storeStrong((id *)&self->_guidedFilter, 0);
  objc_storeStrong((id *)&self->_disparityUpscaled, 0);

  objc_storeStrong((id *)&self->_metalContext, 0);
}

- (void)initWithMetalContext:(uint64_t)a3 colorSize:(uint64_t)a4 disparitySize:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMetalContext:(os_log_t)log colorSize:disparitySize:.cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D0778000, log, OS_LOG_TYPE_ERROR, "PTDisparityUpscale Cannot allocate texture", v1, 2u);
}

- (void)initWithMetalContext:(uint64_t)a3 colorSize:(uint64_t)a4 disparitySize:(uint64_t)a5 .cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end