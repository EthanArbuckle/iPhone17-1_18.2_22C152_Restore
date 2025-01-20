@interface NLXSchemaSSUBackgroundUpdateAppCategoryInfo
- (BOOL)hasCacheAction;
- (BOOL)hasCategoryType;
- (BOOL)hasNumAppExamplesNegative;
- (BOOL)hasNumAppExamplesPositive;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NLXSchemaSSUBackgroundUpdateAppCategoryInfo)initWithDictionary:(id)a3;
- (NLXSchemaSSUBackgroundUpdateAppCategoryInfo)initWithJSON:(id)a3;
- (NSData)jsonData;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)cacheAction;
- (int)categoryType;
- (unint64_t)hash;
- (unsigned)numAppExamplesNegative;
- (unsigned)numAppExamplesPositive;
- (void)deleteCacheAction;
- (void)deleteCategoryType;
- (void)deleteNumAppExamplesNegative;
- (void)deleteNumAppExamplesPositive;
- (void)setCacheAction:(int)a3;
- (void)setCategoryType:(int)a3;
- (void)setHasCacheAction:(BOOL)a3;
- (void)setHasCategoryType:(BOOL)a3;
- (void)setHasNumAppExamplesNegative:(BOOL)a3;
- (void)setHasNumAppExamplesPositive:(BOOL)a3;
- (void)setNumAppExamplesNegative:(unsigned int)a3;
- (void)setNumAppExamplesPositive:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation NLXSchemaSSUBackgroundUpdateAppCategoryInfo

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (int)cacheAction
{
  return self->_cacheAction;
}

- (unsigned)numAppExamplesNegative
{
  return self->_numAppExamplesNegative;
}

- (unsigned)numAppExamplesPositive
{
  return self->_numAppExamplesPositive;
}

- (int)categoryType
{
  return self->_categoryType;
}

- (NLXSchemaSSUBackgroundUpdateAppCategoryInfo)initWithDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)NLXSchemaSSUBackgroundUpdateAppCategoryInfo;
  v5 = [(NLXSchemaSSUBackgroundUpdateAppCategoryInfo *)&v12 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"categoryType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[NLXSchemaSSUBackgroundUpdateAppCategoryInfo setCategoryType:](v5, "setCategoryType:", [v6 intValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"numAppExamplesPositive"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[NLXSchemaSSUBackgroundUpdateAppCategoryInfo setNumAppExamplesPositive:](v5, "setNumAppExamplesPositive:", [v7 unsignedIntValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"numAppExamplesNegative"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[NLXSchemaSSUBackgroundUpdateAppCategoryInfo setNumAppExamplesNegative:](v5, "setNumAppExamplesNegative:", [v8 unsignedIntValue]);
    }
    v9 = [v4 objectForKeyedSubscript:@"cacheAction"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[NLXSchemaSSUBackgroundUpdateAppCategoryInfo setCacheAction:](v5, "setCacheAction:", [v9 intValue]);
    }
    v10 = v5;
  }
  return v5;
}

- (NLXSchemaSSUBackgroundUpdateAppCategoryInfo)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(NLXSchemaSSUBackgroundUpdateAppCategoryInfo *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(NLXSchemaSSUBackgroundUpdateAppCategoryInfo *)self dictionaryRepresentation];
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
  if ((has & 8) != 0)
  {
    unsigned int v5 = [(NLXSchemaSSUBackgroundUpdateAppCategoryInfo *)self cacheAction] - 1;
    if (v5 > 2) {
      v6 = @"SSUCACHEACTION_UNKNOWN";
    }
    else {
      v6 = off_1E5EBBE08[v5];
    }
    [v3 setObject:v6 forKeyedSubscript:@"cacheAction"];
    char has = (char)self->_has;
  }
  if (has)
  {
    unsigned int v7 = [(NLXSchemaSSUBackgroundUpdateAppCategoryInfo *)self categoryType] - 1;
    if (v7 > 3) {
      v8 = @"SSUCATEGORYTYPE_UNKNOWN";
    }
    else {
      v8 = off_1E5EBBE20[v7];
    }
    [v3 setObject:v8 forKeyedSubscript:@"categoryType"];
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    v9 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[NLXSchemaSSUBackgroundUpdateAppCategoryInfo numAppExamplesNegative](self, "numAppExamplesNegative"));
    [v3 setObject:v9 forKeyedSubscript:@"numAppExamplesNegative"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v10 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[NLXSchemaSSUBackgroundUpdateAppCategoryInfo numAppExamplesPositive](self, "numAppExamplesPositive"));
    [v3 setObject:v10 forKeyedSubscript:@"numAppExamplesPositive"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v2 = 2654435761 * self->_categoryType;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_3:
      uint64_t v3 = 2654435761 * self->_numAppExamplesPositive;
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
  uint64_t v4 = 2654435761 * self->_numAppExamplesNegative;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_9;
  }
LABEL_5:
  uint64_t v5 = 2654435761 * self->_cacheAction;
  return v3 ^ v2 ^ v4 ^ v5;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_18;
  }
  $8069672B67CAA32AB4B7CFF3B6621F51 has = self->_has;
  unsigned int v6 = v4[24];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_18;
  }
  if (*(unsigned char *)&has)
  {
    int categoryType = self->_categoryType;
    if (categoryType != [v4 categoryType]) {
      goto LABEL_18;
    }
    $8069672B67CAA32AB4B7CFF3B6621F51 has = self->_has;
    unsigned int v6 = v4[24];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_18;
  }
  if (v8)
  {
    unsigned int numAppExamplesPositive = self->_numAppExamplesPositive;
    if (numAppExamplesPositive != [v4 numAppExamplesPositive]) {
      goto LABEL_18;
    }
    $8069672B67CAA32AB4B7CFF3B6621F51 has = self->_has;
    unsigned int v6 = v4[24];
  }
  int v10 = (*(unsigned int *)&has >> 2) & 1;
  if (v10 != ((v6 >> 2) & 1)) {
    goto LABEL_18;
  }
  if (v10)
  {
    unsigned int numAppExamplesNegative = self->_numAppExamplesNegative;
    if (numAppExamplesNegative == [v4 numAppExamplesNegative])
    {
      $8069672B67CAA32AB4B7CFF3B6621F51 has = self->_has;
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
    int cacheAction = self->_cacheAction;
    if (cacheAction != [v4 cacheAction]) {
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
  PBDataWriterWriteUint32Field();
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
  PBDataWriterWriteUint32Field();
  if ((*(unsigned char *)&self->_has & 8) != 0) {
LABEL_5:
  }
    PBDataWriterWriteInt32Field();
LABEL_6:
}

- (BOOL)readFrom:(id)a3
{
  return NLXSchemaSSUBackgroundUpdateAppCategoryInfoReadFrom(self, (uint64_t)a3);
}

- (void)deleteCacheAction
{
  *(unsigned char *)&self->_has &= ~8u;
}

- (void)setHasCacheAction:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasCacheAction
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setCacheAction:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_int cacheAction = a3;
}

- (void)deleteNumAppExamplesNegative
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasNumAppExamplesNegative:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasNumAppExamplesNegative
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setNumAppExamplesNegative:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_unsigned int numAppExamplesNegative = a3;
}

- (void)deleteNumAppExamplesPositive
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasNumAppExamplesPositive:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasNumAppExamplesPositive
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setNumAppExamplesPositive:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_unsigned int numAppExamplesPositive = a3;
}

- (void)deleteCategoryType
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasCategoryType:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCategoryType
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setCategoryType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int categoryType = a3;
}

@end