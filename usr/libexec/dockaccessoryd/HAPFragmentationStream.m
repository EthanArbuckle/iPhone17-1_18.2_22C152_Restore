@interface HAPFragmentationStream
+ (id)fragmentationPacketsForData:(id)a3 maxLength:(unint64_t)a4 transactionIdentifier:(unsigned __int16)a5;
- (BOOL)__isTransactionCompleteWithTransactionIdentifier:(unsigned __int16)a3;
- (HAPFragmentationStream)init;
- (HAPFragmentationStreamDelegate)delegate;
- (NSMutableOrderedSet)pendingPackets;
- (NSNumber)currentPacketTransactionIdentifier;
- (OS_dispatch_queue)clientQueue;
- (id)__filteredPacketsWithTransactionIdentifier:(unsigned __int16)a3;
- (id)__transactionDataWithTransactionIdentifier:(unsigned __int16)a3;
- (void)__addFragmentationPacket:(id)a3;
- (void)__removeAllPendingPacketsWithTransactionIdentifier:(unsigned __int16)a3;
- (void)close;
- (void)receivedFragmentedPacket:(id)a3;
- (void)setCurrentPacketTransactionIdentifier:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation HAPFragmentationStream

+ (id)fragmentationPacketsForData:(id)a3 maxLength:(unint64_t)a4 transactionIdentifier:(unsigned __int16)a5
{
  uint64_t v5 = a5;
  id v7 = a3;
  unint64_t v8 = (unint64_t)[v7 length];
  if (a4)
  {
    unint64_t v9 = v8;
    if (v8)
    {
      if (HIDWORD(v8))
      {
        v10 = sub_100083F74();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          v11 = sub_100083FD0(0);
          int v23 = 138543874;
          v24 = v11;
          __int16 v25 = 1024;
          *(_DWORD *)v26 = -1;
          *(_WORD *)&v26[4] = 2048;
          *(void *)&v26[6] = v9;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%{public}@[HAPFragmentationInputStream] Data cannot be larger than %u, is %tu", (uint8_t *)&v23, 0x1Cu);
        }
        goto LABEL_18;
      }
      unint64_t v13 = a4 - 12;
      v10 = +[NSMutableArray arrayWithCapacity:(a4 + v8 - 13) / (a4 - 12)];
      uint64_t v14 = 0;
      uint64_t v15 = 0;
      while (1)
      {
        unint64_t v16 = v9 - v14 >= v13 ? v13 : v9 - v14;
        v17 = [HAPFragmentationPacket alloc];
        v18 = [v7 subdataWithRange:v14, v16];
        v19 = [(HAPFragmentationPacket *)v17 initWithData:v18 transactionIdentifier:v5 length:v9 offset:v15];

        if (!v19) {
          break;
        }
        [v10 addObject:v19];

        uint64_t v14 = (v15 + v13);
        uint64_t v15 = v14;
        if (v14 >= v9)
        {
          v10 = v10;
          v20 = v10;
          goto LABEL_19;
        }
      }
      v12 = sub_100083F74();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v21 = sub_100083FD0(0);
        int v23 = 138543618;
        v24 = v21;
        __int16 v25 = 1024;
        *(_DWORD *)v26 = v15;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%{public}@[HAPFragmentationInputStream] Failed to create packet for remaining data at offset %u", (uint8_t *)&v23, 0x12u);
      }
      goto LABEL_17;
    }
  }
  v10 = sub_100083F74();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    v12 = sub_100083FD0(0);
    int v23 = 138543874;
    v24 = v12;
    __int16 v25 = 2048;
    *(void *)v26 = [v7 length];
    *(_WORD *)&v26[8] = 2048;
    *(void *)&v26[10] = a4;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%{public}@[HAPFragmentationInputStream] Cannot create fragmented packet with length '%tu', max length '%tu'", (uint8_t *)&v23, 0x20u);
LABEL_17:
  }
LABEL_18:
  v20 = 0;
LABEL_19:

  return v20;
}

- (HAPFragmentationStream)init
{
  v11.receiver = self;
  v11.super_class = (Class)HAPFragmentationStream;
  v2 = [(HAPFragmentationStream *)&v11 init];
  v3 = v2;
  if (v2)
  {
    v4 = (const char *)sub_100017B60(v2, 0);
    uint64_t v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create(v4, v5);
    clientQueue = v3->_clientQueue;
    v3->_clientQueue = (OS_dispatch_queue *)v6;

    unint64_t v8 = (NSMutableOrderedSet *)objc_alloc_init((Class)NSMutableOrderedSet);
    pendingPackets = v3->_pendingPackets;
    v3->_pendingPackets = v8;
  }
  return v3;
}

