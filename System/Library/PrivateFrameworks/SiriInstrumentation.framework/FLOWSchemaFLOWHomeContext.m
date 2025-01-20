@interface FLOWSchemaFLOWHomeContext
- (BOOL)hasAppleTvCount;
- (BOOL)hasCurrentHome;
- (BOOL)hasHasCurrentHome;
- (BOOL)hasHomeCount;
- (BOOL)hasHomePodCount;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (FLOWSchemaFLOWHomeContext)initWithDictionary:(id)a3;
- (FLOWSchemaFLOWHomeContext)initWithJSON:(id)a3;
- (NSData)jsonData;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unsigned)appleTvCount;
- (unsigned)homeCount;
- (unsigned)homePodCount;
- (void)deleteAppleTvCount;
- (void)deleteHasCurrentHome;
- (void)deleteHomeCount;
- (void)deleteHomePodCount;
- (void)setAppleTvCount:(unsigned int)a3;
- (void)setHasAppleTvCount:(BOOL)a3;
- (void)setHasCurrentHome:(BOOL)a3;
- (void)setHasHasCurrentHome:(BOOL)a3;
- (void)setHasHomeCount:(BOOL)a3;
- (void)setHasHomePodCount:(BOOL)a3;
- (void)setHomeCount:(unsigned int)a3;
- (void)setHomePodCount:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation FLOWSchemaFLOWHomeContext

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (BOOL)hasCurrentHome
{
  return self->_hasCurrentHome;
}

- (unsigned)appleTvCount
{
  return self->_appleTvCount;
}

- (unsigned)homePodCount
{
  return self->_homePodCount;
}

- (unsigned)homeCount
{
  return self->_homeCount;
}

