@interface _SFPBTopic
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)identifier;
- (NSString)query;
- (_SFPBFlightDetails)flight;
- (_SFPBSportsDetail)sports;
- (_SFPBTopic)initWithDictionary:(id)a3;
- (_SFPBTopic)initWithJSON:(id)a3;
- (_SFPBTopic)initWithSFTopic:(id)a3;
- (_SFPBWeatherDetails)weather;
- (id)dictionaryRepresentation;
- (int)type;
- (unint64_t)hash;
- (unint64_t)whichDetail;
- (void)setFlight:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setQuery:(id)a3;
- (void)setSports:(id)a3;
- (void)setType:(int)a3;
- (void)setWeather:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBTopic

- (_SFPBTopic)initWithSFTopic:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)_SFPBTopic;
  v5 = [(_SFPBTopic *)&v19 init];
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = v4;
      -[_SFPBTopic setType:](v5, "setType:", [v6 queryType]);
      v7 = [v6 identifier];
      [(_SFPBTopic *)v5 setIdentifier:v7];

      v8 = [v6 query];

      [(_SFPBTopic *)v5 setQuery:v8];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v9 = v4;
      v10 = [_SFPBLatLng alloc];
      v11 = [v9 location];

      v12 = [(_SFPBLatLng *)v10 initWithFacade:v11];
      v13 = [(_SFPBTopic *)v5 weather];
      [v13 setLocation:v12];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v14 = [v4 date];
      [v14 timeIntervalSince1970];
      unint64_t v16 = (unint64_t)v15;
      v17 = [(_SFPBTopic *)v5 flight];
      [v17 setTimestamp:v16];
    }
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sports, 0);
  objc_storeStrong((id *)&self->_weather, 0);
  objc_storeStrong((id *)&self->_flight, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_query, 0);
}

- (unint64_t)whichDetail
{
  return self->_whichDetail;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (int)type
{
  return self->_type;
}

- (NSString)query
{
  return self->_query;
}

- (_SFPBTopic)initWithDictionary:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)_SFPBTopic;
  v5 = [(_SFPBTopic *)&v19 init];
  if (v5)
  {
    id v6 = [v4 objectForKeyedSubscript:@"query"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(_SFPBTopic *)v5 setQuery:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"type"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBTopic setType:](v5, "setType:", [v8 intValue]);
    }
    id v9 = [v4 objectForKeyedSubscript:@"identifier"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v10 = (void *)[v9 copy];
      [(_SFPBTopic *)v5 setIdentifier:v10];
    }
    v11 = [v4 objectForKeyedSubscript:@"flight"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v12 = [[_SFPBFlightDetails alloc] initWithDictionary:v11];
      [(_SFPBTopic *)v5 setFlight:v12];
    }
    v13 = [v4 objectForKeyedSubscript:@"weather"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v14 = [[_SFPBWeatherDetails alloc] initWithDictionary:v13];
      [(_SFPBTopic *)v5 setWeather:v14];
    }
    double v15 = [v4 objectForKeyedSubscript:@"sports"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unint64_t v16 = [[_SFPBSportsDetail alloc] initWithDictionary:v15];
      [(_SFPBTopic *)v5 setSports:v16];
    }
    v17 = v5;
  }
  return v5;
}

