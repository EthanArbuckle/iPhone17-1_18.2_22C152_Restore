@interface SFQueryUnderstandingParse
+ (BOOL)supportsSecureCoding;
- (BOOL)hasActionTokens;
- (BOOL)hasCaptureDeviceTokens;
- (BOOL)hasEventTokens;
- (BOOL)hasFavoritedTokens;
- (BOOL)hasGenericLocationTokens;
- (BOOL)hasHasActionTokens;
- (BOOL)hasHasCaptureDeviceTokens;
- (BOOL)hasHasEventTokens;
- (BOOL)hasHasFavoritedTokens;
- (BOOL)hasHasGenericLocationTokens;
- (BOOL)hasHasLocationTokens;
- (BOOL)hasHasMediaTypeTokens;
- (BOOL)hasHasNounTokens;
- (BOOL)hasHasPersonSenderTokens;
- (BOOL)hasHasPersonTokens;
- (BOOL)hasHasSortCriteriaTokens;
- (BOOL)hasHasSourceAppTokens;
- (BOOL)hasHasTimeTokens;
- (BOOL)hasHasUnspecifiedTokens;
- (BOOL)hasHasVisualQualityTokens;
- (BOOL)hasIsBlocklistedQuery;
- (BOOL)hasIsUnsafeQuery;
- (BOOL)hasLocationTokens;
- (BOOL)hasMediaTypeTokens;
- (BOOL)hasNounTokens;
- (BOOL)hasPersonSenderTokens;
- (BOOL)hasPersonTokens;
- (BOOL)hasQueryIntentType;
- (BOOL)hasSortCriteriaTokens;
- (BOOL)hasSourceAppTokens;
- (BOOL)hasSpotlightQueryIntent;
- (BOOL)hasTimeTokens;
- (BOOL)hasUnspecifiedTokens;
- (BOOL)hasVisualQualityTokens;
- (BOOL)isBlocklistedQuery;
- (BOOL)isEqual:(id)a3;
- (BOOL)isUnsafeQuery;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (SFQueryUnderstandingParse)initWithCoder:(id)a3;
- (SFQueryUnderstandingParse)initWithProtobuf:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int)queryIntentType;
- (int)spotlightQueryIntent;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
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
@end

@implementation SFQueryUnderstandingParse

