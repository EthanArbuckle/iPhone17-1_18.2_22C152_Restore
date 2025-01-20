@interface WFSetupData
+ (BOOL)supportsSecureCoding;
- (BOOL)dictationIsEnabled;
- (BOOL)hasHomeButton;
- (BOOL)isAutomaticTimeZoneEnabled;
- (BOOL)isBackupEnabled;
- (BOOL)isConnectedToWiFi;
- (BOOL)isOptedInToAppAnalytics;
- (BOOL)isOptedInToDeviceAnalytics;
- (BOOL)isOptedInToFindMyDevice;
- (BOOL)isOptedInToLocationServices;
- (BOOL)isRestoring;
- (BOOL)siriAssistantIsEnabled;
- (BOOL)siriDataSharingIsEnabled;
- (BOOL)siriVoiceTriggerIsEnabled;
- (BOOL)suppressDictationOptIn;
- (BOOL)usesSameAccountForiTunes;
- (NSArray)keyboards;
- (NSArray)networkPasswords;
- (NSArray)networks;
- (NSData)accessibilitySettings;
- (NSData)locationServicesData;
- (NSDictionary)localePreferences;
- (NSString)appleID;
- (NSString)backupUUID;
- (NSString)deviceClass;
- (NSString)deviceModel;
- (NSString)deviceName;
- (NSString)firstName;
- (NSString)productVersion;
- (NSString)siriAssistantLanguageCode;
- (NSString)siriAssistantOutputVoice;
- (NSString)timeZone;
- (WFSetupData)initWithCoder:(id)a3;
- (WFSetupData)initWithKeyboards:(void *)a3 appleID:(id)a4 usesSameAccountForiTunes:(BOOL)a5 isConnectedToWiFi:(BOOL)a6 networks:(id)a7 networkPasswords:(id)a8 localePreferences:(id)a9 isAutomaticTimeZoneEnabled:(BOOL)a10 timeZone:(id)a11 accessibilitySettings:(id)a12 firstName:(id)a13 deviceModel:(id)a14 deviceClass:(id)a15 hasHomeButton:(BOOL)a16 isRestoring:(BOOL)a17 deviceName:(id)a18 backupUUID:(id)a19 isBackupEnabled:(BOOL)a20 dateOfLastBackup:(id)a21 isOptedInToLocationServices:(BOOL)a22 isOptedInToDeviceAnalytics:(BOOL)a23 locationServicesData:(id)a24 isOptedInToFindMyDevice:(BOOL)a25 isOptedInToAppAnalytics:(BOOL)a26 siriAssistantIsEnabled:(BOOL)a27 siriVoiceTriggerIsEnabled:(BOOL)a28 siriAssistantLanguageCode:(id)a29 siriAssistantOutputVoice:(id)a30 siriDataSharingIsEnabled:(BOOL)a31 dictationIsEnabled:(BOOL)a32 suppressDictationOptIn:(BOOL)a33 deviceTermsIdentifier:(int64_t)a34 productVersion:(id)a35 anisetteDataProvider:(id)a36 prescriptionRecords:(id)a37 walletData:(id)a38;
- (WFSetupDataInternal)underlyingSwiftObject;
- (id)walletData;
- (int64_t)deviceTermsIdentifier;
- (void)encodeWithCoder:(id)a3;
- (void)setUnderlyingSwiftObject:(id)a3;
@end

@implementation WFSetupData

