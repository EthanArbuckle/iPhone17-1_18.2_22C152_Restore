@interface APPBAdSpaceStatusEventRequest
+ (id)options;
- (BOOL)adReused;
- (BOOL)firstMessage;
- (BOOL)hasAdOriginIdentifier;
- (BOOL)hasAdReused;
- (BOOL)hasAdServerResponseIdentifier;
- (BOOL)hasAnonymousDemandiAdID;
- (BOOL)hasBundleID;
- (BOOL)hasContentiAdID;
- (BOOL)hasContextJSON;
- (BOOL)hasDPID;
- (BOOL)hasFirstMessage;
- (BOOL)hasIAdID;
- (BOOL)hasOsVersionAndBuild;
- (BOOL)hasResponseTime;
- (BOOL)hasScreenfuls;
- (BOOL)hasSlotPosition;
- (BOOL)hasStatusCode;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)anonymousDemandiAdID;
- (NSData)contentiAdID;
- (NSData)dPID;
- (NSData)iAdID;
- (NSString)adOriginIdentifier;
- (NSString)adServerResponseIdentifier;
- (NSString)bundleID;
- (NSString)contextJSON;
- (NSString)osVersionAndBuild;
- (double)responseTime;
- (double)timestamp;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)statusCodeAsString:(int)a3;
- (int)StringAsStatusCode:(id)a3;
- (int)screenfuls;
- (int)slotPosition;
- (int)statusCode;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAdOriginIdentifier:(id)a3;
- (void)setAdReused:(BOOL)a3;
- (void)setAdServerResponseIdentifier:(id)a3;
- (void)setAnonymousDemandiAdID:(id)a3;
- (void)setBundleID:(id)a3;
- (void)setContentiAdID:(id)a3;
- (void)setContextJSON:(id)a3;
- (void)setDPID:(id)a3;
- (void)setFirstMessage:(BOOL)a3;
- (void)setHasAdReused:(BOOL)a3;
- (void)setHasFirstMessage:(BOOL)a3;
- (void)setHasResponseTime:(BOOL)a3;
- (void)setHasScreenfuls:(BOOL)a3;
- (void)setHasSlotPosition:(BOOL)a3;
- (void)setHasStatusCode:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setIAdID:(id)a3;
- (void)setOsVersionAndBuild:(id)a3;
- (void)setResponseTime:(double)a3;
- (void)setScreenfuls:(int)a3;
- (void)setSlotPosition:(int)a3;
- (void)setStatusCode:(int)a3;
- (void)setTimestamp:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation APPBAdSpaceStatusEventRequest

+ (id)options
{
  if (qword_1002899D0 != -1) {
    dispatch_once(&qword_1002899D0, &stru_100235A48);
  }
  v2 = (void *)qword_1002899C8;

  return v2;
}

- (BOOL)hasAdServerResponseIdentifier
{
  return self->_adServerResponseIdentifier != 0;
}

- (BOOL)hasAdOriginIdentifier
{
  return self->_adOriginIdentifier != 0;
}

- (BOOL)hasAnonymousDemandiAdID
{
  return self->_anonymousDemandiAdID != 0;
}

- (BOOL)hasContentiAdID
{
  return self->_contentiAdID != 0;
}

- (BOOL)hasIAdID
{
  return self->_iAdID != 0;
}

- (void)setTimestamp:(double)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasTimestamp
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setResponseTime:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_responseTime = a3;
}

- (void)setHasResponseTime:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasResponseTime
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setScreenfuls:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_screenfuls = a3;
}

- (void)setHasScreenfuls:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasScreenfuls
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setFirstMessage:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x40u;
  self->_firstMessage = a3;
}

- (void)setHasFirstMessage:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xBF | v3;
}

- (BOOL)hasFirstMessage
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (int)statusCode
{
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    return self->_statusCode;
  }
  else {
    return 0;
  }
}

- (void)setStatusCode:(int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_statusCode = a3;
}

