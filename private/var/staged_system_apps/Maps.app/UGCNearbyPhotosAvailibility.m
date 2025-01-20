@interface UGCNearbyPhotosAvailibility
+ (id)fetchNearbyAssetsForMapItemCoordinate:(CLLocationCoordinate2D)a3 withOptions:(id)a4;
+ (void)hasTakenPhotosForMapItem:(id)a3 completion:(id)a4;
+ (void)numberOfPhotosTakenForMapItem:(id)a3 lastVisitedDate:(id)a4 completion:(id)a5;
@end

@implementation UGCNearbyPhotosAvailibility

+ (void)numberOfPhotosTakenForMapItem:(id)a3 lastVisitedDate:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    v11 = sub_100577714();
    v12 = sub_100577714();
    os_signpost_id_t v13 = os_signpost_id_generate(v12);

    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_EVENT, v13, "NumberOfPhotosTakenForMapItem", "", buf, 2u);
    }

    v14 = dispatch_queue_create("com.apple.maps.UGCNearbyPhotosAvailibility", 0);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1009F1E60;
    v15[3] = &unk_1012FA0A8;
    id v16 = v9;
    id v19 = a1;
    id v17 = v8;
    id v18 = v10;
    dispatch_async(v14, v15);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Assertion failed: completion != ((void *)0)", buf, 2u);
  }
}

+ (void)hasTakenPhotosForMapItem:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = dispatch_queue_create("com.apple.maps.UGCNearbyPhotosAvailibility", 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1009F2158;
  block[3] = &unk_1012EB5B8;
  id v12 = v6;
  id v13 = v7;
  id v14 = a1;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

+ (id)fetchNearbyAssetsForMapItemCoordinate:(CLLocationCoordinate2D)a3 withOptions:(id)a4
{
  double longitude = a3.longitude;
  double latitude = a3.latitude;
  id v6 = a4;
  uint64_t UInteger = GEOConfigGetUInteger();
  v17.double latitude = latitude;
  v17.double longitude = longitude;
  MKCoordinateRegion v18 = MKCoordinateRegionMakeWithDistance(v17, (double)(unint64_t)UInteger, (double)(unint64_t)UInteger);
  double latitudeDelta = v18.span.latitudeDelta;
  double longitudeDelta = v18.span.longitudeDelta;
  CLLocationCoordinate2D v10 = CLLocationCoordinate2DMake(latitude + v18.span.latitudeDelta, longitude - v18.span.longitudeDelta);
  CLLocationCoordinate2D v11 = CLLocationCoordinate2DMake(latitude - latitudeDelta, longitude + longitudeDelta);
  id v12 = [objc_alloc((Class)CLLocation) initWithLatitude:v10.latitude longitude:v10.longitude];
  id v13 = [objc_alloc((Class)CLLocation) initWithLatitude:v11.latitude longitude:v11.longitude];
  id v14 = +[PHAsset fetchAssetsInBoundingBoxWithTopLeftLocation:v12 bottomRightLocation:v13 options:v6];

  return v14;
}

@end