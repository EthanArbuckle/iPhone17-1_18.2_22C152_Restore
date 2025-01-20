@interface _SFPBQueryUnderstandingParse
- (BOOL)hasActionTokens;
- (BOOL)hasCaptureDeviceTokens;
- (BOOL)hasEventTokens;
- (BOOL)hasFavoritedTokens;
- (BOOL)hasGenericLocationTokens;
- (BOOL)hasLocationTokens;
- (BOOL)hasMediaTypeTokens;
- (BOOL)hasNounTokens;
- (BOOL)hasPersonSenderTokens;
- (BOOL)hasPersonTokens;
- (BOOL)hasSortCriteriaTokens;
- (BOOL)hasSourceAppTokens;
- (BOOL)hasTimeTokens;
- (BOOL)hasUnspecifiedTokens;
- (BOOL)hasVisualQualityTokens;
- (BOOL)isBlocklistedQuery;
- (BOOL)isEqual:(id)a3;
- (BOOL)isUnsafeQuery;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (_SFPBQueryUnderstandingParse)initWithDictionary:(id)a3;
- (_SFPBQueryUnderstandingParse)initWithFacade:(id)a3;
- (_SFPBQueryUnderstandingParse)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (int)queryIntentType;
- (int)spotlightQueryIntent;
- (unint64_t)hash;
- (void)setHasActionTokens:(BOOL)a3;
- (void)setHasCaptureDeviceTokens:(BOOL)a3;
- (void)setHasEventTokens:(BOOL)a3;
- (void)setHasFavoritedTokens:(BOOL)a3;
- (void)setHasGenericLocationTokens:(BOOL)a3;
- (void)setHasLocationTokens:(BOOL)a3;
- (void)setHasMediaTypeTokens:(BOOL)a3;
- (void)setHasNounTokens:(BOOL)a3;
- (void)setHasPersonSenderTokens:(BOOL)a3;
- (void)setHasPersonTokens:(BOOL)a3;
- (void)setHasSortCriteriaTokens:(BOOL)a3;
- (void)setHasSourceAppTokens:(BOOL)a3;
- (void)setHasTimeTokens:(BOOL)a3;
- (void)setHasUnspecifiedTokens:(BOOL)a3;
- (void)setHasVisualQualityTokens:(BOOL)a3;
- (void)setIsBlocklistedQuery:(BOOL)a3;
- (void)setIsUnsafeQuery:(BOOL)a3;
- (void)setQueryIntentType:(int)a3;
- (void)setSpotlightQueryIntent:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBQueryUnderstandingParse

