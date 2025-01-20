@interface AWDWiFiNWActivityPeerStats
+ (Class)acCompletionsType;
+ (Class)bytesType;
+ (Class)ccaType;
+ (Class)packetsType;
+ (Class)rssiType;
+ (Class)rxLatencyTID0Type;
+ (Class)rxLatencyTID1Type;
+ (Class)rxLatencyTID2Type;
+ (Class)rxLatencyTID3Type;
+ (Class)rxLatencyTID4Type;
+ (Class)rxLatencyTID5Type;
+ (Class)rxLatencyTID6Type;
+ (Class)rxLatencyTID7Type;
+ (Class)snrType;
+ (Class)txLatencyBEType;
+ (Class)txLatencyBKType;
+ (Class)txLatencyVIType;
+ (Class)txLatencyVOType;
- (AWDWiFiNWActivityTxCompletions)completions;
- (BOOL)hasCcaValue;
- (BOOL)hasCompletions;
- (BOOL)hasHashID;
- (BOOL)hasIbssCCA;
- (BOOL)hasInterferenceCCA;
- (BOOL)hasNfValue;
- (BOOL)hasObssCCA;
- (BOOL)hasOfdmDesense;
- (BOOL)hasQbssCCA;
- (BOOL)hasQbssSTACount;
- (BOOL)hasRole;
- (BOOL)hasRssiValue;
- (BOOL)hasSnrValue;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)acCompletions;
- (NSMutableArray)bytes;
- (NSMutableArray)ccas;
- (NSMutableArray)packets;
- (NSMutableArray)rssis;
- (NSMutableArray)rxLatencyTID0s;
- (NSMutableArray)rxLatencyTID1s;
- (NSMutableArray)rxLatencyTID2s;
- (NSMutableArray)rxLatencyTID3s;
- (NSMutableArray)rxLatencyTID4s;
- (NSMutableArray)rxLatencyTID5s;
- (NSMutableArray)rxLatencyTID6s;
- (NSMutableArray)rxLatencyTID7s;
- (NSMutableArray)snrs;
- (NSMutableArray)txLatencyBEs;
- (NSMutableArray)txLatencyBKs;
- (NSMutableArray)txLatencyVIs;
- (NSMutableArray)txLatencyVOs;
- (NSString)hashID;
- (id)acCompletionsAtIndex:(unint64_t)a3;
- (id)bytesAtIndex:(unint64_t)a3;
- (id)ccaAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)packetsAtIndex:(unint64_t)a3;
- (id)roleAsString:(int)a3;
- (id)rssiAtIndex:(unint64_t)a3;
- (id)rxLatencyTID0AtIndex:(unint64_t)a3;
- (id)rxLatencyTID1AtIndex:(unint64_t)a3;
- (id)rxLatencyTID2AtIndex:(unint64_t)a3;
- (id)rxLatencyTID3AtIndex:(unint64_t)a3;
- (id)rxLatencyTID4AtIndex:(unint64_t)a3;
- (id)rxLatencyTID5AtIndex:(unint64_t)a3;
- (id)rxLatencyTID6AtIndex:(unint64_t)a3;
- (id)rxLatencyTID7AtIndex:(unint64_t)a3;
- (id)snrAtIndex:(unint64_t)a3;
- (id)txLatencyBEAtIndex:(unint64_t)a3;
- (id)txLatencyBKAtIndex:(unint64_t)a3;
- (id)txLatencyVIAtIndex:(unint64_t)a3;
- (id)txLatencyVOAtIndex:(unint64_t)a3;
- (int)StringAsRole:(id)a3;
- (int)nfValue;
- (int)role;
- (int)rssiValue;
- (int)snrValue;
- (unint64_t)acCompletionsCount;
- (unint64_t)bytesCount;
- (unint64_t)ccasCount;
- (unint64_t)hash;
- (unint64_t)packetsCount;
- (unint64_t)rssisCount;
- (unint64_t)rxLatencyTID0sCount;
- (unint64_t)rxLatencyTID1sCount;
- (unint64_t)rxLatencyTID2sCount;
- (unint64_t)rxLatencyTID3sCount;
- (unint64_t)rxLatencyTID4sCount;
- (unint64_t)rxLatencyTID5sCount;
- (unint64_t)rxLatencyTID6sCount;
- (unint64_t)rxLatencyTID7sCount;
- (unint64_t)snrsCount;
- (unint64_t)txLatencyBEsCount;
- (unint64_t)txLatencyBKsCount;
- (unint64_t)txLatencyVIsCount;
- (unint64_t)txLatencyVOsCount;
- (unsigned)ccaValue;
- (unsigned)ibssCCA;
- (unsigned)interferenceCCA;
- (unsigned)obssCCA;
- (unsigned)ofdmDesense;
- (unsigned)qbssCCA;
- (unsigned)qbssSTACount;
- (void)addAcCompletions:(id)a3;
- (void)addBytes:(id)a3;
- (void)addCca:(id)a3;
- (void)addPackets:(id)a3;
- (void)addRssi:(id)a3;
- (void)addRxLatencyTID0:(id)a3;
- (void)addRxLatencyTID1:(id)a3;
- (void)addRxLatencyTID2:(id)a3;
- (void)addRxLatencyTID3:(id)a3;
- (void)addRxLatencyTID4:(id)a3;
- (void)addRxLatencyTID5:(id)a3;
- (void)addRxLatencyTID6:(id)a3;
- (void)addRxLatencyTID7:(id)a3;
- (void)addSnr:(id)a3;
- (void)addTxLatencyBE:(id)a3;
- (void)addTxLatencyBK:(id)a3;
- (void)addTxLatencyVI:(id)a3;
- (void)addTxLatencyVO:(id)a3;
- (void)clearAcCompletions;
- (void)clearBytes;
- (void)clearCcas;
- (void)clearPackets;
- (void)clearRssis;
- (void)clearRxLatencyTID0s;
- (void)clearRxLatencyTID1s;
- (void)clearRxLatencyTID2s;
- (void)clearRxLatencyTID3s;
- (void)clearRxLatencyTID4s;
- (void)clearRxLatencyTID5s;
- (void)clearRxLatencyTID6s;
- (void)clearRxLatencyTID7s;
- (void)clearSnrs;
- (void)clearTxLatencyBEs;
- (void)clearTxLatencyBKs;
- (void)clearTxLatencyVIs;
- (void)clearTxLatencyVOs;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setAcCompletions:(id)a3;
- (void)setBytes:(id)a3;
- (void)setCcaValue:(unsigned int)a3;
- (void)setCcas:(id)a3;
- (void)setCompletions:(id)a3;
- (void)setHasCcaValue:(BOOL)a3;
- (void)setHasIbssCCA:(BOOL)a3;
- (void)setHasInterferenceCCA:(BOOL)a3;
- (void)setHasNfValue:(BOOL)a3;
- (void)setHasObssCCA:(BOOL)a3;
- (void)setHasOfdmDesense:(BOOL)a3;
- (void)setHasQbssCCA:(BOOL)a3;
- (void)setHasQbssSTACount:(BOOL)a3;
- (void)setHasRole:(BOOL)a3;
- (void)setHasRssiValue:(BOOL)a3;
- (void)setHasSnrValue:(BOOL)a3;
- (void)setHashID:(id)a3;
- (void)setIbssCCA:(unsigned int)a3;
- (void)setInterferenceCCA:(unsigned int)a3;
- (void)setNfValue:(int)a3;
- (void)setObssCCA:(unsigned int)a3;
- (void)setOfdmDesense:(unsigned int)a3;
- (void)setPackets:(id)a3;
- (void)setQbssCCA:(unsigned int)a3;
- (void)setQbssSTACount:(unsigned int)a3;
- (void)setRole:(int)a3;
- (void)setRssiValue:(int)a3;
- (void)setRssis:(id)a3;
- (void)setRxLatencyTID0s:(id)a3;
- (void)setRxLatencyTID1s:(id)a3;
- (void)setRxLatencyTID2s:(id)a3;
- (void)setRxLatencyTID3s:(id)a3;
- (void)setRxLatencyTID4s:(id)a3;
- (void)setRxLatencyTID5s:(id)a3;
- (void)setRxLatencyTID6s:(id)a3;
- (void)setRxLatencyTID7s:(id)a3;
- (void)setSnrValue:(int)a3;
- (void)setSnrs:(id)a3;
- (void)setTxLatencyBEs:(id)a3;
- (void)setTxLatencyBKs:(id)a3;
- (void)setTxLatencyVIs:(id)a3;
- (void)setTxLatencyVOs:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDWiFiNWActivityPeerStats

- (void)dealloc
{
  [(AWDWiFiNWActivityPeerStats *)self setHashID:0];
  [(AWDWiFiNWActivityPeerStats *)self setRssis:0];
  [(AWDWiFiNWActivityPeerStats *)self setCcas:0];
  [(AWDWiFiNWActivityPeerStats *)self setSnrs:0];
  [(AWDWiFiNWActivityPeerStats *)self setPackets:0];
  [(AWDWiFiNWActivityPeerStats *)self setBytes:0];
  [(AWDWiFiNWActivityPeerStats *)self setTxLatencyBKs:0];
  [(AWDWiFiNWActivityPeerStats *)self setTxLatencyBEs:0];
  [(AWDWiFiNWActivityPeerStats *)self setTxLatencyVOs:0];
  [(AWDWiFiNWActivityPeerStats *)self setTxLatencyVIs:0];
  [(AWDWiFiNWActivityPeerStats *)self setCompletions:0];
  [(AWDWiFiNWActivityPeerStats *)self setAcCompletions:0];
  [(AWDWiFiNWActivityPeerStats *)self setRxLatencyTID0s:0];
  [(AWDWiFiNWActivityPeerStats *)self setRxLatencyTID1s:0];
  [(AWDWiFiNWActivityPeerStats *)self setRxLatencyTID2s:0];
  [(AWDWiFiNWActivityPeerStats *)self setRxLatencyTID3s:0];
  [(AWDWiFiNWActivityPeerStats *)self setRxLatencyTID4s:0];
  [(AWDWiFiNWActivityPeerStats *)self setRxLatencyTID5s:0];
  [(AWDWiFiNWActivityPeerStats *)self setRxLatencyTID6s:0];
  [(AWDWiFiNWActivityPeerStats *)self setRxLatencyTID7s:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiNWActivityPeerStats;
  [(AWDWiFiNWActivityPeerStats *)&v3 dealloc];
}

- (int)role
{
  if ((*(_WORD *)&self->_has & 0x100) != 0) {
    return self->_role;
  }
  else {
    return 0;
  }
}

- (void)setRole:(int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_role = a3;
}

- (void)setHasRole:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasRole
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (id)roleAsString:(int)a3
{
  if (a3 >= 3) {
    return (id)[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else {
    return off_2641BA340[a3];
  }
}

- (int)StringAsRole:(id)a3
{
  if ([a3 isEqualToString:@"INFRA"]) {
    return 0;
  }
  if ([a3 isEqualToString:@"LEGACYAWDL"]) {
    return 1;
  }
  if ([a3 isEqualToString:@"LLWAWDL"]) {
    return 2;
  }
  return 0;
}

- (BOOL)hasHashID
{
  return self->_hashID != 0;
}

- (void)clearRssis
{
}

- (void)addRssi:(id)a3
{
  rssis = self->_rssis;
  if (!rssis)
  {
    rssis = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_rssis = rssis;
  }

  [(NSMutableArray *)rssis addObject:a3];
}

- (unint64_t)rssisCount
{
  return [(NSMutableArray *)self->_rssis count];
}

- (id)rssiAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_rssis objectAtIndex:a3];
}

+ (Class)rssiType
{
  return (Class)objc_opt_class();
}

- (void)clearCcas
{
}

- (void)addCca:(id)a3
{
  ccas = self->_ccas;
  if (!ccas)
  {
    ccas = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_ccas = ccas;
  }

  [(NSMutableArray *)ccas addObject:a3];
}

- (unint64_t)ccasCount
{
  return [(NSMutableArray *)self->_ccas count];
}

- (id)ccaAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_ccas objectAtIndex:a3];
}

+ (Class)ccaType
{
  return (Class)objc_opt_class();
}

- (void)clearSnrs
{
}

- (void)addSnr:(id)a3
{
  snrs = self->_snrs;
  if (!snrs)
  {
    snrs = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_snrs = snrs;
  }

  [(NSMutableArray *)snrs addObject:a3];
}

- (unint64_t)snrsCount
{
  return [(NSMutableArray *)self->_snrs count];
}

- (id)snrAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_snrs objectAtIndex:a3];
}

+ (Class)snrType
{
  return (Class)objc_opt_class();
}

- (void)clearPackets
{
}

- (void)addPackets:(id)a3
{
  packets = self->_packets;
  if (!packets)
  {
    packets = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_packets = packets;
  }

  [(NSMutableArray *)packets addObject:a3];
}

- (unint64_t)packetsCount
{
  return [(NSMutableArray *)self->_packets count];
}

- (id)packetsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_packets objectAtIndex:a3];
}

+ (Class)packetsType
{
  return (Class)objc_opt_class();
}

- (void)clearBytes
{
}

- (void)addBytes:(id)a3
{
  bytes = self->_bytes;
  if (!bytes)
  {
    bytes = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_bytes = bytes;
  }

  [(NSMutableArray *)bytes addObject:a3];
}

- (unint64_t)bytesCount
{
  return [(NSMutableArray *)self->_bytes count];
}

- (id)bytesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_bytes objectAtIndex:a3];
}

+ (Class)bytesType
{
  return (Class)objc_opt_class();
}

- (void)clearTxLatencyBKs
{
}

- (void)addTxLatencyBK:(id)a3
{
  txLatencyBKs = self->_txLatencyBKs;
  if (!txLatencyBKs)
  {
    txLatencyBKs = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_txLatencyBKs = txLatencyBKs;
  }

  [(NSMutableArray *)txLatencyBKs addObject:a3];
}

- (unint64_t)txLatencyBKsCount
{
  return [(NSMutableArray *)self->_txLatencyBKs count];
}

- (id)txLatencyBKAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_txLatencyBKs objectAtIndex:a3];
}

+ (Class)txLatencyBKType
{
  return (Class)objc_opt_class();
}

- (void)clearTxLatencyBEs
{
}

- (void)addTxLatencyBE:(id)a3
{
  txLatencyBEs = self->_txLatencyBEs;
  if (!txLatencyBEs)
  {
    txLatencyBEs = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_txLatencyBEs = txLatencyBEs;
  }

  [(NSMutableArray *)txLatencyBEs addObject:a3];
}

- (unint64_t)txLatencyBEsCount
{
  return [(NSMutableArray *)self->_txLatencyBEs count];
}

- (id)txLatencyBEAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_txLatencyBEs objectAtIndex:a3];
}

+ (Class)txLatencyBEType
{
  return (Class)objc_opt_class();
}

- (void)clearTxLatencyVOs
{
}

- (void)addTxLatencyVO:(id)a3
{
  txLatencyVOs = self->_txLatencyVOs;
  if (!txLatencyVOs)
  {
    txLatencyVOs = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_txLatencyVOs = txLatencyVOs;
  }

  [(NSMutableArray *)txLatencyVOs addObject:a3];
}

- (unint64_t)txLatencyVOsCount
{
  return [(NSMutableArray *)self->_txLatencyVOs count];
}

- (id)txLatencyVOAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_txLatencyVOs objectAtIndex:a3];
}

+ (Class)txLatencyVOType
{
  return (Class)objc_opt_class();
}

- (void)clearTxLatencyVIs
{
}

- (void)addTxLatencyVI:(id)a3
{
  txLatencyVIs = self->_txLatencyVIs;
  if (!txLatencyVIs)
  {
    txLatencyVIs = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_txLatencyVIs = txLatencyVIs;
  }

  [(NSMutableArray *)txLatencyVIs addObject:a3];
}

- (unint64_t)txLatencyVIsCount
{
  return [(NSMutableArray *)self->_txLatencyVIs count];
}

- (id)txLatencyVIAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_txLatencyVIs objectAtIndex:a3];
}

