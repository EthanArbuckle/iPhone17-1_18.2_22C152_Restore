@interface MFStream
+ (id)_networkDispatchQueue;
+ (id)networkThread;
+ (void)setNetworkThread:(id)a3;
- (BOOL)isOpen;
- (BOOL)setProperty:(id)a3 forKey:(id)a4;
- (NSError)streamError;
- (id)_copyPropertyForKey:(id)a3;
- (id)initCallBack:(id)a3 onDispatchQueue:(id)a4;
- (id)propertyForKey:(id)a3;
- (int64_t)read:(char *)a3 maxLength:(unint64_t)a4;
- (int64_t)write:(const char *)a3 maxLength:(unint64_t)a4;
- (void)_closeAndReleaseStream:(id)a3 logMessage:(id)a4;
- (void)_createPairWithSocketToHostName:(id)a3 port:(int64_t)a4;
- (void)_readBytesFromStream;
- (void)close;
- (void)dealloc;
- (void)openToHostName:(id)a3 port:(int64_t)a4;
- (void)stream:(id)a3 handleEvent:(unint64_t)a4;
@end

@implementation MFStream

+ (id)networkThread
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  pthread_mutex_lock(&NetworkThreadLock);
  v2 = (void *)NetworkThread;
  if (!NetworkThread)
  {
    pthread_t v6 = 0;
    memset(&v7, 0, sizeof(v7));
    v3 = (void *)[objc_alloc(MEMORY[0x1E4F28BB8]) initWithCondition:0];
    pthread_attr_init(&v7);
    pthread_attr_setdetachstate(&v7, 2);
    pthread_create(&v6, &v7, (void *(__cdecl *)(void *))_MFSocketNetworkThread, v3);
    [v3 lockWhenCondition:1];
    [v3 unlock];

    v2 = (void *)NetworkThread;
  }
  id v4 = v2;
  pthread_mutex_unlock(&NetworkThreadLock);
  return v4;
}

+ (void)setNetworkThread:(id)a3
{
  if (!NetworkThread)
  {
    pthread_mutex_lock(&NetworkThreadLock);
    if (!NetworkThread) {
      NetworkThread = (uint64_t)a3;
    }
    pthread_mutex_unlock(&NetworkThreadLock);
  }
}

+ (id)_networkDispatchQueue
{
  id result = (id)_networkDispatchQueue_NetworkDispatchQueue;
  if (!_networkDispatchQueue_NetworkDispatchQueue)
  {
    v5 = (void *)[(id)objc_opt_class() networkThread];
    if (objc_msgSend(v5, "isEqual:", objc_msgSend(MEMORY[0x1E4F29060], "currentThread")))
    {
      id result = dispatch_queue_create("MFStreamDispatchQueue", 0);
      _networkDispatchQueue_NetworkDispatchQueue = (uint64_t)result;
    }
    else
    {
      uint64_t v6 = [a1 methodSignatureForSelector:a2];
      pthread_attr_t v7 = (void *)[MEMORY[0x1E4F1CA18] invocationWithMethodSignature:v6];
      [v7 setTarget:a1];
      [v7 setSelector:a2];
      [v7 performSelector:sel_invoke onThread:v5 withObject:0 waitUntilDone:1];
      return (id)_networkDispatchQueue_NetworkDispatchQueue;
    }
  }
  return result;
}

- (id)initCallBack:(id)a3 onDispatchQueue:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v10.receiver = self;
  v10.super_class = (Class)MFStream;
  uint64_t v6 = [(MFStream *)&v10 init];
  if (v6)
  {
    if (a4) {
      dispatch_retain((dispatch_object_t)a4);
    }
    else {
      a4 = dispatch_queue_create(0, 0);
    }
    v6->_location = (OS_dispatch_queue *)a4;
    if (a3) {
      id v7 = a3;
    }
    else {
      id v7 = &__block_literal_global;
    }
    v6->_callback = _Block_copy(v7);
    uint64_t v8 = MFLogGeneral();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v12 = v6;
      _os_log_impl(&dword_1CFCFE000, v8, OS_LOG_TYPE_INFO, "#Streams (%p) created", buf, 0xCu);
    }
    v6->_condition = (NSCondition *)objc_alloc_init(MEMORY[0x1E4F28BB0]);
  }
  return v6;
}

