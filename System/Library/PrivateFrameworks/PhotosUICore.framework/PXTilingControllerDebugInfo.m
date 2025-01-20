@interface PXTilingControllerDebugInfo
- (CGRect)activeRect;
- (CGRect)cachedRect;
- (CGRect)contentBounds;
- (CGRect)pagedRect;
- (CGRect)visibleRect;
- (NSArray)activeItems;
- (NSArray)pagedItems;
- (NSArray)preheatRects;
- (NSArray)preheatedItems;
- (id)debugQuickLookObject;
- (void)drawInRect:(CGRect)a3 inContext:(CGContext *)a4;
- (void)setActiveItems:(id)a3;
- (void)setActiveRect:(CGRect)a3;
- (void)setCachedRect:(CGRect)a3;
- (void)setContentBounds:(CGRect)a3;
- (void)setPagedItems:(id)a3;
- (void)setPagedRect:(CGRect)a3;
- (void)setPreheatRects:(id)a3;
- (void)setPreheatedItems:(id)a3;
- (void)setVisibleRect:(CGRect)a3;
@end

@implementation PXTilingControllerDebugInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeItems, 0);
  objc_storeStrong((id *)&self->_preheatedItems, 0);
  objc_storeStrong((id *)&self->_pagedItems, 0);
  objc_storeStrong((id *)&self->_preheatRects, 0);
}

- (void)setActiveItems:(id)a3
{
}

- (NSArray)activeItems
{
  return self->_activeItems;
}

- (void)setPreheatedItems:(id)a3
{
}

- (NSArray)preheatedItems
{
  return self->_preheatedItems;
}

- (void)setPagedItems:(id)a3
{
}

- (NSArray)pagedItems
{
  return self->_pagedItems;
}

- (void)setPreheatRects:(id)a3
{
}

- (NSArray)preheatRects
{
  return self->_preheatRects;
}

- (void)setContentBounds:(CGRect)a3
{
  self->_contentBounds = a3;
}

- (CGRect)contentBounds
{
  double x = self->_contentBounds.origin.x;
  double y = self->_contentBounds.origin.y;
  double width = self->_contentBounds.size.width;
  double height = self->_contentBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setCachedRect:(CGRect)a3
{
  self->_cachedRect = a3;
}

- (CGRect)cachedRect
{
  double x = self->_cachedRect.origin.x;
  double y = self->_cachedRect.origin.y;
  double width = self->_cachedRect.size.width;
  double height = self->_cachedRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setPagedRect:(CGRect)a3
{
  self->_pagedRect = a3;
}

- (CGRect)pagedRect
{
  double x = self->_pagedRect.origin.x;
  double y = self->_pagedRect.origin.y;
  double width = self->_pagedRect.size.width;
  double height = self->_pagedRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setActiveRect:(CGRect)a3
{
  self->_activeRect = a3;
}

- (CGRect)activeRect
{
  double x = self->_activeRect.origin.x;
  double y = self->_activeRect.origin.y;
  double width = self->_activeRect.size.width;
  double height = self->_activeRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setVisibleRect:(CGRect)a3
{
  self->_visibleRect = a3;
}

- (CGRect)visibleRect
{
  double x = self->_visibleRect.origin.x;
  double y = self->_visibleRect.origin.y;
  double width = self->_visibleRect.size.width;
  double height = self->_visibleRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (id)debugQuickLookObject
{
  v6.double width = 50.0;
  v6.double height = 640.0;
  UIGraphicsBeginImageContextWithOptions(v6, 1, 2.0);
  -[PXTilingControllerDebugInfo drawInRect:inContext:](self, "drawInRect:inContext:", UIGraphicsGetCurrentContext(), 0.0, 0.0, 50.0, 640.0);
  v3 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  return v3;
}

- (void)drawInRect:(CGRect)a3 inContext:(CGContext *)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  CGContextSaveGState(a4);
  CGContextSetRGBFillColor(a4, 1.0, 1.0, 1.0, 1.0);
  v10.origin.CGFloat x = x;
  v10.origin.CGFloat y = y;
  v10.size.CGFloat width = width;
  v10.size.CGFloat height = height;
  CGContextFillRect(a4, v10);
  PXEdgeInsetsMake();
}

@end