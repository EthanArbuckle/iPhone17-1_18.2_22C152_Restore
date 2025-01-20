@interface POMMESSchemaPOMMESPegasusKitPegasusResponse
- (BOOL)hasCompressedResponseSizeInKB;
- (BOOL)hasRawResponseSizeInKB;
- (BOOL)hasTimingData;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (POMMESSchemaPOMMESPegasusKitNetworkTimingData)timingData;
- (POMMESSchemaPOMMESPegasusKitPegasusResponse)initWithDictionary:(id)a3;
- (POMMESSchemaPOMMESPegasusKitPegasusResponse)initWithJSON:(id)a3;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unsigned)compressedResponseSizeInKB;
- (unsigned)rawResponseSizeInKB;
- (void)deleteCompressedResponseSizeInKB;
- (void)deleteRawResponseSizeInKB;
- (void)deleteTimingData;
- (void)setCompressedResponseSizeInKB:(unsigned int)a3;
- (void)setHasCompressedResponseSizeInKB:(BOOL)a3;
- (void)setHasRawResponseSizeInKB:(BOOL)a3;
- (void)setHasTimingData:(BOOL)a3;
- (void)setRawResponseSizeInKB:(unsigned int)a3;
- (void)setTimingData:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation POMMESSchemaPOMMESPegasusKitPegasusResponse

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)POMMESSchemaPOMMESPegasusKitPegasusResponse;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(POMMESSchemaPOMMESPegasusKitPegasusResponse *)self timingData];
  v7 = [v6 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v7 suppressMessage];
  if (v4) {
    [(POMMESSchemaPOMMESPegasusKitPegasusResponse *)self deleteTimingData];
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

- (void)setHasTimingData:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setTimingData:(id)a3
{
}

- (POMMESSchemaPOMMESPegasusKitNetworkTimingData)timingData
{
  return self->_timingData;
}

- (unsigned)compressedResponseSizeInKB
{
  return self->_compressedResponseSizeInKB;
}

- (unsigned)rawResponseSizeInKB
{
  return self->_rawResponseSizeInKB;
}

- (POMMESSchemaPOMMESPegasusKitPegasusResponse)initWithDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)POMMESSchemaPOMMESPegasusKitPegasusResponse;
  v5 = [(POMMESSchemaPOMMESPegasusKitPegasusResponse *)&v12 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"rawResponseSizeInKB"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[POMMESSchemaPOMMESPegasusKitPegasusResponse setRawResponseSizeInKB:](v5, "setRawResponseSizeInKB:", [v6 unsignedIntValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"compressedResponseSizeInKB"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[POMMESSchemaPOMMESPegasusKitPegasusResponse setCompressedResponseSizeInKB:](v5, "setCompressedResponseSizeInKB:", [v7 unsignedIntValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"timingData"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v9 = [[POMMESSchemaPOMMESPegasusKitNetworkTimingData alloc] initWithDictionary:v8];
      [(POMMESSchemaPOMMESPegasusKitPegasusResponse *)v5 setTimingData:v9];
    }
    v10 = v5;
  }
  return v5;
}

- (POMMESSchemaPOMMESPegasusKitPegasusResponse)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(POMMESSchemaPOMMESPegasusKitPegasusResponse *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(POMMESSchemaPOMMESPegasusKitPegasusResponse *)self dictionaryRepresentation];
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
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v5 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[POMMESSchemaPOMMESPegasusKitPegasusResponse compressedResponseSizeInKB](self, "compressedResponseSizeInKB"));
    [v3 setObject:v5 forKeyedSubscript:@"compressedResponseSizeInKB"];

    char has = (char)self->_has;
  }
  if (has)
  {
    v6 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[POMMESSchemaPOMMESPegasusKitPegasusResponse rawResponseSizeInKB](self, "rawResponseSizeInKB"));
    [v3 setObject:v6 forKeyedSubscript:@"rawResponseSizeInKB"];
  }
  if (self->_timingData)
  {
    uint64_t v7 = [(POMMESSchemaPOMMESPegasusKitPegasusResponse *)self timingData];
    v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"timingData"];
    }
    else
    {
      objc_super v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"timingData"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v2 = 2654435761 * self->_rawResponseSizeInKB;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v3 = 0;
    return v3 ^ v2 ^ [(POMMESSchemaPOMMESPegasusKitNetworkTimingData *)self->_timingData hash];
  }
  uint64_t v2 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_compressedResponseSizeInKB;
  return v3 ^ v2 ^ [(POMMESSchemaPOMMESPegasusKitNetworkTimingData *)self->_timingData hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  $073D67A95A343EB9167FDA1C687F0DF0 has = self->_has;
  unsigned int v6 = v4[24];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_14;
  }
  if (*(unsigned char *)&has)
  {
    unsigned int rawResponseSizeInKB = self->_rawResponseSizeInKB;
    if (rawResponseSizeInKB != [v4 rawResponseSizeInKB]) {
      goto LABEL_14;
    }
    $073D67A95A343EB9167FDA1C687F0DF0 has = self->_has;
    unsigned int v6 = v4[24];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 == ((v6 >> 1) & 1))
  {
    if (!v8
      || (unsigned int compressedResponseSizeInKB = self->_compressedResponseSizeInKB,
          compressedResponseSizeInKB == [v4 compressedResponseSizeInKB]))
    {
      v10 = [(POMMESSchemaPOMMESPegasusKitPegasusResponse *)self timingData];
      v11 = [v4 timingData];
      objc_super v12 = v11;
      if ((v10 == 0) != (v11 != 0))
      {
        uint64_t v13 = [(POMMESSchemaPOMMESPegasusKitPegasusResponse *)self timingData];
        if (!v13)
        {

LABEL_17:
          BOOL v18 = 1;
          goto LABEL_15;
        }
        v14 = (void *)v13;
        v15 = [(POMMESSchemaPOMMESPegasusKitPegasusResponse *)self timingData];
        v16 = [v4 timingData];
        char v17 = [v15 isEqual:v16];

        if (v17) {
          goto LABEL_17;
        }
      }
      else
      {
      }
    }
  }
LABEL_14:
  BOOL v18 = 0;
LABEL_15:

  return v18;
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteUint32Field();
    char has = (char)self->_has;
  }
  if ((has & 2) != 0) {
    PBDataWriterWriteUint32Field();
  }
  v5 = [(POMMESSchemaPOMMESPegasusKitPegasusResponse *)self timingData];

  unsigned int v6 = v8;
  if (v5)
  {
    uint64_t v7 = [(POMMESSchemaPOMMESPegasusKitPegasusResponse *)self timingData];
    PBDataWriterWriteSubmessage();

    unsigned int v6 = v8;
  }
}

- (BOOL)readFrom:(id)a3
{
  return POMMESSchemaPOMMESPegasusKitPegasusResponseReadFrom(self, (uint64_t)a3);
}

- (void)deleteTimingData
{
}

- (BOOL)hasTimingData
{
  return self->_timingData != 0;
}

- (void)deleteCompressedResponseSizeInKB
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasCompressedResponseSizeInKB:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasCompressedResponseSizeInKB
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setCompressedResponseSizeInKB:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_unsigned int compressedResponseSizeInKB = a3;
}

- (void)deleteRawResponseSizeInKB
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasRawResponseSizeInKB:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasRawResponseSizeInKB
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setRawResponseSizeInKB:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_unsigned int rawResponseSizeInKB = a3;
}

@end