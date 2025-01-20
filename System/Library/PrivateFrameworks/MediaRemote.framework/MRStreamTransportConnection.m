@interface MRStreamTransportConnection
- (BOOL)isValid;
- (MRStreamTransportConnection)initWithInputStream:(id)a3 outputStream:(id)a4;
- (id)runLoop;
- (unint64_t)sendTransportData:(id)a3 options:(id)a4;
- (void)_closeAllStreams;
- (void)_closeStream:(id)a3;
- (void)_openStream:(id)a3;
- (void)_setQOSPropertiesOnStream:(id)a3;
- (void)_stream:(id)a3 handleEvent:(unint64_t)a4;
- (void)stream:(id)a3 handleEvent:(unint64_t)a4;
@end

@implementation MRStreamTransportConnection

- (MRStreamTransportConnection)initWithInputStream:(id)a3 outputStream:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MRStreamTransportConnection;
  v9 = [(MRExternalDeviceTransportConnection *)&v14 init];
  if (v9)
  {
    uint64_t v10 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
    runLoop = v9->_runLoop;
    v9->_runLoop = (NSRunLoop *)v10;

    objc_storeStrong((id *)&v9->_inputStream, a3);
    objc_storeStrong((id *)&v9->_outputStream, a4);
    [(MRStreamTransportConnection *)v9 _openStream:v9->_inputStream];
    uint64_t v12 = *MEMORY[0x1E4F1C4B0];
    [(NSInputStream *)v9->_inputStream scheduleInRunLoop:v9->_runLoop forMode:*MEMORY[0x1E4F1C4B0]];
    [(MRStreamTransportConnection *)v9 _openStream:v9->_outputStream];
    [(NSOutputStream *)v9->_outputStream scheduleInRunLoop:v9->_runLoop forMode:v12];
  }

  return v9;
}

- (BOOL)isValid
{
  return (unint64_t)([(NSInputStream *)self->_inputStream streamStatus] - 1) <= 3
      && (unint64_t)([(NSOutputStream *)self->_outputStream streamStatus] - 1) < 4;
}

- (id)runLoop
{
  return self->_runLoop;
}

- (unint64_t)sendTransportData:(id)a3 options:(id)a4
{
  id v5 = a3;
  outputStream = self->_outputStream;
  id v7 = v5;
  int64_t v8 = -[NSOutputStream write:maxLength:](outputStream, "write:maxLength:", [v7 bytes], objc_msgSend(v7, "length"));
  if (v8 >= 1 && [v7 length] - v8 >= 1)
  {
    do
    {
      v9 = [v7 subdataWithRange:v8];

      uint64_t v10 = self->_outputStream;
      id v7 = v9;
      int64_t v8 = -[NSOutputStream write:maxLength:](v10, "write:maxLength:", [v7 bytes], objc_msgSend(v7, "length"));
    }
    while ((v8 & 0x8000000000000000) == 0 && [v7 length] - v8 > 0);
  }

  return v8;
}

- (void)stream:(id)a3 handleEvent:(unint64_t)a4
{
  id v7 = a3;
  v6 = (void *)MEMORY[0x199718E70]();
  [(MRStreamTransportConnection *)self _stream:v7 handleEvent:a4];
}

