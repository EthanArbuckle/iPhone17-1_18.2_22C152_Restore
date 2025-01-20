@interface MTSchemaMTFrameworkRequestSent
- (BOOL)hasFrameworkRequestId;
- (BOOL)hasQssSessionId;
- (BOOL)hasRequestRoute;
- (BOOL)hasRequestSize;
- (BOOL)hasRequestType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (MTSchemaMTFrameworkRequestSent)initWithDictionary:(id)a3;
- (MTSchemaMTFrameworkRequestSent)initWithJSON:(id)a3;
- (NSData)jsonData;
- (NSString)qssSessionId;
- (SISchemaUUID)frameworkRequestId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)requestRoute;
- (int)requestType;
- (unint64_t)hash;
- (unsigned)requestSize;
- (void)deleteFrameworkRequestId;
- (void)deleteQssSessionId;
- (void)deleteRequestRoute;
- (void)deleteRequestSize;
- (void)deleteRequestType;
- (void)setFrameworkRequestId:(id)a3;
- (void)setHasFrameworkRequestId:(BOOL)a3;
- (void)setHasQssSessionId:(BOOL)a3;
- (void)setHasRequestRoute:(BOOL)a3;
- (void)setHasRequestSize:(BOOL)a3;
- (void)setHasRequestType:(BOOL)a3;
- (void)setQssSessionId:(id)a3;
- (void)setRequestRoute:(int)a3;
- (void)setRequestSize:(unsigned int)a3;
- (void)setRequestType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation MTSchemaMTFrameworkRequestSent

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)MTSchemaMTFrameworkRequestSent;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(MTSchemaMTFrameworkRequestSent *)self frameworkRequestId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v7 suppressMessage];
  if (v4) {
    [(MTSchemaMTFrameworkRequestSent *)self deleteFrameworkRequestId];
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
  objc_storeStrong((id *)&self->_qssSessionId, 0);
  objc_storeStrong((id *)&self->_frameworkRequestId, 0);
}

- (void)setHasQssSessionId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasFrameworkRequestId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (unsigned)requestSize
{
  return self->_requestSize;
}

- (int)requestRoute
{
  return self->_requestRoute;
}

- (int)requestType
{
  return self->_requestType;
}

- (void)setQssSessionId:(id)a3
{
}

- (NSString)qssSessionId
{
  return self->_qssSessionId;
}

- (void)setFrameworkRequestId:(id)a3
{
}

- (SISchemaUUID)frameworkRequestId
{
  return self->_frameworkRequestId;
}

- (MTSchemaMTFrameworkRequestSent)initWithDictionary:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MTSchemaMTFrameworkRequestSent;
  v5 = [(MTSchemaMTFrameworkRequestSent *)&v15 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"frameworkRequestId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaUUID alloc] initWithDictionary:v6];
      [(MTSchemaMTFrameworkRequestSent *)v5 setFrameworkRequestId:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"qssSessionId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v9 = (void *)[v8 copy];
      [(MTSchemaMTFrameworkRequestSent *)v5 setQssSessionId:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"requestType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[MTSchemaMTFrameworkRequestSent setRequestType:](v5, "setRequestType:", [v10 intValue]);
    }
    v11 = [v4 objectForKeyedSubscript:@"requestRoute"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[MTSchemaMTFrameworkRequestSent setRequestRoute:](v5, "setRequestRoute:", [v11 intValue]);
    }
    v12 = [v4 objectForKeyedSubscript:@"requestSize"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[MTSchemaMTFrameworkRequestSent setRequestSize:](v5, "setRequestSize:", [v12 unsignedIntValue]);
    }
    v13 = v5;
  }
  return v5;
}

- (MTSchemaMTFrameworkRequestSent)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(MTSchemaMTFrameworkRequestSent *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(MTSchemaMTFrameworkRequestSent *)self dictionaryRepresentation];
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
    id v4 = [(MTSchemaMTFrameworkRequestSent *)self frameworkRequestId];
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
  if (self->_qssSessionId)
  {
    uint64_t v7 = [(MTSchemaMTFrameworkRequestSent *)self qssSessionId];
    v8 = (void *)[v7 copy];
    [v3 setObject:v8 forKeyedSubscript:@"qssSessionId"];
  }
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      goto LABEL_10;
    }
LABEL_18:
    v13 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[MTSchemaMTFrameworkRequestSent requestSize](self, "requestSize"));
    [v3 setObject:v13 forKeyedSubscript:@"requestSize"];

    if ((*(unsigned char *)&self->_has & 1) == 0) {
      goto LABEL_23;
    }
