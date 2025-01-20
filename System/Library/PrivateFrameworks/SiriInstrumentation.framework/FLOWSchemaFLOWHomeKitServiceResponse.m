@interface FLOWSchemaFLOWHomeKitServiceResponse
- (BOOL)hasHomeKitServiceType;
- (BOOL)hasNumServicesCompleted;
- (BOOL)hasNumServicesFailed;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (FLOWSchemaFLOWHomeKitServiceResponse)initWithDictionary:(id)a3;
- (FLOWSchemaFLOWHomeKitServiceResponse)initWithJSON:(id)a3;
- (NSData)jsonData;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)homeKitServiceType;
- (int)numServicesCompleted;
- (int)numServicesFailed;
- (unint64_t)hash;
- (void)deleteHomeKitServiceType;
- (void)deleteNumServicesCompleted;
- (void)deleteNumServicesFailed;
- (void)setHasHomeKitServiceType:(BOOL)a3;
- (void)setHasNumServicesCompleted:(BOOL)a3;
- (void)setHasNumServicesFailed:(BOOL)a3;
- (void)setHomeKitServiceType:(int)a3;
- (void)setNumServicesCompleted:(int)a3;
- (void)setNumServicesFailed:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation FLOWSchemaFLOWHomeKitServiceResponse

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (int)numServicesFailed
{
  return self->_numServicesFailed;
}

- (int)numServicesCompleted
{
  return self->_numServicesCompleted;
}

- (int)homeKitServiceType
{
  return self->_homeKitServiceType;
}

- (FLOWSchemaFLOWHomeKitServiceResponse)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FLOWSchemaFLOWHomeKitServiceResponse;
  v5 = [(FLOWSchemaFLOWHomeKitServiceResponse *)&v11 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"homeKitServiceType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[FLOWSchemaFLOWHomeKitServiceResponse setHomeKitServiceType:](v5, "setHomeKitServiceType:", [v6 intValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"numServicesCompleted"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[FLOWSchemaFLOWHomeKitServiceResponse setNumServicesCompleted:](v5, "setNumServicesCompleted:", [v7 intValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"numServicesFailed"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[FLOWSchemaFLOWHomeKitServiceResponse setNumServicesFailed:](v5, "setNumServicesFailed:", [v8 intValue]);
    }
    v9 = v5;
  }
  return v5;
}

- (FLOWSchemaFLOWHomeKitServiceResponse)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(FLOWSchemaFLOWHomeKitServiceResponse *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(FLOWSchemaFLOWHomeKitServiceResponse *)self dictionaryRepresentation];
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
  if (has)
  {
    unsigned int v5 = [(FLOWSchemaFLOWHomeKitServiceResponse *)self homeKitServiceType] - 1;
    if (v5 > 0x2A) {
      v6 = @"FLOWHOMEKITSERVICETYPE_UNKNOWN";
    }
    else {
      v6 = off_1E5EAED60[v5];
    }
    [v3 setObject:v6 forKeyedSubscript:@"homeKitServiceType"];
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithInt:", -[FLOWSchemaFLOWHomeKitServiceResponse numServicesCompleted](self, "numServicesCompleted"));
    [v3 setObject:v7 forKeyedSubscript:@"numServicesCompleted"];

    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    v8 = objc_msgSend(NSNumber, "numberWithInt:", -[FLOWSchemaFLOWHomeKitServiceResponse numServicesFailed](self, "numServicesFailed"));
    [v3 setObject:v8 forKeyedSubscript:@"numServicesFailed"];
  }
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
    uint64_t v4 = 0;
    return v3 ^ v2 ^ v4;
  }
  uint64_t v2 = 2654435761 * self->_homeKitServiceType;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_numServicesCompleted;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v4 = 2654435761 * self->_numServicesFailed;
  return v3 ^ v2 ^ v4;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  $E4857DD2975059A3F5D21873A2C6023E has = self->_has;
  unsigned int v6 = v4[20];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_14;
  }
  if (*(unsigned char *)&has)
  {
    int homeKitServiceType = self->_homeKitServiceType;
    if (homeKitServiceType != [v4 homeKitServiceType]) {
      goto LABEL_14;
    }
    $E4857DD2975059A3F5D21873A2C6023E has = self->_has;
    unsigned int v6 = v4[20];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_14;
  }
  if (v8)
  {
    int numServicesCompleted = self->_numServicesCompleted;
    if (numServicesCompleted == [v4 numServicesCompleted])
    {
      $E4857DD2975059A3F5D21873A2C6023E has = self->_has;
      unsigned int v6 = v4[20];
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
    int numServicesFailed = self->_numServicesFailed;
    if (numServicesFailed != [v4 numServicesFailed]) {
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
  PBDataWriterWriteInt32Field();
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
LABEL_5:
}

- (BOOL)readFrom:(id)a3
{
  return FLOWSchemaFLOWHomeKitServiceResponseReadFrom(self, (uint64_t)a3);
}

- (void)deleteNumServicesFailed
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasNumServicesFailed:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasNumServicesFailed
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setNumServicesFailed:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_int numServicesFailed = a3;
}

- (void)deleteNumServicesCompleted
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasNumServicesCompleted:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasNumServicesCompleted
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setNumServicesCompleted:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int numServicesCompleted = a3;
}

- (void)deleteHomeKitServiceType
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasHomeKitServiceType:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasHomeKitServiceType
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHomeKitServiceType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int homeKitServiceType = a3;
}

@end