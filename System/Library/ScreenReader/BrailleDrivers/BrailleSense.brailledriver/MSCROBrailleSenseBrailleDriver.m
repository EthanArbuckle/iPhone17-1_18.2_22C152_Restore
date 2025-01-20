@interface MSCROBrailleSenseBrailleDriver
- (BOOL)isDriverLoaded;
- (BOOL)isInputEnabled;
- (BOOL)isSleeping;
- (BOOL)postsKeyboardEvents;
- (BOOL)setMainCells:(const char *)a3 length:(int64_t)a4;
- (BOOL)setStatusCells:(const char *)a3 length:(int64_t)a4;
- (BOOL)supportsBlinkingCursor;
- (BOOL)unloadDriver;
- (MSCROBrailleSenseBrailleDriver)init;
- (id)getInputEvents;
- (id)modelIdentifier;
- (int)_himsDeviceId;
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

@implementation MSCROBrailleSenseBrailleDriver

- (MSCROBrailleSenseBrailleDriver)init
{
  v3.receiver = self;
  v3.super_class = (Class)MSCROBrailleSenseBrailleDriver;
  result = [(MSCROBrailleSenseBrailleDriver *)&v3 init];
  if (result)
  {
    result->_isDriverLoaded = 0;
    result->_comPort = -1;
  }
  return result;
}

- (void)dealloc
{
  [(MSCROBrailleSenseBrailleDriver *)self unloadDriver];
  v3.receiver = self;
  v3.super_class = (Class)MSCROBrailleSenseBrailleDriver;
  [(MSCROBrailleSenseBrailleDriver *)&v3 dealloc];
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
        v128 = v11;
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
        [(MSCROBrailleSenseBrailleDriver *)self unloadDriver];
      }
      v118 = v12;
      v119 = [v12 infoDictionary];
      v120 = [v119 objectForKey:kSCROBrailleDriverModels];
      v14 = [v4 bluetoothAddress];
      *(_OWORD *)&__nbyte[1] = 0u;
      long long v122 = 0u;
      long long v123 = 0u;
      long long v124 = 0u;
      v15 = +[BluetoothManager sharedInstance];
      v16 = [v15 pairedDevices];

      id v17 = [v16 countByEnumeratingWithState:&__nbyte[1] objects:v129 count:16];
      if (v17)
      {
        id v18 = v17;
        uint64_t v19 = *(void *)v122;
LABEL_14:
        uint64_t v20 = 0;
        while (1)
        {
          if (*(void *)v122 != v19) {
            objc_enumerationMutation(v16);
          }
          v21 = *(void **)(*(void *)&__nbyte[3] + 8 * v20);
          unint64_t v22 = [v21 address];
          unsigned __int8 v23 = [(id)v22 isEqualToString:v14];

          if (v23) {
            break;
          }
          if (v18 == (id)++v20)
          {
            id v18 = [v16 countByEnumeratingWithState:&__nbyte[1] objects:v129 count:16];
            if (v18) {
              goto LABEL_14;
            }
            goto LABEL_20;
          }
        }
        v31 = v21;

        if (!v31) {
          goto LABEL_34;
        }
        v32 = +[NSNotificationCenter defaultCenter];
        [v32 addObserver:self selector:"removeDeviceNotification:" name:BluetoothDeviceDisconnectSuccessNotification object:0];
        [v32 addObserver:self selector:"removeDeviceNotification:" name:BluetoothDeviceDisconnectFailedNotification object:0];
        if (([v31 connected] & 1) == 0)
        {
          v51 = +[AXSubsystemBrailleHardware sharedInstance];
          unsigned __int8 v52 = [v51 ignoreLogging];

          v30 = v120;
          if ((v52 & 1) == 0)
          {
            v53 = +[AXSubsystemBrailleHardware identifier];
            v38 = AXLoggerForFacility();

            os_log_type_t v54 = AXOSLogLevelFromAXLogLevel();
            if (os_log_type_enabled(v38, v54))
            {
              v55 = AXColorizeFormatLog();
              v56 = _AXStringForArgs();
              if (os_log_type_enabled(v38, v54))
              {
                *(_DWORD *)buf = 138543362;
                v128 = v56;
                _os_log_impl(&dword_0, v38, v54, "%{public}@", buf, 0xCu);
              }
            }
            goto LABEL_50;
          }
LABEL_51:
          objc_msgSend(v32, "removeObserver:", self, comPort);
          int v26 = 1;
          goto LABEL_52;
        }
        [v31 device];
        int ComPortForServiceWithSandboxExtension = BTDeviceGetComPortForServiceWithSandboxExtension();
        if (ComPortForServiceWithSandboxExtension)
        {
          int v34 = ComPortForServiceWithSandboxExtension;
          v35 = +[AXSubsystemBrailleHardware sharedInstance];
          unsigned __int8 v36 = [v35 ignoreLogging];

          v30 = v120;
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
                *(_DWORD *)v125 = 138543362;
                v126 = v41;
                _os_log_impl(&dword_0, v38, v39, "%{public}@", v125, 0xCu);
              }
            }
