@interface PRBluetoothDeviceCache
- (BOOL)isCached:(id)a3;
- (BOOL)isCachedByTokenData:(id)a3;
- (BOOL)uncacheDeviceByTokenData:(id)a3;
- (PRBluetoothDeviceCache)init;
- (id)cachedDevices;
- (id)deviceForIDSIdentifier:(id)a3;
- (id)deviceForIdentifier:(unint64_t)a3;
- (id)deviceForTokenData:(id)a3;
- (void)cacheDevice:(id)a3;
- (void)reset;
- (void)uncacheDevice:(id)a3;
@end

@implementation PRBluetoothDeviceCache

- (PRBluetoothDeviceCache)init
{
  v11.receiver = self;
  v11.super_class = (Class)PRBluetoothDeviceCache;
  v2 = [(PRBluetoothDeviceCache *)&v11 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    uint64_t v4 = objc_opt_new();
    u64IdentifierToBluetoothDeviceMap = v3->_u64IdentifierToBluetoothDeviceMap;
    v3->_u64IdentifierToBluetoothDeviceMap = (NSMutableDictionary *)v4;

    uint64_t v6 = objc_opt_new();
    tokenDataToBluetoothDeviceMap = v3->_tokenDataToBluetoothDeviceMap;
    v3->_tokenDataToBluetoothDeviceMap = (NSMutableDictionary *)v6;

    uint64_t v8 = objc_opt_new();
    idsIdentifierToBluetoothDeviceMap = v3->_idsIdentifierToBluetoothDeviceMap;
    v3->_idsIdentifierToBluetoothDeviceMap = (NSMutableDictionary *)v8;
  }
  return v3;
}

- (void)reset
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  [(NSMutableDictionary *)self->_u64IdentifierToBluetoothDeviceMap removeAllObjects];
  [(NSMutableDictionary *)self->_tokenDataToBluetoothDeviceMap removeAllObjects];
  [(NSMutableDictionary *)self->_idsIdentifierToBluetoothDeviceMap removeAllObjects];

  os_unfair_lock_unlock(p_lock);
}

- (id)cachedDevices
{
  v3 = objc_opt_new();
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v5 = [(NSMutableDictionary *)self->_u64IdentifierToBluetoothDeviceMap allValues];

  os_unfair_lock_unlock(p_lock);

  return v5;
}

- (void)cacheDevice:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    id v6 = [v4 u64Identifier];
    v7 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 134217984;
      id v17 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Caching device with address: 0x%llx", (uint8_t *)&v16, 0xCu);
    }
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    u64IdentifierToBluetoothDeviceMap = self->_u64IdentifierToBluetoothDeviceMap;
    v10 = +[NSNumber numberWithUnsignedLongLong:v6];
    [(NSMutableDictionary *)u64IdentifierToBluetoothDeviceMap setObject:v5 forKeyedSubscript:v10];

    tokenDataToBluetoothDeviceMap = self->_tokenDataToBluetoothDeviceMap;
    uint64_t v12 = [v5 discoveryTokenData];
    [(NSMutableDictionary *)tokenDataToBluetoothDeviceMap setObject:v5 forKeyedSubscript:v12];

    v13 = [v5 idsDeviceID];
    LOBYTE(v12) = v13 == 0;

    if ((v12 & 1) == 0)
    {
      idsIdentifierToBluetoothDeviceMap = self->_idsIdentifierToBluetoothDeviceMap;
      v15 = [v5 idsDeviceID];
      [(NSMutableDictionary *)idsIdentifierToBluetoothDeviceMap setObject:v5 forKeyedSubscript:v15];
    }
    os_unfair_lock_unlock(p_lock);
  }
}

- (void)uncacheDevice:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v14 = v4;
    id v5 = [v4 u64Identifier];
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    u64IdentifierToBluetoothDeviceMap = self->_u64IdentifierToBluetoothDeviceMap;
    uint64_t v8 = +[NSNumber numberWithUnsignedLongLong:v5];
    [(NSMutableDictionary *)u64IdentifierToBluetoothDeviceMap removeObjectForKey:v8];

    tokenDataToBluetoothDeviceMap = self->_tokenDataToBluetoothDeviceMap;
    v10 = [v14 discoveryTokenData];
    [(NSMutableDictionary *)tokenDataToBluetoothDeviceMap removeObjectForKey:v10];

    objc_super v11 = [v14 idsDeviceID];

    if (v11)
    {
      idsIdentifierToBluetoothDeviceMap = self->_idsIdentifierToBluetoothDeviceMap;
      v13 = [v14 idsDeviceID];
      [(NSMutableDictionary *)idsIdentifierToBluetoothDeviceMap removeObjectForKey:v13];
    }
    os_unfair_lock_unlock(p_lock);
    id v4 = v14;
  }
}

- (BOOL)uncacheDeviceByTokenData:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    os_unfair_lock_lock(&self->_lock);
    id v5 = [(NSMutableDictionary *)self->_tokenDataToBluetoothDeviceMap objectForKey:v4];
    os_unfair_lock_unlock(&self->_lock);
    BOOL v6 = v5 != 0;
    if (v5) {
      [(PRBluetoothDeviceCache *)self uncacheDevice:v5];
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)isCached:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    BOOL v6 = [v4 discoveryTokenData];
    v7 = [(PRBluetoothDeviceCache *)self deviceForTokenData:v6];
    BOOL v8 = v7 != 0;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)isCachedByTokenData:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(PRBluetoothDeviceCache *)self deviceForTokenData:v4];
    BOOL v6 = v5 != 0;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)deviceForIdentifier:(unint64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  u64IdentifierToBluetoothDeviceMap = self->_u64IdentifierToBluetoothDeviceMap;
  v7 = +[NSNumber numberWithUnsignedLongLong:a3];
  BOOL v8 = [(NSMutableDictionary *)u64IdentifierToBluetoothDeviceMap objectForKeyedSubscript:v7];

  os_unfair_lock_unlock(p_lock);

  return v8;
}

- (id)deviceForTokenData:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    BOOL v6 = [(NSMutableDictionary *)self->_tokenDataToBluetoothDeviceMap objectForKeyedSubscript:v4];
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)deviceForIDSIdentifier:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    BOOL v6 = [(NSMutableDictionary *)self->_idsIdentifierToBluetoothDeviceMap objectForKeyedSubscript:v4];
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idsIdentifierToBluetoothDeviceMap, 0);
  objc_storeStrong((id *)&self->_tokenDataToBluetoothDeviceMap, 0);

  objc_storeStrong((id *)&self->_u64IdentifierToBluetoothDeviceMap, 0);
}

@end