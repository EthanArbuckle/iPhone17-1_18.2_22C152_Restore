@interface PipeDataTransfer
- (BOOL)rxFirstPacket;
- (BOOL)rxWaitForMoreData;
- (NSData)rxData;
- (NSData)rxTotalDataToReceive;
- (NSData)txData;
- (NSData)txTotalDataToSend;
- (NSMutableData)rxCurrentReceivedData;
- (NSMutableData)rxTotalDataWithLen;
- (NSUUID)peerUUID;
- (id)description;
- (id)initPipeDataTransferForPeer:(id)a3;
- (unint64_t)txDataLeftToSend;
- (unsigned)generateSequenceNumber;
- (unsigned)rxCurrentDataSize;
- (unsigned)rxSeqNum;
- (unsigned)rxTotalLenToReceive;
- (unsigned)txSeqNum;
- (unsigned)txTotalLenToSend;
- (void)generateSequenceNumber;
- (void)resetAllTransfer;
- (void)resetRxTransfer;
- (void)resetTxTransfer;
- (void)setPeerUUID:(id)a3;
- (void)setRxCurrentDataSize:(unsigned __int16)a3;
- (void)setRxCurrentReceivedData:(id)a3;
- (void)setRxData:(id)a3;
- (void)setRxFirstPacket:(BOOL)a3;
- (void)setRxSeqNum:(unsigned __int8)a3;
- (void)setRxTotalDataToReceive:(id)a3;
- (void)setRxTotalDataWithLen:(id)a3;
- (void)setRxTotalLenToReceive:(unsigned __int16)a3;
- (void)setRxWaitForMoreData:(BOOL)a3;
- (void)setTxData:(id)a3;
- (void)setTxDataLeftToSend:(unint64_t)a3;
- (void)setTxSeqNum:(unsigned __int8)a3;
- (void)setTxTotalDataToSend:(id)a3;
- (void)setTxTotalLenToSend:(unsigned __int16)a3;
@end

@implementation PipeDataTransfer

- (id)initPipeDataTransferForPeer:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PipeDataTransfer;
  v6 = [(PipeDataTransfer *)&v13 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_peerUUID, a3);
    uint64_t v8 = [MEMORY[0x263EFF990] data];
    rxCurrentReceivedData = v7->_rxCurrentReceivedData;
    v7->_rxCurrentReceivedData = (NSMutableData *)v8;

    uint64_t v10 = [MEMORY[0x263EFF990] data];
    rxTotalDataWithLen = v7->_rxTotalDataWithLen;
    v7->_rxTotalDataWithLen = (NSMutableData *)v10;
  }
  return v7;
}

- (void)resetAllTransfer
{
  peerUUID = self->_peerUUID;
  self->_peerUUID = 0;

  [(PipeDataTransfer *)self setTxSeqNum:0];
  [(PipeDataTransfer *)self resetRxTransfer];
  [(PipeDataTransfer *)self resetTxTransfer];
}

- (void)resetTxTransfer
{
  [(PipeDataTransfer *)self setTxTotalLenToSend:0];
  [(PipeDataTransfer *)self setTxTotalDataToSend:0];
  [(PipeDataTransfer *)self setTxData:0];
  [(PipeDataTransfer *)self setTxDataLeftToSend:0];
}

- (void)resetRxTransfer
{
  [(PipeDataTransfer *)self setRxSeqNum:0];
  [(PipeDataTransfer *)self setRxFirstPacket:0];
  [(PipeDataTransfer *)self setRxTotalLenToReceive:0];
  [(PipeDataTransfer *)self setRxTotalDataToReceive:0];
  [(PipeDataTransfer *)self setRxData:0];
  [(PipeDataTransfer *)self setRxCurrentDataSize:0];
  v3 = [MEMORY[0x263EFF990] data];
  [(PipeDataTransfer *)self setRxCurrentReceivedData:v3];

  v4 = [MEMORY[0x263EFF990] data];
  [(PipeDataTransfer *)self setRxTotalDataWithLen:v4];

  [(PipeDataTransfer *)self setRxWaitForMoreData:0];
}

