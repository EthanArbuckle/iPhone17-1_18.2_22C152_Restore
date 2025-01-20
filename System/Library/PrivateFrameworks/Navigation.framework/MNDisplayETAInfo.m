@interface MNDisplayETAInfo
+ (BOOL)isDisplayDate:(id)a3 equalTo:(id)a4;
+ (BOOL)supportsSecureCoding;
+ (id)dateFormatter;
+ (id)displayETAInfoForRouteInfo:(id)a3 routeCoordinate:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isUsingServerDisplayETA;
- (MNDisplayETAInfo)initWithCoder:(id)a3;
- (MNDisplayETAInfo)initWithDisplayETAToEndOfLeg:(id)a3 displayRemainingMinutesToEndOfLeg:(unint64_t)a4 displayETAToEndOfRoute:(id)a5 displayRemainingMinutesToEndOfRoute:(unint64_t)a6;
- (NSArray)legInfos;
- (NSDate)displayETAToEndOfLeg;
- (NSDate)etaToEndOfRoute;
- (NSUUID)routeID;
- (id)description;
- (unint64_t)displayRemainingMinutesToEndOfLeg;
- (unint64_t)legIndex;
- (unint64_t)remainingMinutesToEndOfRoute;
- (void)encodeWithCoder:(id)a3;
- (void)setEtaToEndOfRoute:(id)a3;
- (void)setLegInfos:(id)a3;
- (void)setRemainingMinutesToEndOfRoute:(unint64_t)a3;
- (void)setRouteID:(id)a3;
@end

@implementation MNDisplayETAInfo

