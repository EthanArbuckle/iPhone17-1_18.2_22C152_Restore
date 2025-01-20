@interface MTSchemaMTFrameworkRequestResponseReceived
- (BOOL)hasFrameworkRequestId;
- (BOOL)hasNumSentences;
- (BOOL)hasRequestRoute;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (MTSchemaMTFrameworkRequestResponseReceived)initWithDictionary:(id)a3;
- (MTSchemaMTFrameworkRequestResponseReceived)initWithJSON:(id)a3;
- (NSData)jsonData;
- (SISchemaUUID)frameworkRequestId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)requestRoute;
- (unint64_t)hash;
- (unsigned)numSentences;
- (void)deleteFrameworkRequestId;
- (void)deleteNumSentences;
- (void)deleteRequestRoute;
- (void)setFrameworkRequestId:(id)a3;
- (void)setHasFrameworkRequestId:(BOOL)a3;
- (void)setHasNumSentences:(BOOL)a3;
- (void)setHasRequestRoute:(BOOL)a3;
- (void)setNumSentences:(unsigned int)a3;
- (void)setRequestRoute:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation MTSchemaMTFrameworkRequestResponseReceived

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)MTSchemaMTFrameworkRequestResponseReceived;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(MTSchemaMTFrameworkRequestResponseReceived *)self frameworkRequestId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v7 suppressMessage];
  if (v4) {
    [(MTSchemaMTFrameworkRequestResponseReceived *)self deleteFrameworkRequestId];
  }
  return v5;
}

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
}

- (void)setHasFrameworkRequestId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (unsigned)numSentences
{
  return self->_numSentences;
}

- (int)requestRoute
{
  return self->_requestRoute;
}

- (void)setFrameworkRequestId:(id)a3
{
}

- (SISchemaUUID)frameworkRequestId
{
  return self->_frameworkRequestId;
}

- (MTSchemaMTFrameworkRequestResponseReceived)initWithDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MTSchemaMTFrameworkRequestResponseReceived;
  v5 = [(MTSchemaMTFrameworkRequestResponseReceived *)&v12 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"frameworkRequestId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaUUID alloc] initWithDictionary:v6];
      [(MTSchemaMTFrameworkRequestResponseReceived *)v5 setFrameworkRequestId:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"requestRoute"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[MTSchemaMTFrameworkRequestResponseReceived setRequestRoute:](v5, "setRequestRoute:", [v8 intValue]);
    }
    objc_super v9 = [v4 objectForKeyedSubscript:@"numSentences"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[MTSchemaMTFrameworkRequestResponseReceived setNumSentences:](v5, "setNumSentences:", [v9 unsignedIntValue]);
    }
    v10 = v5;
  }
  return v5;
}

- (MTSchemaMTFrameworkRequestResponseReceived)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(MTSchemaMTFrameworkRequestResponseReceived *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(MTSchemaMTFrameworkRequestResponseReceived *)self dictionaryRepresentation];
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
  if (self->_frameworkRequestId)
  {
    id v4 = [(MTSchemaMTFrameworkRequestResponseReceived *)self frameworkRequestId];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"frameworkRequestId"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"frameworkRequestId"];
    }
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v8 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[MTSchemaMTFrameworkRequestResponseReceived numSentences](self, "numSentences"));
    [v3 setObject:v8 forKeyedSubscript:@"numSentences"];

    char has = (char)self->_has;
  }
  if (has)
  {
    int v9 = [(MTSchemaMTFrameworkRequestResponseReceived *)self requestRoute];
    v10 = @"MTFRAMEWORKREQUESTROUTE_UNKNOWN";
    if (v9 == 1) {
      v10 = @"MTFRAMEWORKREQUESTROUTE_NETWORK";
    }
    if (v9 == 2) {
      v11 = @"MTFRAMEWORKREQUESTROUTE_ON_DEVICE";
    }
    else {
      v11 = v10;
    }
    [v3 setObject:v11 forKeyedSubscript:@"requestRoute"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SISchemaUUID *)self->_frameworkRequestId hash];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v4 = 2654435761 * self->_requestRoute;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v5 = 0;
    return v4 ^ v3 ^ v5;
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v5 = 2654435761 * self->_numSentences;
  return v4 ^ v3 ^ v5;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_16;
  }
  uint64_t v5 = [(MTSchemaMTFrameworkRequestResponseReceived *)self frameworkRequestId];
  v6 = [v4 frameworkRequestId];
  uint64_t v7 = v6;
  if ((v5 == 0) == (v6 != 0))
  {

    goto LABEL_16;
  }
  uint64_t v8 = [(MTSchemaMTFrameworkRequestResponseReceived *)self frameworkRequestId];
  if (v8)
  {
    int v9 = (void *)v8;
    v10 = [(MTSchemaMTFrameworkRequestResponseReceived *)self frameworkRequestId];
    v11 = [v4 frameworkRequestId];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_16;
    }
  }
  else
  {
  }
  $EDCF6F106FE77D3F58EB31B13DA77F24 has = self->_has;
  unsigned int v14 = v4[24];
  if ((*(unsigned char *)&has & 1) != (v14 & 1))
  {
LABEL_16:
    BOOL v18 = 0;
    goto LABEL_17;
  }
  if (*(unsigned char *)&has)
  {
    int requestRoute = self->_requestRoute;
    if (requestRoute == [v4 requestRoute])
    {
      $EDCF6F106FE77D3F58EB31B13DA77F24 has = self->_has;
      unsigned int v14 = v4[24];
      goto LABEL_12;
    }
    goto LABEL_16;
  }
LABEL_12:
  int v16 = (*(unsigned int *)&has >> 1) & 1;
  if (v16 != ((v14 >> 1) & 1)) {
    goto LABEL_16;
  }
  if (v16)
  {
    unsigned int numSentences = self->_numSentences;
    if (numSentences != [v4 numSentences]) {
      goto LABEL_16;
    }
  }
  BOOL v18 = 1;
LABEL_17:

  return v18;
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  uint64_t v4 = [(MTSchemaMTFrameworkRequestResponseReceived *)self frameworkRequestId];

  if (v4)
  {
    uint64_t v5 = [(MTSchemaMTFrameworkRequestResponseReceived *)self frameworkRequestId];
    PBDataWriterWriteSubmessage();
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
  }
  uint64_t v7 = v8;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    uint64_t v7 = v8;
  }
}

- (BOOL)readFrom:(id)a3
{
  return MTSchemaMTFrameworkRequestResponseReceivedReadFrom(self, (uint64_t)a3);
}

- (void)deleteNumSentences
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasNumSentences:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasNumSentences
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setNumSentences:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_unsigned int numSentences = a3;
}

- (void)deleteRequestRoute
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasRequestRoute:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasRequestRoute
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setRequestRoute:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int requestRoute = a3;
}

- (void)deleteFrameworkRequestId
{
}

- (BOOL)hasFrameworkRequestId
{
  return self->_frameworkRequestId != 0;
}

@end