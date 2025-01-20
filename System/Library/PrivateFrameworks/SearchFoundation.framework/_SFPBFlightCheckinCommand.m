@interface _SFPBFlightCheckinCommand
- (BOOL)isEqual:(id)a3;
- (BOOL)placeHolderProperty;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (_SFPBFlightCheckinCommand)initWithDictionary:(id)a3;
- (_SFPBFlightCheckinCommand)initWithFacade:(id)a3;
- (_SFPBFlightCheckinCommand)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)setPlaceHolderProperty:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBFlightCheckinCommand

- (_SFPBFlightCheckinCommand)initWithFacade:(id)a3
{
  id v4 = a3;
  v5 = [(_SFPBFlightCheckinCommand *)self init];
  if (v5)
  {
    if ([v4 hasPlaceHolderProperty]) {
      -[_SFPBFlightCheckinCommand setPlaceHolderProperty:](v5, "setPlaceHolderProperty:", [v4 placeHolderProperty]);
    }
    v6 = v5;
  }

  return v5;
}

- (BOOL)placeHolderProperty
{
  return self->_placeHolderProperty;
}

- (_SFPBFlightCheckinCommand)initWithDictionary:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_SFPBFlightCheckinCommand;
  v5 = [(_SFPBFlightCheckinCommand *)&v9 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"placeHolderProperty"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBFlightCheckinCommand setPlaceHolderProperty:](v5, "setPlaceHolderProperty:", [v6 BOOLValue]);
    }
    v7 = v5;
  }
  return v5;
}

- (_SFPBFlightCheckinCommand)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBFlightCheckinCommand *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBFlightCheckinCommand *)self dictionaryRepresentation];
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
  if (self->_placeHolderProperty)
  {
    id v4 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBFlightCheckinCommand placeHolderProperty](self, "placeHolderProperty"));
    [v3 setObject:v4 forKeyedSubscript:@"placeHolderProperty"];
  }
  return v3;
}

- (unint64_t)hash
{
  if (self->_placeHolderProperty) {
    return 2654435761;
  }
  else {
    return 0;
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    int placeHolderProperty = self->_placeHolderProperty;
    BOOL v6 = placeHolderProperty == [v4 placeHolderProperty];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if ([(_SFPBFlightCheckinCommand *)self placeHolderProperty]) {
    PBDataWriterWriteBOOLField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBFlightCheckinCommandReadFrom(self, (uint64_t)a3);
}

- (void)setPlaceHolderProperty:(BOOL)a3
{
  self->_int placeHolderProperty = a3;
}

@end