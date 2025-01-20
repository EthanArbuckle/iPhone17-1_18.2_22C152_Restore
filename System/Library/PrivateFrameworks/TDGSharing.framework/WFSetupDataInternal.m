@interface WFSetupDataInternal
+ (BOOL)supportsSecureCoding;
- (AFVoiceInfo)siriAssistantOutputVoice;
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
- (NSArray)networkPasswords;
- (NSArray)networks;
- (NSArray)prescriptionRecords;
- (NSData)accessibilitySettings;
- (NSData)locationServicesData;
- (NSData)walletData;
- (NSDictionary)localePreferences;
- (NSString)appleID;
- (NSString)backupUUID;
- (NSString)deviceClass;
- (NSString)deviceModel;
- (NSString)deviceName;
- (NSString)firstName;
- (NSString)productVersion;
- (NSString)siriAssistantLanguageCode;
- (NSString)timeZone;
- (WFSetupDataInternal)init;
- (WFSetupDataInternal)initWithCoder:(id)a3;
- (WFSetupDataInternal)initWithKeyboards:(id)a3 appleID:(id)a4 usesSameAccountForiTunes:(BOOL)a5 isConnectedToWiFi:(BOOL)a6 networks:(id)a7 networkPasswords:(id)a8 localePreferences:(id)a9 isAutomaticTimeZoneEnabled:(BOOL)a10 timeZone:(id)a11 accessibilitySettings:(id)a12 firstName:(id)a13 deviceModel:(id)a14 deviceClass:(id)a15 hasHomeButton:(BOOL)a16 isRestoring:(BOOL)a17 deviceName:(id)a18 backupUUID:(id)a19 isBackupEnabled:(BOOL)a20 isOptedInToLocationServices:(BOOL)a21 isOptedInToDeviceAnalytics:(BOOL)a22 locationServicesData:(id)a23 isOptedInToFindMyDevice:(BOOL)a24 isOptedInToAppAnalytics:(BOOL)a25 siriAssistantIsEnabled:(BOOL)a26 siriVoiceTriggerIsEnabled:(BOOL)a27 siriAssistantLanguageCode:(id)a28 siriAssistantOutputVoice:(id)a29 siriDataSharingIsEnabled:(BOOL)a30 dictationIsEnabled:(BOOL)a31 suppressDictationOptIn:(BOOL)a32 deviceTermsIdentifier:(int64_t)a33 productVersion:(id)a34 anisetteDataProvider:(id)a35 prescriptionRecords:(id)a36 walletData:(id)a37;
- (_TtC10TDGSharing33WFSetupServerAnisetteDataProvider)anisetteDataProvider;
- (id)keyboards;
- (int64_t)deviceTermsIdentifier;
- (int64_t)version;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFSetupDataInternal

- (int64_t)version
{
  return 0;
}

- (id)keyboards
{
  v2 = (void *)swift_unknownObjectRetain();
  return v2;
}

- (NSString)appleID
{
  return (NSString *)sub_25E77F14C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___WFSetupDataInternal_appleID);
}

- (BOOL)usesSameAccountForiTunes
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___WFSetupDataInternal_usesSameAccountForiTunes);
}

- (NSData)walletData
{
  return (NSData *)sub_25E77EFDC((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___WFSetupDataInternal_walletData);
}

- (BOOL)isConnectedToWiFi
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___WFSetupDataInternal_isConnectedToWiFi);
}

- (NSArray)networks
{
  return (NSArray *)sub_25E77EC9C((uint64_t)self, (uint64_t)a2, (uint64_t)&OBJC_IVAR___WFSetupDataInternal_networks, (unint64_t *)&qword_26A706DF0);
}

- (NSArray)networkPasswords
{
  return (NSArray *)sub_25E77EC9C((uint64_t)self, (uint64_t)a2, (uint64_t)&OBJC_IVAR___WFSetupDataInternal_networkPasswords, (unint64_t *)&unk_26A7067D0);
}

- (NSDictionary)localePreferences
{
  swift_bridgeObjectRetain();
  v2 = (void *)sub_25E7BC370();
  swift_bridgeObjectRelease();
  return (NSDictionary *)v2;
}

- (BOOL)isAutomaticTimeZoneEnabled
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___WFSetupDataInternal_isAutomaticTimeZoneEnabled);
}

- (NSString)timeZone
{
  return (NSString *)sub_25E77F2C8();
}

- (NSData)accessibilitySettings
{
  return (NSData *)sub_25E77EFDC((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___WFSetupDataInternal_accessibilitySettings);
}

- (NSString)firstName
{
  return (NSString *)sub_25E77F14C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___WFSetupDataInternal_firstName);
}

- (NSString)deviceModel
{
  return (NSString *)sub_25E77F2C8();
}

- (NSString)deviceClass
{
  return (NSString *)sub_25E77F2C8();
}

- (BOOL)hasHomeButton
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___WFSetupDataInternal_hasHomeButton);
}

- (BOOL)isRestoring
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___WFSetupDataInternal_isRestoring);
}

