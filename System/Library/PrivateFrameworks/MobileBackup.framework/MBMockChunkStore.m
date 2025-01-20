@interface MBMockChunkStore
- (BOOL)getBatch:(id)a3 error:(id *)a4;
- (BOOL)isOpen;
- (BOOL)poison;
- (BOOL)putBatch:(id)a3 error:(id *)a4;
- (BOOL)registerItem:(id)a3 error:(id *)a4;
- (MBMockChunkStore)initWithAccount:(id)a3;
- (id)_URLForItem:(id)a3;
- (id)_dataForItem:(id)a3;
- (void)close;
- (void)dealloc;
- (void)open;
- (void)setPoison:(BOOL)a3;
@end

@implementation MBMockChunkStore

- (MBMockChunkStore)initWithAccount:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)MBMockChunkStore;
  v4 = [(MBChunkStore *)&v8 init];
  if (v4)
  {
    v4->_serviceAccount = (MBServiceAccount *)a3;
    v5 = (objc_class *)objc_opt_class();
    Name = class_getName(v5);
    v4->_queue = (OS_dispatch_queue *)dispatch_queue_create(Name, 0);
  }
  return v4;
}

- (void)dealloc
{
  dispatch_release((dispatch_object_t)self->_queue);
  v3.receiver = self;
  v3.super_class = (Class)MBMockChunkStore;
  [(MBChunkStore *)&v3 dealloc];
}

- (BOOL)isOpen
{
  return self->_signaturesByItemID != 0;
}

- (void)open
{
  if ([(MBMockChunkStore *)self isOpen]) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:self file:@"MBMockChunkStore.m" lineNumber:51 description:@"Already open"];
  }
  self->_signaturesByItemID = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  self->_nextItemID = 1;
}

- (void)close
{
  self->_signaturesByItemID = 0;
  self->_nextItemID = 0;
}

- (id)_dataForItem:(id)a3
{
  id v5 = objc_alloc((Class)NSURL);
  id v6 = [a3 temporaryPath];
  if (!v6) {
    id v6 = [a3 path];
  }
  id v7 = [v5 initFileURLWithPath:v6];
  objc_super v8 = +[NSMutableData dataWithContentsOfURL:v7 options:8 error:0];

  if (v8 && self->_poison)
  {
    v9 = MBGetDefaultLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      id v15 = [a3 path];
      __int16 v16 = 2112;
      id v17 = [a3 fileID];
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Poisoning item: %@ (%@)", buf, 0x16u);
      id v12 = [a3 path];
      id v13 = [a3 fileID];
      _MBLog();
    }
    if ([(NSMutableData *)v8 length] >= 2)
    {
      unint64_t v10 = 1;
      do
      {
        buf[0] = 0;
        -[NSMutableData getBytes:range:](v8, "getBytes:range:", buf, v10, 1);
        buf[0] = ~buf[0];
        -[NSMutableData replaceBytesInRange:withBytes:](v8, "replaceBytesInRange:withBytes:", v10++, 1, buf);
      }
      while (v10 < [(NSMutableData *)v8 length]);
    }
  }
  return v8;
}

