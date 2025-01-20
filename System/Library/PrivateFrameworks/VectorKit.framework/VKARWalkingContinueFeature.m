@interface VKARWalkingContinueFeature
- (BOOL)isEqual:(id)a3;
- (GEOComposedRoute)route;
- (GEOPolylineCoordinateRange)range;
- (NSString)displayText;
- (VKARWalkingContinueFeature)initWithRoute:(id)a3 range:(GEOPolylineCoordinateRange)a4 displayText:(id)a5;
- (VKARWalkingContinueFeature)initWithRoute:(id)a3 range:(GEOPolylineCoordinateRange)a4 displayText:(id)a5 continuePriority:(unint64_t)a6;
- (id).cxx_construct;
- (id)description;
- (void)setDisplayText:(id)a3;
- (void)setRoute:(id)a3;
@end

@implementation VKARWalkingContinueFeature

- (id).cxx_construct
{
  *((void *)self + 3) = 0xBF80000000000000;
  *((void *)self + 4) = 0xBF80000000000000;
  *((void *)self + 5) = &unk_1EF559678;
  *((void *)self + 6) = 0;
  *((void *)self + 8) = &unk_1EF559F18;
  *((void *)self + 9) = 0;
  return self;
}

- (void).cxx_destruct
{
  self->_displayText._vptr$_retain_ptr = (void **)&unk_1EF559F18;

  self->_route._vptr$_retain_ptr = (void **)&unk_1EF559678;
  obj = self->_route._obj;
}

- (GEOPolylineCoordinateRange)range
{
  p_range = &self->_range;
  PolylineCoordinate start = self->_range.start;
  PolylineCoordinate end = p_range->end;
  result.PolylineCoordinate end = end;
  result.PolylineCoordinate start = start;
  return result;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = self->_displayText._obj;
  v7 = GEOPolylineCoordinateAsFullString();
  v8 = GEOPolylineCoordinateAsFullString();
  v9 = self->_route._obj;
  v10 = [(GEOComposedRoute *)v9 uniqueRouteID];
  v11 = [v3 stringWithFormat:@"<%@: %p text:'%@' range.start:%@ range.end:%@ route:%@ continuePriority:%llu>", v5, self, v6, v7, v8, v10, -[VKARWalkingFeature intraFeaturePriority](self, "intraFeaturePriority")];

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)VKARWalkingContinueFeature;
  if ([(VKARWalkingFeature *)&v18 isEqual:v4] && (uint64_t v5 = objc_opt_class(), v5 == objc_opt_class()))
  {
    id v8 = v4;
    v9 = [(GEOComposedRoute *)self->_route._obj uniqueRouteID];
    v10 = [v8 route];
    v11 = [v10 uniqueRouteID];
    char v12 = [v9 isEqual:v11];

    if ((v12 & 1) != 0
      && (uint64_t v13 = [v8 range], self->_range.start.index == v13)
      && vabds_f32(self->_range.start.offset, *((float *)&v13 + 1)) < 0.00000011921
      && ([v8 range], self->_range.end.index == v15)
      && vabds_f32(self->_range.end.offset, v14) < 0.00000011921)
    {
      v16 = self->_displayText._obj;
      v17 = [v8 displayText];
      BOOL v6 = [(NSString *)v16 isEqualToString:v17];
    }
    else
    {
      BOOL v6 = 0;
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (void)setDisplayText:(id)a3
{
  id v4 = (NSString *)a3;
  v7 = v4;
  if (v4)
  {
    uint64_t v5 = v4;
    id v4 = v7;
  }
  obj = self->_displayText._obj;
  self->_displayText._obj = v4;
}

- (NSString)displayText
{
  return self->_displayText._obj;
}

- (void)setRoute:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (v4)
  {
    id v5 = v4;
    id v4 = v7;
  }
  obj = self->_route._obj;
  self->_route._obj = (GEOComposedRoute *)v4;
}

- (GEOComposedRoute)route
{
  return self->_route._obj;
}

- (VKARWalkingContinueFeature)initWithRoute:(id)a3 range:(GEOPolylineCoordinateRange)a4 displayText:(id)a5 continuePriority:(unint64_t)a6
{
  PolylineCoordinate end = a4.end;
  PolylineCoordinate start = a4.start;
  id v11 = a3;
  id v12 = a5;
  v25.receiver = self;
  v25.super_class = (Class)VKARWalkingContinueFeature;
  uint64_t v13 = [(VKARWalkingFeature *)&v25 initWithType:2 intraFeaturePriority:a6];
  float v14 = v13;
  if (v13)
  {
    v13->_range.PolylineCoordinate start = start;
    v13->_range.PolylineCoordinate end = end;
    int v15 = (GEOComposedRoute *)v11;
    v16 = v15;
    if (v15) {
      v17 = v15;
    }
    obj = v14->_route._obj;
    v14->_route._obj = v16;

    v19 = (NSString *)v12;
    v20 = v19;
    if (v19) {
      v21 = v19;
    }
    v22 = v14->_displayText._obj;
    v14->_displayText._obj = v20;

    v23 = v14;
  }

  return v14;
}

- (VKARWalkingContinueFeature)initWithRoute:(id)a3 range:(GEOPolylineCoordinateRange)a4 displayText:(id)a5
{
  return -[VKARWalkingContinueFeature initWithRoute:range:displayText:continuePriority:](self, "initWithRoute:range:displayText:continuePriority:", a3, *(void *)&a4.start, *(void *)&a4.end, a5, -1);
}

@end