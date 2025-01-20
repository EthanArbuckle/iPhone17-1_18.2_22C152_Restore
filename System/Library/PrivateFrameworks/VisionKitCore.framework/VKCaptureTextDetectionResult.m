@interface VKCaptureTextDetectionResult
- (CGRect)_imageBounds;
- (CGRect)boundingBox;
- (NSArray)blockQuads;
- (NSArray)lineQuads;
- (NSArray)normalizedLineQuads;
- (VKCaptureTextDetectionResult)initWithBlock:(id)a3 imageSize:(CGSize)a4;
- (VKCaptureTextDetectionResult)initWithBlocks:(id)a3 imageSize:(CGSize)a4;
- (VKQuad)boundingQuad;
- (double)baselineAngle;
- (id)boundingPathWithPadding:(double)a3 cornerRadius:(double)a4;
- (id)groupedPath;
- (id)groupedPathForLinesWithPadding:(double)a3 cornerRadius:(double)a4;
@end

@implementation VKCaptureTextDetectionResult

- (VKCaptureTextDetectionResult)initWithBlock:(id)a3 imageSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  v7 = (void *)MEMORY[0x1E4F1C978];
  id v8 = a3;
  v9 = [v7 arrayWithObjects:&v12 count:1];

  v10 = -[VKCaptureTextDetectionResult initWithBlocks:imageSize:](self, "initWithBlocks:imageSize:", v9, width, height, v12, v13);
  return v10;
}

- (VKCaptureTextDetectionResult)initWithBlocks:(id)a3 imageSize:(CGSize)a4
{
  id v5 = a3;
  v33.receiver = self;
  v33.super_class = (Class)VKCaptureTextDetectionResult;
  v6 = [(VKCaptureTextDetectionResult *)&v33 init];
  if (v6)
  {
    v6->__imageBounds.origin.x = VKMRectWithSize();
    v6->__imageBounds.origin.y = v7;
    v6->__imageBounds.size.double width = v8;
    v6->__imageBounds.size.double height = v9;
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __57__VKCaptureTextDetectionResult_initWithBlocks_imageSize___block_invoke;
    v31[3] = &unk_1E6BF0FA8;
    v10 = v6;
    v32 = v10;
    uint64_t v11 = objc_msgSend(v5, "vk_compactMap:", v31);
    blockQuads = v10->_blockQuads;
    v10->_blockQuads = (NSArray *)v11;

    uint64_t v13 = objc_msgSend(v5, "vk_flatMap:", &__block_literal_global_0);
    uint64_t v14 = objc_msgSend(v13, "vk_compactMap:", &__block_literal_global_39);
    normalizedLineQuads = v10->_normalizedLineQuads;
    v10->_normalizedLineQuads = (NSArray *)v14;

    v16 = v10->_normalizedLineQuads;
    uint64_t v26 = MEMORY[0x1E4F143A8];
    uint64_t v27 = 3221225472;
    v28 = __57__VKCaptureTextDetectionResult_initWithBlocks_imageSize___block_invoke_4;
    v29 = &unk_1E6BF1010;
    v17 = v10;
    v30 = v17;
    uint64_t v18 = [(NSArray *)v16 vk_compactMap:&v26];
    lineQuads = v17->_lineQuads;
    v17->_lineQuads = (NSArray *)v18;

    v21 = VKVNBaselineAngles(v13, v20);
    double v22 = VKVNGlobalBaselineAngleFromAngles(v21);
    uint64_t v23 = +[VKQuad quadFromUnionOfQuads:baselineAngle:](VKQuad, "quadFromUnionOfQuads:baselineAngle:", v17->_lineQuads, v26, v27, v28, v29);
    boundingQuad = v17->_boundingQuad;
    v17->_boundingQuad = (VKQuad *)v23;

    v17->_baselineAngle = v22;
  }

  return v6;
}

