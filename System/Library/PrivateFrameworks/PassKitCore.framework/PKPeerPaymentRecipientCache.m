@interface PKPeerPaymentRecipientCache
+ (id)_instanceName;
+ (id)sharedCache;
- (BOOL)_canReadMap;
- (BOOL)_canWriteMap;
- (BOOL)_writeMapToDisk;
- (BOOL)lowFrequencyDeviceScoreSubmissionRequiredForRecipientAddress:(id)a3;
- (BOOL)purgeCache;
- (PKPeerPaymentRecipientCache)init;
- (id)__init;
- (id)_keyForRecipientAddress:(id)a3;
- (id)recipientForRecipientAddress:(id)a3;
- (void)_handleDiskMapChangedNotification:(id)a3;
- (void)_handlePurgedNotification:(id)a3;
- (void)_locked_setMapNeedsWrite;
- (void)_updateMapsFromDisk;
- (void)cacheRecipient:(id)a3 forRecipientAddress:(id)a4;
- (void)dealloc;
- (void)noteSubmittedLowFrequencyDeviceScoreForRecipientAddress:(id)a3;
- (void)purgeRecipientWithRecipientAddress:(id)a3;
@end

@implementation PKPeerPaymentRecipientCache

+ (id)sharedCache
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__PKPeerPaymentRecipientCache_sharedCache__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_MergedGlobals_287 != -1) {
    dispatch_once(&_MergedGlobals_287, block);
  }
  v2 = (void *)qword_1EB4035F0;
  return v2;
}

void __42__PKPeerPaymentRecipientCache_sharedCache__block_invoke(uint64_t a1)
{
  uint64_t v1 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "__init");
  v2 = (void *)qword_1EB4035F0;
  qword_1EB4035F0 = v1;
}

- (PKPeerPaymentRecipientCache)init
{
  v3 = [(id)objc_opt_class() sharedCache];

  return v3;
}

- (id)__init
{
  v8.receiver = self;
  v8.super_class = (Class)PKPeerPaymentRecipientCache;
  v2 = [(PKPeerPaymentRecipientCache *)&v8 init];
  if (v2)
  {
    v3 = objc_alloc_init(PKMapContainer);
    mapContainer = v2->_mapContainer;
    v2->_mapContainer = v3;

    v2->_mapAccessLock._os_unfair_lock_opaque = 0;
    [(PKPeerPaymentRecipientCache *)v2 _updateMapsFromDisk];
    v5 = [MEMORY[0x1E4F28C40] defaultCenter];
    [v5 addObserver:v2 selector:sel__handlePurgedNotification_ name:@"PKDistributedNotificationPeerPaymentRecipientCachePurged" object:0 suspensionBehavior:2];

    v6 = [MEMORY[0x1E4F28C40] defaultCenter];
    [v6 addObserver:v2 selector:sel__handleDiskMapChangedNotification_ name:@"PKDistributedNotificationPeerPaymentRecipientCacheWrittenToDisk" object:0 suspensionBehavior:2];
  }
  return v2;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28C40] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)PKPeerPaymentRecipientCache;
  [(PKPeerPaymentRecipientCache *)&v4 dealloc];
}

