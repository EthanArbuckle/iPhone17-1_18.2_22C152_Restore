@interface SCROBrailleDisplayAutoDetector
+ (id)allocWithZone:(_NSZone *)a3;
+ (id)sharedDetector;
+ (void)initialize;
- (BOOL)_serialDataMatchesDriver:(id)a3 driverBundleIdentifiers:(id)a4 fileDescriptor:(int)a5;
- (BOOL)isAutoDetectEnabled;
- (CBCentralManager)centralManager;
- (OS_dispatch_queue)queue;
- (SCROBrailleDisplayAutoDetector)init;
- (id)_driverBundleIdentifiers;
- (id)_serialPortMatchingDictionary;
- (void)_addBLEPeripheral:(id)a3 central:(id)a4;
- (void)_autodetectIOServices:(id)a3;
- (void)_detectSerialPorts:(id)a3;
- (void)_initializeAutodetectSerialPorts:(id)a3;
- (void)_openSerialPortService:(id)a3 sortedDriverBundleIdentifiers:(id)a4;
- (void)_registerForSerialPortNotifications;
- (void)addAutodetectBLEIdentifier:(id)a3;
- (void)centralManager:(id)a3 didConnectPeripheral:(id)a4;
- (void)centralManager:(id)a3 didDisconnectPeripheral:(id)a4 error:(id)a5;
- (void)centralManager:(id)a3 didDiscoverPeripheral:(id)a4 advertisementData:(id)a5 RSSI:(id)a6;
- (void)centralManagerDidUpdateState:(id)a3;
- (void)detectDisplays;
- (void)peripheral:(id)a3 didDiscoverCharacteristicsForService:(id)a4 error:(id)a5;
- (void)peripheral:(id)a3 didDiscoverServices:(id)a4;
- (void)removeAutodetectBLEIdentifier:(id)a3;
- (void)serialPortsWerePublished:(unsigned int)a3;
- (void)setCentralManager:(id)a3;
- (void)setQueue:(id)a3;
- (void)startBLEAutodetect;
- (void)stopDetectingDisplays;
@end

@implementation SCROBrailleDisplayAutoDetector

+ (id)sharedDetector
{
  return (id)_SCROBrailleDisplayAutoDetector;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    _SCROBrailleDisplayAutoDetector = objc_alloc_init(SCROBrailleDisplayAutoDetector);
    MEMORY[0x270F9A758]();
  }
}

+ (id)allocWithZone:(_NSZone *)a3
{
  if (_SCROBrailleDisplayAutoDetector) {
    return 0;
  }
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___SCROBrailleDisplayAutoDetector;
  return objc_msgSendSuper2(&v4, sel_allocWithZone_, a3);
}

- (SCROBrailleDisplayAutoDetector)init
{
  v2 = self;
  if (!_SCROBrailleDisplayAutoDetector)
  {
    v6.receiver = self;
    v6.super_class = (Class)SCROBrailleDisplayAutoDetector;
    v2 = [(SCROBrailleDisplayAutoDetector *)&v6 init];
    if (v2)
    {
      uint64_t v3 = [MEMORY[0x263EFF980] array];
      bleIdentifiers = v2->_bleIdentifiers;
      v2->_bleIdentifiers = (NSMutableArray *)v3;
    }
  }
  return v2;
}

- (BOOL)isAutoDetectEnabled
{
  return self->_isDetectingDisplays;
}

- (id)_driverBundleIdentifiers
{
  v2 = [MEMORY[0x263F086E0] brailleDriverDeviceDetectionInfo];
  BOOL v3 = CFPreferencesGetAppBooleanValue(@"SCROBrailleDriverReverseUSBLoadOrder", (CFStringRef)*MEMORY[0x263F8B0F8], 0) != 0;
  objc_super v4 = [v2 allKeys];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __58__SCROBrailleDisplayAutoDetector__driverBundleIdentifiers__block_invoke;
  v7[3] = &__block_descriptor_33_e11_q24__0_8_16l;
  BOOL v8 = v3;
  v5 = [v4 sortedArrayUsingComparator:v7];

  return v5;
}

uint64_t __58__SCROBrailleDisplayAutoDetector__driverBundleIdentifiers__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = objc_msgSend(a2, "caseInsensitiveCompare:");
  uint64_t v4 = 1;
  if (result == 1) {
    uint64_t v5 = -1;
  }
  else {
    uint64_t v5 = result;
  }
  if (result != -1) {
    uint64_t v4 = v5;
  }
  if (*(unsigned char *)(a1 + 32)) {
    return v4;
  }
  return result;
}

- (void)detectDisplays
{
  if (!self->_isDetectingDisplays)
  {
    if (!self->_iteratorDict)
    {
      BOOL v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
      iteratorDict = self->_iteratorDict;
      self->_iteratorDict = v3;
    }
    self->_notificationPort = IONotificationPortCreate(*MEMORY[0x263F0EC88]);
    id v5 = [(SCROBrailleDisplayAutoDetector *)self _driverBundleIdentifiers];
    [(SCROBrailleDisplayAutoDetector *)self _autodetectIOServices:v5];
    [(SCROBrailleDisplayAutoDetector *)self _initializeAutodetectSerialPorts:v5];
  }
}

