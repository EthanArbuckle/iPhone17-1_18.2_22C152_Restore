@interface SFBeginMapsRoutingCommand
+ (BOOL)supportsSecureCoding;
- (BOOL)hasDirectionsMode;
- (BOOL)hasShouldSearchDirectionsAlongCurrentRoute;
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldSearchDirectionsAlongCurrentRoute;
- (NSData)jsonData;
- (NSData)mapsData;
- (NSDictionary)dictionaryRepresentation;
- (NSString)name;
- (SFBeginMapsRoutingCommand)initWithCoder:(id)a3;
- (SFBeginMapsRoutingCommand)initWithProtobuf:(id)a3;
- (SFLatLng)location;
- (id)copyWithZone:(_NSZone *)a3;
- (int)directionsMode;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setDirectionsMode:(int)a3;
- (void)setLocation:(id)a3;
- (void)setMapsData:(id)a3;
- (void)setName:(id)a3;
- (void)setShouldSearchDirectionsAlongCurrentRoute:(BOOL)a3;
@end

@implementation SFBeginMapsRoutingCommand

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

- (void)setName:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (BOOL)shouldSearchDirectionsAlongCurrentRoute
{
  return self->_shouldSearchDirectionsAlongCurrentRoute;
}

- (void)setMapsData:(id)a3
{
}

- (NSData)mapsData
{
  return self->_mapsData;
}

- (void)setLocation:(id)a3
{
}

- (SFLatLng)location
{
  return self->_location;
}

- (unint64_t)hash
{
  v13.receiver = self;
  v13.super_class = (Class)SFBeginMapsRoutingCommand;
  unint64_t v3 = [(SFCommand *)&v13 hash];
  v4 = [(SFBeginMapsRoutingCommand *)self location];
  uint64_t v5 = [v4 hash];
  v6 = [(SFBeginMapsRoutingCommand *)self mapsData];
  uint64_t v7 = v5 ^ [v6 hash];
  uint64_t v8 = v7 ^ [(SFBeginMapsRoutingCommand *)self shouldSearchDirectionsAlongCurrentRoute];
  v9 = [(SFBeginMapsRoutingCommand *)self name];
  uint64_t v10 = v8 ^ [v9 hash];
  unint64_t v11 = v10 ^ [(SFBeginMapsRoutingCommand *)self directionsMode] ^ v3;

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (SFBeginMapsRoutingCommand *)a3;
  if (self == v4)
  {
    BOOL v11 = 1;
  }
  else
  {
    if ([(SFBeginMapsRoutingCommand *)v4 isMemberOfClass:objc_opt_class()])
    {
      v32.receiver = self;
      v32.super_class = (Class)SFBeginMapsRoutingCommand;
      if ([(SFCommand *)&v32 isEqual:v4])
      {
        uint64_t v5 = v4;
        v6 = [(SFBeginMapsRoutingCommand *)self location];
        uint64_t v7 = [(SFBeginMapsRoutingCommand *)v5 location];
        if ((v6 == 0) == (v7 != 0))
        {
          BOOL v11 = 0;
LABEL_31:

          goto LABEL_32;
        }
        uint64_t v8 = [(SFBeginMapsRoutingCommand *)self location];
        if (v8)
        {
          v9 = [(SFBeginMapsRoutingCommand *)self location];
          uint64_t v10 = [(SFBeginMapsRoutingCommand *)v5 location];
          if (![v9 isEqual:v10])
          {
            BOOL v11 = 0;
            goto LABEL_29;
          }
          v30 = v10;
          v31 = v9;
        }
        v12 = [(SFBeginMapsRoutingCommand *)self mapsData];
        objc_super v13 = [(SFBeginMapsRoutingCommand *)v5 mapsData];
        v14 = v13;
        if ((v12 == 0) == (v13 != 0))
        {

          BOOL v11 = 0;
          v9 = v31;
          goto LABEL_28;
        }
        uint64_t v29 = [(SFBeginMapsRoutingCommand *)self mapsData];
        if (v29)
        {
          v15 = [(SFBeginMapsRoutingCommand *)self mapsData];
          v27 = [(SFBeginMapsRoutingCommand *)v5 mapsData];
          v28 = v15;
          if (!objc_msgSend(v15, "isEqual:"))
          {
            BOOL v11 = 0;
            v9 = v31;
            v16 = (void *)v29;
            goto LABEL_26;
          }
        }
        BOOL v17 = [(SFBeginMapsRoutingCommand *)self shouldSearchDirectionsAlongCurrentRoute];
        if (v17 == [(SFBeginMapsRoutingCommand *)v5 shouldSearchDirectionsAlongCurrentRoute])
        {
          v18 = [(SFBeginMapsRoutingCommand *)self name];
          v19 = [(SFBeginMapsRoutingCommand *)v5 name];
          if ((v18 == 0) != (v19 != 0))
          {
            v25 = v19;
            v26 = [(SFBeginMapsRoutingCommand *)self name];
            if (v26)
            {
              v20 = [(SFBeginMapsRoutingCommand *)self name];
              v23 = [(SFBeginMapsRoutingCommand *)v5 name];
              v24 = v20;
              if (!objc_msgSend(v20, "isEqual:"))
              {
                BOOL v11 = 0;
LABEL_34:
                v9 = v31;

LABEL_25:
                v16 = (void *)v29;
                if (!v29)
                {
LABEL_27:

LABEL_28:
                  uint64_t v10 = v30;
                  if (!v8)
                  {
LABEL_30:

                    goto LABEL_31;
                  }
LABEL_29:

                  goto LABEL_30;
                }
LABEL_26:

                goto LABEL_27;
              }
            }
            int v22 = [(SFBeginMapsRoutingCommand *)self directionsMode];
            BOOL v11 = v22 == [(SFBeginMapsRoutingCommand *)v5 directionsMode];
            if (v26) {
              goto LABEL_34;
            }

LABEL_24:
            v9 = v31;
            goto LABEL_25;
          }
        }
        BOOL v11 = 0;
        goto LABEL_24;
      }
    }
    BOOL v11 = 0;
  }
LABEL_32:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v12.receiver = self;
  v12.super_class = (Class)SFBeginMapsRoutingCommand;
  id v4 = [(SFCommand *)&v12 copyWithZone:a3];
  uint64_t v5 = [(SFBeginMapsRoutingCommand *)self location];
  v6 = (void *)[v5 copy];
  [v4 setLocation:v6];

  uint64_t v7 = [(SFBeginMapsRoutingCommand *)self mapsData];
  uint64_t v8 = (void *)[v7 copy];
  [v4 setMapsData:v8];

  objc_msgSend(v4, "setShouldSearchDirectionsAlongCurrentRoute:", -[SFBeginMapsRoutingCommand shouldSearchDirectionsAlongCurrentRoute](self, "shouldSearchDirectionsAlongCurrentRoute"));
  v9 = [(SFBeginMapsRoutingCommand *)self name];
  uint64_t v10 = (void *)[v9 copy];
  [v4 setName:v10];

  objc_msgSend(v4, "setDirectionsMode:", -[SFBeginMapsRoutingCommand directionsMode](self, "directionsMode"));
  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBBeginMapsRoutingCommand alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBBeginMapsRoutingCommand *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBBeginMapsRoutingCommand alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBBeginMapsRoutingCommand *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)SFBeginMapsRoutingCommand;
  [(SFCommand *)&v3 encodeWithCoder:a3];
}