+ (id)displayETAInfoForRouteInfo:(id)a3 routeCoordinate:(id)a4
{
  uint64_t v106 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = [v5 route];
  uint64_t v7 = [v6 legIndexForRouteCoordinate:a4];

  uint64_t v95 = -1;
  v8 = [v5 etaRoute];
  uint64_t v9 = [v8 serverDisplayETA];
  if (!v9) {
    goto LABEL_6;
  }
  v10 = (void *)v9;
  v11 = [v8 legs];
  v12 = [v11 firstObject];
  uint64_t v13 = [v12 originalLegIndex];

  if (v13 != v7) {
    goto LABEL_6;
  }
  GEOConfigGetDouble();
  double v15 = v14;
  v16 = [MEMORY[0x1E4F1C9C8] now];
  [v16 timeIntervalSinceReferenceDate];
  double v18 = v17;

  v19 = [v8 responseDate];
  [v19 timeIntervalSinceReferenceDate];
  double v21 = v15 + v20;

  if (v18 < v21)
  {
    id v22 = [v8 serverDisplayETA];
    [v22 timeIntervalSinceNow];
    double v24 = v23;
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    double v26 = floor(v25 / 60.0);
    [v22 timeIntervalSinceReferenceDate];
    unint64_t v28 = (unint64_t)(floor(v27 / 60.0) - v26);
    uint64_t v95 = v28;
    char v29 = 1;
    if (!v22) {
      goto LABEL_12;
    }
  }
  else
  {
LABEL_6:
    v30 = [v5 route];
    v31 = [v5 etaRoute];
    [v30 remainingTimeToEndOfCurrentLegFrom:a4 etaRoute:v31];
    double v24 = v32;

    id v94 = 0;
    MNDisplayETAAndRemainingMinutes(&v94, &v95, v24);
    id v22 = v94;
    char v29 = 0;
    unint64_t v28 = v95;
    if (!v22)
    {
LABEL_12:
      v65 = [NSString stringWithFormat:@"Got an invalid display ETA to end of leg : %@ %llu", v22, v28];
      v66 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        v97 = "+[MNDisplayETAInfo displayETAInfoForRouteInfo:routeCoordinate:]";
        __int16 v98 = 2080;
        v99 = "/Library/Caches/com.apple.xbs/Sources/Navigation/TrafficETA/MNDisplayETAInfo.m";
        __int16 v100 = 1024;
        int v101 = 129;
        __int16 v102 = 2080;
        v103 = "NO";
        __int16 v104 = 2112;
        v105 = v65;
        _os_log_impl(&dword_1B542B000, v66, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s) %@", buf, 0x30u);
      }
      v67 = 0;
      goto LABEL_18;
    }
  }
  if (v28 == -1) {
    goto LABEL_12;
  }
  char v86 = v29;
  v33 = [v5 route];
  v34 = [v33 legs];
  v35 = [v34 objectAtIndexedSubscript:v7];

  v36 = [v35 destination];
  uint64_t v37 = [v36 timezone];

  v38 = [MEMORY[0x1E4F1CA48] array];
  v39 = objc_alloc_init(MNDisplayETALegInfo);
  v88 = v35;
  [v35 destination];
  v41 = v40 = v8;
  v42 = [v41 uniqueID];
  [(MNDisplayETALegInfo *)v39 setWaypointID:v42];

  [(MNDisplayETALegInfo *)v39 setLegIndex:v7];
  [(MNDisplayETALegInfo *)v39 setRemainingMinutes:v95];
  id v89 = v22;
  [(MNDisplayETALegInfo *)v39 setEta:v22];
  v87 = v37;
  [(MNDisplayETALegInfo *)v39 setTimeZone:v37];
  [v38 addObject:v39];
  v91[0] = MEMORY[0x1E4F143A8];
  v91[1] = 3221225472;
  v91[2] = __63__MNDisplayETAInfo_displayETAInfoForRouteInfo_routeCoordinate___block_invoke;
  v91[3] = &unk_1E60FB918;
  id v43 = v5;
  id v92 = v43;
  id v44 = v38;
  id v93 = v44;
  v45 = (void (**)(void, void, double))MEMORY[0x1BA99B3A0](v91);
  v90 = v40;
  if (v40)
  {
    v46 = [v43 route];
    v47 = [v46 legs];
    uint64_t v84 = [v47 count];
    v48 = [v43 etaRoute];
    [v48 legs];
    v50 = id v49 = v44;
    v85 = v39;
    id v51 = v5;
    uint64_t v52 = [v50 count];

    id v44 = v49;
    uint64_t v53 = v7 - v84 + v52;
    id v5 = v51;
    v39 = v85;
    unint64_t v54 = v53 + 1;
    v55 = [v43 etaRoute];
    v56 = [v55 legs];
    unint64_t v57 = [v56 count];

    if (v54 < v57)
    {
      do
      {
        v58 = [v43 etaRoute];
        v59 = [v58 legs];
        v60 = [v59 objectAtIndexedSubscript:v54];

        [v60 travelDuration];
        double v24 = v24 + v61;
        v45[2](v45, [v60 originalLegIndex], v24);

        ++v54;
        v62 = [v43 etaRoute];
        v63 = [v62 legs];
        unint64_t v64 = [v63 count];
      }
      while (v54 < v64);
    }
  }
  else
  {
    unint64_t v68 = v7 + 1;
    v69 = [v43 route];
    v70 = [v69 legs];
    unint64_t v71 = [v70 count];

    if (v68 < v71)
    {
      do
      {
        v72 = [v43 route];
        v73 = [v72 legs];
        v74 = [v73 objectAtIndexedSubscript:v68];

        [v74 travelDuration];
        double v24 = v24 + v75;
        v45[2](v45, v68, v24);

        ++v68;
        v76 = [v43 route];
        v77 = [v76 legs];
        unint64_t v78 = [v77 count];
      }
      while (v68 < v78);
    }
  }
  v67 = objc_alloc_init(MNDisplayETAInfo);
  v79 = [v43 routeID];
  [(MNDisplayETAInfo *)v67 setRouteID:v79];

  [(MNDisplayETAInfo *)v67 setLegInfos:v44];
  v80 = [v44 lastObject];
  -[MNDisplayETAInfo setRemainingMinutesToEndOfRoute:](v67, "setRemainingMinutesToEndOfRoute:", [v80 remainingMinutes]);

  v81 = [v44 lastObject];
  v82 = [v81 eta];
  [(MNDisplayETAInfo *)v67 setEtaToEndOfRoute:v82];

  v67->_isUsingServerDisplayETA = v86;
  id v22 = v89;
  v8 = v90;
  v66 = v87;
  v65 = v88;
