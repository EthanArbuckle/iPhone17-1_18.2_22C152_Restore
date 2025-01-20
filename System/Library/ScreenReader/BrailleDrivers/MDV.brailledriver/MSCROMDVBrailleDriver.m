@interface MSCROMDVBrailleDriver
- (BOOL)isDriverLoaded;
- (BOOL)isInputEnabled;
- (BOOL)isSleeping;
- (BOOL)postsKeyboardEvents;
- (BOOL)setMainCells:(const char *)a3 length:(int64_t)a4;
- (BOOL)setStatusCells:(const char *)a3 length:(int64_t)a4;
- (BOOL)supportsBlinkingCursor;
- (BOOL)unloadDriver;
- (MSCROMDVBrailleDriver)init;
- (id)getInputEvents;
- (id)modelIdentifier;
- (int)brailleInputMode;
- (int)loadDriverWithIOElement:(id)a3;
- (int64_t)mainSize;
- (int64_t)statusSize;
- (unint64_t)interfaceVersion;
- (void)_flushWriteBuffer;
- (void)dealloc;
- (void)fileReader:(id)a3 data:(const void *)a4 length:(unint64_t)a5;
- (void)removeDeviceNotification:(id)a3;
- (void)setBrailleDriverDelegate:(id)a3;
@end

@implementation MSCROMDVBrailleDriver

- (MSCROMDVBrailleDriver)init
{
  v3.receiver = self;
  v3.super_class = (Class)MSCROMDVBrailleDriver;
  result = [(MSCROMDVBrailleDriver *)&v3 init];
  if (result)
  {
    result->_isDriverLoaded = 0;
    result->_nextWriteTime = -3061152000.0;
    result->_comPort = -1;
  }
  return result;
}

- (void)dealloc
{
  [(MSCROMDVBrailleDriver *)self unloadDriver];
  v3.receiver = self;
  v3.super_class = (Class)MSCROMDVBrailleDriver;
  [(MSCROMDVBrailleDriver *)&v3 dealloc];
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
        v189 = v11;
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
        [(MSCROMDVBrailleDriver *)self unloadDriver];
      }
      v170 = self;
      v172 = [v12 infoDictionary];
      v171 = [v172 objectForKey:kSCROBrailleDriverModels];
      id v173 = v4;
      v14 = [v4 bluetoothAddress];
      long long v181 = 0u;
      long long v182 = 0u;
      long long v183 = 0u;
      long long v184 = 0u;
      v15 = +[BluetoothManager sharedInstance];
      v16 = [v15 pairedDevices];

      id v17 = [v16 countByEnumeratingWithState:&v181 objects:v190 count:16];
      if (!v17)
      {
LABEL_20:

LABEL_36:
        v43 = +[AXSubsystemBrailleHardware sharedInstance];
        unsigned __int8 v44 = [v43 ignoreLogging];

        id v4 = v173;
        if (v44)
        {
          int v26 = 1;
          v30 = v171;
          v29 = v172;
LABEL_118:

LABEL_119:
          goto LABEL_120;
        }
        v47 = +[AXSubsystemBrailleHardware identifier];
        v31 = AXLoggerForFacility();

        int v26 = 1;
        os_log_type_t v48 = AXOSLogLevelFromAXLogLevel();
        v29 = v172;
        if (!os_log_type_enabled(v31, v48))
        {
          v30 = v171;
LABEL_117:

          goto LABEL_118;
        }
        uint64_t v49 = AXColorizeFormatLog();
        v50 = _AXStringForArgs();
        if (os_log_type_enabled(v31, v48))
        {
          *(_DWORD *)buf = 138543362;
          v189 = v50;
          _os_log_impl(&dword_0, v31, v48, "%{public}@", buf, 0xCu);
        }

        v30 = v171;
        v32 = (void *)v49;
LABEL_116:

        goto LABEL_117;
      }
      id v18 = v17;
      uint64_t v19 = *(void *)v182;
