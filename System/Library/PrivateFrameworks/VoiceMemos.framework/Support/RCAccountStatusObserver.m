@interface RCAccountStatusObserver
- (RCAccountStatusDelegate)delegate;
- (RCAccountStatusObserver)init;
- (id)_cloudKitContainer;
- (int64_t)encryptedFieldsAccountStatus;
- (void)_checkAccountStatus;
- (void)_handleCKAccountChangedNotification:(id)a3;
- (void)_notifyDelegate;
- (void)setDelegate:(id)a3;
- (void)setEncryptedFieldsAccountStatus:(int64_t)a3;
- (void)startMonitoringAccountStatus;
@end

@implementation RCAccountStatusObserver

- (RCAccountStatusObserver)init
{
  v3.receiver = self;
  v3.super_class = (Class)RCAccountStatusObserver;
  result = [(RCAccountStatusObserver *)&v3 init];
  if (result) {
    result->_encryptedFieldsAccountStatus = 0;
  }
  return result;
}

- (id)_cloudKitContainer
{
  v2 = RCSavedRecordingsCloudKitContainerIdentifier();
  objc_super v3 = +[CKContainer containerWithIdentifier:v2];

  return v3;
}

- (void)startMonitoringAccountStatus
{
  if (!self->_isObservingAccountChanges)
  {
    self->_isObservingAccountChanges = 1;
    objc_super v3 = OSLogForCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315138;
      v6 = "-[RCAccountStatusObserver startMonitoringAccountStatus]";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s -- Registering for CKAccountChangedNotification", (uint8_t *)&v5, 0xCu);
    }

    v4 = +[NSNotificationCenter defaultCenter];
    [v4 addObserver:self selector:"_handleCKAccountChangedNotification:" name:CKAccountChangedNotification object:0];

    [(RCAccountStatusObserver *)self _checkAccountStatus];
  }
}

- (void)_handleCKAccountChangedNotification:(id)a3
{
  id v4 = a3;
  int v5 = OSLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    v7 = "-[RCAccountStatusObserver _handleCKAccountChangedNotification:]";
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s -- notification received %@", (uint8_t *)&v6, 0x16u);
  }

  [(RCAccountStatusObserver *)self _checkAccountStatus];
}

- (void)_checkAccountStatus
{
  objc_super v3 = [(RCAccountStatusObserver *)self _cloudKitContainer];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10001FC74;
  v4[3] = &unk_1000398B0;
  v4[4] = self;
  [v3 accountInfoWithCompletionHandler:v4];
}

- (void)_notifyDelegate
{
  objc_super v3 = [(RCAccountStatusObserver *)self delegate];
  if (v3)
  {
    id v4 = v3;
    [v3 accountStatusUpdated:self];
    objc_super v3 = v4;
  }
}

- (int64_t)encryptedFieldsAccountStatus
{
  return self->_encryptedFieldsAccountStatus;
}

- (void)setEncryptedFieldsAccountStatus:(int64_t)a3
{
  self->_encryptedFieldsAccountStatus = a3;
}

- (RCAccountStatusDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (RCAccountStatusDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end