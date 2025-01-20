void genericIncomingConnectionCallback(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  CFTypeRef cf;

  cf = 0;
  if (DLShouldLog(5)) {
    _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/GenericConnectionCallbacks.c", "genericIncomingConnectionCallback", 5, @"genericIncomingConnectionCallback called", v4, v5, v6, v7, v12);
  }
  if (DLDeviceReady(a1, &cf, v2, v3, v4, v5, v6, v7))
  {
    if (DLShouldLog(3)) {
      _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/GenericConnectionCallbacks.c", "genericIncomingConnectionCallback", 3, @"DLDeviceReady failed: %@", v8, v9, v10, v11, (char)cf);
    }
    if (cf) {
      CFRelease(cf);
    }
  }
}

void genericConnectionMadeCallback(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  if (DLShouldLog(5))
  {
    _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/GenericConnectionCallbacks.c", "genericConnectionMadeCallback", 5, @"genericConnectionMadeCallback called", v9, v10, v11, v12, a9);
  }
}

uint64_t genericConnectionFailedCallback(uint64_t a1, __CFString *a2)
{
  if (DLShouldLog(5)) {
    _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/GenericConnectionCallbacks.c", "genericConnectionFailedCallback", 5, @"genericConnectionFailedCallback called with reason %@", v4, v5, v6, v7, (char)a2);
  }
  v8 = *(uint64_t (**)(uint64_t, __CFString *))(*(void *)(a1 + 40) + 32);
  if (a2) {
    uint64_t v9 = a2;
  }
  else {
    uint64_t v9 = @"Lost connection";
  }

  return v8(a1, v9);
}

uint64_t genericAcceptFailedCallback(uint64_t a1, __CFString *a2)
{
  if (DLShouldLog(5)) {
    _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/GenericConnectionCallbacks.c", "genericAcceptFailedCallback", 5, @"genericAcceptFailedCallback called with reason %@", v4, v5, v6, v7, (char)a2);
  }
  v8 = *(uint64_t (**)(uint64_t, __CFString *))(*(void *)(a1 + 40) + 32);
  if (a2) {
    uint64_t v9 = a2;
  }
  else {
    uint64_t v9 = @"Accept failed";
  }

  return v8(a1, v9);
}

void genericDisconnectCallback(uint64_t a1, char a2)
{
  if (DLShouldLog(5)) {
    _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/GenericConnectionCallbacks.c", "genericDisconnectCallback", 5, @"genericDisconnectCallback called with reason: %@", v3, v4, v5, v6, a2);
  }
}

uint64_t genericConnectionLostCallback(uint64_t a1)
{
  if (DLShouldLog(5)) {
    _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/GenericConnectionCallbacks.c", "genericConnectionLostCallback", 5, @"genericConnectionLostCallback called", v2, v3, v4, v5, v8);
  }
  uint64_t v6 = *(uint64_t (**)(uint64_t, __CFString *))(*(void *)(a1 + 40) + 32);

  return v6(a1, @"Lost connection");
}

void genericProcessMessageCallback(uint64_t a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  if (DLShouldLog(7)) {
    _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/GenericConnectionCallbacks.c", "genericProcessMessageCallback", 7, @"genericProcessMessageCallback called with message: %@", v10, v11, v12, v13, a2);
  }
  if (DLShouldLog(4))
  {
    _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/GenericConnectionCallbacks.c", "genericProcessMessageCallback", 4, @"genericProcessMessageCallback was never overridden. This method does nothing. Your app will probably hang here.", v14, v15, v16, v17, a9);
  }
}

void genericPingCallback(uint64_t a1, char a2)
{
  if (DLShouldLog(6)) {
    _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/GenericConnectionCallbacks.c", "genericPingCallback", 6, @"genericPingCallback called with reason: %@", v3, v4, v5, v6, a2);
  }
}

void printFileTransferStatus(const __CFDictionary *a1)
{
  char Value = CFDictionaryGetValue(a1, @"DLFileDest");
  CFDictionaryRef v3 = (const __CFDictionary *)CFDictionaryGetValue(a1, @"DLFileAttributesKey");
  int valuePtr = 0;
  CFNumberRef v4 = (const __CFNumber *)CFDictionaryGetValue(a1, @"DLFileStatusKey");
  if (v4)
  {
    CFNumberGetValue(v4, kCFNumberIntType, &valuePtr);
    if (valuePtr == 1)
    {
      if (v3)
      {
        uint64_t v23 = 0;
        uint64_t v24 = 0;
        CFNumberRef v9 = (const __CFNumber *)CFDictionaryGetValue(v3, @"FileSize");
        CFNumberRef v10 = (const __CFNumber *)CFDictionaryGetValue(a1, @"DLFileOffsetKey");
        CFNumberGetValue(v9, kCFNumberSInt64Type, &v24);
        CFNumberGetValue(v10, kCFNumberSInt64Type, &v23);
        if (DLShouldLog(5)) {
          _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/GenericConnectionCallbacks.c", "printFileTransferStatus", 5, @"Transfer status for \"%@\": %3.2f%% complete.", v11, v12, v13, v14, Value);
        }
      }
      else if (DLShouldLog(5))
      {
        _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/GenericConnectionCallbacks.c", "printFileTransferStatus", 5, @"Transfer status for \"%@\": UNKNOWN", v19, v20, v21, v22, Value);
      }
    }
    else if (valuePtr == 3)
    {
      if (DLShouldLog(5)) {
        _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/GenericConnectionCallbacks.c", "printFileTransferStatus", 5, @"Transfer of file \"%@\" failed.", v15, v16, v17, v18, Value);
      }
    }
    else if (valuePtr == 2 && DLShouldLog(5))
    {
      _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/GenericConnectionCallbacks.c", "printFileTransferStatus", 5, @"Transfer of file \"%@\" completed successfully.", v5, v6, v7, v8, Value);
    }
  }
}

void genericSendFileCallback(uint64_t a1, const __CFData *a2, const __CFDictionary *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  CFStringRef v16 = 0;
  if (a3)
  {
    printFileTransferStatus(a3);
    if (a2) {
      DLHandleSentFilePiece(a1, a2, a3, &v16);
    }
  }
  else if (DLShouldLog(3))
  {
    _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/GenericConnectionCallbacks.c", "genericSendFileCallback", 3, @"No info dictionary passed to genericSendFileCallback", v12, v13, v14, v15, a9);
  }
}

void genericRequestFileCallback(uint64_t a1, __CFString *a2, uint64_t a3)
{
  if (DLShouldLog(5)) {
    _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/GenericConnectionCallbacks.c", "genericRequestFileCallback", 5, @"genericRequestFileCallback called for file \"%@\" and info %@", v6, v7, v8, v9, (char)a2);
  }
  uint64_t v18 = 0;
  if (DLSendFile(a1, a2, a3, (uint64_t)&v18, v6, v7, v8, v9) && DLShouldLog(3)) {
    _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/GenericConnectionCallbacks.c", "genericRequestFileCallback", 3, @"Could not send the file at %@: %@", v10, v11, v12, v13, (char)a2);
  }
  if (DLWaitForMessage(a1))
  {
    if (DLShouldLog(3)) {
      _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/GenericConnectionCallbacks.c", "genericRequestFileCallback", 3, @"Could not send the file at %@: %@", v14, v15, v16, v17, (char)a2);
    }
  }
}

void genericProgressCallback(__n128 a1)
{
  char v1 = a1.n128_u8[0];
  if (DLShouldLog(6)) {
    _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/GenericConnectionCallbacks.c", "genericProgressCallback", 6, @"genericProgressCallback called with percentage: %f", v2, v3, v4, v5, v1);
  }
}

CFDataRef _RunLoopReadSourceCallback(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return _DLHandlerThreadMessagePortCallback(a1, 5, 0, a1, a5, a6, a7, a8);
}

CFDataRef _DLHandlerThreadMessagePortCallback(int a1, int a2, CFDataRef xmlData, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unsigned int v10 = a2;
  CFTypeRef v249 = 0;
  CFTypeRef cf = 0;
  if (a2 >= 16 && DLShouldLog(4))
  {
    uint64_t v244 = a4;
    _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "_DLHandlerThreadMessagePortCallback", 4, @"Handler thread invoked with unknown msgid %d for connection %p", a5, a6, a7, a8, v10);
  }
  if (a4)
  {
    if (sSaveCallHistory == 1)
    {
      uint64_t v11 = v10 <= 0xF ? sDLMessageStrings[v10] : "(Invalid Message Code)";
      uint64_t v18 = (__CFString *)CFStringCreateWithFormat(0, 0, @"-> Handling %s", v11, v244);
      _DLCallHistoryAddEntry(v18);
      if (v18) {
        CFRelease(v18);
      }
    }
    switch(v10)
    {
      case 1u:
      case 3u:
        uint64_t v19 = *(void *)(a4 + 64);
        sHandlerThreadConnectionSessionNumber = *(_DWORD *)(a4 + 4);
        if (!v19)
        {
          char Value = (void *)CFDictionaryGetValue(*(CFDictionaryRef *)(a4 + 120), @"DLInfoStreamTypeKey");
          StreamHandlerForType(Value, a4 + 64, &cf);
        }
        if (v10 == 1)
        {
          if (StreamHandlerAccept(*(uint64_t (***)(void))(a4 + 64), *(void *)(a4 + 120), &cf))
          {
            if (DLShouldLog(3)) {
              _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "_DLHandlerThreadMessagePortCallback", 3, @"Error calling accept: %@", v21, v22, v23, v24, (char)cf);
            }
            CFDataRef v25 = 0;
            unsigned int v10 = 2;
            goto LABEL_139;
          }
          if (_DLCheckVersionForAccept(a4, &v249))
          {
            CFDataRef v25 = 0;
            unsigned int v10 = 1;
          }
          else
          {
            v134 = (__CFString *)v249;
            if (!v249)
            {
              v134 = (__CFString *)CFRetain(@"Unknown error");
              CFTypeRef v249 = v134;
            }
            CFDataRef v25 = (const __CFData *)_DLCreateMessageDataV(@"DLAcceptMessage", 1, v89, v90, v91, v92, v93, v94, v134);
            unsigned int v10 = 2;
          }
          goto LABEL_137;
        }
        if (cf)
        {
          CFRelease(cf);
          CFTypeRef cf = 0;
        }
        int v80 = StreamHandlerConnect(*(void *)(a4 + 64), *(void *)(a4 + 120), &cf);
        if (!v80)
        {
          if (_DLCheckVersionForConnect(a4, &v249))
          {
            CFDataRef v25 = 0;
          }
          else
          {
            v135 = (__CFString *)v249;
            if (!v249)
            {
              v135 = (__CFString *)CFRetain(@"Unknown error");
              CFTypeRef v249 = v135;
            }
            CFDataRef v25 = (const __CFData *)_DLCreateMessageDataV(@"DLConnectMessage", 1, v95, v96, v97, v98, v99, v100, v135);
            unsigned int v10 = 4;
          }
LABEL_137:
          if (v249)
          {
            CFRelease(v249);
            CFTypeRef v249 = 0;
          }
          goto LABEL_139;
        }
        int v81 = v80;
        if (DLShouldLog(3)) {
          _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "_DLHandlerThreadMessagePortCallback", 3, @"Error calling connect: %@", v84, v85, v86, v87, (char)cf);
        }
        v88 = (__CFString *)cf;
        if (v81 == -5) {
          v88 = @"DLErrorConnectingLocked";
        }
        CFTypeRef v249 = v88;
        CFDataRef v25 = (const __CFData *)_DLCreateMessageDataV(@"DLConnectMessage", 1, v82, v83, v84, v85, v86, v87, v88);
        unsigned int v10 = 4;
LABEL_139:
        if (cf)
        {
          CFRelease(cf);
          CFTypeRef cf = 0;
        }
        v51 = *(__CFMessagePort **)(a4 + 96);
        uint64_t v52 = sHandlerThreadConnectionSessionNumber | v10;
        uint64_t v53 = a4;
        CFDataRef Message = v25;
LABEL_142:
        _SendMessage(v53, v51, (void (*)(void, uint64_t, const __CFData *, uint64_t))_DLMainThreadMessagePortCallback, v52, Message);
        return 0;
      case 5u:
        CFDataRef Message = _DLHandlerThreadReadMessage(a4);
        v51 = *(__CFMessagePort **)(a4 + 96);
        uint64_t v52 = sHandlerThreadConnectionSessionNumber | 5u;
        uint64_t v53 = a4;
        goto LABEL_142;
      case 6u:
        _DLHandlerThreadWriteMessage(a4, xmlData, (uint64_t)xmlData, a4, a5, a6, a7, a8, v243);
        return 0;
      case 7u:
      case 8u:
        uint64_t v26 = *(void *)(a4 + 64);
        if (v26)
        {
          if (_DLSendData(v26, xmlData, &cf) && DLShouldLog(3)) {
            _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "_DLHandlerThreadMessagePortCallback", 3, @"Could not send disconnect message: '%@'", v27, v28, v29, v30, (char)cf);
          }
          if (cf)
          {
            CFRelease(cf);
            CFTypeRef cf = 0;
          }
          _DLCleanupStreamHandler(a4);
        }
        if (v10 == 8)
        {
          v31 = *(__CFMessagePort **)(a4 + 88);
          if (v31) {
            DLThreadDeleteReceivePort(v31);
          }
          v32 = *(__CFMessagePort **)(a4 + 104);
          if (v32) {
            DLThreadDeleteSendPort(v32);
          }
          Current = CFRunLoopGetCurrent();
          CFRunLoopStop(Current);
        }
        v34 = *(__CFMessagePort **)(a4 + 96);
        uint64_t v35 = sHandlerThreadConnectionSessionNumber | v10;
        if (v34) {
          DLThreadSendMessage(v34, v35, 0);
        }
        else {
          _DLMainThreadMessagePortCallback(0, v35, 0, (void (***)(void, void))a4, a5, a6, a7, a8);
        }
        return 0;
      case 9u:
        _DLCleanupStreamHandler(a4);
        return 0;
      case 0xAu:
        if (!*(void *)(a4 + 64))
        {
          if (!DLShouldLog(4)) {
            return 0;
          }
          CFStringRef v16 = @"RequestFileMessage called in HandlerThread, but StreamHandler is NULL";
          goto LABEL_105;
        }
        CFArrayRef v54 = (const __CFArray *)CFPropertyListCreateFromXMLData(0, xmlData, 0, (CFStringRef *)&cf);
        v55 = (__CFString *)_DLGetParameterAtIndexWithDefaultValue(v54, 1, 0);
        CFStringRef v56 = _DLGetParameterAtIndexWithDefaultValue(v54, 2, 0);
        CFStringRef v57 = _DLGetParameterAtIndexWithDefaultValue(v54, 3, 0);
        if (v57) {
          MutableCopy = CFDictionaryCreateMutableCopy(0, 0, (CFDictionaryRef)v57);
        }
        else {
          MutableCopy = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
        }
        v101 = MutableCopy;
        CFDictionarySetValue(MutableCopy, @"DLFileSource", v55);
        CFDictionarySetValue(v101, @"DLFileDest", v56);
        CFDataRef v108 = (const __CFData *)_DLCreateMessageDataV(@"DLRequestFile", 3, v102, v103, v104, v105, v106, v107, v55);
        _DLSendDataAndDisconnectOnError(a4, v108);
        CFRelease(v108);
        CFRelease(v101);
        if (v54)
        {
          CFArrayRef v109 = v54;
          goto LABEL_278;
        }
        return 0;
      case 0xBu:
        if (*(void *)(a4 + 64))
        {
          CFArrayRef v59 = (const __CFArray *)CFPropertyListCreateFromXMLData(0, xmlData, 0, (CFStringRef *)&cf);
          CFStringRef v60 = _DLGetParameterAtIndexWithDefaultValue(v59, 1, 0);
          CFStringRef v61 = _DLGetParameterAtIndexWithDefaultValue(v59, 2, 0);
          if (v61) {
            Mutable = CFDictionaryCreateMutableCopy(0, 0, (CFDictionaryRef)v61);
          }
          else {
            Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
          }
          v110 = Mutable;
          if (v60) {
            CFDictionarySetValue(Mutable, @"DLFileSource", v60);
          }
          v111 = (const char *)DLCreateCStringFromCFString(v60);
          if (v111)
          {
            v112 = (char *)v111;
            __stream = fopen(v111, "r");
            if (__stream)
            {
              free(v112);
              v113 = DLCopyFileAttributes(v60);
              CFDictionarySetValue(v110, @"DLFileAttributesKey", v113);
              CFNumberRef v114 = (const __CFNumber *)CFDictionaryGetValue(v113, @"FileSize");
              if (v113) {
                CFRelease(v113);
              }
              if (!v114) {
                goto LABEL_265;
              }
              uint64_t valuePtr = 0;
              CFNumberGetValue(v114, kCFNumberIntType, &valuePtr);
              *__error() = 0;
              CFDataRef theData = 0;
              *(void *)&long long context = 0;
              char v257 = 0;
              CFDataRef v115 = (const __CFData *)CFDictionaryGetValue(v110, @"DLFileEncryptionKey");
              if (v115)
              {
                CFDataRef v116 = v115;
                if (DLShouldLog(6)) {
                  _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "_DLWriteFileBytes", 6, @"The caller has requested that this file be encrypted before sending it. Starting up the encryption engine", v117, v118, v119, v120, v243);
                }
                char v257 = 1;
                CFDataRef v258 = 0;
                v121 = createFileAuthBlob(v116, &theData, &v258);
                if (!v121)
                {
                  if (DLShouldLog(3)) {
                    _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "_DLWriteFileBytes", 3, @"Could not create encrypted auth data", v205, v206, v207, v208, v243);
                  }
                  if (v258) {
                    CFRelease(v258);
                  }
                  goto LABEL_241;
                }
                BytePtr = CFDataGetBytePtr(theData);
                v123 = CFDataGetBytePtr(v258);
                CCCryptorStatus v124 = CCCryptorCreate(0, 0, 1u, BytePtr, 0x20uLL, v123, (CCCryptorRef *)&context);
                if (v258)
                {
                  CFRelease(v258);
                  CFDataRef v258 = 0;
                }
                if (v124)
                {
                  if (DLShouldLog(3)) {
                    _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "_DLWriteFileBytes", 3, @"Could not create an encryptor! Refusing to send the file", v125, v126, v127, v128, v243);
                  }
LABEL_241:
                  LOBYTE(v114) = 1;
LABEL_259:
                  if ((void)context) {
                    CCCryptorRelease((CCCryptorRef)context);
                  }
                  if (v121) {
                    CFRelease(v121);
                  }
                  if (theData) {
                    CFRelease(theData);
                  }
LABEL_265:
                  fclose(__stream);
                  CFTypeRef v141 = cf;
LABEL_266:
                  if (v141)
                  {
                    CFDictionarySetValue(v110, @"DLFileErrorString", v141);
                    CFRelease(cf);
                  }
                  if ((v114 & 1) == 0)
                  {
                    LODWORD(context) = 3;
                    CFNumberRef v234 = CFNumberCreate(0, kCFNumberIntType, &context);
                    CFDictionarySetValue(v110, @"DLFileStatusKey", v234);
                    if (v234) {
                      CFRelease(v234);
                    }
                    CFDataRef v241 = (const __CFData *)_DLCreateMessageDataV(@"DLSendFile", 2, v235, v236, v237, v238, v239, v240, 0);
                    CFDataRef v242 = v241;
                    if (v241) {
                      CFRetain(v241);
                    }
                    _SendMessage(a4, *(__CFMessagePort **)(a4 + 96), (void (*)(void, uint64_t, const __CFData *, uint64_t))_DLMainThreadMessagePortCallback, sHandlerThreadConnectionSessionNumber | 0xBu, v242);
                    _DLSendDataAndDisconnectOnError(a4, v242);
                  }
                  if (v59) {
                    CFRelease(v59);
                  }
                  if (v110)
                  {
                    CFArrayRef v109 = v110;
LABEL_278:
                    CFRelease(v109);
                  }
                  return 0;
                }
                if (DLShouldLog(6)) {
                  _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "_DLWriteFileBytes", 6, @"Successfully created an encryptor. Hang on to your initialization vectors, it's going to be a wild ride!", v213, v214, v215, v216, v243);
                }
              }
              else
              {
                v121 = 0;
              }
              CFNumberRef v145 = CFNumberCreate(0, kCFNumberCharType, &v257);
              CFDictionarySetValue(v110, @"DLFileIsEncrypted", v145);
              if (v145) {
                CFRelease(v145);
              }
              CFDictionaryRemoveValue(v110, @"DLFileEncryptionKey");
              CFDataRef v258 = (CFDataRef)-1;
              CFDictionaryRef v146 = (const __CFDictionary *)CFDictionaryGetValue(v110, @"DLFileAttributesKey");
              if (v146)
              {
                CFNumberRef v147 = (const __CFNumber *)CFDictionaryGetValue(v146, @"FileSize");
                if (v147) {
                  CFNumberGetValue(v147, kCFNumberLongLongType, &v258);
                }
              }
              if (v258 == (CFDataRef)-1)
              {
                if (DLShouldLog(3)) {
                  _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "_DLWriteFileBytes", 3, @"Could not get the file size from the file info dictionary. Refusing to send this file", v209, v210, v211, v212, v243);
                }
                LOBYTE(v114) = 0;
              }
              else
              {
                Boolean keyExistsAndHasValidFormat = 0;
                AppIntegerchar Value = CFPreferencesGetAppIntegerValue(@"ChunkSize", @"com.apple.DeviceLink", &keyExistsAndHasValidFormat);
                if (AppIntegerValue <= 0 || keyExistsAndHasValidFormat == 0) {
                  size_t v150 = 0x2000;
                }
                else {
                  size_t v150 = AppIntegerValue;
                }
                size_t v151 = v150 + 16;
                CFDataRef v246 = v121;
                if (v121) {
                  v151 += CFDataGetLength(v121);
                }
                v152 = (char *)malloc_type_calloc(1uLL, v151, 0x11E6ED33uLL);
                if (v152)
                {
                  v153 = v152;
                  uint64_t v255 = 0;
                  CFAllocatorRef bytesDeallocator = (const __CFAllocator *)*MEMORY[0x263EFFB28];
                  while (1)
                  {
                    bzero(v153, v151);
                    if (v257 && v255 == 0)
                    {
                      CFIndex Length = CFDataGetLength(v246);
                      v267.location = 0;
                      v267.length = Length;
                      CFDataGetBytes(v246, v267, (UInt8 *)v153);
                    }
                    else
                    {
                      CFIndex Length = 0;
                    }
                    size_t v156 = fread(&v153[Length], 1uLL, v150, __stream);
                    if (!v156 && !feof(__stream)) {
                      break;
                    }
                    CFNumberRef v157 = CFNumberCreate(0, kCFNumberLongLongType, &v255);
                    CFDictionarySetValue(v110, @"DLFileOffsetKey", v157);
                    CFRelease(v157);
                    if (v255 + v156 < (unint64_t)v258 && v156 >= v150) {
                      int v159 = 1;
                    }
                    else {
                      int v159 = 2;
                    }
                    int v254 = v159;
                    CFNumberRef v160 = CFNumberCreate(0, kCFNumberIntType, &v254);
                    CFDictionarySetValue(v110, @"DLFileStatusKey", v160);
                    if (v160) {
                      CFRelease(v160);
                    }
                    if (v257)
                    {
                      size_t v252 = 0;
                      size_t dataOutMoved = 0;
                      CCCryptorStatus v161 = CCCryptorUpdate((CCCryptorRef)context, &v153[Length], v156, &v153[Length], v151 - Length, &dataOutMoved);
                      if (v161)
                      {
                        char v162 = v161;
                        if (DLShouldLog(3)) {
                          _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "_DLWriteFileBytes", 3, @"There was an error while encrypting the file data: %d", v163, v164, v165, v166, v162);
                        }
                      }
                      else if (DLShouldLog(6))
                      {
                        _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "_DLWriteFileBytes", 6, @"%d bytes of data successfully encrypted", v169, v170, v171, v172, dataOutMoved);
                      }
                      if (v254 == 2)
                      {
                        if (DLShouldLog(6)) {
                          _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "_DLWriteFileBytes", 6, @"Finalizing bytes", v173, v174, v175, v176, v243);
                        }
                        CCCryptorStatus v177 = CCCryptorFinal((CCCryptorRef)context, &v153[Length + dataOutMoved], v151 - Length - dataOutMoved, &v252);
                        if (v177)
                        {
                          char v178 = v177;
                          if (v177 == -4301) {
                            _DLHandlerThreadMessagePortCallback_cold_1();
                          }
                          if (DLShouldLog(3)) {
                            _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "_DLWriteFileBytes", 3, @"There was an error finalizing the encrypted bytes: %d", v179, v180, v181, v182, v178);
                          }
                        }
                        else if (DLShouldLog(6))
                        {
                          _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "_DLWriteFileBytes", 6, @"Finalized %d bytes of data", v183, v184, v185, v186, v252);
                        }
                      }
                      CFIndex v168 = dataOutMoved + Length + v252;
                      v167 = (const UInt8 *)v153;
                    }
                    else
                    {
                      v167 = (const UInt8 *)v153;
                      CFIndex v168 = v156;
                    }
                    v187 = (__CFString *)CFDataCreateWithBytesNoCopy(0, v167, v168, bytesDeallocator);
                    CFDataRef v194 = (const __CFData *)_DLCreateMessageDataV(@"DLSendFile", 2, v188, v189, v190, v191, v192, v193, v187);
                    int v201 = _DLSendData(*(void *)(a4 + 64), v194, &cf);
                    if (v194) {
                      CFRelease(v194);
                    }
                    if (v187) {
                      CFRelease(v187);
                    }
                    if (v201)
                    {
                      if (DLShouldLog(3)) {
                        _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "_DLWriteFileBytes", 3, @"Could not send data: '%@'", v221, v222, v223, v224, (char)cf);
                      }
                      CFStringRef v225 = CFStringCreateWithFormat(0, 0, @"Could not send data: %@", cf, v110);
                      goto LABEL_256;
                    }
                    uint64_t v202 = v255;
                    if (__ROR8__(0xCCCCCCCCCCCCCCCDLL * v255 + 0x1999999999999998, 1) < 0x1999999999999999uLL
                      || v254 == 2)
                    {
                      CFDataRef v203 = (const __CFData *)_DLCreateMessageDataV(@"DLSendFile", 2, v195, v196, v197, v198, v199, v200, 0);
                      _SendMessage(a4, *(__CFMessagePort **)(a4 + 96), (void (*)(void, uint64_t, const __CFData *, uint64_t))_DLMainThreadMessagePortCallback, sHandlerThreadConnectionSessionNumber | 0xBu, v203);
                      uint64_t v202 = v255;
                    }
                    uint64_t v204 = v202 + v150;
                    uint64_t v255 = v204;
                    if (v204 && v204 >= (uint64_t)v258)
                    {
                      LOBYTE(v114) = 1;
                      goto LABEL_257;
                    }
                  }
                  if (DLShouldLog(3))
                  {
                    char v226 = ferror(__stream);
                    v227 = __error();
                    strerror(*v227);
                    _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "_DLWriteFileBytes", 3, @"Error while reading from file: (%d) %s", v228, v229, v230, v231, v226);
                  }
                  uint64_t v232 = v255;
                  v233 = __error();
                  v245 = strerror(*v233);
                  CFStringRef v225 = CFStringCreateWithFormat(0, 0, @"Could not read file bytes at offset %lld: %s", v232, v245);
LABEL_256:
                  LOBYTE(v114) = 0;
                  CFTypeRef cf = v225;
LABEL_257:
                  free(v153);
                }
                else
                {
                  if (DLShouldLog(3)) {
                    _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "_DLWriteFileBytes", 3, @"Could not malloc- out of memory!", v217, v218, v219, v220, v243);
                  }
                  CFTypeRef cf = CFStringCreateWithFormat(0, 0, @"Could not malloc- out of memory!");
                  LOBYTE(v114) = 1;
                }
                v121 = v246;
              }
              goto LABEL_259;
            }
            if (DLShouldLog(3)) {
              _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "_DLWriteFile", 3, @"Could not open file stream from file at \"%@\"", v137, v138, v139, v140, (char)v60);
            }
            CFStringRef v133 = CFStringCreateWithFormat(0, 0, @"Could not open the file stream at %@", v60);
          }
          else
          {
            if (DLShouldLog(3)) {
              _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "_DLWriteFile", 3, @"Could not get file system file name from CFString \"%@\"", v129, v130, v131, v132, (char)v60);
            }
            CFStringRef v133 = CFStringCreateWithFormat(0, 0, @"Could not get a file system name for %@", v60);
          }
          CFTypeRef v141 = v133;
          LOBYTE(v114) = 0;
          CFTypeRef cf = v133;
          goto LABEL_266;
        }
        if (!DLShouldLog(4)) {
          return 0;
        }
        CFStringRef v16 = @"SendFileMessage called in HandlerThread, but StreamHandler is NULL";
LABEL_105:
        int v17 = 4;
        goto LABEL_11;
      case 0xDu:
        _DLHandlerThreadWriteMessage(a4, xmlData, (uint64_t)xmlData, a4, a5, a6, a7, a8, v243);
        return _DLHandlerThreadReadMessage(a4);
      case 0xEu:
        CFArrayRef v36 = (const __CFArray *)CFPropertyListCreateFromXMLData(0, xmlData, 0, 0);
        CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v36, 1);
        v38 = (__CFString *)CFArrayGetValueAtIndex(v36, 2);
        long long v264 = 0u;
        *(_OWORD *)v265 = 0u;
        long long v262 = 0u;
        long long v263 = 0u;
        long long context = 0u;
        long long v261 = 0u;
        _DLBulkOperationContextInit((uint64_t)&context, a4, (uint64_t)v38, 0, 0, 0);
        CFDataRef v45 = (const __CFData *)_DLCreateMessageDataV(@"DLMessageUploadFiles", 3, v39, v40, v41, v42, v43, v44, v38);
        int v46 = _DLSendDataAndDisconnectOnError(a4, v45);
        if (v46 && (!DWORD2(v264) || DWORD2(v264) == -13))
        {
          DWORD2(v264) = v46;
          if (v265[0]) {
            CFRelease(v265[0]);
          }
          v265[0] = @"Error sending header";
        }
        if (v45) {
          CFRelease(v45);
        }
        if (DWORD2(v264) && DWORD2(v264) != -13) {
          goto LABEL_173;
        }
        CFDictionaryApplyFunction(ValueAtIndex, (CFDictionaryApplierFunction)_DLUploadFilesFromDeviceCallback, &context);
        CFDataRef v47 = CFDataCreate(0, 0, 0);
        int v48 = _DLSendDataAndDisconnectOnError(a4, v47);
        if (v48 && (!DWORD2(v264) || DWORD2(v264) == -13))
        {
          DWORD2(v264) = v48;
          if (v265[0]) {
            CFRelease(v265[0]);
          }
          v265[0] = @"Error sending footer";
        }
        if (!v47) {
          goto LABEL_166;
        }
        v49 = v47;
        goto LABEL_165;
      case 0xFu:
        CFArrayRef v36 = (const __CFArray *)CFPropertyListCreateFromXMLData(0, xmlData, 0, 0);
        CFDictionaryRef v64 = (const __CFDictionary *)CFArrayGetValueAtIndex(v36, 1);
        v65 = CFArrayGetValueAtIndex(v36, 2);
        v66 = (__CFString *)copyKeysFromDictionary(v64);
        long long v264 = 0u;
        *(_OWORD *)v265 = 0u;
        long long v262 = 0u;
        long long v263 = 0u;
        long long context = 0u;
        long long v261 = 0u;
        _DLBulkOperationContextInit((uint64_t)&context, a4, (uint64_t)v65, 0, 0, 0);
        CFDataRef v73 = (const __CFData *)_DLCreateMessageDataV(@"DLMessageDownloadFiles", 4, v67, v68, v69, v70, v71, v72, v66);
        int v74 = _DLSendDataAndDisconnectOnError(a4, v73);
        if (v74 && (!DWORD2(v264) || DWORD2(v264) == -13))
        {
          DWORD2(v264) = v74;
          if (v265[0]) {
            CFRelease(v265[0]);
          }
          v265[0] = @"Error sending header";
        }
        if (v73) {
          CFRelease(v73);
        }
        if (v66) {
          CFRelease(v66);
        }
        int v75 = DWORD2(v264);
        if (DWORD2(v264) && DWORD2(v264) != -13) {
          goto LABEL_173;
        }
        if (DWORD2(v264)) {
          goto LABEL_81;
        }
        while (2)
        {
          CFDataRef v76 = _DLHandlerThreadReadMessage(a4);
          if (v76)
          {
            CFDataRef v77 = v76;
            if (!CFDataGetLength(v76))
            {
              v49 = v77;
LABEL_165:
              CFRelease(v49);
LABEL_166:
              CFDataRef v142 = _DLHandlerThreadReadMessage(a4);
              if (v142)
              {
                CFDataRef v258 = 0;
                CFDataRef theData = 0;
                int v143 = _DLGetStatusResponseFromData(v142, &v258, (CFStringRef *)&theData);
                _DLBulkOperationContextMergeResults((uint64_t)&context, v143, (uint64_t)theData, v258);
              }
              else if (!DWORD2(v264) || DWORD2(v264) == -13)
              {
                DWORD2(v264) = -1;
                if (v265[0]) {
                  CFRelease(v265[0]);
                }
                v265[0] = @"Error reading status response";
              }
LABEL_173:
              if (v36) {
                CFRelease(v36);
              }
              CFTypeRef v144 = _DLCreateStatusResponseData(SDWORD2(v264));
              _DLBulkOperationContextDealloc((uint64_t)&context);
              return (CFDataRef)v144;
            }
            CFStringRef v78 = DLCreateStringFromData(v77);
            CFRelease(v77);
            if (v78)
            {
              CFStringRef v79 = (const __CFString *)CFDictionaryGetValue(v64, v78);
              if (v79)
              {
                _DLDownloadFileToDevice((uint64_t)&context, v78, v79);
                CFRelease(v78);
                int v75 = DWORD2(v264);
                if (DWORD2(v264))
                {
LABEL_81:
                  if (v75 != -13) {
                    goto LABEL_166;
                  }
                }
                continue;
              }
              if (!DWORD2(v264) || DWORD2(v264) == -13)
              {
                DWORD2(v264) = -1;
                if (v265[0]) {
                  CFRelease(v265[0]);
                }
                v265[0] = @"Received unexpected from path";
              }
              v49 = v78;
              goto LABEL_165;
            }
            if (DWORD2(v264) && DWORD2(v264) != -13) {
              goto LABEL_166;
            }
            DWORD2(v264) = -1;
            if (v265[0]) {
              CFRelease(v265[0]);
            }
            v136 = @"Error creating from path";
          }
          else
          {
            if (DWORD2(v264) && DWORD2(v264) != -13) {
              goto LABEL_166;
            }
            DWORD2(v264) = -1;
            if (v265[0]) {
              CFRelease(v265[0]);
            }
            v136 = @"Error reading request";
          }
          break;
        }
        v265[0] = v136;
        goto LABEL_166;
      default:
        if (!DLShouldLog(3)) {
          return 0;
        }
        char v243 = v10;
        CFStringRef v16 = @"DLHandlerThreadMessagePortCallback called with an unknown message: %d";
        goto LABEL_10;
    }
  }
  if (DLShouldLog(3))
  {
    CFStringRef v16 = @"Handler thread can't get connection from info parameter, just returning";
LABEL_10:
    int v17 = 3;
LABEL_11:
    _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "_DLHandlerThreadMessagePortCallback", v17, v16, v12, v13, v14, v15, v243);
  }
  return 0;
}

