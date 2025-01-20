@interface VKPuckAnimatorLocationProjector
- ($F24F406B2B787EFB06265DBA3D28CBD5)projectedLocation;
- (BOOL)alwaysUseGoodRouteMatch;
- (BOOL)isProjectedPositionBehind;
- (BOOL)projectedLocationOnRoute;
- (GEORouteMatch)projectedRouteMatch;
- (GEORouteMatch)routeMatch;
- (Matrix<double,)projectedPosition;
- (PolylineCoordinate)projectedCoordinate;
- (VKPuckAnimatorLocationProjector)init;
- (double)projectedCourse;
- (id).cxx_construct;
- (id)detailedDescription;
- (optional<double>)elevationInProjectedPostion;
- (optional<std::pair<geo::Mercator3<double>,)currentSnappedSegment;
- (void)_updateCourseAndPositionFromRouteMatch:(id)a3;
- (void)dealloc;
- (void)projectFromLocation:(id)a3 routeMatch:(id)a4 speedMultiplier:(double)a5 routeLine:(id)a6;
- (void)reset;
- (void)setAlwaysUseGoodRouteMatch:(BOOL)a3;
- (void)setProjectedRouteMatch:(id)a3;
- (void)setRouteMatch:(id)a3;
@end

@implementation VKPuckAnimatorLocationProjector

- (Matrix<double,)projectedPosition
{
  double v2 = self->_projectedPosition._e[0];
  double v3 = self->_projectedPosition._e[1];
  double v4 = self->_projectedPosition._e[2];
  result._e[2] = v4;
  result._e[1] = v3;
  result._e[0] = v2;
  return result;
}

- (PolylineCoordinate)projectedCoordinate
{
  return self->_projectedCoordinate;
}

- (BOOL)isProjectedPositionBehind
{
  return self->_isProjectedPositionBehind;
}

- (optional<double>)elevationInProjectedPostion
{
  ValueUnion value = self->_elevationInProjectedPosition._value;
  uint64_t v3 = *(void *)&self->_elevationInProjectedPosition._hasValue;
  result._ValueUnion value = value;
  result._hasValue = v3;
  return result;
}

- (optional<std::pair<geo::Mercator3<double>,)currentSnappedSegment
{
  long long v3 = *(_OWORD *)&self[1].__engaged_;
  *(_OWORD *)&retstr->var0.__null_state_ = *(_OWORD *)&self[1].var0.__val_.second._e[1];
  *(_OWORD *)&retstr->var0.__val_.first._e[2] = v3;
  *(_OWORD *)&retstr->var0.__val_.second._e[1] = *(_OWORD *)&self[2].var0.__val_.first._e[1];
  *(double *)&retstr->__engaged_ = self[2].var0.__val_.second._e[0];
  return self;
}

- (VKPuckAnimatorLocationProjector)init
{
  v6.receiver = self;
  v6.super_class = (Class)VKPuckAnimatorLocationProjector;
  double v2 = [(VKPuckAnimatorLocationProjector *)&v6 init];
  long long v3 = v2;
  if (v2)
  {
    [(VKPuckAnimatorLocationProjector *)v2 reset];
    double v4 = v3;
  }

  return v3;
}

- (void)reset
{
  self->_projectedPosition._e[0] = 0.0;
  self->_projectedPosition._e[1] = 0.0;
  self->_projectedPosition._e[2] = 0.0;
  if (self->_elevationInProjectedPosition._value.data[0]) {
    self->_elevationInProjectedPosition._value.data[0] = 0;
  }
  self->_projectedCourse = -1.0;
  [(VKPuckAnimatorLocationProjector *)self setRouteMatch:0];
  [(VKPuckAnimatorLocationProjector *)self setProjectedRouteMatch:0];
}

