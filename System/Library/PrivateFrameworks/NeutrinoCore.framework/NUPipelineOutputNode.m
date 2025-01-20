@interface NUPipelineOutputNode
- (BOOL)enforceEvenDimensions;
- (BOOL)renderTransparencyOpaque;
- (BOOL)shouldCacheNodeForPipelineState:(id)a3;
- (NUPipelineOutputNode)initWithInput:(id)a3;
- (NUPipelineOutputNode)initWithInput:(id)a3 settings:(id)a4;
- (id)_evaluateImage:(id *)a3;
- (id)_evaluateImageGeometry:(id *)a3;
- (id)_evaluateImageGeometryWithZeroedOrigin:(BOOL)a3 error:(id *)a4;
- (id)_evaluateVideoProperties:(id *)a3;
- (id)extentPolicy;
- (id)resolvedNodeWithCachedInputs:(id)a3 settings:(id)a4 pipelineState:(id)a5 error:(id *)a6;
- (int64_t)imageGeometryRoundingPolicy;
@end

@implementation NUPipelineOutputNode

- (id)_evaluateImage:(id *)a3
{
  v5 = [(NURenderNode *)self inputForKey:*MEMORY[0x1E4F1E480]];
  uint64_t v6 = [v5 outputImage:a3];
  if (!v6)
  {
    v10 = 0;
    goto LABEL_20;
  }
  id v7 = (id)v6;
  if ([(NUPipelineOutputNode *)self renderTransparencyOpaque])
  {
    v8 = [v5 imageProperties:a3];
    if (!v8) {
      goto LABEL_18;
    }
    v9 = v8;
    if ([v8 alphaInfo] == 1)
    {
      if (+[NUGlobalSettings renderTransparencyOverBlack])
      {
        [MEMORY[0x1E4F1E008] blackColor];
      }
      else
      {
        [MEMORY[0x1E4F1E008] whiteColor];
      uint64_t v12 = };
      v13 = +[NUColorSpace sRGBColorSpace];
      uint64_t v14 = [v13 CGColorSpace];

      v15 = [v7 imageByColorMatchingWorkingSpaceToColorSpace:v14];

      v16 = [MEMORY[0x1E4F1E050] imageWithColor:v12];
      v17 = [v15 imageByCompositingOverImage:v16];

      [v17 extent];
      v18 = objc_msgSend(v17, "imageBySettingAlphaOneInExtent:");

      uint64_t v11 = [v18 imageByColorMatchingColorSpaceToWorkingSpace:v14];

      id v7 = (id)v12;
    }
    else
    {
      [v7 extent];
      uint64_t v11 = objc_msgSend(v7, "imageBySettingAlphaOneInExtent:");
    }

    id v7 = (id)v11;
  }
  v19 = [(NUPipelineOutputNode *)self _evaluateImageGeometryWithZeroedOrigin:0 error:a3];
  if (v19)
  {
    v20 = v19;
    [v19 scaledExtent];
    if (v21 != 0.0 || v22 != 0.0)
    {
      memset(&v29, 0, sizeof(v29));
      long long v23 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
      *(_OWORD *)&v28.a = *MEMORY[0x1E4F1DAB8];
      *(_OWORD *)&v28.c = v23;
      *(_OWORD *)&v28.tx = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
      CGAffineTransformTranslate(&v29, &v28, -v21, -v22);
      CGAffineTransform v28 = v29;
      uint64_t v24 = [v7 imageByApplyingTransform:&v28];

      id v7 = (id)v24;
    }
    v25 = v7;
    id v7 = [v7 imageByClampingToExtent];

    v10 = [(NUPipelineOutputNode *)self _evaluateImageGeometryWithZeroedOrigin:1 error:a3];

    if (v10)
    {
      memset(&v29, 0, 32);
      [v10 physicalScaledExtent];
      v26 = objc_msgSend(v7, "imageByCroppingToRect:", (double)*(uint64_t *)&v29.a, (double)*(uint64_t *)&v29.b, (double)*(uint64_t *)&v29.c, (double)*(uint64_t *)&v29.d);

      id v7 = v26;
      v10 = v7;
    }
    goto LABEL_19;
  }
LABEL_18:
  v10 = 0;
LABEL_19:

LABEL_20:

  return v10;
}

- (id)_evaluateVideoProperties:(id *)a3
{
  v5 = [(NURenderNode *)self inputForKey:*MEMORY[0x1E4F1E480]];
  uint64_t v6 = [v5 videoProperties:a3];
  if ([(NUPipelineOutputNode *)self enforceEvenDimensions])
  {
    id v7 = [[_NUVideoProperties alloc] initWithProperties:v6];
    unint64_t v8 = [(_NUVideoProperties *)v7 size];
    unint64_t v10 = NUEvenPixelSize(v8, v9);
    -[_NUVideoProperties setSize:](v7, "setSize:", v10, v11);
    unint64_t v12 = [(_NUVideoProperties *)v7 originalSize];
    unint64_t v14 = NUEvenPixelSize(v12, v13);
    -[_NUVideoProperties setOriginalSize:](v7, "setOriginalSize:", v14, v15);
    if (v7)
    {
      [(_NUVideoProperties *)v7 cleanAperture];
      uint64_t v17 = *((void *)&v28 + 1);
      unint64_t v16 = v28;
    }
    else
    {
      uint64_t v17 = 0;
      unint64_t v16 = 0;
      long long v27 = 0u;
      long long v28 = 0u;
    }
    *(void *)&long long v28 = NUEvenPixelSize(v16, v17);
    *((void *)&v28 + 1) = v18;
    v26[0] = v27;
    v26[1] = v28;
    [(_NUVideoProperties *)v7 setCleanAperture:v26];
    if (v7)
    {
      [(_NUVideoProperties *)v7 originalCleanAperture];
      uint64_t v20 = *((void *)&v25 + 1);
      unint64_t v19 = v25;
    }
    else
    {
      uint64_t v20 = 0;
      unint64_t v19 = 0;
      long long v24 = 0u;
      long long v25 = 0u;
    }
    *(void *)&long long v25 = NUEvenPixelSize(v19, v20);
    *((void *)&v25 + 1) = v21;
    v23[0] = v24;
    v23[1] = v25;
    [(_NUVideoProperties *)v7 setOriginalCleanAperture:v23];
  }
  else
  {
    id v7 = v6;
  }

  return v7;
}

