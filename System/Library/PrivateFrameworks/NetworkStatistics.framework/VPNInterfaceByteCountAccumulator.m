@interface VPNInterfaceByteCountAccumulator
- (VPNInterfaceByteCountAccumulator)init;
- (void)addBytesToAttributeToVPNProviderFromSnapshot:(id)a3;
- (void)subtractBytesAttributedToVPNProviderFromSnapshot:(id)a3;
@end

@implementation VPNInterfaceByteCountAccumulator

- (VPNInterfaceByteCountAccumulator)init
{
  v3.receiver = self;
  v3.super_class = (Class)VPNInterfaceByteCountAccumulator;
  result = [(VPNInterfaceByteCountAccumulator *)&v3 init];
  if (result)
  {
    *(_OWORD *)&result->_currentVPNInterfaceByteCounts.txWiFiBytes = 0u;
    *(_OWORD *)&result->_currentVPNInterfaceByteCounts.rxWiredBytes = 0u;
    *(_OWORD *)&result->_currentVPNInterfaceByteCounts.rxCellularBytes = 0u;
  }
  return result;
}

- (void)addBytesToAttributeToVPNProviderFromSnapshot:(id)a3
{
  id v4 = a3;
  unint64_t rxCellularBytes = self->_currentVPNInterfaceByteCounts.rxCellularBytes;
  id v23 = v4;
  uint64_t v6 = [v4 deltaAccountingRxCellularBytes];
  unint64_t v7 = rxCellularBytes + v6;
  if (__CFADD__(rxCellularBytes, v6)) {
    unint64_t v7 = -1;
  }
  self->_currentVPNInterfaceByteCounts.unint64_t rxCellularBytes = v7;
  unint64_t rxWiFiBytes = self->_currentVPNInterfaceByteCounts.rxWiFiBytes;
  uint64_t v9 = [v23 deltaAccountingRxWiFiBytes];
  unint64_t v10 = rxWiFiBytes + v9;
  if (__CFADD__(rxWiFiBytes, v9)) {
    unint64_t v10 = -1;
  }
  self->_currentVPNInterfaceByteCounts.unint64_t rxWiFiBytes = v10;
  unint64_t rxWiredBytes = self->_currentVPNInterfaceByteCounts.rxWiredBytes;
  uint64_t v12 = [v23 deltaAccountingRxWiredBytes];
  unint64_t v13 = rxWiredBytes + v12;
  if (__CFADD__(rxWiredBytes, v12)) {
    unint64_t v13 = -1;
  }
  self->_currentVPNInterfaceByteCounts.unint64_t rxWiredBytes = v13;
  unint64_t txCellularBytes = self->_currentVPNInterfaceByteCounts.txCellularBytes;
  uint64_t v15 = [v23 deltaAccountingTxCellularBytes];
  unint64_t v16 = txCellularBytes + v15;
  if (__CFADD__(txCellularBytes, v15)) {
    unint64_t v16 = -1;
  }
  self->_currentVPNInterfaceByteCounts.unint64_t txCellularBytes = v16;
  unint64_t txWiFiBytes = self->_currentVPNInterfaceByteCounts.txWiFiBytes;
  uint64_t v18 = [v23 deltaAccountingTxWiFiBytes];
  unint64_t v19 = txWiFiBytes + v18;
  if (__CFADD__(txWiFiBytes, v18)) {
    unint64_t v19 = -1;
  }
  self->_currentVPNInterfaceByteCounts.unint64_t txWiFiBytes = v19;
  unint64_t txWiredBytes = self->_currentVPNInterfaceByteCounts.txWiredBytes;
  uint64_t v21 = [v23 deltaAccountingTxWiredBytes];
  unint64_t v22 = txWiredBytes + v21;
  if (__CFADD__(txWiredBytes, v21)) {
    unint64_t v22 = -1;
  }
  self->_currentVPNInterfaceByteCounts.unint64_t txWiredBytes = v22;
}