- (NSString)deviceName
{
  return (NSString *)sub_25E77F2C8();
}

- (NSString)backupUUID
{
  return (NSString *)sub_25E77F14C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___WFSetupDataInternal_backupUUID);
}

- (BOOL)isBackupEnabled
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___WFSetupDataInternal_isBackupEnabled);
}

- (BOOL)isOptedInToLocationServices
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___WFSetupDataInternal_isOptedInToLocationServices);
}

- (NSData)locationServicesData
{
  return (NSData *)sub_25E77EFDC((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___WFSetupDataInternal_locationServicesData);
}

- (BOOL)isOptedInToFindMyDevice
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___WFSetupDataInternal_isOptedInToFindMyDevice);
}

- (BOOL)isOptedInToDeviceAnalytics
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___WFSetupDataInternal_isOptedInToDeviceAnalytics);
}

- (BOOL)isOptedInToAppAnalytics
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___WFSetupDataInternal_isOptedInToAppAnalytics);
}

- (BOOL)siriAssistantIsEnabled
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___WFSetupDataInternal_siriAssistantIsEnabled);
}

- (BOOL)siriVoiceTriggerIsEnabled
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___WFSetupDataInternal_siriVoiceTriggerIsEnabled);
}

- (NSString)siriAssistantLanguageCode
{
  return (NSString *)sub_25E77F14C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___WFSetupDataInternal_siriAssistantLanguageCode);
}

- (AFVoiceInfo)siriAssistantOutputVoice
{
  return (AFVoiceInfo *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                + OBJC_IVAR___WFSetupDataInternal_siriAssistantOutputVoice));
}

- (BOOL)siriDataSharingIsEnabled
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___WFSetupDataInternal_siriDataSharingIsEnabled);
}

- (BOOL)dictationIsEnabled
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___WFSetupDataInternal_dictationIsEnabled);
}

- (BOOL)suppressDictationOptIn
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___WFSetupDataInternal_suppressDictationOptIn);
}

- (int64_t)deviceTermsIdentifier
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR___WFSetupDataInternal_deviceTermsIdentifier);
}

- (NSString)productVersion
{
  return (NSString *)sub_25E77F2C8();
}

- (_TtC10TDGSharing33WFSetupServerAnisetteDataProvider)anisetteDataProvider
{
  return (_TtC10TDGSharing33WFSetupServerAnisetteDataProvider *)*(id *)((char *)&self->super.isa + OBJC_IVAR___WFSetupDataInternal_anisetteDataProvider);
}

