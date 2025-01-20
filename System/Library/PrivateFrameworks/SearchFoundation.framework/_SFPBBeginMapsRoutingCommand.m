@interface _SFPBBeginMapsRoutingCommand
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)shouldSearchDirectionsAlongCurrentRoute;
- (NSData)jsonData;
- (NSData)mapsData;
- (NSString)name;
- (_SFPBBeginMapsRoutingCommand)initWithDictionary:(id)a3;
- (_SFPBBeginMapsRoutingCommand)initWithFacade:(id)a3;
- (_SFPBBeginMapsRoutingCommand)initWithJSON:(id)a3;
- (_SFPBLatLng)location;
- (id)dictionaryRepresentation;
- (int)directionsMode;
- (unint64_t)hash;
- (void)setDirectionsMode:(int)a3;
- (void)setLocation:(id)a3;
- (void)setMapsData:(id)a3;
- (void)setName:(id)a3;
- (void)setShouldSearchDirectionsAlongCurrentRoute:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBBeginMapsRoutingCommand

- (_SFPBBeginMapsRoutingCommand)initWithFacade:(id)a3
{
  id v4 = a3;
  v5 = [(_SFPBBeginMapsRoutingCommand *)self init];
  if (v5)
  {
    v6 = [v4 location];

    if (v6)
    {
      v7 = [_SFPBLatLng alloc];
      v8 = [v4 location];
      v9 = [(_SFPBLatLng *)v7 initWithFacade:v8];
      [(_SFPBBeginMapsRoutingCommand *)v5 setLocation:v9];
    }
    v10 = [v4 mapsData];

    if (v10)
    {
      v11 = [v4 mapsData];
      [(_SFPBBeginMapsRoutingCommand *)v5 setMapsData:v11];
    }
    if ([v4 hasShouldSearchDirectionsAlongCurrentRoute]) {
      -[_SFPBBeginMapsRoutingCommand setShouldSearchDirectionsAlongCurrentRoute:](v5, "setShouldSearchDirectionsAlongCurrentRoute:", [v4 shouldSearchDirectionsAlongCurrentRoute]);
    }
    v12 = [v4 name];

    if (v12)
    {
      v13 = [v4 name];
      [(_SFPBBeginMapsRoutingCommand *)v5 setName:v13];
    }
    if ([v4 hasDirectionsMode]) {
      -[_SFPBBeginMapsRoutingCommand setDirectionsMode:](v5, "setDirectionsMode:", [v4 directionsMode]);
    }
    v14 = v5;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_mapsData, 0);
  objc_storeStrong((id *)&self->_location, 0);
}

- (int)directionsMode
{
  return self->_directionsMode;
}

- (NSString)name
{
  return self->_name;
}

- (BOOL)shouldSearchDirectionsAlongCurrentRoute
{
  return self->_shouldSearchDirectionsAlongCurrentRoute;
}

- (NSData)mapsData
{
  return self->_mapsData;
}

- (_SFPBLatLng)location
{
  return self->_location;
}

- (_SFPBBeginMapsRoutingCommand)initWithDictionary:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)_SFPBBeginMapsRoutingCommand;
  v5 = [(_SFPBBeginMapsRoutingCommand *)&v16 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"location"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[_SFPBLatLng alloc] initWithDictionary:v6];
      [(_SFPBBeginMapsRoutingCommand *)v5 setLocation:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"mapsData"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v8 options:0];
      [(_SFPBBeginMapsRoutingCommand *)v5 setMapsData:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"shouldSearchDirectionsAlongCurrentRoute"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBBeginMapsRoutingCommand setShouldSearchDirectionsAlongCurrentRoute:](v5, "setShouldSearchDirectionsAlongCurrentRoute:", [v10 BOOLValue]);
    }
    v11 = [v4 objectForKeyedSubscript:@"name"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v12 = (void *)[v11 copy];
      [(_SFPBBeginMapsRoutingCommand *)v5 setName:v12];
    }
    v13 = [v4 objectForKeyedSubscript:@"directionsMode"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBBeginMapsRoutingCommand setDirectionsMode:](v5, "setDirectionsMode:", [v13 intValue]);
    }
    v14 = v5;
  }
  return v5;
}

