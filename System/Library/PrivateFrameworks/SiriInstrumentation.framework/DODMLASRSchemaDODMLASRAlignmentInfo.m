@interface DODMLASRSchemaDODMLASRAlignmentInfo
- (BOOL)hasEditDistance;
- (BOOL)hasNumDeletions;
- (BOOL)hasNumInsertions;
- (BOOL)hasNumSubstitutions;
- (BOOL)hasReferenceName;
- (BOOL)hasReferenceSize;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (DODMLASRSchemaDODMLASRAlignmentInfo)initWithDictionary:(id)a3;
- (DODMLASRSchemaDODMLASRAlignmentInfo)initWithJSON:(id)a3;
- (NSData)jsonData;
- (NSString)referenceName;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unsigned)editDistance;
- (unsigned)numDeletions;
- (unsigned)numInsertions;
- (unsigned)numSubstitutions;
- (unsigned)referenceSize;
- (void)deleteEditDistance;
- (void)deleteNumDeletions;
- (void)deleteNumInsertions;
- (void)deleteNumSubstitutions;
- (void)deleteReferenceName;
- (void)deleteReferenceSize;
- (void)setEditDistance:(unsigned int)a3;
- (void)setHasEditDistance:(BOOL)a3;
- (void)setHasNumDeletions:(BOOL)a3;
- (void)setHasNumInsertions:(BOOL)a3;
- (void)setHasNumSubstitutions:(BOOL)a3;
- (void)setHasReferenceName:(BOOL)a3;
- (void)setHasReferenceSize:(BOOL)a3;
- (void)setNumDeletions:(unsigned int)a3;
- (void)setNumInsertions:(unsigned int)a3;
- (void)setNumSubstitutions:(unsigned int)a3;
- (void)setReferenceName:(id)a3;
- (void)setReferenceSize:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation DODMLASRSchemaDODMLASRAlignmentInfo

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
}

- (void)setHasReferenceName:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (unsigned)referenceSize
{
  return self->_referenceSize;
}

- (unsigned)editDistance
{
  return self->_editDistance;
}

- (unsigned)numSubstitutions
{
  return self->_numSubstitutions;
}

- (unsigned)numInsertions
{
  return self->_numInsertions;
}

- (unsigned)numDeletions
{
  return self->_numDeletions;
}

- (void)setReferenceName:(id)a3
{
}

- (NSString)referenceName
{
  return self->_referenceName;
}

- (DODMLASRSchemaDODMLASRAlignmentInfo)initWithDictionary:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)DODMLASRSchemaDODMLASRAlignmentInfo;
  v5 = [(DODMLASRSchemaDODMLASRAlignmentInfo *)&v15 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"referenceName"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(DODMLASRSchemaDODMLASRAlignmentInfo *)v5 setReferenceName:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"numDeletions"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[DODMLASRSchemaDODMLASRAlignmentInfo setNumDeletions:](v5, "setNumDeletions:", [v8 unsignedIntValue]);
    }
    v9 = [v4 objectForKeyedSubscript:@"numInsertions"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[DODMLASRSchemaDODMLASRAlignmentInfo setNumInsertions:](v5, "setNumInsertions:", [v9 unsignedIntValue]);
    }
    v10 = [v4 objectForKeyedSubscript:@"numSubstitutions"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[DODMLASRSchemaDODMLASRAlignmentInfo setNumSubstitutions:](v5, "setNumSubstitutions:", [v10 unsignedIntValue]);
    }
    v11 = [v4 objectForKeyedSubscript:@"editDistance"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[DODMLASRSchemaDODMLASRAlignmentInfo setEditDistance:](v5, "setEditDistance:", [v11 unsignedIntValue]);
    }
    v12 = [v4 objectForKeyedSubscript:@"referenceSize"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[DODMLASRSchemaDODMLASRAlignmentInfo setReferenceSize:](v5, "setReferenceSize:", [v12 unsignedIntValue]);
    }
    v13 = v5;
  }
  return v5;
}

- (DODMLASRSchemaDODMLASRAlignmentInfo)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(DODMLASRSchemaDODMLASRAlignmentInfo *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(DODMLASRSchemaDODMLASRAlignmentInfo *)self dictionaryRepresentation];
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
    v10 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[DODMLASRSchemaDODMLASRAlignmentInfo editDistance](self, "editDistance"));
    [v3 setObject:v10 forKeyedSubscript:@"editDistance"];

    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_15;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  v11 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[DODMLASRSchemaDODMLASRAlignmentInfo numDeletions](self, "numDeletions"));
  [v3 setObject:v11 forKeyedSubscript:@"numDeletions"];

  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_15:
  v12 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[DODMLASRSchemaDODMLASRAlignmentInfo numInsertions](self, "numInsertions"));
  [v3 setObject:v12 forKeyedSubscript:@"numInsertions"];

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_5:
    v5 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[DODMLASRSchemaDODMLASRAlignmentInfo numSubstitutions](self, "numSubstitutions"));
    [v3 setObject:v5 forKeyedSubscript:@"numSubstitutions"];
  }
LABEL_6:
  if (self->_referenceName)
  {
    v6 = [(DODMLASRSchemaDODMLASRAlignmentInfo *)self referenceName];
    uint64_t v7 = (void *)[v6 copy];
    [v3 setObject:v7 forKeyedSubscript:@"referenceName"];
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    v8 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[DODMLASRSchemaDODMLASRAlignmentInfo referenceSize](self, "referenceSize"));
    [v3 setObject:v8 forKeyedSubscript:@"referenceSize"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_referenceName hash];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v4 = 2654435761 * self->_numDeletions;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_3:
      uint64_t v5 = 2654435761 * self->_numInsertions;
      if ((*(unsigned char *)&self->_has & 4) != 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v4 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    uint64_t v6 = 2654435761 * self->_numSubstitutions;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_5;
    }
