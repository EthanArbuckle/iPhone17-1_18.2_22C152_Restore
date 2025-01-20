@interface MSCROSeikaBrailleDriver
- (BOOL)isDriverLoaded;
- (BOOL)isInputEnabled;
- (BOOL)isSleeping;
- (BOOL)postsKeyboardEvents;
- (BOOL)setMainCells:(const char *)a3 length:(int64_t)a4;
- (BOOL)setStatusCells:(const char *)a3 length:(int64_t)a4;
- (BOOL)supportsBlinkingCursor;
- (BOOL)unloadDriver;
- (MSCROSeikaBrailleDriver)init;
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

@implementation MSCROSeikaBrailleDriver

- (MSCROSeikaBrailleDriver)init
{
  v3.receiver = self;
  v3.super_class = (Class)MSCROSeikaBrailleDriver;
  result = [(MSCROSeikaBrailleDriver *)&v3 init];
  if (result)
  {
    result->_isDriverLoaded = 0;
    result->_comPort = -1;
  }
  return result;
}

- (void)dealloc
{
  [(MSCROSeikaBrailleDriver *)self unloadDriver];
  v3.receiver = self;
  v3.super_class = (Class)MSCROSeikaBrailleDriver;
  [(MSCROSeikaBrailleDriver *)&v3 dealloc];
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
        int buf = 138543362;
        v160 = v11;
        _os_log_impl(&dword_0, v8, v9, "%{public}@", (uint8_t *)&buf, 0xCu);
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
        [(MSCROSeikaBrailleDriver *)self unloadDriver];
      }
      v148 = v12;
      v150 = [v12 infoDictionary];
      v149 = [v150 objectForKey:kSCROBrailleDriverModels];
      v14 = [v4 bluetoothAddress];
      long long v153 = 0u;
      long long v154 = 0u;
      long long v155 = 0u;
      long long v156 = 0u;
      v15 = +[BluetoothManager sharedInstance];
      v16 = [v15 pairedDevices];

      id v17 = [v16 countByEnumeratingWithState:&v153 objects:v161 count:16];
      if (v17)
      {
        id v18 = v17;
        uint64_t v19 = *(void *)v154;
        do
        {
          for (i = 0; i != v18; i = (char *)i + 1)
          {
            if (*(void *)v154 != v19) {
              objc_enumerationMutation(v16);
            }
            v21 = *(void **)(*((void *)&v153 + 1) + 8 * i);
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
                  v146 = v32;
                  [v31 device];
                  int ComPortForServiceWithSandboxExtension = BTDeviceGetComPortForServiceWithSandboxExtension();
                  if (ComPortForServiceWithSandboxExtension)
                  {
                    int v34 = ComPortForServiceWithSandboxExtension;
                    v35 = +[AXSubsystemBrailleHardware sharedInstance];
                    unsigned __int8 v36 = [v35 ignoreLogging];

                    v30 = v149;
                    v29 = v150;
                    if ((v36 & 1) == 0)
                    {
                      v37 = +[AXSubsystemBrailleHardware identifier];
                      v38 = AXLoggerForFacility();

                      os_log_type_t v39 = AXOSLogLevelFromAXLogLevel();
                      if (os_log_type_enabled(v38, v39))
                      {
                        v40 = AXColorizeFormatLog();
                        bluetoothChannelIsLost = (NSString *)v34;
                        v41 = _AXStringForArgs();
                        if (os_log_type_enabled(v38, v39))
                        {
                          *(_DWORD *)v157 = 138543362;
                          v158 = v41;
                          _os_log_impl(&dword_0, v38, v39, "%{public}@", v157, 0xCu);
                        }
                      }
                    }
                    v32 = v146;
                  }
                  else
                  {
                    v30 = v149;
                    v29 = v150;
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
                          uint64_t v63 = AXColorizeFormatLog();
                          bluetoothChannelIsLost = (NSString *)*__error();
                          v144 = (void *)v63;
                          v64 = _AXStringForArgs();
                          if (os_log_type_enabled(v61, v62))
                          {
                            *(_DWORD *)v157 = 138543362;
                            v158 = v64;
                            _os_log_impl(&dword_0, v61, v62, "%{public}@", v157, 0xCu);
                          }
                        }
                      }
                    }
                    int v65 = open((const char *)&buf, 131074, bluetoothChannelIsLost);
                    self->_comPort = v65;
                    if ((v65 & 0x80000000) == 0)
                    {
                      objc_storeStrong((id *)&self->_device, v21);
                      id v66 = [objc_allocWithZone((Class)NSFileHandle) initWithFileDescriptor:self->_comPort closeOnDealloc:1];
                      v67 = (SCRDFileReader *)[objc_allocWithZone((Class)SCRDFileReader) initWithDelegate:self fileHandle:v66];
                      readerThread = self->_readerThread;
                      self->_readerThread = v67;

                      id v69 = objc_allocWithZone((Class)NSConstantValueExpression);
                      id v70 = [v69 initWithObject:kSCRDSeikaNotetakerBluetoothNameRegExPattern];
                      id v71 = objc_allocWithZone((Class)NSComparisonPredicate);
                      v72 = +[NSExpression expressionForEvaluatedObject];
                      v143 = v70;
                      id v145 = [v71 initWithLeftExpression:v72 rightExpression:v70 modifier:0 type:6 options:0];

                      Mutable = CFDataCreateMutable(kCFAllocatorDefault, 0);
                      self->_safeReadBuffer = Mutable;
                      if (!Mutable) {
                        goto LABEL_127;
                      }
                      v74 = (NSLock *)[objc_allocWithZone((Class)NSLock) init];
                      readBufferLock = self->_readBufferLock;
                      self->_readBufferLock = v74;

                      if (!self->_readBufferLock) {
                        goto LABEL_127;
                      }
                      v76 = CFDataCreateMutable(kCFAllocatorDefault, 0);
                      self->_readBuffer = v76;
                      if (!v76) {
                        goto LABEL_127;
                      }
                      id v141 = v66;
                      [(SCRDFileReader *)self->_readerThread start];
                      v77 = [(BluetoothDevice *)self->_device name];
                      id v78 = [v145 evaluateWithObject:v77];

                      id v79 = v78;
                      int v80 = 0;
                      if (v78) {
                        char v81 = -95;
                      }
                      else {
                        char v81 = 10;
                      }
                      __int16 __buf = -1;
                      char v152 = v81;
                      while (1)
                      {
                        modelIdentifier = self->_modelIdentifier;
                        if (modelIdentifier) {
                          goto LABEL_116;
                        }
                        if ((unint64_t)write(self->_comPort, &__buf, 3uLL) <= 2) {
                          break;
                        }
                        self->_bluetoothChannelIsLost = 0;
                        self->_BOOL hasBeenUnloaded = 0;
                        CFRunLoopRunResult v83 = CFRunLoopRunInMode(kCFRunLoopDefaultMode, 1.0, 0);
                        CFRunLoopRunResult v84 = v83;
                        if (self->_bluetoothChannelIsLost || self->_hasBeenUnloaded || v83 == kCFRunLoopRunStopped)
                        {
                          v110 = +[AXSubsystemBrailleHardware sharedInstance];
                          unsigned __int8 v111 = [v110 ignoreLogging];

                          id v66 = v141;
                          if (v111) {
                            goto LABEL_127;
                          }
                          v112 = +[AXSubsystemBrailleHardware identifier];
                          v113 = AXLoggerForFacility();

                          v114 = v113;
                          os_log_type_t v115 = AXOSLogLevelFromAXLogLevel();
                          if (!os_log_type_enabled(v113, v115))
                          {
                            id v66 = v141;
                            goto LABEL_126;
                          }
                          v116 = AXColorizeFormatLog();
                          BOOL hasBeenUnloaded = self->_hasBeenUnloaded;
                          uint64_t v140 = v84;
                          bluetoothChannelIsLost = (NSString *)self->_bluetoothChannelIsLost;
                          v117 = _AXStringForArgs();
                          if (os_log_type_enabled(v114, v115))
                          {
                            *(_DWORD *)v157 = 138543362;
                            v158 = v117;
                            _os_log_impl(&dword_0, v114, v115, "%{public}@", v157, 0xCu);
                          }
                          id v66 = v141;
                          goto LABEL_124;
                        }
                        [(NSLock *)self->_readBufferLock lock];
                        readBuffer = self->_readBuffer;
                        if (readBuffer)
                        {
                          CFIndex Length = CFDataGetLength(readBuffer);
                          if (Length >= 1)
                          {
                            CFIndex v87 = Length;
                            id v88 = v79;
                            safeReadBuffer = self->_safeReadBuffer;
                            BytePtr = CFDataGetBytePtr(self->_readBuffer);
                            v91 = safeReadBuffer;
                            id v79 = v88;
                            CFDataAppendBytes(v91, BytePtr, v87);
                            v162.location = 0;
                            v162.length = v87;
                            CFDataDeleteBytes(self->_readBuffer, v162);
                          }
                        }
                        [(NSLock *)self->_readBufferLock unlock];
                        if (v79)
                        {
                          uint64_t PacketFromBuffer = SCRDSeikaNotetakerCreatePacketFromBuffer();
                          if (PacketFromBuffer)
                          {
                            CFDataRef v93 = (const __CFData *)PacketFromBuffer;
                            do
                            {
                              v94 = CFDataGetBytePtr(v93);
                              if (v94[2] == 162)
                              {
                                HIDWORD(v96) = v94[5];
                                LODWORD(v96) = HIDWORD(v96) - 8;
                                signed int v95 = v96 >> 3;
                                if v95 <= 4 && ((0x17u >> v95))
                                {
                                  int v97 = dword_7078[v95];
                                  v98 = (NSString *)*(&off_8260 + v95);
                                  self->_deviceID = v97;
                                  v99 = self->_modelIdentifier;
                                  self->_modelIdentifier = v98;
                                }
                              }
                              CFRelease(v93);
                              CFDataRef v93 = (const __CFData *)SCRDSeikaNotetakerCreatePacketFromBuffer();
                            }
                            while (v93);
                          }
                        }
                        else
                        {
                          while (1)
                          {
                            Identityuint64_t PacketFromBuffer = (const void *)SCRDSeikaCreateIdentityPacketFromBuffer();
                            if (!IdentityPacketFromBuffer) {
                              break;
                            }
                            if (CFDataGetBytePtr(self->_safeReadBuffer)[2] == 40)
                            {
                              self->_deviceID = 1;
                              v101 = self->_modelIdentifier;
                              self->_modelIdentifier = (NSString *)@"com.apple.scrod.braille.driver.nippon.telesoft.seika.40";
                            }
                            CFRelease(IdentityPacketFromBuffer);
                          }
                        }
                        if (++v80 == 5)
                        {
                          modelIdentifier = self->_modelIdentifier;
LABEL_116:
                          v123 = [v149 objectForKey:modelIdentifier];
                          v32 = v146;
                          id v66 = v141;
                          if (v123)
                          {
                            v124 = v123;
                            v125 = [v123 objectForKey:kSCROBrailleDriverMainDisplaySize];
                            self->_mainSize = [v125 unsignedCharValue];

                            self->_isDriverLoaded = 1;
                            int v26 = 0;
                            v12 = v148;
                            goto LABEL_132;
                          }
                          v126 = +[AXSubsystemBrailleHardware sharedInstance];
                          unsigned __int8 v127 = [v126 ignoreLogging];

                          if ((v127 & 1) == 0)
                          {
                            v128 = +[AXSubsystemBrailleHardware identifier];
                            uint64_t v129 = AXLoggerForFacility();

                            v114 = v129;
                            os_log_type_t v122 = AXOSLogLevelFromAXLogLevel();
                            if (os_log_type_enabled(v114, v122))
                            {
                              uint64_t v130 = AXColorizeFormatLog();
                              bluetoothChannelIsLost = self->_modelIdentifier;
                              CFRunLoopMode mode = (CFRunLoopMode)v130;
                              v117 = _AXStringForArgs();
                              if (os_log_type_enabled(v114, v122))
                              {
                                *(_DWORD *)v157 = 138543362;
                                v158 = v117;
LABEL_122:
                                _os_log_impl(&dword_0, v114, v122, "%{public}@", v157, 0xCu);
                              }
                              goto LABEL_123;
                            }
LABEL_126:
                          }
LABEL_127:
                          [(SCRDFileReader *)self->_readerThread invalidate];
                          v131 = self->_readerThread;
                          self->_readerThread = 0;

                          v132 = self->_safeReadBuffer;
                          if (v132)
                          {
                            CFRelease(v132);
                            self->_safeReadBuffer = 0;
                          }
                          v32 = v146;
                          [v146 removeObserver:self];
                          [(NSLock *)self->_readBufferLock lock];
                          v133 = self->_readBuffer;
                          v12 = v148;
                          if (v133)
                          {
                            CFRelease(v133);
                            self->_readBuffer = 0;
                          }
                          v134 = self->_readBufferLock;
                          self->_readBufferLock = 0;
                          v135 = v134;

                          [(NSLock *)v135 unlock];
                          device = self->_device;
                          self->_device = 0;

                          self->_comPort = -1;
                          v137 = self->_modelIdentifier;
                          self->_modelIdentifier = 0;

                          self->_deviceID = 0;
                          int v26 = 2;
LABEL_132:

LABEL_100:
LABEL_101:

LABEL_102:
LABEL_103:

LABEL_104:
                          goto LABEL_105;
                        }
                      }
                      v118 = +[AXSubsystemBrailleHardware sharedInstance];
                      unsigned __int8 v119 = [v118 ignoreLogging];

                      id v66 = v141;
                      if (v119) {
                        goto LABEL_127;
                      }
                      v120 = +[AXSubsystemBrailleHardware identifier];
                      uint64_t v121 = AXLoggerForFacility();

                      v114 = v121;
                      os_log_type_t v122 = AXOSLogLevelFromAXLogLevel();
                      if (!os_log_type_enabled(v114, v122)) {
                        goto LABEL_126;
                      }
                      AXColorizeFormatLog();
                      CFRunLoopMode mode = (CFRunLoopMode)objc_claimAutoreleasedReturnValue();
                      v117 = _AXStringForArgs();
                      if (os_log_type_enabled(v114, v122))
                      {
                        *(_DWORD *)v157 = 138543362;
                        v158 = v117;
                        goto LABEL_122;
                      }
LABEL_123:
                      v116 = (void *)mode;
LABEL_124:

                      goto LABEL_126;
                    }
                    v102 = +[AXSubsystemBrailleHardware sharedInstance];
                    unsigned __int8 v103 = [v102 ignoreLogging];

                    v32 = v146;
                    if ((v103 & 1) == 0)
                    {
                      v104 = +[AXSubsystemBrailleHardware identifier];
                      v105 = AXLoggerForFacility();

                      os_log_type_t v106 = AXOSLogLevelFromAXLogLevel();
                      if (os_log_type_enabled(v105, v106))
                      {
                        v107 = AXColorizeFormatLog();
                        bluetoothChannelIsLost = (NSString *)self->_comPort;
                        v108 = _AXStringForArgs();
                        if (os_log_type_enabled(v105, v106))
                        {
                          *(_DWORD *)v157 = 138543362;
                          v158 = v108;
                          _os_log_impl(&dword_0, v105, v106, "%{public}@", v157, 0xCu);
                        }

                        v32 = v146;
                      }
                    }
                    self->_comPort = -1;
                  }
                }
                else
                {
                  v51 = +[AXSubsystemBrailleHardware sharedInstance];
                  unsigned __int8 v52 = [v51 ignoreLogging];

                  v30 = v149;
                  v29 = v150;
                  if ((v52 & 1) == 0)
                  {
                    v53 = +[AXSubsystemBrailleHardware identifier];
                    v54 = AXLoggerForFacility();

                    os_log_type_t v55 = AXOSLogLevelFromAXLogLevel();
                    if (os_log_type_enabled(v54, v55))
                    {
                      v56 = v32;
                      v57 = AXColorizeFormatLog();
                      v147 = _AXStringForArgs();
                      if (os_log_type_enabled(v54, v55))
                      {
                        int buf = 138543362;
                        v160 = v147;
                        _os_log_impl(&dword_0, v54, v55, "%{public}@", (uint8_t *)&buf, 0xCu);
                      }

                      v32 = v56;
                    }
                  }
                }
                objc_msgSend(v32, "removeObserver:", self, bluetoothChannelIsLost);
