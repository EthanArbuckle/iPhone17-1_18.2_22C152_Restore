@interface _HandoffActivityHandlingTask
- (void)performTask;
- (void)taskFinished:(id)a3;
@end

@implementation _HandoffActivityHandlingTask

- (void)performTask
{
  [(RichMapsActivityCreatingTaskImpl *)self taskStarted];
  v3 = [(UserActivityHandlingTask *)self userActivity];
  v4 = [v3 userInfo];

  v5 = [v4 objectForKeyedSubscript:@"bs"];
  if (v5)
  {
    v6 = [[MapsActivity alloc] initWithBzip2CompressedData:v5];
    v7 = v6;
    if (!v6)
    {
      v11 = sub_1000A930C();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v15 = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "_HandoffActivityHandlingTask no mapsActivity from data", v15, 2u);
      }

      [(RichMapsActivityCreatingTaskImpl *)self taskFailed];
      goto LABEL_17;
    }
    if ([(MapsActivity *)v6 hasDisplayOptions])
    {
      v8 = [(MapsActivity *)v7 displayOptions];
      if ([v8 hasCamera])
      {
        unsigned int v9 = 0;
      }
      else
      {
        v13 = [(MapsActivity *)v7 displayOptions];
        unsigned int v9 = [v13 hasCenterSpan] ^ 1;
      }
      v12 = objc_alloc_init(RestorationAction);
      if (!v9) {
        goto LABEL_16;
      }
    }
    else
    {
      v12 = objc_alloc_init(RestorationAction);
    }
    [(MapsAction *)v12 setUserLocationAccuracy:kCLLocationAccuracyBest];
LABEL_16:
    v14 = [[RichMapsActivity alloc] initWithMapsActivity:v7 mapsAction:v12];
    [(_HandoffActivityHandlingTask *)self taskFinished:v14];

LABEL_17:
    goto LABEL_18;
  }
  v10 = sub_1000A930C();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "_HandoffActivityHandlingTask no compressed data", buf, 2u);
  }

  [(RichMapsActivityCreatingTaskImpl *)self taskFailed];
LABEL_18:
}

- (void)taskFinished:(id)a3
{
  id v4 = a3;
  v5 = +[GEOAPSharedStateData sharedData];
  [v5 setMapLaunchIsHandoff:1];

  v6.receiver = self;
  v6.super_class = (Class)_HandoffActivityHandlingTask;
  [(UserActivityHandlingTask *)&v6 taskFinished:v4];
}

@end