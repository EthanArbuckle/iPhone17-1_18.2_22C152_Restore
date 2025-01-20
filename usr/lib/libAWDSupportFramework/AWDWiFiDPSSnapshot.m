@interface AWDWiFiDPSSnapshot
- (AWDWiFiDPSAWDLSnapshot)awdlSnapshot;
- (AWDWiFiDPSBTSnapshot)btSnapshot;
- (AWDWiFiDPSPerACTxCompletionSnapshot)txCompletionSnapshotBE;
- (AWDWiFiDPSPerACTxCompletionSnapshot)txCompletionSnapshotBK;
- (AWDWiFiDPSPerACTxCompletionSnapshot)txCompletionSnapshotVI;
- (AWDWiFiDPSPerACTxCompletionSnapshot)txCompletionSnapshotVO;
- (AWDWiFiUsageSnapshot)lteSnapshot;
- (AWDWiFiUsageSnapshot)rc1Snapshot;
- (AWDWiFiUsageSnapshot)rc2Snapshot;
- (BOOL)hasAwdlSnapshot;
- (BOOL)hasBtSnapshot;
- (BOOL)hasLteSnapshot;
- (BOOL)hasRc1Snapshot;
- (BOOL)hasRc2Snapshot;
- (BOOL)hasTxCompletionSnapshotBE;
- (BOOL)hasTxCompletionSnapshotBK;
- (BOOL)hasTxCompletionSnapshotVI;
- (BOOL)hasTxCompletionSnapshotVO;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setAwdlSnapshot:(id)a3;
- (void)setBtSnapshot:(id)a3;
- (void)setLteSnapshot:(id)a3;
- (void)setRc1Snapshot:(id)a3;
- (void)setRc2Snapshot:(id)a3;
- (void)setTxCompletionSnapshotBE:(id)a3;
- (void)setTxCompletionSnapshotBK:(id)a3;
- (void)setTxCompletionSnapshotVI:(id)a3;
- (void)setTxCompletionSnapshotVO:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDWiFiDPSSnapshot

