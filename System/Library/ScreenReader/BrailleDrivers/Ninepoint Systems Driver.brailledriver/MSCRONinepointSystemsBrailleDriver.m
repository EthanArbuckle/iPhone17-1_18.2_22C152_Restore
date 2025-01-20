@interface MSCRONinepointSystemsBrailleDriver
- (BOOL)isDriverLoaded;
- (BOOL)isInputEnabled;
- (BOOL)isSleeping;
- (BOOL)postsKeyboardEvents;
- (BOOL)setMainCells:(const char *)a3 length:(int64_t)a4;
- (BOOL)setStatusCells:(const char *)a3 length:(int64_t)a4;
- (BOOL)supportsBlinkingCursor;
- (BOOL)unloadDriver;
- (MSCRONinepointSystemsBrailleDriver)init;
- (id)getInputEvents;
- (id)modelIdentifier;
- (int)brailleInputMode;
- (int)loadDriverWithIOElement:(id)a3;
- (int64_t)mainSize;
- (int64_t)statusSize;
- (unint64_t)interfaceVersion;
- (void)dealloc;
- (void)fileReader:(id)a3 data:(const void *)a4 length:(unint64_t)a5;
- (void)removeDeviceNotification:(id)a3;
- (void)setBrailleDriverDelegate:(id)a3;
@end

@implementation MSCRONinepointSystemsBrailleDriver

- (MSCRONinepointSystemsBrailleDriver)init
{
  v3.receiver = self;
  v3.super_class = (Class)MSCRONinepointSystemsBrailleDriver;
  result = [(MSCRONinepointSystemsBrailleDriver *)&v3 init];
  if (result)
  {
    result->_isDriverLoaded = 0;
    result->_comPort = -1;
  }
  return result;
}

- (void)dealloc
{
  [(MSCRONinepointSystemsBrailleDriver *)self unloadDriver];
  v3.receiver = self;
  v3.super_class = (Class)MSCRONinepointSystemsBrailleDriver;
  [(MSCRONinepointSystemsBrailleDriver *)&v3 dealloc];
}

- (unint64_t)interfaceVersion
{
  return 4;
}

