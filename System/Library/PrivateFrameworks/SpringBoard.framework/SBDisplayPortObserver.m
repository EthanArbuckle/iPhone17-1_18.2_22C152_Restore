@interface SBDisplayPortObserver
- (BOOL)isDisplayPortConnected;
- (BOOL)matchingNotificationsStarted;
- (BOOL)startMatchingNotifications;
- (IONotificationPort)ioNotificationPort;
- (NSMutableDictionary)transportNotifiers;
- (OS_dispatch_queue)queue;
- (SBDisplayPortObserver)init;
- (SBDisplayPortObserverDelegate)delegate;
- (unsigned)ioServiceAddedIterator;
- (void)_addTransportNotificationForService:(unsigned int)a3 andRegistryEntryID:(unint64_t)a4;
- (void)_handleNotificationForService:(unsigned int)a3 messageType:(unsigned int)a4 messageArgument:(void *)a5;
- (void)_handleServiceAdded:(unsigned int)a3;
- (void)_notifyDelegate;
- (void)_removeTransportNotificationForRegistryEntryID:(unint64_t)a3;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)setIONotificationPort:(IONotificationPort *)a3;
- (void)setIoServiceAddedIterator:(unsigned int)a3;
- (void)setMatchingNotificationsStarted:(BOOL)a3;
- (void)setQueue:(id)a3;
- (void)setTransportNotifiers:(id)a3;
- (void)stopMatchingNotifications;
@end

@implementation SBDisplayPortObserver

- (SBDisplayPortObserver)init
{
  v8.receiver = self;
  v8.super_class = (Class)SBDisplayPortObserver;
  v2 = [(SBDisplayPortObserver *)&v8 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("SBDisplayPortObserver", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v2->_ioNotificationPort = 0;
    v2->_ioServiceAddedIterator = 0;
    v2->_matchingNotificationsStarted = 0;
    uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
    transportNotifiers = v2->_transportNotifiers;
    v2->_transportNotifiers = (NSMutableDictionary *)v5;
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  dispatch_queue_t v3 = SBLogVideoOut();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (objc_class *)objc_opt_class();
    uint64_t v5 = NSStringFromClass(v4);
    *(_DWORD *)buf = 138543362;
    objc_super v8 = v5;
    _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_DEFAULT, "[SBDisplayPortObserver] Deallocating %{public}@...", buf, 0xCu);
  }
  [(SBDisplayPortObserver *)self stopMatchingNotifications];
  v6.receiver = self;
  v6.super_class = (Class)SBDisplayPortObserver;
  [(SBDisplayPortObserver *)&v6 dealloc];
}

- (BOOL)startMatchingNotifications
{
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  dispatch_queue_t v3 = SBLogVideoOut();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_DEFAULT, "[SBDisplayPortObserver] Adding transport matching notifications...", buf, 2u);
  }

  v4 = [(SBDisplayPortObserver *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51__SBDisplayPortObserver_startMatchingNotifications__block_invoke;
  v7[3] = &unk_1E6AF52B8;
  v7[4] = self;
  v7[5] = &v9;
  dispatch_sync(v4, v7);

  char v5 = *((unsigned char *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  return v5;
}

void __51__SBDisplayPortObserver_startMatchingNotifications__block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) matchingNotificationsStarted]) {
    [*(id *)(a1 + 32) stopMatchingNotifications];
  }
  [*(id *)(a1 + 32) setIONotificationPort:IONotificationPortCreate(*MEMORY[0x1E4F2EEF0])];
  v2 = (IONotificationPort *)[*(id *)(a1 + 32) ioNotificationPort];
  dispatch_queue_t v3 = [*(id *)(a1 + 32) queue];
  IONotificationPortSetDispatchQueue(v2, v3);

  CFMutableDictionaryRef v4 = IOServiceMatching("IOPortTransportState");
  [(__CFDictionary *)v4 setObject:&unk_1F334B998 forKey:@"IOPropertyMatch"];
  CFMutableDictionaryRef v5 = IOServiceMatching("IOPort");
  [(__CFDictionary *)v5 setObject:&unk_1F334B9C0 forKey:@"IOPropertyMatch"];
  [(__CFDictionary *)v4 setObject:v5 forKey:@"IOParentMatch"];
  NSLog(&cfstr_Matchingdict.isa, v4);
  objc_super v6 = (IONotificationPort *)[*(id *)(a1 + 32) ioNotificationPort];
  CFDictionaryRef v7 = v4;
  uint64_t v8 = IOServiceAddMatchingNotification(v6, "IOServiceMatched", v7, (IOServiceMatchingCallback)_serviceAdded, *(void **)(a1 + 32), (io_iterator_t *)(*(void *)(a1 + 32) + 12));
  if (v8)
  {
    uint64_t v9 = v8;
    v10 = SBLogVideoOut();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __51__SBDisplayPortObserver_startMatchingNotifications__block_invoke_cold_1(v9, v10, v11, v12, v13, v14, v15, v16);
    }
  }
  else
  {
    _serviceAdded(*(void **)(a1 + 32), [*(id *)(a1 + 32) ioServiceAddedIterator]);
    [*(id *)(a1 + 32) setMatchingNotificationsStarted:1];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
}

