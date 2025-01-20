@interface PLKQueue
- (BOOL)enabled;
- (NSString)path;
- (OS_dispatch_queue)dispatchQueue;
- (PLKQueue)initWithPath:(id)a3 withDispatchQueue:(id)a4 withBlock:(id)a5;
- (__CFFileDescriptor)kqueueDescriptorRef;
- (__CFRunLoopSource)kqueueDescriptorSource;
- (id)kQueueBlock;
- (int)fileDescriptor;
- (int)kQueue;
- (void)setDispatchQueue:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setFileDescriptor:(int)a3;
- (void)setKQueue:(int)a3;
- (void)setKQueueBlock:(id)a3;
- (void)setKqueueDescriptorRef:(__CFFileDescriptor *)a3;
- (void)setKqueueDescriptorSource:(__CFRunLoopSource *)a3;
- (void)setPath:(id)a3;
@end

@implementation PLKQueue

- (PLKQueue)initWithPath:(id)a3 withDispatchQueue:(id)a4 withBlock:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)PLKQueue;
  v12 = [(PLKQueue *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_path, a3);
    objc_storeStrong((id *)&v13->_dispatchQueue, a4);
    *(void *)&v13->_kQueue = -1;
    v13->_kqueueDescriptorSource = 0;
    v13->_kqueueDescriptorRef = 0;
    uint64_t v14 = MEMORY[0x1C1869370](v11);
    id kQueueBlock = v13->_kQueueBlock;
    v13->_id kQueueBlock = (id)v14;
  }
  return v13;
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  v4 = self;
  objc_sync_enter(v4);
  v4->_enabled = v3;
  if (+[PLDefaults debugEnabled])
  {
    uint64_t v5 = objc_opt_class();
    v65[0] = MEMORY[0x1E4F143A8];
    v65[1] = 3221225472;
    v65[2] = __23__PLKQueue_setEnabled___block_invoke;
    v65[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v65[4] = v5;
    if (setEnabled__defaultOnce != -1) {
      dispatch_once(&setEnabled__defaultOnce, v65);
    }
    if (setEnabled__classDebugEnabled)
    {
      v6 = NSString;
      v7 = NSStringFromBOOL();
      v8 = [v6 stringWithFormat:@"PLKQueue.setEnabled: enabled=%@", v7];

      id v9 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLKQueue.m"];
      id v10 = [v9 lastPathComponent];
      id v11 = [NSString stringWithUTF8String:"-[PLKQueue setEnabled:]"];
      +[PLCoreStorage logMessage:v8 fromFile:v10 fromFunction:v11 fromLineNumber:53];

      v12 = PLLogCommon();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        -[PLIOHIDOperatorComposition initWithOperator:forService:]((uint64_t)v8, v12, v13, v14, v15, v16, v17, v18);
      }
    }
  }
  if (v3)
  {
    if ([(PLKQueue *)v4 kQueue] != -1) {
      goto LABEL_53;
    }
    [(PLKQueue *)v4 setFileDescriptor:0xFFFFFFFFLL];
    for (unsigned int i = 6; i > 1; --i)
    {
      if ([(PLKQueue *)v4 fileDescriptor] > 0) {
        break;
      }
      *__error() = 0;
      id v20 = [(PLKQueue *)v4 path];
      -[PLKQueue setFileDescriptor:](v4, "setFileDescriptor:", open((const char *)[v20 fileSystemRepresentation], 0x8000));

      if ([(PLKQueue *)v4 fileDescriptor] <= 0)
      {
        if (+[PLDefaults debugEnabled])
        {
          uint64_t v21 = objc_opt_class();
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __23__PLKQueue_setEnabled___block_invoke_16;
          block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          block[4] = v21;
          if (setEnabled__defaultOnce_14 != -1) {
            dispatch_once(&setEnabled__defaultOnce_14, block);
          }
          if (setEnabled__classDebugEnabled_15)
          {
            v22 = NSString;
            uint64_t v23 = [(PLKQueue *)v4 fileDescriptor];
            uint64_t v24 = *__error();
            v25 = __error();
            v26 = objc_msgSend(v22, "stringWithFormat:", @"PLKQueue.enabled error! fileDescriptor=%d errno=%d-%s", v23, v24, strerror(*v25));
            v27 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLKQueue.m"];
            v28 = [v27 lastPathComponent];
            v29 = [NSString stringWithUTF8String:"-[PLKQueue setEnabled:]"];
            +[PLCoreStorage logMessage:v26 fromFile:v28 fromFunction:v29 fromLineNumber:63];

            v30 = PLLogCommon();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
            {
              LODWORD(buf.version) = 138412290;
              *(CFIndex *)((char *)&buf.version + 4) = (CFIndex)v26;
              _os_log_debug_impl(&dword_1BBD2F000, v30, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&buf, 0xCu);
            }
          }
        }
        sleep(1u);
      }
    }
    if ([(PLKQueue *)v4 fileDescriptor] < 1)
    {
      v60 = "self.fileDescriptor > 0";
      int v61 = 68;
    }
    else
    {
      for (unsigned int j = 6; j > 1; --j)
      {
        if ([(PLKQueue *)v4 kQueue] > 0) {
          break;
        }
        *__error() = 0;
        [(PLKQueue *)v4 setKQueue:kqueue()];
        if ([(PLKQueue *)v4 kQueue] <= 0)
        {
          if (+[PLDefaults debugEnabled])
          {
            uint64_t v34 = objc_opt_class();
            v63[0] = MEMORY[0x1E4F143A8];
            v63[1] = 3221225472;
            v63[2] = __23__PLKQueue_setEnabled___block_invoke_24;
            v63[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            v63[4] = v34;
            if (setEnabled__defaultOnce_22 != -1) {
              dispatch_once(&setEnabled__defaultOnce_22, v63);
            }
            if (setEnabled__classDebugEnabled_23)
            {
              v35 = NSString;
              uint64_t v36 = [(PLKQueue *)v4 kQueue];
              uint64_t v37 = *__error();
              v38 = __error();
              v39 = objc_msgSend(v35, "stringWithFormat:", @"PLKQueue.enabled error! kQueue=%d errno=%d-%s", v36, v37, strerror(*v38));
              v40 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLKQueue.m"];
              v41 = [v40 lastPathComponent];
              v42 = [NSString stringWithUTF8String:"-[PLKQueue setEnabled:]"];
              +[PLCoreStorage logMessage:v39 fromFile:v41 fromFunction:v42 fromLineNumber:75];

              v43 = PLLogCommon();
              if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
              {
                LODWORD(buf.version) = 138412290;
                *(CFIndex *)((char *)&buf.version + 4) = (CFIndex)v39;
                _os_log_debug_impl(&dword_1BBD2F000, v43, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&buf, 0xCu);
              }
            }
          }
          sleep(1u);
        }
      }
      if ([(PLKQueue *)v4 kQueue] > 0)
      {
        changelist.ident = [(PLKQueue *)v4 fileDescriptor];
        *(void *)&changelist.filter = 0x7F0025FFFCLL;
        changelist.data = 0;
        changelist.udata = &v4->_fileDescriptor;
        if (kevent([(PLKQueue *)v4 kQueue], &changelist, 1, 0, 0, 0) == -1)
        {
          if (+[PLDefaults debugEnabled])
          {
            uint64_t v44 = objc_opt_class();
            v62[0] = MEMORY[0x1E4F143A8];
            v62[1] = 3221225472;
            v62[2] = __23__PLKQueue_setEnabled___block_invoke_31;
            v62[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            v62[4] = v44;
            if (setEnabled__defaultOnce_29 != -1) {
              dispatch_once(&setEnabled__defaultOnce_29, v62);
            }
            if (setEnabled__classDebugEnabled_30)
            {
              v45 = [NSString stringWithFormat:@"unable to setup kQueue"];
              v46 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLKQueue.m"];
              v47 = [v46 lastPathComponent];
              v48 = [NSString stringWithUTF8String:"-[PLKQueue setEnabled:]"];
              +[PLCoreStorage logMessage:v45 fromFile:v47 fromFunction:v48 fromLineNumber:89];

              v49 = PLLogCommon();
              if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG)) {
                -[PLIOHIDOperatorComposition initWithOperator:forService:]((uint64_t)v45, v49, v50, v51, v52, v53, v54, v55);
              }
            }
          }
          +[PLUtilities exitWithReason:102];
        }
        buf.version = 0;
        memset(&buf.retain, 0, 24);
        buf.info = v4;
        CFFileDescriptorNativeDescriptor v56 = [(PLKQueue *)v4 kQueue];
        CFAllocatorRef v57 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
        [(PLKQueue *)v4 setKqueueDescriptorRef:CFFileDescriptorCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v56, 1u, (CFFileDescriptorCallBack)kQueueEvent, &buf)];
        CFFileDescriptorEnableCallBacks([(PLKQueue *)v4 kqueueDescriptorRef], 1uLL);
        [(PLKQueue *)v4 setKqueueDescriptorSource:CFFileDescriptorCreateRunLoopSource(v57, [(PLKQueue *)v4 kqueueDescriptorRef], 0)];
        Main = CFRunLoopGetMain();
        v59 = [(PLKQueue *)v4 kqueueDescriptorSource];
        CFRunLoopAddSource(Main, v59, (CFRunLoopMode)*MEMORY[0x1E4F1D418]);
        goto LABEL_53;
      }
      v60 = "self.kQueue > 0";
      int v61 = 80;
    }
    __assert_rtn("-[PLKQueue setEnabled:]", "PLKQueue.m", v61, v60);
  }
  if ([(PLKQueue *)v4 kqueueDescriptorSource])
  {
    v31 = CFRunLoopGetMain();
    v32 = [(PLKQueue *)v4 kqueueDescriptorSource];
    CFRunLoopRemoveSource(v31, v32, (CFRunLoopMode)*MEMORY[0x1E4F1D418]);
    CFRelease([(PLKQueue *)v4 kqueueDescriptorSource]);
    [(PLKQueue *)v4 setKqueueDescriptorSource:0];
  }
  if ([(PLKQueue *)v4 kqueueDescriptorRef])
  {
    CFFileDescriptorInvalidate([(PLKQueue *)v4 kqueueDescriptorRef]);
    CFRelease([(PLKQueue *)v4 kqueueDescriptorRef]);
    [(PLKQueue *)v4 setKqueueDescriptorRef:0];
    [(PLKQueue *)v4 setKQueue:0xFFFFFFFFLL];
  }
  if ([(PLKQueue *)v4 fileDescriptor] != -1)
  {
    close([(PLKQueue *)v4 fileDescriptor]);
    [(PLKQueue *)v4 setFileDescriptor:0xFFFFFFFFLL];
  }