- (id)extentPolicy
{
  v2 = [(NURenderNode *)self settings];
  v3 = [v2 objectForKeyedSubscript:@"extentPolicy"];

  return v3;
}

- (BOOL)enforceEvenDimensions
{
  v2 = [(NURenderNode *)self settings];
  v3 = [v2 objectForKeyedSubscript:@"enforceEvenDimensions"];

  if (v3) {
    char v4 = [v3 BOOLValue];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (BOOL)renderTransparencyOpaque
{
  v2 = [(NURenderNode *)self settings];
  v3 = [v2 objectForKeyedSubscript:@"renderTransparencyOpaque"];

  if (v3) {
    char v4 = [v3 BOOLValue];
  }
  else {
    char v4 = +[NUGlobalSettings renderTransparencyOpaque];
  }
  BOOL v5 = v4;

  return v5;
}

- (int64_t)imageGeometryRoundingPolicy
{
  if ([(NUPipelineOutputNode *)self enforceEvenDimensions]) {
    return 4;
  }
  else {
    return 0;
  }
}

- (id)_evaluateImageGeometry:(id *)a3
{
  return [(NUPipelineOutputNode *)self _evaluateImageGeometryWithZeroedOrigin:1 error:a3];
}

- (id)_evaluateImageGeometryWithZeroedOrigin:(BOOL)a3 error:(id *)a4
{
  BOOL v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)NUPipelineOutputNode;
  uint64_t v6 = [(NURenderNode *)&v23 _evaluateImageGeometry:a4];
  id v7 = v6;
  if (v6)
  {
    long long v21 = 0u;
    long long v22 = 0u;
    [v6 extent];
    unint64_t v8 = [(NUPipelineOutputNode *)self extentPolicy];
    uint64_t v9 = v8;
    if (v8)
    {
      v18[0] = v21;
      v18[1] = v22;
      [v8 extentForImageExtent:v18];
      long long v21 = v19;
      long long v22 = v20;
    }
    if (v4) {
      long long v21 = 0uLL;
    }
    int64_t v10 = [(NUPipelineOutputNode *)self imageGeometryRoundingPolicy];
    uint64_t v11 = [NUImageGeometry alloc];
    uint64_t v12 = [v7 renderScale];
    uint64_t v14 = v13;
    uint64_t v15 = [v7 orientation];
    long long v19 = v21;
    long long v20 = v22;
    unint64_t v16 = -[NUImageGeometry initWithExtent:renderScale:orientation:spaceMap:roundingPolicy:](v11, "initWithExtent:renderScale:orientation:spaceMap:roundingPolicy:", &v19, v12, v14, v15, 0, v10);
  }
  else
  {
    unint64_t v16 = 0;
  }

  return v16;
}

- (id)resolvedNodeWithCachedInputs:(id)a3 settings:(id)a4 pipelineState:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if ([v12 enforceEvenDimensions])
  {
    uint64_t v13 = [v11 objectForKeyedSubscript:@"enforceEvenDimensions"];

    if (!v13)
    {
      uint64_t v14 = (void *)[v11 mutableCopy];
      [v14 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"enforceEvenDimensions"];
      uint64_t v15 = [v14 copy];

      id v11 = (id)v15;
    }
  }
  v18.receiver = self;
  v18.super_class = (Class)NUPipelineOutputNode;
  unint64_t v16 = [(NURenderNode *)&v18 resolvedNodeWithCachedInputs:v10 settings:v11 pipelineState:v12 error:a6];

  return v16;
}

- (BOOL)shouldCacheNodeForPipelineState:(id)a3
{
  unint64_t v3 = [a3 evaluationMode];
  return (v3 < 4) & (0xBu >> (v3 & 0xF));
}

- (NUPipelineOutputNode)initWithInput:(id)a3 settings:(id)a4
{
  v14[1] = *MEMORY[0x1E4F143B8];
  uint64_t v13 = *MEMORY[0x1E4F1E480];
  v14[0] = a3;
  uint64_t v6 = (void *)MEMORY[0x1E4F1C9E8];
  id v7 = a4;
  id v8 = a3;
  uint64_t v9 = [v6 dictionaryWithObjects:v14 forKeys:&v13 count:1];
  v12.receiver = self;
  v12.super_class = (Class)NUPipelineOutputNode;
  id v10 = [(NURenderNode *)&v12 initWithSettings:v7 inputs:v9];

  return v10;
}

- (NUPipelineOutputNode)initWithInput:(id)a3
{
  return [(NUPipelineOutputNode *)self initWithInput:a3 settings:MEMORY[0x1E4F1CC08]];
}

@end