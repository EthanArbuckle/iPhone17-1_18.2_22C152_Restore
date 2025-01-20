@interface DefaultTransportTypeFinder
- (DefaultTransportTypeFinder)initWithMapTypeSource:(id)a3;
- (MapTypeSource)mapTypeSource;
- (int)geoIdealTransportTypeForCoordinates:(CLLocationCoordinate2D *)a3 count:(unint64_t)a4 ignoreMapType:(BOOL)a5;
- (int)geoIdealTransportTypeForOrigin:(CLLocationCoordinate2D)a3 destination:(CLLocationCoordinate2D)a4 ignoreMapType:(BOOL)a5;
- (void)findDirectionsTypeForOriginCoordinate:(CLLocationCoordinate2D)a3 destinationCoordinate:(CLLocationCoordinate2D)a4 handler:(id)a5;
- (void)mkDirectionsTypeForOrigin:(CLLocationCoordinate2D)a3 destination:(CLLocationCoordinate2D)a4 ignoreMapType:(BOOL)a5 completion:(id)a6;
- (void)transportTypeForCoordinates:(CLLocationCoordinate2D *)a3 count:(unint64_t)a4 ignoreMapType:(BOOL)a5 completion:(id)a6;
- (void)transportTypeForDirectionItem:(id)a3 ignoreMapType:(BOOL)a4 completion:(id)a5;
- (void)transportTypeForOrigin:(CLLocationCoordinate2D)a3 destination:(CLLocationCoordinate2D)a4 ignoreMapType:(BOOL)a5 completion:(id)a6;
@end

@implementation DefaultTransportTypeFinder

- (void)transportTypeForDirectionItem:(id)a3 ignoreMapType:(BOOL)a4 completion:(id)a5
{
  BOOL v21 = a4;
  v20 = self;
  id v6 = a5;
  v7 = [a3 items];
  id v8 = [v7 count];
  v9 = (char *)v8;
  v10 = &v19 - 2 * (void)v8;
  if (v8)
  {
    v11 = 0;
    v12 = (CLLocationCoordinate2D *)(&v19 - 2 * (void)v8);
    do
    {
      v13 = [v7 objectAtIndexedSubscript:v11];
      v14 = [v13 waypoint];
      [v14 coordinate];
      if (v14 && (CLLocationDegrees v17 = v15, v18 = v16, CLLocationCoordinate2DIsValid(*(CLLocationCoordinate2D *)&v15)))
      {
        v12->latitude = v17;
        v12->longitude = v18;
      }
      else
      {
        CLLocationCoordinate2D *v12 = kCLLocationCoordinate2DInvalid;
      }

      ++v11;
      ++v12;
    }
    while (v9 != v11);
  }
  [(DefaultTransportTypeFinder *)v20 transportTypeForCoordinates:v10 count:v9 ignoreMapType:v21 completion:v6];
}

- (DefaultTransportTypeFinder)initWithMapTypeSource:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)DefaultTransportTypeFinder;
  v5 = [(DefaultTransportTypeFinder *)&v12 init];
  id v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_mapTypeSource, v4);
    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v8 = dispatch_queue_create("transportTypeFinderQueue", v7);
    transportTypeFinderQueue = v6->_transportTypeFinderQueue;
    v6->_transportTypeFinderQueue = (OS_dispatch_queue *)v8;

    v10 = v6;
  }

  return v6;
}

- (int)geoIdealTransportTypeForOrigin:(CLLocationCoordinate2D)a3 destination:(CLLocationCoordinate2D)a4 ignoreMapType:(BOOL)a5
{
  v6[0] = a3;
  v6[1] = a4;
  return [(DefaultTransportTypeFinder *)self geoIdealTransportTypeForCoordinates:v6 count:2 ignoreMapType:a5];
}

- (int)geoIdealTransportTypeForCoordinates:(CLLocationCoordinate2D *)a3 count:(unint64_t)a4 ignoreMapType:(BOOL)a5
{
  if (a5)
  {
    id v7 = 0;
  }
  else
  {
    dispatch_queue_t v8 = [(DefaultTransportTypeFinder *)self mapTypeSource];
    id v7 = [v8 displayedMapType];
  }
  *(void *)&double v9 = __chkstk_darwin(self).n128_u64[0];
  if (a4)
  {
    p_longitude = &a3->longitude;
    v11 = (CLLocationDegrees *)(&v16 - 2 * a4);
    unint64_t v12 = a4;
    do
    {
      CLLocationDegrees v13 = *(p_longitude - 1);
      CLLocationDegrees v14 = *p_longitude;
      v17.latitude = v13;
      v17.longitude = *p_longitude;
      if (CLLocationCoordinate2DIsValid(v17))
      {
        CLLocationDegrees *v11 = v13;
        v11[1] = v14;
      }
      else
      {
        double v9 = -180.0;
        *(_OWORD *)v11 = xmmword_100F73C00;
      }
      v11 += 2;
      p_longitude += 2;
      --v12;
    }
    while (v12);
  }
  +[GEOIdealTransportTypeFinder idealTransportTypeForCoordinates:count:mapType:](GEOIdealTransportTypeFinder, "idealTransportTypeForCoordinates:count:mapType:", &v16 - 2 * a4, a4, v7, v9);
  return GEOTransportTypeFromGEOTransportTypePreference();
}