+ (BOOL)supportsSecureCoding
{
  return 1;
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

- (unint64_t)hash
{
  unint64_t v3 = [(SFQueryUnderstandingParse *)self queryIntentType];
  unint64_t v4 = [(SFQueryUnderstandingParse *)self hasUnspecifiedTokens] ^ v3;
  uint64_t v5 = [(SFQueryUnderstandingParse *)self hasSortCriteriaTokens];
  uint64_t v6 = v4 ^ v5 ^ [(SFQueryUnderstandingParse *)self hasLocationTokens];
  uint64_t v7 = [(SFQueryUnderstandingParse *)self hasActionTokens];
  uint64_t v8 = v7 ^ [(SFQueryUnderstandingParse *)self hasMediaTypeTokens];
  uint64_t v9 = v6 ^ v8 ^ [(SFQueryUnderstandingParse *)self hasVisualQualityTokens];
  uint64_t v10 = [(SFQueryUnderstandingParse *)self hasNounTokens];
  uint64_t v11 = v10 ^ [(SFQueryUnderstandingParse *)self hasTimeTokens];
  uint64_t v12 = v11 ^ [(SFQueryUnderstandingParse *)self hasEventTokens];
  uint64_t v13 = v9 ^ v12 ^ [(SFQueryUnderstandingParse *)self hasGenericLocationTokens];
  uint64_t v14 = [(SFQueryUnderstandingParse *)self hasCaptureDeviceTokens];
  uint64_t v15 = v14 ^ [(SFQueryUnderstandingParse *)self hasFavoritedTokens];
  uint64_t v16 = v15 ^ [(SFQueryUnderstandingParse *)self hasSourceAppTokens];
  uint64_t v17 = v16 ^ [(SFQueryUnderstandingParse *)self hasPersonTokens];
  uint64_t v18 = v13 ^ v17 ^ [(SFQueryUnderstandingParse *)self hasPersonSenderTokens];
  uint64_t v19 = [(SFQueryUnderstandingParse *)self spotlightQueryIntent];
  uint64_t v20 = v19 ^ [(SFQueryUnderstandingParse *)self isUnsafeQuery];
  return v18 ^ v20 ^ [(SFQueryUnderstandingParse *)self isBlocklistedQuery];
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (SFQueryUnderstandingParse *)a3;
  if (self == v4)
  {
    LOBYTE(v24) = 1;
  }
  else if ([(SFQueryUnderstandingParse *)v4 isMemberOfClass:objc_opt_class()])
  {
    uint64_t v5 = v4;
    int v6 = [(SFQueryUnderstandingParse *)self queryIntentType];
    if (v6 != [(SFQueryUnderstandingParse *)v5 queryIntentType]) {
      goto LABEL_21;
    }
    BOOL v7 = [(SFQueryUnderstandingParse *)self hasUnspecifiedTokens];
    if (v7 != [(SFQueryUnderstandingParse *)v5 hasUnspecifiedTokens]) {
      goto LABEL_21;
    }
    BOOL v8 = [(SFQueryUnderstandingParse *)self hasSortCriteriaTokens];
    if (v8 != [(SFQueryUnderstandingParse *)v5 hasSortCriteriaTokens]) {
      goto LABEL_21;
    }
    BOOL v9 = [(SFQueryUnderstandingParse *)self hasLocationTokens];
    if (v9 != [(SFQueryUnderstandingParse *)v5 hasLocationTokens]) {
      goto LABEL_21;
    }
    BOOL v10 = [(SFQueryUnderstandingParse *)self hasActionTokens];
    if (v10 != [(SFQueryUnderstandingParse *)v5 hasActionTokens]) {
      goto LABEL_21;
    }
    BOOL v11 = [(SFQueryUnderstandingParse *)self hasMediaTypeTokens];
    if (v11 != [(SFQueryUnderstandingParse *)v5 hasMediaTypeTokens]) {
      goto LABEL_21;
    }
    BOOL v12 = [(SFQueryUnderstandingParse *)self hasVisualQualityTokens];
    if (v12 != [(SFQueryUnderstandingParse *)v5 hasVisualQualityTokens]) {
      goto LABEL_21;
    }
    BOOL v13 = [(SFQueryUnderstandingParse *)self hasNounTokens];
    if (v13 != [(SFQueryUnderstandingParse *)v5 hasNounTokens]) {
      goto LABEL_21;
    }
    BOOL v14 = [(SFQueryUnderstandingParse *)self hasTimeTokens];
    if (v14 != [(SFQueryUnderstandingParse *)v5 hasTimeTokens]) {
      goto LABEL_21;
    }
    BOOL v15 = [(SFQueryUnderstandingParse *)self hasEventTokens];
    if (v15 != [(SFQueryUnderstandingParse *)v5 hasEventTokens]) {
      goto LABEL_21;
    }
    BOOL v16 = [(SFQueryUnderstandingParse *)self hasGenericLocationTokens];
    if (v16 != [(SFQueryUnderstandingParse *)v5 hasGenericLocationTokens]) {
      goto LABEL_21;
    }
    BOOL v17 = [(SFQueryUnderstandingParse *)self hasCaptureDeviceTokens];
    if (v17 == [(SFQueryUnderstandingParse *)v5 hasCaptureDeviceTokens]
      && (BOOL v18 = [(SFQueryUnderstandingParse *)self hasFavoritedTokens],
          v18 == [(SFQueryUnderstandingParse *)v5 hasFavoritedTokens])
      && (BOOL v19 = [(SFQueryUnderstandingParse *)self hasSourceAppTokens],
          v19 == [(SFQueryUnderstandingParse *)v5 hasSourceAppTokens])
      && (BOOL v20 = [(SFQueryUnderstandingParse *)self hasPersonTokens],
          v20 == [(SFQueryUnderstandingParse *)v5 hasPersonTokens])
      && (BOOL v21 = [(SFQueryUnderstandingParse *)self hasPersonSenderTokens],
          v21 == [(SFQueryUnderstandingParse *)v5 hasPersonSenderTokens])
      && (int v22 = [(SFQueryUnderstandingParse *)self spotlightQueryIntent],
          v22 == [(SFQueryUnderstandingParse *)v5 spotlightQueryIntent])
      && (BOOL v23 = [(SFQueryUnderstandingParse *)self isUnsafeQuery],
          v23 == [(SFQueryUnderstandingParse *)v5 isUnsafeQuery]))
    {
      BOOL v26 = [(SFQueryUnderstandingParse *)self isBlocklistedQuery];
      BOOL v24 = v26 ^ [(SFQueryUnderstandingParse *)v5 isBlocklistedQuery] ^ 1;
    }
    else
    {
LABEL_21:
      LOBYTE(v24) = 0;
    }
  }
  else
  {
    LOBYTE(v24) = 0;
  }

  return v24;
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setQueryIntentType:", -[SFQueryUnderstandingParse queryIntentType](self, "queryIntentType"));
  objc_msgSend(v4, "setHasUnspecifiedTokens:", -[SFQueryUnderstandingParse hasUnspecifiedTokens](self, "hasUnspecifiedTokens"));
  objc_msgSend(v4, "setHasSortCriteriaTokens:", -[SFQueryUnderstandingParse hasSortCriteriaTokens](self, "hasSortCriteriaTokens"));
  objc_msgSend(v4, "setHasLocationTokens:", -[SFQueryUnderstandingParse hasLocationTokens](self, "hasLocationTokens"));
  objc_msgSend(v4, "setHasActionTokens:", -[SFQueryUnderstandingParse hasActionTokens](self, "hasActionTokens"));
  objc_msgSend(v4, "setHasMediaTypeTokens:", -[SFQueryUnderstandingParse hasMediaTypeTokens](self, "hasMediaTypeTokens"));
  objc_msgSend(v4, "setHasVisualQualityTokens:", -[SFQueryUnderstandingParse hasVisualQualityTokens](self, "hasVisualQualityTokens"));
  objc_msgSend(v4, "setHasNounTokens:", -[SFQueryUnderstandingParse hasNounTokens](self, "hasNounTokens"));
  objc_msgSend(v4, "setHasTimeTokens:", -[SFQueryUnderstandingParse hasTimeTokens](self, "hasTimeTokens"));
  objc_msgSend(v4, "setHasEventTokens:", -[SFQueryUnderstandingParse hasEventTokens](self, "hasEventTokens"));
  objc_msgSend(v4, "setHasGenericLocationTokens:", -[SFQueryUnderstandingParse hasGenericLocationTokens](self, "hasGenericLocationTokens"));
  objc_msgSend(v4, "setHasCaptureDeviceTokens:", -[SFQueryUnderstandingParse hasCaptureDeviceTokens](self, "hasCaptureDeviceTokens"));
  objc_msgSend(v4, "setHasFavoritedTokens:", -[SFQueryUnderstandingParse hasFavoritedTokens](self, "hasFavoritedTokens"));
  objc_msgSend(v4, "setHasSourceAppTokens:", -[SFQueryUnderstandingParse hasSourceAppTokens](self, "hasSourceAppTokens"));
  objc_msgSend(v4, "setHasPersonTokens:", -[SFQueryUnderstandingParse hasPersonTokens](self, "hasPersonTokens"));
  objc_msgSend(v4, "setHasPersonSenderTokens:", -[SFQueryUnderstandingParse hasPersonSenderTokens](self, "hasPersonSenderTokens"));
  objc_msgSend(v4, "setSpotlightQueryIntent:", -[SFQueryUnderstandingParse spotlightQueryIntent](self, "spotlightQueryIntent"));
  objc_msgSend(v4, "setIsUnsafeQuery:", -[SFQueryUnderstandingParse isUnsafeQuery](self, "isUnsafeQuery"));
  objc_msgSend(v4, "setIsBlocklistedQuery:", -[SFQueryUnderstandingParse isBlocklistedQuery](self, "isBlocklistedQuery"));
  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBQueryUnderstandingParse alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBQueryUnderstandingParse *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBQueryUnderstandingParse alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBQueryUnderstandingParse *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  int v6 = [[_SFPBQueryUnderstandingParse alloc] initWithFacade:self];
  uint64_t v5 = [(_SFPBQueryUnderstandingParse *)v6 data];
  [v4 encodeObject:v5 forKey:@"_backingStore"];
}

- (SFQueryUnderstandingParse)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  int v6 = [[_SFPBQueryUnderstandingParse alloc] initWithData:v5];
  BOOL v7 = [(SFQueryUnderstandingParse *)self initWithProtobuf:v6];

  return v7;
}

