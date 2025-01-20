@interface MNRouteDivergenceFinder
- (BOOL)_pathsDivergeBetweenRoute:(id)a3 from:(PolylineCoordinate)a4 andRoute:(id)a5 from:(PolylineCoordinate)a6 withinDistance:(double)a7;
- (BOOL)_pointMeetsConvergenceThreshold:(const _MNRouteConvergencePoint *)a3 withOtherPoint:(const _MNRouteConvergencePoint *)a4 outRouteCoordinateA:(PolylineCoordinate *)a5 outRouteCoordinateB:(PolylineCoordinate *)a6 outDistance:(double *)a7;
- (MNRouteDivergenceFinder)init;
- (PolylineCoordinate)_closestRouteCoordinateOnRoute:(id)a3 toLocationCoordinate:(id)a4 inRange:(GEOPolylineCoordinateRange)a5;
- (PolylineCoordinate)_firstRouteCoordinateWithinToleranceOnRoute:(id)a3 nearCoordinate:(id)a4 range:(GEOPolylineCoordinateRange)a5;
- (PolylineCoordinate)_routeCoordinateForLocationCoordinate:(id)a3 route:(id)a4 startIndex:(unint64_t)a5;
- (char)findOverlappingSectionsForRoutes:(uint64_t *)a1;
- (double)_distanceFromCoordinate:(id)a3 toSegmentStart:(id)a4 segmentEnd:(id)a5;
- (double)_offsetForCoordinate:(id)a3 alongSegmentStart:(id)a4 segmentEnd:(id)a5;
- (double)minLengthMetersForConvergence;
- (double)toleranceMeters;
- (float)findAllOverlapRangesBetweenRoutes:(uint64_t)a3;
- (id)_routesArrayIdentifierStrings:(id)a3;
- (id)_stringForCoordinate:(id)a3;
- (id)findAllDivergenceConvergenceBetweenRoute:(id)a3 andRoute:(id)a4;
- (id)findAllOverlapRangesBetweenRoutes:(id)a3;
- (id)findFirstConvergenceBetweenRoute:(id)a3 andRoute:(id)a4;
- (id)findFirstConvergenceBetweenRoute:(id)a3 fromRouteCoordinate:(PolylineCoordinate)a4 andRoute:(id)a5 fromRouteCoordinate:(PolylineCoordinate)a6;
- (id)findFirstDivergenceBetweenRoute:(id)a3 andRoute:(id)a4;
- (id)findFirstDivergenceBetweenRoute:(id)a3 fromRouteCoordinate:(PolylineCoordinate)a4 andRoute:(id)a5 fromRouteCoordinate:(PolylineCoordinate)a6;
- (id)findFirstUniqueRangeBetweenRoute:(id)a3 andRoute:(id)a4;
- (id)findOverlappingSectionsForRoutes:(id)a3;
- (uint64_t)findAllOverlapRangesBetweenRoutes:(uint64_t)a1;
- (uint64_t)findOverlappingSectionsForRoutes:;
- (uint64_t)findOverlappingSectionsForRoutes:(uint64_t)a1;
- (void)_findFirstConvergenceBetweenRoute:(id)a3 fromRouteCoordinate:(PolylineCoordinate)a4 andRoute:(id)a5 fromRouteCoordinate:(PolylineCoordinate)a6 outRouteCoordinate:(PolylineCoordinate *)a7 outRouteCoordinate:(PolylineCoordinate *)a8;
- (void)_findFirstConvergenceBetweenRoute:(id)a3 range:(GEOPolylineCoordinateRange)a4 andRoute:(id)a5 range:(GEOPolylineCoordinateRange)a6 outRouteCoordinate:(PolylineCoordinate *)a7 outRouteCoordinate:(PolylineCoordinate *)a8;
- (void)_findFirstConvergenceBetweenRoute:(uint64_t *)a1 range:(unint64_t)a2 andRoute:(uint64_t *)a3 range:(unint64_t)a4 outRouteCoordinate:(uint64_t)a5 outRouteCoordinate:(char)a6;
- (void)_findFirstDivergenceBetweenRoute:(id)a3 range:(GEOPolylineCoordinateRange)a4 andRoute:(id)a5 range:(GEOPolylineCoordinateRange)a6 outRouteCoordinate:(PolylineCoordinate *)a7 outRouteCoordinate:(PolylineCoordinate *)a8;
- (void)_populateConvergencePoints:(void *)a3 route:(id)a4 range:(GEOPolylineCoordinateRange)a5 isRouteA:(BOOL)a6;
- (void)findAllOverlapRangesBetweenRoutes:;
- (void)findAllOverlapRangesBetweenRoutes:(uint64_t)a1;
- (void)findOverlappingSectionsForRoutes:;
- (void)findOverlappingSectionsForRoutes:(void *)a1;
- (void)setMinLengthMetersForConvergence:(double)a3;
- (void)setToleranceMeters:(double)a3;
@end

@implementation MNRouteDivergenceFinder

- (MNRouteDivergenceFinder)init
{
  v3.receiver = self;
  v3.super_class = (Class)MNRouteDivergenceFinder;
  result = [(MNRouteDivergenceFinder *)&v3 init];
  if (result)
  {
    *(_OWORD *)&result->_toleranceMeters = xmmword_1B5542C60;
    result->_distancePaddingWhenAlternating = 20.0;
  }
  return result;
}

- (id)findFirstDivergenceBetweenRoute:(id)a3 andRoute:(id)a4
{
  v4 = [(MNRouteDivergenceFinder *)self findFirstDivergenceBetweenRoute:a3 fromRouteCoordinate:0 andRoute:a4 fromRouteCoordinate:0];
  return v4;
}

- (id)findFirstConvergenceBetweenRoute:(id)a3 andRoute:(id)a4
{
  v4 = [(MNRouteDivergenceFinder *)self findFirstConvergenceBetweenRoute:a3 fromRouteCoordinate:0 andRoute:a4 fromRouteCoordinate:0];
  return v4;
}

- (id)findFirstDivergenceBetweenRoute:(id)a3 fromRouteCoordinate:(PolylineCoordinate)a4 andRoute:(id)a5 fromRouteCoordinate:(PolylineCoordinate)a6
{
  v21[2] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  v12 = v11;
  v13 = 0;
  if (v10 && v11)
  {
    unint64_t v19 = 0xBF80000000000000;
    unint64_t v20 = 0xBF80000000000000;
    -[MNRouteDivergenceFinder _findFirstDivergenceBetweenRoute:range:andRoute:range:outRouteCoordinate:outRouteCoordinate:](self, "_findFirstDivergenceBetweenRoute:range:andRoute:range:outRouteCoordinate:outRouteCoordinate:", v10, a4, [v10 endRouteCoordinate], v11, a6, objc_msgSend(v11, "endRouteCoordinate"), &v20, &v19);
    v14 = objc_alloc_init(MNRouteDivergenceResult);
    v15 = [v10 uniqueRouteID];
    [(MNRouteDivergenceResult *)v14 setRouteID:v15];

    [(MNRouteDivergenceResult *)v14 setRouteCoordinate:v20];
    [v10 pointAtRouteCoordinate:v20];
    -[MNRouteDivergenceResult setLocationCoordinate:](v14, "setLocationCoordinate:");
    [(MNRouteDivergenceResult *)v14 setResultType:GEOPolylineCoordinateIsValid()];
    v16 = objc_alloc_init(MNRouteDivergenceResult);
    v17 = [v12 uniqueRouteID];
    [(MNRouteDivergenceResult *)v16 setRouteID:v17];

    [(MNRouteDivergenceResult *)v16 setRouteCoordinate:v19];
    [v12 pointAtRouteCoordinate:v19];
    -[MNRouteDivergenceResult setLocationCoordinate:](v16, "setLocationCoordinate:");
    [(MNRouteDivergenceResult *)v16 setResultType:GEOPolylineCoordinateIsValid()];
    v21[0] = v14;
    v21[1] = v16;
    v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:2];
  }
  return v13;
}

- (id)findFirstConvergenceBetweenRoute:(id)a3 fromRouteCoordinate:(PolylineCoordinate)a4 andRoute:(id)a5 fromRouteCoordinate:(PolylineCoordinate)a6
{
  v23[2] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  v12 = v11;
  v13 = 0;
  if (v10 && v11)
  {
    unint64_t v21 = 0xBF80000000000000;
    unint64_t v22 = 0xBF80000000000000;
    [(MNRouteDivergenceFinder *)self _findFirstConvergenceBetweenRoute:v10 fromRouteCoordinate:a4 andRoute:v11 fromRouteCoordinate:a6 outRouteCoordinate:&v22 outRouteCoordinate:&v21];
    v14 = objc_alloc_init(MNRouteDivergenceResult);
    v15 = [v10 uniqueRouteID];
    [(MNRouteDivergenceResult *)v14 setRouteID:v15];

    [(MNRouteDivergenceResult *)v14 setRouteCoordinate:v22];
    [v10 pointAtRouteCoordinate:v22];
    -[MNRouteDivergenceResult setLocationCoordinate:](v14, "setLocationCoordinate:");
    if (GEOPolylineCoordinateIsValid()) {
      uint64_t v16 = 2;
    }
    else {
      uint64_t v16 = 0;
    }
    [(MNRouteDivergenceResult *)v14 setResultType:v16];
    v17 = objc_alloc_init(MNRouteDivergenceResult);
    v18 = [v12 uniqueRouteID];
    [(MNRouteDivergenceResult *)v17 setRouteID:v18];

    [(MNRouteDivergenceResult *)v17 setRouteCoordinate:v21];
    [v12 pointAtRouteCoordinate:v21];
    -[MNRouteDivergenceResult setLocationCoordinate:](v17, "setLocationCoordinate:");
    if (GEOPolylineCoordinateIsValid()) {
      uint64_t v19 = 2;
    }
    else {
      uint64_t v19 = 0;
    }
    [(MNRouteDivergenceResult *)v17 setResultType:v19];
    v23[0] = v14;
    v23[1] = v17;
    v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:2];
  }
  return v13;
}

- (id)findFirstUniqueRangeBetweenRoute:(id)a3 andRoute:(id)a4
{
  v29[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  v9 = 0;
  if (v6 && v7)
  {
    id v10 = objc_alloc_init(MNRouteOverlapResult);
    id v11 = [v6 uniqueRouteID];
    [(MNRouteOverlapResult *)v10 setRouteID:v11];

    -[MNRouteOverlapResult setRouteRange:](v10, "setRouteRange:", 0, [v6 endRouteCoordinate]);
    v12 = objc_alloc_init(MNRouteOverlapResult);
    v13 = [v8 uniqueRouteID];
    [(MNRouteOverlapResult *)v12 setRouteID:v13];

    -[MNRouteOverlapResult setRouteRange:](v12, "setRouteRange:", 0, [v8 endRouteCoordinate]);
    v29[0] = v10;
    v29[1] = v12;
    v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:2];
    v14 = [(MNRouteDivergenceFinder *)self findFirstDivergenceBetweenRoute:v6 andRoute:v8];
    v15 = [v14 objectAtIndexedSubscript:0];
    uint64_t v16 = [v15 routeCoordinate];

    v17 = [v14 objectAtIndexedSubscript:1];
    uint64_t v18 = [v17 routeCoordinate];

    if ((GEOPolylineCoordinateIsInvalid() & 1) == 0 && (GEOPolylineCoordinateIsInvalid() & 1) == 0)
    {
      v27 = -[MNRouteDivergenceFinder findFirstConvergenceBetweenRoute:fromRouteCoordinate:andRoute:fromRouteCoordinate:](self, "findFirstConvergenceBetweenRoute:fromRouteCoordinate:andRoute:fromRouteCoordinate:", v6, [v6 routeCoordinateForDistance:v16 afterRouteCoordinate:self->_distancePaddingWhenAlternating], v8, objc_msgSend(v8, "routeCoordinateForDistance:afterRouteCoordinate:", v18, self->_distancePaddingWhenAlternating));
      uint64_t v19 = [v27 objectAtIndexedSubscript:0];
      uint64_t v20 = [v19 routeCoordinate];

      unint64_t v21 = [v27 objectAtIndexedSubscript:1];
      uint64_t v28 = [v21 routeCoordinate];

      if ((GEOPolylineCoordinateIsInvalid() & 1) != 0 || GEOPolylineCoordinateIsInvalid())
      {
        uint64_t v20 = [v6 endRouteCoordinate];
        uint64_t v28 = [v8 endRouteCoordinate];
      }
      id v22 = objc_alloc_init(MEMORY[0x1E4F64870]);
      [(MNRouteOverlapResult *)v10 setUniqueRanges:v22];

      v23 = [(MNRouteOverlapResult *)v10 uniqueRanges];
      objc_msgSend(v23, "addCoordinateRange:", v16, v20);

      id v24 = objc_alloc_init(MEMORY[0x1E4F64870]);
      [(MNRouteOverlapResult *)v12 setUniqueRanges:v24];

      v25 = [(MNRouteOverlapResult *)v12 uniqueRanges];
      objc_msgSend(v25, "addCoordinateRange:", v18, v28);
    }
  }

  return v9;
}

- (id)findAllDivergenceConvergenceBetweenRoute:(id)a3 andRoute:(id)a4
{
  v69[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = 0;
  v64 = v7;
  if (v6 && v7)
  {
    v9 = MNGetMNRouteDivergenceLog();
    os_signpost_id_t v10 = os_signpost_id_make_with_pointer(v9, self);

    id v11 = MNGetMNRouteDivergenceLog();
    v12 = v11;
    unint64_t v61 = v10 - 1;
    if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
    {
      v69[0] = v6;
      v69[1] = v64;
      v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v69 count:2];
      v14 = [(MNRouteDivergenceFinder *)self _routesArrayIdentifierStrings:v13];
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v14;
      _os_signpost_emit_with_name_impl(&dword_1B542B000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "findAllDivergenceConvergenceBetweenRoute", "%@", (uint8_t *)&buf, 0xCu);
    }
    *((void *)&buf + 1) = 0;
    uint64_t v68 = 0;
    *(void *)&long long buf = (char *)&buf + 8;
    v63 = [(MNRouteDivergenceFinder *)self findFirstConvergenceBetweenRoute:v6 fromRouteCoordinate:0 andRoute:v64 fromRouteCoordinate:0];
    if ([v63 count] == 2)
    {
      v15 = [v63 objectAtIndexedSubscript:0];
      [v15 routeCoordinate];
      int IsValid = GEOPolylineCoordinateIsValid();

      if (IsValid)
      {
        v17 = [v63 objectAtIndexedSubscript:0];
        uint64_t v18 = [v17 routeCoordinate];
        uint64_t v19 = [v63 objectAtIndexedSubscript:0];
        [v63 objectAtIndexedSubscript:1];
        *((void *)&v65 + 1) = *(void *)&long long v65 = v19;
        std::__tree<std::__value_type<geo::PolylineCoordinate,std::pair<MNRouteDivergenceResult * {__strong},MNRouteDivergenceResult * {__strong}>>,std::__map_value_compare<geo::PolylineCoordinate,std::__value_type<geo::PolylineCoordinate,std::pair<MNRouteDivergenceResult * {__strong},MNRouteDivergenceResult * {__strong}>>,std::less<geo::PolylineCoordinate>,true>,std::allocator<std::__value_type<geo::PolylineCoordinate,std::pair<MNRouteDivergenceResult * {__strong},MNRouteDivergenceResult * {__strong}>>>>::__emplace_unique_key_args<geo::PolylineCoordinate,geo::PolylineCoordinate,std::pair<MNRouteDivergenceResult * {__strong},MNRouteDivergenceResult * {__strong}>>((uint64_t **)&buf, v18, v18, &v65, *((float *)&v18 + 1));
      }
    }
    v62 = [(MNRouteDivergenceFinder *)self findFirstDivergenceBetweenRoute:v6 fromRouteCoordinate:0 andRoute:v64 fromRouteCoordinate:0];
    if ([v62 count] == 2)
    {
      uint64_t v20 = [v62 objectAtIndexedSubscript:0];
      [v20 routeCoordinate];
      int v21 = GEOPolylineCoordinateIsValid();

      if (v21)
      {
        id v22 = [v62 objectAtIndexedSubscript:0];
        uint64_t v23 = [v22 routeCoordinate];
        uint64_t v24 = [v62 objectAtIndexedSubscript:0];
        uint64_t v25 = [v62 objectAtIndexedSubscript:1];
        *(void *)&long long v65 = v24;
        *((void *)&v65 + 1) = v25;
        std::__tree<std::__value_type<geo::PolylineCoordinate,std::pair<MNRouteDivergenceResult * {__strong},MNRouteDivergenceResult * {__strong}>>,std::__map_value_compare<geo::PolylineCoordinate,std::__value_type<geo::PolylineCoordinate,std::pair<MNRouteDivergenceResult * {__strong},MNRouteDivergenceResult * {__strong}>>,std::less<geo::PolylineCoordinate>,true>,std::allocator<std::__value_type<geo::PolylineCoordinate,std::pair<MNRouteDivergenceResult * {__strong},MNRouteDivergenceResult * {__strong}>>>>::__emplace_unique_key_args<geo::PolylineCoordinate,geo::PolylineCoordinate,std::pair<MNRouteDivergenceResult * {__strong},MNRouteDivergenceResult * {__strong}>>((uint64_t **)&buf, v23, v23, &v65, *((float *)&v23 + 1));
      }
    }
    if (v68)
    {
      uint64_t v26 = *((void *)&buf + 1);
      if (*((void *)&buf + 1))
      {
        do
        {
          v27 = (char *)v26;
          uint64_t v26 = *(void *)(v26 + 8);
        }
        while (v26);
      }
      else
      {
        v30 = (char *)&buf + 8;
        do
        {
          v27 = (char *)*((void *)v30 + 2);
          BOOL v31 = *(void *)v27 == (void)v30;
          v30 = v27;
        }
        while (v31);
      }
      while (1)
      {
        id v45 = *((id *)v27 + 5);
        id v46 = *((id *)v27 + 6);
        uint64_t v47 = objc_msgSend(v6, "routeCoordinateForDistance:afterRouteCoordinate:", objc_msgSend(v45, "routeCoordinate"), self->_distancePaddingWhenAlternating);
        uint64_t v48 = objc_msgSend(v64, "routeCoordinateForDistance:afterRouteCoordinate:", objc_msgSend(v46, "routeCoordinate"), self->_distancePaddingWhenAlternating);
        uint64_t v49 = [v6 endRouteCoordinate];
        if (v47 > v49
          || v47 == v49 && *((float *)&v47 + 1) >= *((float *)&v49 + 1))
        {
          break;
        }
        uint64_t v32 = [v64 endRouteCoordinate];
        if (v48 > v32
          || v48 == v32 && *((float *)&v48 + 1) >= *((float *)&v32 + 1))
        {
          break;
        }
        uint64_t v33 = [v45 resultType];
        if (v33 == 1) {
          [(MNRouteDivergenceFinder *)self findFirstConvergenceBetweenRoute:v6 fromRouteCoordinate:v47 andRoute:v64 fromRouteCoordinate:v48];
        }
        else {
        v34 = [(MNRouteDivergenceFinder *)self findFirstDivergenceBetweenRoute:v6 fromRouteCoordinate:v47 andRoute:v64 fromRouteCoordinate:v48];
        }
        if ([v34 count] != 2) {
          goto LABEL_43;
        }
        v35 = [v34 objectAtIndexedSubscript:0];
        [v35 routeCoordinate];
        if (GEOPolylineCoordinateIsInvalid()) {
          goto LABEL_42;
        }
        v36 = [v34 objectAtIndexedSubscript:1];
        [v36 routeCoordinate];
        char IsInvalid = GEOPolylineCoordinateIsInvalid();

        if (IsInvalid) {
          goto LABEL_43;
        }
        if (v33 == 1) {
          uint64_t v38 = 2;
        }
        else {
          uint64_t v38 = 1;
        }
        v35 = [v34 objectAtIndexedSubscript:0];
        if ([v35 resultType] != v38)
        {
LABEL_42:

LABEL_43:
          break;
        }
        v39 = [v34 objectAtIndexedSubscript:1];
        BOOL v40 = [v39 resultType] == v38;

        if (!v40) {
          goto LABEL_43;
        }
        v41 = [v34 objectAtIndexedSubscript:0];
        uint64_t v42 = [v41 routeCoordinate];
        uint64_t v43 = [v34 objectAtIndexedSubscript:0];
        uint64_t v44 = [v34 objectAtIndexedSubscript:1];
        *(void *)&long long v65 = v43;
        *((void *)&v65 + 1) = v44;
        v27 = std::__tree<std::__value_type<geo::PolylineCoordinate,std::pair<MNRouteDivergenceResult * {__strong},MNRouteDivergenceResult * {__strong}>>,std::__map_value_compare<geo::PolylineCoordinate,std::__value_type<geo::PolylineCoordinate,std::pair<MNRouteDivergenceResult * {__strong},MNRouteDivergenceResult * {__strong}>>,std::less<geo::PolylineCoordinate>,true>,std::allocator<std::__value_type<geo::PolylineCoordinate,std::pair<MNRouteDivergenceResult * {__strong},MNRouteDivergenceResult * {__strong}>>>>::__emplace_unique_key_args<geo::PolylineCoordinate,geo::PolylineCoordinate,std::pair<MNRouteDivergenceResult * {__strong},MNRouteDivergenceResult * {__strong}>>((uint64_t **)&buf, v42, v42, &v65, *((float *)&v42 + 1));
      }
      v29 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v68];
      v50 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v68];
      v51 = (void *)buf;
      if ((long long *)buf != (long long *)((char *)&buf + 8))
      {
        do
        {
          [v29 addObject:v51[5]];
          [v50 addObject:v51[6]];
          v52 = (void *)v51[1];
          if (v52)
          {
            do
            {
              v53 = v52;
              v52 = (void *)*v52;
            }
            while (v52);
          }
          else
          {
            do
            {
              v53 = (_OWORD *)v51[2];
              BOOL v31 = *(void *)v53 == (void)v51;
              v51 = v53;
            }
            while (!v31);
          }
          v51 = v53;
        }
        while (v53 != (long long *)((char *)&buf + 8));
      }
      v54 = objc_alloc_init(MNRouteDivergenceResults);
      v55 = [v6 uniqueRouteID];
      [(MNRouteDivergenceResults *)v54 setRouteID:v55];

      [(MNRouteDivergenceResults *)v54 setResults:v29];
      v56 = objc_alloc_init(MNRouteDivergenceResults);
      v57 = [v64 uniqueRouteID];
      [(MNRouteDivergenceResults *)v56 setRouteID:v57];

      [(MNRouteDivergenceResults *)v56 setResults:v50];
      v58 = MNGetMNRouteDivergenceLog();
      v59 = v58;
      if (v61 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v58))
      {
        LOWORD(v65) = 0;
        _os_signpost_emit_with_name_impl(&dword_1B542B000, v59, OS_SIGNPOST_INTERVAL_END, v10, "findAllDivergenceConvergenceBetweenRoute", "", (uint8_t *)&v65, 2u);
      }

      v66[0] = v54;
      v66[1] = v56;
      v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v66 count:2];
    }
    else
    {
      uint64_t v28 = MNGetMNRouteDivergenceLog();
      v29 = v28;
      if (v61 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
      {
        LOWORD(v65) = 0;
        _os_signpost_emit_with_name_impl(&dword_1B542B000, v29, OS_SIGNPOST_INTERVAL_END, v10, "findAllDivergenceConvergenceBetweenRoute", "orderedResults empty", (uint8_t *)&v65, 2u);
      }
      v8 = 0;
    }

    std::__tree<std::__value_type<geo::PolylineCoordinate,std::pair<MNRouteDivergenceResult * {__strong},MNRouteDivergenceResult * {__strong}>>,std::__map_value_compare<geo::PolylineCoordinate,std::__value_type<geo::PolylineCoordinate,std::pair<MNRouteDivergenceResult * {__strong},MNRouteDivergenceResult * {__strong}>>,std::less<geo::PolylineCoordinate>,true>,std::allocator<std::__value_type<geo::PolylineCoordinate,std::pair<MNRouteDivergenceResult * {__strong},MNRouteDivergenceResult * {__strong}>>>>::destroy(*((void **)&buf + 1));
  }

  return v8;
}

