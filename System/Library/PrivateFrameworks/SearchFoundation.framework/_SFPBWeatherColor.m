@interface _SFPBWeatherColor
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)condition;
- (_SFPBDate)date;
- (_SFPBLatLng)location;
- (_SFPBWeatherColor)initWithDictionary:(id)a3;
- (_SFPBWeatherColor)initWithFacade:(id)a3;
- (_SFPBWeatherColor)initWithJSON:(id)a3;
- (double)cloudCover;
- (double)cloudCoverHighAltPct;
- (double)cloudCoverLowAltPct;
- (double)cloudCoverMidAltPct;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)setCloudCover:(double)a3;
- (void)setCloudCoverHighAltPct:(double)a3;
- (void)setCloudCoverLowAltPct:(double)a3;
- (void)setCloudCoverMidAltPct:(double)a3;
- (void)setCondition:(id)a3;
- (void)setDate:(id)a3;
- (void)setLocation:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBWeatherColor

- (_SFPBWeatherColor)initWithFacade:(id)a3
{
  id v4 = a3;
  v5 = [(_SFPBWeatherColor *)self init];
  if (v5)
  {
    v6 = [v4 condition];

    if (v6)
    {
      v7 = [v4 condition];
      [(_SFPBWeatherColor *)v5 setCondition:v7];
    }
    v8 = [v4 location];

    if (v8)
    {
      v9 = [_SFPBLatLng alloc];
      v10 = [v4 location];
      v11 = [(_SFPBLatLng *)v9 initWithFacade:v10];
      [(_SFPBWeatherColor *)v5 setLocation:v11];
    }
    v12 = [v4 date];

    if (v12)
    {
      v13 = [_SFPBDate alloc];
      v14 = [v4 date];
      v15 = [(_SFPBDate *)v13 initWithNSDate:v14];
      [(_SFPBWeatherColor *)v5 setDate:v15];
    }
    if ([v4 hasCloudCover])
    {
      [v4 cloudCover];
      -[_SFPBWeatherColor setCloudCover:](v5, "setCloudCover:");
    }
    if ([v4 hasCloudCoverLowAltPct])
    {
      [v4 cloudCoverLowAltPct];
      -[_SFPBWeatherColor setCloudCoverLowAltPct:](v5, "setCloudCoverLowAltPct:");
    }
    if ([v4 hasCloudCoverMidAltPct])
    {
      [v4 cloudCoverMidAltPct];
      -[_SFPBWeatherColor setCloudCoverMidAltPct:](v5, "setCloudCoverMidAltPct:");
    }
    if ([v4 hasCloudCoverHighAltPct])
    {
      [v4 cloudCoverHighAltPct];
      -[_SFPBWeatherColor setCloudCoverHighAltPct:](v5, "setCloudCoverHighAltPct:");
    }
    v16 = v5;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_condition, 0);
}

- (double)cloudCoverHighAltPct
{
  return self->_cloudCoverHighAltPct;
}

- (double)cloudCoverMidAltPct
{
  return self->_cloudCoverMidAltPct;
}

- (double)cloudCoverLowAltPct
{
  return self->_cloudCoverLowAltPct;
}

- (double)cloudCover
{
  return self->_cloudCover;
}

- (_SFPBDate)date
{
  return self->_date;
}

- (_SFPBLatLng)location
{
  return self->_location;
}

- (NSString)condition
{
  return self->_condition;
}

- (_SFPBWeatherColor)initWithDictionary:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)_SFPBWeatherColor;
  v5 = [(_SFPBWeatherColor *)&v18 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"condition"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(_SFPBWeatherColor *)v5 setCondition:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"location"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[_SFPBLatLng alloc] initWithDictionary:v8];
      [(_SFPBWeatherColor *)v5 setLocation:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"date"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v11 = [[_SFPBDate alloc] initWithDictionary:v10];
      [(_SFPBWeatherColor *)v5 setDate:v11];
    }
    v12 = [v4 objectForKeyedSubscript:@"cloudCover"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v12 doubleValue];
      -[_SFPBWeatherColor setCloudCover:](v5, "setCloudCover:");
    }
    v13 = [v4 objectForKeyedSubscript:@"cloudCoverLowAltPct"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v13 doubleValue];
      -[_SFPBWeatherColor setCloudCoverLowAltPct:](v5, "setCloudCoverLowAltPct:");
    }
    v14 = [v4 objectForKeyedSubscript:@"cloudCoverMidAltPct"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v14 doubleValue];
      -[_SFPBWeatherColor setCloudCoverMidAltPct:](v5, "setCloudCoverMidAltPct:");
    }
    v15 = [v4 objectForKeyedSubscript:@"cloudCoverHighAltPct"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v15 doubleValue];
      -[_SFPBWeatherColor setCloudCoverHighAltPct:](v5, "setCloudCoverHighAltPct:");
    }
    v16 = v5;
  }
  return v5;
}

