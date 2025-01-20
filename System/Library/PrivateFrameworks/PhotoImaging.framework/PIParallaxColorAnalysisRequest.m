@interface PIParallaxColorAnalysisRequest
- (BOOL)analyzeBackground;
- (CGRect)normalizedClipRect;
- (NUImageBuffer)segmentationMatte;
- (PIParallaxColorAnalysisRequest)initWithComposition:(id)a3;
- (double)chromaThreshold;
- (double)dominanceThreshold;
- (id)copyWithZone:(_NSZone *)a3;
- (id)newRenderJob;
- (int64_t)maxDominantColors;
- (int64_t)mediaComponentType;
- (void)setAnalyzeBackground:(BOOL)a3;
- (void)setChromaThreshold:(double)a3;
- (void)setDominanceThreshold:(double)a3;
- (void)setMaxDominantColors:(int64_t)a3;
- (void)setNormalizedClipRect:(CGRect)a3;
- (void)setSegmentationMatte:(id)a3;
@end

@implementation PIParallaxColorAnalysisRequest

- (void).cxx_destruct
{
}

- (void)setChromaThreshold:(double)a3
{
  self->_chromaThreshold = a3;
}

- (double)chromaThreshold
{
  return self->_chromaThreshold;
}

- (void)setDominanceThreshold:(double)a3
{
  self->_dominanceThreshold = a3;
}

- (double)dominanceThreshold
{
  return self->_dominanceThreshold;
}

- (void)setMaxDominantColors:(int64_t)a3
{
  self->_maxDominantColors = a3;
}

- (int64_t)maxDominantColors
{
  return self->_maxDominantColors;
}

- (void)setNormalizedClipRect:(CGRect)a3
{
  self->_normalizedClipRect = a3;
}

- (CGRect)normalizedClipRect
{
  double x = self->_normalizedClipRect.origin.x;
  double y = self->_normalizedClipRect.origin.y;
  double width = self->_normalizedClipRect.size.width;
  double height = self->_normalizedClipRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setAnalyzeBackground:(BOOL)a3
{
  self->_analyzeBackground = a3;
}

- (BOOL)analyzeBackground
{
  return self->_analyzeBackground;
}

- (void)setSegmentationMatte:(id)a3
{
}

- (NUImageBuffer)segmentationMatte
{
  return self->_segmentationMatte;
}

- (int64_t)mediaComponentType
{
  return 1;
}

- (id)newRenderJob
{
  v3 = [_PIParallaxColorAnalysisJob alloc];
  return [(_PIParallaxColorAnalysisJob *)v3 initWithParallaxColorAnalysisRequest:self];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v14.receiver = self;
  v14.super_class = (Class)PIParallaxColorAnalysisRequest;
  v4 = [(NURenderRequest *)&v14 copyWithZone:a3];
  if (v4)
  {
    uint64_t v5 = [(PIParallaxColorAnalysisRequest *)self segmentationMatte];
    v6 = (void *)v4[20];
    v4[20] = v5;

    *((unsigned char *)v4 + 152) = [(PIParallaxColorAnalysisRequest *)self analyzeBackground];
    [(PIParallaxColorAnalysisRequest *)self normalizedClipRect];
    v4[24] = v7;
    v4[25] = v8;
    v4[26] = v9;
    v4[27] = v10;
    v4[21] = [(PIParallaxColorAnalysisRequest *)self maxDominantColors];
    [(PIParallaxColorAnalysisRequest *)self dominanceThreshold];
    v4[22] = v11;
    [(PIParallaxColorAnalysisRequest *)self chromaThreshold];
    v4[23] = v12;
  }
  return v4;
}

- (PIParallaxColorAnalysisRequest)initWithComposition:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PIParallaxColorAnalysisRequest;
  v3 = [(NURenderRequest *)&v5 initWithComposition:a3];
  [(PIParallaxColorAnalysisRequest *)v3 setMaxDominantColors:3];
  [(PIParallaxColorAnalysisRequest *)v3 setDominanceThreshold:0.01];
  [(PIParallaxColorAnalysisRequest *)v3 setChromaThreshold:0.0375000015];
  return v3;
}

@end