LABEL_99:
                int v26 = 1;
                v12 = v148;
                goto LABEL_100;
              }
LABEL_36:
              v42 = +[AXSubsystemBrailleHardware sharedInstance];
              unsigned __int8 v43 = [v42 ignoreLogging];

              if (v43)
              {
                int v26 = 1;
                v12 = v148;
                v30 = v149;
                v29 = v150;
                goto LABEL_102;
              }
              v46 = +[AXSubsystemBrailleHardware identifier];
              v31 = AXLoggerForFacility();

              int v26 = 1;
              os_log_type_t v47 = AXOSLogLevelFromAXLogLevel();
              v29 = v150;
              if (!os_log_type_enabled(v31, v47))
              {
                v12 = v148;
                v30 = v149;
                goto LABEL_101;
              }
              v32 = AXColorizeFormatLog();
              v48 = _AXStringForArgs();
              v30 = v149;
              if (os_log_type_enabled(v31, v47))
              {
                int buf = 138543362;
                v160 = v48;
                _os_log_impl(&dword_0, v31, v47, "%{public}@", (uint8_t *)&buf, 0xCu);
              }

              goto LABEL_99;
            }
          }
          id v18 = [v16 countByEnumeratingWithState:&v153 objects:v161 count:16];
        }
        while (v18);
      }

      goto LABEL_36;
    }
    v44 = +[AXSubsystemBrailleHardware sharedInstance];
    unsigned __int8 v45 = [v44 ignoreLogging];

    if ((v45 & 1) == 0)
    {
      v49 = +[AXSubsystemBrailleHardware identifier];
      v29 = AXLoggerForFacility();

      int v26 = 1;
      os_log_type_t v50 = AXOSLogLevelFromAXLogLevel();
      if (os_log_type_enabled(v29, v50))
      {
        v30 = AXColorizeFormatLog();
        v14 = _AXStringForArgs();
        if (os_log_type_enabled(v29, v50))
        {
          int buf = 138543362;
          v160 = v14;
          _os_log_impl(&dword_0, v29, v50, "%{public}@", (uint8_t *)&buf, 0xCu);
        }
        goto LABEL_102;
      }
      goto LABEL_104;
    }
    int v26 = 1;
LABEL_105:
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
          int buf = 138543362;
          v160 = v30;
          _os_log_impl(&dword_0, v12, v28, "%{public}@", (uint8_t *)&buf, 0xCu);
        }
        goto LABEL_103;
      }
      goto LABEL_105;
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
        int v19 = 138543362;
        v20 = v9;
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

    self->_comPort = -1;
    self->_bluetoothChannelIsLost = 1;
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
  return (self->_deviceID - 3) < 4;
}

- (int)brailleInputMode
{
  return 2 * ((self->_deviceID - 3) < 4);
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

  return (id)_SCRDSeikaExtractEventsFromBuffer(v8, deviceID);
}

- (BOOL)setMainCells:(const char *)a3 length:(int64_t)a4
{
  CFDataRef v5 = (const __CFData *)SCRDSeikaCreateWriteRequestPacket();
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
  +[NSThread sleepForTimeInterval:0.005];
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