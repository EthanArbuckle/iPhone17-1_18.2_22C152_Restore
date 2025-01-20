@interface NWSSnapshot
- (NSDictionary)traditionalDictionary;
- (NSString)provider;
- (double)_rttAverage;
- (double)_rttMinimum;
- (double)_rttVariation;
- (id)_createCountsForProvider:(int)a3;
- (id)_initWithCounts:(const nstat_counts *)a3 sourceIdent:(unint64_t)a4 seqno:(unint64_t)a5;
- (id)description;
- (unint64_t)changeSeqno;
- (unint64_t)rxBytes;
- (unint64_t)rxCellularBytes;
- (unint64_t)rxPackets;
- (unint64_t)rxWiFiBytes;
- (unint64_t)rxWiredBytes;
- (unint64_t)sourceIdentifier;
- (unint64_t)txBytes;
- (unint64_t)txCellularBytes;
- (unint64_t)txPackets;
- (unint64_t)txWiFiBytes;
- (unint64_t)txWiredBytes;
- (unsigned)_connectAttempts;
- (unsigned)_connectSuccesses;
- (unsigned)_rxDuplicateBytes;
- (unsigned)_rxOutOfOrderBytes;
- (unsigned)_txRetransmittedBytes;
@end

@implementation NWSSnapshot

- (id)_initWithCounts:(const nstat_counts *)a3 sourceIdent:(unint64_t)a4 seqno:(unint64_t)a5
{
  v14.receiver = self;
  v14.super_class = (Class)NWSSnapshot;
  id result = [(NWSSnapshot *)&v14 init];
  if (result)
  {
    long long v9 = *(_OWORD *)&a3->nstat_rxpackets;
    long long v10 = *(_OWORD *)&a3->nstat_txpackets;
    *(_OWORD *)((char *)result + 40) = *(_OWORD *)&a3->nstat_cell_rxbytes;
    *(_OWORD *)((char *)result + 24) = v10;
    *(_OWORD *)((char *)result + 8) = v9;
    long long v11 = *(_OWORD *)&a3->nstat_wifi_rxbytes;
    long long v12 = *(_OWORD *)&a3->nstat_wired_rxbytes;
    long long v13 = *(_OWORD *)&a3->nstat_rxduplicatebytes;
    *(_OWORD *)((char *)result + 104) = *(_OWORD *)&a3->nstat_connectsuccesses;
    *(_OWORD *)((char *)result + 88) = v13;
    *(_OWORD *)((char *)result + 72) = v12;
    *(_OWORD *)((char *)result + 56) = v11;
    *((void *)result + 15) = a5;
    *((void *)result + 16) = a4;
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_traditionalDictionary, 0);
  objc_storeStrong((id *)&self->_provider, 0);
}

- (unint64_t)txPackets
{
  return self->_counts.nstat_txpackets;
}

- (unint64_t)txBytes
{
  return self->_counts.nstat_txbytes;
}

- (unint64_t)rxPackets
{
  return self->_counts.nstat_rxpackets;
}

- (unint64_t)rxBytes
{
  return self->_counts.nstat_rxbytes;
}

- (unsigned)_txRetransmittedBytes
{
  return self->_counts.nstat_txretransmit;
}

- (unsigned)_rxOutOfOrderBytes
{
  return self->_counts.nstat_rxoutoforderbytes;
}

- (unsigned)_rxDuplicateBytes
{
  return self->_counts.nstat_rxduplicatebytes;
}

- (double)_rttVariation
{
  LODWORD(v2) = self->_counts.nstat_var_rtt;
  return (double)v2 / 32000.0;
}

- (double)_rttMinimum
{
  LODWORD(v2) = self->_counts.nstat_min_rtt;
  return (double)v2 / 32000.0;
}

- (double)_rttAverage
{
  LODWORD(v2) = self->_counts.nstat_avg_rtt;
  return (double)v2 / 32000.0;
}

- (unsigned)_connectSuccesses
{
  return self->_counts.nstat_connectsuccesses;
}

- (unsigned)_connectAttempts
{
  return self->_counts.nstat_connectattempts;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"pkts rx %lld tx %lld, bytes %lld %lld cell %lld %lld wifi %lld %lld wired %lld %lld", -[NWSSnapshot rxPackets](self, "rxPackets"), -[NWSSnapshot txPackets](self, "txPackets"), -[NWSSnapshot rxBytes](self, "rxBytes"), -[NWSSnapshot txBytes](self, "txBytes"), -[NWSSnapshot rxCellularBytes](self, "rxCellularBytes"), -[NWSSnapshot txCellularBytes](self, "txCellularBytes"), -[NWSSnapshot rxWiFiBytes](self, "rxWiFiBytes"), -[NWSSnapshot txWiFiBytes](self, "txWiFiBytes"), -[NWSSnapshot rxWiredBytes](self, "rxWiredBytes"), -[NWSSnapshot txWiredBytes](self, "txWiredBytes")];
}

- (unint64_t)rxCellularBytes
{
  return self->_counts.nstat_cell_rxbytes;
}

- (unint64_t)rxWiFiBytes
{
  return self->_counts.nstat_wifi_rxbytes;
}