void _DLRequestRead(uint64_t a1)
{
  if (sSaveCallHistory == 1) {
    _DLCallHistoryAddEntry(@"RequestRead");
  }
  *(unsigned char *)(a1 + 145) = 1;
  uint64_t v2 = *(__CFMessagePort **)(a1 + 104);
  if (v2)
  {
    DLThreadSendMessage(v2, 5, 0);
  }
  else
  {
    CFRunLoopSourceSignal(*(CFRunLoopSourceRef *)(a1 + 112));
    Current = CFRunLoopGetCurrent();
    CFRunLoopWakeUp(Current);
  }
}

void _DLCallHistoryMain(__CFString *a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v3 = (__CFString *)CFStringCreateWithFormat(0, 0, @"%@ : %@", a1, a2);
    _DLCallHistoryAddEntry(v3);
    if (v3 != a1)
    {
      CFRelease(v3);
    }
  }
  else
  {
    _DLCallHistoryAddEntry(a1);
  }
}

void _DLRequestWriteV(uint64_t a1, const void *a2, int a3, __CFString **a4)
{
  if (sSaveCallHistory == 1) {
    _DLCallHistoryMain(@"RequestWrite", (uint64_t)a2);
  }
  CFDataRef v8 = (const __CFData *)_DLCreateMessageDataWithArgs(a2, a3, a4);
  if (v8)
  {
    uint64_t v9 = *(__CFMessagePort **)(a1 + 104);
    _SendMessage(a1, v9, (void (*)(void, uint64_t, const __CFData *, uint64_t))_DLHandlerThreadMessagePortCallback, 6, v8);
  }
}

CFTypeRef _DLCreateMessageDataWithArgs(const void *a1, int a2, __CFString **a3)
{
  int v3 = a2;
  CFStringRef errorString = 0;
  uint64_t v28 = a3;
  Mutable = CFArrayCreateMutable(0, a2 + 1, MEMORY[0x263EFFF70]);
  CFArrayAppendValue(Mutable, a1);
  if (v3 >= 1)
  {
    do
    {
      uint64_t v6 = v28++;
      uint64_t v7 = *v6;
      if (v7) {
        CFDataRef v8 = v7;
      }
      else {
        CFDataRef v8 = @"___EmptyParameterString___";
      }
      CFArrayAppendValue(Mutable, v8);
      --v3;
    }
    while (v3);
  }
  uint64_t v9 = CFWriteStreamCreateWithAllocatedBuffers(0, 0);
  unsigned int v10 = v9;
  if (v9 && CFWriteStreamOpen(v9))
  {
    if (CFPropertyListIsValid(Mutable, kCFPropertyListBinaryFormat_v1_0))
    {
      CFIndex v11 = CFPropertyListWriteToStream(Mutable, v10, kCFPropertyListBinaryFormat_v1_0, &errorString);
      CFRelease(Mutable);
      if (v11)
      {
        CFTypeRef v12 = CFWriteStreamCopyProperty(v10, (CFStreamPropertyKey)*MEMORY[0x263EFFE98]);
      }
      else
      {
        if (DLShouldLog(3)) {
          _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "_DLCreateMessageDataWithArgs", 3, @"Could not write property list to message data stream: '%@'", v22, v23, v24, v25, (char)errorString);
        }
        if (errorString)
        {
          CFRelease(errorString);
          CFTypeRef v12 = 0;
          CFStringRef errorString = 0;
        }
        else
        {
          CFTypeRef v12 = 0;
        }
      }
      CFWriteStreamClose(v10);
      Mutable = v10;
      goto LABEL_25;
    }
    if (DLShouldLog(3)) {
      _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "_DLCreateMessageDataWithArgs", 3, @"Plist is not valid: %@", v18, v19, v20, v21, (char)Mutable);
    }
  }
  else
  {
    if (DLShouldLog(3)) {
      _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "_DLCreateMessageDataWithArgs", 3, @"Could not open stream for writing message data", v13, v14, v15, v16, v26);
    }
    if (v10) {
      CFRelease(v10);
    }
  }
  CFTypeRef v12 = 0;
  CFTypeRef result = 0;
  if (Mutable)
  {
LABEL_25:
    CFRelease(Mutable);
    return v12;
  }
  return result;
}

void _SendMessage(uint64_t a1, __CFMessagePort *a2, void (*a3)(void, uint64_t, const __CFData *, uint64_t), uint64_t a4, const __CFData *a5)
{
  if (a2)
  {
    DLThreadSendMessage(a2, a4, a5);
  }
  else
  {
    a3(0, a4, a5, a1);
    if (a5)
    {
      CFRelease(a5);
    }
  }
}

void _DLRequestWrite(uint64_t a1, const void *a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, __CFString *a9)
{
}

CFStringRef _DLGetParameterAtIndexWithDefaultValue(const __CFArray *a1, CFIndex a2, uint64_t a3)
{
  if (CFArrayGetCount(a1) <= a2)
  {
    if (DLShouldLog(3)) {
      _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "_DLGetParameterAtIndexWithDefaultValue", 3, @"Error in DeviceLinkConnection, requested parameter at index %d is beyond the end of the parameter array: %@", v8, v9, v10, v11, a2);
    }
  }
  else
  {
    CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(a1, a2);
    CFTypeID v7 = CFGetTypeID(ValueAtIndex);
    if (v7 == CFStringGetTypeID())
    {
      if (CFStringCompare(ValueAtIndex, @"___EmptyParameterString___", 0)) {
        return ValueAtIndex;
      }
    }
    else
    {
      return ValueAtIndex;
    }
  }
  return (const __CFString *)a3;
}

CFStringRef _DLGetParameterAtIndex(const __CFArray *a1, CFIndex a2)
{
  return _DLGetParameterAtIndexWithDefaultValue(a1, a2, 0);
}

void _DLHandlerThreadWriteMessage(uint64_t a1, const __CFData *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  if (*(void *)(a1 + 64))
  {
    _DLSendDataAndDisconnectOnError(a1, a2);
  }
  else if (DLShouldLog(4))
  {
    _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "_DLHandlerThreadWriteMessage", 4, @"WriteMessage called in HandlerThread, but StreamHandler is NULL", v9, v10, v11, v12, a9);
  }
}

uint64_t _DLSendDataAndDisconnectOnError(uint64_t a1, CFDataRef theData)
{
  if (theData)
  {
    BytePtr = CFDataGetBytePtr(theData);
    unsigned int Length = CFDataGetLength(theData);
    return _DLSendBytesAndDisconnectOnError(a1, (uint64_t)BytePtr, Length);
  }
  else
  {
    return DLSetStatus(4294967293, 0, @"_DLSendDataAndDisconnectOnError: data parameter is NULL");
  }
}

CFDataRef _DLHandlerThreadReadMessage(uint64_t a1)
{
  CFDataRef v13 = 0;
  CFTypeRef cf = 0;
  uint64_t v1 = *(void *)(a1 + 64);
  if (v1)
  {
    if (StreamHandlerReceive(v1, &v13, &cf))
    {
      if (DLShouldLog(3)) {
        _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "_DLHandlerThreadReadMessage", 3, @"Could not receive message: '%@'", v2, v3, v4, v5, (char)cf);
      }
      if (v13) {
        CFRelease(v13);
      }
      CFDataRef v13 = 0;
    }
    if (cf) {
      CFRelease(cf);
    }
  }
  else if (DLShouldLog(4))
  {
    _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "_DLHandlerThreadReadMessage", 4, @"ReadMessage called in HandlerThread, but StreamHandler is NULL", v6, v7, v8, v9, v11);
  }
  return v13;
}

uint64_t _DLCreateDeviceLinkConnectionForDevice(int a1, void (**a2)(uint64_t a1), uint64_t a3, uint64_t a4, uint64_t *a5, uint64_t a6, int a7, CFTypeRef *a8)
{
  if (!a2)
  {
    uint64_t v15 = @"_DLCreateDeviceLinkConnectionForDevice: Callbacks parameter is NULL";
LABEL_7:
    uint64_t v16 = 4294967293;
    goto LABEL_9;
  }
  if (!a5)
  {
    uint64_t v15 = @"_DLCreateDeviceLinkConnectionForDevice: Connection [out] parameter is NULL";
    goto LABEL_7;
  }
  uint64_t v13 = _DLCreateDeviceLinkConnection(@"Device", a1, a2, a3, a4);
  if (v13)
  {
    *(void *)(v13 + 48) = a2;
    *(void *)(v13 + 24) = a6;
    *(_DWORD *)(v13 + 32) = -1;
    *(_DWORD *)(v13 + 36) = a7;
    *a5 = v13;
    return 0;
  }
  uint64_t v15 = @"_DLCreateDeviceLinkConnectionForDevice: Could not create a connection";
  uint64_t v16 = 0xFFFFFFFFLL;
LABEL_9:

  return DLSetStatus(v16, a8, v15);
}

uint64_t _DLCreateDeviceLinkConnection(const void *a1, int a2, void (**a3)(uint64_t a1), uint64_t a4, uint64_t a5)
{
  Boolean keyExistsAndHasValidFormat = 0;
  AppBooleanchar Value = CFPreferencesGetAppBooleanValue(@"SaveCallHistory", @"com.apple.DeviceLink", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat == 1 && AppBooleanValue == 1)
  {
    if (DLShouldLog(4)) {
      _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "_DLCreateDeviceLinkConnection", 4, @"Turning on call history for DeviceLink", v12, v13, v14, v15, v29);
    }
    sSaveCallHistory = 1;
    sCallHistoryMutex = (uint64_t)DLCreateMutex();
  }
  if (!*a3) {
    *a3 = genericIncomingConnectionCallback;
  }
  if (!a3[1]) {
    a3[1] = (void (*)(uint64_t))genericConnectionMadeCallback;
  }
  if (!a3[2]) {
    a3[2] = (void (*)(uint64_t))genericConnectionFailedCallback;
  }
  if (!a3[3]) {
    a3[3] = (void (*)(uint64_t))genericAcceptFailedCallback;
  }
  if (!a3[4]) {
    a3[4] = (void (*)(uint64_t))genericDisconnectCallback;
  }
  if (!a3[5]) {
    a3[5] = (void (*)(uint64_t))genericConnectionLostCallback;
  }
  if (!a3[6]) {
    a3[6] = (void (*)(uint64_t))genericProcessMessageCallback;
  }
  if (!a3[7]) {
    a3[7] = (void (*)(uint64_t))genericPingCallback;
  }
  if (!a3[8]) {
    a3[8] = (void (*)(uint64_t))genericRequestFileCallback;
  }
  if (!a3[9]) {
    a3[9] = (void (*)(uint64_t))genericSendFileCallback;
  }
  uint64_t v16 = malloc_type_calloc(0xD8uLL, 1uLL, 0xA20F246DuLL);
  uint64_t v17 = (uint64_t)v16;
  v16[5] = a3;
  v16[1] = a4;
  v16[2] = a5;
  *((unsigned char *)v16 + 146) = 1;
  *uint64_t v16 = 0;
  if (a2)
  {
    v16[14] = 0;
    CFTypeRef v18 = CFRetain(a1);
    *(void *)(v17 + 72) = v18;
    char v30 = (char)v18;
    CFStringRef v19 = CFStringCreateWithFormat(0, 0, @"%@.%@");
    *(void *)(v17 + 80) = DLThreadCreateReceivePort((uint64_t)v19, v17, (uint64_t)_DLMainThreadMessagePortCallback);
    *(void *)(v17 + 96) = DLThreadCreateSendPort((uint64_t)v19);
    if (v19) {
      CFRelease(v19);
    }
    uint64_t v20 = *(__CFMessagePort **)(v17 + 80);
    if (!v20 || !*(void *)(v17 + 96)) {
      goto LABEL_37;
    }
    DLThreadAddMessagePortToRunloop(v20);
    *(void *)(v17 + 128) = DLCreateCondition();
    *(void *)(v17 + 136) = DLCreateMutex();
    *(unsigned char *)(v17 + 144) = 0;
    if (DLThreadCreateThread((void *(__cdecl *)(void *))_DLHandlerThreadEntryPoint, (void *)v17))
    {
      if (DLShouldLog(3)) {
        _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "_DLSetupHandlerThreadAndMessagePorts", 3, @"Could not create a message handler thread", v21, v22, v23, v24, v30);
      }
LABEL_37:
      free((void *)v17);
      return 0;
    }
    DLWait(*(pthread_cond_t **)(v17 + 128), *(pthread_mutex_t **)(v17 + 136), (unsigned char *)(v17 + 144));
  }
  else
  {
    context.version = 0;
    memset(&context.retain, 0, 56);
    context.info = v16;
    context.perform = (void (__cdecl *)(void *))_RunLoopReadSourceCallback;
    v16[12] = 0;
    v16[13] = 0;
    v16[14] = CFRunLoopSourceCreate(0, 0, &context);
    Current = CFRunLoopGetCurrent();
    CFRunLoopAddSource(Current, *(CFRunLoopSourceRef *)(v17 + 112), (CFRunLoopMode)*MEMORY[0x263EFFE78]);
  }
  context.version = 0;
  *(void *)(v17 + 160) = CFNumberCreate(0, kCFNumberDoubleType, &context);
  int valuePtr = 0;
  *(void *)(v17 + 168) = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
  AppIntegerchar Value = CFPreferencesGetAppIntegerValue(@"BufferSize", @"com.apple.DeviceLink", 0);
  if (AppIntegerValue) {
    size_t v27 = AppIntegerValue + 1;
  }
  else {
    size_t v27 = 262145;
  }
  *(void *)(v17 + 184) = v27;
  *(void *)(v17 + 176) = malloc_type_malloc(v27, 0x44C1A3D8uLL);
  return v17;
}

uint64_t _DLCreateDeviceLinkConnectionForComputer(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5, uint64_t a6, int a7, CFTypeRef *a8)
{
  if (!a2)
  {
    uint64_t v15 = @"_DLCreateDeviceLinkConnectionForComputer: Callbacks parameter is NULL";
LABEL_9:
    uint64_t v16 = 4294967293;
    goto LABEL_10;
  }
  if (!*(void *)(a2 + 88))
  {
    uint64_t v15 = @"_DLCreateDeviceLinkConnectionForComputer: DeviceReady callback is NULL";
    goto LABEL_9;
  }
  if (!a5)
  {
    uint64_t v15 = @"_DLCreateDeviceLinkConnectionForComputer: Connection [out] parameter is NULL";
    goto LABEL_9;
  }
  uint64_t v13 = _DLCreateDeviceLinkConnection(@"Computer", a1, (void (**)(uint64_t))a2, a3, a4);
  if (v13)
  {
    *(void *)(v13 + 56) = a2;
    *(void *)(v13 + 24) = a6;
    *(_DWORD *)(v13 + 32) = -1;
    *(_DWORD *)(v13 + 36) = a7;
    *a5 = v13;
    return 0;
  }
  uint64_t v15 = @"_DLCreateDeviceLinkConnectionForComputer: Could not create a connection";
  uint64_t v16 = 0xFFFFFFFFLL;
LABEL_10:

  return DLSetStatus(v16, a8, v15);
}

uint64_t DLCreateDeviceLinkConnectionForDevice(int a1, void (**a2)(uint64_t a1), uint64_t a3, void *a4, CFTypeRef *a5)
{
  if (!a2)
  {
    uint64_t v10 = @"DLCreateDeviceLinkConnectionForDevice: Callbacks parameter is NULL";
LABEL_7:
    uint64_t v11 = 4294967293;
    goto LABEL_9;
  }
  if (!a4)
  {
    uint64_t v10 = @"DLCreateDeviceLinkConnectionForDevice: Connection [out] parameter is NULL";
    goto LABEL_7;
  }
  uint64_t v8 = (void *)_DLCreateDeviceLinkConnection(@"Device", a1, a2, a3, 0);
  if (v8)
  {
    v8[6] = a2;
    v8[3] = 0;
    v8[4] = 0xFFFFFFFFLL;
    *a4 = v8;
    return 0;
  }
  uint64_t v10 = @"DLCreateDeviceLinkConnectionForDevice: Could not create a connection";
  uint64_t v11 = 0xFFFFFFFFLL;
LABEL_9:

  return DLSetStatus(v11, a5, v10);
}

uint64_t DLCreateDeviceLinkConnectionForComputer(int a1, uint64_t a2, uint64_t a3, void *a4, CFTypeRef *a5)
{
  if (!a2)
  {
    uint64_t v10 = @"DLCreateDeviceLinkConnectionForComputer: Callbacks parameter is NULL";
LABEL_9:
    uint64_t v11 = 4294967293;
    goto LABEL_10;
  }
  if (!*(void *)(a2 + 88))
  {
    uint64_t v10 = @"DLCreateDeviceLinkConnectionForComputer: DeviceReady callback is NULL";
    goto LABEL_9;
  }
  if (!a4)
  {
    uint64_t v10 = @"DLCreateDeviceLinkConnectionForComputer: Connection [out] parameter is NULL";
    goto LABEL_9;
  }
  uint64_t v8 = (void *)_DLCreateDeviceLinkConnection(@"Computer", a1, (void (**)(uint64_t))a2, a3, 0);
  if (v8)
  {
    v8[7] = a2;
    v8[3] = 0;
    v8[4] = 0xFFFFFFFFLL;
    *a4 = v8;
    return 0;
  }
  uint64_t v10 = @"DLCreateDeviceLinkConnectionForDevice: Could not create a connection";
  uint64_t v11 = 0xFFFFFFFFLL;
LABEL_10:

  return DLSetStatus(v11, a5, v10);
}

uint64_t DLDeleteDeviceLinkConnection(uint64_t a1)
{
  *(_DWORD *)a1 = 5;
  uint64_t v2 = *(const void **)(a1 + 72);
  if (v2)
  {
    CFRelease(v2);
    *(void *)(a1 + 72) = 0;
  }
  DLDeleteCondition(*(pthread_cond_t **)(a1 + 128));
  DLDeleteMutex(*(pthread_mutex_t **)(a1 + 136));
  uint64_t v3 = *(const void **)(a1 + 152);
  if (v3)
  {
    CFRelease(v3);
    *(void *)(a1 + 152) = 0;
  }
  uint64_t v4 = *(const void **)(a1 + 160);
  if (v4)
  {
    CFRelease(v4);
    *(void *)(a1 + 160) = 0;
  }
  uint64_t v5 = *(const void **)(a1 + 168);
  if (v5)
  {
    CFRelease(v5);
    *(void *)(a1 + 168) = 0;
  }
  free(*(void **)(a1 + 176));
  *(void *)(a1 + 176) = 0;
  uint64_t v12 = *(FILE **)(a1 + 192);
  if (v12)
  {
    fclose(v12);
    *(void *)(a1 + 192) = 0;
  }
  CFDataRef v13 = (const __CFData *)_DLCreateMessageDataV(@"DLMessageDisconnect", 1, v6, v7, v8, v9, v10, v11, @"Connection is being deleted");
  if (sSaveCallHistory == 1) {
    _DLCallHistoryAddEntry(@"Exit (Delete Connection)");
  }
  _SendMessage(a1, *(__CFMessagePort **)(a1 + 104), (void (*)(void, uint64_t, const __CFData *, uint64_t))_DLHandlerThreadMessagePortCallback, 8, v13);
  DLRegenerateUniqueProcessName();
  return 0;
}

CFTypeRef _DLCreateMessageDataV(const void *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, __CFString *a9)
{
  return _DLCreateMessageDataWithArgs(a1, a2, &a9);
}

uint64_t DLGetDeviceLinkConnectionContext(uint64_t a1)
{
  return *(void *)(a1 + 8);
}

uint64_t _DLCheckForDisconnect(_DWORD *a1, _DWORD *a2, void *a3)
{
  if (*a1 != 4) {
    return 0;
  }
  if (a2) {
    *a2 = -14;
  }
  if (a3) {
    *a3 = @"Disconnected";
  }
  return 1;
}

uint64_t DLGetDeviceLinkConnectionInfo(uint64_t a1)
{
  return *(void *)(a1 + 120);
}

uint64_t DLLockdownCheckin(__CFDictionary *a1)
{
  uint64_t v17 = 0;
  int v2 = secure_lockdown_checkin();
  if (v2)
  {
    char v3 = v2;
    if (DLShouldLog(3)) {
      _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "DLLockdownCheckin", 3, @"Could not check in with lockdown: %d", v4, v5, v6, v7, v3);
    }
    return 0xFFFFFFFFLL;
  }
  else
  {
    lockdown_get_securecontext();
    int valuePtr = lockdown_get_socket();
    if (DLShouldLog(6))
    {
      char v9 = DLGetProcessName();
      _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "DLLockdownCheckin", 6, @"%@ launched from lockdown on socket %d with%s SSL", v10, v11, v12, v13, v9);
    }
    CFDictionarySetValue(a1, @"DLInfoStreamTypeKey", @"DLInfoStreamTypeTCP");
    CFDictionarySetValue(a1, @"DLInfoLockdownAccept", (const void *)*MEMORY[0x263EFFB40]);
    CFNumberRef v14 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
    CFDictionarySetValue(a1, @"DLInfoSocketKey", v14);
    if (v14) {
      CFRelease(v14);
    }
    CFNumberRef v15 = CFNumberCreate(0, kCFNumberNSIntegerType, &v17);
    CFDictionarySetValue(a1, @"DLInfoLockdownConnection", v15);
    if (v15) {
      CFRelease(v15);
    }
    return 0;
  }
}

uint64_t DLLockdownXPCCheckin(const void *a1, const void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (!a1) {
    DLLockdownXPCCheckin_cold_1();
  }
  if (!a2) {
    DLLockdownXPCCheckin_cold_2();
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136446210;
    uint64_t v11 = a1;
    _os_log_impl(&dword_238827000, &_os_log_internal, OS_LOG_TYPE_INFO, "lockdown_checkin_xpc, serviceName:%{public}s", buf, 0xCu);
  }
  uint64_t v4 = dispatch_group_create();
  dispatch_group_enter(v4);
  dispatch_retain(v4);
  CFRetain(a2);
  int v5 = lockdown_checkin_xpc();
  if (v5)
  {
    int v6 = v5;
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      DLLockdownXPCCheckin_cold_4(v6);
    }
    dispatch_release(v4);
    dispatch_release(v4);
    CFRelease(a2);
    return 0xFFFFFFFFLL;
  }
  dispatch_time_t v7 = dispatch_time(0, 600000000000);
  intptr_t v8 = dispatch_group_wait(v4, v7);
  dispatch_release(v4);
  if (v8)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      DLLockdownXPCCheckin_cold_3();
    }
    return 0xFFFFFFFFLL;
  }
  uint64_t result = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO);
  if (result)
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v11 = a2;
    _os_log_impl(&dword_238827000, &_os_log_internal, OS_LOG_TYPE_INFO, "lockdown_checkin_xpc succeeded: %@", buf, 0xCu);
    return 0;
  }
  return result;
}

void __DLLockdownXPCCheckin_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v12 = a2;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v14 = a3;
    _os_log_impl(&dword_238827000, &_os_log_internal, OS_LOG_TYPE_INFO, "lockdown_checkin_xpc connection handler called: %@", buf, 0xCu);
  }
  if ((atomic_exchange(DLLockdownXPCCheckin_sCheckInDone, 1u) & 1) == 0)
  {
    secureCFRunLoopSourceContext context = lockdown_get_securecontext();
    int socket = lockdown_get_socket();
    int valuePtr = socket;
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = DLGetProcessName();
      intptr_t v8 = "";
      *(_DWORD *)buf = 138543874;
      uint64_t v14 = v7;
      if (!securecontext) {
        intptr_t v8 = "out";
      }
      __int16 v15 = 1024;
      int v16 = socket;
      __int16 v17 = 2080;
      CFTypeRef v18 = v8;
      _os_log_impl(&dword_238827000, &_os_log_internal, OS_LOG_TYPE_INFO, "%{public}@ launched from lockdown on socket %d with%s SSL", buf, 0x1Cu);
    }
    CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 32), @"DLInfoStreamTypeKey", @"DLInfoStreamTypeTCP");
    CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 32), @"DLInfoLockdownAccept", (const void *)*MEMORY[0x263EFFB40]);
    CFNumberRef v9 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
    CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 32), @"DLInfoSocketKey", v9);
    if (v9) {
      CFRelease(v9);
    }
    CFNumberRef v10 = CFNumberCreate(0, kCFNumberNSIntegerType, &v12);
    CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 32), @"DLInfoLockdownConnection", v10);
    if (v10) {
      CFRelease(v10);
    }
    CFRelease(*(CFTypeRef *)(a1 + 32));
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
    dispatch_release(*(dispatch_object_t *)(a1 + 40));
  }
}

uint64_t DLWaitForConnection(uint64_t a1, CFTypeRef cf, CFTypeRef *a3)
{
  if (*(_DWORD *)a1 == 1)
  {
    if (DLShouldLog(4)) {
      _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "DLWaitForConnection", 4, @"DLWaitForConnection called, but already waiting for a connection", v3, v4, v5, v6, v23);
    }
    return 0;
  }
  *(_DWORD *)a1 = 1;
  CFTypeRef v9 = *(CFTypeRef *)(a1 + 120);
  if (cf)
  {
    if (v9 == cf)
    {
      CFTypeRef v9 = cf;
    }
    else
    {
      if (v9)
      {
        CFRelease(v9);
        *(void *)(a1 + 120) = 0;
      }
      CFTypeRef v9 = CFRetain(cf);
      *(void *)(a1 + 120) = v9;
    }
    goto LABEL_14;
  }
  if (v9)
  {
LABEL_14:
    if (CFDictionaryContainsKey((CFDictionaryRef)v9, @"DLInfoSessionNumberKey"))
    {
      CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 120), @"DLInfoSessionNumberKey");
      CFNumberGetValue(Value, kCFNumberSInt32Type, (void *)(a1 + 4));
    }
    else
    {
      sConnectionSerial = (sConnectionSerial & 0xFFFFFF00) + 256;
      *(_DWORD *)(a1 + 4) = sConnectionSerial;
    }
    if (DLShouldLog(7)) {
      _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "DLWaitForConnection", 7, @"Next expected session number: %d, connection %p", v12, v13, v14, v15, BYTE1(*(_DWORD *)(a1 + 4)));
    }
    int v16 = CFDictionaryContainsKey(*(CFDictionaryRef *)(a1 + 120), @"DLInfoAllowSleepKey");
    BOOL v17 = DLShouldLog(6);
    if (v16)
    {
      if (v17) {
        _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "DLWaitForConnection", 6, @"Allowing sleep during connections", v18, v19, v20, v21, v23);
      }
      *(unsigned char *)(a1 + 146) = 0;
    }
    else if (v17)
    {
      _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "DLWaitForConnection", 6, @"Preventing sleep during connections", v18, v19, v20, v21, v23);
    }
    *(unsigned char *)(a1 + 145) = 1;
    if (sSaveCallHistory == 1) {
      _DLCallHistoryAddEntry(@"Accept");
    }
    uint64_t v22 = *(__CFMessagePort **)(a1 + 104);
    if (v22) {
      DLThreadSendMessage(v22, 1, 0);
    }
    else {
      _DLHandlerThreadMessagePortCallback(0, 1, 0, a1, v18, v19, v20, v21);
    }
    return 0;
  }

  return DLSetStatus(4294967293, a3, @"DLWaitForConnection: info parameter is NULL and no info previously set");
}

uint64_t DLConnect(uint64_t a1, CFTypeRef cf, CFTypeRef *a3)
{
  *(_DWORD *)a1 = 2;
  CFTypeRef v4 = *(CFTypeRef *)(a1 + 120);
  if (cf)
  {
    if (v4 == cf)
    {
      CFTypeRef v4 = cf;
    }
    else
    {
      if (v4) {
        CFRelease(v4);
      }
      *(void *)(a1 + 120) = cf;
      CFRetain(cf);
      CFTypeRef v4 = *(CFTypeRef *)(a1 + 120);
    }
    goto LABEL_11;
  }
  if (v4)
  {
LABEL_11:
    if (CFDictionaryContainsKey((CFDictionaryRef)v4, @"DLInfoSessionNumberKey"))
    {
      CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 120), @"DLInfoSessionNumberKey");
      CFNumberGetValue(Value, kCFNumberSInt32Type, (void *)(a1 + 4));
    }
    else
    {
      sConnectionSerial = (sConnectionSerial & 0xFFFFFF00) + 256;
      *(_DWORD *)(a1 + 4) = sConnectionSerial;
    }
    if (DLShouldLog(7)) {
      _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "DLConnect", 7, @"Next expected session number: %d, connection: %p", v8, v9, v10, v11, BYTE1(*(_DWORD *)(a1 + 4)));
    }
    int v12 = CFDictionaryContainsKey(*(CFDictionaryRef *)(a1 + 120), @"DLInfoAllowSleepKey");
    BOOL v13 = DLShouldLog(5);
    if (v12)
    {
      if (v13) {
        _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "DLConnect", 5, @"Allowing sleep during connections", v14, v15, v16, v17, v23);
      }
      *(unsigned char *)(a1 + 146) = 0;
    }
    else if (v13)
    {
      _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "DLConnect", 5, @"Preventing sleep during connections", v14, v15, v16, v17, v23);
    }
    *(unsigned char *)(a1 + 145) = 1;
    if (sSaveCallHistory == 1) {
      _DLCallHistoryAddEntry(@"Connect");
    }
    if (DLShouldLog(6)) {
      _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "DLConnect", 6, @"Sending connect message to handler thread", v18, v19, v20, v21, v23);
    }
    uint64_t v22 = *(__CFMessagePort **)(a1 + 104);
    if (v22) {
      DLThreadSendMessage(v22, 3, 0);
    }
    else {
      _DLHandlerThreadMessagePortCallback(0, 3, 0, a1, v18, v19, v20, v21);
    }
    return 0;
  }

  return DLSetStatus(4294967293, a3, @"DLConnect: info parameter is NULL and no info previously set");
}

uint64_t DLWaitForMessage(uint64_t a1)
{
  if (sSaveCallHistory == 1) {
    _DLCallHistoryAddEntry(@"WaitForMessage");
  }
  _DLRequestRead(a1);
  return 0;
}

uint64_t DLDeviceReady(uint64_t a1, CFTypeRef *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (*(void *)(a1 + 48))
  {
    _DLRequestWrite(a1, @"DLMessageDeviceReady", 0, a4, a5, a6, a7, a8, v10);
    _DLRequestRead(a1);
    *(_DWORD *)a1 = 3;
    return 0;
  }
  else
  {
    return DLSetStatus(4294967292, a2, @"DLDeviceReady: Computer cannot call this method");
  }
}

uint64_t DLDisconnect(uint64_t a1, __CFString *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  CFDataRef v9 = (const __CFData *)_DLCreateMessageDataV(@"DLMessageDisconnect", 1, a3, a4, a5, a6, a7, a8, a2);
  if (sSaveCallHistory == 1) {
    _DLCallHistoryAddEntry(@"Disconnect");
  }
  _SendMessage(a1, *(__CFMessagePort **)(a1 + 104), (void (*)(void, uint64_t, const __CFData *, uint64_t))_DLHandlerThreadMessagePortCallback, 7, v9);
  *(_DWORD *)a1 = 4;
  return 0;
}

uint64_t DLProcessMessage(uint64_t a1, __CFString *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return 0;
}

uint64_t DLPing(uint64_t a1, __CFString *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return 0;
}

uint64_t DLRequestFile(uint64_t a1, __CFString *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!a2) {
    return 4294967293;
  }
  CFDataRef v9 = (const __CFData *)_DLCreateMessageDataV(@"DLRequestFile", 3, a3, a4, a5, a6, a7, a8, a2);
  if (sSaveCallHistory == 1) {
    _DLCallHistoryAddEntry(@"Request File");
  }
  _SendMessage(a1, *(__CFMessagePort **)(a1 + 104), (void (*)(void, uint64_t, const __CFData *, uint64_t))_DLHandlerThreadMessagePortCallback, 10, v9);
  _DLRequestRead(a1);
  return 0;
}

uint64_t DLSendFile(uint64_t a1, __CFString *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!a2) {
    return 4294967293;
  }
  CFDataRef v9 = (const __CFData *)_DLCreateMessageDataV(@"DLSendFile", 2, a3, a4, a5, a6, a7, a8, a2);
  if (sSaveCallHistory == 1) {
    _DLCallHistoryAddEntry(@"Send File");
  }
  _SendMessage(a1, *(__CFMessagePort **)(a1 + 104), (void (*)(void, uint64_t, const __CFData *, uint64_t))_DLHandlerThreadMessagePortCallback, 11, v9);
  return 0;
}

uint64_t DLHandleSentFilePieceEncrypted(uint64_t a1, const __CFData *a2, CFDictionaryRef theDict, const __CFData *a4, CFStringRef *a5)
{
  if (!a2) {
    return 0;
  }
  uint64_t v69 = 0;
  int valuePtr = 0;
  CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(theDict, @"DLFileStatusKey");
  if (Value) {
    CFNumberGetValue(Value, kCFNumberIntType, &valuePtr);
  }
  CFStringRef v11 = (const __CFString *)CFDictionaryGetValue(theDict, @"DLFileDest");
  CFNumberRef v12 = (const __CFNumber *)CFDictionaryGetValue(theDict, @"DLFileOffsetKey");
  uint64_t v67 = 0;
  if (v12) {
    CFNumberGetValue(v12, kCFNumberLongLongType, &v67);
  }
  if (!a4 || *(void *)(a1 + 200)) {
    goto LABEL_8;
  }
  if (v67)
  {
    if (!DLShouldLog(3)) {
      goto LABEL_33;
    }
    CFStringRef v34 = @"Encrypted bytes were received but we don't have a key to decrypt them with. Refusing to save the bytes";
    goto LABEL_32;
  }
  size_t dataOutMoved = 0;
  v37 = createFileKeyFromAuthBlob(a2, a4, (const __CFData **)&dataOutMoved, &v69);
  if (!v37)
  {
    if (!DLShouldLog(3))
    {
LABEL_33:
      if (a5) {
        *a5 = @"CouldNotDecrypt";
      }
      return 0xFFFFFFFFLL;
    }
    CFStringRef v34 = @"Could not decrypt the file encryption key. Refusing to decode this file";
LABEL_32:
    _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "DLHandleSentFilePieceEncrypted", 3, v34, v30, v31, v32, v33, v65);
    goto LABEL_33;
  }
  v38 = v37;
  BytePtr = CFDataGetBytePtr(v37);
  uint64_t v40 = CFDataGetBytePtr((CFDataRef)dataOutMoved);
  CCCryptorStatus v41 = CCCryptorCreate(1u, 0, 1u, BytePtr, 0x20uLL, v40, (CCCryptorRef *)(a1 + 200));
  if (v41)
  {
    char v42 = v41;
    if (DLShouldLog(3)) {
      _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "DLHandleSentFilePieceEncrypted", 3, @"Could not set up a decryptor: %d", v43, v44, v45, v46, v42);
    }
    if (a5) {
      *a5 = @"CouldNotDecrypt";
    }
    if (dataOutMoved) {
      CFRelease((CFTypeRef)dataOutMoved);
    }
    return 0xFFFFFFFFLL;
  }
  CFRelease(v38);
