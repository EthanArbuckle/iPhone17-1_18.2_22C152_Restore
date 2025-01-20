@interface TransparencyDeviceList
- (NSArray)cachedDevices;
- (NSArray)devices;
- (TransparencyDeviceList)init;
- (id)_authController;
- (id)updateDevicesList:(id)a3;
- (os_unfair_lock_s)lock;
- (void)refreshDeviceList:(id)a3 complete:(id)a4;
- (void)setCachedDevices:(id)a3;
- (void)setLock:(os_unfair_lock_s)a3;
@end

@implementation TransparencyDeviceList

- (TransparencyDeviceList)init
{
  v6.receiver = self;
  v6.super_class = (Class)TransparencyDeviceList;
  v2 = [(TransparencyDeviceList *)&v6 init];
  v3 = v2;
  if (v2)
  {
    [(TransparencyDeviceList *)v2 setLock:0];
    v4 = v3;
  }

  return v3;
}

- (id)_authController
{
  authController = self->_authController;
  if (!authController)
  {
    v4 = (AKAppleIDAuthenticationController *)objc_alloc_init((Class)AKAppleIDAuthenticationController);
    v5 = self->_authController;
    self->_authController = v4;

    authController = self->_authController;
  }

  return authController;
}

- (NSArray)devices
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = [(TransparencyDeviceList *)self cachedDevices];
  os_unfair_lock_unlock(p_lock);

  return (NSArray *)v4;
}

- (id)updateDevicesList:(id)a3
{
  id v4 = a3;
  v5 = +[NSMutableArray array];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        id v12 = objc_alloc((Class)KTIDMSDevice);
        id v13 = [v12 initWithAKRemoteDevice:v11, v15];
        if (v13) {
          [v5 addObject:v13];
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  os_unfair_lock_lock(&self->_lock);
  [(TransparencyDeviceList *)self setCachedDevices:v5];
  os_unfair_lock_unlock(&self->_lock);

  return v5;
}

- (void)refreshDeviceList:(id)a3 complete:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, uint64_t))a4;
  if (!v6)
  {
    uint64_t v12 = +[NSError aa_errorWithCode:-3 underlyingError:0];
LABEL_13:
    uint64_t v9 = (void *)v12;
    v7[2](v7, 0, v12);
    goto LABEL_25;
  }
  if (!objc_opt_class() || !objc_opt_class())
  {
    if (qword_10032F258 != -1) {
      dispatch_once(&qword_10032F258, &stru_1002C8C30);
    }
    uint64_t v11 = qword_10032F260;
    if (os_log_type_enabled((os_log_t)qword_10032F260, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "AuthKit not available", buf, 2u);
    }
    uint64_t v12 = +[TransparencyError errorWithDomain:kTransparencyErrorInternal code:-333 description:@"AuthKit not available"];
    goto LABEL_13;
  }
  id v8 = objc_alloc_init((Class)AKDeviceListRequestContext);
  uint64_t v9 = v8;
  if (v8)
  {
    [v8 setAltDSID:v6];
    id v10 = objc_alloc_init((Class)AKAppleIDAuthenticationController);
    if (v10)
    {
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_1001F414C;
      v16[3] = &unk_1002C8C98;
      v16[4] = self;
      long long v17 = v7;
      [v10 deviceListWithContext:v9 completion:v16];
    }
    else
    {
      if (qword_10032F258 != -1) {
        dispatch_once(&qword_10032F258, &stru_1002C8C70);
      }
      v14 = qword_10032F260;
      if (os_log_type_enabled((os_log_t)qword_10032F260, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "AKAppleIDAuthenticationController not available", buf, 2u);
      }
      long long v15 = +[TransparencyError errorWithDomain:kTransparencyErrorInternal code:-335 description:@"can't get authController"];
      v7[2](v7, 0, (uint64_t)v15);
    }
  }
  else
  {
    if (qword_10032F258 != -1) {
      dispatch_once(&qword_10032F258, &stru_1002C8C50);
    }
    id v13 = qword_10032F260;
    if (os_log_type_enabled((os_log_t)qword_10032F260, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "AKDeviceListRequestContext not available", buf, 2u);
    }
    id v10 = +[TransparencyError errorWithDomain:kTransparencyErrorInternal code:-334 description:@"can't get AKDeviceListRequestContextClass"];
    v7[2](v7, 0, (uint64_t)v10);
  }

LABEL_25:
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void)setLock:(os_unfair_lock_s)a3
{
  self->_lock = a3;
}

- (NSArray)cachedDevices
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setCachedDevices:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedDevices, 0);

  objc_storeStrong((id *)&self->_authController, 0);
}

@end