- (id)findAllOverlapRangesBetweenRoutes:(id)a3
{
  uint64_t v136 = *MEMORY[0x1E4F143B8];
  id v110 = a3;
  if ([v110 count])
  {
    v4 = MNGetMNRouteDivergenceLog();
    os_signpost_id_t v5 = os_signpost_id_make_with_pointer(v4, self);

    id v6 = MNGetMNRouteDivergenceLog();
    id v7 = v6;
    os_signpost_id_t spid = v5;
    unint64_t v105 = v5 - 1;
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
    {
      v8 = [(MNRouteDivergenceFinder *)self _routesArrayIdentifierStrings:v110];
      buf[0].i32[0] = 138412290;
      *(int8x8_t *)((char *)buf + 4) = (int8x8_t)v8;
      _os_signpost_emit_with_name_impl(&dword_1B542B000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "findAllOverlapRangesBetweenRoutes", "%@", (uint8_t *)buf, 0xCu);
    }
    objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v110, "count"));
    id v106 = (id)objc_claimAutoreleasedReturnValue();
    unint64_t v9 = [v110 count];
    unint64_t v11 = v9;
    v130 = 0;
    v131 = 0;
    v132 = 0;
    buf[0] = (int8x8_t)&v130;
    buf[1].i8[0] = 0;
    if (v9)
    {
      if (v9 > 0xAAAAAAAAAAAAAAALL) {
        std::vector<CLMapsRouteHint>::__throw_length_error[abi:ne180100]();
      }
      v12 = (char *)operator new(24 * v9);
      v130 = v12;
      v132 = &v12[24 * v11];
      size_t v13 = 24 * ((24 * v11 - 24) / 0x18) + 24;
      bzero(v12, v13);
      v131 = &v12[v13];
    }
    unint64_t v14 = 0;
    *(void *)&long long v10 = 136315906;
    long long v103 = v10;
    while (v14 < objc_msgSend(v110, "count", v103))
    {
      v109 = [v110 objectAtIndexedSubscript:v14];
      v15 = (unint64_t *)&v130[24 * v14];
      unint64_t v112 = v14;
      unint64_t v16 = v14 + 1;
      v121 = (__n128 **)(v15 + 1);
      v118 = v15 + 2;
      unint64_t v107 = v14 + 1;
      v114 = v15;
      while (v16 < [v110 count])
      {
        uint64_t v18 = [v110 objectAtIndexedSubscript:v16];
        v116 = v130;
        uint64_t v19 = [(MNRouteDivergenceFinder *)self findAllDivergenceConvergenceBetweenRoute:v109 andRoute:v18];
        if ([v19 count] != 2)
        {
          v55 = GEOFindOrCreateLog();
          if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
          {
            buf[0].i32[0] = v103;
            *(int8x8_t *)((char *)buf + 4) = (int8x8_t)"-[MNRouteDivergenceFinder findAllOverlapRangesBetweenRoutes:]";
            buf[1].i16[2] = 2080;
            *(int8x8_t *)((char *)&buf[1] + 6) = (int8x8_t)"/Library/Caches/com.apple.xbs/Sources/Navigation/Misc/MNRoute"
                                                           "DivergenceFinder.mm";
            buf[2].i16[3] = 1024;
            buf[3].i32[0] = 429;
            buf[3].i16[2] = 2080;
            *(int8x8_t *)((char *)&buf[3] + 6) = (int8x8_t)"divergenceConvergenceResult.count == 2";
            _os_log_impl(&dword_1B542B000, v55, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s)", (uint8_t *)buf, 0x26u);
          }
        }
        if ([v19 count] != 2)
        {

          break;
        }
        long long v128 = 0u;
        long long v129 = 0u;
        long long v126 = 0u;
        long long v127 = 0u;
        uint64_t v20 = [v19 objectAtIndexedSubscript:0];
        int v21 = [v20 results];

        uint64_t v22 = [v21 countByEnumeratingWithState:&v126 objects:v135 count:16];
        v119 = v19;
        v120 = v18;
        unint64_t v115 = v16;
        if (v22)
        {
          uint64_t v23 = *(void *)v127;
          do
          {
            for (uint64_t i = 0; i != v22; ++i)
            {
              if (*(void *)v127 != v23) {
                objc_enumerationMutation(v21);
              }
              uint64_t v25 = *(void **)(*((void *)&v126 + 1) + 8 * i);
              uint64_t v26 = [v25 routeCoordinate];
              BOOL v27 = [v25 resultType] == 2;
              uint64_t v28 = *v121;
              if ((unint64_t)*v121 >= *v118)
              {
                v30 = (__n128 *)*v114;
                unint64_t v3 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)((uint64_t)v28 - *v114) >> 3);
                unint64_t v31 = v3 + 1;
                if (v3 + 1 > 0xAAAAAAAAAAAAAAALL) {
                  std::vector<CLMapsRouteHint>::__throw_length_error[abi:ne180100]();
                }
                if (0x5555555555555556 * ((uint64_t)(*v118 - (void)v30) >> 3) > v31) {
                  unint64_t v31 = 0x5555555555555556 * ((uint64_t)(*v118 - (void)v30) >> 3);
                }
                if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*v118 - (void)v30) >> 3) >= 0x555555555555555) {
                  unint64_t v32 = 0xAAAAAAAAAAAAAAALL;
                }
                else {
                  unint64_t v32 = v31;
                }
                if (v32)
                {
                  if (v32 > 0xAAAAAAAAAAAAAAALL) {
                    std::__throw_bad_array_new_length[abi:ne180100]();
                  }
                  uint64_t v33 = (char *)operator new(24 * v32);
                }
                else
                {
                  uint64_t v33 = 0;
                }
                v34 = &v33[24 * v3];
                *(void *)v34 = v26;
                *((void *)v34 + 1) = v115;
                v34[16] = v27;
                v35 = v34;
                if (v28 == v30)
                {
                  uint64_t v18 = v120;
                  v37 = v114;
                }
                else
                {
                  uint64_t v18 = v120;
                  do
                  {
                    long long v36 = *(long long *)((char *)&v28[-2] + 8);
                    *(v35 - 8) = v28[-1].n128_i8[8];
                    *(_OWORD *)(v35 - 24) = v36;
                    v35 -= 24;
                    uint64_t v28 = (__n128 *)((char *)v28 - 24);
                  }
                  while (v28 != v30);
                  v37 = v114;
                  uint64_t v28 = (__n128 *)*v114;
                }
                unint64_t *v37 = (unint64_t)v35;
                v29 = (__n128 *)(v34 + 24);
                *v121 = (__n128 *)(v34 + 24);
                void *v118 = &v33[24 * v32];
                if (v28) {
                  operator delete(v28);
                }
              }
              else
              {
                v28->n128_u64[0] = v26;
                v28->n128_u64[1] = v115;
                v29 = (__n128 *)((char *)v28 + 24);
                v28[1].n128_u8[0] = v27;
                uint64_t v18 = v120;
              }
              uint64_t v19 = v119;
              *v121 = v29;
            }
            uint64_t v22 = [v21 countByEnumeratingWithState:&v126 objects:v135 count:16];
          }
          while (v22);
        }

        long long v124 = 0u;
        long long v125 = 0u;
        long long v122 = 0u;
        long long v123 = 0u;
        uint64_t v38 = [v19 objectAtIndexedSubscript:1];
        obuint64_t j = [v38 results];

        uint64_t v39 = [obj countByEnumeratingWithState:&v122 objects:v134 count:16];
        if (v39)
        {
          BOOL v40 = &v116[24 * v115];
          uint64_t v113 = *(void *)v123;
          v41 = (void **)(v40 + 8);
          v117 = v40 + 16;
          do
          {
            for (uint64_t j = 0; j != v39; ++j)
            {
              if (*(void *)v123 != v113) {
                objc_enumerationMutation(obj);
              }
              uint64_t v43 = *(void **)(*((void *)&v122 + 1) + 8 * j);
              uint64_t v44 = [v43 routeCoordinate];
              BOOL v45 = [v43 resultType] == 2;
              id v46 = *v41;
              if ((unint64_t)*v41 >= *v117)
              {
                unint64_t v3 = *(void *)v40;
                unint64_t v48 = 0xAAAAAAAAAAAAAAABLL * (((uint64_t)v46 - *(void *)v40) >> 3);
                unint64_t v49 = v48 + 1;
                if (v48 + 1 > 0xAAAAAAAAAAAAAAALL) {
                  std::vector<CLMapsRouteHint>::__throw_length_error[abi:ne180100]();
                }
                if (0x5555555555555556 * ((uint64_t)(*v117 - v3) >> 3) > v49) {
                  unint64_t v49 = 0x5555555555555556 * ((uint64_t)(*v117 - v3) >> 3);
                }
                if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*v117 - v3) >> 3) >= 0x555555555555555) {
                  unint64_t v50 = 0xAAAAAAAAAAAAAAALL;
                }
                else {
                  unint64_t v50 = v49;
                }
                if (v50)
                {
                  if (v50 > 0xAAAAAAAAAAAAAAALL) {
                    std::__throw_bad_array_new_length[abi:ne180100]();
                  }
                  v51 = (char *)operator new(24 * v50);
                }
                else
                {
                  v51 = 0;
                }
                v52 = &v51[24 * v48];
                *(void *)v52 = v44;
                *((void *)v52 + 1) = v112;
                v52[16] = v45;
                v53 = v52;
                if (v46 == (void *)v3)
                {
                  uint64_t v19 = v119;
                }
                else
                {
                  uint64_t v19 = v119;
                  do
                  {
                    long long v54 = *(_OWORD *)(v46 - 3);
                    *(v53 - 8) = *((unsigned char *)v46 - 8);
                    *(_OWORD *)(v53 - 24) = v54;
                    v53 -= 24;
                    v46 -= 3;
                  }
                  while (v46 != (void *)v3);
                  id v46 = *(void **)v40;
                }
                *(void *)BOOL v40 = v53;
                uint64_t v47 = v52 + 24;
                void *v41 = v52 + 24;
                void *v117 = &v51[24 * v50];
                if (v46) {
                  operator delete(v46);
                }
                uint64_t v18 = v120;
              }
              else
              {
                *id v46 = v44;
                v46[1] = v112;
                uint64_t v47 = v46 + 3;
                *((unsigned char *)v46 + 16) = v45;
                uint64_t v19 = v119;
                uint64_t v18 = v120;
              }
              void *v41 = v47;
            }
            uint64_t v39 = [obj countByEnumeratingWithState:&v122 objects:v134 count:16];
          }
          while (v39);
        }

        v15 = v114;
        unint64_t v16 = v115 + 1;
      }
      unint64_t v56 = 126 - 2 * __clz(0xAAAAAAAAAAAAAAABLL * ((uint64_t)((uint64_t)*v121 - *v15) >> 3));
      if (*v121 == (__n128 *)*v15) {
        uint64_t v57 = 0;
      }
      else {
        uint64_t v57 = v56;
      }
      *(float *)&double v58 = std::__introsort<std::_ClassicAlgPolicy,-[MNRouteDivergenceFinder findAllOverlapRangesBetweenRoutes:]::$_0 &,-[MNRouteDivergenceFinder findAllOverlapRangesBetweenRoutes:]::OverlapCoordinate *,false>(*v15, *v121, v57, 1, v17);
      uint64_t v59 = objc_msgSend(v110, "count", v58);
      memset(buf, 0, 32);
      buf[4].i32[0] = 1065353216;
      std::__hash_table<-[MNRouteDivergenceFinder findAllOverlapRangesBetweenRoutes:]::OverlapCoordinate,-[MNRouteDivergenceFinder findAllOverlapRangesBetweenRoutes:]::$_1,-[MNRouteDivergenceFinder findAllOverlapRangesBetweenRoutes:]::$_2,std::allocator<-[MNRouteDivergenceFinder findAllOverlapRangesBetweenRoutes:]::OverlapCoordinate>>::__rehash_unique[abi:ne180100]((uint64_t)buf, v59 - 1);
      id v60 = objc_alloc_init(MEMORY[0x1E4F64870]);
      id v61 = objc_alloc_init(MEMORY[0x1E4F64870]);
      unint64_t v62 = *MEMORY[0x1E4F641A0];
      v63 = (__n128 *)*v15;
      v64 = *v121;
      unint64_t v65 = *MEMORY[0x1E4F641A0];
LABEL_76:
      if (v63 != v64)
      {
        if (v63[1].n128_u8[0])
        {
          if (!*(void *)&buf[3])
          {
            unint64_t v62 = v63->n128_u64[0];
            if (GEOPolylineCoordinateRangeIsValid()) {
              objc_msgSend(v60, "addCoordinateRange:", v65, v62);
            }
          }
          unint64_t v66 = v63->n128_u64[1];
          unint64_t v67 = (unint64_t)buf[1];
          if (buf[1])
          {
            uint8x8_t v68 = (uint8x8_t)vcnt_s8(buf[1]);
            v68.i16[0] = vaddlv_u8(v68);
            if (v68.u32[0] > 1uLL)
            {
              unint64_t v3 = v63->n128_u64[1];
              if (v66 >= *(void *)&buf[1]) {
                unint64_t v3 = v66 % *(void *)&buf[1];
              }
            }
            else
            {
              unint64_t v3 = (*(void *)&buf[1] - 1) & v66;
            }
            v73 = *(void **)(*(void *)buf + 8 * v3);
            if (v73)
            {
              for (k = (void *)*v73; k; k = (void *)*k)
              {
                unint64_t v75 = k[1];
                if (v75 == v66)
                {
                  if (k[3] == v66) {
                    goto LABEL_168;
                  }
                }
                else
                {
                  if (v68.u32[0] > 1uLL)
                  {
                    if (v75 >= *(void *)&buf[1]) {
                      v75 %= *(void *)&buf[1];
                    }
                  }
                  else
                  {
                    v75 &= *(void *)&buf[1] - 1;
                  }
                  if (v75 != v3) {
                    break;
                  }
                }
              }
            }
          }
          v76 = (__n128 *)operator new(0x28uLL);
          v76->n128_u64[0] = 0;
          v76->n128_u64[1] = v66;
          __n128 v77 = *v63;
          v76[2].n128_u64[0] = v63[1].n128_u64[0];
          v76[1] = v77;
          float v78 = (float)(unint64_t)(*(void *)&buf[3] + 1);
          if (!v67 || (float)(*(float *)buf[4].i32 * (float)v67) < v78)
          {
            BOOL v79 = (v67 & (v67 - 1)) != 0;
            if (v67 < 3) {
              BOOL v79 = 1;
            }
            unint64_t v80 = v79 | (2 * v67);
            unint64_t v81 = vcvtps_u32_f32(v78 / *(float *)buf[4].i32);
            if (v80 <= v81) {
              size_t v82 = v81;
            }
            else {
              size_t v82 = v80;
            }
            std::__hash_table<-[MNRouteDivergenceFinder findAllOverlapRangesBetweenRoutes:]::OverlapCoordinate,-[MNRouteDivergenceFinder findAllOverlapRangesBetweenRoutes:]::$_1,-[MNRouteDivergenceFinder findAllOverlapRangesBetweenRoutes:]::$_2,std::allocator<-[MNRouteDivergenceFinder findAllOverlapRangesBetweenRoutes:]::OverlapCoordinate>>::__rehash_unique[abi:ne180100]((uint64_t)buf, v82);
            unint64_t v67 = (unint64_t)buf[1];
            if ((*(void *)&buf[1] & (*(void *)&buf[1] - 1)) != 0)
            {
              if (v66 >= *(void *)&buf[1]) {
                unint64_t v3 = v66 % *(void *)&buf[1];
              }
              else {
                unint64_t v3 = v66;
              }
            }
            else
            {
              unint64_t v3 = (*(void *)&buf[1] - 1) & v66;
            }
          }
          int8x8_t v87 = buf[0];
          v88 = *(__n128 ***)(*(void *)buf + 8 * v3);
          if (v88)
          {
            v76->n128_u64[0] = (unint64_t)*v88;
            goto LABEL_135;
          }
          v76->n128_u64[0] = (unint64_t)buf[2];
          buf[2] = (int8x8_t)v76;
          *(void *)(*(void *)&v87 + 8 * v3) = &buf[2];
          if (v76->n128_u64[0])
          {
            unint64_t v89 = *(void *)(v76->n128_u64[0] + 8);
            if ((v67 & (v67 - 1)) != 0)
            {
              if (v89 >= v67) {
                v89 %= v67;
              }
            }
            else
            {
              v89 &= v67 - 1;
            }
            v88 = (__n128 **)(*(void *)buf + 8 * v89);
LABEL_135:
            *v88 = v76;
          }
          ++*(void *)&buf[3];
          goto LABEL_168;
        }
        int8x8_t v69 = buf[1];
        if (!*(void *)&buf[1]) {
          goto LABEL_165;
        }
        unint64_t v70 = v63->n128_u64[1];
        uint8x8_t v71 = (uint8x8_t)vcnt_s8(buf[1]);
        v71.i16[0] = vaddlv_u8(v71);
        if (v71.u32[0] > 1uLL)
        {
          unint64_t v72 = v63->n128_u64[1];
          if (v70 >= *(void *)&buf[1]) {
            unint64_t v72 = v70 % *(void *)&buf[1];
          }
        }
        else
        {
          unint64_t v72 = (*(void *)&buf[1] - 1) & v70;
        }
        v83 = *(int8x8_t ***)(*(void *)buf + 8 * v72);
        if (!v83) {
          goto LABEL_165;
        }
        v84 = *v83;
        if (!*v83) {
          goto LABEL_165;
        }
        uint64_t v85 = *(void *)&buf[1] - 1;
        while (1)
        {
          unint64_t v86 = (unint64_t)v84[1];
          if (v86 == v70)
          {
            if (*(void *)&v84[3] == v70)
            {
              if (v71.u32[0] > 1uLL)
              {
                if (v70 >= *(void *)&buf[1]) {
                  v70 %= *(void *)&buf[1];
                }
              }
              else
              {
                v70 &= v85;
              }
              v90 = (int8x8_t *)*v84;
              v91 = *(int8x8_t **)(*(void *)buf + 8 * v70);
              do
              {
                v92 = v91;
                v91 = (int8x8_t *)*v91;
              }
              while (v91 != v84);
              if (v92 == &buf[2]) {
                goto LABEL_154;
              }
              int8x8_t v93 = v92[1];
              if (v71.u32[0] > 1uLL)
              {
                if (*(void *)&v93 >= *(void *)&buf[1]) {
                  *(void *)&v93 %= *(void *)&buf[1];
                }
              }
              else
              {
                *(void *)&v93 &= v85;
              }
              if (*(void *)&v93 == v70)
              {
LABEL_156:
                if (v90)
                {
                  unint64_t v94 = (unint64_t)v90[1];
                  goto LABEL_158;
                }
              }
              else
              {
LABEL_154:
                if (!v90) {
                  goto LABEL_155;
                }
                unint64_t v94 = (unint64_t)v90[1];
                if (v71.u32[0] > 1uLL)
                {
                  int8x8_t v95 = v90[1];
                  if (v94 >= *(void *)&buf[1]) {
                    int8x8_t v95 = (int8x8_t)(v94 % *(void *)&buf[1]);
                  }
                }
                else
                {
                  int8x8_t v95 = (int8x8_t)(v94 & v85);
                }
                if (*(void *)&v95 != v70)
                {
LABEL_155:
                  *(void *)(*(void *)buf + 8 * v70) = 0;
                  v90 = (int8x8_t *)*v84;
                  goto LABEL_156;
                }
LABEL_158:
                if (v71.u32[0] > 1uLL)
                {
                  if (v94 >= *(void *)&v69) {
                    v94 %= *(void *)&v69;
                  }
                }
                else
                {
                  v94 &= v85;
                }
                if (v94 != v70)
                {
                  *(void *)(*(void *)buf + 8 * v94) = v92;
                  v90 = (int8x8_t *)*v84;
                }
              }
              int8x8_t *v92 = (int8x8_t)v90;
              int8x8_t *v84 = 0;
              --*(void *)&buf[3];
              operator delete(v84);
LABEL_165:
              if (!*(void *)&buf[3])
              {
                unint64_t v65 = v63->n128_u64[0];
                if (GEOPolylineCoordinateRangeIsValid()) {
                  objc_msgSend(v61, "addCoordinateRange:", v62, v65);
                }
              }
LABEL_168:
              v63 = (__n128 *)((char *)v63 + 24);
              goto LABEL_76;
            }
          }
          else
          {
            if (v71.u32[0] > 1uLL)
            {
              if (v86 >= *(void *)&buf[1]) {
                v86 %= *(void *)&buf[1];
              }
            }
            else
            {
              v86 &= v85;
            }
            if (v86 != v72) {
              goto LABEL_165;
            }
          }
          v84 = (int8x8_t *)*v84;
          if (!v84) {
            goto LABEL_165;
          }
        }
      }
      if (buf[3])
      {
        uint64_t v96 = [v109 endRouteCoordinate];
        if (GEOPolylineCoordinateRangeIsValid())
        {
          v97 = v61;
          unint64_t v65 = v62;
          goto LABEL_174;
        }
      }
      else
      {
        uint64_t v96 = [v109 endRouteCoordinate];
        if (GEOPolylineCoordinateRangeIsValid())
        {
          v97 = v60;
LABEL_174:
          objc_msgSend(v97, "addCoordinateRange:", v65, v96);
        }
      }
      v98 = objc_alloc_init(MNRouteOverlapResult);
      v99 = [v109 uniqueRouteID];
      [(MNRouteOverlapResult *)v98 setRouteID:v99];

      -[MNRouteOverlapResult setRouteRange:](v98, "setRouteRange:", 0, [v109 endRouteCoordinate]);
      [(MNRouteOverlapResult *)v98 setUniqueRanges:v60];
      [(MNRouteOverlapResult *)v98 setOverlapRanges:v61];
      [v106 addObject:v98];

      std::__hash_table<-[MNRouteDivergenceFinder findAllOverlapRangesBetweenRoutes:]::OverlapCoordinate,-[MNRouteDivergenceFinder findAllOverlapRangesBetweenRoutes:]::$_1,-[MNRouteDivergenceFinder findAllOverlapRangesBetweenRoutes:]::$_2,std::allocator<-[MNRouteDivergenceFinder findAllOverlapRangesBetweenRoutes:]::OverlapCoordinate>>::~__hash_table((uint64_t)buf);
      unint64_t v14 = v107;
    }
    v100 = MNGetMNRouteDivergenceLog();
    v101 = v100;
    if (v105 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v100))
    {
      buf[0].i16[0] = 0;
      _os_signpost_emit_with_name_impl(&dword_1B542B000, v101, OS_SIGNPOST_INTERVAL_END, spid, "findAllOverlapRangesBetweenRoutes", "", (uint8_t *)buf, 2u);
    }

    buf[0] = (int8x8_t)&v130;
    std::vector<std::vector<-[MNRouteDivergenceFinder findAllOverlapRangesBetweenRoutes:]::OverlapCoordinate>>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);
  }
  else
  {
    id v106 = 0;
  }

  return v106;
}