- (void)_openSerialPortService:(id)a3 sortedDriverBundleIdentifiers:(id)a4
{
  uint64_t v82 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  v9 = (const char *)[v8 UTF8String];
  int v74 = 0;
  memset(&v81, 0, sizeof(v81));
  int v10 = open(v9, 131078);
  if (v10 == -1)
  {
    v41 = _SCROD_LOG();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      v42 = __error();
      v43 = strerror(*v42);
      int v44 = *__error();
      *(_DWORD *)buf = 136315650;
      v76 = v9;
      __int16 v77 = 2080;
      v78 = v43;
      __int16 v79 = 1024;
      int v80 = v44;
      _os_log_impl(&dword_21C66E000, v41, OS_LOG_TYPE_DEFAULT, "Error opening serial port %s - %s(%d).\n", buf, 0x1Cu);
    }

    goto LABEL_56;
  }
  int v11 = v10;
  if (ioctl(v10, 0x2000740DuLL) == -1)
  {
    v45 = _SCROD_LOG();
    if (!os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_55;
    }
    v46 = __error();
    v47 = strerror(*v46);
    int v48 = *__error();
    *(_DWORD *)buf = 136315650;
    v76 = v9;
    __int16 v77 = 2080;
    v78 = v47;
    __int16 v79 = 1024;
    int v80 = v48;
    v49 = "Error setting TIOCEXCL on %s - %s(%d).\n";
LABEL_54:
    _os_log_impl(&dword_21C66E000, v45, OS_LOG_TYPE_DEFAULT, v49, buf, 0x1Cu);
    goto LABEL_55;
  }
  if (fcntl(v11, 4, 0) == -1)
  {
    v45 = _SCROD_LOG();
    if (!os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_55;
    }
    v50 = __error();
    v51 = strerror(*v50);
    int v52 = *__error();
    *(_DWORD *)buf = 136315650;
    v76 = v9;
    __int16 v77 = 2080;
    v78 = v51;
    __int16 v79 = 1024;
    int v80 = v52;
    v49 = "Error clearing O_NONBLOCK %s - %s(%d).\n";
    goto LABEL_54;
  }
  if (tcgetattr(v11, (termios *)gOriginalTTYAttrs) == -1)
  {
    v45 = _SCROD_LOG();
    if (!os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_55;
    }
    v53 = __error();
    v54 = strerror(*v53);
    int v55 = *__error();
    *(_DWORD *)buf = 136315650;
    v76 = v9;
    __int16 v77 = 2080;
    v78 = v54;
    __int16 v79 = 1024;
    int v80 = v55;
    v49 = "Error getting tty attributes %s - %s(%d).\n";
    goto LABEL_54;
  }
  termios v81 = *(termios *)gOriginalTTYAttrs;
  v12 = _SCROD_LOG();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v76) = cfgetispeed(&v81);
    _os_log_impl(&dword_21C66E000, v12, OS_LOG_TYPE_DEFAULT, "Current input baud rate is %d\n", buf, 8u);
  }

  v13 = _SCROD_LOG();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = cfgetospeed(&v81);
    *(_DWORD *)buf = 67109120;
    LODWORD(v76) = v14;
    _os_log_impl(&dword_21C66E000, v13, OS_LOG_TYPE_DEFAULT, "Current output baud rate is %d\n", buf, 8u);
  }

  cfmakeraw(&v81);
  *(_WORD *)&v81.c_cc[16] = 2560;
  cfsetspeed(&v81, 0x4B00uLL);
  v81.c_cflag |= 0x300uLL;
  uint64_t v73 = 14400;
  if (ioctl(v11, 0x80085402uLL, &v73) == -1)
  {
    v15 = _SCROD_LOG();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = __error();
      v17 = strerror(*v16);
      int v18 = *__error();
      *(_DWORD *)buf = 136315650;
      v76 = v9;
      __int16 v77 = 2080;
      v78 = v17;
      __int16 v79 = 1024;
      int v80 = v18;
      _os_log_impl(&dword_21C66E000, v15, OS_LOG_TYPE_DEFAULT, "Error calling ioctl(..., IOSSIOSPEED, ...) %s - %s(%d).\n", buf, 0x1Cu);
    }
  }
  v19 = _SCROD_LOG();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = cfgetispeed(&v81);
    *(_DWORD *)buf = 67109120;
    LODWORD(v76) = v20;
    _os_log_impl(&dword_21C66E000, v19, OS_LOG_TYPE_DEFAULT, "Input baud rate changed to %d\n", buf, 8u);
  }

  v21 = _SCROD_LOG();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    int v22 = cfgetospeed(&v81);
    *(_DWORD *)buf = 67109120;
    LODWORD(v76) = v22;
    _os_log_impl(&dword_21C66E000, v21, OS_LOG_TYPE_DEFAULT, "Output baud rate changed to %d\n", buf, 8u);
  }

  if (tcsetattr(v11, 0, &v81) == -1)
  {
    v45 = _SCROD_LOG();
    if (!os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_55;
    }
    v56 = __error();
    v57 = strerror(*v56);
    int v58 = *__error();
    *(_DWORD *)buf = 136315650;
    v76 = v9;
    __int16 v77 = 2080;
    v78 = v57;
    __int16 v79 = 1024;
    int v80 = v58;
    v49 = "Error setting tty attributes %s - %s(%d).\n";
    goto LABEL_54;
  }
  if (ioctl(v11, 0x20007479uLL) == -1)
  {
    v23 = _SCROD_LOG();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v24 = __error();
      v25 = strerror(*v24);
      int v26 = *__error();
      *(_DWORD *)buf = 136315650;
      v76 = v9;
      __int16 v77 = 2080;
      v78 = v25;
      __int16 v79 = 1024;
      int v80 = v26;
      _os_log_impl(&dword_21C66E000, v23, OS_LOG_TYPE_DEFAULT, "Error asserting DTR %s - %s(%d).\n", buf, 0x1Cu);
    }
  }
  if (ioctl(v11, 0x20007478uLL) == -1)
  {
    v27 = _SCROD_LOG();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      v28 = __error();
      v29 = strerror(*v28);
      int v30 = *__error();
      *(_DWORD *)buf = 136315650;
      v76 = v9;
      __int16 v77 = 2080;
      v78 = v29;
      __int16 v79 = 1024;
      int v80 = v30;
      _os_log_impl(&dword_21C66E000, v27, OS_LOG_TYPE_DEFAULT, "Error clearing DTR %s - %s(%d).\n", buf, 0x1Cu);
    }
  }
  int v74 = 294;
  if (ioctl(v11, 0x8004746DuLL, &v74) == -1)
  {
    v31 = _SCROD_LOG();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      v32 = __error();
      v33 = strerror(*v32);
      int v34 = *__error();
      *(_DWORD *)buf = 136315650;
      v76 = v9;
      __int16 v77 = 2080;
      v78 = v33;
      __int16 v79 = 1024;
      int v80 = v34;
      _os_log_impl(&dword_21C66E000, v31, OS_LOG_TYPE_DEFAULT, "Error setting handshake lines %s - %s(%d).\n", buf, 0x1Cu);
    }
  }
  if (ioctl(v11, 0x4004746AuLL, &v74) == -1)
  {
    v35 = _SCROD_LOG();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      v36 = __error();
      v37 = strerror(*v36);
      int v38 = *__error();
      *(_DWORD *)buf = 136315650;
      v76 = v9;
      __int16 v77 = 2080;
      v78 = v37;
      __int16 v79 = 1024;
      int v80 = v38;
      _os_log_impl(&dword_21C66E000, v35, OS_LOG_TYPE_DEFAULT, "Error getting handshake lines %s - %s(%d).\n", buf, 0x1Cu);
    }
  }
  v39 = _SCROD_LOG();
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v76) = v74;
    _os_log_impl(&dword_21C66E000, v39, OS_LOG_TYPE_DEFAULT, "Handshake lines currently set to %d\n", buf, 8u);
  }

  uint64_t v72 = 1;
  if (ioctl(v11, 0x80085400uLL, &v72) == -1)
  {
    v45 = _SCROD_LOG();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
    {
      v59 = __error();
      v60 = strerror(*v59);
      int v61 = *__error();
      *(_DWORD *)buf = 136315650;
      v76 = v9;
      __int16 v77 = 2080;
      v78 = v60;
      __int16 v79 = 1024;
      int v80 = v61;
      v49 = "Error setting read latency %s - %s(%d).\n";
      goto LABEL_54;
    }
LABEL_55:

    close(v11);
LABEL_56:
    int v11 = -1;
    _fd = -1;
    goto LABEL_57;
  }
  _fd = v11;
  if (v11)
  {
LABEL_57:
    v62 = MEMORY[0x263EF83A0];
    v63 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x263EF83E8], v11, 0, MEMORY[0x263EF83A0]);
    serialSource = self->_serialSource;
    self->_serialSource = v63;

    v81.c_iflag = 0;
    v81.c_oflag = (tcflag_t)&v81;
    v81.c_cflag = 0x2020000000;
    LOBYTE(v81.c_lflag) = 0;
    v65 = self->_serialSource;
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __87__SCROBrailleDisplayAutoDetector__openSerialPortService_sortedDriverBundleIdentifiers___block_invoke;
    handler[3] = &unk_264414728;
    int v71 = v11;
    handler[4] = self;
    v70 = &v81;
    id v69 = v7;
    dispatch_source_set_event_handler(v65, handler);
    dispatch_resume((dispatch_object_t)self->_serialSource);
    dispatch_time_t v66 = dispatch_time(0, 5000000000);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __87__SCROBrailleDisplayAutoDetector__openSerialPortService_sortedDriverBundleIdentifiers___block_invoke_16;
    block[3] = &unk_264414650;
    block[4] = &v81;
    dispatch_after(v66, v62, block);

    _Block_object_dispose(&v81, 8);
    goto LABEL_58;
  }
  v40 = _SCROD_LOG();
  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(v81.c_iflag) = 138412290;
    *(tcflag_t *)((char *)&v81.c_iflag + 4) = (tcflag_t)v8;
    _os_log_impl(&dword_21C66E000, v40, OS_LOG_TYPE_DEFAULT, "Could not open service: %@", (uint8_t *)&v81, 0xCu);
  }

