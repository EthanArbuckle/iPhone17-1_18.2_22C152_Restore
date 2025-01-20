@interface CustomLocationManager
+ (id)sharedManager;
- (CustomLocationManager)init;
- (void)dealloc;
- (void)processSearchResult:(id)a3 traits:(id)a4;
@end

@implementation CustomLocationManager

+ (id)sharedManager
{
  v2 = (void *)qword_10160EEB8;
  if (!qword_10160EEB8)
  {
    v3 = objc_alloc_init(CustomLocationManager);
    v4 = (void *)qword_10160EEB8;
    qword_10160EEB8 = (uint64_t)v3;

    v2 = (void *)qword_10160EEB8;
  }

  return v2;
}

- (CustomLocationManager)init
{
  v4.receiver = self;
  v4.super_class = (Class)CustomLocationManager;
  v2 = [(CustomLocationManager *)&v4 init];
  if (v2) {
    v2->_reverseGeocodeRequestsForSearchResults = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  }
  return v2;
}

- (void)dealloc
{
  CFRelease(self->_reverseGeocodeRequestsForSearchResults);
  v3.receiver = self;
  v3.super_class = (Class)CustomLocationManager;
  [(CustomLocationManager *)&v3 dealloc];
}

- (void)processSearchResult:(id)a3 traits:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6
    && [v6 needsReverseGeocodeCheck]
    && !CFDictionaryGetValue(self->_reverseGeocodeRequestsForSearchResults, v6))
  {
    if (!v7)
    {
      v8 = +[UIApplication sharedMapsDelegate];
      v9 = [v8 chromeViewController];
      id v7 = [v9 currentTraits];
    }
    [v6 setHasIncompleteNavData:1];
    v25[0] = 0;
    v25[1] = v25;
    v25[2] = 0x3032000000;
    v25[3] = sub_100103C6C;
    v25[4] = sub_1001046C0;
    id v26 = 0;
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_1004E2854;
    v24[3] = &unk_1012E83B0;
    v24[4] = v25;
    v10 = objc_retainBlock(v24);
    if ([v6 hasFloorOrdinal])
    {
      v11 = +[MKMapService sharedService];
      [v6 coordinate];
      uint64_t v14 = objc_msgSend(v11, "ticketForReverseGeocodeDroppedPinCoordinate:floorOrdinal:traits:", objc_msgSend(v6, "floorOrdinal"), v7, v12, v13);
    }
    else
    {
      if ([v6 isDynamicCurrentLocation])
      {
        v11 = +[MKMapService sharedService];
        v15 = +[MKLocationManager sharedLocationManager];
        v16 = [v15 lastLocation];
        v17 = [v11 ticketForReverseGeocodeLocation:v16 traits:v7];

LABEL_12:
        v20[0] = _NSConcreteStackBlock;
        v20[1] = 3221225472;
        v20[2] = sub_1004E28F0;
        v20[3] = &unk_1012ECF50;
        id v18 = v17;
        id v21 = v18;
        id v19 = v6;
        id v22 = v19;
        v23 = self;
        [v18 submitWithHandler:v20 networkActivity:v10];
        CFDictionarySetValue(self->_reverseGeocodeRequestsForSearchResults, v19, v18);

        _Block_object_dispose(v25, 8);
        goto LABEL_13;
      }
      v11 = +[MKMapService sharedService];
      [v6 coordinate];
      uint64_t v14 = [v11 ticketForReverseGeocodeDroppedPinCoordinate:v7];
    }
    v17 = (void *)v14;
    goto LABEL_12;
  }
LABEL_13:
}

@end