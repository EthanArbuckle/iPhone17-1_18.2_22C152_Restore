@interface AWDLibnetcoreTCPECNInterfaceStatsReport
- (BOOL)hasInterfaceType;
- (BOOL)hasIpProtocol;
- (BOOL)hasTcpECNIntClientSetup;
- (BOOL)hasTcpECNIntClientSuccess;
- (BOOL)hasTcpECNIntConnNoPLCE;
- (BOOL)hasTcpECNIntConnPLCE;
- (BOOL)hasTcpECNIntConnPLNoCE;
- (BOOL)hasTcpECNIntConnRecvCE;
- (BOOL)hasTcpECNIntConnRecvECE;
- (BOOL)hasTcpECNIntFallbackCE;
- (BOOL)hasTcpECNIntFallbackDropRst;
- (BOOL)hasTcpECNIntFallbackDropRxmt;
- (BOOL)hasTcpECNIntFallbackReorder;
- (BOOL)hasTcpECNIntFallbackSYNRst;
- (BOOL)hasTcpECNIntFallbackSynLoss;
- (BOOL)hasTcpECNIntNotSupportedPeer;
- (BOOL)hasTcpECNIntOffAvgRTT;
- (BOOL)hasTcpECNIntOffDropRst;
- (BOOL)hasTcpECNIntOffDropRxmt;
- (BOOL)hasTcpECNIntOffOOBPer;
- (BOOL)hasTcpECNIntOffRTTVar;
- (BOOL)hasTcpECNIntOffReorderPer;
- (BOOL)hasTcpECNIntOffRxmtPer;
- (BOOL)hasTcpECNIntOffSACKE;
- (BOOL)hasTcpECNIntOffTotalOOPkts;
- (BOOL)hasTcpECNIntOffTotalRxPkts;
- (BOOL)hasTcpECNIntOffTotalRxmtPkts;
- (BOOL)hasTcpECNIntOffTotalTxPkts;
- (BOOL)hasTcpECNIntOnAvgRTT;
- (BOOL)hasTcpECNIntOnDropRst;
- (BOOL)hasTcpECNIntOnDropRxmt;
- (BOOL)hasTcpECNIntOnOOBPer;
- (BOOL)hasTcpECNIntOnRTTVar;
- (BOOL)hasTcpECNIntOnReorderPer;
- (BOOL)hasTcpECNIntOnSACKE;
- (BOOL)hasTcpECNIntOnTotalOOPkts;
- (BOOL)hasTcpECNIntOnTotalRxPkts;
- (BOOL)hasTcpECNIntOnTotalRxmtPkts;
- (BOOL)hasTcpECNIntOnTotalTxPkts;
- (BOOL)hasTcpECNIntRecvCE;
- (BOOL)hasTcpECNIntRecvECE;
- (BOOL)hasTcpECNIntRxmtPer;
- (BOOL)hasTcpECNIntSentECE;
- (BOOL)hasTcpECNIntServerSetup;
- (BOOL)hasTcpECNIntServerSuccess;
- (BOOL)hasTcpECNIntSynAckLost;
- (BOOL)hasTcpECNIntSynLost;
- (BOOL)hasTcpECNIntTotalConnections;
- (BOOL)hasTcpUnsentDataAtSleepCnt;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)interfaceType;
- (unint64_t)ipProtocol;
- (unint64_t)tcpECNIntClientSetup;
- (unint64_t)tcpECNIntClientSuccess;
- (unint64_t)tcpECNIntConnNoPLCE;
- (unint64_t)tcpECNIntConnPLCE;
- (unint64_t)tcpECNIntConnPLNoCE;
- (unint64_t)tcpECNIntConnRecvCE;
- (unint64_t)tcpECNIntConnRecvECE;
- (unint64_t)tcpECNIntFallbackCE;
- (unint64_t)tcpECNIntFallbackDropRst;
- (unint64_t)tcpECNIntFallbackDropRxmt;
- (unint64_t)tcpECNIntFallbackReorder;
- (unint64_t)tcpECNIntFallbackSYNRst;
- (unint64_t)tcpECNIntFallbackSynLoss;
- (unint64_t)tcpECNIntNotSupportedPeer;
- (unint64_t)tcpECNIntOffAvgRTT;
- (unint64_t)tcpECNIntOffDropRst;
- (unint64_t)tcpECNIntOffDropRxmt;
- (unint64_t)tcpECNIntOffOOBPer;
- (unint64_t)tcpECNIntOffRTTVar;
- (unint64_t)tcpECNIntOffReorderPer;
- (unint64_t)tcpECNIntOffRxmtPer;
- (unint64_t)tcpECNIntOffSACKE;
- (unint64_t)tcpECNIntOffTotalOOPkts;
- (unint64_t)tcpECNIntOffTotalRxPkts;
- (unint64_t)tcpECNIntOffTotalRxmtPkts;
- (unint64_t)tcpECNIntOffTotalTxPkts;
- (unint64_t)tcpECNIntOnAvgRTT;
- (unint64_t)tcpECNIntOnDropRst;
- (unint64_t)tcpECNIntOnDropRxmt;
- (unint64_t)tcpECNIntOnOOBPer;
- (unint64_t)tcpECNIntOnRTTVar;
- (unint64_t)tcpECNIntOnReorderPer;
- (unint64_t)tcpECNIntOnSACKE;
- (unint64_t)tcpECNIntOnTotalOOPkts;
- (unint64_t)tcpECNIntOnTotalRxPkts;
- (unint64_t)tcpECNIntOnTotalRxmtPkts;
- (unint64_t)tcpECNIntOnTotalTxPkts;
- (unint64_t)tcpECNIntRecvCE;
- (unint64_t)tcpECNIntRecvECE;
- (unint64_t)tcpECNIntRxmtPer;
- (unint64_t)tcpECNIntSentECE;
- (unint64_t)tcpECNIntServerSetup;
- (unint64_t)tcpECNIntServerSuccess;
- (unint64_t)tcpECNIntSynAckLost;
- (unint64_t)tcpECNIntSynLost;
- (unint64_t)tcpECNIntTotalConnections;
- (unint64_t)tcpUnsentDataAtSleepCnt;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasInterfaceType:(BOOL)a3;
- (void)setHasIpProtocol:(BOOL)a3;
- (void)setHasTcpECNIntClientSetup:(BOOL)a3;
- (void)setHasTcpECNIntClientSuccess:(BOOL)a3;
- (void)setHasTcpECNIntConnNoPLCE:(BOOL)a3;
- (void)setHasTcpECNIntConnPLCE:(BOOL)a3;
- (void)setHasTcpECNIntConnPLNoCE:(BOOL)a3;
- (void)setHasTcpECNIntConnRecvCE:(BOOL)a3;
- (void)setHasTcpECNIntConnRecvECE:(BOOL)a3;
- (void)setHasTcpECNIntFallbackCE:(BOOL)a3;
- (void)setHasTcpECNIntFallbackDropRst:(BOOL)a3;
- (void)setHasTcpECNIntFallbackDropRxmt:(BOOL)a3;
- (void)setHasTcpECNIntFallbackReorder:(BOOL)a3;
- (void)setHasTcpECNIntFallbackSYNRst:(BOOL)a3;
- (void)setHasTcpECNIntFallbackSynLoss:(BOOL)a3;
- (void)setHasTcpECNIntNotSupportedPeer:(BOOL)a3;
- (void)setHasTcpECNIntOffAvgRTT:(BOOL)a3;
- (void)setHasTcpECNIntOffDropRst:(BOOL)a3;
- (void)setHasTcpECNIntOffDropRxmt:(BOOL)a3;
- (void)setHasTcpECNIntOffOOBPer:(BOOL)a3;
- (void)setHasTcpECNIntOffRTTVar:(BOOL)a3;
- (void)setHasTcpECNIntOffReorderPer:(BOOL)a3;
- (void)setHasTcpECNIntOffRxmtPer:(BOOL)a3;
- (void)setHasTcpECNIntOffSACKE:(BOOL)a3;
- (void)setHasTcpECNIntOffTotalOOPkts:(BOOL)a3;
- (void)setHasTcpECNIntOffTotalRxPkts:(BOOL)a3;
- (void)setHasTcpECNIntOffTotalRxmtPkts:(BOOL)a3;
- (void)setHasTcpECNIntOffTotalTxPkts:(BOOL)a3;
- (void)setHasTcpECNIntOnAvgRTT:(BOOL)a3;
- (void)setHasTcpECNIntOnDropRst:(BOOL)a3;
- (void)setHasTcpECNIntOnDropRxmt:(BOOL)a3;
- (void)setHasTcpECNIntOnOOBPer:(BOOL)a3;
- (void)setHasTcpECNIntOnRTTVar:(BOOL)a3;
- (void)setHasTcpECNIntOnReorderPer:(BOOL)a3;
- (void)setHasTcpECNIntOnSACKE:(BOOL)a3;
- (void)setHasTcpECNIntOnTotalOOPkts:(BOOL)a3;
- (void)setHasTcpECNIntOnTotalRxPkts:(BOOL)a3;
- (void)setHasTcpECNIntOnTotalRxmtPkts:(BOOL)a3;
- (void)setHasTcpECNIntOnTotalTxPkts:(BOOL)a3;
- (void)setHasTcpECNIntRecvCE:(BOOL)a3;
- (void)setHasTcpECNIntRecvECE:(BOOL)a3;
- (void)setHasTcpECNIntRxmtPer:(BOOL)a3;
- (void)setHasTcpECNIntSentECE:(BOOL)a3;
- (void)setHasTcpECNIntServerSetup:(BOOL)a3;
- (void)setHasTcpECNIntServerSuccess:(BOOL)a3;
- (void)setHasTcpECNIntSynAckLost:(BOOL)a3;
- (void)setHasTcpECNIntSynLost:(BOOL)a3;
- (void)setHasTcpECNIntTotalConnections:(BOOL)a3;
- (void)setHasTcpUnsentDataAtSleepCnt:(BOOL)a3;
- (void)setInterfaceType:(unint64_t)a3;
- (void)setIpProtocol:(unint64_t)a3;
- (void)setTcpECNIntClientSetup:(unint64_t)a3;
- (void)setTcpECNIntClientSuccess:(unint64_t)a3;
- (void)setTcpECNIntConnNoPLCE:(unint64_t)a3;
- (void)setTcpECNIntConnPLCE:(unint64_t)a3;
- (void)setTcpECNIntConnPLNoCE:(unint64_t)a3;
- (void)setTcpECNIntConnRecvCE:(unint64_t)a3;
- (void)setTcpECNIntConnRecvECE:(unint64_t)a3;
- (void)setTcpECNIntFallbackCE:(unint64_t)a3;
- (void)setTcpECNIntFallbackDropRst:(unint64_t)a3;
- (void)setTcpECNIntFallbackDropRxmt:(unint64_t)a3;
- (void)setTcpECNIntFallbackReorder:(unint64_t)a3;
- (void)setTcpECNIntFallbackSYNRst:(unint64_t)a3;
- (void)setTcpECNIntFallbackSynLoss:(unint64_t)a3;
- (void)setTcpECNIntNotSupportedPeer:(unint64_t)a3;
- (void)setTcpECNIntOffAvgRTT:(unint64_t)a3;
- (void)setTcpECNIntOffDropRst:(unint64_t)a3;
- (void)setTcpECNIntOffDropRxmt:(unint64_t)a3;
- (void)setTcpECNIntOffOOBPer:(unint64_t)a3;
- (void)setTcpECNIntOffRTTVar:(unint64_t)a3;
- (void)setTcpECNIntOffReorderPer:(unint64_t)a3;
- (void)setTcpECNIntOffRxmtPer:(unint64_t)a3;
- (void)setTcpECNIntOffSACKE:(unint64_t)a3;
- (void)setTcpECNIntOffTotalOOPkts:(unint64_t)a3;
- (void)setTcpECNIntOffTotalRxPkts:(unint64_t)a3;
- (void)setTcpECNIntOffTotalRxmtPkts:(unint64_t)a3;
- (void)setTcpECNIntOffTotalTxPkts:(unint64_t)a3;
- (void)setTcpECNIntOnAvgRTT:(unint64_t)a3;
- (void)setTcpECNIntOnDropRst:(unint64_t)a3;
- (void)setTcpECNIntOnDropRxmt:(unint64_t)a3;
- (void)setTcpECNIntOnOOBPer:(unint64_t)a3;
- (void)setTcpECNIntOnRTTVar:(unint64_t)a3;
- (void)setTcpECNIntOnReorderPer:(unint64_t)a3;
- (void)setTcpECNIntOnSACKE:(unint64_t)a3;
- (void)setTcpECNIntOnTotalOOPkts:(unint64_t)a3;
- (void)setTcpECNIntOnTotalRxPkts:(unint64_t)a3;
- (void)setTcpECNIntOnTotalRxmtPkts:(unint64_t)a3;
- (void)setTcpECNIntOnTotalTxPkts:(unint64_t)a3;
- (void)setTcpECNIntRecvCE:(unint64_t)a3;
- (void)setTcpECNIntRecvECE:(unint64_t)a3;
- (void)setTcpECNIntRxmtPer:(unint64_t)a3;
- (void)setTcpECNIntSentECE:(unint64_t)a3;
- (void)setTcpECNIntServerSetup:(unint64_t)a3;
- (void)setTcpECNIntServerSuccess:(unint64_t)a3;
- (void)setTcpECNIntSynAckLost:(unint64_t)a3;
- (void)setTcpECNIntSynLost:(unint64_t)a3;
- (void)setTcpECNIntTotalConnections:(unint64_t)a3;
- (void)setTcpUnsentDataAtSleepCnt:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDLibnetcoreTCPECNInterfaceStatsReport

- (void)setInterfaceType:(unint64_t)a3
{
  *(void *)&self->_has |= 1uLL;
  self->_interfaceType = a3;
}

- (void)setHasInterfaceType:(BOOL)a3
{
  self->_has = ($E9537ED3C3FE9D68E134AF95349F1C12)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFFELL | a3);
}

- (BOOL)hasInterfaceType
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setIpProtocol:(unint64_t)a3
{
  *(void *)&self->_has |= 2uLL;
  self->_ipProtocol = a3;
}

- (void)setHasIpProtocol:(BOOL)a3
{
  uint64_t v3 = 2;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($E9537ED3C3FE9D68E134AF95349F1C12)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFFDLL | v3);
}

- (BOOL)hasIpProtocol
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setTcpECNIntClientSetup:(unint64_t)a3
{
  *(void *)&self->_has |= 4uLL;
  self->_tcpECNIntClientSetup = a3;
}

- (void)setHasTcpECNIntClientSetup:(BOOL)a3
{
  uint64_t v3 = 4;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($E9537ED3C3FE9D68E134AF95349F1C12)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFFBLL | v3);
}

- (BOOL)hasTcpECNIntClientSetup
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setTcpECNIntServerSetup:(unint64_t)a3
{
  *(void *)&self->_has |= 0x80000000000uLL;
  self->_tcpECNIntServerSetup = a3;
}

- (void)setHasTcpECNIntServerSetup:(BOOL)a3
{
  uint64_t v3 = 0x80000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($E9537ED3C3FE9D68E134AF95349F1C12)(*(void *)&self->_has & 0xFFFFF7FFFFFFFFFFLL | v3);
}

- (BOOL)hasTcpECNIntServerSetup
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 3) & 1;
}

- (void)setTcpECNIntClientSuccess:(unint64_t)a3
{
  *(void *)&self->_has |= 8uLL;
  self->_tcpECNIntClientSuccess = a3;
}

- (void)setHasTcpECNIntClientSuccess:(BOOL)a3
{
  uint64_t v3 = 8;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($E9537ED3C3FE9D68E134AF95349F1C12)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFF7 | v3);
}

- (BOOL)hasTcpECNIntClientSuccess
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setTcpECNIntServerSuccess:(unint64_t)a3
{
  *(void *)&self->_has |= 0x100000000000uLL;
  self->_tcpECNIntServerSuccess = a3;
}

- (void)setHasTcpECNIntServerSuccess:(BOOL)a3
{
  uint64_t v3 = 0x100000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($E9537ED3C3FE9D68E134AF95349F1C12)(*(void *)&self->_has & 0xFFFFEFFFFFFFFFFFLL | v3);
}

- (BOOL)hasTcpECNIntServerSuccess
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 4) & 1;
}

- (void)setTcpECNIntNotSupportedPeer:(unint64_t)a3
{
  *(void *)&self->_has |= 0x8000uLL;
  self->_tcpECNIntNotSupportedPeer = a3;
}

- (void)setHasTcpECNIntNotSupportedPeer:(BOOL)a3
{
  uint64_t v3 = 0x8000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($E9537ED3C3FE9D68E134AF95349F1C12)(*(void *)&self->_has & 0xFFFFFFFFFFFF7FFFLL | v3);
}

- (BOOL)hasTcpECNIntNotSupportedPeer
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setTcpECNIntSynLost:(unint64_t)a3
{
  *(void *)&self->_has |= 0x400000000000uLL;
  self->_tcpECNIntSynLost = a3;
}

- (void)setHasTcpECNIntSynLost:(BOOL)a3
{
  uint64_t v3 = 0x400000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($E9537ED3C3FE9D68E134AF95349F1C12)(*(void *)&self->_has & 0xFFFFBFFFFFFFFFFFLL | v3);
}

- (BOOL)hasTcpECNIntSynLost
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 6) & 1;
}

- (void)setTcpECNIntSynAckLost:(unint64_t)a3
{
  *(void *)&self->_has |= 0x200000000000uLL;
  self->_tcpECNIntSynAckLost = a3;
}

- (void)setHasTcpECNIntSynAckLost:(BOOL)a3
{
  uint64_t v3 = 0x200000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($E9537ED3C3FE9D68E134AF95349F1C12)(*(void *)&self->_has & 0xFFFFDFFFFFFFFFFFLL | v3);
}

- (BOOL)hasTcpECNIntSynAckLost
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 5) & 1;
}

- (void)setTcpECNIntRecvCE:(unint64_t)a3
{
  *(void *)&self->_has |= 0x8000000000uLL;
  self->_tcpECNIntRecvCE = a3;
}

