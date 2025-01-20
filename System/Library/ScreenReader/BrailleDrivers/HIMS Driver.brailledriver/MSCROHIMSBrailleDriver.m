@interface MSCROHIMSBrailleDriver
- (BOOL)isDriverLoaded;
- (BOOL)isInputEnabled;
- (BOOL)isSleeping;
- (BOOL)postsKeyboardEvents;
- (BOOL)setMainCells:(const char *)a3 length:(int64_t)a4;
- (BOOL)setStatusCells:(const char *)a3 length:(int64_t)a4;
- (BOOL)supportsBlinkingCursor;
- (BOOL)unloadDriver;
- (MSCROHIMSBrailleDriver)init;
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

@implementation MSCROHIMSBrailleDriver

- (MSCROHIMSBrailleDriver)init
{
  v3.receiver = self;
  v3.super_class = (Class)MSCROHIMSBrailleDriver;
  result = [(MSCROHIMSBrailleDriver *)&v3 init];
  if (result)
  {
    result->_isDriverLoaded = 0;
    result->_comPort = -1;
  }
  return result;
}

- (void)dealloc
{
  [(MSCROHIMSBrailleDriver *)self unloadDriver];
  v3.receiver = self;
  v3.super_class = (Class)MSCROHIMSBrailleDriver;
  [(MSCROHIMSBrailleDriver *)&v3 dealloc];
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
        v148 = v11;
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
        [(MSCROHIMSBrailleDriver *)self unloadDriver];
      }
      v139 = v12;
      v138 = [v12 infoDictionary];
      [v138 objectForKey:kSCROBrailleDriverModels];
      v141 = id v140 = v4;
      v14 = [v4 bluetoothAddress];
      *(_OWORD *)&__nbyte[1] = 0u;
      long long v143 = 0u;
      long long v144 = 0u;
      long long v145 = 0u;
      v15 = +[BluetoothManager sharedInstance];
      v16 = [v15 pairedDevices];

      id v17 = [v16 countByEnumeratingWithState:&__nbyte[1] objects:v149 count:16];
      if (v17)
      {
        id v18 = v17;
        uint64_t v19 = *(void *)v143;
        while (2)
        {
          for (i = 0; i != v18; i = (char *)i + 1)
          {
            if (*(void *)v143 != v19) {
              objc_enumerationMutation(v16);
            }
            unint64_t v21 = *(void *)(*(void *)&__nbyte[3] + 8 * i);
            v22 = [(id)v21 address];
            unsigned __int8 v23 = [v22 isEqualToString:v14];

            if (v23)
            {
              v31 = (id)v21;

              if (v31)
              {
                v32 = +[NSNotificationCenter defaultCenter];
                [v32 addObserver:self selector:"removeDeviceNotification:" name:BluetoothDeviceDisconnectSuccessNotification object:0];
                [v32 addObserver:self selector:"removeDeviceNotification:" name:BluetoothDeviceDisconnectFailedNotification object:0];
                v137 = v31;
                if (([v31 connected] & 1) == 0)
                {
                  v54 = +[AXSubsystemBrailleHardware sharedInstance];
                  unsigned __int8 v55 = [v54 ignoreLogging];

                  if ((v55 & 1) == 0)
                  {
                    v56 = v32;
                    v57 = +[AXSubsystemBrailleHardware identifier];
                    v58 = AXLoggerForFacility();

                    os_log_type_t v59 = AXOSLogLevelFromAXLogLevel();
                    if (os_log_type_enabled(v58, v59))
                    {
                      v60 = AXColorizeFormatLog();
                      v61 = _AXStringForArgs();
                      if (os_log_type_enabled(v58, v59))
                      {
                        *(_DWORD *)buf = 138543362;
                        v148 = v61;
                        _os_log_impl(&dword_0, v58, v59, "%{public}@", buf, 0xCu);
                      }
                    }
                    v32 = v56;
                  }
                  [v32 removeObserver:self];
                  int v26 = 1;
                  v12 = v139;
                  id v4 = v140;
                  v29 = v138;
                  v30 = v141;
                  goto LABEL_105;
                }
                [v31 device];
                int ComPortForServiceWithSandboxExtension = BTDeviceGetComPortForServiceWithSandboxExtension();
                if (ComPortForServiceWithSandboxExtension)
                {
                  int v34 = ComPortForServiceWithSandboxExtension;
                  v35 = +[AXSubsystemBrailleHardware sharedInstance];
                  unsigned __int8 v36 = [v35 ignoreLogging];

                  if ((v36 & 1) == 0)
                  {
                    v37 = v32;
                    v38 = +[AXSubsystemBrailleHardware identifier];
                    v39 = AXLoggerForFacility();

                    os_log_type_t v40 = AXOSLogLevelFromAXLogLevel();
                    if (os_log_type_enabled(v39, v40))
                    {
                      v41 = AXColorizeFormatLog();
                      bluetoothChannelIsLost = (NSString *)v34;
                      v42 = _AXStringForArgs();
                      if (os_log_type_enabled(v39, v40))
                      {
                        *(_DWORD *)v146 = 138543362;
                        *(void *)&v146[4] = v42;
                        _os_log_impl(&dword_0, v39, v40, "%{public}@", v146, 0xCu);
                      }
                    }
                    v32 = v37;
                  }
                }
                else
                {
                  if (sandbox_extension_consume() == -1)
                  {
                    v62 = +[AXSubsystemBrailleHardware sharedInstance];
                    unsigned __int8 v63 = [v62 ignoreLogging];

                    if ((v63 & 1) == 0)
                    {
                      v64 = +[AXSubsystemBrailleHardware identifier];
                      v65 = AXLoggerForFacility();

                      os_log_type_t v66 = AXOSLogLevelFromAXLogLevel();
                      if (os_log_type_enabled(v65, v66))
                      {
                        v67 = v32;
                        v68 = AXColorizeFormatLog();
                        bluetoothChannelIsLost = (NSString *)*__error();
                        v69 = _AXStringForArgs();
                        if (os_log_type_enabled(v65, v66))
                        {
                          *(_DWORD *)v146 = 138543362;
                          *(void *)&v146[4] = v69;
                          _os_log_impl(&dword_0, v65, v66, "%{public}@", v146, 0xCu);
                        }

                        v32 = v67;
                      }
                    }
                  }
                  int v70 = open((const char *)buf, 131074, bluetoothChannelIsLost);
                  self->_comPort = v70;
                  if ((v70 & 0x80000000) == 0)
                  {
                    v71 = v32;
                    objc_storeStrong((id *)&self->_device, (id)v21);
                    id v72 = [objc_allocWithZone((Class)NSFileHandle) initWithFileDescriptor:self->_comPort closeOnDealloc:1];
                    v73 = (SCRDFileReader *)[objc_allocWithZone((Class)SCRDFileReader) initWithDelegate:self fileHandle:v72];
                    readerThread = self->_readerThread;
                    self->_readerThread = v73;

                    Mutable = CFDataCreateMutable(kCFAllocatorDefault, 0);
                    self->_safeReadBuffer = Mutable;
                    if (Mutable
                      && (v76 = (NSLock *)[objc_allocWithZone((Class)NSLock) init],
                          v77 = self->_readBufferLock,
                          self->_readBufferLock = v76,
                          v77,
                          self->_readBufferLock)
                      && (v78 = CFDataCreateMutable(kCFAllocatorDefault, 0), (self->_readBuffer = v78) != 0))
                    {
                      [(SCRDFileReader *)self->_readerThread start];
                      uint64_t v79 = SCRDHIMSCreateRequest();
                      v80 = (void *)v79;
                      if (v79)
                      {
                        unsigned int v81 = 0;
                        v136 = (void *)v79;
                        id v135 = v72;
                        while (write(self->_comPort, v80, 0) >= 0)
                        {
                          self->_bluetoothChannelIsLost = 0;
                          self->_BOOL hasBeenUnloaded = 0;
                          CFRunLoopRunResult v82 = CFRunLoopRunInMode(kCFRunLoopDefaultMode, 1.0, 0);
                          CFRunLoopRunResult v83 = v82;
                          if (self->_bluetoothChannelIsLost || self->_hasBeenUnloaded || v82 == kCFRunLoopRunStopped)
                          {
                            v109 = +[AXSubsystemBrailleHardware sharedInstance];
                            unsigned __int8 v110 = [v109 ignoreLogging];

                            if ((v110 & 1) == 0)
                            {
                              v111 = +[AXSubsystemBrailleHardware identifier];
                              v112 = AXLoggerForFacility();

                              os_log_type_t v113 = AXOSLogLevelFromAXLogLevel();
                              v32 = v71;
                              if (os_log_type_enabled(v112, v113))
                              {
                                v114 = AXColorizeFormatLog();
                                BOOL hasBeenUnloaded = self->_hasBeenUnloaded;
                                uint64_t v134 = v83;
                                bluetoothChannelIsLost = (NSString *)self->_bluetoothChannelIsLost;
                                v115 = _AXStringForArgs();
                                if (os_log_type_enabled(v112, v113))
                                {
                                  *(_DWORD *)v146 = 138543362;
                                  *(void *)&v146[4] = v115;
                                  _os_log_impl(&dword_0, v112, v113, "%{public}@", v146, 0xCu);
                                }
                                v30 = v141;
                                id v72 = v135;
                                v80 = v136;
                                goto LABEL_141;
                              }
                              v30 = v141;
LABEL_132:
                              id v72 = v135;
                              v80 = v136;
                              goto LABEL_142;
                            }
                            goto LABEL_118;
                          }
                          [(NSLock *)self->_readBufferLock lock];
                          CFIndex Length = CFDataGetLength(self->_readBuffer);
                          if (Length >= 1)
                          {
                            CFIndex v85 = Length;
                            safeReadBuffer = self->_safeReadBuffer;
                            BytePtr = CFDataGetBytePtr(self->_readBuffer);
                            v88 = safeReadBuffer;
                            v80 = v136;
                            CFDataAppendBytes(v88, BytePtr, v85);
                            v150.location = 0;
                            v150.length = v85;
                            CFDataDeleteBytes(self->_readBuffer, v150);
                          }
                          [(NSLock *)self->_readBufferLock unlock];
                          SCRDAdvanceBufferToPacketStart();
                          if (CFDataGetLength(self->_safeReadBuffer) < 10)
                          {
LABEL_79:
                            int v90 = 0;
                          }
                          else
                          {
                            while (1)
                            {
                              *(_WORD *)&v146[8] = 0;
                              *(void *)v146 = 0;
                              CFDataGetBytePtr(self->_safeReadBuffer);
                              SCRDHIMSFillPacket();
                              unint64_t v21 = v21 & 0xFFFFFFFFFFFF0000 | *(unsigned __int16 *)&v146[8];
                              if (SCRDHIMSIsPacketValid() && v146[1] == 2) {
                                break;
                              }
                              v151.location = 0;
                              v151.length = 1;
                              CFDataDeleteBytes(self->_safeReadBuffer, v151);
                              SCRDAdvanceBufferToPacketStart();
                              if (CFDataGetLength(self->_safeReadBuffer) <= 9) {
                                goto LABEL_79;
                              }
                            }
                            int v90 = v146[3];
                            v152.location = 0;
                            v152.length = 1;
                            CFDataDeleteBytes(self->_safeReadBuffer, v152);
                          }
                          if (v81 <= 3)
                          {
                            ++v81;
                            if (!v90) {
                              continue;
                            }
                          }
                          free(v80);
                          if (v90 != 20)
                          {
                            if (v90 == 40)
                            {
                              modelIdentifier = self->_modelIdentifier;
                              v92 = @"com.apple.scrod.braille.driver.hims.braille.edge.40";
                              goto LABEL_125;
                            }
                            v123 = +[AXSubsystemBrailleHardware sharedInstance];
                            unsigned __int8 v124 = [v123 ignoreLogging];

                            if ((v124 & 1) == 0)
                            {
                              v125 = +[AXSubsystemBrailleHardware identifier];
                              v112 = AXLoggerForFacility();

                              os_log_type_t v126 = AXOSLogLevelFromAXLogLevel();
                              if (os_log_type_enabled(v112, v126))
                              {
                                uint64_t v127 = AXColorizeFormatLog();
                                bluetoothChannelIsLost = self->_modelIdentifier;
                                uint64_t v120 = v127;
                                v115 = _AXStringForArgs();
                                if (os_log_type_enabled(v112, v126))
                                {
                                  *(_DWORD *)v146 = 138543362;
                                  *(void *)&v146[4] = v115;
                                  goto LABEL_138;
                                }
                                goto LABEL_139;
                              }
LABEL_143:
                              v80 = 0;
                              v30 = v141;
                              v32 = v71;
                              id v72 = v135;
LABEL_142:

LABEL_88:
                              [(SCRDFileReader *)self->_readerThread invalidate];
                              v93 = self->_readerThread;
                              self->_readerThread = 0;

                              v94 = self->_safeReadBuffer;
                              if (v94)
                              {
                                CFRelease(v94);
                                self->_safeReadBuffer = 0;
                              }
                              [v32 removeObserver:self];
                              [(NSLock *)self->_readBufferLock lock];
                              readBuffer = self->_readBuffer;
                              if (readBuffer)
                              {
                                CFRelease(readBuffer);
                                self->_readBuffer = 0;
                              }
                              v96 = self->_readBufferLock;
                              readBufferLock = self->_readBufferLock;
                              self->_readBufferLock = 0;

                              [(NSLock *)v96 unlock];
                              device = self->_device;
                              self->_device = 0;

                              if (v80) {
                                free(v80);
                              }
                              self->_comPort = -1;
                              v99 = self->_modelIdentifier;
                              self->_modelIdentifier = 0;

                              self->_mainSize = 0;
                              int v26 = 2;
LABEL_95:

LABEL_104:
                              v12 = v139;
                              id v4 = v140;
                              v29 = v138;
LABEL_105:

LABEL_106:
                              goto LABEL_107;
                            }
LABEL_134:
                            v80 = 0;
                            v30 = v141;
                            v32 = v71;
                            id v72 = v135;
                            goto LABEL_88;
                          }
                          modelIdentifier = self->_modelIdentifier;
                          v92 = @"com.apple.scrod.braille.driver.hims.braille.edge.20";
LABEL_125:
                          self->_modelIdentifier = &v92->isa;

                          v121 = [v141 objectForKey:self->_modelIdentifier];
                          if (v121)
                          {
                            v96 = v121;
                            v122 = [(NSLock *)v121 objectForKey:kSCROBrailleDriverMainDisplaySize];
                            self->_mainSize = [v122 unsignedCharValue];

                            int v26 = 0;
                            self->_isDriverLoaded = 1;
                            v30 = v141;
                            v32 = v71;
                            id v72 = v135;
                            goto LABEL_95;
                          }
                          v128 = +[AXSubsystemBrailleHardware sharedInstance];
                          unsigned __int8 v129 = [v128 ignoreLogging];

                          if (v129) {
                            goto LABEL_134;
                          }
                          v130 = +[AXSubsystemBrailleHardware identifier];
                          v112 = AXLoggerForFacility();

                          os_log_type_t v126 = AXOSLogLevelFromAXLogLevel();
                          if (!os_log_type_enabled(v112, v126)) {
                            goto LABEL_143;
                          }
                          uint64_t v131 = AXColorizeFormatLog();
                          bluetoothChannelIsLost = self->_modelIdentifier;
                          uint64_t v120 = v131;
                          v115 = _AXStringForArgs();
                          if (os_log_type_enabled(v112, v126))
                          {
                            *(_DWORD *)v146 = 138543362;
                            *(void *)&v146[4] = v115;
LABEL_138:
                            _os_log_impl(&dword_0, v112, v126, "%{public}@", v146, 0xCu);
                          }
LABEL_139:
                          v80 = 0;
                          v30 = v141;
                          v32 = v71;
                          id v72 = v135;
LABEL_140:
                          v114 = (void *)v120;
LABEL_141:

                          goto LABEL_142;
                        }
                        v116 = +[AXSubsystemBrailleHardware sharedInstance];
                        unsigned __int8 v117 = [v116 ignoreLogging];

                        if ((v117 & 1) == 0)
                        {
                          v118 = +[AXSubsystemBrailleHardware identifier];
                          v112 = AXLoggerForFacility();

                          os_log_type_t v119 = AXOSLogLevelFromAXLogLevel();
                          if (os_log_type_enabled(v112, v119))
                          {
                            uint64_t v120 = AXColorizeFormatLog();
                            v115 = _AXStringForArgs();
                            if (os_log_type_enabled(v112, v119))
                            {
                              *(_DWORD *)v146 = 138543362;
                              *(void *)&v146[4] = v115;
                              _os_log_impl(&dword_0, v112, v119, "%{public}@", v146, 0xCu);
                            }
                            v30 = v141;
                            v32 = v71;
                            id v72 = v135;
                            v80 = v136;
                            goto LABEL_140;
                          }
                          v30 = v141;
                          v32 = v71;
                          goto LABEL_132;
                        }
LABEL_118:
                        v30 = v141;
                        v32 = v71;
                        id v72 = v135;
                        v80 = v136;
                        goto LABEL_88;
                      }
                    }
                    else
                    {
                      v80 = 0;
                    }
                    v30 = v141;
                    goto LABEL_88;
                  }
                  v100 = +[AXSubsystemBrailleHardware sharedInstance];
                  unsigned __int8 v101 = [v100 ignoreLogging];

                  if ((v101 & 1) == 0)
                  {
                    v102 = v32;
                    v103 = +[AXSubsystemBrailleHardware identifier];
                    v104 = AXLoggerForFacility();

                    os_log_type_t v105 = AXOSLogLevelFromAXLogLevel();
                    if (os_log_type_enabled(v104, v105))
                    {
                      v106 = AXColorizeFormatLog();
                      bluetoothChannelIsLost = (NSString *)self->_comPort;
                      v107 = _AXStringForArgs();
                      if (os_log_type_enabled(v104, v105))
                      {
                        *(_DWORD *)v146 = 138543362;
                        *(void *)&v146[4] = v107;
                        _os_log_impl(&dword_0, v104, v105, "%{public}@", v146, 0xCu);
                      }
                    }
                    v32 = v102;
                  }
                  self->_comPort = -1;
                }
                objc_msgSend(v32, "removeObserver:", self, bluetoothChannelIsLost);
                int v26 = 1;
                v30 = v141;
                goto LABEL_104;
              }
              goto LABEL_35;
            }
          }
          id v18 = [v16 countByEnumeratingWithState:&__nbyte[1] objects:v149 count:16];
          if (v18) {
            continue;
          }
          break;
        }
      }

