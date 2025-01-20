@interface MSCROFreedomScientificBrailleDriver
- (BOOL)isDriverLoaded;
- (BOOL)isInputEnabled;
- (BOOL)isSleeping;
- (BOOL)postsKeyboardEvents;
- (BOOL)setMainCells:(const char *)a3 length:(int64_t)a4;
- (BOOL)setStatusCells:(const char *)a3 length:(int64_t)a4;
- (BOOL)supportsBlinkingCursor;
- (BOOL)unloadDriver;
- (MSCROFreedomScientificBrailleDriver)init;
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

@implementation MSCROFreedomScientificBrailleDriver

- (MSCROFreedomScientificBrailleDriver)init
{
  v3.receiver = self;
  v3.super_class = (Class)MSCROFreedomScientificBrailleDriver;
  result = [(MSCROFreedomScientificBrailleDriver *)&v3 init];
  if (result)
  {
    result->_isDriverLoaded = 0;
    result->_comPort = -1;
  }
  return result;
}

- (void)dealloc
{
  [(MSCROFreedomScientificBrailleDriver *)self unloadDriver];
  v3.receiver = self;
  v3.super_class = (Class)MSCROFreedomScientificBrailleDriver;
  [(MSCROFreedomScientificBrailleDriver *)&v3 dealloc];
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
        v159 = v11;
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
        [(MSCROFreedomScientificBrailleDriver *)self unloadDriver];
      }
      v146 = self;
      v147 = [v12 infoDictionary];
      [v147 objectForKey:kSCROBrailleDriverModels];
      v149 = id v148 = v4;
      v14 = [v4 bluetoothAddress];
      long long v152 = 0u;
      long long v153 = 0u;
      long long v154 = 0u;
      long long v155 = 0u;
      v15 = +[BluetoothManager sharedInstance];
      v16 = [v15 pairedDevices];

      id v17 = [v16 countByEnumeratingWithState:&v152 objects:v160 count:16];
      if (v17)
      {
        id v18 = v17;
        uint64_t v19 = *(void *)v153;
LABEL_14:
        uint64_t v20 = 0;
        while (1)
        {
          if (*(void *)v153 != v19) {
            objc_enumerationMutation(v16);
          }
          v21 = *(void **)(*((void *)&v152 + 1) + 8 * v20);
          v22 = [v21 address];
          unsigned __int8 v23 = [v22 isEqualToString:v14];

          if (v23) {
            break;
          }
          if (v18 == (id)++v20)
          {
            id v18 = [v16 countByEnumeratingWithState:&v152 objects:v160 count:16];
            if (!v18) {
              goto LABEL_20;
            }
            goto LABEL_14;
          }
        }
        v31 = v21;

        if (v31)
        {
          v32 = AXLogBrailleHW();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v159 = v31;
            _os_log_impl(&dword_0, v32, OS_LOG_TYPE_DEFAULT, "Found paired device: %@", buf, 0xCu);
          }

          v33 = +[NSNotificationCenter defaultCenter];
          v34 = v146;
          [v33 addObserver:v146 selector:"removeDeviceNotification:" name:BluetoothDeviceDisconnectSuccessNotification object:0];
          [v33 addObserver:v146 selector:"removeDeviceNotification:" name:BluetoothDeviceDisconnectFailedNotification object:0];
          if ([v31 connected])
          {
            [v31 device];
            int ComPortForServiceWithSandboxExtension = BTDeviceGetComPortForServiceWithSandboxExtension();
            if (ComPortForServiceWithSandboxExtension)
            {
              int v36 = ComPortForServiceWithSandboxExtension;
              v37 = +[AXSubsystemBrailleHardware sharedInstance];
              unsigned __int8 v38 = [v37 ignoreLogging];

              if ((v38 & 1) == 0)
              {
                v143 = v33;
                v39 = +[AXSubsystemBrailleHardware identifier];
                v40 = AXLoggerForFacility();

                os_log_type_t v41 = AXOSLogLevelFromAXLogLevel();
                if (os_log_type_enabled(v40, v41))
                {
                  v42 = AXColorizeFormatLog();
                  bluetoothChannelIsLost = (NSString *)v36;
                  v43 = _AXStringForArgs();
                  if (os_log_type_enabled(v40, v41))
                  {
                    *(_DWORD *)v156 = 138543362;
                    v157 = v43;
                    _os_log_impl(&dword_0, v40, v41, "%{public}@", v156, 0xCu);
                  }
                }
LABEL_52:

                v33 = v143;
              }
            }
            else
            {
              v145 = v33;
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
                      *(_DWORD *)v156 = 138543362;
                      v157 = v67;
                      _os_log_impl(&dword_0, v64, v65, "%{public}@", v156, 0xCu);
                    }

                    v33 = v145;
                  }
                }
              }
              int v68 = open((const char *)buf, 131074, bluetoothChannelIsLost);
              v146->_comPort = v68;
              if ((v68 & 0x80000000) == 0)
              {
                objc_storeStrong((id *)&v146->_device, v21);
                id type = [objc_allocWithZone((Class)NSFileHandle) initWithFileDescriptor:v146->_comPort closeOnDealloc:1];
                v69 = (SCRDFileReader *)[objc_allocWithZone((Class)SCRDFileReader) initWithDelegate:v146 fileHandle:type];
                readerThread = v146->_readerThread;
                v146->_readerThread = v69;

                CFMutableDataRef Mutable = CFDataCreateMutable(kCFAllocatorDefault, 0);
                v146->_safeReadBuffer = Mutable;
                if (!Mutable) {
                  goto LABEL_140;
                }
                v72 = (NSLock *)[objc_allocWithZone((Class)NSLock) init];
                readBufferLock = v146->_readBufferLock;
                v146->_readBufferLock = v72;

                if (!v146->_readBufferLock) {
                  goto LABEL_140;
                }
                CFMutableDataRef v74 = CFDataCreateMutable(kCFAllocatorDefault, 0);
                v146->_readBuffer = v74;
                if (!v74) {
                  goto LABEL_140;
                }
                [(SCRDFileReader *)v146->_readerThread start];
                int v75 = 0;
                v146->_int deviceID = 0;
                while (1)
                {
                  int __buf = 527;
                  if ((unint64_t)write(v146->_comPort, &__buf, 4uLL) <= 3)
                  {
                    v107 = +[AXSubsystemBrailleHardware sharedInstance];
                    unsigned __int8 v108 = [v107 ignoreLogging];

                    if (v108) {
                      goto LABEL_140;
                    }
                    v109 = +[AXSubsystemBrailleHardware identifier];
                    v103 = AXLoggerForFacility();

                    os_log_type_t v110 = AXOSLogLevelFromAXLogLevel();
                    if (os_log_type_enabled(v103, v110))
                    {
                      v105 = AXColorizeFormatLog();
                      v106 = _AXStringForArgs();
                      if (os_log_type_enabled(v103, v110))
                      {
                        *(_DWORD *)v156 = 138543362;
                        v157 = v106;
                        _os_log_impl(&dword_0, v103, v110, "%{public}@", v156, 0xCu);
                      }
                      v34 = v146;
LABEL_115:
                    }
LABEL_139:

                    goto LABEL_140;
                  }
                  v146->_bluetoothChannelIsLost = 0;
                  v146->_BOOL hasBeenUnloaded = 0;
                  CFRunLoopRunResult v76 = CFRunLoopRunInMode(kCFRunLoopDefaultMode, 0.3, 0);
                  CFRunLoopRunResult v77 = v76;
                  if (v146->_bluetoothChannelIsLost || v146->_hasBeenUnloaded || v76 == kCFRunLoopRunStopped)
                  {
                    v100 = +[AXSubsystemBrailleHardware sharedInstance];
                    unsigned __int8 v101 = [v100 ignoreLogging];

                    if (v101) {
                      goto LABEL_140;
                    }
                    v102 = +[AXSubsystemBrailleHardware identifier];
                    v103 = AXLoggerForFacility();

                    os_log_type_t v104 = AXOSLogLevelFromAXLogLevel();
                    if (os_log_type_enabled(v103, v104))
                    {
                      v105 = AXColorizeFormatLog();
                      BOOL hasBeenUnloaded = v146->_hasBeenUnloaded;
                      uint64_t v141 = v77;
                      bluetoothChannelIsLost = (NSString *)v146->_bluetoothChannelIsLost;
                      v106 = _AXStringForArgs();
                      if (os_log_type_enabled(v103, v104))
                      {
                        *(_DWORD *)v156 = 138543362;
                        v157 = v106;
                        _os_log_impl(&dword_0, v103, v104, "%{public}@", v156, 0xCu);
                      }
                      goto LABEL_115;
                    }
                    goto LABEL_139;
                  }
                  [(NSLock *)v146->_readBufferLock lock];
                  CFIndex Length = CFDataGetLength(v146->_readBuffer);
                  if (Length >= 1)
                  {
                    CFIndex v79 = Length;
                    safeReadBuffer = v146->_safeReadBuffer;
                    BytePtr = CFDataGetBytePtr(v146->_readBuffer);
                    CFDataAppendBytes(safeReadBuffer, BytePtr, v79);
                    v161.location = 0;
                    v161.length = v79;
                    CFDataDeleteBytes(v146->_readBuffer, v161);
                  }
                  [(NSLock *)v146->_readBufferLock unlock];
                  if (SCRDFreedomScientificDoesBufferContainACKPacket())
                  {
                    int v150 = 0;
                    if ((unint64_t)write(v146->_comPort, &v150, 4uLL) <= 3)
                    {
                      v129 = +[AXSubsystemBrailleHardware sharedInstance];
                      unsigned __int8 v130 = [v129 ignoreLogging];

                      if (v130) {
                        goto LABEL_140;
                      }
                      v131 = +[AXSubsystemBrailleHardware identifier];
                      v103 = AXLoggerForFacility();

                      os_log_type_t v132 = AXOSLogLevelFromAXLogLevel();
                      if (os_log_type_enabled(v103, v132))
                      {
                        v115 = AXColorizeFormatLog();
                        v116 = _AXStringForArgs();
                        if (os_log_type_enabled(v103, v132))
                        {
                          *(_DWORD *)v156 = 138543362;
                          v157 = v116;
                          v117 = v103;
                          os_log_type_t v118 = v132;
LABEL_136:
                          _os_log_impl(&dword_0, v117, v118, "%{public}@", v156, 0xCu);
                        }
LABEL_137:
                      }
                      v34 = v146;
                      goto LABEL_139;
                    }
                    v146->_bluetoothChannelIsLost = 0;
                    v146->_BOOL hasBeenUnloaded = 0;
                    CFRunLoopRunResult v82 = CFRunLoopRunInMode(kCFRunLoopDefaultMode, 0.3, 0);
                    CFRunLoopRunResult v83 = v82;
                    if (v146->_bluetoothChannelIsLost || v146->_hasBeenUnloaded || v82 == kCFRunLoopRunStopped)
                    {
                      v111 = +[AXSubsystemBrailleHardware sharedInstance];
                      unsigned __int8 v112 = [v111 ignoreLogging];

                      if (v112) {
                        goto LABEL_140;
                      }
                      v113 = +[AXSubsystemBrailleHardware identifier];
                      v103 = AXLoggerForFacility();

                      os_log_type_t v114 = AXOSLogLevelFromAXLogLevel();
                      if (!os_log_type_enabled(v103, v114)) {
                        goto LABEL_139;
                      }
                      v115 = AXColorizeFormatLog();
                      BOOL hasBeenUnloaded = v146->_hasBeenUnloaded;
                      uint64_t v141 = v83;
                      bluetoothChannelIsLost = (NSString *)v146->_bluetoothChannelIsLost;
                      v116 = _AXStringForArgs();
                      if (os_log_type_enabled(v103, v114))
                      {
                        *(_DWORD *)v156 = 138543362;
                        v157 = v116;
                        v117 = v103;
                        os_log_type_t v118 = v114;
                        goto LABEL_136;
                      }
                      goto LABEL_137;
                    }
                    [(NSLock *)v146->_readBufferLock lock];
                    CFIndex v84 = CFDataGetLength(v146->_readBuffer);
                    if (v84 >= 1)
                    {
                      CFIndex v85 = v84;
                      v86 = v146->_safeReadBuffer;
                      v87 = CFDataGetBytePtr(v146->_readBuffer);
                      CFDataAppendBytes(v86, v87, v85);
                      v162.location = 0;
                      v162.length = v85;
                      CFDataDeleteBytes(v146->_readBuffer, v162);
                    }
                    [(NSLock *)v146->_readBufferLock unlock];
                    if (SCRDFreedomScientificDoesBufferContainACKPacket())
                    {
                      uint64_t PacketFromBuffer = SCRDFreedomScientificCreatePacketFromBuffer();
                      if (PacketFromBuffer)
                      {
                        v89 = (const void *)PacketFromBuffer;
                        while (*CFDataGetBytePtr((CFDataRef)v89) != 128)
                        {
                          CFRelease(v89);
                          v89 = (const void *)SCRDFreedomScientificCreatePacketFromBuffer();
                          if (!v89) {
                            goto LABEL_92;
                          }
                        }
                        v146->_int deviceID = SCRDFreedomScientificDeviceIDForInfoEventPacket();
                        CFRelease(v89);
LABEL_103:
                        int deviceID = v146->_deviceID;
LABEL_104:
                        v33 = v145;
                        switch(deviceID)
                        {
                          case 2:
                            modelIdentifier = v146->_modelIdentifier;
                            CFStringRef v99 = @"com.apple.scrod.braille.driver.freedomscientific.focus.40.blue";
                            goto LABEL_123;
                          case 7:
                            modelIdentifier = v146->_modelIdentifier;
                            CFStringRef v99 = @"com.apple.scrod.braille.driver.freedomscientific.focus.2.14.blue";
                            goto LABEL_123;
                          case 8:
                            modelIdentifier = v146->_modelIdentifier;
                            CFStringRef v99 = @"com.apple.scrod.braille.driver.freedomscientific.focus.2.40.blue";
                            goto LABEL_123;
                          case 9:
                            modelIdentifier = v146->_modelIdentifier;
                            CFStringRef v99 = @"com.apple.scrod.braille.driver.freedomscientific.focus.2.80.blue";
LABEL_123:
                            v146->_modelIdentifier = &v99->isa;

                            break;
                          default:
                            break;
                        }
                        v119 = [v149 objectForKey:v146->_modelIdentifier];
                        if (v119)
                        {
                          v120 = v119;
                          v121 = [(NSLock *)v119 objectForKey:kSCROBrailleDriverMainDisplaySize];
                          v146->_mainSize = [v121 unsignedCharValue];

                          int v26 = 0;
                          v146->_isDriverLoaded = 1;
                          v30 = v149;
                          goto LABEL_145;
                        }
                        v122 = +[AXSubsystemBrailleHardware sharedInstance];
                        unsigned __int8 v123 = [v122 ignoreLogging];

                        if ((v123 & 1) == 0)
                        {
                          v124 = +[AXSubsystemBrailleHardware identifier];
                          v125 = AXLoggerForFacility();

                          os_log_type_t v126 = AXOSLogLevelFromAXLogLevel();
                          if (os_log_type_enabled(v125, v126))
                          {
                            v127 = AXColorizeFormatLog();
                            bluetoothChannelIsLost = v146->_modelIdentifier;
                            v128 = _AXStringForArgs();
                            if (os_log_type_enabled(v125, v126))
                            {
                              *(_DWORD *)v156 = 138543362;
                              v157 = v128;
                              _os_log_impl(&dword_0, v125, v126, "%{public}@", v156, 0xCu);
                            }
                          }
                        }
LABEL_140:
                        [(SCRDFileReader *)v34->_readerThread invalidate];
                        v133 = v34->_readerThread;
                        v34->_readerThread = 0;

                        v134 = v34->_safeReadBuffer;
                        if (v134)
                        {
                          CFRelease(v134);
                          v34->_safeReadBuffer = 0;
                        }
                        v33 = v145;
                        [v145 removeObserver:v34];
                        [(NSLock *)v34->_readBufferLock lock];
                        readBuffer = v34->_readBuffer;
                        v30 = v149;
                        if (readBuffer)
                        {
                          CFRelease(readBuffer);
                          v34->_readBuffer = 0;
                        }
                        v136 = v34->_readBufferLock;
                        v34->_readBufferLock = 0;
                        v120 = v136;

                        [(NSLock *)v120 unlock];
                        device = v34->_device;
                        v34->_device = 0;

                        v34->_int deviceID = 0;
                        v34->_comPort = -1;
                        v138 = v34->_modelIdentifier;
                        v34->_modelIdentifier = 0;

                        int v26 = 2;
LABEL_145:

                        v29 = v147;
                        id v4 = v148;
LABEL_54:

                        goto LABEL_56;
                      }
                    }
                  }
LABEL_92:
                  if (++v75 == 5) {
                    goto LABEL_103;
                  }
                  int deviceID = v146->_deviceID;
                  if (deviceID) {
                    goto LABEL_104;
                  }
                }
              }
              v91 = +[AXSubsystemBrailleHardware sharedInstance];
              unsigned __int8 v92 = [v91 ignoreLogging];

              if ((v92 & 1) == 0)
              {
                v93 = +[AXSubsystemBrailleHardware identifier];
                v94 = AXLoggerForFacility();

                os_log_type_t v95 = AXOSLogLevelFromAXLogLevel();
                if (os_log_type_enabled(v94, v95))
                {
                  v96 = AXColorizeFormatLog();
                  bluetoothChannelIsLost = (NSString *)v146->_comPort;
                  v97 = _AXStringForArgs();
                  if (os_log_type_enabled(v94, v95))
                  {
                    *(_DWORD *)v156 = 138543362;
                    v157 = v97;
                    _os_log_impl(&dword_0, v94, v95, "%{public}@", v156, 0xCu);
                  }
                }
                v33 = v145;
              }
              v146->_comPort = -1;
            }
          }
          else
          {
            v54 = +[AXSubsystemBrailleHardware sharedInstance];
            unsigned __int8 v55 = [v54 ignoreLogging];

            if ((v55 & 1) == 0)
            {
              v143 = v33;
              v56 = +[AXSubsystemBrailleHardware identifier];
              v40 = AXLoggerForFacility();

              os_log_type_t v57 = AXOSLogLevelFromAXLogLevel();
              if (os_log_type_enabled(v40, v57))
              {
                v58 = AXColorizeFormatLog();
                v59 = _AXStringForArgs();
                if (os_log_type_enabled(v40, v57))
                {
                  *(_DWORD *)buf = 138543362;
                  v159 = v59;
                  _os_log_impl(&dword_0, v40, v57, "%{public}@", buf, 0xCu);
                }
              }
              goto LABEL_52;
            }
          }
          objc_msgSend(v33, "removeObserver:", v146, bluetoothChannelIsLost);
          int v26 = 1;
          v29 = v147;
          id v4 = v148;
          v30 = v149;
          goto LABEL_54;
        }
      }
      else
      {
LABEL_20:
      }
      v44 = +[AXSubsystemBrailleHardware sharedInstance];
      unsigned __int8 v45 = [v44 ignoreLogging];

      if (v45)
      {
        int v26 = 1;
        v29 = v147;
        id v4 = v148;
        v30 = v149;
      }
      else
      {
        v48 = +[AXSubsystemBrailleHardware identifier];
        v49 = AXLoggerForFacility();

        int v26 = 1;
        os_log_type_t v50 = AXOSLogLevelFromAXLogLevel();
        v29 = v147;
        if (os_log_type_enabled(v49, v50))
        {
          uint64_t v144 = AXColorizeFormatLog();
          v51 = _AXStringForArgs();
          if (os_log_type_enabled(v49, v50))
          {
            *(_DWORD *)buf = 138543362;
            v159 = v51;
            _os_log_impl(&dword_0, v49, v50, "%{public}@", buf, 0xCu);
          }

          id v4 = v148;
          v30 = v149;
          v31 = v49;
          v33 = (void *)v144;
          goto LABEL_54;
        }
        id v4 = v148;
        v30 = v149;
        v31 = v49;
LABEL_56:
      }
