@interface GEODirectionsResponse(Testing)
- (void)addFakeTrafficIncidentAlert:()Testing targetLegIndex:mainRouteInfo:alternateRouteInfo:currentDistance:;
@end

@implementation GEODirectionsResponse(Testing)

- (void)addFakeTrafficIncidentAlert:()Testing targetLegIndex:mainRouteInfo:alternateRouteInfo:currentDistance:
{
  id v43 = a5;
  id v12 = a6;
  if ([a1 waypointRoutesCount] > a4)
  {
    GEOConfigGetUInteger();
    v13 = +[MNTrafficIncidentAlert createFakeTrafficBannerTextWithType:a3 mainRouteInfo:v43 alternateRouteInfo:v12 incidentDistance:50];
    if (GEOConfigGetBOOL())
    {
      [v13 setPreserveBannerInUpdates:GEOConfigGetBOOL()];
      id v14 = objc_alloc_init(MEMORY[0x1E4F64B28]);
      [v13 setTriggerRange:v14];

      uint64_t UInteger = GEOConfigGetUInteger();
      v16 = [v13 triggerRange];
      [v16 setDisplayTime:UInteger];

      [v13 setMinDisplayTime:GEOConfigGetUInteger()];
      [v13 setPriority:GEOConfigGetUInteger()];
      id v17 = objc_alloc_init(MEMORY[0x1E4F64B20]);
      v18 = [v13 triggerRange];
      [v18 setShowAtPoint:v17];

      uint64_t v19 = 100 * (a7 - GEOConfigGetUInteger());
      v20 = [v13 triggerRange];
      v21 = [v20 showAtPoint];
      [v21 setReferenceOffsetCm:v19];

      uint64_t BOOL = GEOConfigGetBOOL();
      v23 = [v13 triggerRange];
      v24 = [v23 showAtPoint];
      [v24 setAllowsShifting:BOOL];

      if (GEOConfigGetBOOL())
      {
        id v25 = objc_alloc_init(MEMORY[0x1E4F64B20]);
        v26 = [v13 triggerRange];
        [v26 setHideAtPoint:v25];

        uint64_t v27 = 100 * (a7 - GEOConfigGetUInteger());
        v28 = [v13 triggerRange];
        v29 = [v28 hideAtPoint];
        [v29 setReferenceOffsetCm:v27];

        uint64_t v30 = GEOConfigGetBOOL();
        v31 = [v13 triggerRange];
        v32 = [v31 hideAtPoint];
        [v32 setAllowsShifting:v30];
      }
      if (GEOConfigGetBOOL())
      {
        id v33 = objc_alloc_init(MEMORY[0x1E4F64B28]);
        [v13 setProgressBarRange:v33];

        uint64_t v34 = GEOConfigGetUInteger();
        v35 = [v13 progressBarRange];
        [v35 setDisplayTime:v34];

        id v36 = objc_alloc_init(MEMORY[0x1E4F64B20]);
        v37 = [v13 progressBarRange];
        [v37 setShowAtPoint:v36];

        uint64_t v38 = 100 * (a7 - GEOConfigGetUInteger());
        v39 = [v13 progressBarRange];
        v40 = [v39 showAtPoint];
        [v40 setReferenceOffsetCm:v38];
      }
    }
    v41 = [a1 waypointRoutes];
    v42 = [v41 objectAtIndexedSubscript:a4];
    [v42 addTrafficBannerText:v13];
  }
}

@end