- (void)close
{
  v3 = [(HAPFragmentationStream *)self clientQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000097D4;
  block[3] = &unk_100273018;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)receivedFragmentedPacket:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HAPFragmentationStream *)self clientQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000990C;
  v7[3] = &unk_100273040;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (id)__transactionDataWithTransactionIdentifier:(unsigned __int16)a3
{
  int v3 = a3;
  id v4 = -[HAPFragmentationStream __filteredPacketsWithTransactionIdentifier:](self, "__filteredPacketsWithTransactionIdentifier:");
  if ([v4 count])
  {
    uint64_t v5 = [v4 firstObject];
    unsigned int v6 = [v5 length];

    id v7 = +[NSMutableData dataWithCapacity:v6];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v8 = v4;
    id v9 = [v8 countByEnumeratingWithState:&v24 objects:v32 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v25;
      while (2)
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v25 != v11) {
            objc_enumerationMutation(v8);
          }
          unint64_t v13 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          unsigned int v14 = [v13 offset:v24];
          if ([v7 length] != (id)v14)
          {
            v17 = sub_100083F74();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            {
              v18 = sub_100083FD0(0);
              unsigned int v19 = [v13 offset];
              id v20 = [v7 length];
              *(_DWORD *)buf = 138543874;
              v29 = v18;
              __int16 v30 = 1024;
              *(_DWORD *)v31 = v19;
              *(_WORD *)&v31[4] = 2048;
              *(void *)&v31[6] = v20;
              _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%{public}@[HAPFragmentationInputStream] Packet with offset %u does not match current offset %tu", buf, 0x1Cu);
            }
            goto LABEL_19;
          }
          uint64_t v15 = [v13 data];
          [v7 appendData:v15];
        }
        id v10 = [v8 countByEnumeratingWithState:&v24 objects:v32 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }

    if ([v7 length] == (id)v6)
    {
      id v7 = v7;
      unint64_t v16 = v7;
      goto LABEL_21;
    }
    id v8 = sub_100083F74();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v21 = sub_100083FD0(0);
      id v22 = [v7 length];
      *(_DWORD *)buf = 138543874;
      v29 = v21;
      __int16 v30 = 2048;
      *(void *)v31 = v22;
      *(_WORD *)&v31[8] = 1024;
      *(_DWORD *)&v31[10] = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%{public}@[HAPFragmentationInputStream] Final payload length, %tu, doesn't match expected payload length, %u", buf, 0x1Cu);
    }
    goto LABEL_19;
  }
  id v7 = sub_100083F74();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    id v8 = sub_100083FD0(0);
    *(_DWORD *)buf = 138543618;
    v29 = v8;
    __int16 v30 = 1024;
    *(_DWORD *)v31 = v3;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%{public}@[HAPFragmentationInputStream] No packets matching transaction %u", buf, 0x12u);
LABEL_19:
  }
  unint64_t v16 = 0;
LABEL_21:

  return v16;
}

- (BOOL)__isTransactionCompleteWithTransactionIdentifier:(unsigned __int16)a3
{
  int v3 = [(HAPFragmentationStream *)self __filteredPacketsWithTransactionIdentifier:a3];
  if ([v3 count])
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v4 = v3;
    id v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v5)
    {
      id v6 = v5;
      int v7 = 0;
      uint64_t v8 = *(void *)v17;
      while (2)
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v17 != v8) {
            objc_enumerationMutation(v4);
          }
          id v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          if (objc_msgSend(v10, "offset", (void)v16) != v7)
          {

            goto LABEL_12;
          }
          uint64_t v11 = [v10 data];
          v7 += [v11 length];
        }
        id v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
    else
    {
      int v7 = 0;
    }

    unint64_t v13 = [v4 firstObject];
    unsigned int v14 = [v13 length];

    BOOL v12 = v7 == v14;
  }
  else
  {
LABEL_12:
    BOOL v12 = 0;
  }

  return v12;
}

- (id)__filteredPacketsWithTransactionIdentifier:(unsigned __int16)a3
{
  unsigned int v3 = a3;
  id v4 = [(HAPFragmentationStream *)self pendingPackets];
  id v5 = +[NSPredicate predicateWithFormat:@"transactionIdentifier == %u", v3];
  id v6 = [v4 filteredOrderedSetUsingPredicate:v5];

  return v6;
}

- (void)__addFragmentationPacket:(id)a3
{
  id v4 = a3;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x2020000000;
  uint64_t v17 = 0;
  id v5 = [(HAPFragmentationStream *)self pendingPackets];
  uint64_t v8 = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472;
  id v10 = sub_10000A19C;
  uint64_t v11 = &unk_100273068;
  id v6 = v4;
  id v12 = v6;
  unint64_t v13 = &v14;
  [v5 enumerateObjectsUsingBlock:&v8];

  int v7 = [(HAPFragmentationStream *)self pendingPackets];
  [v7 insertObject:v6 atIndex:v15[3]];

  _Block_object_dispose(&v14, 8);
}

- (void)__removeAllPendingPacketsWithTransactionIdentifier:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  id v7 = [(HAPFragmentationStream *)self pendingPackets];
  id v5 = [(HAPFragmentationStream *)self __filteredPacketsWithTransactionIdentifier:v3];
  id v6 = [v5 array];
  [v7 removeObjectsInArray:v6];
}

- (HAPFragmentationStreamDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HAPFragmentationStreamDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (OS_dispatch_queue)clientQueue
{
  return self->_clientQueue;
}

- (NSMutableOrderedSet)pendingPackets
{
  return self->_pendingPackets;
}

- (NSNumber)currentPacketTransactionIdentifier
{
  return self->_currentPacketTransactionIdentifier;
}

- (void)setCurrentPacketTransactionIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentPacketTransactionIdentifier, 0);
  objc_storeStrong((id *)&self->_pendingPackets, 0);
  objc_storeStrong((id *)&self->_clientQueue, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end