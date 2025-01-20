@interface _SFPBLatLng
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (_SFPBLatLng)initWithDictionary:(id)a3;
- (_SFPBLatLng)initWithFacade:(id)a3;
- (_SFPBLatLng)initWithJSON:(id)a3;
- (double)lat;
- (double)lng;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)setLat:(double)a3;
- (void)setLng:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBLatLng

- (_SFPBLatLng)initWithFacade:(id)a3
{
  id v4 = a3;
  v5 = [(_SFPBLatLng *)self init];
  if (v5)
  {
    if ([v4 hasLat])
    {
      [v4 lat];
      -[_SFPBLatLng setLat:](v5, "setLat:");
    }
    if ([v4 hasLng])
    {
      [v4 lng];
      -[_SFPBLatLng setLng:](v5, "setLng:");
    }
    v6 = v5;
  }

  return v5;
}

- (double)lng
{
  return self->_lng;
}

- (double)lat
{
  return self->_lat;
}

- (_SFPBLatLng)initWithDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_SFPBLatLng;
  v5 = [(_SFPBLatLng *)&v10 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"lat"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v6 doubleValue];
      -[_SFPBLatLng setLat:](v5, "setLat:");
    }
    v7 = [v4 objectForKeyedSubscript:@"lng"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v7 doubleValue];
      -[_SFPBLatLng setLng:](v5, "setLng:");
    }
    v8 = v5;
  }
  return v5;
}

- (_SFPBLatLng)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBLatLng *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBLatLng *)self dictionaryRepresentation];
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
  if (self->_lat != 0.0)
  {
    id v4 = NSNumber;
    [(_SFPBLatLng *)self lat];
    v5 = objc_msgSend(v4, "numberWithDouble:");
    [v3 setObject:v5 forKeyedSubscript:@"lat"];
  }
  if (self->_lng != 0.0)
  {
    v6 = NSNumber;
    [(_SFPBLatLng *)self lng];
    uint64_t v7 = objc_msgSend(v6, "numberWithDouble:");
    [v3 setObject:v7 forKeyedSubscript:@"lng"];
  }
  return v3;
}

- (unint64_t)hash
{
  double lat = self->_lat;
  if (lat == 0.0)
  {
    unint64_t v7 = 0;
  }
  else
  {
    double v4 = -lat;
    if (lat >= 0.0) {
      double v4 = self->_lat;
    }
    long double v5 = floor(v4 + 0.5);
    double v6 = (v4 - v5) * 1.84467441e19;
    unint64_t v7 = 2654435761u * (unint64_t)fmod(v5, 1.84467441e19);
    if (v6 >= 0.0)
    {
      if (v6 > 0.0) {
        v7 += (unint64_t)v6;
      }
    }
    else
    {
      v7 -= (unint64_t)fabs(v6);
    }
  }
  double lng = self->_lng;
  if (lng == 0.0)
  {
    unint64_t v12 = 0;
  }
  else
  {
    double v9 = -lng;
    if (lng >= 0.0) {
      double v9 = self->_lng;
    }
    long double v10 = floor(v9 + 0.5);
    double v11 = (v9 - v10) * 1.84467441e19;
    unint64_t v12 = 2654435761u * (unint64_t)fmod(v10, 1.84467441e19);
    if (v11 >= 0.0)
    {
      if (v11 > 0.0) {
        v12 += (unint64_t)v11;
      }
    }
    else
    {
      v12 -= (unint64_t)fabs(v11);
    }
  }
  return v12 ^ v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (double lat = self->_lat, [v4 lat], lat == v6))
  {
    double lng = self->_lng;
    [v4 lng];
    BOOL v7 = lng == v9;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (void)writeTo:(id)a3
{
  id v6 = a3;
  [(_SFPBLatLng *)self lat];
  if (v4 != 0.0) {
    PBDataWriterWriteDoubleField();
  }
  [(_SFPBLatLng *)self lng];
  if (v5 != 0.0) {
    PBDataWriterWriteDoubleField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBLatLngReadFrom(self, (uint64_t)a3);
}

- (void)setLng:(double)a3
{
  self->_double lng = a3;
}

- (void)setLat:(double)a3
{
  self->_double lat = a3;
}

@end