LABEL_8:
  if (!*(void *)(a1 + 192))
  {
    if (v11)
    {
      BOOL v13 = (const char *)DLCreateCStringFromCFString(v11);
      if (v13)
      {
        uint64_t v14 = (char *)v13;
        uint64_t v15 = fopen(v13, "w");
        *(void *)(a1 + 192) = v15;
        if (!v15)
        {
          if (a5) {
            *a5 = CFStringCreateWithFormat(0, 0, @"Could not open the file at \"%s\" for writing", v14);
          }
          free(v14);
          return 0xFFFFFFFFLL;
        }
        free(v14);
      }
    }
  }
  CFIndex Length = CFDataGetLength(a2);
  size_t v17 = Length;
  if (!a4)
  {
    uint64_t v20 = (UInt8 *)CFDataGetBytePtr(a2);
    goto LABEL_22;
  }
  if (!*(void *)(a1 + 200))
  {
    if (!DLShouldLog(3)) {
      goto LABEL_33;
    }
    CFStringRef v34 = @"We don't have a decryption key to decrypt these bytes. Refusing to save to disk";
    goto LABEL_32;
  }
  CFIndex v18 = Length + 16;
  uint64_t v19 = (UInt8 *)malloc_type_calloc(Length + 16, 1uLL, 0x44BFAC4EuLL);
  if (!v19)
  {
    if (a5)
    {
      CFIndex v35 = CFDataGetLength(a2);
      CFStringRef v36 = CFStringCreateWithFormat(0, 0, @"Could not allocate a buffer for %ld bytes of data: out of memory.", v35);
      uint64_t result = 0;
      *a5 = v36;
      return result;
    }
    return 0;
  }
  uint64_t v20 = v19;
  size_t dataOutMoved = 0;
  uint64_t v21 = *(_CCCryptor **)(a1 + 200);
  uint64_t v22 = CFDataGetBytePtr(a2);
  CCCryptorStatus v23 = CCCryptorUpdate(v21, &v22[v69], v17 - v69, v20, v17 + 16, &dataOutMoved);
  if (v23)
  {
    char v24 = v23;
    if (DLShouldLog(3)) {
      _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "DLHandleSentFilePieceEncrypted", 3, @"Could not decrypt file bytes: %d", v25, v26, v27, v28, v24);
    }
LABEL_19:
    free(v20);
    goto LABEL_33;
  }
  if (DLShouldLog(6)) {
    _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "DLHandleSentFilePieceEncrypted", 6, @"Decrypted %d bytes", v47, v48, v49, v50, dataOutMoved);
  }
  size_t v17 = dataOutMoved;
  if (valuePtr == 2)
  {
    if (DLShouldLog(6)) {
      _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "DLHandleSentFilePieceEncrypted", 6, @"Finalizing bytes and shutting down the decryptor", v51, v52, v53, v54, v65);
    }
    CCCryptorStatus v55 = CCCryptorFinal(*(CCCryptorRef *)(a1 + 200), &v20[dataOutMoved], v18 - dataOutMoved, &dataOutMoved);
    if (v55)
    {
      char v56 = v55;
      if (DLShouldLog(3)) {
        _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "DLHandleSentFilePieceEncrypted", 3, @"Could not finalize file bytes: %d", v57, v58, v59, v60, v56);
      }
      goto LABEL_19;
    }
    if (DLShouldLog(6)) {
      _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "DLHandleSentFilePieceEncrypted", 6, @"Finalized %d bytes", v61, v62, v63, v64, dataOutMoved);
    }
    v17 += dataOutMoved;
    CCCryptorRelease(*(CCCryptorRef *)(a1 + 200));
    *(void *)(a1 + 200) = 0;
  }
LABEL_22:
  fwrite(v20, v17, 1uLL, *(FILE **)(a1 + 192));
  if (v20 != CFDataGetBytePtr(a2)) {
    free(v20);
  }
  if ((valuePtr & 0xFFFFFFFE) != 2) {
    return 0;
  }
  fclose(*(FILE **)(a1 + 192));
  *(void *)(a1 + 192) = 0;
  uint64_t result = *(void *)(a1 + 200);
  if (result)
  {
    CCCryptorRelease((CCCryptorRef)result);
    uint64_t result = 0;
    *(void *)(a1 + 200) = 0;
  }
  return result;
}

uint64_t DLHandleSentFilePiece(uint64_t a1, const __CFData *a2, const __CFDictionary *a3, CFStringRef *a4)
{
  return DLHandleSentFilePieceEncrypted(a1, a2, a3, 0, a4);
}

uint64_t DLKillConnection(uint64_t a1)
{
  CFTypeRef cf = 0;
  if (*(_DWORD *)a1 == 1)
  {
    if (DLShouldLog(5))
    {
      CFStringRef v5 = @"Not killing waiting connection, because that would be rude";
      int v6 = 5;
LABEL_19:
      _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "DLKillConnection", v6, v5, v1, v2, v3, v4, v15);
    }
  }
  else
  {
    *(_DWORD *)(a1 + 4) = 0;
    if (DLShouldLog(7)) {
      _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "DLKillConnection", 7, @"Killing Connection. Next expected session number: %d, Connection: %p", v8, v9, v10, v11, BYTE1(*(_DWORD *)(a1 + 4)));
    }
    uint64_t v12 = *(void *)(a1 + 64);
    if (v12)
    {
      if (StreamHandlerClose(v12, &cf) && DLShouldLog(3)) {
        _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "DLKillConnection", 3, @"Closing the stream handler directly in DLKillConnection: '%@'", v8, v9, v10, v11, (char)cf);
      }
      if (cf)
      {
        CFRelease(cf);
        CFTypeRef cf = 0;
      }
    }
    if (sSaveCallHistory == 1) {
      _DLCallHistoryAddEntry(@"Kill");
    }
    BOOL v13 = *(__CFMessagePort **)(a1 + 104);
    if (v13) {
      DLThreadSendMessage(v13, 9, 0);
    }
    else {
      _DLHandlerThreadMessagePortCallback(0, 9, 0, a1, v8, v9, v10, v11);
    }
    if (DLShouldLog(7))
    {
      int v15 = *(int *)(a1 + 4) >> 8;
      CFStringRef v5 = @"After _SendMessage: %d, Connection: %p";
      int v6 = 7;
      goto LABEL_19;
    }
  }
  return 0;
}

uint64_t _DLGetStatusResponseFromData(CFDataRef xmlData, void *a2, CFStringRef *a3)
{
  unsigned int valuePtr = 0;
  CFArrayRef v5 = (const __CFArray *)CFPropertyListCreateFromXMLData(0, xmlData, 0, 0);
  if (v5)
  {
    CFArrayRef v6 = v5;
    if (CFArrayGetCount(v5) == 4)
    {
      CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v6, 0);
      if (CFEqual(ValueAtIndex, @"DLMessageStatusResponse"))
      {
        CFNumberRef v10 = (const __CFNumber *)CFArrayGetValueAtIndex(v6, 1);
        CFNumberGetValue(v10, kCFNumberIntType, &valuePtr);
        if (a3)
        {
          CFStringRef v11 = (const __CFString *)CFArrayGetValueAtIndex(v6, 2);
          *a3 = v11;
          CFRetain(v11);
        }
        if (a2)
        {
          uint64_t v12 = CFArrayGetValueAtIndex(v6, 3);
          *a2 = v12;
          CFRetain(v12);
        }
        goto LABEL_16;
      }
      unsigned int valuePtr = -1;
      if (a3)
      {
        CFStringRef v8 = CFStringCreateWithFormat(0, 0, @"Unexpected response message: %@", ValueAtIndex);
LABEL_11:
        *a3 = v8;
      }
    }
    else
    {
      unsigned int valuePtr = -1;
      if (a3)
      {
        CFIndex Count = CFArrayGetCount(v6);
        CFStringRef v8 = CFStringCreateWithFormat(0, 0, @"Too few components in status response: %ld", Count);
        goto LABEL_11;
      }
    }
LABEL_16:
    CFRelease(v6);
    return valuePtr;
  }
  if (a3) {
    *a3 = @"Error deserializing status response data";
  }
  return 0xFFFFFFFFLL;
}

uint64_t _DLProcessSyncMessageWithStatusResponseV(uint64_t a1, void *a2, CFStringRef *a3, SInt32 a4, const void *a5, int a6, __CFString **a7)
{
  CFDataRef v15 = (const __CFData *)_DLCreateMessageDataWithArgs(a5, a6, a7);
  uint64_t v16 = *(__CFMessagePort **)(a1 + 104);
  if (v16)
  {
    CFDataRef v17 = DLThreadSendSyncMessage(v16, a4, v15);
  }
  else
  {
    CFDataRef v17 = _DLHandlerThreadMessagePortCallback(0, a4, v15, a1, v11, v12, v13, v14);
    if (v15) {
      CFRelease(v15);
    }
  }
  if (v17)
  {
    uint64_t v18 = _DLGetStatusResponseFromData(v17, a2, a3);
    CFRelease(v17);
    return v18;
  }
  else
  {
    if (a3) {
      *a3 = @"Error receiving status response";
    }
    return 0xFFFFFFFFLL;
  }
}

uint64_t _DLProcessSyncMessageWithStatusResponse(uint64_t a1, void *a2, CFStringRef *a3, SInt32 a4, const void *a5, int a6, uint64_t a7, uint64_t a8, __CFString *a9)
{
  return _DLProcessSyncMessageWithStatusResponseV(a1, a2, a3, a4, a5, a6, &a9);
}

CFTypeRef _DLCreateStatusResponseData(int a1)
{
  int valuePtr = a1;
  uint64_t v1 = (__CFString *)CFNumberCreate(0, kCFNumberIntType, &valuePtr);
  CFTypeRef v8 = _DLCreateMessageDataV(@"DLMessageStatusResponse", 3, v2, v3, v4, v5, v6, v7, v1);
  if (v1) {
    CFRelease(v1);
  }
  return v8;
}

uint64_t _DLOperationProgressContextInit(uint64_t result, uint64_t a2, CFNumberRef number, const __CFNumber *a4, const __CFNumber *a5)
{
  *(void *)(result + 48) = 0;
  *(_OWORD *)(result + 16) = 0u;
  *(_OWORD *)(result + 32) = 0u;
  *(_OWORD *)uint64_t result = 0u;
  *(void *)uint64_t result = a2;
  if (a5 && a4 && number)
  {
    if (*(void *)(*(void *)(a2 + 40) + 80))
    {
      uint64_t v7 = (unsigned char *)result;
      CFNumberGetValue(number, kCFNumberDoubleType, (void *)(result + 16));
      CFNumberGetValue(a4, kCFNumberDoubleType, v7 + 24);
      uint64_t result = CFNumberGetValue(a5, kCFNumberLongLongType, v7 + 40);
      v7[48] = 1;
    }
  }
  return result;
}

uint64_t _DLOperationProgressContextUpdate(uint64_t result, uint64_t a2)
{
  if (a2)
  {
    uint64_t v2 = result;
    if (*(unsigned char *)(result + 48))
    {
      unint64_t v3 = *(void *)(result + 40);
      unint64_t v4 = *(void *)(result + 32) + a2;
      if (v4 >= v3) {
        unint64_t v4 = *(void *)(result + 40);
      }
      *(void *)(result + 32) = v4;
      double valuePtr = *(double *)(result + 16)
               + (double)v4 / (double)v3 * (*(double *)(result + 24) - *(double *)(result + 16));
      uint64_t v5 = *(const void **)(*(void *)result + 160);
      if (v5)
      {
        CFRelease(v5);
        *(void *)(*(void *)v2 + 160) = 0;
      }
      CFNumberRef v6 = CFNumberCreate(0, kCFNumberDoubleType, &valuePtr);
      uint64_t v7 = *(void *)v2;
      *(void *)(v7 + 160) = v6;
      return (*(uint64_t (**)(void))(*(void *)(v7 + 40) + 80))();
    }
  }
  return result;
}

CFMutableDictionaryRef _DLBulkOperationContextInit(uint64_t a1, uint64_t a2, uint64_t a3, CFNumberRef number, const __CFNumber *a5, const __CFNumber *a6)
{
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(void *)a1 = a2;
  *(void *)(a1 + 8) = a3;
  _DLOperationProgressContextInit(a1 + 16, a2, number, a5, a6);
  CFMutableDictionaryRef result = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  *(void *)(a1 + 88) = result;
  return result;
}

void _DLBulkOperationContextDealloc(uint64_t a1)
{
  uint64_t v2 = *(const void **)(a1 + 80);
  if (v2)
  {
    CFRelease(v2);
    *(void *)(a1 + 80) = 0;
  }
  unint64_t v3 = *(const void **)(a1 + 88);
  if (v3)
  {
    CFRelease(v3);
    *(void *)(a1 + 88) = 0;
  }
}

BOOL _DLBulkOperationContextShouldContinue(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 72);
  return !v1 || v1 == -13;
}

void _DLBulkOperationContextSetStatus(uint64_t a1, int a2, uint64_t a3)
{
  if (a2)
  {
    int v4 = *(_DWORD *)(a1 + 72);
    if (!v4 || v4 == -13)
    {
      *(_DWORD *)(a1 + 72) = a2;
      uint64_t v7 = *(const void **)(a1 + 80);
      if (v7) {
        CFRelease(v7);
      }
      *(void *)(a1 + 80) = a3;
    }
  }
}

__CFDictionary *_DLBulkOperationContextCreateResult(int a1, const void *a2)
{
  int valuePtr = a1;
  if (!a1) {
    return 0;
  }
  Mutable = CFDictionaryCreateMutable(0, 4, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  CFNumberRef v4 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
  CFDictionarySetValue(Mutable, @"DLFileErrorCode", v4);
  if (v4) {
    CFRelease(v4);
  }
  if (a2) {
    CFDictionarySetValue(Mutable, @"DLFileErrorString", a2);
  }
  return Mutable;
}

void _DLBulkOperationContextAddResult(uint64_t a1, const void *a2, const void *a3)
{
  CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 88), a2, a3);
  int v4 = *(_DWORD *)(a1 + 72);
  if (v4) {
    BOOL v5 = v4 == -13;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    *(_DWORD *)(a1 + 72) = -13;
    CFNumberRef v6 = *(const void **)(a1 + 80);
    if (v6) {
      CFRelease(v6);
    }
    *(void *)(a1 + 80) = @"Multi status";
  }
}

void _DLBulkOperationContextMergeResultsCallback(void *key, void *value, uint64_t a3)
{
}

void _DLBulkOperationContextMergeResults(uint64_t a1, int a2, uint64_t a3, CFDictionaryRef theDict)
{
  if (theDict)
  {
    if (CFDictionaryGetCount(theDict))
    {
      CFDictionaryApplyFunction(theDict, (CFDictionaryApplierFunction)_DLBulkOperationContextMergeResultsCallback, (void *)a1);
      int v8 = *(_DWORD *)(a1 + 72);
      if (!v8 || v8 == -13)
      {
        *(_DWORD *)(a1 + 72) = -13;
        uint64_t v9 = *(const void **)(a1 + 80);
        if (v9) {
          CFRelease(v9);
        }
        *(void *)(a1 + 80) = @"Multi status";
      }
    }
  }

  _DLBulkOperationContextSetStatus(a1, a2, a3);
}

uint64_t _DLBulkOperationContextUpdate(uint64_t result, const void *a2, const void *a3, uint64_t a4)
{
  int v4 = *(_DWORD *)(result + 72);
  if (v4) {
    BOOL v5 = v4 == -13;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    uint64_t v7 = result;
    if (a3) {
      _DLBulkOperationContextAddResult(result, a2, a3);
    }
    int v8 = *(_DWORD **)v7;
    CFMutableDictionaryRef result = CFRunLoopRunInMode((CFRunLoopMode)*MEMORY[0x263EFFE88], 0.0, 1u);
    if (*v8 == 4)
    {
      *(_DWORD *)(v7 + 72) = -14;
      *(void *)(v7 + 80) = @"Disconnected";
    }
    else
    {
      int v9 = *(_DWORD *)(v7 + 72);
      if (!v9 || v9 == -13)
      {
        return _DLOperationProgressContextUpdate(v7 + 16, a4);
      }
    }
  }
  return result;
}

CFTypeRef _DLCreateBulkOperationContextStatusResponseData(uint64_t a1)
{
  return _DLCreateStatusResponseData(*(_DWORD *)(a1 + 72));
}

void _DLBulkOperationContextSendStatusResponse(uint64_t a1)
{
  uint64_t v1 = *(void *)a1;
  int valuePtr = *(_DWORD *)(a1 + 72);
  uint64_t v2 = (__CFString *)CFNumberCreate(0, kCFNumberIntType, &valuePtr);
  _DLRequestWrite(v1, @"DLMessageStatusResponse", 3, v3, v4, v5, v6, v7, v2);
  _DLRequestRead(v1);
  if (v2) {
    CFRelease(v2);
  }
}

uint64_t _DLSingleFromMultiError(uint64_t result, const __CFString *a2, CFDictionaryRef theDict, __CFString **a4)
{
  keys[1] = *(void **)MEMORY[0x263EF8340];
  unsigned int valuePtr = result;
  if (result == -13)
  {
    if (!theDict || CFDictionaryGetCount(theDict) != 1)
    {
      if (a4)
      {
        uint64_t v7 = @"Unexpected bulk operation result count";
        goto LABEL_9;
      }
      return 0xFFFFFFFFLL;
    }
    values = 0;
    keys[0] = 0;
    CFDictionaryGetKeysAndValues(theDict, (const void **)keys, (const void **)&values);
    if (CFStringCompare((CFStringRef)keys[0], a2, 0))
    {
      if (a4)
      {
        uint64_t v7 = @"Unexpected bulk operation result key";
LABEL_9:
        *a4 = v7;
        return 0xFFFFFFFFLL;
      }
      return 0xFFFFFFFFLL;
    }
    CFDictionaryRef v8 = (const __CFDictionary *)values;
    CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue((CFDictionaryRef)values, @"DLFileErrorCode");
    CFNumberGetValue(Value, kCFNumberIntType, &valuePtr);
    if (a4)
    {
      CFNumberRef v10 = (__CFString *)CFDictionaryGetValue(v8, @"DLFileErrorString");
      *a4 = v10;
      if (v10) {
        CFRetain(v10);
      }
    }
    return valuePtr;
  }
  return result;
}

void DLSetRootDirectory()
{
}

void _DLResolveAndValidatePath()
{
}

CFTypeRef DLSetProgress(uint64_t a1, CFTypeRef cf, const void *a3)
{
  uint64_t v6 = *(const void **)(a1 + 160);
  if (v6)
  {
    CFRelease(v6);
    *(void *)(a1 + 160) = 0;
  }
  *(void *)(a1 + 160) = CFRetain(cf);
  uint64_t v7 = *(const void **)(a1 + 168);
  if (v7)
  {
    CFRelease(v7);
    *(void *)(a1 + 168) = 0;
  }
  if (a3) {
    CFTypeRef result = CFRetain(a3);
  }
  else {
    CFTypeRef result = 0;
  }
  *(void *)(a1 + 168) = result;
  return result;
}

uint64_t DLGetProgressPercentage(uint64_t a1)
{
  return *(void *)(a1 + 160);
}

uint64_t DLGetProgressSize(uint64_t a1)
{
  return *(void *)(a1 + 168);
}

uint64_t DLCreateDirectory(uint64_t a1, __CFString *a2, uint64_t a3, CFStringRef *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  char v8 = (char)a2;
  uint64_t v9 = _DLProcessSyncMessageWithStatusResponse(a1, 0, a4, 13, @"DLMessageCreateDirectory", 3, a7, a8, a2);
  if (DLShouldLog(6)) {
    _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "DLCreateDirectory", 6, @"CreateDirectory(\"%@\"): %d %@", v10, v11, v12, v13, v8);
  }
  return v9;
}

uint64_t DLContentsOfDirectory(uint64_t a1, __CFString *a2, uint64_t a3, void *a4, CFStringRef *a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  char v8 = (char)a2;
  uint64_t v9 = _DLProcessSyncMessageWithStatusResponse(a1, a4, a5, 13, @"DLContentsOfDirectory", 3, a7, a8, a2);
  if (DLShouldLog(6)) {
    _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "DLContentsOfDirectory", 6, @"ContentsOfDirectory(\"%@\"): %d %@", v10, v11, v12, v13, v8);
  }
  return v9;
}

uint64_t DLCopyItem(uint64_t a1, __CFString *a2, uint64_t a3, uint64_t a4, CFStringRef *a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  char v8 = (char)a2;
  uint64_t v9 = _DLProcessSyncMessageWithStatusResponse(a1, 0, a5, 13, @"DLMessageCopyItem", 5, a7, a8, a2);
  if (DLShouldLog(6)) {
    _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "DLCopyItem", 6, @"CopyItem(\"%@\", \"%@\"): %d %@", v10, v11, v12, v13, v8);
  }
  return v9;
}

uint64_t DLMoveItem(uint64_t a1, const __CFString *a2, void *a3, uint64_t a4, CFStringRef *a5)
{
  keys[1] = *(void **)MEMORY[0x263EF8340];
  values = a3;
  keys[0] = (void *)a2;
  uint64_t v9 = (__CFString *)CFDictionaryCreate(0, (const void **)keys, (const void **)&values, 1, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  CFTypeRef cf = 0;
  uint64_t v13 = DLMoveItems(a1, v9, a4, &cf, a5, v10, v11, v12);
  uint64_t v14 = _DLSingleFromMultiError(v13, a2, (CFDictionaryRef)cf, (__CFString **)a5);
  if (v9) {
    CFRelease(v9);
  }
  if (cf) {
    CFRelease(cf);
  }
  return v14;
}

uint64_t DLMoveItems(uint64_t a1, __CFString *a2, uint64_t a3, void *a4, CFStringRef *a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (*(int *)(a1 + 32) >= 200) {
    uint64_t v10 = @"DLMessageMoveItems";
  }
  else {
    uint64_t v10 = @"DLMessageMoveFiles";
  }
  uint64_t v11 = _DLProcessSyncMessageWithStatusResponse(a1, a4, a5, 13, v10, 3, a7, a8, a2);
  if (DLShouldLog(6))
  {
    char Count = CFDictionaryGetCount((CFDictionaryRef)a2);
    _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "DLMoveItems", 6, @"MoveItems(%d): %d %@", v13, v14, v15, v16, Count);
  }
  return v11;
}

uint64_t _DLRemoveDirectory(uint64_t a1, __CFString *a2, uint64_t a3, CFStringRef *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  char v8 = (char)a2;
  uint64_t v9 = _DLProcessSyncMessageWithStatusResponse(a1, 0, a4, 13, @"DLMessageRemoveDirectory", 3, a7, a8, a2);
  if (DLShouldLog(6)) {
    _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "_DLRemoveDirectory", 6, @"RemoveDirectory(\"%@\"): %d %@", v10, v11, v12, v13, v8);
  }
  return v9;
}

void _DLRemoveItemUsingOldProtocolCallback(const __CFString *a1, uint64_t a2, uint64_t a3)
{
  CFStringRef v4 = DLStringByAppendingPathComponent(*(const __CFString **)(a3 + 8), a1);
  DLRemoveItem(*(void *)a3, v4, 0, 0);
  if (v4)
  {
    CFRelease(v4);
  }
}

uint64_t DLRemoveItem(uint64_t a1, const __CFString *a2, uint64_t a3, CFStringRef *a4)
{
  values[1] = *(void **)MEMORY[0x263EF8340];
  values[0] = (void *)a2;
  char v8 = (__CFString *)CFArrayCreate(0, (const void **)values, 1, MEMORY[0x263EFFF70]);
  CFTypeRef cf = 0;
  uint64_t v12 = DLRemoveItems(a1, v8, a3, (CFDictionaryRef *)&cf, a4, v9, v10, v11);
  uint64_t v13 = _DLSingleFromMultiError(v12, a2, (CFDictionaryRef)cf, (__CFString **)a4);
  if (v8) {
    CFRelease(v8);
  }
  if (cf) {
    CFRelease(cf);
  }
  return v13;
}

void _DLRemoveItemsUsingOldProtocolCallback(__CFString *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  CFDictionaryRef theDict = 0;
  if (!DLContentsOfDirectory(*(void *)a3, a1, 0, &theDict, 0, a6, a7, a8))
  {
    context[0] = *(void *)a3;
    context[1] = a1;
    CFDictionaryApplyFunction(theDict, (CFDictionaryApplierFunction)_DLRemoveItemUsingOldProtocolCallback, context);
    if (!_DLRemoveDirectory(*(void *)a3, a1, 0, 0, v10, v11, v12, v13)) {
      CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(a3 + 8), a1);
    }
  }
  if (theDict) {
    CFRelease(theDict);
  }
}

uint64_t _DLRemoveItemsUsingOldProtocol(uint64_t a1, __CFString *a2, uint64_t a3, CFDictionaryRef *a4, CFStringRef *a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  CFDictionaryRef MutableCopy = 0;
  CFDictionaryRef theDict = 0;
  uint64_t context = a1;
  uint64_t v11 = _DLProcessSyncMessageWithStatusResponse(a1, &theDict, a5, 13, @"DLMessageRemoveFiles", 3, a7, a8, a2);
  if (DLShouldLog(6))
  {
    char Count = CFArrayGetCount((CFArrayRef)a2);
    _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "_DLRemoveItemsUsingOldProtocol", 6, @"RemoveFiles(%d): %d %@", v13, v14, v15, v16, Count);
  }
  if (v11 == -13)
  {
    CFDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy(0, 0, theDict);
    CFDictionaryApplyFunction(theDict, (CFDictionaryApplierFunction)_DLRemoveItemsUsingOldProtocolCallback, &context);
    if (CFDictionaryGetCount(MutableCopy))
    {
      if (a4)
      {
        *a4 = MutableCopy;
        uint64_t v11 = 4294967283;
        goto LABEL_14;
      }
      uint64_t v11 = 4294967283;
    }
    else if (a5 && *a5)
    {
      CFRelease(*a5);
      uint64_t v11 = 0;
      *a5 = 0;
    }
    else
    {
      uint64_t v11 = 0;
    }
  }
  if (MutableCopy)
  {
    CFRelease(MutableCopy);
    CFDictionaryRef MutableCopy = 0;
  }
LABEL_14:
  if (theDict) {
    CFRelease(theDict);
  }
  return v11;
}

uint64_t DLRemoveItems(uint64_t a1, __CFString *a2, uint64_t a3, CFDictionaryRef *a4, CFStringRef *a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (*(int *)(a1 + 32) < 200) {
    uint64_t v9 = _DLRemoveItemsUsingOldProtocol(a1, a2, a3, a4, a5, a6, a7, a8);
  }
  else {
    uint64_t v9 = _DLProcessSyncMessageWithStatusResponse(a1, a4, a5, 13, @"DLMessageRemoveItems", 3, a7, a8, a2);
  }
  uint64_t v10 = v9;
  if (DLShouldLog(6))
  {
    char Count = CFArrayGetCount((CFArrayRef)a2);
    _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "DLRemoveItems", 6, @"RemoveItems(%d): %d %@", v12, v13, v14, v15, Count);
  }
  return v10;
}

void _DLRemoveItemOnComputerCallback(const __CFString *a1, const __CFString *a2)
{
}

BOOL _DLBulkOperationSendChunk(uint64_t a1, uint64_t a2, unsigned int a3)
{
  int v4 = _DLSendBytesAndDisconnectOnError(*(void *)a1, a2, a3);
  _DLBulkOperationContextSetStatus(a1, v4, @"Error sending chunk");
  int v5 = *(_DWORD *)(a1 + 72);
  return !v5 || v5 == -13;
}

uint64_t _DLSendBytesAndDisconnectOnError(uint64_t a1, uint64_t a2, unsigned int a3)
{
  CFTypeRef cf = 0;
  uint64_t v4 = *(void *)(a1 + 64);
  unsigned int v18 = 0;
  int v5 = StreamHandlerSend(v4, a2, a3, &v18, &cf);
  if (v5)
  {
    if (DLShouldLog(3)) {
      _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "_DLSendBytesAndDisconnectOnError", 3, @"Could not send data: '%@'", v6, v7, v8, v9, (char)cf);
    }
    CFRelease(cf);
    _DLCleanupStreamHandler(a1);
    uint64_t v14 = *(__CFMessagePort **)(a1 + 96);
    uint64_t v15 = sHandlerThreadConnectionSessionNumber | 0xCu;
    if (v14) {
      DLThreadSendMessage(v14, v15, 0);
    }
    else {
      _DLMainThreadMessagePortCallback(0, v15, 0, (void (***)(void, void))a1, v10, v11, v12, v13);
    }
  }
  if (v5) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0;
  }
}

BOOL _DLBulkOperationSendFinalChunk(uint64_t a1, char a2, __CFString *a3)
{
  if (a3) {
    CFDataRef v5 = (const __CFData *)DLCreateDataFromString(a3);
  }
  else {
    CFDataRef v5 = CFDataCreate(0, 0, 0);
  }
  CFDataRef v6 = v5;
  CFIndex Length = CFDataGetLength(v5);
  uint64_t v8 = (UInt8 *)malloc_type_malloc(Length + 1, 0x9C0404C9uLL);
  *uint64_t v8 = -a2;
  v11.location = 0;
  v11.length = Length;
  CFDataGetBytes(v6, v11, v8 + 1);
  BOOL v9 = _DLBulkOperationSendChunk(a1, (uint64_t)v8, Length + 1);
  if (v6) {
    CFRelease(v6);
  }
  free(v8);
  return v9;
}

uint64_t _DLSendFileForBulkOperation(uint64_t a1, uint64_t a2, CFStringRef *a3)
{
  CFDataRef v5 = *(_DWORD **)a1;
  CFDataRef v6 = *(unsigned char **)(*(void *)a1 + 176);
  uint64_t v7 = *(void *)(*(void *)a1 + 184);
  uint64_t v8 = _DLGetDeviceIOCallbacks(*(const __CFDictionary **)(a1 + 8));
  fcntl(a2, 48, 1);
  uint64_t v9 = v7 - 1;
  CFStringRef v10 = (const __CFString *)*MEMORY[0x263EFFE88];
  while (1)
  {
    while (1)
    {
      uint64_t v11 = ((uint64_t (*)(uint64_t (*)(int, char *, int), uint64_t, unsigned char *, uint64_t))v8[3])(v8[5], a2, v6 + 1, v9);
      if ((v11 & 0x8000000000000000) == 0) {
        break;
      }
      if (*__error() != 4)
      {
        uint64_t v14 = (__CFString **)a3;
        unsigned int v15 = DLStatusFromOSStatus(-1, a3);
        if (a3)
        {
LABEL_12:
          uint64_t v16 = *v14;
          goto LABEL_13;
        }
LABEL_10:
        uint64_t v16 = 0;
LABEL_13:
        _DLBulkOperationSendFinalChunk(a1, v15, v16);
        unsigned int v13 = *(_DWORD *)(a1 + 72);
        goto LABEL_16;
      }
    }
    uint64_t v12 = v11;
    if (!v11)
    {
      unsigned int v15 = 0;
      uint64_t v14 = (__CFString **)a3;
      if (a3) {
        goto LABEL_12;
      }
      goto LABEL_10;
    }
    CFRunLoopRunInMode(v10, 0.0, 1u);
    if (*v5 == 4)
    {
      unsigned int v15 = 0;
      unsigned int v13 = -14;
      *(_DWORD *)(a1 + 72) = -14;
      *(void *)(a1 + 80) = @"Disconnected";
      goto LABEL_16;
    }
    *CFDataRef v6 = 12;
    _DLBulkOperationSendChunk(a1, (uint64_t)v6, v12 + 1);
    unsigned int v13 = *(_DWORD *)(a1 + 72);
    if (v13)
    {
      if (v13 != -13) {
        break;
      }
    }
    _DLOperationProgressContextUpdate(a1 + 16, v12);
  }
  unsigned int v15 = 0;
LABEL_16:
  if (v13 == -13 || v13 == 0) {
    return v15;
  }
  else {
    return v13;
  }
}

uint64_t (**_DLGetDeviceIOCallbacks(const __CFDictionary *a1))(int, char *, int)
{
  if (!a1) {
    return &_DLDefaultDeviceIOCallbacks;
  }
  CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(a1, @"DLDeviceIOCallbacks");
  if (!Value) {
    return &_DLDefaultDeviceIOCallbacks;
  }
  uint64_t valuePtr = 0;
  CFNumberGetValue(Value, kCFNumberLongType, &valuePtr);
  return (uint64_t (**)(int, char *, int))valuePtr;
}

