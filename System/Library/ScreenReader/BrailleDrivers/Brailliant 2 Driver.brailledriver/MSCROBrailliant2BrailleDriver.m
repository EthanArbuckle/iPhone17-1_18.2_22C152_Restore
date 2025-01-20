@interface MSCROBrailliant2BrailleDriver
- (BOOL)isDriverLoaded;
- (BOOL)isInputEnabled;
- (BOOL)isSleeping;
- (BOOL)postsKeyboardEvents;
- (BOOL)setMainCells:(const char *)a3 length:(int64_t)a4;
- (BOOL)setStatusCells:(const char *)a3 length:(int64_t)a4;
- (BOOL)supportsBlinkingCursor;
- (BOOL)unloadDriver;
- (MSCROBrailliant2BrailleDriver)init;
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

@implementation MSCROBrailliant2BrailleDriver

- (MSCROBrailliant2BrailleDriver)init
{
  v3.receiver = self;
  v3.super_class = (Class)MSCROBrailliant2BrailleDriver;
  result = [(MSCROBrailliant2BrailleDriver *)&v3 init];
  if (result)
  {
    result->_isDriverLoaded = 0;
    result->_comPort = -1;
  }
  return result;
}

- (void)dealloc
{
  [(MSCROBrailliant2BrailleDriver *)self unloadDriver];
  v3.receiver = self;
  v3.super_class = (Class)MSCROBrailliant2BrailleDriver;
  [(MSCROBrailliant2BrailleDriver *)&v3 dealloc];
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
        id v151 = v11;
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
        [(MSCROBrailliant2BrailleDriver *)self unloadDriver];
      }
      v14 = [v12 infoDictionary];
      v142 = [v14 objectForKey:kSCROBrailleDriverModels];
      id v143 = v4;
      v15 = [v4 bluetoothAddress];
      long long v145 = 0u;
      long long v146 = 0u;
      long long v147 = 0u;
      long long v148 = 0u;
      v16 = +[BluetoothManager sharedInstance];
      v17 = [v16 pairedDevices];

      id v18 = [v17 countByEnumeratingWithState:&v145 objects:v149 count:16];
      v144 = v14;
      if (v18)
      {
        id v19 = v18;
        v138 = v12;
        uint64_t v20 = *(void *)v146;
        while (2)
        {
          for (i = 0; i != v19; i = (char *)i + 1)
          {
            if (*(void *)v146 != v20) {
              objc_enumerationMutation(v17);
            }
            v22 = *(void **)(*((void *)&v145 + 1) + 8 * i);
            v23 = [v22 address];
            unsigned int v24 = [v23 isEqualToString:v15];

            if (v24)
            {
              id v25 = v22;
              goto LABEL_27;
            }
          }
          id v19 = [v17 countByEnumeratingWithState:&v145 objects:v149 count:16];
          if (v19) {
            continue;
          }
          break;
        }
        id v25 = 0;
LABEL_27:
        v12 = v138;
        v14 = v144;
      }
      else
      {
        id v25 = 0;
      }

      v34 = +[AXSubsystemBrailleHardware sharedInstance];
      unsigned __int8 v35 = [v34 ignoreLogging];

      if ((v35 & 1) == 0)
      {
        id v36 = v25;
        v37 = +[AXSubsystemBrailleHardware identifier];
        v38 = AXLoggerForFacility();

        os_log_type_t v39 = AXOSLogLevelFromAXLogLevel();
        if (os_log_type_enabled(v38, v39))
        {
          v40 = AXColorizeFormatLog();
          uint64_t bluetoothChannelIsLost = (uint64_t)v36;
          v41 = _AXStringForArgs();
          if (os_log_type_enabled(v38, v39))
          {
            *(_DWORD *)buf = 138543362;
            id v151 = v41;
            _os_log_impl(&dword_0, v38, v39, "%{public}@", buf, 0xCu);
          }
        }
        id v25 = v36;
        v14 = v144;
      }
      if (v25)
      {
        v42 = +[NSNotificationCenter defaultCenter];
        [v42 addObserver:self selector:"removeDeviceNotification:" name:BluetoothDeviceDisconnectSuccessNotification object:0];
        [v42 addObserver:self selector:"removeDeviceNotification:" name:BluetoothDeviceDisconnectFailedNotification object:0];
        if ([v25 connected])
        {
          uint64_t v43 = MSCROBTOpenComPort(v25, &self->_comPort);
          if (!v43)
          {
            v141 = v42;
            objc_storeStrong((id *)&self->_device, v25);
            id v70 = [objc_allocWithZone((Class)NSFileHandle) initWithFileDescriptor:self->_comPort closeOnDealloc:1];
            v71 = (SCRDFileReader *)[objc_allocWithZone((Class)SCRDFileReader) initWithDelegate:self fileHandle:v70];
            readerThread = self->_readerThread;
            self->_readerThread = v71;

            Mutable = CFDataCreateMutable(kCFAllocatorDefault, 0);
            self->_safeReadBuffer = Mutable;
            id v137 = v25;
            if (Mutable)
            {
              v74 = (NSLock *)[objc_allocWithZone((Class)NSLock) init];
              readBufferLock = self->_readBufferLock;
              self->_readBufferLock = v74;

              id v4 = v143;
              if (self->_readBufferLock)
              {
                v76 = CFDataCreateMutable(kCFAllocatorDefault, 0);
                self->_readBuffer = v76;
                if (v76)
                {
                  [(SCRDFileReader *)self->_readerThread start];
                  uint64_t InitializationRequestPacket = SCRDHumanwareCreateInitializationRequestPacket();
                  CFDataRef v78 = (const __CFData *)InitializationRequestPacket;
                  if (!InitializationRequestPacket)
                  {
                    v31 = v142;
                    goto LABEL_95;
                  }
                  id v130 = v70;
                  int v79 = 0;
                  CFDataRef v131 = (const __CFData *)InitializationRequestPacket;
                  while (!self->_deviceID)
                  {
                    ssize_t Length = CFDataGetLength(v78);
                    int comPort = self->_comPort;
                    BytePtr = CFDataGetBytePtr(v78);
                    if (write(comPort, BytePtr, Length) < Length)
                    {
                      v103 = +[AXSubsystemBrailleHardware sharedInstance];
                      unsigned __int8 v104 = [v103 ignoreLogging];

                      if ((v104 & 1) == 0)
                      {
                        v105 = +[AXSubsystemBrailleHardware identifier];
                        v106 = AXLoggerForFacility();

                        os_log_type_t v107 = AXOSLogLevelFromAXLogLevel();
                        os_log_t loga = v106;
                        if (os_log_type_enabled(v106, v107))
                        {
                          AXColorizeFormatLog();
                          mode = (__CFString *)objc_claimAutoreleasedReturnValue();
                          v108 = _AXStringForArgs();
                          if (os_log_type_enabled(v106, v107))
                          {
                            *(_DWORD *)buf = 138543362;
                            id v151 = v108;
                            _os_log_impl(&dword_0, v106, v107, "%{public}@", buf, 0xCu);
                          }
                          goto LABEL_132;
                        }
                        goto LABEL_136;
                      }
                      goto LABEL_122;
                    }
                    self->_uint64_t bluetoothChannelIsLost = 0;
                    self->_BOOL hasBeenUnloaded = 0;
                    CFRunLoopRunResult v83 = CFRunLoopRunInMode(kCFRunLoopDefaultMode, 1.0, 0);
                    CFRunLoopRunResult v84 = v83;
                    if (self->_bluetoothChannelIsLost || self->_hasBeenUnloaded || v83 == kCFRunLoopRunStopped)
                    {
                      v101 = +[AXSubsystemBrailleHardware sharedInstance];
                      unsigned __int8 v102 = [v101 ignoreLogging];

                      if (v102)
                      {
                        v31 = v142;
                        id v4 = v143;
                        id v70 = v130;
                        CFDataRef v78 = v131;
                        goto LABEL_95;
                      }
                      v114 = +[AXSubsystemBrailleHardware identifier];
                      v115 = AXLoggerForFacility();

                      os_log_type_t v116 = AXOSLogLevelFromAXLogLevel();
                      os_log_t loga = v115;
                      if (os_log_type_enabled(v115, v116))
                      {
                        uint64_t v117 = AXColorizeFormatLog();
                        BOOL hasBeenUnloaded = self->_hasBeenUnloaded;
                        uint64_t v129 = v84;
                        uint64_t bluetoothChannelIsLost = self->_bluetoothChannelIsLost;
                        mode = (__CFString *)v117;
                        v108 = _AXStringForArgs();
                        if (os_log_type_enabled(v115, v116))
                        {
                          *(_DWORD *)buf = 138543362;
                          id v151 = v108;
                          _os_log_impl(&dword_0, v115, v116, "%{public}@", buf, 0xCu);
                        }
                        v31 = v142;
                        id v4 = v143;
                        id v70 = v130;
                        CFDataRef v78 = v131;
LABEL_133:

                        v42 = v141;
                      }
                      else
                      {
                        v31 = v142;
                        id v4 = v143;
                        v42 = v141;
                        id v70 = v130;
                        CFDataRef v78 = v131;
                      }
LABEL_137:

LABEL_95:
                      [(SCRDFileReader *)self->_readerThread invalidate];
                      v94 = self->_readerThread;
                      self->_readerThread = 0;

                      safeReadBuffer = self->_safeReadBuffer;
                      if (safeReadBuffer)
                      {
                        CFRelease(safeReadBuffer);
                        self->_safeReadBuffer = 0;
                      }
                      if (v78) {
                        CFRelease(v78);
                      }
                      [v42 removeObserver:self];
                      [(NSLock *)self->_readBufferLock lock];
                      readBuffer = self->_readBuffer;
                      if (readBuffer)
                      {
                        CFRelease(readBuffer);
                        self->_readBuffer = 0;
                      }
                      v97 = self->_readBufferLock;
                      self->_readBufferLock = 0;
                      v98 = v97;

                      [v98 unlock];
                      device = self->_device;
                      self->_device = 0;

                      os_log_t log = 0;
                      self->_int comPort = -1;
                      self->_deviceID = 0;
                      modelIdentifier = self->_modelIdentifier;
                      self->_modelIdentifier = 0;
                      LODWORD(v28) = 2;
LABEL_102:

                      goto LABEL_103;
                    }
                    [(NSLock *)self->_readBufferLock lock];
                    CFIndex v85 = CFDataGetLength(self->_readBuffer);
                    if (v85 >= 1)
                    {
                      CFIndex v86 = v85;
                      v87 = self->_safeReadBuffer;
                      v88 = CFDataGetBytePtr(self->_readBuffer);
                      CFDataAppendBytes(v87, v88, v86);
                      v152.location = 0;
                      v152.length = v86;
                      CFDataDeleteBytes(self->_readBuffer, v152);
                    }
                    [(NSLock *)self->_readBufferLock unlock];
                    uint64_t InitializationPacketFromBuffer = SCRDHumanwareCreateInitializationPacketFromBuffer();
                    CFDataRef v78 = v131;
                    if (InitializationPacketFromBuffer)
                    {
                      v90 = (const void *)InitializationPacketFromBuffer;
                      do
                      {
                        int v91 = SCRDHumanwareDeviceIDForInitializationPacket();
                        if (SCRDHumanwareIsDeviceIDValid())
                        {
                          self->_mainSize = SCRDHumanwareDisplaySizeForDeviceID();
                          self->_deviceID = v91;
                        }
                        CFRelease(v90);
                        v90 = (const void *)SCRDHumanwareCreateInitializationPacketFromBuffer();
                      }
                      while (v90);
                    }
                    ++v79;
                    v42 = v141;
                    if (v79 == 7) {
                      break;
                    }
                  }
                  CFRelease(v78);
                  int v92 = self->_deviceID - 1;
                  if (v92 > 7) {
                    v93 = 0;
                  }
                  else {
                    v93 = (NSString *)*(&off_8258 + v92);
                  }
                  id v25 = v137;
                  v109 = self->_modelIdentifier;
                  self->_modelIdentifier = v93;

                  uint64_t v110 = [v142 objectForKey:self->_modelIdentifier];
                  if (!v110)
                  {
                    v118 = +[AXSubsystemBrailleHardware sharedInstance];
                    unsigned __int8 v119 = [v118 ignoreLogging];

                    if ((v119 & 1) == 0)
                    {
                      v123 = +[AXSubsystemBrailleHardware identifier];
                      v124 = AXLoggerForFacility();

                      os_log_type_t v125 = AXOSLogLevelFromAXLogLevel();
                      os_log_t loga = v124;
                      if (os_log_type_enabled(v124, v125))
                      {
                        uint64_t v126 = AXColorizeFormatLog();
                        uint64_t bluetoothChannelIsLost = (uint64_t)self->_modelIdentifier;
                        mode = (__CFString *)v126;
                        v108 = _AXStringForArgs();
                        if (os_log_type_enabled(v124, v125))
                        {
                          *(_DWORD *)buf = 138543362;
                          id v151 = v108;
                          _os_log_impl(&dword_0, v124, v125, "%{public}@", buf, 0xCu);
                        }
                        CFDataRef v78 = 0;
LABEL_132:
                        v31 = v142;
                        id v4 = v143;
                        id v70 = v130;
                        goto LABEL_133;
                      }
                      CFDataRef v78 = 0;
LABEL_136:
                      v31 = v142;
                      id v4 = v143;
                      v42 = v141;
                      id v70 = v130;
                      goto LABEL_137;
                    }
                    CFDataRef v78 = 0;
LABEL_122:
                    v31 = v142;
                    id v4 = v143;
                    id v70 = v130;
                    goto LABEL_95;
                  }
                  v111 = v110;
                  self->_isDriverLoaded = 1;
                  v112 = +[AXSubsystemBrailleHardware sharedInstance];
                  unsigned __int8 v113 = [v112 ignoreLogging];

                  os_log_t log = v111;
                  if (v113)
                  {
                    LODWORD(v28) = 0;
                    v31 = v142;
                    id v4 = v143;
                    id v70 = v130;
                    goto LABEL_104;
                  }
                  v120 = +[AXSubsystemBrailleHardware identifier];
                  v98 = AXLoggerForFacility();

                  os_log_type_t v121 = AXOSLogLevelFromAXLogLevel();
                  if (os_log_type_enabled(v98, v121))
                  {
                    AXColorizeFormatLog();
                    CFRunLoopMode modea = (CFRunLoopMode)objc_claimAutoreleasedReturnValue();
                    v122 = _AXStringForArgs();
                    if (os_log_type_enabled(v98, v121))
                    {
                      *(_DWORD *)buf = 138543362;
                      id v151 = v122;
                      _os_log_impl(&dword_0, v98, v121, "%{public}@", buf, 0xCu);
                    }

                    LODWORD(v28) = 0;
                    v31 = v142;
                    id v4 = v143;
                    v42 = v141;
                    id v70 = v130;
                    modelIdentifier = &modea->isa;
                    goto LABEL_102;
                  }
                  LODWORD(v28) = 0;
                  v31 = v142;
                  id v4 = v143;
                  v42 = v141;
                  id v70 = v130;
LABEL_103:

                  id v25 = v137;
LABEL_104:

                  goto LABEL_58;
                }
              }
              CFDataRef v78 = 0;
            }
            else
            {
              CFDataRef v78 = 0;
              id v4 = v143;
            }
            v31 = v142;
            goto LABEL_95;
          }
          uint64_t v28 = v43;
          v44 = +[AXSubsystemBrailleHardware sharedInstance];
          unsigned __int8 v45 = [v44 ignoreLogging];

          if ((v45 & 1) == 0)
          {
            id v136 = v25;
            v139 = v42;
            v46 = +[AXSubsystemBrailleHardware identifier];
            v47 = AXLoggerForFacility();

            os_log_type_t v48 = AXOSLogLevelFromAXLogLevel();
            if (os_log_type_enabled(v47, v48))
            {
              v49 = AXColorizeFormatLog();
              uint64_t bluetoothChannelIsLost = +[NSNumber numberWithUnsignedInt:v28];
              v50 = _AXStringForArgs();

              if (os_log_type_enabled(v47, v48))
              {
                *(_DWORD *)buf = 138543362;
                id v151 = v50;
                _os_log_impl(&dword_0, v47, v48, "%{public}@", buf, 0xCu);
              }
            }
            id v25 = v136;
            v42 = v139;
          }
          -[NSObject removeObserver:](v42, "removeObserver:", self, bluetoothChannelIsLost);
        }
        else
        {
          v53 = +[AXSubsystemBrailleHardware sharedInstance];
          unsigned __int8 v54 = [v53 ignoreLogging];

          if ((v54 & 1) == 0)
          {
            v140 = v42;
            id v55 = v25;
            v56 = +[AXSubsystemBrailleHardware identifier];
            v57 = AXLoggerForFacility();

            os_log_type_t v58 = AXOSLogLevelFromAXLogLevel();
            if (os_log_type_enabled(v57, v58))
            {
              v59 = AXColorizeFormatLog();
              v60 = _AXStringForArgs();
              if (os_log_type_enabled(v57, v58))
              {
                *(_DWORD *)buf = 138543362;
                id v151 = v60;
                _os_log_impl(&dword_0, v57, v58, "%{public}@", buf, 0xCu);
              }
            }
            id v25 = v55;
            v14 = v144;
            v42 = v140;
          }
          -[NSObject removeObserver:](v42, "removeObserver:", self, bluetoothChannelIsLost);
          LODWORD(v28) = 1;
        }
        id v4 = v143;
      }
      else
      {
        v51 = +[AXSubsystemBrailleHardware sharedInstance];
        unsigned __int8 v52 = [v51 ignoreLogging];

        id v4 = v143;
        if (v52)
        {
          LODWORD(v28) = 1;
          v31 = v142;
LABEL_59:

LABEL_60:
LABEL_61:

LABEL_62:
          goto LABEL_63;
        }
        v64 = +[AXSubsystemBrailleHardware identifier];
        v42 = AXLoggerForFacility();

        LODWORD(v28) = 1;
        os_log_type_t v65 = AXOSLogLevelFromAXLogLevel();
        if (os_log_type_enabled(v42, v65))
        {
          AXColorizeFormatLog();
          v67 = v66 = v42;
          v68 = _AXStringForArgs();
          v69 = v66;
          if (os_log_type_enabled(v66, v65))
          {
            *(_DWORD *)buf = 138543362;
            id v151 = v68;
            _os_log_impl(&dword_0, v66, v65, "%{public}@", buf, 0xCu);
          }

          v31 = v142;
          id v4 = v143;
          v42 = v69;
          goto LABEL_58;
        }
      }
      v31 = v142;
