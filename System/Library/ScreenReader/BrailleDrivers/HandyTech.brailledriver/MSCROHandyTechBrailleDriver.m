@interface MSCROHandyTechBrailleDriver
- (BOOL)isDriverLoaded;
- (BOOL)isInputEnabled;
- (BOOL)isSleeping;
- (BOOL)postsKeyboardEvents;
- (BOOL)setMainCells:(const char *)a3 length:(int64_t)a4;
- (BOOL)setStatusCells:(const char *)a3 length:(int64_t)a4;
- (BOOL)supportsBlinkingCursor;
- (BOOL)unloadDriver;
- (MSCROHandyTechBrailleDriver)init;
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

@implementation MSCROHandyTechBrailleDriver

- (MSCROHandyTechBrailleDriver)init
{
  v3.receiver = self;
  v3.super_class = (Class)MSCROHandyTechBrailleDriver;
  result = [(MSCROHandyTechBrailleDriver *)&v3 init];
  if (result)
  {
    result->_isDriverLoaded = 0;
    result->_nextResetRequestTime = -3061152000.0;
    result->_comPort = -1;
  }
  return result;
}

- (void)dealloc
{
  [(MSCROHandyTechBrailleDriver *)self unloadDriver];
  v3.receiver = self;
  v3.super_class = (Class)MSCROHandyTechBrailleDriver;
  [(MSCROHandyTechBrailleDriver *)&v3 dealloc];
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
      _AXStringForArgs();
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, v9))
      {
        int buf = 138543362;
        v130 = v11;
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
        [(MSCROHandyTechBrailleDriver *)self unloadDriver];
      }
      v120 = v12;
      v119 = [v12 infoDictionary];
      [v119 objectForKey:kSCROBrailleDriverModels];
      id v121 = v4;
      v122 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v14 = [v4 bluetoothAddress];
      long long v124 = 0u;
      long long v125 = 0u;
      long long v126 = 0u;
      long long v127 = 0u;
      v15 = +[BluetoothManager sharedInstance];
      v16 = [v15 pairedDevices];

      id v17 = [v16 countByEnumeratingWithState:&v124 objects:v128 count:16];
      if (v17)
      {
        id v18 = v17;
        uint64_t v19 = *(void *)v125;
        do
        {
          for (i = 0; i != v18; i = (char *)i + 1)
          {
            if (*(void *)v125 != v19) {
              objc_enumerationMutation(v16);
            }
            v21 = *(void **)(*((void *)&v124 + 1) + 8 * i);
            v22 = [v21 address];
            unsigned __int8 v23 = [v22 isEqualToString:v14];

            if (v23)
            {
              v31 = v21;

              if (v31)
              {
                v32 = +[NSNotificationCenter defaultCenter];
                [v32 addObserver:self selector:"removeDeviceNotification:" name:BluetoothDeviceDisconnectSuccessNotification object:0];
                v118 = v32;
                [v32 addObserver:self selector:"removeDeviceNotification:" name:BluetoothDeviceDisconnectFailedNotification object:0];
                if ([v31 connected])
                {
                  p_comPort = &self->_comPort;
                  int v34 = MSCROBTOpenComPort(v31, &self->_comPort);
                  if (!v34)
                  {
                    objc_storeStrong((id *)&self->_device, v21);
                    id v53 = [objc_allocWithZone((Class)NSFileHandle) initWithFileDescriptor:self->_comPort closeOnDealloc:1];
                    v54 = (SCRDFileReader *)[objc_allocWithZone((Class)SCRDFileReader) initWithDelegate:self fileHandle:v53];
                    readerThread = self->_readerThread;
                    self->_readerThread = v54;

                    Mutable = CFDataCreateMutable(kCFAllocatorDefault, 0);
                    self->_safeReadBuffer = Mutable;
                    if (!Mutable) {
                      goto LABEL_118;
                    }
                    v57 = (NSLock *)[objc_allocWithZone((Class)NSLock) init];
                    readBufferLock = self->_readBufferLock;
                    self->_readBufferLock = v57;

                    if (!self->_readBufferLock) {
                      goto LABEL_118;
                    }
                    v59 = CFDataCreateMutable(kCFAllocatorDefault, 0);
                    self->_readBuffer = v59;
                    if (!v59) {
                      goto LABEL_118;
                    }
                    [(SCRDFileReader *)self->_readerThread start];
                    unsigned int v60 = 0;
                    while (1)
                    {
                      char __buf = -1;
                      if (!write(*p_comPort, &__buf, 1uLL)) {
                        break;
                      }
                      self->_bluetoothChannelIsLost = 0;
                      self->_BOOL hasBeenUnloaded = 0;
                      CFRunLoopRunResult v61 = CFRunLoopRunInMode(kCFRunLoopDefaultMode, 0.1, 0);
                      CFRunLoopRunResult v62 = v61;
                      if (self->_bluetoothChannelIsLost || self->_hasBeenUnloaded || v61 == kCFRunLoopRunStopped)
                      {
                        v91 = +[AXSubsystemBrailleHardware sharedInstance];
                        unsigned __int8 v92 = [v91 ignoreLogging];

                        if (v92) {
                          goto LABEL_118;
                        }
                        v93 = +[AXSubsystemBrailleHardware identifier];
                        v94 = AXLoggerForFacility();

                        os_log_type_t v95 = AXOSLogLevelFromAXLogLevel();
                        if (os_log_type_enabled(v94, v95))
                        {
                          v96 = AXColorizeFormatLog();
                          BOOL hasBeenUnloaded = self->_hasBeenUnloaded;
                          uint64_t v116 = v62;
                          bluetoothChannelIsLost = (NSString *)self->_bluetoothChannelIsLost;
                          _AXStringForArgs();
                          v97 = (__CFString *)objc_claimAutoreleasedReturnValue();
                          if (os_log_type_enabled(v94, v95))
                          {
                            int buf = 138543362;
                            v130 = v97;
                            goto LABEL_115;
                          }
                          goto LABEL_116;
                        }
                        goto LABEL_117;
                      }
                      [(NSLock *)self->_readBufferLock lock];
                      CFIndex Length = CFDataGetLength(self->_readBuffer);
                      if (Length >= 1)
                      {
                        CFIndex v64 = Length;
                        safeReadBuffer = self->_safeReadBuffer;
                        BytePtr = CFDataGetBytePtr(self->_readBuffer);
                        CFDataAppendBytes(safeReadBuffer, BytePtr, v64);
                        v131.location = 0;
                        v131.length = v64;
                        CFDataDeleteBytes(self->_readBuffer, v131);
                      }
                      [(NSLock *)self->_readBufferLock unlock];
                      SCRDAdvanceBufferToPacketStart();
                      while (CFDataGetLength(self->_safeReadBuffer) > 1)
                      {
                        v67 = CFDataGetBytePtr(self->_safeReadBuffer);
                        if (*v67 == 254)
                        {
                          unsigned int v68 = v67[1];
                          if (v68 <= 0x80)
                          {
                            if (v67[1] <= 0x60u)
                            {
                              if (v68 == 5 || v68 == 68 || v68 == 84) {
                                goto LABEL_90;
                              }
                            }
                            else if (v67[1] > 0x71u)
                            {
                              if (v68 == 114 || v68 == 116) {
                                goto LABEL_90;
                              }
                            }
                            else if (v68 == 97 || v68 == 100)
                            {
                              goto LABEL_90;
                            }
                          }
                          else
                          {
                            if (v67[1] <= 0xA3u)
                            {
                              switch(v67[1])
                              {
                                case 0x81u:
                                case 0x82u:
                                case 0x83u:
                                case 0x84u:
                                case 0x86u:
                                case 0x87u:
                                case 0x8Au:
                                  goto LABEL_90;
                                default:
                                  continue;
                              }
                            }
                            if (v68 == 164 || v68 == 166 || v68 == 168)
                            {
LABEL_90:
                              int v69 = v67[1];
                              goto LABEL_92;
                            }
                          }
                        }
                        else
                        {
                          v132.location = 0;
                          v132.length = 1;
                          CFDataDeleteBytes(self->_safeReadBuffer, v132);
                        }
                      }
                      int v69 = 0;
LABEL_92:
                      if (v60 <= 3)
                      {
                        ++v60;
                        if (!v69) {
                          continue;
                        }
                      }
                      sub_58BC(v69);
                      v70 = (NSString *)objc_claimAutoreleasedReturnValue();
                      modelIdentifier = self->_modelIdentifier;
                      self->_modelIdentifier = v70;

                      v72 = [(__CFString *)v122 objectForKey:self->_modelIdentifier];
                      if (v72)
                      {
                        v73 = v72;
                        self->_identifierByte = v69;
                        v74 = [(NSLock *)v72 objectForKey:kSCROBrailleDriverMainDisplaySize];
                        self->_mainSize = [v74 unsignedCharValue];

                        if (SCRDHandyTechDisplayUsesExtendedProtocol())
                        {
                          uint64_t ExtendedProtocolRequestPacket = SCRDHandyTechCreateExtendedProtocolRequestPacket();
                          if (ExtendedProtocolRequestPacket)
                          {
                            CFDataRef v76 = (const __CFData *)ExtendedProtocolRequestPacket;
                            v77 = +[AXSubsystemBrailleHardware sharedInstance];
                            unsigned __int8 v78 = [v77 ignoreLogging];

                            if ((v78 & 1) == 0)
                            {
                              v79 = +[AXSubsystemBrailleHardware identifier];
                              v80 = AXLoggerForFacility();

                              os_log_type_t v81 = AXOSLogLevelFromAXLogLevel();
                              if (os_log_type_enabled(v80, v81))
                              {
                                v82 = AXColorizeFormatLog();
                                _AXStringForArgs();
                                mode = (__CFString *)objc_claimAutoreleasedReturnValue();
                                if (os_log_type_enabled(v80, v81))
                                {
                                  int buf = 138543362;
                                  v130 = mode;
                                  _os_log_impl(&dword_0, v80, v81, "%{public}@", (uint8_t *)&buf, 0xCu);
                                }
                              }
                            }
                            int v83 = *p_comPort;
                            v84 = CFDataGetBytePtr(v76);
                            size_t v85 = CFDataGetLength(v76);
                            write(v83, v84, v85);
                            CFRelease(v76);
                          }
                          LOBYTE(buf) = 0;
                          CFDataRef v86 = (const __CFData *)SCRDHandyTechCreateExtendedProtocolRequestPacket();
                          if (v86)
                          {
                            CFDataRef v87 = v86;
                            int v88 = *p_comPort;
                            v89 = CFDataGetBytePtr(v86);
                            size_t v90 = CFDataGetLength(v87);
                            write(v88, v89, v90);
                            CFRelease(v87);
                          }
                        }
                        int v26 = 0;
                        self->_isDriverLoaded = 1;
                        v30 = v122;
                        goto LABEL_123;
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
                          _AXStringForArgs();
                          v113 = (__CFString *)objc_claimAutoreleasedReturnValue();
                          if (os_log_type_enabled(v110, v111))
                          {
                            int buf = 138543362;
                            v130 = v113;
                            _os_log_impl(&dword_0, v110, v111, "%{public}@", (uint8_t *)&buf, 0xCu);
                          }
                        }
                      }
LABEL_118:
                      [(SCRDFileReader *)self->_readerThread invalidate];
                      v101 = self->_readerThread;
                      self->_readerThread = 0;

                      v102 = self->_safeReadBuffer;
                      if (v102)
                      {
                        CFRelease(v102);
                        self->_safeReadBuffer = 0;
                      }
                      [v118 removeObserver:self];
                      [(NSLock *)self->_readBufferLock lock];
                      readBuffer = self->_readBuffer;
                      v30 = v122;
                      if (readBuffer)
                      {
                        CFRelease(readBuffer);
                        self->_readBuffer = 0;
                      }
                      v104 = self->_readBufferLock;
                      self->_readBufferLock = 0;
                      v73 = v104;

                      [(NSLock *)v73 unlock];
                      device = self->_device;
                      self->_device = 0;

                      close(self->_comPort);
                      self->_comPort = -1;
                      self->_spaceKeyState = 0;
                      v106 = self->_modelIdentifier;
                      self->_modelIdentifier = 0;

                      int v26 = 2;
LABEL_123:

                      v12 = v120;
                      id v4 = v121;
                      v35 = v118;
                      v29 = v119;
LABEL_50:

LABEL_52:
LABEL_53:

LABEL_54:
LABEL_55:

                      goto LABEL_56;
                    }
                    v98 = +[AXSubsystemBrailleHardware sharedInstance];
                    unsigned __int8 v99 = [v98 ignoreLogging];

                    if (v99) {
                      goto LABEL_118;
                    }
                    v100 = +[AXSubsystemBrailleHardware identifier];
                    v94 = AXLoggerForFacility();

                    os_log_type_t v95 = AXOSLogLevelFromAXLogLevel();
                    if (os_log_type_enabled(v94, v95))
                    {
                      v96 = AXColorizeFormatLog();
                      _AXStringForArgs();
                      v97 = (__CFString *)objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v94, v95))
                      {
                        int buf = 138543362;
                        v130 = v97;
LABEL_115:
                        _os_log_impl(&dword_0, v94, v95, "%{public}@", (uint8_t *)&buf, 0xCu);
                      }
LABEL_116:
                    }
LABEL_117:

                    goto LABEL_118;
                  }
                  int v26 = v34;
                  v35 = v32;
                  [v32 removeObserver:self];
                }
                else
                {
                  v45 = +[AXSubsystemBrailleHardware sharedInstance];
                  unsigned __int8 v46 = [v45 ignoreLogging];

                  if ((v46 & 1) == 0)
                  {
                    v47 = +[AXSubsystemBrailleHardware identifier];
                    v48 = AXLoggerForFacility();

                    os_log_type_t v49 = AXOSLogLevelFromAXLogLevel();
                    if (os_log_type_enabled(v48, v49))
                    {
                      v50 = AXColorizeFormatLog();
                      _AXStringForArgs();
                      v51 = (__CFString *)objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v48, v49))
                      {
                        int buf = 138543362;
                        v130 = v51;
                        _os_log_impl(&dword_0, v48, v49, "%{public}@", (uint8_t *)&buf, 0xCu);
                      }
                    }
                  }
                  v35 = v32;
                  [v32 removeObserver:self];
                  int v26 = 1;
                }
                v12 = v120;
                id v4 = v121;
                v29 = v119;
