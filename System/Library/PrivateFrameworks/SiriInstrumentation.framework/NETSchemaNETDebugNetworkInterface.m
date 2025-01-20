@interface NETSchemaNETDebugNetworkInterface
- (BOOL)hasBytesReceived;
- (BOOL)hasBytesRetransmitted;
- (BOOL)hasBytesSent;
- (BOOL)hasBytesUnacked;
- (BOOL)hasDuplicateBytesReceived;
- (BOOL)hasNetworkInterface;
- (BOOL)hasOutOfOrderBytesReceived;
- (BOOL)hasPacketsReceived;
- (BOOL)hasPacketsSent;
- (BOOL)hasRttBest;
- (BOOL)hasRttCurrent;
- (BOOL)hasRttSmoothed;
- (BOOL)hasRttVariance;
- (BOOL)hasSendBandwidth;
- (BOOL)hasSendBufferBytes;
- (BOOL)hasSubflowSwitchCount;
- (BOOL)hasSynRetransmits;
- (BOOL)hasTfoSynDataAcked;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NETSchemaNETDebugNetworkInterface)initWithDictionary:(id)a3;
- (NETSchemaNETDebugNetworkInterface)initWithJSON:(id)a3;
- (NETSchemaNETNetworkInterface)networkInterface;
- (NSData)jsonData;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)bytesReceived;
- (unint64_t)bytesRetransmitted;
- (unint64_t)bytesSent;
- (unint64_t)bytesUnacked;
- (unint64_t)duplicateBytesReceived;
- (unint64_t)hash;
- (unint64_t)outOfOrderBytesReceived;
- (unint64_t)packetsReceived;
- (unint64_t)packetsSent;
- (unint64_t)sendBandwidth;
- (unint64_t)sendBufferBytes;
- (unsigned)rttBest;
- (unsigned)rttCurrent;
- (unsigned)rttSmoothed;
- (unsigned)rttVariance;
- (unsigned)subflowSwitchCount;
- (unsigned)synRetransmits;
- (unsigned)tfoSynDataAcked;
- (void)deleteBytesReceived;
- (void)deleteBytesRetransmitted;
- (void)deleteBytesSent;
- (void)deleteBytesUnacked;
- (void)deleteDuplicateBytesReceived;
- (void)deleteNetworkInterface;
- (void)deleteOutOfOrderBytesReceived;
- (void)deletePacketsReceived;
- (void)deletePacketsSent;
- (void)deleteRttBest;
- (void)deleteRttCurrent;
- (void)deleteRttSmoothed;
- (void)deleteRttVariance;
- (void)deleteSendBandwidth;
- (void)deleteSendBufferBytes;
- (void)deleteSubflowSwitchCount;
- (void)deleteSynRetransmits;
- (void)deleteTfoSynDataAcked;
- (void)setBytesReceived:(unint64_t)a3;
- (void)setBytesRetransmitted:(unint64_t)a3;
- (void)setBytesSent:(unint64_t)a3;
- (void)setBytesUnacked:(unint64_t)a3;
- (void)setDuplicateBytesReceived:(unint64_t)a3;
- (void)setHasBytesReceived:(BOOL)a3;
- (void)setHasBytesRetransmitted:(BOOL)a3;
- (void)setHasBytesSent:(BOOL)a3;
- (void)setHasBytesUnacked:(BOOL)a3;
- (void)setHasDuplicateBytesReceived:(BOOL)a3;
- (void)setHasNetworkInterface:(BOOL)a3;
- (void)setHasOutOfOrderBytesReceived:(BOOL)a3;
- (void)setHasPacketsReceived:(BOOL)a3;
- (void)setHasPacketsSent:(BOOL)a3;
- (void)setHasRttBest:(BOOL)a3;
- (void)setHasRttCurrent:(BOOL)a3;
- (void)setHasRttSmoothed:(BOOL)a3;
- (void)setHasRttVariance:(BOOL)a3;
- (void)setHasSendBandwidth:(BOOL)a3;
- (void)setHasSendBufferBytes:(BOOL)a3;
- (void)setHasSubflowSwitchCount:(BOOL)a3;
- (void)setHasSynRetransmits:(BOOL)a3;
- (void)setHasTfoSynDataAcked:(BOOL)a3;
- (void)setNetworkInterface:(id)a3;
- (void)setOutOfOrderBytesReceived:(unint64_t)a3;
- (void)setPacketsReceived:(unint64_t)a3;
- (void)setPacketsSent:(unint64_t)a3;
- (void)setRttBest:(unsigned int)a3;
- (void)setRttCurrent:(unsigned int)a3;
- (void)setRttSmoothed:(unsigned int)a3;
- (void)setRttVariance:(unsigned int)a3;
- (void)setSendBandwidth:(unint64_t)a3;
- (void)setSendBufferBytes:(unint64_t)a3;
- (void)setSubflowSwitchCount:(unsigned int)a3;
- (void)setSynRetransmits:(unsigned int)a3;
- (void)setTfoSynDataAcked:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation NETSchemaNETDebugNetworkInterface

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)NETSchemaNETDebugNetworkInterface;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(NETSchemaNETDebugNetworkInterface *)self networkInterface];
  v7 = [v6 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v7 suppressMessage];
  if (v4) {
    [(NETSchemaNETDebugNetworkInterface *)self deleteNetworkInterface];
  }
  return v5;
}

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
}

- (void)setHasNetworkInterface:(BOOL)a3
{
  *((unsigned char *)&self->_has + 3) = a3;
}

- (void)setNetworkInterface:(id)a3
{
}

- (NETSchemaNETNetworkInterface)networkInterface
{
  return self->_networkInterface;
}

- (unsigned)subflowSwitchCount
{
  return self->_subflowSwitchCount;
}

- (unsigned)tfoSynDataAcked
{
  return self->_tfoSynDataAcked;
}

- (unsigned)synRetransmits
{
  return self->_synRetransmits;
}

- (unint64_t)sendBandwidth
{
  return self->_sendBandwidth;
}

- (unint64_t)sendBufferBytes
{
  return self->_sendBufferBytes;
}

- (unint64_t)outOfOrderBytesReceived
{
  return self->_outOfOrderBytesReceived;
}

- (unint64_t)duplicateBytesReceived
{
  return self->_duplicateBytesReceived;
}

- (unint64_t)bytesReceived
{
  return self->_bytesReceived;
}

- (unint64_t)bytesUnacked
{
  return self->_bytesUnacked;
}

