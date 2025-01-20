@interface WiFiAnalyticsAWDWiFiDPSSnapshot
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
- (WiFiAnalyticsAWDWiFiDPSAWDLSnapshot)awdlSnapshot;
- (WiFiAnalyticsAWDWiFiDPSBTSnapshot)btSnapshot;
- (WiFiAnalyticsAWDWiFiDPSPerACTxCompletionSnapshot)txCompletionSnapshotBE;
- (WiFiAnalyticsAWDWiFiDPSPerACTxCompletionSnapshot)txCompletionSnapshotBK;
- (WiFiAnalyticsAWDWiFiDPSPerACTxCompletionSnapshot)txCompletionSnapshotVI;
- (WiFiAnalyticsAWDWiFiDPSPerACTxCompletionSnapshot)txCompletionSnapshotVO;
- (WiFiAnalyticsAWDWiFiUsageSnapshot)lteSnapshot;
- (WiFiAnalyticsAWDWiFiUsageSnapshot)rc1Snapshot;
- (WiFiAnalyticsAWDWiFiUsageSnapshot)rc2Snapshot;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
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

@implementation WiFiAnalyticsAWDWiFiDPSSnapshot

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
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)WiFiAnalyticsAWDWiFiDPSSnapshot;
  v4 = [(WiFiAnalyticsAWDWiFiDPSSnapshot *)&v8 description];
  v5 = [(WiFiAnalyticsAWDWiFiDPSSnapshot *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  txCompletionSnapshotBE = self->_txCompletionSnapshotBE;
  if (txCompletionSnapshotBE)
  {
    v5 = [(WiFiAnalyticsAWDWiFiDPSPerACTxCompletionSnapshot *)txCompletionSnapshotBE dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"txCompletionSnapshotBE"];
  }
  txCompletionSnapshotBK = self->_txCompletionSnapshotBK;
  if (txCompletionSnapshotBK)
  {
    v7 = [(WiFiAnalyticsAWDWiFiDPSPerACTxCompletionSnapshot *)txCompletionSnapshotBK dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"txCompletionSnapshotBK"];
  }
  txCompletionSnapshotVO = self->_txCompletionSnapshotVO;
  if (txCompletionSnapshotVO)
  {
    v9 = [(WiFiAnalyticsAWDWiFiDPSPerACTxCompletionSnapshot *)txCompletionSnapshotVO dictionaryRepresentation];
    [v3 setObject:v9 forKey:@"txCompletionSnapshotVO"];
  }
  txCompletionSnapshotVI = self->_txCompletionSnapshotVI;
  if (txCompletionSnapshotVI)
  {
    v11 = [(WiFiAnalyticsAWDWiFiDPSPerACTxCompletionSnapshot *)txCompletionSnapshotVI dictionaryRepresentation];
    [v3 setObject:v11 forKey:@"txCompletionSnapshotVI"];
  }
  btSnapshot = self->_btSnapshot;
  if (btSnapshot)
  {
    v13 = [(WiFiAnalyticsAWDWiFiDPSBTSnapshot *)btSnapshot dictionaryRepresentation];
    [v3 setObject:v13 forKey:@"btSnapshot"];
  }
  awdlSnapshot = self->_awdlSnapshot;
  if (awdlSnapshot)
  {
    v15 = [(WiFiAnalyticsAWDWiFiDPSAWDLSnapshot *)awdlSnapshot dictionaryRepresentation];
    [v3 setObject:v15 forKey:@"awdlSnapshot"];
  }
  rc1Snapshot = self->_rc1Snapshot;
  if (rc1Snapshot)
  {
    v17 = [(WiFiAnalyticsAWDWiFiUsageSnapshot *)rc1Snapshot dictionaryRepresentation];
    [v3 setObject:v17 forKey:@"rc1Snapshot"];
  }
  rc2Snapshot = self->_rc2Snapshot;
  if (rc2Snapshot)
  {
    v19 = [(WiFiAnalyticsAWDWiFiUsageSnapshot *)rc2Snapshot dictionaryRepresentation];
    [v3 setObject:v19 forKey:@"rc2Snapshot"];
  }
  lteSnapshot = self->_lteSnapshot;
  if (lteSnapshot)
  {
    v21 = [(WiFiAnalyticsAWDWiFiUsageSnapshot *)lteSnapshot dictionaryRepresentation];
    [v3 setObject:v21 forKey:@"lteSnapshot"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return WiFiAnalyticsAWDWiFiDPSSnapshotReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_txCompletionSnapshotBE)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_txCompletionSnapshotBK)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_txCompletionSnapshotVO)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_txCompletionSnapshotVI)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_btSnapshot)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_awdlSnapshot)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_rc1Snapshot)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_rc2Snapshot)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_lteSnapshot)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_txCompletionSnapshotBE)
  {
    objc_msgSend(v4, "setTxCompletionSnapshotBE:");
    id v4 = v5;
  }
  if (self->_txCompletionSnapshotBK)
  {
    objc_msgSend(v5, "setTxCompletionSnapshotBK:");
    id v4 = v5;
  }
  if (self->_txCompletionSnapshotVO)
  {
    objc_msgSend(v5, "setTxCompletionSnapshotVO:");
    id v4 = v5;
  }
  if (self->_txCompletionSnapshotVI)
  {
    objc_msgSend(v5, "setTxCompletionSnapshotVI:");
    id v4 = v5;
  }
  if (self->_btSnapshot)
  {
    objc_msgSend(v5, "setBtSnapshot:");
    id v4 = v5;
  }
  if (self->_awdlSnapshot)
  {
    objc_msgSend(v5, "setAwdlSnapshot:");
    id v4 = v5;
  }
  if (self->_rc1Snapshot)
  {
    objc_msgSend(v5, "setRc1Snapshot:");
    id v4 = v5;
  }
  if (self->_rc2Snapshot)
  {
    objc_msgSend(v5, "setRc2Snapshot:");
    id v4 = v5;
  }
  if (self->_lteSnapshot)
  {
    objc_msgSend(v5, "setLteSnapshot:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(WiFiAnalyticsAWDWiFiDPSPerACTxCompletionSnapshot *)self->_txCompletionSnapshotBE copyWithZone:a3];
  v7 = (void *)v5[6];
  v5[6] = v6;

  id v8 = [(WiFiAnalyticsAWDWiFiDPSPerACTxCompletionSnapshot *)self->_txCompletionSnapshotBK copyWithZone:a3];
  v9 = (void *)v5[7];
  v5[7] = v8;

  id v10 = [(WiFiAnalyticsAWDWiFiDPSPerACTxCompletionSnapshot *)self->_txCompletionSnapshotVO copyWithZone:a3];
  v11 = (void *)v5[9];
  v5[9] = v10;

  id v12 = [(WiFiAnalyticsAWDWiFiDPSPerACTxCompletionSnapshot *)self->_txCompletionSnapshotVI copyWithZone:a3];
  v13 = (void *)v5[8];
  v5[8] = v12;

  id v14 = [(WiFiAnalyticsAWDWiFiDPSBTSnapshot *)self->_btSnapshot copyWithZone:a3];
  v15 = (void *)v5[2];
  v5[2] = v14;

  id v16 = [(WiFiAnalyticsAWDWiFiDPSAWDLSnapshot *)self->_awdlSnapshot copyWithZone:a3];
  v17 = (void *)v5[1];
  v5[1] = v16;

  id v18 = [(WiFiAnalyticsAWDWiFiUsageSnapshot *)self->_rc1Snapshot copyWithZone:a3];
  v19 = (void *)v5[4];
  v5[4] = v18;

  id v20 = [(WiFiAnalyticsAWDWiFiUsageSnapshot *)self->_rc2Snapshot copyWithZone:a3];
  v21 = (void *)v5[5];
  v5[5] = v20;

  id v22 = [(WiFiAnalyticsAWDWiFiUsageSnapshot *)self->_lteSnapshot copyWithZone:a3];
  v23 = (void *)v5[3];
  v5[3] = v22;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_20;
  }
  txCompletionSnapshotBE = self->_txCompletionSnapshotBE;
  if ((unint64_t)txCompletionSnapshotBE | v4[6])
  {
    if (!-[WiFiAnalyticsAWDWiFiDPSPerACTxCompletionSnapshot isEqual:](txCompletionSnapshotBE, "isEqual:")) {
      goto LABEL_20;
    }
  }
  if (((txCompletionSnapshotBK = self->_txCompletionSnapshotBK, !((unint64_t)txCompletionSnapshotBK | v4[7]))
     || -[WiFiAnalyticsAWDWiFiDPSPerACTxCompletionSnapshot isEqual:](txCompletionSnapshotBK, "isEqual:"))
    && ((txCompletionSnapshotVO = self->_txCompletionSnapshotVO, !((unint64_t)txCompletionSnapshotVO | v4[9]))
     || -[WiFiAnalyticsAWDWiFiDPSPerACTxCompletionSnapshot isEqual:](txCompletionSnapshotVO, "isEqual:"))
    && ((txCompletionSnapshotVI = self->_txCompletionSnapshotVI, !((unint64_t)txCompletionSnapshotVI | v4[8]))
     || -[WiFiAnalyticsAWDWiFiDPSPerACTxCompletionSnapshot isEqual:](txCompletionSnapshotVI, "isEqual:"))
    && ((btSnapshot = self->_btSnapshot, !((unint64_t)btSnapshot | v4[2]))
     || -[WiFiAnalyticsAWDWiFiDPSBTSnapshot isEqual:](btSnapshot, "isEqual:"))
    && ((awdlSnapshot = self->_awdlSnapshot, !((unint64_t)awdlSnapshot | v4[1]))
     || -[WiFiAnalyticsAWDWiFiDPSAWDLSnapshot isEqual:](awdlSnapshot, "isEqual:"))
    && ((rc1Snapshot = self->_rc1Snapshot, !((unint64_t)rc1Snapshot | v4[4]))
     || -[WiFiAnalyticsAWDWiFiUsageSnapshot isEqual:](rc1Snapshot, "isEqual:"))
    && ((rc2Snapshot = self->_rc2Snapshot, !((unint64_t)rc2Snapshot | v4[5]))
     || -[WiFiAnalyticsAWDWiFiUsageSnapshot isEqual:](rc2Snapshot, "isEqual:")))
  {
    lteSnapshot = self->_lteSnapshot;
    if ((unint64_t)lteSnapshot | v4[3]) {
      char v14 = -[WiFiAnalyticsAWDWiFiUsageSnapshot isEqual:](lteSnapshot, "isEqual:");
    }
    else {
      char v14 = 1;
    }
  }
  else
  {
LABEL_20:
    char v14 = 0;
  }

  return v14;
}

