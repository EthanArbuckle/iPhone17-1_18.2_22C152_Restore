@interface _SFPBRFMapMarkerIdentifier
- (BOOL)isEqual:(id)a3;
- (BOOL)isForCameraPositionOnly;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)muid;
- (NSString)resultProviderID;
- (_SFPBRFMapMarkerIdentifier)initWithDictionary:(id)a3;
- (_SFPBRFMapMarkerIdentifier)initWithFacade:(id)a3;
- (_SFPBRFMapMarkerIdentifier)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)setIsForCameraPositionOnly:(BOOL)a3;
- (void)setMuid:(id)a3;
- (void)setResultProviderID:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBRFMapMarkerIdentifier

- (_SFPBRFMapMarkerIdentifier)initWithFacade:(id)a3
{
  id v4 = a3;
  v5 = [(_SFPBRFMapMarkerIdentifier *)self init];
  if (v5)
  {
    v6 = [v4 muid];

    if (v6)
    {
      v7 = [v4 muid];
      [(_SFPBRFMapMarkerIdentifier *)v5 setMuid:v7];
    }
    v8 = [v4 resultProviderID];

    if (v8)
    {
      v9 = [v4 resultProviderID];
      [(_SFPBRFMapMarkerIdentifier *)v5 setResultProviderID:v9];
    }
    if ([v4 hasIsForCameraPositionOnly]) {
      -[_SFPBRFMapMarkerIdentifier setIsForCameraPositionOnly:](v5, "setIsForCameraPositionOnly:", [v4 isForCameraPositionOnly]);
    }
    v10 = v5;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultProviderID, 0);
  objc_storeStrong((id *)&self->_muid, 0);
}

- (BOOL)isForCameraPositionOnly
{
  return self->_isForCameraPositionOnly;
}

- (NSString)resultProviderID
{
  return self->_resultProviderID;
}

- (NSString)muid
{
  return self->_muid;
}

- (_SFPBRFMapMarkerIdentifier)initWithDictionary:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_SFPBRFMapMarkerIdentifier;
  v5 = [(_SFPBRFMapMarkerIdentifier *)&v13 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"muid"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(_SFPBRFMapMarkerIdentifier *)v5 setMuid:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"resultProviderID"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = (void *)[v8 copy];
      [(_SFPBRFMapMarkerIdentifier *)v5 setResultProviderID:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"isForCameraPositionOnly"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBRFMapMarkerIdentifier setIsForCameraPositionOnly:](v5, "setIsForCameraPositionOnly:", [v10 BOOLValue]);
    }
    v11 = v5;
  }
  return v5;
}

- (_SFPBRFMapMarkerIdentifier)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBRFMapMarkerIdentifier *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBRFMapMarkerIdentifier *)self dictionaryRepresentation];
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
  if (self->_isForCameraPositionOnly)
  {
    id v4 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBRFMapMarkerIdentifier isForCameraPositionOnly](self, "isForCameraPositionOnly"));
    [v3 setObject:v4 forKeyedSubscript:@"isForCameraPositionOnly"];
  }
  if (self->_muid)
  {
    v5 = [(_SFPBRFMapMarkerIdentifier *)self muid];
    v6 = (void *)[v5 copy];
    [v3 setObject:v6 forKeyedSubscript:@"muid"];
  }
  if (self->_resultProviderID)
  {
    uint64_t v7 = [(_SFPBRFMapMarkerIdentifier *)self resultProviderID];
    v8 = (void *)[v7 copy];
    [v3 setObject:v8 forKeyedSubscript:@"resultProviderID"];
  }
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_muid hash];
  NSUInteger v4 = [(NSString *)self->_resultProviderID hash];
  uint64_t v5 = 2654435761;
  if (!self->_isForCameraPositionOnly) {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  uint64_t v5 = [(_SFPBRFMapMarkerIdentifier *)self muid];
  v6 = [v4 muid];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(_SFPBRFMapMarkerIdentifier *)self muid];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(_SFPBRFMapMarkerIdentifier *)self muid];
    v10 = [v4 muid];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBRFMapMarkerIdentifier *)self resultProviderID];
  v6 = [v4 resultProviderID];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v12 = [(_SFPBRFMapMarkerIdentifier *)self resultProviderID];
    if (!v12)
    {

LABEL_15:
      int isForCameraPositionOnly = self->_isForCameraPositionOnly;
      BOOL v17 = isForCameraPositionOnly == [v4 isForCameraPositionOnly];
      goto LABEL_13;
    }
    objc_super v13 = (void *)v12;
    v14 = [(_SFPBRFMapMarkerIdentifier *)self resultProviderID];
    v15 = [v4 resultProviderID];
    int v16 = [v14 isEqual:v15];

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
  id v6 = a3;
  id v4 = [(_SFPBRFMapMarkerIdentifier *)self muid];
  if (v4) {
    PBDataWriterWriteStringField();
  }

  uint64_t v5 = [(_SFPBRFMapMarkerIdentifier *)self resultProviderID];
  if (v5) {
    PBDataWriterWriteStringField();
  }

  if ([(_SFPBRFMapMarkerIdentifier *)self isForCameraPositionOnly]) {
    PBDataWriterWriteBOOLField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBRFMapMarkerIdentifierReadFrom(self, (uint64_t)a3);
}

- (void)setIsForCameraPositionOnly:(BOOL)a3
{
  self->_int isForCameraPositionOnly = a3;
}

- (void)setResultProviderID:(id)a3
{
  self->_resultProviderID = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setMuid:(id)a3
{
  self->_muid = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

@end