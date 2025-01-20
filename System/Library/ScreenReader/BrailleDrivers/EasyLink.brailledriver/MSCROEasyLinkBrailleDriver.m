@interface MSCROEasyLinkBrailleDriver
- (BOOL)isDriverLoaded;
- (BOOL)isInputEnabled;
- (BOOL)isSleeping;
- (BOOL)postsKeyboardEvents;
- (BOOL)setMainCells:(const char *)a3 length:(int64_t)a4;
- (BOOL)setStatusCells:(const char *)a3 length:(int64_t)a4;
- (BOOL)supportsBlinkingCursor;
- (BOOL)unloadDriver;
- (MSCROEasyLinkBrailleDriver)init;
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

@implementation MSCROEasyLinkBrailleDriver

- (MSCROEasyLinkBrailleDriver)init
{
  v3.receiver = self;
  v3.super_class = (Class)MSCROEasyLinkBrailleDriver;
  result = [(MSCROEasyLinkBrailleDriver *)&v3 init];
  if (result)
  {
    result->_isDriverLoaded = 0;
    result->_comPort = -1;
  }
  return result;
}

- (void)dealloc
{
  [(MSCROEasyLinkBrailleDriver *)self unloadDriver];
  v3.receiver = self;
  v3.super_class = (Class)MSCROEasyLinkBrailleDriver;
  [(MSCROEasyLinkBrailleDriver *)&v3 dealloc];
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
        v156 = v11;
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
        [(MSCROEasyLinkBrailleDriver *)self unloadDriver];
      }
      v143 = self;
      v146 = [v12 infoDictionary];
      v144 = [v146 objectForKey:kSCROBrailleDriverModels];
      id v145 = v4;
      v14 = [v4 bluetoothAddress];
      long long v149 = 0u;
      long long v150 = 0u;
      long long v151 = 0u;
      long long v152 = 0u;
      v15 = +[BluetoothManager sharedInstance];
      v16 = [v15 pairedDevices];

      id v17 = [v16 countByEnumeratingWithState:&v149 objects:v157 count:16];
      if (!v17)
      {
LABEL_20:

LABEL_36:
        v43 = +[AXSubsystemBrailleHardware sharedInstance];
        unsigned __int8 v44 = [v43 ignoreLogging];

        id v4 = v145;
        if (v44)
        {
          int v26 = 1;
          v29 = v146;
          v30 = v144;
LABEL_94:

LABEL_95:
          goto LABEL_96;
        }
        v47 = +[AXSubsystemBrailleHardware identifier];
        v48 = AXLoggerForFacility();

        int v26 = 1;
        os_log_type_t v49 = AXOSLogLevelFromAXLogLevel();
        v29 = v146;
        v142 = v48;
        if (!os_log_type_enabled(v48, v49))
        {
          v30 = v144;
LABEL_93:

          goto LABEL_94;
        }
        uint64_t v50 = AXColorizeFormatLog();
        v51 = _AXStringForArgs();
        if (os_log_type_enabled(v48, v49))
        {
          *(_DWORD *)buf = 138543362;
          v156 = v51;
          _os_log_impl(&dword_0, v48, v49, "%{public}@", buf, 0xCu);
        }

        v30 = v144;
        v32 = (void *)v50;
LABEL_92:

        goto LABEL_93;
      }
      id v18 = v17;
      uint64_t v19 = *(void *)v150;
