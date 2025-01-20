@interface PEGASUSSchemaPEGASUSMapsEntity
- (BOOL)hasAddressId;
- (BOOL)hasMapsFeatureId;
- (BOOL)hasMuid;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)addressId;
- (PEGASUSSchemaPEGASUSMapsEntity)initWithDictionary:(id)a3;
- (PEGASUSSchemaPEGASUSMapsEntity)initWithJSON:(id)a3;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unint64_t)mapsFeatureId;
- (unint64_t)muid;
- (unint64_t)whichEntityid;
- (void)deleteAddressId;
- (void)deleteMapsFeatureId;
- (void)deleteMuid;
- (void)setAddressId:(id)a3;
- (void)setHasAddressId:(BOOL)a3;
- (void)setHasMapsFeatureId:(BOOL)a3;
- (void)setHasMuid:(BOOL)a3;
- (void)setMapsFeatureId:(unint64_t)a3;
- (void)setMuid:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation PEGASUSSchemaPEGASUSMapsEntity

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PEGASUSSchemaPEGASUSMapsEntity;
  v5 = [(SISchemaInstrumentationMessage *)&v7 applySensitiveConditionsPolicy:v4];
  if ([v4 isConditionSet:2])
  {
    [(PEGASUSSchemaPEGASUSMapsEntity *)self deleteMuid];
    [(PEGASUSSchemaPEGASUSMapsEntity *)self deleteMapsFeatureId];
    [(PEGASUSSchemaPEGASUSMapsEntity *)self deleteAddressId];
  }
  if ([v4 isConditionSet:4])
  {
    [(PEGASUSSchemaPEGASUSMapsEntity *)self deleteMuid];
    [(PEGASUSSchemaPEGASUSMapsEntity *)self deleteMapsFeatureId];
    [(PEGASUSSchemaPEGASUSMapsEntity *)self deleteAddressId];
  }
  if ([v4 isConditionSet:5])
  {
    [(PEGASUSSchemaPEGASUSMapsEntity *)self deleteMuid];
    [(PEGASUSSchemaPEGASUSMapsEntity *)self deleteMapsFeatureId];
    [(PEGASUSSchemaPEGASUSMapsEntity *)self deleteAddressId];
  }
  if ([v4 isConditionSet:6])
  {
    [(PEGASUSSchemaPEGASUSMapsEntity *)self deleteMuid];
    [(PEGASUSSchemaPEGASUSMapsEntity *)self deleteMapsFeatureId];
    [(PEGASUSSchemaPEGASUSMapsEntity *)self deleteAddressId];
  }
  if ([v4 isConditionSet:7])
  {
    [(PEGASUSSchemaPEGASUSMapsEntity *)self deleteMuid];
    [(PEGASUSSchemaPEGASUSMapsEntity *)self deleteMapsFeatureId];
    [(PEGASUSSchemaPEGASUSMapsEntity *)self deleteAddressId];
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

- (void)setHasAddressId:(BOOL)a3
{
  self->_hasAddressId = a3;
}

- (BOOL)hasAddressId
{
  return self->_hasAddressId;
}

- (void)setHasMapsFeatureId:(BOOL)a3
{
  self->_hasMapsFeatureId = a3;
}

- (BOOL)hasMapsFeatureId
{
  return self->_hasMapsFeatureId;
}

- (void)setHasMuid:(BOOL)a3
{
  self->_hasMuid = a3;
}

- (BOOL)hasMuid
{
  return self->_hasMuid;
}

- (unint64_t)whichEntityid
{
  return self->_whichEntityid;
}

- (PEGASUSSchemaPEGASUSMapsEntity)initWithDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PEGASUSSchemaPEGASUSMapsEntity;
  v5 = [(PEGASUSSchemaPEGASUSMapsEntity *)&v12 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"muid"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PEGASUSSchemaPEGASUSMapsEntity setMuid:](v5, "setMuid:", [v6 unsignedLongLongValue]);
    }
    objc_super v7 = [v4 objectForKeyedSubscript:@"mapsFeatureId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PEGASUSSchemaPEGASUSMapsEntity setMapsFeatureId:](v5, "setMapsFeatureId:", [v7 unsignedLongLongValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"addressId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = (void *)[v8 copy];
      [(PEGASUSSchemaPEGASUSMapsEntity *)v5 setAddressId:v9];
    }
    v10 = v5;
  }
  return v5;
}