LABEL_14:
      uint64_t v20 = 0;
      while (1)
      {
        if (*(void *)v182 != v19) {
          objc_enumerationMutation(v16);
        }
        v21 = *(void **)(*((void *)&v181 + 1) + 8 * v20);
        v22 = [v21 address];
        unsigned __int8 v23 = [v22 isEqualToString:v14];

        if (v23) {
          break;
        }
        if (v18 == (id)++v20)
        {
          id v18 = [v16 countByEnumeratingWithState:&v181 objects:v190 count:16];
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
      v33 = v170;
      [v32 addObserver:v170 selector:"removeDeviceNotification:" name:BluetoothDeviceDisconnectSuccessNotification object:0];
      [v32 addObserver:v170 selector:"removeDeviceNotification:" name:BluetoothDeviceDisconnectFailedNotification object:0];
      if ([v31 connected])
      {
        v164 = v31;
        [v31 device];
        int ComPortForServiceWithSandboxExtension = BTDeviceGetComPortForServiceWithSandboxExtension();
        if (ComPortForServiceWithSandboxExtension)
        {
          int v35 = ComPortForServiceWithSandboxExtension;
          v36 = +[AXSubsystemBrailleHardware sharedInstance];
          unsigned __int8 v37 = [v36 ignoreLogging];

          v29 = v172;
          if ((v37 & 1) == 0)
          {
            v165 = v32;
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
                *(_DWORD *)v186 = 138543362;
                CFRunLoopMode v187 = v42;
                _os_log_impl(&dword_0, v39, v40, "%{public}@", v186, 0xCu);
              }
            }
            v32 = v165;
          }
          objc_msgSend(v32, "removeObserver:", v170, bluetoothChannelIsLost);
          int v26 = 1;
          id v4 = v173;
          v30 = v171;
LABEL_115:
          v31 = v164;
          goto LABEL_116;
        }
        v29 = v172;
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
              v167 = v32;
              v66 = AXColorizeFormatLog();
              bluetoothChannelIsLost = (NSString *)*__error();
              _AXStringForArgs();
              v67 = (__CFString *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v64, v65))
              {
                *(_DWORD *)v186 = 138543362;
                CFRunLoopMode v187 = v67;
                _os_log_impl(&dword_0, v64, v65, "%{public}@", v186, 0xCu);
              }

              v32 = v167;
            }
          }
        }
        int v68 = open((const char *)buf, 131074, bluetoothChannelIsLost);
        v170->_comPort = v68;
        id v4 = v173;
        if ((v68 & 0x80000000) == 0)
        {
          objc_storeStrong((id *)&v170->_device, v21);
          id v69 = [objc_allocWithZone((Class)NSFileHandle) initWithFileDescriptor:v170->_comPort closeOnDealloc:1];
          v70 = (SCRDFileReader *)[objc_allocWithZone((Class)SCRDFileReader) initWithDelegate:v170 fileHandle:v69];
          readerThread = v170->_readerThread;
          v170->_readerThread = v70;

          v72 = (char *)malloc_type_calloc(0x2AuLL, 1uLL, 0x100004077774924uLL);
          v170->_writeBuffer = v72;
          if (!v72)
          {
            v78 = 0;
            type = 0;
            v30 = v171;
            goto LABEL_103;
          }
          v168 = v32;
          CFMutableDataRef Mutable = CFDataCreateMutable(kCFAllocatorDefault, 0);
          v170->_safeReadBuffer = Mutable;
          if (!Mutable
            || (v74 = (NSLock *)[objc_allocWithZone((Class)NSLock) init],
                readBufferLock = v170->_readBufferLock,
                v170->_readBufferLock = v74,
                readBufferLock,
                !v170->_readBufferLock)
            || (CFMutableDataRef v76 = CFDataCreateMutable(kCFAllocatorDefault, 0), (v170->_readBuffer = v76) == 0))
          {
            v78 = 0;
            type = 0;
            v30 = v171;
            goto LABEL_103;
          }
          [(SCRDFileReader *)v170->_readerThread start];
          size_t __nbyte = 0;
          char v179 = 0;
          uint64_t Request = SCRDMDVSerialCreateRequest();
          if (Request)
          {
            v78 = (void *)Request;
            id v157 = v69;
            size_t v178 = 0;
            uint64_t v79 = SCRDMDVSerialCreateRequest();
            if (!v79)
            {
              v121 = +[AXSubsystemBrailleHardware sharedInstance];
              unsigned __int8 v122 = [v121 ignoreLogging];

              if ((v122 & 1) == 0)
              {
                v129 = +[AXSubsystemBrailleHardware identifier];
                v124 = AXLoggerForFacility();

                os_log_type_t v130 = AXOSLogLevelFromAXLogLevel();
                if (os_log_type_enabled(v124, v130))
                {
                  v162 = AXColorizeFormatLog();
                  _AXStringForArgs();
                  CFRunLoopMode mode = (CFRunLoopMode)objc_claimAutoreleasedReturnValue();
                  if (!os_log_type_enabled(v124, v130))
                  {
                    type = 0;
                    id v4 = v173;
                    v30 = v171;
                    goto LABEL_171;
                  }
                  *(_DWORD *)v186 = 138543362;
                  CFRunLoopMode v187 = mode;
                  _os_log_impl(&dword_0, v124, v130, "%{public}@", v186, 0xCu);
                  v126 = (__CFString *)mode;
                  type = 0;
                  id v4 = v173;
                  v30 = v171;
LABEL_153:
                  id v69 = v157;
                  goto LABEL_173;
                }
                type = 0;
                id v4 = v173;
                v30 = v171;
                goto LABEL_168;
              }
              type = 0;
LABEL_141:
              id v4 = v173;
              v30 = v171;
LABEL_142:
              v32 = v168;
              id v69 = v157;
              goto LABEL_103;
            }
            type = (void *)v79;
            unsigned int v80 = 0;
            UInt8 v81 = 0;
            unsigned int v82 = 0;
            v158 = v78;
            while (1)
            {
              unint64_t v83 = write(v33->_comPort, v78, __nbyte);
              if (v83 < __nbyte) {
                break;
              }
              unint64_t v84 = write(v33->_comPort, type, v178);
              if (v84 < v178)
              {
                v137 = +[AXSubsystemBrailleHardware sharedInstance];
                unsigned __int8 v138 = [v137 ignoreLogging];

                if (v138) {
                  goto LABEL_141;
                }
                v144 = +[AXSubsystemBrailleHardware identifier];
                v145 = AXLoggerForFacility();

                os_log_type_t v135 = AXOSLogLevelFromAXLogLevel();
                v124 = v145;
                if (!os_log_type_enabled(v145, v135)) {
                  goto LABEL_167;
                }
                v162 = AXColorizeFormatLog();
                _AXStringForArgs();
                CFRunLoopMode mode = (CFRunLoopMode)objc_claimAutoreleasedReturnValue();
                if (!os_log_type_enabled(v145, v135)) {
                  goto LABEL_170;
                }
                *(_DWORD *)v186 = 138543362;
                CFRunLoopMode v136 = mode;
                CFRunLoopMode v187 = mode;
LABEL_151:
                _os_log_impl(&dword_0, v124, v135, "%{public}@", v186, 0xCu);
                v126 = (__CFString *)v136;
LABEL_152:
                v29 = v172;
                id v4 = v173;
                v33 = v170;
                v30 = v171;
                goto LABEL_153;
              }
              *(_WORD *)&v33->_bluetoothChannelIsLost = 0;
              CFRunLoopRunResult v85 = CFRunLoopRunInMode(kCFRunLoopDefaultMode, 0.2, 0);
              CFRunLoopRunResult v86 = v85;
              if (v33->_bluetoothChannelIsLost || v33->_hasBeenUnloaded || v85 == kCFRunLoopRunStopped)
              {
                v127 = +[AXSubsystemBrailleHardware sharedInstance];
                unsigned __int8 v128 = [v127 ignoreLogging];

                if (v128)
                {
                  id v4 = v173;
                  v30 = v171;
                  v32 = v168;
                  id v69 = v157;
                  v78 = v158;
                  goto LABEL_103;
                }
                v139 = +[AXSubsystemBrailleHardware identifier];
                v140 = AXLoggerForFacility();

                os_log_type_t v141 = AXOSLogLevelFromAXLogLevel();
                CFRunLoopMode modea = (CFRunLoopMode)v140;
                if (os_log_type_enabled(v140, v141))
                {
                  uint64_t v142 = AXColorizeFormatLog();
                  BOOL hasBeenUnloaded = v33->_hasBeenUnloaded;
                  uint64_t v156 = v86;
                  bluetoothChannelIsLost = (NSString *)v33->_bluetoothChannelIsLost;
                  v162 = (void *)v142;
                  _AXStringForArgs();
                  v126 = (__CFString *)objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v140, v141))
                  {
                    *(_DWORD *)v186 = 138543362;
                    CFRunLoopMode v187 = v126;
                    os_log_type_t v143 = v141;
                    v124 = v140;
                    _os_log_impl(&dword_0, v140, v143, "%{public}@", v186, 0xCu);
                    v29 = v172;
                    id v4 = v173;
                    v33 = v170;
                    v30 = v171;
                    id v69 = v157;
                    v78 = v158;
                  }
                  else
                  {
                    v29 = v172;
                    id v4 = v173;
                    v33 = v170;
                    v30 = v171;
                    id v69 = v157;
                    v78 = v158;
                    v124 = modea;
                  }
                  goto LABEL_173;
                }
                v29 = v172;
                id v4 = v173;
                v30 = v171;
                v32 = v168;
                id v69 = v157;
                v78 = v158;
                v124 = modea;
                goto LABEL_174;
              }
              unsigned int v161 = v80;
              [(NSLock *)v33->_readBufferLock lock];
              CFIndex Length = CFDataGetLength(v33->_readBuffer);
              if (Length >= 1)
              {
                CFIndex v88 = Length;
                safeReadBuffer = v33->_safeReadBuffer;
                BytePtr = CFDataGetBytePtr(v33->_readBuffer);
                CFDataAppendBytes(safeReadBuffer, BytePtr, v88);
                v191.location = 0;
                v191.length = v88;
                CFDataDeleteBytes(v33->_readBuffer, v191);
              }
              [(NSLock *)v33->_readBufferLock unlock];
              v91 = SCRDMDVSerialCreatePacketsFromBuffer();
              long long v174 = 0u;
              long long v175 = 0u;
              long long v176 = 0u;
              long long v177 = 0u;
              id v92 = [v91 countByEnumeratingWithState:&v174 objects:v185 count:16];
              if (v92)
              {
                id v93 = v92;
                char v94 = 0;
                uint64_t v95 = *(void *)v175;
                do
                {
                  for (i = 0; i != v93; i = (char *)i + 1)
                  {
                    if (*(void *)v175 != v95) {
                      objc_enumerationMutation(v91);
                    }
                    v97 = CFDataGetBytePtr(*(CFDataRef *)(*((void *)&v174 + 1) + 8 * i));
                    if (v97[2] == 37 && v97[3] == 6)
                    {
                      UInt8 v81 = v97[5];
                      unsigned int v82 = v97[9];
                      char v94 = 1;
                    }
                  }
                  id v93 = [v91 countByEnumeratingWithState:&v174 objects:v185 count:16];
                }
                while (v93);
              }
              else
              {
                char v94 = 0;
              }

              v29 = v172;
              v33 = v170;
              v78 = v158;
              if ((v94 & 1) == 0)
              {
                unsigned int v80 = v161 + 1;
                if (v161 < 6) {
                  continue;
                }
              }
              free(v158);
              free(type);
              v170->_mainSize = v81;
              if (v81 == 24)
              {
                uint64_t v99 = 0;
                long long v100 = xmmword_70B0;
                CFStringRef v98 = @"com.apple.scrod.braille.driver.mdv.mb248.24";
                uint64_t v101 = 2;
LABEL_157:
                v33 = v170;
                v170->_statusSize = v99;
                v170->_deviceID = v101;
                *(_OWORD *)&v170->_writeBufferSize = v100;
              }
              else
              {
                CFStringRef v98 = 0;
                if (v81 == 40)
                {
                  uint64_t v99 = 2 * (v82 < 7);
                  long long v100 = xmmword_70C0;
                  CFStringRef v98 = @"com.apple.scrod.braille.driver.mdv.mb408l.40";
                  uint64_t v101 = 1;
                  goto LABEL_157;
                }
              }
              modelIdentifier = v33->_modelIdentifier;
              v33->_modelIdentifier = &v98->isa;

              uint64_t v147 = [v171 objectForKey:v33->_modelIdentifier];
              if (v147)
              {
                v112 = (NSLock *)v147;
                int v26 = 0;
                v33->_isDriverLoaded = 1;
                v29 = v172;
                id v4 = v173;
                v30 = v171;
                v32 = v168;
                id v69 = v157;
                goto LABEL_114;
              }
              v148 = +[AXSubsystemBrailleHardware sharedInstance];
              unsigned __int8 v149 = [v148 ignoreLogging];

              if (v149)
              {
                v78 = 0;
                type = 0;
                v29 = v172;
                id v4 = v173;
                v33 = v170;
                v30 = v171;
                goto LABEL_142;
              }
              v150 = +[AXSubsystemBrailleHardware identifier];
              v151 = AXLoggerForFacility();

              os_log_type_t v152 = AXOSLogLevelFromAXLogLevel();
              v124 = v151;
              if (os_log_type_enabled(v151, v152))
              {
                uint64_t v153 = AXColorizeFormatLog();
                bluetoothChannelIsLost = v170->_modelIdentifier;
                v162 = (void *)v153;
                _AXStringForArgs();
                CFRunLoopMode mode = (CFRunLoopMode)objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v151, v152))
                {
                  *(_DWORD *)v186 = 138543362;
                  CFRunLoopMode v187 = mode;
                  _os_log_impl(&dword_0, v151, v152, "%{public}@", v186, 0xCu);
                  v126 = (__CFString *)mode;
                  v78 = 0;
                  type = 0;
                  goto LABEL_152;
                }
                v78 = 0;
                type = 0;