LABEL_58:
}

void __87__SCROBrailleDisplayAutoDetector__openSerialPortService_sortedDriverBundleIdentifiers___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263EFF990] data];
  while (1)
  {
    int handle = dispatch_source_get_handle(*(dispatch_source_t *)(*(void *)(a1 + 32) + 8));
    ssize_t v4 = read(handle, buf, 0x200uLL);
    if (v4 == -1) {
      break;
    }
    uint64_t v5 = v4;
    [v2 appendBytes:buf length:v4];
    unint64_t v6 = [v2 length];
    if (v5 < 1 || v6 >= 0x11)
    {
      if (v5 < 1) {
        goto LABEL_19;
      }
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(a1 + 32) _serialDataMatchesDriver:v2 driverBundleIdentifiers:*(void *)(a1 + 40) fileDescriptor:*(unsigned int *)(a1 + 56)];
      int v8 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
      v9 = _SCROD_LOG();
      BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
      if (v8)
      {
        if (v10)
        {
          *(_WORD *)buf = 0;
          int v11 = "Found matching driver.  Will connect.";
          goto LABEL_17;
        }
      }
      else if (v10)
      {
        *(_WORD *)buf = 0;
        int v11 = "This serial device did not match.";
LABEL_17:
        _os_log_impl(&dword_21C66E000, v9, OS_LOG_TYPE_DEFAULT, v11, buf, 2u);
      }

      dispatch_source_set_event_handler(*(dispatch_source_t *)(*(void *)(a1 + 32) + 8), 0);
      dispatch_source_cancel(*(dispatch_source_t *)(*(void *)(a1 + 32) + 8));
      uint64_t v14 = *(void *)(a1 + 32);
      v15 = *(void **)(v14 + 8);
      *(void *)(v14 + 8) = 0;

      goto LABEL_19;
    }
  }
  v12 = _SCROD_LOG();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    int v13 = *(_DWORD *)(a1 + 56);
    v16[0] = 67109120;
    v16[1] = v13;
    _os_log_impl(&dword_21C66E000, v12, OS_LOG_TYPE_INFO, "Serial device: %d Could not read any data", (uint8_t *)v16, 8u);
  }

LABEL_19:
}

