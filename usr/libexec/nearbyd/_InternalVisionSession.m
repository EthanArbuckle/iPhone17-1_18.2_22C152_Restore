@interface _InternalVisionSession
+ (id)sharedInstance;
- (id)_initInternal;
- (void)_handleARSessionDidUpdateFrame:(id)a3;
- (void)_setUpARSession;
- (void)_tearDownARSession;
- (void)registerObserver:(id)a3 withIdentifier:(id)a4;
- (void)session:(id)a3 didChangeState:(unint64_t)a4;
- (void)session:(id)a3 didFailWithError:(id)a4;
- (void)session:(id)a3 didUpdateFrame:(id)a4;
- (void)sessionInterruptionEnded:(id)a3;
- (void)sessionShouldAttemptRelocalization:(id)a3 completion:(id)a4;
- (void)sessionWasInterrupted:(id)a3;
- (void)unregisterObserverWithIdentifier:(id)a3;
@end

@implementation _InternalVisionSession

- (id)_initInternal
{
  v3 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#vision,_initInternal", buf, 2u);
  }
  v12.receiver = self;
  v12.super_class = (Class)_InternalVisionSession;
  v4 = [(_InternalVisionSession *)&v12 init];
  if (v4)
  {
    v5 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.nearbyd.vision", v5);
    queue = v4->_queue;
    v4->_queue = (OS_dispatch_queue *)v6;

    v8 = v4->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100222744;
    block[3] = &unk_1008473B0;
    v11 = v4;
    dispatch_sync(v8, block);
  }
  return v4;
}

+ (id)sharedInstance
{
  if (qword_1008A5778 != -1) {
    dispatch_once(&qword_1008A5778, &stru_10085AB38);
  }
  v2 = (void *)qword_1008A5770;

  return v2;
}

- (void)registerObserver:(id)a3 withIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002228F8;
  block[3] = &unk_100855EB0;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync((dispatch_queue_t)queue, block);
}

- (void)unregisterObserverWithIdentifier:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100222A98;
  v7[3] = &unk_100846588;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)queue, v7);
}

- (void)_setUpARSession
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v3 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#vision,Set up ARSession", v8, 2u);
  }
  if (!self->_arSession)
  {
    id v4 = (ARSession *)objc_opt_new();
    arSession = self->_arSession;
    self->_arSession = v4;

    [(ARSession *)self->_arSession setDelegateQueue:self->_queue];
    [(ARSession *)self->_arSession _addObserver:self];
    id v6 = self->_arSession;
    id v7 = objc_alloc_init((Class)ARWorldTrackingConfiguration);
    [(ARSession *)v6 runWithConfiguration:v7 options:1];
  }
}

- (void)_tearDownARSession
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v3 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#vision,Tear down ARSession", v6, 2u);
  }
  arSession = self->_arSession;
  if (arSession)
  {
    [(ARSession *)arSession pause];
    [(ARSession *)self->_arSession _removeObserver:self];
    v5 = self->_arSession;
    self->_arSession = 0;
  }
}

- (void)session:(id)a3 didUpdateFrame:(id)a4
{
  id v5 = a4;
  queue = self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100222DB0;
  v8[3] = &unk_100846588;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async((dispatch_queue_t)queue, v8);
}

- (void)sessionShouldAttemptRelocalization:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v7) {
    __assert_rtn("-[_InternalVisionSession sessionShouldAttemptRelocalization:completion:]", "NIServerVisionInternalSession.mm", 144, "completion");
  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100222EA4;
  block[3] = &unk_100856F48;
  id v11 = v7;
  id v9 = v7;
  dispatch_async((dispatch_queue_t)queue, block);
}

- (void)session:(id)a3 didFailWithError:(id)a4
{
  id v4 = a4;
  id v5 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_FAULT)) {
    sub_100421234((uint64_t)v4, v5);
  }
}

- (void)sessionWasInterrupted:(id)a3
{
  v3 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#vision,Session was interrupted", v4, 2u);
  }
}

- (void)sessionInterruptionEnded:(id)a3
{
  v3 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#vision,Session interrupted ended", v4, 2u);
  }
}

- (void)session:(id)a3 didChangeState:(unint64_t)a4
{
  int v4 = a4;
  id v5 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#vision,Session changed state: %d", (uint8_t *)v6, 8u);
  }
}

- (void)_handleARSessionDidUpdateFrame:(id)a3
{
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v6 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138477827;
    id v33 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "#vision,Updated ARFrame: %{private}@", buf, 0xCu);
  }
  id v7 = [v5 camera];
  unint64_t v8 = (unint64_t)[v7 trackingState];

  if (v8 != 2) {
    unint64_t v8 = v8 == 1;
  }
  id v9 = [v5 worldTrackingState];
  BOOL v10 = v9 == 0;

  if (v10)
  {
    id v14 = 0;
    id v12 = 0;
  }
  else
  {
    id v11 = [v5 worldTrackingState];
    id v12 = [v11 majorRelocalization];

    id v13 = [v5 worldTrackingState];
    id v14 = [v13 minorRelocalization];
  }
  v15 = [NIVisionInput alloc];
  [v5 timestamp];
  double v17 = v16;
  v18 = [v5 camera];
  [v18 transform];
  double v30 = v20;
  double v31 = v19;
  double v28 = v22;
  double v29 = v21;
  v23 = [v5 lightEstimate];
  if (v23)
  {
    v3 = [v5 lightEstimate];
    [v3 ambientIntensity];
    double v25 = v24;
  }
  else
  {
    double v25 = *(double *)&NIARLightEstimateNotAvailable;
  }
  v26 = -[NIVisionInput initWithTimestamp:devicePose:trackingState:lightEstimate:majorRelocalization:minorRelocalization:](v15, "initWithTimestamp:devicePose:trackingState:lightEstimate:majorRelocalization:minorRelocalization:", v8, v12, v14, v17, v31, v30, v29, v28, v25);
  if (v23) {

  }
  v27 = +[NIServerVisionDataDistributor sharedProvider];
  [v27 processVisionInput:v26];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_arSession, 0);
  objc_storeStrong((id *)&self->_observers, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end