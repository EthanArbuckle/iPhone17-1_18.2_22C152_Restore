@interface CRLiOSPresetRenderer
- (BOOL)cancelSwatchRenderingIfNeeded;
- (BOOL)contextIsLowContrast:(id)a3 forBackgroundColor:(id)a4;
- (BOOL)isDefaultLocalizedNameForPresetAtIndexPath:(id)a3 context:(id)a4;
- (BOOL)p_shouldWaitBeforeDeliveringSwatchesInContext:(id)a3;
- (CRLiOSPresetProviding)p_presetProvider;
- (CRLiOSPresetRenderer)initWithPresetProvider:(id)a3;
- (NSArray)p_inFlightOperations;
- (NSOperationQueue)p_swatchOperationQueue;
- (UIEdgeInsets)swatchInsets;
- (id)defaultLocalizedNameForPresetAtIndexPath:(id)a3 context:(id)a4;
- (id)localizedAccessibilityNameForPresetAtIndexPath:(id)a3 context:(id)a4;
- (id)localizedNameForPresetAtIndexPath:(id)a3 context:(id)a4;
- (id)p_swatchOperationForCellWithSize:(CGSize)a3 atIndexPath:(id)a4 context:(id)a5;
- (void)renderSwatchInView:(id)a3 withSize:(CGSize)a4 backgroundColor:(id)a5 atIndexPath:(id)a6 context:(id)a7;
- (void)setP_inFlightOperations:(id)a3;
- (void)setP_presetProvider:(id)a3;
- (void)setP_swatchOperationQueue:(id)a3;
- (void)waitOnSwatchRenderingAndDeliverResultsIfNeededInContext:(id)a3;
@end

@implementation CRLiOSPresetRenderer

- (CRLiOSPresetRenderer)initWithPresetProvider:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CRLiOSPresetRenderer;
  v6 = [(CRLiOSPresetRenderer *)&v13 init];
  if (v6)
  {
    v7 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    swatchOperationQueue = v6->_swatchOperationQueue;
    v6->_swatchOperationQueue = v7;

    if (objc_opt_respondsToSelector()) {
      uint64_t v9 = (uint64_t)[v5 maxConcurrentOperationCount];
    }
    else {
      uint64_t v9 = -1;
    }
    [(NSOperationQueue *)v6->_swatchOperationQueue setMaxConcurrentOperationCount:v9];
    objc_storeStrong((id *)&v6->_presetProvider, a3);
    uint64_t v10 = +[NSArray array];
    inFlightOperations = v6->_inFlightOperations;
    v6->_inFlightOperations = (NSArray *)v10;
  }
  return v6;
}

- (BOOL)cancelSwatchRenderingIfNeeded
{
  v3 = [(CRLiOSPresetRenderer *)self p_swatchOperationQueue];
  id v4 = [v3 operationCount];
  if (v4)
  {
    id v5 = [(CRLiOSPresetRenderer *)self p_swatchOperationQueue];
    [v5 cancelAllOperations];

    v6 = +[NSArray array];
    [(CRLiOSPresetRenderer *)self setP_inFlightOperations:v6];
  }
  return v4 != 0;
}

- (void)waitOnSwatchRenderingAndDeliverResultsIfNeededInContext:(id)a3
{
  if ([(CRLiOSPresetRenderer *)self p_shouldWaitBeforeDeliveringSwatchesInContext:a3])
  {
    id v4 = [(CRLiOSPresetRenderer *)self p_swatchOperationQueue];
    [v4 waitUntilAllOperationsAreFinished];

    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v5 = [(CRLiOSPresetRenderer *)self p_inFlightOperations];
    id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v12;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v5);
          }
          [*(id *)(*((void *)&v11 + 1) + 8 * (void)v9) deliverSwatch];
          uint64_t v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        id v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v7);
    }
  }
  uint64_t v10 = +[NSArray array];
  [(CRLiOSPresetRenderer *)self setP_inFlightOperations:v10];
}

- (BOOL)contextIsLowContrast:(id)a3 forBackgroundColor:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(CRLiOSPresetRenderer *)self p_presetProvider];
  unsigned __int8 v9 = [v8 contextIsLowContrast:v7 forBackgroundColor:v6];

  return v9;
}