- (void)dealloc
{
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_10(&dword_1CFCFE000, v0, v1, "#Streams (%p) deallocated", v2, v3, v4, v5, v6);
}

- (BOOL)isOpen
{
  if (self->_length) {
    return 1;
  }
  if (self->_rStream) {
    return self->_wStream != 0;
  }
  return 0;
}

- (id)_copyPropertyForKey:(id)a3
{
  v14 = 0;
  id v15 = a3;
  uint8_t v6 = (void *)[(id)objc_opt_class() networkThread];
  if ((objc_msgSend(v6, "isEqual:", objc_msgSend(MEMORY[0x1E4F29060], "currentThread")) & 1) == 0)
  {
    uint64_t v10 = [(MFStream *)self methodSignatureForSelector:a2];
    v11 = (void *)[MEMORY[0x1E4F1CA18] invocationWithMethodSignature:v10];
    [v11 setTarget:self];
    [v11 setSelector:a2];
    [v11 setArgument:&v15 atIndex:2];
    [v11 performSelector:sel_invoke onThread:v6 withObject:0 waitUntilDone:1];
    [v11 getReturnValue:&v14];
    return v14;
  }
  properties = self->_properties;
  if (!properties)
  {
    v12 = (void *)[(NSInputStream *)self->_rStream propertyForKey:a3];
    if (!v12) {
      v12 = (void *)[(NSOutputStream *)self->_wStream propertyForKey:a3];
    }
    id v13 = v12;
    return v12;
  }
  uint64_t v8 = (void *)[(NSMutableDictionary *)properties objectForKey:a3];
  return v8;
}

- (id)propertyForKey:(id)a3
{
  id v3 = [(MFStream *)self _copyPropertyForKey:a3];
  return v3;
}

- (BOOL)setProperty:(id)a3 forKey:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v19 = a4;
  id v20 = a3;
  char v18 = 1;
  uint64_t v8 = (void *)[(id)objc_opt_class() networkThread];
  if (objc_msgSend(v8, "isEqual:", objc_msgSend(MEMORY[0x1E4F29060], "currentThread")))
  {
    rStream = self->_rStream;
    if (rStream || (rStream = self->_wStream) != 0)
    {
      int v10 = [rStream setProperty:a3 forKey:a4];
      v11 = MFLogGeneral();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        v12 = "out";
        *(_DWORD *)buf = 134218498;
        v22 = self;
        if (v10) {
          v12 = "";
        }
        __int16 v23 = 2112;
        id v24 = a4;
        __int16 v25 = 2080;
        v26 = v12;
        _os_log_debug_impl(&dword_1CFCFE000, v11, OS_LOG_TYPE_DEBUG, "#Streams (%p) set property %@ with%s success", buf, 0x20u);
      }
    }
    else
    {
      properties = self->_properties;
      if (!properties)
      {
        properties = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
        self->_properties = properties;
      }
      [(NSMutableDictionary *)properties setValue:a3 forKey:a4];
      v17 = MFLogGeneral();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
        -[MFStream setProperty:forKey:]();
      }
      LOBYTE(v10) = 1;
    }
  }
  else
  {
    uint64_t v13 = [(MFStream *)self methodSignatureForSelector:a2];
    v14 = (void *)[MEMORY[0x1E4F1CA18] invocationWithMethodSignature:v13];
    [v14 setTarget:self];
    [v14 setSelector:a2];
    [v14 setArgument:&v20 atIndex:2];
    [v14 setArgument:&v19 atIndex:3];
    [v14 performSelector:sel_invoke onThread:v8 withObject:0 waitUntilDone:1];
    [v14 getReturnValue:&v18];
    LOBYTE(v10) = v18 != 0;
  }
  return v10;
}