- (void)setHasStatusCode:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasStatusCode
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (id)statusCodeAsString:(int)a3
{
  if (!(!v4 & v3))
  {
    v7 = @"ADStatusCodeUnknown";
    switch(a3)
    {
      case 0:
        goto LABEL_97;
      case 1:
        v7 = @"ADStatusCodeServerFailure";
        return v7;
      case 2:
        v7 = @"ADStatusCodeLoadingThrottled";
        return v7;
      case 3:
        v7 = @"ADStatusCodeInventoryUnavailable";
        return v7;
      case 4:
        v7 = @"ADStatusCodeConfigurationError";
        return v7;
      case 5:
        v7 = @"ADStatusCodeBannerVisibleWithoutContent";
        return v7;
      case 6:
        v7 = @"ADStatusCodeApplicationInactive";
        return v7;
      case 7:
        v7 = @"ADStatusCodeAdUnloaded";
        return v7;
      case 8:
        v7 = @"ADStatusCodeAssetLoadFailure";
        return v7;
      case 9:
        v7 = @"ADStatusCodeAdResponseValidateFailure";
        return v7;
      case 10:
        v7 = @"ADStatusCodeAdAssetLoadPending";
        return v7;
      case 11:
        v7 = @"ADStatusCodeWaitingForResponse";
        return v7;
      case 12:
        v7 = @"ADStatusCodeNoAdDueToGlobalExclusion";
        return v7;
      case 13:
        v7 = @"ADStatusCodeNoAdDueToPolicyExclusion";
        return v7;
      case 14:
        v7 = @"ADStatusCodeBatchLimitExceeded";
        return v7;
      case 15:
        v7 = @"ADStatusCodeAdsDisabledInIssue";
        return v7;
      default:
        JUMPOUT(0);
    }
  }
  switch(a3)
  {
    case 3000:
      v7 = @"ADStatusCodeNoError";
      break;
    case 3001:
      v7 = @"ADStatusCodeAdNotAvailable";
      break;
    case 3002:
      v7 = @"ADStatusCodeSpacedTooCloseToAnAd";
      break;
    case 3003:
      v7 = @"ADStatusCodePlacedInFirstScreenful";
      break;
    case 3004:
      v7 = @"ADStatusCodeAdLoadedTooLate";
      break;
    case 3005:
      v7 = @"ADStatusCodeAdUnloadedExceedingContainer";
      break;
    case 3006:
      v7 = @"ADStatusCodeAdUnloadedMedusaResizing";
      break;
    case 3007:
      v7 = @"ADStatusCodeAdGlobalCategoryBlacklisted";
      break;
    case 3008:
      v7 = @"ADStatusCodeAdGlobalKeywordBlacklisted";
      break;
    case 3009:
      v7 = @"ADStatusCodeAdCampaignCategoryBlacklisted";
      break;
    case 3010:
      v7 = @"ADStatusCodeAdCampaignKeywordBlacklisted";
      break;
    case 3011:
      v7 = @"ADStatusCodeAdMetadataError";
      break;
    case 3012:
      v7 = @"ADStatusCodeAdArticleLoadError";
      break;
    case 3013:
      v7 = @"ADStatusCodeAdVideoLoadError";
      break;
    default:
      if (a3 == 360)
      {
        v7 = @"ADStatusCodeNoAdDueToSubscriptionStatus";
      }
      else
      {
        v7 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
LABEL_97:
      }
      break;
  }
  return v7;
}

- (int)StringAsStatusCode:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"ADStatusCodeUnknown"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"ADStatusCodeServerFailure"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"ADStatusCodeLoadingThrottled"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"ADStatusCodeInventoryUnavailable"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"ADStatusCodeConfigurationError"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"ADStatusCodeBannerVisibleWithoutContent"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"ADStatusCodeApplicationInactive"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"ADStatusCodeAdUnloaded"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"ADStatusCodeAssetLoadFailure"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"ADStatusCodeAdResponseValidateFailure"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"ADStatusCodeAdAssetLoadPending"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"ADStatusCodeWaitingForResponse"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"ADStatusCodeNoAdDueToGlobalExclusion"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"ADStatusCodeNoAdDueToPolicyExclusion"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"ADStatusCodeBatchLimitExceeded"])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:@"ADStatusCodeAdsDisabledInIssue"])
  {
    int v4 = 15;
  }
  else if ([v3 isEqualToString:@"ADStatusCodeNoAdDueToSubscriptionStatus"])
  {
    int v4 = 360;
  }
  else if ([v3 isEqualToString:@"ADStatusCodeNoError"])
  {
    int v4 = 3000;
  }
  else if ([v3 isEqualToString:@"ADStatusCodeAdNotAvailable"])
  {
    int v4 = 3001;
  }
  else if ([v3 isEqualToString:@"ADStatusCodeSpacedTooCloseToAnAd"])
  {
    int v4 = 3002;
  }
  else if ([v3 isEqualToString:@"ADStatusCodePlacedInFirstScreenful"])
  {
    int v4 = 3003;
  }
  else if ([v3 isEqualToString:@"ADStatusCodeAdLoadedTooLate"])
  {
    int v4 = 3004;
  }
  else if ([v3 isEqualToString:@"ADStatusCodeAdUnloadedExceedingContainer"])
  {
    int v4 = 3005;
  }
  else if ([v3 isEqualToString:@"ADStatusCodeAdUnloadedMedusaResizing"])
  {
    int v4 = 3006;
  }
  else if ([v3 isEqualToString:@"ADStatusCodeAdGlobalCategoryBlacklisted"])
  {
    int v4 = 3007;
  }
  else if ([v3 isEqualToString:@"ADStatusCodeAdGlobalKeywordBlacklisted"])
  {
    int v4 = 3008;
  }
  else if ([v3 isEqualToString:@"ADStatusCodeAdCampaignCategoryBlacklisted"])
  {
    int v4 = 3009;
  }
  else if ([v3 isEqualToString:@"ADStatusCodeAdCampaignKeywordBlacklisted"])
  {
    int v4 = 3010;
  }
  else if ([v3 isEqualToString:@"ADStatusCodeAdMetadataError"])
  {
    int v4 = 3011;
  }
  else if ([v3 isEqualToString:@"ADStatusCodeAdArticleLoadError"])
  {
    int v4 = 3012;
  }
  else if ([v3 isEqualToString:@"ADStatusCodeAdVideoLoadError"])
  {
    int v4 = 3013;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasOsVersionAndBuild
{
  return self->_osVersionAndBuild != 0;
}

- (BOOL)hasDPID
{
  return self->_dPID != 0;
}

- (BOOL)hasBundleID
{
  return self->_bundleID != 0;
}

- (void)setAdReused:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_adReused = a3;
}

