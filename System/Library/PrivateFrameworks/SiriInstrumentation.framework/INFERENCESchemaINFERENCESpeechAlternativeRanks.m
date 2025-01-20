@interface INFERENCESchemaINFERENCESpeechAlternativeRanks
- (BOOL)hasFamilyNameRank;
- (BOOL)hasFullNameRank;
- (BOOL)hasGivenNameRank;
- (BOOL)hasIsError;
- (BOOL)hasMiddleNameRank;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)isError;
- (BOOL)readFrom:(id)a3;
- (INFERENCESchemaINFERENCESpeechAlternativeRanks)initWithDictionary:(id)a3;
- (INFERENCESchemaINFERENCESpeechAlternativeRanks)initWithJSON:(id)a3;
- (NSData)jsonData;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unsigned)familyNameRank;
- (unsigned)fullNameRank;
- (unsigned)givenNameRank;
- (unsigned)middleNameRank;
- (unsigned)version;
- (void)deleteFamilyNameRank;
- (void)deleteFullNameRank;
- (void)deleteGivenNameRank;
- (void)deleteIsError;
- (void)deleteMiddleNameRank;
- (void)deleteVersion;
- (void)setFamilyNameRank:(unsigned int)a3;
- (void)setFullNameRank:(unsigned int)a3;
- (void)setGivenNameRank:(unsigned int)a3;
- (void)setHasFamilyNameRank:(BOOL)a3;
- (void)setHasFullNameRank:(BOOL)a3;
- (void)setHasGivenNameRank:(BOOL)a3;
- (void)setHasIsError:(BOOL)a3;
- (void)setHasMiddleNameRank:(BOOL)a3;
- (void)setHasVersion:(BOOL)a3;
- (void)setIsError:(BOOL)a3;
- (void)setMiddleNameRank:(unsigned int)a3;
- (void)setVersion:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation INFERENCESchemaINFERENCESpeechAlternativeRanks

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (unsigned)fullNameRank
{
  return self->_fullNameRank;
}

- (unsigned)familyNameRank
{
  return self->_familyNameRank;
}

- (unsigned)middleNameRank
{
  return self->_middleNameRank;
}

- (unsigned)givenNameRank
{
  return self->_givenNameRank;
}

- (unsigned)version
{
  return self->_version;
}

- (BOOL)isError
{
  return self->_isError;
}

- (INFERENCESchemaINFERENCESpeechAlternativeRanks)initWithDictionary:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)INFERENCESchemaINFERENCESpeechAlternativeRanks;
  v5 = [(INFERENCESchemaINFERENCESpeechAlternativeRanks *)&v14 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"isError"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCESpeechAlternativeRanks setIsError:](v5, "setIsError:", [v6 BOOLValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"version"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCESpeechAlternativeRanks setVersion:](v5, "setVersion:", [v7 unsignedIntValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"givenNameRank"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCESpeechAlternativeRanks setGivenNameRank:](v5, "setGivenNameRank:", [v8 unsignedIntValue]);
    }
    v9 = [v4 objectForKeyedSubscript:@"middleNameRank"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCESpeechAlternativeRanks setMiddleNameRank:](v5, "setMiddleNameRank:", [v9 unsignedIntValue]);
    }
    v10 = [v4 objectForKeyedSubscript:@"familyNameRank"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCESpeechAlternativeRanks setFamilyNameRank:](v5, "setFamilyNameRank:", [v10 unsignedIntValue]);
    }
    v11 = [v4 objectForKeyedSubscript:@"fullNameRank"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCESpeechAlternativeRanks setFullNameRank:](v5, "setFullNameRank:", [v11 unsignedIntValue]);
    }
    v12 = v5;
  }
  return v5;
}

- (INFERENCESchemaINFERENCESpeechAlternativeRanks)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(INFERENCESchemaINFERENCESpeechAlternativeRanks *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(INFERENCESchemaINFERENCESpeechAlternativeRanks *)self dictionaryRepresentation];
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
  if ((has & 0x10) != 0)
  {
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[INFERENCESchemaINFERENCESpeechAlternativeRanks familyNameRank](self, "familyNameRank"));
    [v3 setObject:v7 forKeyedSubscript:@"familyNameRank"];

    char has = (char)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  v8 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[INFERENCESchemaINFERENCESpeechAlternativeRanks fullNameRank](self, "fullNameRank"));
  [v3 setObject:v8 forKeyedSubscript:@"fullNameRank"];

  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  v9 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[INFERENCESchemaINFERENCESpeechAlternativeRanks givenNameRank](self, "givenNameRank"));
  [v3 setObject:v9 forKeyedSubscript:@"givenNameRank"];

  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  v10 = objc_msgSend(NSNumber, "numberWithBool:", -[INFERENCESchemaINFERENCESpeechAlternativeRanks isError](self, "isError"));
  [v3 setObject:v10 forKeyedSubscript:@"isError"];

  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 2) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_15:
  v11 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[INFERENCESchemaINFERENCESpeechAlternativeRanks middleNameRank](self, "middleNameRank"));
  [v3 setObject:v11 forKeyedSubscript:@"middleNameRank"];

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_7:
    v5 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[INFERENCESchemaINFERENCESpeechAlternativeRanks version](self, "version"));
    [v3 setObject:v5 forKeyedSubscript:@"version"];
  }