- (unint64_t)rxWiredBytes
{
  return self->_counts.nstat_wired_rxbytes;
}

- (unint64_t)txCellularBytes
{
  return self->_counts.nstat_cell_txbytes;
}

- (unint64_t)txWiFiBytes
{
  return self->_counts.nstat_wifi_txbytes;
}

- (unint64_t)txWiredBytes
{
  return self->_counts.nstat_wired_txbytes;
}

- (id)_createCountsForProvider:(int)a3
{
  id v5 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  if (v5)
  {
    if ((a3 - 1) < 3)
    {
      v7 = [NSNumber numberWithUnsignedInt:self->_counts.nstat_connectattempts];
      [v5 setObject:v7 forKeyedSubscript:kNStatSrcKeyConnectAttempt];

      v8 = [NSNumber numberWithUnsignedInt:self->_counts.nstat_connectsuccesses];
      [v5 setObject:v8 forKeyedSubscript:kNStatSrcKeyConnectSuccess];

      long long v9 = [NSNumber numberWithUnsignedInt:self->_counts.nstat_rxduplicatebytes];
      [v5 setObject:v9 forKeyedSubscript:kNStatSrcKeyRxDupeBytes];

      long long v10 = [NSNumber numberWithUnsignedInt:self->_counts.nstat_rxoutoforderbytes];
      [v5 setObject:v10 forKeyedSubscript:kNStatSrcKeyRxOOOBytes];

      long long v11 = [NSNumber numberWithUnsignedInt:self->_counts.nstat_txretransmit];
      [v5 setObject:v11 forKeyedSubscript:kNStatSrcKeyTxReTx];
    }
    else
    {
      if ((a3 - 4) < 2)
      {
LABEL_8:
        v17 = [NSNumber numberWithUnsignedLongLong:self->_counts.nstat_cell_rxbytes];
        [v5 setObject:v17 forKeyedSubscript:kNStatSrcKeyRxCellularBytes];

        v18 = [NSNumber numberWithUnsignedLongLong:self->_counts.nstat_cell_txbytes];
        [v5 setObject:v18 forKeyedSubscript:kNStatSrcKeyTxCellularBytes];

        v19 = [NSNumber numberWithUnsignedLongLong:self->_counts.nstat_wifi_rxbytes];
        [v5 setObject:v19 forKeyedSubscript:kNStatSrcKeyRxWiFiBytes];

        v20 = [NSNumber numberWithUnsignedLongLong:self->_counts.nstat_wifi_txbytes];
        [v5 setObject:v20 forKeyedSubscript:kNStatSrcKeyTxWiFiBytes];

        v21 = [NSNumber numberWithUnsignedLongLong:self->_counts.nstat_wired_rxbytes];
        [v5 setObject:v21 forKeyedSubscript:kNStatSrcKeyRxWiredBytes];

        v22 = [NSNumber numberWithUnsignedLongLong:self->_counts.nstat_wired_txbytes];
        [v5 setObject:v22 forKeyedSubscript:kNStatSrcKeyTxWiredBytes];

LABEL_9:
        v23 = [NSNumber numberWithUnsignedLongLong:self->_counts.nstat_rxpackets];
        [v5 setObject:v23 forKeyedSubscript:kNStatSrcKeyRxPackets];

        v24 = [NSNumber numberWithUnsignedLongLong:self->_counts.nstat_rxbytes];
        [v5 setObject:v24 forKeyedSubscript:kNStatSrcKeyRxBytes];

        v25 = [NSNumber numberWithUnsignedLongLong:self->_counts.nstat_txpackets];
        [v5 setObject:v25 forKeyedSubscript:kNStatSrcKeyTxPackets];

        v26 = [NSNumber numberWithUnsignedLongLong:self->_counts.nstat_txbytes];
        [v5 setObject:v26 forKeyedSubscript:kNStatSrcKeyTxBytes];

        id v27 = v5;
        goto LABEL_10;
      }
      if (a3 != 8) {
        goto LABEL_9;
      }
    }
    LODWORD(v6) = self->_counts.nstat_min_rtt;
    long long v12 = [NSNumber numberWithDouble:(double)v6 / 32000.0];
    [v5 setObject:v12 forKeyedSubscript:kNStatSrcKeyMinRTT];

    LODWORD(v13) = self->_counts.nstat_avg_rtt;
    objc_super v14 = [NSNumber numberWithDouble:(double)v13 / 32000.0];
    [v5 setObject:v14 forKeyedSubscript:kNStatSrcKeyAvgRTT];

    LODWORD(v15) = self->_counts.nstat_var_rtt;
    v16 = [NSNumber numberWithDouble:(double)v15 / 16000.0];
    [v5 setObject:v16 forKeyedSubscript:kNStatSrcKeyVarRTT];

    goto LABEL_8;
  }
LABEL_10:

  return v5;
}

- (unint64_t)changeSeqno
{
  return self->_changeSeqno;
}

- (unint64_t)sourceIdentifier
{
  return self->_sourceIdentifier;
}

- (NSString)provider
{
  return (NSString *)objc_getProperty(self, a2, 136, 1);
}

- (NSDictionary)traditionalDictionary
{
  return (NSDictionary *)objc_getProperty(self, a2, 144, 1);
}

@end