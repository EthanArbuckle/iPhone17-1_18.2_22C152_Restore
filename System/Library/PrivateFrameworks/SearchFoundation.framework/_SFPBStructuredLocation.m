@interface _SFPBStructuredLocation
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)title;
- (_SFPBLatLng)geoLocation;
- (_SFPBStructuredLocation)initWithDictionary:(id)a3;
- (_SFPBStructuredLocation)initWithFacade:(id)a3;
- (_SFPBStructuredLocation)initWithJSON:(id)a3;
- (double)radius;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)setGeoLocation:(id)a3;
- (void)setRadius:(double)a3;
- (void)setTitle:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBStructuredLocation

- (_SFPBStructuredLocation)initWithFacade:(id)a3
{
  id v4 = a3;
  v5 = [(_SFPBStructuredLocation *)self init];
  if (v5)
  {
    v6 = [v4 title];

    if (v6)
    {
      v7 = [v4 title];
      [(_SFPBStructuredLocation *)v5 setTitle:v7];
    }
    v8 = [v4 geoLocation];

    if (v8)
    {
      v9 = [_SFPBLatLng alloc];
      v10 = [v4 geoLocation];
      v11 = [(_SFPBLatLng *)v9 initWithFacade:v10];
      [(_SFPBStructuredLocation *)v5 setGeoLocation:v11];
    }
    if ([v4 hasRadius])
    {
      [v4 radius];
      -[_SFPBStructuredLocation setRadius:](v5, "setRadius:");
    }
    v12 = v5;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_geoLocation, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

- (double)radius
{
  return self->_radius;
}

- (_SFPBLatLng)geoLocation
{
  return self->_geoLocation;
}

- (NSString)title
{
  return self->_title;
}

- (_SFPBStructuredLocation)initWithDictionary:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_SFPBStructuredLocation;
  v5 = [(_SFPBStructuredLocation *)&v13 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"title"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(_SFPBStructuredLocation *)v5 setTitle:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"geoLocation"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[_SFPBLatLng alloc] initWithDictionary:v8];
      [(_SFPBStructuredLocation *)v5 setGeoLocation:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"radius"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v10 doubleValue];
      -[_SFPBStructuredLocation setRadius:](v5, "setRadius:");
    }
    v11 = v5;
  }
  return v5;
}

- (_SFPBStructuredLocation)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBStructuredLocation *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBStructuredLocation *)self dictionaryRepresentation];
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
  if (self->_geoLocation)
  {
    id v4 = [(_SFPBStructuredLocation *)self geoLocation];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"geoLocation"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"geoLocation"];
    }
  }
  if (self->_radius != 0.0)
  {
    uint64_t v7 = NSNumber;
    [(_SFPBStructuredLocation *)self radius];
    v8 = objc_msgSend(v7, "numberWithDouble:");
    [v3 setObject:v8 forKeyedSubscript:@"radius"];
  }
  if (self->_title)
  {
    v9 = [(_SFPBStructuredLocation *)self title];
    v10 = (void *)[v9 copy];
    [v3 setObject:v10 forKeyedSubscript:@"title"];
  }
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_title hash];
  unint64_t v4 = [(_SFPBLatLng *)self->_geoLocation hash];
  double radius = self->_radius;
  if (radius == 0.0)
  {
    unint64_t v9 = 0;
  }
  else
  {
    double v6 = -radius;
    if (radius >= 0.0) {
      double v6 = self->_radius;
    }
    long double v7 = floor(v6 + 0.5);
    double v8 = (v6 - v7) * 1.84467441e19;
    unint64_t v9 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0) {
        v9 += (unint64_t)v8;
      }
    }
    else
    {
      v9 -= (unint64_t)fabs(v8);
    }
  }
  return v4 ^ v3 ^ v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  v5 = [(_SFPBStructuredLocation *)self title];
  double v6 = [v4 title];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(_SFPBStructuredLocation *)self title];
  if (v7)
  {
    double v8 = (void *)v7;
    unint64_t v9 = [(_SFPBStructuredLocation *)self title];
    v10 = [v4 title];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  v5 = [(_SFPBStructuredLocation *)self geoLocation];
  double v6 = [v4 geoLocation];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v12 = [(_SFPBStructuredLocation *)self geoLocation];
    if (!v12)
    {

LABEL_15:
      double radius = self->_radius;
      [v4 radius];
      BOOL v17 = radius == v20;
      goto LABEL_13;
    }
    objc_super v13 = (void *)v12;
    v14 = [(_SFPBStructuredLocation *)self geoLocation];
    v15 = [v4 geoLocation];
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
  id v8 = a3;
  id v4 = [(_SFPBStructuredLocation *)self title];
  if (v4) {
    PBDataWriterWriteStringField();
  }

  v5 = [(_SFPBStructuredLocation *)self geoLocation];
  if (v5) {
    PBDataWriterWriteSubmessage();
  }

  [(_SFPBStructuredLocation *)self radius];
  double v6 = v8;
  if (v7 != 0.0)
  {
    PBDataWriterWriteDoubleField();
    double v6 = v8;
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBStructuredLocationReadFrom(self, (uint64_t)a3);
}

- (void)setRadius:(double)a3
{
  self->_double radius = a3;
}

- (void)setGeoLocation:(id)a3
{
}

- (void)setTitle:(id)a3
{
  self->_title = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

@end