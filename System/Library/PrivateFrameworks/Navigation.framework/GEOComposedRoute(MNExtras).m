@interface GEOComposedRoute(MNExtras)
+ (uint64_t)_pointsConverge:()MNExtras pointCount:otherPoints:pointCount:tolerance:outCoordinateA:outCoordinateB:;
+ (uint64_t)_pointsConverge:()MNExtras pointCount:otherPoints:pointCount:tolerance:outCoordinatesA:outCoordinatesB:;
+ (uint64_t)_pointsDiverge:()MNExtras pointCount:otherPoints:pointCount:tolerance:outCoordinateA:outCoordinateB:;
+ (uint64_t)_startIndexForPoints:()MNExtras withPoints:pointCount:toleranceSquared:;
+ (uint64_t)_stringForPoint:()MNExtras;
+ (uint64_t)findDivergenceAndConvergence:()MNExtras pointCount:otherPoints:pointCount:outDivergenceCoordinateA:outDivergenceCoordinateB:outConvergenceCoordinateA:outConvergenceCoordinateB:;
+ (uint64_t)pointsConverge:()MNExtras pointCount:otherPoints:pointCount:outCoordinateA:outCoordinateB:;
+ (uint64_t)pointsDiverge:()MNExtras pointCount:otherPoints:pointCount:outCoordinateA:outCoordinateB:;
+ (void)_addPointsToArray:()MNExtras forMapPoints:pointCount:isPolylineA:;
+ (void)_findDivergenceAndConvergence:()MNExtras pointCount:otherPoints:pointCount:divergenceTolerance:convergenceTolerance:outDivergenceCoordinateA:outDivergenceCoordinateB:outConvergenceCoordinateA:outConvergenceCoordinateB:;
+ (void)findDivergenceAndConvergence:()MNExtras pointCount:otherCoordinates:pointCount:distanceInMeters:outDivergenceCoordinateA:outDivergenceCoordinateB:outConvergenceCoordinateA:outConvergenceCoordinateB:;
+ (void)findDivergenceAndConvergence:()MNExtras pointCount:otherPoints:pointCount:divergenceTolerance:convergenceTolerance:outCoordinatesA:outCoordinatesB:;
- (_MNMapPointsArray)_mapPoints;
- (id)divergenceAndConvergenceWithRoute:()MNExtras;
- (id)divergenceAndConvergenceWithRoute:()MNExtras outOtherRoutePoints:;
- (id)userRequestedWaypoints;
- (uint64_t)findDivergenceAndConvergenceWithRoute:()MNExtras outDivergenceCoordinate:outConvergenceCoordinate:;
- (uint64_t)isMultipointRoute;
- (uint64_t)isNavigableForWatch;
- (void)findDivergenceAndConvergenceWithRoute:()MNExtras distanceInMeters:outDivergenceCoordinate:outConvergenceCoordinate:;
@end

@implementation GEOComposedRoute(MNExtras)

- (uint64_t)findDivergenceAndConvergenceWithRoute:()MNExtras outDivergenceCoordinate:outConvergenceCoordinate:
{
  return objc_msgSend(a1, "findDivergenceAndConvergenceWithRoute:distanceInMeters:outDivergenceCoordinate:outConvergenceCoordinate:", 10.0);
}

- (void)findDivergenceAndConvergenceWithRoute:()MNExtras distanceInMeters:outDivergenceCoordinate:outConvergenceCoordinate:
{
  id v15 = a4;
  unsigned int v10 = [a1 pointCount];
  unsigned int v11 = [v15 pointCount];
  if (v10 >= 2 && v11 >= 2)
  {
    v12 = [a1 _mapPoints];
    v13 = [v15 _mapPoints];
    [a1 pointAt:0];
    GEOMapPointsPerMeterAtLatitude();
    objc_msgSend(MEMORY[0x1E4F644A0], "_findDivergenceAndConvergence:pointCount:otherPoints:pointCount:divergenceTolerance:convergenceTolerance:outDivergenceCoordinateA:outDivergenceCoordinateB:outConvergenceCoordinateA:outConvergenceCoordinateB:", objc_msgSend(v12, "mapPoints"), objc_msgSend(v12, "count"), objc_msgSend(v13, "mapPoints"), objc_msgSend(v13, "count"), a5, 0, v14 * a2, v14 * a2, a6, 0);
  }
}

- (id)divergenceAndConvergenceWithRoute:()MNExtras
{
  v3 = [a1 divergenceAndConvergenceWithRoute:a3 outOtherRoutePoints:0];
  return v3;
}

