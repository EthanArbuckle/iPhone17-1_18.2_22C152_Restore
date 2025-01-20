@interface GEOComposedRoute(VKExtras)
- (double)_applyAltitudeCorrectionIfNecessary:()VKExtras;
- (double)pointWithAltitudeCorrectionAtIndex:()VKExtras;
- (double)pointWithAltitudeCorrectionAtRouteCoordinate:()VKExtras;
- (uint64_t)routeRequiresElevationCorrection;
- (uint64_t)shouldRequestWGS84Elevations;
@end

@implementation GEOComposedRoute(VKExtras)

- (double)pointWithAltitudeCorrectionAtIndex:()VKExtras
{
  objc_msgSend(a1, "pointAt:");
  v6[0] = v2;
  v6[1] = v3;
  v6[2] = v4;
  [a1 _applyAltitudeCorrectionIfNecessary:v6];
  return *(double *)v6;
}

- (double)pointWithAltitudeCorrectionAtRouteCoordinate:()VKExtras
{
  objc_msgSend(a1, "pointAtRouteCoordinate:");
  v6[0] = v2;
  v6[1] = v3;
  v6[2] = v4;
  [a1 _applyAltitudeCorrectionIfNecessary:v6];
  return *(double *)v6;
}

- (double)_applyAltitudeCorrectionIfNecessary:()VKExtras
{
  if ([a1 routeRequiresElevationCorrection])
  {
    v5 = +[VKSharedResourcesManager sharedResources];
    v6 = (md::GeoidModel *)[v5 undulationModel];

    if (v6)
    {
      unint64_t Undulation = md::GeoidModel::getUndulation(v6, *a3, a3[1]);
      double v8 = *(float *)&Undulation;
      if (!HIDWORD(Undulation)) {
        double v8 = 0.0;
      }
      double result = v8 + a3[2];
      a3[2] = result;
    }
  }
  return result;
}

- (uint64_t)routeRequiresElevationCorrection
{
  if ([a1 elevationModel]) {
    return 0;
  }
  return [a1 shouldRequestWGS84Elevations];
}

- (uint64_t)shouldRequestWGS84Elevations
{
  objc_getAssociatedObject(a1, &-[GEOComposedRoute(VKExtras) shouldRequestWGS84Elevations]::singletonCachedValue);
  uint64_t v2 = (CachedShouldRequestWGS84Elevations *)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = v2;
  if (v2)
  {
    uint64_t v4 = [(CachedShouldRequestWGS84Elevations *)v2 value];
  }
  else
  {
    v5 = objc_alloc_init(CachedShouldRequestWGS84Elevations);
    objc_setAssociatedObject(a1, &-[GEOComposedRoute(VKExtras) shouldRequestWGS84Elevations]::singletonCachedValue, v5, (void *)0x301);
    uint64_t v4 = [(CachedShouldRequestWGS84Elevations *)v5 value];
    uint64_t v3 = v5;
  }

  return v4;
}

@end