- (id)recipientForRecipientAddress:(id)a3
{
  objc_super v4 = PKIDSNormalizedAddress(a3);
  if (v4)
  {
    p_mapAccessLock = &self->_mapAccessLock;
    os_unfair_lock_lock(&self->_mapAccessLock);
    v6 = [(PKPeerPaymentRecipientCache *)self _keyForRecipientAddress:v4];
    v7 = [(PKMapContainer *)self->_mapContainer recipientMap];
    objc_super v8 = [v7 objectForKey:v6];

    if ([v8 hasExpired])
    {
      v9 = [(PKMapContainer *)self->_mapContainer recipientMap];
      [v9 removeObjectForKey:v6];
      v10 = 0;
    }
    else
    {
      v9 = [v8 item];
      v10 = (void *)[v9 copy];
    }

    os_unfair_lock_unlock(p_mapAccessLock);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)cacheRecipient:(id)a3 forRecipientAddress:(id)a4
{
  id v11 = a3;
  v6 = PKIDSNormalizedAddress(a4);
  if (v11 && v6)
  {
    os_unfair_lock_lock(&self->_mapAccessLock);
    v7 = [(PKPeerPaymentRecipientCache *)self _keyForRecipientAddress:v6];
    objc_super v8 = [v11 cacheableCopy];
    v9 = [(PKMapContainer *)self->_mapContainer recipientMap];
    v10 = [[PKCacheRecipientItem alloc] initWithItem:v8];
    [v9 setObject:v10 forKey:v7];

    [(PKPeerPaymentRecipientCache *)self _locked_setMapNeedsWrite];
    os_unfair_lock_unlock(&self->_mapAccessLock);
  }
}

- (void)purgeRecipientWithRecipientAddress:(id)a3
{
  PKIDSNormalizedAddress(a3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    os_unfair_lock_lock(&self->_mapAccessLock);
    objc_super v4 = [(PKPeerPaymentRecipientCache *)self _keyForRecipientAddress:v6];
    v5 = [(PKMapContainer *)self->_mapContainer recipientMap];
    [v5 removeObjectForKey:v4];

    [(PKPeerPaymentRecipientCache *)self _locked_setMapNeedsWrite];
    os_unfair_lock_unlock(&self->_mapAccessLock);
  }
}

- (BOOL)purgeCache
{
  p_mapAccessLock = &self->_mapAccessLock;
  os_unfair_lock_lock(&self->_mapAccessLock);
  [(PKMapContainer *)self->_mapContainer removeAllObjects];
  os_unfair_lock_unlock(p_mapAccessLock);
  objc_super v4 = [MEMORY[0x1E4F28C40] defaultCenter];
  v5 = [(id)objc_opt_class() _instanceName];
  [v4 postNotificationName:@"PKDistributedNotificationPeerPaymentRecipientCachePurged" object:v5];

  return [(PKPeerPaymentRecipientCache *)self _writeMapToDisk];
}

- (BOOL)lowFrequencyDeviceScoreSubmissionRequiredForRecipientAddress:(id)a3
{
  objc_super v4 = PKIDSNormalizedAddress(a3);
  if (v4)
  {
    p_mapAccessLock = &self->_mapAccessLock;
    os_unfair_lock_lock(&self->_mapAccessLock);
    id v6 = [(PKPeerPaymentRecipientCache *)self _keyForRecipientAddress:v4];
    v7 = [(PKMapContainer *)self->_mapContainer scoreMap];
    objc_super v8 = [v7 objectForKey:v6];

    if (v8 && ![v8 hasExpired])
    {
      BOOL v10 = 0;
    }
    else
    {
      v9 = [(PKMapContainer *)self->_mapContainer scoreMap];
      [v9 removeObjectForKey:v6];

      [(PKPeerPaymentRecipientCache *)self _locked_setMapNeedsWrite];
      BOOL v10 = 1;
    }
    os_unfair_lock_unlock(p_mapAccessLock);
  }
  else
  {
    BOOL v10 = 1;
  }

  return v10;
}

- (void)noteSubmittedLowFrequencyDeviceScoreForRecipientAddress:(id)a3
{
  objc_super v4 = PKIDSNormalizedAddress(a3);
  if (v4)
  {
    id v10 = v4;
    os_unfair_lock_lock(&self->_mapAccessLock);
    v5 = [(PKPeerPaymentRecipientCache *)self _keyForRecipientAddress:v10];
    id v6 = [(PKMapContainer *)self->_mapContainer scoreMap];
    v7 = [v6 objectForKey:v5];

    if (!v7)
    {
      objc_super v8 = [(PKMapContainer *)self->_mapContainer scoreMap];
      v9 = objc_alloc_init(PKCacheScoreItem);
      [v8 setObject:v9 forKey:v5];

      [(PKPeerPaymentRecipientCache *)self _locked_setMapNeedsWrite];
    }
    os_unfair_lock_unlock(&self->_mapAccessLock);

    objc_super v4 = v10;
  }
}

- (id)_keyForRecipientAddress:(id)a3
{
  if (a3)
  {
    v3 = [NSString stringWithFormat:@"PKPeerPaymentRecipientCache:%@", a3];
    objc_super v4 = [v3 dataUsingEncoding:4];
    v5 = [v4 SHA256Hash];
    id v6 = [v5 hexEncoding];
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

- (BOOL)_canReadMap
{
  if (_canReadMap___readAccess) {
    return 1;
  }
  PKPeerPaymentRecipientCacheArchivePath();
  id v3 = objc_claimAutoreleasedReturnValue();
  _canReadMap___readAccess = access((const char *)[v3 UTF8String], 4) == 0;

  return _canReadMap___readAccess != 0;
}

- (BOOL)_canWriteMap
{
  if (_canWriteMap___writeAccess) {
    return 1;
  }
  id v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  objc_super v4 = PKPeerPaymentRecipientCacheDirectoryPath();
  [v3 createDirectoryAtPath:v4 withIntermediateDirectories:1 attributes:0 error:0];

  PKPeerPaymentRecipientCacheDirectoryPath();
  id v5 = objc_claimAutoreleasedReturnValue();
  _canWriteMap___writeAccess = access((const char *)[v5 UTF8String], 2) == 0;

  return _canWriteMap___writeAccess != 0;
}

- (void)_handlePurgedNotification:(id)a3
{
  objc_super v4 = [a3 object];
  id v5 = [(id)objc_opt_class() _instanceName];
  char v6 = [v4 isEqualToString:v5];

  if ((v6 & 1) == 0)
  {
    os_unfair_lock_lock(&self->_mapAccessLock);
    [(PKMapContainer *)self->_mapContainer removeAllObjects];
    os_unfair_lock_unlock(&self->_mapAccessLock);
  }
}

- (void)_handleDiskMapChangedNotification:(id)a3
{
  objc_super v4 = [a3 object];
  id v5 = [(id)objc_opt_class() _instanceName];
  char v6 = [v4 isEqualToString:v5];

  if ((v6 & 1) == 0)
  {
    [(PKPeerPaymentRecipientCache *)self _updateMapsFromDisk];
  }
}

- (void)_updateMapsFromDisk
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if ([(PKPeerPaymentRecipientCache *)self _canReadMap])
  {
    p_mapAccessLock = &self->_mapAccessLock;
    os_unfair_lock_lock(&self->_mapAccessLock);
    objc_super v4 = PKPeerPaymentRecipientCacheArchivePath();
    id v16 = 0;
    id v5 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v4 options:0 error:&v16];
    char v6 = v16;
    if (v5)
    {
      v7 = [objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v5 error:0];
      uint64_t v8 = objc_opt_class();
      uint64_t v9 = *MEMORY[0x1E4F284E8];
      v15 = v6;
      id v10 = [v7 decodeTopLevelObjectOfClass:v8 forKey:v9 error:&v15];
      id v11 = v15;

      if (v10)
      {
        [(PKMapContainer *)self->_mapContainer updateWithContainer:v10];
      }
      else
      {
        v13 = PKLogFacilityTypeGetObject(0xBuLL);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v18 = v4;
          __int16 v19 = 2112;
          v20 = v11;
          _os_log_impl(&dword_190E10000, v13, OS_LOG_TYPE_DEFAULT, "Error: Failed to decode the peer payment recipient cache at path: %@ with error: %@. Removing file.", buf, 0x16u);
        }

        v14 = [MEMORY[0x1E4F28CB8] defaultManager];
        [v14 removeItemAtPath:v4 error:0];
      }
    }
    else
    {
      v7 = PKLogFacilityTypeGetObject(0xBuLL);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v18 = v4;
        __int16 v19 = 2112;
        v20 = v6;
        _os_log_impl(&dword_190E10000, v7, OS_LOG_TYPE_DEFAULT, "Error: Failed to read peer payment recipient cache data from path: %@ with error: %@", buf, 0x16u);
      }
      id v11 = v6;
    }

    os_unfair_lock_unlock(p_mapAccessLock);
  }
  else
  {
    id v11 = PKLogFacilityTypeGetObject(0xBuLL);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = PKPeerPaymentRecipientCacheArchivePath();
      *(_DWORD *)buf = 138412290;
      v18 = v12;
      _os_log_impl(&dword_190E10000, v11, OS_LOG_TYPE_DEFAULT, "Note: Unable to read from the peer payment recipient cache path: %@", buf, 0xCu);
    }
  }
}

