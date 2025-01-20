@interface _SFPBMapRegion
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (_SFPBMapRegion)initWithDictionary:(id)a3;
- (_SFPBMapRegion)initWithFacade:(id)a3;
- (_SFPBMapRegion)initWithJSON:(id)a3;
- (double)altitudeInMeters;
- (double)eastLng;
- (double)northLat;
- (double)southLat;
- (double)westLng;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)setAltitudeInMeters:(double)a3;
- (void)setEastLng:(double)a3;
- (void)setNorthLat:(double)a3;
- (void)setSouthLat:(double)a3;
- (void)setWestLng:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBMapRegion

- (_SFPBMapRegion)initWithFacade:(id)a3
{
  id v4 = a3;
  v5 = [(_SFPBMapRegion *)self init];
  if (v5)
  {
    if ([v4 hasSouthLat])
    {
      [v4 southLat];
      [(_SFPBMapRegion *)v5 setSouthLat:"setSouthLat:"];
    }
    if ([v4 hasWestLng])
    {
      [v4 westLng];
      -[_SFPBMapRegion setWestLng:](v5, "setWestLng:");
    }
    if ([v4 hasNorthLat])
    {
      [v4 northLat];
      -[_SFPBMapRegion setNorthLat:](v5, "setNorthLat:");
    }
    if ([v4 hasEastLng])
    {
      [v4 eastLng];
      -[_SFPBMapRegion setEastLng:](v5, "setEastLng:");
    }
    if ([v4 hasAltitudeInMeters])
    {
      [v4 altitudeInMeters];
      -[_SFPBMapRegion setAltitudeInMeters:](v5, "setAltitudeInMeters:");
    }
    v6 = v5;
  }

  return v5;
}

- (double)altitudeInMeters
{
  return self->_altitudeInMeters;
}

- (double)eastLng
{
  return self->_eastLng;
}

- (double)northLat
{
  return self->_northLat;
}

- (double)westLng
{
  return self->_westLng;
}

- (double)southLat
{
  return self->_southLat;
}

- (_SFPBMapRegion)initWithDictionary:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_SFPBMapRegion;
  v5 = [(_SFPBMapRegion *)&v13 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"southLat"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v6 doubleValue];
      [(_SFPBMapRegion *)v5 setSouthLat:"setSouthLat:"];
    }
    v7 = [v4 objectForKeyedSubscript:@"westLng"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v7 doubleValue];
      -[_SFPBMapRegion setWestLng:](v5, "setWestLng:");
    }
    v8 = [v4 objectForKeyedSubscript:@"northLat"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v8 doubleValue];
      -[_SFPBMapRegion setNorthLat:](v5, "setNorthLat:");
    }
    v9 = [v4 objectForKeyedSubscript:@"eastLng"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v9 doubleValue];
      -[_SFPBMapRegion setEastLng:](v5, "setEastLng:");
    }
    v10 = [v4 objectForKeyedSubscript:@"altitudeInMeters"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v10 doubleValue];
      -[_SFPBMapRegion setAltitudeInMeters:](v5, "setAltitudeInMeters:");
    }
    v11 = v5;
  }
  return v5;
}

- (_SFPBMapRegion)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBMapRegion *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBMapRegion *)self dictionaryRepresentation];
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
  if (self->_altitudeInMeters != 0.0)
  {
    id v4 = NSNumber;
    [(_SFPBMapRegion *)self altitudeInMeters];
    v5 = objc_msgSend(v4, "numberWithDouble:");
    [v3 setObject:v5 forKeyedSubscript:@"altitudeInMeters"];
  }
  if (self->_eastLng != 0.0)
  {
    v6 = NSNumber;
    [(_SFPBMapRegion *)self eastLng];
    uint64_t v7 = objc_msgSend(v6, "numberWithDouble:");
    [v3 setObject:v7 forKeyedSubscript:@"eastLng"];
  }
  if (self->_northLat != 0.0)
  {
    v8 = NSNumber;
    [(_SFPBMapRegion *)self northLat];
    v9 = objc_msgSend(v8, "numberWithDouble:");
    [v3 setObject:v9 forKeyedSubscript:@"northLat"];
  }
  if (self->_southLat != 0.0)
  {
    v10 = NSNumber;
    [(_SFPBMapRegion *)self southLat];
    v11 = objc_msgSend(v10, "numberWithDouble:");
    [v3 setObject:v11 forKeyedSubscript:@"southLat"];
  }
  if (self->_westLng != 0.0)
  {
    v12 = NSNumber;
    [(_SFPBMapRegion *)self westLng];
    objc_super v13 = objc_msgSend(v12, "numberWithDouble:");
    [v3 setObject:v13 forKeyedSubscript:@"westLng"];
  }
  return v3;
}

