@interface PEGASUSSchemaPEGASUSRewrittenUtterance
- (BOOL)hasIsUsed;
- (BOOL)hasRewriteType;
- (BOOL)isEqual:(id)a3;
- (BOOL)isUsed;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (PEGASUSSchemaPEGASUSRewrittenUtterance)initWithDictionary:(id)a3;
- (PEGASUSSchemaPEGASUSRewrittenUtterance)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)rewriteType;
- (unint64_t)hash;
- (void)deleteIsUsed;
- (void)deleteRewriteType;
- (void)setHasIsUsed:(BOOL)a3;
- (void)setHasRewriteType:(BOOL)a3;
- (void)setIsUsed:(BOOL)a3;
- (void)setRewriteType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation PEGASUSSchemaPEGASUSRewrittenUtterance

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (BOOL)isUsed
{
  return self->_isUsed;
}

- (int)rewriteType
{
  return self->_rewriteType;
}

- (PEGASUSSchemaPEGASUSRewrittenUtterance)initWithDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PEGASUSSchemaPEGASUSRewrittenUtterance;
  v5 = [(PEGASUSSchemaPEGASUSRewrittenUtterance *)&v10 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"rewriteType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PEGASUSSchemaPEGASUSRewrittenUtterance setRewriteType:](v5, "setRewriteType:", [v6 intValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"isUsed"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PEGASUSSchemaPEGASUSRewrittenUtterance setIsUsed:](v5, "setIsUsed:", [v7 BOOLValue]);
    }
    v8 = v5;
  }
  return v5;
}

- (PEGASUSSchemaPEGASUSRewrittenUtterance)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(PEGASUSSchemaPEGASUSRewrittenUtterance *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(PEGASUSSchemaPEGASUSRewrittenUtterance *)self dictionaryRepresentation];
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
  char v4 = *(&self->_isUsed + 1);
  if ((v4 & 2) != 0)
  {
    v5 = objc_msgSend(NSNumber, "numberWithBool:", -[PEGASUSSchemaPEGASUSRewrittenUtterance isUsed](self, "isUsed"));
    [v3 setObject:v5 forKeyedSubscript:@"isUsed"];

    char v4 = *(&self->_isUsed + 1);
  }
  if (v4)
  {
    unsigned int v6 = [(PEGASUSSchemaPEGASUSRewrittenUtterance *)self rewriteType] - 1;
    if (v6 > 3) {
      uint64_t v7 = @"PEGASUSUTTERANCEREWRITETYPE_UNKNOWN";
    }
    else {
      uint64_t v7 = off_1E5EBB330[v6];
    }
    [v3 setObject:v7 forKeyedSubscript:@"rewriteType"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(&self->_isUsed + 1))
  {
    uint64_t v2 = 2654435761 * self->_rewriteType;
    if ((*(&self->_isUsed + 1) & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v3 = 0;
    return v3 ^ v2;
  }
  uint64_t v2 = 0;
  if ((*(&self->_isUsed + 1) & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_isUsed;
  return v3 ^ v2;
}

- (BOOL)isEqual:(id)a3
{
  char v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_10;
  }
  unsigned int v5 = *((unsigned __int8 *)&self->_isUsed + 1);
  unsigned int v6 = v4[13];
  if ((v5 & 1) != (v6 & 1)) {
    goto LABEL_10;
  }
  if (v5)
  {
    int rewriteType = self->_rewriteType;
    if (rewriteType != [v4 rewriteType])
    {
LABEL_10:
      BOOL v10 = 0;
      goto LABEL_11;
    }
    unsigned int v5 = *((unsigned __int8 *)&self->_isUsed + 1);
    unsigned int v6 = v4[13];
  }
  int v8 = (v5 >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_10;
  }
  if (v8)
  {
    int isUsed = self->_isUsed;
    if (isUsed != [v4 isUsed]) {
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
  char v5 = *(&self->_isUsed + 1);
  id v6 = v4;
  if (v5)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
    char v5 = *(&self->_isUsed + 1);
  }
  if ((v5 & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
  }
}

- (BOOL)readFrom:(id)a3
{
  return PEGASUSSchemaPEGASUSRewrittenUtteranceReadFrom(self, (uint64_t)a3);
}

- (void)deleteIsUsed
{
  *(&self->_isUsed + 1) &= ~2u;
}

- (void)setHasIsUsed:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(&self->_isUsed + 1) = *(&self->_isUsed + 1) & 0xFD | v3;
}

- (BOOL)hasIsUsed
{
  return (*((unsigned __int8 *)&self->_isUsed + 1) >> 1) & 1;
}

- (void)setIsUsed:(BOOL)a3
{
  *(&self->_isUsed + 1) |= 2u;
  self->_int isUsed = a3;
}

- (void)deleteRewriteType
{
  *(&self->_isUsed + 1) &= ~1u;
}

- (void)setHasRewriteType:(BOOL)a3
{
  *(&self->_isUsed + 1) = *(&self->_isUsed + 1) & 0xFE | a3;
}

- (BOOL)hasRewriteType
{
  return *(&self->_isUsed + 1);
}

- (void)setRewriteType:(int)a3
{
  *(&self->_isUsed + 1) |= 1u;
  self->_int rewriteType = a3;
}

@end