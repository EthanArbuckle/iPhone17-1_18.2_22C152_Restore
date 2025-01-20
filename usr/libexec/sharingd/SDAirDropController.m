@interface SDAirDropController
- (SDAirDropController)init;
- (SDAirDropControllerDelegate)delegate;
- (void)addObservers;
- (void)configureSettingsForAirDrop;
- (void)dealloc;
- (void)presentEnableRadiosAlertForBluetooth:(BOOL)a3 andWLAN:(BOOL)a4;
- (void)removeObservers;
- (void)setDelegate:(id)a3;
- (void)setProperty:(void *)a3 forKey:(id)a4;
- (void)setStatusAndNotify;
- (void)somethingChanged:(id)a3;
- (void)start;
- (void)stop;
@end

@implementation SDAirDropController

- (SDAirDropController)init
{
  v9.receiver = self;
  v9.super_class = (Class)SDAirDropController;
  v2 = [(SDAirDropController *)&v9 init];
  v3 = v2;
  if (v2)
  {
    v2->_started = 0;
    uint64_t v4 = objc_opt_new();
    properties = v3->_properties;
    v3->_properties = (NSMutableDictionary *)v4;

    uint64_t v6 = +[SDStatusMonitor sharedMonitor];
    monitor = v3->_monitor;
    v3->_monitor = (SDStatusMonitor *)v6;
  }
  return v3;
}

- (void)dealloc
{
  [(SDAirDropController *)self stop];
  v3.receiver = self;
  v3.super_class = (Class)SDAirDropController;
  [(SDAirDropController *)&v3 dealloc];
}

- (void)configureSettingsForAirDrop
{
  unsigned int v3 = [(SDStatusMonitor *)self->_monitor bluetoothEnabled];
  char v4 = v3;
  uint64_t v5 = v3 ^ 1;
  unsigned int v6 = [(SDStatusMonitor *)self->_monitor wirelessEnabled];
  char v7 = v6;
  uint64_t v8 = v6 ^ 1;
  if ((v5 & 1) != 0 || v8)
  {
    if ([(SDStatusMonitor *)self->_monitor deviceSupportsWAPI])
    {
      [(SDAirDropController *)self presentEnableRadiosAlertForBluetooth:v5 andWLAN:v8];
    }
    else
    {
      if ((v7 & 1) == 0) {
        [(SDStatusMonitor *)self->_monitor setWirelessEnabled:1];
      }
      if ((v4 & 1) == 0)
      {
        monitor = self->_monitor;
        [(SDStatusMonitor *)monitor setBluetoothEnabled:1];
      }
    }
  }
}

- (void)presentEnableRadiosAlertForBluetooth:(BOOL)a3 andWLAN:(BOOL)a4
{
  if (!self->_radiosUserNotification)
  {
    BOOL v4 = a4;
    char v7 = (SFUserAlert *)objc_opt_new();
    radiosUserNotification = self->_radiosUserNotification;
    self->_radiosUserNotification = v7;

    objc_super v9 = SFLocalizedStringForKey();
    [(SFUserAlert *)self->_radiosUserNotification setTitle:v9];

    if (a3 || v4)
    {
      v10 = SFLocalizedStringForKey();
      [(SFUserAlert *)self->_radiosUserNotification setMessage:v10];
    }
    v11 = SFLocalizedStringForKey();
    [(SFUserAlert *)self->_radiosUserNotification setDefaultButtonTitle:v11];

    v12 = SFLocalizedStringForKey();
    [(SFUserAlert *)self->_radiosUserNotification setAlternateButtonTitle:v12];

    id location = 0;
    objc_initWeak(&location, self->_radiosUserNotification);
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100237830;
    v17[3] = &unk_1008D1EF0;
    BOOL v19 = v4;
    BOOL v20 = a3;
    objc_copyWeak(&v18, &location);
    v17[4] = self;
    [(SFUserAlert *)self->_radiosUserNotification setResponseHandler:v17];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100237968;
    v15[3] = &unk_1008D1F18;
    objc_copyWeak(&v16, &location);
    v15[4] = self;
    [(SFUserAlert *)self->_radiosUserNotification setErrorHandler:v15];
    v13 = airdrop_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Asking user to enable radios", v14, 2u);
    }

    [(SFUserAlert *)self->_radiosUserNotification present];
    objc_destroyWeak(&v16);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
}