VKQuad *__57__VKCaptureTextDetectionResult_initWithBlocks_imageSize___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 bottomLeft];
  VKMFlipPoint();
  double v6 = VKMPointFromNormalizedRect(v4, v5, *(double *)(*(void *)(a1 + 32) + 48), *(double *)(*(void *)(a1 + 32) + 56), *(double *)(*(void *)(a1 + 32) + 64));
  double v25 = v7;
  double v26 = v6;
  [v3 bottomRight];
  VKMFlipPoint();
  double v10 = VKMPointFromNormalizedRect(v8, v9, *(double *)(*(void *)(a1 + 32) + 48), *(double *)(*(void *)(a1 + 32) + 56), *(double *)(*(void *)(a1 + 32) + 64));
  double v23 = v11;
  double v24 = v10;
  [v3 topLeft];
  VKMFlipPoint();
  double v14 = VKMPointFromNormalizedRect(v12, v13, *(double *)(*(void *)(a1 + 32) + 48), *(double *)(*(void *)(a1 + 32) + 56), *(double *)(*(void *)(a1 + 32) + 64));
  double v16 = v15;
  [v3 topRight];

  VKMFlipPoint();
  double v19 = VKMPointFromNormalizedRect(v17, v18, *(double *)(*(void *)(a1 + 32) + 48), *(double *)(*(void *)(a1 + 32) + 56), *(double *)(*(void *)(a1 + 32) + 64));
  v21 = -[VKQuad initWithBottomLeft:bottomRight:topLeft:topRight:]([VKQuad alloc], "initWithBottomLeft:bottomRight:topLeft:topRight:", v26, v25, v24, v23, v14, v16, v19, v20);
  return v21;
}

uint64_t __57__VKCaptureTextDetectionResult_initWithBlocks_imageSize___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 getLines];
}

VKQuad *__57__VKCaptureTextDetectionResult_initWithBlocks_imageSize___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 bottomLeft];
  VKMFlipPoint();
  double v17 = v4;
  double v18 = v3;
  [v2 bottomRight];
  VKMFlipPoint();
  double v15 = v6;
  double v16 = v5;
  [v2 topLeft];
  VKMFlipPoint();
  double v8 = v7;
  double v10 = v9;
  [v2 topRight];

  VKMFlipPoint();
  double v13 = -[VKQuad initWithBottomLeft:bottomRight:topLeft:topRight:]([VKQuad alloc], "initWithBottomLeft:bottomRight:topLeft:topRight:", v18, v17, v16, v15, v8, v10, v11, v12);
  return v13;
}

VKQuad *__57__VKCaptureTextDetectionResult_initWithBlocks_imageSize___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 bottomLeft];
  double v6 = VKMPointFromNormalizedRect(v4, v5, *(double *)(*(void *)(a1 + 32) + 48), *(double *)(*(void *)(a1 + 32) + 56), *(double *)(*(void *)(a1 + 32) + 64));
  double v8 = v7;
  [v3 bottomRight];
  double v11 = VKMPointFromNormalizedRect(v9, v10, *(double *)(*(void *)(a1 + 32) + 48), *(double *)(*(void *)(a1 + 32) + 56), *(double *)(*(void *)(a1 + 32) + 64));
  double v13 = v12;
  [v3 topLeft];
  double v16 = VKMPointFromNormalizedRect(v14, v15, *(double *)(*(void *)(a1 + 32) + 48), *(double *)(*(void *)(a1 + 32) + 56), *(double *)(*(void *)(a1 + 32) + 64));
  double v18 = v17;
  [v3 topRight];
  double v20 = v19;
  double v22 = v21;

  double v23 = VKMPointFromNormalizedRect(v20, v22, *(double *)(*(void *)(a1 + 32) + 48), *(double *)(*(void *)(a1 + 32) + 56), *(double *)(*(void *)(a1 + 32) + 64));
  double v25 = -[VKQuad initWithBottomLeft:bottomRight:topLeft:topRight:]([VKQuad alloc], "initWithBottomLeft:bottomRight:topLeft:topRight:", v6, v8, v11, v13, v16, v18, v23, v24);
  return v25;
}