- (void)setHasTcpECNIntRecvCE:(BOOL)a3
{
  uint64_t v3 = 0x8000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($E9537ED3C3FE9D68E134AF95349F1C12)(*(void *)&self->_has & 0xFFFFFF7FFFFFFFFFLL | v3);
}

- (BOOL)hasTcpECNIntRecvCE
{
  return *((unsigned __int8 *)&self->_has + 4) >> 7;
}

- (void)setTcpECNIntRecvECE:(unint64_t)a3
{
  *(void *)&self->_has |= 0x10000000000uLL;
  self->_tcpECNIntRecvECE = a3;
}

- (void)setHasTcpECNIntRecvECE:(BOOL)a3
{
  uint64_t v3 = 0x10000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($E9537ED3C3FE9D68E134AF95349F1C12)(*(void *)&self->_has & 0xFFFFFEFFFFFFFFFFLL | v3);
}

- (BOOL)hasTcpECNIntRecvECE
{
  return *((unsigned char *)&self->_has + 5) & 1;
}

- (void)setTcpECNIntSentECE:(unint64_t)a3
{
  *(void *)&self->_has |= 0x40000000000uLL;
  self->_tcpECNIntSentECE = a3;
}

- (void)setHasTcpECNIntSentECE:(BOOL)a3
{
  uint64_t v3 = 0x40000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($E9537ED3C3FE9D68E134AF95349F1C12)(*(void *)&self->_has & 0xFFFFFBFFFFFFFFFFLL | v3);
}

- (BOOL)hasTcpECNIntSentECE
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 2) & 1;
}

- (void)setTcpECNIntConnRecvCE:(unint64_t)a3
{
  *(void *)&self->_has |= 0x80uLL;
  self->_tcpECNIntConnRecvCE = a3;
}

- (void)setHasTcpECNIntConnRecvCE:(BOOL)a3
{
  uint64_t v3 = 128;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($E9537ED3C3FE9D68E134AF95349F1C12)(*(void *)&self->_has & 0xFFFFFFFFFFFFFF7FLL | v3);
}

- (BOOL)hasTcpECNIntConnRecvCE
{
  return *(unsigned char *)&self->_has >> 7;
}

- (void)setTcpECNIntConnRecvECE:(unint64_t)a3
{
  *(void *)&self->_has |= 0x100uLL;
  self->_tcpECNIntConnRecvECE = a3;
}

- (void)setHasTcpECNIntConnRecvECE:(BOOL)a3
{
  uint64_t v3 = 256;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($E9537ED3C3FE9D68E134AF95349F1C12)(*(void *)&self->_has & 0xFFFFFFFFFFFFFEFFLL | v3);
}

- (BOOL)hasTcpECNIntConnRecvECE
{
  return *((unsigned char *)&self->_has + 1) & 1;
}

- (void)setTcpECNIntConnPLNoCE:(unint64_t)a3
{
  *(void *)&self->_has |= 0x40uLL;
  self->_tcpECNIntConnPLNoCE = a3;
}

- (void)setHasTcpECNIntConnPLNoCE:(BOOL)a3
{
  uint64_t v3 = 64;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($E9537ED3C3FE9D68E134AF95349F1C12)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFBFLL | v3);
}

- (BOOL)hasTcpECNIntConnPLNoCE
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setTcpECNIntConnPLCE:(unint64_t)a3
{
  *(void *)&self->_has |= 0x20uLL;
  self->_tcpECNIntConnPLCE = a3;
}

- (void)setHasTcpECNIntConnPLCE:(BOOL)a3
{
  uint64_t v3 = 32;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($E9537ED3C3FE9D68E134AF95349F1C12)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFDFLL | v3);
}

- (BOOL)hasTcpECNIntConnPLCE
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setTcpECNIntConnNoPLCE:(unint64_t)a3
{
  *(void *)&self->_has |= 0x10uLL;
  self->_tcpECNIntConnNoPLCE = a3;
}

- (void)setHasTcpECNIntConnNoPLCE:(BOOL)a3
{
  uint64_t v3 = 16;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($E9537ED3C3FE9D68E134AF95349F1C12)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFEFLL | v3);
}

- (BOOL)hasTcpECNIntConnNoPLCE
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setTcpECNIntFallbackSynLoss:(unint64_t)a3
{
  *(void *)&self->_has |= 0x4000uLL;
  self->_tcpECNIntFallbackSynLoss = a3;
}

- (void)setHasTcpECNIntFallbackSynLoss:(BOOL)a3
{
  uint64_t v3 = 0x4000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($E9537ED3C3FE9D68E134AF95349F1C12)(*(void *)&self->_has & 0xFFFFFFFFFFFFBFFFLL | v3);
}

- (BOOL)hasTcpECNIntFallbackSynLoss
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setTcpECNIntFallbackReorder:(unint64_t)a3
{
  *(void *)&self->_has |= 0x1000uLL;
  self->_tcpECNIntFallbackReorder = a3;
}

- (void)setHasTcpECNIntFallbackReorder:(BOOL)a3
{
  uint64_t v3 = 4096;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($E9537ED3C3FE9D68E134AF95349F1C12)(*(void *)&self->_has & 0xFFFFFFFFFFFFEFFFLL | v3);
}

- (BOOL)hasTcpECNIntFallbackReorder
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setTcpECNIntFallbackCE:(unint64_t)a3
{
  *(void *)&self->_has |= 0x200uLL;
  self->_tcpECNIntFallbackCE = a3;
}

- (void)setHasTcpECNIntFallbackCE:(BOOL)a3
{
  uint64_t v3 = 512;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($E9537ED3C3FE9D68E134AF95349F1C12)(*(void *)&self->_has & 0xFFFFFFFFFFFFFDFFLL | v3);
}

- (BOOL)hasTcpECNIntFallbackCE
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setTcpECNIntOnAvgRTT:(unint64_t)a3
{
  *(void *)&self->_has |= 0x10000000uLL;
  self->_tcpECNIntOnAvgRTT = a3;
}

- (void)setHasTcpECNIntOnAvgRTT:(BOOL)a3
{
  uint64_t v3 = 0x10000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($E9537ED3C3FE9D68E134AF95349F1C12)(*(void *)&self->_has & 0xFFFFFFFFEFFFFFFFLL | v3);
}

- (BOOL)hasTcpECNIntOnAvgRTT
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 4) & 1;
}

- (void)setTcpECNIntOnRTTVar:(unint64_t)a3
{
  *(void *)&self->_has |= 0x100000000uLL;
  self->_tcpECNIntOnRTTVar = a3;
}

- (void)setHasTcpECNIntOnRTTVar:(BOOL)a3
{
  uint64_t v3 = 0x100000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($E9537ED3C3FE9D68E134AF95349F1C12)(*(void *)&self->_has & 0xFFFFFFFEFFFFFFFFLL | v3);
}

- (BOOL)hasTcpECNIntOnRTTVar
{
  return *((unsigned char *)&self->_has + 4) & 1;
}

- (void)setTcpECNIntOnOOBPer:(unint64_t)a3
{
  *(void *)&self->_has |= 0x80000000uLL;
  self->_tcpECNIntOnOOBPer = a3;
}

- (void)setHasTcpECNIntOnOOBPer:(BOOL)a3
{
  uint64_t v3 = 0x80000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($E9537ED3C3FE9D68E134AF95349F1C12)(*(void *)&self->_has & 0xFFFFFFFF7FFFFFFFLL | v3);
}

- (BOOL)hasTcpECNIntOnOOBPer
{
  return *((unsigned __int8 *)&self->_has + 3) >> 7;
}

- (void)setTcpECNIntOnSACKE:(unint64_t)a3
{
  *(void *)&self->_has |= 0x400000000uLL;
  self->_tcpECNIntOnSACKE = a3;
}

- (void)setHasTcpECNIntOnSACKE:(BOOL)a3
{
  uint64_t v3 = 0x400000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($E9537ED3C3FE9D68E134AF95349F1C12)(*(void *)&self->_has & 0xFFFFFFFBFFFFFFFFLL | v3);
}

- (BOOL)hasTcpECNIntOnSACKE
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 2) & 1;
}

- (void)setTcpECNIntOnReorderPer:(unint64_t)a3
{
  *(void *)&self->_has |= 0x200000000uLL;
  self->_tcpECNIntOnReorderPer = a3;
}

- (void)setHasTcpECNIntOnReorderPer:(BOOL)a3
{
  uint64_t v3 = 0x200000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($E9537ED3C3FE9D68E134AF95349F1C12)(*(void *)&self->_has & 0xFFFFFFFDFFFFFFFFLL | v3);
}

- (BOOL)hasTcpECNIntOnReorderPer
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 1) & 1;
}

- (void)setTcpECNIntRxmtPer:(unint64_t)a3
{
  *(void *)&self->_has |= 0x20000000000uLL;
  self->_tcpECNIntRxmtPer = a3;
}

- (void)setHasTcpECNIntRxmtPer:(BOOL)a3
{
  uint64_t v3 = 0x20000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($E9537ED3C3FE9D68E134AF95349F1C12)(*(void *)&self->_has & 0xFFFFFDFFFFFFFFFFLL | v3);
}

- (BOOL)hasTcpECNIntRxmtPer
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 1) & 1;
}

- (void)setTcpECNIntOffAvgRTT:(unint64_t)a3
{
  *(void *)&self->_has |= 0x10000uLL;
  self->_tcpECNIntOffAvgRTT = a3;
}

- (void)setHasTcpECNIntOffAvgRTT:(BOOL)a3
{
  uint64_t v3 = 0x10000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($E9537ED3C3FE9D68E134AF95349F1C12)(*(void *)&self->_has & 0xFFFFFFFFFFFEFFFFLL | v3);
}

- (BOOL)hasTcpECNIntOffAvgRTT
{
  return *((unsigned char *)&self->_has + 2) & 1;
}

- (void)setTcpECNIntOffRTTVar:(unint64_t)a3
{
  *(void *)&self->_has |= 0x100000uLL;
  self->_tcpECNIntOffRTTVar = a3;
}

- (void)setHasTcpECNIntOffRTTVar:(BOOL)a3
{
  uint64_t v3 = 0x100000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($E9537ED3C3FE9D68E134AF95349F1C12)(*(void *)&self->_has & 0xFFFFFFFFFFEFFFFFLL | v3);
}

- (BOOL)hasTcpECNIntOffRTTVar
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (void)setTcpECNIntOffOOBPer:(unint64_t)a3
{
  *(void *)&self->_has |= 0x80000uLL;
  self->_tcpECNIntOffOOBPer = a3;
}

- (void)setHasTcpECNIntOffOOBPer:(BOOL)a3
{
  uint64_t v3 = 0x80000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($E9537ED3C3FE9D68E134AF95349F1C12)(*(void *)&self->_has & 0xFFFFFFFFFFF7FFFFLL | v3);
}

- (BOOL)hasTcpECNIntOffOOBPer
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setTcpECNIntOffSACKE:(unint64_t)a3
{
  *(void *)&self->_has |= 0x800000uLL;
  self->_tcpECNIntOffSACKE = a3;
}

- (void)setHasTcpECNIntOffSACKE:(BOOL)a3
{
  uint64_t v3 = 0x800000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($E9537ED3C3FE9D68E134AF95349F1C12)(*(void *)&self->_has & 0xFFFFFFFFFF7FFFFFLL | v3);
}

- (BOOL)hasTcpECNIntOffSACKE
{
  return *((unsigned __int8 *)&self->_has + 2) >> 7;
}

- (void)setTcpECNIntOffReorderPer:(unint64_t)a3
{
  *(void *)&self->_has |= 0x200000uLL;
  self->_tcpECNIntOffReorderPer = a3;
}

- (void)setHasTcpECNIntOffReorderPer:(BOOL)a3
{
  uint64_t v3 = 0x200000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($E9537ED3C3FE9D68E134AF95349F1C12)(*(void *)&self->_has & 0xFFFFFFFFFFDFFFFFLL | v3);
}

- (BOOL)hasTcpECNIntOffReorderPer
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (void)setTcpECNIntOffRxmtPer:(unint64_t)a3
{
  *(void *)&self->_has |= 0x400000uLL;
  self->_tcpECNIntOffRxmtPer = a3;
}

- (void)setHasTcpECNIntOffRxmtPer:(BOOL)a3
{
  uint64_t v3 = 0x400000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($E9537ED3C3FE9D68E134AF95349F1C12)(*(void *)&self->_has & 0xFFFFFFFFFFBFFFFFLL | v3);
}

- (BOOL)hasTcpECNIntOffRxmtPer
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
}

- (void)setTcpECNIntOnTotalTxPkts:(unint64_t)a3
{
  *(void *)&self->_has |= 0x4000000000uLL;
  self->_tcpECNIntOnTotalTxPkts = a3;
}

- (void)setHasTcpECNIntOnTotalTxPkts:(BOOL)a3
{
  uint64_t v3 = 0x4000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($E9537ED3C3FE9D68E134AF95349F1C12)(*(void *)&self->_has & 0xFFFFFFBFFFFFFFFFLL | v3);
}

- (BOOL)hasTcpECNIntOnTotalTxPkts
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 6) & 1;
}

- (void)setTcpECNIntOnTotalRxmtPkts:(unint64_t)a3
{
  *(void *)&self->_has |= 0x2000000000uLL;
  self->_tcpECNIntOnTotalRxmtPkts = a3;
}

- (void)setHasTcpECNIntOnTotalRxmtPkts:(BOOL)a3
{
  uint64_t v3 = 0x2000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($E9537ED3C3FE9D68E134AF95349F1C12)(*(void *)&self->_has & 0xFFFFFFDFFFFFFFFFLL | v3);
}

- (BOOL)hasTcpECNIntOnTotalRxmtPkts
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 5) & 1;
}

- (void)setTcpECNIntOnTotalRxPkts:(unint64_t)a3
{
  *(void *)&self->_has |= 0x1000000000uLL;
  self->_tcpECNIntOnTotalRxPkts = a3;
}

- (void)setHasTcpECNIntOnTotalRxPkts:(BOOL)a3
{
  uint64_t v3 = 0x1000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($E9537ED3C3FE9D68E134AF95349F1C12)(*(void *)&self->_has & 0xFFFFFFEFFFFFFFFFLL | v3);
}

- (BOOL)hasTcpECNIntOnTotalRxPkts
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 4) & 1;
}

- (void)setTcpECNIntOnTotalOOPkts:(unint64_t)a3
{
  *(void *)&self->_has |= 0x800000000uLL;
  self->_tcpECNIntOnTotalOOPkts = a3;
}

- (void)setHasTcpECNIntOnTotalOOPkts:(BOOL)a3
{
  uint64_t v3 = 0x800000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($E9537ED3C3FE9D68E134AF95349F1C12)(*(void *)&self->_has & 0xFFFFFFF7FFFFFFFFLL | v3);
}

- (BOOL)hasTcpECNIntOnTotalOOPkts
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 3) & 1;
}

- (void)setTcpECNIntOnDropRst:(unint64_t)a3
{
  *(void *)&self->_has |= 0x20000000uLL;
  self->_tcpECNIntOnDropRst = a3;
}

- (void)setHasTcpECNIntOnDropRst:(BOOL)a3
{
  uint64_t v3 = 0x20000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($E9537ED3C3FE9D68E134AF95349F1C12)(*(void *)&self->_has & 0xFFFFFFFFDFFFFFFFLL | v3);
}

- (BOOL)hasTcpECNIntOnDropRst
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 5) & 1;
}

- (void)setTcpECNIntOnDropRxmt:(unint64_t)a3
{
  *(void *)&self->_has |= 0x40000000uLL;
  self->_tcpECNIntOnDropRxmt = a3;
}

- (void)setHasTcpECNIntOnDropRxmt:(BOOL)a3
{
  uint64_t v3 = 0x40000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($E9537ED3C3FE9D68E134AF95349F1C12)(*(void *)&self->_has & 0xFFFFFFFFBFFFFFFFLL | v3);
}

- (BOOL)hasTcpECNIntOnDropRxmt
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 6) & 1;
}

- (void)setTcpECNIntOffTotalTxPkts:(unint64_t)a3
{
  *(void *)&self->_has |= 0x8000000uLL;
  self->_tcpECNIntOffTotalTxPkts = a3;
}

- (void)setHasTcpECNIntOffTotalTxPkts:(BOOL)a3
{
  uint64_t v3 = 0x8000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($E9537ED3C3FE9D68E134AF95349F1C12)(*(void *)&self->_has & 0xFFFFFFFFF7FFFFFFLL | v3);
}

- (BOOL)hasTcpECNIntOffTotalTxPkts
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 3) & 1;
}

- (void)setTcpECNIntOffTotalRxmtPkts:(unint64_t)a3
{
  *(void *)&self->_has |= 0x4000000uLL;
  self->_tcpECNIntOffTotalRxmtPkts = a3;
}

- (void)setHasTcpECNIntOffTotalRxmtPkts:(BOOL)a3
{
  uint64_t v3 = 0x4000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($E9537ED3C3FE9D68E134AF95349F1C12)(*(void *)&self->_has & 0xFFFFFFFFFBFFFFFFLL | v3);
}

- (BOOL)hasTcpECNIntOffTotalRxmtPkts
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 2) & 1;
}

- (void)setTcpECNIntOffTotalRxPkts:(unint64_t)a3
{
  *(void *)&self->_has |= 0x2000000uLL;
  self->_tcpECNIntOffTotalRxPkts = a3;
}

- (void)setHasTcpECNIntOffTotalRxPkts:(BOOL)a3
{
  uint64_t v3 = 0x2000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($E9537ED3C3FE9D68E134AF95349F1C12)(*(void *)&self->_has & 0xFFFFFFFFFDFFFFFFLL | v3);
}

- (BOOL)hasTcpECNIntOffTotalRxPkts
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 1) & 1;
}

- (void)setTcpECNIntOffTotalOOPkts:(unint64_t)a3
{
  *(void *)&self->_has |= 0x1000000uLL;
  self->_tcpECNIntOffTotalOOPkts = a3;
}

- (void)setHasTcpECNIntOffTotalOOPkts:(BOOL)a3
{
  uint64_t v3 = 0x1000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($E9537ED3C3FE9D68E134AF95349F1C12)(*(void *)&self->_has & 0xFFFFFFFFFEFFFFFFLL | v3);
}

