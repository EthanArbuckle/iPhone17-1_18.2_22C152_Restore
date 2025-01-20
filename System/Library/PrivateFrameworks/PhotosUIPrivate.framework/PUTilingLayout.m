@interface PUTilingLayout
- (CGPoint)coordinateSystemOrigin;
- (CGRect)contentBounds;
- (CGRect)visibleRect;
- (CGRect)visibleRectForScrollingToItemAtIndexPath:(id)a3 scrollPosition:(int64_t)a4;
- (PUTilingCoordinateSystem)coordinateSystem;
- (PUTilingCoordinateSystem)parentCoordinateSystem;
- (PUTilingDataSource)dataSource;
- (PUTilingLayout)init;
- (PUTilingLayout)initWithDataSource:(id)a3;
- (PUTilingScrollInfo)preferredScrollInfo;
- (PUTilingView)tilingView;
- (id)description;
- (id)layoutInfoForTileWithIndexPath:(id)a3 kind:(id)a4;
- (id)layoutInfosForTilesInRect:(CGRect)a3;
- (id)tileIdentifierForTileWithIndexPath:(id)a3 kind:(id)a4;
- (void)invalidateLayoutWithContext:(id)a3;
- (void)invalidateLayoutWithContext:(id)a3 updateImmediately:(BOOL)a4;
- (void)prepareLayout;
- (void)setCoordinateSystemOrigin:(CGPoint)a3;
- (void)setParentCoordinateSystem:(id)a3;
- (void)setTilingView:(id)a3;
- (void)setVisibleRect:(CGRect)a3;
@end

@implementation PUTilingLayout

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_parentCoordinateSystem);
  objc_destroyWeak((id *)&self->_tilingView);
  objc_storeStrong((id *)&self->_coordinateSystem, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);

  objc_storeStrong((id *)&self->_tileIdentifierByIndexPathByKind, 0);
}

- (CGPoint)coordinateSystemOrigin
{
  double x = self->_coordinateSystemOrigin.x;
  double y = self->_coordinateSystemOrigin.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (PUTilingCoordinateSystem)parentCoordinateSystem
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentCoordinateSystem);

  return (PUTilingCoordinateSystem *)WeakRetained;
}

- (void)setTilingView:(id)a3
{
}

- (PUTilingView)tilingView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tilingView);

  return (PUTilingView *)WeakRetained;
}

- (PUTilingCoordinateSystem)coordinateSystem
{
  return self->_coordinateSystem;
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

- (PUTilingDataSource)dataSource
{
  return self->_dataSource;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)PUTilingLayout;
  v3 = [(PUTilingLayout *)&v7 description];
  v4 = [(PUTilingLayout *)self dataSource];
  v5 = [v3 stringByAppendingFormat:@" dataSource:%@", v4];

  return v5;
}

- (void)setCoordinateSystemOrigin:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if (a3.x != self->_coordinateSystemOrigin.x || a3.y != self->_coordinateSystemOrigin.y)
  {
    self->_coordinateSystemOrigin = a3;
    id v6 = [(PUTilingLayout *)self coordinateSystem];
    objc_msgSend(v6, "setCoordinateSystemOrigin:", x, y);
  }
}

- (void)setParentCoordinateSystem:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentCoordinateSystem);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_parentCoordinateSystem, obj);
    v5 = [(PUTilingLayout *)self coordinateSystem];
    [v5 setParentCoordinateSystem:obj];
  }
}

- (id)tileIdentifierForTileWithIndexPath:(id)a3 kind:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(NSMutableDictionary *)self->_tileIdentifierByIndexPathByKind objectForKeyedSubscript:v7];
  if (!v8)
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [(NSMutableDictionary *)self->_tileIdentifierByIndexPathByKind setObject:v8 forKeyedSubscript:v7];
  }
  v9 = [v8 objectForKeyedSubscript:v6];
  if (!v9)
  {
    v10 = [PUTileIdentifier alloc];
    v11 = [(PUTilingLayout *)self dataSource];
    v12 = [v11 identifier];
    v9 = [(PUTileIdentifier *)v10 initWithIndexPath:v6 tileKind:v7 dataSourceIdentifier:v12];

    [v8 setObject:v9 forKeyedSubscript:v6];
  }

  return v9;
}

- (void)invalidateLayoutWithContext:(id)a3
{
}

- (void)invalidateLayoutWithContext:(id)a3 updateImmediately:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(PUTilingLayout *)self tilingView];
  [v7 invalidateLayout:self withContext:v6];

  if (v4)
  {
    id v8 = [(PUTilingLayout *)self tilingView];
    [v8 layoutIfNeeded];
  }
}

- (PUTilingScrollInfo)preferredScrollInfo
{
  return +[PUTilingScrollInfo scrollInfoWithScrollDirections:0];
}

- (CGRect)visibleRectForScrollingToItemAtIndexPath:(id)a3 scrollPosition:(int64_t)a4
{
  id v6 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4);
  [v6 handleFailureInMethod:a2 object:self file:@"PUTilingLayout.m" lineNumber:58 description:@"must be implemented by concrete subclass"];

  double v7 = *MEMORY[0x1E4F1DB20];
  double v8 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  double v9 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  double v10 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  result.size.double height = v10;
  result.size.double width = v9;
  result.origin.double y = v8;
  result.origin.double x = v7;
  return result;
}

- (id)layoutInfoForTileWithIndexPath:(id)a3 kind:(id)a4
{
  id v6 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4);
  [v6 handleFailureInMethod:a2 object:self file:@"PUTilingLayout.m" lineNumber:53 description:@"must be implemented by concrete subclass"];

  return 0;
}

- (id)layoutInfosForTilesInRect:(CGRect)a3
{
  v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [v5 handleFailureInMethod:a2 object:self file:@"PUTilingLayout.m" lineNumber:48 description:@"must be implemented by concrete subclass"];

  return 0;
}

- (CGRect)contentBounds
{
  BOOL v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"PUTilingLayout.m" lineNumber:43 description:@"must be implemented by concrete subclass"];

  double v5 = *MEMORY[0x1E4F1DB28];
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  result.size.double height = v8;
  result.size.double width = v7;
  result.origin.double y = v6;
  result.origin.double x = v5;
  return result;
}

- (void)prepareLayout
{
  BOOL v4 = [(PUTilingLayout *)self dataSource];

  if (!v4)
  {
    id v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:a2 object:self file:@"PUTilingLayout.m" lineNumber:39 description:@"data source must be set"];
  }
}

- (PUTilingLayout)init
{
  return [(PUTilingLayout *)self initWithDataSource:0];
}

- (PUTilingLayout)initWithDataSource:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PUTilingLayout;
  double v6 = [(PUTilingLayout *)&v13 init];
  double v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_dataSource, a3);
    double v8 = objc_alloc_init(PUTilingLayoutCoordinateSystem);
    coordinateSystem = v7->_coordinateSystem;
    v7->_coordinateSystem = (PUTilingCoordinateSystem *)v8;

    double v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    tileIdentifierByIndexPathByKind = v7->_tileIdentifierByIndexPathByKind;
    v7->_tileIdentifierByIndexPathByKind = v10;
  }
  return v7;
}

@end