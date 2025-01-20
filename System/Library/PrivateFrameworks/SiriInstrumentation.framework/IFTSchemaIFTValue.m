@interface IFTSchemaIFTValue
- (BOOL)hasEntity;
- (BOOL)hasEnumeration;
- (BOOL)hasPrimitive;
- (BOOL)hasQuery;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (IFTSchemaIFTEntityValue)entity;
- (IFTSchemaIFTEnumerationValue)enumeration;
- (IFTSchemaIFTPrimitiveValue)primitive;
- (IFTSchemaIFTQueryValue)query;
- (IFTSchemaIFTValue)initWithDictionary:(id)a3;
- (IFTSchemaIFTValue)initWithJSON:(id)a3;
- (NSData)jsonData;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unint64_t)whichOneof_Value;
- (void)deleteEntity;
- (void)deleteEnumeration;
- (void)deletePrimitive;
- (void)deleteQuery;
- (void)setEntity:(id)a3;
- (void)setEnumeration:(id)a3;
- (void)setHasEntity:(BOOL)a3;
- (void)setHasEnumeration:(BOOL)a3;
- (void)setHasPrimitive:(BOOL)a3;
- (void)setHasQuery:(BOOL)a3;
- (void)setPrimitive:(id)a3;
- (void)setQuery:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation IFTSchemaIFTValue

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)IFTSchemaIFTValue;
  v5 = [(SISchemaInstrumentationMessage *)&v19 applySensitiveConditionsPolicy:v4];
  v6 = [(IFTSchemaIFTValue *)self primitive];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(IFTSchemaIFTValue *)self deletePrimitive];
  }
  v9 = [(IFTSchemaIFTValue *)self enumeration];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(IFTSchemaIFTValue *)self deleteEnumeration];
  }
  v12 = [(IFTSchemaIFTValue *)self entity];
  v13 = [v12 applySensitiveConditionsPolicy:v4];
  int v14 = [v13 suppressMessage];

  if (v14) {
    [(IFTSchemaIFTValue *)self deleteEntity];
  }
  v15 = [(IFTSchemaIFTValue *)self query];
  v16 = [v15 applySensitiveConditionsPolicy:v4];
  int v17 = [v16 suppressMessage];

  if (v17) {
    [(IFTSchemaIFTValue *)self deleteQuery];
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
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_entity, 0);
  objc_storeStrong((id *)&self->_enumeration, 0);
  objc_storeStrong((id *)&self->_primitive, 0);
}

- (void)setHasQuery:(BOOL)a3
{
  self->_hasQuery = a3;
}

- (BOOL)hasQuery
{
  return self->_hasQuery;
}

- (void)setHasEntity:(BOOL)a3
{
  self->_hasEntity = a3;
}

- (BOOL)hasEntity
{
  return self->_hasEntity;
}

- (void)setHasEnumeration:(BOOL)a3
{
  self->_hasEnumeration = a3;
}

- (BOOL)hasEnumeration
{
  return self->_hasEnumeration;
}

- (void)setHasPrimitive:(BOOL)a3
{
  self->_hasPrimitive = a3;
}

- (BOOL)hasPrimitive
{
  return self->_hasPrimitive;
}

- (unint64_t)whichOneof_Value
{
  return self->_whichOneof_Value;
}

- (IFTSchemaIFTValue)initWithDictionary:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)IFTSchemaIFTValue;
  v5 = [(IFTSchemaIFTValue *)&v16 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"primitive"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[IFTSchemaIFTPrimitiveValue alloc] initWithDictionary:v6];
      [(IFTSchemaIFTValue *)v5 setPrimitive:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"enumeration"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[IFTSchemaIFTEnumerationValue alloc] initWithDictionary:v8];
      [(IFTSchemaIFTValue *)v5 setEnumeration:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"entity"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v11 = [[IFTSchemaIFTEntityValue alloc] initWithDictionary:v10];
      [(IFTSchemaIFTValue *)v5 setEntity:v11];
    }
    v12 = [v4 objectForKeyedSubscript:@"query"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v13 = [[IFTSchemaIFTQueryValue alloc] initWithDictionary:v12];
      [(IFTSchemaIFTValue *)v5 setQuery:v13];
    }
    int v14 = v5;
  }
  return v5;
}