LABEL_50:

            goto LABEL_51;
          }
          goto LABEL_51;
        }
        v30 = v120;
        if (sandbox_extension_consume() == -1)
        {
          v58 = +[AXSubsystemBrailleHardware sharedInstance];
          unsigned __int8 v59 = [v58 ignoreLogging];

          if ((v59 & 1) == 0)
          {
            v60 = +[AXSubsystemBrailleHardware identifier];
            unint64_t v22 = AXLoggerForFacility();

            os_log_type_t v61 = AXOSLogLevelFromAXLogLevel();
            if (os_log_type_enabled((os_log_t)v22, v61))
            {
              uint64_t v62 = AXColorizeFormatLog();
              comPort = (NSString *)*__error();
              __buf = (void *)v62;
              v63 = _AXStringForArgs();
              if (os_log_type_enabled((os_log_t)v22, v61))
              {
                *(_DWORD *)v125 = 138543362;
                v126 = v63;
                _os_log_impl(&dword_0, (os_log_t)v22, v61, "%{public}@", v125, 0xCu);
              }
            }
          }
        }
        int v64 = open((const char *)buf, 131074, comPort);
        self->_comPort = v64;
        if (v64 < 0)
        {
          v81 = +[AXSubsystemBrailleHardware sharedInstance];
          unsigned __int8 v82 = [v81 ignoreLogging];

          if ((v82 & 1) == 0)
          {
            v83 = +[AXSubsystemBrailleHardware identifier];
            v84 = AXLoggerForFacility();

            os_log_type_t v85 = AXOSLogLevelFromAXLogLevel();
            if (os_log_type_enabled(v84, v85))
            {
              v86 = AXColorizeFormatLog();
              comPort = (NSString *)self->_comPort;
              v87 = _AXStringForArgs();
              if (os_log_type_enabled(v84, v85))
              {
                *(_DWORD *)v125 = 138543362;
                v126 = v87;
                _os_log_impl(&dword_0, v84, v85, "%{public}@", v125, 0xCu);
              }
            }
          }
          self->_comPort = -1;
          goto LABEL_51;
        }
        objc_storeStrong((id *)&self->_device, v21);
        id v65 = [objc_allocWithZone((Class)NSFileHandle) initWithFileDescriptor:self->_comPort closeOnDealloc:1];
        v66 = (SCRDFileReader *)[objc_allocWithZone((Class)SCRDFileReader) initWithDelegate:self fileHandle:v65];
        readerThread = self->_readerThread;
        self->_readerThread = v66;

        Mutable = CFDataCreateMutable(kCFAllocatorDefault, 0);
        self->_safeReadBuffer = Mutable;
        if (Mutable)
        {
          v69 = (NSLock *)[objc_allocWithZone((Class)NSLock) init];
          readBufferLock = self->_readBufferLock;
          self->_readBufferLock = v69;

          if (self->_readBufferLock)
          {
            v71 = CFDataCreateMutable(kCFAllocatorDefault, 0);
            self->_readBuffer = v71;
            if (v71)
            {
              [(SCRDFileReader *)self->_readerThread start];
              id v115 = v65;
              __bufa = (void *)SCRDHIMSCreateRequest();
              if (__bufa)
              {
                for (int i = 0; i != 5; ++i)
                {
                  if (self->_modelIdentifier) {
                    break;
                  }
                  if (write(self->_comPort, __bufa, 0) < 0)
                  {
                    free(__bufa);
                    goto LABEL_113;
                  }
                  self->_bluetoothChannelIsLost = 0;
                  self->_hasBeenUnloaded = 0;
                  CFRunLoopRunResult v73 = CFRunLoopRunInMode(kCFRunLoopDefaultMode, 1.0, 0);
                  if (self->_bluetoothChannelIsLost || self->_hasBeenUnloaded || v73 == kCFRunLoopRunStopped)
                  {
                    v95 = +[AXSubsystemBrailleHardware sharedInstance];
                    unsigned __int8 v96 = [v95 ignoreLogging];

                    if ((v96 & 1) == 0)
                    {
                      v97 = +[AXSubsystemBrailleHardware identifier];
                      v98 = AXLoggerForFacility();

                      os_log_type_t v99 = AXOSLogLevelFromAXLogLevel();
                      if (os_log_type_enabled(v98, v99))
                      {
                        v100 = AXColorizeFormatLog();
                        v101 = _AXStringForArgs();
                        if (os_log_type_enabled(v98, v99))
                        {
                          *(_DWORD *)v125 = 138543362;
                          v126 = v101;
                          _os_log_impl(&dword_0, v98, v99, "%{public}@", v125, 0xCu);
                        }
                      }
                    }
                    free(__bufa);
                    goto LABEL_112;
                  }
                  [(NSLock *)self->_readBufferLock lock];
                  CFIndex Length = CFDataGetLength(self->_readBuffer);
                  if (Length >= 1)
                  {
                    CFIndex v75 = Length;
                    safeReadBuffer = self->_safeReadBuffer;
                    BytePtr = CFDataGetBytePtr(self->_readBuffer);
                    v78 = safeReadBuffer;
                    id v65 = v115;
                    CFDataAppendBytes(v78, BytePtr, v75);
                    v130.location = 0;
                    v130.length = v75;
                    CFDataDeleteBytes(self->_readBuffer, v130);
                  }
                  [(NSLock *)self->_readBufferLock unlock];
                  SCRDAdvanceBufferToPacketStart();
                  if (CFDataGetLength(self->_safeReadBuffer) >= 10)
                  {
                    do
                    {
                      CFDataGetBytePtr(self->_safeReadBuffer);
                      SCRDHIMSFillPacket();
                      v22 &= 0xFFFFFFFFFFFF0000;
                      SCRDHIMSIsPacketValid();
                      v131.location = 0;
                      v131.length = 1;
                      CFDataDeleteBytes(self->_safeReadBuffer, v131);
                      SCRDAdvanceBufferToPacketStart();
                    }
                    while (CFDataGetLength(self->_safeReadBuffer) > 9);
                  }
                }
                free(__bufa);
                uint64_t v79 = [v120 objectForKey:self->_modelIdentifier];
                if (v79)
                {
                  v80 = (NSLock *)v79;
                  int v26 = 0;
                  self->_isDriverLoaded = 1;
                  v12 = v118;
                  goto LABEL_118;
                }
                v102 = +[AXSubsystemBrailleHardware sharedInstance];
                unsigned __int8 v103 = [v102 ignoreLogging];

                id v65 = v115;
                if ((v103 & 1) == 0)
                {
                  v104 = +[AXSubsystemBrailleHardware identifier];
                  v91 = AXLoggerForFacility();

                  os_log_type_t v105 = AXOSLogLevelFromAXLogLevel();
                  if (os_log_type_enabled(v91, v105))
                  {
                    v106 = AXColorizeFormatLog();
                    comPort = self->_modelIdentifier;
                    v107 = _AXStringForArgs();
                    if (os_log_type_enabled(v91, v105))
                    {
                      *(_DWORD *)v125 = 138543362;
                      v126 = v107;
                      _os_log_impl(&dword_0, v91, v105, "%{public}@", v125, 0xCu);
                    }

                    v30 = v120;
                  }
                  goto LABEL_111;
                }
              }
              else
              {
                v88 = +[AXSubsystemBrailleHardware sharedInstance];
                unsigned __int8 v89 = [v88 ignoreLogging];

                id v65 = v115;
                if ((v89 & 1) == 0)
                {
                  v90 = +[AXSubsystemBrailleHardware identifier];
                  v91 = AXLoggerForFacility();

                  os_log_type_t v92 = AXOSLogLevelFromAXLogLevel();
                  if (os_log_type_enabled(v91, v92))
                  {
                    v93 = AXColorizeFormatLog();
                    v94 = _AXStringForArgs();
                    if (os_log_type_enabled(v91, v92))
                    {
                      *(_DWORD *)v125 = 138543362;
                      v126 = v94;
                      _os_log_impl(&dword_0, v91, v92, "%{public}@", v125, 0xCu);
                    }
                  }
LABEL_111:

LABEL_112:
                  id v65 = v115;
                }
              }
            }
          }
        }
