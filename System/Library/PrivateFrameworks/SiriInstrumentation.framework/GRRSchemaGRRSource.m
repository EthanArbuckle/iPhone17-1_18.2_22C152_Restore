@interface GRRSchemaGRRSource
- (BOOL)hasSourceId;
- (BOOL)hasSourceType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GRRSchemaGRRSource)initWithDictionary:(id)a3;
- (GRRSchemaGRRSource)initWithJSON:(id)a3;
- (NSData)jsonData;
- (SISchemaUUID)sourceId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)sourceType;
- (unint64_t)hash;
- (void)deleteSourceId;
- (void)deleteSourceType;
- (void)setHasSourceId:(BOOL)a3;
- (void)setHasSourceType:(BOOL)a3;
- (void)setSourceId:(id)a3;
- (void)setSourceType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GRRSchemaGRRSource

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)GRRSchemaGRRSource;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(GRRSchemaGRRSource *)self sourceId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v7 suppressMessage];
  if (v4) {
    [(GRRSchemaGRRSource *)self deleteSourceId];
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

- (void)setHasSourceId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (int)sourceType
{
  return self->_sourceType;
}

- (void)setSourceId:(id)a3
{
}

- (SISchemaUUID)sourceId
{
  return self->_sourceId;
}

- (GRRSchemaGRRSource)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)GRRSchemaGRRSource;
  v5 = [(GRRSchemaGRRSource *)&v11 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"sourceId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaUUID alloc] initWithDictionary:v6];
      [(GRRSchemaGRRSource *)v5 setSourceId:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"sourceType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[GRRSchemaGRRSource setSourceType:](v5, "setSourceType:", [v8 intValue]);
    }
    objc_super v9 = v5;
  }
  return v5;
}

- (GRRSchemaGRRSource)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(GRRSchemaGRRSource *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(GRRSchemaGRRSource *)self dictionaryRepresentation];
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
  if (self->_sourceId)
  {
    id v4 = [(GRRSchemaGRRSource *)self sourceId];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"sourceId"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"sourceId"];
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    unsigned int v7 = [(GRRSchemaGRRSource *)self sourceType] - 1;
    if (v7 > 5) {
      v8 = @"GRRSOURCETYPE_UNKNOWN";
    }
    else {
      v8 = off_1E5EB05E0[v7];
    }
    [v3 setObject:v8 forKeyedSubscript:@"sourceType"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SISchemaUUID *)self->_sourceId hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_sourceType;
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
  v5 = [(GRRSchemaGRRSource *)self sourceId];
  v6 = [v4 sourceId];
  unsigned int v7 = v6;
  if ((v5 == 0) == (v6 != 0))
  {

LABEL_12:
    BOOL v14 = 0;
    goto LABEL_13;
  }
  uint64_t v8 = [(GRRSchemaGRRSource *)self sourceId];
  if (v8)
  {
    objc_super v9 = (void *)v8;
    v10 = [(GRRSchemaGRRSource *)self sourceId];
    objc_super v11 = [v4 sourceId];
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
    int sourceType = self->_sourceType;
    if (sourceType != [v4 sourceType]) {
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
  uint64_t v4 = [(GRRSchemaGRRSource *)self sourceId];

  if (v4)
  {
    v5 = [(GRRSchemaGRRSource *)self sourceId];
    PBDataWriterWriteSubmessage();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return GRRSchemaGRRSourceReadFrom(self, (uint64_t)a3);
}

- (void)deleteSourceType
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasSourceType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSourceType
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setSourceType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int sourceType = a3;
}

- (void)deleteSourceId
{
}

- (BOOL)hasSourceId
{
  return self->_sourceId != 0;
}

@end