LABEL_170:
                v29 = v172;
                id v4 = v173;
                v33 = v170;
                v30 = v171;
LABEL_171:
                id v69 = v157;
LABEL_172:
                v126 = (__CFString *)mode;
                goto LABEL_173;
              }
              v78 = 0;
              type = 0;
LABEL_167:
              v29 = v172;
              id v4 = v173;
              v33 = v170;
              v30 = v171;
LABEL_168:
              v32 = v168;
              id v69 = v157;
LABEL_174:

              goto LABEL_103;
            }
            v131 = +[AXSubsystemBrailleHardware sharedInstance];
            unsigned __int8 v132 = [v131 ignoreLogging];

            if (v132) {
              goto LABEL_141;
            }
            v133 = +[AXSubsystemBrailleHardware identifier];
            v134 = AXLoggerForFacility();

            os_log_type_t v135 = AXOSLogLevelFromAXLogLevel();
            v124 = v134;
            if (!os_log_type_enabled(v134, v135)) {
              goto LABEL_167;
            }
            v162 = AXColorizeFormatLog();
            _AXStringForArgs();
            CFRunLoopMode mode = (CFRunLoopMode)objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v134, v135)) {
              goto LABEL_170;
            }
            *(_DWORD *)v186 = 138543362;
            CFRunLoopMode v136 = mode;
            CFRunLoopMode v187 = mode;
            goto LABEL_151;
          }
          id v118 = v69;
          v119 = +[AXSubsystemBrailleHardware sharedInstance];
          unsigned __int8 v120 = [v119 ignoreLogging];

          if ((v120 & 1) == 0)
          {
            v123 = +[AXSubsystemBrailleHardware identifier];
            v124 = AXLoggerForFacility();

            os_log_type_t v125 = AXOSLogLevelFromAXLogLevel();
            if (os_log_type_enabled(v124, v125))
            {
              v162 = AXColorizeFormatLog();
              _AXStringForArgs();
              CFRunLoopMode mode = (CFRunLoopMode)objc_claimAutoreleasedReturnValue();
              if (!os_log_type_enabled(v124, v125))
              {
                type = 0;
                id v4 = v173;
                v30 = v171;
                id v69 = v118;
                v78 = 0;
                goto LABEL_172;
              }
              *(_DWORD *)v186 = 138543362;
              CFRunLoopMode v187 = mode;
              _os_log_impl(&dword_0, v124, v125, "%{public}@", v186, 0xCu);
              v126 = (__CFString *)mode;
              type = 0;
              id v4 = v173;
              v30 = v171;
              id v69 = v118;
              v78 = 0;
LABEL_173:

              v32 = v168;
            }
            else
            {
              type = 0;
              id v4 = v173;
              v30 = v171;
              v32 = v168;
              id v69 = v118;
              v78 = 0;
            }
            goto LABEL_174;
          }
          type = 0;
          id v4 = v173;
          v30 = v171;
          id v69 = v118;
          v78 = 0;
