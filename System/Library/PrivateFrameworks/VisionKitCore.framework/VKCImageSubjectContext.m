@interface VKCImageSubjectContext
- (BOOL)allSubjectsSelected;
- (BOOL)containsSubjectAtNormalizedPoint:(CGPoint)a3;
- (BOOL)subjectIndexes:(id)a3 equivalentToIndexes:(id)a4;
- (CGRect)normalizedCropRect;
- (CGSize)imageSize;
- (NSArray)subjectInstances;
- (NSArray)subjectPaths;
- (NSIndexSet)activeMADSubjectIndexes;
- (NSIndexSet)activeSubjectIndexes;
- (NSIndexSet)allSubjectIndexes;
- (NSNumber)animatedStickerScore;
- (VKCImageSubjectContext)initWithMaskResult:(id)a3;
- (VKCImageSubjectContextInstance)allSubjectsInstance;
- (VKCRemoveBackgroundRequest)request;
- (VKCRemoveBackgroundResult)maskResult;
- (id)convertExternalIndexSetToInternal:(id)a3;
- (id)convertIndexSetToConcreteSubjectIndexes:(id)a3;
- (id)indexOfSubjectAtNormalizedPoint:(CGPoint)a3;
- (id)madSubjectIndexesForVKSubjectIndexes:(id)a3;
- (id)normalizedPathForActiveSubjectsWithContentsRect:(CGRect)a3 topLevelOnly:(BOOL)a4;
- (id)normalizedPathForSubjectAtIndex:(id)a3 contentsRect:(CGRect)a4 topLevelOnly:(BOOL)a5;
- (id)normalizedPathForSubjectWithIndexSet:(id)a3 contentsRect:(CGRect)a4 topLevelOnly:(BOOL)a5;
- (int64_t)imageOrientation;
- (unint64_t)subjectCount;
- (void)prepareInstanceImagesWithCIContext:(id)a3 instance:(id)a4 image:(CGImage *)a5;
- (void)preparePathsAndImageMaskIfNecessaryWithContext:(id)a3;
- (void)processPathForInstance:(id)a3;
- (void)setActiveMADSubjectIndexes:(id)a3;
- (void)setActiveSubjectIndexes:(id)a3;
- (void)setAllSubjectsInstance:(id)a3;
- (void)setMaskResult:(id)a3;
- (void)setSubjectCount:(unint64_t)a3;
- (void)setSubjectInstances:(id)a3;
- (void)setSubjectPaths:(id)a3;
@end

@implementation VKCImageSubjectContext

- (VKCImageSubjectContext)initWithMaskResult:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VKCImageSubjectContext;
  v6 = [(VKCImageSubjectContext *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_maskResult, a3);
  }

  return v7;
}

- (unint64_t)subjectCount
{
  v2 = [(VKCImageSubjectContext *)self subjectInstances];
  unint64_t v3 = [v2 count];

  return v3;
}

- (NSNumber)animatedStickerScore
{
  v2 = [(VKCImageSubjectContext *)self maskResult];
  unint64_t v3 = [v2 animatedStickerScore];

  return (NSNumber *)v3;
}

- (BOOL)allSubjectsSelected
{
  unint64_t v3 = [(VKCImageSubjectContext *)self activeSubjectIndexes];
  if ([v3 count])
  {
  }
  else
  {
    unint64_t v7 = [(VKCImageSubjectContext *)self subjectCount];

    if (v7) {
      return 1;
    }
  }
  v4 = [(VKCImageSubjectContext *)self activeSubjectIndexes];
  uint64_t v5 = [v4 count];
  BOOL v6 = v5 == [(VKCImageSubjectContext *)self subjectCount];

  return v6;
}

