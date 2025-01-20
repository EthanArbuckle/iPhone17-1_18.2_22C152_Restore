@interface _SFPBDate
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (_SFPBDate)initWithDictionary:(id)a3;
- (_SFPBDate)initWithJSON:(id)a3;
- (_SFPBDate)initWithNSDate:(id)a3;
- (double)secondsSince1970;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)setSecondsSince1970:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBDate

- (_SFPBDate)initWithNSDate:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_SFPBDate;
  v5 = [(_SFPBDate *)&v8 init];
  if (v5)
  {
    [v4 timeIntervalSince1970];
    -[_SFPBDate setSecondsSince1970:](v5, "setSecondsSince1970:");
    v6 = v5;
  }

  return v5;
}

- (double)secondsSince1970
{
  return self->_secondsSince1970;
}

- (_SFPBDate)initWithDictionary:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_SFPBDate;
  v5 = [(_SFPBDate *)&v9 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"secondsSince1970"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v6 doubleValue];
      -[_SFPBDate setSecondsSince1970:](v5, "setSecondsSince1970:");
    }
    v7 = v5;
  }
  return v5;
}

- (_SFPBDate)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBDate *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBDate *)self dictionaryRepresentation];
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
  if (self->_secondsSince1970 != 0.0)
  {
    id v4 = NSNumber;
    [(_SFPBDate *)self secondsSince1970];
    v5 = objc_msgSend(v4, "numberWithDouble:");
    [v3 setObject:v5 forKeyedSubscript:@"secondsSince1970"];
  }
  return v3;
}

- (unint64_t)hash
{
  double secondsSince1970 = self->_secondsSince1970;
  if (secondsSince1970 == 0.0) {
    return 0;
  }
  double v3 = -secondsSince1970;
  if (secondsSince1970 >= 0.0) {
    double v3 = self->_secondsSince1970;
  }
  long double v4 = floor(v3 + 0.5);
  double v5 = (v3 - v4) * 1.84467441e19;
  unint64_t result = 2654435761u * (unint64_t)fmod(v4, 1.84467441e19);
  if (v5 >= 0.0)
  {
    if (v5 > 0.0) {
      result += (unint64_t)v5;
    }
  }
  else
  {
    result -= (unint64_t)fabs(v5);
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    double secondsSince1970 = self->_secondsSince1970;
    [v4 secondsSince1970];
    BOOL v7 = secondsSince1970 == v6;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  [(_SFPBDate *)self secondsSince1970];
  if (v4 != 0.0) {
    PBDataWriterWriteDoubleField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBDateReadFrom(self, (uint64_t)a3);
}

- (void)setSecondsSince1970:(double)a3
{
  self->_double secondsSince1970 = a3;
}

@end