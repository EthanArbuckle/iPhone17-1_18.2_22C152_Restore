@interface RCRegulatoryLogger
- (RCRegulatoryLogger)init;
- (ct_green_tea_logger_s)logger;
- (void)dealloc;
- (void)readingAudioData;
- (void)transmittingAudioData;
@end

@implementation RCRegulatoryLogger

- (RCRegulatoryLogger)init
{
  v4.receiver = self;
  v4.super_class = (Class)RCRegulatoryLogger;
  v2 = [(RCRegulatoryLogger *)&v4 init];
  if (v2) {
    v2->_logger = (ct_green_tea_logger_s *)ct_green_tea_logger_create();
  }
  return v2;
}

- (void)dealloc
{
  ct_green_tea_logger_destroy();
  v3.receiver = self;
  v3.super_class = (Class)RCRegulatoryLogger;
  [(RCRegulatoryLogger *)&v3 dealloc];
}

- (void)readingAudioData
{
  [(RCRegulatoryLogger *)self logger];
  v2 = getCTGreenTeaOsLogHandle();
  objc_super v3 = v2;
  if (v2 && os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)objc_super v4 = 0;
    _os_log_impl(&dword_1C3964000, v3, OS_LOG_TYPE_INFO, "Reading some audio data", v4, 2u);
  }
}

- (void)transmittingAudioData
{
  [(RCRegulatoryLogger *)self logger];
  v2 = getCTGreenTeaOsLogHandle();
  objc_super v3 = v2;
  if (v2 && os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)objc_super v4 = 0;
    _os_log_impl(&dword_1C3964000, v3, OS_LOG_TYPE_INFO, "Transmitting some audio data", v4, 2u);
  }
}

- (ct_green_tea_logger_s)logger
{
  return self->_logger;
}

@end