- (CGSize)imageSize
{
  v2 = [(VKCImageSubjectContext *)self allSubjectsInstance];
  [v2 imageSize];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (int64_t)imageOrientation
{
  v2 = [(VKCImageSubjectContext *)self maskResult];
  int64_t v3 = [v2 imageOrientation];

  return v3;
}

- (VKCRemoveBackgroundRequest)request
{
  v2 = [(VKCImageSubjectContext *)self maskResult];
  int64_t v3 = [v2 request];

  return (VKCRemoveBackgroundRequest *)v3;
}

- (CGRect)normalizedCropRect
{
  v2 = [(VKCImageSubjectContext *)self maskResult];
  [v2 normalizedCropRect];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (void)setActiveSubjectIndexes:(id)a3
{
}

- (NSIndexSet)activeMADSubjectIndexes
{
  double v3 = [(VKCImageSubjectContext *)self activeSubjectIndexes];
  double v4 = [(VKCImageSubjectContext *)self madSubjectIndexesForVKSubjectIndexes:v3];

  return (NSIndexSet *)v4;
}

- (id)madSubjectIndexesForVKSubjectIndexes:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  double v6 = [(VKCImageSubjectContext *)self subjectInstances];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __63__VKCImageSubjectContext_madSubjectIndexesForVKSubjectIndexes___block_invoke;
  v12[3] = &unk_1E6BF1080;
  id v13 = v4;
  id v7 = v5;
  id v14 = v7;
  id v8 = v4;
  [v6 enumerateObjectsUsingBlock:v12];

  double v9 = v14;
  id v10 = v7;

  return v10;
}

void __63__VKCImageSubjectContext_madSubjectIndexesForVKSubjectIndexes___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if ([*(id *)(a1 + 32) containsIndex:a3]) {
    objc_msgSend(*(id *)(a1 + 40), "addIndex:", objc_msgSend(v5, "madIndex"));
  }
}

- (NSIndexSet)allSubjectIndexes
{
  v2 = (void *)MEMORY[0x1E4F28D60];
  unint64_t v3 = [(VKCImageSubjectContext *)self subjectCount];
  return (NSIndexSet *)objc_msgSend(v2, "indexSetWithIndexesInRange:", 0, v3);
}

- (void)preparePathsAndImageMaskIfNecessaryWithContext:(id)a3
{
  id v4 = a3;
  id v5 = [(VKCImageSubjectContext *)self maskResult];
  double v6 = [v5 instanceMasks];

  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __73__VKCImageSubjectContext_preparePathsAndImageMaskIfNecessaryWithContext___block_invoke;
  v20[3] = &unk_1E6BF10A8;
  v20[4] = self;
  id v21 = v4;
  id v7 = v4;
  id v8 = objc_msgSend(v6, "vk_compactMap:", v20);
  [(VKCImageSubjectContext *)self setSubjectInstances:v8];
  double v9 = objc_alloc_init(VKCImageSubjectContextInstance);
  id v10 = objc_alloc_init(MEMORY[0x1E4F427D0]);
  id v11 = objc_alloc_init(MEMORY[0x1E4F427D0]);
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  v16 = __73__VKCImageSubjectContext_preparePathsAndImageMaskIfNecessaryWithContext___block_invoke_2;
  v17 = &unk_1E6BF1080;
  id v18 = v10;
  id v19 = v11;
  id v12 = v11;
  id v13 = v10;
  [v8 enumerateObjectsUsingBlock:&v14];
  -[VKCImageSubjectContextInstance setBaseTopLevelNormalizedSubjectPath:](v9, "setBaseTopLevelNormalizedSubjectPath:", v13, v14, v15, v16, v17);
  [(VKCImageSubjectContextInstance *)v9 setBaseNormalizedSubjectPath:v12];
  [(VKCImageSubjectContext *)self imageSize];
  -[VKCImageSubjectContextInstance setImageSize:](v9, "setImageSize:");
  [(VKCImageSubjectContext *)self setAllSubjectsInstance:v9];
}

VKCImageSubjectContextInstance *__73__VKCImageSubjectContext_preparePathsAndImageMaskIfNecessaryWithContext___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  double v6 = objc_alloc_init(VKCImageSubjectContextInstance);
  [(VKCImageSubjectContextInstance *)v6 setMadIndex:a3 + 1];
  [*(id *)(a1 + 32) prepareInstanceImagesWithCIContext:*(void *)(a1 + 40) instance:v6 image:v5];

  [*(id *)(a1 + 32) processPathForInstance:v6];
  id v7 = [(VKCImageSubjectContextInstance *)v6 baseNormalizedSubjectPath];
  if (v7) {
    id v8 = v6;
  }
  else {
    id v8 = 0;
  }
  double v9 = v8;

  return v9;
}

