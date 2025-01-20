@interface _UIGlyphPathBoundsIntersectionViewData
- (CGRect)availableBounds;
- (CGRect)glyphPathBounds;
- (UIView)clippingView;
- (_UIGlyphPathBoundsIntersectionViewData)init;
- (id)_frameDebugDescription:(CGRect)a3;
- (id)debugDescription;
- (void)setAvailableBounds:(CGRect)a3;
- (void)setClippingView:(id)a3;
- (void)setGlyphPathBounds:(CGRect)a3;
@end

@implementation _UIGlyphPathBoundsIntersectionViewData

- (_UIGlyphPathBoundsIntersectionViewData)init
{
  v7.receiver = self;
  v7.super_class = (Class)_UIGlyphPathBoundsIntersectionViewData;
  v2 = [(_UIGlyphPathBoundsIntersectionViewData *)&v7 init];
  v3 = v2;
  if (v2)
  {
    CGPoint v4 = (CGPoint)*MEMORY[0x1E4F1DB28];
    CGSize v5 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
    v2->_availableBounds.origin = (CGPoint)*MEMORY[0x1E4F1DB28];
    v2->_availableBounds.size = v5;
    v2->_glyphPathBounds.origin = v4;
    v2->_glyphPathBounds.size = v5;
    objc_storeWeak((id *)&v2->_clippingView, 0);
  }
  return v3;
}

- (id)_frameDebugDescription:(CGRect)a3
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"(%g, %g; %g, %g)",
               *(void *)&a3.origin.x,
               *(void *)&a3.origin.y,
               *(void *)&a3.size.width,
               *(void *)&a3.size.height);
}

- (id)debugDescription
{
  v3 = NSString;
  CGPoint v4 = (objc_class *)objc_opt_class();
  CGSize v5 = NSStringFromClass(v4);
  v6 = -[_UIGlyphPathBoundsIntersectionViewData _frameDebugDescription:](self, "_frameDebugDescription:", self->_availableBounds.origin.x, self->_availableBounds.origin.y, self->_availableBounds.size.width, self->_availableBounds.size.height);
  objc_super v7 = -[_UIGlyphPathBoundsIntersectionViewData _frameDebugDescription:](self, "_frameDebugDescription:", self->_glyphPathBounds.origin.x, self->_glyphPathBounds.origin.y, self->_glyphPathBounds.size.width, self->_glyphPathBounds.size.height);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_clippingView);
  v9 = [WeakRetained debugDescription];
  v10 = [v3 stringWithFormat:@"<%@: %p availableBounds: %@, glyphPathBounds: %@, clippingView: %@>", v5, self, v6, v7, v9];

  return v10;
}

- (CGRect)availableBounds
{
  double x = self->_availableBounds.origin.x;
  double y = self->_availableBounds.origin.y;
  double width = self->_availableBounds.size.width;
  double height = self->_availableBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setAvailableBounds:(CGRect)a3
{
  self->_availableBounds = a3;
}

- (CGRect)glyphPathBounds
{
  double x = self->_glyphPathBounds.origin.x;
  double y = self->_glyphPathBounds.origin.y;
  double width = self->_glyphPathBounds.size.width;
  double height = self->_glyphPathBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setGlyphPathBounds:(CGRect)a3
{
  self->_glyphPathBounds = a3;
}

- (UIView)clippingView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_clippingView);
  return (UIView *)WeakRetained;
}

- (void)setClippingView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end