- (void)setHasAdReused:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasAdReused
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (BOOL)hasContextJSON
{
  return self->_contextJSON != 0;
}

- (void)setSlotPosition:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_slotPosition = a3;
}

- (void)setHasSlotPosition:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasSlotPosition
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)APPBAdSpaceStatusEventRequest;
  char v3 = [(APPBAdSpaceStatusEventRequest *)&v7 description];
  int v4 = [(APPBAdSpaceStatusEventRequest *)self dictionaryRepresentation];
  uint64_t v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  uint64_t v5 = +[NSMutableDictionary dictionary];
  v6 = v5;
  adServerResponseIdentifier = self->_adServerResponseIdentifier;
  if (adServerResponseIdentifier) {
    [v5 setObject:adServerResponseIdentifier forKey:@"adServerResponseIdentifier"];
  }
  adOriginIdentifier = self->_adOriginIdentifier;
  if (adOriginIdentifier) {
    [v6 setObject:adOriginIdentifier forKey:@"adOriginIdentifier"];
  }
  anonymousDemandiAdID = self->_anonymousDemandiAdID;
  if (anonymousDemandiAdID) {
    [v6 setObject:anonymousDemandiAdID forKey:@"anonymousDemandiAdID"];
  }
  contentiAdID = self->_contentiAdID;
  if (contentiAdID) {
    [v6 setObject:contentiAdID forKey:@"contentiAdID"];
  }
  iAdID = self->_iAdID;
  if (iAdID) {
    [v6 setObject:iAdID forKey:@"iAdID"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v13 = +[NSNumber numberWithDouble:self->_timestamp];
    [v6 setObject:v13 forKey:@"timestamp"];

    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_13:
      if ((has & 4) == 0) {
        goto LABEL_14;
      }
      goto LABEL_19;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_13;
  }
  v14 = +[NSNumber numberWithDouble:self->_responseTime];
  [v6 setObject:v14 forKey:@"responseTime"];

  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_14:
    if ((has & 0x40) == 0) {
      goto LABEL_15;
    }
    goto LABEL_20;
  }
LABEL_19:
  v15 = +[NSNumber numberWithInt:self->_screenfuls];
  [v6 setObject:v15 forKey:@"screenfuls"];

  char has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_15:
    if ((has & 0x10) == 0) {
      goto LABEL_58;
    }
    goto LABEL_21;
  }
LABEL_20:
  v16 = +[NSNumber numberWithBool:self->_firstMessage];
  [v6 setObject:v16 forKey:@"firstMessage"];

  if ((*(unsigned char *)&self->_has & 0x10) == 0) {
    goto LABEL_58;
  }