LABEL_49:
                v30 = v122;
                goto LABEL_50;
              }
LABEL_30:
              v36 = +[AXSubsystemBrailleHardware sharedInstance];
              unsigned __int8 v37 = [v36 ignoreLogging];

              if (v37)
              {
                int v26 = 1;
                v12 = v120;
                id v4 = v121;
                v29 = v119;
                v30 = v122;
                goto LABEL_53;
              }
              v40 = +[AXSubsystemBrailleHardware identifier];
              v31 = AXLoggerForFacility();

              int v26 = 1;
              os_log_type_t v41 = AXOSLogLevelFromAXLogLevel();
              v29 = v119;
              if (!os_log_type_enabled(v31, v41))
              {
                v12 = v120;
                id v4 = v121;
                v30 = v122;
                goto LABEL_52;
              }
              v35 = AXColorizeFormatLog();
              _AXStringForArgs();
              v42 = (__CFString *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v31, v41))
              {
                int buf = 138543362;
                v130 = v42;
                _os_log_impl(&dword_0, v31, v41, "%{public}@", (uint8_t *)&buf, 0xCu);
              }

              v12 = v120;
              id v4 = v121;
              goto LABEL_49;
            }
          }
          id v18 = [v16 countByEnumeratingWithState:&v124 objects:v128 count:16];
        }
        while (v18);
      }

      goto LABEL_30;
    }
    v38 = +[AXSubsystemBrailleHardware sharedInstance];
    unsigned __int8 v39 = [v38 ignoreLogging];

    if ((v39 & 1) == 0)
    {
      v43 = +[AXSubsystemBrailleHardware identifier];
      v29 = AXLoggerForFacility();

      int v26 = 1;
      os_log_type_t v44 = AXOSLogLevelFromAXLogLevel();
      if (os_log_type_enabled(v29, v44))
      {
        AXColorizeFormatLog();
        v30 = (__CFString *)objc_claimAutoreleasedReturnValue();
        _AXStringForArgs();
        v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, v44))
        {
          int buf = 138543362;
          v130 = v14;
          _os_log_impl(&dword_0, v29, v44, "%{public}@", (uint8_t *)&buf, 0xCu);
        }
        goto LABEL_53;
      }
      goto LABEL_55;
    }
    int v26 = 1;
