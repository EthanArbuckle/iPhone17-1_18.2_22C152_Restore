@interface MRTransactionDestination
- (MRPlayerPath)playerPath;
- (MRTransactionDestination)initWithName:(unint64_t)a3 playerPath:(id)a4;
- (unint64_t)name;
- (void)packetsFromMessage:(id)a3 completion:(id)a4;
- (void)unpacketize:(id)a3 completion:(id)a4;
@end

@implementation MRTransactionDestination

- (MRTransactionDestination)initWithName:(unint64_t)a3 playerPath:(id)a4
{
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MRTransactionDestination;
  v8 = [(MRTransactionDestination *)&v14 init];
  v9 = v8;
  if (v8)
  {
    v8->_name = a3;
    v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v11 = dispatch_queue_create("com.apple.MediaRemote.transactionDestinationQueue", v10);
    serialQueue = v9->_serialQueue;
    v9->_serialQueue = (OS_dispatch_queue *)v11;

    objc_storeStrong((id *)&v9->_playerPath, a4);
  }

  return v9;
}

- (void)packetsFromMessage:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __58__MRTransactionDestination_packetsFromMessage_completion___block_invoke;
  v21[3] = &unk_1E57D7260;
  id v7 = v6;
  id v22 = v7;
  v23 = self;
  v8 = (UInt8 *)a4;
  v9 = (void *)MEMORY[0x1997190F0](v21);
  if (v7 == (id)MEMORY[0x1E4F14520] || v7 == (id)MEMORY[0x1E4F14528])
  {
    dispatch_queue_t v11 = _MRLogForCategory(0);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[MRTransactionDestination packetsFromMessage:completion:]((uint64_t)self);
    }

    (*((void (**)(UInt8 *, void, void *))v8 + 2))(v8, 0, v9);
  }
  else
  {
    v12 = MRCreateDataFromXPCMessage(v7, "MRXPC_TRANSACTION_DATA");
    v13 = (UInt8 *)v12;
    if (!v12)
    {
      v17 = [MEMORY[0x1E4F28B00] currentHandler];
      v18 = [NSString stringWithUTF8String:"-[MRTransactionDestination packetsFromMessage:completion:]"];
      [v17 handleFailureInFunction:v18, @"MRTransaction.m", 451, @"Invalid parameter not satisfying: %@", @"data" file lineNumber description];
    }
    objc_super v14 = MRTransactionPacketsCreateFromExternalRepresentation(v13);
    if (!v14)
    {
      v19 = [MEMORY[0x1E4F28B00] currentHandler];
      v20 = [NSString stringWithUTF8String:"-[MRTransactionDestination packetsFromMessage:completion:]"];
      [v19 handleFailureInFunction:v20, @"MRTransaction.m", 454, @"Invalid parameter not satisfying: %@", @"packets" file lineNumber description];
    }
    v15 = _MRLogForCategory(0);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      -[MRTransactionDestination packetsFromMessage:completion:]((uint64_t)self, v14, v15);
    }

    v16 = MRTransactionPacketsGetShallowCopy(v14);
    (*((void (**)(UInt8 *, void *, void *))v8 + 2))(v8, v16, v9);

    v8 = v13;
  }
}

void __58__MRTransactionDestination_packetsFromMessage_completion___block_invoke(uint64_t a1)
{
  xpc_dictionary_get_remote_connection(*(xpc_object_t *)(a1 + 32));
  v2 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    reply = xpc_dictionary_create_reply(*(xpc_object_t *)(a1 + 32));
    if (reply)
    {
      xpc_connection_send_message(v2, reply);
    }
    else
    {
      v4 = _MRLogForCategory(0);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        __58__MRTransactionDestination_packetsFromMessage_completion___block_invoke_cold_2(a1);
      }
    }
  }
  else
  {
    reply = _MRLogForCategory(0);
    if (os_log_type_enabled(reply, OS_LOG_TYPE_ERROR)) {
      __58__MRTransactionDestination_packetsFromMessage_completion___block_invoke_cold_1(a1);
    }
  }
}

- (void)unpacketize:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__MRTransactionDestination_unpacketize_completion___block_invoke;
  block[3] = &unk_1E57D3F90;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(serialQueue, block);
}

void __51__MRTransactionDestination_unpacketize_completion___block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 8);
  if (!v2)
  {
    v3 = objc_alloc_init(MRTransactionPacketizer);
    uint64_t v4 = *(void *)(a1 + 32);
    v5 = *(void **)(v4 + 8);
    *(void *)(v4 + 8) = v3;

    v2 = *(void **)(*(void *)(a1 + 32) + 8);
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51__MRTransactionDestination_unpacketize_completion___block_invoke_2;
  v7[3] = &unk_1E57D4470;
  uint64_t v6 = *(void *)(a1 + 40);
  id v8 = *(id *)(a1 + 48);
  [v2 unpacketize:v6 completion:v7];
}

void __51__MRTransactionDestination_unpacketize_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = +[MRMediaRemoteServiceClient sharedServiceClient];
  v5 = [v4 workerQueue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __51__MRTransactionDestination_unpacketize_completion___block_invoke_3;
  v8[3] = &unk_1E57D0DB8;
  id v6 = *(id *)(a1 + 32);
  id v9 = v3;
  id v10 = v6;
  id v7 = v3;
  dispatch_async(v5, v8);
}

uint64_t __51__MRTransactionDestination_unpacketize_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
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
  objc_storeStrong((id *)&self->_serialQueue, 0);

  objc_storeStrong((id *)&self->_packetizer, 0);
}

- (void)packetsFromMessage:(uint64_t)a1 completion:.cold.1(uint64_t a1)
{
  v1 = MRTransactionNameGetDescription(*(void *)(a1 + 24));
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_0_14(&dword_194F3C000, v2, v3, "[MRTransactionDestination] %@ received interrupted/invalid connection", v4, v5, v6, v7, v8);
}

- (void)packetsFromMessage:(NSObject *)a3 completion:.cold.2(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = MRTransactionNameGetDescription(*(void *)(a1 + 24));
  uint64_t v7 = MRTransactionPacketsGetKeys(a2);
  uint64_t v8 = *(void *)(a1 + 32);
  int v9 = 138412802;
  id v10 = v6;
  __int16 v11 = 2112;
  id v12 = v7;
  __int16 v13 = 2112;
  uint64_t v14 = v8;
  _os_log_debug_impl(&dword_194F3C000, a3, OS_LOG_TYPE_DEBUG, "[MRTransactionDestination] %@ received %@ for playerPath %@", (uint8_t *)&v9, 0x20u);
}

void __58__MRTransactionDestination_packetsFromMessage_completion___block_invoke_cold_1(uint64_t a1)
{
  v1 = MRTransactionNameGetDescription(*(void *)(*(void *)(a1 + 40) + 24));
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_0_14(&dword_194F3C000, v2, v3, "[MRTransactionDestination] %@ could not extract connection", v4, v5, v6, v7, v8);
}

void __58__MRTransactionDestination_packetsFromMessage_completion___block_invoke_cold_2(uint64_t a1)
{
  v1 = MRTransactionNameGetDescription(*(void *)(*(void *)(a1 + 40) + 24));
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_0_14(&dword_194F3C000, v2, v3, "[MRTransactionDestination] %@ could not extract reply", v4, v5, v6, v7, v8);
}

@end