- (BOOL)hasTcpECNIntOffTotalOOPkts
{
  return *((unsigned char *)&self->_has + 3) & 1;
}

- (void)setTcpECNIntOffDropRst:(unint64_t)a3
{
  *(void *)&self->_has |= 0x20000uLL;
  self->_tcpECNIntOffDropRst = a3;
}

- (void)setHasTcpECNIntOffDropRst:(BOOL)a3
{
  uint64_t v3 = 0x20000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($E9537ED3C3FE9D68E134AF95349F1C12)(*(void *)&self->_has & 0xFFFFFFFFFFFDFFFFLL | v3);
}

- (BOOL)hasTcpECNIntOffDropRst
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setTcpECNIntOffDropRxmt:(unint64_t)a3
{
  *(void *)&self->_has |= 0x40000uLL;
  self->_tcpECNIntOffDropRxmt = a3;
}

- (void)setHasTcpECNIntOffDropRxmt:(BOOL)a3
{
  uint64_t v3 = 0x40000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($E9537ED3C3FE9D68E134AF95349F1C12)(*(void *)&self->_has & 0xFFFFFFFFFFFBFFFFLL | v3);
}

- (BOOL)hasTcpECNIntOffDropRxmt
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setTcpECNIntTotalConnections:(unint64_t)a3
{
  *(void *)&self->_has |= 0x800000000000uLL;
  self->_tcpECNIntTotalConnections = a3;
}

- (void)setHasTcpECNIntTotalConnections:(BOOL)a3
{
  uint64_t v3 = 0x800000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($E9537ED3C3FE9D68E134AF95349F1C12)(*(void *)&self->_has & 0xFFFF7FFFFFFFFFFFLL | v3);
}

- (BOOL)hasTcpECNIntTotalConnections
{
  return *((unsigned __int8 *)&self->_has + 5) >> 7;
}

- (void)setTcpUnsentDataAtSleepCnt:(unint64_t)a3
{
  *(void *)&self->_has |= 0x1000000000000uLL;
  self->_tcpUnsentDataAtSleepCnt = a3;
}

- (void)setHasTcpUnsentDataAtSleepCnt:(BOOL)a3
{
  uint64_t v3 = 0x1000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($E9537ED3C3FE9D68E134AF95349F1C12)(*(void *)&self->_has & 0xFFFEFFFFFFFFFFFFLL | v3);
}

- (BOOL)hasTcpUnsentDataAtSleepCnt
{
  return *((unsigned char *)&self->_has + 6) & 1;
}

- (void)setTcpECNIntFallbackDropRst:(unint64_t)a3
{
  *(void *)&self->_has |= 0x400uLL;
  self->_tcpECNIntFallbackDropRst = a3;
}

- (void)setHasTcpECNIntFallbackDropRst:(BOOL)a3
{
  uint64_t v3 = 1024;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($E9537ED3C3FE9D68E134AF95349F1C12)(*(void *)&self->_has & 0xFFFFFFFFFFFFFBFFLL | v3);
}

- (BOOL)hasTcpECNIntFallbackDropRst
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setTcpECNIntFallbackDropRxmt:(unint64_t)a3
{
  *(void *)&self->_has |= 0x800uLL;
  self->_tcpECNIntFallbackDropRxmt = a3;
}

- (void)setHasTcpECNIntFallbackDropRxmt:(BOOL)a3
{
  uint64_t v3 = 2048;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($E9537ED3C3FE9D68E134AF95349F1C12)(*(void *)&self->_has & 0xFFFFFFFFFFFFF7FFLL | v3);
}

- (BOOL)hasTcpECNIntFallbackDropRxmt
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setTcpECNIntFallbackSYNRst:(unint64_t)a3
{
  *(void *)&self->_has |= 0x2000uLL;
  self->_tcpECNIntFallbackSYNRst = a3;
}

- (void)setHasTcpECNIntFallbackSYNRst:(BOOL)a3
{
  uint64_t v3 = 0x2000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($E9537ED3C3FE9D68E134AF95349F1C12)(*(void *)&self->_has & 0xFFFFFFFFFFFFDFFFLL | v3);
}

- (BOOL)hasTcpECNIntFallbackSYNRst
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDLibnetcoreTCPECNInterfaceStatsReport;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDLibnetcoreTCPECNInterfaceStatsReport description](&v3, sel_description), -[AWDLibnetcoreTCPECNInterfaceStatsReport dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if (*(unsigned char *)&has)
  {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_interfaceType] forKey:@"interfaceType"];
    $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
    if ((*(unsigned char *)&has & 2) == 0)
    {
LABEL_3:
      if ((*(unsigned char *)&has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_54;
    }
  }
  else if ((*(unsigned char *)&has & 2) == 0)
  {
    goto LABEL_3;
  }
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_ipProtocol] forKey:@"ipProtocol"];
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_4:
    if ((*(void *)&has & 0x80000000000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_55;
  }
LABEL_54:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_tcpECNIntClientSetup] forKey:@"tcpECNIntClientSetup"];
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(void *)&has & 0x80000000000) == 0)
  {
LABEL_5:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_56;
  }
LABEL_55:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_tcpECNIntServerSetup] forKey:@"tcpECNIntServerSetup"];
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_6:
    if ((*(void *)&has & 0x100000000000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_57;
  }
LABEL_56:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_tcpECNIntClientSuccess] forKey:@"tcpECNIntClientSuccess"];
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(void *)&has & 0x100000000000) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_58;
  }
LABEL_57:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_tcpECNIntServerSuccess] forKey:@"tcpECNIntServerSuccess"];
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_8:
    if ((*(void *)&has & 0x400000000000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_59;
  }
LABEL_58:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_tcpECNIntNotSupportedPeer] forKey:@"tcpECNIntNotSupportedPeer"];
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(void *)&has & 0x400000000000) == 0)
  {
LABEL_9:
    if ((*(void *)&has & 0x200000000000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_60;
  }
LABEL_59:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_tcpECNIntSynLost] forKey:@"tcpECNIntSynLost"];
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(void *)&has & 0x200000000000) == 0)
  {
LABEL_10:
    if ((*(void *)&has & 0x8000000000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_61;
  }
LABEL_60:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_tcpECNIntSynAckLost] forKey:@"tcpECNIntSynAckLost"];
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(void *)&has & 0x8000000000) == 0)
  {
LABEL_11:
    if ((*(void *)&has & 0x10000000000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_62;
  }
LABEL_61:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_tcpECNIntRecvCE] forKey:@"tcpECNIntRecvCE"];
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(void *)&has & 0x10000000000) == 0)
  {
LABEL_12:
    if ((*(void *)&has & 0x40000000000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_63;
  }
LABEL_62:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_tcpECNIntRecvECE] forKey:@"tcpECNIntRecvECE"];
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(void *)&has & 0x40000000000) == 0)
  {
LABEL_13:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_14;
    }
    goto LABEL_64;
  }
LABEL_63:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_tcpECNIntSentECE] forKey:@"tcpECNIntSentECE"];
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_15;
    }
    goto LABEL_65;
  }
LABEL_64:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_tcpECNIntConnRecvCE] forKey:@"tcpECNIntConnRecvCE"];
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_15:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_16;
    }
    goto LABEL_66;
  }
LABEL_65:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_tcpECNIntConnRecvECE] forKey:@"tcpECNIntConnRecvECE"];
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_16:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_17;
    }
    goto LABEL_67;
  }
LABEL_66:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_tcpECNIntConnPLNoCE] forKey:@"tcpECNIntConnPLNoCE"];
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_17:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_18;
    }
    goto LABEL_68;
  }
LABEL_67:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_tcpECNIntConnPLCE] forKey:@"tcpECNIntConnPLCE"];
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_69;
  }
LABEL_68:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_tcpECNIntConnNoPLCE] forKey:@"tcpECNIntConnNoPLCE"];
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_19:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_70;
  }
LABEL_69:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_tcpECNIntFallbackSynLoss] forKey:@"tcpECNIntFallbackSynLoss"];
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_20:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_21;
    }
    goto LABEL_71;
  }
LABEL_70:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_tcpECNIntFallbackReorder] forKey:@"tcpECNIntFallbackReorder"];
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_21:
    if ((*(_DWORD *)&has & 0x10000000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_72;
  }
LABEL_71:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_tcpECNIntFallbackCE] forKey:@"tcpECNIntFallbackCE"];
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) == 0)
  {
LABEL_22:
    if ((*(void *)&has & 0x100000000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_73;
  }
LABEL_72:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_tcpECNIntOnAvgRTT] forKey:@"tcpECNIntOnAvgRTT"];
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(void *)&has & 0x100000000) == 0)
  {
LABEL_23:
    if ((*(_DWORD *)&has & 0x80000000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_74;
  }
LABEL_73:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_tcpECNIntOnRTTVar] forKey:@"tcpECNIntOnRTTVar"];
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000000) == 0)
  {
LABEL_24:
    if ((*(void *)&has & 0x400000000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_75;
  }
LABEL_74:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_tcpECNIntOnOOBPer] forKey:@"tcpECNIntOnOOBPer"];
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(void *)&has & 0x400000000) == 0)
  {
LABEL_25:
    if ((*(void *)&has & 0x200000000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_76;
  }
LABEL_75:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_tcpECNIntOnSACKE] forKey:@"tcpECNIntOnSACKE"];
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(void *)&has & 0x200000000) == 0)
  {
LABEL_26:
    if ((*(void *)&has & 0x20000000000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_77;
  }
LABEL_76:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_tcpECNIntOnReorderPer] forKey:@"tcpECNIntOnReorderPer"];
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(void *)&has & 0x20000000000) == 0)
  {
LABEL_27:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_78;
  }
LABEL_77:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_tcpECNIntRxmtPer] forKey:@"tcpECNIntRxmtPer"];
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_28:
    if ((*(_DWORD *)&has & 0x100000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_79;
  }
LABEL_78:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_tcpECNIntOffAvgRTT] forKey:@"tcpECNIntOffAvgRTT"];
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_29:
    if ((*(_DWORD *)&has & 0x80000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_80;
  }
LABEL_79:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_tcpECNIntOffRTTVar] forKey:@"tcpECNIntOffRTTVar"];
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_30:
    if ((*(_DWORD *)&has & 0x800000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_81;
  }
LABEL_80:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_tcpECNIntOffOOBPer] forKey:@"tcpECNIntOffOOBPer"];
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_31:
    if ((*(_DWORD *)&has & 0x200000) == 0) {
      goto LABEL_32;
    }
    goto LABEL_82;
  }
LABEL_81:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_tcpECNIntOffSACKE] forKey:@"tcpECNIntOffSACKE"];
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_32:
    if ((*(_DWORD *)&has & 0x400000) == 0) {
      goto LABEL_33;
    }
    goto LABEL_83;
  }
LABEL_82:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_tcpECNIntOffReorderPer] forKey:@"tcpECNIntOffReorderPer"];
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_33:
    if ((*(void *)&has & 0x4000000000) == 0) {
      goto LABEL_34;
    }
    goto LABEL_84;
  }
LABEL_83:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_tcpECNIntOffRxmtPer] forKey:@"tcpECNIntOffRxmtPer"];
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(void *)&has & 0x4000000000) == 0)
  {
LABEL_34:
    if ((*(void *)&has & 0x2000000000) == 0) {
      goto LABEL_35;
    }
    goto LABEL_85;
  }
LABEL_84:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_tcpECNIntOnTotalTxPkts] forKey:@"tcpECNIntOnTotalTxPkts"];
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(void *)&has & 0x2000000000) == 0)
  {
LABEL_35:
    if ((*(void *)&has & 0x1000000000) == 0) {
      goto LABEL_36;
    }
    goto LABEL_86;
  }
LABEL_85:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_tcpECNIntOnTotalRxmtPkts] forKey:@"tcpECNIntOnTotalRxmtPkts"];
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(void *)&has & 0x1000000000) == 0)
  {
LABEL_36:
    if ((*(void *)&has & 0x800000000) == 0) {
      goto LABEL_37;
    }
    goto LABEL_87;
  }
LABEL_86:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_tcpECNIntOnTotalRxPkts] forKey:@"tcpECNIntOnTotalRxPkts"];
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(void *)&has & 0x800000000) == 0)
  {
LABEL_37:
    if ((*(_DWORD *)&has & 0x20000000) == 0) {
      goto LABEL_38;
    }
    goto LABEL_88;
  }
LABEL_87:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_tcpECNIntOnTotalOOPkts] forKey:@"tcpECNIntOnTotalOOPkts"];
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000000) == 0)
  {
LABEL_38:
    if ((*(_DWORD *)&has & 0x40000000) == 0) {
      goto LABEL_39;
    }
    goto LABEL_89;
  }
LABEL_88:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_tcpECNIntOnDropRst] forKey:@"tcpECNIntOnDropRst"];
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000000) == 0)
  {
LABEL_39:
    if ((*(_DWORD *)&has & 0x8000000) == 0) {
      goto LABEL_40;
    }
    goto LABEL_90;
  }
LABEL_89:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_tcpECNIntOnDropRxmt] forKey:@"tcpECNIntOnDropRxmt"];
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_40:
    if ((*(_DWORD *)&has & 0x4000000) == 0) {
      goto LABEL_41;
    }
    goto LABEL_91;
  }
LABEL_90:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_tcpECNIntOffTotalTxPkts] forKey:@"tcpECNIntOffTotalTxPkts"];
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_41:
    if ((*(_DWORD *)&has & 0x2000000) == 0) {
      goto LABEL_42;
    }
    goto LABEL_92;
  }
LABEL_91:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_tcpECNIntOffTotalRxmtPkts] forKey:@"tcpECNIntOffTotalRxmtPkts"];
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_42:
    if ((*(_DWORD *)&has & 0x1000000) == 0) {
      goto LABEL_43;
    }
    goto LABEL_93;
  }
LABEL_92:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_tcpECNIntOffTotalRxPkts] forKey:@"tcpECNIntOffTotalRxPkts"];
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_43:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_44;
    }
    goto LABEL_94;
  }
LABEL_93:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_tcpECNIntOffTotalOOPkts] forKey:@"tcpECNIntOffTotalOOPkts"];
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_44:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_45;
    }
    goto LABEL_95;
  }
LABEL_94:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_tcpECNIntOffDropRst] forKey:@"tcpECNIntOffDropRst"];
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_45:
    if ((*(void *)&has & 0x800000000000) == 0) {
      goto LABEL_46;
    }
    goto LABEL_96;
  }
LABEL_95:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_tcpECNIntOffDropRxmt] forKey:@"tcpECNIntOffDropRxmt"];
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(void *)&has & 0x800000000000) == 0)
  {
LABEL_46:
    if ((*(void *)&has & 0x1000000000000) == 0) {
      goto LABEL_47;
    }
    goto LABEL_97;
  }
LABEL_96:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_tcpECNIntTotalConnections] forKey:@"tcpECNIntTotalConnections"];
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(void *)&has & 0x1000000000000) == 0)
  {
LABEL_47:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_48;
    }
    goto LABEL_98;
  }
LABEL_97:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_tcpUnsentDataAtSleepCnt] forKey:@"tcpUnsentDataAtSleepCnt"];
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_48:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_49;
    }
LABEL_99:
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_tcpECNIntFallbackDropRxmt] forKey:@"tcpECNIntFallbackDropRxmt"];
    if ((*(void *)&self->_has & 0x2000) == 0) {
      return v3;
    }
    goto LABEL_50;
  }
LABEL_98:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_tcpECNIntFallbackDropRst] forKey:@"tcpECNIntFallbackDropRst"];
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(_WORD *)&has & 0x800) != 0) {
    goto LABEL_99;
  }
LABEL_49:
  if ((*(_WORD *)&has & 0x2000) != 0) {
LABEL_50:
  }
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_tcpECNIntFallbackSYNRst] forKey:@"tcpECNIntFallbackSYNRst"];
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDLibnetcoreTCPECNInterfaceStatsReportReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if (*(unsigned char *)&has)
  {
    PBDataWriterWriteUint64Field();
    $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
    if ((*(unsigned char *)&has & 2) == 0)
    {
LABEL_3:
      if ((*(unsigned char *)&has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_53;
    }
  }
  else if ((*(unsigned char *)&has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint64Field();
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_4:
    if ((*(void *)&has & 0x80000000000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_54;
  }
LABEL_53:
  PBDataWriterWriteUint64Field();
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(void *)&has & 0x80000000000) == 0)
  {
LABEL_5:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_55;
  }
LABEL_54:
  PBDataWriterWriteUint64Field();
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_6:
    if ((*(void *)&has & 0x100000000000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_56;
  }
LABEL_55:
  PBDataWriterWriteUint64Field();
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(void *)&has & 0x100000000000) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_57;
  }
LABEL_56:
  PBDataWriterWriteUint64Field();
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_8:
    if ((*(void *)&has & 0x400000000000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_58;
  }
LABEL_57:
  PBDataWriterWriteUint64Field();
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(void *)&has & 0x400000000000) == 0)
  {
LABEL_9:
    if ((*(void *)&has & 0x200000000000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_59;
  }
LABEL_58:
  PBDataWriterWriteUint64Field();
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(void *)&has & 0x200000000000) == 0)
  {
LABEL_10:
    if ((*(void *)&has & 0x8000000000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_60;
  }
LABEL_59:
  PBDataWriterWriteUint64Field();
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(void *)&has & 0x8000000000) == 0)
  {
LABEL_11:
    if ((*(void *)&has & 0x10000000000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_61;
  }
LABEL_60:
  PBDataWriterWriteUint64Field();
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(void *)&has & 0x10000000000) == 0)
  {
LABEL_12:
    if ((*(void *)&has & 0x40000000000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_62;
  }
LABEL_61:
  PBDataWriterWriteUint64Field();
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(void *)&has & 0x40000000000) == 0)
  {
LABEL_13:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_14;
    }
    goto LABEL_63;
  }
LABEL_62:
  PBDataWriterWriteUint64Field();
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_15;
    }
    goto LABEL_64;
  }
LABEL_63:
  PBDataWriterWriteUint64Field();
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_15:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_16;
    }
    goto LABEL_65;
  }
