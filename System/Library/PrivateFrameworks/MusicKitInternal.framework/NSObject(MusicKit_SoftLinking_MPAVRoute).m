@interface NSObject(MusicKit_SoftLinking_MPAVRoute)
- (id)_musicKit_self_avRoute;
- (id)musicKit_avRoute_routeName;
- (id)musicKit_avRoute_routeUID;
@end

@implementation NSObject(MusicKit_SoftLinking_MPAVRoute)

- (id)musicKit_avRoute_routeUID
{
  v1 = objc_msgSend(a1, "_musicKit_self_avRoute");
  v2 = [v1 routeUID];

  return v2;
}

- (id)_musicKit_self_avRoute
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2050000000;
  v2 = (void *)getMPAVRouteClass_softClass;
  uint64_t v10 = getMPAVRouteClass_softClass;
  if (!getMPAVRouteClass_softClass)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __getMPAVRouteClass_block_invoke;
    v6[3] = &unk_1E6D453B0;
    v6[4] = &v7;
    __getMPAVRouteClass_block_invoke((uint64_t)v6);
    v2 = (void *)v8[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v7, 8);
  if (objc_opt_isKindOfClass()) {
    id v4 = a1;
  }
  else {
    id v4 = 0;
  }
  return v4;
}

- (id)musicKit_avRoute_routeName
{
  v1 = objc_msgSend(a1, "_musicKit_self_avRoute");
  v2 = [v1 routeName];

  return v2;
}

@end