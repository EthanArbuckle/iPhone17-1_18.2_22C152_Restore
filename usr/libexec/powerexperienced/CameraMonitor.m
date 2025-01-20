@interface CameraMonitor
+ (id)monitorWithQueue:(id)a3;
- (CameraMonitor)initWithQueue:(id)a3;
- (FigCameraViewfinder)viewFinder;
- (OS_dispatch_queue)queue;
- (OS_os_log)log;
- (ResourceHint)cameraResourceHint;
- (void)cameraViewfinder:(id)a3 viewfinderSessionDidBegin:(id)a4;
- (void)cameraViewfinder:(id)a3 viewfinderSessionDidEnd:(id)a4;
- (void)setCameraResourceHint:(id)a3;
- (void)setLog:(id)a3;
- (void)setQueue:(id)a3;
- (void)setViewFinder:(id)a3;
@end

@implementation CameraMonitor

+ (id)monitorWithQueue:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100009C68;
  block[3] = &unk_1000145C0;
  id v8 = a3;
  uint64_t v3 = qword_10001BEC0;
  id v4 = v8;
  if (v3 != -1) {
    dispatch_once(&qword_10001BEC0, block);
  }
  id v5 = (id)qword_10001BEC8;

  return v5;
}

- (CameraMonitor)initWithQueue:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CameraMonitor;
  v6 = [(CameraMonitor *)&v15 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_queue, a3);
    os_log_t v8 = os_log_create("com.apple.powerexperienced", "cameramonitor");
    log = v7->_log;
    v7->_log = (OS_os_log *)v8;

    uint64_t v10 = +[FigCameraViewfinder cameraViewfinder];
    viewFinder = v7->_viewFinder;
    v7->_viewFinder = (FigCameraViewfinder *)v10;

    [(FigCameraViewfinder *)v7->_viewFinder setDelegate:v7 queue:v7->_queue];
    [(FigCameraViewfinder *)v7->_viewFinder startWithOptions:0];
  }
  v12 = [(CameraMonitor *)v7 log];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Initialized camera monitor", v14, 2u);
  }

  return v7;
}

- (void)cameraViewfinder:(id)a3 viewfinderSessionDidBegin:(id)a4
{
  id v5 = [(CameraMonitor *)self log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)os_log_t v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Camera session started", v8, 2u);
  }

  v6 = [(CameraMonitor *)self cameraResourceHint];

  if (v6)
  {
    id v7 = [(CameraMonitor *)self cameraResourceHint];
    [v7 updateState:1];
  }
  else
  {
    id v7 = [objc_alloc((Class)ResourceHint) initWithResourceType:6 andState:1];
    [(CameraMonitor *)self setCameraResourceHint:v7];
  }
}

- (void)cameraViewfinder:(id)a3 viewfinderSessionDidEnd:(id)a4
{
  id v5 = [(CameraMonitor *)self log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)os_log_t v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Camera session ended", v8, 2u);
  }

  v6 = [(CameraMonitor *)self cameraResourceHint];

  if (v6)
  {
    id v7 = [(CameraMonitor *)self cameraResourceHint];
    [v7 updateState:0];
  }
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 8, 1);
}

- (void)setQueue:(id)a3
{
}

- (FigCameraViewfinder)viewFinder
{
  return (FigCameraViewfinder *)objc_getProperty(self, a2, 16, 1);
}

- (void)setViewFinder:(id)a3
{
}

- (ResourceHint)cameraResourceHint
{
  return (ResourceHint *)objc_getProperty(self, a2, 24, 1);
}

- (void)setCameraResourceHint:(id)a3
{
}

- (OS_os_log)log
{
  return (OS_os_log *)objc_getProperty(self, a2, 32, 1);
}

- (void)setLog:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_cameraResourceHint, 0);
  objc_storeStrong((id *)&self->_viewFinder, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end