LABEL_14:
      uint64_t v20 = 0;
      while (1)
      {
        if (*(void *)v150 != v19) {
          objc_enumerationMutation(v16);
        }
        v21 = *(void **)(*((void *)&v149 + 1) + 8 * v20);
        v22 = [v21 address];
        unsigned __int8 v23 = [v22 isEqualToString:v14];

        if (v23) {
          break;
        }
        if (v18 == (id)++v20)
        {
          id v18 = [v16 countByEnumeratingWithState:&v149 objects:v157 count:16];
          if (v18) {
            goto LABEL_14;
          }
          goto LABEL_20;
        }
      }
      v31 = v21;

      if (!v31) {
        goto LABEL_36;
      }
      v32 = +[NSNotificationCenter defaultCenter];
      v33 = v143;
      [v32 addObserver:v143 selector:"removeDeviceNotification:" name:BluetoothDeviceDisconnectSuccessNotification object:0];
      [v32 addObserver:v143 selector:"removeDeviceNotification:" name:BluetoothDeviceDisconnectFailedNotification object:0];
      v142 = v31;
      if ([v31 connected])
      {
        v141 = v32;
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
                *(_DWORD *)v153 = 138543362;
                v154 = v42;
                _os_log_impl(&dword_0, v39, v40, "%{public}@", v153, 0xCu);
              }
            }
          }
          v32 = v141;
          objc_msgSend(v141, "removeObserver:", v143, bluetoothChannelIsLost);
          int v26 = 1;
          id v4 = v145;
          v29 = v146;
          v30 = v144;
          goto LABEL_92;
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
                *(_DWORD *)v153 = 138543362;
                v154 = v67;
                _os_log_impl(&dword_0, v64, v65, "%{public}@", v153, 0xCu);
              }
            }
          }
        }
        int v68 = open((const char *)buf, 131074, bluetoothChannelIsLost);
        v143->_comPort = v68;
        id v4 = v145;
        if ((v68 & 0x80000000) == 0)
        {
          objc_storeStrong((id *)&v143->_device, v21);
          id v140 = [objc_allocWithZone((Class)NSFileHandle) initWithFileDescriptor:v143->_comPort closeOnDealloc:1];
          v69 = (SCRDFileReader *)[objc_allocWithZone((Class)SCRDFileReader) initWithDelegate:v143 fileHandle:v140];
          readerThread = v143->_readerThread;
          v143->_readerThread = v69;

          CFMutableDataRef Mutable = CFDataCreateMutable(kCFAllocatorDefault, 0);
          v143->_safeReadBuffer = Mutable;
          if (!Mutable
            || (v72 = (NSLock *)[objc_allocWithZone((Class)NSLock) init],
                readBufferLock = v143->_readBufferLock,
                v143->_readBufferLock = v72,
                readBufferLock,
                !v143->_readBufferLock)
            || (CFMutableDataRef v74 = CFDataCreateMutable(kCFAllocatorDefault, 0), (v143->_readBuffer = v74) == 0))
          {
            v75 = 0;
            goto LABEL_75;
          }
          [(SCRDFileReader *)v143->_readerThread start];
          v75 = [(BluetoothDevice *)v143->_device name];
          if (([v75 isEqualToString:kSCRDEasyLinkBluetoothNameEasyLink] & 1) == 0
            && ([v75 isEqualToString:kSCRDEasyLinkBluetoothNameBraillePen] & 1) == 0)
          {
            int v98 = 0;
            v139 = v75;
            while (1)
            {
              if (v143->_modelIdentifier) {
                goto LABEL_125;
              }
              __int16 __buf = 19483;
              if ((unint64_t)write(v143->_comPort, &__buf, 2uLL) <= 1) {
                break;
              }
              v143->_bluetoothChannelIsLost = 0;
              v143->_BOOL hasBeenUnloaded = 0;
              CFRunLoopRunResult v99 = CFRunLoopRunInMode(kCFRunLoopDefaultMode, 1.0, 0);
              CFRunLoopRunResult v100 = v99;
              if (v143->_bluetoothChannelIsLost || v143->_hasBeenUnloaded || v99 == kCFRunLoopRunStopped)
              {
                v126 = +[AXSubsystemBrailleHardware sharedInstance];
                unsigned __int8 v127 = [v126 ignoreLogging];

                if (v127) {
                  goto LABEL_149;
                }
                v128 = +[AXSubsystemBrailleHardware identifier];
                v129 = AXLoggerForFacility();

                os_log_type_t v130 = AXOSLogLevelFromAXLogLevel();
                if (os_log_type_enabled(v129, v130))
                {
                  v131 = AXColorizeFormatLog();
                  BOOL hasBeenUnloaded = v143->_hasBeenUnloaded;
                  uint64_t v138 = v100;
                  bluetoothChannelIsLost = (NSString *)v143->_bluetoothChannelIsLost;
                  v132 = _AXStringForArgs();
                  if (os_log_type_enabled(v129, v130))
                  {
                    *(_DWORD *)v153 = 138543362;
                    v154 = v132;
                    goto LABEL_145;
                  }
                  goto LABEL_146;
                }
                goto LABEL_148;
              }
              [(NSLock *)v143->_readBufferLock lock];
              CFIndex Length = CFDataGetLength(v143->_readBuffer);
              if (Length >= 1)
              {
                CFIndex v102 = Length;
                safeReadBuffer = v143->_safeReadBuffer;
                BytePtr = CFDataGetBytePtr(v143->_readBuffer);
                CFDataAppendBytes(safeReadBuffer, BytePtr, v102);
                v158.location = 0;
                v158.length = v102;
                CFDataDeleteBytes(v143->_readBuffer, v158);
              }
              [(NSLock *)v143->_readBufferLock unlock];
              while (1)
              {
                CFDataRef PacketFromBuffer = (const __CFData *)SCRDEasyLinkCreatePacketFromBuffer();
                if (!PacketFromBuffer) {
                  break;
                }
                CFDataRef v106 = PacketFromBuffer;
                v107 = CFDataGetBytePtr(PacketFromBuffer);
                int v108 = *v107;
                int v109 = v107[1];
                CFRelease(v106);
                if (v108 == 76 && v109 == 12)
                {
                  CFStringRef v112 = @"com.apple.scrod.braille.driver.optelec.easylink.12";
                  goto LABEL_122;
                }
                if (v108 == 76 && v109 == 14)
                {
                  CFStringRef v112 = @"com.apple.scrod.braille.driver.harpo.braillepen.14";
LABEL_122:
                  modelIdentifier = v143->_modelIdentifier;
                  v143->_modelIdentifier = &v112->isa;

                  break;
                }
              }
              ++v98;
              id v4 = v145;
              v75 = v139;
              if (v98 == 5)
              {
                if (!v143->_modelIdentifier) {
                  goto LABEL_68;
                }
LABEL_125:
                char v148 = 1;
                __int16 __buf = 17435;
                if ((unint64_t)write(v143->_comPort, &__buf, 3uLL) > 2) {
                  goto LABEL_68;
                }
                v114 = +[AXSubsystemBrailleHardware sharedInstance];
                unsigned __int8 v115 = [v114 ignoreLogging];

                if ((v115 & 1) == 0)
                {
                  v116 = +[AXSubsystemBrailleHardware identifier];
                  v117 = AXLoggerForFacility();

                  os_log_type_t v118 = AXOSLogLevelFromAXLogLevel();
                  if (os_log_type_enabled(v117, v118))
                  {
                    v119 = AXColorizeFormatLog();
                    v120 = _AXStringForArgs();
                    if (os_log_type_enabled(v117, v118))
                    {
                      *(_DWORD *)v153 = 138543362;
                      v154 = v120;
                      _os_log_impl(&dword_0, v117, v118, "%{public}@", v153, 0xCu);
                    }
                  }
                  v33 = v143;
                  v75 = v139;
                }
LABEL_149:
                id v4 = v145;
LABEL_75:
                v30 = v144;
LABEL_76:
                v32 = v141;
                goto LABEL_77;
              }
            }
            v133 = +[AXSubsystemBrailleHardware sharedInstance];
            unsigned __int8 v134 = [v133 ignoreLogging];

            if (v134) {
              goto LABEL_149;
            }
            v135 = +[AXSubsystemBrailleHardware identifier];
            v129 = AXLoggerForFacility();

            os_log_type_t v130 = AXOSLogLevelFromAXLogLevel();
            if (os_log_type_enabled(v129, v130))
            {
              v131 = AXColorizeFormatLog();
              v132 = _AXStringForArgs();
              if (os_log_type_enabled(v129, v130))
              {
                *(_DWORD *)v153 = 138543362;
                v154 = v132;
LABEL_145:
                _os_log_impl(&dword_0, v129, v130, "%{public}@", v153, 0xCu);
              }
LABEL_146:
            }
            v33 = v143;
            v75 = v139;
LABEL_148:

            goto LABEL_149;
          }
          v76 = v143->_modelIdentifier;
          v143->_modelIdentifier = (NSString *)@"com.apple.scrod.braille.driver.optelec.easylink";

          v143->_isKeyboardOnly = 1;
LABEL_68:
          v32 = v141;
          if (!v143->_modelIdentifier)
          {
            v77 = [(BluetoothDevice *)v143->_device name];

            v75 = v77;
            if (([v77 isEqualToString:kSCRDEasyLinkBluetoothNameEasyLink] & 1) != 0
              || [v77 isEqualToString:kSCRDEasyLinkBluetoothNameBraillePen])
            {
              v78 = v143->_modelIdentifier;
              v143->_modelIdentifier = (NSString *)@"com.apple.scrod.braille.driver.optelec.easylink";

              v143->_isKeyboardOnly = 1;
            }
          }
          v79 = [v144 objectForKey:v143->_modelIdentifier];
          if (v79)
          {
            v80 = v79;
            v81 = [(NSLock *)v79 objectForKey:kSCROBrailleDriverMainDisplaySize];
            v143->_mainSize = [v81 unsignedCharValue];

            int v26 = 0;
            v143->_isDriverLoaded = 1;
            v30 = v144;
          }
          else
          {
            v96 = +[AXSubsystemBrailleHardware sharedInstance];
            unsigned __int8 v97 = [v96 ignoreLogging];

            if ((v97 & 1) == 0)
            {
              v121 = +[AXSubsystemBrailleHardware identifier];
              v122 = AXLoggerForFacility();

              os_log_type_t v123 = AXOSLogLevelFromAXLogLevel();
              v30 = v144;
              if (os_log_type_enabled(v122, v123))
              {
                v124 = AXColorizeFormatLog();
                bluetoothChannelIsLost = v143->_modelIdentifier;
                v125 = _AXStringForArgs();
                if (os_log_type_enabled(v122, v123))
                {
                  *(_DWORD *)v153 = 138543362;
                  v154 = v125;
                  _os_log_impl(&dword_0, v122, v123, "%{public}@", v153, 0xCu);
                }
              }
              id v4 = v145;
              goto LABEL_76;
            }
            v30 = v144;
            id v4 = v145;
LABEL_77:
            [(SCRDFileReader *)v33->_readerThread invalidate];
            v82 = v33->_readerThread;
            v33->_readerThread = 0;

            v83 = v33->_safeReadBuffer;
            if (v83)
            {
              CFRelease(v83);
              v33->_safeReadBuffer = 0;
            }
            [v32 removeObserver:v33];
            [(NSLock *)v33->_readBufferLock lock];
            readBuffer = v33->_readBuffer;
            if (readBuffer)
            {
              CFRelease(readBuffer);
              v33->_readBuffer = 0;
            }
            v85 = v33->_readBufferLock;
            v33->_readBufferLock = 0;
            v80 = v85;

            [(NSLock *)v80 unlock];
            device = v33->_device;
            v33->_device = 0;

            v33->_comPort = -1;
            v33->_isKeyboardOnly = 0;
            v87 = v33->_modelIdentifier;
            v33->_modelIdentifier = 0;

            int v26 = 2;
          }

          v29 = v146;
          goto LABEL_92;
        }
        v88 = +[AXSubsystemBrailleHardware sharedInstance];
        unsigned __int8 v89 = [v88 ignoreLogging];

        v29 = v146;
        if ((v89 & 1) == 0)
        {
          v90 = +[AXSubsystemBrailleHardware identifier];
          v91 = AXLoggerForFacility();

          os_log_type_t v92 = AXOSLogLevelFromAXLogLevel();
          if (os_log_type_enabled(v91, v92))
          {
            v93 = AXColorizeFormatLog();
            bluetoothChannelIsLost = (NSString *)v143->_comPort;
            v94 = _AXStringForArgs();
            if (os_log_type_enabled(v91, v92))
            {
              *(_DWORD *)v153 = 138543362;
              v154 = v94;
              _os_log_impl(&dword_0, v91, v92, "%{public}@", v153, 0xCu);
            }

            v29 = v146;
          }
        }
        v143->_comPort = -1;
      }
      else
      {
        v54 = +[AXSubsystemBrailleHardware sharedInstance];
        unsigned __int8 v55 = [v54 ignoreLogging];

        v29 = v146;
        if (v55)
        {
LABEL_91:
          objc_msgSend(v32, "removeObserver:", v143, bluetoothChannelIsLost);
          int v26 = 1;
          v30 = v144;
          id v4 = v145;
          goto LABEL_92;
        }
        v141 = v32;
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
            v156 = v60;
            _os_log_impl(&dword_0, v57, v58, "%{public}@", buf, 0xCu);
          }

          v29 = v146;
        }
      }
      v32 = v141;
      goto LABEL_91;
    }
    v45 = +[AXSubsystemBrailleHardware sharedInstance];
    unsigned __int8 v46 = [v45 ignoreLogging];

    if ((v46 & 1) == 0)
    {
      v52 = +[AXSubsystemBrailleHardware identifier];
      v29 = AXLoggerForFacility();

      int v26 = 1;
      os_log_type_t v53 = AXOSLogLevelFromAXLogLevel();
      if (!os_log_type_enabled(v29, v53))
      {
LABEL_96:

        goto LABEL_97;
      }
      v30 = AXColorizeFormatLog();
      v14 = _AXStringForArgs();
      if (os_log_type_enabled(v29, v53))
      {
        *(_DWORD *)buf = 138543362;
        v156 = v14;
        _os_log_impl(&dword_0, v29, v53, "%{public}@", buf, 0xCu);
      }
      goto LABEL_94;
    }
    int v26 = 1;
