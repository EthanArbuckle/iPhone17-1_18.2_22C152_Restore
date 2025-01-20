@interface GEOETATrafficUpdateResponse(Testing)
- (void)addFakeTrafficIncidentAlert:()Testing mainRouteInfo:alternateRouteInfo:currentDistance:;
@end

@implementation GEOETATrafficUpdateResponse(Testing)

- (void)addFakeTrafficIncidentAlert:()Testing mainRouteInfo:alternateRouteInfo:currentDistance:
{
  id v45 = a5;
  id v10 = a4;
  int UInteger = GEOConfigGetUInteger();
  v12 = +[MNTrafficIncidentAlert createFakeTrafficBannerTextWithType:a3 mainRouteInfo:v10 alternateRouteInfo:v45 incidentDistance:50];

  if (GEOConfigGetBOOL())
  {
    [v12 setPreserveBannerInUpdates:GEOConfigGetBOOL()];
    id v13 = objc_alloc_init(MEMORY[0x1E4F64B28]);
    [v12 setTriggerRange:v13];

    uint64_t v14 = GEOConfigGetUInteger();
    v15 = [v12 triggerRange];
    [v15 setDisplayTime:v14];

    [v12 setMinDisplayTime:GEOConfigGetUInteger()];
    [v12 setPriority:GEOConfigGetUInteger()];
    id v16 = objc_alloc_init(MEMORY[0x1E4F64B20]);
    v17 = [v12 triggerRange];
    [v17 setShowAtPoint:v16];

    v18 = [v12 triggerRange];
    v19 = [v18 showAtPoint];
    [v19 setReferenceOffsetCm:(100 * (a6 - UInteger))];

    uint64_t BOOL = GEOConfigGetBOOL();
    v21 = [v12 triggerRange];
    v22 = [v21 hideAtPoint];
    [v22 setAllowsShifting:BOOL];

    if (GEOConfigGetBOOL())
    {
      id v23 = objc_alloc_init(MEMORY[0x1E4F64B20]);
      v24 = [v12 triggerRange];
      [v24 setHideAtPoint:v23];

      uint64_t v25 = 100 * (a6 - GEOConfigGetUInteger());
      v26 = [v12 triggerRange];
      v27 = [v26 hideAtPoint];
      [v27 setReferenceOffsetCm:v25];

      uint64_t v28 = GEOConfigGetBOOL();
      v29 = [v12 triggerRange];
      v30 = [v29 hideAtPoint];
      [v30 setAllowsShifting:v28];
    }
    if (GEOConfigGetBOOL())
    {
      id v31 = objc_alloc_init(MEMORY[0x1E4F64B28]);
      [v12 setProgressBarRange:v31];

      uint64_t v32 = GEOConfigGetUInteger();
      v33 = [v12 progressBarRange];
      [v33 setDisplayTime:v32];

      id v34 = objc_alloc_init(MEMORY[0x1E4F64B20]);
      v35 = [v12 progressBarRange];
      [v35 setShowAtPoint:v34];

      uint64_t v36 = 100 * (a6 - GEOConfigGetUInteger());
      v37 = [v12 progressBarRange];
      v38 = [v37 showAtPoint];
      [v38 setReferenceOffsetCm:v36];
    }
  }
  v39 = [a1 waypointRoute];
  if (v45)
  {
    v40 = [v45 route];
    v41 = [v40 geoWaypointRoute];
    v42 = (void *)[v41 copy];

    v43 = [MEMORY[0x1E4F1CA48] arrayWithObject:v42];
    [v39 setNewWaypointRoutes:v43];
  }
  [v39 addTrafficBannerText:v12];
  id v44 = objc_alloc_init(MEMORY[0x1E4F64750]);
  [v44 setIsBlocked:a3 == 1];
  [v39 setNavigabilityInfo:v44];
}

@end