- (unint64_t)bytesRetransmitted
{
  return self->_bytesRetransmitted;
}

- (unint64_t)bytesSent
{
  return self->_bytesSent;
}

- (unint64_t)packetsReceived
{
  return self->_packetsReceived;
}

- (unint64_t)packetsSent
{
  return self->_packetsSent;
}

- (unsigned)rttBest
{
  return self->_rttBest;
}

- (unsigned)rttVariance
{
  return self->_rttVariance;
}

- (unsigned)rttSmoothed
{
  return self->_rttSmoothed;
}

- (unsigned)rttCurrent
{
  return self->_rttCurrent;
}

- (NETSchemaNETDebugNetworkInterface)initWithDictionary:(id)a3
{
  id v4 = a3;
  v43.receiver = self;
  v43.super_class = (Class)NETSchemaNETDebugNetworkInterface;
  v5 = [(NETSchemaNETDebugNetworkInterface *)&v43 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"rttCurrent"];
    objc_opt_class();
    v41 = v6;
    if (objc_opt_isKindOfClass()) {
      -[NETSchemaNETDebugNetworkInterface setRttCurrent:](v5, "setRttCurrent:", [v6 unsignedIntValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"rttSmoothed"];
    objc_opt_class();
    v39 = v7;
    if (objc_opt_isKindOfClass()) {
      -[NETSchemaNETDebugNetworkInterface setRttSmoothed:](v5, "setRttSmoothed:", [v7 unsignedIntValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"rttVariance"];
    objc_opt_class();
    v37 = v8;
    if (objc_opt_isKindOfClass()) {
      -[NETSchemaNETDebugNetworkInterface setRttVariance:](v5, "setRttVariance:", [v8 unsignedIntValue]);
    }
    objc_super v9 = [v4 objectForKeyedSubscript:@"rttBest"];
    objc_opt_class();
    v35 = v9;
    if (objc_opt_isKindOfClass()) {
      -[NETSchemaNETDebugNetworkInterface setRttBest:](v5, "setRttBest:", [v9 unsignedIntValue]);
    }
    v10 = [v4 objectForKeyedSubscript:@"packetsSent"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[NETSchemaNETDebugNetworkInterface setPacketsSent:](v5, "setPacketsSent:", [v10 unsignedLongLongValue]);
    }
    v11 = [v4 objectForKeyedSubscript:@"packetsReceived"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[NETSchemaNETDebugNetworkInterface setPacketsReceived:](v5, "setPacketsReceived:", [v11 unsignedLongLongValue]);
    }
    v12 = [v4 objectForKeyedSubscript:@"bytesSent"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[NETSchemaNETDebugNetworkInterface setBytesSent:](v5, "setBytesSent:", [v12 unsignedLongLongValue]);
    }
    v13 = [v4 objectForKeyedSubscript:@"bytesRetransmitted"];
    objc_opt_class();
    v42 = v13;
    if (objc_opt_isKindOfClass()) {
      -[NETSchemaNETDebugNetworkInterface setBytesRetransmitted:](v5, "setBytesRetransmitted:", [v13 unsignedLongLongValue]);
    }
    v14 = [v4 objectForKeyedSubscript:@"bytesUnacked"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[NETSchemaNETDebugNetworkInterface setBytesUnacked:](v5, "setBytesUnacked:", [v14 unsignedLongLongValue]);
    }
    v15 = [v4 objectForKeyedSubscript:@"bytesReceived"];
    objc_opt_class();
    v40 = v15;
    if (objc_opt_isKindOfClass()) {
      -[NETSchemaNETDebugNetworkInterface setBytesReceived:](v5, "setBytesReceived:", [v15 unsignedLongLongValue]);
    }
    v16 = [v4 objectForKeyedSubscript:@"duplicateBytesReceived"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[NETSchemaNETDebugNetworkInterface setDuplicateBytesReceived:](v5, "setDuplicateBytesReceived:", [v16 unsignedLongLongValue]);
    }
    v17 = [v4 objectForKeyedSubscript:@"outOfOrderBytesReceived"];
    objc_opt_class();
    v38 = v17;
    if (objc_opt_isKindOfClass()) {
      -[NETSchemaNETDebugNetworkInterface setOutOfOrderBytesReceived:](v5, "setOutOfOrderBytesReceived:", [v17 unsignedLongLongValue]);
    }
    v18 = [v4 objectForKeyedSubscript:@"sendBufferBytes"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[NETSchemaNETDebugNetworkInterface setSendBufferBytes:](v5, "setSendBufferBytes:", [v18 unsignedLongLongValue]);
    }
    v19 = [v4 objectForKeyedSubscript:@"sendBandwidth"];
    objc_opt_class();
    v36 = v19;
    if (objc_opt_isKindOfClass()) {
      -[NETSchemaNETDebugNetworkInterface setSendBandwidth:](v5, "setSendBandwidth:", [v19 unsignedLongLongValue]);
    }
    v20 = [v4 objectForKeyedSubscript:@"synRetransmits"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[NETSchemaNETDebugNetworkInterface setSynRetransmits:](v5, "setSynRetransmits:", [v20 unsignedIntValue]);
    }
    v34 = v12;
    v21 = [v4 objectForKeyedSubscript:@"tfoSynDataAcked"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[NETSchemaNETDebugNetworkInterface setTfoSynDataAcked:](v5, "setTfoSynDataAcked:", [v21 unsignedIntValue]);
    }
    v33 = v21;
    v22 = [v4 objectForKeyedSubscript:@"subflowSwitchCount"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[NETSchemaNETDebugNetworkInterface setSubflowSwitchCount:](v5, "setSubflowSwitchCount:", [v22 unsignedIntValue]);
    }
    v23 = [v4 objectForKeyedSubscript:@"networkInterface"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v32 = v11;
      v24 = v10;
      v25 = v20;
      v26 = v18;
      v27 = v16;
      v28 = v14;
      v29 = [[NETSchemaNETNetworkInterface alloc] initWithDictionary:v23];
      [(NETSchemaNETDebugNetworkInterface *)v5 setNetworkInterface:v29];

      v14 = v28;
      v16 = v27;
      v18 = v26;
      v20 = v25;
      v10 = v24;
      v11 = v32;
    }
    v30 = v5;
  }
  return v5;
}

- (NETSchemaNETDebugNetworkInterface)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(NETSchemaNETDebugNetworkInterface *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(NETSchemaNETDebugNetworkInterface *)self dictionaryRepresentation];
  if ([MEMORY[0x1E4F28D90] isValidJSONObject:v2])
  {
    v3 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v2 options:0 error:0];
  }
  else
  {
    v3 = 0;
  }

  return (NSData *)v3;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) != 0)
  {
    v8 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[NETSchemaNETDebugNetworkInterface bytesReceived](self, "bytesReceived"));
    [v3 setObject:v8 forKeyedSubscript:@"bytesReceived"];

    __int16 has = (__int16)self->_has;
    if ((has & 0x80) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((has & 0x80) == 0)
  {
    goto LABEL_3;
  }
  objc_super v9 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[NETSchemaNETDebugNetworkInterface bytesRetransmitted](self, "bytesRetransmitted"));
  [v3 setObject:v9 forKeyedSubscript:@"bytesRetransmitted"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 0x100) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  v10 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[NETSchemaNETDebugNetworkInterface bytesSent](self, "bytesSent"));
  [v3 setObject:v10 forKeyedSubscript:@"bytesSent"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_5:
    if ((has & 0x400) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_13:
  v11 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[NETSchemaNETDebugNetworkInterface bytesUnacked](self, "bytesUnacked"));
  [v3 setObject:v11 forKeyedSubscript:@"bytesUnacked"];

  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
LABEL_6:
    v5 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[NETSchemaNETDebugNetworkInterface duplicateBytesReceived](self, "duplicateBytesReceived"));
    [v3 setObject:v5 forKeyedSubscript:@"duplicateBytesReceived"];
  }
