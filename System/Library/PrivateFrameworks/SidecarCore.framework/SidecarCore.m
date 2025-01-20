void SidecarTransferLocked(os_unfair_lock_s *a1, void *a2)
{
  os_unfair_lock_s *v3;
  void (**v4)(void);
  os_unfair_lock_s *v5;
  uint64_t vars8;

  v3 = a1 + 4;
  v4 = a2;
  v5 = a1;
  os_unfair_lock_lock(v3);
  v4[2](v4);

  os_unfair_lock_unlock(v3);
}

void sub_22D955E58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

id SidecarTransferReceiverHandleMessage(void *a1, void *a2)
{
  uint64_t v63 = *MEMORY[0x263EF8340];
  v3 = a1;
  id v4 = a2;
  v5 = v4;
  int v6 = atomic_load(v3 + 10);
  if (v6 >= 1)
  {
    SidecarTransferMessageEnqueue(v3, v4);
    v7 = 0;
    goto LABEL_27;
  }
  uint64_t v47 = 0;
  v48 = &v47;
  uint64_t v49 = 0x3032000000;
  v50 = __Block_byref_object_copy_;
  v51 = __Block_byref_object_dispose_;
  id v52 = 0;
  uint64_t v41 = 0;
  v42 = &v41;
  uint64_t v43 = 0x3032000000;
  v44 = __Block_byref_object_copy_;
  v45 = __Block_byref_object_dispose_;
  id v46 = 0;
  uint64_t TransferID = SidecarMessageGetTransferID(v4);
  v38 = v3;
  v36 = v5;
  id v9 = v5;
  v10 = [NSNumber numberWithInteger:TransferID];
  v37 = [v38[7] objectForKey:v10];
  if (!v37)
  {
    if (!v38[7])
    {
      id v11 = objc_alloc_init(MEMORY[0x263EFF9A0]);
      id v12 = v38[7];
      v38[7] = v11;

      id v13 = objc_alloc_init(MEMORY[0x263EFF980]);
      id v14 = v38[8];
      v38[8] = v13;
    }
    v37 = [[SidecarTransferGroup alloc] initWithMessage:v9];
    [v38[8] addObject:v10];
    [v38[7] setObject:v37 forKey:v10];
  }

  v15 = (id *)(v48 + 5);
  id obj = (id)v48[5];
  BOOL v16 = [(SidecarTransferGroup *)v37 handleMessage:v9 error:&obj];
  objc_storeStrong(v15, obj);
  if (v16)
  {
    if ([(SidecarTransferGroup *)v37 isComplete])
    {
      v17 = v38;
      v18 = (void *)[v17[8] copy];
      long long v55 = 0u;
      long long v56 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      id v19 = v18;
      v20 = 0;
      uint64_t v21 = [v19 countByEnumeratingWithState:&v53 objects:buf count:16];
      if (v21)
      {
        uint64_t v22 = *(void *)v54;
        while (2)
        {
          for (uint64_t i = 0; i != v21; ++i)
          {
            if (*(void *)v54 != v22) {
              objc_enumerationMutation(v19);
            }
            uint64_t v24 = *(void *)(*((void *)&v53 + 1) + 8 * i);
            v25 = [v17[7] objectForKey:v24];
            if (![v25 isComplete])
            {

              goto LABEL_24;
            }
            if (!v20) {
              v20 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v19, "count"));
            }
            [v20 addObject:v25];
            [v17[8] removeObject:v24];
            [v17[7] removeObjectForKey:v24];
          }
          uint64_t v21 = [v19 countByEnumeratingWithState:&v53 objects:buf count:16];
          if (v21) {
            continue;
          }
          break;
        }
      }
LABEL_24:

      v28 = (void *)v42[5];
      v42[5] = (uint64_t)v20;
      goto LABEL_25;
    }
  }
  else if (!v48[5])
  {
    id v26 = v9;
    id v27 = (id)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"SidecarErrorDomain" code:-1010 userInfo:0];
    if (v27)
    {
      v30 = SidecarCoreLogSubsystem(OS_LOG_TYPE_ERROR);
      v31 = v30;
      if (v30)
      {
        v32 = v30;
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          v33 = [v27 domain];
          uint64_t v34 = [v27 code];
          v35 = [v27 localizedDescription];
          *(_DWORD *)buf = 138543875;
          v58 = v33;
          __int16 v59 = 2048;
          uint64_t v60 = v34;
          __int16 v61 = 2113;
          v62 = v35;
          _os_log_impl(&dword_22D954000, v32, OS_LOG_TYPE_ERROR, "%{public}@ (%ld) %{private}@", buf, 0x20u);
        }
      }
    }
    v28 = (void *)v48[5];
    v48[5] = (uint64_t)v27;
LABEL_25:
  }
  v39[0] = MEMORY[0x263EF8330];
  v39[1] = 3221225472;
  v39[2] = __SidecarTransferReceiverHandleMessage_block_invoke;
  v39[3] = &unk_2649C5E78;
  v39[4] = v38;
  v39[5] = &v41;
  v39[6] = &v47;
  v7 = (void *)MEMORY[0x230F8F310](v39);

  _Block_object_dispose(&v41, 8);
  _Block_object_dispose(&v47, 8);

  v5 = v36;
LABEL_27:

  return v7;
}

void sub_22D9569D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void SidecarTransferMessageEnqueue(void *a1, void *a2)
{
  id object = a1;
  id v3 = a2;
  AssociatedObject = (void **)objc_getAssociatedObject(object, SidecarTransferMessageEnqueue);
  if (!AssociatedObject) {
    AssociatedObject = (void **)_SidecarAssociatedQueueAlloc(object, SidecarTransferMessageEnqueue);
  }
  v5 = malloc_type_malloc(0x10uLL, 0xE0040CF218873uLL);
  void *v5 = v3;
  v5[1] = 0;
  int v6 = v5 + 1;
  *AssociatedObject[1] = v5;

  AssociatedObject[1] = v6;
}

void __SidecarTransferReceiverHandleMessage_block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) delegate];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v3 = *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    char v6 = 0;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v3);
        }
        id v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v10 = objc_msgSend(v9, "type", (void)v14);
        v6 |= v10 == 4;
        uint64_t v11 = *(void *)(a1 + 32);
        id v12 = [v9 items];
        [v2 sidecarTransfer:v11 receivedItems:v12 messageType:v10];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v5);

    if (v6)
    {
      uint64_t v13 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
LABEL_12:
      objc_msgSend(v2, "sidecarTransfer:didComplete:", *(void *)(a1 + 32), v13, (void)v14);
      goto LABEL_13;
    }
  }
  else
  {
  }
  uint64_t v13 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  if (v13) {
    goto LABEL_12;
  }
LABEL_13:
}

void sub_22D956D6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__64(uint64_t a1, uint64_t a2)
{
  uint64_t result = MEMORY[0x230F8F310](*(void *)(a2 + 40));
  *(void *)(a1 + 40) = result;
  return result;
}

void __Block_byref_object_dispose__65(uint64_t a1)
{
}

uint64_t SidecarTransferSenderSliceData(void *a1)
{
  v1 = a1;
  uint64_t v5 = 0;
  char v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 1;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __SidecarTransferSenderSliceData_block_invoke;
  v4[3] = &unk_2649C5EC8;
  v4[4] = v1;
  v4[5] = &v5;
  SidecarTransferLocked(v1, v4);
  uint64_t v2 = *((unsigned __int8 *)v6 + 24);
  _Block_object_dispose(&v5, 8);

  return v2;
}

void sub_22D9570DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void SidecarTransferSenderSetMessageData(void *a1, void *a2)
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __SidecarTransferSenderSetMessageData_block_invoke;
  v5[3] = &unk_2649C6598;
  v5[4] = a1;
  v5[5] = a2;
  id v3 = a2;
  uint64_t v4 = a1;
  SidecarTransferLocked(v4, v5);
}

void SidecarTransferSendMessage(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = a1;
  SidecarMessageSetRequestID(v3, [(os_unfair_lock_s *)v4 requestID]);
  SidecarMessageSetTransferID(v3, [(os_unfair_lock_s *)v4 transferID]);
  SidecarMessageSetType(v3, [(os_unfair_lock_s *)v4 type]);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __SidecarTransferSendMessage_block_invoke;
  v5[3] = &unk_2649C6598;
  v5[4] = v4;
  v5[5] = v3;
  SidecarTransferLocked(v4, v5);
}

void __SidecarTransferSendMessage_block_invoke(uint64_t a1)
{
  int v2 = atomic_load((unsigned int *)(*(void *)(a1 + 32) + 40));
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void **)(a1 + 40);
  if (v2 < 1) {
    __SidecarTransferSendMessage(v3, v4);
  }
  else {
    SidecarTransferMessageEnqueue(v3, v4);
  }
}