- (void)openToHostName:(id)a3 port:(int64_t)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  int64_t v25 = a4;
  id v26 = a3;
  uint64_t v8 = (void *)[(id)objc_opt_class() networkThread];
  if (objc_msgSend(v8, "isEqual:", objc_msgSend(MEMORY[0x1E4F29060], "currentThread")))
  {
    if (self->_rStream || self->_wStream) {
      -[MFStream openToHostName:port:]();
    }
    v9 = MFLogGeneral();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218498;
      v31 = self;
      __int16 v32 = 2112;
      id v33 = a3;
      __int16 v34 = 2048;
      int64_t v35 = a4;
      _os_log_impl(&dword_1CFCFE000, v9, OS_LOG_TYPE_INFO, "#Streams Opening stream (%p) to %@:%ld", buf, 0x20u);
    }
    v28[0] = @"stream";
    uint64_t v10 = objc_msgSend(NSString, "stringWithFormat:", @"%p", self);
    v11 = &stru_1F265CF90;
    if (a3) {
      v11 = (__CFString *)a3;
    }
    v29[0] = v10;
    v29[1] = v11;
    v28[1] = @"host";
    v28[2] = @"port";
    v29[2] = [NSNumber numberWithInteger:a4];
    +[MFPowerController powerlog:eventData:](MFPowerController, "powerlog:eventData:", @"StreamOpen", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:3]);

    self->_error = 0;
    [(MFStream *)self _createPairWithSocketToHostName:a3 port:a4];
    [(NSInputStream *)self->_rStream setDelegate:self];
    [(NSOutputStream *)self->_wStream setDelegate:self];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    properties = self->_properties;
    uint64_t v13 = [(NSMutableDictionary *)properties countByEnumeratingWithState:&v21 objects:v27 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v22 != v15) {
            objc_enumerationMutation(properties);
          }
          [(NSInputStream *)self->_rStream setProperty:[(NSMutableDictionary *)self->_properties objectForKey:*(void *)(*((void *)&v21 + 1) + 8 * i)] forKey:*(void *)(*((void *)&v21 + 1) + 8 * i)];
        }
        uint64_t v14 = [(NSMutableDictionary *)properties countByEnumeratingWithState:&v21 objects:v27 count:16];
      }
      while (v14);
    }

    self->_properties = 0;
    uint64_t v17 = [MEMORY[0x1E4F1CAC0] currentRunLoop];
    uint64_t v18 = *MEMORY[0x1E4F1C3A0];
    [(NSInputStream *)self->_rStream scheduleInRunLoop:v17 forMode:*MEMORY[0x1E4F1C3A0]];
    [(NSOutputStream *)self->_wStream scheduleInRunLoop:v17 forMode:v18];
    [(NSInputStream *)self->_rStream open];
    [(NSOutputStream *)self->_wStream open];
  }
  else
  {
    uint64_t v19 = [(MFStream *)self methodSignatureForSelector:a2];
    id v20 = (void *)[MEMORY[0x1E4F1CA18] invocationWithMethodSignature:v19];
    [v20 setTarget:self];
    [v20 setSelector:a2];
    [v20 retainArguments];
    [v20 setArgument:&v26 atIndex:2];
    [v20 setArgument:&v25 atIndex:3];
    [v20 performSelector:sel_invoke onThread:v8 withObject:0 waitUntilDone:0];
  }
}

- (void)_createPairWithSocketToHostName:(id)a3 port:(int64_t)a4
{
}

