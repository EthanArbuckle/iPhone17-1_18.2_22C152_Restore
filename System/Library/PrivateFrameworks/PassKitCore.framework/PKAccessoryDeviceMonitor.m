@interface PKAccessoryDeviceMonitor
- (BOOL)accessoryAttachedForEndpointUUID:(id)a3;
- (PKAccessoryDeviceMonitor)initWithDelegate:(id)a3;
- (void)accessoryConnectionAttached:(id)a3 type:(int)a4 info:(id)a5 properties:(id)a6;
- (void)accessoryConnectionDetached:(id)a3;
- (void)accessoryEndpointAttached:(id)a3 transportType:(int)a4 protocol:(int)a5 properties:(id)a6 forConnection:(id)a7;
- (void)accessoryEndpointDetached:(id)a3 forConnection:(id)a4;
@end

@implementation PKAccessoryDeviceMonitor

- (PKAccessoryDeviceMonitor)initWithDelegate:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PKAccessoryDeviceMonitor;
  v5 = [(PKAccessoryDeviceMonitor *)&v17 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v6->_lock._os_unfair_lock_opaque = 0;
    v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    accessoryAttached = v6->_accessoryAttached;
    v6->_accessoryAttached = v7;

    uint64_t v9 = [(objc_class *)getACCConnectionInfoClass() sharedInstance];
    accessoryConnectionInfo = v6->_accessoryConnectionInfo;
    v6->_accessoryConnectionInfo = (ACCConnectionInfo *)v9;

    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    attachmentDictionary = v6->_attachmentDictionary;
    v6->_attachmentDictionary = v11;

    int v13 = [(ACCConnectionInfo *)v6->_accessoryConnectionInfo registerDelegate:v6];
    v14 = PKLogFacilityTypeGetObject(0x19uLL);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = @"Unsuccessfully";
      if (v13) {
        v15 = @"Successfully";
      }
      *(_DWORD *)buf = 138412290;
      v19 = v15;
      _os_log_impl(&dword_190E10000, v14, OS_LOG_TYPE_DEFAULT, "Registered for CoreAccessory delegate %@", buf, 0xCu);
    }
  }
  return v6;
}

- (BOOL)accessoryAttachedForEndpointUUID:(id)a3
{
  return [(NSMutableSet *)self->_accessoryAttached containsObject:a3];
}

- (void)accessoryConnectionAttached:(id)a3 type:(int)a4 info:(id)a5 properties:(id)a6
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  if (a4 == 9)
  {
    os_unfair_lock_lock(&self->_lock);
    objc_storeStrong((id *)&self->_accessoryConnectionUUID, a3);
    os_unfair_lock_unlock(&self->_lock);
    v14 = PKLogFacilityTypeGetObject(0x19uLL);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138413058;
      id v16 = v11;
      __int16 v17 = 1024;
      int v18 = 9;
      __int16 v19 = 2112;
      id v20 = v12;
      __int16 v21 = 2112;
      id v22 = v13;
      _os_log_impl(&dword_190E10000, v14, OS_LOG_TYPE_DEFAULT, "Connection has attached with the following UUID %@ type %d following info %@ and properties %@", (uint8_t *)&v15, 0x26u);
    }
  }
}

- (void)accessoryConnectionDetached:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = self->_accessoryConnectionUUID;
  v6 = (NSString *)v4;
  v7 = v6;
  if (v5 == v6)
  {
  }
  else
  {
    if (!v6 || !v5)
    {

      goto LABEL_11;
    }
    BOOL v8 = [(NSString *)v5 isEqualToString:v6];

    if (!v8) {
      goto LABEL_11;
    }
  }
  uint64_t v9 = PKLogFacilityTypeGetObject(0x19uLL);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    id v12 = v7;
    _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "Connection has detached with the following UUID %@", (uint8_t *)&v11, 0xCu);
  }

  os_unfair_lock_lock(&self->_lock);
  accessoryConnectionUUID = self->_accessoryConnectionUUID;
  self->_accessoryConnectionUUID = 0;

  os_unfair_lock_unlock(&self->_lock);
LABEL_11:
}

- (void)accessoryEndpointAttached:(id)a3 transportType:(int)a4 protocol:(int)a5 properties:(id)a6 forConnection:(id)a7
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  if (a4 == 13)
  {
    int v15 = [[PKAccessoryDevice alloc] initWithDictionary:v13 endpointUUID:v12];
    id v16 = PKLogFacilityTypeGetObject(0x19uLL);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      int v23 = 138413314;
      id v24 = v14;
      __int16 v25 = 1024;
      int v26 = 13;
      __int16 v27 = 1024;
      int v28 = a5;
      __int16 v29 = 2112;
      id v30 = v13;
      __int16 v31 = 2112;
      v32 = v15;
      _os_log_impl(&dword_190E10000, v16, OS_LOG_TYPE_DEFAULT, "Accessory has attached with the following connection UUID %@ transportType %d following protocol %d, and device properties %@ and device %@", (uint8_t *)&v23, 0x2Cu);
    }

    os_unfair_lock_lock(&self->_lock);
    [(NSMutableDictionary *)self->_attachmentDictionary setObject:v15 forKeyedSubscript:v12];
    [(NSMutableSet *)self->_accessoryAttached addObject:v12];
    os_unfair_lock_unlock(&self->_lock);
    if ([(PKAccessoryDevice *)v15 isSleeve])
    {
      p_delegate = &self->_delegate;
      id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
      if (WeakRetained)
      {
        __int16 v19 = WeakRetained;
        id v20 = objc_loadWeakRetained((id *)p_delegate);
        char v21 = objc_opt_respondsToSelector();

        if (v21)
        {
          id v22 = objc_loadWeakRetained((id *)p_delegate);
          [v22 didAttachSleeveAccessory:v15];
        }
      }
    }
  }
}

- (void)accessoryEndpointDetached:(id)a3 forConnection:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [(NSMutableDictionary *)self->_attachmentDictionary objectForKeyedSubscript:v6];
  if (v8)
  {
    os_unfair_lock_lock(&self->_lock);
    [(NSMutableSet *)self->_accessoryAttached removeObject:v6];
    [(NSMutableDictionary *)self->_attachmentDictionary removeObjectForKey:v6];
    os_unfair_lock_unlock(&self->_lock);
    uint64_t v9 = PKLogFacilityTypeGetObject(0x19uLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138412802;
      id v17 = v7;
      __int16 v18 = 2112;
      id v19 = v6;
      __int16 v20 = 2112;
      char v21 = v8;
      _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "Accessory has detached with the following connection UUID %@ and endpoint UUID %@ and device %@", (uint8_t *)&v16, 0x20u);
    }

    if ([v8 isSleeve])
    {
      p_delegate = &self->_delegate;
      id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
      if (WeakRetained)
      {
        id v12 = WeakRetained;
        id v13 = objc_loadWeakRetained((id *)p_delegate);
        char v14 = objc_opt_respondsToSelector();

        if (v14)
        {
          id v15 = objc_loadWeakRetained((id *)p_delegate);
          [v15 didDetachSleeveAccessory];
        }
      }
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryConnectionUUID, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_accessoryAttached, 0);
  objc_storeStrong((id *)&self->_attachmentDictionary, 0);
  objc_storeStrong((id *)&self->_accessoryConnectionInfo, 0);
}

@end