void __87__SCROBrailleDisplayAutoDetector__openSerialPortService_sortedDriverBundleIdentifiers___block_invoke_16(uint64_t a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __87__SCROBrailleDisplayAutoDetector__openSerialPortService_sortedDriverBundleIdentifiers___block_invoke_2;
  block[3] = &unk_264414650;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __87__SCROBrailleDisplayAutoDetector__openSerialPortService_sortedDriverBundleIdentifiers___block_invoke_2(uint64_t a1)
{
  int v1 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  uint64_t result = _fd;
  if (v1) {
    BOOL v3 = 1;
  }
  else {
    BOOL v3 = _fd == 0;
  }
  if (!v3)
  {
    tcdrain(_fd);
    int v4 = _fd;
    return close(v4);
  }
  return result;
}

- (BOOL)_serialDataMatchesDriver:(id)a3 driverBundleIdentifiers:(id)a4 fileDescriptor:(int)a5
{
  uint64_t v71 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  int v8 = [MEMORY[0x263F086E0] brailleDriverDeviceDetectionInfo];
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v61 objects:v70 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v62;
    id v45 = v9;
    v46 = v8;
    uint64_t v38 = *(void *)v62;
    do
    {
      uint64_t v12 = 0;
      uint64_t v37 = v10;
      do
      {
        if (*(void *)v62 != v11) {
          objc_enumerationMutation(v9);
        }
        uint64_t v41 = v12;
        int v13 = *(SCROIOSerialElement **)(*((void *)&v61 + 1) + 8 * v12);
        uint64_t v14 = [v8 objectForKey:v13];
        v15 = [v14 objectForKey:kSCROBrailleDriverAutoDetectDictionaries[0]];

        v16 = _SCROD_LOG();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v69 = v13;
          _os_log_impl(&dword_21C66E000, v16, OS_LOG_TYPE_DEFAULT, "Testing match for %@", buf, 0xCu);
        }

        long long v59 = 0u;
        long long v60 = 0u;
        long long v57 = 0u;
        long long v58 = 0u;
        id v17 = v15;
        uint64_t v42 = [v17 countByEnumeratingWithState:&v57 objects:v67 count:16];
        if (v42)
        {
          uint64_t v18 = *(void *)v58;
          uint64_t v39 = *(void *)v58;
          v40 = v13;
          v47 = v17;
          do
          {
            uint64_t v19 = 0;
            do
            {
              if (*(void *)v58 != v18) {
                objc_enumerationMutation(v17);
              }
              uint64_t v43 = v19;
              int v20 = [*(id *)(*((void *)&v57 + 1) + 8 * v19) objectForKeyedSubscript:kSCROBrailleDriverSerialAdvertiseBytes[0]];
              long long v53 = 0u;
              long long v54 = 0u;
              long long v55 = 0u;
              long long v56 = 0u;
              obuint64_t j = v20;
              uint64_t v21 = [obj countByEnumeratingWithState:&v53 objects:v66 count:16];
              if (v21)
              {
                uint64_t v22 = v21;
                uint64_t v23 = *(void *)v54;
                while (2)
                {
                  for (uint64_t i = 0; i != v22; ++i)
                  {
                    if (*(void *)v54 != v23) {
                      objc_enumerationMutation(obj);
                    }
                    v25 = *(void **)(*((void *)&v53 + 1) + 8 * i);
                    int v26 = [MEMORY[0x263EFF990] data];
                    long long v49 = 0u;
                    long long v50 = 0u;
                    long long v51 = 0u;
                    long long v52 = 0u;
                    v27 = [v25 componentsSeparatedByString:@"\\x"];
                    uint64_t v28 = [v27 countByEnumeratingWithState:&v49 objects:v65 count:16];
                    if (v28)
                    {
                      uint64_t v29 = v28;
                      uint64_t v30 = *(void *)v50;
                      do
                      {
                        for (uint64_t j = 0; j != v29; ++j)
                        {
                          if (*(void *)v50 != v30) {
                            objc_enumerationMutation(v27);
                          }
                          v32 = *(void **)(*((void *)&v49 + 1) + 8 * j);
                          if ([v32 length])
                          {
                            buf[0] = 0;
                            buf[0] = strtol((const char *)[v32 UTF8String], 0, 16);
                            [v26 appendBytes:buf length:1];
                          }
                        }
                        uint64_t v29 = [v27 countByEnumeratingWithState:&v49 objects:v65 count:16];
                      }
                      while (v29);
                    }

                    if (!objc_msgSend(v6, "rangeOfData:options:range:", v26, 0, 0, objc_msgSend(v6, "length")))
                    {
                      int v34 = [[SCROIOSerialElement alloc] initWithFileDescriptor:a5];
                      v35 = _SCROD_LOG();
                      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)buf = 138412290;
                        id v69 = v34;
                        _os_log_impl(&dword_21C66E000, v35, OS_LOG_TYPE_DEFAULT, "Matched element: %@", buf, 0xCu);
                      }

                      _postBrailleDisplayDetected(v40, v34);
                      BOOL v33 = 1;
                      id v9 = v45;
                      int v8 = v46;
                      goto LABEL_39;
                    }
                  }
                  uint64_t v22 = [obj countByEnumeratingWithState:&v53 objects:v66 count:16];
                  if (v22) {
                    continue;
                  }
                  break;
                }
              }

              uint64_t v19 = v43 + 1;
              id v9 = v45;
              int v8 = v46;
              id v17 = v47;
              uint64_t v18 = v39;
            }
            while (v43 + 1 != v42);
            uint64_t v42 = [v47 countByEnumeratingWithState:&v57 objects:v67 count:16];
          }
          while (v42);
        }

        uint64_t v12 = v41 + 1;
        uint64_t v11 = v38;
      }
      while (v41 + 1 != v37);
      uint64_t v10 = [v9 countByEnumeratingWithState:&v61 objects:v70 count:16];
      uint64_t v11 = v38;
      BOOL v33 = 0;
    }
    while (v10);
  }
  else
  {
    BOOL v33 = 0;
  }
LABEL_39:

  return v33;
}

- (id)_serialPortMatchingDictionary
{
  v2 = IOServiceMatching("IOSerialBSDClient");
  CFDictionarySetValue(v2, @"IOSerialBSDClientType", @"IOSerialStream");

  return v2;
}

- (void)serialPortsWerePublished:(unsigned int)a3
{
  id v4 = [(SCROBrailleDisplayAutoDetector *)self _driverBundleIdentifiers];
  [(SCROBrailleDisplayAutoDetector *)self _detectSerialPorts:v4];
}

- (void)_registerForSerialPortNotifications
{
  BOOL v3 = [(SCROBrailleDisplayAutoDetector *)self _serialPortMatchingDictionary];
  Current = CFRunLoopGetCurrent();
  RunLoopSource = IONotificationPortGetRunLoopSource(self->_notificationPort);
  CFRunLoopAddSource(Current, RunLoopSource, (CFRunLoopMode)*MEMORY[0x263EFFE88]);
  io_iterator_t notification = 0;
  notificationPort = self->_notificationPort;
  CFDictionaryRef v7 = (const __CFDictionary *)CFRetain(v3);
  if (IOServiceAddMatchingNotification(notificationPort, "IOServicePublish", v7, (IOServiceMatchingCallback)_serialPortPublishedCallback, self, &notification))
  {
    int v8 = _SCROD_LOG();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl(&dword_21C66E000, v8, OS_LOG_TYPE_DEFAULT, "Could not register for serial publish notification", v9, 2u);
    }
  }
}

