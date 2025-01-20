@interface INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentSignals
- (BOOL)hasContactDependentMessageSignals;
- (BOOL)hasContactDependentPhoneCallSignals;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentMessageSignals)contactDependentMessageSignals;
- (INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentPhoneCallSignals)contactDependentPhoneCallSignals;
- (INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentSignals)initWithDictionary:(id)a3;
- (INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentSignals)initWithJSON:(id)a3;
- (NSData)jsonData;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteContactDependentMessageSignals;
- (void)deleteContactDependentPhoneCallSignals;
- (void)setContactDependentMessageSignals:(id)a3;
- (void)setContactDependentPhoneCallSignals:(id)a3;
- (void)setHasContactDependentMessageSignals:(BOOL)a3;
- (void)setHasContactDependentPhoneCallSignals:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentSignals

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentSignals;
  v5 = [(SISchemaInstrumentationMessage *)&v13 applySensitiveConditionsPolicy:v4];
  v6 = [(INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentSignals *)self contactDependentMessageSignals];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentSignals *)self deleteContactDependentMessageSignals];
  }
  v9 = [(INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentSignals *)self contactDependentPhoneCallSignals];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentSignals *)self deleteContactDependentPhoneCallSignals];
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
  objc_storeStrong((id *)&self->_contactDependentPhoneCallSignals, 0);
  objc_storeStrong((id *)&self->_contactDependentMessageSignals, 0);
}

- (void)setHasContactDependentPhoneCallSignals:(BOOL)a3
{
  self->_hasContactDependentPhoneCallSignals = a3;
}

- (void)setHasContactDependentMessageSignals:(BOOL)a3
{
  self->_hasContactDependentMessageSignals = a3;
}

- (void)setContactDependentPhoneCallSignals:(id)a3
{
}

- (INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentPhoneCallSignals)contactDependentPhoneCallSignals
{
  return self->_contactDependentPhoneCallSignals;
}

- (void)setContactDependentMessageSignals:(id)a3
{
}

- (INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentMessageSignals)contactDependentMessageSignals
{
  return self->_contactDependentMessageSignals;
}

- (INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentSignals)initWithDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentSignals;
  v5 = [(INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentSignals *)&v12 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"contactDependentMessageSignals"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentMessageSignals alloc] initWithDictionary:v6];
      [(INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentSignals *)v5 setContactDependentMessageSignals:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"contactDependentPhoneCallSignals"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentPhoneCallSignals alloc] initWithDictionary:v8];
      [(INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentSignals *)v5 setContactDependentPhoneCallSignals:v9];
    }
    v10 = v5;
  }
  return v5;
}

- (INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentSignals)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentSignals *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentSignals *)self dictionaryRepresentation];
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
  if (self->_contactDependentMessageSignals)
  {
    id v4 = [(INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentSignals *)self contactDependentMessageSignals];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"contactDependentMessageSignals"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"contactDependentMessageSignals"];
    }
  }
  if (self->_contactDependentPhoneCallSignals)
  {
    uint64_t v7 = [(INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentSignals *)self contactDependentPhoneCallSignals];
    int v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"contactDependentPhoneCallSignals"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"contactDependentPhoneCallSignals"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentMessageSignals *)self->_contactDependentMessageSignals hash];
  return [(INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentPhoneCallSignals *)self->_contactDependentPhoneCallSignals hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  v5 = [(INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentSignals *)self contactDependentMessageSignals];
  v6 = [v4 contactDependentMessageSignals];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentSignals *)self contactDependentMessageSignals];
  if (v7)
  {
    int v8 = (void *)v7;
    v9 = [(INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentSignals *)self contactDependentMessageSignals];
    v10 = [v4 contactDependentMessageSignals];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  v5 = [(INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentSignals *)self contactDependentPhoneCallSignals];
  v6 = [v4 contactDependentPhoneCallSignals];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v12 = [(INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentSignals *)self contactDependentPhoneCallSignals];
    if (!v12)
    {

LABEL_15:
      BOOL v17 = 1;
      goto LABEL_13;
    }
    objc_super v13 = (void *)v12;
    v14 = [(INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentSignals *)self contactDependentPhoneCallSignals];
    v15 = [v4 contactDependentPhoneCallSignals];
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
  id v4 = [(INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentSignals *)self contactDependentMessageSignals];

  if (v4)
  {
    v5 = [(INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentSignals *)self contactDependentMessageSignals];
    PBDataWriterWriteSubmessage();
  }
  v6 = [(INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentSignals *)self contactDependentPhoneCallSignals];

  if (v6)
  {
    uint64_t v7 = [(INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentSignals *)self contactDependentPhoneCallSignals];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentSignalsReadFrom(self, (uint64_t)a3);
}

- (void)deleteContactDependentPhoneCallSignals
{
}

- (BOOL)hasContactDependentPhoneCallSignals
{
  return self->_contactDependentPhoneCallSignals != 0;
}

- (void)deleteContactDependentMessageSignals
{
}

- (BOOL)hasContactDependentMessageSignals
{
  return self->_contactDependentMessageSignals != 0;
}

@end