LABEL_113:
        [(SCRDFileReader *)self->_readerThread invalidate];
        v108 = self->_readerThread;
        self->_readerThread = 0;

        v109 = self->_safeReadBuffer;
        if (v109)
        {
          CFRelease(v109);
          self->_safeReadBuffer = 0;
        }
        [v32 removeObserver:self];
        [(NSLock *)self->_readBufferLock lock];
        readBuffer = self->_readBuffer;
        v12 = v118;
        if (readBuffer)
        {
          CFRelease(readBuffer);
          self->_readBuffer = 0;
        }
        v111 = self->_readBufferLock;
        self->_readBufferLock = 0;
        v80 = v111;

        [(NSLock *)v80 unlock];
        device = self->_device;
        self->_device = 0;

        self->_comPort = -1;
        modelIdentifier = self->_modelIdentifier;
        self->_modelIdentifier = 0;

        int v26 = 2;
LABEL_118:
      }
      else
      {
LABEL_20:

LABEL_34:
        v42 = +[AXSubsystemBrailleHardware sharedInstance];
        unsigned __int8 v43 = [v42 ignoreLogging];

        if (v43)
        {
          int v26 = 1;
          v12 = v118;
          v29 = v119;
          v30 = v120;
LABEL_56:

LABEL_57:
          goto LABEL_58;
        }
        v46 = +[AXSubsystemBrailleHardware identifier];
        v31 = AXLoggerForFacility();

        int v26 = 1;
        os_log_type_t v47 = AXOSLogLevelFromAXLogLevel();
        if (!os_log_type_enabled(v31, v47))
        {
          v12 = v118;
          v30 = v120;
          goto LABEL_55;
        }
        v32 = AXColorizeFormatLog();
        v48 = _AXStringForArgs();
        v30 = v120;
        if (os_log_type_enabled(v31, v47))
        {
          *(_DWORD *)buf = 138543362;
          v128 = v48;
          _os_log_impl(&dword_0, v31, v47, "%{public}@", buf, 0xCu);
        }

LABEL_52:
        v12 = v118;
      }