- (BOOL)registerItem:(id)a3 error:(id *)a4
{
  if (![(MBMockChunkStore *)self isOpen]) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:self file:@"MBMockChunkStore.m" lineNumber:90 description:@"Closed"];
  }
  id v8 = objc_alloc_init((Class)NSAutoreleasePool);
  v9 = MBGetDefaultLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = [a3 path];
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = [a3 fileID];
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Registering item with chunk store: %@ (%@)", buf, 0x16u);
    id v17 = [a3 path];
    id v18 = [a3 fileID];
    _MBLog();
  }
  if (objc_msgSend(a3, "itemID", v17, v18))
  {
    if (a4)
    {
      unint64_t v10 = +[MBError errorWithCode:3 format:@"Item already registered"];
LABEL_8:
      v11 = v10;
      BOOL result = 0;
      *a4 = v11;
      return result;
    }
  }
  else
  {
    id v13 = [(MBMockChunkStore *)self _dataForItem:a3];
    v14 = v13;
    if (v13)
    {
      if ([v13 length])
      {
        id v15 = +[MBDigest sha256ForData:v14];
        *(void *)buf = 0;
        *(void *)&buf[8] = buf;
        *(void *)&buf[16] = 0x2020000000;
        uint64_t v21 = 0;
        queue = self->_queue;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_10020FE44;
        block[3] = &unk_100416978;
        block[6] = buf;
        block[7] = a2;
        block[4] = self;
        block[5] = v15;
        dispatch_sync(queue, block);
        [a3 setItemID:*(void *)(*(void *)&buf[8] + 24)];
        [a3 setSignature:v15];
        objc_msgSend(a3, "setSize:", objc_msgSend(v14, "length"));
        [v8 drain];
        _Block_object_dispose(buf, 8);
        return 1;
      }
      if (a4)
      {
        unint64_t v10 = +[MBError errorWithCode:path:format:](MBError, "errorWithCode:path:format:", 401, [a3 path], @"File is empty");
        goto LABEL_8;
      }
    }
    else if (a4)
    {
      unint64_t v10 = (MBError *)+[MBError errorForNSError:path:format:](MBError, "errorForNSError:path:format:", 0, [a3 path], @"File not found");
      goto LABEL_8;
    }
  }
  return 0;
}

- (id)_URLForItem:(id)a3
{
  if (![a3 authToken]) {
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"MBMockChunkStore.m", 132, @"Item not assigned auth-token: %@", [a3 authToken]);
  }
  id v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"mbs/%@/authToken/%@", -[MBServiceAccount dsid](self->_serviceAccount, "dsid"), [a3 authToken]);
  id v7 = [(MBServiceAccount *)self->_serviceAccount serviceURL];
  return [(NSURL *)v7 URLByAppendingPathComponent:v6];
}

- (BOOL)getBatch:(id)a3 error:(id *)a4
{
  if (![(MBMockChunkStore *)self isOpen]) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:self file:@"MBMockChunkStore.m" lineNumber:138 description:@"Closed"];
  }
  if (MBShouldInjectError())
  {
    if (a4)
    {
      CFStringRef v8 = @"Simulated error before getting items from chunk store";
LABEL_26:
      uint64_t v21 = +[MBError errorWithCode:1 format:v8];
      BOOL result = 0;
      *a4 = v21;
      return result;
    }
    return 0;
  }
  v25 = a4;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v9 = [a3 items];
  id v10 = [v9 countByEnumeratingWithState:&v27 objects:v34 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v28;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v28 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        uint64_t v26 = 0;
        id v15 = objc_alloc_init((Class)NSAutoreleasePool);
        __int16 v16 = MBGetDefaultLog();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          id v17 = [v14 path];
          id v18 = [v14 fileID];
          *(_DWORD *)buf = 138412546;
          *(void *)&uint8_t buf[4] = v17;
          __int16 v32 = 2112;
          id v33 = v18;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Getting item from chunk store: %@ (%@)", buf, 0x16u);
          id v23 = [v14 path];
          id v24 = [v14 fileID];
          _MBLog();
        }
        if (objc_msgSend(v14, "authToken", v23, v24))
        {
          if (MBShouldInjectError())
          {
            objc_msgSend(v14, "setError:", +[MBError errorWithCode:path:format:](MBError, "errorWithCode:path:format:", 1, objc_msgSend(v14, "path"), @"Simulated error getting item from chunk store"));
            [(MBChunkStoreProgressModel *)[(MBChunkStore *)self progressModel] failedToTransferItem:v14];
          }
          else
          {
            v19 = +[MBURLRequest requestWithURL:[(MBMockChunkStore *)self _URLForItem:v14]];
            [(MBURLRequest *)v19 setValue:@"2.2" forHeader:@"X-Apple-MBS-Protocol-Version"];
            *(void *)buf = 0;
            id v20 = +[MBURLConnection sendSyncRequest:v19 properties:0 connection:0 response:buf error:&v26];
            objc_msgSend(v14, "setError:", +[MBError errorForHTTPURLResponse:error:](MBError, "errorForHTTPURLResponse:error:", *(void *)buf, v26));
            if ((objc_msgSend(v20, "writeToFile:options:error:", objc_msgSend(v14, "path"), 1, &v26) & 1) == 0) {
              objc_msgSend(v14, "setError:", +[MBError errorForNSError:path:format:](MBError, "errorForNSError:path:format:", v26, objc_msgSend(v14, "path"), @"Error writing to item file"));
            }
            [(MBChunkStoreProgressModel *)[(MBChunkStore *)self progressModel] updatingProgress:v14 forItem:1.0];
            [v14 setProgress:1.0];
          }
          [v15 drain];
        }
        else
        {
          objc_msgSend(v14, "setError:", +[MBError errorWithCode:path:format:](MBError, "errorWithCode:path:format:", 1, objc_msgSend(v14, "path"), @"Item not assigned auth-token"));
          [(MBChunkStoreProgressModel *)[(MBChunkStore *)self progressModel] failedToTransferItem:v14];
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v27 objects:v34 count:16];
    }
    while (v11);
  }
  if (MBShouldInjectError())
  {
    a4 = v25;
    if (v25)
    {
      CFStringRef v8 = @"Simulated error after getting items from chunk store";
      goto LABEL_26;
    }
    return 0;
  }
  return 1;
}