- (unint64_t)hash
{
  double southLat = self->_southLat;
  if (southLat == 0.0)
  {
    unint64_t v7 = 0;
  }
  else
  {
    double v4 = -southLat;
    if (southLat >= 0.0) {
      double v4 = self->_southLat;
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
  double westLng = self->_westLng;
  if (westLng == 0.0)
  {
    unint64_t v12 = 0;
  }
  else
  {
    double v9 = -westLng;
    if (westLng >= 0.0) {
      double v9 = self->_westLng;
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
  double northLat = self->_northLat;
  if (northLat == 0.0)
  {
    unint64_t v17 = 0;
  }
  else
  {
    double v14 = -northLat;
    if (northLat >= 0.0) {
      double v14 = self->_northLat;
    }
    long double v15 = floor(v14 + 0.5);
    double v16 = (v14 - v15) * 1.84467441e19;
    unint64_t v17 = 2654435761u * (unint64_t)fmod(v15, 1.84467441e19);
    if (v16 >= 0.0)
    {
      if (v16 > 0.0) {
        v17 += (unint64_t)v16;
      }
    }
    else
    {
      v17 -= (unint64_t)fabs(v16);
    }
  }
  double eastLng = self->_eastLng;
  if (eastLng == 0.0)
  {
    unint64_t v22 = 0;
  }
  else
  {
    double v19 = -eastLng;
    if (eastLng >= 0.0) {
      double v19 = self->_eastLng;
    }
    long double v20 = floor(v19 + 0.5);
    double v21 = (v19 - v20) * 1.84467441e19;
    unint64_t v22 = 2654435761u * (unint64_t)fmod(v20, 1.84467441e19);
    if (v21 >= 0.0)
    {
      if (v21 > 0.0) {
        v22 += (unint64_t)v21;
      }
    }
    else
    {
      v22 -= (unint64_t)fabs(v21);
    }
  }
  double altitudeInMeters = self->_altitudeInMeters;
  if (altitudeInMeters == 0.0)
  {
    unint64_t v27 = 0;
  }
  else
  {
    double v24 = -altitudeInMeters;
    if (altitudeInMeters >= 0.0) {
      double v24 = self->_altitudeInMeters;
    }
    long double v25 = floor(v24 + 0.5);
    double v26 = (v24 - v25) * 1.84467441e19;
    unint64_t v27 = 2654435761u * (unint64_t)fmod(v25, 1.84467441e19);
    if (v26 >= 0.0)
    {
      if (v26 > 0.0) {
        v27 += (unint64_t)v26;
      }
    }
    else
    {
      v27 -= (unint64_t)fabs(v26);
    }
  }
  return v12 ^ v7 ^ v17 ^ v22 ^ v27;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_6;
  }
  double southLat = self->_southLat;
  [v4 southLat];
  if (southLat != v6) {
    goto LABEL_6;
  }
  double westLng = self->_westLng;
  [v4 westLng];
  if (westLng == v8
    && (double northLat = self->_northLat, [v4 northLat], northLat == v10)
    && (double eastLng = self->_eastLng, [v4 eastLng], eastLng == v12))
  {
    double altitudeInMeters = self->_altitudeInMeters;
    [v4 altitudeInMeters];
    BOOL v13 = altitudeInMeters == v16;
  }
  else
  {
LABEL_6:
    BOOL v13 = 0;
  }

  return v13;
}

- (void)writeTo:(id)a3
{
  id v10 = a3;
  [(_SFPBMapRegion *)self southLat];
  if (v4 != 0.0) {
    PBDataWriterWriteDoubleField();
  }
  [(_SFPBMapRegion *)self westLng];
  if (v5 != 0.0) {
    PBDataWriterWriteDoubleField();
  }
  [(_SFPBMapRegion *)self northLat];
  if (v6 != 0.0) {
    PBDataWriterWriteDoubleField();
  }
  [(_SFPBMapRegion *)self eastLng];
  if (v7 != 0.0) {
    PBDataWriterWriteDoubleField();
  }
  [(_SFPBMapRegion *)self altitudeInMeters];
  double v8 = v10;
  if (v9 != 0.0)
  {
    PBDataWriterWriteDoubleField();
    double v8 = v10;
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBMapRegionReadFrom(self, (uint64_t)a3);
}

- (void)setAltitudeInMeters:(double)a3
{
  self->_double altitudeInMeters = a3;
}

- (void)setEastLng:(double)a3
{
  self->_double eastLng = a3;
}

- (void)setNorthLat:(double)a3
{
  self->_double northLat = a3;
}

- (void)setWestLng:(double)a3
{
  self->_double westLng = a3;
}

- (void)setSouthLat:(double)a3
{
  self->_double southLat = a3;
}

@end