- (void)_initializeAutodetectSerialPorts:(id)a3
{
  id v4 = a3;
  [(SCROBrailleDisplayAutoDetector *)self _registerForSerialPortNotifications];
  [(SCROBrailleDisplayAutoDetector *)self _detectSerialPorts:v4];
}

- (void)_detectSerialPorts:(id)a3
{
  kern_return_t v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  mach_port_t v10;
  CFDictionaryRef v11;
  kern_return_t MatchingServices;
  kern_return_t v13;
  NSObject *v14;
  io_object_t v15;
  io_registry_entry_t v16;
  CFAllocatorRef v17;
  void *CFProperty;
  NSObject *v19;
  dispatch_time_t v20;
  id v21;
  void v22[5];
  id v23;
  id v24;
  io_iterator_t existing;
  mach_port_t v26;
  uint8_t buf[4];
  kern_return_t v28;
  uint64_t v29;

  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v26 = 0;
  uint64_t v5 = MEMORY[0x21D4ACEC0](0, &v26);
  if (v5
    || ([MEMORY[0x263F08AB0] processInfo],
        id v6 = objc_claimAutoreleasedReturnValue(),
        [v6 processName],
        CFDictionaryRef v7 = objc_claimAutoreleasedReturnValue(),
        int v8 = [v7 hasPrefix:@"scrod"],
        v7,
        v6,
        (v8 & 1) == 0))
  {
    uint64_t v19 = _SCROD_LOG();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      uint64_t v28 = v5;
      _os_log_impl(&dword_21C66E000, v19, OS_LOG_TYPE_DEFAULT, "IOMainPort returned %d\n", buf, 8u);
    }
  }
  else
  {
    existing = 0;
    id v9 = [(SCROBrailleDisplayAutoDetector *)self _serialPortMatchingDictionary];
    uint64_t v10 = v26;
    uint64_t v11 = (const __CFDictionary *)CFRetain(v9);
    MatchingServices = IOServiceGetMatchingServices(v10, v11, &existing);
    if (MatchingServices)
    {
      int v13 = MatchingServices;
      uint64_t v14 = _SCROD_LOG();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        uint64_t v28 = v13;
        _os_log_impl(&dword_21C66E000, v14, OS_LOG_TYPE_DEFAULT, "IOServiceGetMatchingServices returned %d\n", buf, 8u);
      }
    }
    v15 = IOIteratorNext(existing);
    if (v15)
    {
      v16 = v15;
      id v17 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
      while (1)
      {
        CFProperty = (void *)IORegistryEntryCreateCFProperty(v16, @"IOCalloutDevice", v17, 0);
        IOObjectRelease(v16);
        if ([CFProperty hasPrefix:@"/dev/cu.usbserial"]) {
          break;
        }

        v16 = IOIteratorNext(existing);
        if (!v16) {
          goto LABEL_17;
        }
      }
      int v20 = dispatch_time(0, 5000000000);
      v22[0] = MEMORY[0x263EF8330];
      v22[1] = 3221225472;
      v22[2] = __53__SCROBrailleDisplayAutoDetector__detectSerialPorts___block_invoke;
      v22[3] = &unk_264414750;
      v22[4] = self;
      uint64_t v23 = CFProperty;
      v24 = v4;
      uint64_t v21 = CFProperty;
      dispatch_after(v20, MEMORY[0x263EF83A0], v22);
    }
LABEL_17:
  }
}

uint64_t __53__SCROBrailleDisplayAutoDetector__detectSerialPorts___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _openSerialPortService:*(void *)(a1 + 40) sortedDriverBundleIdentifiers:*(void *)(a1 + 48)];
}

