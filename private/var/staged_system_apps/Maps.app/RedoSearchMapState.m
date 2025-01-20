@interface RedoSearchMapState
- (BOOL)isEqual:(id)a3;
- (GEOMapRegion)mapRegion;
- (RedoSearchMapState)initWithMapRegion:(id)a3 zoomLevel:(double)a4;
- (double)zoomLevel;
- (unint64_t)hash;
- (void)setMapRegion:(id)a3;
- (void)setZoomLevel:(double)a3;
@end

@implementation RedoSearchMapState

- (RedoSearchMapState)initWithMapRegion:(id)a3 zoomLevel:(double)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)RedoSearchMapState;
  v8 = [(RedoSearchMapState *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_mapRegion, a3);
    v9->_zoomLevel = a4;
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (RedoSearchMapState *)a3;
  v5 = v4;
  if (v4 == self)
  {
    BOOL v12 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    id v7 = [(RedoSearchMapState *)self mapRegion];
    v8 = [(RedoSearchMapState *)v6 mapRegion];
    if ([v7 isEqual:v8])
    {
      [(RedoSearchMapState *)self zoomLevel];
      double v10 = v9;
      [(RedoSearchMapState *)v6 zoomLevel];
      BOOL v12 = v10 == v11;
    }
    else
    {
      BOOL v12 = 0;
    }
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (unint64_t)hash
{
  return (unint64_t)[(GEOMapRegion *)self->_mapRegion hash] ^ (unint64_t)self->_zoomLevel;
}

- (GEOMapRegion)mapRegion
{
  return self->_mapRegion;
}

- (void)setMapRegion:(id)a3
{
}

- (double)zoomLevel
{
  return self->_zoomLevel;
}

- (void)setZoomLevel:(double)a3
{
  self->_zoomLevel = a3;
}

- (void).cxx_destruct
{
}

@end