- (void)_closeAndReleaseStream:(id)a3 logMessage:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    [a3 setDelegate:0];
    uint64_t v7 = [MEMORY[0x1E4F1CAC0] currentRunLoop];
    [a3 removeFromRunLoop:v7 forMode:*MEMORY[0x1E4F1C3A0]];
    [a3 close];

    if (a4)
    {
      uint64_t v8 = MFLogGeneral();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134218242;
        uint64_t v13 = self;
        __int16 v14 = 2112;
        id v15 = a4;
        _os_log_impl(&dword_1CFCFE000, v8, OS_LOG_TYPE_INFO, "#Streams (%p) %@", buf, 0x16u);
      }
    }
    if (!self->_rStream && !self->_wStream)
    {
      v9 = MFLogGeneral();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v13 = self;
        _os_log_impl(&dword_1CFCFE000, v9, OS_LOG_TYPE_INFO, "#Streams (%p) has closed", buf, 0xCu);
      }
      v10[0] = @"stream";
      v11[0] = objc_msgSend(NSString, "stringWithFormat:", @"%p", self);
      v10[1] = @"rx";
      v11[1] = [NSNumber numberWithUnsignedInteger:self->_bytesRead];
      v10[2] = @"tx";
      v11[2] = [NSNumber numberWithUnsignedInteger:self->_bytesWritten];
      +[MFPowerController powerlog:eventData:](MFPowerController, "powerlog:eventData:", @"StreamClose", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:3]);
    }
  }
}

- (int64_t)read:(char *)a3 maxLength:(unint64_t)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  unint64_t v29 = a4;
  v30 = a3;
  uint64_t v8 = (void *)[(id)objc_opt_class() networkThread];
  if (objc_msgSend(v8, "isEqual:", objc_msgSend(MEMORY[0x1E4F29060], "currentThread")))
  {
    unint64_t length = self->_length;
    if (length)
    {
      if (a4 >= length) {
        unint64_t v10 = self->_length;
      }
      else {
        unint64_t v10 = a4;
      }
      memmove(a3, self->_buffer, v10);
      buffer = self->_buffer;
      unint64_t v12 = self->_length - v10;
      self->_unint64_t length = v12;
      memmove(buffer, &buffer[v10], v12);
      uint64_t v13 = MFLogGeneral();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        -[MFStream read:maxLength:]();
      }
      self->_bytesRead += v10;
      self->_dispatchedBytesAvailable = 0;
      if (!self->_streamCanRead)
      {
        if (self->_length)
        {
          uint64_t v17 = MFLogGeneral();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
            -[MFStream read:maxLength:]();
          }
          self->_dispatchedBytesAvailable = 1;
          location = self->_location;
          v28[0] = MEMORY[0x1E4F143A8];
          v28[1] = 3221225472;
          v28[2] = __27__MFStream_read_maxLength___block_invoke;
          void v28[3] = &unk_1E68661B8;
          v28[4] = self;
          uint64_t v19 = v28;
        }
        else
        {
          if ([(MFStream *)self isOpen]) {
            return v10;
          }
          if (self->_error) {
            id v20 = @"MFStreamEventErrorOccurred";
          }
          else {
            id v20 = @"MFStreamEventEndEncountered";
          }
          long long v21 = MFLogGeneral();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            error = self->_error;
            if (error) {
              long long v24 = @" error: ";
            }
            else {
              long long v24 = &stru_1F265CF90;
            }
            uint64_t v25 = [(NSError *)error ef_publicDescription];
            *(_DWORD *)buf = 134218754;
            if (v25) {
              id v26 = (__CFString *)v25;
            }
            else {
              id v26 = &stru_1F265CF90;
            }
            *(void *)&uint8_t buf[4] = self;
            __int16 v32 = 2112;
            id v33 = v20;
            __int16 v34 = 2112;
            int64_t v35 = v24;
            __int16 v36 = 2114;
            v37 = v26;
            _os_log_error_impl(&dword_1CFCFE000, v21, OS_LOG_TYPE_ERROR, "#Streams (%p) dispatching %@%@%{public}@", buf, 0x2Au);
          }
          location = self->_location;
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __27__MFStream_read_maxLength___block_invoke_60;
          block[3] = &unk_1E68661E0;
          block[4] = self;
          block[5] = v20;
          uint64_t v19 = block;
        }
        dispatch_async(location, v19);
        return v10;
      }
      [(MFStream *)self _readBytesFromStream];
    }
    else
    {
      return -1;
    }
  }
  else
  {
    *(void *)buf = 0;
    __int16 v14 = (void *)MEMORY[0x1D25DDB40]();
    uint64_t v15 = [(MFStream *)self methodSignatureForSelector:a2];
    uint64_t v16 = (void *)[MEMORY[0x1E4F1CA18] invocationWithMethodSignature:v15];
    [v16 setTarget:self];
    [v16 setSelector:a2];
    [v16 setArgument:&v30 atIndex:2];
    [v16 setArgument:&v29 atIndex:3];
    [v16 performSelector:sel_invoke onThread:v8 withObject:0 waitUntilDone:1];
    [v16 getReturnValue:buf];
    return *(void *)buf;
  }
  return v10;
}