LABEL_103:
          [(SCRDFileReader *)v33->_readerThread invalidate];
          v109 = v33->_readerThread;
          v33->_readerThread = 0;

          v110 = v33->_safeReadBuffer;
          if (v110)
          {
            CFRelease(v110);
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
          v112 = v33->_readBufferLock;
          v113 = v33->_readBufferLock;
          v33->_readBufferLock = 0;

          [(NSLock *)v112 unlock];
          device = v33->_device;
          v33->_device = 0;

          v33->_comPort = -1;
          if (type) {
            free(type);
          }
          if (v78) {
            free(v78);
          }
          writeBuffer = v33->_writeBuffer;
          if (writeBuffer)
          {
            free(writeBuffer);
            v33->_writeBuffer = 0;
          }
          v116 = v33->_modelIdentifier;
          v33->_modelIdentifier = 0;

          int v26 = 2;
LABEL_114:

          goto LABEL_115;
        }
        v102 = +[AXSubsystemBrailleHardware sharedInstance];
        unsigned __int8 v103 = [v102 ignoreLogging];

        v31 = v164;
        if ((v103 & 1) == 0)
        {
          v169 = v32;
          v104 = +[AXSubsystemBrailleHardware identifier];
          v105 = AXLoggerForFacility();

          os_log_type_t v106 = AXOSLogLevelFromAXLogLevel();
          if (os_log_type_enabled(v105, v106))
          {
            v107 = AXColorizeFormatLog();
            bluetoothChannelIsLost = (NSString *)v170->_comPort;
            _AXStringForArgs();
            v108 = (__CFString *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v105, v106))
            {
              *(_DWORD *)v186 = 138543362;
              CFRunLoopMode v187 = v108;
              _os_log_impl(&dword_0, v105, v106, "%{public}@", v186, 0xCu);
            }

            v31 = v164;
          }

          v32 = v169;
        }
        v170->_comPort = -1;
      }
      else
      {
        v53 = +[AXSubsystemBrailleHardware sharedInstance];
        unsigned __int8 v54 = [v53 ignoreLogging];

        v29 = v172;
        if ((v54 & 1) == 0)
        {
          v166 = v32;
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
              *(_DWORD *)buf = 138543362;
              v189 = v60;
              _os_log_impl(&dword_0, v56, v57, "%{public}@", buf, 0xCu);
            }

            v31 = v58;
          }

          v32 = v166;
        }
      }
      objc_msgSend(v32, "removeObserver:", v170, bluetoothChannelIsLost);
      int v26 = 1;
      id v4 = v173;
      v30 = v171;
      goto LABEL_116;
    }
    v45 = +[AXSubsystemBrailleHardware sharedInstance];
    unsigned __int8 v46 = [v45 ignoreLogging];

    if ((v46 & 1) == 0)
    {
      v51 = +[AXSubsystemBrailleHardware identifier];
      v29 = AXLoggerForFacility();

      int v26 = 1;
      os_log_type_t v52 = AXOSLogLevelFromAXLogLevel();
      if (!os_log_type_enabled(v29, v52))
      {
LABEL_120:

        goto LABEL_121;
      }
      v30 = AXColorizeFormatLog();
      v14 = _AXStringForArgs();
      if (os_log_type_enabled(v29, v52))
      {
        *(_DWORD *)buf = 138543362;
        v189 = v14;
        _os_log_impl(&dword_0, v29, v52, "%{public}@", buf, 0xCu);
      }
      goto LABEL_118;
    }
    int v26 = 1;