LABEL_58:

      goto LABEL_59;
    }
    v32 = +[AXSubsystemBrailleHardware sharedInstance];
    unsigned __int8 v33 = [v32 ignoreLogging];

    if ((v33 & 1) == 0)
    {
      v62 = +[AXSubsystemBrailleHardware identifier];
      v14 = AXLoggerForFacility();

      LODWORD(v28) = 1;
      os_log_type_t v63 = AXOSLogLevelFromAXLogLevel();
      if (!os_log_type_enabled(v14, v63)) {
        goto LABEL_62;
      }
      v31 = AXColorizeFormatLog();
      _AXStringForArgs();
      id v25 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, v63))
      {
        *(_DWORD *)buf = 138543362;
        id v151 = v25;
        _os_log_impl(&dword_0, v14, v63, "%{public}@", buf, 0xCu);
      }
      goto LABEL_60;
    }
    LODWORD(v28) = 1;
LABEL_63:

    goto LABEL_64;
  }
  v26 = +[AXSubsystemBrailleHardware sharedInstance];
  unsigned __int8 v27 = [v26 ignoreLogging];

  if ((v27 & 1) == 0)
  {
    v29 = +[AXSubsystemBrailleHardware identifier];
    v12 = AXLoggerForFacility();

    LODWORD(v28) = 1;
    os_log_type_t v30 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v12, v30))
    {
      v14 = AXColorizeFormatLog();
      [v4 transport];
      [v4 conformsToProtocol:&OBJC_PROTOCOL___SCROIOBluetoothElementProtocol];
      v31 = _AXStringForArgs();
      if (os_log_type_enabled(v12, v30))
      {
        *(_DWORD *)buf = 138543362;
        id v151 = v31;
        _os_log_impl(&dword_0, v12, v30, "%{public}@", buf, 0xCu);
      }
      goto LABEL_61;
    }
    goto LABEL_63;
  }
  LODWORD(v28) = 1;