LABEL_21:
  int statusCode = self->_statusCode;
  if (!v4 & v3)
  {
    int v18 = statusCode - 3000;
    uint64_t v19 = (statusCode - 3000);
    switch(v18)
    {
      case 0:
        v20 = @"ADStatusCodeNoError";
        break;
      case 1:
        v20 = @"ADStatusCodeAdNotAvailable";
        break;
      case 2:
        v20 = @"ADStatusCodeSpacedTooCloseToAnAd";
        break;
      case 3:
        v20 = @"ADStatusCodePlacedInFirstScreenful";
        break;
      case 4:
        v20 = @"ADStatusCodeAdLoadedTooLate";
        break;
      case 5:
        v20 = @"ADStatusCodeAdUnloadedExceedingContainer";
        break;
      case 6:
        v20 = @"ADStatusCodeAdUnloadedMedusaResizing";
        break;
      case 7:
        v20 = @"ADStatusCodeAdGlobalCategoryBlacklisted";
        break;
      case 8:
        v20 = @"ADStatusCodeAdGlobalKeywordBlacklisted";
        break;
      case 9:
        v20 = @"ADStatusCodeAdCampaignCategoryBlacklisted";
        break;
      case 10:
        v20 = @"ADStatusCodeAdCampaignKeywordBlacklisted";
        break;
      case 11:
        v20 = @"ADStatusCodeAdMetadataError";
        break;
      case 12:
        v20 = @"ADStatusCodeAdArticleLoadError";
        break;
      case 13:
        v20 = @"ADStatusCodeAdVideoLoadError";
        break;
      default:
        if (v19 == 360)
        {
          v20 = @"ADStatusCodeNoAdDueToSubscriptionStatus";
        }
        else
        {
          v20 = +[NSString stringWithFormat:@"(unknown: %i)", v19];
        }
        break;
    }
  }
  else
  {
    v20 = @"ADStatusCodeUnknown";
    switch(statusCode)
    {
      case 0:
        break;
      case 1:
        v20 = @"ADStatusCodeServerFailure";
        break;
      case 2:
        v20 = @"ADStatusCodeLoadingThrottled";
        break;
      case 3:
        v20 = @"ADStatusCodeInventoryUnavailable";
        break;
      case 4:
        v20 = @"ADStatusCodeConfigurationError";
        break;
      case 5:
        v20 = @"ADStatusCodeBannerVisibleWithoutContent";
        break;
      case 6:
        v20 = @"ADStatusCodeApplicationInactive";
        break;
      case 7:
        v20 = @"ADStatusCodeAdUnloaded";
        break;
      case 8:
        v20 = @"ADStatusCodeAssetLoadFailure";
        break;
      case 9:
        v20 = @"ADStatusCodeAdResponseValidateFailure";
        break;
      case 10:
        v20 = @"ADStatusCodeAdAssetLoadPending";
        break;
      case 11:
        v20 = @"ADStatusCodeWaitingForResponse";
        break;
      case 12:
        v20 = @"ADStatusCodeNoAdDueToGlobalExclusion";
        break;
      case 13:
        v20 = @"ADStatusCodeNoAdDueToPolicyExclusion";
        break;
      case 14:
        v20 = @"ADStatusCodeBatchLimitExceeded";
        break;
      case 15:
        v20 = @"ADStatusCodeAdsDisabledInIssue";
        break;
      default:
        JUMPOUT(0);
    }
  }
  [v6 setObject:v20 forKey:@"statusCode"];

LABEL_58:
  osVersionAndBuild = self->_osVersionAndBuild;
  if (osVersionAndBuild) {
    [v6 setObject:osVersionAndBuild forKey:@"osVersionAndBuild"];
  }
  dPID = self->_dPID;
  if (dPID) {
    [v6 setObject:dPID forKey:@"DPID"];
  }
  bundleID = self->_bundleID;
  if (bundleID) {
    [v6 setObject:bundleID forKey:@"bundleID"];
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    v24 = +[NSNumber numberWithBool:self->_adReused];
    [v6 setObject:v24 forKey:@"adReused"];
  }
  contextJSON = self->_contextJSON;
  if (contextJSON) {
    [v6 setObject:contextJSON forKey:@"contextJSON"];
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    v26 = +[NSNumber numberWithInt:self->_slotPosition];
    [v6 setObject:v26 forKey:@"slotPosition"];
  }

  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return APPBAdSpaceStatusEventRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_adServerResponseIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_adOriginIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_anonymousDemandiAdID)
  {
    PBDataWriterWriteDataField();
    id v4 = v6;
  }
  if (self->_contentiAdID)
  {
    PBDataWriterWriteDataField();
    id v4 = v6;
  }
  if (self->_iAdID)
  {
    PBDataWriterWriteDataField();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_13:
      if ((has & 4) == 0) {
        goto LABEL_14;
      }
      goto LABEL_34;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_13;
  }
  PBDataWriterWriteDoubleField();
  id v4 = v6;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_14:
    if ((has & 0x40) == 0) {
      goto LABEL_15;
    }
    goto LABEL_35;
  }
LABEL_34:
  PBDataWriterWriteInt32Field();
  id v4 = v6;
  char has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_15:
    if ((has & 0x10) == 0) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