- (void)mkDirectionsTypeForOrigin:(CLLocationCoordinate2D)a3 destination:(CLLocationCoordinate2D)a4 ignoreMapType:(BOOL)a5 completion:(id)a6
{
  BOOL v6 = a5;
  double longitude = a4.longitude;
  double latitude = a4.latitude;
  double v9 = a3.longitude;
  double v10 = a3.latitude;
  id v12 = a6;
  CLLocationDegrees v13 = v12;
  if (v12)
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100C62DAC;
    v14[3] = &unk_1013149E8;
    id v15 = v12;
    -[DefaultTransportTypeFinder transportTypeForOrigin:destination:ignoreMapType:completion:](self, "transportTypeForOrigin:destination:ignoreMapType:completion:", v6, v14, v10, v9, latitude, longitude);
  }
}

- (void)transportTypeForOrigin:(CLLocationCoordinate2D)a3 destination:(CLLocationCoordinate2D)a4 ignoreMapType:(BOOL)a5 completion:(id)a6
{
  v6[0] = a3;
  v6[1] = a4;
  [(DefaultTransportTypeFinder *)self transportTypeForCoordinates:v6 count:2 ignoreMapType:a5 completion:a6];
}

- (void)transportTypeForCoordinates:(CLLocationCoordinate2D *)a3 count:(unint64_t)a4 ignoreMapType:(BOOL)a5 completion:(id)a6
{
  BOOL v6 = a5;
  id v10 = a6;
  v11 = v10;
  if (v10)
  {
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472;
    v41[2] = sub_100C63274;
    v41[3] = &unk_10131CBC8;
    v42 = v10;
    id v12 = objc_retainBlock(v41);
    CLLocationDegrees v13 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "Will determine transport type...", buf, 2u);
    }

    CLLocationDegrees v14 = &kCLLocationCoordinate2DInvalid;
    if (a4) {
      id v15 = a3;
    }
    else {
      id v15 = (CLLocationCoordinate2D *)&kCLLocationCoordinate2DInvalid;
    }
    CLLocationDegrees latitude = v15->latitude;
    CLLocationDegrees longitude = v15->longitude;
    if (a4) {
      CLLocationDegrees v14 = &a3[a4 - 1];
    }
    CLLocationDegrees v18 = v14->latitude;
    CLLocationDegrees v19 = v14->longitude;
    BOOL v20 = CLLocationCoordinate2DIsValid(*v15);
    v47.CLLocationDegrees latitude = v18;
    v47.CLLocationDegrees longitude = v19;
    BOOL v21 = CLLocationCoordinate2DIsValid(v47);
    BOOL v22 = v21;
    if (v20 && v21)
    {
      uint64_t v23 = [(DefaultTransportTypeFinder *)self geoIdealTransportTypeForCoordinates:a3 count:a4 ignoreMapType:v6];
      GEOFindOrCreateLog();
      v24 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
        if (v23 >= 7)
        {
          v25 = +[NSString stringWithFormat:@"(unknown: %i)", v23];
        }
        else
        {
          v25 = off_10131CC48[(int)v23];
        }
        *(_DWORD *)buf = 138543362;
        v44 = v25;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "\tFetched Geo ideal default transport mode %{public}@", buf, 0xCu);
      }
      v30 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEBUG, "\tWill fetch MSg default transport mode", buf, 2u);
      }

      uint64_t v31 = objc_opt_class();
      transportTypeFinderQueue = self->_transportTypeFinderQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100C63438;
      block[3] = &unk_10131CBF0;
      CLLocationDegrees v35 = latitude;
      CLLocationDegrees v36 = longitude;
      CLLocationDegrees v37 = v18;
      CLLocationDegrees v38 = v19;
      int v40 = v23;
      uint64_t v39 = v31;
      v34 = v12;
      dispatch_async(transportTypeFinderQueue, block);
    }
    else
    {
      v27 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      {
        v28 = "invalid";
        if (v20) {
          v29 = "valid";
        }
        else {
          v29 = "invalid";
        }
        if (v22) {
          v28 = "valid";
        }
        *(_DWORD *)buf = 136315394;
        v44 = (void *)v29;
        __int16 v45 = 2080;
        v46 = v28;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEBUG, "\tWill return Undefined transport type for invalid origin (%s) or destination (%s)", buf, 0x16u);
      }

      ((void (*)(void *, uint64_t))v12[2])(v12, 4);
    }

    v26 = v42;
  }
  else
  {
    v26 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "Completion block missing for async transport type finder", buf, 2u);
    }
  }
}

- (void)findDirectionsTypeForOriginCoordinate:(CLLocationCoordinate2D)a3 destinationCoordinate:(CLLocationCoordinate2D)a4 handler:(id)a5
{
  double longitude = a4.longitude;
  double latitude = a4.latitude;
  double v7 = a3.longitude;
  double v8 = a3.latitude;
  id v10 = a5;
  v11 = v10;
  if (v10)
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100C63730;
    v12[3] = &unk_1012F4A20;
    id v13 = v10;
    -[DefaultTransportTypeFinder mkDirectionsTypeForOrigin:destination:ignoreMapType:completion:](self, "mkDirectionsTypeForOrigin:destination:ignoreMapType:completion:", 0, v12, v8, v7, latitude, longitude);
  }
}

- (MapTypeSource)mapTypeSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mapTypeSource);

  return (MapTypeSource *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_mapTypeSource);

  objc_storeStrong((id *)&self->_transportTypeFinderQueue, 0);
}

@end