- (WFSetupData)initWithKeyboards:(void *)a3 appleID:(id)a4 usesSameAccountForiTunes:(BOOL)a5 isConnectedToWiFi:(BOOL)a6 networks:(id)a7 networkPasswords:(id)a8 localePreferences:(id)a9 isAutomaticTimeZoneEnabled:(BOOL)a10 timeZone:(id)a11 accessibilitySettings:(id)a12 firstName:(id)a13 deviceModel:(id)a14 deviceClass:(id)a15 hasHomeButton:(BOOL)a16 isRestoring:(BOOL)a17 deviceName:(id)a18 backupUUID:(id)a19 isBackupEnabled:(BOOL)a20 dateOfLastBackup:(id)a21 isOptedInToLocationServices:(BOOL)a22 isOptedInToDeviceAnalytics:(BOOL)a23 locationServicesData:(id)a24 isOptedInToFindMyDevice:(BOOL)a25 isOptedInToAppAnalytics:(BOOL)a26 siriAssistantIsEnabled:(BOOL)a27 siriVoiceTriggerIsEnabled:(BOOL)a28 siriAssistantLanguageCode:(id)a29 siriAssistantOutputVoice:(id)a30 siriDataSharingIsEnabled:(BOOL)a31 dictationIsEnabled:(BOOL)a32 suppressDictationOptIn:(BOOL)a33 deviceTermsIdentifier:(int64_t)a34 productVersion:(id)a35 anisetteDataProvider:(id)a36 prescriptionRecords:(id)a37 walletData:(id)a38
{
  BOOL v60 = a5;
  BOOL v61 = a6;
  id v71 = a4;
  id v40 = a7;
  id v70 = a8;
  id v41 = a9;
  id v42 = a11;
  id v43 = a12;
  id v44 = a13;
  id v45 = a14;
  id v46 = a15;
  id v47 = a18;
  id v48 = a19;
  id v69 = a24;
  id v68 = a29;
  id v67 = a30;
  id v66 = a35;
  id v65 = a36;
  id v64 = a37;
  id v63 = a38;
  v72.receiver = self;
  v72.super_class = (Class)WFSetupData;
  v49 = [(WFSetupData *)&v72 init];
  if (v49)
  {
    BYTE2(v58) = a33;
    LOWORD(v58) = __PAIR16__(a32, a31);
    WORD1(v57) = __PAIR16__(a28, a27);
    LOWORD(v57) = __PAIR16__(a26, a25);
    *(_WORD *)((char *)&v56 + 1) = __PAIR16__(a23, a22);
    LOBYTE(v56) = a20;
    LOWORD(v55) = __PAIR16__(a17, a16);
    LOBYTE(v54) = a10;
    v50 = -[WFSetupDataInternal initWithKeyboards:appleID:usesSameAccountForiTunes:isConnectedToWiFi:networks:networkPasswords:localePreferences:isAutomaticTimeZoneEnabled:timeZone:accessibilitySettings:firstName:deviceModel:deviceClass:hasHomeButton:isRestoring:deviceName:backupUUID:isBackupEnabled:isOptedInToLocationServices:isOptedInToDeviceAnalytics:locationServicesData:isOptedInToFindMyDevice:isOptedInToAppAnalytics:siriAssistantIsEnabled:siriVoiceTriggerIsEnabled:siriAssistantLanguageCode:siriAssistantOutputVoice:siriDataSharingIsEnabled:dictationIsEnabled:suppressDictationOptIn:deviceTermsIdentifier:productVersion:anisetteDataProvider:prescriptionRecords:walletData:]([WFSetupDataInternal alloc], "initWithKeyboards:appleID:usesSameAccountForiTunes:isConnectedToWiFi:networks:networkPasswords:localePreferences:isAutomaticTimeZoneEnabled:timeZone:accessibilitySettings:firstName:deviceModel:deviceClass:hasHomeButton:isRestoring:deviceName:backupUUID:isBackupEnabled:isOptedInToLocationServices:isOptedInToDeviceAnalytics:locationServicesData:isOptedInToFindMyDevice:isOptedInToAppAnalytics:siriAssistantIsEnabled:siriVoiceTriggerIsEnabled:siriAssistantLanguageCode:siriAssistantOutputVoice:siriDataSharingIsEnabled:dictationIsEnabled:suppressDictationOptIn:deviceTermsIdentifier:productVersion:anisetteDataProvider:prescriptionRecords:walletData:", a3, v71, v60, v61, v40, v70, v41, v54, v42, v43, v44, v45,
            v46,
            v55,
            v47,
            v48,
            v56,
            v69,
            v57,
            v68,
            v67,
            v58,
            a34,
            v66,
            v65,
            v64,
            v63);
    underlyingSwiftObject = v49->_underlyingSwiftObject;
    v49->_underlyingSwiftObject = v50;

    v52 = v49;
  }

  return v49;
}

- (NSArray)keyboards
{
  return (NSArray *)[(WFSetupDataInternal *)self->_underlyingSwiftObject keyboards];
}

- (NSString)appleID
{
  return [(WFSetupDataInternal *)self->_underlyingSwiftObject appleID];
}

- (BOOL)usesSameAccountForiTunes
{
  return [(WFSetupDataInternal *)self->_underlyingSwiftObject usesSameAccountForiTunes];
}

- (BOOL)isConnectedToWiFi
{
  return [(WFSetupDataInternal *)self->_underlyingSwiftObject isConnectedToWiFi];
}

- (NSArray)networks
{
  return [(WFSetupDataInternal *)self->_underlyingSwiftObject networks];
}

- (NSArray)networkPasswords
{
  return [(WFSetupDataInternal *)self->_underlyingSwiftObject networkPasswords];
}

- (NSDictionary)localePreferences
{
  return [(WFSetupDataInternal *)self->_underlyingSwiftObject localePreferences];
}

