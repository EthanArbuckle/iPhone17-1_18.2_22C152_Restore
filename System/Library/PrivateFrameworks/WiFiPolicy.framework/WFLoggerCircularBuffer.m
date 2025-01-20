@interface WFLoggerCircularBuffer
- (WFLoggerCircularBuffer)init;
- (void)WFLog:(unint64_t)a3 privacy:(unint64_t)a4 cfStrMsg:(__CFString *)a5;
- (void)WFLog:(unint64_t)a3 privacy:(unint64_t)a4 message:(const char *)a5 valist:(char *)a6;
- (void)dealloc;
- (void)dump;
@end

@implementation WFLoggerCircularBuffer

- (void)WFLog:(unint64_t)a3 privacy:(unint64_t)a4 message:(const char *)a5 valist:(char *)a6
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v16 = 0;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  *(_OWORD *)v17 = 0u;
  long long v18 = 0u;
  if (self->_wiFiLoggingLogBufferRef)
  {
    __vsnprintf_chk(v17, 0xA0uLL, 0, 0xA0uLL, a5, a6);
    v7 = -[NSDateFormatter stringFromDate:](self->_tsFormatter, "stringFromDate:", [MEMORY[0x1E4F1C9C8] date]);
    CFAllocatorRef v8 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    CFStringRef v9 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, @"%@ %s\n", v7, v17);
    if (v9)
    {
      CFDataRef ExternalRepresentation = CFStringCreateExternalRepresentation(v8, v9, 0x8000100u, 0x3Fu);
      v14[3] = (uint64_t)ExternalRepresentation;
      if (ExternalRepresentation)
      {
        dispatchQueue = self->_dispatchQueue;
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __55__WFLoggerCircularBuffer_WFLog_privacy_message_valist___block_invoke;
        block[3] = &unk_1E69BD9C0;
        block[4] = self;
        block[5] = &v13;
        dispatch_async(dispatchQueue, block);
      }
      CFRelease(v9);
    }
  }
  _Block_object_dispose(&v13, 8);
}

