@interface TTSAsset
+ (BOOL)_hasTrialEntitlements;
+ (BOOL)handleProxyEvent:(id)a3 reply:(id)a4 connection:(id)a5;
+ (BOOL)setServer:(id)a3 forType:(id)a4;
+ (BOOL)setServer:(id)a3 forType:(id)a4 source:(id)a5;
+ (NSString)NewAssetNotification;
+ (TTSAssistantVoiceMaps)assistantVoiceMaps;
+ (_NSRange)_gryphonVoiceCompatibility;
+ (id)bestAssetOfTypes:(id)a3 matching:(id)a4;
+ (id)describeServer:(id)a3 forType:(id)a4;
+ (id)describeServer:(id)a3 source:(id)a4;
+ (id)getServerForType:(id)a3;
+ (id)getServerForType:(id)a3 source:(id)a4;
+ (id)listAssetsOfTypes:(id)a3 matching:(id)a4;
+ (void)_postNewAssetNotification;
+ (void)waitForCatalogUpdates;
- (BOOL)downloading;
- (BOOL)isNewer:(id)a3;
- (BOOL)isOlder:(id)a3;
- (BOOL)locallyAvailable;
- (BOOL)purgeable;
- (NSArray)supportedLanguages;
- (NSBundle)bundle;
- (NSDictionary)attributes;
- (NSNumber)age;
- (NSNumber)diskSize;
- (NSNumber)downloadSize;
- (NSString)description;
- (NSString)identifier;
- (NSString)name;
- (NSString)primaryLanguage;
- (NSString)versionDescription;
- (TTSAsset)init;
- (TTSAssetQuality)quality;
- (TTSAssetSource)assetSource;
- (TTSAssetTechnology)technology;
- (TTSAssetType)assetType;
- (id)legacyAssetWithBundle:(id)a3;
- (id)relatedAssetsWithOnlyAvailable:(BOOL)a3;
- (int64_t)gender;
- (int64_t)purgeCondition;
- (int64_t)versionNumber;
- (void)cancelDownloadingThen:(id)a3;
- (void)downloadWithReservation:(id)a3 useBattery:(BOOL)a4 progress:(id)a5 then:(id)a6;
- (void)purgeImmediately:(BOOL)a3;
@end

@implementation TTSAsset

- (TTSAsset)init
{
  v3.receiver = self;
  v3.super_class = (Class)TTSAsset;
  return [(TTSAsset *)&v3 init];
}

+ (BOOL)_hasTrialEntitlements
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v2 = SecTaskCreateFromSelf(0);
  if (v2)
  {
    objc_super v3 = v2;
    v4 = (void *)SecTaskCopyValueForEntitlement(v2, @"com.apple.trial.client", 0);
    CFRelease(v3);
    if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      long long v13 = 0u;
      long long v14 = 0u;
      long long v11 = 0u;
      long long v12 = 0u;
      id v5 = v4;
      uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6)
      {
        uint64_t v7 = *(void *)v12;
        while (2)
        {
          for (uint64_t i = 0; i != v6; ++i)
          {
            if (*(void *)v12 != v7) {
              objc_enumerationMutation(v5);
            }
            v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v9, "intValue", (void)v11) == 406)
            {
              LOBYTE(v6) = 1;
              goto LABEL_17;
            }
          }
          uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
          if (v6) {
            continue;
          }
          break;
        }
      }
LABEL_17:
    }
    else
    {
      LOBYTE(v6) = 0;
    }
  }
  else
  {
    LOBYTE(v6) = 0;
  }
  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundle, 0);
  objc_storeStrong((id *)&self->_attributes, 0);
  objc_storeStrong((id *)&self->_diskSize, 0);
  objc_storeStrong((id *)&self->_downloadSize, 0);
  objc_storeStrong((id *)&self->_age, 0);
  objc_storeStrong((id *)&self->_primaryLanguage, 0);
  objc_storeStrong((id *)&self->_supportedLanguages, 0);
  objc_storeStrong((id *)&self->_versionDescription, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_quality, 0);
  objc_storeStrong((id *)&self->_technology, 0);
  objc_storeStrong((id *)&self->_assetSource, 0);
  objc_storeStrong((id *)&self->_assetType, 0);
}

- (NSString)description
{
  return (NSString *)sub_19CDAC000(self, (uint64_t)a2, (void (*)(void))TTSAsset.description.getter);
}

+ (TTSAssistantVoiceMaps)assistantVoiceMaps
{
  uint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
  objc_super v3 = (void *)static TTSAsset.assistantVoiceMaps.getter(ObjCClassMetadata);
  return (TTSAssistantVoiceMaps *)v3;
}

- (void)downloadWithReservation:(id)a3 useBattery:(BOOL)a4 progress:(id)a5 then:(id)a6
{
  v9 = _Block_copy(a5);
  v10 = _Block_copy(a6);
  if (a3) {
    sub_19CED5260();
  }
  *(void *)(swift_allocObject() + 16) = v9;
  *(void *)(swift_allocObject() + 16) = v10;
  long long v11 = self;
  TTSAsset.download(reservation:useBattery:progress:then:)((uint64_t)v11, v12, 0, v13, v14, sub_19CDE9048);

  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
}

- (void)cancelDownloadingThen:(id)a3
{
  v4 = _Block_copy(a3);
  _Block_copy(v4);
  id v5 = self;
  sub_19CDE8E1C((uint64_t)v5, (void (**)(void, void))v4);
  _Block_release(v4);
}

- (void)purgeImmediately:(BOOL)a3
{
  objc_super v3 = self;
  TTSAsset.purge(immediately:)(0);
}

- (int64_t)purgeCondition
{
  return 3;
}

