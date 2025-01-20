@interface MSCROBrailleNoteApexBrailleDriver
- (BOOL)isDriverLoaded;
- (BOOL)isInputEnabled;
- (BOOL)isSleeping;
- (BOOL)postsKeyboardEvents;
- (BOOL)setMainCells:(const char *)a3 length:(int64_t)a4;
- (BOOL)setStatusCells:(const char *)a3 length:(int64_t)a4;
- (BOOL)supportsBlinkingCursor;
- (BOOL)unloadDriver;
- (MSCROBrailleNoteApexBrailleDriver)init;
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

@implementation MSCROBrailleNoteApexBrailleDriver

- (MSCROBrailleNoteApexBrailleDriver)init
{
  v3.receiver = self;
  v3.super_class = (Class)MSCROBrailleNoteApexBrailleDriver;
  result = [(MSCROBrailleNoteApexBrailleDriver *)&v3 init];
  if (result)
  {
    result->_isDriverLoaded = 0;
    result->_comPort = -1;
  }
  return result;
}

- (void)dealloc
{
  [(MSCROBrailleNoteApexBrailleDriver *)self unloadDriver];
  v3.receiver = self;
  v3.super_class = (Class)MSCROBrailleNoteApexBrailleDriver;
  [(MSCROBrailleNoteApexBrailleDriver *)&v3 dealloc];
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
        v140 = v11;
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
        [(MSCROBrailleNoteApexBrailleDriver *)self unloadDriver];
      }
      v129 = v12;
      v128 = [v12 infoDictionary];
      [v128 objectForKey:kSCROBrailleDriverModels];
      v131 = id v130 = v4;
      v14 = [v4 bluetoothAddress];
      long long v133 = 0u;
      long long v134 = 0u;
      long long v135 = 0u;
      long long v136 = 0u;
      v15 = +[BluetoothManager sharedInstance];
      v16 = [v15 pairedDevices];

      id v17 = [v16 countByEnumeratingWithState:&v133 objects:v141 count:16];
      if (v17)
      {
        id v18 = v17;
        uint64_t v19 = *(void *)v134;
        do
        {
          for (i = 0; i != v18; i = (char *)i + 1)
          {
            if (*(void *)v134 != v19) {
              objc_enumerationMutation(v16);
            }
            v21 = *(void **)(*((void *)&v133 + 1) + 8 * i);
            v22 = [v21 address];
            unsigned __int8 v23 = [v22 isEqualToString:v14];

            if (v23)
            {
              v31 = v21;

              if (v31)
              {
                v32 = +[NSNotificationCenter defaultCenter];
                [v32 addObserver:self selector:"removeDeviceNotification:" name:BluetoothDeviceDisconnectSuccessNotification object:0];
                v127 = v32;
                [v32 addObserver:self selector:"removeDeviceNotification:" name:BluetoothDeviceDisconnectFailedNotification object:0];
                if ([v31 connected])
                {
                  [v31 device];
                  int ComPortForServiceWithSandboxExtension = BTDeviceGetComPortForServiceWithSandboxExtension();
                  if (ComPortForServiceWithSandboxExtension)
                  {
                    int v34 = ComPortForServiceWithSandboxExtension;
                    v35 = +[AXSubsystemBrailleHardware sharedInstance];
                    unsigned __int8 v36 = [v35 ignoreLogging];

                    v29 = v128;
                    v12 = v129;
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
                          *(_DWORD *)v137 = 138543362;
                          v138 = v41;
                          _os_log_impl(&dword_0, v38, v39, "%{public}@", v137, 0xCu);
                        }
                      }
                      goto LABEL_50;
                    }
                    goto LABEL_51;
                  }
                  v29 = v128;
                  v12 = v129;
                  if (sandbox_extension_consume() == -1)
                  {
                    v59 = +[AXSubsystemBrailleHardware sharedInstance];
                    unsigned __int8 v60 = [v59 ignoreLogging];

                    if ((v60 & 1) == 0)
                    {
                      v61 = +[AXSubsystemBrailleHardware identifier];
                      v62 = AXLoggerForFacility();

                      os_log_type_t v63 = AXOSLogLevelFromAXLogLevel();
                      if (os_log_type_enabled(v62, v63))
                      {
                        uint64_t v64 = AXColorizeFormatLog();
                        comPort = (NSString *)*__error();
                        v125 = (void *)v64;
                        v65 = _AXStringForArgs();
                        if (os_log_type_enabled(v62, v63))
                        {
                          *(_DWORD *)v137 = 138543362;
                          v138 = v65;
                          _os_log_impl(&dword_0, v62, v63, "%{public}@", v137, 0xCu);
                        }
                      }
                    }
                  }
                  int v66 = open((const char *)&buf, 131074, comPort);
                  self->_comPort = v66;
                  if (v66 < 0)
                  {
                    v88 = +[AXSubsystemBrailleHardware sharedInstance];
                    unsigned __int8 v89 = [v88 ignoreLogging];

                    if ((v89 & 1) == 0)
                    {
                      v90 = +[AXSubsystemBrailleHardware identifier];
                      v91 = AXLoggerForFacility();

                      os_log_type_t v92 = AXOSLogLevelFromAXLogLevel();
                      if (os_log_type_enabled(v91, v92))
                      {
                        v93 = AXColorizeFormatLog();
                        comPort = (NSString *)self->_comPort;
                        v94 = _AXStringForArgs();
                        if (os_log_type_enabled(v91, v92))
                        {
                          *(_DWORD *)v137 = 138543362;
                          v138 = v94;
                          _os_log_impl(&dword_0, v91, v92, "%{public}@", v137, 0xCu);
                        }
                      }
                    }
                    self->_comPort = -1;
                    goto LABEL_51;
                  }
                  objc_storeStrong((id *)&self->_device, v21);
                  id v126 = [objc_allocWithZone((Class)NSFileHandle) initWithFileDescriptor:self->_comPort closeOnDealloc:1];
                  v67 = (SCRDFileReader *)[objc_allocWithZone((Class)SCRDFileReader) initWithDelegate:self fileHandle:v126];
                  readerThread = self->_readerThread;
                  self->_readerThread = v67;

                  Mutable = CFDataCreateMutable(kCFAllocatorDefault, 0);
                  self->_safeReadBuffer = Mutable;
                  v48 = v127;
                  if (!Mutable) {
                    goto LABEL_117;
                  }
                  v70 = (NSLock *)[objc_allocWithZone((Class)NSLock) init];
                  readBufferLock = self->_readBufferLock;
                  self->_readBufferLock = v70;

                  if (!self->_readBufferLock) {
                    goto LABEL_117;
                  }
                  v72 = CFDataCreateMutable(kCFAllocatorDefault, 0);
                  self->_readBuffer = v72;
                  if (!v72) {
                    goto LABEL_117;
                  }
                  [(SCRDFileReader *)self->_readerThread start];
                  p_mainSize = &self->_mainSize;
                  int v73 = 5;
                  while (2)
                  {
                    modelIdentifier = self->_modelIdentifier;
                    if (modelIdentifier) {
                      goto LABEL_90;
                    }
                    __int16 __buf = 16155;
                    if ((unint64_t)write(self->_comPort, &__buf, 2uLL) <= 1)
                    {
                      v104 = +[AXSubsystemBrailleHardware sharedInstance];
                      unsigned __int8 v105 = [v104 ignoreLogging];

                      if ((v105 & 1) == 0)
                      {
                        v106 = +[AXSubsystemBrailleHardware identifier];
                        v98 = AXLoggerForFacility();

                        os_log_type_t v107 = AXOSLogLevelFromAXLogLevel();
                        if (os_log_type_enabled(v98, v107))
                        {
                          v100 = AXColorizeFormatLog();
                          v101 = _AXStringForArgs();
                          if (os_log_type_enabled(v98, v107))
                          {
                            *(_DWORD *)v137 = 138543362;
                            v138 = v101;
                            v102 = v98;
                            os_log_type_t v103 = v107;
LABEL_107:
                            _os_log_impl(&dword_0, v102, v103, "%{public}@", v137, 0xCu);
                          }
LABEL_108:
                        }
LABEL_109:
                      }
LABEL_116:
                      v48 = v127;
                      goto LABEL_117;
                    }
                    self->_bluetoothChannelIsLost = 0;
                    self->_BOOL hasBeenUnloaded = 0;
                    CFRunLoopRunResult v75 = CFRunLoopRunInMode(kCFRunLoopDefaultMode, 1.0, 0);
                    CFRunLoopRunResult v76 = v75;
                    if (self->_bluetoothChannelIsLost || self->_hasBeenUnloaded || v75 == kCFRunLoopRunStopped)
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
                          BOOL hasBeenUnloaded = self->_hasBeenUnloaded;
                          uint64_t v123 = v76;
                          comPort = (NSString *)self->_bluetoothChannelIsLost;
                          v101 = _AXStringForArgs();
                          if (os_log_type_enabled(v98, v99))
                          {
                            *(_DWORD *)v137 = 138543362;
                            v138 = v101;
                            v102 = v98;
                            os_log_type_t v103 = v99;
                            goto LABEL_107;
                          }
                          goto LABEL_108;
                        }
                        goto LABEL_109;
                      }
                      goto LABEL_116;
                    }
                    [(NSLock *)self->_readBufferLock lock];
                    CFIndex Length = CFDataGetLength(self->_readBuffer);
                    if (Length >= 1)
                    {
                      CFIndex v78 = Length;
                      safeReadBuffer = self->_safeReadBuffer;
                      BytePtr = CFDataGetBytePtr(self->_readBuffer);
                      v81 = safeReadBuffer;
                      v48 = v127;
                      CFDataAppendBytes(v81, BytePtr, v78);
                      v142.location = 0;
                      v142.length = v78;
                      CFDataDeleteBytes(self->_readBuffer, v142);
                    }
                    [(NSLock *)self->_readBufferLock unlock];
                    uint64_t DescriptionPacketFromBuffer = SCRDBrailleNoteCreateDescriptionPacketFromBuffer();
                    if (DescriptionPacketFromBuffer)
                    {
                      v83 = (const void *)DescriptionPacketFromBuffer;
                      if (SCRDBrailleNoteGetDisplayInfoFromDescriptionPacket())
                      {
                        if (*p_mainSize == 32)
                        {
                          v84 = @"com.apple.scrod.braille.driver.humanware.braillenote.apex.32";
LABEL_86:
                          v85 = self->_modelIdentifier;
                          self->_modelIdentifier = &v84->isa;
                        }
                        else if (*p_mainSize == 18)
                        {
                          v84 = @"com.apple.scrod.braille.driver.humanware.braillenote.apex.18";
                          goto LABEL_86;
                        }
                      }
                      CFRelease(v83);
                    }
                    if (!--v73)
                    {
                      modelIdentifier = self->_modelIdentifier;
LABEL_90:
                      uint64_t v86 = [v131 objectForKey:modelIdentifier];
                      if (v86)
                      {
                        v87 = (NSLock *)v86;
                        int v26 = 0;
                        self->_isDriverLoaded = 1;
                        v30 = v131;
                        goto LABEL_122;
                      }
                      v108 = +[AXSubsystemBrailleHardware sharedInstance];
                      unsigned __int8 v109 = [v108 ignoreLogging];

                      v48 = v127;
                      if ((v109 & 1) == 0)
                      {
                        v110 = +[AXSubsystemBrailleHardware identifier];
                        v111 = AXLoggerForFacility();

                        os_log_type_t v112 = AXOSLogLevelFromAXLogLevel();
                        if (os_log_type_enabled(v111, v112))
                        {
                          v113 = AXColorizeFormatLog();
                          comPort = self->_modelIdentifier;
                          v114 = _AXStringForArgs();
                          if (os_log_type_enabled(v111, v112))
                          {
                            *(_DWORD *)v137 = 138543362;
                            v138 = v114;
                            _os_log_impl(&dword_0, v111, v112, "%{public}@", v137, 0xCu);
                          }
                        }
                        goto LABEL_116;
                      }
LABEL_117:
                      [(SCRDFileReader *)self->_readerThread invalidate];
                      v115 = self->_readerThread;
                      self->_readerThread = 0;

                      v116 = self->_safeReadBuffer;
                      if (v116)
                      {
                        CFRelease(v116);
                        self->_safeReadBuffer = 0;
                      }
                      [v48 removeObserver:self];
                      [(NSLock *)self->_readBufferLock lock];
                      readBuffer = self->_readBuffer;
                      v30 = v131;
                      if (readBuffer)
                      {
                        CFRelease(readBuffer);
                        self->_readBuffer = 0;
                      }
                      v118 = self->_readBufferLock;
                      self->_readBufferLock = 0;
                      v87 = v118;

                      [(NSLock *)v87 unlock];
                      device = self->_device;
                      self->_device = 0;

                      self->_comPort = -1;
                      v120 = self->_modelIdentifier;
                      self->_modelIdentifier = 0;

                      int v26 = 2;
LABEL_122:

LABEL_53:
LABEL_55:

                      id v4 = v130;
LABEL_56:

LABEL_57:
LABEL_58:

                      goto LABEL_59;
                    }
                    continue;
                  }
                }
                v52 = +[AXSubsystemBrailleHardware sharedInstance];
                unsigned __int8 v53 = [v52 ignoreLogging];

                v29 = v128;
                v12 = v129;
                if ((v53 & 1) == 0)
                {
                  v54 = +[AXSubsystemBrailleHardware identifier];
                  v38 = AXLoggerForFacility();

                  os_log_type_t v55 = AXOSLogLevelFromAXLogLevel();
                  if (os_log_type_enabled(v38, v55))
                  {
                    v56 = AXColorizeFormatLog();
                    v57 = _AXStringForArgs();
                    if (os_log_type_enabled(v38, v55))
                    {
                      int buf = 138543362;
                      v140 = v57;
                      _os_log_impl(&dword_0, v38, v55, "%{public}@", (uint8_t *)&buf, 0xCu);
                    }
                  }
LABEL_50:
                }