LABEL_64:
  PBDataWriterWriteUint64Field();
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_16:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_17;
    }
    goto LABEL_66;
  }
LABEL_65:
  PBDataWriterWriteUint64Field();
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_17:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_18;
    }
    goto LABEL_67;
  }
LABEL_66:
  PBDataWriterWriteUint64Field();
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_68;
  }
LABEL_67:
  PBDataWriterWriteUint64Field();
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_19:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_69;
  }
LABEL_68:
  PBDataWriterWriteUint64Field();
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_20:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_21;
    }
    goto LABEL_70;
  }
LABEL_69:
  PBDataWriterWriteUint64Field();
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_21:
    if ((*(_DWORD *)&has & 0x10000000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_71;
  }
LABEL_70:
  PBDataWriterWriteUint64Field();
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) == 0)
  {
LABEL_22:
    if ((*(void *)&has & 0x100000000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_72;
  }
LABEL_71:
  PBDataWriterWriteUint64Field();
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(void *)&has & 0x100000000) == 0)
  {
LABEL_23:
    if ((*(_DWORD *)&has & 0x80000000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_73;
  }
LABEL_72:
  PBDataWriterWriteUint64Field();
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000000) == 0)
  {
LABEL_24:
    if ((*(void *)&has & 0x400000000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_74;
  }
LABEL_73:
  PBDataWriterWriteUint64Field();
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(void *)&has & 0x400000000) == 0)
  {
LABEL_25:
    if ((*(void *)&has & 0x200000000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_75;
  }
LABEL_74:
  PBDataWriterWriteUint64Field();
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(void *)&has & 0x200000000) == 0)
  {
LABEL_26:
    if ((*(void *)&has & 0x20000000000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_76;
  }
LABEL_75:
  PBDataWriterWriteUint64Field();
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(void *)&has & 0x20000000000) == 0)
  {
LABEL_27:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_77;
  }
LABEL_76:
  PBDataWriterWriteUint64Field();
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_28:
    if ((*(_DWORD *)&has & 0x100000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_78;
  }
LABEL_77:
  PBDataWriterWriteUint64Field();
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_29:
    if ((*(_DWORD *)&has & 0x80000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_79;
  }
LABEL_78:
  PBDataWriterWriteUint64Field();
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_30:
    if ((*(_DWORD *)&has & 0x800000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_80;
  }
LABEL_79:
  PBDataWriterWriteUint64Field();
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_31:
    if ((*(_DWORD *)&has & 0x200000) == 0) {
      goto LABEL_32;
    }
    goto LABEL_81;
  }
LABEL_80:
  PBDataWriterWriteUint64Field();
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_32:
    if ((*(_DWORD *)&has & 0x400000) == 0) {
      goto LABEL_33;
    }
    goto LABEL_82;
  }
LABEL_81:
  PBDataWriterWriteUint64Field();
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_33:
    if ((*(void *)&has & 0x4000000000) == 0) {
      goto LABEL_34;
    }
    goto LABEL_83;
  }
LABEL_82:
  PBDataWriterWriteUint64Field();
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(void *)&has & 0x4000000000) == 0)
  {
LABEL_34:
    if ((*(void *)&has & 0x2000000000) == 0) {
      goto LABEL_35;
    }
    goto LABEL_84;
  }
LABEL_83:
  PBDataWriterWriteUint64Field();
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(void *)&has & 0x2000000000) == 0)
  {
LABEL_35:
    if ((*(void *)&has & 0x1000000000) == 0) {
      goto LABEL_36;
    }
    goto LABEL_85;
  }
LABEL_84:
  PBDataWriterWriteUint64Field();
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(void *)&has & 0x1000000000) == 0)
  {
LABEL_36:
    if ((*(void *)&has & 0x800000000) == 0) {
      goto LABEL_37;
    }
    goto LABEL_86;
  }
LABEL_85:
  PBDataWriterWriteUint64Field();
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(void *)&has & 0x800000000) == 0)
  {
LABEL_37:
    if ((*(_DWORD *)&has & 0x20000000) == 0) {
      goto LABEL_38;
    }
    goto LABEL_87;
  }
LABEL_86:
  PBDataWriterWriteUint64Field();
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000000) == 0)
  {
LABEL_38:
    if ((*(_DWORD *)&has & 0x40000000) == 0) {
      goto LABEL_39;
    }
    goto LABEL_88;
  }
LABEL_87:
  PBDataWriterWriteUint64Field();
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000000) == 0)
  {
LABEL_39:
    if ((*(_DWORD *)&has & 0x8000000) == 0) {
      goto LABEL_40;
    }
    goto LABEL_89;
  }
LABEL_88:
  PBDataWriterWriteUint64Field();
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_40:
    if ((*(_DWORD *)&has & 0x4000000) == 0) {
      goto LABEL_41;
    }
    goto LABEL_90;
  }
LABEL_89:
  PBDataWriterWriteUint64Field();
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_41:
    if ((*(_DWORD *)&has & 0x2000000) == 0) {
      goto LABEL_42;
    }
    goto LABEL_91;
  }
LABEL_90:
  PBDataWriterWriteUint64Field();
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_42:
    if ((*(_DWORD *)&has & 0x1000000) == 0) {
      goto LABEL_43;
    }
    goto LABEL_92;
  }
LABEL_91:
  PBDataWriterWriteUint64Field();
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_43:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_44;
    }
    goto LABEL_93;
  }
LABEL_92:
  PBDataWriterWriteUint64Field();
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_44:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_45;
    }
    goto LABEL_94;
  }
LABEL_93:
  PBDataWriterWriteUint64Field();
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_45:
    if ((*(void *)&has & 0x800000000000) == 0) {
      goto LABEL_46;
    }
    goto LABEL_95;
  }
LABEL_94:
  PBDataWriterWriteUint64Field();
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(void *)&has & 0x800000000000) == 0)
  {
LABEL_46:
    if ((*(void *)&has & 0x1000000000000) == 0) {
      goto LABEL_47;
    }
    goto LABEL_96;
  }
LABEL_95:
  PBDataWriterWriteUint64Field();
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(void *)&has & 0x1000000000000) == 0)
  {
LABEL_47:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_48;
    }
    goto LABEL_97;
  }
LABEL_96:
  PBDataWriterWriteUint64Field();
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_48:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_49;
    }
LABEL_98:
    PBDataWriterWriteUint64Field();
    if ((*(void *)&self->_has & 0x2000) == 0) {
      return;
    }
    goto LABEL_99;
  }
LABEL_97:
  PBDataWriterWriteUint64Field();
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(_WORD *)&has & 0x800) != 0) {
    goto LABEL_98;
  }
LABEL_49:
  if ((*(_WORD *)&has & 0x2000) == 0) {
    return;
  }
LABEL_99:

  PBDataWriterWriteUint64Field();
}

- (void)copyTo:(id)a3
{
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if (*(unsigned char *)&has)
  {
    *((void *)a3 + 1) = self->_interfaceType;
    *((void *)a3 + 50) |= 1uLL;
    $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
    if ((*(unsigned char *)&has & 2) == 0)
    {
LABEL_3:
      if ((*(unsigned char *)&has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_53;
    }
  }
  else if ((*(unsigned char *)&has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((void *)a3 + 2) = self->_ipProtocol;
  *((void *)a3 + 50) |= 2uLL;
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_4:
    if ((*(void *)&has & 0x80000000000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_54;
  }
LABEL_53:
  *((void *)a3 + 3) = self->_tcpECNIntClientSetup;
  *((void *)a3 + 50) |= 4uLL;
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(void *)&has & 0x80000000000) == 0)
  {
LABEL_5:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_55;
  }
LABEL_54:
  *((void *)a3 + 44) = self->_tcpECNIntServerSetup;
  *((void *)a3 + 50) |= 0x80000000000uLL;
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_6:
    if ((*(void *)&has & 0x100000000000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_56;
  }
LABEL_55:
  *((void *)a3 + 4) = self->_tcpECNIntClientSuccess;
  *((void *)a3 + 50) |= 8uLL;
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(void *)&has & 0x100000000000) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_57;
  }
LABEL_56:
  *((void *)a3 + 45) = self->_tcpECNIntServerSuccess;
  *((void *)a3 + 50) |= 0x100000000000uLL;
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_8:
    if ((*(void *)&has & 0x400000000000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_58;
  }
LABEL_57:
  *((void *)a3 + 16) = self->_tcpECNIntNotSupportedPeer;
  *((void *)a3 + 50) |= 0x8000uLL;
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(void *)&has & 0x400000000000) == 0)
  {
LABEL_9:
    if ((*(void *)&has & 0x200000000000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_59;
  }
LABEL_58:
  *((void *)a3 + 47) = self->_tcpECNIntSynLost;
  *((void *)a3 + 50) |= 0x400000000000uLL;
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(void *)&has & 0x200000000000) == 0)
  {
LABEL_10:
    if ((*(void *)&has & 0x8000000000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_60;
  }
LABEL_59:
  *((void *)a3 + 46) = self->_tcpECNIntSynAckLost;
  *((void *)a3 + 50) |= 0x200000000000uLL;
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(void *)&has & 0x8000000000) == 0)
  {
LABEL_11:
    if ((*(void *)&has & 0x10000000000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_61;
  }
LABEL_60:
  *((void *)a3 + 40) = self->_tcpECNIntRecvCE;
  *((void *)a3 + 50) |= 0x8000000000uLL;
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(void *)&has & 0x10000000000) == 0)
  {
LABEL_12:
    if ((*(void *)&has & 0x40000000000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_62;
  }
LABEL_61:
  *((void *)a3 + 41) = self->_tcpECNIntRecvECE;
  *((void *)a3 + 50) |= 0x10000000000uLL;
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(void *)&has & 0x40000000000) == 0)
  {
LABEL_13:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_14;
    }
    goto LABEL_63;
  }
LABEL_62:
  *((void *)a3 + 43) = self->_tcpECNIntSentECE;
  *((void *)a3 + 50) |= 0x40000000000uLL;
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_15;
    }
    goto LABEL_64;
  }
LABEL_63:
  *((void *)a3 + 8) = self->_tcpECNIntConnRecvCE;
  *((void *)a3 + 50) |= 0x80uLL;
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_15:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_16;
    }
    goto LABEL_65;
  }
LABEL_64:
  *((void *)a3 + 9) = self->_tcpECNIntConnRecvECE;
  *((void *)a3 + 50) |= 0x100uLL;
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_16:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_17;
    }
    goto LABEL_66;
  }
LABEL_65:
  *((void *)a3 + 7) = self->_tcpECNIntConnPLNoCE;
  *((void *)a3 + 50) |= 0x40uLL;
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_17:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_18;
    }
    goto LABEL_67;
  }
LABEL_66:
  *((void *)a3 + 6) = self->_tcpECNIntConnPLCE;
  *((void *)a3 + 50) |= 0x20uLL;
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_68;
  }
LABEL_67:
  *((void *)a3 + 5) = self->_tcpECNIntConnNoPLCE;
  *((void *)a3 + 50) |= 0x10uLL;
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_19:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_69;
  }
LABEL_68:
  *((void *)a3 + 15) = self->_tcpECNIntFallbackSynLoss;
  *((void *)a3 + 50) |= 0x4000uLL;
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_20:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_21;
    }
    goto LABEL_70;
  }
LABEL_69:
  *((void *)a3 + 13) = self->_tcpECNIntFallbackReorder;
  *((void *)a3 + 50) |= 0x1000uLL;
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_21:
    if ((*(_DWORD *)&has & 0x10000000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_71;
  }
LABEL_70:
  *((void *)a3 + 10) = self->_tcpECNIntFallbackCE;
  *((void *)a3 + 50) |= 0x200uLL;
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) == 0)
  {
LABEL_22:
    if ((*(void *)&has & 0x100000000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_72;
  }
LABEL_71:
  *((void *)a3 + 29) = self->_tcpECNIntOnAvgRTT;
  *((void *)a3 + 50) |= 0x10000000uLL;
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(void *)&has & 0x100000000) == 0)
  {
LABEL_23:
    if ((*(_DWORD *)&has & 0x80000000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_73;
  }
LABEL_72:
  *((void *)a3 + 33) = self->_tcpECNIntOnRTTVar;
  *((void *)a3 + 50) |= 0x100000000uLL;
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000000) == 0)
  {
LABEL_24:
    if ((*(void *)&has & 0x400000000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_74;
  }
LABEL_73:
  *((void *)a3 + 32) = self->_tcpECNIntOnOOBPer;
  *((void *)a3 + 50) |= 0x80000000uLL;
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(void *)&has & 0x400000000) == 0)
  {
LABEL_25:
    if ((*(void *)&has & 0x200000000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_75;
  }
LABEL_74:
  *((void *)a3 + 35) = self->_tcpECNIntOnSACKE;
  *((void *)a3 + 50) |= 0x400000000uLL;
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(void *)&has & 0x200000000) == 0)
  {
LABEL_26:
    if ((*(void *)&has & 0x20000000000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_76;
  }
LABEL_75:
  *((void *)a3 + 34) = self->_tcpECNIntOnReorderPer;
  *((void *)a3 + 50) |= 0x200000000uLL;
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(void *)&has & 0x20000000000) == 0)
  {
LABEL_27:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_77;
  }
LABEL_76:
  *((void *)a3 + 42) = self->_tcpECNIntRxmtPer;
  *((void *)a3 + 50) |= 0x20000000000uLL;
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_28:
    if ((*(_DWORD *)&has & 0x100000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_78;
  }
LABEL_77:
  *((void *)a3 + 17) = self->_tcpECNIntOffAvgRTT;
  *((void *)a3 + 50) |= 0x10000uLL;
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_29:
    if ((*(_DWORD *)&has & 0x80000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_79;
  }
LABEL_78:
  *((void *)a3 + 21) = self->_tcpECNIntOffRTTVar;
  *((void *)a3 + 50) |= 0x100000uLL;
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_30:
    if ((*(_DWORD *)&has & 0x800000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_80;
  }
LABEL_79:
  *((void *)a3 + 20) = self->_tcpECNIntOffOOBPer;
  *((void *)a3 + 50) |= 0x80000uLL;
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_31:
    if ((*(_DWORD *)&has & 0x200000) == 0) {
      goto LABEL_32;
    }
    goto LABEL_81;
  }
LABEL_80:
  *((void *)a3 + 24) = self->_tcpECNIntOffSACKE;
  *((void *)a3 + 50) |= 0x800000uLL;
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_32:
    if ((*(_DWORD *)&has & 0x400000) == 0) {
      goto LABEL_33;
    }
    goto LABEL_82;
  }
LABEL_81:
  *((void *)a3 + 22) = self->_tcpECNIntOffReorderPer;
  *((void *)a3 + 50) |= 0x200000uLL;
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_33:
    if ((*(void *)&has & 0x4000000000) == 0) {
      goto LABEL_34;
    }
    goto LABEL_83;
  }
LABEL_82:
  *((void *)a3 + 23) = self->_tcpECNIntOffRxmtPer;
  *((void *)a3 + 50) |= 0x400000uLL;
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(void *)&has & 0x4000000000) == 0)
  {
LABEL_34:
    if ((*(void *)&has & 0x2000000000) == 0) {
      goto LABEL_35;
    }
    goto LABEL_84;
  }
LABEL_83:
  *((void *)a3 + 39) = self->_tcpECNIntOnTotalTxPkts;
  *((void *)a3 + 50) |= 0x4000000000uLL;
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(void *)&has & 0x2000000000) == 0)
  {
LABEL_35:
    if ((*(void *)&has & 0x1000000000) == 0) {
      goto LABEL_36;
    }
    goto LABEL_85;
  }
LABEL_84:
  *((void *)a3 + 38) = self->_tcpECNIntOnTotalRxmtPkts;
  *((void *)a3 + 50) |= 0x2000000000uLL;
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(void *)&has & 0x1000000000) == 0)
  {
LABEL_36:
    if ((*(void *)&has & 0x800000000) == 0) {
      goto LABEL_37;
    }
    goto LABEL_86;
  }
LABEL_85:
  *((void *)a3 + 37) = self->_tcpECNIntOnTotalRxPkts;
  *((void *)a3 + 50) |= 0x1000000000uLL;
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(void *)&has & 0x800000000) == 0)
  {
LABEL_37:
    if ((*(_DWORD *)&has & 0x20000000) == 0) {
      goto LABEL_38;
    }
    goto LABEL_87;
  }
LABEL_86:
  *((void *)a3 + 36) = self->_tcpECNIntOnTotalOOPkts;
  *((void *)a3 + 50) |= 0x800000000uLL;
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000000) == 0)
  {
LABEL_38:
    if ((*(_DWORD *)&has & 0x40000000) == 0) {
      goto LABEL_39;
    }
    goto LABEL_88;
  }
LABEL_87:
  *((void *)a3 + 30) = self->_tcpECNIntOnDropRst;
  *((void *)a3 + 50) |= 0x20000000uLL;
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000000) == 0)
  {
LABEL_39:
    if ((*(_DWORD *)&has & 0x8000000) == 0) {
      goto LABEL_40;
    }
    goto LABEL_89;
  }
LABEL_88:
  *((void *)a3 + 31) = self->_tcpECNIntOnDropRxmt;
  *((void *)a3 + 50) |= 0x40000000uLL;
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_40:
    if ((*(_DWORD *)&has & 0x4000000) == 0) {
      goto LABEL_41;
    }
    goto LABEL_90;
  }
LABEL_89:
  *((void *)a3 + 28) = self->_tcpECNIntOffTotalTxPkts;
  *((void *)a3 + 50) |= 0x8000000uLL;
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_41:
    if ((*(_DWORD *)&has & 0x2000000) == 0) {
      goto LABEL_42;
    }
    goto LABEL_91;
  }
LABEL_90:
  *((void *)a3 + 27) = self->_tcpECNIntOffTotalRxmtPkts;
  *((void *)a3 + 50) |= 0x4000000uLL;
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_42:
    if ((*(_DWORD *)&has & 0x1000000) == 0) {
      goto LABEL_43;
    }
    goto LABEL_92;
  }
LABEL_91:
  *((void *)a3 + 26) = self->_tcpECNIntOffTotalRxPkts;
  *((void *)a3 + 50) |= 0x2000000uLL;
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_43:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_44;
    }
    goto LABEL_93;
  }