uint64_t __27__MFStream_read_maxLength___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 32) + 16))();
}

uint64_t __27__MFStream_read_maxLength___block_invoke_60(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 32) + 16))();
}

- (int64_t)write:(const char *)a3 maxLength:(unint64_t)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  unint64_t v26 = a4;
  uint64_t v27 = a3;
  uint64_t v8 = (void *)[(id)objc_opt_class() networkThread];
  if (objc_msgSend(v8, "isEqual:", objc_msgSend(MEMORY[0x1E4F29060], "currentThread")))
  {
    wStream = self->_wStream;
    if (wStream)
    {
      if (!self->_streamCanWrite) {
        -[MFStream write:maxLength:]();
      }
      self->_streamCanWrite = 0;
      int64_t v10 = [(NSOutputStream *)wStream write:a3 maxLength:a4];
      v11 = MFLogGeneral();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        -[MFStream write:maxLength:]();
      }
      self->_bytesWritten += v10;
      if (v10 < 0)
      {
        unint64_t v12 = self->_wStream;
        self->_wStream = 0;
        if (!self->_error) {
          self->_error = (NSError *)(id)[(NSOutputStream *)v12 streamError];
        }
        [(MFStream *)self _closeAndReleaseStream:v12 logMessage:@"closed the write half"];
        if (![(MFStream *)self isOpen])
        {
          if (self->_error) {
            uint64_t v13 = @"MFStreamEventErrorOccurred";
          }
          else {
            uint64_t v13 = @"MFStreamEventEndEncountered";
          }
          __int16 v14 = MFLogGeneral();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            error = self->_error;
            if (error) {
              long long v22 = @" error: ";
            }
            else {
              long long v22 = &stru_1F265CF90;
            }
            uint64_t v23 = [(NSError *)error ef_publicDescription];
            *(_DWORD *)buf = 134218754;
            if (v23) {
              long long v24 = (__CFString *)v23;
            }
            else {
              long long v24 = &stru_1F265CF90;
            }
            *(void *)&uint8_t buf[4] = self;
            __int16 v29 = 2112;
            unint64_t v30 = (unint64_t)v13;
            __int16 v31 = 2112;
            __int16 v32 = v22;
            __int16 v33 = 2114;
            __int16 v34 = v24;
            _os_log_error_impl(&dword_1CFCFE000, v14, OS_LOG_TYPE_ERROR, "#Streams (%p) dispatching %@%@%{public}@", buf, 0x2Au);
          }
          location = self->_location;
          v25[0] = MEMORY[0x1E4F143A8];
          v25[1] = 3221225472;
          v25[2] = __28__MFStream_write_maxLength___block_invoke;
          v25[3] = &unk_1E68661E0;
          v25[4] = self;
          v25[5] = v13;
          dispatch_async(location, v25);
        }
      }
    }
    else
    {
      uint64_t v19 = MFLogGeneral();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134218240;
        *(void *)&uint8_t buf[4] = self;
        __int16 v29 = 2048;
        unint64_t v30 = a4;
        _os_log_impl(&dword_1CFCFE000, v19, OS_LOG_TYPE_INFO, "#Streams (%p) no longer has an open write stream, aborting write of %lu bytes", buf, 0x16u);
      }
      return -1;
    }
  }
  else
  {
    *(void *)buf = 0;
    uint64_t v16 = (void *)MEMORY[0x1D25DDB40]();
    uint64_t v17 = [(MFStream *)self methodSignatureForSelector:a2];
    uint64_t v18 = (void *)[MEMORY[0x1E4F1CA18] invocationWithMethodSignature:v17];
    [v18 setTarget:self];
    [v18 setSelector:a2];
    [v18 setArgument:&v27 atIndex:2];
    [v18 setArgument:&v26 atIndex:3];
    [v18 performSelector:sel_invoke onThread:v8 withObject:0 waitUntilDone:1];
    [v18 getReturnValue:buf];
    return *(void *)buf;
  }
  return v10;
}