- (IFTSchemaIFTValue)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(IFTSchemaIFTValue *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(IFTSchemaIFTValue *)self dictionaryRepresentation];
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
  if (self->_entity)
  {
    id v4 = [(IFTSchemaIFTValue *)self entity];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"entity"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"entity"];
    }
  }
  if (self->_enumeration)
  {
    uint64_t v7 = [(IFTSchemaIFTValue *)self enumeration];
    int v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"enumeration"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"enumeration"];
    }
  }
  if (self->_primitive)
  {
    v10 = [(IFTSchemaIFTValue *)self primitive];
    int v11 = [v10 dictionaryRepresentation];
    if (v11)
    {
      [v3 setObject:v11 forKeyedSubscript:@"primitive"];
    }
    else
    {
      v12 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v12 forKeyedSubscript:@"primitive"];
    }
  }
  if (self->_query)
  {
    v13 = [(IFTSchemaIFTValue *)self query];
    int v14 = [v13 dictionaryRepresentation];
    if (v14)
    {
      [v3 setObject:v14 forKeyedSubscript:@"query"];
    }
    else
    {
      v15 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v15 forKeyedSubscript:@"query"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(IFTSchemaIFTPrimitiveValue *)self->_primitive hash];
  unint64_t v4 = [(IFTSchemaIFTEnumerationValue *)self->_enumeration hash] ^ v3;
  unint64_t v5 = [(IFTSchemaIFTEntityValue *)self->_entity hash];
  return v4 ^ v5 ^ [(IFTSchemaIFTQueryValue *)self->_query hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_23;
  }
  unint64_t whichOneof_Value = self->_whichOneof_Value;
  if (whichOneof_Value != objc_msgSend(v4, "whichOneof_Value")) {
    goto LABEL_23;
  }
  v6 = [(IFTSchemaIFTValue *)self primitive];
  uint64_t v7 = [v4 primitive];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_22;
  }
  uint64_t v8 = [(IFTSchemaIFTValue *)self primitive];
  if (v8)
  {
    v9 = (void *)v8;
    v10 = [(IFTSchemaIFTValue *)self primitive];
    int v11 = [v4 primitive];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_23;
    }
  }
  else
  {
  }
  v6 = [(IFTSchemaIFTValue *)self enumeration];
  uint64_t v7 = [v4 enumeration];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_22;
  }
  uint64_t v13 = [(IFTSchemaIFTValue *)self enumeration];
  if (v13)
  {
    int v14 = (void *)v13;
    v15 = [(IFTSchemaIFTValue *)self enumeration];
    objc_super v16 = [v4 enumeration];
    int v17 = [v15 isEqual:v16];

    if (!v17) {
      goto LABEL_23;
    }
  }
  else
  {
  }
  v6 = [(IFTSchemaIFTValue *)self entity];
  uint64_t v7 = [v4 entity];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_22;
  }
  uint64_t v18 = [(IFTSchemaIFTValue *)self entity];
  if (v18)
  {
    objc_super v19 = (void *)v18;
    v20 = [(IFTSchemaIFTValue *)self entity];
    v21 = [v4 entity];
    int v22 = [v20 isEqual:v21];

    if (!v22) {
      goto LABEL_23;
    }
  }
  else
  {
  }
  v6 = [(IFTSchemaIFTValue *)self query];
  uint64_t v7 = [v4 query];
  if ((v6 == 0) != (v7 != 0))
  {
    uint64_t v23 = [(IFTSchemaIFTValue *)self query];
    if (!v23)
    {

LABEL_26:
      BOOL v28 = 1;
      goto LABEL_24;
    }
    v24 = (void *)v23;
    v25 = [(IFTSchemaIFTValue *)self query];
    v26 = [v4 query];
    char v27 = [v25 isEqual:v26];

    if (v27) {
      goto LABEL_26;
    }
  }
  else
  {
LABEL_22:
  }