LABEL_35:
  PBDataWriterWriteBOOLField();
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_16:
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
LABEL_17:
  if (self->_osVersionAndBuild)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_dPID)
  {
    PBDataWriterWriteDataField();
    id v4 = v6;
  }
  if (self->_bundleID)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
  }
  if (self->_contextJSON)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_adServerResponseIdentifier)
  {
    [v4 setAdServerResponseIdentifier:];
    id v4 = v6;
  }
  if (self->_adOriginIdentifier)
  {
    [v6 setAdOriginIdentifier:];
    id v4 = v6;
  }
  if (self->_anonymousDemandiAdID)
  {
    [v6 setAnonymousDemandiAdID:];
    id v4 = v6;
  }
  if (self->_contentiAdID)
  {
    [v6 setContentiAdID:];
    id v4 = v6;
  }
  if (self->_iAdID)
  {
    [v6 setIAdID:];
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((void *)v4 + 2) = *(void *)&self->_timestamp;
    *((unsigned char *)v4 + 112) |= 2u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_13:
      if ((has & 4) == 0) {
        goto LABEL_14;
      }
      goto LABEL_34;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_13;
  }
  *((void *)v4 + 1) = *(void *)&self->_responseTime;
  *((unsigned char *)v4 + 112) |= 1u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_14:
    if ((has & 0x40) == 0) {
      goto LABEL_15;
    }
    goto LABEL_35;
  }
LABEL_34:
  *((_DWORD *)v4 + 24) = self->_screenfuls;
  *((unsigned char *)v4 + 112) |= 4u;
  char has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_15:
    if ((has & 0x10) == 0) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
LABEL_35:
  *((unsigned char *)v4 + 109) = self->_firstMessage;
  *((unsigned char *)v4 + 112) |= 0x40u;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_16:
    *((_DWORD *)v4 + 26) = self->_statusCode;
    *((unsigned char *)v4 + 112) |= 0x10u;
  }
LABEL_17:
  if (self->_osVersionAndBuild)
  {
    [v6 setOsVersionAndBuild:];
    id v4 = v6;
  }
  if (self->_dPID)
  {
    [v6 setDPID:];
    id v4 = v6;
  }
  if (self->_bundleID)
  {
    [v6 setBundleID:];
    id v4 = v6;
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    *((unsigned char *)v4 + 108) = self->_adReused;
    *((unsigned char *)v4 + 112) |= 0x20u;
  }
  if (self->_contextJSON)
  {
    [v6 setContextJSON:];
    id v4 = v6;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    *((_DWORD *)v4 + 25) = self->_slotPosition;
    *((unsigned char *)v4 + 112) |= 8u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [[objc_opt_class() allocWithZone:a3] init];
  id v6 = [(NSString *)self->_adServerResponseIdentifier copyWithZone:a3];
  objc_super v7 = (void *)v5[4];
  v5[4] = v6;

  id v8 = [(NSString *)self->_adOriginIdentifier copyWithZone:a3];
  v9 = (void *)v5[3];
  v5[3] = v8;

  id v10 = [(NSData *)self->_anonymousDemandiAdID copyWithZone:a3];
  v11 = (void *)v5[5];
  v5[5] = v10;

  id v12 = [(NSData *)self->_contentiAdID copyWithZone:a3];
  v13 = (void *)v5[7];
  v5[7] = v12;

  id v14 = [(NSData *)self->_iAdID copyWithZone:a3];
  v15 = (void *)v5[10];
  v5[10] = v14;

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v5[2] = *(void *)&self->_timestamp;
    *((unsigned char *)v5 + 112) |= 2u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  v5[1] = *(void *)&self->_responseTime;
  *((unsigned char *)v5 + 112) |= 1u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 0x40) == 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  *((_DWORD *)v5 + 24) = self->_screenfuls;
  *((unsigned char *)v5 + 112) |= 4u;
  char has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_15:
  *((unsigned char *)v5 + 109) = self->_firstMessage;
  *((unsigned char *)v5 + 112) |= 0x40u;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_6:
    *((_DWORD *)v5 + 26) = self->_statusCode;
    *((unsigned char *)v5 + 112) |= 0x10u;
  }