void __73__VKCImageSubjectContext_preparePathsAndImageMaskIfNecessaryWithContext___block_invoke_2(uint64_t a1, void *a2)
{
  unint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v4 baseTopLevelNormalizedSubjectPath];
  objc_msgSend(v3, "vk_appendBezierPath:", v5);

  double v6 = *(void **)(a1 + 40);
  id v7 = [v4 baseNormalizedSubjectPath];

  objc_msgSend(v6, "vk_appendBezierPath:", v7);
}

- (void)prepareInstanceImagesWithCIContext:(id)a3 instance:(id)a4 image:(CGImage *)a5
{
  id v13 = a3;
  id v8 = a4;
  double Width = (double)CGImageGetWidth(a5);
  objc_msgSend(v8, "setImageSize:", Width, (double)CGImageGetHeight(a5));
  [v8 setMaskImage:a5];
  if ([(VKCImageSubjectContext *)self imageOrientation])
  {
    id v10 = [MEMORY[0x1E4F1E050] imageWithCGImage:a5];
    id v11 = objc_msgSend(v10, "imageByApplyingCGOrientation:", vk_cgImagePropertyOrientationFromVKOrientation(-[VKCImageSubjectContext imageOrientation](self, "imageOrientation")));

    [v8 imageSize];
    id v12 = (CGImage *)[v13 createCGImage:v11 fromRect:*MEMORY[0x1E4F1E280] format:0 colorSpace:VKMRectWithSize()];
    [v8 setOrientedMaskImage:v12];
    CGImageRelease(v12);
  }
  else
  {
    [v8 setOrientedMaskImage:a5];
  }
}

- (void)processPathForInstance:(id)a3
{
  v46[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F45770]);
  [v5 setDetectsDarkOnLight:0];
  id v6 = objc_alloc(MEMORY[0x1E4F45890]);
  uint64_t v7 = [v4 orientedMaskImage];
  id v8 = (void *)[v6 initWithCGImage:v7 options:MEMORY[0x1E4F1CC08]];
  v46[0] = v5;
  double v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:1];
  id v45 = 0;
  [v8 performRequests:v9 error:&v45];
  id v10 = v45;

  if (v10)
  {
    id v11 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.RemoveBackground");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[VKCImageSubjectContext processPathForInstance:]((uint64_t)v10, v11);
    }
  }
  else
  {
    id v12 = [v5 results];
    id v11 = [v12 firstObject];

    id v10 = [v11 topLevelContours];

    if (v10)
    {
      v34 = self;
      v35 = v4;
      id v33 = objc_alloc_init(MEMORY[0x1E4F427D0]);
      id v13 = objc_alloc_init(MEMORY[0x1E4F427D0]);
      if ([v11 contourCount] < 1)
      {
        id v10 = 0;
      }
      else
      {
        uint64_t v14 = 0;
        uint64_t v15 = 0;
        do
        {
          id v44 = v14;
          v16 = [v11 contourAtIndex:v15 error:&v44];
          id v10 = v44;

          LODWORD(v17) = 981668463;
          id v18 = [v16 polygonApproximationWithEpsilon:0 error:v17];
          id v19 = (void *)MEMORY[0x1E4F427D0];
          id v20 = v18;
          id v21 = objc_msgSend(v19, "vk_pathFromCGPath:", objc_msgSend(v20, "normalizedPath"));
          objc_msgSend(v13, "vk_appendBezierPath:", v21);

          ++v15;
          uint64_t v14 = v10;
        }
        while (v15 < [v11 contourCount]);
      }
      long long v32 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
      *(_OWORD *)&v43.a = *MEMORY[0x1E4F1DAB8];
      long long v31 = *(_OWORD *)&v43.a;
      *(_OWORD *)&v43.c = v32;
      *(_OWORD *)&v43.tx = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
      long long v30 = *(_OWORD *)&v43.tx;
      CGAffineTransformMakeScale(&t2, 1.0, -1.0);
      *(_OWORD *)&t1.a = v31;
      *(_OWORD *)&t1.c = v32;
      *(_OWORD *)&t1.tx = v30;
      CGAffineTransformConcat(&v43, &t1, &t2);
      CGAffineTransformMakeTranslation(&v40, 0.0, 1.0);
      CGAffineTransform v39 = v43;
      CGAffineTransformConcat(&t1, &v39, &v40);
      CGAffineTransform v43 = t1;
      [(VKCImageSubjectContext *)v34 normalizedCropRect];
      VKMTransformConvertingRectToRect((uint64_t)&v38, 0.0, 1.0, 1.0, v22, v23, v24, v25);
      CGAffineTransform v39 = v43;
      CGAffineTransformConcat(&t1, &v39, &v38);
      CGAffineTransform v43 = t1;
      objc_msgSend(v13, "vk_applyTransform:", &t1);
      id v4 = v35;
      if (([v13 isEmpty] & 1) == 0)
      {
        v26 = (void *)[v13 copy];
        [v35 setBaseNormalizedSubjectPath:v26];
      }
      v27 = [v11 topLevelContours];
      v36[0] = MEMORY[0x1E4F143A8];
      v36[1] = 3221225472;
      v36[2] = __49__VKCImageSubjectContext_processPathForInstance___block_invoke;
      v36[3] = &unk_1E6BF10D0;
      id v28 = v33;
      id v37 = v28;
      [v27 enumerateObjectsUsingBlock:v36];

      CGAffineTransform t1 = v43;
      objc_msgSend(v28, "vk_applyTransform:", &t1);
      if (([v28 isEmpty] & 1) == 0)
      {
        v29 = (void *)[v28 copy];
        [v35 setBaseTopLevelNormalizedSubjectPath:v29];
      }
    }
  }
}

