@interface PTEffectPersonSegmentation
+ (CGSize)segmentationSizeForColorSize:(CGSize)a3;
+ (PTEffectPixelBufferDescriptor)upscaledSegmentationMatteFormatForColorSize:(SEL)a3;
+ (unint64_t)segmentationType;
- (PTEffectPersonSegmentation)initWithMetalContext:(id)a3 colorSize:(CGSize)a4 msrColorPyramid:(id)a5 cvmNetwork:(id)a6 effectQuality:(int64_t)a7 prewarmOnly:(BOOL)a8 sharedResources:(id)a9;
- (id)debugTextures;
- (int)runPersonSegmentationToOutPersonSegmentationMatteBuffer:(id)a3 inRGBA:(__CVBuffer *)a4 outUpscaledSegmentation:(id)a5;
- (unsigned)reset;
@end

@implementation PTEffectPersonSegmentation

- (PTEffectPersonSegmentation)initWithMetalContext:(id)a3 colorSize:(CGSize)a4 msrColorPyramid:(id)a5 cvmNetwork:(id)a6 effectQuality:(int64_t)a7 prewarmOnly:(BOOL)a8 sharedResources:(id)a9
{
  double height = a4.height;
  double width = a4.width;
  id v16 = a3;
  id v17 = a5;
  id v18 = a9;
  v70.receiver = self;
  v70.super_class = (Class)PTEffectPersonSegmentation;
  v19 = [(PTEffectPersonSegmentation *)&v70 init];
  v20 = v19;
  if (!v19) {
    goto LABEL_27;
  }
  objc_storeStrong((id *)&v19->_metalContext, a3);
  +[PTEffectPersonSegmentation upscaledSegmentationMatteFormatForColorSize:](PTEffectPersonSegmentation, "upscaledSegmentationMatteFormatForColorSize:", width, height);
  v20->_outputDescriptor.size = v68;
  *(void *)&v20->_outputDescriptor.pixelFormatType = v69;
  objc_storeStrong((id *)&v20->_msrColorPyramid, a5);
  unint64_t v21 = +[PTEffectPersonSegmentation segmentationType];
  if (v21 == 2)
  {
    v27 = _PTLogSystem();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      -[PTEffectPersonSegmentation initWithMetalContext:colorSize:msrColorPyramid:cvmNetwork:effectQuality:prewarmOnly:sharedResources:].cold.4(v27);
    }
    goto LABEL_26;
  }
  if (v21 != 1)
  {
    if (v21)
    {
      CGFloat v22 = 0.0;
      CGFloat v23 = 0.0;
      uint64_t v24 = 0;
    }
    else
    {
      +[PTEffectPersonSegmentationVision segmentationSizeForColorSize:](PTEffectPersonSegmentationVision, "segmentationSizeForColorSize:", width, height);
      CGFloat v23 = v68.height;
      CGFloat v22 = v68.width;
      uint64_t v24 = v69;
      if (!a8)
      {
        v25 = -[PTEffectPersonSegmentationVision initWithMetalContext:colorSize:]([PTEffectPersonSegmentationVision alloc], "initWithMetalContext:colorSize:", v20->_metalContext, width, height);
        personSegmentation = v20->_personSegmentation;
        v20->_personSegmentation = (PTEffectPersonSegmentation *)v25;

        if (!v20->_personSegmentation)
        {
          v27 = _PTLogSystem();
          if (!os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          {
LABEL_26:

LABEL_27:
            v51 = 0;
            goto LABEL_28;
          }
LABEL_8:
          -[PTEffectPersonSegmentation initWithMetalContext:colorSize:msrColorPyramid:cvmNetwork:effectQuality:prewarmOnly:sharedResources:](v27, v28, v29, v30, v31, v32, v33, v34);
          goto LABEL_26;
        }
      }
    }
    goto LABEL_22;
  }
  +[PTEffectPersonSegmentationViSegHQVisionCore segmentationSizeForColorSize:](PTEffectPersonSegmentationViSegHQVisionCore, "segmentationSizeForColorSize:", width, height);
  CGFloat v23 = v68.height;
  CGFloat v22 = v68.width;
  uint64_t v24 = v69;
  if (v18)
  {
    [v18 segmentationSize];
    if (v65 == *(void *)&v68.width)
    {
      [v18 segmentationSize];
      uint64_t v35 = v63;
      goto LABEL_17;
    }
  }
  else
  {
    uint64_t v65 = 0;
    uint64_t v66 = 0;
    uint64_t v67 = 0;
    if (!*(void *)&v68.width)
    {
      uint64_t v35 = 0;
      v62[3] = 0;
      uint64_t v63 = 0;
      uint64_t v64 = 0;
LABEL_17:
      if (v35 == *(void *)&v68.height)
      {
        uint64_t v36 = [v18 personSegmentationProvider];
        v37 = v20->_personSegmentation;
        v20->_personSegmentation = (PTEffectPersonSegmentation *)v36;

        [(PTEffectPersonSegmentation *)v20->_personSegmentation reset];
        goto LABEL_22;
      }
    }
  }
  if (!a8)
  {
    v38 = -[PTEffectPersonSegmentationViSegHQVisionCore initWithMetalContext:colorSize:]([PTEffectPersonSegmentationViSegHQVisionCore alloc], "initWithMetalContext:colorSize:", v20->_metalContext, width, height);
    v39 = v20->_personSegmentation;
    v20->_personSegmentation = (PTEffectPersonSegmentation *)v38;

    if (!v20->_personSegmentation)
    {
      v27 = _PTLogSystem();
      if (!os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        goto LABEL_26;
      }
      goto LABEL_8;
    }
    *(CGFloat *)v62 = v22;
    *(CGFloat *)&v62[1] = v23;
    v62[2] = v24;
    [v18 setSegmentationSize:v62];
    [v18 setPersonSegmentationProvider:v20->_personSegmentation];
  }
LABEL_22:
  v40 = [PTGuidedFilter alloc];
  metalContext = v20->_metalContext;
  v68.double width = v22;
  v68.double height = v23;
  uint64_t v69 = v24;
  LODWORD(v42) = 1008981770;
  uint64_t v43 = [(PTGuidedFilter *)v40 initWithMetalContext:metalContext inputSize:&v68 epsilon:v42];
  guidedFilterSegmentation = v20->_guidedFilterSegmentation;
  v20->_guidedFilterSegmentation = (PTGuidedFilter *)v43;

  if (!v20->_guidedFilterSegmentation)
  {
    v27 = _PTLogSystem();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      -[PTEffectPersonSegmentation initWithMetalContext:colorSize:msrColorPyramid:cvmNetwork:effectQuality:prewarmOnly:sharedResources:](v27, v52, v53, v54, v55, v56, v57, v58);
    }
    goto LABEL_26;
  }
  v45 = [v17 pyramidRGBA];
  uint64x2_t v60 = vcvtq_u64_f64((float64x2_t)v20->_outputDescriptor.size);
  uint64_t v61 = 1;
  uint64_t v46 = +[PTUtil findMipmapLevel:v45 largerThan:&v60];
  guideRGBAUpscaleSegmentation = v20->_guideRGBAUpscaleSegmentation;
  v20->_guideRGBAUpscaleSegmentation = (MTLTexture *)v46;

  v48 = [v17 pyramidRGBA];
  v68.double width = v22;
  v68.double height = v23;
  uint64_t v69 = v24;
  uint64_t v49 = +[PTUtil findMipmapLevel:v48 largerThan:&v68];
  guideRGBACoefficientsSegmentation = v20->_guideRGBACoefficientsSegmentation;
  v20->_guideRGBACoefficientsSegmentation = (MTLTexture *)v49;

  v51 = v20;