LABEL_10:
    uint64_t v7 = 0;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_6;
    }
LABEL_11:
    uint64_t v8 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
  }
LABEL_9:
  uint64_t v6 = 0;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_10;
  }
LABEL_5:
  uint64_t v7 = 2654435761 * self->_editDistance;
  if ((*(unsigned char *)&self->_has & 0x10) == 0) {
    goto LABEL_11;
  }
LABEL_6:
  uint64_t v8 = 2654435761 * self->_referenceSize;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_28;
  }
  uint64_t v5 = [(DODMLASRSchemaDODMLASRAlignmentInfo *)self referenceName];
  uint64_t v6 = [v4 referenceName];
  uint64_t v7 = v6;
  if ((v5 == 0) == (v6 != 0))
  {

    goto LABEL_28;
  }
  uint64_t v8 = [(DODMLASRSchemaDODMLASRAlignmentInfo *)self referenceName];
  if (v8)
  {
    v9 = (void *)v8;
    v10 = [(DODMLASRSchemaDODMLASRAlignmentInfo *)self referenceName];
    v11 = [v4 referenceName];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_28;
    }
  }
  else
  {
  }
  $20352F484E6D8F53263CFAD7FB29F6DD has = self->_has;
  unsigned int v14 = v4[36];
  if ((*(unsigned char *)&has & 1) != (v14 & 1))
  {
LABEL_28:
    BOOL v24 = 0;
    goto LABEL_29;
  }
  if (*(unsigned char *)&has)
  {
    unsigned int numDeletions = self->_numDeletions;
    if (numDeletions != [v4 numDeletions]) {
      goto LABEL_28;
    }
    $20352F484E6D8F53263CFAD7FB29F6DD has = self->_has;
    unsigned int v14 = v4[36];
  }
  int v16 = (*(unsigned int *)&has >> 1) & 1;
  if (v16 != ((v14 >> 1) & 1)) {
    goto LABEL_28;
  }
  if (v16)
  {
    unsigned int numInsertions = self->_numInsertions;
    if (numInsertions != [v4 numInsertions]) {
      goto LABEL_28;
    }
    $20352F484E6D8F53263CFAD7FB29F6DD has = self->_has;
    unsigned int v14 = v4[36];
  }
  int v18 = (*(unsigned int *)&has >> 2) & 1;
  if (v18 != ((v14 >> 2) & 1)) {
    goto LABEL_28;
  }
  if (v18)
  {
    unsigned int numSubstitutions = self->_numSubstitutions;
    if (numSubstitutions != [v4 numSubstitutions]) {
      goto LABEL_28;
    }
    $20352F484E6D8F53263CFAD7FB29F6DD has = self->_has;
    unsigned int v14 = v4[36];
  }
  int v20 = (*(unsigned int *)&has >> 3) & 1;
  if (v20 != ((v14 >> 3) & 1)) {
    goto LABEL_28;
  }
  if (v20)
  {
    unsigned int editDistance = self->_editDistance;
    if (editDistance == [v4 editDistance])
    {
      $20352F484E6D8F53263CFAD7FB29F6DD has = self->_has;
      unsigned int v14 = v4[36];
      goto LABEL_24;
    }
    goto LABEL_28;
  }
LABEL_24:
  int v22 = (*(unsigned int *)&has >> 4) & 1;
  if (v22 != ((v14 >> 4) & 1)) {
    goto LABEL_28;
  }
  if (v22)
  {
    unsigned int referenceSize = self->_referenceSize;
    if (referenceSize != [v4 referenceSize]) {
      goto LABEL_28;
    }
  }
  BOOL v24 = 1;
LABEL_29:

  return v24;
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  uint64_t v4 = [(DODMLASRSchemaDODMLASRAlignmentInfo *)self referenceName];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteUint32Field();
    char has = (char)self->_has;
  }
  uint64_t v6 = v7;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    uint64_t v6 = v7;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_7:
      if ((has & 8) == 0) {
        goto LABEL_8;
      }
      goto LABEL_15;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteUint32Field();
  uint64_t v6 = v7;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_8:
    if ((has & 0x10) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_15:
  PBDataWriterWriteUint32Field();
  uint64_t v6 = v7;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_9:
    PBDataWriterWriteUint32Field();
    uint64_t v6 = v7;
  }
LABEL_10:
}

- (BOOL)readFrom:(id)a3
{
  return DODMLASRSchemaDODMLASRAlignmentInfoReadFrom(self, (uint64_t)a3);
}

- (void)deleteReferenceSize
{
  *(unsigned char *)&self->_has &= ~0x10u;
}

- (void)setHasReferenceSize:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasReferenceSize
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setReferenceSize:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_unsigned int referenceSize = a3;
}

- (void)deleteEditDistance
{
  *(unsigned char *)&self->_has &= ~8u;
}

- (void)setHasEditDistance:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasEditDistance
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setEditDistance:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_unsigned int editDistance = a3;
}

- (void)deleteNumSubstitutions
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasNumSubstitutions:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasNumSubstitutions
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setNumSubstitutions:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_unsigned int numSubstitutions = a3;
}

- (void)deleteNumInsertions
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasNumInsertions:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasNumInsertions
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setNumInsertions:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_unsigned int numInsertions = a3;
}

- (void)deleteNumDeletions
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasNumDeletions:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasNumDeletions
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setNumDeletions:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_unsigned int numDeletions = a3;
}

- (void)deleteReferenceName
{
}

- (BOOL)hasReferenceName
{
  return self->_referenceName != 0;
}

@end