LABEL_57:

LABEL_58:
      goto LABEL_59;
    }
    v46 = +[AXSubsystemBrailleHardware sharedInstance];
    unsigned __int8 v47 = [v46 ignoreLogging];

    if ((v47 & 1) == 0)
    {
      v52 = +[AXSubsystemBrailleHardware identifier];
      v29 = AXLoggerForFacility();

      int v26 = 1;
      os_log_type_t v53 = AXOSLogLevelFromAXLogLevel();
      if (!os_log_type_enabled(v29, v53))
      {
LABEL_59:

        goto LABEL_60;
      }
      v30 = AXColorizeFormatLog();
      v14 = _AXStringForArgs();
      if (os_log_type_enabled(v29, v53))
      {
        *(_DWORD *)buf = 138543362;
        v159 = v14;
        _os_log_impl(&dword_0, v29, v53, "%{public}@", buf, 0xCu);
      }
      goto LABEL_57;
    }
    int v26 = 1;
LABEL_60:

    goto LABEL_61;
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
        v159 = v30;
        _os_log_impl(&dword_0, v12, v28, "%{public}@", buf, 0xCu);
      }
      goto LABEL_58;
    }
    goto LABEL_60;
  }
  int v26 = 1;
LABEL_61:

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

    self->_mainSize = 0;
    *(void *)&self->_int deviceID = 0;
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

  return (id)_SCRDFreedomScientificExtractEventsFromBuffer(v8, &self->_brailleKeysDown, &self->_topPanelKeysDown, &self->_frontPanelKeysDown, &self->_rockerKeysDown);
}

- (BOOL)setMainCells:(const char *)a3 length:(int64_t)a4
{
  CFDataRef v5 = (const __CFData *)SCRDFreedomScientificCreateWriteRequestPacket();
  if (v5)
  {
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
  }
  else
  {
    BOOL v10 = 0;
  }
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