@interface NETSchemaNETHandShakeProtocol
- (BOOL)hasHandShakeDuration;
- (BOOL)hasHandShakeRTT;
- (BOOL)hasProtocol;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NETSchemaNETHandShakeProtocol)initWithDictionary:(id)a3;
- (NETSchemaNETHandShakeProtocol)initWithJSON:(id)a3;
- (NSData)jsonData;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)protocol;
- (unint64_t)handShakeDuration;
- (unint64_t)hash;
- (unsigned)handShakeRTT;
- (void)deleteHandShakeDuration;
- (void)deleteHandShakeRTT;
- (void)deleteProtocol;
- (void)setHandShakeDuration:(unint64_t)a3;
- (void)setHandShakeRTT:(unsigned int)a3;
- (void)setHasHandShakeDuration:(BOOL)a3;
- (void)setHasHandShakeRTT:(BOOL)a3;
- (void)setHasProtocol:(BOOL)a3;
- (void)setProtocol:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation NETSchemaNETHandShakeProtocol

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (unint64_t)handShakeDuration
{
  return self->_handShakeDuration;
}

- (unsigned)handShakeRTT
{
  return self->_handShakeRTT;
}

- (int)protocol
{
  return self->_protocol;
}

- (NETSchemaNETHandShakeProtocol)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NETSchemaNETHandShakeProtocol;
  v5 = [(NETSchemaNETHandShakeProtocol *)&v11 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"protocol"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[NETSchemaNETHandShakeProtocol setProtocol:](v5, "setProtocol:", [v6 intValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"handShakeRTT"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[NETSchemaNETHandShakeProtocol setHandShakeRTT:](v5, "setHandShakeRTT:", [v7 unsignedIntValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"handShakeDuration"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[NETSchemaNETHandShakeProtocol setHandShakeDuration:](v5, "setHandShakeDuration:", [v8 unsignedLongLongValue]);
    }
    v9 = v5;
  }
  return v5;
}

- (NETSchemaNETHandShakeProtocol)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(NETSchemaNETHandShakeProtocol *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(NETSchemaNETHandShakeProtocol *)self dictionaryRepresentation];
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
  if ((has & 4) == 0)
  {
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      goto LABEL_3;
    }
LABEL_6:
    v6 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[NETSchemaNETHandShakeProtocol handShakeRTT](self, "handShakeRTT"));
    [v3 setObject:v6 forKeyedSubscript:@"handShakeRTT"];

    if ((*(unsigned char *)&self->_has & 1) == 0) {
      goto LABEL_11;
    }
LABEL_7:
    unsigned int v7 = [(NETSchemaNETHandShakeProtocol *)self protocol] - 1;
    if (v7 > 2) {
      v8 = @"NETPROTOCOL_UNKNOWN";
    }
    else {
      v8 = off_1E5EB2960[v7];
    }
    [v3 setObject:v8 forKeyedSubscript:@"protocol"];
    goto LABEL_11;
  }
  v5 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[NETSchemaNETHandShakeProtocol handShakeDuration](self, "handShakeDuration"));
  [v3 setObject:v5 forKeyedSubscript:@"handShakeDuration"];

  char has = (char)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_6;
  }
LABEL_3:
  if (has) {
    goto LABEL_7;
  }
LABEL_11:
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    uint64_t v2 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_4;
    }
LABEL_7:
    unint64_t v4 = 0;
    return v3 ^ v2 ^ v4;
  }
  uint64_t v2 = 2654435761 * self->_protocol;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_handShakeRTT;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  unint64_t v4 = 2654435761u * self->_handShakeDuration;
  return v3 ^ v2 ^ v4;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  $78787799258D2756E54B70DAF3B41936 has = self->_has;
  unsigned int v6 = v4[24];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_14;
  }
  if (*(unsigned char *)&has)
  {
    int protocol = self->_protocol;
    if (protocol != [v4 protocol]) {
      goto LABEL_14;
    }
    $78787799258D2756E54B70DAF3B41936 has = self->_has;
    unsigned int v6 = v4[24];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_14;
  }
  if (v8)
  {
    unsigned int handShakeRTT = self->_handShakeRTT;
    if (handShakeRTT == [v4 handShakeRTT])
    {
      $78787799258D2756E54B70DAF3B41936 has = self->_has;
      unsigned int v6 = v4[24];
      goto LABEL_10;
    }
LABEL_14:
    BOOL v12 = 0;
    goto LABEL_15;
  }
LABEL_10:
  int v10 = (*(unsigned int *)&has >> 2) & 1;
  if (v10 != ((v6 >> 2) & 1)) {
    goto LABEL_14;
  }
  if (v10)
  {
    unint64_t handShakeDuration = self->_handShakeDuration;
    if (handShakeDuration != [v4 handShakeDuration]) {
      goto LABEL_14;
    }
  }
  BOOL v12 = 1;
LABEL_15:

  return v12;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    PBDataWriterWriteUint64Field();
    id v4 = v6;
  }
LABEL_5:
}

- (BOOL)readFrom:(id)a3
{
  return NETSchemaNETHandShakeProtocolReadFrom(self, (uint64_t)a3);
}

- (void)deleteHandShakeDuration
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasHandShakeDuration:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasHandShakeDuration
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHandShakeDuration:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_unint64_t handShakeDuration = a3;
}

- (void)deleteHandShakeRTT
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasHandShakeRTT:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasHandShakeRTT
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHandShakeRTT:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_unsigned int handShakeRTT = a3;
}

- (void)deleteProtocol
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasProtocol:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasProtocol
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setProtocol:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int protocol = a3;
}

@end