- (BOOL)hasIsBlocklistedQuery
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setIsBlocklistedQuery:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_isBlocklistedQuery = a3;
}

- (BOOL)hasIsUnsafeQuery
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setIsUnsafeQuery:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_isUnsafeQuery = a3;
}

- (BOOL)hasSpotlightQueryIntent
{
  return *((unsigned char *)&self->_has + 2) & 1;
}

- (void)setSpotlightQueryIntent:(int)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_spotlightQueryIntent = a3;
}

- (BOOL)hasHasPersonSenderTokens
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setHasPersonSenderTokens:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_hasPersonSenderTokens = a3;
}

- (BOOL)hasHasPersonTokens
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setHasPersonTokens:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_hasPersonTokens = a3;
}

- (BOOL)hasHasSourceAppTokens
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setHasSourceAppTokens:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_hasSourceAppTokens = a3;
}

- (BOOL)hasHasFavoritedTokens
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setHasFavoritedTokens:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_hasFavoritedTokens = a3;
}

- (BOOL)hasHasCaptureDeviceTokens
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setHasCaptureDeviceTokens:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_hasCaptureDeviceTokens = a3;
}

- (BOOL)hasHasGenericLocationTokens
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setHasGenericLocationTokens:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_hasGenericLocationTokens = a3;
}