- (void)_autodetectIOServices:(id)a3
{
  uint64_t v67 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v39 = [MEMORY[0x263F086E0] brailleDriverDeviceDetectionInfo];
  notificationPort = self->_notificationPort;
  if (notificationPort)
  {
    RunLoopSource = IONotificationPortGetRunLoopSource(notificationPort);
    if (RunLoopSource)
    {
      long long v61 = 0u;
      long long v62 = 0u;
      long long v59 = 0u;
      long long v60 = 0u;
      id v36 = v4;
      obuint64_t j = v4;
      uint64_t v40 = [obj countByEnumeratingWithState:&v59 objects:v66 count:16];
      if (v40)
      {
        char v6 = 0;
        uint64_t v38 = *(void *)v60;
        CFStringRef v42 = (const __CFString *)*MEMORY[0x263EFFE88];
        CFAllocatorRef allocator = (const __CFAllocator *)*MEMORY[0x263EFFB08];
        do
        {
          uint64_t v7 = 0;
          do
          {
            if (*(void *)v60 != v38) {
              objc_enumerationMutation(obj);
            }
            uint64_t v41 = v7;
            int v8 = *(void **)(*((void *)&v59 + 1) + 8 * v7);
            id v9 = [v39 objectForKey:v8];
            uint64_t v10 = [v9 objectForKey:kSCROBrailleDriverAutoDetectDictionaries[0]];

            long long v57 = 0u;
            long long v58 = 0u;
            long long v55 = 0u;
            long long v56 = 0u;
            id v44 = v10;
            uint64_t v11 = [v44 countByEnumeratingWithState:&v55 objects:v65 count:16];
            if (v11)
            {
              uint64_t v12 = v11;
              uint64_t v13 = *(void *)v56;
              do
              {
                for (uint64_t i = 0; i != v12; ++i)
                {
                  if (*(void *)v56 != v13) {
                    objc_enumerationMutation(v44);
                  }
                  v15 = *(void **)(*((void *)&v55 + 1) + 8 * i);
                  if ((v6 & 1) == 0)
                  {
                    Current = CFRunLoopGetCurrent();
                    CFRunLoopAddSource(Current, RunLoopSource, v42);
                  }
                  io_iterator_t notification = 0;
                  id v17 = [v15 objectForKeyedSubscript:@"IOProviderClass"];
                  int v18 = [v17 isEqual:@"IOUSBDevice"];

                  if (v18)
                  {
                    uint64_t v19 = (void *)[v15 mutableCopy];
                    [v19 setObject:@"IOUSBDevice" forKey:@"IOProviderClass"];
                    CFDictionaryRef Copy = CFDictionaryCreateCopy(allocator, (CFDictionaryRef)v19);
                  }
                  else
                  {
                    CFDictionaryRef Copy = CFDictionaryCreateCopy(allocator, (CFDictionaryRef)v15);
                  }
                  uint64_t v21 = IOServiceAddMatchingNotification(self->_notificationPort, "IOServiceFirstMatch", Copy, (IOServiceMatchingCallback)_connectHandler, v8, &notification);
                  if (v21)
                  {
                    NSLog(&cfstr_ErrorDWhileCre.isa, v21, v8);
                  }
                  else
                  {
                    uint64_t v22 = [NSNumber numberWithUnsignedInt:notification];
                    uint64_t v23 = [(NSMutableDictionary *)self->_iteratorDict objectForKey:v8];
                    if (v23)
                    {
                      id v24 = (id)v23;
                    }
                    else
                    {
                      id v24 = objc_alloc_init(MEMORY[0x263EFF980]);
                      [(NSMutableDictionary *)self->_iteratorDict setObject:v24 forKey:v8];
                    }
                    [v24 addObject:v22];
                  }
                  char v6 = 1;
                }
                uint64_t v12 = [v44 countByEnumeratingWithState:&v55 objects:v65 count:16];
              }
              while (v12);
            }

            uint64_t v7 = v41 + 1;
          }
          while (v41 + 1 != v40);
          uint64_t v40 = [obj countByEnumeratingWithState:&v59 objects:v66 count:16];
        }
        while (v40);
      }

      id v4 = v36;
    }
    self->_isDetectingDisplays = 1;
  }
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id v25 = v4;
  uint64_t v26 = [v25 countByEnumeratingWithState:&v50 objects:v64 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v51;
    do
    {
      for (uint64_t j = 0; j != v27; ++j)
      {
        if (*(void *)v51 != v28) {
          objc_enumerationMutation(v25);
        }
        uint64_t v30 = *(void **)(*((void *)&v50 + 1) + 8 * j);
        long long v46 = 0u;
        long long v47 = 0u;
        long long v48 = 0u;
        long long v49 = 0u;
        v31 = [(NSMutableDictionary *)self->_iteratorDict objectForKey:v30];
        uint64_t v32 = [v31 countByEnumeratingWithState:&v46 objects:v63 count:16];
        if (v32)
        {
          uint64_t v33 = v32;
          uint64_t v34 = *(void *)v47;
          do
          {
            for (uint64_t k = 0; k != v33; ++k)
            {
              if (*(void *)v47 != v34) {
                objc_enumerationMutation(v31);
              }
              _connectHandler(v30, [*(id *)(*((void *)&v46 + 1) + 8 * k) unsignedIntValue]);
            }
            uint64_t v33 = [v31 countByEnumeratingWithState:&v46 objects:v63 count:16];
          }
          while (v33);
        }
      }
      uint64_t v27 = [v25 countByEnumeratingWithState:&v50 objects:v64 count:16];
    }
    while (v27);
  }
}

- (void)stopDetectingDisplays
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  notificationPort = self->_notificationPort;
  if (notificationPort) {
    IONotificationPortDestroy(notificationPort);
  }
  self->_notificationPort = 0;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v4 = self->_iteratorDict;
  uint64_t v5 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v21;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v20 + 1) + 8 * v8);
        long long v16 = 0u;
        long long v17 = 0u;
        long long v18 = 0u;
        long long v19 = 0u;
        uint64_t v10 = -[NSMutableDictionary objectForKey:](self->_iteratorDict, "objectForKey:", v9, 0);
        uint64_t v11 = [v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v17;
          do
          {
            uint64_t v14 = 0;
            do
            {
              if (*(void *)v17 != v13) {
                objc_enumerationMutation(v10);
              }
              IOObjectRelease([*(id *)(*((void *)&v16 + 1) + 8 * v14++) unsignedIntValue]);
            }
            while (v12 != v14);
            uint64_t v12 = [v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
          }
          while (v12);
        }

        ++v8;
      }
      while (v8 != v6);
      uint64_t v6 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v6);
  }

  iteratorDict = self->_iteratorDict;
  self->_iteratorDict = 0;

  self->_isDetectingDisplays = 0;
}

- (void)removeAutodetectBLEIdentifier:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = _SCROD_BRAILLE_LOG();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v25 = v4;
    _os_log_impl(&dword_21C66E000, v5, OS_LOG_TYPE_DEFAULT, "Stop autodetecting ble: %@", buf, 0xCu);
  }

  if ([v4 length])
  {
    [(NSMutableArray *)self->_bleIdentifiers removeObject:v4];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v18 = self;
    uint64_t v6 = [(SCROBrailleDisplayAutoDetector *)self centralManager];
    uint64_t v7 = [v6 retrieveConnectedPeripheralsWithServices:0 allowAll:1];

    uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v20;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v20 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          uint64_t v13 = _SCROD_BRAILLE_LOG();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v25 = v12;
            _os_log_impl(&dword_21C66E000, v13, OS_LOG_TYPE_DEFAULT, "Checking peripheral %@", buf, 0xCu);
          }

          uint64_t v14 = [v12 identifier];
          v15 = [v14 UUIDString];
          int v16 = [v4 isEqualToString:v15];

          if (v16)
          {
            long long v17 = [(SCROBrailleDisplayAutoDetector *)v18 centralManager];
            [v17 cancelPeripheralConnection:v12];

            if (libAccessibilityLibraryCore()) {
              soft__AXSVoiceOverTouchSetTactileGraphicsDisplay(0);
            }
            goto LABEL_17;
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
LABEL_17:
  }
}