- (_SFPBQueryUnderstandingParse)initWithFacade:(id)a3
{
  id v4 = a3;
  v5 = [(_SFPBQueryUnderstandingParse *)self init];
  if (v5)
  {
    if ([v4 hasQueryIntentType]) {
      -[_SFPBQueryUnderstandingParse setQueryIntentType:](v5, "setQueryIntentType:", [v4 queryIntentType]);
    }
    if ([v4 hasHasUnspecifiedTokens]) {
      -[_SFPBQueryUnderstandingParse setHasUnspecifiedTokens:](v5, "setHasUnspecifiedTokens:", [v4 hasUnspecifiedTokens]);
    }
    if ([v4 hasHasSortCriteriaTokens]) {
      -[_SFPBQueryUnderstandingParse setHasSortCriteriaTokens:](v5, "setHasSortCriteriaTokens:", [v4 hasSortCriteriaTokens]);
    }
    if ([v4 hasHasLocationTokens]) {
      -[_SFPBQueryUnderstandingParse setHasLocationTokens:](v5, "setHasLocationTokens:", [v4 hasLocationTokens]);
    }
    if ([v4 hasHasActionTokens]) {
      -[_SFPBQueryUnderstandingParse setHasActionTokens:](v5, "setHasActionTokens:", [v4 hasActionTokens]);
    }
    if ([v4 hasHasMediaTypeTokens]) {
      -[_SFPBQueryUnderstandingParse setHasMediaTypeTokens:](v5, "setHasMediaTypeTokens:", [v4 hasMediaTypeTokens]);
    }
    if ([v4 hasHasVisualQualityTokens]) {
      -[_SFPBQueryUnderstandingParse setHasVisualQualityTokens:](v5, "setHasVisualQualityTokens:", [v4 hasVisualQualityTokens]);
    }
    if ([v4 hasHasNounTokens]) {
      -[_SFPBQueryUnderstandingParse setHasNounTokens:](v5, "setHasNounTokens:", [v4 hasNounTokens]);
    }
    if ([v4 hasHasTimeTokens]) {
      -[_SFPBQueryUnderstandingParse setHasTimeTokens:](v5, "setHasTimeTokens:", [v4 hasTimeTokens]);
    }
    if ([v4 hasHasEventTokens]) {
      -[_SFPBQueryUnderstandingParse setHasEventTokens:](v5, "setHasEventTokens:", [v4 hasEventTokens]);
    }
    if ([v4 hasHasGenericLocationTokens]) {
      -[_SFPBQueryUnderstandingParse setHasGenericLocationTokens:](v5, "setHasGenericLocationTokens:", [v4 hasGenericLocationTokens]);
    }
    if ([v4 hasHasCaptureDeviceTokens]) {
      -[_SFPBQueryUnderstandingParse setHasCaptureDeviceTokens:](v5, "setHasCaptureDeviceTokens:", [v4 hasCaptureDeviceTokens]);
    }
    if ([v4 hasHasFavoritedTokens]) {
      -[_SFPBQueryUnderstandingParse setHasFavoritedTokens:](v5, "setHasFavoritedTokens:", [v4 hasFavoritedTokens]);
    }
    if ([v4 hasHasSourceAppTokens]) {
      -[_SFPBQueryUnderstandingParse setHasSourceAppTokens:](v5, "setHasSourceAppTokens:", [v4 hasSourceAppTokens]);
    }
    if ([v4 hasHasPersonTokens]) {
      -[_SFPBQueryUnderstandingParse setHasPersonTokens:](v5, "setHasPersonTokens:", [v4 hasPersonTokens]);
    }
    if ([v4 hasHasPersonSenderTokens]) {
      -[_SFPBQueryUnderstandingParse setHasPersonSenderTokens:](v5, "setHasPersonSenderTokens:", [v4 hasPersonSenderTokens]);
    }
    if ([v4 hasSpotlightQueryIntent]) {
      -[_SFPBQueryUnderstandingParse setSpotlightQueryIntent:](v5, "setSpotlightQueryIntent:", [v4 spotlightQueryIntent]);
    }
    if ([v4 hasIsUnsafeQuery]) {
      -[_SFPBQueryUnderstandingParse setIsUnsafeQuery:](v5, "setIsUnsafeQuery:", [v4 isUnsafeQuery]);
    }
    if ([v4 hasIsBlocklistedQuery]) {
      -[_SFPBQueryUnderstandingParse setIsBlocklistedQuery:](v5, "setIsBlocklistedQuery:", [v4 isBlocklistedQuery]);
    }
    v6 = v5;
  }

  return v5;
}

- (BOOL)isBlocklistedQuery
{
  return self->_isBlocklistedQuery;
}

- (BOOL)isUnsafeQuery
{
  return self->_isUnsafeQuery;
}

- (int)spotlightQueryIntent
{
  return self->_spotlightQueryIntent;
}

- (BOOL)hasPersonSenderTokens
{
  return self->_hasPersonSenderTokens;
}

- (BOOL)hasPersonTokens
{
  return self->_hasPersonTokens;
}

- (BOOL)hasSourceAppTokens
{
  return self->_hasSourceAppTokens;
}

- (BOOL)hasFavoritedTokens
{
  return self->_hasFavoritedTokens;
}

- (BOOL)hasCaptureDeviceTokens
{
  return self->_hasCaptureDeviceTokens;
}

- (BOOL)hasGenericLocationTokens
{
  return self->_hasGenericLocationTokens;
}

- (BOOL)hasEventTokens
{
  return self->_hasEventTokens;
}

- (BOOL)hasTimeTokens
{
  return self->_hasTimeTokens;
}

- (BOOL)hasNounTokens
{
  return self->_hasNounTokens;
}

- (BOOL)hasVisualQualityTokens
{
  return self->_hasVisualQualityTokens;
}

- (BOOL)hasMediaTypeTokens
{
  return self->_hasMediaTypeTokens;
}

