@interface WPDataTransfer
- (BOOL)addNewData:(id)a3;
- (BOOL)receivedFirstPacket;
- (NSMutableData)currentReceivedData;
- (NSUUID)peerUUID;
- (id)initDataTransferForPeer:(id)a3;
- (unsigned)currentDataSize;
- (void)resetTransfer;
- (void)setCurrentDataSize:(unsigned __int16)a3;
- (void)setCurrentReceivedData:(id)a3;
- (void)setPeerUUID:(id)a3;
- (void)setReceivedFirstPacket:(BOOL)a3;
@end

@implementation WPDataTransfer

- (id)initDataTransferForPeer:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WPDataTransfer;
  v6 = [(WPDataTransfer *)&v10 init];
  if (v6)
  {
    uint64_t v7 = [MEMORY[0x263EFF990] data];
    currentReceivedData = v6->_currentReceivedData;
    v6->_currentReceivedData = (NSMutableData *)v7;

    v6->_receivedFirstPacket = 0;
    objc_storeStrong((id *)&v6->_peerUUID, a3);
  }

  return v6;
}

- (void)resetTransfer
{
  v3 = [MEMORY[0x263EFF990] data];
  [(WPDataTransfer *)self setCurrentReceivedData:v3];

  [(WPDataTransfer *)self setReceivedFirstPacket:0];
}

- (BOOL)addNewData:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 length])
  {
    BOOL v5 = [(WPDataTransfer *)self receivedFirstPacket];
    unint64_t v6 = [v4 length];
    if (v5)
    {
      if (v6 > [(WPDataTransfer *)self currentDataSize])
      {
        if (WPLogInitOnce != -1) {
          dispatch_once(&WPLogInitOnce, &__block_literal_global_12);
        }
        uint64_t v7 = (void *)WiProxLog;
        if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
          [(WPDataTransfer *)v7 addNewData:v4];
        }
LABEL_18:
        id v11 = 0;
        goto LABEL_35;
      }
      id v11 = v4;
    }
    else
    {
      if (v6 <= 1)
      {
        if (WPLogInitOnce != -1) {
          dispatch_once(&WPLogInitOnce, &__block_literal_global_3);
        }
        objc_super v10 = (void *)WiProxLog;
        if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
          -[WPDataTransfer addNewData:](v10, v4);
        }
        goto LABEL_18;
      }
      unsigned __int16 v29 = 0;
      [v4 getBytes:&v29 length:2];
      [(WPDataTransfer *)self setCurrentDataSize:v29];
      objc_msgSend(v4, "subdataWithRange:", 2, objc_msgSend(v4, "length") - 2);
      id v11 = (id)objc_claimAutoreleasedReturnValue();
      [(WPDataTransfer *)self currentDataSize];
      kdebug_trace();
      if (WPLogInitOnce != -1) {
        dispatch_once(&WPLogInitOnce, &__block_literal_global_6);
      }
      v12 = (void *)WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_INFO))
      {
        int v13 = v29;
        v14 = v12;
        uint64_t v15 = [v11 length];
        v16 = [(WPDataTransfer *)self peerUUID];
        *(_DWORD *)buf = 67109634;
        *(_DWORD *)v31 = v13;
        *(_WORD *)&v31[4] = 2048;
        *(void *)&v31[6] = v15;
        *(_WORD *)&v31[14] = 2114;
        *(void *)&v31[16] = v16;
        _os_log_impl(&dword_2144AA000, v14, OS_LOG_TYPE_INFO, "BEGIN receiving data of total length %d, first packet length %ld from peer %{public}@", buf, 0x1Cu);
      }
      unint64_t v17 = [v11 length];
      if (v17 > [(WPDataTransfer *)self currentDataSize])
      {
        if (WPLogInitOnce != -1) {
          dispatch_once(&WPLogInitOnce, &__block_literal_global_9);
        }
        v18 = (void *)WiProxLog;
        if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
          [(WPDataTransfer *)&v29 addNewData:v11];
        }
        goto LABEL_35;
      }
      [(WPDataTransfer *)self setReceivedFirstPacket:1];
    }
    v19 = [(WPDataTransfer *)self currentReceivedData];
    [v19 appendData:v11];

    -[WPDataTransfer setCurrentDataSize:](self, "setCurrentDataSize:", (unsigned __int16)(-[WPDataTransfer currentDataSize](self, "currentDataSize") - [v11 length]));
    v20 = [(WPDataTransfer *)self currentReceivedData];
    [v20 length];
    [(WPDataTransfer *)self currentDataSize];
    kdebug_trace();

    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_15);
    }
    v21 = (void *)WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_INFO))
    {
      v22 = v21;
      v23 = [(WPDataTransfer *)self currentReceivedData];
      uint64_t v24 = [v23 length];
      v25 = [(WPDataTransfer *)self peerUUID];
      int v26 = [(WPDataTransfer *)self currentDataSize];
      *(_DWORD *)buf = 134218498;
      *(void *)v31 = v24;
      *(_WORD *)&v31[8] = 2114;
      *(void *)&v31[10] = v25;
      *(_WORD *)&v31[18] = 1024;
      *(_DWORD *)&v31[20] = v26;
      _os_log_impl(&dword_2144AA000, v22, OS_LOG_TYPE_INFO, "Length of data received %ld from peer %{public}@, length of data remaining to receive: %d", buf, 0x1Cu);
    }
    if (![(WPDataTransfer *)self currentDataSize])
    {
      v28 = [(WPDataTransfer *)self currentReceivedData];
      BOOL v9 = [v28 length] != 0;

      goto LABEL_36;
    }