- (id)divergenceAndConvergenceWithRoute:()MNExtras outOtherRoutePoints:
{
  id v6 = a3;
  unsigned int v7 = [a1 pointCount];
  unsigned int v8 = [v6 pointCount];
  id v9 = 0;
  if (v7 >= 2 && v8 >= 2)
  {
    unsigned int v10 = [a1 _mapPoints];
    unsigned int v11 = [v6 _mapPoints];
    [a1 pointAt:0];
    GEOMapPointsPerMeterAtLatitude();
    id v14 = 0;
    objc_msgSend(MEMORY[0x1E4F644A0], "findDivergenceAndConvergence:pointCount:otherPoints:pointCount:divergenceTolerance:convergenceTolerance:outCoordinatesA:outCoordinatesB:", objc_msgSend(v10, "mapPoints"), objc_msgSend(v10, "count"), objc_msgSend(v11, "mapPoints"), objc_msgSend(v11, "count"), &v14, a4, v12 * 10.0, v12);
    id v9 = v14;
  }
  return v9;
}

+ (uint64_t)pointsDiverge:()MNExtras pointCount:otherPoints:pointCount:outCoordinateA:outCoordinateB:
{
  return objc_msgSend(a1, "_pointsDiverge:pointCount:otherPoints:pointCount:tolerance:outCoordinateA:outCoordinateB:", 0.01);
}

+ (uint64_t)_pointsDiverge:()MNExtras pointCount:otherPoints:pointCount:tolerance:outCoordinateA:outCoordinateB:
{
  uint64_t v9 = 0;
  if (a5 < 2 || a7 < 2) {
    return v9;
  }
  double v17 = a2 * a2;
  unint64_t v18 = objc_msgSend(a1, "_startIndexForPoints:withPoints:pointCount:toleranceSquared:", *a6, a6[1], a2 * a2);
  unint64_t v19 = objc_msgSend(a1, "_startIndexForPoints:withPoints:pointCount:toleranceSquared:", a6, a7, *a4, a4[1], v17);
  if (v18 == 0x7FFFFFFFFFFFFFFFLL && v19 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (a8) {
      *(void *)a8 = 0;
    }
    if (a9) {
      goto LABEL_14;
    }
    return 1;
  }
  if (v18 != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (v19 && v19 != 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_22;
    }
    if (v18)
    {
      unint64_t v19 = 0;
      int v22 = 0;
      goto LABEL_23;
    }
    goto LABEL_21;
  }
  if (!v19 || v19 == 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_21:
    unint64_t v18 = 0;
    unint64_t v19 = 1;
    goto LABEL_22;
  }
  unint64_t v18 = 0;
LABEL_22:
  int v22 = 1;
LABEL_23:
  uint64_t v9 = 0;
  if (v18 >= a5 || v19 >= a7) {
    return v9;
  }
  char v23 = 0;
  double v24 = 0.0;
  while (1)
  {
    if (v22) {
      v25 = a4;
    }
    else {
      v25 = a6;
    }
    if (v22) {
      v26 = a6;
    }
    else {
      v26 = a4;
    }
    if (v22) {
      unint64_t v27 = v19;
    }
    else {
      unint64_t v27 = v18;
    }
    if (v22) {
      unint64_t v28 = v18;
    }
    else {
      unint64_t v28 = v19;
    }
    unint64_t v29 = v27 - 1;
    if (!v27) {
      unint64_t v29 = 0;
    }
    v30 = &v26[2 * v29];
    v31 = &v26[2 * v27];
    v32 = &v25[2 * v28];
    double v33 = *v30;
    double v34 = v30[1];
    double v35 = *v31 - *v30;
    double v36 = v31[1] - v34;
    double v37 = v35 * v35 + 0.0 + v36 * v36;
    double v38 = *v32;
    if (v37 <= 1.0e-15)
    {
      double v39 = v32[1];
      double v40 = 0.0;
    }
    else
    {
      double v39 = v32[1];
      double v40 = ((v38 - v33) * v35 + 0.0 + (v39 - v34) * v36) / v37;
      if (v40 < 0.0) {
        double v40 = 0.0;
      }
      if (v40 > 1.0) {
        double v40 = 1.0;
      }
    }
    double v41 = (v38 - (v33 + v35 * v40)) * (v38 - (v33 + v35 * v40))
        + 0.0
        + (v39 - (v34 + v36 * v40)) * (v39 - (v34 + v36 * v40));
    if (v41 >= v17) {
      break;
    }
    if (v41 <= 0.01) {
      goto LABEL_55;
    }
    if (v24 > 0.0)
    {
      if (v41 <= v24)
      {
LABEL_55:
        double v24 = 0.0;
        if (v22) {
          unint64_t v18 = v28 + 1;
        }
        else {
          unint64_t v19 = v28 + 1;
        }
        char v23 = 0;
        int v22 = (v22 & 1) != 0;
        goto LABEL_64;
      }
      char v23 = 0;
LABEL_59:
      if (v22) {
        unint64_t v19 = v27 + 1;
      }
      else {
        unint64_t v18 = v27 + 1;
      }
      v22 ^= 1u;
      double v24 = 0.0;
      goto LABEL_64;
    }
    char v23 = 0;
    v22 ^= 1u;
    double v24 = v41;
LABEL_64:
    uint64_t v9 = 0;
    if (v18 >= a5 || v19 >= a7) {
      return v9;
    }
  }
  if (v24 > 0.0) {
    goto LABEL_59;
  }
  if ((v23 & 1) == 0)
  {
    v22 ^= 1u;
    char v23 = 1;
    goto LABEL_64;
  }
  if (a8)
  {
    if (v18)
    {
      v42 = &a4[2 * v18];
      double v43 = *(v42 - 2);
      double v44 = *(v42 - 1);
      double v45 = *v42 - v43;
      double v46 = v42[1] - v44;
      double v47 = v45 * v45 + 0.0 + v46 * v46;
      if (v47 <= 1.0e-15)
      {
        int v51 = v18 - 1;
        float v50 = 0.0;
      }
      else
      {
        unint64_t v48 = v19 - 1;
        if (!v19) {
          unint64_t v48 = 0;
        }
        double v49 = ((a6[2 * v48] - v43) * v45 + 0.0 + (a6[2 * v48 + 1] - v44) * v46) / v47;
        if (v49 < 0.0) {
          double v49 = 0.0;
        }
        if (v49 > 1.0) {
          double v49 = 1.0;
        }
        float v50 = v49;
        int v51 = v18 - 1;
        if (v50 >= 1.0)
        {
          v51 += vcvtms_u32_f32(v50);
          float v50 = v50 - (float)floorf(v50);
        }
      }
      *(_DWORD *)a8 = v51;
      *(float *)(a8 + 4) = v50;
    }
    else
    {
      *(void *)a8 = 0;
    }
  }
  if (a9)
  {
    if (v19)
    {
      v52 = &a6[2 * v19];
      double v53 = *(v52 - 2);
      double v54 = *(v52 - 1);
      double v55 = *v52 - v53;
      double v56 = v52[1] - v54;
      double v57 = v55 * v55 + 0.0 + v56 * v56;
      if (v57 <= 1.0e-15)
      {
        int v61 = v19 - 1;
        float v60 = 0.0;
      }
      else
      {
        unint64_t v58 = v18 - 1;
        if (!v18) {
          unint64_t v58 = 0;
        }
        double v59 = ((a4[2 * v58] - v53) * v55 + 0.0 + (a4[2 * v58 + 1] - v54) * v56) / v57;
        if (v59 < 0.0) {
          double v59 = 0.0;
        }
        if (v59 > 1.0) {
          double v59 = 1.0;
        }
        float v60 = v59;
        int v61 = v19 - 1;
        if (v60 >= 1.0)
        {
          v61 += vcvtms_u32_f32(v60);
          float v60 = v60 - (float)floorf(v60);
        }
      }
      *(_DWORD *)a9 = v61;
      *(float *)(a9 + 4) = v60;
      return 1;
    }
LABEL_14:
    *(void *)a9 = 0;
  }
  return 1;
}

