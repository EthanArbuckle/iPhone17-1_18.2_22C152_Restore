@interface GMSSchemaGMSModelRequestFailed
- (BOOL)hasErrorDomain;
- (BOOL)hasGmsErrorCode;
- (BOOL)hasOpenAIErrorCode;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GMSSchemaGMSModelRequestFailed)initWithDictionary:(id)a3;
- (GMSSchemaGMSModelRequestFailed)initWithJSON:(id)a3;
- (NSData)jsonData;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)errorDomain;
- (int)openAIErrorCode;
- (unint64_t)hash;
- (unsigned)gmsErrorCode;
- (void)deleteErrorDomain;
- (void)deleteGmsErrorCode;
- (void)deleteOpenAIErrorCode;
- (void)setErrorDomain:(int)a3;
- (void)setGmsErrorCode:(unsigned int)a3;
- (void)setHasErrorDomain:(BOOL)a3;
- (void)setHasGmsErrorCode:(BOOL)a3;
- (void)setHasOpenAIErrorCode:(BOOL)a3;
- (void)setOpenAIErrorCode:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GMSSchemaGMSModelRequestFailed

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (int)openAIErrorCode
{
  return self->_openAIErrorCode;
}

- (unsigned)gmsErrorCode
{
  return self->_gmsErrorCode;
}

- (int)errorDomain
{
  return self->_errorDomain;
}

- (GMSSchemaGMSModelRequestFailed)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)GMSSchemaGMSModelRequestFailed;
  v5 = [(GMSSchemaGMSModelRequestFailed *)&v11 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"errorDomain"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[GMSSchemaGMSModelRequestFailed setErrorDomain:](v5, "setErrorDomain:", [v6 intValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"gmsErrorCode"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[GMSSchemaGMSModelRequestFailed setGmsErrorCode:](v5, "setGmsErrorCode:", [v7 unsignedIntValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"openAIErrorCode"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[GMSSchemaGMSModelRequestFailed setOpenAIErrorCode:](v5, "setOpenAIErrorCode:", [v8 intValue]);
    }
    v9 = v5;
  }
  return v5;
}

- (GMSSchemaGMSModelRequestFailed)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(GMSSchemaGMSModelRequestFailed *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(GMSSchemaGMSModelRequestFailed *)self dictionaryRepresentation];
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
  if ((has & 1) == 0)
  {
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      goto LABEL_3;
    }
LABEL_9:
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[GMSSchemaGMSModelRequestFailed gmsErrorCode](self, "gmsErrorCode"));
    [v3 setObject:v7 forKeyedSubscript:@"gmsErrorCode"];

    if ((*(unsigned char *)&self->_has & 4) == 0) {
      goto LABEL_14;
    }
LABEL_10:
    unsigned int v8 = [(GMSSchemaGMSModelRequestFailed *)self openAIErrorCode] - 1;
    if (v8 > 0x17) {
      v9 = @"GMSOPENAIERRORCODE_UNKNOWN";
    }
    else {
      v9 = off_1E5EC1950[v8];
    }
    [v3 setObject:v9 forKeyedSubscript:@"openAIErrorCode"];
    goto LABEL_14;
  }
  unsigned int v5 = [(GMSSchemaGMSModelRequestFailed *)self errorDomain] - 1;
  if (v5 > 0x2F) {
    v6 = @"GMSERRORDOMAIN_UNKNOWN";
  }
  else {
    v6 = off_1E5EC17D0[v5];
  }
  [v3 setObject:v6 forKeyedSubscript:@"errorDomain"];
  char has = (char)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_9;
  }
LABEL_3:
  if ((has & 4) != 0) {
    goto LABEL_10;
  }
LABEL_14:
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
  uint64_t v2 = 2654435761 * self->_errorDomain;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_gmsErrorCode;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v4 = 2654435761 * self->_openAIErrorCode;
  return v3 ^ v2 ^ v4;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  $99D8B9BF470B935B6CF6B0CBFD0A03CB has = self->_has;
  unsigned int v6 = v4[20];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_14;
  }
  if (*(unsigned char *)&has)
  {
    int errorDomain = self->_errorDomain;
    if (errorDomain != [v4 errorDomain]) {
      goto LABEL_14;
    }
    $99D8B9BF470B935B6CF6B0CBFD0A03CB has = self->_has;
    unsigned int v6 = v4[20];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_14;
  }
  if (v8)
  {
    unsigned int gmsErrorCode = self->_gmsErrorCode;
    if (gmsErrorCode == [v4 gmsErrorCode])
    {
      $99D8B9BF470B935B6CF6B0CBFD0A03CB has = self->_has;
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
    int openAIErrorCode = self->_openAIErrorCode;
    if (openAIErrorCode != [v4 openAIErrorCode]) {
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
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
LABEL_5:
}

- (BOOL)readFrom:(id)a3
{
  return GMSSchemaGMSModelRequestFailedReadFrom(self, (uint64_t)a3);
}

- (void)deleteOpenAIErrorCode
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasOpenAIErrorCode:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasOpenAIErrorCode
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setOpenAIErrorCode:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_int openAIErrorCode = a3;
}

- (void)deleteGmsErrorCode
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasGmsErrorCode:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasGmsErrorCode
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setGmsErrorCode:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_unsigned int gmsErrorCode = a3;
}

- (void)deleteErrorDomain
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasErrorDomain:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasErrorDomain
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setErrorDomain:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int errorDomain = a3;
}

@end