LABEL_92:
  *((void *)a3 + 25) = self->_tcpECNIntOffTotalOOPkts;
  *((void *)a3 + 50) |= 0x1000000uLL;
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_44:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_45;
    }
    goto LABEL_94;
  }
LABEL_93:
  *((void *)a3 + 18) = self->_tcpECNIntOffDropRst;
  *((void *)a3 + 50) |= 0x20000uLL;
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_45:
    if ((*(void *)&has & 0x800000000000) == 0) {
      goto LABEL_46;
    }
    goto LABEL_95;
  }
LABEL_94:
  *((void *)a3 + 19) = self->_tcpECNIntOffDropRxmt;
  *((void *)a3 + 50) |= 0x40000uLL;
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(void *)&has & 0x800000000000) == 0)
  {
LABEL_46:
    if ((*(void *)&has & 0x1000000000000) == 0) {
      goto LABEL_47;
    }
    goto LABEL_96;
  }
LABEL_95:
  *((void *)a3 + 48) = self->_tcpECNIntTotalConnections;
  *((void *)a3 + 50) |= 0x800000000000uLL;
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(void *)&has & 0x1000000000000) == 0)
  {
LABEL_47:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_48;
    }
    goto LABEL_97;
  }
LABEL_96:
  *((void *)a3 + 49) = self->_tcpUnsentDataAtSleepCnt;
  *((void *)a3 + 50) |= 0x1000000000000uLL;
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_48:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_49;
    }
    goto LABEL_98;
  }
LABEL_97:
  *((void *)a3 + 11) = self->_tcpECNIntFallbackDropRst;
  *((void *)a3 + 50) |= 0x400uLL;
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_49:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      return;
    }
LABEL_99:
    *((void *)a3 + 14) = self->_tcpECNIntFallbackSYNRst;
    *((void *)a3 + 50) |= 0x2000uLL;
    return;
  }
LABEL_98:
  *((void *)a3 + 12) = self->_tcpECNIntFallbackDropRxmt;
  *((void *)a3 + 50) |= 0x800uLL;
  if ((*(void *)&self->_has & 0x2000) != 0) {
    goto LABEL_99;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [(id)[(id)[(id)objc_opt_class() allocWithZone:a3] init];
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if (*(unsigned char *)&has)
  {
    *((void *)result + 1) = self->_interfaceType;
    *((void *)result + 50) |= 1uLL;
    $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
    if ((*(unsigned char *)&has & 2) == 0)
    {
LABEL_3:
      if ((*(unsigned char *)&has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_54;
    }
  }
  else if ((*(unsigned char *)&has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((void *)result + 2) = self->_ipProtocol;
  *((void *)result + 50) |= 2uLL;
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_4:
    if ((*(void *)&has & 0x80000000000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_55;
  }
LABEL_54:
  *((void *)result + 3) = self->_tcpECNIntClientSetup;
  *((void *)result + 50) |= 4uLL;
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(void *)&has & 0x80000000000) == 0)
  {
LABEL_5:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_56;
  }
LABEL_55:
  *((void *)result + 44) = self->_tcpECNIntServerSetup;
  *((void *)result + 50) |= 0x80000000000uLL;
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_6:
    if ((*(void *)&has & 0x100000000000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_57;
  }
LABEL_56:
  *((void *)result + 4) = self->_tcpECNIntClientSuccess;
  *((void *)result + 50) |= 8uLL;
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(void *)&has & 0x100000000000) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_58;
  }
LABEL_57:
  *((void *)result + 45) = self->_tcpECNIntServerSuccess;
  *((void *)result + 50) |= 0x100000000000uLL;
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_8:
    if ((*(void *)&has & 0x400000000000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_59;
  }
LABEL_58:
  *((void *)result + 16) = self->_tcpECNIntNotSupportedPeer;
  *((void *)result + 50) |= 0x8000uLL;
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(void *)&has & 0x400000000000) == 0)
  {
LABEL_9:
    if ((*(void *)&has & 0x200000000000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_60;
  }
LABEL_59:
  *((void *)result + 47) = self->_tcpECNIntSynLost;
  *((void *)result + 50) |= 0x400000000000uLL;
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(void *)&has & 0x200000000000) == 0)
  {
LABEL_10:
    if ((*(void *)&has & 0x8000000000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_61;
  }
LABEL_60:
  *((void *)result + 46) = self->_tcpECNIntSynAckLost;
  *((void *)result + 50) |= 0x200000000000uLL;
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(void *)&has & 0x8000000000) == 0)
  {
LABEL_11:
    if ((*(void *)&has & 0x10000000000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_62;
  }
LABEL_61:
  *((void *)result + 40) = self->_tcpECNIntRecvCE;
  *((void *)result + 50) |= 0x8000000000uLL;
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(void *)&has & 0x10000000000) == 0)
  {
LABEL_12:
    if ((*(void *)&has & 0x40000000000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_63;
  }
LABEL_62:
  *((void *)result + 41) = self->_tcpECNIntRecvECE;
  *((void *)result + 50) |= 0x10000000000uLL;
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(void *)&has & 0x40000000000) == 0)
  {
LABEL_13:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_14;
    }
    goto LABEL_64;
  }
LABEL_63:
  *((void *)result + 43) = self->_tcpECNIntSentECE;
  *((void *)result + 50) |= 0x40000000000uLL;
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_15;
    }
    goto LABEL_65;
  }
LABEL_64:
  *((void *)result + 8) = self->_tcpECNIntConnRecvCE;
  *((void *)result + 50) |= 0x80uLL;
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_15:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_16;
    }
    goto LABEL_66;
  }
LABEL_65:
  *((void *)result + 9) = self->_tcpECNIntConnRecvECE;
  *((void *)result + 50) |= 0x100uLL;
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_16:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_17;
    }
    goto LABEL_67;
  }
LABEL_66:
  *((void *)result + 7) = self->_tcpECNIntConnPLNoCE;
  *((void *)result + 50) |= 0x40uLL;
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_17:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_18;
    }
    goto LABEL_68;
  }
LABEL_67:
  *((void *)result + 6) = self->_tcpECNIntConnPLCE;
  *((void *)result + 50) |= 0x20uLL;
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_69;
  }
LABEL_68:
  *((void *)result + 5) = self->_tcpECNIntConnNoPLCE;
  *((void *)result + 50) |= 0x10uLL;
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_19:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_70;
  }
LABEL_69:
  *((void *)result + 15) = self->_tcpECNIntFallbackSynLoss;
  *((void *)result + 50) |= 0x4000uLL;
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_20:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_21;
    }
    goto LABEL_71;
  }
LABEL_70:
  *((void *)result + 13) = self->_tcpECNIntFallbackReorder;
  *((void *)result + 50) |= 0x1000uLL;
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_21:
    if ((*(_DWORD *)&has & 0x10000000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_72;
  }
LABEL_71:
  *((void *)result + 10) = self->_tcpECNIntFallbackCE;
  *((void *)result + 50) |= 0x200uLL;
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) == 0)
  {
LABEL_22:
    if ((*(void *)&has & 0x100000000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_73;
  }
LABEL_72:
  *((void *)result + 29) = self->_tcpECNIntOnAvgRTT;
  *((void *)result + 50) |= 0x10000000uLL;
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(void *)&has & 0x100000000) == 0)
  {
LABEL_23:
    if ((*(_DWORD *)&has & 0x80000000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_74;
  }
LABEL_73:
  *((void *)result + 33) = self->_tcpECNIntOnRTTVar;
  *((void *)result + 50) |= 0x100000000uLL;
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000000) == 0)
  {
LABEL_24:
    if ((*(void *)&has & 0x400000000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_75;
  }
LABEL_74:
  *((void *)result + 32) = self->_tcpECNIntOnOOBPer;
  *((void *)result + 50) |= 0x80000000uLL;
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(void *)&has & 0x400000000) == 0)
  {
LABEL_25:
    if ((*(void *)&has & 0x200000000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_76;
  }
LABEL_75:
  *((void *)result + 35) = self->_tcpECNIntOnSACKE;
  *((void *)result + 50) |= 0x400000000uLL;
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(void *)&has & 0x200000000) == 0)
  {
LABEL_26:
    if ((*(void *)&has & 0x20000000000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_77;
  }
LABEL_76:
  *((void *)result + 34) = self->_tcpECNIntOnReorderPer;
  *((void *)result + 50) |= 0x200000000uLL;
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(void *)&has & 0x20000000000) == 0)
  {
LABEL_27:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_78;
  }
LABEL_77:
  *((void *)result + 42) = self->_tcpECNIntRxmtPer;
  *((void *)result + 50) |= 0x20000000000uLL;
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_28:
    if ((*(_DWORD *)&has & 0x100000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_79;
  }
LABEL_78:
  *((void *)result + 17) = self->_tcpECNIntOffAvgRTT;
  *((void *)result + 50) |= 0x10000uLL;
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_29:
    if ((*(_DWORD *)&has & 0x80000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_80;
  }
LABEL_79:
  *((void *)result + 21) = self->_tcpECNIntOffRTTVar;
  *((void *)result + 50) |= 0x100000uLL;
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_30:
    if ((*(_DWORD *)&has & 0x800000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_81;
  }
LABEL_80:
  *((void *)result + 20) = self->_tcpECNIntOffOOBPer;
  *((void *)result + 50) |= 0x80000uLL;
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_31:
    if ((*(_DWORD *)&has & 0x200000) == 0) {
      goto LABEL_32;
    }
    goto LABEL_82;
  }
LABEL_81:
  *((void *)result + 24) = self->_tcpECNIntOffSACKE;
  *((void *)result + 50) |= 0x800000uLL;
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_32:
    if ((*(_DWORD *)&has & 0x400000) == 0) {
      goto LABEL_33;
    }
    goto LABEL_83;
  }
LABEL_82:
  *((void *)result + 22) = self->_tcpECNIntOffReorderPer;
  *((void *)result + 50) |= 0x200000uLL;
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_33:
    if ((*(void *)&has & 0x4000000000) == 0) {
      goto LABEL_34;
    }
    goto LABEL_84;
  }
LABEL_83:
  *((void *)result + 23) = self->_tcpECNIntOffRxmtPer;
  *((void *)result + 50) |= 0x400000uLL;
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(void *)&has & 0x4000000000) == 0)
  {
LABEL_34:
    if ((*(void *)&has & 0x2000000000) == 0) {
      goto LABEL_35;
    }
    goto LABEL_85;
  }
LABEL_84:
  *((void *)result + 39) = self->_tcpECNIntOnTotalTxPkts;
  *((void *)result + 50) |= 0x4000000000uLL;
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(void *)&has & 0x2000000000) == 0)
  {
LABEL_35:
    if ((*(void *)&has & 0x1000000000) == 0) {
      goto LABEL_36;
    }
    goto LABEL_86;
  }
LABEL_85:
  *((void *)result + 38) = self->_tcpECNIntOnTotalRxmtPkts;
  *((void *)result + 50) |= 0x2000000000uLL;
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(void *)&has & 0x1000000000) == 0)
  {
LABEL_36:
    if ((*(void *)&has & 0x800000000) == 0) {
      goto LABEL_37;
    }
    goto LABEL_87;
  }
LABEL_86:
  *((void *)result + 37) = self->_tcpECNIntOnTotalRxPkts;
  *((void *)result + 50) |= 0x1000000000uLL;
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(void *)&has & 0x800000000) == 0)
  {
LABEL_37:
    if ((*(_DWORD *)&has & 0x20000000) == 0) {
      goto LABEL_38;
    }
    goto LABEL_88;
  }
LABEL_87:
  *((void *)result + 36) = self->_tcpECNIntOnTotalOOPkts;
  *((void *)result + 50) |= 0x800000000uLL;
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000000) == 0)
  {
LABEL_38:
    if ((*(_DWORD *)&has & 0x40000000) == 0) {
      goto LABEL_39;
    }
    goto LABEL_89;
  }
LABEL_88:
  *((void *)result + 30) = self->_tcpECNIntOnDropRst;
  *((void *)result + 50) |= 0x20000000uLL;
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000000) == 0)
  {
LABEL_39:
    if ((*(_DWORD *)&has & 0x8000000) == 0) {
      goto LABEL_40;
    }
    goto LABEL_90;
  }
LABEL_89:
  *((void *)result + 31) = self->_tcpECNIntOnDropRxmt;
  *((void *)result + 50) |= 0x40000000uLL;
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_40:
    if ((*(_DWORD *)&has & 0x4000000) == 0) {
      goto LABEL_41;
    }
    goto LABEL_91;
  }
LABEL_90:
  *((void *)result + 28) = self->_tcpECNIntOffTotalTxPkts;
  *((void *)result + 50) |= 0x8000000uLL;
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_41:
    if ((*(_DWORD *)&has & 0x2000000) == 0) {
      goto LABEL_42;
    }
    goto LABEL_92;
  }
LABEL_91:
  *((void *)result + 27) = self->_tcpECNIntOffTotalRxmtPkts;
  *((void *)result + 50) |= 0x4000000uLL;
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_42:
    if ((*(_DWORD *)&has & 0x1000000) == 0) {
      goto LABEL_43;
    }
    goto LABEL_93;
  }
LABEL_92:
  *((void *)result + 26) = self->_tcpECNIntOffTotalRxPkts;
  *((void *)result + 50) |= 0x2000000uLL;
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_43:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_44;
    }
    goto LABEL_94;
  }
LABEL_93:
  *((void *)result + 25) = self->_tcpECNIntOffTotalOOPkts;
  *((void *)result + 50) |= 0x1000000uLL;
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_44:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_45;
    }
    goto LABEL_95;
  }
LABEL_94:
  *((void *)result + 18) = self->_tcpECNIntOffDropRst;
  *((void *)result + 50) |= 0x20000uLL;
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_45:
    if ((*(void *)&has & 0x800000000000) == 0) {
      goto LABEL_46;
    }
    goto LABEL_96;
  }
LABEL_95:
  *((void *)result + 19) = self->_tcpECNIntOffDropRxmt;
  *((void *)result + 50) |= 0x40000uLL;
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(void *)&has & 0x800000000000) == 0)
  {
LABEL_46:
    if ((*(void *)&has & 0x1000000000000) == 0) {
      goto LABEL_47;
    }
    goto LABEL_97;
  }
LABEL_96:
  *((void *)result + 48) = self->_tcpECNIntTotalConnections;
  *((void *)result + 50) |= 0x800000000000uLL;
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(void *)&has & 0x1000000000000) == 0)
  {
LABEL_47:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_48;
    }
    goto LABEL_98;
  }
LABEL_97:
  *((void *)result + 49) = self->_tcpUnsentDataAtSleepCnt;
  *((void *)result + 50) |= 0x1000000000000uLL;
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_48:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_49;
    }
    goto LABEL_99;
  }
LABEL_98:
  *((void *)result + 11) = self->_tcpECNIntFallbackDropRst;
  *((void *)result + 50) |= 0x400uLL;
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_49:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      return result;
    }
    goto LABEL_50;
  }
LABEL_99:
  *((void *)result + 12) = self->_tcpECNIntFallbackDropRxmt;
  *((void *)result + 50) |= 0x800uLL;
  if ((*(void *)&self->_has & 0x2000) == 0) {
    return result;
  }
