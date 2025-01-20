@interface OSIMediaPlaybackMonitor
- (BOOL)hasPlaybackStateChangeRecently:(double)a3;
- (BOOL)isEventNextSongPlaying:(id)a3 fromPreviousEvent:(id)a4;
- (double)playbackDurationOverDuration:(double)a3 currentlyPlaying:(BOOL *)a4;
@end

@implementation OSIMediaPlaybackMonitor

- (double)playbackDurationOverDuration:(double)a3 currentlyPlaying:(BOOL *)a4
{
  v6 = (void *)os_transaction_create();
  double Current = CFAbsoluteTimeGetCurrent();
  uint64_t v43 = 0;
  v44 = (double *)&v43;
  uint64_t v45 = 0x2020000000;
  uint64_t v46 = 0;
  uint64_t v37 = 0;
  v38 = &v37;
  uint64_t v39 = 0x3032000000;
  v40 = sub_100017434;
  v41 = sub_100017444;
  id v42 = 0;
  uint64_t v33 = 0;
  v34 = &v33;
  uint64_t v35 = 0x2020000000;
  char v36 = 0;
  os_log_t v9 = os_log_create("com.apple.osintelligence", "inactivity.playbackmonitor");
  id v10 = objc_alloc((Class)BMPublisherOptions);
  v11 = +[NSDate dateWithTimeIntervalSinceNow:a3 * -20.0];
  v12 = +[NSDate distantFuture];
  id v13 = [v10 initWithStartDate:v11 endDate:v12 maxEvents:0 lastN:0 reversed:0];

  v14 = BiomeLibrary();
  v15 = [v14 Media];
  v16 = [v15 NowPlaying];
  v17 = [v16 publisherWithOptions:v13];
  double v18 = Current - a3;
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_100017450;
  v27[3] = &unk_100064D18;
  v29 = &v37;
  v30 = &v33;
  v19 = v9;
  double v32 = v18;
  v28 = v19;
  v31 = &v43;
  id v20 = [v17 sinkWithCompletion:&stru_100064CF0 receiveInput:v27];

  if (a4) {
    *a4 = *((unsigned char *)v34 + 24);
  }
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    int v21 = *((unsigned __int8 *)v34 + 24);
    *(_DWORD *)buf = 67109120;
    LODWORD(v48) = v21;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Currently playing: %u\n\n\n", buf, 8u);
  }
  if (*((unsigned char *)v34 + 24))
  {
    [(id)v38[5] timestamp];
    if (v22 >= v18)
    {
      [(id)v38[5] timestamp];
      double v18 = v23;
    }
    v44[3] = Current - v18 + v44[3];
  }
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    double v24 = v44[3] / 60.0;
    *(_DWORD *)buf = 134217984;
    double v48 = v24;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Total playback duration: %.0lfm", buf, 0xCu);
  }
  double v25 = v44[3];

  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v37, 8);

  _Block_object_dispose(&v43, 8);

  return v25;
}

- (BOOL)hasPlaybackStateChangeRecently:(double)a3
{
  v5 = (void *)os_transaction_create();
  CFAbsoluteTimeGetCurrent();
  uint64_t v23 = 0;
  double v24 = &v23;
  uint64_t v25 = 0x2020000000;
  uint64_t v26 = 0;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3032000000;
  v21[3] = sub_100017434;
  v21[4] = sub_100017444;
  id v22 = 0;
  v7 = os_log_create("com.apple.osintelligence", "inactivity.playbackmonitor");
  id v8 = objc_alloc((Class)BMPublisherOptions);
  os_log_t v9 = +[NSDate dateWithTimeIntervalSinceNow:-a3];
  id v10 = +[NSDate distantFuture];
  id v11 = [v8 initWithStartDate:v9 endDate:v10 maxEvents:0 lastN:0 reversed:0];

  v12 = BiomeLibrary();
  id v13 = [v12 Media];
  v14 = [v13 NowPlaying];
  v15 = [v14 publisherWithOptions:v11];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100017920;
  v20[3] = &unk_100064D60;
  v20[4] = self;
  v20[5] = v21;
  v20[6] = &v23;
  id v16 = [v15 sinkWithCompletion:&stru_100064D38 receiveInput:v20];

  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v17 = v24[3];
    *(_DWORD *)buf = 134218240;
    uint64_t v28 = v17;
    __int16 v29 = 2048;
    double v30 = a3 / 60.0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Counted %ld unique play/pause state(s) in the last %.1f minutes", buf, 0x16u);
  }
  BOOL v18 = v24[3] > 0;

  _Block_object_dispose(v21, 8);
  _Block_object_dispose(&v23, 8);

  return v18;
}

- (BOOL)isEventNextSongPlaying:(id)a3 fromPreviousEvent:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 playbackState];
  BOOL v8 = 0;
  if (v6 && v7 == (id)1)
  {
    if ([v6 playbackState] == (id)3)
    {
      [v5 absoluteTimestamp];
      double v10 = v9;
      [v6 absoluteTimestamp];
      BOOL v8 = v10 - v11 < 0.01;
    }
    else
    {
      BOOL v8 = 0;
    }
  }

  return v8;
}

@end