LABEL_56:
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
        _AXStringForArgs();
        v30 = (__CFString *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, v28))
        {
          int buf = 138543362;
          v130 = v30;
          _os_log_impl(&dword_0, v12, v28, "%{public}@", (uint8_t *)&buf, 0xCu);
        }
        goto LABEL_54;
      }
      goto LABEL_56;
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
    modelIdentifier = self->_modelIdentifier;
    self->_modelIdentifier = 0;

    self->_identifierByte = 0;
    self->_mainSize = 0;
    *(_DWORD *)&self->_maxPacketSize = 0;
    self->_nextResetRequestTime = -3061152000.0;
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
  return (self->_identifierByte + 117) < 0xF6u;
}

- (int)brailleInputMode
{
  return 2 * ((self->_identifierByte + 127) > 9u);
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
      v25.location = 0;
      v25.length = v5;
      CFDataDeleteBytes(self->_readBuffer, v25);
    }
  }
  [(NSLock *)self->_readBufferLock unlock];
  BOOL isDeviceResetting = self->_isDeviceResetting;
  os_log_type_t v9 = SCRDHandyTechExtractEventsFromBuffer();
  if (self->_isDeviceResetting)
  {
    double nextResetRequestTime = self->_nextResetRequestTime;
    if (nextResetRequestTime <= CFAbsoluteTimeGetCurrent())
    {
      char __buf = -1;
      int comPort = self->_comPort;
      if (comPort != -1) {
        write(comPort, &__buf, 1uLL);
      }
      self->_double nextResetRequestTime = CFAbsoluteTimeGetCurrent() + 0.2;
    }
  }
  if (isDeviceResetting != self->_isDeviceResetting)
  {
    if (SCRDHandyTechDisplayUsesExtendedProtocol() && self->_comPort != -1)
    {
      CFDataRef ExtendedProtocolRequestPacket = (const __CFData *)SCRDHandyTechCreateExtendedProtocolRequestPacket();
      if (ExtendedProtocolRequestPacket)
      {
        CFDataRef v13 = ExtendedProtocolRequestPacket;
        int v14 = self->_comPort;
        v15 = CFDataGetBytePtr(ExtendedProtocolRequestPacket);
        size_t v16 = CFDataGetLength(v13);
        write(v14, v15, v16);
        CFRelease(v13);
      }
      CFDataRef v17 = (const __CFData *)SCRDHandyTechCreateExtendedProtocolRequestPacket();
      if (v17)
      {
        CFDataRef v18 = v17;
        int v19 = self->_comPort;
        v20 = CFDataGetBytePtr(v17);
        size_t v21 = CFDataGetLength(v18);
        write(v19, v20, v21);
        CFRelease(v18);
      }
    }
    SCRDPostSleepNotification();
  }

  return v9;
}

