@interface PXDemoTilingControllerWidgetTile
- (PXDemoTilingControllerWidgetTile)init;
- (UIView)_mapView;
@end

@implementation PXDemoTilingControllerWidgetTile

- (void).cxx_destruct
{
}

- (UIView)_mapView
{
  return self->__mapView;
}

- (PXDemoTilingControllerWidgetTile)init
{
  v8.receiver = self;
  v8.super_class = (Class)PXDemoTilingControllerWidgetTile;
  v2 = [(PXDemoTilingControllerWidgetTile *)&v8 init];
  if (v2)
  {
    v3 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    mapView = v2->__mapView;
    v2->__mapView = v3;

    v5 = v2->__mapView;
    v6 = [MEMORY[0x1E4FB1618] greenColor];
    [(UIView *)v5 setBackgroundColor:v6];
  }
  return v2;
}

@end