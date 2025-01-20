@interface MRTransactionSource
- (MRPlayerPath)playerPath;
- (MRTransactionSource)initWithName:(unint64_t)a3 playerPath:(id)a4 packets:(id)a5 delegate:(id)a6;
- (unint64_t)name;
- (void)_begin;
- (void)_processMessage:(id)a3;
@end

@implementation MRTransactionSource

- (MRTransactionSource)initWithName:(unint64_t)a3 playerPath:(id)a4 packets:(id)a5 delegate:(id)a6
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v26.receiver = self;
  v26.super_class = (Class)MRTransactionSource;
  v14 = [(MRTransactionSource *)&v26 init];
  v15 = v14;
  if (v14)
  {
    v14->_name = a3;
    objc_storeStrong((id *)&v14->_playerPath, a4);
    v16 = objc_alloc_init(MRTransactionPacketizer);
    packetizer = v15->_packetizer;
    v15->_packetizer = v16;

    uint64_t v18 = [v12 mutableCopy];
    packets = v15->_packets;
    v15->_packets = (NSMutableArray *)v18;

    objc_storeStrong((id *)&v15->_delegate, a6);
    objc_initWeak(&location, v15);
    v20 = +[MRMediaRemoteServiceClient sharedServiceClient];
    v21 = [v20 workerQueue];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __64__MRTransactionSource_initWithName_playerPath_packets_delegate___block_invoke;
    v23[3] = &unk_1E57D12D0;
    objc_copyWeak(&v24, &location);
    dispatch_async(v21, v23);

    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
  }

  return v15;
}

void __64__MRTransactionSource_initWithName_playerPath_packets_delegate___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _begin];
}

- (void)_begin
{
  v3 = MRCreateXPCMessage(0x100000000000009uLL);
  xpc_dictionary_set_uint64(v3, "MRXPC_TRANSACTION_NAME", self->_name);
  MRAddPlayerPathToXPCMessage(v3, self->_playerPath);
  objc_initWeak(&location, self);
  v4 = +[MRMediaRemoteServiceClient sharedServiceClient];
  v5 = [v4 service];

  v6 = MRMediaRemoteServiceGetConnection(v5);
  v7 = [v6 connection];
  v8 = +[MRMediaRemoteServiceClient sharedServiceClient];
  v9 = [v8 workerQueue];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __29__MRTransactionSource__begin__block_invoke;
  v10[3] = &unk_1E57D52A0;
  objc_copyWeak(&v11, &location);
  xpc_connection_send_message_with_reply(v7, v3, v9, v10);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __29__MRTransactionSource__begin__block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _processMessage:v3];
}

- (void)_processMessage:(id)a3
{
  id v5 = a3;
  v6 = v5;
  if (v5 == (id)MEMORY[0x1E4F14520] || v5 == (id)MEMORY[0x1E4F14528])
  {
    v8 = _MRLogForCategory(0);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[MRTransactionSource _processMessage:]((uint64_t)self);
    }

    [(MRTransactionSourceDelegate *)self->_delegate transactionDidEnd:self];
  }
  else
  {
    uint64_t v9 = xpc_dictionary_get_remote_connection(v5);
    v10 = (void *)v9;
    if (v9)
    {
      xpc_object_t reply = xpc_dictionary_create_reply(v6);
      if (reply)
      {
        uint64_t uint64 = xpc_dictionary_get_uint64(v6, "MRXPC_TRANSACTION_DATA_REQUESTED_SIZE");
        if (!uint64)
        {
          v17 = [MEMORY[0x1E4F28B00] currentHandler];
          [v17 handleFailureInMethod:a2 object:self file:@"MRTransaction.m" lineNumber:367 description:@"requested size is 0"];
        }
        id v13 = (void *)[(NSMutableArray *)self->_packets copy];
        [(NSMutableArray *)self->_packets removeAllObjects];
        packetizer = self->_packetizer;
        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 3221225472;
        v18[2] = __39__MRTransactionSource__processMessage___block_invoke;
        v18[3] = &unk_1E57D7238;
        uint64_t v22 = uint64;
        id v19 = reply;
        v20 = self;
        id v21 = v10;
        [(MRTransactionPacketizer *)packetizer packetize:v13 packageSize:uint64 completion:v18];
      }
      else
      {
        v16 = _MRLogForCategory(0);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
          -[MRTransactionSource _processMessage:]((uint64_t)self);
        }

        [(MRTransactionSourceDelegate *)self->_delegate transactionDidEnd:self];
      }
    }
    else
    {
      v15 = _MRLogForCategory(0);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        -[MRTransactionSource _processMessage:]((uint64_t)self);
      }

      [(MRTransactionSourceDelegate *)self->_delegate transactionDidEnd:self];
    }
  }
}

