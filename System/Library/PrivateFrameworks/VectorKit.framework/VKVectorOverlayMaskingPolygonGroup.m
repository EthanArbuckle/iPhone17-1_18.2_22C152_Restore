@interface VKVectorOverlayMaskingPolygonGroup
- (NSArray)polygons;
- (VKVectorOverlayMaskingPolygonGroup)initWithPolygons:(id)a3;
- (int64_t)fillMode;
- (int64_t)style;
- (void)setFillMode:(int64_t)a3;
- (void)setStyle:(int64_t)a3;
@end

@implementation VKVectorOverlayMaskingPolygonGroup

- (void).cxx_destruct
{
}

- (NSArray)polygons
{
  return self->_polygons;
}

- (void)setStyle:(int64_t)a3
{
  self->_style = a3;
}

- (int64_t)style
{
  return self->_style;
}

- (void)setFillMode:(int64_t)a3
{
  self->_fillMode = a3;
}

- (int64_t)fillMode
{
  return self->_fillMode;
}

- (VKVectorOverlayMaskingPolygonGroup)initWithPolygons:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)VKVectorOverlayMaskingPolygonGroup;
  v6 = [(VKVectorOverlayData *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_polygons, a3);
    v7->_fillMode = 0;
    v7->_style = 0;
    v8 = v7;
  }

  return v7;
}

@end