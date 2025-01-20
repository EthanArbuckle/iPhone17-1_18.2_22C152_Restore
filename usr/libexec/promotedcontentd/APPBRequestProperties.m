@interface APPBRequestProperties
+ (Class)userKeyboardType;
- (BOOL)allowITunes;
- (BOOL)allowInstallApps;
- (BOOL)denyExplicit;
- (BOOL)hasAccountType;
- (BOOL)hasAdministrativeArea;
- (BOOL)hasAdvertisingIdentifierMonthResetCount;
- (BOOL)hasAllowITunes;
- (BOOL)hasAllowInstallApps;
- (BOOL)hasAnonymousDemandiAdID;
- (BOOL)hasAppID;
- (BOOL)hasAppStoreViewAdVersion;
- (BOOL)hasAppVersion;
- (BOOL)hasApplicationLinkedOnOS;
- (BOOL)hasAppsRank;
- (BOOL)hasCampaignNameSpace;
- (BOOL)hasCarrierMCC;
- (BOOL)hasCarrierMNC;
- (BOOL)hasClientClockTime;
- (BOOL)hasConnectionType;
- (BOOL)hasContentiAdID;
- (BOOL)hasCountryCode;
- (BOOL)hasDPID;
- (BOOL)hasDenyExplicit;
- (BOOL)hasDeviceMode;
- (BOOL)hasDeviceModel;
- (BOOL)hasIAdID;
- (BOOL)hasITunesStore;
- (BOOL)hasInternalUserWantsProdAds;
- (BOOL)hasIsOnInternationalDataRoaming;
- (BOOL)hasIsTest;
- (BOOL)hasIsoCountryCode;
- (BOOL)hasLimitAdTracking;
- (BOOL)hasLocalBandwidth;
- (BOOL)hasLocalBandwidthBytes;
- (BOOL)hasLocalBandwidthStddev;
- (BOOL)hasLocalLatency;
- (BOOL)hasLocalLatencyCount;
- (BOOL)hasLocalLatencyStddev;
- (BOOL)hasLocaleIdentifier;
- (BOOL)hasLocality;
- (BOOL)hasMoviesRank;
- (BOOL)hasOsVersionAndBuild;
- (BOOL)hasPostalCode;
- (BOOL)hasRunState;
- (BOOL)hasSubAdministrativeArea;
- (BOOL)hasTimezone;
- (BOOL)hasTvshowsRank;
- (BOOL)hasUnfilledClientCount;
- (BOOL)hasUnfilledDuration;
- (BOOL)internalUserWantsProdAds;
- (BOOL)isEqual:(id)a3;
- (BOOL)isOnInternationalDataRoaming;
- (BOOL)isTest;
- (BOOL)limitAdTracking;
- (BOOL)readFrom:(id)a3;
- (NSData)anonymousDemandiAdID;
- (NSData)contentiAdID;
- (NSData)dPID;
- (NSData)iAdID;
- (NSMutableArray)userKeyboards;
- (NSString)administrativeArea;
- (NSString)appID;
- (NSString)appVersion;
- (NSString)applicationLinkedOnOS;
- (NSString)campaignNameSpace;
- (NSString)carrierMCC;
- (NSString)carrierMNC;
- (NSString)countryCode;
- (NSString)deviceModel;
- (NSString)iTunesStore;
- (NSString)isoCountryCode;
- (NSString)localeIdentifier;
- (NSString)locality;
- (NSString)osVersionAndBuild;
- (NSString)postalCode;
- (NSString)subAdministrativeArea;
- (double)clientClockTime;
- (float)localBandwidth;
- (float)localBandwidthBytes;
- (float)localBandwidthStddev;
- (float)localLatency;
- (float)localLatencyStddev;
- (float)timezone;
- (float)unfilledDuration;
- (id)accountTypeAsString:(int)a3;
- (id)connectionTypeAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)deviceModeAsString:(int)a3;
- (id)dictionaryRepresentation;
- (id)runStateAsString:(int)a3;
- (id)userKeyboardAtIndex:(unint64_t)a3;
- (int)StringAsAccountType:(id)a3;
- (int)StringAsConnectionType:(id)a3;
- (int)StringAsDeviceMode:(id)a3;
- (int)StringAsRunState:(id)a3;
- (int)accountType;
- (int)advertisingIdentifierMonthResetCount;
- (int)appStoreViewAdVersion;
- (int)appsRank;
- (int)connectionType;
- (int)deviceMode;
- (int)localLatencyCount;
- (int)moviesRank;
- (int)runState;
- (int)screenDPI;
- (int)screenHeight;
- (int)screenWidth;
- (int)tvshowsRank;
- (int)unfilledClientCount;
- (unint64_t)hash;
- (unint64_t)userKeyboardsCount;
- (void)addUserKeyboard:(id)a3;
- (void)clearUserKeyboards;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAccountType:(int)a3;
- (void)setAdministrativeArea:(id)a3;
- (void)setAdvertisingIdentifierMonthResetCount:(int)a3;
- (void)setAllowITunes:(BOOL)a3;
- (void)setAllowInstallApps:(BOOL)a3;
- (void)setAnonymousDemandiAdID:(id)a3;
- (void)setAppID:(id)a3;
- (void)setAppStoreViewAdVersion:(int)a3;
- (void)setAppVersion:(id)a3;
- (void)setApplicationLinkedOnOS:(id)a3;
- (void)setAppsRank:(int)a3;
- (void)setCampaignNameSpace:(id)a3;
- (void)setCarrierMCC:(id)a3;
- (void)setCarrierMNC:(id)a3;
- (void)setClientClockTime:(double)a3;
- (void)setConnectionType:(int)a3;
- (void)setContentiAdID:(id)a3;
- (void)setCountryCode:(id)a3;
- (void)setDPID:(id)a3;
- (void)setDenyExplicit:(BOOL)a3;
- (void)setDeviceMode:(int)a3;
- (void)setDeviceModel:(id)a3;
- (void)setHasAccountType:(BOOL)a3;
- (void)setHasAdvertisingIdentifierMonthResetCount:(BOOL)a3;
- (void)setHasAllowITunes:(BOOL)a3;
- (void)setHasAllowInstallApps:(BOOL)a3;
- (void)setHasAppStoreViewAdVersion:(BOOL)a3;
- (void)setHasAppsRank:(BOOL)a3;
- (void)setHasClientClockTime:(BOOL)a3;
- (void)setHasConnectionType:(BOOL)a3;
- (void)setHasDenyExplicit:(BOOL)a3;
- (void)setHasDeviceMode:(BOOL)a3;
- (void)setHasInternalUserWantsProdAds:(BOOL)a3;
- (void)setHasIsOnInternationalDataRoaming:(BOOL)a3;
- (void)setHasIsTest:(BOOL)a3;
- (void)setHasLimitAdTracking:(BOOL)a3;
- (void)setHasLocalBandwidth:(BOOL)a3;
- (void)setHasLocalBandwidthBytes:(BOOL)a3;
- (void)setHasLocalBandwidthStddev:(BOOL)a3;
- (void)setHasLocalLatency:(BOOL)a3;
- (void)setHasLocalLatencyCount:(BOOL)a3;
- (void)setHasLocalLatencyStddev:(BOOL)a3;
- (void)setHasMoviesRank:(BOOL)a3;
- (void)setHasRunState:(BOOL)a3;
- (void)setHasTimezone:(BOOL)a3;
- (void)setHasTvshowsRank:(BOOL)a3;
- (void)setHasUnfilledClientCount:(BOOL)a3;
- (void)setHasUnfilledDuration:(BOOL)a3;
- (void)setIAdID:(id)a3;
- (void)setITunesStore:(id)a3;
- (void)setInternalUserWantsProdAds:(BOOL)a3;
- (void)setIsOnInternationalDataRoaming:(BOOL)a3;
- (void)setIsTest:(BOOL)a3;
- (void)setIsoCountryCode:(id)a3;
- (void)setLimitAdTracking:(BOOL)a3;
- (void)setLocalBandwidth:(float)a3;
- (void)setLocalBandwidthBytes:(float)a3;
- (void)setLocalBandwidthStddev:(float)a3;
- (void)setLocalLatency:(float)a3;
- (void)setLocalLatencyCount:(int)a3;
- (void)setLocalLatencyStddev:(float)a3;
- (void)setLocaleIdentifier:(id)a3;
- (void)setLocality:(id)a3;
- (void)setMoviesRank:(int)a3;
- (void)setOsVersionAndBuild:(id)a3;
- (void)setPostalCode:(id)a3;
- (void)setRunState:(int)a3;
- (void)setScreenDPI:(int)a3;
- (void)setScreenHeight:(int)a3;
- (void)setScreenWidth:(int)a3;
- (void)setSubAdministrativeArea:(id)a3;
- (void)setTimezone:(float)a3;
- (void)setTvshowsRank:(int)a3;
- (void)setUnfilledClientCount:(int)a3;
- (void)setUnfilledDuration:(float)a3;
- (void)setUserKeyboards:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation APPBRequestProperties

- (BOOL)hasDeviceModel
{
  return self->_deviceModel != 0;
}

- (BOOL)hasAppID
{
  return self->_appID != 0;
}

- (int)runState
{
  if ((*((unsigned char *)&self->_has + 1) & 0x40) != 0) {
    return self->_runState;
  }
  else {
    return 0;
  }
}

- (void)setRunState:(int)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_runState = a3;
}

- (void)setHasRunState:(BOOL)a3
{
  if (a3) {
    int v3 = 0x4000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($91ED43557AAACFFE87335DF110E99599)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasRunState
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (id)runStateAsString:(int)a3
{
  if (a3 >= 3)
  {
    int v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    int v3 = *(&off_100235D08 + a3);
  }

  return v3;
}

- (int)StringAsRunState:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Simulator"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"DevelopmentDevice"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"ConsumerDevice"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasCarrierMNC
{
  return self->_carrierMNC != 0;
}

- (BOOL)hasCarrierMCC
{
  return self->_carrierMCC != 0;
}

- (void)setIsOnInternationalDataRoaming:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x800000u;
  self->_isOnInternationalDataRoaming = a3;
}

- (void)setHasIsOnInternationalDataRoaming:(BOOL)a3
{
  if (a3) {
    int v3 = 0x800000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($91ED43557AAACFFE87335DF110E99599)(*(_DWORD *)&self->_has & 0xFF7FFFFF | v3);
}

- (BOOL)hasIsOnInternationalDataRoaming
{
  return *((unsigned __int8 *)&self->_has + 2) >> 7;
}

- (int)connectionType
{
  if ((*(unsigned char *)&self->_has & 0x20) != 0) {
    return self->_connectionType;
  }
  else {
    return 0;
  }
}

- (void)setConnectionType:(int)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_connectionType = a3;
}

- (void)setHasConnectionType:(BOOL)a3
{
  if (a3) {
    int v3 = 32;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($91ED43557AAACFFE87335DF110E99599)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasConnectionType
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (id)connectionTypeAsString:(int)a3
{
  if (a3 >= 0xB)
  {
    int v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    int v3 = *(&off_100235D20 + a3);
  }

  return v3;
}

- (int)StringAsConnectionType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UnknownConnection"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"None"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"WiFi"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"Cellular_2_G"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"Cellular_2_5G"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"Cellular_3_G"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"Cellular_3_5G"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"Cellular_3_75G"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"Cellular_H_Plus"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"Cellular_4G"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"Cellular_5G"])
  {
    int v4 = 10;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setTimezone:(float)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_timezone = a3;
}

- (void)setHasTimezone:(BOOL)a3
{
  if (a3) {
    int v3 = 0x8000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($91ED43557AAACFFE87335DF110E99599)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasTimezone
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)clearUserKeyboards
{
}

- (void)addUserKeyboard:(id)a3
{
  id v4 = a3;
  userKeyboards = self->_userKeyboards;
  id v8 = v4;
  if (!userKeyboards)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_userKeyboards;
    self->_userKeyboards = v6;

    id v4 = v8;
    userKeyboards = self->_userKeyboards;
  }
  [(NSMutableArray *)userKeyboards addObject:v4];
}

- (unint64_t)userKeyboardsCount
{
  return (unint64_t)[(NSMutableArray *)self->_userKeyboards count];
}

- (id)userKeyboardAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_userKeyboards objectAtIndex:a3];
}

+ (Class)userKeyboardType
{
  return (Class)objc_opt_class();
}

- (void)setClientClockTime:(double)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_clientClockTime = a3;
}

- (void)setHasClientClockTime:(BOOL)a3
{
  self->_has = ($91ED43557AAACFFE87335DF110E99599)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasClientClockTime
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setLocalLatency:(float)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_localLatency = a3;
}

