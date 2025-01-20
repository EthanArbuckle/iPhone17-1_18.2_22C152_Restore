@interface MSCROAlva6SeriesBrailleDriver
- (BOOL)isDriverLoaded;
- (BOOL)isInputEnabled;
- (BOOL)isSleeping;
- (BOOL)postsKeyboardEvents;
- (BOOL)setMainCells:(const char *)a3 length:(int64_t)a4;
- (BOOL)setStatusCells:(const char *)a3 length:(int64_t)a4;
- (BOOL)supportsBlinkingCursor;
- (BOOL)unloadDriver;
- (MSCROAlva6SeriesBrailleDriver)init;
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

@implementation MSCROAlva6SeriesBrailleDriver

- (MSCROAlva6SeriesBrailleDriver)init
{
  v3.receiver = self;
  v3.super_class = (Class)MSCROAlva6SeriesBrailleDriver;
  result = [(MSCROAlva6SeriesBrailleDriver *)&v3 init];
  if (result)
  {
    result->_isDriverLoaded = 0;
    result->_comPort = -1;
  }
  return result;
}

- (void)dealloc
{
  [(MSCROAlva6SeriesBrailleDriver *)self unloadDriver];
  v3.receiver = self;
  v3.super_class = (Class)MSCROAlva6SeriesBrailleDriver;
  [(MSCROAlva6SeriesBrailleDriver *)&v3 dealloc];
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
        v217 = v11;
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
        [(MSCROAlva6SeriesBrailleDriver *)self unloadDriver];
      }
      v200 = v12;
      v199 = [v12 infoDictionary];
      uint64_t v201 = [v199 objectForKey:kSCROBrailleDriverModels];
      v14 = [v4 bluetoothAddress];
      long long v210 = 0u;
      long long v211 = 0u;
      long long v212 = 0u;
      long long v213 = 0u;
      v15 = +[BluetoothManager sharedInstance];
      v16 = [v15 pairedDevices];

      id v17 = [v16 countByEnumeratingWithState:&v210 objects:v218 count:16];
      if (v17)
      {
        id v18 = v17;
        uint64_t v19 = *(void *)v211;
LABEL_14:
        uint64_t v20 = 0;
        while (1)
        {
          if (*(void *)v211 != v19) {
            objc_enumerationMutation(v16);
          }
          v21 = *(void **)(*((void *)&v210 + 1) + 8 * v20);
          v22 = [v21 address];
          unsigned __int8 v23 = [v22 isEqualToString:v14];

          if (v23) {
            break;
          }
          if (v18 == (id)++v20)
          {
            id v18 = [v16 countByEnumeratingWithState:&v210 objects:v218 count:16];
            if (!v18) {
              goto LABEL_20;
            }
            goto LABEL_14;
          }
        }
        v31 = v21;

        if (v31)
        {
          v32 = v31;
          v33 = +[NSNotificationCenter defaultCenter];
          [v33 addObserver:self selector:"removeDeviceNotification:" name:BluetoothDeviceDisconnectSuccessNotification object:0];
          v198 = v33;
          [v33 addObserver:self selector:"removeDeviceNotification:" name:BluetoothDeviceDisconnectFailedNotification object:0];
          if (([v32 connected] & 1) == 0)
          {
            v54 = +[AXSubsystemBrailleHardware sharedInstance];
            unsigned __int8 v55 = [v54 ignoreLogging];

            v30 = (void *)v201;
            if ((v55 & 1) == 0)
            {
              v38 = v32;
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
                  v217 = v59;
                  _os_log_impl(&dword_0, v40, v57, "%{public}@", buf, 0xCu);
                }
              }
              goto LABEL_50;
            }
LABEL_51:
            v50 = v198;
            objc_msgSend(v198, "removeObserver:", self, comPort);
            int v26 = 1;
            goto LABEL_52;
          }
          [v32 device];
          int ComPortForServiceWithSandboxExtension = BTDeviceGetComPortForServiceWithSandboxExtension();
          if (ComPortForServiceWithSandboxExtension)
          {
            int v35 = ComPortForServiceWithSandboxExtension;
            v36 = +[AXSubsystemBrailleHardware sharedInstance];
            unsigned __int8 v37 = [v36 ignoreLogging];

            v30 = (void *)v201;
            if ((v37 & 1) == 0)
            {
              v38 = v32;
              v39 = +[AXSubsystemBrailleHardware identifier];
              v40 = AXLoggerForFacility();

              os_log_type_t v41 = AXOSLogLevelFromAXLogLevel();
              if (os_log_type_enabled(v40, v41))
              {
                v42 = AXColorizeFormatLog();
                comPort = (NSString *)v35;
                v43 = _AXStringForArgs();
                if (os_log_type_enabled(v40, v41))
                {
                  *(_DWORD *)v214 = 138543362;
                  v215 = v43;
                  _os_log_impl(&dword_0, v40, v41, "%{public}@", v214, 0xCu);
                }
              }
LABEL_50:

              v32 = v38;
              goto LABEL_51;
            }
            goto LABEL_51;
          }
          v30 = (void *)v201;
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
                v66 = v32;
                v67 = AXColorizeFormatLog();
                comPort = (NSString *)*__error();
                v68 = _AXStringForArgs();
                if (os_log_type_enabled(v64, v65))
                {
                  *(_DWORD *)v214 = 138543362;
                  v215 = v68;
                  _os_log_impl(&dword_0, v64, v65, "%{public}@", v214, 0xCu);
                }

                v32 = v66;
              }
            }
          }
          int v69 = open((const char *)buf, 131074, comPort);
          self->_comPort = v69;
          if (v69 < 0)
          {
            v133 = +[AXSubsystemBrailleHardware sharedInstance];
            unsigned __int8 v134 = [v133 ignoreLogging];

            if ((v134 & 1) == 0)
            {
              v135 = v32;
              v136 = +[AXSubsystemBrailleHardware identifier];
              v137 = AXLoggerForFacility();

              os_log_type_t v138 = AXOSLogLevelFromAXLogLevel();
              if (os_log_type_enabled(v137, v138))
              {
                v139 = AXColorizeFormatLog();
                comPort = (NSString *)self->_comPort;
                v140 = _AXStringForArgs();
                if (os_log_type_enabled(v137, v138))
                {
                  *(_DWORD *)v214 = 138543362;
                  v215 = v140;
                  _os_log_impl(&dword_0, v137, v138, "%{public}@", v214, 0xCu);
                }
              }
              v32 = v135;
            }
            self->_comPort = -1;
            goto LABEL_51;
          }
          objc_storeStrong((id *)&self->_device, v21);
          id v194 = [objc_allocWithZone((Class)NSFileHandle) initWithFileDescriptor:self->_comPort closeOnDealloc:1];
          v70 = (SCRDFileReader *)[objc_allocWithZone((Class)SCRDFileReader) initWithDelegate:self fileHandle:v194];
          readerThread = self->_readerThread;
          self->_readerThread = v70;

          Mutable = CFDataCreateMutable(kCFAllocatorDefault, 0);
          self->_safeReadBuffer = Mutable;
          if (!Mutable) {
            goto LABEL_171;
          }
          v73 = (NSLock *)[objc_allocWithZone((Class)NSLock) init];
          readBufferLock = self->_readBufferLock;
          self->_readBufferLock = v73;

          if (!self->_readBufferLock) {
            goto LABEL_171;
          }
          v75 = CFDataCreateMutable(kCFAllocatorDefault, 0);
          self->_readBuffer = v75;
          if (!v75) {
            goto LABEL_171;
          }
          [(SCRDFileReader *)self->_readerThread start];
          LOBYTE(v76) = 0;
          char v77 = 0;
          int v78 = 0;
          v192 = v32;
          while (1)
          {
            modelIdentifier = self->_modelIdentifier;
            if (modelIdentifier || (v76 & 1) != 0 || (v77 & 1) != 0) {
              goto LABEL_133;
            }
            char v209 = 63;
            __int16 __buf = 16155;
            if ((unint64_t)write(self->_comPort, &__buf, 3uLL) <= 2)
            {
              v148 = +[AXSubsystemBrailleHardware sharedInstance];
              unsigned __int8 v149 = [v148 ignoreLogging];

              if (v149) {
                goto LABEL_171;
              }
              v150 = v32;
              v151 = +[AXSubsystemBrailleHardware identifier];
              v152 = AXLoggerForFacility();

              os_log_type_t v153 = AXOSLogLevelFromAXLogLevel();
              if (os_log_type_enabled(v152, v153))
              {
                v154 = AXColorizeFormatLog();
                v155 = _AXStringForArgs();
                if (os_log_type_enabled(v152, v153))
                {
                  *(_DWORD *)v214 = 138543362;
                  v215 = v155;
                  goto LABEL_167;
                }
                goto LABEL_168;
              }
              goto LABEL_169;
            }
            char v207 = 63;
            __int16 v206 = 17691;
            if ((unint64_t)write(self->_comPort, &v206, 3uLL) <= 2) {
              break;
            }
            char v205 = 1;
            __int16 v204 = 29211;
            if ((unint64_t)write(self->_comPort, &v204, 3uLL) <= 2)
            {
              v159 = +[AXSubsystemBrailleHardware sharedInstance];
              unsigned __int8 v160 = [v159 ignoreLogging];

              if (v160) {
                goto LABEL_171;
              }
              v150 = v32;
              v161 = +[AXSubsystemBrailleHardware identifier];
              v152 = AXLoggerForFacility();

              os_log_type_t v153 = AXOSLogLevelFromAXLogLevel();
              if (os_log_type_enabled(v152, v153))
              {
                v154 = AXColorizeFormatLog();
                v155 = _AXStringForArgs();
                if (os_log_type_enabled(v152, v153))
                {
                  *(_DWORD *)v214 = 138543362;
                  v215 = v155;
LABEL_167:
                  _os_log_impl(&dword_0, v152, v153, "%{public}@", v214, 0xCu);
                }
                goto LABEL_168;
              }
              goto LABEL_169;
            }
            char v203 = 63;
            __int16 v202 = 19995;
            if ((unint64_t)write(self->_comPort, &v202, 3uLL) <= 2)
            {
              v173 = +[AXSubsystemBrailleHardware sharedInstance];
              unsigned __int8 v174 = [v173 ignoreLogging];

              if (v174) {
                goto LABEL_190;
              }
              v175 = +[AXSubsystemBrailleHardware identifier];
              v144 = AXLoggerForFacility();

              os_log_type_t v176 = AXOSLogLevelFromAXLogLevel();
              if (os_log_type_enabled(v144, v176))
              {
                v146 = AXColorizeFormatLog();
                v147 = _AXStringForArgs();
                if (os_log_type_enabled(v144, v176))
                {
                  *(_DWORD *)v214 = 138543362;
                  v215 = v147;
                  _os_log_impl(&dword_0, v144, v176, "%{public}@", v214, 0xCu);
                }
                v30 = (void *)v201;
LABEL_183:
              }
LABEL_184:

              goto LABEL_190;
            }
            self->_bluetoothChannelIsLost = 0;
            self->_int64_t hasBeenUnloaded = 0;
            CFRunLoopRunResult v80 = CFRunLoopRunInMode(kCFRunLoopDefaultMode, 0.5, 0);
            CFRunLoopRunResult v81 = v80;
            if (self->_bluetoothChannelIsLost || self->_hasBeenUnloaded || v80 == kCFRunLoopRunStopped)
            {
              v141 = +[AXSubsystemBrailleHardware sharedInstance];
              unsigned __int8 v142 = [v141 ignoreLogging];

              if (v142) {
                goto LABEL_190;
              }
              v143 = +[AXSubsystemBrailleHardware identifier];
              v144 = AXLoggerForFacility();

              os_log_type_t v145 = AXOSLogLevelFromAXLogLevel();
              if (os_log_type_enabled(v144, v145))
              {
                v146 = AXColorizeFormatLog();
                int64_t hasBeenUnloaded = self->_hasBeenUnloaded;
                uint64_t v191 = v81;
                comPort = (NSString *)self->_bluetoothChannelIsLost;
                v147 = _AXStringForArgs();
                if (os_log_type_enabled(v144, v145))
                {
                  *(_DWORD *)v214 = 138543362;
                  v215 = v147;
                  _os_log_impl(&dword_0, v144, v145, "%{public}@", v214, 0xCu);
                }
                goto LABEL_183;
              }
              goto LABEL_184;
            }
            int v193 = v78;
            [(NSLock *)self->_readBufferLock lock];
            CFIndex Length = CFDataGetLength(self->_readBuffer);
            if (Length >= 1)
            {
              CFIndex v83 = Length;
              safeReadBuffer = self->_safeReadBuffer;
              BytePtr = CFDataGetBytePtr(self->_readBuffer);
              CFDataAppendBytes(safeReadBuffer, BytePtr, v83);
              v219.location = 0;
              v219.length = v83;
              CFDataDeleteBytes(self->_readBuffer, v219);
            }
            [(NSLock *)self->_readBufferLock unlock];
            SCRDAdvanceBufferToPacketStart();
            CFIndex v86 = CFDataGetLength(self->_safeReadBuffer);
            if (v86 >= 3)
            {
              unint64_t v87 = v86;
              uint64_t v76 = 0;
              char v196 = 0;
              while (1)
              {
                v88 = CFDataGetBytePtr(self->_safeReadBuffer);
                v89 = v88;
                unsigned int v90 = v88[1];
                if (v90 <= 0x4A) {
                  break;
                }
                if (v90 == 75)
                {
                  if (v87 < 4)
                  {
                    char v99 = 0;
                    goto LABEL_127;
                  }
                  if (v88[2] == 1 && (unint64_t)write(self->_comPort, &v206, 3uLL) < 3) {
                    goto LABEL_190;
                  }
                  v119 = self->_safeReadBuffer;
                  v120.location = 0;
                  v120.length = 4;
                  goto LABEL_125;
                }
                if (v90 != 78) {
                  goto LABEL_118;
                }
                if (v87 >= 0xE)
                {
                  self->_hasFeaturePack = (*((_DWORD *)v88 + 2) | *((unsigned __int16 *)v88 + 6)) != 0;
                  v221.location = 0;
                  v221.length = 14;
                  CFDataDeleteBytes(self->_safeReadBuffer, v221);
                  v100 = +[AXSubsystemBrailleHardware sharedInstance];
                  unsigned __int8 v101 = [v100 ignoreLogging];

                  if ((v101 & 1) == 0)
                  {
                    v102 = +[AXSubsystemBrailleHardware identifier];
                    v103 = AXLoggerForFacility();

                    os_log_type_t v104 = AXOSLogLevelFromAXLogLevel();
                    if (os_log_type_enabled(v103, v104))
                    {
                      uint64_t v105 = v76;
                      v106 = AXColorizeFormatLog();
                      comPort = (NSString *)self->_hasFeaturePack;
                      v107 = _AXStringForArgs();
                      if (os_log_type_enabled(v103, v104))
                      {
                        *(_DWORD *)v214 = 138543362;
                        v215 = v107;
                        _os_log_impl(&dword_0, v103, v104, "%{public}@", v214, 0xCu);
                      }

                      uint64_t v76 = v105;
                    }
                  }
                  char v99 = 1;
                  char v196 = 1;
                  goto LABEL_127;
                }
LABEL_126:
                char v99 = 1;
LABEL_127:
                SCRDAdvanceBufferToPacketStart();
                CFIndex v122 = CFDataGetLength(self->_safeReadBuffer);
                if (v122 >= 3)
                {
                  unint64_t v87 = v122;
                  if (v99) {
                    continue;
                  }
                }
                goto LABEL_131;
              }
              if (v90 != 63)
              {
                if (v90 == 69)
                {
                  unsigned __int8 v91 = v88[2];
                  self->_availableCells = v91;
                  self->_splitPointOffset = LOBYTE(self->_mainSize) - v91;
                  v220.location = 0;
                  v220.length = 3;
                  CFDataDeleteBytes(self->_safeReadBuffer, v220);
                  v92 = +[AXSubsystemBrailleHardware sharedInstance];
                  unsigned __int8 v93 = [v92 ignoreLogging];

                  if ((v93 & 1) == 0)
                  {
                    v94 = +[AXSubsystemBrailleHardware identifier];
                    v95 = AXLoggerForFacility();

                    os_log_type_t v96 = AXOSLogLevelFromAXLogLevel();
                    if (os_log_type_enabled(v95, v96))
                    {
                      v97 = AXColorizeFormatLog();
                      comPort = (NSString *)v89[2];
                      v98 = _AXStringForArgs();
                      if (os_log_type_enabled(v95, v96))
                      {
                        *(_DWORD *)v214 = 138543362;
                        v215 = v98;
                        _os_log_impl(&dword_0, v95, v96, "%{public}@", v214, 0xCu);
                      }
                    }
                  }
                  char v99 = 1;
                  uint64_t v76 = 1;
                  goto LABEL_127;
                }
LABEL_118:
                char v99 = 1;
                v222.location = 0;
                v222.length = 1;
                CFDataDeleteBytes(self->_safeReadBuffer, v222);
                goto LABEL_127;
              }
              v108 = +[AXSubsystemBrailleHardware sharedInstance];
              unsigned __int8 v109 = [v108 ignoreLogging];

              if ((v109 & 1) == 0)
              {
                uint64_t v195 = v76;
                v110 = +[AXSubsystemBrailleHardware identifier];
                v111 = AXLoggerForFacility();

                os_log_type_t v112 = AXOSLogLevelFromAXLogLevel();
                if (os_log_type_enabled(v111, v112))
                {
                  v113 = AXColorizeFormatLog();
                  comPort = (NSString *)v89[2];
                  v114 = _AXStringForArgs();
                  if (os_log_type_enabled(v111, v112))
                  {
                    *(_DWORD *)v214 = 138543362;
                    v215 = v114;
                    _os_log_impl(&dword_0, v111, v112, "%{public}@", v214, 0xCu);
                  }
                }
                uint64_t v76 = v195;
              }
              int v115 = v89[2];
              if (v115 == 64)
              {
                int v116 = 0;
                v117 = @"com.apple.scrod.braille.driver.alva.6.series.BC640";
                int64_t v118 = 40;
LABEL_123:
                v121 = self->_modelIdentifier;
                self->_modelIdentifier = &v117->isa;

                self->_deviceID = v116;
                self->_mainSize = v118;
                v30 = (void *)v201;
              }
              else if (v115 == 128)
              {
                int v116 = 1;
                v117 = @"com.apple.scrod.braille.driver.alva.6.series.BC680";
                int64_t v118 = 80;
                goto LABEL_123;
              }
              v119 = self->_safeReadBuffer;
              v120.location = 0;
              v120.length = 3;
LABEL_125:
              CFDataDeleteBytes(v119, v120);
              goto LABEL_126;
            }
            char v196 = 0;
            LOBYTE(v76) = 0;
LABEL_131:
            int v78 = v193 + 1;
            v32 = v192;
            char v77 = v196;
            if (v193 == 6)
            {
              modelIdentifier = self->_modelIdentifier;
LABEL_133:
              if (modelIdentifier && (v76 & 1) != 0 && (v77 & 1) != 0)
              {
                uint64_t v123 = objc_msgSend(v30, "objectForKey:");
                if (v123)
                {
                  v124 = (void *)v123;
                  if (self->_mainSize < self->_availableCells)
                  {
                    v125 = v32;
                    v126 = +[AXSubsystemBrailleHardware sharedInstance];
                    unsigned __int8 v127 = [v126 ignoreLogging];

                    if ((v127 & 1) == 0)
                    {
                      v128 = +[AXSubsystemBrailleHardware identifier];
                      v129 = AXLoggerForFacility();

                      os_log_type_t v130 = AXOSLogLevelFromAXLogLevel();
                      if (os_log_type_enabled(v129, v130))
                      {
                        v131 = AXColorizeFormatLog();
                        comPort = (NSString *)self->_availableCells;
                        int64_t hasBeenUnloaded = self->_mainSize;
                        v132 = _AXStringForArgs();
                        if (os_log_type_enabled(v129, v130))
                        {
                          *(_DWORD *)v214 = 138543362;
                          v215 = v132;
                          _os_log_impl(&dword_0, v129, v130, "%{public}@", v214, 0xCu);
                        }
                      }
                    }
                    goto LABEL_198;
                  }
                  int v26 = 0;
                  self->_isDriverLoaded = 1;
                  v165 = v194;
LABEL_177:

                  v50 = v198;
LABEL_52:
                  v29 = v199;
                  v12 = v200;
LABEL_53:

                  goto LABEL_55;
                }
                v125 = v32;
                v182 = +[AXSubsystemBrailleHardware sharedInstance];
                unsigned __int8 v183 = [v182 ignoreLogging];

                if ((v183 & 1) == 0)
                {
                  v184 = +[AXSubsystemBrailleHardware identifier];
                  v185 = AXLoggerForFacility();

                  os_log_type_t v186 = AXOSLogLevelFromAXLogLevel();
                  if (os_log_type_enabled(v185, v186))
                  {
                    v187 = AXColorizeFormatLog();
                    comPort = self->_modelIdentifier;
                    v188 = _AXStringForArgs();
                    if (os_log_type_enabled(v185, v186))
                    {
                      *(_DWORD *)v214 = 138543362;
                      v215 = v188;
                      _os_log_impl(&dword_0, v185, v186, "%{public}@", v214, 0xCu);
                    }
                  }
                }
                v124 = 0;
LABEL_198:
                v30 = (void *)v201;
                v32 = v125;
LABEL_172:
                v165 = v194;
                [(SCRDFileReader *)self->_readerThread invalidate];
                v166 = self->_readerThread;
                self->_readerThread = 0;

                v167 = self->_safeReadBuffer;
                if (v167)
                {
                  CFRelease(v167);
                  self->_safeReadBuffer = 0;
                }
                [v198 removeObserver:self];
                [(NSLock *)self->_readBufferLock lock];
                readBuffer = self->_readBuffer;
                if (readBuffer)
                {
                  CFRelease(readBuffer);
                  self->_readBuffer = 0;
                }
                v169 = self->_readBufferLock;
                self->_readBufferLock = 0;
                v170 = v169;

                [(NSLock *)v170 unlock];
                device = self->_device;
                self->_device = 0;

                self->_comPort = -1;
                self->_hasFeaturePack = 0;
                v172 = self->_modelIdentifier;
                self->_modelIdentifier = 0;

                int v26 = 2;
                goto LABEL_177;
              }
              char v162 = v76;
              char v197 = v77;
              v163 = +[AXSubsystemBrailleHardware sharedInstance];
              unsigned __int8 v164 = [v163 ignoreLogging];

              if (v164)
              {
LABEL_171:
                v124 = 0;
                goto LABEL_172;
              }
              v177 = +[AXSubsystemBrailleHardware identifier];
              v178 = AXLoggerForFacility();

              os_log_type_t v179 = AXOSLogLevelFromAXLogLevel();
              if (os_log_type_enabled(v178, v179))
              {
                v180 = AXColorizeFormatLog();
                int64_t hasBeenUnloaded = v162 & 1;
                uint64_t v191 = v197 & 1;
                comPort = self->_modelIdentifier;
                v181 = _AXStringForArgs();
                if (os_log_type_enabled(v178, v179))
                {
                  *(_DWORD *)v214 = 138543362;
                  v215 = v181;
                  _os_log_impl(&dword_0, v178, v179, "%{public}@", v214, 0xCu);
                }

                v30 = (void *)v201;
              }

LABEL_190:
              v124 = 0;
              v32 = v192;
              goto LABEL_172;
            }
          }
          v156 = +[AXSubsystemBrailleHardware sharedInstance];
          unsigned __int8 v157 = [v156 ignoreLogging];

          if (v157) {
            goto LABEL_171;
          }
          v150 = v32;
          v158 = +[AXSubsystemBrailleHardware identifier];
          v152 = AXLoggerForFacility();

          os_log_type_t v153 = AXOSLogLevelFromAXLogLevel();
          if (os_log_type_enabled(v152, v153))
          {
            v154 = AXColorizeFormatLog();
            v155 = _AXStringForArgs();
            if (os_log_type_enabled(v152, v153))
            {
              *(_DWORD *)v214 = 138543362;
              v215 = v155;
              goto LABEL_167;
            }
LABEL_168:

            v30 = (void *)v201;
          }