- (PEGASUSSchemaPEGASUSMapsEntity)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(PEGASUSSchemaPEGASUSMapsEntity *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(PEGASUSSchemaPEGASUSMapsEntity *)self dictionaryRepresentation];
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
  if (self->_addressId)
  {
    id v4 = [(PEGASUSSchemaPEGASUSMapsEntity *)self addressId];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"addressId"];
  }
  unint64_t whichEntityid = self->_whichEntityid;
  if (whichEntityid == 2)
  {
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[PEGASUSSchemaPEGASUSMapsEntity mapsFeatureId](self, "mapsFeatureId"));
    [v3 setObject:v7 forKeyedSubscript:@"mapsFeatureId"];

    unint64_t whichEntityid = self->_whichEntityid;
  }
  if (whichEntityid == 1)
  {
    v8 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[PEGASUSSchemaPEGASUSMapsEntity muid](self, "muid"));
    [v3 setObject:v8 forKeyedSubscript:@"muid"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t whichEntityid = self->_whichEntityid;
  if (whichEntityid == 1)
  {
    v3 = &OBJC_IVAR___PEGASUSSchemaPEGASUSMapsEntity__muid;
  }
  else
  {
    if (whichEntityid != 2)
    {
      uint64_t v4 = 0;
      return [(NSString *)self->_addressId hash] ^ v4;
    }
    v3 = &OBJC_IVAR___PEGASUSSchemaPEGASUSMapsEntity__mapsFeatureId;
  }
  uint64_t v4 = 2654435761 * *(uint64_t *)((char *)&self->super.super.super.isa + *v3);
  return [(NSString *)self->_addressId hash] ^ v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    unint64_t whichEntityid = self->_whichEntityid;
    if (whichEntityid == [v4 whichEntityid])
    {
      unint64_t muid = self->_muid;
      if (muid == [v4 muid])
      {
        unint64_t mapsFeatureId = self->_mapsFeatureId;
        if (mapsFeatureId == [v4 mapsFeatureId])
        {
          v8 = [(PEGASUSSchemaPEGASUSMapsEntity *)self addressId];
          v9 = [v4 addressId];
          v10 = v9;
          if ((v8 == 0) != (v9 != 0))
          {
            uint64_t v11 = [(PEGASUSSchemaPEGASUSMapsEntity *)self addressId];
            if (!v11)
            {

LABEL_13:
              BOOL v16 = 1;
              goto LABEL_11;
            }
            objc_super v12 = (void *)v11;
            v13 = [(PEGASUSSchemaPEGASUSMapsEntity *)self addressId];
            v14 = [v4 addressId];
            char v15 = [v13 isEqual:v14];

            if (v15) {
              goto LABEL_13;
            }
          }
          else
          {
          }
        }
      }
    }
  }
  BOOL v16 = 0;
LABEL_11:

  return v16;
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  unint64_t whichEntityid = self->_whichEntityid;
  if (whichEntityid == 1)
  {
    PBDataWriterWriteUint64Field();
    unint64_t whichEntityid = self->_whichEntityid;
  }
  if (whichEntityid == 2) {
    PBDataWriterWriteUint64Field();
  }
  v5 = [(PEGASUSSchemaPEGASUSMapsEntity *)self addressId];

  v6 = v7;
  if (v5)
  {
    PBDataWriterWriteStringField();
    v6 = v7;
  }
}

- (BOOL)readFrom:(id)a3
{
  return PEGASUSSchemaPEGASUSMapsEntityReadFrom(self, (uint64_t)a3);
}

- (void)deleteAddressId
{
  if (self->_whichEntityid == 3)
  {
    self->_unint64_t whichEntityid = 0;
    self->_addressId = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (NSString)addressId
{
  if (self->_whichEntityid == 3) {
    v2 = self->_addressId;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setAddressId:(id)a3
{
  self->_unint64_t muid = 0;
  self->_unint64_t mapsFeatureId = 0;
  unint64_t v4 = 3;
  if (!a3) {
    unint64_t v4 = 0;
  }
  self->_unint64_t whichEntityid = v4;
  id v7 = a3;
  v5 = (NSString *)[v7 copy];
  addressId = self->_addressId;
  self->_addressId = v5;
}

- (void)deleteMapsFeatureId
{
  if (self->_whichEntityid == 2)
  {
    self->_unint64_t whichEntityid = 0;
    self->_unint64_t mapsFeatureId = 0;
  }
}

- (unint64_t)mapsFeatureId
{
  if (self->_whichEntityid == 2) {
    return self->_mapsFeatureId;
  }
  else {
    return 0;
  }
}

- (void)setMapsFeatureId:(unint64_t)a3
{
  self->_unint64_t muid = 0;
  addressId = self->_addressId;
  self->_addressId = 0;

  self->_unint64_t whichEntityid = 2;
  self->_unint64_t mapsFeatureId = a3;
}

- (void)deleteMuid
{
  if (self->_whichEntityid == 1)
  {
    self->_unint64_t whichEntityid = 0;
    self->_unint64_t muid = 0;
  }
}

- (unint64_t)muid
{
  if (self->_whichEntityid == 1) {
    return self->_muid;
  }
  else {
    return 0;
  }
}

- (void)setMuid:(unint64_t)a3
{
  self->_unint64_t mapsFeatureId = 0;
  addressId = self->_addressId;
  self->_addressId = 0;

  self->_unint64_t whichEntityid = 1;
  self->_unint64_t muid = a3;
}

@end