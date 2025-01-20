@interface SiriNavStatusUpdater
- (MNNavigationService)navigationService;
- (SiriNavStatusUpdater)initWithNavigationService:(id)a3;
- (unint64_t)_currentStateFromService;
- (void)_updateSiriNavStatusForNewNavigationServiceState:(unint64_t)a3;
- (void)navigationService:(id)a3 didChangeFromState:(unint64_t)a4 toState:(unint64_t)a5;
@end

@implementation SiriNavStatusUpdater

- (void)_updateSiriNavStatusForNewNavigationServiceState:(unint64_t)a3
{
  if (a3 - 4 >= 3) {
    unint64_t v3 = 0;
  }
  else {
    unint64_t v3 = a3 - 3;
  }
  if (self->_lastSentValue != v3)
  {
    self->_lastSentValue = v3;
    v4 = sub_10000AF10();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int v6 = 134217984;
      unint64_t v7 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Sending to Siri navigation state: %lu", (uint8_t *)&v6, 0xCu);
    }

    v5 = +[AFPreferences sharedPreferences];
    [v5 setCurrentNavigationState:v3];
  }
}

- (SiriNavStatusUpdater)initWithNavigationService:(id)a3
{
  id v5 = a3;
  if (self)
  {
    objc_storeStrong((id *)&self->_navigationService, a3);
    unint64_t v6 = [(SiriNavStatusUpdater *)self _currentStateFromService];
    self->_lastSentValue = 4;
    unint64_t v7 = sub_10000AF10();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v9 = 134217984;
      unint64_t v10 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Starting Siri updater with navigation state: %lu", (uint8_t *)&v9, 0xCu);
    }

    [(SiriNavStatusUpdater *)self _updateSiriNavStatusForNewNavigationServiceState:v6];
    [(MNNavigationService *)self->_navigationService registerObserver:self];
  }

  return self;
}

- (unint64_t)_currentStateFromService
{
  return (unint64_t)[(MNNavigationService *)self->_navigationService state];
}

- (void)navigationService:(id)a3 didChangeFromState:(unint64_t)a4 toState:(unint64_t)a5
{
}

- (MNNavigationService)navigationService
{
  return self->_navigationService;
}

- (void).cxx_destruct
{
}

@end