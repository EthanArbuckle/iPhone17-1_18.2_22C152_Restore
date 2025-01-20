@interface VKARWalkingManeuverFeature
- ($1AB5FA073B851C12C2339EC22442E995)position;
- (BOOL)isEqual:(id)a3;
- (Coordinate3D<geo::Degrees,)coordinate;
- (NSString)displayText;
- (PolylineCoordinate)routeCoordinate;
- (VKARWalkingManeuverFeature)initWithDisplayLocation:(id)a3 routeCoordinate:(PolylineCoordinate)a4 maneuverHeading:(double)a5 displayText:(id)a6;
- (VKARWalkingManeuverFeature)initWithDisplayLocation:(id)a3 routeCoordinate:(PolylineCoordinate)a4 maneuverHeading:(double)a5 displayText:(id)a6 maneuverPriority:(unint64_t)a7;
- (double)maneuverHeading;
- (id).cxx_construct;
- (id)description;
- (void)setDisplayText:(id)a3;
@end

@implementation VKARWalkingManeuverFeature

- (id).cxx_construct
{
  *((void *)self + 6) = 0xBF80000000000000;
  *((void *)self + 8) = &unk_1EF559F18;
  *((void *)self + 9) = 0;
  return self;
}

- (void).cxx_destruct
{
  self->_displayText._vptr$_retain_ptr = (void **)&unk_1EF559F18;
}

- (double)maneuverHeading
{
  return self->_maneuverHeading;
}

- (PolylineCoordinate)routeCoordinate
{
  return self->_routeCoordinate;
}

- ($1AB5FA073B851C12C2339EC22442E995)position
{
  double latitude = self->_position.latitude;
  double longitude = self->_position.longitude;
  double altitude = self->_position.altitude;
  result.var2 = altitude;
  result.var1 = longitude;
  result.var0 = latitude;
  return result;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = self->_displayText._obj;
  double latitude = self->_position.latitude;
  double longitude = self->_position.longitude;
  double altitude = self->_position.altitude;
  v10 = GEOPolylineCoordinateAsFullString();
  v11 = [v3 stringWithFormat:@"<%@: %p text:'%@' position:%f,%f,%f routeCoordinate:%@ heading:%.2f maneuverPriority:%llu>", v5, self, v6, *(void *)&latitude, *(void *)&longitude, *(void *)&altitude, v10, *(void *)&self->_maneuverHeading, -[VKARWalkingFeature intraFeaturePriority](self, "intraFeaturePriority")];

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)VKARWalkingManeuverFeature;
  if ([(VKARWalkingFeature *)&v20 isEqual:v4] && (uint64_t v5 = objc_opt_class(), v5 == objc_opt_class()))
  {
    id v8 = v4;
    double latitude = self->_position.latitude;
    double longitude = self->_position.longitude;
    double altitude = self->_position.altitude;
    [v8 position];
    if (vabdd_f64(latitude, v14) < 0.000001
      && vabdd_f64(longitude, v12) < 0.000001
      && vabdd_f64(altitude, v13) < 0.000001
      && ([v8 routeCoordinate], GEOPolylineCoordinateEqualEps())
      && (v15 = self->_displayText._obj,
          [v8 displayText],
          v16 = objc_claimAutoreleasedReturnValue(),
          BOOL v17 = [(NSString *)v15 isEqualToString:v16],
          v16,
          v15,
          v17))
    {
      double maneuverHeading = self->_maneuverHeading;
      [v8 maneuverHeading];
      BOOL v6 = vabdd_f64(maneuverHeading, v19) <= 0.01;
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

- (Coordinate3D<geo::Degrees,)coordinate
{
  double altitude = self->_position.altitude;
  long long v4 = *(_OWORD *)&self->_position.latitude;
  *(_OWORD *)uint64_t v2 = v4;
  *(double *)(v2 + 16) = altitude;
  result.double longitude = (Unit<geo::DegreeUnitDescription, double>)v4;
  result.double latitude = *(Unit<geo::DegreeUnitDescription, double> *)&altitude;
  return result;
}

- (VKARWalkingManeuverFeature)initWithDisplayLocation:(id)a3 routeCoordinate:(PolylineCoordinate)a4 maneuverHeading:(double)a5 displayText:(id)a6 maneuverPriority:(unint64_t)a7
{
  double var2 = a3.var2;
  double var1 = a3.var1;
  double var0 = a3.var0;
  id v14 = a6;
  v23.receiver = self;
  v23.super_class = (Class)VKARWalkingManeuverFeature;
  v15 = [(VKARWalkingFeature *)&v23 initWithType:0 intraFeaturePriority:a7];
  v16 = v15;
  if (v15)
  {
    v15->_position.double latitude = var0;
    v15->_position.double longitude = var1;
    v15->_position.double altitude = var2;
    v15->_routeCoordinate = a4;
    v15->_double maneuverHeading = a5;
    BOOL v17 = (NSString *)v14;
    v18 = v17;
    if (v17) {
      double v19 = v17;
    }
    obj = v16->_displayText._obj;
    v16->_displayText._obj = v18;

    v21 = v16;
  }

  return v16;
}

- (VKARWalkingManeuverFeature)initWithDisplayLocation:(id)a3 routeCoordinate:(PolylineCoordinate)a4 maneuverHeading:(double)a5 displayText:(id)a6
{
  return -[VKARWalkingManeuverFeature initWithDisplayLocation:routeCoordinate:maneuverHeading:displayText:maneuverPriority:](self, "initWithDisplayLocation:routeCoordinate:maneuverHeading:displayText:maneuverPriority:", a4, a6, -1, a3.var0, a3.var1, a3.var2, a5);
}

@end