void __SidecarTransferSendMessage(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  uint64_t v5 = [v4 session];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = ____SidecarTransferSendMessage_block_invoke;
  v6[3] = &unk_2649C6198;
  v6[4] = v4;
  [v5 sendMessage:v3 completion:v6];
}

void __SidecarTransferSenderSetMessageData_block_invoke(uint64_t a1)
{
  id v3 = *(id *)(*(void *)(a1 + 32) + 72);
  int v2 = [v3 firstObject];
  if (v2)
  {
    SidecarMessageSetItemData(*(void **)(a1 + 40), *(void *)(*(void *)(a1 + 32) + 56), v2);
    [v3 removeObjectAtIndex:0];
  }
}

void __SidecarTransferSenderSliceData_block_invoke(uint64_t a1)
{
  if (![*(id *)(*(void *)(a1 + 32) + 72) count])
  {
    uint64_t v2 = *(void *)(a1 + 32);
    unint64_t v3 = *(void *)(v2 + 56) + 1;
    *(void *)(v2 + 56) = v3;
    if (v3 >= [*(id *)(*(void *)(a1 + 32) + 64) count])
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    }
    else
    {
      id v15 = [*(id *)(*(void *)(a1 + 32) + 64) objectAtIndexedSubscript:v3];
      id v4 = [v15 data];
      uint64_t v5 = [v4 bytes];
      long long v14 = v4;
      unint64_t v6 = [v4 length];
      uint64_t v7 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:(v6 >> 20) + 1];
      unint64_t v8 = 0;
      unint64_t v9 = v6;
      do
      {
        if (!v6 || v9)
        {
          if (v9 >= 0x100000) {
            uint64_t v10 = 0x100000;
          }
          else {
            uint64_t v10 = v9;
          }
          uint64_t v11 = [MEMORY[0x263EFF8F8] dataWithBytesNoCopy:v5 + v8 length:v10 freeWhenDone:0];
          [v7 addObject:v11];
        }
        v8 += 0x100000;
        v9 -= 0x100000;
      }
      while (v8 <= v6);
      uint64_t v12 = *(void *)(a1 + 32);
      uint64_t v13 = *(void **)(v12 + 72);
      *(void *)(v12 + 72) = v7;
    }
  }
}

void __SidecarTransferDequeueMessages_block_invoke(uint64_t a1)
{
  int v1 = atomic_load((unsigned int *)(*(void *)(a1 + 32) + 40));
  if (v1 <= 0)
  {
    unint64_t v3 = 0;
    while (1)
    {
      id v4 = *(id *)(a1 + 32);
      AssociatedObject = (void **)objc_getAssociatedObject(v4, SidecarTransferMessageEnqueue);
      if (AssociatedObject)
      {
        unint64_t v6 = AssociatedObject;
        uint64_t v7 = (void **)*AssociatedObject;
        if (!v7)
        {
          __break(1u);
          return;
        }
        unint64_t v9 = *v7;
        unint64_t v8 = v7[1];
        *unint64_t v6 = v8;
        if (!v8) {
          v6[1] = v6;
        }
        free(v7);
        if (!*v6) {
          _SidecarAssociatedQueueDealloc(v4, SidecarTransferMessageEnqueue, v6);
        }
      }
      else
      {
        unint64_t v9 = 0;
      }

      if (v9)
      {
        uint64_t v10 = [*(id *)(a1 + 32) _resumeMessage:v9];
        if (v10)
        {
          if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)) {
            uint64_t v11 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
          }
          else {
            uint64_t v11 = &__block_literal_global_67;
          }
          uint64_t v12 = (void *)MEMORY[0x230F8F310](v11);
          v17[0] = MEMORY[0x263EF8330];
          v17[1] = 3221225472;
          v17[2] = __SidecarTransferDequeueMessages_block_invoke_3;
          v17[3] = &unk_2649C5E50;
          v17[4] = v12;
          v17[5] = v10;
          uint64_t v13 = MEMORY[0x230F8F310](v17);
          uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 8);
          id v15 = *(void **)(v14 + 40);
          *(void *)(v14 + 40) = v13;
        }
        int v16 = atomic_load((unsigned int *)(*(void *)(a1 + 32) + 40));
        unint64_t v3 = v9;
        if (v16 < 1) {
          continue;
        }
      }

      return;
    }
  }
}

uint64_t __SidecarTransferDequeueMessages_block_invoke_3(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v2();
}

void SidecarRequestFinish(void *a1, void *a2)
{
  unint64_t v3 = a1;
  id v4 = a2;
  uint64_t v5 = v4;
  uint64_t v6 = atomic_load(v3 + 14);
  if (v6 <= 2)
  {
    uint64_t v7 = v6;
    atomic_compare_exchange_strong((atomic_ullong *volatile)v3 + 14, (unint64_t *)&v7, 3uLL);
    if (v7 == v6)
    {
      uint64_t v8 = MEMORY[0x263EF8330];
      uint64_t v9 = 3221225472;
      uint64_t v10 = __SidecarRequestFinish_block_invoke;
      uint64_t v11 = &unk_2649C6598;
      id v12 = v4;
      uint64_t v13 = v3;
      if (v4)
      {
        objc_msgSend(v3, "willChangeValueForKey:", @"error", v8, v9);
        v10((uint64_t)&v8);
        [v3 didChangeValueForKey:@"error"];
      }
      else
      {
        __SidecarRequestFinish_block_invoke((uint64_t)&v8);
      }
    }
  }
}

void __SidecarRequestFinish_block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) domain];
  if ([v2 isEqualToString:*MEMORY[0x263F07F70]]) {
    BOOL v3 = [*(id *)(a1 + 32) code] == 3072;
  }
  else {
    BOOL v3 = 0;
  }

  v7.i64[0] = MEMORY[0x263EF8330];
  v7.i64[1] = 3221225472;
  uint64_t v8 = __SidecarRequestFinish_block_invoke_2;
  uint64_t v9 = &unk_2649C5F18;
  uint64_t v4 = *(void *)(a1 + 32);
  id v10 = *(id *)(a1 + 40);
  uint64_t v11 = v4;
  BOOL v12 = v3;
  id v5 = v10;
  uint64_t v6 = v5;
  if (v3)
  {
    [v5 willChangeValueForKey:@"cancelled"];
    v8(&v7);
    [v6 didChangeValueForKey:@"cancelled"];
  }
  else
  {
    __SidecarRequestFinish_block_invoke_2(&v7);
  }
}

void __SidecarRequestFinish_block_invoke_2(int8x16_t *a1)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __SidecarRequestFinish_block_invoke_3;
  v3[3] = &unk_2649C5F18;
  int8x16_t v1 = a1[2];
  int8x16_t v4 = vextq_s8(v1, v1, 8uLL);
  __int8 v5 = a1[3].i8[0];
  id v2 = (id)v1.i64[0];
  [v2 willChangeValueForKey:@"finished"];
  __SidecarRequestFinish_block_invoke_3((uint64_t)v3);
  [v2 didChangeValueForKey:@"finished"];
}

void __SidecarRequestFinish_block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    BOOL v3 = *(os_unfair_lock_s **)(a1 + 40);
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __SidecarRequestFinish_block_invoke_4;
    v5[3] = &unk_2649C6598;
    v5[4] = v3;
    v5[5] = v2;
    SidecarTransferLocked(v3, v5);
  }
  if (*(unsigned char *)(a1 + 48))
  {
    int64_t v4 = 5;
  }
  else if (*(void *)(a1 + 32))
  {
    int64_t v4 = 6;
  }
  else
  {
    int64_t v4 = 4;
  }
  SidecarRequestSetState(*(void **)(a1 + 40), v4);
  SidecarRequestDisconnectSession(*(void **)(a1 + 40));
}

void __SidecarRequestFinish_block_invoke_4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(v1 + 104);
  uint64_t v2 = (id *)(v1 + 104);
  if (v3) {
    __assert_rtn("SidecarRequestFinish_block_invoke_4", "SidecarRequest.m", 243, "self->_error == nil");
  }
  int64_t v4 = *(void **)(a1 + 40);

  objc_storeStrong(v2, v4);
}

atomic_ullong *SidecarRequestSetState(void *a1, int64_t a2)
{
  uint64_t result = a1;
  int64_t v4 = atomic_exchange(result + 14, a2);
  if (v4 <= a2 && (v4 != a2 ? (BOOL v5 = v4 < 5) : (BOOL v5 = 1), v5))
  {
    BOOL v6 = v4 != a2;

    return (atomic_ullong *)v6;
  }
  else
  {
    __break(1u);
  }
  return result;
}