- (void)setProperty:(void *)a3 forKey:(id)a4
{
  id v6 = a4;
  properties = self->_properties;
  v12 = v6;
  if (a3)
  {
    [(NSMutableDictionary *)properties setObject:a3 forKeyedSubscript:v6];
    unsigned int v8 = [v12 isEqual:kSFOperationDiscoverableModeKey];
    objc_super v9 = v12;
    if (!v8) {
      goto LABEL_13;
    }
    if (CFEqual(a3, kSFOperationDiscoverableModeContactsOnly))
    {
      unsigned __int8 v10 = sub_100052B94();
      objc_super v9 = v12;
      if (v10) {
        goto LABEL_13;
      }
      unsigned __int8 v11 = sub_10005286C();
    }
    else
    {
      if (!CFEqual(a3, kSFOperationDiscoverableModeEveryone))
      {
LABEL_11:
        [(SDStatusMonitor *)self->_monitor setDiscoverableMode:a3];
        goto LABEL_12;
      }
      unsigned __int8 v11 = sub_100052B94();
    }
    objc_super v9 = v12;
    if (v11) {
      goto LABEL_13;
    }
    [(SDAirDropController *)self configureSettingsForAirDrop];
    goto LABEL_11;
  }
  [(NSMutableDictionary *)properties removeObjectForKey:v6];
LABEL_12:
  objc_super v9 = v12;
LABEL_13:
}

- (void)setStatusAndNotify
{
  [(NSMutableDictionary *)self->_properties setObject:&__kCFBooleanFalse forKeyedSubscript:kSFOperationLegacyDeviceKey];
  [(NSMutableDictionary *)self->_properties setObject:&__kCFBooleanFalse forKeyedSubscript:kSFOperationLegacyModeEnabledKey];
  [(NSMutableDictionary *)self->_properties setObject:&__kCFBooleanFalse forKeyedSubscript:kSFOperationLegacyModeSettableKey];
  unsigned int v3 = [(SDStatusMonitor *)self->_monitor discoverableMode];
  [(NSMutableDictionary *)self->_properties setObject:v3 forKeyedSubscript:kSFOperationDiscoverableModeKey];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100237C2C;
  block[3] = &unk_1008CA4B8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)somethingChanged:(id)a3
{
}

- (void)addObservers
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:self selector:"somethingChanged:" name:@"com.apple.sharingd.AppleIDAccountInfoChanged" object:0];
  [v3 addObserver:self selector:"somethingChanged:" name:@"com.apple.sharingd.AppleIDChanged" object:0];
  [v3 addObserver:self selector:"somethingChanged:" name:@"com.apple.sharingd.DiscoverableModeChanged" object:0];
}

- (void)removeObservers
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];
}

- (void)start
{
  if (!self->_started)
  {
    id v3 = (OS_os_transaction *)os_transaction_create();
    transaction = self->_transaction;
    self->_transaction = v3;

    self->_started = 1;
    [(SDAirDropController *)self addObservers];
    [(SDAirDropController *)self setStatusAndNotify];
  }
}

- (void)stop
{
  if (self->_started)
  {
    self->_started = 0;
    [(SDAirDropController *)self removeObservers];
    transaction = self->_transaction;
    self->_transaction = 0;
  }
}

- (SDAirDropControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SDAirDropControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_radiosUserNotification, 0);
  objc_storeStrong((id *)&self->_phUserNotification, 0);
  objc_storeStrong((id *)&self->_properties, 0);

  objc_storeStrong((id *)&self->_monitor, 0);
}

@end