- (id)legacyAssetWithBundle:(id)a3
{
  id v4 = a3;
  id v5 = self;
  TTSAsset.legacyAssetWithBundle(_:)(v6, (NSBundle)v4);
  v8 = v7;

  return v8;
}

+ (BOOL)handleProxyEvent:(id)a3 reply:(id)a4 connection:(id)a5
{
  swift_getObjCClassMetadata();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  char v8 = static TTSAsset.handleProxy(event:reply:connection:)(a3, (_xpc_connection_s *)a4, a5);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  return v8 & 1;
}

+ (BOOL)setServer:(id)a3 forType:(id)a4
{
  uint64_t v5 = (uint64_t)a3;
  id v6 = a3;
  id v7 = a4;
  LOBYTE(v5) = static TTSAsset.set(server:forType:)(v5, v7);

  return v5 & 1;
}

+ (BOOL)setServer:(id)a3 forType:(id)a4 source:(id)a5
{
  swift_getObjCClassMetadata();
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  LOBYTE(a4) = static TTSAsset.set(server:forType:source:)((uint64_t)a3, (uint64_t)v9);

  return a4 & 1;
}

+ (id)getServerForType:(id)a3
{
  id v3 = a3;
  id v4 = (void *)static TTSAsset.get(serverForType:)(v3);

  return v4;
}

+ (id)getServerForType:(id)a3 source:(id)a4
{
  swift_getObjCClassMetadata();
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)static TTSAsset.get(serverForType:source:)((uint64_t)v6);

  return v8;
}

+ (id)describeServer:(id)a3 forType:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  static TTSAsset.describe(server:forType:)((uint64_t)v5, v6);

  id v7 = (void *)sub_19CED5230();
  swift_bridgeObjectRelease();
  return v7;
}

+ (id)describeServer:(id)a3 source:(id)a4
{
  swift_getObjCClassMetadata();
  id v6 = a3;
  id v7 = a4;
  static TTSAsset.describe(server:source:)((uint64_t)v6);

  id v8 = (void *)sub_19CED5230();
  swift_bridgeObjectRelease();
  return v8;
}

+ (void)waitForCatalogUpdates
{
}

- (BOOL)isOlder:(id)a3
{
  id v4 = (TTSAsset *)a3;
  id v5 = self;
  LOBYTE(self) = TTSAsset.isOlder(_:)(v4);

  return self & 1;
}

- (BOOL)isNewer:(id)a3
{
  id v4 = (TTSAsset *)a3;
  id v5 = self;
  LOBYTE(self) = TTSAsset.isNewer(_:)(v4);

  return self & 1;
}

- (BOOL)locallyAvailable
{
  v2 = self;
  BOOL v3 = TTSAsset.locallyAvailable.getter();

  return v3;
}

- (BOOL)downloading
{
  return 0;
}

- (BOOL)purgeable
{
  return 1;
}

+ (id)listAssetsOfTypes:(id)a3 matching:(id)a4
{
  sub_19CDB5798(0, (unint64_t *)&qword_1EB534AC0);
  unint64_t v4 = sub_19CED5550();
  uint64_t v5 = sub_19CED5180();
  swift_getObjCClassMetadata();
  static TTSAsset.listAssets(ofTypes:matching:)(v4, v5);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_19CDB5798(0, &qword_1EB534A50);
  id v6 = (void *)sub_19CED5530();
  swift_bridgeObjectRelease();
  return v6;
}

- (id)relatedAssetsWithOnlyAvailable:(BOOL)a3
{
  sub_19CDB5798(0, &qword_1EB534A50);
  BOOL v3 = (void *)sub_19CED5530();
  swift_bridgeObjectRelease();
  return v3;
}

+ (id)bestAssetOfTypes:(id)a3 matching:(id)a4
{
  sub_19CDB5798(0, (unint64_t *)&qword_1EB534AC0);
  unint64_t v4 = sub_19CED5550();
  uint64_t v5 = sub_19CED5180();
  swift_getObjCClassMetadata();
  id v6 = static TTSAsset.bestAsset(ofTypes:matching:)(v4, v5);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v6;
}

- (NSBundle)bundle
{
  return self->_bundle;
}

- (NSDictionary)attributes
{
  return self->_attributes;
}

- (NSNumber)diskSize
{
  return self->_diskSize;
}

- (NSNumber)downloadSize
{
  return self->_downloadSize;
}

- (NSNumber)age
{
  return self->_age;
}

- (int64_t)gender
{
  return self->_gender;
}

- (NSString)primaryLanguage
{
  return self->_primaryLanguage;
}

- (NSArray)supportedLanguages
{
  return self->_supportedLanguages;
}

- (NSString)versionDescription
{
  return self->_versionDescription;
}

- (int64_t)versionNumber
{
  return self->_versionNumber;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)name
{
  return self->_name;
}

- (TTSAssetQuality)quality
{
  return self->_quality;
}

- (TTSAssetTechnology)technology
{
  return self->_technology;
}

- (TTSAssetSource)assetSource
{
  return self->_assetSource;
}

- (TTSAssetType)assetType
{
  return self->_assetType;
}

+ (_NSRange)_gryphonVoiceCompatibility
{
  unsigned int MinCompatibilityVersion = gryphon_GetMinCompatibilityVersion();
  NSUInteger v3 = gryphon_GetCurrentCompatibilityVersion() - MinCompatibilityVersion + 1;
  NSUInteger v4 = MinCompatibilityVersion;
  result.length = v3;
  result.location = v4;
  return result;
}

+ (void)_postNewAssetNotification
{
}

+ (NSString)NewAssetNotification
{
  return (NSString *)@"com.apple.ttsasset.NewAssetNotification";
}

@end