- (BOOL)hasActionTokens
{
  return self->_hasActionTokens;
}

- (BOOL)hasLocationTokens
{
  return self->_hasLocationTokens;
}

- (BOOL)hasSortCriteriaTokens
{
  return self->_hasSortCriteriaTokens;
}

- (BOOL)hasUnspecifiedTokens
{
  return self->_hasUnspecifiedTokens;
}

- (int)queryIntentType
{
  return self->_queryIntentType;
}

- (_SFPBQueryUnderstandingParse)initWithDictionary:(id)a3
{
  id v4 = a3;
  v44.receiver = self;
  v44.super_class = (Class)_SFPBQueryUnderstandingParse;
  v5 = [(_SFPBQueryUnderstandingParse *)&v44 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"queryIntentType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBQueryUnderstandingParse setQueryIntentType:](v5, "setQueryIntentType:", [v6 intValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"hasUnspecifiedTokens"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBQueryUnderstandingParse setHasUnspecifiedTokens:](v5, "setHasUnspecifiedTokens:", [v7 BOOLValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"hasSortCriteriaTokens"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBQueryUnderstandingParse setHasSortCriteriaTokens:](v5, "setHasSortCriteriaTokens:", [v8 BOOLValue]);
    }
    v33 = v8;
    v9 = [v4 objectForKeyedSubscript:@"hasLocationTokens"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBQueryUnderstandingParse setHasLocationTokens:](v5, "setHasLocationTokens:", [v9 BOOLValue]);
    }
    v37 = v9;
    v10 = [v4 objectForKeyedSubscript:@"hasActionTokens"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBQueryUnderstandingParse setHasActionTokens:](v5, "setHasActionTokens:", [v10 BOOLValue]);
    }
    v11 = v7;
    v12 = [v4 objectForKeyedSubscript:@"hasMediaTypeTokens"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBQueryUnderstandingParse setHasMediaTypeTokens:](v5, "setHasMediaTypeTokens:", [v12 BOOLValue]);
    }
    v13 = v6;
    v14 = [v4 objectForKeyedSubscript:@"hasVisualQualityTokens"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBQueryUnderstandingParse setHasVisualQualityTokens:](v5, "setHasVisualQualityTokens:", [v14 BOOLValue]);
    }
    v15 = [v4 objectForKeyedSubscript:@"hasNounTokens"];
    objc_opt_class();
    v43 = v15;
    if (objc_opt_isKindOfClass()) {
      -[_SFPBQueryUnderstandingParse setHasNounTokens:](v5, "setHasNounTokens:", [v15 BOOLValue]);
    }
    uint64_t v16 = [v4 objectForKeyedSubscript:@"hasTimeTokens"];
    objc_opt_class();
    v42 = (void *)v16;
    v17 = v13;
    if (objc_opt_isKindOfClass()) {
      -[_SFPBQueryUnderstandingParse setHasTimeTokens:](v5, "setHasTimeTokens:", [v42 BOOLValue]);
    }
    uint64_t v18 = [v4 objectForKeyedSubscript:@"hasEventTokens"];
    objc_opt_class();
    v41 = (void *)v18;
    v19 = v11;
    if (objc_opt_isKindOfClass()) {
      -[_SFPBQueryUnderstandingParse setHasEventTokens:](v5, "setHasEventTokens:", [v41 BOOLValue]);
    }
    v20 = [v4 objectForKeyedSubscript:@"hasGenericLocationTokens"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBQueryUnderstandingParse setHasGenericLocationTokens:](v5, "setHasGenericLocationTokens:", [v20 BOOLValue]);
    }
    v21 = [v4 objectForKeyedSubscript:@"hasCaptureDeviceTokens"];
    objc_opt_class();
    v40 = v21;
    if (objc_opt_isKindOfClass()) {
      -[_SFPBQueryUnderstandingParse setHasCaptureDeviceTokens:](v5, "setHasCaptureDeviceTokens:", [v21 BOOLValue]);
    }
    v36 = v10;
    v22 = [v4 objectForKeyedSubscript:@"hasFavoritedTokens"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBQueryUnderstandingParse setHasFavoritedTokens:](v5, "setHasFavoritedTokens:", [v22 BOOLValue]);
    }
    v35 = v12;
    v23 = [v4 objectForKeyedSubscript:@"hasSourceAppTokens"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBQueryUnderstandingParse setHasSourceAppTokens:](v5, "setHasSourceAppTokens:", [v23 BOOLValue]);
    }
    v34 = v14;
    v24 = [v4 objectForKeyedSubscript:@"hasPersonTokens"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBQueryUnderstandingParse setHasPersonTokens:](v5, "setHasPersonTokens:", [v24 BOOLValue]);
    }
    v39 = v17;
    v25 = [v4 objectForKeyedSubscript:@"hasPersonSenderTokens"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBQueryUnderstandingParse setHasPersonSenderTokens:](v5, "setHasPersonSenderTokens:", [v25 BOOLValue]);
    }
    v38 = v19;
    v26 = objc_msgSend(v4, "objectForKeyedSubscript:", @"spotlightQueryIntent", v22);
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBQueryUnderstandingParse setSpotlightQueryIntent:](v5, "setSpotlightQueryIntent:", [v26 intValue]);
    }
    v27 = v20;
    v28 = [v4 objectForKeyedSubscript:@"isUnsafeQuery"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBQueryUnderstandingParse setIsUnsafeQuery:](v5, "setIsUnsafeQuery:", [v28 BOOLValue]);
    }
    v29 = [v4 objectForKeyedSubscript:@"isBlocklistedQuery"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBQueryUnderstandingParse setIsBlocklistedQuery:](v5, "setIsBlocklistedQuery:", [v29 BOOLValue]);
    }
    v30 = v5;
  }
  return v5;
}