+ (Class)txLatencyVIType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasCompletions
{
  return self->_completions != 0;
}

- (void)clearAcCompletions
{
}

- (void)addAcCompletions:(id)a3
{
  acCompletions = self->_acCompletions;
  if (!acCompletions)
  {
    acCompletions = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_acCompletions = acCompletions;
  }

  [(NSMutableArray *)acCompletions addObject:a3];
}

- (unint64_t)acCompletionsCount
{
  return [(NSMutableArray *)self->_acCompletions count];
}

- (id)acCompletionsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_acCompletions objectAtIndex:a3];
}

+ (Class)acCompletionsType
{
  return (Class)objc_opt_class();
}

- (void)setRssiValue:(int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_rssiValue = a3;
}

- (void)setHasRssiValue:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasRssiValue
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setSnrValue:(int)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_snrValue = a3;
}

- (void)setHasSnrValue:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasSnrValue
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setCcaValue:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_ccaValue = a3;
}

- (void)setHasCcaValue:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasCcaValue
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setNfValue:(int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_nfValue = a3;
}

- (void)setHasNfValue:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasNfValue
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setOfdmDesense:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_ofdmDesense = a3;
}

- (void)setHasOfdmDesense:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasOfdmDesense
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setIbssCCA:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_ibssCCA = a3;
}

- (void)setHasIbssCCA:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasIbssCCA
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setObssCCA:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_obssCCA = a3;
}

- (void)setHasObssCCA:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasObssCCA
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setInterferenceCCA:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_interferenceCCA = a3;
}

- (void)setHasInterferenceCCA:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasInterferenceCCA
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setQbssCCA:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_qbssCCA = a3;
}

- (void)setHasQbssCCA:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasQbssCCA
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setQbssSTACount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_qbssSTACount = a3;
}

- (void)setHasQbssSTACount:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasQbssSTACount
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)clearRxLatencyTID0s
{
}

- (void)addRxLatencyTID0:(id)a3
{
  rxLatencyTID0s = self->_rxLatencyTID0s;
  if (!rxLatencyTID0s)
  {
    rxLatencyTID0s = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_rxLatencyTID0s = rxLatencyTID0s;
  }

  [(NSMutableArray *)rxLatencyTID0s addObject:a3];
}

- (unint64_t)rxLatencyTID0sCount
{
  return [(NSMutableArray *)self->_rxLatencyTID0s count];
}

- (id)rxLatencyTID0AtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_rxLatencyTID0s objectAtIndex:a3];
}

+ (Class)rxLatencyTID0Type
{
  return (Class)objc_opt_class();
}

- (void)clearRxLatencyTID1s
{
}

- (void)addRxLatencyTID1:(id)a3
{
  rxLatencyTID1s = self->_rxLatencyTID1s;
  if (!rxLatencyTID1s)
  {
    rxLatencyTID1s = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_rxLatencyTID1s = rxLatencyTID1s;
  }

  [(NSMutableArray *)rxLatencyTID1s addObject:a3];
}

- (unint64_t)rxLatencyTID1sCount
{
  return [(NSMutableArray *)self->_rxLatencyTID1s count];
}

- (id)rxLatencyTID1AtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_rxLatencyTID1s objectAtIndex:a3];
}

+ (Class)rxLatencyTID1Type
{
  return (Class)objc_opt_class();
}

- (void)clearRxLatencyTID2s
{
}

- (void)addRxLatencyTID2:(id)a3
{
  rxLatencyTID2s = self->_rxLatencyTID2s;
  if (!rxLatencyTID2s)
  {
    rxLatencyTID2s = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_rxLatencyTID2s = rxLatencyTID2s;
  }

  [(NSMutableArray *)rxLatencyTID2s addObject:a3];
}

- (unint64_t)rxLatencyTID2sCount
{
  return [(NSMutableArray *)self->_rxLatencyTID2s count];
}

- (id)rxLatencyTID2AtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_rxLatencyTID2s objectAtIndex:a3];
}

+ (Class)rxLatencyTID2Type
{
  return (Class)objc_opt_class();
}

- (void)clearRxLatencyTID3s
{
}

- (void)addRxLatencyTID3:(id)a3
{
  rxLatencyTID3s = self->_rxLatencyTID3s;
  if (!rxLatencyTID3s)
  {
    rxLatencyTID3s = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_rxLatencyTID3s = rxLatencyTID3s;
  }

  [(NSMutableArray *)rxLatencyTID3s addObject:a3];
}

- (unint64_t)rxLatencyTID3sCount
{
  return [(NSMutableArray *)self->_rxLatencyTID3s count];
}

- (id)rxLatencyTID3AtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_rxLatencyTID3s objectAtIndex:a3];
}

+ (Class)rxLatencyTID3Type
{
  return (Class)objc_opt_class();
}

- (void)clearRxLatencyTID4s
{
}

- (void)addRxLatencyTID4:(id)a3
{
  rxLatencyTID4s = self->_rxLatencyTID4s;
  if (!rxLatencyTID4s)
  {
    rxLatencyTID4s = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_rxLatencyTID4s = rxLatencyTID4s;
  }

  [(NSMutableArray *)rxLatencyTID4s addObject:a3];
}

- (unint64_t)rxLatencyTID4sCount
{
  return [(NSMutableArray *)self->_rxLatencyTID4s count];
}

- (id)rxLatencyTID4AtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_rxLatencyTID4s objectAtIndex:a3];
}

+ (Class)rxLatencyTID4Type
{
  return (Class)objc_opt_class();
}

- (void)clearRxLatencyTID5s
{
}

- (void)addRxLatencyTID5:(id)a3
{
  rxLatencyTID5s = self->_rxLatencyTID5s;
  if (!rxLatencyTID5s)
  {
    rxLatencyTID5s = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_rxLatencyTID5s = rxLatencyTID5s;
  }

  [(NSMutableArray *)rxLatencyTID5s addObject:a3];
}

- (unint64_t)rxLatencyTID5sCount
{
  return [(NSMutableArray *)self->_rxLatencyTID5s count];
}

- (id)rxLatencyTID5AtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_rxLatencyTID5s objectAtIndex:a3];
}

+ (Class)rxLatencyTID5Type
{
  return (Class)objc_opt_class();
}

- (void)clearRxLatencyTID6s
{
}

- (void)addRxLatencyTID6:(id)a3
{
  rxLatencyTID6s = self->_rxLatencyTID6s;
  if (!rxLatencyTID6s)
  {
    rxLatencyTID6s = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_rxLatencyTID6s = rxLatencyTID6s;
  }

  [(NSMutableArray *)rxLatencyTID6s addObject:a3];
}

- (unint64_t)rxLatencyTID6sCount
{
  return [(NSMutableArray *)self->_rxLatencyTID6s count];
}

- (id)rxLatencyTID6AtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_rxLatencyTID6s objectAtIndex:a3];
}

+ (Class)rxLatencyTID6Type
{
  return (Class)objc_opt_class();
}

- (void)clearRxLatencyTID7s
{
}

- (void)addRxLatencyTID7:(id)a3
{
  rxLatencyTID7s = self->_rxLatencyTID7s;
  if (!rxLatencyTID7s)
  {
    rxLatencyTID7s = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_rxLatencyTID7s = rxLatencyTID7s;
  }

  [(NSMutableArray *)rxLatencyTID7s addObject:a3];
}

- (unint64_t)rxLatencyTID7sCount
{
  return [(NSMutableArray *)self->_rxLatencyTID7s count];
}

- (id)rxLatencyTID7AtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_rxLatencyTID7s objectAtIndex:a3];
}

+ (Class)rxLatencyTID7Type
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiNWActivityPeerStats;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDWiFiNWActivityPeerStats description](&v3, sel_description), -[AWDWiFiNWActivityPeerStats dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  uint64_t v208 = *MEMORY[0x263EF8340];
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    uint64_t role = self->_role;
    if (role >= 3) {
      v5 = (__CFString *)[NSString stringWithFormat:@"(unknown: %i)", self->_role];
    }
    else {
      v5 = off_2641BA340[role];
    }
    [v3 setObject:v5 forKey:@"role"];
  }
  hashID = self->_hashID;
  if (hashID) {
    [v3 setObject:hashID forKey:@"hashID"];
  }
  if ([(NSMutableArray *)self->_rssis count])
  {
    v7 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:-[NSMutableArray count](self->_rssis, "count")];
    long long v186 = 0u;
    long long v187 = 0u;
    long long v188 = 0u;
    long long v189 = 0u;
    rssis = self->_rssis;
    uint64_t v9 = [(NSMutableArray *)rssis countByEnumeratingWithState:&v186 objects:v207 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v187;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v187 != v11) {
            objc_enumerationMutation(rssis);
          }
          [v7 addObject:[*(id *)(*((void *)&v186 + 1) + 8 * i) dictionaryRepresentation]];
        }
        uint64_t v10 = [(NSMutableArray *)rssis countByEnumeratingWithState:&v186 objects:v207 count:16];
      }
      while (v10);
    }
    [v3 setObject:v7 forKey:@"rssi"];
  }
  if ([(NSMutableArray *)self->_ccas count])
  {
    v13 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:-[NSMutableArray count](self->_ccas, "count")];
    long long v182 = 0u;
    long long v183 = 0u;
    long long v184 = 0u;
    long long v185 = 0u;
    ccas = self->_ccas;
    uint64_t v15 = [(NSMutableArray *)ccas countByEnumeratingWithState:&v182 objects:v206 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v183;
      do
      {
        for (uint64_t j = 0; j != v16; ++j)
        {
          if (*(void *)v183 != v17) {
            objc_enumerationMutation(ccas);
          }
          [v13 addObject:[*(id *)(*((void *)&v182 + 1) + 8 * j) dictionaryRepresentation]];
        }
        uint64_t v16 = [(NSMutableArray *)ccas countByEnumeratingWithState:&v182 objects:v206 count:16];
      }
      while (v16);
    }
    [v3 setObject:v13 forKey:@"cca"];
  }
  if ([(NSMutableArray *)self->_snrs count])
  {
    v19 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:-[NSMutableArray count](self->_snrs, "count")];
    long long v178 = 0u;
    long long v179 = 0u;
    long long v180 = 0u;
    long long v181 = 0u;
    snrs = self->_snrs;
    uint64_t v21 = [(NSMutableArray *)snrs countByEnumeratingWithState:&v178 objects:v205 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v179;
      do
      {
        for (uint64_t k = 0; k != v22; ++k)
        {
          if (*(void *)v179 != v23) {
            objc_enumerationMutation(snrs);
          }
          [v19 addObject:[*(id *)(*((void *)&v178 + 1) + 8 * k) dictionaryRepresentation]];
        }
        uint64_t v22 = [(NSMutableArray *)snrs countByEnumeratingWithState:&v178 objects:v205 count:16];
      }
      while (v22);
    }
    [v3 setObject:v19 forKey:@"snr"];
  }
  if ([(NSMutableArray *)self->_packets count])
  {
    v25 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:-[NSMutableArray count](self->_packets, "count")];
    long long v174 = 0u;
    long long v175 = 0u;
    long long v176 = 0u;
    long long v177 = 0u;
    packets = self->_packets;
    uint64_t v27 = [(NSMutableArray *)packets countByEnumeratingWithState:&v174 objects:v204 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v175;
      do
      {
        for (uint64_t m = 0; m != v28; ++m)
        {
          if (*(void *)v175 != v29) {
            objc_enumerationMutation(packets);
          }
          [v25 addObject:[*(id *)(*((void *)&v174 + 1) + 8 * m) dictionaryRepresentation]];
        }
        uint64_t v28 = [(NSMutableArray *)packets countByEnumeratingWithState:&v174 objects:v204 count:16];
      }
      while (v28);
    }
    [v3 setObject:v25 forKey:@"packets"];
  }
  if ([(NSMutableArray *)self->_bytes count])
  {
    v31 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:-[NSMutableArray count](self->_bytes, "count")];
    long long v170 = 0u;
    long long v171 = 0u;
    long long v172 = 0u;
    long long v173 = 0u;
    bytes = self->_bytes;
    uint64_t v33 = [(NSMutableArray *)bytes countByEnumeratingWithState:&v170 objects:v203 count:16];
    if (v33)
    {
      uint64_t v34 = v33;
      uint64_t v35 = *(void *)v171;
      do
      {
        for (uint64_t n = 0; n != v34; ++n)
        {
          if (*(void *)v171 != v35) {
            objc_enumerationMutation(bytes);
          }
          [v31 addObject:[*(id *)(*((void *)&v170 + 1) + 8 * n) dictionaryRepresentation]];
        }
        uint64_t v34 = [(NSMutableArray *)bytes countByEnumeratingWithState:&v170 objects:v203 count:16];
      }
      while (v34);
    }
    [v3 setObject:v31 forKey:@"bytes"];
  }
  if ([(NSMutableArray *)self->_txLatencyBKs count])
  {
    v37 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:-[NSMutableArray count](self->_txLatencyBKs, "count")];
    long long v166 = 0u;
    long long v167 = 0u;
    long long v168 = 0u;
    long long v169 = 0u;
    txLatencyBKs = self->_txLatencyBKs;
    uint64_t v39 = [(NSMutableArray *)txLatencyBKs countByEnumeratingWithState:&v166 objects:v202 count:16];
    if (v39)
    {
      uint64_t v40 = v39;
      uint64_t v41 = *(void *)v167;
      do
      {
        for (iuint64_t i = 0; ii != v40; ++ii)
        {
          if (*(void *)v167 != v41) {
            objc_enumerationMutation(txLatencyBKs);
          }
          [v37 addObject:[*(id *)(*((void *)&v166 + 1) + 8 * ii) dictionaryRepresentation]];
        }
        uint64_t v40 = [(NSMutableArray *)txLatencyBKs countByEnumeratingWithState:&v166 objects:v202 count:16];
      }
      while (v40);
    }
    [v3 setObject:v37 forKey:@"txLatencyBK"];
  }
  if ([(NSMutableArray *)self->_txLatencyBEs count])
  {
    v43 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:-[NSMutableArray count](self->_txLatencyBEs, "count")];
    long long v162 = 0u;
    long long v163 = 0u;
    long long v164 = 0u;
    long long v165 = 0u;
    txLatencyBEs = self->_txLatencyBEs;
    uint64_t v45 = [(NSMutableArray *)txLatencyBEs countByEnumeratingWithState:&v162 objects:v201 count:16];
    if (v45)
    {
      uint64_t v46 = v45;
      uint64_t v47 = *(void *)v163;
      do
      {
        for (juint64_t j = 0; jj != v46; ++jj)
        {
          if (*(void *)v163 != v47) {
            objc_enumerationMutation(txLatencyBEs);
          }
          [v43 addObject:[(*(id *)(*((void *)&v162 + 1) + 8 * jj)) dictionaryRepresentation]];
        }
        uint64_t v46 = [(NSMutableArray *)txLatencyBEs countByEnumeratingWithState:&v162 objects:v201 count:16];
      }
      while (v46);
    }
    [v3 setObject:v43 forKey:@"txLatencyBE"];
  }
  if ([(NSMutableArray *)self->_txLatencyVOs count])
  {
    v49 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:-[NSMutableArray count](self->_txLatencyVOs, "count")];
    long long v158 = 0u;
    long long v159 = 0u;
    long long v160 = 0u;
    long long v161 = 0u;
    txLatencyVOs = self->_txLatencyVOs;
    uint64_t v51 = [(NSMutableArray *)txLatencyVOs countByEnumeratingWithState:&v158 objects:v200 count:16];
    if (v51)
    {
      uint64_t v52 = v51;
      uint64_t v53 = *(void *)v159;
      do
      {
        for (kuint64_t k = 0; kk != v52; ++kk)
        {
          if (*(void *)v159 != v53) {
            objc_enumerationMutation(txLatencyVOs);
          }
          [v49 addObject:[*(id *)(*((void *)&v158 + 1) + 8 * kk) dictionaryRepresentation]];
        }
        uint64_t v52 = [(NSMutableArray *)txLatencyVOs countByEnumeratingWithState:&v158 objects:v200 count:16];
      }
      while (v52);
    }
    [v3 setObject:v49 forKey:@"txLatencyVO"];
  }
  if ([(NSMutableArray *)self->_txLatencyVIs count])
  {
    v55 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:-[NSMutableArray count](self->_txLatencyVIs, "count")];
    long long v154 = 0u;
    long long v155 = 0u;
    long long v156 = 0u;
    long long v157 = 0u;
    txLatencyVIs = self->_txLatencyVIs;
    uint64_t v57 = [(NSMutableArray *)txLatencyVIs countByEnumeratingWithState:&v154 objects:v199 count:16];
    if (v57)
    {
      uint64_t v58 = v57;
      uint64_t v59 = *(void *)v155;
      do
      {
        for (muint64_t m = 0; mm != v58; ++mm)
        {
          if (*(void *)v155 != v59) {
            objc_enumerationMutation(txLatencyVIs);
          }
          [v55 addObject:[(*(id *)(*((void *)&v154 + 1) + 8 * mm)) dictionaryRepresentation]];
        }
        uint64_t v58 = [(NSMutableArray *)txLatencyVIs countByEnumeratingWithState:&v154 objects:v199 count:16];
      }
      while (v58);
    }
    [v3 setObject:v55 forKey:@"txLatencyVI"];
  }
  completions = self->_completions;
  if (completions) {
    [v3 setObject:[[-[AWDWiFiNWActivityTxCompletions dictionaryRepresentation](completions, "dictionaryRepresentation") dictionaryRepresentation] forKey:@"completions"];
  }
  if ([(NSMutableArray *)self->_acCompletions count])
  {
    v62 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:-[NSMutableArray count](self->_acCompletions, "count")];
    long long v150 = 0u;
    long long v151 = 0u;
    long long v152 = 0u;
    long long v153 = 0u;
    acCompletions = self->_acCompletions;
    uint64_t v64 = [(NSMutableArray *)acCompletions countByEnumeratingWithState:&v150 objects:v198 count:16];
    if (v64)
    {
      uint64_t v65 = v64;
      uint64_t v66 = *(void *)v151;
      do
      {
        for (nuint64_t n = 0; nn != v65; ++nn)
        {
          if (*(void *)v151 != v66) {
            objc_enumerationMutation(acCompletions);
          }
          [v62 addObject:[*(id *)(*((void *)&v150 + 1) + 8 * nn) dictionaryRepresentation]];
        }
        uint64_t v65 = [(NSMutableArray *)acCompletions countByEnumeratingWithState:&v150 objects:v198 count:16];
      }
      while (v65);
    }
    [v3 setObject:v62 forKey:@"acCompletions"];
  }
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) != 0)
  {
    [v3 setObject:[NSNumber numberWithInt:self->_rssiValue] forKey:@"rssiValue"];
    __int16 has = (__int16)self->_has;
    if ((has & 0x400) == 0)
    {
LABEL_102:
      if ((has & 1) == 0) {
        goto LABEL_103;
      }
      goto LABEL_186;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x400) == 0)
  {
    goto LABEL_102;
  }
  [v3 setObject:[NSNumber numberWithInt:self->_snrValue] forKey:@"snrValue"];
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_103:
    if ((has & 8) == 0) {
      goto LABEL_104;
    }
    goto LABEL_187;
  }