LABEL_28:

  return v51;
}

- (int)runPersonSegmentationToOutPersonSegmentationMatteBuffer:(id)a3 inRGBA:(__CVBuffer *)a4 outUpscaledSegmentation:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = [(PTEffectPersonSegmentation *)self->_personSegmentation runPersonSegmentationForPixelBuffer:a4];
  unint64_t v11 = [v9 width];
  if (v11 <= [v10 width] && (unint64_t v12 = objc_msgSend(v9, "height"), v12 <= objc_msgSend(v10, "height")))
  {
    v14 = [(PTMetalContext *)self->_metalContext textureUtil];
    v15 = [(PTMetalContext *)self->_metalContext commandBuffer];
    int v13 = [v14 copy:v15 inTex:v10 outTex:v9];
  }
  else
  {
    int v13 = [(PTGuidedFilter *)self->_guidedFilterSegmentation guidedFilter:v8 image:v10 guideRGBACoefficients:self->_guideRGBACoefficientsSegmentation guideRGBAUpscale:self->_guideRGBAUpscaleSegmentation upscaledImage:v9 sourceColorBitDepth:8 postModifierPtr:0];
  }

  return v13;
}

- (unsigned)reset
{
  return [(PTEffectPersonSegmentation *)self->_personSegmentation reset];
}