- (_SFPBQueryUnderstandingParse)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBQueryUnderstandingParse *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBQueryUnderstandingParse *)self dictionaryRepresentation];
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
  if (self->_hasActionTokens)
  {
    id v4 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBQueryUnderstandingParse hasActionTokens](self, "hasActionTokens"));
    [v3 setObject:v4 forKeyedSubscript:@"hasActionTokens"];
  }
  if (self->_hasCaptureDeviceTokens)
  {
    v5 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBQueryUnderstandingParse hasCaptureDeviceTokens](self, "hasCaptureDeviceTokens"));
    [v3 setObject:v5 forKeyedSubscript:@"hasCaptureDeviceTokens"];
  }
  if (self->_hasEventTokens)
  {
    v6 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBQueryUnderstandingParse hasEventTokens](self, "hasEventTokens"));
    [v3 setObject:v6 forKeyedSubscript:@"hasEventTokens"];
  }
  if (self->_hasFavoritedTokens)
  {
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBQueryUnderstandingParse hasFavoritedTokens](self, "hasFavoritedTokens"));
    [v3 setObject:v7 forKeyedSubscript:@"hasFavoritedTokens"];
  }
  if (self->_hasGenericLocationTokens)
  {
    v8 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBQueryUnderstandingParse hasGenericLocationTokens](self, "hasGenericLocationTokens"));
    [v3 setObject:v8 forKeyedSubscript:@"hasGenericLocationTokens"];
  }
  if (self->_hasLocationTokens)
  {
    v9 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBQueryUnderstandingParse hasLocationTokens](self, "hasLocationTokens"));
    [v3 setObject:v9 forKeyedSubscript:@"hasLocationTokens"];
  }
  if (self->_hasMediaTypeTokens)
  {
    v10 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBQueryUnderstandingParse hasMediaTypeTokens](self, "hasMediaTypeTokens"));
    [v3 setObject:v10 forKeyedSubscript:@"hasMediaTypeTokens"];
  }
  if (self->_hasNounTokens)
  {
    v11 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBQueryUnderstandingParse hasNounTokens](self, "hasNounTokens"));
    [v3 setObject:v11 forKeyedSubscript:@"hasNounTokens"];
  }
  if (self->_hasPersonSenderTokens)
  {
    v12 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBQueryUnderstandingParse hasPersonSenderTokens](self, "hasPersonSenderTokens"));
    [v3 setObject:v12 forKeyedSubscript:@"hasPersonSenderTokens"];
  }
  if (self->_hasPersonTokens)
  {
    v13 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBQueryUnderstandingParse hasPersonTokens](self, "hasPersonTokens"));
    [v3 setObject:v13 forKeyedSubscript:@"hasPersonTokens"];
  }
  if (self->_hasSortCriteriaTokens)
  {
    v14 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBQueryUnderstandingParse hasSortCriteriaTokens](self, "hasSortCriteriaTokens"));
    [v3 setObject:v14 forKeyedSubscript:@"hasSortCriteriaTokens"];
  }
  if (self->_hasSourceAppTokens)
  {
    v15 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBQueryUnderstandingParse hasSourceAppTokens](self, "hasSourceAppTokens"));
    [v3 setObject:v15 forKeyedSubscript:@"hasSourceAppTokens"];
  }
  if (self->_hasTimeTokens)
  {
    uint64_t v16 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBQueryUnderstandingParse hasTimeTokens](self, "hasTimeTokens"));
    [v3 setObject:v16 forKeyedSubscript:@"hasTimeTokens"];
  }
  if (self->_hasUnspecifiedTokens)
  {
    v17 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBQueryUnderstandingParse hasUnspecifiedTokens](self, "hasUnspecifiedTokens"));
    [v3 setObject:v17 forKeyedSubscript:@"hasUnspecifiedTokens"];
  }
  if (self->_hasVisualQualityTokens)
  {
    uint64_t v18 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBQueryUnderstandingParse hasVisualQualityTokens](self, "hasVisualQualityTokens"));
    [v3 setObject:v18 forKeyedSubscript:@"hasVisualQualityTokens"];
  }
  if (self->_isBlocklistedQuery)
  {
    v19 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBQueryUnderstandingParse isBlocklistedQuery](self, "isBlocklistedQuery"));
    [v3 setObject:v19 forKeyedSubscript:@"isBlocklistedQuery"];
  }
  if (self->_isUnsafeQuery)
  {
    v20 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBQueryUnderstandingParse isUnsafeQuery](self, "isUnsafeQuery"));
    [v3 setObject:v20 forKeyedSubscript:@"isUnsafeQuery"];
  }
  if (self->_queryIntentType)
  {
    uint64_t v21 = [(_SFPBQueryUnderstandingParse *)self queryIntentType];
    if (v21 >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v21);
      v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v22 = off_1E5A2F070[v21];
    }
    [v3 setObject:v22 forKeyedSubscript:@"queryIntentType"];
  }
  if (self->_spotlightQueryIntent)
  {
    uint64_t v23 = [(_SFPBQueryUnderstandingParse *)self spotlightQueryIntent];
    if (v23 >= 5)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v23);
      v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v24 = off_1E5A2EF58[v23];
    }
    [v3 setObject:v24 forKeyedSubscript:@"spotlightQueryIntent"];
  }
  return v3;
}