- (id)findOverlappingSectionsForRoutes:(id)a3
{
  uint64_t v195 = *MEMORY[0x1E4F143B8];
  id v160 = a3;
  if ([v160 count])
  {
    unint64_t v3 = MNGetMNRouteDivergenceLog();
    os_signpost_id_t v4 = os_signpost_id_make_with_pointer(v3, self);

    os_signpost_id_t v5 = MNGetMNRouteDivergenceLog();
    id v6 = v5;
    os_signpost_id_t spid = v4;
    unint64_t v156 = v4 - 1;
    if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
    {
      id v7 = [(MNRouteDivergenceFinder *)self _routesArrayIdentifierStrings:v160];
      *(_DWORD *)long long buf = 138412290;
      *(void *)&buf[4] = v7;
      _os_signpost_emit_with_name_impl(&dword_1B542B000, v6, OS_SIGNPOST_INTERVAL_BEGIN, spid, "findOverlappingSectionsForRoutes", "%@", buf, 0xCu);
    }
    unint64_t v8 = [v160 count];
    v184 = 0;
    v185 = 0;
    v186 = 0;
    *(void *)long long buf = &v184;
    buf[8] = 0;
    if (v8)
    {
      if (v8 > 0xAAAAAAAAAAAAAAALL) {
        std::vector<CLMapsRouteHint>::__throw_length_error[abi:ne180100]();
      }
      uint64_t v9 = 3 * v8;
      uint64_t v10 = 24 * v8;
      unint64_t v11 = (char *)operator new(24 * v8);
      v184 = v11;
      v186 = &v11[8 * v9];
      v12 = v11 + 8;
      do
      {
        void *v12 = 0;
        v12[1] = 0;
        *(v12 - 1) = v12;
        v12 += 3;
        v10 -= 24;
      }
      while (v10);
      v185 = &v11[8 * v9];
    }
    unint64_t v13 = 0;
    double toleranceMeters = self->_toleranceMeters;
    uint64_t v182 = 0;
    double v183 = toleranceMeters;
    v180 = &v181;
    v181 = 0;
    while (v13 < [v160 count])
    {
      v161 = [v160 objectAtIndexedSubscript:v13];
      v164 = (uint64_t **)&v184[24 * v13];
      unint64_t v166 = v13;
      unint64_t v168 = v13;
      while (v166 + 1 < [v160 count])
      {
        ++v166;
        v15 = objc_msgSend(v160, "objectAtIndexedSubscript:");
        v159 = v184;
        v167 = [(MNRouteDivergenceFinder *)self findAllDivergenceConvergenceBetweenRoute:v161 andRoute:v15];
        if ([v167 count] != 2)
        {
          unint64_t v65 = GEOFindOrCreateLog();
          if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = 136315906;
            *(void *)&buf[4] = "-[MNRouteDivergenceFinder findOverlappingSectionsForRoutes:]";
            *(_WORD *)&buf[12] = 2080;
            *(void *)&buf[14] = "/Library/Caches/com.apple.xbs/Sources/Navigation/Misc/MNRouteDivergenceFinder.mm";
            __int16 v190 = 1024;
            LODWORD(v191) = 620;
            WORD2(v191) = 2080;
            *(void *)((char *)&v191 + 6) = "divergenceConvergenceResult.count == 2";
            _os_log_impl(&dword_1B542B000, v65, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s)", buf, 0x26u);
          }
        }
        if ([v167 count] != 2)
        {

          break;
        }
        long long v179 = 0u;
        long long v177 = 0u;
        long long v178 = 0u;
        long long v176 = 0u;
        unint64_t v16 = [v167 objectAtIndexedSubscript:0];
        obuint64_t j = [v16 results];

        uint64_t v17 = [obj countByEnumeratingWithState:&v176 objects:v194 count:16];
        v165 = v15;
        if (v17)
        {
          uint64_t v18 = *(void *)v177;
          do
          {
            for (uint64_t i = 0; i != v17; ++i)
            {
              if (*(void *)v177 != v18) {
                objc_enumerationMutation(obj);
              }
              uint64_t v20 = *(void **)(*((void *)&v176 + 1) + 8 * i);
              int v21 = [v167 objectAtIndexedSubscript:0];
              uint64_t v22 = [v21 results];
              uint64_t v23 = [v22 firstObject];
              BOOL v24 = v20 == v23;

              *(void *)long long buf = [v20 routeCoordinate];
              uint64_t v25 = std::map<geo::PolylineCoordinate,std::vector<-[MNRouteDivergenceFinder findOverlappingSectionsForRoutes:]::RouteSectionEndpoint>>::operator[](v164, (int *)buf);
              BOOL v26 = [v20 resultType] == 2;
              uint64_t v28 = (unint64_t *)*((void *)v25 + 1);
              unint64_t v27 = *((void *)v25 + 2);
              if ((unint64_t)v28 >= v27)
              {
                v30 = *(unint64_t **)v25;
                unint64_t v31 = 0xAAAAAAAAAAAAAAABLL * (((uint64_t)v28 - *(void *)v25) >> 3);
                unint64_t v32 = v31 + 1;
                if (v31 + 1 > 0xAAAAAAAAAAAAAAALL) {
                  std::vector<CLMapsRouteHint>::__throw_length_error[abi:ne180100]();
                }
                unint64_t v33 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v27 - (void)v30) >> 3);
                if (2 * v33 > v32) {
                  unint64_t v32 = 2 * v33;
                }
                if (v33 >= 0x555555555555555) {
                  unint64_t v34 = 0xAAAAAAAAAAAAAAALL;
                }
                else {
                  unint64_t v34 = v32;
                }
                if (v34 > 0xAAAAAAAAAAAAAAALL) {
                  std::__throw_bad_array_new_length[abi:ne180100]();
                }
                v35 = (char *)operator new(24 * v34);
                long long v36 = &v35[24 * v31];
                *(void *)long long v36 = v168;
                *((void *)v36 + 1) = v166;
                v36[16] = v26;
                v36[17] = v24;
                if (v28 == v30)
                {
                  uint64_t v39 = &v35[24 * v31];
                }
                else
                {
                  v37 = &v35[24 * v31];
                  do
                  {
                    long long v38 = *(_OWORD *)(v28 - 3);
                    uint64_t v39 = v37 - 24;
                    *((_WORD *)v37 - 4) = *((_WORD *)v28 - 4);
                    *(_OWORD *)(v37 - 24) = v38;
                    v28 -= 3;
                    v37 -= 24;
                  }
                  while (v28 != v30);
                }
                BOOL v40 = &v35[24 * v34];
                v29 = v36 + 24;
                *(void *)uint64_t v25 = v39;
                *((void *)v25 + 1) = v36 + 24;
                *((void *)v25 + 2) = v40;
                unint64_t v13 = v168;
                v15 = v165;
                if (v30) {
                  operator delete(v30);
                }
              }
              else
              {
                v15 = v165;
                *uint64_t v28 = v168;
                v28[1] = v166;
                *((unsigned char *)v28 + 16) = v26;
                unint64_t v13 = v168;
                v29 = (char *)(v28 + 3);
                *((unsigned char *)v28 + 17) = v24;
              }
              *((void *)v25 + 1) = v29;
            }
            uint64_t v17 = [obj countByEnumeratingWithState:&v176 objects:v194 count:16];
          }
          while (v17);
        }

        long long v174 = 0u;
        long long v175 = 0u;
        long long v172 = 0u;
        long long v173 = 0u;
        v41 = [v167 objectAtIndexedSubscript:1];
        id v162 = [v41 results];

        uint64_t v42 = [v162 countByEnumeratingWithState:&v172 objects:v193 count:16];
        if (v42)
        {
          uint64_t v43 = *(void *)v173;
          do
          {
            for (uint64_t j = 0; j != v42; ++j)
            {
              if (*(void *)v173 != v43) {
                objc_enumerationMutation(v162);
              }
              BOOL v45 = *(void **)(*((void *)&v172 + 1) + 8 * j);
              id v46 = [v167 objectAtIndexedSubscript:1];
              uint64_t v47 = [v46 results];
              unint64_t v48 = [v47 firstObject];
              BOOL v49 = v45 == v48;

              *(void *)long long buf = [v45 routeCoordinate];
              unint64_t v50 = std::map<geo::PolylineCoordinate,std::vector<-[MNRouteDivergenceFinder findOverlappingSectionsForRoutes:]::RouteSectionEndpoint>>::operator[]((uint64_t **)&v159[24 * v166], (int *)buf);
              BOOL v51 = [v45 resultType] == 2;
              v53 = (unint64_t *)*((void *)v50 + 1);
              unint64_t v52 = *((void *)v50 + 2);
              if ((unint64_t)v53 >= v52)
              {
                v55 = *(unint64_t **)v50;
                unint64_t v56 = 0xAAAAAAAAAAAAAAABLL * (((uint64_t)v53 - *(void *)v50) >> 3);
                unint64_t v57 = v56 + 1;
                if (v56 + 1 > 0xAAAAAAAAAAAAAAALL) {
                  std::vector<CLMapsRouteHint>::__throw_length_error[abi:ne180100]();
                }
                unint64_t v58 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v52 - (void)v55) >> 3);
                if (2 * v58 > v57) {
                  unint64_t v57 = 2 * v58;
                }
                if (v58 >= 0x555555555555555) {
                  unint64_t v59 = 0xAAAAAAAAAAAAAAALL;
                }
                else {
                  unint64_t v59 = v57;
                }
                if (v59 > 0xAAAAAAAAAAAAAAALL) {
                  std::__throw_bad_array_new_length[abi:ne180100]();
                }
                id v60 = (char *)operator new(24 * v59);
                id v61 = &v60[24 * v56];
                *(void *)id v61 = v166;
                *((void *)v61 + 1) = v168;
                v61[16] = v51;
                v61[17] = v49;
                if (v53 == v55)
                {
                  v64 = &v60[24 * v56];
                }
                else
                {
                  unint64_t v62 = &v60[24 * v56];
                  do
                  {
                    long long v63 = *(_OWORD *)(v53 - 3);
                    v64 = v62 - 24;
                    *((_WORD *)v62 - 4) = *((_WORD *)v53 - 4);
                    *(_OWORD *)(v62 - 24) = v63;
                    v53 -= 3;
                    v62 -= 24;
                  }
                  while (v53 != v55);
                }
                long long v54 = v61 + 24;
                *(void *)unint64_t v50 = v64;
                *((void *)v50 + 1) = v61 + 24;
                *((void *)v50 + 2) = &v60[24 * v59];
                v15 = v165;
                if (v55) {
                  operator delete(v55);
                }
                unint64_t v13 = v168;
              }
              else
              {
                unint64_t v13 = v168;
                unint64_t *v53 = v166;
                v53[1] = v168;
                *((unsigned char *)v53 + 16) = v51;
                long long v54 = (char *)(v53 + 3);
                *((unsigned char *)v53 + 17) = v49;
                v15 = v165;
              }
              *((void *)v50 + 1) = v54;
            }
            uint64_t v42 = [v162 countByEnumeratingWithState:&v172 objects:v193 count:16];
          }
          while (v42);
        }
      }
      v170 = 0;
      uint64_t v171 = 0;
      v169 = (uint64_t *)&v170;
      std::__tree<unsigned long>::__emplace_hint_unique_key_args<unsigned long,unsigned long const&>((uint64_t *)&v169, (uint64_t *)&v170, v13, v13);
      unint64_t v66 = *v164;
      if (*v164 == (uint64_t *)(v164 + 1)) {
        goto LABEL_220;
      }
      while (2)
      {
        uint64_t v67 = v66[5];
        uint64_t v68 = v66[6];
LABEL_70:
        if (v67 != v68)
        {
          unint64_t v69 = *(void *)(v67 + 8);
          unint64_t v70 = v170;
          if (*(unsigned char *)(v67 + 16))
          {
            for (k = &v170; ; unint64_t v70 = *k)
            {
              unint64_t v72 = k;
              if (!v70) {
                break;
              }
              while (1)
              {
                k = (uint64_t **)v70;
                unint64_t v73 = v70[4];
                if (v73 > v69) {
                  break;
                }
                if (v73 >= v69) {
                  goto LABEL_96;
                }
                unint64_t v70 = k[1];
                if (!v70)
                {
                  unint64_t v72 = k + 1;
                  goto LABEL_93;
                }
              }
            }
LABEL_93:
            size_t v82 = (uint64_t *)operator new(0x28uLL);
            v82[4] = v69;
            *size_t v82 = 0;
            v82[1] = 0;
            v82[2] = (uint64_t)k;
            *unint64_t v72 = v82;
            if (*v169)
            {
              v169 = (uint64_t *)*v169;
              size_t v82 = *v72;
            }
            std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(v170, v82);
            ++v171;
            goto LABEL_96;
          }
          if (!v170) {
            goto LABEL_248;
          }
          v74 = &v170;
          unint64_t v75 = v170;
          do
          {
            v76 = v75;
            __n128 v77 = v74;
            unint64_t v78 = v75[4];
            BOOL v79 = (uint64_t **)(v75 + 1);
            if (v78 >= v69)
            {
              BOOL v79 = (uint64_t **)v76;
              v74 = (uint64_t **)v76;
            }
            unint64_t v75 = *v79;
          }
          while (v75);
          if (v74 == &v170 || (v78 >= v69 ? (unint64_t v80 = v76) : (unint64_t v80 = v77), v80[4] > v69))
          {
LABEL_248:
            if (!*(unsigned char *)(v67 + 17))
            {
              unint64_t v81 = GEOFindOrCreateLog();
              if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)long long buf = 136315906;
                *(void *)&buf[4] = "-[MNRouteDivergenceFinder findOverlappingSectionsForRoutes:]";
                *(_WORD *)&buf[12] = 2080;
                *(void *)&buf[14] = "/Library/Caches/com.apple.xbs/Sources/Navigation/Misc/MNRouteDivergenceFinder.mm";
                __int16 v190 = 1024;
                LODWORD(v191) = 652;
                WORD2(v191) = 2080;
                *(void *)((char *)&v191 + 6) = "erasedElements == 1 || routeSectionEndpoint.isFirstEndpoint";
                _os_log_impl(&dword_1B542B000, v81, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s)", buf, 0x26u);
              }
            }
            goto LABEL_96;
          }
          if (v78 >= v69) {
            v83 = v76;
          }
          else {
            v83 = v77;
          }
          v84 = (uint64_t *)*((void *)v83 + 1);
          uint64_t v85 = v84;
          unint64_t v86 = v74;
          if (v84)
          {
            do
            {
              int8x8_t v87 = v85;
              uint64_t v85 = (uint64_t *)*v85;
            }
            while (v85);
          }
          else
          {
            do
            {
              int8x8_t v87 = v86[2];
              BOOL v107 = *v87 == (void)v86;
              unint64_t v86 = (uint64_t **)v87;
            }
            while (!v107);
          }
          if (v169 == (uint64_t *)v74) {
            v169 = v87;
          }
          --v171;
          v88 = *v74;
          unint64_t v89 = v74;
          if (*v74)
          {
            if (v84)
            {
              do
              {
                unint64_t v89 = (uint64_t **)v84;
                v84 = (uint64_t *)*v84;
              }
              while (v84);
              goto LABEL_110;
            }
            unint64_t v89 = v74;
LABEL_113:
            int v90 = 0;
            v88[2] = (uint64_t)v89[2];
          }
          else
          {
LABEL_110:
            v88 = v89[1];
            if (v88) {
              goto LABEL_113;
            }
            int v90 = 1;
          }
          v91 = (uint64_t **)v89[2];
          uint64_t v92 = (uint64_t)*v91;
          if (*v91 == (uint64_t *)v89)
          {
            int8x8_t *v91 = v88;
            if (v89 == (uint64_t **)v70)
            {
              uint64_t v92 = 0;
              unint64_t v70 = v88;
            }
            else
            {
              uint64_t v92 = (uint64_t)v91[1];
            }
          }
          else
          {
            v91[1] = v88;
          }
          int v93 = *((unsigned __int8 *)v89 + 24);
          if (v89 != v74)
          {
            if (v78 >= v69) {
              unint64_t v94 = v76;
            }
            else {
              unint64_t v94 = v77;
            }
            int8x8_t v95 = (uint64_t *)*((void *)v94 + 2);
            v89[2] = v95;
            v95[**((void **)v94 + 2) != (void)v74] = (uint64_t)v89;
            uint64_t v96 = *v74;
            *unint64_t v89 = *v74;
            v96[2] = (uint64_t)v89;
            v97 = (uint64_t *)*((void *)v83 + 1);
            v89[1] = v97;
            if (v97) {
              v97[2] = (uint64_t)v89;
            }
            if (v78 < v69) {
              v76 = (uint64_t *)v77;
            }
            *((unsigned char *)v89 + 24) = *((unsigned char *)v76 + 24);
            if (v70 == (uint64_t *)v74) {
              unint64_t v70 = (uint64_t *)v89;
            }
          }
          if (!v93 || !v70) {
            goto LABEL_183;
          }
          if (!v90)
          {
            *((unsigned char *)v88 + 24) = 1;
            goto LABEL_183;
          }
          while (1)
          {
            uint64_t v98 = *(void *)(v92 + 16);
            if (*(void *)v98 == v92)
            {
              if (!*(unsigned char *)(v92 + 24))
              {
                *(unsigned char *)(v92 + 24) = 1;
                *(unsigned char *)(v98 + 24) = 0;
                uint64_t v104 = *(void *)(v92 + 8);
                *(void *)uint64_t v98 = v104;
                if (v104) {
                  *(void *)(v104 + 16) = v98;
                }
                *(void *)(v92 + 16) = *(void *)(v98 + 16);
                *(void *)(*(void *)(v98 + 16) + 8 * (**(void **)(v98 + 16) != v98)) = v92;
                *(void *)(v92 + 8) = v98;
                *(void *)(v98 + 16) = v92;
                if (v70 == (uint64_t *)v98) {
                  unint64_t v70 = (uint64_t *)v92;
                }
                uint64_t v92 = *(void *)v98;
              }
              uint64_t v105 = *(void *)v92;
              if (*(void *)v92 && !*(unsigned char *)(v105 + 24)) {
                goto LABEL_178;
              }
              uint64_t v106 = *(void *)(v92 + 8);
              if (v106 && !*(unsigned char *)(v106 + 24))
              {
                if (v105 && !*(unsigned char *)(v105 + 24))
                {
LABEL_178:
                  uint64_t v106 = v92;
                }
                else
                {
                  *(unsigned char *)(v106 + 24) = 1;
                  *(unsigned char *)(v92 + 24) = 0;
                  uint64_t v112 = *(void *)v106;
                  *(void *)(v92 + 8) = *(void *)v106;
                  if (v112) {
                    *(void *)(v112 + 16) = v92;
                  }
                  *(void *)(v106 + 16) = *(void *)(v92 + 16);
                  *(void *)(*(void *)(v92 + 16) + 8 * (**(void **)(v92 + 16) != v92)) = v106;
                  *(void *)uint64_t v106 = v92;
                  *(void *)(v92 + 16) = v106;
                  uint64_t v105 = v92;
                }
                uint64_t v109 = *(void *)(v106 + 16);
                *(unsigned char *)(v106 + 24) = *(unsigned char *)(v109 + 24);
                *(unsigned char *)(v109 + 24) = 1;
                *(unsigned char *)(v105 + 24) = 1;
                id v110 = *(uint64_t **)v109;
                uint64_t v113 = *(void *)(*(void *)v109 + 8);
                *(void *)uint64_t v109 = v113;
                if (v113) {
                  *(void *)(v113 + 16) = v109;
                }
                v110[2] = *(void *)(v109 + 16);
                *(void *)(*(void *)(v109 + 16) + 8 * (**(void **)(v109 + 16) != v109)) = v110;
                v110[1] = v109;
                goto LABEL_182;
              }
              *(unsigned char *)(v92 + 24) = 0;
              long long v103 = *(uint64_t **)(v92 + 16);
              if (*((unsigned char *)v103 + 24)) {
                BOOL v107 = v103 == v70;
              }
              else {
                BOOL v107 = 1;
              }
              if (v107) {
                goto LABEL_163;
              }
            }
            else
            {
              if (!*(unsigned char *)(v92 + 24))
              {
                *(unsigned char *)(v92 + 24) = 1;
                *(unsigned char *)(v98 + 24) = 0;
                v99 = *(uint64_t **)(v98 + 8);
                uint64_t v100 = *v99;
                *(void *)(v98 + 8) = *v99;
                if (v100) {
                  *(void *)(v100 + 16) = v98;
                }
                v99[2] = *(void *)(v98 + 16);
                *(void *)(*(void *)(v98 + 16) + 8 * (**(void **)(v98 + 16) != v98)) = v99;
                uint64_t *v99 = v98;
                *(void *)(v98 + 16) = v99;
                if (v70 == *(uint64_t **)v92) {
                  unint64_t v70 = (uint64_t *)v92;
                }
                uint64_t v92 = *(void *)(*(void *)v92 + 8);
              }
              uint64_t v101 = *(void *)v92;
              if (*(void *)v92 && !*(unsigned char *)(v101 + 24))
              {
                uint64_t v102 = *(void *)(v92 + 8);
                if (v102 && !*(unsigned char *)(v102 + 24))
                {
LABEL_169:
                  uint64_t v101 = v92;
                }
                else
                {
                  *(unsigned char *)(v101 + 24) = 1;
                  *(unsigned char *)(v92 + 24) = 0;
                  uint64_t v108 = *(void *)(v101 + 8);
                  *(void *)uint64_t v92 = v108;
                  if (v108) {
                    *(void *)(v108 + 16) = v92;
                  }
                  *(void *)(v101 + 16) = *(void *)(v92 + 16);
                  *(void *)(*(void *)(v92 + 16) + 8 * (**(void **)(v92 + 16) != v92)) = v101;
                  *(void *)(v101 + 8) = v92;
                  *(void *)(v92 + 16) = v101;
                  uint64_t v102 = v92;
                }
                uint64_t v109 = *(void *)(v101 + 16);
                *(unsigned char *)(v101 + 24) = *(unsigned char *)(v109 + 24);
                *(unsigned char *)(v109 + 24) = 1;
                *(unsigned char *)(v102 + 24) = 1;
                id v110 = *(uint64_t **)(v109 + 8);
                uint64_t v111 = *v110;
                *(void *)(v109 + 8) = *v110;
                if (v111) {
                  *(void *)(v111 + 16) = v109;
                }
                v110[2] = *(void *)(v109 + 16);
                *(void *)(*(void *)(v109 + 16) + 8 * (**(void **)(v109 + 16) != v109)) = v110;
                *id v110 = v109;
LABEL_182:
                *(void *)(v109 + 16) = v110;
LABEL_183:
                operator delete(v74);
LABEL_96:
                v67 += 24;
                goto LABEL_70;
              }
              uint64_t v102 = *(void *)(v92 + 8);
              if (v102 && !*(unsigned char *)(v102 + 24)) {
                goto LABEL_169;
              }
              *(unsigned char *)(v92 + 24) = 0;
              long long v103 = *(uint64_t **)(v92 + 16);
              if (v103 == v70)
              {
                long long v103 = v70;
LABEL_163:
                *((unsigned char *)v103 + 24) = 1;
                goto LABEL_183;
              }
              if (!*((unsigned char *)v103 + 24)) {
                goto LABEL_163;
              }
            }
            uint64_t v92 = *(void *)(v103[2] + 8 * (*(void *)v103[2] == (void)v103));
          }
        }
        uint64_t v114 = v66[4];
        uint64_t v115 = *MEMORY[0x1E4F64198];
        [v161 pointAtRouteCoordinate:v114];
        uint64_t v117 = v116;
        uint64_t v119 = v118;
        uint64_t v121 = v120;
        std::set<unsigned long>::set[abi:ne180100]((uint64_t *)buf, &v169);
        *(void *)&long long v191 = v117;
        *((void *)&v191 + 1) = v119;
        uint64_t v192 = v121;
        long long v122 = &v181;
        long long v123 = &v181;
        long long v124 = v181;
        if (!v181) {
          goto LABEL_193;
        }
        long long v123 = &v181;
        while (1)
        {
          while (1)
          {
            long long v122 = (uint64_t **)v124;
            uint64_t v125 = (uint64_t)(v124 + 4);
            if (!-[MNRouteDivergenceFinder findOverlappingSectionsForRoutes:]::RouteSectionKeyCompare::operator()(&v183, (uint64_t)buf, (uint64_t)(v124 + 4)))break; {
            long long v124 = *v122;
            }
            long long v123 = v122;
            if (!*v122) {
              goto LABEL_193;
            }
          }
          if (!-[MNRouteDivergenceFinder findOverlappingSectionsForRoutes:]::RouteSectionKeyCompare::operator()(&v183, v125, (uint64_t)buf))break; {
          long long v123 = v122 + 1;
          }
          long long v124 = v122[1];
          if (!v124) {
            goto LABEL_193;
          }
        }
        long long v126 = *v123;
        if (!*v123)
        {
LABEL_193:
          long long v127 = (char *)operator new(0x68uLL);
          v187[0] = v127;
          v187[1] = &v181;
          char v188 = 0;
          std::set<unsigned long>::set[abi:ne180100]((uint64_t *)v127 + 4, buf);
          *(_OWORD *)(v127 + 56) = v191;
          uint64_t v128 = v192;
          *((void *)v127 + 11) = 0;
          *((void *)v127 + 12) = 0;
          *((void *)v127 + 9) = v128;
          *((void *)v127 + 10) = 0;
          char v188 = 1;
          long long v129 = (uint64_t *)v187[0];
          *(void *)v187[0] = 0;
          v129[1] = 0;
          v129[2] = (uint64_t)v122;
          *long long v123 = v129;
          if (*v180)
          {
            v180 = (uint64_t **)*v180;
            long long v129 = *v123;
          }
          std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(v181, v129);
          ++v182;
          long long v126 = (uint64_t *)v187[0];
          v187[0] = 0;
          std::unique_ptr<std::__tree_node<std::__value_type<-[MNRouteDivergenceFinder findOverlappingSectionsForRoutes:]::RouteSectionKey,std::vector<-[MNRouteDivergenceFinder findOverlappingSectionsForRoutes:]::RouteSection>>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<-[MNRouteDivergenceFinder findOverlappingSectionsForRoutes:]::RouteSectionKey,std::vector<-[MNRouteDivergenceFinder findOverlappingSectionsForRoutes:]::RouteSection>>,void *>>>>::~unique_ptr[abi:ne180100]((uint64_t)v187);
        }
        v131 = (char *)v126[11];
        unint64_t v130 = v126[12];
        if ((unint64_t)v131 >= v130)
        {
          v133 = (char *)v126[10];
          unint64_t v134 = 0xAAAAAAAAAAAAAAABLL * ((v131 - v133) >> 3) + 1;
          if (v134 > 0xAAAAAAAAAAAAAAALL) {
            std::vector<CLMapsRouteHint>::__throw_length_error[abi:ne180100]();
          }
          unint64_t v135 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v130 - (void)v133) >> 3);
          if (2 * v135 > v134) {
            unint64_t v134 = 2 * v135;
          }
          if (v135 >= 0x555555555555555) {
            unint64_t v136 = 0xAAAAAAAAAAAAAAALL;
          }
          else {
            unint64_t v136 = v134;
          }
          if (v136 > 0xAAAAAAAAAAAAAAALL) {
            std::__throw_bad_array_new_length[abi:ne180100]();
          }
          v137 = (char *)operator new(24 * v136);
          v138 = (uint64_t *)&v137[8 * ((v131 - v133) >> 3)];
          uint64_t *v138 = v114;
          v138[1] = v115;
          v138[2] = v13;
          if (v131 == v133)
          {
            v141 = &v137[8 * ((v131 - v133) >> 3)];
          }
          else
          {
            v139 = &v137[8 * ((v131 - v133) >> 3)];
            do
            {
              long long v140 = *(_OWORD *)(v131 - 24);
              v141 = v139 - 24;
              *((void *)v139 - 1) = *((void *)v131 - 1);
              *(_OWORD *)(v139 - 24) = v140;
              v131 -= 24;
              v139 -= 24;
            }
            while (v131 != v133);
          }
          v132 = v138 + 3;
          v126[10] = (uint64_t)v141;
          v126[11] = (uint64_t)(v138 + 3);
          v126[12] = (uint64_t)&v137[24 * v136];
          if (v133) {
            operator delete(v133);
          }
        }
        else
        {
          *(void *)v131 = v114;
          *((void *)v131 + 1) = v115;
          v132 = v131 + 24;
          *((void *)v131 + 2) = v13;
        }
        v126[11] = (uint64_t)v132;
        v142 = (uint64_t *)v66[1];
        if (v142)
        {
          do
          {
            v143 = (uint64_t **)v142;
            v142 = (uint64_t *)*v142;
          }
          while (v142);
        }
        else
        {
          do
          {
            v143 = (uint64_t **)v66[2];
            BOOL v107 = *v143 == v66;
            unint64_t v66 = (uint64_t *)v143;
          }
          while (!v107);
        }
        if (v143 != v164 + 1)
        {
          *(v132 - 2) = v143[4];
          std::__tree<unsigned long>::destroy(*(void **)&buf[8]);
          unint64_t v66 = (uint64_t *)v143;
          continue;
        }
        break;
      }
      *(v132 - 2) = [v161 endRouteCoordinate];
      std::__tree<unsigned long>::destroy(*(void **)&buf[8]);
LABEL_220:
      std::__tree<unsigned long>::destroy(v170);

      ++v13;
    }
    v144 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v182];
    v145 = (uint64_t *)v180;
    if (v180 != &v181)
    {
      do
      {
        v146 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:0xAAAAAAAAAAAAAAABLL * ((v145[11] - v145[10]) >> 3)];
        v147 = (void *)v145[10];
        v148 = (void *)v145[11];
        while (v147 != v148)
        {
          v149 = objc_alloc_init(MNRouteDivergenceOverlappingSectionComponent);
          [(MNRouteDivergenceOverlappingSectionComponent *)v149 setRouteIndex:v147[2]];
          -[MNRouteDivergenceOverlappingSectionComponent setRange:](v149, "setRange:", *v147, v147[1]);
          [v146 addObject:v149];

          v147 += 3;
        }
        v150 = objc_alloc_init(MNRouteDivergenceOverlappingSection);
        [(MNRouteDivergenceOverlappingSection *)v150 setComponents:v146];
        [v144 addObject:v150];

        v151 = (uint64_t *)v145[1];
        if (v151)
        {
          do
          {
            v152 = (uint64_t **)v151;
            v151 = (uint64_t *)*v151;
          }
          while (v151);
        }
        else
        {
          do
          {
            v152 = (uint64_t **)v145[2];
            BOOL v107 = *v152 == v145;
            v145 = (uint64_t *)v152;
          }
          while (!v107);
        }
        v145 = (uint64_t *)v152;
      }
      while (v152 != &v181);
    }
    v153 = MNGetMNRouteDivergenceLog();
    v154 = v153;
    if (v156 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v153))
    {
      *(_WORD *)long long buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B542B000, v154, OS_SIGNPOST_INTERVAL_END, spid, "findOverlappingSectionsForRoutes", "", buf, 2u);
    }

    std::__tree<std::__value_type<-[MNRouteDivergenceFinder findOverlappingSectionsForRoutes:]::RouteSectionKey,std::vector<-[MNRouteDivergenceFinder findOverlappingSectionsForRoutes:]::RouteSection>>,std::__map_value_compare<-[MNRouteDivergenceFinder findOverlappingSectionsForRoutes:]::RouteSectionKey,std::__value_type<-[MNRouteDivergenceFinder findOverlappingSectionsForRoutes:]::RouteSectionKey,std::vector<-[MNRouteDivergenceFinder findOverlappingSectionsForRoutes:]::RouteSection>>,-[MNRouteDivergenceFinder findOverlappingSectionsForRoutes:]::RouteSectionKeyCompare,false>,std::allocator<std::__value_type<-[MNRouteDivergenceFinder findOverlappingSectionsForRoutes:]::RouteSectionKey,std::vector<-[MNRouteDivergenceFinder findOverlappingSectionsForRoutes:]::RouteSection>>>>::destroy(v181);
    *(void *)long long buf = &v184;
    std::vector<std::map<geo::PolylineCoordinate,std::vector<-[MNRouteDivergenceFinder findOverlappingSectionsForRoutes:]::RouteSectionEndpoint>>>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);
  }
  else
  {
    v144 = 0;
  }

  return v144;
}

- (char)findOverlappingSectionsForRoutes:(uint64_t *)a1
{
  os_signpost_id_t v5 = a1 + 1;
  os_signpost_id_t v4 = (char *)a1[1];
  if (!v4)
  {
    unint64_t v8 = (char *)(a1 + 1);
    goto LABEL_14;
  }
  unsigned int v6 = *a2;
  float v7 = *((float *)a2 + 1);
  do
  {
    while (1)
    {
      unint64_t v8 = v4;
      unsigned int v9 = *((_DWORD *)v4 + 8);
      if (v6 >= v9) {
        break;
      }
LABEL_6:
      os_signpost_id_t v4 = *(char **)v8;
      os_signpost_id_t v5 = (uint64_t **)v8;
      if (!*(void *)v8) {
        goto LABEL_14;
      }
    }
    if (v6 == v9)
    {
      float v10 = *((float *)v8 + 9);
      if (v7 < v10) {
        goto LABEL_6;
      }
      if (v10 >= v7) {
        return v8 + 40;
      }
    }
    else if (v9 >= v6)
    {
      return v8 + 40;
    }
    os_signpost_id_t v4 = (char *)*((void *)v8 + 1);
  }
  while (v4);
  os_signpost_id_t v5 = (uint64_t **)(v8 + 8);
LABEL_14:
  unint64_t v11 = v8;
  unint64_t v8 = (char *)operator new(0x40uLL);
  *((void *)v8 + 4) = *(void *)a2;
  *((void *)v8 + 5) = 0;
  *((void *)v8 + 6) = 0;
  *((void *)v8 + 7) = 0;
  *(void *)unint64_t v8 = 0;
  *((void *)v8 + 1) = 0;
  *((void *)v8 + 2) = v11;
  *os_signpost_id_t v5 = (uint64_t *)v8;
  v12 = (uint64_t *)**a1;
  unint64_t v13 = (uint64_t *)v8;
  if (v12)
  {
    *a1 = v12;
    unint64_t v13 = *v5;
  }
  std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(a1[1], v13);
  a1[2] = (uint64_t *)((char *)a1[2] + 1);
  return v8 + 40;
}

