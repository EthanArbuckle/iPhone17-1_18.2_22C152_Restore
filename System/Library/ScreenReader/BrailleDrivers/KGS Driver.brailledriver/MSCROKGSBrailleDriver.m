@interface MSCROKGSBrailleDriver
- (BOOL)isDriverLoaded;
- (BOOL)isInputEnabled;
- (BOOL)isSleeping;
- (BOOL)postsKeyboardEvents;
- (BOOL)setMainCells:(const char *)a3 length:(int64_t)a4;
- (BOOL)setStatusCells:(const char *)a3 length:(int64_t)a4;
- (BOOL)supportsBlinkingCursor;
- (BOOL)unloadDriver;
- (MSCROKGSBrailleDriver)init;
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

@implementation MSCROKGSBrailleDriver

- (MSCROKGSBrailleDriver)init
{
  v3.receiver = self;
  v3.super_class = (Class)MSCROKGSBrailleDriver;
  result = [(MSCROKGSBrailleDriver *)&v3 init];
  if (result)
  {
    result->_isDriverLoaded = 0;
    result->_comPort = -1;
  }
  return result;
}

- (void)dealloc
{
  [(MSCROKGSBrailleDriver *)self unloadDriver];
  v3.receiver = self;
  v3.super_class = (Class)MSCROKGSBrailleDriver;
  [(MSCROKGSBrailleDriver *)&v3 dealloc];
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
        v198 = v11;
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
        [(MSCROKGSBrailleDriver *)self unloadDriver];
      }
      v184 = self;
      v185 = [v12 infoDictionary];
      v186 = [v185 objectForKey:kSCROBrailleDriverModels];
      id v187 = v4;
      v14 = [v4 bluetoothAddress];
      long long v191 = 0u;
      long long v192 = 0u;
      long long v193 = 0u;
      long long v194 = 0u;
      v15 = +[BluetoothManager sharedInstance];
      v16 = [v15 pairedDevices];

      id v17 = [v16 countByEnumeratingWithState:&v191 objects:v199 count:16];
      if (v17)
      {
        id v18 = v17;
        uint64_t v19 = *(void *)v192;
LABEL_14:
        uint64_t v20 = 0;
        while (1)
        {
          if (*(void *)v192 != v19) {
            objc_enumerationMutation(v16);
          }
          v21 = *(void **)(*((void *)&v191 + 1) + 8 * v20);
          v22 = [v21 address];
          unsigned __int8 v23 = [v22 isEqualToString:v14];

          if (v23) {
            break;
          }
          if (v18 == (id)++v20)
          {
            id v18 = [v16 countByEnumeratingWithState:&v191 objects:v199 count:16];
            if (!v18) {
              goto LABEL_20;
            }
            goto LABEL_14;
          }
        }
        v31 = v21;

        if (v31)
        {
          v32 = +[NSNotificationCenter defaultCenter];
          v33 = v184;
          [v32 addObserver:v184 selector:"removeDeviceNotification:" name:BluetoothDeviceDisconnectSuccessNotification object:0];
          v183 = v32;
          [v32 addObserver:v184 selector:"removeDeviceNotification:" name:BluetoothDeviceDisconnectFailedNotification object:0];
          if ([v31 connected])
          {
            v182 = v31;
            [v31 device];
            int ComPortForServiceWithSandboxExtension = BTDeviceGetComPortForServiceWithSandboxExtension();
            if (ComPortForServiceWithSandboxExtension)
            {
              int v35 = ComPortForServiceWithSandboxExtension;
              v36 = +[AXSubsystemBrailleHardware sharedInstance];
              unsigned __int8 v37 = [v36 ignoreLogging];

              v29 = v185;
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
                    *(_DWORD *)v195 = 138543362;
                    uint64_t v196 = (uint64_t)v42;
                    _os_log_impl(&dword_0, v39, v40, "%{public}@", v195, 0xCu);
                  }
                }
              }
              v43 = v183;
              objc_msgSend(v183, "removeObserver:", v184, bluetoothChannelIsLost);
              int v26 = 1;
              v30 = v186;
              id v4 = v187;
              v31 = v182;
              goto LABEL_89;
            }
            v29 = v185;
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
                    *(_DWORD *)v195 = 138543362;
                    uint64_t v196 = (uint64_t)v67;
                    _os_log_impl(&dword_0, v64, v65, "%{public}@", v195, 0xCu);
                  }
                }
              }
            }
            int v68 = open((const char *)&buf, 131074, bluetoothChannelIsLost);
            v184->_int comPort = v68;
            id v4 = v187;
            if ((v68 & 0x80000000) == 0)
            {
              objc_storeStrong((id *)&v184->_device, v21);
              id v69 = [objc_allocWithZone((Class)NSFileHandle) initWithFileDescriptor:v184->_comPort closeOnDealloc:1];
              v70 = (SCRDFileReader *)[objc_allocWithZone((Class)SCRDFileReader) initWithDelegate:v184 fileHandle:v69];
              readerThread = v184->_readerThread;
              v184->_readerThread = v70;

              CFMutableDataRef Mutable = CFDataCreateMutable(kCFAllocatorDefault, 0);
              v184->_safeReadBuffer = Mutable;
              v31 = v182;
              v179 = v69;
              if (!Mutable)
              {
                CFDataRef v101 = 0;
                v180 = 0;
                CFDataRef theData = 0;
                goto LABEL_98;
              }
              v73 = (NSLock *)[objc_allocWithZone((Class)NSLock) init];
              readBufferLock = v184->_readBufferLock;
              v184->_readBufferLock = v73;

              v43 = v183;
              if (!v184->_readBufferLock
                || (CFMutableDataRef v75 = CFDataCreateMutable(kCFAllocatorDefault, 0), (v184->_readBuffer = v75) == 0))
              {
                CFDataRef v101 = 0;
                v180 = 0;
                CFDataRef theData = 0;
                v30 = v186;
                goto LABEL_188;
              }
              [(SCRDFileReader *)v184->_readerThread start];
              CFDataRef v76 = (const __CFData *)SCRDKGSCreateCommandPacket();
              if (!v76)
              {
                v102 = +[AXSubsystemBrailleHardware sharedInstance];
                unsigned __int8 v103 = [v102 ignoreLogging];

                if (v103) {
                  goto LABEL_100;
                }
                v106 = +[AXSubsystemBrailleHardware identifier];
                v107 = AXLoggerForFacility();

                os_log_type_t v108 = AXOSLogLevelFromAXLogLevel();
                mode = v107;
                if (os_log_type_enabled(v107, v108))
                {
                  uint64_t v177 = AXColorizeFormatLog();
                  uint64_t v109 = _AXStringForArgs();
                  if (os_log_type_enabled(v107, v108))
                  {
                    *(_DWORD *)v195 = 138543362;
                    uint64_t v196 = v109;
                    _os_log_impl(&dword_0, v107, v108, "%{public}@", v195, 0xCu);
                  }
                  CFDataRef v101 = 0;
                  v180 = 0;
                  CFDataRef theData = 0;
                  v30 = v186;
                  id v4 = v187;
                  v110 = (void *)v109;
                  goto LABEL_108;
                }
                CFDataRef v101 = 0;
                CFDataRef theData = 0;
                goto LABEL_127;
              }
              CFDataRef theData = v76;
              ssize_t Length = CFDataGetLength(v76);
              unsigned int v78 = 0;
              UInt8 buffer = 0;
              while (1)
              {
                int comPort = v184->_comPort;
                BytePtr = CFDataGetBytePtr(theData);
                if (write(comPort, BytePtr, Length) < Length)
                {
                  v112 = +[AXSubsystemBrailleHardware sharedInstance];
                  unsigned __int8 v113 = [v112 ignoreLogging];

                  if (v113)
                  {
                    CFDataRef v101 = 0;
                    goto LABEL_111;
                  }
                  v118 = +[AXSubsystemBrailleHardware identifier];
                  v119 = AXLoggerForFacility();

                  os_log_type_t v120 = AXOSLogLevelFromAXLogLevel();
                  mode = v119;
                  if (os_log_type_enabled(v119, v120))
                  {
                    uint64_t v177 = AXColorizeFormatLog();
                    uint64_t v175 = _AXStringForArgs();
                    if (!os_log_type_enabled(v119, v120))
                    {
                      CFDataRef v101 = 0;
                      v180 = 0;
                      v30 = v186;
                      id v4 = v187;
                      goto LABEL_185;
                    }
                    *(_DWORD *)v195 = 138543362;
                    uint64_t v196 = v175;
                    _os_log_impl(&dword_0, v119, v120, "%{public}@", v195, 0xCu);
                    v110 = (void *)v175;
                    CFDataRef v101 = 0;
                    v180 = 0;
                    v30 = v186;
                    id v4 = v187;
                    goto LABEL_108;
                  }
                  CFDataRef v101 = 0;
LABEL_127:
                  v180 = 0;
                  v30 = v186;
                  id v4 = v187;
                  v43 = v183;
                  goto LABEL_187;
                }
                v184->_bluetoothChannelIsLost = 0;
                v184->_BOOL hasBeenUnloaded = 0;
                CFRunLoopRunResult v81 = CFRunLoopRunInMode(kCFRunLoopDefaultMode, 1.0, 0);
                CFRunLoopRunResult v82 = v81;
                if (v184->_bluetoothChannelIsLost || v184->_hasBeenUnloaded || v81 == kCFRunLoopRunStopped)
                {
                  v104 = +[AXSubsystemBrailleHardware sharedInstance];
                  unsigned __int8 v105 = [v104 ignoreLogging];

                  if (v105)
                  {
                    CFDataRef v101 = 0;
                    v180 = 0;
                    v30 = v186;
                    id v4 = v187;
LABEL_103:
                    v31 = v182;
                    v43 = v183;
                    goto LABEL_188;
                  }
                  v114 = +[AXSubsystemBrailleHardware identifier];
                  v115 = AXLoggerForFacility();

                  os_log_type_t v116 = AXOSLogLevelFromAXLogLevel();
                  mode = v115;
                  if (os_log_type_enabled(v115, v116))
                  {
                    v111 = AXColorizeFormatLog();
                    BOOL hasBeenUnloaded = v184->_hasBeenUnloaded;
                    uint64_t v174 = v82;
                    bluetoothChannelIsLost = (NSString *)v184->_bluetoothChannelIsLost;
                    uint64_t v117 = _AXStringForArgs();
                    if (os_log_type_enabled(v115, v116))
                    {
                      *(_DWORD *)v195 = 138543362;
                      uint64_t v196 = v117;
                      _os_log_impl(&dword_0, v115, v116, "%{public}@", v195, 0xCu);
                    }
                    CFDataRef v101 = 0;
                    v180 = 0;
                    v30 = v186;
                    id v4 = v187;
                    v31 = v182;
                    v110 = (void *)v117;
LABEL_116:
                    v43 = v183;
                    goto LABEL_186;
                  }
                  CFDataRef v101 = 0;
                  v180 = 0;
                  v30 = v186;
                  id v4 = v187;
LABEL_182:
                  v31 = v182;
                  v43 = v183;
                  goto LABEL_187;
                }
                [(NSLock *)v184->_readBufferLock lock];
                CFIndex v83 = CFDataGetLength(v184->_readBuffer);
                if (v83 >= 1)
                {
                  CFIndex v84 = v83;
                  safeReadBuffer = v184->_safeReadBuffer;
                  v86 = CFDataGetBytePtr(v184->_readBuffer);
                  CFDataAppendBytes(safeReadBuffer, v86, v84);
                  v200.location = 0;
                  v200.length = v84;
                  CFDataDeleteBytes(v184->_readBuffer, v200);
                }
                [(NSLock *)v184->_readBufferLock unlock];
                CFIndex v87 = CFDataGetLength(v184->_safeReadBuffer);
                CFIndex v88 = v87;
                v31 = v182;
                if (v87 == 1)
                {
                  v201.location = 0;
                  v201.length = 1;
                  CFDataGetBytes(v184->_safeReadBuffer, v201, &buffer);
                }
                else if (v87 < 1)
                {
                  goto LABEL_77;
                }
                v202.location = 0;
                v202.length = v88;
                CFDataDeleteBytes(v184->_safeReadBuffer, v202);
LABEL_77:
                if (v78 <= 3)
                {
                  ++v78;
                  if (!buffer) {
                    continue;
                  }
                }
                CFRelease(theData);
                v89 = [v182 name];
                unsigned int v90 = [v89 hasPrefix:@"BM-NextTouch40"];

                if (v90)
                {
                  modelIdentifier = v184->_modelIdentifier;
                  CFStringRef v92 = @"com.apple.scrod.braille.driver.kgs.bm.next.touch.40";
                }
                else
                {
                  switch(buffer)
                  {
                    case 0x28u:
                      CFStringRef v92 = @"com.apple.scrod.braille.driver.kgs.braille.memo.40";
                      break;
                    case 0x20u:
                      CFStringRef v92 = @"com.apple.scrod.braille.driver.kgs.braille.memo.32";
                      break;
                    case 0x10u:
                      CFStringRef v92 = @"com.apple.scrod.braille.driver.kgs.braille.memo.16";
                      break;
                    default:
                      CFStringRef v92 = 0;
                      break;
                  }
                  modelIdentifier = v184->_modelIdentifier;
                }
                v184->_modelIdentifier = &v92->isa;

                uint64_t v121 = [v186 objectForKey:v184->_modelIdentifier];
                if (v121)
                {
                  v180 = (void *)v121;
                  __int16 v189 = 0;
                  CFDataRef v122 = (const __CFData *)SCRDKGSCreateCommandPacket();
                  if (v122)
                  {
                    CFDataRef v101 = v122;
                    ssize_t v123 = CFDataGetLength(v122);
                    unsigned int v124 = 0;
                    UInt8 v188 = 0;
                    while (1)
                    {
                      int v125 = v184->_comPort;
                      v126 = CFDataGetBytePtr(v101);
                      if (write(v125, v126, v123) < v123)
                      {
                        v153 = +[AXSubsystemBrailleHardware sharedInstance];
                        unsigned __int8 v154 = [v153 ignoreLogging];

                        if ((v154 & 1) == 0)
                        {
                          v155 = +[AXSubsystemBrailleHardware identifier];
                          v156 = AXLoggerForFacility();

                          os_log_type_t v157 = AXOSLogLevelFromAXLogLevel();
                          if (os_log_type_enabled(v156, v157))
                          {
                            v158 = AXColorizeFormatLog();
                            v159 = _AXStringForArgs();
                            if (os_log_type_enabled(v156, v157))
                            {
                              *(_DWORD *)v195 = 138543362;
                              uint64_t v196 = (uint64_t)v159;
                              _os_log_impl(&dword_0, v156, v157, "%{public}@", v195, 0xCu);
                            }
                          }
                        }
LABEL_167:
                        CFRelease(v101);
                        if (v188)
                        {
                          v160 = [v180 objectForKey:kSCROBrailleDriverMainDisplaySize];
                          v184->_mainSize = [v160 unsignedCharValue];

                          int v26 = 0;
                          v184->_isDriverLoaded = 1;
                          v30 = v186;
                          id v4 = v187;
                          v29 = v185;
                          v31 = v182;
                          v43 = v183;
                          goto LABEL_197;
                        }
                        v161 = +[AXSubsystemBrailleHardware sharedInstance];
                        unsigned __int8 v162 = [v161 ignoreLogging];

                        if (v162) {
                          goto LABEL_171;
                        }
                        v163 = +[AXSubsystemBrailleHardware identifier];
                        v164 = AXLoggerForFacility();

                        os_log_type_t v145 = AXOSLogLevelFromAXLogLevel();
                        mode = v164;
                        if (!os_log_type_enabled(v164, v145)) {
                          goto LABEL_179;
                        }
                        uint64_t v177 = AXColorizeFormatLog();
                        uint64_t v175 = _AXStringForArgs();
                        if (os_log_type_enabled(v164, v145))
                        {
                          *(_DWORD *)v195 = 138543362;
                          v146 = (void *)v175;
                          uint64_t v196 = v175;
                          goto LABEL_177;
                        }
LABEL_183:
                        CFDataRef v101 = 0;
                        CFDataRef theData = 0;
LABEL_184:
                        v30 = v186;
                        id v4 = v187;
                        v33 = v184;
                        v29 = v185;
                        v31 = v182;
LABEL_185:
                        v43 = v183;
                        v110 = (void *)v175;
                        v111 = (void *)v177;
LABEL_186:

LABEL_187:
LABEL_188:
                        [(SCRDFileReader *)v33->_readerThread invalidate];
                        v165 = v33->_readerThread;
                        v33->_readerThread = 0;

                        v166 = v33->_safeReadBuffer;
                        if (v166)
                        {
                          CFRelease(v166);
                          v33->_safeReadBuffer = 0;
                        }
                        [v43 removeObserver:v33];
                        [(NSLock *)v33->_readBufferLock lock];
                        readBuffer = v33->_readBuffer;
                        if (readBuffer)
                        {
                          CFRelease(readBuffer);
                          v33->_readBuffer = 0;
                        }
                        v168 = v33->_readBufferLock;
                        v169 = v33->_readBufferLock;
                        v33->_readBufferLock = 0;

                        [(NSLock *)v168 unlock];
                        device = v33->_device;
                        v33->_device = 0;

                        if (theData) {
                          CFRelease(theData);
                        }
                        if (v101) {
                          CFRelease(v101);
                        }
                        v33->_int comPort = -1;
                        v171 = v33->_modelIdentifier;
                        v33->_modelIdentifier = 0;

                        v33->_mainSize = 0;
                        int v26 = 2;
LABEL_197:

LABEL_89:
LABEL_90:

                        goto LABEL_91;
                      }
                      v184->_bluetoothChannelIsLost = 0;
                      v184->_BOOL hasBeenUnloaded = 0;
                      CFRunLoopRunResult v127 = CFRunLoopRunInMode(kCFRunLoopDefaultMode, 1.0, 0);
                      CFRunLoopRunResult v128 = v127;
                      if (v184->_bluetoothChannelIsLost || v184->_hasBeenUnloaded || v127 == kCFRunLoopRunStopped)
                      {
                        v147 = +[AXSubsystemBrailleHardware sharedInstance];
                        unsigned __int8 v148 = [v147 ignoreLogging];

                        if (v148) {
                          goto LABEL_172;
                        }
                        v149 = +[AXSubsystemBrailleHardware identifier];
                        v150 = AXLoggerForFacility();

                        os_log_type_t v151 = AXOSLogLevelFromAXLogLevel();
                        mode = v150;
                        if (!os_log_type_enabled(v150, v151)) {
                          goto LABEL_180;
                        }
                        uint64_t v152 = AXColorizeFormatLog();
                        BOOL hasBeenUnloaded = v184->_hasBeenUnloaded;
                        uint64_t v174 = v128;
                        bluetoothChannelIsLost = (NSString *)v184->_bluetoothChannelIsLost;
                        v111 = (void *)v152;
                        uint64_t v176 = _AXStringForArgs();
                        if (os_log_type_enabled(v150, v151))
                        {
                          *(_DWORD *)v195 = 138543362;
                          uint64_t v196 = v176;
                          _os_log_impl(&dword_0, v150, v151, "%{public}@", v195, 0xCu);
                          v110 = (void *)v176;
                          CFDataRef theData = 0;
                          v30 = v186;
                          id v4 = v187;
                          v33 = v184;
                          v29 = v185;
                          v31 = v182;
                          goto LABEL_116;
                        }
                        CFDataRef theData = 0;
                        v30 = v186;
                        id v4 = v187;
                        v33 = v184;
                        v29 = v185;
                        v31 = v182;
                        v43 = v183;
                        v110 = (void *)v176;
                        goto LABEL_186;
                      }
                      [(NSLock *)v184->_readBufferLock lock];
                      CFIndex v129 = CFDataGetLength(v184->_readBuffer);
                      if (v129 >= 1)
                      {
                        CFIndex v130 = v129;
                        v131 = v184->_safeReadBuffer;
                        v132 = CFDataGetBytePtr(v184->_readBuffer);
                        CFDataAppendBytes(v131, v132, v130);
                        v203.location = 0;
                        v203.length = v130;
                        CFDataDeleteBytes(v184->_readBuffer, v203);
                      }
                      [(NSLock *)v184->_readBufferLock unlock];
                      CFIndex v133 = CFDataGetLength(v184->_safeReadBuffer);
                      CFIndex v134 = v133;
                      if (v133 == 1)
                      {
                        v204.location = 0;
                        v204.length = 1;
                        CFDataGetBytes(v184->_safeReadBuffer, v204, &v188);
                      }
                      else if (v133 < 1)
                      {
                        goto LABEL_146;
                      }
                      v205.location = 0;
                      v205.length = v134;
                      CFDataDeleteBytes(v184->_safeReadBuffer, v205);
LABEL_146:
                      if (v124 <= 3)
                      {
                        ++v124;
                        if (!v188) {
                          continue;
                        }
                      }
                      goto LABEL_167;
                    }
                  }
                  v141 = +[AXSubsystemBrailleHardware sharedInstance];
                  unsigned __int8 v142 = [v141 ignoreLogging];

                  if (v142)
                  {
LABEL_171:
                    CFDataRef v101 = 0;
LABEL_172:
                    CFDataRef theData = 0;
                    v30 = v186;
                    id v4 = v187;
                    v33 = v184;
                    v29 = v185;
                    goto LABEL_103;
                  }
                  v143 = +[AXSubsystemBrailleHardware identifier];
                  v144 = AXLoggerForFacility();

                  os_log_type_t v145 = AXOSLogLevelFromAXLogLevel();
                  mode = v144;
                  if (os_log_type_enabled(v144, v145))
                  {
                    uint64_t v177 = AXColorizeFormatLog();
                    uint64_t v175 = _AXStringForArgs();
                    if (!os_log_type_enabled(v144, v145)) {
                      goto LABEL_183;
                    }
                    *(_DWORD *)v195 = 138543362;
                    v146 = (void *)v175;
                    uint64_t v196 = v175;
LABEL_177:
                    _os_log_impl(&dword_0, mode, v145, "%{public}@", v195, 0xCu);
                    v110 = v146;
                    CFDataRef v101 = 0;
                    CFDataRef theData = 0;
                    goto LABEL_178;
                  }
LABEL_179:
                  CFDataRef v101 = 0;
LABEL_180:
                  CFDataRef theData = 0;
LABEL_181:
                  v30 = v186;
                  id v4 = v187;
                  v33 = v184;
                  v29 = v185;
                  goto LABEL_182;
                }
                v135 = +[AXSubsystemBrailleHardware sharedInstance];
                unsigned __int8 v136 = [v135 ignoreLogging];

                if ((v136 & 1) == 0)
                {
                  v137 = +[AXSubsystemBrailleHardware identifier];
                  v138 = AXLoggerForFacility();

                  os_log_type_t v139 = AXOSLogLevelFromAXLogLevel();
                  mode = v138;
                  if (!os_log_type_enabled(v138, v139))
                  {
                    CFDataRef v101 = 0;
                    v180 = 0;
                    CFDataRef theData = 0;
                    goto LABEL_181;
                  }
                  uint64_t v140 = AXColorizeFormatLog();
                  bluetoothChannelIsLost = v184->_modelIdentifier;
                  uint64_t v177 = v140;
                  uint64_t v175 = _AXStringForArgs();
                  if (!os_log_type_enabled(v138, v139))
                  {
                    CFDataRef v101 = 0;
                    v180 = 0;
                    CFDataRef theData = 0;
                    goto LABEL_184;
                  }
                  *(_DWORD *)v195 = 138543362;
                  uint64_t v196 = v175;
                  _os_log_impl(&dword_0, v138, v139, "%{public}@", v195, 0xCu);
                  v110 = (void *)v175;
                  CFDataRef v101 = 0;
                  v180 = 0;
                  CFDataRef theData = 0;
LABEL_178:
                  v30 = v186;
                  id v4 = v187;
                  v33 = v184;
                  v29 = v185;
                  v31 = v182;
LABEL_108:
                  v43 = v183;
                  v111 = (void *)v177;
                  goto LABEL_186;
                }
LABEL_100:
                CFDataRef v101 = 0;
                CFDataRef theData = 0;
LABEL_111:
                v180 = 0;
                id v4 = v187;
LABEL_98:
                v30 = v186;
                v43 = v183;
                goto LABEL_188;
              }
            }
            v93 = +[AXSubsystemBrailleHardware sharedInstance];
            unsigned __int8 v94 = [v93 ignoreLogging];

            v31 = v182;
            if ((v94 & 1) == 0)
            {
              v95 = +[AXSubsystemBrailleHardware identifier];
              v96 = AXLoggerForFacility();

              os_log_type_t v97 = AXOSLogLevelFromAXLogLevel();
              if (os_log_type_enabled(v96, v97))
              {
                v98 = AXColorizeFormatLog();
                bluetoothChannelIsLost = (NSString *)v184->_comPort;
                v99 = _AXStringForArgs();
                if (os_log_type_enabled(v96, v97))
                {
                  *(_DWORD *)v195 = 138543362;
                  uint64_t v196 = (uint64_t)v99;
                  _os_log_impl(&dword_0, v96, v97, "%{public}@", v195, 0xCu);
                }

                v31 = v182;
              }
            }
            v184->_int comPort = -1;
          }
          else
          {
            v53 = +[AXSubsystemBrailleHardware sharedInstance];
            unsigned __int8 v54 = [v53 ignoreLogging];

            v29 = v185;
            if ((v54 & 1) == 0)
            {
              v55 = +[AXSubsystemBrailleHardware identifier];
              v56 = AXLoggerForFacility();

              os_log_type_t v57 = AXOSLogLevelFromAXLogLevel();
              if (os_log_type_enabled(v56, v57))
              {
                v58 = v31;
                v59 = AXColorizeFormatLog();
                v60 = _AXStringForArgs();
                if (os_log_type_enabled(v56, v57))
                {
                  int buf = 138543362;
                  v198 = v60;
                  _os_log_impl(&dword_0, v56, v57, "%{public}@", (uint8_t *)&buf, 0xCu);
                }

                v31 = v58;
              }
            }
          }
          v43 = v183;
          objc_msgSend(v183, "removeObserver:", v184, bluetoothChannelIsLost);
          int v26 = 1;
          v30 = v186;
          id v4 = v187;
          goto LABEL_89;
        }
      }
      else
      {
LABEL_20:
      }
      v44 = +[AXSubsystemBrailleHardware sharedInstance];
      unsigned __int8 v45 = [v44 ignoreLogging];

      id v4 = v187;
      if ((v45 & 1) == 0)
      {
        v48 = +[AXSubsystemBrailleHardware identifier];
        v31 = AXLoggerForFacility();

        int v26 = 1;
        os_log_type_t v49 = AXOSLogLevelFromAXLogLevel();
        v29 = v185;
        if (os_log_type_enabled(v31, v49))
        {
          v43 = AXColorizeFormatLog();
          v50 = _AXStringForArgs();
          if (os_log_type_enabled(v31, v49))
          {
            int buf = 138543362;
            v198 = v50;
            _os_log_impl(&dword_0, v31, v49, "%{public}@", (uint8_t *)&buf, 0xCu);
          }

          v30 = v186;
          goto LABEL_89;
        }
        v30 = v186;
        goto LABEL_90;
      }
      int v26 = 1;
      v29 = v185;
      v30 = v186;
