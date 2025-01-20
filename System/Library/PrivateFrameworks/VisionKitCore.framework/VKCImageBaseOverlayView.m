@interface VKCImageBaseOverlayView
- (BOOL)isPublicAPI;
- (CGPoint)normalizedPointFromViewPoint:(CGPoint)a3;
- (CGPoint)viewPointFromNormalizedPoint:(CGPoint)a3;
- (CGRect)contentBounds;
- (CGRect)contentsRect;
- (CGRect)normalizedRectFromViewRect:(CGRect)a3;
- (CGRect)normalizedVisibleRect;
- (CGRect)viewRectFromNormalizedRect:(CGRect)a3;
- (NSString)customAnalyticsIdentifier;
- (VKCImageAnalysisResult)analysisResult;
- (VKCImageBaseOverlayView)initWithFrame:(CGRect)a3;
- (VKCImageBaseOverlayViewDelegate)baseDelegate;
- (VKCTextRecognitionResult)recognitionResult;
- (id)description;
- (id)normalizedPathFromViewPath:(id)a3;
- (id)normalizedQuadFromViewQuad:(id)a3;
- (id)viewPathFromNormalizedPath:(id)a3;
- (id)viewQuadFromNormalizedQuad:(id)a3;
- (int64_t)identifierIndex;
- (void)setBaseDelegate:(id)a3;
- (void)setContentsRect:(CGRect)a3;
- (void)setCustomAnalyticsIdentifier:(id)a3;
- (void)setIdentifierIndex:(int64_t)a3;
- (void)setNormalizedVisibleRect:(CGRect)a3;
- (void)setRecognitionResult:(id)a3;
@end

@implementation VKCImageBaseOverlayView

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(VKCImageBaseOverlayView *)self analysisResult];
  v6 = [v3 stringWithFormat:@"<%@: %p> id: %d", v4, self, objc_msgSend(v5, "analysisRequestID")];

  return v6;
}

- (VKCImageBaseOverlayView)initWithFrame:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)VKCImageBaseOverlayView;
  result = -[VKCImageBaseOverlayView initWithFrame:](&v4, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (result)
  {
    result->_contentsRect.origin = (CGPoint)VKMRectUnit;
    result->_contentsRect.size = *(CGSize *)&qword_1DB33EB28;
  }
  return result;
}

- (VKCImageAnalysisResult)analysisResult
{
  uint64_t v3 = objc_opt_class();
  objc_super v4 = [(VKCImageBaseOverlayView *)self recognitionResult];
  v5 = VKDynamicCast(v3, (uint64_t)v4);

  return (VKCImageAnalysisResult *)v5;
}

- (BOOL)isPublicAPI
{
  v2 = [(VKCImageBaseOverlayView *)self baseDelegate];
  char v3 = [v2 isPublicAPI];

  return v3;
}

- (CGRect)contentBounds
{
  -[VKCImageBaseOverlayView viewRectFromNormalizedRect:](self, "viewRectFromNormalizedRect:", 0.0, 0.0, 1.0, 1.0);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setNormalizedVisibleRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  p_normalizedVisibleRect = &self->_normalizedVisibleRect;
  if (!CGRectEqualToRect(self->_normalizedVisibleRect, a3))
  {
    p_normalizedVisibleRect->origin.CGFloat x = x;
    p_normalizedVisibleRect->origin.CGFloat y = y;
    p_normalizedVisibleRect->size.CGFloat width = width;
    p_normalizedVisibleRect->size.CGFloat height = height;
    [(VKCImageBaseOverlayView *)self normalizedVisibleRectDidChange];
  }
}

- (CGPoint)normalizedPointFromViewPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(VKCImageBaseOverlayView *)self bounds];
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  [(VKCImageBaseOverlayView *)self contentsRect];
  VKMRectFromNormalizedSubrect(v7, v9, v11, v13, v14, v15, v16, v17);
  double v21 = VKMNormalizedPointInRect(x, y, v18, v19, v20);
  result.double y = v22;
  result.double x = v21;
  return result;
}

- (CGPoint)viewPointFromNormalizedPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(VKCImageBaseOverlayView *)self bounds];
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  [(VKCImageBaseOverlayView *)self contentsRect];
  VKMRectFromNormalizedSubrect(v7, v9, v11, v13, v14, v15, v16, v17);
  double v21 = VKMPointFromNormalizedRect(x, y, v18, v19, v20);
  result.double y = v22;
  result.double x = v21;
  return result;
}

- (CGRect)normalizedRectFromViewRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  [(VKCImageBaseOverlayView *)self bounds];
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  [(VKCImageBaseOverlayView *)self contentsRect];
  VKMRectFromNormalizedSubrect(v9, v11, v13, v15, v16, v17, v18, v19);
  VKMNormalizedSubrectInRect(x, y, width, height, v20, v21, v22, v23);
  result.size.CGFloat height = v27;
  result.size.CGFloat width = v26;
  result.origin.CGFloat y = v25;
  result.origin.CGFloat x = v24;
  return result;
}

