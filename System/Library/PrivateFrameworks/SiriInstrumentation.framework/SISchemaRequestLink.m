@interface SISchemaRequestLink
- (BOOL)hasSource;
- (BOOL)hasTarget;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (SISchemaRequestLink)initWithDictionary:(id)a3;
- (SISchemaRequestLink)initWithJSON:(id)a3;
- (SISchemaRequestLinkInfo)source;
- (SISchemaRequestLinkInfo)target;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)qualifiedMessageName;
- (id)suppressMessageUnderConditions;
- (int)getAnyEventType;
- (unint64_t)hash;
- (void)deleteSource;
- (void)deleteTarget;
- (void)setHasSource:(BOOL)a3;
- (void)setHasTarget:(BOOL)a3;
- (void)setSource:(id)a3;
- (void)setTarget:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SISchemaRequestLink

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SISchemaRequestLink;
  v5 = [(SISchemaInstrumentationMessage *)&v13 applySensitiveConditionsPolicy:v4];
  v6 = [(SISchemaRequestLink *)self source];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(SISchemaRequestLink *)self deleteSource];
  }
  v9 = [(SISchemaRequestLink *)self target];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(SISchemaRequestLink *)self deleteTarget];
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
  objc_storeStrong((id *)&self->_target, 0);
  objc_storeStrong((id *)&self->_source, 0);
}

- (void)setHasTarget:(BOOL)a3
{
  self->_hasTarget = a3;
}

- (void)setHasSource:(BOOL)a3
{
  self->_hasSource = a3;
}

- (void)setTarget:(id)a3
{
}

- (SISchemaRequestLinkInfo)target
{
  return self->_target;
}

- (void)setSource:(id)a3
{
}

- (SISchemaRequestLinkInfo)source
{
  return self->_source;
}

- (SISchemaRequestLink)initWithDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SISchemaRequestLink;
  v5 = [(SISchemaRequestLink *)&v12 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"source"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaRequestLinkInfo alloc] initWithDictionary:v6];
      [(SISchemaRequestLink *)v5 setSource:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"target"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[SISchemaRequestLinkInfo alloc] initWithDictionary:v8];
      [(SISchemaRequestLink *)v5 setTarget:v9];
    }
    v10 = v5;
  }
  return v5;
}

- (SISchemaRequestLink)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(SISchemaRequestLink *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(SISchemaRequestLink *)self dictionaryRepresentation];
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
  if (self->_source)
  {
    id v4 = [(SISchemaRequestLink *)self source];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"source"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"source"];
    }
  }
  if (self->_target)
  {
    uint64_t v7 = [(SISchemaRequestLink *)self target];
    int v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"target"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"target"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SISchemaRequestLinkInfo *)self->_source hash];
  return [(SISchemaRequestLinkInfo *)self->_target hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  v5 = [(SISchemaRequestLink *)self source];
  v6 = [v4 source];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(SISchemaRequestLink *)self source];
  if (v7)
  {
    int v8 = (void *)v7;
    v9 = [(SISchemaRequestLink *)self source];
    v10 = [v4 source];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  v5 = [(SISchemaRequestLink *)self target];
  v6 = [v4 target];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v12 = [(SISchemaRequestLink *)self target];
    if (!v12)
    {

LABEL_15:
      BOOL v17 = 1;
      goto LABEL_13;
    }
    objc_super v13 = (void *)v12;
    v14 = [(SISchemaRequestLink *)self target];
    v15 = [v4 target];
    char v16 = [v14 isEqual:v15];

    if (v16) {
      goto LABEL_15;
    }
  }
  else
  {
LABEL_11:
  }
LABEL_12:
  BOOL v17 = 0;
LABEL_13:

  return v17;
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  id v4 = [(SISchemaRequestLink *)self source];

  if (v4)
  {
    v5 = [(SISchemaRequestLink *)self source];
    PBDataWriterWriteSubmessage();
  }
  v6 = [(SISchemaRequestLink *)self target];

  if (v6)
  {
    uint64_t v7 = [(SISchemaRequestLink *)self target];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return SISchemaRequestLinkReadFrom(self, (uint64_t)a3);
}

- (void)deleteTarget
{
}

- (BOOL)hasTarget
{
  return self->_target != 0;
}

- (void)deleteSource
{
}

- (BOOL)hasSource
{
  return self->_source != 0;
}

- (id)qualifiedMessageName
{
  return @"com.apple.aiml.siri.common.RequestLink";
}

- (int)getAnyEventType
{
  return 9;
}

@end