- (void)_findFirstDivergenceBetweenRoute:(id)a3 range:(GEOPolylineCoordinateRange)a4 andRoute:(id)a5 range:(GEOPolylineCoordinateRange)a6 outRouteCoordinate:(PolylineCoordinate *)a7 outRouteCoordinate:(PolylineCoordinate *)a8
{
  PolylineCoordinate end = a6.end;
  uint64_t start = (uint64_t)a6.start;
  uint64_t v79 = (uint64_t)a4.start;
  PolylineCoordinate v10 = a4.end;
  uint64_t v90 = *MEMORY[0x1E4F143B8];
  id v80 = a3;
  id v81 = a5;
  v12 = MNGetMNRouteDivergenceLog();
  size_t v82 = self;
  os_signpost_id_t v13 = os_signpost_id_make_with_pointer(v12, self);

  unint64_t v14 = MNGetMNRouteDivergenceLog();
  v15 = v14;
  os_signpost_id_t spid = v13;
  unint64_t v76 = v13 - 1;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    v83[0] = v80;
    v83[1] = v81;
    unint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v83 count:2];
    id v17 = [(MNRouteDivergenceFinder *)v82 _routesArrayIdentifierStrings:v16];
    uint64_t v18 = GEOPolylineCoordinateRangeAsString();
    uint64_t v19 = GEOPolylineCoordinateRangeAsString();
    *(_DWORD *)long long buf = 138412802;
    id v85 = v17;
    __int16 v86 = 2112;
    int8x8_t v87 = v18;
    __int16 v88 = 2112;
    unint64_t v89 = v19;
    _os_signpost_emit_with_name_impl(&dword_1B542B000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v13, "_findFirstDivergenceBetweenRoute", "%@ [%@] [%@]", buf, 0x20u);
  }
  uint64_t v20 = (PolylineCoordinate *)MEMORY[0x1E4F64198];
  *a7 = *(PolylineCoordinate *)MEMORY[0x1E4F64198];
  *a8 = *v20;
  [v80 pointAtRouteCoordinate:v79];
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;
  [v81 pointAtRouteCoordinate:start];
  double v28 = v27;
  double v30 = v29;
  double v32 = v31;
  GEOCalculateDistance();
  if (v33 <= v82->_toleranceMeters)
  {
    int v36 = 1;
  }
  else
  {
    uint64_t v34 = -[MNRouteDivergenceFinder _firstRouteCoordinateWithinToleranceOnRoute:nearCoordinate:range:](v82, "_firstRouteCoordinateWithinToleranceOnRoute:nearCoordinate:range:", v80, v79, v10, v28, v30, v32);
    uint64_t v35 = -[MNRouteDivergenceFinder _firstRouteCoordinateWithinToleranceOnRoute:nearCoordinate:range:](v82, "_firstRouteCoordinateWithinToleranceOnRoute:nearCoordinate:range:", v81, start, end, v22, v24, v26);
    if GEOPolylineCoordinateIsInvalid() && (GEOPolylineCoordinateIsInvalid())
    {
      *a7 = (PolylineCoordinate)v79;
      *a8 = (PolylineCoordinate)start;
      goto LABEL_68;
    }
    int IsInvalid = GEOPolylineCoordinateIsInvalid();
    if (IsInvalid)
    {
      uint64_t start = v35;
    }
    else
    {
      int v38 = GEOPolylineCoordinateIsInvalid();
      uint64_t v39 = v79;
      if (v38) {
        uint64_t v39 = v34;
      }
      uint64_t v79 = v39;
    }
    int v36 = IsInvalid ^ 1;
  }
  BOOL v40 = objc_msgSend(MEMORY[0x1E4F64868], "iteratorWithRange:", v79, v10);
  v41 = objc_msgSend(MEMORY[0x1E4F64868], "iteratorWithRange:", start, end);
  char v77 = 0;
  char v42 = 0;
  double v43 = 0.0;
  while ([v40 isCurrentValid] && objc_msgSend(v41, "isCurrentValid"))
  {
    if (v36) {
      uint64_t v44 = v80;
    }
    else {
      uint64_t v44 = v81;
    }
    if (v36) {
      BOOL v45 = v81;
    }
    else {
      BOOL v45 = v80;
    }
    if (v36) {
      id v46 = v40;
    }
    else {
      id v46 = v41;
    }
    if (v36) {
      uint64_t v47 = v41;
    }
    else {
      uint64_t v47 = v40;
    }
    id v48 = v44;
    id v49 = v45;
    id v50 = v46;
    id v51 = v47;
    [v51 previous];
    if (GEOPolylineCoordinateIsValid()) {
      uint64_t v52 = [v51 previous];
    }
    else {
      uint64_t v52 = [v51 current];
    }
    uint64_t v53 = v52;
    uint64_t v54 = [v51 current];
    [v49 pointAtRouteCoordinate:v53];
    [v49 pointAtRouteCoordinate:v54];
    uint64_t v56 = v55;
    uint64_t v58 = v57;
    uint64_t v60 = v59;
    objc_msgSend(v48, "pointAtRouteCoordinate:", objc_msgSend(v50, "current"));
    [(MNRouteDivergenceFinder *)v82 _distanceFromCoordinate:v56 toSegmentStart:v58 segmentEnd:v60];
    if (v61 >= v82->_toleranceMeters)
    {
      if (v43 <= 0.0)
      {
        if (v42)
        {
          char v62 = 0;
          char v77 = 1;
          char v42 = 1;
        }
        else
        {
          v36 ^= 1u;
          char v42 = 1;
          char v62 = 1;
        }
        goto LABEL_43;
      }
      [v51 advance];
    }
    else
    {
      if (v61 <= 0.01) {
        goto LABEL_41;
      }
      if (v43 <= 0.0)
      {
        char v42 = 0;
        v36 ^= 1u;
        char v62 = 1;
        double v43 = v61;
        goto LABEL_43;
      }
      if (v61 <= v43)
      {
LABEL_41:
        [v50 advance];
        char v42 = 0;
        goto LABEL_42;
      }
      [v51 advance];
      char v42 = 0;
    }
    v36 ^= 1u;
LABEL_42:
    char v62 = 1;
    double v43 = 0.0;
LABEL_43:

    if ((v62 & 1) == 0) {
      break;
    }
  }
  if (v77)
  {
    [v40 previous];
    if ((GEOPolylineCoordinateIsInvalid() & 1) == 0)
    {
      [v41 previous];
      if (GEOPolylineCoordinateIsValid()) {
        uint64_t v63 = [v41 previous];
      }
      else {
        uint64_t v63 = [v41 current];
      }
      [v81 pointAtRouteCoordinate:v63];
      uint64_t v79 = -[MNRouteDivergenceFinder _closestRouteCoordinateOnRoute:toLocationCoordinate:inRange:](v82, "_closestRouteCoordinateOnRoute:toLocationCoordinate:inRange:", v80, [v40 previous], objc_msgSend(v40, "current"), v67, v68, v69);
    }
    *a7 = (PolylineCoordinate)v79;
    [v41 previous];
    if ((GEOPolylineCoordinateIsInvalid() & 1) == 0)
    {
      [v40 previous];
      if (GEOPolylineCoordinateIsValid()) {
        uint64_t v70 = [v40 previous];
      }
      else {
        uint64_t v70 = [v40 current];
      }
      [v80 pointAtRouteCoordinate:v70];
      uint64_t start = -[MNRouteDivergenceFinder _closestRouteCoordinateOnRoute:toLocationCoordinate:inRange:](v82, "_closestRouteCoordinateOnRoute:toLocationCoordinate:inRange:", v81, [v41 previous], objc_msgSend(v41, "current"), v71, v72, v73);
    }
    *a8 = (PolylineCoordinate)start;
    v74 = MNGetMNRouteDivergenceLog();
    unint64_t v65 = v74;
    if (v76 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v74))
    {
      *(_WORD *)long long buf = 0;
      unint64_t v66 = "Divergence found";
LABEL_66:
      _os_signpost_emit_with_name_impl(&dword_1B542B000, v65, OS_SIGNPOST_INTERVAL_END, spid, "_findFirstDivergenceBetweenRoute", v66, buf, 2u);
    }
  }
  else
  {
    v64 = MNGetMNRouteDivergenceLog();
    unint64_t v65 = v64;
    if (v76 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v64))
    {
      *(_WORD *)long long buf = 0;
      unint64_t v66 = "No divergence found";
      goto LABEL_66;
    }
  }

LABEL_68:
}

- (BOOL)_pathsDivergeBetweenRoute:(id)a3 from:(PolylineCoordinate)a4 andRoute:(id)a5 from:(PolylineCoordinate)a6 withinDistance:(double)a7
{
  id v12 = a3;
  id v13 = a5;
  unint64_t v16 = 0xBF80000000000000;
  unint64_t v17 = 0xBF80000000000000;
  -[MNRouteDivergenceFinder _findFirstDivergenceBetweenRoute:range:andRoute:range:outRouteCoordinate:outRouteCoordinate:](self, "_findFirstDivergenceBetweenRoute:range:andRoute:range:outRouteCoordinate:outRouteCoordinate:", v12, a4, [v12 routeCoordinateForDistance:a4 afterRouteCoordinate:a7], v13, a6, objc_msgSend(v13, "routeCoordinateForDistance:afterRouteCoordinate:", a6, a7), &v17, &v16);
  if (GEOPolylineCoordinateIsValid()) {
    char IsValid = 1;
  }
  else {
    char IsValid = GEOPolylineCoordinateIsValid();
  }

  return IsValid;
}

- (void)_findFirstConvergenceBetweenRoute:(id)a3 fromRouteCoordinate:(PolylineCoordinate)a4 andRoute:(id)a5 fromRouteCoordinate:(PolylineCoordinate)a6 outRouteCoordinate:(PolylineCoordinate *)a7 outRouteCoordinate:(PolylineCoordinate *)a8
{
  uint64_t v84 = *MEMORY[0x1E4F143B8];
  id v64 = a3;
  id v63 = a5;
  id v13 = MNGetMNRouteDivergenceLog();
  char v62 = self;
  os_signpost_id_t v14 = os_signpost_id_make_with_pointer(v13, self);

  v15 = MNGetMNRouteDivergenceLog();
  unint64_t v16 = v15;
  unint64_t v61 = v14 - 1;
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    v78[0] = v64;
    v78[1] = v63;
    unint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v78 count:2];
    id v18 = [(MNRouteDivergenceFinder *)v62 _routesArrayIdentifierStrings:v17];
    uint64_t v19 = GEOPolylineCoordinateAsShortString();
    uint64_t v20 = GEOPolylineCoordinateAsShortString();
    *(_DWORD *)long long buf = 138412802;
    *(void *)&uint8_t buf[4] = v18;
    __int16 v80 = 2112;
    id v81 = v19;
    __int16 v82 = 2112;
    v83 = v20;
    _os_signpost_emit_with_name_impl(&dword_1B542B000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v14, "_findFirstConvergenceBetweenRoute", "%@ [%@] [%@]", buf, 0x20u);
  }
  double v21 = (PolylineCoordinate *)MEMORY[0x1E4F64198];
  *a7 = *(PolylineCoordinate *)MEMORY[0x1E4F64198];
  *a8 = *v21;
  if ([v64 pointCount] && objc_msgSend(v63, "pointCount"))
  {
    objc_msgSend(v64, "_navigation_allLeafBoundingSections");
    long long v74 = 0u;
    long long v75 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    double v22 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v60 = v22;
    uint64_t v23 = [v22 countByEnumeratingWithState:&v72 objects:v77 count:16];
    if (v23)
    {
      uint64_t v24 = *(void *)v73;
      os_signpost_id_t spid = v14;
      uint64_t v55 = a7;
      uint64_t v56 = a8;
      uint64_t v54 = *(void *)v73;
      do
      {
        uint64_t v25 = 0;
        uint64_t v57 = v23;
        do
        {
          if (*(void *)v73 != v24) {
            objc_enumerationMutation(v22);
          }
          double v26 = *(void **)(*((void *)&v72 + 1) + 8 * v25);
          [v26 range];
          if (v27 >= a4.index)
          {
            *(float *)&double v29 = v28;
            if (v27 != a4.index || v28 >= a4.offset)
            {
              objc_msgSend(v64, "pointAt:", objc_msgSend(v26, "range", v29));
              GEOMapPointsPerMeterAtLatitude();
              uint64_t v59 = v25;
              double v32 = objc_msgSend(v63, "_navigation_leafBoundingSectionsIntersectingSection:paddingMapPoints:", v26, v31 * v62->_toleranceMeters);
              long long v70 = 0u;
              long long v71 = 0u;
              long long v68 = 0u;
              long long v69 = 0u;
              id v33 = v32;
              uint64_t v34 = [v33 countByEnumeratingWithState:&v68 objects:v76 count:16];
              if (v34)
              {
                uint64_t v35 = *(void *)v69;
                while (2)
                {
                  for (uint64_t i = 0; i != v34; ++i)
                  {
                    if (*(void *)v69 != v35) {
                      objc_enumerationMutation(v33);
                    }
                    v37 = *(void **)(*((void *)&v68 + 1) + 8 * i);
                    [v37 range];
                    if (v38 >= a6.index)
                    {
                      *(float *)&double v40 = v39;
                      if (v38 != a6.index || v39 >= a6.offset)
                      {
                        uint64_t v42 = objc_msgSend(v26, "range", v40);
                        uint64_t v44 = v43;
                        PolylineCoordinate v45 = a4;
                        if (!GEOPolylineCoordinateIsABeforeB()) {
                          PolylineCoordinate v45 = (PolylineCoordinate)v42;
                        }
                        PolylineCoordinate v46 = (PolylineCoordinate)[v37 range];
                        uint64_t v48 = v47;
                        PolylineCoordinate v49 = GEOPolylineCoordinateIsABeforeB() ? a6 : v46;
                        *(void *)long long buf = 0xBF80000000000000;
                        unint64_t v67 = 0xBF80000000000000;
                        -[MNRouteDivergenceFinder _findFirstConvergenceBetweenRoute:range:andRoute:range:outRouteCoordinate:outRouteCoordinate:](v62, "_findFirstConvergenceBetweenRoute:range:andRoute:range:outRouteCoordinate:outRouteCoordinate:", v64, v45, v44, v63, v49, v48, buf, &v67);
                        if (GEOPolylineCoordinateIsValid())
                        {
                          if (GEOPolylineCoordinateIsValid())
                          {
                            PolylineCoordinate *v55 = *(PolylineCoordinate *)buf;
                            PolylineCoordinate *v56 = (PolylineCoordinate)v67;
                            uint64_t v52 = MNGetMNRouteDivergenceLog();
                            uint64_t v53 = v52;
                            if (v61 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v52))
                            {
                              *(_WORD *)unint64_t v66 = 0;
                              _os_signpost_emit_with_name_impl(&dword_1B542B000, v53, OS_SIGNPOST_INTERVAL_END, spid, "_findFirstConvergenceBetweenRoute", "Convergence found", v66, 2u);
                            }

                            double v22 = v60;
                            id v51 = v60;
                            goto LABEL_45;
                          }
                        }
                      }
                    }
                  }
                  uint64_t v34 = [v33 countByEnumeratingWithState:&v68 objects:v76 count:16];
                  if (v34) {
                    continue;
                  }
                  break;
                }
              }

              os_signpost_id_t v14 = spid;
              double v22 = v60;

              uint64_t v23 = v57;
              uint64_t v24 = v54;
              uint64_t v25 = v59;
            }
          }
          ++v25;
        }
        while (v25 != v23);
        uint64_t v23 = [v22 countByEnumeratingWithState:&v72 objects:v77 count:16];
      }
      while (v23);
    }

    id v50 = MNGetMNRouteDivergenceLog();
    id v51 = v50;
    if (v61 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v50))
    {
      *(_WORD *)long long buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B542B000, v51, OS_SIGNPOST_INTERVAL_END, v14, "_findFirstConvergenceBetweenRoute", "Convergence not found", buf, 2u);
    }
LABEL_45:
  }
}

- (void)_findFirstConvergenceBetweenRoute:(id)a3 range:(GEOPolylineCoordinateRange)a4 andRoute:(id)a5 range:(GEOPolylineCoordinateRange)a6 outRouteCoordinate:(PolylineCoordinate *)a7 outRouteCoordinate:(PolylineCoordinate *)a8
{
  PolylineCoordinate end = a6.end;
  PolylineCoordinate start = a6.start;
  PolylineCoordinate v11 = a4.end;
  PolylineCoordinate v12 = a4.start;
  uint64_t v109 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a5;
  long long v100 = 0u;
  long long v101 = 0u;
  long long v99 = 0u;
  -[MNRouteDivergenceFinder _populateConvergencePoints:route:range:isRouteA:](self, "_populateConvergencePoints:route:range:isRouteA:", &v99, v14, v12, v11, 1);
  -[MNRouteDivergenceFinder _populateConvergencePoints:route:range:isRouteA:](self, "_populateConvergencePoints:route:range:isRouteA:", &v99, v15, start, end, 0);
  unint64_t v16 = (uint64_t *)(*((void *)&v99 + 1) + 8 * ((unint64_t)v101 / 0x2A));
  if ((void)v100 == *((void *)&v99 + 1))
  {
    unint64_t v17 = 0;
    unint64_t v19 = 0;
    id v18 = (uint64_t *)(*((void *)&v99 + 1)
                    + (((unint64_t)((((*((void *)&v101 + 1) + (void)v101) >> 1)
                                          * (unsigned __int128)0xC30C30C30C30C30DLL) >> 64) >> 1) & 0x3FFFFFFFFFFFFFF8));
  }
  else
  {
    unint64_t v17 = *(void *)(*((void *)&v99 + 1) + 8 * ((unint64_t)v101 / 0x2A))
        + 96 * ((unint64_t)v101 % 0x2A);
    id v18 = (uint64_t *)(*((void *)&v99 + 1) + 8 * ((*((void *)&v101 + 1) + (void)v101) / 0x2AuLL));
    unint64_t v19 = *v18 + 96 * ((*((void *)&v101 + 1) + (void)v101) % 0x2AuLL);
  }
  PolylineCoordinate v80 = start;
  PolylineCoordinate v81 = end;
  if (v19 == v17
    || (unint64_t v20 = 42 * (v18 - v16)
            - 0x5555555555555555 * ((uint64_t)(v19 - *v18) >> 5)
            + 0x5555555555555555 * ((uint64_t)(v17 - *v16) >> 5)) == 0)
  {
    unint64_t v21 = 0;
  }
  else
  {
    unint64_t v21 = 63 - __clz(v20);
  }
  std::__introsort<std::_ClassicAlgPolicy,-[MNRouteDivergenceFinder _findFirstConvergenceBetweenRoute:range:andRoute:range:outRouteCoordinate:outRouteCoordinate:]::$_3 &,std::__deque_iterator<_MNRouteConvergencePoint,_MNRouteConvergencePoint*,_MNRouteConvergencePoint&,_MNRouteConvergencePoint**,long,42l>,false>(v16, v17, v18, v19, 2 * v21, 1);
  unsigned int v23 = *MEMORY[0x1E4F64198];
  unint64_t v22 = *(unsigned int *)(MEMORY[0x1E4F64198] + 4);
  PolylineCoordinate v24 = (PolylineCoordinate)*MEMORY[0x1E4F64198];
  long long v96 = 0u;
  long long v97 = 0u;
  int v98 = 1065353216;
  std::__hash_table<-[MNRouteDivergenceFinder findAllOverlapRangesBetweenRoutes:]::OverlapCoordinate,-[MNRouteDivergenceFinder findAllOverlapRangesBetweenRoutes:]::$_1,-[MNRouteDivergenceFinder findAllOverlapRangesBetweenRoutes:]::$_2,std::allocator<-[MNRouteDivergenceFinder findAllOverlapRangesBetweenRoutes:]::OverlapCoordinate>>::__rehash_unique[abi:ne180100]((uint64_t)&v96, 0xAuLL);
  __int16 v82 = v15;
  v83 = v14;
  long long v93 = 0u;
  long long v94 = 0u;
  int v95 = 1065353216;
  std::__hash_table<-[MNRouteDivergenceFinder findAllOverlapRangesBetweenRoutes:]::OverlapCoordinate,-[MNRouteDivergenceFinder findAllOverlapRangesBetweenRoutes:]::$_1,-[MNRouteDivergenceFinder findAllOverlapRangesBetweenRoutes:]::$_2,std::allocator<-[MNRouteDivergenceFinder findAllOverlapRangesBetweenRoutes:]::OverlapCoordinate>>::__rehash_unique[abi:ne180100]((uint64_t)&v93, 0xAuLL);
  if ((void)v100 == *((void *)&v99 + 1)) {
    goto LABEL_134;
  }
  unint64_t v25 = *(void *)(*((void *)&v99 + 1) + 8 * ((unint64_t)v101 / 0x2A)) + 96 * ((unint64_t)v101 % 0x2A);
  unint64_t v84 = *(void *)(*((void *)&v99 + 1) + 8 * ((*((void *)&v101 + 1) + (void)v101) / 0x2AuLL))
      + 96 * ((*((void *)&v101 + 1) + (void)v101) % 0x2AuLL);
  if (v25 == v84) {
    goto LABEL_134;
  }
  double v26 = 1.79769313e308;
  unint64_t v27 = *((void *)&v99 + 1) + 8 * ((unint64_t)v101 / 0x2A);
  do
  {
    __int16 v88 = (void *)v27;
    int v90 = *(unsigned __int8 *)(v25 + 89);
    if (*(unsigned char *)(v25 + 89)) {
      float v28 = &v96;
    }
    else {
      float v28 = &v93;
    }
    float v29 = *(float *)(v25 + 76) + (float)*(unsigned int *)(v25 + 72);
    if (v29 == 0.0) {
      unint64_t v30 = 0;
    }
    else {
      unint64_t v30 = LODWORD(v29);
    }
    unint64_t v89 = (uint64_t *)v28;
    unint64_t v31 = *((void *)v28 + 1);
    if (*(unsigned char *)(v25 + 88))
    {
      PolylineCoordinate v85 = v24;
      unint64_t v86 = v22;
      double v32 = (uint64_t *)v28;
      if (v31)
      {
        uint8x8_t v33 = (uint8x8_t)vcnt_s8((int8x8_t)v31);
        v33.i16[0] = vaddlv_u8(v33);
        unint64_t v34 = v33.u32[0];
        if (v33.u32[0] > 1uLL)
        {
          unint64_t v22 = v30;
          if (v30 >= v31) {
            unint64_t v22 = v30 % v31;
          }
        }
        else
        {
          unint64_t v22 = v30 & (v31 + 0xFFFFFFFF);
        }
        unsigned int v38 = *(void **)(*(void *)v28 + 8 * v22);
        if (v38)
        {
          float v39 = (void *)*v38;
          if (*v38)
          {
            while (1)
            {
              unint64_t v40 = v39[1];
              if (v40 == v30)
              {
                if (GEOPolylineCoordinateEqual()) {
                  goto LABEL_83;
                }
              }
              else
              {
                if (v34 > 1)
                {
                  if (v40 >= v31) {
                    v40 %= v31;
                  }
                }
                else
                {
                  v40 &= v31 - 1;
                }
                if (v40 != v22)
                {
LABEL_37:
                  double v32 = v89;
                  break;
                }
              }
              float v39 = (void *)*v39;
              if (!v39) {
                goto LABEL_37;
              }
            }
          }
        }
      }
      v41 = operator new(0x70uLL);
      void *v41 = 0;
      v41[1] = v30;
      long long v42 = *(_OWORD *)(v25 + 16);
      *((_OWORD *)v41 + 1) = *(_OWORD *)v25;
      *((_OWORD *)v41 + 2) = v42;
      long long v43 = *(_OWORD *)(v25 + 32);
      long long v44 = *(_OWORD *)(v25 + 48);
      long long v45 = *(_OWORD *)(v25 + 80);
      *((_OWORD *)v41 + 5) = *(_OWORD *)(v25 + 64);
      *((_OWORD *)v41 + 6) = v45;
      *((_OWORD *)v41 + 3) = v43;
      *((_OWORD *)v41 + 4) = v44;
      if (v90) {
        PolylineCoordinate v46 = &v96;
      }
      else {
        PolylineCoordinate v46 = &v93;
      }
      float v47 = (float)(unint64_t)(*((void *)v46 + 3) + 1);
      uint64_t v48 = &v95;
      if (v90) {
        uint64_t v48 = &v98;
      }
      float v49 = *(float *)v48;
      if (!v31 || (float)(v49 * (float)v31) < v47)
      {
        BOOL v50 = (v31 & (v31 - 1)) != 0;
        if (v31 < 3) {
          BOOL v50 = 1;
        }
        unint64_t v51 = v50 | (2 * v31);
        unint64_t v52 = vcvtps_u32_f32(v47 / v49);
        if (v51 <= v52) {
          size_t v53 = v52;
        }
        else {
          size_t v53 = v51;
        }
        std::__hash_table<-[MNRouteDivergenceFinder findAllOverlapRangesBetweenRoutes:]::OverlapCoordinate,-[MNRouteDivergenceFinder findAllOverlapRangesBetweenRoutes:]::$_1,-[MNRouteDivergenceFinder findAllOverlapRangesBetweenRoutes:]::$_2,std::allocator<-[MNRouteDivergenceFinder findAllOverlapRangesBetweenRoutes:]::OverlapCoordinate>>::__rehash_unique[abi:ne180100]((uint64_t)v32, v53);
        unint64_t v31 = v32[1];
        if ((v31 & (v31 - 1)) != 0)
        {
          if (v30 >= v31) {
            unint64_t v22 = v30 % v31;
          }
          else {
            unint64_t v22 = v30;
          }
        }
        else
        {
          unint64_t v22 = (v31 - 1) & v30;
        }
      }
      uint64_t v57 = *v32;
      uint64_t v58 = *(void **)(*v32 + 8 * v22);
      if (v58)
      {
        void *v41 = *v58;
      }
      else
      {
        uint64_t v59 = &v93;
        if (v90) {
          uint64_t v59 = &v96;
        }
        uint64_t v60 = &v94;
        if (v90) {
          uint64_t v60 = &v97;
        }
        void *v41 = *((void *)v59 + 2);
        *((void *)v59 + 2) = v41;
        *(void *)(v57 + 8 * v22) = v60;
        if (!*v41) {
          goto LABEL_82;
        }
        unint64_t v61 = *(void *)(*v41 + 8);
        if ((v31 & (v31 - 1)) != 0)
        {
          if (v61 >= v31) {
            v61 %= v31;
          }
        }
        else
        {
          v61 &= v31 - 1;
        }
        uint64_t v58 = (void *)(*v32 + 8 * v61);
      }
      void *v58 = v41;
LABEL_82:
      ++*((void *)v46 + 3);
LABEL_83:
      char v62 = &v97;
      if (v90) {
        char v62 = &v94;
      }
      id v63 = *(void **)v62;
      PolylineCoordinate v24 = v85;
      unint64_t v22 = v86;
      if (!*(void *)v62) {
        goto LABEL_98;
      }
      while (1)
      {
        *(void *)long long buf = 0xBF80000000000000;
        double v91 = 0.0;
        unint64_t v92 = 0xBF80000000000000;
        if (-[MNRouteDivergenceFinder _pointMeetsConvergenceThreshold:withOtherPoint:outRouteCoordinateA:outRouteCoordinateB:outDistance:](self, "_pointMeetsConvergenceThreshold:withOtherPoint:outRouteCoordinateA:outRouteCoordinateB:outDistance:", v25, v63 + 2, buf, &v92, &v91, v80, v81))
        {
          double v64 = self->_toleranceMeters * 0.5;
          if (v91 < v64 && v26 < v64)
          {
            if (*(_DWORD *)buf >= v23 && (*(_DWORD *)buf != v23 || *(float *)&buf[4] >= *(float *)&v22)) {
              goto LABEL_97;
            }
          }
          else if (v91 >= v26)
          {
            goto LABEL_97;
          }
          unsigned int v23 = *(_DWORD *)buf;
          unint64_t v22 = *(unsigned int *)&buf[4];
          double v26 = v91;
          PolylineCoordinate v24 = (PolylineCoordinate)v92;
        }
LABEL_97:
        id v63 = (void *)*v63;
        if (!v63) {
          goto LABEL_98;
        }
      }
    }
    if (!v31) {
      goto LABEL_98;
    }
    unint64_t v87 = v22;
    uint8x8_t v35 = (uint8x8_t)vcnt_s8((int8x8_t)v31);
    v35.i16[0] = vaddlv_u8(v35);
    unint64_t v36 = v35.u32[0];
    if (v35.u32[0] > 1uLL)
    {
      unint64_t v37 = v30;
      if (v30 >= v31) {
        unint64_t v37 = v30 % v31;
      }
    }
    else
    {
      unint64_t v37 = v30 & (v31 + 0xFFFFFFFF);
    }
    uint64_t v54 = *(long long ***)(*(void *)v28 + 8 * v37);
    if (!v54 || (uint64_t v55 = *v54) == 0)
    {
LABEL_67:
      unint64_t v22 = v87;
      goto LABEL_98;
    }
    while (1)
    {
      unint64_t v56 = *((void *)v55 + 1);
      if (v56 == v30) {
        break;
      }
      if (v36 > 1)
      {
        if (v56 >= v31) {
          v56 %= v31;
        }
      }
      else
      {
        v56 &= v31 - 1;
      }
      if (v56 != v37) {
        goto LABEL_67;
      }
LABEL_66:
      uint64_t v55 = *(long long **)v55;
      if (!v55) {
        goto LABEL_67;
      }
    }
    if ((GEOPolylineCoordinateEqual() & 1) == 0) {
      goto LABEL_66;
    }
    int8x8_t v66 = (int8x8_t)v89[1];
    unint64_t v67 = *((void *)v55 + 1);
    uint8x8_t v68 = (uint8x8_t)vcnt_s8(v66);
    v68.i16[0] = vaddlv_u8(v68);
    if (v68.u32[0] > 1uLL)
    {
      if (v67 >= *(void *)&v66) {
        v67 %= *(void *)&v66;
      }
    }
    else
    {
      v67 &= *(void *)&v66 - 1;
    }
    long long v69 = *(long long **)v55;
    long long v70 = *(long long **)(*v89 + 8 * v67);
    do
    {
      long long v71 = v70;
      long long v70 = *(long long **)v70;
    }
    while (v70 != v55);
    long long v72 = &v94;
    if (v90) {
      long long v72 = &v97;
    }
    unint64_t v22 = v87;
    if (v71 == v72) {
      goto LABEL_121;
    }
    unint64_t v73 = *((void *)v71 + 1);
    if (v68.u32[0] > 1uLL)
    {
      if (v73 >= *(void *)&v66) {
        v73 %= *(void *)&v66;
      }
    }
    else
    {
      v73 &= *(void *)&v66 - 1;
    }
    if (v73 == v67)
    {
LABEL_123:
      if (v69)
      {
        unint64_t v74 = *((void *)v69 + 1);
        goto LABEL_125;
      }
    }
    else
    {
LABEL_121:
      if (!v69) {
        goto LABEL_122;
      }
      unint64_t v74 = *((void *)v69 + 1);
      if (v68.u32[0] > 1uLL)
      {
        unint64_t v75 = *((void *)v69 + 1);
        if (v74 >= *(void *)&v66) {
          unint64_t v75 = v74 % *(void *)&v66;
        }
      }
      else
      {
        unint64_t v75 = v74 & (*(void *)&v66 - 1);
      }
      if (v75 != v67)
      {
LABEL_122:
        *(void *)(*v89 + 8 * v67) = 0;
        long long v69 = *(long long **)v55;
        goto LABEL_123;
      }
LABEL_125:
      if (v68.u32[0] > 1uLL)
      {
        if (v74 >= *(void *)&v66) {
          v74 %= *(void *)&v66;
        }
      }
      else
      {
        v74 &= *(void *)&v66 - 1;
      }
      if (v74 != v67)
      {
        *(void *)(*v89 + 8 * v74) = v71;
        long long v69 = *(long long **)v55;
      }
    }
    *(void *)long long v71 = v69;
    *(void *)uint64_t v55 = 0;
    unint64_t v76 = &v93;
    if (v90) {
      unint64_t v76 = &v96;
    }
    --*((void *)v76 + 3);
    operator delete(v55);
LABEL_98:
    v25 += 96;
    unint64_t v27 = (unint64_t)v88;
    if (v25 - *v88 == 4032)
    {
      unint64_t v27 = (unint64_t)(v88 + 1);
      unint64_t v25 = v88[1];
    }
  }
  while (v25 != v84);
LABEL_134:
  char v77 = (PolylineCoordinate *)MEMORY[0x1E4F64198];
  *a7 = *(PolylineCoordinate *)MEMORY[0x1E4F64198];
  *a8 = *v77;
  PolylineCoordinate v78 = (PolylineCoordinate)(v23 | (v22 << 32));
  if ((GEOPolylineCoordinateIsInvalid() & 1) == 0)
  {
    if (!GEOPolylineCoordinateInRange() || (GEOPolylineCoordinateInRange() & 1) == 0)
    {
      uint64_t v79 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 136315906;
        *(void *)&uint8_t buf[4] = "-[MNRouteDivergenceFinder _findFirstConvergenceBetweenRoute:range:andRoute:range:outRouteCo"
                             "ordinate:outRouteCoordinate:]";
        __int16 v103 = 2080;
        uint64_t v104 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Misc/MNRouteDivergenceFinder.mm";
        __int16 v105 = 1024;
        int v106 = 1071;
        __int16 v107 = 2080;
        uint64_t v108 = "GEOPolylineCoordinateInRange(convergenceCoordinateA, rangeA) && GEOPolylineCoordinateInRange(convergenceC"
               "oordinateB, rangeB)";
        _os_log_impl(&dword_1B542B000, v79, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s)", buf, 0x26u);
      }
    }
    if (self->_minLengthMetersForConvergence <= 0.0
      || !-[MNRouteDivergenceFinder _pathsDivergeBetweenRoute:from:andRoute:from:withinDistance:](self, "_pathsDivergeBetweenRoute:from:andRoute:from:withinDistance:", v83, v78, v82, v24))
    {
      *a7 = v78;
      *a8 = v24;
    }
  }
  std::__hash_table<-[MNRouteDivergenceFinder findAllOverlapRangesBetweenRoutes:]::OverlapCoordinate,-[MNRouteDivergenceFinder findAllOverlapRangesBetweenRoutes:]::$_1,-[MNRouteDivergenceFinder findAllOverlapRangesBetweenRoutes:]::$_2,std::allocator<-[MNRouteDivergenceFinder findAllOverlapRangesBetweenRoutes:]::OverlapCoordinate>>::~__hash_table((uint64_t)&v93);
  std::__hash_table<-[MNRouteDivergenceFinder findAllOverlapRangesBetweenRoutes:]::OverlapCoordinate,-[MNRouteDivergenceFinder findAllOverlapRangesBetweenRoutes:]::$_1,-[MNRouteDivergenceFinder findAllOverlapRangesBetweenRoutes:]::$_2,std::allocator<-[MNRouteDivergenceFinder findAllOverlapRangesBetweenRoutes:]::OverlapCoordinate>>::~__hash_table((uint64_t)&v96);
  std::deque<_MNRouteConvergencePoint>::~deque[abi:ne180100]((uint64_t)&v99);
}