void __39__MRTransactionSource__processMessage___block_invoke(uint64_t a1, void *a2, char a3)
{
  id v5 = a2;
  v6 = MRTransactionPacketsCreateExternalRepresentation(v5);
  v7 = v6;
  if (v6)
  {
    v8 = *(void **)(a1 + 32);
    id v9 = v6;
    xpc_dictionary_set_data(v8, "MRXPC_TRANSACTION_DATA", (const void *)[v9 bytes], objc_msgSend(v9, "length"));
    xpc_dictionary_set_uint64(*(xpc_object_t *)(a1 + 32), "MRXPC_TRANSACTION_DATA_REQUESTED_SIZE", *(void *)(a1 + 56));
  }
  v10 = _MRLogForCategory(0);
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG);
  if (a3)
  {
    if (v11) {
      __39__MRTransactionSource__processMessage___block_invoke_cold_1(a1, v5);
    }

    objc_initWeak(&location, *(id *)(a1 + 40));
    id v12 = *(_xpc_connection_s **)(a1 + 48);
    id v13 = *(void **)(a1 + 32);
    v14 = +[MRMediaRemoteServiceClient sharedServiceClient];
    v15 = [v14 workerQueue];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __39__MRTransactionSource__processMessage___block_invoke_146;
    v16[3] = &unk_1E57D52A0;
    objc_copyWeak(&v17, &location);
    xpc_connection_send_message_with_reply(v12, v13, v15, v16);

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
  else
  {
    if (v11) {
      __39__MRTransactionSource__processMessage___block_invoke_cold_2(a1, v5);
    }

    xpc_dictionary_set_BOOL(*(xpc_object_t *)(a1 + 32), "MRXPC_TRANSACTION_ENDED", 1);
    xpc_connection_send_message(*(xpc_connection_t *)(a1 + 48), *(xpc_object_t *)(a1 + 32));
    objc_msgSend(*(id *)(*(void *)(a1 + 40) + 32), "transactionDidEnd:");
  }
}

void __39__MRTransactionSource__processMessage___block_invoke_146(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _processMessage:v3];
}

- (unint64_t)name
{
  return self->_name;
}

- (MRPlayerPath)playerPath
{
  return self->_playerPath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playerPath, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_packets, 0);

  objc_storeStrong((id *)&self->_packetizer, 0);
}

- (void)_processMessage:(uint64_t)a1 .cold.1(uint64_t a1)
{
  v1 = MRTransactionNameGetDescription(*(void *)(a1 + 8));
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_0_14(&dword_194F3C000, v2, v3, "[MRTransactionSource] Source %@ received interrupted/invalid connection to query", v4, v5, v6, v7, v8);
}

- (void)_processMessage:(uint64_t)a1 .cold.2(uint64_t a1)
{
  v1 = MRTransactionNameGetDescription(*(void *)(a1 + 8));
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_0_14(&dword_194F3C000, v2, v3, "[MRTransactionSource] Source %@ could not extract connection", v4, v5, v6, v7, v8);
}

- (void)_processMessage:(uint64_t)a1 .cold.3(uint64_t a1)
{
  v1 = MRTransactionNameGetDescription(*(void *)(a1 + 8));
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_0_14(&dword_194F3C000, v2, v3, "[MRTransactionSource] Source %@ could not extract reply", v4, v5, v6, v7, v8);
}

void __39__MRTransactionSource__processMessage___block_invoke_cold_1(uint64_t a1, void *a2)
{
  uint64_t v3 = MRTransactionNameGetDescription(*(void *)(*(void *)(a1 + 40) + 8));
  uint64_t v4 = MRTransactionPacketsGetKeys(a2);
  OUTLINED_FUNCTION_2_5();
  OUTLINED_FUNCTION_3_2(&dword_194F3C000, v5, v6, "[MRTransactionSource] %@ sending packets: %@", v7, v8, v9, v10, v11);
}

void __39__MRTransactionSource__processMessage___block_invoke_cold_2(uint64_t a1, void *a2)
{
  uint64_t v3 = MRTransactionNameGetDescription(*(void *)(*(void *)(a1 + 40) + 8));
  uint64_t v4 = MRTransactionPacketsGetKeys(a2);
  OUTLINED_FUNCTION_2_5();
  OUTLINED_FUNCTION_3_2(&dword_194F3C000, v5, v6, "[MRTransactionSource] %@ sending end signal with packets %@", v7, v8, v9, v10, v11);
}

@end