LABEL_91:

      goto LABEL_92;
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
          v198 = v14;
          _os_log_impl(&dword_0, v29, v52, "%{public}@", (uint8_t *)&buf, 0xCu);
        }
        goto LABEL_91;
      }
      goto LABEL_93;
    }
    int v26 = 1;
    goto LABEL_94;
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
        int buf = 138543362;
        v198 = v30;
        _os_log_impl(&dword_0, v12, v28, "%{public}@", (uint8_t *)&buf, 0xCu);
      }
LABEL_92:

LABEL_93:
    }
LABEL_94:

    goto LABEL_95;
  }
  int v26 = 1;
LABEL_95:

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

    self->_int comPort = -1;
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
  return 1;
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
      v16.location = 0;
      v16.length = v5;
      CFDataDeleteBytes(self->_readBuffer, v16);
    }
  }
  [(NSLock *)self->_readBufferLock unlock];
  v8 = SCRDKGSExtractEventsFromBuffer();
  os_log_type_t v9 = v8;
  if (v8 && [v8 count])
  {
    id v10 = [v9 mutableCopy];
    [v10 removeObjectsInArray:&off_87D0];
    v11 = _SCROD_LOG();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412290;
      id v14 = v10;
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "KGS Driver: got input events %@", (uint8_t *)&v13, 0xCu);
    }
  }

  return v9;
}

- (BOOL)setMainCells:(const char *)a3 length:(int64_t)a4
{
  int64_t mainSize = self->_mainSize;
  if (mainSize >= a4) {
    size_t v8 = a4;
  }
  else {
    size_t v8 = self->_mainSize;
  }
  memcpy((char *)&v17 - ((mainSize + 15) & 0xFFFFFFFFFFFFFFF0), a3, v8);
  if (mainSize > a4) {
    bzero((char *)&v17 + a4 - ((mainSize + 15) & 0xFFFFFFFFFFFFFFF0), mainSize - a4);
  }
  SCRDKGSConvertBrailleCellsToKGSOrder();
  CFDataRef v9 = (const __CFData *)SCRDKGSCreateCommandPacket();
  if (!v9) {
    return 0;
  }
  CFDataRef v10 = v9;
  int comPort = self->_comPort;
  if (comPort == -1)
  {
    BOOL v15 = 0;
  }
  else
  {
    BytePtr = CFDataGetBytePtr(v9);
    size_t Length = CFDataGetLength(v10);
    ssize_t v14 = write(comPort, BytePtr, Length);
    BOOL v15 = v14 == CFDataGetLength(v10);
  }
  CFRelease(v10);
  return v15;
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