void SidecarRequestDisconnectSession(void *a1)
{
  uint64_t v1 = a1;
  uint64_t v5 = 0;
  BOOL v6 = &v5;
  uint64_t v7 = 0x3032000000;
  uint64_t v8 = __Block_byref_object_copy__118;
  uint64_t v9 = __Block_byref_object_dispose__119;
  id v10 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __SidecarRequestDisconnectSession_block_invoke;
  v4[3] = &unk_2649C5EC8;
  v4[4] = v1;
  v4[5] = &v5;
  SidecarTransferLocked(v1, v4);
  uint64_t v2 = (void *)v6[5];
  uint64_t v3 = [(os_unfair_lock_s *)v1 error];
  [v2 closeWithError:v3 completion:&__block_literal_global_120];

  _Block_object_dispose(&v5, 8);
}

void sub_22D9582A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__118(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__119(uint64_t a1)
{
}

void __SidecarRequestDisconnectSession_block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(id *)(*(void *)(a1 + 32) + 40));
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 48), *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;
}

void __SidecarRequestDisconnectSession_block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v2 = a2;
  if (v2)
  {
    uint64_t v3 = SidecarCoreLogSubsystem(OS_LOG_TYPE_ERROR);
    if (v3)
    {
      log = v3;
      BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);
      uint64_t v3 = log;
      if (v4)
      {
        uint64_t v5 = [v2 domain];
        uint64_t v6 = [v2 code];
        uint64_t v7 = [v2 localizedDescription];
        *(_DWORD *)buf = 138543875;
        id v10 = v5;
        __int16 v11 = 2048;
        uint64_t v12 = v6;
        __int16 v13 = 2113;
        uint64_t v14 = v7;
        _os_log_impl(&dword_22D954000, log, OS_LOG_TYPE_ERROR, "%{public}@ (%ld) %{private}@", buf, 0x20u);

        uint64_t v3 = log;
      }
    }
  }
}

void sub_22D958738(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void __SidecarRequestEnsureTransferReceiver_block_invoke(void *a1)
{
  objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), *(id *)(a1[4] + 88));
  if (!*(void *)(*(void *)(a1[6] + 8) + 40))
  {
    id v2 = [[SidecarTransferReceiver alloc] initWithSession:a1[5] requestID:a1[7]];
    uint64_t v3 = *(void *)(a1[6] + 8);
    BOOL v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v2;

    [*(id *)(*(void *)(a1[6] + 8) + 40) setDelegate:a1[4]];
    uint64_t v5 = *(void **)(*(void *)(a1[6] + 8) + 40);
    uint64_t v6 = (id *)(a1[4] + 88);
    objc_storeStrong(v6, v5);
  }
}

void sub_22D958BFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void SidecarRequestTransferEnqueue(void *a1, void *a2)
{
  id object = a1;
  id v3 = a2;
  AssociatedObject = (void **)objc_getAssociatedObject(object, SidecarRequestTransferEnqueue);
  if (!AssociatedObject) {
    AssociatedObject = (void **)_SidecarAssociatedQueueAlloc(object, SidecarRequestTransferEnqueue);
  }
  uint64_t v5 = malloc_type_malloc(0x10uLL, 0xE0040CF218873uLL);
  void *v5 = v3;
  v5[1] = 0;
  uint64_t v6 = v5 + 1;
  *AssociatedObject[1] = v5;

  AssociatedObject[1] = v6;
}

void SidecarRequestSendMessage(void *a1, void *a2, uint64_t a3)
{
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __SidecarRequestSendMessage_block_invoke;
  v6[3] = &unk_2649C6690;
  v6[4] = a1;
  void v6[5] = 0;
  id v5 = a1;
  [a2 sendMessage:a3 completion:v6];
}

void __SidecarRequestSendMessage_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a2;
  BOOL v4 = *(const char **)(a1 + 40);
  id v5 = *(id *)(a1 + 32);
  id v6 = v3;
  if (v6)
  {
    if (v5) {
      BOOL v7 = v4 == 0;
    }
    else {
      BOOL v7 = 1;
    }
    if (v7)
    {
      uint64_t v8 = SidecarCoreLogSubsystem(OS_LOG_TYPE_ERROR);
      uint64_t v9 = v8;
      if (v8 && os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        id v10 = [v6 domain];
        uint64_t v11 = [v6 code];
        uint64_t v12 = [v6 localizedDescription];
        int v13 = 138543875;
        uint64_t v14 = v10;
        __int16 v15 = 2048;
        uint64_t v16 = v11;
        __int16 v17 = 2113;
        v18 = v12;
        _os_log_impl(&dword_22D954000, v9, OS_LOG_TYPE_ERROR, "%{public}@ (%ld) %{private}@", (uint8_t *)&v13, 0x20u);
      }
    }
    else
    {
      _SidecarCoreLogObjCAPIError(v5, v4, v6);
    }

    SidecarRequestFinish(*(void **)(a1 + 32), v6);
  }
  else
  {
  }
}

void sub_22D9591B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __SidecarRequestTransferCompleted_block_invoke(uint64_t a1)
{
  id v2 = (id *)*(id *)(*(void *)(a1 + 32) + 96);
  if (v2)
  {
    uint64_t v8 = v2;
    id v3 = SidecarMapTableRemoveObject(v2, [*(id *)(a1 + 40) transferID]);
    BOOL v4 = *(void **)(a1 + 40);

    if (v3 == v4)
    {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), *(id *)(a1 + 40));
      if (![v8[2] count])
      {
        uint64_t v5 = *(void *)(a1 + 32);
        id v6 = *(void **)(v5 + 96);
        *(void *)(v5 + 96) = 0;
      }
    }
  }

  return MEMORY[0x270F9A758]();
}

void sub_22D9594B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __SidecarRequestCreateSendTransfer_block_invoke(void *a1)
{
  v10[2] = *MEMORY[0x263EF8340];
  id v2 = (SidecarMapTable *)*(id *)(a1[4] + 96);
  if (!v2)
  {
    id v2 = [[SidecarMapTable alloc] initWithKeyMask:0x7FFFFFFFLL weakObjects:0];
    objc_storeStrong((id *)(a1[4] + 96), v2);
  }
  id v3 = (void *)a1[5];
  v10[0] = 0;
  v10[1] = 0;
  [v3 getUUIDBytes:v10];
  uint64_t v4 = bswap32(v10[0]);
  uint64_t v5 = [MEMORY[0x263EFF9D0] null];
  uint64_t v6 = SidecarMapTableAddObject(v2, v5);

  BOOL v7 = [[SidecarTransferSender alloc] initWithSession:a1[6] requestID:v4 transferID:v6];
  uint64_t v8 = *(void *)(a1[7] + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  [*(id *)(*(void *)(a1[7] + 8) + 40) setDelegate:a1[4]];
  SidecarMapTableReplaceObject(v2, v6, *(void **)(*(void *)(a1[7] + 8) + 40));
}

void sub_22D9598FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void sub_22D959A74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22D959C20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22D95A0E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22D95A3FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22D95A5C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id SidecarCoreBundle()
{
  if (__SidecarCoreInit != -1) {
    dispatch_once(&__SidecarCoreInit, &__block_literal_global_84);
  }
  v0 = (void *)__SidecarCoreBundle;

  return v0;
}

void __SidecarCoreInit_block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v1 = (void *)__SidecarCoreBundle;
  __SidecarCoreBundle = v0;

  os_log_t v2 = os_log_create("com.apple.sidecar", "core");
  atomic_store((unint64_t)v2, &__SidecarCoreLogSubsystem);
  id v3 = v2;
  [MEMORY[0x263F087E8] setUserInfoValueProviderForDomain:@"SidecarErrorDomain" provider:&__block_literal_global_941];
  uint64_t v6 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
  dispatch_queue_t v4 = dispatch_queue_create("com.apple.SidecarCore", v6);
  uint64_t v5 = (void *)__sidecarQueue;
  __sidecarQueue = (uint64_t)v4;
}

id SidecarQueue()
{
  if (__SidecarCoreInit != -1) {
    dispatch_once(&__SidecarCoreInit, &__block_literal_global_84);
  }
  uint64_t v0 = (void *)__sidecarQueue;

  return v0;
}

