@interface PLUSSchemaPLUSContactSuggesterQueryStarted
- (BOOL)hasDomain;
- (BOOL)hasUsoPersonQuery;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (PLUSSchemaPLUSContactSuggesterQueryStarted)initWithDictionary:(id)a3;
- (PLUSSchemaPLUSContactSuggesterQueryStarted)initWithJSON:(id)a3;
- (USOSchemaUSOGraph)usoPersonQuery;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)domain;
- (unint64_t)hash;
- (void)deleteDomain;
- (void)deleteUsoPersonQuery;
- (void)setDomain:(int)a3;
- (void)setHasDomain:(BOOL)a3;
- (void)setHasUsoPersonQuery:(BOOL)a3;
- (void)setUsoPersonQuery:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PLUSSchemaPLUSContactSuggesterQueryStarted

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)PLUSSchemaPLUSContactSuggesterQueryStarted;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(PLUSSchemaPLUSContactSuggesterQueryStarted *)self usoPersonQuery];
  v7 = [v6 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v7 suppressMessage];
  if (v4) {
    [(PLUSSchemaPLUSContactSuggesterQueryStarted *)self deleteUsoPersonQuery];
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

- (void)setHasUsoPersonQuery:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (int)domain
{
  return self->_domain;
}

- (void)setUsoPersonQuery:(id)a3
{
}

- (USOSchemaUSOGraph)usoPersonQuery
{
  return self->_usoPersonQuery;
}

- (PLUSSchemaPLUSContactSuggesterQueryStarted)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PLUSSchemaPLUSContactSuggesterQueryStarted;
  v5 = [(PLUSSchemaPLUSContactSuggesterQueryStarted *)&v11 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"usoPersonQuery"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[USOSchemaUSOGraph alloc] initWithDictionary:v6];
      [(PLUSSchemaPLUSContactSuggesterQueryStarted *)v5 setUsoPersonQuery:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"domain"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PLUSSchemaPLUSContactSuggesterQueryStarted setDomain:](v5, "setDomain:", [v8 intValue]);
    }
    objc_super v9 = v5;
  }
  return v5;
}

- (PLUSSchemaPLUSContactSuggesterQueryStarted)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(PLUSSchemaPLUSContactSuggesterQueryStarted *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(PLUSSchemaPLUSContactSuggesterQueryStarted *)self dictionaryRepresentation];
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
  if (*(unsigned char *)&self->_has)
  {
    unsigned int v4 = [(PLUSSchemaPLUSContactSuggesterQueryStarted *)self domain] - 1;
    if (v4 > 3) {
      v5 = @"PLUSINFERENCECONTACTDOMAIN_UNKNOWN";
    }
    else {
      v5 = off_1E5EB4018[v4];
    }
    [v3 setObject:v5 forKeyedSubscript:@"domain"];
  }
  if (self->_usoPersonQuery)
  {
    v6 = [(PLUSSchemaPLUSContactSuggesterQueryStarted *)self usoPersonQuery];
    uint64_t v7 = [v6 dictionaryRepresentation];
    if (v7)
    {
      [v3 setObject:v7 forKeyedSubscript:@"usoPersonQuery"];
    }
    else
    {
      v8 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v8 forKeyedSubscript:@"usoPersonQuery"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(USOSchemaUSOGraph *)self->_usoPersonQuery hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_domain;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  v5 = [(PLUSSchemaPLUSContactSuggesterQueryStarted *)self usoPersonQuery];
  v6 = [v4 usoPersonQuery];
  uint64_t v7 = v6;
  if ((v5 == 0) == (v6 != 0))
  {

LABEL_12:
    BOOL v14 = 0;
    goto LABEL_13;
  }
  uint64_t v8 = [(PLUSSchemaPLUSContactSuggesterQueryStarted *)self usoPersonQuery];
  if (v8)
  {
    objc_super v9 = (void *)v8;
    v10 = [(PLUSSchemaPLUSContactSuggesterQueryStarted *)self usoPersonQuery];
    objc_super v11 = [v4 usoPersonQuery];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  if ((*(unsigned char *)&self->_has & 1) != (v4[20] & 1)) {
    goto LABEL_12;
  }
  if (*(unsigned char *)&self->_has)
  {
    int domain = self->_domain;
    if (domain != [v4 domain]) {
      goto LABEL_12;
    }
  }
  BOOL v14 = 1;
LABEL_13:

  return v14;
}

- (void)writeTo:(id)a3
{
  id v6 = a3;
  uint64_t v4 = [(PLUSSchemaPLUSContactSuggesterQueryStarted *)self usoPersonQuery];

  if (v4)
  {
    v5 = [(PLUSSchemaPLUSContactSuggesterQueryStarted *)self usoPersonQuery];
    PBDataWriterWriteSubmessage();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return PLUSSchemaPLUSContactSuggesterQueryStartedReadFrom(self, (uint64_t)a3);
}

- (void)deleteDomain
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasDomain:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDomain
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setDomain:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int domain = a3;
}

- (void)deleteUsoPersonQuery
{
}

- (BOOL)hasUsoPersonQuery
{
  return self->_usoPersonQuery != 0;
}

@end