+ (uint64_t)pointsConverge:()MNExtras pointCount:otherPoints:pointCount:outCoordinateA:outCoordinateB:
{
  return objc_msgSend(a1, "_pointsConverge:pointCount:otherPoints:pointCount:tolerance:outCoordinateA:outCoordinateB:", 0.01);
}

+ (uint64_t)_pointsConverge:()MNExtras pointCount:otherPoints:pointCount:tolerance:outCoordinateA:outCoordinateB:
{
  id v16 = 0;
  id v17 = 0;
  uint64_t v10 = objc_msgSend(a1, "_pointsConverge:pointCount:otherPoints:pointCount:tolerance:outCoordinatesA:outCoordinatesB:", a3, a4, a5, a6, &v17, &v16);
  id v11 = v17;
  id v12 = v16;
  if (!a7)
  {
LABEL_4:
    if (!a8) {
      goto LABEL_10;
    }
    goto LABEL_5;
  }
  if ([v11 count])
  {
    v13 = [v11 firstObject];
    *a7 = [v13 routeCoordinate];

    goto LABEL_4;
  }
  *a7 = *MEMORY[0x1E4F64198];
  if (!a8) {
    goto LABEL_10;
  }
LABEL_5:
  if ([v12 count])
  {
    id v14 = [v12 firstObject];
    *a8 = [v14 routeCoordinate];
  }
  else
  {
    *a8 = *MEMORY[0x1E4F64198];
  }
LABEL_10:

  return v10;
}