- (int)loadDriverWithIOElement:(id)a3
{
  id v4 = a3;
  v5 = +[AXSubsystemBrailleHardware sharedInstance];
  unsigned __int8 v6 = [v5 ignoreLogging];

  if ((v6 & 1) == 0)
  {
    v7 = +[AXSubsystemBrailleHardware identifier];
    v8 = AXLoggerForFacility();

    os_log_type_t v9 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v8, v9))
    {
      v10 = AXColorizeFormatLog();
      v11 = _AXStringForArgs();
      if (os_log_type_enabled(v8, v9))
      {
        *(_DWORD *)buf = 138543362;
        v120 = v11;
        _os_log_impl(&dword_0, v8, v9, "%{public}@", buf, 0xCu);
      }
    }
  }
  if ([v4 conformsToProtocol:&OBJC_PROTOCOL___SCROIOBluetoothElementProtocol]
    && [v4 transport] == 2)
  {
    v12 = +[NSBundle bundleForClass:objc_opt_class()];
    v13 = [v12 bundleIdentifier];

    if (v13)
    {
      if (self->_isDriverLoaded) {
        [(MSCRONinepointSystemsBrailleDriver *)self unloadDriver];
      }
      v109 = self;
      v110 = [v12 infoDictionary];
      [v110 objectForKey:kSCROBrailleDriverModels];
      v112 = id v111 = v4;
      v14 = [v4 bluetoothAddress];
      long long v113 = 0u;
      long long v114 = 0u;
      long long v115 = 0u;
      long long v116 = 0u;
      v15 = +[BluetoothManager sharedInstance];
      v16 = [v15 pairedDevices];

      id v17 = [v16 countByEnumeratingWithState:&v113 objects:v121 count:16];
      if (v17)
      {
        id v18 = v17;
        uint64_t v19 = *(void *)v114;
LABEL_14:
        uint64_t v20 = 0;
        while (1)
        {
          if (*(void *)v114 != v19) {
            objc_enumerationMutation(v16);
          }
          v21 = *(void **)(*((void *)&v113 + 1) + 8 * v20);
          v22 = [v21 address];
          unsigned __int8 v23 = [v22 isEqualToString:v14];

          if (v23) {
            break;
          }
          if (v18 == (id)++v20)
          {
            id v18 = [v16 countByEnumeratingWithState:&v113 objects:v121 count:16];
            if (v18) {
              goto LABEL_14;
            }
            goto LABEL_20;
          }
        }
        v31 = v21;

        if (!v31) {
          goto LABEL_35;
        }
        v32 = +[NSNotificationCenter defaultCenter];
        [v32 addObserver:v109 selector:"removeDeviceNotification:" name:BluetoothDeviceDisconnectSuccessNotification object:0];
        [v32 addObserver:v109 selector:"removeDeviceNotification:" name:BluetoothDeviceDisconnectFailedNotification object:0];
        if ([v31 connected])
        {
          [v31 device];
          int ComPortForServiceWithSandboxExtension = BTDeviceGetComPortForServiceWithSandboxExtension();
          if (ComPortForServiceWithSandboxExtension)
          {
            int v34 = ComPortForServiceWithSandboxExtension;
            v35 = +[AXSubsystemBrailleHardware sharedInstance];
            unsigned __int8 v36 = [v35 ignoreLogging];

            v29 = v110;
            if ((v36 & 1) == 0)
            {
              v37 = +[AXSubsystemBrailleHardware identifier];
              v38 = AXLoggerForFacility();

              os_log_type_t v39 = AXOSLogLevelFromAXLogLevel();
              if (os_log_type_enabled(v38, v39))
              {
                v40 = AXColorizeFormatLog();
                comPort = (NSString *)v34;
                v41 = _AXStringForArgs();
                if (os_log_type_enabled(v38, v39))
                {
                  *(_DWORD *)v117 = 138543362;
                  v118 = v41;
                  _os_log_impl(&dword_0, v38, v39, "%{public}@", v117, 0xCu);
                }
              }
            }
LABEL_84:
            objc_msgSend(v32, "removeObserver:", v109, comPort);
            int v26 = 1;
            v30 = v112;
            goto LABEL_85;
          }
          v29 = v110;
          if (sandbox_extension_consume() == -1)
          {
            v58 = +[AXSubsystemBrailleHardware sharedInstance];
            unsigned __int8 v59 = [v58 ignoreLogging];

            if ((v59 & 1) == 0)
            {
              v60 = +[AXSubsystemBrailleHardware identifier];
              v61 = AXLoggerForFacility();

              os_log_type_t v62 = AXOSLogLevelFromAXLogLevel();
              if (os_log_type_enabled(v61, v62))
              {
                AXColorizeFormatLog();
                v63 = os_log_type_t type = v62;
                comPort = (NSString *)*__error();
                v107 = _AXStringForArgs();
                if (os_log_type_enabled(v61, type))
                {
                  *(_DWORD *)v117 = 138543362;
                  v118 = v107;
                  _os_log_impl(&dword_0, v61, type, "%{public}@", v117, 0xCu);
                }
              }
            }
          }
          int v64 = open((const char *)buf, 131074, comPort);
          v109->_comPort = v64;
          if (v64 < 0)
          {
            v84 = +[AXSubsystemBrailleHardware sharedInstance];
            unsigned __int8 v85 = [v84 ignoreLogging];

            if ((v85 & 1) == 0)
            {
              v86 = +[AXSubsystemBrailleHardware identifier];
              v87 = AXLoggerForFacility();

              os_log_type_t v88 = AXOSLogLevelFromAXLogLevel();
              if (os_log_type_enabled(v87, v88))
              {
                v89 = AXColorizeFormatLog();
                comPort = (NSString *)v109->_comPort;
                v90 = _AXStringForArgs();
                if (os_log_type_enabled(v87, v88))
                {
                  *(_DWORD *)v117 = 138543362;
                  v118 = v90;
                  _os_log_impl(&dword_0, v87, v88, "%{public}@", v117, 0xCu);
                }
              }
            }
            v109->_comPort = -1;
            goto LABEL_84;
          }
          objc_storeStrong((id *)&v109->_device, v21);
          id v65 = [objc_allocWithZone((Class)NSFileHandle) initWithFileDescriptor:v109->_comPort closeOnDealloc:1];
          v66 = (SCRDFileReader *)[objc_allocWithZone((Class)SCRDFileReader) initWithDelegate:v109 fileHandle:v65];
          readerThread = v109->_readerThread;
          v109->_readerThread = v66;

          CFMutableDataRef Mutable = CFDataCreateMutable(kCFAllocatorDefault, 0);
          v109->_safeReadBuffer = Mutable;
          if (Mutable
            && (v69 = (NSLock *)[objc_allocWithZone((Class)NSLock) init],
                readBufferLock = v109->_readBufferLock,
                v109->_readBufferLock = v69,
                readBufferLock,
                v109->_readBufferLock)
            && (CFMutableDataRef v71 = CFDataCreateMutable(kCFAllocatorDefault, 0), (v109->_readBuffer = v71) != 0))
          {
            v108 = [v31 name];
            if ([v108 isEqualToString:kSCRDNinepointSystemsNinepointBluetoothName])
            {
              modelIdentifier = v109->_modelIdentifier;
              v109->_modelIdentifier = (NSString *)@"com.apple.scrod.braille.driver.ninepointsystems.ninepoint";
            }
            uint64_t v73 = [v112 objectForKey:v109->_modelIdentifier];
            if (v73)
            {
              v74 = (void *)v73;
              [(SCRDFileReader *)v109->_readerThread start];
              v75 = [v74 objectForKey:kSCROBrailleDriverMainDisplaySize];
              v109->_mainSize = [v75 unsignedCharValue];

              v109->_isDriverLoaded = 1;
              int v26 = 0;
              v30 = v112;
              v76 = v108;
LABEL_76:

LABEL_85:
              id v4 = v111;
              goto LABEL_86;
            }
            v92 = +[AXSubsystemBrailleHardware sharedInstance];
            unsigned __int8 v93 = [v92 ignoreLogging];

            if (v93)
            {
              v30 = v112;
            }
            else
            {
              v94 = +[AXSubsystemBrailleHardware identifier];
              v95 = AXLoggerForFacility();

              v96 = v95;
              os_log_type_t v97 = AXOSLogLevelFromAXLogLevel();
              BOOL v98 = os_log_type_enabled(v95, v97);
              v30 = v112;
              if (v98)
              {
                uint64_t v99 = AXColorizeFormatLog();
                comPort = v109->_modelIdentifier;
                v106 = (void *)v99;
                uint64_t v100 = _AXStringForArgs();
                os_log_type_t v101 = v97;
                v102 = (void *)v100;
                os_log_type_t typea = v101;
                if (os_log_type_enabled(v96, v101))
                {
                  *(_DWORD *)v117 = 138543362;
                  v118 = v102;
                  _os_log_impl(&dword_0, v96, typea, "%{public}@", v117, 0xCu);
                }
              }
            }
            v76 = v108;
          }
          else
          {
            v76 = 0;
            v30 = v112;
          }
          [(SCRDFileReader *)v109->_readerThread invalidate];
          v77 = v109->_readerThread;
          v109->_readerThread = 0;

          safeReadBuffer = v109->_safeReadBuffer;
          if (safeReadBuffer)
          {
            CFRelease(safeReadBuffer);
            v109->_safeReadBuffer = 0;
          }
          [v32 removeObserver:v109];
          [(NSLock *)v109->_readBufferLock lock];
          readBuffer = v109->_readBuffer;
          if (readBuffer)
          {
            CFRelease(readBuffer);
            v109->_readBuffer = 0;
          }
          v80 = v109->_readBufferLock;
          v109->_readBufferLock = 0;
          v81 = v80;

          [(NSLock *)v81 unlock];
          device = v109->_device;
          v109->_device = 0;

          v109->_comPort = -1;
          v83 = v109->_modelIdentifier;
          v109->_modelIdentifier = 0;

          v109->_mainSize = 0;
          int v26 = 2;
          goto LABEL_76;
        }
        v51 = +[AXSubsystemBrailleHardware sharedInstance];
        unsigned __int8 v52 = [v51 ignoreLogging];

        v29 = v110;
        if ((v52 & 1) == 0)
        {
          v53 = +[AXSubsystemBrailleHardware identifier];
          v54 = AXLoggerForFacility();

          os_log_type_t v55 = AXOSLogLevelFromAXLogLevel();
          if (os_log_type_enabled(v54, v55))
          {
            v56 = AXColorizeFormatLog();
            v57 = _AXStringForArgs();
            if (os_log_type_enabled(v54, v55))
            {
              *(_DWORD *)buf = 138543362;
              v120 = v57;
              _os_log_impl(&dword_0, v54, v55, "%{public}@", buf, 0xCu);
            }
          }
        }
        [v32 removeObserver:v109];
      }
      else
      {
LABEL_20:

LABEL_35:
        v42 = +[AXSubsystemBrailleHardware sharedInstance];
        unsigned __int8 v43 = [v42 ignoreLogging];

        if (v43)
        {
          int v26 = 1;
          v29 = v110;
          id v4 = v111;
          v30 = v112;
LABEL_88:

LABEL_89:
          goto LABEL_90;
        }
        v46 = +[AXSubsystemBrailleHardware identifier];
        v31 = AXLoggerForFacility();

        int v26 = 1;
        os_log_type_t v47 = AXOSLogLevelFromAXLogLevel();
        v29 = v110;
        if (!os_log_type_enabled(v31, v47))
        {
          id v4 = v111;
          v30 = v112;
LABEL_87:

          goto LABEL_88;
        }
        v32 = AXColorizeFormatLog();
        v48 = _AXStringForArgs();
        if (os_log_type_enabled(v31, v47))
        {
          *(_DWORD *)buf = 138543362;
          v120 = v48;
          _os_log_impl(&dword_0, v31, v47, "%{public}@", buf, 0xCu);
        }
      }
      int v26 = 1;
      id v4 = v111;
      v30 = v112;
LABEL_86:

      goto LABEL_87;
    }
    v44 = +[AXSubsystemBrailleHardware sharedInstance];
    unsigned __int8 v45 = [v44 ignoreLogging];

    if ((v45 & 1) == 0)
    {
      v49 = +[AXSubsystemBrailleHardware identifier];
      v29 = AXLoggerForFacility();

      int v26 = 1;
      os_log_type_t v50 = AXOSLogLevelFromAXLogLevel();
      if (!os_log_type_enabled(v29, v50))
      {
LABEL_90:

        goto LABEL_91;
      }
      v30 = AXColorizeFormatLog();
      v14 = _AXStringForArgs();
      if (os_log_type_enabled(v29, v50))
      {
        *(_DWORD *)buf = 138543362;
        v120 = v14;
        _os_log_impl(&dword_0, v29, v50, "%{public}@", buf, 0xCu);
      }
      goto LABEL_88;
    }
    int v26 = 1;
LABEL_91:

    goto LABEL_92;
  }
  v24 = +[AXSubsystemBrailleHardware sharedInstance];
  unsigned __int8 v25 = [v24 ignoreLogging];

  if ((v25 & 1) == 0)
  {
    v27 = +[AXSubsystemBrailleHardware identifier];
    v12 = AXLoggerForFacility();

    int v26 = 1;
    os_log_type_t v28 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v12, v28))
    {
      v29 = AXColorizeFormatLog();
      [v4 transport];
      [v4 conformsToProtocol:&OBJC_PROTOCOL___SCROIOBluetoothElementProtocol];
      v30 = _AXStringForArgs();
      if (os_log_type_enabled(v12, v28))
      {
        *(_DWORD *)buf = 138543362;
        v120 = v30;
        _os_log_impl(&dword_0, v12, v28, "%{public}@", buf, 0xCu);
      }
      goto LABEL_89;
    }
    goto LABEL_91;
  }
  int v26 = 1;