LABEL_186:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_ccaValue] forKey:@"ccaValue"];
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_104:
    if ((has & 0x20) == 0) {
      goto LABEL_105;
    }
    goto LABEL_188;
  }
LABEL_187:
  [v3 setObject:[NSNumber numberWithInt:self->_nfValue] forKey:@"nfValue"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_105:
    if ((has & 2) == 0) {
      goto LABEL_106;
    }
    goto LABEL_189;
  }
LABEL_188:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_ofdmDesense] forKey:@"ofdmDesense"];
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_106:
    if ((has & 0x10) == 0) {
      goto LABEL_107;
    }
    goto LABEL_190;
  }
LABEL_189:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_ibssCCA] forKey:@"ibssCCA"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_107:
    if ((has & 4) == 0) {
      goto LABEL_108;
    }
    goto LABEL_191;
  }
LABEL_190:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_obssCCA] forKey:@"obssCCA"];
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_108:
    if ((has & 0x40) == 0) {
      goto LABEL_109;
    }
    goto LABEL_192;
  }
LABEL_191:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_interferenceCCA] forKey:@"interferenceCCA"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_109:
    if ((has & 0x80) == 0) {
      goto LABEL_111;
    }
    goto LABEL_110;
  }
LABEL_192:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_qbssCCA] forKey:@"qbssCCA"];
  if ((*(_WORD *)&self->_has & 0x80) != 0) {
LABEL_110:
  }
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_qbssSTACount] forKey:@"qbssSTACount"];
LABEL_111:
  if ([(NSMutableArray *)self->_rxLatencyTID0s count])
  {
    v69 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:-[NSMutableArray count](self->_rxLatencyTID0s, "count")];
    long long v146 = 0u;
    long long v147 = 0u;
    long long v148 = 0u;
    long long v149 = 0u;
    rxLatencyTID0s = self->_rxLatencyTID0s;
    uint64_t v71 = [(NSMutableArray *)rxLatencyTID0s countByEnumeratingWithState:&v146 objects:v197 count:16];
    if (v71)
    {
      uint64_t v72 = v71;
      uint64_t v73 = *(void *)v147;
      do
      {
        for (uint64_t i1 = 0; i1 != v72; ++i1)
        {
          if (*(void *)v147 != v73) {
            objc_enumerationMutation(rxLatencyTID0s);
          }
          [v69 addObject:[*(id *)(*((void *)&v146 + 1) + 8 * i1) dictionaryRepresentation]];
        }
        uint64_t v72 = [(NSMutableArray *)rxLatencyTID0s countByEnumeratingWithState:&v146 objects:v197 count:16];
      }
      while (v72);
    }
    [v3 setObject:v69 forKey:@"rxLatencyTID0"];
  }
  if ([(NSMutableArray *)self->_rxLatencyTID1s count])
  {
    v75 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:-[NSMutableArray count](self->_rxLatencyTID1s, "count")];
    long long v142 = 0u;
    long long v143 = 0u;
    long long v144 = 0u;
    long long v145 = 0u;
    rxLatencyTID1s = self->_rxLatencyTID1s;
    uint64_t v77 = [(NSMutableArray *)rxLatencyTID1s countByEnumeratingWithState:&v142 objects:v196 count:16];
    if (v77)
    {
      uint64_t v78 = v77;
      uint64_t v79 = *(void *)v143;
      do
      {
        for (uint64_t i2 = 0; i2 != v78; ++i2)
        {
          if (*(void *)v143 != v79) {
            objc_enumerationMutation(rxLatencyTID1s);
          }
          [v75 addObject:[*(id *)(*((void *)&v142 + 1) + 8 * i2) dictionaryRepresentation]];
        }
        uint64_t v78 = [(NSMutableArray *)rxLatencyTID1s countByEnumeratingWithState:&v142 objects:v196 count:16];
      }
      while (v78);
    }
    [v3 setObject:v75 forKey:@"rxLatencyTID1"];
  }
  if ([(NSMutableArray *)self->_rxLatencyTID2s count])
  {
    v81 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:-[NSMutableArray count](self->_rxLatencyTID2s, "count")];
    long long v138 = 0u;
    long long v139 = 0u;
    long long v140 = 0u;
    long long v141 = 0u;
    rxLatencyTID2s = self->_rxLatencyTID2s;
    uint64_t v83 = [(NSMutableArray *)rxLatencyTID2s countByEnumeratingWithState:&v138 objects:v195 count:16];
    if (v83)
    {
      uint64_t v84 = v83;
      uint64_t v85 = *(void *)v139;
      do
      {
        for (uint64_t i3 = 0; i3 != v84; ++i3)
        {
          if (*(void *)v139 != v85) {
            objc_enumerationMutation(rxLatencyTID2s);
          }
          [v81 addObject:[v138 dictionaryRepresentation]];
        }
        uint64_t v84 = [(NSMutableArray *)rxLatencyTID2s countByEnumeratingWithState:&v138 objects:v195 count:16];
      }
      while (v84);
    }
    [v3 setObject:v81 forKey:@"rxLatencyTID2"];
  }
  if ([(NSMutableArray *)self->_rxLatencyTID3s count])
  {
    v87 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:-[NSMutableArray count](self->_rxLatencyTID3s, "count")];
    long long v134 = 0u;
    long long v135 = 0u;
    long long v136 = 0u;
    long long v137 = 0u;
    rxLatencyTID3s = self->_rxLatencyTID3s;
    uint64_t v89 = [(NSMutableArray *)rxLatencyTID3s countByEnumeratingWithState:&v134 objects:v194 count:16];
    if (v89)
    {
      uint64_t v90 = v89;
      uint64_t v91 = *(void *)v135;
      do
      {
        for (uint64_t i4 = 0; i4 != v90; ++i4)
        {
          if (*(void *)v135 != v91) {
            objc_enumerationMutation(rxLatencyTID3s);
          }
          [v87 addObject:[v134[i4] dictionaryRepresentation]];
        }
        uint64_t v90 = [(NSMutableArray *)rxLatencyTID3s countByEnumeratingWithState:&v134 objects:v194 count:16];
      }
      while (v90);
    }
    [v3 setObject:v87 forKey:@"rxLatencyTID3"];
  }
  if ([(NSMutableArray *)self->_rxLatencyTID4s count])
  {
    v93 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:-[NSMutableArray count](self->_rxLatencyTID4s, "count")];
    long long v130 = 0u;
    long long v131 = 0u;
    long long v132 = 0u;
    long long v133 = 0u;
    rxLatencyTID4s = self->_rxLatencyTID4s;
    uint64_t v95 = [(NSMutableArray *)rxLatencyTID4s countByEnumeratingWithState:&v130 objects:v193 count:16];
    if (v95)
    {
      uint64_t v96 = v95;
      uint64_t v97 = *(void *)v131;
      do
      {
        for (uint64_t i5 = 0; i5 != v96; ++i5)
        {
          if (*(void *)v131 != v97) {
            objc_enumerationMutation(rxLatencyTID4s);
          }
          [v93 addObject:[(*(id *)(*((void *)&v130 + 1) + 8 * i5)) dictionaryRepresentation]];
        }
        uint64_t v96 = [(NSMutableArray *)rxLatencyTID4s countByEnumeratingWithState:&v130 objects:v193 count:16];
      }
      while (v96);
    }
    [v3 setObject:v93 forKey:@"rxLatencyTID4"];
  }
  if ([(NSMutableArray *)self->_rxLatencyTID5s count])
  {
    v99 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:-[NSMutableArray count](self->_rxLatencyTID5s, "count")];
    long long v126 = 0u;
    long long v127 = 0u;
    long long v128 = 0u;
    long long v129 = 0u;
    rxLatencyTID5s = self->_rxLatencyTID5s;
    uint64_t v101 = [(NSMutableArray *)rxLatencyTID5s countByEnumeratingWithState:&v126 objects:v192 count:16];
    if (v101)
    {
      uint64_t v102 = v101;
      uint64_t v103 = *(void *)v127;
      do
      {
        for (uint64_t i6 = 0; i6 != v102; ++i6)
        {
          if (*(void *)v127 != v103) {
            objc_enumerationMutation(rxLatencyTID5s);
          }
          [v99 addObject:[*(id *)(*((void *)&v126 + 1) + 8 * i6) dictionaryRepresentation]];
        }
        uint64_t v102 = [(NSMutableArray *)rxLatencyTID5s countByEnumeratingWithState:&v126 objects:v192 count:16];
      }
      while (v102);
    }
    [v3 setObject:v99 forKey:@"rxLatencyTID5"];
  }
  if ([(NSMutableArray *)self->_rxLatencyTID6s count])
  {
    v105 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:-[NSMutableArray count](self->_rxLatencyTID6s, "count")];
    long long v122 = 0u;
    long long v123 = 0u;
    long long v124 = 0u;
    long long v125 = 0u;
    rxLatencyTID6s = self->_rxLatencyTID6s;
    uint64_t v107 = [(NSMutableArray *)rxLatencyTID6s countByEnumeratingWithState:&v122 objects:v191 count:16];
    if (v107)
    {
      uint64_t v108 = v107;
      uint64_t v109 = *(void *)v123;
      do
      {
        for (uint64_t i7 = 0; i7 != v108; ++i7)
        {
          if (*(void *)v123 != v109) {
            objc_enumerationMutation(rxLatencyTID6s);
          }
          [v105 addObject:[v122[i7] dictionaryRepresentation]];
        }
        uint64_t v108 = [(NSMutableArray *)rxLatencyTID6s countByEnumeratingWithState:&v122 objects:v191 count:16];
      }
      while (v108);
    }
    [v3 setObject:v105 forKey:@"rxLatencyTID6"];
  }
  if ([(NSMutableArray *)self->_rxLatencyTID7s count])
  {
    v111 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:-[NSMutableArray count](self->_rxLatencyTID7s, "count")];
    long long v118 = 0u;
    long long v119 = 0u;
    long long v120 = 0u;
    long long v121 = 0u;
    rxLatencyTID7s = self->_rxLatencyTID7s;
    uint64_t v113 = [(NSMutableArray *)rxLatencyTID7s countByEnumeratingWithState:&v118 objects:v190 count:16];
    if (v113)
    {
      uint64_t v114 = v113;
      uint64_t v115 = *(void *)v119;
      do
      {
        for (uint64_t i8 = 0; i8 != v114; ++i8)
        {
          if (*(void *)v119 != v115) {
            objc_enumerationMutation(rxLatencyTID7s);
          }
          [v111 addObject:[*(id *)(*((void *)&v118 + 1) + 8 * i8) dictionaryRepresentation]];
        }
        uint64_t v114 = [(NSMutableArray *)rxLatencyTID7s countByEnumeratingWithState:&v118 objects:v190 count:16];
      }
      while (v114);
    }
    [v3 setObject:v111 forKey:@"rxLatencyTID7"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWiFiNWActivityPeerStatsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v185 = *MEMORY[0x263EF8340];
  if ((*(_WORD *)&self->_has & 0x100) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_hashID) {
    PBDataWriterWriteStringField();
  }
  long long v166 = 0u;
  long long v165 = 0u;
  long long v164 = 0u;
  long long v163 = 0u;
  rssis = self->_rssis;
  uint64_t v5 = [(NSMutableArray *)rssis countByEnumeratingWithState:&v163 objects:v184 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v164;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v164 != v7) {
          objc_enumerationMutation(rssis);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v6 = [(NSMutableArray *)rssis countByEnumeratingWithState:&v163 objects:v184 count:16];
    }
    while (v6);
  }
  long long v162 = 0u;
  long long v161 = 0u;
  long long v160 = 0u;
  long long v159 = 0u;
  ccas = self->_ccas;
  uint64_t v10 = [(NSMutableArray *)ccas countByEnumeratingWithState:&v159 objects:v183 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v160;
    do
    {
      for (uint64_t j = 0; j != v11; ++j)
      {
        if (*(void *)v160 != v12) {
          objc_enumerationMutation(ccas);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v11 = [(NSMutableArray *)ccas countByEnumeratingWithState:&v159 objects:v183 count:16];
    }
    while (v11);
  }
  long long v157 = 0u;
  long long v158 = 0u;
  long long v155 = 0u;
  long long v156 = 0u;
  snrs = self->_snrs;
  uint64_t v15 = [(NSMutableArray *)snrs countByEnumeratingWithState:&v155 objects:v182 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v156;
    do
    {
      for (uint64_t k = 0; k != v16; ++k)
      {
        if (*(void *)v156 != v17) {
          objc_enumerationMutation(snrs);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v16 = [(NSMutableArray *)snrs countByEnumeratingWithState:&v155 objects:v182 count:16];
    }
    while (v16);
  }
  long long v153 = 0u;
  long long v154 = 0u;
  long long v151 = 0u;
  long long v152 = 0u;
  packets = self->_packets;
  uint64_t v20 = [(NSMutableArray *)packets countByEnumeratingWithState:&v151 objects:v181 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v152;
    do
    {
      for (uint64_t m = 0; m != v21; ++m)
      {
        if (*(void *)v152 != v22) {
          objc_enumerationMutation(packets);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v21 = [(NSMutableArray *)packets countByEnumeratingWithState:&v151 objects:v181 count:16];
    }
    while (v21);
  }
  long long v149 = 0u;
  long long v150 = 0u;
  long long v147 = 0u;
  long long v148 = 0u;
  bytes = self->_bytes;
  uint64_t v25 = [(NSMutableArray *)bytes countByEnumeratingWithState:&v147 objects:v180 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v148;
    do
    {
      for (uint64_t n = 0; n != v26; ++n)
      {
        if (*(void *)v148 != v27) {
          objc_enumerationMutation(bytes);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v26 = [(NSMutableArray *)bytes countByEnumeratingWithState:&v147 objects:v180 count:16];
    }
    while (v26);
  }
  long long v145 = 0u;
  long long v146 = 0u;
  long long v143 = 0u;
  long long v144 = 0u;
  txLatencyBKs = self->_txLatencyBKs;
  uint64_t v30 = [(NSMutableArray *)txLatencyBKs countByEnumeratingWithState:&v143 objects:v179 count:16];
  if (v30)
  {
    uint64_t v31 = v30;
    uint64_t v32 = *(void *)v144;
    do
    {
      for (iuint64_t i = 0; ii != v31; ++ii)
      {
        if (*(void *)v144 != v32) {
          objc_enumerationMutation(txLatencyBKs);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v31 = [(NSMutableArray *)txLatencyBKs countByEnumeratingWithState:&v143 objects:v179 count:16];
    }
    while (v31);
  }
  long long v141 = 0u;
  long long v142 = 0u;
  long long v139 = 0u;
  long long v140 = 0u;
  txLatencyBEs = self->_txLatencyBEs;
  uint64_t v35 = [(NSMutableArray *)txLatencyBEs countByEnumeratingWithState:&v139 objects:v178 count:16];
  if (v35)
  {
    uint64_t v36 = v35;
    uint64_t v37 = *(void *)v140;
    do
    {
      for (juint64_t j = 0; jj != v36; ++jj)
      {
        if (*(void *)v140 != v37) {
          objc_enumerationMutation(txLatencyBEs);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v36 = [(NSMutableArray *)txLatencyBEs countByEnumeratingWithState:&v139 objects:v178 count:16];
    }
    while (v36);
  }
  long long v137 = 0u;
  long long v138 = 0u;
  long long v135 = 0u;
  long long v136 = 0u;
  txLatencyVOs = self->_txLatencyVOs;
  uint64_t v40 = [(NSMutableArray *)txLatencyVOs countByEnumeratingWithState:&v135 objects:v177 count:16];
  if (v40)
  {
    uint64_t v41 = v40;
    uint64_t v42 = *(void *)v136;
    do
    {
      for (kuint64_t k = 0; kk != v41; ++kk)
      {
        if (*(void *)v136 != v42) {
          objc_enumerationMutation(txLatencyVOs);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v41 = [(NSMutableArray *)txLatencyVOs countByEnumeratingWithState:&v135 objects:v177 count:16];
    }
    while (v41);
  }
  long long v133 = 0u;
  long long v134 = 0u;
  long long v131 = 0u;
  long long v132 = 0u;
  txLatencyVIs = self->_txLatencyVIs;
  uint64_t v45 = [(NSMutableArray *)txLatencyVIs countByEnumeratingWithState:&v131 objects:v176 count:16];
  if (v45)
  {
    uint64_t v46 = v45;
    uint64_t v47 = *(void *)v132;
    do
    {
      for (muint64_t m = 0; mm != v46; ++mm)
      {
        if (*(void *)v132 != v47) {
          objc_enumerationMutation(txLatencyVIs);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v46 = [(NSMutableArray *)txLatencyVIs countByEnumeratingWithState:&v131 objects:v176 count:16];
    }
    while (v46);
  }
  if (self->_completions) {
    PBDataWriterWriteSubmessage();
  }
  long long v129 = 0u;
  long long v130 = 0u;
  long long v127 = 0u;
  long long v128 = 0u;
  acCompletions = self->_acCompletions;
  uint64_t v50 = [(NSMutableArray *)acCompletions countByEnumeratingWithState:&v127 objects:v175 count:16];
  if (v50)
  {
    uint64_t v51 = v50;
    uint64_t v52 = *(void *)v128;
    do
    {
      for (nuint64_t n = 0; nn != v51; ++nn)
      {
        if (*(void *)v128 != v52) {
          objc_enumerationMutation(acCompletions);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v51 = [(NSMutableArray *)acCompletions countByEnumeratingWithState:&v127 objects:v175 count:16];
    }
    while (v51);
  }
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) != 0)
  {
    PBDataWriterWriteInt32Field();
    __int16 has = (__int16)self->_has;
    if ((has & 0x400) == 0)
    {
LABEL_79:
      if ((has & 1) == 0) {
        goto LABEL_80;
      }
      goto LABEL_147;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x400) == 0)
  {
    goto LABEL_79;
  }
  PBDataWriterWriteInt32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_80:
    if ((has & 8) == 0) {
      goto LABEL_81;
    }
    goto LABEL_148;
  }
LABEL_147:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_81:
    if ((has & 0x20) == 0) {
      goto LABEL_82;
    }
    goto LABEL_149;
  }
LABEL_148:
  PBDataWriterWriteInt32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_82:
    if ((has & 2) == 0) {
      goto LABEL_83;
    }
    goto LABEL_150;
  }
LABEL_149:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_83:
    if ((has & 0x10) == 0) {
      goto LABEL_84;
    }
    goto LABEL_151;
  }
LABEL_150:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_84:
    if ((has & 4) == 0) {
      goto LABEL_85;
    }
    goto LABEL_152;
  }
LABEL_151:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_85:
    if ((has & 0x40) == 0) {
      goto LABEL_86;
    }
    goto LABEL_153;
  }
LABEL_152:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_86:
    if ((has & 0x80) == 0) {
      goto LABEL_88;
    }
    goto LABEL_87;
  }
LABEL_153:
  PBDataWriterWriteUint32Field();
  if ((*(_WORD *)&self->_has & 0x80) != 0) {
LABEL_87:
  }
    PBDataWriterWriteUint32Field();
LABEL_88:
  long long v125 = 0u;
  long long v126 = 0u;
  long long v123 = 0u;
  long long v124 = 0u;
  rxLatencyTID0s = self->_rxLatencyTID0s;
  uint64_t v56 = [(NSMutableArray *)rxLatencyTID0s countByEnumeratingWithState:&v123 objects:v174 count:16];
  if (v56)
  {
    uint64_t v57 = v56;
    uint64_t v58 = *(void *)v124;
    do
    {
      for (uint64_t i1 = 0; i1 != v57; ++i1)
      {
        if (*(void *)v124 != v58) {
          objc_enumerationMutation(rxLatencyTID0s);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v57 = [(NSMutableArray *)rxLatencyTID0s countByEnumeratingWithState:&v123 objects:v174 count:16];
    }
    while (v57);
  }
  long long v121 = 0u;
  long long v122 = 0u;
  long long v119 = 0u;
  long long v120 = 0u;
  rxLatencyTID1s = self->_rxLatencyTID1s;
  uint64_t v61 = [(NSMutableArray *)rxLatencyTID1s countByEnumeratingWithState:&v119 objects:v173 count:16];
  if (v61)
  {
    uint64_t v62 = v61;
    uint64_t v63 = *(void *)v120;
    do
    {
      for (uint64_t i2 = 0; i2 != v62; ++i2)
      {
        if (*(void *)v120 != v63) {
          objc_enumerationMutation(rxLatencyTID1s);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v62 = [(NSMutableArray *)rxLatencyTID1s countByEnumeratingWithState:&v119 objects:v173 count:16];
    }
    while (v62);
  }
  long long v117 = 0u;
  long long v118 = 0u;
  long long v115 = 0u;
  long long v116 = 0u;
  rxLatencyTID2s = self->_rxLatencyTID2s;
  uint64_t v66 = [(NSMutableArray *)rxLatencyTID2s countByEnumeratingWithState:&v115 objects:v172 count:16];
  if (v66)
  {
    uint64_t v67 = v66;
    uint64_t v68 = *(void *)v116;
    do
    {
      for (uint64_t i3 = 0; i3 != v67; ++i3)
      {
        if (*(void *)v116 != v68) {
          objc_enumerationMutation(rxLatencyTID2s);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v67 = [(NSMutableArray *)rxLatencyTID2s countByEnumeratingWithState:&v115 objects:v172 count:16];
    }
    while (v67);
  }
  long long v113 = 0u;
  long long v114 = 0u;
  long long v111 = 0u;
  long long v112 = 0u;
  rxLatencyTID3s = self->_rxLatencyTID3s;
  uint64_t v71 = [(NSMutableArray *)rxLatencyTID3s countByEnumeratingWithState:&v111 objects:v171 count:16];
  if (v71)
  {
    uint64_t v72 = v71;
    uint64_t v73 = *(void *)v112;
    do
    {
      for (uint64_t i4 = 0; i4 != v72; ++i4)
      {
        if (*(void *)v112 != v73) {
          objc_enumerationMutation(rxLatencyTID3s);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v72 = [(NSMutableArray *)rxLatencyTID3s countByEnumeratingWithState:&v111 objects:v171 count:16];
    }
    while (v72);
  }
  long long v109 = 0u;
  long long v110 = 0u;
  long long v107 = 0u;
  long long v108 = 0u;
  rxLatencyTID4s = self->_rxLatencyTID4s;
  uint64_t v76 = [(NSMutableArray *)rxLatencyTID4s countByEnumeratingWithState:&v107 objects:v170 count:16];
  if (v76)
  {
    uint64_t v77 = v76;
    uint64_t v78 = *(void *)v108;
    do
    {
      for (uint64_t i5 = 0; i5 != v77; ++i5)
      {
        if (*(void *)v108 != v78) {
          objc_enumerationMutation(rxLatencyTID4s);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v77 = [(NSMutableArray *)rxLatencyTID4s countByEnumeratingWithState:&v107 objects:v170 count:16];
    }
    while (v77);
  }
  long long v105 = 0u;
  long long v106 = 0u;
  long long v103 = 0u;
  long long v104 = 0u;
  rxLatencyTID5s = self->_rxLatencyTID5s;
  uint64_t v81 = [(NSMutableArray *)rxLatencyTID5s countByEnumeratingWithState:&v103 objects:v169 count:16];
  if (v81)
  {
    uint64_t v82 = v81;
    uint64_t v83 = *(void *)v104;
    do
    {
      for (uint64_t i6 = 0; i6 != v82; ++i6)
      {
        if (*(void *)v104 != v83) {
          objc_enumerationMutation(rxLatencyTID5s);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v82 = [(NSMutableArray *)rxLatencyTID5s countByEnumeratingWithState:&v103 objects:v169 count:16];
    }
    while (v82);
  }
  long long v101 = 0u;
  long long v102 = 0u;
  long long v99 = 0u;
  long long v100 = 0u;
  rxLatencyTID6s = self->_rxLatencyTID6s;
  uint64_t v86 = [(NSMutableArray *)rxLatencyTID6s countByEnumeratingWithState:&v99 objects:v168 count:16];
  if (v86)
  {
    uint64_t v87 = v86;
    uint64_t v88 = *(void *)v100;
    do
    {
      for (uint64_t i7 = 0; i7 != v87; ++i7)
      {
        if (*(void *)v100 != v88) {
          objc_enumerationMutation(rxLatencyTID6s);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v87 = [(NSMutableArray *)rxLatencyTID6s countByEnumeratingWithState:&v99 objects:v168 count:16];
    }
    while (v87);
  }
  long long v97 = 0u;
  long long v98 = 0u;
  long long v95 = 0u;
  long long v96 = 0u;
  rxLatencyTID7s = self->_rxLatencyTID7s;
  uint64_t v91 = [(NSMutableArray *)rxLatencyTID7s countByEnumeratingWithState:&v95 objects:v167 count:16];
  if (v91)
  {
    uint64_t v92 = v91;
    uint64_t v93 = *(void *)v96;
    do
    {
      for (uint64_t i8 = 0; i8 != v92; ++i8)
      {
        if (*(void *)v96 != v93) {
          objc_enumerationMutation(rxLatencyTID7s);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v92 = [(NSMutableArray *)rxLatencyTID7s countByEnumeratingWithState:&v95 objects:v167 count:16];
    }
    while (v92);
  }
}

- (void)copyTo:(id)a3
{
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    *((_DWORD *)a3 + 24) = self->_role;
    *((_WORD *)a3 + 112) |= 0x100u;
  }
  if (self->_hashID) {
    [a3 setHashID:];
  }
  if ([(AWDWiFiNWActivityPeerStats *)self rssisCount])
  {
    [a3 clearRssis];
    unint64_t v5 = [(AWDWiFiNWActivityPeerStats *)self rssisCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
        [a3 addRssi:-[AWDWiFiNWActivityPeerStats rssiAtIndex:](self, "rssiAtIndex:", i)];
    }
  }
  if ([(AWDWiFiNWActivityPeerStats *)self ccasCount])
  {
    [a3 clearCcas];
    unint64_t v8 = [(AWDWiFiNWActivityPeerStats *)self ccasCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
        [a3 addCca:-[AWDWiFiNWActivityPeerStats ccaAtIndex:](self, "ccaAtIndex:", j)];
    }
  }
  if ([(AWDWiFiNWActivityPeerStats *)self snrsCount])
  {
    [a3 clearSnrs];
    unint64_t v11 = [(AWDWiFiNWActivityPeerStats *)self snrsCount];
    if (v11)
    {
      unint64_t v12 = v11;
      for (uint64_t k = 0; k != v12; ++k)
        [a3 addSnr:-[AWDWiFiNWActivityPeerStats snrAtIndex:](self, "snrAtIndex:", k)];
    }
  }
  if ([(AWDWiFiNWActivityPeerStats *)self packetsCount])
  {
    [a3 clearPackets];
    unint64_t v14 = [(AWDWiFiNWActivityPeerStats *)self packetsCount];
    if (v14)
    {
      unint64_t v15 = v14;
      for (uint64_t m = 0; m != v15; ++m)
        [a3 addPackets: -[AWDWiFiNWActivityPeerStats packetsAtIndex:](self, "packetsAtIndex:", m)];
    }
  }
  if ([(AWDWiFiNWActivityPeerStats *)self bytesCount])
  {
    [a3 clearBytes];
    unint64_t v17 = [(AWDWiFiNWActivityPeerStats *)self bytesCount];
    if (v17)
    {
      unint64_t v18 = v17;
      for (uint64_t n = 0; n != v18; ++n)
        [a3 addBytes:-[AWDWiFiNWActivityPeerStats bytesAtIndex:](self, "bytesAtIndex:", n)];
    }
  }
  if ([(AWDWiFiNWActivityPeerStats *)self txLatencyBKsCount])
  {
    [a3 clearTxLatencyBKs];
    unint64_t v20 = [(AWDWiFiNWActivityPeerStats *)self txLatencyBKsCount];
    if (v20)
    {
      unint64_t v21 = v20;
      for (iuint64_t i = 0; ii != v21; ++ii)
        [a3 addTxLatencyBK:-[AWDWiFiNWActivityPeerStats txLatencyBKAtIndex:](self, "txLatencyBKAtIndex:", ii)];
    }
  }
  if ([(AWDWiFiNWActivityPeerStats *)self txLatencyBEsCount])
  {
    [a3 clearTxLatencyBEs];
    unint64_t v23 = [(AWDWiFiNWActivityPeerStats *)self txLatencyBEsCount];
    if (v23)
    {
      unint64_t v24 = v23;
      for (juint64_t j = 0; jj != v24; ++jj)
        [a3 addTxLatencyBE:-[AWDWiFiNWActivityPeerStats txLatencyBEAtIndex:](self, "txLatencyBEAtIndex:", jj)];
    }
  }
  if ([(AWDWiFiNWActivityPeerStats *)self txLatencyVOsCount])
  {
    [a3 clearTxLatencyVOs];
    unint64_t v26 = [(AWDWiFiNWActivityPeerStats *)self txLatencyVOsCount];
    if (v26)
    {
      unint64_t v27 = v26;
      for (kuint64_t k = 0; kk != v27; ++kk)
        [a3 addTxLatencyVO:-[AWDWiFiNWActivityPeerStats txLatencyVOAtIndex:](self, "txLatencyVOAtIndex:", kk)];
    }
  }
  if ([(AWDWiFiNWActivityPeerStats *)self txLatencyVIsCount])
  {
    [a3 clearTxLatencyVIs];
    unint64_t v29 = [(AWDWiFiNWActivityPeerStats *)self txLatencyVIsCount];
    if (v29)
    {
      unint64_t v30 = v29;
      for (muint64_t m = 0; mm != v30; ++mm)
        [a3 addTxLatencyVI:-[AWDWiFiNWActivityPeerStats txLatencyVIAtIndex:](self, "txLatencyVIAtIndex:", mm)];
    }
  }
  if (self->_completions) {
    [a3 setCompletions:];
  }
  if ([(AWDWiFiNWActivityPeerStats *)self acCompletionsCount])
  {
    [a3 clearAcCompletions];
    unint64_t v32 = [(AWDWiFiNWActivityPeerStats *)self acCompletionsCount];
    if (v32)
    {
      unint64_t v33 = v32;
      for (nuint64_t n = 0; nn != v33; ++nn)
        [a3 addAcCompletions:-[AWDWiFiNWActivityPeerStats acCompletionsAtIndex:](self, "acCompletionsAtIndex:", nn)];
    }
  }
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) != 0)
  {
    *((_DWORD *)a3 + 25) = self->_rssiValue;
    *((_WORD *)a3 + 112) |= 0x200u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x400) == 0)
    {
LABEL_49:
      if ((has & 1) == 0) {
        goto LABEL_50;
      }
      goto LABEL_93;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x400) == 0)
  {
    goto LABEL_49;
  }
  *((_DWORD *)a3 + 44) = self->_snrValue;
  *((_WORD *)a3 + 112) |= 0x400u;
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_50:
    if ((has & 8) == 0) {
      goto LABEL_51;
    }
    goto LABEL_94;
  }
LABEL_93:
  *((_DWORD *)a3 + 6) = self->_ccaValue;
  *((_WORD *)a3 + 112) |= 1u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_51:
    if ((has & 0x20) == 0) {
      goto LABEL_52;
    }
    goto LABEL_95;
  }
LABEL_94:
  *((_DWORD *)a3 + 16) = self->_nfValue;
  *((_WORD *)a3 + 112) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_52:
    if ((has & 2) == 0) {
      goto LABEL_53;
    }
    goto LABEL_96;
  }
LABEL_95:
  *((_DWORD *)a3 + 18) = self->_ofdmDesense;
  *((_WORD *)a3 + 112) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_53:
    if ((has & 0x10) == 0) {
      goto LABEL_54;
    }
    goto LABEL_97;
  }
LABEL_96:
  *((_DWORD *)a3 + 14) = self->_ibssCCA;
  *((_WORD *)a3 + 112) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_54:
    if ((has & 4) == 0) {
      goto LABEL_55;
    }
    goto LABEL_98;
  }
LABEL_97:
  *((_DWORD *)a3 + 17) = self->_obssCCA;
  *((_WORD *)a3 + 112) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_55:
    if ((has & 0x40) == 0) {
      goto LABEL_56;
    }
LABEL_99:
    *((_DWORD *)a3 + 22) = self->_qbssCCA;
    *((_WORD *)a3 + 112) |= 0x40u;
    if ((*(_WORD *)&self->_has & 0x80) == 0) {
      goto LABEL_58;
    }
    goto LABEL_57;
  }
LABEL_98:
  *((_DWORD *)a3 + 15) = self->_interferenceCCA;
  *((_WORD *)a3 + 112) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) != 0) {
    goto LABEL_99;
  }
LABEL_56:
  if ((has & 0x80) != 0)
  {
LABEL_57:
    *((_DWORD *)a3 + 23) = self->_qbssSTACount;
    *((_WORD *)a3 + 112) |= 0x80u;
  }
LABEL_58:
  if ([(AWDWiFiNWActivityPeerStats *)self rxLatencyTID0sCount])
  {
    [a3 clearRxLatencyTID0s];
    unint64_t v36 = [(AWDWiFiNWActivityPeerStats *)self rxLatencyTID0sCount];
    if (v36)
    {
      unint64_t v37 = v36;
      for (uint64_t i1 = 0; i1 != v37; ++i1)
        [a3 addRxLatencyTID0:-[AWDWiFiNWActivityPeerStats rxLatencyTID0AtIndex:](self, "rxLatencyTID0AtIndex:", i1)];
    }
  }
  if ([(AWDWiFiNWActivityPeerStats *)self rxLatencyTID1sCount])
  {
    [a3 clearRxLatencyTID1s];
    unint64_t v39 = [(AWDWiFiNWActivityPeerStats *)self rxLatencyTID1sCount];
    if (v39)
    {
      unint64_t v40 = v39;
      for (uint64_t i2 = 0; i2 != v40; ++i2)
        [a3 addRxLatencyTID1:-[AWDWiFiNWActivityPeerStats rxLatencyTID1AtIndex:](self, "rxLatencyTID1AtIndex:", i2)];
    }
  }
  if ([(AWDWiFiNWActivityPeerStats *)self rxLatencyTID2sCount])
  {
    [a3 clearRxLatencyTID2s];
    unint64_t v42 = [(AWDWiFiNWActivityPeerStats *)self rxLatencyTID2sCount];
    if (v42)
    {
      unint64_t v43 = v42;
      for (uint64_t i3 = 0; i3 != v43; ++i3)
        [a3 addRxLatencyTID2:-[AWDWiFiNWActivityPeerStats rxLatencyTID2AtIndex:](self, "rxLatencyTID2AtIndex:", i3)];
    }
  }
  if ([(AWDWiFiNWActivityPeerStats *)self rxLatencyTID3sCount])
  {
    [a3 clearRxLatencyTID3s];
    unint64_t v45 = [(AWDWiFiNWActivityPeerStats *)self rxLatencyTID3sCount];
    if (v45)
    {
      unint64_t v46 = v45;
      for (uint64_t i4 = 0; i4 != v46; ++i4)
        [a3 addRxLatencyTID3:-[AWDWiFiNWActivityPeerStats rxLatencyTID3AtIndex:](self, "rxLatencyTID3AtIndex:", i4)];
    }
  }
  if ([(AWDWiFiNWActivityPeerStats *)self rxLatencyTID4sCount])
  {
    [a3 clearRxLatencyTID4s];
    unint64_t v48 = [(AWDWiFiNWActivityPeerStats *)self rxLatencyTID4sCount];
    if (v48)
    {
      unint64_t v49 = v48;
      for (uint64_t i5 = 0; i5 != v49; ++i5)
        [a3 addRxLatencyTID4:-[AWDWiFiNWActivityPeerStats rxLatencyTID4AtIndex:](self, "rxLatencyTID4AtIndex:", i5)];
    }
  }
  if ([(AWDWiFiNWActivityPeerStats *)self rxLatencyTID5sCount])
  {
    [a3 clearRxLatencyTID5s];
    unint64_t v51 = [(AWDWiFiNWActivityPeerStats *)self rxLatencyTID5sCount];
    if (v51)
    {
      unint64_t v52 = v51;
      for (uint64_t i6 = 0; i6 != v52; ++i6)
        [a3 addRxLatencyTID5:-[AWDWiFiNWActivityPeerStats rxLatencyTID5AtIndex:](self, "rxLatencyTID5AtIndex:", i6)];
    }
  }
  if ([(AWDWiFiNWActivityPeerStats *)self rxLatencyTID6sCount])
  {
    [a3 clearRxLatencyTID6s];
    unint64_t v54 = [(AWDWiFiNWActivityPeerStats *)self rxLatencyTID6sCount];
    if (v54)
    {
      unint64_t v55 = v54;
      for (uint64_t i7 = 0; i7 != v55; ++i7)
        [a3 addRxLatencyTID6:-[AWDWiFiNWActivityPeerStats rxLatencyTID6AtIndex:](self, "rxLatencyTID6AtIndex:", i7)];
    }
  }
  if ([(AWDWiFiNWActivityPeerStats *)self rxLatencyTID7sCount])
  {
    [a3 clearRxLatencyTID7s];
    unint64_t v57 = [(AWDWiFiNWActivityPeerStats *)self rxLatencyTID7sCount];
    if (v57)
    {
      unint64_t v58 = v57;
      for (uint64_t i8 = 0; i8 != v58; ++i8)
        [a3 addRxLatencyTID7:-[AWDWiFiNWActivityPeerStats rxLatencyTID7AtIndex:](self, "rxLatencyTID7AtIndex:", i8)];
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v207 = *MEMORY[0x263EF8340];
  uint64_t v5 = [[objc_opt_class() allocWithZone:a3] init];
  uint64_t v6 = v5;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    *(_DWORD *)(v5 + 96) = self->_role;
    *(_WORD *)(v5 + 224) |= 0x100u;
  }

  *(void *)(v6 + 48) = [(NSString *)self->_hashID copyWithZone:a3];
  long long v185 = 0u;
  long long v186 = 0u;
  long long v187 = 0u;
  long long v188 = 0u;
  rssis = self->_rssis;
  uint64_t v8 = [(NSMutableArray *)rssis countByEnumeratingWithState:&v185 objects:v206 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v186;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v186 != v10) {
          objc_enumerationMutation(rssis);
        }
        unint64_t v12 = (void *)[*(id *)(*((void *)&v185 + 1) + 8 * i) copyWithZone:a3];
        [(id)v6 addRssi:v12];
      }
      uint64_t v9 = [(NSMutableArray *)rssis countByEnumeratingWithState:&v185 objects:v206 count:16];
    }
    while (v9);
  }
  long long v184 = 0u;
  long long v183 = 0u;
  long long v182 = 0u;
  long long v181 = 0u;
  ccas = self->_ccas;
  uint64_t v14 = [(NSMutableArray *)ccas countByEnumeratingWithState:&v181 objects:v205 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v182;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v182 != v16) {
          objc_enumerationMutation(ccas);
        }
        unint64_t v18 = (void *)[*(id *)(*((void *)&v181 + 1) + 8 * j) copyWithZone:a3];
        [(id)v6 addCca:v18];
      }
      uint64_t v15 = [(NSMutableArray *)ccas countByEnumeratingWithState:&v181 objects:v205 count:16];
    }
    while (v15);
  }
  long long v179 = 0u;
  long long v180 = 0u;
  long long v177 = 0u;
  long long v178 = 0u;
  snrs = self->_snrs;
  uint64_t v20 = [(NSMutableArray *)snrs countByEnumeratingWithState:&v177 objects:v204 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v178;
    do
    {
      for (uint64_t k = 0; k != v21; ++k)
      {
        if (*(void *)v178 != v22) {
          objc_enumerationMutation(snrs);
        }
        unint64_t v24 = (void *)[*(id *)(*((void *)&v177 + 1) + 8 * k) copyWithZone:a3];
        [(id)v6 addSnr:v24];
      }
      uint64_t v21 = [(NSMutableArray *)snrs countByEnumeratingWithState:&v177 objects:v204 count:16];
    }
    while (v21);
  }
  long long v175 = 0u;
  long long v176 = 0u;
  long long v173 = 0u;
  long long v174 = 0u;
  packets = self->_packets;
  uint64_t v26 = [(NSMutableArray *)packets countByEnumeratingWithState:&v173 objects:v203 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v174;
    do
    {
      for (uint64_t m = 0; m != v27; ++m)
      {
        if (*(void *)v174 != v28) {
          objc_enumerationMutation(packets);
        }
        unint64_t v30 = (void *)[*(id *)(*((void *)&v173 + 1) + 8 * m) copyWithZone:a3];
        [(id)v6 addPackets:v30];
      }
      uint64_t v27 = [(NSMutableArray *)packets countByEnumeratingWithState:&v173 objects:v203 count:16];
    }
    while (v27);
  }
  long long v171 = 0u;
  long long v172 = 0u;
  long long v169 = 0u;
  long long v170 = 0u;
  bytes = self->_bytes;
  uint64_t v32 = [(NSMutableArray *)bytes countByEnumeratingWithState:&v169 objects:v202 count:16];
  if (v32)
  {
    uint64_t v33 = v32;
    uint64_t v34 = *(void *)v170;
    do
    {
      for (uint64_t n = 0; n != v33; ++n)
      {
        if (*(void *)v170 != v34) {
          objc_enumerationMutation(bytes);
        }
        unint64_t v36 = (void *)[*(id *)(*((void *)&v169 + 1) + 8 * n) copyWithZone:a3];
        [(id)v6 addBytes:v36];
      }
      uint64_t v33 = [(NSMutableArray *)bytes countByEnumeratingWithState:&v169 objects:v202 count:16];
    }
    while (v33);
  }
  long long v167 = 0u;
  long long v168 = 0u;
  long long v165 = 0u;
  long long v166 = 0u;
  txLatencyBKs = self->_txLatencyBKs;
  uint64_t v38 = [(NSMutableArray *)txLatencyBKs countByEnumeratingWithState:&v165 objects:v201 count:16];
  if (v38)
  {
    uint64_t v39 = v38;
    uint64_t v40 = *(void *)v166;
    do
    {
      for (iuint64_t i = 0; ii != v39; ++ii)
      {
        if (*(void *)v166 != v40) {
          objc_enumerationMutation(txLatencyBKs);
        }
        unint64_t v42 = (void *)[*(id *)(*((void *)&v165 + 1) + 8 * ii) copyWithZone:a3];
        [(id)v6 addTxLatencyBK:v42];
      }
      uint64_t v39 = [(NSMutableArray *)txLatencyBKs countByEnumeratingWithState:&v165 objects:v201 count:16];
    }
    while (v39);
  }
  long long v163 = 0u;
  long long v164 = 0u;
  long long v161 = 0u;
  long long v162 = 0u;
  txLatencyBEs = self->_txLatencyBEs;
  uint64_t v44 = [(NSMutableArray *)txLatencyBEs countByEnumeratingWithState:&v161 objects:v200 count:16];
  if (v44)
  {
    uint64_t v45 = v44;
    uint64_t v46 = *(void *)v162;
    do
    {
      for (juint64_t j = 0; jj != v45; ++jj)
      {
        if (*(void *)v162 != v46) {
          objc_enumerationMutation(txLatencyBEs);
        }
        unint64_t v48 = (void *)[*(id *)(*((void *)&v161 + 1) + 8 * jj) copyWithZone:a3];
        [(id)v6 addTxLatencyBE:v48];
      }
      uint64_t v45 = [(NSMutableArray *)txLatencyBEs countByEnumeratingWithState:&v161 objects:v200 count:16];
    }
    while (v45);
  }
  long long v159 = 0u;
  long long v160 = 0u;
  long long v157 = 0u;
  long long v158 = 0u;
  txLatencyVOs = self->_txLatencyVOs;
  uint64_t v50 = [(NSMutableArray *)txLatencyVOs countByEnumeratingWithState:&v157 objects:v199 count:16];
  if (v50)
  {
    uint64_t v51 = v50;
    uint64_t v52 = *(void *)v158;
    do
    {
      for (kuint64_t k = 0; kk != v51; ++kk)
      {
        if (*(void *)v158 != v52) {
          objc_enumerationMutation(txLatencyVOs);
        }
        unint64_t v54 = (void *)[*(id *)(*((void *)&v157 + 1) + 8 * kk) copyWithZone:a3];
        [(id)v6 addTxLatencyVO:v54];
      }
      uint64_t v51 = [(NSMutableArray *)txLatencyVOs countByEnumeratingWithState:&v157 objects:v199 count:16];
    }
    while (v51);
  }
  long long v155 = 0u;
  long long v156 = 0u;
  long long v153 = 0u;
  long long v154 = 0u;
  txLatencyVIs = self->_txLatencyVIs;
  uint64_t v56 = [(NSMutableArray *)txLatencyVIs countByEnumeratingWithState:&v153 objects:v198 count:16];
  if (v56)
  {
    uint64_t v57 = v56;
    uint64_t v58 = *(void *)v154;
    do
    {
      for (muint64_t m = 0; mm != v57; ++mm)
      {
        if (*(void *)v154 != v58) {
          objc_enumerationMutation(txLatencyVIs);
        }
        v60 = (void *)[*(id *)(*((void *)&v153 + 1) + 8 * mm) copyWithZone:a3];
        [(id)v6 addTxLatencyVI:v60];
      }
      uint64_t v57 = [(NSMutableArray *)txLatencyVIs countByEnumeratingWithState:&v153 objects:v198 count:16];
    }
    while (v57);
  }

  *(void *)(v6 + 40) = [(AWDWiFiNWActivityTxCompletions *)self->_completions copyWithZone:a3];
  long long v149 = 0u;
  long long v150 = 0u;
  long long v151 = 0u;
  long long v152 = 0u;
  acCompletions = self->_acCompletions;
  uint64_t v62 = [(NSMutableArray *)acCompletions countByEnumeratingWithState:&v149 objects:v197 count:16];
  if (v62)
  {
    uint64_t v63 = v62;
    uint64_t v64 = *(void *)v150;
    do
    {
      for (nuint64_t n = 0; nn != v63; ++nn)
      {
        if (*(void *)v150 != v64) {
          objc_enumerationMutation(acCompletions);
        }
        uint64_t v66 = (void *)[*(id *)(*((void *)&v149 + 1) + 8 * nn) copyWithZone:a3];
        [(id)v6 addAcCompletions:v66];
      }
      uint64_t v63 = [(NSMutableArray *)acCompletions countByEnumeratingWithState:&v149 objects:v197 count:16];
    }
    while (v63);
  }
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) != 0)
  {
    *(_DWORD *)(v6 + 100) = self->_rssiValue;
    *(_WORD *)(v6 + 224) |= 0x200u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x400) == 0)
    {
LABEL_75:
      if ((has & 1) == 0) {
        goto LABEL_76;
      }
      goto LABEL_143;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x400) == 0)
  {
    goto LABEL_75;
  }
  *(_DWORD *)(v6 + 176) = self->_snrValue;
  *(_WORD *)(v6 + 224) |= 0x400u;
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_76:
    if ((has & 8) == 0) {
      goto LABEL_77;
    }
    goto LABEL_144;
  }
LABEL_143:
  *(_DWORD *)(v6 + 24) = self->_ccaValue;
  *(_WORD *)(v6 + 224) |= 1u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_77:
    if ((has & 0x20) == 0) {
      goto LABEL_78;
    }
    goto LABEL_145;
  }
LABEL_144:
  *(_DWORD *)(v6 + 64) = self->_nfValue;
  *(_WORD *)(v6 + 224) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_78:
    if ((has & 2) == 0) {
      goto LABEL_79;
    }
    goto LABEL_146;
  }