- (void)renderSwatchInView:(id)a3 withSize:(CGSize)a4 backgroundColor:(id)a5 atIndexPath:(id)a6 context:(id)a7
{
  double height = a4.height;
  double width = a4.width;
  id v28 = a3;
  id v13 = a7;
  id v14 = a6;
  id v15 = a5;
  v16 = [(CRLiOSPresetRenderer *)self p_presetProvider];
  id v17 = [v16 suppressesAnimation];

  [v28 setExclusiveTouch:1];
  if ((v17 & 1) == 0) {
    [v28 setHidden:1];
  }
  [v28 crl_prepareForPresetRendering];
  v18 = -[CRLiOSPresetRenderer p_swatchOperationForCellWithSize:atIndexPath:context:](self, "p_swatchOperationForCellWithSize:atIndexPath:context:", v14, v13, width, height);
  [v18 setView:v28];
  id v19 = v15;
  id v20 = [v19 CGColor];

  v21 = [v18 view];
  v22 = [v21 layer];
  [v22 setBackgroundColor:v20];

  [v18 setSuppressesAnimation:v17];
  [v18 setTargetIndexPath:v14];
  v23 = [v18 view];
  objc_setAssociatedObject(v23, "CRLSwatchRenderingOperationTargetIndexPathKey", v14, (void *)3);

  unsigned int v24 = [(CRLiOSPresetRenderer *)self p_shouldWaitBeforeDeliveringSwatchesInContext:v13];
  if (v24) {
    [v18 setDeliversImageAutomatically:0];
  }
  v25 = [(CRLiOSPresetRenderer *)self p_swatchOperationQueue];
  [v25 addOperation:v18];

  v26 = [(CRLiOSPresetRenderer *)self p_inFlightOperations];
  v27 = [v26 arrayByAddingObject:v18];
  [(CRLiOSPresetRenderer *)self setP_inFlightOperations:v27];
}

- (id)localizedNameForPresetAtIndexPath:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(CRLiOSPresetRenderer *)self p_presetProvider];
  if (objc_opt_respondsToSelector())
  {
    unsigned __int8 v9 = [v8 localizedNameForPresetAtIndexPath:v6 context:v7];
  }
  else
  {
    unsigned __int8 v9 = 0;
  }

  return v9;
}

- (BOOL)isDefaultLocalizedNameForPresetAtIndexPath:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(CRLiOSPresetRenderer *)self p_presetProvider];
  if (objc_opt_respondsToSelector()) {
    unsigned __int8 v9 = [v8 isDefaultLocalizedNameForPresetAtIndexPath:v6 context:v7];
  }
  else {
    unsigned __int8 v9 = 0;
  }

  return v9;
}

- (id)defaultLocalizedNameForPresetAtIndexPath:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(CRLiOSPresetRenderer *)self p_presetProvider];
  if (objc_opt_respondsToSelector())
  {
    unsigned __int8 v9 = [v8 defaultLocalizedNameForPresetAtIndexPath:v6 context:v7];
  }
  else
  {
    unsigned __int8 v9 = 0;
  }

  return v9;
}

- (id)localizedAccessibilityNameForPresetAtIndexPath:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(CRLiOSPresetRenderer *)self p_presetProvider];
  if (objc_opt_respondsToSelector())
  {
    unsigned __int8 v9 = [v8 localizedAccessibilityNameForPresetAtIndexPath:v6 context:v7];
  }
  else
  {
    unsigned __int8 v9 = 0;
  }

  return v9;
}

- (UIEdgeInsets)swatchInsets
{
  v2 = [(CRLiOSPresetRenderer *)self p_presetProvider];
  [v2 swatchInsets];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.right = v14;
  result.bottom = v13;
  result.left = v12;
  result.top = v11;
  return result;
}

- (id)p_swatchOperationForCellWithSize:(CGSize)a3 atIndexPath:(id)a4 context:(id)a5
{
  double width = a3.width;
  id v8 = a5;
  id v9 = a4;
  double v10 = [(CRLiOSPresetRenderer *)self p_presetProvider];
  double v11 = [v10 swatchOperationWithSize:v9 atIndexPath:v8 context:sub_1000674B8(width)];

  return v11;
}

- (BOOL)p_shouldWaitBeforeDeliveringSwatchesInContext:(id)a3
{
  id v4 = a3;
  double v5 = [(CRLiOSPresetRenderer *)self p_presetProvider];
  if (objc_opt_respondsToSelector())
  {
    double v6 = [(CRLiOSPresetRenderer *)self p_presetProvider];
    unsigned __int8 v7 = [v6 shouldWaitBeforeDeliveringSwatchesInContext:v4];
  }
  else
  {
    unsigned __int8 v7 = 0;
  }

  return v7;
}

- (NSArray)p_inFlightOperations
{
  return self->_inFlightOperations;
}

- (void)setP_inFlightOperations:(id)a3
{
}

- (CRLiOSPresetProviding)p_presetProvider
{
  return self->_presetProvider;
}

- (void)setP_presetProvider:(id)a3
{
}

- (NSOperationQueue)p_swatchOperationQueue
{
  return self->_swatchOperationQueue;
}

- (void)setP_swatchOperationQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_swatchOperationQueue, 0);
  objc_storeStrong((id *)&self->_presetProvider, 0);

  objc_storeStrong((id *)&self->_inFlightOperations, 0);
}

@end