LABEL_19:
    unsigned int v14 = [(MTSchemaMTFrameworkRequestSent *)self requestType] - 1;
    if (v14 > 3) {
      objc_super v15 = @"MTFRAMEWORKREQUESTTYPE_UNKNOWN";
    }
    else {
      objc_super v15 = off_1E5EBCD08[v14];
    }
    [v3 setObject:v15 forKeyedSubscript:@"requestType"];
    goto LABEL_23;
  }
  int v10 = [(MTSchemaMTFrameworkRequestSent *)self requestRoute];
  v11 = @"MTFRAMEWORKREQUESTROUTE_UNKNOWN";
  if (v10 == 1) {
    v11 = @"MTFRAMEWORKREQUESTROUTE_NETWORK";
  }
  if (v10 == 2) {
    v12 = @"MTFRAMEWORKREQUESTROUTE_ON_DEVICE";
  }
  else {
    v12 = v11;
  }
  [v3 setObject:v12 forKeyedSubscript:@"requestRoute"];
  char has = (char)self->_has;
  if ((has & 4) != 0) {
    goto LABEL_18;
  }
LABEL_10:
  if (has) {
    goto LABEL_19;
  }
LABEL_23:
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SISchemaUUID *)self->_frameworkRequestId hash];
  NSUInteger v4 = [(NSString *)self->_qssSessionId hash];
  if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    uint64_t v5 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v6 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v7 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7;
  }
  uint64_t v5 = 2654435761 * self->_requestType;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v6 = 2654435761 * self->_requestRoute;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v7 = 2654435761 * self->_requestSize;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  uint64_t v5 = [(MTSchemaMTFrameworkRequestSent *)self frameworkRequestId];
  uint64_t v6 = [v4 frameworkRequestId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(MTSchemaMTFrameworkRequestSent *)self frameworkRequestId];
  if (v7)
  {
    v8 = (void *)v7;
    objc_super v9 = [(MTSchemaMTFrameworkRequestSent *)self frameworkRequestId];
    int v10 = [v4 frameworkRequestId];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  uint64_t v5 = [(MTSchemaMTFrameworkRequestSent *)self qssSessionId];
  uint64_t v6 = [v4 qssSessionId];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_11:

    goto LABEL_12;
  }
  uint64_t v12 = [(MTSchemaMTFrameworkRequestSent *)self qssSessionId];
  if (v12)
  {
    v13 = (void *)v12;
    unsigned int v14 = [(MTSchemaMTFrameworkRequestSent *)self qssSessionId];
    objc_super v15 = [v4 qssSessionId];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  $B40913571C17A7349FC22A445C89C092 has = self->_has;
  unsigned int v20 = v4[36];
  if ((*(unsigned char *)&has & 1) == (v20 & 1))
  {
    if (*(unsigned char *)&has)
    {
      int requestType = self->_requestType;
      if (requestType != [v4 requestType]) {
        goto LABEL_12;
      }
      $B40913571C17A7349FC22A445C89C092 has = self->_has;
      unsigned int v20 = v4[36];
    }
    int v22 = (*(unsigned int *)&has >> 1) & 1;
    if (v22 == ((v20 >> 1) & 1))
    {
      if (v22)
      {
        int requestRoute = self->_requestRoute;
        if (requestRoute != [v4 requestRoute]) {
          goto LABEL_12;
        }
        $B40913571C17A7349FC22A445C89C092 has = self->_has;
        unsigned int v20 = v4[36];
      }
      int v24 = (*(unsigned int *)&has >> 2) & 1;
      if (v24 == ((v20 >> 2) & 1))
      {
        if (!v24 || (unsigned int requestSize = self->_requestSize, requestSize == [v4 requestSize]))
        {
          BOOL v17 = 1;
          goto LABEL_13;
        }
      }
    }
  }
LABEL_12:
  BOOL v17 = 0;
LABEL_13:

  return v17;
}

- (void)writeTo:(id)a3
{
  id v9 = a3;
  NSUInteger v4 = [(MTSchemaMTFrameworkRequestSent *)self frameworkRequestId];

  if (v4)
  {
    uint64_t v5 = [(MTSchemaMTFrameworkRequestSent *)self frameworkRequestId];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v6 = [(MTSchemaMTFrameworkRequestSent *)self qssSessionId];

  if (v6) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  v8 = v9;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    v8 = v9;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_7:
      if ((has & 4) == 0) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteInt32Field();
  v8 = v9;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_8:
    PBDataWriterWriteUint32Field();
    v8 = v9;
  }
LABEL_9:
}

- (BOOL)readFrom:(id)a3
{
  return MTSchemaMTFrameworkRequestSentReadFrom(self, (uint64_t)a3);
}

- (void)deleteRequestSize
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasRequestSize:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasRequestSize
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setRequestSize:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_unsigned int requestSize = a3;
}

- (void)deleteRequestRoute
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasRequestRoute:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasRequestRoute
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setRequestRoute:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int requestRoute = a3;
}

- (void)deleteRequestType
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasRequestType:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasRequestType
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setRequestType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int requestType = a3;
}

- (void)deleteQssSessionId
{
}

- (BOOL)hasQssSessionId
{
  return self->_qssSessionId != 0;
}

- (void)deleteFrameworkRequestId
{
}

- (BOOL)hasFrameworkRequestId
{
  return self->_frameworkRequestId != 0;
}

@end