LABEL_18:

  return v67;
}

void __63__MNDisplayETAInfo_displayETAInfoForRouteInfo_routeCoordinate___block_invoke(uint64_t a1, uint64_t a2, double a3)
{
  id v14 = 0;
  uint64_t v15 = -1;
  MNDisplayETAAndRemainingMinutes(&v14, &v15, a3);
  id v5 = v14;
  v6 = [*(id *)(a1 + 32) route];
  uint64_t v7 = [v6 legs];
  v8 = [v7 objectAtIndexedSubscript:a2];

  uint64_t v9 = [v8 destination];
  v10 = [v9 timezone];

  v11 = objc_alloc_init(MNDisplayETALegInfo);
  v12 = [v8 destination];
  uint64_t v13 = [v12 uniqueID];
  [(MNDisplayETALegInfo *)v11 setWaypointID:v13];

  [(MNDisplayETALegInfo *)v11 setLegIndex:a2];
  [(MNDisplayETALegInfo *)v11 setRemainingMinutes:v15];
  [(MNDisplayETALegInfo *)v11 setEta:v5];
  [(MNDisplayETALegInfo *)v11 setTimeZone:v10];
  [*(id *)(a1 + 40) addObject:v11];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MNDisplayETAInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)MNDisplayETAInfo;
  id v5 = [(MNDisplayETAInfo *)&v17 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_routeID"];
    routeID = v5->_routeID;
    v5->_routeID = (NSUUID *)v6;

    v8 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v9 = objc_opt_class();
    v10 = objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"_legInfos"];
    legInfos = v5->_legInfos;
    v5->_legInfos = (NSArray *)v11;

    v5->_remainingMinutesToEndOfRoute = [v4 decodeIntegerForKey:@"_remainingMinutesToEndOfRoute"];
    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_etaToEndOfRoute"];
    etaToEndOfRoute = v5->_etaToEndOfRoute;
    v5->_etaToEndOfRoute = (NSDate *)v13;

    v5->_isUsingServerDisplayETA = [v4 decodeBoolForKey:@"_isUsingServerDisplayETA"];
    uint64_t v15 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  routeID = self->_routeID;
  id v5 = a3;
  [v5 encodeObject:routeID forKey:@"_routeID"];
  [v5 encodeObject:self->_legInfos forKey:@"_legInfos"];
  [v5 encodeInteger:self->_remainingMinutesToEndOfRoute forKey:@"_remainingMinutesToEndOfRoute"];
  [v5 encodeObject:self->_etaToEndOfRoute forKey:@"_etaToEndOfRoute"];
  [v5 encodeBool:self->_isUsingServerDisplayETA forKey:@"_isUsingServerDisplayETA"];
}

- (id)description
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v3 = +[MNDisplayETAInfo dateFormatter];
  id v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[NSArray count](self->_legInfos, "count"));
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = self->_legInfos;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = [*(id *)(*((void *)&v16 + 1) + 8 * i) description];
        [v4 addObject:v10];
      }
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }

  uint64_t v11 = NSString;
  v12 = [v4 componentsJoinedByString:@", "];
  uint64_t v13 = [v3 stringFromDate:self->_etaToEndOfRoute];
  id v14 = [v11 stringWithFormat:@"%@ | endOfRoute: %@ / %d min", v12, v13, self->_remainingMinutesToEndOfRoute];

  return v14;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    uint64_t v6 = (void *)v5[2];
    unint64_t v7 = self->_routeID;
    unint64_t v8 = v6;
    if ((!(v7 | v8)
       || (uint64_t v9 = (void *)v8, v10 = [(id)v7 isEqual:v8], v9, (id)v7, v10))
      && self->_remainingMinutesToEndOfRoute == v5[3]
      && +[MNDisplayETAInfo isDisplayDate:self->_etaToEndOfRoute equalTo:v5[4]])
    {
      legInfos = self->_legInfos;
      uint64_t v12 = v5[1];
      id v13 = legInfos;
      id v14 = v13;
      if ((unint64_t)v13 | v12) {
        char v15 = [v13 isEqual:v12];
      }
      else {
        char v15 = 1;
      }
    }
    else
    {
      char v15 = 0;
    }
  }
  else
  {
    char v15 = 0;
  }

  return v15;
}