- (void)subtractBytesAttributedToVPNProviderFromSnapshot:(id)a3
{
  id v41 = a3;
  unint64_t v4 = [v41 deltaAccountingRxCellularBytes];
  unint64_t rxCellularBytes = self->_currentVPNInterfaceByteCounts.rxCellularBytes;
  if (v4 < rxCellularBytes) {
    unint64_t rxCellularBytes = [v41 deltaAccountingRxCellularBytes];
  }
  unint64_t v6 = [v41 deltaAccountingRxWiFiBytes];
  unint64_t rxWiFiBytes = self->_currentVPNInterfaceByteCounts.rxWiFiBytes;
  if (v6 < rxWiFiBytes) {
    unint64_t rxWiFiBytes = [v41 deltaAccountingRxWiFiBytes];
  }
  unint64_t v8 = [v41 deltaAccountingRxWiredBytes];
  unint64_t rxWiredBytes = self->_currentVPNInterfaceByteCounts.rxWiredBytes;
  if (v8 < rxWiredBytes) {
    unint64_t rxWiredBytes = [v41 deltaAccountingRxWiredBytes];
  }
  unint64_t v10 = [v41 deltaAccountingTxCellularBytes];
  unint64_t txCellularBytes = self->_currentVPNInterfaceByteCounts.txCellularBytes;
  if (v10 < txCellularBytes) {
    unint64_t txCellularBytes = [v41 deltaAccountingTxCellularBytes];
  }
  unint64_t v12 = [v41 deltaAccountingTxWiFiBytes];
  unint64_t txWiFiBytes = self->_currentVPNInterfaceByteCounts.txWiFiBytes;
  if (v12 < txWiFiBytes) {
    unint64_t txWiFiBytes = [v41 deltaAccountingTxWiFiBytes];
  }
  unint64_t v14 = [v41 deltaAccountingTxWiredBytes];
  unint64_t txWiredBytes = self->_currentVPNInterfaceByteCounts.txWiredBytes;
  if (v14 < txWiredBytes) {
    unint64_t txWiredBytes = [v41 deltaAccountingTxWiredBytes];
  }
  unint64_t v16 = self->_currentVPNInterfaceByteCounts.rxCellularBytes;
  BOOL v17 = v16 >= rxCellularBytes;
  unint64_t v18 = v16 - rxCellularBytes;
  if (!v17) {
    unint64_t v18 = 0;
  }
  self->_currentVPNInterfaceByteCounts.unint64_t rxCellularBytes = v18;
  unint64_t v19 = self->_currentVPNInterfaceByteCounts.rxWiFiBytes;
  BOOL v17 = v19 >= rxWiFiBytes;
  unint64_t v20 = v19 - rxWiFiBytes;
  if (!v17) {
    unint64_t v20 = 0;
  }
  self->_currentVPNInterfaceByteCounts.unint64_t rxWiFiBytes = v20;
  unint64_t v21 = self->_currentVPNInterfaceByteCounts.rxWiredBytes;
  BOOL v17 = v21 >= rxWiredBytes;
  unint64_t v22 = v21 - rxWiredBytes;
  if (!v17) {
    unint64_t v22 = 0;
  }
  self->_currentVPNInterfaceByteCounts.unint64_t rxWiredBytes = v22;
  unint64_t v23 = self->_currentVPNInterfaceByteCounts.txCellularBytes;
  BOOL v17 = v23 >= txCellularBytes;
  unint64_t v24 = v23 - txCellularBytes;
  if (!v17) {
    unint64_t v24 = 0;
  }
  self->_currentVPNInterfaceByteCounts.unint64_t txCellularBytes = v24;
  unint64_t v25 = self->_currentVPNInterfaceByteCounts.txWiFiBytes;
  BOOL v17 = v25 >= txWiFiBytes;
  unint64_t v26 = v25 - txWiFiBytes;
  if (!v17) {
    unint64_t v26 = 0;
  }
  self->_currentVPNInterfaceByteCounts.unint64_t txWiFiBytes = v26;
  unint64_t v27 = self->_currentVPNInterfaceByteCounts.txWiredBytes;
  BOOL v17 = v27 >= txWiredBytes;
  unint64_t v28 = v27 - txWiredBytes;
  if (!v17) {
    unint64_t v28 = 0;
  }
  self->_currentVPNInterfaceByteCounts.unint64_t txWiredBytes = v28;
  v29 = (uint64_t *)objc_msgSend(v41, "_update_adjustment_bytes");
  uint64_t v30 = *v29 + rxCellularBytes;
  if (__CFADD__(*v29, rxCellularBytes)) {
    uint64_t v30 = -1;
  }
  uint64_t *v29 = v30;
  uint64_t v31 = v29[1];
  BOOL v17 = __CFADD__(v31, rxWiFiBytes);
  uint64_t v32 = v31 + rxWiFiBytes;
  if (v17) {
    uint64_t v32 = -1;
  }
  v29[1] = v32;
  uint64_t v33 = v29[2];
  BOOL v17 = __CFADD__(v33, rxWiredBytes);
  uint64_t v34 = v33 + rxWiredBytes;
  if (v17) {
    uint64_t v34 = -1;
  }
  v29[2] = v34;
  uint64_t v35 = v29[3];
  BOOL v17 = __CFADD__(v35, txCellularBytes);
  uint64_t v36 = v35 + txCellularBytes;
  if (v17) {
    uint64_t v36 = -1;
  }
  v29[3] = v36;
  uint64_t v37 = v29[4];
  BOOL v17 = __CFADD__(v37, txWiFiBytes);
  uint64_t v38 = v37 + txWiFiBytes;
  if (v17) {
    uint64_t v38 = -1;
  }
  v29[4] = v38;
  uint64_t v39 = v29[5];
  BOOL v17 = __CFADD__(v39, txWiredBytes);
  uint64_t v40 = v39 + txWiredBytes;
  if (v17) {
    uint64_t v40 = -1;
  }
  v29[5] = v40;
}

@end