+ (PTEffectPixelBufferDescriptor)upscaledSegmentationMatteFormatForColorSize:(SEL)a3
{
  double height = a4.height;
  double width = a4.width;
  retstr->size.double width = 0.0;
  retstr->size.double height = 0.0;
  *(void *)&retstr->pixelFormatType = 0;
  result = (PTEffectPixelBufferDescriptor *)objc_msgSend(a2, "segmentationSizeForColorSize:");
  if (v8 < width) {
    double v8 = width;
  }
  if (v9 < height) {
    double v9 = height;
  }
  retstr->size.double width = v8;
  retstr->size.double height = v9;
  retstr->pixelFormatType = 1278226488;
  return result;
}

+ (unint64_t)segmentationType
{
  return 1;
}

+ (CGSize)segmentationSizeForColorSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  unint64_t v5 = +[PTEffectPersonSegmentation segmentationType];
  if (v5 == 1)
  {
    v6 = PTEffectPersonSegmentationViSegHQVisionCore;
    goto LABEL_5;
  }
  if (!v5)
  {
    v6 = PTEffectPersonSegmentationVision;
LABEL_5:
    -[__objc2_class segmentationSizeForColorSize:](v6, "segmentationSizeForColorSize:", width, height);
    unint64_t v7 = v12;
    unint64_t v8 = v13;
    goto LABEL_9;
  }
  double v9 = _PTLogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    +[PTEffectPersonSegmentation segmentationSizeForColorSize:](v9);
  }

  unint64_t v8 = 0;
  unint64_t v7 = 0;
LABEL_9:
  double v10 = (double)v7;
  double v11 = (double)v8;
  result.double height = v11;
  result.double width = v10;
  return result;
}

- (id)debugTextures
{
  v3 = objc_opt_new();
  [v3 addObject:self->_guideRGBAUpscaleSegmentation];
  [v3 addObject:self->_guideRGBACoefficientsSegmentation];
  v4 = [(PTEffectPersonSegmentation *)self->_personSegmentation debugTextures];
  [v3 addObjectsFromArray:v4];

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_msrColorPyramid, 0);
  objc_storeStrong((id *)&self->_personSegmentation, 0);
  objc_storeStrong((id *)&self->_guideRGBACoefficientsSegmentation, 0);
  objc_storeStrong((id *)&self->_guideRGBAUpscaleSegmentation, 0);
  objc_storeStrong((id *)&self->_guidedFilterSegmentation, 0);

  objc_storeStrong((id *)&self->_metalContext, 0);
}

- (void)initWithMetalContext:(uint64_t)a3 colorSize:(uint64_t)a4 msrColorPyramid:(uint64_t)a5 cvmNetwork:(uint64_t)a6 effectQuality:(uint64_t)a7 prewarmOnly:(uint64_t)a8 sharedResources:.cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMetalContext:(uint64_t)a3 colorSize:(uint64_t)a4 msrColorPyramid:(uint64_t)a5 cvmNetwork:(uint64_t)a6 effectQuality:(uint64_t)a7 prewarmOnly:(uint64_t)a8 sharedResources:.cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMetalContext:(os_log_t)log colorSize:msrColorPyramid:cvmNetwork:effectQuality:prewarmOnly:sharedResources:.cold.4(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D0778000, log, OS_LOG_TYPE_ERROR, "Unsupported person segmentation", v1, 2u);
}

+ (void)segmentationSizeForColorSize:(NSObject *)a1 .cold.1(NSObject *a1)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = +[PTEffectPersonSegmentation segmentationType];
  _os_log_error_impl(&dword_1D0778000, a1, OS_LOG_TYPE_ERROR, "Invalid type %i", (uint8_t *)v2, 8u);
}

@end