LABEL_145:
  *(_DWORD *)(v6 + 72) = self->_ofdmDesense;
  *(_WORD *)(v6 + 224) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_79:
    if ((has & 0x10) == 0) {
      goto LABEL_80;
    }
    goto LABEL_147;
  }
LABEL_146:
  *(_DWORD *)(v6 + 56) = self->_ibssCCA;
  *(_WORD *)(v6 + 224) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_80:
    if ((has & 4) == 0) {
      goto LABEL_81;
    }
    goto LABEL_148;
  }
LABEL_147:
  *(_DWORD *)(v6 + 68) = self->_obssCCA;
  *(_WORD *)(v6 + 224) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_81:
    if ((has & 0x40) == 0) {
      goto LABEL_82;
    }
    goto LABEL_149;
  }
LABEL_148:
  *(_DWORD *)(v6 + 60) = self->_interferenceCCA;
  *(_WORD *)(v6 + 224) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_82:
    if ((has & 0x80) == 0) {
      goto LABEL_84;
    }
    goto LABEL_83;
  }
LABEL_149:
  *(_DWORD *)(v6 + 88) = self->_qbssCCA;
  *(_WORD *)(v6 + 224) |= 0x40u;
  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
LABEL_83:
    *(_DWORD *)(v6 + 92) = self->_qbssSTACount;
    *(_WORD *)(v6 + 224) |= 0x80u;
  }
