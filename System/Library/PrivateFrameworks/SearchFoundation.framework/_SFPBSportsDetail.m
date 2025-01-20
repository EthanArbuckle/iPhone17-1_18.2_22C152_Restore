@interface _SFPBSportsDetail
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)requested_entity_type;
- (_SFPBSportsDetail)initWithDictionary:(id)a3;
- (_SFPBSportsDetail)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)setRequested_entity_type:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBSportsDetail

- (void).cxx_destruct
{
}

- (NSString)requested_entity_type
{
  return self->_requested_entity_type;
}

- (_SFPBSportsDetail)initWithDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_SFPBSportsDetail;
  v5 = [(_SFPBSportsDetail *)&v10 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"requestedEntityType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(_SFPBSportsDetail *)v5 setRequested_entity_type:v7];
    }
    v8 = v5;
  }
  return v5;
}

- (_SFPBSportsDetail)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBSportsDetail *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBSportsDetail *)self dictionaryRepresentation];
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
  if (self->_requested_entity_type)
  {
    id v4 = [(_SFPBSportsDetail *)self requested_entity_type];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"requestedEntityType"];
  }
  return v3;
}

- (unint64_t)hash
{
  return [(NSString *)self->_requested_entity_type hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    v5 = [(_SFPBSportsDetail *)self requested_entity_type];
    v6 = objc_msgSend(v4, "requested_entity_type");
    uint64_t v7 = v6;
    if ((v5 == 0) != (v6 != 0))
    {
      uint64_t v8 = [(_SFPBSportsDetail *)self requested_entity_type];
      if (!v8)
      {

LABEL_10:
        BOOL v13 = 1;
        goto LABEL_8;
      }
      v9 = (void *)v8;
      objc_super v10 = [(_SFPBSportsDetail *)self requested_entity_type];
      v11 = objc_msgSend(v4, "requested_entity_type");
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
  id v5 = a3;
  id v4 = [(_SFPBSportsDetail *)self requested_entity_type];
  if (v4) {
    PBDataWriterWriteStringField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBSportsDetailReadFrom(self, (uint64_t)a3);
}

- (void)setRequested_entity_type:(id)a3
{
  self->_requested_entity_type = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

@end