NSObject *SidecarCoreLogSubsystem(os_log_type_t type)
{
  uint64_t v1 = atomic_load(&__SidecarCoreLogSubsystem);
  if (v1)
  {
    if (os_log_type_enabled(v1, type)) {
      os_log_t v2 = v1;
    }
    else {
      os_log_t v2 = 0;
    }
    id v3 = v2;
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

id SidecarRelayConnection()
{
  uint64_t v0 = (void *)SidecarRelayConnection_connection;
  if (!SidecarRelayConnection_connection)
  {
    uint64_t v1 = [objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.sidecar-relay" options:0];
    os_log_t v2 = (void *)SidecarRelayConnection_connection;
    SidecarRelayConnection_connection = v1;

    id v3 = (void *)SidecarRelayConnection_connection;
    dispatch_queue_t v4 = SidecarQueue();
    [v3 _setQueue:v4];

    [(id)SidecarRelayConnection_connection setInvalidationHandler:&__block_literal_global_172];
    [(id)SidecarRelayConnection_connection setInterruptionHandler:&__block_literal_global_4];
    uint64_t v5 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26E192720];
    uint64_t v6 = (void *)MEMORY[0x263EFFA08];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    id v10 = objc_msgSend(v6, "setWithObjects:", v7, v8, v9, objc_opt_class(), 0);
    [v5 setClasses:v10 forSelector:sel_relayDevicesForServiceIdentifier_completion_ argumentIndex:0 ofReply:1];

    uint64_t v11 = (void *)MEMORY[0x263EFFA08];
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = objc_opt_class();
    uint64_t v16 = objc_msgSend(v11, "setWithObjects:", v12, v13, v14, v15, objc_opt_class(), 0);
    [v5 setClasses:v16 forSelector:sel_relayFetchRemoteDisplaySendingDeviceStatesWithCompletion_ argumentIndex:0 ofReply:1];

    [(id)SidecarRelayConnection_connection setRemoteObjectInterface:v5];
    __int16 v17 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26E190D20];
    [(id)SidecarRelayConnection_connection setExportedInterface:v17];

    v18 = +[SidecarCoreProxy defaultProxy];
    [(id)SidecarRelayConnection_connection setExportedObject:v18];

    [(id)SidecarRelayConnection_connection resume];
    uint64_t v0 = (void *)SidecarRelayConnection_connection;
  }

  return v0;
}

void __SidecarRelayConnection_block_invoke_2()
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v0 = SidecarCoreLogSubsystem(OS_LOG_TYPE_INFO);
  uint64_t v1 = v0;
  if (v0 && os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    int v6 = 138543362;
    uint64_t v7 = @"com.apple.sidecar-relay";
    _os_log_impl(&dword_22D954000, v1, OS_LOG_TYPE_INFO, "%{public}@: connection interrupted", (uint8_t *)&v6, 0xCu);
  }

  os_log_t v2 = +[SidecarProviderProxy defaultProxy];
  id v3 = [v2 delegate];

  if (v3) {
    SidecarRegisterServiceProvider(v3);
  }
  dispatch_queue_t v4 = +[SidecarCoreProxy defaultProxy];
  uint64_t v5 = [v4 presenterDelegate];

  if (v5) {
    [v5 sidecarServicePresenterTerminate];
  }
}

void __SidecarRelayConnection_block_invoke()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  uint64_t v0 = SidecarCoreLogSubsystem(OS_LOG_TYPE_ERROR);
  uint64_t v1 = v0;
  if (v0 && os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    int v2 = 138543362;
    id v3 = @"com.apple.sidecar-relay";
    _os_log_impl(&dword_22D954000, v1, OS_LOG_TYPE_ERROR, "%{public}@: connection invalid", (uint8_t *)&v2, 0xCu);
  }
}

void _SidecarCoreLogAPIError(const void *a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a2;
  memset(&v10, 0, sizeof(v10));
  dladdr(a1, &v10);
  uint64_t v4 = SidecarCoreLogSubsystem(OS_LOG_TYPE_ERROR);
  uint64_t v5 = v4;
  if (v4 && os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    dli_sname = v10.dli_sname;
    uint64_t v7 = [v3 domain];
    uint64_t v8 = [v3 code];
    uint64_t v9 = [v3 localizedDescription];
    *(_DWORD *)buf = 136446979;
    uint64_t v12 = dli_sname;
    __int16 v13 = 2114;
    uint64_t v14 = v7;
    __int16 v15 = 2048;
    uint64_t v16 = v8;
    __int16 v17 = 2113;
    v18 = v9;
    _os_log_impl(&dword_22D954000, v5, OS_LOG_TYPE_ERROR, "%{public}s: %{public}@ (%ld) %{private}@", buf, 0x2Au);
  }
}

void _SidecarCoreLogObjCAPIError(void *a1, const char *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = a1;
  id v6 = a3;
  uint64_t v7 = SidecarCoreLogSubsystem(OS_LOG_TYPE_ERROR);
  uint64_t v8 = v7;
  if (v7 && os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    uint64_t v9 = [v5 description];
    Dl_info v10 = NSStringFromSelector(a2);
    uint64_t v11 = [v6 domain];
    uint64_t v12 = [v6 code];
    __int16 v13 = [v6 localizedDescription];
    int v14 = 138544387;
    __int16 v15 = v9;
    __int16 v16 = 2114;
    __int16 v17 = v10;
    __int16 v18 = 2114;
    uint64_t v19 = v11;
    __int16 v20 = 2048;
    uint64_t v21 = v12;
    __int16 v22 = 2113;
    v23 = v13;
    _os_log_impl(&dword_22D954000, v8, OS_LOG_TYPE_ERROR, "-[%{public}@ %{public}@]: %{public}@ (%ld) %{private}@", (uint8_t *)&v14, 0x34u);
  }
}

id SidecarRelayProxyAsync(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = SidecarRelayConnection();
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __SidecarRelayProxyAsync_block_invoke;
  v7[3] = &unk_2649C5FB8;
  v7[4] = v3;
  v7[5] = a1;
  id v5 = [v4 remoteObjectProxyWithErrorHandler:v7];

  return v5;
}

void __SidecarRelayProxyAsync_block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  SidecarCoreLogAPIError(*(const void **)(a1 + 40), v4);
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);
  }
}

void SidecarCoreLogAPIError(const void *a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    if (a1)
    {
      _SidecarCoreLogAPIError(a1, v3);
    }
    else
    {
      id v5 = v3;
      id v6 = SidecarCoreLogSubsystem(OS_LOG_TYPE_ERROR);
      uint64_t v7 = v6;
      if (v6 && os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        uint64_t v8 = [v5 domain];
        uint64_t v9 = [v5 code];
        Dl_info v10 = [v5 localizedDescription];
        int v11 = 138543875;
        uint64_t v12 = v8;
        __int16 v13 = 2048;
        uint64_t v14 = v9;
        __int16 v15 = 2113;
        __int16 v16 = v10;
        _os_log_impl(&dword_22D954000, v7, OS_LOG_TYPE_ERROR, "%{public}@ (%ld) %{private}@", (uint8_t *)&v11, 0x20u);
      }
    }
  }
}

id SidecarRelayProxySync(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  int v11 = __Block_byref_object_copy__184;
  uint64_t v12 = __Block_byref_object_dispose__185;
  id v13 = 0;
  id v4 = SidecarQueue();
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __SidecarRelayProxySync_block_invoke;
  block[3] = &unk_2649C5FE0;
  block[5] = &v8;
  block[6] = a1;
  block[4] = v3;
  dispatch_sync(v4, block);

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void sub_22D95B7AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__184(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__185(uint64_t a1)
{
}

void __SidecarRelayProxySync_block_invoke(void *a1)
{
  int v2 = SidecarRelayConnection();
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __SidecarRelayProxySync_block_invoke_2;
  v7[3] = &unk_2649C5FB8;
  uint64_t v3 = a1[6];
  v7[4] = a1[4];
  v7[5] = v3;
  uint64_t v4 = [v2 synchronousRemoteObjectProxyWithErrorHandler:v7];
  uint64_t v5 = *(void *)(a1[5] + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

void __SidecarRelayProxySync_block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  SidecarCoreLogAPIError(*(const void **)(a1 + 40), v4);
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);
  }
}

id SidecarDiagnose(uint64_t a1)
{
  SidecarRegisterStateNotification();
  if (atomic_load(&SidecarDeviceState))
  {
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __SidecarDiagnose_block_invoke;
    v14[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
    v14[4] = a1;
    uint64_t v3 = (void *)[v14 copy];
    uint64_t v8 = 0;
    uint64_t v9 = &v8;
    uint64_t v10 = 0x3032000000;
    int v11 = __Block_byref_object_copy__184;
    uint64_t v12 = __Block_byref_object_dispose__185;
    id v13 = 0;
    id v4 = SidecarRelayProxySync((uint64_t)SidecarDiagnose, v3);
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __SidecarDiagnose_block_invoke_2;
    v7[3] = &unk_2649C6028;
    v7[4] = v3;
    v7[5] = &v8;
    [v4 relayDiagnose:v7];

    id v5 = (id)v9[5];
    _Block_object_dispose(&v8, 8);
  }
  else
  {
    id v5 = (id)MEMORY[0x263EFFA78];
  }

  return v5;
}

void sub_22D95BA7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __SidecarDiagnose_block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  if (v4 && !*v4)
  {
    id v5 = v3;
    **(void **)(a1 + 32) = v3;
    id v3 = v5;
  }
}

void __SidecarDiagnose_block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = v5;
  if (a2 && !v5)
  {
    id v10 = 0;
    uint64_t v7 = [MEMORY[0x263F08AC0] propertyListWithData:a2 options:0 format:0 error:&v10];
    id v6 = v10;
    uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

unint64_t SidecarGetProcessUniqueID()
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  unint64_t result = atomic_load(&SidecarGetProcessUniqueID_uniqueId);
  if (!result)
  {
    uint64_t v6 = 0;
    long long v4 = 0u;
    long long v5 = 0u;
    long long v3 = 0u;
    pid_t v1 = getpid();
    int v2 = proc_pidinfo(v1, 17, 1uLL, &v3, 56);
    unint64_t result = 0;
    if (v2 == 56)
    {
      unint64_t result = v4;
      atomic_store(v4, &SidecarGetProcessUniqueID_uniqueId);
    }
  }
  return result;
}

void SidecarRegisterServiceProvider(void *a1)
{
  id v1 = a1;
  int v2 = SidecarQueue();
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __SidecarRegisterServiceProvider_block_invoke;
  block[3] = &unk_2649C64F0;
  block[4] = v1;
  dispatch_async(v2, block);
}

void __SidecarRegisterServiceProvider_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  int v2 = +[SidecarProviderProxy defaultProxy];
  [v2 setDelegate:v1];

  long long v3 = +[SidecarProviderProxy defaultProxy];
  long long v4 = +[SidecarCoreProxy defaultProxy];
  [v4 setDelegate:v3];

  SidecarRelayProxyAsync((uint64_t)SidecarRegisterServiceProvider, 0);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 relayRegisterServiceProvider:&__block_literal_global_28];
}