- (_SFPBTopic)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBTopic *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBTopic *)self dictionaryRepresentation];
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
  if (self->_flight)
  {
    id v4 = [(_SFPBTopic *)self flight];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"flight"];
    }
    else
    {
      id v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"flight"];
    }
  }
  if (self->_identifier)
  {
    uint64_t v7 = [(_SFPBTopic *)self identifier];
    v8 = (void *)[v7 copy];
    [v3 setObject:v8 forKeyedSubscript:@"identifier"];
  }
  if (self->_query)
  {
    id v9 = [(_SFPBTopic *)self query];
    v10 = (void *)[v9 copy];
    [v3 setObject:v10 forKeyedSubscript:@"query"];
  }
  if (self->_sports)
  {
    v11 = [(_SFPBTopic *)self sports];
    v12 = [v11 dictionaryRepresentation];
    if (v12)
    {
      [v3 setObject:v12 forKeyedSubscript:@"sports"];
    }
    else
    {
      v13 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v13 forKeyedSubscript:@"sports"];
    }
  }
  if (self->_type)
  {
    uint64_t v14 = [(_SFPBTopic *)self type];
    if (v14 >= 9)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v14);
      double v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      double v15 = off_1E5A2F010[v14];
    }
    [v3 setObject:v15 forKeyedSubscript:@"type"];
  }
  if (self->_weather)
  {
    unint64_t v16 = [(_SFPBTopic *)self weather];
    v17 = [v16 dictionaryRepresentation];
    if (v17)
    {
      [v3 setObject:v17 forKeyedSubscript:@"weather"];
    }
    else
    {
      v18 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v18 forKeyedSubscript:@"weather"];
    }
  }
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_query hash];
  uint64_t v4 = 2654435761 * self->_type;
  NSUInteger v5 = v3 ^ [(NSString *)self->_identifier hash];
  unint64_t v6 = v5 ^ [(_SFPBFlightDetails *)self->_flight hash];
  unint64_t v7 = v6 ^ [(_SFPBWeatherDetails *)self->_weather hash];
  return v4 ^ v7 ^ [(_SFPBSportsDetail *)self->_sports hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_28;
  }
  NSUInteger v5 = [(_SFPBTopic *)self query];
  unint64_t v6 = [v4 query];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_27;
  }
  uint64_t v7 = [(_SFPBTopic *)self query];
  if (v7)
  {
    v8 = (void *)v7;
    id v9 = [(_SFPBTopic *)self query];
    v10 = [v4 query];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_28;
    }
  }
  else
  {
  }
  int type = self->_type;
  if (type != [v4 type]) {
    goto LABEL_28;
  }
  NSUInteger v5 = [(_SFPBTopic *)self identifier];
  unint64_t v6 = [v4 identifier];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_27;
  }
  uint64_t v13 = [(_SFPBTopic *)self identifier];
  if (v13)
  {
    uint64_t v14 = (void *)v13;
    double v15 = [(_SFPBTopic *)self identifier];
    unint64_t v16 = [v4 identifier];
    int v17 = [v15 isEqual:v16];

    if (!v17) {
      goto LABEL_28;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_SFPBTopic *)self flight];
  unint64_t v6 = [v4 flight];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_27;
  }
  uint64_t v18 = [(_SFPBTopic *)self flight];
  if (v18)
  {
    objc_super v19 = (void *)v18;
    v20 = [(_SFPBTopic *)self flight];
    v21 = [v4 flight];
    int v22 = [v20 isEqual:v21];

    if (!v22) {
      goto LABEL_28;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_SFPBTopic *)self weather];
  unint64_t v6 = [v4 weather];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_27;
  }
  uint64_t v23 = [(_SFPBTopic *)self weather];
  if (v23)
  {
    v24 = (void *)v23;
    v25 = [(_SFPBTopic *)self weather];
    v26 = [v4 weather];
    int v27 = [v25 isEqual:v26];

    if (!v27) {
      goto LABEL_28;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_SFPBTopic *)self sports];
  unint64_t v6 = [v4 sports];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_27:

    goto LABEL_28;
  }
  uint64_t v28 = [(_SFPBTopic *)self sports];
  if (!v28)
  {

LABEL_31:
    BOOL v33 = 1;
    goto LABEL_29;
  }
  v29 = (void *)v28;
  v30 = [(_SFPBTopic *)self sports];
  v31 = [v4 sports];
  char v32 = [v30 isEqual:v31];

  if (v32) {
    goto LABEL_31;
  }
LABEL_28:
  BOOL v33 = 0;
LABEL_29:

  return v33;
}

- (void)writeTo:(id)a3
{
  id v9 = a3;
  id v4 = [(_SFPBTopic *)self query];
  if (v4) {
    PBDataWriterWriteStringField();
  }

  if ([(_SFPBTopic *)self type]) {
    PBDataWriterWriteInt32Field();
  }
  NSUInteger v5 = [(_SFPBTopic *)self identifier];
  if (v5) {
    PBDataWriterWriteStringField();
  }

  unint64_t v6 = [(_SFPBTopic *)self flight];
  if (v6) {
    PBDataWriterWriteSubmessage();
  }

  uint64_t v7 = [(_SFPBTopic *)self weather];
  if (v7) {
    PBDataWriterWriteSubmessage();
  }

  v8 = [(_SFPBTopic *)self sports];
  if (v8) {
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBTopicReadFrom(self, (uint64_t)a3);
}

- (_SFPBSportsDetail)sports
{
  if (self->_whichDetail == 3) {
    v2 = self->_sports;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setSports:(id)a3
{
  id v4 = (_SFPBSportsDetail *)a3;
  flight = self->_flight;
  self->_flight = 0;

  weather = self->_weather;
  self->_weather = 0;

  unint64_t v7 = 3;
  if (!v4) {
    unint64_t v7 = 0;
  }
  self->_whichDetail = v7;
  sports = self->_sports;
  self->_sports = v4;
}

- (_SFPBWeatherDetails)weather
{
  if (self->_whichDetail == 2) {
    v2 = self->_weather;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setWeather:(id)a3
{
  id v4 = (_SFPBWeatherDetails *)a3;
  flight = self->_flight;
  self->_flight = 0;

  sports = self->_sports;
  self->_sports = 0;

  self->_whichDetail = 2 * (v4 != 0);
  weather = self->_weather;
  self->_weather = v4;
}

- (_SFPBFlightDetails)flight
{
  if (self->_whichDetail == 1) {
    v2 = self->_flight;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setFlight:(id)a3
{
  id v4 = (_SFPBFlightDetails *)a3;
  weather = self->_weather;
  self->_weather = 0;

  sports = self->_sports;
  self->_sports = 0;

  self->_whichDetail = v4 != 0;
  flight = self->_flight;
  self->_flight = v4;
}

- (void)setIdentifier:(id)a3
{
  self->_identifier = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setType:(int)a3
{
  self->_int type = a3;
}

- (void)setQuery:(id)a3
{
  self->_query = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

@end