LABEL_7:
  id v17 = [(NSString *)self->_osVersionAndBuild copyWithZone:a3];
  int v18 = (void *)v5[11];
  v5[11] = v17;

  id v19 = [(NSData *)self->_dPID copyWithZone:a3];
  v20 = (void *)v5[9];
  v5[9] = v19;

  id v21 = [(NSString *)self->_bundleID copyWithZone:a3];
  v22 = (void *)v5[6];
  v5[6] = v21;

  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    *((unsigned char *)v5 + 108) = self->_adReused;
    *((unsigned char *)v5 + 112) |= 0x20u;
  }
  id v23 = [(NSString *)self->_contextJSON copyWithZone:a3];
  v24 = (void *)v5[8];
  v5[8] = v23;

  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    *((_DWORD *)v5 + 25) = self->_slotPosition;
    *((unsigned char *)v5 + 112) |= 8u;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_62;
  }
  adServerResponseIdentifier = self->_adServerResponseIdentifier;
  if ((unint64_t)adServerResponseIdentifier | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](adServerResponseIdentifier, "isEqual:")) {
      goto LABEL_62;
    }
  }
  adOriginIdentifier = self->_adOriginIdentifier;
  if ((unint64_t)adOriginIdentifier | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](adOriginIdentifier, "isEqual:")) {
      goto LABEL_62;
    }
  }
  anonymousDemandiAdID = self->_anonymousDemandiAdID;
  if ((unint64_t)anonymousDemandiAdID | *((void *)v4 + 5))
  {
    if (!-[NSData isEqual:](anonymousDemandiAdID, "isEqual:")) {
      goto LABEL_62;
    }
  }
  contentiAdID = self->_contentiAdID;
  if ((unint64_t)contentiAdID | *((void *)v4 + 7))
  {
    if (!-[NSData isEqual:](contentiAdID, "isEqual:")) {
      goto LABEL_62;
    }
  }
  iAdID = self->_iAdID;
  if ((unint64_t)iAdID | *((void *)v4 + 10))
  {
    if (!-[NSData isEqual:](iAdID, "isEqual:")) {
      goto LABEL_62;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 112) & 2) == 0 || self->_timestamp != *((double *)v4 + 2)) {
      goto LABEL_62;
    }
  }
  else if ((*((unsigned char *)v4 + 112) & 2) != 0)
  {
    goto LABEL_62;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 112) & 1) == 0 || self->_responseTime != *((double *)v4 + 1)) {
      goto LABEL_62;
    }
  }
  else if (*((unsigned char *)v4 + 112))
  {
    goto LABEL_62;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 112) & 4) == 0 || self->_screenfuls != *((_DWORD *)v4 + 24)) {
      goto LABEL_62;
    }
  }
  else if ((*((unsigned char *)v4 + 112) & 4) != 0)
  {
    goto LABEL_62;
  }
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
    if ((*((unsigned char *)v4 + 112) & 0x40) == 0) {
      goto LABEL_62;
    }
    if (self->_firstMessage)
    {
      if (!*((unsigned char *)v4 + 109)) {
        goto LABEL_62;
      }
    }
    else if (*((unsigned char *)v4 + 109))
    {
      goto LABEL_62;
    }
  }
  else if ((*((unsigned char *)v4 + 112) & 0x40) != 0)
  {
    goto LABEL_62;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 112) & 0x10) == 0 || self->_statusCode != *((_DWORD *)v4 + 26)) {
      goto LABEL_62;
    }
  }
  else if ((*((unsigned char *)v4 + 112) & 0x10) != 0)
  {
    goto LABEL_62;
  }
  osVersionAndBuild = self->_osVersionAndBuild;
  if ((unint64_t)osVersionAndBuild | *((void *)v4 + 11)
    && !-[NSString isEqual:](osVersionAndBuild, "isEqual:"))
  {
    goto LABEL_62;
  }
  dPID = self->_dPID;
  if ((unint64_t)dPID | *((void *)v4 + 9))
  {
    if (!-[NSData isEqual:](dPID, "isEqual:")) {
      goto LABEL_62;
    }
  }
  bundleID = self->_bundleID;
  if ((unint64_t)bundleID | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](bundleID, "isEqual:")) {
      goto LABEL_62;
    }
  }
  char has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    if ((*((unsigned char *)v4 + 112) & 0x20) == 0) {
      goto LABEL_62;
    }
    if (self->_adReused)
    {
      if (!*((unsigned char *)v4 + 108)) {
        goto LABEL_62;
      }
    }
    else if (*((unsigned char *)v4 + 108))
    {
      goto LABEL_62;
    }
  }
  else if ((*((unsigned char *)v4 + 112) & 0x20) != 0)
  {
    goto LABEL_62;
  }
  contextJSON = self->_contextJSON;
  if (!((unint64_t)contextJSON | *((void *)v4 + 8))) {
    goto LABEL_57;
  }
  if (!-[NSString isEqual:](contextJSON, "isEqual:"))
  {
LABEL_62:
    BOOL v15 = 0;
    goto LABEL_63;
  }
  char has = (char)self->_has;