LABEL_92:

  return v26;
}

- (BOOL)unloadDriver
{
  objc_super v3 = +[AXSubsystemBrailleHardware sharedInstance];
  unsigned __int8 v4 = [v3 ignoreLogging];

  if ((v4 & 1) == 0)
  {
    v5 = +[AXSubsystemBrailleHardware identifier];
    unsigned __int8 v6 = AXLoggerForFacility();

    os_log_type_t v7 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v6, v7))
    {
      v8 = AXColorizeFormatLog();
      os_log_type_t v9 = _AXStringForArgs();
      if (os_log_type_enabled(v6, v7))
      {
        int v19 = 138543362;
        uint64_t v20 = v9;
        _os_log_impl(&dword_0, v6, v7, "%{public}@", (uint8_t *)&v19, 0xCu);
      }
    }
  }
  self->_hasBeenUnloaded = 1;
  if (self->_isDriverLoaded)
  {
    self->_isDriverLoaded = 0;
    [(SCRDFileReader *)self->_readerThread invalidate];
    readerThread = self->_readerThread;
    self->_readerThread = 0;

    v11 = +[NSNotificationCenter defaultCenter];
    [v11 removeObserver:self];

    safeReadBuffer = self->_safeReadBuffer;
    if (safeReadBuffer)
    {
      CFRelease(safeReadBuffer);
      self->_safeReadBuffer = 0;
    }
    [(NSLock *)self->_readBufferLock lock];
    readBuffer = self->_readBuffer;
    if (readBuffer)
    {
      CFRelease(readBuffer);
      self->_readBuffer = 0;
    }
    readBufferLock = self->_readBufferLock;
    self->_readBufferLock = 0;
    v15 = readBufferLock;

    [(NSLock *)v15 unlock];
    [(BluetoothDevice *)self->_device disconnect];
    device = self->_device;
    self->_device = 0;

    self->_comPort = -1;
    self->_bluetoothChannelIsLost = 1;
    modelIdentifier = self->_modelIdentifier;
    self->_modelIdentifier = 0;

    self->_mainSize = 0;
  }
  return 1;
}