+ (BOOL)isDisplayDate:(id)a3 equalTo:(id)a4
{
  unint64_t v5 = (unint64_t)a3;
  unint64_t v6 = (unint64_t)a4;
  unint64_t v7 = (void *)v6;
  if (v5 | v6)
  {
    BOOL v8 = 0;
    if (v5 && v6)
    {
      uint64_t v9 = [MEMORY[0x1E4F1C9A8] currentCalendar];
      uint64_t v10 = [v9 compareDate:v5 toDate:v7 toUnitGranularity:64];

      BOOL v8 = v10 == 0;
    }
  }
  else
  {
    BOOL v8 = 1;
  }

  return v8;
}

+ (id)dateFormatter
{
  if (qword_1EB59C2B0 != -1) {
    dispatch_once(&qword_1EB59C2B0, &__block_literal_global_45);
  }
  v2 = (void *)_MergedGlobals_45;
  return v2;
}

uint64_t __33__MNDisplayETAInfo_dateFormatter__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v1 = (void *)_MergedGlobals_45;
  _MergedGlobals_45 = (uint64_t)v0;

  [(id)_MergedGlobals_45 setDateStyle:0];
  v2 = (void *)_MergedGlobals_45;
  return [v2 setTimeStyle:1];
}

- (NSUUID)routeID
{
  return self->_routeID;
}

- (void)setRouteID:(id)a3
{
}

- (NSArray)legInfos
{
  return self->_legInfos;
}

- (void)setLegInfos:(id)a3
{
}

- (unint64_t)remainingMinutesToEndOfRoute
{
  return self->_remainingMinutesToEndOfRoute;
}

- (void)setRemainingMinutesToEndOfRoute:(unint64_t)a3
{
  self->_remainingMinutesToEndOfRoute = a3;
}

- (NSDate)etaToEndOfRoute
{
  return self->_etaToEndOfRoute;
}

- (void)setEtaToEndOfRoute:(id)a3
{
}

- (BOOL)isUsingServerDisplayETA
{
  return self->_isUsingServerDisplayETA;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_etaToEndOfRoute, 0);
  objc_storeStrong((id *)&self->_routeID, 0);
  objc_storeStrong((id *)&self->_legInfos, 0);
}

- (unint64_t)displayRemainingMinutesToEndOfLeg
{
  v2 = [(MNDisplayETAInfo *)self legInfos];
  v3 = [v2 firstObject];
  unint64_t v4 = [v3 remainingMinutes];

  return v4;
}

- (NSDate)displayETAToEndOfLeg
{
  v2 = [(MNDisplayETAInfo *)self legInfos];
  v3 = [v2 firstObject];
  unint64_t v4 = [v3 eta];

  return (NSDate *)v4;
}

- (unint64_t)legIndex
{
  v3 = [(MNDisplayETAInfo *)self legInfos];
  if ([v3 count])
  {
    unint64_t v4 = [(MNDisplayETAInfo *)self legInfos];
    unint64_t v5 = [v4 firstObject];
    unint64_t v6 = [v5 legIndex];
  }
  else
  {
    unint64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v6;
}

- (MNDisplayETAInfo)initWithDisplayETAToEndOfLeg:(id)a3 displayRemainingMinutesToEndOfLeg:(unint64_t)a4 displayETAToEndOfRoute:(id)a5 displayRemainingMinutesToEndOfRoute:(unint64_t)a6
{
  id v9 = a5;
  v14.receiver = self;
  v14.super_class = (Class)MNDisplayETAInfo;
  uint64_t v10 = [(MNDisplayETAInfo *)&v14 init];
  uint64_t v11 = v10;
  if (v10)
  {
    v10->_remainingMinutesToEndOfRoute = a6;
    objc_storeStrong((id *)&v10->_etaToEndOfRoute, a5);
    uint64_t v12 = v11;
  }

  return v11;
}

@end