uint64_t _DLReceiveFileForBulkOperation(uint64_t a1, uint64_t a2, CFStringRef *a3)
{
  CFDataRef v6 = *(_DWORD **)a1;
  uint64_t v7 = _DLGetDeviceIOCallbacks(*(const __CFDictionary **)(a1 + 8));
  fcntl(a2, 48, 1);
  CFDataRef Message = _DLHandlerThreadReadMessage((uint64_t)v6);
  uint64_t v33 = a1;
  if (Message)
  {
    CFDataRef v9 = Message;
    unsigned int v10 = 0;
    uint64_t v11 = a1 + 16;
    CFStringRef mode = (const __CFString *)*MEMORY[0x263EFFE88];
    uint64_t v31 = a1 + 16;
    uint64_t v32 = v6;
    while (1)
    {
      BytePtr = CFDataGetBytePtr(v9);
      CFIndex Length = CFDataGetLength(v9);
      CFIndex v14 = Length - 1;
      if (Length < 1) {
        break;
      }
      int v15 = *BytePtr;
      if (v15 != 12)
      {
        if (!v10)
        {
          unsigned int v10 = -v15;
          CFDataRef v26 = CFDataCreate(0, BytePtr + 1, v14);
          CFDataRef v27 = v26;
          if (a3) {
            *a3 = DLCreateStringFromData(v26);
          }
          if (v27) {
            CFRelease(v27);
          }
        }
        goto LABEL_36;
      }
      if (a2 != -1)
      {
        CFIndex v16 = Length;
        if ((unint64_t)Length >= 2)
        {
          uint64_t v17 = 1;
          while (1)
          {
            int v18 = ((uint64_t (*)(uint64_t (*)(int, char *, int), uint64_t, const UInt8 *, CFIndex))v7[4])(v7[5], a2, &BytePtr[v17], v16 - v17);
            unsigned int v19 = DLStatusFromOSStatus(v18, a3);
            if (v19) {
              break;
            }
            v17 += v18;
            if (v17 >= v16)
            {
              unsigned int v10 = 0;
              goto LABEL_12;
            }
          }
          unsigned int v10 = v19;
          a2 = 0xFFFFFFFFLL;
LABEL_12:
          uint64_t v11 = v31;
          CFDataRef v6 = v32;
        }
      }
      _DLOperationProgressContextUpdate(v11, v14);
      CFRunLoopRunInMode(mode, 0.0, 1u);
      if (*v6 == 4)
      {
        *(_DWORD *)(v33 + 72) = -14;
        *(void *)(v33 + 80) = @"Disconnected";
        goto LABEL_36;
      }
      CFRelease(v9);
      CFDataRef v9 = _DLHandlerThreadReadMessage((uint64_t)v6);
      if (!v9) {
        goto LABEL_17;
      }
    }
    int v23 = *(_DWORD *)(v33 + 72);
    if (v23) {
      BOOL v24 = v23 == -13;
    }
    else {
      BOOL v24 = 1;
    }
    if (v24)
    {
      *(_DWORD *)(v33 + 72) = -1;
      uint64_t v25 = *(const void **)(v33 + 80);
      if (v25) {
        CFRelease(v25);
      }
      *(void *)(v33 + 80) = @"Empty response";
    }
LABEL_36:
    CFRelease(v9);
    uint64_t v20 = v33;
  }
  else
  {
    unsigned int v10 = 0;
LABEL_17:
    uint64_t v20 = v33;
    int v21 = *(_DWORD *)(v33 + 72);
    if (!v21 || v21 == -13)
    {
      *(_DWORD *)(v33 + 72) = -1;
      uint64_t v22 = *(const void **)(v33 + 80);
      if (v22) {
        CFRelease(v22);
      }
      *(void *)(v33 + 80) = @"Error reading response";
    }
  }
  unsigned int v28 = *(_DWORD *)(v20 + 72);
  if (v28 == -13 || v28 == 0) {
    return v10;
  }
  else {
    return v28;
  }
}

uint64_t DLUploadFile(uint64_t a1, const __CFString *a2, void *a3, uint64_t a4, CFStringRef *a5)
{
  keys[1] = *(void **)MEMORY[0x263EF8340];
  values = a3;
  keys[0] = (void *)a2;
  CFDataRef v9 = (__CFString *)CFDictionaryCreate(0, (const void **)keys, (const void **)&values, 1, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  CFTypeRef cf = 0;
  uint64_t v13 = DLUploadFiles(a1, v9, a4, &cf, a5, v10, v11, v12);
  uint64_t v14 = _DLSingleFromMultiError(v13, a2, (CFDictionaryRef)cf, (__CFString **)a5);
  if (v9) {
    CFRelease(v9);
  }
  if (cf) {
    CFRelease(cf);
  }
  return v14;
}

uint64_t DLUploadFiles(uint64_t a1, __CFString *a2, uint64_t a3, void *a4, CFStringRef *a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = _DLProcessSyncMessageWithStatusResponse(a1, a4, a5, 14, @"DLMessageUploadFiles", 2, a7, a8, a2);
  if (DLShouldLog(6))
  {
    char Count = CFDictionaryGetCount((CFDictionaryRef)a2);
    _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "DLUploadFiles", 6, @"DownloadFiles(%d): %d %@", v11, v12, v13, v14, Count);
  }
  return v9;
}

void _DLUploadFilesFromDeviceCallback(__CFString *a1, __CFString *a2, uint64_t a3)
{
  int v23 = 0;
  CFTypeRef cf = 0;
  uint64_t v6 = *(void *)a3;
  uint64_t v7 = _DLGetDeviceIOCallbacks(*(const __CFDictionary **)(a3 + 8));
  int v8 = *(_DWORD *)(a3 + 72);
  if (v8) {
    BOOL v9 = v8 == -13;
  }
  else {
    BOOL v9 = 1;
  }
  if (!v9) {
    goto LABEL_25;
  }
  uint64_t v10 = v7;
  int v11 = DLGetFileSystemRepresentation(a1, &v23, &cf);
  if (!v11)
  {
    uint64_t v12 = ((uint64_t (*)(uint64_t (*)(int, char *, int), void *, uint64_t, void))*v10)(v10[5], v23, 256, 0);
    if ((v12 & 0x80000000) == 0)
    {
      uint64_t v13 = v12;
      uint64_t v14 = DLCreateDataFromString(a1);
      int v11 = _DLSendDataAndDisconnectOnError(v6, (CFDataRef)v14);
      if (v14) {
        CFRelease(v14);
      }
      if (v11)
      {
        int v15 = @"Error sending from path data";
      }
      else
      {
        CFIndex v16 = DLCreateDataFromString(a2);
        int v11 = _DLSendDataAndDisconnectOnError(v6, (CFDataRef)v16);
        if (v16) {
          CFRelease(v16);
        }
        if (!v11)
        {
          int v11 = _DLSendFileForBulkOperation(a3, v13, (CFStringRef *)&cf);
          goto LABEL_18;
        }
        int v15 = @"Error sending to path data";
      }
      _DLBulkOperationContextSetStatus(a3, v11, (uint64_t)v15);
LABEL_18:
      ((void (*)(uint64_t (*)(int, char *, int), uint64_t))v10[1])(v10[5], v13);
      goto LABEL_19;
    }
    int v11 = DLStatusFromOSStatus(-1, (CFStringRef *)&cf);
  }
LABEL_19:
  int v17 = *(_DWORD *)(a3 + 72);
  if (!v17 || v17 == -13)
  {
    Result = _DLBulkOperationContextCreateResult(v11, cf);
    _DLBulkOperationContextUpdate(a3, a1, Result, 0);
    if (Result) {
      CFRelease(Result);
    }
    if (DLShouldLog(6)) {
      _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "_DLUploadFilesFromDeviceCallback", 6, @"UploadFile(\"%@\", \"%@\"): %d %@", v19, v20, v21, v22, (char)a1);
    }
  }
LABEL_25:
  if (cf)
  {
    CFRelease(cf);
    CFTypeRef cf = 0;
  }
  free(v23);
}

uint64_t DLDownloadFile(uint64_t a1, const __CFString *a2, void *a3, uint64_t a4, CFStringRef *a5)
{
  keys[1] = *(void **)MEMORY[0x263EF8340];
  values = a3;
  keys[0] = (void *)a2;
  BOOL v9 = (__CFString *)CFDictionaryCreate(0, (const void **)keys, (const void **)&values, 1, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  CFTypeRef cf = 0;
  uint64_t v13 = DLDownloadFiles(a1, v9, a4, &cf, a5, v10, v11, v12);
  uint64_t v14 = _DLSingleFromMultiError(v13, a2, (CFDictionaryRef)cf, (__CFString **)a5);
  if (v9) {
    CFRelease(v9);
  }
  if (cf) {
    CFRelease(cf);
  }
  return v14;
}

uint64_t DLDownloadFiles(uint64_t a1, __CFString *a2, uint64_t a3, void *a4, CFStringRef *a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = _DLProcessSyncMessageWithStatusResponse(a1, a4, a5, 15, @"DLMessageDownloadFiles", 2, a7, a8, a2);
  if (DLShouldLog(6))
  {
    char Count = CFDictionaryGetCount((CFDictionaryRef)a2);
    _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "DLDownloadFiles", 6, @"DownloadFiles(%d): %d %@", v11, v12, v13, v14, Count);
  }
  return v9;
}

void _DLDownloadFileToDevice(uint64_t a1, const void *a2, const __CFString *a3)
{
  CFTypeRef cf = 0;
  uint64_t v6 = _DLGetDeviceIOCallbacks(*(const __CFDictionary **)(a1 + 8));
  __from = 0;
  __to = 0;
  int v7 = DLGetFileSystemRepresentation(a3, (void **)&__to, &cf);
  if (v7)
  {
    int v8 = v7;
LABEL_6:
    uint64_t v10 = 0xFFFFFFFFLL;
LABEL_7:
    _DLReceiveFileForBulkOperation(a1, v10, 0);
    goto LABEL_8;
  }
  CFStringRef v9 = CFStringCreateWithFormat(0, 0, @"%@.%@", a3, @"download");
  int v8 = DLGetFileSystemRepresentation(v9, (void **)&__from, &cf);
  if (v9) {
    CFRelease(v9);
  }
  if (v8) {
    goto LABEL_6;
  }
  uint64_t v10 = ((uint64_t (*)(uint64_t (*)(int, char *, int), std::__fs::filesystem::path *, uint64_t, uint64_t))*v6)(v6[5], __from, 1793, 420);
  if ((v10 & 0x80000000) != 0)
  {
    int v19 = DLStatusFromOSStatus(-1, (CFStringRef *)&cf);
    if (v19)
    {
      int v8 = v19;
      goto LABEL_7;
    }
  }
  int v8 = _DLReceiveFileForBulkOperation(a1, v10, (CFStringRef *)&cf);
LABEL_8:
  ((void (*)(uint64_t (*)(int, char *, int), uint64_t))v6[1])(v6[5], v10);
  if (v8)
  {
    unlink((const char *)__from);
  }
  else
  {
    rename(__from, __to, v11);
    int v8 = DLStatusFromOSStatus(v12, (CFStringRef *)&cf);
  }
  int v13 = *(_DWORD *)(a1 + 72);
  if (!v13 || v13 == -13)
  {
    Result = _DLBulkOperationContextCreateResult(v8, cf);
    _DLBulkOperationContextUpdate(a1, a2, Result, 0);
    if (Result) {
      CFRelease(Result);
    }
    if (DLShouldLog(6)) {
      _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "_DLDownloadFileToDevice", 6, @"DownloadFile(\"%@\", \"%@\"): %d %@", v15, v16, v17, v18, (char)a2);
    }
  }
  if (cf)
  {
    CFRelease(cf);
    CFTypeRef cf = 0;
  }
  free(__to);
  free(__from);
}

uint64_t DLGetFreeDiskSpace(uint64_t a1, void *a2, CFStringRef *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  CFNumberRef number = 0;
  if (*(int *)(a1 + 32) > 299)
  {
    uint64_t v10 = _DLProcessSyncMessageWithStatusResponse(a1, &number, a3, 13, @"DLMessageGetFreeDiskSpace", 0, a7, a8, v16);
    uint64_t v8 = v10;
    if (a2 && !v10)
    {
      uint64_t valuePtr = 0;
      CFNumberGetValue(number, kCFNumberLongLongType, &valuePtr);
      *a2 = valuePtr;
    }
  }
  else
  {
    if (!a3)
    {
      uint64_t v8 = 4294967294;
      if (!DLShouldLog(6)) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
    *a3 = @"DLGetFreeDiskSpace unimplemented by computer version";
    uint64_t v8 = 4294967294;
  }
  if (!DLShouldLog(6)) {
    goto LABEL_11;
  }
LABEL_10:
  _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "DLGetFreeDiskSpace", 6, @"GetFreeDiskSpace(): %d %@ %@", v11, v12, v13, v14, v8);
LABEL_11:
  if (number) {
    CFRelease(number);
  }
  return v8;
}

uint64_t DLPurgeDiskSpace(uint64_t a1, void *a2, uint64_t a3, int a4, CFStringRef *a5)
{
  uint64_t valuePtr = a3;
  int v21 = a4;
  CFNumberRef number = 0;
  uint64_t v8 = (__CFString *)CFNumberCreate(0, kCFNumberLongLongType, &valuePtr);
  CFNumberRef v11 = CFNumberCreate(0, kCFNumberIntType, &v21);
  if (*(int *)(a1 + 32) > 399)
  {
    uint64_t v13 = _DLProcessSyncMessageWithStatusResponse(a1, &number, a5, 13, @"DLMessagePurgeDiskSpace", 2, v9, v10, v8);
    uint64_t v12 = v13;
    if (a2 && !v13)
    {
      uint64_t v19 = 0;
      CFNumberGetValue(number, kCFNumberLongLongType, &v19);
      *a2 = v19;
    }
  }
  else
  {
    if (!a5)
    {
      uint64_t v12 = 4294967294;
      if (!DLShouldLog(6)) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
    *a5 = @"DLPurgeDiskSpace unimplemented by computer version";
    uint64_t v12 = 4294967294;
  }
  if (!DLShouldLog(6)) {
    goto LABEL_11;
  }
LABEL_10:
  _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "DLPurgeDiskSpace", 6, @"PurgeDiskSpace(): %d %@ %@", v14, v15, v16, v17, v12);
LABEL_11:
  if (number)
  {
    CFRelease(number);
    CFNumberRef number = 0;
  }
  if (v8) {
    CFRelease(v8);
  }
  if (v11) {
    CFRelease(v11);
  }
  return v12;
}

pthread_mutex_t *_DLCallHistoryAddEntry(void *value)
{
  if (sCallHistoryMutex) {
    DLLock((pthread_mutex_t *)sCallHistoryMutex);
  }
  Mutable = (__CFArray *)sCallHistory;
  if (!sCallHistory)
  {
    Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x263EFFF70]);
    sCallHistory = (uint64_t)Mutable;
  }
  CFArrayAppendValue(Mutable, value);
  CFTypeRef result = (pthread_mutex_t *)sCallHistoryMutex;
  if (sCallHistoryMutex)
  {
    return (pthread_mutex_t *)DLUnlock(result);
  }
  return result;
}

uint64_t _DLCheckVersionForAccept(uint64_t a1, CFTypeRef *a2)
{
  CFTypeRef cf = 0;
  uint64_t v4 = (__CFString *)CFNumberCreate(0, kCFNumberIntType, &kDLProtocolVersion);
  CFDataRef v5 = CFNumberCreate(0, kCFNumberIntType, (const void *)(a1 + 36));
  CFDataRef v12 = (const __CFData *)_DLCreateMessageDataV(@"DLMessageVersionExchange", 2, v6, v7, v8, v9, v10, v11, v4);
  int v13 = _DLSendData(*(void *)(a1 + 64), v12, a2);
  if (v12) {
    CFRelease(v12);
  }
  if (v13)
  {
    if (DLShouldLog(3)) {
      _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "_DLCheckVersionForAccept", 3, @"Could not send data: '%@'", v14, v15, v16, v17, (char)*a2);
    }
    if (v4) {
      CFRelease(v4);
    }
    if (!v5) {
      return 0;
    }
    goto LABEL_9;
  }
  CFRelease(v4);
  CFRelease(v5);
  if (DLShouldLog(6)) {
    _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "_DLCheckVersionForAccept", 6, @"Accepting side sent version numbers. DeviceLink %d, protocol %d", v19, v20, v21, v22, kDLProtocolVersion);
  }
  if (StreamHandlerReceive(*(void *)(a1 + 64), (CFDataRef *)&cf, a2))
  {
    if (DLShouldLog(3)) {
      _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "_DLCheckVersionForAccept", 3, @"Could not receive message: '%@'", v23, v24, v25, v26, (char)*a2);
    }
    CFTypeRef v18 = cf;
    if (!cf) {
      return 0;
    }
    goto LABEL_16;
  }
  if (!cf)
  {
    if (!DLShouldLog(3)) {
      return 0;
    }
    CFStringRef v46 = @"Did not receive version number data from connecting side";
LABEL_40:
    _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "_DLCheckVersionForAccept", 3, v46, v42, v43, v44, v45, (char)v60);
    return 0;
  }
  CFDataRef v5 = CFPropertyListCreateFromXMLData(0, (CFDataRef)cf, 0, (CFStringRef *)a2);
  if (cf)
  {
    CFRelease(cf);
    CFTypeRef cf = 0;
  }
  if (!v5)
  {
    if (!DLShouldLog(3)) {
      return 0;
    }
    CFTypeRef v60 = *a2;
    CFStringRef v46 = @"Did not receive version number array from connecting side: %@";
    goto LABEL_40;
  }
  CFStringRef v29 = _DLGetParameterAtIndexWithDefaultValue((const __CFArray *)v5, 1, 0);
  if (!v29 || (CFStringRef v30 = v29, v31 = CFGetTypeID(v29), v31 != CFStringGetTypeID()))
  {
    if (DLShouldLog(3)) {
      _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "_DLCheckVersionForAccept", 3, @"Invalid version received from the connect side", v47, v48, v49, v50, (char)v60);
    }
LABEL_9:
    CFTypeRef v18 = v5;
LABEL_16:
    CFRelease(v18);
    return 0;
  }
  CFStringRef v32 = _DLGetParameterAtIndexWithDefaultValue((const __CFArray *)v5, 2, 0);
  int valuePtr = 0;
  if (v32) {
    CFNumberGetValue((CFNumberRef)v32, kCFNumberIntType, &valuePtr);
  }
  if (DLShouldLog(6)) {
    _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "_DLCheckVersionForAccept", 6, @"Accepting side received ok/nogo from connect side: %@", v33, v34, v35, v36, (char)v30);
  }
  if (CFStringCompare(v30, @"DLVersionsOk", 0))
  {
    if (CFStringCompare(v30, @"DLErrorAcceptingDeviceLinkGreater", 0))
    {
      if (DLShouldLog(3)) {
        _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "_DLCheckVersionForAccept", 3, @"Connecting side told the accepting side that the version numbers mismatch: %@", v37, v38, v39, v40, (char)v30);
      }
      CFTypeRef v41 = CFRetain(v30);
      uint64_t v27 = 0;
      *a2 = v41;
      goto LABEL_44;
    }
    if (DLShouldLog(4)) {
      _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "_DLCheckVersionForAccept", 4, @"Our DeviceLink version (%d) is greater than the connecting side's version (%d), but that's ok", v51, v52, v53, v54, kDLProtocolVersion);
    }
  }
  uint64_t v27 = 1;
LABEL_44:
  int v55 = kDLProtocolVersion;
  if (kDLProtocolVersion >= valuePtr) {
    int v55 = valuePtr;
  }
  *(_DWORD *)(a1 + 32) = v55;
  if (DLShouldLog(6)) {
    _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "_DLCheckVersionForAccept", 6, @"Using DeviceLink protocol version %d", v56, v57, v58, v59, *(_DWORD *)(a1 + 32));
  }
  CFRelease(v5);
  return v27;
}

uint64_t _DLCheckVersionForConnect(uint64_t a1, CFTypeRef *a2)
{
  CFTypeRef cf = 0;
  if (StreamHandlerReceive(*(void *)(a1 + 64), (CFDataRef *)&cf, a2))
  {
    if (DLShouldLog(3)) {
      _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "_DLCheckVersionForConnect", 3, @"Could not receive message: '%@'", v4, v5, v6, v7, (char)*a2);
    }
    if (cf) {
      CFRelease(cf);
    }
    return 0;
  }
  if (!cf)
  {
    if (DLShouldLog(3))
    {
      CFStringRef v18 = @"Did not receive version number data from accepting side";
LABEL_54:
      _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "_DLCheckVersionForConnect", 3, v18, v14, v15, v16, v17, (char)v80);
    }
    return 0;
  }
  CFArrayRef v8 = (const __CFArray *)CFPropertyListCreateFromXMLData(0, (CFDataRef)cf, 0, (CFStringRef *)a2);
  if (cf)
  {
    CFRelease(cf);
    CFTypeRef cf = 0;
  }
  if (!v8)
  {
    if (DLShouldLog(3)) {
      _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "_DLCheckVersionForConnect", 3, @"Did not receive version number array from accepting side: %@", v19, v20, v21, v22, (char)*a2);
    }
    return 0;
  }
  uint64_t valuePtr = 0;
  CFStringRef v9 = _DLGetParameterAtIndexWithDefaultValue(v8, 0, 0);
  if (v9 && CFEqual(v9, @"DLMessageVersionExchange"))
  {
    CFStringRef v23 = _DLGetParameterAtIndexWithDefaultValue(v8, 1, 0);
    CFStringRef v24 = _DLGetParameterAtIndexWithDefaultValue(v8, 2, 0);
    if (v23) {
      CFNumberGetValue((CFNumberRef)v23, kCFNumberIntType, (char *)&valuePtr + 4);
    }
    if (v24) {
      CFNumberGetValue((CFNumberRef)v24, kCFNumberIntType, &valuePtr);
    }
    if (DLShouldLog(6)) {
      _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "_DLCheckVersionForConnect", 6, @"Connecting side received version numbers from the accepting side. DeviceLink %d, app %d", v25, v26, v27, v28, SBYTE4(valuePtr));
    }
  }
  else if (DLShouldLog(6))
  {
    _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "_DLCheckVersionForConnect", 6, @"Connecting side received message from accepting side, but either message was NULL or a mismatch on the expected %@: %@", v10, v11, v12, v13, (char)@"DLMessageVersionExchange");
  }
  CFRelease(v8);
  if (!HIDWORD(valuePtr))
  {
    CFTypeRef v81 = 0;
    CFDataRef v40 = (const __CFData *)_DLCreateMessageDataV(@"DLMessageDisconnect", 1, v29, v30, v31, v32, v33, v34, @"Protocol version mismatch");
    int v41 = _DLSendData(*(void *)(a1 + 64), v40, &v81);
    if (v40) {
      CFRelease(v40);
    }
    if (v41)
    {
      if (DLShouldLog(3)) {
        _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "_DLCheckVersionForConnect", 3, @"Could not send disconnect message: '%@'", v42, v43, v44, v45, (char)v81);
      }
      if (v81)
      {
        CFRelease(v81);
        CFTypeRef v81 = 0;
      }
    }
    _DLCleanupStreamHandler(a1);
    return 0;
  }
  if (kDLProtocolVersion > SHIDWORD(valuePtr))
  {
    if (DLShouldLog(3)) {
      _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "_DLCheckVersionForConnect", 3, @"Connecting side determined that its DeviceLink protocol version is greater (connect: %d, accept: %d)", v35, v36, v37, v38, kDLProtocolVersion);
    }
    goto LABEL_28;
  }
  if (kDLProtocolVersion < SHIDWORD(valuePtr))
  {
    if (DLShouldLog(3)) {
      _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "_DLCheckVersionForConnect", 3, @"Connecting side determined that its DeviceLink protocol version is lesser (connect: %d, accept: %d)", v46, v47, v48, v49, kDLProtocolVersion);
    }
    uint64_t v50 = @"DLErrorAcceptingDeviceLinkGreater";
    goto LABEL_41;
  }
  int v71 = *(_DWORD *)(a1 + 36);
  if (v71 <= (int)valuePtr)
  {
    if (v71 >= (int)valuePtr)
    {
LABEL_28:
      uint64_t v39 = @"DLVersionsOk";
LABEL_42:
      uint64_t v51 = 1;
      goto LABEL_43;
    }
    if (DLShouldLog(3)) {
      _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "_DLCheckVersionForConnect", 3, @"Connecting side determined that its app protocol version is lesser (connect: %d, accept: %d)", v76, v77, v78, v79, *(_DWORD *)(a1 + 36));
    }
    uint64_t v50 = @"DLErrorAcceptingProtocolGreater";
LABEL_41:
    uint64_t v39 = (__CFString *)CFRetain(v50);
    *a2 = v39;
    goto LABEL_42;
  }
  if (DLShouldLog(3)) {
    _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "_DLCheckVersionForConnect", 3, @"Connecting side determined that its app protocol version is greater (connect: %d, accept: %d)", v72, v73, v74, v75, *(_DWORD *)(a1 + 36));
  }
  uint64_t v39 = (__CFString *)CFRetain(@"DLErrorConnectingProtocolGreater");
  uint64_t v51 = 0;
  *a2 = v39;
LABEL_43:
  int v52 = kDLProtocolVersion;
  if (kDLProtocolVersion >= SHIDWORD(valuePtr)) {
    int v52 = HIDWORD(valuePtr);
  }
  *(_DWORD *)(a1 + 32) = v52;
  if (DLShouldLog(6)) {
    _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "_DLCheckVersionForConnect", 6, @"Using DeviceLink protocol version %d", v53, v54, v55, v56, *(_DWORD *)(a1 + 32));
  }
  CFNumberRef v57 = CFNumberCreate(0, kCFNumberIntType, &kDLProtocolVersion);
  CFDataRef v64 = (const __CFData *)_DLCreateMessageDataV(@"DLMessageVersionExchange", 2, v58, v59, v60, v61, v62, v63, v39);
  if (v57) {
    CFRelease(v57);
  }
  int v65 = _DLSendData(*(void *)(a1 + 64), v64, a2);
  if (v64) {
    CFRelease(v64);
  }
  if (v65)
  {
    if (DLShouldLog(3))
    {
      CFTypeRef v80 = *a2;
      CFStringRef v18 = @"Could not send version response: '%@'";
      goto LABEL_54;
    }
    return 0;
  }
  if (DLShouldLog(6)) {
    _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "_DLCheckVersionForConnect", 6, @"Connecting side sent %@", v67, v68, v69, v70, (char)v39);
  }
  return v51;
}

uint64_t _DLMainThreadMessagePortCallback(int a1, uint64_t a2, uint64_t xmlData, void (***a4)(void, void), uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  CFDataRef v9 = (const __CFData *)xmlData;
  int v10 = a2;
  CFStringRef errorString = 0;
  int v11 = a2 & 0xFFFFFF00;
  unsigned int v12 = a2;
  if (a2 >= 0x10u && DLShouldLog(4))
  {
    uint64_t v95 = a4;
    _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "_DLMainThreadMessagePortCallback", 4, @"Main thread invoked with unknown msgid %d for connection %p", a5, a6, a7, a8, v12);
  }
  if (v11 == *((_DWORD *)a4 + 1))
  {
    if (sSaveCallHistory == 1)
    {
      uint64_t v13 = v12 <= 0xF ? sDLMessageStrings[v12] : "(Invalid Message Code)";
      uint64_t v20 = (__CFString *)CFStringCreateWithFormat(0, 0, @"<- Main %s", v13, v95);
      _DLCallHistoryAddEntry(v20);
      if (v20) {
        CFRelease(v20);
      }
    }
    switch((char)v10)
    {
      case 1:
        _DLCreateIOPMAssertion((uint64_t)a4, a2, xmlData, (uint64_t)a4, a5, a6, a7, a8, v94);
        if (v9)
        {
          CFDataRef v9 = (const __CFData *)CFPropertyListCreateFromXMLData(0, v9, 0, &errorString);
          if (!v9)
          {
            if (DLShouldLog(3)) {
              _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "_DLMainThreadMessagePortCallback", 3, @"Could not create a property list from the message XML data: '%@'", v21, v22, v23, v24, (char)errorString);
            }
            CFDataRef v9 = 0;
          }
        }
        if (errorString)
        {
          CFRelease(errorString);
          CFStringRef errorString = 0;
        }
        (*a4[5])(a4, v9);
        goto LABEL_87;
      case 2:
        if (v9
          && (v43 = (const __CFArray *)CFPropertyListCreateFromXMLData(0, v9, 0, &errorString), (CFDataRef v9 = v43) != 0))
        {
          CFStringRef v44 = _DLGetParameterAtIndexWithDefaultValue(v43, 1, 0);
        }
        else
        {
          CFStringRef v44 = 0;
        }
        *(_DWORD *)a4 = 0;
        ((void (**)(void, const __CFString *))a4[5])[3](a4, v44);
        goto LABEL_87;
      case 3:
        _DLCreateIOPMAssertion((uint64_t)a4, a2, xmlData, (uint64_t)a4, a5, a6, a7, a8, v94);
        ((void (*)(void (***)(void, void)))a4[5][1])(a4);
        _DLRequestRead((uint64_t)a4);
        return 0;
      case 4:
        if (v9
          && (v41 = (const __CFArray *)CFPropertyListCreateFromXMLData(0, v9, 0, &errorString), (CFDataRef v9 = v41) != 0))
        {
          CFStringRef v42 = _DLGetParameterAtIndexWithDefaultValue(v41, 1, 0);
        }
        else
        {
          CFStringRef v42 = 0;
        }
        *(_DWORD *)a4 = 0;
        ((void (**)(void, const __CFString *))a4[5])[2](a4, v42);
LABEL_87:
        if (!v9) {
          return 0;
        }
        goto LABEL_92;
      case 5:
        if (v9)
        {
          CFArrayRef v25 = (const __CFArray *)CFPropertyListCreateFromXMLData(0, v9, 0, &errorString);
          if (v25)
          {
            CFArrayRef v26 = v25;
            CFIndex Count = CFArrayGetCount(v25);
            if (Count < 1) {
              goto LABEL_153;
            }
            unint64_t v28 = Count;
            CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v26, 0);
            if (sSaveCallHistory == 1) {
              _DLCallHistoryMain(@"HandleIncomingMessage", (uint64_t)ValueAtIndex);
            }
            if (!ValueAtIndex && DLShouldLog(4)) {
              _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "_DLHandleIncomingMessage", 4, @"HandleIncomingMessage called with NULL message!", v30, v31, v32, v33, v94);
            }
            if (CFEqual(ValueAtIndex, @"DLMessageDeviceReady"))
            {
              ((void (*)(void (***)(void, void)))a4[7][11])(a4);
              goto LABEL_153;
            }
            if (CFEqual(ValueAtIndex, @"DLMessageDisconnect"))
            {
              _DLCleanupStreamHandler((uint64_t)a4);
              if (v28 < 2) {
                CFStringRef v57 = 0;
              }
              else {
                CFStringRef v57 = _DLGetParameterAtIndexWithDefaultValue(v26, 1, 0);
              }
              ((void (**)(void, const __CFString *))a4[5])[4](a4, v57);
              goto LABEL_153;
            }
            if (CFEqual(ValueAtIndex, @"DLMessageProcessMessage"))
            {
              if (v28 < 2) {
                CFStringRef v58 = 0;
              }
              else {
                CFStringRef v58 = _DLGetParameterAtIndexWithDefaultValue(v26, 1, 0);
              }
              ((void (**)(void, const __CFString *))a4[5])[6](a4, v58);
              goto LABEL_153;
            }
            if (CFEqual(ValueAtIndex, @"DLMessagePing"))
            {
              if (v28 < 2) {
                CFStringRef v59 = 0;
              }
              else {
                CFStringRef v59 = _DLGetParameterAtIndexWithDefaultValue(v26, 1, 0);
              }
              ((void (**)(void, const __CFString *))a4[5])[7](a4, v59);
LABEL_116:
              _DLRequestRead((uint64_t)a4);
              goto LABEL_153;
            }
            if (CFStringCompare(ValueAtIndex, @"DLRequestFile", 0))
            {
              if (CFStringCompare(ValueAtIndex, @"DLSendFile", 0))
              {
                if (CFStringCompare(ValueAtIndex, @"DLMessageCreateDirectory", 0))
                {
                  if (CFEqual(ValueAtIndex, @"DLMessageRemoveDirectory"))
                  {
                    CFStringRef v76 = _DLGetParameterAtIndexWithDefaultValue(v26, 1, 0);
                    CFStringRef valuePtr = v76;
                    _DLGetParameterAtIndexWithDefaultValue(v26, 2, 0);
                    CFStringRef v77 = _DLGetParameterAtIndexWithDefaultValue(v26, 3, 0);
                    if (v76 && v77) {
                      _DLMainThreadMessagePortCallback_cold_1((const void **)&valuePtr);
                    }
                    if (!DLShouldLog(4)) {
                      goto LABEL_153;
                    }
                    CFStringRef v74 = @"RemoveDirectory message received with too few components";
                    goto LABEL_152;
                  }
                  if (CFStringCompare(ValueAtIndex, @"DLContentsOfDirectory", 0))
                  {
                    if (CFStringCompare(ValueAtIndex, @"DLMessageMoveFiles", 0)
                      && CFStringCompare(ValueAtIndex, @"DLMessageMoveItems", 0))
                    {
                      if (CFStringCompare(ValueAtIndex, @"DLMessageRemoveFiles", 0)
                        && CFStringCompare(ValueAtIndex, @"DLMessageRemoveItems", 0))
                      {
                        if (CFStringCompare(ValueAtIndex, @"DLMessageCopyItem", 0))
                        {
                          if (CFStringCompare(ValueAtIndex, @"DLMessageUploadFiles", 0))
                          {
                            if (CFStringCompare(ValueAtIndex, @"DLMessageDownloadFiles", 0))
                            {
                              if (CFStringCompare(ValueAtIndex, @"DLMessageGetFreeDiskSpace", 0))
                              {
                                if (CFEqual(ValueAtIndex, @"DLMessagePurgeDiskSpace")) {
                                  _DLMainThreadMessagePortCallback_cold_2(v26);
                                }
                                uint64_t v34 = (unsigned int (*)(void, const __CFArray *))a4[3];
                                if (!v34 || v34(a4, v26))
                                {
                                  if (DLShouldLog(4)) {
                                    _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "_DLHandleIncomingMessage", 4, @"HandleIncomingMessage called with unknown message: %@", v37, v38, v39, v40, (char)v26);
                                  }
                                  DLDisconnect((uint64_t)a4, @"Unknown Message Received", v35, v36, v37, v38, v39, v40);
                                }
                                goto LABEL_153;
                              }
LABEL_175:
                              abort();
                            }
                            CFStringRef v91 = _DLGetParameterAtIndexWithDefaultValue(v26, 1, 0);
                            _DLGetParameterAtIndexWithDefaultValue(v26, 2, 0);
                            CFStringRef v92 = _DLGetParameterAtIndexWithDefaultValue(v26, 3, 0);
                            CFStringRef v93 = _DLGetParameterAtIndexWithDefaultValue(v26, 4, 0);
                            if (v91 && v92 && v93) {
                              goto LABEL_175;
                            }
                            if (DLShouldLog(4))
                            {
                              CFStringRef v74 = @"DownloadFiles message received with too few components";
                              goto LABEL_152;
                            }
LABEL_153:
                            char v56 = 0;
LABEL_154:
                            if (errorString)
                            {
                              CFRelease(errorString);
                              CFStringRef errorString = 0;
                            }
                            if ((v56 & 1) == 0) {
                              CFRelease(v26);
                            }
                            *((unsigned char *)a4 + 145) = 0;
                            return 0;
                          }
                          _DLGetParameterAtIndexWithDefaultValue(v26, 1, 0);
                          CFStringRef v89 = _DLGetParameterAtIndexWithDefaultValue(v26, 2, 0);
                          CFStringRef v90 = _DLGetParameterAtIndexWithDefaultValue(v26, 3, 0);
                          if (v89 && v90) {
                            goto LABEL_175;
                          }
                          if (!DLShouldLog(4)) {
                            goto LABEL_153;
                          }
                          CFStringRef v74 = @"UploadFiles message received with too few components";
                        }
                        else
                        {
                          CFStringRef v85 = _DLGetParameterAtIndexWithDefaultValue(v26, 1, 0);
                          CFStringRef v86 = _DLGetParameterAtIndexWithDefaultValue(v26, 2, 0);
                          _DLGetParameterAtIndexWithDefaultValue(v26, 3, 0);
                          CFStringRef v87 = _DLGetParameterAtIndexWithDefaultValue(v26, 4, 0);
                          CFStringRef v88 = _DLGetParameterAtIndexWithDefaultValue(v26, 5, 0);
                          if (v85 && v86 && v87 && v88) {
                            goto LABEL_175;
                          }
                          if (!DLShouldLog(4)) {
                            goto LABEL_153;
                          }
                          CFStringRef v74 = @"CopyItem message received with too few components";
                        }
                      }
                      else
                      {
                        CFStringRef v82 = _DLGetParameterAtIndexWithDefaultValue(v26, 1, 0);
                        _DLGetParameterAtIndexWithDefaultValue(v26, 2, 0);
                        CFStringRef v83 = _DLGetParameterAtIndexWithDefaultValue(v26, 3, 0);
                        if (v82 && v83) {
                          goto LABEL_175;
                        }
                        if (!DLShouldLog(4)) {
                          goto LABEL_153;
                        }
                        CFStringRef v74 = @"RemoveItems message received with too few components";
                      }
                    }
                    else
                    {
                      CFStringRef v78 = _DLGetParameterAtIndexWithDefaultValue(v26, 1, 0);
                      _DLGetParameterAtIndexWithDefaultValue(v26, 2, 0);
                      CFStringRef v79 = _DLGetParameterAtIndexWithDefaultValue(v26, 3, 0);
                      if (v78 && v79) {
                        goto LABEL_175;
                      }
                      if (!DLShouldLog(4)) {
                        goto LABEL_153;
                      }
                      CFStringRef v74 = @"MoveItems message received with too few components";
                    }
                  }
                  else
                  {
                    CFStringRef v80 = _DLGetParameterAtIndexWithDefaultValue(v26, 1, 0);
                    _DLGetParameterAtIndexWithDefaultValue(v26, 2, 0);
                    CFStringRef v81 = _DLGetParameterAtIndexWithDefaultValue(v26, 3, 0);
                    if (v80 && v81) {
                      goto LABEL_175;
                    }
                    if (!DLShouldLog(4)) {
                      goto LABEL_153;
                    }
                    CFStringRef v74 = @"ContentsOfDirectory message received with too few components";
                  }
                }
                else
                {
                  CFStringRef v68 = _DLGetParameterAtIndexWithDefaultValue(v26, 1, 0);
                  _DLGetParameterAtIndexWithDefaultValue(v26, 2, 0);
                  CFStringRef v69 = _DLGetParameterAtIndexWithDefaultValue(v26, 3, 0);
                  if (v68 && v69) {
                    goto LABEL_175;
                  }
                  if (!DLShouldLog(4)) {
                    goto LABEL_153;
                  }
                  CFStringRef v74 = @"CreateDirectory message received with too few components";
                }
LABEL_152:
                _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "_DLHandleIncomingMessage", 4, v74, v70, v71, v72, v73, v94);
                goto LABEL_153;
              }
              if (v28 < 2)
              {
                CFStringRef v65 = 0;
              }
              else
              {
                CFStringRef v65 = _DLGetParameterAtIndexWithDefaultValue(v26, 1, 0);
                if (v28 != 2)
                {
                  CFStringRef v66 = _DLGetParameterAtIndexWithDefaultValue(v26, 2, 0);
LABEL_130:
                  ((void (*)(void (***)(void, void), const __CFString *, const __CFString *))a4[5][9])(a4, v65, v66);
                  LODWORD(valuePtr) = 0;
                  CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue((CFDictionaryRef)v66, @"DLFileStatusKey");
                  CFNumberGetValue(Value, kCFNumberIntType, &valuePtr);
                  if (valuePtr != 1) {
                    goto LABEL_153;
                  }
                  if (sSaveCallHistory == 1) {
                    _DLCallHistoryAddEntry(@"WaitForMessage");
                  }
                  goto LABEL_116;
                }
              }
              CFStringRef v66 = 0;
              goto LABEL_130;
            }
            if (v28 < 2)
            {
              CFStringRef v60 = 0;
            }
            else
            {
              CFStringRef v60 = _DLGetParameterAtIndexWithDefaultValue(v26, 1, 0);
              if (v28 != 2)
              {
                CFStringRef v61 = _DLGetParameterAtIndexWithDefaultValue(v26, 2, 0);
                CFStringRef v62 = v61;
                if (v28 < 4)
                {
                  if (v61) {
                    goto LABEL_146;
                  }
                }
                else
                {
                  CFStringRef v63 = _DLGetParameterAtIndexWithDefaultValue(v26, 3, 0);
                  if (v62)
                  {
                    if (v63)
                    {
                      CFDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy(0, 0, (CFDictionaryRef)v63);
LABEL_147:
                      uint64_t v67 = MutableCopy;
                      CFDictionarySetValue(MutableCopy, @"DLFileDest", v62);
LABEL_122:
                      ((void (*)(void (***)(void, void), const __CFString *, __CFDictionary *))a4[5][8])(a4, v60, v67);
                      if (v67) {
                        CFRelease(v67);
                      }
                      goto LABEL_153;
                    }
LABEL_146:
                    CFDictionaryRef MutableCopy = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
                    goto LABEL_147;
                  }
                }
              }
            }
            uint64_t v67 = 0;
            goto LABEL_122;
          }
        }
        else
        {
          CFStringRef errorString = (CFStringRef)CFRetain(@"NULL data returned from read");
        }
        if (DLShouldLog(3)) {
          _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "_DLMainThreadMessagePortCallback", 3, @"Error creating components from read data: '%@'", v52, v53, v54, v55, (char)errorString);
        }
        ((void (*)(void (***)(void, void)))a4[5][5])(a4);
        CFArrayRef v26 = 0;
        char v56 = 1;
        goto LABEL_154;
      case 6:
        if (!DLShouldLog(3)) {
          return 0;
        }
        CFStringRef v18 = @"DLMainThreadMessagePortCallback called with DLWriteMessage";
        goto LABEL_81;
      case 7:
        _DLReleaseIOPMAssertion((uint64_t)a4);
        a4[5][4](a4, 0);
        return 0;
      case 8:
        uint64_t v45 = (__CFMessagePort *)a4[10];
        if (v45) {
          DLThreadDeleteReceivePort(v45);
        }
        uint64_t v46 = (__CFMessagePort *)a4[12];
        if (v46) {
          DLThreadDeleteSendPort(v46);
        }
        uint64_t v47 = a4[15];
        if (v47) {
          CFRelease(v47);
        }
        free(a4);
        return 0;
      case 11:
        if (v9) {
          CFDataRef v9 = (const __CFData *)CFPropertyListCreateFromXMLData(0, v9, 0, &errorString);
        }
        CFIndex v48 = CFArrayGetCount(v9);
        if (v48 < 2)
        {
          CFStringRef v50 = 0;
        }
        else
        {
          CFIndex v49 = v48;
          CFStringRef v50 = _DLGetParameterAtIndexWithDefaultValue(v9, 1, 0);
          if (v49 != 2)
          {
            CFStringRef v51 = _DLGetParameterAtIndexWithDefaultValue(v9, 2, 0);
            goto LABEL_91;
          }
        }
        CFStringRef v51 = 0;