- (unsigned)generateSequenceNumber
{
  if ([(PipeDataTransfer *)self txSeqNum] == 255)
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_16);
    }
    id v5 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v8 = 0;
      _os_log_impl(&dword_22316D000, v5, OS_LOG_TYPE_DEFAULT, "WPPM: Reset sequence number", v8, 2u);
    }
    v4 = self;
    uint64_t v3 = 1;
  }
  else
  {
    uint64_t v3 = ([(PipeDataTransfer *)self txSeqNum] + 1);
    v4 = self;
  }
  [(PipeDataTransfer *)v4 setTxSeqNum:v3];
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_142);
  }
  v6 = (void *)WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG)) {
    -[PipeDataTransfer generateSequenceNumber](v6);
  }
  return [(PipeDataTransfer *)self txSeqNum];
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"PipeDataTransfer: receivedFirstPacket %d, rxTLen %d, rxLen %lu, rxSeq %d txTLen %d txLen %lu txSeq %d peer %@", self->_rxFirstPacket, self->_rxTotalLenToReceive, -[NSData length](self->_rxTotalDataToReceive, "length"), self->_rxSeqNum, self->_txTotalLenToSend, -[NSData length](self->_txTotalDataToSend, "length"), self->_txSeqNum, self->_peerUUID];
}

- (NSUUID)peerUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 24, 1);
}

- (void)setPeerUUID:(id)a3
{
}

- (unsigned)txSeqNum
{
  return self->_txSeqNum;
}

- (void)setTxSeqNum:(unsigned __int8)a3
{
  self->_txSeqNum = a3;
}

- (unsigned)txTotalLenToSend
{
  return self->_txTotalLenToSend;
}

- (void)setTxTotalLenToSend:(unsigned __int16)a3
{
  self->_txTotalLenToSend = a3;
}

- (NSData)txTotalDataToSend
{
  return (NSData *)objc_getProperty(self, a2, 32, 1);
}

- (void)setTxTotalDataToSend:(id)a3
{
}

- (NSData)txData
{
  return (NSData *)objc_getProperty(self, a2, 40, 1);
}

- (void)setTxData:(id)a3
{
}

- (unint64_t)txDataLeftToSend
{
  return self->_txDataLeftToSend;
}

- (void)setTxDataLeftToSend:(unint64_t)a3
{
  self->_txDataLeftToSend = a3;
}

- (unsigned)rxSeqNum
{
  return self->_rxSeqNum;
}

- (void)setRxSeqNum:(unsigned __int8)a3
{
  self->_rxSeqNum = a3;
}

- (BOOL)rxFirstPacket
{
  return self->_rxFirstPacket;
}

- (void)setRxFirstPacket:(BOOL)a3
{
  self->_rxFirstPacket = a3;
}

- (unsigned)rxTotalLenToReceive
{
  return self->_rxTotalLenToReceive;
}

- (void)setRxTotalLenToReceive:(unsigned __int16)a3
{
  self->_rxTotalLenToReceive = a3;
}

- (NSData)rxTotalDataToReceive
{
  return (NSData *)objc_getProperty(self, a2, 56, 1);
}

- (void)setRxTotalDataToReceive:(id)a3
{
}

- (NSData)rxData
{
  return (NSData *)objc_getProperty(self, a2, 64, 1);
}

- (void)setRxData:(id)a3
{
}

- (unsigned)rxCurrentDataSize
{
  return self->_rxCurrentDataSize;
}

- (void)setRxCurrentDataSize:(unsigned __int16)a3
{
  self->_rxCurrentDataSize = a3;
}

- (NSMutableData)rxCurrentReceivedData
{
  return (NSMutableData *)objc_getProperty(self, a2, 72, 1);
}

- (void)setRxCurrentReceivedData:(id)a3
{
}

- (NSMutableData)rxTotalDataWithLen
{
  return (NSMutableData *)objc_getProperty(self, a2, 80, 1);
}

- (void)setRxTotalDataWithLen:(id)a3
{
}

- (BOOL)rxWaitForMoreData
{
  return self->_rxWaitForMoreData;
}

- (void)setRxWaitForMoreData:(BOOL)a3
{
  self->_rxWaitForMoreData = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rxTotalDataWithLen, 0);
  objc_storeStrong((id *)&self->_rxCurrentReceivedData, 0);
  objc_storeStrong((id *)&self->_rxData, 0);
  objc_storeStrong((id *)&self->_rxTotalDataToReceive, 0);
  objc_storeStrong((id *)&self->_txData, 0);
  objc_storeStrong((id *)&self->_txTotalDataToSend, 0);
  objc_storeStrong((id *)&self->_peerUUID, 0);
}

- (void)generateSequenceNumber
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  id v2 = a1;
  v3[0] = 67109120;
  v3[1] = [(id)OUTLINED_FUNCTION_15() txSeqNum];
  _os_log_debug_impl(&dword_22316D000, v1, OS_LOG_TYPE_DEBUG, "WPPM: tx Seq num %d", (uint8_t *)v3, 8u);
}

@end