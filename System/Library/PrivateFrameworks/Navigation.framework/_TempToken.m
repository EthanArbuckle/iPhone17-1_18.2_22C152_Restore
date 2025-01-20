@interface _TempToken
- (BOOL)shouldScaleUnits;
- (GEOGenericCombinations)genericCombinations;
- (GEOServerFormatTokenCountdownValue)countdownValue;
- (GEOServerFormatTokenManeuverValue)maneuverValue;
- (GEOServerFormatTokenNumberData)numberData;
- (GEOServerFormatTokenPriceValue)priceValue;
- (GEOServerFormatTokenUrlValue)urlValue;
- (GEOTransitArtworkDataSource)artworkValue;
- (NSArray)timeStampValues;
- (NSArray)value3s;
- (NSString)accessibilityLabel;
- (NSString)stringValue;
- (NSString)token;
- (_TempToken)initWithCoder:(id)a3;
- (_TempToken)initWithToken:(id)a3;
- (float)percentageValue;
- (int)waypointIndex;
- (int64_t)type;
- (unsigned)value1;
- (unsigned)value2;
- (void)encodeWithCoder:(id)a3;
- (void)setArtworkValue:(id)a3;
- (void)setCountdownValue:(id)a3;
- (void)setGenericCombinations:(id)a3;
- (void)setManeuverValue:(id)a3;
- (void)setNumberData:(id)a3;
- (void)setPercentageValue:(float)a3;
- (void)setPriceValue:(id)a3;
- (void)setStringValue:(id)a3;
- (void)setTimeStampValues:(id)a3;
- (void)setToken:(id)a3;
- (void)setType:(int64_t)a3;
- (void)setUrlValue:(id)a3;
- (void)setValue1:(unsigned int)a3;
- (void)setValue2:(unsigned int)a3;
- (void)setValue3s:(id)a3;
- (void)setWaypointIndex:(int)a3;
@end

@implementation _TempToken

- (_TempToken)initWithCoder:(id)a3
{
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)_TempToken;
  v5 = [(_TempToken *)&v26 init];
  if (v5)
  {
    v5->_type = [v4 decodeIntegerForKey:@"type"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"token"];
    token = v5->_token;
    v5->_token = (NSString *)v6;

    v5->_value1 = [v4 decodeIntegerForKey:@"value1"];
    v5->_value2 = [v4 decodeIntegerForKey:@"value2"];
    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"value3s"];
    uint64_t v9 = [v8 mutableCopy];
    value3s = v5->_value3s;
    v5->_value3s = (NSArray *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"stringValue"];
    stringValue = v5->_stringValue;
    v5->_stringValue = (NSString *)v11;

    [v4 decodeFloatForKey:@"percentageValue"];
    v5->_percentageValue = v13;
    v5->_shouldScaleUnits = [v4 decodeBoolForKey:@"shouldScaleUnits"];
    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"genericCombinations"];
    genericCombinations = v5->_genericCombinations;
    v5->_genericCombinations = (GEOGenericCombinations *)v14;

    v5->_waypointIndex = [v4 decodeInt32ForKey:@"waypointIndex"];
    v16 = [v4 decodeObjectForKey:@"priceValue"];
    if ([v16 conformsToProtocol:&unk_1F0E73728]) {
      objc_storeStrong((id *)&v5->_priceValue, v16);
    }
    v17 = [v4 decodeObjectForKey:@"artworkValue"];
    if ([v17 conformsToProtocol:&unk_1F0E73A30]) {
      objc_storeStrong((id *)&v5->_artworkValue, v17);
    }
    v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"timestampValues"];
    uint64_t v19 = [v18 mutableCopy];
    timeStampValues = v5->_timeStampValues;
    v5->_timeStampValues = (NSArray *)v19;

    v21 = [v4 decodeObjectForKey:@"countdownValue"];
    if ([v21 conformsToProtocol:&unk_1F0E73BE8]) {
      objc_storeStrong((id *)&v5->_countdownValue, v21);
    }
    v22 = [v4 decodeObjectForKey:@"urlValue"];
    if ([v22 conformsToProtocol:&unk_1F0E73C48]) {
      objc_storeStrong((id *)&v5->_urlValue, v22);
    }
    v23 = [v4 decodeObjectForKey:@"maneuverValue"];
    if ([v23 conformsToProtocol:&unk_1F0E73C48]) {
      objc_storeStrong((id *)&v5->_maneuverValue, v23);
    }
    v24 = [v4 decodeObjectForKey:@"numberData"];
    if ([v24 conformsToProtocol:&unk_1F0E73CA8]) {
      objc_storeStrong((id *)&v5->_numberData, v24);
    }
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t type = self->_type;
  id v6 = a3;
  [v6 encodeInteger:type forKey:@"type"];
  [v6 encodeObject:self->_token forKey:@"token"];
  [v6 encodeInteger:self->_value1 forKey:@"value1"];
  [v6 encodeInteger:self->_value2 forKey:@"value2"];
  [v6 encodeObject:self->_value3s forKey:@"value3s"];
  [v6 encodeObject:self->_stringValue forKey:@"stringValue"];
  *(float *)&double v5 = self->_percentageValue;
  [v6 encodeFloat:@"percentageValue" forKey:v5];
  [v6 encodeBool:self->_shouldScaleUnits forKey:@"shouldScaleUnits"];
  [v6 encodeObject:self->_genericCombinations forKey:@"genericCombinations"];
  [v6 encodeInt32:self->_waypointIndex forKey:@"waypointIndex"];
  [v6 encodeObject:self->_priceValue forKey:@"priceValue"];
  [v6 encodeObject:self->_artworkValue forKey:@"artworkValue"];
  [v6 encodeObject:self->_timeStampValues forKey:@"timeStampValues"];
  [v6 encodeObject:self->_countdownValue forKey:@"countdownValue"];
  [v6 encodeObject:self->_urlValue forKey:@"urlValue"];
  [v6 encodeObject:self->_maneuverValue forKey:@"maneuverValue"];
  [v6 encodeObject:self->_numberData forKey:@"numberData"];
}

