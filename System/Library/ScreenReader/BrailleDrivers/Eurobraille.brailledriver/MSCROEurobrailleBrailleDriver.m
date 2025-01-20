@interface MSCROEurobrailleBrailleDriver
- (BOOL)isDriverLoaded;
- (BOOL)isInputEnabled;
- (BOOL)isSleeping;
- (BOOL)postsKeyboardEvents;
- (BOOL)setMainCells:(const char *)a3 length:(int64_t)a4;
- (BOOL)setStatusCells:(const char *)a3 length:(int64_t)a4;
- (BOOL)supportsBlinkingCursor;
- (BOOL)unloadDriver;
- (MSCROEurobrailleBrailleDriver)init;
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

@implementation MSCROEurobrailleBrailleDriver

- (MSCROEurobrailleBrailleDriver)init
{
  v3.receiver = self;
  v3.super_class = (Class)MSCROEurobrailleBrailleDriver;
  result = [(MSCROEurobrailleBrailleDriver *)&v3 init];
  if (result)
  {
    result->_isDriverLoaded = 0;
    result->_comPort = -1;
  }
  return result;
}

- (void)dealloc
{
  [(MSCROEurobrailleBrailleDriver *)self unloadDriver];
  v3.receiver = self;
  v3.super_class = (Class)MSCROEurobrailleBrailleDriver;
  [(MSCROEurobrailleBrailleDriver *)&v3 dealloc];
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
        v138 = v11;
        _os_log_impl(&dword_0, v8, v9, "%{public}@", buf, 0xCu);
      }
    }
  }
  if ([v4 transport] == 2
    && ([v4 conformsToProtocol:&OBJC_PROTOCOL___SCROIOBluetoothElementProtocol] & 1) != 0)
  {
    v12 = +[NSBundle bundleForClass:objc_opt_class()];
    v13 = [v12 bundleIdentifier];

    if (v13)
    {
      if (self->_isDriverLoaded) {
        [(MSCROEurobrailleBrailleDriver *)self unloadDriver];
      }
      v127 = v12;
      v126 = [v12 infoDictionary];
      v128 = [v126 objectForKey:kSCROBrailleDriverModels];
      id v125 = v4;
      v14 = [v4 bluetoothAddress];
      long long v131 = 0u;
      long long v132 = 0u;
      long long v133 = 0u;
      long long v134 = 0u;
      v15 = +[BluetoothManager sharedInstance];
      v16 = [v15 pairedDevices];

      id v17 = [v16 countByEnumeratingWithState:&v131 objects:v139 count:16];
      if (v17)
      {
        id v18 = v17;
        uint64_t v19 = *(void *)v132;
        do
        {
          for (i = 0; i != v18; i = (char *)i + 1)
          {
            if (*(void *)v132 != v19) {
              objc_enumerationMutation(v16);
            }
            v21 = *(void **)(*((void *)&v131 + 1) + 8 * i);
            v22 = [v21 address];
            unsigned __int8 v23 = [v22 isEqualToString:v14];

            if (v23)
            {
              v31 = v21;

              if (v31)
              {
                v32 = +[NSNotificationCenter defaultCenter];
                [v32 addObserver:self selector:"removeDeviceNotification:" name:BluetoothDeviceDisconnectSuccessNotification object:0];
                [v32 addObserver:self selector:"removeDeviceNotification:" name:BluetoothDeviceDisconnectFailedNotification object:0];
                if ([v31 connected])
                {
                  v33 = v32;
                  [v31 device];
                  int ComPortForServiceWithSandboxExtension = BTDeviceGetComPortForServiceWithSandboxExtension();
                  if (ComPortForServiceWithSandboxExtension)
                  {
                    int v35 = ComPortForServiceWithSandboxExtension;
                    v36 = +[AXSubsystemBrailleHardware sharedInstance];
                    unsigned __int8 v37 = [v36 ignoreLogging];

                    if ((v37 & 1) == 0)
                    {
                      v38 = +[AXSubsystemBrailleHardware identifier];
                      v39 = AXLoggerForFacility();

                      os_log_type_t v40 = AXOSLogLevelFromAXLogLevel();
                      if (os_log_type_enabled(v39, v40))
                      {
                        v41 = AXColorizeFormatLog();
                        bluetoothChannelIsLost = (NSString *)v35;
                        v42 = _AXStringForArgs();
                        if (os_log_type_enabled(v39, v40))
                        {
                          *(_DWORD *)v135 = 138543362;
                          v136 = v42;
                          _os_log_impl(&dword_0, v39, v40, "%{public}@", v135, 0xCu);
                        }
                      }
                    }
                    v32 = v33;
                    v43 = v33;
LABEL_92:
                    objc_msgSend(v43, "removeObserver:", self, bluetoothChannelIsLost);
                    int v26 = 1;
                    id v4 = v125;
                    v29 = v126;
LABEL_93:
                    v12 = v127;
                    v30 = v128;
                    goto LABEL_94;
                  }
                  if (sandbox_extension_consume() == -1)
                  {
                    v61 = +[AXSubsystemBrailleHardware sharedInstance];
                    unsigned __int8 v62 = [v61 ignoreLogging];

                    if ((v62 & 1) == 0)
                    {
                      v63 = +[AXSubsystemBrailleHardware identifier];
                      v64 = AXLoggerForFacility();

                      os_log_type_t v65 = AXOSLogLevelFromAXLogLevel();
                      if (os_log_type_enabled(v64, v65))
                      {
                        v66 = AXColorizeFormatLog();
                        bluetoothChannelIsLost = (NSString *)*__error();
                        v67 = _AXStringForArgs();
                        if (os_log_type_enabled(v64, v65))
                        {
                          *(_DWORD *)v135 = 138543362;
                          v136 = v67;
                          _os_log_impl(&dword_0, v64, v65, "%{public}@", v135, 0xCu);
                        }
                      }
                    }
                  }
                  int v68 = open((const char *)buf, 131074, bluetoothChannelIsLost);
                  self->_comPort = v68;
                  if ((v68 & 0x80000000) == 0)
                  {
                    objc_storeStrong((id *)&self->_device, v21);
                    id v124 = [objc_allocWithZone((Class)NSFileHandle) initWithFileDescriptor:self->_comPort closeOnDealloc:1];
                    v69 = (SCRDFileReader *)[objc_allocWithZone((Class)SCRDFileReader) initWithDelegate:self fileHandle:v124];
                    readerThread = self->_readerThread;
                    self->_readerThread = v69;

                    Mutable = CFDataCreateMutable(kCFAllocatorDefault, 0);
                    self->_safeReadBuffer = Mutable;
                    v32 = v33;
                    if (!Mutable) {
                      goto LABEL_119;
                    }
                    v72 = (NSLock *)[objc_allocWithZone((Class)NSLock) init];
                    readBufferLock = self->_readBufferLock;
                    self->_readBufferLock = v72;

                    if (!self->_readBufferLock) {
                      goto LABEL_119;
                    }
                    v74 = CFDataCreateMutable(kCFAllocatorDefault, 0);
                    self->_readBuffer = v74;
                    if (!v74) {
                      goto LABEL_119;
                    }
                    [(SCRDFileReader *)self->_readerThread start];
                    int v75 = 5;
                    while (1)
                    {
                      modelIdentifier = self->_modelIdentifier;
                      if (modelIdentifier) {
                        goto LABEL_79;
                      }
                      __int16 v130 = 841;
                      int __buf = 1392771074;
                      if ((unint64_t)write(self->_comPort, &__buf, 6uLL) <= 5) {
                        break;
                      }
                      self->_bluetoothChannelIsLost = 0;
                      self->_BOOL hasBeenUnloaded = 0;
                      CFRunLoopRunResult v77 = CFRunLoopRunInMode(kCFRunLoopDefaultMode, 0.5, 0);
                      CFRunLoopRunResult v78 = v77;
                      if (self->_bluetoothChannelIsLost || self->_hasBeenUnloaded || v77 == kCFRunLoopRunStopped)
                      {
                        v96 = +[AXSubsystemBrailleHardware sharedInstance];
                        unsigned __int8 v97 = [v96 ignoreLogging];

                        v32 = v33;
                        if (v97) {
                          goto LABEL_119;
                        }
                        v98 = +[AXSubsystemBrailleHardware identifier];
                        v99 = AXLoggerForFacility();

                        os_log_type_t v100 = AXOSLogLevelFromAXLogLevel();
                        if (os_log_type_enabled(v99, v100))
                        {
                          v101 = AXColorizeFormatLog();
                          BOOL hasBeenUnloaded = self->_hasBeenUnloaded;
                          uint64_t v123 = v78;
                          bluetoothChannelIsLost = (NSString *)self->_bluetoothChannelIsLost;
                          v102 = _AXStringForArgs();
                          if (os_log_type_enabled(v99, v100))
                          {
                            *(_DWORD *)v135 = 138543362;
                            v136 = v102;
                            _os_log_impl(&dword_0, v99, v100, "%{public}@", v135, 0xCu);
                          }
                          v32 = v33;
                          goto LABEL_110;
                        }
                        v32 = v33;
                        goto LABEL_118;
                      }
                      [(NSLock *)self->_readBufferLock lock];
                      CFIndex Length = CFDataGetLength(self->_readBuffer);
                      if (Length >= 1)
                      {
                        CFIndex v80 = Length;
                        safeReadBuffer = self->_safeReadBuffer;
                        BytePtr = CFDataGetBytePtr(self->_readBuffer);
                        CFDataAppendBytes(safeReadBuffer, BytePtr, v80);
                        v140.location = 0;
                        v140.length = v80;
                        CFDataDeleteBytes(self->_readBuffer, v140);
                      }
                      [(NSLock *)self->_readBufferLock unlock];
                      if (SCRDEurobrailleGetModelInfoFromBuffer())
                      {
                        uint64_t deviceIdentifier = self->_deviceIdentifier;
                        if deviceIdentifier < 0xF && ((0x607Fu >> deviceIdentifier))
                        {
                          v84 = self->_modelIdentifier;
                          self->_modelIdentifier = (NSString *)*(&off_8258 + deviceIdentifier);
                        }
                      }
                      if (!--v75)
                      {
                        modelIdentifier = self->_modelIdentifier;
LABEL_79:
                        v32 = v33;
                        v85 = [v128 objectForKey:modelIdentifier];

                        if (v85)
                        {
                          unint64_t v86 = self->_mainSize + 6;
                          self->_writeBufferSize = v86;
                          v87 = (char *)malloc_type_malloc(v86, 0xB20869CDuLL);
                          self->_writeBuffer = v87;
                          if (!v87) {
                            goto LABEL_119;
                          }
                          self->_isDriverLoaded = 1;
                          v29 = v126;
                          v12 = v127;
                          if (self->_isDeviceSleeping) {
                            SCRDPostSleepNotification();
                          }
                          int v26 = 0;
                          id v4 = v125;
                          v30 = v128;
LABEL_124:

LABEL_94:
LABEL_95:

LABEL_96:
LABEL_97:

LABEL_98:
                          goto LABEL_99;
                        }
                        v107 = +[AXSubsystemBrailleHardware sharedInstance];
                        unsigned __int8 v108 = [v107 ignoreLogging];

                        if ((v108 & 1) == 0)
                        {
                          v109 = +[AXSubsystemBrailleHardware identifier];
                          v110 = AXLoggerForFacility();

                          os_log_type_t v111 = AXOSLogLevelFromAXLogLevel();
                          if (os_log_type_enabled(v110, v111))
                          {
                            v112 = AXColorizeFormatLog();
                            bluetoothChannelIsLost = self->_modelIdentifier;
                            v113 = _AXStringForArgs();
                            if (os_log_type_enabled(v110, v111))
                            {
                              *(_DWORD *)v135 = 138543362;
                              v136 = v113;
                              _os_log_impl(&dword_0, v110, v111, "%{public}@", v135, 0xCu);
                            }

                            v32 = v33;
                          }
                        }
LABEL_119:
                        [(SCRDFileReader *)self->_readerThread invalidate];
                        v114 = self->_readerThread;
                        self->_readerThread = 0;

                        v115 = self->_safeReadBuffer;
                        if (v115)
                        {
                          CFRelease(v115);
                          self->_safeReadBuffer = 0;
                        }
                        [v32 removeObserver:self];
                        [(NSLock *)self->_readBufferLock lock];
                        readBuffer = self->_readBuffer;
                        id v4 = v125;
                        v29 = v126;
                        v12 = v127;
                        v30 = v128;
                        if (readBuffer)
                        {
                          CFRelease(readBuffer);
                          self->_readBuffer = 0;
                        }
                        v117 = self->_readBufferLock;
                        self->_readBufferLock = 0;
                        v118 = v117;

                        [(NSLock *)v118 unlock];
                        device = self->_device;
                        self->_device = 0;

                        self->_comPort = -1;
                        v120 = self->_modelIdentifier;
                        self->_modelIdentifier = 0;

                        int v26 = 2;
                        goto LABEL_124;
                      }
                    }
                    v103 = +[AXSubsystemBrailleHardware sharedInstance];
                    unsigned __int8 v104 = [v103 ignoreLogging];

                    v32 = v33;
                    if (v104) {
                      goto LABEL_119;
                    }
                    v105 = +[AXSubsystemBrailleHardware identifier];
                    v99 = AXLoggerForFacility();

                    os_log_type_t v106 = AXOSLogLevelFromAXLogLevel();
                    if (os_log_type_enabled(v99, v106))
                    {
                      v101 = AXColorizeFormatLog();
                      v102 = _AXStringForArgs();
                      if (os_log_type_enabled(v99, v106))
                      {
                        *(_DWORD *)v135 = 138543362;
                        v136 = v102;
                        _os_log_impl(&dword_0, v99, v106, "%{public}@", v135, 0xCu);
                      }
LABEL_110:
                    }
LABEL_118:

                    goto LABEL_119;
                  }
                  v88 = +[AXSubsystemBrailleHardware sharedInstance];
                  unsigned __int8 v89 = [v88 ignoreLogging];

                  v32 = v33;
                  if ((v89 & 1) == 0)
                  {
                    v90 = +[AXSubsystemBrailleHardware identifier];
                    v91 = AXLoggerForFacility();

                    os_log_type_t v92 = AXOSLogLevelFromAXLogLevel();
                    if (os_log_type_enabled(v91, v92))
                    {
                      v93 = AXColorizeFormatLog();
                      bluetoothChannelIsLost = (NSString *)self->_comPort;
                      v94 = _AXStringForArgs();
                      if (os_log_type_enabled(v91, v92))
                      {
                        *(_DWORD *)v135 = 138543362;
                        v136 = v94;
                        _os_log_impl(&dword_0, v91, v92, "%{public}@", v135, 0xCu);
                      }

                      v32 = v33;
                    }
                  }
                  self->_comPort = -1;
                }
                else
                {
                  v53 = +[AXSubsystemBrailleHardware sharedInstance];
                  unsigned __int8 v54 = [v53 ignoreLogging];

                  if ((v54 & 1) == 0)
                  {
                    v55 = +[AXSubsystemBrailleHardware identifier];
                    v56 = AXLoggerForFacility();

                    os_log_type_t v57 = AXOSLogLevelFromAXLogLevel();
                    if (os_log_type_enabled(v56, v57))
                    {
                      v58 = v32;
                      v59 = AXColorizeFormatLog();
                      v60 = _AXStringForArgs();
                      if (os_log_type_enabled(v56, v57))
                      {
                        *(_DWORD *)buf = 138543362;
                        v138 = v60;
                        _os_log_impl(&dword_0, v56, v57, "%{public}@", buf, 0xCu);
                      }

                      v32 = v58;
                    }
                  }
                }
                v43 = v32;
                goto LABEL_92;
              }
LABEL_36:
              v44 = +[AXSubsystemBrailleHardware sharedInstance];
              unsigned __int8 v45 = [v44 ignoreLogging];

              if (v45)
              {
                int v26 = 1;
                id v4 = v125;
                v29 = v126;
                v12 = v127;
                v30 = v128;
                goto LABEL_96;
              }
              v48 = +[AXSubsystemBrailleHardware identifier];
              v31 = AXLoggerForFacility();

              int v26 = 1;
              os_log_type_t v49 = AXOSLogLevelFromAXLogLevel();
              v29 = v126;
              if (!os_log_type_enabled(v31, v49))
              {
                id v4 = v125;
                v12 = v127;
                v30 = v128;
                goto LABEL_95;
              }
              v32 = AXColorizeFormatLog();
              v50 = _AXStringForArgs();
              if (os_log_type_enabled(v31, v49))
              {
                *(_DWORD *)buf = 138543362;
                v138 = v50;
                _os_log_impl(&dword_0, v31, v49, "%{public}@", buf, 0xCu);
              }

              int v26 = 1;
              id v4 = v125;
              goto LABEL_93;
            }
          }
          id v18 = [v16 countByEnumeratingWithState:&v131 objects:v139 count:16];
        }
        while (v18);
      }

      goto LABEL_36;
    }
    v46 = +[AXSubsystemBrailleHardware sharedInstance];
    unsigned __int8 v47 = [v46 ignoreLogging];

    if ((v47 & 1) == 0)
    {
      v51 = +[AXSubsystemBrailleHardware identifier];
      v29 = AXLoggerForFacility();

      int v26 = 1;
      os_log_type_t v52 = AXOSLogLevelFromAXLogLevel();
      if (os_log_type_enabled(v29, v52))
      {
        v30 = AXColorizeFormatLog();
        v14 = _AXStringForArgs();
        if (os_log_type_enabled(v29, v52))
        {
          *(_DWORD *)buf = 138543362;
          v138 = v14;
          _os_log_impl(&dword_0, v29, v52, "%{public}@", buf, 0xCu);
        }
        goto LABEL_96;
      }
      goto LABEL_98;
    }
    int v26 = 1;
LABEL_99:
  }
  else
  {
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
          v138 = v30;
          _os_log_impl(&dword_0, v12, v28, "%{public}@", buf, 0xCu);
        }
        goto LABEL_97;
      }
      goto LABEL_99;
    }
    int v26 = 1;
  }

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
        int v20 = 138543362;
        v21 = v9;
        _os_log_impl(&dword_0, v6, v7, "%{public}@", (uint8_t *)&v20, 0xCu);
      }
    }
  }
  self->_BOOL hasBeenUnloaded = 1;
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
    v14 = self->_readBufferLock;
    readBufferLock = self->_readBufferLock;
    self->_readBufferLock = 0;

    [(NSLock *)v14 unlock];
    [(BluetoothDevice *)self->_device disconnect];
    device = self->_device;
    self->_device = 0;

    self->_comPort = -1;
    self->_bluetoothChannelIsLost = 1;
    modelIdentifier = self->_modelIdentifier;
    self->_modelIdentifier = 0;

    self->_mainSize = 0;
    writeBuffer = self->_writeBuffer;
    if (writeBuffer)
    {
      free(writeBuffer);
      self->_writeBuffer = 0;
    }
    *(_WORD *)&self->_joystick2KeyBuffer = 0;
    *(_DWORD *)&self->_isDeviceSleeping = 0;
  }
  return 1;
}