- (_SFPBWeatherColor)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBWeatherColor *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBWeatherColor *)self dictionaryRepresentation];
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
  if (self->_cloudCover != 0.0)
  {
    id v4 = NSNumber;
    [(_SFPBWeatherColor *)self cloudCover];
    v5 = objc_msgSend(v4, "numberWithDouble:");
    [v3 setObject:v5 forKeyedSubscript:@"cloudCover"];
  }
  if (self->_cloudCoverHighAltPct != 0.0)
  {
    v6 = NSNumber;
    [(_SFPBWeatherColor *)self cloudCoverHighAltPct];
    uint64_t v7 = objc_msgSend(v6, "numberWithDouble:");
    [v3 setObject:v7 forKeyedSubscript:@"cloudCoverHighAltPct"];
  }
  if (self->_cloudCoverLowAltPct != 0.0)
  {
    v8 = NSNumber;
    [(_SFPBWeatherColor *)self cloudCoverLowAltPct];
    v9 = objc_msgSend(v8, "numberWithDouble:");
    [v3 setObject:v9 forKeyedSubscript:@"cloudCoverLowAltPct"];
  }
  if (self->_cloudCoverMidAltPct != 0.0)
  {
    v10 = NSNumber;
    [(_SFPBWeatherColor *)self cloudCoverMidAltPct];
    v11 = objc_msgSend(v10, "numberWithDouble:");
    [v3 setObject:v11 forKeyedSubscript:@"cloudCoverMidAltPct"];
  }
  if (self->_condition)
  {
    v12 = [(_SFPBWeatherColor *)self condition];
    v13 = (void *)[v12 copy];
    [v3 setObject:v13 forKeyedSubscript:@"condition"];
  }
  if (self->_date)
  {
    v14 = [(_SFPBWeatherColor *)self date];
    v15 = [v14 dictionaryRepresentation];
    if (v15)
    {
      [v3 setObject:v15 forKeyedSubscript:@"date"];
    }
    else
    {
      v16 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v16 forKeyedSubscript:@"date"];
    }
  }
  if (self->_location)
  {
    v17 = [(_SFPBWeatherColor *)self location];
    objc_super v18 = [v17 dictionaryRepresentation];
    if (v18)
    {
      [v3 setObject:v18 forKeyedSubscript:@"location"];
    }
    else
    {
      v19 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v19 forKeyedSubscript:@"location"];
    }
  }
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_condition hash];
  unint64_t v4 = [(_SFPBLatLng *)self->_location hash];
  unint64_t v5 = [(_SFPBDate *)self->_date hash];
  double cloudCover = self->_cloudCover;
  if (cloudCover == 0.0)
  {
    unint64_t v10 = 0;
  }
  else
  {
    double v7 = -cloudCover;
    if (cloudCover >= 0.0) {
      double v7 = self->_cloudCover;
    }
    long double v8 = floor(v7 + 0.5);
    double v9 = (v7 - v8) * 1.84467441e19;
    unint64_t v10 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
    if (v9 >= 0.0)
    {
      if (v9 > 0.0) {
        v10 += (unint64_t)v9;
      }
    }
    else
    {
      v10 -= (unint64_t)fabs(v9);
    }
  }
  double cloudCoverLowAltPct = self->_cloudCoverLowAltPct;
  if (cloudCoverLowAltPct == 0.0)
  {
    unint64_t v15 = 0;
  }
  else
  {
    double v12 = -cloudCoverLowAltPct;
    if (cloudCoverLowAltPct >= 0.0) {
      double v12 = self->_cloudCoverLowAltPct;
    }
    long double v13 = floor(v12 + 0.5);
    double v14 = (v12 - v13) * 1.84467441e19;
    unint64_t v15 = 2654435761u * (unint64_t)fmod(v13, 1.84467441e19);
    if (v14 >= 0.0)
    {
      if (v14 > 0.0) {
        v15 += (unint64_t)v14;
      }
    }
    else
    {
      v15 -= (unint64_t)fabs(v14);
    }
  }
  double cloudCoverMidAltPct = self->_cloudCoverMidAltPct;
  if (cloudCoverMidAltPct == 0.0)
  {
    unint64_t v20 = 0;
  }
  else
  {
    double v17 = -cloudCoverMidAltPct;
    if (cloudCoverMidAltPct >= 0.0) {
      double v17 = self->_cloudCoverMidAltPct;
    }
    long double v18 = floor(v17 + 0.5);
    double v19 = (v17 - v18) * 1.84467441e19;
    unint64_t v20 = 2654435761u * (unint64_t)fmod(v18, 1.84467441e19);
    if (v19 >= 0.0)
    {
      if (v19 > 0.0) {
        v20 += (unint64_t)v19;
      }
    }
    else
    {
      v20 -= (unint64_t)fabs(v19);
    }
  }
  double cloudCoverHighAltPct = self->_cloudCoverHighAltPct;
  if (cloudCoverHighAltPct == 0.0)
  {
    unint64_t v25 = 0;
  }
  else
  {
    double v22 = -cloudCoverHighAltPct;
    if (cloudCoverHighAltPct >= 0.0) {
      double v22 = self->_cloudCoverHighAltPct;
    }
    long double v23 = floor(v22 + 0.5);
    double v24 = (v22 - v23) * 1.84467441e19;
    unint64_t v25 = 2654435761u * (unint64_t)fmod(v23, 1.84467441e19);
    if (v24 >= 0.0)
    {
      if (v24 > 0.0) {
        v25 += (unint64_t)v24;
      }
    }
    else
    {
      v25 -= (unint64_t)fabs(v24);
    }
  }
  return v4 ^ v3 ^ v5 ^ v10 ^ v15 ^ v20 ^ v25;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  unint64_t v5 = [(_SFPBWeatherColor *)self condition];
  v6 = [v4 condition];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v7 = [(_SFPBWeatherColor *)self condition];
  if (v7)
  {
    long double v8 = (void *)v7;
    double v9 = [(_SFPBWeatherColor *)self condition];
    unint64_t v10 = [v4 condition];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBWeatherColor *)self location];
  v6 = [v4 location];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v12 = [(_SFPBWeatherColor *)self location];
  if (v12)
  {
    long double v13 = (void *)v12;
    double v14 = [(_SFPBWeatherColor *)self location];
    unint64_t v15 = [v4 location];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBWeatherColor *)self date];
  v6 = [v4 date];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_16:

    goto LABEL_17;
  }
  uint64_t v17 = [(_SFPBWeatherColor *)self date];
  if (v17)
  {
    long double v18 = (void *)v17;
    double v19 = [(_SFPBWeatherColor *)self date];
    unint64_t v20 = [v4 date];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  double cloudCover = self->_cloudCover;
  [v4 cloudCover];
  if (cloudCover == v25)
  {
    double cloudCoverLowAltPct = self->_cloudCoverLowAltPct;
    [v4 cloudCoverLowAltPct];
    if (cloudCoverLowAltPct == v27)
    {
      double cloudCoverMidAltPct = self->_cloudCoverMidAltPct;
      [v4 cloudCoverMidAltPct];
      if (cloudCoverMidAltPct == v29)
      {
        double cloudCoverHighAltPct = self->_cloudCoverHighAltPct;
        [v4 cloudCoverHighAltPct];
        BOOL v22 = cloudCoverHighAltPct == v31;
        goto LABEL_18;
      }
    }
  }
LABEL_17:
  BOOL v22 = 0;
LABEL_18:

  return v22;
}