- (void)dealloc
{
  [(AWDWiFiDPSSnapshot *)self setTxCompletionSnapshotBE:0];
  [(AWDWiFiDPSSnapshot *)self setTxCompletionSnapshotBK:0];
  [(AWDWiFiDPSSnapshot *)self setTxCompletionSnapshotVO:0];
  [(AWDWiFiDPSSnapshot *)self setTxCompletionSnapshotVI:0];
  [(AWDWiFiDPSSnapshot *)self setBtSnapshot:0];
  [(AWDWiFiDPSSnapshot *)self setAwdlSnapshot:0];
  [(AWDWiFiDPSSnapshot *)self setRc1Snapshot:0];
  [(AWDWiFiDPSSnapshot *)self setRc2Snapshot:0];
  [(AWDWiFiDPSSnapshot *)self setLteSnapshot:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiDPSSnapshot;
  [(AWDWiFiDPSSnapshot *)&v3 dealloc];
}

- (BOOL)hasTxCompletionSnapshotBE
{
  return self->_txCompletionSnapshotBE != 0;
}

- (BOOL)hasTxCompletionSnapshotBK
{
  return self->_txCompletionSnapshotBK != 0;
}

- (BOOL)hasTxCompletionSnapshotVO
{
  return self->_txCompletionSnapshotVO != 0;
}

- (BOOL)hasTxCompletionSnapshotVI
{
  return self->_txCompletionSnapshotVI != 0;
}

- (BOOL)hasBtSnapshot
{
  return self->_btSnapshot != 0;
}

- (BOOL)hasAwdlSnapshot
{
  return self->_awdlSnapshot != 0;
}

- (BOOL)hasRc1Snapshot
{
  return self->_rc1Snapshot != 0;
}

- (BOOL)hasRc2Snapshot
{
  return self->_rc2Snapshot != 0;
}

- (BOOL)hasLteSnapshot
{
  return self->_lteSnapshot != 0;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiDPSSnapshot;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDWiFiDPSSnapshot description](&v3, sel_description), -[AWDWiFiDPSSnapshot dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  txCompletionSnapshotBE = self->_txCompletionSnapshotBE;
  if (txCompletionSnapshotBE) {
    [v3 setObject:-[AWDWiFiDPSPerACTxCompletionSnapshot dictionaryRepresentation](txCompletionSnapshotBE, "dictionaryRepresentation") forKey:@"txCompletionSnapshotBE"];
  }
  txCompletionSnapshotBK = self->_txCompletionSnapshotBK;
  if (txCompletionSnapshotBK) {
    [v3 setObject:-[AWDWiFiDPSPerACTxCompletionSnapshot dictionaryRepresentation](txCompletionSnapshotBK, "dictionaryRepresentation") forKey:@"txCompletionSnapshotBK"];
  }
  txCompletionSnapshotVO = self->_txCompletionSnapshotVO;
  if (txCompletionSnapshotVO) {
    [v3 setObject:-[AWDWiFiDPSPerACTxCompletionSnapshot dictionaryRepresentation](txCompletionSnapshotVO, "dictionaryRepresentation") forKey:@"txCompletionSnapshotVO"];
  }
  txCompletionSnapshotVI = self->_txCompletionSnapshotVI;
  if (txCompletionSnapshotVI) {
    [v3 setObject:[[-[AWDWiFiDPSPerACTxCompletionSnapshot dictionaryRepresentation](txCompletionSnapshotVI, "dictionaryRepresentation") dictionaryRepresentation] forKey:@"txCompletionSnapshotVI"];
  }
  btSnapshot = self->_btSnapshot;
  if (btSnapshot) {
    [v3 setObject: -[AWDWiFiDPSBTSnapshot dictionaryRepresentation](btSnapshot, "dictionaryRepresentation") forKey:@"btSnapshot"];
  }
  awdlSnapshot = self->_awdlSnapshot;
  if (awdlSnapshot) {
    [v3 setObject:[[-[AWDWiFiDPSAWDLSnapshot dictionaryRepresentation](awdlSnapshot, "dictionaryRepresentation") dictionaryRepresentation] forKey:@"awdlSnapshot"];
  }
  rc1Snapshot = self->_rc1Snapshot;
  if (rc1Snapshot) {
    [v3 setObject:[[rc1Snapshot dictionaryRepresentation] forKey:@"rc1Snapshot"];
  }
  rc2Snapshot = self->_rc2Snapshot;
  if (rc2Snapshot) {
    [v3 setObject:-[AWDWiFiUsageSnapshot dictionaryRepresentation](rc2Snapshot, "dictionaryRepresentation") forKey:@"rc2Snapshot"];
  }
  lteSnapshot = self->_lteSnapshot;
  if (lteSnapshot) {
    [v3 setObject:-[AWDWiFiUsageSnapshot dictionaryRepresentation](lteSnapshot, "dictionaryRepresentation") forKey:@"lteSnapshot"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWiFiDPSSnapshotReadFrom((id *)&self->super.super.isa, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_txCompletionSnapshotBE) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_txCompletionSnapshotBK) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_txCompletionSnapshotVO) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_txCompletionSnapshotVI) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_btSnapshot) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_awdlSnapshot) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_rc1Snapshot) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_rc2Snapshot) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_lteSnapshot)
  {
    PBDataWriterWriteSubmessage();
  }
}