- (void)_populateConvergencePoints:(void *)a3 route:(id)a4 range:(GEOPolylineCoordinateRange)a5 isRouteA:(BOOL)a6
{
  PolylineCoordinate end = a5.end;
  PolylineCoordinate start = a5.start;
  id v43 = a4;
  id v41 = objc_alloc_init(MEMORY[0x1E4F64870]);
  unint64_t v10 = [v43 legIndexForRouteCoordinate:start];
  PolylineCoordinate v39 = end;
  PolylineCoordinate v11 = start;
  while (1)
  {
    PolylineCoordinate v12 = [v43 legs];
    unint64_t v13 = [v12 count];

    if (v10 >= v13) {
      break;
    }
    id v14 = [v43 legs];
    id v15 = [v14 objectAtIndexedSubscript:v10];

    uint64_t v16 = [v15 startRouteCoordinate];
    uint64_t v17 = [v15 endRouteCoordinate];
    if ((GEOPolylineCoordinateRangeIntersectsRange() & 1) == 0) {
      goto LABEL_13;
    }
    if (GEOPolylineCoordinateIsABeforeB()) {
      uint64_t v18 = v16;
    }
    else {
      uint64_t v18 = (uint64_t)v11;
    }
    if (GEOPolylineCoordinateRangeEncompassesRange())
    {
      objc_msgSend(v41, "addCoordinateRange:", v18, end);
LABEL_13:

      break;
    }
    if (GEOPolylineCoordinateIsABeforeB()) {
      PolylineCoordinate end = v39;
    }
    else {
      PolylineCoordinate end = (PolylineCoordinate)v17;
    }
    objc_msgSend(v41, "addCoordinateRange:", v18, end);

    ++v10;
  }
  unint64_t v19 = 0;
  if (self->_toleranceMeters <= 0.0) {
    double v20 = 0.0;
  }
  else {
    double v20 = INFINITY;
  }
  while (v19 < [v41 count])
  {
    unint64_t v40 = v19;
    uint64_t v21 = [v41 coordinateRangeAtIndex:v19];
    unsigned int v23 = objc_msgSend(MEMORY[0x1E4F64868], "iteratorWithRange:", v21, v22);
    [v23 advance];
    while ([v23 isCurrentValid])
    {
      objc_msgSend(v43, "pointAtRouteCoordinate:", objc_msgSend(v23, "previous"));
      double v25 = v24;
      double v27 = v26;
      double v29 = v28;
      *(double *)&long long v67 = v24;
      *((double *)&v67 + 1) = v26;
      double v68 = v28;
      objc_msgSend(v43, "pointAtRouteCoordinate:", objc_msgSend(v23, "current"));
      *(double *)&long long v65 = v30;
      *((double *)&v65 + 1) = v31;
      double v66 = v32;
      if (vabdd_f64(v25, v30) >= 0.00000000999999994
        || vabdd_f64(v27, v31) >= 0.00000000999999994
        || vabdd_f64(v29, v32) >= 0.00000000999999994)
      {
        BOOL v33 = v31 < v27;
        if (v31 >= v27) {
          double v34 = v25;
        }
        else {
          double v34 = v30;
        }
        if (v31 >= v27) {
          double v35 = v27;
        }
        else {
          double v35 = v31;
        }
        if (v31 >= v27) {
          double v36 = v29;
        }
        else {
          double v36 = v32;
        }
        unint64_t v37 = &v65;
        if (v33) {
          unint64_t v37 = &v67;
        }
        long long v63 = *v37;
        uint64_t v64 = *((void *)v37 + 2);
        if (fabs(v20) == INFINITY)
        {
          GEOCalculateDistance();
          double v20 = -1.0 / v38 * self->_toleranceMeters;
        }
        *(double *)uint64_t v54 = v34;
        *(double *)&v54[1] = v35 + v20;
        *(double *)&v54[2] = v36;
        long long v55 = v67;
        double v56 = v68;
        long long v57 = v65;
        double v58 = v66;
        uint64_t v59 = [v23 previous];
        uint64_t v60 = [v23 current];
        char v61 = 1;
        BOOL v62 = a6;
        std::deque<_MNRouteConvergencePoint>::emplace_back<_MNRouteConvergencePoint&>(a3, (uint64_t)v54);
        long long v44 = v63;
        uint64_t v45 = v64;
        long long v46 = v67;
        double v47 = v68;
        long long v48 = v65;
        double v49 = v66;
        uint64_t v50 = [v23 previous];
        uint64_t v51 = [v23 current];
        char v52 = 0;
        BOOL v53 = a6;
        objc_msgSend(v23, "advance", std::deque<_MNRouteConvergencePoint>::emplace_back<_MNRouteConvergencePoint&>(a3, (uint64_t)&v44).n128_f64[0]);
      }
      else
      {
        [v23 advance];
      }
    }

    unint64_t v19 = v40 + 1;
  }
}

- (BOOL)_pointMeetsConvergenceThreshold:(const _MNRouteConvergencePoint *)a3 withOtherPoint:(const _MNRouteConvergencePoint *)a4 outRouteCoordinateA:(PolylineCoordinate *)a5 outRouteCoordinateB:(PolylineCoordinate *)a6 outDistance:(double *)a7
{
  if (a3->var6) {
    PolylineCoordinate v11 = a3;
  }
  else {
    PolylineCoordinate v11 = a4;
  }
  if (a3->var6) {
    PolylineCoordinate v12 = a4;
  }
  else {
    PolylineCoordinate v12 = a3;
  }
  -[MNRouteDivergenceFinder _distanceFromCoordinate:toSegmentStart:segmentEnd:](self, "_distanceFromCoordinate:toSegmentStart:segmentEnd:", v11->var1.var0, v11->var1.var1, v11->var1.var2, v12->var1.var0, v12->var1.var1, v12->var1.var2, *(void *)&v12->var2.var0, *(void *)&v12->var2.var1, *(void *)&v12->var2.var2);
  double v14 = v13;
  -[MNRouteDivergenceFinder _distanceFromCoordinate:toSegmentStart:segmentEnd:](self, "_distanceFromCoordinate:toSegmentStart:segmentEnd:", v12->var1.var0, v12->var1.var1, v12->var1.var2, v11->var1.var0, v11->var1.var1, v11->var1.var2, *(void *)&v11->var2.var0, *(void *)&v11->var2.var1, *(void *)&v11->var2.var2);
  double v16 = v15;
  double toleranceMeters = self->_toleranceMeters;
  BOOL v18 = v16 <= toleranceMeters || v14 <= toleranceMeters;
  if (v18)
  {
    a5->index = v11->var3.index;
    -[MNRouteDivergenceFinder _offsetForCoordinate:alongSegmentStart:segmentEnd:](self, "_offsetForCoordinate:alongSegmentStart:segmentEnd:", v12->var1.var0, v12->var1.var1, v12->var1.var2, v11->var1.var0, v11->var1.var1, v11->var1.var2, *(void *)&v11->var2.var0, *(void *)&v11->var2.var1, *(void *)&v11->var2.var2);
    float v20 = v19;
    a5->float offset = v20;
    float offset = v11->var3.offset;
    float v22 = v11->var4.offset;
    if (offset > 0.0 || v22 > 0.0)
    {
      if (v22 <= 0.0) {
        float v22 = 1.0;
      }
      a5->float offset = offset + (float)((float)(v22 - offset) * v20);
    }
    PolylineCoordinate v23 = *a5;
    int IsInvalid = GEOPolylineCoordinateIsInvalid();
    uint64_t v25 = MEMORY[0x1E4F64198];
    if (IsInvalid)
    {
      unsigned int v26 = *MEMORY[0x1E4F64198];
      float v27 = *(float *)(MEMORY[0x1E4F64198] + 4);
    }
    else
    {
      float v27 = v23.offset - floorf(v23.offset);
      unsigned int v26 = vcvtms_u32_f32(v23.offset) + v23.index;
    }
    *a5 = (PolylineCoordinate)(v26 | ((unint64_t)LODWORD(v27) << 32));
    a6->index = v12->var3.index;
    -[MNRouteDivergenceFinder _offsetForCoordinate:alongSegmentStart:segmentEnd:](self, "_offsetForCoordinate:alongSegmentStart:segmentEnd:", v11->var1.var0, v11->var1.var1, v11->var1.var2, v12->var1.var0, v12->var1.var1, v12->var1.var2, *(void *)&v12->var2.var0, *(void *)&v12->var2.var1, *(void *)&v12->var2.var2);
    float v29 = v28;
    a6->float offset = v29;
    float v30 = v12->var3.offset;
    float v31 = v12->var4.offset;
    if (v30 > 0.0 || v31 > 0.0)
    {
      if (v31 <= 0.0) {
        float v31 = 1.0;
      }
      a6->float offset = v30 + (float)((float)(v31 - v30) * v29);
    }
    PolylineCoordinate v32 = *a6;
    if (GEOPolylineCoordinateIsInvalid())
    {
      unsigned int v33 = *(_DWORD *)v25;
      float v34 = *(float *)(v25 + 4);
    }
    else
    {
      float v34 = v32.offset - floorf(v32.offset);
      unsigned int v33 = vcvtms_u32_f32(v32.offset) + v32.index;
    }
    *a6 = (PolylineCoordinate)(v33 | ((unint64_t)LODWORD(v34) << 32));
    if (v14 >= v16) {
      double v35 = v16;
    }
    else {
      double v35 = v14;
    }
    *a7 = v35;
  }
  return v18;
}

- (PolylineCoordinate)_firstRouteCoordinateWithinToleranceOnRoute:(id)a3 nearCoordinate:(id)a4 range:(GEOPolylineCoordinateRange)a5
{
  PolylineCoordinate end = a5.end;
  double var2 = a4.var2;
  double var1 = a4.var1;
  double var0 = a4.var0;
  PolylineCoordinate start = a5.start;
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  double v14 = MNGetMNRouteDivergenceLog();
  os_signpost_id_t v15 = os_signpost_id_make_with_pointer(v14, self);

  double v16 = MNGetMNRouteDivergenceLog();
  uint64_t v17 = v16;
  os_signpost_id_t spid = v15;
  unint64_t v18 = v15 - 1;
  if (v18 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    double v19 = [v13 uniqueRouteID];
    float v20 = [v19 UUIDString];
    uint64_t v21 = GEOPolylineCoordinateRangeAsString();
    *(_DWORD *)long long buf = 138413058;
    uint64_t v51 = v20;
    __int16 v52 = 2048;
    double v53 = var0;
    __int16 v54 = 2048;
    double v55 = var1;
    __int16 v56 = 2112;
    long long v57 = v21;
    _os_signpost_emit_with_name_impl(&dword_1B542B000, v17, OS_SIGNPOST_INTERVAL_BEGIN, spid, "_firstRouteCoordinate", "Route: %@ | %f, %f | [%@]", buf, 0x2Au);
  }
  float v22 = objc_msgSend(v13, "_navigation_leafBoundingSectionContainingCoordinate:", var0, var1, var2);
  PolylineCoordinate v23 = v22;
  if (v22)
  {
    [v22 range];
    if (GEOPolylineCoordinateWithinRange())
    {
      [v23 range];
      double v24 = MNGetMNRouteDivergenceLog();
      uint64_t v25 = v24;
      if (v18 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
      {
        unsigned int v26 = GEOPolylineCoordinateRangeAsString();
        *(_DWORD *)long long buf = 138412290;
        uint64_t v51 = v26;
        _os_signpost_emit_with_name_impl(&dword_1B542B000, v25, OS_SIGNPOST_EVENT, spid, "_firstRouteCoordinate", "Optimizing search range start using bounding section. New search range is: [%@]", buf, 0xCu);
      }
    }
    float v27 = objc_msgSend(MEMORY[0x1E4F64868], "iteratorWithRange:", start, end);
    [v27 advance];
    if ([v27 isCurrentValid])
    {
      objc_msgSend(v13, "pointAtRouteCoordinate:", objc_msgSend(v27, "previous"));
      double v6 = v28;
      double v7 = v29;
      double v5 = v30;
    }
    while ([v27 isCurrentValid])
    {
      objc_msgSend(v13, "pointAtRouteCoordinate:", objc_msgSend(v27, "current"));
      double v32 = v31;
      double v34 = v33;
      double v36 = v35;
      -[MNRouteDivergenceFinder _distanceFromCoordinate:toSegmentStart:segmentEnd:](self, "_distanceFromCoordinate:toSegmentStart:segmentEnd:", var0, var1, var2, v6, v7, v5, *(void *)&v31, *(void *)&v33, *(void *)&v35);
      if (v37 < self->_toleranceMeters)
      {
        PolylineCoordinate v40 = -[MNRouteDivergenceFinder _routeCoordinateForLocationCoordinate:route:startIndex:](self, "_routeCoordinateForLocationCoordinate:route:startIndex:", v13, [v27 previous], var0, var1, var2);
        id v43 = MNGetMNRouteDivergenceLog();
        long long v44 = v43;
        if (v18 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v43))
        {
          uint64_t v45 = GEOPolylineCoordinateAsShortString();
          GEOPolylineCoordinateRangeAsString();
          double v46 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
          *(_DWORD *)long long buf = 138412546;
          uint64_t v51 = v45;
          __int16 v52 = 2112;
          double v53 = v46;
          _os_signpost_emit_with_name_impl(&dword_1B542B000, v44, OS_SIGNPOST_INTERVAL_END, spid, "_firstRouteCoordinate", "Found result at: [%@], range: [%@]", buf, 0x16u);
        }
        goto LABEL_27;
      }
      [v27 advance];
      double v6 = v32;
      double v7 = v34;
      double v5 = v36;
    }
    id v41 = MNGetMNRouteDivergenceLog();
    long long v42 = v41;
    if (v18 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v41))
    {
      *(_WORD *)long long buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B542B000, v42, OS_SIGNPOST_INTERVAL_END, spid, "_firstRouteCoordinate", "Searched entire range and found no valid point on route near coordinate", buf, 2u);
    }

    PolylineCoordinate v40 = (PolylineCoordinate)*MEMORY[0x1E4F64198];
LABEL_27:
  }
  else
  {
    double v38 = MNGetMNRouteDivergenceLog();
    PolylineCoordinate v39 = v38;
    if (v18 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v38))
    {
      *(_WORD *)long long buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B542B000, v39, OS_SIGNPOST_INTERVAL_END, spid, "_firstRouteCoordinate", "Checked route bounds and found no valid point on route near coordinate", buf, 2u);
    }

    PolylineCoordinate v40 = (PolylineCoordinate)*MEMORY[0x1E4F64198];
  }

  return v40;
}

- (double)_distanceFromCoordinate:(id)a3 toSegmentStart:(id)a4 segmentEnd:(id)a5
{
  GEOClosestCoordinateOnLineSegmentFromCoordinate3D();
  GEOCalculateDistance();
  return result;
}

- (PolylineCoordinate)_closestRouteCoordinateOnRoute:(id)a3 toLocationCoordinate:(id)a4 inRange:(GEOPolylineCoordinateRange)a5
{
  PolylineCoordinate end = a5.end;
  PolylineCoordinate start = a5.start;
  double var2 = a4.var2;
  double var1 = a4.var1;
  double var0 = a4.var0;
  id v11 = a3;
  PolylineCoordinate v12 = objc_msgSend(MEMORY[0x1E4F64868], "iteratorWithRange:", start, end);
  [v12 advance];
  unsigned int index = 0;
  uint64_t v14 = 3212836864;
  double v15 = 1.79769313e308;
  while ([v12 isCurrentValid])
  {
    objc_msgSend(v11, "pointAtRouteCoordinate:", objc_msgSend(v12, "previous"));
    objc_msgSend(v11, "pointAtRouteCoordinate:", objc_msgSend(v12, "current"));
    double v30 = var1;
    double v31 = var2;
    double v29 = var0;
    GEOClosestCoordinateOnLineSegmentFromCoordinate3D();
    double v17 = v16;
    double v19 = v18;
    double v21 = v20;
    GEOCalculateDistance();
    double v23 = v22;
    if (v22 < v15)
    {
      PolylineCoordinate v24 = -[MNRouteDivergenceFinder _routeCoordinateForLocationCoordinate:route:startIndex:](self, "_routeCoordinateForLocationCoordinate:route:startIndex:", v11, objc_msgSend(v12, "previous", *(void *)&var0, *(void *)&var1, *(void *)&var2), v17, v19, v21);
      unsigned int index = v24.index;
      uint64_t v14 = HIDWORD(*(unint64_t *)&v24);
      double v15 = v23;
    }
    objc_msgSend(v12, "advance", *(void *)&v29, *(void *)&v30, *(void *)&v31);
  }
  int IsABeforeB = GEOPolylineCoordinateIsABeforeB();
  unint64_t v26 = index | (unint64_t)(v14 << 32);
  if (IsABeforeB) {
    PolylineCoordinate v27 = start;
  }
  else {
    PolylineCoordinate v27 = end;
  }
  if (!IsABeforeB) {
    PolylineCoordinate end = start;
  }
  if (GEOPolylineCoordinateIsABeforeB()) {
    PolylineCoordinate end = (PolylineCoordinate)v26;
  }
  if (!GEOPolylineCoordinateIsABeforeB()) {
    PolylineCoordinate end = v27;
  }

  return end;
}

- (PolylineCoordinate)_routeCoordinateForLocationCoordinate:(id)a3 route:(id)a4 startIndex:(unint64_t)a5
{
  double var2 = a3.var2;
  double var1 = a3.var1;
  double var0 = a3.var0;
  id v10 = a4;
  [v10 pointAt:a5];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  [v10 pointAt:a5 + 1];
  -[MNRouteDivergenceFinder _offsetForCoordinate:alongSegmentStart:segmentEnd:](self, "_offsetForCoordinate:alongSegmentStart:segmentEnd:", var0, var1, var2, v12, v14, v16, v17, v18, v19);
  double v21 = fmin(v20, 1.0);
  if (v21 < 0.0) {
    double v21 = 0.0;
  }
  float v22 = v21;
  if (v22 >= 1.0)
  {
    LODWORD(a5) = vcvtms_u32_f32(v22) + a5;
    float v22 = v22 - (float)floorf(v22);
  }

  return (PolylineCoordinate)(a5 | ((unint64_t)LODWORD(v22) << 32));
}

