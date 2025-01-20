@interface USOSchemaUSOEntityIdentifierTier1
- (BOOL)hasBackingAppBundleId;
- (BOOL)hasIndex;
- (BOOL)hasValue;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)backingAppBundleId;
- (NSString)value;
- (USOSchemaUSOEntityIdentifierTier1)initWithDictionary:(id)a3;
- (USOSchemaUSOEntityIdentifierTier1)initWithJSON:(id)a3;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unsigned)index;
- (void)deleteBackingAppBundleId;
- (void)deleteIndex;
- (void)deleteValue;
- (void)setBackingAppBundleId:(id)a3;
- (void)setHasBackingAppBundleId:(BOOL)a3;
- (void)setHasIndex:(BOOL)a3;
- (void)setHasValue:(BOOL)a3;
- (void)setIndex:(unsigned int)a3;
- (void)setValue:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation USOSchemaUSOEntityIdentifierTier1

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)USOSchemaUSOEntityIdentifierTier1;
  v5 = [(SISchemaInstrumentationMessage *)&v7 applySensitiveConditionsPolicy:v4];
  if ([v4 isConditionSet:2])
  {
    [(USOSchemaUSOEntityIdentifierTier1 *)self deleteValue];
    [(USOSchemaUSOEntityIdentifierTier1 *)self deleteBackingAppBundleId];
  }
  if ([v4 isConditionSet:4])
  {
    [(USOSchemaUSOEntityIdentifierTier1 *)self deleteValue];
    [(USOSchemaUSOEntityIdentifierTier1 *)self deleteBackingAppBundleId];
  }
  if ([v4 isConditionSet:5])
  {
    [(USOSchemaUSOEntityIdentifierTier1 *)self deleteValue];
    [(USOSchemaUSOEntityIdentifierTier1 *)self deleteBackingAppBundleId];
  }
  if ([v4 isConditionSet:6])
  {
    [(USOSchemaUSOEntityIdentifierTier1 *)self deleteValue];
    [(USOSchemaUSOEntityIdentifierTier1 *)self deleteBackingAppBundleId];
  }
  if ([v4 isConditionSet:7])
  {
    [(USOSchemaUSOEntityIdentifierTier1 *)self deleteValue];
    [(USOSchemaUSOEntityIdentifierTier1 *)self deleteBackingAppBundleId];
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
  objc_storeStrong((id *)&self->_backingAppBundleId, 0);
  objc_storeStrong((id *)&self->_value, 0);
}

- (void)setHasBackingAppBundleId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasValue:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setBackingAppBundleId:(id)a3
{
}

- (NSString)backingAppBundleId
{
  return self->_backingAppBundleId;
}

- (void)setValue:(id)a3
{
}

- (NSString)value
{
  return self->_value;
}

- (unsigned)index
{
  return self->_index;
}

- (USOSchemaUSOEntityIdentifierTier1)initWithDictionary:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)USOSchemaUSOEntityIdentifierTier1;
  v5 = [(USOSchemaUSOEntityIdentifierTier1 *)&v13 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"index"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[USOSchemaUSOEntityIdentifierTier1 setIndex:](v5, "setIndex:", [v6 unsignedIntValue]);
    }
    objc_super v7 = [v4 objectForKeyedSubscript:@"value"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v8 = (void *)[v7 copy];
      [(USOSchemaUSOEntityIdentifierTier1 *)v5 setValue:v8];
    }
    v9 = [v4 objectForKeyedSubscript:@"backingAppBundleId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v10 = (void *)[v9 copy];
      [(USOSchemaUSOEntityIdentifierTier1 *)v5 setBackingAppBundleId:v10];
    }
    v11 = v5;
  }
  return v5;
}

- (USOSchemaUSOEntityIdentifierTier1)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(USOSchemaUSOEntityIdentifierTier1 *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(USOSchemaUSOEntityIdentifierTier1 *)self dictionaryRepresentation];
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
  if (self->_backingAppBundleId)
  {
    id v4 = [(USOSchemaUSOEntityIdentifierTier1 *)self backingAppBundleId];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"backingAppBundleId"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v6 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[USOSchemaUSOEntityIdentifierTier1 index](self, "index"));
    [v3 setObject:v6 forKeyedSubscript:@"index"];
  }
  if (self->_value)
  {
    uint64_t v7 = [(USOSchemaUSOEntityIdentifierTier1 *)self value];
    v8 = (void *)[v7 copy];
    [v3 setObject:v8 forKeyedSubscript:@"value"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_index;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_value hash] ^ v3;
  return v4 ^ [(NSString *)self->_backingAppBundleId hash];
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_15;
  }
  if ((*(unsigned char *)&self->_has & 1) != (v4[32] & 1)) {
    goto LABEL_15;
  }
  if (*(unsigned char *)&self->_has)
  {
    unsigned int index = self->_index;
    if (index != [v4 index]) {
      goto LABEL_15;
    }
  }
  v6 = [(USOSchemaUSOEntityIdentifierTier1 *)self value];
  uint64_t v7 = [v4 value];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_14;
  }
  uint64_t v8 = [(USOSchemaUSOEntityIdentifierTier1 *)self value];
  if (v8)
  {
    v9 = (void *)v8;
    v10 = [(USOSchemaUSOEntityIdentifierTier1 *)self value];
    v11 = [v4 value];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_15;
    }
  }
  else
  {
  }
  v6 = [(USOSchemaUSOEntityIdentifierTier1 *)self backingAppBundleId];
  uint64_t v7 = [v4 backingAppBundleId];
  if ((v6 == 0) != (v7 != 0))
  {
    uint64_t v13 = [(USOSchemaUSOEntityIdentifierTier1 *)self backingAppBundleId];
    if (!v13)
    {

LABEL_18:
      BOOL v18 = 1;
      goto LABEL_16;
    }
    v14 = (void *)v13;
    v15 = [(USOSchemaUSOEntityIdentifierTier1 *)self backingAppBundleId];
    v16 = [v4 backingAppBundleId];
    char v17 = [v15 isEqual:v16];

    if (v17) {
      goto LABEL_18;
    }
  }
  else
  {
LABEL_14:
  }
LABEL_15:
  BOOL v18 = 0;
LABEL_16:

  return v18;
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint32Field();
  }
  NSUInteger v4 = [(USOSchemaUSOEntityIdentifierTier1 *)self value];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  v5 = [(USOSchemaUSOEntityIdentifierTier1 *)self backingAppBundleId];

  v6 = v7;
  if (v5)
  {
    PBDataWriterWriteStringField();
    v6 = v7;
  }
}

- (BOOL)readFrom:(id)a3
{
  return USOSchemaUSOEntityIdentifierTier1ReadFrom(self, (uint64_t)a3);
}

- (void)deleteBackingAppBundleId
{
}

- (BOOL)hasBackingAppBundleId
{
  return self->_backingAppBundleId != 0;
}

- (void)deleteValue
{
}

- (BOOL)hasValue
{
  return self->_value != 0;
}

- (void)deleteIndex
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasIndex:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasIndex
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setIndex:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_unsigned int index = a3;
}

@end