- (CGRect)boundingBox
{
  id v2 = [(VKCaptureTextDetectionResult *)self boundingQuad];
  [v2 boundingBox];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.double height = v14;
  result.size.double width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (id)groupedPath
{
  [(VKCaptureTextDetectionResult *)self _imageBounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  double v7 = VKMAspectRatio(v3, v5);
  double v8 = (void *)MEMORY[0x1E4F427D0];
  double v9 = [(VKCaptureTextDetectionResult *)self normalizedLineQuads];
  double v10 = objc_msgSend(v8, "vk_roundAndGroupNormalizedQuadsForHighlight:aspectRatio:expansionScale:radiusToAvgHeightRatio:", v9, v7, 0.3, 0.35);

  CGAffineTransformMakeScale(&v12, v4, v6);
  [v10 applyTransform:&v12];
  return v10;
}

- (id)boundingPathWithPadding:(double)a3 cornerRadius:(double)a4
{
  double v7 = [(VKCaptureTextDetectionResult *)self boundingQuad];
  double v8 = [v7 path];

  double v9 = objc_msgSend(v8, "vk_expandWithOffset:", a3);
  double v10 = (void *)MEMORY[0x1E4F427D0];
  [(VKCaptureTextDetectionResult *)self _imageBounds];
  double v11 = objc_msgSend(v10, "bezierPathWithRect:");
  CGAffineTransform v12 = objc_msgSend(v9, "vk_intersectAndFlattenWithPath:", v11);
  double v13 = (void *)MEMORY[0x1E4F427D0];
  double v14 = objc_msgSend(v12, "vk_allPoints");
  double v15 = (const CGPath *)objc_msgSend(v13, "vk_newRoundedPathWithRadius:points:", v14, a4);

  double v16 = [MEMORY[0x1E4F427D0] bezierPathWithCGPath:v15];
  CGPathRelease(v15);

  return v16;
}

- (id)groupedPathForLinesWithPadding:(double)a3 cornerRadius:(double)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  [(VKCaptureTextDetectionResult *)self _imageBounds];
  CGFloat x = v40.origin.x;
  CGFloat y = v40.origin.y;
  CGFloat width = v40.size.width;
  CGFloat height = v40.size.height;
  CGFloat MinX = CGRectGetMinX(v40);
  v41.origin.CGFloat x = x;
  v41.origin.CGFloat y = y;
  v41.size.CGFloat width = width;
  v41.size.CGFloat height = height;
  CGFloat MaxX = CGRectGetMaxX(v41);
  v42.origin.CGFloat x = x;
  v42.origin.CGFloat y = y;
  v42.size.CGFloat width = width;
  v42.size.CGFloat height = height;
  CGFloat MinY = CGRectGetMinY(v42);
  v43.origin.CGFloat x = x;
  v43.origin.CGFloat y = y;
  v43.size.CGFloat width = width;
  v43.size.CGFloat height = height;
  CGFloat MaxY = CGRectGetMaxY(v43);
  double v14 = [(VKCaptureTextDetectionResult *)self lineQuads];
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __76__VKCaptureTextDetectionResult_groupedPathForLinesWithPadding_cornerRadius___block_invoke;
  v36[3] = &__block_descriptor_72_e22__32__0__VKQuad_8q16q24l;
  *(CGFloat *)&v36[4] = MinX;
  *(double *)&v36[5] = a3;
  *(CGFloat *)&v36[6] = MinY;
  *(CGFloat *)&v36[7] = MaxX;
  *(CGFloat *)&v36[8] = MaxY;
  double v15 = objc_msgSend(v14, "vk_compactMap:", v36);

  double v16 = [MEMORY[0x1E4F427D0] bezierPath];
  [v16 setUsesEvenOddFillRule:0];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id obj = v15;
  uint64_t v17 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v33 != v19) {
          objc_enumerationMutation(obj);
        }
        double v21 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        double v22 = [MEMORY[0x1E4F1CA48] array];
        double v23 = (const CGPath *)[v21 CGPath];
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __76__VKCaptureTextDetectionResult_groupedPathForLinesWithPadding_cornerRadius___block_invoke_2;
        block[3] = &unk_1E6BF1058;
        id v31 = v22;
        id v24 = v22;
        CGPathApplyWithBlock(v23, block);
        double v25 = (const CGPath *)objc_msgSend(MEMORY[0x1E4F427D0], "vk_newRoundedPathWithRadius:points:", v24, a4);
        double v26 = [MEMORY[0x1E4F427D0] bezierPathWithCGPath:v25];
        [v16 appendPath:v26];

        CGPathRelease(v25);
      }
      uint64_t v18 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
    }
    while (v18);
  }

  return v16;
}