LABEL_50:
  *((void *)result + 14) = self->_tcpECNIntFallbackSYNRst;
  *((void *)result + 50) |= 0x2000uLL;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
    uint64_t v7 = *((void *)a3 + 50);
    if (*(unsigned char *)&has)
    {
      if ((v7 & 1) == 0 || self->_interfaceType != *((void *)a3 + 1)) {
        goto LABEL_246;
      }
    }
    else if (v7)
    {
LABEL_246:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(unsigned char *)&has & 2) != 0)
    {
      if ((v7 & 2) == 0 || self->_ipProtocol != *((void *)a3 + 2)) {
        goto LABEL_246;
      }
    }
    else if ((v7 & 2) != 0)
    {
      goto LABEL_246;
    }
    if ((*(unsigned char *)&has & 4) != 0)
    {
      if ((v7 & 4) == 0 || self->_tcpECNIntClientSetup != *((void *)a3 + 3)) {
        goto LABEL_246;
      }
    }
    else if ((v7 & 4) != 0)
    {
      goto LABEL_246;
    }
    if ((*(void *)&has & 0x80000000000) != 0)
    {
      if ((v7 & 0x80000000000) == 0 || self->_tcpECNIntServerSetup != *((void *)a3 + 44)) {
        goto LABEL_246;
      }
    }
    else if ((v7 & 0x80000000000) != 0)
    {
      goto LABEL_246;
    }
    if ((*(unsigned char *)&has & 8) != 0)
    {
      if ((v7 & 8) == 0 || self->_tcpECNIntClientSuccess != *((void *)a3 + 4)) {
        goto LABEL_246;
      }
    }
    else if ((v7 & 8) != 0)
    {
      goto LABEL_246;
    }
    if ((*(void *)&has & 0x100000000000) != 0)
    {
      if ((v7 & 0x100000000000) == 0 || self->_tcpECNIntServerSuccess != *((void *)a3 + 45)) {
        goto LABEL_246;
      }
    }
    else if ((v7 & 0x100000000000) != 0)
    {
      goto LABEL_246;
    }
    if ((*(_WORD *)&has & 0x8000) != 0)
    {
      if ((v7 & 0x8000) == 0 || self->_tcpECNIntNotSupportedPeer != *((void *)a3 + 16)) {
        goto LABEL_246;
      }
    }
    else if ((v7 & 0x8000) != 0)
    {
      goto LABEL_246;
    }
    if ((*(void *)&has & 0x400000000000) != 0)
    {
      if ((v7 & 0x400000000000) == 0 || self->_tcpECNIntSynLost != *((void *)a3 + 47)) {
        goto LABEL_246;
      }
    }
    else if ((v7 & 0x400000000000) != 0)
    {
      goto LABEL_246;
    }
    if ((*(void *)&has & 0x200000000000) != 0)
    {
      if ((v7 & 0x200000000000) == 0 || self->_tcpECNIntSynAckLost != *((void *)a3 + 46)) {
        goto LABEL_246;
      }
    }
    else if ((v7 & 0x200000000000) != 0)
    {
      goto LABEL_246;
    }
    if ((*(void *)&has & 0x8000000000) != 0)
    {
      if ((v7 & 0x8000000000) == 0 || self->_tcpECNIntRecvCE != *((void *)a3 + 40)) {
        goto LABEL_246;
      }
    }
    else if ((v7 & 0x8000000000) != 0)
    {
      goto LABEL_246;
    }
    if ((*(void *)&has & 0x10000000000) != 0)
    {
      if ((v7 & 0x10000000000) == 0 || self->_tcpECNIntRecvECE != *((void *)a3 + 41)) {
        goto LABEL_246;
      }
    }
    else if ((v7 & 0x10000000000) != 0)
    {
      goto LABEL_246;
    }
    if ((*(void *)&has & 0x40000000000) != 0)
    {
      if ((v7 & 0x40000000000) == 0 || self->_tcpECNIntSentECE != *((void *)a3 + 43)) {
        goto LABEL_246;
      }
    }
    else if ((v7 & 0x40000000000) != 0)
    {
      goto LABEL_246;
    }
    if ((*(unsigned char *)&has & 0x80) != 0)
    {
      if ((v7 & 0x80) == 0 || self->_tcpECNIntConnRecvCE != *((void *)a3 + 8)) {
        goto LABEL_246;
      }
    }
    else if ((v7 & 0x80) != 0)
    {
      goto LABEL_246;
    }
    if ((*(_WORD *)&has & 0x100) != 0)
    {
      if ((v7 & 0x100) == 0 || self->_tcpECNIntConnRecvECE != *((void *)a3 + 9)) {
        goto LABEL_246;
      }
    }
    else if ((v7 & 0x100) != 0)
    {
      goto LABEL_246;
    }
    if ((*(unsigned char *)&has & 0x40) != 0)
    {
      if ((v7 & 0x40) == 0 || self->_tcpECNIntConnPLNoCE != *((void *)a3 + 7)) {
        goto LABEL_246;
      }
    }
    else if ((v7 & 0x40) != 0)
    {
      goto LABEL_246;
    }
    if ((*(unsigned char *)&has & 0x20) != 0)
    {
      if ((v7 & 0x20) == 0 || self->_tcpECNIntConnPLCE != *((void *)a3 + 6)) {
        goto LABEL_246;
      }
    }
    else if ((v7 & 0x20) != 0)
    {
      goto LABEL_246;
    }
    if ((*(unsigned char *)&has & 0x10) != 0)
    {
      if ((v7 & 0x10) == 0 || self->_tcpECNIntConnNoPLCE != *((void *)a3 + 5)) {
        goto LABEL_246;
      }
    }
    else if ((v7 & 0x10) != 0)
    {
      goto LABEL_246;
    }
    if ((*(_WORD *)&has & 0x4000) != 0)
    {
      if ((v7 & 0x4000) == 0 || self->_tcpECNIntFallbackSynLoss != *((void *)a3 + 15)) {
        goto LABEL_246;
      }
    }
    else if ((v7 & 0x4000) != 0)
    {
      goto LABEL_246;
    }
    if ((*(_WORD *)&has & 0x1000) != 0)
    {
      if ((v7 & 0x1000) == 0 || self->_tcpECNIntFallbackReorder != *((void *)a3 + 13)) {
        goto LABEL_246;
      }
    }
    else if ((v7 & 0x1000) != 0)
    {
      goto LABEL_246;
    }
    if ((*(_WORD *)&has & 0x200) != 0)
    {
      if ((v7 & 0x200) == 0 || self->_tcpECNIntFallbackCE != *((void *)a3 + 10)) {
        goto LABEL_246;
      }
    }
    else if ((v7 & 0x200) != 0)
    {
      goto LABEL_246;
    }
    if ((*(_DWORD *)&has & 0x10000000) != 0)
    {
      if ((v7 & 0x10000000) == 0 || self->_tcpECNIntOnAvgRTT != *((void *)a3 + 29)) {
        goto LABEL_246;
      }
    }
    else if ((v7 & 0x10000000) != 0)
    {
      goto LABEL_246;
    }
    if ((*(void *)&has & 0x100000000) != 0)
    {
      if ((v7 & 0x100000000) == 0 || self->_tcpECNIntOnRTTVar != *((void *)a3 + 33)) {
        goto LABEL_246;
      }
    }
    else if ((v7 & 0x100000000) != 0)
    {
      goto LABEL_246;
    }
    if ((*(_DWORD *)&has & 0x80000000) != 0)
    {
      if ((v7 & 0x80000000) == 0 || self->_tcpECNIntOnOOBPer != *((void *)a3 + 32)) {
        goto LABEL_246;
      }
    }
    else if ((v7 & 0x80000000) != 0)
    {
      goto LABEL_246;
    }
    if ((*(void *)&has & 0x400000000) != 0)
    {
      if ((v7 & 0x400000000) == 0 || self->_tcpECNIntOnSACKE != *((void *)a3 + 35)) {
        goto LABEL_246;
      }
    }
    else if ((v7 & 0x400000000) != 0)
    {
      goto LABEL_246;
    }
    if ((*(void *)&has & 0x200000000) != 0)
    {
      if ((v7 & 0x200000000) == 0 || self->_tcpECNIntOnReorderPer != *((void *)a3 + 34)) {
        goto LABEL_246;
      }
    }
    else if ((v7 & 0x200000000) != 0)
    {
      goto LABEL_246;
    }
    if ((*(void *)&has & 0x20000000000) != 0)
    {
      if ((v7 & 0x20000000000) == 0 || self->_tcpECNIntRxmtPer != *((void *)a3 + 42)) {
        goto LABEL_246;
      }
    }
    else if ((v7 & 0x20000000000) != 0)
    {
      goto LABEL_246;
    }
    if ((*(_DWORD *)&has & 0x10000) != 0)
    {
      if ((v7 & 0x10000) == 0 || self->_tcpECNIntOffAvgRTT != *((void *)a3 + 17)) {
        goto LABEL_246;
      }
    }
    else if ((v7 & 0x10000) != 0)
    {
      goto LABEL_246;
    }
    if ((*(_DWORD *)&has & 0x100000) != 0)
    {
      if ((v7 & 0x100000) == 0 || self->_tcpECNIntOffRTTVar != *((void *)a3 + 21)) {
        goto LABEL_246;
      }
    }
    else if ((v7 & 0x100000) != 0)
    {
      goto LABEL_246;
    }
    if ((*(_DWORD *)&has & 0x80000) != 0)
    {
      if ((v7 & 0x80000) == 0 || self->_tcpECNIntOffOOBPer != *((void *)a3 + 20)) {
        goto LABEL_246;
      }
    }
    else if ((v7 & 0x80000) != 0)
    {
      goto LABEL_246;
    }
    if ((*(_DWORD *)&has & 0x800000) != 0)
    {
      if ((v7 & 0x800000) == 0 || self->_tcpECNIntOffSACKE != *((void *)a3 + 24)) {
        goto LABEL_246;
      }
    }
    else if ((v7 & 0x800000) != 0)
    {
      goto LABEL_246;
    }
    if ((*(_DWORD *)&has & 0x200000) != 0)
    {
      if ((v7 & 0x200000) == 0 || self->_tcpECNIntOffReorderPer != *((void *)a3 + 22)) {
        goto LABEL_246;
      }
    }
    else if ((v7 & 0x200000) != 0)
    {
      goto LABEL_246;
    }
    if ((*(_DWORD *)&has & 0x400000) != 0)
    {
      if ((v7 & 0x400000) == 0 || self->_tcpECNIntOffRxmtPer != *((void *)a3 + 23)) {
        goto LABEL_246;
      }
    }
    else if ((v7 & 0x400000) != 0)
    {
      goto LABEL_246;
    }
    if ((*(void *)&has & 0x4000000000) != 0)
    {
      if ((v7 & 0x4000000000) == 0 || self->_tcpECNIntOnTotalTxPkts != *((void *)a3 + 39)) {
        goto LABEL_246;
      }
    }
    else if ((v7 & 0x4000000000) != 0)
    {
      goto LABEL_246;
    }
    if ((*(void *)&has & 0x2000000000) != 0)
    {
      if ((v7 & 0x2000000000) == 0 || self->_tcpECNIntOnTotalRxmtPkts != *((void *)a3 + 38)) {
        goto LABEL_246;
      }
    }
    else if ((v7 & 0x2000000000) != 0)
    {
      goto LABEL_246;
    }
    if ((*(void *)&has & 0x1000000000) != 0)
    {
      if ((v7 & 0x1000000000) == 0 || self->_tcpECNIntOnTotalRxPkts != *((void *)a3 + 37)) {
        goto LABEL_246;
      }
    }
    else if ((v7 & 0x1000000000) != 0)
    {
      goto LABEL_246;
    }
    if ((*(void *)&has & 0x800000000) != 0)
    {
      if ((v7 & 0x800000000) == 0 || self->_tcpECNIntOnTotalOOPkts != *((void *)a3 + 36)) {
        goto LABEL_246;
      }
    }
    else if ((v7 & 0x800000000) != 0)
    {
      goto LABEL_246;
    }
    if ((*(_DWORD *)&has & 0x20000000) != 0)
    {
      if ((v7 & 0x20000000) == 0 || self->_tcpECNIntOnDropRst != *((void *)a3 + 30)) {
        goto LABEL_246;
      }
    }
    else if ((v7 & 0x20000000) != 0)
    {
      goto LABEL_246;
    }
    if ((*(_DWORD *)&has & 0x40000000) != 0)
    {
      if ((v7 & 0x40000000) == 0 || self->_tcpECNIntOnDropRxmt != *((void *)a3 + 31)) {
        goto LABEL_246;
      }
    }
    else if ((v7 & 0x40000000) != 0)
    {
      goto LABEL_246;
    }
    if ((*(_DWORD *)&has & 0x8000000) != 0)
    {
      if ((v7 & 0x8000000) == 0 || self->_tcpECNIntOffTotalTxPkts != *((void *)a3 + 28)) {
        goto LABEL_246;
      }
    }
    else if ((v7 & 0x8000000) != 0)
    {
      goto LABEL_246;
    }
    if ((*(_DWORD *)&has & 0x4000000) != 0)
    {
      if ((v7 & 0x4000000) == 0 || self->_tcpECNIntOffTotalRxmtPkts != *((void *)a3 + 27)) {
        goto LABEL_246;
      }
    }
    else if ((v7 & 0x4000000) != 0)
    {
      goto LABEL_246;
    }
    if ((*(_DWORD *)&has & 0x2000000) != 0)
    {
      if ((v7 & 0x2000000) == 0 || self->_tcpECNIntOffTotalRxPkts != *((void *)a3 + 26)) {
        goto LABEL_246;
      }
    }
    else if ((v7 & 0x2000000) != 0)
    {
      goto LABEL_246;
    }
    if ((*(_DWORD *)&has & 0x1000000) != 0)
    {
      if ((v7 & 0x1000000) == 0 || self->_tcpECNIntOffTotalOOPkts != *((void *)a3 + 25)) {
        goto LABEL_246;
      }
    }
    else if ((v7 & 0x1000000) != 0)
    {
      goto LABEL_246;
    }
    if ((*(_DWORD *)&has & 0x20000) != 0)
    {
      if ((v7 & 0x20000) == 0 || self->_tcpECNIntOffDropRst != *((void *)a3 + 18)) {
        goto LABEL_246;
      }
    }
    else if ((v7 & 0x20000) != 0)
    {
      goto LABEL_246;
    }
    if ((*(_DWORD *)&has & 0x40000) != 0)
    {
      if ((v7 & 0x40000) == 0 || self->_tcpECNIntOffDropRxmt != *((void *)a3 + 19)) {
        goto LABEL_246;
      }
    }
    else if ((v7 & 0x40000) != 0)
    {
      goto LABEL_246;
    }
    if ((*(void *)&has & 0x800000000000) != 0)
    {
      if ((v7 & 0x800000000000) == 0 || self->_tcpECNIntTotalConnections != *((void *)a3 + 48)) {
        goto LABEL_246;
      }
    }
    else if ((v7 & 0x800000000000) != 0)
    {
      goto LABEL_246;
    }
    if ((*(void *)&has & 0x1000000000000) != 0)
    {
      if ((v7 & 0x1000000000000) == 0 || self->_tcpUnsentDataAtSleepCnt != *((void *)a3 + 49)) {
        goto LABEL_246;
      }
    }
    else if ((v7 & 0x1000000000000) != 0)
    {
      goto LABEL_246;
    }
    if ((*(_WORD *)&has & 0x400) != 0)
    {
      if ((v7 & 0x400) == 0 || self->_tcpECNIntFallbackDropRst != *((void *)a3 + 11)) {
        goto LABEL_246;
      }
    }
    else if ((v7 & 0x400) != 0)
    {
      goto LABEL_246;
    }
    if ((*(_WORD *)&has & 0x800) != 0)
    {
      if ((v7 & 0x800) == 0 || self->_tcpECNIntFallbackDropRxmt != *((void *)a3 + 12)) {
        goto LABEL_246;
      }
    }
    else if ((v7 & 0x800) != 0)
    {
      goto LABEL_246;
    }
    LOBYTE(v5) = (*((void *)a3 + 50) & 0x2000) == 0;
    if ((*(_WORD *)&has & 0x2000) != 0)
    {
      if ((v7 & 0x2000) == 0 || self->_tcpECNIntFallbackSYNRst != *((void *)a3 + 14)) {
        goto LABEL_246;
      }
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  $E9537ED3C3FE9D68E134AF95349F1C12 has = self->_has;
  if (*(unsigned char *)&has)
  {
    unint64_t v52 = 2654435761u * self->_interfaceType;
    if ((*(unsigned char *)&has & 2) != 0)
    {
LABEL_3:
      unint64_t v51 = 2654435761u * self->_ipProtocol;
      if ((*(unsigned char *)&has & 4) != 0) {
        goto LABEL_4;
      }
      goto LABEL_53;
    }
  }
  else
  {
    unint64_t v52 = 0;
    if ((*(unsigned char *)&has & 2) != 0) {
      goto LABEL_3;
    }
  }
  unint64_t v51 = 0;
  if ((*(unsigned char *)&has & 4) != 0)
  {
LABEL_4:
    unint64_t v50 = 2654435761u * self->_tcpECNIntClientSetup;
    if ((*(void *)&has & 0x80000000000) != 0) {
      goto LABEL_5;
    }
    goto LABEL_54;
  }
LABEL_53:
  unint64_t v50 = 0;
  if ((*(void *)&has & 0x80000000000) != 0)
  {
LABEL_5:
    unint64_t v49 = 2654435761u * self->_tcpECNIntServerSetup;
    if ((*(unsigned char *)&has & 8) != 0) {
      goto LABEL_6;
    }
    goto LABEL_55;
  }
LABEL_54:
  unint64_t v49 = 0;
  if ((*(unsigned char *)&has & 8) != 0)
  {
LABEL_6:
    unint64_t v48 = 2654435761u * self->_tcpECNIntClientSuccess;
    if ((*(void *)&has & 0x100000000000) != 0) {
      goto LABEL_7;
    }
    goto LABEL_56;
  }
LABEL_55:
  unint64_t v48 = 0;
  if ((*(void *)&has & 0x100000000000) != 0)
  {
LABEL_7:
    unint64_t v47 = 2654435761u * self->_tcpECNIntServerSuccess;
    if ((*(_WORD *)&has & 0x8000) != 0) {
      goto LABEL_8;
    }
    goto LABEL_57;
  }
LABEL_56:
  unint64_t v47 = 0;
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
LABEL_8:
    unint64_t v46 = 2654435761u * self->_tcpECNIntNotSupportedPeer;
    if ((*(void *)&has & 0x400000000000) != 0) {
      goto LABEL_9;
    }
    goto LABEL_58;
  }
LABEL_57:
  unint64_t v46 = 0;
  if ((*(void *)&has & 0x400000000000) != 0)
  {
LABEL_9:
    unint64_t v45 = 2654435761u * self->_tcpECNIntSynLost;
    if ((*(void *)&has & 0x200000000000) != 0) {
      goto LABEL_10;
    }
    goto LABEL_59;
  }
LABEL_58:
  unint64_t v45 = 0;
  if ((*(void *)&has & 0x200000000000) != 0)
  {
LABEL_10:
    unint64_t v44 = 2654435761u * self->_tcpECNIntSynAckLost;
    if ((*(void *)&has & 0x8000000000) != 0) {
      goto LABEL_11;
    }
    goto LABEL_60;
  }
LABEL_59:
  unint64_t v44 = 0;
  if ((*(void *)&has & 0x8000000000) != 0)
  {
LABEL_11:
    unint64_t v43 = 2654435761u * self->_tcpECNIntRecvCE;
    if ((*(void *)&has & 0x10000000000) != 0) {
      goto LABEL_12;
    }
    goto LABEL_61;
  }
LABEL_60:
  unint64_t v43 = 0;
  if ((*(void *)&has & 0x10000000000) != 0)
  {
LABEL_12:
    unint64_t v42 = 2654435761u * self->_tcpECNIntRecvECE;
    if ((*(void *)&has & 0x40000000000) != 0) {
      goto LABEL_13;
    }
    goto LABEL_62;
  }
LABEL_61:
  unint64_t v42 = 0;
  if ((*(void *)&has & 0x40000000000) != 0)
  {
LABEL_13:
    unint64_t v41 = 2654435761u * self->_tcpECNIntSentECE;
    if ((*(unsigned char *)&has & 0x80) != 0) {
      goto LABEL_14;
    }
    goto LABEL_63;
  }
LABEL_62:
  unint64_t v41 = 0;
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
LABEL_14:
    unint64_t v40 = 2654435761u * self->_tcpECNIntConnRecvCE;
    if ((*(_WORD *)&has & 0x100) != 0) {
      goto LABEL_15;
    }
    goto LABEL_64;
  }
LABEL_63:
  unint64_t v40 = 0;
  if ((*(_WORD *)&has & 0x100) != 0)
  {
LABEL_15:
    unint64_t v39 = 2654435761u * self->_tcpECNIntConnRecvECE;
    if ((*(unsigned char *)&has & 0x40) != 0) {
      goto LABEL_16;
    }
    goto LABEL_65;
  }
