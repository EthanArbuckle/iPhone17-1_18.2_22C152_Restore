@interface MSCROBaumBrailleDriver
- (BOOL)isDriverLoaded;
- (BOOL)isInputEnabled;
- (BOOL)isSleeping;
- (BOOL)postsKeyboardEvents;
- (BOOL)setMainCells:(const char *)a3 length:(int64_t)a4;
- (BOOL)setStatusCells:(const char *)a3 length:(int64_t)a4;
- (BOOL)supportsBlinkingCursor;
- (BOOL)unloadDriver;
- (MSCROBaumBrailleDriver)init;
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

@implementation MSCROBaumBrailleDriver

- (MSCROBaumBrailleDriver)init
{
  v3.receiver = self;
  v3.super_class = (Class)MSCROBaumBrailleDriver;
  result = [(MSCROBaumBrailleDriver *)&v3 init];
  if (result)
  {
    result->_isDriverLoaded = 0;
    result->_nextInitRequestTime = -3061152000.0;
    result->_comPort = -1;
  }
  return result;
}

- (void)dealloc
{
  [(MSCROBaumBrailleDriver *)self unloadDriver];
  v3.receiver = self;
  v3.super_class = (Class)MSCROBaumBrailleDriver;
  [(MSCROBaumBrailleDriver *)&v3 dealloc];
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
        v163 = v11;
        _os_log_impl(&dword_0, v8, v9, "%{public}@", (uint8_t *)&buf, 0xCu);
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
        [(MSCROBaumBrailleDriver *)self unloadDriver];
      }
      v148 = v12;
      v150 = [v12 infoDictionary];
      v151 = [v150 objectForKey:kSCROBrailleDriverModels];
      id v149 = v4;
      v14 = [v4 bluetoothAddress];
      long long v155 = 0u;
      long long v156 = 0u;
      long long v157 = 0u;
      long long v158 = 0u;
      v15 = +[BluetoothManager sharedInstance];
      v16 = [v15 pairedDevices];

      id v17 = [v16 countByEnumeratingWithState:&v155 objects:v164 count:16];
      if (v17)
      {
        id v18 = v17;
        uint64_t v19 = *(void *)v156;
        do
        {
          for (i = 0; i != v18; i = (char *)i + 1)
          {
            if (*(void *)v156 != v19) {
              objc_enumerationMutation(v16);
            }
            v21 = *(void **)(*((void *)&v155 + 1) + 8 * i);
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
                        _AXStringForArgs();
                        v42 = (__CFString *)objc_claimAutoreleasedReturnValue();
                        if (os_log_type_enabled(v39, v40))
                        {
                          *(_DWORD *)v160 = 138543362;
                          v161 = v42;
                          _os_log_impl(&dword_0, v39, v40, "%{public}@", v160, 0xCu);
                        }
                      }
                    }
                    v32 = v33;
                    v43 = v33;
                  }
                  else
                  {
                    if (sandbox_extension_consume() == -1)
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
                          v58 = AXColorizeFormatLog();
                          bluetoothChannelIsLost = (NSString *)*__error();
                          _AXStringForArgs();
                          v59 = (__CFString *)objc_claimAutoreleasedReturnValue();
                          if (os_log_type_enabled(v56, v57))
                          {
                            *(_DWORD *)v160 = 138543362;
                            v161 = v59;
                            _os_log_impl(&dword_0, v56, v57, "%{public}@", v160, 0xCu);
                          }
                        }
                      }
                    }
                    int v60 = open((const char *)&buf, 131074, bluetoothChannelIsLost);
                    self->_comPort = v60;
                    if ((v60 & 0x80000000) == 0)
                    {
                      objc_storeStrong((id *)&self->_device, v21);
                      id v61 = [objc_allocWithZone((Class)NSFileHandle) initWithFileDescriptor:self->_comPort closeOnDealloc:1];
                      v62 = (SCRDFileReader *)[objc_allocWithZone((Class)SCRDFileReader) initWithDelegate:self fileHandle:v61];
                      readerThread = self->_readerThread;
                      self->_readerThread = v62;

                      Mutable = CFDataCreateMutable(kCFAllocatorDefault, 0);
                      self->_safeReadBuffer = Mutable;
                      v147 = v61;
                      if (!Mutable) {
                        goto LABEL_118;
                      }
                      v65 = (NSLock *)[objc_allocWithZone((Class)NSLock) init];
                      readBufferLock = self->_readBufferLock;
                      self->_readBufferLock = v65;

                      if (!self->_readBufferLock) {
                        goto LABEL_118;
                      }
                      v67 = CFDataCreateMutable(kCFAllocatorDefault, 0);
                      self->_readBuffer = v67;
                      if (!v67) {
                        goto LABEL_118;
                      }
                      [(SCRDFileReader *)self->_readerThread start];
                      unsigned int v68 = 0;
                      uint64_t v69 = 0;
                      memset(v159, 0, 19);
                      while (1)
                      {
                        char v154 = 1;
                        __int16 __buf = 5403;
                        if ((unint64_t)write(self->_comPort, &__buf, 3uLL) <= 2) {
                          goto LABEL_118;
                        }
                        __int16 v152 = -31717;
                        if ((unint64_t)write(self->_comPort, &v152, 2uLL) <= 1) {
                          break;
                        }
                        self->_bluetoothChannelIsLost = 0;
                        self->_BOOL hasBeenUnloaded = 0;
                        CFRunLoopRunResult v70 = CFRunLoopRunInMode(kCFRunLoopDefaultMode, 0.2, 0);
                        CFRunLoopRunResult v71 = v70;
                        if (self->_bluetoothChannelIsLost || self->_hasBeenUnloaded || v70 == kCFRunLoopRunStopped)
                        {
                          v110 = +[AXSubsystemBrailleHardware sharedInstance];
                          unsigned __int8 v111 = [v110 ignoreLogging];

                          if (v111) {
                            goto LABEL_118;
                          }
                          v112 = +[AXSubsystemBrailleHardware identifier];
                          v113 = AXLoggerForFacility();

                          os_log_type_t v114 = AXOSLogLevelFromAXLogLevel();
                          if (os_log_type_enabled(v113, v114))
                          {
                            v115 = AXColorizeFormatLog();
                            BOOL hasBeenUnloaded = self->_hasBeenUnloaded;
                            uint64_t v145 = v71;
                            bluetoothChannelIsLost = (NSString *)self->_bluetoothChannelIsLost;
                            _AXStringForArgs();
                            v116 = (__CFString *)objc_claimAutoreleasedReturnValue();
                            if (os_log_type_enabled(v113, v114))
                            {
                              *(_DWORD *)v160 = 138543362;
                              v161 = v116;
                              v117 = v113;
                              os_log_type_t v118 = v114;
                              goto LABEL_114;
                            }
                            goto LABEL_115;
                          }
                          goto LABEL_116;
                        }
                        [(NSLock *)self->_readBufferLock lock];
                        CFIndex Length = CFDataGetLength(self->_readBuffer);
                        if (Length >= 1)
                        {
                          CFIndex v73 = Length;
                          uint64_t v74 = v69;
                          safeReadBuffer = self->_safeReadBuffer;
                          BytePtr = CFDataGetBytePtr(self->_readBuffer);
                          v77 = safeReadBuffer;
                          uint64_t v69 = v74;
                          CFDataAppendBytes(v77, BytePtr, v73);
                          v165.location = 0;
                          v165.length = v73;
                          CFDataDeleteBytes(self->_readBuffer, v165);
                        }
                        [(NSLock *)self->_readBufferLock unlock];
                        uint64_t PacketFromBuffer = SCRDBaumCreatePacketFromBuffer();
                        if (PacketFromBuffer)
                        {
                          CFDataRef v80 = (const __CFData *)PacketFromBuffer;
                          int v81 = 0;
                          do
                          {
                            v82 = CFDataGetBytePtr(v80);
                            int v83 = *v82;
                            if (v83 == 132)
                            {
                              long long v84 = *(_OWORD *)(v82 + 1);
                              LOWORD(v159[1]) = *(_WORD *)(v82 + 17);
                              v159[0] = v84;
                              int v81 = 1;
                            }
                            else if (v83 == 23)
                            {
                              uint64_t v69 = 1;
                            }
                            else
                            {
                              uint64_t v69 = v69;
                            }
                            CFRelease(v80);
                            CFDataRef v80 = (const __CFData *)SCRDBaumCreatePacketFromBuffer();
                          }
                          while (v80);
                          BOOL v79 = v68++ > 5;
                          int v85 = v79;
                          if ((v85 | v81))
                          {
                            if (v81)
                            {
                              char v86 = v69;
                              v87 = +[NSString stringWithUTF8String:v159];
                              _modelIdentifierForDeviceIdentifier(v87, &self->_deviceID);
                              v88 = (NSString *)objc_claimAutoreleasedReturnValue();
                              modelIdentifier = self->_modelIdentifier;
                              self->_modelIdentifier = v88;

                              v90 = [v151 objectForKey:self->_modelIdentifier];
                              v91 = +[AXSubsystemBrailleHardware sharedInstance];
                              unsigned __int8 v92 = [v91 ignoreLogging];

                              if (v90)
                              {
                                if ((v92 & 1) == 0)
                                {
                                  v93 = +[AXSubsystemBrailleHardware identifier];
                                  v94 = AXLoggerForFacility();

                                  os_log_type_t v95 = AXOSLogLevelFromAXLogLevel();
                                  if (os_log_type_enabled(v94, v95))
                                  {
                                    v96 = AXColorizeFormatLog();
                                    bluetoothChannelIsLost = self->_modelIdentifier;
                                    BOOL hasBeenUnloaded = (BOOL)v90;
                                    _AXStringForArgs();
                                    mode = (__CFString *)objc_claimAutoreleasedReturnValue();
                                    if (os_log_type_enabled(v94, v95))
                                    {
                                      *(_DWORD *)v160 = 138543362;
                                      v161 = mode;
                                      _os_log_impl(&dword_0, v94, v95, "%{public}@", v160, 0xCu);
                                    }
                                  }
                                }
                                v97 = objc_msgSend(v90, "objectForKey:", kSCROBrailleDriverMainDisplaySize, bluetoothChannelIsLost, hasBeenUnloaded);
                                self->_int64_t mainSize = [v97 unsignedCharValue];

                                int64_t mainSize = self->_mainSize;
                                uint64_t v99 = mainSize + 7;
                                BOOL v79 = mainSize < -7;
                                uint64_t v100 = mainSize + 14;
                                if (!v79) {
                                  uint64_t v100 = v99;
                                }
                                uint64_t v101 = v100 >> 3;
                                self->_routerKeyGroupStateBufferSize = v101;
                                v102 = (char *)malloc_type_calloc(v101, 1uLL, 0x100004077774924uLL);
                                self->_routerKeyGroupStateBuffer = v102;
                                if (v102)
                                {
                                  self->_isDriverLoaded = 1;
                                  self->_isDeviceSleeping = v86 & 1;
                                  if (v86) {
                                    SCRDPostSleepNotification();
                                  }
                                  int v26 = 0;
                                  v30 = v151;
LABEL_125:

                                  v32 = v33;
LABEL_126:
                                  v12 = v148;
                                  id v4 = v149;
                                  v29 = v150;
LABEL_127:

LABEL_128:
LABEL_129:

LABEL_130:
LABEL_131:

                                  goto LABEL_132;
                                }
                              }
                              else
                              {
                                if ((v92 & 1) == 0)
                                {
                                  v138 = +[AXSubsystemBrailleHardware identifier];
                                  v139 = AXLoggerForFacility();

                                  os_log_type_t v140 = AXOSLogLevelFromAXLogLevel();
                                  if (os_log_type_enabled(v139, v140))
                                  {
                                    v141 = AXColorizeFormatLog();
                                    bluetoothChannelIsLost = self->_modelIdentifier;
                                    _AXStringForArgs();
                                    v142 = (__CFString *)objc_claimAutoreleasedReturnValue();
                                    if (os_log_type_enabled(v139, v140))
                                    {
                                      *(_DWORD *)v160 = 138543362;
                                      v161 = v142;
                                      _os_log_impl(&dword_0, v139, v140, "%{public}@", v160, 0xCu);
                                    }
                                  }
                                }
                                v90 = 0;
                              }
LABEL_119:
                              v30 = v151;
LABEL_120:
                              [(SCRDFileReader *)self->_readerThread invalidate];
                              v125 = self->_readerThread;
                              self->_readerThread = 0;

                              v126 = self->_safeReadBuffer;
                              if (v126)
                              {
                                CFRelease(v126);
                                self->_safeReadBuffer = 0;
                              }
                              [v33 removeObserver:self];
                              [(NSLock *)self->_readBufferLock lock];
                              readBuffer = self->_readBuffer;
                              if (readBuffer)
                              {
                                CFRelease(readBuffer);
                                self->_readBuffer = 0;
                              }
                              v128 = self->_readBufferLock;
                              self->_readBufferLock = 0;
                              v129 = v128;

                              [(NSLock *)v129 unlock];
                              device = self->_device;
                              self->_device = 0;

                              self->_comPort = -1;
                              v131 = self->_modelIdentifier;
                              self->_modelIdentifier = 0;

                              self->_isDeviceSleeping = 0;
                              int v26 = 2;
                              goto LABEL_125;
                            }
LABEL_117:
                            v123 = +[AXSubsystemBrailleHardware sharedInstance];
                            unsigned __int8 v124 = [v123 ignoreLogging];

                            if ((v124 & 1) == 0)
                            {
                              v133 = +[AXSubsystemBrailleHardware identifier];
                              v134 = AXLoggerForFacility();

                              os_log_type_t v135 = AXOSLogLevelFromAXLogLevel();
                              v30 = v151;
                              if (os_log_type_enabled(v134, v135))
                              {
                                v136 = AXColorizeFormatLog();
                                _AXStringForArgs();
                                v137 = (__CFString *)objc_claimAutoreleasedReturnValue();
                                if (os_log_type_enabled(v134, v135))
                                {
                                  *(_DWORD *)v160 = 138543362;
                                  v161 = v137;
                                  _os_log_impl(&dword_0, v134, v135, "%{public}@", v160, 0xCu);
                                }
                              }
                              v90 = 0;
                              v87 = 0;
                              goto LABEL_120;
                            }
LABEL_118:
                            v90 = 0;
                            v87 = 0;
                            goto LABEL_119;
                          }
                        }
                        else
                        {
                          BOOL v79 = v68++ > 5;
                          if (v79) {
                            goto LABEL_117;
                          }
                        }
                      }
                      v119 = +[AXSubsystemBrailleHardware sharedInstance];
                      unsigned __int8 v120 = [v119 ignoreLogging];

                      if (v120) {
                        goto LABEL_118;
                      }
                      v121 = +[AXSubsystemBrailleHardware identifier];
                      v113 = AXLoggerForFacility();

                      os_log_type_t v122 = AXOSLogLevelFromAXLogLevel();
                      if (os_log_type_enabled(v113, v122))
                      {
                        v115 = AXColorizeFormatLog();
                        _AXStringForArgs();
                        v116 = (__CFString *)objc_claimAutoreleasedReturnValue();
                        if (os_log_type_enabled(v113, v122))
                        {
                          *(_DWORD *)v160 = 138543362;
                          v161 = v116;
                          v117 = v113;
                          os_log_type_t v118 = v122;
LABEL_114:
                          _os_log_impl(&dword_0, v117, v118, "%{public}@", v160, 0xCu);
                        }
LABEL_115:
                      }
LABEL_116:

                      goto LABEL_118;
                    }
                    v103 = +[AXSubsystemBrailleHardware sharedInstance];
                    unsigned __int8 v104 = [v103 ignoreLogging];

                    v32 = v33;
                    if ((v104 & 1) == 0)
                    {
                      v105 = +[AXSubsystemBrailleHardware identifier];
                      v106 = AXLoggerForFacility();

                      os_log_type_t v107 = AXOSLogLevelFromAXLogLevel();
                      if (os_log_type_enabled(v106, v107))
                      {
                        v108 = AXColorizeFormatLog();
                        bluetoothChannelIsLost = (NSString *)self->_comPort;
                        _AXStringForArgs();
                        v109 = (__CFString *)objc_claimAutoreleasedReturnValue();
                        if (os_log_type_enabled(v106, v107))
                        {
                          *(_DWORD *)v160 = 138543362;
                          v161 = v109;
                          _os_log_impl(&dword_0, v106, v107, "%{public}@", v160, 0xCu);
                        }

                        v32 = v33;
                      }
                    }
                    self->_comPort = -1;
                    v43 = v32;
                  }
                  objc_msgSend(v43, "removeObserver:", self, bluetoothChannelIsLost);
                  int v26 = 1;
                  v30 = v151;
                  goto LABEL_126;
                }
                [v32 removeObserver:self];
                int v26 = 1;
                v12 = v148;
                id v4 = v149;
                v29 = v150;
