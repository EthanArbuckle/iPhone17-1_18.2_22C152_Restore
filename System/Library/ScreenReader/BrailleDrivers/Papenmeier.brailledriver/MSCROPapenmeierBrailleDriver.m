@interface MSCROPapenmeierBrailleDriver
- (BOOL)isDriverLoaded;
- (BOOL)isInputEnabled;
- (BOOL)isSleeping;
- (BOOL)postsKeyboardEvents;
- (BOOL)setMainCells:(const char *)a3 length:(int64_t)a4;
- (BOOL)setStatusCells:(const char *)a3 length:(int64_t)a4;
- (BOOL)supportsBlinkingCursor;
- (BOOL)unloadDriver;
- (MSCROPapenmeierBrailleDriver)init;
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

@implementation MSCROPapenmeierBrailleDriver

- (MSCROPapenmeierBrailleDriver)init
{
  v3.receiver = self;
  v3.super_class = (Class)MSCROPapenmeierBrailleDriver;
  result = [(MSCROPapenmeierBrailleDriver *)&v3 init];
  if (result)
  {
    result->_isDriverLoaded = 0;
    result->_comPort = -1;
  }
  return result;
}

- (void)dealloc
{
  [(MSCROPapenmeierBrailleDriver *)self unloadDriver];
  v3.receiver = self;
  v3.super_class = (Class)MSCROPapenmeierBrailleDriver;
  [(MSCROPapenmeierBrailleDriver *)&v3 dealloc];
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
        v161 = v11;
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
        [(MSCROPapenmeierBrailleDriver *)self unloadDriver];
      }
      v150 = self;
      v151 = [v12 infoDictionary];
      [v151 objectForKey:kSCROBrailleDriverModels];
      v153 = id v152 = v4;
      v14 = [v4 bluetoothAddress];
      long long v154 = 0u;
      long long v155 = 0u;
      long long v156 = 0u;
      long long v157 = 0u;
      v15 = +[BluetoothManager sharedInstance];
      v16 = [v15 pairedDevices];

      id v17 = [v16 countByEnumeratingWithState:&v154 objects:v162 count:16];
      if (v17)
      {
        id v18 = v17;
        uint64_t v19 = *(void *)v155;
        while (2)
        {
          for (i = 0; i != v18; i = (char *)i + 1)
          {
            if (*(void *)v155 != v19) {
              objc_enumerationMutation(v16);
            }
            v21 = *(void **)(*((void *)&v154 + 1) + 8 * i);
            v22 = [v21 address];
            unsigned __int8 v23 = [v22 isEqualToString:v14];

            if (v23)
            {
              v31 = v21;

              if (v31)
              {
                v32 = +[NSNotificationCenter defaultCenter];
                v33 = v150;
                [v32 addObserver:v150 selector:"removeDeviceNotification:" name:BluetoothDeviceDisconnectSuccessNotification object:0];
                [v32 addObserver:v150 selector:"removeDeviceNotification:" name:BluetoothDeviceDisconnectFailedNotification object:0];
                v149 = v31;
                if (([v31 connected] & 1) == 0)
                {
                  v55 = +[AXSubsystemBrailleHardware sharedInstance];
                  unsigned __int8 v56 = [v55 ignoreLogging];

                  if ((v56 & 1) == 0)
                  {
                    v57 = v32;
                    v58 = +[AXSubsystemBrailleHardware identifier];
                    v59 = AXLoggerForFacility();

                    os_log_type_t v60 = AXOSLogLevelFromAXLogLevel();
                    if (os_log_type_enabled(v59, v60))
                    {
                      v61 = AXColorizeFormatLog();
                      v62 = _AXStringForArgs();
                      if (os_log_type_enabled(v59, v60))
                      {
                        *(_DWORD *)buf = 138543362;
                        v161 = v62;
                        _os_log_impl(&dword_0, v59, v60, "%{public}@", buf, 0xCu);
                      }
                    }
                    v32 = v57;
                  }
                  [v32 removeObserver:v150];
                  int v26 = 1;
                  v29 = v151;
                  id v4 = v152;
                  v30 = v153;
                  goto LABEL_108;
                }
                [v31 device];
                int ComPortForServiceWithSandboxExtension = BTDeviceGetComPortForServiceWithSandboxExtension();
                if (ComPortForServiceWithSandboxExtension)
                {
                  int v35 = ComPortForServiceWithSandboxExtension;
                  v36 = +[AXSubsystemBrailleHardware sharedInstance];
                  unsigned __int8 v37 = [v36 ignoreLogging];

                  if ((v37 & 1) == 0)
                  {
                    v38 = v32;
                    v39 = +[AXSubsystemBrailleHardware identifier];
                    v40 = AXLoggerForFacility();

                    os_log_type_t v41 = AXOSLogLevelFromAXLogLevel();
                    if (os_log_type_enabled(v40, v41))
                    {
                      v42 = AXColorizeFormatLog();
                      uint64_t v144 = v35;
                      v43 = _AXStringForArgs();
                      if (os_log_type_enabled(v40, v41))
                      {
                        *(_DWORD *)v158 = 138543362;
                        v159 = v43;
                        _os_log_impl(&dword_0, v40, v41, "%{public}@", v158, 0xCu);
                      }
                    }
                    v32 = v38;
                  }
                  objc_msgSend(v32, "removeObserver:", v150, v144);
                }
                else
                {
                  if (sandbox_extension_consume() == -1)
                  {
                    v63 = +[AXSubsystemBrailleHardware sharedInstance];
                    unsigned __int8 v64 = [v63 ignoreLogging];

                    if ((v64 & 1) == 0)
                    {
                      v65 = +[AXSubsystemBrailleHardware identifier];
                      v66 = AXLoggerForFacility();

                      os_log_type_t v67 = AXOSLogLevelFromAXLogLevel();
                      if (os_log_type_enabled(v66, v67))
                      {
                        v68 = v32;
                        v69 = AXColorizeFormatLog();
                        uint64_t v144 = *__error();
                        v70 = _AXStringForArgs();
                        if (os_log_type_enabled(v66, v67))
                        {
                          *(_DWORD *)v158 = 138543362;
                          v159 = v70;
                          _os_log_impl(&dword_0, v66, v67, "%{public}@", v158, 0xCu);
                        }

                        v32 = v68;
                      }
                    }
                  }
                  int v71 = open((const char *)buf, 131074, v144);
                  v150->_comPort = v71;
                  if ((v71 & 0x80000000) == 0)
                  {
                    v148 = v32;
                    objc_storeStrong((id *)&v150->_device, v21);
                    id v72 = [objc_allocWithZone((Class)NSFileHandle) initWithFileDescriptor:v150->_comPort closeOnDealloc:1];
                    v73 = (SCRDFileReader *)[objc_allocWithZone((Class)SCRDFileReader) initWithDelegate:v150 fileHandle:v72];
                    readerThread = v150->_readerThread;
                    v150->_readerThread = v73;

                    CFMutableDataRef Mutable = CFDataCreateMutable(kCFAllocatorDefault, 0);
                    v150->_safeReadBuffer = Mutable;
                    if (Mutable)
                    {
                      v76 = (NSLock *)[objc_allocWithZone((Class)NSLock) init];
                      readBufferLock = v150->_readBufferLock;
                      v150->_readBufferLock = v76;

                      if (v150->_readBufferLock)
                      {
                        CFMutableDataRef v78 = CFDataCreateMutable(kCFAllocatorDefault, 0);
                        v150->_readBuffer = v78;
                        if (v78)
                        {
                          uint64_t IdentityRequestBuffer = SCRDPapenmeierCreateIdentityRequestBuffer();
                          if (IdentityRequestBuffer)
                          {
                            v80 = (void *)IdentityRequestBuffer;
                            [(SCRDFileReader *)v150->_readerThread start];
                            unsigned int v81 = 0;
                            CFStringRef v82 = kCFRunLoopDefaultMode;
                            while (1)
                            {
                              if (write(v150->_comPort, v80, 0) < 0) {
                                goto LABEL_96;
                              }
                              v150->_bluetoothChannelIsLost = 0;
                              v150->_hasBeenUnloaded = 0;
                              CFRunLoopRunResult v83 = CFRunLoopRunInMode(v82, 0.1, 0);
                              CFRunLoopRunResult v84 = v83;
                              if (v150->_bluetoothChannelIsLost
                                || v150->_hasBeenUnloaded
                                || v83 == kCFRunLoopRunStopped)
                              {
                                break;
                              }
                              [(NSLock *)v150->_readBufferLock lock];
                              CFIndex Length = CFDataGetLength(v150->_readBuffer);
                              if (Length >= 1)
                              {
                                CFIndex v86 = Length;
                                CFStringRef v87 = v82;
                                safeReadBuffer = v150->_safeReadBuffer;
                                BytePtr = CFDataGetBytePtr(v150->_readBuffer);
                                v90 = safeReadBuffer;
                                CFStringRef v82 = v87;
                                CFDataAppendBytes(v90, BytePtr, v86);
                                v163.location = 0;
                                v163.length = v86;
                                CFDataDeleteBytes(v150->_readBuffer, v163);
                              }
                              [(NSLock *)v150->_readBufferLock unlock];
                              uint64_t PacketFromBuffer = SCRDPapenmeierCreatePacketFromBuffer();
                              if (PacketFromBuffer)
                              {
                                uint64_t v92 = PacketFromBuffer;
                                while (*(unsigned char *)v92 != 10 || *(_WORD *)(v92 + 2) != 5)
                                {
                                  SCRDPapenmeierReleasePacket();
                                  uint64_t v92 = SCRDPapenmeierCreatePacketFromBuffer();
                                  if (!v92) {
                                    goto LABEL_80;
                                  }
                                }
                                id v102 = v72;
                                int v103 = (16 * (**(unsigned char **)(v92 + 8) & 0xF)) | *(unsigned __int8 *)(*(void *)(v92 + 8)
                                                                                                 + 1);
                                if (v103 > 98)
                                {
                                  if (v103 == 99)
                                  {
                                    CFStringRef v104 = @"com.apple.scrod.braille.driver.papenmeier.braillex.live.plus";
                                  }
                                  else
                                  {
                                    if (v103 != 100) {
                                      goto LABEL_130;
                                    }
                                    CFStringRef v104 = @"com.apple.scrod.braille.driver.papenmeier.braillex.live.20";
                                  }
                                }
                                else
                                {
                                  if (v103 != 89)
                                  {
                                    if (v103 == 98)
                                    {
                                      CFStringRef v104 = @"com.apple.scrod.braille.driver.papenmeier.braillex.live";
                                      goto LABEL_129;
                                    }
LABEL_130:
                                    SCRDPapenmeierReleasePacket();
                                    v150->_deviceID = v103;
                                    id v72 = v102;
LABEL_131:
                                    v126 = +[AXSubsystemBrailleHardware sharedInstance];
                                    unsigned __int8 v127 = [v126 ignoreLogging];

                                    v32 = v148;
                                    if ((v127 & 1) == 0)
                                    {
                                      v128 = +[AXSubsystemBrailleHardware identifier];
                                      v129 = AXLoggerForFacility();

                                      os_log_type_t v130 = AXOSLogLevelFromAXLogLevel();
                                      if (os_log_type_enabled(v129, v130))
                                      {
                                        v131 = AXColorizeFormatLog();
                                        deviceID = (NSString *)v150->_deviceID;
                                        modelIdentifier = v150->_modelIdentifier;
                                        v132 = _AXStringForArgs();
                                        if (os_log_type_enabled(v129, v130))
                                        {
                                          *(_DWORD *)v158 = 138543362;
                                          v159 = v132;
                                          _os_log_impl(&dword_0, v129, v130, "%{public}@", v158, 0xCu);
                                        }

                                        v32 = v148;
                                      }
                                    }
                                    uint64_t KeyBuffer = SCRDPapenmeierCreateKeyBuffer();
                                    v150->_keysDownBuffer = (char *)KeyBuffer;
                                    if (KeyBuffer)
                                    {
                                      free(v80);
                                      v134 = [v153 objectForKey:v150->_modelIdentifier];
                                      if (v134)
                                      {
                                        v110 = v134;
                                        v135 = [(NSLock *)v134 objectForKey:kSCROBrailleDriverMainDisplaySize];
                                        v150->_mainSize = [v135 unsignedCharValue];

                                        int v26 = 0;
                                        v150->_isDriverLoaded = 1;
                                        v30 = v153;
                                        goto LABEL_106;
                                      }
                                      v140 = +[AXSubsystemBrailleHardware sharedInstance];
                                      unsigned __int8 v141 = [v140 ignoreLogging];

                                      if (v141)
                                      {
                                        v80 = 0;
                                        goto LABEL_146;
                                      }
                                      v142 = +[AXSubsystemBrailleHardware identifier];
                                      v117 = AXLoggerForFacility();

                                      os_log_type_t v143 = AXOSLogLevelFromAXLogLevel();
                                      if (os_log_type_enabled(v117, v143))
                                      {
                                        v119 = AXColorizeFormatLog();
                                        deviceID = v150->_modelIdentifier;
                                        v120 = _AXStringForArgs();
                                        if (os_log_type_enabled(v117, v143))
                                        {
                                          *(_DWORD *)v158 = 138543362;
                                          v159 = v120;
                                          _os_log_impl(&dword_0, v117, v143, "%{public}@", v158, 0xCu);
                                        }
                                        v80 = 0;
                                        goto LABEL_151;
                                      }
LABEL_153:
                                      v80 = 0;
LABEL_154:
                                      v30 = v153;
                                      v32 = v148;
LABEL_155:

LABEL_97:
                                      [(SCRDFileReader *)v33->_readerThread invalidate];
                                      v107 = v33->_readerThread;
                                      v33->_readerThread = 0;

                                      v108 = v33->_safeReadBuffer;
                                      if (v108)
                                      {
                                        CFRelease(v108);
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
                                      v110 = v33->_readBufferLock;
                                      v111 = v33->_readBufferLock;
                                      v33->_readBufferLock = 0;

                                      [(NSLock *)v110 unlock];
                                      keysDownBuffer = v33->_keysDownBuffer;
                                      if (keysDownBuffer)
                                      {
                                        free(keysDownBuffer);
                                        v33->_keysDownBuffer = 0;
                                      }
                                      if (v80) {
                                        free(v80);
                                      }
                                      device = v33->_device;
                                      v33->_device = 0;

                                      v33->_comPort = -1;
                                      v114 = v33->_modelIdentifier;
                                      v33->_modelIdentifier = 0;

                                      int v26 = 2;
LABEL_106:

LABEL_107:
                                      v29 = v151;
                                      id v4 = v152;
LABEL_108:

LABEL_109:
                                      goto LABEL_110;
                                    }
                                    v136 = +[AXSubsystemBrailleHardware sharedInstance];
                                    unsigned __int8 v137 = [v136 ignoreLogging];

                                    if (v137)
                                    {
LABEL_146:
                                      v30 = v153;
                                      goto LABEL_97;
                                    }
                                    v138 = +[AXSubsystemBrailleHardware identifier];
                                    v117 = AXLoggerForFacility();

                                    os_log_type_t v139 = AXOSLogLevelFromAXLogLevel();
                                    if (!os_log_type_enabled(v117, v139)) {
                                      goto LABEL_154;
                                    }
                                    v119 = AXColorizeFormatLog();
                                    deviceID = (NSString *)v150->_deviceID;
                                    v120 = _AXStringForArgs();
                                    if (os_log_type_enabled(v117, v139))
                                    {
                                      *(_DWORD *)v158 = 138543362;
                                      v159 = v120;
                                      _os_log_impl(&dword_0, v117, v139, "%{public}@", v158, 0xCu);
                                    }
LABEL_122:
                                    v30 = v153;
LABEL_152:
                                    v32 = v148;

                                    goto LABEL_155;
                                  }
                                  CFStringRef v104 = @"com.apple.scrod.braille.driver.papenmeier.braillex.trio.40";
                                }
LABEL_129:
                                v125 = v150->_modelIdentifier;
                                v150->_modelIdentifier = &v104->isa;

                                goto LABEL_130;
                              }
LABEL_80:
                              if (v81++ >= 4) {
                                goto LABEL_131;
                              }
                            }
                            v121 = +[AXSubsystemBrailleHardware sharedInstance];
                            unsigned __int8 v122 = [v121 ignoreLogging];

                            if (v122) {
                              goto LABEL_96;
                            }
                            v123 = +[AXSubsystemBrailleHardware identifier];
                            v117 = AXLoggerForFacility();

                            os_log_type_t v124 = AXOSLogLevelFromAXLogLevel();
                            if (!os_log_type_enabled(v117, v124)) {
                              goto LABEL_154;
                            }
                            v119 = AXColorizeFormatLog();
                            modelIdentifier = (NSString *)v150->_hasBeenUnloaded;
                            uint64_t v147 = v84;
                            deviceID = (NSString *)v150->_bluetoothChannelIsLost;
                            v120 = _AXStringForArgs();
                            if (os_log_type_enabled(v117, v124))
                            {
                              *(_DWORD *)v158 = 138543362;
                              v159 = v120;
                              _os_log_impl(&dword_0, v117, v124, "%{public}@", v158, 0xCu);
                            }
LABEL_151:
                            v30 = v153;
                            v33 = v150;
                            goto LABEL_152;
                          }
                          v105 = +[AXSubsystemBrailleHardware sharedInstance];
                          unsigned __int8 v106 = [v105 ignoreLogging];

                          if ((v106 & 1) == 0)
                          {
                            v116 = +[AXSubsystemBrailleHardware identifier];
                            v117 = AXLoggerForFacility();

                            os_log_type_t v118 = AXOSLogLevelFromAXLogLevel();
                            if (!os_log_type_enabled(v117, v118)) {
                              goto LABEL_153;
                            }
                            v119 = AXColorizeFormatLog();
                            v120 = _AXStringForArgs();
                            if (os_log_type_enabled(v117, v118))
                            {
                              *(_DWORD *)v158 = 138543362;
                              v159 = v120;
                              _os_log_impl(&dword_0, v117, v118, "%{public}@", v158, 0xCu);
                            }
                            v80 = 0;
                            goto LABEL_122;
                          }
                        }
                      }
                    }
                    v80 = 0;
LABEL_96:
                    v30 = v153;
                    v32 = v148;
                    goto LABEL_97;
                  }
                  v94 = +[AXSubsystemBrailleHardware sharedInstance];
                  unsigned __int8 v95 = [v94 ignoreLogging];

                  if ((v95 & 1) == 0)
                  {
                    v96 = v32;
                    v97 = +[AXSubsystemBrailleHardware identifier];
                    v98 = AXLoggerForFacility();

                    os_log_type_t v99 = AXOSLogLevelFromAXLogLevel();
                    if (os_log_type_enabled(v98, v99))
                    {
                      v100 = AXColorizeFormatLog();
                      deviceID = (NSString *)v150->_comPort;
                      v101 = _AXStringForArgs();
                      if (os_log_type_enabled(v98, v99))
                      {
                        *(_DWORD *)v158 = 138543362;
                        v159 = v101;
                        _os_log_impl(&dword_0, v98, v99, "%{public}@", v158, 0xCu);
                      }
                    }
                    v32 = v96;
                  }
                  objc_msgSend(v32, "removeObserver:", v150, deviceID);
                  v150->_comPort = -1;
                }
                int v26 = 1;
                v30 = v153;
                goto LABEL_107;
              }
              goto LABEL_37;
            }
          }
          id v18 = [v16 countByEnumeratingWithState:&v154 objects:v162 count:16];
          if (v18) {
            continue;
          }
          break;
        }
      }

LABEL_37:
      v44 = +[AXSubsystemBrailleHardware sharedInstance];
      unsigned __int8 v45 = [v44 ignoreLogging];

      if ((v45 & 1) == 0)
      {
        v48 = +[AXSubsystemBrailleHardware identifier];
        v49 = AXLoggerForFacility();

        int v26 = 1;
        os_log_type_t v50 = AXOSLogLevelFromAXLogLevel();
        v29 = v151;
        v149 = v49;
        if (os_log_type_enabled(v49, v50))
        {
          uint64_t v51 = AXColorizeFormatLog();
          v52 = _AXStringForArgs();
          if (os_log_type_enabled(v49, v50))
          {
            *(_DWORD *)buf = 138543362;
            v161 = v52;
            _os_log_impl(&dword_0, v49, v50, "%{public}@", buf, 0xCu);
          }

          id v4 = v152;
          v30 = v153;
          v32 = (void *)v51;
          goto LABEL_108;
        }
        id v4 = v152;
        v30 = v153;
        goto LABEL_109;
      }
      int v26 = 1;
      v29 = v151;
      id v4 = v152;
      v30 = v153;
LABEL_110:

      goto LABEL_111;
    }
    v46 = +[AXSubsystemBrailleHardware sharedInstance];
    unsigned __int8 v47 = [v46 ignoreLogging];

    if ((v47 & 1) == 0)
    {
      v53 = +[AXSubsystemBrailleHardware identifier];
      v29 = AXLoggerForFacility();

      int v26 = 1;
      os_log_type_t v54 = AXOSLogLevelFromAXLogLevel();
      if (os_log_type_enabled(v29, v54))
      {
        v30 = AXColorizeFormatLog();
        v14 = _AXStringForArgs();
        if (os_log_type_enabled(v29, v54))
        {
          *(_DWORD *)buf = 138543362;
          v161 = v14;
          _os_log_impl(&dword_0, v29, v54, "%{public}@", buf, 0xCu);
        }
        goto LABEL_110;
      }
      goto LABEL_112;
    }
    int v26 = 1;
    goto LABEL_113;
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
        v161 = v30;
        _os_log_impl(&dword_0, v12, v28, "%{public}@", buf, 0xCu);
      }
LABEL_111:

LABEL_112:
    }
LABEL_113:

    goto LABEL_114;
  }
  int v26 = 1;
LABEL_114:

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
  self->_hasBeenUnloaded = 1;
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

    self->_mainSize = 0;
    keysDownBuffer = self->_keysDownBuffer;
    if (keysDownBuffer)
    {
      free(keysDownBuffer);
      self->_keysDownBuffer = 0;
    }
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
      v13.location = 0;
      v13.length = v5;
      CFDataDeleteBytes(self->_readBuffer, v13);
    }
  }
  [(NSLock *)self->_readBufferLock unlock];
  uint64_t deviceID = self->_deviceID;
  os_log_type_t v9 = self->_safeReadBuffer;
  keysDownBuffer = self->_keysDownBuffer;

  return (id)_SCRDPapenmeierExtractEventsFromBuffer(v9, deviceID, keysDownBuffer);
}

- (BOOL)setMainCells:(const char *)a3 length:(int64_t)a4
{
  uint64_t BrailleBufferB = SCRDPapenmeierCreateBrailleBufferB();
  if (!BrailleBufferB) {
    return 0;
  }
  unsigned __int8 v6 = (void *)BrailleBufferB;
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