void __SidecarRegisterServiceProvider_block_invoke_2(uint64_t a1, void *a2)
{
  if (a2) {
    _SidecarCoreLogAPIError(SidecarRegisterServiceProvider, a2);
  }
}

void SidecarServiceProviderReady(void *a1)
{
  id v1 = a1;
  if (v1)
  {
    int v2 = SidecarQueue();
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __SidecarServiceProviderReady_block_invoke;
    block[3] = &unk_2649C64F0;
    block[4] = v1;
    dispatch_async(v2, block);
  }
  else
  {
    long long v3 = SidecarCoreLogSubsystem(OS_LOG_TYPE_ERROR);
    int v2 = v3;
    if (v3 && os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22D954000, v2, OS_LOG_TYPE_ERROR, "SidecarServiceProviderReady called with nil uuid.", buf, 2u);
    }
  }
}

void __SidecarServiceProviderReady_block_invoke(uint64_t a1)
{
  SidecarRelayProxyAsync((uint64_t)SidecarRegisterServiceProvider, 0);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 relayServiceProviderReady:*(void *)(a1 + 32)];
}

void SidecarOptOutOfReconnect(void *a1)
{
  id v1 = a1;
  id v2 = SidecarQueue();
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __SidecarOptOutOfReconnect_block_invoke;
  block[3] = &unk_2649C6148;
  id v5 = v1;
  id v3 = v1;
  dispatch_async(v2, block);
}

void __SidecarOptOutOfReconnect_block_invoke(uint64_t a1)
{
  id v2 = SidecarRelayProxyAsync((uint64_t)SidecarRegisterServiceProvider, 0);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __SidecarOptOutOfReconnect_block_invoke_2;
  v3[3] = &unk_2649C6120;
  id v4 = *(id *)(a1 + 32);
  [v2 relayOptOutOfReconnect:v3];
}

uint64_t __SidecarOptOutOfReconnect_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

__CFString *SidecarSessionStateAsNSString(unint64_t a1)
{
  if (a1 > 3) {
    return @"Unknown";
  }
  else {
    return off_2649C6048[a1];
  }
}

id SidecarMessageCreateMutable()
{
  uint64_t v0 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:5];

  return v0;
}

id SidecarMessageGetDictionaryRepresentation(void *a1)
{
  id v1 = a1;

  return v1;
}

id SidecarMessageGetDefaults(void *a1)
{
  id v1 = [a1 objectForKey:&unk_26E18EA60];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v2 = v1;
  }
  else {
    id v2 = (id)MEMORY[0x263EFFA78];
  }

  return v2;
}

uint64_t SidecarMessageSetDefaults(void *a1, const char *a2)
{
  if (a2) {
    return [a1 setObject:a2 forKey:&unk_26E18EA60];
  }
  else {
    return [a1 removeObjectForKey:&unk_26E18EA60];
  }
}

id SidecarMessageGetItemData(void *a1, uint64_t a2)
{
  id v3 = [a1 objectForKey:&unk_26E18EA78];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [NSNumber numberWithInteger:a2];
    id v5 = [v3 objectForKeyedSubscript:v4];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v6 = v5;
    }
    else {
      uint64_t v6 = 0;
    }
    id v7 = v6;
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

void SidecarMessageSetItemData(void *a1, uint64_t a2, void *a3)
{
  id v8 = a1;
  id v5 = a3;
  id v6 = [v8 objectForKey:&unk_26E18EA78];
  if (!v6)
  {
    id v6 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    [v8 setObject:v6 forKey:&unk_26E18EA78];
  }
  id v7 = [NSNumber numberWithInteger:a2];
  [v6 setObject:v5 forKeyedSubscript:v7];
}

void SidecarMessageSetItemMetaData(void *a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v16 = a1;
  id v3 = a2;
  uint64_t v4 = [v3 count];
  id v5 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:v4];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = v3;
  uint64_t v6 = [obj countByEnumeratingWithState:&v18 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v19;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v18 + 1) + 8 * v9);
        v22[0] = &unk_26E18EA90;
        int v11 = NSNumber;
        uint64_t v12 = objc_msgSend(v10, "data", v16);
        id v13 = objc_msgSend(v11, "numberWithUnsignedInteger:", objc_msgSend(v12, "length"));
        v22[1] = &unk_26E18EAA8;
        v23[0] = v13;
        uint64_t v14 = [v10 type];
        v23[1] = v14;
        __int16 v15 = [NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:2];

        [v5 addObject:v15];
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [obj countByEnumeratingWithState:&v18 objects:v24 count:16];
    }
    while (v7);
  }

  [v16 setObject:v5 forKey:&unk_26E18EAC0];
}

uint64_t SidecarMessageGetType(void *a1)
{
  id v1 = [a1 objectForKey:&unk_26E18EAD8];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v2 = [v1 integerValue];
    if ((unint64_t)(v2 - 1) >= 4) {
      uint64_t v3 = 0;
    }
    else {
      uint64_t v3 = v2;
    }
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

void SidecarMessageSetType(void *a1, uint64_t a2)
{
  uint64_t v3 = NSNumber;
  id v4 = a1;
  id v5 = [v3 numberWithInteger:a2];
  [v4 setObject:v5 forKey:&unk_26E18EAD8];
}

id SidecarMessageGetServiceName(void *a1)
{
  id v1 = [a1 objectForKey:&unk_26E18EAF0];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v2 = v1;
  }
  else {
    uint64_t v2 = 0;
  }
  id v3 = v2;

  return v3;
}

uint64_t SidecarMessageSetServiceName(void *a1, const char *a2)
{
  return [a1 setObject:a2 forKey:&unk_26E18EAF0];
}

uint64_t SidecarMessageGetRequestID(void *a1)
{
  id v1 = [a1 objectForKey:&unk_26E18EB08];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v2 = [v1 integerValue];
  }
  else {
    uint64_t v2 = 0;
  }

  return v2;
}

void SidecarMessageSetRequestID(void *a1, uint64_t a2)
{
  id v3 = NSNumber;
  id v4 = a1;
  id v5 = [v3 numberWithInteger:a2];
  [v4 setObject:v5 forKey:&unk_26E18EB08];
}

uint64_t SidecarMessageGetTransferID(void *a1)
{
  id v1 = [a1 objectForKey:&unk_26E18EB20];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v2 = [v1 integerValue];
  }
  else {
    uint64_t v2 = 0;
  }

  return v2;
}

void SidecarMessageSetTransferID(void *a1, uint64_t a2)
{
  id v3 = NSNumber;
  id v4 = a1;
  id v5 = [v3 numberWithInteger:a2];
  [v4 setObject:v5 forKey:&unk_26E18EB20];
}

SidecarMapTable *SidecarMapTableCreateStrong()
{
  uint64_t v0 = [[SidecarMapTable alloc] initWithKeyMask:0x7FFFFFFFLL weakObjects:0];

  return v0;
}

SidecarMapTable *SidecarMapTableCreateWeak()
{
  uint64_t v0 = [[SidecarMapTable alloc] initWithKeyMask:0x7FFFFFFFLL weakObjects:1];

  return v0;
}

uint64_t SidecarMapTableAddObject(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uint64_t Handle = SidecarMapTableGetHandle((uint64_t)v3, (uint64_t)v4);
  if (!Handle)
  {
    id v6 = v3;
    do
    {
      uint32_t v7 = arc4random();
      uint64_t Handle = v7 & 0x7FFFFFFF;
      if ((v7 & 0x7FFFFFFF) == 0) {
        break;
      }
      uint64_t v8 = SidecarMapTableGetObject((uint64_t)v6, Handle);
    }
    while (v8);

    SidecarMapTableReplaceObject(v6, Handle, v4);
  }

  return Handle;
}