- (SFBeginMapsRoutingCommand)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SFBeginMapsRoutingCommand *)self init];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  uint64_t v7 = [[_SFPBCommand alloc] initWithData:v6];
  uint64_t v8 = [[SFCommand alloc] initWithProtobuf:v7];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v9 = [(SFCommand *)v8 location];
    [(SFBeginMapsRoutingCommand *)v5 setLocation:v9];

    uint64_t v10 = [(SFCommand *)v8 mapsData];
    [(SFBeginMapsRoutingCommand *)v5 setMapsData:v10];

    [(SFBeginMapsRoutingCommand *)v5 setShouldSearchDirectionsAlongCurrentRoute:[(SFCommand *)v8 shouldSearchDirectionsAlongCurrentRoute]];
    BOOL v11 = [(SFCommand *)v8 name];
    [(SFBeginMapsRoutingCommand *)v5 setName:v11];

    [(SFBeginMapsRoutingCommand *)v5 setDirectionsMode:[(SFCommand *)v8 directionsMode]];
    objc_super v12 = [(SFCommand *)v8 commandDetail];
    [(SFCommand *)v5 setCommandDetail:v12];

    objc_super v13 = [(SFCommand *)v8 normalizedTopic];
    [(SFCommand *)v5 setNormalizedTopic:v13];

    v14 = [(SFCommand *)v8 backendData];
    [(SFCommand *)v5 setBackendData:v14];

    v15 = [(SFCommand *)v8 commandReference];
    [(SFCommand *)v5 setCommandReference:v15];
  }
  return v5;
}

- (BOOL)hasDirectionsMode
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setDirectionsMode:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_directionsMode = a3;
}

- (BOOL)hasShouldSearchDirectionsAlongCurrentRoute
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setShouldSearchDirectionsAlongCurrentRoute:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_shouldSearchDirectionsAlongCurrentRoute = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFBeginMapsRoutingCommand)initWithProtobuf:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SFBeginMapsRoutingCommand;
  uint64_t v5 = [(SFBeginMapsRoutingCommand *)&v16 init];
  if (v5)
  {
    v6 = [v4 location];

    if (v6)
    {
      uint64_t v7 = [SFLatLng alloc];
      uint64_t v8 = [v4 location];
      v9 = [(SFLatLng *)v7 initWithProtobuf:v8];
      [(SFBeginMapsRoutingCommand *)v5 setLocation:v9];
    }
    uint64_t v10 = [v4 mapsData];

    if (v10)
    {
      BOOL v11 = [v4 mapsData];
      [(SFBeginMapsRoutingCommand *)v5 setMapsData:v11];
    }
    if ([v4 shouldSearchDirectionsAlongCurrentRoute]) {
      -[SFBeginMapsRoutingCommand setShouldSearchDirectionsAlongCurrentRoute:](v5, "setShouldSearchDirectionsAlongCurrentRoute:", [v4 shouldSearchDirectionsAlongCurrentRoute]);
    }
    objc_super v12 = [v4 name];

    if (v12)
    {
      objc_super v13 = [v4 name];
      [(SFBeginMapsRoutingCommand *)v5 setName:v13];
    }
    if ([v4 directionsMode]) {
      -[SFBeginMapsRoutingCommand setDirectionsMode:](v5, "setDirectionsMode:", [v4 directionsMode]);
    }
    v14 = v5;
  }

  return v5;
}

@end