+ (uint64_t)_pointsConverge:()MNExtras pointCount:otherPoints:pointCount:tolerance:outCoordinatesA:outCoordinatesB:
{
  char v9 = 0;
  uint64_t v100 = *MEMORY[0x1E4F143B8];
  if (a5 >= 2 && a7 >= 2)
  {
    v80 = [MEMORY[0x1E4F1CA48] array];
    [a1 _addPointsToArray:v80 forMapPoints:a6 pointCount:a7 isPolylineA:0];
    [a1 _addPointsToArray:v80 forMapPoints:a4 pointCount:a5 isPolylineA:1];
    [v80 sortUsingComparator:&__block_literal_global_25];
    if (a8)
    {
      *((void *)&v85 + 1) = [MEMORY[0x1E4F1CA48] array];
    }
    else
    {
      *((void *)&v85 + 1) = 0;
    }
    if (a9)
    {
      *(void *)&long long v85 = [MEMORY[0x1E4F1CA48] array];
    }
    else
    {
      *(void *)&long long v85 = 0;
    }
    v78 = [MEMORY[0x1E4F1CA60] dictionary];
    v79 = [MEMORY[0x1E4F1CA60] dictionary];
    unint64_t v82 = 0;
    char v9 = 0;
    double v86 = a2 * a2;
    *(void *)&long long v16 = 136315906;
    long long v75 = v16;
    while (v82 < objc_msgSend(v80, "count", v75))
    {
      id v17 = objc_msgSend(v80, "objectAtIndexedSubscript:");
      if ([v17 isPolylineA]) {
        unint64_t v18 = v78;
      }
      else {
        unint64_t v18 = v79;
      }
      id v83 = v18;
      if ([v17 isPolylineA]) {
        unint64_t v19 = v79;
      }
      else {
        unint64_t v19 = v78;
      }
      id v81 = v19;
      v84 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v17, "index"));
      if ([v17 isStartOfSegment])
      {
        v20 = [v83 objectForKeyedSubscript:v84];
        BOOL v21 = v20 == 0;

        if (!v21)
        {
          v72 = GEOFindOrCreateLog();
          if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v75;
            v93 = "+[GEOComposedRoute(MNExtras) _pointsConverge:pointCount:otherPoints:pointCount:tolerance:outCoordinate"
                  "sA:outCoordinatesB:]";
            __int16 v94 = 2080;
            v95 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Extras/GEOComposedRoute+MNExtras.mm";
            __int16 v96 = 1024;
            int v97 = 569;
            __int16 v98 = 2080;
            v99 = "currentPolylineSegments[key] == nil";
            _os_log_impl(&dword_1B542B000, v72, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s)", buf, 0x26u);
          }
        }
        [v83 setObject:v17 forKey:v84];
        long long v89 = 0u;
        long long v90 = 0u;
        long long v87 = 0u;
        long long v88 = 0u;
        int v22 = [v81 allValues];
        uint64_t v23 = [v22 countByEnumeratingWithState:&v87 objects:v91 count:16];
        if (v23)
        {
          uint64_t v24 = *(void *)v88;
          while (2)
          {
            for (uint64_t i = 0; i != v23; ++i)
            {
              if (*(void *)v88 != v24) {
                objc_enumerationMutation(v22);
              }
              v26 = *(void **)(*((void *)&v87 + 1) + 8 * i);
              if ([v17 isPolylineA]) {
                unint64_t v27 = v17;
              }
              else {
                unint64_t v27 = v26;
              }
              id v28 = v27;
              if ([v17 isPolylineA]) {
                unint64_t v29 = v26;
              }
              else {
                unint64_t v29 = v17;
              }
              id v30 = v29;
              [v28 segment];
              double v32 = v31;
              double v34 = v33;
              double v36 = v35;
              double v38 = v37;
              [v30 segment];
              double v43 = ((v32 - v39) * v41 + 0.0 + (v34 - v40) * v42) / (v41 * v41 + 0.0 + v42 * v42);
              if (v43 < 0.0) {
                double v43 = 0.0;
              }
              if (v43 <= 1.0) {
                double v44 = v43;
              }
              else {
                double v44 = 1.0;
              }
              double v45 = v40 + v42 - v40;
              double v46 = v39 + v41 - v39;
              double v47 = (v39 + v46 * v44 - v32) * (v39 + v46 * v44 - v32)
                  + 0.0
                  + (v40 + v45 * v44 - v34) * (v40 + v45 * v44 - v34);
              double v48 = ((v39 - v32) * v36 + 0.0 + (v40 - v34) * v38) / (v36 * v36 + 0.0 + v38 * v38);
              if (v48 < 0.0) {
                double v48 = 0.0;
              }
              if (v48 <= 1.0) {
                double v49 = v48;
              }
              else {
                double v49 = 1.0;
              }
              double v50 = v34 + v38 - v34;
              double v51 = v34 + v50 * v49 - v40;
              double v52 = v32 + v36 - v32;
              double v53 = (v32 + v52 * v49 - v39) * (v32 + v52 * v49 - v39) + 0.0 + v51 * v51;
              BOOL v54 = v47 <= v86 || v53 <= v86;
              if (v54
                && (fabs(v49) >= 0.000001 || fabs(v44 + -1.0) >= 0.000001)
                && (fabs(v49 + -1.0) >= 0.000001 || fabs(v44) >= 0.000001))
              {
                double v55 = 1.0 / sqrt(v52 * v52 + 0.0 + v50 * v50);
                double v56 = v52 * v55;
                double v57 = v50 * v55;
                double v58 = 1.0 / sqrt(v46 * v46 + 0.0 + v45 * v45);
                if (v56 * (v46 * v58) + 0.0 + v57 * (v45 * v58) >= 0.99)
                {
                  if (v85 == 0)
                  {

                    char v9 = 1;
                    goto LABEL_66;
                  }
                  unsigned int v59 = [v28 index];
                  unsigned int v60 = v59;
                  float v61 = v49;
                  if (v61 >= 1.0)
                  {
                    unsigned int v60 = v59 + vcvtms_u32_f32(v61);
                    float v61 = v61 - (float)floorf(v61);
                  }
                  unsigned int v62 = [v30 index];
                  float v63 = v44;
                  unsigned int v64 = v62 + vcvtms_u32_f32(v63);
                  float v65 = v63 - (float)floorf(v63);
                  if (v63 >= 1.0) {
                    float v66 = v65;
                  }
                  else {
                    float v66 = v44;
                  }
                  if (v63 >= 1.0) {
                    uint64_t v67 = v64;
                  }
                  else {
                    uint64_t v67 = v62;
                  }
                  v68 = +[MNRouteCoordinateWithType convergenceCoordinate:v60 | ((unint64_t)LODWORD(v61) << 32)];
                  [*((id *)&v85 + 1) addObject:v68];

                  v69 = +[MNRouteCoordinateWithType convergenceCoordinate:v67 | ((unint64_t)LODWORD(v66) << 32)];
                  [(id)v85 addObject:v69];

                  char v9 = 1;
                }
              }
            }
            uint64_t v23 = [v22 countByEnumeratingWithState:&v87 objects:v91 count:16];
            if (v23) {
              continue;
            }
            break;
          }
        }
LABEL_66:
      }
      else
      {
        v70 = [v83 objectForKeyedSubscript:v84];
        BOOL v71 = v70 == 0;

        if (v71)
        {
          v73 = GEOFindOrCreateLog();
          if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v75;
            v93 = "+[GEOComposedRoute(MNExtras) _pointsConverge:pointCount:otherPoints:pointCount:tolerance:outCoordinate"
                  "sA:outCoordinatesB:]";
            __int16 v94 = 2080;
            v95 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Extras/GEOComposedRoute+MNExtras.mm";
            __int16 v96 = 1024;
            int v97 = 608;
            __int16 v98 = 2080;
            v99 = "currentPolylineSegments[key] != nil";
            _os_log_impl(&dword_1B542B000, v73, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s)", buf, 0x26u);
          }
        }
        [v83 removeObjectForKey:v84];
      }

      ++v82;
    }
    if (v9)
    {
      if (a8)
      {
        [*((id *)&v85 + 1) sortUsingComparator:&__block_literal_global_106];
        *a8 = *((id *)&v85 + 1);
      }
      if (a9)
      {
        [(id)v85 sortUsingComparator:&__block_literal_global_106];
        *a9 = (id) v85;
      }
    }
  }
  return v9 & 1;
}

