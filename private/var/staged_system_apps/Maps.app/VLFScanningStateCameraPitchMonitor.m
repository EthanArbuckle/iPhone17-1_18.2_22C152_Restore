@interface VLFScanningStateCameraPitchMonitor
- (VLFScanningStateCameraPitchMonitor)initWithDelegate:(id)a3 session:(id)a4;
- (double)cameraPitchThreshold;
- (void)session:(id)a3 didUpdateFrame:(id)a4;
- (void)setCameraPitchThreshold:(double)a3;
@end

@implementation VLFScanningStateCameraPitchMonitor

- (VLFScanningStateCameraPitchMonitor)initWithDelegate:(id)a3 session:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)VLFScanningStateCameraPitchMonitor;
  v4 = [(VLFScanningStateMonitor *)&v9 initWithDelegate:a3 session:a4];
  if (v4)
  {
    GEOConfigGetDouble();
    v4->_double cameraPitchThreshold = v5 * 0.0174532925;
    v6 = sub_1006C141C();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      double cameraPitchThreshold = v4->_cameraPitchThreshold;
      *(_DWORD *)buf = 134217984;
      double v11 = cameraPitchThreshold;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Initialized with pitch threshold: %f", buf, 0xCu);
    }
  }
  return v4;
}

- (void)session:(id)a3 didUpdateFrame:(id)a4
{
  double v5 = [a4 camera:a3];
  [v5 eulerAngles];
  float v8 = v6;

  v7 = sub_1006C141C();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    double v12 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Got camera pitch: %f", buf, 0xCu);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1006C1598;
  block[3] = &unk_1012F05F8;
  float v10 = v8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (double)cameraPitchThreshold
{
  return self->_cameraPitchThreshold;
}

- (void)setCameraPitchThreshold:(double)a3
{
  self->_double cameraPitchThreshold = a3;
}

@end