LABEL_53:
  objc_sync_exit(v4);
}

BOOL __23__PLKQueue_setEnabled___block_invoke(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  setEnabled__classDebugEnabled = result;
  return result;
}

BOOL __23__PLKQueue_setEnabled___block_invoke_16(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  setEnabled__classDebugEnabled_15 = result;
  return result;
}

BOOL __23__PLKQueue_setEnabled___block_invoke_24(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  setEnabled__classDebugEnabled_23 = result;
  return result;
}

BOOL __23__PLKQueue_setEnabled___block_invoke_31(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  setEnabled__classDebugEnabled_30 = result;
  return result;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (int)kQueue
{
  return self->_kQueue;
}

- (void)setKQueue:(int)a3
{
  self->_kQueue = a3;
}

- (int)fileDescriptor
{
  return self->_fileDescriptor;
}

- (void)setFileDescriptor:(int)a3
{
  self->_fileDescriptor = a3;
}

- (__CFRunLoopSource)kqueueDescriptorSource
{
  return self->_kqueueDescriptorSource;
}

- (void)setKqueueDescriptorSource:(__CFRunLoopSource *)a3
{
  self->_kqueueDescriptorSource = a3;
}

- (__CFFileDescriptor)kqueueDescriptorRef
{
  return self->_kqueueDescriptorRef;
}

- (void)setKqueueDescriptorRef:(__CFFileDescriptor *)a3
{
  self->_kqueueDescriptorRef = a3;
}

- (NSString)path
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setPath:(id)a3
{
}

- (OS_dispatch_queue)dispatchQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 48, 1);
}

- (void)setDispatchQueue:(id)a3
{
}

- (id)kQueueBlock
{
  return self->_kQueueBlock;
}

- (void)setKQueueBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_kQueueBlock, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_path, 0);
}

@end