LABEL_7:
  if (self->_networkInterface)
  {
    v6 = [(NETSchemaNETDebugNetworkInterface *)self networkInterface];
    uint64_t v7 = [v6 dictionaryRepresentation];
    if (v7)
    {
      [v3 setObject:v7 forKeyedSubscript:@"networkInterface"];
    }
    else
    {
      v12 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v12 forKeyedSubscript:@"networkInterface"];
    }
  }
  $05ABC51B9D84A52C5925A35586C8713B v13 = self->_has;
  int v14 = *(_DWORD *)&v13 | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&v13 & 0x800) != 0)
  {
    v17 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[NETSchemaNETDebugNetworkInterface outOfOrderBytesReceived](self, "outOfOrderBytesReceived"));
    [v3 setObject:v17 forKeyedSubscript:@"outOfOrderBytesReceived"];

    $05ABC51B9D84A52C5925A35586C8713B v18 = self->_has;
    int v14 = *(_DWORD *)&v18 | (*((unsigned __int8 *)&self->_has + 2) << 16);
    if ((*(unsigned char *)&v18 & 0x20) == 0)
    {
LABEL_19:
      if ((v14 & 0x10) == 0) {
        goto LABEL_20;
      }
      goto LABEL_35;
    }
  }
  else if ((*(unsigned char *)&v13 & 0x20) == 0)
  {
    goto LABEL_19;
  }
  v19 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[NETSchemaNETDebugNetworkInterface packetsReceived](self, "packetsReceived"));
  [v3 setObject:v19 forKeyedSubscript:@"packetsReceived"];

  int v14 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x10) == 0)
  {
LABEL_20:
    if ((v14 & 8) == 0) {
      goto LABEL_21;
    }
    goto LABEL_36;
  }
LABEL_35:
  v20 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[NETSchemaNETDebugNetworkInterface packetsSent](self, "packetsSent"));
  [v3 setObject:v20 forKeyedSubscript:@"packetsSent"];

  int v14 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 8) == 0)
  {
LABEL_21:
    if ((v14 & 1) == 0) {
      goto LABEL_22;
    }
    goto LABEL_37;
  }
LABEL_36:
  v21 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[NETSchemaNETDebugNetworkInterface rttBest](self, "rttBest"));
  [v3 setObject:v21 forKeyedSubscript:@"rttBest"];

  int v14 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 1) == 0)
  {
LABEL_22:
    if ((v14 & 2) == 0) {
      goto LABEL_23;
    }
    goto LABEL_38;
  }
LABEL_37:
  v22 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[NETSchemaNETDebugNetworkInterface rttCurrent](self, "rttCurrent"));
  [v3 setObject:v22 forKeyedSubscript:@"rttCurrent"];

  int v14 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 2) == 0)
  {
LABEL_23:
    if ((v14 & 4) == 0) {
      goto LABEL_24;
    }
    goto LABEL_39;
  }