- (_TempToken)initWithToken:(id)a3
{
  id v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)_TempToken;
  double v5 = [(_TempToken *)&v30 init];
  if (v5)
  {
    v5->_int64_t type = [v4 type];
    uint64_t v6 = [v4 token];
    token = v5->_token;
    v5->_token = (NSString *)v6;

    v5->_value1 = [v4 value1];
    v5->_value2 = [v4 value2];
    uint64_t v8 = [v4 value3s];
    value3s = v5->_value3s;
    v5->_value3s = (NSArray *)v8;

    uint64_t v10 = [v4 stringValue];
    stringValue = v5->_stringValue;
    v5->_stringValue = (NSString *)v10;

    [v4 percentageValue];
    v5->_percentageValue = v12;
    v5->_shouldScaleUnits = [v4 shouldScaleUnits];
    uint64_t v13 = [v4 genericCombinations];
    genericCombinations = v5->_genericCombinations;
    v5->_genericCombinations = (GEOGenericCombinations *)v13;

    v5->_waypointIndex = [v4 waypointIndex];
    uint64_t v15 = [v4 priceValue];
    priceValue = v5->_priceValue;
    v5->_priceValue = (GEOServerFormatTokenPriceValue *)v15;

    uint64_t v17 = [v4 artworkValue];
    artworkValue = v5->_artworkValue;
    v5->_artworkValue = (GEOTransitArtworkDataSource *)v17;

    uint64_t v19 = [v4 timeStampValues];
    timeStampValues = v5->_timeStampValues;
    v5->_timeStampValues = (NSArray *)v19;

    uint64_t v21 = [v4 countdownValue];
    countdownValue = v5->_countdownValue;
    v5->_countdownValue = (GEOServerFormatTokenCountdownValue *)v21;

    uint64_t v23 = [v4 urlValue];
    urlValue = v5->_urlValue;
    v5->_urlValue = (GEOServerFormatTokenUrlValue *)v23;

    uint64_t v25 = [v4 maneuverValue];
    maneuverValue = v5->_maneuverValue;
    v5->_maneuverValue = (GEOServerFormatTokenManeuverValue *)v25;

    uint64_t v27 = [v4 numberData];
    numberData = v5->_numberData;
    v5->_numberData = (GEOServerFormatTokenNumberData *)v27;
  }
  return v5;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_int64_t type = a3;
}

- (NSString)token
{
  return self->_token;
}

- (void)setToken:(id)a3
{
}

- (unsigned)value1
{
  return self->_value1;
}

- (void)setValue1:(unsigned int)a3
{
  self->_value1 = a3;
}

- (unsigned)value2
{
  return self->_value2;
}

- (void)setValue2:(unsigned int)a3
{
  self->_value2 = a3;
}

- (NSArray)value3s
{
  return self->_value3s;
}

- (void)setValue3s:(id)a3
{
}

- (NSString)stringValue
{
  return self->_stringValue;
}

- (void)setStringValue:(id)a3
{
}

- (float)percentageValue
{
  return self->_percentageValue;
}

- (void)setPercentageValue:(float)a3
{
  self->_percentageValue = a3;
}

- (BOOL)shouldScaleUnits
{
  return self->_shouldScaleUnits;
}

- (NSString)accessibilityLabel
{
  return self->_accessibilityLabel;
}

- (GEOServerFormatTokenPriceValue)priceValue
{
  return self->_priceValue;
}

- (void)setPriceValue:(id)a3
{
}

- (GEOTransitArtworkDataSource)artworkValue
{
  return self->_artworkValue;
}

- (void)setArtworkValue:(id)a3
{
}

- (NSArray)timeStampValues
{
  return self->_timeStampValues;
}

- (void)setTimeStampValues:(id)a3
{
}

- (GEOServerFormatTokenCountdownValue)countdownValue
{
  return self->_countdownValue;
}

- (void)setCountdownValue:(id)a3
{
}

- (GEOServerFormatTokenUrlValue)urlValue
{
  return self->_urlValue;
}

- (void)setUrlValue:(id)a3
{
}

- (GEOServerFormatTokenManeuverValue)maneuverValue
{
  return self->_maneuverValue;
}

- (void)setManeuverValue:(id)a3
{
}

- (GEOServerFormatTokenNumberData)numberData
{
  return self->_numberData;
}

- (void)setNumberData:(id)a3
{
}

- (GEOGenericCombinations)genericCombinations
{
  return self->_genericCombinations;
}

- (void)setGenericCombinations:(id)a3
{
}

- (int)waypointIndex
{
  return self->_waypointIndex;
}

- (void)setWaypointIndex:(int)a3
{
  self->_waypointIndex = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_genericCombinations, 0);
  objc_storeStrong((id *)&self->_numberData, 0);
  objc_storeStrong((id *)&self->_maneuverValue, 0);
  objc_storeStrong((id *)&self->_urlValue, 0);
  objc_storeStrong((id *)&self->_countdownValue, 0);
  objc_storeStrong((id *)&self->_timeStampValues, 0);
  objc_storeStrong((id *)&self->_artworkValue, 0);
  objc_storeStrong((id *)&self->_priceValue, 0);
  objc_storeStrong((id *)&self->_accessibilityLabel, 0);
  objc_storeStrong((id *)&self->_stringValue, 0);
  objc_storeStrong((id *)&self->_value3s, 0);
  objc_storeStrong((id *)&self->_token, 0);
}

@end