@interface PXPlacesMapViewPort
- ($12569EB6952B655774F5ECF42E55FE6C)mapRect;
- (BOOL)isEqual:(id)a3;
- (CGSize)viewSize;
- (PXPlacesMapViewPort)initWithMapRect:(id)a3 andViewSize:(CGSize)a4 zoomLevel:(double)a5 pitch:(double)a6;
- (double)pitch;
- (double)scale;
- (double)zoomLevel;
- (id)copyWithZone:(_NSZone *)a3;
- (id)viewPortsBySplitingAt180thMerdian;
- (void)setMapRect:(id)a3;
- (void)setPitch:(double)a3;
- (void)setScale:(double)a3;
- (void)setViewSize:(CGSize)a3;
- (void)setZoomLevel:(double)a3;
@end

@implementation PXPlacesMapViewPort

- (void)setScale:(double)a3
{
  self->_scale = a3;
}

- (double)scale
{
  return self->_scale;
}

- (void)setPitch:(double)a3
{
  self->_pitch = a3;
}

- (double)pitch
{
  return self->_pitch;
}

- (void)setZoomLevel:(double)a3
{
  self->_zoomLevel = a3;
}

- (double)zoomLevel
{
  return self->_zoomLevel;
}

- (void)setViewSize:(CGSize)a3
{
  self->_viewSize = a3;
}

- (CGSize)viewSize
{
  double width = self->_viewSize.width;
  double height = self->_viewSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setMapRect:(id)a3
{
  self->_mapRect = ($DFF1302A2B19FC4662A7566F2E3E3516)a3;
}

- ($12569EB6952B655774F5ECF42E55FE6C)mapRect
{
  double x = self->_mapRect.origin.x;
  double y = self->_mapRect.origin.y;
  double width = self->_mapRect.size.width;
  double height = self->_mapRect.size.height;
  result.var1.var1 = height;
  result.var1.var0 = width;
  result.var0.var1 = y;
  result.var0.var0 = x;
  return result;
}

- (id)viewPortsBySplitingAt180thMerdian
{
  v20[2] = *MEMORY[0x1E4F143B8];
  [(PXPlacesMapViewPort *)self mapRect];
  if (MKMapRectSpans180thMeridian(v22))
  {
    [(PXPlacesMapViewPort *)self mapRect];
    double x = v23.origin.x;
    double y = v23.origin.y;
    double width = v23.size.width;
    double height = v23.size.height;
    MKMapRect v24 = MKMapRectIntersection(v23, *MEMORY[0x1E4F30DA0]);
    double v7 = v24.origin.x;
    double v8 = v24.origin.y;
    double v9 = v24.size.width;
    double v10 = v24.size.height;
    v24.origin.double x = x;
    v24.origin.double y = y;
    v24.size.double width = width;
    v24.size.double height = height;
    MKMapRect v25 = MKMapRectRemainder(v24);
    double v11 = v25.origin.x;
    double v12 = v25.origin.y;
    double v13 = v25.size.width;
    double v14 = v25.size.height;
    id v15 = [(PXPlacesMapViewPort *)self copyWithZone:0];
    objc_msgSend(v15, "setMapRect:", v7, v8, v9, v10);
    id v16 = [(PXPlacesMapViewPort *)self copyWithZone:0];
    objc_msgSend(v16, "setMapRect:", v11, v12, v13, v14);
    v20[0] = v15;
    v20[1] = v16;
    v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:2];
  }
  else
  {
    id v15 = [(PXPlacesMapViewPort *)self copyWithZone:0];
    id v19 = v15;
    v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v19 count:1];
  }

  return v17;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [PXPlacesMapViewPort alloc];
  [(PXPlacesMapViewPort *)self mapRect];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  [(PXPlacesMapViewPort *)self viewSize];
  double v14 = v13;
  double v16 = v15;
  [(PXPlacesMapViewPort *)self zoomLevel];
  double v18 = v17;
  [(PXPlacesMapViewPort *)self pitch];
  v20 = -[PXPlacesMapViewPort initWithMapRect:andViewSize:zoomLevel:pitch:](v4, "initWithMapRect:andViewSize:zoomLevel:pitch:", v6, v8, v10, v12, v14, v16, v18, v19);
  [(PXPlacesMapViewPort *)self scale];
  -[PXPlacesMapViewPort setScale:](v20, "setScale:");
  return v20;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    [(PXPlacesMapViewPort *)self mapRect];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    [v5 mapRect];
    BOOL v18 = v7 == v17 && v9 == v14;
    if (v18 && (v11 == v15 ? (BOOL v19 = v13 == v16) : (BOOL v19 = 0), v19))
    {
      [(PXPlacesMapViewPort *)self viewSize];
      double v22 = v21;
      double v24 = v23;
      [v5 viewSize];
      BOOL v20 = v24 == v26 && v22 == v25;
    }
    else
    {
      BOOL v20 = 0;
    }
  }
  else
  {
    BOOL v20 = 0;
  }

  return v20;
}

- (PXPlacesMapViewPort)initWithMapRect:(id)a3 andViewSize:(CGSize)a4 zoomLevel:(double)a5 pitch:(double)a6
{
  CGFloat height = a4.height;
  double width = a4.width;
  double var1 = a3.var1.var1;
  double var0 = a3.var1.var0;
  double v12 = a3.var0.var1;
  double v13 = a3.var0.var0;
  v16.receiver = self;
  v16.super_class = (Class)PXPlacesMapViewPort;
  $12569EB6952B655774F5ECF42E55FE6C result = [(PXPlacesMapViewPort *)&v16 init];
  if (result)
  {
    result->_mapRect.origin.double y = v12;
    result->_mapRect.size.double width = var0;
    result->_mapRect.size.CGFloat height = var1;
    result->_viewSize.CGFloat height = height;
    result->_mapRect.origin.double x = v13;
    result->_zoomLevel = a5;
    result->_pitch = a6;
    double v15 = var0 / width;
    if (width <= 0.0) {
      double v15 = 0.0;
    }
    result->_scale = v15;
    result->_viewSize.double width = width;
  }
  return result;
}

@end