@interface CFDaemon
- (CFDaemon)init;
- (void)_handleLocaleChange;
- (void)_handleTimeZoneChange;
- (void)_updateLocaleChange;
- (void)set24hMode;
- (void)setDST;
- (void)setUTCOffset;
- (void)writeAllVariables;
@end

@implementation CFDaemon

- (void)set24hMode
{
  nvramHelper = self->nvramHelper;
  id v3 = [(CFHelper *)self->cfPrefsHelper read24HrMode];
  [(NVRAMHelper *)nvramHelper writeNVRAM:@"alpm-24h-mode" :v3];
}

- (void)setDST
{
  cfPrefsHelper = self->cfPrefsHelper;
  id v6 = 0;
  id v7 = 0;
  [(CFHelper *)cfPrefsHelper readDST:&v7 :&v6];
  id v4 = v7;
  id v5 = v6;
  [(NVRAMHelper *)self->nvramHelper writeNVRAM:@"alpm-next-dst" :v4];
  [(NVRAMHelper *)self->nvramHelper writeNVRAM:@"alpm-dst-offset" :v5];
}

- (void)setUTCOffset
{
  nvramHelper = self->nvramHelper;
  id v3 = [(CFHelper *)self->cfPrefsHelper readUTCOffset];
  [(NVRAMHelper *)nvramHelper writeNVRAM:@"utc-offset" :v3];
}

- (void)writeAllVariables
{
  if (os_log_type_enabled((os_log_t)self->logs, OS_LOG_TYPE_DEBUG)) {
    sub_1000025BC();
  }
  [(CFDaemon *)self setDST];
  [(CFDaemon *)self setUTCOffset];
  [(CFDaemon *)self set24hMode];
  [(NVRAMHelper *)self->nvramHelper syncNVRAM];
}

- (void)_updateLocaleChange
{
  [(CFDaemon *)self set24hMode];
  nvramHelper = self->nvramHelper;

  [(NVRAMHelper *)nvramHelper syncNVRAM];
}

- (void)_handleTimeZoneChange
{
  if (os_log_type_enabled((os_log_t)self->logs, OS_LOG_TYPE_DEBUG)) {
    sub_1000025F0();
  }
  [(CFDaemon *)self setDST];
  [(CFDaemon *)self setUTCOffset];
  [(NVRAMHelper *)self->nvramHelper syncNVRAM];
}

- (void)_handleLocaleChange
{
  if (os_log_type_enabled((os_log_t)self->logs, OS_LOG_TYPE_DEBUG)) {
    sub_100002624();
  }
  v7[0] = 0;
  v7[1] = v7;
  v7[2] = 0x3032000000;
  v7[3] = sub_100001FA8;
  v7[4] = sub_100001FB8;
  id v8 = (id)os_transaction_create();
  id v3 = +[NSNotificationCenter defaultCenter];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100001FC0;
  v6[3] = &unk_100004240;
  v6[4] = self;
  v6[5] = v7;
  id v4 = [v3 addObserverForName:NSCurrentLocaleDidChangeNotification object:0 queue:0 usingBlock:v6];
  token = self->token;
  self->token = v4;

  _Block_object_dispose(v7, 8);
}

- (CFDaemon)init
{
  v10.receiver = self;
  v10.super_class = (Class)CFDaemon;
  v2 = [(CFDaemon *)&v10 init];
  if (v2)
  {
    os_log_t v3 = os_log_create("CoreFirmwareAgent", "com.apple.batterytrapd");
    logs = v2->logs;
    v2->logs = (OS_os_log *)v3;

    id v5 = [[NVRAMHelper alloc] initWithLog:v2->logs];
    nvramHelper = v2->nvramHelper;
    v2->nvramHelper = v5;

    id v7 = [[CFHelper alloc] initWithLog:v2->logs];
    cfPrefsHelper = v2->cfPrefsHelper;
    v2->cfPrefsHelper = v7;

    [(CFDaemon *)v2 writeAllVariables];
  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->token, 0);
  objc_storeStrong((id *)&self->logs, 0);
  objc_storeStrong((id *)&self->cfPrefsHelper, 0);

  objc_storeStrong((id *)&self->nvramHelper, 0);
}

@end