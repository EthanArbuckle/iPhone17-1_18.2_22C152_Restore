@interface ARSessionDebugLogger
- (ARSession)session;
- (ARSessionDebugLogger)initWithSession:(id)a3;
- (void)dealloc;
- (void)session:(id)a3 cameraDidChangeTrackingState:(id)a4;
- (void)session:(id)a3 didChangeGeoTrackingStatus:(id)a4;
- (void)session:(id)a3 didChangeState:(unint64_t)a4;
- (void)session:(id)a3 didFailWithError:(id)a4;
- (void)session:(id)a3 didUpdateFrame:(id)a4;
- (void)session:(id)a3 requestedRunWithConfiguration:(id)a4 options:(unint64_t)a5;
- (void)session:(id)a3 willRunWithConfiguration:(id)a4;
- (void)sessionInterruptionEnded:(id)a3;
- (void)sessionWasInterrupted:(id)a3;
- (void)setSession:(id)a3;
@end

@implementation ARSessionDebugLogger

- (ARSessionDebugLogger)initWithSession:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ARSessionDebugLogger;
  v5 = [(ARSessionDebugLogger *)&v9 init];
  v6 = v5;
  if (v5)
  {
    id v7 = objc_storeWeak((id *)&v5->_session, v4);
    [v4 _addObserver:v6];
  }
  return v6;
}

- (void)dealloc
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_session);
  [WeakRetained _removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)ARSessionDebugLogger;
  [(ARSessionDebugLogger *)&v4 dealloc];
}

- (void)session:(id)a3 didChangeState:(unint64_t)a4
{
  id v5 = a3;
  v6 = sub_100680280();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    if (a4 >= 3)
    {
      id v7 = +[NSString stringWithFormat:@"%lu", a4];
    }
    else
    {
      id v7 = off_1012F3FF8[a4];
    }
    *(_DWORD *)buf = 136315650;
    objc_super v9 = "-[ARSessionDebugLogger session:didChangeState:]";
    __int16 v10 = 2112;
    id v11 = v5;
    __int16 v12 = 2112;
    v13 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s:%@:%@", buf, 0x20u);
  }
}

- (void)session:(id)a3 requestedRunWithConfiguration:(id)a4 options:(unint64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  __int16 v10 = sub_100680280();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
  if (isKindOfClass)
  {
    if (v11)
    {
      __int16 v12 = [v8 templateConfiguration];
      int v13 = 136316162;
      v14 = "-[ARSessionDebugLogger session:requestedRunWithConfiguration:options:]";
      __int16 v15 = 2112;
      id v16 = v7;
      __int16 v17 = 2112;
      id v18 = v8;
      __int16 v19 = 2112;
      unint64_t v20 = (unint64_t)v12;
      __int16 v21 = 2048;
      unint64_t v22 = a5;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s:%@:%@(%@)%lu", (uint8_t *)&v13, 0x34u);
    }
  }
  else if (v11)
  {
    int v13 = 136315906;
    v14 = "-[ARSessionDebugLogger session:requestedRunWithConfiguration:options:]";
    __int16 v15 = 2112;
    id v16 = v7;
    __int16 v17 = 2112;
    id v18 = v8;
    __int16 v19 = 2048;
    unint64_t v20 = a5;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s:%@:%@:%lu", (uint8_t *)&v13, 0x2Au);
  }
}

- (void)session:(id)a3 willRunWithConfiguration:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v8 = sub_100680280();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
  if (isKindOfClass)
  {
    if (v9)
    {
      __int16 v10 = [v6 templateConfiguration];
      int v11 = 136315906;
      __int16 v12 = "-[ARSessionDebugLogger session:willRunWithConfiguration:]";
      __int16 v13 = 2112;
      id v14 = v5;
      __int16 v15 = 2112;
      id v16 = v6;
      __int16 v17 = 2112;
      id v18 = v10;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s:%@:%@(%@)", (uint8_t *)&v11, 0x2Au);
    }
  }
  else if (v9)
  {
    int v11 = 136315650;
    __int16 v12 = "-[ARSessionDebugLogger session:willRunWithConfiguration:]";
    __int16 v13 = 2112;
    id v14 = v5;
    __int16 v15 = 2112;
    id v16 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s:%@:%@", (uint8_t *)&v11, 0x20u);
  }
}