uint64_t SidecarMapTableGetHandle(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = [*(id *)(a1 + 24) objectForKey:a2];
  id v3 = v2;
  if (v2) {
    uint64_t v4 = [v2 integerValue];
  }
  else {
    uint64_t v4 = 0;
  }

  return v4;
}

id SidecarMapTableGetObject(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)(a1 + 16);
  id v3 = [NSNumber numberWithInteger:a2];
  uint64_t v4 = [v2 objectForKey:v3];

  return v4;
}

void SidecarMapTableReplaceObject(void *a1, uint64_t a2, void *a3)
{
  uint64_t v8 = a1;
  id v5 = a3;
  id v6 = SidecarMapTableRemoveObject(v8, a2);
  if (v5)
  {
    uint32_t v7 = [NSNumber numberWithInteger:a2];
    [v8[3] setObject:v7 forKey:v5];
    [v8[2] setObject:v5 forKey:v7];
  }
}

id SidecarMapTableRemoveObject(void *a1, uint64_t a2)
{
  id v3 = a1;
  uint64_t v4 = SidecarMapTableGetObject((uint64_t)v3, a2);
  if (v4)
  {
    id v5 = [NSNumber numberWithInteger:a2];
    [v3[3] removeObjectForKey:v4];
    [v3[2] removeObjectForKey:v5];
  }

  return v4;
}

uint64_t SidecarMapTableGetCount(uint64_t a1)
{
  return [*(id *)(a1 + 16) count];
}

uint64_t SidecarMapTableRemoveAllObjects(void *a1)
{
  id v1 = (void *)a1[3];
  uint64_t v2 = a1;
  [v1 removeAllObjects];
  id v3 = (void *)v2[2];

  return [v3 removeAllObjects];
}

void SidecarMapTableIterateObjects(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = a2;
  memset(&enumerator, 0, sizeof(enumerator));
  NSEnumerateMapTable(&enumerator, v3[2]);
  value = 0;
  key = 0;
  while (NSNextMapEnumeratorPair(&enumerator, &key, &value))
  {
    uint64_t v5 = [key integerValue];
    if (value) {
      v4[2](v4, v5);
    }
  }
  NSEndMapTableEnumeration(&enumerator);
}

void sub_22D95E938(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43)
{
}

uint64_t __Block_byref_object_copy__474(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__475(uint64_t a1)
{
}

id SidecarDevicesForService(void *a1)
{
  id v1 = a1;
  uint64_t v2 = SidecarRelayProxySync((uint64_t)SidecarDevicesForService, 0);
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__474;
  int v11 = __Block_byref_object_dispose__475;
  id v12 = 0;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __SidecarDevicesForService_block_invoke;
  v6[3] = &unk_2649C6078;
  v6[4] = &v7;
  [v2 relayDevicesForServiceIdentifier:v1 completion:v6];
  id v3 = (void *)v8[5];
  if (!v3) {
    id v3 = (void *)MEMORY[0x263EFFA68];
  }
  id v4 = v3;
  _Block_object_dispose(&v7, 8);

  return v4;
}

void sub_22D95EC40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __SidecarDevicesForService_block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v9 = SidecarCoreLogSubsystem(OS_LOG_TYPE_ERROR);
    if (v9)
    {
      log = v9;
      BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
      uint64_t v9 = log;
      if (v10)
      {
        int v11 = [v6 domain];
        uint64_t v12 = [v6 code];
        id v13 = [v6 localizedDescription];
        *(_DWORD *)buf = 138543875;
        id v16 = v11;
        __int16 v17 = 2048;
        uint64_t v18 = v12;
        __int16 v19 = 2113;
        long long v20 = v13;
        _os_log_impl(&dword_22D954000, log, OS_LOG_TYPE_ERROR, "%{public}@ (%ld) %{private}@", buf, 0x20u);

        uint64_t v9 = log;
      }
    }
  }
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
}

void __SidecarDeviceGeneration_block_invoke()
{
}

void __SidecarDeviceGeneration_block_invoke_2()
{
  id v0 = [MEMORY[0x263F08A00] defaultCenter];
  [v0 postNotificationName:@"SidecarDevicesChangedNotification" object:0];
}

unint64_t SidecarDeviceGeneration()
{
  return atomic_load(&SidecarDeviceState);
}

id SidecarLocalizedString(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v9 = a1;
  BOOL v10 = SidecarCoreBundle();
  int v11 = [v10 localizedStringForKey:v9 value:0 table:0];

  uint64_t v12 = (void *)[[NSString alloc] initWithFormat:v11 arguments:&a9];

  return v12;
}

id SidecarLocalizedWirelessString(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v9 = a1;
  if (SidecarLocalizedWirelessString_onceToken != -1) {
    dispatch_once(&SidecarLocalizedWirelessString_onceToken, &__block_literal_global_596);
  }
  if (SidecarLocalizedWirelessString_usesWAPI)
  {
    id v10 = [v9 stringByAppendingString:@"_WLAN"];
  }
  else
  {
    id v10 = v9;
  }
  uint64_t v18 = v10;
  __int16 v19 = SidecarLocalizedString(v10, v11, v12, v13, v14, v15, v16, v17, (uint64_t)&a9);

  return v19;
}

uint64_t __SidecarLocalizedWirelessString_block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  SidecarLocalizedWirelessString_usesWAPI = result;
  return result;
}

void validateXPCCoder(void *a1, void *a2, void *a3)
{
  id v11 = a1;
  id v5 = a3;
  id v6 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    uint64_t v8 = (void *)MEMORY[0x263EFF940];
    id v9 = (objc_class *)objc_opt_class();
    id v10 = NSStringFromClass(v9);
    [v8 raise:v5, @"%@ only supports coding for XPC", v10 format];
  }
}

double decodeDouble(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  if ([v4 allowsKeyedCoding])
  {
    [v4 decodeDoubleForKey:v3];
    double v6 = v5;
  }
  else
  {
    double v8 = 0.0;
    [v4 decodeValueOfObjCType:"d" at:&v8 size:8];

    double v6 = v8;
  }

  return v6;
}

void encodeDouble(void *a1, void *a2, double a3)
{
  id v5 = a2;
  double v7 = a3;
  id v6 = a1;
  if ([v6 allowsKeyedCoding]) {
    [v6 encodeDouble:v5 forKey:a3];
  }
  else {
    [v6 encodeValueOfObjCType:"d" at:&v7];
  }
}

uint64_t decodeInteger(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  if ([v4 allowsKeyedCoding])
  {
    uint64_t v5 = [v4 decodeIntegerForKey:v3];
  }
  else
  {
    uint64_t v7 = 0;
    [v4 decodeValueOfObjCType:"q" at:&v7 size:8];

    uint64_t v5 = v7;
  }

  return v5;
}

void encodeInteger(void *a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v7 = a3;
  id v6 = a1;
  if ([v6 allowsKeyedCoding]) {
    [v6 encodeInteger:a3 forKey:v5];
  }
  else {
    [v6 encodeValueOfObjCType:"q" at:&v7];
  }
}

id decodeObject(void *a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = a1;
  if ([v6 allowsKeyedCoding])
  {
    id v7 = [v6 decodeObjectOfClass:a3 forKey:v5];
  }
  else
  {
    uint64_t v8 = [v6 decodeObject];

    if (objc_opt_isKindOfClass()) {
      id v9 = (void *)v8;
    }
    else {
      id v9 = 0;
    }
    id v7 = v9;
    id v6 = (id)v8;
  }

  return v7;
}

void encodeObject(void *a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  id v6 = a1;
  if ([v6 allowsKeyedCoding]) {
    [v6 encodeObject:v5 forKey:v7];
  }
  else {
    [v6 encodeObject:v5];
  }
}

id SidecarSessionWithHandle(uint64_t a1, int a2)
{
  if (a2)
  {
    SidecarSessionGetFromRemoteMapTable(a1);
    id v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v5 = 0;
    id v6 = &v5;
    uint64_t v7 = 0x3032000000;
    uint64_t v8 = __Block_byref_object_copy__686;
    id v9 = __Block_byref_object_dispose__687;
    id v10 = 0;
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __SidecarSessionGetFromLocalMapTable_block_invoke;
    v4[3] = &unk_2649C62B0;
    v4[4] = &v5;
    v4[5] = a1;
    SidecarSessionWithMapTable((void (*)(void))SidecarMapTableCreateWeak, &__SidecarSessionLocalMapTable, v4);
    id v2 = (id)v6[5];
    _Block_object_dispose(&v5, 8);
  }

  return v2;
}

