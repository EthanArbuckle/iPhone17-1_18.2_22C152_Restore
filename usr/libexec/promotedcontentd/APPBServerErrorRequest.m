@interface APPBServerErrorRequest
+ (Class)failingURLsType;
+ (id)options;
- (APPBAdData)badResponse;
- (APPBLogMetaData)metaData;
- (BOOL)hasBadResponse;
- (BOOL)hasErrorCode;
- (BOOL)hasErrorDetails;
- (BOOL)hasMetaData;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)failingURLs;
- (NSString)errorDetails;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)errorCodeAsString:(int)a3;
- (id)failingURLsAtIndex:(unint64_t)a3;
- (int)StringAsErrorCode:(id)a3;
- (int)errorCode;
- (unint64_t)failingURLsCount;
- (unint64_t)hash;
- (void)addFailingURLs:(id)a3;
- (void)clearFailingURLs;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBadResponse:(id)a3;
- (void)setErrorCode:(int)a3;
- (void)setErrorDetails:(id)a3;
- (void)setFailingURLs:(id)a3;
- (void)setHasErrorCode:(BOOL)a3;
- (void)setMetaData:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation APPBServerErrorRequest

+ (id)options
{
  if (qword_100289A70 != -1) {
    dispatch_once(&qword_100289A70, &stru_100235E08);
  }
  v2 = (void *)qword_100289A68;

  return v2;
}

- (BOOL)hasMetaData
{
  return self->_metaData != 0;
}

- (int)errorCode
{
  if (*(unsigned char *)&self->_has) {
    return self->_errorCode;
  }
  else {
    return 1;
  }
}

- (void)setErrorCode:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_errorCode = a3;
}

- (void)setHasErrorCode:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasErrorCode
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)errorCodeAsString:(int)a3
{
  if ((a3 - 1) >= 0xD)
  {
    v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    v3 = *(&off_100235E28 + a3 - 1);
  }

  return v3;
}

- (int)StringAsErrorCode:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"NoBannerContent"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"BannerURLSchemeInvalid"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"ActionURLSchemeInvalid"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"WebArchiveURLSchemeInvalid"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"AssetRetrieveFailure"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"AdSheetCrashDuringEngagement"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"MediaPlaybackFailure"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"RequiredFallbackURLNotProvided"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"RequiredWebArchiveNotProvided"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"ConfigurationInvalid"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"MatchTagsInvalid"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"InvalidActionIdentifiers"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"ProxyAuthHeaderExceedsMaxLength"])
  {
    int v4 = 13;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (BOOL)hasErrorDetails
{
  return self->_errorDetails != 0;
}

- (BOOL)hasBadResponse
{
  return self->_badResponse != 0;
}

- (void)clearFailingURLs
{
}

- (void)addFailingURLs:(id)a3
{
  id v4 = a3;
  failingURLs = self->_failingURLs;
  id v8 = v4;
  if (!failingURLs)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_failingURLs;
    self->_failingURLs = v6;

    id v4 = v8;
    failingURLs = self->_failingURLs;
  }
  [(NSMutableArray *)failingURLs addObject:v4];
}

- (unint64_t)failingURLsCount
{
  return (unint64_t)[(NSMutableArray *)self->_failingURLs count];
}

- (id)failingURLsAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_failingURLs objectAtIndex:a3];
}

