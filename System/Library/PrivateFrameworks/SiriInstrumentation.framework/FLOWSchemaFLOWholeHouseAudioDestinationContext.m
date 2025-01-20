@interface FLOWSchemaFLOWholeHouseAudioDestinationContext
- (BOOL)hasDeviceSuccessCount;
- (BOOL)hasEligibleDeviceCount;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (FLOWSchemaFLOWholeHouseAudioDestinationContext)initWithDictionary:(id)a3;
- (FLOWSchemaFLOWholeHouseAudioDestinationContext)initWithJSON:(id)a3;
- (NSData)jsonData;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unsigned)deviceSuccessCount;
- (unsigned)eligibleDeviceCount;
- (void)deleteDeviceSuccessCount;
- (void)deleteEligibleDeviceCount;
- (void)setDeviceSuccessCount:(unsigned int)a3;
- (void)setEligibleDeviceCount:(unsigned int)a3;
- (void)setHasDeviceSuccessCount:(BOOL)a3;
- (void)setHasEligibleDeviceCount:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation FLOWSchemaFLOWholeHouseAudioDestinationContext

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (unsigned)deviceSuccessCount
{
  return self->_deviceSuccessCount;
}

- (unsigned)eligibleDeviceCount
{
  return self->_eligibleDeviceCount;
}

- (FLOWSchemaFLOWholeHouseAudioDestinationContext)initWithDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)FLOWSchemaFLOWholeHouseAudioDestinationContext;
  v5 = [(FLOWSchemaFLOWholeHouseAudioDestinationContext *)&v10 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"eligibleDeviceCount"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[FLOWSchemaFLOWholeHouseAudioDestinationContext setEligibleDeviceCount:](v5, "setEligibleDeviceCount:", [v6 unsignedIntValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"deviceSuccessCount"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[FLOWSchemaFLOWholeHouseAudioDestinationContext setDeviceSuccessCount:](v5, "setDeviceSuccessCount:", [v7 unsignedIntValue]);
    }
    v8 = v5;
  }
  return v5;
}

- (FLOWSchemaFLOWholeHouseAudioDestinationContext)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(FLOWSchemaFLOWholeHouseAudioDestinationContext *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(FLOWSchemaFLOWholeHouseAudioDestinationContext *)self dictionaryRepresentation];
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
    v5 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[FLOWSchemaFLOWholeHouseAudioDestinationContext deviceSuccessCount](self, "deviceSuccessCount"));
    [v3 setObject:v5 forKeyedSubscript:@"deviceSuccessCount"];

    char has = (char)self->_has;
  }
  if (has)
  {
    v6 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[FLOWSchemaFLOWholeHouseAudioDestinationContext eligibleDeviceCount](self, "eligibleDeviceCount"));
    [v3 setObject:v6 forKeyedSubscript:@"eligibleDeviceCount"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v2 = 2654435761 * self->_eligibleDeviceCount;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v3 = 0;
    return v3 ^ v2;
  }
  uint64_t v2 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_deviceSuccessCount;
  return v3 ^ v2;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_10;
  }
  $4348BAB887B4EE69D15D4F409CD2A8DC has = self->_has;
  unsigned int v6 = v4[16];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_10;
  }
  if (*(unsigned char *)&has)
  {
    unsigned int eligibleDeviceCount = self->_eligibleDeviceCount;
    if (eligibleDeviceCount != [v4 eligibleDeviceCount])
    {
LABEL_10:
      BOOL v10 = 0;
      goto LABEL_11;
    }
    $4348BAB887B4EE69D15D4F409CD2A8DC has = self->_has;
    unsigned int v6 = v4[16];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_10;
  }
  if (v8)
  {
    unsigned int deviceSuccessCount = self->_deviceSuccessCount;
    if (deviceSuccessCount != [v4 deviceSuccessCount]) {
      goto LABEL_10;
    }
  }
  BOOL v10 = 1;
LABEL_11:

  return v10;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if (has)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v6;
  }
}

- (BOOL)readFrom:(id)a3
{
  return FLOWSchemaFLOWholeHouseAudioDestinationContextReadFrom(self, (uint64_t)a3);
}

- (void)deleteDeviceSuccessCount
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasDeviceSuccessCount:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDeviceSuccessCount
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setDeviceSuccessCount:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_unsigned int deviceSuccessCount = a3;
}

- (void)deleteEligibleDeviceCount
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasEligibleDeviceCount:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasEligibleDeviceCount
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setEligibleDeviceCount:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_unsigned int eligibleDeviceCount = a3;
}

@end