- (BOOL)isDriverLoaded
{
  return self->_isDriverLoaded;
}

- (BOOL)isSleeping
{
  return 0;
}

- (id)modelIdentifier
{
  return self->_modelIdentifier;
}

- (BOOL)supportsBlinkingCursor
{
  return 1;
}

- (BOOL)isInputEnabled
{
  return self->_isDriverLoaded;
}

- (BOOL)postsKeyboardEvents
{
  return 1;
}

- (int)brailleInputMode
{
  return 2;
}

- (int64_t)mainSize
{
  return self->_mainSize;
}

- (int64_t)statusSize
{
  return 0;
}

- (id)getInputEvents
{
  [(NSLock *)self->_readBufferLock lock];
  readBuffer = self->_readBuffer;
  if (readBuffer)
  {
    CFIndex Length = CFDataGetLength(readBuffer);
    if (Length >= 1)
    {
      CFIndex v5 = Length;
      safeReadBuffer = self->_safeReadBuffer;
      BytePtr = CFDataGetBytePtr(self->_readBuffer);
      CFDataAppendBytes(safeReadBuffer, BytePtr, v5);
      v11.location = 0;
      v11.length = v5;
      CFDataDeleteBytes(self->_readBuffer, v11);
    }
  }
  [(NSLock *)self->_readBufferLock unlock];
  v8 = self->_safeReadBuffer;

  return (id)_SCRDNinepointSystemsNinepointExtractKeyboardEventsFromBuffer(v8);
}