LABEL_91:
        ((void (*)(void (***)(void, void), const __CFString *, const __CFString *))a4[5][9])(a4, v50, v51);
        if (v9) {
LABEL_92:
        }
          CFRelease(v9);
        return 0;
      case 12:
        _DLReleaseIOPMAssertion((uint64_t)a4);
        ((void (*)(void (***)(void, void)))a4[5][5])(a4);
        return 0;
      case 13:
        if (!DLShouldLog(3)) {
          return 0;
        }
        CFStringRef v18 = @"DLMainThreadMessagePortCallback called with DLWriteThenReadMessage";
        goto LABEL_81;
      default:
        if (!DLShouldLog(3)) {
          return 0;
        }
        LOBYTE(v94) = v12;
        CFStringRef v18 = @"DLMainThreadMessagePortCallback called with unknown message type: %d";
LABEL_81:
        int v19 = 3;
        goto LABEL_10;
    }
  }
  if (DLShouldLog(4))
  {
    int v94 = v10 >> 8;
    CFStringRef v18 = @"Connection session number %d from incoming message doesn't match current connection %d (connection %p)";
    int v19 = 4;
LABEL_10:
    _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "_DLMainThreadMessagePortCallback", v19, v18, v14, v15, v16, v17, v94);
  }
  return 0;
}

void _DLCleanupStreamHandler(uint64_t a1)
{
  CFTypeRef cf = 0;
  _DLReleaseIOPMAssertion(a1);
  uint64_t v2 = *(void *)(a1 + 64);
  if (v2)
  {
    if (StreamHandlerClose(v2, &cf) && DLShouldLog(3)) {
      _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "_DLCleanupStreamHandler", 3, @"Closing the stream handler in handler thread: '%@'", v3, v4, v5, v6, (char)cf);
    }
    if (cf)
    {
      CFRelease(cf);
      CFTypeRef cf = 0;
    }
    if (StreamHandlerDeleteStreamHandler(*(void *)(a1 + 64), &cf) && DLShouldLog(3)) {
      _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "_DLCleanupStreamHandler", 3, @"Deleting the stream handler: '%@'", v7, v8, v9, v10, (char)cf);
    }
    if (cf) {
      CFRelease(cf);
    }
    *(void *)(a1 + 64) = 0;
  }
}

uint64_t _DLSendData(uint64_t a1, CFDataRef theData, CFTypeRef *a3)
{
  if (theData)
  {
    BytePtr = CFDataGetBytePtr(theData);
    unsigned int Length = CFDataGetLength(theData);
    unsigned int v9 = 0;
    return StreamHandlerSend(a1, (uint64_t)BytePtr, Length, &v9, a3);
  }
  else
  {
    return DLSetStatus(4294967293, a3, @"_DLSendAndReleaseData: data parameter is NULL");
  }
}

void _DLCreateIOPMAssertion(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  if (*(unsigned char *)(a1 + 146))
  {
    if (DLShouldLog(6)) {
      _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "_DLCreateIOPMAssertion", 6, @"Grabbing PreventIdleSleep assertion...", v10, v11, v12, v13, v19);
    }
    CFStringRef v14 = (const __CFString *)DLGetProcessName();
    if (IOPMAssertionCreateWithName(@"NoIdleSleepAssertion", 0xFFu, v14, (IOPMAssertionID *)(a1 + 208))
      && DLShouldLog(3))
    {
      _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "_DLCreateIOPMAssertion", 3, @"Could not grab idle sleep prevention assertion!", v15, v16, v17, v18, a9);
    }
  }
}

void _DLReleaseIOPMAssertion(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 146))
  {
    if (DLShouldLog(6)) {
      _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "_DLReleaseIOPMAssertion", 6, @"Releasing PreventIdleSleep assertion...", v2, v3, v4, v5, v11);
    }
    IOPMAssertionID v6 = *(_DWORD *)(a1 + 208);
    if (v6)
    {
      if (IOPMAssertionRelease(v6))
      {
        if (DLShouldLog(3)) {
          _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "_DLReleaseIOPMAssertion", 3, @"Could not release idle sleep prevention assertion", v7, v8, v9, v10, v11);
        }
      }
      *(_DWORD *)(a1 + 208) = 0;
    }
  }
}

uint64_t _DLHandlerThreadEntryPoint(uint64_t a1)
{
  uint64_t v8 = *(void *)(a1 + 72);
  CFStringRef v2 = CFStringCreateWithFormat(0, 0, @"%@.%@");
  *(void *)(a1 + 88) = DLThreadCreateReceivePort((uint64_t)v2, a1, (uint64_t)_DLHandlerThreadMessagePortCallback);
  *(void *)(a1 + 104) = DLThreadCreateSendPort((uint64_t)v2);
  if (v2) {
    CFRelease(v2);
  }
  DLThreadAddMessagePortToRunloop(*(__CFMessagePort **)(a1 + 88));
  DLSignal(*(pthread_cond_t **)(a1 + 128), *(pthread_mutex_t **)(a1 + 136), (unsigned char *)(a1 + 144));
  DLThreadRun();
  if (DLShouldLog(5)) {
    _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "_DLHandlerThreadEntryPoint", 5, @"Handler thread exited run loop", v3, v4, v5, v6, v8);
  }
  return 0;
}

uint64_t _DLDefaultOpenCallback(int a1, char *a2, int a3, unsigned int a4)
{
  return open(a2, a3, a4);
}

uint64_t _DLDefaultCloseCallback(int a1, int a2)
{
  return close(a2);
}

uint64_t _DLDefaultFstatCallback(int a1, int a2, stat *a3)
{
  return fstat(a2, a3);
}

ssize_t _DLDefaultReadCallback(int a1, int a2, void *a3, size_t a4)
{
  return read(a2, a3, a4);
}

ssize_t _DLDefaultWriteCallback(int a1, int __fd, void *__buf, size_t __nbyte)
{
  return write(__fd, __buf, __nbyte);
}

uint64_t DLThreadCreateThread(void *(__cdecl *a1)(void *), void *a2)
{
  pthread_t v3 = 0;
  return pthread_create(&v3, 0, a1, a2);
}

pthread_cond_t *DLCreateCondition()
{
  v0 = (pthread_cond_t *)malloc_type_calloc(0x30uLL, 1uLL, 0x2BF0165FuLL);
  int v1 = pthread_cond_init(v0, 0);
  if (v1)
  {
    char v2 = v1;
    if (DLShouldLog(3)) {
      _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/Utility/DeviceLinkThread.c", "DLCreateCondition", 3, @"Error initializing condition: %d", v3, v4, v5, v6, v2);
    }
    free(v0);
    return 0;
  }
  return v0;
}

void DLDeleteCondition(pthread_cond_t *a1)
{
  int v2 = pthread_cond_destroy(a1);
  free(a1);
  if (v2)
  {
    if (DLShouldLog(3)) {
      _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/Utility/DeviceLinkThread.c", "DLDeleteCondition", 3, @"Error destroying condition: %d", v3, v4, v5, v6, v2);
    }
  }
}

pthread_mutex_t *DLCreateMutex()
{
  v0 = (pthread_mutex_t *)malloc_type_calloc(0x40uLL, 1uLL, 0xD1EDBC5CuLL);
  if (pthread_mutex_init(v0, 0))
  {
    if (DLShouldLog(3)) {
      _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/Utility/DeviceLinkThread.c", "DLCreateMutex", 3, @"Error initializing mutex: %d");
    }
    free(v0);
    return 0;
  }
  return v0;
}

void DLDeleteMutex(pthread_mutex_t *a1)
{
  int v2 = pthread_mutex_destroy(a1);
  free(a1);
  if (v2)
  {
    if (DLShouldLog(3)) {
      _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/Utility/DeviceLinkThread.c", "DLDeleteMutex", 3, @"Error destroying mutex: %d", v3, v4, v5, v6, v2);
    }
  }
}

BOOL DLLock(pthread_mutex_t *a1)
{
  int v1 = pthread_mutex_lock(a1);
  if (v1 && DLShouldLog(3)) {
    _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/Utility/DeviceLinkThread.c", "DLLock", 3, @"Error locking mutex: %d");
  }
  return v1 == 0;
}

BOOL DLUnlock(pthread_mutex_t *a1)
{
  int v1 = pthread_mutex_unlock(a1);
  if (v1 && DLShouldLog(3)) {
    _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/Utility/DeviceLinkThread.c", "DLUnlock", 3, @"Error unlocking mutex: %d");
  }
  return v1 == 0;
}

void DLWait(pthread_cond_t *a1, pthread_mutex_t *a2, unsigned char *a3)
{
  int v6 = pthread_mutex_lock(a2);
  if (v6)
  {
    char v7 = v6;
    if (DLShouldLog(3)) {
      _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/Utility/DeviceLinkThread.c", "DLWait", 3, @"Error locking mutex to wait on condition: %d", v8, v9, v10, v11, v7);
    }
  }
  else
  {
    while (!*a3)
    {
      if (DLShouldLog(5)) {
        _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/Utility/DeviceLinkThread.c", "DLWait", 5, @"Waiting for flag to be set...", v12, v13, v14, v15, v32);
      }
      int v16 = pthread_cond_wait(a1, a2);
      if (v16)
      {
        char v17 = v16;
        if (DLShouldLog(3)) {
          _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/Utility/DeviceLinkThread.c", "DLWait", 3, @"Error waiting on condition: %d", v18, v19, v20, v21, v17);
        }
        break;
      }
    }
    if (DLShouldLog(5)) {
      _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/Utility/DeviceLinkThread.c", "DLWait", 5, @"Done waiting for flag to be set, ready to rock and roll", v22, v23, v24, v25, v32);
    }
    int v26 = pthread_mutex_unlock(a2);
    if (v26)
    {
      char v27 = v26;
      if (DLShouldLog(3)) {
        _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/Utility/DeviceLinkThread.c", "DLWait", 3, @"Error unlocking mutex after waiting on condition: %d", v28, v29, v30, v31, v27);
      }
    }
  }
}

void DLSignal(pthread_cond_t *a1, pthread_mutex_t *a2, unsigned char *a3)
{
  int v6 = pthread_mutex_lock(a2);
  if (v6)
  {
    char v7 = v6;
    if (DLShouldLog(3)) {
      _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/Utility/DeviceLinkThread.c", "DLSignal", 3, @"Error locking mutex to broadcast condition: %d", v8, v9, v10, v11, v7);
    }
  }
  else
  {
    *a3 = 1;
    int v12 = pthread_cond_broadcast(a1);
    if (v12)
    {
      char v13 = v12;
      if (DLShouldLog(3)) {
        _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/Utility/DeviceLinkThread.c", "DLSignal", 3, @"Error broadcasting for condition: %d", v14, v15, v16, v17, v13);
      }
    }
    int v18 = pthread_mutex_unlock(a2);
    if (v18)
    {
      char v19 = v18;
      if (DLShouldLog(3)) {
        _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/Utility/DeviceLinkThread.c", "DLSignal", 3, @"Error unlocking mutex after broadcasting condition: %d", v20, v21, v22, v23, v19);
      }
    }
  }
}

__CFMessagePort *DLThreadCreateReceivePort(uint64_t a1, uint64_t a2, uint64_t a3)
{
  Boolean shouldFreeInfo = 0;
  int v6 = malloc_type_calloc(0x10uLL, 1uLL, 0xF48238A9uLL);
  *int v6 = a2;
  v6[1] = a3;
  context.version = 0;
  memset(&context.retain, 0, 24);
  context.info = v6;
  uint64_t v7 = DLGetUniqueProcessName();
  uint64_t v8 = @"default";
  if (v7) {
    uint64_t v8 = (__CFString *)v7;
  }
  CFStringRef v9 = CFStringCreateWithFormat(0, 0, @"com.apple.DeviceLink.%@.%@", v8, a1, context.version, context.info, context.retain, context.release, context.copyDescription);
  uint64_t v10 = CFMessagePortCreateLocal(0, v9, (CFMessagePortCallBack)_DeviceLinkThreadMessageCallback, &context, &shouldFreeInfo);
  if (!v10 || shouldFreeInfo == 1)
  {
    if (DLShouldLog(3)) {
      _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/Utility/DeviceLinkThread.c", "DLThreadCreateReceivePort", 3, @"Can't create message port for %@ (%@)", v12, v13, v14, v15, a1);
    }
    uint64_t v11 = 0;
  }
  else
  {
    uint64_t v11 = v10;
    CFMessagePortSetInvalidationCallBack(v10, (CFMessagePortInvalidationCallBack)_DeviceLinkThreadPortInvalidationCallback);
  }
  CFRelease(v9);
  return v11;
}

uint64_t _DeviceLinkThreadMessageCallback(__CFMessagePort *a1, uint64_t a2, const __CFData *a3, uint64_t a4)
{
  if (DLShouldLog(7))
  {
    char v12 = decodeMsgId(a2);
    if (a3) {
      CFDataGetLength(a3);
    }
    _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/Utility/DeviceLinkThread.c", "_DeviceLinkThreadMessageCallback", 7, @"Callback with message %@-%d and %d bytes of data (0x%08x)", v8, v9, v10, v11, v12);
  }
  *(void *)buffer = 0;
  if (a3 && CFDataGetLength(a3) == 8)
  {
    v21.location = 0;
    v21.length = 8;
    CFDataGetBytes(a3, v21, buffer);
  }
  if (a1 && CFMessagePortIsValid(a1))
  {
    uint64_t v13 = (*(uint64_t (**)(__CFMessagePort *, uint64_t, void, void))(a4 + 8))(a1, a2, *(void *)buffer, *(void *)a4);
  }
  else
  {
    if (DLShouldLog(3)) {
      _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/Utility/DeviceLinkThread.c", "_DeviceLinkThreadMessageCallback", 3, @"Can't send message to nil or invalid port", v14, v15, v16, v17, v19);
    }
    uint64_t v13 = 0;
  }
  if (*(void *)buffer) {
    CFRelease(*(CFTypeRef *)buffer);
  }
  return v13;
}

void _DeviceLinkThreadPortInvalidationCallback(char a1)
{
  if (DLShouldLog(7)) {
    _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/Utility/DeviceLinkThread.c", "_DeviceLinkThreadPortInvalidationCallback", 7, @"Message port at 0x%08x is invalidated", v2, v3, v4, v5, a1);
  }
}

__CFMessagePort *DLThreadCreateSendPort(uint64_t a1)
{
  uint64_t v2 = DLGetUniqueProcessName();
  uint64_t v3 = @"default";
  if (v2) {
    uint64_t v3 = (__CFString *)v2;
  }
  CFStringRef v4 = CFStringCreateWithFormat(0, 0, @"com.apple.DeviceLink.%@.%@", v3, a1);
  Remote = CFMessagePortCreateRemote(0, v4);
  int v6 = Remote;
  if (Remote) {
    CFMessagePortSetInvalidationCallBack(Remote, (CFMessagePortInvalidationCallBack)_DeviceLinkThreadPortInvalidationCallback);
  }
  CFRelease(v4);
  return v6;
}

__CFMessagePort *DLThreadAddMessagePortToRunloop(__CFMessagePort *local)
{
  if (local)
  {
    local = CFMessagePortCreateRunLoopSource(0, local, 0);
    if (local)
    {
      int v1 = local;
      Current = CFRunLoopGetCurrent();
      CFRunLoopAddSource(Current, v1, (CFRunLoopMode)*MEMORY[0x263EFFE88]);
      CFRelease(v1);
      return (__CFMessagePort *)1;
    }
  }
  return local;
}

void DLThreadDeleteSendPort(__CFMessagePort *a1)
{
  if (a1)
  {
    CFMessagePortInvalidate(a1);
    CFRelease(a1);
  }
}

void DLThreadDeleteReceivePort(__CFMessagePort *a1)
{
  if (a1)
  {
    memset(&v3, 0, sizeof(v3));
    CFMessagePortGetContext(a1, &v3);
    info = v3.info;
    v3.info = 0;
    free(info);
    CFMessagePortInvalidate(a1);
    CFRelease(a1);
  }
}

CFDataRef _DLThreadSendMessage(__CFMessagePort *a1, SInt32 a2, const __CFData *a3, int a4)
{
  CFDataRef returnData;
  UInt8 bytes[8];

  CFDataRef v5 = a3;
  returnData = 0;
  *(void *)bytes = a3;
  if (DLShouldLog(7))
  {
    char v12 = decodeMsgId(a2);
    if (v5) {
      CFDataGetLength(v5);
    }
    _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/Utility/DeviceLinkThread.c", "_DLThreadSendMessage", 7, @"Invoked with message %@-%d and %d bytes of data (0x%08x)", v8, v9, v10, v11, v12);
  }
  if (v5) {
    CFDataRef v5 = CFDataCreate(0, bytes, 8);
  }
  if (a1 && CFMessagePortIsValid(a1) == 1)
  {
    double v13 = 0.0;
    if (a4)
    {
      double v13 = 86400.0;
      CFStringRef v14 = (const __CFString *)*MEMORY[0x263EFFE88];
    }
    else
    {
      CFStringRef v14 = 0;
    }
    SInt32 v15 = CFMessagePortSendRequest(a1, a2, v5, 5.0, v13, v14, &returnData);
    if (v15)
    {
      char v16 = v15;
      if (DLShouldLog(3)) {
        _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/Utility/DeviceLinkThread.c", "_DLThreadSendMessage", 3, @"Error %d returned from call to CFMessagePortSendRequest", v17, v18, v19, v20, v16);
      }
    }
  }
  else if (DLShouldLog(3))
  {
    _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/Utility/DeviceLinkThread.c", "_DLThreadSendMessage", 3, @"Can't send message to nil or invalid port", v21, v22, v23, v24, v26);
  }
  if (v5) {
    CFRelease(v5);
  }
  return returnData;
}

__CFString *decodeMsgId(unsigned int a1)
{
  if (a1 > 0x11) {
    return @"Unknown";
  }
  else {
    return (__CFString *)*((void *)&off_264D487A0 + (int)a1);
  }
}

void DLThreadSendMessage(__CFMessagePort *a1, SInt32 a2, const __CFData *a3)
{
  CFDataRef v3 = _DLThreadSendMessage(a1, a2, a3, 0);
  if (v3)
  {
    CFRelease(v3);
  }
}

CFDataRef DLThreadSendSyncMessage(__CFMessagePort *a1, SInt32 a2, const __CFData *a3)
{
  return _DLThreadSendMessage(a1, a2, a3, 1);
}

uint64_t DLSetStatus(uint64_t a1, CFTypeRef *a2, CFTypeRef cf)
{
  char v3 = (char)cf;
  if (a2)
  {
    *a2 = CFRetain(cf);
  }
  else if (DLLoggingEnabled(3) || DLOutputEnabled(3))
  {
    _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/Utility/DeviceLinkUtility.c", "DLSetStatus", 3, @"An error occured, but no error string pointer was passed to the function. The error was:\n%@", v5, v6, v7, v8, v3);
  }
  return a1;
}

BOOL DLShouldLog(int a1)
{
  if (DLLoggingEnabled(a1)) {
    return 1;
  }

  return DLOutputEnabled(a1);
}

void _DLLog(const char *a1, const char *a2, int a3, const __CFString *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  unint64_t v13 = 0x26897B000uLL;
  CFStringRef v14 = (pthread_mutex_t *)sLogMutex;
  v15 = (sLogMutex || (CFStringRef v14 = DLCreateMutex(), (sLogMutex = (uint64_t)v14) != 0)) && DLLock(v14);
  if (!a1) {
    a1 = "UNKNOWN";
  }
  if (a2) {
    char v16 = a2;
  }
  else {
    char v16 = "UNKNOWN";
  }
  size_t v17 = strlen(a1);
  do
  {
    size_t v18 = v17;
    uint64_t v19 = &a1[v17];
    unint64_t v20 = (unint64_t)&a1[v17 - 1];
    if (v20 <= (unint64_t)a1) {
      break;
    }
    --v17;
  }
  while (*(v19 - 2) != 47);
  uint64_t v21 = v19 - 2;
  if (v18 == 2) {
    unint64_t v22 = (unint64_t)v21;
  }
  else {
    unint64_t v22 = v20;
  }
  if ((a3 - 3) > 4) {
    uint64_t v23 = "UNKNOWN";
  }
  else {
    uint64_t v23 = (&off_264D48838)[a3 - 3];
  }
  CFAllocatorRef v24 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFStringRef v25 = CFStringCreateWithFormatAndArguments((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, a4, &a9);
  if (!DLLoggingEnabled(a3))
  {
    CFStringRef v29 = @"Log error";
    goto LABEL_50;
  }
  char v26 = (__CFDateFormatter *)dateFormat;
  if (dateFormat)
  {
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    CFStringRef StringWithAbsoluteTime = CFDateFormatterCreateStringWithAbsoluteTime(v24, v26, Current);
  }
  else
  {
    CFStringRef StringWithAbsoluteTime = &stru_26EB83258;
  }
  uint64_t v30 = DLGetProcessName();
  uint64_t v31 = getpid();
  pthread_t v32 = pthread_self();
  CFStringRef v29 = CFStringCreateWithFormat(0, 0, @"%@|%@|%ld:%lu|%s:%s| %s: %@\n", StringWithAbsoluteTime, v30, v31, v32, v22, v16, v23, v25);
  if (StringWithAbsoluteTime) {
    CFRelease(StringWithAbsoluteTime);
  }
  unint64_t v33 = 0x26897B000uLL;
  if ((logStream & 0x80000000) == 0) {
    goto LABEL_26;
  }
  CFURLRef v37 = (const __CFURL *)CFCopyHomeDirectoryURLForUser();
  if (!v37)
  {
    CFPrintf(@"Could not get a home directory path", usedBufLen);
    goto LABEL_50;
  }
  CFURLRef v38 = v37;
  CFURLRef v39 = CFURLCreateCopyAppendingPathComponent(0, v37, @"Library/Logs", 1u);
  CFRelease(v38);
  if (!v39)
  {
    CFPrintf(@"Could not get a log directory path from %@", 0);
    goto LABEL_50;
  }
  CFStringRef v85 = v16;
  if (sLogDirectoryName) {
    CFStringRef v40 = (const __CFString *)sLogDirectoryName;
  }
  else {
    CFStringRef v40 = @"DeviceLink";
  }
  CFURLRef v41 = CFURLCreateCopyAppendingPathComponent(0, v39, v40, 1u);
  CFRelease(v39);
  if (!v41)
  {
    CFPrintf(@"Could not get the current process' log directory path at %@", 0);
    goto LABEL_47;
  }
  CFStringRef v42 = CFURLCopyFileSystemPath(v41, kCFURLPOSIXPathStyle);
  if (!v42)
  {
    CFPrintf(@"Could not get a string for the current process' log directory path at %@", v41);
    CFStringRef v80 = v41;
LABEL_85:
    CFRelease(v80);
    goto LABEL_47;
  }
  CFStringRef v43 = v42;
  DLEnsureDirectoryExists(v42);
  CFRelease(v43);
  CFStringRef v44 = (const __CFString *)DLGetProcessName();
  if (v44
    && (CFStringRef v45 = v44,
        uint64_t Length = CFStringGetLength(v44),
        v47.location = (unint64_t)CFStringFind(v45, @"/", 4uLL).location + 1,
        Length - v47.location >= 1))
  {
    v47.length = Length - v47.location;
    CFStringRef v48 = CFStringCreateWithSubstring(0, v45, v47);
  }
  else
  {
    CFStringRef v48 = @"DeviceLink";
  }
  CFURLRef v61 = CFURLCreateCopyAppendingPathComponent(0, v41, v48, 0);
  CFRelease(v41);
  if (!v61)
  {
    CFPrintf(@"Could not create a log base filename from %@", 0);
    if (v48)
    {
      CFStringRef v80 = v48;
      goto LABEL_85;
    }
LABEL_47:
    char v16 = v85;
    goto LABEL_50;
  }
  unint64_t v83 = v22;
  CFStringRef StringForLogFile = _createStringForLogFile(v61, 0);
  if (StringForLogFile)
  {
    CFStringRef v63 = StringForLogFile;
    BOOL v64 = v15;
    memset(&v86, 0, sizeof(v86));
    CFStringRef v65 = (char *)DLCreateCStringFromCFString(StringForLogFile);
    int v66 = stat(v65, &v86);
    CFRelease(v63);
    if (v66)
    {
      BOOL v15 = v64;
      unint64_t v13 = 0x26897B000;
    }
    else
    {
      BOOL v15 = v64;
      unint64_t v13 = 0x26897B000;
      if (v86.st_size >= 16777217)
      {
        CFStringRef v82 = v23;
        BOOL v84 = v15;
        uint64_t v67 = 1;
        do
        {
          CFStringRef v68 = _createStringForLogFile(v61, v67);
          CFStringRef v69 = (char *)DLCreateCStringFromCFString(v68);
          int v70 = stat(v69, &v86);
          free(v69);
          if (v68) {
            CFRelease(v68);
          }
          if (v70) {
            uint64_t v67 = v67;
          }
          else {
            uint64_t v67 = (v67 + 1);
          }
        }
        while (!v70 && v67 < 0xB);
        if ((int)v67 >= 10) {
          uint64_t v67 = 10;
        }
        else {
          uint64_t v67 = v67;
        }
        do
        {
          CFStringRef v71 = _createStringForLogFile(v61, v67);
          uint64_t v67 = (v67 - 1);
          CFStringRef v72 = _createStringForLogFile(v61, v67);
          uint64_t v73 = (std::__fs::filesystem::path *)DLCreateCStringFromCFString(v71);
          CFStringRef v74 = (std::__fs::filesystem::path *)DLCreateCStringFromCFString(v72);
          rename(v74, v73, v75);
          if (v76 < 0)
          {
            CFStringRef v77 = __error();
            CFStringRef v78 = strerror(*v77);
            CFPrintf(@"Could not move log file from %s to %s: %s", v74, v73, v78);
          }
          free(v73);
          free(v74);
        }
        while ((v67 + 1) > 1);
        unint64_t v13 = 0x26897B000;
        BOOL v15 = v84;
        uint64_t v23 = v82;
        int v79 = open(v65, 1538, 384);
        goto LABEL_91;
      }
    }
    int v79 = open(v65, 522, 384);
LABEL_91:
    logStream = v79;
    CFRelease(v61);
    if ((logStream & 0x80000000) == 0)
    {
      atexit((void (*)(void))_closeLogStream);
      if (v48) {
        CFRelease(v48);
      }
      free(v65);
      char v16 = v85;
      unint64_t v22 = v83;
      unint64_t v33 = 0x26897B000;
LABEL_26:
      unint64_t v34 = v33;
      CFStringEncoding v35 = 134217984;
      *(void *)&v86.st_dev = 0;
      v87.length = CFStringGetLength(v29);
      v87.location = 0;
      CFStringRef v85 = v16;
      if (CFStringGetBytes(v29, v87, 0x8000100u, 0, 0, 0, v87.length, (CFIndex *)&v86.st_dev) <= 0)
      {
        CFPrintf(@"Can't determine byte count for log line, falling back to ASCII.\nLine is %@\n", v29);
        CFIndex v36 = CFStringGetLength(v29);
        CFStringEncoding v35 = 1536;
      }
      else
      {
        CFIndex v36 = *(void *)&v86.st_dev;
      }
      CFIndex v49 = malloc_type_malloc(((v36 << 32) + 0x100000000) >> 32, 0xACC7CA42uLL);
      if (CFStringGetCString(v29, (char *)v49, ((v36 << 32) + 0x100000000) >> 32, v35))
      {
        if (write(*(_DWORD *)(v34 + 1084), v49, (int)v36) < 0 && DLOutputEnabled(3)) {
          CFPrintf(@"Error writing to the log file stream: %s\n", v49);
        }
        free(v49);
      }
      else
      {
        uint64_t FastestEncoding = CFStringGetFastestEncoding(v29);
        CFStringEncoding v51 = CFStringGetFastestEncoding(v29);
        CFStringRef NameOfEncoding = CFStringGetNameOfEncoding(v51);
        uint64_t SmallestEncoding = CFStringGetSmallestEncoding(v29);
        CFStringEncoding v54 = CFStringGetSmallestEncoding(v29);
        CFStringRef v55 = CFStringGetNameOfEncoding(v54);
        CFPrintf(@"Could not get C string to log to the log file, fastest string encoding is %d: %@, smallest string encoding is %d: %@, line is %@\n", FastestEncoding, NameOfEncoding, SmallestEncoding, v55, v29);
      }
      unint64_t v13 = 0x26897B000;
      goto LABEL_47;
    }
    CFPrintf(@"Could not open log file at %s\n", v65);
    if (v48) {
      CFRelease(v48);
    }
    free(v65);
    char v16 = v85;
    goto LABEL_98;
  }
  CFPrintf(@"Could not get a string for the log file name %@", v61);
  char v16 = v85;
  if (v48) {
    CFRelease(v48);
  }
  CFRelease(v61);
LABEL_98:
  unint64_t v22 = v83;
LABEL_50:
  if (DLOutputEnabled(a3))
  {
    uint64_t v56 = getpid();
    pthread_t v57 = pthread_self();
    CFStringRef v58 = CFStringCreateWithFormat(0, 0, @"%ld:%lu|%s:%s| %s: %@", v56, v57, v22, v16, v23, v25);
    CFStringRef v59 = (const char *)DLCreateCStringFromCFString(v58);
    if (v59)
    {
      CFStringRef v60 = (char *)v59;
      syslog(a3, "%s", v59);
      free(v60);
    }
    CFRelease(v58);
  }
  if (v29) {
    CFRelease(v29);
  }
  if (v25) {
    CFRelease(v25);
  }
  if (v15) {
    DLUnlock(*(pthread_mutex_t **)(v13 + 1120));
  }
}

CFStringRef DLCopyHomeDirPath()
{
  CFURLRef v0 = (const __CFURL *)CFCopyHomeDirectoryURLForUser();
  if (v0)
  {
    CFURLRef v1 = v0;
    CFStringRef v2 = CFURLCopyFileSystemPath(v0, kCFURLPOSIXPathStyle);
    CFRelease(v1);
    return v2;
  }
  else
  {
    fwrite("Could not get a home URL for the default user\n", 0x2EuLL, 1uLL, (FILE *)*MEMORY[0x263EF8348]);
    return 0;
  }
}

CFStringRef _DLWarnAboutUsingCopyHomeDirPathAndCallDLCopyHomeDirPath()
{
  if ((_DLWarnAboutUsingCopyHomeDirPathAndCallDLCopyHomeDirPath_pScreamedAndShouted & 1) == 0)
  {
    _DLWarnAboutUsingCopyHomeDirPathAndCallDLCopyHomeDirPath_pScreamedAndShouted = 1;
    if (DLLoggingEnabled(3) || DLOutputEnabled(3)) {
      _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/Utility/DeviceLinkUtility.c", "_DLWarnAboutUsingCopyHomeDirPathAndCallDLCopyHomeDirPath", 3, @"*** The function copyHomeDirPath has been deprecated and will be removed in a future release. Change your code to use DLCopyHomeDirPath.", v0, v1, v2, v3, vars0);
    }
  }

  return DLCopyHomeDirPath();
}

CFStringRef DLCopyTempDir()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  strcpy(buffer, "/tmp");
  return CFStringCreateWithFileSystemRepresentation(0, buffer);
}