LABEL_64:

  return v28;
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
    readBufferLock = self->_readBufferLock;
    self->_readBufferLock = 0;
    v15 = readBufferLock;

    [(NSLock *)v15 unlock];
    [(BluetoothDevice *)self->_device disconnect];
    device = self->_device;
    self->_device = 0;

    self->_int comPort = -1;
    self->_uint64_t bluetoothChannelIsLost = 1;
    modelIdentifier = self->_modelIdentifier;
    self->_modelIdentifier = 0;

    self->_mainSize = 0;
    self->_deviceID = 0;
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
  return (self->_deviceID < 9u) & (0x1C6u >> self->_deviceID);
}

- (int)brailleInputMode
{
  int deviceID = self->_deviceID;
  if (deviceID - 1) < 8 && ((0xA3u >> (deviceID - 1))) {
    return 2;
  }
  else {
    return 2 * (deviceID == 7);
  }
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
  uint64_t deviceID = self->_deviceID;

  return (id)_SCRDHumanwareExtractEventsFromBuffer(v8, deviceID, 0);
}

- (BOOL)setMainCells:(const char *)a3 length:(int64_t)a4
{
  CFDataRef v5 = (const __CFData *)SCRDHumanwareCreateWriteRequestPacket();
  if (!v5) {
    return 0;
  }
  CFDataRef v6 = v5;
  if (self->_comPort == -1)
  {
    BOOL v10 = 0;
  }
  else
  {
    size_t Length = CFDataGetLength(v5);
    int comPort = self->_comPort;
    BytePtr = CFDataGetBytePtr(v6);
    BOOL v10 = write(comPort, BytePtr, Length) == Length;
  }
  CFRelease(v6);
  return v10;
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
  id v4 = a3;
  CFDataRef v5 = AXLogBrailleHW();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v4;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Brailliant2 remove device: %@", (uint8_t *)&v9, 0xCu);
  }

  CFDataRef v6 = [v4 object];
  os_log_type_t v7 = v6;
  if (v6)
  {
    if (v6 == self->_device)
    {
      self->_uint64_t bluetoothChannelIsLost = 1;
      if (self->_isDriverLoaded)
      {
        v8 = +[NSNotificationCenter defaultCenter];
        [v8 postNotificationName:@"SCROBrailleDriverProtocolUnloadNotification" object:self userInfo:0];
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