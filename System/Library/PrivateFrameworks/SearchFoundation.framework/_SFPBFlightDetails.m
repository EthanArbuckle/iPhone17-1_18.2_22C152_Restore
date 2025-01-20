@interface _SFPBFlightDetails
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (_SFPBFlightDetails)initWithDictionary:(id)a3;
- (_SFPBFlightDetails)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBFlightDetails

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (_SFPBFlightDetails)initWithDictionary:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_SFPBFlightDetails;
  v5 = [(_SFPBFlightDetails *)&v9 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"timestamp"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBFlightDetails setTimestamp:](v5, "setTimestamp:", [v6 unsignedLongLongValue]);
    }
    v7 = v5;
  }
  return v5;
}

- (_SFPBFlightDetails)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBFlightDetails *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBFlightDetails *)self dictionaryRepresentation];
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
  if (self->_timestamp)
  {
    id v4 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[_SFPBFlightDetails timestamp](self, "timestamp"));
    [v3 setObject:v4 forKeyedSubscript:@"timestamp"];
  }
  return v3;
}

- (unint64_t)hash
{
  return 2654435761u * self->_timestamp;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    unint64_t timestamp = self->_timestamp;
    BOOL v6 = timestamp == [v4 timestamp];
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
  if ([(_SFPBFlightDetails *)self timestamp]) {
    PBDataWriterWriteUint64Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBFlightDetailsReadFrom(self, (uint64_t)a3);
}

- (void)setTimestamp:(unint64_t)a3
{
  self->_unint64_t timestamp = a3;
}

@end