- (_SFPBBeginMapsRoutingCommand)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBBeginMapsRoutingCommand *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBBeginMapsRoutingCommand *)self dictionaryRepresentation];
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
  if (self->_directionsMode)
  {
    uint64_t v4 = [(_SFPBBeginMapsRoutingCommand *)self directionsMode];
    if (v4 >= 6)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v4);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = off_1E5A2F090[v4];
    }
    [v3 setObject:v5 forKeyedSubscript:@"directionsMode"];
  }
  if (self->_location)
  {
    v6 = [(_SFPBBeginMapsRoutingCommand *)self location];
    uint64_t v7 = [v6 dictionaryRepresentation];
    if (v7)
    {
      [v3 setObject:v7 forKeyedSubscript:@"location"];
    }
    else
    {
      v8 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v8 forKeyedSubscript:@"location"];
    }
  }
  if (self->_mapsData)
  {
    v9 = [(_SFPBBeginMapsRoutingCommand *)self mapsData];
    v10 = [v9 base64EncodedStringWithOptions:0];
    if (v10)
    {
      [v3 setObject:v10 forKeyedSubscript:@"mapsData"];
    }
    else
    {
      v11 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v11 forKeyedSubscript:@"mapsData"];
    }
  }
  if (self->_name)
  {
    v12 = [(_SFPBBeginMapsRoutingCommand *)self name];
    v13 = (void *)[v12 copy];
    [v3 setObject:v13 forKeyedSubscript:@"name"];
  }
  if (self->_shouldSearchDirectionsAlongCurrentRoute)
  {
    v14 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBBeginMapsRoutingCommand shouldSearchDirectionsAlongCurrentRoute](self, "shouldSearchDirectionsAlongCurrentRoute"));
    [v3 setObject:v14 forKeyedSubscript:@"shouldSearchDirectionsAlongCurrentRoute"];
  }
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_SFPBLatLng *)self->_location hash];
  uint64_t v4 = [(NSData *)self->_mapsData hash];
  if (self->_shouldSearchDirectionsAlongCurrentRoute) {
    uint64_t v5 = 2654435761;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5 ^ [(NSString *)self->_name hash] ^ (2654435761 * self->_directionsMode);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_18;
  }
  uint64_t v5 = [(_SFPBBeginMapsRoutingCommand *)self location];
  v6 = [v4 location];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_17;
  }
  uint64_t v7 = [(_SFPBBeginMapsRoutingCommand *)self location];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(_SFPBBeginMapsRoutingCommand *)self location];
    v10 = [v4 location];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_18;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBBeginMapsRoutingCommand *)self mapsData];
  v6 = [v4 mapsData];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_17;
  }
  uint64_t v12 = [(_SFPBBeginMapsRoutingCommand *)self mapsData];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(_SFPBBeginMapsRoutingCommand *)self mapsData];
    v15 = [v4 mapsData];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_18;
    }
  }
  else
  {
  }
  int shouldSearchDirectionsAlongCurrentRoute = self->_shouldSearchDirectionsAlongCurrentRoute;
  if (shouldSearchDirectionsAlongCurrentRoute != [v4 shouldSearchDirectionsAlongCurrentRoute])goto LABEL_18; {
  uint64_t v5 = [(_SFPBBeginMapsRoutingCommand *)self name];
  }
  v6 = [v4 name];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_17:

    goto LABEL_18;
  }
  uint64_t v18 = [(_SFPBBeginMapsRoutingCommand *)self name];
  if (!v18)
  {

LABEL_21:
    int directionsMode = self->_directionsMode;
    BOOL v23 = directionsMode == [v4 directionsMode];
    goto LABEL_19;
  }
  v19 = (void *)v18;
  v20 = [(_SFPBBeginMapsRoutingCommand *)self name];
  v21 = [v4 name];
  int v22 = [v20 isEqual:v21];

  if (v22) {
    goto LABEL_21;
  }
LABEL_18:
  BOOL v23 = 0;
LABEL_19:

  return v23;
}

- (void)writeTo:(id)a3
{
  id v9 = a3;
  id v4 = [(_SFPBBeginMapsRoutingCommand *)self location];
  if (v4) {
    PBDataWriterWriteSubmessage();
  }

  uint64_t v5 = [(_SFPBBeginMapsRoutingCommand *)self mapsData];
  if (v5) {
    PBDataWriterWriteDataField();
  }

  if ([(_SFPBBeginMapsRoutingCommand *)self shouldSearchDirectionsAlongCurrentRoute])
  {
    PBDataWriterWriteBOOLField();
  }
  v6 = [(_SFPBBeginMapsRoutingCommand *)self name];
  if (v6) {
    PBDataWriterWriteStringField();
  }

  int v7 = [(_SFPBBeginMapsRoutingCommand *)self directionsMode];
  v8 = v9;
  if (v7)
  {
    PBDataWriterWriteInt32Field();
    v8 = v9;
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBBeginMapsRoutingCommandReadFrom(self, (uint64_t)a3);
}

- (void)setDirectionsMode:(int)a3
{
  self->_int directionsMode = a3;
}

- (void)setName:(id)a3
{
  self->_name = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setShouldSearchDirectionsAlongCurrentRoute:(BOOL)a3
{
  self->_int shouldSearchDirectionsAlongCurrentRoute = a3;
}

- (void)setMapsData:(id)a3
{
  self->_mapsData = (NSData *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setLocation:(id)a3
{
}

@end