LABEL_35:
    BOOL v9 = 0;
LABEL_36:

    goto LABEL_37;
  }
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_1);
  }
  v8 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
    -[WPDataTransfer addNewData:](v8);
  }
  BOOL v9 = 0;
LABEL_37:

  return v9;
}

- (NSMutableData)currentReceivedData
{
  return self->_currentReceivedData;
}

- (void)setCurrentReceivedData:(id)a3
{
}

- (unsigned)currentDataSize
{
  return self->_currentDataSize;
}

- (void)setCurrentDataSize:(unsigned __int16)a3
{
  self->_currentDataSize = a3;
}

- (BOOL)receivedFirstPacket
{
  return self->_receivedFirstPacket;
}

- (void)setReceivedFirstPacket:(BOOL)a3
{
  self->_receivedFirstPacket = a3;
}

- (NSUUID)peerUUID
{
  return self->_peerUUID;
}

- (void)setPeerUUID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peerUUID, 0);

  objc_storeStrong((id *)&self->_currentReceivedData, 0);
}

- (void)addNewData:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2144AA000, log, OS_LOG_TYPE_ERROR, "Received a data value of size 0", v1, 2u);
}

- (void)addNewData:(void *)a3 .cold.2(void *a1, void *a2, void *a3)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  BOOL v5 = a1;
  v6[0] = 67109376;
  v6[1] = [a2 currentDataSize];
  __int16 v7 = 2048;
  uint64_t v8 = [a3 length];
  _os_log_error_impl(&dword_2144AA000, v5, OS_LOG_TYPE_ERROR, "Data size expected: %d, but received: %lu", (uint8_t *)v6, 0x12u);
}

- (void)addNewData:(void *)a1 .cold.3(void *a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3 = a1;
  int v4 = 134217984;
  uint64_t v5 = [a2 length];
  _os_log_error_impl(&dword_2144AA000, v3, OS_LOG_TYPE_ERROR, "Received data length is too small: %ld, Min length required: 2", (uint8_t *)&v4, 0xCu);
}

- (void)addNewData:(void *)a3 .cold.4(unsigned __int16 *a1, void *a2, void *a3)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  int v4 = *a1;
  uint64_t v5 = a2;
  v6[0] = 67109376;
  v6[1] = v4;
  __int16 v7 = 2048;
  uint64_t v8 = [a3 length];
  _os_log_error_impl(&dword_2144AA000, v5, OS_LOG_TYPE_ERROR, "FIRST Packet - Data size expected: %d, but received: %lu", (uint8_t *)v6, 0x12u);
}

@end