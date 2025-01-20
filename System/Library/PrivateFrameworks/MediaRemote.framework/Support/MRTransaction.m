@interface MRTransaction
- (MRPlayerPath)playerPath;
- (MRTransaction)initWithName:(unint64_t)a3 fromMessage:(id)a4 withDelegate:(id)a5;
- (MRTransaction)initWithName:(unint64_t)a3 playerPath:(id)a4;
- (MRTransactionDelegate)delegate;
- (double)outOfMemoryWaitDuration;
- (unint64_t)_calculateMemory;
- (unint64_t)name;
- (void)_processMessage:(id)a3;
- (void)_query:(id)a3;
- (void)_transactionEnded;
- (void)cancel;
- (void)dealloc;
- (void)send:(id)a3 toConnection:(id)a4 completion:(id)a5;
- (void)setDelegate:(id)a3;
@end

@implementation MRTransaction

- (MRTransaction)initWithName:(unint64_t)a3 fromMessage:(id)a4 withDelegate:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v22.receiver = self;
  v22.super_class = (Class)MRTransaction;
  v10 = [(MRTransaction *)&v22 init];
  v11 = v10;
  if (v10)
  {
    v10->_name = a3;
    uint64_t v12 = MRCreatePlayerPathFromXPCMessage();
    playerPath = v11->_playerPath;
    v11->_playerPath = (MRPlayerPath *)v12;

    objc_storeWeak((id *)&v11->_delegate, v9);
    v14 = _MRLogForCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      v17 = MRTransactionNameGetDescription();
      v18 = v11->_playerPath;
      *(_DWORD *)buf = 134218498;
      v24 = v11;
      __int16 v25 = 2112;
      v26 = v17;
      __int16 v27 = 2112;
      v28 = v18;
      _os_log_debug_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "[MRDTransaction] New Transaction: %p %@ for playerPath %@", buf, 0x20u);
    }
    v15 = dispatch_get_global_queue(0, 0);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100086748;
    v19[3] = &unk_1004158D8;
    v20 = v11;
    id v21 = v8;
    dispatch_async(v15, v19);
  }
  return v11;
}

- (MRTransaction)initWithName:(unint64_t)a3 playerPath:(id)a4
{
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MRTransaction;
  id v8 = [(MRTransaction *)&v14 init];
  id v9 = v8;
  if (v8)
  {
    v8->_name = a3;
    objc_storeStrong((id *)&v8->_playerPath, a4);
    v10 = _MRLogForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v12 = MRTransactionNameGetDescription();
      playerPath = v9->_playerPath;
      *(_DWORD *)buf = 134218498;
      v16 = v9;
      __int16 v17 = 2112;
      v18 = v12;
      __int16 v19 = 2112;
      v20 = playerPath;
      _os_log_debug_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "[MRDTransaction] New Transaction: %p %@ for playerPath %@", buf, 0x20u);
    }
  }

  return v9;
}

- (double)outOfMemoryWaitDuration
{
  if (qword_10047E048 != -1) {
    dispatch_once(&qword_10047E048, &stru_1004194A8);
  }
  return *(double *)&qword_10047E040;
}

- (void)dealloc
{
  v3 = _MRLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_10032C07C();
  }

  [(MRDTaskAssertion *)self->_taskAssertion invalidateWithReason:@"Deprecated"];
  v4.receiver = self;
  v4.super_class = (Class)MRTransaction;
  [(MRTransaction *)&v4 dealloc];
}

- (void)send:(id)a3 toConnection:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = (_xpc_connection_s *)a4;
  id v10 = a5;
  if ([v8 count])
  {
    v11 = MRCreateXPCMessage();
    MRTransactionPacketsCreateExternalRepresentation();
    id v12 = objc_claimAutoreleasedReturnValue();
    xpc_dictionary_set_data(v11, "MRXPC_TRANSACTION_DATA", [v12 bytes], (size_t)objc_msgSend(v12, "length"));
    MRAddPlayerPathToXPCMessage();
    xpc_dictionary_set_uint64(v11, "MRXPC_TRANSACTION_NAME", self->_name);
    v13 = dispatch_get_global_queue(0, 0);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100086B34;
    v15[3] = &unk_1004194D0;
    id v16 = v11;
    id v17 = v10;
    id v14 = v11;
    xpc_connection_send_message_with_reply(v9, v14, v13, v15);
  }
  else
  {
    (*((void (**)(id, void))v10 + 2))(v10, 0);
  }
}