- (void)_locked_setMapNeedsWrite
{
  if (!self->_mapNeedsWriteTimer)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __55__PKPeerPaymentRecipientCache__locked_setMapNeedsWrite__block_invoke;
    v6[3] = &unk_1E56F5BF8;
    v6[4] = self;
    id v3 = [MEMORY[0x1E4F1CB00] timerWithTimeInterval:0 repeats:v6 block:3.0];
    mapNeedsWriteTimer = self->_mapNeedsWriteTimer;
    self->_mapNeedsWriteTimer = v3;

    id v5 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
    [v5 addTimer:self->_mapNeedsWriteTimer forMode:*MEMORY[0x1E4F1C4B0]];
  }
}

uint64_t __55__PKPeerPaymentRecipientCache__locked_setMapNeedsWrite__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _writeMapToDisk];
}

- (BOOL)_writeMapToDisk
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  p_mapAccessLock = &self->_mapAccessLock;
  os_unfair_lock_lock(&self->_mapAccessLock);
  [(NSTimer *)self->_mapNeedsWriteTimer invalidate];
  mapNeedsWriteTimer = self->_mapNeedsWriteTimer;
  self->_mapNeedsWriteTimer = 0;

  if ([(PKPeerPaymentRecipientCache *)self _canWriteMap])
  {
    id v5 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:self->_mapContainer requiringSecureCoding:1 error:0];
    if (v5)
    {
      char v6 = PKPeerPaymentRecipientCacheArchivePath();
      if ([v5 writeToFile:v6 atomically:1])
      {
        v7 = [MEMORY[0x1E4F28C40] defaultCenter];
        uint64_t v8 = [(id)objc_opt_class() _instanceName];
        [v7 postNotificationName:@"PKDistributedNotificationPeerPaymentRecipientCacheWrittenToDisk" object:v8];

        BOOL v9 = 1;
LABEL_14:

        goto LABEL_15;
      }
      id v11 = PKLogFacilityTypeGetObject(0xBuLL);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 138412290;
        v14 = v6;
        _os_log_impl(&dword_190E10000, v11, OS_LOG_TYPE_DEFAULT, "Error: Failed to write peer payment recipient cache to path: %@", (uint8_t *)&v13, 0xCu);
      }
    }
    else
    {
      char v6 = PKLogFacilityTypeGetObject(0xBuLL);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v13) = 0;
        _os_log_impl(&dword_190E10000, v6, OS_LOG_TYPE_DEFAULT, "Error: Failed to write nil peer payment recipient cache.", (uint8_t *)&v13, 2u);
      }
    }
    BOOL v9 = 0;
    goto LABEL_14;
  }
  id v5 = PKLogFacilityTypeGetObject(0xBuLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = PKPeerPaymentRecipientCacheArchivePath();
    int v13 = 138412290;
    v14 = v10;
    _os_log_impl(&dword_190E10000, v5, OS_LOG_TYPE_DEFAULT, "Note: Unable to write to the peer payment recipient cache at path: %@", (uint8_t *)&v13, 0xCu);
  }
  BOOL v9 = 0;
LABEL_15:

  os_unfair_lock_unlock(p_mapAccessLock);
  return v9;
}

+ (id)_instanceName
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__PKPeerPaymentRecipientCache__instanceName__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1EB403600 != -1) {
    dispatch_once(&qword_1EB403600, block);
  }
  v2 = (void *)qword_1EB4035F8;
  return v2;
}

void __44__PKPeerPaymentRecipientCache__instanceName__block_invoke()
{
  v0 = NSString;
  uint64_t v1 = (objc_class *)objc_opt_class();
  NSStringFromClass(v1);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [v0 stringWithFormat:@"%@-%i", v4, PKGetMyPid()];
  id v3 = (void *)qword_1EB4035F8;
  qword_1EB4035F8 = v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapNeedsWriteTimer, 0);
  objc_storeStrong((id *)&self->_mapContainer, 0);
}

@end