- (FLOWSchemaFLOWHomeContext)initWithDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)FLOWSchemaFLOWHomeContext;
  v5 = [(FLOWSchemaFLOWHomeContext *)&v12 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"homeCount"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[FLOWSchemaFLOWHomeContext setHomeCount:](v5, "setHomeCount:", [v6 unsignedIntValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"homePodCount"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[FLOWSchemaFLOWHomeContext setHomePodCount:](v5, "setHomePodCount:", [v7 unsignedIntValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"appleTvCount"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[FLOWSchemaFLOWHomeContext setAppleTvCount:](v5, "setAppleTvCount:", [v8 unsignedIntValue]);
    }
    v9 = [v4 objectForKeyedSubscript:@"hasCurrentHome"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[FLOWSchemaFLOWHomeContext setHasCurrentHome:](v5, "setHasCurrentHome:", [v9 BOOLValue]);
    }
    v10 = v5;
  }
  return v5;
}

- (FLOWSchemaFLOWHomeContext)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(FLOWSchemaFLOWHomeContext *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(FLOWSchemaFLOWHomeContext *)self dictionaryRepresentation];
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
  char v4 = *(&self->_hasCurrentHome + 1);
  if ((v4 & 4) != 0)
  {
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[FLOWSchemaFLOWHomeContext appleTvCount](self, "appleTvCount"));
    [v3 setObject:v7 forKeyedSubscript:@"appleTvCount"];

    char v4 = *(&self->_hasCurrentHome + 1);
    if ((v4 & 8) == 0)
    {
LABEL_3:
      if ((v4 & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(&self->_hasCurrentHome + 1) & 8) == 0)
  {
    goto LABEL_3;
  }
  v8 = objc_msgSend(NSNumber, "numberWithBool:", -[FLOWSchemaFLOWHomeContext hasCurrentHome](self, "hasCurrentHome"));
  [v3 setObject:v8 forKeyedSubscript:@"hasCurrentHome"];

  char v4 = *(&self->_hasCurrentHome + 1);
  if ((v4 & 1) == 0)
  {
LABEL_4:
    if ((v4 & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  v9 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[FLOWSchemaFLOWHomeContext homeCount](self, "homeCount"));
  [v3 setObject:v9 forKeyedSubscript:@"homeCount"];

  if ((*(&self->_hasCurrentHome + 1) & 2) != 0)
  {
LABEL_5:
    v5 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[FLOWSchemaFLOWHomeContext homePodCount](self, "homePodCount"));
    [v3 setObject:v5 forKeyedSubscript:@"homePodCount"];
  }
LABEL_6:
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(&self->_hasCurrentHome + 1))
  {
    uint64_t v2 = 2654435761 * self->_homeCount;
    if ((*(&self->_hasCurrentHome + 1) & 2) != 0)
    {
LABEL_3:
      uint64_t v3 = 2654435761 * self->_homePodCount;
      if ((*(&self->_hasCurrentHome + 1) & 4) != 0) {
        goto LABEL_4;
      }
LABEL_8:
      uint64_t v4 = 0;
      if ((*(&self->_hasCurrentHome + 1) & 8) != 0) {
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
    if ((*(&self->_hasCurrentHome + 1) & 2) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v3 = 0;
  if ((*(&self->_hasCurrentHome + 1) & 4) == 0) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v4 = 2654435761 * self->_appleTvCount;
  if ((*(&self->_hasCurrentHome + 1) & 8) == 0) {
    goto LABEL_9;
  }
LABEL_5:
  uint64_t v5 = 2654435761 * self->_hasCurrentHome;
  return v3 ^ v2 ^ v4 ^ v5;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_18;
  }
  unsigned int v5 = *((unsigned __int8 *)&self->_hasCurrentHome + 1);
  unsigned int v6 = v4[21];
  if ((v5 & 1) != (v6 & 1)) {
    goto LABEL_18;
  }
  if (v5)
  {
    unsigned int homeCount = self->_homeCount;
    if (homeCount != [v4 homeCount]) {
      goto LABEL_18;
    }
    unsigned int v5 = *((unsigned __int8 *)&self->_hasCurrentHome + 1);
    unsigned int v6 = v4[21];
  }
  int v8 = (v5 >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_18;
  }
  if (v8)
  {
    unsigned int homePodCount = self->_homePodCount;
    if (homePodCount != [v4 homePodCount]) {
      goto LABEL_18;
    }
    unsigned int v5 = *((unsigned __int8 *)&self->_hasCurrentHome + 1);
    unsigned int v6 = v4[21];
  }
  int v10 = (v5 >> 2) & 1;
  if (v10 != ((v6 >> 2) & 1)) {
    goto LABEL_18;
  }
  if (v10)
  {
    unsigned int appleTvCount = self->_appleTvCount;
    if (appleTvCount == [v4 appleTvCount])
    {
      unsigned int v5 = *((unsigned __int8 *)&self->_hasCurrentHome + 1);
      unsigned int v6 = v4[21];
      goto LABEL_14;
    }
LABEL_18:
    BOOL v14 = 0;
    goto LABEL_19;
  }
LABEL_14:
  int v12 = (v5 >> 3) & 1;
  if (v12 != ((v6 >> 3) & 1)) {
    goto LABEL_18;
  }
  if (v12)
  {
    int hasCurrentHome = self->_hasCurrentHome;
    if (hasCurrentHome != [v4 hasCurrentHome]) {
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
  char v4 = *(&self->_hasCurrentHome + 1);
  if (v4)
  {
    PBDataWriterWriteUint32Field();
    char v4 = *(&self->_hasCurrentHome + 1);
    if ((v4 & 2) == 0)
    {
LABEL_3:
      if ((v4 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(&self->_hasCurrentHome + 1) & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  char v4 = *(&self->_hasCurrentHome + 1);
  if ((v4 & 4) == 0)
  {
LABEL_4:
    if ((v4 & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  PBDataWriterWriteUint32Field();
  if ((*(&self->_hasCurrentHome + 1) & 8) != 0) {
LABEL_5:
  }
    PBDataWriterWriteBOOLField();
LABEL_6:
}

- (BOOL)readFrom:(id)a3
{
  return FLOWSchemaFLOWHomeContextReadFrom(self, (uint64_t)a3);
}

- (void)deleteHasCurrentHome
{
  *(&self->_hasCurrentHome + 1) &= ~8u;
}

- (void)setHasHasCurrentHome:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(&self->_hasCurrentHome + 1) = *(&self->_hasCurrentHome + 1) & 0xF7 | v3;
}

- (BOOL)hasHasCurrentHome
{
  return (*((unsigned __int8 *)&self->_hasCurrentHome + 1) >> 3) & 1;
}

- (void)setHasCurrentHome:(BOOL)a3
{
  *(&self->_hasCurrentHome + 1) |= 8u;
  self->_int hasCurrentHome = a3;
}

- (void)deleteAppleTvCount
{
  *(&self->_hasCurrentHome + 1) &= ~4u;
}

- (void)setHasAppleTvCount:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(&self->_hasCurrentHome + 1) = *(&self->_hasCurrentHome + 1) & 0xFB | v3;
}

- (BOOL)hasAppleTvCount
{
  return (*((unsigned __int8 *)&self->_hasCurrentHome + 1) >> 2) & 1;
}

- (void)setAppleTvCount:(unsigned int)a3
{
  *(&self->_hasCurrentHome + 1) |= 4u;
  self->_unsigned int appleTvCount = a3;
}

- (void)deleteHomePodCount
{
  *(&self->_hasCurrentHome + 1) &= ~2u;
}

- (void)setHasHomePodCount:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(&self->_hasCurrentHome + 1) = *(&self->_hasCurrentHome + 1) & 0xFD | v3;
}

- (BOOL)hasHomePodCount
{
  return (*((unsigned __int8 *)&self->_hasCurrentHome + 1) >> 1) & 1;
}

- (void)setHomePodCount:(unsigned int)a3
{
  *(&self->_hasCurrentHome + 1) |= 2u;
  self->_unsigned int homePodCount = a3;
}

- (void)deleteHomeCount
{
  *(&self->_hasCurrentHome + 1) &= ~1u;
}

- (void)setHasHomeCount:(BOOL)a3
{
  *(&self->_hasCurrentHome + 1) = *(&self->_hasCurrentHome + 1) & 0xFE | a3;
}

- (BOOL)hasHomeCount
{
  return *(&self->_hasCurrentHome + 1);
}

- (void)setHomeCount:(unsigned int)a3
{
  *(&self->_hasCurrentHome + 1) |= 1u;
  self->_unsigned int homeCount = a3;
}

@end