- (void)projectFromLocation:(id)a3 routeMatch:(id)a4 speedMultiplier:(double)a5 routeLine:(id)a6
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if (v11
    && [v11 isGoodMatch]
    && (([v11 shouldProjectLocationAlongRoute] & 1) != 0 || self->_alwaysUseGoodRouteMatch))
  {
    [v11 locationCoordinate];
    double v14 = v13;
    [v11 locationCoordinate];
    long long v53 = v15;
    long double v16 = tan(v14 * 0.00872664626 + 0.785398163);
    long double v17 = log(v16);
    *(void *)&v18.f64[0] = v53;
    v18.f64[1] = v17;
    __asm { FMOV            V1.2D, #0.5 }
    *(float64x2_t *)self->_projectedPosition._e = vmlaq_f64(_Q1, (float64x2_t)xmmword_1A28FCBE0, v18);
    self->_projectedPosition._e[2] = 0.0;
    [v11 matchedCourse];
    self->_projectedCourse = v24;
    [v10 speed];
    double v26 = v25;
    if (v10)
    {
      [v10 clientLocation];
      double v27 = v63;
    }
    else
    {
      double v27 = 0.0;
    }
    double v41 = v26 - v27;
    if (v41 <= 6.7 || (double v42 = fmin(v41, 38.0) * 0.0823045267 * (fmin(v41, 31.0) + -6.7) / a5, v42 <= 0.0))
    {
      if (!self->_projectedRouteMatch
        || !objc_msgSend(v11, "routeMatchBehind:")
        || ([v11 locationCoordinate],
            [(GEORouteMatch *)self->_projectedRouteMatch locationCoordinate],
            GEOCalculateDistance(),
            v47 >= 10.0))
      {
        -[VKPuckAnimatorLocationProjector setProjectedRouteMatch:](self, "setProjectedRouteMatch:", v11, v53);
      }
    }
    else
    {
      int BOOL = GEOConfigGetBOOL();
      v44 = [v11 route];
      v45 = [v44 routeMatchAtDistance:v11 from:0 stopAtEndOfTunnel:BOOL ^ 1u stopAtEndOfManeuver:0 date:v42];

      if (v45)
      {
        if (self->_projectedRouteMatch
          && self->_routeMatch
          && (objc_msgSend(v11, "routeMatchBehind:") & 1) == 0
          && [v45 routeMatchBehind:self->_projectedRouteMatch])
        {
          v46 = self->_projectedRouteMatch;

          v45 = v46;
        }
        -[VKPuckAnimatorLocationProjector setProjectedRouteMatch:](self, "setProjectedRouteMatch:", v45, v53);
      }
      else
      {
        [(VKPuckAnimatorLocationProjector *)self setProjectedRouteMatch:v11];
      }
    }
    if (GEOPolylineCoordinateIsValid())
    {
      v48 = [(VKPuckAnimatorLocationProjector *)self projectedRouteMatch];
      uint64_t v49 = [v48 routeCoordinate];
      unsigned int index = self->_maxTravelledCoordinate.index;
      BOOL v51 = index > v49
         || index == v49 && self->_maxTravelledCoordinate.offset >= *((float *)&v49 + 1);
      self->_isProjectedPositionBehind = v51;

      if (self->_isProjectedPositionBehind) {
        goto LABEL_40;
      }
    }
    else
    {
      self->_isProjectedPositionBehind = 0;
    }
    v52 = [(VKPuckAnimatorLocationProjector *)self projectedRouteMatch];
    self->_maxTravelledCoordinate = (PolylineCoordinate)[v52 routeCoordinate];

LABEL_40:
    -[VKPuckAnimatorLocationProjector setRouteMatch:](self, "setRouteMatch:", v11, (void)v53);
    [(VKPuckAnimatorLocationProjector *)self _updateCourseAndPositionFromRouteMatch:v12];
    goto LABEL_41;
  }
  [(VKPuckAnimatorLocationProjector *)self setRouteMatch:0];
  [(VKPuckAnimatorLocationProjector *)self setProjectedRouteMatch:0];
  v28 = (PolylineCoordinate *)MEMORY[0x1E4F64198];
  self->_maxTravelledCoordinate = (PolylineCoordinate)*MEMORY[0x1E4F64198];
  self->_isProjectedPositionBehind = 1;
  [v10 coordinate];
  double v30 = v29;
  [v10 coordinate];
  long long v54 = v31;
  long double v32 = tan(v30 * 0.00872664626 + 0.785398163);
  long double v33 = log(v32);
  *(void *)&v34.f64[0] = v54;
  v34.f64[1] = v33;
  __asm { FMOV            V1.2D, #0.5 }
  *(float64x2_t *)self->_projectedPosition._e = vmlaq_f64(_Q1, (float64x2_t)xmmword_1A28FCBE0, v34);
  self->_projectedPosition._e[2] = 0.0;
  if (self->_elevationInProjectedPosition._value.data[0]) {
    self->_elevationInProjectedPosition._value.data[0] = 0;
  }
  objc_msgSend(v10, "course", v54);
  self->_projectedCourse = v36;
  self->_projectedCoordinate = *v28;
  if (v11)
  {
    if (GEOGetVectorKitVKPuckAnimatorLocationProjectorLog(void)::onceToken != -1) {
      dispatch_once(&GEOGetVectorKitVKPuckAnimatorLocationProjectorLog(void)::onceToken, &__block_literal_global_35138);
    }
    v37 = (id)GEOGetVectorKitVKPuckAnimatorLocationProjectorLog(void)::log;
    if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
    {
      [v11 locationCoordinate3D];
      uint64_t v39 = v38;
      [v11 locationCoordinate3D];
      *(_DWORD *)buf = 134284289;
      uint64_t v56 = v39;
      __int16 v57 = 2049;
      uint64_t v58 = v40;
      __int16 v59 = 1024;
      int v60 = [v11 isGoodMatch];
      __int16 v61 = 1024;
      int v62 = [v11 shouldProjectLocationAlongRoute];
      _os_log_impl(&dword_1A1780000, v37, OS_LOG_TYPE_INFO, "[RouteSnapping] Route was matched at %{private}f, %{private}f but was poor quality, so no snapping occurred. routeMatch.isGoodMatch %d, routeMatch.shouldProjectLocationAlongRoute %d", buf, 0x22u);
    }
  }
LABEL_41:
}

- (void)setRouteMatch:(id)a3
{
}

- (void)setProjectedRouteMatch:(id)a3
{
}

- (id).cxx_construct
{
  *((void *)self + 6) = 0xBF80000000000000;
  *((unsigned char *)self + 64) = 0;
  *((unsigned char *)self + 72) = 0;
  *((unsigned char *)self + 88) = 0;
  *((unsigned char *)self + 136) = 0;
  *(void *)((char *)self + 148) = 0xBF80000000000000;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_projectedRouteMatch, 0);
  objc_storeStrong((id *)&self->_routeMatch, 0);
}