- (void)stopMatchingNotifications
{
  dispatch_queue_t v3 = SBLogVideoOut();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_DEFAULT, "[SBDisplayPortObserver] Removing transport matching notifications...", buf, 2u);
  }

  CFMutableDictionaryRef v4 = [(SBDisplayPortObserver *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__SBDisplayPortObserver_stopMatchingNotifications__block_invoke;
  block[3] = &unk_1E6AF4AC0;
  block[4] = self;
  dispatch_sync(v4, block);
}

uint64_t __50__SBDisplayPortObserver_stopMatchingNotifications__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) transportNotifiers];
  [v2 enumerateKeysAndObjectsUsingBlock:&__block_literal_global_7];

  dispatch_queue_t v3 = [*(id *)(a1 + 32) transportNotifiers];
  [v3 removeAllObjects];

  io_object_t v4 = [*(id *)(a1 + 32) ioServiceAddedIterator];
  if (v4) {
    IOObjectRelease(v4);
  }
  CFMutableDictionaryRef v5 = (IONotificationPort *)[*(id *)(a1 + 32) ioNotificationPort];
  if (v5) {
    IONotificationPortDestroy(v5);
  }
  objc_super v6 = *(void **)(a1 + 32);
  return [v6 setMatchingNotificationsStarted:0];
}

void __50__SBDisplayPortObserver_stopMatchingNotifications__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      io_object_t v5 = [v4 unsignedIntValue];
      if (v5) {
        IOObjectRelease(v5);
      }
    }
  }
}

- (BOOL)isDisplayPortConnected
{
  v2 = [(SBDisplayPortObserver *)self transportNotifiers];
  dispatch_queue_t v3 = [v2 allKeys];
  BOOL v4 = [v3 count] != 0;

  return v4;
}

- (void)_handleServiceAdded:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t entryID = 0;
  uint64_t RegistryEntryID = IORegistryEntryGetRegistryEntryID(a3, &entryID);
  if (RegistryEntryID)
  {
    uint64_t v6 = RegistryEntryID;
    CFProperty = SBLogVideoOut();
    if (os_log_type_enabled(CFProperty, OS_LOG_TYPE_ERROR)) {
      -[SBDisplayPortObserver _handleServiceAdded:](v6, CFProperty, v8, v9, v10, v11, v12, v13);
    }
  }
  else
  {
    uint64_t v14 = [(SBDisplayPortObserver *)self transportNotifiers];
    uint64_t v15 = [NSNumber numberWithUnsignedLongLong:entryID];
    uint64_t v16 = [v14 objectForKeyedSubscript:v15];

    if (v16)
    {
      CFProperty = SBLogVideoOut();
      if (os_log_type_enabled(CFProperty, OS_LOG_TYPE_DEBUG)) {
        -[SBDisplayPortObserver _handleServiceAdded:]((uint64_t *)&entryID, CFProperty);
      }
    }
    else
    {
      CFProperty = IORegistryEntryCreateCFProperty(v3, @"TransportDescription", (CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0);
      v17 = SBLogVideoOut();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v21 = entryID;
        _os_log_impl(&dword_1D85BA000, v17, OS_LOG_TYPE_DEFAULT, "[SBDisplayPortObserver] Adding transport interest notifications... (registryEntryID: %llu)", buf, 0xCu);
      }

      v18 = SBLogVideoOut();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
        [(SBDisplayPortObserver *)(uint64_t)CFProperty _handleServiceAdded:v18];
      }

      [(SBDisplayPortObserver *)self _addTransportNotificationForService:v3 andRegistryEntryID:entryID];
    }
  }
}

- (void)_handleNotificationForService:(unsigned int)a3 messageType:(unsigned int)a4 messageArgument:(void *)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t entryID = 0;
  uint64_t RegistryEntryID = IORegistryEntryGetRegistryEntryID(a3, &entryID);
  if (RegistryEntryID)
  {
    uint64_t v9 = RegistryEntryID;
    CFProperty = SBLogVideoOut();
    if (os_log_type_enabled(CFProperty, OS_LOG_TYPE_ERROR)) {
      -[SBDisplayPortObserver _handleServiceAdded:](v9, CFProperty, v11, v12, v13, v14, v15, v16);
    }
    goto LABEL_15;
  }
  CFProperty = IORegistryEntryCreateCFProperty(a3, @"TransportDescription", (CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0);
  if (a4 != -536870896)
  {
    if (a4 == -536870608)
    {
      v17 = SBLogVideoOut();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v24 = CFProperty;
        __int16 v25 = 2048;
        uint64_t v26 = entryID;
        v18 = "[SBDisplayPortObserver] messageType: kIOMessageServicePropertyChange, transportDescription: %@, registryEntryID: %llu";
        v19 = v17;
        uint32_t v20 = 22;
LABEL_13:
        _os_log_impl(&dword_1D85BA000, v19, OS_LOG_TYPE_DEFAULT, v18, buf, v20);
      }
    }
    else
    {
      v17 = SBLogVideoOut();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v24) = a4;
        v18 = "[SBDisplayPortObserver] messageType: %u";
        v19 = v17;
        uint32_t v20 = 8;
        goto LABEL_13;
      }
    }

    goto LABEL_15;
  }
  uint64_t v21 = SBLogVideoOut();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v24 = CFProperty;
    __int16 v25 = 2048;
    uint64_t v26 = entryID;
    _os_log_impl(&dword_1D85BA000, v21, OS_LOG_TYPE_DEFAULT, "[SBDisplayPortObserver] messageType: kIOMessageServiceIsTerminated, transportDescription: %@, registryEntryID: %llu)", buf, 0x16u);
  }

  [(SBDisplayPortObserver *)self _removeTransportNotificationForRegistryEntryID:entryID];