- (unint64_t)hash
{
  uint64_t v2 = 2654435761;
  if (self->_hasUnspecifiedTokens) {
    uint64_t v3 = 2654435761;
  }
  else {
    uint64_t v3 = 0;
  }
  if (self->_hasSortCriteriaTokens) {
    uint64_t v4 = 2654435761;
  }
  else {
    uint64_t v4 = 0;
  }
  if (self->_hasLocationTokens) {
    uint64_t v5 = 2654435761;
  }
  else {
    uint64_t v5 = 0;
  }
  if (self->_hasActionTokens) {
    uint64_t v6 = 2654435761;
  }
  else {
    uint64_t v6 = 0;
  }
  if (self->_hasMediaTypeTokens) {
    uint64_t v7 = 2654435761;
  }
  else {
    uint64_t v7 = 0;
  }
  if (self->_hasVisualQualityTokens) {
    uint64_t v8 = 2654435761;
  }
  else {
    uint64_t v8 = 0;
  }
  if (self->_hasNounTokens) {
    uint64_t v9 = 2654435761;
  }
  else {
    uint64_t v9 = 0;
  }
  if (self->_hasTimeTokens) {
    uint64_t v10 = 2654435761;
  }
  else {
    uint64_t v10 = 0;
  }
  if (self->_hasEventTokens) {
    uint64_t v11 = 2654435761;
  }
  else {
    uint64_t v11 = 0;
  }
  if (self->_hasGenericLocationTokens) {
    uint64_t v12 = 2654435761;
  }
  else {
    uint64_t v12 = 0;
  }
  if (self->_hasCaptureDeviceTokens) {
    uint64_t v13 = 2654435761;
  }
  else {
    uint64_t v13 = 0;
  }
  if (self->_hasFavoritedTokens) {
    uint64_t v14 = 2654435761;
  }
  else {
    uint64_t v14 = 0;
  }
  if (self->_hasSourceAppTokens) {
    uint64_t v15 = 2654435761;
  }
  else {
    uint64_t v15 = 0;
  }
  if (self->_hasPersonTokens) {
    uint64_t v16 = 2654435761;
  }
  else {
    uint64_t v16 = 0;
  }
  if (self->_hasPersonSenderTokens) {
    uint64_t v17 = 2654435761;
  }
  else {
    uint64_t v17 = 0;
  }
  if (self->_isUnsafeQuery) {
    uint64_t v18 = 2654435761;
  }
  else {
    uint64_t v18 = 0;
  }
  if (!self->_isBlocklistedQuery) {
    uint64_t v2 = 0;
  }
  return v3 ^ v4 ^ v5 ^ v6 ^ (2654435761 * self->_queryIntentType) ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ (2654435761 * self->_spotlightQueryIntent) ^ v18 ^ v2;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_21;
  }
  int queryIntentType = self->_queryIntentType;
  if (queryIntentType != [v4 queryIntentType]) {
    goto LABEL_21;
  }
  int hasUnspecifiedTokens = self->_hasUnspecifiedTokens;
  if (hasUnspecifiedTokens != [v4 hasUnspecifiedTokens]) {
    goto LABEL_21;
  }
  int hasSortCriteriaTokens = self->_hasSortCriteriaTokens;
  if (hasSortCriteriaTokens != [v4 hasSortCriteriaTokens]) {
    goto LABEL_21;
  }
  int hasLocationTokens = self->_hasLocationTokens;
  if (hasLocationTokens != [v4 hasLocationTokens]) {
    goto LABEL_21;
  }
  int hasActionTokens = self->_hasActionTokens;
  if (hasActionTokens != [v4 hasActionTokens]) {
    goto LABEL_21;
  }
  int hasMediaTypeTokens = self->_hasMediaTypeTokens;
  if (hasMediaTypeTokens != [v4 hasMediaTypeTokens]) {
    goto LABEL_21;
  }
  int hasVisualQualityTokens = self->_hasVisualQualityTokens;
  if (hasVisualQualityTokens != [v4 hasVisualQualityTokens]) {
    goto LABEL_21;
  }
  int hasNounTokens = self->_hasNounTokens;
  if (hasNounTokens != [v4 hasNounTokens]) {
    goto LABEL_21;
  }
  int hasTimeTokens = self->_hasTimeTokens;
  if (hasTimeTokens != [v4 hasTimeTokens]) {
    goto LABEL_21;
  }
  int hasEventTokens = self->_hasEventTokens;
  if (hasEventTokens != [v4 hasEventTokens]) {
    goto LABEL_21;
  }
  int hasGenericLocationTokens = self->_hasGenericLocationTokens;
  if (hasGenericLocationTokens != [v4 hasGenericLocationTokens]) {
    goto LABEL_21;
  }
  int hasCaptureDeviceTokens = self->_hasCaptureDeviceTokens;
  if (hasCaptureDeviceTokens == [v4 hasCaptureDeviceTokens]
    && (int hasFavoritedTokens = self->_hasFavoritedTokens,
        hasFavoritedTokens == [v4 hasFavoritedTokens])
    && (int hasSourceAppTokens = self->_hasSourceAppTokens,
        hasSourceAppTokens == [v4 hasSourceAppTokens])
    && (int hasPersonTokens = self->_hasPersonTokens, hasPersonTokens == [v4 hasPersonTokens])
    && (int hasPersonSenderTokens = self->_hasPersonSenderTokens,
        hasPersonSenderTokens == [v4 hasPersonSenderTokens])
    && (int spotlightQueryIntent = self->_spotlightQueryIntent,
        spotlightQueryIntent == [v4 spotlightQueryIntent])
    && (int isUnsafeQuery = self->_isUnsafeQuery, isUnsafeQuery == [v4 isUnsafeQuery]))
  {
    int isBlocklistedQuery = self->_isBlocklistedQuery;
    BOOL v24 = isBlocklistedQuery == [v4 isBlocklistedQuery];
  }
  else
  {
LABEL_21:
    BOOL v24 = 0;
  }

  return v24;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if ([(_SFPBQueryUnderstandingParse *)self queryIntentType]) {
    PBDataWriterWriteInt32Field();
  }
  if ([(_SFPBQueryUnderstandingParse *)self hasUnspecifiedTokens]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_SFPBQueryUnderstandingParse *)self hasSortCriteriaTokens]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_SFPBQueryUnderstandingParse *)self hasLocationTokens]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_SFPBQueryUnderstandingParse *)self hasActionTokens]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_SFPBQueryUnderstandingParse *)self hasMediaTypeTokens]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_SFPBQueryUnderstandingParse *)self hasVisualQualityTokens]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_SFPBQueryUnderstandingParse *)self hasNounTokens]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_SFPBQueryUnderstandingParse *)self hasTimeTokens]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_SFPBQueryUnderstandingParse *)self hasEventTokens]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_SFPBQueryUnderstandingParse *)self hasGenericLocationTokens]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_SFPBQueryUnderstandingParse *)self hasCaptureDeviceTokens]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_SFPBQueryUnderstandingParse *)self hasFavoritedTokens]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_SFPBQueryUnderstandingParse *)self hasSourceAppTokens]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_SFPBQueryUnderstandingParse *)self hasPersonTokens]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_SFPBQueryUnderstandingParse *)self hasPersonSenderTokens]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_SFPBQueryUnderstandingParse *)self spotlightQueryIntent]) {
    PBDataWriterWriteInt32Field();
  }
  if ([(_SFPBQueryUnderstandingParse *)self isUnsafeQuery]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_SFPBQueryUnderstandingParse *)self isBlocklistedQuery]) {
    PBDataWriterWriteBOOLField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBQueryUnderstandingParseReadFrom(self, (uint64_t)a3);
}