+ (Class)failingURLsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)APPBServerErrorRequest;
  id v3 = [(APPBServerErrorRequest *)&v7 description];
  id v4 = [(APPBServerErrorRequest *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  metaData = self->_metaData;
  if (metaData)
  {
    v5 = [(APPBLogMetaData *)metaData dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"metaData"];
  }
  if (*(unsigned char *)&self->_has)
  {
    int v6 = self->_errorCode - 1;
    if (v6 >= 0xD)
    {
      objc_super v7 = +[NSString stringWithFormat:@"(unknown: %i)", self->_errorCode];
    }
    else
    {
      objc_super v7 = *(&off_100235E28 + v6);
    }
    [v3 setObject:v7 forKey:@"errorCode"];
  }
  errorDetails = self->_errorDetails;
  if (errorDetails) {
    [v3 setObject:errorDetails forKey:@"errorDetails"];
  }
  badResponse = self->_badResponse;
  if (badResponse)
  {
    v10 = [(APPBAdData *)badResponse dictionaryRepresentation];
    [v3 setObject:v10 forKey:@"badResponse"];
  }
  failingURLs = self->_failingURLs;
  if (failingURLs) {
    [v3 setObject:failingURLs forKey:@"failingURLs"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return APPBServerErrorRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (self->_metaData) {
    PBDataWriterWriteSubmessage();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_badResponse) {
    PBDataWriterWriteSubmessage();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = self->_failingURLs;
  int v6 = (char *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    objc_super v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      objc_super v7 = (char *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  if (self->_errorDetails) {
    PBDataWriterWriteStringField();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v9 = v4;
  if (self->_metaData)
  {
    [v4 setMetaData:];
    id v4 = v9;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v4 + 4) = self->_errorCode;
    *((unsigned char *)v4 + 48) |= 1u;
  }
  if (self->_badResponse) {
    [v9 setBadResponse:];
  }
  if ([(APPBServerErrorRequest *)self failingURLsCount])
  {
    [v9 clearFailingURLs];
    unint64_t v5 = [(APPBServerErrorRequest *)self failingURLsCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(APPBServerErrorRequest *)self failingURLsAtIndex:i];
        [v9 addFailingURLs:v8];
      }
    }
  }
  if (self->_errorDetails) {
    [v9 setErrorDetails:];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = [[[objc_opt_class() allocWithZone:a3] init];
  id v6 = [(APPBLogMetaData *)self->_metaData copyWithZone:a3];
  objc_super v7 = (void *)v5[5];
  v5[5] = v6;

  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v5 + 4) = self->_errorCode;
    *((unsigned char *)v5 + 48) |= 1u;
  }
  id v8 = [(APPBAdData *)self->_badResponse copyWithZone:a3];
  id v9 = (void *)v5[1];
  v5[1] = v8;

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v10 = self->_failingURLs;
  id v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v20;
    do
    {
      v14 = 0;
      do
      {
        if (*(void *)v20 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = [*(id *)(*((void *)&v19 + 1) + 8 * (void)v14) copyWithZone:a3];
        [v5 addFailingURLs:v15];

        v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      id v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v12);
  }

  id v16 = [(NSString *)self->_errorDetails copyWithZone:a3];
  v17 = (void *)v5[3];
  v5[3] = v16;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_15;
  }
  metaData = self->_metaData;
  if ((unint64_t)metaData | *((void *)v4 + 5))
  {
    if (!-[APPBLogMetaData isEqual:](metaData, "isEqual:")) {
      goto LABEL_15;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 48) & 1) == 0 || self->_errorCode != *((_DWORD *)v4 + 4)) {
      goto LABEL_15;
    }
  }
  else if (*((unsigned char *)v4 + 48))
  {
LABEL_15:
    unsigned __int8 v9 = 0;
    goto LABEL_16;
  }
  badResponse = self->_badResponse;
  if ((unint64_t)badResponse | *((void *)v4 + 1) && !-[APPBAdData isEqual:](badResponse, "isEqual:")) {
    goto LABEL_15;
  }
  failingURLs = self->_failingURLs;
  if ((unint64_t)failingURLs | *((void *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](failingURLs, "isEqual:")) {
      goto LABEL_15;
    }
  }
  errorDetails = self->_errorDetails;
  if ((unint64_t)errorDetails | *((void *)v4 + 3)) {
    unsigned __int8 v9 = -[NSString isEqual:](errorDetails, "isEqual:");
  }
  else {
    unsigned __int8 v9 = 1;
  }
LABEL_16:

  return v9;
}

- (unint64_t)hash
{
  unint64_t v3 = [(APPBLogMetaData *)self->_metaData hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_errorCode;
  }
  else {
    uint64_t v4 = 0;
  }
  unint64_t v5 = v4 ^ v3;
  unint64_t v6 = [(APPBAdData *)self->_badResponse hash];
  unint64_t v7 = v5 ^ v6 ^ (unint64_t)[(NSMutableArray *)self->_failingURLs hash];
  return v7 ^ [(NSString *)self->_errorDetails hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  metaData = self->_metaData;
  uint64_t v6 = *((void *)v4 + 5);
  if (metaData)
  {
    if (v6) {
      -[APPBLogMetaData mergeFrom:](metaData, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[APPBServerErrorRequest setMetaData:](self, "setMetaData:");
  }
  if (*((unsigned char *)v4 + 48))
  {
    self->_errorCode = *((_DWORD *)v4 + 4);
    *(unsigned char *)&self->_has |= 1u;
  }
  badResponse = self->_badResponse;
  uint64_t v8 = *((void *)v4 + 1);
  if (badResponse)
  {
    if (v8) {
      -[APPBAdData mergeFrom:](badResponse, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[APPBServerErrorRequest setBadResponse:](self, "setBadResponse:");
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v9 = *((id *)v4 + 4);
  id v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v11; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        -[APPBServerErrorRequest addFailingURLs:](self, "addFailingURLs:", *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14);
      }
      id v11 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v11);
  }

  if (*((void *)v4 + 3)) {
    -[APPBServerErrorRequest setErrorDetails:](self, "setErrorDetails:");
  }
}

- (APPBLogMetaData)metaData
{
  return self->_metaData;
}

- (void)setMetaData:(id)a3
{
}

- (NSString)errorDetails
{
  return self->_errorDetails;
}

- (void)setErrorDetails:(id)a3
{
}

- (APPBAdData)badResponse
{
  return self->_badResponse;
}

- (void)setBadResponse:(id)a3
{
}

- (NSMutableArray)failingURLs
{
  return self->_failingURLs;
}

- (void)setFailingURLs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metaData, 0);
  objc_storeStrong((id *)&self->_failingURLs, 0);
  objc_storeStrong((id *)&self->_errorDetails, 0);

  objc_storeStrong((id *)&self->_badResponse, 0);
}

@end