LABEL_121:

    goto LABEL_122;
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
        v189 = v30;
        _os_log_impl(&dword_0, v12, v28, "%{public}@", buf, 0xCu);
      }
      goto LABEL_119;
    }
    goto LABEL_121;
  }
  int v26 = 1;
LABEL_122:

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
        int v21 = 138543362;
        v22 = v9;
        _os_log_impl(&dword_0, v6, v7, "%{public}@", (uint8_t *)&v21, 0xCu);
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
    queuedMainCellsBuffer = self->_queuedMainCellsBuffer;
    if (queuedMainCellsBuffer)
    {
      CFRelease(queuedMainCellsBuffer);
      self->_queuedMainCellsBuffer = 0;
    }
    writeBuffer = self->_writeBuffer;
    if (writeBuffer)
    {
      free(writeBuffer);
      self->_writeBuffer = 0;
    }
    self->_writeBufferNeedsFlush = 0;
    self->_nextWriteTime = -3061152000.0;
    modelIdentifier = self->_modelIdentifier;
    self->_modelIdentifier = 0;

    self->_mainSize = 0;
    self->_statusSize = 0;
    self->_isShiftKeyDown = 0;
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
  return 0;
}

- (int)brailleInputMode
{
  return 2 * (self->_deviceID == 2);
}