uint64_t __28__MFStream_write_maxLength___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 32) + 16))();
}

- (void)close
{
  uint64_t v4 = (void *)[(id)objc_opt_class() networkThread];
  if (objc_msgSend(v4, "isEqual:", objc_msgSend(MEMORY[0x1E4F29060], "currentThread")))
  {
    *(_WORD *)&self->_streamCanRead = 0;
    rStream = self->_rStream;
    self->_rStream = 0;
    if (!self->_error) {
      self->_error = (NSError *)(id)[(NSInputStream *)rStream streamError];
    }
    [(MFStream *)self _closeAndReleaseStream:rStream logMessage:0];
    wStream = self->_wStream;
    self->_wStream = 0;
    if (!self->_error) {
      self->_error = (NSError *)(id)[(NSOutputStream *)wStream streamError];
    }
    [(MFStream *)self _closeAndReleaseStream:wStream logMessage:0];
    free(self->_buffer);
    self->_capacity = 0;
    self->_unint64_t length = 0;
    self->_buffer = 0;
  }
  else
  {
    uint64_t v7 = [(MFStream *)self methodSignatureForSelector:a2];
    uint64_t v8 = (void *)[MEMORY[0x1E4F1CA18] invocationWithMethodSignature:v7];
    [v8 setTarget:self];
    [v8 setSelector:a2];
    [v8 performSelector:sel_invoke onThread:v4 withObject:0 waitUntilDone:1];
  }
}

- (void)_readBytesFromStream
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_1CFCFE000, v0, v1, "#Streams (%p) bumped the buffer to %ld bytes", v2, v3);
}

uint64_t __32__MFStream__readBytesFromStream__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 32) + 16))();
}

uint64_t __32__MFStream__readBytesFromStream__block_invoke_68(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 32) + 16))();
}

