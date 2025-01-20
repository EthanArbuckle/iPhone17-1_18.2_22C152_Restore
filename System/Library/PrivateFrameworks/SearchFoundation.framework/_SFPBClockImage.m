@interface _SFPBClockImage
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (_SFPBClockImage)initWithDictionary:(id)a3;
- (_SFPBClockImage)initWithFacade:(id)a3;
- (_SFPBClockImage)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (int)hour;
- (int)minute;
- (int)second;
- (unint64_t)hash;
- (void)setHour:(int)a3;
- (void)setMinute:(int)a3;
- (void)setSecond:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBClockImage

- (_SFPBClockImage)initWithFacade:(id)a3
{
  id v4 = a3;
  v5 = [(_SFPBClockImage *)self init];
  if (v5)
  {
    v6 = [v4 hour];

    if (v6)
    {
      v7 = [v4 hour];
      -[_SFPBClockImage setHour:](v5, "setHour:", [v7 intValue]);
    }
    v8 = [v4 minute];

    if (v8)
    {
      v9 = [v4 minute];
      -[_SFPBClockImage setMinute:](v5, "setMinute:", [v9 intValue]);
    }
    v10 = [v4 second];

    if (v10)
    {
      v11 = [v4 second];
      -[_SFPBClockImage setSecond:](v5, "setSecond:", [v11 intValue]);
    }
    v12 = v5;
  }

  return v5;
}

- (int)second
{
  return self->_second;
}

- (int)minute
{
  return self->_minute;
}

- (int)hour
{
  return self->_hour;
}

- (_SFPBClockImage)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_SFPBClockImage;
  v5 = [(_SFPBClockImage *)&v11 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"hour"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBClockImage setHour:](v5, "setHour:", [v6 intValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"minute"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBClockImage setMinute:](v5, "setMinute:", [v7 intValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"second"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBClockImage setSecond:](v5, "setSecond:", [v8 intValue]);
    }
    v9 = v5;
  }
  return v5;
}

- (_SFPBClockImage)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBClockImage *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBClockImage *)self dictionaryRepresentation];
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
  if (self->_hour)
  {
    id v4 = objc_msgSend(NSNumber, "numberWithInt:", -[_SFPBClockImage hour](self, "hour"));
    [v3 setObject:v4 forKeyedSubscript:@"hour"];
  }
  if (self->_minute)
  {
    v5 = objc_msgSend(NSNumber, "numberWithInt:", -[_SFPBClockImage minute](self, "minute"));
    [v3 setObject:v5 forKeyedSubscript:@"minute"];
  }
  if (self->_second)
  {
    v6 = objc_msgSend(NSNumber, "numberWithInt:", -[_SFPBClockImage second](self, "second"));
    [v3 setObject:v6 forKeyedSubscript:@"second"];
  }
  return v3;
}

- (unint64_t)hash
{
  return (2654435761 * self->_minute) ^ (2654435761 * self->_hour) ^ (2654435761 * self->_second);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (int hour = self->_hour, hour == [v4 hour])
    && (int minute = self->_minute, minute == [v4 minute]))
  {
    int second = self->_second;
    BOOL v8 = second == [v4 second];
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (void)writeTo:(id)a3
{
  id v6 = a3;
  if ([(_SFPBClockImage *)self hour]) {
    PBDataWriterWriteInt32Field();
  }
  if ([(_SFPBClockImage *)self minute]) {
    PBDataWriterWriteInt32Field();
  }
  int v4 = [(_SFPBClockImage *)self second];
  v5 = v6;
  if (v4)
  {
    PBDataWriterWriteInt32Field();
    v5 = v6;
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBClockImageReadFrom(self, (uint64_t)a3);
}

- (void)setSecond:(int)a3
{
  self->_int second = a3;
}

- (void)setMinute:(int)a3
{
  self->_int minute = a3;
}

- (void)setHour:(int)a3
{
  self->_int hour = a3;
}

@end