CFStringRef DLStringByAppendingPathComponent(const __CFString *a1, const __CFString *a2)
{
  if (CFStringGetLength(a1))
  {
    CFStringRef v4 = (char *)DLCreateCStringFromCFString(a1);
    memset(&v11, 0, sizeof(v11));
    Boolean v5 = stat(v4, &v11) >= 0 && (v11.st_mode & 0x4000) != 0;
    CFURLRef v6 = CFURLCreateWithFileSystemPath(0, a1, kCFURLPOSIXPathStyle, v5);
    CFURLRef v7 = CFURLCreateCopyAppendingPathComponent(0, v6, a2, v5);
    CFStringRef v8 = CFURLCopyFileSystemPath(v7, kCFURLPOSIXPathStyle);
    CFRelease(v6);
    CFRelease(v7);
    free(v4);
    return v8;
  }
  else
  {
    v10.length = CFStringGetLength(a2);
    v10.location = 0;
    return CFStringCreateWithSubstring(0, a2, v10);
  }
}

void *DLCreateCStringFromCFString(const __CFString *a1)
{
  if (!a1) {
    return 0;
  }
  CFIndex Length = CFStringGetLength(a1);
  CFIndex v3 = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u) + 1;
  CFStringRef v4 = malloc_type_malloc(v3, 0x3875796FuLL);
  Boolean v5 = v4;
  if (v4)
  {
    bzero(v4, v3);
    if (!CFStringGetCString(a1, (char *)v5, v3, 0x8000100u))
    {
      free(v5);
      return 0;
    }
  }
  return v5;
}

CFStringRef DLStringByRemovingLastPathComponent(const __CFString *a1)
{
  uint64_t v2 = (char *)DLCreateCStringFromCFString(a1);
  memset(&v8, 0, sizeof(v8));
  Boolean v3 = stat(v2, &v8) >= 0 && (v8.st_mode & 0x4000) != 0;
  CFURLRef v4 = CFURLCreateWithFileSystemPath(0, a1, kCFURLPOSIXPathStyle, v3);
  CFURLRef PathComponent = CFURLCreateCopyDeletingLastPathComponent(0, v4);
  CFStringRef v6 = CFURLCopyFileSystemPath(PathComponent, kCFURLPOSIXPathStyle);
  CFRelease(v4);
  CFRelease(PathComponent);
  free(v2);
  return v6;
}

void DLEnsureDirectoryExists(const __CFString *a1)
{
  if (a1)
  {
    CFIndex MaximumSizeOfFileSystemRepresentation = CFStringGetMaximumSizeOfFileSystemRepresentation(a1);
    Boolean v3 = (char *)malloc_type_calloc(1uLL, MaximumSizeOfFileSystemRepresentation, 0x1D38B2CDuLL);
    if (v3)
    {
      CFURLRef v4 = v3;
      if (CFStringGetFileSystemRepresentation(a1, v3, MaximumSizeOfFileSystemRepresentation) == 1)
      {
        memset(&v17, 0, sizeof(v17));
        if (stat(v4, &v17))
        {
          bzero(v4, MaximumSizeOfFileSystemRepresentation);
          CFArrayRef ArrayBySeparatingStrings = CFStringCreateArrayBySeparatingStrings(0, a1, @"/");
          if (ArrayBySeparatingStrings)
          {
            CFArrayRef v6 = ArrayBySeparatingStrings;
            int Count = CFArrayGetCount(ArrayBySeparatingStrings);
            if (Count >= 2)
            {
              uint64_t v8 = Count;
              CFIndex v9 = 1;
              while (1)
              {
                CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v6, v9);
                CFIndex v11 = CFStringGetMaximumSizeOfFileSystemRepresentation(ValueAtIndex);
                char v12 = malloc_type_calloc(1uLL, v11, 0x5ABF349uLL);
                if (CFStringGetFileSystemRepresentation(ValueAtIndex, (char *)v12, v11) != 1)
                {
                  fwrite("DLEnsureDirectoryExists: Can't get File System encoded char* for path component string\n", 0x57uLL, 1uLL, (FILE *)*MEMORY[0x263EF8348]);
                  free(v12);
                  goto LABEL_23;
                }
                *(_WORD *)&v4[strlen(v4)] = 47;
                strcat(v4, (const char *)v12);
                free(v12);
                if (stat(v4, &v17))
                {
                  if (mkdir(v4, 0x1FFu) && *__error() != 17) {
                    break;
                  }
                }
                if (v8 == ++v9) {
                  goto LABEL_23;
                }
              }
              CFStringRef v14 = (FILE *)*MEMORY[0x263EF8348];
              BOOL v15 = __error();
              char v16 = strerror(*v15);
              fprintf(v14, "DLEnsureDirectoryExists: Can't make directory for %s: %s\n", v4, v16);
            }
LABEL_23:
            CFRelease(v6);
          }
        }
        free(v4);
      }
      else
      {
        fwrite("DLEnsureDirectoryExists: Can't get File System encoded char* for path component string\n", 0x57uLL, 1uLL, (FILE *)*MEMORY[0x263EF8348]);
        free(v4);
      }
    }
    else
    {
      fprintf((FILE *)*MEMORY[0x263EF8348], "DLEnsureDirectoryExists: can't malloc %ld bytes", MaximumSizeOfFileSystemRepresentation);
    }
  }
  else
  {
    unint64_t v13 = (FILE *)*MEMORY[0x263EF8348];
    fwrite("DLEnsureDirectoryExists called on a NULL path\n", 0x2EuLL, 1uLL, v13);
  }
}

__CFDictionary *DLCopyFileAttributes(const __CFString *a1)
{
  if (a1)
  {
    uint64_t v2 = (const char *)DLCreateCStringFromCFString(a1);
    if (v2)
    {
      Boolean v3 = (char *)v2;
      memset(&valuePtr, 0, sizeof(valuePtr));
      if (!stat(v2, &valuePtr))
      {
        free(v3);
        Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
        CFDictionaryAddValue(Mutable, @"Filename", a1);
        _DLAddNumberToDict(&valuePtr, kCFNumberSInt32Type, @"DeviceIdentifier", Mutable, v14, v15, v16, v17, v77);
        _DLAddNumberToDict(&valuePtr.st_ino, kCFNumberSInt32Type, @"FileSystemFileNumber", Mutable, v18, v19, v20, v21, v78);
        _DLAddNumberToDict(&valuePtr.st_mode, kCFNumberSInt16Type, @"FileMode", Mutable, v22, v23, v24, v25, v79);
        _DLAddNumberToDict(&valuePtr.st_nlink, kCFNumberSInt16Type, @"LinkCount", Mutable, v26, v27, v28, v29, v80);
        _DLAddNumberToDict(&valuePtr.st_uid, kCFNumberSInt32Type, @"OwnerAccountID", Mutable, v30, v31, v32, v33, v81);
        _DLAddNumberToDict(&valuePtr.st_gid, kCFNumberSInt32Type, @"GroupOwnerAccountID", Mutable, v34, v35, v36, v37, v82);
        _DLAddNumberToDict(&valuePtr.st_rdev, kCFNumberSInt32Type, @"DeviceType", Mutable, v38, v39, v40, v41, v83);
        _DLAddDateToDict(&valuePtr.st_atimespec.tv_sec, @"AccessTime", Mutable, v42, v43, v44, v45, v46, v84);
        _DLAddDateToDict(&valuePtr.st_mtimespec.tv_sec, @"ModificationTime", Mutable, v47, v48, v49, v50, v51, v85);
        _DLAddDateToDict(&valuePtr.st_ctimespec.tv_sec, @"ChangeTime", Mutable, v52, v53, v54, v55, v56, v86);
        _DLAddNumberToDict(&valuePtr.st_size, kCFNumberSInt64Type, @"FileSize", Mutable, v57, v58, v59, v60, v87);
        _DLAddNumberToDict(&valuePtr.st_blocks, kCFNumberSInt64Type, @"BlockCount", Mutable, v61, v62, v63, v64, v88);
        _DLAddNumberToDict(&valuePtr.st_blksize, kCFNumberSInt32Type, @"BlockSize", Mutable, v65, v66, v67, v68, v89);
        _DLAddNumberToDict(&valuePtr.st_flags, kCFNumberSInt32Type, @"FileFlags", Mutable, v69, v70, v71, v72, v90);
        _DLAddNumberToDict(&valuePtr.st_gen, kCFNumberSInt32Type, @"GenerationNumber", Mutable, v73, v74, v75, v76, v91);
        return Mutable;
      }
      if (DLLoggingEnabled(3) || DLOutputEnabled(3)) {
        _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/Utility/DeviceLinkUtility.c", "DLCopyFileAttributes", 3, @"Could not stat the file at \"%s\"", v4, v5, v6, v7, (char)v3);
      }
    }
    else if (DLLoggingEnabled(3) || DLOutputEnabled(3))
    {
      _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/Utility/DeviceLinkUtility.c", "DLCopyFileAttributes", 3, @"Could not create a C string from the CFString \"%@\"", v8, v9, v10, v11, (char)a1);
    }
  }
  return 0;
}

CFDictionaryRef DLIsChar(const __CFDictionary *a1)
{
  return _DLIsType(a1, 0x2000);
}

CFDictionaryRef _DLIsType(const __CFDictionary *result, int a2)
{
  unsigned __int16 valuePtr = 0;
  if (result)
  {
    CFDictionaryRef v3 = result;
    CFTypeRef result = (const __CFDictionary *)CFDictionaryGetCount(result);
    if (result)
    {
      CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(v3, @"FileMode");
      CFNumberGetValue(Value, kCFNumberSInt16Type, &valuePtr);
      return (const __CFDictionary *)(((unsigned __int16)a2 & valuePtr & 0xF000) == a2);
    }
  }
  return result;
}

CFDictionaryRef DLIsDir(const __CFDictionary *a1)
{
  return _DLIsType(a1, 0x4000);
}

CFDictionaryRef DLIsRegular(const __CFDictionary *a1)
{
  return _DLIsType(a1, 0x8000);
}

CFDictionaryRef DLIsFIFO(const __CFDictionary *a1)
{
  return _DLIsType(a1, 4096);
}

CFDictionaryRef DLIsBlock(const __CFDictionary *a1)
{
  return _DLIsType(a1, 24576);
}

CFDictionaryRef DLIsSymlink(const __CFDictionary *a1)
{
  return _DLIsType(a1, 40960);
}

CFDictionaryRef DLIsSocket(const __CFDictionary *a1)
{
  return _DLIsType(a1, 49152);
}

CFMutableArrayRef DLMemoryPoolCreate()
{
  return CFArrayCreateMutable(0, 0, &_MemoryPoolArrayCallbacks);
}

void *DLMemoryPoolAddObject(__CFArray *a1, void *value)
{
  if (a1 && value) {
    CFArrayAppendValue(a1, value);
  }
  return value;
}

uint64_t DLStatusFromOSStatus(int a1, CFStringRef *a2)
{
  if (a1 != -1) {
    return 0;
  }
  if (a2)
  {
    uint64_t v4 = __error();
    uint64_t v5 = strerror(*v4);
    uint64_t v6 = __error();
    *a2 = CFStringCreateWithFormat(0, 0, @"%s (%d)", v5, *v6);
  }
  int v7 = *__error();
  if (v7 > 19)
  {
    if (v7 > 27)
    {
      if (v7 == 28) {
        return 4294967281;
      }
      if (v7 == 62) {
        return 4294967286;
      }
    }
    else
    {
      if (v7 == 20) {
        return 4294967288;
      }
      if (v7 == 21) {
        return 4294967287;
      }
    }
    return 0xFFFFFFFFLL;
  }
  if (v7 == 2) {
    return 4294967290;
  }
  if (v7 != 5)
  {
    if (v7 == 17) {
      return 4294967289;
    }
    return 0xFFFFFFFFLL;
  }
  return 4294967285;
}

uint64_t DLGetProcessName()
{
  uint64_t result = _DLProcessName;
  if (!_DLProcessName)
  {
    uint64_t v1 = *(const char **)_CFGetProgname();
    if (!v1) {
      uint64_t v1 = "Unknown";
    }
    CFStringRef v2 = CFStringCreateWithFormat(0, 0, @"%s", v1);
    DLSetProcessName(v2);
    CFRelease(v2);
    return _DLProcessName;
  }
  return result;
}

void DLSetProcessName(CFStringRef theString)
{
  if (theString)
  {
    if (_DLProcessName)
    {
      CFRelease((CFTypeRef)_DLProcessName);
      _DLProcessName = 0;
    }
    _DLProcessName = (uint64_t)CFStringCreateCopy(0, theString);
    DLRegenerateUniqueProcessName();
  }
}

uint64_t DLGetUniqueProcessName()
{
  uint64_t result = _DLUniqueProcessName;
  if (!_DLUniqueProcessName)
  {
    DLGetProcessName();
    return _DLUniqueProcessName;
  }
  return result;
}

void DLRegenerateUniqueProcessName()
{
  if (!_DLProcessName) {
    DLGetProcessName();
  }
  CFStringRef v0 = DLCreateUUID();
  if (_DLUniqueProcessName)
  {
    CFRelease((CFTypeRef)_DLUniqueProcessName);
    _DLUniqueProcessName = 0;
  }
  CFStringRef ValueAtIndex = (const void *)_DLProcessName;
  CFArrayRef ArrayBySeparatingStrings = CFStringCreateArrayBySeparatingStrings(0, (CFStringRef)_DLProcessName, @"/");
  if (ArrayBySeparatingStrings)
  {
    CFArrayRef v3 = ArrayBySeparatingStrings;
    int Count = CFArrayGetCount(ArrayBySeparatingStrings);
    if (Count >= 2) {
      CFStringRef ValueAtIndex = CFArrayGetValueAtIndex(v3, (Count - 1));
    }
    _DLUniqueProcessName = (uint64_t)CFStringCreateWithFormat(0, 0, @"%@.%@", ValueAtIndex, v0);
    CFRelease(v3);
  }
  else
  {
    _DLUniqueProcessName = (uint64_t)CFStringCreateWithFormat(0, 0, @"%@.%@", ValueAtIndex, v0);
  }

  CFRelease(v0);
}

CFStringRef DLCreateUUID()
{
  CFAllocatorRef v0 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFUUIDRef v1 = CFUUIDCreate((CFAllocatorRef)*MEMORY[0x263EFFB08]);
  CFStringRef v2 = CFUUIDCreateString(v0, v1);
  CFRelease(v1);
  return v2;
}

void CFPrintf(CFStringRef format, ...)
{
  va_start(va, format);
  CFStringRef v1 = CFStringCreateWithFormatAndArguments((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, format, va);
  CFStringRef v2 = (const char *)DLCreateCStringFromCFString(v1);
  if (v2)
  {
    CFArrayRef v3 = (char *)v2;
    fprintf((FILE *)*MEMORY[0x263EF8358], "%s\n", v2);
    free(v3);
  }
  else
  {
    fwrite("Error: Could not get C string. CFShow output follows:\n", 0x36uLL, 1uLL, (FILE *)*MEMORY[0x263EF8348]);
    CFShow(v1);
  }
  CFRelease(v1);
}

BOOL DLLoggingEnabled(int a1)
{
  if ((loggingInitalized & 1) == 0) {
    initializeLogging();
  }
  if ((loggingDefaultRead & 1) == 0)
  {
    loggingDefaultRead = 1;
    Boolean keyExistsAndHasValidFormat = 0;
    AppIntegerCFNumberRef Value = CFPreferencesGetAppIntegerValue(@"LogLevel", @"com.apple.DeviceLink", &keyExistsAndHasValidFormat);
    if (keyExistsAndHasValidFormat == 1) {
      curLogLevel = AppIntegerValue;
    }
  }
  return curLogLevel >= a1;
}

BOOL DLOutputEnabled(int a1)
{
  if ((loggingInitalized & 1) == 0) {
    initializeLogging();
  }
  if ((outputDefaultRead & 1) == 0)
  {
    outputDefaultRead = 1;
    Boolean keyExistsAndHasValidFormat = 0;
    AppIntegerCFNumberRef Value = CFPreferencesGetAppIntegerValue(@"OutputLevel", @"com.apple.DeviceLink", &keyExistsAndHasValidFormat);
    if (keyExistsAndHasValidFormat == 1) {
      curOutputLevel = AppIntegerValue;
    }
  }
  return curOutputLevel >= a1;
}

const char *DLSetLogDirectoryName(const char *cStr)
{
  if (cStr)
  {
    CFStringRef v1 = cStr;
    if (sLogDirectoryName)
    {
      CFRelease((CFTypeRef)sLogDirectoryName);
      sLogDirectoryName = 0;
    }
    sLogDirectoryName = (uint64_t)CFStringCreateWithCString(0, v1, 0x8000100u);
    return (const char *)DLGetProcessName();
  }
  return cStr;
}

__CFData *createDecryptedData(const __CFData *a1, CFDataRef theData, const __CFData *a3)
{
  if (!a1 || !theData)
  {
    if (DLLoggingEnabled(3) || DLOutputEnabled(3)) {
      _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/Utility/DeviceLinkUtility.c", "createDecryptedData", 3, @"Cannot decrypt without a key or data!", v8, v9, v10, v11, dataOut);
    }
    return 0;
  }
  size_t dataOutMoved = 0;
  BytePtr = CFDataGetBytePtr(theData);
  if (a3) {
    int v7 = CFDataGetBytePtr(a3);
  }
  else {
    int v7 = 0;
  }
  char v12 = CFDataGetBytePtr(a1);
  size_t Length = CFDataGetLength(a1);
  if (CCCrypt(1u, 0, 1u, BytePtr, 0x20uLL, v7, v12, Length, 0, 0, &dataOutMoved) != -4301
    && CFDataGetLength(a1)
    && (DLLoggingEnabled(3) || DLOutputEnabled(3)))
  {
    _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/Utility/DeviceLinkUtility.c", "createDecryptedData", 3, @"Woah- CCCrypt was ok with a 0 length buffer for the decrypted data. Something is going wrong.", v14, v15, v16, v17, dataOuta);
  }
  Mutable = CFDataCreateMutable(0, dataOutMoved);
  CFDataSetLength(Mutable, dataOutMoved);
  uint64_t v19 = CFDataGetBytePtr(theData);
  if (a3) {
    a3 = (const __CFData *)CFDataGetBytePtr(a3);
  }
  uint64_t v20 = CFDataGetBytePtr(a1);
  size_t v21 = CFDataGetLength(a1);
  MutableBytePtr = CFDataGetMutableBytePtr(Mutable);
  CCCryptorStatus v23 = CCCrypt(1u, 0, 1u, v19, 0x20uLL, a3, v20, v21, MutableBytePtr, dataOutMoved, &dataOutMoved);
  CFDataSetLength(Mutable, dataOutMoved);
  if (v23)
  {
    if (DLLoggingEnabled(4) || DLOutputEnabled(4)) {
      _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/Utility/DeviceLinkUtility.c", "createDecryptedData", 4, @"Could not decrypt data: %d", v24, v25, v26, v27, v23);
    }
    if (Mutable)
    {
      CFRelease(Mutable);
      return 0;
    }
  }
  return Mutable;
}

__CFData *createEncryptedData(const __CFData *a1, CFDataRef theData, const __CFData *a3)
{
  if (!a1 || !theData)
  {
    if (DLLoggingEnabled(3) || DLOutputEnabled(3)) {
      _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/Utility/DeviceLinkUtility.c", "createEncryptedData", 3, @"Cannot encrypt without a key or data!", v8, v9, v10, v11, dataOut);
    }
    return 0;
  }
  size_t dataOutMoved = 0;
  BytePtr = CFDataGetBytePtr(theData);
  if (a3) {
    int v7 = CFDataGetBytePtr(a3);
  }
  else {
    int v7 = 0;
  }
  char v12 = CFDataGetBytePtr(a1);
  size_t Length = CFDataGetLength(a1);
  if (CCCrypt(0, 0, 1u, BytePtr, 0x20uLL, v7, v12, Length, 0, 0, &dataOutMoved) != -4301
    && CFDataGetLength(a1)
    && (DLLoggingEnabled(3) || DLOutputEnabled(3)))
  {
    _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/Utility/DeviceLinkUtility.c", "createEncryptedData", 3, @"Woah- CCCrypt was ok with a 0 length buffer for the encrypted data. Something is going wrong.", v14, v15, v16, v17, dataOuta);
  }
  Mutable = CFDataCreateMutable(0, dataOutMoved);
  CFDataSetLength(Mutable, dataOutMoved);
  uint64_t v19 = CFDataGetBytePtr(theData);
  if (a3) {
    a3 = (const __CFData *)CFDataGetBytePtr(a3);
  }
  uint64_t v20 = CFDataGetBytePtr(a1);
  size_t v21 = CFDataGetLength(a1);
  MutableBytePtr = CFDataGetMutableBytePtr(Mutable);
  CCCryptorStatus v23 = CCCrypt(0, 0, 1u, v19, 0x20uLL, a3, v20, v21, MutableBytePtr, dataOutMoved, &dataOutMoved);
  CFDataSetLength(Mutable, dataOutMoved);
  if (v23)
  {
    if (DLLoggingEnabled(3) || DLOutputEnabled(3)) {
      _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/Utility/DeviceLinkUtility.c", "createEncryptedData", 3, @"Could not encrypt data: %d", v24, v25, v26, v27, v23);
    }
    if (Mutable)
    {
      CFRelease(Mutable);
      return 0;
    }
  }
  return Mutable;
}

CFDataRef createRandomBytes(int a1)
{
  v14[1] = *MEMORY[0x263EF8340];
  MEMORY[0x270FA5388]();
  CFArrayRef v3 = (char *)v14 - ((v2 + 15) & 0x1FFFFFFF0);
  int v4 = open("/dev/random", 0);
  if (!v4) {
    return 0;
  }
  int v5 = v4;
  ssize_t v6 = read(v4, v3, a1);
  if (v6 < a1)
  {
    char v7 = v6;
    if (DLLoggingEnabled(3) || DLOutputEnabled(3))
    {
      uint64_t v8 = __error();
      strerror(*v8);
      _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/Utility/DeviceLinkUtility.c", "createRandomBytes", 3, @"Could not read bytes in from /dev/random. %ld bytes read, %d bytes desired: %s", v9, v10, v11, v12, v7);
    }
    close(v5);
    return 0;
  }
  close(v5);
  return CFDataCreate(0, (const UInt8 *)v3, a1);
}

__CFData *createFileAuthBlob(const __CFData *a1, const __CFData **a2, const __CFData **a3)
{
  CFDataRef RandomBytes = createRandomBytes(16);
  CFDataRef v7 = createRandomBytes(32);
  EncryptedData = createEncryptedData(v7, a1, RandomBytes);
  if (EncryptedData)
  {
    CFDataRef v9 = EncryptedData;
    int Length = CFDataGetLength(RandomBytes);
    int v11 = CFDataGetLength(v9);
    unsigned int v12 = Length + v11 + 2;
    Mutable = CFDataCreateMutable(0, (unsigned __int16)(Length + v11 + 2) + 2);
    *(_WORD *)bytes = bswap32(v12) >> 16;
    UInt8 v25 = 1;
    UInt8 v24 = 0;
    CFDataAppendBytes(Mutable, bytes, 2);
    CFDataAppendBytes(Mutable, &v25, 1);
    CFDataAppendBytes(Mutable, &v24, 1);
    BytePtr = CFDataGetBytePtr(RandomBytes);
    CFIndex v15 = CFDataGetLength(RandomBytes);
    CFDataAppendBytes(Mutable, BytePtr, v15);
    uint64_t v16 = CFDataGetBytePtr(v9);
    CFIndex v17 = CFDataGetLength(v9);
    CFDataAppendBytes(Mutable, v16, v17);
    CFRelease(v9);
    if (!a2)
    {
      if (v7) {
        CFRelease(v7);
      }
      if (!a3) {
        goto LABEL_18;
      }
LABEL_17:
      *a3 = RandomBytes;
      return Mutable;
    }
  }
  else
  {
    if (DLLoggingEnabled(3) || DLOutputEnabled(3)) {
      _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/Utility/DeviceLinkUtility.c", "createFileAuthBlob", 3, @"Could not create encrypted auth data", v18, v19, v20, v21, v23);
    }
    if (RandomBytes) {
      CFRelease(RandomBytes);
    }
    if (v7) {
      CFRelease(v7);
    }
    if (!a2)
    {
      Mutable = 0;
      CFDataRef RandomBytes = 0;
      if (!a3) {
        return Mutable;
      }
      goto LABEL_17;
    }
    CFDataRef RandomBytes = 0;
    CFDataRef v7 = 0;
    Mutable = 0;
  }
  *a2 = v7;
  if (a3) {
    goto LABEL_17;
  }
LABEL_18:
  if (RandomBytes) {
    CFRelease(RandomBytes);
  }
  return Mutable;
}

__CFData *createFileKeyFromAuthBlob(const __CFData *a1, const __CFData *a2, const __CFData **a3, void *a4)
{
  if (!a1) {
    return 0;
  }
  uint64_t v8 = bswap32(*(unsigned __int16 *)CFDataGetBytePtr(a1)) >> 16;
  if (DLLoggingEnabled(6) || DLOutputEnabled(6)) {
    _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/Utility/DeviceLinkUtility.c", "createFileKeyFromAuthBlob", 6, @"Unpacking %d bytes of auth data", v9, v10, v11, v12, v8);
  }
  char v13 = CFDataGetBytePtr(a1)[2];
  CFDataGetBytePtr(a1);
  if (DLLoggingEnabled(6) || DLOutputEnabled(6)) {
    _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/Utility/DeviceLinkUtility.c", "createFileKeyFromAuthBlob", 6, @"Unpacking auth data v%d.%d", v14, v15, v16, v17, v13);
  }
  BytePtr = CFDataGetBytePtr(a1);
  CFDataRef v19 = CFDataCreate(0, BytePtr + 4, 16);
  uint64_t v20 = CFDataGetBytePtr(a1);
  CFDataRef v21 = CFDataCreate(0, v20 + 20, v8 - 18);
  CFDataRef v22 = v21;
  if (v19 && v21)
  {
    DecryptedData = createDecryptedData(v21, a2, v19);
    if (!DecryptedData)
    {
      if (DLLoggingEnabled(4) || DLOutputEnabled(4)) {
        _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/Utility/DeviceLinkUtility.c", "createFileKeyFromAuthBlob", 4, @"Could not decrypt the encryption key", v29, v30, v31, v32, v34);
      }
      UInt8 v24 = 0;
      goto LABEL_28;
    }
    UInt8 v24 = DecryptedData;
    if (a3)
    {
      *a3 = v19;
      if (!a4) {
        goto LABEL_28;
      }
    }
    else
    {
      CFRelease(v19);
      if (!a4)
      {
LABEL_28:
        CFRelease(v22);
        return v24;
      }
    }
    *a4 = v8 + 2;
    goto LABEL_28;
  }
  if (DLLoggingEnabled(3) || DLOutputEnabled(3)) {
    _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/Utility/DeviceLinkUtility.c", "createFileKeyFromAuthBlob", 3, @"Could not extract an iv and/or encryption key from the auth data", v25, v26, v27, v28, v34);
  }
  if (v19) {
    CFRelease(v19);
  }
  UInt8 v24 = 0;
  if (v22) {
    goto LABEL_28;
  }
  return v24;
}

uint64_t DLReleaseArgsAndReturn(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  char v13 = (CFTypeRef *)&a9;
  if (a2 >= 1)
  {
    int v10 = a2;
    do
    {
      uint64_t v11 = v13++;
      if (*v11) {
        CFRelease(*v11);
      }
      --v10;
    }
    while (v10);
  }
  return a1;
}

__CFString *DLCreateDataFromString(__CFString *result)
{
  if (result)
  {
    CFStringRef v1 = result;
    CFIndex v2 = CFStringGetLength(result);
    CFIndex MaximumSizeForEncoding = CFStringGetMaximumSizeForEncoding(v2, 0x8000100u);
    uint64_t result = (__CFString *)malloc_type_malloc(MaximumSizeForEncoding, 0xBFDF19F1uLL);
    if (result)
    {
      int v4 = (UInt8 *)result;
      CFIndex length = 0;
      v6.location = 0;
      v6.CFIndex length = v2;
      if (CFStringGetBytes(v1, v6, 0x8000100u, 0, 1u, (UInt8 *)result, MaximumSizeForEncoding, &length) == v2)
      {
        return (__CFString *)CFDataCreateWithBytesNoCopy(0, v4, length, (CFAllocatorRef)*MEMORY[0x263EFFB18]);
      }
      else
      {
        free(v4);
        return 0;
      }
    }
  }
  return result;
}

CFDataRef DLDataCreateWithMallocedBytesNoCopy(UInt8 *bytes, CFIndex length)
{
  return CFDataCreateWithBytesNoCopy(0, bytes, length, (CFAllocatorRef)*MEMORY[0x263EFFB18]);
}

CFStringRef DLCreateStringFromData(const __CFData *a1)
{
  BytePtr = CFDataGetBytePtr(a1);
  CFIndex Length = CFDataGetLength(a1);

  return CFStringCreateWithBytes(0, BytePtr, Length, 0x8000100u, 1u);
}

uint64_t DLGetFileSystemRepresentation(const __CFString *a1, void **a2, void *a3)
{
  if (a2)
  {
    CFIndex MaximumSizeOfFileSystemRepresentation = CFStringGetMaximumSizeOfFileSystemRepresentation(a1);
    CFDataRef v7 = (char *)malloc_type_malloc(MaximumSizeOfFileSystemRepresentation, 0x4ABC7A4uLL);
    *a2 = v7;
    if (CFStringGetFileSystemRepresentation(a1, v7, MaximumSizeOfFileSystemRepresentation)) {
      return 0;
    }
    if (a3) {
      *a3 = @"Error getting file system representation of path";
    }
    free(*a2);
  }
  else if (a3)
  {
    *a3 = @"Path is null";
  }
  return 0xFFFFFFFFLL;
}

CFPropertyListRef DLCreatePropertyListFromFile(CFURLRef fileURL, CFStringRef *a2)
{
  int v4 = CFReadStreamCreateWithFile(0, fileURL);
  if (v4)
  {
    int v5 = v4;
    CFPropertyListFormat format = 0;
    if (CFReadStreamOpen(v4) == 1)
    {
      CFPropertyListRef v6 = CFPropertyListCreateFromStream(0, v5, 0, 2uLL, &format, a2);
      CFReadStreamClose(v5);
LABEL_17:
      CFRelease(v5);
      return v6;
    }
    CFStreamError Error = CFReadStreamGetError(v5);
    if (Error.domain == 2)
    {
      if (a2)
      {
        CFStringRef v9 = CFStringCreateWithFormat(0, 0, @"MacOStatus error number %d while reading from the file at '%@'", *(void *)&Error.error, fileURL, v11, format);
        goto LABEL_15;
      }
    }
    else if (Error.domain == 1)
    {
      if (a2)
      {
        uint64_t v12 = strerror(Error.error);
        CFStringRef v9 = CFStringCreateWithFormat(0, 0, @"Error number %d while reading from the file at '%@': %s", *(void *)&Error.error, fileURL, v12, format);
LABEL_15:
        CFPropertyListRef v6 = 0;
        *a2 = v9;
        goto LABEL_17;
      }
    }
    else if (a2)
    {
      CFStringRef v9 = CFStringCreateWithFormat(0, 0, @"Unknown error number %d while reading from the file at '%@'", *(void *)&Error.error, fileURL, v11, format);
      goto LABEL_15;
    }
    CFPropertyListRef v6 = 0;
    goto LABEL_17;
  }
  if (!a2) {
    return 0;
  }
  CFStringRef v7 = CFStringCreateWithFormat(0, 0, @"Could not create a read stream for the file at '%@'", fileURL);
  CFPropertyListRef v6 = 0;
  *a2 = v7;
  return v6;
}

uint64_t DLWritePropertyListToFileWithFormat(const void *a1, const __CFURL *a2, CFPropertyListFormat a3, CFStringRef *a4)
{
  uint64_t v8 = CFWriteStreamCreateWithFile(0, a2);
  if (v8)
  {
    CFStringRef v9 = v8;
    uint64_t v10 = CFWriteStreamOpen(v8);
    if (v10 == 1)
    {
      CFPropertyListWriteToStream(a1, v9, a3, a4);
      CFWriteStreamClose(v9);
    }
    else
    {
      CFStreamError Error = CFWriteStreamGetError(v9);
      if (Error.domain == 2)
      {
        CFStringRef v12 = CFStringCreateWithFormat(0, 0, @"MacOStatus error number %d while writing to the file at '%@'", *(void *)&Error.error, a2);
      }
      else if (Error.domain == 1)
      {
        uint64_t v14 = strerror(Error.error);
        CFStringRef v12 = CFStringCreateWithFormat(0, 0, @"Error number %d while writing to the file at '%@': %s", *(void *)&Error.error, a2, v14);
      }
      else
      {
        CFStringRef v12 = CFStringCreateWithFormat(0, 0, @"Unknown error number %d while writing to the file at '%@'", *(void *)&Error.error, a2);
      }
      *a4 = v12;
    }
    CFRelease(v9);
  }
  else
  {
    uint64_t v10 = 0;
    *a4 = CFStringCreateWithFormat(0, 0, @"Could not create a write stream for the file at '%@'", a2);
  }
  return v10;
}

uint64_t DLWritePropertyListToFile(const void *a1, const __CFURL *a2, CFStringRef *a3)
{
  return DLWritePropertyListToFileWithFormat(a1, a2, kCFPropertyListBinaryFormat_v1_0, a3);
}

CFMutableArrayRef copyKeysFromDictionary(const __CFDictionary *a1)
{
  if (!a1) {
    return 0;
  }
  CFIndex Count = CFDictionaryGetCount(a1);
  CFMutableArrayRef Mutable = CFArrayCreateMutable(0, Count, MEMORY[0x263EFFF70]);
  CFDictionaryApplyFunction(a1, (CFDictionaryApplierFunction)_gatherDictionaryKeys, Mutable);
  return Mutable;
}

void _gatherDictionaryKeys(void *value, int a2, CFMutableArrayRef theArray)
{
}

CFMutableArrayRef copyKeysFromDictionaryNoRetain(const __CFDictionary *a1)
{
  if (!a1) {
    return 0;
  }
  CFIndex Count = CFDictionaryGetCount(a1);
  CFMutableArrayRef Mutable = CFArrayCreateMutable(0, Count, 0);
  CFDictionaryApplyFunction(a1, (CFDictionaryApplierFunction)_gatherDictionaryKeys, Mutable);
  return Mutable;
}

CFMutableArrayRef copyValuesFromDictionary(const __CFDictionary *a1)
{
  if (!a1) {
    return 0;
  }
  CFIndex Count = CFDictionaryGetCount(a1);
  CFMutableArrayRef Mutable = CFArrayCreateMutable(0, Count, MEMORY[0x263EFFF70]);
  CFDictionaryApplyFunction(a1, (CFDictionaryApplierFunction)_gatherDictionaryValues, Mutable);
  return Mutable;
}

void _gatherDictionaryValues(int a1, const void *a2, CFMutableArrayRef theArray)
{
}

CFMutableArrayRef copyValuesFromDictionaryNoRetain(const __CFDictionary *a1)
{
  if (!a1) {
    return 0;
  }
  CFIndex Count = CFDictionaryGetCount(a1);
  CFMutableArrayRef Mutable = CFArrayCreateMutable(0, Count, 0);
  CFDictionaryApplyFunction(a1, (CFDictionaryApplierFunction)_gatherDictionaryValues, Mutable);
  return Mutable;
}

__CFArray *copyKeysAndValuesFromDictionaryNoRetain(__CFArray *result)
{
  if (result)
  {
    CFDictionaryRef v1 = result;
    CFIndex Count = CFDictionaryGetCount(result);
    CFMutableArrayRef Mutable = CFArrayCreateMutable(0, Count, 0);
    CFIndex v4 = CFDictionaryGetCount(v1);
    CFMutableArrayRef v5 = CFArrayCreateMutable(0, v4, 0);
    return _copyKeysAndValuesFromDictionary(v1, Mutable, v5);
  }
  return result;
}

__CFArray *_copyKeysAndValuesFromDictionary(const __CFDictionary *a1, const void *a2, void *a3)
{
  CFMutableArrayRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF70]);
  CFArrayAppendValue(Mutable, a2);
  CFArrayAppendValue(Mutable, a3);
  CFDictionaryApplyFunction(a1, (CFDictionaryApplierFunction)_gatherDictionaryKeysAndValues, a3);
  return Mutable;
}