- (BOOL)hasHasEventTokens
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setHasEventTokens:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_hasEventTokens = a3;
}

- (BOOL)hasHasTimeTokens
{
  return *((unsigned char *)&self->_has + 1) & 1;
}

- (void)setHasTimeTokens:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_hasTimeTokens = a3;
}

- (BOOL)hasHasNounTokens
{
  return *(unsigned char *)&self->_has >> 7;
}

- (void)setHasNounTokens:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_hasNounTokens = a3;
}

- (BOOL)hasHasVisualQualityTokens
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setHasVisualQualityTokens:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_hasVisualQualityTokens = a3;
}

- (BOOL)hasHasMediaTypeTokens
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setHasMediaTypeTokens:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_hasMediaTypeTokens = a3;
}

- (BOOL)hasHasActionTokens
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setHasActionTokens:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_hasActionTokens = a3;
}

- (BOOL)hasHasLocationTokens
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setHasLocationTokens:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_hasLocationTokens = a3;
}

- (BOOL)hasHasSortCriteriaTokens
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHasSortCriteriaTokens:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_hasSortCriteriaTokens = a3;
}

- (BOOL)hasHasUnspecifiedTokens
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasUnspecifiedTokens:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_hasUnspecifiedTokens = a3;
}

- (BOOL)hasQueryIntentType
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setQueryIntentType:(int)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_queryIntentType = a3;
}