- (void)setHasLocalLatency:(BOOL)a3
{
  if (a3) {
    int v3 = 1024;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($91ED43557AAACFFE87335DF110E99599)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasLocalLatency
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setLocalLatencyCount:(int)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_localLatencyCount = a3;
}

- (void)setHasLocalLatencyCount:(BOOL)a3
{
  if (a3) {
    int v3 = 2048;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($91ED43557AAACFFE87335DF110E99599)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasLocalLatencyCount
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setLocalLatencyStddev:(float)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_localLatencyStddev = a3;
}

- (void)setHasLocalLatencyStddev:(BOOL)a3
{
  if (a3) {
    int v3 = 4096;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($91ED43557AAACFFE87335DF110E99599)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasLocalLatencyStddev
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setLocalBandwidth:(float)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_localBandwidth = a3;
}

- (void)setHasLocalBandwidth:(BOOL)a3
{
  if (a3) {
    int v3 = 128;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($91ED43557AAACFFE87335DF110E99599)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasLocalBandwidth
{
  return *(unsigned char *)&self->_has >> 7;
}

- (void)setLocalBandwidthBytes:(float)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_localBandwidthBytes = a3;
}

- (void)setHasLocalBandwidthBytes:(BOOL)a3
{
  if (a3) {
    int v3 = 256;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($91ED43557AAACFFE87335DF110E99599)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasLocalBandwidthBytes
{
  return *((unsigned char *)&self->_has + 1) & 1;
}

- (void)setLocalBandwidthStddev:(float)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_localBandwidthStddev = a3;
}

- (void)setHasLocalBandwidthStddev:(BOOL)a3
{
  if (a3) {
    int v3 = 512;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($91ED43557AAACFFE87335DF110E99599)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasLocalBandwidthStddev
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (BOOL)hasIAdID
{
  return self->_iAdID != 0;
}

- (BOOL)hasAppVersion
{
  return self->_appVersion != 0;
}

- (void)setDenyExplicit:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x200000u;
  self->_denyExplicit = a3;
}

- (void)setHasDenyExplicit:(BOOL)a3
{
  if (a3) {
    int v3 = 0x200000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($91ED43557AAACFFE87335DF110E99599)(*(_DWORD *)&self->_has & 0xFFDFFFFF | v3);
}

- (BOOL)hasDenyExplicit
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (BOOL)hasCountryCode
{
  return self->_countryCode != 0;
}

- (void)setAppsRank:(int)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_appsRank = a3;
}

- (void)setHasAppsRank:(BOOL)a3
{
  if (a3) {
    int v3 = 16;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($91ED43557AAACFFE87335DF110E99599)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasAppsRank
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setMoviesRank:(int)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_moviesRank = a3;
}

- (void)setHasMoviesRank:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($91ED43557AAACFFE87335DF110E99599)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasMoviesRank
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setTvshowsRank:(int)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_tvshowsRank = a3;
}

- (void)setHasTvshowsRank:(BOOL)a3
{
  if (a3) {
    int v3 = 0x10000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($91ED43557AAACFFE87335DF110E99599)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasTvshowsRank
{
  return *((unsigned char *)&self->_has + 2) & 1;
}

- (void)setAllowInstallApps:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x100000u;
  self->_allowInstallApps = a3;
}

- (void)setHasAllowInstallApps:(BOOL)a3
{
  if (a3) {
    int v3 = 0x100000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($91ED43557AAACFFE87335DF110E99599)(*(_DWORD *)&self->_has & 0xFFEFFFFF | v3);
}

- (BOOL)hasAllowInstallApps
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (void)setAllowITunes:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x80000u;
  self->_allowITunes = a3;
}

- (void)setHasAllowITunes:(BOOL)a3
{
  if (a3) {
    int v3 = 0x80000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($91ED43557AAACFFE87335DF110E99599)(*(_DWORD *)&self->_has & 0xFFF7FFFF | v3);
}

- (BOOL)hasAllowITunes
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (BOOL)hasOsVersionAndBuild
{
  return self->_osVersionAndBuild != 0;
}

- (BOOL)hasLocaleIdentifier
{
  return self->_localeIdentifier != 0;
}

- (void)setUnfilledDuration:(float)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_unfilledDuration = a3;
}

- (void)setHasUnfilledDuration:(BOOL)a3
{
  if (a3) {
    int v3 = 0x40000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($91ED43557AAACFFE87335DF110E99599)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (BOOL)hasUnfilledDuration
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setUnfilledClientCount:(int)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_unfilledClientCount = a3;
}

- (void)setHasUnfilledClientCount:(BOOL)a3
{
  if (a3) {
    int v3 = 0x20000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($91ED43557AAACFFE87335DF110E99599)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasUnfilledClientCount
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (BOOL)hasITunesStore
{
  return self->_iTunesStore != 0;
}

- (BOOL)hasApplicationLinkedOnOS
{
  return self->_applicationLinkedOnOS != 0;
}

- (BOOL)hasAnonymousDemandiAdID
{
  return self->_anonymousDemandiAdID != 0;
}

- (BOOL)hasContentiAdID
{
  return self->_contentiAdID != 0;
}

- (int)deviceMode
{
  if ((*(unsigned char *)&self->_has & 0x40) != 0) {
    return self->_deviceMode;
  }
  else {
    return 0;
  }
}

- (void)setDeviceMode:(int)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_deviceMode = a3;
}

- (void)setHasDeviceMode:(BOOL)a3
{
  if (a3) {
    int v3 = 64;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($91ED43557AAACFFE87335DF110E99599)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasDeviceMode
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (id)deviceModeAsString:(int)a3
{
  if (a3 >= 3)
  {
    int v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    int v3 = *(&off_100235D78 + a3);
  }

  return v3;
}

- (int)StringAsDeviceMode:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Default"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"EducationMode"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"GuestMode"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)accountType
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_accountType;
  }
  else {
    return 0;
  }
}

- (void)setAccountType:(int)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_accountType = a3;
}

- (void)setHasAccountType:(BOOL)a3
{
  if (a3) {
    int v3 = 2;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($91ED43557AAACFFE87335DF110E99599)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasAccountType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)accountTypeAsString:(int)a3
{
  if (a3 >= 8)
  {
    int v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    int v3 = *(&off_100235D90 + a3);
  }

  return v3;
}

- (int)StringAsAccountType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"NoAccount"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"Consumer"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"ManagedAccount"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"U13"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"T13"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"U18"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"Unknown_Age"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"SensitiveContentEligible"])
  {
    int v4 = 7;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasDPID
{
  return self->_dPID != 0;
}

- (BOOL)hasLocality
{
  return self->_locality != 0;
}

- (BOOL)hasAdministrativeArea
{
  return self->_administrativeArea != 0;
}

- (BOOL)hasSubAdministrativeArea
{
  return self->_subAdministrativeArea != 0;
}

- (BOOL)hasIsoCountryCode
{
  return self->_isoCountryCode != 0;
}

- (BOOL)hasPostalCode
{
  return self->_postalCode != 0;
}

- (void)setIsTest:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x1000000u;
  self->_isTest = a3;
}

- (void)setHasIsTest:(BOOL)a3
{
  if (a3) {
    int v3 = 0x1000000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($91ED43557AAACFFE87335DF110E99599)(*(_DWORD *)&self->_has & 0xFEFFFFFF | v3);
}

- (BOOL)hasIsTest
{
  return *((unsigned char *)&self->_has + 3) & 1;
}

- (BOOL)hasCampaignNameSpace
{
  return self->_campaignNameSpace != 0;
}

- (void)setAdvertisingIdentifierMonthResetCount:(int)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_advertisingIdentifierMonthResetCount = a3;
}

- (void)setHasAdvertisingIdentifierMonthResetCount:(BOOL)a3
{
  if (a3) {
    int v3 = 4;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($91ED43557AAACFFE87335DF110E99599)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasAdvertisingIdentifierMonthResetCount
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setLimitAdTracking:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x2000000u;
  self->_limitAdTracking = a3;
}

- (void)setHasLimitAdTracking:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($91ED43557AAACFFE87335DF110E99599)(*(_DWORD *)&self->_has & 0xFDFFFFFF | v3);
}

- (BOOL)hasLimitAdTracking
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 1) & 1;
}

- (void)setInternalUserWantsProdAds:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x400000u;
  self->_internalUserWantsProdAds = a3;
}

- (void)setHasInternalUserWantsProdAds:(BOOL)a3
{
  if (a3) {
    int v3 = 0x400000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($91ED43557AAACFFE87335DF110E99599)(*(_DWORD *)&self->_has & 0xFFBFFFFF | v3);
}

- (BOOL)hasInternalUserWantsProdAds
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
}

- (void)setAppStoreViewAdVersion:(int)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_appStoreViewAdVersion = a3;
}

- (void)setHasAppStoreViewAdVersion:(BOOL)a3
{
  if (a3) {
    int v3 = 8;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($91ED43557AAACFFE87335DF110E99599)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasAppStoreViewAdVersion
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)APPBRequestProperties;
  int v3 = [(APPBRequestProperties *)&v7 description];
  int v4 = [(APPBRequestProperties *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  int v3 = +[NSMutableDictionary dictionary];
  v5 = v3;
  deviceModel = self->_deviceModel;
  if (deviceModel) {
    [v3 setObject:deviceModel forKey:@"deviceModel"];
  }
  appID = self->_appID;
  if (appID) {
    [v5 setObject:appID forKey:@"appID"];
  }
  if ((*((unsigned char *)&self->_has + 1) & 0x40) != 0)
  {
    uint64_t runState = self->_runState;
    if (runState >= 3)
    {
      v9 = +[NSString stringWithFormat:@"(unknown: %i)", self->_runState];
    }
    else
    {
      v9 = *(&off_100235D08 + runState);
    }
    [v5 setObject:v9 forKey:@"runState"];
  }
  carrierMNC = self->_carrierMNC;
  if (carrierMNC) {
    [v5 setObject:carrierMNC forKey:@"carrierMNC"];
  }
  carrierMCC = self->_carrierMCC;
  if (carrierMCC) {
    [v5 setObject:carrierMCC forKey:@"carrierMCC"];
  }
  $91ED43557AAACFFE87335DF110E99599 has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) != 0)
  {
    v39 = +[NSNumber numberWithBool:self->_isOnInternationalDataRoaming];
    [v5 setObject:v39 forKey:@"isOnInternationalDataRoaming"];

    $91ED43557AAACFFE87335DF110E99599 has = self->_has;
    if ((*(unsigned char *)&has & 0x20) == 0)
    {
LABEL_16:
      if ((*(_WORD *)&has & 0x8000) == 0) {
        goto LABEL_18;
      }
      goto LABEL_17;
    }
  }
  else if ((*(unsigned char *)&has & 0x20) == 0)
  {
    goto LABEL_16;
  }
  uint64_t connectionType = self->_connectionType;
  if (connectionType >= 0xB)
  {
    v41 = +[NSString stringWithFormat:@"(unknown: %i)", self->_connectionType];
  }
  else
  {
    v41 = *(&off_100235D20 + connectionType);
  }
  [v5 setObject:v41 forKey:@"connectionType"];

  if ((*(_DWORD *)&self->_has & 0x8000) != 0)
  {
LABEL_17:
    *(float *)&double v4 = self->_timezone;
    v13 = +[NSNumber numberWithFloat:v4];
    [v5 setObject:v13 forKey:@"timezone"];
  }
LABEL_18:
  v14 = +[NSNumber numberWithInt:self->_screenWidth];
  [v5 setObject:v14 forKey:@"screenWidth"];

  v15 = +[NSNumber numberWithInt:self->_screenHeight];
  [v5 setObject:v15 forKey:@"screenHeight"];

  v16 = +[NSNumber numberWithInt:self->_screenDPI];
  [v5 setObject:v16 forKey:@"screenDPI"];

  userKeyboards = self->_userKeyboards;
  if (userKeyboards) {
    [v5 setObject:userKeyboards forKey:@"userKeyboard"];
  }
  $91ED43557AAACFFE87335DF110E99599 v19 = self->_has;
  if (*(unsigned char *)&v19)
  {
    v42 = +[NSNumber numberWithDouble:self->_clientClockTime];
    [v5 setObject:v42 forKey:@"clientClockTime"];

    $91ED43557AAACFFE87335DF110E99599 v19 = self->_has;
    if ((*(_WORD *)&v19 & 0x400) == 0)
    {
LABEL_22:
      if ((*(_WORD *)&v19 & 0x800) == 0) {
        goto LABEL_23;
      }
      goto LABEL_66;
    }
  }
  else if ((*(_WORD *)&v19 & 0x400) == 0)
  {
    goto LABEL_22;
  }
  *(float *)&double v17 = self->_localLatency;
  v43 = +[NSNumber numberWithFloat:v17];
  [v5 setObject:v43 forKey:@"localLatency"];

  $91ED43557AAACFFE87335DF110E99599 v19 = self->_has;
  if ((*(_WORD *)&v19 & 0x800) == 0)
  {
LABEL_23:
    if ((*(_WORD *)&v19 & 0x1000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_67;
  }
LABEL_66:
  v44 = +[NSNumber numberWithInt:self->_localLatencyCount];
  [v5 setObject:v44 forKey:@"localLatencyCount"];

  $91ED43557AAACFFE87335DF110E99599 v19 = self->_has;
  if ((*(_WORD *)&v19 & 0x1000) == 0)
  {
LABEL_24:
    if ((*(unsigned char *)&v19 & 0x80) == 0) {
      goto LABEL_25;
    }
    goto LABEL_68;
  }
LABEL_67:
  *(float *)&double v17 = self->_localLatencyStddev;
  v45 = +[NSNumber numberWithFloat:v17];
  [v5 setObject:v45 forKey:@"localLatencyStddev"];

  $91ED43557AAACFFE87335DF110E99599 v19 = self->_has;
  if ((*(unsigned char *)&v19 & 0x80) == 0)
  {
LABEL_25:
    if ((*(_WORD *)&v19 & 0x100) == 0) {
      goto LABEL_26;
    }
    goto LABEL_69;
  }
LABEL_68:
  *(float *)&double v17 = self->_localBandwidth;
  v46 = +[NSNumber numberWithFloat:v17];
  [v5 setObject:v46 forKey:@"localBandwidth"];

  $91ED43557AAACFFE87335DF110E99599 v19 = self->_has;
  if ((*(_WORD *)&v19 & 0x100) == 0)
  {
LABEL_26:
    if ((*(_WORD *)&v19 & 0x200) == 0) {
      goto LABEL_28;
    }
    goto LABEL_27;
  }
LABEL_69:
  *(float *)&double v17 = self->_localBandwidthBytes;
  v47 = +[NSNumber numberWithFloat:v17];
  [v5 setObject:v47 forKey:@"localBandwidthBytes"];

  if ((*(_DWORD *)&self->_has & 0x200) != 0)
  {
LABEL_27:
    *(float *)&double v17 = self->_localBandwidthStddev;
    v20 = +[NSNumber numberWithFloat:v17];
    [v5 setObject:v20 forKey:@"localBandwidthStddev"];
  }
LABEL_28:
  iAdID = self->_iAdID;
  if (iAdID) {
    [v5 setObject:iAdID forKey:@"iAdID"];
  }
  appVersion = self->_appVersion;
  if (appVersion) {
    [v5 setObject:appVersion forKey:@"appVersion"];
  }
  if ((*((unsigned char *)&self->_has + 2) & 0x20) != 0)
  {
    v23 = +[NSNumber numberWithBool:self->_denyExplicit];
    [v5 setObject:v23 forKey:@"denyExplicit"];
  }
  countryCode = self->_countryCode;
  if (countryCode) {
    [v5 setObject:countryCode forKey:@"countryCode"];
  }
  $91ED43557AAACFFE87335DF110E99599 v25 = self->_has;
  if ((*(unsigned char *)&v25 & 0x10) != 0)
  {
    v48 = +[NSNumber numberWithInt:self->_appsRank];
    [v5 setObject:v48 forKey:@"appsRank"];

    $91ED43557AAACFFE87335DF110E99599 v25 = self->_has;
    if ((*(_WORD *)&v25 & 0x2000) == 0)
    {
LABEL_38:
      if ((*(_DWORD *)&v25 & 0x10000) == 0) {
        goto LABEL_39;
      }
      goto LABEL_73;
    }
  }
  else if ((*(_WORD *)&v25 & 0x2000) == 0)
  {
    goto LABEL_38;
  }
  v49 = +[NSNumber numberWithInt:self->_moviesRank];
  [v5 setObject:v49 forKey:@"moviesRank"];

  $91ED43557AAACFFE87335DF110E99599 v25 = self->_has;
  if ((*(_DWORD *)&v25 & 0x10000) == 0)
  {
LABEL_39:
    if ((*(_DWORD *)&v25 & 0x100000) == 0) {
      goto LABEL_40;
    }
    goto LABEL_74;
  }
LABEL_73:
  v50 = +[NSNumber numberWithInt:self->_tvshowsRank];
  [v5 setObject:v50 forKey:@"tvshowsRank"];

  $91ED43557AAACFFE87335DF110E99599 v25 = self->_has;
  if ((*(_DWORD *)&v25 & 0x100000) == 0)
  {
LABEL_40:
    if ((*(_DWORD *)&v25 & 0x80000) == 0) {
      goto LABEL_42;
    }
    goto LABEL_41;
  }
LABEL_74:
  v51 = +[NSNumber numberWithBool:self->_allowInstallApps];
  [v5 setObject:v51 forKey:@"allowInstallApps"];

  if ((*(_DWORD *)&self->_has & 0x80000) != 0)
  {
LABEL_41:
    v26 = +[NSNumber numberWithBool:self->_allowITunes];
    [v5 setObject:v26 forKey:@"allowITunes"];
  }
LABEL_42:
  osVersionAndBuild = self->_osVersionAndBuild;
  if (osVersionAndBuild) {
    [v5 setObject:osVersionAndBuild forKey:@"osVersionAndBuild"];
  }
  localeIdentifier = self->_localeIdentifier;
  if (localeIdentifier) {
    [v5 setObject:localeIdentifier forKey:@"localeIdentifier"];
  }
  $91ED43557AAACFFE87335DF110E99599 v29 = self->_has;
  if ((*(_DWORD *)&v29 & 0x40000) != 0)
  {
    *(float *)&double v17 = self->_unfilledDuration;
    v30 = +[NSNumber numberWithFloat:v17];
    [v5 setObject:v30 forKey:@"unfilledDuration"];

    $91ED43557AAACFFE87335DF110E99599 v29 = self->_has;
  }
  if ((*(_DWORD *)&v29 & 0x20000) != 0)
  {
    v31 = +[NSNumber numberWithInt:self->_unfilledClientCount];
    [v5 setObject:v31 forKey:@"unfilledClientCount"];
  }
  iTunesStore = self->_iTunesStore;
  if (iTunesStore) {
    [v5 setObject:iTunesStore forKey:@"iTunesStore"];
  }
  applicationLinkedOnOS = self->_applicationLinkedOnOS;
  if (applicationLinkedOnOS) {
    [v5 setObject:applicationLinkedOnOS forKey:@"applicationLinkedOnOS"];
  }
  anonymousDemandiAdID = self->_anonymousDemandiAdID;
  if (anonymousDemandiAdID) {
    [v5 setObject:anonymousDemandiAdID forKey:@"anonymousDemandiAdID"];
  }
  contentiAdID = self->_contentiAdID;
  if (contentiAdID) {
    [v5 setObject:contentiAdID forKey:@"contentiAdID"];
  }
  $91ED43557AAACFFE87335DF110E99599 v36 = self->_has;
  if ((*(unsigned char *)&v36 & 0x40) != 0)
  {
    uint64_t deviceMode = self->_deviceMode;
    if (deviceMode >= 3)
    {
      v38 = +[NSString stringWithFormat:@"(unknown: %i)", self->_deviceMode];
    }
    else
    {
      v38 = *(&off_100235D78 + deviceMode);
    }
    [v5 setObject:v38 forKey:@"deviceMode"];

    $91ED43557AAACFFE87335DF110E99599 v36 = self->_has;
  }
  if ((*(unsigned char *)&v36 & 2) != 0)
  {
    uint64_t accountType = self->_accountType;
    if (accountType >= 8)
    {
      v53 = +[NSString stringWithFormat:@"(unknown: %i)", self->_accountType];
    }
    else
    {
      v53 = *(&off_100235D90 + accountType);
    }
    [v5 setObject:v53 forKey:@"accountType"];
  }
  dPID = self->_dPID;
  if (dPID) {
    [v5 setObject:dPID forKey:@"DPID"];
  }
  locality = self->_locality;
  if (locality) {
    [v5 setObject:locality forKey:@"locality"];
  }
  administrativeArea = self->_administrativeArea;
  if (administrativeArea) {
    [v5 setObject:administrativeArea forKey:@"administrativeArea"];
  }
  subAdministrativeArea = self->_subAdministrativeArea;
  if (subAdministrativeArea) {
    [v5 setObject:subAdministrativeArea forKey:@"subAdministrativeArea"];
  }
  isoCountryCode = self->_isoCountryCode;
  if (isoCountryCode) {
    [v5 setObject:isoCountryCode forKey:@"isoCountryCode"];
  }
  postalCode = self->_postalCode;
  if (postalCode) {
    [v5 setObject:postalCode forKey:@"postalCode"];
  }
  if (*((unsigned char *)&self->_has + 3))
  {
    v60 = +[NSNumber numberWithBool:self->_isTest];
    [v5 setObject:v60 forKey:@"isTest"];
  }
  campaignNameSpace = self->_campaignNameSpace;
  if (campaignNameSpace) {
    [v5 setObject:campaignNameSpace forKey:@"campaignNameSpace"];
  }
  $91ED43557AAACFFE87335DF110E99599 v62 = self->_has;
  if ((*(unsigned char *)&v62 & 4) != 0)
  {
    v66 = +[NSNumber numberWithInt:self->_advertisingIdentifierMonthResetCount];
    [v5 setObject:v66 forKey:@"advertisingIdentifierMonthResetCount"];

    $91ED43557AAACFFE87335DF110E99599 v62 = self->_has;
    if ((*(_DWORD *)&v62 & 0x2000000) == 0)
    {
LABEL_104:
      if ((*(_DWORD *)&v62 & 0x400000) == 0) {
        goto LABEL_105;
      }
LABEL_110:
      v68 = +[NSNumber numberWithBool:self->_internalUserWantsProdAds];
      [v5 setObject:v68 forKey:@"internalUserWantsProdAds"];

      if ((*(_DWORD *)&self->_has & 8) == 0) {
        goto LABEL_107;
      }
      goto LABEL_106;
    }
  }
  else if ((*(_DWORD *)&v62 & 0x2000000) == 0)
  {
    goto LABEL_104;
  }
  v67 = +[NSNumber numberWithBool:self->_limitAdTracking];
  [v5 setObject:v67 forKey:@"limitAdTracking"];

  $91ED43557AAACFFE87335DF110E99599 v62 = self->_has;
  if ((*(_DWORD *)&v62 & 0x400000) != 0) {
    goto LABEL_110;
  }
LABEL_105:
  if ((*(unsigned char *)&v62 & 8) != 0)
  {
LABEL_106:
    v63 = +[NSNumber numberWithInt:self->_appStoreViewAdVersion];
    [v5 setObject:v63 forKey:@"appStoreViewAdVersion"];
  }
LABEL_107:
  id v64 = v5;

  return v64;
}

- (BOOL)readFrom:(id)a3
{
  return APPBRequestPropertiesReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (self->_deviceModel) {
    PBDataWriterWriteStringField();
  }
  if (self->_appID) {
    PBDataWriterWriteStringField();
  }
  if ((*((unsigned char *)&self->_has + 1) & 0x40) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_carrierMNC) {
    PBDataWriterWriteStringField();
  }
  if (self->_carrierMCC) {
    PBDataWriterWriteStringField();
  }
  $91ED43557AAACFFE87335DF110E99599 has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) != 0)
  {
    PBDataWriterWriteBOOLField();
    $91ED43557AAACFFE87335DF110E99599 has = self->_has;
    if ((*(unsigned char *)&has & 0x20) == 0)
    {
LABEL_13:
      if ((*(_WORD *)&has & 0x8000) == 0) {
        goto LABEL_15;
      }
      goto LABEL_14;
    }
  }
  else if ((*(unsigned char *)&has & 0x20) == 0)
  {
    goto LABEL_13;
  }
  PBDataWriterWriteInt32Field();
  if ((*(_DWORD *)&self->_has & 0x8000) != 0) {
LABEL_14:
  }
    PBDataWriterWriteFloatField();
LABEL_15:
  PBDataWriterWriteInt32Field();
  PBDataWriterWriteInt32Field();
  PBDataWriterWriteInt32Field();
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v6 = self->_userKeyboards;
  objc_super v7 = (char *)[(NSMutableArray *)v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      v10 = 0;
      do
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteStringField();
        ++v10;
      }
      while (v8 != v10);
      id v8 = (char *)[(NSMutableArray *)v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  $91ED43557AAACFFE87335DF110E99599 v11 = self->_has;
  if (*(unsigned char *)&v11)
  {
    PBDataWriterWriteDoubleField();
    $91ED43557AAACFFE87335DF110E99599 v11 = self->_has;
    if ((*(_WORD *)&v11 & 0x400) == 0)
    {
LABEL_24:
      if ((*(_WORD *)&v11 & 0x800) == 0) {
        goto LABEL_25;
      }
      goto LABEL_91;
    }
  }
  else if ((*(_WORD *)&v11 & 0x400) == 0)
  {
    goto LABEL_24;
  }
  PBDataWriterWriteFloatField();
  $91ED43557AAACFFE87335DF110E99599 v11 = self->_has;
  if ((*(_WORD *)&v11 & 0x800) == 0)
  {
LABEL_25:
    if ((*(_WORD *)&v11 & 0x1000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_92;
  }
LABEL_91:
  PBDataWriterWriteInt32Field();
  $91ED43557AAACFFE87335DF110E99599 v11 = self->_has;
  if ((*(_WORD *)&v11 & 0x1000) == 0)
  {
LABEL_26:
    if ((*(unsigned char *)&v11 & 0x80) == 0) {
      goto LABEL_27;
    }
    goto LABEL_93;
  }
LABEL_92:
  PBDataWriterWriteFloatField();
  $91ED43557AAACFFE87335DF110E99599 v11 = self->_has;
  if ((*(unsigned char *)&v11 & 0x80) == 0)
  {
LABEL_27:
    if ((*(_WORD *)&v11 & 0x100) == 0) {
      goto LABEL_28;
    }
    goto LABEL_94;
  }
LABEL_93:
  PBDataWriterWriteFloatField();
  $91ED43557AAACFFE87335DF110E99599 v11 = self->_has;
  if ((*(_WORD *)&v11 & 0x100) == 0)
  {
LABEL_28:
    if ((*(_WORD *)&v11 & 0x200) == 0) {
      goto LABEL_30;
    }
    goto LABEL_29;
  }
LABEL_94:
  PBDataWriterWriteFloatField();
  if ((*(_DWORD *)&self->_has & 0x200) != 0) {
LABEL_29:
  }
    PBDataWriterWriteFloatField();
LABEL_30:
  if (self->_iAdID) {
    PBDataWriterWriteDataField();
  }
  if (self->_appVersion) {
    PBDataWriterWriteStringField();
  }
  if ((*((unsigned char *)&self->_has + 2) & 0x20) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_countryCode) {
    PBDataWriterWriteStringField();
  }
  $91ED43557AAACFFE87335DF110E99599 v12 = self->_has;
  if ((*(unsigned char *)&v12 & 0x10) != 0)
  {
    PBDataWriterWriteInt32Field();
    $91ED43557AAACFFE87335DF110E99599 v12 = self->_has;
    if ((*(_WORD *)&v12 & 0x2000) == 0)
    {
LABEL_40:
      if ((*(_DWORD *)&v12 & 0x10000) == 0) {
        goto LABEL_41;
      }
      goto LABEL_98;
    }
  }
  else if ((*(_WORD *)&v12 & 0x2000) == 0)
  {
    goto LABEL_40;
  }
  PBDataWriterWriteInt32Field();
  $91ED43557AAACFFE87335DF110E99599 v12 = self->_has;
  if ((*(_DWORD *)&v12 & 0x10000) == 0)
  {
LABEL_41:
    if ((*(_DWORD *)&v12 & 0x100000) == 0) {
      goto LABEL_42;
    }
    goto LABEL_99;
  }
LABEL_98:
  PBDataWriterWriteInt32Field();
  $91ED43557AAACFFE87335DF110E99599 v12 = self->_has;
  if ((*(_DWORD *)&v12 & 0x100000) == 0)
  {
LABEL_42:
    if ((*(_DWORD *)&v12 & 0x80000) == 0) {
      goto LABEL_44;
    }
    goto LABEL_43;
  }
LABEL_99:
  PBDataWriterWriteBOOLField();
  if ((*(_DWORD *)&self->_has & 0x80000) != 0) {
LABEL_43:
  }
    PBDataWriterWriteBOOLField();
LABEL_44:
  if (self->_osVersionAndBuild) {
    PBDataWriterWriteStringField();
  }
  if (self->_localeIdentifier) {
    PBDataWriterWriteStringField();
  }
  $91ED43557AAACFFE87335DF110E99599 v13 = self->_has;
  if ((*(_DWORD *)&v13 & 0x40000) != 0)
  {
    PBDataWriterWriteFloatField();
    $91ED43557AAACFFE87335DF110E99599 v13 = self->_has;
  }
  if ((*(_DWORD *)&v13 & 0x20000) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_iTunesStore) {
    PBDataWriterWriteStringField();
  }
  if (self->_applicationLinkedOnOS) {
    PBDataWriterWriteStringField();
  }
  if (self->_anonymousDemandiAdID) {
    PBDataWriterWriteDataField();
  }
  if (self->_contentiAdID) {
    PBDataWriterWriteDataField();
  }
  $91ED43557AAACFFE87335DF110E99599 v14 = self->_has;
  if ((*(unsigned char *)&v14 & 0x40) != 0)
  {
    PBDataWriterWriteInt32Field();
    $91ED43557AAACFFE87335DF110E99599 v14 = self->_has;
  }
  if ((*(unsigned char *)&v14 & 2) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_dPID) {
    PBDataWriterWriteDataField();
  }
  if (self->_locality) {
    PBDataWriterWriteStringField();
  }
  if (self->_administrativeArea) {
    PBDataWriterWriteStringField();
  }
  if (self->_subAdministrativeArea) {
    PBDataWriterWriteStringField();
  }
  if (self->_isoCountryCode) {
    PBDataWriterWriteStringField();
  }
  if (self->_postalCode) {
    PBDataWriterWriteStringField();
  }
  if (*((unsigned char *)&self->_has + 3)) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_campaignNameSpace) {
    PBDataWriterWriteStringField();
  }
  $91ED43557AAACFFE87335DF110E99599 v15 = self->_has;
  if ((*(unsigned char *)&v15 & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    $91ED43557AAACFFE87335DF110E99599 v15 = self->_has;
    if ((*(_DWORD *)&v15 & 0x2000000) == 0)
    {
LABEL_82:
      if ((*(_DWORD *)&v15 & 0x400000) == 0) {
        goto LABEL_83;
      }
LABEL_103:
      PBDataWriterWriteBOOLField();
      if ((*(_DWORD *)&self->_has & 8) == 0) {
        goto LABEL_85;
      }
      goto LABEL_84;
    }
  }
  else if ((*(_DWORD *)&v15 & 0x2000000) == 0)
  {
    goto LABEL_82;
  }
  PBDataWriterWriteBOOLField();
  $91ED43557AAACFFE87335DF110E99599 v15 = self->_has;
  if ((*(_DWORD *)&v15 & 0x400000) != 0) {
    goto LABEL_103;
  }
LABEL_83:
  if ((*(unsigned char *)&v15 & 8) != 0) {
LABEL_84:
  }
    PBDataWriterWriteInt32Field();
LABEL_85:
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v16 = v4;
  if (self->_deviceModel)
  {
    [v4 setDeviceModel:];
    id v4 = v16;
  }
  if (self->_appID)
  {
    [v16 setAppID:];
    id v4 = v16;
  }
  if ((*((unsigned char *)&self->_has + 1) & 0x40) != 0)
  {
    *((_DWORD *)v4 + 62) = self->_runState;
    *((_DWORD *)v4 + 76) |= 0x4000u;
  }
  if (self->_carrierMNC)
  {
    [v16 setCarrierMNC:];
    id v4 = v16;
  }
  if (self->_carrierMCC)
  {
    [v16 setCarrierMCC:];
    id v4 = v16;
  }
  $91ED43557AAACFFE87335DF110E99599 has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_13;
    }
LABEL_86:
    *((_DWORD *)v4 + 28) = self->_connectionType;
    *((_DWORD *)v4 + 76) |= 0x20u;
    if ((*(_DWORD *)&self->_has & 0x8000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
  *((unsigned char *)v4 + 300) = self->_isOnInternationalDataRoaming;
  *((_DWORD *)v4 + 76) |= 0x800000u;
  $91ED43557AAACFFE87335DF110E99599 has = self->_has;
  if ((*(unsigned char *)&has & 0x20) != 0) {
    goto LABEL_86;
  }
LABEL_13:
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
LABEL_14:
    *((_DWORD *)v4 + 68) = LODWORD(self->_timezone);
    *((_DWORD *)v4 + 76) |= 0x8000u;
  }
LABEL_15:
  *((_DWORD *)v4 + 65) = self->_screenWidth;
  *((_DWORD *)v4 + 64) = self->_screenHeight;
  *((_DWORD *)v4 + 63) = self->_screenDPI;
  if ([(APPBRequestProperties *)self userKeyboardsCount])
  {
    [v16 clearUserKeyboards];
    unint64_t v6 = [(APPBRequestProperties *)self userKeyboardsCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
      {
        uint64_t v9 = [(APPBRequestProperties *)self userKeyboardAtIndex:i];
        [v16 addUserKeyboard:v9];
      }
    }
  }
  $91ED43557AAACFFE87335DF110E99599 v10 = self->_has;
  $91ED43557AAACFFE87335DF110E99599 v11 = v16;
  if (*(unsigned char *)&v10)
  {
    *((void *)v16 + 1) = *(void *)&self->_clientClockTime;
    *((_DWORD *)v16 + 76) |= 1u;
    $91ED43557AAACFFE87335DF110E99599 v10 = self->_has;
    if ((*(_WORD *)&v10 & 0x400) == 0)
    {
LABEL_21:
      if ((*(_WORD *)&v10 & 0x800) == 0) {
        goto LABEL_22;
      }
      goto LABEL_90;
    }
  }
  else if ((*(_WORD *)&v10 & 0x400) == 0)
  {
    goto LABEL_21;
  }
  *((_DWORD *)v16 + 49) = LODWORD(self->_localLatency);
  *((_DWORD *)v16 + 76) |= 0x400u;
  $91ED43557AAACFFE87335DF110E99599 v10 = self->_has;
  if ((*(_WORD *)&v10 & 0x800) == 0)
  {
LABEL_22:
    if ((*(_WORD *)&v10 & 0x1000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_91;
  }
LABEL_90:
  *((_DWORD *)v16 + 50) = self->_localLatencyCount;
  *((_DWORD *)v16 + 76) |= 0x800u;
  $91ED43557AAACFFE87335DF110E99599 v10 = self->_has;
  if ((*(_WORD *)&v10 & 0x1000) == 0)
  {
LABEL_23:
    if ((*(unsigned char *)&v10 & 0x80) == 0) {
      goto LABEL_24;
    }
    goto LABEL_92;
  }
LABEL_91:
  *((_DWORD *)v16 + 51) = LODWORD(self->_localLatencyStddev);
  *((_DWORD *)v16 + 76) |= 0x1000u;
  $91ED43557AAACFFE87335DF110E99599 v10 = self->_has;
  if ((*(unsigned char *)&v10 & 0x80) == 0)
  {
LABEL_24:
    if ((*(_WORD *)&v10 & 0x100) == 0) {
      goto LABEL_25;
    }
    goto LABEL_93;
  }
LABEL_92:
  *((_DWORD *)v16 + 46) = LODWORD(self->_localBandwidth);
  *((_DWORD *)v16 + 76) |= 0x80u;
  $91ED43557AAACFFE87335DF110E99599 v10 = self->_has;
  if ((*(_WORD *)&v10 & 0x100) == 0)
  {
LABEL_25:
    if ((*(_WORD *)&v10 & 0x200) == 0) {
      goto LABEL_27;
    }
    goto LABEL_26;
  }
LABEL_93:
  *((_DWORD *)v16 + 47) = LODWORD(self->_localBandwidthBytes);
  *((_DWORD *)v16 + 76) |= 0x100u;
  if ((*(_DWORD *)&self->_has & 0x200) != 0)
  {
LABEL_26:
    *((_DWORD *)v16 + 48) = LODWORD(self->_localBandwidthStddev);
    *((_DWORD *)v16 + 76) |= 0x200u;
  }
LABEL_27:
  if (self->_iAdID)
  {
    [v16 setIAdID:];
    $91ED43557AAACFFE87335DF110E99599 v11 = v16;
  }
  if (self->_appVersion)
  {
    [v16 setAppVersion:];
    $91ED43557AAACFFE87335DF110E99599 v11 = v16;
  }
  if ((*((unsigned char *)&self->_has + 2) & 0x20) != 0)
  {
    v11[298] = self->_denyExplicit;
    *((_DWORD *)v11 + 76) |= 0x200000u;
  }
  if (self->_countryCode)
  {
    [v16 setCountryCode:];
    $91ED43557AAACFFE87335DF110E99599 v11 = v16;
  }
  $91ED43557AAACFFE87335DF110E99599 v12 = self->_has;
  if ((*(unsigned char *)&v12 & 0x10) != 0)
  {
    *((_DWORD *)v11 + 20) = self->_appsRank;
    *((_DWORD *)v11 + 76) |= 0x10u;
    $91ED43557AAACFFE87335DF110E99599 v12 = self->_has;
    if ((*(_WORD *)&v12 & 0x2000) == 0)
    {
LABEL_37:
      if ((*(_DWORD *)&v12 & 0x10000) == 0) {
        goto LABEL_38;
      }
      goto LABEL_97;
    }
  }
  else if ((*(_WORD *)&v12 & 0x2000) == 0)
  {
    goto LABEL_37;
  }
  *((_DWORD *)v11 + 56) = self->_moviesRank;
  *((_DWORD *)v11 + 76) |= 0x2000u;
  $91ED43557AAACFFE87335DF110E99599 v12 = self->_has;
  if ((*(_DWORD *)&v12 & 0x10000) == 0)
  {
LABEL_38:
    if ((*(_DWORD *)&v12 & 0x100000) == 0) {
      goto LABEL_39;
    }
    goto LABEL_98;
  }
LABEL_97:
  *((_DWORD *)v11 + 69) = self->_tvshowsRank;
  *((_DWORD *)v11 + 76) |= 0x10000u;
  $91ED43557AAACFFE87335DF110E99599 v12 = self->_has;
  if ((*(_DWORD *)&v12 & 0x100000) == 0)
  {
LABEL_39:
    if ((*(_DWORD *)&v12 & 0x80000) == 0) {
      goto LABEL_41;
    }
    goto LABEL_40;
  }
LABEL_98:
  v11[297] = self->_allowInstallApps;
  *((_DWORD *)v11 + 76) |= 0x100000u;
  if ((*(_DWORD *)&self->_has & 0x80000) != 0)
  {
LABEL_40:
    v11[296] = self->_allowITunes;
    *((_DWORD *)v11 + 76) |= 0x80000u;
  }
LABEL_41:
  if (self->_osVersionAndBuild)
  {
    [v16 setOsVersionAndBuild:];
    $91ED43557AAACFFE87335DF110E99599 v11 = v16;
  }
  if (self->_localeIdentifier)
  {
    [v16 setLocaleIdentifier:];
    $91ED43557AAACFFE87335DF110E99599 v11 = v16;
  }
  $91ED43557AAACFFE87335DF110E99599 v13 = self->_has;
  if ((*(_DWORD *)&v13 & 0x40000) != 0)
  {
    *((_DWORD *)v11 + 71) = LODWORD(self->_unfilledDuration);
    *((_DWORD *)v11 + 76) |= 0x40000u;
    $91ED43557AAACFFE87335DF110E99599 v13 = self->_has;
  }
  if ((*(_DWORD *)&v13 & 0x20000) != 0)
  {
    *((_DWORD *)v11 + 70) = self->_unfilledClientCount;
    *((_DWORD *)v11 + 76) |= 0x20000u;
  }
  if (self->_iTunesStore)
  {
    [v16 setITunesStore:];
    $91ED43557AAACFFE87335DF110E99599 v11 = v16;
  }
  if (self->_applicationLinkedOnOS)
  {
    [v16 setApplicationLinkedOnOS:];
    $91ED43557AAACFFE87335DF110E99599 v11 = v16;
  }
  if (self->_anonymousDemandiAdID)
  {
    [v16 setAnonymousDemandiAdID:];
    $91ED43557AAACFFE87335DF110E99599 v11 = v16;
  }
  if (self->_contentiAdID)
  {
    [v16 setContentiAdID:];
    $91ED43557AAACFFE87335DF110E99599 v11 = v16;
  }
  $91ED43557AAACFFE87335DF110E99599 v14 = self->_has;
  if ((*(unsigned char *)&v14 & 0x40) != 0)
  {
    *((_DWORD *)v11 + 36) = self->_deviceMode;
    *((_DWORD *)v11 + 76) |= 0x40u;
    $91ED43557AAACFFE87335DF110E99599 v14 = self->_has;
  }
  if ((*(unsigned char *)&v14 & 2) != 0)
  {
    *((_DWORD *)v11 + 4) = self->_accountType;
    *((_DWORD *)v11 + 76) |= 2u;
  }
  if (self->_dPID)
  {
    [v16 setDPID:];
    $91ED43557AAACFFE87335DF110E99599 v11 = v16;
  }
  if (self->_locality)
  {
    [v16 setLocality:];
    $91ED43557AAACFFE87335DF110E99599 v11 = v16;
  }
  if (self->_administrativeArea)
  {
    [v16 setAdministrativeArea:];
    $91ED43557AAACFFE87335DF110E99599 v11 = v16;
  }
  if (self->_subAdministrativeArea)
  {
    [v16 setSubAdministrativeArea:];
    $91ED43557AAACFFE87335DF110E99599 v11 = v16;
  }
  if (self->_isoCountryCode)
  {
    [v16 setIsoCountryCode:];
    $91ED43557AAACFFE87335DF110E99599 v11 = v16;
  }
  if (self->_postalCode)
  {
    [v16 setPostalCode:];
    $91ED43557AAACFFE87335DF110E99599 v11 = v16;
  }
  if (*((unsigned char *)&self->_has + 3))
  {
    v11[301] = self->_isTest;
    *((_DWORD *)v11 + 76) |= 0x1000000u;
  }
  if (self->_campaignNameSpace)
  {
    [v16 setCampaignNameSpace:];
    $91ED43557AAACFFE87335DF110E99599 v11 = v16;
  }
  $91ED43557AAACFFE87335DF110E99599 v15 = self->_has;
  if ((*(unsigned char *)&v15 & 4) != 0)
  {
    *((_DWORD *)v11 + 8) = self->_advertisingIdentifierMonthResetCount;
    *((_DWORD *)v11 + 76) |= 4u;
    $91ED43557AAACFFE87335DF110E99599 v15 = self->_has;
    if ((*(_DWORD *)&v15 & 0x2000000) == 0)
    {
LABEL_79:
      if ((*(_DWORD *)&v15 & 0x400000) == 0) {
        goto LABEL_80;
      }
      goto LABEL_102;
    }
  }
  else if ((*(_DWORD *)&v15 & 0x2000000) == 0)
  {
    goto LABEL_79;
  }
  v11[302] = self->_limitAdTracking;
  *((_DWORD *)v11 + 76) |= 0x2000000u;
  $91ED43557AAACFFE87335DF110E99599 v15 = self->_has;
  if ((*(_DWORD *)&v15 & 0x400000) == 0)
  {
LABEL_80:
    if ((*(unsigned char *)&v15 & 8) == 0) {
      goto LABEL_82;
    }
    goto LABEL_81;
  }
LABEL_102:
  v11[299] = self->_internalUserWantsProdAds;
  *((_DWORD *)v11 + 76) |= 0x400000u;
  if ((*(_DWORD *)&self->_has & 8) != 0)
  {
LABEL_81:
    *((_DWORD *)v11 + 14) = self->_appStoreViewAdVersion;
    *((_DWORD *)v11 + 76) |= 8u;
  }
LABEL_82:
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [[[objc_opt_class() allocWithZone:a3] init];
  id v6 = [(NSString *)self->_deviceModel copyWithZone:a3];
  unint64_t v7 = (void *)v5[19];
  v5[19] = v6;

  id v8 = [(NSString *)self->_appID copyWithZone:a3];
  uint64_t v9 = (void *)v5[6];
  v5[6] = v8;

  if ((*((unsigned char *)&self->_has + 1) & 0x40) != 0)
  {
    *((_DWORD *)v5 + 62) = self->_runState;
    *((_DWORD *)v5 + 76) |= 0x4000u;
  }
  id v10 = [(NSString *)self->_carrierMNC copyWithZone:a3];
  $91ED43557AAACFFE87335DF110E99599 v11 = (void *)v5[13];
  v5[13] = v10;

  id v12 = [(NSString *)self->_carrierMCC copyWithZone:a3];
  $91ED43557AAACFFE87335DF110E99599 v13 = (void *)v5[12];
  v5[12] = v12;

  $91ED43557AAACFFE87335DF110E99599 has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) != 0)
  {
    *((unsigned char *)v5 + 300) = self->_isOnInternationalDataRoaming;
    *((_DWORD *)v5 + 76) |= 0x800000u;
    $91ED43557AAACFFE87335DF110E99599 has = self->_has;
    if ((*(unsigned char *)&has & 0x20) == 0)
    {
LABEL_5:
      if ((*(_WORD *)&has & 0x8000) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((*(unsigned char *)&has & 0x20) == 0)
  {
    goto LABEL_5;
  }
  *((_DWORD *)v5 + 28) = self->_connectionType;
  *((_DWORD *)v5 + 76) |= 0x20u;
  if ((*(_DWORD *)&self->_has & 0x8000) != 0)
  {
LABEL_6:
    *((_DWORD *)v5 + 68) = LODWORD(self->_timezone);
    *((_DWORD *)v5 + 76) |= 0x8000u;
  }
LABEL_7:
  *((_DWORD *)v5 + 65) = self->_screenWidth;
  *((_DWORD *)v5 + 64) = self->_screenHeight;
  *((_DWORD *)v5 + 63) = self->_screenDPI;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  $91ED43557AAACFFE87335DF110E99599 v15 = self->_userKeyboards;
  id v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v59 objects:v63 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v60;
    do
    {
      long long v19 = 0;
      do
      {
        if (*(void *)v60 != v18) {
          objc_enumerationMutation(v15);
        }
        id v20 = [*(id *)(*((void *)&v59 + 1) + 8 * (void)v19) copyWithZone:a3];
        [v5 addUserKeyboard:v20];

        long long v19 = (char *)v19 + 1;
      }
      while (v17 != v19);
      id v17 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v59 objects:v63 count:16];
    }
    while (v17);
  }

  $91ED43557AAACFFE87335DF110E99599 v21 = self->_has;
  if (*(unsigned char *)&v21)
  {
    v5[1] = *(void *)&self->_clientClockTime;
    *((_DWORD *)v5 + 76) |= 1u;
    $91ED43557AAACFFE87335DF110E99599 v21 = self->_has;
    if ((*(_WORD *)&v21 & 0x400) == 0)
    {
LABEL_16:
      if ((*(_WORD *)&v21 & 0x800) == 0) {
        goto LABEL_17;
      }
      goto LABEL_51;
    }
  }
  else if ((*(_WORD *)&v21 & 0x400) == 0)
  {
    goto LABEL_16;
  }
  *((_DWORD *)v5 + 49) = LODWORD(self->_localLatency);
  *((_DWORD *)v5 + 76) |= 0x400u;
  $91ED43557AAACFFE87335DF110E99599 v21 = self->_has;
  if ((*(_WORD *)&v21 & 0x800) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&v21 & 0x1000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_52;
  }
LABEL_51:
  *((_DWORD *)v5 + 50) = self->_localLatencyCount;
  *((_DWORD *)v5 + 76) |= 0x800u;
  $91ED43557AAACFFE87335DF110E99599 v21 = self->_has;
  if ((*(_WORD *)&v21 & 0x1000) == 0)
  {
LABEL_18:
    if ((*(unsigned char *)&v21 & 0x80) == 0) {
      goto LABEL_19;
    }
    goto LABEL_53;
  }
LABEL_52:
  *((_DWORD *)v5 + 51) = LODWORD(self->_localLatencyStddev);
  *((_DWORD *)v5 + 76) |= 0x1000u;
  $91ED43557AAACFFE87335DF110E99599 v21 = self->_has;
  if ((*(unsigned char *)&v21 & 0x80) == 0)
  {
LABEL_19:
    if ((*(_WORD *)&v21 & 0x100) == 0) {
      goto LABEL_20;
    }
    goto LABEL_54;
  }
LABEL_53:
  *((_DWORD *)v5 + 46) = LODWORD(self->_localBandwidth);
  *((_DWORD *)v5 + 76) |= 0x80u;
  $91ED43557AAACFFE87335DF110E99599 v21 = self->_has;
  if ((*(_WORD *)&v21 & 0x100) == 0)
  {
LABEL_20:
    if ((*(_WORD *)&v21 & 0x200) == 0) {
      goto LABEL_22;
    }
    goto LABEL_21;
  }
LABEL_54:
  *((_DWORD *)v5 + 47) = LODWORD(self->_localBandwidthBytes);
  *((_DWORD *)v5 + 76) |= 0x100u;
  if ((*(_DWORD *)&self->_has & 0x200) != 0)
  {
LABEL_21:
    *((_DWORD *)v5 + 48) = LODWORD(self->_localBandwidthStddev);
    *((_DWORD *)v5 + 76) |= 0x200u;
  }
LABEL_22:
  id v22 = -[NSData copyWithZone:](self->_iAdID, "copyWithZone:", a3, (void)v59);
  v23 = (void *)v5[20];
  v5[20] = v22;

  id v24 = [(NSString *)self->_appVersion copyWithZone:a3];
  $91ED43557AAACFFE87335DF110E99599 v25 = (void *)v5[8];
  v5[8] = v24;

  if ((*((unsigned char *)&self->_has + 2) & 0x20) != 0)
  {
    *((unsigned char *)v5 + 298) = self->_denyExplicit;
    *((_DWORD *)v5 + 76) |= 0x200000u;
  }
  id v26 = [(NSString *)self->_countryCode copyWithZone:a3];
  v27 = (void *)v5[16];
  v5[16] = v26;

  $91ED43557AAACFFE87335DF110E99599 v28 = self->_has;
  if ((*(unsigned char *)&v28 & 0x10) != 0)
  {
    *((_DWORD *)v5 + 20) = self->_appsRank;
    *((_DWORD *)v5 + 76) |= 0x10u;
    $91ED43557AAACFFE87335DF110E99599 v28 = self->_has;
    if ((*(_WORD *)&v28 & 0x2000) == 0)
    {
LABEL_26:
      if ((*(_DWORD *)&v28 & 0x10000) == 0) {
        goto LABEL_27;
      }
      goto LABEL_58;
    }
  }
  else if ((*(_WORD *)&v28 & 0x2000) == 0)
  {
    goto LABEL_26;
  }
  *((_DWORD *)v5 + 56) = self->_moviesRank;
  *((_DWORD *)v5 + 76) |= 0x2000u;
  $91ED43557AAACFFE87335DF110E99599 v28 = self->_has;
  if ((*(_DWORD *)&v28 & 0x10000) == 0)
  {
LABEL_27:
    if ((*(_DWORD *)&v28 & 0x100000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_59;
  }
LABEL_58:
  *((_DWORD *)v5 + 69) = self->_tvshowsRank;
  *((_DWORD *)v5 + 76) |= 0x10000u;
  $91ED43557AAACFFE87335DF110E99599 v28 = self->_has;
  if ((*(_DWORD *)&v28 & 0x100000) == 0)
  {
LABEL_28:
    if ((*(_DWORD *)&v28 & 0x80000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_29;
  }
LABEL_59:
  *((unsigned char *)v5 + 297) = self->_allowInstallApps;
  *((_DWORD *)v5 + 76) |= 0x100000u;
  if ((*(_DWORD *)&self->_has & 0x80000) != 0)
  {
LABEL_29:
    *((unsigned char *)v5 + 296) = self->_allowITunes;
    *((_DWORD *)v5 + 76) |= 0x80000u;
  }
LABEL_30:
  id v29 = [(NSString *)self->_osVersionAndBuild copyWithZone:a3];
  v30 = (void *)v5[29];
  v5[29] = v29;

  id v31 = [(NSString *)self->_localeIdentifier copyWithZone:a3];
  v32 = (void *)v5[26];
  v5[26] = v31;

  $91ED43557AAACFFE87335DF110E99599 v33 = self->_has;
  if ((*(_DWORD *)&v33 & 0x40000) != 0)
  {
    *((_DWORD *)v5 + 71) = LODWORD(self->_unfilledDuration);
    *((_DWORD *)v5 + 76) |= 0x40000u;
    $91ED43557AAACFFE87335DF110E99599 v33 = self->_has;
  }
  if ((*(_DWORD *)&v33 & 0x20000) != 0)
  {
    *((_DWORD *)v5 + 70) = self->_unfilledClientCount;
    *((_DWORD *)v5 + 76) |= 0x20000u;
  }
  id v34 = [(NSString *)self->_iTunesStore copyWithZone:a3];
  v35 = (void *)v5[21];
  v5[21] = v34;

  id v36 = [(NSString *)self->_applicationLinkedOnOS copyWithZone:a3];
  v37 = (void *)v5[9];
  v5[9] = v36;

  id v38 = [(NSData *)self->_anonymousDemandiAdID copyWithZone:a3];
  v39 = (void *)v5[5];
  v5[5] = v38;

  id v40 = [(NSData *)self->_contentiAdID copyWithZone:a3];
  v41 = (void *)v5[15];
  v5[15] = v40;

  $91ED43557AAACFFE87335DF110E99599 v42 = self->_has;
  if ((*(unsigned char *)&v42 & 0x40) != 0)
  {
    *((_DWORD *)v5 + 36) = self->_deviceMode;
    *((_DWORD *)v5 + 76) |= 0x40u;
    $91ED43557AAACFFE87335DF110E99599 v42 = self->_has;
  }
  if ((*(unsigned char *)&v42 & 2) != 0)
  {
    *((_DWORD *)v5 + 4) = self->_accountType;
    *((_DWORD *)v5 + 76) |= 2u;
  }
  id v43 = [(NSData *)self->_dPID copyWithZone:a3];
  v44 = (void *)v5[17];
  v5[17] = v43;

  id v45 = [(NSString *)self->_locality copyWithZone:a3];
  v46 = (void *)v5[27];
  v5[27] = v45;

  id v47 = [(NSString *)self->_administrativeArea copyWithZone:a3];
  v48 = (void *)v5[3];
  v5[3] = v47;

  id v49 = [(NSString *)self->_subAdministrativeArea copyWithZone:a3];
  v50 = (void *)v5[33];
  v5[33] = v49;

  id v51 = [(NSString *)self->_isoCountryCode copyWithZone:a3];
  v52 = (void *)v5[22];
  v5[22] = v51;

  id v53 = [(NSString *)self->_postalCode copyWithZone:a3];
  v54 = (void *)v5[30];
  v5[30] = v53;

  if (*((unsigned char *)&self->_has + 3))
  {
    *((unsigned char *)v5 + 301) = self->_isTest;
    *((_DWORD *)v5 + 76) |= 0x1000000u;
  }
  id v55 = [(NSString *)self->_campaignNameSpace copyWithZone:a3];
  v56 = (void *)v5[11];
  v5[11] = v55;

  $91ED43557AAACFFE87335DF110E99599 v57 = self->_has;
  if ((*(unsigned char *)&v57 & 4) != 0)
  {
    *((_DWORD *)v5 + 8) = self->_advertisingIdentifierMonthResetCount;
    *((_DWORD *)v5 + 76) |= 4u;
    $91ED43557AAACFFE87335DF110E99599 v57 = self->_has;
    if ((*(_DWORD *)&v57 & 0x2000000) == 0)
    {
LABEL_42:
      if ((*(_DWORD *)&v57 & 0x400000) == 0) {
        goto LABEL_43;
      }
LABEL_63:
      *((unsigned char *)v5 + 299) = self->_internalUserWantsProdAds;
      *((_DWORD *)v5 + 76) |= 0x400000u;
      if ((*(_DWORD *)&self->_has & 8) == 0) {
        return v5;
      }
      goto LABEL_44;
    }
  }
  else if ((*(_DWORD *)&v57 & 0x2000000) == 0)
  {
    goto LABEL_42;
  }
  *((unsigned char *)v5 + 302) = self->_limitAdTracking;
  *((_DWORD *)v5 + 76) |= 0x2000000u;
  $91ED43557AAACFFE87335DF110E99599 v57 = self->_has;
  if ((*(_DWORD *)&v57 & 0x400000) != 0) {
    goto LABEL_63;
  }
LABEL_43:
  if ((*(unsigned char *)&v57 & 8) != 0)
  {
LABEL_44:
    *((_DWORD *)v5 + 14) = self->_appStoreViewAdVersion;
    *((_DWORD *)v5 + 76) |= 8u;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_201;
  }
  deviceModel = self->_deviceModel;
  if ((unint64_t)deviceModel | *((void *)v4 + 19))
  {
    if (!-[NSString isEqual:](deviceModel, "isEqual:")) {
      goto LABEL_201;
    }
  }
  appID = self->_appID;
  if ((unint64_t)appID | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](appID, "isEqual:")) {
      goto LABEL_201;
    }
  }
  int v7 = *((_DWORD *)v4 + 76);
  if ((*((unsigned char *)&self->_has + 1) & 0x40) != 0)
  {
    if ((v7 & 0x4000) == 0 || self->_runState != *((_DWORD *)v4 + 62)) {
      goto LABEL_201;
    }
  }
  else if ((v7 & 0x4000) != 0)
  {
    goto LABEL_201;
  }
  carrierMNC = self->_carrierMNC;
  if ((unint64_t)carrierMNC | *((void *)v4 + 13)
    && !-[NSString isEqual:](carrierMNC, "isEqual:"))
  {
    goto LABEL_201;
  }
  carrierMCC = self->_carrierMCC;
  if ((unint64_t)carrierMCC | *((void *)v4 + 12))
  {
    if (!-[NSString isEqual:](carrierMCC, "isEqual:")) {
      goto LABEL_201;
    }
  }
  $91ED43557AAACFFE87335DF110E99599 has = self->_has;
  int v11 = *((_DWORD *)v4 + 76);
  if ((*(_DWORD *)&has & 0x800000) != 0)
  {
    if ((v11 & 0x800000) == 0) {
      goto LABEL_201;
    }
    if (self->_isOnInternationalDataRoaming)
    {
      if (!*((unsigned char *)v4 + 300)) {
        goto LABEL_201;
      }
    }
    else if (*((unsigned char *)v4 + 300))
    {
      goto LABEL_201;
    }
  }
  else if ((v11 & 0x800000) != 0)
  {
    goto LABEL_201;
  }
  if ((*(unsigned char *)&has & 0x20) != 0)
  {
    if ((v11 & 0x20) == 0 || self->_connectionType != *((_DWORD *)v4 + 28)) {
      goto LABEL_201;
    }
  }
  else if ((v11 & 0x20) != 0)
  {
    goto LABEL_201;
  }
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
    if ((v11 & 0x8000) == 0 || self->_timezone != *((float *)v4 + 68)) {
      goto LABEL_201;
    }
  }
  else if ((v11 & 0x8000) != 0)
  {
    goto LABEL_201;
  }
  if (self->_screenWidth != *((_DWORD *)v4 + 65)
    || self->_screenHeight != *((_DWORD *)v4 + 64)
    || self->_screenDPI != *((_DWORD *)v4 + 63))
  {
    goto LABEL_201;
  }
  userKeyboards = self->_userKeyboards;
  if ((unint64_t)userKeyboards | *((void *)v4 + 36))
  {
    if (!-[NSMutableArray isEqual:](userKeyboards, "isEqual:")) {
      goto LABEL_201;
    }
    $91ED43557AAACFFE87335DF110E99599 has = self->_has;
  }
  int v13 = *((_DWORD *)v4 + 76);
  if (*(unsigned char *)&has)
  {
    if ((v13 & 1) == 0 || self->_clientClockTime != *((double *)v4 + 1)) {
      goto LABEL_201;
    }
  }
  else if (v13)
  {
    goto LABEL_201;
  }
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    if ((v13 & 0x400) == 0 || self->_localLatency != *((float *)v4 + 49)) {
      goto LABEL_201;
    }
  }
  else if ((v13 & 0x400) != 0)
  {
    goto LABEL_201;
  }
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    if ((v13 & 0x800) == 0 || self->_localLatencyCount != *((_DWORD *)v4 + 50)) {
      goto LABEL_201;
    }
  }
  else if ((v13 & 0x800) != 0)
  {
    goto LABEL_201;
  }
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    if ((v13 & 0x1000) == 0 || self->_localLatencyStddev != *((float *)v4 + 51)) {
      goto LABEL_201;
    }
  }
  else if ((v13 & 0x1000) != 0)
  {
    goto LABEL_201;
  }
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
    if ((v13 & 0x80) == 0 || self->_localBandwidth != *((float *)v4 + 46)) {
      goto LABEL_201;
    }
  }
  else if ((v13 & 0x80) != 0)
  {
    goto LABEL_201;
  }
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    if ((v13 & 0x100) == 0 || self->_localBandwidthBytes != *((float *)v4 + 47)) {
      goto LABEL_201;
    }
  }
  else if ((v13 & 0x100) != 0)
  {
    goto LABEL_201;
  }
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    if ((v13 & 0x200) == 0 || self->_localBandwidthStddev != *((float *)v4 + 48)) {
      goto LABEL_201;
    }
  }
  else if ((v13 & 0x200) != 0)
  {
    goto LABEL_201;
  }
  iAdID = self->_iAdID;
  if ((unint64_t)iAdID | *((void *)v4 + 20) && !-[NSData isEqual:](iAdID, "isEqual:")) {
    goto LABEL_201;
  }
  appVersion = self->_appVersion;
  if ((unint64_t)appVersion | *((void *)v4 + 8))
  {
    if (!-[NSString isEqual:](appVersion, "isEqual:")) {
      goto LABEL_201;
    }
  }
  $91ED43557AAACFFE87335DF110E99599 v16 = self->_has;
  int v17 = *((_DWORD *)v4 + 76);
  if ((*(_DWORD *)&v16 & 0x200000) != 0)
  {
    if ((v17 & 0x200000) == 0) {
      goto LABEL_201;
    }
    if (self->_denyExplicit)
    {
      if (!*((unsigned char *)v4 + 298)) {
        goto LABEL_201;
      }
    }
    else if (*((unsigned char *)v4 + 298))
    {
      goto LABEL_201;
    }
  }
  else if ((v17 & 0x200000) != 0)
  {
    goto LABEL_201;
  }
  countryCode = self->_countryCode;
  if ((unint64_t)countryCode | *((void *)v4 + 16))
  {
    if (!-[NSString isEqual:](countryCode, "isEqual:")) {
      goto LABEL_201;
    }
    $91ED43557AAACFFE87335DF110E99599 v16 = self->_has;
  }
  int v19 = *((_DWORD *)v4 + 76);
  if ((*(unsigned char *)&v16 & 0x10) != 0)
  {
    if ((v19 & 0x10) == 0 || self->_appsRank != *((_DWORD *)v4 + 20)) {
      goto LABEL_201;
    }
  }
  else if ((v19 & 0x10) != 0)
  {
    goto LABEL_201;
  }
  if ((*(_WORD *)&v16 & 0x2000) != 0)
  {
    if ((v19 & 0x2000) == 0 || self->_moviesRank != *((_DWORD *)v4 + 56)) {
      goto LABEL_201;
    }
  }
  else if ((v19 & 0x2000) != 0)
  {
    goto LABEL_201;
  }
  if ((*(_DWORD *)&v16 & 0x10000) != 0)
  {
    if ((v19 & 0x10000) == 0 || self->_tvshowsRank != *((_DWORD *)v4 + 69)) {
      goto LABEL_201;
    }
  }
  else if ((v19 & 0x10000) != 0)
  {
    goto LABEL_201;
  }
  if ((*(_DWORD *)&v16 & 0x100000) != 0)
  {
    if ((v19 & 0x100000) == 0) {
      goto LABEL_201;
    }
    if (self->_allowInstallApps)
    {
      if (!*((unsigned char *)v4 + 297)) {
        goto LABEL_201;
      }
    }
    else if (*((unsigned char *)v4 + 297))
    {
      goto LABEL_201;
    }
  }
  else if ((v19 & 0x100000) != 0)
  {
    goto LABEL_201;
  }
  if ((*(_DWORD *)&v16 & 0x80000) != 0)
  {
    if ((v19 & 0x80000) == 0) {
      goto LABEL_201;
    }
    if (self->_allowITunes)
    {
      if (!*((unsigned char *)v4 + 296)) {
        goto LABEL_201;
      }
    }
    else if (*((unsigned char *)v4 + 296))
    {
      goto LABEL_201;
    }
  }
  else if ((v19 & 0x80000) != 0)
  {
    goto LABEL_201;
  }
  osVersionAndBuild = self->_osVersionAndBuild;
  if ((unint64_t)osVersionAndBuild | *((void *)v4 + 29)
    && !-[NSString isEqual:](osVersionAndBuild, "isEqual:"))
  {
    goto LABEL_201;
  }
  localeIdentifier = self->_localeIdentifier;
  if ((unint64_t)localeIdentifier | *((void *)v4 + 26))
  {
    if (!-[NSString isEqual:](localeIdentifier, "isEqual:")) {
      goto LABEL_201;
    }
  }
  $91ED43557AAACFFE87335DF110E99599 v22 = self->_has;
  int v23 = *((_DWORD *)v4 + 76);
  if ((*(_DWORD *)&v22 & 0x40000) != 0)
  {
    if ((v23 & 0x40000) == 0 || self->_unfilledDuration != *((float *)v4 + 71)) {
      goto LABEL_201;
    }
  }
  else if ((v23 & 0x40000) != 0)
  {
    goto LABEL_201;
  }
  if ((*(_DWORD *)&v22 & 0x20000) != 0)
  {
    if ((v23 & 0x20000) == 0 || self->_unfilledClientCount != *((_DWORD *)v4 + 70)) {
      goto LABEL_201;
    }
  }
  else if ((v23 & 0x20000) != 0)
  {
    goto LABEL_201;
  }
  iTunesStore = self->_iTunesStore;
  if ((unint64_t)iTunesStore | *((void *)v4 + 21)
    && !-[NSString isEqual:](iTunesStore, "isEqual:"))
  {
    goto LABEL_201;
  }
  applicationLinkedOnOS = self->_applicationLinkedOnOS;
  if ((unint64_t)applicationLinkedOnOS | *((void *)v4 + 9))
  {
    if (!-[NSString isEqual:](applicationLinkedOnOS, "isEqual:")) {
      goto LABEL_201;
    }
  }
  anonymousDemandiAdID = self->_anonymousDemandiAdID;
  if ((unint64_t)anonymousDemandiAdID | *((void *)v4 + 5))
  {
    if (!-[NSData isEqual:](anonymousDemandiAdID, "isEqual:")) {
      goto LABEL_201;
    }
  }
  contentiAdID = self->_contentiAdID;
  if ((unint64_t)contentiAdID | *((void *)v4 + 15))
  {
    if (!-[NSData isEqual:](contentiAdID, "isEqual:")) {
      goto LABEL_201;
    }
  }
  $91ED43557AAACFFE87335DF110E99599 v28 = self->_has;
  int v29 = *((_DWORD *)v4 + 76);
  if ((*(unsigned char *)&v28 & 0x40) != 0)
  {
    if ((v29 & 0x40) == 0 || self->_deviceMode != *((_DWORD *)v4 + 36)) {
      goto LABEL_201;
    }
  }
  else if ((v29 & 0x40) != 0)
  {
    goto LABEL_201;
  }
  if ((*(unsigned char *)&v28 & 2) != 0)
  {
    if ((v29 & 2) == 0 || self->_accountType != *((_DWORD *)v4 + 4)) {
      goto LABEL_201;
    }
  }
  else if ((v29 & 2) != 0)
  {
    goto LABEL_201;
  }
  dPID = self->_dPID;
  if ((unint64_t)dPID | *((void *)v4 + 17) && !-[NSData isEqual:](dPID, "isEqual:")) {
    goto LABEL_201;
  }
  locality = self->_locality;
  if ((unint64_t)locality | *((void *)v4 + 27))
  {
    if (!-[NSString isEqual:](locality, "isEqual:")) {
      goto LABEL_201;
    }
  }
  administrativeArea = self->_administrativeArea;
  if ((unint64_t)administrativeArea | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](administrativeArea, "isEqual:")) {
      goto LABEL_201;
    }
  }
  subAdministrativeArea = self->_subAdministrativeArea;
  if ((unint64_t)subAdministrativeArea | *((void *)v4 + 33))
  {
    if (!-[NSString isEqual:](subAdministrativeArea, "isEqual:")) {
      goto LABEL_201;
    }
  }
  isoCountryCode = self->_isoCountryCode;
  if ((unint64_t)isoCountryCode | *((void *)v4 + 22))
  {
    if (!-[NSString isEqual:](isoCountryCode, "isEqual:")) {
      goto LABEL_201;
    }
  }
  postalCode = self->_postalCode;
  if ((unint64_t)postalCode | *((void *)v4 + 30))
  {
    if (!-[NSString isEqual:](postalCode, "isEqual:")) {
      goto LABEL_201;
    }
  }
  $91ED43557AAACFFE87335DF110E99599 v36 = self->_has;
  int v37 = *((_DWORD *)v4 + 76);
  if ((*(_DWORD *)&v36 & 0x1000000) != 0)
  {
    if ((v37 & 0x1000000) == 0) {
      goto LABEL_201;
    }
    if (self->_isTest)
    {
      if (!*((unsigned char *)v4 + 301)) {
        goto LABEL_201;
      }
    }
    else if (*((unsigned char *)v4 + 301))
    {
      goto LABEL_201;
    }
  }
  else if ((v37 & 0x1000000) != 0)
  {
    goto LABEL_201;
  }
  campaignNameSpace = self->_campaignNameSpace;
  if ((unint64_t)campaignNameSpace | *((void *)v4 + 11))
  {
    if (!-[NSString isEqual:](campaignNameSpace, "isEqual:")) {
      goto LABEL_201;
    }
    $91ED43557AAACFFE87335DF110E99599 v36 = self->_has;
  }
  int v39 = *((_DWORD *)v4 + 76);
  if ((*(unsigned char *)&v36 & 4) != 0)
  {
    if ((v39 & 4) == 0 || self->_advertisingIdentifierMonthResetCount != *((_DWORD *)v4 + 8)) {
      goto LABEL_201;
    }
  }
  else if ((v39 & 4) != 0)
  {
    goto LABEL_201;
  }
  if ((*(_DWORD *)&v36 & 0x2000000) != 0)
  {
    if ((v39 & 0x2000000) == 0) {
      goto LABEL_201;
    }
    if (self->_limitAdTracking)
    {
      if (!*((unsigned char *)v4 + 302)) {
        goto LABEL_201;
      }
    }
    else if (*((unsigned char *)v4 + 302))
    {
      goto LABEL_201;
    }
  }
  else if ((v39 & 0x2000000) != 0)
  {
    goto LABEL_201;
  }
  if ((*(_DWORD *)&v36 & 0x400000) != 0)
  {
    if ((v39 & 0x400000) != 0)
    {
      if (self->_internalUserWantsProdAds)
      {
        if (!*((unsigned char *)v4 + 299)) {
          goto LABEL_201;
        }
        goto LABEL_196;
      }
      if (!*((unsigned char *)v4 + 299)) {
        goto LABEL_196;
      }
    }
LABEL_201:
    BOOL v40 = 0;
    goto LABEL_202;
  }
  if ((v39 & 0x400000) != 0) {
    goto LABEL_201;
  }
LABEL_196:
  if ((*(unsigned char *)&v36 & 8) != 0)
  {
    if ((v39 & 8) == 0 || self->_appStoreViewAdVersion != *((_DWORD *)v4 + 14)) {
      goto LABEL_201;
    }
    BOOL v40 = 1;
  }
  else
  {
    BOOL v40 = (*((_DWORD *)v4 + 76) & 8) == 0;
  }
LABEL_202:

  return v40;
}

- (unint64_t)hash
{
  NSUInteger v97 = [(NSString *)self->_deviceModel hash];
  NSUInteger v96 = [(NSString *)self->_appID hash];
  if ((*((unsigned char *)&self->_has + 1) & 0x40) != 0) {
    uint64_t v95 = 2654435761 * self->_runState;
  }
  else {
    uint64_t v95 = 0;
  }
  NSUInteger v94 = [(NSString *)self->_carrierMNC hash];
  NSUInteger v93 = [(NSString *)self->_carrierMCC hash];
  $91ED43557AAACFFE87335DF110E99599 has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
    uint64_t v92 = 0;
    if ((*(unsigned char *)&has & 0x20) != 0) {
      goto LABEL_6;
    }
LABEL_12:
    uint64_t v91 = 0;
    if ((*(_WORD *)&has & 0x8000) != 0) {
      goto LABEL_7;
    }
LABEL_13:
    unint64_t v8 = 0;
    goto LABEL_16;
  }
  uint64_t v92 = 2654435761 * self->_isOnInternationalDataRoaming;
  if ((*(unsigned char *)&has & 0x20) == 0) {
    goto LABEL_12;
  }
LABEL_6:
  uint64_t v91 = 2654435761 * self->_connectionType;
  if ((*(_WORD *)&has & 0x8000) == 0) {
    goto LABEL_13;
  }
LABEL_7:
  float timezone = self->_timezone;
  float v5 = -timezone;
  if (timezone >= 0.0) {
    float v5 = self->_timezone;
  }
  float v6 = floorf(v5 + 0.5);
  float v7 = (float)(v5 - v6) * 1.8447e19;
  unint64_t v8 = 2654435761u * (unint64_t)fmodf(v6, 1.8447e19);
  if (v7 >= 0.0)
  {
    if (v7 > 0.0) {
      v8 += (unint64_t)v7;
    }
  }
  else
  {
    v8 -= (unint64_t)fabsf(v7);
  }
LABEL_16:
  uint64_t screenWidth = self->_screenWidth;
  unint64_t v90 = v8;
  uint64_t screenDPI = self->_screenDPI;
  uint64_t screenHeight = self->_screenHeight;
  unint64_t v86 = (unint64_t)[(NSMutableArray *)self->_userKeyboards hash];
  $91ED43557AAACFFE87335DF110E99599 v9 = self->_has;
  if (*(unsigned char *)&v9)
  {
    double clientClockTime = self->_clientClockTime;
    double v12 = -clientClockTime;
    if (clientClockTime >= 0.0) {
      double v12 = self->_clientClockTime;
    }
    long double v13 = floor(v12 + 0.5);
    double v14 = (v12 - v13) * 1.84467441e19;
    unint64_t v10 = 2654435761u * (unint64_t)fmod(v13, 1.84467441e19);
    if (v14 >= 0.0)
    {
      if (v14 > 0.0) {
        v10 += (unint64_t)v14;
      }
    }
    else
    {
      v10 -= (unint64_t)fabs(v14);
    }
  }
  else
  {
    unint64_t v10 = 0;
  }
  if ((*(_WORD *)&v9 & 0x400) != 0)
  {
    float localLatency = self->_localLatency;
    float v17 = -localLatency;
    if (localLatency >= 0.0) {
      float v17 = self->_localLatency;
    }
    float v18 = floorf(v17 + 0.5);
    float v19 = (float)(v17 - v18) * 1.8447e19;
    unint64_t v15 = 2654435761u * (unint64_t)fmodf(v18, 1.8447e19);
    if (v19 >= 0.0)
    {
      if (v19 > 0.0) {
        v15 += (unint64_t)v19;
      }
    }
    else
    {
      v15 -= (unint64_t)fabsf(v19);
    }
  }
  else
  {
    unint64_t v15 = 0;
  }
  if ((*(_WORD *)&v9 & 0x800) != 0)
  {
    uint64_t v85 = 2654435761 * self->_localLatencyCount;
    if ((*(_WORD *)&v9 & 0x1000) != 0) {
      goto LABEL_34;
    }
LABEL_39:
    unint64_t v24 = 0;
    goto LABEL_42;
  }
  uint64_t v85 = 0;
  if ((*(_WORD *)&v9 & 0x1000) == 0) {
    goto LABEL_39;
  }
LABEL_34:
  float localLatencyStddev = self->_localLatencyStddev;
  float v21 = -localLatencyStddev;
  if (localLatencyStddev >= 0.0) {
    float v21 = self->_localLatencyStddev;
  }
  float v22 = floorf(v21 + 0.5);
  float v23 = (float)(v21 - v22) * 1.8447e19;
  unint64_t v24 = 2654435761u * (unint64_t)fmodf(v22, 1.8447e19);
  if (v23 >= 0.0)
  {
    if (v23 > 0.0) {
      v24 += (unint64_t)v23;
    }
  }
  else
  {
    v24 -= (unint64_t)fabsf(v23);
  }
LABEL_42:
  if ((*(unsigned char *)&v9 & 0x80) != 0)
  {
    float localBandwidth = self->_localBandwidth;
    float v27 = -localBandwidth;
    if (localBandwidth >= 0.0) {
      float v27 = self->_localBandwidth;
    }
    float v28 = floorf(v27 + 0.5);
    float v29 = (float)(v27 - v28) * 1.8447e19;
    unint64_t v25 = 2654435761u * (unint64_t)fmodf(v28, 1.8447e19);
    if (v29 >= 0.0)
    {
      if (v29 > 0.0) {
        v25 += (unint64_t)v29;
      }
    }
    else
    {
      v25 -= (unint64_t)fabsf(v29);
    }
  }
  else
  {
    unint64_t v25 = 0;
  }
  if ((*(_WORD *)&v9 & 0x100) != 0)
  {
    float localBandwidthBytes = self->_localBandwidthBytes;
    float v32 = -localBandwidthBytes;
    if (localBandwidthBytes >= 0.0) {
      float v32 = self->_localBandwidthBytes;
    }
    float v33 = floorf(v32 + 0.5);
    float v34 = (float)(v32 - v33) * 1.8447e19;
    unint64_t v30 = 2654435761u * (unint64_t)fmodf(v33, 1.8447e19);
    if (v34 >= 0.0)
    {
      if (v34 > 0.0) {
        v30 += (unint64_t)v34;
      }
    }
    else
    {
      v30 -= (unint64_t)fabsf(v34);
    }
  }
  else
  {
    unint64_t v30 = 0;
  }
  unint64_t v83 = v30;
  if ((*(_WORD *)&v9 & 0x200) != 0)
  {
    float localBandwidthStddev = self->_localBandwidthStddev;
    float v37 = -localBandwidthStddev;
    if (localBandwidthStddev >= 0.0) {
      float v37 = self->_localBandwidthStddev;
    }
    float v38 = floorf(v37 + 0.5);
    float v39 = (float)(v37 - v38) * 1.8447e19;
    unint64_t v35 = 2654435761u * (unint64_t)fmodf(v38, 1.8447e19);
    if (v39 >= 0.0)
    {
      if (v39 > 0.0) {
        v35 += (unint64_t)v39;
      }
    }
    else
    {
      v35 -= (unint64_t)fabsf(v39);
    }
  }
  else
  {
    unint64_t v35 = 0;
  }
  unint64_t v82 = v35;
  unint64_t v81 = (unint64_t)[(NSData *)self->_iAdID hash];
  NSUInteger v80 = [(NSString *)self->_appVersion hash];
  if ((*((unsigned char *)&self->_has + 2) & 0x20) != 0) {
    uint64_t v79 = 2654435761 * self->_denyExplicit;
  }
  else {
    uint64_t v79 = 0;
  }
  NSUInteger v78 = [(NSString *)self->_countryCode hash];
  $91ED43557AAACFFE87335DF110E99599 v40 = self->_has;
  if ((*(unsigned char *)&v40 & 0x10) != 0)
  {
    uint64_t v77 = 2654435761 * self->_appsRank;
    if ((*(_WORD *)&v40 & 0x2000) != 0)
    {
LABEL_71:
      uint64_t v76 = 2654435761 * self->_moviesRank;
      if ((*(_DWORD *)&v40 & 0x10000) != 0) {
        goto LABEL_72;
      }
      goto LABEL_77;
    }
  }
  else
  {
    uint64_t v77 = 0;
    if ((*(_WORD *)&v40 & 0x2000) != 0) {
      goto LABEL_71;
    }
  }
  uint64_t v76 = 0;
  if ((*(_DWORD *)&v40 & 0x10000) != 0)
  {
LABEL_72:
    uint64_t v74 = 2654435761 * self->_tvshowsRank;
    if ((*(_DWORD *)&v40 & 0x100000) != 0) {
      goto LABEL_73;
    }
LABEL_78:
    uint64_t v75 = 0;
    if ((*(_DWORD *)&v40 & 0x80000) != 0) {
      goto LABEL_74;
    }
    goto LABEL_79;
  }
LABEL_77:
  uint64_t v74 = 0;
  if ((*(_DWORD *)&v40 & 0x100000) == 0) {
    goto LABEL_78;
  }
LABEL_73:
  uint64_t v75 = 2654435761 * self->_allowInstallApps;
  if ((*(_DWORD *)&v40 & 0x80000) != 0)
  {
LABEL_74:
    uint64_t v73 = 2654435761 * self->_allowITunes;
    goto LABEL_80;
  }
LABEL_79:
  uint64_t v73 = 0;
LABEL_80:
  NSUInteger v72 = [(NSString *)self->_osVersionAndBuild hash];
  NSUInteger v71 = [(NSString *)self->_localeIdentifier hash];
  $91ED43557AAACFFE87335DF110E99599 v41 = self->_has;
  if ((*(_DWORD *)&v41 & 0x40000) != 0)
  {
    float unfilledDuration = self->_unfilledDuration;
    float v43 = -unfilledDuration;
    if (unfilledDuration >= 0.0) {
      float v43 = self->_unfilledDuration;
    }
    float v44 = floorf(v43 + 0.5);
    float v45 = (float)(v43 - v44) * 1.8447e19;
    unint64_t v46 = 2654435761u * (unint64_t)fmodf(v44, 1.8447e19);
    if (v45 >= 0.0)
    {
      if (v45 > 0.0) {
        v46 += (unint64_t)v45;
      }
    }
    else
    {
      v46 -= (unint64_t)fabsf(v45);
    }
    unint64_t v70 = v46;
    if ((*(_DWORD *)&v41 & 0x20000) != 0) {
      goto LABEL_82;
    }
  }
  else
  {
    unint64_t v70 = 0;
    if ((*(_DWORD *)&v41 & 0x20000) != 0)
    {
LABEL_82:
      uint64_t v69 = 2654435761 * self->_unfilledClientCount;
      goto LABEL_91;
    }
  }
  uint64_t v69 = 0;
LABEL_91:
  NSUInteger v68 = [(NSString *)self->_iTunesStore hash];
  NSUInteger v67 = [(NSString *)self->_applicationLinkedOnOS hash];
  unint64_t v66 = (unint64_t)[(NSData *)self->_anonymousDemandiAdID hash];
  unint64_t v65 = (unint64_t)[(NSData *)self->_contentiAdID hash];
  $91ED43557AAACFFE87335DF110E99599 v47 = self->_has;
  if ((*(unsigned char *)&v47 & 0x40) != 0) {
    uint64_t v64 = 2654435761 * self->_deviceMode;
  }
  else {
    uint64_t v64 = 0;
  }
  unint64_t v84 = v24;
  if ((*(unsigned char *)&v47 & 2) != 0) {
    uint64_t v63 = 2654435761 * self->_accountType;
  }
  else {
    uint64_t v63 = 0;
  }
  unint64_t v48 = v10;
  unint64_t v62 = (unint64_t)[(NSData *)self->_dPID hash];
  NSUInteger v61 = [(NSString *)self->_locality hash];
  NSUInteger v49 = [(NSString *)self->_administrativeArea hash];
  NSUInteger v50 = [(NSString *)self->_subAdministrativeArea hash];
  NSUInteger v51 = [(NSString *)self->_isoCountryCode hash];
  NSUInteger v52 = [(NSString *)self->_postalCode hash];
  if (*((unsigned char *)&self->_has + 3)) {
    uint64_t v53 = 2654435761 * self->_isTest;
  }
  else {
    uint64_t v53 = 0;
  }
  NSUInteger v54 = [(NSString *)self->_campaignNameSpace hash];
  $91ED43557AAACFFE87335DF110E99599 v55 = self->_has;
  if ((*(unsigned char *)&v55 & 4) != 0)
  {
    uint64_t v56 = 2654435761 * self->_advertisingIdentifierMonthResetCount;
    if ((*(_DWORD *)&v55 & 0x2000000) != 0)
    {
LABEL_102:
      uint64_t v57 = 2654435761 * self->_limitAdTracking;
      if ((*(_DWORD *)&v55 & 0x400000) != 0) {
        goto LABEL_103;
      }
LABEL_107:
      uint64_t v58 = 0;
      if ((*(unsigned char *)&v55 & 8) != 0) {
        goto LABEL_104;
      }
LABEL_108:
      uint64_t v59 = 0;
      return v96 ^ v97 ^ v95 ^ v94 ^ v93 ^ v92 ^ v91 ^ v90 ^ (2654435761 * screenWidth) ^ (2654435761 * screenHeight) ^ (2654435761 * screenDPI) ^ v86 ^ v48 ^ v15 ^ v85 ^ v84 ^ v25 ^ v83 ^ v82 ^ v81 ^ v80 ^ v79 ^ v78 ^ v77 ^ v76 ^ v74 ^ v75 ^ v73 ^ v72 ^ v71 ^ v70 ^ v69 ^ v68 ^ v67 ^ v66 ^ v65 ^ v64 ^ v63 ^ v62 ^ v61 ^ v49 ^ v50 ^ v51 ^ v52 ^ v53 ^ v54 ^ v56 ^ v57 ^ v58 ^ v59;
    }
  }
  else
  {
    uint64_t v56 = 0;
    if ((*(_DWORD *)&v55 & 0x2000000) != 0) {
      goto LABEL_102;
    }
  }
  uint64_t v57 = 0;
  if ((*(_DWORD *)&v55 & 0x400000) == 0) {
    goto LABEL_107;
  }
LABEL_103:
  uint64_t v58 = 2654435761 * self->_internalUserWantsProdAds;
  if ((*(unsigned char *)&v55 & 8) == 0) {
    goto LABEL_108;
  }
LABEL_104:
  uint64_t v59 = 2654435761 * self->_appStoreViewAdVersion;
  return v96 ^ v97 ^ v95 ^ v94 ^ v93 ^ v92 ^ v91 ^ v90 ^ (2654435761 * screenWidth) ^ (2654435761 * screenHeight) ^ (2654435761 * screenDPI) ^ v86 ^ v48 ^ v15 ^ v85 ^ v84 ^ v25 ^ v83 ^ v82 ^ v81 ^ v80 ^ v79 ^ v78 ^ v77 ^ v76 ^ v74 ^ v75 ^ v73 ^ v72 ^ v71 ^ v70 ^ v69 ^ v68 ^ v67 ^ v66 ^ v65 ^ v64 ^ v63 ^ v62 ^ v61 ^ v49 ^ v50 ^ v51 ^ v52 ^ v53 ^ v54 ^ v56 ^ v57 ^ v58 ^ v59;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if (*((void *)v4 + 19)) {
    -[APPBRequestProperties setDeviceModel:](self, "setDeviceModel:");
  }
  if (*((void *)v4 + 6)) {
    -[APPBRequestProperties setAppID:](self, "setAppID:");
  }
  if ((*((unsigned char *)v4 + 305) & 0x40) != 0)
  {
    self->_uint64_t runState = *((_DWORD *)v4 + 62);
    *(_DWORD *)&self->_has |= 0x4000u;
  }
  if (*((void *)v4 + 13)) {
    -[APPBRequestProperties setCarrierMNC:](self, "setCarrierMNC:");
  }
  if (*((void *)v4 + 12)) {
    -[APPBRequestProperties setCarrierMCC:](self, "setCarrierMCC:");
  }
  int v5 = *((_DWORD *)v4 + 76);
  if ((v5 & 0x800000) != 0)
  {
    self->_isOnInternationalDataRoaming = *((unsigned char *)v4 + 300);
    *(_DWORD *)&self->_has |= 0x800000u;
    int v5 = *((_DWORD *)v4 + 76);
    if ((v5 & 0x20) == 0)
    {
LABEL_13:
      if ((v5 & 0x8000) == 0) {
        goto LABEL_15;
      }
      goto LABEL_14;
    }
  }
  else if ((v5 & 0x20) == 0)
  {
    goto LABEL_13;
  }
  self->_uint64_t connectionType = *((_DWORD *)v4 + 28);
  *(_DWORD *)&self->_has |= 0x20u;
  if ((*((_DWORD *)v4 + 76) & 0x8000) != 0)
  {
LABEL_14:
    self->_float timezone = *((float *)v4 + 68);
    *(_DWORD *)&self->_has |= 0x8000u;
  }
LABEL_15:
  self->_uint64_t screenWidth = *((_DWORD *)v4 + 65);
  self->_uint64_t screenHeight = *((_DWORD *)v4 + 64);
  self->_uint64_t screenDPI = *((_DWORD *)v4 + 63);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = *((id *)v4 + 36);
  id v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v8; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        -[APPBRequestProperties addUserKeyboard:](self, "addUserKeyboard:", *(void *)(*((void *)&v16 + 1) + 8 * i), (void)v16);
      }
      id v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  int v11 = *((_DWORD *)v4 + 76);
  if (v11)
  {
    self->_double clientClockTime = *((double *)v4 + 1);
    *(_DWORD *)&self->_has |= 1u;
    int v11 = *((_DWORD *)v4 + 76);
    if ((v11 & 0x400) == 0)
    {
LABEL_24:
      if ((v11 & 0x800) == 0) {
        goto LABEL_25;
      }
      goto LABEL_91;
    }
  }
  else if ((v11 & 0x400) == 0)
  {
    goto LABEL_24;
  }
  self->_float localLatency = *((float *)v4 + 49);
  *(_DWORD *)&self->_has |= 0x400u;
  int v11 = *((_DWORD *)v4 + 76);
  if ((v11 & 0x800) == 0)
  {
LABEL_25:
    if ((v11 & 0x1000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_92;
  }
LABEL_91:
  self->_localLatencyCount = *((_DWORD *)v4 + 50);
  *(_DWORD *)&self->_has |= 0x800u;
  int v11 = *((_DWORD *)v4 + 76);
  if ((v11 & 0x1000) == 0)
  {
LABEL_26:
    if ((v11 & 0x80) == 0) {
      goto LABEL_27;
    }
    goto LABEL_93;
  }
LABEL_92:
  self->_float localLatencyStddev = *((float *)v4 + 51);
  *(_DWORD *)&self->_has |= 0x1000u;
  int v11 = *((_DWORD *)v4 + 76);
  if ((v11 & 0x80) == 0)
  {
LABEL_27:
    if ((v11 & 0x100) == 0) {
      goto LABEL_28;
    }
    goto LABEL_94;
  }
LABEL_93:
  self->_float localBandwidth = *((float *)v4 + 46);
  *(_DWORD *)&self->_has |= 0x80u;
  int v11 = *((_DWORD *)v4 + 76);
  if ((v11 & 0x100) == 0)
  {
LABEL_28:
    if ((v11 & 0x200) == 0) {
      goto LABEL_30;
    }
    goto LABEL_29;
  }
LABEL_94:
  self->_float localBandwidthBytes = *((float *)v4 + 47);
  *(_DWORD *)&self->_has |= 0x100u;
  if ((*((_DWORD *)v4 + 76) & 0x200) != 0)
  {
LABEL_29:
    self->_float localBandwidthStddev = *((float *)v4 + 48);
    *(_DWORD *)&self->_has |= 0x200u;
  }
LABEL_30:
  if (*((void *)v4 + 20)) {
    -[APPBRequestProperties setIAdID:](self, "setIAdID:");
  }
  if (*((void *)v4 + 8)) {
    -[APPBRequestProperties setAppVersion:](self, "setAppVersion:");
  }
  if ((*((unsigned char *)v4 + 306) & 0x20) != 0)
  {
    self->_denyExplicit = *((unsigned char *)v4 + 298);
    *(_DWORD *)&self->_has |= 0x200000u;
  }
  if (*((void *)v4 + 16)) {
    -[APPBRequestProperties setCountryCode:](self, "setCountryCode:");
  }
  int v12 = *((_DWORD *)v4 + 76);
  if ((v12 & 0x10) != 0)
  {
    self->_appsRank = *((_DWORD *)v4 + 20);
    *(_DWORD *)&self->_has |= 0x10u;
    int v12 = *((_DWORD *)v4 + 76);
    if ((v12 & 0x2000) == 0)
    {
LABEL_40:
      if ((v12 & 0x10000) == 0) {
        goto LABEL_41;
      }
      goto LABEL_98;
    }
  }
  else if ((v12 & 0x2000) == 0)
  {
    goto LABEL_40;
  }
  self->_moviesRank = *((_DWORD *)v4 + 56);
  *(_DWORD *)&self->_has |= 0x2000u;
  int v12 = *((_DWORD *)v4 + 76);
  if ((v12 & 0x10000) == 0)
  {
LABEL_41:
    if ((v12 & 0x100000) == 0) {
      goto LABEL_42;
    }
    goto LABEL_99;
  }
LABEL_98:
  self->_tvshowsRank = *((_DWORD *)v4 + 69);
  *(_DWORD *)&self->_has |= 0x10000u;
  int v12 = *((_DWORD *)v4 + 76);
  if ((v12 & 0x100000) == 0)
  {
LABEL_42:
    if ((v12 & 0x80000) == 0) {
      goto LABEL_44;
    }
    goto LABEL_43;
  }
LABEL_99:
  self->_allowInstallApps = *((unsigned char *)v4 + 297);
  *(_DWORD *)&self->_has |= 0x100000u;
  if ((*((_DWORD *)v4 + 76) & 0x80000) != 0)
  {
LABEL_43:
    self->_allowITunes = *((unsigned char *)v4 + 296);
    *(_DWORD *)&self->_has |= 0x80000u;
  }
LABEL_44:
  if (*((void *)v4 + 29)) {
    -[APPBRequestProperties setOsVersionAndBuild:](self, "setOsVersionAndBuild:");
  }
  if (*((void *)v4 + 26)) {
    -[APPBRequestProperties setLocaleIdentifier:](self, "setLocaleIdentifier:");
  }
  int v13 = *((_DWORD *)v4 + 76);
  if ((v13 & 0x40000) != 0)
  {
    self->_float unfilledDuration = *((float *)v4 + 71);
    *(_DWORD *)&self->_has |= 0x40000u;
    int v13 = *((_DWORD *)v4 + 76);
  }
  if ((v13 & 0x20000) != 0)
  {
    self->_unfilledClientCount = *((_DWORD *)v4 + 70);
    *(_DWORD *)&self->_has |= 0x20000u;
  }
  if (*((void *)v4 + 21)) {
    -[APPBRequestProperties setITunesStore:](self, "setITunesStore:");
  }
  if (*((void *)v4 + 9)) {
    -[APPBRequestProperties setApplicationLinkedOnOS:](self, "setApplicationLinkedOnOS:");
  }
  if (*((void *)v4 + 5)) {
    -[APPBRequestProperties setAnonymousDemandiAdID:](self, "setAnonymousDemandiAdID:");
  }
  if (*((void *)v4 + 15)) {
    -[APPBRequestProperties setContentiAdID:](self, "setContentiAdID:");
  }
  int v14 = *((_DWORD *)v4 + 76);
  if ((v14 & 0x40) != 0)
  {
    self->_uint64_t deviceMode = *((_DWORD *)v4 + 36);
    *(_DWORD *)&self->_has |= 0x40u;
    int v14 = *((_DWORD *)v4 + 76);
  }
  if ((v14 & 2) != 0)
  {
    self->_uint64_t accountType = *((_DWORD *)v4 + 4);
    *(_DWORD *)&self->_has |= 2u;
  }
  if (*((void *)v4 + 17)) {
    -[APPBRequestProperties setDPID:](self, "setDPID:");
  }
  if (*((void *)v4 + 27)) {
    -[APPBRequestProperties setLocality:](self, "setLocality:");
  }
  if (*((void *)v4 + 3)) {
    -[APPBRequestProperties setAdministrativeArea:](self, "setAdministrativeArea:");
  }
  if (*((void *)v4 + 33)) {
    -[APPBRequestProperties setSubAdministrativeArea:](self, "setSubAdministrativeArea:");
  }
  if (*((void *)v4 + 22)) {
    -[APPBRequestProperties setIsoCountryCode:](self, "setIsoCountryCode:");
  }
  if (*((void *)v4 + 30)) {
    -[APPBRequestProperties setPostalCode:](self, "setPostalCode:");
  }
  if (*((unsigned char *)v4 + 307))
  {
    self->_isTest = *((unsigned char *)v4 + 301);
    *(_DWORD *)&self->_has |= 0x1000000u;
  }
  if (*((void *)v4 + 11)) {
    -[APPBRequestProperties setCampaignNameSpace:](self, "setCampaignNameSpace:");
  }
  int v15 = *((_DWORD *)v4 + 76);
  if ((v15 & 4) != 0)
  {
    self->_advertisingIdentifierMonthResetCount = *((_DWORD *)v4 + 8);
    *(_DWORD *)&self->_has |= 4u;
    int v15 = *((_DWORD *)v4 + 76);
    if ((v15 & 0x2000000) == 0)
    {
LABEL_82:
      if ((v15 & 0x400000) == 0) {
        goto LABEL_83;
      }
LABEL_103:
      self->_internalUserWantsProdAds = *((unsigned char *)v4 + 299);
      *(_DWORD *)&self->_has |= 0x400000u;
      if ((*((_DWORD *)v4 + 76) & 8) == 0) {
        goto LABEL_85;
      }
      goto LABEL_84;
    }
  }
  else if ((v15 & 0x2000000) == 0)
  {
    goto LABEL_82;
  }
  self->_limitAdTracking = *((unsigned char *)v4 + 302);
  *(_DWORD *)&self->_has |= 0x2000000u;
  int v15 = *((_DWORD *)v4 + 76);
  if ((v15 & 0x400000) != 0) {
    goto LABEL_103;
  }
LABEL_83:
  if ((v15 & 8) != 0)
  {
LABEL_84:
    self->_appStoreViewAdVersion = *((_DWORD *)v4 + 14);
    *(_DWORD *)&self->_has |= 8u;
  }
LABEL_85:
}

- (NSString)deviceModel
{
  return self->_deviceModel;
}

- (void)setDeviceModel:(id)a3
{
}

- (NSString)appID
{
  return self->_appID;
}

- (void)setAppID:(id)a3
{
}

- (NSString)carrierMNC
{
  return self->_carrierMNC;
}

- (void)setCarrierMNC:(id)a3
{
}

- (NSString)carrierMCC
{
  return self->_carrierMCC;
}

- (void)setCarrierMCC:(id)a3
{
}

- (BOOL)isOnInternationalDataRoaming
{
  return self->_isOnInternationalDataRoaming;
}

- (float)timezone
{
  return self->_timezone;
}

- (int)screenWidth
{
  return self->_screenWidth;
}

- (void)setScreenWidth:(int)a3
{
  self->_uint64_t screenWidth = a3;
}

- (int)screenHeight
{
  return self->_screenHeight;
}

- (void)setScreenHeight:(int)a3
{
  self->_uint64_t screenHeight = a3;
}

- (int)screenDPI
{
  return self->_screenDPI;
}

- (void)setScreenDPI:(int)a3
{
  self->_uint64_t screenDPI = a3;
}

- (NSMutableArray)userKeyboards
{
  return self->_userKeyboards;
}

- (void)setUserKeyboards:(id)a3
{
}

- (double)clientClockTime
{
  return self->_clientClockTime;
}

- (float)localLatency
{
  return self->_localLatency;
}

- (int)localLatencyCount
{
  return self->_localLatencyCount;
}

- (float)localLatencyStddev
{
  return self->_localLatencyStddev;
}

- (float)localBandwidth
{
  return self->_localBandwidth;
}

- (float)localBandwidthBytes
{
  return self->_localBandwidthBytes;
}

- (float)localBandwidthStddev
{
  return self->_localBandwidthStddev;
}

- (NSData)iAdID
{
  return self->_iAdID;
}

- (void)setIAdID:(id)a3
{
}

- (NSString)appVersion
{
  return self->_appVersion;
}

- (void)setAppVersion:(id)a3
{
}

- (BOOL)denyExplicit
{
  return self->_denyExplicit;
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (void)setCountryCode:(id)a3
{
}

- (int)appsRank
{
  return self->_appsRank;
}

- (int)moviesRank
{
  return self->_moviesRank;
}

- (int)tvshowsRank
{
  return self->_tvshowsRank;
}

- (BOOL)allowInstallApps
{
  return self->_allowInstallApps;
}

- (BOOL)allowITunes
{
  return self->_allowITunes;
}

- (NSString)osVersionAndBuild
{
  return self->_osVersionAndBuild;
}

- (void)setOsVersionAndBuild:(id)a3
{
}

- (NSString)localeIdentifier
{
  return self->_localeIdentifier;
}

- (void)setLocaleIdentifier:(id)a3
{
}

- (float)unfilledDuration
{
  return self->_unfilledDuration;
}

- (int)unfilledClientCount
{
  return self->_unfilledClientCount;
}

- (NSString)iTunesStore
{
  return self->_iTunesStore;
}

- (void)setITunesStore:(id)a3
{
}

- (NSString)applicationLinkedOnOS
{
  return self->_applicationLinkedOnOS;
}

- (void)setApplicationLinkedOnOS:(id)a3
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

- (NSData)dPID
{
  return self->_dPID;
}

- (void)setDPID:(id)a3
{
}

- (NSString)locality
{
  return self->_locality;
}

- (void)setLocality:(id)a3
{
}

- (NSString)administrativeArea
{
  return self->_administrativeArea;
}

- (void)setAdministrativeArea:(id)a3
{
}

- (NSString)subAdministrativeArea
{
  return self->_subAdministrativeArea;
}

- (void)setSubAdministrativeArea:(id)a3
{
}

- (NSString)isoCountryCode
{
  return self->_isoCountryCode;
}

- (void)setIsoCountryCode:(id)a3
{
}

- (NSString)postalCode
{
  return self->_postalCode;
}

- (void)setPostalCode:(id)a3
{
}

- (BOOL)isTest
{
  return self->_isTest;
}

- (NSString)campaignNameSpace
{
  return self->_campaignNameSpace;
}

- (void)setCampaignNameSpace:(id)a3
{
}

- (int)advertisingIdentifierMonthResetCount
{
  return self->_advertisingIdentifierMonthResetCount;
}

- (BOOL)limitAdTracking
{
  return self->_limitAdTracking;
}

- (BOOL)internalUserWantsProdAds
{
  return self->_internalUserWantsProdAds;
}

- (int)appStoreViewAdVersion
{
  return self->_appStoreViewAdVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userKeyboards, 0);
  objc_storeStrong((id *)&self->_subAdministrativeArea, 0);
  objc_storeStrong((id *)&self->_postalCode, 0);
  objc_storeStrong((id *)&self->_osVersionAndBuild, 0);
  objc_storeStrong((id *)&self->_locality, 0);
  objc_storeStrong((id *)&self->_localeIdentifier, 0);
  objc_storeStrong((id *)&self->_isoCountryCode, 0);
  objc_storeStrong((id *)&self->_iTunesStore, 0);
  objc_storeStrong((id *)&self->_iAdID, 0);
  objc_storeStrong((id *)&self->_deviceModel, 0);
  objc_storeStrong((id *)&self->_dPID, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_contentiAdID, 0);
  objc_storeStrong((id *)&self->_carrierMNC, 0);
  objc_storeStrong((id *)&self->_carrierMCC, 0);
  objc_storeStrong((id *)&self->_campaignNameSpace, 0);
  objc_storeStrong((id *)&self->_applicationLinkedOnOS, 0);
  objc_storeStrong((id *)&self->_appVersion, 0);
  objc_storeStrong((id *)&self->_appID, 0);
  objc_storeStrong((id *)&self->_anonymousDemandiAdID, 0);

  objc_storeStrong((id *)&self->_administrativeArea, 0);
}

@end