LABEL_38:
  v23 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[NETSchemaNETDebugNetworkInterface rttSmoothed](self, "rttSmoothed"));
  [v3 setObject:v23 forKeyedSubscript:@"rttSmoothed"];

  int v14 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 4) == 0)
  {
LABEL_24:
    if ((v14 & 0x2000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_40;
  }
LABEL_39:
  v24 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[NETSchemaNETDebugNetworkInterface rttVariance](self, "rttVariance"));
  [v3 setObject:v24 forKeyedSubscript:@"rttVariance"];

  int v14 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x2000) == 0)
  {
LABEL_25:
    if ((v14 & 0x1000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_41;
  }
LABEL_40:
  v25 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[NETSchemaNETDebugNetworkInterface sendBandwidth](self, "sendBandwidth"));
  [v3 setObject:v25 forKeyedSubscript:@"sendBandwidth"];

  int v14 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x1000) == 0)
  {
LABEL_26:
    if ((v14 & 0x10000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_42;
  }
LABEL_41:
  v26 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[NETSchemaNETDebugNetworkInterface sendBufferBytes](self, "sendBufferBytes"));
  [v3 setObject:v26 forKeyedSubscript:@"sendBufferBytes"];

  int v14 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((v14 & 0x10000) == 0)
  {
LABEL_27:
    if ((v14 & 0x4000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_43;
  }
LABEL_42:
  v27 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[NETSchemaNETDebugNetworkInterface subflowSwitchCount](self, "subflowSwitchCount"));
  [v3 setObject:v27 forKeyedSubscript:@"subflowSwitchCount"];

  LOWORD(v14) = self->_has;
  if ((v14 & 0x4000) == 0)
  {
LABEL_28:
    if ((v14 & 0x8000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_29;
  }
LABEL_43:
  v28 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[NETSchemaNETDebugNetworkInterface synRetransmits](self, "synRetransmits"));
  [v3 setObject:v28 forKeyedSubscript:@"synRetransmits"];

  if ((*(_WORD *)&self->_has & 0x8000) != 0)
  {
LABEL_29:
    v15 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[NETSchemaNETDebugNetworkInterface tfoSynDataAcked](self, "tfoSynDataAcked"));
    [v3 setObject:v15 forKeyedSubscript:@"tfoSynDataAcked"];
  }
LABEL_30:
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  $05ABC51B9D84A52C5925A35586C8713B has = self->_has;
  int v3 = *(_DWORD *)&has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if (*(unsigned char *)&has)
  {
    uint64_t v4 = 2654435761 * self->_rttCurrent;
    if ((v3 & 2) != 0)
    {
LABEL_3:
      uint64_t v5 = 2654435761 * self->_rttSmoothed;
      if ((v3 & 4) != 0) {
        goto LABEL_4;
      }
      goto LABEL_21;
    }
  }
  else
  {
    uint64_t v4 = 0;
    if ((v3 & 2) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v5 = 0;
  if ((v3 & 4) != 0)
  {
LABEL_4:
    uint64_t v6 = 2654435761 * self->_rttVariance;
    if ((v3 & 8) != 0) {
      goto LABEL_5;
    }
    goto LABEL_22;
  }
LABEL_21:
  uint64_t v6 = 0;
  if ((v3 & 8) != 0)
  {
LABEL_5:
    uint64_t v7 = 2654435761 * self->_rttBest;
    if ((v3 & 0x10) != 0) {
      goto LABEL_6;
    }
    goto LABEL_23;
  }
LABEL_22:
  uint64_t v7 = 0;
  if ((v3 & 0x10) != 0)
  {
LABEL_6:
    unint64_t v8 = 2654435761u * self->_packetsSent;
    if ((v3 & 0x20) != 0) {
      goto LABEL_7;
    }
    goto LABEL_24;
  }
LABEL_23:
  unint64_t v8 = 0;
  if ((v3 & 0x20) != 0)
  {
LABEL_7:
    unint64_t v9 = 2654435761u * self->_packetsReceived;
    if ((v3 & 0x40) != 0) {
      goto LABEL_8;
    }
    goto LABEL_25;
  }
LABEL_24:
  unint64_t v9 = 0;
  if ((v3 & 0x40) != 0)
  {
LABEL_8:
    unint64_t v10 = 2654435761u * self->_bytesSent;
    if ((v3 & 0x80) != 0) {
      goto LABEL_9;
    }
    goto LABEL_26;
  }
LABEL_25:
  unint64_t v10 = 0;
  if ((v3 & 0x80) != 0)
  {
LABEL_9:
    unint64_t v11 = 2654435761u * self->_bytesRetransmitted;
    if ((v3 & 0x100) != 0) {
      goto LABEL_10;
    }
    goto LABEL_27;
  }
LABEL_26:
  unint64_t v11 = 0;
  if ((v3 & 0x100) != 0)
  {
LABEL_10:
    unint64_t v12 = 2654435761u * self->_bytesUnacked;
    if ((v3 & 0x200) != 0) {
      goto LABEL_11;
    }
    goto LABEL_28;
  }
LABEL_27:
  unint64_t v12 = 0;
  if ((v3 & 0x200) != 0)
  {
LABEL_11:
    unint64_t v13 = 2654435761u * self->_bytesReceived;
    if ((v3 & 0x400) != 0) {
      goto LABEL_12;
    }
    goto LABEL_29;
  }
LABEL_28:
  unint64_t v13 = 0;
  if ((v3 & 0x400) != 0)
  {
LABEL_12:
    unint64_t v14 = 2654435761u * self->_duplicateBytesReceived;
    if ((v3 & 0x800) != 0) {
      goto LABEL_13;
    }
    goto LABEL_30;
  }
LABEL_29:
  unint64_t v14 = 0;
  if ((v3 & 0x800) != 0)
  {
LABEL_13:
    unint64_t v15 = 2654435761u * self->_outOfOrderBytesReceived;
    if ((v3 & 0x1000) != 0) {
      goto LABEL_14;
    }
    goto LABEL_31;
  }
LABEL_30:
  unint64_t v15 = 0;
  if ((v3 & 0x1000) != 0)
  {
LABEL_14:
    unint64_t v16 = 2654435761u * self->_sendBufferBytes;
    if ((v3 & 0x2000) != 0) {
      goto LABEL_15;
    }
    goto LABEL_32;
  }
LABEL_31:
  unint64_t v16 = 0;
  if ((v3 & 0x2000) != 0)
  {
LABEL_15:
    unint64_t v17 = 2654435761u * self->_sendBandwidth;
    if ((v3 & 0x4000) != 0) {
      goto LABEL_16;
    }
    goto LABEL_33;
  }
LABEL_32:
  unint64_t v17 = 0;
  if ((v3 & 0x4000) != 0)
  {
LABEL_16:
    uint64_t v18 = 2654435761 * self->_synRetransmits;
    if ((v3 & 0x8000) != 0) {
      goto LABEL_17;
    }
LABEL_34:
    uint64_t v19 = 0;
    if ((v3 & 0x10000) != 0) {
      goto LABEL_18;
    }
LABEL_35:
    uint64_t v20 = 0;
    return v5 ^ v4 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ [(NETSchemaNETNetworkInterface *)self->_networkInterface hash];
  }
LABEL_33:
  uint64_t v18 = 0;
  if ((v3 & 0x8000) == 0) {
    goto LABEL_34;
  }
LABEL_17:
  uint64_t v19 = 2654435761 * self->_tfoSynDataAcked;
  if ((v3 & 0x10000) == 0) {
    goto LABEL_35;
  }
LABEL_18:
  uint64_t v20 = 2654435761 * self->_subflowSwitchCount;
  return v5 ^ v4 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ [(NETSchemaNETNetworkInterface *)self->_networkInterface hash];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int16 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_74;
  }
  unsigned int v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  int v6 = *(_WORD *)&self->_has & 1;
  unsigned int v7 = v4[64] | (*((unsigned __int8 *)v4 + 130) << 16);
  if (v6 != (v4[64] & 1)) {
    goto LABEL_74;
  }
  if (v6)
  {
    unsigned int rttCurrent = self->_rttCurrent;
    if (rttCurrent != [v4 rttCurrent]) {
      goto LABEL_74;
    }
    unsigned int v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
    unsigned int v7 = v4[64] | (*((unsigned __int8 *)v4 + 130) << 16);
  }
  int v9 = (v5 >> 1) & 1;
  if (v9 == ((v7 >> 1) & 1))
  {
    if (v9)
    {
      unsigned int rttSmoothed = self->_rttSmoothed;
      if (rttSmoothed != [v4 rttSmoothed]) {
        goto LABEL_74;
      }
      unsigned int v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
      unsigned int v7 = v4[64] | (*((unsigned __int8 *)v4 + 130) << 16);
    }
    int v11 = (v5 >> 2) & 1;
    if (v11 == ((v7 >> 2) & 1))
    {
      if (v11)
      {
        unsigned int rttVariance = self->_rttVariance;
        if (rttVariance != [v4 rttVariance]) {
          goto LABEL_74;
        }
        unsigned int v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
        unsigned int v7 = v4[64] | (*((unsigned __int8 *)v4 + 130) << 16);
      }
      int v13 = (v5 >> 3) & 1;
      if (v13 == ((v7 >> 3) & 1))
      {
        if (v13)
        {
          unsigned int rttBest = self->_rttBest;
          if (rttBest != [v4 rttBest]) {
            goto LABEL_74;
          }
          unsigned int v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
          unsigned int v7 = v4[64] | (*((unsigned __int8 *)v4 + 130) << 16);
        }
        int v15 = (v5 >> 4) & 1;
        if (v15 == ((v7 >> 4) & 1))
        {
          if (v15)
          {
            unint64_t packetsSent = self->_packetsSent;
            if (packetsSent != [v4 packetsSent]) {
              goto LABEL_74;
            }
            unsigned int v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
            unsigned int v7 = v4[64] | (*((unsigned __int8 *)v4 + 130) << 16);
          }
          int v17 = (v5 >> 5) & 1;
          if (v17 == ((v7 >> 5) & 1))
          {
            if (v17)
            {
              unint64_t packetsReceived = self->_packetsReceived;
              if (packetsReceived != [v4 packetsReceived]) {
                goto LABEL_74;
              }
              unsigned int v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
              unsigned int v7 = v4[64] | (*((unsigned __int8 *)v4 + 130) << 16);
            }
            int v19 = (v5 >> 6) & 1;
            if (v19 == ((v7 >> 6) & 1))
            {
              if (v19)
              {
                unint64_t bytesSent = self->_bytesSent;
                if (bytesSent != [v4 bytesSent]) {
                  goto LABEL_74;
                }
                unsigned int v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
                unsigned int v7 = v4[64] | (*((unsigned __int8 *)v4 + 130) << 16);
              }
              int v21 = (v5 >> 7) & 1;
              if (v21 == ((v7 >> 7) & 1))
              {
                if (v21)
                {
                  unint64_t bytesRetransmitted = self->_bytesRetransmitted;
                  if (bytesRetransmitted != [v4 bytesRetransmitted]) {
                    goto LABEL_74;
                  }
                  unsigned int v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
                  unsigned int v7 = v4[64] | (*((unsigned __int8 *)v4 + 130) << 16);
                }
                int v23 = (v5 >> 8) & 1;
                if (v23 == ((v7 >> 8) & 1))
                {
                  if (v23)
                  {
                    unint64_t bytesUnacked = self->_bytesUnacked;
                    if (bytesUnacked != [v4 bytesUnacked]) {
                      goto LABEL_74;
                    }
                    unsigned int v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
                    unsigned int v7 = v4[64] | (*((unsigned __int8 *)v4 + 130) << 16);
                  }
                  int v25 = (v5 >> 9) & 1;
                  if (v25 == ((v7 >> 9) & 1))
                  {
                    if (v25)
                    {
                      unint64_t bytesReceived = self->_bytesReceived;
                      if (bytesReceived != [v4 bytesReceived]) {
                        goto LABEL_74;
                      }
                      unsigned int v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
                      unsigned int v7 = v4[64] | (*((unsigned __int8 *)v4 + 130) << 16);
                    }
                    int v27 = (v5 >> 10) & 1;
                    if (v27 == ((v7 >> 10) & 1))
                    {
                      if (v27)
                      {
                        unint64_t duplicateBytesReceived = self->_duplicateBytesReceived;
                        if (duplicateBytesReceived != [v4 duplicateBytesReceived]) {
                          goto LABEL_74;
                        }
                        unsigned int v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
                        unsigned int v7 = v4[64] | (*((unsigned __int8 *)v4 + 130) << 16);
                      }
                      int v29 = (v5 >> 11) & 1;
                      if (v29 == ((v7 >> 11) & 1))
                      {
                        if (v29)
                        {
                          unint64_t outOfOrderBytesReceived = self->_outOfOrderBytesReceived;
                          if (outOfOrderBytesReceived != [v4 outOfOrderBytesReceived]) {
                            goto LABEL_74;
                          }
                          unsigned int v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
                          unsigned int v7 = v4[64] | (*((unsigned __int8 *)v4 + 130) << 16);
                        }
                        int v31 = (v5 >> 12) & 1;
                        if (v31 == ((v7 >> 12) & 1))
                        {
                          if (v31)
                          {
                            unint64_t sendBufferBytes = self->_sendBufferBytes;
                            if (sendBufferBytes != [v4 sendBufferBytes]) {
                              goto LABEL_74;
                            }
                            unsigned int v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
                            unsigned int v7 = v4[64] | (*((unsigned __int8 *)v4 + 130) << 16);
                          }
                          int v33 = (v5 >> 13) & 1;
                          if (v33 == ((v7 >> 13) & 1))
                          {
                            if (v33)
                            {
                              unint64_t sendBandwidth = self->_sendBandwidth;
                              if (sendBandwidth != [v4 sendBandwidth]) {
                                goto LABEL_74;
                              }
                              unsigned int v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
                              unsigned int v7 = v4[64] | (*((unsigned __int8 *)v4 + 130) << 16);
                            }
                            int v35 = (v5 >> 14) & 1;
                            if (v35 == ((v7 >> 14) & 1))
                            {
                              if (v35)
                              {
                                unsigned int synRetransmits = self->_synRetransmits;
                                if (synRetransmits != [v4 synRetransmits]) {
                                  goto LABEL_74;
                                }
                                unsigned int v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
                                unsigned int v7 = v4[64] | (*((unsigned __int8 *)v4 + 130) << 16);
                              }
                              int v37 = (v5 >> 15) & 1;
                              if (v37 == ((v7 >> 15) & 1))
                              {
                                if (v37)
                                {
                                  unsigned int tfoSynDataAcked = self->_tfoSynDataAcked;
                                  if (tfoSynDataAcked != [v4 tfoSynDataAcked]) {
                                    goto LABEL_74;
                                  }
                                  unsigned int v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
                                  unsigned int v7 = v4[64] | (*((unsigned __int8 *)v4 + 130) << 16);
                                }
                                int v39 = HIWORD(v5) & 1;
                                if (v39 == (HIWORD(v7) & 1))
                                {
                                  if (!v39
                                    || (unsigned int subflowSwitchCount = self->_subflowSwitchCount,
                                        subflowSwitchCount == [v4 subflowSwitchCount]))
                                  {
                                    v41 = [(NETSchemaNETDebugNetworkInterface *)self networkInterface];
                                    v42 = [v4 networkInterface];
                                    objc_super v43 = v42;
                                    if ((v41 == 0) != (v42 != 0))
                                    {
                                      uint64_t v44 = [(NETSchemaNETDebugNetworkInterface *)self networkInterface];
                                      if (!v44)
                                      {

LABEL_77:
                                        BOOL v49 = 1;
                                        goto LABEL_75;
                                      }
                                      v45 = (void *)v44;
                                      v46 = [(NETSchemaNETDebugNetworkInterface *)self networkInterface];
                                      v47 = [v4 networkInterface];
                                      char v48 = [v46 isEqual:v47];

                                      if (v48) {
                                        goto LABEL_77;
                                      }
                                    }
                                    else
                                    {
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
LABEL_74:
  BOOL v49 = 0;
LABEL_75:

  return v49;
}

- (void)writeTo:(id)a3
{
  id v10 = a3;
  $05ABC51B9D84A52C5925A35586C8713B has = self->_has;
  int v5 = *(_DWORD *)&has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if (*(unsigned char *)&has)
  {
    PBDataWriterWriteUint32Field();
    $05ABC51B9D84A52C5925A35586C8713B v9 = self->_has;
    int v5 = *(_DWORD *)&v9 | (*((unsigned __int8 *)&self->_has + 2) << 16);
    if ((*(unsigned char *)&v9 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_26;
    }
  }
  else if ((*(unsigned char *)&has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  int v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 4) == 0)
  {
LABEL_4:
    if ((v5 & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_27;
  }
LABEL_26:
  PBDataWriterWriteUint32Field();
  int v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 8) == 0)
  {
LABEL_5:
    if ((v5 & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_28;
  }
LABEL_27:
  PBDataWriterWriteUint32Field();
  int v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x10) == 0)
  {
LABEL_6:
    if ((v5 & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_29;
  }
LABEL_28:
  PBDataWriterWriteUint64Field();
  int v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x20) == 0)
  {
LABEL_7:
    if ((v5 & 0x40) == 0) {
      goto LABEL_8;
    }
    goto LABEL_30;
  }
LABEL_29:
  PBDataWriterWriteUint64Field();
  int v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x40) == 0)
  {
LABEL_8:
    if ((v5 & 0x80) == 0) {
      goto LABEL_9;
    }
    goto LABEL_31;
  }
LABEL_30:
  PBDataWriterWriteUint64Field();
  int v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x80) == 0)
  {
LABEL_9:
    if ((v5 & 0x100) == 0) {
      goto LABEL_10;
    }
    goto LABEL_32;
  }
LABEL_31:
  PBDataWriterWriteUint64Field();
  int v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x100) == 0)
  {
LABEL_10:
    if ((v5 & 0x200) == 0) {
      goto LABEL_11;
    }
    goto LABEL_33;
  }
LABEL_32:
  PBDataWriterWriteUint64Field();
  int v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x200) == 0)
  {
LABEL_11:
    if ((v5 & 0x400) == 0) {
      goto LABEL_12;
    }
    goto LABEL_34;
  }
LABEL_33:
  PBDataWriterWriteUint64Field();
  int v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x400) == 0)
  {
LABEL_12:
    if ((v5 & 0x800) == 0) {
      goto LABEL_13;
    }
    goto LABEL_35;
  }
LABEL_34:
  PBDataWriterWriteUint64Field();
  int v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x800) == 0)
  {
LABEL_13:
    if ((v5 & 0x1000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_36;
  }
LABEL_35:
  PBDataWriterWriteUint64Field();
  int v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x1000) == 0)
  {
LABEL_14:
    if ((v5 & 0x2000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_37;
  }
LABEL_36:
  PBDataWriterWriteUint64Field();
  int v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x2000) == 0)
  {
LABEL_15:
    if ((v5 & 0x4000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_38;
  }
LABEL_37:
  PBDataWriterWriteUint64Field();
  int v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x4000) == 0)
  {
LABEL_16:
    if ((v5 & 0x8000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_39;
  }
LABEL_38:
  PBDataWriterWriteUint32Field();
  int v5 = *(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16);
  if ((*(_WORD *)&self->_has & 0x8000) == 0)
  {
LABEL_17:
    if ((v5 & 0x10000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
LABEL_39:
  PBDataWriterWriteUint32Field();
  if (((*(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16)) & 0x10000) != 0) {
LABEL_18:
  }
    PBDataWriterWriteUint32Field();
LABEL_19:
  int v6 = [(NETSchemaNETDebugNetworkInterface *)self networkInterface];

  unsigned int v7 = v10;
  if (v6)
  {
    unint64_t v8 = [(NETSchemaNETDebugNetworkInterface *)self networkInterface];
    PBDataWriterWriteSubmessage();

    unsigned int v7 = v10;
  }
}

- (BOOL)readFrom:(id)a3
{
  return NETSchemaNETDebugNetworkInterfaceReadFrom(self, (uint64_t)a3);
}

- (void)deleteNetworkInterface
{
}

- (BOOL)hasNetworkInterface
{
  return self->_networkInterface != 0;
}

- (void)deleteSubflowSwitchCount
{
  [(NETSchemaNETDebugNetworkInterface *)self setSubflowSwitchCount:0];
  $05ABC51B9D84A52C5925A35586C8713B has = self->_has;
  unsigned int v4 = (*(_DWORD *)&has | (*((unsigned __int8 *)&self->_has + 2) << 16)) & 0xFFFEFFFF;
  *(_WORD *)&self->_$05ABC51B9D84A52C5925A35586C8713B has = has;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (void)setHasSubflowSwitchCount:(BOOL)a3
{
  if (a3) {
    int v3 = 0x10000;
  }
  else {
    int v3 = 0;
  }
  unsigned int v4 = (*(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16)) & 0xFFFEFFFF;
  *(_WORD *)&self->_$05ABC51B9D84A52C5925A35586C8713B has = self->_has;
  *((unsigned char *)&self->_has + 2) = (v4 | v3) >> 16;
}

- (BOOL)hasSubflowSwitchCount
{
  return *((unsigned char *)&self->_has + 2) & 1;
}

- (void)setSubflowSwitchCount:(unsigned int)a3
{
  *((unsigned char *)&self->_has + 2) = (*(_WORD *)&self->_has | (*((unsigned __int8 *)&self->_has + 2) << 16) | 0x10000u) >> 16;
  self->_unsigned int subflowSwitchCount = a3;
}

- (void)deleteTfoSynDataAcked
{
  [(NETSchemaNETDebugNetworkInterface *)self setTfoSynDataAcked:0];
  $05ABC51B9D84A52C5925A35586C8713B has = self->_has;
  unsigned int v4 = *(_DWORD *)&has & 0xFFFF7FFF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_$05ABC51B9D84A52C5925A35586C8713B has = *(_WORD *)&has & 0x7FFF;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (void)setHasTfoSynDataAcked:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 0x8000;
  }
  else {
    __int16 v3 = 0;
  }
  int v4 = *(_WORD *)&self->_has & 0x7FFF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_$05ABC51B9D84A52C5925A35586C8713B has = *(_WORD *)&self->_has & 0x7FFF | v3;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (BOOL)hasTfoSynDataAcked
{
  return *(_WORD *)&self->_has >> 15;
}

- (void)setTfoSynDataAcked:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x8000u;
  self->_unsigned int tfoSynDataAcked = a3;
}

- (void)deleteSynRetransmits
{
  [(NETSchemaNETDebugNetworkInterface *)self setSynRetransmits:0];
  $05ABC51B9D84A52C5925A35586C8713B has = self->_has;
  unsigned int v4 = *(_DWORD *)&has & 0xFFFFBFFF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_$05ABC51B9D84A52C5925A35586C8713B has = *(_WORD *)&has & 0xBFFF;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (void)setHasSynRetransmits:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 0x4000;
  }
  else {
    __int16 v3 = 0;
  }
  int v4 = *(_WORD *)&self->_has & 0xBFFF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_$05ABC51B9D84A52C5925A35586C8713B has = *(_WORD *)&self->_has & 0xBFFF | v3;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (BOOL)hasSynRetransmits
{
  return (*(_WORD *)&self->_has >> 14) & 1;
}

- (void)setSynRetransmits:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x4000u;
  self->_unsigned int synRetransmits = a3;
}

- (void)deleteSendBandwidth
{
  [(NETSchemaNETDebugNetworkInterface *)self setSendBandwidth:0];
  $05ABC51B9D84A52C5925A35586C8713B has = self->_has;
  unsigned int v4 = *(_DWORD *)&has & 0xFFFFDFFF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_$05ABC51B9D84A52C5925A35586C8713B has = *(_WORD *)&has & 0xDFFF;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (void)setHasSendBandwidth:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 0x2000;
  }
  else {
    __int16 v3 = 0;
  }
  int v4 = *(_WORD *)&self->_has & 0xDFFF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_$05ABC51B9D84A52C5925A35586C8713B has = *(_WORD *)&self->_has & 0xDFFF | v3;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (BOOL)hasSendBandwidth
{
  return (*(_WORD *)&self->_has >> 13) & 1;
}

- (void)setSendBandwidth:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x2000u;
  self->_unint64_t sendBandwidth = a3;
}

- (void)deleteSendBufferBytes
{
  [(NETSchemaNETDebugNetworkInterface *)self setSendBufferBytes:0];
  $05ABC51B9D84A52C5925A35586C8713B has = self->_has;
  unsigned int v4 = *(_DWORD *)&has & 0xFFFFEFFF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_$05ABC51B9D84A52C5925A35586C8713B has = *(_WORD *)&has & 0xEFFF;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (void)setHasSendBufferBytes:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4096;
  }
  else {
    __int16 v3 = 0;
  }
  int v4 = *(_WORD *)&self->_has & 0xEFFF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_$05ABC51B9D84A52C5925A35586C8713B has = *(_WORD *)&self->_has & 0xEFFF | v3;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (BOOL)hasSendBufferBytes
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (void)setSendBufferBytes:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_unint64_t sendBufferBytes = a3;
}

- (void)deleteOutOfOrderBytesReceived
{
  [(NETSchemaNETDebugNetworkInterface *)self setOutOfOrderBytesReceived:0];
  $05ABC51B9D84A52C5925A35586C8713B has = self->_has;
  unsigned int v4 = *(_DWORD *)&has & 0xFFFFF7FF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_$05ABC51B9D84A52C5925A35586C8713B has = *(_WORD *)&has & 0xF7FF;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (void)setHasOutOfOrderBytesReceived:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2048;
  }
  else {
    __int16 v3 = 0;
  }
  int v4 = *(_WORD *)&self->_has & 0xF7FF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_$05ABC51B9D84A52C5925A35586C8713B has = *(_WORD *)&self->_has & 0xF7FF | v3;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (BOOL)hasOutOfOrderBytesReceived
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setOutOfOrderBytesReceived:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_unint64_t outOfOrderBytesReceived = a3;
}

- (void)deleteDuplicateBytesReceived
{
  [(NETSchemaNETDebugNetworkInterface *)self setDuplicateBytesReceived:0];
  $05ABC51B9D84A52C5925A35586C8713B has = self->_has;
  unsigned int v4 = *(_DWORD *)&has & 0xFFFFFBFF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_$05ABC51B9D84A52C5925A35586C8713B has = *(_WORD *)&has & 0xFBFF;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (void)setHasDuplicateBytesReceived:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  int v4 = *(_WORD *)&self->_has & 0xFBFF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_$05ABC51B9D84A52C5925A35586C8713B has = *(_WORD *)&self->_has & 0xFBFF | v3;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (BOOL)hasDuplicateBytesReceived
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setDuplicateBytesReceived:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_unint64_t duplicateBytesReceived = a3;
}

- (void)deleteBytesReceived
{
  [(NETSchemaNETDebugNetworkInterface *)self setBytesReceived:0];
  $05ABC51B9D84A52C5925A35586C8713B has = self->_has;
  unsigned int v4 = *(_DWORD *)&has & 0xFFFFFDFF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_$05ABC51B9D84A52C5925A35586C8713B has = *(_WORD *)&has & 0xFDFF;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (void)setHasBytesReceived:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  int v4 = *(_WORD *)&self->_has & 0xFDFF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_$05ABC51B9D84A52C5925A35586C8713B has = *(_WORD *)&self->_has & 0xFDFF | v3;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (BOOL)hasBytesReceived
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setBytesReceived:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_unint64_t bytesReceived = a3;
}

- (void)deleteBytesUnacked
{
  [(NETSchemaNETDebugNetworkInterface *)self setBytesUnacked:0];
  $05ABC51B9D84A52C5925A35586C8713B has = self->_has;
  unsigned int v4 = *(_DWORD *)&has & 0xFFFFFEFF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_$05ABC51B9D84A52C5925A35586C8713B has = *(_WORD *)&has & 0xFEFF;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (void)setHasBytesUnacked:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  int v4 = *(_WORD *)&self->_has & 0xFEFF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_$05ABC51B9D84A52C5925A35586C8713B has = *(_WORD *)&self->_has & 0xFEFF | v3;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (BOOL)hasBytesUnacked
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setBytesUnacked:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_unint64_t bytesUnacked = a3;
}

- (void)deleteBytesRetransmitted
{
  [(NETSchemaNETDebugNetworkInterface *)self setBytesRetransmitted:0];
  $05ABC51B9D84A52C5925A35586C8713B has = self->_has;
  unsigned int v4 = *(_DWORD *)&has & 0xFFFFFF7F | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_$05ABC51B9D84A52C5925A35586C8713B has = *(_WORD *)&has & 0xFF7F;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (void)setHasBytesRetransmitted:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  int v4 = *(_WORD *)&self->_has & 0xFF7F | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_$05ABC51B9D84A52C5925A35586C8713B has = *(_WORD *)&self->_has & 0xFF7F | v3;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (BOOL)hasBytesRetransmitted
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setBytesRetransmitted:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_unint64_t bytesRetransmitted = a3;
}

- (void)deleteBytesSent
{
  [(NETSchemaNETDebugNetworkInterface *)self setBytesSent:0];
  $05ABC51B9D84A52C5925A35586C8713B has = self->_has;
  unsigned int v4 = *(_DWORD *)&has & 0xFFFFFFBF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_$05ABC51B9D84A52C5925A35586C8713B has = *(_WORD *)&has & 0xFFBF;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (void)setHasBytesSent:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  int v4 = *(_WORD *)&self->_has & 0xFFBF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_$05ABC51B9D84A52C5925A35586C8713B has = *(_WORD *)&self->_has & 0xFFBF | v3;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (BOOL)hasBytesSent
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setBytesSent:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_unint64_t bytesSent = a3;
}

- (void)deletePacketsReceived
{
  [(NETSchemaNETDebugNetworkInterface *)self setPacketsReceived:0];
  $05ABC51B9D84A52C5925A35586C8713B has = self->_has;
  unsigned int v4 = *(_DWORD *)&has & 0xFFFFFFDF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_$05ABC51B9D84A52C5925A35586C8713B has = *(_WORD *)&has & 0xFFDF;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (void)setHasPacketsReceived:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  int v4 = *(_WORD *)&self->_has & 0xFFDF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_$05ABC51B9D84A52C5925A35586C8713B has = *(_WORD *)&self->_has & 0xFFDF | v3;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (BOOL)hasPacketsReceived
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setPacketsReceived:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_unint64_t packetsReceived = a3;
}

- (void)deletePacketsSent
{
  [(NETSchemaNETDebugNetworkInterface *)self setPacketsSent:0];
  $05ABC51B9D84A52C5925A35586C8713B has = self->_has;
  unsigned int v4 = *(_DWORD *)&has & 0xFFFFFFEF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_$05ABC51B9D84A52C5925A35586C8713B has = *(_WORD *)&has & 0xFFEF;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (void)setHasPacketsSent:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  int v4 = *(_WORD *)&self->_has & 0xFFEF | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_$05ABC51B9D84A52C5925A35586C8713B has = *(_WORD *)&self->_has & 0xFFEF | v3;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (BOOL)hasPacketsSent
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setPacketsSent:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_unint64_t packetsSent = a3;
}

- (void)deleteRttBest
{
  [(NETSchemaNETDebugNetworkInterface *)self setRttBest:0];
  $05ABC51B9D84A52C5925A35586C8713B has = self->_has;
  unsigned int v4 = *(_DWORD *)&has & 0xFFFFFFF7 | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_$05ABC51B9D84A52C5925A35586C8713B has = *(_WORD *)&has & 0xFFF7;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (void)setHasRttBest:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  int v4 = *(_WORD *)&self->_has & 0xFFF7 | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_$05ABC51B9D84A52C5925A35586C8713B has = *(_WORD *)&self->_has & 0xFFF7 | v3;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (BOOL)hasRttBest
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setRttBest:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_unsigned int rttBest = a3;
}

- (void)deleteRttVariance
{
  [(NETSchemaNETDebugNetworkInterface *)self setRttVariance:0];
  $05ABC51B9D84A52C5925A35586C8713B has = self->_has;
  unsigned int v4 = *(_DWORD *)&has & 0xFFFFFFFB | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_$05ABC51B9D84A52C5925A35586C8713B has = *(_WORD *)&has & 0xFFFB;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (void)setHasRttVariance:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  int v4 = *(_WORD *)&self->_has & 0xFFFB | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_$05ABC51B9D84A52C5925A35586C8713B has = *(_WORD *)&self->_has & 0xFFFB | v3;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (BOOL)hasRttVariance
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setRttVariance:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_unsigned int rttVariance = a3;
}

- (void)deleteRttSmoothed
{
  [(NETSchemaNETDebugNetworkInterface *)self setRttSmoothed:0];
  $05ABC51B9D84A52C5925A35586C8713B has = self->_has;
  unsigned int v4 = *(_DWORD *)&has & 0xFFFFFFFD | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_$05ABC51B9D84A52C5925A35586C8713B has = *(_WORD *)&has & 0xFFFD;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (void)setHasRttSmoothed:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  int v4 = *(_WORD *)&self->_has & 0xFFFD | (*((unsigned __int8 *)&self->_has + 2) << 16);
  *(_WORD *)&self->_$05ABC51B9D84A52C5925A35586C8713B has = *(_WORD *)&self->_has & 0xFFFD | v3;
  *((unsigned char *)&self->_has + 2) = BYTE2(v4);
}

- (BOOL)hasRttSmoothed
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setRttSmoothed:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_unsigned int rttSmoothed = a3;
}

- (void)deleteRttCurrent
{
  *(_WORD *)&self->_has &= ~1u;
}

- (void)setHasRttCurrent:(BOOL)a3
{
  *(_WORD *)&self->_$05ABC51B9D84A52C5925A35586C8713B has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasRttCurrent
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setRttCurrent:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_unsigned int rttCurrent = a3;
}

@end