LABEL_49:
                v30 = v151;
                goto LABEL_127;
              }
LABEL_37:
              v44 = +[AXSubsystemBrailleHardware sharedInstance];
              unsigned __int8 v45 = [v44 ignoreLogging];

              if (v45)
              {
                int v26 = 1;
                v12 = v148;
                id v4 = v149;
                v29 = v150;
                v30 = v151;
                goto LABEL_129;
              }
              v48 = +[AXSubsystemBrailleHardware identifier];
              v31 = AXLoggerForFacility();

              int v26 = 1;
              os_log_type_t v49 = AXOSLogLevelFromAXLogLevel();
              v29 = v150;
              if (!os_log_type_enabled(v31, v49))
              {
                v12 = v148;
                id v4 = v149;
                v30 = v151;
                goto LABEL_128;
              }
              v32 = AXColorizeFormatLog();
              v50 = _AXStringForArgs();
              if (os_log_type_enabled(v31, v49))
              {
                int buf = 138543362;
                v163 = v50;
                _os_log_impl(&dword_0, v31, v49, "%{public}@", (uint8_t *)&buf, 0xCu);
              }

              int v26 = 1;
              v12 = v148;
              id v4 = v149;
              goto LABEL_49;
            }
          }
          id v18 = [v16 countByEnumeratingWithState:&v155 objects:v164 count:16];
        }
        while (v18);
      }

      goto LABEL_37;
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
          int buf = 138543362;
          v163 = v14;
          _os_log_impl(&dword_0, v29, v52, "%{public}@", (uint8_t *)&buf, 0xCu);
        }
        goto LABEL_129;
      }
      goto LABEL_131;
    }
    int v26 = 1;