LABEL_55:
      v29 = v119;
      goto LABEL_56;
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
LABEL_58:

        goto LABEL_59;
      }
      v30 = AXColorizeFormatLog();
      v14 = _AXStringForArgs();
      if (os_log_type_enabled(v29, v50))
      {
        *(_DWORD *)buf = 138543362;
        v128 = v14;
        _os_log_impl(&dword_0, v29, v50, "%{public}@", buf, 0xCu);
      }
      goto LABEL_56;
    }
    int v26 = 1;
LABEL_59:

    goto LABEL_60;
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
        v128 = v30;
        _os_log_impl(&dword_0, v12, v28, "%{public}@", buf, 0xCu);
      }
      goto LABEL_57;
    }
    goto LABEL_59;
  }
  int v26 = 1;
LABEL_60:

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
      v12.location = 0;
      v12.length = v5;
      CFDataDeleteBytes(self->_readBuffer, v12);
    }
  }
  [(NSLock *)self->_readBufferLock unlock];
  v8 = self->_safeReadBuffer;
  uint64_t v9 = [(MSCROBrailleSenseBrailleDriver *)self _himsDeviceId];

  return (id)_SCRDHIMSBrailleSenseExtractEventsFromBuffer(v8, v9);
}

- (int)_himsDeviceId
{
  return [(NSString *)self->_modelIdentifier isEqualToString:@"com.apple.scrod.braille.driver.hims.braillesense.smart.beetle.14"];
}

- (BOOL)setMainCells:(const char *)a3 length:(int64_t)a4
{
  uint64_t v5 = SCRDHIMSCreateRequest();
  if (!v5) {
    return 0;
  }
  unsigned __int8 v6 = (void *)v5;
  int comPort = self->_comPort;
  BOOL v8 = comPort != -1 && write(comPort, v6, 0) == 0;
  free(v6);
  return v8;
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
        unsigned __int8 v6 = v4;
        uint64_t v5 = +[NSNotificationCenter defaultCenter];
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