- (void)cancel
{
  v3 = _MRLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_10032C124();
  }

  [(MRTransaction *)self _transactionEnded];
}

- (void)_processMessage:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4 == &_xpc_error_connection_interrupted || v4 == &_xpc_error_connection_invalid)
  {
    id v7 = _MRLogForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10032C1C4();
    }

    [(MRTransaction *)self _transactionEnded];
  }
  else
  {
    self->_bytesInUse = 0;
    id v8 = (void *)MRCreateDataFromXPCMessage();
    id v9 = MRTransactionPacketsCreateFromExternalRepresentation();
    uint64_t uint64 = xpc_dictionary_get_uint64(v5, "MRXPC_TRANSACTION_DATA_REQUESTED_SIZE");
    v11 = _MRLogForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      sub_10032C250((uint64_t)self, v8);
    }

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    id v14 = [v8 length];
    v15 = dispatch_get_global_queue(0, 0);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100086D90;
    v16[3] = &unk_1004158D8;
    v16[4] = self;
    id v17 = v5;
    [WeakRetained transaction:self didReceivePackets:v9 receivedSize:v14 requestedSize:uint64 queue:v15 completion:v16];
  }
}

- (void)_query:(id)a3
{
  id v4 = a3;
  if (xpc_dictionary_get_BOOL(v4, "MRXPC_TRANSACTION_ENDED"))
  {
    v5 = _MRLogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      sub_10032C308();
    }

    [(MRTransaction *)self _transactionEnded];
  }
  else
  {
    unint64_t v6 = [(MRTransaction *)self _calculateMemory];
    self->_bytesInUse = v6;
    if (v6)
    {
      xpc_dictionary_get_remote_connection(v4);
      id v7 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        xpc_object_t reply = xpc_dictionary_create_reply(v4);
        id v9 = reply;
        if (reply)
        {
          xpc_dictionary_set_uint64(reply, "MRXPC_TRANSACTION_DATA_REQUESTED_SIZE", self->_bytesInUse);
          id v10 = _MRLogForCategory();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
            sub_10032C4BC((uint64_t)self);
          }

          v11 = dispatch_get_global_queue(0, 0);
          handler[0] = _NSConcreteStackBlock;
          handler[1] = 3221225472;
          handler[2] = sub_100087184;
          handler[3] = &unk_100415DC8;
          handler[4] = self;
          xpc_connection_send_message_with_reply(v7, v9, v11, handler);
        }
        else
        {
          v18 = _MRLogForCategory();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
            sub_10032C430();
          }

          [(MRTransaction *)self _transactionEnded];
        }
      }
      else
      {
        id v17 = _MRLogForCategory();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          sub_10032C3A4();
        }

        [(MRTransaction *)self _transactionEnded];
      }
    }
    else
    {
      id v12 = _MRLogForCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        [(MRTransaction *)self outOfMemoryWaitDuration];
        *(_DWORD *)buf = 134218240;
        v23 = self;
        __int16 v24 = 2048;
        uint64_t v25 = v13;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%p No memory available, waiting %lf and requesting again", buf, 0x16u);
      }

      [(MRTransaction *)self outOfMemoryWaitDuration];
      dispatch_time_t v15 = dispatch_time(0, (uint64_t)(v14 * 1000000000.0));
      id v16 = dispatch_get_global_queue(0, 0);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000870D0;
      block[3] = &unk_1004158D8;
      block[4] = self;
      id v21 = v4;
      dispatch_after(v15, v16, block);
    }
  }
}

- (void)_transactionEnded
{
  v3 = _MRLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_10032C55C();
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained transactionDidEnd:self bytesRemaining:self->_bytesInUse];
}

- (unint64_t)_calculateMemory
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v4 = [WeakRetained transactionRequestingMemorySize:self];

  return (unint64_t)v4;
}

- (MRTransactionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MRTransactionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
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
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_taskAssertion, 0);
}

@end