+ (void)findDivergenceAndConvergence:()MNExtras pointCount:otherPoints:pointCount:divergenceTolerance:convergenceTolerance:outCoordinatesA:outCoordinatesB:
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  if (a9) {
    *a9 = 0;
  }
  if (a10) {
    *a10 = 0;
  }
  if (a6 >= 2 && a8 >= 2)
  {
    id v40 = [MEMORY[0x1E4F1CA48] array];
    id v39 = [MEMORY[0x1E4F1CA48] array];
    id v43 = 0;
    id v44 = 0;
    int v12 = [a1 _pointsConverge:a5 pointCount:a6 otherPoints:a7 pointCount:a8 tolerance:&v44 outCoordinatesA:&v43 outCoordinatesB:a3];
    id v13 = v44;
    id v14 = v43;
    uint64_t v15 = [v13 count];
    if (v15 != [v14 count])
    {
      double v31 = [NSString stringWithFormat:@"Mismatched number of convergence points"];
      double v32 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        *(void *)&uint8_t buf[4] = "+[GEOComposedRoute(MNExtras) findDivergenceAndConvergence:pointCount:otherPoints:pointCount"
                             ":divergenceTolerance:convergenceTolerance:outCoordinatesA:outCoordinatesB:]";
        __int16 v46 = 2080;
        double v47 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Extras/GEOComposedRoute+MNExtras.mm";
        __int16 v48 = 1024;
        int v49 = 663;
        __int16 v50 = 2080;
        double v51 = "convergenceCoordinatesA.count == convergenceCoordinatesB.count";
        __int16 v52 = 2112;
        double v53 = v31;
        _os_log_impl(&dword_1B542B000, v32, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s) %@", buf, 0x30u);
      }
    }
    if (v12)
    {
      unint64_t v16 = 0;
      id v17 = (float *)MEMORY[0x1E4F64198];
      LODWORD(v18) = *MEMORY[0x1E4F64198];
      float v19 = *(float *)(MEMORY[0x1E4F64198] + 4);
      LODWORD(v20) = *MEMORY[0x1E4F64198];
      float v21 = v19;
      while (1)
      {
        if (v16 >= [v13 count])
        {
LABEL_26:
          if (a9) {
            *a9 = v40;
          }
          if (a10) {
            *a10 = v39;
          }
          break;
        }
        int v22 = [v13 objectAtIndexedSubscript:v16];
        uint64_t v23 = [v14 objectAtIndexedSubscript:v16];
        if (v20 != *(_DWORD *)v17 || (float v24 = *(float *)&v20, vabds_f32(v21, v17[1]) >= 0.00000011921))
        {
          uint64_t v25 = [v22 routeCoordinate];
          if (v20 > v25 || v20 == v25 && v21 >= *((float *)&v25 + 1)) {
            goto LABEL_24;
          }
          float v24 = *v17;
        }
        if (v18 == LODWORD(v24) && vabds_f32(v19, v17[1]) < 0.00000011921
          || (uint64_t v26 = [v23 routeCoordinate], v18 <= v26)
          && (v18 != v26 || v19 < *((float *)&v26 + 1)))
        {
          [v40 addObject:v22];
          [v39 addObject:v23];
          unsigned int v27 = [v22 routeCoordinate];
          unsigned int v28 = [v23 routeCoordinate];
          *(void *)buf = *(void *)v17;
          uint64_t v42 = *(void *)buf;
          if (([a1 _pointsDiverge:a5 + 16 * v27 pointCount:a6 - v27 otherPoints:a7 + 16 * v28 pointCount:a8 - v28 tolerance:buf outCoordinateA:&v42 outCoordinateB:a2] & 1) == 0)
          {

            goto LABEL_26;
          }
          *(_DWORD *)buf += v27;
          LODWORD(v42) = v42 + v28;
          unint64_t v29 = +[MNRouteCoordinateWithType divergenceCoordinate:*(void *)buf];
          id v30 = +[MNRouteCoordinateWithType divergenceCoordinate:v42];
          [v40 addObject:v29];
          [v39 addObject:v30];
          uint64_t v20 = [v29 routeCoordinate];
          uint64_t v18 = [v30 routeCoordinate];

          float v21 = *((float *)&v20 + 1);
          float v19 = *((float *)&v18 + 1);
        }
LABEL_24:

        ++v16;
      }
    }
  }
}