- (SFQueryUnderstandingParse)initWithProtobuf:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SFQueryUnderstandingParse;
  uint64_t v5 = [(SFQueryUnderstandingParse *)&v8 init];
  if (v5)
  {
    if ([v4 queryIntentType]) {
      -[SFQueryUnderstandingParse setQueryIntentType:](v5, "setQueryIntentType:", [v4 queryIntentType]);
    }
    if ([v4 hasUnspecifiedTokens]) {
      -[SFQueryUnderstandingParse setHasUnspecifiedTokens:](v5, "setHasUnspecifiedTokens:", [v4 hasUnspecifiedTokens]);
    }
    if ([v4 hasSortCriteriaTokens]) {
      -[SFQueryUnderstandingParse setHasSortCriteriaTokens:](v5, "setHasSortCriteriaTokens:", [v4 hasSortCriteriaTokens]);
    }
    if ([v4 hasLocationTokens]) {
      -[SFQueryUnderstandingParse setHasLocationTokens:](v5, "setHasLocationTokens:", [v4 hasLocationTokens]);
    }
    if ([v4 hasActionTokens]) {
      -[SFQueryUnderstandingParse setHasActionTokens:](v5, "setHasActionTokens:", [v4 hasActionTokens]);
    }
    if ([v4 hasMediaTypeTokens]) {
      -[SFQueryUnderstandingParse setHasMediaTypeTokens:](v5, "setHasMediaTypeTokens:", [v4 hasMediaTypeTokens]);
    }
    if ([v4 hasVisualQualityTokens]) {
      -[SFQueryUnderstandingParse setHasVisualQualityTokens:](v5, "setHasVisualQualityTokens:", [v4 hasVisualQualityTokens]);
    }
    if ([v4 hasNounTokens]) {
      -[SFQueryUnderstandingParse setHasNounTokens:](v5, "setHasNounTokens:", [v4 hasNounTokens]);
    }
    if ([v4 hasTimeTokens]) {
      -[SFQueryUnderstandingParse setHasTimeTokens:](v5, "setHasTimeTokens:", [v4 hasTimeTokens]);
    }
    if ([v4 hasEventTokens]) {
      -[SFQueryUnderstandingParse setHasEventTokens:](v5, "setHasEventTokens:", [v4 hasEventTokens]);
    }
    if ([v4 hasGenericLocationTokens]) {
      -[SFQueryUnderstandingParse setHasGenericLocationTokens:](v5, "setHasGenericLocationTokens:", [v4 hasGenericLocationTokens]);
    }
    if ([v4 hasCaptureDeviceTokens]) {
      -[SFQueryUnderstandingParse setHasCaptureDeviceTokens:](v5, "setHasCaptureDeviceTokens:", [v4 hasCaptureDeviceTokens]);
    }
    if ([v4 hasFavoritedTokens]) {
      -[SFQueryUnderstandingParse setHasFavoritedTokens:](v5, "setHasFavoritedTokens:", [v4 hasFavoritedTokens]);
    }
    if ([v4 hasSourceAppTokens]) {
      -[SFQueryUnderstandingParse setHasSourceAppTokens:](v5, "setHasSourceAppTokens:", [v4 hasSourceAppTokens]);
    }
    if ([v4 hasPersonTokens]) {
      -[SFQueryUnderstandingParse setHasPersonTokens:](v5, "setHasPersonTokens:", [v4 hasPersonTokens]);
    }
    if ([v4 hasPersonSenderTokens]) {
      -[SFQueryUnderstandingParse setHasPersonSenderTokens:](v5, "setHasPersonSenderTokens:", [v4 hasPersonSenderTokens]);
    }
    if ([v4 spotlightQueryIntent]) {
      -[SFQueryUnderstandingParse setSpotlightQueryIntent:](v5, "setSpotlightQueryIntent:", [v4 spotlightQueryIntent]);
    }
    if ([v4 isUnsafeQuery]) {
      -[SFQueryUnderstandingParse setIsUnsafeQuery:](v5, "setIsUnsafeQuery:", [v4 isUnsafeQuery]);
    }
    if ([v4 isBlocklistedQuery]) {
      -[SFQueryUnderstandingParse setIsBlocklistedQuery:](v5, "setIsBlocklistedQuery:", [v4 isBlocklistedQuery]);
    }
    int v6 = v5;
  }

  return v5;
}

@end