LABEL_97:

    goto LABEL_98;
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
        v156 = v30;
        _os_log_impl(&dword_0, v12, v28, "%{public}@", buf, 0xCu);
      }
      goto LABEL_95;
    }
    goto LABEL_97;
  }
  int v26 = 1;
LABEL_98:

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

    *(_DWORD *)((char *)&self->_mainSize + 7) = 0;
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
  return !self->_isKeyboardOnly;
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
  if (self->_isKeyboardOnly) {
    SCRDEasyLinkExtractKeyboardEventsFromBuffer();
  }
  else {
  v8 = SCRDEasyLinkExtractEventsFromBuffer();
  }

  return v8;
}

- (BOOL)setMainCells:(const char *)a3 length:(int64_t)a4
{
  if (self->_isKeyboardOnly) {
    return 1;
  }
  if (a4 < 1)
  {
    char v9 = 0;
  }
  else
  {
    int64_t v8 = 0;
    char v9 = 0;
    unsigned int v10 = 1;
    do
    {
      if (a3[v8] == 27) {
        ++v9;
      }
      int64_t v8 = v10++;
    }
    while (v8 < a4);
  }
  unsigned __int8 v11 = self->_mainSize + v9;
  v12 = (char *)malloc_type_malloc(v11 + 4, 0x100004077774924uLL);
  if (!v12) {
    return 0;
  }
  v13 = v12;
  int64_t mainSize = self->_mainSize;
  if (mainSize >= a4)
  {
    if (mainSize > a4) {
      bzero(&v12[a4 + 4], mainSize - a4);
    }
    int64_t mainSize = a4;
  }
  strcpy(v13, "\x1BB");
  v13[3] = v11;
  if (mainSize >= 1)
  {
    uint64_t v15 = 0;
    v16 = v13 + 4;
    unsigned int v17 = 1;
    do
    {
      unsigned char *v16 = a3[v15];
      if (a3[v15] == 27)
      {
        v16[1] = 27;
        v16 += 2;
      }
      else
      {
        ++v16;
      }
      uint64_t v15 = v17;
    }
    while (mainSize > v17++);
  }
  int comPort = self->_comPort;
  BOOL v4 = comPort != -1 && write(comPort, v13, v11 + 4) == v11 + 4;
  free(v13);
  return v4;
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
  BOOL v4 = [a3 object];
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

        BOOL v4 = v6;
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