+ (void)findDivergenceAndConvergence:()MNExtras pointCount:otherCoordinates:pointCount:distanceInMeters:outDivergenceCoordinateA:outDivergenceCoordinateB:outConvergenceCoordinateA:outConvergenceCoordinateB:
{
  if (a5 >= 2)
  {
    unint64_t v11 = a7;
    if (a7 >= 2)
    {
      unint64_t v15 = a5;
      unint64_t v29 = [[_MNMapPointsArray alloc] initWithCapacity:a5];
      unint64_t v16 = [[_MNMapPointsArray alloc] initWithCapacity:v11];
      uint64_t v17 = 0;
      do
      {
        GEOMapPointForCoordinate();
        double v19 = v18;
        double v21 = v20;
        int v22 = [(_MNMapPointsArray *)v29 mapPoints] + v17;
        v22->var0 = v19;
        v22->var1 = v21;
        v17 += 16;
        --v15;
      }
      while (v15);
      do
      {
        GEOMapPointForCoordinate();
        double v24 = v23;
        double v26 = v25;
        unsigned int v27 = [(_MNMapPointsArray *)v16 mapPoints] + v15;
        v27->var0 = v24;
        v27->var1 = v26;
        v15 += 16;
        --v11;
      }
      while (v11);
      GEOMapPointsPerMeterAtLatitude();
      objc_msgSend(MEMORY[0x1E4F644A0], "_findDivergenceAndConvergence:pointCount:otherPoints:pointCount:divergenceTolerance:convergenceTolerance:outDivergenceCoordinateA:outDivergenceCoordinateB:outConvergenceCoordinateA:outConvergenceCoordinateB:", -[_MNMapPointsArray mapPoints](v29, "mapPoints"), -[_MNMapPointsArray count](v29, "count"), -[_MNMapPointsArray mapPoints](v16, "mapPoints"), -[_MNMapPointsArray count](v16, "count"), a8, a9, v28 * a1, v28 * a1, a10, a11);
    }
  }
}