- (void)writeTo:(id)a3
{
  id v12 = a3;
  id v4 = [(_SFPBWeatherColor *)self condition];
  if (v4) {
    PBDataWriterWriteStringField();
  }

  unint64_t v5 = [(_SFPBWeatherColor *)self location];
  if (v5) {
    PBDataWriterWriteSubmessage();
  }

  v6 = [(_SFPBWeatherColor *)self date];
  if (v6) {
    PBDataWriterWriteSubmessage();
  }

  [(_SFPBWeatherColor *)self cloudCover];
  if (v7 != 0.0) {
    PBDataWriterWriteDoubleField();
  }
  [(_SFPBWeatherColor *)self cloudCoverLowAltPct];
  if (v8 != 0.0) {
    PBDataWriterWriteDoubleField();
  }
  [(_SFPBWeatherColor *)self cloudCoverMidAltPct];
  if (v9 != 0.0) {
    PBDataWriterWriteDoubleField();
  }
  [(_SFPBWeatherColor *)self cloudCoverHighAltPct];
  unint64_t v10 = v12;
  if (v11 != 0.0)
  {
    PBDataWriterWriteDoubleField();
    unint64_t v10 = v12;
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBWeatherColorReadFrom(self, (uint64_t)a3);
}

- (void)setCloudCoverHighAltPct:(double)a3
{
  self->_double cloudCoverHighAltPct = a3;
}

- (void)setCloudCoverMidAltPct:(double)a3
{
  self->_double cloudCoverMidAltPct = a3;
}

- (void)setCloudCoverLowAltPct:(double)a3
{
  self->_double cloudCoverLowAltPct = a3;
}

- (void)setCloudCover:(double)a3
{
  self->_double cloudCover = a3;
}

- (void)setDate:(id)a3
{
}

- (void)setLocation:(id)a3
{
}

- (void)setCondition:(id)a3
{
  self->_condition = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

@end