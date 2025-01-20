@interface PIRetouchSubsampleCacheNode
- (id)_modifyEvaluatedGeometry:(id)a3;
- (id)nodeByReplayingAgainstCache:(id)a3 pipelineState:(id)a4 error:(id *)a5;
- (id)retouchInputNode;
- (int64_t)padding;
- (int64_t)subsampleFactorForScale:(id)a3;
- (void)_updateInputRegion:(id)a3 outputRegion:(id)a4 forStroke:(id)a5 geometry:(id)a6;
- (void)resolveWithInputImage:(id)a3 retouchStrokes:(id)a4 cacheKey:(id)a5;
@end

@implementation PIRetouchSubsampleCacheNode

- (void)resolveWithInputImage:(id)a3 retouchStrokes:(id)a4 cacheKey:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [PIRetouchSubsampleSourceNode alloc];
  v12 = [(NURenderNode *)self settings];
  v13 = [v12 objectForKeyedSubscript:@"detectedFaces"];
  v14 = [(PIRetouchSourceNode *)v11 initWithInputImage:v10 retouchStrokes:v9 detectedFaces:v13 cacheKey:v8];

  [(NUCacheNode *)self resolveWithSourceNode:v14 error:0];
}

- (void)_updateInputRegion:(id)a3 outputRegion:(id)a4 forStroke:(id)a5 geometry:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  id v12 = a4;
  id v22 = a3;
  v13 = [v10 objectForKeyedSubscript:@"sourceOffset"];
  v14 = [v13 objectForKeyedSubscript:@"x"];
  v15 = [v13 objectForKeyedSubscript:@"y"];
  [v14 doubleValue];
  [v15 doubleValue];
  long long v41 = 0u;
  long long v42 = 0u;
  if (v11) {
    [v11 extent];
  }
  v16 = +[PIRepairUtilities brushStrokeFromRetouchStrokeDictionary:v10];
  v17 = v16;
  long long v39 = 0u;
  long long v40 = 0u;
  if (v16)
  {
    [v16 extent];
  }
  else
  {
    long long v37 = 0uLL;
    long long v38 = 0uLL;
  }
  NUPixelRectIntersection();
  long long v35 = 0u;
  long long v36 = 0u;
  memset(v34, 0, sizeof(v34));
  memset(v33, 0, sizeof(v33));
  [v17 radius];
  double v19 = v18;
  uint64_t v20 = NUPixelPointFromCGPoint();
  long long v31 = v41;
  long long v32 = v42;
  long long v29 = v39;
  long long v30 = v40;
  +[PIRepairUtilities calcExtentsForStrokeRadius:offset:inputImageExtent:maskExtent:repairExtent:textureExtent:sourceExtent:](PIRepairUtilities, "calcExtentsForStrokeRadius:offset:inputImageExtent:maskExtent:repairExtent:textureExtent:sourceExtent:", v20, v21, &v31, &v29, &v35, v34, v19, v33);
  long long v29 = v35;
  long long v30 = v36;
  NUPixelRectFlipYOrigin();
  long long v35 = v31;
  long long v36 = v32;
  [(NUCacheNode *)self subsampleFactor];
  [(PIRetouchSubsampleCacheNode *)self padding];
  long long v29 = v35;
  long long v30 = v36;
  NUPixelRectDilate();
  long long v35 = v31;
  long long v36 = v32;
  NUScaleMake();
  [v11 scaledSize];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = v35;
  long long v30 = v36;
  NUPixelRectScaleRational();
  long long v29 = 0u;
  long long v30 = 0u;
  NUAlignPixelRectToPixelGrid();
  long long v27 = v29;
  long long v28 = v30;
  NUPixelRectIntersection();
  [v12 addRect:v26];

  long long v27 = 0u;
  long long v28 = 0u;
  NUAlignPixelRectToPixelGrid();
  long long v24 = v27;
  long long v25 = v28;
  NUPixelRectIntersection();
  [v22 addRect:v23];
}

- (int64_t)padding
{
  return 5;
}

- (int64_t)subsampleFactorForScale:(id)a3
{
  v4[0] = 0;
  v4[1] = 0;
  return objc_msgSend(MEMORY[0x1E4F7A6C0], "subsampleFactorForScale:additionalScale:", a3.var0, a3.var1, v4);
}

- (id)nodeByReplayingAgainstCache:(id)a3 pipelineState:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if ([v9 evaluationMode] == 1
    && (v17[0] = 0,
        v17[1] = 0,
        id v10 = (void *)MEMORY[0x1E4F7A6C0],
        uint64_t v11 = [v9 scale],
        objc_msgSend(v10, "subsampleFactorForScale:additionalScale:", v11, v12, v17) == 1))
  {
    v13 = [(NUCacheNode *)self inputNode];
    v14 = [v13 nodeByReplayingAgainstCache:v8 pipelineState:v9 error:a5];
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)PIRetouchSubsampleCacheNode;
    v14 = [(PIRetouchCacheNode *)&v16 nodeByReplayingAgainstCache:v8 pipelineState:v9 error:a5];
  }

  return v14;
}

- (id)retouchInputNode
{
  for (i = [(NUCacheNode *)self inputNode];
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        break;
      }
    }
    uint64_t v3 = [i inputNode];
  }
  return i;
}

- (id)_modifyEvaluatedGeometry:(id)a3
{
  return a3;
}

@end