- (double)_offsetForCoordinate:(id)a3 alongSegmentStart:(id)a4 segmentEnd:(id)a5
{
  if (vabdd_f64(a4.var0, a5.var0) <= 0.0000005)
  {
    double v7 = 0.0;
    if (vabdd_f64(a4.var1, a5.var1) <= 0.0000005) {
      goto LABEL_6;
    }
    double v5 = a3.var1 - a4.var1;
    double v6 = a5.var1 - a4.var1;
  }
  else
  {
    double v5 = a3.var0 - a4.var0;
    double v6 = a5.var0 - a4.var0;
  }
  double v7 = v5 / v6;
LABEL_6:
  double result = fmin(v7, 1.0);
  if (result < 0.0) {
    return 0.0;
  }
  return result;
}

- (id)_stringForCoordinate:(id)a3
{
  return (id)[NSString stringWithFormat:@"%0.6f, %0.6f", a3.var0, a3.var1, a3.var2, *(void *)&a3.var0, *(void *)&a3.var1];
}

- (id)_routesArrayIdentifierStrings:(id)a3
{
  unint64_t v3 = objc_msgSend(a3, "_geo_map:", &__block_literal_global_31);
  os_signpost_id_t v4 = [v3 componentsJoinedByString:@", "];

  return v4;
}

id __57__MNRouteDivergenceFinder__routesArrayIdentifierStrings___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 uniqueRouteID];
  unint64_t v3 = [v2 description];

  return v3;
}

- (double)toleranceMeters
{
  return self->_toleranceMeters;
}

- (void)setToleranceMeters:(double)a3
{
  self->_double toleranceMeters = a3;
}

- (double)minLengthMetersForConvergence
{
  return self->_minLengthMetersForConvergence;
}

- (void)setMinLengthMetersForConvergence:(double)a3
{
  self->_minLengthMetersForConvergence = a3;
}