- (void)session:(id)a3 didUpdateFrame:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v6 vlState];
  [v7 timeSinceLastLocalization];
  double v9 = v8;

  if (v9 > 0.0)
  {
    __int16 v10 = sub_100680280();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v11 = [v6 vlState];
      __int16 v12 = [v6 vlState];
      [v12 timeSinceLastLocalization];
      uint64_t v14 = v13;
      [v6 heading];
      uint64_t v16 = v15;
      __int16 v17 = [v6 location];
      [v6 rawHeading];
      uint64_t v19 = v18;
      unint64_t v20 = [v6 rawLocation];
      [v6 rawLocationTimestamp];
      int v22 = 136317442;
      v23 = "-[ARSessionDebugLogger session:didUpdateFrame:]";
      __int16 v24 = 2112;
      id v25 = v5;
      __int16 v26 = 2112;
      id v27 = v6;
      __int16 v28 = 2112;
      v29 = v11;
      __int16 v30 = 2048;
      uint64_t v31 = v14;
      __int16 v32 = 2048;
      uint64_t v33 = v16;
      __int16 v34 = 2112;
      v35 = v17;
      __int16 v36 = 2048;
      uint64_t v37 = v19;
      __int16 v38 = 2112;
      v39 = v20;
      __int16 v40 = 2048;
      uint64_t v41 = v21;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s:%@:%@:vlState=%@:timeSinceLastLocalization=%f:heading=%f:location=%@:rawHeading=%f:rawLocation=%@:rawLocationTimestamp=%f", (uint8_t *)&v22, 0x66u);
    }
  }
}

- (void)session:(id)a3 didFailWithError:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = sub_100680280();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    int v8 = 136315650;
    double v9 = "-[ARSessionDebugLogger session:didFailWithError:]";
    __int16 v10 = 2112;
    id v11 = v5;
    __int16 v12 = 2112;
    id v13 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%s:%@:%@", (uint8_t *)&v8, 0x20u);
  }
}

- (void)session:(id)a3 cameraDidChangeTrackingState:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = sub_100680280();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    unint64_t v8 = (unint64_t)[v6 trackingState];
    if (v8 >= 3)
    {
      double v9 = +[NSString stringWithFormat:@"%ld", v8];
    }
    else
    {
      double v9 = off_1012F4010[v8];
    }
    __int16 v10 = v9;
    unint64_t v11 = (unint64_t)[v6 trackingStateReason];
    if (v11 >= 5)
    {
      __int16 v12 = +[NSString stringWithFormat:@"%ld", v11];
    }
    else
    {
      __int16 v12 = off_1012F4028[v11];
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v14 = "-[ARSessionDebugLogger session:cameraDidChangeTrackingState:]";
    __int16 v15 = 2112;
    id v16 = v5;
    __int16 v17 = 2112;
    id v18 = v6;
    __int16 v19 = 2112;
    unint64_t v20 = v10;
    __int16 v21 = 2112;
    int v22 = v12;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s:%@:%@:state=%@:reason=%@", buf, 0x34u);
  }
}

- (void)sessionWasInterrupted:(id)a3
{
  id v3 = a3;
  objc_super v4 = sub_100680280();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v5 = 136315394;
    id v6 = "-[ARSessionDebugLogger sessionWasInterrupted:]";
    __int16 v7 = 2112;
    id v8 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s:%@", (uint8_t *)&v5, 0x16u);
  }
}

- (void)sessionInterruptionEnded:(id)a3
{
  id v3 = a3;
  objc_super v4 = sub_100680280();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v5 = 136315394;
    id v6 = "-[ARSessionDebugLogger sessionInterruptionEnded:]";
    __int16 v7 = 2112;
    id v8 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s:%@", (uint8_t *)&v5, 0x16u);
  }
}

- (void)session:(id)a3 didChangeGeoTrackingStatus:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  __int16 v7 = sub_100680280();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    [v6 state];
    id v8 = NSStringFromARGeoTrackingState();
    [v6 stateReason];
    double v9 = NSStringFromARGeoTrackingStateReason();
    [v6 accuracy];
    __int16 v10 = NSStringFromARGeoTrackingAccuracy();
    int v11 = 136316418;
    __int16 v12 = "-[ARSessionDebugLogger session:didChangeGeoTrackingStatus:]";
    __int16 v13 = 2112;
    id v14 = v5;
    __int16 v15 = 2112;
    id v16 = v6;
    __int16 v17 = 2112;
    id v18 = v8;
    __int16 v19 = 2112;
    unint64_t v20 = v9;
    __int16 v21 = 2112;
    int v22 = v10;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s:%@:%@:state=%@:reason=%@:accuracy=%@", (uint8_t *)&v11, 0x3Eu);
  }
}

- (ARSession)session
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_session);

  return (ARSession *)WeakRetained;
}

- (void)setSession:(id)a3
{
}

- (void).cxx_destruct
{
}

@end