- (void)addAutodetectBLEIdentifier:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = (CBCentralManager *)a3;
  if (!self->_centralManager)
  {
    uint64_t v5 = _SCROD_LOG();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      centralManager = self->_centralManager;
      *(_DWORD *)buf = 138412290;
      uint64_t v29 = centralManager;
      _os_log_impl(&dword_21C66E000, v5, OS_LOG_TYPE_DEFAULT, "Auto detect BTLE devices: %@", buf, 0xCu);
    }

    uint64_t v7 = (CBCentralManager *)[objc_alloc(MEMORY[0x263EFEF00]) initWithDelegate:self queue:0];
    uint64_t v8 = self->_centralManager;
    self->_centralManager = v7;
  }
  uint64_t v9 = _SCROD_BRAILLE_LOG();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v29 = v4;
    _os_log_impl(&dword_21C66E000, v9, OS_LOG_TYPE_DEFAULT, "Autodetect ble: %@", buf, 0xCu);
  }

  if (v4 && ([(NSMutableArray *)self->_bleIdentifiers containsObject:v4] & 1) == 0) {
    [(NSMutableArray *)self->_bleIdentifiers addObject:v4];
  }
  long long v22 = v4;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v10 = [(SCROBrailleDisplayAutoDetector *)self centralManager];
  uint64_t v11 = [v10 retrieveConnectedPeripheralsWithServices:0 allowAll:1];

  uint64_t v12 = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v24 != v14) {
          objc_enumerationMutation(v11);
        }
        int v16 = *(CBCentralManager **)(*((void *)&v23 + 1) + 8 * i);
        long long v17 = _SCROD_BRAILLE_LOG();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v29 = v16;
          _os_log_impl(&dword_21C66E000, v17, OS_LOG_TYPE_DEFAULT, "Checking peripheral %@", buf, 0xCu);
        }

        bleIdentifiers = self->_bleIdentifiers;
        long long v19 = [(CBCentralManager *)v16 identifier];
        long long v20 = [v19 UUIDString];
        LODWORD(bleIdentifiers) = [(NSMutableArray *)bleIdentifiers containsObject:v20];

        if (bleIdentifiers)
        {
          long long v21 = [(SCROBrailleDisplayAutoDetector *)self centralManager];
          [(SCROBrailleDisplayAutoDetector *)self _addBLEPeripheral:v16 central:v21];
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v13);
  }
}

- (void)startBLEAutodetect
{
}

- (void)centralManagerDidUpdateState:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 state];
  if (v5 == 5)
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    uint64_t v6 = [(SCROBrailleDisplayAutoDetector *)self centralManager];
    uint64_t v7 = [v6 retrieveConnectedPeripheralsWithServices:0 allowAll:1];

    uint64_t v8 = [v7 countByEnumeratingWithState:&v24 objects:v34 count:16];
    if (v8)
    {
      uint64_t v10 = v8;
      uint64_t v11 = *(void *)v25;
      *(void *)&long long v9 = 138412290;
      long long v23 = v9;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v25 != v11) {
            objc_enumerationMutation(v7);
          }
          uint64_t v13 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          bleIdentifiers = self->_bleIdentifiers;
          v15 = objc_msgSend(v13, "identifier", v23);
          int v16 = [v15 UUIDString];
          LODWORD(bleIdentifiers) = [(NSMutableArray *)bleIdentifiers containsObject:v16];

          if (bleIdentifiers)
          {
            long long v17 = _SCROD_BRAILLE_LOG();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v23;
              id v31 = v13;
              _os_log_impl(&dword_21C66E000, v17, OS_LOG_TYPE_DEFAULT, "Checking peripheral power on %@", buf, 0xCu);
            }

            [(SCROBrailleDisplayAutoDetector *)self _addBLEPeripheral:v13 central:v4];
          }
        }
        uint64_t v10 = [v7 countByEnumeratingWithState:&v24 objects:v34 count:16];
      }
      while (v10);
    }

    uint64_t v18 = [v4 isScanning];
    long long v19 = _SCROD_LOG();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      long long v20 = [NSNumber numberWithBool:v18];
      *(_DWORD *)buf = 138412546;
      id v31 = v4;
      __int16 v32 = 2112;
      uint64_t v33 = v20;
      _os_log_impl(&dword_21C66E000, v19, OS_LOG_TYPE_DEFAULT, "Starting scan: %@ scanning: %@", buf, 0x16u);
    }
    if ((v18 & 1) == 0)
    {
      [v4 setDelegate:self];
      uint64_t v21 = *MEMORY[0x263EFEE70];
      v28[0] = *MEMORY[0x263EFED50];
      v28[1] = v21;
      v29[0] = MEMORY[0x263EFFA88];
      v29[1] = MEMORY[0x263EFFA88];
      long long v22 = [NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:2];
      [v4 scanForPeripheralsWithServices:0 options:v22];
    }
  }
  else if (v5 == 4)
  {
    [v4 stopScan];
  }
}

- (void)_addBLEPeripheral:(id)a3 central:(id)a4
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = _SCROD_LOG();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    long long v9 = [v6 name];
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v6;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v9;
    _os_log_impl(&dword_21C66E000, v8, OS_LOG_TYPE_DEFAULT, "Trying to add peripheral %@ %@", buf, 0x16u);
  }
  uint64_t v10 = [v6 name];
  int v11 = [v10 hasPrefix:@"DotPad"];

  uint64_t v12 = [v6 name];
  int v13 = [v12 hasPrefix:@"DotPocket"];

  if ((v11 | v13) == 1)
  {
    uint64_t v14 = [[SCROIODotPadElement alloc] initWithCentral:v7 peripheral:v6];
    v15 = _SCROD_LOG();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v14;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v6;
      _os_log_impl(&dword_21C66E000, v15, OS_LOG_TYPE_DEFAULT, "Matched dot pad element: %@ %@", buf, 0x16u);
    }

    if (v11 && libAccessibilityLibraryCore())
    {
      uint64_t v27 = 0;
      uint64_t v28 = &v27;
      uint64_t v29 = 0x2020000000;
      int v16 = (uint64_t (*)(uint64_t))get_AXSVoiceOverTouchCopyTactileGraphicsDisplaySymbolLoc_ptr;
      uint64_t v30 = get_AXSVoiceOverTouchCopyTactileGraphicsDisplaySymbolLoc_ptr;
      if (!get_AXSVoiceOverTouchCopyTactileGraphicsDisplaySymbolLoc_ptr)
      {
        *(void *)buf = MEMORY[0x263EF8330];
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = __get_AXSVoiceOverTouchCopyTactileGraphicsDisplaySymbolLoc_block_invoke;
        __int16 v32 = &unk_264414650;
        uint64_t v33 = &v27;
        long long v17 = (void *)libAccessibilityLibrary();
        uint64_t v18 = dlsym(v17, "_AXSVoiceOverTouchCopyTactileGraphicsDisplay");
        *(void *)(v33[1] + 24) = v18;
        get_AXSVoiceOverTouchCopyTactileGraphicsDisplaySymbolLoc_ptr = *(_UNKNOWN **)(v33[1] + 24);
        int v16 = (uint64_t (*)(uint64_t))v28[3];
      }
      _Block_object_dispose(&v27, 8);
      if (!v16) {
        -[SCROBrailleDisplayAutoDetector _addBLEPeripheral:central:]();
      }
      long long v20 = (void *)v16(v19);
      uint64_t v21 = objc_msgSend(v6, "identifier", v27);
      long long v22 = [v21 UUIDString];
      char v23 = [v20 isEqualToString:v22];

      if ((v23 & 1) == 0)
      {
        long long v24 = [v6 identifier];
        long long v25 = [v24 UUIDString];
        soft__AXSVoiceOverTouchSetTactileGraphicsDisplay((uint64_t)v25);
      }
    }
    long long v26 = [(SCROIODotPadElement *)v14 dotFamilyIdentifier];
    _postBrailleDisplayDetected(v26, v14);
  }
  else
  {
    [v7 connectPeripheral:v6 options:0];
    if (([(NSMutableArray *)self->_connectedPeripherals containsObject:v6] & 1) == 0) {
      [(NSMutableArray *)self->_connectedPeripherals addObject:v6];
    }
  }
}