- (void)copyTo:(id)a3
{
  if (self->_txCompletionSnapshotBE) {
    [a3 setTxCompletionSnapshotBE:];
  }
  if (self->_txCompletionSnapshotBK) {
    [a3 setTxCompletionSnapshotBK:];
  }
  if (self->_txCompletionSnapshotVO) {
    [a3 setTxCompletionSnapshotVO:];
  }
  if (self->_txCompletionSnapshotVI) {
    [a3 setTxCompletionSnapshotVI:];
  }
  if (self->_btSnapshot) {
    [a3 setBtSnapshot:];
  }
  if (self->_awdlSnapshot) {
    [a3 setAwdlSnapshot:];
  }
  if (self->_rc1Snapshot) {
    [a3 setRc1Snapshot:];
  }
  if (self->_rc2Snapshot) {
    [a3 setRc2Snapshot:];
  }
  if (self->_lteSnapshot)
  {
    [a3 setLteSnapshot:];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = (id *)[objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init")];

  v5[6] = [(AWDWiFiDPSPerACTxCompletionSnapshot *)self->_txCompletionSnapshotBE copyWithZone:a3];
  v5[7] = [(AWDWiFiDPSPerACTxCompletionSnapshot *)self->_txCompletionSnapshotBK copyWithZone:a3];

  v5[9] = [(AWDWiFiDPSPerACTxCompletionSnapshot *)self->_txCompletionSnapshotVO copyWithZone:a3];
  v5[8] = [(AWDWiFiDPSPerACTxCompletionSnapshot *)self->_txCompletionSnapshotVI copyWithZone:a3];

  v5[2] = [(AWDWiFiDPSBTSnapshot *)self->_btSnapshot copyWithZone:a3];
  v5[1] = [(AWDWiFiDPSAWDLSnapshot *)self->_awdlSnapshot copyWithZone:a3];

  v5[4] = [(AWDWiFiUsageSnapshot *)self->_rc1Snapshot copyWithZone:a3];
  v5[5] = [(AWDWiFiUsageSnapshot *)self->_rc2Snapshot copyWithZone:a3];

  v5[3] = [(AWDWiFiUsageSnapshot *)self->_lteSnapshot copyWithZone:a3];
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    txCompletionSnapshotBE = self->_txCompletionSnapshotBE;
    if (!((unint64_t)txCompletionSnapshotBE | *((void *)a3 + 6))
      || (int v5 = -[AWDWiFiDPSPerACTxCompletionSnapshot isEqual:](txCompletionSnapshotBE, "isEqual:")) != 0)
    {
      txCompletionSnapshotBK = self->_txCompletionSnapshotBK;
      if (!((unint64_t)txCompletionSnapshotBK | *((void *)a3 + 7))
        || (int v5 = -[AWDWiFiDPSPerACTxCompletionSnapshot isEqual:](txCompletionSnapshotBK, "isEqual:")) != 0)
      {
        txCompletionSnapshotVO = self->_txCompletionSnapshotVO;
        if (!((unint64_t)txCompletionSnapshotVO | *((void *)a3 + 9))
          || (int v5 = -[AWDWiFiDPSPerACTxCompletionSnapshot isEqual:](txCompletionSnapshotVO, "isEqual:")) != 0)
        {
          txCompletionSnapshotVI = self->_txCompletionSnapshotVI;
          if (!((unint64_t)txCompletionSnapshotVI | *((void *)a3 + 8))
            || (int v5 = -[AWDWiFiDPSPerACTxCompletionSnapshot isEqual:](txCompletionSnapshotVI, "isEqual:")) != 0)
          {
            btSnapshot = self->_btSnapshot;
            if (!((unint64_t)btSnapshot | *((void *)a3 + 2))
              || (int v5 = -[AWDWiFiDPSBTSnapshot isEqual:](btSnapshot, "isEqual:")) != 0)
            {
              awdlSnapshot = self->_awdlSnapshot;
              if (!((unint64_t)awdlSnapshot | *((void *)a3 + 1))
                || (int v5 = -[AWDWiFiDPSAWDLSnapshot isEqual:](awdlSnapshot, "isEqual:")) != 0)
              {
                rc1Snapshot = self->_rc1Snapshot;
                if (!((unint64_t)rc1Snapshot | *((void *)a3 + 4))
                  || (int v5 = -[AWDWiFiUsageSnapshot isEqual:](rc1Snapshot, "isEqual:")) != 0)
                {
                  rc2Snapshot = self->_rc2Snapshot;
                  if (!((unint64_t)rc2Snapshot | *((void *)a3 + 5))
                    || (int v5 = -[AWDWiFiUsageSnapshot isEqual:](rc2Snapshot, "isEqual:")) != 0)
                  {
                    lteSnapshot = self->_lteSnapshot;
                    if ((unint64_t)lteSnapshot | *((void *)a3 + 3))
                    {
                      LOBYTE(v5) = -[AWDWiFiUsageSnapshot isEqual:](lteSnapshot, "isEqual:");
                    }
                    else
                    {
                      LOBYTE(v5) = 1;
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  unint64_t v3 = [(AWDWiFiDPSPerACTxCompletionSnapshot *)self->_txCompletionSnapshotBE hash];
  unint64_t v4 = [(AWDWiFiDPSPerACTxCompletionSnapshot *)self->_txCompletionSnapshotBK hash] ^ v3;
  unint64_t v5 = [(AWDWiFiDPSPerACTxCompletionSnapshot *)self->_txCompletionSnapshotVO hash];
  unint64_t v6 = v4 ^ v5 ^ [(AWDWiFiDPSPerACTxCompletionSnapshot *)self->_txCompletionSnapshotVI hash];
  unint64_t v7 = [(AWDWiFiDPSBTSnapshot *)self->_btSnapshot hash];
  unint64_t v8 = v7 ^ [(AWDWiFiDPSAWDLSnapshot *)self->_awdlSnapshot hash];
  unint64_t v9 = v6 ^ v8 ^ [(AWDWiFiUsageSnapshot *)self->_rc1Snapshot hash];
  unint64_t v10 = [(AWDWiFiUsageSnapshot *)self->_rc2Snapshot hash];
  return v9 ^ v10 ^ [(AWDWiFiUsageSnapshot *)self->_lteSnapshot hash];
}

- (void)mergeFrom:(id)a3
{
  txCompletionSnapshotBE = self->_txCompletionSnapshotBE;
  uint64_t v6 = *((void *)a3 + 6);
  if (txCompletionSnapshotBE)
  {
    if (v6) {
      -[AWDWiFiDPSPerACTxCompletionSnapshot mergeFrom:](txCompletionSnapshotBE, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[AWDWiFiDPSSnapshot setTxCompletionSnapshotBE:](self, "setTxCompletionSnapshotBE:");
  }
  txCompletionSnapshotBK = self->_txCompletionSnapshotBK;
  uint64_t v8 = *((void *)a3 + 7);
  if (txCompletionSnapshotBK)
  {
    if (v8) {
      -[AWDWiFiDPSPerACTxCompletionSnapshot mergeFrom:](txCompletionSnapshotBK, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[AWDWiFiDPSSnapshot setTxCompletionSnapshotBK:](self, "setTxCompletionSnapshotBK:");
  }
  txCompletionSnapshotVO = self->_txCompletionSnapshotVO;
  uint64_t v10 = *((void *)a3 + 9);
  if (txCompletionSnapshotVO)
  {
    if (v10) {
      -[AWDWiFiDPSPerACTxCompletionSnapshot mergeFrom:](txCompletionSnapshotVO, "mergeFrom:");
    }
  }
  else if (v10)
  {
    -[AWDWiFiDPSSnapshot setTxCompletionSnapshotVO:](self, "setTxCompletionSnapshotVO:");
  }
  txCompletionSnapshotVI = self->_txCompletionSnapshotVI;
  uint64_t v12 = *((void *)a3 + 8);
  if (txCompletionSnapshotVI)
  {
    if (v12) {
      -[AWDWiFiDPSPerACTxCompletionSnapshot mergeFrom:](txCompletionSnapshotVI, "mergeFrom:");
    }
  }
  else if (v12)
  {
    -[AWDWiFiDPSSnapshot setTxCompletionSnapshotVI:](self, "setTxCompletionSnapshotVI:");
  }
  btSnapshot = self->_btSnapshot;
  uint64_t v14 = *((void *)a3 + 2);
  if (btSnapshot)
  {
    if (v14) {
      -[AWDWiFiDPSBTSnapshot mergeFrom:](btSnapshot, "mergeFrom:");
    }
  }
  else if (v14)
  {
    -[AWDWiFiDPSSnapshot setBtSnapshot:](self, "setBtSnapshot:");
  }
  awdlSnapshot = self->_awdlSnapshot;
  uint64_t v16 = *((void *)a3 + 1);
  if (awdlSnapshot)
  {
    if (v16) {
      -[AWDWiFiDPSAWDLSnapshot mergeFrom:](awdlSnapshot, "mergeFrom:");
    }
  }
  else if (v16)
  {
    -[AWDWiFiDPSSnapshot setAwdlSnapshot:](self, "setAwdlSnapshot:");
  }
  rc1Snapshot = self->_rc1Snapshot;
  uint64_t v18 = *((void *)a3 + 4);
  if (rc1Snapshot)
  {
    if (v18) {
      -[AWDWiFiUsageSnapshot mergeFrom:](rc1Snapshot, "mergeFrom:");
    }
  }
  else if (v18)
  {
    -[AWDWiFiDPSSnapshot setRc1Snapshot:](self, "setRc1Snapshot:");
  }
  rc2Snapshot = self->_rc2Snapshot;
  uint64_t v20 = *((void *)a3 + 5);
  if (rc2Snapshot)
  {
    if (v20) {
      -[AWDWiFiUsageSnapshot mergeFrom:](rc2Snapshot, "mergeFrom:");
    }
  }
  else if (v20)
  {
    -[AWDWiFiDPSSnapshot setRc2Snapshot:](self, "setRc2Snapshot:");
  }
  lteSnapshot = self->_lteSnapshot;
  uint64_t v22 = *((void *)a3 + 3);
  if (lteSnapshot)
  {
    if (v22)
    {
      -[AWDWiFiUsageSnapshot mergeFrom:](lteSnapshot, "mergeFrom:");
    }
  }
  else if (v22)
  {
    -[AWDWiFiDPSSnapshot setLteSnapshot:](self, "setLteSnapshot:");
  }
}

- (AWDWiFiDPSPerACTxCompletionSnapshot)txCompletionSnapshotBE
{
  return self->_txCompletionSnapshotBE;
}

- (void)setTxCompletionSnapshotBE:(id)a3
{
}

- (AWDWiFiDPSPerACTxCompletionSnapshot)txCompletionSnapshotBK
{
  return self->_txCompletionSnapshotBK;
}

- (void)setTxCompletionSnapshotBK:(id)a3
{
}

- (AWDWiFiDPSPerACTxCompletionSnapshot)txCompletionSnapshotVO
{
  return self->_txCompletionSnapshotVO;
}

- (void)setTxCompletionSnapshotVO:(id)a3
{
}

- (AWDWiFiDPSPerACTxCompletionSnapshot)txCompletionSnapshotVI
{
  return self->_txCompletionSnapshotVI;
}

- (void)setTxCompletionSnapshotVI:(id)a3
{
}

- (AWDWiFiDPSBTSnapshot)btSnapshot
{
  return self->_btSnapshot;
}

- (void)setBtSnapshot:(id)a3
{
}

- (AWDWiFiDPSAWDLSnapshot)awdlSnapshot
{
  return self->_awdlSnapshot;
}

- (void)setAwdlSnapshot:(id)a3
{
}

- (AWDWiFiUsageSnapshot)rc1Snapshot
{
  return self->_rc1Snapshot;
}

- (void)setRc1Snapshot:(id)a3
{
}

- (AWDWiFiUsageSnapshot)rc2Snapshot
{
  return self->_rc2Snapshot;
}

- (void)setRc2Snapshot:(id)a3
{
}

- (AWDWiFiUsageSnapshot)lteSnapshot
{
  return self->_lteSnapshot;
}

- (void)setLteSnapshot:(id)a3
{
}

@end