+ (uint64_t)findDivergenceAndConvergence:()MNExtras pointCount:otherPoints:pointCount:outDivergenceCoordinateA:outDivergenceCoordinateB:outConvergenceCoordinateA:outConvergenceCoordinateB:
{
  return objc_msgSend(a1, "_findDivergenceAndConvergence:pointCount:otherPoints:pointCount:divergenceTolerance:convergenceTolerance:outDivergenceCoordinateA:outDivergenceCoordinateB:outConvergenceCoordinateA:outConvergenceCoordinateB:", 0.01, 0.01);
}

+ (void)_findDivergenceAndConvergence:()MNExtras pointCount:otherPoints:pointCount:divergenceTolerance:convergenceTolerance:outDivergenceCoordinateA:outDivergenceCoordinateB:outConvergenceCoordinateA:outConvergenceCoordinateB:
{
  double v19 = result;
  double v20 = (unint64_t *)MEMORY[0x1E4F64198];
  if (a9) {
    *a9 = *MEMORY[0x1E4F64198];
  }
  if (a10) {
    *a10 = *v20;
  }
  if (a11) {
    *a11 = *v20;
  }
  if (a12) {
    *a12 = *v20;
  }
  if (a6 >= 2 && a8 >= 2)
  {
    unint64_t v27 = 0xBF80000000000000;
    unint64_t v28 = 0xBF80000000000000;
    result = objc_msgSend(result, "_pointsDiverge:pointCount:otherPoints:pointCount:tolerance:outCoordinateA:outCoordinateB:", a5, a6, a7, a8, &v28, &v27);
    if (result)
    {
      if (a9) {
        *a9 = v28;
      }
      unsigned int v21 = v27;
      if (a10) {
        *a10 = v27;
      }
      unint64_t v22 = v28 + 1;
      unint64_t v23 = a6 - v22;
      if (a6 > v22)
      {
        unint64_t v24 = v21 + 1;
        if (a8 > v24)
        {
          unint64_t v25 = 0xBF80000000000000;
          unint64_t v26 = 0xBF80000000000000;
          result = (void *)[v19 _pointsConverge:a5 + 16 * v22 pointCount:v23 otherPoints:a7 + 16 * v24 pointCount:a8 - v24 tolerance:&v26 outCoordinateA:&v25 outCoordinateB:a3];
          if (result)
          {
            LODWORD(v26) = v26 + v22;
            LODWORD(v25) = v25 + v24;
            if (a11) {
              *a11 = v26;
            }
            if (a12) {
              *a12 = v25;
            }
          }
        }
      }
    }
  }
  return result;
}

- (_MNMapPointsArray)_mapPoints
{
  unsigned int v2 = [a1 pointCount];
  uint64_t v3 = v2;
  v4 = [[_MNMapPointsArray alloc] initWithCapacity:v2];
  if (v2)
  {
    uint64_t v5 = 0;
    uint64_t v6 = 0;
    do
    {
      [a1 pointAt:v6];
      GEOMapPointForCoordinate();
      double v8 = v7;
      double v10 = v9;
      unint64_t v11 = [(_MNMapPointsArray *)v4 mapPoints] + v5;
      v11->var0 = v8;
      v11->var1 = v10;
      ++v6;
      v5 += 16;
    }
    while (v3 != v6);
  }
  return v4;
}