__CFArray *copyKeysAndValuesFromDictionary(__CFArray *result)
{
  if (result)
  {
    CFDictionaryRef v1 = result;
    CFIndex Count = CFDictionaryGetCount(result);
    CFArrayRef v3 = (const CFArrayCallBacks *)MEMORY[0x263EFFF70];
    CFMutableArrayRef Mutable = CFArrayCreateMutable(0, Count, MEMORY[0x263EFFF70]);
    CFIndex v5 = CFDictionaryGetCount(v1);
    CFMutableArrayRef v6 = CFArrayCreateMutable(0, v5, v3);
    return _copyKeysAndValuesFromDictionary(v1, Mutable, v6);
  }
  return result;
}

BOOL DLGetFlockForFileWithCancel(const __CFString *a1, unsigned int (*a2)(uint64_t), uint64_t a3, float a4)
{
  if (!_lockFds) {
    _lockFds = (uint64_t)CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  }
  uint64_t v8 = (const char *)DLCreateCStringFromCFString(a1);
  if (!v8)
  {
    if (DLLoggingEnabled(3) || DLOutputEnabled(3)) {
      _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/Utility/DeviceLinkUtility.c", "DLGetFlockForFileWithCancel", 3, @"Could not get a valid C string for the lock filename", v22, v23, v24, v25, v45);
    }
    return 0;
  }
  CFStringRef v9 = (char *)v8;
  char v46 = -74;
  int v10 = open(v8, 512);
  int valuePtr = v10;
  if (v10 == -1)
  {
    if (DLLoggingEnabled(5) || DLOutputEnabled(5))
    {
      __error();
      uint64_t v26 = __error();
      strerror(*v26);
      _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/Utility/DeviceLinkUtility.c", "DLGetFlockForFileWithCancel", 5, @"Error: Can't get file descriptor for %s: (%d) %s", v27, v28, v29, v30, (char)v9);
    }
    free(v9);
    return 0;
  }
  int v11 = v10;
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  char v13 = CFRunLoopTimerCreate(0, Current + (float)(a4 + a4), 0.0, 0, 0, (CFRunLoopTimerCallBack)_DLGetFlockTimeoutCallback, 0);
  uint64_t v14 = CFRunLoopGetCurrent();
  CFStringRef v15 = (const __CFString *)*MEMORY[0x263EFFE88];
  timer = v13;
  CFRunLoopAddTimer(v14, v13, (CFRunLoopMode)*MEMORY[0x263EFFE88]);
  while (1)
  {
    if (DLLoggingEnabled(5) || DLOutputEnabled(5)) {
      _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/Utility/DeviceLinkUtility.c", "DLGetFlockForFileWithCancel", 5, @"Attempting to lock descriptor for %s", v16, v17, v18, v19, (char)v9);
    }
    *__error() = 0;
    int v20 = flock(v11, 6);
    BOOL v21 = v20 == 0;
    if (!v20) {
      break;
    }
    CFRunLoopRunInMode(v15, 1.0, 0);
    if (a2 && a2(a3))
    {
      if (DLLoggingEnabled(5) || DLOutputEnabled(5)) {
        _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/Utility/DeviceLinkUtility.c", "DLGetFlockForFileWithCancel", 5, @"flock wait canceled by cancel function", v36, v37, v38, v39, v46);
      }
LABEL_31:
      if (DLLoggingEnabled(4) || DLOutputEnabled(4)) {
        _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/Utility/DeviceLinkUtility.c", "DLGetFlockForFileWithCancel", 4, @"Could not lock %s", v40, v41, v42, v43, (char)v9);
      }
      close(valuePtr);
      goto LABEL_35;
    }
    a4 = a4 + -1.0;
    if (a4 < 0.0) {
      goto LABEL_31;
    }
  }
  CFNumberRef v31 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
  CFDictionarySetValue((CFMutableDictionaryRef)_lockFds, a1, v31);
  if (v31) {
    CFRelease(v31);
  }
  if (a4 < 0.0) {
    goto LABEL_31;
  }
  if (DLLoggingEnabled(5) || DLOutputEnabled(5)) {
    _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/Utility/DeviceLinkUtility.c", "DLGetFlockForFileWithCancel", 5, @"Lock obtained for %s", v32, v33, v34, v35, (char)v9);
  }
LABEL_35:
  CFRunLoopTimerInvalidate(timer);
  CFRelease(timer);
  free(v9);
  return v21;
}

BOOL DLGetFlockForFile(const __CFString *a1, float a2)
{
  return DLGetFlockForFileWithCancel(a1, 0, 0, a2);
}

void DLReleaseFlockForFile(void *key, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  if (key && _lockFds)
  {
    CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue((CFDictionaryRef)_lockFds, key);
    if (Value)
    {
      int valuePtr = -1;
      CFNumberGetValue(Value, kCFNumberIntType, &valuePtr);
      if (flock(valuePtr, 8) == -1 && (DLLoggingEnabled(4) || DLOutputEnabled(4)))
      {
        __error();
        int v11 = __error();
        strerror(*v11);
        _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/Utility/DeviceLinkUtility.c", "DLReleaseFlockForFile", 4, @"Error: Can't unlock fd for filename %@: (%d) %s", v12, v13, v14, v15, (char)key);
      }
      close(valuePtr);
      CFDictionaryRemoveValue((CFMutableDictionaryRef)_lockFds, key);
    }
    else if (DLLoggingEnabled(4) || DLOutputEnabled(4))
    {
      _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/Utility/DeviceLinkUtility.c", "DLReleaseFlockForFile", 4, @"Attempting to unlock a lock that doesn't exist", v16, v17, v18, v19, a9);
    }
  }
}

uint64_t DLSetLogLevel(int a1)
{
  loggingDefaultRead = 1;
  curLogLevel = a1;
  return 1;
}

uint64_t DLSetOutputLevel(int a1)
{
  outputDefaultRead = 1;
  curOutputLevel = a1;
  return 1;
}

void initializeLogging()
{
  if ((loggingInitalized & 1) == 0)
  {
    loggingInitalized = 1;
    CFAllocatorRef v0 = CFDateFormatterCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, kCFDateFormatterNoStyle, kCFDateFormatterNoStyle);
    dateFormat = (uint64_t)v0;
    if (v0)
    {
      CFDateFormatterSetFormat(v0, @"yyyy-MM-dd HH:mm:ss.SSS");
    }
  }
}

uint64_t DLGetListenerSocketFromLaunchd(int a1)
{
  fds = 0;
  size_t cnt = 0;
  int v2 = launch_activate_socket("Listeners", &fds, &cnt);
  if (!v2)
  {
    if (fds)
    {
      if (cnt >= 2 && (DLLoggingEnabled(5) || DLOutputEnabled(5))) {
        _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/Utility/DeviceLinkUtility.c", "DLGetListenerSocketFromLaunchd", 5, @"More than one set of sockets for listening, ignoring all but \"Listeners\"", v9, v10, v11, v12, v28);
      }
      memset(&changelist, 0, sizeof(changelist));
      int v13 = kqueue();
      if (v13 == -1)
      {
        if (!DLLoggingEnabled(5) && !DLOutputEnabled(5)) {
          goto LABEL_36;
        }
        CFStringRef v27 = @"Can't set up kqueue";
LABEL_35:
        _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/Utility/DeviceLinkUtility.c", "DLGetListenerSocketFromLaunchd", 5, v27, v23, v24, v25, v26, v28);
LABEL_36:
        free(fds);
        return 0;
      }
      int v14 = v13;
      if (cnt)
      {
        uint64_t v15 = 0;
        while (1)
        {
          changelist.ident = fds[v15];
          *(_DWORD *)&changelist.filter = 0x1FFFF;
          *(void *)((unint64_t)&changelist | 0xC) = 0;
          *(void *)(((unint64_t)&changelist | 0xC) + 8) = 0;
          *(_DWORD *)(((unint64_t)&changelist | 0xC) + 0x10) = 0;
          if (kevent(v14, &changelist, 1, 0, 0, 0) == -1) {
            break;
          }
          if (++v15 >= cnt) {
            goto LABEL_15;
          }
        }
        if (!DLLoggingEnabled(5) && !DLOutputEnabled(5)) {
          goto LABEL_36;
        }
        CFStringRef v27 = @"Failure on kevent call for read";
        goto LABEL_35;
      }
LABEL_15:
      free(fds);
      fds = 0;
      v29[0] = a1;
      v29[1] = 0;
      if (a1) {
        uint64_t v16 = (const timespec *)v29;
      }
      else {
        uint64_t v16 = 0;
      }
      int v17 = kevent(v14, 0, 0, &changelist, 1, v16);
      if (v17)
      {
        if (v17 != -1) {
          return LODWORD(changelist.ident);
        }
        if (!DLLoggingEnabled(5))
        {
          uint64_t result = DLOutputEnabled(5);
          if (!result) {
            return result;
          }
        }
        CFStringRef v22 = @"Failure on kevent call for socket";
      }
      else
      {
        if (!DLLoggingEnabled(5))
        {
          uint64_t result = DLOutputEnabled(5);
          if (!result) {
            return result;
          }
        }
        CFStringRef v22 = @"Timeout waiting for kevent";
      }
    }
    else
    {
      if (!DLLoggingEnabled(5))
      {
        uint64_t result = DLOutputEnabled(5);
        if (!result) {
          return result;
        }
      }
      CFStringRef v22 = @"No listeners found";
    }
    _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/Utility/DeviceLinkUtility.c", "DLGetListenerSocketFromLaunchd", 5, v22, v18, v19, v20, v21, v28);
    return 0;
  }
  int v3 = v2;
  if (DLLoggingEnabled(3) || (uint64_t result = DLOutputEnabled(3), result))
  {
    strerror(v3);
    _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/Utility/DeviceLinkUtility.c", "DLGetListenerSocketFromLaunchd", 3, (const __CFString *)"Failed to launch_activate_socket: %d, %s", v5, v6, v7, v8, v3);
    return 0;
  }
  return result;
}

void _DLAddNumberToDict(void *valuePtr, CFNumberType a2, const void *a3, __CFDictionary *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  if (valuePtr && a4)
  {
    CFNumberRef v11 = CFNumberCreate(0, a2, valuePtr);
    if (v11)
    {
      CFNumberRef v12 = v11;
      CFDictionaryAddValue(a4, a3, v11);
      CFRelease(v12);
    }
    else if (DLLoggingEnabled(3) || DLOutputEnabled(3))
    {
      _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/Utility/DeviceLinkUtility.c", "_DLAddNumberToDict", 3, @"Could not create a CFNumber from the passed in value", v13, v14, v15, v16, a9);
    }
  }
}

void _DLAddDateToDict(uint64_t *a1, const void *a2, __CFDictionary *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  if (a1 && a3)
  {
    CFDateRef v11 = CFDateCreate(0, (double)*a1);
    if (v11)
    {
      CFDateRef v12 = v11;
      CFDictionaryAddValue(a3, a2, v11);
      CFRelease(v12);
    }
    else if (DLLoggingEnabled(3) || DLOutputEnabled(3))
    {
      _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/Utility/DeviceLinkUtility.c", "_DLAddDateToDict", 3, @"Could not create a CFDate from the passed in value", v13, v14, v15, v16, a9);
    }
  }
}

void _MemoryPoolReleaseCallback(int a1, CFTypeRef cf)
{
  if (cf) {
    CFRelease(cf);
  }
}

CFStringRef _createStringForLogFile(const __CFURL *a1, uint64_t a2)
{
  CFStringRef v3 = CFStringCreateWithFormat(0, 0, @"%02d.log", a2);
  if (!v3) {
    return 0;
  }
  CFStringRef v4 = v3;
  CFURLRef v5 = CFURLCreateCopyAppendingPathExtension(0, a1, v3);
  CFRelease(v4);
  if (!v5) {
    return 0;
  }
  CFStringRef v6 = CFURLCopyFileSystemPath(v5, kCFURLPOSIXPathStyle);
  CFRelease(v5);
  return v6;
}

uint64_t _closeLogStream()
{
  return close(logStream);
}

void _gatherDictionaryKeysAndValues(const void *a1, const void *a2, CFArrayRef theArray)
{
  CFStringRef ValueAtIndex = (__CFArray *)CFArrayGetValueAtIndex(theArray, 0);
  uint64_t v7 = (__CFArray *)CFArrayGetValueAtIndex(theArray, 1);
  CFArrayAppendValue(ValueAtIndex, a1);

  CFArrayAppendValue(v7, a2);
}

void *SetSocketLogCallback(void *result, uint64_t a2)
{
  sSocketLogCallback = result;
  sSocketLogData = a2;
  return result;
}

_DWORD *SocketCreateServerWithSocket(int a1)
{
  int v5 = 1;
  int v2 = malloc_type_calloc(0x30uLL, 1uLL, 0x13B1D44AuLL);
  if (v2)
  {
    if (!sSocketOldSignalHandler) {
      sSocketOldSignalHandler = (uint64_t)signal(13, (void (__cdecl *)(int))1);
    }
    v2[2] = 0;
    *int v2 = a1;
    if (setsockopt(a1, 0xFFFF, 4, &v5, 4u)) {
      int v3 = 7;
    }
    else {
      int v3 = 0;
    }
    v2[1] = v3;
  }
  return v2;
}

void *SocketCreateServer(unsigned int a1, int a2)
{
  int v8 = 1;
  CFStringRef v4 = malloc_type_calloc(0x30uLL, 1uLL, 0x9B80D88BuLL);
  if (v4)
  {
    if (!sSocketOldSignalHandler) {
      sSocketOldSignalHandler = (uint64_t)signal(13, (void (__cdecl *)(int))1);
    }
    *((_DWORD *)v4 + 2) = 0;
    *((unsigned char *)v4 + 33) = 2;
    *((_WORD *)v4 + 17) = bswap32(a1) >> 16;
    *((_DWORD *)v4 + 9) = 0;
    int v5 = socket(2, 1, 0);
    *(_DWORD *)CFStringRef v4 = v5;
    if (v5 < 0)
    {
      *((_DWORD *)v4 + 1) = 1;
    }
    else
    {
      if (setsockopt(v5, 0xFFFF, 4, &v8, 4u))
      {
        int v6 = 7;
      }
      else if (bind(*(_DWORD *)v4, (const sockaddr *)v4 + 2, 0x10u) < 0)
      {
        int v6 = 2;
      }
      else
      {
        if ((listen(*(_DWORD *)v4, a2) & 0x80000000) == 0)
        {
          *((_DWORD *)v4 + 1) = 0;
          return v4;
        }
        int v6 = 3;
      }
      *((_DWORD *)v4 + 1) = v6;
    }
  }
  return v4;
}

unsigned __int8 *SocketCreateLocalServer(const char *a1, int a2)
{
  CFStringRef v4 = (unsigned __int8 *)malloc_type_calloc(0x90uLL, 1uLL, 0xF1E0D23DuLL);
  if (v4)
  {
    if (!sSocketOldSignalHandler) {
      sSocketOldSignalHandler = (uint64_t)signal(13, (void (__cdecl *)(int))1);
    }
    *((_DWORD *)v4 + 2) = 1;
    v4[33] = 1;
    uid_t v5 = getuid();
    __sprintf_chk((char *)v4 + 34, 0, 0x6EuLL, "/tmp/%s_%d", a1, v5);
    v4[32] = strlen((const char *)v4 + 34) + 2;
    int v6 = socket(1, 1, 0);
    *(_DWORD *)CFStringRef v4 = v6;
    if (v6 < 0)
    {
      *((_DWORD *)v4 + 1) = 1;
      return v4;
    }
    unlink((const char *)v4 + 34);
    if (bind(*(_DWORD *)v4, (const sockaddr *)v4 + 2, v4[32]) < 0)
    {
      int v7 = 2;
    }
    else
    {
      if ((listen(*(_DWORD *)v4, a2) & 0x80000000) == 0)
      {
        *((_DWORD *)v4 + 1) = 0;
        return v4;
      }
      int v7 = 3;
    }
    *((_DWORD *)v4 + 1) = v7;
  }
  return v4;
}

sockaddr *SocketAccept(int *a1)
{
  if (!a1) {
    return 0;
  }
  int v2 = a1[2];
  if (v2 != 1)
  {
    if (!v2)
    {
      socklen_t v8 = 16;
      size_t v3 = 48;
      malloc_type_id_t v4 = 1297448720;
      goto LABEL_7;
    }
    return 0;
  }
  socklen_t v8 = 106;
  size_t v3 = 144;
  malloc_type_id_t v4 = 2150599149;
LABEL_7:
  uid_t v5 = (sockaddr *)malloc_type_calloc(v3, 1uLL, v4);
  if (v5)
  {
    unsigned int v6 = accept(*a1, v5 + 2, &v8);
    *(_DWORD *)&v5->sa_data[6] = 2;
    *(_DWORD *)&v5->sa_len = v6;
    *(_DWORD *)&v5->sa_data[2] = (v6 >> 29) & 4;
  }
  return v5;
}

void *SocketConnect(const char *a1, unsigned int a2)
{
  malloc_type_id_t v4 = malloc_type_calloc(0x30uLL, 1uLL, 0x3CB5FF4AuLL);
  if (!v4) {
    return v4;
  }
  if (!sSocketOldSignalHandler) {
    sSocketOldSignalHandler = (uint64_t)signal(13, (void (__cdecl *)(int))1);
  }
  *((_DWORD *)v4 + 1) = 0;
  if (gethostbyname(a1))
  {
    __memcpy_chk();
  }
  else
  {
    v16.fds_bits[0] = 0;
    if (inet_pton(2, a1, &v16) != 1)
    {
      *((_DWORD *)v4 + 1) = 5;
      return v4;
    }
    *((_DWORD *)v4 + 9) = v16.fds_bits[0];
  }
  *((unsigned char *)v4 + 33) = 2;
  *((_WORD *)v4 + 17) = bswap32(a2) >> 16;
  int v5 = socket(2, 1, 0);
  *(_DWORD *)malloc_type_id_t v4 = v5;
  if (v5 < 0)
  {
    *((_DWORD *)v4 + 1) = 1;
    return v4;
  }
  uint64_t v6 = fcntl(v5, 4, 4);
  if (v6) {
    _SocketErrorCheckAndLogIfError("SocketConnect (fcntl to set non blocking for connect)", v6);
  }
  uint64_t v7 = connect(*(_DWORD *)v4, (const sockaddr *)v4 + 2, 0x10u);
  if ((v7 & 0x80000000) == 0) {
    return v4;
  }
  uint64_t v8 = v7;
  if (*__error() != 36)
  {
    _SocketErrorCheckAndLogIfError("SocketConnect (connect)", v8);
    *(void *)malloc_type_id_t v4 = 0x6FFFFFFFFLL;
    return v4;
  }
  timeval v15 = (timeval)xmmword_23883AC00;
  memset(&v16, 0, sizeof(v16));
  int v9 = *(_DWORD *)v4;
  if (__darwin_check_fd_set_overflow(*(_DWORD *)v4, &v16, 0)) {
    *(__int32_t *)((char *)v16.fds_bits + (((unint64_t)v9 >> 3) & 0x1FFFFFFFFFFFFFFCLL)) |= 1 << v9;
  }
  int v10 = select(*(_DWORD *)v4 + 1, &v16, 0, 0, &v15);
  if (!v10)
  {
    CFDateRef v11 = "SocketConnect timeout on select";
LABEL_28:
    SocketLog(v11);
    goto LABEL_29;
  }
  if (v10 == -1)
  {
    _SocketErrorCheckAndLogIfError("SocketConnect (select)", 0xFFFFFFFFLL);
LABEL_29:
    *((_DWORD *)v4 + 1) = 6;
LABEL_30:
    if (*(int *)v4 >= 1)
    {
      shutdown(*(_DWORD *)v4, 2);
      close(*(_DWORD *)v4);
      *(_DWORD *)malloc_type_id_t v4 = 0;
    }
    return v4;
  }
  int v12 = *(_DWORD *)v4;
  if (!__darwin_check_fd_set_overflow(*(_DWORD *)v4, &v16, 0)
    || ((*(unsigned int *)((char *)v16.fds_bits + (((unint64_t)v12 >> 3) & 0x1FFFFFFFFFFFFFFCLL)) >> v12) & 1) == 0)
  {
    CFDateRef v11 = "SocketConnect: error connecting: read_fd not set";
    goto LABEL_28;
  }
  if (*((_DWORD *)v4 + 1) == 6) {
    goto LABEL_30;
  }
  uint64_t v13 = fcntl(*(_DWORD *)v4, 4, 0);
  if (v13) {
    _SocketErrorCheckAndLogIfError("SocketConnect (fcntl to set blocking for reads/writes)", v13);
  }
  return v4;
}

uint64_t _SocketErrorCheckAndLogIfError(const char *a1, uint64_t a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if ((int)a2 <= 0)
  {
    if (a2)
    {
      int v4 = *__error();
      int v5 = __error();
      uint64_t v6 = strerror(*v5);
      __sprintf_chk(v8, 0, 0x400uLL, "%s: error %d: %s", a1, v4, v6);
    }
    else
    {
      __strcpy_chk();
      __strcat_chk();
    }
    SocketLog(v8);
  }
  return a2;
}

uint64_t SocketLog(const char *a1)
{
  CFDictionaryRef v1 = (uint64_t (*)(const char *, uint64_t))sSocketLogCallback;
  if (!sSocketLogCallback) {
    return fprintf((FILE *)*MEMORY[0x263EF8348], "%s\n", a1);
  }
  uint64_t v2 = sSocketLogData;

  return v1(a1, v2);
}

unsigned __int8 *SocketConnectLocal(const char *a1)
{
  uint64_t v2 = (unsigned __int8 *)malloc_type_calloc(0x90uLL, 1uLL, 0x579EAB39uLL);
  if (v2)
  {
    if (!sSocketOldSignalHandler) {
      sSocketOldSignalHandler = (uint64_t)signal(13, (void (__cdecl *)(int))1);
    }
    *((_DWORD *)v2 + 1) = 0;
    int v3 = 1;
    v2[33] = 1;
    uid_t v4 = getuid();
    __sprintf_chk((char *)v2 + 34, 0, 0x6EuLL, "/tmp/%s_%d", a1, v4);
    v2[32] = strlen((const char *)v2 + 34) + 2;
    int v5 = socket(1, 1, 0);
    *(_DWORD *)uint64_t v2 = v5;
    if (v5 < 0) {
      goto LABEL_7;
    }
    if (connect(v5, (const sockaddr *)v2 + 2, v2[32]) < 0)
    {
      int v3 = 6;
LABEL_7:
      *((_DWORD *)v2 + 1) = v3;
    }
  }
  return v2;
}

void SocketDelete(void *a1)
{
  if (a1)
  {
    if (a1[3]) {
      lockdown_disconnect();
    }
    free(a1);
  }
}

uint64_t SocketSend(uint64_t a1, const void *a2, size_t a3)
{
  processed[128] = *MEMORY[0x263EF8340];
  if (!a1)
  {
    uint64_t v6 = "SocketSend called with NULL socketInfo";
LABEL_9:
    SocketLog(v6);
    return 0;
  }
  if (!a3)
  {
    __sprintf_chk((char *)processed, 0, 0x400uLL, "Skipping SocketSend of bytes, length %d <= 0", 0);
    uint64_t v6 = (const char *)processed;
    goto LABEL_9;
  }
  int v3 = *(SSLContext **)(a1 + 16);
  if (v3)
  {
    processed[0] = -1;
    unsigned int v4 = SSLWrite(v3, a2, a3, processed);
    if (v4) {
      ssize_t v5 = v4;
    }
    else {
      ssize_t v5 = LODWORD(processed[0]);
    }
  }
  else
  {
    ssize_t v5 = send(*(_DWORD *)a1, a2, (int)a3, 0);
  }
  _SocketErrorCheckAndLogIfError("SocketSend (data)", v5);
  return (int)v5;
}

uint64_t SocketRecv(uint64_t a1, void *a2, size_t a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  bzero(v12, 0x400uLL);
  if (!a1)
  {
    uint64_t v9 = "SocketSend called with NULL socketInfo";
LABEL_9:
    SocketLog(v9);
    return 0;
  }
  if (!a3)
  {
    __sprintf_chk(v12, 0, 0x400uLL, "Skipping SocketRecv of bytes, length %d <= 0", 0);
    uint64_t v9 = v12;
    goto LABEL_9;
  }
  uint64_t v6 = *(SSLContext **)(a1 + 16);
  if (v6)
  {
    size_t processed = -1;
    unsigned int v7 = SSLRead(v6, a2, a3, &processed);
    if (v7) {
      ssize_t v8 = v7;
    }
    else {
      ssize_t v8 = processed;
    }
  }
  else
  {
    ssize_t v8 = recv(*(_DWORD *)a1, a2, (int)a3, 64);
  }
  _SocketErrorCheckAndLogIfError("SocketRecv (data)", v8);
  return v8 & ~((int)v8 >> 31);
}

uint64_t SocketStreamHandlerRegisterCreator(CFTypeRef *a1)
{
  return StreamHandlerRegisterCreatorForType(@"DLInfoStreamTypeTCP", SocketStreamHandlerCreator, a1);
}

uint64_t SocketStreamHandlerCreator(void *a1, CFTypeRef *a2)
{
  if (a1)
  {
    unsigned int v4 = malloc_type_calloc(0x38uLL, 1uLL, 0x448FA0D3uLL);
    *unsigned int v4 = SocketStreamHandlerAccept;
    v4[1] = SocketStreamHandlerConnect;
    v4[2] = SocketStreamHandlerClose;
    v4[3] = SocketStreamHandlerSend;
    v4[4] = SocketStreamHandlerReceive;
    v4[5] = SocketStreamHandlerDeleteStreamHandler;
    v4[6] = 0;
    *a1 = v4;
    SetSocketLogCallback(_SocketLogCallback, 0);
    return 0;
  }
  else
  {
    return DLSetStatus(4294967293, a2, @"SocketStreamHandlerCreator: No Stream Handler argument specified");
  }
}

uint64_t SocketStreamHandlerAccept(uint64_t a1, CFDictionaryRef theDict, CFTypeRef *a3)
{
  uint64_t v6 = *(void **)(a1 + 48);
  if (v6)
  {
    SocketDelete(v6);
    *(void *)(a1 + 48) = 0;
  }
  CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(theDict, @"DLInfoPortKey");
  CFNumberRef v8 = (const __CFNumber *)CFDictionaryGetValue(theDict, @"DLInfoSocketKey");
  uint64_t v9 = CFDictionaryGetValue(theDict, @"DLInfoLockdownAccept");
  if (Value)
  {
    unsigned int valuePtr = 0;
    if (CFNumberGetValue(Value, kCFNumberIntType, &valuePtr))
    {
      Server = (int *)SocketCreateServer(valuePtr, 1);
      if (v9 && v9 != (const void *)*MEMORY[0x263EFFB38]) {
        goto LABEL_7;
      }
LABEL_25:
      *(void *)(a1 + 48) = SocketAccept(Server);
      SocketDelete(Server);
      Server = *(int **)(a1 + 48);
      if (!Server)
      {
LABEL_28:
        uint64_t v18 = @"SocketStreamHandlerAccept: error calling accept on socket";
        uint64_t v19 = 0xFFFFFFFFLL;
        return DLSetStatus(v19, a3, v18);
      }
      goto LABEL_26;
    }
    CFStringRef v16 = CFStringCreateWithFormat(0, 0, @"SocketStreamHandlerAccept: Port in info dictionary is invalid: %@", Value);
LABEL_22:
    uint64_t v18 = (__CFString *)v16;
    uint64_t v19 = 4294967293;
    return DLSetStatus(v19, a3, v18);
  }
  if (!v8)
  {
    return DLSetStatus(4294967293, a3, @"SocketStreamHandlerAccept: No port or socket in info dictionary");
  }
  int v25 = 0;
  if (!CFNumberGetValue(v8, kCFNumberIntType, &v25))
  {
    CFStringRef v16 = CFStringCreateWithFormat(0, 0, @"SocketStreamHandlerAccept: Socket in info dictionary is invalid: %@", v8);
    goto LABEL_22;
  }
  Server = SocketCreateServerWithSocket(v25);
  if (!v9 || v9 == (const void *)*MEMORY[0x263EFFB38])
  {
    if (DLShouldLog(4)) {
      _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/SocketStreamHandler.c", "SocketStreamHandlerAccept", 4, @"Not using lockdown", v20, v21, v22, v23, v24);
    }
    goto LABEL_25;
  }
  CFNumberRef v11 = (const __CFNumber *)CFDictionaryGetValue(theDict, @"DLInfoLockdownConnection");
  if (v11)
  {
    CFNumberGetValue(v11, kCFNumberNSIntegerType, Server + 6);
    if (*((void *)Server + 3))
    {
      *((void *)Server + 2) = lockdown_get_securecontext();
      if (DLShouldLog(6)) {
        _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/SocketStreamHandler.c", "SocketStreamHandlerAccept", 6, @"Using SSL. SSL pointer is %p (lockConn: %@)", v12, v13, v14, v15, *((void *)Server + 2));
      }
    }
  }
LABEL_7:
  *(void *)(a1 + 48) = Server;
  if (!Server) {
    goto LABEL_28;
  }
LABEL_26:
  if (Server[1])
  {
    SocketDelete(Server);
    *(void *)(a1 + 48) = 0;
    goto LABEL_28;
  }
  return 0;
}