void __49__VKCImageSubjectContext_processPathForInstance___block_invoke(uint64_t a1, void *a2, double a3)
{
  LODWORD(a3) = 981668463;
  id v4 = [a2 polygonApproximationWithEpsilon:0 error:a3];
  id v5 = (void *)MEMORY[0x1E4F427D0];
  id v7 = v4;
  id v6 = objc_msgSend(v5, "vk_pathFromCGPath:", objc_msgSend(v7, "normalizedPath"));
  objc_msgSend(*(id *)(a1 + 32), "vk_appendBezierPath:", v6);
}

- (id)convertIndexSetToConcreteSubjectIndexes:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
    if (![v4 count])
    {
      id v6 = [(VKCImageSubjectContext *)self allSubjectIndexes];
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)convertExternalIndexSetToInternal:(id)a3
{
  id v4 = a3;
  id v5 = [(VKCImageSubjectContext *)self allSubjectIndexes];
  if (v4)
  {
    id v6 = v4;
    if ([v4 count])
    {
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __60__VKCImageSubjectContext_convertExternalIndexSetToInternal___block_invoke;
      v8[3] = &unk_1E6BF10F8;
      id v9 = v5;
      id v6 = [v4 indexesPassingTest:v8];
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

uint64_t __60__VKCImageSubjectContext_convertExternalIndexSetToInternal___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsIndex:a2];
}

- (id)normalizedPathForSubjectWithIndexSet:(id)a3 contentsRect:(CGRect)a4 topLevelOnly:(BOOL)a5
{
  BOOL v5 = a5;
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v11 = a3;
  if ([v11 count])
  {
    id v12 = [(VKCImageSubjectContext *)self convertExternalIndexSetToInternal:v11];
    uint64_t v13 = [v12 count];
    if (v13 == [v11 count])
    {
LABEL_11:
      if ([v12 count])
      {
        id v19 = objc_alloc_init(MEMORY[0x1E4F427D0]);
        v22[0] = MEMORY[0x1E4F143A8];
        v22[1] = 3221225472;
        v22[2] = __89__VKCImageSubjectContext_normalizedPathForSubjectWithIndexSet_contentsRect_topLevelOnly___block_invoke;
        v22[3] = &unk_1E6BF1120;
        id v18 = v19;
        id v23 = v18;
        double v24 = self;
        double v25 = x;
        double v26 = y;
        double v27 = width;
        double v28 = height;
        BOOL v29 = v5;
        [v11 enumerateIndexesUsingBlock:v22];
      }
      else
      {
        id v18 = 0;
      }

      goto LABEL_15;
    }
    uint64_t v14 = [v12 count];
    uint64_t v15 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.RemoveBackground");
    BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
    if (v14)
    {
      if (v16)
      {
        *(_WORD *)buf = 0;
        double v17 = "Indexes contain one or more indexes that are invalid, ignoring invalid indexes.";
LABEL_9:
        _os_log_impl(&dword_1DB266000, v15, OS_LOG_TYPE_DEFAULT, v17, buf, 2u);
      }
    }
    else if (v16)
    {
      *(_WORD *)buf = 0;
      double v17 = "Indexes contain no valid indexes, ignoring.";
      goto LABEL_9;
    }

    goto LABEL_11;
  }
  -[VKCImageSubjectContext normalizedPathForSubjectAtIndex:contentsRect:topLevelOnly:](self, "normalizedPathForSubjectAtIndex:contentsRect:topLevelOnly:", 0, v5, x, y, width, height);
  id v18 = (id)objc_claimAutoreleasedReturnValue();
LABEL_15:
  id v20 = (void *)[v18 copy];

  return v20;
}

void __89__VKCImageSubjectContext_normalizedPathForSubjectWithIndexSet_contentsRect_topLevelOnly___block_invoke(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void **)(a1 + 32);
  id v4 = *(void **)(a1 + 40);
  id v6 = [NSNumber numberWithUnsignedInteger:a2];
  BOOL v5 = objc_msgSend(v4, "normalizedPathForSubjectAtIndex:contentsRect:topLevelOnly:", v6, *(unsigned __int8 *)(a1 + 80), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  objc_msgSend(v3, "vk_appendBezierPath:", v5);
}

- (id)normalizedPathForSubjectAtIndex:(id)a3 contentsRect:(CGRect)a4 topLevelOnly:(BOOL)a5
{
  BOOL v5 = a5;
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v11 = a3;
  if (v11)
  {
    id v12 = [(VKCImageSubjectContext *)self subjectInstances];
    uint64_t v13 = objc_msgSend(v12, "vk_safeObjectAtIndex:", objc_msgSend(v11, "integerValue"));

    if (!v13)
    {
      +[VKAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](VKAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "instance != ((void *)0)", "-[VKCImageSubjectContext normalizedPathForSubjectAtIndex:contentsRect:topLevelOnly:]", 0, 0, @"Trying to get subject at index: %ld, but the index is out of range, returning nil", [v11 integerValue]);
      uint64_t v13 = 0;
    }
  }
  else
  {
    uint64_t v13 = [(VKCImageSubjectContext *)self allSubjectsInstance];
  }
  uint64_t v14 = objc_msgSend(v13, "normalizedSubjectPathWithContentsRect:topLevelOnly:", v5, x, y, width, height);
  uint64_t v15 = (void *)[v14 copy];

  return v15;
}

- (id)normalizedPathForActiveSubjectsWithContentsRect:(CGRect)a3 topLevelOnly:(BOOL)a4
{
  BOOL v4 = a4;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v10 = [(VKCImageSubjectContext *)self activeSubjectIndexes];
  uint64_t v11 = [v10 count];

  if (v11)
  {
    id v12 = objc_alloc_init(MEMORY[0x1E4F427D0]);
    uint64_t v13 = [(VKCImageSubjectContext *)self activeSubjectIndexes];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __87__VKCImageSubjectContext_normalizedPathForActiveSubjectsWithContentsRect_topLevelOnly___block_invoke;
    v17[3] = &unk_1E6BF1120;
    id v14 = v12;
    id v18 = v14;
    id v19 = self;
    double v20 = x;
    double v21 = y;
    double v22 = width;
    double v23 = height;
    BOOL v24 = v4;
    [v13 enumerateIndexesUsingBlock:v17];
  }
  else
  {
    -[VKCImageSubjectContext normalizedPathForSubjectAtIndex:contentsRect:topLevelOnly:](self, "normalizedPathForSubjectAtIndex:contentsRect:topLevelOnly:", 0, v4, x, y, width, height);
    id v14 = (id)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v15 = (void *)[v14 copy];

  return v15;
}

void __87__VKCImageSubjectContext_normalizedPathForActiveSubjectsWithContentsRect_topLevelOnly___block_invoke(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void **)(a1 + 32);
  BOOL v4 = *(void **)(a1 + 40);
  id v6 = [NSNumber numberWithUnsignedInteger:a2];
  BOOL v5 = objc_msgSend(v4, "normalizedPathForSubjectAtIndex:contentsRect:topLevelOnly:", v6, *(unsigned __int8 *)(a1 + 80), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  objc_msgSend(v3, "vk_appendBezierPath:", v5);
}

- (BOOL)containsSubjectAtNormalizedPoint:(CGPoint)a3
{
  unint64_t v3 = -[VKCImageSubjectContext indexOfSubjectAtNormalizedPoint:](self, "indexOfSubjectAtNormalizedPoint:", a3.x, a3.y);
  BOOL v4 = v3 != 0;

  return v4;
}

- (id)indexOfSubjectAtNormalizedPoint:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  id v12 = __Block_byref_object_copy__1;
  uint64_t v13 = __Block_byref_object_dispose__1;
  id v14 = 0;
  BOOL v5 = [(VKCImageSubjectContext *)self subjectInstances];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __58__VKCImageSubjectContext_indexOfSubjectAtNormalizedPoint___block_invoke;
  v8[3] = &unk_1E6BF1148;
  *(CGFloat *)&v8[5] = x;
  *(CGFloat *)&v8[6] = y;
  void v8[4] = &v9;
  [v5 enumerateObjectsUsingBlock:v8];

  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __58__VKCImageSubjectContext_indexOfSubjectAtNormalizedPoint___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v13 = a2;
  id v7 = [v13 baseTopLevelNormalizedSubjectPath];
  [v7 bounds];
  if (CGRectContainsPoint(v15, *(CGPoint *)(a1 + 40)))
  {
    id v8 = [v13 baseTopLevelNormalizedSubjectPath];
    int v9 = objc_msgSend(v8, "containsPoint:", *(double *)(a1 + 40), *(double *)(a1 + 48));

    if (v9)
    {
      uint64_t v10 = [NSNumber numberWithUnsignedInteger:a3];
      uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 8);
      id v12 = *(void **)(v11 + 40);
      *(void *)(v11 + 40) = v10;

      *a4 = 1;
    }
  }
}