LABEL_8:
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v2 = 2654435761 * self->_isError;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_3:
      uint64_t v3 = 2654435761 * self->_version;
      if ((*(unsigned char *)&self->_has & 4) != 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
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
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    uint64_t v4 = 2654435761 * self->_givenNameRank;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }
LABEL_10:
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_5:
    uint64_t v5 = 2654435761 * self->_middleNameRank;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_6;
    }
LABEL_12:
    uint64_t v6 = 0;
    if ((*(unsigned char *)&self->_has & 0x20) != 0) {
      goto LABEL_7;
    }
LABEL_13:
    uint64_t v7 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7;
  }
LABEL_11:
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 0x10) == 0) {
    goto LABEL_12;
  }
LABEL_6:
  uint64_t v6 = 2654435761 * self->_familyNameRank;
  if ((*(unsigned char *)&self->_has & 0x20) == 0) {
    goto LABEL_13;
  }
LABEL_7:
  uint64_t v7 = 2654435761 * self->_fullNameRank;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_26;
  }
  $81156445DA16256DF4E3E07EE8BEC159 has = self->_has;
  unsigned int v6 = v4[32];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_26;
  }
  if (*(unsigned char *)&has)
  {
    int isError = self->_isError;
    if (isError != [v4 isError]) {
      goto LABEL_26;
    }
    $81156445DA16256DF4E3E07EE8BEC159 has = self->_has;
    unsigned int v6 = v4[32];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_26;
  }
  if (v8)
  {
    unsigned int version = self->_version;
    if (version != [v4 version]) {
      goto LABEL_26;
    }
    $81156445DA16256DF4E3E07EE8BEC159 has = self->_has;
    unsigned int v6 = v4[32];
  }
  int v10 = (*(unsigned int *)&has >> 2) & 1;
  if (v10 != ((v6 >> 2) & 1)) {
    goto LABEL_26;
  }
  if (v10)
  {
    unsigned int givenNameRank = self->_givenNameRank;
    if (givenNameRank != [v4 givenNameRank]) {
      goto LABEL_26;
    }
    $81156445DA16256DF4E3E07EE8BEC159 has = self->_has;
    unsigned int v6 = v4[32];
  }
  int v12 = (*(unsigned int *)&has >> 3) & 1;
  if (v12 != ((v6 >> 3) & 1)) {
    goto LABEL_26;
  }
  if (v12)
  {
    unsigned int middleNameRank = self->_middleNameRank;
    if (middleNameRank != [v4 middleNameRank]) {
      goto LABEL_26;
    }
    $81156445DA16256DF4E3E07EE8BEC159 has = self->_has;
    unsigned int v6 = v4[32];
  }
  int v14 = (*(unsigned int *)&has >> 4) & 1;
  if (v14 != ((v6 >> 4) & 1)) {
    goto LABEL_26;
  }
  if (v14)
  {
    unsigned int familyNameRank = self->_familyNameRank;
    if (familyNameRank == [v4 familyNameRank])
    {
      $81156445DA16256DF4E3E07EE8BEC159 has = self->_has;
      unsigned int v6 = v4[32];
      goto LABEL_22;
    }
LABEL_26:
    BOOL v18 = 0;
    goto LABEL_27;
  }
LABEL_22:
  int v16 = (*(unsigned int *)&has >> 5) & 1;
  if (v16 != ((v6 >> 5) & 1)) {
    goto LABEL_26;
  }
  if (v16)
  {
    unsigned int fullNameRank = self->_fullNameRank;
    if (fullNameRank != [v4 fullNameRank]) {
      goto LABEL_26;
    }
  }
  BOOL v18 = 1;
LABEL_27:

  return v18;
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteBOOLField();
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_15:
  PBDataWriterWriteUint32Field();
  if ((*(unsigned char *)&self->_has & 0x20) != 0) {
LABEL_7:
  }
    PBDataWriterWriteUint32Field();
LABEL_8:
}

- (BOOL)readFrom:(id)a3
{
  return INFERENCESchemaINFERENCESpeechAlternativeRanksReadFrom(self, (uint64_t)a3);
}

- (void)deleteFullNameRank
{
  *(unsigned char *)&self->_has &= ~0x20u;
}

- (void)setHasFullNameRank:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasFullNameRank
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setFullNameRank:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_unsigned int fullNameRank = a3;
}

- (void)deleteFamilyNameRank
{
  *(unsigned char *)&self->_has &= ~0x10u;
}

- (void)setHasFamilyNameRank:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasFamilyNameRank
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setFamilyNameRank:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_unsigned int familyNameRank = a3;
}

- (void)deleteMiddleNameRank
{
  *(unsigned char *)&self->_has &= ~8u;
}

- (void)setHasMiddleNameRank:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasMiddleNameRank
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setMiddleNameRank:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_unsigned int middleNameRank = a3;
}

- (void)deleteGivenNameRank
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasGivenNameRank:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasGivenNameRank
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setGivenNameRank:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_unsigned int givenNameRank = a3;
}

- (void)deleteVersion
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasVersion:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasVersion
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setVersion:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_unsigned int version = a3;
}

- (void)deleteIsError
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasIsError:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasIsError
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setIsError:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int isError = a3;
}

@end