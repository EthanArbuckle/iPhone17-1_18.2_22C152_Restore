@interface NLXSchemaSSUUserRequestMatchInfo
- (BOOL)hasMatchingUtteranceCandidateType;
- (BOOL)hasNumEntities;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NLXSchemaSSUUserRequestMatchInfo)initWithDictionary:(id)a3;
- (NLXSchemaSSUUserRequestMatchInfo)initWithJSON:(id)a3;
- (NSData)jsonData;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)matchingUtteranceCandidateType;
- (unint64_t)hash;
- (unsigned)numEntities;
- (void)deleteMatchingUtteranceCandidateType;
- (void)deleteNumEntities;
- (void)setHasMatchingUtteranceCandidateType:(BOOL)a3;
- (void)setHasNumEntities:(BOOL)a3;
- (void)setMatchingUtteranceCandidateType:(int)a3;
- (void)setNumEntities:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation NLXSchemaSSUUserRequestMatchInfo

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (unsigned)numEntities
{
  return self->_numEntities;
}

- (int)matchingUtteranceCandidateType
{
  return self->_matchingUtteranceCandidateType;
}

- (NLXSchemaSSUUserRequestMatchInfo)initWithDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)NLXSchemaSSUUserRequestMatchInfo;
  v5 = [(NLXSchemaSSUUserRequestMatchInfo *)&v10 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"matchingUtteranceCandidateType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[NLXSchemaSSUUserRequestMatchInfo setMatchingUtteranceCandidateType:](v5, "setMatchingUtteranceCandidateType:", [v6 intValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"numEntities"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[NLXSchemaSSUUserRequestMatchInfo setNumEntities:](v5, "setNumEntities:", [v7 unsignedIntValue]);
    }
    v8 = v5;
  }
  return v5;
}

- (NLXSchemaSSUUserRequestMatchInfo)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(NLXSchemaSSUUserRequestMatchInfo *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(NLXSchemaSSUUserRequestMatchInfo *)self dictionaryRepresentation];
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
    int v5 = [(NLXSchemaSSUUserRequestMatchInfo *)self matchingUtteranceCandidateType];
    v6 = @"SSUUTTERANCECANDIDATETYPE_UNKNOWN";
    if (v5 == 1) {
      v6 = @"SSUUTTERANCECANDIDATETYPE_ORIGINAL";
    }
    if (v5 == 2) {
      uint64_t v7 = @"SSUUTTERANCECANDIDATETYPE_ALTERNATIVE";
    }
    else {
      uint64_t v7 = v6;
    }
    [v3 setObject:v7 forKeyedSubscript:@"matchingUtteranceCandidateType"];
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v8 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[NLXSchemaSSUUserRequestMatchInfo numEntities](self, "numEntities"));
    [v3 setObject:v8 forKeyedSubscript:@"numEntities"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v2 = 2654435761 * self->_matchingUtteranceCandidateType;
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
  uint64_t v3 = 2654435761 * self->_numEntities;
  return v3 ^ v2;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_10;
  }
  $2A23DE3E5703E746EF07A68D11ACE27F has = self->_has;
  unsigned int v6 = v4[16];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_10;
  }
  if (*(unsigned char *)&has)
  {
    int matchingUtteranceCandidateType = self->_matchingUtteranceCandidateType;
    if (matchingUtteranceCandidateType != [v4 matchingUtteranceCandidateType])
    {
LABEL_10:
      BOOL v10 = 0;
      goto LABEL_11;
    }
    $2A23DE3E5703E746EF07A68D11ACE27F has = self->_has;
    unsigned int v6 = v4[16];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_10;
  }
  if (v8)
  {
    unsigned int numEntities = self->_numEntities;
    if (numEntities != [v4 numEntities]) {
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
    PBDataWriterWriteInt32Field();
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
  return NLXSchemaSSUUserRequestMatchInfoReadFrom(self, (uint64_t)a3);
}

- (void)deleteNumEntities
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasNumEntities:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasNumEntities
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setNumEntities:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_unsigned int numEntities = a3;
}

- (void)deleteMatchingUtteranceCandidateType
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasMatchingUtteranceCandidateType:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasMatchingUtteranceCandidateType
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setMatchingUtteranceCandidateType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int matchingUtteranceCandidateType = a3;
}

@end