- (void)setAlwaysUseGoodRouteMatch:(BOOL)a3
{
  self->_alwaysUseGoodRouteMatch = a3;
}

- (BOOL)alwaysUseGoodRouteMatch
{
  return self->_alwaysUseGoodRouteMatch;
}

- (double)projectedCourse
{
  return self->_projectedCourse;
}

- (GEORouteMatch)projectedRouteMatch
{
  return self->_projectedRouteMatch;
}

- (GEORouteMatch)routeMatch
{
  return self->_routeMatch;
}

- (id)detailedDescription
{
  id v3 = objc_alloc(MEMORY[0x1E4F28E78]);
  double v4 = [(VKPuckAnimatorLocationProjector *)self description];
  v5 = (void *)[v3 initWithFormat:@"%@\n", v4];

  [v5 appendFormat:@"_routeMatch: %@\n", self->_routeMatch];
  [v5 appendFormat:@"_projectedRouteMatch: %@\n", self->_projectedRouteMatch];
  [v5 appendFormat:@"_projectedPosition: %f, %f, %f\n", *(void *)&self->_projectedPosition._e[0], *(void *)&self->_projectedPosition._e[1], *(void *)&self->_projectedPosition._e[2]];
  objc_msgSend(v5, "appendFormat:", @"_projectedCourse: %f\n", *(void *)&self->_projectedCourse);
  if (self->_alwaysUseGoodRouteMatch) {
    objc_super v6 = @"YES";
  }
  else {
    objc_super v6 = @"NO";
  }
  [v5 appendFormat:@"_alwaysUseGoodRouteMatch: %@", v6];
  return v5;
}