- (BOOL)setMainCells:(const char *)a3 length:(int64_t)a4
{
  if (self->_isDeviceResetting) {
    return 0;
  }
  if (SCRDHandyTechDisplayUsesExtendedProtocol())
  {
    CFDataRef ExtendedProtocolRequestPacket = (const __CFData *)SCRDHandyTechCreateExtendedProtocolRequestPacket();
    if (ExtendedProtocolRequestPacket)
    {
      CFDataRef v9 = ExtendedProtocolRequestPacket;
      CFIndex Length = CFDataGetLength(ExtendedProtocolRequestPacket);
      int comPort = self->_comPort;
      if (comPort == -1)
      {
        BOOL v14 = 0;
      }
      else
      {
        size_t v12 = Length;
        BytePtr = CFDataGetBytePtr(v9);
        BOOL v14 = write(comPort, BytePtr, v12) == v12;
      }
      CFRelease(v9);
    }
    else
    {
      return 0;
    }
    return v14;
  }
  else
  {
    int64_t mainSize = self->_mainSize;
    size_t v16 = (char *)&v19 - ((mainSize + 16) & 0xFFFFFFFFFFFFFFF0);
    size_t v17 = mainSize;
    if (mainSize >= a4)
    {
      if (mainSize > a4) {
        bzero(&v16[a4 + 1], mainSize - a4);
      }
      size_t v17 = a4;
    }
    char *v16 = 1;
    memcpy(v16 + 1, a3, v17);
    int v18 = self->_comPort;
    return v18 != -1
        && write(v18, (char *)&v19 - ((mainSize + 16) & 0xFFFFFFFFFFFFFFF0), mainSize + 1) == mainSize + 1;
  }
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