- (void)setIsBlocklistedQuery:(BOOL)a3
{
  self->_int isBlocklistedQuery = a3;
}

- (void)setIsUnsafeQuery:(BOOL)a3
{
  self->_int isUnsafeQuery = a3;
}

- (void)setSpotlightQueryIntent:(int)a3
{
  self->_int spotlightQueryIntent = a3;
}

- (void)setHasPersonSenderTokens:(BOOL)a3
{
  self->_int hasPersonSenderTokens = a3;
}

- (void)setHasPersonTokens:(BOOL)a3
{
  self->_int hasPersonTokens = a3;
}

- (void)setHasSourceAppTokens:(BOOL)a3
{
  self->_int hasSourceAppTokens = a3;
}

- (void)setHasFavoritedTokens:(BOOL)a3
{
  self->_int hasFavoritedTokens = a3;
}

- (void)setHasCaptureDeviceTokens:(BOOL)a3
{
  self->_int hasCaptureDeviceTokens = a3;
}

- (void)setHasGenericLocationTokens:(BOOL)a3
{
  self->_int hasGenericLocationTokens = a3;
}

- (void)setHasEventTokens:(BOOL)a3
{
  self->_int hasEventTokens = a3;
}

- (void)setHasTimeTokens:(BOOL)a3
{
  self->_int hasTimeTokens = a3;
}

- (void)setHasNounTokens:(BOOL)a3
{
  self->_int hasNounTokens = a3;
}

- (void)setHasVisualQualityTokens:(BOOL)a3
{
  self->_int hasVisualQualityTokens = a3;
}

- (void)setHasMediaTypeTokens:(BOOL)a3
{
  self->_int hasMediaTypeTokens = a3;
}

- (void)setHasActionTokens:(BOOL)a3
{
  self->_int hasActionTokens = a3;
}

- (void)setHasLocationTokens:(BOOL)a3
{
  self->_int hasLocationTokens = a3;
}

- (void)setHasSortCriteriaTokens:(BOOL)a3
{
  self->_int hasSortCriteriaTokens = a3;
}

- (void)setHasUnspecifiedTokens:(BOOL)a3
{
  self->_int hasUnspecifiedTokens = a3;
}

- (void)setQueryIntentType:(int)a3
{
  self->_int queryIntentType = a3;
}

@end