void sub_22D961D3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id SidecarSessionGetFromRemoteMapTable(uint64_t a1)
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x3032000000;
  uint64_t v7 = __Block_byref_object_copy__686;
  uint64_t v8 = __Block_byref_object_dispose__687;
  id v9 = 0;
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __SidecarSessionGetFromRemoteMapTable_block_invoke;
  v3[3] = &unk_2649C62B0;
  void v3[4] = &v4;
  v3[5] = a1;
  SidecarSessionWithMapTable((void (*)(void))SidecarMapTableCreateStrong, &__SidecarSessionRemoteMapTable, v3);
  id v1 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_22D961E54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__686(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__687(uint64_t a1)
{
}

uint64_t __SidecarSessionGetFromLocalMapTable_block_invoke(uint64_t a1, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = SidecarMapTableGetObject(a2, *(void *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

void SidecarSessionWithMapTable(void (*a1)(void), uint64_t *a2, void *a3)
{
  uint64_t v5 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&SidecarSessionWithMapTable_lock);
  if (!*a2)
  {
    *a2 = a1();
  }
  v5[2]();
  os_unfair_lock_unlock((os_unfair_lock_t)&SidecarSessionWithMapTable_lock);
}

uint64_t __SidecarSessionGetFromRemoteMapTable_block_invoke(uint64_t a1, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = SidecarMapTableGetObject(a2, *(void *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

void sub_22D962734(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

id sessionCompletion(void *a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __sessionCompletion_block_invoke;
  void v10[3] = &unk_2649C6570;
  id v11 = v5;
  uint64_t v12 = a2;
  v10[4] = a1;
  id v6 = v5;
  id v7 = a1;
  uint64_t v8 = (void *)MEMORY[0x230F8F310](v10);

  return v8;
}

void __sessionCompletion_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = *(const char **)(a1 + 48);
    id v5 = *(id *)(a1 + 32);
    id v6 = v3;
    if (v5) {
      BOOL v7 = v4 == 0;
    }
    else {
      BOOL v7 = 1;
    }
    if (v7)
    {
      id v9 = SidecarCoreLogSubsystem(OS_LOG_TYPE_ERROR);
      if (v9)
      {
        log = v9;
        BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
        id v9 = log;
        if (v10)
        {
          id v11 = [v6 domain];
          uint64_t v12 = [v6 code];
          uint64_t v13 = [v6 localizedDescription];
          *(_DWORD *)buf = 138543875;
          __int16 v19 = v11;
          __int16 v20 = 2048;
          uint64_t v21 = v12;
          __int16 v22 = 2113;
          v23 = v13;
          _os_log_impl(&dword_22D954000, log, OS_LOG_TYPE_ERROR, "%{public}@ (%ld) %{private}@", buf, 0x20u);

          id v9 = log;
        }
      }
    }
    else
    {
      _SidecarCoreLogObjCAPIError(v5, v4, v6);
    }
  }
  if (*(void *)(a1 + 40))
  {
    uint64_t v8 = [*(id *)(a1 + 32) queue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __sessionCompletion_block_invoke_2;
    block[3] = &unk_2649C6348;
    id v17 = *(id *)(a1 + 40);
    id v16 = v3;
    dispatch_async(v8, block);
  }
}

uint64_t __sessionCompletion_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

atomic_ullong *SidecarSessionSetState(void *a1, int64_t a2)
{
  uint64_t result = a1;
  int64_t v4 = atomic_exchange(result + 9, a2);
  if (v4 > a2)
  {
    __break(1u);
  }
  else
  {
    BOOL v5 = v4 != a2;

    return (atomic_ullong *)v5;
  }
  return result;
}

id __SidecarSessionRemoveFromRemoteMapTable_block_invoke(uint64_t a1, void *a2)
{
  return SidecarMapTableRemoveObject(a2, *(void *)(a1 + 32));
}

id __SidecarSessionRemoveFromLocalMapTable_block_invoke(uint64_t a1, void *a2)
{
  return SidecarMapTableRemoveObject(a2, *(void *)(a1 + 32));
}

void sub_22D9638B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __SidecarSessionAddToLocalMapTable_block_invoke(uint64_t a1, void *a2)
{
  v10[2] = *MEMORY[0x263EF8340];
  id v3 = a2;
  do
  {
    uint64_t v4 = objc_opt_new();
    uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
    id v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;

    BOOL v7 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    v10[0] = 0;
    v10[1] = 0;
    [v7 getUUIDBytes:v10];
    uint64_t v8 = bswap32(v10[0]);
    id v9 = SidecarMapTableGetObject((uint64_t)v3, v8);
  }
  while (v9);
  SidecarMapTableReplaceObject(v3, v8, *(void **)(a1 + 32));
}

void __SidecarSessionAddToRemoteMapTable_block_invoke(uint64_t a1, void *a2)
{
}

id SidecarOPACKEncode(void *a1, void *a2)
{
  id v3 = a1;
  if (_SidecarOPACKInit_once != -1) {
    dispatch_once(&_SidecarOPACKInit_once, &__block_literal_global_765);
  }
  int v6 = 0;
  uint64_t v4 = (void *)_SidecarOPACKEncode(v3, 0, &v6);
  if (a2 && v6)
  {
    *a2 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:v6 userInfo:0];
  }

  return v4;
}

uint64_t _SidecarOPACKStub(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  *a3 = -6718;
  return 0;
}

id SidecarOPACKDecode(void *a1, void *a2)
{
  id v3 = a1;
  if (_SidecarOPACKInit_once != -1) {
    dispatch_once(&_SidecarOPACKInit_once, &__block_literal_global_765);
  }
  int v6 = 0;
  uint64_t v4 = (void *)_SidecarOPACKDecode(v3, 0, &v6);
  if (a2 && v6)
  {
    *a2 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:v6 userInfo:0];
  }

  return v4;
}

void *_SidecarAssociatedQueueAlloc(void *a1, const void *a2)
{
  id v3 = a1;
  uint64_t v4 = malloc_type_malloc(0x10uLL, 0xA0040AFF93C70uLL);
  *uint64_t v4 = 0;
  v4[1] = v4;
  objc_setAssociatedObject(v3, a2, v4, 0);

  return v4;
}

void _SidecarAssociatedQueueDealloc(void *a1, const void *a2, void *a3)
{
  id v5 = a1;
  if (*a3)
  {
    __break(1u);
  }
  else
  {
    id object = v5;
    free(a3);
    objc_setAssociatedObject(object, a2, 0, 0);
  }
}

void SidecarRegisterStateNotification()
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __SidecarRegisterStateNotification_block_invoke;
  v2[3] = &unk_2649C6398;
  char v3 = 1;
  v2[5] = "com.apple.sidecar-relay.device-generation";
  v2[6] = &SidecarDeviceState;
  v2[4] = &__block_literal_global_473;
  uint64_t v0 = qword_26858EAA8[0];
  id v1 = &__block_literal_global_473;
  if (v0 != -1) {
    dispatch_once(qword_26858EAA8, v2);
  }
}

void __SidecarRegisterStateNotification_block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 56))
  {
    uid_t v2 = getuid();
    asprintf((char **)(a1 + 40), "user.uid.%d.%s", v2, *(const char **)(a1 + 40));
  }
  char v3 = *(const char **)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  id v5 = dispatch_get_global_queue(21, 0);
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __SidecarRegisterStateNotification_block_invoke_2;
  handler[3] = &unk_2649C6370;
  handler[4] = *(void *)(a1 + 32);
  handler[5] = v4;
  notify_register_dispatch(v3, (int *)(v4 + 16), v5, handler);

  if (*(unsigned char *)(a1 + 56)) {
    free(*(void **)(a1 + 40));
  }
  SidecarUpdateStateNotification(*(void *)(a1 + 48), 0);
}

void __SidecarRegisterStateNotification_block_invoke_2(uint64_t a1)
{
}

void SidecarUpdateStateNotification(uint64_t a1, void *a2)
{
  char v3 = a2;
  uint64_t state64 = 0;
  notify_get_state(*(_DWORD *)(a1 + 16), &state64);
  unint64_t v4 = atomic_exchange((atomic_ullong *volatile)a1, state64);
  if (v3 && v4 != state64) {
    v3[2](v3);
  }
}