LABEL_169:

          v32 = v150;
          goto LABEL_171;
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
        v29 = v199;
        v12 = v200;
        v30 = (void *)v201;
      }
      else
      {
        v48 = +[AXSubsystemBrailleHardware identifier];
        v32 = AXLoggerForFacility();

        int v26 = 1;
        os_log_type_t v49 = AXOSLogLevelFromAXLogLevel();
        v29 = v199;
        if (os_log_type_enabled(v32, v49))
        {
          v50 = AXColorizeFormatLog();
          v51 = _AXStringForArgs();
          v30 = (void *)v201;
          if (os_log_type_enabled(v32, v49))
          {
            *(_DWORD *)buf = 138543362;
            v217 = v51;
            _os_log_impl(&dword_0, v32, v49, "%{public}@", buf, 0xCu);
          }

          v12 = v200;
          goto LABEL_53;
        }
        v12 = v200;
        v30 = (void *)v201;
LABEL_55:
      }
LABEL_56:

LABEL_57:
      goto LABEL_58;
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
LABEL_58:

        goto LABEL_59;
      }
      v30 = AXColorizeFormatLog();
      v14 = _AXStringForArgs();
      if (os_log_type_enabled(v29, v53))
      {
        *(_DWORD *)buf = 138543362;
        v217 = v14;
        _os_log_impl(&dword_0, v29, v53, "%{public}@", buf, 0xCu);
      }
      goto LABEL_56;
    }
    int v26 = 1;