LABEL_15:
}

- (void)_addTransportNotificationForService:(unsigned int)a3 andRegistryEntryID:(unint64_t)a4
{
  BOOL v7 = [(SBDisplayPortObserver *)self isDisplayPortConnected];
  io_object_t notification = 0;
  IOServiceAddInterestNotification([(SBDisplayPortObserver *)self ioNotificationPort], a3, "IOGeneralInterest", (IOServiceInterestCallback)_serviceNotification, self, &notification);
  if (notification)
  {
    uint64_t v8 = [(SBDisplayPortObserver *)self transportNotifiers];
    uint64_t v9 = [NSNumber numberWithUnsignedInt:notification];
    uint64_t v10 = [NSNumber numberWithUnsignedLongLong:a4];
    [v8 setObject:v9 forKey:v10];

    if (v7 != [(SBDisplayPortObserver *)self isDisplayPortConnected]) {
      [(SBDisplayPortObserver *)self _notifyDelegate];
    }
  }
}

- (void)_removeTransportNotificationForRegistryEntryID:(unint64_t)a3
{
  BOOL v5 = [(SBDisplayPortObserver *)self isDisplayPortConnected];
  id v11 = [(SBDisplayPortObserver *)self transportNotifiers];
  uint64_t v6 = [NSNumber numberWithUnsignedLongLong:a3];
  BOOL v7 = [v11 objectForKeyedSubscript:v6];

  if (v7)
  {
    uint64_t v8 = [(SBDisplayPortObserver *)self transportNotifiers];
    uint64_t v9 = [NSNumber numberWithUnsignedLongLong:a3];
    [v8 removeObjectForKey:v9];

    io_object_t v10 = [v7 unsignedIntValue];
    if (v10) {
      IOObjectRelease(v10);
    }
    if (v5 != [(SBDisplayPortObserver *)self isDisplayPortConnected]) {
      [(SBDisplayPortObserver *)self _notifyDelegate];
    }
  }
}

- (void)_notifyDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "displayPortObserver:connectionStateChanged:", self, -[SBDisplayPortObserver isDisplayPortConnected](self, "isDisplayPortConnected"));
}

- (SBDisplayPortObserverDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBDisplayPortObserverDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (IONotificationPort)ioNotificationPort
{
  return self->_ioNotificationPort;
}

- (void)setIONotificationPort:(IONotificationPort *)a3
{
  self->_ioNotificationPort = a3;
}

- (unsigned)ioServiceAddedIterator
{
  return self->_ioServiceAddedIterator;
}

- (void)setIoServiceAddedIterator:(unsigned int)a3
{
  self->_ioServiceAddedIterator = a3;
}

- (BOOL)matchingNotificationsStarted
{
  return self->_matchingNotificationsStarted;
}

- (void)setMatchingNotificationsStarted:(BOOL)a3
{
  self->_matchingNotificationsStarted = a3;
}

- (NSMutableDictionary)transportNotifiers
{
  return self->_transportNotifiers;
}

- (void)setTransportNotifiers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transportNotifiers, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __51__SBDisplayPortObserver_startMatchingNotifications__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_handleServiceAdded:(os_log_t)log .cold.1(uint64_t a1, uint64_t *a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *a2;
  int v4 = 138412546;
  uint64_t v5 = a1;
  __int16 v6 = 2048;
  uint64_t v7 = v3;
  _os_log_debug_impl(&dword_1D85BA000, log, OS_LOG_TYPE_DEBUG, "[SBDisplayPortObserver] Transport matched! (transportDescription: %@, registryEntryID: %llu)", (uint8_t *)&v4, 0x16u);
}

- (void)_handleServiceAdded:(uint64_t *)a1 .cold.2(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 134217984;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_DEBUG, "[SBDisplayPortObserver] Port object already exists for service, ignoring... (registryEntryID: %llu)", (uint8_t *)&v3, 0xCu);
}

- (void)_handleServiceAdded:(uint64_t)a3 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end