LABEL_35:
      v43 = +[AXSubsystemBrailleHardware sharedInstance];
      unsigned __int8 v44 = [v43 ignoreLogging];

      if ((v44 & 1) == 0)
      {
        v47 = +[AXSubsystemBrailleHardware identifier];
        v48 = AXLoggerForFacility();

        int v26 = 1;
        os_log_type_t v49 = AXOSLogLevelFromAXLogLevel();
        v29 = v138;
        v137 = v48;
        if (os_log_type_enabled(v48, v49))
        {
          uint64_t v50 = AXColorizeFormatLog();
          v51 = _AXStringForArgs();
          if (os_log_type_enabled(v48, v49))
          {
            *(_DWORD *)buf = 138543362;
            v148 = v51;
            _os_log_impl(&dword_0, v48, v49, "%{public}@", buf, 0xCu);
          }

          v12 = v139;
          id v4 = v140;
          v30 = v141;
          v32 = (void *)v50;
          goto LABEL_105;
        }
        v12 = v139;
        id v4 = v140;
        v30 = v141;
        goto LABEL_106;
      }
      int v26 = 1;
      v12 = v139;
      id v4 = v140;
      v29 = v138;
      v30 = v141;
LABEL_107:

      goto LABEL_108;
    }
    v45 = +[AXSubsystemBrailleHardware sharedInstance];
    unsigned __int8 v46 = [v45 ignoreLogging];

    if ((v46 & 1) == 0)
    {
      v52 = +[AXSubsystemBrailleHardware identifier];
      v29 = AXLoggerForFacility();

      int v26 = 1;
      os_log_type_t v53 = AXOSLogLevelFromAXLogLevel();
      if (os_log_type_enabled(v29, v53))
      {
        v30 = AXColorizeFormatLog();
        v14 = _AXStringForArgs();
        if (os_log_type_enabled(v29, v53))
        {
          *(_DWORD *)buf = 138543362;
          v148 = v14;
          _os_log_impl(&dword_0, v29, v53, "%{public}@", buf, 0xCu);
        }
        goto LABEL_107;
      }
      goto LABEL_109;
    }
    int v26 = 1;
    goto LABEL_110;
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
        v148 = v30;
        _os_log_impl(&dword_0, v12, v28, "%{public}@", buf, 0xCu);
      }
LABEL_108:

LABEL_109:
    }
LABEL_110:

    goto LABEL_111;
  }
  int v26 = 1;
LABEL_111:

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
  uint64_t v9 = [(MSCROHIMSBrailleDriver *)self _himsDeviceId];

  return (id)_SCRDHIMSBrailleEDGEExtractEventsFromBuffer(v8, v9);
}

- (int)_himsDeviceId
{
  return 0;
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