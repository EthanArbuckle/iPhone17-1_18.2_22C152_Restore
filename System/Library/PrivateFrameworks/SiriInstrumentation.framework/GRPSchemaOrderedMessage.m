@interface GRPSchemaOrderedMessage
- (BOOL)hasLogicalEventTimestampInNs;
- (BOOL)hasSiriEventTypeUnion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GRPSchemaOrderedMessage)initWithDictionary:(id)a3;
- (GRPSchemaOrderedMessage)initWithJSON:(id)a3;
- (GRPSchemaSiriEventTypeUnion)siriEventTypeUnion;
- (NSData)jsonData;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int64_t)logicalEventTimestampInNs;
- (unint64_t)hash;
- (unint64_t)whichEvent_Type;
- (void)deleteLogicalEventTimestampInNs;
- (void)deleteSiriEventTypeUnion;
- (void)setHasLogicalEventTimestampInNs:(BOOL)a3;
- (void)setHasSiriEventTypeUnion:(BOOL)a3;
- (void)setLogicalEventTimestampInNs:(int64_t)a3;
- (void)setSiriEventTypeUnion:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GRPSchemaOrderedMessage

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)GRPSchemaOrderedMessage;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(GRPSchemaOrderedMessage *)self siriEventTypeUnion];
  v7 = [v6 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v7 suppressMessage];
  if (v4) {
    [(GRPSchemaOrderedMessage *)self deleteSiriEventTypeUnion];
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

- (void)setHasSiriEventTypeUnion:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (BOOL)hasSiriEventTypeUnion
{
  return *((unsigned char *)&self->_has + 1);
}

- (int64_t)logicalEventTimestampInNs
{
  return self->_logicalEventTimestampInNs;
}

- (unint64_t)whichEvent_Type
{
  return self->_whichEvent_Type;
}

- (GRPSchemaOrderedMessage)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)GRPSchemaOrderedMessage;
  v5 = [(GRPSchemaOrderedMessage *)&v11 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"logicalEventTimestampInNs"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[GRPSchemaOrderedMessage setLogicalEventTimestampInNs:](v5, "setLogicalEventTimestampInNs:", [v6 longLongValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"siriEventTypeUnion"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v8 = [[GRPSchemaSiriEventTypeUnion alloc] initWithDictionary:v7];
      [(GRPSchemaOrderedMessage *)v5 setSiriEventTypeUnion:v8];
    }
    objc_super v9 = v5;
  }
  return v5;
}

- (GRPSchemaOrderedMessage)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(GRPSchemaOrderedMessage *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(GRPSchemaOrderedMessage *)self dictionaryRepresentation];
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
    id v4 = objc_msgSend(NSNumber, "numberWithLongLong:", -[GRPSchemaOrderedMessage logicalEventTimestampInNs](self, "logicalEventTimestampInNs"));
    [v3 setObject:v4 forKeyedSubscript:@"logicalEventTimestampInNs"];
  }
  if (self->_siriEventTypeUnion)
  {
    v5 = [(GRPSchemaOrderedMessage *)self siriEventTypeUnion];
    v6 = [v5 dictionaryRepresentation];
    if (v6)
    {
      [v3 setObject:v6 forKeyedSubscript:@"siriEventTypeUnion"];
    }
    else
    {
      uint64_t v7 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v7 forKeyedSubscript:@"siriEventTypeUnion"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v2 = 2654435761 * self->_logicalEventTimestampInNs;
  }
  else {
    uint64_t v2 = 0;
  }
  return [(GRPSchemaSiriEventTypeUnion *)self->_siriEventTypeUnion hash] ^ v2;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    unint64_t whichEvent_Type = self->_whichEvent_Type;
    if (whichEvent_Type == objc_msgSend(v4, "whichEvent_Type") && (*(unsigned char *)&self->_has & 1) == (v4[24] & 1))
    {
      if ((*(unsigned char *)&self->_has & 1) == 0
        || (int64_t logicalEventTimestampInNs = self->_logicalEventTimestampInNs,
            logicalEventTimestampInNs == [v4 logicalEventTimestampInNs]))
      {
        uint64_t v7 = [(GRPSchemaOrderedMessage *)self siriEventTypeUnion];
        v8 = [v4 siriEventTypeUnion];
        objc_super v9 = v8;
        if ((v7 == 0) != (v8 != 0))
        {
          uint64_t v10 = [(GRPSchemaOrderedMessage *)self siriEventTypeUnion];
          if (!v10)
          {

LABEL_14:
            BOOL v15 = 1;
            goto LABEL_12;
          }
          objc_super v11 = (void *)v10;
          v12 = [(GRPSchemaOrderedMessage *)self siriEventTypeUnion];
          v13 = [v4 siriEventTypeUnion];
          char v14 = [v12 isEqual:v13];

          if (v14) {
            goto LABEL_14;
          }
        }
        else
        {
        }
      }
    }
  }
  BOOL v15 = 0;
LABEL_12:

  return v15;
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt64Field();
  }
  id v4 = [(GRPSchemaOrderedMessage *)self siriEventTypeUnion];

  v5 = v7;
  if (v4)
  {
    v6 = [(GRPSchemaOrderedMessage *)self siriEventTypeUnion];
    PBDataWriterWriteSubmessage();

    v5 = v7;
  }
}

- (BOOL)readFrom:(id)a3
{
  return GRPSchemaOrderedMessageReadFrom(self, (uint64_t)a3);
}

- (void)deleteSiriEventTypeUnion
{
  if (self->_whichEvent_Type == 100)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_siriEventTypeUnion = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (GRPSchemaSiriEventTypeUnion)siriEventTypeUnion
{
  if (self->_whichEvent_Type == 100) {
    uint64_t v2 = self->_siriEventTypeUnion;
  }
  else {
    uint64_t v2 = 0;
  }
  return v2;
}

- (void)setSiriEventTypeUnion:(id)a3
{
  unint64_t v3 = 100;
  if (!a3) {
    unint64_t v3 = 0;
  }
  self->_unint64_t whichEvent_Type = v3;
  objc_storeStrong((id *)&self->_siriEventTypeUnion, a3);
}

- (void)deleteLogicalEventTimestampInNs
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasLogicalEventTimestampInNs:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasLogicalEventTimestampInNs
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setLogicalEventTimestampInNs:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int64_t logicalEventTimestampInNs = a3;
}

@end