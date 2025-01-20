@interface AWDCaptiveSession
+ (Class)installedCNPDisplayIDsType;
- (BOOL)autoLoginFailed;
- (BOOL)detectedNotCaptiveHandledByCNP;
- (BOOL)handlerCNPTriggeredLogOff;
- (BOOL)hasAppTriggeredPassiveSymptom;
- (BOOL)hasAutoLoginCarrierID;
- (BOOL)hasAutoLoginFailed;
- (BOOL)hasAutoLoginType;
- (BOOL)hasDetectedNotCaptiveHandledByCNP;
- (BOOL)hasDurationNetworkNotCaptive;
- (BOOL)hasDurationOnNetwork;
- (BOOL)hasHandlerCNP;
- (BOOL)hasHandlerCNPTriggeredLogOff;
- (BOOL)hasIsDetectedCaptive;
- (BOOL)hasNonCaptiveDetectedAsCaptive;
- (BOOL)hasPassiveCaptivityCorrectDetection;
- (BOOL)hasPassiveCaptivityDetected;
- (BOOL)hasPassiveCaptivityIncorrectDetection;
- (BOOL)hasPassiveCaptivitySymptom;
- (BOOL)hasRedirectURLType;
- (BOOL)hasResult;
- (BOOL)hasTimestamp;
- (BOOL)hasWebsheetProbeCount;
- (BOOL)hasWebsheetScrapeResult;
- (BOOL)hasWebsheetScraped;
- (BOOL)hasWhiteListProbeCompletionTime;
- (BOOL)hasWhiteListProbeStatus;
- (BOOL)hasWisprDetected;
- (BOOL)isDetectedCaptive;
- (BOOL)isEqual:(id)a3;
- (BOOL)nonCaptiveDetectedAsCaptive;
- (BOOL)passiveCaptivityDetected;
- (BOOL)readFrom:(id)a3;
- (BOOL)websheetScraped;
- (BOOL)wisprDetected;
- (NSMutableArray)installedCNPDisplayIDs;
- (NSString)appTriggeredPassiveSymptom;
- (NSString)autoLoginCarrierID;
- (NSString)handlerCNP;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)installedCNPDisplayIDsAtIndex:(unint64_t)a3;
- (id)redirectURLTypeAsString:(int)a3;
- (id)whiteListProbeStatusAsString:(int)a3;
- (int)StringAsRedirectURLType:(id)a3;
- (int)StringAsWhiteListProbeStatus:(id)a3;
- (int)redirectURLType;
- (int)whiteListProbeStatus;
- (unint64_t)hash;
- (unint64_t)installedCNPDisplayIDsCount;
- (unint64_t)timestamp;
- (unsigned)autoLoginType;
- (unsigned)durationNetworkNotCaptive;
- (unsigned)durationOnNetwork;
- (unsigned)passiveCaptivityCorrectDetection;
- (unsigned)passiveCaptivityIncorrectDetection;
- (unsigned)passiveCaptivitySymptom;
- (unsigned)result;
- (unsigned)websheetProbeCount;
- (unsigned)websheetScrapeResult;
- (unsigned)whiteListProbeCompletionTime;
- (void)addInstalledCNPDisplayIDs:(id)a3;
- (void)clearInstalledCNPDisplayIDs;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setAppTriggeredPassiveSymptom:(id)a3;
- (void)setAutoLoginCarrierID:(id)a3;
- (void)setAutoLoginFailed:(BOOL)a3;
- (void)setAutoLoginType:(unsigned int)a3;
- (void)setDetectedNotCaptiveHandledByCNP:(BOOL)a3;
- (void)setDurationNetworkNotCaptive:(unsigned int)a3;
- (void)setDurationOnNetwork:(unsigned int)a3;
- (void)setHandlerCNP:(id)a3;
- (void)setHandlerCNPTriggeredLogOff:(BOOL)a3;
- (void)setHasAutoLoginFailed:(BOOL)a3;
- (void)setHasAutoLoginType:(BOOL)a3;
- (void)setHasDetectedNotCaptiveHandledByCNP:(BOOL)a3;
- (void)setHasDurationNetworkNotCaptive:(BOOL)a3;
- (void)setHasDurationOnNetwork:(BOOL)a3;
- (void)setHasHandlerCNPTriggeredLogOff:(BOOL)a3;
- (void)setHasIsDetectedCaptive:(BOOL)a3;
- (void)setHasNonCaptiveDetectedAsCaptive:(BOOL)a3;
- (void)setHasPassiveCaptivityCorrectDetection:(BOOL)a3;
- (void)setHasPassiveCaptivityDetected:(BOOL)a3;
- (void)setHasPassiveCaptivityIncorrectDetection:(BOOL)a3;
- (void)setHasPassiveCaptivitySymptom:(BOOL)a3;
- (void)setHasRedirectURLType:(BOOL)a3;
- (void)setHasResult:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHasWebsheetProbeCount:(BOOL)a3;
- (void)setHasWebsheetScrapeResult:(BOOL)a3;
- (void)setHasWebsheetScraped:(BOOL)a3;
- (void)setHasWhiteListProbeCompletionTime:(BOOL)a3;
- (void)setHasWhiteListProbeStatus:(BOOL)a3;
- (void)setHasWisprDetected:(BOOL)a3;
- (void)setInstalledCNPDisplayIDs:(id)a3;
- (void)setIsDetectedCaptive:(BOOL)a3;
- (void)setNonCaptiveDetectedAsCaptive:(BOOL)a3;
- (void)setPassiveCaptivityCorrectDetection:(unsigned int)a3;
- (void)setPassiveCaptivityDetected:(BOOL)a3;
- (void)setPassiveCaptivityIncorrectDetection:(unsigned int)a3;
- (void)setPassiveCaptivitySymptom:(unsigned int)a3;
- (void)setRedirectURLType:(int)a3;
- (void)setResult:(unsigned int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setWebsheetProbeCount:(unsigned int)a3;
- (void)setWebsheetScrapeResult:(unsigned int)a3;
- (void)setWebsheetScraped:(BOOL)a3;
- (void)setWhiteListProbeCompletionTime:(unsigned int)a3;
- (void)setWhiteListProbeStatus:(int)a3;
- (void)setWisprDetected:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDCaptiveSession

- (void)dealloc
{
  [(AWDCaptiveSession *)self setInstalledCNPDisplayIDs:0];
  [(AWDCaptiveSession *)self setHandlerCNP:0];
  [(AWDCaptiveSession *)self setAutoLoginCarrierID:0];
  [(AWDCaptiveSession *)self setAppTriggeredPassiveSymptom:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDCaptiveSession;
  [(AWDCaptiveSession *)&v3 dealloc];
}

- (void)setTimestamp:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  self->_has = ($141559A2C58CD4ACBDC768E89B51DA90)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasTimestamp
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setResult:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_result = a3;
}

- (void)setHasResult:(BOOL)a3
{
  if (a3) {
    int v3 = 256;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($141559A2C58CD4ACBDC768E89B51DA90)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasResult
{
  return *((unsigned char *)&self->_has + 1) & 1;
}

- (void)setWebsheetProbeCount:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_websheetProbeCount = a3;
}

- (void)setHasWebsheetProbeCount:(BOOL)a3
{
  if (a3) {
    int v3 = 512;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($141559A2C58CD4ACBDC768E89B51DA90)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasWebsheetProbeCount
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setWebsheetScraped:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x80000u;
  self->_websheetScraped = a3;
}

- (void)setHasWebsheetScraped:(BOOL)a3
{
  if (a3) {
    int v3 = 0x80000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($141559A2C58CD4ACBDC768E89B51DA90)(*(_DWORD *)&self->_has & 0xFFF7FFFF | v3);
}

- (BOOL)hasWebsheetScraped
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setWebsheetScrapeResult:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_websheetScrapeResult = a3;
}

- (void)setHasWebsheetScrapeResult:(BOOL)a3
{
  if (a3) {
    int v3 = 1024;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($141559A2C58CD4ACBDC768E89B51DA90)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasWebsheetScrapeResult
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)clearInstalledCNPDisplayIDs
{
}

- (void)addInstalledCNPDisplayIDs:(id)a3
{
  installedCNPDisplayIDs = self->_installedCNPDisplayIDs;
  if (!installedCNPDisplayIDs)
  {
    installedCNPDisplayIDs = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_installedCNPDisplayIDs = installedCNPDisplayIDs;
  }

  [(NSMutableArray *)installedCNPDisplayIDs addObject:a3];
}

- (unint64_t)installedCNPDisplayIDsCount
{
  return [(NSMutableArray *)self->_installedCNPDisplayIDs count];
}

- (id)installedCNPDisplayIDsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_installedCNPDisplayIDs objectAtIndex:a3];
}

+ (Class)installedCNPDisplayIDsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasHandlerCNP
{
  return self->_handlerCNP != 0;
}

- (void)setDetectedNotCaptiveHandledByCNP:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_detectedNotCaptiveHandledByCNP = a3;
}

- (void)setHasDetectedNotCaptiveHandledByCNP:(BOOL)a3
{
  if (a3) {
    int v3 = 0x4000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($141559A2C58CD4ACBDC768E89B51DA90)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasDetectedNotCaptiveHandledByCNP
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setAutoLoginType:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_autoLoginType = a3;
}

- (void)setHasAutoLoginType:(BOOL)a3
{
  if (a3) {
    int v3 = 2;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($141559A2C58CD4ACBDC768E89B51DA90)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasAutoLoginType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setAutoLoginFailed:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_autoLoginFailed = a3;
}

- (void)setHasAutoLoginFailed:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($141559A2C58CD4ACBDC768E89B51DA90)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasAutoLoginFailed
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (BOOL)hasAutoLoginCarrierID
{
  return self->_autoLoginCarrierID != 0;
}

- (void)setWisprDetected:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x100000u;
  self->_wisprDetected = a3;
}

- (void)setHasWisprDetected:(BOOL)a3
{
  if (a3) {
    int v3 = 0x100000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($141559A2C58CD4ACBDC768E89B51DA90)(*(_DWORD *)&self->_has & 0xFFEFFFFF | v3);
}

- (BOOL)hasWisprDetected
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (void)setPassiveCaptivityDetected:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_passiveCaptivityDetected = a3;
}

- (void)setHasPassiveCaptivityDetected:(BOOL)a3
{
  if (a3) {
    int v3 = 0x40000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($141559A2C58CD4ACBDC768E89B51DA90)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (BOOL)hasPassiveCaptivityDetected
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setPassiveCaptivityCorrectDetection:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_passiveCaptivityCorrectDetection = a3;
}

- (void)setHasPassiveCaptivityCorrectDetection:(BOOL)a3
{
  if (a3) {
    int v3 = 16;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($141559A2C58CD4ACBDC768E89B51DA90)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasPassiveCaptivityCorrectDetection
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setPassiveCaptivityIncorrectDetection:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_passiveCaptivityIncorrectDetection = a3;
}

- (void)setHasPassiveCaptivityIncorrectDetection:(BOOL)a3
{
  if (a3) {
    int v3 = 32;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($141559A2C58CD4ACBDC768E89B51DA90)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasPassiveCaptivityIncorrectDetection
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setHandlerCNPTriggeredLogOff:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_handlerCNPTriggeredLogOff = a3;
}

- (void)setHasHandlerCNPTriggeredLogOff:(BOOL)a3
{
  if (a3) {
    int v3 = 0x8000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($141559A2C58CD4ACBDC768E89B51DA90)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasHandlerCNPTriggeredLogOff
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setIsDetectedCaptive:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_isDetectedCaptive = a3;
}

- (void)setHasIsDetectedCaptive:(BOOL)a3
{
  if (a3) {
    int v3 = 0x10000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($141559A2C58CD4ACBDC768E89B51DA90)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasIsDetectedCaptive
{
  return *((unsigned char *)&self->_has + 2) & 1;
}

- (void)setDurationOnNetwork:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_durationOnNetwork = a3;
}

- (void)setHasDurationOnNetwork:(BOOL)a3
{
  if (a3) {
    int v3 = 8;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($141559A2C58CD4ACBDC768E89B51DA90)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasDurationOnNetwork
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setDurationNetworkNotCaptive:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_durationNetworkNotCaptive = a3;
}

- (void)setHasDurationNetworkNotCaptive:(BOOL)a3
{
  if (a3) {
    int v3 = 4;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($141559A2C58CD4ACBDC768E89B51DA90)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasDurationNetworkNotCaptive
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setPassiveCaptivitySymptom:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_passiveCaptivitySymptom = a3;
}

- (void)setHasPassiveCaptivitySymptom:(BOOL)a3
{
  if (a3) {
    int v3 = 64;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($141559A2C58CD4ACBDC768E89B51DA90)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasPassiveCaptivitySymptom
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (BOOL)hasAppTriggeredPassiveSymptom
{
  return self->_appTriggeredPassiveSymptom != 0;
}

- (void)setNonCaptiveDetectedAsCaptive:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_nonCaptiveDetectedAsCaptive = a3;
}

- (void)setHasNonCaptiveDetectedAsCaptive:(BOOL)a3
{
  if (a3) {
    int v3 = 0x20000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($141559A2C58CD4ACBDC768E89B51DA90)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasNonCaptiveDetectedAsCaptive
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (int)redirectURLType
{
  if ((*(unsigned char *)&self->_has & 0x80) != 0) {
    return self->_redirectURLType;
  }
  else {
    return 0;
  }
}

- (void)setRedirectURLType:(int)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_redirectURLType = a3;
}

- (void)setHasRedirectURLType:(BOOL)a3
{
  if (a3) {
    int v3 = 128;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($141559A2C58CD4ACBDC768E89B51DA90)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasRedirectURLType
{
  return *(unsigned char *)&self->_has >> 7;
}

- (id)redirectURLTypeAsString:(int)a3
{
  if (a3 >= 4) {
    return (id)[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else {
    return off_2641B94D8[a3];
  }
}

- (int)StringAsRedirectURLType:(id)a3
{
  if ([a3 isEqualToString:@"REDIRECT_URLTYPE_NONE"]) {
    return 0;
  }
  if ([a3 isEqualToString:@"REDIRECT_URLTYPE_HTTP"]) {
    return 1;
  }
  if ([a3 isEqualToString:@"REDIRECT_URLTYPE_HTTPS_TRUSTED_CERTIFICATE"]) {
    return 2;
  }
  if ([a3 isEqualToString:@"REDIRECT_URLTYPE_HTTPS_UNTRUSTED_CERTIFICATE"]) {
    return 3;
  }
  return 0;
}

- (int)whiteListProbeStatus
{
  if ((*((unsigned char *)&self->_has + 1) & 0x10) != 0) {
    return self->_whiteListProbeStatus;
  }
  else {
    return 0;
  }
}

- (void)setWhiteListProbeStatus:(int)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_whiteListProbeStatus = a3;
}

- (void)setHasWhiteListProbeStatus:(BOOL)a3
{
  if (a3) {
    int v3 = 4096;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($141559A2C58CD4ACBDC768E89B51DA90)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasWhiteListProbeStatus
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (id)whiteListProbeStatusAsString:(int)a3
{
  if (a3 >= 4) {
    return (id)[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else {
    return off_2641B94F8[a3];
  }
}

- (int)StringAsWhiteListProbeStatus:(id)a3
{
  if ([a3 isEqualToString:@"WHITELIST_PROBE_STATUS_NOT_PROBED"]) {
    return 0;
  }
  if ([a3 isEqualToString:@"WHITELIST_PROBE_STATUS_NOT_CAPTIVE"]) {
    return 1;
  }
  if ([a3 isEqualToString:@"WHITELIST_PROBE_STATUS_DETECTED_IMMEDIATELY"]) {
    return 2;
  }
  if ([a3 isEqualToString:@"WHITELIST_PROBE_STATUS_DETECTED_WHEN_TRIGGERED"]) {
    return 3;
  }
  return 0;
}

- (void)setWhiteListProbeCompletionTime:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_whiteListProbeCompletionTime = a3;
}

- (void)setHasWhiteListProbeCompletionTime:(BOOL)a3
{
  if (a3) {
    int v3 = 2048;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($141559A2C58CD4ACBDC768E89B51DA90)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasWhiteListProbeCompletionTime
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDCaptiveSession;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDCaptiveSession description](&v3, sel_description), -[AWDCaptiveSession dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  $141559A2C58CD4ACBDC768E89B51DA90 has = self->_has;
  if (*(unsigned char *)&has)
  {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
    $141559A2C58CD4ACBDC768E89B51DA90 has = self->_has;
    if ((*(_WORD *)&has & 0x100) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x200) == 0) {
        goto LABEL_4;
      }
      goto LABEL_37;
    }
  }
  else if ((*(_WORD *)&has & 0x100) == 0)
  {
    goto LABEL_3;
  }
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_result] forKey:@"result"];
  $141559A2C58CD4ACBDC768E89B51DA90 has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_4:
    if ((*(_DWORD *)&has & 0x80000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_38;
  }
LABEL_37:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_websheetProbeCount] forKey:@"websheetProbeCount"];
  $141559A2C58CD4ACBDC768E89B51DA90 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_38:
  [v3 setObject:[NSNumber numberWithBool:self->_websheetScraped] forKey:@"websheetScraped"];
  if ((*(_DWORD *)&self->_has & 0x400) != 0) {
LABEL_6:
  }
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_websheetScrapeResult] forKey:@"websheetScrapeResult"];
LABEL_7:
  installedCNPDisplayIDs = self->_installedCNPDisplayIDs;
  if (installedCNPDisplayIDs) {
    [v3 setObject:installedCNPDisplayIDs forKey:@"installedCNPDisplayIDs"];
  }
  handlerCNP = self->_handlerCNP;
  if (handlerCNP) {
    [v3 setObject:handlerCNP forKey:@"handlerCNP"];
  }
  $141559A2C58CD4ACBDC768E89B51DA90 v7 = self->_has;
  if ((*(_WORD *)&v7 & 0x4000) != 0)
  {
    [v3 setObject:[NSNumber numberWithBool:self->_detectedNotCaptiveHandledByCNP] forKey:@"detectedNotCaptiveHandledByCNP"];
    $141559A2C58CD4ACBDC768E89B51DA90 v7 = self->_has;
    if ((*(unsigned char *)&v7 & 2) == 0)
    {
LABEL_13:
      if ((*(_WORD *)&v7 & 0x2000) == 0) {
        goto LABEL_15;
      }
      goto LABEL_14;
    }
  }
  else if ((*(unsigned char *)&v7 & 2) == 0)
  {
    goto LABEL_13;
  }
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_autoLoginType] forKey:@"autoLoginType"];
  if ((*(_DWORD *)&self->_has & 0x2000) != 0) {
LABEL_14:
  }
    [v3 setObject:[NSNumber numberWithBool:self->_autoLoginFailed] forKey:@"autoLoginFailed"];
LABEL_15:
  autoLoginCarrierID = self->_autoLoginCarrierID;
  if (autoLoginCarrierID) {
    [v3 setObject:autoLoginCarrierID forKey:@"autoLoginCarrierID"];
  }
  $141559A2C58CD4ACBDC768E89B51DA90 v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x100000) != 0)
  {
    [v3 setObject:[NSNumber numberWithBool:self->_wisprDetected] forKey:@"wisprDetected"];
    $141559A2C58CD4ACBDC768E89B51DA90 v9 = self->_has;
    if ((*(_DWORD *)&v9 & 0x40000) == 0)
    {
LABEL_19:
      if ((*(unsigned char *)&v9 & 0x10) == 0) {
        goto LABEL_20;
      }
      goto LABEL_45;
    }
  }
  else if ((*(_DWORD *)&v9 & 0x40000) == 0)
  {
    goto LABEL_19;
  }
  [v3 setObject:[NSNumber numberWithBool:self->_passiveCaptivityDetected] forKey:@"passiveCaptivityDetected"];
  $141559A2C58CD4ACBDC768E89B51DA90 v9 = self->_has;
  if ((*(unsigned char *)&v9 & 0x10) == 0)
  {
LABEL_20:
    if ((*(unsigned char *)&v9 & 0x20) == 0) {
      goto LABEL_21;
    }
    goto LABEL_46;
  }
LABEL_45:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_passiveCaptivityCorrectDetection] forKey:@"passiveCaptivityCorrectDetection"];
  $141559A2C58CD4ACBDC768E89B51DA90 v9 = self->_has;
  if ((*(unsigned char *)&v9 & 0x20) == 0)
  {
LABEL_21:
    if ((*(_WORD *)&v9 & 0x8000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_47;
  }
LABEL_46:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_passiveCaptivityIncorrectDetection] forKey:@"passiveCaptivityIncorrectDetection"];
  $141559A2C58CD4ACBDC768E89B51DA90 v9 = self->_has;
  if ((*(_WORD *)&v9 & 0x8000) == 0)
  {
LABEL_22:
    if ((*(_DWORD *)&v9 & 0x10000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_48;
  }
LABEL_47:
  [v3 setObject:[NSNumber numberWithBool:self->_handlerCNPTriggeredLogOff] forKey:@"handlerCNPTriggeredLogOff"];
  $141559A2C58CD4ACBDC768E89B51DA90 v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x10000) == 0)
  {
LABEL_23:
    if ((*(unsigned char *)&v9 & 8) == 0) {
      goto LABEL_24;
    }
    goto LABEL_49;
  }
LABEL_48:
  [v3 setObject:[NSNumber numberWithBool:self->_isDetectedCaptive] forKey:@"isDetectedCaptive"];
  $141559A2C58CD4ACBDC768E89B51DA90 v9 = self->_has;
  if ((*(unsigned char *)&v9 & 8) == 0)
  {
LABEL_24:
    if ((*(unsigned char *)&v9 & 4) == 0) {
      goto LABEL_25;
    }
    goto LABEL_50;
  }
LABEL_49:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_durationOnNetwork] forKey:@"durationOnNetwork"];
  $141559A2C58CD4ACBDC768E89B51DA90 v9 = self->_has;
  if ((*(unsigned char *)&v9 & 4) == 0)
  {
LABEL_25:
    if ((*(unsigned char *)&v9 & 0x40) == 0) {
      goto LABEL_27;
    }
    goto LABEL_26;
  }
LABEL_50:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_durationNetworkNotCaptive] forKey:@"durationNetworkNotCaptive"];
  if ((*(_DWORD *)&self->_has & 0x40) != 0) {
LABEL_26:
  }
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_passiveCaptivitySymptom] forKey:@"passiveCaptivitySymptom"];
LABEL_27:
  appTriggeredPassiveSymptom = self->_appTriggeredPassiveSymptom;
  if (appTriggeredPassiveSymptom) {
    [v3 setObject:appTriggeredPassiveSymptom forKey:@"appTriggeredPassiveSymptom"];
  }
  $141559A2C58CD4ACBDC768E89B51DA90 v11 = self->_has;
  if ((*(_DWORD *)&v11 & 0x20000) != 0)
  {
    [v3 setObject:[NSNumber numberWithBool:self->_nonCaptiveDetectedAsCaptive] forKey:@"nonCaptiveDetectedAsCaptive"];
    $141559A2C58CD4ACBDC768E89B51DA90 v11 = self->_has;
    if ((*(unsigned char *)&v11 & 0x80) == 0)
    {
LABEL_31:
      if ((*(_WORD *)&v11 & 0x1000) == 0) {
        goto LABEL_32;
      }
LABEL_57:
      uint64_t whiteListProbeStatus = self->_whiteListProbeStatus;
      if (whiteListProbeStatus >= 4) {
        v16 = (__CFString *)[NSString stringWithFormat:@"(unknown: %i)", self->_whiteListProbeStatus];
      }
      else {
        v16 = off_2641B94F8[whiteListProbeStatus];
      }
      [v3 setObject:v16 forKey:@"whiteListProbeStatus"];
      if ((*(_DWORD *)&self->_has & 0x800) != 0) {
        goto LABEL_33;
      }
      return v3;
    }
  }
  else if ((*(unsigned char *)&v11 & 0x80) == 0)
  {
    goto LABEL_31;
  }
  uint64_t redirectURLType = self->_redirectURLType;
  if (redirectURLType >= 4) {
    v14 = (__CFString *)[NSString stringWithFormat:@"(unknown: %i)", self->_redirectURLType];
  }
  else {
    v14 = off_2641B94D8[redirectURLType];
  }
  [v3 setObject:v14 forKey:@"redirectURLType"];
  $141559A2C58CD4ACBDC768E89B51DA90 v11 = self->_has;
  if ((*(_WORD *)&v11 & 0x1000) != 0) {
    goto LABEL_57;
  }
