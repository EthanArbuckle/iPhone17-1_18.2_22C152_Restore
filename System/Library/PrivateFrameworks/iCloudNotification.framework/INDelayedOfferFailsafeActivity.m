@interface INDelayedOfferFailsafeActivity
- (INDelayedOfferFailsafeActivity)init;
- (void)onDelayElapsedDisplayDelayedNotification;
- (void)startActivityWithDelaySecs:(int64_t)a3;
- (void)stopActivity;
@end

@implementation INDelayedOfferFailsafeActivity

- (INDelayedOfferFailsafeActivity)init
{
  v7.receiver = self;
  v7.super_class = (Class)INDelayedOfferFailsafeActivity;
  v2 = [(INDelayedOfferFailsafeActivity *)&v7 init];
  if (v2)
  {
    v3 = [[INActivity alloc] initWithTarget:v2 action:"onDelayElapsedDisplayDelayedNotification"];
    failsafeActivity = v2->_failsafeActivity;
    v2->_failsafeActivity = v3;

    [(INActivity *)v2->_failsafeActivity setActivityID:off_10004E0F8];
    [(INActivity *)v2->_failsafeActivity setActivityNextFireDateKey:INNextDelayedOfferFailsafeDateKey];
    [(INActivity *)v2->_failsafeActivity setIsRepeating:0];
    [(INActivity *)v2->_failsafeActivity checkIn];
    v5 = _INLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v9 = off_10004E0F8;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Delayed offer failsafe activity has just checked in. ID=[%s]", buf, 0xCu);
    }
  }
  return v2;
}

- (void)startActivityWithDelaySecs:(int64_t)a3
{
  int64_t v3 = a3;
  if (a3 <= 899)
  {
    v5 = _INLogSystem();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = 900;
      goto LABEL_9;
    }
    *(_DWORD *)v12 = 134218240;
    *(void *)&v12[4] = v3;
    *(_WORD *)&v12[12] = 2048;
    uint64_t v6 = 900;
    *(void *)&v12[14] = 900;
    objc_super v7 = "Argument delaySecs=[%lld] in too small. Using kMinDelaySecs=[%lld] instead.";
    goto LABEL_7;
  }
  uint64_t v6 = 604800;
  if ((unint64_t)a3 <= 0x93A80) {
    goto LABEL_10;
  }
  v5 = _INLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v12 = 134218240;
    *(void *)&v12[4] = v3;
    *(_WORD *)&v12[12] = 2048;
    *(void *)&v12[14] = 604800;
    objc_super v7 = "Argument delaySecs=[%lld] in too big. Using kMaxDelaySecs=[%lld] instead.";
LABEL_7:
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, v7, v12, 0x16u);
  }
LABEL_9:

  int64_t v3 = v6;
LABEL_10:
  v8 = +[NSDate now];
  v9 = [v8 dateByAddingTimeInterval:(double)v3];

  v10 = _INLogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    [v9 timeIntervalSince1970];
    *(_DWORD *)v12 = 134218240;
    *(void *)&v12[4] = v3;
    *(_WORD *)&v12[12] = 2048;
    *(void *)&v12[14] = (uint64_t)v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Starting the failsafe activity for a delay of [%lld secs]. Final TimeStampSecs=[%lld].", v12, 0x16u);
  }

  [(INActivity *)self->_failsafeActivity setNextActivityDate:v9];
}

- (void)stopActivity
{
  int64_t v3 = _INLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "The delayed offer failsafe activity has now be stopped.", v4, 2u);
  }

  [(INActivity *)self->_failsafeActivity stop];
}

- (void)onDelayElapsedDisplayDelayedNotification
{
  int64_t v3 = _INLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[SUBD] The delayed offer failsafe has triggered.", v6, 2u);
  }

  [(INActivity *)self->_failsafeActivity stop];
  v4 = +[ICQDaemonOfferManager sharedDaemonOfferManager];
  [v4 displayDelayedOfferWithContext:&stru_1000438D8 completion:&stru_1000418B0];
  v5 = +[ISOQuotaClient shared];
  [v5 clearNotificationState:&stru_1000418D0];
}

- (void).cxx_destruct
{
}

@end