uint64_t SocketStreamHandlerConnect(uint64_t a1, CFDictionaryRef theDict, CFTypeRef *a3)
{
  unsigned int valuePtr = 0;
  uint64_t v6 = *(void **)(a1 + 48);
  if (v6)
  {
    SocketDelete(v6);
    *(void *)(a1 + 48) = 0;
  }
  CFStringRef Value = (const __CFString *)CFDictionaryGetValue(theDict, @"DLInfoHostnameKey");
  CFNumberRef v8 = (const __CFNumber *)CFDictionaryGetValue(theDict, @"DLInfoPortKey");
  uint64_t v9 = CFDictionaryGetValue(theDict, @"DLInfoServiceNameKey");
  if (!CFDictionaryGetValue(theDict, @"DLInfoMuxDeviceIdKey"))
  {
    if (!Value)
    {
      CFNumberRef v11 = @"SocketStreamHandlerConnect: No mux device id, AMDeviceRef, or hostname in info dictionary";
      goto LABEL_6;
    }
    uint64_t v13 = (const char *)DLCreateCStringFromCFString(Value);
    if (!v13)
    {
      CFStringRef v10 = CFStringCreateWithFormat(0, 0, @"SocketStreamHandlerConnect: Hostname in info dictionary is invalid: %@", Value);
      goto LABEL_5;
    }
    uint64_t v14 = v13;
    if (v8)
    {
      if (!CFNumberGetValue(v8, kCFNumberIntType, &valuePtr))
      {
        CFStringRef v19 = CFStringCreateWithFormat(0, 0, @"SocketStreamHandlerConnect: Port in info dictionary is invalid: %@", v8);
        uint64_t v20 = 4294967293;
        return DLSetStatus(v20, a3, v19);
      }
      unsigned int v15 = valuePtr;
    }
    else
    {
      if (!v9)
      {
        CFNumberRef v11 = @"SocketStreamHandlerConnect: No port/service in info dictionary";
        goto LABEL_6;
      }
      unsigned int v15 = 0;
    }
    CFStringRef v16 = (unsigned int *)SocketConnect(v14, v15);
    *(void *)(a1 + 48) = v16;
    if (v16)
    {
      uint64_t v17 = v16[1];
      if (!v17) {
        return 0;
      }
      uint64_t v18 = (&SocketErrorStrings)[v17];
      SocketDelete(v16);
      *(void *)(a1 + 48) = 0;
      if (v17 == 9)
      {
        CFStringRef v19 = @"SocketStreamHandlerConnect: Cannot connect - the device is locked";
        uint64_t v20 = 4294967291;
        return DLSetStatus(v20, a3, v19);
      }
      if (v17 == 8)
      {
        CFStringRef v19 = @"SocketStreamHandlerConnect: Cannot connect - we are not paired with this device";
        uint64_t v20 = 4294967292;
        return DLSetStatus(v20, a3, v19);
      }
      CFStringRef v21 = CFStringCreateWithFormat(0, 0, @"SocketStreamHandlerConnect: Can't connect to host: Socket error %d (%s)", v17, v18);
    }
    else
    {
      CFStringRef v21 = CFStringCreateWithFormat(0, 0, @"SocketStreamHandlerConnect: Can't create socket");
    }
    CFStringRef v19 = v21;
    uint64_t v20 = 0xFFFFFFFFLL;
    return DLSetStatus(v20, a3, v19);
  }
  CFStringRef v10 = CFStringCreateWithFormat(0, 0, @"SocketStreamHandlerConnect: Connection via direct usbmux is deprecated.");
LABEL_5:
  CFNumberRef v11 = (__CFString *)v10;
LABEL_6:

  return DLSetStatus(4294967293, a3, v11);
}

uint64_t SocketStreamHandlerClose(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 48);
  if (v2)
  {
    SocketDelete(v2);
    *(void *)(a1 + 48) = 0;
  }
  return 0;
}

uint64_t SocketStreamHandlerSend(uint64_t a1, const void *a2, size_t *a3, CFStringRef *a4)
{
  uint64_t v6 = SocketSend(*(void *)(a1 + 48), a2, *a3);
  if (v6 <= 0)
  {
    if (a4) {
      *a4 = CFStringCreateWithFormat(0, 0, @"Can't send data");
    }
    uint64_t result = 0xFFFFFFFFLL;
  }
  else
  {
    uint64_t result = 0;
  }
  *a3 = v6;
  return result;
}

uint64_t SocketStreamHandlerReceive(uint64_t a1, void *a2, size_t *a3, CFStringRef *a4)
{
  uint64_t v6 = SocketRecv(*(void *)(a1 + 48), a2, *a3);
  if (v6 < 1)
  {
    *a3 = 0;
    if (a4) {
      *a4 = CFStringCreateWithFormat(0, 0, @"Can't read data");
    }
    return 0xFFFFFFFFLL;
  }
  else
  {
    size_t v7 = v6;
    uint64_t result = 0;
    *a3 = v7;
  }
  return result;
}

uint64_t SocketStreamHandlerDeleteStreamHandler(void *a1)
{
  uint64_t v2 = (void *)a1[6];
  if (v2) {
    SocketDelete(v2);
  }
  free(a1);
  return 0;
}

void _SocketLogCallback(char *cStr)
{
  CFStringRef v1 = CFStringCreateWithCString(0, cStr, 0);
  if (DLShouldLog(3)) {
    _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/SocketStreamHandler.c", "_SocketLogCallback", 3, v1, v2, v3, v4, v5, v6);
  }

  CFRelease(v1);
}

uint64_t StreamHandlerRegisterCreatorForType(void *key, void *value, CFTypeRef *a3)
{
  if (value)
  {
    CFMutableArrayRef Mutable = (__CFDictionary *)sStreamHandlers;
    if (!sStreamHandlers)
    {
      CFMutableArrayRef Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFB78], 0);
      sStreamHandlers = (uint64_t)Mutable;
    }
    CFDictionarySetValue(Mutable, key, value);
    return 0;
  }
  else
  {
    return DLSetStatus(4294967293, a3, @"Creator function is NULL");
  }
}

uint64_t StreamHandlerForType(void *key, uint64_t a2, CFTypeRef *a3)
{
  if ((sInitializedStreamHandlers & 1) == 0)
  {
    uint64_t result = SocketStreamHandlerRegisterCreator(a3);
    if (result) {
      return result;
    }
    sInitializedStreamHandlers = 1;
  }
  if (key)
  {
    if (a2)
    {
      if (sStreamHandlers
        && (CFStringRef Value = (uint64_t (*)(uint64_t, CFTypeRef *))CFDictionaryGetValue((CFDictionaryRef)sStreamHandlers, key)) != 0)
      {
        return Value(a2, a3);
      }
      else
      {
        CFStringRef v9 = CFStringCreateWithFormat(0, 0, @"StreamHandler is not registered for %@", key);
        if (a3)
        {
          *a3 = v9;
        }
        else if (v9)
        {
          CFRelease(v9);
        }
        return 0xFFFFFFFFLL;
      }
    }
    CFNumberRef v8 = @"Out parameter for streamHandler is NULL";
  }
  else
  {
    CFNumberRef v8 = @"Parameter for type is NULL";
  }

  return DLSetStatus(4294967293, a3, v8);
}

uint64_t StreamHandlerAccept(uint64_t (**a1)(void), int a2, CFTypeRef *a3)
{
  if (a1) {
    return (*a1)();
  }
  else {
    return DLSetStatus(4294967293, a3, @"StreamHandler is NULL");
  }
}

uint64_t StreamHandlerConnect(uint64_t a1, int a2, CFTypeRef *a3)
{
  if (a1) {
    return (*(uint64_t (**)(void))(a1 + 8))();
  }
  else {
    return DLSetStatus(4294967293, a3, @"StreamHandler is NULL");
  }
}

uint64_t StreamHandlerClose(uint64_t a1, CFTypeRef *a2)
{
  if (a1) {
    return (*(uint64_t (**)(void))(a1 + 16))();
  }
  else {
    return DLSetStatus(4294967293, a2, @"StreamHandler is NULL");
  }
}

uint64_t StreamHandlerSend(uint64_t a1, uint64_t a2, unsigned int a3, unsigned int *a4, CFTypeRef *a5)
{
  if (a4) {
    *a4 = 0;
  }
  if (a1)
  {
    unsigned int v15 = bswap32(a3);
    uint64_t v14 = 0;
    uint64_t v10 = 4;
    do
    {
      if (_Write(a1, (uint64_t)&v15 - v10 + 4, v10, &v14))
      {
        uint64_t v13 = @"Error writing length of data";
        return DLSetStatus(0xFFFFFFFFLL, a5, v13);
      }
      v10 -= v14;
    }
    while (v10);
    if (a3)
    {
      uint64_t v11 = a3;
      while (!_Write(a1, a2 + a3 - v11, v11, &v14))
      {
        v11 -= v14;
        if (!v11) {
          goto LABEL_11;
        }
      }
      uint64_t v13 = @"Error writing data";
      return DLSetStatus(0xFFFFFFFFLL, a5, v13);
    }
LABEL_11:
    uint64_t result = 0;
    if (a4) {
      *a4 = a3;
    }
  }
  else
  {
    return DLSetStatus(4294967293, a5, @"StreamHandler is NULL");
  }
  return result;
}

uint64_t _Write(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v10 = a3;
  CFTypeRef cf = 0;
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t *, CFTypeRef *))(a1 + 24))(a1, a2, &v10, &cf);
  if (result)
  {
    if (DLShouldLog(3)) {
      _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/StreamHandler.c", "_WriteFunc", 3, @"Error sending data: %@", v6, v7, v8, v9, (char)cf);
    }
    if (cf) {
      CFRelease(cf);
    }
    uint64_t result = 0xFFFFFFFFLL;
  }
  if (a4) {
    *a4 = v10;
  }
  return result;
}

uint64_t StreamHandlerReceive(uint64_t a1, CFDataRef *a2, CFTypeRef *a3)
{
  if (!a1)
  {
    uint64_t v12 = @"StreamHandler is NULL";
LABEL_13:
    return DLSetStatus(4294967293, a3, v12);
  }
  if (!a2)
  {
    uint64_t v12 = @"Data is NULL";
    goto LABEL_13;
  }
  unsigned int v14 = 0;
  uint64_t v13 = 0;
  uint64_t v5 = 4;
  *a2 = 0;
  while (!_Read(a1, (uint64_t)&v14 - v5 + 4, v5, &v13))
  {
    v5 -= v13;
    if (!v5)
    {
      unsigned int v6 = v14;
      size_t v7 = bswap32(v14);
      uint64_t v8 = (UInt8 *)malloc_type_malloc(v7, 0x77418D27uLL);
      if (!v6)
      {
LABEL_10:
        CFDataRef v10 = DLDataCreateWithMallocedBytesNoCopy(v8, v7);
        uint64_t result = 0;
        *a2 = v10;
        return result;
      }
      uint64_t v9 = v7;
      while (!_Read(a1, (uint64_t)&v8[v7 - v9], v9, &v13))
      {
        v9 -= v13;
        if (!v9) {
          goto LABEL_10;
        }
      }
      free(v8);
      return 0xFFFFFFFFLL;
    }
  }
  return 0xFFFFFFFFLL;
}

uint64_t _Read(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v10 = a3;
  CFTypeRef cf = 0;
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t *, CFTypeRef *))(a1 + 32))(a1, a2, &v10, &cf);
  if (result)
  {
    if (DLShouldLog(3)) {
      _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/StreamHandler.c", "_ReadFunc", 3, @"Error reading data: %@", v6, v7, v8, v9, (char)cf);
    }
    if (cf) {
      CFRelease(cf);
    }
    uint64_t result = 0xFFFFFFFFLL;
  }
  if (a4) {
    *a4 = v10;
  }
  return result;
}

uint64_t StreamHandlerDeleteStreamHandler(uint64_t a1, CFTypeRef *a2)
{
  if (a1) {
    return (*(uint64_t (**)(void))(a1 + 40))();
  }
  else {
    return DLSetStatus(4294967293, a2, @"StreamHandler is NULL");
  }
}

void _DLHandlerThreadMessagePortCallback_cold_1()
{
  if (DLShouldLog(3)) {
    _DLLog("/Library/Caches/com.apple.xbs/Sources/DeviceLink/WireProtocol/DeviceLinkConnection.c", "_DLWriteFileBytes", 3, @"Could not finalize encryption. Our buffer is too small", v0, v1, v2, v3, vars0);
  }
  __assert_rtn("_DLWriteFileBytes", "DeviceLinkConnection.c", 920, "false");
}

void DLLockdownXPCCheckin_cold_1()
{
  __assert_rtn("DLLockdownXPCCheckin", "DeviceLinkConnection.c", 1697, "serviceName != NULL");
}

void DLLockdownXPCCheckin_cold_2()
{
  __assert_rtn("DLLockdownXPCCheckin", "DeviceLinkConnection.c", 1698, "info != NULL");
}

void DLLockdownXPCCheckin_cold_3()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  int v0 = 134217984;
  uint64_t v1 = 600;
  _os_log_error_impl(&dword_238827000, &_os_log_internal, OS_LOG_TYPE_ERROR, "lockdown_checkin_xpc timed out after %llds", (uint8_t *)&v0, 0xCu);
}

void DLLockdownXPCCheckin_cold_4(int a1)
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 67109120;
  v1[1] = a1;
  _os_log_error_impl(&dword_238827000, &_os_log_internal, OS_LOG_TYPE_ERROR, "lockdown_checkin_xpc failed: %d", (uint8_t *)v1, 8u);
}

void _DLMainThreadMessagePortCallback_cold_1(const void **values)
{
}

void _DLMainThreadMessagePortCallback_cold_2(const __CFArray *a1)
{
}

CCCryptorStatus CCCrypt(CCOperation op, CCAlgorithm alg, CCOptions options, const void *key, size_t keyLength, const void *iv, const void *dataIn, size_t dataInLength, void *dataOut, size_t dataOutAvailable, size_t *dataOutMoved)
{
  return MEMORY[0x270ED78A0](*(void *)&op, *(void *)&alg, *(void *)&options, key, keyLength, iv, dataIn, dataInLength);
}

CCCryptorStatus CCCryptorCreate(CCOperation op, CCAlgorithm alg, CCOptions options, const void *key, size_t keyLength, const void *iv, CCCryptorRef *cryptorRef)
{
  return MEMORY[0x270ED78C8](*(void *)&op, *(void *)&alg, *(void *)&options, key, keyLength, iv, cryptorRef);
}

CCCryptorStatus CCCryptorFinal(CCCryptorRef cryptorRef, void *dataOut, size_t dataOutAvailable, size_t *dataOutMoved)
{
  return MEMORY[0x270ED78E8](cryptorRef, dataOut, dataOutAvailable, dataOutMoved);
}

CCCryptorStatus CCCryptorRelease(CCCryptorRef cryptorRef)
{
  return MEMORY[0x270ED7940](cryptorRef);
}

CCCryptorStatus CCCryptorUpdate(CCCryptorRef cryptorRef, const void *dataIn, size_t dataInLength, void *dataOut, size_t dataOutAvailable, size_t *dataOutMoved)
{
  return MEMORY[0x270ED7950](cryptorRef, dataIn, dataInLength, dataOut, dataOutAvailable, dataOutMoved);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x270EE4278]();
  return result;
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x270EE42F0](allocator, values, numValues, callBacks);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x270EE4300](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x270EE4320](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x270EE4360](theArray, idx);
}

uint64_t CFCopyHomeDirectoryURLForUser()
{
  return MEMORY[0x270EE4798]();
}

void CFDataAppendBytes(CFMutableDataRef theData, const UInt8 *bytes, CFIndex length)
{
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x270EE47C8](allocator, bytes, length);
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableDataRef)MEMORY[0x270EE47E0](allocator, capacity);
}

CFDataRef CFDataCreateWithBytesNoCopy(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return (CFDataRef)MEMORY[0x270EE47F0](allocator, bytes, length, bytesDeallocator);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x270EE4808](theData);
}

void CFDataGetBytes(CFDataRef theData, CFRange range, UInt8 *buffer)
{
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x270EE4820](theData);
}

UInt8 *__cdecl CFDataGetMutableBytePtr(CFMutableDataRef theData)
{
  return (UInt8 *)MEMORY[0x270EE4830](theData);
}

void CFDataSetLength(CFMutableDataRef theData, CFIndex length)
{
}

CFDateRef CFDateCreate(CFAllocatorRef allocator, CFAbsoluteTime at)
{
  return (CFDateRef)MEMORY[0x270EE4860](allocator, at);
}

CFDateFormatterRef CFDateFormatterCreate(CFAllocatorRef allocator, CFLocaleRef locale, CFDateFormatterStyle dateStyle, CFDateFormatterStyle timeStyle)
{
  return (CFDateFormatterRef)MEMORY[0x270EE4870](allocator, locale, dateStyle, timeStyle);
}

CFStringRef CFDateFormatterCreateStringWithAbsoluteTime(CFAllocatorRef allocator, CFDateFormatterRef formatter, CFAbsoluteTime at)
{
  return (CFStringRef)MEMORY[0x270EE4890](allocator, formatter, at);
}

void CFDateFormatterSetFormat(CFDateFormatterRef formatter, CFStringRef formatString)
{
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

void CFDictionaryApplyFunction(CFDictionaryRef theDict, CFDictionaryApplierFunction applier, void *context)
{
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return MEMORY[0x270EE48F0](theDict, key);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x270EE4908](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4920](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4928](allocator, capacity, theDict);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x270EE4930](theDict);
}

void CFDictionaryGetKeysAndValues(CFDictionaryRef theDict, const void **keys, const void **values)
{
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x270EE4958](theDict, key);
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
}

CFMessagePortRef CFMessagePortCreateLocal(CFAllocatorRef allocator, CFStringRef name, CFMessagePortCallBack callout, CFMessagePortContext *context, Boolean *shouldFreeInfo)
{
  return (CFMessagePortRef)MEMORY[0x270EE4B28](allocator, name, callout, context, shouldFreeInfo);
}

CFMessagePortRef CFMessagePortCreateRemote(CFAllocatorRef allocator, CFStringRef name)
{
  return (CFMessagePortRef)MEMORY[0x270EE4B30](allocator, name);
}

CFRunLoopSourceRef CFMessagePortCreateRunLoopSource(CFAllocatorRef allocator, CFMessagePortRef local, CFIndex order)
{
  return (CFRunLoopSourceRef)MEMORY[0x270EE4B38](allocator, local, order);
}

void CFMessagePortGetContext(CFMessagePortRef ms, CFMessagePortContext *context)
{
}

void CFMessagePortInvalidate(CFMessagePortRef ms)
{
}

Boolean CFMessagePortIsValid(CFMessagePortRef ms)
{
  return MEMORY[0x270EE4B50](ms);
}

SInt32 CFMessagePortSendRequest(CFMessagePortRef remote, SInt32 msgid, CFDataRef data, CFTimeInterval sendTimeout, CFTimeInterval rcvTimeout, CFStringRef replyMode, CFDataRef *returnData)
{
  return MEMORY[0x270EE4B58](remote, *(void *)&msgid, data, replyMode, returnData, sendTimeout, rcvTimeout);
}

void CFMessagePortSetInvalidationCallBack(CFMessagePortRef ms, CFMessagePortInvalidationCallBack callout)
{
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x270EE4BE8](allocator, theType, valuePtr);
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x270EE4C70](number, theType, valuePtr);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x270EE4CD0](key, applicationID, keyExistsAndHasValidFormat);
}

CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x270EE4CE0](key, applicationID, keyExistsAndHasValidFormat);
}

CFPropertyListRef CFPropertyListCreateFromStream(CFAllocatorRef allocator, CFReadStreamRef stream, CFIndex streamLength, CFOptionFlags mutabilityOption, CFPropertyListFormat *format, CFStringRef *errorString)
{
  return (CFPropertyListRef)MEMORY[0x270EE4D28](allocator, stream, streamLength, mutabilityOption, format, errorString);
}

CFPropertyListRef CFPropertyListCreateFromXMLData(CFAllocatorRef allocator, CFDataRef xmlData, CFOptionFlags mutabilityOption, CFStringRef *errorString)
{
  return (CFPropertyListRef)MEMORY[0x270EE4D30](allocator, xmlData, mutabilityOption, errorString);
}

Boolean CFPropertyListIsValid(CFPropertyListRef plist, CFPropertyListFormat format)
{
  return MEMORY[0x270EE4D58](plist, format);
}

CFIndex CFPropertyListWriteToStream(CFPropertyListRef propertyList, CFWriteStreamRef stream, CFPropertyListFormat format, CFStringRef *errorString)
{
  return MEMORY[0x270EE4D68](propertyList, stream, format, errorString);
}

void CFReadStreamClose(CFReadStreamRef stream)
{
}

CFReadStreamRef CFReadStreamCreateWithFile(CFAllocatorRef alloc, CFURLRef fileURL)
{
  return (CFReadStreamRef)MEMORY[0x270EE4D90](alloc, fileURL);
}

CFStreamError CFReadStreamGetError(CFReadStreamRef stream)
{
  CFIndex v1 = MEMORY[0x270EE4D98](stream);
  result.error = v2;
  result.domain = v1;
  return result;
}

Boolean CFReadStreamOpen(CFReadStreamRef stream)
{
  return MEMORY[0x270EE4DB8](stream);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

void CFRunLoopAddTimer(CFRunLoopRef rl, CFRunLoopTimerRef timer, CFRunLoopMode mode)
{
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x270EE4E58]();
}

void CFRunLoopRun(void)
{
}

CFRunLoopRunResult CFRunLoopRunInMode(CFRunLoopMode mode, CFTimeInterval seconds, Boolean returnAfterSourceHandled)
{
  return MEMORY[0x270EE4ED0](mode, returnAfterSourceHandled, seconds);
}

CFRunLoopSourceRef CFRunLoopSourceCreate(CFAllocatorRef allocator, CFIndex order, CFRunLoopSourceContext *context)
{
  return (CFRunLoopSourceRef)MEMORY[0x270EE4EE0](allocator, order, context);
}

void CFRunLoopSourceSignal(CFRunLoopSourceRef source)
{
}

void CFRunLoopStop(CFRunLoopRef rl)
{
}

CFRunLoopTimerRef CFRunLoopTimerCreate(CFAllocatorRef allocator, CFAbsoluteTime fireDate, CFTimeInterval interval, CFOptionFlags flags, CFIndex order, CFRunLoopTimerCallBack callout, CFRunLoopTimerContext *context)
{
  return (CFRunLoopTimerRef)MEMORY[0x270EE4F00](allocator, flags, order, callout, context, fireDate, interval);
}

void CFRunLoopTimerInvalidate(CFRunLoopTimerRef timer)
{
}

void CFRunLoopWakeUp(CFRunLoopRef rl)
{
}

void CFShow(CFTypeRef obj)
{
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x270EE5048](theString1, theString2, compareOptions);
}

CFArrayRef CFStringCreateArrayBySeparatingStrings(CFAllocatorRef alloc, CFStringRef theString, CFStringRef separatorString)
{
  return (CFArrayRef)MEMORY[0x270EE5088](alloc, theString, separatorString);
}

CFStringRef CFStringCreateCopy(CFAllocatorRef alloc, CFStringRef theString)
{
  return (CFStringRef)MEMORY[0x270EE5098](alloc, theString);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x270EE50D0](alloc, bytes, numBytes, *(void *)&encoding, isExternalRepresentation);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x270EE50E0](alloc, cStr, *(void *)&encoding);
}

CFStringRef CFStringCreateWithFileSystemRepresentation(CFAllocatorRef alloc, const char *buffer)
{
  return (CFStringRef)MEMORY[0x270EE5108](alloc, buffer);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x270EE5110](alloc, formatOptions, format);
}

CFStringRef CFStringCreateWithFormatAndArguments(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, va_list arguments)
{
  return (CFStringRef)MEMORY[0x270EE5118](alloc, formatOptions, format, arguments);
}

CFStringRef CFStringCreateWithSubstring(CFAllocatorRef alloc, CFStringRef str, CFRange range)
{
  return (CFStringRef)MEMORY[0x270EE5128](alloc, str, range.location, range.length);
}

CFRange CFStringFind(CFStringRef theString, CFStringRef stringToFind, CFStringCompareFlags compareOptions)
{
  CFIndex v3 = MEMORY[0x270EE5148](theString, stringToFind, compareOptions);
  result.CFIndex length = v4;
  result.location = v3;
  return result;
}

CFIndex CFStringGetBytes(CFStringRef theString, CFRange range, CFStringEncoding encoding, UInt8 lossByte, Boolean isExternalRepresentation, UInt8 *buffer, CFIndex maxBufLen, CFIndex *usedBufLen)
{
  return MEMORY[0x270EE5170](theString, range.location, range.length, *(void *)&encoding, lossByte, isExternalRepresentation, buffer, maxBufLen);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x270EE5178](theString, buffer, bufferSize, *(void *)&encoding);
}

CFStringEncoding CFStringGetFastestEncoding(CFStringRef theString)
{
  return MEMORY[0x270EE51B0](theString);
}

Boolean CFStringGetFileSystemRepresentation(CFStringRef string, char *buffer, CFIndex maxBufLen)
{
  return MEMORY[0x270EE51B8](string, buffer, maxBufLen);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x270EE51D8](theString);
}

CFIndex CFStringGetMaximumSizeForEncoding(CFIndex length, CFStringEncoding encoding)
{
  return MEMORY[0x270EE51E0](length, *(void *)&encoding);
}

CFIndex CFStringGetMaximumSizeOfFileSystemRepresentation(CFStringRef string)
{
  return MEMORY[0x270EE51E8](string);
}

CFStringRef CFStringGetNameOfEncoding(CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x270EE51F0](*(void *)&encoding);
}

CFStringEncoding CFStringGetSmallestEncoding(CFStringRef theString)
{
  return MEMORY[0x270EE5208](theString);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x270EE5218]();
}

CFStringRef CFURLCopyFileSystemPath(CFURLRef anURL, CFURLPathStyle pathStyle)
{
  return (CFStringRef)MEMORY[0x270EE5328](anURL, pathStyle);
}

CFURLRef CFURLCreateCopyAppendingPathComponent(CFAllocatorRef allocator, CFURLRef url, CFStringRef pathComponent, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x270EE5390](allocator, url, pathComponent, isDirectory);
}

CFURLRef CFURLCreateCopyAppendingPathExtension(CFAllocatorRef allocator, CFURLRef url, CFStringRef extension)
{
  return (CFURLRef)MEMORY[0x270EE5398](allocator, url, extension);
}

CFURLRef CFURLCreateCopyDeletingLastPathComponent(CFAllocatorRef allocator, CFURLRef url)
{
  return (CFURLRef)MEMORY[0x270EE53A0](allocator, url);
}

CFURLRef CFURLCreateWithFileSystemPath(CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x270EE53F0](allocator, filePath, pathStyle, isDirectory);
}

CFUUIDRef CFUUIDCreate(CFAllocatorRef alloc)
{
  return (CFUUIDRef)MEMORY[0x270EE5470](alloc);
}

CFStringRef CFUUIDCreateString(CFAllocatorRef alloc, CFUUIDRef uuid)
{
  return (CFStringRef)MEMORY[0x270EE5488](alloc, uuid);
}

void CFWriteStreamClose(CFWriteStreamRef stream)
{
}

CFTypeRef CFWriteStreamCopyProperty(CFWriteStreamRef stream, CFStreamPropertyKey propertyName)
{
  return (CFTypeRef)MEMORY[0x270EE5528](stream, propertyName);
}

CFWriteStreamRef CFWriteStreamCreateWithAllocatedBuffers(CFAllocatorRef alloc, CFAllocatorRef bufferAllocator)
{
  return (CFWriteStreamRef)MEMORY[0x270EE5530](alloc, bufferAllocator);
}

CFWriteStreamRef CFWriteStreamCreateWithFile(CFAllocatorRef alloc, CFURLRef fileURL)
{
  return (CFWriteStreamRef)MEMORY[0x270EE5538](alloc, fileURL);
}

CFStreamError CFWriteStreamGetError(CFWriteStreamRef stream)
{
  CFIndex v1 = MEMORY[0x270EE5540](stream);
  result.error = v2;
  result.domain = v1;
  return result;
}

Boolean CFWriteStreamOpen(CFWriteStreamRef stream)
{
  return MEMORY[0x270EE5558](stream);
}

IOReturn IOPMAssertionCreateWithName(CFStringRef AssertionType, IOPMAssertionLevel AssertionLevel, CFStringRef AssertionName, IOPMAssertionID *AssertionID)
{
  return MEMORY[0x270EF4840](AssertionType, *(void *)&AssertionLevel, AssertionName, AssertionID);
}

IOReturn IOPMAssertionRelease(IOPMAssertionID AssertionID)
{
  return MEMORY[0x270EF4868](*(void *)&AssertionID);
}

OSStatus SSLRead(SSLContextRef context, void *data, size_t dataLength, size_t *processed)
{
  return MEMORY[0x270EFD588](context, data, dataLength, processed);
}

OSStatus SSLWrite(SSLContextRef context, const void *data, size_t dataLength, size_t *processed)
{
  return MEMORY[0x270EFD5F8](context, data, dataLength, processed);
}

uint64_t _CFGetProgname()
{
  return MEMORY[0x270EE5630]();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

int __darwin_check_fd_set_overflow(int a1, const void *a2, int a3)
{
  return MEMORY[0x270ED7DA8](*(void *)&a1, a2, *(void *)&a3);
}

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x270ED7E38]();
}

int __sprintf_chk(char *a1, int a2, size_t a3, const char *a4, ...)
{
  return MEMORY[0x270ED7EB0](a1, *(void *)&a2, a3, a4);
}

uint64_t __strcat_chk()
{
  return MEMORY[0x270ED7EC8]();
}

uint64_t __strcpy_chk()
{
  return MEMORY[0x270ED7ED0]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void abort(void)
{
}

int accept(int a1, sockaddr *a2, socklen_t *a3)
{
  return MEMORY[0x270ED8478](*(void *)&a1, a2, a3);
}

int atexit(void (*a1)(void))
{
  return MEMORY[0x270ED86D8](a1);
}

int bind(int a1, const sockaddr *a2, socklen_t a3)
{
  return MEMORY[0x270ED8758](*(void *)&a1, a2, *(void *)&a3);
}

void bzero(void *a1, size_t a2)
{
}

int close(int a1)
{
  return MEMORY[0x270ED8F18](*(void *)&a1);
}

int connect(int a1, const sockaddr *a2, socklen_t a3)
{
  return MEMORY[0x270ED8F58](*(void *)&a1, a2, *(void *)&a3);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x270ED9340]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x270ED9378](group, timeout);
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_retain(dispatch_object_t object)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

int fclose(FILE *a1)
{
  return MEMORY[0x270ED98C8](a1);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x270ED98D0](*(void *)&a1, *(void *)&a2);
}

int feof(FILE *a1)
{
  return MEMORY[0x270ED9910](a1);
}

int ferror(FILE *a1)
{
  return MEMORY[0x270ED9918](a1);
}

int flock(int a1, int a2)
{
  return MEMORY[0x270ED9998](*(void *)&a1, *(void *)&a2);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x270ED99F0](__filename, __mode);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x270ED9A08](a1, a2);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x270ED9A28](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x270ED9AF0](*(void *)&a1, a2);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x270ED9B88](__ptr, __size, __nitems, __stream);
}

hostent *__cdecl gethostbyname(const char *a1)
{
  return (hostent *)MEMORY[0x270ED9C48](a1);
}

pid_t getpid(void)
{
  return MEMORY[0x270ED9CE0]();
}

uid_t getuid(void)
{
  return MEMORY[0x270ED9DA0]();
}

int inet_pton(int a1, const char *a2, void *a3)
{
  return MEMORY[0x270ED9EC8](*(void *)&a1, a2, a3);
}

int kevent(int kq, const kevent *changelist, int nchanges, kevent *eventlist, int nevents, const timespec *timeout)
{
  return MEMORY[0x270ED9F60](*(void *)&kq, changelist, *(void *)&nchanges, eventlist, *(void *)&nevents, timeout);
}

int kqueue(void)
{
  return MEMORY[0x270ED9F90]();
}

int launch_activate_socket(const char *name, int **fds, size_t *cnt)
{
  return MEMORY[0x270ED9F98](name, fds, cnt);
}

int listen(int a1, int a2)
{
  return MEMORY[0x270EDA078](*(void *)&a1, *(void *)&a2);
}

uint64_t lockdown_checkin_xpc()
{
  return MEMORY[0x270F99B18]();
}

uint64_t lockdown_disconnect()
{
  return MEMORY[0x270F99B50]();
}

uint64_t lockdown_get_securecontext()
{
  return MEMORY[0x270F99B58]();
}

uint64_t lockdown_get_socket()
{
  return MEMORY[0x270F99B60]();
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA388](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

int mkdir(const char *a1, mode_t a2)
{
  return MEMORY[0x270EDA518](a1, a2);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x270EDA828](a1, *(void *)&a2);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

int pthread_cond_broadcast(pthread_cond_t *a1)
{
  return MEMORY[0x270EDAE50](a1);
}

int pthread_cond_destroy(pthread_cond_t *a1)
{
  return MEMORY[0x270EDAE58](a1);
}

int pthread_cond_init(pthread_cond_t *a1, const pthread_condattr_t *a2)
{
  return MEMORY[0x270EDAE60](a1, a2);
}

int pthread_cond_wait(pthread_cond_t *a1, pthread_mutex_t *a2)
{
  return MEMORY[0x270EDAE88](a1, a2);
}

int pthread_create(pthread_t *a1, const pthread_attr_t *a2, void *(__cdecl *a3)(void *), void *a4)
{
  return MEMORY[0x270EDAEA0](a1, a2, a3, a4);
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF50](a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x270EDAF58](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF60](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF70](a1);
}

pthread_t pthread_self(void)
{
  return (pthread_t)MEMORY[0x270EDB010]();
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x270EDB120](*(void *)&a1, a2, a3);
}

ssize_t recv(int a1, void *a2, size_t a3, int a4)
{
  return MEMORY[0x270EDB190](*(void *)&a1, a2, a3, *(void *)&a4);
}

void rename(const std::__fs::filesystem::path *__from, const std::__fs::filesystem::path *__to, std::error_code *__ec)
{
}

uint64_t secure_lockdown_checkin()
{
  return MEMORY[0x270F99B90]();
}

int select(int a1, fd_set *a2, fd_set *a3, fd_set *a4, timeval *a5)
{
  return MEMORY[0x270EDB328](*(void *)&a1, a2, a3, a4, a5);
}

ssize_t send(int a1, const void *a2, size_t a3, int a4)
{
  return MEMORY[0x270EDB3B0](*(void *)&a1, a2, a3, *(void *)&a4);
}

int setsockopt(int a1, int a2, int a3, const void *a4, socklen_t a5)
{
  return MEMORY[0x270EDB440](*(void *)&a1, *(void *)&a2, *(void *)&a3, a4, *(void *)&a5);
}

int shutdown(int a1, int a2)
{
  return MEMORY[0x270EDB480](*(void *)&a1, *(void *)&a2);
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return (void (__cdecl *)(int))MEMORY[0x270EDB4D0](*(void *)&a1, a2);
}

int socket(int a1, int a2, int a3)
{
  return MEMORY[0x270EDB520](*(void *)&a1, *(void *)&a2, *(void *)&a3);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x270EDB568](a1, a2);
}

char *__cdecl strcat(char *__s1, const char *__s2)
{
  return (char *)MEMORY[0x270EDB5A0](__s1, __s2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x270EDB5D8](*(void *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

void syslog(int a1, const char *a2, ...)
{
}

int unlink(const char *a1)
{
  return MEMORY[0x270EDB9A8](a1);
}