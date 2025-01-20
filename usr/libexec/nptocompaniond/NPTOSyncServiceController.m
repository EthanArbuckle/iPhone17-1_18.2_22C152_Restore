@interface NPTOSyncServiceController
- (NPTOSyncServiceController)initWithService:(id)a3 relationship:(int64_t)a4 requiresConnectedDevice:(BOOL)a5 deviceControllerClass:(Class)a6;
- (NSString)description;
- (void)_updateDeviceControllers;
- (void)service:(id)a3 devicesChanged:(id)a4;
- (void)service:(id)a3 linkedDevicesChanged:(id)a4;
@end

@implementation NPTOSyncServiceController

- (NPTOSyncServiceController)initWithService:(id)a3 relationship:(int64_t)a4 requiresConnectedDevice:(BOOL)a5 deviceControllerClass:(Class)a6
{
  id v11 = a3;
  v32.receiver = self;
  v32.super_class = (Class)NPTOSyncServiceController;
  v12 = [(NPTOSyncServiceController *)&v32 init];
  if (v12)
  {
    v13 = sub_10005CDAC();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v34 = "-[NPTOSyncServiceController initWithService:relationship:requiresConnectedDevice:deviceControllerClass:]";
      __int16 v35 = 2080;
      v36 = "/Library/Caches/com.apple.xbs/Sources/NanoPhotos/NanoPhotosSync/Daemon Controllers/NPTOSyncServiceController.m";
      __int16 v37 = 1024;
      int v38 = 36;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s (%s:%d)", buf, 0x1Cu);
    }

    objc_storeStrong((id *)&v12->_serviceIdentifier, a3);
    v12->_requiresConnectedDevice = a5;
    v12->_deviceControllerClass = a6;
    v12->_relationship = a4;
    v14 = (objc_class *)objc_opt_class();
    v15 = NSStringFromClass(v14);
    id v16 = +[NSString stringWithFormat:@"%@.%@", v15, @"queue"];
    dispatch_queue_t v17 = dispatch_queue_create((const char *)[v16 UTF8String], 0);
    queue = v12->_queue;
    v12->_queue = (OS_dispatch_queue *)v17;

    v19 = (IDSService *)[objc_alloc((Class)IDSService) initWithService:v12->_serviceIdentifier];
    service = v12->_service;
    v12->_service = v19;

    [(IDSService *)v12->_service addDelegate:v12 queue:v12->_queue];
    v21 = [NPTOTransaction alloc];
    v22 = (objc_class *)objc_opt_class();
    v23 = NSStringFromClass(v22);
    v24 = +[NSString stringWithFormat:@"%@.%@", v23, @"_updateDeviceControllers"];
    v25 = [(NPTOTransaction *)v21 initWithDescription:v24];

    v26 = v12->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10006B840;
    block[3] = &unk_1000931D0;
    v30 = v25;
    v31 = v12;
    v27 = v25;
    dispatch_async(v26, block);
  }
  return v12;
}

- (NSString)description
{
  v6.receiver = self;
  v6.super_class = (Class)NPTOSyncServiceController;
  v3 = [(NPTOSyncServiceController *)&v6 description];
  v4 = [v3 stringByAppendingFormat:@" service: %@", self->_serviceIdentifier];

  return (NSString *)v4;
}

- (void)service:(id)a3 devicesChanged:(id)a4
{
  v5 = sub_10005CDAC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315650;
    v7 = "-[NPTOSyncServiceController service:devicesChanged:]";
    __int16 v8 = 2080;
    v9 = "/Library/Caches/com.apple.xbs/Sources/NanoPhotos/NanoPhotosSync/Daemon Controllers/NPTOSyncServiceController.m";
    __int16 v10 = 1024;
    int v11 = 67;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s (%s:%d)", (uint8_t *)&v6, 0x1Cu);
  }

  [(NPTOSyncServiceController *)self _updateDeviceControllers];
}

- (void)service:(id)a3 linkedDevicesChanged:(id)a4
{
  v5 = sub_10005CDAC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315650;
    v7 = "-[NPTOSyncServiceController service:linkedDevicesChanged:]";
    __int16 v8 = 2080;
    v9 = "/Library/Caches/com.apple.xbs/Sources/NanoPhotos/NanoPhotosSync/Daemon Controllers/NPTOSyncServiceController.m";
    __int16 v10 = 1024;
    int v11 = 73;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s (%s:%d)", (uint8_t *)&v6, 0x1Cu);
  }

  [(NPTOSyncServiceController *)self _updateDeviceControllers];
}

- (void)_updateDeviceControllers
{
  v3 = sub_10005CDAC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v22 = (NPTOSyncServiceController *)"-[NPTOSyncServiceController _updateDeviceControllers]";
    __int16 v23 = 2080;
    v24 = "/Library/Caches/com.apple.xbs/Sources/NanoPhotos/NanoPhotosSync/Daemon Controllers/NPTOSyncServiceController.m";
    __int16 v25 = 1024;
    LODWORD(v26) = 81;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s (%s:%d)", buf, 0x1Cu);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v4 = +[NSMapTable strongToStrongObjectsMapTable];
  v5 = +[NSHashTable weakObjectsHashTable];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  int v6 = -[IDSService linkedDevicesWithRelationship:](self->_service, "linkedDevicesWithRelationship:", self->_relationship, 0);
  id v7 = [v6 countByEnumeratingWithState:&v17 objects:v27 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      __int16 v10 = 0;
      do
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        int v11 = *(void **)(*((void *)&v17 + 1) + 8 * (void)v10);
        id v12 = [(NSMapTable *)self->_deviceControllers objectForKey:v11];
        if (!v12) {
          id v12 = [objc_alloc(self->_deviceControllerClass) initWithDevice:v11 service:self->_service];
        }
        if (self->_requiresConnectedDevice && ![v11 isConnected])
        {
          if ([(NSHashTable *)self->_activeDeviceControllers containsObject:v12]) {
            [v12 pause];
          }
        }
        else
        {
          if (![(NSHashTable *)self->_activeDeviceControllers containsObject:v12]) {
            [v12 resume];
          }
          [v5 addObject:v12];
        }
        if (v12) {
          [v4 setObject:v12 forKey:v11];
        }

        __int16 v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v13 = [v6 countByEnumeratingWithState:&v17 objects:v27 count:16];
      id v8 = v13;
    }
    while (v13);
  }

  objc_storeStrong((id *)&self->_deviceControllers, v4);
  objc_storeStrong((id *)&self->_activeDeviceControllers, v5);
  v14 = sub_10005CDAC();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    deviceControllers = self->_deviceControllers;
    activeDeviceControllers = self->_activeDeviceControllers;
    *(_DWORD *)buf = 138412802;
    v22 = self;
    __int16 v23 = 2112;
    v24 = (const char *)deviceControllers;
    __int16 v25 = 2112;
    v26 = activeDeviceControllers;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%@: Updated device controllers: %@ active device controllers: %@", buf, 0x20u);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeDeviceControllers, 0);
  objc_storeStrong((id *)&self->_deviceControllers, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_serviceIdentifier, 0);
}

@end