- (BOOL)putBatch:(id)a3 error:(id *)a4
{
  if (![(MBMockChunkStore *)self isOpen]) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:self file:@"MBMockChunkStore.m" lineNumber:193 description:@"Closed"];
  }
  if (MBShouldInjectError())
  {
    if (a4)
    {
      CFStringRef v8 = +[MBError errorWithCode:1 format:@"Simulated error before putting items into chunk store"];
      goto LABEL_43;
    }
    return 0;
  }
  id v33 = a4;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v9 = [a3 items];
  id v10 = [v9 countByEnumeratingWithState:&v37 objects:v45 count:16];
  if (!v10) {
    goto LABEL_40;
  }
  uint64_t v11 = *(void *)v38;
  do
  {
    uint64_t v12 = 0;
    do
    {
      if (*(void *)v38 != v11) {
        objc_enumerationMutation(v9);
      }
      id v13 = *(void **)(*((void *)&v37 + 1) + 8 * (void)v12);
      uint64_t v36 = 0;
      id v14 = objc_alloc_init((Class)NSAutoreleasePool);
      id v15 = MBGetDefaultLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        id v16 = [v13 path];
        id v17 = [v13 fileID];
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v16;
        *(_WORD *)&unsigned char buf[12] = 2112;
        *(void *)&buf[14] = v17;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Putting item into chunk store: %@ (%@)", buf, 0x16u);
        id v31 = [v13 path];
        id v32 = [v13 fileID];
        _MBLog();
      }
      if (MBShouldInjectError())
      {
        objc_msgSend(v13, "setError:", +[MBError errorWithCode:path:format:](MBError, "errorWithCode:path:format:", 1, objc_msgSend(v13, "path"), @"Simulated error putting item into chunk store"));
        [v14 drain];
        goto LABEL_31;
      }
      if (![v13 itemID] || !objc_msgSend(v13, "signature"))
      {
        objc_msgSend(v13, "setError:", +[MBError errorWithCode:path:format:](MBError, "errorWithCode:path:format:", 1, objc_msgSend(v13, "path", v31, v32), @"Item not registered"));
        [v14 drain];
        goto LABEL_31;
      }
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3052000000;
      v42 = sub_100210A88;
      queue = self->_queue;
      v43 = sub_100210A98;
      uint64_t v44 = 0;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100210AA4;
      block[3] = &unk_1004169A0;
      block[5] = self;
      block[6] = buf;
      block[4] = v13;
      dispatch_sync(queue, block);
      if (!*(void *)(*(void *)&buf[8] + 40))
      {
        id v23 = [v13 path];
        CFStringRef v24 = @"Item registration not found";
LABEL_29:
        objc_msgSend(v13, "setError:", +[MBError errorWithCode:path:format:](MBError, "errorWithCode:path:format:", 1, v23, v24, v31, v32));
        [(MBChunkStoreProgressModel *)[(MBChunkStore *)self progressModel] failedToTransferItem:v13];
        [v14 drain];
        goto LABEL_30;
      }
      id v19 = [v13 signature];
      if (([v19 isEqualToData:*(void *)(*(void *)&buf[8] + 40)] & 1) == 0)
      {
        id v23 = [v13 path];
        CFStringRef v24 = @"Item signature doesn't match registration";
        goto LABEL_29;
      }
      id v20 = [(MBMockChunkStore *)self _dataForItem:v13];
      if (v20)
      {
        id v21 = +[MBDigest sha256ForData:v20];
        if (v21)
        {
          if ([v21 isEqualToData:*(void *)(*(void *)&buf[8] + 40)])
          {
            if ([v13 authToken])
            {
              v22 = +[MBURLRequest requestWithMethod:@"POST" URL:[(MBMockChunkStore *)self _URLForItem:v13]];
              [(MBURLRequest *)v22 setData:v20];
              [(MBURLRequest *)v22 setValue:@"2.2" forHeader:@"X-Apple-MBS-Protocol-Version"];
              uint64_t v34 = 0;
              +[MBURLConnection sendSyncRequest:v22 properties:0 connection:0 response:&v34 error:&v36];
              objc_msgSend(v13, "setError:", +[MBError errorForHTTPURLResponse:error:](MBError, "errorForHTTPURLResponse:error:", v34, v36));
              if (![v13 error])
              {
                MBRandomDataWithLength();
                [v13 setReceipt:MBStringWithData()];
              }
              [(MBChunkStoreProgressModel *)[(MBChunkStore *)self progressModel] updatingProgress:v13 forItem:1.0];
              [v13 setProgress:1.0];
              [v14 drain];
              goto LABEL_30;
            }
            id v26 = [v13 path];
            uint64_t v27 = 1;
            CFStringRef v28 = @"Item not assigned auth-token";
          }
          else
          {
            id v26 = [v13 path];
            uint64_t v27 = 9;
            CFStringRef v28 = @"Item modified between registration and put";
          }
          v25 = +[MBError errorWithCode:path:format:](MBError, "errorWithCode:path:format:", v27, v26, v28, v31, v32);
        }
        else
        {
          v25 = +[MBError errorWithCode:error:path:format:](MBError, "errorWithCode:error:path:format:", 100, v36, [v13 path], @"Error calculating item signature");
        }
        objc_msgSend(v13, "setError:", v25, v31, v32);
        [(MBChunkStoreProgressModel *)[(MBChunkStore *)self progressModel] failedToTransferItem:v13];
        [v14 drain];
      }
      else
      {
        objc_msgSend(v13, "setError:", +[MBError errorWithCode:path:format:](MBError, "errorWithCode:path:format:", 4, objc_msgSend(v13, "path"), @"File not found"));
        [(MBChunkStoreProgressModel *)[(MBChunkStore *)self progressModel] failedToTransferItem:v13];
        [v14 drain];
      }
LABEL_30:
      _Block_object_dispose(buf, 8);
LABEL_31:
      uint64_t v12 = (char *)v12 + 1;
    }
    while (v10 != v12);
    id v29 = [v9 countByEnumeratingWithState:&v37 objects:v45 count:16];
    id v10 = v29;
  }
  while (v29);
LABEL_40:
  if (!MBShouldInjectError()) {
    return 1;
  }
  if (!v33) {
    return 0;
  }
  CFStringRef v8 = +[MBError errorWithCode:1 format:@"Simulated error after putting items into chunk store"];
  a4 = v33;
LABEL_43:
  BOOL result = 0;
  *a4 = v8;
  return result;
}

- (BOOL)poison
{
  return self->_poison;
}

- (void)setPoison:(BOOL)a3
{
  self->_poison = a3;
}

@end