LABEL_51:
                v48 = v127;
                objc_msgSend(v127, "removeObserver:", self, comPort);
                int v26 = 1;
LABEL_52:
                v30 = v131;
                goto LABEL_53;
              }
LABEL_34:
              v42 = +[AXSubsystemBrailleHardware sharedInstance];
              unsigned __int8 v43 = [v42 ignoreLogging];

              if (v43)
              {
                int v26 = 1;
                v12 = v129;
                id v4 = v130;
                v29 = v128;
                v30 = v131;
                goto LABEL_56;
              }
              v46 = +[AXSubsystemBrailleHardware identifier];
              v31 = AXLoggerForFacility();

              int v26 = 1;
              os_log_type_t v47 = AXOSLogLevelFromAXLogLevel();
              v29 = v128;
              if (!os_log_type_enabled(v31, v47))
              {
                v12 = v129;
                v30 = v131;
                goto LABEL_55;
              }
              v48 = AXColorizeFormatLog();
              v49 = _AXStringForArgs();
              v12 = v129;
              if (os_log_type_enabled(v31, v47))
              {
                int buf = 138543362;
                v140 = v49;
                _os_log_impl(&dword_0, v31, v47, "%{public}@", (uint8_t *)&buf, 0xCu);
              }

              goto LABEL_52;
            }
          }
          id v18 = [v16 countByEnumeratingWithState:&v133 objects:v141 count:16];
        }
        while (v18);
      }

      goto LABEL_34;
    }
    v44 = +[AXSubsystemBrailleHardware sharedInstance];
    unsigned __int8 v45 = [v44 ignoreLogging];

    if ((v45 & 1) == 0)
    {
      v50 = +[AXSubsystemBrailleHardware identifier];
      v29 = AXLoggerForFacility();

      int v26 = 1;
      os_log_type_t v51 = AXOSLogLevelFromAXLogLevel();
      if (os_log_type_enabled(v29, v51))
      {
        v30 = AXColorizeFormatLog();
        v14 = _AXStringForArgs();
        if (os_log_type_enabled(v29, v51))
        {
          int buf = 138543362;
          v140 = v14;
          _os_log_impl(&dword_0, v29, v51, "%{public}@", (uint8_t *)&buf, 0xCu);
        }
        goto LABEL_56;
      }
      goto LABEL_58;
    }
    int v26 = 1;
LABEL_59:
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
          v140 = v30;
          _os_log_impl(&dword_0, v12, v28, "%{public}@", (uint8_t *)&buf, 0xCu);
        }
        goto LABEL_57;
      }
      goto LABEL_59;
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

  return (id)_SCRDBrailleNoteExtractEventsFromBuffer(v8);
}

- (BOOL)setMainCells:(const char *)a3 length:(int64_t)a4
{
  CFDataRef DisplayRequest = (const __CFData *)SCRDBrailleNoteCreateDisplayRequest();
  if (!DisplayRequest) {
    return 0;
  }
  CFDataRef v6 = DisplayRequest;
  if (self->_comPort == -1)
  {
    BOOL v10 = 0;
  }
  else
  {
    size_t Length = CFDataGetLength(DisplayRequest);
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
  unsigned __int8 v4 = [a3 object];
  if (v4)
  {
    if (v4 == self->_device)
    {
      self->_bluetoothChannelIsLost = 1;
      if (self->_isDriverLoaded)
      {
        CFDataRef v6 = v4;
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