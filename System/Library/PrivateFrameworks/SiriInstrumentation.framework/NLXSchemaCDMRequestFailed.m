@interface NLXSchemaCDMRequestFailed
- (BOOL)hasCode;
- (BOOL)hasErrorCode;
- (BOOL)hasErrorDomain;
- (BOOL)hasOriginalCode;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NLXSchemaCDMRequestFailed)initWithDictionary:(id)a3;
- (NLXSchemaCDMRequestFailed)initWithJSON:(id)a3;
- (NSData)jsonData;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)code;
- (int)errorCode;
- (int)errorDomain;
- (int)originalCode;
- (unint64_t)hash;
- (void)deleteCode;
- (void)deleteErrorCode;
- (void)deleteErrorDomain;
- (void)deleteOriginalCode;
- (void)setCode:(int)a3;
- (void)setErrorCode:(int)a3;
- (void)setErrorDomain:(int)a3;
- (void)setHasCode:(BOOL)a3;
- (void)setHasErrorCode:(BOOL)a3;
- (void)setHasErrorDomain:(BOOL)a3;
- (void)setHasOriginalCode:(BOOL)a3;
- (void)setOriginalCode:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation NLXSchemaCDMRequestFailed

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (int)errorDomain
{
  return self->_errorDomain;
}

- (int)errorCode
{
  return self->_errorCode;
}

- (int)originalCode
{
  return self->_originalCode;
}

- (int)code
{
  return self->_code;
}

- (NLXSchemaCDMRequestFailed)initWithDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)NLXSchemaCDMRequestFailed;
  v5 = [(NLXSchemaCDMRequestFailed *)&v12 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"code"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[NLXSchemaCDMRequestFailed setCode:](v5, "setCode:", [v6 intValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"originalCode"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[NLXSchemaCDMRequestFailed setOriginalCode:](v5, "setOriginalCode:", [v7 intValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"errorCode"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[NLXSchemaCDMRequestFailed setErrorCode:](v5, "setErrorCode:", [v8 intValue]);
    }
    v9 = [v4 objectForKeyedSubscript:@"errorDomain"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[NLXSchemaCDMRequestFailed setErrorDomain:](v5, "setErrorDomain:", [v9 intValue]);
    }
    v10 = v5;
  }
  return v5;
}

- (NLXSchemaCDMRequestFailed)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(NLXSchemaCDMRequestFailed *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(NLXSchemaCDMRequestFailed *)self dictionaryRepresentation];
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
    unsigned int v5 = [(NLXSchemaCDMRequestFailed *)self code] - 1;
    if (v5 > 0xB) {
      v6 = @"CDMREQUESTFAILURECODE_UNKNOWN";
    }
    else {
      v6 = off_1E5EB2D40[v5];
    }
    [v3 setObject:v6 forKeyedSubscript:@"code"];
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    v9 = objc_msgSend(NSNumber, "numberWithInt:", -[NLXSchemaCDMRequestFailed errorCode](self, "errorCode"));
    [v3 setObject:v9 forKeyedSubscript:@"errorCode"];

    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_8:
      if ((has & 2) == 0) {
        goto LABEL_10;
      }
      goto LABEL_9;
    }
  }
  else if ((has & 8) == 0)
  {
    goto LABEL_8;
  }
  unsigned int v10 = [(NLXSchemaCDMRequestFailed *)self errorDomain] - 1;
  if (v10 > 0x15) {
    v11 = @"CDMSERVICEGRAPHERRORDOMAIN_UNKNOWN";
  }
  else {
    v11 = off_1E5EB2DA0[v10];
  }
  [v3 setObject:v11 forKeyedSubscript:@"errorDomain"];
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_10;
  }
LABEL_9:
  uint64_t v7 = objc_msgSend(NSNumber, "numberWithInt:", -[NLXSchemaCDMRequestFailed originalCode](self, "originalCode"));
  [v3 setObject:v7 forKeyedSubscript:@"originalCode"];

LABEL_10:
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v2 = 2654435761 * self->_code;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_3:
      uint64_t v3 = 2654435761 * self->_originalCode;
      if ((*(unsigned char *)&self->_has & 4) != 0) {
        goto LABEL_4;
      }
LABEL_8:
      uint64_t v4 = 0;
      if ((*(unsigned char *)&self->_has & 8) != 0) {
        goto LABEL_5;
      }
LABEL_9:
      uint64_t v5 = 0;
      return v3 ^ v2 ^ v4 ^ v5;
    }
  }
  else
  {
    uint64_t v2 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v4 = 2654435761 * self->_errorCode;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_9;
  }
LABEL_5:
  uint64_t v5 = 2654435761 * self->_errorDomain;
  return v3 ^ v2 ^ v4 ^ v5;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_18;
  }
  $BA4853C3B380728628D2465199266C69 has = self->_has;
  unsigned int v6 = v4[24];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_18;
  }
  if (*(unsigned char *)&has)
  {
    int code = self->_code;
    if (code != [v4 code]) {
      goto LABEL_18;
    }
    $BA4853C3B380728628D2465199266C69 has = self->_has;
    unsigned int v6 = v4[24];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_18;
  }
  if (v8)
  {
    int originalCode = self->_originalCode;
    if (originalCode != [v4 originalCode]) {
      goto LABEL_18;
    }
    $BA4853C3B380728628D2465199266C69 has = self->_has;
    unsigned int v6 = v4[24];
  }
  int v10 = (*(unsigned int *)&has >> 2) & 1;
  if (v10 != ((v6 >> 2) & 1)) {
    goto LABEL_18;
  }
  if (v10)
  {
    int errorCode = self->_errorCode;
    if (errorCode == [v4 errorCode])
    {
      $BA4853C3B380728628D2465199266C69 has = self->_has;
      unsigned int v6 = v4[24];
      goto LABEL_14;
    }
LABEL_18:
    BOOL v14 = 0;
    goto LABEL_19;
  }
LABEL_14:
  int v12 = (*(unsigned int *)&has >> 3) & 1;
  if (v12 != ((v6 >> 3) & 1)) {
    goto LABEL_18;
  }
  if (v12)
  {
    int errorDomain = self->_errorDomain;
    if (errorDomain != [v4 errorDomain]) {
      goto LABEL_18;
    }
  }
  BOOL v14 = 1;
LABEL_19:

  return v14;
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  PBDataWriterWriteInt32Field();
  if ((*(unsigned char *)&self->_has & 8) != 0) {
LABEL_5:
  }
    PBDataWriterWriteInt32Field();
LABEL_6:
}

- (BOOL)readFrom:(id)a3
{
  return NLXSchemaCDMRequestFailedReadFrom(self, (uint64_t)a3);
}

- (void)deleteErrorDomain
{
  *(unsigned char *)&self->_has &= ~8u;
}

- (void)setHasErrorDomain:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasErrorDomain
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setErrorDomain:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_int errorDomain = a3;
}

- (void)deleteErrorCode
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasErrorCode:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasErrorCode
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setErrorCode:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_int errorCode = a3;
}

- (void)deleteOriginalCode
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasOriginalCode:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasOriginalCode
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setOriginalCode:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int originalCode = a3;
}

- (void)deleteCode
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasCode:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCode
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setCode:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int code = a3;
}

@end