id __76__VKCaptureTextDetectionResult_groupedPathForLinesWithPadding_cornerRadius___block_invoke(double *a1, void *a2)
{
  id v3 = a2;
  [v3 bottomLeft];
  double v5 = v4;
  double v7 = v6;
  [v3 bottomRight];
  double v9 = v8;
  double v11 = v10;
  [v3 topLeft];
  double v13 = v12;
  double v15 = v14;
  [v3 topRight];
  double v17 = v16;
  double v19 = v18;

  double v20 = a1[4];
  double v21 = a1[5];
  if (v20 >= v13 - v21) {
    double v22 = a1[4];
  }
  else {
    double v22 = v13 - v21;
  }
  double v23 = a1[6];
  double v24 = a1[7];
  if (v23 >= v15 - v21) {
    double v25 = a1[6];
  }
  else {
    double v25 = v15 - v21;
  }
  if (v24 >= v17 + v21) {
    double v26 = v17 + v21;
  }
  else {
    double v26 = a1[7];
  }
  if (v23 >= v19 - v21) {
    double v27 = a1[6];
  }
  else {
    double v27 = v19 - v21;
  }
  if (v20 >= v5 - v21) {
    double v28 = a1[4];
  }
  else {
    double v28 = v5 - v21;
  }
  double v29 = a1[8];
  if (v29 >= v7 + v21) {
    double v30 = v7 + v21;
  }
  else {
    double v30 = a1[8];
  }
  if (v24 >= v9 + v21) {
    double v31 = v9 + v21;
  }
  else {
    double v31 = a1[7];
  }
  double v32 = v11 + v21;
  if (v29 >= v32) {
    double v33 = v32;
  }
  else {
    double v33 = a1[8];
  }
  long long v34 = [MEMORY[0x1E4F427D0] bezierPath];
  objc_msgSend(v34, "moveToPoint:", v22, v25);
  objc_msgSend(v34, "addLineToPoint:", v26, v27);
  objc_msgSend(v34, "addLineToPoint:", v31, v33);
  objc_msgSend(v34, "addLineToPoint:", v28, v30);
  [v34 closePath];
  return v34;
}

void __76__VKCaptureTextDetectionResult_groupedPathForLinesWithPadding_cornerRadius___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if ([*(id *)(a1 + 32) count] != 4)
  {
    double v4 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", **(double **)(a2 + 8), *(double *)(*(void *)(a2 + 8) + 8));
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    [v4 addObject:v5];
  }
}

- (VKQuad)boundingQuad
{
  return self->_boundingQuad;
}

- (NSArray)lineQuads
{
  return self->_lineQuads;
}

- (NSArray)blockQuads
{
  return self->_blockQuads;
}

- (NSArray)normalizedLineQuads
{
  return self->_normalizedLineQuads;
}

- (double)baselineAngle
{
  return self->_baselineAngle;
}

- (CGRect)_imageBounds
{
  double x = self->__imageBounds.origin.x;
  double y = self->__imageBounds.origin.y;
  double width = self->__imageBounds.size.width;
  double height = self->__imageBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_normalizedLineQuads, 0);
  objc_storeStrong((id *)&self->_blockQuads, 0);
  objc_storeStrong((id *)&self->_lineQuads, 0);
  objc_storeStrong((id *)&self->_boundingQuad, 0);
}

@end