- (void)centralManager:(id)a3 didConnectPeripheral:(id)a4
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = _SCROD_LOG();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v5;
    _os_log_impl(&dword_21C66E000, v6, OS_LOG_TYPE_DEFAULT, "Did connect periperhal: %@", (uint8_t *)&v9, 0xCu);
  }

  id v7 = [v5 name];
  char v8 = [v7 hasPrefix:@"DotPad"];

  if ((v8 & 1) == 0)
  {
    [v5 setDelegate:self];
    [v5 discoverServices:0];
  }
}

- (void)peripheral:(id)a3 didDiscoverServices:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 name];
  char v6 = [v5 hasPrefix:@"DotPad"];

  if ((v6 & 1) == 0)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v7 = objc_msgSend(v4, "services", 0);
    uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v13;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(v7);
          }
          [v4 discoverCharacteristics:0 forService:*(void *)(*((void *)&v12 + 1) + 8 * v11++)];
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v9);
    }
  }
}

- (void)peripheral:(id)a3 didDiscoverCharacteristicsForService:(id)a4 error:(id)a5
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 name];
  char v9 = [v8 hasPrefix:@"DotPad"];

  if ((v9 & 1) == 0)
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v10 = objc_msgSend(v7, "characteristics", 0);
    uint64_t v11 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v17 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void *)(*((void *)&v16 + 1) + 8 * i);
          [v6 readValueForCharacteristic:v15];
          [v6 setNotifyValue:1 forCharacteristic:v15];
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v12);
    }
  }
}

- (void)centralManager:(id)a3 didDiscoverPeripheral:(id)a4 advertisementData:(id)a5 RSSI:(id)a6
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  bleIdentifiers = self->_bleIdentifiers;
  uint64_t v11 = [v9 identifier];
  uint64_t v12 = [v11 UUIDString];
  LODWORD(bleIdentifiers) = [(NSMutableArray *)bleIdentifiers containsObject:v12];

  if (bleIdentifiers)
  {
    [v8 stopScan];
    uint64_t v13 = _SCROD_BRAILLE_LOG();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138412290;
      id v15 = v9;
      _os_log_impl(&dword_21C66E000, v13, OS_LOG_TYPE_DEFAULT, "Discovered periperhal %@", (uint8_t *)&v14, 0xCu);
    }

    [(SCROBrailleDisplayAutoDetector *)self _addBLEPeripheral:v9 central:v8];
  }
}

- (void)centralManager:(id)a3 didDisconnectPeripheral:(id)a4 error:(id)a5
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = _SCROD_LOG();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    bleIdentifiers = self->_bleIdentifiers;
    int v15 = 138412546;
    uint64_t v16 = bleIdentifiers;
    __int16 v17 = 2112;
    id v18 = v8;
    _os_log_impl(&dword_21C66E000, v9, OS_LOG_TYPE_DEFAULT, "Peripheral disconnected that we're monitoring, rescanning: %@ %@", (uint8_t *)&v15, 0x16u);
  }

  uint64_t v11 = self->_bleIdentifiers;
  uint64_t v12 = [v8 identifier];
  uint64_t v13 = [v12 UUIDString];
  LODWORD(v11) = [(NSMutableArray *)v11 containsObject:v13];

  if (v11)
  {
    [(SCROBrailleDisplayAutoDetector *)self centralManagerDidUpdateState:v7];
    int v14 = _SCROD_LOG();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v15) = 0;
      _os_log_impl(&dword_21C66E000, v14, OS_LOG_TYPE_DEFAULT, "Peripheral disconnected that we're monitoring, rescanning", (uint8_t *)&v15, 2u);
    }
  }
  [(NSMutableArray *)self->_connectedPeripherals removeObject:v8];
}

- (CBCentralManager)centralManager
{
  return (CBCentralManager *)objc_getProperty(self, a2, 56, 1);
}

- (void)setCentralManager:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 64, 1);
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_centralManager, 0);
  objc_storeStrong((id *)&self->_bleIdentifiers, 0);
  objc_storeStrong((id *)&self->_connectedPeripherals, 0);
  objc_storeStrong((id *)&self->_iteratorDict, 0);

  objc_storeStrong((id *)&self->_serialSource, 0);
}

- (void)_addBLEPeripheral:central:.cold.1()
{
  v0 = [MEMORY[0x263F08690] currentHandler];
  int v1 = [NSString stringWithUTF8String:"CFStringRef soft__AXSVoiceOverTouchCopyTactileGraphicsDisplay(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SCROBrailleDisplayAutoDetector.m", 47, @"%s", dlerror());

  __break(1u);
}

@end