@interface FGKUPlugin
- (AppleFirmwareUpdateController)controller;
- (FGKUPlugin)initWithCoder:(id)a3;
- (FGKUPlugin)initWithDeviceClass:(id)a3 delegate:(id)a4 info:(id *)a5 options:(id)a6;
- (FudPluginDelegate)delegate;
- (NSMutableDictionary)pluginInfo;
- (NSString)deviceClass;
- (void)applyFirmwareWithOptions:(id)a3;
- (void)bootstrapWithOptions:(id)a3;
- (void)dealloc;
- (void)downloadFirmwareWithOptions:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)findFirmwareWithOptions:(id)a3 remote:(BOOL)a4;
- (void)finishWithOptions:(id)a3;
- (void)prepareFirmwareWithOptions:(id)a3;
- (void)setController:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation FGKUPlugin

- (FGKUPlugin)initWithDeviceClass:(id)a3 delegate:(id)a4 info:(id *)a5 options:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v14 = (objc_class *)objc_opt_class();
  v15 = NSStringFromClass(v14);
  [v12 log:7, @"Initializing %@ version %s for DeviceClass %@ with options %@", v15, &unk_100003591, v11, v13 format];

  v26.receiver = self;
  v26.super_class = (Class)FGKUPlugin;
  v16 = [(FGKUPlugin *)&v26 init];
  v17 = v16;
  if (!v12) {
    goto LABEL_6;
  }
  if (!v11) {
    goto LABEL_6;
  }
  if (!v16) {
    goto LABEL_6;
  }
  objc_storeStrong((id *)&v16->_deviceClass, a3);
  v18 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  pluginInfo = v17->_pluginInfo;
  v17->_pluginInfo = v18;

  objc_storeWeak((id *)&v17->_delegate, v12);
  id v20 = objc_alloc((Class)AppleFirmwareUpdateController);
  v21 = [v13 objectForKeyedSubscript:@"IOMatchLaunchServiceID"];
  v22 = [v13 objectForKeyedSubscript:@"FWDirectory"];
  v23 = (AppleFirmwareUpdateController *)[v20 initWithRegistryEntryID:v21 fwAssetDirectory:v22];
  controller = v17->_controller;
  v17->_controller = v23;

  [(NSMutableDictionary *)v17->_pluginInfo setObject:&off_100004580 forKeyedSubscript:@"PrepareWeight"];
  [(NSMutableDictionary *)v17->_pluginInfo setObject:&off_100004590 forKeyedSubscript:@"ApplyWeight"];
  [(NSMutableDictionary *)v17->_pluginInfo setObject:&off_1000045A0 forKeyedSubscript:@"FinishWeight"];
  *a5 = v17->_pluginInfo;
  if (([(AppleFirmwareUpdateController *)v17->_controller createFWAssetInfo] & 1) == 0)
  {
LABEL_6:
    [v12 log:7 format:@"Init Failure"];

    v17 = 0;
  }

  return v17;
}

- (void)setDelegate:(id)a3
{
}

- (void)bootstrapWithOptions:(id)a3
{
  id v4 = a3;
  v5 = [(FGKUPlugin *)self delegate];
  [v5 log:7, @"%s options %@", "-[FGKUPlugin bootstrapWithOptions:]", v4 format];

  id v7 = [(AppleFirmwareUpdateController *)self->_controller updateFirmwareWithOptions:v4];

  v6 = [(FGKUPlugin *)self delegate];
  objc_msgSend(v6, "didBootstrap:info:error:", v7 == 0, 0);
}

- (void)findFirmwareWithOptions:(id)a3 remote:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(FGKUPlugin *)self delegate];
  [v7 log:7, @"%s options %@ remote %d", "-[FGKUPlugin findFirmwareWithOptions:remote:]", v6, v4 format];

  id v8 = [(FGKUPlugin *)self delegate];
  [v8 didFind:1 info:0 updateAvailable:0 needsDownload:0 error:0];
}

- (void)downloadFirmwareWithOptions:(id)a3
{
  id v4 = a3;
  v5 = [(FGKUPlugin *)self delegate];
  [v5 log:7, @"%s options %@", "-[FGKUPlugin downloadFirmwareWithOptions:]", v4 format];

  id v6 = [(FGKUPlugin *)self delegate];
  [v6 didDownload:1 info:0 error:0];
}

- (void)prepareFirmwareWithOptions:(id)a3
{
  id v4 = a3;
  v5 = [(FGKUPlugin *)self delegate];
  [v5 log:7, @"%s options %@", "-[FGKUPlugin prepareFirmwareWithOptions:]", v4 format];

  id v6 = [(FGKUPlugin *)self delegate];
  [v6 didPrepare:1 info:0 error:0];
}

- (void)applyFirmwareWithOptions:(id)a3
{
  id v4 = a3;
  v5 = [(FGKUPlugin *)self delegate];
  [v5 log:7, @"%s options %@", "-[FGKUPlugin applyFirmwareWithOptions:]", v4 format];

  id v6 = [(FGKUPlugin *)self delegate];
  [v6 didApply:1 info:0 error:0];
}

- (void)finishWithOptions:(id)a3
{
  id v4 = a3;
  v5 = [(FGKUPlugin *)self delegate];
  [v5 log:7, @"%s options %@", "-[FGKUPlugin finishWithOptions:]", v4 format];

  id v6 = [(FGKUPlugin *)self delegate];
  [v6 didFinish:1 info:0 error:0];
}

- (void)dealloc
{
  v3 = [(FGKUPlugin *)self delegate];
  id v4 = [(FGKUPlugin *)self deviceClass];
  [v3 log:7, @"%s() deviceClass=%@", "-[FGKUPlugin dealloc]", v4 format];

  v5.receiver = self;
  v5.super_class = (Class)FGKUPlugin;
  [(FGKUPlugin *)&v5 dealloc];
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(FGKUPlugin *)self delegate];
  objc_msgSend(v5, "log:format:", 7, @"%s", "-[FGKUPlugin encodeWithCoder:]");

  id v6 = [(FGKUPlugin *)self deviceClass];
  [v4 encodeObject:v6 forKey:@"DeviceClass"];

  id v7 = [(FGKUPlugin *)self pluginInfo];
  [v4 encodeObject:v7 forKey:@"PluginInfo"];
}

- (FGKUPlugin)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)FGKUPlugin;
  objc_super v5 = [(FGKUPlugin *)&v12 init];
  id v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, 0);
    uint64_t v7 = [v4 decodeObjectForKey:@"DeviceClass"];
    deviceClass = v6->_deviceClass;
    v6->_deviceClass = (NSString *)v7;

    uint64_t v9 = [v4 decodeObjectForKey:@"PluginInfo"];
    pluginInfo = v6->_pluginInfo;
    v6->_pluginInfo = (NSMutableDictionary *)v9;
  }
  return v6;
}

- (NSString)deviceClass
{
  return self->_deviceClass;
}

- (NSMutableDictionary)pluginInfo
{
  return self->_pluginInfo;
}

- (FudPluginDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (FudPluginDelegate *)WeakRetained;
}

- (AppleFirmwareUpdateController)controller
{
  return (AppleFirmwareUpdateController *)objc_getProperty(self, a2, 32, 1);
}

- (void)setController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_controller, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_pluginInfo, 0);
  objc_storeStrong((id *)&self->_deviceClass, 0);
}

@end