- (void)_stream:(id)a3 handleEvent:(unint64_t)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = v6;
  switch(a4)
  {
    case 1uLL:
      [(MRStreamTransportConnection *)self _setQOSPropertiesOnStream:v6];
      break;
    case 2uLL:
      id v10 = v6;
      *(void *)buf = 0;
      uint64_t v32 = 0;
      char v11 = [v10 getBuffer:&v32 length:buf];
      if (v32) {
        char v12 = v11;
      }
      else {
        char v12 = 0;
      }
      if ((v12 & 1) == 0) {
        *(void *)buf = 1024;
      }
      id v13 = objc_alloc(MEMORY[0x1E4F1CA58]);
      objc_super v14 = (void *)[v13 initWithCapacity:*(void *)buf];
      if ([v10 hasBytesAvailable])
      {
        do
        {
          uint64_t v15 = [v14 length];
          [v14 increaseLengthBy:*(void *)buf];
          id v16 = v14;
          uint64_t v17 = [v16 mutableBytes];
          unint64_t v18 = [v10 read:v17 + v15 maxLength:*(void *)buf];
          if (v18 < *(void *)buf) {
            objc_msgSend(v16, "setLength:", v18 - *(void *)buf + objc_msgSend(v16, "length"));
          }
        }
        while (([v10 hasBytesAvailable] & 1) != 0);
      }
      if ([v14 length])
      {
        objc_initWeak(&location, self);
        runLoop = self->_runLoop;
        v28[0] = MEMORY[0x1E4F143A8];
        v28[1] = 3221225472;
        v28[2] = __51__MRStreamTransportConnection__stream_handleEvent___block_invoke;
        v28[3] = &unk_1E57D12A8;
        objc_copyWeak(&v30, &location);
        id v29 = v14;
        [(NSRunLoop *)runLoop performBlock:v28];

        objc_destroyWeak(&v30);
        objc_destroyWeak(&location);
      }

      break;
    case 3uLL:
    case 5uLL:
    case 6uLL:
    case 7uLL:
      break;
    case 4uLL:
      objc_initWeak((id *)buf, self);
      v20 = self->_runLoop;
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __51__MRStreamTransportConnection__stream_handleEvent___block_invoke_2;
      v26[3] = &unk_1E57D12D0;
      objc_copyWeak(&v27, (id *)buf);
      [(NSRunLoop *)v20 performBlock:v26];
      objc_destroyWeak(&v27);
      objc_destroyWeak((id *)buf);
      break;
    case 8uLL:
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      v22 = @"OutputStream";
      if (isKindOfClass) {
        v22 = @"InputStream";
      }
      v23 = v22;
      v24 = [v7 streamError];
      v25 = _MRLogForCategory(4uLL);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543874;
        *(void *)&buf[4] = self;
        __int16 v34 = 2112;
        v35 = v23;
        __int16 v36 = 2112;
        v37 = v24;
        _os_log_impl(&dword_194F3C000, v25, OS_LOG_TYPE_DEFAULT, "[MRNetServiceTransport] %{public}@ %@ Error: %@. Disconnecting...", buf, 0x20u);
      }

      [(MRExternalDeviceTransportConnection *)self _notifyDelegateDidCloseWithError:v24];
      break;
    default:
      if (a4 == 16)
      {
        int64_t v8 = _MRLogForCategory(4uLL);
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          *(void *)&buf[4] = self;
          _os_log_impl(&dword_194F3C000, v8, OS_LOG_TYPE_DEFAULT, "[MRNetServiceTransport] %{public}@ Stream ended. Disconnecting...", buf, 0xCu);
        }

        v9 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithMRError:121];
        [(MRExternalDeviceTransportConnection *)self _notifyDelegateDidCloseWithError:v9];
      }
      break;
  }
}

void __51__MRStreamTransportConnection__stream_handleEvent___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x199718E70]();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _notifyDelegateDidReceiveData:*(void *)(a1 + 32)];
}

void __51__MRStreamTransportConnection__stream_handleEvent___block_invoke_2(uint64_t a1)
{
  v2 = (void *)MEMORY[0x199718E70]();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _notifyDelegateHasSpaceAvailable];
}

- (void)_openStream:(id)a3
{
  id v7 = a3;
  v4 = +[MRUserSettings currentSettings];
  uint64_t v5 = [v4 useNoDelayOptionForExternalDeviceSockets];

  id v6 = [NSNumber numberWithBool:v5];
  [v7 setProperty:v6 forKey:*MEMORY[0x1E4F18F20]];

  [v7 setProperty:MEMORY[0x1E4F1CC38] forKey:*MEMORY[0x1E4F190E8]];
  [v7 setDelegate:self];
  [v7 scheduleInRunLoop:self->_runLoop forMode:*MEMORY[0x1E4F1C3A0]];
  [v7 open];
}

- (void)_closeStream:(id)a3
{
  id v4 = a3;
  [v4 close];
  [v4 setDelegate:0];
  [v4 removeFromRunLoop:self->_runLoop forMode:*MEMORY[0x1E4F1C3A0]];
}

- (void)_closeAllStreams
{
  [(MRStreamTransportConnection *)self _closeStream:self->_inputStream];
  outputStream = self->_outputStream;

  [(MRStreamTransportConnection *)self _closeStream:outputStream];
}

- (void)_setQOSPropertiesOnStream:(id)a3
{
  v3 = (__CFReadStream *)a3;
  *(_DWORD *)buffer = 0;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    CFDataRef v4 = (const __CFData *)CFReadStreamCopyProperty(v3, (CFStreamPropertyKey)*MEMORY[0x1E4F1D488]);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_9:
      id v7 = v3;
LABEL_12:

      goto LABEL_13;
    }
    CFDataRef v4 = (const __CFData *)CFWriteStreamCopyProperty(v3, (CFStreamPropertyKey)*MEMORY[0x1E4F1D488]);
  }
  CFDataRef v5 = v4;
  if (!v4) {
    goto LABEL_9;
  }
  v11.id location = 0;
  v11.length = 4;
  CFDataGetBytes(v4, v11, buffer);
  CFRelease(v5);
  uint64_t v6 = *(unsigned int *)buffer;

  if (v6)
  {
    id v7 = +[MRUserSettings currentSettings];
    if ([v7 hasExternalDeviceSocketQOSLevelSet]) {
      uint64_t v8 = [v7 externalDeviceSocketQOSLevel];
    }
    else {
      uint64_t v8 = 3;
    }
    v9 = (void (*)(uint64_t, uint64_t))MSVWeakLinkSymbol();
    v9(v6, v8);
    goto LABEL_12;
  }
LABEL_13:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_runLoop, 0);
  objc_storeStrong((id *)&self->_outputStream, 0);

  objc_storeStrong((id *)&self->_inputStream, 0);
}

@end