@interface ORCHSchemaORCHMUXEphemeralToAggregationIdentifierMapContext
- (BOOL)hasSelectedUser;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (ORCHSchemaORCHMUXEphemeralToAggregationIdentifierMap)selectedUser;
- (ORCHSchemaORCHMUXEphemeralToAggregationIdentifierMapContext)initWithDictionary:(id)a3;
- (ORCHSchemaORCHMUXEphemeralToAggregationIdentifierMapContext)initWithJSON:(id)a3;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteSelectedUser;
- (void)setHasSelectedUser:(BOOL)a3;
- (void)setSelectedUser:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ORCHSchemaORCHMUXEphemeralToAggregationIdentifierMapContext

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)ORCHSchemaORCHMUXEphemeralToAggregationIdentifierMapContext;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(ORCHSchemaORCHMUXEphemeralToAggregationIdentifierMapContext *)self selectedUser];
  v7 = [v6 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v7 suppressMessage];
  if (v4) {
    [(ORCHSchemaORCHMUXEphemeralToAggregationIdentifierMapContext *)self deleteSelectedUser];
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

- (void)setHasSelectedUser:(BOOL)a3
{
  self->_hasSelectedUser = a3;
}

- (void)setSelectedUser:(id)a3
{
}

- (ORCHSchemaORCHMUXEphemeralToAggregationIdentifierMap)selectedUser
{
  return self->_selectedUser;
}

- (ORCHSchemaORCHMUXEphemeralToAggregationIdentifierMapContext)initWithDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ORCHSchemaORCHMUXEphemeralToAggregationIdentifierMapContext;
  v5 = [(ORCHSchemaORCHMUXEphemeralToAggregationIdentifierMapContext *)&v10 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"selectedUser"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[ORCHSchemaORCHMUXEphemeralToAggregationIdentifierMap alloc] initWithDictionary:v6];
      [(ORCHSchemaORCHMUXEphemeralToAggregationIdentifierMapContext *)v5 setSelectedUser:v7];
    }
    v8 = v5;
  }
  return v5;
}

- (ORCHSchemaORCHMUXEphemeralToAggregationIdentifierMapContext)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(ORCHSchemaORCHMUXEphemeralToAggregationIdentifierMapContext *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(ORCHSchemaORCHMUXEphemeralToAggregationIdentifierMapContext *)self dictionaryRepresentation];
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
  if (self->_selectedUser)
  {
    id v4 = [(ORCHSchemaORCHMUXEphemeralToAggregationIdentifierMapContext *)self selectedUser];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"selectedUser"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"selectedUser"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  return [(ORCHSchemaORCHMUXEphemeralToAggregationIdentifierMap *)self->_selectedUser hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    v5 = [(ORCHSchemaORCHMUXEphemeralToAggregationIdentifierMapContext *)self selectedUser];
    v6 = [v4 selectedUser];
    uint64_t v7 = v6;
    if ((v5 == 0) != (v6 != 0))
    {
      uint64_t v8 = [(ORCHSchemaORCHMUXEphemeralToAggregationIdentifierMapContext *)self selectedUser];
      if (!v8)
      {

LABEL_10:
        BOOL v13 = 1;
        goto LABEL_8;
      }
      objc_super v9 = (void *)v8;
      objc_super v10 = [(ORCHSchemaORCHMUXEphemeralToAggregationIdentifierMapContext *)self selectedUser];
      v11 = [v4 selectedUser];
      char v12 = [v10 isEqual:v11];

      if (v12) {
        goto LABEL_10;
      }
    }
    else
    {
    }
  }
  BOOL v13 = 0;
LABEL_8:

  return v13;
}

- (void)writeTo:(id)a3
{
  id v6 = a3;
  id v4 = [(ORCHSchemaORCHMUXEphemeralToAggregationIdentifierMapContext *)self selectedUser];

  if (v4)
  {
    v5 = [(ORCHSchemaORCHMUXEphemeralToAggregationIdentifierMapContext *)self selectedUser];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return ORCHSchemaORCHMUXEphemeralToAggregationIdentifierMapContextReadFrom(self, (uint64_t)a3);
}

- (void)deleteSelectedUser
{
}

- (BOOL)hasSelectedUser
{
  return self->_selectedUser != 0;
}

@end