- (BOOL)setMainCells:(const char *)a3 length:(int64_t)a4
{
  CFDataRef v5 = (const __CFData *)SCRDNinepointSystemsNinepointCreateWriteBuffer();
  if (!v5) {
    return 0;
  }
  CFDataRef v6 = v5;
  int comPort = self->_comPort;
  if (comPort == -1)
  {
    BOOL v11 = 0;
  }
  else
  {
    BytePtr = CFDataGetBytePtr(v5);
    size_t Length = CFDataGetLength(v6);
    int v10 = write(comPort, BytePtr, Length);
    BOOL v11 = CFDataGetLength(v6) == v10;
  }
  CFRelease(v6);
  return v11;
}

- (BOOL)setStatusCells:(const char *)a3 length:(int64_t)a4
{
  return 1;
}

- (void)fileReader:(id)a3 data:(const void *)a4 length:(unint64_t)a5
{
  if (a5)
  {
    [(NSLock *)self->_readBufferLock lock];
    readBuffer = self->_readBuffer;
    if (readBuffer) {
      CFDataAppendBytes(readBuffer, (const UInt8 *)a4, a5);
    }
    [(NSLock *)self->_readBufferLock unlock];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_driverDelegate);
  [WeakRetained brailleDriverDidReceiveInput];
}

- (void)removeDeviceNotification:(id)a3
{
  unsigned __int8 v4 = [a3 object];
  if (v4)
  {
    if (v4 == self->_device)
    {
      self->_bluetoothChannelIsLost = 1;
      if (self->_isDriverLoaded)
      {
        CFDataRef v6 = v4;
        CFDataRef v5 = +[NSNotificationCenter defaultCenter];
        [v5 postNotificationName:@"SCROBrailleDriverProtocolUnloadNotification" object:self userInfo:0];

        unsigned __int8 v4 = v6;
      }
    }
  }
}

- (void)setBrailleDriverDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_driverDelegate);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_readerThread, 0);
  objc_storeStrong((id *)&self->_readBufferLock, 0);

  objc_storeStrong((id *)&self->_modelIdentifier, 0);
}

@end