LABEL_132:
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
          v163 = v30;
          _os_log_impl(&dword_0, v12, v28, "%{public}@", (uint8_t *)&buf, 0xCu);
        }
        goto LABEL_130;
      }
      goto LABEL_132;
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

    self->_int64_t mainSize = 0;
    routerKeyGroupStateBuffer = self->_routerKeyGroupStateBuffer;
    if (routerKeyGroupStateBuffer)
    {
      free(routerKeyGroupStateBuffer);
      self->_routerKeyGroupStateBuffer = 0;
    }
    self->_isDeviceSleeping = 0;
    *(_DWORD *)&self->_routerKeyStateBuffer = 0;
    self->_frontPanelKeysDown = 0;
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
  return (self->_deviceID < 0x25uLL) & (0x1C0FC001FFuLL >> self->_deviceID);
}

- (int)brailleInputMode
{
  unint64_t deviceID = self->_deviceID;
  if (deviceID > 0x24) {
    return 0;
  }
  else {
    return dword_6D04[deviceID];
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
      v17.location = 0;
      v17.length = v5;
      CFDataDeleteBytes(self->_readBuffer, v17);
    }
  }
  [(NSLock *)self->_readBufferLock unlock];
  v8 = self->_safeReadBuffer;
  if (v8)
  {
    if (CFDataGetLength(v8) < 3)
    {
      os_log_type_t v9 = 0;
    }
    else
    {
      os_log_type_t v9 = +[NSMutableArray array];
    }
    uint64_t PacketFromBuffer = SCRDBaumCreatePacketFromBuffer();
    if (PacketFromBuffer)
    {
      CFDataRef v12 = (const __CFData *)PacketFromBuffer;
      while (1)
      {
        int v13 = *CFDataGetBytePtr(v12);
        if (v13 > 0x23)
        {
          if (v13 > 50)
          {
            if (v13 == 51)
            {
              SCRDBaumAppendEventsFromBrailleAndFrontPanelPacket();
            }
            else if (v13 == 52)
            {
              SCRDBaumAppendEventsFromDirectionalPadPacket();
            }
          }
          else if (v13 == 36)
          {
            SCRDBaumAppendEventsFromTopPanelPacket();
          }
          else if (v13 == 39)
          {
            SCRDBaumAppendEventsFromRoutingKeyPacket();
          }
          goto LABEL_32;
        }
        if (v13 == 1) {
          break;
        }
        if (v13 != 23)
        {
          if (v13 == 34) {
            SCRDBaumAppendEventsFromRoutingKeyGroupPacket();
          }
          goto LABEL_32;
        }
        if (!self->_isDeviceSleeping)
        {
          self->_isDeviceSleeping = 1;
LABEL_30:
          SCRDPostSleepNotification();
        }
LABEL_32:
        CFRelease(v12);
        CFDataRef v12 = (const __CFData *)SCRDBaumCreatePacketFromBuffer();
        if (!v12) {
          goto LABEL_33;
        }
      }
      if (!SCRDBaumGetSizeFromDisplaySizePacket() || self->_mainSize || !self->_isDeviceSleeping) {
        goto LABEL_32;
      }
      self->_isDeviceSleeping = 0;
      goto LABEL_30;
    }
LABEL_33:
    if ([v9 count]) {
      v14 = v9;
    }
    else {
      v14 = 0;
    }
    id v10 = v14;
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (BOOL)setMainCells:(const char *)a3 length:(int64_t)a4
{
  uint64_t DisplayRequest = SCRDBaumCreateDisplayRequest();
  if (DisplayRequest)
  {
    unsigned __int8 v6 = (void *)DisplayRequest;
    int comPort = self->_comPort;
    BOOL v8 = comPort != -1 && write(comPort, v6, 0) == 0;
    free(v6);
  }
  else
  {
    BOOL v8 = 0;
  }
  +[NSThread sleepForTimeInterval:0.005];
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
        CFIndex v5 = +[NSNotificationCenter defaultCenter];
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