double __SidecarTimeScale_block_invoke()
{
  kern_return_t v0;
  unint64_t v1;
  unint64_t v2;
  double result;
  kern_return_t v4;
  mach_timebase_info info;
  uint8_t buf[4];
  kern_return_t v7;
  uint64_t v8;

  uint64_t v8 = *MEMORY[0x263EF8340];
  info = 0;
  uint64_t v0 = mach_timebase_info(&info);
  if (v0)
  {
    unint64_t v4 = v0;
    if (os_log_type_enabled(0, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      BOOL v7 = v4;
      _os_log_impl(&dword_22D954000, 0, OS_LOG_TYPE_ERROR, "%{mach.errno}d", buf, 8u);
    }
  }
  LODWORD(v1) = info.numer;
  LODWORD(v2) = info.denom;
  uint64_t result = (double)v1 / (double)v2 * 0.000000001;
  SidecarTimeScale_scale = *(void *)&result;
  return result;
}

double SidecarAbsoluteTime()
{
  uint64_t v0 = mach_absolute_time();
  if (SidecarTimeScale_once != -1) {
    dispatch_once(&SidecarTimeScale_once, &__block_literal_global_781);
  }
  return *(double *)&SidecarTimeScale_scale * (double)v0;
}

id filterTargetDevice(void *a1, void *a2, uint64_t a3)
{
  id v5 = a1;
  id v6 = a2;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__864;
  id v16 = __Block_byref_object_dispose__865;
  id v17 = 0;
  BOOL v7 = [v6 identifier];
  uint64_t v8 = [v5 _devicesByForcingFetchFromRelay:a3];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __filterTargetDevice_block_invoke;
  v11[3] = &unk_2649C6440;
  v11[4] = v7;
  v11[5] = &v12;
  [v8 enumerateObjectsUsingBlock:v11];
  id v9 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v9;
}

void sub_22D96494C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

SidecarRequest *makeRequest(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if (v4
    || ([v3 devices],
        id v5 = objc_claimAutoreleasedReturnValue(),
        [v5 firstObject],
        id v4 = (id)objc_claimAutoreleasedReturnValue(),
        v5,
        v4))
  {
    id v6 = [[SidecarRequest alloc] initWithService:v3 device:v4];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

uint64_t __Block_byref_object_copy__864(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__865(uint64_t a1)
{
}

void __filterTargetDevice_block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v8 = a2;
  BOOL v7 = [v8 identifier];
  *a4 = [v7 isEqual:*(void *)(a1 + 32)];

  if (*a4) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
}

BOOL __filterSupportedDevices_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  return [a2 rapportVersion] >= v2;
}

void __filterDevices_block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 40) + 16))()) {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

uint64_t isSidecarInternal()
{
  uint64_t v0 = [MEMORY[0x263EFFA40] standardUserDefaults];
  uint64_t v1 = [v0 BOOLForKey:@"com.apple.sidecar.internal"];

  return v1;
}

__CFString *SidecarDeviceVisualDetectabilityAsNSString(unint64_t a1)
{
  if (a1 > 2) {
    return @"UnrecognizedValue";
  }
  else {
    return off_2649C6460[a1];
  }
}

void SidecarRegisterServicePresenter(void *a1)
{
  id v1 = a1;
  uint64_t v2 = SidecarQueue();
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __SidecarRegisterServicePresenter_block_invoke;
  block[3] = &unk_2649C64F0;
  void block[4] = v1;
  dispatch_async(v2, block);
}

void __SidecarRegisterServicePresenter_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = +[SidecarCoreProxy defaultProxy];
  [v2 setPresenterDelegate:v1];

  SidecarRelayProxyAsync((uint64_t)SidecarRegisterServicePresenter, 0);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v3 relayRegisterServicePresenter:&__block_literal_global_1045];
}

void __SidecarRegisterServicePresenter_block_invoke_2(uint64_t a1, void *a2)
{
  if (a2) {
    _SidecarCoreLogAPIError(SidecarRegisterServicePresenter, a2);
  }
}

void SidecarServicePresenterReady(uint64_t a1)
{
  uint64_t v2 = SidecarQueue();
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __SidecarServicePresenterReady_block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  void block[4] = a1;
  dispatch_async(v2, block);
}

void __SidecarServicePresenterReady_block_invoke(uint64_t a1)
{
  SidecarRelayProxyAsync((uint64_t)SidecarServicePresenterReady, 0);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 relayServicePresenterReady:*(void *)(a1 + 32) completion:&__block_literal_global_3];
}

void __SidecarServicePresenterReady_block_invoke_2(uint64_t a1, void *a2)
{
  if (a2) {
    _SidecarCoreLogAPIError(SidecarServicePresenterReady, a2);
  }
}

void SidecarCoreLogObjCAPIError(void *a1, const char *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a1;
  id v6 = a3;
  BOOL v7 = v6;
  if (v6)
  {
    if (v5 && a2)
    {
      _SidecarCoreLogObjCAPIError(v5, a2, v6);
    }
    else
    {
      id v8 = v6;
      id v9 = SidecarCoreLogSubsystem(OS_LOG_TYPE_ERROR);
      BOOL v10 = v9;
      if (v9 && os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        id v11 = [v8 domain];
        uint64_t v12 = [v8 code];
        uint64_t v13 = [v8 localizedDescription];
        int v14 = 138543875;
        uint64_t v15 = v11;
        __int16 v16 = 2048;
        uint64_t v17 = v12;
        __int16 v18 = 2113;
        __int16 v19 = v13;
        _os_log_impl(&dword_22D954000, v10, OS_LOG_TYPE_ERROR, "%{public}@ (%ld) %{private}@", (uint8_t *)&v14, 0x20u);
      }
    }
  }
}

void streamCompletion(void *a1, const char *a2, void *a3, void *a4, void *a5)
{
  id v9 = a1;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (v11)
  {
    SidecarCoreLogObjCAPIError(v9, a2, v11);
    [v10 invalidate];
  }
  else if (v10)
  {
    id v13 = v10;
    id v14 = v9;
    uint64_t v15 = SidecarSessionGetStreams(v14, 1);
    [v15 setObject:v13 forKey:*((void *)v13 + 1)];
    objc_storeWeak((id *)v13 + 4, v14);

    __int16 v16 = [v13 rapportStream];
    objc_msgSend(v16, "setStreamFlags:", objc_msgSend(v16, "streamFlags") | 4);
  }
  uint64_t v17 = [v9 queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __streamCompletion_block_invoke;
  block[3] = &unk_2649C66E0;
  void block[5] = v10;
  block[6] = v12;
  void block[4] = v11;
  dispatch_async(v17, block);
}

uint64_t __streamCompletion_block_invoke(void *a1)
{
  uint64_t v2 = a1[6];
  if (a1[4]) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = a1[5];
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 16))(v2, v3);
}

id SidecarSessionGetStreams(void *a1, int a2)
{
  id v3 = a1;
  objc_getAssociatedObject(v3, SidecarSessionGetStreams);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  if (!v4 && a2)
  {
    id v4 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    objc_setAssociatedObject(v3, SidecarSessionGetStreams, v4, (void *)0x301);
  }

  return v4;
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x270F95FB8]();
}

uint64_t NSClassFromObject()
{
  return MEMORY[0x270EF2A48]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x270EF2A50](aClassName);
}

void NSEndMapTableEnumeration(NSMapEnumerator *enumerator)
{
}

NSMapEnumerator *__cdecl NSEnumerateMapTable(NSMapEnumerator *__return_ptr retstr, NSMapTable *table)
{
  return (NSMapEnumerator *)MEMORY[0x270EF2A80](retstr, table);
}

BOOL NSEqualSizes(NSSize aSize, NSSize bSize)
{
  return MEMORY[0x270EF2A98]((__n128)aSize, *(__n128 *)&aSize.height, (__n128)bSize, *(__n128 *)&bSize.height);
}

BOOL NSNextMapEnumeratorPair(NSMapEnumerator *enumerator, void **key, void **value)
{
  return MEMORY[0x270EF2B60](enumerator, key, value);
}

uint64_t NSRequestConcreteImplementation()
{
  return MEMORY[0x270EF2BB8]();
}

NSSize NSSizeFromString(NSString *aString)
{
  MEMORY[0x270EF2BF0](aString);
  result.height = v2;
  result.width = v1;
  return result;
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x270EF2C38](aSelector);
}

NSString *__cdecl NSStringFromSize(NSSize aSize)
{
  return (NSString *)MEMORY[0x270EF2C40]((__n128)aSize, *(__n128 *)&aSize.height);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _NSRequestConcreteObject()
{
  return MEMORY[0x270EF2CB8]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint32_t arc4random(void)
{
  return MEMORY[0x270ED85E0]();
}

int asprintf(char **a1, const char *a2, ...)
{
  return MEMORY[0x270ED8688](a1, a2);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9458](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

int dladdr(const void *a1, Dl_info *a2)
{
  return MEMORY[0x270ED9610](a1, a2);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x270ED9628](__path, *(void *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x270ED9648](__handle, __symbol);
}

void free(void *a1)
{
}

pid_t getpid(void)
{
  return MEMORY[0x270ED9CE0]();
}

uid_t getuid(void)
{
  return MEMORY[0x270ED9DA0]();
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x270EDA138]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x270EDA288](info);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x270EDA748](*(void *)&token, state64);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x270EDA770](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_throw(id exception)
{
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x270F9A648](object, key);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

int proc_pidinfo(int pid, int flavor, uint64_t arg, void *buffer, int buffersize)
{
  return MEMORY[0x270EDAD78](*(void *)&pid, *(void *)&flavor, arg, buffer, *(void *)&buffersize);
}