LABEL_23:
  BOOL v28 = 0;
LABEL_24:

  return v28;
}

- (void)writeTo:(id)a3
{
  id v12 = a3;
  id v4 = [(IFTSchemaIFTValue *)self primitive];

  if (v4)
  {
    unint64_t v5 = [(IFTSchemaIFTValue *)self primitive];
    PBDataWriterWriteSubmessage();
  }
  v6 = [(IFTSchemaIFTValue *)self enumeration];

  if (v6)
  {
    uint64_t v7 = [(IFTSchemaIFTValue *)self enumeration];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v8 = [(IFTSchemaIFTValue *)self entity];

  if (v8)
  {
    v9 = [(IFTSchemaIFTValue *)self entity];
    PBDataWriterWriteSubmessage();
  }
  v10 = [(IFTSchemaIFTValue *)self query];

  if (v10)
  {
    int v11 = [(IFTSchemaIFTValue *)self query];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return IFTSchemaIFTValueReadFrom(self, (uint64_t)a3);
}

- (void)deleteQuery
{
  if (self->_whichOneof_Value == 4)
  {
    self->_unint64_t whichOneof_Value = 0;
    self->_query = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (IFTSchemaIFTQueryValue)query
{
  if (self->_whichOneof_Value == 4) {
    v2 = self->_query;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setQuery:(id)a3
{
  id v4 = (IFTSchemaIFTQueryValue *)a3;
  primitive = self->_primitive;
  self->_primitive = 0;

  enumeration = self->_enumeration;
  self->_enumeration = 0;

  entity = self->_entity;
  self->_entity = 0;

  self->_unint64_t whichOneof_Value = 4 * (v4 != 0);
  query = self->_query;
  self->_query = v4;
}

- (void)deleteEntity
{
  if (self->_whichOneof_Value == 3)
  {
    self->_unint64_t whichOneof_Value = 0;
    self->_entity = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (IFTSchemaIFTEntityValue)entity
{
  if (self->_whichOneof_Value == 3) {
    v2 = self->_entity;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setEntity:(id)a3
{
  id v4 = (IFTSchemaIFTEntityValue *)a3;
  primitive = self->_primitive;
  self->_primitive = 0;

  enumeration = self->_enumeration;
  self->_enumeration = 0;

  query = self->_query;
  self->_query = 0;

  unint64_t v8 = 3;
  if (!v4) {
    unint64_t v8 = 0;
  }
  self->_unint64_t whichOneof_Value = v8;
  entity = self->_entity;
  self->_entity = v4;
}

- (void)deleteEnumeration
{
  if (self->_whichOneof_Value == 2)
  {
    self->_unint64_t whichOneof_Value = 0;
    self->_enumeration = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (IFTSchemaIFTEnumerationValue)enumeration
{
  if (self->_whichOneof_Value == 2) {
    v2 = self->_enumeration;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setEnumeration:(id)a3
{
  id v4 = (IFTSchemaIFTEnumerationValue *)a3;
  primitive = self->_primitive;
  self->_primitive = 0;

  entity = self->_entity;
  self->_entity = 0;

  query = self->_query;
  self->_query = 0;

  self->_unint64_t whichOneof_Value = 2 * (v4 != 0);
  enumeration = self->_enumeration;
  self->_enumeration = v4;
}

- (void)deletePrimitive
{
  if (self->_whichOneof_Value == 1)
  {
    self->_unint64_t whichOneof_Value = 0;
    self->_primitive = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (IFTSchemaIFTPrimitiveValue)primitive
{
  if (self->_whichOneof_Value == 1) {
    v2 = self->_primitive;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setPrimitive:(id)a3
{
  id v4 = (IFTSchemaIFTPrimitiveValue *)a3;
  enumeration = self->_enumeration;
  self->_enumeration = 0;

  entity = self->_entity;
  self->_entity = 0;

  query = self->_query;
  self->_query = 0;

  self->_unint64_t whichOneof_Value = v4 != 0;
  primitive = self->_primitive;
  self->_primitive = v4;
}

@end