- (BOOL)isDriverLoaded
{
  return self->_isDriverLoaded;
}

- (BOOL)isSleeping
{
  return self->_isDeviceSleeping;
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
  return self->_deviceIdentifier != 2;
}

- (int)brailleInputMode
{
  return 2 * (self->_deviceIdentifier != 2);
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
  BOOL isDeviceSleeping = self->_isDeviceSleeping;
  os_log_type_t v9 = SCRDEurobrailleExtractEventsFromBuffer();
  if (isDeviceSleeping != self->_isDeviceSleeping) {
    SCRDPostSleepNotification();
  }

  return v9;
}

- (BOOL)setMainCells:(const char *)a3 length:(int64_t)a4
{
  *self->_writeBuffer = 2;
  self->_writeBuffer[self->_writeBufferSize - 1] = 3;
  int v5 = LODWORD(self->_mainSize) + 4;
  self->_writeBuffer[1] = BYTE1(v5);
  self->_writeBuffer[2] = v5;
  self->_writeBuffer[3] = 66;
  self->_writeBuffer[4] = 83;
  int64_t mainSize = self->_mainSize;
  os_log_type_t v7 = self->_writeBuffer + 5;
  if (mainSize <= a4)
  {
    memcpy(v7, a3, mainSize);
  }
  else
  {
    memcpy(v7, a3, a4);
    bzero(&self->_writeBuffer[a4 + 5], self->_mainSize - a4);
  }
  int comPort = self->_comPort;
  return comPort != -1 && write(comPort, self->_writeBuffer, self->_writeBufferSize) == self->_writeBufferSize;
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
        int v5 = +[NSNotificationCenter defaultCenter];
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