@interface PTPTransaction
- (BOOL)dataExpected;
- (BOOL)dataReceived;
- (BOOL)responseReceived;
- (BOOL)rxCopyDataBuffer;
- (BOOL)txComplete;
- (NSNumber)txID;
- (PTPDataPacket)txDataPacket;
- (PTPOperationRequestPacket)requestPacket;
- (PTPOperationResponsePacket)responsePacket;
- (PTPTransaction)initWithOperationRequestPacket:(id)a3 txData:(id)a4 rxData:(id)a5 dataExpected:(BOOL)a6;
- (PTPWrappedBytes)rxDataBuffer;
- (PTPWrappedBytes)rxResponseBuffer;
- (char)bufMutableBytes;
- (char)rxDataMutableBytes;
- (char)rxReadBuffer;
- (char)rxResponseMutableBytes;
- (int)containerType;
- (unsigned)bufSize;
- (unsigned)containerLength;
- (unsigned)rxDataBufferSize;
- (unsigned)rxResponseBufferSize;
- (void)dealloc;
- (void)setContainerLength:(unsigned int)a3;
- (void)setContainerType:(int)a3;
- (void)setDataExpected:(BOOL)a3;
- (void)setDataReceived:(BOOL)a3;
- (void)setRequestPacket:(id)a3;
- (void)setResponsePacket:(id)a3;
- (void)setResponseReceived:(BOOL)a3;
- (void)setRxCopyDataBuffer:(BOOL)a3;
- (void)setRxDataBuffer:(id)a3;
- (void)setRxReadBuffer:(char *)a3;
- (void)setRxResponseBuffer:(id)a3;
- (void)setTxComplete:(BOOL)a3;
- (void)setTxDataPacket:(id)a3;
- (void)setTxID:(id)a3;
@end

@implementation PTPTransaction

- (PTPTransaction)initWithOperationRequestPacket:(id)a3 txData:(id)a4 rxData:(id)a5 dataExpected:(BOOL)a6
{
  BOOL v6 = a6;
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v25.receiver = self;
  v25.super_class = (Class)PTPTransaction;
  v14 = [(PTPTransaction *)&v25 init];
  v15 = v14;
  if (v14)
  {
    [(PTPTransaction *)v14 setDataExpected:v6];
    [(PTPTransaction *)v15 setDataReceived:0];
    [(PTPTransaction *)v15 setTxComplete:0];
    *(void *)&v15->_containerType = 0;
    v15->_responseReceived = 0;
    if (v12) {
      objc_storeStrong((id *)&v15->_txDataPacket, a4);
    }
    if (v13)
    {
      v15->_rxReadBuffer = 0;
      v16 = (PTPWrappedBytes *)v13;
      char v17 = 0;
      rxDataBuffer = v15->_rxDataBuffer;
      v15->_rxDataBuffer = v16;
    }
    else
    {
      if (![(PTPTransaction *)v15 dataExpected])
      {
LABEL_9:
        v20 = [[PTPWrappedBytes alloc] initWithCapacity:0x4000];
        rxResponseBuffer = v15->_rxResponseBuffer;
        v15->_rxResponseBuffer = v20;

        objc_storeStrong((id *)&v15->_requestPacket, a3);
        uint64_t v22 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v11 transactionID]);
        txID = v15->_txID;
        v15->_txID = (NSNumber *)v22;

        goto LABEL_10;
      }
      v15->_rxReadBuffer = (char *)malloc_type_malloc(0x100000uLL, 0x33D8786FuLL);
      v19 = [[PTPWrappedBytes alloc] initWithCapacity:0];
      rxDataBuffer = v15->_rxDataBuffer;
      v15->_rxDataBuffer = v19;
      char v17 = 1;
    }

    v15->_rxCopyDataBuffer = v17;
    goto LABEL_9;
  }
LABEL_10:

  return v15;
}

- (unsigned)rxDataBufferSize
{
  if (self->_rxReadBuffer) {
    return 0x100000;
  }
  else {
    return [(PTPWrappedBytes *)self->_rxDataBuffer capacity];
  }
}