void __55__WFLoggerCircularBuffer_WFLog_privacy_message_valist___block_invoke(uint64_t a1)
{
  if (CFDataGetLength(*(CFDataRef *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) >= 1)
  {
    CFIndex v2 = 0;
    do
    {
      uint64_t v3 = *(void *)(a1 + 32);
      uint64_t v4 = *(void *)(v3 + 40);
      uint64_t v5 = *(void *)(v3 + 48);
      uint64_t v6 = v4 % v5;
      int64_t v7 = v5 - v4 % v5;
      CFIndex Length = CFDataGetLength(*(CFDataRef *)(*(void *)(*(void *)(a1 + 40) + 8) + 24));
      if (Length - v2 < v7) {
        int64_t v7 = Length - v2;
      }
      CFStringRef v9 = (void *)(*(void *)(*(void *)(a1 + 32) + 32) + v6);
      BytePtr = CFDataGetBytePtr(*(CFDataRef *)(*(void *)(*(void *)(a1 + 40) + 8) + 24));
      memcpy(v9, &BytePtr[v2], v7);
      v2 += v7;
      *(void *)(*(void *)(a1 + 32) + 40) += v7;
    }
    while (v2 < CFDataGetLength(*(CFDataRef *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)));
  }
  v11 = *(const void **)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  if (v11)
  {
    CFRelease(v11);
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
}

- (void)WFLog:(unint64_t)a3 privacy:(unint64_t)a4 cfStrMsg:(__CFString *)a5
{
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 0;
  if (self->_wiFiLoggingLogBufferRef)
  {
    CFAllocatorRef v6 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    CFStringRef v7 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, @"%@ \n", a4, a5);
    if (v7)
    {
      CFDataRef ExternalRepresentation = CFStringCreateExternalRepresentation(v6, v7, 0x8000100u, 0x3Fu);
      v12[3] = (uint64_t)ExternalRepresentation;
      if (ExternalRepresentation)
      {
        dispatchQueue = self->_dispatchQueue;
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __49__WFLoggerCircularBuffer_WFLog_privacy_cfStrMsg___block_invoke;
        block[3] = &unk_1E69BD9C0;
        block[4] = self;
        block[5] = &v11;
        dispatch_async(dispatchQueue, block);
      }
      CFRelease(v7);
    }
  }
  _Block_object_dispose(&v11, 8);
}

void __49__WFLoggerCircularBuffer_WFLog_privacy_cfStrMsg___block_invoke(uint64_t a1)
{
  if (CFDataGetLength(*(CFDataRef *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) >= 1)
  {
    CFIndex v2 = 0;
    do
    {
      uint64_t v3 = *(void *)(a1 + 32);
      uint64_t v4 = *(void *)(v3 + 40);
      uint64_t v5 = *(void *)(v3 + 48);
      uint64_t v6 = v4 % v5;
      int64_t v7 = v5 - v4 % v5;
      CFIndex Length = CFDataGetLength(*(CFDataRef *)(*(void *)(*(void *)(a1 + 40) + 8) + 24));
      if (Length - v2 < v7) {
        int64_t v7 = Length - v2;
      }
      CFStringRef v9 = (void *)(*(void *)(*(void *)(a1 + 32) + 32) + v6);
      BytePtr = CFDataGetBytePtr(*(CFDataRef *)(*(void *)(*(void *)(a1 + 40) + 8) + 24));
      memcpy(v9, &BytePtr[v2], v7);
      v2 += v7;
      *(void *)(*(void *)(a1 + 32) + 40) += v7;
    }
    while (v2 < CFDataGetLength(*(CFDataRef *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)));
  }
  uint64_t v11 = *(const void **)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  if (v11)
  {
    CFRelease(v11);
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
}

- (void)dealloc
{
  tsFormatter = self->_tsFormatter;
  if (tsFormatter)
  {
    CFRelease(tsFormatter);
    self->_tsFormatter = 0;
  }
  free(self->_wiFiLoggingLogBufferRef);
  self->_wiFiLoggingLogBufferRef = 0;
  dispatchQueue = self->_dispatchQueue;
  if (dispatchQueue) {
    dispatch_release(dispatchQueue);
  }
  v5.receiver = self;
  v5.super_class = (Class)WFLoggerCircularBuffer;
  [(WFLoggerCircularBuffer *)&v5 dealloc];
}

- (WFLoggerCircularBuffer)init
{
  v7.receiver = self;
  v7.super_class = (Class)WFLoggerCircularBuffer;
  CFIndex v2 = [(WFLoggerCircularBuffer *)&v7 init];
  uint64_t v3 = v2;
  if (v2
    && (v2->_wiFiLoggingLogBufferIndex = 0,
        v2->_wiFiLoggingLogBufferMaxSize = 307200,
        v2->_dumpId = 0,
        uint64_t v4 = (char *)malloc_type_calloc(0x4B000uLL, 1uLL, 0x826D0A5CuLL),
        (v3->_wiFiLoggingLogBufferRef = v4) != 0)
    && (objc_super v5 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E4F28C10]), (v3->_tsFormatter = v5) != 0))
  {
    [(NSDateFormatter *)v5 setDateFormat:@"MM/dd/yyyy HH:mm:ss.SSS"];
    v3->_dispatchQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.wfloggercircularbuffer", 0);
  }
  else
  {

    return 0;
  }
  return v3;
}

- (void)dump
{
  uint64_t v3 = os_transaction_create();
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __30__WFLoggerCircularBuffer_dump__block_invoke;
  v5[3] = &unk_1E69BD9E8;
  v5[4] = v3;
  v5[5] = self;
  dispatch_async(dispatchQueue, v5);
}

void __30__WFLoggerCircularBuffer_dump__block_invoke(uint64_t a1)
{
  memset(&v11, 0, sizeof(v11));
  if (stat("/var/mobile/Library/Logs/CrashReporter/WiFi", &v11) != -1
    || !mkdir("/var/mobile/Library/Logs/CrashReporter/WiFi", 0x1FDu))
  {
    id v2 = objc_alloc_init(MEMORY[0x1E4F28C10]);
    [v2 setDateFormat:@"MM-dd-yyyy__HH:mm:ss.SSS"];
    uint64_t v3 = *(void *)(a1 + 40);
    uint64_t v4 = *(unsigned int *)(v3 + 56);
    objc_super v5 = NSString;
    *(_DWORD *)(v3 + 56) = v4 + 1;
    uint64_t v6 = fopen((const char *)[(id)objc_msgSend(v5 stringWithFormat:@"/var/mobile/Library/Logs/CrashReporter/WiFi/wifi-buf-%d-%@.log", v4, objc_msgSend(v2, "stringFromDate:", objc_msgSend(MEMORY[0x1E4F1C9C8], "date"))), "cStringUsingEncoding:", 4], "wb");
    if (v6)
    {
      objc_super v7 = v6;
      uint64_t v8 = *(void *)(a1 + 40);
      int64_t v9 = *(void *)(v8 + 40);
      int64_t v10 = *(void *)(v8 + 48);
      if (v9 >= v10)
      {
        v9 %= v10;
        fwrite((const void *)(*(void *)(v8 + 32) + v9), v10 - v9, 1uLL, v6);
        uint64_t v8 = *(void *)(a1 + 40);
      }
      fwrite(*(const void **)(v8 + 32), v9, 1uLL, v7);
      bzero(*(void **)(*(void *)(a1 + 40) + 32), *(void *)(*(void *)(a1 + 40) + 48));
      *(void *)(*(void *)(a1 + 40) + 40) = 0;
      fflush(v7);
      fclose(v7);
    }
  }
}

@end