LABEL_57:
  if ((has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 112) & 8) == 0 || self->_slotPosition != *((_DWORD *)v4 + 25)) {
      goto LABEL_62;
    }
    BOOL v15 = 1;
  }
  else
  {
    BOOL v15 = (*((unsigned char *)v4 + 112) & 8) == 0;
  }
LABEL_63:

  return v15;
}

- (unint64_t)hash
{
  NSUInteger v29 = [(NSString *)self->_adServerResponseIdentifier hash];
  NSUInteger v28 = [(NSString *)self->_adOriginIdentifier hash];
  unint64_t v27 = (unint64_t)[(NSData *)self->_anonymousDemandiAdID hash];
  unint64_t v26 = (unint64_t)[(NSData *)self->_contentiAdID hash];
  unint64_t v25 = (unint64_t)[(NSData *)self->_iAdID hash];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    double timestamp = self->_timestamp;
    double v6 = -timestamp;
    if (timestamp >= 0.0) {
      double v6 = self->_timestamp;
    }
    long double v7 = floor(v6 + 0.5);
    double v8 = (v6 - v7) * 1.84467441e19;
    unint64_t v4 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0) {
        v4 += (unint64_t)v8;
      }
    }
    else
    {
      v4 -= (unint64_t)fabs(v8);
    }
  }
  else
  {
    unint64_t v4 = 0;
  }
  unint64_t v24 = v4;
  if (has)
  {
    double responseTime = self->_responseTime;
    double v11 = -responseTime;
    if (responseTime >= 0.0) {
      double v11 = self->_responseTime;
    }
    long double v12 = floor(v11 + 0.5);
    double v13 = (v11 - v12) * 1.84467441e19;
    unint64_t v9 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0) {
        v9 += (unint64_t)v13;
      }
    }
    else
    {
      v9 -= (unint64_t)fabs(v13);
    }
  }
  else
  {
    unint64_t v9 = 0;
  }
  if ((has & 4) == 0)
  {
    uint64_t v23 = 0;
    if ((has & 0x40) != 0) {
      goto LABEL_19;
    }
LABEL_22:
    uint64_t v14 = 0;
    if ((has & 0x10) != 0) {
      goto LABEL_20;
    }
    goto LABEL_23;
  }
  uint64_t v23 = 2654435761 * self->_screenfuls;
  if ((has & 0x40) == 0) {
    goto LABEL_22;
  }
LABEL_19:
  uint64_t v14 = 2654435761 * self->_firstMessage;
  if ((has & 0x10) != 0)
  {
LABEL_20:
    uint64_t v15 = 2654435761 * self->_statusCode;
    goto LABEL_24;
  }
LABEL_23:
  uint64_t v15 = 0;
LABEL_24:
  NSUInteger v16 = [(NSString *)self->_osVersionAndBuild hash];
  unint64_t v17 = (unint64_t)[(NSData *)self->_dPID hash];
  NSUInteger v18 = [(NSString *)self->_bundleID hash];
  if ((*(unsigned char *)&self->_has & 0x20) != 0) {
    uint64_t v19 = 2654435761 * self->_adReused;
  }
  else {
    uint64_t v19 = 0;
  }
  NSUInteger v20 = [(NSString *)self->_contextJSON hash];
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    uint64_t v21 = 2654435761 * self->_slotPosition;
  }
  else {
    uint64_t v21 = 0;
  }
  return v28 ^ v29 ^ v27 ^ v26 ^ v25 ^ v24 ^ v9 ^ v23 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (*((void *)v4 + 4))
  {
    -[APPBAdSpaceStatusEventRequest setAdServerResponseIdentifier:](self, "setAdServerResponseIdentifier:");
    id v4 = v6;
  }
  if (*((void *)v4 + 3))
  {
    -[APPBAdSpaceStatusEventRequest setAdOriginIdentifier:](self, "setAdOriginIdentifier:");
    id v4 = v6;
  }
  if (*((void *)v4 + 5))
  {
    -[APPBAdSpaceStatusEventRequest setAnonymousDemandiAdID:](self, "setAnonymousDemandiAdID:");
    id v4 = v6;
  }
  if (*((void *)v4 + 7))
  {
    -[APPBAdSpaceStatusEventRequest setContentiAdID:](self, "setContentiAdID:");
    id v4 = v6;
  }
  if (*((void *)v4 + 10))
  {
    -[APPBAdSpaceStatusEventRequest setIAdID:](self, "setIAdID:");
    id v4 = v6;
  }
  char v5 = *((unsigned char *)v4 + 112);
  if ((v5 & 2) != 0)
  {
    self->_double timestamp = *((double *)v4 + 2);
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)v4 + 112);
    if ((v5 & 1) == 0)
    {
LABEL_13:
      if ((v5 & 4) == 0) {
        goto LABEL_14;
      }
      goto LABEL_34;
    }
  }
  else if ((*((unsigned char *)v4 + 112) & 1) == 0)
  {
    goto LABEL_13;
  }
  self->_double responseTime = *((double *)v4 + 1);
  *(unsigned char *)&self->_has |= 1u;
  char v5 = *((unsigned char *)v4 + 112);
  if ((v5 & 4) == 0)
  {
LABEL_14:
    if ((v5 & 0x40) == 0) {
      goto LABEL_15;
    }
    goto LABEL_35;
  }