- (int64_t)mainSize
{
  return self->_mainSize;
}

- (int64_t)statusSize
{
  return self->_statusSize;
}

- (id)getInputEvents
{
  [(MSCROMDVBrailleDriver *)self _flushWriteBuffer];
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
  int64_t deviceID = self->_deviceID;

  return (id)_SCRDMDVSerialExtractEventsFromBuffer(v8, &self->_isShiftKeyDown, deviceID);
}

- (BOOL)setMainCells:(const char *)a3 length:(int64_t)a4
{
  if (a4 >= 1)
  {
    os_log_type_t v7 = &self->_writeBuffer[self->_writeBufferStatusCellOffset];
    int64_t v8 = a4;
    do
    {
      ++a3;
      *v7++ = SCRDMDVConvertStandardCellToMDVCell();
      --v8;
    }
    while (v8);
  }
  int64_t mainSize = self->_mainSize;
  if (mainSize > a4) {
    bzero(&self->_writeBuffer[a4 + self->_writeBufferStatusCellOffset], mainSize - a4);
  }
  self->_writeBufferNeedsFlush = 1;
  [(MSCROMDVBrailleDriver *)self _flushWriteBuffer];
  return 1;
}

- (BOOL)setStatusCells:(const char *)a3 length:(int64_t)a4
{
  if (a4 >= 1)
  {
    for (uint64_t i = 0; i != a4; ++i)
      self->_writeBuffer[i] = SCRDMDVConvertStandardCellToMDVCell();
  }
  int64_t statusSize = self->_statusSize;
  if (statusSize > a4) {
    bzero(&self->_writeBuffer[a4], statusSize - a4);
  }
  self->_writeBufferNeedsFlush = 1;
  [(MSCROMDVBrailleDriver *)self _flushWriteBuffer];
  return 1;
}

- (void)_flushWriteBuffer
{
  if (self->_writeBufferNeedsFlush)
  {
    double nextWriteTime = self->_nextWriteTime;
    if (nextWriteTime < CFAbsoluteTimeGetCurrent())
    {
      uint64_t Request = SCRDMDVSerialCreateRequest();
      if (Request)
      {
        CFIndex v5 = (void *)Request;
        int comPort = self->_comPort;
        if (comPort != -1 && !write(comPort, v5, 0)) {
          self->_writeBufferNeedsFlush = 0;
        }
        self->_double nextWriteTime = CFAbsoluteTimeGetCurrent() + 0.005;
        free(v5);
      }
    }
  }
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