LABEL_59:

    goto LABEL_60;
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
        v217 = v30;
        _os_log_impl(&dword_0, v12, v28, "%{public}@", buf, 0xCu);
      }
      goto LABEL_57;
    }
    goto LABEL_59;
  }
  int v26 = 1;
LABEL_60:

  return v26;
}

- (BOOL)unloadDriver
{
  self->_int64_t hasBeenUnloaded = 1;
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

    self->_mainSize = 0;
    *(_WORD *)&self->_availableCells = 0;
    self->_hasFeaturePack = 0;
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
  return self->_hasFeaturePack;
}

- (int)brailleInputMode
{
  return 2 * self->_hasFeaturePack;
}

- (int64_t)mainSize
{
  return self->_availableCells;
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
      v23.location = 0;
      v23.length = v5;
      CFDataDeleteBytes(self->_readBuffer, v23);
    }
  }
  [(NSLock *)self->_readBufferLock unlock];
  SCRDAdvanceBufferToPacketStart();
  CFIndex v8 = CFDataGetLength(self->_safeReadBuffer);
  if (v8 >= 3)
  {
    unint64_t v9 = v8;
    v10 = +[NSMutableArray array];
    while (1)
    {
      v11 = CFDataGetBytePtr(self->_safeReadBuffer);
      v12.location = 0;
      v12.length = 3;
      switch(v11[1])
      {
        case '?':
        case 'D':
        case 'I':
        case 'L':
        case 'O':
        case 'P':
        case 'R':
        case 'S':
        case 'U':
          goto LABEL_7;
        case '@':
        case 'A':
        case 'B':
        case 'C':
        case 'J':
        case 'M':
        case 'Q':
          goto LABEL_11;
        case 'E':
          int v14 = v11[2];
          if (v14 != self->_availableCells)
          {
            self->_availableCells = v14;
            self->_splitPointOffset = LOBYTE(self->_mainSize) - v14;
            v15 = +[NSNotificationCenter defaultCenter];
            [v15 postNotificationName:@"SCROBrailleDriverProtocolConfigurationChangeNotification" object:self userInfo:0];
          }
          v12.location = 0;
          v12.length = 3;
          goto LABEL_7;
        case 'F':
          if (v9 < 6) {
            goto LABEL_30;
          }
          v12.location = 0;
          v12.length = 6;
          goto LABEL_7;
        case 'G':
          if (v9 < 0xB) {
            goto LABEL_30;
          }
          v12.location = 0;
          v12.length = 11;
          goto LABEL_7;
        case 'H':
          if (v9 < 8) {
            goto LABEL_30;
          }
          v12.location = 0;
          v12.length = 8;
          goto LABEL_7;
        case 'K':
          if (v9 < 4) {
            goto LABEL_30;
          }
          if (v11[2] == 1)
          {
            char v22 = 63;
            __int16 __buf = 17691;
            int comPort = self->_comPort;
            if (comPort != -1) {
              write(comPort, &__buf, 3uLL);
            }
          }
          else
          {
            SCRDAlva6SeriesAppendKeyEvent();
          }
LABEL_36:
          v12.location = 0;
          v12.length = 4;
          goto LABEL_7;
        case 'N':
          if (v9 < 0xE) {
            goto LABEL_30;
          }
          v12.location = 0;
          v12.length = 14;
          goto LABEL_7;
        case 'T':
          if (v9 >= 4) {
            goto LABEL_36;
          }
          goto LABEL_30;
        case 'V':
          if (v9 < 0xD) {
            goto LABEL_30;
          }
          v12.location = 0;
          v12.length = 13;
          goto LABEL_7;
        default:
          if (v11[1] != 2)
          {
LABEL_11:
            v12.location = 0;
            v12.length = 1;
            goto LABEL_7;
          }
          if (v9 >= 5)
          {
            v12.location = 0;
            v12.length = 5;
LABEL_7:
            CFDataDeleteBytes(self->_safeReadBuffer, v12);
            char v13 = 1;
            goto LABEL_31;
          }
LABEL_30:
          char v13 = 0;
LABEL_31:
          SCRDAdvanceBufferToPacketStart();
          CFIndex v17 = CFDataGetLength(self->_safeReadBuffer);
          if (v17 < 3) {
            goto LABEL_38;
          }
          unint64_t v9 = v17;
          if ((v13 & 1) == 0) {
            goto LABEL_38;
          }
          break;
      }
    }
  }
  v10 = 0;
LABEL_38:
  if ([v10 count]) {
    id v18 = v10;
  }
  else {
    id v18 = 0;
  }
  id v19 = v18;

  return v19;
}

- (BOOL)setMainCells:(const char *)a3 length:(int64_t)a4
{
  size_t v7 = self->_availableCells + 4;
  CFIndex v8 = (char *)malloc_type_malloc(v7, 0x8543D047uLL);
  if (!v8) {
    return 0;
  }
  unint64_t v9 = v8;
  strcpy(v8, "\x1BB");
  v8[3] = self->_availableCells;
  int64_t availableCells = self->_availableCells;
  v11 = v8 + 4;
  if (availableCells <= a4)
  {
    memcpy(v8 + 4, a3, availableCells);
  }
  else
  {
    memcpy(v8 + 4, a3, a4);
    bzero(&v11[a4], self->_availableCells - a4);
  }
  int comPort = self->_comPort;
  BOOL v12 = comPort != -1 && write(comPort, v9, v7) == v7;
  free(v9);
  return v12;
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