- (char)rxDataMutableBytes
{
  if (self->_rxReadBuffer) {
    return self->_rxReadBuffer;
  }
  else {
    return (char *)[(PTPWrappedBytes *)self->_rxDataBuffer mutableBytes];
  }
}

- (unsigned)rxResponseBufferSize
{
  return 0x4000;
}

- (char)rxResponseMutableBytes
{
  return (char *)[(PTPWrappedBytes *)self->_rxResponseBuffer mutableBytes];
}

- (char)bufMutableBytes
{
  if ([(PTPTransaction *)self dataExpected] && ![(PTPTransaction *)self dataReceived])
  {
    if ([(PTPTransaction *)self dataExpected])
    {
      return [(PTPTransaction *)self rxDataMutableBytes];
    }
    else
    {
      return 0;
    }
  }
  else
  {
    return [(PTPTransaction *)self rxResponseMutableBytes];
  }
}

- (unsigned)bufSize
{
  if ([(PTPTransaction *)self dataExpected] && ![(PTPTransaction *)self dataReceived])
  {
    unsigned int result = [(PTPTransaction *)self dataExpected];
    if (result)
    {
      return [(PTPTransaction *)self rxDataBufferSize];
    }
  }
  else
  {
    return [(PTPTransaction *)self rxResponseBufferSize];
  }
  return result;
}

- (void)dealloc
{
  rxReadBuffer = self->_rxReadBuffer;
  if (rxReadBuffer) {
    free(rxReadBuffer);
  }
  v4.receiver = self;
  v4.super_class = (Class)PTPTransaction;
  [(PTPTransaction *)&v4 dealloc];
}

- (NSNumber)txID
{
  return self->_txID;
}

- (void)setTxID:(id)a3
{
}

- (BOOL)txComplete
{
  return self->_txComplete;
}

- (void)setTxComplete:(BOOL)a3
{
  self->_txComplete = a3;
}

- (BOOL)dataExpected
{
  return self->_dataExpected;
}

- (void)setDataExpected:(BOOL)a3
{
  self->_dataExpected = a3;
}

- (BOOL)dataReceived
{
  return self->_dataReceived;
}

- (void)setDataReceived:(BOOL)a3
{
  self->_dataReceived = a3;
}

- (BOOL)responseReceived
{
  return self->_responseReceived;
}

- (void)setResponseReceived:(BOOL)a3
{
  self->_responseReceived = a3;
}

- (PTPOperationRequestPacket)requestPacket
{
  return self->_requestPacket;
}

- (void)setRequestPacket:(id)a3
{
}

- (PTPDataPacket)txDataPacket
{
  return self->_txDataPacket;
}

- (void)setTxDataPacket:(id)a3
{
}

- (char)rxReadBuffer
{
  return self->_rxReadBuffer;
}

- (void)setRxReadBuffer:(char *)a3
{
  self->_rxReadBuffer = a3;
}

- (PTPWrappedBytes)rxDataBuffer
{
  return self->_rxDataBuffer;
}

- (void)setRxDataBuffer:(id)a3
{
}

- (BOOL)rxCopyDataBuffer
{
  return self->_rxCopyDataBuffer;
}

- (void)setRxCopyDataBuffer:(BOOL)a3
{
  self->_rxCopyDataBuffer = a3;
}

- (PTPWrappedBytes)rxResponseBuffer
{
  return self->_rxResponseBuffer;
}

- (void)setRxResponseBuffer:(id)a3
{
}

- (PTPOperationResponsePacket)responsePacket
{
  return self->_responsePacket;
}

- (void)setResponsePacket:(id)a3
{
}

- (int)containerType
{
  return self->_containerType;
}

- (void)setContainerType:(int)a3
{
  self->_containerType = a3;
}

- (unsigned)containerLength
{
  return self->_containerLength;
}

- (void)setContainerLength:(unsigned int)a3
{
  self->_containerLength = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responsePacket, 0);
  objc_storeStrong((id *)&self->_rxResponseBuffer, 0);
  objc_storeStrong((id *)&self->_rxDataBuffer, 0);
  objc_storeStrong((id *)&self->_txDataPacket, 0);
  objc_storeStrong((id *)&self->_requestPacket, 0);

  objc_storeStrong((id *)&self->_txID, 0);
}

@end