LABEL_64:
  unint64_t v39 = 0;
  if ((*(unsigned char *)&has & 0x40) != 0)
  {
LABEL_16:
    unint64_t v38 = 2654435761u * self->_tcpECNIntConnPLNoCE;
    if ((*(unsigned char *)&has & 0x20) != 0) {
      goto LABEL_17;
    }
    goto LABEL_66;
  }
LABEL_65:
  unint64_t v38 = 0;
  if ((*(unsigned char *)&has & 0x20) != 0)
  {
LABEL_17:
    unint64_t v37 = 2654435761u * self->_tcpECNIntConnPLCE;
    if ((*(unsigned char *)&has & 0x10) != 0) {
      goto LABEL_18;
    }
    goto LABEL_67;
  }
LABEL_66:
  unint64_t v37 = 0;
  if ((*(unsigned char *)&has & 0x10) != 0)
  {
LABEL_18:
    unint64_t v36 = 2654435761u * self->_tcpECNIntConnNoPLCE;
    if ((*(_WORD *)&has & 0x4000) != 0) {
      goto LABEL_19;
    }
    goto LABEL_68;
  }
LABEL_67:
  unint64_t v36 = 0;
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
LABEL_19:
    unint64_t v35 = 2654435761u * self->_tcpECNIntFallbackSynLoss;
    if ((*(_WORD *)&has & 0x1000) != 0) {
      goto LABEL_20;
    }
    goto LABEL_69;
  }
LABEL_68:
  unint64_t v35 = 0;
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
LABEL_20:
    unint64_t v34 = 2654435761u * self->_tcpECNIntFallbackReorder;
    if ((*(_WORD *)&has & 0x200) != 0) {
      goto LABEL_21;
    }
    goto LABEL_70;
  }
LABEL_69:
  unint64_t v34 = 0;
  if ((*(_WORD *)&has & 0x200) != 0)
  {
LABEL_21:
    unint64_t v33 = 2654435761u * self->_tcpECNIntFallbackCE;
    if ((*(_DWORD *)&has & 0x10000000) != 0) {
      goto LABEL_22;
    }
    goto LABEL_71;
  }
LABEL_70:
  unint64_t v33 = 0;
  if ((*(_DWORD *)&has & 0x10000000) != 0)
  {
LABEL_22:
    unint64_t v32 = 2654435761u * self->_tcpECNIntOnAvgRTT;
    if ((*(void *)&has & 0x100000000) != 0) {
      goto LABEL_23;
    }
    goto LABEL_72;
  }
LABEL_71:
  unint64_t v32 = 0;
  if ((*(void *)&has & 0x100000000) != 0)
  {
LABEL_23:
    unint64_t v31 = 2654435761u * self->_tcpECNIntOnRTTVar;
    if ((*(_DWORD *)&has & 0x80000000) != 0) {
      goto LABEL_24;
    }
    goto LABEL_73;
  }
LABEL_72:
  unint64_t v31 = 0;
  if ((*(_DWORD *)&has & 0x80000000) != 0)
  {
LABEL_24:
    unint64_t v30 = 2654435761u * self->_tcpECNIntOnOOBPer;
    if ((*(void *)&has & 0x400000000) != 0) {
      goto LABEL_25;
    }
    goto LABEL_74;
  }
LABEL_73:
  unint64_t v30 = 0;
  if ((*(void *)&has & 0x400000000) != 0)
  {
LABEL_25:
    unint64_t v3 = 2654435761u * self->_tcpECNIntOnSACKE;
    if ((*(void *)&has & 0x200000000) != 0) {
      goto LABEL_26;
    }
    goto LABEL_75;
  }
LABEL_74:
  unint64_t v3 = 0;
  if ((*(void *)&has & 0x200000000) != 0)
  {
LABEL_26:
    unint64_t v4 = 2654435761u * self->_tcpECNIntOnReorderPer;
    if ((*(void *)&has & 0x20000000000) != 0) {
      goto LABEL_27;
    }
    goto LABEL_76;
  }
LABEL_75:
  unint64_t v4 = 0;
  if ((*(void *)&has & 0x20000000000) != 0)
  {
LABEL_27:
    unint64_t v5 = 2654435761u * self->_tcpECNIntRxmtPer;
    if ((*(_DWORD *)&has & 0x10000) != 0) {
      goto LABEL_28;
    }
    goto LABEL_77;
  }
LABEL_76:
  unint64_t v5 = 0;
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
LABEL_28:
    unint64_t v6 = 2654435761u * self->_tcpECNIntOffAvgRTT;
    if ((*(_DWORD *)&has & 0x100000) != 0) {
      goto LABEL_29;
    }
    goto LABEL_78;
  }
LABEL_77:
  unint64_t v6 = 0;
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
LABEL_29:
    unint64_t v7 = 2654435761u * self->_tcpECNIntOffRTTVar;
    if ((*(_DWORD *)&has & 0x80000) != 0) {
      goto LABEL_30;
    }
    goto LABEL_79;
  }
LABEL_78:
  unint64_t v7 = 0;
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
LABEL_30:
    unint64_t v8 = 2654435761u * self->_tcpECNIntOffOOBPer;
    if ((*(_DWORD *)&has & 0x800000) != 0) {
      goto LABEL_31;
    }
    goto LABEL_80;
  }
LABEL_79:
  unint64_t v8 = 0;
  if ((*(_DWORD *)&has & 0x800000) != 0)
  {
LABEL_31:
    unint64_t v9 = 2654435761u * self->_tcpECNIntOffSACKE;
    if ((*(_DWORD *)&has & 0x200000) != 0) {
      goto LABEL_32;
    }
    goto LABEL_81;
  }
LABEL_80:
  unint64_t v9 = 0;
  if ((*(_DWORD *)&has & 0x200000) != 0)
  {
LABEL_32:
    unint64_t v10 = 2654435761u * self->_tcpECNIntOffReorderPer;
    if ((*(_DWORD *)&has & 0x400000) != 0) {
      goto LABEL_33;
    }
    goto LABEL_82;
  }
LABEL_81:
  unint64_t v10 = 0;
  if ((*(_DWORD *)&has & 0x400000) != 0)
  {
LABEL_33:
    unint64_t v11 = 2654435761u * self->_tcpECNIntOffRxmtPer;
    if ((*(void *)&has & 0x4000000000) != 0) {
      goto LABEL_34;
    }
    goto LABEL_83;
  }
LABEL_82:
  unint64_t v11 = 0;
  if ((*(void *)&has & 0x4000000000) != 0)
  {
LABEL_34:
    unint64_t v12 = 2654435761u * self->_tcpECNIntOnTotalTxPkts;
    if ((*(void *)&has & 0x2000000000) != 0) {
      goto LABEL_35;
    }
    goto LABEL_84;
  }
LABEL_83:
  unint64_t v12 = 0;
  if ((*(void *)&has & 0x2000000000) != 0)
  {
LABEL_35:
    unint64_t v13 = 2654435761u * self->_tcpECNIntOnTotalRxmtPkts;
    if ((*(void *)&has & 0x1000000000) != 0) {
      goto LABEL_36;
    }
    goto LABEL_85;
  }
LABEL_84:
  unint64_t v13 = 0;
  if ((*(void *)&has & 0x1000000000) != 0)
  {
LABEL_36:
    unint64_t v14 = 2654435761u * self->_tcpECNIntOnTotalRxPkts;
    if ((*(void *)&has & 0x800000000) != 0) {
      goto LABEL_37;
    }
    goto LABEL_86;
  }
LABEL_85:
  unint64_t v14 = 0;
  if ((*(void *)&has & 0x800000000) != 0)
  {
LABEL_37:
    unint64_t v15 = 2654435761u * self->_tcpECNIntOnTotalOOPkts;
    if ((*(_DWORD *)&has & 0x20000000) != 0) {
      goto LABEL_38;
    }
    goto LABEL_87;
  }
LABEL_86:
  unint64_t v15 = 0;
  if ((*(_DWORD *)&has & 0x20000000) != 0)
  {
LABEL_38:
    unint64_t v16 = 2654435761u * self->_tcpECNIntOnDropRst;
    if ((*(_DWORD *)&has & 0x40000000) != 0) {
      goto LABEL_39;
    }
    goto LABEL_88;
  }
LABEL_87:
  unint64_t v16 = 0;
  if ((*(_DWORD *)&has & 0x40000000) != 0)
  {
LABEL_39:
    unint64_t v17 = 2654435761u * self->_tcpECNIntOnDropRxmt;
    if ((*(_DWORD *)&has & 0x8000000) != 0) {
      goto LABEL_40;
    }
    goto LABEL_89;
  }
LABEL_88:
  unint64_t v17 = 0;
  if ((*(_DWORD *)&has & 0x8000000) != 0)
  {
LABEL_40:
    unint64_t v18 = 2654435761u * self->_tcpECNIntOffTotalTxPkts;
    if ((*(_DWORD *)&has & 0x4000000) != 0) {
      goto LABEL_41;
    }
    goto LABEL_90;
  }
LABEL_89:
  unint64_t v18 = 0;
  if ((*(_DWORD *)&has & 0x4000000) != 0)
  {
LABEL_41:
    unint64_t v19 = 2654435761u * self->_tcpECNIntOffTotalRxmtPkts;
    if ((*(_DWORD *)&has & 0x2000000) != 0) {
      goto LABEL_42;
    }
    goto LABEL_91;
  }
LABEL_90:
  unint64_t v19 = 0;
  if ((*(_DWORD *)&has & 0x2000000) != 0)
  {
LABEL_42:
    unint64_t v20 = 2654435761u * self->_tcpECNIntOffTotalRxPkts;
    if ((*(_DWORD *)&has & 0x1000000) != 0) {
      goto LABEL_43;
    }
    goto LABEL_92;
  }
LABEL_91:
  unint64_t v20 = 0;
  if ((*(_DWORD *)&has & 0x1000000) != 0)
  {
LABEL_43:
    unint64_t v21 = 2654435761u * self->_tcpECNIntOffTotalOOPkts;
    if ((*(_DWORD *)&has & 0x20000) != 0) {
      goto LABEL_44;
    }
    goto LABEL_93;
  }
LABEL_92:
  unint64_t v21 = 0;
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
LABEL_44:
    unint64_t v22 = 2654435761u * self->_tcpECNIntOffDropRst;
    if ((*(_DWORD *)&has & 0x40000) != 0) {
      goto LABEL_45;
    }
    goto LABEL_94;
  }
LABEL_93:
  unint64_t v22 = 0;
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
LABEL_45:
    unint64_t v23 = 2654435761u * self->_tcpECNIntOffDropRxmt;
    if ((*(void *)&has & 0x800000000000) != 0) {
      goto LABEL_46;
    }
    goto LABEL_95;
  }
LABEL_94:
  unint64_t v23 = 0;
  if ((*(void *)&has & 0x800000000000) != 0)
  {
LABEL_46:
    unint64_t v24 = 2654435761u * self->_tcpECNIntTotalConnections;
    if ((*(void *)&has & 0x1000000000000) != 0) {
      goto LABEL_47;
    }
    goto LABEL_96;
  }
LABEL_95:
  unint64_t v24 = 0;
  if ((*(void *)&has & 0x1000000000000) != 0)
  {
LABEL_47:
    unint64_t v25 = 2654435761u * self->_tcpUnsentDataAtSleepCnt;
    if ((*(_WORD *)&has & 0x400) != 0) {
      goto LABEL_48;
    }
    goto LABEL_97;
  }
LABEL_96:
  unint64_t v25 = 0;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
LABEL_48:
    unint64_t v26 = 2654435761u * self->_tcpECNIntFallbackDropRst;
    if ((*(_WORD *)&has & 0x800) != 0) {
      goto LABEL_49;
    }
LABEL_98:
    unint64_t v27 = 0;
    if ((*(_WORD *)&has & 0x2000) != 0) {
      goto LABEL_50;
    }
LABEL_99:
    unint64_t v28 = 0;
    return v51 ^ v52 ^ v50 ^ v49 ^ v48 ^ v47 ^ v46 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26 ^ v27 ^ v28;
  }
LABEL_97:
  unint64_t v26 = 0;
  if ((*(_WORD *)&has & 0x800) == 0) {
    goto LABEL_98;
  }
LABEL_49:
  unint64_t v27 = 2654435761u * self->_tcpECNIntFallbackDropRxmt;
  if ((*(_WORD *)&has & 0x2000) == 0) {
    goto LABEL_99;
  }