- (NSArray)prescriptionRecords
{
  type metadata accessor for PrescriptionRecord();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_25E7BC440();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (WFSetupDataInternal)initWithKeyboards:(id)a3 appleID:(id)a4 usesSameAccountForiTunes:(BOOL)a5 isConnectedToWiFi:(BOOL)a6 networks:(id)a7 networkPasswords:(id)a8 localePreferences:(id)a9 isAutomaticTimeZoneEnabled:(BOOL)a10 timeZone:(id)a11 accessibilitySettings:(id)a12 firstName:(id)a13 deviceModel:(id)a14 deviceClass:(id)a15 hasHomeButton:(BOOL)a16 isRestoring:(BOOL)a17 deviceName:(id)a18 backupUUID:(id)a19 isBackupEnabled:(BOOL)a20 isOptedInToLocationServices:(BOOL)a21 isOptedInToDeviceAnalytics:(BOOL)a22 locationServicesData:(id)a23 isOptedInToFindMyDevice:(BOOL)a24 isOptedInToAppAnalytics:(BOOL)a25 siriAssistantIsEnabled:(BOOL)a26 siriVoiceTriggerIsEnabled:(BOOL)a27 siriAssistantLanguageCode:(id)a28 siriAssistantOutputVoice:(id)a29 siriDataSharingIsEnabled:(BOOL)a30 dictationIsEnabled:(BOOL)a31 suppressDictationOptIn:(BOOL)a32 deviceTermsIdentifier:(int64_t)a33 productVersion:(id)a34 anisetteDataProvider:(id)a35 prescriptionRecords:(id)a36 walletData:(id)a37
{
  if (a4)
  {
    uint64_t v38 = sub_25E7BC3E0();
    uint64_t v100 = v39;
    uint64_t v101 = v38;
  }
  else
  {
    uint64_t v100 = 0;
    uint64_t v101 = 0;
  }
  sub_25E78314C(0, (unint64_t *)&qword_26A706DF0);
  uint64_t v99 = sub_25E7BC450();
  sub_25E78314C(0, (unint64_t *)&unk_26A7067D0);
  uint64_t v98 = sub_25E7BC450();
  uint64_t v97 = sub_25E7BC390();
  uint64_t v40 = sub_25E7BC3E0();
  uint64_t v95 = v41;
  uint64_t v96 = v40;
  id v102 = a3;
  swift_unknownObjectRetain();
  id v42 = a13;
  id v43 = a14;
  id v44 = a15;
  id v45 = a18;
  id v46 = a19;
  id v47 = a23;
  id v48 = a28;
  id v94 = a29;
  id v85 = a34;
  id v91 = a35;
  id v87 = a36;
  id v88 = a37;
  if (a12)
  {
    id v49 = a12;
    uint64_t v50 = sub_25E7BC210();
    uint64_t v92 = v51;
    uint64_t v93 = v50;

    if (v42)
    {
LABEL_6:
      uint64_t v52 = sub_25E7BC3E0();
      uint64_t v89 = v53;
      uint64_t v90 = v52;

      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v92 = 0xF000000000000000;
    uint64_t v93 = 0;
    if (v42) {
      goto LABEL_6;
    }
  }
  uint64_t v89 = 0;
  uint64_t v90 = 0;
LABEL_9:
  uint64_t v54 = sub_25E7BC3E0();
  uint64_t v83 = v55;
  uint64_t v84 = v54;

  uint64_t v56 = sub_25E7BC3E0();
  uint64_t v81 = v57;
  uint64_t v82 = v56;

  uint64_t v58 = sub_25E7BC3E0();
  uint64_t v79 = v59;
  uint64_t v80 = v58;

  if (v46)
  {
    uint64_t v105 = sub_25E7BC3E0();
    uint64_t v78 = v60;

    if (v47) {
      goto LABEL_11;
    }
LABEL_14:
    uint64_t v61 = 0;
    uint64_t v63 = 0xF000000000000000;
    if (v48) {
      goto LABEL_12;
    }
    goto LABEL_15;
  }
  uint64_t v105 = 0;
  uint64_t v78 = 0;
  if (!v47) {
    goto LABEL_14;
  }
LABEL_11:
  uint64_t v61 = sub_25E7BC210();
  uint64_t v63 = v62;

  if (v48)
  {
LABEL_12:
    uint64_t v64 = sub_25E7BC3E0();
    uint64_t v66 = v65;

    goto LABEL_16;
  }
LABEL_15:
  uint64_t v64 = 0;
  uint64_t v66 = 0;
LABEL_16:
  char v67 = a22;
  char v68 = a17;
  char v69 = a16;
  uint64_t v70 = sub_25E7BC3E0();
  uint64_t v76 = v71;
  uint64_t v77 = v70;

  type metadata accessor for PrescriptionRecord();
  uint64_t v86 = sub_25E7BC450();

  if (v88)
  {
    uint64_t v72 = sub_25E7BC210();
    uint64_t v74 = v73;

    char v68 = a17;
    char v69 = a16;
    char v67 = a22;
  }
  else
  {
    uint64_t v72 = 0;
    uint64_t v74 = 0xF000000000000000;
  }
  return (WFSetupDataInternal *)WFSetupData.init(keyboards:appleID:usesSameAccountForiTunes:isConnectedToWiFi:networks:networkPasswords:localePreferences:isAutomaticTimeZoneEnabled:timeZone:accessibilitySettings:firstName:deviceModel:deviceClass:hasHomeButton:isRestoring:deviceName:backupUUID:isBackupEnabled:isOptedInToLocationServices:isOptedInToDeviceAnalytics:locationServicesData:isOptedInToFindMyDevice:isOptedInToAppAnalytics:siriAssistantIsEnabled:siriVoiceTriggerIsEnabled:siriAssistantLanguageCode:siriAssistantOutputVoice:siriDataSharingIsEnabled:dictationIsEnabled:suppressDictationOptIn:deviceTermsIdentifier:productVersion:anisetteDataProvider:prescriptionRecords:walletData:)((uint64_t)v102, v101, v100, a5, a6, v99, v98, v97, a10, v96, v95, v93, v92, v90, v89, v84, v83, v82, v81,
                                  v69,
                                  v68,
                                  v80,
                                  v79,
                                  v105,
                                  v78,
                                  a20,
                                  a21,
                                  v67,
                                  v61,
                                  v63,
                                  a24,
                                  a25,
                                  a26,
                                  a27,
                                  v64,
                                  v66,
                                  (uint64_t)v94,
                                  a30,
                                  a31,
                                  a32,
                                  a33,
                                  v77,
                                  v76,
                                  (uint64_t)v91,
                                  v86,
                                  v72,
                                  v74);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  WFSetupData.encode(with:)((NSCoder)v4);
}

- (WFSetupDataInternal)initWithCoder:(id)a3
{
  return (WFSetupDataInternal *)WFSetupData.init(coder:)(a3);
}

- (WFSetupDataInternal)init
{
  result = (WFSetupDataInternal *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  sub_25E77D710(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___WFSetupDataInternal_walletData), *(void *)&self->version[OBJC_IVAR___WFSetupDataInternal_walletData]);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_25E77D710(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___WFSetupDataInternal_accessibilitySettings), *(void *)&self->version[OBJC_IVAR___WFSetupDataInternal_accessibilitySettings]);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_25E77D710(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___WFSetupDataInternal_locationServicesData), *(void *)&self->version[OBJC_IVAR___WFSetupDataInternal_locationServicesData]);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end