- (void)findAllOverlapRangesBetweenRoutes:
{
  v1 = *a1;
  v2 = (char *)**a1;
  if (v2)
  {
    os_signpost_id_t v4 = (char *)v1[1];
    double v5 = **a1;
    if (v4 != v2)
    {
      double v6 = (char *)v1[1];
      do
      {
        unint64_t v8 = (void *)*((void *)v6 - 3);
        v6 -= 24;
        double v7 = v8;
        if (v8)
        {
          *((void *)v4 - 2) = v7;
          operator delete(v7);
        }
        os_signpost_id_t v4 = v6;
      }
      while (v6 != v2);
      double v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

- (float)findAllOverlapRangesBetweenRoutes:(uint64_t)a3
{
- (void)findAllOverlapRangesBetweenRoutes:(uint64_t)a1
{
  if (__n == 1)
  {
    size_t prime = 2;
  }
  else
  {
    size_t prime = __n;
    if ((__n & (__n - 1)) != 0) {
      size_t prime = std::__next_prime(__n);
    }
  }
  int8x8_t v4 = *(int8x8_t *)(a1 + 8);
  if (prime <= *(void *)&v4)
  {
    if (prime >= *(void *)&v4) {
      return;
    }
    unint64_t v11 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
    if (*(void *)&v4 < 3uLL || (uint8x8_t v12 = (uint8x8_t)vcnt_s8(v4), v12.i16[0] = vaddlv_u8(v12), v12.u32[0] > 1uLL))
    {
      unint64_t v11 = std::__next_prime(v11);
    }
    else
    {
      uint64_t v13 = 1 << -(char)__clz(v11 - 1);
      if (v11 >= 2) {
        unint64_t v11 = v13;
      }
    }
    if (prime <= v11) {
      size_t prime = v11;
    }
    if (prime >= *(void *)&v4) {
      return;
    }
    if (!prime)
    {
      double v16 = *(void **)a1;
      *(void *)a1 = 0;
      if (v16) {
        operator delete(v16);
      }
      *(void *)(a1 + 8) = 0;
      return;
    }
  }
  if (prime >> 61) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  BOOL v5 = operator new(8 * prime);
  BOOL v6 = *(void **)a1;
  *(void *)a1 = v5;
  if (v6) {
    operator delete(v6);
  }
  uint64_t v7 = 0;
  *(void *)(a1 + 8) = prime;
  do
    *(void *)(*(void *)a1 + 8 * v7++) = 0;
  while (prime != v7);
  unint64_t v8 = *(void **)(a1 + 16);
  if (v8)
  {
    size_t v9 = v8[1];
    uint8x8_t v10 = (uint8x8_t)vcnt_s8((int8x8_t)prime);
    v10.i16[0] = vaddlv_u8(v10);
    if (v10.u32[0] > 1uLL)
    {
      if (v9 >= prime) {
        v9 %= prime;
      }
    }
    else
    {
      v9 &= prime - 1;
    }
    *(void *)(*(void *)a1 + 8 * v9) = a1 + 16;
    unint64_t v14 = (void *)*v8;
    if (*v8)
    {
      do
      {
        size_t v15 = v14[1];
        if (v10.u32[0] > 1uLL)
        {
          if (v15 >= prime) {
            v15 %= prime;
          }
        }
        else
        {
          v15 &= prime - 1;
        }
        if (v15 != v9)
        {
          if (!*(void *)(*(void *)a1 + 8 * v15))
          {
            *(void *)(*(void *)a1 + 8 * v15) = v8;
            goto LABEL_31;
          }
          void *v8 = *v14;
          void *v14 = **(void **)(*(void *)a1 + 8 * v15);
          **(void **)(*(void *)a1 + 8 * v15) = v14;
          unint64_t v14 = v8;
        }
        size_t v15 = v9;
LABEL_31:
        unint64_t v8 = v14;
        unint64_t v14 = (void *)*v14;
        size_t v9 = v15;
      }
      while (v14);
    }
  }
}

- (uint64_t)findAllOverlapRangesBetweenRoutes:(uint64_t)a1
{
  v2 = *(void **)(a1 + 16);
  if (v2)
  {
    do
    {
      unint64_t v3 = (void *)*v2;
      operator delete(v2);
      v2 = v3;
    }
    while (v3);
  }
  int8x8_t v4 = *(void **)a1;
  *(void *)a1 = 0;
  if (v4) {
    operator delete(v4);
  }
  return a1;
}

- (void)findOverlappingSectionsForRoutes:
{
  v1 = *a1;
  v2 = (char *)**a1;
  if (v2)
  {
    int8x8_t v4 = (char *)v1[1];
    BOOL v5 = **a1;
    if (v4 != v2)
    {
      do
      {
        BOOL v6 = v4 - 24;
        std::__tree<std::__value_type<geo::PolylineCoordinate,std::vector<-[MNRouteDivergenceFinder findOverlappingSectionsForRoutes:]::RouteSectionEndpoint>>,std::__map_value_compare<geo::PolylineCoordinate,std::__value_type<geo::PolylineCoordinate,std::vector<-[MNRouteDivergenceFinder findOverlappingSectionsForRoutes:]::RouteSectionEndpoint>>,std::less<geo::PolylineCoordinate>,true>,std::allocator<std::__value_type<geo::PolylineCoordinate,std::vector<-[MNRouteDivergenceFinder findOverlappingSectionsForRoutes:]::RouteSectionEndpoint>>>>::destroy(*((void **)v4 - 2));
        int8x8_t v4 = v6;
      }
      while (v6 != v2);
      BOOL v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

- (void)findOverlappingSectionsForRoutes:(void *)a1
{
  v2 = (void *)a1[6];
  if (v2)
  {
    a1[7] = v2;
    operator delete(v2);
  }
  unint64_t v3 = (void *)a1[1];
  std::__tree<unsigned long>::destroy(v3);
}

- (uint64_t)findOverlappingSectionsForRoutes:(uint64_t)a1
{
  v2 = *(void **)a1;
  *(void *)a1 = 0;
  if (v2)
  {
    if (*(unsigned char *)(a1 + 16)) {
      std::allocator_traits<std::allocator<std::__tree_node<std::__value_type<-[MNRouteDivergenceFinder findOverlappingSectionsForRoutes:]::RouteSectionKey,std::vector<-[MNRouteDivergenceFinder findOverlappingSectionsForRoutes:]::RouteSection>>,void *>>>::destroy[abi:ne180100]<std::pair<-[MNRouteDivergenceFinder findOverlappingSectionsForRoutes:]::RouteSectionKey const,std::vector<-[MNRouteDivergenceFinder findOverlappingSectionsForRoutes:]::RouteSection>>,void,void>(v2 + 4);
    }
    operator delete(v2);
  }
  return a1;
}

- (uint64_t)findOverlappingSectionsForRoutes:
{
  unint64_t v3 = *(void *)(a2 + 16);
  unint64_t v4 = *(void *)(a3 + 16);
  if (v3 != v4) {
    return v3 < v4;
  }
  unint64_t v8 = (void *)(a2 + 8);
  size_t v9 = *(void **)a2;
  if (*(void *)a2 == a2 + 8)
  {
LABEL_16:
    GEOCalculateDistance();
    if (v18 >= *a1)
    {
      double v19 = *(double *)(a2 + 24);
      double v20 = *(double *)(a3 + 24);
      if (vabdd_f64(v19, v20) < 0.0001)
      {
        double v19 = *(double *)(a2 + 32);
        double v20 = *(double *)(a3 + 32);
      }
      return v19 < v20;
    }
    return 0;
  }
  uint8x8_t v10 = *(void **)a3;
  unint64_t v11 = *(void **)a3;
  uint8x8_t v12 = *(void **)a2;
  while (v12[4] == v11[4])
  {
    uint64_t v13 = (void *)v12[1];
    unint64_t v14 = v12;
    if (v13)
    {
      do
      {
        uint8x8_t v12 = v13;
        uint64_t v13 = (void *)*v13;
      }
      while (v13);
    }
    else
    {
      do
      {
        uint8x8_t v12 = (void *)v14[2];
        BOOL v15 = *v12 == (void)v14;
        unint64_t v14 = v12;
      }
      while (!v15);
    }
    double v16 = (void *)v11[1];
    if (v16)
    {
      do
      {
        __n128 v17 = v16;
        double v16 = (void *)*v16;
      }
      while (v16);
    }
    else
    {
      do
      {
        __n128 v17 = (void *)v11[2];
        BOOL v15 = *v17 == (void)v11;
        unint64_t v11 = v17;
      }
      while (!v15);
    }
    unint64_t v11 = v17;
    if (v12 == v8) {
      goto LABEL_16;
    }
  }
  if (v10 == (void *)(a3 + 8)) {
    return 0;
  }
  while (v9 != v8)
  {
    unint64_t v22 = v9[4];
    unint64_t v23 = v10[4];
    if (v22 < v23) {
      break;
    }
    if (v23 < v22) {
      return 0;
    }
    unsigned __int32 v24 = (void *)v9[1];
    unsigned __int32 v25 = v9;
    if (v24)
    {
      do
      {
        size_t v9 = v24;
        unsigned __int32 v24 = (void *)*v24;
      }
      while (v24);
    }
    else
    {
      do
      {
        size_t v9 = (void *)v25[2];
        BOOL v15 = *v9 == (void)v25;
        unsigned __int32 v25 = v9;
      }
      while (!v15);
    }
    uint64_t v26 = (void *)v10[1];
    if (v26)
    {
      do
      {
        unsigned __int32 v27 = v26;
        uint64_t v26 = (void *)*v26;
      }
      while (v26);
    }
    else
    {
      do
      {
        unsigned __int32 v27 = (void *)v10[2];
        BOOL v15 = *v27 == (void)v10;
        uint8x8_t v10 = v27;
      }
      while (!v15);
    }
    uint64_t result = 0;
    uint8x8_t v10 = v27;
    if (v27 == (void *)(a3 + 8)) {
      return result;
    }
  }
  return 1;
}

- (void)_findFirstConvergenceBetweenRoute:(uint64_t *)a1 range:(unint64_t)a2 andRoute:(uint64_t *)a3 range:(unint64_t)a4 outRouteCoordinate:(uint64_t)a5 outRouteCoordinate:(char)a6
{
  uint64_t v473 = *MEMORY[0x1E4F143B8];
  BOOL v6 = a4 > a2;
  if (a4 == a2) {
    return;
  }
  unint64_t v7 = a4;
  uint64_t v9 = a2;
  while (1)
  {
    uint64_t v11 = 42 * (a3 - a1);
    uint64_t v12 = *a3;
    uint64_t v13 = *a1;
    uint64_t v14 = v9 - *a1;
    uint64_t v15 = v14 >> 5;
    uint64_t v16 = v11 - 0x5555555555555555 * ((uint64_t)(v7 - *a3) >> 5) + 0x5555555555555555 * (v14 >> 5);
    if (!v6) {
      break;
    }
    if (v16 <= 23)
    {
      if (a6)
      {
        for (uint64_t i = v9 + 96; ; i += 96)
        {
          if (i - v13 == 4032)
          {
            uint64_t v222 = a1[1];
            ++a1;
            uint64_t v13 = v222;
            uint64_t i = v222;
          }
          if (i == v7) {
            return;
          }
          v223 = a1;
          uint64_t v224 = i;
          if (i == v13)
          {
            v223 = a1 - 1;
            uint64_t v224 = *(a1 - 1) + 4032;
          }
          double v225 = *(double *)(i + 8);
          double v226 = *(double *)(v224 - 88);
          if (v225 >= v226)
          {
            if (v225 > v226 || !*(unsigned char *)(i + 88) || *(unsigned char *)(v224 - 8)) {
              continue;
            }
            int v227 = 1;
          }
          else
          {
            int v227 = *(unsigned __int8 *)(i + 88);
          }
          v228 = (double *)(v224 - 96);
          uint64_t v229 = *(void *)i;
          long long v230 = *(_OWORD *)(i + 32);
          long long v231 = *(_OWORD *)(i + 48);
          long long v232 = *(_OWORD *)(i + 64);
          *(void *)v472 = *(void *)(i + 80);
          long long v470 = v231;
          long long v471 = v232;
          long long v469 = v230;
          long long v468 = *(_OWORD *)(i + 16);
          char v233 = *(unsigned char *)(i + 89);
          long long v234 = *(_OWORD *)((char *)v228 + 74);
          long long v236 = *((_OWORD *)v228 + 3);
          long long v235 = *((_OWORD *)v228 + 4);
          *(_OWORD *)(i + 32) = *((_OWORD *)v228 + 2);
          *(_OWORD *)(i + 48) = v236;
          *(_OWORD *)(i + 64) = v235;
          *(_OWORD *)(i + 74) = v234;
          long long v237 = *((_OWORD *)v228 + 1);
          *(_OWORD *)uint64_t i = *(_OWORD *)v228;
          *(_OWORD *)(i + 16) = v237;
          v238 = (double *)v9;
          if (v228 != (double *)v9)
          {
            while (1)
            {
              if (v228 == (double *)*v223)
              {
                uint64_t v239 = *--v223;
                v240 = (double *)(v239 + 4032);
              }
              else
              {
                v240 = v228;
              }
              double v241 = *(v240 - 11);
              if (v225 >= v241 && (v225 > v241 || !v227 || *((unsigned char *)v240 - 8))) {
                break;
              }
              long long v243 = *((_OWORD *)v240 - 6);
              long long v244 = *((_OWORD *)v240 - 5);
              v242 = v240 - 12;
              *(_OWORD *)v228 = v243;
              *((_OWORD *)v228 + 1) = v244;
              long long v245 = *((_OWORD *)v242 + 2);
              long long v246 = *((_OWORD *)v242 + 3);
              long long v247 = *((_OWORD *)v242 + 4);
              *(_OWORD *)((char *)v228 + 74) = *(_OWORD *)((char *)v242 + 74);
              *((_OWORD *)v228 + 3) = v246;
              *((_OWORD *)v228 + 4) = v247;
              *((_OWORD *)v228 + 2) = v245;
              v228 = v242;
              if (v242 == (double *)v9)
              {
                v238 = (double *)v9;
                goto LABEL_220;
              }
            }
            v238 = v228;
          }
LABEL_220:
          *(void *)v238 = v229;
          v238[1] = v225;
          uint64_t v248 = *(void *)v472;
          long long v249 = v471;
          *((_OWORD *)v238 + 3) = v470;
          *((_OWORD *)v238 + 4) = v249;
          *((void *)v238 + 10) = v248;
          long long v250 = v469;
          *((_OWORD *)v238 + 1) = v468;
          *((_OWORD *)v238 + 2) = v250;
          *((unsigned char *)v238 + 88) = v227;
          *((unsigned char *)v238 + 89) = v233;
          uint64_t v13 = *a1;
        }
      }
      unint64_t v410 = 0xAAAAAAAAAAAAAAABLL * v15;
      if (v14 >= -95)
      {
        unint64_t v411 = v410 + 1;
        v419 = &a1[(v410 + 1) / 0x2A];
        unint64_t v420 = *v419;
        unint64_t v421 = *v419 + 96 * (v411 % 0x2A);
      }
      else
      {
        unint64_t v417 = 40 - v410;
        unint64_t v418 = 40 - v410;
        v419 = &a1[-((40 - v410) / 0x2A)];
        unint64_t v420 = *v419;
        unint64_t v421 = *v419 + 96 * (42 * (v418 / 0x2A) - v417) + 3936;
      }
      if (v421 == v7) {
        return;
      }
      while (2)
      {
        unint64_t v422 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v421 - v420) >> 5);
        if ((uint64_t)(v421 - v420) >= 97)
        {
          unint64_t v423 = v422 - 1;
          unint64_t v424 = (v422 - 1) / 0x2A;
          v427 = &v419[v424];
          uint64_t v428 = *v427 + 96 * (v423 - 42 * v424);
        }
        else
        {
          unint64_t v425 = 42 - v422;
          unint64_t v426 = (42 - v422) / 0x2A;
          v427 = &v419[-v426];
          uint64_t v428 = *v427 + 96 * (42 * v426 - v425) + 3936;
        }
        double v429 = *(double *)(v421 + 8);
        double v430 = *(double *)(v428 + 8);
        if (v429 >= v430)
        {
          if (v429 <= v430 && *(unsigned char *)(v421 + 88) && !*(unsigned char *)(v428 + 88))
          {
            int v431 = 1;
            goto LABEL_369;
          }
        }
        else
        {
          int v431 = *(unsigned __int8 *)(v421 + 88);
LABEL_369:
          uint64_t v432 = *(void *)v421;
          long long v433 = *(_OWORD *)(v421 + 32);
          long long v434 = *(_OWORD *)(v421 + 64);
          long long v470 = *(_OWORD *)(v421 + 48);
          long long v471 = v434;
          *(void *)v472 = *(void *)(v421 + 80);
          long long v469 = v433;
          long long v468 = *(_OWORD *)(v421 + 16);
          char v435 = *(unsigned char *)(v421 + 89);
          v436 = (_OWORD *)v421;
          while (1)
          {
            uint64_t v437 = v428;
            long long v438 = *(_OWORD *)(v428 + 16);
            _OWORD *v436 = *(_OWORD *)v428;
            v436[1] = v438;
            long long v439 = *(_OWORD *)(v428 + 32);
            long long v440 = *(_OWORD *)(v428 + 48);
            long long v441 = *(_OWORD *)(v428 + 64);
            *(_OWORD *)((char *)v436 + 74) = *(_OWORD *)(v428 + 74);
            v436[3] = v440;
            v436[4] = v441;
            v436[2] = v439;
            if (v428 == *v427)
            {
              uint64_t v442 = *--v427;
              uint64_t v443 = v442 + 4032;
            }
            else
            {
              uint64_t v443 = v428;
            }
            uint64_t v428 = v443 - 96;
            double v444 = *(double *)(v443 - 88);
            v436 = (_OWORD *)v437;
            if (v429 >= v444)
            {
              if (v429 > v444) {
                break;
              }
              if (!v431) {
                break;
              }
              v436 = (_OWORD *)v437;
              if (*(unsigned char *)(v443 - 8)) {
                break;
              }
            }
          }
          *(void *)uint64_t v437 = v432;
          *(double *)(v437 + 8) = v429;
          uint64_t v445 = *(void *)v472;
          long long v446 = v471;
          *(_OWORD *)(v437 + 48) = v470;
          *(_OWORD *)(v437 + 64) = v446;
          *(void *)(v437 + 80) = v445;
          long long v447 = v469;
          *(_OWORD *)(v437 + 16) = v468;
          *(_OWORD *)(v437 + 32) = v447;
          *(unsigned char *)(v437 + 88) = v431;
          *(unsigned char *)(v437 + 89) = v435;
          unint64_t v420 = *v419;
        }
        v421 += 96;
        if (v421 - v420 == 4032)
        {
          unint64_t v448 = v419[1];
          ++v419;
          unint64_t v420 = v448;
          unint64_t v421 = v448;
        }
        if (v421 == v7) {
          return;
        }
        continue;
      }
    }
    if (!a5)
    {
      v453 = a3;
      unint64_t v456 = v7;
      unint64_t v251 = (unint64_t)(v16 - 2) >> 1;
      int64_t v459 = v251;
      while (1)
      {
        unint64_t v252 = v251;
        *(void *)&long long v468 = a1;
        *((void *)&v468 + 1) = v9;
        std::__deque_iterator<_MNRouteConvergencePoint,_MNRouteConvergencePoint*,_MNRouteConvergencePoint&,_MNRouteConvergencePoint**,long,42l>::operator+=[abi:ne180100](&v468, v251);
        v253 = (uint64_t *)*((void *)&v468 + 1);
        if (v9 == *((void *)&v468 + 1))
        {
          uint64_t v254 = 0;
        }
        else
        {
          uint64_t v254 = 42 * ((uint64_t)(v468 - (void)a1) >> 3)
               - 0x5555555555555555 * ((uint64_t)(*((void *)&v468 + 1) - *(void *)v468) >> 5)
               + 0x5555555555555555 * ((v9 - *a1) >> 5);
          if (v459 < v254) {
            goto LABEL_245;
          }
        }
        uint64_t v255 = 2 * v254;
        uint64_t v256 = (2 * v254) | 1;
        *(void *)&long long v468 = a1;
        *((void *)&v468 + 1) = v9;
        std::__deque_iterator<_MNRouteConvergencePoint,_MNRouteConvergencePoint*,_MNRouteConvergencePoint&,_MNRouteConvergencePoint**,long,42l>::operator+=[abi:ne180100](&v468, v256);
        uint64_t v257 = *((void *)&v468 + 1);
        if (v255 + 2 < v16)
        {
          uint64_t v258 = *((void *)&v468 + 1) - *(void *)v468;
          unint64_t v259 = 0xAAAAAAAAAAAAAAABLL * (v258 >> 5);
          unint64_t v260 = v258 >= -95
               ? *(void *)(v468 + 8 * ((v259 + 1) / 0x2A)) + 96 * ((v259 + 1) % 0x2A)
               : *(void *)(v468 - 8 * ((40 - v259) / 0x2A)) + 96 * (42 * ((40 - v259) / 0x2A) - (40 - v259)) + 3936;
          double v261 = *(double *)(*((void *)&v468 + 1) + 8);
          double v262 = *(double *)(v260 + 8);
          if (v261 < v262 || v261 <= v262 && *(unsigned char *)(*((void *)&v468 + 1) + 88) && !*(unsigned char *)(v260 + 88))
          {
            uint64_t v257 = *((void *)&v468 + 1) + 96;
            if (*((void *)&v468 + 1) + 96 - *(void *)v468 == 4032) {
              uint64_t v257 = *(void *)(v468 + 8);
            }
            uint64_t v256 = v255 + 2;
          }
        }
        double v263 = *(double *)(v257 + 8);
        double v264 = *((double *)v253 + 1);
        if (v263 >= v264)
        {
          if (v263 > v264)
          {
            int v265 = *((unsigned __int8 *)v253 + 88);
LABEL_242:
            double v267 = *(double *)v253;
            long long v268 = *((_OWORD *)v253 + 3);
            long long v469 = *((_OWORD *)v253 + 2);
            long long v470 = v268;
            long long v471 = *((_OWORD *)v253 + 4);
            *(void *)v472 = v253[10];
            long long v468 = *((_OWORD *)v253 + 1);
            char v449 = *((unsigned char *)v253 + 89);
            long long v269 = *(_OWORD *)v257;
            *((_OWORD *)v253 + 1) = *(_OWORD *)(v257 + 16);
            long long v271 = *(_OWORD *)(v257 + 48);
            long long v270 = *(_OWORD *)(v257 + 64);
            long long v272 = *(_OWORD *)(v257 + 74);
            *((_OWORD *)v253 + 2) = *(_OWORD *)(v257 + 32);
            *((_OWORD *)v253 + 3) = v271;
            *(_OWORD *)((char *)v253 + 74) = v272;
            *((_OWORD *)v253 + 4) = v270;
            *(_OWORD *)v253 = v269;
            if (v459 >= v256)
            {
              while (1)
              {
                uint64_t v277 = 2 * v256;
                uint64_t v256 = (2 * v256) | 1;
                *(void *)&long long v463 = a1;
                *((void *)&v463 + 1) = v9;
                std::__deque_iterator<_MNRouteConvergencePoint,_MNRouteConvergencePoint*,_MNRouteConvergencePoint&,_MNRouteConvergencePoint**,long,42l>::operator+=[abi:ne180100](&v463, v256);
                uint64_t v273 = *((void *)&v463 + 1);
                if (v277 + 2 < v16)
                {
                  uint64_t v278 = *((void *)&v463 + 1) - *(void *)v463;
                  unint64_t v279 = 0xAAAAAAAAAAAAAAABLL * (v278 >> 5);
                  unint64_t v280 = v278 >= -95
                       ? *(void *)(v463 + 8 * ((v279 + 1) / 0x2A)) + 96 * ((v279 + 1) % 0x2A)
                       : *(void *)(v463 - 8 * ((40 - v279) / 0x2A))
                       + 96 * (42 * ((40 - v279) / 0x2A) - (40 - v279))
                       + 3936;
                  double v281 = *(double *)(*((void *)&v463 + 1) + 8);
                  double v282 = *(double *)(v280 + 8);
                  if (v281 < v282
                    || v281 <= v282 && *(unsigned char *)(*((void *)&v463 + 1) + 88) && !*(unsigned char *)(v280 + 88))
                  {
                    uint64_t v273 = *((void *)&v463 + 1) + 96;
                    if (*((void *)&v463 + 1) + 96 - *(void *)v463 == 4032) {
                      uint64_t v273 = *(void *)(v463 + 8);
                    }
                    uint64_t v256 = v277 + 2;
                  }
                }
                double v283 = *(double *)(v273 + 8);
                if (v283 < v264) {
                  break;
                }
                if (v283 <= v264 && *(unsigned char *)(v273 + 88) && v265 == 0) {
                  break;
                }
                long long v285 = *(_OWORD *)(v273 + 16);
                *(_OWORD *)uint64_t v257 = *(_OWORD *)v273;
                *(_OWORD *)(v257 + 16) = v285;
                long long v286 = *(_OWORD *)(v273 + 32);
                long long v287 = *(_OWORD *)(v273 + 48);
                long long v288 = *(_OWORD *)(v273 + 64);
                *(_OWORD *)(v257 + 74) = *(_OWORD *)(v273 + 74);
                *(_OWORD *)(v257 + 48) = v287;
                *(_OWORD *)(v257 + 64) = v288;
                *(_OWORD *)(v257 + 32) = v286;
                uint64_t v257 = v273;
                if (v459 < v256) {
                  goto LABEL_244;
                }
              }
            }
            uint64_t v273 = v257;
LABEL_244:
            *(double *)uint64_t v273 = v267;
            *(double *)(v273 + 8) = v264;
            uint64_t v274 = *(void *)v472;
            long long v275 = v471;
            *(_OWORD *)(v273 + 48) = v470;
            *(_OWORD *)(v273 + 64) = v275;
            *(void *)(v273 + 80) = v274;
            long long v276 = v469;
            *(_OWORD *)(v273 + 16) = v468;
            *(_OWORD *)(v273 + 32) = v276;
            *(unsigned char *)(v273 + 88) = v265;
            *(unsigned char *)(v273 + 89) = v449;
            goto LABEL_245;
          }
          int v265 = *((unsigned __int8 *)v253 + 88);
          if (*(unsigned char *)(v257 + 88)) {
            BOOL v266 = v265 == 0;
          }
          else {
            BOOL v266 = 0;
          }
          if (!v266) {
            goto LABEL_242;
          }
        }
LABEL_245:
        unint64_t v251 = v252 - 1;
        if (!v252)
        {
          v290 = v453;
          uint64_t v289 = v456;
          uint64_t v291 = v11 - 0x5555555555555555 * ((uint64_t)(v456 - *v453) >> 5) + 0x5555555555555555 * ((v9 - *a1) >> 5);
          if (v291 < 2) {
            return;
          }
          while (2)
          {
            v454 = v290;
            uint64_t v457 = v289;
            uint64_t v292 = 0;
            long long v293 = *(_OWORD *)(v9 + 16);
            long long v468 = *(_OWORD *)v9;
            long long v469 = v293;
            long long v294 = *(_OWORD *)(v9 + 32);
            long long v295 = *(_OWORD *)(v9 + 48);
            long long v296 = *(_OWORD *)(v9 + 80);
            *(_OWORD *)v472 = *(_OWORD *)(v9 + 64);
            *(_OWORD *)&v472[16] = v296;
            long long v470 = v294;
            long long v471 = v295;
            *(void *)&long long v463 = a1;
            *((void *)&v463 + 1) = v9;
            v297 = (_OWORD *)v9;
            do
            {
              v298 = v297;
              std::__deque_iterator<_MNRouteConvergencePoint,_MNRouteConvergencePoint*,_MNRouteConvergencePoint&,_MNRouteConvergencePoint**,long,42l>::operator+=[abi:ne180100](&v463, v292 + 1);
              uint64_t v299 = 2 * v292;
              uint64_t v292 = (2 * v292) | 1;
              uint64_t v300 = v299 + 2;
              v297 = (_OWORD *)*((void *)&v463 + 1);
              if (v300 < v291)
              {
                uint64_t v301 = *((void *)&v463 + 1) - *(void *)v463;
                unint64_t v302 = 0xAAAAAAAAAAAAAAABLL * (v301 >> 5);
                unint64_t v303 = v301 < -95
                     ? *(void *)(v463 - 8 * ((40 - v302) / 0x2A))
                     + 96 * (42 * ((40 - v302) / 0x2A) - (40 - v302))
                     + 3936
                     : *(void *)(v463 + 8 * ((v302 + 1) / 0x2A)) + 96 * ((v302 + 1) % 0x2A);
                double v304 = *(double *)(*((void *)&v463 + 1) + 8);
                double v305 = *(double *)(v303 + 8);
                if (v304 < v305 || v304 <= v305 && *(unsigned char *)(*((void *)&v463 + 1) + 88) && !*(unsigned char *)(v303 + 88))
                {
                  v297 = (_OWORD *)(*((void *)&v463 + 1) + 96);
                  *((void *)&v463 + 1) = v297;
                  if ((_OWORD *)((char *)v297 - *(void *)v463) == (_OWORD *)4032)
                  {
                    v297 = *(_OWORD **)(v463 + 8);
                    *(void *)&long long v463 = v463 + 8;
                    *((void *)&v463 + 1) = v297;
                  }
                  uint64_t v292 = v300;
                }
              }
              long long v306 = v297[1];
              _OWORD *v298 = *v297;
              v298[1] = v306;
              long long v307 = v297[2];
              long long v308 = v297[3];
              long long v309 = v297[4];
              *(_OWORD *)((char *)v298 + 74) = *(_OWORD *)((char *)v297 + 74);
              v298[3] = v308;
              v298[4] = v309;
              v298[2] = v307;
            }
            while (v292 <= (uint64_t)((unint64_t)(v291 - 2) >> 1));
            v310 = (void *)v463;
            uint64_t v311 = v457;
            if (*v454 == v457) {
              uint64_t v311 = *(v454 - 1) + 4032;
            }
            v312 = (_OWORD *)(v311 - 96);
            if (v297 == v312)
            {
              v297[2] = v470;
              v297[3] = v471;
              v297[4] = *(_OWORD *)v472;
              *(_OWORD *)((char *)v297 + 74) = *(_OWORD *)&v472[10];
              _OWORD *v297 = v468;
              v297[1] = v469;
            }
            else
            {
              long long v313 = v312[1];
              _OWORD *v297 = *v312;
              v297[1] = v313;
              long long v314 = v312[2];
              long long v315 = v312[3];
              long long v316 = v312[4];
              *(_OWORD *)((char *)v297 + 74) = *(_OWORD *)((char *)v312 + 74);
              v297[3] = v315;
              v297[4] = v316;
              v297[2] = v314;
              uint64_t v317 = (uint64_t)(v297 + 6);
              if ((_OWORD *)((char *)v297 - *v310 + 96) == (_OWORD *)4032)
              {
                uint64_t v318 = v310[1];
                ++v310;
                uint64_t v317 = v318;
              }
              long long v319 = v469;
              _OWORD *v312 = v468;
              v312[1] = v319;
              long long v320 = v470;
              long long v321 = v471;
              long long v322 = *(_OWORD *)v472;
              *(_OWORD *)((char *)v312 + 74) = *(_OWORD *)&v472[10];
              v312[3] = v321;
              v312[4] = v322;
              v312[2] = v320;
              if (v317 != v9)
              {
                uint64_t v323 = 42 * (v310 - a1)
                     - 0x5555555555555555 * ((v317 - *v310) >> 5)
                     + 0x5555555555555555 * ((v9 - *a1) >> 5);
                BOOL v6 = v323 < 2;
                unint64_t v324 = v323 - 2;
                if (!v6)
                {
                  unint64_t v450 = v324;
                  uint64_t v325 = v324 >> 1;
                  *(void *)&long long v463 = a1;
                  *((void *)&v463 + 1) = v9;
                  std::__deque_iterator<_MNRouteConvergencePoint,_MNRouteConvergencePoint*,_MNRouteConvergencePoint&,_MNRouteConvergencePoint**,long,42l>::operator+=[abi:ne180100](&v463, v324 >> 1);
                  if (*v310 == v317) {
                    uint64_t v317 = *(v310 - 1) + 4032;
                  }
                  v326 = (_OWORD *)*((void *)&v463 + 1);
                  double v327 = *(double *)(*((void *)&v463 + 1) + 8);
                  double v328 = *(double *)(v317 - 88);
                  if (v327 < v328)
                  {
                    int v460 = *(unsigned __int8 *)(v317 - 8);
                    unint64_t v329 = v450;
                    goto LABEL_295;
                  }
                  unint64_t v329 = v450;
                  if (v327 <= v328 && *(unsigned char *)(*((void *)&v463 + 1) + 88) && !*(unsigned char *)(v317 - 8))
                  {
                    int v460 = 0;
LABEL_295:
                    v330 = (_OWORD *)(v317 - 96);
                    uint64_t v331 = *(void *)(v317 - 96);
                    long long v463 = *(_OWORD *)(v317 - 80);
                    long long v332 = *(_OWORD *)(v317 - 64);
                    long long v333 = *(_OWORD *)(v317 - 48);
                    long long v334 = *(_OWORD *)(v317 - 32);
                    uint64_t v467 = *(void *)(v317 - 16);
                    long long v465 = v333;
                    long long v466 = v334;
                    long long v464 = v332;
                    char v451 = *(unsigned char *)(v317 - 7);
                    long long v335 = *(_OWORD *)((char *)v326 + 74);
                    long long v337 = v326[2];
                    long long v336 = v326[3];
                    v330[4] = v326[4];
                    long long v338 = v326[1];
                    _OWORD *v330 = *v326;
                    v330[1] = v338;
                    v330[2] = v337;
                    v330[3] = v336;
                    *(_OWORD *)((char *)v330 + 74) = v335;
                    if (v329 >= 2)
                    {
                      v339 = v326;
                      while (1)
                      {
                        unint64_t v340 = v325 - 1;
                        uint64_t v325 = (unint64_t)(v325 - 1) >> 1;
                        v461 = a1;
                        uint64_t v462 = v9;
                        std::__deque_iterator<_MNRouteConvergencePoint,_MNRouteConvergencePoint*,_MNRouteConvergencePoint&,_MNRouteConvergencePoint**,long,42l>::operator+=[abi:ne180100](&v461, v325);
                        v326 = (_OWORD *)v462;
                        double v341 = *(double *)(v462 + 8);
                        if (v341 >= v328)
                        {
                          if (v341 > v328) {
                            break;
                          }
                          if (!*(unsigned char *)(v462 + 88) || v460 != 0) {
                            break;
                          }
                        }
                        long long v343 = *(_OWORD *)(v462 + 16);
                        _OWORD *v339 = *(_OWORD *)v462;
                        v339[1] = v343;
                        long long v344 = v326[2];
                        long long v345 = v326[3];
                        long long v346 = v326[4];
                        *(_OWORD *)((char *)v339 + 74) = *(_OWORD *)((char *)v326 + 74);
                        v339[3] = v345;
                        v339[4] = v346;
                        v339[2] = v344;
                        v339 = v326;
                        if (v340 <= 1) {
                          goto LABEL_312;
                        }
                      }
                      v326 = v339;
                    }
LABEL_312:
                    *(void *)v326 = v331;
                    *((double *)v326 + 1) = v328;
                    uint64_t v347 = v467;
                    long long v348 = v466;
                    v326[3] = v465;
                    v326[4] = v348;
                    *((void *)v326 + 10) = v347;
                    long long v349 = v464;
                    v326[1] = v463;
                    v326[2] = v349;
                    *((unsigned char *)v326 + 88) = v460;
                    *((unsigned char *)v326 + 89) = v451;
                  }
                }
              }
            }
            v290 = v454;
            uint64_t v350 = v457;
            if (v457 == *v454)
            {
              v290 = v454 - 1;
              uint64_t v350 = *(v454 - 1) + 4032;
            }
            uint64_t v289 = v350 - 96;
            BOOL v6 = v291-- <= 2;
            if (v6) {
              return;
            }
            continue;
          }
        }
      }
    }
    uint64_t v17 = a5;
    uint64_t v18 = (unint64_t)v16 >> 1;
    if ((unint64_t)v16 >= 0x81)
    {
      *(void *)&long long v468 = a1;
      *((void *)&v468 + 1) = v9;
      std::__deque_iterator<_MNRouteConvergencePoint,_MNRouteConvergencePoint*,_MNRouteConvergencePoint&,_MNRouteConvergencePoint**,long,42l>::operator+=[abi:ne180100](&v468, (unint64_t)v16 >> 1);
      uint64_t v19 = v7 - *a3;
      unint64_t v20 = 0xAAAAAAAAAAAAAAABLL * (v19 >> 5);
      if (v19 >= 97)
      {
        unint64_t v21 = v20 - 1;
        unint64_t v28 = &a3[v21 / 0x2A];
        uint64_t v29 = *v28 + 96 * (v21 % 0x2A);
      }
      else
      {
        unint64_t v27 = 42 - v20;
        unint64_t v28 = &a3[-(v27 / 0x2A)];
        uint64_t v29 = *v28 + 96 * (42 * (v27 / 0x2A) - v27) + 3936;
      }
      uint64_t v452 = v17;
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[MNRouteDivergenceFinder _findFirstConvergenceBetweenRoute:range:andRoute:range:outRouteCoordinate:outRouteCoordinate:]::$_3 &,std::__deque_iterator<_MNRouteConvergencePoint,_MNRouteConvergencePoint*,_MNRouteConvergencePoint&,_MNRouteConvergencePoint**,long,42l>>((uint64_t)a1, v9, v468, *((uint64_t *)&v468 + 1), (uint64_t)v28, v29);
      uint64_t v30 = v9 - *a1;
      unint64_t v31 = 0xAAAAAAAAAAAAAAABLL * (v30 >> 5);
      if (v30 < -95)
      {
        unint64_t v37 = 40 - v31;
        unsigned __int32 v33 = &a1[-(v37 / 0x2A)];
        uint64_t v34 = *v33 + 96 * (42 * (v37 / 0x2A) - v37) + 3936;
      }
      else
      {
        unint64_t v32 = v31 + 1;
        unsigned __int32 v33 = &a1[v32 / 0x2A];
        uint64_t v34 = *v33 + 96 * (v32 % 0x2A);
      }
      *(void *)&long long v468 = a1;
      *((void *)&v468 + 1) = v9;
      std::__deque_iterator<_MNRouteConvergencePoint,_MNRouteConvergencePoint*,_MNRouteConvergencePoint&,_MNRouteConvergencePoint**,long,42l>::operator+=[abi:ne180100](&v468, v18 - 1);
      uint64_t v38 = v7 - *a3;
      unint64_t v39 = 0xAAAAAAAAAAAAAAABLL * (v38 >> 5);
      if (v38 < 193)
      {
        unint64_t v43 = 43 - v39;
        BOOL v41 = &a3[-(v43 / 0x2A)];
        uint64_t v42 = *v41 + 96 * (42 * (v43 / 0x2A) - v43) + 3936;
      }
      else
      {
        unint64_t v40 = v39 - 2;
        BOOL v41 = &a3[v40 / 0x2A];
        uint64_t v42 = *v41 + 96 * (v40 % 0x2A);
      }
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[MNRouteDivergenceFinder _findFirstConvergenceBetweenRoute:range:andRoute:range:outRouteCoordinate:outRouteCoordinate:]::$_3 &,std::__deque_iterator<_MNRouteConvergencePoint,_MNRouteConvergencePoint*,_MNRouteConvergencePoint&,_MNRouteConvergencePoint**,long,42l>>((uint64_t)v33, v34, v468, *((uint64_t *)&v468 + 1), (uint64_t)v41, v42);
      uint64_t v44 = v9 - *a1;
      unint64_t v45 = 0xAAAAAAAAAAAAAAABLL * (v44 >> 5);
      if (v44 < -191)
      {
        unint64_t v49 = 39 - v45;
        unsigned __int32 v47 = &a1[-(v49 / 0x2A)];
        uint64_t v48 = *v47 + 96 * (42 * (v49 / 0x2A) - v49) + 3936;
      }
      else
      {
        unint64_t v46 = v45 + 2;
        unsigned __int32 v47 = &a1[v46 / 0x2A];
        uint64_t v48 = *v47 + 96 * (v46 % 0x2A);
      }
      *(void *)&long long v468 = a1;
      *((void *)&v468 + 1) = v9;
      std::__deque_iterator<_MNRouteConvergencePoint,_MNRouteConvergencePoint*,_MNRouteConvergencePoint&,_MNRouteConvergencePoint**,long,42l>::operator+=[abi:ne180100](&v468, v18 + 1);
      unint64_t v455 = v7;
      uint64_t v50 = v7 - *a3;
      unint64_t v51 = 0xAAAAAAAAAAAAAAABLL * (v50 >> 5);
      if (v50 < 289)
      {
        unint64_t v56 = 44 - v51;
        long long v53 = a3;
        __int16 v54 = &a3[-(v56 / 0x2A)];
        uint64_t v55 = *v54 + 96 * (42 * (v56 / 0x2A) - v56) + 3936;
      }
      else
      {
        unint64_t v52 = v51 - 3;
        long long v53 = a3;
        __int16 v54 = &a3[v52 / 0x2A];
        uint64_t v55 = *v54 + 96 * (v52 % 0x2A);
      }
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[MNRouteDivergenceFinder _findFirstConvergenceBetweenRoute:range:andRoute:range:outRouteCoordinate:outRouteCoordinate:]::$_3 &,std::__deque_iterator<_MNRouteConvergencePoint,_MNRouteConvergencePoint*,_MNRouteConvergencePoint&,_MNRouteConvergencePoint**,long,42l>>((uint64_t)v47, v48, v468, *((uint64_t *)&v468 + 1), (uint64_t)v54, v55);
      *(void *)&long long v468 = a1;
      *((void *)&v468 + 1) = v9;
      std::__deque_iterator<_MNRouteConvergencePoint,_MNRouteConvergencePoint*,_MNRouteConvergencePoint&,_MNRouteConvergencePoint**,long,42l>::operator+=[abi:ne180100](&v468, v18 - 1);
      long long v57 = v468;
      *(void *)&long long v468 = a1;
      *((void *)&v468 + 1) = v9;
      std::__deque_iterator<_MNRouteConvergencePoint,_MNRouteConvergencePoint*,_MNRouteConvergencePoint&,_MNRouteConvergencePoint**,long,42l>::operator+=[abi:ne180100](&v468, v18);
      uint64_t v58 = *((void *)&v468 + 1);
      uint64_t v59 = v468;
      *(void *)&long long v468 = a1;
      *((void *)&v468 + 1) = v9;
      std::__deque_iterator<_MNRouteConvergencePoint,_MNRouteConvergencePoint*,_MNRouteConvergencePoint&,_MNRouteConvergencePoint**,long,42l>::operator+=[abi:ne180100](&v468, v18 + 1);
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[MNRouteDivergenceFinder _findFirstConvergenceBetweenRoute:range:andRoute:range:outRouteCoordinate:outRouteCoordinate:]::$_3 &,std::__deque_iterator<_MNRouteConvergencePoint,_MNRouteConvergencePoint*,_MNRouteConvergencePoint&,_MNRouteConvergencePoint**,long,42l>>(v57, *((uint64_t *)&v57 + 1), v59, v58, v468, *((uint64_t *)&v468 + 1));
      *(void *)&long long v468 = a1;
      *((void *)&v468 + 1) = v9;
      std::__deque_iterator<_MNRouteConvergencePoint,_MNRouteConvergencePoint*,_MNRouteConvergencePoint&,_MNRouteConvergencePoint**,long,42l>::operator+=[abi:ne180100](&v468, v18);
      unsigned __int32 v60 = (_OWORD *)*((void *)&v468 + 1);
      long long v61 = *(_OWORD *)(v9 + 16);
      long long v468 = *(_OWORD *)v9;
      long long v469 = v61;
      long long v62 = *(_OWORD *)(v9 + 32);
      long long v63 = *(_OWORD *)(v9 + 48);
      long long v64 = *(_OWORD *)(v9 + 80);
      *(_OWORD *)v472 = *(_OWORD *)(v9 + 64);
      *(_OWORD *)&v472[16] = v64;
      long long v470 = v62;
      long long v471 = v63;
      long long v66 = v60[3];
      long long v65 = v60[4];
      long long v67 = v60[2];
      *(_OWORD *)(v9 + 74) = *(_OWORD *)((char *)v60 + 74);
      *(_OWORD *)(v9 + 48) = v66;
      *(_OWORD *)(v9 + 64) = v65;
      *(_OWORD *)(v9 + 32) = v67;
      long long v68 = v60[1];
      *(_OWORD *)uint64_t v9 = *v60;
      *(_OWORD *)(v9 + 16) = v68;
      v60[3] = v471;
      v60[2] = v470;
      v60[4] = *(_OWORD *)v472;
      *(_OWORD *)((char *)v60 + 74) = *(_OWORD *)&v472[10];
      *unsigned __int32 v60 = v468;
      v60[1] = v469;
      a3 = v53;
      uint64_t v36 = v452;
      unint64_t v7 = v455;
    }
    else
    {
      *(void *)&long long v468 = a1;
      *((void *)&v468 + 1) = v9;
      std::__deque_iterator<_MNRouteConvergencePoint,_MNRouteConvergencePoint*,_MNRouteConvergencePoint&,_MNRouteConvergencePoint**,long,42l>::operator+=[abi:ne180100](&v468, (unint64_t)v16 >> 1);
      uint64_t v22 = v7 - *a3;
      unint64_t v23 = 0xAAAAAAAAAAAAAAABLL * (v22 >> 5);
      if (v22 < 97)
      {
        unint64_t v35 = 42 - v23;
        unsigned __int32 v25 = &a3[-(v35 / 0x2A)];
        uint64_t v26 = *v25 + 96 * (42 * (v35 / 0x2A) - v35) + 3936;
      }
      else
      {
        unint64_t v24 = v23 - 1;
        unsigned __int32 v25 = &a3[v24 / 0x2A];
        uint64_t v26 = *v25 + 96 * (v24 % 0x2A);
      }
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[MNRouteDivergenceFinder _findFirstConvergenceBetweenRoute:range:andRoute:range:outRouteCoordinate:outRouteCoordinate:]::$_3 &,std::__deque_iterator<_MNRouteConvergencePoint,_MNRouteConvergencePoint*,_MNRouteConvergencePoint&,_MNRouteConvergencePoint**,long,42l>>(v468, *((uint64_t *)&v468 + 1), (uint64_t)a1, v9, (uint64_t)v25, v26);
      uint64_t v36 = v17;
    }
    a5 = v36 - 1;
    if (a6)
    {
      double v69 = *(double *)(v9 + 8);
    }
    else
    {
      uint64_t v70 = v9 - *a1;
      unint64_t v71 = 0xAAAAAAAAAAAAAAABLL * (v70 >> 5);
      if (v70 < 97) {
        unint64_t v72 = a1[-((42 - v71) / 0x2A)] + 96 * (42 * ((42 - v71) / 0x2A) - (42 - v71)) + 3936;
      }
      else {
        unint64_t v72 = a1[(v71 - 1) / 0x2A] + 96 * ((v71 - 1) % 0x2A);
      }
      double v73 = *(double *)(v72 + 8);
      double v69 = *(double *)(v9 + 8);
      if (v73 >= v69)
      {
        if (v73 > v69)
        {
          int v137 = *(unsigned __int8 *)(v9 + 88);
LABEL_121:
          uint64_t v146 = *(void *)v9;
          long long v147 = *(_OWORD *)(v9 + 32);
          long long v148 = *(_OWORD *)(v9 + 48);
          long long v149 = *(_OWORD *)(v9 + 64);
          uint64_t v467 = *(void *)(v9 + 80);
          long long v466 = v149;
          long long v150 = *(_OWORD *)(v9 + 16);
          long long v464 = v147;
          long long v465 = v148;
          long long v463 = v150;
          v151 = (double *)*a3;
          uint64_t v152 = v7 - *a3;
          unint64_t v153 = 0xAAAAAAAAAAAAAAABLL * (v152 >> 5);
          if (v152 < 97) {
            unint64_t v154 = a3[-((42 - v153) / 0x2A)] + 96 * (42 * ((42 - v153) / 0x2A) - (42 - v153)) + 3936;
          }
          else {
            unint64_t v154 = a3[(v153 - 1) / 0x2A] + 96 * ((v153 - 1) % 0x2A);
          }
          char v155 = *(unsigned char *)(v9 + 89);
          double v156 = *(double *)(v154 + 8);
          if (v69 < v156 || v69 <= v156 && v137 && !*(unsigned char *)(v154 + 88))
          {
            uint64_t v157 = *a1;
            unint64_t v139 = v9;
            do
            {
              v139 += 96;
              if (v139 - v157 == 4032)
              {
                unint64_t v158 = a1[1];
                ++a1;
                uint64_t v157 = v158;
                unint64_t v139 = v158;
              }
              double v159 = *(double *)(v139 + 8);
            }
            while (v69 >= v159 && (v69 > v159 || !v137 || *(unsigned char *)(v139 + 88)));
          }
          else
          {
            uint64_t v157 = *a1;
            unint64_t v139 = v9;
            do
            {
              v139 += 96;
              if (v139 - v157 == 4032)
              {
                unint64_t v160 = a1[1];
                ++a1;
                uint64_t v157 = v160;
                unint64_t v139 = v160;
              }
              if (a1 >= a3 && (a1 != a3 || v139 >= v7)) {
                break;
              }
              double v161 = *(double *)(v139 + 8);
              if (v69 < v161) {
                break;
              }
            }
            while (v69 > v161 || !v137 || *(unsigned char *)(v139 + 88));
          }
          if (a1 < a3 || (id v162 = a3, v163 = (double *)v7, a1 == a3) && (id v162 = a3, v163 = (double *)v7, v139 < v7))
          {
            id v162 = a3;
            v163 = (double *)v7;
            do
            {
              if (v163 == v151)
              {
                v165 = (double *)*--v162;
                v151 = v165;
                v164 = v165 + 504;
              }
              else
              {
                v164 = v163;
              }
              v163 = v164 - 12;
              double v166 = *(v164 - 11);
            }
            while (v69 < v166 || v69 <= v166 && v137 && !*((unsigned char *)v164 - 8));
          }
          while (a1 < v162 || a1 == v162 && v139 < (unint64_t)v163)
          {
            long long v167 = *(_OWORD *)(v139 + 16);
            long long v468 = *(_OWORD *)v139;
            long long v469 = v167;
            long long v168 = *(_OWORD *)(v139 + 32);
            long long v169 = *(_OWORD *)(v139 + 48);
            long long v170 = *(_OWORD *)(v139 + 80);
            *(_OWORD *)v472 = *(_OWORD *)(v139 + 64);
            *(_OWORD *)&v472[16] = v170;
            long long v470 = v168;
            long long v471 = v169;
            long long v172 = *((_OWORD *)v163 + 3);
            long long v171 = *((_OWORD *)v163 + 4);
            long long v173 = *((_OWORD *)v163 + 2);
            *(_OWORD *)(v139 + 74) = *(_OWORD *)((char *)v163 + 74);
            *(_OWORD *)(v139 + 48) = v172;
            *(_OWORD *)(v139 + 64) = v171;
            *(_OWORD *)(v139 + 32) = v173;
            long long v174 = *((_OWORD *)v163 + 1);
            *(_OWORD *)unint64_t v139 = *(_OWORD *)v163;
            *(_OWORD *)(v139 + 16) = v174;
            long long v175 = v469;
            *(_OWORD *)v163 = v468;
            *((_OWORD *)v163 + 1) = v175;
            long long v176 = v470;
            long long v177 = v471;
            long long v178 = *(_OWORD *)v472;
            *(_OWORD *)((char *)v163 + 74) = *(_OWORD *)&v472[10];
            *((_OWORD *)v163 + 3) = v177;
            *((_OWORD *)v163 + 4) = v178;
            *((_OWORD *)v163 + 2) = v176;
            uint64_t v157 = *a1;
            do
            {
              v139 += 96;
              if (v139 - v157 == 4032)
              {
                unint64_t v179 = a1[1];
                ++a1;
                uint64_t v157 = v179;
                unint64_t v139 = v179;
              }
              double v180 = *(double *)(v139 + 8);
            }
            while (v69 >= v180 && (v69 > v180 || !v137 || *(unsigned char *)(v139 + 88)));
            v181 = (double *)*v162;
            while (1)
            {
              if (v163 == v181)
              {
                double v183 = (double *)*--v162;
                v181 = v183;
                uint64_t v182 = v183 + 504;
              }
              else
              {
                uint64_t v182 = v163;
              }
              v163 = v182 - 12;
              double v184 = *(v182 - 11);
              if (v69 >= v184)
              {
                if (v69 > v184) {
                  break;
                }
                int v185 = *((unsigned __int8 *)v182 - 8);
                if (!v137 || v185) {
                  break;
                }
              }
            }
          }
          uint64_t v186 = v139 - v157;
          unint64_t v187 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v139 - v157) >> 5);
          if (v186 < 97) {
            unint64_t v188 = a1[-((42 - v187) / 0x2A)] + 96 * (42 * ((42 - v187) / 0x2A) - (42 - v187)) + 3936;
          }
          else {
            unint64_t v188 = a1[(v187 - 1) / 0x2A] + 96 * ((v187 - 1) % 0x2A);
          }
          if (v188 != v9)
          {
            long long v189 = *(_OWORD *)(v188 + 16);
            *(_OWORD *)uint64_t v9 = *(_OWORD *)v188;
            *(_OWORD *)(v9 + 16) = v189;
            long long v190 = *(_OWORD *)(v188 + 32);
            long long v191 = *(_OWORD *)(v188 + 48);
            long long v192 = *(_OWORD *)(v188 + 64);
            *(_OWORD *)(v9 + 74) = *(_OWORD *)(v188 + 74);
            *(_OWORD *)(v9 + 48) = v191;
            *(_OWORD *)(v9 + 64) = v192;
            *(_OWORD *)(v9 + 32) = v190;
          }
          a6 = 0;
          *(void *)unint64_t v188 = v146;
          *(double *)(v188 + 8) = v69;
          long long v193 = v463;
          *(_OWORD *)(v188 + 32) = v464;
          *(_OWORD *)(v188 + 48) = v465;
          *(_OWORD *)(v188 + 64) = v466;
          *(void *)(v188 + 80) = v467;
          *(_OWORD *)(v188 + 16) = v193;
          *(unsigned char *)(v188 + 88) = v137;
          *(unsigned char *)(v188 + 89) = v155;
          goto LABEL_180;
        }
        int v144 = *(unsigned __int8 *)(v72 + 88);
        int v137 = *(unsigned __int8 *)(v9 + 88);
        if (v144) {
          BOOL v145 = v137 == 0;
        }
        else {
          BOOL v145 = 0;
        }
        if (!v145) {
          goto LABEL_121;
        }
      }
    }
    uint64_t v74 = *(void *)v9;
    long long v75 = *(_OWORD *)(v9 + 32);
    long long v76 = *(_OWORD *)(v9 + 48);
    long long v77 = *(_OWORD *)(v9 + 64);
    uint64_t v467 = *(void *)(v9 + 80);
    long long v466 = v77;
    long long v78 = *(_OWORD *)(v9 + 16);
    long long v464 = v75;
    long long v465 = v76;
    long long v463 = v78;
    int v79 = *(unsigned __int8 *)(v9 + 88);
    char v80 = *(unsigned char *)(v9 + 89);
    uint64_t v81 = *a1;
    unint64_t v82 = a1;
    unint64_t v83 = v9;
    while (1)
    {
      v83 += 96;
      if (v83 - v81 == 4032)
      {
        unint64_t v84 = v82[1];
        ++v82;
        uint64_t v81 = v84;
        unint64_t v83 = v84;
      }
      double v85 = *(double *)(v83 + 8);
      if (v85 >= v69)
      {
        if (v85 > v69) {
          break;
        }
        if (!*(unsigned char *)(v83 + 88) || v79 != 0) {
          break;
        }
      }
    }
    unint64_t v87 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v83 - v81) >> 5);
    if ((uint64_t)(v83 - v81) < 97) {
      unint64_t v88 = v82[-((42 - v87) / 0x2A)] + 96 * (42 * ((42 - v87) / 0x2A) - (42 - v87)) + 3936;
    }
    else {
      unint64_t v88 = v82[(v87 - 1) / 0x2A] + 96 * ((v87 - 1) % 0x2A);
    }
    uint64_t v89 = a3;
    uint64_t v90 = (double *)v7;
    if (v88 == v9)
    {
      do
      {
        if (v82 >= v89 && (v82 != v89 || v83 >= (unint64_t)v90)) {
          break;
        }
        if (v90 == (double *)*v89)
        {
          uint64_t v96 = *--v89;
          unint64_t v95 = (double *)(v96 + 4032);
        }
        else
        {
          unint64_t v95 = v90;
        }
        uint64_t v90 = v95 - 12;
        double v97 = *(v95 - 11);
        if (v97 < v69) {
          break;
        }
      }
      while (v97 > v69 || !*((unsigned char *)v95 - 8) || *(unsigned char *)(v9 + 88));
    }
    else
    {
      unsigned int v91 = (double *)*a3;
      uint64_t v89 = a3;
      uint64_t v90 = (double *)v7;
      do
      {
        if (v90 == v91)
        {
          int64_t v93 = (double *)*--v89;
          unsigned int v91 = v93;
          long long v92 = v93 + 504;
        }
        else
        {
          long long v92 = v90;
        }
        uint64_t v90 = v92 - 12;
        double v94 = *(v92 - 11);
      }
      while (v94 >= v69 && (v94 > v69 || !*((unsigned char *)v92 - 8) || *(unsigned char *)(v9 + 88)));
    }
    BOOL v98 = v82 >= v89 && (v82 != v89 || v83 >= (unint64_t)v90);
    while (v82 < v89 || v82 == v89 && v83 < (unint64_t)v90)
    {
      long long v100 = *(_OWORD *)(v83 + 16);
      long long v468 = *(_OWORD *)v83;
      long long v469 = v100;
      long long v101 = *(_OWORD *)(v83 + 32);
      long long v102 = *(_OWORD *)(v83 + 48);
      long long v103 = *(_OWORD *)(v83 + 80);
      *(_OWORD *)v472 = *(_OWORD *)(v83 + 64);
      *(_OWORD *)&v472[16] = v103;
      long long v470 = v101;
      long long v471 = v102;
      long long v105 = *((_OWORD *)v90 + 3);
      long long v104 = *((_OWORD *)v90 + 4);
      long long v106 = *((_OWORD *)v90 + 2);
      *(_OWORD *)(v83 + 74) = *(_OWORD *)((char *)v90 + 74);
      *(_OWORD *)(v83 + 48) = v105;
      *(_OWORD *)(v83 + 64) = v104;
      *(_OWORD *)(v83 + 32) = v106;
      long long v107 = *((_OWORD *)v90 + 1);
      *(_OWORD *)unint64_t v83 = *(_OWORD *)v90;
      *(_OWORD *)(v83 + 16) = v107;
      long long v108 = v469;
      *(_OWORD *)uint64_t v90 = v468;
      *((_OWORD *)v90 + 1) = v108;
      long long v109 = v470;
      long long v110 = v471;
      long long v111 = *(_OWORD *)v472;
      *(_OWORD *)((char *)v90 + 74) = *(_OWORD *)&v472[10];
      *((_OWORD *)v90 + 3) = v110;
      *((_OWORD *)v90 + 4) = v111;
      *((_OWORD *)v90 + 2) = v109;
      uint64_t v81 = *v82;
      while (1)
      {
        v83 += 96;
        if (v83 - v81 == 4032)
        {
          unint64_t v112 = v82[1];
          ++v82;
          uint64_t v81 = v112;
          unint64_t v83 = v112;
        }
        double v113 = *(double *)(v83 + 8);
        if (v113 >= v69)
        {
          if (v113 > v69) {
            break;
          }
          if (!*(unsigned char *)(v83 + 88) || v79 != 0) {
            break;
          }
        }
      }
      BOOL v115 = (double *)*v89;
      do
      {
        if (v90 == v115)
        {
          long long v117 = (double *)*--v89;
          BOOL v115 = v117;
          uint64_t v116 = v117 + 504;
        }
        else
        {
          uint64_t v116 = v90;
        }
        uint64_t v90 = v116 - 12;
        double v118 = *(v116 - 11);
      }
      while (v118 >= v69 && (v118 > v69 || !*((unsigned char *)v116 - 8) || v79));
    }
    uint64_t v119 = v83 - v81;
    unint64_t v120 = 0xAAAAAAAAAAAAAAABLL * (v119 >> 5);
    if (v119 < 97)
    {
      unint64_t v124 = 42 - v120;
      __n128 v122 = &v82[-(v124 / 0x2A)];
      uint64_t v123 = *v122 + 96 * (42 * (v124 / 0x2A) - v124) + 3936;
    }
    else
    {
      unint64_t v121 = v120 - 1;
      __n128 v122 = &v82[v121 / 0x2A];
      uint64_t v123 = *v122 + 96 * (v121 % 0x2A);
    }
    if (v123 != v9)
    {
      long long v125 = *(_OWORD *)(v123 + 16);
      *(_OWORD *)uint64_t v9 = *(_OWORD *)v123;
      *(_OWORD *)(v9 + 16) = v125;
      long long v126 = *(_OWORD *)(v123 + 32);
      long long v127 = *(_OWORD *)(v123 + 48);
      long long v128 = *(_OWORD *)(v123 + 64);
      *(_OWORD *)(v9 + 74) = *(_OWORD *)(v123 + 74);
      *(_OWORD *)(v9 + 48) = v127;
      *(_OWORD *)(v9 + 64) = v128;
      *(_OWORD *)(v9 + 32) = v126;
    }
    *(void *)uint64_t v123 = v74;
    *(double *)(v123 + 8) = v69;
    long long v129 = v463;
    *(_OWORD *)(v123 + 32) = v464;
    *(_OWORD *)(v123 + 48) = v465;
    *(_OWORD *)(v123 + 64) = v466;
    *(void *)(v123 + 80) = v467;
    *(_OWORD *)(v123 + 16) = v129;
    *(unsigned char *)(v123 + 88) = v79;
    *(unsigned char *)(v123 + 89) = v80;
    if (!v98) {
      goto LABEL_114;
    }
    uint64_t v130 = a5;
    int v131 = std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,-[MNRouteDivergenceFinder _findFirstConvergenceBetweenRoute:range:andRoute:range:outRouteCoordinate:outRouteCoordinate:]::$_3 &,std::__deque_iterator<_MNRouteConvergencePoint,_MNRouteConvergencePoint*,_MNRouteConvergencePoint&,_MNRouteConvergencePoint**,long,42l>>(a1, v9, v122, v123);
    uint64_t v132 = v123 - *v122;
    unint64_t v133 = 0xAAAAAAAAAAAAAAABLL * (v132 >> 5);
    if (v132 < -95)
    {
      unint64_t v138 = 40 - v133;
      unint64_t v135 = &v122[-(v138 / 0x2A)];
      uint64_t v136 = *v135 + 96 * (42 * (v138 / 0x2A) - v138) + 3936;
    }
    else
    {
      unint64_t v134 = v133 + 1;
      unint64_t v135 = &v122[v134 / 0x2A];
      uint64_t v136 = *v135 + 96 * (v134 % 0x2A);
    }
    if (std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,-[MNRouteDivergenceFinder _findFirstConvergenceBetweenRoute:range:andRoute:range:outRouteCoordinate:outRouteCoordinate:]::$_3 &,std::__deque_iterator<_MNRouteConvergencePoint,_MNRouteConvergencePoint*,_MNRouteConvergencePoint&,_MNRouteConvergencePoint**,long,42l>>(v135, v136, a3, v7))
    {
      unint64_t v139 = v9;
      unint64_t v7 = v123;
      a3 = v122;
      a5 = v130;
      if (v131) {
        return;
      }
      goto LABEL_180;
    }
    a5 = v130;
    if (v131)
    {
      unint64_t v139 = v123 + 96;
      if (v123 + 96 - *v122 == 4032)
      {
        uint64_t v140 = v122[1];
        ++v122;
        unint64_t v139 = v140;
      }
      a1 = v122;
    }
    else
    {
LABEL_114:
      uint64_t v141 = v9;
      uint64_t v142 = a5;
      std::__introsort<std::_ClassicAlgPolicy,-[MNRouteDivergenceFinder _findFirstConvergenceBetweenRoute:range:andRoute:range:outRouteCoordinate:outRouteCoordinate:]::$_3 &,std::__deque_iterator<_MNRouteConvergencePoint,_MNRouteConvergencePoint*,_MNRouteConvergencePoint&,_MNRouteConvergencePoint**,long,42l>,false>(a1, v141, v122, v123);
      unint64_t v139 = v123 + 96;
      a6 = 0;
      if (v123 + 96 - *v122 == 4032)
      {
        uint64_t v143 = v122[1];
        ++v122;
        unint64_t v139 = v143;
      }
      a1 = v122;
      a5 = v142;
    }
LABEL_180:
    uint64_t v9 = v139;
    BOOL v6 = v7 > v139;
    if (v7 == v139) {
      return;
    }
  }
  switch(v16)
  {
    case 0:
    case 1:
      return;
    case 2:
      if (v7 == v12) {
        unint64_t v7 = *(a3 - 1) + 4032;
      }
      double v194 = *(double *)(v7 - 88);
      double v195 = *(double *)(v9 + 8);
      if (v194 < v195 || v194 <= v195 && *(unsigned char *)(v7 - 8) && !*(unsigned char *)(v9 + 88))
      {
        v196 = (_OWORD *)(v7 - 96);
        long long v197 = *(_OWORD *)(v9 + 16);
        long long v468 = *(_OWORD *)v9;
        long long v469 = v197;
        long long v198 = *(_OWORD *)(v9 + 32);
        long long v199 = *(_OWORD *)(v9 + 48);
        long long v200 = *(_OWORD *)(v9 + 80);
        *(_OWORD *)v472 = *(_OWORD *)(v9 + 64);
        *(_OWORD *)&v472[16] = v200;
        long long v470 = v198;
        long long v471 = v199;
        long long v202 = *(_OWORD *)(v7 - 48);
        long long v201 = *(_OWORD *)(v7 - 32);
        long long v203 = *(_OWORD *)(v7 - 64);
        *(_OWORD *)(v9 + 74) = *(_OWORD *)(v7 - 22);
        *(_OWORD *)(v9 + 48) = v202;
        *(_OWORD *)(v9 + 64) = v201;
        *(_OWORD *)(v9 + 32) = v203;
        long long v204 = *(_OWORD *)(v7 - 80);
        *(_OWORD *)uint64_t v9 = *(_OWORD *)(v7 - 96);
        *(_OWORD *)(v9 + 16) = v204;
        long long v205 = v469;
        _OWORD *v196 = v468;
        v196[1] = v205;
        long long v206 = v470;
        long long v207 = v471;
        long long v208 = *(_OWORD *)v472;
        *(_OWORD *)((char *)v196 + 74) = *(_OWORD *)&v472[10];
        v196[3] = v207;
        v196[4] = v208;
        v196[2] = v206;
      }
      return;
    case 3:
      unint64_t v209 = 0xAAAAAAAAAAAAAAABLL * v15;
      if (v14 < -95)
      {
        v210 = &a1[-((40 - v209) / 0x2A)];
        uint64_t v211 = *v210 + 96 * (42 * ((40 - v209) / 0x2A) - (40 - v209)) + 3936;
      }
      else
      {
        v210 = &a1[(v209 + 1) / 0x2A];
        uint64_t v211 = *v210 + 96 * ((v209 + 1) % 0x2A);
      }
      if (v7 == v12)
      {
        uint64_t v351 = *--a3;
        unint64_t v7 = v351 + 4032;
      }
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[MNRouteDivergenceFinder _findFirstConvergenceBetweenRoute:range:andRoute:range:outRouteCoordinate:outRouteCoordinate:]::$_3 &,std::__deque_iterator<_MNRouteConvergencePoint,_MNRouteConvergencePoint*,_MNRouteConvergencePoint&,_MNRouteConvergencePoint**,long,42l>>((uint64_t)a1, v9, (uint64_t)v210, v211, (uint64_t)a3, v7 - 96);
      return;
    case 4:
      unint64_t v212 = 0xAAAAAAAAAAAAAAABLL * v15;
      if (v14 >= -95)
      {
        v213 = &a1[(v212 + 1) / 0x2A];
        uint64_t v214 = *v213 + 96 * ((v212 + 1) % 0x2A);
        unint64_t v215 = v212 + 2;
LABEL_328:
        v353 = &a1[v215 / 0x2A];
        uint64_t v354 = *v353 + 96 * (v215 % 0x2A);
        goto LABEL_357;
      }
      unint64_t v352 = (40 - v212) / 0x2A;
      v213 = &a1[-v352];
      uint64_t v214 = *v213 + 96 * (v212 - 40 + 42 * v352) + 3936;
      if ((unint64_t)v14 >= 0xFFFFFFFFFFFFFF41)
      {
        unint64_t v215 = 1;
        goto LABEL_328;
      }
      unint64_t v413 = 39 - v212;
      unint64_t v414 = (39 - v212) / 0x2A;
      v353 = &a1[-v414];
      uint64_t v354 = *v353 + 96 * (42 * v414 - v413) + 3936;
LABEL_357:
      if (v7 == v12)
      {
        uint64_t v415 = *--a3;
        unint64_t v7 = v415 + 4032;
      }
      std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,[(MNRouteDivergenceFinder *)(uint64_t)a1 _findFirstConvergenceBetweenRoute:(uint64_t)v213 range:v214 andRoute:(uint64_t)v353 range:v354 outRouteCoordinate:(uint64_t)a3 outRouteCoordinate:v7 - 96];
      return;
    case 5:
      v216 = a3;
      unint64_t v217 = 0xAAAAAAAAAAAAAAABLL * v15;
      if (v14 >= -95)
      {
        v218 = &a1[(v217 + 1) / 0x2A];
        uint64_t v219 = *v218 + 96 * ((v217 + 1) % 0x2A);
        unint64_t v220 = v217 + 2;
LABEL_331:
        v356 = &a1[v220 / 0x2A];
        uint64_t v357 = *v356 + 96 * (v220 % 0x2A);
        unint64_t v358 = v217 + 3;
LABEL_332:
        v359 = &a1[v358 / 0x2A];
        uint64_t v360 = *v359 + 96 * (v358 % 0x2A);
        goto LABEL_333;
      }
      unint64_t v355 = (40 - v217) / 0x2A;
      v218 = &a1[-v355];
      uint64_t v219 = *v218 + 96 * (v217 - 40 + 42 * v355) + 3936;
      if ((unint64_t)v14 >= 0xFFFFFFFFFFFFFF41)
      {
        unint64_t v220 = 1;
        goto LABEL_331;
      }
      unint64_t v416 = (39 - v217) / 0x2A;
      v356 = &a1[-v416];
      uint64_t v357 = *v356 + 96 * (v217 - 39 + 42 * v416) + 3936;
      if ((unint64_t)v14 >= 0xFFFFFFFFFFFFFEE1)
      {
        unint64_t v358 = 1;
        goto LABEL_332;
      }
      v359 = &a1[-((38 - v217) / 0x2A)];
      uint64_t v360 = *v359 + 96 * (42 * ((38 - v217) / 0x2A) - (38 - v217)) + 3936;
LABEL_333:
      if (v7 == v12) {
        unint64_t v7 = *(v216 - 1) + 4032;
      }
      std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,[(MNRouteDivergenceFinder *)(uint64_t)a1 _findFirstConvergenceBetweenRoute:(uint64_t)v218 range:v219 andRoute:(uint64_t)v356 range:v357 outRouteCoordinate:(uint64_t)v359 outRouteCoordinate:v360];
      double v361 = *(double *)(v7 - 88);
      double v362 = *(double *)(v360 + 8);
      if (v361 < v362 || v361 <= v362 && *(unsigned char *)(v7 - 8) && !*(unsigned char *)(v360 + 88))
      {
        v363 = (_OWORD *)(v7 - 96);
        long long v470 = *(_OWORD *)(v360 + 32);
        long long v471 = *(_OWORD *)(v360 + 48);
        *(_OWORD *)v472 = *(_OWORD *)(v360 + 64);
        *(_OWORD *)&v472[16] = *(_OWORD *)(v360 + 80);
        long long v468 = *(_OWORD *)v360;
        long long v469 = *(_OWORD *)(v360 + 16);
        long long v364 = *(_OWORD *)(v7 - 80);
        *(_OWORD *)uint64_t v360 = *(_OWORD *)(v7 - 96);
        *(_OWORD *)(v360 + 16) = v364;
        long long v366 = *(_OWORD *)(v7 - 48);
        long long v365 = *(_OWORD *)(v7 - 32);
        long long v367 = *(_OWORD *)(v7 - 64);
        *(_OWORD *)(v360 + 74) = *(_OWORD *)(v7 - 22);
        *(_OWORD *)(v360 + 48) = v366;
        *(_OWORD *)(v360 + 64) = v365;
        *(_OWORD *)(v360 + 32) = v367;
        long long v368 = v469;
        _OWORD *v363 = v468;
        v363[1] = v368;
        long long v369 = v470;
        long long v370 = v471;
        long long v371 = *(_OWORD *)v472;
        *(_OWORD *)((char *)v363 + 74) = *(_OWORD *)&v472[10];
        v363[3] = v370;
        v363[4] = v371;
        v363[2] = v369;
        double v372 = *(double *)(v360 + 8);
        double v373 = *(double *)(v357 + 8);
        if (v372 < v373
          || v372 <= v373 && (*(unsigned char *)(v360 + 88) ? (BOOL v412 = *(unsigned char *)(v357 + 88) == 0) : (BOOL v412 = 0), v412))
        {
          long long v374 = *(_OWORD *)(v357 + 16);
          long long v468 = *(_OWORD *)v357;
          long long v469 = v374;
          long long v375 = *(_OWORD *)(v357 + 32);
          long long v376 = *(_OWORD *)(v357 + 48);
          long long v377 = *(_OWORD *)(v357 + 80);
          *(_OWORD *)v472 = *(_OWORD *)(v357 + 64);
          *(_OWORD *)&v472[16] = v377;
          long long v470 = v375;
          long long v471 = v376;
          long long v379 = *(_OWORD *)(v360 + 48);
          long long v378 = *(_OWORD *)(v360 + 64);
          long long v380 = *(_OWORD *)(v360 + 32);
          *(_OWORD *)(v357 + 74) = *(_OWORD *)(v360 + 74);
          *(_OWORD *)(v357 + 48) = v379;
          *(_OWORD *)(v357 + 64) = v378;
          *(_OWORD *)(v357 + 32) = v380;
          long long v381 = *(_OWORD *)(v360 + 16);
          *(_OWORD *)uint64_t v357 = *(_OWORD *)v360;
          *(_OWORD *)(v357 + 16) = v381;
          *(_OWORD *)(v360 + 48) = v471;
          *(_OWORD *)(v360 + 32) = v470;
          *(_OWORD *)(v360 + 64) = *(_OWORD *)v472;
          *(_OWORD *)(v360 + 74) = *(_OWORD *)&v472[10];
          *(_OWORD *)uint64_t v360 = v468;
          *(_OWORD *)(v360 + 16) = v469;
          double v382 = *(double *)(v357 + 8);
          double v383 = *(double *)(v219 + 8);
          if (v382 < v383 || v382 <= v383 && *(unsigned char *)(v357 + 88) && !*(unsigned char *)(v219 + 88))
          {
            long long v384 = *(_OWORD *)(v219 + 16);
            long long v468 = *(_OWORD *)v219;
            long long v469 = v384;
            long long v385 = *(_OWORD *)(v219 + 32);
            long long v386 = *(_OWORD *)(v219 + 48);
            long long v387 = *(_OWORD *)(v219 + 80);
            *(_OWORD *)v472 = *(_OWORD *)(v219 + 64);
            *(_OWORD *)&v472[16] = v387;
            long long v470 = v385;
            long long v471 = v386;
            long long v389 = *(_OWORD *)(v357 + 48);
            long long v388 = *(_OWORD *)(v357 + 64);
            long long v390 = *(_OWORD *)(v357 + 32);
            *(_OWORD *)(v219 + 74) = *(_OWORD *)(v357 + 74);
            *(_OWORD *)(v219 + 48) = v389;
            *(_OWORD *)(v219 + 64) = v388;
            *(_OWORD *)(v219 + 32) = v390;
            long long v391 = *(_OWORD *)(v357 + 16);
            *(_OWORD *)uint64_t v219 = *(_OWORD *)v357;
            *(_OWORD *)(v219 + 16) = v391;
            long long v392 = v469;
            *(_OWORD *)uint64_t v357 = v468;
            *(_OWORD *)(v357 + 16) = v392;
            long long v393 = v470;
            long long v394 = v471;
            long long v395 = *(_OWORD *)v472;
            *(_OWORD *)(v357 + 74) = *(_OWORD *)&v472[10];
            *(_OWORD *)(v357 + 48) = v394;
            *(_OWORD *)(v357 + 64) = v395;
            *(_OWORD *)(v357 + 32) = v393;
            double v396 = *(double *)(v219 + 8);
            double v397 = *(double *)(v9 + 8);
            if (v396 < v397 || v396 <= v397 && *(unsigned char *)(v219 + 88) && !*(unsigned char *)(v9 + 88))
            {
              long long v398 = *(_OWORD *)(v9 + 16);
              long long v468 = *(_OWORD *)v9;
              long long v469 = v398;
              long long v399 = *(_OWORD *)(v9 + 32);
              long long v400 = *(_OWORD *)(v9 + 48);
              long long v401 = *(_OWORD *)(v9 + 80);
              *(_OWORD *)v472 = *(_OWORD *)(v9 + 64);
              *(_OWORD *)&v472[16] = v401;
              long long v470 = v399;
              long long v471 = v400;
              long long v403 = *(_OWORD *)(v219 + 48);
              long long v402 = *(_OWORD *)(v219 + 64);
              long long v404 = *(_OWORD *)(v219 + 32);
              *(_OWORD *)(v9 + 74) = *(_OWORD *)(v219 + 74);
              *(_OWORD *)(v9 + 48) = v403;
              *(_OWORD *)(v9 + 64) = v402;
              *(_OWORD *)(v9 + 32) = v404;
              long long v405 = *(_OWORD *)(v219 + 16);
              *(_OWORD *)uint64_t v9 = *(_OWORD *)v219;
              *(_OWORD *)(v9 + 16) = v405;
              long long v406 = v469;
              *(_OWORD *)uint64_t v219 = v468;
              *(_OWORD *)(v219 + 16) = v406;
              long long v407 = v470;
              long long v408 = v471;
              long long v409 = *(_OWORD *)v472;
              *(_OWORD *)(v219 + 74) = *(_OWORD *)&v472[10];
              *(_OWORD *)(v219 + 48) = v408;
              *(_OWORD *)(v219 + 64) = v409;
              *(_OWORD *)(v219 + 32) = v407;
            }
          }
        }
      }
      break;
    default:
      JUMPOUT(0);
  }
}

@end