- (void)stream:(id)a3 handleEvent:(unint64_t)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  p_rStream = &self->_rStream;
  rStream = self->_rStream;
  if (rStream == a3 || self->_wStream == a3)
  {
    *((void *)&v8 + 1) = a4;
    *(void *)&long long v8 = a4 - 2;
    switch((unint64_t)(v8 >> 1))
    {
      case 0uLL:
        if (rStream != a3) {
          -[MFStream stream:handleEvent:]();
        }
        self->_streamCanRead = 1;
        [(MFStream *)self _readBytesFromStream];
        return;
      case 1uLL:
        self->_streamCanWrite = 1;
        v9 = MFLogGeneral();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
          -[MFStream stream:handleEvent:]();
        }
        location = self->_location;
        v22[0] = MEMORY[0x1E4F143A8];
        v22[1] = 3221225472;
        v22[2] = __31__MFStream_stream_handleEvent___block_invoke;
        v22[3] = &unk_1E68661B8;
        v22[4] = self;
        v11 = v22;
        goto LABEL_25;
      case 3uLL:
        if (!self->_error) {
          self->_error = (NSError *)(id)[a3 streamError];
        }
        goto LABEL_13;
      case 7uLL:
LABEL_13:
        if (rStream == a3)
        {
          self->_streamCanRead = 0;
          unint64_t v12 = @"read";
        }
        else
        {
          self->_streamCanWrite = 0;
          p_rStream = &self->_wStream;
          unint64_t v12 = @"write";
        }
        void *p_rStream = 0;
        uint64_t v13 = @"error: ";
        if (self->_error)
        {
          error = self->_error;
        }
        else
        {
          uint64_t v13 = @"ended";
          error = (NSError *)&stru_1F265CF90;
        }
        -[MFStream _closeAndReleaseStream:logMessage:](self, "_closeAndReleaseStream:logMessage:", a3, [NSString stringWithFormat:@"%@ stream %@%@", v12, v13, error]);
        if (![(MFStream *)self isOpen])
        {
          if (self->_error) {
            uint64_t v15 = @"MFStreamEventErrorOccurred";
          }
          else {
            uint64_t v15 = @"MFStreamEventEndEncountered";
          }
          uint64_t v16 = MFLogGeneral();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            uint64_t v17 = self->_error;
            if (v17) {
              uint64_t v18 = @" error: ";
            }
            else {
              uint64_t v18 = &stru_1F265CF90;
            }
            uint64_t v19 = [(NSError *)v17 ef_publicDescription];
            *(_DWORD *)buf = 134218754;
            if (v19) {
              id v20 = (__CFString *)v19;
            }
            else {
              id v20 = &stru_1F265CF90;
            }
            long long v24 = self;
            __int16 v25 = 2112;
            unint64_t v26 = v15;
            __int16 v27 = 2112;
            v28 = v18;
            __int16 v29 = 2114;
            unint64_t v30 = v20;
            _os_log_error_impl(&dword_1CFCFE000, v16, OS_LOG_TYPE_ERROR, "#Streams (%p) dispatching %@%@%{public}@", buf, 0x2Au);
          }
          location = self->_location;
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __31__MFStream_stream_handleEvent___block_invoke_85;
          block[3] = &unk_1E68661E0;
          block[4] = self;
          block[5] = v15;
          v11 = block;
LABEL_25:
          dispatch_async(location, v11);
        }
        break;
      default:
        return;
    }
  }
}

uint64_t __31__MFStream_stream_handleEvent___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 32) + 16))();
}

uint64_t __31__MFStream_stream_handleEvent___block_invoke_85(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 32) + 16))();
}

- (NSError)streamError
{
  return self->_error;
}

- (void)setProperty:forKey:.cold.1()
{
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_1(&dword_1CFCFE000, v0, v1, "#Streams (%p) set property %@");
}

- (void)openToHostName:port:.cold.1()
{
  __assert_rtn("-[MFStream openToHostName:port:]", "_NSSocket.m", 387, "(nil == _rStream) && (nil == _wStream)");
}

- (void)read:maxLength:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_1CFCFE000, v0, v1, "#Streams (%p) dispatching MFStreamEventHasBytesAvailable (%ld)", v2, v3);
}

- (void)read:maxLength:.cold.2()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1CFCFE000, v0, v1, "#Streams (%p) read %lu bytes", v2, v3);
}

- (void)write:maxLength:.cold.1()
{
}

- (void)write:maxLength:.cold.2()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1CFCFE000, v0, v1, "#Streams (%p) wrote %ld bytes", v2, v3);
}

- (void)stream:handleEvent:.cold.1()
{
}

- (void)stream:handleEvent:.cold.2()
{
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_10(&dword_1CFCFE000, v0, v1, "#Streams (%p) dispatching MFStreamEventCanAcceptBytes", v2, v3, v4, v5, v6);
}

@end