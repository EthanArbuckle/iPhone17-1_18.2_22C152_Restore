@interface MusicAnalyticsGreenTeaLogger
- (MusicAnalyticsGreenTeaLogger)init;
- (ct_green_tea_logger_s)logger;
- (void)dealloc;
- (void)logCameraAccess;
- (void)logPhotoAccess;
@end

@implementation MusicAnalyticsGreenTeaLogger

- (MusicAnalyticsGreenTeaLogger)init
{
  v4.receiver = self;
  v4.super_class = (Class)MusicAnalyticsGreenTeaLogger;
  v2 = [(MusicAnalyticsGreenTeaLogger *)&v4 init];
  if (v2) {
    v2->_logger = (ct_green_tea_logger_s *)ct_green_tea_logger_create();
  }
  return v2;
}

- (void)dealloc
{
  ct_green_tea_logger_destroy();
  v3.receiver = self;
  v3.super_class = (Class)MusicAnalyticsGreenTeaLogger;
  [(MusicAnalyticsGreenTeaLogger *)&v3 dealloc];
}

- (void)logCameraAccess
{
  [(MusicAnalyticsGreenTeaLogger *)self logger];
  v2 = getCTGreenTeaOsLogHandle();
  objc_super v3 = v2;
  if (v2 && os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)objc_super v4 = 0;
    _os_log_impl(&def_3B9D84, v3, OS_LOG_TYPE_INFO, "Accessing camera", v4, 2u);
  }
}

- (void)logPhotoAccess
{
  [(MusicAnalyticsGreenTeaLogger *)self logger];
  v2 = getCTGreenTeaOsLogHandle();
  objc_super v3 = v2;
  if (v2 && os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)objc_super v4 = 0;
    _os_log_impl(&def_3B9D84, v3, OS_LOG_TYPE_INFO, "Accessing photos", v4, 2u);
  }
}

- (ct_green_tea_logger_s)logger
{
  return self->_logger;
}

@end