- (BOOL)isAutomaticTimeZoneEnabled
{
  return [(WFSetupDataInternal *)self->_underlyingSwiftObject isAutomaticTimeZoneEnabled];
}

- (NSString)timeZone
{
  return [(WFSetupDataInternal *)self->_underlyingSwiftObject timeZone];
}

- (NSData)accessibilitySettings
{
  return [(WFSetupDataInternal *)self->_underlyingSwiftObject accessibilitySettings];
}

- (id)walletData
{
  return [(WFSetupDataInternal *)self->_underlyingSwiftObject walletData];
}

- (NSString)firstName
{
  return [(WFSetupDataInternal *)self->_underlyingSwiftObject firstName];
}

- (NSString)deviceName
{
  return [(WFSetupDataInternal *)self->_underlyingSwiftObject deviceName];
}

- (NSString)backupUUID
{
  return [(WFSetupDataInternal *)self->_underlyingSwiftObject backupUUID];
}

- (BOOL)isBackupEnabled
{
  return [(WFSetupDataInternal *)self->_underlyingSwiftObject isBackupEnabled];
}

- (BOOL)isOptedInToLocationServices
{
  return [(WFSetupDataInternal *)self->_underlyingSwiftObject isOptedInToLocationServices];
}

- (NSData)locationServicesData
{
  return [(WFSetupDataInternal *)self->_underlyingSwiftObject locationServicesData];
}

- (BOOL)isOptedInToFindMyDevice
{
  return [(WFSetupDataInternal *)self->_underlyingSwiftObject isOptedInToFindMyDevice];
}

- (BOOL)isOptedInToDeviceAnalytics
{
  return [(WFSetupDataInternal *)self->_underlyingSwiftObject isOptedInToDeviceAnalytics];
}

- (BOOL)isOptedInToAppAnalytics
{
  return [(WFSetupDataInternal *)self->_underlyingSwiftObject isOptedInToAppAnalytics];
}

- (BOOL)siriAssistantIsEnabled
{
  return [(WFSetupDataInternal *)self->_underlyingSwiftObject siriAssistantIsEnabled];
}

- (BOOL)siriVoiceTriggerIsEnabled
{
  return [(WFSetupDataInternal *)self->_underlyingSwiftObject siriVoiceTriggerIsEnabled];
}

- (NSString)siriAssistantLanguageCode
{
  return [(WFSetupDataInternal *)self->_underlyingSwiftObject siriAssistantLanguageCode];
}

- (NSString)siriAssistantOutputVoice
{
  return (NSString *)[(WFSetupDataInternal *)self->_underlyingSwiftObject siriAssistantOutputVoice];
}

- (BOOL)siriDataSharingIsEnabled
{
  return [(WFSetupDataInternal *)self->_underlyingSwiftObject siriDataSharingIsEnabled];
}

- (BOOL)dictationIsEnabled
{
  return [(WFSetupDataInternal *)self->_underlyingSwiftObject dictationIsEnabled];
}

- (BOOL)suppressDictationOptIn
{
  return [(WFSetupDataInternal *)self->_underlyingSwiftObject suppressDictationOptIn];
}

- (int64_t)deviceTermsIdentifier
{
  return [(WFSetupDataInternal *)self->_underlyingSwiftObject deviceTermsIdentifier];
}

- (NSString)productVersion
{
  return [(WFSetupDataInternal *)self->_underlyingSwiftObject productVersion];
}

+ (BOOL)supportsSecureCoding
{
  return +[WFSetupDataInternal supportsSecureCoding];
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(WFSetupData *)self underlyingSwiftObject];
  [v5 encodeWithCoder:v4];
}

- (WFSetupData)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)WFSetupData;
  id v5 = [(WFSetupData *)&v9 init];
  if (v5)
  {
    v6 = [[WFSetupDataInternal alloc] initWithCoder:v4];
    [(WFSetupData *)v5 setUnderlyingSwiftObject:v6];

    v7 = [(WFSetupData *)v5 underlyingSwiftObject];

    if (v7) {
      v7 = v5;
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSString)deviceModel
{
  return self->_deviceModel;
}

- (NSString)deviceClass
{
  return self->_deviceClass;
}

- (BOOL)hasHomeButton
{
  return self->_hasHomeButton;
}

- (BOOL)isRestoring
{
  return self->_isRestoring;
}

- (WFSetupDataInternal)underlyingSwiftObject
{
  return (WFSetupDataInternal *)objc_getProperty(self, a2, 32, 1);
}

- (void)setUnderlyingSwiftObject:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingSwiftObject, 0);
  objc_storeStrong((id *)&self->_deviceClass, 0);
  objc_storeStrong((id *)&self->_deviceModel, 0);
}

@end