- (BOOL)subjectIndexes:(id)a3 equivalentToIndexes:(id)a4
{
  id v6 = a4;
  id v7 = [(VKCImageSubjectContext *)self convertIndexSetToConcreteSubjectIndexes:a3];
  id v8 = [(VKCImageSubjectContext *)self convertIndexSetToConcreteSubjectIndexes:v6];

  LOBYTE(v6) = [v7 isEqualToIndexSet:v8];
  return (char)v6;
}

- (void)setSubjectCount:(unint64_t)a3
{
  self->_subjectCount = a3;
}

- (NSIndexSet)activeSubjectIndexes
{
  return self->_activeSubjectIndexes;
}

- (void)setActiveMADSubjectIndexes:(id)a3
{
}

- (NSArray)subjectPaths
{
  return self->_subjectPaths;
}

- (void)setSubjectPaths:(id)a3
{
}

- (VKCImageSubjectContextInstance)allSubjectsInstance
{
  return self->_allSubjectsInstance;
}

- (void)setAllSubjectsInstance:(id)a3
{
}

- (NSArray)subjectInstances
{
  return self->_subjectInstances;
}

- (void)setSubjectInstances:(id)a3
{
}

- (VKCRemoveBackgroundResult)maskResult
{
  return self->_maskResult;
}

- (void)setMaskResult:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maskResult, 0);
  objc_storeStrong((id *)&self->_subjectInstances, 0);
  objc_storeStrong((id *)&self->_allSubjectsInstance, 0);
  objc_storeStrong((id *)&self->_subjectPaths, 0);
  objc_storeStrong((id *)&self->_activeMADSubjectIndexes, 0);
  objc_storeStrong((id *)&self->_activeSubjectIndexes, 0);
}

- (void)processPathForInstance:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1DB266000, a2, OS_LOG_TYPE_ERROR, "Error generating path from subject mask instance: %@", (uint8_t *)&v2, 0xCu);
}

@end