- (CGRect)viewRectFromNormalizedRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  [(VKCImageBaseOverlayView *)self bounds];
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  [(VKCImageBaseOverlayView *)self contentsRect];
  VKMRectFromNormalizedSubrect(v9, v11, v13, v15, v16, v17, v18, v19);
  VKMRectFromNormalizedSubrect(v20, v21, v22, v23, x, y, width, height);
  result.size.CGFloat height = v27;
  result.size.CGFloat width = v26;
  result.origin.CGFloat y = v25;
  result.origin.CGFloat x = v24;
  return result;
}

- (id)normalizedQuadFromViewQuad:(id)a3
{
  id v4 = a3;
  [v4 topLeft];
  -[VKCImageBaseOverlayView normalizedPointFromViewPoint:](self, "normalizedPointFromViewPoint:");
  double v6 = v5;
  double v8 = v7;
  [v4 topRight];
  -[VKCImageBaseOverlayView normalizedPointFromViewPoint:](self, "normalizedPointFromViewPoint:");
  double v10 = v9;
  double v12 = v11;
  [v4 bottomLeft];
  -[VKCImageBaseOverlayView normalizedPointFromViewPoint:](self, "normalizedPointFromViewPoint:");
  double v14 = v13;
  double v16 = v15;
  [v4 bottomRight];
  double v18 = v17;
  double v20 = v19;

  -[VKCImageBaseOverlayView normalizedPointFromViewPoint:](self, "normalizedPointFromViewPoint:", v18, v20);
  CGFloat v23 = -[VKQuad initWithBottomLeft:bottomRight:topLeft:topRight:]([VKQuad alloc], "initWithBottomLeft:bottomRight:topLeft:topRight:", v14, v16, v21, v22, v6, v8, v10, v12);
  return v23;
}

- (id)viewQuadFromNormalizedQuad:(id)a3
{
  id v4 = a3;
  [v4 topLeft];
  -[VKCImageBaseOverlayView viewPointFromNormalizedPoint:](self, "viewPointFromNormalizedPoint:");
  double v6 = v5;
  double v8 = v7;
  [v4 topRight];
  -[VKCImageBaseOverlayView viewPointFromNormalizedPoint:](self, "viewPointFromNormalizedPoint:");
  double v10 = v9;
  double v12 = v11;
  [v4 bottomLeft];
  -[VKCImageBaseOverlayView viewPointFromNormalizedPoint:](self, "viewPointFromNormalizedPoint:");
  double v14 = v13;
  double v16 = v15;
  [v4 bottomRight];
  double v18 = v17;
  double v20 = v19;

  -[VKCImageBaseOverlayView viewPointFromNormalizedPoint:](self, "viewPointFromNormalizedPoint:", v18, v20);
  CGFloat v23 = -[VKQuad initWithBottomLeft:bottomRight:topLeft:topRight:]([VKQuad alloc], "initWithBottomLeft:bottomRight:topLeft:topRight:", v14, v16, v21, v22, v6, v8, v10, v12);
  return v23;
}

- (id)normalizedPathFromViewPath:(id)a3
{
  id v4 = a3;
  [v4 bounds];
  -[VKCImageBaseOverlayView normalizedRectFromViewRect:](self, "normalizedRectFromViewRect:");
  double v5 = objc_msgSend(v4, "vk_pathByFittingToRect:");

  return v5;
}

- (id)viewPathFromNormalizedPath:(id)a3
{
  id v4 = a3;
  [v4 bounds];
  -[VKCImageBaseOverlayView viewRectFromNormalizedRect:](self, "viewRectFromNormalizedRect:");
  double v5 = objc_msgSend(v4, "vk_pathByFittingToRect:");

  return v5;
}

- (VKCImageBaseOverlayViewDelegate)baseDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_baseDelegate);
  return (VKCImageBaseOverlayViewDelegate *)WeakRetained;
}

- (void)setBaseDelegate:(id)a3
{
}

- (VKCTextRecognitionResult)recognitionResult
{
  return self->_recognitionResult;
}

- (void)setRecognitionResult:(id)a3
{
}

- (NSString)customAnalyticsIdentifier
{
  return self->_customAnalyticsIdentifier;
}

- (void)setCustomAnalyticsIdentifier:(id)a3
{
}

- (int64_t)identifierIndex
{
  return self->_identifierIndex;
}

- (void)setIdentifierIndex:(int64_t)a3
{
  self->_identifierIndeCGFloat x = a3;
}

- (CGRect)contentsRect
{
  double x = self->_contentsRect.origin.x;
  double y = self->_contentsRect.origin.y;
  double width = self->_contentsRect.size.width;
  double height = self->_contentsRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setContentsRect:(CGRect)a3
{
  self->_contentsRect = a3;
}

- (CGRect)normalizedVisibleRect
{
  double x = self->_normalizedVisibleRect.origin.x;
  double y = self->_normalizedVisibleRect.origin.y;
  double width = self->_normalizedVisibleRect.size.width;
  double height = self->_normalizedVisibleRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customAnalyticsIdentifier, 0);
  objc_storeStrong((id *)&self->_recognitionResult, 0);
  objc_destroyWeak((id *)&self->_baseDelegate);
}

@end