LABEL_84:
  long long v147 = 0u;
  long long v148 = 0u;
  long long v145 = 0u;
  long long v146 = 0u;
  rxLatencyTID0s = self->_rxLatencyTID0s;
  uint64_t v69 = [(NSMutableArray *)rxLatencyTID0s countByEnumeratingWithState:&v145 objects:v196 count:16];
  if (v69)
  {
    uint64_t v70 = v69;
    uint64_t v71 = *(void *)v146;
    do
    {
      for (uint64_t i1 = 0; i1 != v70; ++i1)
      {
        if (*(void *)v146 != v71) {
          objc_enumerationMutation(rxLatencyTID0s);
        }
        uint64_t v73 = (void *)[*(id *)(*((void *)&v145 + 1) + 8 * i1) copyWithZone:a3];
        [(id)v6 addRxLatencyTID0:v73];
      }
      uint64_t v70 = [(NSMutableArray *)rxLatencyTID0s countByEnumeratingWithState:&v145 objects:v196 count:16];
    }
    while (v70);
  }
  long long v143 = 0u;
  long long v144 = 0u;
  long long v141 = 0u;
  long long v142 = 0u;
  rxLatencyTID1s = self->_rxLatencyTID1s;
  uint64_t v75 = [(NSMutableArray *)rxLatencyTID1s countByEnumeratingWithState:&v141 objects:v195 count:16];
  if (v75)
  {
    uint64_t v76 = v75;
    uint64_t v77 = *(void *)v142;
    do
    {
      for (uint64_t i2 = 0; i2 != v76; ++i2)
      {
        if (*(void *)v142 != v77) {
          objc_enumerationMutation(rxLatencyTID1s);
        }
        uint64_t v79 = (void *)[*(id *)(*((void *)&v141 + 1) + 8 * i2) copyWithZone:a3];
        [(id)v6 addRxLatencyTID1:v79];
      }
      uint64_t v76 = [(NSMutableArray *)rxLatencyTID1s countByEnumeratingWithState:&v141 objects:v195 count:16];
    }
    while (v76);
  }
  long long v139 = 0u;
  long long v140 = 0u;
  long long v137 = 0u;
  long long v138 = 0u;
  rxLatencyTID2s = self->_rxLatencyTID2s;
  uint64_t v81 = [(NSMutableArray *)rxLatencyTID2s countByEnumeratingWithState:&v137 objects:v194 count:16];
  if (v81)
  {
    uint64_t v82 = v81;
    uint64_t v83 = *(void *)v138;
    do
    {
      for (uint64_t i3 = 0; i3 != v82; ++i3)
      {
        if (*(void *)v138 != v83) {
          objc_enumerationMutation(rxLatencyTID2s);
        }
        uint64_t v85 = (void *)[*(id *)(*((void *)&v137 + 1) + 8 * i3) copyWithZone:a3];
        [(id)v6 addRxLatencyTID2:v85];
      }
      uint64_t v82 = [(NSMutableArray *)rxLatencyTID2s countByEnumeratingWithState:&v137 objects:v194 count:16];
    }
    while (v82);
  }
  long long v135 = 0u;
  long long v136 = 0u;
  long long v133 = 0u;
  long long v134 = 0u;
  rxLatencyTID3s = self->_rxLatencyTID3s;
  uint64_t v87 = [(NSMutableArray *)rxLatencyTID3s countByEnumeratingWithState:&v133 objects:v193 count:16];
  if (v87)
  {
    uint64_t v88 = v87;
    uint64_t v89 = *(void *)v134;
    do
    {
      for (uint64_t i4 = 0; i4 != v88; ++i4)
      {
        if (*(void *)v134 != v89) {
          objc_enumerationMutation(rxLatencyTID3s);
        }
        uint64_t v91 = (void *)[*(id *)(*((void *)&v133 + 1) + 8 * i4) copyWithZone:a3];
        [(id)v6 addRxLatencyTID3:v91];
      }
      uint64_t v88 = [(NSMutableArray *)rxLatencyTID3s countByEnumeratingWithState:&v133 objects:v193 count:16];
    }
    while (v88);
  }
  long long v131 = 0u;
  long long v132 = 0u;
  long long v129 = 0u;
  long long v130 = 0u;
  rxLatencyTID4s = self->_rxLatencyTID4s;
  uint64_t v93 = [(NSMutableArray *)rxLatencyTID4s countByEnumeratingWithState:&v129 objects:v192 count:16];
  if (v93)
  {
    uint64_t v94 = v93;
    uint64_t v95 = *(void *)v130;
    do
    {
      for (uint64_t i5 = 0; i5 != v94; ++i5)
      {
        if (*(void *)v130 != v95) {
          objc_enumerationMutation(rxLatencyTID4s);
        }
        long long v97 = (void *)[*(id *)(*((void *)&v129 + 1) + 8 * i5) copyWithZone:a3];
        [(id)v6 addRxLatencyTID4:v97];
      }
      uint64_t v94 = [(NSMutableArray *)rxLatencyTID4s countByEnumeratingWithState:&v129 objects:v192 count:16];
    }
    while (v94);
  }
  long long v127 = 0u;
  long long v128 = 0u;
  long long v125 = 0u;
  long long v126 = 0u;
  rxLatencyTID5s = self->_rxLatencyTID5s;
  uint64_t v99 = [(NSMutableArray *)rxLatencyTID5s countByEnumeratingWithState:&v125 objects:v191 count:16];
  if (v99)
  {
    uint64_t v100 = v99;
    uint64_t v101 = *(void *)v126;
    do
    {
      for (uint64_t i6 = 0; i6 != v100; ++i6)
      {
        if (*(void *)v126 != v101) {
          objc_enumerationMutation(rxLatencyTID5s);
        }
        long long v103 = (void *)[*(id *)(*((void *)&v125 + 1) + 8 * i6) copyWithZone:a3];
        [(id)v6 addRxLatencyTID5:v103];
      }
      uint64_t v100 = [(NSMutableArray *)rxLatencyTID5s countByEnumeratingWithState:&v125 objects:v191 count:16];
    }
    while (v100);
  }
  long long v123 = 0u;
  long long v124 = 0u;
  long long v121 = 0u;
  long long v122 = 0u;
  rxLatencyTID6s = self->_rxLatencyTID6s;
  uint64_t v105 = [(NSMutableArray *)rxLatencyTID6s countByEnumeratingWithState:&v121 objects:v190 count:16];
  if (v105)
  {
    uint64_t v106 = v105;
    uint64_t v107 = *(void *)v122;
    do
    {
      for (uint64_t i7 = 0; i7 != v106; ++i7)
      {
        if (*(void *)v122 != v107) {
          objc_enumerationMutation(rxLatencyTID6s);
        }
        long long v109 = (void *)[*(id *)(*((void *)&v121 + 1) + 8 * i7) copyWithZone:a3];
        [(id)v6 addRxLatencyTID6:v109];
      }
      uint64_t v106 = [(NSMutableArray *)rxLatencyTID6s countByEnumeratingWithState:&v121 objects:v190 count:16];
    }
    while (v106);
  }
  long long v119 = 0u;
  long long v120 = 0u;
  long long v117 = 0u;
  long long v118 = 0u;
  rxLatencyTID7s = self->_rxLatencyTID7s;
  uint64_t v111 = [(NSMutableArray *)rxLatencyTID7s countByEnumeratingWithState:&v117 objects:v189 count:16];
  if (v111)
  {
    uint64_t v112 = v111;
    uint64_t v113 = *(void *)v118;
    do
    {
      for (uint64_t i8 = 0; i8 != v112; ++i8)
      {
        if (*(void *)v118 != v113) {
          objc_enumerationMutation(rxLatencyTID7s);
        }
        long long v115 = (void *)[*(id *)(*((void *)&v117 + 1) + 8 * i8) copyWithZone:a3];
        [(id)v6 addRxLatencyTID7:v115];
      }
      uint64_t v112 = [(NSMutableArray *)rxLatencyTID7s countByEnumeratingWithState:&v117 objects:v189 count:16];
    }
    while (v112);
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    if ((*(_WORD *)&self->_has & 0x100) != 0)
    {
      if ((*((_WORD *)a3 + 112) & 0x100) == 0 || self->_role != *((_DWORD *)a3 + 24)) {
        goto LABEL_97;
      }
    }
    else if ((*((_WORD *)a3 + 112) & 0x100) != 0)
    {
LABEL_97:
      LOBYTE(v5) = 0;
      return v5;
    }
    hashID = self->_hashID;
    if (!((unint64_t)hashID | *((void *)a3 + 6)) || (int v5 = -[NSString isEqual:](hashID, "isEqual:")) != 0)
    {
      rssis = self->_rssis;
      if (!((unint64_t)rssis | *((void *)a3 + 13))
        || (int v5 = -[NSMutableArray isEqual:](rssis, "isEqual:")) != 0)
      {
        ccas = self->_ccas;
        if (!((unint64_t)ccas | *((void *)a3 + 4)) || (int v5 = -[NSMutableArray isEqual:](ccas, "isEqual:")) != 0)
        {
          snrs = self->_snrs;
          if (!((unint64_t)snrs | *((void *)a3 + 23))
            || (int v5 = -[NSMutableArray isEqual:](snrs, "isEqual:")) != 0)
          {
            packets = self->_packets;
            if (!((unint64_t)packets | *((void *)a3 + 10))
              || (int v5 = -[NSMutableArray isEqual:](packets, "isEqual:")) != 0)
            {
              bytes = self->_bytes;
              if (!((unint64_t)bytes | *((void *)a3 + 2))
                || (int v5 = -[NSMutableArray isEqual:](bytes, "isEqual:")) != 0)
              {
                txLatencyBKs = self->_txLatencyBKs;
                if (!((unint64_t)txLatencyBKs | *((void *)a3 + 25))
                  || (int v5 = -[NSMutableArray isEqual:](txLatencyBKs, "isEqual:")) != 0)
                {
                  txLatencyBEs = self->_txLatencyBEs;
                  if (!((unint64_t)txLatencyBEs | *((void *)a3 + 24))
                    || (int v5 = -[NSMutableArray isEqual:](txLatencyBEs, "isEqual:")) != 0)
                  {
                    txLatencyVOs = self->_txLatencyVOs;
                    if (!((unint64_t)txLatencyVOs | *((void *)a3 + 27))
                      || (int v5 = -[NSMutableArray isEqual:](txLatencyVOs, "isEqual:")) != 0)
                    {
                      txLatencyVIs = self->_txLatencyVIs;
                      if (!((unint64_t)txLatencyVIs | *((void *)a3 + 26))
                        || (int v5 = -[NSMutableArray isEqual:](txLatencyVIs, "isEqual:")) != 0)
                      {
                        completions = self->_completions;
                        if (!((unint64_t)completions | *((void *)a3 + 5))
                          || (int v5 = -[AWDWiFiNWActivityTxCompletions isEqual:](completions, "isEqual:")) != 0)
                        {
                          acCompletions = self->_acCompletions;
                          if (!((unint64_t)acCompletions | *((void *)a3 + 1))
                            || (int v5 = -[NSMutableArray isEqual:](acCompletions, "isEqual:")) != 0)
                          {
                            __int16 has = (__int16)self->_has;
                            __int16 v19 = *((_WORD *)a3 + 112);
                            if ((has & 0x200) != 0)
                            {
                              if ((*((_WORD *)a3 + 112) & 0x200) == 0 || self->_rssiValue != *((_DWORD *)a3 + 25)) {
                                goto LABEL_97;
                              }
                            }
                            else if ((*((_WORD *)a3 + 112) & 0x200) != 0)
                            {
                              goto LABEL_97;
                            }
                            if ((*(_WORD *)&self->_has & 0x400) != 0)
                            {
                              if ((*((_WORD *)a3 + 112) & 0x400) == 0 || self->_snrValue != *((_DWORD *)a3 + 44)) {
                                goto LABEL_97;
                              }
                            }
                            else if ((*((_WORD *)a3 + 112) & 0x400) != 0)
                            {
                              goto LABEL_97;
                            }
                            if (has)
                            {
                              if ((v19 & 1) == 0 || self->_ccaValue != *((_DWORD *)a3 + 6)) {
                                goto LABEL_97;
                              }
                            }
                            else if (v19)
                            {
                              goto LABEL_97;
                            }
                            if ((has & 8) != 0)
                            {
                              if ((v19 & 8) == 0 || self->_nfValue != *((_DWORD *)a3 + 16)) {
                                goto LABEL_97;
                              }
                            }
                            else if ((v19 & 8) != 0)
                            {
                              goto LABEL_97;
                            }
                            if ((has & 0x20) != 0)
                            {
                              if ((v19 & 0x20) == 0 || self->_ofdmDesense != *((_DWORD *)a3 + 18)) {
                                goto LABEL_97;
                              }
                            }
                            else if ((v19 & 0x20) != 0)
                            {
                              goto LABEL_97;
                            }
                            if ((has & 2) != 0)
                            {
                              if ((v19 & 2) == 0 || self->_ibssCCA != *((_DWORD *)a3 + 14)) {
                                goto LABEL_97;
                              }
                            }
                            else if ((v19 & 2) != 0)
                            {
                              goto LABEL_97;
                            }
                            if ((has & 0x10) != 0)
                            {
                              if ((v19 & 0x10) == 0 || self->_obssCCA != *((_DWORD *)a3 + 17)) {
                                goto LABEL_97;
                              }
                            }
                            else if ((v19 & 0x10) != 0)
                            {
                              goto LABEL_97;
                            }
                            if ((has & 4) != 0)
                            {
                              if ((v19 & 4) == 0 || self->_interferenceCCA != *((_DWORD *)a3 + 15)) {
                                goto LABEL_97;
                              }
                            }
                            else if ((v19 & 4) != 0)
                            {
                              goto LABEL_97;
                            }
                            if ((has & 0x40) != 0)
                            {
                              if ((v19 & 0x40) == 0 || self->_qbssCCA != *((_DWORD *)a3 + 22)) {
                                goto LABEL_97;
                              }
                            }
                            else if ((v19 & 0x40) != 0)
                            {
                              goto LABEL_97;
                            }
                            if ((has & 0x80) != 0)
                            {
                              if ((v19 & 0x80) == 0 || self->_qbssSTACount != *((_DWORD *)a3 + 23)) {
                                goto LABEL_97;
                              }
                            }
                            else if ((v19 & 0x80) != 0)
                            {
                              goto LABEL_97;
                            }
                            rxLatencyTID0s = self->_rxLatencyTID0s;
                            if (!((unint64_t)rxLatencyTID0s | *((void *)a3 + 14))
                              || (int v5 = -[NSMutableArray isEqual:](rxLatencyTID0s, "isEqual:")) != 0)
                            {
                              rxLatencyTID1s = self->_rxLatencyTID1s;
                              if (!((unint64_t)rxLatencyTID1s | *((void *)a3 + 15))
                                || (int v5 = -[NSMutableArray isEqual:](rxLatencyTID1s, "isEqual:")) != 0)
                              {
                                rxLatencyTID2s = self->_rxLatencyTID2s;
                                if (!((unint64_t)rxLatencyTID2s | *((void *)a3 + 16))
                                  || (int v5 = -[NSMutableArray isEqual:](rxLatencyTID2s, "isEqual:")) != 0)
                                {
                                  rxLatencyTID3s = self->_rxLatencyTID3s;
                                  if (!((unint64_t)rxLatencyTID3s | *((void *)a3 + 17))
                                    || (int v5 = -[NSMutableArray isEqual:](rxLatencyTID3s, "isEqual:")) != 0)
                                  {
                                    rxLatencyTID4s = self->_rxLatencyTID4s;
                                    if (!((unint64_t)rxLatencyTID4s | *((void *)a3 + 18))
                                      || (int v5 = -[NSMutableArray isEqual:](rxLatencyTID4s, "isEqual:")) != 0)
                                    {
                                      rxLatencyTID5s = self->_rxLatencyTID5s;
                                      if (!((unint64_t)rxLatencyTID5s | *((void *)a3 + 19))
                                        || (int v5 = -[NSMutableArray isEqual:](rxLatencyTID5s, "isEqual:")) != 0)
                                      {
                                        rxLatencyTID6s = self->_rxLatencyTID6s;
                                        if (!((unint64_t)rxLatencyTID6s | *((void *)a3 + 20))
                                          || (int v5 = -[NSMutableArray isEqual:](rxLatencyTID6s, "isEqual:")) != 0)
                                        {
                                          rxLatencyTID7s = self->_rxLatencyTID7s;
                                          if ((unint64_t)rxLatencyTID7s | *((void *)a3 + 21))
                                          {
                                            LOBYTE(v5) = -[NSMutableArray isEqual:](rxLatencyTID7s, "isEqual:");
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
  }
  return v5;
}

- (unint64_t)hash
{
  if ((*(_WORD *)&self->_has & 0x100) != 0) {
    uint64_t v35 = 2654435761 * self->_role;
  }
  else {
    uint64_t v35 = 0;
  }
  NSUInteger v34 = [(NSString *)self->_hashID hash];
  uint64_t v33 = [(NSMutableArray *)self->_rssis hash];
  uint64_t v32 = [(NSMutableArray *)self->_ccas hash];
  uint64_t v31 = [(NSMutableArray *)self->_snrs hash];
  uint64_t v3 = [(NSMutableArray *)self->_packets hash];
  uint64_t v4 = [(NSMutableArray *)self->_bytes hash];
  uint64_t v5 = [(NSMutableArray *)self->_txLatencyBKs hash];
  uint64_t v6 = [(NSMutableArray *)self->_txLatencyBEs hash];
  uint64_t v7 = [(NSMutableArray *)self->_txLatencyVOs hash];
  uint64_t v8 = [(NSMutableArray *)self->_txLatencyVIs hash];
  unint64_t v9 = [(AWDWiFiNWActivityTxCompletions *)self->_completions hash];
  uint64_t v10 = [(NSMutableArray *)self->_acCompletions hash];
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) != 0)
  {
    uint64_t v12 = 2654435761 * self->_rssiValue;
    if ((*(_WORD *)&self->_has & 0x400) != 0)
    {
LABEL_6:
      uint64_t v13 = 2654435761 * self->_snrValue;
      if (has) {
        goto LABEL_7;
      }
      goto LABEL_17;
    }
  }
  else
  {
    uint64_t v12 = 0;
    if ((*(_WORD *)&self->_has & 0x400) != 0) {
      goto LABEL_6;
    }
  }
  uint64_t v13 = 0;
  if (has)
  {
LABEL_7:
    uint64_t v14 = 2654435761 * self->_ccaValue;
    if ((has & 8) != 0) {
      goto LABEL_8;
    }
    goto LABEL_18;
  }
LABEL_17:
  uint64_t v14 = 0;
  if ((has & 8) != 0)
  {
LABEL_8:
    uint64_t v15 = 2654435761 * self->_nfValue;
    if ((has & 0x20) != 0) {
      goto LABEL_9;
    }
    goto LABEL_19;
  }
LABEL_18:
  uint64_t v15 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_9:
    uint64_t v16 = 2654435761 * self->_ofdmDesense;
    if ((has & 2) != 0) {
      goto LABEL_10;
    }
    goto LABEL_20;
  }
LABEL_19:
  uint64_t v16 = 0;
  if ((has & 2) != 0)
  {
LABEL_10:
    uint64_t v17 = 2654435761 * self->_ibssCCA;
    if ((has & 0x10) != 0) {
      goto LABEL_11;
    }
    goto LABEL_21;
  }
LABEL_20:
  uint64_t v17 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_11:
    uint64_t v18 = 2654435761 * self->_obssCCA;
    if ((has & 4) != 0) {
      goto LABEL_12;
    }
    goto LABEL_22;
  }
LABEL_21:
  uint64_t v18 = 0;
  if ((has & 4) != 0)
  {
LABEL_12:
    uint64_t v19 = 2654435761 * self->_interferenceCCA;
    if ((has & 0x40) != 0) {
      goto LABEL_13;
    }
LABEL_23:
    uint64_t v20 = 0;
    if ((has & 0x80) != 0) {
      goto LABEL_14;
    }
LABEL_24:
    uint64_t v21 = 0;
    goto LABEL_25;
  }
LABEL_22:
  uint64_t v19 = 0;
  if ((has & 0x40) == 0) {
    goto LABEL_23;
  }
LABEL_13:
  uint64_t v20 = 2654435761 * self->_qbssCCA;
  if ((has & 0x80) == 0) {
    goto LABEL_24;
  }
LABEL_14:
  uint64_t v21 = 2654435761 * self->_qbssSTACount;
LABEL_25:
  NSUInteger v22 = v34 ^ v35 ^ v33 ^ v32 ^ v31 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v12 ^ v13 ^ v14;
  uint64_t v23 = v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ [(NSMutableArray *)self->_rxLatencyTID0s hash];
  uint64_t v24 = v23 ^ [(NSMutableArray *)self->_rxLatencyTID1s hash];
  uint64_t v25 = v24 ^ [(NSMutableArray *)self->_rxLatencyTID2s hash];
  uint64_t v26 = v25 ^ [(NSMutableArray *)self->_rxLatencyTID3s hash];
  uint64_t v27 = v22 ^ v26 ^ [(NSMutableArray *)self->_rxLatencyTID4s hash];
  uint64_t v28 = [(NSMutableArray *)self->_rxLatencyTID5s hash];
  uint64_t v29 = v28 ^ [(NSMutableArray *)self->_rxLatencyTID6s hash];
  return v27 ^ v29 ^ [(NSMutableArray *)self->_rxLatencyTID7s hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v188 = *MEMORY[0x263EF8340];
  if ((*((_WORD *)a3 + 112) & 0x100) != 0)
  {
    self->_uint64_t role = *((_DWORD *)a3 + 24);
    *(_WORD *)&self->_has |= 0x100u;
  }
  if (*((void *)a3 + 6)) {
    -[AWDWiFiNWActivityPeerStats setHashID:](self, "setHashID:");
  }
  long long v169 = 0u;
  long long v168 = 0u;
  long long v167 = 0u;
  long long v166 = 0u;
  uint64_t v5 = (void *)*((void *)a3 + 13);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v166 objects:v187 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v167;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v167 != v8) {
          objc_enumerationMutation(v5);
        }
        [(AWDWiFiNWActivityPeerStats *)self addRssi:*(void *)(*((void *)&v166 + 1) + 8 * i)];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v166 objects:v187 count:16];
    }
    while (v7);
  }
  long long v165 = 0u;
  long long v164 = 0u;
  long long v163 = 0u;
  long long v162 = 0u;
  uint64_t v10 = (void *)*((void *)a3 + 4);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v162 objects:v186 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v163;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v163 != v13) {
          objc_enumerationMutation(v10);
        }
        [(AWDWiFiNWActivityPeerStats *)self addCca:*(void *)(*((void *)&v162 + 1) + 8 * j)];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v162 objects:v186 count:16];
    }
    while (v12);
  }
  long long v160 = 0u;
  long long v161 = 0u;
  long long v158 = 0u;
  long long v159 = 0u;
  uint64_t v15 = (void *)*((void *)a3 + 23);
  uint64_t v16 = [v15 countByEnumeratingWithState:&v158 objects:v185 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v159;
    do
    {
      for (uint64_t k = 0; k != v17; ++k)
      {
        if (*(void *)v159 != v18) {
          objc_enumerationMutation(v15);
        }
        [(AWDWiFiNWActivityPeerStats *)self addSnr:*(void *)(*((void *)&v158 + 1) + 8 * k)];
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v158 objects:v185 count:16];
    }
    while (v17);
  }
  long long v156 = 0u;
  long long v157 = 0u;
  long long v154 = 0u;
  long long v155 = 0u;
  uint64_t v20 = (void *)*((void *)a3 + 10);
  uint64_t v21 = [v20 countByEnumeratingWithState:&v154 objects:v184 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v155;
    do
    {
      for (uint64_t m = 0; m != v22; ++m)
      {
        if (*(void *)v155 != v23) {
          objc_enumerationMutation(v20);
        }
        [(AWDWiFiNWActivityPeerStats *)self addPackets:*(void *)(*((void *)&v154 + 1) + 8 * m)];
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v154 objects:v184 count:16];
    }
    while (v22);
  }
  long long v152 = 0u;
  long long v153 = 0u;
  long long v150 = 0u;
  long long v151 = 0u;
  uint64_t v25 = (void *)*((void *)a3 + 2);
  uint64_t v26 = [v25 countByEnumeratingWithState:&v150 objects:v183 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v151;
    do
    {
      for (uint64_t n = 0; n != v27; ++n)
      {
        if (*(void *)v151 != v28) {
          objc_enumerationMutation(v25);
        }
        [(AWDWiFiNWActivityPeerStats *)self addBytes:*(void *)(*((void *)&v150 + 1) + 8 * n)];
      }
      uint64_t v27 = [v25 countByEnumeratingWithState:&v150 objects:v183 count:16];
    }
    while (v27);
  }
  long long v148 = 0u;
  long long v149 = 0u;
  long long v146 = 0u;
  long long v147 = 0u;
  unint64_t v30 = (void *)*((void *)a3 + 25);
  uint64_t v31 = [v30 countByEnumeratingWithState:&v146 objects:v182 count:16];
  if (v31)
  {
    uint64_t v32 = v31;
    uint64_t v33 = *(void *)v147;
    do
    {
      for (iuint64_t i = 0; ii != v32; ++ii)
      {
        if (*(void *)v147 != v33) {
          objc_enumerationMutation(v30);
        }
        [(AWDWiFiNWActivityPeerStats *)self addTxLatencyBK:*(void *)(*((void *)&v146 + 1) + 8 * ii)];
      }
      uint64_t v32 = [v30 countByEnumeratingWithState:&v146 objects:v182 count:16];
    }
    while (v32);
  }
  long long v144 = 0u;
  long long v145 = 0u;
  long long v142 = 0u;
  long long v143 = 0u;
  uint64_t v35 = (void *)*((void *)a3 + 24);
  uint64_t v36 = [v35 countByEnumeratingWithState:&v142 objects:v181 count:16];
  if (v36)
  {
    uint64_t v37 = v36;
    uint64_t v38 = *(void *)v143;
    do
    {
      for (juint64_t j = 0; jj != v37; ++jj)
      {
        if (*(void *)v143 != v38) {
          objc_enumerationMutation(v35);
        }
        [(AWDWiFiNWActivityPeerStats *)self addTxLatencyBE:*(void *)(*((void *)&v142 + 1) + 8 * jj)];
      }
      uint64_t v37 = [v35 countByEnumeratingWithState:&v142 objects:v181 count:16];
    }
    while (v37);
  }
  long long v140 = 0u;
  long long v141 = 0u;
  long long v138 = 0u;
  long long v139 = 0u;
  uint64_t v40 = (void *)*((void *)a3 + 27);
  uint64_t v41 = [v40 countByEnumeratingWithState:&v138 objects:v180 count:16];
  if (v41)
  {
    uint64_t v42 = v41;
    uint64_t v43 = *(void *)v139;
    do
    {
      for (kuint64_t k = 0; kk != v42; ++kk)
      {
        if (*(void *)v139 != v43) {
          objc_enumerationMutation(v40);
        }
        [(AWDWiFiNWActivityPeerStats *)self addTxLatencyVO:*(void *)(*((void *)&v138 + 1) + 8 * kk)];
      }
      uint64_t v42 = [v40 countByEnumeratingWithState:&v138 objects:v180 count:16];
    }
    while (v42);
  }
  long long v136 = 0u;
  long long v137 = 0u;
  long long v134 = 0u;
  long long v135 = 0u;
  uint64_t v45 = (void *)*((void *)a3 + 26);
  uint64_t v46 = [v45 countByEnumeratingWithState:&v134 objects:v179 count:16];
  if (v46)
  {
    uint64_t v47 = v46;
    uint64_t v48 = *(void *)v135;
    do
    {
      for (muint64_t m = 0; mm != v47; ++mm)
      {
        if (*(void *)v135 != v48) {
          objc_enumerationMutation(v45);
        }
        [(AWDWiFiNWActivityPeerStats *)self addTxLatencyVI:*(void *)(*((void *)&v134 + 1) + 8 * mm)];
      }
      uint64_t v47 = [v45 countByEnumeratingWithState:&v134 objects:v179 count:16];
    }
    while (v47);
  }
  completions = self->_completions;
  uint64_t v51 = *((void *)a3 + 5);
  if (completions)
  {
    if (v51) {
      -[AWDWiFiNWActivityTxCompletions mergeFrom:](completions, "mergeFrom:");
    }
  }
  else if (v51)
  {
    -[AWDWiFiNWActivityPeerStats setCompletions:](self, "setCompletions:");
  }
  long long v132 = 0u;
  long long v133 = 0u;
  long long v130 = 0u;
  long long v131 = 0u;
  uint64_t v52 = (void *)*((void *)a3 + 1);
  uint64_t v53 = [v52 countByEnumeratingWithState:&v130 objects:v178 count:16];
  if (v53)
  {
    uint64_t v54 = v53;
    uint64_t v55 = *(void *)v131;
    do
    {
      for (nuint64_t n = 0; nn != v54; ++nn)
      {
        if (*(void *)v131 != v55) {
          objc_enumerationMutation(v52);
        }
        [(AWDWiFiNWActivityPeerStats *)self addAcCompletions:*(void *)(*((void *)&v130 + 1) + 8 * nn)];
      }
      uint64_t v54 = [v52 countByEnumeratingWithState:&v130 objects:v178 count:16];
    }
    while (v54);
  }
  __int16 v57 = *((_WORD *)a3 + 112);
  if ((v57 & 0x200) != 0)
  {
    self->_rssiValue = *((_DWORD *)a3 + 25);
    *(_WORD *)&self->_has |= 0x200u;
    __int16 v57 = *((_WORD *)a3 + 112);
    if ((v57 & 0x400) == 0)
    {
LABEL_82:
      if ((v57 & 1) == 0) {
        goto LABEL_83;
      }
      goto LABEL_150;
    }
  }
  else if ((*((_WORD *)a3 + 112) & 0x400) == 0)
  {
    goto LABEL_82;
  }
  self->_snrValue = *((_DWORD *)a3 + 44);
  *(_WORD *)&self->_has |= 0x400u;
  __int16 v57 = *((_WORD *)a3 + 112);
  if ((v57 & 1) == 0)
  {
LABEL_83:
    if ((v57 & 8) == 0) {
      goto LABEL_84;
    }
    goto LABEL_151;
  }
LABEL_150:
  self->_ccaValue = *((_DWORD *)a3 + 6);
  *(_WORD *)&self->_has |= 1u;
  __int16 v57 = *((_WORD *)a3 + 112);
  if ((v57 & 8) == 0)
  {
LABEL_84:
    if ((v57 & 0x20) == 0) {
      goto LABEL_85;
    }
    goto LABEL_152;
  }
LABEL_151:
  self->_nfValue = *((_DWORD *)a3 + 16);
  *(_WORD *)&self->_has |= 8u;
  __int16 v57 = *((_WORD *)a3 + 112);
  if ((v57 & 0x20) == 0)
  {
LABEL_85:
    if ((v57 & 2) == 0) {
      goto LABEL_86;
    }
    goto LABEL_153;
  }
LABEL_152:
  self->_ofdmDesense = *((_DWORD *)a3 + 18);
  *(_WORD *)&self->_has |= 0x20u;
  __int16 v57 = *((_WORD *)a3 + 112);
  if ((v57 & 2) == 0)
  {
LABEL_86:
    if ((v57 & 0x10) == 0) {
      goto LABEL_87;
    }
    goto LABEL_154;
  }
LABEL_153:
  self->_ibssCCA = *((_DWORD *)a3 + 14);
  *(_WORD *)&self->_has |= 2u;
  __int16 v57 = *((_WORD *)a3 + 112);
  if ((v57 & 0x10) == 0)
  {
LABEL_87:
    if ((v57 & 4) == 0) {
      goto LABEL_88;
    }
    goto LABEL_155;
  }
LABEL_154:
  self->_obssCCA = *((_DWORD *)a3 + 17);
  *(_WORD *)&self->_has |= 0x10u;
  __int16 v57 = *((_WORD *)a3 + 112);
  if ((v57 & 4) == 0)
  {
LABEL_88:
    if ((v57 & 0x40) == 0) {
      goto LABEL_89;
    }
    goto LABEL_156;
  }
LABEL_155:
  self->_interferenceCCA = *((_DWORD *)a3 + 15);
  *(_WORD *)&self->_has |= 4u;
  __int16 v57 = *((_WORD *)a3 + 112);
  if ((v57 & 0x40) == 0)
  {
LABEL_89:
    if ((v57 & 0x80) == 0) {
      goto LABEL_91;
    }
    goto LABEL_90;
  }
LABEL_156:
  self->_qbssCCA = *((_DWORD *)a3 + 22);
  *(_WORD *)&self->_has |= 0x40u;
  if ((*((_WORD *)a3 + 112) & 0x80) != 0)
  {
LABEL_90:
    self->_qbssSTACount = *((_DWORD *)a3 + 23);
    *(_WORD *)&self->_has |= 0x80u;
  }
LABEL_91:
  long long v128 = 0u;
  long long v129 = 0u;
  long long v126 = 0u;
  long long v127 = 0u;
  uint64_t v58 = (void *)*((void *)a3 + 14);
  uint64_t v59 = [v58 countByEnumeratingWithState:&v126 objects:v177 count:16];
  if (v59)
  {
    uint64_t v60 = v59;
    uint64_t v61 = *(void *)v127;
    do
    {
      for (uint64_t i1 = 0; i1 != v60; ++i1)
      {
        if (*(void *)v127 != v61) {
          objc_enumerationMutation(v58);
        }
        [(AWDWiFiNWActivityPeerStats *)self addRxLatencyTID0:*(void *)(*((void *)&v126 + 1) + 8 * i1)];
      }
      uint64_t v60 = [v58 countByEnumeratingWithState:&v126 objects:v177 count:16];
    }
    while (v60);
  }
  long long v124 = 0u;
  long long v125 = 0u;
  long long v122 = 0u;
  long long v123 = 0u;
  uint64_t v63 = (void *)*((void *)a3 + 15);
  uint64_t v64 = [v63 countByEnumeratingWithState:&v122 objects:v176 count:16];
  if (v64)
  {
    uint64_t v65 = v64;
    uint64_t v66 = *(void *)v123;
    do
    {
      for (uint64_t i2 = 0; i2 != v65; ++i2)
      {
        if (*(void *)v123 != v66) {
          objc_enumerationMutation(v63);
        }
        [(AWDWiFiNWActivityPeerStats *)self addRxLatencyTID1:*(void *)(*((void *)&v122 + 1) + 8 * i2)];
      }
      uint64_t v65 = [v63 countByEnumeratingWithState:&v122 objects:v176 count:16];
    }
    while (v65);
  }
  long long v120 = 0u;
  long long v121 = 0u;
  long long v118 = 0u;
  long long v119 = 0u;
  uint64_t v68 = (void *)*((void *)a3 + 16);
  uint64_t v69 = [v68 countByEnumeratingWithState:&v118 objects:v175 count:16];
  if (v69)
  {
    uint64_t v70 = v69;
    uint64_t v71 = *(void *)v119;
    do
    {
      for (uint64_t i3 = 0; i3 != v70; ++i3)
      {
        if (*(void *)v119 != v71) {
          objc_enumerationMutation(v68);
        }
        [(AWDWiFiNWActivityPeerStats *)self addRxLatencyTID2:*(void *)(*((void *)&v118 + 1) + 8 * i3)];
      }
      uint64_t v70 = [v68 countByEnumeratingWithState:&v118 objects:v175 count:16];
    }
    while (v70);
  }
  long long v116 = 0u;
  long long v117 = 0u;
  long long v114 = 0u;
  long long v115 = 0u;
  uint64_t v73 = (void *)*((void *)a3 + 17);
  uint64_t v74 = [v73 countByEnumeratingWithState:&v114 objects:v174 count:16];
  if (v74)
  {
    uint64_t v75 = v74;
    uint64_t v76 = *(void *)v115;
    do
    {
      for (uint64_t i4 = 0; i4 != v75; ++i4)
      {
        if (*(void *)v115 != v76) {
          objc_enumerationMutation(v73);
        }
        [(AWDWiFiNWActivityPeerStats *)self addRxLatencyTID3:*(void *)(*((void *)&v114 + 1) + 8 * i4)];
      }
      uint64_t v75 = [v73 countByEnumeratingWithState:&v114 objects:v174 count:16];
    }
    while (v75);
  }
  long long v112 = 0u;
  long long v113 = 0u;
  long long v110 = 0u;
  long long v111 = 0u;
  uint64_t v78 = (void *)*((void *)a3 + 18);
  uint64_t v79 = [v78 countByEnumeratingWithState:&v110 objects:v173 count:16];
  if (v79)
  {
    uint64_t v80 = v79;
    uint64_t v81 = *(void *)v111;
    do
    {
      for (uint64_t i5 = 0; i5 != v80; ++i5)
      {
        if (*(void *)v111 != v81) {
          objc_enumerationMutation(v78);
        }
        [(AWDWiFiNWActivityPeerStats *)self addRxLatencyTID4:*(void *)(*((void *)&v110 + 1) + 8 * i5)];
      }
      uint64_t v80 = [v78 countByEnumeratingWithState:&v110 objects:v173 count:16];
    }
    while (v80);
  }
  long long v108 = 0u;
  long long v109 = 0u;
  long long v106 = 0u;
  long long v107 = 0u;
  uint64_t v83 = (void *)*((void *)a3 + 19);
  uint64_t v84 = [v83 countByEnumeratingWithState:&v106 objects:v172 count:16];
  if (v84)
  {
    uint64_t v85 = v84;
    uint64_t v86 = *(void *)v107;
    do
    {
      for (uint64_t i6 = 0; i6 != v85; ++i6)
      {
        if (*(void *)v107 != v86) {
          objc_enumerationMutation(v83);
        }
        [(AWDWiFiNWActivityPeerStats *)self addRxLatencyTID5:*(void *)(*((void *)&v106 + 1) + 8 * i6)];
      }
      uint64_t v85 = [v83 countByEnumeratingWithState:&v106 objects:v172 count:16];
    }
    while (v85);
  }
  long long v104 = 0u;
  long long v105 = 0u;
  long long v102 = 0u;
  long long v103 = 0u;
  uint64_t v88 = (void *)*((void *)a3 + 20);
  uint64_t v89 = [v88 countByEnumeratingWithState:&v102 objects:v171 count:16];
  if (v89)
  {
    uint64_t v90 = v89;
    uint64_t v91 = *(void *)v103;
    do
    {
      for (uint64_t i7 = 0; i7 != v90; ++i7)
      {
        if (*(void *)v103 != v91) {
          objc_enumerationMutation(v88);
        }
        [(AWDWiFiNWActivityPeerStats *)self addRxLatencyTID6:*(void *)(*((void *)&v102 + 1) + 8 * i7)];
      }
      uint64_t v90 = [v88 countByEnumeratingWithState:&v102 objects:v171 count:16];
    }
    while (v90);
  }
  long long v100 = 0u;
  long long v101 = 0u;
  long long v98 = 0u;
  long long v99 = 0u;
  uint64_t v93 = (void *)*((void *)a3 + 21);
  uint64_t v94 = [v93 countByEnumeratingWithState:&v98 objects:v170 count:16];
  if (v94)
  {
    uint64_t v95 = v94;
    uint64_t v96 = *(void *)v99;
    do
    {
      for (uint64_t i8 = 0; i8 != v95; ++i8)
      {
        if (*(void *)v99 != v96) {
          objc_enumerationMutation(v93);
        }
        [(AWDWiFiNWActivityPeerStats *)self addRxLatencyTID7:*(void *)(*((void *)&v98 + 1) + 8 * i8)];
      }
      uint64_t v95 = [v93 countByEnumeratingWithState:&v98 objects:v170 count:16];
    }
    while (v95);
  }
}

- (NSString)hashID
{
  return self->_hashID;
}

- (void)setHashID:(id)a3
{
}

- (NSMutableArray)rssis
{
  return self->_rssis;
}

- (void)setRssis:(id)a3
{
}

- (NSMutableArray)ccas
{
  return self->_ccas;
}

- (void)setCcas:(id)a3
{
}

- (NSMutableArray)snrs
{
  return self->_snrs;
}

- (void)setSnrs:(id)a3
{
}

- (NSMutableArray)packets
{
  return self->_packets;
}

- (void)setPackets:(id)a3
{
}

- (NSMutableArray)bytes
{
  return self->_bytes;
}

- (void)setBytes:(id)a3
{
}

- (NSMutableArray)txLatencyBKs
{
  return self->_txLatencyBKs;
}

- (void)setTxLatencyBKs:(id)a3
{
}

- (NSMutableArray)txLatencyBEs
{
  return self->_txLatencyBEs;
}

- (void)setTxLatencyBEs:(id)a3
{
}

- (NSMutableArray)txLatencyVOs
{
  return self->_txLatencyVOs;
}

- (void)setTxLatencyVOs:(id)a3
{
}

- (NSMutableArray)txLatencyVIs
{
  return self->_txLatencyVIs;
}

- (void)setTxLatencyVIs:(id)a3
{
}

- (AWDWiFiNWActivityTxCompletions)completions
{
  return self->_completions;
}

- (void)setCompletions:(id)a3
{
}

- (NSMutableArray)acCompletions
{
  return self->_acCompletions;
}

- (void)setAcCompletions:(id)a3
{
}

- (int)rssiValue
{
  return self->_rssiValue;
}

- (int)snrValue
{
  return self->_snrValue;
}

- (unsigned)ccaValue
{
  return self->_ccaValue;
}

- (int)nfValue
{
  return self->_nfValue;
}

- (unsigned)ofdmDesense
{
  return self->_ofdmDesense;
}

- (unsigned)ibssCCA
{
  return self->_ibssCCA;
}

- (unsigned)obssCCA
{
  return self->_obssCCA;
}

- (unsigned)interferenceCCA
{
  return self->_interferenceCCA;
}

- (unsigned)qbssCCA
{
  return self->_qbssCCA;
}

- (unsigned)qbssSTACount
{
  return self->_qbssSTACount;
}

- (NSMutableArray)rxLatencyTID0s
{
  return self->_rxLatencyTID0s;
}

- (void)setRxLatencyTID0s:(id)a3
{
}

- (NSMutableArray)rxLatencyTID1s
{
  return self->_rxLatencyTID1s;
}

- (void)setRxLatencyTID1s:(id)a3
{
}

- (NSMutableArray)rxLatencyTID2s
{
  return self->_rxLatencyTID2s;
}

- (void)setRxLatencyTID2s:(id)a3
{
}

- (NSMutableArray)rxLatencyTID3s
{
  return self->_rxLatencyTID3s;
}

- (void)setRxLatencyTID3s:(id)a3
{
}

- (NSMutableArray)rxLatencyTID4s
{
  return self->_rxLatencyTID4s;
}

- (void)setRxLatencyTID4s:(id)a3
{
}

- (NSMutableArray)rxLatencyTID5s
{
  return self->_rxLatencyTID5s;
}

- (void)setRxLatencyTID5s:(id)a3
{
}

- (NSMutableArray)rxLatencyTID6s
{
  return self->_rxLatencyTID6s;
}

- (void)setRxLatencyTID6s:(id)a3
{
}

- (NSMutableArray)rxLatencyTID7s
{
  return self->_rxLatencyTID7s;
}

- (void)setRxLatencyTID7s:(id)a3
{
}

@end