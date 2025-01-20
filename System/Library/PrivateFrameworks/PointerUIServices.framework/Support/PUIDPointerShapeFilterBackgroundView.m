@interface PUIDPointerShapeFilterBackgroundView
- (CGRect)currentShapeFrame;
- (PUIDPointerShapeFilterBackgroundView)initWithShapeFrame:(CGRect)a3;
- (void)updateFilter:(id)a3;
- (void)updateShapeFrame:(CGRect)a3;
@end

@implementation PUIDPointerShapeFilterBackgroundView

- (PUIDPointerShapeFilterBackgroundView)initWithShapeFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v15.receiver = self;
  v15.super_class = (Class)PUIDPointerShapeFilterBackgroundView;
  v7 = [(PUIDPointerShapeFilterBackgroundView *)&v15 init];
  if (v7)
  {
    v8 = objc_alloc_init(PUIDPointerShapeBackdropView);
    shapeMorphingBackdropView = v7->_shapeMorphingBackdropView;
    v7->_shapeMorphingBackdropView = v8;

    -[PUIDPointerShapeBackdropView setFrame:](v7->_shapeMorphingBackdropView, "setFrame:", x, y, width, height);
    v10 = [(PUIDPointerShapeBackdropView *)v7->_shapeMorphingBackdropView backdropLayer];
    [v10 setAllowsInPlaceFiltering:1];

    v11 = +[CAFilter filterWithType:kCAFilterColorMatrix];
    [v11 setName:@"colorMatrix"];
    v12 = [(PUIDPointerShapeBackdropView *)v7->_shapeMorphingBackdropView layer];
    v16 = v11;
    v13 = +[NSArray arrayWithObjects:&v16 count:1];
    [v12 setFilters:v13];

    [(PUIDPointerShapeFilterBackgroundView *)v7 addSubview:v7->_shapeMorphingBackdropView];
  }
  return v7;
}

- (void)updateFilter:(id)a3
{
}

- (CGRect)currentShapeFrame
{
  [(PUIDPointerShapeBackdropView *)self->_shapeMorphingBackdropView frame];
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

- (void)updateShapeFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
}

@end