+ (uint64_t)_startIndexForPoints:()MNExtras withPoints:pointCount:toleranceSquared:
{
  uint64_t v7 = 0;
  double v8 = (double *)(a6 + 16);
  do
  {
    if (1 - a7 == v7) {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
    double v9 = *(v8 - 2);
    double v10 = *(v8 - 1);
    double v11 = *v8 - v9;
    double v12 = v8[1] - v10;
    double v13 = 0.0;
    double v14 = v11 * v11 + 0.0 + v12 * v12;
    if (v14 > 1.0e-15)
    {
      double v13 = ((a1 - v9) * v11 + 0.0 + (a2 - v10) * v12) / v14;
      if (v13 < 0.0) {
        double v13 = 0.0;
      }
      if (v13 > 1.0) {
        double v13 = 1.0;
      }
    }
    --v7;
    v8 += 2;
  }
  while ((a1 - (v9 + v11 * v13)) * (a1 - (v9 + v11 * v13)) + 0.0 + (a2 - (v10 + v12 * v13)) * (a2 - (v10 + v12 * v13)) >= a3);
  uint64_t v15 = ~v7;
  if (fabs(v13) < 0.000001) {
    return v15;
  }
  else {
    return v15 + 1;
  }
}

+ (void)_addPointsToArray:()MNExtras forMapPoints:pointCount:isPolylineA:
{
  id v24 = a3;
  uint64_t v9 = a5 - 1;
  if (a5 != 1)
  {
    uint64_t v10 = 0;
    double v11 = (double *)(a4 + 16);
    do
    {
      double v12 = *(v11 - 2);
      double v13 = *(v11 - 1);
      double v14 = *v11;
      double v15 = v11[1];
      double v16 = *v11 - v12;
      if (v16 * v16 + 0.0 + (v15 - v13) * (v15 - v13) >= 0.000001)
      {
        uint64_t v17 = objc_alloc_init(_MNMapPointWithIndex);
        double v18 = v17;
        if (v14 >= v12) {
          double v19 = v12;
        }
        else {
          double v19 = v14;
        }
        if (v14 >= v12) {
          double v20 = v13;
        }
        else {
          double v20 = v15;
        }
        -[_MNMapPointWithIndex setPoint:](v17, "setPoint:", v19, v20);
        [(_MNMapPointWithIndex *)v18 setIndex:v10];
        [(_MNMapPointWithIndex *)v18 setIsStartOfSegment:1];
        [(_MNMapPointWithIndex *)v18 setIsPolylineA:a6];
        [(_MNMapPointWithIndex *)v18 setIsFlipped:v14 < v12];
        -[_MNMapPointWithIndex setSegment:](v18, "setSegment:", v12, v13, v16, v15 - v13);
        [v24 addObject:v18];
        unsigned int v21 = objc_alloc_init(_MNMapPointWithIndex);

        if (v14 >= v12) {
          double v22 = v14;
        }
        else {
          double v22 = v12;
        }
        if (v14 >= v12) {
          double v23 = v15;
        }
        else {
          double v23 = v13;
        }
        -[_MNMapPointWithIndex setPoint:](v21, "setPoint:", v22, v23);
        [(_MNMapPointWithIndex *)v21 setIndex:v10];
        [(_MNMapPointWithIndex *)v21 setIsStartOfSegment:0];
        [(_MNMapPointWithIndex *)v21 setIsPolylineA:a6];
        [(_MNMapPointWithIndex *)v21 setIsFlipped:v14 < v12];
        -[_MNMapPointWithIndex setSegment:](v21, "setSegment:", v12, v13, v16, v15 - v13);
        [v24 addObject:v21];
      }
      ++v10;
      v11 += 2;
    }
    while (v9 != v10);
  }
}

+ (uint64_t)_stringForPoint:()MNExtras
{
  return [NSString stringWithFormat:@"%0.3f, %0.3f", *a3, a3[1]];
}

- (uint64_t)isNavigableForWatch
{
  if ([a1 transportType] == 1) {
    return 1;
  }
  unsigned int v2 = [MEMORY[0x1E4F64500] sharedConfiguration];
  char v3 = [v2 currentCountrySupportsNavigation];

  if ((v3 & 1) == 0 || ![a1 isNavigable]) {
    return 0;
  }
  unsigned int v4 = [a1 transportType];
  uint64_t v5 = 0;
  if (v4 <= 3 && v4 != 1)
  {
    if (([a1 source] & 0xFFFFFFFFFFFFFFFELL) == 2) {
      return 1;
    }
    uint64_t v6 = [a1 origin];
    if (v6)
    {
      uint64_t v7 = [a1 origin];
      uint64_t v5 = [v7 isCurrentLocation];
    }
    else
    {
      uint64_t v5 = 1;
    }
  }
  return v5;
}

- (uint64_t)isMultipointRoute
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  unsigned int v2 = [a1 legs];
  unint64_t v3 = [v2 count];

  if (v3 < 2) {
    return 0;
  }
  uint64_t v5 = [a1 waypoints];
  uint64_t v6 = [a1 waypoints];
  uint64_t v7 = objc_msgSend(v5, "subarrayWithRange:", 1, objc_msgSend(v6, "count") - 2);

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v8 = v7;
  uint64_t v4 = [v8 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v9 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v8);
        }
        if ((objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "isServerProvidedWaypoint", (void)v12) & 1) == 0)
        {
          uint64_t v4 = 1;
          goto LABEL_13;
        }
      }
      uint64_t v4 = [v8 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_13:

  return v4;
}

- (id)userRequestedWaypoints
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  unint64_t v3 = [a1 waypoints];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__GEOComposedRoute_MNExtras__userRequestedWaypoints__block_invoke;
  v7[3] = &unk_1E60F85E0;
  id v4 = v2;
  id v8 = v4;
  [v3 enumerateObjectsUsingBlock:v7];

  uint64_t v5 = (void *)[v4 copy];
  return v5;
}

@end