- (unint64_t)hash
{
  unint64_t v3 = [(WiFiAnalyticsAWDWiFiDPSPerACTxCompletionSnapshot *)self->_txCompletionSnapshotBE hash];
  unint64_t v4 = [(WiFiAnalyticsAWDWiFiDPSPerACTxCompletionSnapshot *)self->_txCompletionSnapshotBK hash] ^ v3;
  unint64_t v5 = [(WiFiAnalyticsAWDWiFiDPSPerACTxCompletionSnapshot *)self->_txCompletionSnapshotVO hash];
  unint64_t v6 = v4 ^ v5 ^ [(WiFiAnalyticsAWDWiFiDPSPerACTxCompletionSnapshot *)self->_txCompletionSnapshotVI hash];
  unint64_t v7 = [(WiFiAnalyticsAWDWiFiDPSBTSnapshot *)self->_btSnapshot hash];
  unint64_t v8 = v7 ^ [(WiFiAnalyticsAWDWiFiDPSAWDLSnapshot *)self->_awdlSnapshot hash];
  unint64_t v9 = v6 ^ v8 ^ [(WiFiAnalyticsAWDWiFiUsageSnapshot *)self->_rc1Snapshot hash];
  unint64_t v10 = [(WiFiAnalyticsAWDWiFiUsageSnapshot *)self->_rc2Snapshot hash];
  return v9 ^ v10 ^ [(WiFiAnalyticsAWDWiFiUsageSnapshot *)self->_lteSnapshot hash];
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = a3;
  txCompletionSnapshotBE = self->_txCompletionSnapshotBE;
  v23 = v4;
  uint64_t v6 = v4[6];
  if (txCompletionSnapshotBE)
  {
    if (v6) {
      -[WiFiAnalyticsAWDWiFiDPSPerACTxCompletionSnapshot mergeFrom:](txCompletionSnapshotBE, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[WiFiAnalyticsAWDWiFiDPSSnapshot setTxCompletionSnapshotBE:](self, "setTxCompletionSnapshotBE:");
  }
  txCompletionSnapshotBK = self->_txCompletionSnapshotBK;
  uint64_t v8 = v23[7];
  if (txCompletionSnapshotBK)
  {
    if (v8) {
      -[WiFiAnalyticsAWDWiFiDPSPerACTxCompletionSnapshot mergeFrom:](txCompletionSnapshotBK, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[WiFiAnalyticsAWDWiFiDPSSnapshot setTxCompletionSnapshotBK:](self, "setTxCompletionSnapshotBK:");
  }
  txCompletionSnapshotVO = self->_txCompletionSnapshotVO;
  uint64_t v10 = v23[9];
  if (txCompletionSnapshotVO)
  {
    if (v10) {
      -[WiFiAnalyticsAWDWiFiDPSPerACTxCompletionSnapshot mergeFrom:](txCompletionSnapshotVO, "mergeFrom:");
    }
  }
  else if (v10)
  {
    -[WiFiAnalyticsAWDWiFiDPSSnapshot setTxCompletionSnapshotVO:](self, "setTxCompletionSnapshotVO:");
  }
  txCompletionSnapshotVI = self->_txCompletionSnapshotVI;
  uint64_t v12 = v23[8];
  if (txCompletionSnapshotVI)
  {
    if (v12) {
      -[WiFiAnalyticsAWDWiFiDPSPerACTxCompletionSnapshot mergeFrom:](txCompletionSnapshotVI, "mergeFrom:");
    }
  }
  else if (v12)
  {
    -[WiFiAnalyticsAWDWiFiDPSSnapshot setTxCompletionSnapshotVI:](self, "setTxCompletionSnapshotVI:");
  }
  btSnapshot = self->_btSnapshot;
  uint64_t v14 = v23[2];
  if (btSnapshot)
  {
    if (v14) {
      -[WiFiAnalyticsAWDWiFiDPSBTSnapshot mergeFrom:](btSnapshot, "mergeFrom:");
    }
  }
  else if (v14)
  {
    -[WiFiAnalyticsAWDWiFiDPSSnapshot setBtSnapshot:](self, "setBtSnapshot:");
  }
  awdlSnapshot = self->_awdlSnapshot;
  uint64_t v16 = v23[1];
  if (awdlSnapshot)
  {
    if (v16) {
      -[WiFiAnalyticsAWDWiFiDPSAWDLSnapshot mergeFrom:](awdlSnapshot, "mergeFrom:");
    }
  }
  else if (v16)
  {
    -[WiFiAnalyticsAWDWiFiDPSSnapshot setAwdlSnapshot:](self, "setAwdlSnapshot:");
  }
  rc1Snapshot = self->_rc1Snapshot;
  uint64_t v18 = v23[4];
  if (rc1Snapshot)
  {
    if (v18) {
      -[WiFiAnalyticsAWDWiFiUsageSnapshot mergeFrom:](rc1Snapshot, "mergeFrom:");
    }
  }
  else if (v18)
  {
    -[WiFiAnalyticsAWDWiFiDPSSnapshot setRc1Snapshot:](self, "setRc1Snapshot:");
  }
  rc2Snapshot = self->_rc2Snapshot;
  uint64_t v20 = v23[5];
  if (rc2Snapshot)
  {
    if (v20) {
      -[WiFiAnalyticsAWDWiFiUsageSnapshot mergeFrom:](rc2Snapshot, "mergeFrom:");
    }
  }
  else if (v20)
  {
    -[WiFiAnalyticsAWDWiFiDPSSnapshot setRc2Snapshot:](self, "setRc2Snapshot:");
  }
  lteSnapshot = self->_lteSnapshot;
  uint64_t v22 = v23[3];
  if (lteSnapshot)
  {
    if (v22) {
      -[WiFiAnalyticsAWDWiFiUsageSnapshot mergeFrom:](lteSnapshot, "mergeFrom:");
    }
  }
  else if (v22)
  {
    -[WiFiAnalyticsAWDWiFiDPSSnapshot setLteSnapshot:](self, "setLteSnapshot:");
  }
}

- (WiFiAnalyticsAWDWiFiDPSPerACTxCompletionSnapshot)txCompletionSnapshotBE
{
  return self->_txCompletionSnapshotBE;
}

- (void)setTxCompletionSnapshotBE:(id)a3
{
}

- (WiFiAnalyticsAWDWiFiDPSPerACTxCompletionSnapshot)txCompletionSnapshotBK
{
  return self->_txCompletionSnapshotBK;
}

- (void)setTxCompletionSnapshotBK:(id)a3
{
}

- (WiFiAnalyticsAWDWiFiDPSPerACTxCompletionSnapshot)txCompletionSnapshotVO
{
  return self->_txCompletionSnapshotVO;
}

- (void)setTxCompletionSnapshotVO:(id)a3
{
}

- (WiFiAnalyticsAWDWiFiDPSPerACTxCompletionSnapshot)txCompletionSnapshotVI
{
  return self->_txCompletionSnapshotVI;
}

- (void)setTxCompletionSnapshotVI:(id)a3
{
}

- (WiFiAnalyticsAWDWiFiDPSBTSnapshot)btSnapshot
{
  return self->_btSnapshot;
}

- (void)setBtSnapshot:(id)a3
{
}

- (WiFiAnalyticsAWDWiFiDPSAWDLSnapshot)awdlSnapshot
{
  return self->_awdlSnapshot;
}

- (void)setAwdlSnapshot:(id)a3
{
}

- (WiFiAnalyticsAWDWiFiUsageSnapshot)rc1Snapshot
{
  return self->_rc1Snapshot;
}

- (void)setRc1Snapshot:(id)a3
{
}

- (WiFiAnalyticsAWDWiFiUsageSnapshot)rc2Snapshot
{
  return self->_rc2Snapshot;
}

- (void)setRc2Snapshot:(id)a3
{
}

- (WiFiAnalyticsAWDWiFiUsageSnapshot)lteSnapshot
{
  return self->_lteSnapshot;
}

- (void)setLteSnapshot:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_txCompletionSnapshotVO, 0);
  objc_storeStrong((id *)&self->_txCompletionSnapshotVI, 0);
  objc_storeStrong((id *)&self->_txCompletionSnapshotBK, 0);
  objc_storeStrong((id *)&self->_txCompletionSnapshotBE, 0);
  objc_storeStrong((id *)&self->_rc2Snapshot, 0);
  objc_storeStrong((id *)&self->_rc1Snapshot, 0);
  objc_storeStrong((id *)&self->_lteSnapshot, 0);
  objc_storeStrong((id *)&self->_btSnapshot, 0);
  objc_storeStrong((id *)&self->_awdlSnapshot, 0);
}

@end