LABEL_34:
  self->_screenfuls = *((_DWORD *)v4 + 24);
  *(unsigned char *)&self->_has |= 4u;
  char v5 = *((unsigned char *)v4 + 112);
  if ((v5 & 0x40) == 0)
  {
LABEL_15:
    if ((v5 & 0x10) == 0) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
LABEL_35:
  self->_firstMessage = *((unsigned char *)v4 + 109);
  *(unsigned char *)&self->_has |= 0x40u;
  if ((*((unsigned char *)v4 + 112) & 0x10) != 0)
  {
LABEL_16:
    self->_int statusCode = *((_DWORD *)v4 + 26);
    *(unsigned char *)&self->_has |= 0x10u;
  }
LABEL_17:
  if (*((void *)v4 + 11))
  {
    -[APPBAdSpaceStatusEventRequest setOsVersionAndBuild:](self, "setOsVersionAndBuild:");
    id v4 = v6;
  }
  if (*((void *)v4 + 9))
  {
    -[APPBAdSpaceStatusEventRequest setDPID:](self, "setDPID:");
    id v4 = v6;
  }
  if (*((void *)v4 + 6))
  {
    -[APPBAdSpaceStatusEventRequest setBundleID:](self, "setBundleID:");
    id v4 = v6;
  }
  if ((*((unsigned char *)v4 + 112) & 0x20) != 0)
  {
    self->_adReused = *((unsigned char *)v4 + 108);
    *(unsigned char *)&self->_has |= 0x20u;
  }
  if (*((void *)v4 + 8))
  {
    -[APPBAdSpaceStatusEventRequest setContextJSON:](self, "setContextJSON:");
    id v4 = v6;
  }
  if ((*((unsigned char *)v4 + 112) & 8) != 0)
  {
    self->_slotPosition = *((_DWORD *)v4 + 25);
    *(unsigned char *)&self->_has |= 8u;
  }
}

- (NSString)adServerResponseIdentifier
{
  return self->_adServerResponseIdentifier;
}

- (void)setAdServerResponseIdentifier:(id)a3
{
}

- (NSString)adOriginIdentifier
{
  return self->_adOriginIdentifier;
}

- (void)setAdOriginIdentifier:(id)a3
{
}

- (NSData)anonymousDemandiAdID
{
  return self->_anonymousDemandiAdID;
}

- (void)setAnonymousDemandiAdID:(id)a3
{
}

- (NSData)contentiAdID
{
  return self->_contentiAdID;
}

- (void)setContentiAdID:(id)a3
{
}

- (NSData)iAdID
{
  return self->_iAdID;
}

- (void)setIAdID:(id)a3
{
}

- (double)timestamp
{
  return self->_timestamp;
}

- (double)responseTime
{
  return self->_responseTime;
}

- (int)screenfuls
{
  return self->_screenfuls;
}

- (BOOL)firstMessage
{
  return self->_firstMessage;
}

- (NSString)osVersionAndBuild
{
  return self->_osVersionAndBuild;
}

- (void)setOsVersionAndBuild:(id)a3
{
}

- (NSData)dPID
{
  return self->_dPID;
}

- (void)setDPID:(id)a3
{
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (BOOL)adReused
{
  return self->_adReused;
}

- (NSString)contextJSON
{
  return self->_contextJSON;
}

- (void)setContextJSON:(id)a3
{
}

- (int)slotPosition
{
  return self->_slotPosition;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_osVersionAndBuild, 0);
  objc_storeStrong((id *)&self->_iAdID, 0);
  objc_storeStrong((id *)&self->_dPID, 0);
  objc_storeStrong((id *)&self->_contextJSON, 0);
  objc_storeStrong((id *)&self->_contentiAdID, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_anonymousDemandiAdID, 0);
  objc_storeStrong((id *)&self->_adServerResponseIdentifier, 0);

  objc_storeStrong((id *)&self->_adOriginIdentifier, 0);
}

@end