LABEL_32:
  if ((*(_WORD *)&v11 & 0x800) != 0) {
LABEL_33:
  }
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_whiteListProbeCompletionTime] forKey:@"whiteListProbeCompletionTime"];
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDCaptiveSessionReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  $141559A2C58CD4ACBDC768E89B51DA90 has = self->_has;
  if (*(unsigned char *)&has)
  {
    PBDataWriterWriteUint64Field();
    $141559A2C58CD4ACBDC768E89B51DA90 has = self->_has;
    if ((*(_WORD *)&has & 0x100) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x200) == 0) {
        goto LABEL_4;
      }
      goto LABEL_42;
    }
  }
  else if ((*(_WORD *)&has & 0x100) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  $141559A2C58CD4ACBDC768E89B51DA90 has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_4:
    if ((*(_DWORD *)&has & 0x80000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_43;
  }
LABEL_42:
  PBDataWriterWriteUint32Field();
  $141559A2C58CD4ACBDC768E89B51DA90 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_43:
  PBDataWriterWriteBOOLField();
  if ((*(_DWORD *)&self->_has & 0x400) != 0) {
LABEL_6:
  }
    PBDataWriterWriteUint32Field();
LABEL_7:
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  installedCNPDisplayIDs = self->_installedCNPDisplayIDs;
  uint64_t v6 = [(NSMutableArray *)installedCNPDisplayIDs countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(installedCNPDisplayIDs);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v7 = [(NSMutableArray *)installedCNPDisplayIDs countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }
  if (self->_handlerCNP) {
    PBDataWriterWriteStringField();
  }
  $141559A2C58CD4ACBDC768E89B51DA90 v10 = self->_has;
  if ((*(_WORD *)&v10 & 0x4000) != 0)
  {
    PBDataWriterWriteBOOLField();
    $141559A2C58CD4ACBDC768E89B51DA90 v10 = self->_has;
    if ((*(unsigned char *)&v10 & 2) == 0)
    {
LABEL_18:
      if ((*(_WORD *)&v10 & 0x2000) == 0) {
        goto LABEL_20;
      }
      goto LABEL_19;
    }
  }
  else if ((*(unsigned char *)&v10 & 2) == 0)
  {
    goto LABEL_18;
  }
  PBDataWriterWriteUint32Field();
  if ((*(_DWORD *)&self->_has & 0x2000) != 0) {
LABEL_19:
  }
    PBDataWriterWriteBOOLField();
LABEL_20:
  if (self->_autoLoginCarrierID) {
    PBDataWriterWriteStringField();
  }
  $141559A2C58CD4ACBDC768E89B51DA90 v11 = self->_has;
  if ((*(_DWORD *)&v11 & 0x100000) != 0)
  {
    PBDataWriterWriteBOOLField();
    $141559A2C58CD4ACBDC768E89B51DA90 v11 = self->_has;
    if ((*(_DWORD *)&v11 & 0x40000) == 0)
    {
LABEL_24:
      if ((*(unsigned char *)&v11 & 0x10) == 0) {
        goto LABEL_25;
      }
      goto LABEL_50;
    }
  }
  else if ((*(_DWORD *)&v11 & 0x40000) == 0)
  {
    goto LABEL_24;
  }
  PBDataWriterWriteBOOLField();
  $141559A2C58CD4ACBDC768E89B51DA90 v11 = self->_has;
  if ((*(unsigned char *)&v11 & 0x10) == 0)
  {
LABEL_25:
    if ((*(unsigned char *)&v11 & 0x20) == 0) {
      goto LABEL_26;
    }
    goto LABEL_51;
  }
LABEL_50:
  PBDataWriterWriteUint32Field();
  $141559A2C58CD4ACBDC768E89B51DA90 v11 = self->_has;
  if ((*(unsigned char *)&v11 & 0x20) == 0)
  {
LABEL_26:
    if ((*(_WORD *)&v11 & 0x8000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_52;
  }
LABEL_51:
  PBDataWriterWriteUint32Field();
  $141559A2C58CD4ACBDC768E89B51DA90 v11 = self->_has;
  if ((*(_WORD *)&v11 & 0x8000) == 0)
  {
LABEL_27:
    if ((*(_DWORD *)&v11 & 0x10000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_53;
  }
LABEL_52:
  PBDataWriterWriteBOOLField();
  $141559A2C58CD4ACBDC768E89B51DA90 v11 = self->_has;
  if ((*(_DWORD *)&v11 & 0x10000) == 0)
  {
LABEL_28:
    if ((*(unsigned char *)&v11 & 8) == 0) {
      goto LABEL_29;
    }
    goto LABEL_54;
  }
LABEL_53:
  PBDataWriterWriteBOOLField();
  $141559A2C58CD4ACBDC768E89B51DA90 v11 = self->_has;
  if ((*(unsigned char *)&v11 & 8) == 0)
  {
LABEL_29:
    if ((*(unsigned char *)&v11 & 4) == 0) {
      goto LABEL_30;
    }
    goto LABEL_55;
  }
LABEL_54:
  PBDataWriterWriteUint32Field();
  $141559A2C58CD4ACBDC768E89B51DA90 v11 = self->_has;
  if ((*(unsigned char *)&v11 & 4) == 0)
  {
LABEL_30:
    if ((*(unsigned char *)&v11 & 0x40) == 0) {
      goto LABEL_32;
    }
    goto LABEL_31;
  }
LABEL_55:
  PBDataWriterWriteUint32Field();
  if ((*(_DWORD *)&self->_has & 0x40) != 0) {
LABEL_31:
  }
    PBDataWriterWriteUint32Field();
LABEL_32:
  if (self->_appTriggeredPassiveSymptom) {
    PBDataWriterWriteStringField();
  }
  $141559A2C58CD4ACBDC768E89B51DA90 v12 = self->_has;
  if ((*(_DWORD *)&v12 & 0x20000) != 0)
  {
    PBDataWriterWriteBOOLField();
    $141559A2C58CD4ACBDC768E89B51DA90 v12 = self->_has;
    if ((*(unsigned char *)&v12 & 0x80) == 0)
    {
LABEL_36:
      if ((*(_WORD *)&v12 & 0x1000) == 0) {
        goto LABEL_37;
      }
      goto LABEL_59;
    }
  }
  else if ((*(unsigned char *)&v12 & 0x80) == 0)
  {
    goto LABEL_36;
  }
  PBDataWriterWriteInt32Field();
  $141559A2C58CD4ACBDC768E89B51DA90 v12 = self->_has;
  if ((*(_WORD *)&v12 & 0x1000) == 0)
  {
LABEL_37:
    if ((*(_WORD *)&v12 & 0x800) == 0) {
      return;
    }
    goto LABEL_38;
  }
LABEL_59:
  PBDataWriterWriteInt32Field();
  if ((*(_DWORD *)&self->_has & 0x800) == 0) {
    return;
  }
LABEL_38:
  PBDataWriterWriteUint32Field();
}

- (void)copyTo:(id)a3
{
  $141559A2C58CD4ACBDC768E89B51DA90 has = self->_has;
  if (*(unsigned char *)&has)
  {
    *((void *)a3 + 1) = self->_timestamp;
    *((_DWORD *)a3 + 27) |= 1u;
    $141559A2C58CD4ACBDC768E89B51DA90 has = self->_has;
    if ((*(_WORD *)&has & 0x100) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x200) == 0) {
        goto LABEL_4;
      }
      goto LABEL_39;
    }
  }
  else if ((*(_WORD *)&has & 0x100) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 20) = self->_result;
  *((_DWORD *)a3 + 27) |= 0x100u;
  $141559A2C58CD4ACBDC768E89B51DA90 has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_4:
    if ((*(_DWORD *)&has & 0x80000) == 0) {
      goto LABEL_5;
    }
LABEL_40:
    *((unsigned char *)a3 + 106) = self->_websheetScraped;
    *((_DWORD *)a3 + 27) |= 0x80000u;
    if ((*(_DWORD *)&self->_has & 0x400) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_39:
  *((_DWORD *)a3 + 21) = self->_websheetProbeCount;
  *((_DWORD *)a3 + 27) |= 0x200u;
  $141559A2C58CD4ACBDC768E89B51DA90 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) != 0) {
    goto LABEL_40;
  }
LABEL_5:
  if ((*(_WORD *)&has & 0x400) != 0)
  {
LABEL_6:
    *((_DWORD *)a3 + 22) = self->_websheetScrapeResult;
    *((_DWORD *)a3 + 27) |= 0x400u;
  }
LABEL_7:
  if ([(AWDCaptiveSession *)self installedCNPDisplayIDsCount])
  {
    [a3 clearInstalledCNPDisplayIDs];
    unint64_t v6 = [(AWDCaptiveSession *)self installedCNPDisplayIDsCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
        [a3 addInstalledCNPDisplayIDs:-[AWDCaptiveSession installedCNPDisplayIDsAtIndex:](self, "installedCNPDisplayIDsAtIndex:", i)];
    }
  }
  if (self->_handlerCNP) {
    [a3 setHandlerCNP:];
  }
  $141559A2C58CD4ACBDC768E89B51DA90 v9 = self->_has;
  if ((*(_WORD *)&v9 & 0x4000) != 0)
  {
    *((unsigned char *)a3 + 101) = self->_detectedNotCaptiveHandledByCNP;
    *((_DWORD *)a3 + 27) |= 0x4000u;
    $141559A2C58CD4ACBDC768E89B51DA90 v9 = self->_has;
    if ((*(unsigned char *)&v9 & 2) == 0)
    {
LABEL_15:
      if ((*(_WORD *)&v9 & 0x2000) == 0) {
        goto LABEL_17;
      }
      goto LABEL_16;
    }
  }
  else if ((*(unsigned char *)&v9 & 2) == 0)
  {
    goto LABEL_15;
  }
  *((_DWORD *)a3 + 8) = self->_autoLoginType;
  *((_DWORD *)a3 + 27) |= 2u;
  if ((*(_DWORD *)&self->_has & 0x2000) != 0)
  {
LABEL_16:
    *((unsigned char *)a3 + 100) = self->_autoLoginFailed;
    *((_DWORD *)a3 + 27) |= 0x2000u;
  }
LABEL_17:
  if (self->_autoLoginCarrierID) {
    [a3 setAutoLoginCarrierID:];
  }
  $141559A2C58CD4ACBDC768E89B51DA90 v10 = self->_has;
  if ((*(_DWORD *)&v10 & 0x100000) != 0)
  {
    *((unsigned char *)a3 + 107) = self->_wisprDetected;
    *((_DWORD *)a3 + 27) |= 0x100000u;
    $141559A2C58CD4ACBDC768E89B51DA90 v10 = self->_has;
    if ((*(_DWORD *)&v10 & 0x40000) == 0)
    {
LABEL_21:
      if ((*(unsigned char *)&v10 & 0x10) == 0) {
        goto LABEL_22;
      }
      goto LABEL_47;
    }
  }
  else if ((*(_DWORD *)&v10 & 0x40000) == 0)
  {
    goto LABEL_21;
  }
  *((unsigned char *)a3 + 105) = self->_passiveCaptivityDetected;
  *((_DWORD *)a3 + 27) |= 0x40000u;
  $141559A2C58CD4ACBDC768E89B51DA90 v10 = self->_has;
  if ((*(unsigned char *)&v10 & 0x10) == 0)
  {
LABEL_22:
    if ((*(unsigned char *)&v10 & 0x20) == 0) {
      goto LABEL_23;
    }
    goto LABEL_48;
  }
LABEL_47:
  *((_DWORD *)a3 + 16) = self->_passiveCaptivityCorrectDetection;
  *((_DWORD *)a3 + 27) |= 0x10u;
  $141559A2C58CD4ACBDC768E89B51DA90 v10 = self->_has;
  if ((*(unsigned char *)&v10 & 0x20) == 0)
  {
LABEL_23:
    if ((*(_WORD *)&v10 & 0x8000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_49;
  }
LABEL_48:
  *((_DWORD *)a3 + 17) = self->_passiveCaptivityIncorrectDetection;
  *((_DWORD *)a3 + 27) |= 0x20u;
  $141559A2C58CD4ACBDC768E89B51DA90 v10 = self->_has;
  if ((*(_WORD *)&v10 & 0x8000) == 0)
  {
LABEL_24:
    if ((*(_DWORD *)&v10 & 0x10000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_50;
  }
LABEL_49:
  *((unsigned char *)a3 + 102) = self->_handlerCNPTriggeredLogOff;
  *((_DWORD *)a3 + 27) |= 0x8000u;
  $141559A2C58CD4ACBDC768E89B51DA90 v10 = self->_has;
  if ((*(_DWORD *)&v10 & 0x10000) == 0)
  {
LABEL_25:
    if ((*(unsigned char *)&v10 & 8) == 0) {
      goto LABEL_26;
    }
    goto LABEL_51;
  }
LABEL_50:
  *((unsigned char *)a3 + 103) = self->_isDetectedCaptive;
  *((_DWORD *)a3 + 27) |= 0x10000u;
  $141559A2C58CD4ACBDC768E89B51DA90 v10 = self->_has;
  if ((*(unsigned char *)&v10 & 8) == 0)
  {
LABEL_26:
    if ((*(unsigned char *)&v10 & 4) == 0) {
      goto LABEL_27;
    }
    goto LABEL_52;
  }
LABEL_51:
  *((_DWORD *)a3 + 10) = self->_durationOnNetwork;
  *((_DWORD *)a3 + 27) |= 8u;
  $141559A2C58CD4ACBDC768E89B51DA90 v10 = self->_has;
  if ((*(unsigned char *)&v10 & 4) == 0)
  {
LABEL_27:
    if ((*(unsigned char *)&v10 & 0x40) == 0) {
      goto LABEL_29;
    }
    goto LABEL_28;
  }
LABEL_52:
  *((_DWORD *)a3 + 9) = self->_durationNetworkNotCaptive;
  *((_DWORD *)a3 + 27) |= 4u;
  if ((*(_DWORD *)&self->_has & 0x40) != 0)
  {
LABEL_28:
    *((_DWORD *)a3 + 18) = self->_passiveCaptivitySymptom;
    *((_DWORD *)a3 + 27) |= 0x40u;
  }
LABEL_29:
  if (self->_appTriggeredPassiveSymptom) {
    [a3 setAppTriggeredPassiveSymptom:];
  }
  $141559A2C58CD4ACBDC768E89B51DA90 v11 = self->_has;
  if ((*(_DWORD *)&v11 & 0x20000) != 0)
  {
    *((unsigned char *)a3 + 104) = self->_nonCaptiveDetectedAsCaptive;
    *((_DWORD *)a3 + 27) |= 0x20000u;
    $141559A2C58CD4ACBDC768E89B51DA90 v11 = self->_has;
    if ((*(unsigned char *)&v11 & 0x80) == 0)
    {
LABEL_33:
      if ((*(_WORD *)&v11 & 0x1000) == 0) {
        goto LABEL_34;
      }
      goto LABEL_56;
    }
  }
  else if ((*(unsigned char *)&v11 & 0x80) == 0)
  {
    goto LABEL_33;
  }
  *((_DWORD *)a3 + 19) = self->_redirectURLType;
  *((_DWORD *)a3 + 27) |= 0x80u;
  $141559A2C58CD4ACBDC768E89B51DA90 v11 = self->_has;
  if ((*(_WORD *)&v11 & 0x1000) == 0)
  {
LABEL_34:
    if ((*(_WORD *)&v11 & 0x800) == 0) {
      return;
    }
    goto LABEL_35;
  }
LABEL_56:
  *((_DWORD *)a3 + 24) = self->_whiteListProbeStatus;
  *((_DWORD *)a3 + 27) |= 0x1000u;
  if ((*(_DWORD *)&self->_has & 0x800) == 0) {
    return;
  }
LABEL_35:
  *((_DWORD *)a3 + 23) = self->_whiteListProbeCompletionTime;
  *((_DWORD *)a3 + 27) |= 0x800u;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  uint64_t v5 = [(id)[(id)objc_opt_class() allocWithZone:a3] init];
  uint64_t v6 = v5;
  $141559A2C58CD4ACBDC768E89B51DA90 has = self->_has;
  if (*(unsigned char *)&has)
  {
    *(void *)(v5 + 8) = self->_timestamp;
    *(_DWORD *)(v5 + 108) |= 1u;
    $141559A2C58CD4ACBDC768E89B51DA90 has = self->_has;
    if ((*(_WORD *)&has & 0x100) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x200) == 0) {
        goto LABEL_4;
      }
      goto LABEL_36;
    }
  }
  else if ((*(_WORD *)&has & 0x100) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 80) = self->_result;
  *(_DWORD *)(v5 + 108) |= 0x100u;
  $141559A2C58CD4ACBDC768E89B51DA90 has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_4:
    if ((*(_DWORD *)&has & 0x80000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_37;
  }
LABEL_36:
  *(_DWORD *)(v5 + 84) = self->_websheetProbeCount;
  *(_DWORD *)(v5 + 108) |= 0x200u;
  $141559A2C58CD4ACBDC768E89B51DA90 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_37:
  *(unsigned char *)(v5 + 106) = self->_websheetScraped;
  *(_DWORD *)(v5 + 108) |= 0x80000u;
  if ((*(_DWORD *)&self->_has & 0x400) != 0)
  {
LABEL_6:
    *(_DWORD *)(v5 + 88) = self->_websheetScrapeResult;
    *(_DWORD *)(v5 + 108) |= 0x400u;
  }
LABEL_7:
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  installedCNPDisplayIDs = self->_installedCNPDisplayIDs;
  uint64_t v9 = [(NSMutableArray *)installedCNPDisplayIDs countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(installedCNPDisplayIDs);
        }
        long long v13 = (void *)[*(id *)(*((void *)&v18 + 1) + 8 * i) copyWithZone:a3];
        [(id)v6 addInstalledCNPDisplayIDs:v13];
      }
      uint64_t v10 = [(NSMutableArray *)installedCNPDisplayIDs countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v10);
  }

  *(void *)(v6 + 48) = [(NSString *)self->_handlerCNP copyWithZone:a3];
  $141559A2C58CD4ACBDC768E89B51DA90 v14 = self->_has;
  if ((*(_WORD *)&v14 & 0x4000) != 0)
  {
    *(unsigned char *)(v6 + 101) = self->_detectedNotCaptiveHandledByCNP;
    *(_DWORD *)(v6 + 108) |= 0x4000u;
    $141559A2C58CD4ACBDC768E89B51DA90 v14 = self->_has;
    if ((*(unsigned char *)&v14 & 2) == 0)
    {
LABEL_16:
      if ((*(_WORD *)&v14 & 0x2000) == 0) {
        goto LABEL_18;
      }
      goto LABEL_17;
    }
  }
  else if ((*(unsigned char *)&v14 & 2) == 0)
  {
    goto LABEL_16;
  }
  *(_DWORD *)(v6 + 32) = self->_autoLoginType;
  *(_DWORD *)(v6 + 108) |= 2u;
  if ((*(_DWORD *)&self->_has & 0x2000) != 0)
  {
LABEL_17:
    *(unsigned char *)(v6 + 100) = self->_autoLoginFailed;
    *(_DWORD *)(v6 + 108) |= 0x2000u;
  }
LABEL_18:

  *(void *)(v6 + 24) = [(NSString *)self->_autoLoginCarrierID copyWithZone:a3];
  $141559A2C58CD4ACBDC768E89B51DA90 v15 = self->_has;
  if ((*(_DWORD *)&v15 & 0x100000) != 0)
  {
    *(unsigned char *)(v6 + 107) = self->_wisprDetected;
    *(_DWORD *)(v6 + 108) |= 0x100000u;
    $141559A2C58CD4ACBDC768E89B51DA90 v15 = self->_has;
    if ((*(_DWORD *)&v15 & 0x40000) == 0)
    {
LABEL_20:
      if ((*(unsigned char *)&v15 & 0x10) == 0) {
        goto LABEL_21;
      }
      goto LABEL_44;
    }
  }
  else if ((*(_DWORD *)&v15 & 0x40000) == 0)
  {
    goto LABEL_20;
  }
  *(unsigned char *)(v6 + 105) = self->_passiveCaptivityDetected;
  *(_DWORD *)(v6 + 108) |= 0x40000u;
  $141559A2C58CD4ACBDC768E89B51DA90 v15 = self->_has;
  if ((*(unsigned char *)&v15 & 0x10) == 0)
  {
LABEL_21:
    if ((*(unsigned char *)&v15 & 0x20) == 0) {
      goto LABEL_22;
    }
    goto LABEL_45;
  }
LABEL_44:
  *(_DWORD *)(v6 + 64) = self->_passiveCaptivityCorrectDetection;
  *(_DWORD *)(v6 + 108) |= 0x10u;
  $141559A2C58CD4ACBDC768E89B51DA90 v15 = self->_has;
  if ((*(unsigned char *)&v15 & 0x20) == 0)
  {
LABEL_22:
    if ((*(_WORD *)&v15 & 0x8000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_46;
  }
LABEL_45:
  *(_DWORD *)(v6 + 68) = self->_passiveCaptivityIncorrectDetection;
  *(_DWORD *)(v6 + 108) |= 0x20u;
  $141559A2C58CD4ACBDC768E89B51DA90 v15 = self->_has;
  if ((*(_WORD *)&v15 & 0x8000) == 0)
  {
LABEL_23:
    if ((*(_DWORD *)&v15 & 0x10000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_47;
  }
LABEL_46:
  *(unsigned char *)(v6 + 102) = self->_handlerCNPTriggeredLogOff;
  *(_DWORD *)(v6 + 108) |= 0x8000u;
  $141559A2C58CD4ACBDC768E89B51DA90 v15 = self->_has;
  if ((*(_DWORD *)&v15 & 0x10000) == 0)
  {
LABEL_24:
    if ((*(unsigned char *)&v15 & 8) == 0) {
      goto LABEL_25;
    }
    goto LABEL_48;
  }
LABEL_47:
  *(unsigned char *)(v6 + 103) = self->_isDetectedCaptive;
  *(_DWORD *)(v6 + 108) |= 0x10000u;
  $141559A2C58CD4ACBDC768E89B51DA90 v15 = self->_has;
  if ((*(unsigned char *)&v15 & 8) == 0)
  {
LABEL_25:
    if ((*(unsigned char *)&v15 & 4) == 0) {
      goto LABEL_26;
    }
    goto LABEL_49;
  }
LABEL_48:
  *(_DWORD *)(v6 + 40) = self->_durationOnNetwork;
  *(_DWORD *)(v6 + 108) |= 8u;
  $141559A2C58CD4ACBDC768E89B51DA90 v15 = self->_has;
  if ((*(unsigned char *)&v15 & 4) == 0)
  {
LABEL_26:
    if ((*(unsigned char *)&v15 & 0x40) == 0) {
      goto LABEL_28;
    }
    goto LABEL_27;
  }
LABEL_49:
  *(_DWORD *)(v6 + 36) = self->_durationNetworkNotCaptive;
  *(_DWORD *)(v6 + 108) |= 4u;
  if ((*(_DWORD *)&self->_has & 0x40) != 0)
  {
LABEL_27:
    *(_DWORD *)(v6 + 72) = self->_passiveCaptivitySymptom;
    *(_DWORD *)(v6 + 108) |= 0x40u;
  }
LABEL_28:

  *(void *)(v6 + 16) = [(NSString *)self->_appTriggeredPassiveSymptom copyWithZone:a3];
  $141559A2C58CD4ACBDC768E89B51DA90 v16 = self->_has;
  if ((*(_DWORD *)&v16 & 0x20000) != 0)
  {
    *(unsigned char *)(v6 + 104) = self->_nonCaptiveDetectedAsCaptive;
    *(_DWORD *)(v6 + 108) |= 0x20000u;
    $141559A2C58CD4ACBDC768E89B51DA90 v16 = self->_has;
    if ((*(unsigned char *)&v16 & 0x80) == 0)
    {
LABEL_30:
      if ((*(_WORD *)&v16 & 0x1000) == 0) {
        goto LABEL_31;
      }
LABEL_53:
      *(_DWORD *)(v6 + 96) = self->_whiteListProbeStatus;
      *(_DWORD *)(v6 + 108) |= 0x1000u;
      if ((*(_DWORD *)&self->_has & 0x800) == 0) {
        return (id)v6;
      }
      goto LABEL_32;
    }
  }
  else if ((*(unsigned char *)&v16 & 0x80) == 0)
  {
    goto LABEL_30;
  }
  *(_DWORD *)(v6 + 76) = self->_redirectURLType;
  *(_DWORD *)(v6 + 108) |= 0x80u;
  $141559A2C58CD4ACBDC768E89B51DA90 v16 = self->_has;
  if ((*(_WORD *)&v16 & 0x1000) != 0) {
    goto LABEL_53;
  }
LABEL_31:
  if ((*(_WORD *)&v16 & 0x800) != 0)
  {
LABEL_32:
    *(_DWORD *)(v6 + 92) = self->_whiteListProbeCompletionTime;
    *(_DWORD *)(v6 + 108) |= 0x800u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (!v5) {
    return v5;
  }
  $141559A2C58CD4ACBDC768E89B51DA90 has = self->_has;
  int v7 = *((_DWORD *)a3 + 27);
  if (*(unsigned char *)&has)
  {
    if ((v7 & 1) == 0 || self->_timestamp != *((void *)a3 + 1)) {
      goto LABEL_140;
    }
  }
  else if (v7)
  {
    goto LABEL_140;
  }
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    if ((v7 & 0x100) == 0 || self->_result != *((_DWORD *)a3 + 20)) {
      goto LABEL_140;
    }
  }
  else if ((v7 & 0x100) != 0)
  {
    goto LABEL_140;
  }
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    if ((v7 & 0x200) == 0 || self->_websheetProbeCount != *((_DWORD *)a3 + 21)) {
      goto LABEL_140;
    }
  }
  else if ((v7 & 0x200) != 0)
  {
    goto LABEL_140;
  }
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
    if ((v7 & 0x80000) == 0) {
      goto LABEL_140;
    }
    if (self->_websheetScraped)
    {
      if (!*((unsigned char *)a3 + 106)) {
        goto LABEL_140;
      }
    }
    else if (*((unsigned char *)a3 + 106))
    {
      goto LABEL_140;
    }
  }
  else if ((v7 & 0x80000) != 0)
  {
    goto LABEL_140;
  }
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    if ((v7 & 0x400) == 0 || self->_websheetScrapeResult != *((_DWORD *)a3 + 22)) {
      goto LABEL_140;
    }
  }
  else if ((v7 & 0x400) != 0)
  {
    goto LABEL_140;
  }
  installedCNPDisplayIDs = self->_installedCNPDisplayIDs;
  if (!((unint64_t)installedCNPDisplayIDs | *((void *)a3 + 7))
    || (int v5 = -[NSMutableArray isEqual:](installedCNPDisplayIDs, "isEqual:")) != 0)
  {
    handlerCNP = self->_handlerCNP;
    if (!((unint64_t)handlerCNP | *((void *)a3 + 6))
      || (int v5 = -[NSString isEqual:](handlerCNP, "isEqual:")) != 0)
    {
      $141559A2C58CD4ACBDC768E89B51DA90 v10 = self->_has;
      int v11 = *((_DWORD *)a3 + 27);
      if ((*(_WORD *)&v10 & 0x4000) != 0)
      {
        if ((v11 & 0x4000) == 0) {
          goto LABEL_140;
        }
        if (self->_detectedNotCaptiveHandledByCNP)
        {
          if (!*((unsigned char *)a3 + 101)) {
            goto LABEL_140;
          }
        }
        else if (*((unsigned char *)a3 + 101))
        {
          goto LABEL_140;
        }
      }
      else if ((v11 & 0x4000) != 0)
      {
        goto LABEL_140;
      }
      if ((*(unsigned char *)&v10 & 2) != 0)
      {
        if ((v11 & 2) == 0 || self->_autoLoginType != *((_DWORD *)a3 + 8)) {
          goto LABEL_140;
        }
      }
      else if ((v11 & 2) != 0)
      {
        goto LABEL_140;
      }
      if ((*(_WORD *)&v10 & 0x2000) != 0)
      {
        if ((v11 & 0x2000) == 0) {
          goto LABEL_140;
        }
        if (self->_autoLoginFailed)
        {
          if (!*((unsigned char *)a3 + 100)) {
            goto LABEL_140;
          }
        }
        else if (*((unsigned char *)a3 + 100))
        {
          goto LABEL_140;
        }
      }
      else if ((v11 & 0x2000) != 0)
      {
        goto LABEL_140;
      }
      autoLoginCarrierID = self->_autoLoginCarrierID;
      if ((unint64_t)autoLoginCarrierID | *((void *)a3 + 3))
      {
        int v5 = -[NSString isEqual:](autoLoginCarrierID, "isEqual:");
        if (!v5) {
          return v5;
        }
        $141559A2C58CD4ACBDC768E89B51DA90 v10 = self->_has;
      }
      int v13 = *((_DWORD *)a3 + 27);
      if ((*(_DWORD *)&v10 & 0x100000) != 0)
      {
        if ((v13 & 0x100000) == 0) {
          goto LABEL_140;
        }
        if (self->_wisprDetected)
        {
          if (!*((unsigned char *)a3 + 107)) {
            goto LABEL_140;
          }
        }
        else if (*((unsigned char *)a3 + 107))
        {
          goto LABEL_140;
        }
      }
      else if ((v13 & 0x100000) != 0)
      {
        goto LABEL_140;
      }
      if ((*(_DWORD *)&v10 & 0x40000) != 0)
      {
        if ((v13 & 0x40000) == 0) {
          goto LABEL_140;
        }
        if (self->_passiveCaptivityDetected)
        {
          if (!*((unsigned char *)a3 + 105)) {
            goto LABEL_140;
          }
        }
        else if (*((unsigned char *)a3 + 105))
        {
          goto LABEL_140;
        }
      }
      else if ((v13 & 0x40000) != 0)
      {
        goto LABEL_140;
      }
      if ((*(unsigned char *)&v10 & 0x10) != 0)
      {
        if ((v13 & 0x10) == 0 || self->_passiveCaptivityCorrectDetection != *((_DWORD *)a3 + 16)) {
          goto LABEL_140;
        }
      }
      else if ((v13 & 0x10) != 0)
      {
        goto LABEL_140;
      }
      if ((*(unsigned char *)&v10 & 0x20) != 0)
      {
        if ((v13 & 0x20) == 0 || self->_passiveCaptivityIncorrectDetection != *((_DWORD *)a3 + 17)) {
          goto LABEL_140;
        }
      }
      else if ((v13 & 0x20) != 0)
      {
        goto LABEL_140;
      }
      if ((*(_WORD *)&v10 & 0x8000) != 0)
      {
        if ((v13 & 0x8000) == 0) {
          goto LABEL_140;
        }
        if (self->_handlerCNPTriggeredLogOff)
        {
          if (!*((unsigned char *)a3 + 102)) {
            goto LABEL_140;
          }
        }
        else if (*((unsigned char *)a3 + 102))
        {
          goto LABEL_140;
        }
      }
      else if ((v13 & 0x8000) != 0)
      {
        goto LABEL_140;
      }
      if ((*(_DWORD *)&v10 & 0x10000) != 0)
      {
        if ((v13 & 0x10000) == 0) {
          goto LABEL_140;
        }
        if (self->_isDetectedCaptive)
        {
          if (!*((unsigned char *)a3 + 103)) {
            goto LABEL_140;
          }
        }
        else if (*((unsigned char *)a3 + 103))
        {
          goto LABEL_140;
        }
      }
      else if ((v13 & 0x10000) != 0)
      {
        goto LABEL_140;
      }
      if ((*(unsigned char *)&v10 & 8) != 0)
      {
        if ((v13 & 8) == 0 || self->_durationOnNetwork != *((_DWORD *)a3 + 10)) {
          goto LABEL_140;
        }
      }
      else if ((v13 & 8) != 0)
      {
        goto LABEL_140;
      }
      if ((*(unsigned char *)&v10 & 4) != 0)
      {
        if ((v13 & 4) == 0 || self->_durationNetworkNotCaptive != *((_DWORD *)a3 + 9)) {
          goto LABEL_140;
        }
      }
      else if ((v13 & 4) != 0)
      {
        goto LABEL_140;
      }
      if ((*(unsigned char *)&v10 & 0x40) != 0)
      {
        if ((v13 & 0x40) == 0 || self->_passiveCaptivitySymptom != *((_DWORD *)a3 + 18)) {
          goto LABEL_140;
        }
      }
      else if ((v13 & 0x40) != 0)
      {
        goto LABEL_140;
      }
      appTriggeredPassiveSymptom = self->_appTriggeredPassiveSymptom;
      if ((unint64_t)appTriggeredPassiveSymptom | *((void *)a3 + 2))
      {
        int v5 = -[NSString isEqual:](appTriggeredPassiveSymptom, "isEqual:");
        if (!v5) {
          return v5;
        }
        $141559A2C58CD4ACBDC768E89B51DA90 v10 = self->_has;
      }
      int v15 = *((_DWORD *)a3 + 27);
      if ((*(_DWORD *)&v10 & 0x20000) == 0)
      {
        if ((v15 & 0x20000) != 0) {
          goto LABEL_140;
        }
        goto LABEL_126;
      }
      if ((v15 & 0x20000) != 0)
      {
        if (self->_nonCaptiveDetectedAsCaptive)
        {
          if (!*((unsigned char *)a3 + 104)) {
            goto LABEL_140;
          }
          goto LABEL_126;
        }
        if (!*((unsigned char *)a3 + 104))
        {
LABEL_126:
          if ((*(unsigned char *)&v10 & 0x80) != 0)
          {
            if ((v15 & 0x80) == 0 || self->_redirectURLType != *((_DWORD *)a3 + 19)) {
              goto LABEL_140;
            }
          }
          else if ((v15 & 0x80) != 0)
          {
            goto LABEL_140;
          }
          if ((*(_WORD *)&v10 & 0x1000) != 0)
          {
            if ((v15 & 0x1000) == 0 || self->_whiteListProbeStatus != *((_DWORD *)a3 + 24)) {
              goto LABEL_140;
            }
          }
          else if ((v15 & 0x1000) != 0)
          {
            goto LABEL_140;
          }
          LOBYTE(v5) = (*((_DWORD *)a3 + 27) & 0x800) == 0;
          if ((*(_WORD *)&v10 & 0x800) != 0)
          {
            if ((v15 & 0x800) == 0 || self->_whiteListProbeCompletionTime != *((_DWORD *)a3 + 23)) {
              goto LABEL_140;
            }
            LOBYTE(v5) = 1;
          }
          return v5;
        }
      }
LABEL_140:
      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  $141559A2C58CD4ACBDC768E89B51DA90 has = self->_has;
  if (*(unsigned char *)&has)
  {
    unint64_t v32 = 2654435761u * self->_timestamp;
    if ((*(_WORD *)&has & 0x100) != 0)
    {
LABEL_3:
      uint64_t v31 = 2654435761 * self->_result;
      if ((*(_WORD *)&has & 0x200) != 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else
  {
    unint64_t v32 = 0;
    if ((*(_WORD *)&has & 0x100) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v31 = 0;
  if ((*(_WORD *)&has & 0x200) != 0)
  {
LABEL_4:
    uint64_t v30 = 2654435761 * self->_websheetProbeCount;
    if ((*(_DWORD *)&has & 0x80000) != 0) {
      goto LABEL_5;
    }
LABEL_10:
    uint64_t v29 = 0;
    if ((*(_WORD *)&has & 0x400) != 0) {
      goto LABEL_6;
    }
    goto LABEL_11;
  }
LABEL_9:
  uint64_t v30 = 0;
  if ((*(_DWORD *)&has & 0x80000) == 0) {
    goto LABEL_10;
  }
LABEL_5:
  uint64_t v29 = 2654435761 * self->_websheetScraped;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
LABEL_6:
    uint64_t v28 = 2654435761 * self->_websheetScrapeResult;
    goto LABEL_12;
  }
LABEL_11:
  uint64_t v28 = 0;
LABEL_12:
  uint64_t v27 = [(NSMutableArray *)self->_installedCNPDisplayIDs hash];
  NSUInteger v26 = [(NSString *)self->_handlerCNP hash];
  $141559A2C58CD4ACBDC768E89B51DA90 v4 = self->_has;
  if ((*(_WORD *)&v4 & 0x4000) == 0)
  {
    uint64_t v25 = 0;
    if ((*(unsigned char *)&v4 & 2) != 0) {
      goto LABEL_14;
    }
LABEL_17:
    uint64_t v24 = 0;
    if ((*(_WORD *)&v4 & 0x2000) != 0) {
      goto LABEL_15;
    }
    goto LABEL_18;
  }
  uint64_t v25 = 2654435761 * self->_detectedNotCaptiveHandledByCNP;
  if ((*(unsigned char *)&v4 & 2) == 0) {
    goto LABEL_17;
  }
LABEL_14:
  uint64_t v24 = 2654435761 * self->_autoLoginType;
  if ((*(_WORD *)&v4 & 0x2000) != 0)
  {
LABEL_15:
    uint64_t v23 = 2654435761 * self->_autoLoginFailed;
    goto LABEL_19;
  }
LABEL_18:
  uint64_t v23 = 0;
LABEL_19:
  NSUInteger v22 = [(NSString *)self->_autoLoginCarrierID hash];
  $141559A2C58CD4ACBDC768E89B51DA90 v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x100000) != 0)
  {
    uint64_t v21 = 2654435761 * self->_wisprDetected;
    if ((*(_DWORD *)&v5 & 0x40000) != 0)
    {
LABEL_21:
      uint64_t v20 = 2654435761 * self->_passiveCaptivityDetected;
      if ((*(unsigned char *)&v5 & 0x10) != 0) {
        goto LABEL_22;
      }
      goto LABEL_31;
    }
  }
  else
  {
    uint64_t v21 = 0;
    if ((*(_DWORD *)&v5 & 0x40000) != 0) {
      goto LABEL_21;
    }
  }
  uint64_t v20 = 0;
  if ((*(unsigned char *)&v5 & 0x10) != 0)
  {
LABEL_22:
    uint64_t v6 = 2654435761 * self->_passiveCaptivityCorrectDetection;
    if ((*(unsigned char *)&v5 & 0x20) != 0) {
      goto LABEL_23;
    }
    goto LABEL_32;
  }
LABEL_31:
  uint64_t v6 = 0;
  if ((*(unsigned char *)&v5 & 0x20) != 0)
  {
LABEL_23:
    uint64_t v7 = 2654435761 * self->_passiveCaptivityIncorrectDetection;
    if ((*(_WORD *)&v5 & 0x8000) != 0) {
      goto LABEL_24;
    }
    goto LABEL_33;
  }
LABEL_32:
  uint64_t v7 = 0;
  if ((*(_WORD *)&v5 & 0x8000) != 0)
  {
LABEL_24:
    uint64_t v8 = 2654435761 * self->_handlerCNPTriggeredLogOff;
    if ((*(_DWORD *)&v5 & 0x10000) != 0) {
      goto LABEL_25;
    }
    goto LABEL_34;
  }
LABEL_33:
  uint64_t v8 = 0;
  if ((*(_DWORD *)&v5 & 0x10000) != 0)
  {
LABEL_25:
    uint64_t v9 = 2654435761 * self->_isDetectedCaptive;
    if ((*(unsigned char *)&v5 & 8) != 0) {
      goto LABEL_26;
    }
    goto LABEL_35;
  }
LABEL_34:
  uint64_t v9 = 0;
  if ((*(unsigned char *)&v5 & 8) != 0)
  {
LABEL_26:
    uint64_t v10 = 2654435761 * self->_durationOnNetwork;
    if ((*(unsigned char *)&v5 & 4) != 0) {
      goto LABEL_27;
    }
LABEL_36:
    uint64_t v11 = 0;
    if ((*(unsigned char *)&v5 & 0x40) != 0) {
      goto LABEL_28;
    }
    goto LABEL_37;
  }
LABEL_35:
  uint64_t v10 = 0;
  if ((*(unsigned char *)&v5 & 4) == 0) {
    goto LABEL_36;
  }
LABEL_27:
  uint64_t v11 = 2654435761 * self->_durationNetworkNotCaptive;
  if ((*(unsigned char *)&v5 & 0x40) != 0)
  {
LABEL_28:
    uint64_t v12 = 2654435761 * self->_passiveCaptivitySymptom;
    goto LABEL_38;
  }
LABEL_37:
  uint64_t v12 = 0;
LABEL_38:
  NSUInteger v13 = [(NSString *)self->_appTriggeredPassiveSymptom hash];
  $141559A2C58CD4ACBDC768E89B51DA90 v14 = self->_has;
  if ((*(_DWORD *)&v14 & 0x20000) != 0)
  {
    uint64_t v15 = 2654435761 * self->_nonCaptiveDetectedAsCaptive;
    if ((*(unsigned char *)&v14 & 0x80) != 0)
    {
LABEL_40:
      uint64_t v16 = 2654435761 * self->_redirectURLType;
      if ((*(_WORD *)&v14 & 0x1000) != 0) {
        goto LABEL_41;
      }
LABEL_45:
      uint64_t v17 = 0;
      if ((*(_WORD *)&v14 & 0x800) != 0) {
        goto LABEL_42;
      }
LABEL_46:
      uint64_t v18 = 0;
      return v31 ^ v32 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v22 ^ v21 ^ v20 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v15 ^ v16 ^ v17 ^ v18;
    }
  }
  else
  {
    uint64_t v15 = 0;
    if ((*(unsigned char *)&v14 & 0x80) != 0) {
      goto LABEL_40;
    }
  }
  uint64_t v16 = 0;
  if ((*(_WORD *)&v14 & 0x1000) == 0) {
    goto LABEL_45;
  }
LABEL_41:
  uint64_t v17 = 2654435761 * self->_whiteListProbeStatus;
  if ((*(_WORD *)&v14 & 0x800) == 0) {
    goto LABEL_46;
  }
LABEL_42:
  uint64_t v18 = 2654435761 * self->_whiteListProbeCompletionTime;
  return v31 ^ v32 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v22 ^ v21 ^ v20 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v15 ^ v16 ^ v17 ^ v18;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  int v5 = *((_DWORD *)a3 + 27);
  if (v5)
  {
    self->_timestamp = *((void *)a3 + 1);
    *(_DWORD *)&self->_has |= 1u;
    int v5 = *((_DWORD *)a3 + 27);
    if ((v5 & 0x100) == 0)
    {
LABEL_3:
      if ((v5 & 0x200) == 0) {
        goto LABEL_4;
      }
      goto LABEL_42;
    }
  }
  else if ((v5 & 0x100) == 0)
  {
    goto LABEL_3;
  }
  self->_result = *((_DWORD *)a3 + 20);
  *(_DWORD *)&self->_has |= 0x100u;
  int v5 = *((_DWORD *)a3 + 27);
  if ((v5 & 0x200) == 0)
  {
LABEL_4:
    if ((v5 & 0x80000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_43;
  }
LABEL_42:
  self->_websheetProbeCount = *((_DWORD *)a3 + 21);
  *(_DWORD *)&self->_has |= 0x200u;
  int v5 = *((_DWORD *)a3 + 27);
  if ((v5 & 0x80000) == 0)
  {
LABEL_5:
    if ((v5 & 0x400) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_43:
  self->_websheetScraped = *((unsigned char *)a3 + 106);
  *(_DWORD *)&self->_has |= 0x80000u;
  if ((*((_DWORD *)a3 + 27) & 0x400) != 0)
  {
LABEL_6:
    self->_websheetScrapeResult = *((_DWORD *)a3 + 22);
    *(_DWORD *)&self->_has |= 0x400u;
  }
LABEL_7:
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v6 = (void *)*((void *)a3 + 7);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        [(AWDCaptiveSession *)self addInstalledCNPDisplayIDs:*(void *)(*((void *)&v14 + 1) + 8 * i)];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }
  if (*((void *)a3 + 6)) {
    -[AWDCaptiveSession setHandlerCNP:](self, "setHandlerCNP:");
  }
  int v11 = *((_DWORD *)a3 + 27);
  if ((v11 & 0x4000) != 0)
  {
    self->_detectedNotCaptiveHandledByCNP = *((unsigned char *)a3 + 101);
    *(_DWORD *)&self->_has |= 0x4000u;
    int v11 = *((_DWORD *)a3 + 27);
    if ((v11 & 2) == 0)
    {
LABEL_18:
      if ((v11 & 0x2000) == 0) {
        goto LABEL_20;
      }
      goto LABEL_19;
    }
  }
  else if ((v11 & 2) == 0)
  {
    goto LABEL_18;
  }
  self->_autoLoginType = *((_DWORD *)a3 + 8);
  *(_DWORD *)&self->_has |= 2u;
  if ((*((_DWORD *)a3 + 27) & 0x2000) != 0)
  {
LABEL_19:
    self->_autoLoginFailed = *((unsigned char *)a3 + 100);
    *(_DWORD *)&self->_has |= 0x2000u;
  }
LABEL_20:
  if (*((void *)a3 + 3)) {
    -[AWDCaptiveSession setAutoLoginCarrierID:](self, "setAutoLoginCarrierID:");
  }
  int v12 = *((_DWORD *)a3 + 27);
  if ((v12 & 0x100000) != 0)
  {
    self->_wisprDetected = *((unsigned char *)a3 + 107);
    *(_DWORD *)&self->_has |= 0x100000u;
    int v12 = *((_DWORD *)a3 + 27);
    if ((v12 & 0x40000) == 0)
    {
LABEL_24:
      if ((v12 & 0x10) == 0) {
        goto LABEL_25;
      }
      goto LABEL_50;
    }
  }
  else if ((v12 & 0x40000) == 0)
  {
    goto LABEL_24;
  }
  self->_passiveCaptivityDetected = *((unsigned char *)a3 + 105);
  *(_DWORD *)&self->_has |= 0x40000u;
  int v12 = *((_DWORD *)a3 + 27);
  if ((v12 & 0x10) == 0)
  {
LABEL_25:
    if ((v12 & 0x20) == 0) {
      goto LABEL_26;
    }
    goto LABEL_51;
  }
LABEL_50:
  self->_passiveCaptivityCorrectDetection = *((_DWORD *)a3 + 16);
  *(_DWORD *)&self->_has |= 0x10u;
  int v12 = *((_DWORD *)a3 + 27);
  if ((v12 & 0x20) == 0)
  {
LABEL_26:
    if ((v12 & 0x8000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_52;
  }
LABEL_51:
  self->_passiveCaptivityIncorrectDetection = *((_DWORD *)a3 + 17);
  *(_DWORD *)&self->_has |= 0x20u;
  int v12 = *((_DWORD *)a3 + 27);
  if ((v12 & 0x8000) == 0)
  {
LABEL_27:
    if ((v12 & 0x10000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_53;
  }
LABEL_52:
  self->_handlerCNPTriggeredLogOff = *((unsigned char *)a3 + 102);
  *(_DWORD *)&self->_has |= 0x8000u;
  int v12 = *((_DWORD *)a3 + 27);
  if ((v12 & 0x10000) == 0)
  {
LABEL_28:
    if ((v12 & 8) == 0) {
      goto LABEL_29;
    }
    goto LABEL_54;
  }
LABEL_53:
  self->_isDetectedCaptive = *((unsigned char *)a3 + 103);
  *(_DWORD *)&self->_has |= 0x10000u;
  int v12 = *((_DWORD *)a3 + 27);
  if ((v12 & 8) == 0)
  {
LABEL_29:
    if ((v12 & 4) == 0) {
      goto LABEL_30;
    }
    goto LABEL_55;
  }
LABEL_54:
  self->_durationOnNetwork = *((_DWORD *)a3 + 10);
  *(_DWORD *)&self->_has |= 8u;
  int v12 = *((_DWORD *)a3 + 27);
  if ((v12 & 4) == 0)
  {
LABEL_30:
    if ((v12 & 0x40) == 0) {
      goto LABEL_32;
    }
    goto LABEL_31;
  }
LABEL_55:
  self->_durationNetworkNotCaptive = *((_DWORD *)a3 + 9);
  *(_DWORD *)&self->_has |= 4u;
  if ((*((_DWORD *)a3 + 27) & 0x40) != 0)
  {
LABEL_31:
    self->_passiveCaptivitySymptom = *((_DWORD *)a3 + 18);
    *(_DWORD *)&self->_has |= 0x40u;
  }
LABEL_32:
  if (*((void *)a3 + 2)) {
    -[AWDCaptiveSession setAppTriggeredPassiveSymptom:](self, "setAppTriggeredPassiveSymptom:");
  }
  int v13 = *((_DWORD *)a3 + 27);
  if ((v13 & 0x20000) != 0)
  {
    self->_nonCaptiveDetectedAsCaptive = *((unsigned char *)a3 + 104);
    *(_DWORD *)&self->_has |= 0x20000u;
    int v13 = *((_DWORD *)a3 + 27);
    if ((v13 & 0x80) == 0)
    {
LABEL_36:
      if ((v13 & 0x1000) == 0) {
        goto LABEL_37;
      }
      goto LABEL_59;
    }
  }
  else if ((v13 & 0x80) == 0)
  {
    goto LABEL_36;
  }
  self->_uint64_t redirectURLType = *((_DWORD *)a3 + 19);
  *(_DWORD *)&self->_has |= 0x80u;
  int v13 = *((_DWORD *)a3 + 27);
  if ((v13 & 0x1000) == 0)
  {
LABEL_37:
    if ((v13 & 0x800) == 0) {
      return;
    }
    goto LABEL_38;
  }
LABEL_59:
  self->_uint64_t whiteListProbeStatus = *((_DWORD *)a3 + 24);
  *(_DWORD *)&self->_has |= 0x1000u;
  if ((*((_DWORD *)a3 + 27) & 0x800) == 0) {
    return;
  }
LABEL_38:
  self->_whiteListProbeCompletionTime = *((_DWORD *)a3 + 23);
  *(_DWORD *)&self->_has |= 0x800u;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)result
{
  return self->_result;
}

- (unsigned)websheetProbeCount
{
  return self->_websheetProbeCount;
}

- (BOOL)websheetScraped
{
  return self->_websheetScraped;
}

- (unsigned)websheetScrapeResult
{
  return self->_websheetScrapeResult;
}

- (NSMutableArray)installedCNPDisplayIDs
{
  return self->_installedCNPDisplayIDs;
}

- (void)setInstalledCNPDisplayIDs:(id)a3
{
}

- (NSString)handlerCNP
{
  return self->_handlerCNP;
}

- (void)setHandlerCNP:(id)a3
{
}

- (BOOL)detectedNotCaptiveHandledByCNP
{
  return self->_detectedNotCaptiveHandledByCNP;
}

- (unsigned)autoLoginType
{
  return self->_autoLoginType;
}

- (BOOL)autoLoginFailed
{
  return self->_autoLoginFailed;
}

- (NSString)autoLoginCarrierID
{
  return self->_autoLoginCarrierID;
}

- (void)setAutoLoginCarrierID:(id)a3
{
}

- (BOOL)wisprDetected
{
  return self->_wisprDetected;
}

- (BOOL)passiveCaptivityDetected
{
  return self->_passiveCaptivityDetected;
}

- (unsigned)passiveCaptivityCorrectDetection
{
  return self->_passiveCaptivityCorrectDetection;
}

- (unsigned)passiveCaptivityIncorrectDetection
{
  return self->_passiveCaptivityIncorrectDetection;
}

- (BOOL)handlerCNPTriggeredLogOff
{
  return self->_handlerCNPTriggeredLogOff;
}

- (BOOL)isDetectedCaptive
{
  return self->_isDetectedCaptive;
}

- (unsigned)durationOnNetwork
{
  return self->_durationOnNetwork;
}

- (unsigned)durationNetworkNotCaptive
{
  return self->_durationNetworkNotCaptive;
}

- (unsigned)passiveCaptivitySymptom
{
  return self->_passiveCaptivitySymptom;
}

- (NSString)appTriggeredPassiveSymptom
{
  return self->_appTriggeredPassiveSymptom;
}

- (void)setAppTriggeredPassiveSymptom:(id)a3
{
}

- (BOOL)nonCaptiveDetectedAsCaptive
{
  return self->_nonCaptiveDetectedAsCaptive;
}

- (unsigned)whiteListProbeCompletionTime
{
  return self->_whiteListProbeCompletionTime;
}

@end