LABEL_50:
  unint64_t v28 = 2654435761u * self->_tcpECNIntFallbackSYNRst;
  return v51 ^ v52 ^ v50 ^ v49 ^ v48 ^ v47 ^ v46 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26 ^ v27 ^ v28;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v3 = *((void *)a3 + 50);
  if (v3)
  {
    self->_interfaceType = *((void *)a3 + 1);
    *(void *)&self->_has |= 1uLL;
    uint64_t v3 = *((void *)a3 + 50);
    if ((v3 & 2) == 0)
    {
LABEL_3:
      if ((v3 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_53;
    }
  }
  else if ((v3 & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_ipProtocol = *((void *)a3 + 2);
  *(void *)&self->_has |= 2uLL;
  uint64_t v3 = *((void *)a3 + 50);
  if ((v3 & 4) == 0)
  {
LABEL_4:
    if ((v3 & 0x80000000000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_54;
  }
LABEL_53:
  self->_tcpECNIntClientSetup = *((void *)a3 + 3);
  *(void *)&self->_has |= 4uLL;
  uint64_t v3 = *((void *)a3 + 50);
  if ((v3 & 0x80000000000) == 0)
  {
LABEL_5:
    if ((v3 & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_55;
  }
LABEL_54:
  self->_tcpECNIntServerSetup = *((void *)a3 + 44);
  *(void *)&self->_has |= 0x80000000000uLL;
  uint64_t v3 = *((void *)a3 + 50);
  if ((v3 & 8) == 0)
  {
LABEL_6:
    if ((v3 & 0x100000000000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_56;
  }
LABEL_55:
  self->_tcpECNIntClientSuccess = *((void *)a3 + 4);
  *(void *)&self->_has |= 8uLL;
  uint64_t v3 = *((void *)a3 + 50);
  if ((v3 & 0x100000000000) == 0)
  {
LABEL_7:
    if ((v3 & 0x8000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_57;
  }
LABEL_56:
  self->_tcpECNIntServerSuccess = *((void *)a3 + 45);
  *(void *)&self->_has |= 0x100000000000uLL;
  uint64_t v3 = *((void *)a3 + 50);
  if ((v3 & 0x8000) == 0)
  {
LABEL_8:
    if ((v3 & 0x400000000000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_58;
  }
LABEL_57:
  self->_tcpECNIntNotSupportedPeer = *((void *)a3 + 16);
  *(void *)&self->_has |= 0x8000uLL;
  uint64_t v3 = *((void *)a3 + 50);
  if ((v3 & 0x400000000000) == 0)
  {
LABEL_9:
    if ((v3 & 0x200000000000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_59;
  }
LABEL_58:
  self->_tcpECNIntSynLost = *((void *)a3 + 47);
  *(void *)&self->_has |= 0x400000000000uLL;
  uint64_t v3 = *((void *)a3 + 50);
  if ((v3 & 0x200000000000) == 0)
  {
LABEL_10:
    if ((v3 & 0x8000000000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_60;
  }
LABEL_59:
  self->_tcpECNIntSynAckLost = *((void *)a3 + 46);
  *(void *)&self->_has |= 0x200000000000uLL;
  uint64_t v3 = *((void *)a3 + 50);
  if ((v3 & 0x8000000000) == 0)
  {
LABEL_11:
    if ((v3 & 0x10000000000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_61;
  }
LABEL_60:
  self->_tcpECNIntRecvCE = *((void *)a3 + 40);
  *(void *)&self->_has |= 0x8000000000uLL;
  uint64_t v3 = *((void *)a3 + 50);
  if ((v3 & 0x10000000000) == 0)
  {
LABEL_12:
    if ((v3 & 0x40000000000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_62;
  }
LABEL_61:
  self->_tcpECNIntRecvECE = *((void *)a3 + 41);
  *(void *)&self->_has |= 0x10000000000uLL;
  uint64_t v3 = *((void *)a3 + 50);
  if ((v3 & 0x40000000000) == 0)
  {
LABEL_13:
    if ((v3 & 0x80) == 0) {
      goto LABEL_14;
    }
    goto LABEL_63;
  }
LABEL_62:
  self->_tcpECNIntSentECE = *((void *)a3 + 43);
  *(void *)&self->_has |= 0x40000000000uLL;
  uint64_t v3 = *((void *)a3 + 50);
  if ((v3 & 0x80) == 0)
  {
LABEL_14:
    if ((v3 & 0x100) == 0) {
      goto LABEL_15;
    }
    goto LABEL_64;
  }
LABEL_63:
  self->_tcpECNIntConnRecvCE = *((void *)a3 + 8);
  *(void *)&self->_has |= 0x80uLL;
  uint64_t v3 = *((void *)a3 + 50);
  if ((v3 & 0x100) == 0)
  {
LABEL_15:
    if ((v3 & 0x40) == 0) {
      goto LABEL_16;
    }
    goto LABEL_65;
  }
LABEL_64:
  self->_tcpECNIntConnRecvECE = *((void *)a3 + 9);
  *(void *)&self->_has |= 0x100uLL;
  uint64_t v3 = *((void *)a3 + 50);
  if ((v3 & 0x40) == 0)
  {
LABEL_16:
    if ((v3 & 0x20) == 0) {
      goto LABEL_17;
    }
    goto LABEL_66;
  }
LABEL_65:
  self->_tcpECNIntConnPLNoCE = *((void *)a3 + 7);
  *(void *)&self->_has |= 0x40uLL;
  uint64_t v3 = *((void *)a3 + 50);
  if ((v3 & 0x20) == 0)
  {
LABEL_17:
    if ((v3 & 0x10) == 0) {
      goto LABEL_18;
    }
    goto LABEL_67;
  }
LABEL_66:
  self->_tcpECNIntConnPLCE = *((void *)a3 + 6);
  *(void *)&self->_has |= 0x20uLL;
  uint64_t v3 = *((void *)a3 + 50);
  if ((v3 & 0x10) == 0)
  {
LABEL_18:
    if ((v3 & 0x4000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_68;
  }
LABEL_67:
  self->_tcpECNIntConnNoPLCE = *((void *)a3 + 5);
  *(void *)&self->_has |= 0x10uLL;
  uint64_t v3 = *((void *)a3 + 50);
  if ((v3 & 0x4000) == 0)
  {
LABEL_19:
    if ((v3 & 0x1000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_69;
  }
LABEL_68:
  self->_tcpECNIntFallbackSynLoss = *((void *)a3 + 15);
  *(void *)&self->_has |= 0x4000uLL;
  uint64_t v3 = *((void *)a3 + 50);
  if ((v3 & 0x1000) == 0)
  {
LABEL_20:
    if ((v3 & 0x200) == 0) {
      goto LABEL_21;
    }
    goto LABEL_70;
  }
LABEL_69:
  self->_tcpECNIntFallbackReorder = *((void *)a3 + 13);
  *(void *)&self->_has |= 0x1000uLL;
  uint64_t v3 = *((void *)a3 + 50);
  if ((v3 & 0x200) == 0)
  {
LABEL_21:
    if ((v3 & 0x10000000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_71;
  }
LABEL_70:
  self->_tcpECNIntFallbackCE = *((void *)a3 + 10);
  *(void *)&self->_has |= 0x200uLL;
  uint64_t v3 = *((void *)a3 + 50);
  if ((v3 & 0x10000000) == 0)
  {
LABEL_22:
    if ((v3 & 0x100000000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_72;
  }
LABEL_71:
  self->_tcpECNIntOnAvgRTT = *((void *)a3 + 29);
  *(void *)&self->_has |= 0x10000000uLL;
  uint64_t v3 = *((void *)a3 + 50);
  if ((v3 & 0x100000000) == 0)
  {
LABEL_23:
    if ((v3 & 0x80000000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_73;
  }
LABEL_72:
  self->_tcpECNIntOnRTTVar = *((void *)a3 + 33);
  *(void *)&self->_has |= 0x100000000uLL;
  uint64_t v3 = *((void *)a3 + 50);
  if ((v3 & 0x80000000) == 0)
  {
LABEL_24:
    if ((v3 & 0x400000000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_74;
  }
LABEL_73:
  self->_tcpECNIntOnOOBPer = *((void *)a3 + 32);
  *(void *)&self->_has |= 0x80000000uLL;
  uint64_t v3 = *((void *)a3 + 50);
  if ((v3 & 0x400000000) == 0)
  {
LABEL_25:
    if ((v3 & 0x200000000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_75;
  }
LABEL_74:
  self->_tcpECNIntOnSACKE = *((void *)a3 + 35);
  *(void *)&self->_has |= 0x400000000uLL;
  uint64_t v3 = *((void *)a3 + 50);
  if ((v3 & 0x200000000) == 0)
  {
LABEL_26:
    if ((v3 & 0x20000000000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_76;
  }
LABEL_75:
  self->_tcpECNIntOnReorderPer = *((void *)a3 + 34);
  *(void *)&self->_has |= 0x200000000uLL;
  uint64_t v3 = *((void *)a3 + 50);
  if ((v3 & 0x20000000000) == 0)
  {
LABEL_27:
    if ((v3 & 0x10000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_77;
  }
LABEL_76:
  self->_tcpECNIntRxmtPer = *((void *)a3 + 42);
  *(void *)&self->_has |= 0x20000000000uLL;
  uint64_t v3 = *((void *)a3 + 50);
  if ((v3 & 0x10000) == 0)
  {
LABEL_28:
    if ((v3 & 0x100000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_78;
  }
LABEL_77:
  self->_tcpECNIntOffAvgRTT = *((void *)a3 + 17);
  *(void *)&self->_has |= 0x10000uLL;
  uint64_t v3 = *((void *)a3 + 50);
  if ((v3 & 0x100000) == 0)
  {
LABEL_29:
    if ((v3 & 0x80000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_79;
  }
LABEL_78:
  self->_tcpECNIntOffRTTVar = *((void *)a3 + 21);
  *(void *)&self->_has |= 0x100000uLL;
  uint64_t v3 = *((void *)a3 + 50);
  if ((v3 & 0x80000) == 0)
  {
LABEL_30:
    if ((v3 & 0x800000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_80;
  }
LABEL_79:
  self->_tcpECNIntOffOOBPer = *((void *)a3 + 20);
  *(void *)&self->_has |= 0x80000uLL;
  uint64_t v3 = *((void *)a3 + 50);
  if ((v3 & 0x800000) == 0)
  {
LABEL_31:
    if ((v3 & 0x200000) == 0) {
      goto LABEL_32;
    }
    goto LABEL_81;
  }
LABEL_80:
  self->_tcpECNIntOffSACKE = *((void *)a3 + 24);
  *(void *)&self->_has |= 0x800000uLL;
  uint64_t v3 = *((void *)a3 + 50);
  if ((v3 & 0x200000) == 0)
  {
LABEL_32:
    if ((v3 & 0x400000) == 0) {
      goto LABEL_33;
    }
    goto LABEL_82;
  }
LABEL_81:
  self->_tcpECNIntOffReorderPer = *((void *)a3 + 22);
  *(void *)&self->_has |= 0x200000uLL;
  uint64_t v3 = *((void *)a3 + 50);
  if ((v3 & 0x400000) == 0)
  {
LABEL_33:
    if ((v3 & 0x4000000000) == 0) {
      goto LABEL_34;
    }
    goto LABEL_83;
  }
LABEL_82:
  self->_tcpECNIntOffRxmtPer = *((void *)a3 + 23);
  *(void *)&self->_has |= 0x400000uLL;
  uint64_t v3 = *((void *)a3 + 50);
  if ((v3 & 0x4000000000) == 0)
  {
LABEL_34:
    if ((v3 & 0x2000000000) == 0) {
      goto LABEL_35;
    }
    goto LABEL_84;
  }
LABEL_83:
  self->_tcpECNIntOnTotalTxPkts = *((void *)a3 + 39);
  *(void *)&self->_has |= 0x4000000000uLL;
  uint64_t v3 = *((void *)a3 + 50);
  if ((v3 & 0x2000000000) == 0)
  {
LABEL_35:
    if ((v3 & 0x1000000000) == 0) {
      goto LABEL_36;
    }
    goto LABEL_85;
  }
LABEL_84:
  self->_tcpECNIntOnTotalRxmtPkts = *((void *)a3 + 38);
  *(void *)&self->_has |= 0x2000000000uLL;
  uint64_t v3 = *((void *)a3 + 50);
  if ((v3 & 0x1000000000) == 0)
  {
LABEL_36:
    if ((v3 & 0x800000000) == 0) {
      goto LABEL_37;
    }
    goto LABEL_86;
  }
LABEL_85:
  self->_tcpECNIntOnTotalRxPkts = *((void *)a3 + 37);
  *(void *)&self->_has |= 0x1000000000uLL;
  uint64_t v3 = *((void *)a3 + 50);
  if ((v3 & 0x800000000) == 0)
  {
LABEL_37:
    if ((v3 & 0x20000000) == 0) {
      goto LABEL_38;
    }
    goto LABEL_87;
  }
LABEL_86:
  self->_tcpECNIntOnTotalOOPkts = *((void *)a3 + 36);
  *(void *)&self->_has |= 0x800000000uLL;
  uint64_t v3 = *((void *)a3 + 50);
  if ((v3 & 0x20000000) == 0)
  {
LABEL_38:
    if ((v3 & 0x40000000) == 0) {
      goto LABEL_39;
    }
    goto LABEL_88;
  }
LABEL_87:
  self->_tcpECNIntOnDropRst = *((void *)a3 + 30);
  *(void *)&self->_has |= 0x20000000uLL;
  uint64_t v3 = *((void *)a3 + 50);
  if ((v3 & 0x40000000) == 0)
  {
LABEL_39:
    if ((v3 & 0x8000000) == 0) {
      goto LABEL_40;
    }
    goto LABEL_89;
  }
LABEL_88:
  self->_tcpECNIntOnDropRxmt = *((void *)a3 + 31);
  *(void *)&self->_has |= 0x40000000uLL;
  uint64_t v3 = *((void *)a3 + 50);
  if ((v3 & 0x8000000) == 0)
  {
LABEL_40:
    if ((v3 & 0x4000000) == 0) {
      goto LABEL_41;
    }
    goto LABEL_90;
  }
LABEL_89:
  self->_tcpECNIntOffTotalTxPkts = *((void *)a3 + 28);
  *(void *)&self->_has |= 0x8000000uLL;
  uint64_t v3 = *((void *)a3 + 50);
  if ((v3 & 0x4000000) == 0)
  {
LABEL_41:
    if ((v3 & 0x2000000) == 0) {
      goto LABEL_42;
    }
    goto LABEL_91;
  }
LABEL_90:
  self->_tcpECNIntOffTotalRxmtPkts = *((void *)a3 + 27);
  *(void *)&self->_has |= 0x4000000uLL;
  uint64_t v3 = *((void *)a3 + 50);
  if ((v3 & 0x2000000) == 0)
  {
LABEL_42:
    if ((v3 & 0x1000000) == 0) {
      goto LABEL_43;
    }
    goto LABEL_92;
  }
LABEL_91:
  self->_tcpECNIntOffTotalRxPkts = *((void *)a3 + 26);
  *(void *)&self->_has |= 0x2000000uLL;
  uint64_t v3 = *((void *)a3 + 50);
  if ((v3 & 0x1000000) == 0)
  {
LABEL_43:
    if ((v3 & 0x20000) == 0) {
      goto LABEL_44;
    }
    goto LABEL_93;
  }
LABEL_92:
  self->_tcpECNIntOffTotalOOPkts = *((void *)a3 + 25);
  *(void *)&self->_has |= 0x1000000uLL;
  uint64_t v3 = *((void *)a3 + 50);
  if ((v3 & 0x20000) == 0)
  {
LABEL_44:
    if ((v3 & 0x40000) == 0) {
      goto LABEL_45;
    }
    goto LABEL_94;
  }
LABEL_93:
  self->_tcpECNIntOffDropRst = *((void *)a3 + 18);
  *(void *)&self->_has |= 0x20000uLL;
  uint64_t v3 = *((void *)a3 + 50);
  if ((v3 & 0x40000) == 0)
  {
LABEL_45:
    if ((v3 & 0x800000000000) == 0) {
      goto LABEL_46;
    }
    goto LABEL_95;
  }
LABEL_94:
  self->_tcpECNIntOffDropRxmt = *((void *)a3 + 19);
  *(void *)&self->_has |= 0x40000uLL;
  uint64_t v3 = *((void *)a3 + 50);
  if ((v3 & 0x800000000000) == 0)
  {
LABEL_46:
    if ((v3 & 0x1000000000000) == 0) {
      goto LABEL_47;
    }
    goto LABEL_96;
  }
LABEL_95:
  self->_tcpECNIntTotalConnections = *((void *)a3 + 48);
  *(void *)&self->_has |= 0x800000000000uLL;
  uint64_t v3 = *((void *)a3 + 50);
  if ((v3 & 0x1000000000000) == 0)
  {
LABEL_47:
    if ((v3 & 0x400) == 0) {
      goto LABEL_48;
    }
    goto LABEL_97;
  }
LABEL_96:
  self->_tcpUnsentDataAtSleepCnt = *((void *)a3 + 49);
  *(void *)&self->_has |= 0x1000000000000uLL;
  uint64_t v3 = *((void *)a3 + 50);
  if ((v3 & 0x400) == 0)
  {
LABEL_48:
    if ((v3 & 0x800) == 0) {
      goto LABEL_49;
    }
    goto LABEL_98;
  }
LABEL_97:
  self->_tcpECNIntFallbackDropRst = *((void *)a3 + 11);
  *(void *)&self->_has |= 0x400uLL;
  uint64_t v3 = *((void *)a3 + 50);
  if ((v3 & 0x800) == 0)
  {
LABEL_49:
    if ((v3 & 0x2000) == 0) {
      return;
    }
LABEL_99:
    self->_tcpECNIntFallbackSYNRst = *((void *)a3 + 14);
    *(void *)&self->_has |= 0x2000uLL;
    return;
  }
LABEL_98:
  self->_tcpECNIntFallbackDropRxmt = *((void *)a3 + 12);
  *(void *)&self->_has |= 0x800uLL;
  if ((*((void *)a3 + 50) & 0x2000) != 0) {
    goto LABEL_99;
  }
}

- (unint64_t)interfaceType
{
  return self->_interfaceType;
}

- (unint64_t)ipProtocol
{
  return self->_ipProtocol;
}

- (unint64_t)tcpECNIntClientSetup
{
  return self->_tcpECNIntClientSetup;
}

- (unint64_t)tcpECNIntServerSetup
{
  return self->_tcpECNIntServerSetup;
}

- (unint64_t)tcpECNIntClientSuccess
{
  return self->_tcpECNIntClientSuccess;
}

- (unint64_t)tcpECNIntServerSuccess
{
  return self->_tcpECNIntServerSuccess;
}

- (unint64_t)tcpECNIntNotSupportedPeer
{
  return self->_tcpECNIntNotSupportedPeer;
}

- (unint64_t)tcpECNIntSynLost
{
  return self->_tcpECNIntSynLost;
}

- (unint64_t)tcpECNIntSynAckLost
{
  return self->_tcpECNIntSynAckLost;
}

- (unint64_t)tcpECNIntRecvCE
{
  return self->_tcpECNIntRecvCE;
}

- (unint64_t)tcpECNIntRecvECE
{
  return self->_tcpECNIntRecvECE;
}

- (unint64_t)tcpECNIntSentECE
{
  return self->_tcpECNIntSentECE;
}

- (unint64_t)tcpECNIntConnRecvCE
{
  return self->_tcpECNIntConnRecvCE;
}

- (unint64_t)tcpECNIntConnRecvECE
{
  return self->_tcpECNIntConnRecvECE;
}

- (unint64_t)tcpECNIntConnPLNoCE
{
  return self->_tcpECNIntConnPLNoCE;
}

- (unint64_t)tcpECNIntConnPLCE
{
  return self->_tcpECNIntConnPLCE;
}

- (unint64_t)tcpECNIntConnNoPLCE
{
  return self->_tcpECNIntConnNoPLCE;
}

- (unint64_t)tcpECNIntFallbackSynLoss
{
  return self->_tcpECNIntFallbackSynLoss;
}

- (unint64_t)tcpECNIntFallbackReorder
{
  return self->_tcpECNIntFallbackReorder;
}

- (unint64_t)tcpECNIntFallbackCE
{
  return self->_tcpECNIntFallbackCE;
}

- (unint64_t)tcpECNIntOnAvgRTT
{
  return self->_tcpECNIntOnAvgRTT;
}

- (unint64_t)tcpECNIntOnRTTVar
{
  return self->_tcpECNIntOnRTTVar;
}

- (unint64_t)tcpECNIntOnOOBPer
{
  return self->_tcpECNIntOnOOBPer;
}

- (unint64_t)tcpECNIntOnSACKE
{
  return self->_tcpECNIntOnSACKE;
}

- (unint64_t)tcpECNIntOnReorderPer
{
  return self->_tcpECNIntOnReorderPer;
}

- (unint64_t)tcpECNIntRxmtPer
{
  return self->_tcpECNIntRxmtPer;
}

- (unint64_t)tcpECNIntOffAvgRTT
{
  return self->_tcpECNIntOffAvgRTT;
}

- (unint64_t)tcpECNIntOffRTTVar
{
  return self->_tcpECNIntOffRTTVar;
}

- (unint64_t)tcpECNIntOffOOBPer
{
  return self->_tcpECNIntOffOOBPer;
}

- (unint64_t)tcpECNIntOffSACKE
{
  return self->_tcpECNIntOffSACKE;
}

- (unint64_t)tcpECNIntOffReorderPer
{
  return self->_tcpECNIntOffReorderPer;
}

- (unint64_t)tcpECNIntOffRxmtPer
{
  return self->_tcpECNIntOffRxmtPer;
}

- (unint64_t)tcpECNIntOnTotalTxPkts
{
  return self->_tcpECNIntOnTotalTxPkts;
}

- (unint64_t)tcpECNIntOnTotalRxmtPkts
{
  return self->_tcpECNIntOnTotalRxmtPkts;
}

- (unint64_t)tcpECNIntOnTotalRxPkts
{
  return self->_tcpECNIntOnTotalRxPkts;
}

- (unint64_t)tcpECNIntOnTotalOOPkts
{
  return self->_tcpECNIntOnTotalOOPkts;
}

- (unint64_t)tcpECNIntOnDropRst
{
  return self->_tcpECNIntOnDropRst;
}

- (unint64_t)tcpECNIntOnDropRxmt
{
  return self->_tcpECNIntOnDropRxmt;
}

- (unint64_t)tcpECNIntOffTotalTxPkts
{
  return self->_tcpECNIntOffTotalTxPkts;
}

- (unint64_t)tcpECNIntOffTotalRxmtPkts
{
  return self->_tcpECNIntOffTotalRxmtPkts;
}

- (unint64_t)tcpECNIntOffTotalRxPkts
{
  return self->_tcpECNIntOffTotalRxPkts;
}

- (unint64_t)tcpECNIntOffTotalOOPkts
{
  return self->_tcpECNIntOffTotalOOPkts;
}

- (unint64_t)tcpECNIntOffDropRst
{
  return self->_tcpECNIntOffDropRst;
}

- (unint64_t)tcpECNIntOffDropRxmt
{
  return self->_tcpECNIntOffDropRxmt;
}

- (unint64_t)tcpECNIntTotalConnections
{
  return self->_tcpECNIntTotalConnections;
}

- (unint64_t)tcpUnsentDataAtSleepCnt
{
  return self->_tcpUnsentDataAtSleepCnt;
}

- (unint64_t)tcpECNIntFallbackDropRst
{
  return self->_tcpECNIntFallbackDropRst;
}

- (unint64_t)tcpECNIntFallbackDropRxmt
{
  return self->_tcpECNIntFallbackDropRxmt;
}

- (unint64_t)tcpECNIntFallbackSYNRst
{
  return self->_tcpECNIntFallbackSYNRst;
}

@end