- (BOOL)projectedLocationOnRoute
{
  return self->_projectedRouteMatch != 0;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)projectedLocation
{
  long double v2 = self->_projectedPosition._e[0] * 6.28318531;
  long double v3 = exp(self->_projectedPosition._e[1] * 6.28318531 + -3.14159265);
  double v4 = atan(v3);
  long double v5 = fmod(v2, 6.28318531);
  long double v6 = fmod(v5 + 6.28318531, 6.28318531) * 57.2957795 + -180.0;
  double v7 = v4 * 114.591559 + -90.0;
  result.var1 = v6;
  result.var0 = v7;
  return result;
}

- (void)_updateCourseAndPositionFromRouteMatch:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    long double v5 = +[VKDebugSettings sharedSettings];
    if ([v5 enablePuckRouteLineSnapping])
    {
      [v4 snapRouteMatch:self->_projectedRouteMatch];
    }
    else
    {
      LOBYTE(v22) = 0;
      char v27 = 0;
    }

    if (v27)
    {
      *(double *)&self->_elevationInProjectedPosition._hasValue = v23;
      self->_elevationInProjectedPosition._value.data[0] = 1;
      *(_OWORD *)self->_projectedPosition._e = v22;
      self->_projectedPosition._e[2] = v23;
      if (self->_currentSnappedSegment.__engaged_)
      {
        *(_OWORD *)&self->_currentSnappedSegment.var0.__null_state_ = v24;
        *(_OWORD *)&self->_currentSnappedSegment.var0.__val_.first._e[2] = v25;
        *(_OWORD *)&self->_currentSnappedSegment.var0.__val_.second._e[1] = v26;
      }
      else
      {
        *(_OWORD *)&self->_currentSnappedSegment.var0.__null_state_ = v24;
        *(_OWORD *)&self->_currentSnappedSegment.var0.__val_.first._e[2] = v25;
        *(_OWORD *)&self->_currentSnappedSegment.var0.__val_.second._e[1] = v26;
        self->_currentSnappedSegment.__engaged_ = 1;
      }
LABEL_13:
      [(GEORouteMatch *)self->_projectedRouteMatch matchedCourse];
      self->_projectedCourse = v20;
      self->_projectedCoordinate = (PolylineCoordinate)[(GEORouteMatch *)self->_projectedRouteMatch routeCoordinate];

      return;
    }
  }
  else
  {
    LOBYTE(v22) = 0;
  }
  long double v6 = [(GEORouteMatch *)self->_projectedRouteMatch route];
  objc_msgSend(v6, "pointWithAltitudeCorrectionAtRouteCoordinate:", -[GEORouteMatch routeCoordinate](self->_projectedRouteMatch, "routeCoordinate"));
  *(void *)&self->_elevationInProjectedPosition._hasValue = v7;
  self->_elevationInProjectedPosition._value.data[0] = 1;

  [(GEORouteMatch *)self->_projectedRouteMatch locationCoordinate];
  double v9 = v8;
  [(GEORouteMatch *)self->_projectedRouteMatch locationCoordinate];
  long long v21 = v10;
  if (self->_elevationInProjectedPosition._value.data[0])
  {
    double v11 = *(double *)&self->_elevationInProjectedPosition._hasValue;
    long double v12 = tan(v9 * 0.00872664626 + 0.785398163);
    long double v13 = log(v12);
    *(void *)&v14.f64[0] = v21;
    v14.f64[1] = v13;
    __asm { FMOV            V1.2D, #0.5 }
    *(float64x2_t *)self->_projectedPosition._e = vmlaq_f64(_Q1, (float64x2_t)xmmword_1A28FCBE0, v14);
    self->_projectedPosition._e[2] = v11;
    if (self->_currentSnappedSegment.__engaged_) {
      self->_currentSnappedSegment.__engaged_ = 0;
    }
    goto LABEL_13;
  }
  std::__throw_bad_optional_access[abi:nn180100]();
  __break(1u);
}

- (void)dealloc
{
  [(VKPuckAnimatorLocationProjector *)self reset];
  v3.receiver = self;
  v3.super_class = (Class)VKPuckAnimatorLocationProjector;
  [(VKPuckAnimatorLocationProjector *)&v3 dealloc];
}

@end