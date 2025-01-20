uint64_t variable initialization expression of WFSetupData.Builder.keyboards()
{
  return 0;
}

uint64_t variable initialization expression of WFSetupData.Builder.appleID()
{
  return 0;
}

uint64_t variable initialization expression of WFSetupData.Builder.usesSameAccountForiTunes()
{
  return 2;
}

uint64_t variable initialization expression of WFSetupData.Builder.isConnectedToWiFi()
{
  return 2;
}

uint64_t variable initialization expression of WFSetupData.Builder.networks()
{
  return 0;
}

uint64_t variable initialization expression of WFSetupData.Builder.networkPasswords()
{
  return 0;
}

uint64_t variable initialization expression of WFSetupData.Builder.localePreferences()
{
  return 0;
}

uint64_t variable initialization expression of WFSetupData.Builder.isAutomaticTimeZoneEnabled()
{
  return 2;
}

uint64_t variable initialization expression of WFSetupData.Builder.timeZone()
{
  return 0;
}

uint64_t variable initialization expression of WFSetupData.Builder.accessibilitySettings()
{
  return 0;
}

uint64_t variable initialization expression of WFSetupData.Builder.firstName()
{
  return 0;
}

uint64_t variable initialization expression of WFSetupData.Builder.deviceModel()
{
  return 0;
}

uint64_t variable initialization expression of WFSetupData.Builder.deviceClass()
{
  return 0;
}

uint64_t variable initialization expression of WFSetupData.Builder.hasHomeButton()
{
  return 2;
}

uint64_t variable initialization expression of WFSetupData.Builder.isRestoring()
{
  return 2;
}

uint64_t variable initialization expression of WFSetupData.Builder.deviceName()
{
  return 0;
}

uint64_t variable initialization expression of WFSetupData.Builder.backupUUID()
{
  return 0;
}

uint64_t variable initialization expression of WFSetupData.Builder.isBackupEnabled()
{
  return 2;
}

uint64_t variable initialization expression of WFSetupData.Builder.isOptedInToLocationServices()
{
  return 2;
}

uint64_t variable initialization expression of WFSetupData.Builder.locationServicesData()
{
  return 0;
}

uint64_t variable initialization expression of WFSetupData.Builder.isOptedInToFindMyDevice()
{
  return 2;
}

uint64_t variable initialization expression of WFSetupData.Builder.isOptedInToAppAnalytics()
{
  return 2;
}

uint64_t variable initialization expression of WFSetupData.Builder.isOptedInToDeviceAnalytics()
{
  return 2;
}

uint64_t variable initialization expression of WFSetupData.Builder.siriAssistantIsEnabled()
{
  return 2;
}

uint64_t variable initialization expression of WFSetupData.Builder.siriVoiceTriggerIsEnabled()
{
  return 2;
}

uint64_t variable initialization expression of WFSetupData.Builder.siriAssistantLanguageCode()
{
  return 0;
}

uint64_t variable initialization expression of WFSetupData.Builder.siriAssistantOutputVoice()
{
  return 0;
}

uint64_t variable initialization expression of WFSetupData.Builder.siriDataSharingIsEnabled()
{
  return 2;
}

uint64_t variable initialization expression of WFSetupData.Builder.dictationIsEnabled()
{
  return 2;
}

uint64_t variable initialization expression of WFSetupData.Builder.suppressDictationOptIn()
{
  return 2;
}

uint64_t variable initialization expression of WFSetupData.Builder.deviceTermsIdentifier()
{
  return 0;
}

uint64_t variable initialization expression of WFSetupData.Builder.productVersion()
{
  return 0;
}

uint64_t variable initialization expression of WFSetupData.Builder.anisetteDataProvider()
{
  return 0;
}

uint64_t variable initialization expression of WFSetupData.Builder.prescriptionRecords()
{
  return 0;
}

uint64_t variable initialization expression of WFSetupData.Builder.walletData()
{
  return 0;
}

uint64_t variable initialization expression of WFSetupData.version()
{
  return 0;
}

double variable initialization expression of PrescriptionRecord.version()
{
  return 1.0;
}

uint64_t variable initialization expression of WFSetupServer.dispatchQueue()
{
  return sub_25E7BC4D0();
}

unint64_t sub_25E778348()
{
  unint64_t result = qword_26A706610;
  if (!qword_26A706610)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26A706610);
  }
  return result;
}

uint64_t variable initialization expression of WFSetupServer.completionHandler()
{
  return 0;
}

uint64_t variable initialization expression of WFSetupServer.activationHandler()
{
  return 0;
}

uint64_t variable initialization expression of WFSetupServer.setupProgressEventHandler()
{
  return 0;
}

uint64_t variable initialization expression of WFSetupServer.userInteractionProgressEventHandler()
{
  return 0;
}

uint64_t variable initialization expression of WFSetupServer.setupPromptPinHandler()
{
  return 0;
}

uint64_t variable initialization expression of WFSetupServer.receivedObjectHandler()
{
  return 0;
}

uint64_t variable initialization expression of WFSetupServer.anisetteDataProvider()
{
  return 0;
}

uint64_t variable initialization expression of WFSetupServer.shouldAdvertiseFast()
{
  return 0;
}

uint64_t variable initialization expression of WFSetupServer.sfService()
{
  return 0;
}

uint64_t variable initialization expression of WFSetupServer.resumeAuthTag()
{
  return 0;
}

uint64_t variable initialization expression of WFSetupServer.peer@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_25E7BC280();
  v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56);
  return v3(a1, 1, 1, v2);
}

uint64_t variable initialization expression of WFSetupServer.sfSession()
{
  return 0;
}

uint64_t variable initialization expression of WFSetupServer.serverState()
{
  return 0;
}

uint64_t __swift_mutable_project_boxed_opaque_existential_1(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0)
  {
    swift_makeBoxUnique();
    return v2;
  }
  return result;
}

uint64_t __swift_destroy_boxed_opaque_existential_1(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t variable initialization expression of WFSetupServer.preventExitForLocaleClient()
{
  return 0;
}

uint64_t variable initialization expression of WFSetupClient.interruptionHandler()
{
  return 0;
}

uint64_t variable initialization expression of WFSetupClient.invalidationHandler()
{
  return 0;
}

uint64_t variable initialization expression of WFSetupClient.peerDevice()
{
  return 0;
}

uint64_t variable initialization expression of WFSetupClient.messageSessionTemplate()
{
  return 0;
}

uint64_t variable initialization expression of WFSetupClient.setupProgressEventHandler()
{
  return 0;
}

uint64_t variable initialization expression of WFSetupClient.userInteractionProgressEventHandler()
{
  return 0;
}

uint64_t variable initialization expression of WFSetupClient.setupSecurePairingCompletionHandler()
{
  return 0;
}

uint64_t variable initialization expression of WFSetupClient.receivedObjectHandler()
{
  return 0;
}

uint64_t variable initialization expression of WFSetupClient.showPinHandler()
{
  return 0;
}

uint64_t variable initialization expression of WFSetupClient.clientState()
{
  return 0;
}

uint64_t _s10TDGSharing13WFSetupServerC16analyticsManager33_0F9370D4A0722B5CE32DB26B8EE7BA1ALLAA09AnalyticsE0Cvpfi_0()
{
  v10 = &type metadata for CoreAnalyticsBackend;
  v11 = &off_270B571A8;
  uint64_t v0 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v9, (uint64_t)&type metadata for CoreAnalyticsBackend);
  uint64_t v1 = MEMORY[0x263F8EE68];
  MEMORY[0x270FA5388](v0, v0);
  uint64_t v2 = *(void (**)(void))(v1 + 16);
  v2();
  v7 = &type metadata for CoreAnalyticsBackend;
  v8 = &off_270B571A8;
  type metadata accessor for AnalyticsManager();
  uint64_t v3 = swift_allocObject();
  uint64_t v4 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v6, (uint64_t)&type metadata for CoreAnalyticsBackend);
  MEMORY[0x270FA5388](v4, v4);
  v2();
  *(void *)(v3 + 40) = &type metadata for CoreAnalyticsBackend;
  *(void *)(v3 + 48) = &off_270B571A8;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v6);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v9);
  return v3;
}

uint64_t variable initialization expression of WFSetupClient.sfSession()
{
  return 0;
}

uint64_t variable initialization expression of WFSetupServerAnisetteDataProvider.session()
{
  return 0;
}

uint64_t variable initialization expression of WFSetupServerAnisetteDataProvider.companionAuthDevice()
{
  return 0;
}

uint64_t variable initialization expression of WFSetupServerAnisetteDataProvider.transportableAuthKitAccount()
{
  return 0;
}

void type metadata accessor for WFSetupServerUserInteractionProgressEvent(uint64_t a1)
{
}

void type metadata accessor for WFSetupClientUserInteractionProgressEvent(uint64_t a1)
{
}

void type metadata accessor for WFSetupProgressEvent(uint64_t a1)
{
}

ValueMetadata *type metadata accessor for CoreAnalyticsBackend()
{
  return &type metadata for CoreAnalyticsBackend;
}

void sub_25E778710(void *a1@<X8>)
{
  *a1 = 0;
}

void *sub_25E778718@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

void type metadata accessor for CFData(uint64_t a1)
{
}

void sub_25E778738(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t WFSetupData.BuildError.errorDescription.getter(char a1)
{
  return 0;
}

uint64_t sub_25E778824()
{
  return WFSetupData.BuildError.errorDescription.getter(*v0);
}

uint64_t WFSetupData.Builder.__allocating_init()()
{
  uint64_t v0 = swift_allocObject();
  WFSetupData.Builder.init()();
  return v0;
}

uint64_t WFSetupData.Builder.init()()
{
  uint64_t v1 = v0;
  *(void *)(v0 + 16) = 0;
  *(void *)(v0 + 24) = 0;
  *(void *)(v0 + 32) = 0;
  *(_WORD *)(v0 + 40) = 514;
  *(void *)(v0 + 56) = 0;
  *(void *)(v0 + 64) = 0;
  *(void *)(v0 + 48) = 0;
  *(unsigned char *)(v0 + 72) = 2;
  *(void *)(v0 + 80) = 0;
  *(void *)(v0 + 88) = 0;
  *(void *)(v0 + 96) = 0;
  *(void *)(v0 + 104) = 0xF000000000000000;
  *(_OWORD *)(v0 + 112) = 0u;
  *(_OWORD *)(v0 + 128) = 0u;
  *(_OWORD *)(v0 + 144) = 0u;
  *(_WORD *)(v0 + 160) = 514;
  *(_OWORD *)(v0 + 184) = 0u;
  *(_OWORD *)(v0 + 168) = 0u;
  *(_WORD *)(v0 + 200) = 514;
  *(_OWORD *)(v0 + 208) = xmmword_25E7BDB10;
  *(_DWORD *)(v0 + 224) = 33686018;
  *(unsigned char *)(v0 + 228) = 2;
  *(void *)(v0 + 240) = 0;
  *(void *)(v0 + 248) = 0;
  *(void *)(v0 + 232) = 0;
  *(_WORD *)(v0 + 256) = 514;
  *(unsigned char *)(v0 + 258) = 2;
  *(void *)(v0 + 264) = 0;
  *(unsigned char *)(v0 + 272) = 1;
  *(_OWORD *)(v0 + 280) = 0u;
  *(_OWORD *)(v0 + 296) = 0u;
  *(void *)(v0 + 312) = 0;
  *(void *)(v0 + 320) = 0xF000000000000000;
  if (qword_26A7065E8 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_25E7BC2E0();
  __swift_project_value_buffer(v2, (uint64_t)qword_26A708A40);
  uint64_t v3 = sub_25E7BC2C0();
  os_log_type_t v4 = sub_25E7BC4A0();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_25E775000, v3, v4, "Initializing WFSetupData.Builder.", v5, 2u);
    MEMORY[0x2611E3480](v5, -1, -1);
  }

  return v1;
}

id WFSetupData.Builder.build()()
{
  int v1 = *(unsigned __int8 *)(v0 + 40);
  if (v1 == 2)
  {
    char v2 = 2;
  }
  else
  {
    int v3 = *(unsigned __int8 *)(v0 + 41);
    if (v3 == 2)
    {
      char v2 = 5;
    }
    else if (*(void *)(v0 + 48))
    {
      if (*(void *)(v0 + 56))
      {
        if (*(void *)(v0 + 64))
        {
          int v4 = *(unsigned __int8 *)(v0 + 72);
          if (v4 == 2)
          {
            char v2 = 7;
          }
          else if (*(void *)(v0 + 88))
          {
            if (*(void *)(v0 + 136))
            {
              if (*(void *)(v0 + 152))
              {
                int v5 = *(unsigned __int8 *)(v0 + 160);
                if (v5 == 2)
                {
                  char v2 = 13;
                }
                else
                {
                  int v6 = *(unsigned __int8 *)(v0 + 161);
                  if (v6 == 2)
                  {
                    char v2 = 14;
                  }
                  else if (*(void *)(v0 + 176))
                  {
                    int v7 = *(unsigned __int8 *)(v0 + 200);
                    if (v7 == 2)
                    {
                      char v2 = 17;
                    }
                    else
                    {
                      int v8 = *(unsigned __int8 *)(v0 + 201);
                      if (v8 == 2)
                      {
                        char v2 = 18;
                      }
                      else
                      {
                        int v9 = *(unsigned __int8 *)(v0 + 224);
                        if (v9 == 2)
                        {
                          char v2 = 20;
                        }
                        else
                        {
                          int v10 = *(unsigned __int8 *)(v0 + 225);
                          if (v10 == 2)
                          {
                            char v2 = 21;
                          }
                          else
                          {
                            uint64_t v55 = *(void *)(v0 + 176);
                            uint64_t v53 = *(void *)(v0 + 136);
                            uint64_t v54 = *(void *)(v0 + 152);
                            uint64_t v51 = *(void *)(v0 + 64);
                            uint64_t v52 = *(void *)(v0 + 88);
                            uint64_t v49 = *(void *)(v0 + 48);
                            uint64_t v50 = *(void *)(v0 + 56);
                            int v11 = *(unsigned __int8 *)(v0 + 226);
                            if (v11 == 2)
                            {
                              char v2 = 22;
                            }
                            else
                            {
                              int v48 = *(unsigned __int8 *)(v0 + 227);
                              if (v48 == 2)
                              {
                                char v2 = 23;
                              }
                              else
                              {
                                int v47 = *(unsigned __int8 *)(v0 + 228);
                                if (v47 == 2)
                                {
                                  char v2 = 24;
                                }
                                else
                                {
                                  int v46 = *(unsigned __int8 *)(v0 + 256);
                                  if (v46 == 2)
                                  {
                                    char v2 = 27;
                                  }
                                  else
                                  {
                                    int v45 = *(unsigned __int8 *)(v0 + 257);
                                    if (v45 == 2)
                                    {
                                      char v2 = 28;
                                    }
                                    else
                                    {
                                      int v44 = *(unsigned __int8 *)(v0 + 258);
                                      if (v44 == 2)
                                      {
                                        char v2 = 29;
                                      }
                                      else if (*(unsigned char *)(v0 + 272))
                                      {
                                        char v2 = 30;
                                      }
                                      else
                                      {
                                        uint64_t v43 = *(void *)(v0 + 288);
                                        if (v43)
                                        {
                                          v40 = *(void **)(v0 + 296);
                                          if (v40)
                                          {
                                            uint64_t v42 = *(void *)(v0 + 304);
                                            if (v42)
                                            {
                                              uint64_t v28 = *(void *)(v0 + 80);
                                              uint64_t v26 = *(void *)(v0 + 128);
                                              uint64_t v21 = *(void *)(v0 + 168);
                                              uint64_t v22 = *(void *)(v0 + 144);
                                              uint64_t v19 = *(void *)(v0 + 280);
                                              uint64_t v20 = *(void *)(v0 + 264);
                                              char v27 = v3 & 1;
                                              char v25 = v1 & 1;
                                              uint64_t v39 = *(void *)(v0 + 16);
                                              uint64_t v24 = *(void *)(v0 + 24);
                                              uint64_t v37 = *(void *)(v0 + 96);
                                              uint64_t v38 = *(void *)(v0 + 32);
                                              unint64_t v36 = *(void *)(v0 + 104);
                                              uint64_t v23 = *(void *)(v0 + 112);
                                              uint64_t v35 = *(void *)(v0 + 120);
                                              uint64_t v18 = *(void *)(v0 + 184);
                                              uint64_t v32 = *(void *)(v0 + 208);
                                              unint64_t v33 = *(void *)(v0 + 216);
                                              uint64_t v34 = *(void *)(v0 + 192);
                                              uint64_t v17 = *(void *)(v0 + 232);
                                              uint64_t v30 = *(void *)(v0 + 240);
                                              v31 = *(void **)(v0 + 248);
                                              uint64_t v12 = *(void *)(v0 + 312);
                                              unint64_t v13 = *(void *)(v0 + 320);
                                              uint64_t v29 = v12;
                                              objc_allocWithZone((Class)type metadata accessor for WFSetupData());
                                              swift_bridgeObjectRetain();
                                              swift_bridgeObjectRetain();
                                              swift_bridgeObjectRetain();
                                              swift_bridgeObjectRetain();
                                              swift_bridgeObjectRetain();
                                              swift_bridgeObjectRetain();
                                              swift_bridgeObjectRetain();
                                              swift_bridgeObjectRetain();
                                              swift_bridgeObjectRetain();
                                              id v41 = v40;
                                              swift_bridgeObjectRetain();
                                              swift_unknownObjectRetain();
                                              sub_25E77CDF8(v37, v36);
                                              swift_bridgeObjectRetain();
                                              swift_bridgeObjectRetain();
                                              sub_25E77CDF8(v32, v33);
                                              id v14 = v31;
                                              swift_bridgeObjectRetain();
                                              sub_25E77CDF8(v29, v13);
                                              return WFSetupData.init(keyboards:appleID:usesSameAccountForiTunes:isConnectedToWiFi:networks:networkPasswords:localePreferences:isAutomaticTimeZoneEnabled:timeZone:accessibilitySettings:firstName:deviceModel:deviceClass:hasHomeButton:isRestoring:deviceName:backupUUID:isBackupEnabled:isOptedInToLocationServices:isOptedInToDeviceAnalytics:locationServicesData:isOptedInToFindMyDevice:isOptedInToAppAnalytics:siriAssistantIsEnabled:siriVoiceTriggerIsEnabled:siriAssistantLanguageCode:siriAssistantOutputVoice:siriDataSharingIsEnabled:dictationIsEnabled:suppressDictationOptIn:deviceTermsIdentifier:productVersion:anisetteDataProvider:prescriptionRecords:walletData:)(v39, v24, v38, v25, v27, v49, v50, v51, v4 & 1, v28, v52, v37, v36, v23, v35, v26, v53, v22, v54,
                                                       v5 & 1,
                                                       v6 & 1,
                                                       v21,
                                                       v55,
                                                       v18,
                                                       v34,
                                                       v7 & 1,
                                                       v8 & 1,
                                                       v11 & 1,
                                                       v32,
                                                       v33,
                                                       v9 & 1,
                                                       v10 & 1,
                                                       v48 & 1,
                                                       v47 & 1,
                                                       v17,
                                                       v30,
                                                       (uint64_t)v31,
                                                       v46 & 1,
                                                       v45 & 1,
                                                       v44 & 1,
                                                       v20,
                                                       v19,
                                                       v43,
                                                       (uint64_t)v41,
                                                       v42,
                                                       v29,
                                                       v13);
                                            }
                                            char v2 = 33;
                                          }
                                          else
                                          {
                                            char v2 = 32;
                                          }
                                        }
                                        else
                                        {
                                          char v2 = 31;
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                  else
                  {
                    char v2 = 15;
                  }
                }
              }
              else
              {
                char v2 = 12;
              }
            }
            else
            {
              char v2 = 11;
            }
          }
          else
          {
            char v2 = 8;
          }
        }
        else
        {
          char v2 = 6;
        }
      }
      else
      {
        char v2 = 4;
      }
    }
    else
    {
      char v2 = 3;
    }
  }
  sub_25E77CDA4();
  swift_allocError();
  char *v16 = v2;
  return (id)swift_willThrow();
}

uint64_t WFSetupData.Builder.setKeyboards(_:)(uint64_t a1)
{
  uint64_t v2 = v1;
  if (qword_26A7065E8 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_25E7BC2E0();
  __swift_project_value_buffer(v4, (uint64_t)qword_26A708A40);
  int v5 = sub_25E7BC2C0();
  os_log_type_t v6 = sub_25E7BC4A0();
  if (os_log_type_enabled(v5, v6))
  {
    int v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)int v7 = 0;
    _os_log_impl(&dword_25E775000, v5, v6, "Set keyboards.", v7, 2u);
    MEMORY[0x2611E3480](v7, -1, -1);
  }

  *(void *)(v2 + 16) = a1;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  return swift_retain();
}

uint64_t WFSetupData.Builder.setAppleID(_:)(uint64_t a1, unint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_25E7BC2E0();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6, v8);
  int v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26A7065E8 != -1) {
    swift_once();
  }
  uint64_t v11 = __swift_project_value_buffer(v6, (uint64_t)qword_26A708A40);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v10, v11, v6);
  swift_bridgeObjectRetain_n();
  uint64_t v12 = sub_25E7BC2C0();
  os_log_type_t v13 = sub_25E7BC4A0();
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v21 = v6;
    id v14 = (uint8_t *)swift_slowAlloc();
    uint64_t v20 = swift_slowAlloc();
    uint64_t v24 = v20;
    *(_DWORD *)id v14 = 136315138;
    if (a2) {
      uint64_t v15 = a1;
    }
    else {
      uint64_t v15 = 7104878;
    }
    uint64_t v22 = a1;
    if (a2) {
      unint64_t v16 = a2;
    }
    else {
      unint64_t v16 = 0xE300000000000000;
    }
    uint64_t v19 = v14 + 4;
    swift_bridgeObjectRetain();
    uint64_t v23 = sub_25E77CF40(v15, v16, &v24);
    sub_25E7BC520();
    swift_bridgeObjectRelease_n();
    a1 = v22;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25E775000, v12, v13, "Set appleID: %s.", v14, 0xCu);
    uint64_t v17 = v20;
    swift_arrayDestroy();
    MEMORY[0x2611E3480](v17, -1, -1);
    MEMORY[0x2611E3480](v14, -1, -1);

    (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v21);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  }
  *(void *)(v3 + 24) = a1;
  *(void *)(v3 + 32) = a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return swift_retain();
}

uint64_t WFSetupData.Builder.setUsesSameAccountForiTunes(_:)(char a1)
{
  uint64_t v2 = v1;
  if (qword_26A7065E8 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_25E7BC2E0();
  __swift_project_value_buffer(v4, (uint64_t)qword_26A708A40);
  int v5 = sub_25E7BC2C0();
  os_log_type_t v6 = sub_25E7BC4A0();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 67109120;
    sub_25E7BC520();
    _os_log_impl(&dword_25E775000, v5, v6, "Set usesSameAccountForiTunes: %{BOOL}d.", v7, 8u);
    MEMORY[0x2611E3480](v7, -1, -1);
  }

  *(unsigned char *)(v2 + 40) = a1 & 1;
  return swift_retain();
}

uint64_t WFSetupData.Builder.setIsConnectedToWiFi(_:)(char a1)
{
  uint64_t v2 = v1;
  if (qword_26A7065E8 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_25E7BC2E0();
  __swift_project_value_buffer(v4, (uint64_t)qword_26A708A40);
  int v5 = sub_25E7BC2C0();
  os_log_type_t v6 = sub_25E7BC4A0();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 67109120;
    sub_25E7BC520();
    _os_log_impl(&dword_25E775000, v5, v6, "Set isConnectedToWiFi: %{BOOL}d.", v7, 8u);
    MEMORY[0x2611E3480](v7, -1, -1);
  }

  *(unsigned char *)(v2 + 41) = a1 & 1;
  return swift_retain();
}

uint64_t WFSetupData.Builder.setNetworks(_:)(uint64_t a1)
{
  uint64_t v2 = v1;
  if (qword_26A7065E8 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_25E7BC2E0();
  __swift_project_value_buffer(v4, (uint64_t)qword_26A708A40);
  swift_bridgeObjectRetain_n();
  int v5 = sub_25E7BC2C0();
  os_log_type_t v6 = sub_25E7BC4A0();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v8 = swift_slowAlloc();
    uint64_t v15 = v8;
    *(_DWORD *)uint64_t v7 = 136315138;
    unint64_t v9 = sub_25E77D6D0();
    uint64_t v10 = swift_bridgeObjectRetain();
    uint64_t v11 = MEMORY[0x2611E2B20](v10, v9);
    unint64_t v13 = v12;
    swift_bridgeObjectRelease();
    sub_25E77CF40(v11, v13, &v15);
    sub_25E7BC520();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25E775000, v5, v6, "Set networks: %s.", v7, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2611E3480](v8, -1, -1);
    MEMORY[0x2611E3480](v7, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  *(void *)(v2 + 48) = a1;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return swift_retain();
}

uint64_t WFSetupData.Builder.setNetworkPasswords(_:)(uint64_t a1)
{
  uint64_t v2 = v1;
  if (qword_26A7065E8 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_25E7BC2E0();
  __swift_project_value_buffer(v4, (uint64_t)qword_26A708A40);
  int v5 = sub_25E7BC2C0();
  os_log_type_t v6 = sub_25E7BC4A0();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl(&dword_25E775000, v5, v6, "Set networkPasswords", v7, 2u);
    MEMORY[0x2611E3480](v7, -1, -1);
  }

  *(void *)(v2 + 56) = a1;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return swift_retain();
}

uint64_t WFSetupData.Builder.setLocalePreferences(_:)(uint64_t a1)
{
  uint64_t v2 = v1;
  if (qword_26A7065E8 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_25E7BC2E0();
  __swift_project_value_buffer(v4, (uint64_t)qword_26A708A40);
  swift_bridgeObjectRetain_n();
  int v5 = sub_25E7BC2C0();
  os_log_type_t v6 = sub_25E7BC4A0();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v8 = swift_slowAlloc();
    uint64_t v13 = v8;
    *(_DWORD *)uint64_t v7 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_25E7BC3A0();
    unint64_t v11 = v10;
    swift_bridgeObjectRelease();
    sub_25E77CF40(v9, v11, &v13);
    sub_25E7BC520();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25E775000, v5, v6, "Set localePreferences: %s.", v7, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2611E3480](v8, -1, -1);
    MEMORY[0x2611E3480](v7, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  *(void *)(v2 + 64) = a1;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return swift_retain();
}

uint64_t WFSetupData.Builder.setIsAutomaticTimeZoneEnabled(_:)(char a1)
{
  uint64_t v2 = v1;
  if (qword_26A7065E8 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_25E7BC2E0();
  __swift_project_value_buffer(v4, (uint64_t)qword_26A708A40);
  int v5 = sub_25E7BC2C0();
  os_log_type_t v6 = sub_25E7BC4A0();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 67109120;
    sub_25E7BC520();
    _os_log_impl(&dword_25E775000, v5, v6, "Set isAutomaticTimeZoneEnabled: %{BOOL}d.", v7, 8u);
    MEMORY[0x2611E3480](v7, -1, -1);
  }

  *(unsigned char *)(v2 + 72) = a1 & 1;
  return swift_retain();
}

uint64_t WFSetupData.Builder.setTimeZone(_:)(uint64_t a1, unint64_t a2)
{
  uint64_t v3 = v2;
  if (qword_26A7065E8 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_25E7BC2E0();
  __swift_project_value_buffer(v6, (uint64_t)qword_26A708A40);
  swift_bridgeObjectRetain_n();
  uint64_t v7 = sub_25E7BC2C0();
  os_log_type_t v8 = sub_25E7BC4A0();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    uint64_t v10 = swift_slowAlloc();
    uint64_t v12 = v10;
    *(_DWORD *)uint64_t v9 = 136315138;
    swift_bridgeObjectRetain();
    sub_25E77CF40(a1, a2, &v12);
    sub_25E7BC520();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_25E775000, v7, v8, "Set timeZone: %s.", v9, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2611E3480](v10, -1, -1);
    MEMORY[0x2611E3480](v9, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  *(void *)(v3 + 80) = a1;
  *(void *)(v3 + 88) = a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return swift_retain();
}

uint64_t WFSetupData.Builder.setAccessibilitySettings(_:)(uint64_t a1, unint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_25E7BC2E0();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6, v8);
  uint64_t v10 = (char *)&v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26A7065E8 != -1) {
    swift_once();
  }
  uint64_t v11 = __swift_project_value_buffer(v6, (uint64_t)qword_26A708A40);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v10, v11, v6);
  sub_25E77CDF8(a1, a2);
  sub_25E77CDF8(a1, a2);
  uint64_t v12 = sub_25E7BC2C0();
  os_log_type_t v13 = sub_25E7BC4A0();
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v26 = v6;
    uint64_t v14 = swift_slowAlloc();
    uint64_t v25 = v7;
    uint64_t v15 = (uint8_t *)v14;
    uint64_t v16 = swift_slowAlloc();
    uint64_t v24 = v16;
    *(_DWORD *)uint64_t v15 = 136315138;
    uint64_t v28 = v16;
    if (a2 >> 60 == 15) {
      uint64_t v17 = 7104878;
    }
    else {
      uint64_t v17 = 0x3E617461443CLL;
    }
    if (a2 >> 60 == 15) {
      unint64_t v18 = 0xE300000000000000;
    }
    else {
      unint64_t v18 = 0xE600000000000000;
    }
    uint64_t v27 = sub_25E77CF40(v17, v18, &v28);
    sub_25E7BC520();
    swift_bridgeObjectRelease();
    sub_25E77D710(a1, a2);
    sub_25E77D710(a1, a2);
    _os_log_impl(&dword_25E775000, v12, v13, "Set accessibilitySettings: %s.", v15, 0xCu);
    uint64_t v19 = v24;
    swift_arrayDestroy();
    MEMORY[0x2611E3480](v19, -1, -1);
    MEMORY[0x2611E3480](v15, -1, -1);

    (*(void (**)(char *, uint64_t))(v25 + 8))(v10, v26);
  }
  else
  {
    sub_25E77D710(a1, a2);
    sub_25E77D710(a1, a2);

    (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  }
  uint64_t v20 = *(void *)(v3 + 96);
  unint64_t v21 = *(void *)(v3 + 104);
  *(void *)(v3 + 96) = a1;
  *(void *)(v3 + 104) = a2;
  sub_25E77CDF8(a1, a2);
  sub_25E77D710(v20, v21);
  return swift_retain();
}

uint64_t WFSetupData.Builder.setFirstName(_:)(uint64_t a1, unint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_25E7BC2E0();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6, v8);
  uint64_t v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26A7065E8 != -1) {
    swift_once();
  }
  uint64_t v11 = __swift_project_value_buffer(v6, (uint64_t)qword_26A708A40);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v10, v11, v6);
  swift_bridgeObjectRetain_n();
  uint64_t v12 = sub_25E7BC2C0();
  os_log_type_t v13 = sub_25E7BC4A0();
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v21 = v6;
    uint64_t v14 = (uint8_t *)swift_slowAlloc();
    uint64_t v20 = swift_slowAlloc();
    uint64_t v24 = v20;
    *(_DWORD *)uint64_t v14 = 136315138;
    if (a2) {
      uint64_t v15 = a1;
    }
    else {
      uint64_t v15 = 7104878;
    }
    uint64_t v22 = a1;
    if (a2) {
      unint64_t v16 = a2;
    }
    else {
      unint64_t v16 = 0xE300000000000000;
    }
    uint64_t v19 = v14 + 4;
    swift_bridgeObjectRetain();
    uint64_t v23 = sub_25E77CF40(v15, v16, &v24);
    sub_25E7BC520();
    swift_bridgeObjectRelease_n();
    a1 = v22;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25E775000, v12, v13, "Set firstName: %s.", v14, 0xCu);
    uint64_t v17 = v20;
    swift_arrayDestroy();
    MEMORY[0x2611E3480](v17, -1, -1);
    MEMORY[0x2611E3480](v14, -1, -1);

    (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v21);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  }
  *(void *)(v3 + 112) = a1;
  *(void *)(v3 + 120) = a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return swift_retain();
}

uint64_t WFSetupData.Builder.setDeviceModel(_:)(uint64_t a1, unint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_25E7BC2E0();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6, v8);
  uint64_t v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26A7065E8 != -1) {
    swift_once();
  }
  uint64_t v11 = __swift_project_value_buffer(v6, (uint64_t)qword_26A708A40);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v10, v11, v6);
  swift_bridgeObjectRetain_n();
  uint64_t v12 = sub_25E7BC2C0();
  os_log_type_t v13 = sub_25E7BC4A0();
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v21 = v6;
    uint64_t v14 = (uint8_t *)swift_slowAlloc();
    uint64_t v20 = swift_slowAlloc();
    uint64_t v24 = v20;
    *(_DWORD *)uint64_t v14 = 136315138;
    if (a2) {
      uint64_t v15 = a1;
    }
    else {
      uint64_t v15 = 7104878;
    }
    uint64_t v22 = a1;
    if (a2) {
      unint64_t v16 = a2;
    }
    else {
      unint64_t v16 = 0xE300000000000000;
    }
    uint64_t v19 = v14 + 4;
    swift_bridgeObjectRetain();
    uint64_t v23 = sub_25E77CF40(v15, v16, &v24);
    sub_25E7BC520();
    swift_bridgeObjectRelease_n();
    a1 = v22;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25E775000, v12, v13, "Set deviceModel: %s.", v14, 0xCu);
    uint64_t v17 = v20;
    swift_arrayDestroy();
    MEMORY[0x2611E3480](v17, -1, -1);
    MEMORY[0x2611E3480](v14, -1, -1);

    (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v21);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  }
  *(void *)(v3 + 128) = a1;
  *(void *)(v3 + 136) = a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return swift_retain();
}

uint64_t WFSetupData.Builder.setDeviceClass(_:)(uint64_t a1, unint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_25E7BC2E0();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6, v8);
  uint64_t v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26A7065E8 != -1) {
    swift_once();
  }
  uint64_t v11 = __swift_project_value_buffer(v6, (uint64_t)qword_26A708A40);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v10, v11, v6);
  swift_bridgeObjectRetain_n();
  uint64_t v12 = sub_25E7BC2C0();
  os_log_type_t v13 = sub_25E7BC4A0();
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v21 = v6;
    uint64_t v14 = (uint8_t *)swift_slowAlloc();
    uint64_t v20 = swift_slowAlloc();
    uint64_t v24 = v20;
    *(_DWORD *)uint64_t v14 = 136315138;
    if (a2) {
      uint64_t v15 = a1;
    }
    else {
      uint64_t v15 = 7104878;
    }
    uint64_t v22 = a1;
    if (a2) {
      unint64_t v16 = a2;
    }
    else {
      unint64_t v16 = 0xE300000000000000;
    }
    uint64_t v19 = v14 + 4;
    swift_bridgeObjectRetain();
    uint64_t v23 = sub_25E77CF40(v15, v16, &v24);
    sub_25E7BC520();
    swift_bridgeObjectRelease_n();
    a1 = v22;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25E775000, v12, v13, "Set deviceClass: %s.", v14, 0xCu);
    uint64_t v17 = v20;
    swift_arrayDestroy();
    MEMORY[0x2611E3480](v17, -1, -1);
    MEMORY[0x2611E3480](v14, -1, -1);

    (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v21);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  }
  *(void *)(v3 + 144) = a1;
  *(void *)(v3 + 152) = a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return swift_retain();
}

uint64_t WFSetupData.Builder.setHasHomeButton(_:)(char a1)
{
  uint64_t v2 = v1;
  if (qword_26A7065E8 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_25E7BC2E0();
  __swift_project_value_buffer(v4, (uint64_t)qword_26A708A40);
  int v5 = sub_25E7BC2C0();
  os_log_type_t v6 = sub_25E7BC4A0();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 67109120;
    sub_25E7BC520();
    _os_log_impl(&dword_25E775000, v5, v6, "Set hasHomeButton: %{BOOL}d.", v7, 8u);
    MEMORY[0x2611E3480](v7, -1, -1);
  }

  *(unsigned char *)(v2 + 160) = a1 & 1;
  return swift_retain();
}

uint64_t WFSetupData.Builder.setIsRestoring(_:)(char a1)
{
  uint64_t v2 = v1;
  if (qword_26A7065E8 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_25E7BC2E0();
  __swift_project_value_buffer(v4, (uint64_t)qword_26A708A40);
  int v5 = sub_25E7BC2C0();
  os_log_type_t v6 = sub_25E7BC4A0();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 67109120;
    sub_25E7BC520();
    _os_log_impl(&dword_25E775000, v5, v6, "Set isRestoring: %{BOOL}d.", v7, 8u);
    MEMORY[0x2611E3480](v7, -1, -1);
  }

  *(unsigned char *)(v2 + 161) = a1 & 1;
  return swift_retain();
}

uint64_t WFSetupData.Builder.setDeviceName(_:)(uint64_t a1, unint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_25E7BC2E0();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6, v8);
  uint64_t v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26A7065E8 != -1) {
    swift_once();
  }
  uint64_t v11 = __swift_project_value_buffer(v6, (uint64_t)qword_26A708A40);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v10, v11, v6);
  swift_bridgeObjectRetain_n();
  uint64_t v12 = sub_25E7BC2C0();
  os_log_type_t v13 = sub_25E7BC4A0();
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v21 = v6;
    uint64_t v14 = (uint8_t *)swift_slowAlloc();
    uint64_t v20 = swift_slowAlloc();
    uint64_t v24 = v20;
    *(_DWORD *)uint64_t v14 = 136315138;
    if (a2) {
      uint64_t v15 = a1;
    }
    else {
      uint64_t v15 = 7104878;
    }
    uint64_t v22 = a1;
    if (a2) {
      unint64_t v16 = a2;
    }
    else {
      unint64_t v16 = 0xE300000000000000;
    }
    uint64_t v19 = v14 + 4;
    swift_bridgeObjectRetain();
    uint64_t v23 = sub_25E77CF40(v15, v16, &v24);
    sub_25E7BC520();
    swift_bridgeObjectRelease_n();
    a1 = v22;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25E775000, v12, v13, "Set deviceName: %s.", v14, 0xCu);
    uint64_t v17 = v20;
    swift_arrayDestroy();
    MEMORY[0x2611E3480](v17, -1, -1);
    MEMORY[0x2611E3480](v14, -1, -1);

    (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v21);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  }
  *(void *)(v3 + 168) = a1;
  *(void *)(v3 + 176) = a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return swift_retain();
}

uint64_t WFSetupData.Builder.setBackupUUID(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  if (qword_26A7065E8 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_25E7BC2E0();
  __swift_project_value_buffer(v6, (uint64_t)qword_26A708A40);
  swift_bridgeObjectRetain_n();
  uint64_t v7 = sub_25E7BC2C0();
  os_log_type_t v8 = sub_25E7BC4A0();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    uint64_t v10 = swift_slowAlloc();
    uint64_t v14 = v10;
    *(_DWORD *)uint64_t v9 = 136315138;
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A706640);
    uint64_t v11 = sub_25E7BC3F0();
    sub_25E77CF40(v11, v12, &v14);
    sub_25E7BC520();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25E775000, v7, v8, "Set backupUUID: %s.", v9, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2611E3480](v10, -1, -1);
    MEMORY[0x2611E3480](v9, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  *(void *)(v3 + 184) = a1;
  *(void *)(v3 + 192) = a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return swift_retain();
}

uint64_t WFSetupData.Builder.setIsBackupEnabled(_:)(char a1)
{
  uint64_t v2 = v1;
  if (qword_26A7065E8 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_25E7BC2E0();
  __swift_project_value_buffer(v4, (uint64_t)qword_26A708A40);
  int v5 = sub_25E7BC2C0();
  os_log_type_t v6 = sub_25E7BC4A0();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 67109120;
    sub_25E7BC520();
    _os_log_impl(&dword_25E775000, v5, v6, "Set isBackupEnabled: %{BOOL}d.", v7, 8u);
    MEMORY[0x2611E3480](v7, -1, -1);
  }

  *(unsigned char *)(v2 + 200) = a1 & 1;
  return swift_retain();
}

uint64_t WFSetupData.Builder.setIsOptedInToLocationServices(_:)(char a1)
{
  uint64_t v2 = v1;
  if (qword_26A7065E8 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_25E7BC2E0();
  __swift_project_value_buffer(v4, (uint64_t)qword_26A708A40);
  int v5 = sub_25E7BC2C0();
  os_log_type_t v6 = sub_25E7BC4A0();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 67109120;
    sub_25E7BC520();
    _os_log_impl(&dword_25E775000, v5, v6, "Set isOptedInToLocationServices: %{BOOL}d.", v7, 8u);
    MEMORY[0x2611E3480](v7, -1, -1);
  }

  *(unsigned char *)(v2 + 201) = a1 & 1;
  return swift_retain();
}

uint64_t WFSetupData.Builder.setLocationServicesData(_:)(uint64_t a1, unint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_25E7BC2E0();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6, v8);
  uint64_t v10 = (char *)&v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26A7065E8 != -1) {
    swift_once();
  }
  uint64_t v11 = __swift_project_value_buffer(v6, (uint64_t)qword_26A708A40);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v10, v11, v6);
  sub_25E77CDF8(a1, a2);
  sub_25E77CDF8(a1, a2);
  unint64_t v12 = sub_25E7BC2C0();
  os_log_type_t v13 = sub_25E7BC4A0();
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v26 = v6;
    uint64_t v14 = swift_slowAlloc();
    uint64_t v25 = v7;
    uint64_t v15 = (uint8_t *)v14;
    uint64_t v16 = swift_slowAlloc();
    uint64_t v24 = v16;
    *(_DWORD *)uint64_t v15 = 136315138;
    uint64_t v28 = v16;
    if (a2 >> 60 == 15) {
      uint64_t v17 = 7104878;
    }
    else {
      uint64_t v17 = 0x3E617461443CLL;
    }
    if (a2 >> 60 == 15) {
      unint64_t v18 = 0xE300000000000000;
    }
    else {
      unint64_t v18 = 0xE600000000000000;
    }
    uint64_t v27 = sub_25E77CF40(v17, v18, &v28);
    sub_25E7BC520();
    swift_bridgeObjectRelease();
    sub_25E77D710(a1, a2);
    sub_25E77D710(a1, a2);
    _os_log_impl(&dword_25E775000, v12, v13, "Set locationServicesData: %s.", v15, 0xCu);
    uint64_t v19 = v24;
    swift_arrayDestroy();
    MEMORY[0x2611E3480](v19, -1, -1);
    MEMORY[0x2611E3480](v15, -1, -1);

    (*(void (**)(char *, uint64_t))(v25 + 8))(v10, v26);
  }
  else
  {
    sub_25E77D710(a1, a2);
    sub_25E77D710(a1, a2);

    (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  }
  uint64_t v20 = *(void *)(v3 + 208);
  unint64_t v21 = *(void *)(v3 + 216);
  *(void *)(v3 + 208) = a1;
  *(void *)(v3 + 216) = a2;
  sub_25E77CDF8(a1, a2);
  sub_25E77D710(v20, v21);
  return swift_retain();
}

uint64_t WFSetupData.Builder.setIsOptedInToFindMyDevice(_:)(char a1)
{
  uint64_t v2 = v1;
  if (qword_26A7065E8 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_25E7BC2E0();
  __swift_project_value_buffer(v4, (uint64_t)qword_26A708A40);
  int v5 = sub_25E7BC2C0();
  os_log_type_t v6 = sub_25E7BC4A0();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 67109120;
    sub_25E7BC520();
    _os_log_impl(&dword_25E775000, v5, v6, "Set isOptedInToFindMyDevice: %{BOOL}d.", v7, 8u);
    MEMORY[0x2611E3480](v7, -1, -1);
  }

  *(unsigned char *)(v2 + 224) = a1 & 1;
  return swift_retain();
}

uint64_t WFSetupData.Builder.setIsOptedInToDeviceAnalytics(_:)(char a1)
{
  uint64_t v2 = v1;
  if (qword_26A7065E8 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_25E7BC2E0();
  __swift_project_value_buffer(v4, (uint64_t)qword_26A708A40);
  int v5 = sub_25E7BC2C0();
  os_log_type_t v6 = sub_25E7BC4A0();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 67109120;
    sub_25E7BC520();
    _os_log_impl(&dword_25E775000, v5, v6, "Set isOptedInToDeviceAnalytics: %{BOOL}d.", v7, 8u);
    MEMORY[0x2611E3480](v7, -1, -1);
  }

  *(unsigned char *)(v2 + 226) = a1 & 1;
  return swift_retain();
}

uint64_t WFSetupData.Builder.setIsOptedInToAppAnalytics(_:)(char a1)
{
  uint64_t v2 = v1;
  if (qword_26A7065E8 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_25E7BC2E0();
  __swift_project_value_buffer(v4, (uint64_t)qword_26A708A40);
  int v5 = sub_25E7BC2C0();
  os_log_type_t v6 = sub_25E7BC4A0();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 67109120;
    sub_25E7BC520();
    _os_log_impl(&dword_25E775000, v5, v6, "Set isOptedInToAppAnalytics: %{BOOL}d.", v7, 8u);
    MEMORY[0x2611E3480](v7, -1, -1);
  }

  *(unsigned char *)(v2 + 225) = a1 & 1;
  return swift_retain();
}

uint64_t WFSetupData.Builder.setSiriAssistantIsEnabled(_:)(char a1)
{
  uint64_t v2 = v1;
  if (qword_26A7065E8 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_25E7BC2E0();
  __swift_project_value_buffer(v4, (uint64_t)qword_26A708A40);
  int v5 = sub_25E7BC2C0();
  os_log_type_t v6 = sub_25E7BC4A0();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 67109120;
    sub_25E7BC520();
    _os_log_impl(&dword_25E775000, v5, v6, "Set siriAssistantIsEnabled: %{BOOL}d.", v7, 8u);
    MEMORY[0x2611E3480](v7, -1, -1);
  }

  *(unsigned char *)(v2 + 227) = a1 & 1;
  return swift_retain();
}

uint64_t WFSetupData.Builder.setSiriVoiceTriggerIsEnabled(_:)(char a1)
{
  uint64_t v2 = v1;
  if (qword_26A7065E8 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_25E7BC2E0();
  __swift_project_value_buffer(v4, (uint64_t)qword_26A708A40);
  int v5 = sub_25E7BC2C0();
  os_log_type_t v6 = sub_25E7BC4A0();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 67109120;
    sub_25E7BC520();
    _os_log_impl(&dword_25E775000, v5, v6, "Set siriVoiceTriggerIsEnabled: %{BOOL}d.", v7, 8u);
    MEMORY[0x2611E3480](v7, -1, -1);
  }

  *(unsigned char *)(v2 + 228) = a1 & 1;
  return swift_retain();
}

uint64_t WFSetupData.Builder.setSiriAssistantLanguageCode(_:)(uint64_t a1, unint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_25E7BC2E0();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6, v8);
  uint64_t v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26A7065E8 != -1) {
    swift_once();
  }
  uint64_t v11 = __swift_project_value_buffer(v6, (uint64_t)qword_26A708A40);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v10, v11, v6);
  swift_bridgeObjectRetain_n();
  unint64_t v12 = sub_25E7BC2C0();
  os_log_type_t v13 = sub_25E7BC4A0();
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v21 = v6;
    uint64_t v14 = (uint8_t *)swift_slowAlloc();
    uint64_t v20 = swift_slowAlloc();
    uint64_t v24 = v20;
    *(_DWORD *)uint64_t v14 = 136315138;
    if (a2) {
      uint64_t v15 = a1;
    }
    else {
      uint64_t v15 = 7104878;
    }
    uint64_t v22 = a1;
    if (a2) {
      unint64_t v16 = a2;
    }
    else {
      unint64_t v16 = 0xE300000000000000;
    }
    uint64_t v19 = v14 + 4;
    swift_bridgeObjectRetain();
    uint64_t v23 = sub_25E77CF40(v15, v16, &v24);
    sub_25E7BC520();
    swift_bridgeObjectRelease_n();
    a1 = v22;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25E775000, v12, v13, "Set siriAssistantLanguageCode: %s.", v14, 0xCu);
    uint64_t v17 = v20;
    swift_arrayDestroy();
    MEMORY[0x2611E3480](v17, -1, -1);
    MEMORY[0x2611E3480](v14, -1, -1);

    (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v21);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  }
  *(void *)(v3 + 232) = a1;
  *(void *)(v3 + 240) = a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return swift_retain();
}

uint64_t WFSetupData.Builder.setSiriAssistantOutputVoice(_:)(void *a1)
{
  uint64_t v2 = v1;
  if (qword_26A7065E8 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_25E7BC2E0();
  __swift_project_value_buffer(v4, (uint64_t)qword_26A708A40);
  id v5 = a1;
  uint64_t v6 = sub_25E7BC2C0();
  os_log_type_t v7 = sub_25E7BC4A0();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    uint64_t v9 = swift_slowAlloc();
    uint64_t v17 = v9;
    *(_DWORD *)uint64_t v8 = 136315138;
    unint64_t v16 = a1;
    id v10 = v5;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A706648);
    uint64_t v11 = sub_25E7BC3F0();
    sub_25E77CF40(v11, v12, &v17);
    sub_25E7BC520();

    a1 = v16;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25E775000, v6, v7, "Set siriAssistantOutputVoice: %s.", v8, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2611E3480](v9, -1, -1);
    MEMORY[0x2611E3480](v8, -1, -1);
  }
  else
  {
  }
  os_log_type_t v13 = *(void **)(v2 + 248);
  *(void *)(v2 + 248) = a1;
  id v14 = v5;

  return swift_retain();
}

uint64_t WFSetupData.Builder.setSiriDataSharingIsEnabled(_:)(char a1)
{
  uint64_t v2 = v1;
  if (qword_26A7065E8 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_25E7BC2E0();
  __swift_project_value_buffer(v4, (uint64_t)qword_26A708A40);
  id v5 = sub_25E7BC2C0();
  os_log_type_t v6 = sub_25E7BC4A0();
  if (os_log_type_enabled(v5, v6))
  {
    os_log_type_t v7 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)os_log_type_t v7 = 67109120;
    sub_25E7BC520();
    _os_log_impl(&dword_25E775000, v5, v6, "Set siriDataSharingIsEnabled: %{BOOL}d.", v7, 8u);
    MEMORY[0x2611E3480](v7, -1, -1);
  }

  *(unsigned char *)(v2 + 256) = a1 & 1;
  return swift_retain();
}

uint64_t WFSetupData.Builder.setDictationIsEnabled(_:)(char a1)
{
  uint64_t v2 = v1;
  if (qword_26A7065E8 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_25E7BC2E0();
  __swift_project_value_buffer(v4, (uint64_t)qword_26A708A40);
  id v5 = sub_25E7BC2C0();
  os_log_type_t v6 = sub_25E7BC4A0();
  if (os_log_type_enabled(v5, v6))
  {
    os_log_type_t v7 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)os_log_type_t v7 = 67109120;
    sub_25E7BC520();
    _os_log_impl(&dword_25E775000, v5, v6, "Set dictationIsEnabled: %{BOOL}d.", v7, 8u);
    MEMORY[0x2611E3480](v7, -1, -1);
  }

  *(unsigned char *)(v2 + 257) = a1 & 1;
  return swift_retain();
}

uint64_t WFSetupData.Builder.setSuppressDictationOptIn(_:)(char a1)
{
  uint64_t v2 = v1;
  if (qword_26A7065E8 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_25E7BC2E0();
  __swift_project_value_buffer(v4, (uint64_t)qword_26A708A40);
  id v5 = sub_25E7BC2C0();
  os_log_type_t v6 = sub_25E7BC4A0();
  if (os_log_type_enabled(v5, v6))
  {
    os_log_type_t v7 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)os_log_type_t v7 = 67109120;
    sub_25E7BC520();
    _os_log_impl(&dword_25E775000, v5, v6, "Set suppressDictationOptIn: %{BOOL}d.", v7, 8u);
    MEMORY[0x2611E3480](v7, -1, -1);
  }

  *(unsigned char *)(v2 + 258) = a1 & 1;
  return swift_retain();
}

uint64_t WFSetupData.Builder.setDeviceTermsIdentifier(_:)(uint64_t a1)
{
  uint64_t v2 = v1;
  if (qword_26A7065E8 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_25E7BC2E0();
  __swift_project_value_buffer(v4, (uint64_t)qword_26A708A40);
  id v5 = sub_25E7BC2C0();
  os_log_type_t v6 = sub_25E7BC4A0();
  if (os_log_type_enabled(v5, v6))
  {
    os_log_type_t v7 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)os_log_type_t v7 = 134217984;
    sub_25E7BC520();
    _os_log_impl(&dword_25E775000, v5, v6, "Set deviceTermsIdentifier: %ld.", v7, 0xCu);
    MEMORY[0x2611E3480](v7, -1, -1);
  }

  *(void *)(v2 + 264) = a1;
  *(unsigned char *)(v2 + 272) = 0;
  return swift_retain();
}

uint64_t WFSetupData.Builder.setProductVersion(_:)(uint64_t a1, unint64_t a2)
{
  uint64_t v3 = v2;
  if (qword_26A7065E8 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_25E7BC2E0();
  __swift_project_value_buffer(v6, (uint64_t)qword_26A708A40);
  swift_bridgeObjectRetain_n();
  os_log_type_t v7 = sub_25E7BC2C0();
  os_log_type_t v8 = sub_25E7BC4A0();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    uint64_t v10 = swift_slowAlloc();
    uint64_t v12 = v10;
    *(_DWORD *)uint64_t v9 = 136315138;
    swift_bridgeObjectRetain();
    sub_25E77CF40(a1, a2, &v12);
    sub_25E7BC520();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_25E775000, v7, v8, "Set productVersion: %s.", v9, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2611E3480](v10, -1, -1);
    MEMORY[0x2611E3480](v9, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  *(void *)(v3 + 280) = a1;
  *(void *)(v3 + 288) = a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return swift_retain();
}

uint64_t WFSetupData.Builder.setAnisetteDataProvider(_:)(void *a1)
{
  uint64_t v2 = v1;
  if (qword_26A7065E8 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_25E7BC2E0();
  __swift_project_value_buffer(v4, (uint64_t)qword_26A708A40);
  id v5 = a1;
  uint64_t v6 = sub_25E7BC2C0();
  os_log_type_t v7 = sub_25E7BC4A0();
  if (os_log_type_enabled(v6, v7))
  {
    os_log_type_t v8 = (uint8_t *)swift_slowAlloc();
    uint64_t v9 = swift_slowAlloc();
    uint64_t v17 = v9;
    *(_DWORD *)os_log_type_t v8 = 136315138;
    id v10 = objc_msgSend(v5, sel_description);
    uint64_t v11 = sub_25E7BC3E0();
    unint64_t v13 = v12;

    sub_25E77CF40(v11, v13, &v17);
    sub_25E7BC520();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25E775000, v6, v7, "Set anisetteDataProvider: %s.", v8, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2611E3480](v9, -1, -1);
    MEMORY[0x2611E3480](v8, -1, -1);
  }
  else
  {
  }
  id v14 = *(void **)(v2 + 296);
  *(void *)(v2 + 296) = v5;
  id v15 = v5;

  return swift_retain();
}

uint64_t WFSetupData.Builder.setPrescriptionRecords(_:)(uint64_t a1)
{
  uint64_t v2 = v1;
  if (qword_26A7065E8 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_25E7BC2E0();
  __swift_project_value_buffer(v4, (uint64_t)qword_26A708A40);
  swift_bridgeObjectRetain_n();
  id v5 = sub_25E7BC2C0();
  os_log_type_t v6 = sub_25E7BC4A0();
  if (os_log_type_enabled(v5, v6))
  {
    os_log_type_t v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v8 = swift_slowAlloc();
    uint64_t v13 = v8;
    *(_DWORD *)os_log_type_t v7 = 136315138;
    uint64_t v9 = type metadata accessor for PrescriptionRecord();
    uint64_t v10 = MEMORY[0x2611E2B30](a1, v9);
    sub_25E77CF40(v10, v11, &v13);
    sub_25E7BC520();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25E775000, v5, v6, "Set prescription records: %s.", v7, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2611E3480](v8, -1, -1);
    MEMORY[0x2611E3480](v7, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  *(void *)(v2 + 304) = a1;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return swift_retain();
}

uint64_t WFSetupData.Builder.setWalletData(_:)(uint64_t a1, unint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_25E7BC2E0();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6, v8);
  uint64_t v10 = (char *)&v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26A7065E8 != -1) {
    swift_once();
  }
  uint64_t v11 = __swift_project_value_buffer(v6, (uint64_t)qword_26A708A40);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v10, v11, v6);
  sub_25E77CDF8(a1, a2);
  sub_25E77CDF8(a1, a2);
  unint64_t v12 = sub_25E7BC2C0();
  os_log_type_t v13 = sub_25E7BC4A0();
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v26 = v6;
    uint64_t v14 = swift_slowAlloc();
    uint64_t v25 = v7;
    id v15 = (uint8_t *)v14;
    uint64_t v16 = swift_slowAlloc();
    uint64_t v24 = v16;
    *(_DWORD *)id v15 = 136315138;
    uint64_t v28 = v16;
    if (a2 >> 60 == 15) {
      uint64_t v17 = 7104878;
    }
    else {
      uint64_t v17 = 0x3E617461443CLL;
    }
    if (a2 >> 60 == 15) {
      unint64_t v18 = 0xE300000000000000;
    }
    else {
      unint64_t v18 = 0xE600000000000000;
    }
    uint64_t v27 = sub_25E77CF40(v17, v18, &v28);
    sub_25E7BC520();
    swift_bridgeObjectRelease();
    sub_25E77D710(a1, a2);
    sub_25E77D710(a1, a2);
    _os_log_impl(&dword_25E775000, v12, v13, "Set wallet data: %s.", v15, 0xCu);
    uint64_t v19 = v24;
    swift_arrayDestroy();
    MEMORY[0x2611E3480](v19, -1, -1);
    MEMORY[0x2611E3480](v15, -1, -1);

    (*(void (**)(char *, uint64_t))(v25 + 8))(v10, v26);
  }
  else
  {
    sub_25E77D710(a1, a2);
    sub_25E77D710(a1, a2);

    (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  }
  uint64_t v20 = *(void *)(v3 + 312);
  unint64_t v21 = *(void *)(v3 + 320);
  *(void *)(v3 + 312) = a1;
  *(void *)(v3 + 320) = a2;
  sub_25E77CDF8(a1, a2);
  sub_25E77D710(v20, v21);
  return swift_retain();
}

uint64_t WFSetupData.Builder.deinit()
{
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_25E77D710(*(void *)(v0 + 96), *(void *)(v0 + 104));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_25E77D710(*(void *)(v0 + 208), *(void *)(v0 + 216));
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_25E77D710(*(void *)(v0 + 312), *(void *)(v0 + 320));
  return v0;
}

uint64_t WFSetupData.Builder.__deallocating_deinit()
{
  WFSetupData.Builder.deinit();
  return MEMORY[0x270FA0228](v0, 328, 7);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_25E77CD94(uint64_t result, unsigned char **a2)
{
  uint64_t v2 = *a2;
  *uint64_t v2 = result;
  *a2 = v2 + 1;
  return result;
}

unint64_t sub_25E77CDA4()
{
  unint64_t result = qword_26A706638;
  if (!qword_26A706638)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A706638);
  }
  return result;
}

uint64_t sub_25E77CDF8(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_25E77CE0C(a1, a2);
  }
  return a1;
}

uint64_t sub_25E77CE0C(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_retain();
  }
  return swift_retain();
}

uint64_t sub_25E77CE64(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_25E77CEA0(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_25E77CEC8(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4();
  sub_25E77CF40(v6, v7, a3);
  uint64_t v8 = *a1 + 8;
  sub_25E7BC520();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_25E77CF40(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_25E77D014(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_25E77D9C8((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    uint64_t ObjectType = MEMORY[0x263F8DBE0];
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_25E77D9C8((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_25E77D014(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        uint64_t v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (void *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            sub_25E7BC530();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_25E77D1D0(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0) {
    goto LABEL_13;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  uint64_t v8 = sub_25E7BC5C0();
  if (!v8)
  {
    sub_25E7BC620();
    __break(1u);
LABEL_17:
    uint64_t result = sub_25E7BC670();
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

uint64_t sub_25E77D1D0(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_25E77D268(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_25E77D448(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_25E77D448(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_25E77D268(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0) {
    goto LABEL_10;
  }
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v2 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v2)
  {
    while (1)
    {
      unint64_t v3 = sub_25E77D3E0(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_25E7BC5A0();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_25E7BC620();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_25E7BC430();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_25E7BC670();
    __break(1u);
LABEL_14:
    uint64_t result = sub_25E7BC620();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_25E77D3E0(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return (void *)MEMORY[0x263F8EE78];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A706650);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_25E77D448(char a1, int64_t a2, char a3, char *a4)
{
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A706650);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
  os_log_type_t v13 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_25E7BC670();
  __break(1u);
  return result;
}

unsigned char **sub_25E77D598(unsigned char **result, uint64_t a2, uint64_t a3, char a4)
{
  unint64_t v4 = *result;
  *unint64_t v4 = a4;
  *uint64_t result = v4 + 1;
  return result;
}

void *sub_25E77D5A8(void *__src, uint64_t a2, void *__dst, uint64_t a4)
{
  if (__src) {
    uint64_t v5 = a2 - (void)__src;
  }
  else {
    uint64_t v5 = 0;
  }
  if (!__dst)
  {
    if (v5 <= 0) {
      return __src;
    }
LABEL_12:
    __src = (void *)sub_25E7BC670();
    __break(1u);
    return __src;
  }
  if (a4 - (uint64_t)__dst < v5) {
    goto LABEL_12;
  }
  if (__src)
  {
    return memmove(__dst, __src, a2 - (void)__src);
  }
  return __src;
}

uint64_t sub_25E77D64C(uint64_t (*a1)(void))
{
  return a1() & 1;
}

uint64_t sub_25E77D678(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_25E77D6A0@<X0>(uint64_t (*a1)(void)@<X0>, _DWORD *a2@<X8>)
{
  uint64_t result = a1();
  *a2 = result;
  return result;
}

unint64_t sub_25E77D6D0()
{
  unint64_t result = qword_26A706DF0;
  if (!qword_26A706DF0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26A706DF0);
  }
  return result;
}

uint64_t sub_25E77D710(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_25E77D724(a1, a2);
  }
  return a1;
}

uint64_t sub_25E77D724(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_release();
  }
  return swift_release();
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_25E77D7C0@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = a1();
  *a2 = result;
  return result;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for WFSetupData.PropertyKey(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xDE) {
    goto LABEL_17;
  }
  if (a2 + 34 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 34) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 34;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 34;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 34;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0x23;
  int v8 = v6 - 35;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *_s10BuildErrorOwst(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 34 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 34) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xDE) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xDD)
  {
    unsigned int v6 = ((a2 - 222) >> 8) + 1;
    *uint64_t result = a2 + 34;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x25E77D960);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *uint64_t result = a2 + 34;
        break;
    }
  }
  return result;
}

uint64_t sub_25E77D988()
{
  return 0;
}

ValueMetadata *type metadata accessor for WFSetupData.BuildError()
{
  return &type metadata for WFSetupData.BuildError;
}

uint64_t type metadata accessor for WFSetupData.Builder()
{
  return self;
}

uint64_t sub_25E77D9C8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_25E77DA28(unsigned __int8 a1)
{
  unint64_t result = 0xD00000000000001CLL;
  if (a1 >= 2u) {
    return 0xD000000000000014;
  }
  return result;
}

uint64_t sub_25E77DA84()
{
  return sub_25E7BC7A0();
}

uint64_t sub_25E77DB5C()
{
  return sub_25E7BC7A0();
}

uint64_t sub_25E77DBC8()
{
  return sub_25E7BC7A0();
}

uint64_t sub_25E77DC34()
{
  sub_25E7BC400();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25E77DCEC()
{
  sub_25E7BC400();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25E77DD40()
{
  sub_25E7BC400();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25E77DD94()
{
  return sub_25E7BC7A0();
}

uint64_t sub_25E77DDFC()
{
  return sub_25E7BC7A0();
}

uint64_t sub_25E77DE64()
{
  return sub_25E7BC7A0();
}

unint64_t WFSetupRequestKey.rawValue.getter(char a1)
{
  unint64_t result = 0xD000000000000015;
  switch(a1)
  {
    case 2:
      unint64_t result = 0xD000000000000014;
      break;
    case 3:
      unint64_t result = 0xD000000000000021;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_25E77DFC0(unsigned __int8 *a1, char *a2)
{
  return sub_25E784A8C(*a1, *a2);
}

uint64_t sub_25E77DFCC()
{
  return sub_25E77DA84();
}

uint64_t sub_25E77DFD4()
{
  return sub_25E77DC34();
}

uint64_t sub_25E77DFDC()
{
  return sub_25E77DE64();
}

uint64_t sub_25E77DFE4@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = _s10TDGSharing17WFSetupRequestKeyO8rawValueACSgSS_tcfC_0();
  *a1 = result;
  return result;
}

unint64_t sub_25E77E014@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = WFSetupRequestKey.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

BOOL WFSetupResponseKey.init(rawValue:)()
{
  uint64_t v0 = sub_25E7BC680();
  swift_bridgeObjectRelease();
  return v0 != 0;
}

unint64_t WFSetupResponseKey.rawValue.getter()
{
  return 0xD000000000000015;
}

uint64_t sub_25E77E0A4()
{
  return 1;
}

uint64_t sub_25E77E0AC()
{
  return sub_25E7BC7A0();
}

uint64_t sub_25E77E104()
{
  return sub_25E7BC400();
}

uint64_t sub_25E77E120()
{
  return sub_25E7BC7A0();
}

uint64_t sub_25E77E174@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2 = sub_25E7BC680();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2 != 0;
  return result;
}

void sub_25E77E1C8(void *a1@<X8>)
{
  *a1 = 0xD000000000000015;
  a1[1] = 0x800000025E7BEFA0;
}

uint64_t _s10TDGSharing17WFSetupRequestKeyO8rawValueACSgSS_tcfC_0()
{
  unint64_t v0 = sub_25E7BC680();
  swift_bridgeObjectRelease();
  if (v0 >= 4) {
    return 4;
  }
  else {
    return v0;
  }
}

unint64_t sub_25E77E238()
{
  unint64_t result = qword_26A706658;
  if (!qword_26A706658)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A706658);
  }
  return result;
}

unint64_t sub_25E77E290()
{
  unint64_t result = qword_26A706660;
  if (!qword_26A706660)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A706660);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for WFSetupRequestKey(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFD) {
    goto LABEL_17;
  }
  if (a2 + 3 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 3) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 3;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 3;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 3;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 4;
  int v8 = v6 - 4;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for WFSetupRequestKey(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 3 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 3) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFD) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFC)
  {
    unsigned int v6 = ((a2 - 253) >> 8) + 1;
    *unint64_t result = a2 + 3;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x25E77E440);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *unint64_t result = a2 + 3;
        break;
    }
  }
  return result;
}

uint64_t sub_25E77E468(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_25E77E470(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for WFSetupRequestKey()
{
  return &type metadata for WFSetupRequestKey;
}

uint64_t getEnumTagSinglePayload for WFSetupResponseKey(unsigned int *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if ((a2 + 1) >= 0x10000) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) < 0x100) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4) {
    return *a1;
  }
  if (v3 == 2) {
    return *(unsigned __int16 *)a1;
  }
  return *(unsigned __int8 *)a1;
}

unsigned char *storeEnumTagSinglePayload for WFSetupResponseKey(unsigned char *result, int a2, int a3)
{
  if ((a3 + 1) >= 0x10000) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) < 0x100) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2)
  {
    switch(v5)
    {
      case 1:
        *unint64_t result = a2;
        return result;
      case 2:
        *(_WORD *)unint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)unint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *unint64_t result = 0;
      break;
    case 2:
      *(_WORD *)unint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x25E77E578);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for WFSetupResponseKey()
{
  return &type metadata for WFSetupResponseKey;
}

unint64_t WFSetupData.PropertyKey.rawValue.getter(char a1)
{
  unint64_t result = 0xD000000000000018;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x4449656C707061;
      break;
    case 2:
    case 26:
    case 27:
      return result;
    case 3:
      unint64_t result = 0x736B726F7774656ELL;
      break;
    case 4:
      unint64_t result = 0xD000000000000010;
      break;
    case 5:
      unint64_t result = 0xD000000000000011;
      break;
    case 6:
      unint64_t result = 0xD000000000000011;
      break;
    case 7:
      unint64_t result = 0xD00000000000001ALL;
      break;
    case 8:
      unint64_t result = 0x656E6F5A656D6974;
      break;
    case 9:
      unint64_t result = 0xD000000000000015;
      break;
    case 10:
      unint64_t result = 0x6D614E7473726966;
      break;
    case 11:
      unint64_t result = 0x6F4D656369766564;
      break;
    case 12:
      unint64_t result = 0x6C43656369766564;
      break;
    case 13:
      unint64_t result = 0x42656D6F48736168;
      break;
    case 14:
      unint64_t result = 0x726F747365527369;
      break;
    case 15:
      unint64_t result = 0x614E656369766564;
      break;
    case 16:
      unint64_t result = 0x555570756B636162;
      break;
    case 17:
      unint64_t result = 0x70756B6361427369;
      break;
    case 18:
      unint64_t result = 0xD00000000000001BLL;
      break;
    case 19:
      unint64_t result = 0xD000000000000014;
      break;
    case 20:
      unint64_t result = 0xD000000000000017;
      break;
    case 21:
      unint64_t result = 0xD000000000000017;
      break;
    case 22:
      unint64_t result = 0xD00000000000001ALL;
      break;
    case 23:
      unint64_t result = 0xD000000000000016;
      break;
    case 24:
      unint64_t result = 0xD000000000000019;
      break;
    case 25:
      unint64_t result = 0xD000000000000019;
      break;
    case 28:
      unint64_t result = 0xD000000000000012;
      break;
    case 29:
      unint64_t result = 0xD000000000000016;
      break;
    case 30:
      unint64_t result = 0xD000000000000015;
      break;
    case 31:
      unint64_t result = 0x56746375646F7270;
      break;
    case 32:
      unint64_t result = 0xD000000000000014;
      break;
    case 33:
      unint64_t result = 0xD000000000000013;
      break;
    case 34:
      unint64_t result = 0x614474656C6C6177;
      break;
    default:
      unint64_t result = 0x6472616F6279656BLL;
      break;
  }
  return result;
}

id WFSetupData.__allocating_init(keyboards:appleID:usesSameAccountForiTunes:isConnectedToWiFi:networks:networkPasswords:localePreferences:isAutomaticTimeZoneEnabled:timeZone:accessibilitySettings:firstName:deviceModel:deviceClass:hasHomeButton:isRestoring:deviceName:backupUUID:isBackupEnabled:isOptedInToLocationServices:isOptedInToDeviceAnalytics:locationServicesData:isOptedInToFindMyDevice:isOptedInToAppAnalytics:siriAssistantIsEnabled:siriVoiceTriggerIsEnabled:siriAssistantLanguageCode:siriAssistantOutputVoice:siriDataSharingIsEnabled:dictationIsEnabled:suppressDictationOptIn:deviceTermsIdentifier:productVersion:anisetteDataProvider:prescriptionRecords:walletData:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4, char a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9, long long a10, long long a11, long long a12, long long a13, uint64_t a14, uint64_t a15, char a16, char a17, long long a18, uint64_t a19, uint64_t a20,char a21,char a22,char a23,uint64_t a24,uint64_t a25,char a26,char a27,char a28,char a29,long long a30,uint64_t a31,char a32,char a33,char a34,long long a35,long long a36,long long a37,uint64_t a38)
{
  id v39 = objc_allocWithZone(v38);
  return WFSetupData.init(keyboards:appleID:usesSameAccountForiTunes:isConnectedToWiFi:networks:networkPasswords:localePreferences:isAutomaticTimeZoneEnabled:timeZone:accessibilitySettings:firstName:deviceModel:deviceClass:hasHomeButton:isRestoring:deviceName:backupUUID:isBackupEnabled:isOptedInToLocationServices:isOptedInToDeviceAnalytics:locationServicesData:isOptedInToFindMyDevice:isOptedInToAppAnalytics:siriAssistantIsEnabled:siriVoiceTriggerIsEnabled:siriAssistantLanguageCode:siriAssistantOutputVoice:siriDataSharingIsEnabled:dictationIsEnabled:suppressDictationOptIn:deviceTermsIdentifier:productVersion:anisetteDataProvider:prescriptionRecords:walletData:)(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, *((uint64_t *)&a10 + 1), a11, *((uint64_t *)&a11 + 1), a12, *((uint64_t *)&a12 + 1), a13, *((uint64_t *)&a13 + 1), a14, a15,
           a16,
           a17,
           a18,
           *((uint64_t *)&a18 + 1),
           a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           *((uint64_t *)&a30 + 1),
           a31,
           a32,
           a33,
           a34,
           a35,
           *((uint64_t *)&a35 + 1),
           a36,
           *((uint64_t *)&a36 + 1),
           a37,
           *((uint64_t *)&a37 + 1),
           a38);
}

uint64_t WFSetupData.version.getter()
{
  return 0;
}

uint64_t WFSetupData.keyboards.getter()
{
  return swift_unknownObjectRetain();
}

uint64_t WFSetupData.appleID.getter()
{
  return sub_25E77F1C4(&OBJC_IVAR___WFSetupDataInternal_appleID);
}

uint64_t WFSetupData.usesSameAccountForiTunes.getter()
{
  return *(unsigned __int8 *)(v0 + OBJC_IVAR___WFSetupDataInternal_usesSameAccountForiTunes);
}

uint64_t WFSetupData.walletData.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR___WFSetupDataInternal_walletData);
  sub_25E77CDF8(v1, *(void *)(v0 + OBJC_IVAR___WFSetupDataInternal_walletData + 8));
  return v1;
}

uint64_t WFSetupData.isConnectedToWiFi.getter()
{
  return *(unsigned __int8 *)(v0 + OBJC_IVAR___WFSetupDataInternal_isConnectedToWiFi);
}

uint64_t WFSetupData.networks.getter()
{
  return swift_bridgeObjectRetain();
}

id sub_25E77EC9C(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t *a4)
{
  sub_25E78314C(0, a4);
  swift_bridgeObjectRetain();
  unsigned int v4 = (void *)sub_25E7BC440();
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t WFSetupData.networkPasswords.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t WFSetupData.localePreferences.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t WFSetupData.isAutomaticTimeZoneEnabled.getter()
{
  return *(unsigned __int8 *)(v0 + OBJC_IVAR___WFSetupDataInternal_isAutomaticTimeZoneEnabled);
}

uint64_t WFSetupData.timeZone.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR___WFSetupDataInternal_timeZone);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t WFSetupData.accessibilitySettings.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR___WFSetupDataInternal_accessibilitySettings);
  sub_25E77CDF8(v1, *(void *)(v0 + OBJC_IVAR___WFSetupDataInternal_accessibilitySettings + 8));
  return v1;
}

uint64_t WFSetupData.firstName.getter()
{
  return sub_25E77F1C4(&OBJC_IVAR___WFSetupDataInternal_firstName);
}

uint64_t WFSetupData.deviceModel.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR___WFSetupDataInternal_deviceModel);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t WFSetupData.deviceClass.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR___WFSetupDataInternal_deviceClass);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t WFSetupData.hasHomeButton.getter()
{
  return *(unsigned __int8 *)(v0 + OBJC_IVAR___WFSetupDataInternal_hasHomeButton);
}

uint64_t WFSetupData.isRestoring.getter()
{
  return *(unsigned __int8 *)(v0 + OBJC_IVAR___WFSetupDataInternal_isRestoring);
}

uint64_t WFSetupData.deviceName.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR___WFSetupDataInternal_deviceName);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t WFSetupData.backupUUID.getter()
{
  return sub_25E77F1C4(&OBJC_IVAR___WFSetupDataInternal_backupUUID);
}

uint64_t WFSetupData.isBackupEnabled.getter()
{
  return *(unsigned __int8 *)(v0 + OBJC_IVAR___WFSetupDataInternal_isBackupEnabled);
}

uint64_t WFSetupData.isOptedInToLocationServices.getter()
{
  return *(unsigned __int8 *)(v0 + OBJC_IVAR___WFSetupDataInternal_isOptedInToLocationServices);
}

id sub_25E77EFDC(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = a1 + *a3;
  unint64_t v4 = *(void *)(v3 + 8);
  if (v4 >> 60 == 15)
  {
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v6 = *(void *)v3;
    sub_25E77CE0C(*(void *)v3, *(void *)(v3 + 8));
    uint64_t v5 = (void *)sub_25E7BC200();
    sub_25E77D710(v6, v4);
  }
  return v5;
}

uint64_t WFSetupData.locationServicesData.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR___WFSetupDataInternal_locationServicesData);
  sub_25E77CDF8(v1, *(void *)(v0 + OBJC_IVAR___WFSetupDataInternal_locationServicesData + 8));
  return v1;
}

uint64_t WFSetupData.isOptedInToFindMyDevice.getter()
{
  return *(unsigned __int8 *)(v0 + OBJC_IVAR___WFSetupDataInternal_isOptedInToFindMyDevice);
}

uint64_t WFSetupData.isOptedInToDeviceAnalytics.getter()
{
  return *(unsigned __int8 *)(v0 + OBJC_IVAR___WFSetupDataInternal_isOptedInToDeviceAnalytics);
}

uint64_t WFSetupData.isOptedInToAppAnalytics.getter()
{
  return *(unsigned __int8 *)(v0 + OBJC_IVAR___WFSetupDataInternal_isOptedInToAppAnalytics);
}

uint64_t WFSetupData.siriAssistantIsEnabled.getter()
{
  return *(unsigned __int8 *)(v0 + OBJC_IVAR___WFSetupDataInternal_siriAssistantIsEnabled);
}

uint64_t WFSetupData.siriVoiceTriggerIsEnabled.getter()
{
  return *(unsigned __int8 *)(v0 + OBJC_IVAR___WFSetupDataInternal_siriVoiceTriggerIsEnabled);
}

id sub_25E77F14C(uint64_t a1, uint64_t a2, void *a3)
{
  if (*(void *)(a1 + *a3 + 8))
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = (void *)sub_25E7BC3D0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = 0;
  }
  return v3;
}

uint64_t WFSetupData.siriAssistantLanguageCode.getter()
{
  return sub_25E77F1C4(&OBJC_IVAR___WFSetupDataInternal_siriAssistantLanguageCode);
}

uint64_t sub_25E77F1C4(void *a1)
{
  uint64_t v2 = *(void *)(v1 + *a1);
  swift_bridgeObjectRetain();
  return v2;
}

void *WFSetupData.siriAssistantOutputVoice.getter()
{
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR___WFSetupDataInternal_siriAssistantOutputVoice);
  id v2 = v1;
  return v1;
}

uint64_t WFSetupData.siriDataSharingIsEnabled.getter()
{
  return *(unsigned __int8 *)(v0 + OBJC_IVAR___WFSetupDataInternal_siriDataSharingIsEnabled);
}

uint64_t WFSetupData.dictationIsEnabled.getter()
{
  return *(unsigned __int8 *)(v0 + OBJC_IVAR___WFSetupDataInternal_dictationIsEnabled);
}

uint64_t WFSetupData.suppressDictationOptIn.getter()
{
  return *(unsigned __int8 *)(v0 + OBJC_IVAR___WFSetupDataInternal_suppressDictationOptIn);
}

uint64_t WFSetupData.deviceTermsIdentifier.getter()
{
  return *(void *)(v0 + OBJC_IVAR___WFSetupDataInternal_deviceTermsIdentifier);
}

id sub_25E77F2C8()
{
  swift_bridgeObjectRetain();
  uint64_t v0 = (void *)sub_25E7BC3D0();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t WFSetupData.productVersion.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR___WFSetupDataInternal_productVersion);
  swift_bridgeObjectRetain();
  return v1;
}

id WFSetupData.anisetteDataProvider.getter()
{
  return *(id *)(v0 + OBJC_IVAR___WFSetupDataInternal_anisetteDataProvider);
}

uint64_t WFSetupData.prescriptionRecords.getter()
{
  return swift_bridgeObjectRetain();
}

id WFSetupData.init(keyboards:appleID:usesSameAccountForiTunes:isConnectedToWiFi:networks:networkPasswords:localePreferences:isAutomaticTimeZoneEnabled:timeZone:accessibilitySettings:firstName:deviceModel:deviceClass:hasHomeButton:isRestoring:deviceName:backupUUID:isBackupEnabled:isOptedInToLocationServices:isOptedInToDeviceAnalytics:locationServicesData:isOptedInToFindMyDevice:isOptedInToAppAnalytics:siriAssistantIsEnabled:siriVoiceTriggerIsEnabled:siriAssistantLanguageCode:siriAssistantOutputVoice:siriDataSharingIsEnabled:dictationIsEnabled:suppressDictationOptIn:deviceTermsIdentifier:productVersion:anisetteDataProvider:prescriptionRecords:walletData:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4, char a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26,char a27,char a28,uint64_t a29,uint64_t a30,char a31,char a32,char a33,char a34,uint64_t a35,uint64_t a36,uint64_t a37,char a38,char a39,char a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47)
{
  *(void *)&v47[OBJC_IVAR___WFSetupDataInternal_version] = 0;
  *(void *)&v47[OBJC_IVAR___WFSetupDataInternal_keyboards] = a1;
  int v48 = &v47[OBJC_IVAR___WFSetupDataInternal_appleID];
  *int v48 = a2;
  v48[1] = a3;
  v47[OBJC_IVAR___WFSetupDataInternal_usesSameAccountForiTunes] = a4;
  v47[OBJC_IVAR___WFSetupDataInternal_isConnectedToWiFi] = a5;
  *(void *)&v47[OBJC_IVAR___WFSetupDataInternal_networks] = a6;
  *(void *)&v47[OBJC_IVAR___WFSetupDataInternal_networkPasswords] = a7;
  *(void *)&v47[OBJC_IVAR___WFSetupDataInternal_localePreferences] = a8;
  v47[OBJC_IVAR___WFSetupDataInternal_isAutomaticTimeZoneEnabled] = a9;
  uint64_t v49 = &v47[OBJC_IVAR___WFSetupDataInternal_timeZone];
  *uint64_t v49 = a10;
  v49[1] = a11;
  uint64_t v50 = &v47[OBJC_IVAR___WFSetupDataInternal_accessibilitySettings];
  *uint64_t v50 = a12;
  v50[1] = a13;
  uint64_t v51 = &v47[OBJC_IVAR___WFSetupDataInternal_firstName];
  *uint64_t v51 = a14;
  v51[1] = a15;
  uint64_t v52 = &v47[OBJC_IVAR___WFSetupDataInternal_deviceModel];
  *uint64_t v52 = a16;
  v52[1] = a17;
  uint64_t v53 = &v47[OBJC_IVAR___WFSetupDataInternal_deviceClass];
  *uint64_t v53 = a18;
  v53[1] = a19;
  v47[OBJC_IVAR___WFSetupDataInternal_hasHomeButton] = a20;
  v47[OBJC_IVAR___WFSetupDataInternal_isRestoring] = a21;
  uint64_t v54 = &v47[OBJC_IVAR___WFSetupDataInternal_deviceName];
  *uint64_t v54 = a22;
  v54[1] = a23;
  uint64_t v55 = &v47[OBJC_IVAR___WFSetupDataInternal_backupUUID];
  *uint64_t v55 = a24;
  v55[1] = a25;
  v47[OBJC_IVAR___WFSetupDataInternal_isBackupEnabled] = a26;
  v47[OBJC_IVAR___WFSetupDataInternal_isOptedInToLocationServices] = a27;
  v47[OBJC_IVAR___WFSetupDataInternal_isOptedInToDeviceAnalytics] = a28;
  v56 = &v47[OBJC_IVAR___WFSetupDataInternal_locationServicesData];
  void *v56 = a29;
  v56[1] = a30;
  v47[OBJC_IVAR___WFSetupDataInternal_isOptedInToFindMyDevice] = a31;
  v47[OBJC_IVAR___WFSetupDataInternal_isOptedInToAppAnalytics] = a32;
  v47[OBJC_IVAR___WFSetupDataInternal_siriAssistantIsEnabled] = a33;
  v47[OBJC_IVAR___WFSetupDataInternal_siriVoiceTriggerIsEnabled] = a34;
  v57 = &v47[OBJC_IVAR___WFSetupDataInternal_siriAssistantLanguageCode];
  void *v57 = a35;
  v57[1] = a36;
  *(void *)&v47[OBJC_IVAR___WFSetupDataInternal_siriAssistantOutputVoice] = a37;
  v47[OBJC_IVAR___WFSetupDataInternal_siriDataSharingIsEnabled] = a38;
  v47[OBJC_IVAR___WFSetupDataInternal_dictationIsEnabled] = a39;
  v47[OBJC_IVAR___WFSetupDataInternal_suppressDictationOptIn] = a40;
  *(void *)&v47[OBJC_IVAR___WFSetupDataInternal_deviceTermsIdentifier] = a41;
  v58 = &v47[OBJC_IVAR___WFSetupDataInternal_productVersion];
  void *v58 = a42;
  v58[1] = a43;
  *(void *)&v47[OBJC_IVAR___WFSetupDataInternal_anisetteDataProvider] = a44;
  *(void *)&v47[OBJC_IVAR___WFSetupDataInternal_prescriptionRecords] = a45;
  v59 = &v47[OBJC_IVAR___WFSetupDataInternal_walletData];
  void *v59 = a46;
  v59[1] = a47;
  v61.receiver = v47;
  v61.super_class = (Class)type metadata accessor for WFSetupData();
  return objc_msgSendSuper2(&v61, sel_init);
}

uint64_t type metadata accessor for WFSetupData()
{
  return self;
}

uint64_t static WFSetupData.supportsSecureCoding.getter()
{
  return 1;
}

Swift::Void __swiftcall WFSetupData.encode(with:)(NSCoder with)
{
  uint64_t v2 = v1;
  uint64_t v4 = *(void *)(v2 + OBJC_IVAR___WFSetupDataInternal_keyboards);
  if (v4)
  {
    *((void *)&v80 + 1) = swift_getObjectType();
    *(void *)&long long v79 = v4;
  }
  else
  {
    long long v79 = 0u;
    long long v80 = 0u;
  }
  swift_unknownObjectRetain();
  sub_25E780758((uint64_t)&v79, 0);
  sub_25E7808C8((uint64_t)&v79);
  uint64_t v5 = *(void *)(v2 + OBJC_IVAR___WFSetupDataInternal_appleID + 8);
  if (v5)
  {
    uint64_t v6 = *(void *)(v2 + OBJC_IVAR___WFSetupDataInternal_appleID);
    *((void *)&v80 + 1) = MEMORY[0x263F8D310];
    *(void *)&long long v79 = v6;
    *((void *)&v79 + 1) = v5;
  }
  else
  {
    long long v79 = 0u;
    long long v80 = 0u;
  }
  swift_bridgeObjectRetain();
  sub_25E780758((uint64_t)&v79, 1);
  sub_25E7808C8((uint64_t)&v79);
  uint64_t v7 = *(unsigned __int8 *)(v2 + OBJC_IVAR___WFSetupDataInternal_usesSameAccountForiTunes);
  int v8 = (void *)sub_25E7BC3D0();
  -[objc_class encodeBool:forKey:](with.super.isa, sel_encodeBool_forKey_, v7, v8, v79);

  *(void *)&long long v79 = *(void *)(v2 + OBJC_IVAR___WFSetupDataInternal_networks);
  swift_bridgeObjectRetain_n();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A706798);
  uint64_t v9 = sub_25E7BC700();
  uint64_t v10 = (void *)sub_25E7BC3D0();
  [(objc_class *)with.super.isa encodeObject:v9 forKey:v10];
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();

  *(void *)&long long v79 = *(void *)(v2 + OBJC_IVAR___WFSetupDataInternal_networkPasswords);
  swift_bridgeObjectRetain_n();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7067A0);
  uint64_t v11 = sub_25E7BC700();
  uint64_t v12 = (void *)sub_25E7BC3D0();
  [(objc_class *)with.super.isa encodeObject:v11 forKey:v12];
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();

  uint64_t v13 = *(unsigned __int8 *)(v2 + OBJC_IVAR___WFSetupDataInternal_isConnectedToWiFi);
  uint64_t v14 = (void *)sub_25E7BC3D0();
  [(objc_class *)with.super.isa encodeBool:v13 forKey:v14];

  *(void *)&long long v79 = *(void *)(v2 + OBJC_IVAR___WFSetupDataInternal_localePreferences);
  swift_bridgeObjectRetain_n();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7067A8);
  uint64_t v15 = sub_25E7BC700();
  uint64_t v16 = (void *)sub_25E7BC3D0();
  [(objc_class *)with.super.isa encodeObject:v15 forKey:v16];
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();

  uint64_t v17 = *(unsigned __int8 *)(v2 + OBJC_IVAR___WFSetupDataInternal_isAutomaticTimeZoneEnabled);
  unint64_t v18 = (void *)sub_25E7BC3D0();
  [(objc_class *)with.super.isa encodeBool:v17 forKey:v18];

  uint64_t v19 = *(void *)(v2 + OBJC_IVAR___WFSetupDataInternal_timeZone + 8);
  *(void *)&long long v79 = *(void *)(v2 + OBJC_IVAR___WFSetupDataInternal_timeZone);
  *((void *)&v79 + 1) = v19;
  swift_bridgeObjectRetain_n();
  uint64_t v20 = MEMORY[0x263F8D310];
  uint64_t v21 = sub_25E7BC700();
  uint64_t v22 = (void *)sub_25E7BC3D0();
  [(objc_class *)with.super.isa encodeObject:v21 forKey:v22];
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();

  uint64_t v23 = *(void *)(v2 + OBJC_IVAR___WFSetupDataInternal_accessibilitySettings);
  unint64_t v24 = *(void *)(v2 + OBJC_IVAR___WFSetupDataInternal_accessibilitySettings + 8);
  if (v24 >> 60 == 15)
  {
    long long v79 = 0u;
    long long v80 = 0u;
  }
  else
  {
    *((void *)&v80 + 1) = MEMORY[0x263F06F78];
    *(void *)&long long v79 = v23;
    *((void *)&v79 + 1) = v24;
  }
  sub_25E77CDF8(v23, v24);
  sub_25E780758((uint64_t)&v79, 9);
  sub_25E7808C8((uint64_t)&v79);
  uint64_t v25 = *(void *)(v2 + OBJC_IVAR___WFSetupDataInternal_firstName + 8);
  if (v25)
  {
    uint64_t v26 = *(void *)(v2 + OBJC_IVAR___WFSetupDataInternal_firstName);
    *((void *)&v80 + 1) = v20;
    *(void *)&long long v79 = v26;
    *((void *)&v79 + 1) = v25;
  }
  else
  {
    long long v79 = 0u;
    long long v80 = 0u;
  }
  swift_bridgeObjectRetain();
  sub_25E780758((uint64_t)&v79, 10);
  sub_25E7808C8((uint64_t)&v79);
  uint64_t v27 = *(void *)(v2 + OBJC_IVAR___WFSetupDataInternal_deviceModel + 8);
  *(void *)&long long v79 = *(void *)(v2 + OBJC_IVAR___WFSetupDataInternal_deviceModel);
  *((void *)&v79 + 1) = v27;
  swift_bridgeObjectRetain_n();
  uint64_t v28 = sub_25E7BC700();
  uint64_t v29 = (void *)sub_25E7BC3D0();
  [(objc_class *)with.super.isa encodeObject:v28 forKey:v29];
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();

  uint64_t v30 = *(void *)(v2 + OBJC_IVAR___WFSetupDataInternal_deviceClass + 8);
  *(void *)&long long v79 = *(void *)(v2 + OBJC_IVAR___WFSetupDataInternal_deviceClass);
  *((void *)&v79 + 1) = v30;
  swift_bridgeObjectRetain_n();
  uint64_t v31 = sub_25E7BC700();
  uint64_t v32 = (void *)sub_25E7BC3D0();
  [(objc_class *)with.super.isa encodeObject:v31 forKey:v32];
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();

  uint64_t v33 = *(unsigned __int8 *)(v2 + OBJC_IVAR___WFSetupDataInternal_hasHomeButton);
  uint64_t v34 = (void *)sub_25E7BC3D0();
  [(objc_class *)with.super.isa encodeBool:v33 forKey:v34];

  uint64_t v35 = *(unsigned __int8 *)(v2 + OBJC_IVAR___WFSetupDataInternal_isRestoring);
  unint64_t v36 = (void *)sub_25E7BC3D0();
  [(objc_class *)with.super.isa encodeBool:v35 forKey:v36];

  uint64_t v37 = *(void *)(v2 + OBJC_IVAR___WFSetupDataInternal_deviceName + 8);
  *(void *)&long long v79 = *(void *)(v2 + OBJC_IVAR___WFSetupDataInternal_deviceName);
  *((void *)&v79 + 1) = v37;
  swift_bridgeObjectRetain_n();
  uint64_t v38 = sub_25E7BC700();
  id v39 = (void *)sub_25E7BC3D0();
  [(objc_class *)with.super.isa encodeObject:v38 forKey:v39];
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();

  uint64_t v40 = *(void *)(v2 + OBJC_IVAR___WFSetupDataInternal_backupUUID + 8);
  if (v40)
  {
    uint64_t v41 = *(void *)(v2 + OBJC_IVAR___WFSetupDataInternal_backupUUID);
    *((void *)&v80 + 1) = v20;
    *(void *)&long long v79 = v41;
    *((void *)&v79 + 1) = v40;
  }
  else
  {
    long long v79 = 0u;
    long long v80 = 0u;
  }
  swift_bridgeObjectRetain();
  sub_25E780758((uint64_t)&v79, 16);
  sub_25E7808C8((uint64_t)&v79);
  uint64_t v42 = *(unsigned __int8 *)(v2 + OBJC_IVAR___WFSetupDataInternal_isBackupEnabled);
  uint64_t v43 = (void *)sub_25E7BC3D0();
  -[objc_class encodeBool:forKey:](with.super.isa, sel_encodeBool_forKey_, v42, v43, v79);

  uint64_t v44 = *(unsigned __int8 *)(v2 + OBJC_IVAR___WFSetupDataInternal_isOptedInToLocationServices);
  int v45 = (void *)sub_25E7BC3D0();
  [(objc_class *)with.super.isa encodeBool:v44 forKey:v45];

  uint64_t v46 = *(void *)(v2 + OBJC_IVAR___WFSetupDataInternal_locationServicesData);
  unint64_t v47 = *(void *)(v2 + OBJC_IVAR___WFSetupDataInternal_locationServicesData + 8);
  if (v47 >> 60 == 15)
  {
    long long v79 = 0u;
    long long v80 = 0u;
  }
  else
  {
    *((void *)&v80 + 1) = MEMORY[0x263F06F78];
    *(void *)&long long v79 = v46;
    *((void *)&v79 + 1) = v47;
  }
  sub_25E77CDF8(v46, v47);
  sub_25E780758((uint64_t)&v79, 19);
  sub_25E7808C8((uint64_t)&v79);
  uint64_t v48 = *(unsigned __int8 *)(v2 + OBJC_IVAR___WFSetupDataInternal_isOptedInToFindMyDevice);
  uint64_t v49 = (void *)sub_25E7BC3D0();
  -[objc_class encodeBool:forKey:](with.super.isa, sel_encodeBool_forKey_, v48, v49, v79);

  uint64_t v50 = *(unsigned __int8 *)(v2 + OBJC_IVAR___WFSetupDataInternal_isOptedInToAppAnalytics);
  uint64_t v51 = (void *)sub_25E7BC3D0();
  [(objc_class *)with.super.isa encodeBool:v50 forKey:v51];

  uint64_t v52 = *(unsigned __int8 *)(v2 + OBJC_IVAR___WFSetupDataInternal_isOptedInToDeviceAnalytics);
  uint64_t v53 = (void *)sub_25E7BC3D0();
  [(objc_class *)with.super.isa encodeBool:v52 forKey:v53];

  uint64_t v54 = *(unsigned __int8 *)(v2 + OBJC_IVAR___WFSetupDataInternal_siriAssistantIsEnabled);
  uint64_t v55 = (void *)sub_25E7BC3D0();
  [(objc_class *)with.super.isa encodeBool:v54 forKey:v55];

  uint64_t v56 = *(unsigned __int8 *)(v2 + OBJC_IVAR___WFSetupDataInternal_siriVoiceTriggerIsEnabled);
  v57 = (void *)sub_25E7BC3D0();
  [(objc_class *)with.super.isa encodeBool:v56 forKey:v57];

  uint64_t v58 = *(void *)(v2 + OBJC_IVAR___WFSetupDataInternal_siriAssistantLanguageCode + 8);
  if (v58)
  {
    uint64_t v59 = *(void *)(v2 + OBJC_IVAR___WFSetupDataInternal_siriAssistantLanguageCode);
    *((void *)&v80 + 1) = v20;
    *(void *)&long long v79 = v59;
    *((void *)&v79 + 1) = v58;
  }
  else
  {
    long long v79 = 0u;
    long long v80 = 0u;
  }
  swift_bridgeObjectRetain();
  sub_25E780758((uint64_t)&v79, 25);
  sub_25E7808C8((uint64_t)&v79);
  v60 = *(void **)(v2 + OBJC_IVAR___WFSetupDataInternal_siriAssistantOutputVoice);
  if (v60)
  {
    *((void *)&v80 + 1) = sub_25E78314C(0, &qword_26A7067B8);
    *(void *)&long long v79 = v60;
  }
  else
  {
    long long v79 = 0u;
    long long v80 = 0u;
  }
  id v61 = v60;
  sub_25E780758((uint64_t)&v79, 26);
  sub_25E7808C8((uint64_t)&v79);
  uint64_t v62 = *(unsigned __int8 *)(v2 + OBJC_IVAR___WFSetupDataInternal_siriDataSharingIsEnabled);
  v63 = (void *)sub_25E7BC3D0();
  -[objc_class encodeBool:forKey:](with.super.isa, sel_encodeBool_forKey_, v62, v63, v79);

  uint64_t v64 = *(unsigned __int8 *)(v2 + OBJC_IVAR___WFSetupDataInternal_dictationIsEnabled);
  v65 = (void *)sub_25E7BC3D0();
  [(objc_class *)with.super.isa encodeBool:v64 forKey:v65];

  uint64_t v66 = *(unsigned __int8 *)(v2 + OBJC_IVAR___WFSetupDataInternal_suppressDictationOptIn);
  v67 = (void *)sub_25E7BC3D0();
  [(objc_class *)with.super.isa encodeBool:v66 forKey:v67];

  uint64_t v68 = *(void *)(v2 + OBJC_IVAR___WFSetupDataInternal_deviceTermsIdentifier);
  v69 = (void *)sub_25E7BC3D0();
  [(objc_class *)with.super.isa encodeInteger:v68 forKey:v69];

  uint64_t v70 = *(void *)(v2 + OBJC_IVAR___WFSetupDataInternal_productVersion + 8);
  *(void *)&long long v79 = *(void *)(v2 + OBJC_IVAR___WFSetupDataInternal_productVersion);
  *((void *)&v79 + 1) = v70;
  swift_bridgeObjectRetain_n();
  uint64_t v71 = sub_25E7BC700();
  v72 = (void *)sub_25E7BC3D0();
  [(objc_class *)with.super.isa encodeObject:v71 forKey:v72];
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();

  id v73 = *(id *)(v2 + OBJC_IVAR___WFSetupDataInternal_anisetteDataProvider);
  v74 = (void *)sub_25E7BC3D0();
  [(objc_class *)with.super.isa encodeObject:v73 forKey:v74];

  *(void *)&long long v79 = *(void *)(v2 + OBJC_IVAR___WFSetupDataInternal_prescriptionRecords);
  swift_bridgeObjectRetain_n();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7067B0);
  uint64_t v75 = sub_25E7BC700();
  v76 = (void *)sub_25E7BC3D0();
  [(objc_class *)with.super.isa encodeObject:v75 forKey:v76];
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();

  uint64_t v77 = *(void *)(v2 + OBJC_IVAR___WFSetupDataInternal_walletData);
  unint64_t v78 = *(void *)(v2 + OBJC_IVAR___WFSetupDataInternal_walletData + 8);
  if (v78 >> 60 == 15)
  {
    long long v79 = 0u;
    long long v80 = 0u;
  }
  else
  {
    *((void *)&v80 + 1) = MEMORY[0x263F06F78];
    *(void *)&long long v79 = v77;
    *((void *)&v79 + 1) = v78;
  }
  sub_25E77CDF8(v77, v78);
  sub_25E780758((uint64_t)&v79, 34);
  sub_25E7808C8((uint64_t)&v79);
}

void sub_25E780758(uint64_t a1, char a2)
{
  if (*(void *)(a1 + 24))
  {
    sub_25E78337C(a1, (uint64_t)v11);
    uint64_t v4 = v12;
    if (v12)
    {
      uint64_t v5 = __swift_project_boxed_opaque_existential_0(v11, v12);
      uint64_t v6 = *(void *)(v4 - 8);
      MEMORY[0x270FA5388](v5, v5);
      int v8 = (char *)v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
      (*(void (**)(char *))(v6 + 16))(v8);
      uint64_t v9 = sub_25E7BC6C0();
      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v4);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v11);
    }
    else
    {
      uint64_t v9 = 0;
    }
    WFSetupData.PropertyKey.rawValue.getter(a2);
    uint64_t v10 = (void *)sub_25E7BC3D0();
    swift_bridgeObjectRelease();
    objc_msgSend(v2, sel_encodeObject_forKey_, v9, v10);
    swift_unknownObjectRelease();
  }
}

uint64_t sub_25E7808C8(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A706790);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

id WFSetupData.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return WFSetupData.init(coder:)(a1);
}

id WFSetupData.init(coder:)(void *a1)
{
  *(void *)&v1[OBJC_IVAR___WFSetupDataInternal_version] = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7067C0);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_25E7BDF00;
  uint64_t v183 = sub_25E78314C(0, &qword_26A7067C8);
  *(void *)(v3 + 32) = v183;
  uint64_t v4 = sub_25E78314C(0, (unint64_t *)&unk_26A7067D0);
  *(void *)(v3 + 40) = v4;
  uint64_t v5 = sub_25E78314C(0, (unint64_t *)&qword_26A706DF0);
  *(void *)(v3 + 48) = v5;
  v182 = v1;
  uint64_t v6 = (void *)sub_25E7BC3D0();
  unsigned __int8 v7 = objc_msgSend(a1, sel_containsValueForKey_, v6);

  if (v7)
  {
    sub_25E7BC4F0();
    swift_bridgeObjectRelease();
    uint64_t v8 = *((void *)&v188 + 1);
    if (*((void *)&v188 + 1))
    {
      uint64_t v9 = __swift_project_boxed_opaque_existential_0(&v187, *((uint64_t *)&v188 + 1));
      uint64_t v10 = *(void *)(v8 - 8);
      MEMORY[0x270FA5388](v9, v9);
      uint64_t v12 = (char *)&v139 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
      (*(void (**)(char *))(v10 + 16))(v12);
      uint64_t v181 = sub_25E7BC6C0();
      (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v8);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v187);
      goto LABEL_6;
    }
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  uint64_t v181 = 0;
LABEL_6:
  uint64_t v13 = swift_allocObject();
  long long v178 = xmmword_25E7BDF10;
  *(_OWORD *)(v13 + 16) = xmmword_25E7BDF10;
  *(void *)(v13 + 32) = v4;
  uint64_t v14 = (void *)sub_25E7BC3D0();
  unsigned int v15 = objc_msgSend(a1, sel_containsValueForKey_, v14);

  if (v15)
  {
    sub_25E7BC4F0();
  }
  else
  {
    long long v187 = 0u;
    long long v188 = 0u;
  }
  swift_bridgeObjectRelease();
  if (*((void *)&v188 + 1))
  {
    int v16 = swift_dynamicCast();
    if (v16) {
      uint64_t v17 = v185;
    }
    else {
      uint64_t v17 = 0;
    }
    if (v16) {
      unint64_t v18 = v186;
    }
    else {
      unint64_t v18 = 0;
    }
    unint64_t v180 = v18;
  }
  else
  {
    sub_25E7808C8((uint64_t)&v187);
    uint64_t v17 = 0;
    unint64_t v180 = 0;
  }
  uint64_t v19 = (void *)sub_25E7BC3D0();
  unsigned int v177 = objc_msgSend(a1, sel_decodeBoolForKey_, v19);

  uint64_t v20 = (void *)sub_25E7BC3D0();
  unsigned int v176 = objc_msgSend(a1, sel_decodeBoolForKey_, v20);

  uint64_t v21 = swift_allocObject();
  *(_OWORD *)(v21 + 16) = xmmword_25E7BDF20;
  *(void *)(v21 + 32) = v183;
  *(void *)(v21 + 40) = v5;
  *(void *)(v21 + 48) = sub_25E78314C(0, (unint64_t *)&unk_26A7067E0);
  uint64_t v22 = sub_25E78314C(0, (unint64_t *)&unk_26A706DE0);
  *(void *)(v21 + 56) = v22;
  *(void *)(v21 + 64) = v4;
  uint64_t v179 = sub_25E78314C(0, &qword_26A7067F0);
  *(void *)(v21 + 72) = v179;
  sub_25E7BC4F0();
  swift_bridgeObjectRelease();
  if (!*((void *)&v188 + 1))
  {
    swift_bridgeObjectRelease();
    sub_25E7808C8((uint64_t)&v187);
LABEL_34:
    if (qword_26A7065E0 != -1) {
      swift_once();
    }
    uint64_t v37 = sub_25E7BC2E0();
    __swift_project_value_buffer(v37, (uint64_t)qword_26A708A28);
    uint64_t v38 = sub_25E7BC2C0();
    os_log_type_t v39 = sub_25E7BC490();
    if (!os_log_type_enabled(v38, v39)) {
      goto LABEL_57;
    }
    uint64_t v40 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v40 = 0;
    uint64_t v41 = "Unexpectedly failed to decode networks";
    goto LABEL_56;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A706798);
  if ((swift_dynamicCast() & 1) == 0)
  {
    swift_bridgeObjectRelease();
    goto LABEL_34;
  }
  v173 = v17;
  uint64_t v23 = v185;
  uint64_t v24 = swift_allocObject();
  long long v174 = xmmword_25E7BDF30;
  *(_OWORD *)(v24 + 16) = xmmword_25E7BDF30;
  *(void *)(v24 + 32) = v183;
  *(void *)(v24 + 40) = v4;
  sub_25E7BC4F0();
  swift_bridgeObjectRelease();
  if (!*((void *)&v188 + 1))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_25E7808C8((uint64_t)&v187);
LABEL_40:
    if (qword_26A7065E0 != -1) {
      swift_once();
    }
    uint64_t v42 = sub_25E7BC2E0();
    __swift_project_value_buffer(v42, (uint64_t)qword_26A708A28);
    uint64_t v38 = sub_25E7BC2C0();
    os_log_type_t v39 = sub_25E7BC490();
    if (!os_log_type_enabled(v38, v39)) {
      goto LABEL_57;
    }
    uint64_t v40 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v40 = 0;
    uint64_t v41 = "Unexpectedly failed to decode network passwords";
    goto LABEL_56;
  }
  v175 = v23;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7067A0);
  if ((swift_dynamicCast() & 1) == 0)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_40;
  }
  uint64_t v25 = v185;
  uint64_t v26 = swift_allocObject();
  *(_OWORD *)(v26 + 16) = xmmword_25E7BDF40;
  *(void *)(v26 + 32) = v183;
  *(void *)(v26 + 40) = v5;
  *(void *)(v26 + 48) = v4;
  *(void *)(v26 + 56) = v22;
  *(void *)(v26 + 64) = v179;
  sub_25E7BC4F0();
  swift_bridgeObjectRelease();
  if (!*((void *)&v188 + 1))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_25E7808C8((uint64_t)&v187);
LABEL_46:
    if (qword_26A7065E0 != -1) {
      swift_once();
    }
    uint64_t v43 = sub_25E7BC2E0();
    __swift_project_value_buffer(v43, (uint64_t)qword_26A708A28);
    uint64_t v38 = sub_25E7BC2C0();
    os_log_type_t v39 = sub_25E7BC490();
    if (!os_log_type_enabled(v38, v39)) {
      goto LABEL_57;
    }
    uint64_t v40 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v40 = 0;
    uint64_t v41 = "Unexpectedly failed to decode locale preferences";
    goto LABEL_56;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7067A8);
  if ((swift_dynamicCast() & 1) == 0)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_46;
  }
  uint64_t v27 = v185;
  uint64_t v28 = (void *)sub_25E7BC3D0();
  unsigned int v29 = objc_msgSend(a1, sel_decodeBoolForKey_, v28);

  uint64_t v30 = swift_allocObject();
  *(_OWORD *)(v30 + 16) = v178;
  *(void *)(v30 + 32) = v4;
  sub_25E7BC4F0();
  swift_bridgeObjectRelease();
  if (*((void *)&v188 + 1))
  {
    if (swift_dynamicCast())
    {
      unsigned int v169 = v29;
      v171 = v25;
      uint64_t v31 = v185;
      unint64_t v32 = v186;
      uint64_t v33 = swift_allocObject();
      *(_OWORD *)(v33 + 16) = v178;
      *(void *)(v33 + 32) = v179;
      sub_25E7BC4F0();
      swift_bridgeObjectRelease();
      v168 = v31;
      unint64_t v170 = 0xD000000000000015;
      if (*((void *)&v188 + 1))
      {
        int v34 = swift_dynamicCast();
        uint64_t v35 = (uint64_t)v185;
        if (!v34) {
          uint64_t v35 = 0;
        }
        uint64_t v172 = v35;
        if (v34) {
          unint64_t v36 = v186;
        }
        else {
          unint64_t v36 = 0xF000000000000000;
        }
      }
      else
      {
        sub_25E7808C8((uint64_t)&v187);
        uint64_t v172 = 0;
        unint64_t v36 = 0xF000000000000000;
      }
      uint64_t v47 = swift_allocObject();
      *(_OWORD *)(v47 + 16) = v178;
      *(void *)(v47 + 32) = v4;
      uint64_t v48 = (void *)sub_25E7BC3D0();
      unsigned int v49 = objc_msgSend(a1, sel_containsValueForKey_, v48);

      if (v49)
      {
        sub_25E7BC4F0();
      }
      else
      {
        long long v187 = 0u;
        long long v188 = 0u;
      }
      swift_bridgeObjectRelease();
      if (*((void *)&v188 + 1))
      {
        int v50 = swift_dynamicCast();
        if (v50) {
          uint64_t v51 = v185;
        }
        else {
          uint64_t v51 = 0;
        }
        if (v50) {
          unint64_t v52 = v186;
        }
        else {
          unint64_t v52 = 0;
        }
      }
      else
      {
        sub_25E7808C8((uint64_t)&v187);
        uint64_t v51 = 0;
        unint64_t v52 = 0;
      }
      uint64_t v53 = swift_allocObject();
      *(_OWORD *)(v53 + 16) = v178;
      *(void *)(v53 + 32) = v4;
      sub_25E7BC4F0();
      swift_bridgeObjectRelease();
      if (*((void *)&v188 + 1))
      {
        if (swift_dynamicCast())
        {
          v167 = v51;
          unint64_t v54 = v186;
          v166 = v185;
          uint64_t v55 = swift_allocObject();
          *(_OWORD *)(v55 + 16) = v178;
          *(void *)(v55 + 32) = v4;
          sub_25E7BC4F0();
          swift_bridgeObjectRelease();
          if (*((void *)&v188 + 1))
          {
            if (swift_dynamicCast())
            {
              unint64_t v165 = v54;
              v163 = v185;
              unint64_t v164 = v186;
              uint64_t v56 = (void *)sub_25E7BC3D0();
              unsigned int v162 = objc_msgSend(a1, sel_decodeBoolForKey_, v56);

              v57 = (void *)sub_25E7BC3D0();
              unsigned int v161 = objc_msgSend(a1, sel_decodeBoolForKey_, v57);

              uint64_t v58 = swift_allocObject();
              *(_OWORD *)(v58 + 16) = v178;
              *(void *)(v58 + 32) = v4;
              sub_25E7BC4F0();
              swift_bridgeObjectRelease();
              if (*((void *)&v188 + 1))
              {
                if (swift_dynamicCast())
                {
                  unint64_t v158 = v52;
                  unint64_t v59 = v186;
                  v150 = v185;
                  uint64_t v60 = swift_allocObject();
                  *(_OWORD *)(v60 + 16) = v178;
                  *(void *)(v60 + 32) = v4;
                  id v61 = (void *)sub_25E7BC3D0();
                  unsigned int v62 = objc_msgSend(a1, sel_containsValueForKey_, v61);

                  if (v62)
                  {
                    sub_25E7BC4F0();
                  }
                  else
                  {
                    long long v187 = 0u;
                    long long v188 = 0u;
                  }
                  swift_bridgeObjectRelease();
                  unint64_t v157 = v59;
                  if (*((void *)&v188 + 1))
                  {
                    int v70 = swift_dynamicCast();
                    uint64_t v71 = v185;
                    if (!v70) {
                      uint64_t v71 = 0;
                    }
                    v140 = v71;
                    if (v70) {
                      unint64_t v72 = v186;
                    }
                    else {
                      unint64_t v72 = 0;
                    }
                    unint64_t v153 = v72;
                  }
                  else
                  {
                    sub_25E7808C8((uint64_t)&v187);
                    v140 = 0;
                    unint64_t v153 = 0;
                  }
                  id v73 = (void *)sub_25E7BC3D0();
                  unsigned int v74 = objc_msgSend(a1, sel_decodeBoolForKey_, v73);

                  uint64_t v75 = (void *)sub_25E7BC3D0();
                  unsigned int v76 = objc_msgSend(a1, sel_decodeBoolForKey_, v75);

                  uint64_t v77 = swift_allocObject();
                  *(_OWORD *)(v77 + 16) = v178;
                  *(void *)(v77 + 32) = v179;
                  unint64_t v151 = 0xD000000000000014;
                  sub_25E7BC4F0();
                  swift_bridgeObjectRelease();
                  unint64_t v159 = v36;
                  unsigned int v149 = v74;
                  if (*((void *)&v188 + 1))
                  {
                    int v78 = swift_dynamicCast();
                    uint64_t v79 = (uint64_t)v185;
                    if (!v78) {
                      uint64_t v79 = 0;
                    }
                    uint64_t v155 = v79;
                    unint64_t v80 = 0xF000000000000000;
                    if (v78) {
                      unint64_t v80 = v186;
                    }
                  }
                  else
                  {
                    sub_25E7808C8((uint64_t)&v187);
                    uint64_t v155 = 0;
                    unint64_t v80 = 0xF000000000000000;
                  }
                  unint64_t v156 = v80;
                  v81 = (void *)sub_25E7BC3D0();
                  unsigned int v147 = objc_msgSend(a1, sel_decodeBoolForKey_, v81);

                  v82 = (void *)sub_25E7BC3D0();
                  unsigned int v146 = objc_msgSend(a1, sel_decodeBoolForKey_, v82);

                  v83 = (void *)sub_25E7BC3D0();
                  unsigned int v145 = objc_msgSend(a1, sel_decodeBoolForKey_, v83);

                  unint64_t v160 = 0xD000000000000016;
                  v84 = (void *)sub_25E7BC3D0();
                  unsigned int v144 = objc_msgSend(a1, sel_decodeBoolForKey_, v84);

                  v85 = (void *)sub_25E7BC3D0();
                  unsigned int v143 = objc_msgSend(a1, sel_decodeBoolForKey_, v85);

                  uint64_t v86 = swift_allocObject();
                  *(_OWORD *)(v86 + 16) = v178;
                  *(void *)(v86 + 32) = v4;
                  sub_25E7BC4F0();
                  swift_bridgeObjectRelease();
                  if (*((void *)&v188 + 1))
                  {
                    int v87 = swift_dynamicCast();
                    v88 = v185;
                    if (!v87) {
                      v88 = 0;
                    }
                    v139 = v88;
                    if (v87) {
                      unint64_t v89 = v186;
                    }
                    else {
                      unint64_t v89 = 0;
                    }
                    unint64_t v152 = v89;
                  }
                  else
                  {
                    sub_25E7808C8((uint64_t)&v187);
                    v139 = 0;
                    unint64_t v152 = 0;
                  }
                  uint64_t v90 = swift_allocObject();
                  *(_OWORD *)(v90 + 16) = v178;
                  *(void *)(v90 + 32) = sub_25E78314C(0, &qword_26A7067B8);
                  sub_25E7BC4F0();
                  swift_bridgeObjectRelease();
                  unsigned int v148 = v76;
                  if (*((void *)&v188 + 1))
                  {
                    int v91 = swift_dynamicCast();
                    v92 = v185;
                    if (!v91) {
                      v92 = 0;
                    }
                    id v154 = v92;
                  }
                  else
                  {
                    sub_25E7808C8((uint64_t)&v187);
                    id v154 = 0;
                  }
                  v93 = (void *)sub_25E7BC3D0();
                  unsigned int v142 = objc_msgSend(a1, sel_decodeBoolForKey_, v93);

                  v94 = (void *)sub_25E7BC3D0();
                  unsigned int v141 = objc_msgSend(a1, sel_decodeBoolForKey_, v94);

                  v95 = (void *)sub_25E7BC3D0();
                  unsigned int v96 = objc_msgSend(a1, sel_decodeBoolForKey_, v95);

                  v97 = (void *)sub_25E7BC3D0();
                  id v98 = objc_msgSend(a1, sel_decodeIntegerForKey_, v97);

                  uint64_t v99 = swift_allocObject();
                  *(_OWORD *)(v99 + 16) = v174;
                  uint64_t v100 = type metadata accessor for PrescriptionRecord();
                  uint64_t v101 = v183;
                  *(void *)(v99 + 32) = v100;
                  *(void *)(v99 + 40) = v101;
                  sub_25E7BC4F0();
                  swift_bridgeObjectRelease();
                  if (*((void *)&v188 + 1))
                  {
                    __swift_instantiateConcreteTypeFromMangledName(&qword_26A7067B0);
                    if (swift_dynamicCast())
                    {
                      LODWORD(v183) = v96;
                      v102 = v185;
                      uint64_t v103 = swift_allocObject();
                      *(_OWORD *)(v103 + 16) = v178;
                      *(void *)(v103 + 32) = v4;
                      sub_25E7BC4F0();
                      swift_bridgeObjectRelease();
                      if (*((void *)&v188 + 1))
                      {
                        v104 = v102;
                        if (swift_dynamicCast())
                        {
                          unint64_t v170 = (unint64_t)v185;
                          *(void *)&long long v174 = v186;
                          uint64_t v105 = swift_allocObject();
                          *(_OWORD *)(v105 + 16) = v178;
                          *(void *)(v105 + 32) = type metadata accessor for WFSetupServerAnisetteDataProvider();
                          sub_25E7BC4F0();
                          swift_bridgeObjectRelease();
                          if (*((void *)&v188 + 1))
                          {
                            if (swift_dynamicCast())
                            {
                              v106 = v185;
                              uint64_t v107 = swift_allocObject();
                              *(_OWORD *)(v107 + 16) = v178;
                              *(void *)(v107 + 32) = v179;
                              v108 = (void *)sub_25E7BC3D0();
                              unsigned __int8 v109 = objc_msgSend(a1, sel_containsValueForKey_, v108);

                              if (v109)
                              {
                                sub_25E7BC4F0();
                                swift_bridgeObjectRelease();
                                if (*((void *)&v188 + 1))
                                {
                                  int v110 = swift_dynamicCast();
                                  v111 = v185;
                                  unint64_t v112 = v186;
                                  if (!v110)
                                  {
                                    v111 = 0;
                                    unint64_t v112 = 0xF000000000000000;
                                  }
                                  goto LABEL_163;
                                }
                              }
                              else
                              {
                                long long v187 = 0u;
                                long long v188 = 0u;
                                swift_bridgeObjectRelease();
                              }
                              sub_25E7808C8((uint64_t)&v187);
                              v111 = 0;
                              unint64_t v112 = 0xF000000000000000;
LABEL_163:
                              v125 = v182;
                              *(void *)&v182[OBJC_IVAR___WFSetupDataInternal_keyboards] = v181;
                              v126 = &v125[OBJC_IVAR___WFSetupDataInternal_appleID];
                              *(void *)v126 = v173;
                              *((void *)v126 + 1) = v180;
                              v125[OBJC_IVAR___WFSetupDataInternal_usesSameAccountForiTunes] = v177;
                              v125[OBJC_IVAR___WFSetupDataInternal_isConnectedToWiFi] = v176;
                              *(void *)&v125[OBJC_IVAR___WFSetupDataInternal_networks] = v175;
                              *(void *)&v125[OBJC_IVAR___WFSetupDataInternal_networkPasswords] = v171;
                              *(void *)&v125[OBJC_IVAR___WFSetupDataInternal_localePreferences] = v27;
                              v125[OBJC_IVAR___WFSetupDataInternal_isAutomaticTimeZoneEnabled] = v169;
                              v127 = &v125[OBJC_IVAR___WFSetupDataInternal_timeZone];
                              *(void *)v127 = v168;
                              *((void *)v127 + 1) = v32;
                              v128 = &v125[OBJC_IVAR___WFSetupDataInternal_accessibilitySettings];
                              *(void *)v128 = v172;
                              *((void *)v128 + 1) = v159;
                              v129 = &v125[OBJC_IVAR___WFSetupDataInternal_firstName];
                              *(void *)v129 = v167;
                              *((void *)v129 + 1) = v158;
                              v130 = &v125[OBJC_IVAR___WFSetupDataInternal_deviceModel];
                              *(void *)v130 = v166;
                              *((void *)v130 + 1) = v165;
                              v131 = &v125[OBJC_IVAR___WFSetupDataInternal_deviceClass];
                              *(void *)v131 = v163;
                              *((void *)v131 + 1) = v164;
                              v125[OBJC_IVAR___WFSetupDataInternal_hasHomeButton] = v162;
                              v125[OBJC_IVAR___WFSetupDataInternal_isRestoring] = v161;
                              v132 = &v125[OBJC_IVAR___WFSetupDataInternal_deviceName];
                              *(void *)v132 = v150;
                              *((void *)v132 + 1) = v157;
                              v133 = &v125[OBJC_IVAR___WFSetupDataInternal_backupUUID];
                              *(void *)v133 = v140;
                              *((void *)v133 + 1) = v153;
                              v125[OBJC_IVAR___WFSetupDataInternal_isBackupEnabled] = v149;
                              v125[OBJC_IVAR___WFSetupDataInternal_isOptedInToLocationServices] = v148;
                              v125[OBJC_IVAR___WFSetupDataInternal_isOptedInToDeviceAnalytics] = v145;
                              v134 = &v125[OBJC_IVAR___WFSetupDataInternal_locationServicesData];
                              *(void *)v134 = v155;
                              *((void *)v134 + 1) = v156;
                              v125[OBJC_IVAR___WFSetupDataInternal_isOptedInToFindMyDevice] = v147;
                              v125[OBJC_IVAR___WFSetupDataInternal_isOptedInToAppAnalytics] = v146;
                              v125[OBJC_IVAR___WFSetupDataInternal_siriAssistantIsEnabled] = v144;
                              v125[OBJC_IVAR___WFSetupDataInternal_siriVoiceTriggerIsEnabled] = v143;
                              v135 = &v125[OBJC_IVAR___WFSetupDataInternal_siriAssistantLanguageCode];
                              *(void *)v135 = v139;
                              *((void *)v135 + 1) = v152;
                              *(void *)&v125[OBJC_IVAR___WFSetupDataInternal_siriAssistantOutputVoice] = v154;
                              v125[OBJC_IVAR___WFSetupDataInternal_siriDataSharingIsEnabled] = v142;
                              v125[OBJC_IVAR___WFSetupDataInternal_dictationIsEnabled] = v141;
                              v125[OBJC_IVAR___WFSetupDataInternal_suppressDictationOptIn] = v183;
                              *(void *)&v125[OBJC_IVAR___WFSetupDataInternal_deviceTermsIdentifier] = v98;
                              v136 = (unint64_t *)&v125[OBJC_IVAR___WFSetupDataInternal_productVersion];
                              unint64_t *v136 = v170;
                              v136[1] = v174;
                              *(void *)&v125[OBJC_IVAR___WFSetupDataInternal_anisetteDataProvider] = v106;
                              *(void *)&v125[OBJC_IVAR___WFSetupDataInternal_prescriptionRecords] = v104;
                              v137 = &v125[OBJC_IVAR___WFSetupDataInternal_walletData];
                              *(void *)v137 = v111;
                              *((void *)v137 + 1) = v112;

                              v138 = (objc_class *)type metadata accessor for WFSetupData();
                              v184.receiver = v125;
                              v184.super_class = v138;
                              id v45 = objc_msgSendSuper2(&v184, sel_init);

                              return v45;
                            }
                            swift_bridgeObjectRelease();
                            swift_bridgeObjectRelease();
                            swift_bridgeObjectRelease();
                            swift_bridgeObjectRelease();
                            swift_bridgeObjectRelease();
                            swift_bridgeObjectRelease();
                            swift_bridgeObjectRelease();
                            swift_bridgeObjectRelease();
                            swift_bridgeObjectRelease();
                            swift_bridgeObjectRelease();
                            swift_bridgeObjectRelease();
                            swift_bridgeObjectRelease();
                            swift_bridgeObjectRelease();
                          }
                          else
                          {
                            swift_bridgeObjectRelease();
                            swift_bridgeObjectRelease();
                            swift_bridgeObjectRelease();
                            swift_bridgeObjectRelease();
                            swift_bridgeObjectRelease();
                            swift_bridgeObjectRelease();
                            swift_bridgeObjectRelease();
                            swift_bridgeObjectRelease();
                            swift_bridgeObjectRelease();
                            swift_bridgeObjectRelease();
                            swift_bridgeObjectRelease();
                            swift_bridgeObjectRelease();
                            swift_bridgeObjectRelease();
                            sub_25E7808C8((uint64_t)&v187);
                          }
                          if (qword_26A7065E0 != -1) {
                            swift_once();
                          }
                          uint64_t v124 = sub_25E7BC2E0();
                          __swift_project_value_buffer(v124, (uint64_t)qword_26A708A28);
                          v115 = sub_25E7BC2C0();
                          os_log_type_t v121 = sub_25E7BC490();
                          if (!os_log_type_enabled(v115, v121)) {
                            goto LABEL_159;
                          }
                          v122 = (uint8_t *)swift_slowAlloc();
                          *(_WORD *)v122 = 0;
                          v123 = "Unexpectedly failed to decode the anisette data provider. ";
                          goto LABEL_158;
                        }
                        swift_bridgeObjectRelease();
                        swift_bridgeObjectRelease();
                        swift_bridgeObjectRelease();
                        swift_bridgeObjectRelease();
                        swift_bridgeObjectRelease();
                        swift_bridgeObjectRelease();
                        swift_bridgeObjectRelease();
                        swift_bridgeObjectRelease();
                        swift_bridgeObjectRelease();
                        swift_bridgeObjectRelease();
                        swift_bridgeObjectRelease();
                        swift_bridgeObjectRelease();
                      }
                      else
                      {
                        swift_bridgeObjectRelease();
                        swift_bridgeObjectRelease();
                        swift_bridgeObjectRelease();
                        swift_bridgeObjectRelease();
                        swift_bridgeObjectRelease();
                        swift_bridgeObjectRelease();
                        swift_bridgeObjectRelease();
                        swift_bridgeObjectRelease();
                        swift_bridgeObjectRelease();
                        swift_bridgeObjectRelease();
                        swift_bridgeObjectRelease();
                        swift_bridgeObjectRelease();
                        sub_25E7808C8((uint64_t)&v187);
                      }
                      if (qword_26A7065E0 != -1) {
                        swift_once();
                      }
                      uint64_t v120 = sub_25E7BC2E0();
                      __swift_project_value_buffer(v120, (uint64_t)qword_26A708A28);
                      v115 = sub_25E7BC2C0();
                      os_log_type_t v121 = sub_25E7BC490();
                      if (!os_log_type_enabled(v115, v121)) {
                        goto LABEL_159;
                      }
                      v122 = (uint8_t *)swift_slowAlloc();
                      *(_WORD *)v122 = 0;
                      v123 = "Unexpectedly failed to decode the product version. ";
LABEL_158:
                      _os_log_impl(&dword_25E775000, v115, v121, v123, v122, 2u);
                      MEMORY[0x2611E3480](v122, -1, -1);
LABEL_159:
                      swift_unknownObjectRelease();
                      uint64_t v118 = v172;
                      unint64_t v119 = v159;
LABEL_160:
                      sub_25E77D710(v118, v119);
                      sub_25E77D710(v155, v156);

                      goto LABEL_58;
                    }
                    swift_bridgeObjectRelease();
                    swift_bridgeObjectRelease();
                    swift_bridgeObjectRelease();
                    swift_bridgeObjectRelease();
                    swift_bridgeObjectRelease();
                    swift_bridgeObjectRelease();
                    swift_bridgeObjectRelease();
                    swift_bridgeObjectRelease();
                    swift_bridgeObjectRelease();
                    swift_bridgeObjectRelease();
                    swift_bridgeObjectRelease();
                  }
                  else
                  {
                    swift_bridgeObjectRelease();
                    swift_bridgeObjectRelease();
                    swift_bridgeObjectRelease();
                    swift_bridgeObjectRelease();
                    swift_bridgeObjectRelease();
                    swift_bridgeObjectRelease();
                    swift_bridgeObjectRelease();
                    swift_bridgeObjectRelease();
                    swift_bridgeObjectRelease();
                    swift_bridgeObjectRelease();
                    swift_bridgeObjectRelease();
                    sub_25E7808C8((uint64_t)&v187);
                  }
                  unint64_t v113 = v159;
                  if (qword_26A7065E0 != -1) {
                    swift_once();
                  }
                  uint64_t v114 = sub_25E7BC2E0();
                  __swift_project_value_buffer(v114, (uint64_t)qword_26A708A28);
                  v115 = sub_25E7BC2C0();
                  os_log_type_t v116 = sub_25E7BC490();
                  if (os_log_type_enabled(v115, v116))
                  {
                    v117 = (uint8_t *)swift_slowAlloc();
                    *(_WORD *)v117 = 0;
                    _os_log_impl(&dword_25E775000, v115, v116, "Unexpectedly failed to decode the prescription records. ", v117, 2u);
                    MEMORY[0x2611E3480](v117, -1, -1);
                  }
                  swift_unknownObjectRelease();
                  uint64_t v118 = v172;
                  unint64_t v119 = v113;
                  goto LABEL_160;
                }
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
              }
              else
              {
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                sub_25E7808C8((uint64_t)&v187);
              }
              if (qword_26A7065E0 != -1) {
                swift_once();
              }
              uint64_t v69 = sub_25E7BC2E0();
              __swift_project_value_buffer(v69, (uint64_t)qword_26A708A28);
              uint64_t v64 = sub_25E7BC2C0();
              os_log_type_t v65 = sub_25E7BC490();
              if (!os_log_type_enabled(v64, v65)) {
                goto LABEL_99;
              }
              uint64_t v66 = (uint8_t *)swift_slowAlloc();
              *(_WORD *)uint64_t v66 = 0;
              v67 = "Unexpectedly failed to decode the device name";
              goto LABEL_98;
            }
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
          }
          else
          {
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            sub_25E7808C8((uint64_t)&v187);
          }
          if (qword_26A7065E0 != -1) {
            swift_once();
          }
          uint64_t v68 = sub_25E7BC2E0();
          __swift_project_value_buffer(v68, (uint64_t)qword_26A708A28);
          uint64_t v64 = sub_25E7BC2C0();
          os_log_type_t v65 = sub_25E7BC490();
          if (!os_log_type_enabled(v64, v65)) {
            goto LABEL_99;
          }
          uint64_t v66 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v66 = 0;
          v67 = "Unexpectedly failed to decode the device class";
LABEL_98:
          _os_log_impl(&dword_25E775000, v64, v65, v67, v66, 2u);
          MEMORY[0x2611E3480](v66, -1, -1);
LABEL_99:
          swift_unknownObjectRelease();
          sub_25E77D710(v172, v36);

          goto LABEL_58;
        }
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      else
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_25E7808C8((uint64_t)&v187);
      }
      if (qword_26A7065E0 != -1) {
        swift_once();
      }
      uint64_t v63 = sub_25E7BC2E0();
      __swift_project_value_buffer(v63, (uint64_t)qword_26A708A28);
      uint64_t v64 = sub_25E7BC2C0();
      os_log_type_t v65 = sub_25E7BC490();
      if (!os_log_type_enabled(v64, v65)) {
        goto LABEL_99;
      }
      uint64_t v66 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v66 = 0;
      v67 = "Unexpectedly failed to decode the accessibility settings";
      goto LABEL_98;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_25E7808C8((uint64_t)&v187);
  }
  if (qword_26A7065E0 != -1) {
    swift_once();
  }
  uint64_t v44 = sub_25E7BC2E0();
  __swift_project_value_buffer(v44, (uint64_t)qword_26A708A28);
  uint64_t v38 = sub_25E7BC2C0();
  os_log_type_t v39 = sub_25E7BC490();
  if (os_log_type_enabled(v38, v39))
  {
    uint64_t v40 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v40 = 0;
    uint64_t v41 = "Unexpectedly failed to decode the time zone settings";
LABEL_56:
    _os_log_impl(&dword_25E775000, v38, v39, v41, v40, 2u);
    MEMORY[0x2611E3480](v40, -1, -1);
  }
LABEL_57:

  swift_unknownObjectRelease();
LABEL_58:
  type metadata accessor for WFSetupData();
  swift_deallocPartialClassInstance();
  return 0;
}

uint64_t sub_25E782CE8(char *a1, char *a2)
{
  char v2 = *a2;
  unint64_t v3 = WFSetupData.PropertyKey.rawValue.getter(*a1);
  uint64_t v5 = v4;
  if (v3 == WFSetupData.PropertyKey.rawValue.getter(v2) && v5 == v6) {
    char v8 = 1;
  }
  else {
    char v8 = sub_25E7BC6D0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_25E782D74()
{
  char v1 = *v0;
  sub_25E7BC780();
  WFSetupData.PropertyKey.rawValue.getter(v1);
  sub_25E7BC400();
  swift_bridgeObjectRelease();
  return sub_25E7BC7A0();
}

uint64_t sub_25E782DD8()
{
  WFSetupData.PropertyKey.rawValue.getter(*v0);
  sub_25E7BC400();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25E782E2C()
{
  char v1 = *v0;
  sub_25E7BC780();
  WFSetupData.PropertyKey.rawValue.getter(v1);
  sub_25E7BC400();
  swift_bridgeObjectRelease();
  return sub_25E7BC7A0();
}

uint64_t sub_25E782E8C@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = _s10TDGSharing11WFSetupDataC11PropertyKeyO8rawValueAESgSS_tcfC_0();
  *a1 = result;
  return result;
}

unint64_t sub_25E782EBC@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = WFSetupData.PropertyKey.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

id WFSetupData.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void WFSetupData.init()()
{
}

id WFSetupData.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for WFSetupData();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_25E78313C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 16) = a2;
  *(void *)(result + 24) = 2 * a2;
  return result;
}

uint64_t sub_25E78314C(uint64_t a1, unint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2)
  {
    self;
    uint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

void *__swift_project_boxed_opaque_existential_0(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t _s10TDGSharing11WFSetupDataC11PropertyKeyO8rawValueAESgSS_tcfC_0()
{
  unint64_t v0 = sub_25E7BC6E0();
  swift_bridgeObjectRelease();
  if (v0 >= 0x23) {
    return 35;
  }
  else {
    return v0;
  }
}

unint64_t sub_25E783224()
{
  unint64_t result = qword_26A7067F8;
  if (!qword_26A7067F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A7067F8);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for WFSetupData.PropertyKey(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 34 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 34) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xDE) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xDD)
  {
    unsigned int v6 = ((a2 - 222) >> 8) + 1;
    *unint64_t result = a2 + 34;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x25E783344);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *unint64_t result = a2 + 34;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for WFSetupData.PropertyKey()
{
  return &type metadata for WFSetupData.PropertyKey;
}

uint64_t sub_25E78337C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A706790);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

double PrescriptionRecord.version.getter()
{
  return 1.0;
}

uint64_t PrescriptionRecord.accPayload.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR___WFPrescriptionRecord_accPayload);
  sub_25E77CE0C(v1, *(void *)(v0 + OBJC_IVAR___WFPrescriptionRecord_accPayload + 8));
  return v1;
}

uint64_t PrescriptionRecord.enrollmentName.getter()
{
  return sub_25E77F1C4(&OBJC_IVAR___WFPrescriptionRecord_enrollmentName);
}

uint64_t PrescriptionRecord.enrollmentDate.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR___WFPrescriptionRecord_enrollmentDate;
  uint64_t v4 = sub_25E7BC220();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);
  return v5(a1, v3, v4);
}

uint64_t PrescriptionRecord.leftLensFactoryCalibrationData.getter()
{
  return sub_25E77F1C4(&OBJC_IVAR___WFPrescriptionRecord_leftLensFactoryCalibrationData);
}

uint64_t PrescriptionRecord.rightLensFactoryCalibrationData.getter()
{
  return sub_25E77F1C4(&OBJC_IVAR___WFPrescriptionRecord_rightLensFactoryCalibrationData);
}

id PrescriptionRecord.__allocating_init(accPayload:enrollmentName:enrollmentDate:leftLensFactoryCalibrationData:rightLensFactoryCalibrationData:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v17 = (char *)objc_allocWithZone(v9);
  *(void *)&v17[OBJC_IVAR___WFPrescriptionRecord_version] = 0x3FF0000000000000;
  unint64_t v18 = &v17[OBJC_IVAR___WFPrescriptionRecord_accPayload];
  *(void *)unint64_t v18 = a1;
  *((void *)v18 + 1) = a2;
  uint64_t v19 = &v17[OBJC_IVAR___WFPrescriptionRecord_enrollmentName];
  *(void *)uint64_t v19 = a3;
  *((void *)v19 + 1) = a4;
  uint64_t v20 = &v17[OBJC_IVAR___WFPrescriptionRecord_enrollmentDate];
  uint64_t v21 = sub_25E7BC220();
  uint64_t v22 = *(void *)(v21 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v22 + 16))(v20, a5, v21);
  uint64_t v23 = &v17[OBJC_IVAR___WFPrescriptionRecord_leftLensFactoryCalibrationData];
  *(void *)uint64_t v23 = a6;
  *((void *)v23 + 1) = a7;
  uint64_t v24 = &v17[OBJC_IVAR___WFPrescriptionRecord_rightLensFactoryCalibrationData];
  *(void *)uint64_t v24 = a8;
  *((void *)v24 + 1) = a9;
  v28.receiver = v17;
  v28.super_class = v9;
  id v25 = objc_msgSendSuper2(&v28, sel_init);
  (*(void (**)(uint64_t, uint64_t))(v22 + 8))(a5, v21);
  return v25;
}

id PrescriptionRecord.init(accPayload:enrollmentName:enrollmentDate:leftLensFactoryCalibrationData:rightLensFactoryCalibrationData:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  *(void *)&v9[OBJC_IVAR___WFPrescriptionRecord_version] = 0x3FF0000000000000;
  uint64_t v14 = &v9[OBJC_IVAR___WFPrescriptionRecord_accPayload];
  *(void *)uint64_t v14 = a1;
  *((void *)v14 + 1) = a2;
  unsigned int v15 = &v9[OBJC_IVAR___WFPrescriptionRecord_enrollmentName];
  *(void *)unsigned int v15 = a3;
  *((void *)v15 + 1) = a4;
  int v16 = &v9[OBJC_IVAR___WFPrescriptionRecord_enrollmentDate];
  uint64_t v17 = sub_25E7BC220();
  uint64_t v18 = *(void *)(v17 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v18 + 16))(v16, a5, v17);
  uint64_t v19 = &v9[OBJC_IVAR___WFPrescriptionRecord_leftLensFactoryCalibrationData];
  *(void *)uint64_t v19 = a6;
  *((void *)v19 + 1) = a7;
  uint64_t v20 = &v9[OBJC_IVAR___WFPrescriptionRecord_rightLensFactoryCalibrationData];
  *(void *)uint64_t v20 = a8;
  *((void *)v20 + 1) = a9;
  v23.receiver = v9;
  v23.super_class = (Class)type metadata accessor for PrescriptionRecord();
  id v21 = objc_msgSendSuper2(&v23, sel_init);
  (*(void (**)(uint64_t, uint64_t))(v18 + 8))(a5, v17);
  return v21;
}

uint64_t type metadata accessor for PrescriptionRecord()
{
  uint64_t result = qword_26A7068F0;
  if (!qword_26A7068F0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t PrescriptionRecord.description.getter()
{
  return 0x657463616465723CLL;
}

unint64_t sub_25E783814(char a1)
{
  unint64_t result = 0xD00000000000001ELL;
  switch(a1)
  {
    case 1:
    case 2:
      unint64_t result = 0x656D6C6C6F726E65;
      break;
    case 3:
      return result;
    case 4:
      unint64_t result = 0xD00000000000001FLL;
      break;
    default:
      unint64_t result = 0x6F6C796150636361;
      break;
  }
  return result;
}

uint64_t static PrescriptionRecord.supportsSecureCoding.getter()
{
  return 1;
}

Swift::Void __swiftcall PrescriptionRecord.encode(with:)(NSCoder with)
{
  uint64_t v3 = sub_25E7BC220();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3, v5);
  unsigned __int8 v7 = (char *)v43 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *(void *)(v1 + OBJC_IVAR___WFPrescriptionRecord_accPayload);
  unint64_t v9 = *(void *)(v1 + OBJC_IVAR___WFPrescriptionRecord_accPayload + 8);
  *(void *)&long long v45 = v8;
  *((void *)&v45 + 1) = v9;
  sub_25E77CE0C(v8, v9);
  sub_25E77CE0C(v8, v9);
  uint64_t v10 = sub_25E7BC700();
  uint64_t v11 = (void *)sub_25E7BC3D0();
  [(objc_class *)with.super.isa encodeObject:v10 forKey:v11];
  swift_unknownObjectRelease();

  sub_25E77D724(v8, v9);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v7, v1 + OBJC_IVAR___WFPrescriptionRecord_enrollmentDate, v3);
  uint64_t v12 = sub_25E7BC700();
  uint64_t v13 = (void *)sub_25E7BC3D0();
  [(objc_class *)with.super.isa encodeObject:v12 forKey:v13];
  swift_unknownObjectRelease();

  uint64_t v14 = *(void *)(v1 + OBJC_IVAR___WFPrescriptionRecord_enrollmentName + 8);
  uint64_t v15 = MEMORY[0x263F8D310];
  if (v14)
  {
    uint64_t v16 = *(void *)(v1 + OBJC_IVAR___WFPrescriptionRecord_enrollmentName);
    *((void *)&v46 + 1) = MEMORY[0x263F8D310];
    *(void *)&long long v45 = v16;
    *((void *)&v45 + 1) = v14;
    sub_25E78337C((uint64_t)&v45, (uint64_t)v43);
    uint64_t v17 = v44;
    if (v44)
    {
      uint64_t v18 = __swift_project_boxed_opaque_existential_0(v43, v44);
      uint64_t v19 = *(void *)(v17 - 8);
      MEMORY[0x270FA5388](v18, v18);
      id v21 = (char *)v43 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
      (*(void (**)(char *))(v19 + 16))(v21);
      swift_bridgeObjectRetain();
      uint64_t v22 = sub_25E7BC6C0();
      (*(void (**)(char *, uint64_t))(v19 + 8))(v21, v17);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v43);
    }
    else
    {
      swift_bridgeObjectRetain();
      uint64_t v22 = 0;
    }
    objc_super v23 = (void *)sub_25E7BC3D0();
    [(objc_class *)with.super.isa encodeObject:v22 forKey:v23];
    swift_unknownObjectRelease();
  }
  else
  {
    long long v45 = 0u;
    long long v46 = 0u;
  }
  sub_25E784970((uint64_t)&v45, &qword_26A706790);
  uint64_t v24 = *(void *)(v1 + OBJC_IVAR___WFPrescriptionRecord_leftLensFactoryCalibrationData + 8);
  if (v24)
  {
    uint64_t v25 = *(void *)(v1 + OBJC_IVAR___WFPrescriptionRecord_leftLensFactoryCalibrationData);
    *((void *)&v46 + 1) = v15;
    *(void *)&long long v45 = v25;
    *((void *)&v45 + 1) = v24;
    sub_25E78337C((uint64_t)&v45, (uint64_t)v43);
    uint64_t v26 = v44;
    if (v44)
    {
      uint64_t v27 = __swift_project_boxed_opaque_existential_0(v43, v44);
      uint64_t v28 = *(void *)(v26 - 8);
      MEMORY[0x270FA5388](v27, v27);
      uint64_t v30 = (char *)v43 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
      (*(void (**)(char *))(v28 + 16))(v30);
      swift_bridgeObjectRetain();
      uint64_t v31 = sub_25E7BC6C0();
      (*(void (**)(char *, uint64_t))(v28 + 8))(v30, v26);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v43);
    }
    else
    {
      swift_bridgeObjectRetain();
      uint64_t v31 = 0;
    }
    unint64_t v32 = (void *)sub_25E7BC3D0();
    [(objc_class *)with.super.isa encodeObject:v31 forKey:v32];
    swift_unknownObjectRelease();
  }
  else
  {
    long long v45 = 0u;
    long long v46 = 0u;
  }
  sub_25E784970((uint64_t)&v45, &qword_26A706790);
  uint64_t v33 = (uint64_t *)(v1 + OBJC_IVAR___WFPrescriptionRecord_rightLensFactoryCalibrationData);
  uint64_t v34 = *(void *)(v1 + OBJC_IVAR___WFPrescriptionRecord_rightLensFactoryCalibrationData + 8);
  if (v34)
  {
    uint64_t v35 = *v33;
    *((void *)&v46 + 1) = v15;
    *(void *)&long long v45 = v35;
    *((void *)&v45 + 1) = v34;
    sub_25E78337C((uint64_t)&v45, (uint64_t)v43);
    uint64_t v36 = v44;
    if (v44)
    {
      uint64_t v37 = __swift_project_boxed_opaque_existential_0(v43, v44);
      uint64_t v38 = *(void *)(v36 - 8);
      MEMORY[0x270FA5388](v37, v37);
      uint64_t v40 = (char *)v43 - ((v39 + 15) & 0xFFFFFFFFFFFFFFF0);
      (*(void (**)(char *))(v38 + 16))(v40);
      swift_bridgeObjectRetain();
      uint64_t v41 = sub_25E7BC6C0();
      (*(void (**)(char *, uint64_t))(v38 + 8))(v40, v36);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v43);
    }
    else
    {
      swift_bridgeObjectRetain();
      uint64_t v41 = 0;
    }
    uint64_t v42 = (void *)sub_25E7BC3D0();
    [(objc_class *)with.super.isa encodeObject:v41 forKey:v42];
    swift_unknownObjectRelease();
  }
  else
  {
    long long v45 = 0u;
    long long v46 = 0u;
  }
  sub_25E784970((uint64_t)&v45, &qword_26A706790);
}

id PrescriptionRecord.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return PrescriptionRecord.init(coder:)(a1);
}

id PrescriptionRecord.init(coder:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A706880);
  MEMORY[0x270FA5388](v3 - 8, v4);
  uint64_t v6 = (char *)&v49 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_25E7BC220();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v53 = v7;
  uint64_t v54 = v8;
  MEMORY[0x270FA5388](v7, v9);
  unint64_t v52 = (char *)&v49 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)&v1[OBJC_IVAR___WFPrescriptionRecord_version] = 0x3FF0000000000000;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7067C0);
  uint64_t v11 = swift_allocObject();
  long long v55 = xmmword_25E7BDF10;
  *(_OWORD *)(v11 + 16) = xmmword_25E7BDF10;
  uint64_t v12 = sub_25E78314C(0, (unint64_t *)&unk_26A7067D0);
  *(void *)(v11 + 32) = v12;
  uint64_t v13 = v1;
  sub_25E7BC4F0();
  swift_bridgeObjectRelease();
  if (v60)
  {
    int v14 = swift_dynamicCast();
    uint64_t v15 = v57;
    unint64_t v16 = v58;
    if (!v14)
    {
      uint64_t v15 = 0;
      unint64_t v16 = 0;
    }
  }
  else
  {
    sub_25E784970((uint64_t)v59, &qword_26A706790);
    uint64_t v15 = 0;
    unint64_t v16 = 0;
  }
  uint64_t v17 = &v13[OBJC_IVAR___WFPrescriptionRecord_leftLensFactoryCalibrationData];
  *(void *)uint64_t v17 = v15;
  *((void *)v17 + 1) = v16;
  uint64_t v18 = swift_allocObject();
  *(_OWORD *)(v18 + 16) = v55;
  *(void *)(v18 + 32) = v12;
  sub_25E7BC4F0();
  swift_bridgeObjectRelease();
  if (v60)
  {
    int v19 = swift_dynamicCast();
    uint64_t v20 = v57;
    unint64_t v21 = v58;
    if (!v19)
    {
      uint64_t v20 = 0;
      unint64_t v21 = 0;
    }
  }
  else
  {
    sub_25E784970((uint64_t)v59, &qword_26A706790);
    uint64_t v20 = 0;
    unint64_t v21 = 0;
  }
  uint64_t v22 = &v13[OBJC_IVAR___WFPrescriptionRecord_rightLensFactoryCalibrationData];
  *(void *)uint64_t v22 = v20;
  *((void *)v22 + 1) = v21;
  uint64_t v23 = swift_allocObject();
  *(_OWORD *)(v23 + 16) = v55;
  *(void *)(v23 + 32) = v12;
  sub_25E7BC4F0();
  swift_bridgeObjectRelease();
  if (v60)
  {
    int v24 = swift_dynamicCast();
    uint64_t v25 = v57;
    unint64_t v26 = v58;
    if (!v24)
    {
      uint64_t v25 = 0;
      unint64_t v26 = 0;
    }
  }
  else
  {
    sub_25E784970((uint64_t)v59, &qword_26A706790);
    uint64_t v25 = 0;
    unint64_t v26 = 0;
  }
  uint64_t v27 = &v13[OBJC_IVAR___WFPrescriptionRecord_enrollmentName];
  *(void *)uint64_t v27 = v25;
  *((void *)v27 + 1) = v26;
  uint64_t v28 = swift_allocObject();
  *(_OWORD *)(v28 + 16) = v55;
  *(void *)(v28 + 32) = sub_25E78314C(0, &qword_26A7067F0);
  sub_25E7BC4F0();
  swift_bridgeObjectRelease();
  if (!v60)
  {
    sub_25E784970((uint64_t)v59, &qword_26A706790);
    goto LABEL_19;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_19:
    if (qword_26A7065C8 != -1) {
      swift_once();
    }
    uint64_t v40 = sub_25E7BC2E0();
    __swift_project_value_buffer(v40, (uint64_t)qword_26A7089E0);
    uint64_t v41 = sub_25E7BC2C0();
    os_log_type_t v42 = sub_25E7BC490();
    if (os_log_type_enabled(v41, v42))
    {
      uint64_t v43 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v43 = 0;
      _os_log_impl(&dword_25E775000, v41, v42, "Failed to decode and retrieve accPayload from record. ", v43, 2u);
      MEMORY[0x2611E3480](v43, -1, -1);
    }

    goto LABEL_31;
  }
  uint64_t v30 = v57;
  unint64_t v29 = v58;
  uint64_t v31 = (uint64_t *)&v13[OBJC_IVAR___WFPrescriptionRecord_accPayload];
  uint64_t *v31 = v57;
  v31[1] = v29;
  int v50 = v31;
  uint64_t v32 = swift_allocObject();
  *(_OWORD *)(v32 + 16) = v55;
  *(void *)(v32 + 32) = sub_25E78314C(0, (unint64_t *)&unk_26A7067E0);
  uint64_t v51 = v30;
  *(void *)&long long v55 = v29;
  sub_25E77CE0C(v30, v29);
  sub_25E7BC4F0();
  swift_bridgeObjectRelease();
  if (!v60)
  {
    sub_25E784970((uint64_t)v59, &qword_26A706790);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v54 + 56))(v6, 1, 1, v53);
    goto LABEL_25;
  }
  uint64_t v33 = v53;
  int v34 = swift_dynamicCast();
  uint64_t v35 = v54;
  (*(void (**)(char *, void, uint64_t, uint64_t))(v54 + 56))(v6, v34 ^ 1u, 1, v33);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v35 + 48))(v6, 1, v33) == 1)
  {
LABEL_25:
    sub_25E784970((uint64_t)v6, (uint64_t *)&unk_26A706880);
    if (qword_26A7065C8 != -1) {
      swift_once();
    }
    uint64_t v44 = sub_25E7BC2E0();
    __swift_project_value_buffer(v44, (uint64_t)qword_26A7089E0);
    long long v45 = sub_25E7BC2C0();
    os_log_type_t v46 = sub_25E7BC490();
    if (os_log_type_enabled(v45, v46))
    {
      uint64_t v47 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v47 = 0;
      _os_log_impl(&dword_25E775000, v45, v46, "Failed to decode and retrieve enrollmentDate from record. ", v47, 2u);
      MEMORY[0x2611E3480](v47, -1, -1);

      sub_25E77D724(v51, v55);
    }
    else
    {
      sub_25E77D724(v51, v55);
    }
    sub_25E77D724(*v50, v50[1]);
LABEL_31:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    swift_bridgeObjectRelease();
    type metadata accessor for PrescriptionRecord();
    swift_deallocPartialClassInstance();
    return 0;
  }
  sub_25E77D724(v51, v55);
  uint64_t v36 = *(void (**)(char *, char *, uint64_t))(v35 + 32);
  uint64_t v37 = v52;
  v36(v52, v6, v33);
  v36(&v13[OBJC_IVAR___WFPrescriptionRecord_enrollmentDate], v37, v33);

  uint64_t v38 = (objc_class *)type metadata accessor for PrescriptionRecord();
  v56.receiver = v13;
  v56.super_class = v38;
  id v39 = objc_msgSendSuper2(&v56, sel_init);

  return v39;
}

id PrescriptionRecord.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void PrescriptionRecord.init()()
{
}

id PrescriptionRecord.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PrescriptionRecord();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_25E784970(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_25E7849CC()
{
  return type metadata accessor for PrescriptionRecord();
}

uint64_t sub_25E7849D4()
{
  uint64_t result = sub_25E7BC220();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_25E784A8C(unsigned __int8 a1, char a2)
{
  unint64_t v2 = 0xD000000000000015;
  unint64_t v3 = 0x800000025E7BEFA0;
  uint64_t v4 = a1;
  unint64_t v5 = 0xD000000000000015;
  switch(v4)
  {
    case 1:
      uint64_t v6 = "userServerInteraction";
      goto LABEL_5;
    case 2:
      unint64_t v5 = 0xD000000000000014;
      uint64_t v6 = "securePairingRequest";
      goto LABEL_5;
    case 3:
      unint64_t v5 = 0xD000000000000021;
      uint64_t v6 = "userHasCompletedFirstPaneOnServer";
LABEL_5:
      unint64_t v3 = (unint64_t)(v6 - 32) | 0x8000000000000000;
      break;
    default:
      break;
  }
  unint64_t v7 = 0x800000025E7BEFA0;
  switch(a2)
  {
    case 1:
      uint64_t v8 = "userServerInteraction";
      goto LABEL_10;
    case 2:
      unint64_t v2 = 0xD000000000000014;
      uint64_t v8 = "securePairingRequest";
      goto LABEL_10;
    case 3:
      unint64_t v2 = 0xD000000000000021;
      uint64_t v8 = "userHasCompletedFirstPaneOnServer";
LABEL_10:
      unint64_t v7 = (unint64_t)(v8 - 32) | 0x8000000000000000;
      break;
    default:
      break;
  }
  if (v5 == v2 && v3 == v7) {
    char v9 = 1;
  }
  else {
    char v9 = sub_25E7BC6D0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v9 & 1;
}

uint64_t sub_25E784BE0(char a1, char a2)
{
  if (*(void *)&aNotinitirunnin_0[8 * a1] == *(void *)&aNotinitirunnin_0[8 * a2]
    && *(void *)&aAlized_0[8 * a1] == *(void *)&aAlized_0[8 * a2])
  {
    char v3 = 1;
  }
  else
  {
    char v3 = sub_25E7BC6D0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

uint64_t sub_25E784C68(char a1, char a2)
{
  if (*(void *)&aNotintiainitia_0[8 * a1] == *(void *)&aNotintiainitia_0[8 * a2]
    && *(void *)&aNotintiainitia_0[8 * a1 + 24] == *(void *)&aNotintiainitia_0[8 * a2 + 24])
  {
    char v3 = 1;
  }
  else
  {
    char v3 = sub_25E7BC6D0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

unint64_t sub_25E784CF0(uint64_t a1)
{
  unint64_t result = 0xD000000000000014;
  switch(a1)
  {
    case 0:
      return result;
    case 1:
    case 4:
      unint64_t result = 0xD00000000000001ALL;
      break;
    case 2:
      unint64_t result = 0xD00000000000002BLL;
      break;
    case 3:
      unint64_t result = 0xD000000000000021;
      break;
    case 5:
      unint64_t result = 0xD000000000000023;
      break;
    case 6:
      unint64_t result = 0xD00000000000001CLL;
      break;
    case 7:
      unint64_t result = 0xD000000000000016;
      break;
    default:
      sub_25E7BC6F0();
      __break(1u);
      JUMPOUT(0x25E784DECLL);
  }
  return result;
}

BOOL sub_25E784E0C(void *a1, void *a2)
{
  return *a1 == *a2;
}

uint64_t sub_25E784E20()
{
  return sub_25E7BC7A0();
}

uint64_t sub_25E784E84(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_25E7971C8();
  return MEMORY[0x270EEEA70](a1, a2, v4);
}

uint64_t sub_25E784ED0()
{
  return sub_25E7BC7A0();
}

unint64_t sub_25E784F30@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result = sub_25E796CF8(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

void sub_25E784F64(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_25E784F70(uint64_t a1)
{
  unint64_t v2 = sub_25E7971C8();
  return MEMORY[0x270EEEA80](a1, v2);
}

uint64_t sub_25E784FAC(uint64_t a1)
{
  unint64_t v2 = sub_25E7971C8();
  return MEMORY[0x270EEEA78](a1, v2);
}

unint64_t sub_25E784FE8()
{
  return sub_25E784CF0(*v0);
}

unint64_t sub_25E784FF0()
{
  return 0xD00000000000002BLL;
}

uint64_t sub_25E78500C(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_25E7971C8();
  return MEMORY[0x270EEEA68](a1, a2, v4);
}

id WFSetupServer.dispatchQueue.getter()
{
  unint64_t v1 = (void **)(v0 + OBJC_IVAR___WFSetupServerInternal_dispatchQueue);
  swift_beginAccess();
  unint64_t v2 = *v1;
  return v2;
}

void WFSetupServer.dispatchQueue.setter(void *a1)
{
  char v3 = (void **)(v1 + OBJC_IVAR___WFSetupServerInternal_dispatchQueue);
  swift_beginAccess();
  unint64_t v4 = *v3;
  *char v3 = a1;
}

uint64_t (*WFSetupServer.dispatchQueue.modify())()
{
  return j__swift_endAccess;
}

uint64_t WFSetupServer.completionHandler.getter()
{
  return sub_25E785D98(&OBJC_IVAR___WFSetupServerInternal_completionHandler, (void (*)(void, void))sub_25E799D14);
}

uint64_t WFSetupServer.completionHandler.setter(uint64_t a1, uint64_t a2)
{
  return sub_25E785ED4(a1, a2, &OBJC_IVAR___WFSetupServerInternal_completionHandler, (uint64_t (*)(uint64_t, uint64_t))sub_25E799D18);
}

uint64_t (*WFSetupServer.completionHandler.modify())()
{
  return j_j__swift_endAccess;
}

id sub_25E785380(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  unint64_t v5 = (uint64_t *)(a1 + *a3);
  swift_beginAccess();
  uint64_t v6 = *v5;
  if (*v5)
  {
    uint64_t v7 = v5[1];
    aBlock[4] = v6;
    aBlock[5] = v7;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_25E79B70C;
    aBlock[3] = a4;
    uint64_t v8 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
  }
  else
  {
    uint64_t v8 = 0;
  }
  return v8;
}

uint64_t WFSetupServer.activationHandler.getter()
{
  return sub_25E785D98(&OBJC_IVAR___WFSetupServerInternal_activationHandler, (void (*)(void, void))sub_25E799D14);
}

uint64_t WFSetupServer.activationHandler.setter(uint64_t a1, uint64_t a2)
{
  return sub_25E785ED4(a1, a2, &OBJC_IVAR___WFSetupServerInternal_activationHandler, (uint64_t (*)(uint64_t, uint64_t))sub_25E799D18);
}

uint64_t (*WFSetupServer.activationHandler.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t WFSetupServer.setupProgressEventHandler.getter()
{
  return sub_25E785D98(&OBJC_IVAR___WFSetupServerInternal_setupProgressEventHandler, (void (*)(void, void))sub_25E799D14);
}

uint64_t WFSetupServer.setupProgressEventHandler.setter(uint64_t a1, uint64_t a2)
{
  return sub_25E785ED4(a1, a2, &OBJC_IVAR___WFSetupServerInternal_setupProgressEventHandler, (uint64_t (*)(uint64_t, uint64_t))sub_25E799D18);
}

uint64_t (*WFSetupServer.setupProgressEventHandler.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t WFSetupServer.userInteractionProgressEventHandler.getter()
{
  return sub_25E785D98(&OBJC_IVAR___WFSetupServerInternal_userInteractionProgressEventHandler, (void (*)(void, void))sub_25E799D14);
}

uint64_t sub_25E7858AC(uint64_t a1, uint64_t a2)
{
  char v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);
  return swift_release();
}

uint64_t WFSetupServer.userInteractionProgressEventHandler.setter(uint64_t a1, uint64_t a2)
{
  return sub_25E785ED4(a1, a2, &OBJC_IVAR___WFSetupServerInternal_userInteractionProgressEventHandler, (uint64_t (*)(uint64_t, uint64_t))sub_25E799D18);
}

uint64_t (*WFSetupServer.userInteractionProgressEventHandler.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t WFSetupServer.setupPromptPinHandler.getter()
{
  return sub_25E785D98(&OBJC_IVAR___WFSetupServerInternal_setupPromptPinHandler, (void (*)(void, void))sub_25E799D14);
}

uint64_t sub_25E785B1C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v5 = *(void (**)(uint64_t, uint64_t))(a1 + 32);
  swift_retain();
  v5(a2, a3);
  return swift_release();
}

uint64_t WFSetupServer.setupPromptPinHandler.setter(uint64_t a1, uint64_t a2)
{
  return sub_25E785ED4(a1, a2, &OBJC_IVAR___WFSetupServerInternal_setupPromptPinHandler, (uint64_t (*)(uint64_t, uint64_t))sub_25E799D18);
}

uint64_t (*WFSetupServer.setupPromptPinHandler.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t WFSetupServer.receivedObjectHandler.getter()
{
  return sub_25E785D98(&OBJC_IVAR___WFSetupServerInternal_receivedObjectHandler, (void (*)(void, void))sub_25E785E00);
}

uint64_t sub_25E785D98(void *a1, void (*a2)(void, void))
{
  unint64_t v4 = (void *)(v2 + *a1);
  swift_beginAccess();
  uint64_t v5 = *v4;
  a2(*v4, v4[1]);
  return v5;
}

uint64_t sub_25E785E00(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

uint64_t WFSetupServer.receivedObjectHandler.setter(uint64_t a1, uint64_t a2)
{
  return sub_25E785ED4(a1, a2, &OBJC_IVAR___WFSetupServerInternal_receivedObjectHandler, (uint64_t (*)(uint64_t, uint64_t))sub_25E785F38);
}

uint64_t sub_25E785ED4(uint64_t a1, uint64_t a2, void *a3, uint64_t (*a4)(uint64_t, uint64_t))
{
  uint64_t v8 = (uint64_t *)(v4 + *a3);
  swift_beginAccess();
  uint64_t v9 = *v8;
  uint64_t v10 = v8[1];
  *uint64_t v8 = a1;
  v8[1] = a2;
  return a4(v9, v10);
}

uint64_t sub_25E785F38(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t (*WFSetupServer.receivedObjectHandler.modify())()
{
  return j_j__swift_endAccess;
}

void *WFSetupServer.anisetteDataProvider.getter()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR___WFSetupServerInternal_anisetteDataProvider);
  swift_beginAccess();
  uint64_t v2 = *v1;
  id v3 = v2;
  return v2;
}

void sub_25E7860A0(void **a1, void *a2)
{
  uint64_t v2 = *a1;
  id v3 = (void **)(*a2 + OBJC_IVAR___WFSetupServerInternal_anisetteDataProvider);
  swift_beginAccess();
  uint64_t v4 = *v3;
  *id v3 = v2;
  id v5 = v2;
}

uint64_t sub_25E786104()
{
  return 0;
}

uint64_t sub_25E786264(char a1)
{
  return *(void *)&aNotintiainitia_0[8 * a1];
}

uint64_t sub_25E786284(char *a1, char *a2)
{
  return sub_25E784C68(*a1, *a2);
}

uint64_t sub_25E786290()
{
  return sub_25E77DB5C();
}

uint64_t sub_25E786298()
{
  return sub_25E77DD40();
}

uint64_t sub_25E7862A0()
{
  return sub_25E77DD94();
}

uint64_t sub_25E7862A8@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_25E796D08();
  *a1 = result;
  return result;
}

uint64_t sub_25E7862D8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_25E786264(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_25E786304()
{
  return sub_25E786264(*v0);
}

uint64_t sub_25E78630C(char a1)
{
  return *(void *)&aNotinitirunnin_0[8 * a1];
}

uint64_t sub_25E78632C(char *a1, char *a2)
{
  return sub_25E784BE0(*a1, *a2);
}

uint64_t sub_25E786338()
{
  return sub_25E77DBC8();
}

uint64_t sub_25E786340()
{
  return sub_25E77DCEC();
}

uint64_t sub_25E786348()
{
  return sub_25E77DDFC();
}

uint64_t sub_25E786350@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_25E796D54();
  *a1 = result;
  return result;
}

uint64_t sub_25E786380@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_25E78630C(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_25E7863AC()
{
  return sub_25E78630C(*v0);
}

uint64_t sub_25E7863B4()
{
  return sub_25E786104();
}

id WFSetupServer.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

id WFSetupServer.init()()
{
  uint64_t v1 = OBJC_IVAR___WFSetupServerInternal_dispatchQueue;
  sub_25E78314C(0, (unint64_t *)&qword_26A706610);
  uint64_t v2 = v0;
  *(void *)&v0[v1] = sub_25E7BC4D0();
  id v3 = &v2[OBJC_IVAR___WFSetupServerInternal_completionHandler];
  *(void *)id v3 = 0;
  *((void *)v3 + 1) = 0;
  uint64_t v4 = &v2[OBJC_IVAR___WFSetupServerInternal_activationHandler];
  *(void *)uint64_t v4 = 0;
  *((void *)v4 + 1) = 0;
  id v5 = &v2[OBJC_IVAR___WFSetupServerInternal_setupProgressEventHandler];
  *(void *)id v5 = 0;
  *((void *)v5 + 1) = 0;
  uint64_t v6 = &v2[OBJC_IVAR___WFSetupServerInternal_userInteractionProgressEventHandler];
  *(void *)uint64_t v6 = 0;
  *((void *)v6 + 1) = 0;
  uint64_t v7 = &v2[OBJC_IVAR___WFSetupServerInternal_setupPromptPinHandler];
  *(void *)uint64_t v7 = 0;
  *((void *)v7 + 1) = 0;
  uint64_t v8 = &v2[OBJC_IVAR___WFSetupServerInternal_receivedObjectHandler];
  *(void *)uint64_t v8 = 0;
  *((void *)v8 + 1) = 0;
  *(void *)&v2[OBJC_IVAR___WFSetupServerInternal_anisetteDataProvider] = 0;
  v2[OBJC_IVAR___WFSetupServerInternal_shouldAdvertiseFast] = 0;
  *(void *)&v2[OBJC_IVAR___WFSetupServerInternal_sfService] = 0;
  *(void *)&v2[OBJC_IVAR___WFSetupServerInternal_resumeAuthTag] = 0;
  uint64_t v9 = &v2[OBJC_IVAR___WFSetupServerInternal_peer];
  uint64_t v10 = sub_25E7BC280();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v9, 1, 1, v10);
  *(void *)&v2[OBJC_IVAR___WFSetupServerInternal_sfSession] = 0;
  *(_DWORD *)&v2[OBJC_IVAR___WFSetupServerInternal_serverState] = 0;
  uint64_t v11 = OBJC_IVAR___WFSetupServerInternal_analyticsManager;
  int v19 = &type metadata for CoreAnalyticsBackend;
  uint64_t v20 = &off_270B571A8;
  type metadata accessor for AnalyticsManager();
  uint64_t v12 = swift_allocObject();
  uint64_t v13 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v18, (uint64_t)&type metadata for CoreAnalyticsBackend);
  MEMORY[0x270FA5388](v13, v13);
  (*(void (**)(void))(v14 + 16))();
  *(void *)(v12 + 40) = &type metadata for CoreAnalyticsBackend;
  *(void *)(v12 + 48) = &off_270B571A8;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v18);
  *(void *)&v2[v11] = v12;
  *(void *)&v2[OBJC_IVAR___WFSetupServerInternal_preventExitForLocaleClient] = 0;

  uint64_t v15 = (objc_class *)type metadata accessor for WFSetupServer();
  v17.receiver = v2;
  v17.super_class = v15;
  return objc_msgSendSuper2(&v17, sel_init);
}

uint64_t type metadata accessor for WFSetupServer()
{
  uint64_t result = qword_26A7069C0;
  if (!qword_26A7069C0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

char *WFSetupServer.__allocating_init(queue:)(void *a1)
{
  id v3 = (char *)objc_msgSend(objc_allocWithZone(v1), sel_init);
  uint64_t v4 = (void **)&v3[OBJC_IVAR___WFSetupServerInternal_dispatchQueue];
  swift_beginAccess();
  id v5 = *v4;
  *uint64_t v4 = a1;

  return v3;
}

char *WFSetupServer.init(queue:)(void *a1)
{
  id v3 = (char *)objc_msgSend(v1, sel_init);
  uint64_t v4 = (void **)&v3[OBJC_IVAR___WFSetupServerInternal_dispatchQueue];
  swift_beginAccess();
  id v5 = *v4;
  *uint64_t v4 = a1;

  return v3;
}

id WFSetupServer.__deallocating_deinit()
{
  uint64_t v1 = v0;
  if (qword_26A7065D0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_25E7BC2E0();
  __swift_project_value_buffer(v2, (uint64_t)qword_26A7089F8);
  id v3 = sub_25E7BC2C0();
  os_log_type_t v4 = sub_25E7BC4A0();
  if (os_log_type_enabled(v3, v4))
  {
    id v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_25E775000, v3, v4, "WFSetupServer deinit.", v5, 2u);
    MEMORY[0x2611E3480](v5, -1, -1);
  }

  sub_25E78C7D8();
  v7.receiver = v1;
  v7.super_class = (Class)type metadata accessor for WFSetupServer();
  return objc_msgSendSuper2(&v7, sel_dealloc);
}

Swift::Void __swiftcall WFSetupServer.prepareToRun()()
{
  if (qword_26A7065D0 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_25E7BC2E0();
  __swift_project_value_buffer(v1, (uint64_t)qword_26A7089F8);
  uint64_t v2 = sub_25E7BC2C0();
  os_log_type_t v3 = sub_25E7BC4A0();
  if (os_log_type_enabled(v2, v3))
  {
    os_log_type_t v4 = (uint8_t *)swift_slowAlloc();
    uint64_t v5 = swift_slowAlloc();
    uint64_t v16 = v5;
    *(_DWORD *)os_log_type_t v4 = 136446210;
    sub_25E77CF40(0x5465726170657270, 0xEE0029286E75526FLL, &v16);
    sub_25E7BC520();
    _os_log_impl(&dword_25E775000, v2, v3, "Running %{public}s", v4, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2611E3480](v5, -1, -1);
    MEMORY[0x2611E3480](v4, -1, -1);
  }

  uint64_t v6 = OBJC_IVAR___WFSetupServerInternal_preventExitForLocaleClient;
  if (*(void *)(v0 + OBJC_IVAR___WFSetupServerInternal_preventExitForLocaleClient))
  {
    objc_super v7 = sub_25E7BC2C0();
    os_log_type_t v8 = sub_25E7BC4A0();
    if (os_log_type_enabled(v7, v8))
    {
      uint64_t v9 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v9 = 0;
      uint64_t v10 = "preventExitForLocaleClient is already active";
LABEL_12:
      _os_log_impl(&dword_25E775000, v7, v8, v10, v9, 2u);
      MEMORY[0x2611E3480](v9, -1, -1);
    }
  }
  else
  {
    id v11 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6C1F0]), sel_init);
    uint64_t v12 = *(void **)(v0 + v6);
    *(void *)(v0 + v6) = v11;

    uint64_t v13 = *(void **)(v0 + v6);
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = (void *)sub_25E7BC3D0();
      objc_msgSend(v14, sel_preventExitForLocaleReason_, v15);
    }
    objc_super v7 = sub_25E7BC2C0();
    os_log_type_t v8 = sub_25E7BC4A0();
    if (os_log_type_enabled(v7, v8))
    {
      uint64_t v9 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v9 = 0;
      uint64_t v10 = "preventExitForLocaleClient activated";
      goto LABEL_12;
    }
  }
}

Swift::Void __swiftcall WFSetupServer.activate()()
{
  uint64_t v1 = sub_25E7BC2F0();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1, v3);
  uint64_t v5 = (char *)&aBlock[-1] - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_25E7BC310();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6, v8);
  uint64_t v10 = (char *)&aBlock[-1] - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v11 = (void **)&v0[OBJC_IVAR___WFSetupServerInternal_dispatchQueue];
  swift_beginAccess();
  uint64_t v12 = *v11;
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = v0;
  aBlock[4] = sub_25E796778;
  aBlock[5] = v13;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_25E787340;
  aBlock[3] = &block_descriptor;
  id v14 = _Block_copy(aBlock);
  id v15 = v12;
  uint64_t v16 = v0;
  sub_25E7BC300();
  uint64_t v17 = MEMORY[0x263F8EE78];
  sub_25E799664((unint64_t *)&qword_26A706980, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A706988);
  sub_25E796798();
  sub_25E7BC550();
  MEMORY[0x2611E2BA0](0, v10, v5, v14);
  _Block_release(v14);

  (*(void (**)(char *, uint64_t))(v2 + 8))(v5, v1);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  swift_release();
}

void sub_25E787150(uint64_t a1)
{
  uint64_t v1 = OBJC_IVAR___WFSetupServerInternal_serverState;
  if (*(unsigned char *)(a1 + OBJC_IVAR___WFSetupServerInternal_serverState))
  {
    if (qword_26A7065D0 != -1) {
      swift_once();
    }
    uint64_t v2 = sub_25E7BC2E0();
    __swift_project_value_buffer(v2, (uint64_t)qword_26A7089F8);
    oslog = sub_25E7BC2C0();
    os_log_type_t v3 = sub_25E7BC4A0();
    if (os_log_type_enabled(oslog, v3))
    {
      uint64_t v4 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl(&dword_25E775000, oslog, v3, "WFSetupServer is already activated.", v4, 2u);
      MEMORY[0x2611E3480](v4, -1, -1);
    }
  }
  else
  {
    if (qword_26A7065D0 != -1) {
      swift_once();
    }
    uint64_t v6 = sub_25E7BC2E0();
    __swift_project_value_buffer(v6, (uint64_t)qword_26A7089F8);
    uint64_t v7 = sub_25E7BC2C0();
    os_log_type_t v8 = sub_25E7BC4A0();
    if (os_log_type_enabled(v7, v8))
    {
      uint64_t v9 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl(&dword_25E775000, v7, v8, "Activating WFSetupServer", v9, 2u);
      MEMORY[0x2611E3480](v9, -1, -1);
    }

    *(unsigned char *)(a1 + v1) = 1;
    *(unsigned char *)(a1 + OBJC_IVAR___WFSetupServerInternal_shouldAdvertiseFast) = 1;
    WFSetupServer.prepareToRun()();
    sub_25E78CBC8();
  }
}

uint64_t sub_25E787340(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);
  return swift_release();
}

Swift::Void __swiftcall WFSetupServer.invalidate()()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_25E7BC2F0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2, v4);
  uint64_t v6 = (char *)&aBlock[-1] - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_25E7BC310();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7, v9);
  id v11 = (char *)&aBlock[-1] - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26A7065D0 != -1) {
    swift_once();
  }
  uint64_t v12 = sub_25E7BC2E0();
  __swift_project_value_buffer(v12, (uint64_t)qword_26A7089F8);
  uint64_t v13 = sub_25E7BC2C0();
  os_log_type_t v14 = sub_25E7BC4A0();
  if (os_log_type_enabled(v13, v14))
  {
    id v15 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v15 = 0;
    _os_log_impl(&dword_25E775000, v13, v14, "WFSetupServer invalidate called", v15, 2u);
    MEMORY[0x2611E3480](v15, -1, -1);
  }

  uint64_t v16 = (void **)&v1[OBJC_IVAR___WFSetupServerInternal_dispatchQueue];
  swift_beginAccess();
  uint64_t v17 = *v16;
  uint64_t v18 = swift_allocObject();
  *(void *)(v18 + 16) = v1;
  aBlock[4] = sub_25E79683C;
  aBlock[5] = v18;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_25E787340;
  aBlock[3] = &block_descriptor_7;
  int v19 = _Block_copy(aBlock);
  id v20 = v17;
  unint64_t v21 = v1;
  sub_25E7BC300();
  uint64_t v22 = MEMORY[0x263F8EE78];
  sub_25E799664((unint64_t *)&qword_26A706980, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A706988);
  sub_25E796798();
  sub_25E7BC550();
  MEMORY[0x2611E2BA0](0, v11, v6, v19);
  _Block_release(v19);

  (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
  swift_release();
}

void sub_25E787740(uint64_t a1)
{
  uint64_t v2 = (unsigned char *)(a1 + OBJC_IVAR___WFSetupServerInternal_serverState);
  if (*(unsigned char *)(a1 + OBJC_IVAR___WFSetupServerInternal_serverState + 2)
    && *(unsigned char *)(a1 + OBJC_IVAR___WFSetupServerInternal_serverState + 2) == 1)
  {
    swift_bridgeObjectRelease();
LABEL_5:
    if (qword_26A7065D0 != -1) {
      swift_once();
    }
    uint64_t v4 = sub_25E7BC2E0();
    __swift_project_value_buffer(v4, (uint64_t)qword_26A7089F8);
    oslog = sub_25E7BC2C0();
    os_log_type_t v5 = sub_25E7BC4A0();
    if (os_log_type_enabled(oslog, v5))
    {
      uint64_t v6 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl(&dword_25E775000, oslog, v5, "Invalidate method already called", v6, 2u);
      MEMORY[0x2611E3480](v6, -1, -1);
    }

    return;
  }
  char v3 = sub_25E7BC6D0();
  swift_bridgeObjectRelease();
  if (v3) {
    goto LABEL_5;
  }
  v2[2] = 1;
  uint64_t v7 = *(void **)(a1 + OBJC_IVAR___WFSetupServerInternal_sfSession);
  if (v7)
  {
    id v8 = v7;
    sub_25E794624(v8);
  }
  uint64_t v9 = OBJC_IVAR___WFSetupServerInternal_sfService;
  objc_msgSend(*(id *)(a1 + OBJC_IVAR___WFSetupServerInternal_sfService), sel_invalidate);
  uint64_t v10 = *(void **)(a1 + v9);
  *(void *)(a1 + v9) = 0;

  *uint64_t v2 = 0;
  sub_25E792520();
}

Swift::Void __swiftcall WFSetupServer.sendObject(object:encrypted:)(Swift::OpaquePointer object, Swift::Bool encrypted)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A706998);
  MEMORY[0x270FA5388](v5 - 8, v6);
  id v8 = (char *)&v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_25E7BC280();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9, v11);
  uint64_t v13 = (char *)&v28 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  os_log_type_t v14 = *(void **)(v2 + OBJC_IVAR___WFSetupServerInternal_sfService);
  if (v14)
  {
    uint64_t v15 = v2 + OBJC_IVAR___WFSetupServerInternal_peer;
    swift_beginAccess();
    sub_25E7998C8(v15, (uint64_t)v8, &qword_26A706998);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) == 1)
    {
      id v16 = v14;
      sub_25E784970((uint64_t)v8, &qword_26A706998);
      if (qword_26A7065D0 != -1) {
        swift_once();
      }
      uint64_t v17 = sub_25E7BC2E0();
      __swift_project_value_buffer(v17, (uint64_t)qword_26A7089F8);
      uint64_t v18 = sub_25E7BC2C0();
      os_log_type_t v19 = sub_25E7BC490();
      if (os_log_type_enabled(v18, v19))
      {
        id v20 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)id v20 = 0;
        _os_log_impl(&dword_25E775000, v18, v19, "Attempted to send object without peer", v20, 2u);
        MEMORY[0x2611E3480](v20, -1, -1);
      }
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v13, v8, v9);
      id v25 = v14;
      unint64_t v26 = (void *)sub_25E7BC260();
      sub_25E787D50((uint64_t)object._rawValue);
      uint64_t v27 = (void *)sub_25E7BC370();
      swift_bridgeObjectRelease();
      objc_msgSend(v25, sel_sendToPeer_flags_object_, v26, encrypted, v27);

      (*(void (**)(char *, uint64_t))(v10 + 8))(v13, v9);
    }
  }
  else
  {
    if (qword_26A7065D0 != -1) {
      swift_once();
    }
    uint64_t v21 = sub_25E7BC2E0();
    __swift_project_value_buffer(v21, (uint64_t)qword_26A7089F8);
    os_log_t v28 = (os_log_t)sub_25E7BC2C0();
    os_log_type_t v22 = sub_25E7BC490();
    if (os_log_type_enabled(v28, v22))
    {
      uint64_t v23 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v23 = 0;
      _os_log_impl(&dword_25E775000, v28, v22, "Attempting to send object without sfService", v23, 2u);
      MEMORY[0x2611E3480](v23, -1, -1);
    }
    os_log_t v24 = v28;
  }
}

uint64_t sub_25E787D50(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A706A88);
    uint64_t v2 = sub_25E7BC660();
  }
  else
  {
    uint64_t v2 = MEMORY[0x263F8EE80];
  }
  uint64_t v28 = a1 + 64;
  uint64_t v3 = -1 << *(unsigned char *)(a1 + 32);
  if (-v3 < 64) {
    uint64_t v4 = ~(-1 << -(char)v3);
  }
  else {
    uint64_t v4 = -1;
  }
  unint64_t v5 = v4 & *(void *)(a1 + 64);
  int64_t v27 = (unint64_t)(63 - v3) >> 6;
  uint64_t v6 = v2 + 64;
  swift_bridgeObjectRetain();
  uint64_t result = swift_retain();
  int64_t v8 = 0;
  while (1)
  {
    if (v5)
    {
      unint64_t v11 = __clz(__rbit64(v5));
      v5 &= v5 - 1;
      unint64_t v12 = v11 | (v8 << 6);
      goto LABEL_28;
    }
    int64_t v13 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    if (v13 >= v27) {
      goto LABEL_37;
    }
    unint64_t v14 = *(void *)(v28 + 8 * v13);
    int64_t v15 = v8 + 1;
    if (!v14)
    {
      int64_t v15 = v8 + 2;
      if (v8 + 2 >= v27) {
        goto LABEL_37;
      }
      unint64_t v14 = *(void *)(v28 + 8 * v15);
      if (!v14)
      {
        int64_t v15 = v8 + 3;
        if (v8 + 3 >= v27) {
          goto LABEL_37;
        }
        unint64_t v14 = *(void *)(v28 + 8 * v15);
        if (!v14)
        {
          int64_t v15 = v8 + 4;
          if (v8 + 4 >= v27) {
            goto LABEL_37;
          }
          unint64_t v14 = *(void *)(v28 + 8 * v15);
          if (!v14) {
            break;
          }
        }
      }
    }
LABEL_27:
    unint64_t v5 = (v14 - 1) & v14;
    unint64_t v12 = __clz(__rbit64(v14)) + (v15 << 6);
    int64_t v8 = v15;
LABEL_28:
    uint64_t v17 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v12);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    sub_25E77D9C8(*(void *)(a1 + 56) + 32 * v12, (uint64_t)v40);
    *(void *)&long long v39 = v19;
    *((void *)&v39 + 1) = v18;
    v37[2] = v39;
    v38[0] = v40[0];
    v38[1] = v40[1];
    *(void *)&v37[0] = v19;
    *((void *)&v37[0] + 1) = v18;
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    sub_25E796898(v38, v32);
    long long v33 = v29;
    long long v34 = v30;
    uint64_t v35 = v31;
    sub_25E796898(v32, v36);
    long long v29 = v33;
    long long v30 = v34;
    uint64_t v31 = v35;
    sub_25E796898(v36, v37);
    sub_25E796898(v37, &v33);
    uint64_t result = sub_25E7BC560();
    uint64_t v20 = -1 << *(unsigned char *)(v2 + 32);
    unint64_t v21 = result & ~v20;
    unint64_t v22 = v21 >> 6;
    if (((-1 << v21) & ~*(void *)(v6 + 8 * (v21 >> 6))) != 0)
    {
      unint64_t v9 = __clz(__rbit64((-1 << v21) & ~*(void *)(v6 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v23 = 0;
      unint64_t v24 = (unint64_t)(63 - v20) >> 6;
      do
      {
        if (++v22 == v24 && (v23 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        BOOL v25 = v22 == v24;
        if (v22 == v24) {
          unint64_t v22 = 0;
        }
        v23 |= v25;
        uint64_t v26 = *(void *)(v6 + 8 * v22);
      }
      while (v26 == -1);
      unint64_t v9 = __clz(__rbit64(~v26)) + (v22 << 6);
    }
    *(void *)(v6 + ((v9 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v9;
    uint64_t v10 = *(void *)(v2 + 48) + 40 * v9;
    *(_OWORD *)uint64_t v10 = v29;
    *(_OWORD *)(v10 + 16) = v30;
    *(void *)(v10 + 32) = v31;
    uint64_t result = (uint64_t)sub_25E796898(&v33, (_OWORD *)(*(void *)(v2 + 56) + 32 * v9));
    ++*(void *)(v2 + 16);
  }
  int64_t v16 = v8 + 5;
  if (v8 + 5 >= v27)
  {
LABEL_37:
    swift_release();
    sub_25E79992C();
    return v2;
  }
  unint64_t v14 = *(void *)(v28 + 8 * v16);
  if (v14)
  {
    int64_t v15 = v8 + 5;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v15 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v15 >= v27) {
      goto LABEL_37;
    }
    unint64_t v14 = *(void *)(v28 + 8 * v15);
    ++v16;
    if (v14) {
      goto LABEL_27;
    }
  }
LABEL_39:
  __break(1u);
  return result;
}

void WFSetupServer.sendSetup(action:info:responseHandler:)(int a1, uint64_t a2, void (*a3)(void *, void, void), uint64_t a4)
{
  uint64_t v7 = *(void **)(v4 + OBJC_IVAR___WFSetupServerInternal_sfSession);
  if (v7)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A7069A8);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_25E7BDF10;
    *(void *)(inited + 32) = 0xD000000000000010;
    *(void *)(inited + 40) = 0x800000025E7BFCC0;
    *(void *)(inited + 72) = MEMORY[0x263F8D4F8];
    *(unsigned char *)(inited + 48) = 1;
    id v11 = v7;
    unint64_t v12 = sub_25E7886EC(inited);
    long long v30 = (void *)MEMORY[0x263F8E8F8];
    LODWORD(v28) = a1;
    sub_25E796898(&v28, v34);
    swift_bridgeObjectRetain();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v33 = a2;
    sub_25E796960(v34, 24947, 0xE200000000000000, isUniquelyReferenced_nonNull_native);
    uint64_t v14 = v33;
    swift_bridgeObjectRelease();
    int64_t v15 = (void *)sub_25E7BC3D0();
    sub_25E787D50(v12);
    swift_bridgeObjectRelease();
    int64_t v16 = (void *)sub_25E7BC370();
    swift_bridgeObjectRelease();
    sub_25E787D50(v14);
    swift_bridgeObjectRelease();
    uint64_t v17 = (void *)sub_25E7BC370();
    swift_bridgeObjectRelease();
    if (a3)
    {
      uint64_t v18 = swift_allocObject();
      *(void *)(v18 + 16) = a3;
      *(void *)(v18 + 24) = a4;
      uint64_t v19 = (uint64_t (*)())sub_25E796AB8;
    }
    else
    {
      uint64_t v19 = nullsub_1;
      uint64_t v18 = 0;
    }
    uint64_t v26 = swift_allocObject();
    *(void *)(v26 + 16) = v19;
    *(void *)(v26 + 24) = v18;
    uint64_t v31 = sub_25E796AB4;
    uint64_t v32 = v26;
    *(void *)&long long v28 = MEMORY[0x263EF8330];
    *((void *)&v28 + 1) = 1107296256;
    long long v29 = sub_25E788D3C;
    long long v30 = &block_descriptor_13;
    int64_t v27 = _Block_copy(&v28);
    sub_25E785E00((uint64_t)a3);
    swift_release();
    objc_msgSend(v11, sel_sendRequestID_options_request_responseHandler_, v15, v16, v17, v27);

    _Block_release(v27);
  }
  else
  {
    if (qword_26A7065D0 != -1) {
      swift_once();
    }
    uint64_t v20 = sub_25E7BC2E0();
    __swift_project_value_buffer(v20, (uint64_t)qword_26A7089F8);
    unint64_t v21 = sub_25E7BC2C0();
    os_log_type_t v22 = sub_25E7BC490();
    if (os_log_type_enabled(v21, v22))
    {
      char v23 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)char v23 = 0;
      _os_log_impl(&dword_25E775000, v21, v22, "Server is not ready to send a setup action", v23, 2u);
      MEMORY[0x2611E3480](v23, -1, -1);
    }

    if (a3)
    {
      sub_25E796844();
      unint64_t v24 = (void *)swift_allocError();
      *BOOL v25 = 0;
      swift_retain();
      a3(v24, 0, 0);

      sub_25E785F38((uint64_t)a3);
    }
  }
}

unint64_t sub_25E7885A8(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A706A88);
  uint64_t v2 = sub_25E7BC660();
  uint64_t v3 = (void *)v2;
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  uint64_t v5 = v2 + 64;
  uint64_t v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_25E7998C8(v6, (uint64_t)v15, &qword_26A706A90);
    unint64_t result = sub_25E7A8CC8((uint64_t)v15);
    if (v8) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v9 = v3[6] + 40 * result;
    long long v10 = v15[0];
    long long v11 = v15[1];
    *(void *)(v9 + 32) = v16;
    *(_OWORD *)uint64_t v9 = v10;
    *(_OWORD *)(v9 + 16) = v11;
    unint64_t result = (unint64_t)sub_25E796898(&v17, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v3[2] = v14;
    v6 += 72;
    if (!--v4)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_25E7886EC(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A706A98);
  uint64_t v2 = sub_25E7BC660();
  uint64_t v3 = (void *)v2;
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  uint64_t v5 = v2 + 64;
  uint64_t v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_25E7998C8(v6, (uint64_t)&v15, &qword_26A706AA0);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_25E7A8D0C(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    long long v11 = (uint64_t *)(v3[6] + 16 * result);
    *long long v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_25E796898(&v17, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v3[2] = v14;
    v6 += 48;
    if (!--v4)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_25E788824(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A706A78);
  uint64_t v2 = (void *)sub_25E7BC660();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (_DWORD *)(a1 + 48);
  while (1)
  {
    uint64_t v5 = *((void *)v4 - 2);
    uint64_t v6 = *((void *)v4 - 1);
    int v7 = *v4;
    swift_bridgeObjectRetain();
    unint64_t result = sub_25E7A8D0C(v5, v6);
    if (v9) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    char v10 = (uint64_t *)(v2[6] + 16 * result);
    uint64_t *v10 = v5;
    v10[1] = v6;
    *(_DWORD *)(v2[7] + 4 * result) = v7;
    uint64_t v11 = v2[2];
    BOOL v12 = __OFADD__(v11, 1);
    uint64_t v13 = v11 + 1;
    if (v12) {
      goto LABEL_11;
    }
    v4 += 6;
    v2[2] = v13;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_25E788938(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A706A10);
  uint64_t v2 = (void *)sub_25E7BC660();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (uint64_t *)(a1 + 56);
  while (1)
  {
    uint64_t v5 = *(v4 - 3);
    uint64_t v6 = *(v4 - 2);
    uint64_t v8 = *(v4 - 1);
    uint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t result = sub_25E7A8D0C(v5, v6);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v2[6] + 16 * result);
    *uint64_t v11 = v5;
    v11[1] = v6;
    BOOL v12 = (void *)(v2[7] + 16 * result);
    *BOOL v12 = v8;
    v12[1] = v7;
    uint64_t v13 = v2[2];
    BOOL v14 = __OFADD__(v13, 1);
    uint64_t v15 = v13 + 1;
    if (v14) {
      goto LABEL_11;
    }
    v4 += 4;
    v2[2] = v15;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_25E788A5C(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A706A08);
  uint64_t v2 = (void *)sub_25E7BC660();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (void **)(a1 + 48);
  while (1)
  {
    uint64_t v5 = (uint64_t)*(v4 - 2);
    uint64_t v6 = (uint64_t)*(v4 - 1);
    uint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    id v8 = v7;
    unint64_t result = sub_25E7A8D0C(v5, v6);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v2[6] + 16 * result);
    *uint64_t v11 = v5;
    v11[1] = v6;
    *(void *)(v2[7] + 8 * result) = v8;
    uint64_t v12 = v2[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v2[2] = v14;
    v4 += 3;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_25E788B78(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A706A18);
  uint64_t v2 = sub_25E7BC660();
  uint64_t v3 = (void *)v2;
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  uint64_t v5 = v2 + 64;
  uint64_t v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_25E7998C8(v6, (uint64_t)&v15, &qword_26A706A20);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_25E7A8D0C(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v3[6] + 16 * result);
    *uint64_t v11 = v7;
    v11[1] = v8;
    unint64_t result = sub_25E79721C((uint64_t)&v17, v3[7] + 32 * result, &qword_26A706790);
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v3[2] = v14;
    v6 += 48;
    if (!--v4)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_25E788CC4(void *a1, void *a2, void *a3, uint64_t (*a4)(void, void, void))
{
  return a4(*a1, *a2, *a3);
}

uint64_t sub_25E788CF8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t *, uint64_t *, uint64_t *))
{
  uint64_t v6 = a2;
  uint64_t v7 = a1;
  uint64_t v5 = a3;
  return a4(&v7, &v6, &v5);
}

uint64_t sub_25E788D3C(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4;
  uint64_t v6 = *(void (**)(void *, uint64_t, uint64_t))(a1 + 32);
  if (a3)
  {
    uint64_t v7 = sub_25E7BC390();
    if (!v4) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  uint64_t v7 = 0;
  if (a4) {
LABEL_3:
  }
    uint64_t v4 = sub_25E7BC390();
LABEL_4:
  swift_retain();
  id v8 = a2;
  v6(a2, v7, v4);
  swift_release();

  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void WFSetupServer.sendUserInteractionEvent(inEvent:withEncryption:responseHandler:)(uint64_t a1, char a2, void (*a3)(void, void, void), uint64_t a4)
{
  uint64_t v5 = v4;
  if (qword_26A7065D0 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_25E7BC2E0();
  __swift_project_value_buffer(v8, (uint64_t)qword_26A7089F8);
  swift_bridgeObjectRetain_n();
  char v9 = sub_25E7BC2C0();
  os_log_type_t v10 = sub_25E7BC4A0();
  if (os_log_type_enabled(v9, v10))
  {
    char v43 = a2;
    uint64_t v11 = swift_slowAlloc();
    uint64_t v40 = swift_slowAlloc();
    uint64_t aBlock = v40;
    *(_DWORD *)uint64_t v11 = 136446722;
    sub_25E77CF40(0xD000000000000041, 0x800000025E7BFD20, &aBlock);
    sub_25E7BC520();
    *(_WORD *)(v11 + 12) = 2082;
    swift_bridgeObjectRetain();
    uint64_t v12 = a3;
    uint64_t v13 = sub_25E7BC3A0();
    unint64_t v15 = v14;
    swift_bridgeObjectRelease();
    uint64_t v16 = v13;
    a3 = v12;
    sub_25E77CF40(v16, v15, &aBlock);
    sub_25E7BC520();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v11 + 22) = 1024;
    sub_25E7BC520();
    _os_log_impl(&dword_25E775000, v9, v10, "%{public}s invoked with inEvent: %{public}s, withEncryption: %{BOOL}d", (uint8_t *)v11, 0x1Cu);
    swift_arrayDestroy();
    MEMORY[0x2611E3480](v40, -1, -1);
    uint64_t v17 = v11;
    a2 = v43;
    MEMORY[0x2611E3480](v17, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  uint64_t v18 = *(void **)(v5 + OBJC_IVAR___WFSetupServerInternal_sfSession);
  if (v18)
  {
    if (a3)
    {
      uint64_t v19 = swift_allocObject();
      *(void *)(v19 + 16) = a3;
      *(void *)(v19 + 24) = a4;
      uint64_t v20 = (uint64_t (*)())sub_25E796AB8;
    }
    else
    {
      uint64_t v20 = nullsub_1;
      uint64_t v19 = 0;
    }
    uint64_t v26 = (uint64_t)a3;
    uint64_t v27 = swift_allocObject();
    *(void *)(v27 + 16) = v20;
    *(void *)(v27 + 24) = v19;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A706D80);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_25E7BDF10;
    uint64_t aBlock = 0xD000000000000010;
    unint64_t v45 = 0x800000025E7BFCC0;
    id v41 = v18;
    sub_25E785E00(v26);
    sub_25E7BC580();
    *(void *)(inited + 96) = MEMORY[0x263F8D4F8];
    *(unsigned char *)(inited + 72) = (a2 & 1) == 0;
    sub_25E7885A8(inited);
    swift_bridgeObjectRetain_n();
    long long v29 = sub_25E7BC2C0();
    os_log_type_t v30 = sub_25E7BC4A0();
    if (os_log_type_enabled(v29, v30))
    {
      uint64_t v31 = swift_slowAlloc();
      uint64_t v32 = swift_slowAlloc();
      uint64_t aBlock = v32;
      *(_DWORD *)uint64_t v31 = 136446466;
      swift_bridgeObjectRetain();
      uint64_t v33 = sub_25E7BC3A0();
      unint64_t v35 = v34;
      swift_bridgeObjectRelease();
      sub_25E77CF40(v33, v35, &aBlock);
      sub_25E7BC520();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v31 + 12) = 1024;
      sub_25E7BC520();
      _os_log_impl(&dword_25E775000, v29, v30, "Sending interaction event: %{public}s, withEncryption: %{BOOL}d", (uint8_t *)v31, 0x12u);
      swift_arrayDestroy();
      MEMORY[0x2611E3480](v32, -1, -1);
      MEMORY[0x2611E3480](v31, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    uint64_t v36 = (void *)sub_25E7BC3D0();
    uint64_t v37 = (void *)sub_25E7BC370();
    swift_bridgeObjectRelease();
    uint64_t v38 = (void *)sub_25E7BC370();
    uint64_t v48 = sub_25E796AB4;
    uint64_t v49 = v27;
    uint64_t aBlock = MEMORY[0x263EF8330];
    unint64_t v45 = 1107296256;
    os_log_type_t v46 = sub_25E788D3C;
    uint64_t v47 = &block_descriptor_23;
    long long v39 = _Block_copy(&aBlock);
    swift_retain();
    swift_release();
    objc_msgSend(v41, sel_sendRequestID_options_request_responseHandler_, v36, v37, v38, v39);
    _Block_release(v39);

    swift_release();
  }
  else
  {
    unint64_t v21 = sub_25E7BC2C0();
    os_log_type_t v22 = sub_25E7BC490();
    if (os_log_type_enabled(v21, v22))
    {
      char v23 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)char v23 = 0;
      _os_log_impl(&dword_25E775000, v21, v22, "Failed to send object to server. SfSession is not available. ", v23, 2u);
      MEMORY[0x2611E3480](v23, -1, -1);
    }

    if (a3)
    {
      sub_25E796844();
      unint64_t v24 = (void *)swift_allocError();
      *BOOL v25 = 0;
      a3(v24, 0, 0);
    }
  }
}

void WFSetupServer.startSecureChannelPairing(with:context:completion:)(int a1, void *a2, void (*a3)(void, void), unsigned char *a4)
{
  uint64_t v5 = v4;
  int v98 = a1;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A706998);
  uint64_t v11 = MEMORY[0x270FA5388](v9 - 8, v10);
  v97 = &v89[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v11, v13);
  uint64_t v99 = &v89[-v14];
  uint64_t v15 = sub_25E7BC280();
  uint64_t v16 = *(void *)(v15 - 8);
  MEMORY[0x270FA5388](v15, v17);
  uint64_t v19 = &v89[-((v18 + 15) & 0xFFFFFFFFFFFFFFF0)];
  if (qword_26A7065D0 != -1) {
    swift_once();
  }
  uint64_t v20 = sub_25E7BC2E0();
  uint64_t v21 = __swift_project_value_buffer(v20, (uint64_t)qword_26A7089F8);
  swift_bridgeObjectRetain_n();
  uint64_t v100 = (uint8_t *)v21;
  os_log_type_t v22 = sub_25E7BC2C0();
  os_log_type_t v23 = sub_25E7BC4A0();
  int v24 = v23;
  BOOL v25 = os_log_type_enabled(v22, v23);
  v93 = a2;
  if (v25)
  {
    uint64_t v26 = swift_slowAlloc();
    uint64_t v91 = swift_slowAlloc();
    uint64_t v102 = v91;
    *(_DWORD *)uint64_t v26 = 136446722;
    unsigned int v96 = v19;
    uint64_t v101 = sub_25E77CF40(0xD000000000000033, 0x800000025E7BFD70, &v102);
    uint64_t v94 = v5;
    uint64_t v95 = v16;
    sub_25E7BC520();
    *(_WORD *)(v26 + 12) = 1024;
    LODWORD(v101) = v98 & 1;
    sub_25E7BC520();
    *(_WORD *)(v26 + 18) = 2080;
    swift_bridgeObjectRetain();
    uint64_t v92 = v15;
    uint64_t v27 = sub_25E7BC3A0();
    int v90 = v24;
    long long v28 = a4;
    long long v29 = a3;
    unint64_t v31 = v30;
    swift_bridgeObjectRelease();
    uint64_t v32 = v27;
    uint64_t v5 = v94;
    uint64_t v101 = sub_25E77CF40(v32, v31, &v102);
    uint64_t v16 = v95;
    uint64_t v19 = v96;
    sub_25E7BC520();
    swift_bridgeObjectRelease_n();
    a3 = v29;
    a4 = v28;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25E775000, v22, (os_log_type_t)v90, "%{public}s invoked with reset flag: %{BOOL}d and context: %s", (uint8_t *)v26, 0x1Cu);
    uint64_t v33 = v91;
    uint64_t v15 = v92;
    swift_arrayDestroy();
    MEMORY[0x2611E3480](v33, -1, -1);
    MEMORY[0x2611E3480](v26, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  unint64_t v34 = *(void **)(v5 + OBJC_IVAR___WFSetupServerInternal_sfSession);
  if (v34)
  {
    id v35 = v34;
    id v36 = objc_msgSend(v35, sel_peerDevice);
    if (!v36)
    {
      uint64_t v41 = (uint64_t)v99;
      (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(v16 + 56))(v99, 1, 1, v15);
LABEL_16:
      sub_25E784970(v41, &qword_26A706998);
      int v50 = sub_25E7BC2C0();
      os_log_type_t v51 = sub_25E7BC490();
      if (os_log_type_enabled(v50, v51))
      {
        unint64_t v52 = (uint8_t *)swift_slowAlloc();
        uint64_t v53 = (void *)swift_slowAlloc();
        *(_DWORD *)unint64_t v52 = 138412290;
        sub_25E796844();
        swift_allocError();
        *uint64_t v54 = 4;
        uint64_t v55 = _swift_stdlib_bridgeErrorToNSError();
        uint64_t v102 = v55;
        sub_25E7BC520();
        *uint64_t v53 = v55;
        _os_log_impl(&dword_25E775000, v50, v51, "Failed to start pair setup session due to error: %@", v52, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A7069B0);
        swift_arrayDestroy();
        MEMORY[0x2611E3480](v53, -1, -1);
        MEMORY[0x2611E3480](v52, -1, -1);
      }

      sub_25E796844();
      objc_super v56 = (void *)swift_allocError();
      void *v57 = 4;
      a3(v56, 0);

      return;
    }
    uint64_t v37 = v36;
    id v38 = objc_msgSend(v36, sel_identifier);

    if (v38)
    {
      uint64_t v39 = (uint64_t)v97;
      sub_25E7BC270();

      uint64_t v40 = 0;
      uint64_t v41 = (uint64_t)v99;
    }
    else
    {
      uint64_t v40 = 1;
      uint64_t v41 = (uint64_t)v99;
      uint64_t v39 = (uint64_t)v97;
    }
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v16 + 56))(v39, v40, 1, v15);
    sub_25E79721C(v39, v41, &qword_26A706998);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v16 + 48))(v41, 1, v15) == 1) {
      goto LABEL_16;
    }
    uint64_t v99 = a4;
    (*(void (**)(unsigned char *, uint64_t, uint64_t))(v16 + 32))(v19, v41, v15);
    unint64_t v58 = *(void **)(v5 + OBJC_IVAR___WFSetupServerInternal_sfService);
    if (v58)
    {
      uint64_t v59 = v5 + OBJC_IVAR___WFSetupServerInternal_serverState;
      uint64_t v60 = *(unsigned __int8 *)(v5 + OBJC_IVAR___WFSetupServerInternal_serverState + 3);
      unsigned int v96 = v19;
      switch(v60)
      {
        case 2:
          id v70 = v58;
          swift_bridgeObjectRelease();
          goto LABEL_26;
        default:
          uint64_t v94 = v5;
          char v71 = sub_25E7BC6D0();
          id v72 = v58;
          swift_bridgeObjectRelease();
          if (v71)
          {
LABEL_26:
            id v73 = sub_25E7BC2C0();
            os_log_type_t v74 = sub_25E7BC490();
            if (os_log_type_enabled(v73, v74))
            {
              uint64_t v95 = v16;
              uint64_t v75 = (uint8_t *)swift_slowAlloc();
              unsigned int v76 = (void *)swift_slowAlloc();
              *(_DWORD *)uint64_t v75 = 138412290;
              uint64_t v100 = v75 + 4;
              sub_25E796844();
              swift_allocError();
              *uint64_t v77 = 5;
              uint64_t v78 = v15;
              uint64_t v79 = _swift_stdlib_bridgeErrorToNSError();
              uint64_t v102 = v79;
              sub_25E7BC520();
              void *v76 = v79;
              uint64_t v15 = v78;
              uint64_t v16 = v95;
              _os_log_impl(&dword_25E775000, v73, v74, "Attempting to start secure session pairing process while a secure session has already been established: %@", v75, 0xCu);
              __swift_instantiateConcreteTypeFromMangledName(&qword_26A7069B0);
              swift_arrayDestroy();
              MEMORY[0x2611E3480](v76, -1, -1);
              MEMORY[0x2611E3480](v75, -1, -1);
            }

            sub_25E796844();
            unint64_t v80 = (void *)swift_allocError();
            void *v81 = 5;
            a3(v80, 0);

            (*(void (**)(unsigned char *, uint64_t))(v16 + 8))(v96, v15);
          }
          else
          {
            uint64_t v95 = v16;
            if (v98)
            {
              v82 = sub_25E7BC2C0();
              os_log_type_t v83 = sub_25E7BC4A0();
              if (os_log_type_enabled(v82, v83))
              {
                v84 = (uint8_t *)swift_slowAlloc();
                *(_WORD *)v84 = 0;
                _os_log_impl(&dword_25E775000, v82, v83, "Received reset pairing flag. ", v84, 2u);
                MEMORY[0x2611E3480](v84, -1, -1);
              }

              *(unsigned char *)(v59 + 3) = 4;
              v85 = v93;
              sub_25E78CDEC(8uLL, v93, (void (*)(void, void, void))sub_25E78A3A0, 0);
              uint64_t v86 = 524312;
              int v87 = v96;
            }
            else
            {
              uint64_t v86 = 24;
              int v87 = v96;
              v85 = v93;
            }
            *(unsigned char *)(v59 + 3) = 1;
            sub_25E78CDEC(5uLL, v85, (void (*)(void, void, void))sub_25E78A3B0, 0);
            v88 = (void *)sub_25E7BC260();
            objc_msgSend(v72, sel_pairSetupWithFlags_peer_, v86, v88);

            a3(0, 1);
            (*(void (**)(unsigned char *, uint64_t))(v95 + 8))(v87, v15);
          }
          break;
      }
    }
    else
    {
      id v61 = sub_25E7BC2C0();
      os_log_type_t v62 = sub_25E7BC490();
      if (os_log_type_enabled(v61, v62))
      {
        uint64_t v95 = v16;
        uint64_t v63 = (uint8_t *)swift_slowAlloc();
        uint64_t v64 = (void *)swift_slowAlloc();
        unsigned int v96 = v19;
        *(_DWORD *)uint64_t v63 = 138412290;
        sub_25E796844();
        swift_allocError();
        void *v65 = 1;
        uint64_t v66 = v15;
        uint64_t v67 = _swift_stdlib_bridgeErrorToNSError();
        uint64_t v102 = v67;
        uint64_t v16 = v95;
        uint64_t v19 = v96;
        sub_25E7BC520();
        *uint64_t v64 = v67;
        uint64_t v15 = v66;
        _os_log_impl(&dword_25E775000, v61, v62, "Failed to start pair setup session due to error: %@", v63, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A7069B0);
        swift_arrayDestroy();
        MEMORY[0x2611E3480](v64, -1, -1);
        MEMORY[0x2611E3480](v63, -1, -1);
      }

      sub_25E796844();
      uint64_t v68 = (void *)swift_allocError();
      void *v69 = 1;
      a3(v68, 0);

      (*(void (**)(unsigned char *, uint64_t))(v16 + 8))(v19, v15);
    }
  }
  else
  {
    os_log_type_t v42 = sub_25E7BC2C0();
    os_log_type_t v43 = sub_25E7BC490();
    if (os_log_type_enabled(v42, v43))
    {
      uint64_t v44 = (uint8_t *)swift_slowAlloc();
      unint64_t v45 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v44 = 138412290;
      sub_25E796844();
      swift_allocError();
      *os_log_type_t v46 = 0;
      uint64_t v47 = _swift_stdlib_bridgeErrorToNSError();
      uint64_t v102 = v47;
      sub_25E7BC520();
      *unint64_t v45 = v47;
      _os_log_impl(&dword_25E775000, v42, v43, "Failed to start pair setup session due to no available SFSession: %@", v44, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A7069B0);
      swift_arrayDestroy();
      MEMORY[0x2611E3480](v45, -1, -1);
      MEMORY[0x2611E3480](v44, -1, -1);
    }

    sub_25E796844();
    uint64_t v48 = (void *)swift_allocError();
    *uint64_t v49 = 0;
    a3(v48, 0);
  }
}

void sub_25E78A3A0(void *a1, uint64_t a2, uint64_t a3)
{
}

void sub_25E78A3B0(void *a1, uint64_t a2, uint64_t a3)
{
}

void sub_25E78A3C0(void *a1, uint64_t a2, uint64_t a3, unint64_t a4, const char *a5)
{
  if (a1)
  {
    id v7 = a1;
    if (qword_26A7065D0 != -1) {
      swift_once();
    }
    uint64_t v8 = sub_25E7BC2E0();
    __swift_project_value_buffer(v8, (uint64_t)qword_26A7089F8);
    id v9 = a1;
    id v10 = a1;
    oslog = sub_25E7BC2C0();
    os_log_type_t v11 = sub_25E7BC490();
    if (os_log_type_enabled(oslog, v11))
    {
      uint64_t v12 = swift_slowAlloc();
      uint64_t v13 = swift_slowAlloc();
      uint64_t v30 = v13;
      *(_DWORD *)uint64_t v12 = 136446466;
      uint64_t v14 = WFSetupProgressEventToString(a4);
      uint64_t v15 = sub_25E7BC3E0();
      unint64_t v17 = v16;

      sub_25E77CF40(v15, v17, &v30);
      sub_25E7BC520();
      swift_bridgeObjectRelease();
      *(_WORD *)(v12 + 12) = 2082;
      swift_getErrorValue();
      uint64_t v18 = sub_25E7BC720();
      sub_25E77CF40(v18, v19, &v30);
      sub_25E7BC520();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_25E775000, oslog, v11, "Failed to send over event: (%{public}s, with error: %{public}s", (uint8_t *)v12, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x2611E3480](v13, -1, -1);
      MEMORY[0x2611E3480](v12, -1, -1);

      return;
    }
  }
  else
  {
    if (qword_26A7065D0 != -1) {
      swift_once();
    }
    uint64_t v21 = sub_25E7BC2E0();
    __swift_project_value_buffer(v21, (uint64_t)qword_26A7089F8);
    oslog = sub_25E7BC2C0();
    os_log_type_t v22 = sub_25E7BC4A0();
    if (os_log_type_enabled(oslog, v22))
    {
      os_log_type_t v23 = (uint8_t *)swift_slowAlloc();
      uint64_t v24 = swift_slowAlloc();
      uint64_t v30 = v24;
      *(_DWORD *)os_log_type_t v23 = 136315138;
      BOOL v25 = WFSetupProgressEventToString(a4);
      uint64_t v26 = sub_25E7BC3E0();
      unint64_t v28 = v27;

      sub_25E77CF40(v26, v28, &v30);
      sub_25E7BC520();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25E775000, oslog, v22, a5, v23, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2611E3480](v24, -1, -1);
      MEMORY[0x2611E3480](v23, -1, -1);

      return;
    }
  }
}

void sub_25E78A84C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1) {
    uint64_t v4 = sub_25E7BC1D0();
  }
  else {
    uint64_t v4 = 0;
  }
  id v5 = (id)v4;
  (*(void (**)(uint64_t))(a3 + 16))(a3);
}

void WFSetupServer.startSecureChannelPairing(with:completion:)(int a1, void (*a2)(void, void), uint64_t a3)
{
  uint64_t v4 = v3;
  int v91 = a1;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A706998);
  uint64_t v9 = MEMORY[0x270FA5388](v7 - 8, v8);
  uint64_t v94 = (char *)&v89 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9, v11);
  uint64_t v13 = (char *)&v89 - v12;
  uint64_t v14 = sub_25E7BC280();
  uint64_t v15 = *(void *)(v14 - 8);
  MEMORY[0x270FA5388](v14, v16);
  uint64_t v18 = (char *)&v89 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26A7065D0 != -1) {
    swift_once();
  }
  uint64_t v19 = sub_25E7BC2E0();
  uint64_t v93 = __swift_project_value_buffer(v19, (uint64_t)qword_26A7089F8);
  uint64_t v20 = sub_25E7BC2C0();
  os_log_type_t v21 = sub_25E7BC4A0();
  BOOL v22 = os_log_type_enabled(v20, v21);
  uint64_t v92 = v13;
  if (v22)
  {
    uint64_t v23 = swift_slowAlloc();
    uint64_t v24 = swift_slowAlloc();
    uint64_t v90 = v15;
    uint64_t v25 = v24;
    uint64_t v96 = v24;
    *(_DWORD *)uint64_t v23 = 136446466;
    uint64_t v95 = sub_25E77CF40(0xD00000000000002BLL, 0x800000025E7BFDB0, &v96);
    sub_25E7BC520();
    *(_WORD *)(v23 + 12) = 1024;
    LODWORD(v95) = v91 & 1;
    sub_25E7BC520();
    _os_log_impl(&dword_25E775000, v20, v21, "%{public}s invoked with reset flag: %{BOOL}d", (uint8_t *)v23, 0x12u);
    swift_arrayDestroy();
    uint64_t v26 = v25;
    uint64_t v15 = v90;
    MEMORY[0x2611E3480](v26, -1, -1);
    MEMORY[0x2611E3480](v23, -1, -1);
  }

  unint64_t v27 = *(void **)&v3[OBJC_IVAR___WFSetupServerInternal_sfSession];
  uint64_t v28 = (uint64_t)v94;
  if (v27)
  {
    id v29 = v27;
    id v30 = objc_msgSend(v29, sel_peerDevice);
    if (!v30)
    {
      uint64_t v42 = (uint64_t)v92;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v15 + 56))(v92, 1, 1, v14);
LABEL_15:
      sub_25E784970(v42, &qword_26A706998);
      os_log_type_t v43 = sub_25E7BC2C0();
      os_log_type_t v44 = sub_25E7BC490();
      if (os_log_type_enabled(v43, v44))
      {
        unint64_t v45 = (uint8_t *)swift_slowAlloc();
        os_log_type_t v46 = (void *)swift_slowAlloc();
        *(_DWORD *)unint64_t v45 = 138412290;
        sub_25E796844();
        swift_allocError();
        *uint64_t v47 = 4;
        uint64_t v48 = a2;
        uint64_t v49 = _swift_stdlib_bridgeErrorToNSError();
        uint64_t v96 = v49;
        sub_25E7BC520();
        *os_log_type_t v46 = v49;
        a2 = v48;
        _os_log_impl(&dword_25E775000, v43, v44, "Failed to start pair setup session due to error: %@", v45, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A7069B0);
        swift_arrayDestroy();
        MEMORY[0x2611E3480](v46, -1, -1);
        MEMORY[0x2611E3480](v45, -1, -1);
      }

      sub_25E796844();
      int v50 = (void *)swift_allocError();
      *os_log_type_t v51 = 4;
      a2(v50, 0);

      return;
    }
    unint64_t v31 = v30;
    id v32 = objc_msgSend(v30, sel_identifier);

    if (v32)
    {
      sub_25E7BC270();

      uint64_t v33 = 0;
    }
    else
    {
      uint64_t v33 = 1;
    }
    uint64_t v42 = (uint64_t)v92;
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v15 + 56))(v28, v33, 1, v14);
    sub_25E79721C(v28, v42, &qword_26A706998);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v15 + 48))(v42, 1, v14) == 1) {
      goto LABEL_15;
    }
    (*(void (**)(char *, uint64_t, uint64_t))(v15 + 32))(v18, v42, v14);
    unint64_t v52 = v4;
    uint64_t v53 = *(void **)&v4[OBJC_IVAR___WFSetupServerInternal_sfService];
    if (v53)
    {
      uint64_t v90 = v15;
      uint64_t v92 = v52;
      uint64_t v54 = &v52[OBJC_IVAR___WFSetupServerInternal_serverState];
      uint64_t v55 = v52[OBJC_IVAR___WFSetupServerInternal_serverState + 3];
      uint64_t v94 = v18;
      switch(v55)
      {
        case 2:
          id v67 = v53;
          swift_bridgeObjectRelease();
          goto LABEL_25;
        default:
          char v68 = sub_25E7BC6D0();
          id v69 = v53;
          swift_bridgeObjectRelease();
          if (v68)
          {
LABEL_25:
            id v70 = sub_25E7BC2C0();
            os_log_type_t v71 = sub_25E7BC490();
            if (os_log_type_enabled(v70, v71))
            {
              uint64_t v93 = a3;
              uint64_t v72 = swift_slowAlloc();
              uint64_t v92 = (char *)v14;
              id v73 = (uint8_t *)v72;
              os_log_type_t v74 = (void *)swift_slowAlloc();
              *(_DWORD *)id v73 = 138412290;
              sub_25E796844();
              swift_allocError();
              *uint64_t v75 = 5;
              uint64_t v76 = _swift_stdlib_bridgeErrorToNSError();
              uint64_t v96 = v76;
              sub_25E7BC520();
              void *v74 = v76;
              _os_log_impl(&dword_25E775000, v70, v71, "Attempting to start secure session pairing process while a secure session has already been established: %@", v73, 0xCu);
              __swift_instantiateConcreteTypeFromMangledName(&qword_26A7069B0);
              swift_arrayDestroy();
              MEMORY[0x2611E3480](v74, -1, -1);
              uint64_t v77 = v73;
              uint64_t v14 = (uint64_t)v92;
              MEMORY[0x2611E3480](v77, -1, -1);
            }

            sub_25E796844();
            uint64_t v78 = (void *)swift_allocError();
            *uint64_t v79 = 5;
            a2(v78, 0);

            (*(void (**)(char *, uint64_t))(v90 + 8))(v94, v14);
          }
          else
          {
            if (v91)
            {
              unint64_t v80 = sub_25E7BC2C0();
              os_log_type_t v81 = sub_25E7BC4A0();
              if (os_log_type_enabled(v80, v81))
              {
                v82 = (uint8_t *)swift_slowAlloc();
                *(_WORD *)v82 = 0;
                _os_log_impl(&dword_25E775000, v80, v81, "Received reset pairing flag. ", v82, 2u);
                MEMORY[0x2611E3480](v82, -1, -1);
              }

              v54[3] = 4;
              os_log_type_t v83 = (void *)sub_25E7886EC(MEMORY[0x263F8EE78]);
              sub_25E78CDEC(8uLL, v83, (void (*)(void, void, void))sub_25E78B520, 0);
              swift_bridgeObjectRelease();
              uint64_t v84 = 524312;
            }
            else
            {
              uint64_t v84 = 24;
            }
            v54[3] = 1;
            v85 = (void *)sub_25E7886EC(MEMORY[0x263F8EE78]);
            uint64_t v86 = swift_allocObject();
            *(void *)(v86 + 16) = a2;
            *(void *)(v86 + 24) = a3;
            swift_retain();
            sub_25E78CDEC(5uLL, v85, (void (*)(void, void, void))sub_25E796ABC, v86);
            swift_bridgeObjectRelease();
            swift_release();
            int v87 = v94;
            v88 = (void *)sub_25E7BC260();
            objc_msgSend(v69, sel_pairSetupWithFlags_peer_, v84, v88);

            a2(0, 1);
            (*(void (**)(char *, uint64_t))(v90 + 8))(v87, v14);
          }
          break;
      }
    }
    else
    {
      objc_super v56 = sub_25E7BC2C0();
      os_log_type_t v57 = sub_25E7BC490();
      if (os_log_type_enabled(v56, v57))
      {
        uint64_t v93 = a3;
        unint64_t v58 = (uint8_t *)swift_slowAlloc();
        uint64_t v59 = swift_slowAlloc();
        uint64_t v90 = v15;
        uint64_t v60 = (void *)v59;
        uint64_t v92 = (char *)v14;
        *(_DWORD *)unint64_t v58 = 138412290;
        sub_25E796844();
        swift_allocError();
        *id v61 = 1;
        os_log_type_t v62 = v18;
        uint64_t v63 = _swift_stdlib_bridgeErrorToNSError();
        uint64_t v96 = v63;
        uint64_t v14 = (uint64_t)v92;
        sub_25E7BC520();
        void *v60 = v63;
        uint64_t v18 = v62;
        _os_log_impl(&dword_25E775000, v56, v57, "Failed to start pair setup session due to error: %@", v58, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A7069B0);
        swift_arrayDestroy();
        uint64_t v64 = v60;
        uint64_t v15 = v90;
        MEMORY[0x2611E3480](v64, -1, -1);
        MEMORY[0x2611E3480](v58, -1, -1);
      }

      sub_25E796844();
      os_log_type_t v65 = (void *)swift_allocError();
      *uint64_t v66 = 1;
      a2(v65, 0);

      (*(void (**)(char *, uint64_t))(v15 + 8))(v18, v14);
    }
  }
  else
  {
    unint64_t v34 = sub_25E7BC2C0();
    os_log_type_t v35 = sub_25E7BC490();
    if (os_log_type_enabled(v34, v35))
    {
      id v36 = (uint8_t *)swift_slowAlloc();
      uint64_t v37 = (void *)swift_slowAlloc();
      *(_DWORD *)id v36 = 138412290;
      sub_25E796844();
      swift_allocError();
      *id v38 = 0;
      uint64_t v39 = _swift_stdlib_bridgeErrorToNSError();
      uint64_t v96 = v39;
      sub_25E7BC520();
      *uint64_t v37 = v39;
      _os_log_impl(&dword_25E775000, v34, v35, "Failed to start pair setup session due to no available SFSession: %@", v36, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A7069B0);
      swift_arrayDestroy();
      MEMORY[0x2611E3480](v37, -1, -1);
      MEMORY[0x2611E3480](v36, -1, -1);
    }

    sub_25E796844();
    uint64_t v40 = (void *)swift_allocError();
    *uint64_t v41 = 0;
    a2(v40, 0);
  }
}

void sub_25E78B520(void *a1)
{
  if (a1)
  {
    id v2 = a1;
    if (qword_26A7065D0 != -1) {
      swift_once();
    }
    uint64_t v3 = sub_25E7BC2E0();
    __swift_project_value_buffer(v3, (uint64_t)qword_26A7089F8);
    oslog = sub_25E7BC2C0();
    os_log_type_t v4 = sub_25E7BC490();
    if (os_log_type_enabled(oslog, v4))
    {
      id v5 = (uint8_t *)swift_slowAlloc();
      uint64_t v6 = swift_slowAlloc();
      uint64_t v20 = v6;
      *(_DWORD *)id v5 = 136446210;
      uint64_t v7 = WFSetupProgressEventToString(8uLL);
      uint64_t v8 = sub_25E7BC3E0();
      unint64_t v10 = v9;

      sub_25E77CF40(v8, v10, &v20);
      sub_25E7BC520();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25E775000, oslog, v4, "Failed to send over event: (%{public}s", v5, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2611E3480](v6, -1, -1);
      MEMORY[0x2611E3480](v5, -1, -1);

LABEL_10:
      return;
    }
  }
  else
  {
    if (qword_26A7065D0 != -1) {
      swift_once();
    }
    uint64_t v11 = sub_25E7BC2E0();
    __swift_project_value_buffer(v11, (uint64_t)qword_26A7089F8);
    oslog = sub_25E7BC2C0();
    os_log_type_t v12 = sub_25E7BC4A0();
    if (os_log_type_enabled(oslog, v12))
    {
      uint64_t v13 = (uint8_t *)swift_slowAlloc();
      uint64_t v14 = swift_slowAlloc();
      uint64_t v20 = v14;
      *(_DWORD *)uint64_t v13 = 136446210;
      uint64_t v15 = WFSetupProgressEventToString(8uLL);
      uint64_t v16 = sub_25E7BC3E0();
      unint64_t v18 = v17;

      sub_25E77CF40(v16, v18, &v20);
      sub_25E7BC520();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25E775000, oslog, v12, "Successfully sent over event: (%{public}s", v13, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2611E3480](v14, -1, -1);
      MEMORY[0x2611E3480](v13, -1, -1);
      goto LABEL_10;
    }
  }
}

void sub_25E78B870(void *a1, uint64_t a2, uint64_t a3, NSObject *a4)
{
  if (a1)
  {
    id v6 = a1;
    if (qword_26A7065D0 != -1) {
      swift_once();
    }
    uint64_t v7 = sub_25E7BC2E0();
    __swift_project_value_buffer(v7, (uint64_t)qword_26A7089F8);
    uint64_t v8 = sub_25E7BC2C0();
    os_log_type_t v9 = sub_25E7BC490();
    if (os_log_type_enabled(v8, v9))
    {
      os_log_t osloga = a4;
      unint64_t v10 = (uint8_t *)swift_slowAlloc();
      uint64_t v11 = swift_slowAlloc();
      uint64_t v28 = v11;
      *(_DWORD *)unint64_t v10 = 136446210;
      os_log_type_t v12 = WFSetupProgressEventToString(5uLL);
      uint64_t v13 = sub_25E7BC3E0();
      unint64_t v15 = v14;

      uint64_t v16 = v13;
      a4 = osloga;
      sub_25E77CF40(v16, v15, &v28);
      sub_25E7BC520();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25E775000, v8, v9, "Failed to send over event: (%{public}s)", v10, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2611E3480](v11, -1, -1);
      MEMORY[0x2611E3480](v10, -1, -1);
    }

    id v17 = a1;
    ((void (*)(void *, void))a4)(a1, 0);
  }
  else
  {
    if (qword_26A7065D0 != -1) {
      swift_once();
    }
    uint64_t v18 = sub_25E7BC2E0();
    __swift_project_value_buffer(v18, (uint64_t)qword_26A7089F8);
    oslog = sub_25E7BC2C0();
    os_log_type_t v19 = sub_25E7BC4A0();
    if (os_log_type_enabled(oslog, v19))
    {
      uint64_t v20 = (uint8_t *)swift_slowAlloc();
      uint64_t v21 = swift_slowAlloc();
      uint64_t v28 = v21;
      *(_DWORD *)uint64_t v20 = 136446210;
      BOOL v22 = WFSetupProgressEventToString(5uLL);
      uint64_t v23 = sub_25E7BC3E0();
      unint64_t v25 = v24;

      sub_25E77CF40(v23, v25, &v28);
      sub_25E7BC520();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25E775000, oslog, v19, "Successfully sent over event: (%{public}s)", v20, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2611E3480](v21, -1, -1);
      MEMORY[0x2611E3480](v20, -1, -1);
    }
    else
    {
    }
  }
}

Swift::Void __swiftcall WFSetupServer.tryPin(_:)(Swift::String a1)
{
  uint64_t v2 = v1;
  Swift::String v87 = a1;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A706998);
  uint64_t v5 = MEMORY[0x270FA5388](v3 - 8, v4);
  uint64_t v7 = (char *)&v85 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5, v8);
  unint64_t v10 = (char *)&v85 - v9;
  uint64_t v11 = sub_25E7BC280();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v14 = MEMORY[0x270FA5388](v11, v13);
  uint64_t v16 = (char *)&v85 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14, v17);
  os_log_type_t v19 = (char *)&v85 - v18;
  if (qword_26A7065D0 != -1) {
    swift_once();
  }
  uint64_t v20 = sub_25E7BC2E0();
  uint64_t v89 = __swift_project_value_buffer(v20, (uint64_t)qword_26A7089F8);
  uint64_t v21 = sub_25E7BC2C0();
  os_log_type_t v22 = sub_25E7BC4A0();
  BOOL v23 = os_log_type_enabled(v21, v22);
  v88 = v7;
  if (v23)
  {
    uint64_t v24 = swift_slowAlloc();
    v85 = v10;
    unint64_t v25 = (uint8_t *)v24;
    uint64_t v26 = swift_slowAlloc();
    uint64_t v86 = v12;
    uint64_t v27 = v26;
    v91[0] = v26;
    *(_DWORD *)unint64_t v25 = 136446210;
    uint64_t v90 = sub_25E77CF40(0x5F286E6950797274, 0xEA0000000000293ALL, v91);
    sub_25E7BC520();
    _os_log_impl(&dword_25E775000, v21, v22, "%{public}s invoked to validate pin.", v25, 0xCu);
    swift_arrayDestroy();
    uint64_t v28 = v27;
    uint64_t v12 = v86;
    MEMORY[0x2611E3480](v28, -1, -1);
    id v29 = v25;
    unint64_t v10 = v85;
    MEMORY[0x2611E3480](v29, -1, -1);
  }

  id v30 = *(void **)(v1 + OBJC_IVAR___WFSetupServerInternal_sfSession);
  if (!v30)
  {
    uint64_t v37 = sub_25E7BC2C0();
    os_log_type_t v38 = sub_25E7BC490();
    if (os_log_type_enabled(v37, v38))
    {
      uint64_t v39 = v2;
      uint64_t v40 = (uint8_t *)swift_slowAlloc();
      uint64_t v41 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v40 = 138412290;
      sub_25E796844();
      swift_allocError();
      *uint64_t v42 = 0;
      uint64_t v43 = _swift_stdlib_bridgeErrorToNSError();
      v91[0] = v43;
      sub_25E7BC520();
      *uint64_t v41 = v43;
      _os_log_impl(&dword_25E775000, v37, v38, "Failed to start pair setup session due to no available SFSession: %@", v40, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A7069B0);
      swift_arrayDestroy();
      MEMORY[0x2611E3480](v41, -1, -1);
      os_log_type_t v44 = v40;
      uint64_t v2 = v39;
      MEMORY[0x2611E3480](v44, -1, -1);
    }

    sub_25E78314C(0, (unint64_t *)&qword_26A706DF0);
    unint64_t v45 = (void *)sub_25E7BC480();
    uint64_t v46 = v2 + OBJC_IVAR___WFSetupServerInternal_setupProgressEventHandler;
    swift_beginAccess();
    uint64_t v48 = *(void (**)(void, void))v46;
    uint64_t v47 = *(void *)(v46 + 8);
    sub_25E785E00((uint64_t)v48);
    sub_25E7ADD10(7uLL, v45, 1, v48, v47);
    sub_25E785F38((uint64_t)v48);
    goto LABEL_18;
  }
  id v31 = v30;
  id v32 = objc_msgSend(v31, sel_peerDevice);
  if (!v32)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v12 + 56))(v10, 1, 1, v11);
LABEL_15:
    sub_25E784970((uint64_t)v10, &qword_26A706998);
    uint64_t v49 = sub_25E7BC2C0();
    os_log_type_t v50 = sub_25E7BC490();
    if (os_log_type_enabled(v49, v50))
    {
      uint64_t v51 = v2;
      unint64_t v52 = (uint8_t *)swift_slowAlloc();
      uint64_t v53 = (void *)swift_slowAlloc();
      *(_DWORD *)unint64_t v52 = 138412290;
      sub_25E796844();
      swift_allocError();
      *uint64_t v54 = 4;
      uint64_t v55 = _swift_stdlib_bridgeErrorToNSError();
      v91[0] = v55;
      sub_25E7BC520();
      *uint64_t v53 = v55;
      _os_log_impl(&dword_25E775000, v49, v50, "Failed to start pair setup session due to error: %@", v52, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A7069B0);
      swift_arrayDestroy();
      MEMORY[0x2611E3480](v53, -1, -1);
      objc_super v56 = v52;
      uint64_t v2 = v51;
      MEMORY[0x2611E3480](v56, -1, -1);
    }

    sub_25E78314C(0, (unint64_t *)&qword_26A706DF0);
    unint64_t v45 = (void *)sub_25E7BC480();
    uint64_t v57 = v2 + OBJC_IVAR___WFSetupServerInternal_setupProgressEventHandler;
    swift_beginAccess();
    uint64_t v59 = *(void (**)(void, void))v57;
    uint64_t v58 = *(void *)(v57 + 8);
    sub_25E785E00((uint64_t)v59);
    sub_25E7ADD10(7uLL, v45, 1, v59, v58);
    sub_25E785F38((uint64_t)v59);

LABEL_18:
    return;
  }
  uint64_t v33 = v32;
  id v34 = objc_msgSend(v32, sel_identifier);

  if (v34)
  {
    id v35 = v88;
    sub_25E7BC270();

    uint64_t v36 = 0;
  }
  else
  {
    uint64_t v36 = 1;
    id v35 = v88;
  }
  (*(void (**)(id, uint64_t, uint64_t, uint64_t))(v12 + 56))(v35, v36, 1, v11);
  sub_25E79721C((uint64_t)v35, (uint64_t)v10, &qword_26A706998);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11) == 1) {
    goto LABEL_15;
  }
  (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v19, v10, v11);
  uint64_t v60 = *(void **)(v2 + OBJC_IVAR___WFSetupServerInternal_sfService);
  if (v60)
  {
    (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v16, v19, v11);
    v88 = v60;
    id v61 = v16;
    os_log_type_t v62 = sub_25E7BC2C0();
    os_log_type_t v63 = sub_25E7BC4A0();
    if (os_log_type_enabled(v62, v63))
    {
      uint64_t v64 = swift_slowAlloc();
      uint64_t v89 = (uint64_t)v19;
      os_log_type_t v65 = (uint8_t *)v64;
      uint64_t v86 = swift_slowAlloc();
      v91[0] = v86;
      *(_DWORD *)os_log_type_t v65 = 136315138;
      sub_25E799664(&qword_26A7069B8, MEMORY[0x263F07508]);
      uint64_t v66 = sub_25E7BC6B0();
      uint64_t v90 = sub_25E77CF40(v66, v67, v91);
      sub_25E7BC520();
      swift_bridgeObjectRelease();
      char v68 = *(void (**)(char *, uint64_t))(v12 + 8);
      v68(v61, v11);
      _os_log_impl(&dword_25E775000, v62, v63, "Authenticating pin with peer: %s", v65, 0xCu);
      uint64_t v69 = v86;
      swift_arrayDestroy();
      MEMORY[0x2611E3480](v69, -1, -1);
      id v70 = v65;
      os_log_type_t v19 = (char *)v89;
      MEMORY[0x2611E3480](v70, -1, -1);
    }
    else
    {
      char v68 = *(void (**)(char *, uint64_t))(v12 + 8);
      v68(v61, v11);
    }

    v82 = (void *)sub_25E7BC3D0();
    os_log_type_t v83 = (void *)sub_25E7BC260();
    id v84 = v88;
    objc_msgSend(v88, sel_pairSetupTryPIN_peer_, v82, v83);

    v68(v19, v11);
  }
  else
  {
    os_log_type_t v71 = sub_25E7BC2C0();
    os_log_type_t v72 = sub_25E7BC490();
    if (os_log_type_enabled(v71, v72))
    {
      uint64_t v89 = (uint64_t)v19;
      id v73 = (uint8_t *)swift_slowAlloc();
      v88 = (void *)swift_slowAlloc();
      *(_DWORD *)id v73 = 138412290;
      sub_25E796844();
      swift_allocError();
      void *v74 = 1;
      uint64_t v75 = v12;
      uint64_t v76 = _swift_stdlib_bridgeErrorToNSError();
      v91[0] = v76;
      os_log_type_t v19 = (char *)v89;
      sub_25E7BC520();
      uint64_t v77 = v88;
      void *v88 = v76;
      uint64_t v12 = v75;
      _os_log_impl(&dword_25E775000, v71, v72, "Failed to start pair setup session due to error: %@", v73, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A7069B0);
      swift_arrayDestroy();
      MEMORY[0x2611E3480](v77, -1, -1);
      MEMORY[0x2611E3480](v73, -1, -1);
    }

    sub_25E78314C(0, (unint64_t *)&qword_26A706DF0);
    uint64_t v78 = (void *)sub_25E7BC480();
    uint64_t v79 = v2 + OBJC_IVAR___WFSetupServerInternal_setupProgressEventHandler;
    swift_beginAccess();
    os_log_type_t v81 = *(void (**)(void, void))v79;
    uint64_t v80 = *(void *)(v79 + 8);
    sub_25E785E00((uint64_t)v81);
    sub_25E7ADD10(7uLL, v78, 1, v81, v80);

    sub_25E785F38((uint64_t)v81);
    (*(void (**)(char *, uint64_t))(v12 + 8))(v19, v11);
  }
}

uint64_t sub_25E78C7D8()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A706998);
  uint64_t v3 = MEMORY[0x270FA5388](v1, v2);
  uint64_t v5 = (char *)&v35[-1] - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = MEMORY[0x270FA5388](v3, v6);
  uint64_t v9 = (char *)&v35[-1] - v8;
  MEMORY[0x270FA5388](v7, v10);
  uint64_t v12 = (char *)&v35[-1] - v11;
  if (qword_26A7065D0 != -1) {
    swift_once();
  }
  uint64_t v13 = sub_25E7BC2E0();
  __swift_project_value_buffer(v13, (uint64_t)qword_26A7089F8);
  uint64_t v14 = v0;
  uint64_t v15 = sub_25E7BC2C0();
  os_log_type_t v16 = sub_25E7BC4A0();
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v17 = (uint8_t *)swift_slowAlloc();
    uint64_t v18 = swift_slowAlloc();
    v35[0] = v18;
    *(_DWORD *)uint64_t v17 = 136315138;
    os_log_type_t v19 = *(void **)&v14[OBJC_IVAR___WFSetupServerInternal_sfSession];
    if (v19)
    {
      id v20 = objc_msgSend(v19, sel_identifier);
      if (v20)
      {
        uint64_t v21 = v20;
        sub_25E7BC270();

        uint64_t v22 = sub_25E7BC280();
        (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(v9, 0, 1, v22);
      }
      else
      {
        uint64_t v24 = sub_25E7BC280();
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 56))(v9, 1, 1, v24);
      }
      sub_25E79721C((uint64_t)v9, (uint64_t)v12, &qword_26A706998);
    }
    else
    {
      uint64_t v23 = sub_25E7BC280();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56))(v12, 1, 1, v23);
    }
    uint64_t v25 = sub_25E7BC3F0();
    uint64_t v34 = sub_25E77CF40(v25, v26, v35);
    sub_25E7BC520();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25E775000, v15, v16, "Invalidating client session with identifier: %s", v17, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2611E3480](v18, -1, -1);
    MEMORY[0x2611E3480](v17, -1, -1);
  }
  else
  {
  }
  uint64_t v27 = *(void **)&v14[OBJC_IVAR___WFSetupServerInternal_resumeAuthTag];
  *(void *)&v14[OBJC_IVAR___WFSetupServerInternal_resumeAuthTag] = 0;

  uint64_t v28 = OBJC_IVAR___WFSetupServerInternal_sfSession;
  objc_msgSend(*(id *)&v14[OBJC_IVAR___WFSetupServerInternal_sfSession], sel_invalidate);
  id v29 = *(void **)&v14[v28];
  *(void *)&v14[v28] = 0;

  uint64_t v30 = sub_25E7BC280();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v30 - 8) + 56))(v5, 1, 1, v30);
  uint64_t v31 = (uint64_t)&v14[OBJC_IVAR___WFSetupServerInternal_peer];
  swift_beginAccess();
  sub_25E79971C((uint64_t)v5, v31);
  uint64_t result = swift_endAccess();
  uint64_t v33 = &v14[OBJC_IVAR___WFSetupServerInternal_serverState];
  v33[1] = 0;
  v33[3] = 0;
  return result;
}

void sub_25E78CBC8()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_25E7BC340();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2, v4);
  uint64_t v6 = (uint64_t *)((char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v7 = (void **)(v1 + OBJC_IVAR___WFSetupServerInternal_dispatchQueue);
  swift_beginAccess();
  uint64_t v8 = *v7;
  *uint64_t v6 = v8;
  (*(void (**)(void *, void, uint64_t))(v3 + 104))(v6, *MEMORY[0x263F8F0E0], v2);
  id v9 = v8;
  LOBYTE(v8) = sub_25E7BC360();
  (*(void (**)(void *, uint64_t))(v3 + 8))(v6, v2);
  if (v8)
  {
    if (qword_26A7065D0 == -1) {
      goto LABEL_3;
    }
  }
  else
  {
    __break(1u);
  }
  swift_once();
LABEL_3:
  uint64_t v10 = sub_25E7BC2E0();
  __swift_project_value_buffer(v10, (uint64_t)qword_26A7089F8);
  uint64_t v11 = sub_25E7BC2C0();
  os_log_type_t v12 = sub_25E7BC4A0();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v13 = 0;
    _os_log_impl(&dword_25E775000, v11, v12, "Running the server", v13, 2u);
    MEMORY[0x2611E3480](v13, -1, -1);
  }

  sub_25E798CF8(0xD000000000000013, 0x800000025E7C04F0, "FIXME: %{public}s Calling resume if needed");
  if (!*(void *)(v1 + OBJC_IVAR___WFSetupServerInternal_sfService)) {
    sub_25E78E488(0);
  }
}

void sub_25E78CDEC(unint64_t a1, void *a2, void (*a3)(void, void, void), uint64_t a4)
{
  uint64_t v5 = v4;
  if (qword_26A7065D0 != -1) {
    swift_once();
  }
  uint64_t v10 = sub_25E7BC2E0();
  __swift_project_value_buffer(v10, (uint64_t)qword_26A7089F8);
  uint64_t v11 = sub_25E7BC2C0();
  os_log_type_t v12 = sub_25E7BC4A0();
  uint64_t v86 = a2;
  unint64_t v89 = a1;
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = swift_slowAlloc();
    uint64_t v84 = swift_slowAlloc();
    uint64_t aBlock = v84;
    *(_DWORD *)uint64_t v13 = 136446466;
    sub_25E77CF40(0xD000000000000032, 0x800000025E7C0550, &aBlock);
    sub_25E7BC520();
    *(_WORD *)(v13 + 12) = 2080;
    uint64_t v14 = WFSetupProgressEventToString(a1);
    uint64_t v15 = sub_25E7BC3E0();
    uint64_t v16 = a4;
    unint64_t v18 = v17;

    *(void *)&long long v91 = sub_25E77CF40(v15, v18, &aBlock);
    sub_25E7BC520();
    a4 = v16;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25E775000, v11, v12, "%{public}s invoked with inEvent: %s)", (uint8_t *)v13, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x2611E3480](v84, -1, -1);
    MEMORY[0x2611E3480](v13, -1, -1);
  }

  os_log_type_t v19 = *(void **)(v5 + OBJC_IVAR___WFSetupServerInternal_sfSession);
  if (v19)
  {
    if (v89 > 0xF) {
      return;
    }
    if (((1 << v89) & 0xFE1F) != 0)
    {
      id v20 = v19;
      uint64_t v21 = sub_25E7BC2C0();
      os_log_type_t v22 = sub_25E7BC490();
      if (os_log_type_enabled(v21, v22))
      {
        uint64_t v23 = swift_slowAlloc();
        id v87 = (id)swift_slowAlloc();
        uint64_t aBlock = (uint64_t)v87;
        *(_DWORD *)uint64_t v23 = 136446466;
        sub_25E77CF40(0xD000000000000032, 0x800000025E7C0550, &aBlock);
        sub_25E7BC520();
        *(_WORD *)(v23 + 12) = 2082;
        uint64_t v24 = WFSetupProgressEventToString(v89);
        uint64_t v25 = sub_25E7BC3E0();
        unint64_t v26 = a3;
        unint64_t v28 = v27;

        *(void *)&long long v91 = sub_25E77CF40(v25, v28, &aBlock);
        sub_25E7BC520();
        a3 = v26;
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_25E775000, v21, v22, "%{public}s invoked with unexpected event: %{public}s. Only events related to secure channel should be sent through this method. ", (uint8_t *)v23, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x2611E3480](v87, -1, -1);
        MEMORY[0x2611E3480](v23, -1, -1);
      }

      if (a3)
      {
        sub_25E796844();
        uint64_t v29 = swift_allocError();
        *uint64_t v30 = 6;
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A706D80);
        uint64_t inited = swift_initStackObject();
        *(_OWORD *)(inited + 16) = xmmword_25E7BDF10;
        uint64_t aBlock = 0;
        unint64_t v94 = 0xE000000000000000;
        uint64_t v32 = MEMORY[0x263F8D310];
        sub_25E7BC580();
        *(void *)(inited + 96) = v32;
        *(void *)(inited + 72) = 0;
        *(void *)(inited + 80) = 0xE000000000000000;
        unint64_t v33 = sub_25E7885A8(inited);
        a3(v29, 0, v33);
        swift_bridgeObjectRelease();

        uint64_t v34 = (void *)v29;
LABEL_16:

        return;
      }
    }
    else
    {
      if (((1 << v89) & 0x1C0) != 0)
      {
        if (a3)
        {
          uint64_t v40 = swift_allocObject();
          *(void *)(v40 + 16) = a3;
          *(void *)(v40 + 24) = a4;
          uint64_t v41 = (uint64_t (*)())sub_25E796AB8;
        }
        else
        {
          uint64_t v41 = nullsub_1;
          uint64_t v40 = 0;
        }
        uint64_t v42 = swift_allocObject();
        *(void *)(v42 + 16) = v41;
        *(void *)(v42 + 24) = v40;
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A706D80);
        uint64_t v43 = swift_initStackObject();
        *(_OWORD *)(v43 + 16) = xmmword_25E7BDF10;
        uint64_t aBlock = 0xD000000000000010;
        unint64_t v94 = 0x800000025E7BFCC0;
        id v88 = v19;
        sub_25E785E00((uint64_t)a3);
        sub_25E7BC580();
        *(void *)(v43 + 96) = MEMORY[0x263F8D4F8];
        *(unsigned char *)(v43 + 72) = 1;
        sub_25E7885A8(v43);
        os_log_type_t v44 = sub_25E7BC2C0();
        os_log_type_t v45 = sub_25E7BC4A0();
        if (os_log_type_enabled(v44, v45))
        {
          uint64_t v46 = (uint8_t *)swift_slowAlloc();
          uint64_t v47 = swift_slowAlloc();
          uint64_t aBlock = v47;
          *(_DWORD *)uint64_t v46 = 136446210;
          uint64_t v48 = WFSetupProgressEventToString(v89);
          uint64_t v49 = sub_25E7BC3E0();
          unint64_t v51 = v50;

          *(void *)&long long v91 = sub_25E77CF40(v49, v51, &aBlock);
          sub_25E7BC520();
          unint64_t v52 = v89;
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_25E775000, v44, v45, "Sending secure pairing event: %{public}s", v46, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x2611E3480](v47, -1, -1);
          MEMORY[0x2611E3480](v46, -1, -1);
        }
        else
        {

          unint64_t v52 = v89;
        }
        uint64_t v53 = (void *)sub_25E7BC3D0();
        uint64_t v54 = (void *)sub_25E7BC370();
        swift_bridgeObjectRelease();
        uint64_t v55 = swift_initStackObject();
        *(_OWORD *)(v55 + 16) = xmmword_25E7BDF10;
        uint64_t aBlock = 0xD000000000000014;
        unint64_t v94 = 0x800000025E7BEF80;
        sub_25E7BC580();
        *(void *)(v55 + 96) = MEMORY[0x263F8D6C8];
        *(void *)(v55 + 72) = v52;
        sub_25E7885A8(v55);
        objc_super v56 = (void *)sub_25E7BC370();
        swift_bridgeObjectRelease();
        v97 = sub_25E796AB4;
        uint64_t v98 = v42;
        uint64_t aBlock = MEMORY[0x263EF8330];
        unint64_t v94 = 1107296256;
        uint64_t v95 = sub_25E788D3C;
        uint64_t v96 = &block_descriptor_197;
        uint64_t v57 = _Block_copy(&aBlock);
        swift_retain();
        swift_release();
        objc_msgSend(v88, sel_sendRequestID_options_request_responseHandler_, v53, v54, v56, v57);

        _Block_release(v57);
        swift_release();
      }
      else
      {
        if (a3)
        {
          uint64_t v58 = swift_allocObject();
          *(void *)(v58 + 16) = a3;
          *(void *)(v58 + 24) = a4;
          uint64_t v59 = (uint64_t (*)())sub_25E796AB8;
        }
        else
        {
          uint64_t v59 = nullsub_1;
          uint64_t v58 = 0;
        }
        uint64_t v60 = swift_allocObject();
        *(void *)(v60 + 16) = v59;
        *(void *)(v60 + 24) = v58;
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A706D80);
        uint64_t v61 = swift_initStackObject();
        *(_OWORD *)(v61 + 16) = xmmword_25E7BDF10;
        uint64_t aBlock = 0xD000000000000010;
        unint64_t v94 = 0x800000025E7BFCC0;
        id v85 = v19;
        sub_25E785E00((uint64_t)a3);
        sub_25E7BC580();
        *(void *)(v61 + 96) = MEMORY[0x263F8D4F8];
        *(unsigned char *)(v61 + 72) = 1;
        sub_25E7885A8(v61);
        os_log_type_t v62 = sub_25E7BC2C0();
        os_log_type_t v63 = sub_25E7BC4A0();
        if (os_log_type_enabled(v62, v63))
        {
          uint64_t v64 = (uint8_t *)swift_slowAlloc();
          uint64_t v65 = swift_slowAlloc();
          uint64_t aBlock = v65;
          *(_DWORD *)uint64_t v64 = 136446210;
          uint64_t v66 = WFSetupProgressEventToString(5uLL);
          uint64_t v67 = sub_25E7BC3E0();
          unint64_t v69 = v68;

          *(void *)&long long v91 = sub_25E77CF40(v67, v69, &aBlock);
          sub_25E7BC520();
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_25E775000, v62, v63, "Sending secure pairing event: %{public}s", v64, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x2611E3480](v65, -1, -1);
          MEMORY[0x2611E3480](v64, -1, -1);
        }

        uint64_t v70 = swift_initStackObject();
        *(_OWORD *)(v70 + 16) = xmmword_25E7BDF10;
        uint64_t aBlock = 0xD000000000000014;
        unint64_t v94 = 0x800000025E7BEF80;
        sub_25E7BC580();
        *(void *)(v70 + 96) = MEMORY[0x263F8D6C8];
        *(void *)(v70 + 72) = 5;
        sub_25E7885A8(v70);
        if (v86[2]
          && (unint64_t v71 = sub_25E7A8D0C(0xD000000000000021, 0x800000025E7BEFE0), (v72 & 1) != 0)
          && (sub_25E77D9C8(v86[7] + 32 * v71, (uint64_t)&aBlock),
              uint64_t v73 = MEMORY[0x263F8D4F8],
              (swift_dynamicCast() & 1) != 0))
        {
          uint64_t v74 = v60;
          int v75 = v91;
          uint64_t v76 = sub_25E7BC2C0();
          os_log_type_t v77 = sub_25E7BC4A0();
          if (os_log_type_enabled(v76, v77))
          {
            uint64_t v78 = (uint8_t *)swift_slowAlloc();
            *(_DWORD *)uint64_t v78 = 67109120;
            LODWORD(aBlock) = v75;
            sub_25E7BC520();
            _os_log_impl(&dword_25E775000, v76, v77, "Received security context with userHasCompletedFirstPaneOnServer: %{BOOL}d", v78, 8u);
            MEMORY[0x2611E3480](v78, -1, -1);
          }

          *(void *)&long long v91 = 0xD000000000000021;
          *((void *)&v91 + 1) = 0x800000025E7BEFE0;
          sub_25E7BC580();
          uint64_t v92 = v73;
          LOBYTE(v91) = v75;
          sub_25E796898(&v91, v90);
          char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
          sub_25E796AC4(v90, (uint64_t)&aBlock, isUniquelyReferenced_nonNull_native);
          swift_bridgeObjectRelease();
          sub_25E798CA4((uint64_t)&aBlock);
          uint64_t v60 = v74;
          uint64_t v80 = v85;
        }
        else
        {
          uint64_t v80 = v85;
        }
        os_log_type_t v81 = (void *)sub_25E7BC3D0();
        v82 = (void *)sub_25E7BC370();
        swift_bridgeObjectRelease();
        objc_super v56 = (void *)sub_25E7BC370();
        swift_bridgeObjectRelease();
        v97 = sub_25E796AB4;
        uint64_t v98 = v60;
        uint64_t aBlock = MEMORY[0x263EF8330];
        unint64_t v94 = 1107296256;
        uint64_t v95 = sub_25E788D3C;
        uint64_t v96 = &block_descriptor_208;
        os_log_type_t v83 = _Block_copy(&aBlock);
        swift_retain();
        swift_release();
        objc_msgSend(v80, sel_sendRequestID_options_request_responseHandler_, v81, v82, v56, v83);

        swift_release();
        _Block_release(v83);
      }
    }
  }
  else
  {
    id v35 = sub_25E7BC2C0();
    os_log_type_t v36 = sub_25E7BC490();
    if (os_log_type_enabled(v35, v36))
    {
      uint64_t v37 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v37 = 0;
      _os_log_impl(&dword_25E775000, v35, v36, "Failed to send object to server. SfSession is not available. ", v37, 2u);
      MEMORY[0x2611E3480](v37, -1, -1);
    }

    if (a3)
    {
      sub_25E796844();
      uint64_t v38 = swift_allocError();
      *uint64_t v39 = 0;
      a3(v38, 0, 0);
      uint64_t v34 = (void *)v38;
      goto LABEL_16;
    }
  }
}

void sub_25E78DC9C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v63 = a2;
  uint64_t v5 = sub_25E7BC2F0();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5, v7);
  id v9 = (char *)&v56 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_25E7BC310();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10, v12);
  uint64_t v14 = (char *)&v56 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_25E7BC330();
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v18 = MEMORY[0x270FA5388](v15, v17);
  id v20 = (char *)&v56 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = MEMORY[0x270FA5388](v18, v21);
  uint64_t v64 = a1;
  if (a1 > 2)
  {
    if (qword_26A7065D0 != -1) {
      swift_once();
    }
    uint64_t v44 = sub_25E7BC2E0();
    __swift_project_value_buffer(v44, (uint64_t)qword_26A7089F8);
    os_log_type_t v45 = sub_25E7BC2C0();
    os_log_type_t v46 = sub_25E7BC490();
    if (os_log_type_enabled(v45, v46))
    {
      uint64_t v47 = (uint8_t *)swift_slowAlloc();
      uint64_t v48 = swift_slowAlloc();
      aBlock[0] = v48;
      *(_DWORD *)uint64_t v47 = 136446210;
      uint64_t v67 = sub_25E77CF40(0xD000000000000026, 0x800000025E7C04C0, aBlock);
      sub_25E7BC520();
      _os_log_impl(&dword_25E775000, v45, v46, "%{public}s No more service restart attempts, publishing completion(error).", v47, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2611E3480](v48, -1, -1);
      MEMORY[0x2611E3480](v47, -1, -1);
    }

    uint64_t v49 = v3 + OBJC_IVAR___WFSetupServerInternal_activationHandler;
    swift_beginAccess();
    unint64_t v51 = *(void (**)(uint64_t))v49;
    uint64_t v50 = *(void *)(v49 + 8);
    sub_25E785E00((uint64_t)v51);
    uint64_t v52 = v63;
    sub_25E7AEA18(v51, v50, v63, 0);
    sub_25E785F38((uint64_t)v51);
    uint64_t v53 = v3 + OBJC_IVAR___WFSetupServerInternal_completionHandler;
    swift_beginAccess();
    uint64_t v55 = *(void (**)(uint64_t))v53;
    uint64_t v54 = *(void *)(v53 + 8);
    sub_25E785E00((uint64_t)v55);
    sub_25E7AEA18(v55, v54, v52, 0);
    sub_25E785F38((uint64_t)v55);
    WFSetupServer.invalidate()();
  }
  else
  {
    uint64_t v58 = (char *)&v56 - v23;
    uint64_t v59 = v14;
    uint64_t v24 = v22;
    uint64_t v60 = v11;
    uint64_t v63 = v6;
    if (qword_26A7065D0 != -1) {
      swift_once();
    }
    uint64_t v25 = sub_25E7BC2E0();
    __swift_project_value_buffer(v25, (uint64_t)qword_26A7089F8);
    unint64_t v26 = sub_25E7BC2C0();
    os_log_type_t v27 = sub_25E7BC4A0();
    BOOL v28 = os_log_type_enabled(v26, v27);
    uint64_t v61 = v9;
    uint64_t v62 = v10;
    if (v28)
    {
      uint64_t v57 = (void (*)(char *, uint64_t))v5;
      uint64_t v29 = (uint8_t *)swift_slowAlloc();
      uint64_t v30 = swift_slowAlloc();
      aBlock[0] = v30;
      *(_DWORD *)uint64_t v29 = 136446210;
      uint64_t v67 = sub_25E77CF40(0xD000000000000026, 0x800000025E7C04C0, aBlock);
      uint64_t v5 = (uint64_t)v57;
      sub_25E7BC520();
      _os_log_impl(&dword_25E775000, v26, v27, "%{public}s Quietly invalidating service that failed to start.", v29, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2611E3480](v30, -1, -1);
      MEMORY[0x2611E3480](v29, -1, -1);
    }

    uint64_t v31 = OBJC_IVAR___WFSetupServerInternal_sfService;
    uint64_t v32 = *(void **)(v3 + OBJC_IVAR___WFSetupServerInternal_sfService);
    if (v32)
    {
      objc_msgSend(v32, sel_setInvalidationHandler_, 0);
      uint64_t v32 = *(void **)(v3 + v31);
    }
    objc_msgSend(v32, sel_invalidate);
    unint64_t v33 = *(void **)(v3 + v31);
    *(void *)(v3 + v31) = 0;

    uint64_t v34 = v64;
    id v35 = (id *)(v3 + OBJC_IVAR___WFSetupServerInternal_dispatchQueue);
    swift_beginAccess();
    id v36 = *v35;
    sub_25E7BC320();
    uint64_t v37 = v58;
    MEMORY[0x2611E2A10](v20, (double)v34 * 0.25);
    uint64_t v38 = *(void (**)(char *, uint64_t))(v16 + 8);
    uint64_t v56 = v24;
    uint64_t v57 = v38;
    v38(v20, v24);
    uint64_t v39 = swift_allocObject();
    swift_unknownObjectWeakInit();
    uint64_t v40 = swift_allocObject();
    *(void *)(v40 + 16) = v39;
    *(void *)(v40 + 24) = v34;
    aBlock[4] = (uint64_t)sub_25E799784;
    aBlock[5] = v40;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_25E787340;
    aBlock[3] = (uint64_t)&block_descriptor_139;
    uint64_t v41 = _Block_copy(aBlock);
    swift_retain();
    uint64_t v42 = v59;
    sub_25E7BC300();
    uint64_t v65 = MEMORY[0x263F8EE78];
    sub_25E799664((unint64_t *)&qword_26A706980, MEMORY[0x263F8F030]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A706988);
    sub_25E796798();
    uint64_t v43 = v61;
    sub_25E7BC550();
    MEMORY[0x2611E2B80](v37, v42, v43, v41);
    _Block_release(v41);

    (*(void (**)(char *, uint64_t))(v63 + 8))(v43, v5);
    (*(void (**)(char *, uint64_t))(v60 + 8))(v42, v62);
    v57(v37, v56);
    swift_release();
    swift_release();
  }
}

void sub_25E78E42C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = a1 + 16;
  swift_beginAccess();
  uint64_t v4 = MEMORY[0x2611E34D0](v3);
  if (v4)
  {
    uint64_t v5 = (void *)v4;
    sub_25E78E488(a2);
  }
}

void sub_25E78E488(uint64_t a1)
{
  uint64_t v2 = v1;
  if (qword_26A7065D0 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_25E7BC2E0();
  __swift_project_value_buffer(v4, (uint64_t)qword_26A7089F8);
  uint64_t v5 = sub_25E7BC2C0();
  os_log_type_t v6 = sub_25E7BC4A0();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 134217984;
    uint64_t aBlock = a1;
    sub_25E7BC520();
    _os_log_impl(&dword_25E775000, v5, v6, "SFService start: attempt: %ld", v7, 0xCu);
    MEMORY[0x2611E3480](v7, -1, -1);
  }

  uint64_t v8 = OBJC_IVAR___WFSetupServerInternal_sfService;
  objc_msgSend(*(id *)&v1[OBJC_IVAR___WFSetupServerInternal_sfService], sel_invalidate);
  id v9 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6C2B0]), sel_init);
  uint64_t v10 = *(void **)&v1[v8];
  *(void *)&v1[v8] = v9;
  id v11 = v9;

  if (v1[OBJC_IVAR___WFSetupServerInternal_shouldAdvertiseFast] == 1) {
    objc_msgSend(v11, sel_setAdvertiseRate_, 50);
  }
  uint64_t v12 = &v1[OBJC_IVAR___WFSetupServerInternal_dispatchQueue];
  swift_beginAccess();
  objc_msgSend(v11, sel_setDispatchQueue_, *(void *)v12);
  objc_msgSend(v11, sel_setNeedsSetup_, 1);
  objc_msgSend(v11, sel_setOverrideScreenOff_, 1);
  objc_msgSend(v11, sel_setIdentifier_, *MEMORY[0x263F6C378]);
  objc_msgSend(v11, sel_setDeviceActionType_, 36);
  objc_msgSend(v11, sel_setSessionFlags_, 2);
  if (*(void *)&v1[OBJC_IVAR___WFSetupServerInternal_resumeAuthTag])
  {
    uint64_t v13 = sub_25E7BC2C0();
    os_log_type_t v14 = sub_25E7BC4A0();
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v15 = (uint8_t *)swift_slowAlloc();
      uint64_t v16 = swift_slowAlloc();
      uint64_t aBlock = v16;
      *(_DWORD *)uint64_t v15 = 136446210;
      sub_25E77CF40(0xD000000000000016, 0x800000025E7C04A0, &aBlock);
      sub_25E7BC520();
      _os_log_impl(&dword_25E775000, v13, v14, "FIXME: %{public}s resumeAuthTag is not nil", v15, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2611E3480](v16, -1, -1);
      MEMORY[0x2611E3480](v15, -1, -1);
    }
  }
  uint64_t v39 = sub_25E78ED0C;
  uint64_t v40 = 0;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v36 = 1107296256;
  uint64_t v37 = sub_25E787340;
  uint64_t v38 = &block_descriptor_94;
  uint64_t v17 = _Block_copy(&aBlock);
  objc_msgSend(v11, sel_setInterruptionHandler_, v17);
  _Block_release(v17);
  uint64_t v18 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v39 = sub_25E7996AC;
  uint64_t v40 = v18;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v36 = 1107296256;
  uint64_t v37 = sub_25E787340;
  uint64_t v38 = &block_descriptor_98;
  uint64_t v19 = _Block_copy(&aBlock);
  swift_release();
  objc_msgSend(v11, sel_setInvalidationHandler_, v19);
  _Block_release(v19);
  uint64_t v39 = sub_25E78EF04;
  uint64_t v40 = 0;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v36 = 1107296256;
  uint64_t v37 = sub_25E78F0FC;
  uint64_t v38 = &block_descriptor_101;
  id v20 = _Block_copy(&aBlock);
  objc_msgSend(v11, sel_setPeerDisconnectedHandler_, v20);
  _Block_release(v20);
  uint64_t v21 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v39 = sub_25E7996B4;
  uint64_t v40 = v21;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v36 = 1107296256;
  uint64_t v37 = sub_25E785B1C;
  uint64_t v38 = &block_descriptor_105;
  uint64_t v22 = _Block_copy(&aBlock);
  swift_release();
  objc_msgSend(v11, sel_setPromptForPINHandler_, v22);
  _Block_release(v22);
  uint64_t v23 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v39 = sub_25E7996BC;
  uint64_t v40 = v23;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v36 = 1107296256;
  uint64_t v37 = sub_25E78F2F8;
  uint64_t v38 = &block_descriptor_109;
  uint64_t v24 = _Block_copy(&aBlock);
  swift_release();
  objc_msgSend(v11, sel_setReceivedObjectHandler_, v24);
  _Block_release(v24);
  uint64_t v25 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v39 = sub_25E7996C4;
  uint64_t v40 = v25;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v36 = 1107296256;
  uint64_t v37 = sub_25E790078;
  uint64_t v38 = &block_descriptor_113;
  unint64_t v26 = _Block_copy(&aBlock);
  swift_release();
  objc_msgSend(v11, sel_setSessionStartedHandler_, v26);
  _Block_release(v26);
  uint64_t v27 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v39 = sub_25E7996CC;
  uint64_t v40 = v27;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v36 = 1107296256;
  uint64_t v37 = sub_25E7909F4;
  uint64_t v38 = &block_descriptor_117;
  BOOL v28 = _Block_copy(&aBlock);
  swift_release();
  objc_msgSend(v11, sel_setSessionEndedHandler_, v28);
  _Block_release(v28);
  uint64_t v29 = swift_allocObject();
  *(void *)(v29 + 16) = v2;
  uint64_t v39 = sub_25E7996D4;
  uint64_t v40 = v29;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v36 = 1107296256;
  uint64_t v37 = sub_25E790078;
  uint64_t v38 = &block_descriptor_123;
  uint64_t v30 = _Block_copy(&aBlock);
  id v31 = v2;
  swift_release();
  objc_msgSend(v11, sel_setSessionSecuredHandler_, v30);
  _Block_release(v30);
  uint64_t v32 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v33 = swift_allocObject();
  *(void *)(v33 + 16) = v32;
  *(void *)(v33 + 24) = a1;
  uint64_t v39 = sub_25E799714;
  uint64_t v40 = v33;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v36 = 1107296256;
  uint64_t v37 = sub_25E79B70C;
  uint64_t v38 = &block_descriptor_130;
  uint64_t v34 = _Block_copy(&aBlock);
  swift_release();
  objc_msgSend(v11, sel_activateWithCompletion_, v34);
  _Block_release(v34);
}

void sub_25E78ED0C()
{
  if (qword_26A7065D0 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_25E7BC2E0();
  __swift_project_value_buffer(v0, (uint64_t)qword_26A7089F8);
  oslog = sub_25E7BC2C0();
  os_log_type_t v1 = sub_25E7BC4A0();
  if (os_log_type_enabled(oslog, v1))
  {
    uint64_t v2 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v2 = 0;
    _os_log_impl(&dword_25E775000, oslog, v1, "SFService interrupted", v2, 2u);
    MEMORY[0x2611E3480](v2, -1, -1);
  }
}

void sub_25E78EDF4(uint64_t a1)
{
  uint64_t v1 = a1 + 16;
  swift_beginAccess();
  uint64_t v2 = MEMORY[0x2611E34D0](v1);
  if (v2)
  {
    uint64_t v3 = v2;
    WFSetupServer.invalidate()();
  }
  else
  {
    if (qword_26A7065D0 != -1) {
      swift_once();
    }
    uint64_t v4 = sub_25E7BC2E0();
    __swift_project_value_buffer(v4, (uint64_t)qword_26A7089F8);
    uint64_t v3 = sub_25E7BC2C0();
    os_log_type_t v5 = sub_25E7BC490();
    if (os_log_type_enabled(v3, v5))
    {
      os_log_type_t v6 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)os_log_type_t v6 = 0;
      _os_log_impl(&dword_25E775000, v3, v5, "WFSetupServer unexpectedly nil", v6, 2u);
      MEMORY[0x2611E3480](v6, -1, -1);
    }
  }
}

void sub_25E78EF04(uint64_t a1, void *a2)
{
  if (qword_26A7065D0 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_25E7BC2E0();
  __swift_project_value_buffer(v3, (uint64_t)qword_26A7089F8);
  id v4 = a2;
  id v5 = a2;
  oslog = sub_25E7BC2C0();
  os_log_type_t v6 = sub_25E7BC4A0();
  if (os_log_type_enabled(oslog, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v8 = swift_slowAlloc();
    uint64_t v13 = v8;
    *(_DWORD *)uint64_t v7 = 136446210;
    id v9 = a2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A706A80);
    uint64_t v10 = sub_25E7BC3F0();
    sub_25E77CF40(v10, v11, &v13);
    sub_25E7BC520();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_25E775000, oslog, v6, "Peer client device disconnected with error %{public}s", v7, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2611E3480](v8, -1, -1);
    MEMORY[0x2611E3480](v7, -1, -1);
  }
  else
  {
  }
}

uint64_t sub_25E78F0FC(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = sub_25E7BC280();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5, v7);
  id v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *(void (**)(char *, void *))(a1 + 32);
  sub_25E7BC270();
  swift_retain();
  id v11 = a3;
  v10(v9, a3);
  swift_release();

  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v9, v5);
}

void sub_25E78F210(unsigned int a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = a3 + 16;
  swift_beginAccess();
  uint64_t v6 = MEMORY[0x2611E34D0](v5);
  if (v6)
  {
    uint64_t v7 = (void *)v6;
    sub_25E795DE8(a1, a2);
  }
}

void sub_25E78F280(void *a1, unsigned int a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = a4 + 16;
  swift_beginAccess();
  uint64_t v8 = MEMORY[0x2611E34D0](v7);
  if (v8)
  {
    id v9 = (void *)v8;
    sub_25E791344(a1, a3, a2);
  }
}

void sub_25E78F2F8(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void))(a1 + 32);
  sub_25E7BC390();
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
  swift_bridgeObjectRelease();
}

void sub_25E78F3AC(void *a1, uint64_t a2)
{
  uint64_t v4 = sub_25E7BC280();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v4, v6);
  unint64_t v113 = (char *)&v105 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = MEMORY[0x270FA5388](v7, v9);
  unint64_t v112 = (char *)&v105 - v11;
  uint64_t v13 = MEMORY[0x270FA5388](v10, v12);
  v115 = (char *)&v105 - v14;
  uint64_t v16 = MEMORY[0x270FA5388](v13, v15);
  os_log_type_t v121 = (char *)&v105 - v17;
  MEMORY[0x270FA5388](v16, v18);
  uint64_t v114 = (char *)&v105 - v19;
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A706998);
  uint64_t v22 = MEMORY[0x270FA5388](v20 - 8, v21);
  os_log_t v117 = (os_log_t)((char *)&v105 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v25 = MEMORY[0x270FA5388](v22, v24);
  os_log_type_t v116 = (char *)&v105 - v26;
  uint64_t v28 = MEMORY[0x270FA5388](v25, v27);
  unint64_t v119 = (char *)&v105 - v29;
  uint64_t v31 = MEMORY[0x270FA5388](v28, v30);
  uint64_t v118 = (char *)&v105 - v32;
  uint64_t v34 = MEMORY[0x270FA5388](v31, v33);
  uint64_t v36 = (char *)&v105 - v35;
  uint64_t v38 = MEMORY[0x270FA5388](v34, v37);
  uint64_t v40 = (char *)&v105 - v39;
  MEMORY[0x270FA5388](v38, v41);
  uint64_t v43 = (char *)&v105 - v42;
  uint64_t v44 = sub_25E7BC2E0();
  uint64_t v45 = *(void *)(v44 - 8);
  MEMORY[0x270FA5388](v44, v46);
  uint64_t v48 = (char *)&v105 - ((v47 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t v122 = MEMORY[0x2611E34D0](a2 + 16);
  if (v122)
  {
    uint64_t v120 = v5;
    if (qword_26A7065D0 != -1) {
      swift_once();
    }
    uint64_t v49 = __swift_project_value_buffer(v44, (uint64_t)qword_26A7089F8);
    uint64_t v50 = *(void (**)(char *))(v45 + 16);
    uint64_t v108 = v49;
    v50(v48);
    id v51 = a1;
    uint64_t v52 = sub_25E7BC2C0();
    int v111 = sub_25E7BC4A0();
    BOOL v53 = os_log_type_enabled(v52, (os_log_type_t)v111);
    v123 = v51;
    if (v53)
    {
      uint64_t v110 = v4;
      uint64_t v109 = 7104878;
      uint64_t v54 = (uint8_t *)swift_slowAlloc();
      uint64_t v107 = swift_slowAlloc();
      v126[0] = v107;
      *(_DWORD *)uint64_t v54 = 136315138;
      id v55 = objc_msgSend(v51, sel_peerDevice);
      if (v55)
      {
        uint64_t v56 = v55;
        id v57 = objc_msgSend(v55, sel_identifier);

        v106 = v54;
        if (v57)
        {
          sub_25E7BC270();

          uint64_t v58 = 0;
        }
        else
        {
          uint64_t v58 = 1;
        }
        uint64_t v64 = v120;
        uint64_t v65 = v110;
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v120 + 56))(v40, v58, 1, v110);
        sub_25E79721C((uint64_t)v40, (uint64_t)v43, &qword_26A706998);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v64 + 48))(v43, 1, v65))
        {
          sub_25E784970((uint64_t)v43, &qword_26A706998);
          unint64_t v63 = 0xE300000000000000;
        }
        else
        {
          uint64_t v66 = v114;
          (*(void (**)(char *, char *, uint64_t))(v64 + 16))(v114, v43, v65);
          sub_25E784970((uint64_t)v43, &qword_26A706998);
          uint64_t v109 = sub_25E7BC250();
          unint64_t v63 = v67;
          (*(void (**)(char *, uint64_t))(v64 + 8))(v66, v65);
        }
        uint64_t v62 = (void *)v122;
        id v51 = v123;
        uint64_t v54 = v106;
      }
      else
      {
        unint64_t v63 = 0xE300000000000000;
        uint64_t v62 = (void *)v122;
      }
      v125[0] = sub_25E77CF40(v109, v63, v126);
      sub_25E7BC520();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25E775000, v52, (os_log_type_t)v111, "Session started with %s", v54, 0xCu);
      uint64_t v68 = v107;
      swift_arrayDestroy();
      MEMORY[0x2611E3480](v68, -1, -1);
      MEMORY[0x2611E3480](v54, -1, -1);

      (*(void (**)(char *, uint64_t))(v45 + 8))(v48, v44);
      uint64_t v4 = v110;
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v45 + 8))(v48, v44);
      uint64_t v62 = (void *)v122;
    }
    uint64_t v69 = (uint64_t)v62 + OBJC_IVAR___WFSetupServerInternal_peer;
    swift_beginAccess();
    sub_25E7998C8(v69, (uint64_t)v36, &qword_26A706998);
    uint64_t v70 = v120;
    unint64_t v71 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v120 + 48);
    if (v71(v36, 1, v4) == 1)
    {
      sub_25E784970((uint64_t)v36, &qword_26A706998);
      char v72 = v123;
      id v73 = objc_msgSend(v123, sel_peerDevice);
      if (v73)
      {
        uint64_t v74 = v73;
        id v75 = objc_msgSend(v73, sel_identifier);

        if (v75)
        {
          os_log_t v76 = v117;
          sub_25E7BC270();

          uint64_t v77 = 0;
        }
        else
        {
          uint64_t v77 = 1;
          os_log_t v76 = v117;
        }
        uint64_t v87 = (uint64_t)v118;
        (*(void (**)(os_log_t, uint64_t, uint64_t, uint64_t))(v70 + 56))(v76, v77, 1, v4);
        sub_25E79721C((uint64_t)v76, v87, &qword_26A706998);
        char v72 = v123;
      }
      else
      {
        uint64_t v87 = (uint64_t)v118;
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v70 + 56))(v118, 1, 1, v4);
      }
      swift_beginAccess();
      sub_25E79971C(v87, v69);
      swift_endAccess();
      goto LABEL_37;
    }
    uint64_t v78 = *(void (**)(char *, char *, uint64_t))(v70 + 32);
    v78(v121, v36, v4);
    id v79 = objc_msgSend(v123, sel_peerDevice);
    if (!v79)
    {
      uint64_t v86 = (uint64_t)v119;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v70 + 56))(v119, 1, 1, v4);
      id v85 = v121;
LABEL_35:
      (*(void (**)(char *, uint64_t))(v70 + 8))(v85, v4);
      sub_25E784970(v86, &qword_26A706998);
LABEL_36:
      char v72 = v123;
LABEL_37:
      sub_25E792A10(v72);

      return;
    }
    uint64_t v80 = v79;
    id v81 = objc_msgSend(v79, sel_identifier);

    if (v81)
    {
      v82 = v116;
      sub_25E7BC270();

      uint64_t v83 = (uint64_t)v82;
      uint64_t v84 = 0;
      id v85 = v121;
      uint64_t v86 = (uint64_t)v119;
    }
    else
    {
      uint64_t v84 = 1;
      id v85 = v121;
      uint64_t v86 = (uint64_t)v119;
      uint64_t v83 = (uint64_t)v116;
    }
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v70 + 56))(v83, v84, 1, v4);
    sub_25E79721C(v83, v86, &qword_26A706998);
    if (v71((char *)v86, 1, v4) == 1) {
      goto LABEL_35;
    }
    id v88 = v115;
    v78(v115, (char *)v86, v4);
    sub_25E799664(&qword_26A706A70, MEMORY[0x263F07508]);
    if (sub_25E7BC3C0())
    {
      unint64_t v89 = *(void (**)(char *, uint64_t))(v70 + 8);
      v89(v88, v4);
      v89(v85, v4);
      goto LABEL_36;
    }
    uint64_t v90 = *(void (**)(char *, char *, uint64_t))(v70 + 16);
    long long v91 = v112;
    v90(v112, v88, v4);
    uint64_t v92 = v113;
    v90(v113, v85, v4);
    uint64_t v93 = sub_25E7BC2C0();
    os_log_type_t v94 = sub_25E7BC4A0();
    int v95 = v94;
    if (os_log_type_enabled(v93, v94))
    {
      uint64_t v96 = swift_slowAlloc();
      unint64_t v119 = (char *)swift_slowAlloc();
      v125[0] = (uint64_t)v119;
      *(_DWORD *)uint64_t v96 = 136315394;
      sub_25E799664(&qword_26A7069B8, MEMORY[0x263F07508]);
      os_log_t v117 = v93;
      LODWORD(v118) = v95;
      uint64_t v97 = sub_25E7BC6B0();
      uint64_t v124 = sub_25E77CF40(v97, v98, v125);
      sub_25E7BC520();
      swift_bridgeObjectRelease();
      uint64_t v99 = *(void (**)(char *, uint64_t))(v70 + 8);
      v99(v91, v4);
      *(_WORD *)(v96 + 12) = 2080;
      uint64_t v100 = sub_25E7BC6B0();
      uint64_t v124 = sub_25E77CF40(v100, v101, v125);
      id v85 = v121;
      sub_25E7BC520();
      swift_bridgeObjectRelease();
      v99(v92, v4);
      uint64_t v93 = v117;
      _os_log_impl(&dword_25E775000, v117, (os_log_type_t)v118, "Requesting peer %s dismiss because we are already communicating with %s", (uint8_t *)v96, 0x16u);
      uint64_t v102 = v119;
      swift_arrayDestroy();
      MEMORY[0x2611E3480](v102, -1, -1);
      uint64_t v103 = v96;
      id v88 = v115;
      MEMORY[0x2611E3480](v103, -1, -1);
    }
    else
    {
      uint64_t v99 = *(void (**)(char *, uint64_t))(v70 + 8);
      v99(v91, v4);
      v99(v92, v4);
    }

    v104 = (void *)v122;
    sub_25E79603C(v123);

    v99(v88, v4);
    v99(v85, v4);
  }
  else
  {
    if (qword_26A7065D0 != -1) {
      swift_once();
    }
    __swift_project_value_buffer(v44, (uint64_t)qword_26A7089F8);
    uint64_t v59 = sub_25E7BC2C0();
    os_log_type_t v60 = sub_25E7BC490();
    if (os_log_type_enabled(v59, v60))
    {
      uint64_t v61 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v61 = 0;
      _os_log_impl(&dword_25E775000, v59, v60, "WFSetupServer unexpectedly nil for session started signal", v61, 2u);
      MEMORY[0x2611E3480](v61, -1, -1);
    }
  }
}

void sub_25E790078(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

void sub_25E7900E0(void *a1, void *a2, uint64_t a3)
{
  id v80 = a1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A706998);
  uint64_t v7 = MEMORY[0x270FA5388](v5 - 8, v6);
  id v79 = (char *)&v74 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = MEMORY[0x270FA5388](v7, v9);
  uint64_t v12 = (char *)&v74 - v11;
  uint64_t v14 = MEMORY[0x270FA5388](v10, v13);
  uint64_t v77 = (char *)&v74 - v15;
  MEMORY[0x270FA5388](v14, v16);
  uint64_t v18 = (char *)&v74 - v17;
  uint64_t v19 = sub_25E7BC2E0();
  uint64_t v20 = *(void *)(v19 - 8);
  MEMORY[0x270FA5388](v19, v21);
  uint64_t v23 = (char *)&v74 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t v24 = MEMORY[0x2611E34D0](a3 + 16);
  if (v24)
  {
    uint64_t v25 = v24;
    os_log_t v76 = v18;
    if (qword_26A7065D0 != -1) {
      swift_once();
    }
    uint64_t v26 = __swift_project_value_buffer(v19, (uint64_t)qword_26A7089F8);
    (*(void (**)(char *, uint64_t, uint64_t))(v20 + 16))(v23, v26, v19);
    id v27 = a2;
    id v28 = a2;
    uint64_t v29 = sub_25E7BC2C0();
    os_log_type_t v30 = sub_25E7BC4A0();
    BOOL v31 = os_log_type_enabled(v29, v30);
    uint64_t v78 = v25;
    if (v31)
    {
      id v75 = v12;
      uint64_t v32 = (uint8_t *)swift_slowAlloc();
      uint64_t v33 = swift_slowAlloc();
      v82[0] = v33;
      *(_DWORD *)uint64_t v32 = 136446210;
      if (a2)
      {
        swift_getErrorValue();
        uint64_t v34 = sub_25E7BC720();
        unint64_t v36 = v35;
      }
      else
      {
        unint64_t v36 = 0xE300000000000000;
        uint64_t v34 = 7104878;
      }
      uint64_t v81 = sub_25E77CF40(v34, v36, v82);
      sub_25E7BC520();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_25E775000, v29, v30, "Session ended with error %{public}s", v32, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2611E3480](v33, -1, -1);
      MEMORY[0x2611E3480](v32, -1, -1);

      (*(void (**)(char *, uint64_t))(v20 + 8))(v23, v19);
      uint64_t v12 = v75;
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v20 + 8))(v23, v19);
    }
    uint64_t v40 = (uint64_t)v79;
    id v41 = v80;
    if (a2)
    {
      id v42 = a2;
      id v43 = objc_msgSend(v41, sel_identifier);
      if (v43)
      {
        uint64_t v44 = v43;
        sub_25E7BC270();

        uint64_t v45 = sub_25E7BC280();
        (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v45 - 8) + 56))(v40, 0, 1, v45);
      }
      else
      {
        uint64_t v45 = sub_25E7BC280();
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v45 - 8) + 56))(v40, 1, 1, v45);
      }
      sub_25E79721C(v40, (uint64_t)v12, &qword_26A706998);
      sub_25E7BC280();
      uint64_t v50 = *(void *)(v45 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v50 + 48))(v12, 1, v45) == 1)
      {
        sub_25E784970((uint64_t)v12, &qword_26A706998);
        uint64_t v51 = 0;
        unint64_t v52 = 0xE000000000000000;
      }
      else
      {
        uint64_t v51 = sub_25E7BC240();
        BOOL v53 = v12;
        unint64_t v52 = v54;
        (*(void (**)(char *, uint64_t))(v50 + 8))(v53, v45);
      }
      id v55 = (void *)sub_25E7BC1D0();
      id v56 = objc_msgSend(v55, sel_code);

      uint64_t v81 = (uint64_t)v56;
      uint64_t v57 = sub_25E7BC6B0();
      uint64_t v59 = v58;
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A706A58);
      uint64_t inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_25E7BDF10;
      *(void *)(inited + 32) = 0x646F43726F727265;
      *(void *)(inited + 40) = 0xE900000000000065;
      *(void *)(inited + 48) = v57;
      *(void *)(inited + 56) = v59;
      unint64_t v61 = sub_25E788938(inited);
      uint64_t v83 = &type metadata for DisconnectedProximitySetupServerAnalyticsEvent;
      unint64_t v84 = sub_25E7995A4();
      uint64_t v62 = (void *)swift_allocObject();
      v82[0] = (uint64_t)v62;
      v62[2] = 0xD000000000000035;
      v62[3] = 0x800000025E7C0350;
      v62[4] = v51;
      v62[5] = v52;
      v62[6] = v61;
      sub_25E7AA5F8(v82);
    }
    else
    {
      id v46 = objc_msgSend(v80, sel_identifier);
      if (v46)
      {
        uint64_t v47 = v46;
        uint64_t v48 = v77;
        sub_25E7BC270();

        uint64_t v49 = sub_25E7BC280();
        (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v49 - 8) + 56))(v48, 0, 1, v49);
      }
      else
      {
        uint64_t v49 = sub_25E7BC280();
        uint64_t v48 = v77;
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v49 - 8) + 56))(v77, 1, 1, v49);
      }
      uint64_t v63 = (uint64_t)v48;
      uint64_t v64 = (uint64_t)v76;
      sub_25E79721C(v63, (uint64_t)v76, &qword_26A706998);
      sub_25E7BC280();
      uint64_t v65 = *(void *)(v49 - 8);
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v65 + 48))(v64, 1, v49) == 1)
      {
        sub_25E784970(v64, &qword_26A706998);
        uint64_t v66 = 0;
        unint64_t v67 = 0xE000000000000000;
      }
      else
      {
        uint64_t v68 = v64;
        uint64_t v66 = sub_25E7BC240();
        unint64_t v67 = v69;
        (*(void (**)(uint64_t, uint64_t))(v65 + 8))(v68, v49);
      }
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A706A58);
      uint64_t v70 = swift_initStackObject();
      *(_OWORD *)(v70 + 16) = xmmword_25E7BDF10;
      *(void *)(v70 + 32) = 0x646F43726F727265;
      *(void *)(v70 + 40) = 0xE900000000000065;
      *(void *)(v70 + 48) = 48;
      *(void *)(v70 + 56) = 0xE100000000000000;
      unint64_t v71 = sub_25E788938(v70);
      uint64_t v83 = &type metadata for DisconnectedProximitySetupServerAnalyticsEvent;
      unint64_t v84 = sub_25E7995A4();
      char v72 = (void *)swift_allocObject();
      v82[0] = (uint64_t)v72;
      v72[2] = 0xD000000000000035;
      v72[3] = 0x800000025E7C0350;
      v72[4] = v66;
      v72[5] = v67;
      v72[6] = v71;
      sub_25E7AA5F8(v82);
    }
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v82);
    uint64_t v37 = v78;
    id v73 = *(Class *)((char *)&v78->isa + OBJC_IVAR___WFSetupServerInternal_sfService);
    if (v73) {
      objc_msgSend(v73, sel_setNeedsSetup_, 1);
    }
    sub_25E794624(v41);
  }
  else
  {
    if (qword_26A7065D0 != -1) {
      swift_once();
    }
    __swift_project_value_buffer(v19, (uint64_t)qword_26A7089F8);
    uint64_t v37 = sub_25E7BC2C0();
    os_log_type_t v38 = sub_25E7BC490();
    if (os_log_type_enabled(v37, v38))
    {
      uint64_t v39 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v39 = 0;
      _os_log_impl(&dword_25E775000, v37, v38, "WFSetupServer unexpectedly nil for session ended signal", v39, 2u);
      MEMORY[0x2611E3480](v39, -1, -1);
    }
  }
}

void sub_25E7909F4(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void (**)(id, void *))(a1 + 32);
  swift_retain();
  id v7 = a2;
  id v6 = a3;
  v5(v7, a3);
  swift_release();
}

void sub_25E790A80(void *a1, uint64_t a2)
{
  uint64_t v4 = sub_25E7BC280();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v46 = v4;
  uint64_t v47 = v5;
  MEMORY[0x270FA5388](v4, v6);
  uint64_t v45 = (char *)&v42 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A706998);
  uint64_t v10 = MEMORY[0x270FA5388](v8 - 8, v9);
  uint64_t v12 = (char *)&v42 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10, v13);
  uint64_t v15 = (char *)&v42 - v14;
  uint64_t v16 = sub_25E7BC2E0();
  uint64_t v17 = *(void *)(v16 - 8);
  MEMORY[0x270FA5388](v16, v18);
  uint64_t v20 = (char *)&v42 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26A7065D0 != -1) {
    swift_once();
  }
  uint64_t v21 = __swift_project_value_buffer(v16, (uint64_t)qword_26A7089F8);
  (*(void (**)(char *, uint64_t, uint64_t))(v17 + 16))(v20, v21, v16);
  id v22 = a1;
  uint64_t v23 = sub_25E7BC2C0();
  int v24 = sub_25E7BC4A0();
  if (os_log_type_enabled(v23, (os_log_type_t)v24))
  {
    int v44 = v24;
    uint64_t v25 = (uint8_t *)swift_slowAlloc();
    uint64_t v43 = swift_slowAlloc();
    uint64_t v49 = v43;
    *(_DWORD *)uint64_t v25 = 136446210;
    id v26 = objc_msgSend(v22, sel_peerDevice);
    if (v26)
    {
      id v27 = v26;
      uint64_t v42 = a2;
      id v28 = objc_msgSend(v26, sel_identifier);

      if (v28)
      {
        sub_25E7BC270();

        uint64_t v29 = 0;
      }
      else
      {
        uint64_t v29 = 1;
      }
      uint64_t v30 = v46;
      uint64_t v31 = v47;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v47 + 56))(v12, v29, 1, v46);
      uint64_t v32 = (uint64_t)v12;
      uint64_t v33 = v31;
      sub_25E79721C(v32, (uint64_t)v15, &qword_26A706998);
      if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(v31 + 48))(v15, 1, v30))
      {
        uint64_t v37 = v45;
        (*(void (**)(char *, char *, uint64_t))(v33 + 16))(v45, v15, v30);
        sub_25E784970((uint64_t)v15, &qword_26A706998);
        uint64_t v38 = v30;
        uint64_t v39 = sub_25E7BC250();
        uint64_t v40 = v33;
        unint64_t v34 = v41;
        (*(void (**)(char *, uint64_t))(v40 + 8))(v37, v38);
        uint64_t v36 = v39;
        uint64_t v35 = v43;
        goto LABEL_13;
      }
      sub_25E784970((uint64_t)v15, &qword_26A706998);
    }
    unint64_t v34 = 0xE300000000000000;
    uint64_t v35 = v43;
    uint64_t v36 = 7104878;
LABEL_13:
    uint64_t v48 = sub_25E77CF40(v36, v34, &v49);
    sub_25E7BC520();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25E775000, v23, (os_log_type_t)v44, "Session secured with %{public}s", v25, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2611E3480](v35, -1, -1);
    MEMORY[0x2611E3480](v25, -1, -1);

    goto LABEL_14;
  }

LABEL_14:
  (*(void (**)(char *, uint64_t))(v17 + 8))(v20, v16);
  sub_25E794F34(v22);
}

void sub_25E790F14(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = a2 + 16;
  swift_beginAccess();
  uint64_t v6 = MEMORY[0x2611E34D0](v5);
  if (!v6)
  {
    if (qword_26A7065D0 == -1)
    {
LABEL_8:
      uint64_t v18 = sub_25E7BC2E0();
      __swift_project_value_buffer(v18, (uint64_t)qword_26A7089F8);
      uint64_t v19 = sub_25E7BC2C0();
      os_log_type_t v20 = sub_25E7BC490();
      if (os_log_type_enabled(v19, v20))
      {
        uint64_t v21 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v21 = 0;
        _os_log_impl(&dword_25E775000, v19, v20, "SFService activate completion called but WFSetupServer has been deallocated!", v21, 2u);
        MEMORY[0x2611E3480](v21, -1, -1);
      }

      return;
    }
LABEL_20:
    swift_once();
    goto LABEL_8;
  }
  uint64_t v7 = (char *)v6;
  if (a1)
  {
    id v8 = a1;
    if (qword_26A7065D0 != -1) {
      swift_once();
    }
    uint64_t v9 = sub_25E7BC2E0();
    __swift_project_value_buffer(v9, (uint64_t)qword_26A7089F8);
    id v10 = a1;
    id v11 = a1;
    uint64_t v12 = sub_25E7BC2C0();
    os_log_type_t v13 = sub_25E7BC4A0();
    if (os_log_type_enabled(v12, v13))
    {
      uint64_t v14 = swift_slowAlloc();
      uint64_t v15 = swift_slowAlloc();
      v29[0] = v15;
      *(_DWORD *)uint64_t v14 = 136446466;
      swift_getErrorValue();
      uint64_t v16 = sub_25E7BC720();
      sub_25E77CF40(v16, v17, v29);
      sub_25E7BC520();
      swift_bridgeObjectRelease();

      *(_WORD *)(v14 + 12) = 2050;
      sub_25E7BC520();
      _os_log_impl(&dword_25E775000, v12, v13, "SFService activate failed: %{public}s on attempt %{public}ld", (uint8_t *)v14, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x2611E3480](v15, -1, -1);
      MEMORY[0x2611E3480](v14, -1, -1);
    }
    else
    {
    }
    if (!__OFADD__(a3, 1))
    {
      sub_25E78DC9C(a3 + 1, (uint64_t)a1);

      return;
    }
    __break(1u);
    goto LABEL_20;
  }
  if (qword_26A7065D0 != -1) {
    swift_once();
  }
  uint64_t v22 = sub_25E7BC2E0();
  __swift_project_value_buffer(v22, (uint64_t)qword_26A7089F8);
  uint64_t v23 = sub_25E7BC2C0();
  os_log_type_t v24 = sub_25E7BC4A0();
  if (os_log_type_enabled(v23, v24))
  {
    uint64_t v25 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v25 = 134349056;
    v29[0] = a3;
    sub_25E7BC520();
    _os_log_impl(&dword_25E775000, v23, v24, "SFService activated successfully on attempt %{public}ld", v25, 0xCu);
    MEMORY[0x2611E3480](v25, -1, -1);
  }

  id v26 = &v7[OBJC_IVAR___WFSetupServerInternal_activationHandler];
  swift_beginAccess();
  id v28 = *(void (**)(uint64_t))v26;
  uint64_t v27 = *((void *)v26 + 1);
  sub_25E785E00((uint64_t)v28);
  sub_25E7AEA18(v28, v27, 0, 0);

  sub_25E785F38((uint64_t)v28);
}

void sub_25E791344(void *a1, uint64_t a2, unsigned int a3)
{
  uint64_t v4 = v3;
  unsigned int v148 = a3;
  v163[3] = *MEMORY[0x263EF8340];
  uint64_t v7 = sub_25E7BC2E0();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v7, v9);
  unsigned int v145 = (char *)&v141 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10, v12);
  unsigned int v146 = (char *)&v141 - v13;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A706998);
  uint64_t v16 = MEMORY[0x270FA5388](v14 - 8, v15);
  uint64_t v18 = (char *)&v141 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = MEMORY[0x270FA5388](v16, v19);
  unsigned int v147 = (char *)&v141 - v21;
  uint64_t v23 = MEMORY[0x270FA5388](v20, v22);
  uint64_t v152 = (uint64_t)&v141 - v24;
  MEMORY[0x270FA5388](v23, v25);
  uint64_t v27 = (char *)&v141 - v26;
  uint64_t v28 = sub_25E7BC280();
  uint64_t v29 = *(uint8_t **)(v28 - 8);
  uint64_t v157 = v28;
  unint64_t v158 = v29;
  uint64_t v31 = MEMORY[0x270FA5388](v28, v30);
  unsigned int v142 = (char *)&v141 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v34 = MEMORY[0x270FA5388](v31, v33);
  unsigned int v144 = (char *)&v141 - v35;
  MEMORY[0x270FA5388](v34, v36);
  uint64_t v155 = (char *)&v141 - v37;
  if (qword_26A7065D0 != -1) {
    swift_once();
  }
  unsigned int v143 = v18;
  uint64_t v150 = v7;
  uint64_t v38 = __swift_project_value_buffer(v7, (uint64_t)qword_26A7089F8);
  id v39 = a1;
  swift_bridgeObjectRetain_n();
  id v40 = v39;
  uint64_t v154 = v38;
  unint64_t v41 = sub_25E7BC2C0();
  os_log_type_t v42 = sub_25E7BC4A0();
  BOOL v43 = os_log_type_enabled(v41, v42);
  uint64_t v44 = MEMORY[0x263F8EE58];
  unint64_t v156 = v40;
  uint64_t v149 = v8;
  if (v43)
  {
    unsigned int v141 = v27;
    uint64_t v45 = a2;
    uint64_t v153 = v4;
    uint64_t v46 = v40;
    uint64_t v47 = swift_slowAlloc();
    uint64_t v48 = (void *)swift_slowAlloc();
    uint64_t v49 = swift_slowAlloc();
    v163[0] = v49;
    *(_DWORD *)uint64_t v47 = 138543618;
    id v50 = objc_msgSend(v46, sel_peerDevice);
    id v51 = v50;
    unint64_t v151 = (unsigned int (*)(void, void, void))v49;
    if (v50) {
      v162[0] = (uint64_t)v50;
    }
    else {
      v162[0] = 0;
    }
    sub_25E7BC520();
    *uint64_t v48 = v51;
    unint64_t v52 = v156;

    *(_WORD *)(v47 + 12) = 2082;
    a2 = v45;
    swift_bridgeObjectRetain();
    uint64_t v53 = sub_25E7BC3A0();
    unint64_t v55 = v54;
    swift_bridgeObjectRelease();
    v162[0] = sub_25E77CF40(v53, v55, v163);
    sub_25E7BC520();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25E775000, v41, v42, "Received the following objects from [%{public}@]: %{public}s", (uint8_t *)v47, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A7069B0);
    swift_arrayDestroy();
    MEMORY[0x2611E3480](v48, -1, -1);
    id v56 = v151;
    uint64_t v44 = MEMORY[0x263F8EE58];
    swift_arrayDestroy();
    MEMORY[0x2611E3480](v56, -1, -1);
    MEMORY[0x2611E3480](v47, -1, -1);

    uint64_t v4 = v153;
    uint64_t v27 = v141;
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  uint64_t v153 = a2;
  uint64_t v57 = (void *)sub_25E7BC370();
  uint64_t v58 = (void *)sub_25E7BC3D0();
  id v59 = (id)NSDictionaryGetNSNumber();

  if (!v59) {
    __break(1u);
  }
  char v60 = sub_25E7BC770();

  uint64_t v61 = v4 + OBJC_IVAR___WFSetupServerInternal_peer;
  swift_beginAccess();
  sub_25E7998C8(v61, (uint64_t)v27, &qword_26A706998);
  uint64_t v62 = v157;
  uint64_t v63 = v158;
  unint64_t v151 = (unsigned int (*)(void, void, void))*((void *)v158 + 6);
  if (v151(v27, 1, v157) == 1)
  {
    sub_25E784970((uint64_t)v27, &qword_26A706998);
    goto LABEL_20;
  }
  uint64_t v64 = v4;
  uint64_t v65 = (void (*)(char *, char *, uint64_t))*((void *)v63 + 4);
  v65(v155, v27, v62);
  id v66 = objc_msgSend(v156, sel_peerDevice);
  if (v66)
  {
    unint64_t v67 = v66;
    id v68 = objc_msgSend(v66, sel_identifier);

    if (v68)
    {
      unint64_t v69 = v147;
      sub_25E7BC270();

      uint64_t v70 = v69;
      uint64_t v71 = 0;
      uint64_t v62 = v157;
    }
    else
    {
      uint64_t v71 = 1;
      uint64_t v62 = v157;
      uint64_t v70 = v147;
    }
    uint64_t v63 = v158;
    (*((void (**)(char *, uint64_t, uint64_t, uint64_t))v158 + 7))(v70, v71, 1, v62);
    uint64_t v74 = (uint64_t)v70;
    uint64_t v73 = v152;
    sub_25E79721C(v74, v152, &qword_26A706998);
    if (v151(v73, 1, v62) != 1)
    {
      id v75 = v144;
      v65(v144, (char *)v73, v62);
      os_log_t v76 = v75;
      sub_25E799664(&qword_26A706A70, MEMORY[0x263F07508]);
      uint64_t v77 = v155;
      uint64_t v78 = v62;
      if ((sub_25E7BC3C0() & 1) == 0)
      {
        sub_25E79603C(v156);
        os_log_type_t v116 = (void (*)(char *, uint64_t))*((void *)v158 + 1);
        v116(v75, v78);
        v116(v77, v78);
        return;
      }
      id v79 = (void (*)(char *, uint64_t))*((void *)v158 + 1);
      v79(v76, v62);
      v79(v77, v62);
      goto LABEL_19;
    }
  }
  else
  {
    uint64_t v72 = v152;
    (*((void (**)(uint64_t, uint64_t, uint64_t, uint64_t))v63 + 7))(v152, 1, 1, v62);
    uint64_t v73 = v72;
  }
  (*((void (**)(char *, uint64_t))v63 + 1))(v155, v62);
  sub_25E784970(v73, &qword_26A706998);
LABEL_19:
  uint64_t v4 = v64;
  uint64_t v44 = MEMORY[0x263F8EE58];
LABEL_20:
  switch(v60)
  {
    case 1:
      if ((v148 & 1) == 0) {
        goto LABEL_33;
      }
      sub_25E798CF8(0xD000000000000021, 0x800000025E7C03D0, "FIXME: %{public}s");
      break;
    case 3:
      uint64_t v87 = sub_25E7BC2C0();
      os_log_type_t v88 = sub_25E7BC4A0();
      if (os_log_type_enabled(v87, v88))
      {
        unint64_t v89 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)unint64_t v89 = 0;
        _os_log_impl(&dword_25E775000, v87, v88, "PreAuth request received.", v89, 2u);
        MEMORY[0x2611E3480](v89, -1, -1);
      }

      uint64_t v90 = v4 + OBJC_IVAR___WFSetupServerInternal_receivedObjectHandler;
      swift_beginAccess();
      uint64_t v92 = *(void (**)(uint64_t))v90;
      uint64_t v91 = *(void *)(v90 + 8);
      sub_25E785E00((uint64_t)v92);
      sub_25E7AF794(v153, 1, v92, v91);
      sub_25E785F38((uint64_t)v92);
      uint64_t v93 = (void *)sub_25E7BC370();
      uint64_t v94 = v4 + OBJC_IVAR___WFSetupServerInternal_setupProgressEventHandler;
      swift_beginAccess();
      uint64_t v96 = *(void (**)(void, void))v94;
      uint64_t v95 = *(void *)(v94 + 8);
      sub_25E785E00((uint64_t)v96);
      sub_25E7ADD10(0xAuLL, v93, 1, v96, v95);
      sub_25E785F38((uint64_t)v96);

      uint64_t v98 = v149;
      uint64_t v97 = v150;
      uint64_t v99 = v146;
      (*(void (**)(char *, uint64_t, uint64_t))(v149 + 16))(v146, v154, v150);
      uint64_t v100 = sub_25E7BC2C0();
      os_log_type_t v101 = sub_25E7BC4A0();
      LODWORD(v156) = v101;
      if (os_log_type_enabled(v100, v101))
      {
        uint64_t v155 = (char *)(v44 + 8);
        uint64_t v102 = (uint8_t *)swift_slowAlloc();
        uint64_t v152 = swift_slowAlloc();
        v160[0] = v152;
        *(_DWORD *)uint64_t v102 = 136315138;
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A706A68);
        uint64_t inited = swift_initStackObject();
        *(_OWORD *)(inited + 16) = xmmword_25E7BDF10;
        unsigned int v147 = (char *)(v102 + 4);
        *(void *)(inited + 32) = 28783;
        *(void *)(inited + 40) = 0xE200000000000000;
        *(_DWORD *)(inited + 48) = 4;
        sub_25E788824(inited);
        uint64_t v104 = sub_25E7BC3A0();
        uint64_t v153 = v4;
        unint64_t v106 = v105;
        swift_bridgeObjectRelease();
        uint64_t v159 = sub_25E77CF40(v104, v106, v160);
        sub_25E7BC520();
        uint64_t v4 = v153;
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_25E775000, v100, (os_log_type_t)v156, "Sending PreAuth Response: %s", v102, 0xCu);
        uint64_t v107 = v152;
        swift_arrayDestroy();
        MEMORY[0x2611E3480](v107, -1, -1);
        MEMORY[0x2611E3480](v102, -1, -1);

        (*(void (**)(char *, uint64_t))(v149 + 8))(v146, v150);
      }
      else
      {

        (*(void (**)(char *, uint64_t))(v98 + 8))(v99, v97);
      }
      os_log_t v117 = v158;
      uint64_t v118 = *(void **)(v4 + OBJC_IVAR___WFSetupServerInternal_sfService);
      if (!v118)
      {
        uint64_t v108 = sub_25E7BC2C0();
        os_log_type_t v133 = sub_25E7BC490();
        if (!os_log_type_enabled(v108, v133)) {
          goto LABEL_51;
        }
        v134 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v134 = 0;
        _os_log_impl(&dword_25E775000, v108, v133, "Unexpectedly found the sfService to be nil", v134, 2u);
        v115 = v134;
        goto LABEL_50;
      }
      uint64_t v119 = (uint64_t)v143;
      sub_25E7998C8(v61, (uint64_t)v143, &qword_26A706998);
      uint64_t v120 = v157;
      if (v151(v119, 1, v157) == 1)
      {
        id v121 = v118;
        sub_25E784970(v119, &qword_26A706998);
        uint64_t v122 = sub_25E7BC2C0();
        os_log_type_t v123 = sub_25E7BC490();
        if (os_log_type_enabled(v122, v123))
        {
          uint64_t v124 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v124 = 0;
          _os_log_impl(&dword_25E775000, v122, v123, "Unexpectedly found the peer to be nil", v124, 2u);
          MEMORY[0x2611E3480](v124, -1, -1);
        }
      }
      else
      {
        v135 = v142;
        (*((void (**)(char *, uint64_t, uint64_t))v117 + 4))(v142, v119, v120);
        v136 = v117;
        id v137 = v118;
        v138 = (void *)sub_25E7BC260();
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A706D80);
        uint64_t v139 = swift_initStackObject();
        *(_OWORD *)(v139 + 16) = xmmword_25E7BDF10;
        v160[0] = 28783;
        v160[1] = 0xE200000000000000;
        sub_25E7BC580();
        *(void *)(v139 + 96) = MEMORY[0x263F8E548];
        *(_DWORD *)(v139 + 72) = 4;
        sub_25E7885A8(v139);
        v140 = (void *)sub_25E7BC370();
        swift_bridgeObjectRelease();
        objc_msgSend(v137, sel_sendToPeer_flags_object_, v138, v148, v140);

        (*((void (**)(char *, uint64_t))v136 + 1))(v135, v120);
      }
      break;
    case 4:
      sub_25E794CF4();
      break;
    case 5:
      if (v148)
      {
        v125 = sub_25E7BC2C0();
        os_log_type_t v126 = sub_25E7BC4A0();
        BOOL v127 = os_log_type_enabled(v125, v126);
        uint64_t v128 = v153;
        if (v127)
        {
          v129 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v129 = 0;
          _os_log_impl(&dword_25E775000, v125, v126, "Received config message", v129, 2u);
          MEMORY[0x2611E3480](v129, -1, -1);
        }

        uint64_t v130 = v4 + OBJC_IVAR___WFSetupServerInternal_receivedObjectHandler;
        swift_beginAccess();
        v132 = *(void (**)(uint64_t))v130;
        uint64_t v131 = *(void *)(v130 + 8);
        sub_25E785E00((uint64_t)v132);
        sub_25E7AF794(v128, 1, v132, v131);
        sub_25E785F38((uint64_t)v132);
      }
      else
      {
LABEL_33:
        swift_bridgeObjectRetain_n();
        uint64_t v108 = sub_25E7BC2C0();
        os_log_type_t v109 = sub_25E7BC4A0();
        if (os_log_type_enabled(v108, v109))
        {
          uint64_t v110 = (uint8_t *)swift_slowAlloc();
          uint64_t v111 = swift_slowAlloc();
          v162[0] = v111;
          *(_DWORD *)uint64_t v110 = 136446210;
          unint64_t v158 = v110 + 4;
          swift_bridgeObjectRetain();
          uint64_t v112 = sub_25E7BC3A0();
          unint64_t v114 = v113;
          swift_bridgeObjectRelease();
          uint64_t v161 = sub_25E77CF40(v112, v114, v162);
          sub_25E7BC520();
          swift_bridgeObjectRelease_n();
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_25E775000, v108, v109, "Ignoring unencrypted config request: %{public}s", v110, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x2611E3480](v111, -1, -1);
          v115 = v110;
LABEL_50:
          MEMORY[0x2611E3480](v115, -1, -1);
LABEL_51:
        }
        else
        {

          swift_bridgeObjectRelease_n();
        }
      }
      break;
    case 12:
      sub_25E794990(v153);
      break;
    default:
      uint64_t v81 = v149;
      uint64_t v80 = v150;
      v82 = v145;
      (*(void (**)(char *, uint64_t, uint64_t))(v149 + 16))(v145, v154, v150);
      uint64_t v83 = sub_25E7BC2C0();
      os_log_type_t v84 = sub_25E7BC4A0();
      if (os_log_type_enabled(v83, v84))
      {
        uint64_t v85 = swift_slowAlloc();
        uint64_t v86 = swift_slowAlloc();
        v162[0] = v86;
        *(_DWORD *)uint64_t v85 = 16777730;
        LOBYTE(v161) = v60;
        sub_25E7BC520();
        *(_WORD *)(v85 + 5) = 2080;
        uint64_t v161 = sub_25E77CF40(7104878, 0xE300000000000000, v162);
        sub_25E7BC520();
        _os_log_impl(&dword_25E775000, v83, v84, "Ignoring unsupported opcode %hhu, %s", (uint8_t *)v85, 0xFu);
        swift_arrayDestroy();
        MEMORY[0x2611E3480](v86, -1, -1);
        MEMORY[0x2611E3480](v85, -1, -1);

        (*(void (**)(char *, uint64_t))(v81 + 8))(v145, v80);
      }
      else
      {

        (*(void (**)(char *, uint64_t))(v81 + 8))(v82, v80);
      }
      break;
  }
}

void sub_25E792520()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_25E7BC340();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2, v4);
  uint64_t v6 = (uint64_t *)((char *)&v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v7 = (void **)(v1 + OBJC_IVAR___WFSetupServerInternal_dispatchQueue);
  swift_beginAccess();
  uint64_t v8 = *v7;
  *uint64_t v6 = v8;
  (*(void (**)(void *, void, uint64_t))(v3 + 104))(v6, *MEMORY[0x263F8F0E0], v2);
  id v9 = v8;
  LOBYTE(v8) = sub_25E7BC360();
  (*(void (**)(void *, uint64_t))(v3 + 8))(v6, v2);
  if ((v8 & 1) == 0)
  {
    __break(1u);
    goto LABEL_29;
  }
  uint64_t v10 = v1 + OBJC_IVAR___WFSetupServerInternal_serverState;
  if (*(unsigned char *)(v1 + OBJC_IVAR___WFSetupServerInternal_serverState + 2)
    && *(unsigned char *)(v1 + OBJC_IVAR___WFSetupServerInternal_serverState + 2) != 1)
  {
    swift_bridgeObjectRelease();
LABEL_9:
    if (qword_26A7065D0 == -1)
    {
LABEL_10:
      uint64_t v12 = sub_25E7BC2E0();
      __swift_project_value_buffer(v12, (uint64_t)qword_26A7089F8);
      uint64_t v13 = sub_25E7BC2C0();
      os_log_type_t v14 = sub_25E7BC4A0();
      if (!os_log_type_enabled(v13, v14))
      {
LABEL_13:

        return;
      }
      uint64_t v15 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v15 = 0;
      uint64_t v16 = "Invalidated already";
LABEL_12:
      _os_log_impl(&dword_25E775000, v13, v14, v16, v15, 2u);
      MEMORY[0x2611E3480](v15, -1, -1);
      goto LABEL_13;
    }
LABEL_29:
    swift_once();
    goto LABEL_10;
  }
  char v11 = sub_25E7BC6D0();
  swift_bridgeObjectRelease();
  if (v11) {
    goto LABEL_9;
  }
  if (*(unsigned char *)(v10 + 2) && *(unsigned char *)(v10 + 2) == 1)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    char v17 = sub_25E7BC6D0();
    swift_bridgeObjectRelease();
    if ((v17 & 1) == 0)
    {
      if (qword_26A7065D0 != -1) {
        swift_once();
      }
      uint64_t v18 = sub_25E7BC2E0();
      __swift_project_value_buffer(v18, (uint64_t)qword_26A7089F8);
      uint64_t v19 = sub_25E7BC2C0();
      os_log_type_t v20 = sub_25E7BC4A0();
      if (os_log_type_enabled(v19, v20))
      {
        uint64_t v21 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v21 = 0;
        _os_log_impl(&dword_25E775000, v19, v20, "Unexpectedly invalidated", v21, 2u);
        MEMORY[0x2611E3480](v21, -1, -1);
      }
    }
  }
  if (!*(void *)(v1 + OBJC_IVAR___WFSetupServerInternal_sfService))
  {
    uint64_t v22 = (uint64_t *)(v1 + OBJC_IVAR___WFSetupServerInternal_completionHandler);
    swift_beginAccess();
    uint64_t v23 = (void (*)(void))*v22;
    if (*v22)
    {
      swift_retain();
      v23(0);
      sub_25E785F38((uint64_t)v23);
      uint64_t v24 = *v22;
    }
    else
    {
      uint64_t v24 = 0;
    }
    *uint64_t v22 = 0;
    v22[1] = 0;
    sub_25E785F38(v24);
    uint64_t v25 = (uint64_t *)(v1 + OBJC_IVAR___WFSetupServerInternal_setupProgressEventHandler);
    swift_beginAccess();
    uint64_t v26 = *v25;
    *uint64_t v25 = 0;
    v25[1] = 0;
    sub_25E785F38(v26);
    *(unsigned char *)(v10 + 2) = 2;
    if (qword_26A7065D0 != -1) {
      swift_once();
    }
    uint64_t v27 = sub_25E7BC2E0();
    __swift_project_value_buffer(v27, (uint64_t)qword_26A7089F8);
    uint64_t v13 = sub_25E7BC2C0();
    os_log_type_t v14 = sub_25E7BC4A0();
    if (!os_log_type_enabled(v13, v14)) {
      goto LABEL_13;
    }
    uint64_t v15 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v15 = 0;
    uint64_t v16 = "Invalidated";
    goto LABEL_12;
  }
}

void sub_25E792A10(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_25E7BC280();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4, v6);
  os_log_t v94 = (os_log_t)((char *)&v85 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A706998);
  uint64_t v10 = MEMORY[0x270FA5388](v8 - 8, v9);
  uint64_t v12 = (char *)&v85 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10, v13);
  uint64_t v15 = (char *)&v85 - v14;
  uint64_t v16 = sub_25E7BC2E0();
  uint64_t v17 = *(void *)(v16 - 8);
  MEMORY[0x270FA5388](v16, v18);
  os_log_type_t v20 = (char *)&v85 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = OBJC_IVAR___WFSetupServerInternal_sfSession;
  if (*(void *)&v2[OBJC_IVAR___WFSetupServerInternal_sfSession])
  {
    uint64_t v91 = v5;
    uint64_t v92 = v4;
    if (qword_26A7065D0 != -1) {
      swift_once();
    }
    uint64_t v22 = __swift_project_value_buffer(v16, (uint64_t)qword_26A7089F8);
    (*(void (**)(char *, uint64_t, uint64_t))(v17 + 16))(v20, v22, v16);
    id v23 = a1;
    uint64_t v24 = v16;
    uint64_t v25 = v17;
    uint64_t v26 = v2;
    id v27 = v23;
    uint64_t v28 = v26;
    uint64_t v29 = sub_25E7BC2C0();
    int v93 = sub_25E7BC4A0();
    if (os_log_type_enabled(v29, (os_log_type_t)v93))
    {
      os_log_t v88 = v29;
      uint64_t v89 = v25;
      uint64_t v90 = v2;
      uint64_t v30 = 7104878;
      uint64_t v31 = swift_slowAlloc();
      uint64_t v87 = swift_slowAlloc();
      uint64_t aBlock = v87;
      *(_DWORD *)uint64_t v31 = 136446466;
      id v32 = objc_msgSend(v27, sel_peerDevice);
      uint64_t v86 = v28;
      if (v32)
      {
        uint64_t v33 = v32;
        id v34 = objc_msgSend(v32, sel_identifier);

        uint64_t v85 = v24;
        if (v34)
        {
          sub_25E7BC270();

          uint64_t v35 = 0;
        }
        else
        {
          uint64_t v35 = 1;
        }
        uint64_t v71 = v91;
        uint64_t v72 = v92;
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v91 + 56))(v12, v35, 1, v92);
        sub_25E79721C((uint64_t)v12, (uint64_t)v15, &qword_26A706998);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v71 + 48))(v15, 1, v72))
        {
          sub_25E784970((uint64_t)v15, &qword_26A706998);
          unint64_t v69 = 0xE300000000000000;
          uint64_t v70 = 7104878;
        }
        else
        {
          os_log_t v73 = v94;
          (*(void (**)(os_log_t, char *, uint64_t))(v71 + 16))(v94, v15, v72);
          sub_25E784970((uint64_t)v15, &qword_26A706998);
          uint64_t v70 = sub_25E7BC250();
          unint64_t v69 = v74;
          os_log_t v75 = v73;
          uint64_t v30 = 7104878;
          (*(void (**)(os_log_t, uint64_t))(v71 + 8))(v75, v72);
        }
        uint64_t v24 = v85;
      }
      else
      {
        unint64_t v69 = 0xE300000000000000;
        uint64_t v70 = 7104878;
      }
      uint64_t v95 = sub_25E77CF40(v70, v69, &aBlock);
      sub_25E7BC520();

      swift_bridgeObjectRelease();
      *(_WORD *)(v31 + 12) = 2082;
      os_log_t v76 = *(void **)&v90[v21];
      if (v76 && (id v77 = objc_msgSend(v76, sel_peerDevice)) != 0)
      {
        uint64_t v78 = v77;
        id v79 = objc_msgSend(v77, sel_description);

        uint64_t v30 = sub_25E7BC3E0();
        unint64_t v81 = v80;
      }
      else
      {
        unint64_t v81 = 0xE300000000000000;
      }
      uint64_t v95 = sub_25E77CF40(v30, v81, &aBlock);
      sub_25E7BC520();
      v82 = v86;

      swift_bridgeObjectRelease();
      os_log_t v83 = v88;
      _os_log_impl(&dword_25E775000, v88, (os_log_type_t)v93, "Ignoring session from:  %{public}s when active with: %{public}s", (uint8_t *)v31, 0x16u);
      uint64_t v84 = v87;
      swift_arrayDestroy();
      MEMORY[0x2611E3480](v84, -1, -1);
      MEMORY[0x2611E3480](v31, -1, -1);

      (*(void (**)(char *, uint64_t))(v89 + 8))(v20, v24);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v25 + 8))(v20, v24);
    }
  }
  else
  {
    *(void *)&v2[OBJC_IVAR___WFSetupServerInternal_sfSession] = a1;
    id v36 = a1;
    id v37 = objc_msgSend(v36, sel_messageSessionTemplate);
    if (v37)
    {
      uint64_t v38 = v37;
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A706D80);
      uint64_t inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_25E7BDF30;
      uint64_t aBlock = 0x746365726964;
      unint64_t v97 = 0xE600000000000000;
      os_log_t v94 = v38;
      sub_25E7BC580();
      uint64_t v40 = MEMORY[0x263F8D4F8];
      *(void *)(inited + 96) = MEMORY[0x263F8D4F8];
      *(unsigned char *)(inited + 72) = 1;
      uint64_t aBlock = 0xD000000000000010;
      unint64_t v97 = 0x800000025E7BFCC0;
      sub_25E7BC580();
      *(void *)(inited + 168) = v40;
      *(unsigned char *)(inited + 144) = 1;
      sub_25E7885A8(inited);
      unint64_t v41 = (void *)sub_25E7BC3D0();
      os_log_type_t v42 = (void *)sub_25E7BC370();
      uint64_t v43 = swift_allocObject();
      swift_unknownObjectWeakInit();
      uint64_t v100 = sub_25E7994F4;
      uint64_t v101 = v43;
      uint64_t aBlock = MEMORY[0x263EF8330];
      unint64_t v97 = 1107296256;
      uint64_t v98 = sub_25E79BAC8;
      uint64_t v99 = &block_descriptor_73;
      uint64_t v44 = _Block_copy(&aBlock);
      swift_release();
      objc_msgSend(v36, sel_registerRequestID_options_handler_, v41, v42, v44);
      _Block_release(v44);

      uint64_t v45 = (void *)sub_25E7BC3D0();
      uint64_t v46 = (void *)sub_25E7BC370();
      uint64_t v47 = swift_allocObject();
      swift_unknownObjectWeakInit();
      uint64_t v100 = sub_25E7994FC;
      uint64_t v101 = v47;
      uint64_t aBlock = MEMORY[0x263EF8330];
      unint64_t v97 = 1107296256;
      uint64_t v98 = sub_25E79BAC8;
      uint64_t v99 = &block_descriptor_77;
      uint64_t v48 = _Block_copy(&aBlock);
      swift_release();
      objc_msgSend(v36, sel_registerRequestID_options_handler_, v45, v46, v48);
      _Block_release(v48);

      uint64_t v49 = (void *)sub_25E7BC3D0();
      id v50 = (void *)sub_25E7BC370();
      swift_bridgeObjectRelease();
      uint64_t v51 = swift_allocObject();
      swift_unknownObjectWeakInit();
      uint64_t v100 = sub_25E79952C;
      uint64_t v101 = v51;
      uint64_t aBlock = MEMORY[0x263EF8330];
      unint64_t v97 = 1107296256;
      uint64_t v98 = sub_25E79BAC8;
      uint64_t v99 = &block_descriptor_81;
      unint64_t v52 = _Block_copy(&aBlock);
      swift_release();
      objc_msgSend(v36, sel_registerRequestID_options_handler_, v49, v50, v52);
      _Block_release(v52);

      uint64_t v53 = swift_allocObject();
      swift_unknownObjectWeakInit();
      uint64_t v54 = swift_allocObject();
      *(void *)(v54 + 16) = v53;
      *(void *)(v54 + 24) = v36;
      uint64_t v100 = sub_25E79959C;
      uint64_t v101 = v54;
      uint64_t aBlock = MEMORY[0x263EF8330];
      unint64_t v97 = 1107296256;
      uint64_t v98 = sub_25E79B70C;
      uint64_t v99 = &block_descriptor_88;
      unint64_t v55 = _Block_copy(&aBlock);
      id v56 = v36;
      swift_release();
      objc_msgSend(v56, sel_setErrorHandler_, v55);
      _Block_release(v55);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A706A30);
      uint64_t v57 = swift_allocObject();
      *(_OWORD *)(v57 + 16) = xmmword_25E7BDF10;
      *(void *)(v57 + 56) = MEMORY[0x263F8D310];
      *(void *)(v57 + 32) = 7631725;
      *(void *)(v57 + 40) = 0xE300000000000000;
      *(void *)(v57 + 88) = sub_25E78314C(0, &qword_26A706A38);
      os_log_t v58 = v94;
      *(void *)(v57 + 64) = v94;
      sub_25E78314C(0, (unint64_t *)&qword_26A706DF0);
      id v59 = v58;
      char v60 = (void *)sub_25E7BC480();
      uint64_t v61 = &v2[OBJC_IVAR___WFSetupServerInternal_setupProgressEventHandler];
      swift_beginAccess();
      uint64_t v63 = *(void (**)(void, void))v61;
      uint64_t v62 = *((void *)v61 + 1);
      sub_25E785E00((uint64_t)v63);
      sub_25E7ADD10(3uLL, v60, 1, v63, v62);
      sub_25E785F38((uint64_t)v63);

      uint64_t v64 = *(void **)&v2[OBJC_IVAR___WFSetupServerInternal_sfService];
      if (v64)
      {
        id v65 = v64;
        objc_msgSend(v65, sel_setNeedsSetup_, 0);
      }
    }
    else
    {
      if (qword_26A7065D0 != -1) {
        swift_once();
      }
      __swift_project_value_buffer(v16, (uint64_t)qword_26A7089F8);
      os_log_t v94 = (os_log_t)sub_25E7BC2C0();
      os_log_type_t v66 = sub_25E7BC4A0();
      if (os_log_type_enabled(v94, v66))
      {
        unint64_t v67 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)unint64_t v67 = 0;
        _os_log_impl(&dword_25E775000, v94, v66, "No message template", v67, 2u);
        MEMORY[0x2611E3480](v67, -1, -1);
      }
      os_log_t v68 = v94;
    }
  }
}

void sub_25E79377C(uint64_t a1, uint64_t a2, void (*a3)(void, void, unint64_t), uint64_t a4, uint64_t a5)
{
  uint64_t v7 = a5 + 16;
  swift_beginAccess();
  uint64_t v8 = MEMORY[0x2611E34D0](v7);
  if (v8)
  {
    uint64_t v9 = (void *)v8;
    sub_25E798EA0(a2, a3);
  }
}

void sub_25E7937F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void (*a6)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v10 = a5 + 16;
  swift_beginAccess();
  uint64_t v11 = MEMORY[0x2611E34D0](v10);
  if (v11)
  {
    uint64_t v12 = (void *)v11;
    a6(a2, a3, a4);
  }
}

void sub_25E793878(void *a1, uint64_t a2, void *a3)
{
  v45[8] = *MEMORY[0x263EF8340];
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A706998);
  uint64_t v8 = MEMORY[0x270FA5388](v6 - 8, v7);
  uint64_t v10 = (char *)&v42 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8, v11);
  uint64_t v13 = (char *)&v42 - v12;
  if (qword_26A7065D0 != -1) {
    swift_once();
  }
  uint64_t v14 = sub_25E7BC2E0();
  __swift_project_value_buffer(v14, (uint64_t)qword_26A7089F8);
  id v15 = a1;
  id v16 = a1;
  uint64_t v17 = sub_25E7BC2C0();
  os_log_type_t v18 = sub_25E7BC4A0();
  if (os_log_type_enabled(v17, v18))
  {
    uint64_t v43 = a2;
    uint64_t v19 = a3;
    os_log_type_t v20 = (uint8_t *)swift_slowAlloc();
    uint64_t v21 = (void *)swift_slowAlloc();
    *(_DWORD *)os_log_type_t v20 = 138412290;
    if (a1)
    {
      id v22 = a1;
      uint64_t v23 = _swift_stdlib_bridgeErrorToNSError();
      v45[0] = v23;
      sub_25E7BC520();
    }
    else
    {
      v45[0] = 0;
      sub_25E7BC520();
      uint64_t v23 = 0;
    }
    *uint64_t v21 = v23;

    _os_log_impl(&dword_25E775000, v17, v18, "Error Handler invoked with error: %@", v20, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A7069B0);
    swift_arrayDestroy();
    MEMORY[0x2611E3480](v21, -1, -1);
    MEMORY[0x2611E3480](v20, -1, -1);

    a3 = v19;
    a2 = v43;
    if (!a1) {
      return;
    }
  }
  else
  {

    if (!a1) {
      return;
    }
  }
  swift_beginAccess();
  uint64_t v24 = MEMORY[0x2611E34D0](a2 + 16);
  if (v24)
  {
    uint64_t v25 = (void *)v24;
    id v26 = a1;
    swift_retain();

    id v27 = objc_msgSend(a3, sel_identifier);
    if (v27)
    {
      uint64_t v28 = v27;
      sub_25E7BC270();

      uint64_t v29 = sub_25E7BC280();
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v29 - 8) + 56))(v10, 0, 1, v29);
    }
    else
    {
      uint64_t v29 = sub_25E7BC280();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v29 - 8) + 56))(v10, 1, 1, v29);
    }
    sub_25E79721C((uint64_t)v10, (uint64_t)v13, &qword_26A706998);
    sub_25E7BC280();
    uint64_t v30 = *(void *)(v29 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v30 + 48))(v13, 1, v29) == 1)
    {
      sub_25E784970((uint64_t)v13, &qword_26A706998);
      uint64_t v31 = 0;
      unint64_t v32 = 0xE000000000000000;
    }
    else
    {
      uint64_t v31 = sub_25E7BC240();
      unint64_t v32 = v33;
      (*(void (**)(char *, uint64_t))(v30 + 8))(v13, v29);
    }
    id v34 = (void *)sub_25E7BC1D0();
    id v35 = objc_msgSend(v34, sel_code);

    id v44 = v35;
    uint64_t v36 = sub_25E7BC6B0();
    uint64_t v38 = v37;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A706A58);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_25E7BDF10;
    *(void *)(inited + 32) = 0x646F43726F727265;
    *(void *)(inited + 40) = 0xE900000000000065;
    *(void *)(inited + 48) = v36;
    *(void *)(inited + 56) = v38;
    unint64_t v40 = sub_25E788938(inited);
    v45[3] = &type metadata for DisconnectedProximitySetupServerAnalyticsEvent;
    v45[4] = sub_25E7995A4();
    unint64_t v41 = (void *)swift_allocObject();
    v45[0] = v41;
    v41[2] = 0xD000000000000035;
    v41[3] = 0x800000025E7C0350;
    v41[4] = v31;
    v41[5] = v32;
    v41[6] = v40;
    sub_25E7AA5F8(v45);

    swift_release();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v45);
  }
}

void sub_25E793DA8(uint64_t a1, void (*a2)(void, void, void))
{
  if (qword_26A7065D0 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_25E7BC2E0();
  __swift_project_value_buffer(v4, (uint64_t)qword_26A7089F8);
  swift_bridgeObjectRetain_n();
  uint64_t v5 = sub_25E7BC2C0();
  os_log_type_t v6 = sub_25E7BC4A0();
  if (os_log_type_enabled(v5, v6))
  {
    unint64_t v32 = a2;
    uint64_t v7 = swift_slowAlloc();
    uint64_t v31 = swift_slowAlloc();
    v33[0] = v31;
    *(_DWORD *)uint64_t v7 = 136446466;
    *(void *)&long long v34 = sub_25E77CF40(0xD000000000000028, 0x800000025E7C02A0, v33);
    sub_25E7BC520();
    *(_WORD *)(v7 + 12) = 2082;
    swift_bridgeObjectRetain();
    uint64_t v8 = sub_25E7BC3A0();
    unint64_t v10 = v9;
    swift_bridgeObjectRelease();
    *(void *)&long long v34 = sub_25E77CF40(v8, v10, v33);
    sub_25E7BC520();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25E775000, v5, v6, "%{public}s invoked with request: %{public}s", (uint8_t *)v7, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x2611E3480](v31, -1, -1);
    uint64_t v11 = v7;
    a2 = v32;
    MEMORY[0x2611E3480](v11, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  uint64_t v12 = MEMORY[0x263F8D310];
  sub_25E7BC580();
  if (*(void *)(a1 + 16) && (unint64_t v13 = sub_25E7A8CC8((uint64_t)v33), (v14 & 1) != 0))
  {
    sub_25E77D9C8(*(void *)(a1 + 56) + 32 * v13, (uint64_t)&v34);
  }
  else
  {
    long long v34 = 0u;
    long long v35 = 0u;
  }
  sub_25E798CA4((uint64_t)v33);
  if (*((void *)&v35 + 1))
  {
    if (swift_dynamicCast())
    {
      id v27 = sub_25E7BC2C0();
      os_log_type_t v28 = sub_25E7BC4A0();
      if (os_log_type_enabled(v27, v28))
      {
        uint64_t v29 = (uint8_t *)swift_slowAlloc();
        uint64_t v30 = swift_slowAlloc();
        v33[0] = v30;
        *(_DWORD *)uint64_t v29 = 136446210;
        *(void *)&long long v34 = sub_25E77CF40(0xD000000000000028, 0x800000025E7C02A0, v33);
        sub_25E7BC520();
        _os_log_impl(&dword_25E775000, v27, v28, "%{public}s received unknown setup event", v29, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x2611E3480](v30, -1, -1);
        MEMORY[0x2611E3480](v29, -1, -1);
      }

      return;
    }
  }
  else
  {
    sub_25E784970((uint64_t)&v34, &qword_26A706790);
  }
  swift_bridgeObjectRetain_n();
  id v15 = sub_25E7BC2C0();
  os_log_type_t v16 = sub_25E7BC490();
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v17 = (uint8_t *)swift_slowAlloc();
    uint64_t v18 = swift_slowAlloc();
    v33[0] = v18;
    *(_DWORD *)uint64_t v17 = 136446210;
    swift_bridgeObjectRetain();
    uint64_t v19 = sub_25E7BC3A0();
    os_log_type_t v20 = a2;
    unint64_t v22 = v21;
    swift_bridgeObjectRelease();
    *(void *)&long long v34 = sub_25E77CF40(v19, v22, v33);
    sub_25E7BC520();
    swift_bridgeObjectRelease_n();
    a2 = v20;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25E775000, v15, v16, "Failed to retrieve security event raw value from request: %{public}s", v17, 0xCu);
    uint64_t v12 = MEMORY[0x263F8D310];
    swift_arrayDestroy();
    MEMORY[0x2611E3480](v18, -1, -1);
    MEMORY[0x2611E3480](v17, -1, -1);

    if (!v20) {
      return;
    }
  }
  else
  {

    swift_bridgeObjectRelease_n();
    if (!a2) {
      return;
    }
  }
  sub_25E796844();
  uint64_t v23 = (void *)swift_allocError();
  *uint64_t v24 = 3;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A706D80);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_25E7BDF10;
  v33[0] = 0;
  v33[1] = 0xE000000000000000;
  sub_25E7BC580();
  *(void *)(inited + 96) = v12;
  *(void *)(inited + 72) = 0;
  *(void *)(inited + 80) = 0xE000000000000000;
  unint64_t v26 = sub_25E7885A8(inited);
  a2(v23, 0, v26);
  swift_bridgeObjectRelease();
}

void sub_25E794624(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_25E7BC2E0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4, v6);
  uint64_t v8 = (char *)&v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = OBJC_IVAR___WFSetupServerInternal_sfSession;
  unint64_t v10 = *(void **)&v2[OBJC_IVAR___WFSetupServerInternal_sfSession];
  if (v10)
  {
    sub_25E78314C(0, &qword_26A706A50);
    id v11 = a1;
    id v12 = v10;
    char v13 = sub_25E7BC500();

    if (v13)
    {
      if (qword_26A7065D0 != -1) {
        swift_once();
      }
      uint64_t v14 = __swift_project_value_buffer(v4, (uint64_t)qword_26A7089F8);
      (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v8, v14, v4);
      id v15 = v2;
      os_log_type_t v16 = sub_25E7BC2C0();
      os_log_type_t v17 = sub_25E7BC4A0();
      if (os_log_type_enabled(v16, v17))
      {
        uint64_t v18 = (uint8_t *)swift_slowAlloc();
        uint64_t v19 = swift_slowAlloc();
        v34[0] = v19;
        *(_DWORD *)uint64_t v18 = 136446210;
        os_log_type_t v20 = *(void **)&v2[v9];
        uint64_t v32 = v19;
        if (v20 && (id v21 = objc_msgSend(v20, sel_peerDevice)) != 0)
        {
          unint64_t v22 = v21;
          id v23 = objc_msgSend(v21, sel_description);

          uint64_t v24 = sub_25E7BC3E0();
          unint64_t v26 = v25;
        }
        else
        {
          unint64_t v26 = 0xE300000000000000;
          uint64_t v24 = 7104878;
        }
        uint64_t v33 = sub_25E77CF40(v24, v26, v34);
        sub_25E7BC520();

        swift_bridgeObjectRelease();
        _os_log_impl(&dword_25E775000, v16, v17, "Ending setup session with %{public}s", v18, 0xCu);
        uint64_t v27 = v32;
        swift_arrayDestroy();
        MEMORY[0x2611E3480](v27, -1, -1);
        MEMORY[0x2611E3480](v18, -1, -1);
      }
      else
      {
      }
      (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
      os_log_type_t v28 = &v15[OBJC_IVAR___WFSetupServerInternal_setupProgressEventHandler];
      swift_beginAccess();
      uint64_t v30 = *(void (**)(void, void))v28;
      uint64_t v29 = *((void *)v28 + 1);
      sub_25E785E00((uint64_t)v30);
      sub_25E7ADD10(4uLL, 0, 1, v30, v29);
      sub_25E785F38((uint64_t)v30);
      sub_25E78C7D8();
    }
  }
}

void sub_25E794990(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_25E7BC2E0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4, v6);
  uint64_t v8 = (char *)&v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = (void *)sub_25E7BC370();
  unint64_t v10 = (void *)sub_25E7BC3D0();
  id v11 = (id)NSDictionaryGetNSNumber();

  if (qword_26A7065D0 != -1) {
    swift_once();
  }
  uint64_t v12 = __swift_project_value_buffer(v4, (uint64_t)qword_26A7089F8);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v8, v12, v4);
  id v13 = v11;
  uint64_t v14 = sub_25E7BC2C0();
  os_log_type_t v15 = sub_25E7BC4A0();
  if (os_log_type_enabled(v14, v15))
  {
    uint64_t v27 = v2;
    uint64_t v28 = a1;
    os_log_type_t v16 = (uint8_t *)swift_slowAlloc();
    uint64_t v26 = swift_slowAlloc();
    v30[0] = v26;
    *(_DWORD *)os_log_type_t v16 = 136446210;
    if (v13)
    {
      id v17 = objc_msgSend(v13, sel_description);
      uint64_t v18 = sub_25E7BC3E0();
      unint64_t v20 = v19;
    }
    else
    {
      unint64_t v20 = 0xE300000000000000;
      uint64_t v18 = 7104878;
    }
    uint64_t v29 = sub_25E77CF40(v18, v20, v30);
    sub_25E7BC520();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25E775000, v14, v15, "App event received: ID %{public}s", v16, 0xCu);
    uint64_t v21 = v26;
    swift_arrayDestroy();
    MEMORY[0x2611E3480](v21, -1, -1);
    MEMORY[0x2611E3480](v16, -1, -1);

    (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
    uint64_t v2 = v27;
    a1 = v28;
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  }
  uint64_t v22 = v2 + OBJC_IVAR___WFSetupServerInternal_receivedObjectHandler;
  swift_beginAccess();
  uint64_t v24 = *(void (**)(uint64_t))v22;
  uint64_t v23 = *(void *)(v22 + 8);
  sub_25E785E00((uint64_t)v24);
  sub_25E7AF794(a1, 1, v24, v23);
  sub_25E785F38((uint64_t)v24);
}

uint64_t sub_25E794CF4()
{
  uint64_t v1 = v0;
  if (qword_26A7065D0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_25E7BC2E0();
  __swift_project_value_buffer(v2, (uint64_t)qword_26A7089F8);
  swift_bridgeObjectRetain_n();
  uint64_t v3 = sub_25E7BC2C0();
  os_log_type_t v4 = sub_25E7BC4A0();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v14 = v1;
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v6 = swift_slowAlloc();
    v15[0] = v6;
    *(_DWORD *)uint64_t v5 = 136446210;
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_25E7BC3A0();
    unint64_t v9 = v8;
    swift_bridgeObjectRelease();
    sub_25E77CF40(v7, v9, v15);
    sub_25E7BC520();
    swift_bridgeObjectRelease_n();
    uint64_t v1 = v14;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25E775000, v3, v4, "PreAuthResponse: %{public}s, received from client", v5, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2611E3480](v6, -1, -1);
    MEMORY[0x2611E3480](v5, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  uint64_t v10 = v1 + OBJC_IVAR___WFSetupServerInternal_setupProgressEventHandler;
  swift_beginAccess();
  uint64_t v12 = *(void (**)(void, void))v10;
  uint64_t v11 = *(void *)(v10 + 8);
  sub_25E785E00((uint64_t)v12);
  sub_25E7ADD10(0xBuLL, 0, 1, v12, v11);
  return sub_25E785F38((uint64_t)v12);
}

void sub_25E794F34(void *a1)
{
  uint64_t v2 = *(void **)&v1[OBJC_IVAR___WFSetupServerInternal_sfSession];
  if (!v2)
  {
    if (qword_26A7065D0 != -1) {
      swift_once();
    }
    uint64_t v9 = sub_25E7BC2E0();
    __swift_project_value_buffer(v9, (uint64_t)qword_26A7089F8);
    uint64_t v54 = sub_25E7BC2C0();
    os_log_type_t v10 = sub_25E7BC4A0();
    if (os_log_type_enabled(v54, v10))
    {
      uint64_t v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl(&dword_25E775000, v54, v10, "sfSession is unexpectedly nil in handleSessionSecured", v11, 2u);
      MEMORY[0x2611E3480](v11, -1, -1);
    }
    goto LABEL_12;
  }
  uint64_t v54 = v2;
  id v4 = [v54 fixedPIN];
  if (v4)
  {

    if (qword_26A7065D0 != -1) {
      swift_once();
    }
    uint64_t v5 = sub_25E7BC2E0();
    __swift_project_value_buffer(v5, (uint64_t)qword_26A7089F8);
    uint64_t v6 = sub_25E7BC2C0();
    os_log_type_t v7 = sub_25E7BC4A0();
    if (os_log_type_enabled(v6, v7))
    {
      unint64_t v8 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v8 = 0;
      _os_log_impl(&dword_25E775000, v6, v7, "PreAuth session secured", v8, 2u);
      MEMORY[0x2611E3480](v8, -1, -1);
    }

    [v54 setFixedPIN:0];
LABEL_12:

    return;
  }
  if (qword_26A7065D0 != -1) {
    swift_once();
  }
  uint64_t v12 = sub_25E7BC2E0();
  __swift_project_value_buffer(v12, (uint64_t)qword_26A7089F8);
  id v13 = sub_25E7BC2C0();
  os_log_type_t v14 = sub_25E7BC4A0();
  if (os_log_type_enabled(v13, v14))
  {
    os_log_type_t v15 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)os_log_type_t v15 = 0;
    _os_log_impl(&dword_25E775000, v13, v14, "PostAuth session secured", v15, 2u);
    MEMORY[0x2611E3480](v15, -1, -1);
  }

  os_log_type_t v16 = sub_25E7BC2C0();
  os_log_type_t v17 = sub_25E7BC4A0();
  if (os_log_type_enabled(v16, v17))
  {
    uint64_t v18 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v18 = 0;
    _os_log_impl(&dword_25E775000, v16, v17, "Setting up anisetteDataProvider…", v18, 2u);
    MEMORY[0x2611E3480](v18, -1, -1);
  }

  id v19 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for WFSetupServerAnisetteDataProvider()), sel_init);
  unint64_t v20 = (id *)&v1[OBJC_IVAR___WFSetupServerInternal_anisetteDataProvider];
  swift_beginAccess();
  id v21 = *v20;
  *unint64_t v20 = v19;
  uint64_t v22 = (char *)v19;

  uint64_t v23 = v1;
  id v24 = a1;
  uint64_t v25 = v23;
  id v26 = v24;
  uint64_t v27 = sub_25E7BC2C0();
  os_log_type_t v28 = sub_25E7BC4A0();
  unint64_t v29 = 0x26552F000uLL;
  if (os_log_type_enabled(v27, v28))
  {
    uint64_t v30 = swift_slowAlloc();
    uint64_t v31 = swift_slowAlloc();
    v55[0] = v31;
    *(_DWORD *)uint64_t v30 = 136315394;
    id v32 = *v20;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A706A40);
    uint64_t v33 = sub_25E7BC3F0();
    sub_25E77CF40(v33, v34, v55);
    sub_25E7BC520();

    swift_bridgeObjectRelease();
    *(_WORD *)(v30 + 12) = 2080;
    id v35 = objc_msgSend(v26, sel_messageSessionTemplate);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A706A48);
    uint64_t v36 = sub_25E7BC3F0();
    sub_25E77CF40(v36, v37, v55);
    sub_25E7BC520();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25E775000, v27, v28, "Setting the session template for anisetteDataProvider: %s to %s", (uint8_t *)v30, 0x16u);
    swift_arrayDestroy();
    uint64_t v38 = v31;
    unint64_t v29 = 0x26552F000;
    MEMORY[0x2611E3480](v38, -1, -1);
    MEMORY[0x2611E3480](v30, -1, -1);
  }
  else
  {
  }
  id v39 = [v26 *(SEL *)(v29 + 3624)];
  unint64_t v40 = (void **)&v22[OBJC_IVAR____TtC10TDGSharing33WFSetupServerAnisetteDataProvider_session];
  swift_beginAccess();
  unint64_t v41 = *v40;
  char *v40 = v39;

  id v42 = [v26 *(SEL *)(v29 + 3624)];
  if (v42)
  {
    uint64_t v43 = v42;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A706A30);
    uint64_t v44 = swift_allocObject();
    uint64_t v45 = MEMORY[0x263F8D310];
    *(_OWORD *)(v44 + 16) = xmmword_25E7BDF10;
    *(void *)(v44 + 56) = v45;
    *(void *)(v44 + 32) = 7631725;
    *(void *)(v44 + 40) = 0xE300000000000000;
    *(void *)(v44 + 88) = sub_25E78314C(0, &qword_26A706A38);
    *(void *)(v44 + 64) = v43;
    sub_25E78314C(0, (unint64_t *)&qword_26A706DF0);
    id v46 = v43;
    uint64_t v47 = (void *)sub_25E7BC480();
    uint64_t v48 = &v25[OBJC_IVAR___WFSetupServerInternal_setupProgressEventHandler];
    swift_beginAccess();
    id v50 = *(void (**)(void, void))v48;
    uint64_t v49 = *((void *)v48 + 1);
    sub_25E785E00((uint64_t)v50);
    sub_25E7ADD10(9uLL, v47, 1, v50, v49);
    sub_25E785F38((uint64_t)v50);
  }
  else
  {
    uint64_t v51 = sub_25E7BC2C0();
    os_log_type_t v52 = sub_25E7BC4A0();
    if (os_log_type_enabled(v51, v52))
    {
      uint64_t v53 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v53 = 0;
      _os_log_impl(&dword_25E775000, v51, v52, "No message session template on session secured", v53, 2u);
      MEMORY[0x2611E3480](v53, -1, -1);
    }
    else
    {
    }
  }
}

void sub_25E795698(uint64_t a1, void (*a2)(void, void, void), uint64_t a3)
{
  if (qword_26A7065D0 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_25E7BC2E0();
  __swift_project_value_buffer(v6, (uint64_t)qword_26A7089F8);
  swift_bridgeObjectRetain();
  sub_25E785E00((uint64_t)a2);
  swift_bridgeObjectRetain();
  sub_25E785E00((uint64_t)a2);
  os_log_type_t v7 = sub_25E7BC2C0();
  os_log_type_t v8 = sub_25E7BC4A0();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = swift_slowAlloc();
    uint64_t v10 = swift_slowAlloc();
    *(void *)&long long v47 = v10;
    *(_DWORD *)uint64_t v9 = 136446466;
    swift_bridgeObjectRetain();
    uint64_t v11 = sub_25E7BC3A0();
    unint64_t v13 = v12;
    swift_bridgeObjectRelease();
    v46[0] = sub_25E77CF40(v11, v13, (uint64_t *)&v47);
    sub_25E7BC520();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v9 + 12) = 2082;
    if (a2)
    {
      uint64_t v14 = swift_allocObject();
      *(void *)(v14 + 16) = a2;
      *(void *)(v14 + 24) = a3;
    }
    else
    {
      uint64_t v14 = 0;
    }
    v46[1] = v14;
    sub_25E785E00((uint64_t)a2);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A706A28);
    uint64_t v15 = sub_25E7BC3F0();
    v46[0] = sub_25E77CF40(v15, v16, (uint64_t *)&v47);
    sub_25E7BC520();
    swift_bridgeObjectRelease();
    sub_25E785F38((uint64_t)a2);
    sub_25E785F38((uint64_t)a2);
    _os_log_impl(&dword_25E775000, v7, v8, "WFSetupClient received request: %{public}s with handler: %{public}s", (uint8_t *)v9, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x2611E3480](v10, -1, -1);
    MEMORY[0x2611E3480](v9, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
    sub_25E785F38((uint64_t)a2);
    sub_25E785F38((uint64_t)a2);
  }
  uint64_t v17 = MEMORY[0x263F8D310];
  sub_25E7BC580();
  if (*(void *)(a1 + 16) && (unint64_t v18 = sub_25E7A8CC8((uint64_t)v46), (v19 & 1) != 0))
  {
    sub_25E77D9C8(*(void *)(a1 + 56) + 32 * v18, (uint64_t)&v47);
  }
  else
  {
    long long v47 = 0u;
    long long v48 = 0u;
  }
  sub_25E798CA4((uint64_t)v46);
  if (!*((void *)&v48 + 1))
  {
    sub_25E784970((uint64_t)&v47, &qword_26A706790);
LABEL_20:
    swift_bridgeObjectRetain_n();
    unint64_t v34 = sub_25E7BC2C0();
    os_log_type_t v35 = sub_25E7BC490();
    if (os_log_type_enabled(v34, v35))
    {
      uint64_t v44 = a2;
      uint64_t v36 = (uint8_t *)swift_slowAlloc();
      uint64_t v37 = swift_slowAlloc();
      v46[0] = v37;
      *(_DWORD *)uint64_t v36 = 136446210;
      swift_bridgeObjectRetain();
      uint64_t v38 = sub_25E7BC3A0();
      unint64_t v40 = v39;
      swift_bridgeObjectRelease();
      *(void *)&long long v47 = sub_25E77CF40(v38, v40, v46);
      sub_25E7BC520();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25E775000, v34, v35, "Failed to retrieve user interaction event raw value from request: %{public}s", v36, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2611E3480](v37, -1, -1);
      unint64_t v41 = v36;
      a2 = v44;
      MEMORY[0x2611E3480](v41, -1, -1);

      if (!v44) {
        return;
      }
    }
    else
    {

      swift_bridgeObjectRelease_n();
      if (!a2) {
        return;
      }
    }
    sub_25E796844();
    id v42 = (void *)swift_allocError();
    *uint64_t v43 = 2;
    a2(v42, 0, 0);

    return;
  }
  if ((swift_dynamicCast() & 1) == 0) {
    goto LABEL_20;
  }
  unint64_t v20 = sub_25E7BC2C0();
  os_log_type_t v21 = sub_25E7BC4A0();
  if (os_log_type_enabled(v20, v21))
  {
    uint64_t v22 = (uint8_t *)swift_slowAlloc();
    uint64_t v23 = swift_slowAlloc();
    v46[0] = v23;
    *(_DWORD *)uint64_t v22 = 136446210;
    id v24 = WFSetupClientUserInteractionProgressEventToString(0xD000000000000015);
    uint64_t v25 = sub_25E7BC3E0();
    unint64_t v27 = v26;

    *(void *)&long long v47 = sub_25E77CF40(v25, v27, v46);
    sub_25E7BC520();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25E775000, v20, v21, "Retrieved user client interaction event: (%{public}s)", v22, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2611E3480](v23, -1, -1);
    os_log_type_t v28 = v22;
    uint64_t v17 = MEMORY[0x263F8D310];
    MEMORY[0x2611E3480](v28, -1, -1);
  }

  uint64_t v29 = v45 + OBJC_IVAR___WFSetupServerInternal_userInteractionProgressEventHandler;
  swift_beginAccess();
  uint64_t v31 = *(void (**)(unint64_t))v29;
  uint64_t v30 = *(void *)(v29 + 8);
  sub_25E785E00((uint64_t)v31);
  sub_25E7B014C(0xD000000000000015, 1, v31, v30);
  sub_25E785F38((uint64_t)v31);
  if (a2)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A706D80);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_25E7BDF10;
    *(void *)&long long v47 = 0;
    *((void *)&v47 + 1) = 0xE000000000000000;
    sub_25E7BC580();
    *(void *)(inited + 96) = v17;
    *(void *)(inited + 72) = 0;
    *(void *)(inited + 80) = 0xE000000000000000;
    unint64_t v33 = sub_25E7885A8(inited);
    a2(0, 0, v33);
    swift_bridgeObjectRelease();
  }
}

uint64_t sub_25E795DE8(unsigned int a1, uint64_t a2)
{
  if (qword_26A7065D0 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_25E7BC2E0();
  __swift_project_value_buffer(v5, (uint64_t)qword_26A7089F8);
  uint64_t v6 = sub_25E7BC2C0();
  os_log_type_t v7 = sub_25E7BC4A0();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = swift_slowAlloc();
    uint64_t v9 = swift_slowAlloc();
    v16[0] = v9;
    *(_DWORD *)uint64_t v8 = 136446722;
    sub_25E77CF40(0xD00000000000002CLL, 0x800000025E7C0270, v16);
    sub_25E7BC520();
    *(_WORD *)(v8 + 12) = 2082;
    uint64_t v10 = sub_25E7BC6B0();
    sub_25E77CF40(v10, v11, v16);
    sub_25E7BC520();
    swift_bridgeObjectRelease();
    *(_WORD *)(v8 + 22) = 1024;
    sub_25E7BC520();
    _os_log_impl(&dword_25E775000, v6, v7, "%{public}s invoked with flags: %{public}s, throttle seconds: %d", (uint8_t *)v8, 0x1Cu);
    swift_arrayDestroy();
    MEMORY[0x2611E3480](v9, -1, -1);
    MEMORY[0x2611E3480](v8, -1, -1);
  }

  uint64_t v12 = v2 + OBJC_IVAR___WFSetupServerInternal_setupPromptPinHandler;
  swift_beginAccess();
  uint64_t v14 = *(void (**)(uint64_t, uint64_t))v12;
  uint64_t v13 = *(void *)(v12 + 8);
  sub_25E785E00((uint64_t)v14);
  sub_25E7AEF7C(a1, a2, 1, v14, v13);
  return sub_25E785F38((uint64_t)v14);
}

void sub_25E79603C(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A706998);
  uint64_t v6 = MEMORY[0x270FA5388](v4 - 8, v5);
  uint64_t v8 = (char *)v48 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6, v9);
  unint64_t v11 = (char *)v48 - v10;
  uint64_t v12 = sub_25E7BC280();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12, v14);
  unint64_t v16 = (char *)v48 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v17 = objc_msgSend(a1, sel_peerDevice);
  if (!v17)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56))(v11, 1, 1, v12);
    goto LABEL_7;
  }
  unint64_t v18 = v17;
  id v19 = objc_msgSend(v17, sel_identifier);

  if (v19)
  {
    sub_25E7BC270();

    (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(v8, 0, 1, v12);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56))(v8, 1, 1, v12);
  }
  sub_25E79721C((uint64_t)v8, (uint64_t)v11, &qword_26A706998);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12) == 1)
  {
LABEL_7:
    sub_25E784970((uint64_t)v11, &qword_26A706998);
    if (qword_26A7065D0 != -1) {
      swift_once();
    }
    uint64_t v20 = sub_25E7BC2E0();
    __swift_project_value_buffer(v20, (uint64_t)qword_26A7089F8);
    id v21 = a1;
    uint64_t v22 = sub_25E7BC2C0();
    os_log_type_t v23 = sub_25E7BC490();
    if (os_log_type_enabled(v22, v23))
    {
      id v24 = (uint8_t *)swift_slowAlloc();
      uint64_t v25 = (void *)swift_slowAlloc();
      *(_DWORD *)id v24 = 138412290;
      v53[0] = (uint64_t)v21;
      id v26 = v21;
      sub_25E7BC520();
      *uint64_t v25 = v21;

      _os_log_impl(&dword_25E775000, v22, v23, "Unable to determine peer identifier from %@ to dismiss session.", v24, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A7069B0);
      swift_arrayDestroy();
      MEMORY[0x2611E3480](v25, -1, -1);
      MEMORY[0x2611E3480](v24, -1, -1);
    }
    else
    {
    }
    return;
  }
  (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v16, v11, v12);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A706D80);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_25E7BDF10;
  v53[0] = 0xD000000000000022;
  v53[1] = 0x800000025E7C0240;
  sub_25E7BC580();
  *(void *)(inited + 96) = MEMORY[0x263F8D4F8];
  *(unsigned char *)(inited + 72) = 1;
  sub_25E7885A8(inited);
  if (qword_26A7065D0 != -1) {
    swift_once();
  }
  uint64_t v28 = sub_25E7BC2E0();
  __swift_project_value_buffer(v28, (uint64_t)qword_26A7089F8);
  swift_bridgeObjectRetain_n();
  uint64_t v29 = sub_25E7BC2C0();
  os_log_type_t v30 = sub_25E7BC4A0();
  BOOL v31 = os_log_type_enabled(v29, v30);
  uint64_t v32 = MEMORY[0x263F8EE58];
  if (v31)
  {
    uint64_t v33 = swift_slowAlloc();
    uint64_t v51 = a1;
    unint64_t v34 = (uint8_t *)v33;
    uint64_t v50 = swift_slowAlloc();
    v53[0] = v50;
    uint64_t v49 = v34;
    *(_DWORD *)unint64_t v34 = 136315138;
    v48[0] = v34 + 4;
    swift_bridgeObjectRetain();
    v48[1] = v32 + 8;
    os_log_type_t v35 = v16;
    uint64_t v36 = v2;
    uint64_t v37 = sub_25E7BC3A0();
    unint64_t v39 = v38;
    swift_bridgeObjectRelease();
    uint64_t v40 = v37;
    uint64_t v2 = v36;
    unint64_t v16 = v35;
    uint64_t v52 = sub_25E77CF40(v40, v39, v53);
    sub_25E7BC520();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    unint64_t v41 = v49;
    _os_log_impl(&dword_25E775000, v29, v30, "Sending dismiss response: %s", v49, 0xCu);
    uint64_t v42 = v50;
    swift_arrayDestroy();
    MEMORY[0x2611E3480](v42, -1, -1);
    a1 = v51;
    MEMORY[0x2611E3480](v41, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  uint64_t v43 = *(void **)(v2 + OBJC_IVAR___WFSetupServerInternal_sfService);
  if (v43)
  {
    id v44 = v43;
    uint64_t v45 = (void *)sub_25E7BC260();
    id v46 = objc_msgSend(a1, sel_sessionFlags);
    long long v47 = (void *)sub_25E7BC370();
    swift_bridgeObjectRelease();
    objc_msgSend(v44, sel_sendToPeer_flags_object_, v45, v46, v47);

    (*(void (**)(char *, uint64_t))(v13 + 8))(v16, v12);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v13 + 8))(v16, v12);
    swift_bridgeObjectRelease();
  }
}

uint64_t sub_25E7966E0(void (*a1)(void))
{
  a1();
  return _swift_stdlib_bridgeErrorToNSError();
}

uint64_t sub_25E796718(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_25E796740()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_25E796778()
{
  sub_25E787150(*(void *)(v0 + 16));
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

unint64_t sub_25E796798()
{
  unint64_t result = qword_26A706990;
  if (!qword_26A706990)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A706988);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A706990);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

void sub_25E79683C()
{
  sub_25E787740(*(void *)(v0 + 16));
}

unint64_t sub_25E796844()
{
  unint64_t result = qword_26A7069A0;
  if (!qword_26A7069A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A7069A0);
  }
  return result;
}

_OWORD *sub_25E796898(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

void sub_25E7968A8(uint64_t *a1, void **a2, uint64_t a3, uint64_t (*a4)(void))
{
  uint64_t v6 = (void *)a4();
  uint64_t v7 = *a1 + 8;
  sub_25E7BC520();
  *a1 = v7;
  uint64_t v8 = *a2;
  if (*a2)
  {
    *uint64_t v8 = v6;
    *a2 = v8 + 1;
  }
  else
  {
  }
}

_OWORD *sub_25E796960(_OWORD *a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = (void **)v4;
  uint64_t v10 = (void *)*v4;
  unint64_t v12 = sub_25E7A8D0C(a2, a3);
  uint64_t v13 = v10[2];
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_17;
  }
  char v16 = v11;
  uint64_t v17 = v10[3];
  if (v17 < v15 || (a4 & 1) == 0)
  {
    if (v17 >= v15 && (a4 & 1) == 0)
    {
      sub_25E7A9858();
      goto LABEL_7;
    }
    sub_25E7A8F30(v15, a4 & 1);
    unint64_t v21 = sub_25E7A8D0C(a2, a3);
    if ((v16 & 1) == (v22 & 1))
    {
      unint64_t v12 = v21;
      unint64_t v18 = *v5;
      if (v16) {
        goto LABEL_8;
      }
      goto LABEL_13;
    }
LABEL_17:
    unint64_t result = (_OWORD *)sub_25E7BC710();
    __break(1u);
    return result;
  }
LABEL_7:
  unint64_t v18 = *v5;
  if (v16)
  {
LABEL_8:
    id v19 = (_OWORD *)(v18[7] + 32 * v12);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v19);
    return sub_25E796898(a1, v19);
  }
LABEL_13:
  sub_25E796C10(v12, a2, a3, a1, v18);
  return (_OWORD *)swift_bridgeObjectRetain();
}

void sub_25E796ABC(void *a1, uint64_t a2, uint64_t a3)
{
  sub_25E78B870(a1, a2, a3, *(NSObject **)(v3 + 16));
}

_OWORD *sub_25E796AC4(_OWORD *a1, uint64_t a2, char a3)
{
  uint64_t v4 = (void **)v3;
  uint64_t v8 = (void *)*v3;
  unint64_t v10 = sub_25E7A8CC8(a2);
  uint64_t v11 = v8[2];
  BOOL v12 = (v9 & 1) == 0;
  uint64_t v13 = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
    goto LABEL_15;
  }
  char v14 = v9;
  uint64_t v15 = v8[3];
  if (v15 < v13 || (a3 & 1) == 0)
  {
    if (v15 >= v13 && (a3 & 1) == 0)
    {
      sub_25E7A9A40();
      goto LABEL_7;
    }
    sub_25E7A9230(v13, a3 & 1);
    unint64_t v19 = sub_25E7A8CC8(a2);
    if ((v14 & 1) == (v20 & 1))
    {
      unint64_t v10 = v19;
      char v16 = *v4;
      if (v14) {
        goto LABEL_8;
      }
LABEL_13:
      sub_25E797280(a2, (uint64_t)v21);
      return sub_25E796C7C(v10, (uint64_t)v21, a1, v16);
    }
LABEL_15:
    unint64_t result = (_OWORD *)sub_25E7BC710();
    __break(1u);
    return result;
  }
LABEL_7:
  char v16 = *v4;
  if ((v14 & 1) == 0) {
    goto LABEL_13;
  }
LABEL_8:
  uint64_t v17 = (_OWORD *)(v16[7] + 32 * v10);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v17);
  return sub_25E796898(a1, v17);
}

_OWORD *sub_25E796C10(unint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4, void *a5)
{
  a5[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v6 = (void *)(a5[6] + 16 * a1);
  *uint64_t v6 = a2;
  v6[1] = a3;
  unint64_t result = sub_25E796898(a4, (_OWORD *)(a5[7] + 32 * a1));
  uint64_t v8 = a5[2];
  BOOL v9 = __OFADD__(v8, 1);
  uint64_t v10 = v8 + 1;
  if (v9) {
    __break(1u);
  }
  else {
    a5[2] = v10;
  }
  return result;
}

_OWORD *sub_25E796C7C(unint64_t a1, uint64_t a2, _OWORD *a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v5 = a4[6] + 40 * a1;
  long long v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)uint64_t v5 = *(_OWORD *)a2;
  *(_OWORD *)(v5 + 16) = v6;
  *(void *)(v5 + 32) = *(void *)(a2 + 32);
  unint64_t result = sub_25E796898(a3, (_OWORD *)(a4[7] + 32 * a1));
  uint64_t v8 = a4[2];
  BOOL v9 = __OFADD__(v8, 1);
  uint64_t v10 = v8 + 1;
  if (v9) {
    __break(1u);
  }
  else {
    a4[2] = v10;
  }
  return result;
}

unint64_t sub_25E796CF8(unint64_t result)
{
  if (result > 7) {
    return 0;
  }
  return result;
}

uint64_t sub_25E796D08()
{
  unint64_t v0 = sub_25E7BC680();
  swift_bridgeObjectRelease();
  if (v0 >= 3) {
    return 3;
  }
  else {
    return v0;
  }
}

uint64_t sub_25E796D54()
{
  unint64_t v0 = sub_25E7BC680();
  swift_bridgeObjectRelease();
  if (v0 >= 5) {
    return 5;
  }
  else {
    return v0;
  }
}

id sub_25E796DA0@<X0>(void *a1@<X0>, void **a2@<X8>)
{
  uint64_t v3 = (void **)(*a1 + OBJC_IVAR___WFSetupServerInternal_anisetteDataProvider);
  swift_beginAccess();
  uint64_t v4 = *v3;
  *a2 = *v3;
  return v4;
}

uint64_t sub_25E796E08()
{
  return type metadata accessor for WFSetupServer();
}

void sub_25E796E10()
{
  sub_25E796EF4();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void sub_25E796EF4()
{
  if (!qword_26A7069D0)
  {
    sub_25E7BC280();
    unint64_t v0 = sub_25E7BC510();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26A7069D0);
    }
  }
}

_DWORD *__swift_memcpy4_1(_DWORD *result, _DWORD *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for WFSetupServer.WFSetupServerState(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && a1[4]) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *a1;
  BOOL v4 = v3 >= 2;
  int v5 = (v3 + 2147483646) & 0x7FFFFFFF;
  if (!v4) {
    int v5 = -1;
  }
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for WFSetupServer.WFSetupServerState(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_DWORD *)unint64_t result = a2 - 255;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 4) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 4) = 0;
    }
    if (a2) {
      *(unsigned char *)unint64_t result = a2 + 1;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for WFSetupServer.WFSetupServerState()
{
  return &type metadata for WFSetupServer.WFSetupServerState;
}

ValueMetadata *type metadata accessor for WFSetupServer.WFSetupServerError()
{
  return &type metadata for WFSetupServer.WFSetupServerError;
}

unint64_t sub_25E797014()
{
  unint64_t result = qword_26A7069D8;
  if (!qword_26A7069D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A7069D8);
  }
  return result;
}

unint64_t sub_25E79706C()
{
  unint64_t result = qword_26A7069E0;
  if (!qword_26A7069E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A7069E0);
  }
  return result;
}

unint64_t sub_25E7970C4()
{
  unint64_t result = qword_26A7069E8;
  if (!qword_26A7069E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A7069E8);
  }
  return result;
}

unint64_t sub_25E79711C()
{
  unint64_t result = qword_26A7069F0;
  if (!qword_26A7069F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A7069F0);
  }
  return result;
}

unint64_t sub_25E797174()
{
  unint64_t result = qword_26A7069F8;
  if (!qword_26A7069F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A7069F8);
  }
  return result;
}

unint64_t sub_25E7971C8()
{
  unint64_t result = qword_26A706A00;
  if (!qword_26A706A00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A706A00);
  }
  return result;
}

uint64_t sub_25E79721C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_25E797280(uint64_t a1, uint64_t a2)
{
  return a2;
}

void sub_25E7972DC(int a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A706998);
  uint64_t v10 = MEMORY[0x270FA5388](v8 - 8, v9);
  uint64_t v104 = &v95[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v10, v12);
  char v14 = &v95[-v13];
  uint64_t v15 = sub_25E7BC280();
  uint64_t v16 = *(void *)(v15 - 8);
  MEMORY[0x270FA5388](v15, v17);
  unint64_t v19 = &v95[-((v18 + 15) & 0xFFFFFFFFFFFFFFF0)];
  if (qword_26A7065D0 != -1) {
    swift_once();
  }
  uint64_t v20 = sub_25E7BC2E0();
  uint64_t v21 = __swift_project_value_buffer(v20, (uint64_t)qword_26A7089F8);
  swift_bridgeObjectRetain_n();
  uint64_t v103 = v21;
  char v22 = sub_25E7BC2C0();
  os_log_type_t v23 = sub_25E7BC4A0();
  int v24 = v23;
  BOOL v25 = os_log_type_enabled(v22, v23);
  int v99 = a1;
  id v102 = v14;
  if (v25)
  {
    uint64_t v26 = swift_slowAlloc();
    uint64_t v97 = swift_slowAlloc();
    uint64_t v106 = v97;
    *(_DWORD *)uint64_t v26 = 136446722;
    uint64_t v98 = a3;
    uint64_t v105 = sub_25E77CF40(0xD000000000000033, 0x800000025E7BFD70, &v106);
    uint64_t v100 = v16;
    uint64_t v101 = v15;
    sub_25E7BC520();
    *(_WORD *)(v26 + 12) = 1024;
    LODWORD(v105) = a1 & 1;
    sub_25E7BC520();
    *(_WORD *)(v26 + 18) = 2080;
    swift_bridgeObjectRetain();
    uint64_t v27 = sub_25E7BC3A0();
    int v96 = v24;
    uint64_t v28 = v19;
    uint64_t v29 = a4;
    unint64_t v31 = v30;
    swift_bridgeObjectRelease();
    uint64_t v105 = sub_25E77CF40(v27, v31, &v106);
    uint64_t v15 = v101;
    a3 = v98;
    sub_25E7BC520();
    swift_bridgeObjectRelease_n();
    a4 = v29;
    unint64_t v19 = v28;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25E775000, v22, (os_log_type_t)v96, "%{public}s invoked with reset flag: %{BOOL}d and context: %s", (uint8_t *)v26, 0x1Cu);
    uint64_t v32 = v97;
    uint64_t v16 = v100;
    swift_arrayDestroy();
    MEMORY[0x2611E3480](v32, -1, -1);
    MEMORY[0x2611E3480](v26, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  uint64_t v33 = *(void **)(a3 + OBJC_IVAR___WFSetupServerInternal_sfSession);
  uint64_t v34 = (uint64_t)v104;
  if (v33)
  {
    id v35 = v33;
    id v36 = objc_msgSend(v35, sel_peerDevice);
    if (!v36)
    {
      uint64_t v49 = (uint64_t)v102;
      (*(void (**)(id, uint64_t, uint64_t, uint64_t))(v16 + 56))(v102, 1, 1, v15);
LABEL_16:
      sub_25E784970(v49, &qword_26A706998);
      uint64_t v50 = sub_25E7BC2C0();
      os_log_type_t v51 = sub_25E7BC490();
      if (os_log_type_enabled(v50, v51))
      {
        uint64_t v52 = (uint8_t *)swift_slowAlloc();
        uint64_t v53 = (void *)swift_slowAlloc();
        *(_DWORD *)uint64_t v52 = 138412290;
        sub_25E796844();
        swift_allocError();
        *uint64_t v54 = 4;
        uint64_t v55 = _swift_stdlib_bridgeErrorToNSError();
        uint64_t v106 = v55;
        sub_25E7BC520();
        *uint64_t v53 = v55;
        _os_log_impl(&dword_25E775000, v50, v51, "Failed to start pair setup session due to error: %@", v52, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A7069B0);
        swift_arrayDestroy();
        MEMORY[0x2611E3480](v53, -1, -1);
        MEMORY[0x2611E3480](v52, -1, -1);
      }

      sub_25E796844();
      id v56 = (void *)swift_allocError();
      void *v57 = 4;
      os_log_t v58 = (void *)sub_25E7BC1D0();
      (*(void (**)(uint64_t, void *, void))(a4 + 16))(a4, v58, 0);

      return;
    }
    uint64_t v37 = v36;
    id v38 = objc_msgSend(v36, sel_identifier);

    if (v38)
    {
      sub_25E7BC270();

      uint64_t v39 = 0;
    }
    else
    {
      uint64_t v39 = 1;
    }
    uint64_t v49 = (uint64_t)v102;
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v16 + 56))(v34, v39, 1, v15);
    sub_25E79721C(v34, v49, &qword_26A706998);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v16 + 48))(v49, 1, v15) == 1) {
      goto LABEL_16;
    }
    id v59 = a2;
    (*(void (**)(unsigned char *, uint64_t, uint64_t))(v16 + 32))(v19, v49, v15);
    char v60 = *(void **)(a3 + OBJC_IVAR___WFSetupServerInternal_sfService);
    if (v60)
    {
      uint64_t v61 = a3 + OBJC_IVAR___WFSetupServerInternal_serverState;
      uint64_t v62 = *(unsigned __int8 *)(a3 + OBJC_IVAR___WFSetupServerInternal_serverState + 3);
      uint64_t v104 = (unsigned char *)a4;
      switch(v62)
      {
        case 2:
          id v75 = v60;
          swift_bridgeObjectRelease();
          goto LABEL_26;
        default:
          char v76 = sub_25E7BC6D0();
          id v102 = v60;
          swift_bridgeObjectRelease();
          if (v76)
          {
LABEL_26:
            id v77 = sub_25E7BC2C0();
            os_log_type_t v78 = sub_25E7BC490();
            if (os_log_type_enabled(v77, v78))
            {
              uint64_t v100 = v16;
              id v79 = (uint8_t *)swift_slowAlloc();
              uint64_t v80 = swift_slowAlloc();
              uint64_t v101 = v15;
              unint64_t v81 = (void *)v80;
              *(_DWORD *)id v79 = 138412290;
              sub_25E796844();
              swift_allocError();
              void *v82 = 5;
              os_log_t v83 = v19;
              uint64_t v84 = _swift_stdlib_bridgeErrorToNSError();
              uint64_t v106 = v84;
              uint64_t v16 = v100;
              sub_25E7BC520();
              void *v81 = v84;
              unint64_t v19 = v83;
              _os_log_impl(&dword_25E775000, v77, v78, "Attempting to start secure session pairing process while a secure session has already been established: %@", v79, 0xCu);
              __swift_instantiateConcreteTypeFromMangledName(&qword_26A7069B0);
              swift_arrayDestroy();
              uint64_t v85 = v81;
              uint64_t v15 = v101;
              MEMORY[0x2611E3480](v85, -1, -1);
              MEMORY[0x2611E3480](v79, -1, -1);
            }

            sub_25E796844();
            uint64_t v72 = (void *)swift_allocError();
            *uint64_t v86 = 5;
            unint64_t v74 = (void *)sub_25E7BC1D0();
            (*((void (**)(unsigned char *, void *, void))v104 + 2))(v104, v74, 0);

            goto LABEL_29;
          }
          if (v99)
          {
            uint64_t v101 = v61;
            uint64_t v87 = sub_25E7BC2C0();
            os_log_type_t v88 = sub_25E7BC4A0();
            uint64_t v89 = v59;
            if (os_log_type_enabled(v87, v88))
            {
              uint64_t v90 = (uint8_t *)swift_slowAlloc();
              *(_WORD *)uint64_t v90 = 0;
              _os_log_impl(&dword_25E775000, v87, v88, "Received reset pairing flag. ", v90, 2u);
              MEMORY[0x2611E3480](v90, -1, -1);
            }

            uint64_t v91 = v101;
            *(unsigned char *)(v101 + 3) = 4;
            sub_25E78CDEC(8uLL, v59, (void (*)(void, void, void))sub_25E78A3A0, 0);
            uint64_t v61 = v91;
            uint64_t v92 = 524312;
          }
          else
          {
            uint64_t v92 = 24;
            uint64_t v89 = v59;
          }
          int v93 = v102;
          *(unsigned char *)(v61 + 3) = 1;
          sub_25E78CDEC(5uLL, v89, (void (*)(void, void, void))sub_25E78A3B0, 0);
          os_log_t v94 = (void *)sub_25E7BC260();
          objc_msgSend(v93, sel_pairSetupWithFlags_peer_, v92, v94);

          (*((void (**)(unsigned char *, void, uint64_t))v104 + 2))(v104, 0, 1);
          break;
      }
    }
    else
    {
      uint64_t v63 = sub_25E7BC2C0();
      os_log_type_t v64 = sub_25E7BC490();
      if (os_log_type_enabled(v63, v64))
      {
        uint64_t v100 = v16;
        id v65 = (uint8_t *)swift_slowAlloc();
        uint64_t v66 = swift_slowAlloc();
        uint64_t v101 = v15;
        unint64_t v67 = (void *)v66;
        *(_DWORD *)id v65 = 138412290;
        sub_25E796844();
        swift_allocError();
        *os_log_t v68 = 1;
        unint64_t v69 = v19;
        uint64_t v70 = _swift_stdlib_bridgeErrorToNSError();
        uint64_t v106 = v70;
        uint64_t v16 = v100;
        sub_25E7BC520();
        void *v67 = v70;
        unint64_t v19 = v69;
        _os_log_impl(&dword_25E775000, v63, v64, "Failed to start pair setup session due to error: %@", v65, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A7069B0);
        swift_arrayDestroy();
        uint64_t v71 = v67;
        uint64_t v15 = v101;
        MEMORY[0x2611E3480](v71, -1, -1);
        MEMORY[0x2611E3480](v65, -1, -1);
      }

      sub_25E796844();
      uint64_t v72 = (void *)swift_allocError();
      *os_log_t v73 = 1;
      unint64_t v74 = (void *)sub_25E7BC1D0();
      (*(void (**)(uint64_t, void *, void))(a4 + 16))(a4, v74, 0);

LABEL_29:
    }
    (*(void (**)(unsigned char *, uint64_t))(v16 + 8))(v19, v15);
  }
  else
  {
    uint64_t v40 = sub_25E7BC2C0();
    os_log_type_t v41 = sub_25E7BC490();
    if (os_log_type_enabled(v40, v41))
    {
      uint64_t v42 = (uint8_t *)swift_slowAlloc();
      uint64_t v43 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v42 = 138412290;
      sub_25E796844();
      swift_allocError();
      *id v44 = 0;
      uint64_t v45 = _swift_stdlib_bridgeErrorToNSError();
      uint64_t v106 = v45;
      sub_25E7BC520();
      *uint64_t v43 = v45;
      _os_log_impl(&dword_25E775000, v40, v41, "Failed to start pair setup session due to no available SFSession: %@", v42, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A7069B0);
      swift_arrayDestroy();
      MEMORY[0x2611E3480](v43, -1, -1);
      MEMORY[0x2611E3480](v42, -1, -1);
    }

    sub_25E796844();
    id v46 = (void *)swift_allocError();
    *long long v47 = 0;
    long long v48 = (void *)sub_25E7BC1D0();
    (*(void (**)(uint64_t, void *, void))(a4 + 16))(a4, v48, 0);
  }
}

void sub_25E797FA4(int a1, uint64_t a2, void (**a3)(void, void, void))
{
  int v93 = a1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A706998);
  uint64_t v7 = MEMORY[0x270FA5388](v5 - 8, v6);
  int v96 = (void (**)(char *, uint64_t))((char *)&v91 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v7, v9);
  uint64_t v11 = (char *)&v91 - v10;
  uint64_t v12 = sub_25E7BC280();
  uint64_t v13 = *(void (***)(uint64_t, uint64_t, uint64_t, uint64_t))(v12 - 8);
  MEMORY[0x270FA5388](v12, v14);
  uint64_t v16 = (char *)&v91 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = a3;
  _Block_copy(a3);
  if (qword_26A7065D0 != -1) {
    swift_once();
  }
  uint64_t v18 = sub_25E7BC2E0();
  uint64_t v95 = __swift_project_value_buffer(v18, (uint64_t)qword_26A7089F8);
  unint64_t v19 = sub_25E7BC2C0();
  os_log_type_t v20 = sub_25E7BC4A0();
  BOOL v21 = os_log_type_enabled(v19, v20);
  os_log_t v94 = v11;
  if (v21)
  {
    uint64_t v22 = swift_slowAlloc();
    uint64_t v23 = swift_slowAlloc();
    uint64_t v92 = v12;
    uint64_t v24 = v23;
    uint64_t v98 = v23;
    *(_DWORD *)uint64_t v22 = 136446466;
    uint64_t v97 = sub_25E77CF40(0xD00000000000002BLL, 0x800000025E7BFDB0, &v98);
    sub_25E7BC520();
    *(_WORD *)(v22 + 12) = 1024;
    LODWORD(v97) = v93 & 1;
    sub_25E7BC520();
    _os_log_impl(&dword_25E775000, v19, v20, "%{public}s invoked with reset flag: %{BOOL}d", (uint8_t *)v22, 0x12u);
    swift_arrayDestroy();
    uint64_t v25 = v24;
    uint64_t v12 = v92;
    MEMORY[0x2611E3480](v25, -1, -1);
    MEMORY[0x2611E3480](v22, -1, -1);
  }

  uint64_t v26 = *(void **)(a2 + OBJC_IVAR___WFSetupServerInternal_sfSession);
  uint64_t v27 = (uint64_t)v96;
  if (!v26)
  {
    uint64_t v33 = sub_25E7BC2C0();
    os_log_type_t v34 = sub_25E7BC490();
    if (os_log_type_enabled(v33, v34))
    {
      id v35 = (uint8_t *)swift_slowAlloc();
      id v36 = (void *)swift_slowAlloc();
      *(_DWORD *)id v35 = 138412290;
      sub_25E796844();
      swift_allocError();
      *uint64_t v37 = 0;
      uint64_t v38 = _swift_stdlib_bridgeErrorToNSError();
      uint64_t v98 = v38;
      sub_25E7BC520();
      *id v36 = v38;
      _os_log_impl(&dword_25E775000, v33, v34, "Failed to start pair setup session due to no available SFSession: %@", v35, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A7069B0);
      swift_arrayDestroy();
      MEMORY[0x2611E3480](v36, -1, -1);
      MEMORY[0x2611E3480](v35, -1, -1);
    }

    sub_25E796844();
    uint64_t v39 = (void *)swift_allocError();
    void *v40 = 0;
    os_log_type_t v41 = (void *)sub_25E7BC1D0();
    ((void (**)(void, void *, void))a3)[2](a3, v41, 0);

    goto LABEL_34;
  }
  id v28 = v26;
  id v29 = objc_msgSend(v28, sel_peerDevice);
  if (v29)
  {
    unint64_t v30 = v29;
    id v31 = objc_msgSend(v29, sel_identifier);

    if (v31)
    {
      sub_25E7BC270();

      uint64_t v32 = 0;
    }
    else
    {
      uint64_t v32 = 1;
    }
    uint64_t v42 = (uint64_t)v94;
    v13[7](v27, v32, 1, v12);
    sub_25E79721C(v27, v42, &qword_26A706998);
    if (((unsigned int (*)(uint64_t, uint64_t, uint64_t))v13[6])(v42, 1, v12) == 1) {
      goto LABEL_15;
    }
    ((void (*)(char *, uint64_t, uint64_t))v13[4])(v16, v42, v12);
    uint64_t v52 = a2;
    uint64_t v53 = *(void **)(a2 + OBJC_IVAR___WFSetupServerInternal_sfService);
    if (v53)
    {
      uint64_t v92 = v52;
      uint64_t v54 = v52 + OBJC_IVAR___WFSetupServerInternal_serverState;
      uint64_t v55 = *(unsigned __int8 *)(v52 + OBJC_IVAR___WFSetupServerInternal_serverState + 3);
      os_log_t v94 = v16;
      int v96 = (void (**)(char *, uint64_t))v13;
      switch(v55)
      {
        case 2:
          id v68 = v53;
          swift_bridgeObjectRelease();
          goto LABEL_25;
        default:
          char v69 = sub_25E7BC6D0();
          id v70 = v53;
          swift_bridgeObjectRelease();
          if (v69)
          {
LABEL_25:
            uint64_t v71 = sub_25E7BC2C0();
            os_log_type_t v72 = sub_25E7BC490();
            if (os_log_type_enabled(v71, v72))
            {
              uint64_t v92 = v12;
              uint64_t v73 = swift_slowAlloc();
              uint64_t v95 = (uint64_t)a3;
              unint64_t v74 = (uint8_t *)v73;
              id v75 = (void *)swift_slowAlloc();
              *(_DWORD *)unint64_t v74 = 138412290;
              sub_25E796844();
              swift_allocError();
              void *v76 = 5;
              uint64_t v77 = _swift_stdlib_bridgeErrorToNSError();
              uint64_t v98 = v77;
              uint64_t v12 = v92;
              sub_25E7BC520();
              *id v75 = v77;
              _os_log_impl(&dword_25E775000, v71, v72, "Attempting to start secure session pairing process while a secure session has already been established: %@", v74, 0xCu);
              __swift_instantiateConcreteTypeFromMangledName(&qword_26A7069B0);
              swift_arrayDestroy();
              MEMORY[0x2611E3480](v75, -1, -1);
              os_log_type_t v78 = v74;
              a3 = (void (**)(void, void, void))v95;
              MEMORY[0x2611E3480](v78, -1, -1);
            }

            sub_25E796844();
            id v79 = (void *)swift_allocError();
            *uint64_t v80 = 5;
            unint64_t v81 = (void *)sub_25E7BC1D0();
            ((void (**)(void, void *, void))a3)[2](a3, v81, 0);

            v96[1](v94, v12);
          }
          else
          {
            if (v93)
            {
              v82 = sub_25E7BC2C0();
              os_log_type_t v83 = sub_25E7BC4A0();
              if (os_log_type_enabled(v82, v83))
              {
                uint64_t v84 = (uint8_t *)swift_slowAlloc();
                *(_WORD *)uint64_t v84 = 0;
                _os_log_impl(&dword_25E775000, v82, v83, "Received reset pairing flag. ", v84, 2u);
                MEMORY[0x2611E3480](v84, -1, -1);
              }

              *(unsigned char *)(v54 + 3) = 4;
              uint64_t v85 = (void *)sub_25E7886EC(MEMORY[0x263F8EE78]);
              sub_25E78CDEC(8uLL, v85, (void (*)(void, void, void))sub_25E78B520, 0);
              swift_bridgeObjectRelease();
              uint64_t v86 = 524312;
            }
            else
            {
              uint64_t v86 = 24;
            }
            *(unsigned char *)(v54 + 3) = 1;
            uint64_t v87 = (void *)sub_25E7886EC(MEMORY[0x263F8EE78]);
            uint64_t v88 = swift_allocObject();
            *(void *)(v88 + 16) = sub_25E7997C4;
            *(void *)(v88 + 24) = v17;
            swift_retain();
            sub_25E78CDEC(5uLL, v87, (void (*)(void, void, void))sub_25E799DD4, v88);
            swift_bridgeObjectRelease();
            swift_release();
            uint64_t v89 = v94;
            uint64_t v90 = (void *)sub_25E7BC260();
            objc_msgSend(v70, sel_pairSetupWithFlags_peer_, v86, v90);

            a3[2](a3, 0, 1);
            v96[1](v89, v12);
          }
          break;
      }
    }
    else
    {
      id v56 = sub_25E7BC2C0();
      os_log_type_t v57 = sub_25E7BC490();
      if (os_log_type_enabled(v56, v57))
      {
        uint64_t v92 = v12;
        os_log_t v58 = (uint8_t *)swift_slowAlloc();
        uint64_t v59 = swift_slowAlloc();
        uint64_t v95 = (uint64_t)a3;
        char v60 = (void *)v59;
        int v96 = (void (**)(char *, uint64_t))v13;
        *(_DWORD *)os_log_t v58 = 138412290;
        sub_25E796844();
        swift_allocError();
        *uint64_t v61 = 1;
        uint64_t v62 = v16;
        uint64_t v63 = _swift_stdlib_bridgeErrorToNSError();
        uint64_t v98 = v63;
        uint64_t v12 = v92;
        uint64_t v13 = (void (**)(uint64_t, uint64_t, uint64_t, uint64_t))v96;
        sub_25E7BC520();
        void *v60 = v63;
        uint64_t v16 = v62;
        _os_log_impl(&dword_25E775000, v56, v57, "Failed to start pair setup session due to error: %@", v58, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A7069B0);
        swift_arrayDestroy();
        os_log_type_t v64 = v60;
        a3 = (void (**)(void, void, void))v95;
        MEMORY[0x2611E3480](v64, -1, -1);
        MEMORY[0x2611E3480](v58, -1, -1);
      }

      sub_25E796844();
      id v65 = (void *)swift_allocError();
      *uint64_t v66 = 1;
      unint64_t v67 = (void *)sub_25E7BC1D0();
      ((void (**)(void, void *, void))a3)[2](a3, v67, 0);

      ((void (*)(char *, uint64_t))v13[1])(v16, v12);
    }
LABEL_34:
    swift_release();
    return;
  }
  uint64_t v42 = (uint64_t)v94;
  v13[7]((uint64_t)v94, 1, 1, v12);
LABEL_15:
  sub_25E784970(v42, &qword_26A706998);
  uint64_t v43 = sub_25E7BC2C0();
  os_log_type_t v44 = sub_25E7BC490();
  if (os_log_type_enabled(v43, v44))
  {
    uint64_t v45 = (uint8_t *)swift_slowAlloc();
    id v46 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v45 = 138412290;
    sub_25E796844();
    swift_allocError();
    *long long v47 = 4;
    uint64_t v48 = _swift_stdlib_bridgeErrorToNSError();
    uint64_t v98 = v48;
    sub_25E7BC520();
    *id v46 = v48;
    _os_log_impl(&dword_25E775000, v43, v44, "Failed to start pair setup session due to error: %@", v45, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A7069B0);
    swift_arrayDestroy();
    MEMORY[0x2611E3480](v46, -1, -1);
    MEMORY[0x2611E3480](v45, -1, -1);
  }

  sub_25E796844();
  uint64_t v49 = (void *)swift_allocError();
  *uint64_t v50 = 4;
  os_log_type_t v51 = (void *)sub_25E7BC1D0();
  ((void (**)(void, void *, void))a3)[2](a3, v51, 0);

  swift_release();
}

uint64_t sub_25E798CA4(uint64_t a1)
{
  return a1;
}

void sub_25E798CF8(uint64_t a1, unint64_t a2, const char *a3)
{
  if (qword_26A7065D0 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_25E7BC2E0();
  __swift_project_value_buffer(v6, (uint64_t)qword_26A7089F8);
  oslog = sub_25E7BC2C0();
  os_log_type_t v7 = sub_25E7BC4A0();
  if (os_log_type_enabled(oslog, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    uint64_t v9 = swift_slowAlloc();
    uint64_t v11 = v9;
    *(_DWORD *)uint64_t v8 = 136446210;
    sub_25E77CF40(a1, a2, &v11);
    sub_25E7BC520();
    _os_log_impl(&dword_25E775000, oslog, v7, a3, v8, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2611E3480](v9, -1, -1);
    MEMORY[0x2611E3480](v8, -1, -1);
  }
  else
  {
  }
}

void sub_25E798EA0(uint64_t a1, void (*a2)(void, void, unint64_t))
{
  if (qword_26A7065D0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_25E7BC2E0();
  __swift_project_value_buffer(v2, (uint64_t)qword_26A7089F8);
  swift_bridgeObjectRetain_n();
  unsigned int v3 = sub_25E7BC2C0();
  os_log_type_t v4 = sub_25E7BC4A0();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v6 = swift_slowAlloc();
    v32[0] = v6;
    *(_DWORD *)uint64_t v5 = 136446210;
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_25E7BC3A0();
    unint64_t v9 = v8;
    swift_bridgeObjectRelease();
    *(void *)&long long v30 = sub_25E77CF40(v7, v9, v32);
    sub_25E7BC520();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25E775000, v3, v4, "Handle setup action request: %{public}s", v5, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2611E3480](v6, -1, -1);
    MEMORY[0x2611E3480](v5, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  unint64_t v10 = sub_25E7885A8(MEMORY[0x263F8EE78]);
  uint64_t v11 = (void *)sub_25E7BC370();
  uint64_t v12 = (void *)sub_25E7BC3D0();
  id v13 = (id)NSDictionaryGetNSNumber();

  if (v13)
  {
    unsigned int v14 = sub_25E7BC7B0();

    uint64_t v15 = sub_25E7BC2C0();
    os_log_type_t v16 = sub_25E7BC4A0();
    if (os_log_type_enabled(v15, v16))
    {
      uint64_t v17 = (uint8_t *)swift_slowAlloc();
      uint64_t v18 = swift_slowAlloc();
      v32[0] = v18;
      *(_DWORD *)uint64_t v17 = 136446210;
      SFSetupActionToString(v14);
      uint64_t v19 = sub_25E7BC420();
      *(void *)&long long v30 = sub_25E77CF40(v19, v20, v32);
      sub_25E7BC520();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25E775000, v15, v16, "SendActionRequest %{public}s", v17, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2611E3480](v18, -1, -1);
      MEMORY[0x2611E3480](v17, -1, -1);
    }

    if (v14 == 7)
    {
      sub_25E798CF8(0xD000000000000019, 0x800000025E7C03B0, "FIXME: %{public}s");
    }
    else if (v14 == 6)
    {
      sub_25E798CF8(0xD00000000000001ALL, 0x800000025E7C0390, "FIXME: %{public}s");
    }
    else
    {
      BOOL v21 = sub_25E7BC2C0();
      os_log_type_t v22 = sub_25E7BC4A0();
      if (os_log_type_enabled(v21, v22))
      {
        uint64_t v23 = (uint8_t *)swift_slowAlloc();
        uint64_t v24 = swift_slowAlloc();
        v32[0] = v24;
        *(_DWORD *)uint64_t v23 = 136446210;
        SFSetupActionToString(v14);
        uint64_t v25 = sub_25E7BC420();
        *(void *)&long long v30 = sub_25E77CF40(v25, v26, v32);
        sub_25E7BC520();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_25E775000, v21, v22, "Unsupported sendAction: %{public}s", v23, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x2611E3480](v24, -1, -1);
        MEMORY[0x2611E3480](v23, -1, -1);
      }

      *((void *)&v30 + 1) = 0xE200000000000000;
      sub_25E7BC580();
      uint64_t v31 = MEMORY[0x263F8E548];
      *(void *)&long long v30 = 4294960589;
      sub_25E796898(&v30, v29);
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      sub_25E796AC4(v29, (uint64_t)v32, isUniquelyReferenced_nonNull_native);
      swift_bridgeObjectRelease();
      sub_25E798CA4((uint64_t)v32);
    }
    a2(0, 0, v10);
    swift_bridgeObjectRelease();
  }
  else
  {
    __break(1u);
  }
}

__CFString *WFSetupClientUserInteractionProgressEventToString(unint64_t a1)
{
  if (a1 <= 5)
  {
    uint64_t v1 = off_26552F760[a1];
    uint64_t v2 = off_26552F730[a1];
  }
  return v1;
}

__CFString *WFSetupProgressEventToString(unint64_t a1)
{
  if (a1 <= 0xF)
  {
    uint64_t v1 = off_26552F810[a1];
    uint64_t v2 = off_26552F790[a1];
  }
  return v1;
}

uint64_t sub_25E7994BC()
{
  swift_unknownObjectWeakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_25E7994F4(uint64_t a1, uint64_t a2, void (*a3)(void, void, unint64_t), uint64_t a4)
{
  sub_25E79377C(a1, a2, a3, a4, v4);
}

void sub_25E7994FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_25E7937F0(a1, a2, a3, a4, v4, (void (*)(uint64_t, uint64_t, uint64_t))sub_25E795698);
}

void sub_25E79952C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_25E7937F0(a1, a2, a3, a4, v4, (void (*)(uint64_t, uint64_t, uint64_t))sub_25E793DA8);
}

uint64_t sub_25E79955C()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

void sub_25E79959C(void *a1)
{
  sub_25E793878(a1, *(void *)(v1 + 16), *(void **)(v1 + 24));
}

unint64_t sub_25E7995A4()
{
  unint64_t result = qword_26A706A60;
  if (!qword_26A706A60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A706A60);
  }
  return result;
}

uint64_t sub_25E7995F8()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 56, 7);
}

const char *SFSetupActionToString(unsigned int a1)
{
  if (a1 > 0xA) {
    return "?";
  }
  else {
    return off_26552F6D8[a1];
  }
}

uint64_t sub_25E799664(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

void sub_25E7996AC()
{
  sub_25E78EDF4(v0);
}

void sub_25E7996B4(unsigned int a1, uint64_t a2)
{
  sub_25E78F210(a1, a2, v2);
}

void sub_25E7996BC(void *a1, unsigned int a2, uint64_t a3)
{
  sub_25E78F280(a1, a2, a3, v3);
}

void sub_25E7996C4(void *a1)
{
  sub_25E78F3AC(a1, v1);
}

void sub_25E7996CC(void *a1, void *a2)
{
  sub_25E7900E0(a1, a2, v2);
}

void sub_25E7996D4(void *a1)
{
  sub_25E790A80(a1, *(void *)(v1 + 16));
}

uint64_t sub_25E7996DC()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

void sub_25E799714(void *a1)
{
  sub_25E790F14(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_25E79971C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A706998);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

void sub_25E799784()
{
  sub_25E78E42C(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_25E79978C()
{
  _Block_release(*(const void **)(v0 + 16));
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_25E7997C4(uint64_t a1, uint64_t a2)
{
  sub_25E78A84C(a1, a2, *(void *)(v2 + 16));
}

uint64_t sub_25E7997CC()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

void sub_25E799804(uint64_t a1, void *a2, uint64_t a3)
{
  sub_25E79B9E4(a1, a2, a3, *(void *)(v3 + 16));
}

void sub_25E79980C(uint64_t a1)
{
  sub_25E79B970(a1, *(void *)(v1 + 16));
}

uint64_t sub_25E799814()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

uint64_t sub_25E79982C()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

void sub_25E799840(uint64_t a1, uint64_t a2)
{
  sub_25E79B868(a1, a2, *(void *)(v2 + 16));
}

void sub_25E799848(uint64_t a1)
{
  sub_25E79B778(a1, *(void *)(v1 + 16));
}

uint64_t sub_25E799850(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(uint64_t (**)(uint64_t *, uint64_t *, uint64_t *))(v3 + 16);
  uint64_t v7 = a2;
  uint64_t v8 = a1;
  uint64_t v6 = a3;
  return v4(&v8, &v7, &v6);
}

uint64_t sub_25E799894(void *a1, void *a2, void *a3)
{
  return (*(uint64_t (**)(void, void, void))(v3 + 16))(*a1, *a2, *a3);
}

uint64_t sub_25E7998C8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_25E79992C()
{
  return swift_release();
}

uint64_t getEnumTagSinglePayload for WFSetupServer.WFSetupServerState.SecureSessionPairingState(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFC) {
    goto LABEL_17;
  }
  if (a2 + 4 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 4) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 4;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 4;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 4;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 5;
  int v8 = v6 - 5;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for WFSetupServer.WFSetupServerState.SecureSessionPairingState(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 4 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 4) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFC) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFB)
  {
    unsigned int v6 = ((a2 - 252) >> 8) + 1;
    *uint64_t result = a2 + 4;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x25E799A90);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *uint64_t result = a2 + 4;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for WFSetupServer.WFSetupServerState.SecureSessionPairingState()
{
  return &type metadata for WFSetupServer.WFSetupServerState.SecureSessionPairingState;
}

uint64_t getEnumTagSinglePayload for WFSetupServer.WFSetupServerState.InvalidationState(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFE) {
    goto LABEL_17;
  }
  if (a2 + 2 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 2) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 2;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 2;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 2;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 3;
  int v8 = v6 - 3;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for WFSetupServer.WFSetupServerState.InvalidationState(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 2 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 2) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFE) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFD)
  {
    unsigned int v6 = ((a2 - 254) >> 8) + 1;
    *uint64_t result = a2 + 2;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x25E799C24);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *uint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for WFSetupServer.WFSetupServerState.InvalidationState()
{
  return &type metadata for WFSetupServer.WFSetupServerState.InvalidationState;
}

unint64_t sub_25E799C60()
{
  unint64_t result = qword_26A706AA8;
  if (!qword_26A706AA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A706AA8);
  }
  return result;
}

unint64_t sub_25E799CB8()
{
  unint64_t result = qword_26A706AB0;
  if (!qword_26A706AB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A706AB0);
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for DisconnectedProximitySetupServerAnalyticsEvent(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for DisconnectedProximitySetupServerAnalyticsEvent()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for DisconnectedProximitySetupServerAnalyticsEvent(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for DisconnectedProximitySetupServerAnalyticsEvent(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy40_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for DisconnectedProximitySetupServerAnalyticsEvent(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for DisconnectedProximitySetupServerAnalyticsEvent(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 40)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for DisconnectedProximitySetupServerAnalyticsEvent(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 40) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 40) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for DisconnectedProximitySetupServerAnalyticsEvent()
{
  return &type metadata for DisconnectedProximitySetupServerAnalyticsEvent;
}

uint64_t sub_25E79A0AC(char a1)
{
  if (!a1) {
    return 1701667182;
  }
  if (a1 == 1) {
    return 0xD000000000000011;
  }
  return 0x64616F6C796170;
}

BOOL sub_25E79A100(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_25E79A114()
{
  return sub_25E7BC7A0();
}

uint64_t sub_25E79A15C()
{
  return sub_25E7BC790();
}

uint64_t sub_25E79A188()
{
  return sub_25E7BC7A0();
}

uint64_t sub_25E79A1CC()
{
  return sub_25E79A0AC(*v0);
}

uint64_t sub_25E79A1D4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25E79A7D8(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_25E79A1FC()
{
  return 0;
}

void sub_25E79A208(unsigned char *a1@<X8>)
{
  *a1 = 3;
}

uint64_t sub_25E79A214(uint64_t a1)
{
  unint64_t v2 = sub_25E79A578();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25E79A250(uint64_t a1)
{
  unint64_t v2 = sub_25E79A578();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_25E79A28C(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A706AD0);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5, v7);
  unint64_t v9 = &v11[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_0(a1, a1[3]);
  sub_25E79A578();
  sub_25E7BC7C0();
  char v14 = 0;
  sub_25E7BC690();
  if (!v2)
  {
    char v13 = 1;
    sub_25E7BC690();
    uint64_t v12 = *(void *)(v3 + 32);
    v11[15] = 2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A706AC0);
    sub_25E79A490();
    sub_25E7BC6A0();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v9, v5);
}

uint64_t sub_25E79A438()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_25E79A468@<X0>(void *a1@<X8>)
{
  *a1 = *(void *)(v1 + 32);
  return swift_bridgeObjectRetain();
}

uint64_t sub_25E79A474(void *a1)
{
  return sub_25E79A28C(a1);
}

unint64_t sub_25E79A490()
{
  unint64_t result = qword_26A706AB8;
  if (!qword_26A706AB8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A706AC0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A706AB8);
  }
  return result;
}

unint64_t sub_25E79A4FC(uint64_t a1)
{
  unint64_t result = sub_25E79A524();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_25E79A524()
{
  unint64_t result = qword_26A706AC8;
  if (!qword_26A706AC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A706AC8);
  }
  return result;
}

unint64_t sub_25E79A578()
{
  unint64_t result = qword_26A706AD8;
  if (!qword_26A706AD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A706AD8);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for DisconnectedProximitySetupServerAnalyticsEvent.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 2 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 2) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFE) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFD)
  {
    unsigned int v6 = ((a2 - 254) >> 8) + 1;
    *unint64_t result = a2 + 2;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x25E79A698);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *unint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for DisconnectedProximitySetupServerAnalyticsEvent.CodingKeys()
{
  return &type metadata for DisconnectedProximitySetupServerAnalyticsEvent.CodingKeys;
}

unint64_t sub_25E79A6D4()
{
  unint64_t result = qword_26A706AE0;
  if (!qword_26A706AE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A706AE0);
  }
  return result;
}

unint64_t sub_25E79A72C()
{
  unint64_t result = qword_26A706AE8;
  if (!qword_26A706AE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A706AE8);
  }
  return result;
}

unint64_t sub_25E79A784()
{
  unint64_t result = qword_26A706AF0;
  if (!qword_26A706AF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A706AF0);
  }
  return result;
}

uint64_t sub_25E79A7D8(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 1701667182 && a2 == 0xE400000000000000;
  if (v3 || (sub_25E7BC6D0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x800000025E7C07C0 || (sub_25E7BC6D0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x64616F6C796170 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v6 = sub_25E7BC6D0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

void WFSetupClient.provisionAnisette(completion:)(uint64_t a1, uint64_t a2)
{
}

void WFSetupClient.eraseAnisette(completion:)(uint64_t a1, uint64_t a2)
{
}

void WFSetupClient.fetchAnisetteDataAndProvisionIfNecessary(_:withCompletion:)(uint64_t a1, void *a2, uint64_t a3)
{
}

void _s10TDGSharing13WFSetupClientC12syncAnisette11withSIMData10completiony10Foundation4DataVSg_ySb_s5Error_pSgtcSgtF_0(uint64_t a1, unint64_t a2, void *a3, uint64_t a4)
{
  id v7 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F29108]), sel_init);
  if (a2 >> 60 == 15)
  {
    uint64_t v8 = 0;
    if (!a3) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  uint64_t v8 = (void *)sub_25E7BC200();
  if (a3)
  {
LABEL_5:
    v9[4] = a3;
    v9[5] = a4;
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 1107296256;
    v9[2] = sub_25E79BBDC;
    v9[3] = &block_descriptor_24;
    a3 = _Block_copy(v9);
    swift_retain();
    swift_release();
  }
LABEL_6:
  objc_msgSend(v7, sel_syncWithSIMData_completion_, v8, a3);
  _Block_release(a3);
}

void sub_25E79AE80(uint64_t a1, uint64_t a2, uint64_t a3, SEL *a4)
{
  id v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F29108]), sel_init);
  if (a1)
  {
    v10[4] = a1;
    v10[5] = a2;
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 1107296256;
    v10[2] = sub_25E79BBDC;
    v10[3] = a3;
    unint64_t v9 = _Block_copy(v10);
    swift_retain();
    swift_release();
  }
  else
  {
    unint64_t v9 = 0;
  }
  objc_msgSend(v8, *a4, v9);
  _Block_release(v9);
}

void sub_25E79AF68(void *a1, uint64_t a2)
{
  id v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F29108]), sel_init);
  if (a1)
  {
    v5[4] = a1;
    v5[5] = a2;
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 1107296256;
    v5[2] = sub_25E7A5CD0;
    v5[3] = &block_descriptor_18;
    a1 = _Block_copy(v5);
    swift_retain();
    swift_release();
  }
  objc_msgSend(v4, sel_anisetteDataWithCompletion_, a1);
  _Block_release(a1);
}

void _s10TDGSharing13WFSetupClientC18legacyAnisetteData7forDSID14withCompletionySSSg_ySo010AKAnisetteF0CSg_s5Error_pSgtcSgtF_0(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F29108]), sel_init);
  if (a2) {
    a2 = (void *)sub_25E7BC3D0();
  }
  if (a3)
  {
    v8[4] = a3;
    v8[5] = a4;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 1107296256;
    v8[2] = sub_25E7A5CD0;
    v8[3] = &block_descriptor_0;
    a3 = _Block_copy(v8);
    swift_retain();
    swift_release();
  }
  objc_msgSend(v7, sel_legacyAnisetteDataForDSID_withCompletion_, a2, a3);
  _Block_release(a3);
}

uint64_t sub_25E79B14C()
{
  _Block_release(*(const void **)(v0 + 16));
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_25E79B184(uint64_t a1, uint64_t a2)
{
  sub_25E7B1D50(a1, a2, *(void *)(v2 + 16));
}

void sub_25E79B18C(char a1, uint64_t a2)
{
  sub_25E7B1CE0(a1, a2, *(void *)(v2 + 16));
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

ValueMetadata *type metadata accessor for DisconnectedProximitySetupClientAnalyticsEvent()
{
  return &type metadata for DisconnectedProximitySetupClientAnalyticsEvent;
}

uint64_t sub_25E79B1F4(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A706BC8);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5, v7);
  unint64_t v9 = &v11[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_0(a1, a1[3]);
  sub_25E79B4AC();
  sub_25E7BC7C0();
  char v14 = 0;
  sub_25E7BC690();
  if (!v2)
  {
    char v13 = 1;
    sub_25E7BC690();
    uint64_t v12 = *(void *)(v3 + 32);
    v11[15] = 2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A706AC0);
    sub_25E79A490();
    sub_25E7BC6A0();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v9, v5);
}

uint64_t sub_25E79B3A0(uint64_t a1)
{
  unint64_t v2 = sub_25E79B4AC();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25E79B3DC(uint64_t a1)
{
  unint64_t v2 = sub_25E79B4AC();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_25E79B418(void *a1)
{
  return sub_25E79B1F4(a1);
}

unint64_t sub_25E79B430(uint64_t a1)
{
  unint64_t result = sub_25E79B458();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_25E79B458()
{
  unint64_t result = qword_26A706BC0;
  if (!qword_26A706BC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A706BC0);
  }
  return result;
}

unint64_t sub_25E79B4AC()
{
  unint64_t result = qword_26A706BD0;
  if (!qword_26A706BD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A706BD0);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for DisconnectedProximitySetupClientAnalyticsEvent.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 2 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 2) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFE) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFD)
  {
    unsigned int v6 = ((a2 - 254) >> 8) + 1;
    *unint64_t result = a2 + 2;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x25E79B5CCLL);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *unint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for DisconnectedProximitySetupClientAnalyticsEvent.CodingKeys()
{
  return &type metadata for DisconnectedProximitySetupClientAnalyticsEvent.CodingKeys;
}

unint64_t sub_25E79B608()
{
  unint64_t result = qword_26A706BD8;
  if (!qword_26A706BD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A706BD8);
  }
  return result;
}

unint64_t sub_25E79B660()
{
  unint64_t result = qword_26A706BE0;
  if (!qword_26A706BE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A706BE0);
  }
  return result;
}

unint64_t sub_25E79B6B8()
{
  unint64_t result = qword_26A706BE8;
  if (!qword_26A706BE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A706BE8);
  }
  return result;
}

void sub_25E79B70C(uint64_t a1, void *a2)
{
  int v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3(a2);
  swift_release();
}

void sub_25E79B778(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v3 = sub_25E7BC1D0();
  }
  else {
    uint64_t v3 = 0;
  }
  id v4 = (id)v3;
  (*(void (**)(uint64_t))(a2 + 16))(a2);
}

uint64_t sub_25E79B7DC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void (**)(uint64_t, uint64_t))(a1 + 32);
  uint64_t v4 = sub_25E7BC390();
  swift_retain();
  v3(a2, v4);
  swift_release();
  return swift_bridgeObjectRelease();
}

void sub_25E79B868(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5 = (id)sub_25E7BC370();
  (*(void (**)(uint64_t, uint64_t, id))(a3 + 16))(a3, a1, v5);
}

uint64_t sub_25E79B8EC(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = sub_25E7BC390();
  swift_retain();
  v1(v2);
  swift_release();
  return swift_bridgeObjectRelease();
}

void sub_25E79B970(uint64_t a1, uint64_t a2)
{
  id v3 = (id)sub_25E7BC370();
  (*(void (**)(uint64_t, id))(a2 + 16))(a2, v3);
}

void sub_25E79B9E4(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  if (a1) {
    uint64_t v7 = (void *)sub_25E7BC1D0();
  }
  else {
    uint64_t v7 = 0;
  }
  if (a2) {
    a2 = (void *)sub_25E7BC370();
  }
  if (a3) {
    uint64_t v8 = sub_25E7BC370();
  }
  else {
    uint64_t v8 = 0;
  }
  id v9 = (id)v8;
  (*(void (**)(uint64_t, void *, void *))(a4 + 16))(a4, v7, a2);
}

uint64_t sub_25E79BAC8(uint64_t a1, uint64_t a2, uint64_t a3, const void *a4)
{
  id v5 = *(void (**)(uint64_t, uint64_t, void (*)(uint64_t, void *, uint64_t), uint64_t))(a1 + 32);
  if (a2) {
    uint64_t v6 = sub_25E7BC390();
  }
  else {
    uint64_t v6 = 0;
  }
  uint64_t v7 = sub_25E7BC390();
  uint64_t v8 = _Block_copy(a4);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  swift_retain();
  v5(v6, v7, sub_25E799804, v9);
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  return swift_bridgeObjectRelease();
}

void sub_25E79BBDC(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  swift_retain();
  id v6 = a3;
  v5(a2, a3);
  swift_release();
}

id WFSetupClient.dispatchQueue.getter()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR___WFSetupClientInternal_dispatchQueue);
  swift_beginAccess();
  uint64_t v2 = *v1;
  return v2;
}

void WFSetupClient.dispatchQueue.setter(void *a1)
{
  id v3 = (void **)(v1 + OBJC_IVAR___WFSetupClientInternal_dispatchQueue);
  swift_beginAccess();
  uint64_t v4 = *v3;
  *id v3 = a1;
}

uint64_t (*WFSetupClient.dispatchQueue.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t WFSetupClient.interruptionHandler.getter()
{
  return sub_25E79CDCC(&OBJC_IVAR___WFSetupClientInternal_interruptionHandler, (void (*)(void, void))sub_25E785E00);
}

uint64_t WFSetupClient.interruptionHandler.setter(uint64_t a1, uint64_t a2)
{
  return sub_25E79CF74(a1, a2, &OBJC_IVAR___WFSetupClientInternal_interruptionHandler, (uint64_t (*)(uint64_t, uint64_t))sub_25E785F38);
}

uint64_t (*WFSetupClient.interruptionHandler.modify())()
{
  return j_j__swift_endAccess;
}

id sub_25E79BF70(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v5 = (uint64_t *)(a1 + *a3);
  swift_beginAccess();
  uint64_t v6 = *v5;
  if (*v5)
  {
    uint64_t v7 = v5[1];
    aBlock[4] = v6;
    aBlock[5] = v7;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_25E787340;
    aBlock[3] = a4;
    uint64_t v8 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
  }
  else
  {
    uint64_t v8 = 0;
  }
  return v8;
}

uint64_t WFSetupClient.invalidationHandler.getter()
{
  return sub_25E79CDCC(&OBJC_IVAR___WFSetupClientInternal_invalidationHandler, (void (*)(void, void))sub_25E785E00);
}

uint64_t WFSetupClient.invalidationHandler.setter(uint64_t a1, uint64_t a2)
{
  return sub_25E79CF74(a1, a2, &OBJC_IVAR___WFSetupClientInternal_invalidationHandler, (uint64_t (*)(uint64_t, uint64_t))sub_25E785F38);
}

uint64_t (*WFSetupClient.invalidationHandler.modify())()
{
  return j_j__swift_endAccess;
}

void *WFSetupClient.peerDevice.getter()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR___WFSetupClientInternal_peerDevice);
  swift_beginAccess();
  uint64_t v2 = *v1;
  id v3 = v2;
  return v2;
}

void WFSetupClient.peerDevice.setter(void *a1)
{
  id v3 = (void **)(v1 + OBJC_IVAR___WFSetupClientInternal_peerDevice);
  swift_beginAccess();
  uint64_t v4 = *v3;
  *id v3 = a1;
}

uint64_t (*WFSetupClient.peerDevice.modify())()
{
  return j__swift_endAccess;
}

id sub_25E79C2A8(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = (id *)(a1 + *a3);
  swift_beginAccess();
  return *v3;
}

void *WFSetupClient.messageSessionTemplate.getter()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR___WFSetupClientInternal_messageSessionTemplate);
  swift_beginAccess();
  uint64_t v2 = *v1;
  id v3 = v2;
  return v2;
}

void sub_25E79C34C(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v5 = (void **)(a1 + *a4);
  swift_beginAccess();
  uint64_t v6 = *v5;
  uint64_t *v5 = a3;
  id v7 = a3;
}

void sub_25E79C3A8(void **a1, void *a2)
{
  uint64_t v2 = *a1;
  id v3 = (void **)(*a2 + OBJC_IVAR___WFSetupClientInternal_messageSessionTemplate);
  swift_beginAccess();
  uint64_t v4 = *v3;
  *id v3 = v2;
  id v5 = v2;
}

uint64_t WFSetupClient.setupProgressEventHandler.getter()
{
  return sub_25E79CDCC(&OBJC_IVAR___WFSetupClientInternal_setupProgressEventHandler, (void (*)(void, void))sub_25E799D14);
}

uint64_t WFSetupClient.setupProgressEventHandler.setter(uint64_t a1, uint64_t a2)
{
  return sub_25E79CF74(a1, a2, &OBJC_IVAR___WFSetupClientInternal_setupProgressEventHandler, (uint64_t (*)(uint64_t, uint64_t))sub_25E799D18);
}

uint64_t (*WFSetupClient.setupProgressEventHandler.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t WFSetupClient.userInteractionProgressEventHandler.getter()
{
  return sub_25E79CDCC(&OBJC_IVAR___WFSetupClientInternal_userInteractionProgressEventHandler, (void (*)(void, void))sub_25E799D14);
}

uint64_t sub_25E79C724(uint64_t a1, uint64_t a2)
{
  id v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);
  return swift_release();
}

uint64_t WFSetupClient.userInteractionProgressEventHandler.setter(uint64_t a1, uint64_t a2)
{
  return sub_25E79CF74(a1, a2, &OBJC_IVAR___WFSetupClientInternal_userInteractionProgressEventHandler, (uint64_t (*)(uint64_t, uint64_t))sub_25E799D18);
}

uint64_t (*WFSetupClient.userInteractionProgressEventHandler.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t WFSetupClient.setupSecurePairingCompletionHandler.getter()
{
  return sub_25E79CDCC(&OBJC_IVAR___WFSetupClientInternal_setupSecurePairingCompletionHandler, (void (*)(void, void))sub_25E799D14);
}

uint64_t WFSetupClient.setupSecurePairingCompletionHandler.setter(uint64_t a1, uint64_t a2)
{
  return sub_25E79CF74(a1, a2, &OBJC_IVAR___WFSetupClientInternal_setupSecurePairingCompletionHandler, (uint64_t (*)(uint64_t, uint64_t))sub_25E799D18);
}

uint64_t (*WFSetupClient.setupSecurePairingCompletionHandler.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t WFSetupClient.receivedObjectHandler.getter()
{
  return sub_25E79CDCC(&OBJC_IVAR___WFSetupClientInternal_receivedObjectHandler, (void (*)(void, void))sub_25E785E00);
}

uint64_t WFSetupClient.receivedObjectHandler.setter(uint64_t a1, uint64_t a2)
{
  return sub_25E79CF74(a1, a2, &OBJC_IVAR___WFSetupClientInternal_receivedObjectHandler, (uint64_t (*)(uint64_t, uint64_t))sub_25E785F38);
}

uint64_t (*WFSetupClient.receivedObjectHandler.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t WFSetupClient.showPinHandler.getter()
{
  return sub_25E79CDCC(&OBJC_IVAR___WFSetupClientInternal_showPinHandler, (void (*)(void, void))sub_25E799D14);
}

uint64_t sub_25E79CDCC(void *a1, void (*a2)(void, void))
{
  uint64_t v4 = (void *)(v2 + *a1);
  swift_beginAccess();
  uint64_t v5 = *v4;
  a2(*v4, v4[1]);
  return v5;
}

uint64_t sub_25E79CE34(uint64_t a1, uint64_t a2)
{
  id v3 = *(void (**)(uint64_t, uint64_t, uint64_t))(a1 + 32);
  uint64_t v4 = sub_25E7BC3E0();
  uint64_t v6 = v5;
  swift_retain();
  v3(a2, v4, v6);
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t WFSetupClient.showPinHandler.setter(uint64_t a1, uint64_t a2)
{
  return sub_25E79CF74(a1, a2, &OBJC_IVAR___WFSetupClientInternal_showPinHandler, (uint64_t (*)(uint64_t, uint64_t))sub_25E799D18);
}

uint64_t sub_25E79CF74(uint64_t a1, uint64_t a2, void *a3, uint64_t (*a4)(uint64_t, uint64_t))
{
  uint64_t v8 = (uint64_t *)(v4 + *a3);
  swift_beginAccess();
  uint64_t v9 = *v8;
  uint64_t v10 = v8[1];
  *uint64_t v8 = a1;
  v8[1] = a2;
  return a4(v9, v10);
}

uint64_t (*WFSetupClient.showPinHandler.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_25E79D034()
{
  return 0;
}

uint64_t sub_25E79D30C(char a1)
{
  if (!a1) {
    return 0x6974696E49746F6ELL;
  }
  if (a1 == 1) {
    return 0xD000000000000012;
  }
  return 0xD000000000000017;
}

uint64_t sub_25E79D378()
{
  return sub_25E79D30C(*v0);
}

uint64_t sub_25E79D380(char a1)
{
  return *(void *)&aNotinitiinprog[8 * a1];
}

uint64_t sub_25E79D3A0()
{
  return sub_25E79D380(*v0);
}

uint64_t sub_25E79D3A8()
{
  return sub_25E79D034();
}

id WFSetupClient.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

id WFSetupClient.init()()
{
  id v1 = v0;
  sub_25E78314C(0, (unint64_t *)&qword_26A706610);
  uint64_t v2 = (void *)sub_25E7BC4D0();
  id v3 = objc_msgSend(v1, sel_initWithQueue_deviceIdentifier_, v2, 0);

  return v3;
}

void *WFSetupClient.__allocating_init(queue:deviceIdentifier:)(void *a1, uint64_t a2, uint64_t a3)
{
  id v7 = objc_allocWithZone(v3);
  return WFSetupClient.init(queue:deviceIdentifier:)(a1, a2, a3);
}

void *WFSetupClient.init(queue:deviceIdentifier:)(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A706998);
  MEMORY[0x270FA5388](v6 - 8, v7);
  uint64_t v9 = (char *)&v53 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = &v3[OBJC_IVAR___WFSetupClientInternal_interruptionHandler];
  *(void *)uint64_t v10 = 0;
  *((void *)v10 + 1) = 0;
  uint64_t v11 = &v3[OBJC_IVAR___WFSetupClientInternal_invalidationHandler];
  *(void *)uint64_t v11 = 0;
  *((void *)v11 + 1) = 0;
  *(void *)&v3[OBJC_IVAR___WFSetupClientInternal_peerDevice] = 0;
  *(void *)&v3[OBJC_IVAR___WFSetupClientInternal_messageSessionTemplate] = 0;
  uint64_t v12 = &v3[OBJC_IVAR___WFSetupClientInternal_setupProgressEventHandler];
  *(void *)uint64_t v12 = 0;
  *((void *)v12 + 1) = 0;
  char v13 = &v3[OBJC_IVAR___WFSetupClientInternal_userInteractionProgressEventHandler];
  *(void *)char v13 = 0;
  *((void *)v13 + 1) = 0;
  char v14 = &v3[OBJC_IVAR___WFSetupClientInternal_setupSecurePairingCompletionHandler];
  *(void *)char v14 = 0;
  *((void *)v14 + 1) = 0;
  uint64_t v15 = &v3[OBJC_IVAR___WFSetupClientInternal_receivedObjectHandler];
  *(void *)uint64_t v15 = 0;
  *((void *)v15 + 1) = 0;
  os_log_type_t v16 = &v3[OBJC_IVAR___WFSetupClientInternal_showPinHandler];
  *(void *)os_log_type_t v16 = 0;
  *((void *)v16 + 1) = 0;
  *(void *)&v3[OBJC_IVAR___WFSetupClientInternal_clientState] = 0;
  uint64_t v17 = OBJC_IVAR___WFSetupClientInternal_analyticsManager;
  char v60 = &type metadata for CoreAnalyticsBackend;
  uint64_t v61 = &off_270B571A8;
  type metadata accessor for AnalyticsManager();
  uint64_t v18 = swift_allocObject();
  uint64_t v19 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v59, (uint64_t)&type metadata for CoreAnalyticsBackend);
  MEMORY[0x270FA5388](v19, v19);
  (*(void (**)(void))(v20 + 16))();
  *(void *)(v18 + 40) = &type metadata for CoreAnalyticsBackend;
  *(void *)(v18 + 48) = &off_270B571A8;
  BOOL v21 = v3;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v59);
  *(void *)&v3[v17] = v18;
  *(void *)&v21[OBJC_IVAR___WFSetupClientInternal_sfSession] = 0;
  *(void *)&v21[OBJC_IVAR___WFSetupClientInternal_dispatchQueue] = a1;
  id v22 = a1;

  uint64_t v23 = (objc_class *)type metadata accessor for WFSetupClient();
  v58.receiver = v21;
  v58.super_class = v23;
  id v24 = objc_msgSendSuper2(&v58, sel_init);
  uint64_t v25 = v24;
  if (!a3)
  {
    uint64_t v45 = qword_26A7065D8;
    id v34 = v24;
    if (v45 != -1) {
      swift_once();
    }
    uint64_t v46 = sub_25E7BC2E0();
    __swift_project_value_buffer(v46, (uint64_t)qword_26A708A10);
    long long v47 = sub_25E7BC2C0();
    os_log_type_t v48 = sub_25E7BC490();
    if (os_log_type_enabled(v47, v48))
    {
      uint64_t v49 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v49 = 0;
      _os_log_impl(&dword_25E775000, v47, v48, "deviceIdentifier provided was nil", v49, 2u);
      MEMORY[0x2611E3480](v49, -1, -1);
    }

    goto LABEL_15;
  }
  id v26 = objc_allocWithZone(MEMORY[0x263F6C210]);
  uint64_t v27 = v25;
  id v28 = objc_msgSend(v26, sel_init);
  sub_25E7BC230();
  swift_bridgeObjectRelease();
  uint64_t v29 = sub_25E7BC280();
  uint64_t v30 = *(void *)(v29 - 8);
  uint64_t v31 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v30 + 48))(v9, 1, v29) != 1)
  {
    uint64_t v31 = (void *)sub_25E7BC260();
    (*(void (**)(char *, uint64_t))(v30 + 8))(v9, v29);
  }
  objc_msgSend(v28, sel_setIdentifier_, v31);

  uint64_t v32 = (id *)&v27[OBJC_IVAR___WFSetupClientInternal_peerDevice];
  swift_beginAccess();
  id v33 = *v32;
  *uint64_t v32 = v28;
  id v34 = v28;

  if (qword_26A7065D8 != -1) {
    swift_once();
  }
  uint64_t v35 = sub_25E7BC2E0();
  __swift_project_value_buffer(v35, (uint64_t)qword_26A708A10);
  id v36 = v27;
  uint64_t v37 = sub_25E7BC2C0();
  os_log_type_t v38 = sub_25E7BC4A0();
  if (!os_log_type_enabled(v37, v38))
  {

LABEL_15:
    return v25;
  }
  id v54 = v22;
  uint64_t v39 = (uint8_t *)swift_slowAlloc();
  uint64_t v40 = swift_slowAlloc();
  uint64_t v57 = v40;
  *(_DWORD *)uint64_t v39 = 136446210;
  if (*v32)
  {
    id v41 = objc_msgSend(*v32, sel_description);
    uint64_t v42 = sub_25E7BC3E0();
    uint64_t v44 = v43;
  }
  else
  {
    uint64_t v42 = 0;
    uint64_t v44 = 0;
  }
  uint64_t v55 = v42;
  uint64_t v56 = v44;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A706640);
  uint64_t v50 = sub_25E7BC3F0();
  uint64_t v55 = sub_25E77CF40(v50, v51, &v57);
  sub_25E7BC520();

  swift_bridgeObjectRelease();
  _os_log_impl(&dword_25E775000, v37, v38, "SFDevice created: %{public}s", v39, 0xCu);
  swift_arrayDestroy();
  MEMORY[0x2611E3480](v40, -1, -1);
  MEMORY[0x2611E3480](v39, -1, -1);

  return v25;
}

id WFSetupClient.__deallocating_deinit()
{
  id v1 = v0;
  if (qword_26A7065D8 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_25E7BC2E0();
  __swift_project_value_buffer(v2, (uint64_t)qword_26A708A10);
  id v3 = sub_25E7BC2C0();
  os_log_type_t v4 = sub_25E7BC4A0();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_25E775000, v3, v4, "WFSetupClient deinit", v5, 2u);
    MEMORY[0x2611E3480](v5, -1, -1);
  }

  if (*((unsigned char *)v0 + OBJC_IVAR___WFSetupClientInternal_clientState + 2) == 1
    && (*((unsigned char *)v0 + OBJC_IVAR___WFSetupClientInternal_clientState + 5) & 1) == 0)
  {
    uint64_t v6 = sub_25E7BC2C0();
    os_log_type_t v7 = sub_25E7BC490();
    if (os_log_type_enabled(v6, v7))
    {
      uint64_t v8 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v8 = 0;
      _os_log_impl(&dword_25E775000, v6, v7, "deallocating object before invalidation is called", v8, 2u);
      MEMORY[0x2611E3480](v8, -1, -1);
    }
  }
  v10.receiver = v1;
  v10.super_class = (Class)type metadata accessor for WFSetupClient();
  return objc_msgSendSuper2(&v10, sel_dealloc);
}

Swift::Void __swiftcall WFSetupClient.invalidate()()
{
  uint64_t v1 = sub_25E7BC2F0();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1, v3);
  uint64_t v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_25E7BC310();
  uint64_t v6 = *(void *)(v16 - 8);
  MEMORY[0x270FA5388](v16, v7);
  uint64_t v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  objc_super v10 = (void **)(v0 + OBJC_IVAR___WFSetupClientInternal_dispatchQueue);
  swift_beginAccess();
  uint64_t v11 = *v10;
  uint64_t v12 = swift_allocObject();
  swift_unknownObjectWeakInit();
  aBlock[4] = sub_25E7A5064;
  aBlock[5] = v12;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_25E787340;
  aBlock[3] = &block_descriptor_1;
  char v13 = _Block_copy(aBlock);
  id v14 = v11;
  swift_retain();
  sub_25E7BC300();
  uint64_t v17 = MEMORY[0x263F8EE78];
  sub_25E7A5084();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A706988);
  sub_25E796798();
  sub_25E7BC550();
  MEMORY[0x2611E2BA0](0, v9, v5, v13);
  _Block_release(v13);

  (*(void (**)(char *, uint64_t))(v2 + 8))(v5, v1);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v16);
  swift_release();
  swift_release();
}

void sub_25E79E130(uint64_t a1)
{
  uint64_t v1 = a1 + 16;
  if (qword_26A7065D8 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_25E7BC2E0();
  __swift_project_value_buffer(v2, (uint64_t)qword_26A708A10);
  uint64_t v3 = sub_25E7BC2C0();
  os_log_type_t v4 = sub_25E7BC4A0();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v6 = swift_slowAlloc();
    v42[0] = v6;
    *(_DWORD *)uint64_t v5 = 136446210;
    sub_25E77CF40(0x6164696C61766E69, 0xEC00000029286574, v42);
    sub_25E7BC520();
    _os_log_impl(&dword_25E775000, v3, v4, "%{public}s invoked", v5, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2611E3480](v6, -1, -1);
    MEMORY[0x2611E3480](v5, -1, -1);
  }

  swift_beginAccess();
  uint64_t v7 = (unsigned char *)MEMORY[0x2611E34D0](v1);
  if (!v7 || (char v8 = v7[OBJC_IVAR___WFSetupClientInternal_clientState + 5], v7, (v8 & 1) != 0))
  {
    uint64_t v9 = sub_25E7BC2C0();
    os_log_type_t v10 = sub_25E7BC4A0();
    if (os_log_type_enabled(v9, v10))
    {
      uint64_t v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl(&dword_25E775000, v9, v10, "Already called invalidation method", v11, 2u);
      MEMORY[0x2611E3480](v11, -1, -1);
    }
    goto LABEL_30;
  }
  swift_beginAccess();
  uint64_t v12 = (unsigned char *)MEMORY[0x2611E34D0](v1);
  if (v12)
  {
    v12[OBJC_IVAR___WFSetupClientInternal_clientState + 5] = 1;
  }
  swift_beginAccess();
  uint64_t v13 = MEMORY[0x2611E34D0](v1);
  if (v13)
  {
    id v14 = (void *)v13;
    id v15 = *(id *)(v13 + OBJC_IVAR___WFSetupClientInternal_sfSession);

    objc_msgSend(v15, sel_invalidate);
  }
  swift_beginAccess();
  uint64_t v16 = (char *)MEMORY[0x2611E34D0](v1);
  if (v16)
  {
    uint64_t v17 = *(void **)&v16[OBJC_IVAR___WFSetupClientInternal_sfSession];
    *(void *)&v16[OBJC_IVAR___WFSetupClientInternal_sfSession] = 0;
  }
  swift_beginAccess();
  uint64_t v18 = (unsigned char *)MEMORY[0x2611E34D0](v1);
  if (v18)
  {
    v18[OBJC_IVAR___WFSetupClientInternal_clientState + 4] = 0;
  }
  swift_beginAccess();
  uint64_t v19 = MEMORY[0x2611E34D0](v1);
  if (v19)
  {
    uint64_t v20 = (void *)v19;
    BOOL v21 = (uint64_t *)(v19 + OBJC_IVAR___WFSetupClientInternal_invalidationHandler);
    swift_beginAccess();
    id v22 = (void (*)(void))*v21;
    sub_25E785E00(*v21);

    if (v22)
    {
      v22();
      sub_25E785F38((uint64_t)v22);
    }
  }
  swift_beginAccess();
  uint64_t v23 = MEMORY[0x2611E34D0](v1);
  if (v23)
  {
    id v24 = (void *)v23;
    uint64_t v25 = (uint64_t *)(v23 + OBJC_IVAR___WFSetupClientInternal_invalidationHandler);
    swift_beginAccess();
    uint64_t v26 = *v25;
    *uint64_t v25 = 0;
    v25[1] = 0;
    sub_25E785F38(v26);
  }
  swift_beginAccess();
  uint64_t v27 = MEMORY[0x2611E34D0](v1);
  if (v27)
  {
    id v28 = (void *)v27;
    uint64_t v29 = (uint64_t *)(v27 + OBJC_IVAR___WFSetupClientInternal_receivedObjectHandler);
    swift_beginAccess();
    uint64_t v30 = *v29;
    *uint64_t v29 = 0;
    v29[1] = 0;
    sub_25E785F38(v30);
  }
  swift_beginAccess();
  uint64_t v31 = MEMORY[0x2611E34D0](v1);
  if (v31)
  {
    uint64_t v32 = (void *)v31;
    id v33 = (uint64_t *)(v31 + OBJC_IVAR___WFSetupClientInternal_setupSecurePairingCompletionHandler);
    swift_beginAccess();
    uint64_t v34 = *v33;
    *id v33 = 0;
    v33[1] = 0;
    sub_25E785F38(v34);
  }
  swift_beginAccess();
  uint64_t v35 = MEMORY[0x2611E34D0](v1);
  if (v35)
  {
    id v36 = (void *)v35;
    uint64_t v37 = (uint64_t *)(v35 + OBJC_IVAR___WFSetupClientInternal_showPinHandler);
    swift_beginAccess();
    uint64_t v38 = *v37;
    *uint64_t v37 = 0;
    v37[1] = 0;
    sub_25E785F38(v38);
  }
  swift_beginAccess();
  uint64_t v39 = MEMORY[0x2611E34D0](v1);
  if (v39)
  {
    uint64_t v40 = (void *)v39;
    id v41 = (NSObject **)(v39 + OBJC_IVAR___WFSetupClientInternal_peerDevice);
    swift_beginAccess();
    uint64_t v9 = *v41;
    *id v41 = 0;

LABEL_30:
  }
}

void WFSetupClient.sendUserInteractionEvent(inEvent:withEncryption:responseHandler:)(uint64_t a1, char a2, void (*a3)(void, void, void), uint64_t a4)
{
  uint64_t v5 = v4;
  if (qword_26A7065D8 != -1) {
    swift_once();
  }
  uint64_t v9 = sub_25E7BC2E0();
  __swift_project_value_buffer(v9, (uint64_t)qword_26A708A10);
  swift_bridgeObjectRetain_n();
  os_log_type_t v10 = sub_25E7BC2C0();
  os_log_type_t v11 = sub_25E7BC4A0();
  if (os_log_type_enabled(v10, v11))
  {
    id v48 = a3;
    uint64_t v12 = swift_slowAlloc();
    uint64_t v47 = swift_slowAlloc();
    uint64_t aBlock = v47;
    *(_DWORD *)uint64_t v12 = 136446722;
    sub_25E77CF40(0xD000000000000041, 0x800000025E7BFD20, &aBlock);
    sub_25E7BC520();
    *(_WORD *)(v12 + 12) = 2082;
    swift_bridgeObjectRetain();
    uint64_t v13 = a4;
    uint64_t v14 = sub_25E7BC3A0();
    unint64_t v16 = v15;
    swift_bridgeObjectRelease();
    uint64_t v17 = v14;
    a4 = v13;
    sub_25E77CF40(v17, v16, &aBlock);
    sub_25E7BC520();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v12 + 22) = 1024;
    sub_25E7BC520();
    _os_log_impl(&dword_25E775000, v10, v11, "%{public}s invoked with inEvent: %{public}s, withEncryption: %{BOOL}d", (uint8_t *)v12, 0x1Cu);
    swift_arrayDestroy();
    MEMORY[0x2611E3480](v47, -1, -1);
    uint64_t v18 = v12;
    a3 = (void (*)(void, void, void))v48;
    MEMORY[0x2611E3480](v18, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  uint64_t v19 = *(void **)(v5 + OBJC_IVAR___WFSetupClientInternal_sfSession);
  if (v19)
  {
    if (*(unsigned char *)(v5 + OBJC_IVAR___WFSetupClientInternal_clientState + 4) == 1)
    {
      if (a3)
      {
        char v20 = a2;
        uint64_t v21 = swift_allocObject();
        *(void *)(v21 + 16) = a3;
        *(void *)(v21 + 24) = a4;
        id v22 = (uint64_t (*)())sub_25E7A5138;
      }
      else
      {
        id v22 = nullsub_1;
        char v20 = a2;
        uint64_t v21 = 0;
      }
      uint64_t v35 = swift_allocObject();
      *(void *)(v35 + 16) = v22;
      *(void *)(v35 + 24) = v21;
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A706D80);
      uint64_t inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_25E7BDF10;
      uint64_t aBlock = 0xD000000000000010;
      unint64_t v51 = 0x800000025E7BFCC0;
      id v49 = v19;
      sub_25E785E00((uint64_t)a3);
      sub_25E7BC580();
      *(void *)(inited + 96) = MEMORY[0x263F8D4F8];
      *(unsigned char *)(inited + 72) = (v20 & 1) == 0;
      sub_25E7885A8(inited);
      swift_bridgeObjectRetain_n();
      uint64_t v37 = sub_25E7BC2C0();
      os_log_type_t v38 = sub_25E7BC4A0();
      if (os_log_type_enabled(v37, v38))
      {
        uint64_t v39 = swift_slowAlloc();
        uint64_t v40 = swift_slowAlloc();
        uint64_t aBlock = v40;
        *(_DWORD *)uint64_t v39 = 136446466;
        swift_bridgeObjectRetain();
        uint64_t v41 = sub_25E7BC3A0();
        unint64_t v43 = v42;
        swift_bridgeObjectRelease();
        sub_25E77CF40(v41, v43, &aBlock);
        sub_25E7BC520();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        *(_WORD *)(v39 + 12) = 1024;
        sub_25E7BC520();
        _os_log_impl(&dword_25E775000, v37, v38, "Sending interaction event: %{public}s, withEncryption: %{BOOL}d", (uint8_t *)v39, 0x12u);
        swift_arrayDestroy();
        MEMORY[0x2611E3480](v40, -1, -1);
        MEMORY[0x2611E3480](v39, -1, -1);
      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      uint64_t v44 = (void *)sub_25E7BC3D0();
      uint64_t v45 = (void *)sub_25E7BC370();
      swift_bridgeObjectRelease();
      id v29 = (id)sub_25E7BC370();
      id v54 = sub_25E7A5130;
      uint64_t v55 = v35;
      uint64_t aBlock = MEMORY[0x263EF8330];
      unint64_t v51 = 1107296256;
      uint64_t v52 = sub_25E788D3C;
      uint64_t v53 = &block_descriptor_7_0;
      uint64_t v46 = _Block_copy(&aBlock);
      swift_retain();
      swift_release();
      objc_msgSend(v49, sel_sendRequestID_options_request_responseHandler_, v44, v45, v29, v46);
      _Block_release(v46);

      swift_release();
LABEL_24:

      return;
    }
    id v29 = v19;
    uint64_t v30 = sub_25E7BC2C0();
    os_log_type_t v31 = sub_25E7BC490();
    if (os_log_type_enabled(v30, v31))
    {
      uint64_t v32 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v32 = 0;
      _os_log_impl(&dword_25E775000, v30, v31, "Attempting to send an object before the session is activated", v32, 2u);
      MEMORY[0x2611E3480](v32, -1, -1);
    }

    if (!a3) {
      goto LABEL_24;
    }
    sub_25E7A50DC();
    uint64_t v33 = swift_allocError();
    *uint64_t v34 = 3;
    a3(v33, 0, 0);

    id v28 = (void *)v33;
LABEL_18:

    return;
  }
  uint64_t v23 = sub_25E7BC2C0();
  os_log_type_t v24 = sub_25E7BC490();
  if (os_log_type_enabled(v23, v24))
  {
    uint64_t v25 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v25 = 0;
    _os_log_impl(&dword_25E775000, v23, v24, "Failed to send object to server. SfSession is unexpectedly nil. ", v25, 2u);
    MEMORY[0x2611E3480](v25, -1, -1);
  }

  if (a3)
  {
    sub_25E7A50DC();
    uint64_t v26 = swift_allocError();
    *uint64_t v27 = 2;
    a3(v26, 0, 0);
    id v28 = (void *)v26;
    goto LABEL_18;
  }
}

Swift::Void __swiftcall WFSetupClient.activate()()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_25E7BC2F0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2, v4);
  uint64_t v6 = (char *)&v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_25E7BC310();
  uint64_t v26 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7, v8);
  os_log_type_t v10 = (char *)&v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26A7065D8 != -1) {
    swift_once();
  }
  uint64_t v11 = sub_25E7BC2E0();
  __swift_project_value_buffer(v11, (uint64_t)qword_26A708A10);
  uint64_t v12 = sub_25E7BC2C0();
  os_log_type_t v13 = sub_25E7BC4A0();
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v24 = v1;
    uint64_t v14 = (uint8_t *)swift_slowAlloc();
    uint64_t v15 = swift_slowAlloc();
    uint64_t v25 = v3;
    uint64_t v16 = v15;
    aBlock[0] = v15;
    *(_DWORD *)uint64_t v14 = 136446210;
    void aBlock[6] = sub_25E77CF40(0x6574617669746361, 0xEA00000000002928, aBlock);
    uint64_t v1 = v24;
    sub_25E7BC520();
    _os_log_impl(&dword_25E775000, v12, v13, "%{public}s is invoked. ", v14, 0xCu);
    swift_arrayDestroy();
    uint64_t v17 = v16;
    uint64_t v3 = v25;
    MEMORY[0x2611E3480](v17, -1, -1);
    MEMORY[0x2611E3480](v14, -1, -1);
  }

  uint64_t v18 = (void **)(v1 + OBJC_IVAR___WFSetupClientInternal_dispatchQueue);
  swift_beginAccess();
  uint64_t v19 = *v18;
  uint64_t v20 = swift_allocObject();
  swift_unknownObjectWeakInit();
  aBlock[4] = (uint64_t)sub_25E7A5140;
  aBlock[5] = v20;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_25E787340;
  aBlock[3] = (uint64_t)&block_descriptor_14;
  uint64_t v21 = _Block_copy(aBlock);
  id v22 = v19;
  swift_retain();
  sub_25E7BC300();
  uint64_t v27 = MEMORY[0x263F8EE78];
  sub_25E7A5084();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A706988);
  sub_25E796798();
  sub_25E7BC550();
  MEMORY[0x2611E2BA0](0, v10, v6, v21);
  _Block_release(v21);

  (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  (*(void (**)(char *, uint64_t))(v26 + 8))(v10, v7);
  swift_release();
  swift_release();
}

void sub_25E79F384(uint64_t a1)
{
  uint64_t v1 = a1 + 16;
  if (qword_26A7065D8 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_25E7BC2E0();
  __swift_project_value_buffer(v2, (uint64_t)qword_26A708A10);
  uint64_t v3 = sub_25E7BC2C0();
  os_log_type_t v4 = sub_25E7BC4A0();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_25E775000, v3, v4, "Client is being activated", v5, 2u);
    MEMORY[0x2611E3480](v5, -1, -1);
  }

  swift_beginAccess();
  uint64_t v6 = MEMORY[0x2611E34D0](v1);
  if (v6)
  {
    uint64_t v7 = v6;
    *(unsigned char *)(v6 + OBJC_IVAR___WFSetupClientInternal_clientState + 2) = 1;
    uint64_t v8 = v6 + OBJC_IVAR___WFSetupClientInternal_setupProgressEventHandler;
    swift_beginAccess();
    os_log_type_t v10 = *(void (**)(void, void))v8;
    uint64_t v9 = *(void *)(v8 + 8);
    sub_25E785E00((uint64_t)v10);
    sub_25E7ADD10(0, 0, 0, v10, v9);
    sub_25E785F38((uint64_t)v10);
    uint64_t v11 = sub_25E7BC2C0();
    os_log_type_t v12 = sub_25E7BC4A0();
    if (os_log_type_enabled(v11, v12))
    {
      os_log_type_t v13 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)os_log_type_t v13 = 0;
      _os_log_impl(&dword_25E775000, v11, v12, "Activate signal has been recieved, advancing connection state", v13, 2u);
      MEMORY[0x2611E3480](v13, -1, -1);
    }

    sub_25E79FA2C();
  }
  else
  {
    uint64_t v7 = sub_25E7BC2C0();
    os_log_type_t v14 = sub_25E7BC490();
    if (os_log_type_enabled(v7, v14))
    {
      uint64_t v15 = (uint8_t *)swift_slowAlloc();
      uint64_t v16 = swift_slowAlloc();
      v17[0] = v16;
      *(_DWORD *)uint64_t v15 = 136315138;
      v17[3] = sub_25E77CF40(0x4370757465534657, 0xED0000746E65696CLL, v17);
      sub_25E7BC520();
      _os_log_impl(&dword_25E775000, v7, v14, "%s is unexpectedly deallocated. ", v15, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2611E3480](v16, -1, -1);
      MEMORY[0x2611E3480](v15, -1, -1);
    }
  }
}

Swift::Void __swiftcall WFSetupClient.sendObject(_:encrypted:)(Swift::OpaquePointer _, Swift::Bool encrypted)
{
  uint64_t v3 = *(void **)(v2 + OBJC_IVAR___WFSetupClientInternal_sfSession);
  if (v3)
  {
    if (*(unsigned char *)(v2 + OBJC_IVAR___WFSetupClientInternal_clientState + 4) == 1)
    {
      BOOL v4 = encrypted;
      uint64_t v5 = qword_26A7065D8;
      id v6 = v3;
      if (v5 != -1) {
        swift_once();
      }
      uint64_t v7 = sub_25E7BC2E0();
      __swift_project_value_buffer(v7, (uint64_t)qword_26A708A10);
      uint64_t v8 = sub_25E7BC2C0();
      os_log_type_t v9 = sub_25E7BC4A0();
      if (os_log_type_enabled(v8, v9))
      {
        os_log_type_t v10 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)os_log_type_t v10 = 0;
        _os_log_impl(&dword_25E775000, v8, v9, "Sending object to server", v10, 2u);
        MEMORY[0x2611E3480](v10, -1, -1);
      }

      oslog = sub_25E7BC370();
      objc_msgSend(v6, sel_sendWithFlags_object_, v4, oslog);
    }
    else
    {
      uint64_t v14 = qword_26A7065D8;
      oslog = v3;
      if (v14 != -1) {
        swift_once();
      }
      uint64_t v15 = sub_25E7BC2E0();
      __swift_project_value_buffer(v15, (uint64_t)qword_26A708A10);
      uint64_t v16 = sub_25E7BC2C0();
      os_log_type_t v17 = sub_25E7BC490();
      if (os_log_type_enabled(v16, v17))
      {
        uint64_t v18 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v18 = 0;
        _os_log_impl(&dword_25E775000, v16, v17, "Attempting to send an object before the session is activated", v18, 2u);
        MEMORY[0x2611E3480](v18, -1, -1);
      }
    }
  }
  else
  {
    if (qword_26A7065D8 != -1) {
      swift_once();
    }
    uint64_t v11 = sub_25E7BC2E0();
    __swift_project_value_buffer(v11, (uint64_t)qword_26A708A10);
    oslog = sub_25E7BC2C0();
    os_log_type_t v12 = sub_25E7BC490();
    if (os_log_type_enabled(oslog, v12))
    {
      os_log_type_t v13 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)os_log_type_t v13 = 0;
      _os_log_impl(&dword_25E775000, oslog, v12, "Failed to send object to server. SfSession is unexpectedly nil.", v13, 2u);
      MEMORY[0x2611E3480](v13, -1, -1);
    }
  }
}

void sub_25E79FA2C()
{
  uint64_t v1 = sub_25E7BC2E0();
  uint64_t v2 = *(unsigned __int8 **)(v1 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v1, v3);
  uint64_t v106 = (char *)&v103 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4, v6);
  uint64_t v107 = (char *)&v103 - v7;
  uint64_t v8 = sub_25E7BC340();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8, v10);
  os_log_type_t v12 = (uint64_t *)((char *)&v103 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  os_log_type_t v13 = (void **)&v0[OBJC_IVAR___WFSetupClientInternal_dispatchQueue];
  swift_beginAccess();
  uint64_t v14 = *v13;
  *os_log_type_t v12 = v14;
  (*(void (**)(void *, void, uint64_t))(v9 + 104))(v12, *MEMORY[0x263F8F0E0], v8);
  id v15 = v14;
  LOBYTE(v14) = sub_25E7BC360();
  (*(void (**)(void *, uint64_t))(v9 + 8))(v12, v8);
  if (v14)
  {
    if (qword_26A7065D8 == -1) {
      goto LABEL_3;
    }
  }
  else
  {
    __break(1u);
  }
  swift_once();
LABEL_3:
  uint64_t v16 = __swift_project_value_buffer(v1, (uint64_t)qword_26A708A10);
  os_log_type_t v17 = v0;
  uint64_t v18 = sub_25E7BC2C0();
  os_log_type_t v19 = sub_25E7BC4A0();
  if (os_log_type_enabled(v18, v19))
  {
    uint64_t v20 = (uint8_t *)swift_slowAlloc();
    uint64_t v21 = swift_slowAlloc();
    uint64_t v105 = (char *)v2;
    uint64_t v22 = v16;
    uint64_t v23 = v1;
    uint64_t v24 = v21;
    v111[0] = v21;
    *(_DWORD *)uint64_t v20 = 136446210;
    uint64_t v25 = sub_25E79D034();
    uint64_t v108 = sub_25E77CF40(v25, v26, v111);
    sub_25E7BC520();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25E775000, v18, v19, "Advancing connection state. Current state: %{public}s", v20, 0xCu);
    swift_arrayDestroy();
    uint64_t v27 = v24;
    uint64_t v1 = v23;
    uint64_t v16 = v22;
    uint64_t v2 = (unsigned __int8 *)v105;
    MEMORY[0x2611E3480](v27, -1, -1);
    MEMORY[0x2611E3480](v20, -1, -1);
  }
  else
  {
  }
  id v28 = &v17[OBJC_IVAR___WFSetupClientInternal_peerDevice];
  swift_beginAccess();
  if (!*(void *)v28)
  {
    uint64_t v56 = sub_25E7BC2C0();
    os_log_type_t v57 = sub_25E7BC490();
    if (os_log_type_enabled(v56, v57))
    {
      objc_super v58 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)objc_super v58 = 0;
      _os_log_impl(&dword_25E775000, v56, v57, "Peer device has not been defined or has been cleared. Not advancing connection state.", v58, 2u);
      MEMORY[0x2611E3480](v58, -1, -1);
    }

    return;
  }
  uint64_t v29 = *(void *)&v17[OBJC_IVAR___WFSetupClientInternal_sfSession];
  uint64_t v30 = sub_25E7BC2C0();
  os_log_type_t v31 = sub_25E7BC4A0();
  BOOL v32 = os_log_type_enabled(v30, v31);
  if (!v29)
  {
    if (v32)
    {
      uint64_t v59 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v59 = 0;
      _os_log_impl(&dword_25E775000, v30, v31, "Not yet connected, attempting to start SFSession", v59, 2u);
      MEMORY[0x2611E3480](v59, -1, -1);
    }

    sub_25E7A1D84();
    return;
  }
  if (v32)
  {
    uint64_t v33 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v33 = 0;
    _os_log_impl(&dword_25E775000, v30, v31, "Session is present", v33, 2u);
    MEMORY[0x2611E3480](v33, -1, -1);
  }

  uint64_t v34 = sub_25E7BC2C0();
  os_log_type_t v35 = sub_25E7BC4A0();
  if (os_log_type_enabled(v34, v35))
  {
    id v36 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v36 = 0;
    _os_log_impl(&dword_25E775000, v34, v35, "Checking authState", v36, 2u);
    MEMORY[0x2611E3480](v36, -1, -1);
  }

  uint64_t v37 = &v17[OBJC_IVAR___WFSetupClientInternal_clientState];
  if (!v17[OBJC_IVAR___WFSetupClientInternal_clientState])
  {
    os_log_type_t v38 = sub_25E7BC2C0();
    os_log_type_t v39 = sub_25E7BC4A0();
    if (os_log_type_enabled(v38, v39))
    {
      uint64_t v40 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v40 = 0;
      _os_log_impl(&dword_25E775000, v38, v39, "AuthState is .notInitiated, send preAuth", v40, 2u);
      MEMORY[0x2611E3480](v40, -1, -1);
    }

    uint64_t v41 = &v17[OBJC_IVAR___WFSetupClientInternal_setupProgressEventHandler];
    swift_beginAccess();
    unint64_t v43 = *(void (**)(void, void))v41;
    uint64_t v42 = *((void *)v41 + 1);
    sub_25E785E00((uint64_t)v43);
    sub_25E7ADD10(0xAuLL, 0, 0, v43, v42);
    sub_25E785F38((uint64_t)v43);
    *uint64_t v37 = 1;
    sub_25E7A11CC();
  }
  uint64_t v44 = (void (*)(char *, uint64_t, uint64_t))*((void *)v2 + 2);
  uint64_t v45 = v107;
  v44(v107, v16, v1);
  uint64_t v46 = v17;
  uint64_t v47 = sub_25E7BC2C0();
  os_log_type_t v48 = sub_25E7BC4A0();
  BOOL v49 = os_log_type_enabled(v47, v48);
  uint64_t v104 = v44;
  if (v49)
  {
    uint64_t v103 = v1;
    uint64_t v50 = (unsigned __int8 *)v37;
    unint64_t v51 = (uint8_t *)swift_slowAlloc();
    uint64_t v52 = swift_slowAlloc();
    uint64_t v110 = v52;
    *(_DWORD *)unint64_t v51 = 136446210;
    uint64_t v105 = (char *)v50;
    int v53 = *v50;
    if (*v50)
    {
      if (v53 == 1) {
        uint64_t v54 = 0xD000000000000012;
      }
      else {
        uint64_t v54 = 0xD000000000000017;
      }
      if (v53 == 1) {
        unint64_t v55 = 0x800000025E7C0AB0;
      }
      else {
        unint64_t v55 = 0x800000025E7C09B0;
      }
    }
    else
    {
      unint64_t v55 = 0xEC00000064657461;
      uint64_t v54 = 0x6974696E49746F6ELL;
    }
    uint64_t v109 = sub_25E77CF40(v54, v55, &v110);
    sub_25E7BC520();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25E775000, v47, v48, "AuthState is past .notInitiated (%{public}s), checking server response", v51, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2611E3480](v52, -1, -1);
    MEMORY[0x2611E3480](v51, -1, -1);

    char v60 = (void (*)(char *, uint64_t))*((void *)v2 + 1);
    uint64_t v1 = v103;
    v60(v107, v103);
    uint64_t v37 = v105;
  }
  else
  {

    char v60 = (void (*)(char *, uint64_t))*((void *)v2 + 1);
    v60(v45, v1);
  }
  int v61 = *v37;
  uint64_t v62 = sub_25E7BC2C0();
  os_log_type_t v63 = sub_25E7BC4A0();
  BOOL v64 = os_log_type_enabled(v62, v63);
  if (v61 != 2)
  {
    if (!v64) {
      goto LABEL_65;
    }
    uint64_t v87 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v87 = 0;
    os_log_type_t v88 = v63;
    uint64_t v89 = "PreAuth Response not received yet. Waiting for the server to send preAuth response.";
LABEL_64:
    _os_log_impl(&dword_25E775000, v62, v88, v89, v87, 2u);
    MEMORY[0x2611E3480](v87, -1, -1);
    goto LABEL_65;
  }
  if (v64)
  {
    id v65 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v65 = 0;
    _os_log_impl(&dword_25E775000, v62, v63, "AuthState has received server response", v65, 2u);
    MEMORY[0x2611E3480](v65, -1, -1);
  }

  uint64_t v66 = sub_25E7BC2C0();
  os_log_type_t v67 = sub_25E7BC4A0();
  if (os_log_type_enabled(v66, v67))
  {
    id v68 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v68 = 0;
    _os_log_impl(&dword_25E775000, v66, v67, "Checking secure channel status", v68, 2u);
    MEMORY[0x2611E3480](v68, -1, -1);
  }

  int v69 = v37[7];
  uint64_t v62 = sub_25E7BC2C0();
  os_log_type_t v70 = sub_25E7BC4A0();
  BOOL v71 = os_log_type_enabled(v62, v70);
  if (v69 != 1)
  {
    if (!v71) {
      goto LABEL_65;
    }
    uint64_t v87 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v87 = 0;
    os_log_type_t v88 = v70;
    uint64_t v89 = "Secure channel has not yet been established.";
    goto LABEL_64;
  }
  if (v71)
  {
    os_log_type_t v72 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)os_log_type_t v72 = 0;
    _os_log_impl(&dword_25E775000, v62, v70, "Secure channel is established.", v72, 2u);
    MEMORY[0x2611E3480](v72, -1, -1);
  }

  uint64_t v73 = sub_25E7BC2C0();
  os_log_type_t v74 = sub_25E7BC4A0();
  if (os_log_type_enabled(v73, v74))
  {
    id v75 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v75 = 0;
    _os_log_impl(&dword_25E775000, v73, v74, "Checking coreCDPSetupState initiated", v75, 2u);
    MEMORY[0x2611E3480](v75, -1, -1);
  }

  if (v37[1])
  {
    uint64_t v105 = v37;
    char v76 = v106;
    v104(v106, v16, v1);
    uint64_t v77 = v46;
    os_log_type_t v78 = sub_25E7BC2C0();
    os_log_type_t v79 = sub_25E7BC4A0();
    if (os_log_type_enabled(v78, v79))
    {
      uint64_t v107 = v77;
      uint64_t v80 = (uint8_t *)swift_slowAlloc();
      uint64_t v81 = swift_slowAlloc();
      *(_DWORD *)uint64_t v80 = 136315138;
      uint64_t v82 = 8 * v105[1];
      uint64_t v83 = *(void *)&aNotinitiinprog[v82];
      uint64_t v110 = v81;
      uint64_t v103 = v1;
      uint64_t v109 = sub_25E77CF40(v83, *(void *)&aAted[v82], &v110);
      uint64_t v84 = v107;
      sub_25E7BC520();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25E775000, v78, v79, "CoreCDPSetup is %s.", v80, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2611E3480](v81, -1, -1);
      MEMORY[0x2611E3480](v80, -1, -1);

      uint64_t v85 = v106;
      uint64_t v86 = v103;
    }
    else
    {

      uint64_t v85 = v76;
      uint64_t v86 = v1;
    }
    v60(v85, v86);
    int v93 = sub_25E7BC2C0();
    os_log_type_t v94 = sub_25E7BC4A0();
    if (os_log_type_enabled(v93, v94))
    {
      uint64_t v95 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v95 = 0;
      _os_log_impl(&dword_25E775000, v93, v94, "Checking is proximity setup complete", v95, 2u);
      MEMORY[0x2611E3480](v95, -1, -1);
    }

    int v96 = v105[6];
    uint64_t v62 = sub_25E7BC2C0();
    os_log_type_t v97 = sub_25E7BC4A0();
    BOOL v98 = os_log_type_enabled(v62, v97);
    if (v96 == 1)
    {
      if (v98)
      {
        int v99 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)int v99 = 0;
        _os_log_impl(&dword_25E775000, v62, v97, "Proximity setup is completed. ", v99, 2u);
        MEMORY[0x2611E3480](v99, -1, -1);
      }

      uint64_t v100 = sub_25E7BC2C0();
      os_log_type_t v101 = sub_25E7BC4A0();
      if (os_log_type_enabled(v100, v101))
      {
        id v102 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)id v102 = 0;
        _os_log_impl(&dword_25E775000, v100, v101, "Calling successful completion handler", v102, 2u);
        MEMORY[0x2611E3480](v102, -1, -1);
      }

      sub_25E7A372C(0);
      return;
    }
    if (v98)
    {
      uint64_t v87 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v87 = 0;
      os_log_type_t v88 = v97;
      uint64_t v89 = "Proximity setup is not yet completed";
      goto LABEL_64;
    }
LABEL_65:

    return;
  }
  uint64_t v90 = sub_25E7BC2C0();
  os_log_type_t v91 = sub_25E7BC4A0();
  if (os_log_type_enabled(v90, v91))
  {
    uint64_t v92 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v92 = 0;
    _os_log_impl(&dword_25E775000, v90, v91, "CoreCDPSetup is not initiated, setting up", v92, 2u);
    MEMORY[0x2611E3480](v92, -1, -1);
  }

  sub_25E7A4138();
}

void sub_25E7A08C4(unint64_t a1, void (*a2)(void, void, void), uint64_t a3)
{
  if (qword_26A7065D8 != -1) {
    swift_once();
  }
  uint64_t v7 = sub_25E7BC2E0();
  __swift_project_value_buffer(v7, (uint64_t)qword_26A708A10);
  uint64_t v8 = sub_25E7BC2C0();
  os_log_type_t v9 = sub_25E7BC4A0();
  unint64_t v60 = a1;
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = swift_slowAlloc();
    id v57 = a2;
    uint64_t v11 = swift_slowAlloc();
    uint64_t aBlock = v11;
    *(_DWORD *)uint64_t v10 = 136446466;
    uint64_t v67 = sub_25E77CF40(0xD00000000000002ALL, 0x800000025E7C0BA0, &aBlock);
    sub_25E7BC520();
    *(_WORD *)(v10 + 12) = 2082;
    id v12 = WFSetupProgressEventToString_0(a1);
    uint64_t v13 = sub_25E7BC3E0();
    unint64_t v15 = v14;

    uint64_t v67 = sub_25E77CF40(v13, v15, &aBlock);
    sub_25E7BC520();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25E775000, v8, v9, "%{public}s invoked with inEvent: %{public}s", (uint8_t *)v10, 0x16u);
    swift_arrayDestroy();
    uint64_t v16 = v11;
    a2 = (void (*)(void, void, void))v57;
    MEMORY[0x2611E3480](v16, -1, -1);
    MEMORY[0x2611E3480](v10, -1, -1);
  }

  os_log_type_t v17 = *(void **)(v3 + OBJC_IVAR___WFSetupClientInternal_sfSession);
  if (v17)
  {
    if (v60 > 0xF) {
      return;
    }
    if (((1 << v60) & 0xFE1F) != 0)
    {
      id v18 = v17;
      os_log_type_t v19 = sub_25E7BC2C0();
      os_log_type_t v20 = sub_25E7BC490();
      if (os_log_type_enabled(v19, v20))
      {
        id v58 = v18;
        uint64_t v21 = swift_slowAlloc();
        uint64_t v56 = swift_slowAlloc();
        uint64_t aBlock = v56;
        *(_DWORD *)uint64_t v21 = 136446466;
        uint64_t v67 = sub_25E77CF40(0xD00000000000002ALL, 0x800000025E7C0BA0, &aBlock);
        sub_25E7BC520();
        *(_WORD *)(v21 + 12) = 2082;
        id v22 = WFSetupProgressEventToString_0(v60);
        uint64_t v23 = a2;
        uint64_t v24 = sub_25E7BC3E0();
        unint64_t v26 = v25;

        uint64_t v27 = v24;
        a2 = v23;
        uint64_t v67 = sub_25E77CF40(v27, v26, &aBlock);
        sub_25E7BC520();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_25E775000, v19, v20, "%{public}s invoked with unexpected event: %{public}s. Only events related to secure channel should be sent through this method. ", (uint8_t *)v21, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x2611E3480](v56, -1, -1);
        uint64_t v28 = v21;
        id v18 = v58;
        MEMORY[0x2611E3480](v28, -1, -1);
      }

      if (a2)
      {
        sub_25E7A50DC();
        uint64_t v29 = (void *)swift_allocError();
        *uint64_t v30 = 4;
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A706D80);
        uint64_t inited = swift_initStackObject();
        *(_OWORD *)(inited + 16) = xmmword_25E7BDF10;
        uint64_t aBlock = 0;
        unint64_t v62 = 0xE000000000000000;
        uint64_t v32 = MEMORY[0x263F8D310];
        sub_25E7BC580();
        *(void *)(inited + 96) = v32;
        *(void *)(inited + 72) = 0;
        *(void *)(inited + 80) = 0xE000000000000000;
        unint64_t v33 = sub_25E7885A8(inited);
        a2(v29, 0, v33);
        swift_bridgeObjectRelease();

LABEL_16:
        return;
      }
    }
    else
    {
      if (a2)
      {
        uint64_t v38 = swift_allocObject();
        *(void *)(v38 + 16) = a2;
        *(void *)(v38 + 24) = a3;
        os_log_type_t v39 = (uint64_t (*)())sub_25E7A5BDC;
      }
      else
      {
        os_log_type_t v39 = nullsub_1;
        uint64_t v38 = 0;
      }
      uint64_t v40 = swift_allocObject();
      *(void *)(v40 + 16) = v39;
      *(void *)(v40 + 24) = v38;
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A706D80);
      uint64_t v41 = swift_initStackObject();
      *(_OWORD *)(v41 + 16) = xmmword_25E7BDF10;
      uint64_t aBlock = 0xD000000000000010;
      unint64_t v62 = 0x800000025E7BFCC0;
      id v59 = v17;
      sub_25E785E00((uint64_t)a2);
      sub_25E7BC580();
      *(void *)(v41 + 96) = MEMORY[0x263F8D4F8];
      *(unsigned char *)(v41 + 72) = 1;
      sub_25E7885A8(v41);
      uint64_t v42 = sub_25E7BC2C0();
      os_log_type_t v43 = sub_25E7BC4A0();
      if (os_log_type_enabled(v42, v43))
      {
        uint64_t v44 = (uint8_t *)swift_slowAlloc();
        uint64_t v45 = swift_slowAlloc();
        uint64_t aBlock = v45;
        *(_DWORD *)uint64_t v44 = 136446210;
        id v46 = WFSetupProgressEventToString_0(v60);
        uint64_t v47 = sub_25E7BC3E0();
        unint64_t v49 = v48;

        uint64_t v67 = sub_25E77CF40(v47, v49, &aBlock);
        sub_25E7BC520();
        unint64_t v50 = v60;
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_25E775000, v42, v43, "Sending secure pairing event: %{public}s", v44, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x2611E3480](v45, -1, -1);
        MEMORY[0x2611E3480](v44, -1, -1);
      }
      else
      {

        unint64_t v50 = v60;
      }
      unint64_t v51 = (void *)sub_25E7BC3D0();
      uint64_t v52 = (void *)sub_25E7BC370();
      swift_bridgeObjectRelease();
      uint64_t v53 = swift_initStackObject();
      *(_OWORD *)(v53 + 16) = xmmword_25E7BDF10;
      uint64_t aBlock = 0xD000000000000014;
      unint64_t v62 = 0x800000025E7BEF80;
      sub_25E7BC580();
      *(void *)(v53 + 96) = MEMORY[0x263F8D6C8];
      *(void *)(v53 + 72) = v50;
      sub_25E7885A8(v53);
      uint64_t v54 = (void *)sub_25E7BC370();
      swift_bridgeObjectRelease();
      id v65 = sub_25E7A5C68;
      uint64_t v66 = v40;
      uint64_t aBlock = MEMORY[0x263EF8330];
      unint64_t v62 = 1107296256;
      os_log_type_t v63 = sub_25E788D3C;
      BOOL v64 = &block_descriptor_98_0;
      unint64_t v55 = _Block_copy(&aBlock);
      swift_retain();
      swift_release();
      objc_msgSend(v59, sel_sendRequestID_options_request_responseHandler_, v51, v52, v54, v55);

      _Block_release(v55);
      swift_release();
    }
  }
  else
  {
    uint64_t v34 = sub_25E7BC2C0();
    uint64_t v35 = sub_25E7BC490();
    if (os_log_type_enabled(v34, (os_log_type_t)v35))
    {
      id v36 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v36 = 0;
      _os_log_impl(&dword_25E775000, v34, (os_log_type_t)v35, "Failed to send object to server. SfSession is not available. ", v36, 2u);
      MEMORY[0x2611E3480](v36, -1, -1);
    }

    if (a2)
    {
      sub_25E7A50DC();
      uint64_t v29 = (void *)swift_allocError();
      *uint64_t v37 = 2;
      a2(v29, 0, 0);
      goto LABEL_16;
    }
  }
}

void sub_25E7A11CC()
{
  os_log_t v82 = (os_log_t)sub_25E7BC2B0();
  Class isa = v82[-1].isa;
  MEMORY[0x270FA5388](v82, v2);
  uint64_t v4 = (char *)&v77 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = *(void **)(v0 + OBJC_IVAR___WFSetupClientInternal_sfSession);
  if (v5)
  {
    id v81 = v5;
    unint64_t v6 = sub_25E7885A8(MEMORY[0x263F8EE78]);
    *(void *)&long long v85 = 28783;
    *((void *)&v85 + 1) = 0xE200000000000000;
    sub_25E7BC580();
    uint64_t v86 = MEMORY[0x263F8E548];
    LODWORD(v85) = 3;
    sub_25E796898(&v85, v84);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    unint64_t v83 = v6;
    sub_25E796AC4(v84, (uint64_t)v87, isUniquelyReferenced_nonNull_native);
    unint64_t v8 = v83;
    unint64_t v88 = v83;
    swift_bridgeObjectRelease();
    sub_25E798CA4((uint64_t)v87);
    uint64_t v9 = _AXSCopySettingsDataBlobForBuddy();
    if (v9)
    {
      uint64_t v10 = v9;
      *(void *)&long long v85 = 1951627361;
      *((void *)&v85 + 1) = 0xE400000000000000;
      sub_25E7BC580();
      type metadata accessor for CFData(0);
      uint64_t v86 = v11;
      *(void *)&long long v85 = v10;
      sub_25E796898(&v85, v84);
      char v12 = swift_isUniquelyReferenced_nonNull_native();
      unint64_t v83 = v8;
      sub_25E796AC4(v84, (uint64_t)v87, v12);
      unint64_t v88 = v83;
      swift_bridgeObjectRelease();
      sub_25E798CA4((uint64_t)v87);
    }
    else
    {
      if (qword_26A7065D8 != -1) {
        swift_once();
      }
      uint64_t v17 = sub_25E7BC2E0();
      __swift_project_value_buffer(v17, (uint64_t)qword_26A708A10);
      id v18 = sub_25E7BC2C0();
      os_log_type_t v19 = sub_25E7BC490();
      if (os_log_type_enabled(v18, v19))
      {
        os_log_type_t v20 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)os_log_type_t v20 = 0;
        _os_log_impl(&dword_25E775000, v18, v19, "Failed to get the accessibility settings", v20, 2u);
        MEMORY[0x2611E3480](v20, -1, -1);
      }
    }
    unsigned int v21 = SFDeviceClassCodeGet();
    *(void *)&long long v85 = 0x7373616C6364;
    *((void *)&v85 + 1) = 0xE600000000000000;
    sub_25E7BC580();
    uint64_t v86 = MEMORY[0x263F8E778];
    LOBYTE(v85) = v21;
    sub_25E796898(&v85, v84);
    unint64_t v22 = v88;
    char v23 = swift_isUniquelyReferenced_nonNull_native();
    unint64_t v83 = v22;
    sub_25E796AC4(v84, (uint64_t)v87, v23);
    unint64_t v88 = v83;
    swift_bridgeObjectRelease();
    sub_25E798CA4((uint64_t)v87);
    if (qword_26A7065D8 != -1) {
      swift_once();
    }
    uint64_t v24 = sub_25E7BC2E0();
    uint64_t v25 = __swift_project_value_buffer(v24, (uint64_t)qword_26A708A10);
    unint64_t v26 = sub_25E7BC2C0();
    os_log_type_t v27 = sub_25E7BC4A0();
    if (os_log_type_enabled(v26, v27))
    {
      uint64_t v28 = swift_slowAlloc();
      uint64_t v80 = v4;
      uint64_t v29 = (uint8_t *)v28;
      uint64_t v30 = swift_slowAlloc();
      v87[0] = v30;
      *(_DWORD *)uint64_t v29 = 136446210;
      SFDeviceClassCodeToString(v21);
      uint64_t v31 = sub_25E7BC420();
      *(void *)&long long v85 = sub_25E77CF40(v31, v32, v87);
      sub_25E7BC520();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25E775000, v26, v27, "Setting device class in pre-Auth data: %{public}s", v29, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2611E3480](v30, -1, -1);
      uint64_t v4 = v80;
      MEMORY[0x2611E3480](v29, -1, -1);
    }

    unint64_t v33 = self;
    id v34 = objc_msgSend(v33, sel_preferredLanguages);
    uint64_t v35 = MEMORY[0x263F8D310];
    id v36 = (void *)sub_25E7BC450();

    if (v36[2])
    {
      uint64_t v37 = v36[4];
      unint64_t v38 = v36[5];
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRelease();
      os_log_type_t v39 = sub_25E7BC2C0();
      os_log_type_t v40 = sub_25E7BC4A0();
      if (os_log_type_enabled(v39, v40))
      {
        os_log_type_t v78 = v33;
        uint64_t v41 = swift_slowAlloc();
        uint64_t v79 = v25;
        uint64_t v42 = (uint8_t *)v41;
        uint64_t v43 = swift_slowAlloc();
        uint64_t v80 = (char *)v37;
        uint64_t v44 = v43;
        v87[0] = v43;
        *(_DWORD *)uint64_t v42 = 136446210;
        swift_bridgeObjectRetain();
        *(void *)&long long v85 = sub_25E77CF40((uint64_t)v80, v38, v87);
        sub_25E7BC520();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_25E775000, v39, v40, "Setting preferred langauge in pre-Auth data: %{public}s", v42, 0xCu);
        unint64_t v33 = v78;
        swift_arrayDestroy();
        uint64_t v45 = v44;
        uint64_t v37 = (uint64_t)v80;
        MEMORY[0x2611E3480](v45, -1, -1);
        MEMORY[0x2611E3480](v42, -1, -1);
      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      *(void *)&long long v85 = 1735287148;
      *((void *)&v85 + 1) = 0xE400000000000000;
      sub_25E7BC580();
      uint64_t v86 = v35;
      *(void *)&long long v85 = v37;
      *((void *)&v85 + 1) = v38;
      sub_25E796898(&v85, v84);
      unint64_t v49 = v88;
      char v50 = swift_isUniquelyReferenced_nonNull_native();
      unint64_t v83 = v49;
      sub_25E796AC4(v84, (uint64_t)v87, v50);
      unint64_t v88 = v83;
      swift_bridgeObjectRelease();
      sub_25E798CA4((uint64_t)v87);
    }
    else
    {
      swift_bridgeObjectRelease();
      id v46 = sub_25E7BC2C0();
      os_log_type_t v47 = sub_25E7BC4A0();
      if (os_log_type_enabled(v46, v47))
      {
        unint64_t v48 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)unint64_t v48 = 0;
        _os_log_impl(&dword_25E775000, v46, v47, "No preferred language", v48, 2u);
        MEMORY[0x2611E3480](v48, -1, -1);
      }
    }
    id v51 = objc_msgSend(v33, sel_currentLocale);
    sub_25E7BC2A0();

    uint64_t v52 = sub_25E7BC290();
    uint64_t v54 = v53;
    (*((void (**)(char *, os_log_t))isa + 1))(v4, v82);
    *(void *)&long long v85 = 0x656C61636F6CLL;
    *((void *)&v85 + 1) = 0xE600000000000000;
    sub_25E7BC580();
    uint64_t v86 = v35;
    *(void *)&long long v85 = v52;
    *((void *)&v85 + 1) = v54;
    sub_25E796898(&v85, v84);
    unint64_t v55 = v88;
    char v56 = swift_isUniquelyReferenced_nonNull_native();
    unint64_t v83 = v55;
    sub_25E796AC4(v84, (uint64_t)v87, v56);
    unint64_t v57 = v83;
    unint64_t v88 = v83;
    swift_bridgeObjectRelease();
    sub_25E798CA4((uint64_t)v87);
    id v58 = (id)MobileGestalt_get_current_device();
    if (v58)
    {
      id v59 = v58;
      id v60 = (id)MobileGestalt_copy_productType_obj();

      if (v60)
      {
        uint64_t v61 = sub_25E7BC3E0();
        uint64_t v63 = v62;

        *(void *)&long long v85 = 0x6C65646F6DLL;
        *((void *)&v85 + 1) = 0xE500000000000000;
        sub_25E7BC580();
        uint64_t v86 = v35;
        *(void *)&long long v85 = v61;
        *((void *)&v85 + 1) = v63;
        sub_25E796898(&v85, v84);
        char v64 = swift_isUniquelyReferenced_nonNull_native();
        unint64_t v83 = v57;
        sub_25E796AC4(v84, (uint64_t)v87, v64);
        unint64_t v88 = v83;
        swift_bridgeObjectRelease();
        sub_25E798CA4((uint64_t)v87);
      }
      else
      {
        id v65 = sub_25E7BC2C0();
        os_log_type_t v66 = sub_25E7BC490();
        if (os_log_type_enabled(v65, v66))
        {
          uint64_t v67 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v67 = 0;
          _os_log_impl(&dword_25E775000, v65, v66, "Failed to get model for device", v67, 2u);
          MEMORY[0x2611E3480](v67, -1, -1);
        }
      }
      id v68 = sub_25E7BC2C0();
      os_log_type_t v69 = sub_25E7BC4A0();
      if (os_log_type_enabled(v68, v69))
      {
        os_log_type_t v70 = (uint8_t *)swift_slowAlloc();
        uint64_t v71 = swift_slowAlloc();
        v87[0] = v71;
        *(_DWORD *)os_log_type_t v70 = 136446210;
        swift_beginAccess();
        swift_bridgeObjectRetain();
        uint64_t v72 = sub_25E7BC3A0();
        unint64_t v74 = v73;
        swift_bridgeObjectRelease();
        *(void *)&v84[0] = sub_25E77CF40(v72, v74, v87);
        sub_25E7BC520();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_25E775000, v68, v69, "Send PreAuth info: %{public}s", v70, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x2611E3480](v71, -1, -1);
        MEMORY[0x2611E3480](v70, -1, -1);
      }

      swift_beginAccess();
      swift_bridgeObjectRetain();
      id v75 = (void *)sub_25E7BC370();
      swift_bridgeObjectRelease();
      id v76 = v81;
      objc_msgSend(v81, sel_sendWithFlags_object_, 0, v75);

      swift_bridgeObjectRelease();
    }
    else
    {
      __break(1u);
    }
  }
  else
  {
    if (qword_26A7065D8 != -1) {
      swift_once();
    }
    uint64_t v13 = sub_25E7BC2E0();
    __swift_project_value_buffer(v13, (uint64_t)qword_26A708A10);
    os_log_t v82 = (os_log_t)sub_25E7BC2C0();
    os_log_type_t v14 = sub_25E7BC4A0();
    if (os_log_type_enabled(v82, v14))
    {
      unint64_t v15 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v15 = 0;
      _os_log_impl(&dword_25E775000, v82, v14, "Unexpectedly found sfSession to be nil", v15, 2u);
      MEMORY[0x2611E3480](v15, -1, -1);
    }
    os_log_t v16 = v82;
  }
}

void sub_25E7A1D84()
{
  uint64_t v1 = (id *)(v0 + OBJC_IVAR___WFSetupClientInternal_peerDevice);
  swift_beginAccess();
  if (*v1)
  {
    uint64_t v2 = OBJC_IVAR___WFSetupClientInternal_sfSession;
    uint64_t v3 = *(void **)(v0 + OBJC_IVAR___WFSetupClientInternal_sfSession);
    id v4 = *v1;
    objc_msgSend(v3, sel_invalidate);
    id v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6C2B8]), sel_init);
    unint64_t v6 = (void *)(v0 + OBJC_IVAR___WFSetupClientInternal_dispatchQueue);
    swift_beginAccess();
    objc_msgSend(v5, sel_setDispatchQueue_, *v6);
    objc_msgSend(v5, sel_setPeerDevice_, v4);
    objc_msgSend(v5, sel_setServiceIdentifier_, *MEMORY[0x263F6C378]);
    objc_msgSend(v5, sel_setSessionFlags_, 1);
    uint64_t v7 = *(void **)(v0 + v2);
    *(void *)(v0 + v2) = v5;
    id v8 = v5;

    uint64_t v9 = swift_allocObject();
    swift_unknownObjectWeakInit();
    uint64_t v31 = sub_25E7A5654;
    uint64_t v32 = v9;
    uint64_t v27 = MEMORY[0x263EF8330];
    uint64_t v28 = 1107296256;
    uint64_t v29 = sub_25E79B70C;
    uint64_t v30 = &block_descriptor_65;
    uint64_t v10 = _Block_copy(&v27);
    swift_release();
    objc_msgSend(v8, sel_setErrorHandler_, v10);
    _Block_release(v10);
    uint64_t v31 = sub_25E7A2698;
    uint64_t v32 = 0;
    uint64_t v27 = MEMORY[0x263EF8330];
    uint64_t v28 = 1107296256;
    uint64_t v29 = sub_25E787340;
    uint64_t v30 = &block_descriptor_68;
    uint64_t v11 = _Block_copy(&v27);
    objc_msgSend(v8, sel_setInvalidationHandler_, v11);
    _Block_release(v11);
    uint64_t v12 = swift_allocObject();
    swift_unknownObjectWeakInit();
    uint64_t v31 = sub_25E7A565C;
    uint64_t v32 = v12;
    uint64_t v27 = MEMORY[0x263EF8330];
    uint64_t v28 = 1107296256;
    uint64_t v29 = sub_25E787340;
    uint64_t v30 = &block_descriptor_72;
    uint64_t v13 = _Block_copy(&v27);
    swift_release();
    objc_msgSend(v8, sel_setInterruptionHandler_, v13);
    _Block_release(v13);
    uint64_t v14 = swift_allocObject();
    swift_unknownObjectWeakInit();
    uint64_t v31 = sub_25E7A5664;
    uint64_t v32 = v14;
    uint64_t v27 = MEMORY[0x263EF8330];
    uint64_t v28 = 1107296256;
    uint64_t v29 = sub_25E79CE34;
    uint64_t v30 = &block_descriptor_76;
    unint64_t v15 = _Block_copy(&v27);
    swift_release();
    objc_msgSend(v8, sel_setShowPINHandlerEx_, v15);
    _Block_release(v15);
    uint64_t v16 = swift_allocObject();
    swift_unknownObjectWeakInit();
    uint64_t v31 = sub_25E7A566C;
    uint64_t v32 = v16;
    uint64_t v27 = MEMORY[0x263EF8330];
    uint64_t v28 = 1107296256;
    uint64_t v29 = sub_25E7A2A34;
    uint64_t v30 = &block_descriptor_80;
    uint64_t v17 = _Block_copy(&v27);
    swift_release();
    objc_msgSend(v8, sel_setReceivedObjectHandler_, v17);
    _Block_release(v17);
    uint64_t v18 = swift_allocObject();
    swift_unknownObjectWeakInit();
    uint64_t v31 = sub_25E7A5674;
    uint64_t v32 = v18;
    uint64_t v27 = MEMORY[0x263EF8330];
    uint64_t v28 = 1107296256;
    uint64_t v29 = sub_25E79B70C;
    uint64_t v30 = &block_descriptor_84;
    os_log_type_t v19 = _Block_copy(&v27);
    swift_release();
    objc_msgSend(v8, sel_setPairSetupCompletionHandler_, v19);
    _Block_release(v19);
    uint64_t v20 = swift_allocObject();
    swift_unknownObjectWeakInit();
    uint64_t v21 = swift_allocObject();
    *(void *)(v21 + 16) = v20;
    *(void *)(v21 + 24) = v8;
    uint64_t v31 = sub_25E7A56BC;
    uint64_t v32 = v21;
    uint64_t v27 = MEMORY[0x263EF8330];
    uint64_t v28 = 1107296256;
    uint64_t v29 = sub_25E79B70C;
    uint64_t v30 = &block_descriptor_91;
    unint64_t v22 = _Block_copy(&v27);
    char v23 = v8;
    swift_release();
    [v23 activateWithCompletion:v22];
    _Block_release(v22);
  }
  else
  {
    if (qword_26A7065D8 != -1) {
      swift_once();
    }
    uint64_t v24 = sub_25E7BC2E0();
    __swift_project_value_buffer(v24, (uint64_t)qword_26A708A10);
    char v23 = sub_25E7BC2C0();
    os_log_type_t v25 = sub_25E7BC490();
    if (os_log_type_enabled(v23, v25))
    {
      unint64_t v26 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v26 = 0;
      _os_log_impl(&dword_25E775000, v23, v25, "Attempted to start SFSession, but peer device is nil", v26, 2u);
      MEMORY[0x2611E3480](v26, -1, -1);
    }
  }
}

void sub_25E7A23B4(void *a1, uint64_t a2)
{
  uint64_t v4 = sub_25E7BC2E0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4, v6);
  id v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = a2 + 16;
  if (qword_26A7065D8 != -1) {
    swift_once();
  }
  uint64_t v10 = __swift_project_value_buffer(v4, (uint64_t)qword_26A708A10);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v8, v10, v4);
  id v11 = a1;
  id v12 = a1;
  uint64_t v13 = sub_25E7BC2C0();
  os_log_type_t v14 = sub_25E7BC490();
  if (os_log_type_enabled(v13, v14))
  {
    unint64_t v15 = (uint8_t *)swift_slowAlloc();
    uint64_t v16 = swift_slowAlloc();
    v25[0] = v16;
    *(_DWORD *)unint64_t v15 = 136446210;
    uint64_t v23 = a2 + 16;
    if (a1)
    {
      swift_getErrorValue();
      uint64_t v17 = sub_25E7BC720();
      unint64_t v19 = v18;
    }
    else
    {
      unint64_t v19 = 0xE300000000000000;
      uint64_t v17 = 7104878;
    }
    uint64_t v24 = sub_25E77CF40(v17, v19, v25);
    sub_25E7BC520();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_25E775000, v13, v14, "SFSession error: %{public}s", v15, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2611E3480](v16, -1, -1);
    MEMORY[0x2611E3480](v15, -1, -1);

    (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
    uint64_t v9 = v23;
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  }
  swift_beginAccess();
  uint64_t v20 = MEMORY[0x2611E34D0](v9);
  if (v20)
  {
    uint64_t v21 = (void *)v20;
    sub_25E7A372C(a1);
  }
}

void sub_25E7A2698()
{
  if (qword_26A7065D8 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_25E7BC2E0();
  __swift_project_value_buffer(v0, (uint64_t)qword_26A708A10);
  oslog = sub_25E7BC2C0();
  os_log_type_t v1 = sub_25E7BC4A0();
  if (os_log_type_enabled(oslog, v1))
  {
    uint64_t v2 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v2 = 0;
    _os_log_impl(&dword_25E775000, oslog, v1, "SFSession invalidated!", v2, 2u);
    MEMORY[0x2611E3480](v2, -1, -1);
  }
}

void sub_25E7A2780(uint64_t a1)
{
  uint64_t v1 = a1 + 16;
  if (qword_26A7065D8 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_25E7BC2E0();
  __swift_project_value_buffer(v2, (uint64_t)qword_26A708A10);
  uint64_t v3 = sub_25E7BC2C0();
  os_log_type_t v4 = sub_25E7BC4A0();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_25E775000, v3, v4, "SFSession interrupted", v5, 2u);
    MEMORY[0x2611E3480](v5, -1, -1);
  }

  swift_beginAccess();
  uint64_t v6 = MEMORY[0x2611E34D0](v1);
  if (v6)
  {
    uint64_t v7 = v6;
    id v8 = (void (**)(uint64_t))(v6 + OBJC_IVAR___WFSetupClientInternal_interruptionHandler);
    swift_beginAccess();
    uint64_t v9 = *v8;
    if (*v8)
    {
      uint64_t v10 = swift_retain();
      v9(v10);

      sub_25E785F38((uint64_t)v9);
      return;
    }
  }
  else
  {
    uint64_t v7 = sub_25E7BC2C0();
    os_log_type_t v11 = sub_25E7BC490();
    if (os_log_type_enabled(v7, v11))
    {
      id v12 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v12 = 0;
      _os_log_impl(&dword_25E775000, v7, v11, "WFSetupClient is unexpectedly false", v12, 2u);
      MEMORY[0x2611E3480](v12, -1, -1);
    }
  }
}

void sub_25E7A294C(unsigned int a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v7 = a4 + 16;
  swift_beginAccess();
  uint64_t v8 = MEMORY[0x2611E34D0](v7);
  if (v8)
  {
    uint64_t v9 = (void *)v8;
    sub_25E7AA9FC(a1, a2, a3);
  }
}

void sub_25E7A29C4(int a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = a3 + 16;
  swift_beginAccess();
  uint64_t v6 = MEMORY[0x2611E34D0](v5);
  if (v6)
  {
    uint64_t v7 = (void *)v6;
    sub_25E7AAC70(a2, a1);
  }
}

uint64_t sub_25E7A2A34(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void (**)(uint64_t, uint64_t))(a1 + 32);
  uint64_t v4 = sub_25E7BC390();
  swift_retain();
  v3(a2, v4);
  swift_release();
  return swift_bridgeObjectRelease();
}

void sub_25E7A2AC0(void *a1, uint64_t a2)
{
  uint64_t v3 = a2 + 16;
  swift_beginAccess();
  uint64_t v4 = MEMORY[0x2611E34D0](v3);
  if (v4)
  {
    uint64_t v5 = (void *)v4;
    sub_25E7AB5D8(a1);
  }
}

void sub_25E7A2B1C(void *a1, uint64_t a2, void *a3)
{
  uint64_t v3 = a2 + 16;
  if (a1)
  {
    if (qword_26A7065D8 != -1) {
      swift_once();
    }
    uint64_t v5 = sub_25E7BC2E0();
    __swift_project_value_buffer(v5, (uint64_t)qword_26A708A10);
    id v6 = a1;
    id v7 = a1;
    uint64_t v8 = sub_25E7BC2C0();
    os_log_type_t v9 = sub_25E7BC4A0();
    if (os_log_type_enabled(v8, v9))
    {
      uint64_t v10 = (uint8_t *)swift_slowAlloc();
      uint64_t v11 = swift_slowAlloc();
      v34[0] = v11;
      *(_DWORD *)uint64_t v10 = 136446210;
      swift_getErrorValue();
      uint64_t v12 = sub_25E7BC720();
      v33[0] = sub_25E77CF40(v12, v13, v34);
      sub_25E7BC520();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_25E775000, v8, v9, "SFSession activate failed with error: %{public}s", v10, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2611E3480](v11, -1, -1);
      MEMORY[0x2611E3480](v10, -1, -1);
    }
    else
    {
    }
    swift_beginAccess();
    uint64_t v25 = MEMORY[0x2611E34D0](v3);
    if (v25)
    {
      unint64_t v26 = (void *)v25;
      sub_25E7A372C(a1);
LABEL_20:
    }
  }
  else
  {
    swift_beginAccess();
    unint64_t v15 = (unsigned char *)MEMORY[0x2611E34D0](v3);
    if (v15)
    {
      v15[OBJC_IVAR___WFSetupClientInternal_clientState + 4] = 1;
    }
    if (qword_26A7065D8 != -1) {
      swift_once();
    }
    uint64_t v16 = sub_25E7BC2E0();
    __swift_project_value_buffer(v16, (uint64_t)qword_26A708A10);
    id v17 = a3;
    unint64_t v18 = sub_25E7BC2C0();
    os_log_type_t v19 = sub_25E7BC4A0();
    if (os_log_type_enabled(v18, v19))
    {
      uint64_t v20 = (uint8_t *)swift_slowAlloc();
      uint64_t v21 = swift_slowAlloc();
      v33[0] = v21;
      *(_DWORD *)uint64_t v20 = 136446210;
      id v22 = objc_msgSend(v17, sel_messageSessionTemplate);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A706A48);
      uint64_t v23 = sub_25E7BC3F0();
      sub_25E77CF40(v23, v24, v33);
      sub_25E7BC520();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25E775000, v18, v19, "Setting message session template to %{public}s", v20, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2611E3480](v21, -1, -1);
      MEMORY[0x2611E3480](v20, -1, -1);
    }
    else
    {
    }
    swift_beginAccess();
    uint64_t v27 = MEMORY[0x2611E34D0](v3);
    if (v27)
    {
      uint64_t v28 = (char *)v27;
      id v29 = objc_msgSend(v17, sel_messageSessionTemplate);
      uint64_t v30 = (void **)&v28[OBJC_IVAR___WFSetupClientInternal_messageSessionTemplate];
      swift_beginAccess();
      uint64_t v31 = *v30;
      *uint64_t v30 = v29;
    }
    swift_beginAccess();
    uint64_t v32 = MEMORY[0x2611E34D0](v3);
    if (v32)
    {
      unint64_t v26 = (void *)v32;
      sub_25E7A2F88();
      goto LABEL_20;
    }
  }
}

void sub_25E7A2F88()
{
  if (qword_26A7065D8 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_25E7BC2E0();
  __swift_project_value_buffer(v1, (uint64_t)qword_26A708A10);
  uint64_t v2 = sub_25E7BC2C0();
  os_log_type_t v3 = sub_25E7BC4A0();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_25E775000, v2, v3, "SFSession activated", v4, 2u);
    MEMORY[0x2611E3480](v4, -1, -1);
  }

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A706D80);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_25E7BDF30;
  sub_25E7BC580();
  uint64_t v6 = MEMORY[0x263F8D4F8];
  *(void *)(inited + 96) = MEMORY[0x263F8D4F8];
  *(unsigned char *)(inited + 72) = 1;
  uint64_t aBlock = 0x746365726964;
  unint64_t v32 = 0xE600000000000000;
  sub_25E7BC580();
  *(void *)(inited + 168) = v6;
  *(unsigned char *)(inited + 144) = 1;
  sub_25E7885A8(inited);
  id v7 = *(void **)(v0 + OBJC_IVAR___WFSetupClientInternal_sfSession);
  if (v7)
  {
    uint64_t v8 = v7;
    os_log_type_t v9 = (void *)sub_25E7BC3D0();
    uint64_t v10 = (void *)sub_25E7BC370();
    uint64_t v11 = swift_allocObject();
    swift_unknownObjectWeakInit();
    uint64_t v35 = sub_25E7A5594;
    uint64_t v36 = v11;
    uint64_t aBlock = MEMORY[0x263EF8330];
    unint64_t v32 = 1107296256;
    unint64_t v33 = sub_25E79BAC8;
    id v34 = &block_descriptor_46;
    uint64_t v12 = _Block_copy(&aBlock);
    swift_release();
    [v8 registerRequestID:v9 options:v10 handler:v12];
    _Block_release(v12);

    unint64_t v13 = (void *)sub_25E7BC3D0();
    os_log_type_t v14 = (void *)sub_25E7BC370();
    uint64_t v15 = swift_allocObject();
    swift_unknownObjectWeakInit();
    uint64_t v35 = sub_25E7A55C4;
    uint64_t v36 = v15;
    uint64_t aBlock = MEMORY[0x263EF8330];
    unint64_t v32 = 1107296256;
    unint64_t v33 = sub_25E79BAC8;
    id v34 = &block_descriptor_50;
    uint64_t v16 = _Block_copy(&aBlock);
    swift_release();
    [v8 registerRequestID:v13 options:v14 handler:v16];
    _Block_release(v16);

    id v17 = (void *)sub_25E7BC3D0();
    unint64_t v18 = (void *)sub_25E7BC370();
    uint64_t v19 = swift_allocObject();
    swift_unknownObjectWeakInit();
    uint64_t v35 = sub_25E7A55F4;
    uint64_t v36 = v19;
    uint64_t aBlock = MEMORY[0x263EF8330];
    unint64_t v32 = 1107296256;
    unint64_t v33 = sub_25E79BAC8;
    id v34 = &block_descriptor_54;
    uint64_t v20 = _Block_copy(&aBlock);
    swift_release();
    [v8 registerRequestID:v17 options:v18 handler:v20];
    _Block_release(v20);

    uint64_t v21 = (void *)sub_25E7BC3D0();
    id v22 = (void *)sub_25E7BC370();
    swift_bridgeObjectRelease();
    uint64_t v23 = swift_allocObject();
    swift_unknownObjectWeakInit();
    uint64_t v35 = sub_25E7A5624;
    uint64_t v36 = v23;
    uint64_t aBlock = MEMORY[0x263EF8330];
    unint64_t v32 = 1107296256;
    unint64_t v33 = sub_25E79BAC8;
    id v34 = &block_descriptor_58;
    unint64_t v24 = _Block_copy(&aBlock);
    swift_release();
    [v8 registerRequestID:v21 options:v22 handler:v24];
    _Block_release(v24);

    uint64_t v25 = sub_25E7BC2C0();
    os_log_type_t v26 = sub_25E7BC4A0();
    if (os_log_type_enabled(v25, v26))
    {
      uint64_t v27 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v27 = 0;
      _os_log_impl(&dword_25E775000, v25, v26, "Completed SFSessionActivated, attempting to advance connection state", v27, 2u);
      MEMORY[0x2611E3480](v27, -1, -1);
    }

    sub_25E79FA2C(v28);
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v8 = sub_25E7BC2C0();
    os_log_type_t v29 = sub_25E7BC490();
    if (os_log_type_enabled(v8, v29))
    {
      uint64_t v30 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v30 = 0;
      _os_log_impl(&dword_25E775000, v8, v29, "Unexpectedly found sfSession to be nil", v30, 2u);
      MEMORY[0x2611E3480](v30, -1, -1);
    }
  }
}

void sub_25E7A361C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void (*a6)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v10 = a5 + 16;
  swift_beginAccess();
  uint64_t v11 = MEMORY[0x2611E34D0](v10);
  if (v11)
  {
    uint64_t v12 = (void *)v11;
    a6(a2, a3, a4);
  }
}

void sub_25E7A36A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void (*a6)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v10 = a5 + 16;
  swift_beginAccess();
  uint64_t v11 = MEMORY[0x2611E34D0](v10);
  if (v11)
  {
    uint64_t v12 = (void *)v11;
    a6(a2, a3, a4);
  }
}

uint64_t sub_25E7A372C(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A706998);
  uint64_t v6 = MEMORY[0x270FA5388](v4 - 8, v5);
  uint64_t v8 = (char *)&v85 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = MEMORY[0x270FA5388](v6, v9);
  uint64_t v12 = (char *)&v85 - v11;
  uint64_t v14 = MEMORY[0x270FA5388](v10, v13);
  uint64_t v86 = (char *)&v85 - v15;
  MEMORY[0x270FA5388](v14, v16);
  uint64_t v87 = (uint64_t)&v85 - v17;
  uint64_t v18 = sub_25E7BC340();
  uint64_t v19 = *(void *)(v18 - 8);
  MEMORY[0x270FA5388](v18, v20);
  id v22 = (void **)((char *)&v85 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v23 = (void **)(v2 + OBJC_IVAR___WFSetupClientInternal_dispatchQueue);
  swift_beginAccess();
  unint64_t v24 = *v23;
  *id v22 = *v23;
  (*(void (**)(void **, void, uint64_t))(v19 + 104))(v22, *MEMORY[0x263F8F0E0], v18);
  id v25 = v24;
  uint64_t v26 = sub_25E7BC360();
  (*(void (**)(void **, uint64_t))(v19 + 8))(v22, v18);
  if (v26)
  {
    uint64_t v26 = 0xD000000000000044;
    if (a1)
    {
      id v27 = a1;
      if (qword_26A7065D8 == -1) {
        goto LABEL_4;
      }
      goto LABEL_31;
    }
    if (qword_26A7065D8 != -1) {
      swift_once();
    }
    uint64_t v38 = sub_25E7BC2E0();
    __swift_project_value_buffer(v38, (uint64_t)qword_26A708A10);
    os_log_type_t v39 = sub_25E7BC2C0();
    os_log_type_t v40 = sub_25E7BC4A0();
    if (os_log_type_enabled(v39, v40))
    {
      uint64_t v41 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v41 = 0;
      _os_log_impl(&dword_25E775000, v39, v40, "Completed", v41, 2u);
      MEMORY[0x2611E3480](v41, -1, -1);
    }

    uint64_t v42 = v2 + OBJC_IVAR___WFSetupClientInternal_setupProgressEventHandler;
    swift_beginAccess();
    uint64_t v44 = *(void (**)(void, void))v42;
    uint64_t v43 = *(void *)(v42 + 8);
    sub_25E785E00((uint64_t)v44);
    sub_25E7ADD10(1uLL, 0, 0, v44, v43);
    sub_25E785F38((uint64_t)v44);
    uint64_t v45 = *(void **)(v2 + OBJC_IVAR___WFSetupClientInternal_sfSession);
    if (v45)
    {
      id v46 = objc_msgSend(v45, sel_identifier);
      if (v46)
      {
        os_log_type_t v47 = v46;
        sub_25E7BC270();

        uint64_t v48 = sub_25E7BC280();
        (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v48 - 8) + 56))(v8, 0, 1, v48);
      }
      else
      {
        uint64_t v48 = sub_25E7BC280();
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v48 - 8) + 56))(v8, 1, 1, v48);
      }
      sub_25E7A53CC((uint64_t)v8, (uint64_t)v12);
      sub_25E7BC280();
      uint64_t v77 = *(void *)(v48 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v77 + 48))(v12, 1, v48) != 1)
      {
        uint64_t v78 = sub_25E7BC240();
        unint64_t v79 = v80;
        (*(void (**)(char *, uint64_t))(v77 + 8))(v12, v48);
        goto LABEL_28;
      }
      sub_25E7A5434((uint64_t)v12);
    }
    uint64_t v78 = 0;
    unint64_t v79 = 0xE000000000000000;
LABEL_28:
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A706A58);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_25E7BDF10;
    *(void *)(inited + 32) = 0x646F43726F727265;
    *(void *)(inited + 40) = 0xE900000000000065;
    *(void *)(inited + 48) = 48;
    *(void *)(inited + 56) = 0xE100000000000000;
    unint64_t v82 = sub_25E788938(inited);
    uint64_t v92 = &type metadata for DisconnectedProximitySetupClientAnalyticsEvent;
    unint64_t v93 = sub_25E7A5494();
    unint64_t v83 = (void *)swift_allocObject();
    v91[0] = (uint64_t)v83;
    v83[2] = 0xD000000000000044;
    v83[3] = 0x800000025E7C0AF0;
    v83[4] = v78;
    v83[5] = v79;
    v83[6] = v82;
    sub_25E7AA5F8(v91);
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v91);
  }
  __break(1u);
LABEL_31:
  swift_once();
LABEL_4:
  uint64_t v28 = sub_25E7BC2E0();
  __swift_project_value_buffer(v28, (uint64_t)qword_26A708A10);
  id v29 = a1;
  id v30 = a1;
  uint64_t v31 = sub_25E7BC2C0();
  os_log_type_t v32 = sub_25E7BC4A0();
  if (os_log_type_enabled(v31, v32))
  {
    unint64_t v33 = (uint8_t *)swift_slowAlloc();
    uint64_t v34 = swift_slowAlloc();
    v91[0] = v34;
    *(_DWORD *)unint64_t v33 = 136446210;
    swift_getErrorValue();
    uint64_t v35 = sub_25E7BC720();
    uint64_t v94 = sub_25E77CF40(v35, v36, v91);
    sub_25E7BC520();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_25E775000, v31, v32, "Failed: %{public}s", v33, 0xCu);
    swift_arrayDestroy();
    uint64_t v37 = v34;
    uint64_t v26 = 0xD000000000000044;
    MEMORY[0x2611E3480](v37, -1, -1);
    MEMORY[0x2611E3480](v33, -1, -1);
  }
  else
  {
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A706A30);
  uint64_t v49 = swift_allocObject();
  long long v85 = xmmword_25E7BDF10;
  *(_OWORD *)(v49 + 16) = xmmword_25E7BDF10;
  *(void *)(v49 + 56) = MEMORY[0x263F8D310];
  *(void *)(v49 + 32) = 28517;
  *(void *)(v49 + 40) = 0xE200000000000000;
  swift_getErrorValue();
  uint64_t v50 = v89;
  uint64_t v51 = v90;
  *(void *)(v49 + 88) = v90;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)(v49 + 64));
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v51 - 8) + 16))(boxed_opaque_existential_0, v50, v51);
  sub_25E78314C(0, (unint64_t *)&qword_26A706DF0);
  uint64_t v53 = (void *)sub_25E7BC480();
  uint64_t v54 = v2 + OBJC_IVAR___WFSetupClientInternal_setupProgressEventHandler;
  swift_beginAccess();
  char v56 = *(void (**)(void, void))v54;
  uint64_t v55 = *(void *)(v54 + 8);
  sub_25E785E00((uint64_t)v56);
  sub_25E7ADD10(1uLL, v53, 0, v56, v55);
  sub_25E785F38((uint64_t)v56);

  unint64_t v57 = *(void **)(v2 + OBJC_IVAR___WFSetupClientInternal_sfSession);
  if (v57)
  {
    id v58 = objc_msgSend(v57, sel_identifier);
    if (v58)
    {
      id v59 = v58;
      uint64_t v60 = (uint64_t)v86;
      sub_25E7BC270();

      uint64_t v61 = sub_25E7BC280();
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v61 - 8) + 56))(v60, 0, 1, v61);
    }
    else
    {
      uint64_t v61 = sub_25E7BC280();
      uint64_t v60 = (uint64_t)v86;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v61 - 8) + 56))(v86, 1, 1, v61);
    }
    uint64_t v62 = v87;
    sub_25E7A53CC(v60, v87);
    sub_25E7BC280();
    uint64_t v63 = *(void *)(v61 - 8);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v63 + 48))(v62, 1, v61) != 1)
    {
      uint64_t v66 = sub_25E7BC240();
      uint64_t v67 = v62;
      uint64_t v64 = v66;
      unint64_t v65 = v68;
      (*(void (**)(uint64_t, uint64_t))(v63 + 8))(v67, v61);
      goto LABEL_22;
    }
    sub_25E7A5434(v62);
  }
  uint64_t v64 = 0;
  unint64_t v65 = 0xE000000000000000;
LABEL_22:
  os_log_type_t v69 = (void *)sub_25E7BC1D0();
  id v70 = objc_msgSend(v69, sel_code);

  id v88 = v70;
  uint64_t v71 = sub_25E7BC6B0();
  uint64_t v73 = v72;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A706A58);
  uint64_t v74 = swift_initStackObject();
  *(_OWORD *)(v74 + 16) = v85;
  *(void *)(v74 + 32) = 0x646F43726F727265;
  *(void *)(v74 + 40) = 0xE900000000000065;
  *(void *)(v74 + 48) = v71;
  *(void *)(v74 + 56) = v73;
  unint64_t v75 = sub_25E788938(v74);
  uint64_t v92 = &type metadata for DisconnectedProximitySetupClientAnalyticsEvent;
  unint64_t v93 = sub_25E7A5494();
  id v76 = (void *)swift_allocObject();
  v91[0] = (uint64_t)v76;
  v76[2] = v26;
  v76[3] = 0x800000025E7C0AF0;
  v76[4] = v64;
  v76[5] = v65;
  v76[6] = v75;
  sub_25E7AA5F8(v91);

  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v91);
}

void sub_25E7A4138()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_25E7BC2E0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2, v4);
  uint64_t v6 = (char *)&aBlock[-1] - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26A7065D8 != -1) {
    swift_once();
  }
  uint64_t v7 = __swift_project_value_buffer(v2, (uint64_t)qword_26A708A10);
  uint64_t v8 = sub_25E7BC2C0();
  os_log_type_t v9 = sub_25E7BC4A0();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = (uint8_t *)swift_slowAlloc();
    uint64_t v11 = swift_slowAlloc();
    uint64_t v37 = (uint64_t)v1;
    aBlock[0] = v11;
    uint64_t v12 = v11;
    *(_DWORD *)uint64_t v10 = 136446210;
    uint64_t v39 = sub_25E77CF40(0xD000000000000011, 0x800000025E7C0AD0, aBlock);
    sub_25E7BC520();
    _os_log_impl(&dword_25E775000, v8, v9, "%{public}s is invoked. ", v10, 0xCu);
    swift_arrayDestroy();
    uint64_t v13 = v12;
    uint64_t v1 = (char *)v37;
    MEMORY[0x2611E3480](v13, -1, -1);
    MEMORY[0x2611E3480](v10, -1, -1);
  }

  uint64_t v14 = &v1[OBJC_IVAR___WFSetupClientInternal_clientState];
  if (v1[OBJC_IVAR___WFSetupClientInternal_clientState + 1])
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v6, v7, v2);
    uint64_t v15 = v1;
    uint64_t v16 = sub_25E7BC2C0();
    os_log_type_t v17 = sub_25E7BC4A0();
    if (os_log_type_enabled(v16, v17))
    {
      uint64_t v18 = swift_slowAlloc();
      uint64_t v37 = swift_slowAlloc();
      aBlock[0] = v37;
      *(_DWORD *)uint64_t v18 = 136446466;
      uint64_t v39 = sub_25E77CF40(0xD000000000000011, 0x800000025E7C0AD0, aBlock);
      sub_25E7BC520();
      uint64_t v19 = 8 * v14[1];
      uint64_t v20 = *(void *)&aNotinitiinprog[v19];
      *(_WORD *)(v18 + 12) = 2080;
      uint64_t v39 = sub_25E77CF40(v20, *(void *)&aAted[v19], aBlock);
      sub_25E7BC520();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25E775000, v16, v17, "%{public}s invoked but coreCDPSetupState is %s. Skipping setting up coreCDP approval server.", (uint8_t *)v18, 0x16u);
      uint64_t v21 = v37;
      swift_arrayDestroy();
      MEMORY[0x2611E3480](v21, -1, -1);
      MEMORY[0x2611E3480](v18, -1, -1);
    }
    else
    {
    }
    (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  }
  else
  {
    id v22 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F34350]), sel_init);
    uint64_t v23 = &v1[OBJC_IVAR___WFSetupClientInternal_messageSessionTemplate];
    swift_beginAccess();
    objc_msgSend(v22, sel_setSharingChannel_, *(void *)v23);
    unint64_t v24 = v22;
    id v25 = sub_25E7BC2C0();
    os_log_type_t v26 = sub_25E7BC4A0();
    if (os_log_type_enabled(v25, v26))
    {
      uint64_t v37 = v7;
      id v27 = (uint8_t *)swift_slowAlloc();
      uint64_t v28 = (void *)swift_slowAlloc();
      *(_DWORD *)id v27 = 138412290;
      aBlock[0] = (uint64_t)v24;
      id v29 = v24;
      sub_25E7BC520();
      *uint64_t v28 = v24;

      _os_log_impl(&dword_25E775000, v25, v26, "Creating cdpStateController with context: %@", v27, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A7069B0);
      swift_arrayDestroy();
      MEMORY[0x2611E3480](v28, -1, -1);
      MEMORY[0x2611E3480](v27, -1, -1);
    }
    else
    {

      id v25 = v24;
    }

    id v30 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F343F0]), sel_initWithContext_, v24);
    uint64_t v31 = sub_25E7BC2C0();
    os_log_type_t v32 = sub_25E7BC4A0();
    if (os_log_type_enabled(v31, v32))
    {
      unint64_t v33 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v33 = 0;
      _os_log_impl(&dword_25E775000, v31, v32, "Starting coreCDP approval server…", v33, 2u);
      MEMORY[0x2611E3480](v33, -1, -1);
    }

    if (v30)
    {
      uint64_t v34 = swift_allocObject();
      swift_unknownObjectWeakInit();
      aBlock[4] = (uint64_t)sub_25E7A53BC;
      aBlock[5] = v34;
      aBlock[0] = MEMORY[0x263EF8330];
      aBlock[1] = 1107296256;
      aBlock[2] = (uint64_t)sub_25E79BBDC;
      aBlock[3] = (uint64_t)&block_descriptor_35;
      uint64_t v35 = _Block_copy(aBlock);
      id v36 = v30;
      swift_release();
      objc_msgSend(v36, sel_startCircleApplicationApprovalServer_, v35);

      _Block_release(v35);
    }
    else
    {
    }
  }
}

uint64_t sub_25E7A47F8(int a1, void *a2, uint64_t a3)
{
  uint64_t v6 = sub_25E7BC2F0();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6, v8);
  uint64_t v54 = &v49[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v10 = sub_25E7BC310();
  uint64_t v53 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10, v11);
  uint64_t v52 = &v49[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  if (qword_26A7065D8 != -1) {
    swift_once();
  }
  uint64_t v13 = sub_25E7BC2E0();
  uint64_t v14 = __swift_project_value_buffer(v13, (uint64_t)qword_26A708A10);
  id v15 = a2;
  id v16 = a2;
  uint64_t v55 = v14;
  os_log_type_t v17 = sub_25E7BC2C0();
  os_log_type_t v18 = sub_25E7BC4A0();
  BOOL v19 = os_log_type_enabled(v17, v18);
  uint64_t v56 = a3 + 16;
  if (v19)
  {
    uint64_t v20 = swift_slowAlloc();
    int v50 = a1;
    uint64_t v21 = v20;
    uint64_t v22 = swift_slowAlloc();
    aBlock[0] = v22;
    *(_DWORD *)uint64_t v21 = 67109378;
    LODWORD(v59) = v50 & 1;
    sub_25E7BC520();
    *(_WORD *)(v21 + 8) = 2080;
    uint64_t v51 = a3;
    uint64_t v59 = (uint64_t)a2;
    id v23 = a2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A706A80);
    uint64_t v24 = sub_25E7BC3F0();
    uint64_t v59 = sub_25E77CF40(v24, v25, aBlock);
    a3 = v51;
    sub_25E7BC520();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_25E775000, v17, v18, "CDP approval server started with success: %{BOOL}d, error: %s", (uint8_t *)v21, 0x12u);
    swift_arrayDestroy();
    MEMORY[0x2611E3480](v22, -1, -1);
    uint64_t v26 = v21;
    LOBYTE(v21) = v50;
    MEMORY[0x2611E3480](v26, -1, -1);

    if ((v21 & 1) == 0) {
      goto LABEL_5;
    }
  }
  else
  {

    if ((a1 & 1) == 0)
    {
LABEL_5:
      id v27 = a2;
      id v28 = a2;
      id v29 = sub_25E7BC2C0();
      os_log_type_t v30 = sub_25E7BC4A0();
      if (os_log_type_enabled(v29, v30))
      {
        uint64_t v55 = v6;
        uint64_t v31 = (uint8_t *)swift_slowAlloc();
        uint64_t v32 = swift_slowAlloc();
        aBlock[0] = v32;
        uint64_t v51 = a3;
        *(_DWORD *)uint64_t v31 = 136446210;
        uint64_t v59 = (uint64_t)a2;
        id v33 = a2;
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A706A80);
        uint64_t v34 = sub_25E7BC3F0();
        uint64_t v59 = sub_25E77CF40(v34, v35, aBlock);
        uint64_t v6 = v55;
        a3 = v51;
        sub_25E7BC520();
        swift_bridgeObjectRelease();

        _os_log_impl(&dword_25E775000, v29, v30, "Setting the coreCDPSetupState to failed with error: %{public}s", v31, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x2611E3480](v32, -1, -1);
        MEMORY[0x2611E3480](v31, -1, -1);
      }
      else
      {
      }
      uint64_t v39 = v56;
      swift_beginAccess();
      os_log_type_t v40 = (unsigned char *)MEMORY[0x2611E34D0](v39);
      if (v40)
      {
        char v41 = 3;
        goto LABEL_15;
      }
      goto LABEL_16;
    }
  }
  id v36 = sub_25E7BC2C0();
  os_log_type_t v37 = sub_25E7BC4A0();
  if (os_log_type_enabled(v36, v37))
  {
    uint64_t v38 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v38 = 0;
    _os_log_impl(&dword_25E775000, v36, v37, "Setting the coreCDPSetupState to succeeded", v38, 2u);
    MEMORY[0x2611E3480](v38, -1, -1);
  }

  uint64_t v39 = v56;
  swift_beginAccess();
  os_log_type_t v40 = (unsigned char *)MEMORY[0x2611E34D0](v39);
  if (v40)
  {
    char v41 = 2;
LABEL_15:
    v40[OBJC_IVAR___WFSetupClientInternal_clientState + 1] = v41;
  }
LABEL_16:
  swift_beginAccess();
  uint64_t result = MEMORY[0x2611E34D0](v39);
  if (result)
  {
    uint64_t v43 = (void *)result;
    uint64_t v44 = (id *)(result + OBJC_IVAR___WFSetupClientInternal_dispatchQueue);
    swift_beginAccess();
    id v45 = *v44;

    aBlock[4] = (uint64_t)sub_25E7A53C4;
    aBlock[5] = a3;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_25E787340;
    aBlock[3] = (uint64_t)&block_descriptor_38;
    id v46 = _Block_copy(aBlock);
    swift_retain();
    os_log_type_t v47 = v52;
    sub_25E7BC300();
    uint64_t v57 = MEMORY[0x263F8EE78];
    sub_25E7A5084();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A706988);
    sub_25E796798();
    uint64_t v48 = v54;
    sub_25E7BC550();
    MEMORY[0x2611E2BA0](0, v47, v48, v46);
    _Block_release(v46);

    (*(void (**)(unsigned char *, uint64_t))(v7 + 8))(v48, v6);
    (*(void (**)(unsigned char *, uint64_t))(v53 + 8))(v47, v10);
    return swift_release();
  }
  return result;
}

void sub_25E7A4EF8(uint64_t a1)
{
  uint64_t v1 = a1 + 16;
  if (qword_26A7065D8 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_25E7BC2E0();
  __swift_project_value_buffer(v2, (uint64_t)qword_26A708A10);
  uint64_t v3 = sub_25E7BC2C0();
  os_log_type_t v4 = sub_25E7BC4A0();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_25E775000, v3, v4, "Setup attempt of CoreCDP is complete, advancing connection state", v5, 2u);
    MEMORY[0x2611E3480](v5, -1, -1);
  }

  swift_beginAccess();
  uint64_t v6 = MEMORY[0x2611E34D0](v1);
  if (v6)
  {
    uint64_t v7 = (void *)v6;
    sub_25E79FA2C(v6);
  }
}

uint64_t type metadata accessor for WFSetupClient()
{
  return self;
}

uint64_t sub_25E7A502C()
{
  swift_unknownObjectWeakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_25E7A5064()
{
  sub_25E79E130(v0);
}

uint64_t block_copy_helper_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_1()
{
  return swift_release();
}

unint64_t sub_25E7A5084()
{
  unint64_t result = qword_26A706980;
  if (!qword_26A706980)
  {
    sub_25E7BC2F0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A706980);
  }
  return result;
}

unint64_t sub_25E7A50DC()
{
  unint64_t result = qword_26A706C58;
  if (!qword_26A706C58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A706C58);
  }
  return result;
}

uint64_t sub_25E7A5130(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_25E788CF8(a1, a2, a3, *(uint64_t (**)(uint64_t *, uint64_t *, uint64_t *))(v3 + 16));
}

uint64_t sub_25E7A5138(void *a1, void *a2, void *a3)
{
  return sub_25E788CC4(a1, a2, a3, *(uint64_t (**)(void, void, void))(v3 + 16));
}

void sub_25E7A5140()
{
  sub_25E79F384(v0);
}

id sub_25E7A5148@<X0>(void *a1@<X0>, void **a2@<X8>)
{
  uint64_t v3 = (void **)(*a1 + OBJC_IVAR___WFSetupClientInternal_messageSessionTemplate);
  swift_beginAccess();
  os_log_type_t v4 = *v3;
  *a2 = *v3;
  return v4;
}

void *__swift_memcpy8_1(void *result, void *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for WFSetupClient.WFSetupClientState(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && *(unsigned char *)(a1 + 8)) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 2);
  BOOL v4 = v3 >= 2;
  int v5 = (v3 + 2147483646) & 0x7FFFFFFF;
  if (!v4) {
    int v5 = -1;
  }
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for WFSetupClient.WFSetupClientState(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(void *)unint64_t result = a2 - 255;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 8) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 8) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 2) = a2 + 1;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for WFSetupClient.WFSetupClientState()
{
  return &type metadata for WFSetupClient.WFSetupClientState;
}

unsigned char *storeEnumTagSinglePayload for WFSetupClient.WFSetupClientError(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 4 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 4) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFC) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFB)
  {
    unsigned int v6 = ((a2 - 252) >> 8) + 1;
    *unint64_t result = a2 + 4;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x25E7A532CLL);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *unint64_t result = a2 + 4;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for WFSetupClient.WFSetupClientError()
{
  return &type metadata for WFSetupClient.WFSetupClientError;
}

unint64_t sub_25E7A5368()
{
  unint64_t result = qword_26A706C60;
  if (!qword_26A706C60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A706C60);
  }
  return result;
}

uint64_t sub_25E7A53BC(int a1, void *a2)
{
  return sub_25E7A47F8(a1, a2, v2);
}

void sub_25E7A53C4()
{
  sub_25E7A4EF8(v0);
}

uint64_t sub_25E7A53CC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A706998);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_25E7A5434(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A706998);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_25E7A5494()
{
  unint64_t result = qword_26A706C68;
  if (!qword_26A706C68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A706C68);
  }
  return result;
}

uint64_t sub_25E7A54E8()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t *__swift_allocate_boxed_opaque_existential_0(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

void sub_25E7A5594(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_25E7A361C(a1, a2, a3, a4, v4, (void (*)(uint64_t, uint64_t, uint64_t))sub_25E7ABA78);
}

void sub_25E7A55C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_25E7A361C(a1, a2, a3, a4, v4, (void (*)(uint64_t, uint64_t, uint64_t))sub_25E7A5E44);
}

void sub_25E7A55F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_25E7A36A4(a1, a2, a3, a4, v4, (void (*)(uint64_t, uint64_t, uint64_t))sub_25E7AC288);
}

void sub_25E7A5624(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_25E7A36A4(a1, a2, a3, a4, v4, (void (*)(uint64_t, uint64_t, uint64_t))sub_25E7AC800);
}

void sub_25E7A5654(void *a1)
{
  sub_25E7A23B4(a1, v1);
}

void sub_25E7A565C()
{
  sub_25E7A2780(v0);
}

void sub_25E7A5664(unsigned int a1, uint64_t a2, unint64_t a3)
{
  sub_25E7A294C(a1, a2, a3, v3);
}

void sub_25E7A566C(int a1, uint64_t a2)
{
  sub_25E7A29C4(a1, a2, v2);
}

void sub_25E7A5674(void *a1)
{
  sub_25E7A2AC0(a1, v1);
}

uint64_t sub_25E7A567C()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

void sub_25E7A56BC(void *a1)
{
  sub_25E7A2B1C(a1, *(void *)(v1 + 16), *(void **)(v1 + 24));
}

const char *SFDeviceClassCodeToString(unsigned int a1)
{
  if (a1 > 8) {
    return "?";
  }
  else {
    return off_26552F8A0[(char)a1];
  }
}

id WFSetupProgressEventToString_0(unint64_t a1)
{
  if (a1 <= 0xF)
  {
    uint64_t v1 = (void *)*((void *)&off_26552F968 + a1);
    id v2 = *((id *)&off_26552F8E8 + a1);
  }
  return v1;
}

uint64_t sub_25E7A5740()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_25E7A5778()
{
  _Block_release(*(const void **)(v0 + 16));
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_25E7A57B0(uint64_t a1)
{
  uint64_t v3 = *(void *)(v1 + 16);
  id v4 = (id)sub_25E7BC3D0();
  (*(void (**)(uint64_t, uint64_t, id))(v3 + 16))(v3, a1, v4);
}

void sub_25E7A5818()
{
  uint64_t v1 = *(void *)(v0 + 16);
  id v2 = (id)sub_25E7BC370();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void sub_25E7A588C(uint64_t a1)
{
  uint64_t v3 = *(void *)(v1 + 16);
  id v4 = (id)sub_25E7BC370();
  (*(void (**)(uint64_t, uint64_t, id))(v3 + 16))(v3, a1, v4);
}

uint64_t sub_25E7A5910()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

unsigned char *storeEnumTagSinglePayload for WFSetupClient.WFSetupClientState.CDPSetupState(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 3 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 3) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFD) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFC)
  {
    unsigned int v6 = ((a2 - 253) >> 8) + 1;
    *unint64_t result = a2 + 3;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x25E7A59ECLL);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *unint64_t result = a2 + 3;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for WFSetupClient.WFSetupClientState.CDPSetupState()
{
  return &type metadata for WFSetupClient.WFSetupClientState.CDPSetupState;
}

unsigned char *storeEnumTagSinglePayload for WFSetupClient.WFSetupClientState.PreAuthState(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 2 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 2) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFE) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFD)
  {
    unsigned int v6 = ((a2 - 254) >> 8) + 1;
    *unint64_t result = a2 + 2;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x25E7A5AF0);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *unint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for WFSetupClient.WFSetupClientState.PreAuthState()
{
  return &type metadata for WFSetupClient.WFSetupClientState.PreAuthState;
}

unint64_t sub_25E7A5B2C()
{
  unint64_t result = qword_26A706C70;
  if (!qword_26A706C70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A706C70);
  }
  return result;
}

unint64_t sub_25E7A5B84()
{
  unint64_t result = qword_26A706C78;
  if (!qword_26A706C78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A706C78);
  }
  return result;
}

void sub_25E7A5CD0(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void (**)(void *, void *))(a1 + 32);
  swift_retain();
  id v7 = a2;
  id v6 = a3;
  v5(a2, a3);
  swift_release();
}

uint64_t sub_25E7A5D5C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = sub_25E7A7924(a1);
  if (v6) {
    goto LABEL_9;
  }
  if (*(_DWORD *)(a1 + 36) != v5)
  {
    __break(1u);
LABEL_9:
    __break(1u);
    return result;
  }
  if (result == 1 << *(unsigned char *)(a1 + 32))
  {
    *(_OWORD *)a2 = 0u;
    *(_OWORD *)(a2 + 16) = 0u;
  }
  else
  {
    id v7 = sub_25E7A79AC(v11, result, v5, 0, a1);
    uint64_t v8 = v11[0];
    unint64_t v9 = v11[1];
    *(void *)a2 = v7;
    *(void *)(a2 + 8) = v10;
    *(void *)(a2 + 16) = v8;
    *(void *)(a2 + 24) = v9;
    swift_bridgeObjectRetain();
    sub_25E77CE0C(v8, v9);
    swift_bridgeObjectRelease();
    return sub_25E77D724(v8, v9);
  }
  return result;
}

void sub_25E7A5E44(uint64_t a1, void (*a2)(void, void, void), uint64_t a3)
{
  unsigned int v4 = v3;
  uint64_t v6 = sub_25E7A7A4C(a1);
  uint64_t v8 = v7;
  if (qword_26A7065C0 != -1) {
    swift_once();
  }
  uint64_t v9 = sub_25E7BC2E0();
  __swift_project_value_buffer(v9, (uint64_t)qword_26A7089C8);
  uint64_t v10 = v8;
  uint64_t v11 = sub_25E7BC2C0();
  os_log_type_t v12 = sub_25E7BC4A0();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v62 = v6;
    uint64_t v63 = a2;
    uint64_t v13 = (uint8_t *)swift_slowAlloc();
    uint64_t v14 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v13 = 138412290;
    *(void *)&long long aBlock = v10;
    id v15 = v10;
    sub_25E7BC520();
    *uint64_t v14 = v10;

    _os_log_impl(&dword_25E775000, v11, v12, "Successfully retrieved anisette request: %@", v13, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A7069B0);
    swift_arrayDestroy();
    MEMORY[0x2611E3480](v14, -1, -1);
    a2 = v63;
    MEMORY[0x2611E3480](v13, -1, -1);
  }
  else
  {
  }
  switch((char)v6)
  {
    case 1:
      uint64_t v18 = *(void *)&v10[OBJC_IVAR___WFAnisetteRequest_data];
      if (*(void *)(v18 + 16))
      {
        swift_bridgeObjectRetain();
        unint64_t v19 = sub_25E7A8D0C(0x617461446D6973, 0xE700000000000000);
        if (v20)
        {
          sub_25E77D9C8(*(void *)(v18 + 56) + 32 * v19, (uint64_t)&aBlock);
        }
        else
        {
          long long aBlock = 0u;
          long long v67 = 0u;
        }
        swift_bridgeObjectRelease();
        if (*((void *)&v67 + 1))
        {
          if (swift_dynamicCast())
          {
            uint64_t v28 = v70;
            unint64_t v29 = v71;
            os_log_type_t v30 = (void *)sub_25E7BC200();
            uint64_t v31 = swift_allocObject();
            *(void *)(v31 + 16) = a2;
            *(void *)(v31 + 24) = a3;
            unint64_t v68 = sub_25E7A857C;
            uint64_t v69 = v31;
            *(void *)&long long aBlock = MEMORY[0x263EF8330];
            *((void *)&aBlock + 1) = 1107296256;
            *(void *)&long long v67 = sub_25E79BBDC;
            *((void *)&v67 + 1) = &block_descriptor_18_0;
            uint64_t v32 = _Block_copy(&aBlock);
            swift_retain();
            swift_release();
            objc_msgSend(v4, sel_syncAnisetteWithSIMData_completion_, v30, v32);

            _Block_release(v32);
            sub_25E77D724(v28, v29);
            return;
          }
LABEL_27:
          id v33 = v10;
          uint64_t v34 = sub_25E7BC2C0();
          os_log_type_t v35 = sub_25E7BC490();
          if (os_log_type_enabled(v34, v35))
          {
            uint64_t v64 = a2;
            id v36 = (uint8_t *)swift_slowAlloc();
            uint64_t v37 = swift_slowAlloc();
            *(void *)&long long aBlock = v37;
            *(_DWORD *)id v36 = 136315138;
            id v38 = objc_msgSend(v33, sel_description);
            uint64_t v39 = sub_25E7BC3E0();
            unint64_t v41 = v40;

            uint64_t v70 = sub_25E77CF40(v39, v41, (uint64_t *)&aBlock);
            sub_25E7BC520();

            swift_bridgeObjectRelease();
            _os_log_impl(&dword_25E775000, v34, v35, "Failed to retrieve simData from request: %s", v36, 0xCu);
            swift_arrayDestroy();
            MEMORY[0x2611E3480](v37, -1, -1);
            a2 = v64;
            MEMORY[0x2611E3480](v36, -1, -1);
          }
          else
          {
          }
          sub_25E7A84C0();
          uint64_t v42 = (void *)swift_allocError();
          *(_OWORD *)uint64_t v43 = xmmword_25E7BEB80;
          *(unsigned char *)(v43 + 16) = 0;
          a2(v42, 0, 0);

          return;
        }
      }
      else
      {
        long long aBlock = 0u;
        long long v67 = 0u;
      }
      sub_25E784970((uint64_t)&aBlock, &qword_26A706790);
      goto LABEL_27;
    case 2:
      uint64_t v21 = swift_allocObject();
      *(void *)(v21 + 16) = a2;
      *(void *)(v21 + 24) = a3;
      unint64_t v68 = sub_25E7A8574;
      uint64_t v69 = v21;
      *(void *)&long long aBlock = MEMORY[0x263EF8330];
      *((void *)&aBlock + 1) = 1107296256;
      *(void *)&long long v67 = sub_25E79BBDC;
      *((void *)&v67 + 1) = &block_descriptor_12;
      os_log_type_t v17 = _Block_copy(&aBlock);
      swift_retain();
      swift_release();
      objc_msgSend(v4, sel_eraseAnisetteWithCompletion_, v17, v62);
      goto LABEL_12;
    case 3:
      uint64_t v22 = *(void *)&v10[OBJC_IVAR___WFAnisetteRequest_data];
      if (*(void *)(v22 + 16))
      {
        swift_bridgeObjectRetain();
        unint64_t v23 = sub_25E7A8D0C(0x7250646C756F6873, 0xEF6E6F697369766FLL);
        if (v24)
        {
          sub_25E77D9C8(*(void *)(v22 + 56) + 32 * v23, (uint64_t)&aBlock);
        }
        else
        {
          long long aBlock = 0u;
          long long v67 = 0u;
        }
        swift_bridgeObjectRelease();
        if (*((void *)&v67 + 1))
        {
          if (swift_dynamicCast())
          {
            uint64_t v44 = v70;
            uint64_t v45 = swift_allocObject();
            *(void *)(v45 + 16) = a2;
            *(void *)(v45 + 24) = a3;
            unint64_t v68 = sub_25E7A856C;
            uint64_t v69 = v45;
            *(void *)&long long aBlock = MEMORY[0x263EF8330];
            *((void *)&aBlock + 1) = 1107296256;
            *(void *)&long long v67 = sub_25E7A5CD0;
            *((void *)&v67 + 1) = &block_descriptor_6;
            id v46 = _Block_copy(&aBlock);
            swift_retain();
            swift_release();
            objc_msgSend(v4, sel_fetchAnisetteDataAndProvisionIfNecessary_withCompletion_, v44, v46);

            _Block_release(v46);
            return;
          }
LABEL_36:
          sub_25E7A84C0();
          os_log_type_t v47 = (void *)swift_allocError();
          *(_OWORD *)uint64_t v48 = xmmword_25E7BEB70;
          *(unsigned char *)(v48 + 16) = 0;
          a2(v47, 0, 0);

          uint64_t v49 = v10;
          int v50 = sub_25E7BC2C0();
          os_log_type_t v51 = sub_25E7BC490();
          if (os_log_type_enabled(v50, v51))
          {
            uint64_t v52 = (uint8_t *)swift_slowAlloc();
            uint64_t v53 = swift_slowAlloc();
            *(void *)&long long aBlock = v53;
            *(_DWORD *)uint64_t v52 = 136315138;
            id v54 = objc_msgSend(v49, sel_description);
            uint64_t v55 = sub_25E7BC3E0();
            unint64_t v57 = v56;

            uint64_t v70 = sub_25E77CF40(v55, v57, (uint64_t *)&aBlock);
            sub_25E7BC520();

            swift_bridgeObjectRelease();
            _os_log_impl(&dword_25E775000, v50, v51, "Failed to retrieve shouldProvision from request: %s", v52, 0xCu);
            swift_arrayDestroy();
            MEMORY[0x2611E3480](v53, -1, -1);
            MEMORY[0x2611E3480](v52, -1, -1);

LABEL_43:
          }
          else
          {
          }
          return;
        }
      }
      else
      {
        long long aBlock = 0u;
        long long v67 = 0u;
      }
      sub_25E784970((uint64_t)&aBlock, &qword_26A706790);
      goto LABEL_36;
    case 4:
      uint64_t v25 = *(void *)&v10[OBJC_IVAR___WFAnisetteRequest_data];
      if (!*(void *)(v25 + 16))
      {
        long long aBlock = 0u;
        long long v67 = 0u;
LABEL_44:
        sub_25E784970((uint64_t)&aBlock, &qword_26A706790);
        goto LABEL_45;
      }
      swift_bridgeObjectRetain();
      unint64_t v26 = sub_25E7A8D0C(1684632420, 0xE400000000000000);
      if (v27)
      {
        sub_25E77D9C8(*(void *)(v25 + 56) + 32 * v26, (uint64_t)&aBlock);
      }
      else
      {
        long long aBlock = 0u;
        long long v67 = 0u;
      }
      swift_bridgeObjectRelease();
      if (!*((void *)&v67 + 1)) {
        goto LABEL_44;
      }
      if (swift_dynamicCast())
      {
        int v50 = sub_25E7BC3D0();
        swift_bridgeObjectRelease();
        uint64_t v58 = swift_allocObject();
        *(void *)(v58 + 16) = a2;
        *(void *)(v58 + 24) = a3;
        unint64_t v68 = sub_25E7A854C;
        uint64_t v69 = v58;
        *(void *)&long long aBlock = MEMORY[0x263EF8330];
        *((void *)&aBlock + 1) = 1107296256;
        *(void *)&long long v67 = sub_25E7A5CD0;
        *((void *)&v67 + 1) = &block_descriptor_2;
        uint64_t v59 = _Block_copy(&aBlock);
        swift_retain();
        swift_release();
        objc_msgSend(v4, sel_legacyAnisetteDataForDSID_withCompletion_, v50, v59);

        _Block_release(v59);
        goto LABEL_43;
      }
LABEL_45:
      sub_25E7A84C0();
      uint64_t v60 = (void *)swift_allocError();
      *(_OWORD *)uint64_t v61 = xmmword_25E7BEB60;
      *(unsigned char *)(v61 + 16) = 0;
      a2(v60, 0, 0);

      return;
    default:
      uint64_t v16 = swift_allocObject();
      *(void *)(v16 + 16) = a2;
      *(void *)(v16 + 24) = a3;
      unint64_t v68 = sub_25E7A8584;
      uint64_t v69 = v16;
      *(void *)&long long aBlock = MEMORY[0x263EF8330];
      *((void *)&aBlock + 1) = 1107296256;
      *(void *)&long long v67 = sub_25E79BBDC;
      *((void *)&v67 + 1) = &block_descriptor_24_0;
      os_log_type_t v17 = _Block_copy(&aBlock);
      swift_retain();
      swift_release();
      objc_msgSend(v4, sel_provisionAnisetteWithCompletion_, v17, v62);
LABEL_12:

      _Block_release(v17);
      return;
  }
}

uint64_t sub_25E7A6B7C(char a1, uint64_t a2, void (*a3)(uint64_t, void, unint64_t))
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A706D80);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_25E7BDF10;
  *(void *)&long long v20 = 0xD00000000000001CLL;
  *((void *)&v20 + 1) = 0x800000025E7C0CB0;
  uint64_t v7 = MEMORY[0x263F8D310];
  sub_25E7BC580();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A706C88);
  uint64_t v8 = swift_initStackObject();
  *(_OWORD *)(v8 + 16) = xmmword_25E7BDF10;
  strcpy((char *)(v8 + 32), "isProvisioned");
  *(_WORD *)(v8 + 46) = -4864;
  *(void *)(v8 + 72) = MEMORY[0x263F8D4F8];
  *(unsigned char *)(v8 + 48) = a1;
  unint64_t v9 = sub_25E788B78(v8);
  uint64_t v10 = (objc_class *)type metadata accessor for AnisetteServiceFactory.AnisetteResponse();
  uint64_t v11 = (char *)objc_allocWithZone(v10);
  os_log_type_t v12 = &v11[OBJC_IVAR___WFAnisetteResponse_id];
  *(void *)os_log_type_t v12 = 0x6F697369766F7270;
  *((void *)v12 + 1) = 0xE90000000000006ELL;
  *(void *)&v11[OBJC_IVAR___WFAnisetteResponse_data] = v9;
  v19.receiver = v11;
  v19.super_class = v10;
  id v13 = objc_msgSendSuper2(&v19, sel_init);
  uint64_t v14 = sub_25E7B9A00();
  unint64_t v16 = v15;

  if (v16 >> 60 == 15)
  {
    *(void *)(inited + 96) = v7;
    *(void *)(inited + 72) = 0;
    *(void *)(inited + 80) = 0xE000000000000000;
  }
  else
  {
    uint64_t v21 = MEMORY[0x263F06F78];
    *(void *)&long long v20 = v14;
    *((void *)&v20 + 1) = v16;
    sub_25E796898(&v20, (_OWORD *)(inited + 72));
  }
  unint64_t v17 = sub_25E7885A8(inited);
  a3(a2, 0, v17);
  return swift_bridgeObjectRelease();
}

uint64_t sub_25E7A6D68(char a1, uint64_t a2, void (*a3)(uint64_t, void, unint64_t))
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A706D80);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_25E7BDF10;
  *(void *)&long long v20 = 0xD00000000000001CLL;
  *((void *)&v20 + 1) = 0x800000025E7C0CB0;
  uint64_t v7 = MEMORY[0x263F8D310];
  sub_25E7BC580();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A706C88);
  uint64_t v8 = swift_initStackObject();
  *(_OWORD *)(v8 + 16) = xmmword_25E7BDF10;
  *(void *)(v8 + 32) = 0x6465636E79537369;
  *(void *)(v8 + 40) = 0xE800000000000000;
  *(void *)(v8 + 72) = MEMORY[0x263F8D4F8];
  *(unsigned char *)(v8 + 48) = a1;
  unint64_t v9 = sub_25E788B78(v8);
  uint64_t v10 = (objc_class *)type metadata accessor for AnisetteServiceFactory.AnisetteResponse();
  uint64_t v11 = (char *)objc_allocWithZone(v10);
  os_log_type_t v12 = &v11[OBJC_IVAR___WFAnisetteResponse_id];
  *(void *)os_log_type_t v12 = 1668184435;
  *((void *)v12 + 1) = 0xE400000000000000;
  *(void *)&v11[OBJC_IVAR___WFAnisetteResponse_data] = v9;
  v19.receiver = v11;
  v19.super_class = v10;
  id v13 = objc_msgSendSuper2(&v19, sel_init);
  uint64_t v14 = sub_25E7B9A00();
  unint64_t v16 = v15;

  if (v16 >> 60 == 15)
  {
    *(void *)(inited + 96) = v7;
    *(void *)(inited + 72) = 0;
    *(void *)(inited + 80) = 0xE000000000000000;
  }
  else
  {
    uint64_t v21 = MEMORY[0x263F06F78];
    *(void *)&long long v20 = v14;
    *((void *)&v20 + 1) = v16;
    sub_25E796898(&v20, (_OWORD *)(inited + 72));
  }
  unint64_t v17 = sub_25E7885A8(inited);
  a3(a2, 0, v17);
  return swift_bridgeObjectRelease();
}

uint64_t sub_25E7A6F3C(char a1, uint64_t a2, void (*a3)(uint64_t, void, unint64_t))
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A706D80);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_25E7BDF10;
  *(void *)&long long v20 = 0xD00000000000001CLL;
  *((void *)&v20 + 1) = 0x800000025E7C0CB0;
  uint64_t v7 = MEMORY[0x263F8D310];
  sub_25E7BC580();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A706C88);
  uint64_t v8 = swift_initStackObject();
  *(_OWORD *)(v8 + 16) = xmmword_25E7BDF10;
  *(void *)(v8 + 32) = 0x6465736172457369;
  *(void *)(v8 + 40) = 0xE800000000000000;
  *(void *)(v8 + 72) = MEMORY[0x263F8D4F8];
  *(unsigned char *)(v8 + 48) = a1;
  unint64_t v9 = sub_25E788B78(v8);
  uint64_t v10 = (objc_class *)type metadata accessor for AnisetteServiceFactory.AnisetteResponse();
  uint64_t v11 = (char *)objc_allocWithZone(v10);
  os_log_type_t v12 = &v11[OBJC_IVAR___WFAnisetteResponse_id];
  *(void *)os_log_type_t v12 = 0x6573617265;
  *((void *)v12 + 1) = 0xE500000000000000;
  *(void *)&v11[OBJC_IVAR___WFAnisetteResponse_data] = v9;
  v19.receiver = v11;
  v19.super_class = v10;
  id v13 = objc_msgSendSuper2(&v19, sel_init);
  uint64_t v14 = sub_25E7B9A00();
  unint64_t v16 = v15;

  if (v16 >> 60 == 15)
  {
    *(void *)(inited + 96) = v7;
    *(void *)(inited + 72) = 0;
    *(void *)(inited + 80) = 0xE000000000000000;
  }
  else
  {
    uint64_t v21 = MEMORY[0x263F06F78];
    *(void *)&long long v20 = v14;
    *((void *)&v20 + 1) = v16;
    sub_25E796898(&v20, (_OWORD *)(inited + 72));
  }
  unint64_t v17 = sub_25E7885A8(inited);
  a3(a2, 0, v17);
  return swift_bridgeObjectRelease();
}

uint64_t sub_25E7A7114(void *a1, uint64_t a2, void (*a3)(uint64_t, void, unint64_t))
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A706D80);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_25E7BDF10;
  *(void *)&long long v23 = 0xD00000000000001CLL;
  *((void *)&v23 + 1) = 0x800000025E7C0CB0;
  uint64_t v7 = MEMORY[0x263F8D310];
  sub_25E7BC580();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A706C88);
  uint64_t v8 = swift_initStackObject();
  *(_OWORD *)(v8 + 16) = xmmword_25E7BDF10;
  strcpy((char *)(v8 + 32), "anisetteData");
  *(unsigned char *)(v8 + 45) = 0;
  *(_WORD *)(v8 + 46) = -5120;
  if (a1)
  {
    uint64_t v9 = sub_25E78314C(0, &qword_26A706C90);
    uint64_t v10 = a1;
  }
  else
  {
    uint64_t v10 = 0;
    uint64_t v9 = 0;
    *(void *)(v8 + 56) = 0;
    *(void *)(v8 + 64) = 0;
  }
  *(void *)(v8 + 48) = v10;
  *(void *)(v8 + 72) = v9;
  id v11 = a1;
  unint64_t v12 = sub_25E788B78(v8);
  id v13 = (objc_class *)type metadata accessor for AnisetteServiceFactory.AnisetteResponse();
  uint64_t v14 = (char *)objc_allocWithZone(v13);
  unint64_t v15 = &v14[OBJC_IVAR___WFAnisetteResponse_id];
  *(void *)unint64_t v15 = 0x6863746566;
  *((void *)v15 + 1) = 0xE500000000000000;
  *(void *)&v14[OBJC_IVAR___WFAnisetteResponse_data] = v12;
  v22.receiver = v14;
  v22.super_class = v13;
  id v16 = objc_msgSendSuper2(&v22, sel_init);
  uint64_t v17 = sub_25E7B9A00();
  unint64_t v19 = v18;

  if (v19 >> 60 == 15)
  {
    *(void *)(inited + 96) = v7;
    *(void *)(inited + 72) = 0;
    *(void *)(inited + 80) = 0xE000000000000000;
  }
  else
  {
    uint64_t v24 = MEMORY[0x263F06F78];
    *(void *)&long long v23 = v17;
    *((void *)&v23 + 1) = v19;
    sub_25E796898(&v23, (_OWORD *)(inited + 72));
  }
  unint64_t v20 = sub_25E7885A8(inited);
  a3(a2, 0, v20);
  return swift_bridgeObjectRelease();
}

uint64_t sub_25E7A7328(void *a1, uint64_t a2, void (*a3)(uint64_t, void, unint64_t))
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A706D80);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_25E7BDF10;
  *(void *)&long long v23 = 0xD00000000000001CLL;
  *((void *)&v23 + 1) = 0x800000025E7C0CB0;
  uint64_t v7 = MEMORY[0x263F8D310];
  sub_25E7BC580();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A706C88);
  uint64_t v8 = swift_initStackObject();
  *(_OWORD *)(v8 + 16) = xmmword_25E7BDF10;
  strcpy((char *)(v8 + 32), "anisetteData");
  *(unsigned char *)(v8 + 45) = 0;
  *(_WORD *)(v8 + 46) = -5120;
  if (a1)
  {
    uint64_t v9 = sub_25E78314C(0, &qword_26A706C90);
    uint64_t v10 = a1;
  }
  else
  {
    uint64_t v10 = 0;
    uint64_t v9 = 0;
    *(void *)(v8 + 56) = 0;
    *(void *)(v8 + 64) = 0;
  }
  *(void *)(v8 + 48) = v10;
  *(void *)(v8 + 72) = v9;
  id v11 = a1;
  unint64_t v12 = sub_25E788B78(v8);
  id v13 = (objc_class *)type metadata accessor for AnisetteServiceFactory.AnisetteResponse();
  uint64_t v14 = (char *)objc_allocWithZone(v13);
  unint64_t v15 = &v14[OBJC_IVAR___WFAnisetteResponse_id];
  *(void *)unint64_t v15 = 0x79636167656CLL;
  *((void *)v15 + 1) = 0xE600000000000000;
  *(void *)&v14[OBJC_IVAR___WFAnisetteResponse_data] = v12;
  v22.receiver = v14;
  v22.super_class = v13;
  id v16 = objc_msgSendSuper2(&v22, sel_init);
  uint64_t v17 = sub_25E7B9A00();
  unint64_t v19 = v18;

  if (v19 >> 60 == 15)
  {
    *(void *)(inited + 96) = v7;
    *(void *)(inited + 72) = 0;
    *(void *)(inited + 80) = 0xE000000000000000;
  }
  else
  {
    uint64_t v24 = MEMORY[0x263F06F78];
    *(void *)&long long v23 = v17;
    *((void *)&v23 + 1) = v19;
    sub_25E796898(&v23, (_OWORD *)(inited + 72));
  }
  unint64_t v20 = sub_25E7885A8(inited);
  a3(a2, 0, v20);
  return swift_bridgeObjectRelease();
}

unint64_t sub_25E7A753C(uint64_t a1)
{
  uint64_t v1 = a1;
  if (*(void *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A706CA0);
    id v2 = (void *)sub_25E7BC660();
  }
  else
  {
    id v2 = (void *)MEMORY[0x263F8EE80];
  }
  uint64_t v25 = v1 + 64;
  uint64_t v3 = -1;
  uint64_t v4 = -1 << *(unsigned char *)(v1 + 32);
  if (-v4 < 64) {
    uint64_t v3 = ~(-1 << -(char)v4);
  }
  unint64_t v5 = v3 & *(void *)(v1 + 64);
  uint64_t v6 = (char *)v32 + 8;
  int64_t v24 = (unint64_t)(63 - v4) >> 6;
  unint64_t result = swift_bridgeObjectRetain();
  int64_t v8 = 0;
  while (1)
  {
    if (v5)
    {
      uint64_t v14 = (v5 - 1) & v5;
      unint64_t v15 = __clz(__rbit64(v5)) | (v8 << 6);
      int64_t v16 = v8;
    }
    else
    {
      int64_t v17 = v8 + 1;
      if (__OFADD__(v8, 1)) {
        goto LABEL_40;
      }
      if (v17 >= v24)
      {
LABEL_36:
        sub_25E79992C();
        return (unint64_t)v2;
      }
      unint64_t v18 = *(void *)(v25 + 8 * v17);
      int64_t v16 = v8 + 1;
      if (!v18)
      {
        int64_t v16 = v8 + 2;
        if (v8 + 2 >= v24) {
          goto LABEL_36;
        }
        unint64_t v18 = *(void *)(v25 + 8 * v16);
        if (!v18)
        {
          int64_t v16 = v8 + 3;
          if (v8 + 3 >= v24) {
            goto LABEL_36;
          }
          unint64_t v18 = *(void *)(v25 + 8 * v16);
          if (!v18)
          {
            int64_t v16 = v8 + 4;
            if (v8 + 4 >= v24) {
              goto LABEL_36;
            }
            unint64_t v18 = *(void *)(v25 + 8 * v16);
            if (!v18)
            {
              int64_t v19 = v8 + 5;
              if (v8 + 5 >= v24) {
                goto LABEL_36;
              }
              unint64_t v18 = *(void *)(v25 + 8 * v19);
              if (!v18)
              {
                while (1)
                {
                  int64_t v16 = v19 + 1;
                  if (__OFADD__(v19, 1)) {
                    goto LABEL_41;
                  }
                  if (v16 >= v24) {
                    goto LABEL_36;
                  }
                  unint64_t v18 = *(void *)(v25 + 8 * v16);
                  ++v19;
                  if (v18) {
                    goto LABEL_26;
                  }
                }
              }
              int64_t v16 = v8 + 5;
            }
          }
        }
      }
LABEL_26:
      uint64_t v14 = (v18 - 1) & v18;
      unint64_t v15 = __clz(__rbit64(v18)) + (v16 << 6);
    }
    sub_25E797280(*(void *)(v1 + 48) + 40 * v15, (uint64_t)v31);
    sub_25E77D9C8(*(void *)(v1 + 56) + 32 * v15, (uint64_t)v6);
    v29[0] = v32[0];
    v29[1] = v32[1];
    uint64_t v30 = v33;
    v28[0] = v31[0];
    v28[1] = v31[1];
    sub_25E797280((uint64_t)v28, (uint64_t)v27);
    if (!swift_dynamicCast())
    {
      sub_25E784970((uint64_t)v28, &qword_26A706CA8);
      swift_bridgeObjectRelease();
LABEL_35:
      sub_25E79992C();
      swift_release();
      return 0;
    }
    sub_25E77D9C8((uint64_t)v29 + 8, (uint64_t)v27);
    sub_25E784970((uint64_t)v28, &qword_26A706CA8);
    if ((swift_dynamicCast() & 1) == 0)
    {
      swift_bridgeObjectRelease();
      sub_25E77D710(0, 0xF000000000000000);
      goto LABEL_35;
    }
    unint64_t result = sub_25E7A8D0C(v26, *((uint64_t *)&v26 + 1));
    if (v20)
    {
      uint64_t v9 = v1;
      uint64_t v10 = v6;
      uint64_t v11 = 16 * result;
      unint64_t v12 = (_OWORD *)(v2[6] + 16 * result);
      swift_bridgeObjectRelease();
      *unint64_t v12 = v26;
      uint64_t v13 = v2[7] + v11;
      uint64_t v6 = v10;
      uint64_t v1 = v9;
      unint64_t result = sub_25E77D724(*(void *)v13, *(void *)(v13 + 8));
      *(_OWORD *)uint64_t v13 = v26;
      goto LABEL_8;
    }
    if (v2[2] >= v2[3]) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    *(_OWORD *)(v2[6] + 16 * result) = v26;
    *(_OWORD *)(v2[7] + 16 * result) = v26;
    uint64_t v21 = v2[2];
    BOOL v22 = __OFADD__(v21, 1);
    uint64_t v23 = v21 + 1;
    if (v22) {
      goto LABEL_39;
    }
    v2[2] = v23;
LABEL_8:
    int64_t v8 = v16;
    unint64_t v5 = v14;
  }
  __break(1u);
LABEL_39:
  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_25E7A7924(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 64);
  if (v1)
  {
    uint64_t v2 = 0;
    return __clz(__rbit64(v1)) + v2;
  }
  char v5 = *(unsigned char *)(a1 + 32);
  unsigned int v6 = v5 & 0x3F;
  uint64_t v3 = 1 << v5;
  if (v6 < 7) {
    return v3;
  }
  unint64_t v1 = *(void *)(a1 + 72);
  if (v1)
  {
    uint64_t v2 = 64;
    return __clz(__rbit64(v1)) + v2;
  }
  unint64_t v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 2) {
    unint64_t v7 = 2;
  }
  unint64_t v8 = v7 - 2;
  uint64_t v9 = (unint64_t *)(a1 + 80);
  uint64_t v2 = 64;
  while (v8)
  {
    unint64_t v10 = *v9++;
    unint64_t v1 = v10;
    --v8;
    v2 += 64;
    if (v10) {
      return __clz(__rbit64(v1)) + v2;
    }
  }
  return v3;
}

uint64_t *sub_25E7A79AC(uint64_t *result, uint64_t a2, int a3, uint64_t a4, uint64_t a5)
{
  if (a2 < 0 || 1 << *(unsigned char *)(a5 + 32) <= a2)
  {
    __break(1u);
    goto LABEL_7;
  }
  if (((*(void *)(a5 + 8 * ((unint64_t)a2 >> 6) + 64) >> a2) & 1) == 0)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  if (*(_DWORD *)(a5 + 36) == a3)
  {
    uint64_t v5 = *(void *)(*(void *)(a5 + 48) + 16 * a2);
    unsigned int v6 = (uint64_t *)(*(void *)(a5 + 56) + 16 * a2);
    uint64_t v7 = *v6;
    unint64_t v8 = v6[1];
    *unint64_t result = *v6;
    result[1] = v8;
    swift_bridgeObjectRetain();
    sub_25E77CE0C(v7, v8);
    return (uint64_t *)v5;
  }
LABEL_8:
  __break(1u);
  return result;
}

uint64_t sub_25E7A7A4C(uint64_t a1)
{
  if (!sub_25E7A753C(a1))
  {
    if (qword_26A7065C0 != -1) {
      swift_once();
    }
    uint64_t v4 = sub_25E7BC2E0();
    __swift_project_value_buffer(v4, (uint64_t)qword_26A7089C8);
    swift_bridgeObjectRetain_n();
    uint64_t v5 = sub_25E7BC2C0();
    os_log_type_t v6 = sub_25E7BC490();
    uint64_t v2 = v6;
    if (os_log_type_enabled(v5, v6))
    {
      uint64_t v7 = (uint8_t *)swift_slowAlloc();
      uint64_t v8 = swift_slowAlloc();
      uint64_t v58 = v8;
      *(_DWORD *)uint64_t v7 = 136315138;
      uint64_t v9 = sub_25E7BC3A0();
      uint64_t v62 = sub_25E77CF40(v9, v10, &v58);
      sub_25E7BC520();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25E775000, v5, (os_log_type_t)v2, "Failed to retrieve anisette data dict from request: %s", v7, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2611E3480](v8, -1, -1);
      MEMORY[0x2611E3480](v7, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    sub_25E7A84C0();
    swift_allocError();
    long long v35 = xmmword_25E7BEBA0;
    goto LABEL_23;
  }
  uint64_t v3 = swift_bridgeObjectRetain();
  sub_25E7A5D5C(v3, (uint64_t)&v58);
  swift_bridgeObjectRelease();
  if (v59) {
    sub_25E77D724(v60, v61);
  }
  uint64_t v11 = sub_25E7BA5C8();
  if (v11 == 5)
  {
    if (qword_26A7065C0 != -1) {
      swift_once();
    }
    uint64_t v12 = sub_25E7BC2E0();
    __swift_project_value_buffer(v12, (uint64_t)qword_26A7089C8);
    swift_bridgeObjectRetain();
    uint64_t v13 = sub_25E7BC2C0();
    os_log_type_t v14 = sub_25E7BC490();
    if (os_log_type_enabled(v13, v14))
    {
      unint64_t v15 = (uint8_t *)swift_slowAlloc();
      uint64_t v2 = swift_slowAlloc();
      uint64_t v58 = v2;
      *(_DWORD *)unint64_t v15 = 136315138;
      uint64_t v16 = sub_25E7BC3A0();
      uint64_t v62 = sub_25E77CF40(v16, v17, &v58);
      sub_25E7BC520();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25E775000, v13, v14, "Failed to retrieve anisette request data blob from: %s", v15, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2611E3480](v2, -1, -1);
      MEMORY[0x2611E3480](v15, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    sub_25E7A84C0();
    swift_allocError();
    long long v35 = xmmword_25E7BEB90;
LABEL_23:
    *(_OWORD *)uint64_t v34 = v35;
    *(unsigned char *)(v34 + 16) = 5;
LABEL_24:
    swift_willThrow();
    return v2;
  }
  uint64_t v2 = v11;
  uint64_t v18 = swift_bridgeObjectRetain();
  sub_25E7A5D5C(v18, (uint64_t)&v58);
  swift_bridgeObjectRelease();
  if (!v59)
  {
    if (qword_26A7065C0 != -1) {
      swift_once();
    }
    uint64_t v37 = sub_25E7BC2E0();
    __swift_project_value_buffer(v37, (uint64_t)qword_26A7089C8);
    swift_bridgeObjectRetain();
    id v38 = sub_25E7BC2C0();
    os_log_type_t v39 = sub_25E7BC490();
    if (os_log_type_enabled(v38, v39))
    {
      unint64_t v40 = (uint8_t *)swift_slowAlloc();
      uint64_t v41 = swift_slowAlloc();
      uint64_t v58 = v41;
      *(_DWORD *)unint64_t v40 = 136315138;
      uint64_t v42 = sub_25E7BC3A0();
      uint64_t v62 = sub_25E77CF40(v42, v43, &v58);
      sub_25E7BC520();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25E775000, v38, v39, "Failed to retrieve anisette request data blob from: %s", v40, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2611E3480](v41, -1, -1);
      MEMORY[0x2611E3480](v40, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    uint64_t v44 = 8 * (char)v2;
    uint64_t v45 = *(void *)&aProvisiosync[v44];
    uint64_t v46 = *(void *)&aN[v44];
    sub_25E7A84C0();
    swift_allocError();
    *(void *)uint64_t v47 = v45;
    *(void *)(v47 + 8) = v46;
    *(unsigned char *)(v47 + 16) = 0;
    goto LABEL_24;
  }
  uint64_t v19 = v60;
  unint64_t v20 = v61;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_25E78314C(0, &qword_26A706C98);
  type metadata accessor for AnisetteServiceFactory.AnisetteRequest();
  uint64_t v21 = sub_25E7BC4B0();
  BOOL v22 = v1;
  if (!v1)
  {
    if (v21)
    {
      sub_25E77D724(v19, v20);
      return v2;
    }
    if (qword_26A7065C0 != -1) {
      swift_once();
    }
    uint64_t v48 = sub_25E7BC2E0();
    __swift_project_value_buffer(v48, (uint64_t)qword_26A7089C8);
    sub_25E77CE0C(v19, v20);
    sub_25E77CE0C(v19, v20);
    uint64_t v49 = sub_25E7BC2C0();
    os_log_type_t v50 = sub_25E7BC490();
    if (os_log_type_enabled(v49, v50))
    {
      os_log_type_t v51 = (uint8_t *)swift_slowAlloc();
      uint64_t v57 = swift_slowAlloc();
      uint64_t v58 = v57;
      *(_DWORD *)os_log_type_t v51 = 136315138;
      uint64_t v52 = sub_25E7BC1F0();
      uint64_t v62 = sub_25E77CF40(v52, v53, &v58);
      sub_25E7BC520();
      swift_bridgeObjectRelease();
      sub_25E77D724(v19, v20);
      sub_25E77D724(v19, v20);
      _os_log_impl(&dword_25E775000, v49, v50, "Failed to unarchive anisette request from: %s", v51, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2611E3480](v57, -1, -1);
      MEMORY[0x2611E3480](v51, -1, -1);
    }
    else
    {
      sub_25E77D724(v19, v20);
      sub_25E77D724(v19, v20);
    }

    uint64_t v54 = 8 * (char)v2;
    uint64_t v55 = *(void *)&aProvisiosync[v54];
    uint64_t v2 = *(void *)&aN[v54];
    sub_25E7A84C0();
    BOOL v22 = (void *)swift_allocError();
    *(void *)uint64_t v56 = v55;
    *(void *)(v56 + 8) = v2;
    *(unsigned char *)(v56 + 16) = 2;
    swift_willThrow();
  }
  if (qword_26A7065C0 != -1) {
    swift_once();
  }
  uint64_t v23 = sub_25E7BC2E0();
  __swift_project_value_buffer(v23, (uint64_t)qword_26A7089C8);
  sub_25E77CE0C(v19, v20);
  id v24 = v22;
  sub_25E77CE0C(v19, v20);
  id v25 = v22;
  long long v26 = sub_25E7BC2C0();
  os_log_type_t v27 = sub_25E7BC490();
  if (os_log_type_enabled(v26, v27))
  {
    uint64_t v2 = swift_slowAlloc();
    uint64_t v28 = swift_slowAlloc();
    uint64_t v58 = v28;
    *(_DWORD *)uint64_t v2 = 136315394;
    uint64_t v29 = sub_25E7BC1F0();
    uint64_t v62 = sub_25E77CF40(v29, v30, &v58);
    sub_25E7BC520();
    swift_bridgeObjectRelease();
    sub_25E77D724(v19, v20);
    sub_25E77D724(v19, v20);
    *(_WORD *)(v2 + 12) = 2080;
    uint64_t v62 = (uint64_t)v22;
    id v31 = v22;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A706DD0);
    uint64_t v32 = sub_25E7BC3F0();
    uint64_t v62 = sub_25E77CF40(v32, v33, &v58);
    sub_25E7BC520();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_25E775000, v26, v27, "Failed to unarchive anisette request from: %s with error: %s", (uint8_t *)v2, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x2611E3480](v28, -1, -1);
    MEMORY[0x2611E3480](v2, -1, -1);
  }
  else
  {
    sub_25E77D724(v19, v20);
    sub_25E77D724(v19, v20);
  }
  swift_willThrow();
  sub_25E77D724(v19, v20);
  return v2;
}

unint64_t sub_25E7A84C0()
{
  unint64_t result = qword_26A706C80;
  if (!qword_26A706C80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A706C80);
  }
  return result;
}

uint64_t sub_25E7A8514()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_25E7A854C(void *a1, uint64_t a2)
{
  return sub_25E7A7328(a1, a2, *(void (**)(uint64_t, void, unint64_t))(v2 + 16));
}

uint64_t block_copy_helper_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_2()
{
  return swift_release();
}

uint64_t sub_25E7A856C(void *a1, uint64_t a2)
{
  return sub_25E7A7114(a1, a2, *(void (**)(uint64_t, void, unint64_t))(v2 + 16));
}

uint64_t sub_25E7A8574(char a1, uint64_t a2)
{
  return sub_25E7A6F3C(a1, a2, *(void (**)(uint64_t, void, unint64_t))(v2 + 16));
}

uint64_t sub_25E7A857C(char a1, uint64_t a2)
{
  return sub_25E7A6D68(a1, a2, *(void (**)(uint64_t, void, unint64_t))(v2 + 16));
}

uint64_t sub_25E7A8584(char a1, uint64_t a2)
{
  return sub_25E7A6B7C(a1, a2, *(void (**)(uint64_t, void, unint64_t))(v2 + 16));
}

uint64_t static AnalyticsError.__derived_enum_equals(_:_:)()
{
  return 1;
}

uint64_t AnalyticsError.hash(into:)()
{
  return sub_25E7BC790();
}

uint64_t AnalyticsError.hashValue.getter()
{
  return sub_25E7BC7A0();
}

uint64_t sub_25E7A8630()
{
  return sub_25E7BC7A0();
}

uint64_t sub_25E7A8674()
{
  return sub_25E7BC790();
}

uint64_t sub_25E7A869C()
{
  return sub_25E7BC7A0();
}

unint64_t sub_25E7A86E0()
{
  unint64_t result = qword_26A706CB0;
  if (!qword_26A706CB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A706CB0);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for AnalyticsError(unsigned char *result, int a2, int a3)
{
  if ((a3 + 1) >= 0x10000) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) < 0x100) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2)
  {
    switch(v5)
    {
      case 1:
        *unint64_t result = a2;
        return result;
      case 2:
        *(_WORD *)unint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)unint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *unint64_t result = 0;
      break;
    case 2:
      *(_WORD *)unint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x25E7A87D0);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for AnalyticsError()
{
  return &type metadata for AnalyticsError;
}

unint64_t sub_25E7A8808(uint64_t a1, uint64_t a2)
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  uint64_t v5 = *(void *)(a1 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](a1, a2);
  uint64_t v8 = (char *)&v33 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6, v9);
  uint64_t v11 = (char *)&v33 - v10;
  sub_25E7BC150();
  swift_allocObject();
  sub_25E7BC140();
  uint64_t v12 = sub_25E7BC130();
  unint64_t v14 = v13;
  swift_release();
  if (!v3)
  {
    uint64_t v38 = v5;
    uint64_t v16 = self;
    unint64_t v17 = (void *)sub_25E7BC200();
    v40[0] = 0;
    id v18 = objc_msgSend(v16, sel_JSONObjectWithData_options_error_, v17, 0, v40);

    id v19 = v40[0];
    if (v18)
    {
      sub_25E7BC540();
      swift_unknownObjectRelease();
      sub_25E77D9C8((uint64_t)v41, (uint64_t)v40);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A706CC0);
      if (swift_dynamicCast())
      {
        sub_25E77D724(v12, v14);
        unint64_t v14 = v39;
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v41);
      }
      else
      {
        if (qword_26A7065F8 != -1) {
          swift_once();
        }
        uint64_t v21 = sub_25E7BC2E0();
        __swift_project_value_buffer(v21, (uint64_t)qword_26A708A70);
        uint64_t v22 = v38;
        uint64_t v37 = *(void (**)(char *, uint64_t, uint64_t))(v38 + 16);
        v37(v11, v2, a1);
        uint64_t v23 = sub_25E7BC2C0();
        os_log_type_t v24 = sub_25E7BC490();
        int v25 = v24;
        if (os_log_type_enabled(v23, v24))
        {
          uint64_t v26 = swift_slowAlloc();
          int v36 = v25;
          os_log_type_t v27 = (uint8_t *)v26;
          long long v35 = (void *)swift_slowAlloc();
          v40[0] = v35;
          unint64_t v33 = v27;
          os_log_t v34 = v23;
          *(_DWORD *)os_log_type_t v27 = 136315138;
          v37(v8, (uint64_t)v11, a1);
          uint64_t v28 = sub_25E7BC3F0();
          uint64_t v39 = sub_25E77CF40(v28, v29, (uint64_t *)v40);
          sub_25E7BC520();
          swift_bridgeObjectRelease();
          (*(void (**)(char *, uint64_t))(v22 + 8))(v11, a1);
          id v31 = v33;
          os_log_t v30 = v34;
          _os_log_impl(&dword_25E775000, v34, (os_log_type_t)v36, "Failed to encode object as [String: NSObject]: %s", v33, 0xCu);
          uint64_t v32 = v35;
          swift_arrayDestroy();
          MEMORY[0x2611E3480](v32, -1, -1);
          MEMORY[0x2611E3480](v31, -1, -1);
        }
        else
        {
          (*(void (**)(char *, uint64_t))(v22 + 8))(v11, a1);
        }
        sub_25E7AA9A8();
        swift_allocError();
        swift_willThrow();
        sub_25E77D724(v12, v14);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v41);
      }
    }
    else
    {
      unint64_t v20 = v19;
      sub_25E7BC1E0();

      swift_willThrow();
      sub_25E77D724(v12, v14);
    }
  }
  return v14;
}

uint64_t sub_25E7A8C6C()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return MEMORY[0x270FA0228](v0, 56, 7);
}

uint64_t type metadata accessor for AnalyticsManager()
{
  return self;
}

unint64_t sub_25E7A8CC8(uint64_t a1)
{
  uint64_t v2 = sub_25E7BC560();
  return sub_25E7A8D84(a1, v2);
}

unint64_t sub_25E7A8D0C(uint64_t a1, uint64_t a2)
{
  sub_25E7BC780();
  sub_25E7BC400();
  uint64_t v4 = sub_25E7BC7A0();
  return sub_25E7A8E4C(a1, a2, v4);
}

unint64_t sub_25E7A8D84(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v6 = ~v3;
    do
    {
      sub_25E797280(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      char v7 = MEMORY[0x2611E2C30](v9, a1);
      sub_25E798CA4((uint64_t)v9);
      if (v7) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v6;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

unint64_t sub_25E7A8E4C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_25E7BC6D0() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        unint64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_25E7BC6D0() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_25E7A8F30(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A706A98);
  uint64_t v6 = sub_25E7BC650();
  uint64_t v7 = v6;
  if (*(void *)(v5 + 16))
  {
    uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
    os_log_t v34 = (void *)(v5 + 64);
    if (v8 < 64) {
      uint64_t v9 = ~(-1 << v8);
    }
    else {
      uint64_t v9 = -1;
    }
    unint64_t v10 = v9 & *(void *)(v5 + 64);
    int64_t v33 = (unint64_t)(v8 + 63) >> 6;
    uint64_t v11 = v6 + 64;
    uint64_t result = swift_retain();
    int64_t v13 = 0;
    while (1)
    {
      if (v10)
      {
        unint64_t v16 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        unint64_t v17 = v16 | (v13 << 6);
      }
      else
      {
        int64_t v18 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        if (v18 >= v33) {
          goto LABEL_34;
        }
        unint64_t v19 = v34[v18];
        ++v13;
        if (!v19)
        {
          int64_t v13 = v18 + 1;
          if (v18 + 1 >= v33) {
            goto LABEL_34;
          }
          unint64_t v19 = v34[v13];
          if (!v19)
          {
            int64_t v20 = v18 + 2;
            if (v20 >= v33)
            {
LABEL_34:
              swift_release();
              uint64_t v3 = v2;
              if (a2)
              {
                uint64_t v32 = 1 << *(unsigned char *)(v5 + 32);
                if (v32 >= 64) {
                  bzero(v34, ((unint64_t)(v32 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *os_log_t v34 = -1 << v32;
                }
                *(void *)(v5 + 16) = 0;
              }
              break;
            }
            unint64_t v19 = v34[v20];
            if (!v19)
            {
              while (1)
              {
                int64_t v13 = v20 + 1;
                if (__OFADD__(v20, 1)) {
                  goto LABEL_41;
                }
                if (v13 >= v33) {
                  goto LABEL_34;
                }
                unint64_t v19 = v34[v13];
                ++v20;
                if (v19) {
                  goto LABEL_21;
                }
              }
            }
            int64_t v13 = v20;
          }
        }
LABEL_21:
        unint64_t v10 = (v19 - 1) & v19;
        unint64_t v17 = __clz(__rbit64(v19)) + (v13 << 6);
      }
      uint64_t v21 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v17);
      uint64_t v23 = *v21;
      uint64_t v22 = v21[1];
      os_log_type_t v24 = (_OWORD *)(*(void *)(v5 + 56) + 32 * v17);
      if (a2)
      {
        sub_25E796898(v24, v35);
      }
      else
      {
        sub_25E77D9C8((uint64_t)v24, (uint64_t)v35);
        swift_bridgeObjectRetain();
      }
      sub_25E7BC780();
      sub_25E7BC400();
      uint64_t result = sub_25E7BC7A0();
      uint64_t v25 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v26 = result & ~v25;
      unint64_t v27 = v26 >> 6;
      if (((-1 << v26) & ~*(void *)(v11 + 8 * (v26 >> 6))) != 0)
      {
        unint64_t v14 = __clz(__rbit64((-1 << v26) & ~*(void *)(v11 + 8 * (v26 >> 6)))) | v26 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v28 = 0;
        unint64_t v29 = (unint64_t)(63 - v25) >> 6;
        do
        {
          if (++v27 == v29 && (v28 & 1) != 0)
          {
            __break(1u);
            goto LABEL_40;
          }
          BOOL v30 = v27 == v29;
          if (v27 == v29) {
            unint64_t v27 = 0;
          }
          v28 |= v30;
          uint64_t v31 = *(void *)(v11 + 8 * v27);
        }
        while (v31 == -1);
        unint64_t v14 = __clz(__rbit64(~v31)) + (v27 << 6);
      }
      *(void *)(v11 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
      unint64_t v15 = (void *)(*(void *)(v7 + 48) + 16 * v14);
      *unint64_t v15 = v23;
      v15[1] = v22;
      uint64_t result = (uint64_t)sub_25E796898(v35, (_OWORD *)(*(void *)(v7 + 56) + 32 * v14));
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_25E7A9230(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A706A88);
  uint64_t v6 = sub_25E7BC650();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_41;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v36 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  int64_t v11 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v12 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v14 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v20 = v19 | (v14 << 6);
      goto LABEL_22;
    }
    int64_t v21 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v21 >= v11) {
      break;
    }
    uint64_t v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v36 + 8 * v21);
    ++v14;
    if (!v23)
    {
      int64_t v14 = v21 + 1;
      if (v21 + 1 >= v11) {
        goto LABEL_34;
      }
      unint64_t v23 = *(void *)(v36 + 8 * v14);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v11)
        {
LABEL_34:
          swift_release();
          if ((a2 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v23 = *(void *)(v36 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v14 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_43;
            }
            if (v14 >= v11) {
              goto LABEL_34;
            }
            unint64_t v23 = *(void *)(v36 + 8 * v14);
            ++v24;
            if (v23) {
              goto LABEL_21;
            }
          }
        }
        int64_t v14 = v24;
      }
    }
LABEL_21:
    unint64_t v10 = (v23 - 1) & v23;
    unint64_t v20 = __clz(__rbit64(v23)) + (v14 << 6);
LABEL_22:
    uint64_t v25 = *(void *)(v5 + 48) + 40 * v20;
    if (a2)
    {
      long long v26 = *(_OWORD *)v25;
      long long v27 = *(_OWORD *)(v25 + 16);
      uint64_t v40 = *(void *)(v25 + 32);
      long long v38 = v26;
      long long v39 = v27;
      sub_25E796898((_OWORD *)(*(void *)(v5 + 56) + 32 * v20), v37);
    }
    else
    {
      sub_25E797280(v25, (uint64_t)&v38);
      sub_25E77D9C8(*(void *)(v5 + 56) + 32 * v20, (uint64_t)v37);
    }
    uint64_t result = sub_25E7BC560();
    uint64_t v28 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v29 = result & ~v28;
    unint64_t v30 = v29 >> 6;
    if (((-1 << v29) & ~*(void *)(v12 + 8 * (v29 >> 6))) != 0)
    {
      unint64_t v15 = __clz(__rbit64((-1 << v29) & ~*(void *)(v12 + 8 * (v29 >> 6)))) | v29 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v31 = 0;
      unint64_t v32 = (unint64_t)(63 - v28) >> 6;
      do
      {
        if (++v30 == v32 && (v31 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        BOOL v33 = v30 == v32;
        if (v30 == v32) {
          unint64_t v30 = 0;
        }
        v31 |= v33;
        uint64_t v34 = *(void *)(v12 + 8 * v30);
      }
      while (v34 == -1);
      unint64_t v15 = __clz(__rbit64(~v34)) + (v30 << 6);
    }
    *(void *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
    uint64_t v16 = *(void *)(v7 + 48) + 40 * v15;
    long long v17 = v38;
    long long v18 = v39;
    *(void *)(v16 + 32) = v40;
    *(_OWORD *)uint64_t v16 = v17;
    *(_OWORD *)(v16 + 16) = v18;
    uint64_t result = (uint64_t)sub_25E796898(v37, (_OWORD *)(*(void *)(v7 + 56) + 32 * v15));
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v22 = (void *)(v5 + 64);
  if ((a2 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v35 = 1 << *(unsigned char *)(v5 + 32);
  if (v35 >= 64) {
    bzero(v22, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v22 = -1 << v35;
  }
  *(void *)(v5 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_25E7A9548(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A706A08);
  char v38 = a2;
  uint64_t v6 = sub_25E7BC650();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v37 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  uint64_t v35 = v2;
  int64_t v36 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v20 = v19 | (v13 << 6);
      goto LABEL_31;
    }
    int64_t v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v36) {
      break;
    }
    uint64_t v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v37 + 8 * v21);
    ++v13;
    if (!v23)
    {
      int64_t v13 = v21 + 1;
      if (v21 + 1 >= v36) {
        goto LABEL_33;
      }
      unint64_t v23 = *(void *)(v37 + 8 * v13);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v36)
        {
LABEL_33:
          swift_release();
          uint64_t v3 = v35;
          if ((v38 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v23 = *(void *)(v37 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v13 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v36) {
              goto LABEL_33;
            }
            unint64_t v23 = *(void *)(v37 + 8 * v13);
            ++v24;
            if (v23) {
              goto LABEL_30;
            }
          }
        }
        int64_t v13 = v24;
      }
    }
LABEL_30:
    unint64_t v10 = (v23 - 1) & v23;
    unint64_t v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_31:
    unint64_t v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v20);
    uint64_t v31 = *v29;
    uint64_t v30 = v29[1];
    unint64_t v32 = *(void **)(*(void *)(v5 + 56) + 8 * v20);
    if ((v38 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      id v33 = v32;
    }
    sub_25E7BC780();
    sub_25E7BC400();
    uint64_t result = sub_25E7BC7A0();
    uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v15 = result & ~v14;
    unint64_t v16 = v15 >> 6;
    if (((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v27 = v16 == v26;
        if (v16 == v26) {
          unint64_t v16 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v11 + 8 * v16);
      }
      while (v28 == -1);
      unint64_t v17 = __clz(__rbit64(~v28)) + (v16 << 6);
    }
    *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    long long v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    *long long v18 = v31;
    v18[1] = v30;
    *(void *)(*(void *)(v7 + 56) + 8 * v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v35;
  uint64_t v22 = (void *)(v5 + 64);
  if ((v38 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v34 = 1 << *(unsigned char *)(v5 + 32);
  if (v34 >= 64) {
    bzero(v22, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v22 = -1 << v34;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

void *sub_25E7A9858()
{
  unint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A706A98);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_25E7BC640();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = (void *)swift_release();
LABEL_28:
    *unint64_t v1 = v4;
    return result;
  }
  char v25 = v1;
  uint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v22 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      int64_t v9 = v22 + 1;
      if (v22 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v23 = *(void *)(v6 + 8 * v9);
      if (!v23) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v23 - 1) & v23;
    unint64_t v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    unint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    uint64_t v20 = 32 * v15;
    sub_25E77D9C8(*(void *)(v2 + 56) + 32 * v15, (uint64_t)v26);
    int64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *int64_t v21 = v19;
    v21[1] = v18;
    sub_25E796898(v26, (_OWORD *)(*(void *)(v4 + 56) + v20));
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v13)
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    unint64_t v1 = v25;
    goto LABEL_28;
  }
  unint64_t v23 = *(void *)(v6 + 8 * v24);
  if (v23)
  {
    int64_t v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v9);
    ++v24;
    if (v23) {
      goto LABEL_25;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

void *sub_25E7A9A40()
{
  unint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A706A88);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_25E7BC640();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    *unint64_t v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v21 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v21 >= v13) {
      goto LABEL_26;
    }
    unint64_t v22 = *(void *)(v6 + 8 * v21);
    ++v9;
    if (!v22)
    {
      int64_t v9 = v21 + 1;
      if (v21 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v22 = *(void *)(v6 + 8 * v9);
      if (!v22) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v22 - 1) & v22;
    unint64_t v15 = __clz(__rbit64(v22)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 40 * v15;
    sub_25E797280(*(void *)(v2 + 48) + 40 * v15, (uint64_t)v25);
    uint64_t v17 = 32 * v15;
    sub_25E77D9C8(*(void *)(v2 + 56) + v17, (uint64_t)v24);
    uint64_t v18 = *(void *)(v4 + 48) + v16;
    long long v19 = v25[0];
    long long v20 = v25[1];
    *(void *)(v18 + 32) = v26;
    *(_OWORD *)uint64_t v18 = v19;
    *(_OWORD *)(v18 + 16) = v20;
    uint64_t result = sub_25E796898(v24, (_OWORD *)(*(void *)(v4 + 56) + v17));
  }
  int64_t v23 = v21 + 2;
  if (v23 >= v13) {
    goto LABEL_26;
  }
  unint64_t v22 = *(void *)(v6 + 8 * v23);
  if (v22)
  {
    int64_t v9 = v23;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v23 + 1;
    if (__OFADD__(v23, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v22 = *(void *)(v6 + 8 * v9);
    ++v23;
    if (v22) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

id sub_25E7A9C28()
{
  unint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A706A08);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_25E7BC640();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (id)swift_release();
    *unint64_t v1 = v4;
    return result;
  }
  id result = (id)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v22 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      int64_t v9 = v22 + 1;
      if (v22 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v23 = *(void *)(v6 + 8 * v9);
      if (!v23) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v23 - 1) & v23;
    unint64_t v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (void *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v18 = v17[1];
    uint64_t v19 = 8 * v15;
    long long v20 = *(void **)(*(void *)(v2 + 56) + v19);
    int64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *int64_t v21 = *v17;
    v21[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    id result = v20;
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v13) {
    goto LABEL_26;
  }
  unint64_t v23 = *(void *)(v6 + 8 * v24);
  if (v23)
  {
    int64_t v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v9);
    ++v24;
    if (v23) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_25E7A9DDC(uint64_t a1, uint64_t a2, uint64_t a3, char a4, void *a5)
{
  swift_bridgeObjectRetain();
  swift_retain();
  sub_25E7AA134();
  if (!v8) {
    goto LABEL_23;
  }
  uint64_t v10 = v7;
  uint64_t v11 = v8;
  uint64_t v54 = v9;
  unint64_t v12 = (void *)*a5;
  unint64_t v14 = sub_25E7A8D0C(v7, v8);
  uint64_t v15 = v12[2];
  BOOL v16 = (v13 & 1) == 0;
  uint64_t v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  char v18 = v13;
  if (v12[3] >= v17)
  {
    if (a4)
    {
      int64_t v21 = (void *)*a5;
      if (v13) {
        goto LABEL_9;
      }
    }
    else
    {
      sub_25E7A9C28();
      int64_t v21 = (void *)*a5;
      if (v18) {
        goto LABEL_9;
      }
    }
LABEL_11:
    v21[(v14 >> 6) + 8] |= 1 << v14;
    char v25 = (uint64_t *)(v21[6] + 16 * v14);
    *char v25 = v10;
    v25[1] = v11;
    *(void *)(v21[7] + 8 * v14) = v54;
    uint64_t v26 = v21[2];
    BOOL v27 = __OFADD__(v26, 1);
    uint64_t v28 = v26 + 1;
    if (v27)
    {
LABEL_25:
      __break(1u);
      goto LABEL_26;
    }
    v21[2] = v28;
LABEL_13:
    sub_25E7AA134();
    if (v30)
    {
      uint64_t v32 = v29;
      uint64_t v33 = v30;
      uint64_t v34 = v31;
      do
      {
        uint64_t v41 = (void *)*a5;
        unint64_t v42 = sub_25E7A8D0C(v32, v33);
        uint64_t v44 = v41[2];
        BOOL v45 = (v43 & 1) == 0;
        BOOL v27 = __OFADD__(v44, v45);
        uint64_t v46 = v44 + v45;
        if (v27) {
          goto LABEL_24;
        }
        char v47 = v43;
        if (v41[3] < v46)
        {
          sub_25E7A9548(v46, 1);
          unint64_t v42 = sub_25E7A8D0C(v32, v33);
          if ((v47 & 1) != (v48 & 1)) {
            goto LABEL_26;
          }
        }
        uint64_t v49 = (void *)*a5;
        if (v47)
        {
          uint64_t v35 = 8 * v42;
          id v36 = *(id *)(v49[7] + 8 * v42);
          swift_bridgeObjectRelease();

          uint64_t v37 = v49[7];
          *(void *)(v37 + v35) = v36;
        }
        else
        {
          v49[(v42 >> 6) + 8] |= 1 << v42;
          os_log_type_t v50 = (uint64_t *)(v49[6] + 16 * v42);
          *os_log_type_t v50 = v32;
          v50[1] = v33;
          *(void *)(v49[7] + 8 * v42) = v34;
          uint64_t v51 = v49[2];
          BOOL v27 = __OFADD__(v51, 1);
          uint64_t v52 = v51 + 1;
          if (v27) {
            goto LABEL_25;
          }
          v49[2] = v52;
        }
        sub_25E7AA134();
        uint64_t v32 = v38;
        uint64_t v33 = v39;
        uint64_t v34 = v40;
      }
      while (v39);
    }
LABEL_23:
    swift_release();
    swift_bridgeObjectRelease();
    sub_25E79992C();
    return swift_release();
  }
  sub_25E7A9548(v17, a4 & 1);
  unint64_t v19 = sub_25E7A8D0C(v10, v11);
  if ((v18 & 1) == (v20 & 1))
  {
    unint64_t v14 = v19;
    int64_t v21 = (void *)*a5;
    if ((v18 & 1) == 0) {
      goto LABEL_11;
    }
LABEL_9:
    uint64_t v22 = 8 * v14;
    id v23 = *(id *)(v21[7] + 8 * v14);
    swift_bridgeObjectRelease();

    uint64_t v24 = v21[7];
    *(void *)(v24 + v22) = v23;
    goto LABEL_13;
  }
LABEL_26:
  uint64_t result = sub_25E7BC710();
  __break(1u);
  return result;
}

id sub_25E7AA0E8@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v2 = a1[1];
  id v4 = (id)a1[2];
  *a2 = *a1;
  a2[1] = v2;
  a2[2] = v4;
  swift_bridgeObjectRetain();
  return v4;
}

void sub_25E7AA134()
{
  void (*v11)(uint64_t *__return_ptr, void *);
  id v12;
  int64_t v13;
  int64_t v14;
  uint64_t v15;
  unint64_t v16;
  int64_t v17;
  int64_t v18;
  uint64_t v19;
  void v20[3];

  uint64_t v1 = *v0;
  int64_t v3 = v0[3];
  unint64_t v2 = v0[4];
  int64_t v4 = v3;
  if (v2)
  {
    uint64_t v5 = (v2 - 1) & v2;
    unint64_t v6 = __clz(__rbit64(v2)) | (v3 << 6);
LABEL_3:
    uint64_t v7 = (uint64_t *)(*(void *)(v1 + 48) + 16 * v6);
    uint64_t v8 = *v7;
    uint64_t v9 = v7[1];
    uint64_t v10 = *(void **)(*(void *)(v1 + 56) + 8 * v6);
    v0[3] = v4;
    v0[4] = v5;
    uint64_t v11 = (void (*)(uint64_t *__return_ptr, void *))v0[5];
    v20[0] = v8;
    v20[1] = v9;
    v20[2] = v10;
    swift_bridgeObjectRetain();
    unint64_t v12 = v10;
    v11(&v19, v20);

    swift_bridgeObjectRelease();
    return;
  }
  char v13 = v3 + 1;
  if (__OFADD__(v3, 1))
  {
    __break(1u);
  }
  else
  {
    unint64_t v14 = (unint64_t)(v0[2] + 64) >> 6;
    if (v13 < v14)
    {
      uint64_t v15 = v0[1];
      BOOL v16 = *(void *)(v15 + 8 * v13);
      if (v16)
      {
LABEL_7:
        uint64_t v5 = (v16 - 1) & v16;
        unint64_t v6 = __clz(__rbit64(v16)) + (v13 << 6);
        int64_t v4 = v13;
        goto LABEL_3;
      }
      uint64_t v17 = v3 + 2;
      int64_t v4 = v3 + 1;
      if (v3 + 2 < v14)
      {
        BOOL v16 = *(void *)(v15 + 8 * v17);
        if (v16)
        {
LABEL_10:
          char v13 = v17;
          goto LABEL_7;
        }
        int64_t v4 = v3 + 2;
        if (v3 + 3 < v14)
        {
          BOOL v16 = *(void *)(v15 + 8 * (v3 + 3));
          if (v16)
          {
            char v13 = v3 + 3;
            goto LABEL_7;
          }
          uint64_t v17 = v3 + 4;
          int64_t v4 = v3 + 3;
          if (v3 + 4 < v14)
          {
            BOOL v16 = *(void *)(v15 + 8 * v17);
            if (v16) {
              goto LABEL_10;
            }
            char v13 = v3 + 5;
            int64_t v4 = v3 + 4;
            if (v3 + 5 < v14)
            {
              BOOL v16 = *(void *)(v15 + 8 * v13);
              if (v16) {
                goto LABEL_7;
              }
              int64_t v4 = v14 - 1;
              char v18 = v3 + 6;
              while (v14 != v18)
              {
                BOOL v16 = *(void *)(v15 + 8 * v18++);
                if (v16)
                {
                  char v13 = v18 - 1;
                  goto LABEL_7;
                }
              }
            }
          }
        }
      }
    }
    v0[3] = v4;
    v0[4] = 0;
  }
}

NSObject *sub_25E7AA2C8(void *a1)
{
  sub_25E788A5C(MEMORY[0x263F8EE78]);
  swift_bridgeObjectRelease();
  uint64_t v2 = a1[3];
  uint64_t v3 = a1[4];
  __swift_project_boxed_opaque_existential_0(a1, v2);
  int64_t v4 = *(void (**)(uint64_t, uint64_t))(v3 + 48);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v24[3] = AssociatedTypeWitness;
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  v24[4] = AssociatedConformanceWitness;
  __swift_allocate_boxed_opaque_existential_0(v24);
  v4(v2, v3);
  uint64_t v7 = (void *)v24[6];
  unint64_t v8 = sub_25E7A8808(AssociatedTypeWitness, AssociatedConformanceWitness);
  if (v7)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v24);
    if (qword_26A7065F8 != -1) {
      swift_once();
    }
    uint64_t v12 = sub_25E7BC2E0();
    __swift_project_value_buffer(v12, (uint64_t)qword_26A708A70);
    id v13 = v7;
    id v14 = v7;
    id v23 = sub_25E7BC2C0();
    os_log_type_t v15 = sub_25E7BC490();
    if (os_log_type_enabled(v23, v15))
    {
      BOOL v16 = (uint8_t *)swift_slowAlloc();
      uint64_t v17 = (void *)swift_slowAlloc();
      *(_DWORD *)BOOL v16 = 138543362;
      id v18 = v7;
      uint64_t v19 = _swift_stdlib_bridgeErrorToNSError();
      v24[0] = v19;
      sub_25E7BC520();
      *uint64_t v17 = v19;

      _os_log_impl(&dword_25E775000, v23, v15, "Failed to generate dictionary from payload: %{public}@.", v16, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A7069B0);
      swift_arrayDestroy();
      MEMORY[0x2611E3480](v17, -1, -1);
      MEMORY[0x2611E3480](v16, -1, -1);
    }
    else
    {
    }
    swift_willThrow();
  }
  else
  {
    uint64_t v9 = v8;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v24);
    uint64_t v10 = a1[3];
    uint64_t v11 = a1[4];
    __swift_project_boxed_opaque_existential_0(a1, v10);
    unint64_t v21 = sub_25E7A8808(v10, *(void *)(v11 + 8));
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v24[0] = v9;
    sub_25E7A9DDC(v21, (uint64_t)sub_25E7AA0E8, 0, isUniquelyReferenced_nonNull_native, v24);
    id v23 = v24[0];
    swift_bridgeObjectRelease();
  }
  return v23;
}

void sub_25E7AA5F8(void *a1)
{
  sub_25E7AA2C8(a1);
  if (!v1)
  {
    if (qword_26A7065F8 != -1) {
      swift_once();
    }
    uint64_t v3 = sub_25E7BC2E0();
    __swift_project_value_buffer(v3, (uint64_t)qword_26A708A70);
    sub_25E7AA904((uint64_t)a1, (uint64_t)v19);
    swift_bridgeObjectRetain_n();
    int64_t v4 = sub_25E7BC2C0();
    os_log_type_t v5 = sub_25E7BC4A0();
    if (os_log_type_enabled(v4, v5))
    {
      uint64_t v6 = swift_slowAlloc();
      uint64_t v18 = swift_slowAlloc();
      uint64_t v22 = v18;
      *(_DWORD *)uint64_t v6 = 136446466;
      uint64_t v8 = v20;
      uint64_t v7 = v21;
      __swift_project_boxed_opaque_existential_0(v19, v20);
      uint64_t v9 = (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 32))(v8, v7);
      sub_25E77CF40(v9, v10, &v22);
      sub_25E7BC520();
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v19);
      *(_WORD *)(v6 + 12) = 2082;
      sub_25E7AA968();
      swift_bridgeObjectRetain();
      uint64_t v11 = sub_25E7BC3A0();
      unint64_t v13 = v12;
      swift_bridgeObjectRelease();
      sub_25E77CF40(v11, v13, &v22);
      sub_25E7BC520();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25E775000, v4, v5, "Sending analytics event \"%{public}s\" with payload %{public}s.", (uint8_t *)v6, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x2611E3480](v18, -1, -1);
      MEMORY[0x2611E3480](v6, -1, -1);
    }
    else
    {
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v19);

      swift_bridgeObjectRelease_n();
    }
    uint64_t v14 = a1[3];
    uint64_t v15 = a1[4];
    __swift_project_boxed_opaque_existential_0(a1, v14);
    (*(void (**)(uint64_t, uint64_t))(v15 + 32))(v14, v15);
    BOOL v16 = (void *)sub_25E7BC3D0();
    sub_25E7AA968();
    uint64_t v17 = (void *)sub_25E7BC370();
    AnalyticsSendEvent();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
}

uint64_t sub_25E7AA904(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_25E7AA968()
{
  unint64_t result = qword_26A706CB8;
  if (!qword_26A706CB8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26A706CB8);
  }
  return result;
}

unint64_t sub_25E7AA9A8()
{
  unint64_t result = qword_26A706CC8;
  if (!qword_26A706CC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A706CC8);
  }
  return result;
}

uint64_t sub_25E7AA9FC(unsigned int a1, uint64_t a2, unint64_t a3)
{
  uint64_t v4 = v3;
  if (qword_26A7065D8 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_25E7BC2E0();
  __swift_project_value_buffer(v8, (uint64_t)qword_26A708A10);
  swift_bridgeObjectRetain_n();
  uint64_t v9 = sub_25E7BC2C0();
  os_log_type_t v10 = sub_25E7BC4A0();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = swift_slowAlloc();
    uint64_t v16 = swift_slowAlloc();
    v17[0] = v16;
    *(_DWORD *)uint64_t v11 = 136446722;
    sub_25E77CF40(0xD00000000000001FLL, 0x800000025E7C0D70, v17);
    sub_25E7BC520();
    *(_WORD *)(v11 + 12) = 1026;
    sub_25E7BC520();
    *(_WORD *)(v11 + 18) = 2080;
    swift_bridgeObjectRetain();
    sub_25E77CF40(a2, a3, v17);
    sub_25E7BC520();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_25E775000, v9, v10, "%{public}s invoked with pairing flags: %{public}u and pin: %s", (uint8_t *)v11, 0x1Cu);
    swift_arrayDestroy();
    MEMORY[0x2611E3480](v16, -1, -1);
    MEMORY[0x2611E3480](v11, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  uint64_t v12 = v4 + OBJC_IVAR___WFSetupClientInternal_showPinHandler;
  swift_beginAccess();
  uint64_t v14 = *(void (**)(void, uint64_t, unint64_t))v12;
  uint64_t v13 = *(void *)(v12 + 8);
  sub_25E799D14(v14, v13);
  sub_25E7B0A48(a1, a2, a3, v14, v13);
  return sub_25E785F38((uint64_t)v14);
}

void sub_25E7AAC70(uint64_t a1, int a2)
{
  uint64_t v3 = v2;
  if (qword_26A7065D8 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_25E7BC2E0();
  __swift_project_value_buffer(v6, (uint64_t)qword_26A708A10);
  swift_bridgeObjectRetain();
  uint64_t v7 = sub_25E7BC2C0();
  os_log_type_t v8 = sub_25E7BC4A0();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = swift_slowAlloc();
    *(_DWORD *)uint64_t v9 = 67109376;
    LODWORD(v49[0]) = a2;
    sub_25E7BC520();
    *(_WORD *)(v9 + 8) = 2048;
    v49[0] = *(void *)(a1 + 16);
    sub_25E7BC520();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25E775000, v7, v8, "Received object, flags %u: %ld fields", (uint8_t *)v9, 0x12u);
    MEMORY[0x2611E3480](v9, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease();
  }
  sub_25E7BC580();
  if (*(void *)(a1 + 16) && (unint64_t v10 = sub_25E7A8CC8((uint64_t)v49), (v11 & 1) != 0))
  {
    sub_25E77D9C8(*(void *)(a1 + 56) + 32 * v10, (uint64_t)&v50);
  }
  else
  {
    long long v50 = 0u;
    long long v51 = 0u;
  }
  sub_25E798CA4((uint64_t)v49);
  if (*((void *)&v51 + 1)) {
    swift_dynamicCast();
  }
  else {
    sub_25E7808C8((uint64_t)&v50);
  }
  uint64_t v12 = (void *)sub_25E7BC370();
  uint64_t v13 = (void *)sub_25E7BC3D0();
  id v14 = (id)NSDictionaryGetNSNumber();

  if (!v14)
  {
    __break(1u);
    return;
  }
  char v15 = sub_25E7BC770();

  if (v15 == 2)
  {
    if ((a2 & 1) == 0)
    {
      swift_bridgeObjectRetain_n();
      uint64_t v37 = sub_25E7BC2C0();
      os_log_type_t v38 = sub_25E7BC4A0();
      if (os_log_type_enabled(v37, v38))
      {
        uint64_t v39 = (uint8_t *)swift_slowAlloc();
        uint64_t v40 = swift_slowAlloc();
        v49[0] = v40;
        *(_DWORD *)uint64_t v39 = 136315138;
        swift_bridgeObjectRetain();
        uint64_t v41 = sub_25E7BC3A0();
        unint64_t v43 = v42;
        swift_bridgeObjectRelease();
        *(void *)&long long v50 = sub_25E77CF40(v41, v43, v49);
        sub_25E7BC520();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_25E775000, v37, v38, "Ignoring unencrypted config response: %s", v39, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x2611E3480](v40, -1, -1);
        MEMORY[0x2611E3480](v39, -1, -1);
      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
    }
    uint64_t v44 = sub_25E7BC2C0();
    os_log_type_t v45 = sub_25E7BC4A0();
    if (os_log_type_enabled(v44, v45))
    {
      uint64_t v46 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v46 = 0;
      _os_log_impl(&dword_25E775000, v44, v45, "Config response received", v46, 2u);
      MEMORY[0x2611E3480](v46, -1, -1);
    }

    sub_25E7AD670();
    char v47 = (void (**)(uint64_t))(v3 + OBJC_IVAR___WFSetupClientInternal_receivedObjectHandler);
    swift_beginAccess();
    char v48 = *v47;
    if (*v47)
    {
      swift_retain();
      v48(a1);
      sub_25E785F38((uint64_t)v48);
    }
    *(unsigned char *)(v3 + OBJC_IVAR___WFSetupClientInternal_clientState + 3) = 1;
    uint64_t v33 = sub_25E7BC2C0();
    os_log_type_t v34 = sub_25E7BC4A0();
    if (!os_log_type_enabled(v33, v34)) {
      goto LABEL_38;
    }
    uint64_t v35 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v35 = 0;
    id v36 = "Handled received config response, advancing connection state";
    goto LABEL_37;
  }
  if (v15 == 4)
  {
    id v23 = sub_25E7BC2C0();
    os_log_type_t v24 = sub_25E7BC4A0();
    if (os_log_type_enabled(v23, v24))
    {
      char v25 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)char v25 = 0;
      _os_log_impl(&dword_25E775000, v23, v24, "PreAuth response received", v25, 2u);
      MEMORY[0x2611E3480](v25, -1, -1);
    }

    *(unsigned char *)(v3 + OBJC_IVAR___WFSetupClientInternal_clientState) = 2;
    uint64_t v26 = v3 + OBJC_IVAR___WFSetupClientInternal_setupProgressEventHandler;
    swift_beginAccess();
    uint64_t v28 = *(void (**)(void, void))v26;
    uint64_t v27 = *(void *)(v26 + 8);
    sub_25E799D14(v28, v27);
    sub_25E7ADD10(0xBuLL, 0, 0, v28, v27);
    sub_25E785F38((uint64_t)v28);
    uint64_t v29 = *(void **)(v3 + OBJC_IVAR___WFSetupClientInternal_sfSession);
    if (v29)
    {
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A706D80);
      uint64_t inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_25E7BDF10;
      *(void *)&long long v50 = 28783;
      *((void *)&v50 + 1) = 0xE200000000000000;
      id v31 = v29;
      sub_25E7BC580();
      *(void *)(inited + 96) = MEMORY[0x263F8E548];
      *(_DWORD *)(inited + 72) = 4;
      sub_25E7885A8(inited);
      uint64_t v32 = (void *)sub_25E7BC370();
      swift_bridgeObjectRelease();
      objc_msgSend(v31, sel_sendWithFlags_object_, 0, v32);
    }
    uint64_t v33 = sub_25E7BC2C0();
    os_log_type_t v34 = sub_25E7BC4A0();
    if (!os_log_type_enabled(v33, v34)) {
      goto LABEL_38;
    }
    uint64_t v35 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v35 = 0;
    id v36 = "PreAuth response received signal sent to the server, advancing connection state";
LABEL_37:
    _os_log_impl(&dword_25E775000, v33, v34, v36, v35, 2u);
    MEMORY[0x2611E3480](v35, -1, -1);
LABEL_38:

    sub_25E79FA2C();
    return;
  }
  if (v15 == 5 && (a2 & 1) == 0)
  {
    swift_bridgeObjectRetain_n();
    uint64_t v16 = sub_25E7BC2C0();
    os_log_type_t v17 = sub_25E7BC4A0();
    if (os_log_type_enabled(v16, v17))
    {
      uint64_t v18 = (uint8_t *)swift_slowAlloc();
      uint64_t v19 = swift_slowAlloc();
      v49[0] = v19;
      *(_DWORD *)uint64_t v18 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v20 = sub_25E7BC3A0();
      unint64_t v22 = v21;
      swift_bridgeObjectRelease();
      *(void *)&long long v50 = sub_25E77CF40(v20, v22, v49);
      sub_25E7BC520();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25E775000, v16, v17, "Ignoring unencrypted config message: %s", v18, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2611E3480](v19, -1, -1);
      MEMORY[0x2611E3480](v18, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
}

uint64_t sub_25E7AB5D8(void *a1)
{
  uint64_t v2 = v1;
  if (qword_26A7065D8 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_25E7BC2E0();
  __swift_project_value_buffer(v4, (uint64_t)qword_26A708A10);
  id v5 = a1;
  id v6 = a1;
  uint64_t v7 = sub_25E7BC2C0();
  os_log_type_t v8 = sub_25E7BC4A0();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = swift_slowAlloc();
    uint64_t v10 = swift_slowAlloc();
    v32[0] = v10;
    *(_DWORD *)uint64_t v9 = 136315394;
    sub_25E77CF40(0xD000000000000021, 0x800000025E7C0D40, v32);
    sub_25E7BC520();
    *(_WORD *)(v9 + 12) = 2082;
    id v11 = a1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A706A80);
    uint64_t v12 = sub_25E7BC3F0();
    sub_25E77CF40(v12, v13, v32);
    sub_25E7BC520();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_25E775000, v7, v8, "%s invoked with error: %{public}s", (uint8_t *)v9, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x2611E3480](v10, -1, -1);
    MEMORY[0x2611E3480](v9, -1, -1);

    if (a1)
    {
LABEL_5:
      id v14 = a1;
      char v15 = sub_25E7BC2C0();
      os_log_type_t v16 = sub_25E7BC4A0();
      if (os_log_type_enabled(v15, v16))
      {
        os_log_type_t v17 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)os_log_type_t v17 = 0;
        _os_log_impl(&dword_25E775000, v15, v16, "Failed to establish encrypted channel.", v17, 2u);
        MEMORY[0x2611E3480](v17, -1, -1);
      }

      uint64_t v18 = v2 + OBJC_IVAR___WFSetupClientInternal_setupProgressEventHandler;
      swift_beginAccess();
      uint64_t v20 = *(void (**)(void, void))v18;
      uint64_t v19 = *(void *)(v18 + 8);
      sub_25E799D14(v20, v19);
      sub_25E7ADD10(7uLL, 0, 0, v20, v19);
      sub_25E785F38((uint64_t)v20);
      sub_25E7A08C4(7uLL, (void (*)(void, void, void))sub_25E7AD118, 0);

      goto LABEL_12;
    }
  }
  else
  {

    if (a1) {
      goto LABEL_5;
    }
  }
  unint64_t v21 = sub_25E7BC2C0();
  os_log_type_t v22 = sub_25E7BC4A0();
  if (os_log_type_enabled(v21, v22))
  {
    id v23 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v23 = 0;
    _os_log_impl(&dword_25E775000, v21, v22, "Successfully established encrypted channel. ", v23, 2u);
    MEMORY[0x2611E3480](v23, -1, -1);
  }

  uint64_t v24 = v2 + OBJC_IVAR___WFSetupClientInternal_setupProgressEventHandler;
  swift_beginAccess();
  uint64_t v26 = *(void (**)(void, void))v24;
  uint64_t v25 = *(void *)(v24 + 8);
  sub_25E799D14(v26, v25);
  sub_25E7ADD10(6uLL, 0, 0, v26, v25);
  sub_25E785F38((uint64_t)v26);
  sub_25E7A08C4(6uLL, (void (*)(void, void, void))sub_25E7AD3CC, 0);
  *(unsigned char *)(v2 + OBJC_IVAR___WFSetupClientInternal_clientState + 7) = 1;
LABEL_12:
  uint64_t v27 = sub_25E7BC2C0();
  os_log_type_t v28 = sub_25E7BC4A0();
  if (os_log_type_enabled(v27, v28))
  {
    uint64_t v29 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v29 = 0;
    _os_log_impl(&dword_25E775000, v27, v28, "Handling of pair setup is complete, advancing connection state now that we are securely paired", v29, 2u);
    MEMORY[0x2611E3480](v29, -1, -1);
  }

  return sub_25E79FA2C(v30);
}

uint64_t sub_25E7ABA78(uint64_t a1, void (*a2)(void, void, void))
{
  uint64_t v3 = v2;
  id v5 = (void *)sub_25E7BC370();
  id v6 = (void *)sub_25E7BC3D0();
  id v7 = (id)NSDictionaryGetNSNumber();

  if (!v7)
  {
    __break(1u);
    JUMPOUT(0x25E7AC268);
  }
  unsigned int v8 = sub_25E7BC7B0();

  unint64_t v9 = sub_25E7885A8(MEMORY[0x263F8EE78]);
  if (qword_26A7065D8 != -1) {
    swift_once();
  }
  uint64_t v10 = sub_25E7BC2E0();
  __swift_project_value_buffer(v10, (uint64_t)qword_26A708A10);
  swift_bridgeObjectRetain_n();
  id v11 = sub_25E7BC2C0();
  os_log_type_t v12 = sub_25E7BC4A0();
  if (os_log_type_enabled(v11, v12))
  {
    char v48 = a2;
    uint64_t v13 = swift_slowAlloc();
    uint64_t v47 = swift_slowAlloc();
    v52[0] = v47;
    *(_DWORD *)uint64_t v13 = 136446466;
    SFSetupActionToString_0(v8);
    uint64_t v14 = sub_25E7BC420();
    sub_25E77CF40(v14, v15, v52);
    sub_25E7BC520();
    swift_bridgeObjectRelease();
    *(_WORD *)(v13 + 12) = 2082;
    swift_bridgeObjectRetain();
    uint64_t v16 = sub_25E7BC3A0();
    unint64_t v18 = v17;
    swift_bridgeObjectRelease();
    *(void *)&long long v50 = sub_25E77CF40(v16, v18, v52);
    sub_25E7BC520();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25E775000, v11, v12, "SetupActionRequest: %{public}s, %{public}s", (uint8_t *)v13, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x2611E3480](v47, -1, -1);
    uint64_t v19 = v13;
    a2 = v48;
    MEMORY[0x2611E3480](v19, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  switch(v8)
  {
    case 1u:
      uint64_t v20 = sub_25E7BC370();
      uint64_t v21 = v3 + OBJC_IVAR___WFSetupClientInternal_setupProgressEventHandler;
      swift_beginAccess();
      id v23 = *(void (**)(void, void))v21;
      uint64_t v22 = *(void *)(v21 + 8);
      sub_25E799D14(v23, v22);
      unint64_t v24 = 14;
      goto LABEL_10;
    case 2u:
      uint64_t v20 = sub_25E7BC370();
      uint64_t v25 = v3 + OBJC_IVAR___WFSetupClientInternal_setupProgressEventHandler;
      swift_beginAccess();
      id v23 = *(void (**)(void, void))v25;
      uint64_t v22 = *(void *)(v25 + 8);
      sub_25E799D14(v23, v22);
      unint64_t v24 = 13;
LABEL_10:
      sub_25E7ADD10(v24, v20, 0, v23, v22);
      sub_25E785F38((uint64_t)v23);
      goto LABEL_18;
    case 3u:
      uint64_t v20 = sub_25E7BC2C0();
      os_log_type_t v26 = sub_25E7BC4A0();
      if (!os_log_type_enabled(v20, v26)) {
        goto LABEL_18;
      }
      uint64_t v27 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v27 = 0;
      os_log_type_t v28 = "Unsupported SFSetupActionMigrateStart";
      break;
    case 4u:
      uint64_t v20 = sub_25E7BC2C0();
      os_log_type_t v26 = sub_25E7BC4A0();
      if (!os_log_type_enabled(v20, v26)) {
        goto LABEL_18;
      }
      uint64_t v27 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v27 = 0;
      os_log_type_t v28 = "Unsupported Migrations stop";
      break;
    case 5u:
      uint64_t v20 = sub_25E7BC2C0();
      os_log_type_t v26 = sub_25E7BC4A0();
      if (!os_log_type_enabled(v20, v26)) {
        goto LABEL_18;
      }
      uint64_t v27 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v27 = 0;
      os_log_type_t v28 = "Unsupported SFSetupActionSoftwareUpdate";
      break;
    case 8u:
      uint64_t v37 = sub_25E7BC2C0();
      os_log_type_t v38 = sub_25E7BC4A0();
      if (os_log_type_enabled(v37, v38))
      {
        uint64_t v39 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v39 = 0;
        _os_log_impl(&dword_25E775000, v37, v38, "Received setup action done from server", v39, 2u);
        MEMORY[0x2611E3480](v39, -1, -1);
      }

      *(unsigned char *)(v3 + OBJC_IVAR___WFSetupClientInternal_clientState + 6) = 1;
      uint64_t v40 = v3 + OBJC_IVAR___WFSetupClientInternal_setupProgressEventHandler;
      swift_beginAccess();
      unint64_t v42 = *(void (**)(void, void))v40;
      uint64_t v41 = *(void *)(v40 + 8);
      sub_25E799D14(v42, v41);
      sub_25E7ADD10(0xFuLL, 0, 0, v42, v41);
      sub_25E785F38((uint64_t)v42);
      unint64_t v43 = sub_25E7BC2C0();
      os_log_type_t v44 = sub_25E7BC4A0();
      if (os_log_type_enabled(v43, v44))
      {
        os_log_type_t v45 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)os_log_type_t v45 = 0;
        _os_log_impl(&dword_25E775000, v43, v44, "Handled setup action done, advancing connections state", v45, 2u);
        MEMORY[0x2611E3480](v45, -1, -1);
      }

      sub_25E79FA2C(v46);
      goto LABEL_19;
    default:
      uint64_t v30 = sub_25E7BC2C0();
      os_log_type_t v31 = sub_25E7BC4A0();
      if (os_log_type_enabled(v30, v31))
      {
        uint64_t v32 = (uint8_t *)swift_slowAlloc();
        uint64_t v33 = swift_slowAlloc();
        v52[0] = v33;
        *(_DWORD *)uint64_t v32 = 136446210;
        SFSetupActionToString_0(v8);
        uint64_t v34 = sub_25E7BC420();
        *(void *)&long long v50 = sub_25E77CF40(v34, v35, v52);
        sub_25E7BC520();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_25E775000, v30, v31, "Unsupported SetupAction: %{public}s", v32, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x2611E3480](v33, -1, -1);
        MEMORY[0x2611E3480](v32, -1, -1);
      }

      *((void *)&v50 + 1) = 0xE200000000000000;
      sub_25E7BC580();
      uint64_t v51 = MEMORY[0x263F8E548];
      *(void *)&long long v50 = 4294960589;
      sub_25E796898(&v50, v49);
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      sub_25E796AC4(v49, (uint64_t)v52, isUniquelyReferenced_nonNull_native);
      swift_bridgeObjectRelease();
      sub_25E798CA4((uint64_t)v52);
      goto LABEL_19;
  }
  _os_log_impl(&dword_25E775000, v20, v26, v28, v27, 2u);
  MEMORY[0x2611E3480](v27, -1, -1);
LABEL_18:

LABEL_19:
  a2(0, 0, v9);
  return swift_bridgeObjectRelease();
}

void sub_25E7AC288(uint64_t a1, void (*a2)(void, void, void))
{
  uint64_t v3 = v2;
  if (qword_26A7065D8 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_25E7BC2E0();
  __swift_project_value_buffer(v6, (uint64_t)qword_26A708A10);
  swift_bridgeObjectRetain_n();
  id v7 = sub_25E7BC2C0();
  os_log_type_t v8 = sub_25E7BC4A0();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = swift_slowAlloc();
    uint64_t v31 = swift_slowAlloc();
    v33[0] = v31;
    *(_DWORD *)uint64_t v9 = 136446466;
    *(void *)&long long v34 = sub_25E77CF40(0xD000000000000035, 0x800000025E7C0D00, v33);
    sub_25E7BC520();
    *(_WORD *)(v9 + 12) = 2082;
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_25E7BC3A0();
    unint64_t v12 = v11;
    swift_bridgeObjectRelease();
    *(void *)&long long v34 = sub_25E77CF40(v10, v12, v33);
    sub_25E7BC520();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25E775000, v7, v8, "%{public}s invoked with request: %{public}s", (uint8_t *)v9, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x2611E3480](v31, -1, -1);
    MEMORY[0x2611E3480](v9, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  uint64_t v13 = MEMORY[0x263F8D310];
  sub_25E7BC580();
  if (*(void *)(a1 + 16) && (unint64_t v14 = sub_25E7A8CC8((uint64_t)v33), (v15 & 1) != 0))
  {
    sub_25E77D9C8(*(void *)(a1 + 56) + 32 * v14, (uint64_t)&v34);
  }
  else
  {
    long long v34 = 0u;
    long long v35 = 0u;
  }
  sub_25E798CA4((uint64_t)v33);
  if (!*((void *)&v35 + 1))
  {
    sub_25E7808C8((uint64_t)&v34);
LABEL_15:
    swift_bridgeObjectRetain_n();
    uint64_t v21 = sub_25E7BC2C0();
    os_log_type_t v22 = sub_25E7BC490();
    if (os_log_type_enabled(v21, v22))
    {
      uint64_t v32 = a2;
      id v23 = (uint8_t *)swift_slowAlloc();
      uint64_t v24 = swift_slowAlloc();
      v33[0] = v24;
      *(_DWORD *)id v23 = 136446210;
      swift_bridgeObjectRetain();
      uint64_t v25 = sub_25E7BC3A0();
      unint64_t v27 = v26;
      swift_bridgeObjectRelease();
      *(void *)&long long v34 = sub_25E77CF40(v25, v27, v33);
      sub_25E7BC520();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25E775000, v21, v22, "Failed to retrieve user server interaction event raw value from request: %{public}s", v23, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2611E3480](v24, -1, -1);
      os_log_type_t v28 = v23;
      a2 = v32;
      MEMORY[0x2611E3480](v28, -1, -1);

      if (!v32) {
        return;
      }
    }
    else
    {

      swift_bridgeObjectRelease_n();
      if (!a2) {
        return;
      }
    }
    sub_25E7A50DC();
    uint64_t v29 = (void *)swift_allocError();
    *uint64_t v30 = 0;
    a2(v29, 0, 0);

    return;
  }
  if ((swift_dynamicCast() & 1) == 0) {
    goto LABEL_15;
  }
  uint64_t v16 = v3 + OBJC_IVAR___WFSetupClientInternal_userInteractionProgressEventHandler;
  swift_beginAccess();
  unint64_t v18 = *(void (**)(uint64_t))v16;
  uint64_t v17 = *(void *)(v16 + 8);
  sub_25E799D14(v18, v17);
  sub_25E7B11D8(0xD000000000000015, 0, v18, v17);
  sub_25E785F38((uint64_t)v18);
  if (a2)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A706D80);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_25E7BDF10;
    *(void *)&long long v34 = 0;
    *((void *)&v34 + 1) = 0xE000000000000000;
    sub_25E7BC580();
    *(void *)(inited + 96) = v13;
    *(void *)(inited + 72) = 0;
    *(void *)(inited + 80) = 0xE000000000000000;
    unint64_t v20 = sub_25E7885A8(inited);
    a2(0, 0, v20);
    swift_bridgeObjectRelease();
  }
}

void sub_25E7AC800(uint64_t a1, void (*a2)(void, void, void))
{
  if (qword_26A7065D8 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_25E7BC2E0();
  __swift_project_value_buffer(v4, (uint64_t)qword_26A708A10);
  swift_bridgeObjectRetain_n();
  id v5 = sub_25E7BC2C0();
  os_log_type_t v6 = sub_25E7BC4A0();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = swift_slowAlloc();
    unint64_t v27 = a2;
    uint64_t v8 = swift_slowAlloc();
    v28[0] = v8;
    *(_DWORD *)uint64_t v7 = 136446466;
    *(void *)&long long v29 = sub_25E77CF40(0xD000000000000028, 0x800000025E7C02A0, v28);
    sub_25E7BC520();
    *(_WORD *)(v7 + 12) = 2080;
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_25E7BC3A0();
    unint64_t v11 = v10;
    swift_bridgeObjectRelease();
    *(void *)&long long v29 = sub_25E77CF40(v9, v11, v28);
    sub_25E7BC520();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25E775000, v5, v6, "%{public}s invoked with request: %s", (uint8_t *)v7, 0x16u);
    swift_arrayDestroy();
    uint64_t v12 = v8;
    a2 = v27;
    MEMORY[0x2611E3480](v12, -1, -1);
    MEMORY[0x2611E3480](v7, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  uint64_t v13 = MEMORY[0x263F8D310];
  sub_25E7BC580();
  if (*(void *)(a1 + 16) && (unint64_t v14 = sub_25E7A8CC8((uint64_t)v28), (v15 & 1) != 0))
  {
    sub_25E77D9C8(*(void *)(a1 + 56) + 32 * v14, (uint64_t)&v29);
  }
  else
  {
    long long v29 = 0u;
    long long v30 = 0u;
  }
  sub_25E798CA4((uint64_t)v28);
  if (*((void *)&v30 + 1))
  {
    if (swift_dynamicCast()) {
      return;
    }
  }
  else
  {
    sub_25E7808C8((uint64_t)&v29);
  }
  swift_bridgeObjectRetain_n();
  uint64_t v16 = sub_25E7BC2C0();
  os_log_type_t v17 = sub_25E7BC490();
  if (!os_log_type_enabled(v16, v17))
  {

    swift_bridgeObjectRelease_n();
    if (!a2) {
      return;
    }
    goto LABEL_18;
  }
  unint64_t v18 = (uint8_t *)swift_slowAlloc();
  uint64_t v19 = swift_slowAlloc();
  v28[0] = v19;
  *(_DWORD *)unint64_t v18 = 136446210;
  swift_bridgeObjectRetain();
  uint64_t v20 = sub_25E7BC3A0();
  unint64_t v22 = v21;
  swift_bridgeObjectRelease();
  *(void *)&long long v29 = sub_25E77CF40(v20, v22, v28);
  sub_25E7BC520();
  swift_bridgeObjectRelease_n();
  uint64_t v13 = MEMORY[0x263F8D310];
  swift_bridgeObjectRelease();
  _os_log_impl(&dword_25E775000, v16, v17, "Failed to retrieve security event raw value from request: %{public}s", v18, 0xCu);
  swift_arrayDestroy();
  MEMORY[0x2611E3480](v19, -1, -1);
  MEMORY[0x2611E3480](v18, -1, -1);

  if (a2)
  {
LABEL_18:
    sub_25E7A50DC();
    id v23 = (void *)swift_allocError();
    *uint64_t v24 = 1;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A706D80);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_25E7BDF10;
    v28[0] = 0;
    v28[1] = 0xE000000000000000;
    sub_25E7BC580();
    *(void *)(inited + 96) = v13;
    *(void *)(inited + 72) = 0;
    *(void *)(inited + 80) = 0xE000000000000000;
    unint64_t v26 = sub_25E7885A8(inited);
    a2(v23, 0, v26);
    swift_bridgeObjectRelease();
  }
}

void sub_25E7AD118(void *a1)
{
  if (qword_26A7065D8 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_25E7BC2E0();
  __swift_project_value_buffer(v2, (uint64_t)qword_26A708A10);
  id v3 = a1;
  id v4 = a1;
  id v5 = a1;
  id v6 = a1;
  oslog = sub_25E7BC2C0();
  os_log_type_t v7 = sub_25E7BC4A0();
  if (os_log_type_enabled(oslog, v7))
  {
    uint64_t v8 = swift_slowAlloc();
    uint64_t v9 = swift_slowAlloc();
    uint64_t v18 = v9;
    *(_DWORD *)uint64_t v8 = 136446722;
    unint64_t v10 = WFSetupProgressEventToString_1(7uLL);
    uint64_t v11 = sub_25E7BC3E0();
    unint64_t v13 = v12;

    sub_25E77CF40(v11, v13, &v18);
    sub_25E7BC520();
    swift_bridgeObjectRelease();
    *(_WORD *)(v8 + 12) = 1024;

    sub_25E7BC520();
    *(_WORD *)(v8 + 18) = 2082;
    id v14 = a1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A706A80);
    uint64_t v15 = sub_25E7BC3F0();
    sub_25E77CF40(v15, v16, &v18);
    sub_25E7BC520();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_25E775000, oslog, v7, "Pairing event: (%{public}s sent with success: %{BOOL}d, error: %{public}s", (uint8_t *)v8, 0x1Cu);
    swift_arrayDestroy();
    MEMORY[0x2611E3480](v9, -1, -1);
    MEMORY[0x2611E3480](v8, -1, -1);
  }
  else
  {
  }
}

void sub_25E7AD3CC(void *a1)
{
  if (qword_26A7065D8 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_25E7BC2E0();
  __swift_project_value_buffer(v2, (uint64_t)qword_26A708A10);
  id v3 = a1;
  id v4 = a1;
  oslog = sub_25E7BC2C0();
  os_log_type_t v5 = sub_25E7BC4A0();
  if (os_log_type_enabled(oslog, v5))
  {
    uint64_t v6 = swift_slowAlloc();
    uint64_t v7 = swift_slowAlloc();
    uint64_t v12 = v7;
    *(_DWORD *)uint64_t v6 = 67109378;
    sub_25E7BC520();
    *(_WORD *)(v6 + 8) = 2082;
    id v8 = a1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A706A80);
    uint64_t v9 = sub_25E7BC3F0();
    sub_25E77CF40(v9, v10, &v12);
    sub_25E7BC520();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_25E775000, oslog, v5, "Pairing event sent with success: %{BOOL}d, error: %{public}s", (uint8_t *)v6, 0x12u);
    swift_arrayDestroy();
    MEMORY[0x2611E3480](v7, -1, -1);
    MEMORY[0x2611E3480](v6, -1, -1);
  }
  else
  {
  }
}

uint64_t sub_25E7AD5EC@<X0>(uint64_t (*a1)(void)@<X0>, _DWORD *a2@<X8>)
{
  uint64_t result = a1();
  *a2 = result;
  return result;
}

__CFString *WFSetupProgressEventToString_1(unint64_t a1)
{
  if (a1 <= 0xF)
  {
    uint64_t v1 = off_26552FAC0[a1];
    uint64_t v2 = off_26552FA40[a1];
  }
  return v1;
}

void sub_25E7AD670()
{
  if (qword_26A7065D8 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_25E7BC2E0();
  __swift_project_value_buffer(v0, (uint64_t)qword_26A708A10);
  swift_bridgeObjectRetain_n();
  uint64_t v1 = sub_25E7BC2C0();
  os_log_type_t v2 = sub_25E7BC4A0();
  if (os_log_type_enabled(v1, v2))
  {
    id v3 = (uint8_t *)swift_slowAlloc();
    uint64_t v4 = swift_slowAlloc();
    uint64_t v8 = v4;
    *(_DWORD *)id v3 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v5 = sub_25E7BC3A0();
    unint64_t v7 = v6;
    swift_bridgeObjectRelease();
    sub_25E77CF40(v5, v7, &v8);
    sub_25E7BC520();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25E775000, v1, v2, "Received config response %s", v3, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2611E3480](v4, -1, -1);
    MEMORY[0x2611E3480](v3, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
}

const char *SFSetupActionToString_0(unsigned int a1)
{
  if (a1 > 0xA) {
    return "?";
  }
  else {
    return off_26552F9E8[a1];
  }
}

uint64_t sub_25E7AD874()
{
  uint64_t v0 = sub_25E7BC2E0();
  __swift_allocate_value_buffer(v0, qword_26A7089C8);
  __swift_project_value_buffer(v0, (uint64_t)qword_26A7089C8);
  return sub_25E7BC2D0();
}

uint64_t sub_25E7AD8F0()
{
  uint64_t v0 = sub_25E7BC2E0();
  __swift_allocate_value_buffer(v0, qword_26A7089E0);
  __swift_project_value_buffer(v0, (uint64_t)qword_26A7089E0);
  return sub_25E7BC2D0();
}

uint64_t sub_25E7AD974()
{
  uint64_t v0 = sub_25E7BC2E0();
  __swift_allocate_value_buffer(v0, qword_26A7089F8);
  __swift_project_value_buffer(v0, (uint64_t)qword_26A7089F8);
  return sub_25E7BC2D0();
}

uint64_t sub_25E7AD9F8()
{
  uint64_t v0 = sub_25E7BC2E0();
  __swift_allocate_value_buffer(v0, qword_26A708A10);
  __swift_project_value_buffer(v0, (uint64_t)qword_26A708A10);
  return sub_25E7BC2D0();
}

uint64_t sub_25E7ADA7C()
{
  uint64_t v0 = sub_25E7BC2E0();
  __swift_allocate_value_buffer(v0, qword_26A708A28);
  __swift_project_value_buffer(v0, (uint64_t)qword_26A708A28);
  return sub_25E7BC2D0();
}

uint64_t sub_25E7ADAFC()
{
  uint64_t v0 = sub_25E7BC2E0();
  __swift_allocate_value_buffer(v0, qword_26A708A40);
  __swift_project_value_buffer(v0, (uint64_t)qword_26A708A40);
  return sub_25E7BC2D0();
}

uint64_t sub_25E7ADB80()
{
  uint64_t v0 = sub_25E7BC2E0();
  __swift_allocate_value_buffer(v0, qword_26A708A58);
  __swift_project_value_buffer(v0, (uint64_t)qword_26A708A58);
  return sub_25E7BC2D0();
}

uint64_t sub_25E7ADC00()
{
  uint64_t v0 = sub_25E7BC2E0();
  __swift_allocate_value_buffer(v0, qword_26A708A70);
  __swift_project_value_buffer(v0, (uint64_t)qword_26A708A70);
  return sub_25E7BC2D0();
}

uint64_t *__swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_25E7ADCE8(char a1)
{
  if (a1) {
    return 0x726576726573;
  }
  else {
    return 0x746E65696C63;
  }
}

uint64_t sub_25E7ADD10(unint64_t a1, id a2, int a3, void (*a4)(void, void), uint64_t a5)
{
  int v98 = a3;
  unint64_t v101 = a1;
  uint64_t v8 = sub_25E7BC2E0();
  uint64_t v102 = *(void *)(v8 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v8, v9);
  unint64_t v93 = (char *)&v88 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = MEMORY[0x270FA5388](v10, v12);
  int v96 = (char *)&v88 - v14;
  MEMORY[0x270FA5388](v13, v15);
  os_log_type_t v17 = (char *)&v88 - v16;
  if (qword_26A7065F0 != -1) {
    swift_once();
  }
  uint64_t v18 = __swift_project_value_buffer(v8, (uint64_t)qword_26A708A58);
  uint64_t v19 = v102 + 16;
  uint64_t v100 = *(void (**)(void, void, void))(v102 + 16);
  v100(v17, v18, v8);
  id v20 = a2;
  sub_25E785E00((uint64_t)a4);
  id v21 = v20;
  sub_25E785E00((uint64_t)a4);
  unint64_t v22 = sub_25E7BC2C0();
  LODWORD(v97) = sub_25E7BC4A0();
  BOOL v23 = os_log_type_enabled(v22, (os_log_type_t)v97);
  uint64_t v99 = v8;
  uint64_t v95 = v18;
  if (!v23)
  {

    sub_25E785F38((uint64_t)a4);
    sub_25E785F38((uint64_t)a4);

    os_log_type_t v97 = *(void (**)(void, void))(v102 + 8);
    v97(v17, v8);
    if (!a4) {
      goto LABEL_26;
    }
LABEL_7:
    long long v35 = v96;
    v100(v96, v18, v8);
    sub_25E785E00((uint64_t)a4);
    id v36 = v21;
    sub_25E785E00((uint64_t)a4);
    id v37 = v36;
    sub_25E785E00((uint64_t)a4);
    os_log_type_t v38 = sub_25E7BC2C0();
    os_log_type_t v39 = sub_25E7BC4A0();
    if (os_log_type_enabled(v38, v39))
    {
      uint64_t v40 = swift_slowAlloc();
      uint64_t v100 = (void (*)(void, void, void))v37;
      uint64_t v41 = v40;
      uint64_t v42 = swift_slowAlloc();
      v105[0] = v42;
      *(_DWORD *)uint64_t v41 = 136315650;
      if (v98) {
        uint64_t v43 = 0x726576726573;
      }
      else {
        uint64_t v43 = 0x746E65696C63;
      }
      uint64_t v103 = (id)sub_25E77CF40(v43, 0xE600000000000000, v105);
      sub_25E7BC520();
      swift_bridgeObjectRelease();
      *(_WORD *)(v41 + 12) = 2082;
      uint64_t v103 = a2;
      os_log_type_t v44 = v100;
      id v94 = a2;
      id v45 = v44;
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A706D30);
      uint64_t v46 = sub_25E7BC3F0();
      uint64_t v103 = (id)sub_25E77CF40(v46, v47, v105);
      sub_25E7BC520();

      unint64_t v48 = v101;
      swift_bridgeObjectRelease();
      *(_WORD *)(v41 + 22) = 2082;
      uint64_t v49 = swift_allocObject();
      *(void *)(v49 + 16) = a4;
      *(void *)(v49 + 24) = a5;
      uint64_t v103 = sub_25E7B1C38;
      unint64_t v104 = v49;
      sub_25E785E00((uint64_t)a4);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A706D38);
      uint64_t v50 = sub_25E7BC3F0();
      uint64_t v103 = (id)sub_25E77CF40(v50, v51, v105);
      sub_25E7BC520();
      a2 = v94;
      swift_bridgeObjectRelease();
      sub_25E785F38((uint64_t)a4);
      sub_25E785F38((uint64_t)a4);
      _os_log_impl(&dword_25E775000, v38, v39, "%s publishing message: %{public}s using handler: %{public}s", (uint8_t *)v41, 0x20u);
      swift_arrayDestroy();
      MEMORY[0x2611E3480](v42, -1, -1);
      uint64_t v52 = v41;
      id v37 = v100;
      MEMORY[0x2611E3480](v52, -1, -1);

      v97(v96, v99);
      if (!a2) {
        goto LABEL_16;
      }
    }
    else
    {

      sub_25E785F38((uint64_t)a4);
      sub_25E785F38((uint64_t)a4);

      v97(v35, v8);
      unint64_t v48 = v101;
      if (!a2) {
        goto LABEL_16;
      }
    }
    uint64_t v103 = 0;
    sub_25E7BC380();
    if (v103)
    {
      a4(v48, (uint64_t)v103);
LABEL_20:
      swift_bridgeObjectRelease();
      return sub_25E785F38((uint64_t)a4);
    }
LABEL_16:
    id v53 = v37;
    uint64_t v54 = sub_25E7BC2C0();
    os_log_type_t v55 = sub_25E7BC490();
    if (os_log_type_enabled(v54, v55))
    {
      uint64_t v56 = (uint8_t *)swift_slowAlloc();
      id v57 = (id)swift_slowAlloc();
      uint64_t v103 = v57;
      *(_DWORD *)uint64_t v56 = 136446210;
      v105[0] = (uint64_t)a2;
      id v58 = v53;
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A706D30);
      uint64_t v59 = sub_25E7BC3F0();
      v105[0] = sub_25E77CF40(v59, v60, (uint64_t *)&v103);
      sub_25E7BC520();

      unint64_t v48 = v101;
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25E775000, v54, v55, "Failed to convert message: %{public}s from NSDictionary to [AnyHashable: Any]", v56, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2611E3480](v57, -1, -1);
      MEMORY[0x2611E3480](v56, -1, -1);
    }
    else
    {
    }
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A706D80);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_25E7BDF10;
    uint64_t v103 = 0;
    unint64_t v104 = 0xE000000000000000;
    uint64_t v62 = MEMORY[0x263F8D310];
    sub_25E7BC580();
    *(void *)(inited + 96) = v62;
    *(void *)(inited + 72) = 0;
    *(void *)(inited + 80) = 0xE000000000000000;
    unint64_t v63 = sub_25E7885A8(inited);
    a4(v48, v63);
    goto LABEL_20;
  }
  id v88 = v22;
  uint64_t v91 = v19;
  uint64_t v89 = a5;
  uint64_t v24 = swift_slowAlloc();
  uint64_t v90 = swift_slowAlloc();
  v105[0] = v90;
  *(_DWORD *)uint64_t v24 = 136316162;
  uint64_t v103 = (id)sub_25E77CF40(0xD00000000000001DLL, 0x800000025E7C1040, v105);
  sub_25E7BC520();
  *(_WORD *)(v24 + 12) = 2080;
  uint64_t v25 = WFSetupProgressEventToString_2(v101);
  unint64_t v26 = v21;
  uint64_t v27 = sub_25E7BC3E0();
  unint64_t v29 = v28;

  uint64_t v103 = (id)sub_25E77CF40(v27, v29, v105);
  sub_25E7BC520();
  swift_bridgeObjectRelease();
  *(_WORD *)(v24 + 22) = 2082;
  id v94 = a2;
  uint64_t v103 = a2;
  uint64_t v92 = v26;
  id v30 = v26;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A706D30);
  uint64_t v31 = sub_25E7BC3F0();
  uint64_t v103 = (id)sub_25E77CF40(v31, v32, v105);
  sub_25E7BC520();

  swift_bridgeObjectRelease();
  *(_WORD *)(v24 + 32) = 2082;
  if (a4)
  {
    uint64_t v33 = swift_allocObject();
    a5 = v89;
    *(void *)(v33 + 16) = a4;
    *(void *)(v33 + 24) = a5;
    id v34 = sub_25E7B1CA8;
  }
  else
  {
    id v34 = 0;
    uint64_t v33 = 0;
    a5 = v89;
  }
  unint64_t v65 = v88;
  os_log_type_t v66 = v97;
  uint64_t v103 = v34;
  unint64_t v104 = v33;
  sub_25E785E00((uint64_t)a4);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A706D40);
  uint64_t v67 = sub_25E7BC3F0();
  uint64_t v103 = (id)sub_25E77CF40(v67, v68, v105);
  sub_25E7BC520();
  swift_bridgeObjectRelease();
  sub_25E785F38((uint64_t)a4);
  sub_25E785F38((uint64_t)a4);
  *(_WORD *)(v24 + 42) = 2082;
  if (v98) {
    uint64_t v69 = 0x726576726573;
  }
  else {
    uint64_t v69 = 0x746E65696C63;
  }
  uint64_t v103 = (id)sub_25E77CF40(v69, 0xE600000000000000, v105);
  sub_25E7BC520();
  swift_bridgeObjectRelease();
  _os_log_impl(&dword_25E775000, v65, v66, "%s invoked with event: (%s, message: (%{public}s), handler: %{public}s, publisher: (%{public}s)", (uint8_t *)v24, 0x34u);
  uint64_t v70 = v90;
  swift_arrayDestroy();
  MEMORY[0x2611E3480](v70, -1, -1);
  MEMORY[0x2611E3480](v24, -1, -1);

  uint64_t v8 = v99;
  os_log_type_t v97 = *(void (**)(void, void))(v102 + 8);
  v97(v17, v99);
  a2 = v94;
  uint64_t v18 = v95;
  id v21 = v92;
  if (a4) {
    goto LABEL_7;
  }
LABEL_26:
  unint64_t v71 = v93;
  v100(v93, v18, v8);
  id v72 = v21;
  uint64_t v73 = sub_25E7BC2C0();
  os_log_type_t v74 = sub_25E7BC4A0();
  if (os_log_type_enabled(v73, v74))
  {
    uint64_t v75 = swift_slowAlloc();
    uint64_t v100 = (void (*)(void, void, void))swift_slowAlloc();
    uint64_t v103 = v100;
    *(_DWORD *)uint64_t v75 = 136446722;
    if (v98) {
      uint64_t v76 = 0x726576726573;
    }
    else {
      uint64_t v76 = 0x746E65696C63;
    }
    v105[0] = sub_25E77CF40(v76, 0xE600000000000000, (uint64_t *)&v103);
    sub_25E7BC520();
    swift_bridgeObjectRelease();
    *(_WORD *)(v75 + 12) = 2082;
    uint64_t v77 = WFSetupProgressEventToString_2(v101);
    uint64_t v78 = (uint64_t)a2;
    uint64_t v79 = sub_25E7BC3E0();
    unint64_t v81 = v80;

    v105[0] = sub_25E77CF40(v79, v81, (uint64_t *)&v103);
    sub_25E7BC520();
    swift_bridgeObjectRelease();
    *(_WORD *)(v75 + 22) = 2082;
    v105[0] = v78;
    id v82 = v72;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A706D30);
    uint64_t v83 = sub_25E7BC3F0();
    v105[0] = sub_25E77CF40(v83, v84, (uint64_t *)&v103);
    sub_25E7BC520();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25E775000, v73, v74, "WFSetupProgressHandler is nil. %{public}s unable to publish event: %{public}s, with message: %{public}s", (uint8_t *)v75, 0x20u);
    id v85 = v100;
    swift_arrayDestroy();
    MEMORY[0x2611E3480](v85, -1, -1);
    MEMORY[0x2611E3480](v75, -1, -1);

    uint64_t v86 = v93;
    uint64_t v87 = v99;
  }
  else
  {

    uint64_t v86 = v71;
    uint64_t v87 = v8;
  }
  return ((uint64_t (*)(char *, uint64_t))v97)(v86, v87);
}

uint64_t sub_25E7AEA18(void (*a1)(uint64_t), uint64_t a2, uint64_t a3, int a4)
{
  int v44 = a4;
  uint64_t v7 = sub_25E7BC2E0();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v7, v9);
  uint64_t v12 = (char *)&v36 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10, v13);
  uint64_t v15 = (char *)&v36 - v14;
  if (qword_26A7065F0 != -1) {
    swift_once();
  }
  uint64_t v16 = __swift_project_value_buffer(v7, (uint64_t)qword_26A708A58);
  uint64_t v42 = *(void (**)(char *))(v8 + 16);
  uint64_t v43 = v16;
  v42(v15);
  sub_25E785E00((uint64_t)a1);
  sub_25E785E00((uint64_t)a1);
  os_log_type_t v17 = sub_25E7BC2C0();
  os_log_type_t v18 = sub_25E7BC4A0();
  if (!os_log_type_enabled(v17, v18))
  {
    sub_25E785F38((uint64_t)a1);
    sub_25E785F38((uint64_t)a1);

    unint64_t v22 = *(void (**)(char *, uint64_t))(v8 + 8);
    v22(v15, v7);
    if (!a1) {
      goto LABEL_13;
    }
LABEL_7:
    swift_retain();
    a1(a3);
    return sub_25E785F38((uint64_t)a1);
  }
  uint64_t v38 = a3;
  os_log_type_t v39 = v12;
  uint64_t v19 = swift_slowAlloc();
  uint64_t v37 = swift_slowAlloc();
  uint64_t v46 = v37;
  *(_DWORD *)uint64_t v19 = 136446722;
  v45[0] = sub_25E77CF40(0xD00000000000001CLL, 0x800000025E7C1020, &v46);
  sub_25E7BC520();
  *(_WORD *)(v19 + 12) = 2082;
  uint64_t v40 = v7;
  uint64_t v41 = v8;
  if (a1)
  {
    uint64_t v20 = swift_allocObject();
    *(void *)(v20 + 16) = a1;
    *(void *)(v20 + 24) = a2;
    id v21 = sub_25E7B1BB8;
  }
  else
  {
    id v21 = 0;
    uint64_t v20 = 0;
  }
  v45[0] = (uint64_t)v21;
  v45[1] = v20;
  sub_25E785E00((uint64_t)a1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A706D28);
  uint64_t v24 = sub_25E7BC3F0();
  v45[0] = sub_25E77CF40(v24, v25, &v46);
  sub_25E7BC520();
  swift_bridgeObjectRelease();
  sub_25E785F38((uint64_t)a1);
  sub_25E785F38((uint64_t)a1);
  *(_WORD *)(v19 + 22) = 2082;
  if (v44) {
    uint64_t v26 = 0x726576726573;
  }
  else {
    uint64_t v26 = 0x746E65696C63;
  }
  v45[0] = sub_25E77CF40(v26, 0xE600000000000000, &v46);
  sub_25E7BC520();
  swift_bridgeObjectRelease();
  _os_log_impl(&dword_25E775000, v17, v18, "%{public}s invoked with handler: (%{public}s), publisher: %{public}s", (uint8_t *)v19, 0x20u);
  uint64_t v27 = v37;
  swift_arrayDestroy();
  MEMORY[0x2611E3480](v27, -1, -1);
  MEMORY[0x2611E3480](v19, -1, -1);

  uint64_t v7 = v40;
  uint64_t v8 = v41;
  unint64_t v22 = *(void (**)(char *, uint64_t))(v41 + 8);
  v22(v15, v40);
  a3 = v38;
  uint64_t v12 = v39;
  if (a1) {
    goto LABEL_7;
  }
LABEL_13:
  ((void (*)(char *, uint64_t, uint64_t))v42)(v12, v43, v7);
  unint64_t v28 = sub_25E7BC2C0();
  os_log_type_t v29 = sub_25E7BC4A0();
  if (os_log_type_enabled(v28, v29))
  {
    uint64_t v30 = swift_slowAlloc();
    uint64_t v41 = v8;
    uint64_t v31 = (uint8_t *)v30;
    unint64_t v32 = v12;
    uint64_t v33 = swift_slowAlloc();
    *(_DWORD *)uint64_t v31 = 136446210;
    v45[0] = v33;
    if (v44) {
      uint64_t v34 = 0x726576726573;
    }
    else {
      uint64_t v34 = 0x746E65696C63;
    }
    uint64_t v46 = sub_25E77CF40(v34, 0xE600000000000000, v45);
    sub_25E7BC520();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25E775000, v28, v29, "Handler is nil. publisher: %{public}s Unable to publish completion event.", v31, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2611E3480](v33, -1, -1);
    MEMORY[0x2611E3480](v31, -1, -1);

    long long v35 = v32;
  }
  else
  {

    long long v35 = v12;
  }
  return ((uint64_t (*)(char *, uint64_t))v22)(v35, v7);
}

void sub_25E7AEF7C(unsigned int a1, uint64_t a2, int a3, void (*a4)(uint64_t, uint64_t), uint64_t a5)
{
  int v58 = a3;
  uint64_t v9 = sub_25E7BC2E0();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v9, v11);
  unint64_t v61 = &v51[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v12, v14);
  uint64_t v16 = &v51[-v15];
  if (qword_26A7065F0 != -1) {
    swift_once();
  }
  uint64_t v17 = __swift_project_value_buffer(v9, (uint64_t)qword_26A708A58);
  os_log_type_t v18 = *(void (**)(void))(v10 + 16);
  uint64_t v59 = v17;
  uint64_t v56 = (void (*)(unsigned char *, uint64_t, uint64_t))v18;
  v18(v16);
  sub_25E785E00((uint64_t)a4);
  sub_25E785E00((uint64_t)a4);
  uint64_t v19 = sub_25E7BC2C0();
  int v20 = sub_25E7BC4A0();
  BOOL v21 = os_log_type_enabled(v19, (os_log_type_t)v20);
  unsigned int v57 = a1;
  uint64_t v60 = v10;
  if (v21)
  {
    int v52 = v20;
    uint64_t v55 = v9;
    uint64_t v22 = swift_slowAlloc();
    uint64_t v53 = swift_slowAlloc();
    uint64_t v64 = v53;
    *(_DWORD *)uint64_t v22 = 136446978;
    unint64_t v62 = sub_25E77CF40(0xD000000000000018, 0x800000025E7C0FE0, &v64);
    sub_25E7BC520();
    *(_WORD *)(v22 + 12) = 2082;
    unint64_t v62 = __PAIR64__(a2, a1);
    unsigned int v54 = a2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A706CF0);
    uint64_t v23 = sub_25E7BC3F0();
    unint64_t v62 = sub_25E77CF40(v23, v24, &v64);
    sub_25E7BC520();
    swift_bridgeObjectRelease();
    *(_WORD *)(v22 + 22) = 2082;
    if (a4)
    {
      uint64_t v25 = swift_allocObject();
      *(void *)(v25 + 16) = a4;
      *(void *)(v25 + 24) = a5;
      uint64_t v26 = sub_25E7B1CA4;
    }
    else
    {
      uint64_t v26 = 0;
      uint64_t v25 = 0;
    }
    os_log_type_t v40 = v52;
    unint64_t v62 = (unint64_t)v26;
    uint64_t v63 = v25;
    sub_25E785E00((uint64_t)a4);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A706D00);
    uint64_t v41 = sub_25E7BC3F0();
    unint64_t v62 = sub_25E77CF40(v41, v42, &v64);
    sub_25E7BC520();
    swift_bridgeObjectRelease();
    sub_25E785F38((uint64_t)a4);
    sub_25E785F38((uint64_t)a4);
    *(_WORD *)(v22 + 32) = 2082;
    if (v58) {
      uint64_t v43 = 0x726576726573;
    }
    else {
      uint64_t v43 = 0x746E65696C63;
    }
    unint64_t v62 = sub_25E77CF40(v43, 0xE600000000000000, &v64);
    sub_25E7BC520();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25E775000, v19, v40, "%{public}s invoked with event: %{public}s, handler: (%{public}s), publisher: (%{public}s)", (uint8_t *)v22, 0x2Au);
    uint64_t v44 = v53;
    swift_arrayDestroy();
    MEMORY[0x2611E3480](v44, -1, -1);
    MEMORY[0x2611E3480](v22, -1, -1);

    uint64_t v27 = *(void (**)(unsigned char *, uint64_t))(v60 + 8);
    uint64_t v9 = v55;
    v27(v16, v55);
    a2 = v54;
    unint64_t v28 = v61;
    if (!a4) {
      goto LABEL_19;
    }
  }
  else
  {
    sub_25E785F38((uint64_t)a4);
    sub_25E785F38((uint64_t)a4);

    uint64_t v27 = *(void (**)(unsigned char *, uint64_t))(v10 + 8);
    v27(v16, v9);
    unint64_t v28 = v61;
    if (!a4)
    {
LABEL_19:
      id v45 = sub_25E7BC2C0();
      os_log_type_t v46 = sub_25E7BC4A0();
      if (os_log_type_enabled(v45, v46))
      {
        unint64_t v47 = (uint8_t *)swift_slowAlloc();
        uint64_t v48 = swift_slowAlloc();
        unint64_t v62 = v48;
        *(_DWORD *)unint64_t v47 = 136446210;
        uint64_t v64 = __PAIR64__(a2, v57);
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A706CF0);
        uint64_t v49 = sub_25E7BC3F0();
        uint64_t v64 = sub_25E77CF40(v49, v50, (uint64_t *)&v62);
        sub_25E7BC520();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_25E775000, v45, v46, "WFSetupPromptPinHandler is nil. Unable to publish event: %{public}s", v47, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x2611E3480](v48, -1, -1);
        MEMORY[0x2611E3480](v47, -1, -1);
      }

      return;
    }
  }
  v56(v28, v59, v9);
  swift_retain_n();
  os_log_type_t v29 = sub_25E7BC2C0();
  os_log_type_t v30 = sub_25E7BC4A0();
  if (os_log_type_enabled(v29, v30))
  {
    uint64_t v31 = swift_slowAlloc();
    uint64_t v59 = swift_slowAlloc();
    uint64_t v64 = v59;
    *(_DWORD *)uint64_t v31 = 136446722;
    if (v58) {
      uint64_t v32 = 0x726576726573;
    }
    else {
      uint64_t v32 = 0x746E65696C63;
    }
    uint64_t v55 = v9;
    unint64_t v62 = sub_25E77CF40(v32, 0xE600000000000000, &v64);
    sub_25E7BC520();
    swift_bridgeObjectRelease();
    *(_WORD *)(v31 + 12) = 2082;
    uint64_t v33 = v57;
    unint64_t v62 = __PAIR64__(a2, v57);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A706CF0);
    uint64_t v34 = sub_25E7BC3F0();
    unint64_t v62 = sub_25E77CF40(v34, v35, &v64);
    sub_25E7BC520();
    swift_bridgeObjectRelease();
    *(_WORD *)(v31 + 22) = 2082;
    uint64_t v36 = swift_allocObject();
    *(void *)(v36 + 16) = a4;
    *(void *)(v36 + 24) = a5;
    unint64_t v62 = (unint64_t)sub_25E7B1ADC;
    uint64_t v63 = v36;
    sub_25E785E00((uint64_t)a4);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A706CF8);
    uint64_t v37 = sub_25E7BC3F0();
    unint64_t v62 = sub_25E77CF40(v37, v38, &v64);
    sub_25E7BC520();
    swift_bridgeObjectRelease();
    sub_25E785F38((uint64_t)a4);
    sub_25E785F38((uint64_t)a4);
    _os_log_impl(&dword_25E775000, v29, v30, "%{public}s publishing event: (%{public}s), using handler: (%{public}s)", (uint8_t *)v31, 0x20u);
    uint64_t v39 = v59;
    swift_arrayDestroy();
    MEMORY[0x2611E3480](v39, -1, -1);
    MEMORY[0x2611E3480](v31, -1, -1);

    v27(v61, v55);
  }
  else
  {
    sub_25E785F38((uint64_t)a4);
    sub_25E785F38((uint64_t)a4);

    v27(v28, v9);
    uint64_t v33 = v57;
  }
  a4(v33, a2);
  sub_25E785F38((uint64_t)a4);
}

uint64_t sub_25E7AF794(uint64_t a1, int a2, void (*a3)(uint64_t), uint64_t a4)
{
  LODWORD(v64) = a2;
  uint64_t v7 = sub_25E7BC2E0();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v7, v9);
  uint64_t v12 = (char *)&v57 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = MEMORY[0x270FA5388](v10, v13);
  uint64_t v16 = (char *)&v57 - v15;
  MEMORY[0x270FA5388](v14, v17);
  uint64_t v19 = (char *)&v57 - v18;
  if (qword_26A7065F0 != -1) {
    swift_once();
  }
  uint64_t v20 = __swift_project_value_buffer(v7, (uint64_t)qword_26A708A58);
  BOOL v21 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 16);
  uint64_t v66 = v20;
  uint64_t v67 = v21;
  ((void (*)(char *))v21)(v19);
  swift_bridgeObjectRetain();
  sub_25E785E00((uint64_t)a3);
  swift_bridgeObjectRetain();
  sub_25E785E00((uint64_t)a3);
  uint64_t v22 = sub_25E7BC2C0();
  int v61 = sub_25E7BC4A0();
  BOOL v23 = os_log_type_enabled(v22, (os_log_type_t)v61);
  uint64_t v63 = v7;
  uint64_t v65 = v8;
  if (v23)
  {
    os_log_t v59 = v22;
    uint64_t v60 = v12;
    unint64_t v62 = v16;
    uint64_t v24 = swift_slowAlloc();
    uint64_t v58 = swift_slowAlloc();
    uint64_t v70 = v58;
    *(_DWORD *)uint64_t v24 = 136315906;
    unint64_t v68 = (uint64_t (*)(void *))sub_25E77CF40(0xD000000000000018, 0x800000025E7C0FE0, &v70);
    sub_25E7BC520();
    *(_WORD *)(v24 + 12) = 2082;
    swift_bridgeObjectRetain();
    uint64_t v57 = MEMORY[0x263F8EE58] + 8;
    uint64_t v25 = sub_25E7BC3A0();
    unint64_t v27 = v26;
    swift_bridgeObjectRelease();
    unint64_t v68 = (uint64_t (*)(void *))sub_25E77CF40(v25, v27, &v70);
    sub_25E7BC520();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v24 + 22) = 2082;
    if (a3)
    {
      uint64_t v28 = swift_allocObject();
      *(void *)(v28 + 16) = a3;
      *(void *)(v28 + 24) = a4;
      os_log_type_t v29 = sub_25E7B1C70;
    }
    else
    {
      os_log_type_t v29 = 0;
      uint64_t v28 = 0;
    }
    uint64_t v7 = v63;
    unint64_t v68 = v29;
    uint64_t v69 = v28;
    sub_25E785E00((uint64_t)a3);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A706D20);
    uint64_t v44 = sub_25E7BC3F0();
    unint64_t v68 = (uint64_t (*)(void *))sub_25E77CF40(v44, v45, &v70);
    sub_25E7BC520();
    swift_bridgeObjectRelease();
    sub_25E785F38((uint64_t)a3);
    sub_25E785F38((uint64_t)a3);
    *(_WORD *)(v24 + 32) = 2082;
    if (v64) {
      uint64_t v46 = 0x726576726573;
    }
    else {
      uint64_t v46 = 0x746E65696C63;
    }
    unint64_t v68 = (uint64_t (*)(void *))sub_25E77CF40(v46, 0xE600000000000000, &v70);
    sub_25E7BC520();
    swift_bridgeObjectRelease();
    os_log_t v47 = v59;
    _os_log_impl(&dword_25E775000, v59, (os_log_type_t)v61, "%s invoked with object: (%{public}s), handler: (%{public}s), publisher: (%{public}s)", (uint8_t *)v24, 0x2Au);
    uint64_t v48 = v58;
    swift_arrayDestroy();
    MEMORY[0x2611E3480](v48, -1, -1);
    MEMORY[0x2611E3480](v24, -1, -1);

    os_log_type_t v30 = *(void (**)(char *, uint64_t))(v65 + 8);
    v30(v19, v7);
    uint64_t v16 = v62;
    uint64_t v12 = v60;
    if (!a3) {
      goto LABEL_19;
    }
  }
  else
  {
    swift_bridgeObjectRelease_n();
    sub_25E785F38((uint64_t)a3);
    sub_25E785F38((uint64_t)a3);

    os_log_type_t v30 = *(void (**)(char *, uint64_t))(v8 + 8);
    v30(v19, v7);
    if (!a3)
    {
LABEL_19:
      v67(v12, v66, v7);
      swift_bridgeObjectRetain_n();
      uint64_t v49 = sub_25E7BC2C0();
      os_log_type_t v50 = sub_25E7BC4A0();
      if (os_log_type_enabled(v49, v50))
      {
        uint64_t v51 = swift_slowAlloc();
        uint64_t v52 = swift_slowAlloc();
        unint64_t v68 = (uint64_t (*)(void *))v52;
        *(_DWORD *)uint64_t v51 = 136446466;
        if (v64) {
          uint64_t v53 = 0x726576726573;
        }
        else {
          uint64_t v53 = 0x746E65696C63;
        }
        uint64_t v70 = sub_25E77CF40(v53, 0xE600000000000000, (uint64_t *)&v68);
        uint64_t v60 = v12;
        sub_25E7BC520();
        swift_bridgeObjectRelease();
        *(_WORD *)(v51 + 12) = 2082;
        swift_bridgeObjectRetain();
        uint64_t v67 = (void (*)(char *, uint64_t, uint64_t))v30;
        uint64_t v54 = sub_25E7BC3A0();
        unint64_t v56 = v55;
        swift_bridgeObjectRelease();
        uint64_t v70 = sub_25E77CF40(v54, v56, (uint64_t *)&v68);
        sub_25E7BC520();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_25E775000, v49, v50, "ReceivedObjectHandler is nil. %{public}s unable to publish object: %{public}s", (uint8_t *)v51, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x2611E3480](v52, -1, -1);
        MEMORY[0x2611E3480](v51, -1, -1);

        return ((uint64_t (*)(char *, uint64_t))v67)(v60, v63);
      }
      else
      {

        swift_bridgeObjectRelease_n();
        return ((uint64_t (*)(char *, uint64_t))v30)(v12, v7);
      }
    }
  }
  v67(v16, v66, v7);
  sub_25E785E00((uint64_t)a3);
  swift_bridgeObjectRetain();
  sub_25E785E00((uint64_t)a3);
  swift_bridgeObjectRetain();
  sub_25E785E00((uint64_t)a3);
  uint64_t v31 = sub_25E7BC2C0();
  os_log_type_t v32 = sub_25E7BC4A0();
  if (os_log_type_enabled(v31, v32))
  {
    uint64_t v33 = swift_slowAlloc();
    unint64_t v62 = v16;
    uint64_t v34 = v33;
    uint64_t v66 = swift_slowAlloc();
    uint64_t v70 = v66;
    *(_DWORD *)uint64_t v34 = 136446722;
    if (v64) {
      uint64_t v35 = 0x726576726573;
    }
    else {
      uint64_t v35 = 0x746E65696C63;
    }
    unint64_t v68 = (uint64_t (*)(void *))sub_25E77CF40(v35, 0xE600000000000000, &v70);
    sub_25E7BC520();
    swift_bridgeObjectRelease();
    *(_WORD *)(v34 + 12) = 2082;
    swift_bridgeObjectRetain();
    uint64_t v64 = MEMORY[0x263F8EE58] + 8;
    uint64_t v36 = sub_25E7BC3A0();
    uint64_t v67 = (void (*)(char *, uint64_t, uint64_t))v30;
    unint64_t v38 = v37;
    swift_bridgeObjectRelease();
    unint64_t v68 = (uint64_t (*)(void *))sub_25E77CF40(v36, v38, &v70);
    sub_25E7BC520();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v34 + 22) = 2082;
    uint64_t v39 = swift_allocObject();
    *(void *)(v39 + 16) = a3;
    *(void *)(v39 + 24) = a4;
    unint64_t v68 = sub_25E7B1B8C;
    uint64_t v69 = v39;
    sub_25E785E00((uint64_t)a3);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A706D18);
    uint64_t v40 = sub_25E7BC3F0();
    unint64_t v68 = (uint64_t (*)(void *))sub_25E77CF40(v40, v41, &v70);
    sub_25E7BC520();
    swift_bridgeObjectRelease();
    sub_25E785F38((uint64_t)a3);
    sub_25E785F38((uint64_t)a3);
    _os_log_impl(&dword_25E775000, v31, v32, "%{public}s publishing object: (%{public}s), using handler: (%{public}s)", (uint8_t *)v34, 0x20u);
    uint64_t v42 = v66;
    swift_arrayDestroy();
    MEMORY[0x2611E3480](v42, -1, -1);
    MEMORY[0x2611E3480](v34, -1, -1);

    ((void (*)(char *, uint64_t))v67)(v62, v63);
  }
  else
  {
    swift_bridgeObjectRelease_n();
    sub_25E785F38((uint64_t)a3);
    sub_25E785F38((uint64_t)a3);

    v30(v16, v7);
  }
  a3(a1);
  return sub_25E785F38((uint64_t)a3);
}

uint64_t sub_25E7B014C(unint64_t a1, int a2, void (*a3)(unint64_t), uint64_t a4)
{
  int v67 = a2;
  uint64_t v7 = sub_25E7BC2E0();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v7, v9);
  uint64_t v12 = (char *)&v59 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = MEMORY[0x270FA5388](v10, v13);
  uint64_t v16 = (char *)&v59 - v15;
  MEMORY[0x270FA5388](v14, v17);
  uint64_t v19 = (char *)&v59 - v18;
  if (qword_26A7065F0 != -1) {
    swift_once();
  }
  uint64_t v20 = __swift_project_value_buffer(v7, (uint64_t)qword_26A708A58);
  BOOL v21 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 16);
  uint64_t v68 = v20;
  uint64_t v69 = v21;
  ((void (*)(char *))v21)(v19);
  sub_25E785E00((uint64_t)a3);
  sub_25E785E00((uint64_t)a3);
  uint64_t v22 = sub_25E7BC2C0();
  int v63 = sub_25E7BC4A0();
  BOOL v23 = os_log_type_enabled(v22, (os_log_type_t)v63);
  uint64_t v66 = v8;
  if (v23)
  {
    os_log_t v60 = v22;
    unint64_t v62 = v12;
    uint64_t v64 = v7;
    uint64_t v65 = v16;
    uint64_t v24 = swift_slowAlloc();
    uint64_t v59 = swift_slowAlloc();
    uint64_t v72 = v59;
    *(_DWORD *)uint64_t v24 = 136315906;
    uint64_t v70 = (uint64_t (*)(void *))sub_25E77CF40(0xD000000000000018, 0x800000025E7C0FE0, &v72);
    sub_25E7BC520();
    *(_WORD *)(v24 + 12) = 2082;
    unint64_t v61 = a1;
    uint64_t v25 = WFSetupClientUserInteractionProgressEventToString_0(a1);
    uint64_t v26 = sub_25E7BC3E0();
    unint64_t v28 = v27;

    uint64_t v70 = (uint64_t (*)(void *))sub_25E77CF40(v26, v28, &v72);
    sub_25E7BC520();
    swift_bridgeObjectRelease();
    *(_WORD *)(v24 + 22) = 2082;
    if (a3)
    {
      uint64_t v29 = swift_allocObject();
      *(void *)(v29 + 16) = a3;
      *(void *)(v29 + 24) = a4;
      os_log_type_t v30 = sub_25E7B1C6C;
    }
    else
    {
      os_log_type_t v30 = 0;
      uint64_t v29 = 0;
    }
    uint64_t v7 = v64;
    uint64_t v44 = v66;
    uint64_t v70 = v30;
    uint64_t v71 = v29;
    sub_25E785E00((uint64_t)a3);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A706D10);
    uint64_t v45 = sub_25E7BC3F0();
    uint64_t v70 = (uint64_t (*)(void *))sub_25E77CF40(v45, v46, &v72);
    sub_25E7BC520();
    swift_bridgeObjectRelease();
    sub_25E785F38((uint64_t)a3);
    sub_25E785F38((uint64_t)a3);
    *(_WORD *)(v24 + 32) = 2082;
    if (v67) {
      uint64_t v47 = 0x726576726573;
    }
    else {
      uint64_t v47 = 0x746E65696C63;
    }
    uint64_t v70 = (uint64_t (*)(void *))sub_25E77CF40(v47, 0xE600000000000000, &v72);
    sub_25E7BC520();
    swift_bridgeObjectRelease();
    os_log_t v48 = v60;
    _os_log_impl(&dword_25E775000, v60, (os_log_type_t)v63, "%s invoked with event: (%{public}s), handler: (%{public}s), publisher: (%{public}s)", (uint8_t *)v24, 0x2Au);
    uint64_t v49 = v59;
    swift_arrayDestroy();
    MEMORY[0x2611E3480](v49, -1, -1);
    MEMORY[0x2611E3480](v24, -1, -1);

    uint64_t v31 = *(void (**)(char *, uint64_t))(v44 + 8);
    v31(v19, v7);
    a1 = v61;
    uint64_t v12 = v62;
    uint64_t v16 = v65;
    if (!a3) {
      goto LABEL_19;
    }
  }
  else
  {
    sub_25E785F38((uint64_t)a3);
    sub_25E785F38((uint64_t)a3);

    uint64_t v31 = *(void (**)(char *, uint64_t))(v8 + 8);
    v31(v19, v7);
    if (!a3)
    {
LABEL_19:
      v69(v12, v68, v7);
      os_log_type_t v50 = sub_25E7BC2C0();
      os_log_type_t v51 = sub_25E7BC4A0();
      if (os_log_type_enabled(v50, v51))
      {
        uint64_t v52 = swift_slowAlloc();
        uint64_t v53 = swift_slowAlloc();
        uint64_t v70 = (uint64_t (*)(void *))v53;
        *(_DWORD *)uint64_t v52 = 136446466;
        if (v67) {
          uint64_t v54 = 0x726576726573;
        }
        else {
          uint64_t v54 = 0x746E65696C63;
        }
        unint64_t v62 = v12;
        uint64_t v72 = sub_25E77CF40(v54, 0xE600000000000000, (uint64_t *)&v70);
        sub_25E7BC520();
        swift_bridgeObjectRelease();
        *(_WORD *)(v52 + 12) = 2082;
        unint64_t v55 = WFSetupClientUserInteractionProgressEventToString_0(a1);
        uint64_t v56 = sub_25E7BC3E0();
        uint64_t v69 = (void (*)(char *, uint64_t, uint64_t))v31;
        unint64_t v58 = v57;

        uint64_t v72 = sub_25E77CF40(v56, v58, (uint64_t *)&v70);
        sub_25E7BC520();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_25E775000, v50, v51, "WFSetupClientUserInteractionProgressEventHandler is nil. %{public}s unable to publish event: %{public}s", (uint8_t *)v52, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x2611E3480](v53, -1, -1);
        MEMORY[0x2611E3480](v52, -1, -1);

        return ((uint64_t (*)(char *, uint64_t))v69)(v62, v7);
      }
      else
      {

        return ((uint64_t (*)(char *, uint64_t))v31)(v12, v7);
      }
    }
  }
  v69(v16, v68, v7);
  swift_retain_n();
  os_log_type_t v32 = sub_25E7BC2C0();
  os_log_type_t v33 = sub_25E7BC4A0();
  if (os_log_type_enabled(v32, v33))
  {
    uint64_t v34 = swift_slowAlloc();
    uint64_t v65 = v16;
    uint64_t v35 = v34;
    uint64_t v68 = swift_slowAlloc();
    uint64_t v72 = v68;
    *(_DWORD *)uint64_t v35 = 136446722;
    if (v67) {
      uint64_t v36 = 0x726576726573;
    }
    else {
      uint64_t v36 = 0x746E65696C63;
    }
    uint64_t v70 = (uint64_t (*)(void *))sub_25E77CF40(v36, 0xE600000000000000, &v72);
    sub_25E7BC520();
    swift_bridgeObjectRelease();
    uint64_t v69 = (void (*)(char *, uint64_t, uint64_t))v31;
    uint64_t v70 = (uint64_t (*)(void *))a1;
    *(_WORD *)(v35 + 12) = 2082;
    type metadata accessor for WFSetupClientUserInteractionProgressEvent(0);
    uint64_t v64 = v7;
    uint64_t v37 = sub_25E7BC3F0();
    uint64_t v70 = (uint64_t (*)(void *))sub_25E77CF40(v37, v38, &v72);
    sub_25E7BC520();
    swift_bridgeObjectRelease();
    *(_WORD *)(v35 + 22) = 2082;
    uint64_t v39 = swift_allocObject();
    *(void *)(v39 + 16) = a3;
    *(void *)(v39 + 24) = a4;
    uint64_t v70 = sub_25E7B1B60;
    uint64_t v71 = v39;
    sub_25E785E00((uint64_t)a3);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A706D08);
    uint64_t v40 = sub_25E7BC3F0();
    uint64_t v70 = (uint64_t (*)(void *))sub_25E77CF40(v40, v41, &v72);
    sub_25E7BC520();
    swift_bridgeObjectRelease();
    sub_25E785F38((uint64_t)a3);
    sub_25E785F38((uint64_t)a3);
    _os_log_impl(&dword_25E775000, v32, v33, "%{public}s publishing event: (%{public}s), using handler: %{public}s", (uint8_t *)v35, 0x20u);
    uint64_t v42 = v68;
    swift_arrayDestroy();
    MEMORY[0x2611E3480](v42, -1, -1);
    MEMORY[0x2611E3480](v35, -1, -1);

    ((void (*)(char *, uint64_t))v69)(v65, v64);
  }
  else
  {
    sub_25E785F38((uint64_t)a3);
    sub_25E785F38((uint64_t)a3);

    v31(v16, v7);
  }
  a3(a1);
  return sub_25E785F38((uint64_t)a3);
}

void sub_25E7B0A48(unsigned int a1, uint64_t a2, unint64_t a3, void (*a4)(void, uint64_t, unint64_t), uint64_t a5)
{
  unsigned int v44 = a1;
  uint64_t v9 = sub_25E7BC2E0();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9, v11);
  uint64_t v13 = (char *)&v38 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = qword_26A7065F0;
  swift_bridgeObjectRetain();
  if (v14 != -1) {
    swift_once();
  }
  uint64_t v15 = __swift_project_value_buffer(v9, (uint64_t)qword_26A708A58);
  swift_bridgeObjectRetain();
  sub_25E785E00((uint64_t)a4);
  swift_bridgeObjectRetain();
  sub_25E785E00((uint64_t)a4);
  uint64_t v43 = v15;
  uint64_t v16 = sub_25E7BC2C0();
  os_log_type_t v17 = sub_25E7BC4A0();
  if (os_log_type_enabled(v16, v17))
  {
    uint64_t v40 = v13;
    uint64_t v41 = v10;
    uint64_t v42 = v9;
    uint64_t v18 = a2;
    uint64_t v19 = swift_slowAlloc();
    uint64_t v38 = swift_slowAlloc();
    uint64_t v47 = v38;
    *(_DWORD *)uint64_t v19 = 136446978;
    uint64_t v45 = (uint64_t (*)())sub_25E77CF40(0xD000000000000013, 0x800000025E7C1000, &v47);
    sub_25E7BC520();
    *(_WORD *)(v19 + 12) = 2080;
    swift_bridgeObjectRetain();
    uint64_t v39 = v18;
    uint64_t v45 = (uint64_t (*)())sub_25E77CF40(v18, a3, &v47);
    sub_25E7BC520();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v19 + 22) = 1024;
    LODWORD(v45) = v44;
    sub_25E7BC520();
    *(_WORD *)(v19 + 28) = 2082;
    if (a4)
    {
      uint64_t v20 = swift_allocObject();
      *(void *)(v20 + 16) = a4;
      *(void *)(v20 + 24) = a5;
      BOOL v21 = sub_25E7B1AA4;
    }
    else
    {
      BOOL v21 = 0;
      uint64_t v20 = 0;
    }
    uint64_t v22 = v43;
    uint64_t v45 = v21;
    uint64_t v46 = v20;
    sub_25E785E00((uint64_t)a4);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A706CE8);
    uint64_t v31 = sub_25E7BC3F0();
    uint64_t v45 = (uint64_t (*)())sub_25E77CF40(v31, v32, &v47);
    sub_25E7BC520();
    swift_bridgeObjectRelease();
    sub_25E785F38((uint64_t)a4);
    sub_25E785F38((uint64_t)a4);
    _os_log_impl(&dword_25E775000, v16, v17, "%{public}s invoked with pin: %s, pairingFlags: %u, handler: (%{public}s", (uint8_t *)v19, 0x26u);
    uint64_t v33 = v38;
    swift_arrayDestroy();
    MEMORY[0x2611E3480](v33, -1, -1);
    MEMORY[0x2611E3480](v19, -1, -1);

    a2 = v39;
    uint64_t v13 = v40;
    uint64_t v10 = v41;
    uint64_t v9 = v42;
    if (!a4) {
      goto LABEL_13;
    }
  }
  else
  {
    swift_bridgeObjectRelease_n();
    sub_25E785F38((uint64_t)a4);
    sub_25E785F38((uint64_t)a4);

    uint64_t v22 = v43;
    if (!a4)
    {
LABEL_13:
      swift_bridgeObjectRetain();
      uint64_t v34 = sub_25E7BC2C0();
      os_log_type_t v35 = sub_25E7BC4A0();
      if (os_log_type_enabled(v34, v35))
      {
        uint64_t v36 = (uint8_t *)swift_slowAlloc();
        uint64_t v37 = (uint64_t (*)())swift_slowAlloc();
        uint64_t v45 = v37;
        *(_DWORD *)uint64_t v36 = 136315138;
        swift_bridgeObjectRetain();
        uint64_t v47 = sub_25E77CF40(a2, a3, (uint64_t *)&v45);
        sub_25E7BC520();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_25E775000, v34, v35, "WFSetupShowPinHandler is nil. Unable to publish pairing pin: %s", v36, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x2611E3480](v37, -1, -1);
        MEMORY[0x2611E3480](v36, -1, -1);
      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      return;
    }
  }
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v13, v22, v9);
  sub_25E785E00((uint64_t)a4);
  swift_bridgeObjectRetain();
  sub_25E785E00((uint64_t)a4);
  swift_bridgeObjectRetain();
  sub_25E785E00((uint64_t)a4);
  BOOL v23 = sub_25E7BC2C0();
  os_log_type_t v24 = sub_25E7BC4A0();
  if (os_log_type_enabled(v23, v24))
  {
    uint64_t v25 = swift_slowAlloc();
    uint64_t v42 = v9;
    uint64_t v26 = v25;
    uint64_t v43 = swift_slowAlloc();
    uint64_t v47 = v43;
    *(_DWORD *)uint64_t v26 = 136446722;
    uint64_t v41 = v10;
    uint64_t v45 = (uint64_t (*)())sub_25E77CF40(0x746E65696C63, 0xE600000000000000, &v47);
    uint64_t v40 = v13;
    sub_25E7BC520();
    *(_WORD *)(v26 + 12) = 2080;
    swift_bridgeObjectRetain();
    uint64_t v45 = (uint64_t (*)())sub_25E77CF40(a2, a3, &v47);
    sub_25E7BC520();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v26 + 22) = 2082;
    uint64_t v27 = swift_allocObject();
    *(void *)(v27 + 16) = a4;
    *(void *)(v27 + 24) = a5;
    uint64_t v45 = sub_25E7B1AA4;
    uint64_t v46 = v27;
    sub_25E785E00((uint64_t)a4);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A706CE0);
    uint64_t v28 = sub_25E7BC3F0();
    uint64_t v45 = (uint64_t (*)())sub_25E77CF40(v28, v29, &v47);
    sub_25E7BC520();
    swift_bridgeObjectRelease();
    sub_25E785F38((uint64_t)a4);
    sub_25E785F38((uint64_t)a4);
    _os_log_impl(&dword_25E775000, v23, v24, "%{public}s publishing pairing pin: (%s), using handler: (%{public}s)", (uint8_t *)v26, 0x20u);
    uint64_t v30 = v43;
    swift_arrayDestroy();
    MEMORY[0x2611E3480](v30, -1, -1);
    MEMORY[0x2611E3480](v26, -1, -1);

    (*(void (**)(char *, uint64_t))(v41 + 8))(v40, v42);
  }
  else
  {
    swift_bridgeObjectRelease_n();
    sub_25E785F38((uint64_t)a4);
    sub_25E785F38((uint64_t)a4);

    (*(void (**)(char *, uint64_t))(v10 + 8))(v13, v9);
  }
  a4(v44, a2, a3);
  sub_25E785F38((uint64_t)a4);
  swift_bridgeObjectRelease();
}

void sub_25E7B11D8(uint64_t a1, int a2, void (*a3)(uint64_t), uint64_t a4)
{
  int v63 = a2;
  uint64_t v7 = sub_25E7BC2E0();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v7, v9);
  uint64_t v12 = (char *)&v53 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10, v13);
  uint64_t v15 = (char *)&v53 - v14;
  if (qword_26A7065F0 != -1) {
    swift_once();
  }
  uint64_t v16 = __swift_project_value_buffer(v7, (uint64_t)qword_26A708A58);
  unint64_t v62 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 16);
  v62(v15, v16, v7);
  sub_25E785E00((uint64_t)a3);
  sub_25E785E00((uint64_t)a3);
  os_log_type_t v17 = sub_25E7BC2C0();
  int v57 = sub_25E7BC4A0();
  if (os_log_type_enabled(v17, (os_log_type_t)v57))
  {
    uint64_t v54 = v17;
    uint64_t v56 = v16;
    unint64_t v58 = v12;
    uint64_t v59 = v8;
    uint64_t v60 = v7;
    uint64_t v18 = swift_slowAlloc();
    uint64_t v55 = swift_slowAlloc();
    uint64_t v66 = (void (*)(void, void, void))v55;
    *(_DWORD *)uint64_t v18 = 136446978;
    uint64_t v64 = (uint64_t (*)(void *))sub_25E77CF40(0xD000000000000018, 0x800000025E7C0FE0, (uint64_t *)&v66);
    sub_25E7BC520();
    *(_WORD *)(v18 + 12) = 2080;
    uint64_t v61 = a1;
    uint64_t v19 = WFSetupServerUserInteractionProgressEventToString(a1);
    uint64_t v20 = sub_25E7BC3E0();
    unint64_t v22 = v21;

    uint64_t v64 = (uint64_t (*)(void *))sub_25E77CF40(v20, v22, (uint64_t *)&v66);
    sub_25E7BC520();
    swift_bridgeObjectRelease();
    *(_WORD *)(v18 + 22) = 2082;
    if (a3)
    {
      uint64_t v23 = swift_allocObject();
      *(void *)(v23 + 16) = a3;
      *(void *)(v23 + 24) = a4;
      os_log_type_t v24 = sub_25E7B1C68;
    }
    else
    {
      os_log_type_t v24 = 0;
      uint64_t v23 = 0;
    }
    uint64_t v40 = v54;
    uint64_t v64 = v24;
    uint64_t v65 = v23;
    sub_25E785E00((uint64_t)a3);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A706CD8);
    uint64_t v41 = sub_25E7BC3F0();
    uint64_t v64 = (uint64_t (*)(void *))sub_25E77CF40(v41, v42, (uint64_t *)&v66);
    sub_25E7BC520();
    swift_bridgeObjectRelease();
    sub_25E785F38((uint64_t)a3);
    sub_25E785F38((uint64_t)a3);
    *(_WORD *)(v18 + 32) = 2082;
    if (v63) {
      uint64_t v43 = 0x726576726573;
    }
    else {
      uint64_t v43 = 0x746E65696C63;
    }
    uint64_t v64 = (uint64_t (*)(void *))sub_25E77CF40(v43, 0xE600000000000000, (uint64_t *)&v66);
    sub_25E7BC520();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25E775000, v40, (os_log_type_t)v57, "%{public}s invoked with event: (%s), handler: (%{public}s), publisher: (%{public}s)", (uint8_t *)v18, 0x2Au);
    uint64_t v44 = v55;
    swift_arrayDestroy();
    MEMORY[0x2611E3480](v44, -1, -1);
    MEMORY[0x2611E3480](v18, -1, -1);

    uint64_t v8 = v59;
    uint64_t v7 = v60;
    uint64_t v25 = *(void (**)(char *, uint64_t))(v59 + 8);
    v25(v15, v60);
    a1 = v61;
    uint64_t v12 = v58;
    uint64_t v16 = v56;
    if (!a3) {
      goto LABEL_19;
    }
  }
  else
  {
    sub_25E785F38((uint64_t)a3);
    sub_25E785F38((uint64_t)a3);

    uint64_t v25 = *(void (**)(char *, uint64_t))(v8 + 8);
    v25(v15, v7);
    if (!a3)
    {
LABEL_19:
      uint64_t v45 = sub_25E7BC2C0();
      os_log_type_t v46 = sub_25E7BC4A0();
      if (os_log_type_enabled(v45, v46))
      {
        uint64_t v47 = (uint8_t *)swift_slowAlloc();
        uint64_t v48 = swift_slowAlloc();
        uint64_t v64 = (uint64_t (*)(void *))v48;
        *(_DWORD *)uint64_t v47 = 136446210;
        uint64_t v49 = WFSetupServerUserInteractionProgressEventToString(a1);
        uint64_t v50 = sub_25E7BC3E0();
        unint64_t v52 = v51;

        uint64_t v66 = (void (*)(void, void, void))sub_25E77CF40(v50, v52, (uint64_t *)&v64);
        sub_25E7BC520();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_25E775000, v45, v46, "WFSetupServerUserInteractionProgressEventHandler is nil. Unable to publish event: (%{public}s)", v47, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x2611E3480](v48, -1, -1);
        MEMORY[0x2611E3480](v47, -1, -1);
      }

      return;
    }
  }
  v62(v12, v16, v7);
  swift_retain_n();
  uint64_t v26 = v12;
  uint64_t v27 = sub_25E7BC2C0();
  os_log_type_t v28 = sub_25E7BC4A0();
  if (os_log_type_enabled(v27, v28))
  {
    uint64_t v29 = swift_slowAlloc();
    unint64_t v58 = v26;
    uint64_t v30 = v29;
    unint64_t v62 = (void (*)(char *, uint64_t, uint64_t))swift_slowAlloc();
    uint64_t v66 = (void (*)(void, void, void))v62;
    *(_DWORD *)uint64_t v30 = 136446722;
    if (v63) {
      uint64_t v31 = 0x726576726573;
    }
    else {
      uint64_t v31 = 0x746E65696C63;
    }
    uint64_t v60 = v7;
    uint64_t v64 = (uint64_t (*)(void *))sub_25E77CF40(v31, 0xE600000000000000, (uint64_t *)&v66);
    sub_25E7BC520();
    swift_bridgeObjectRelease();
    *(_WORD *)(v30 + 12) = 2082;
    uint64_t v64 = (uint64_t (*)(void *))a1;
    type metadata accessor for WFSetupServerUserInteractionProgressEvent(0);
    uint64_t v61 = a1;
    uint64_t v32 = sub_25E7BC3F0();
    uint64_t v59 = v8;
    uint64_t v64 = (uint64_t (*)(void *))sub_25E77CF40(v32, v33, (uint64_t *)&v66);
    sub_25E7BC520();
    swift_bridgeObjectRelease();
    *(_WORD *)(v30 + 22) = 2082;
    uint64_t v34 = swift_allocObject();
    *(void *)(v34 + 16) = a3;
    *(void *)(v34 + 24) = a4;
    uint64_t v64 = sub_25E7B1A78;
    uint64_t v65 = v34;
    sub_25E785E00((uint64_t)a3);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A706CD0);
    uint64_t v35 = sub_25E7BC3F0();
    uint64_t v64 = (uint64_t (*)(void *))sub_25E77CF40(v35, v36, (uint64_t *)&v66);
    a1 = v61;
    sub_25E7BC520();
    swift_bridgeObjectRelease();
    sub_25E785F38((uint64_t)a3);
    sub_25E785F38((uint64_t)a3);
    _os_log_impl(&dword_25E775000, v27, v28, "%{public}s publishing event: (%{public}s), using handler: (%{public}s)", (uint8_t *)v30, 0x20u);
    uint64_t v37 = v62;
    swift_arrayDestroy();
    MEMORY[0x2611E3480](v37, -1, -1);
    MEMORY[0x2611E3480](v30, -1, -1);

    uint64_t v38 = v58;
    uint64_t v39 = v60;
  }
  else
  {
    sub_25E785F38((uint64_t)a3);
    sub_25E785F38((uint64_t)a3);

    uint64_t v38 = v26;
    uint64_t v39 = v7;
  }
  v25(v38, v39);
  a3(a1);
  sub_25E785F38((uint64_t)a3);
}

__CFString *WFSetupServerUserInteractionProgressEventToString(uint64_t a1)
{
  if (a1)
  {
    if (a1 != 1) {
      goto LABEL_6;
    }
    uint64_t v1 = @"WFSetupServerUserInteractionProgressEventChosePinPairingSetup";
  }
  else
  {
    uint64_t v1 = @"WFSetupServerUserInteractionProgressEventBeganInteractingWithDevice";
  }
  os_log_type_t v2 = v1;
LABEL_6:
  return v1;
}

uint64_t sub_25E7B1A40()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_25E7B1A78(void *a1)
{
  return (*(uint64_t (**)(void))(v1 + 16))(*a1);
}

uint64_t sub_25E7B1AA8(unsigned int *a1, void *a2)
{
  return (*(uint64_t (**)(void, void, void))(v2 + 16))(*a1, *a2, a2[1]);
}

uint64_t sub_25E7B1ADC(unsigned int *a1, unsigned int *a2)
{
  return (*(uint64_t (**)(void, void))(v2 + 16))(*a1, *a2);
}

__CFString *WFSetupClientUserInteractionProgressEventToString_0(unint64_t a1)
{
  if (a1 <= 5)
  {
    uint64_t v1 = off_26552FB70[a1];
    uint64_t v2 = off_26552FB40[a1];
  }
  return v1;
}

uint64_t sub_25E7B1B60(void *a1)
{
  return (*(uint64_t (**)(void))(v1 + 16))(*a1);
}

uint64_t sub_25E7B1B8C(void *a1)
{
  return (*(uint64_t (**)(void))(v1 + 16))(*a1);
}

uint64_t sub_25E7B1BB8(void *a1)
{
  return (*(uint64_t (**)(void))(v1 + 16))(*a1);
}

__CFString *WFSetupProgressEventToString_2(unint64_t a1)
{
  if (a1 <= 0xF)
  {
    uint64_t v1 = off_26552FC20[a1];
    uint64_t v2 = off_26552FBA0[a1];
  }
  return v1;
}

uint64_t sub_25E7B1C38(void *a1, void *a2)
{
  return (*(uint64_t (**)(void, void))(v2 + 16))(*a1, *a2);
}

id WFSetupServerAnisetteDataProvider.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void sub_25E7B1CE0(char a1, uint64_t a2, uint64_t a3)
{
  if (a2) {
    uint64_t v5 = sub_25E7BC1D0();
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = (id)v5;
  (*(void (**)(uint64_t, void))(a3 + 16))(a3, a1 & 1);
}

void sub_25E7B1D50(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2) {
    uint64_t v5 = sub_25E7BC1D0();
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = (id)v5;
  (*(void (**)(uint64_t, uint64_t))(a3 + 16))(a3, a1);
}

uint64_t sub_25E7B1DC0(char a1)
{
  return *(void *)&aSimdata[8 * a1];
}

uint64_t sub_25E7B1DE0(char a1)
{
  return *(void *)&aProvisiosync_0[8 * a1];
}

void *WFSetupServerAnisetteDataProvider.session.getter()
{
  id v1 = (void **)(v0 + OBJC_IVAR____TtC10TDGSharing33WFSetupServerAnisetteDataProvider_session);
  swift_beginAccess();
  uint64_t v2 = *v1;
  id v3 = v2;
  return v2;
}

void WFSetupServerAnisetteDataProvider.session.setter(void *a1)
{
}

uint64_t (*WFSetupServerAnisetteDataProvider.session.modify())()
{
  return j_j__swift_endAccess;
}

void *WFSetupServerAnisetteDataProvider.companionAuthDevice.getter()
{
  id v1 = (void **)(v0 + OBJC_IVAR____TtC10TDGSharing33WFSetupServerAnisetteDataProvider_companionAuthDevice);
  swift_beginAccess();
  uint64_t v2 = *v1;
  id v3 = v2;
  return v2;
}

void WFSetupServerAnisetteDataProvider.companionAuthDevice.setter(void *a1)
{
}

uint64_t (*WFSetupServerAnisetteDataProvider.companionAuthDevice.modify())()
{
  return j__swift_endAccess;
}

void *WFSetupServerAnisetteDataProvider.transportableAuthKitAccount.getter()
{
  id v1 = (void **)(v0 + OBJC_IVAR____TtC10TDGSharing33WFSetupServerAnisetteDataProvider_transportableAuthKitAccount);
  swift_beginAccess();
  uint64_t v2 = *v1;
  id v3 = v2;
  return v2;
}

void WFSetupServerAnisetteDataProvider.transportableAuthKitAccount.setter(void *a1)
{
}

void sub_25E7B2014(void *a1, void *a2)
{
  uint64_t v4 = (void **)(v2 + *a2);
  swift_beginAccess();
  uint64_t v5 = *v4;
  *uint64_t v4 = a1;
}

uint64_t (*WFSetupServerAnisetteDataProvider.transportableAuthKitAccount.modify())()
{
  return j_j__swift_endAccess;
}

char *WFSetupServerAnisetteDataProvider.init()()
{
  *(void *)&v0[OBJC_IVAR____TtC10TDGSharing33WFSetupServerAnisetteDataProvider_session] = 0;
  *(void *)&v0[OBJC_IVAR____TtC10TDGSharing33WFSetupServerAnisetteDataProvider_companionAuthDevice] = 0;
  *(void *)&v0[OBJC_IVAR____TtC10TDGSharing33WFSetupServerAnisetteDataProvider_transportableAuthKitAccount] = 0;
  v12.receiver = v0;
  v12.super_class = (Class)type metadata accessor for WFSetupServerAnisetteDataProvider();
  id v1 = objc_msgSendSuper2(&v12, sel_init);
  uint64_t v2 = self;
  id v3 = (char *)v1;
  id v4 = objc_msgSend(v2, sel_currentDevice);
  id v5 = v4;
  if (v4) {
    objc_msgSend(v4, sel_setLinkType_, 3);
  }
  id v6 = (void **)&v3[OBJC_IVAR____TtC10TDGSharing33WFSetupServerAnisetteDataProvider_companionAuthDevice];
  swift_beginAccess();
  uint64_t v7 = *v6;
  *id v6 = v5;

  id v8 = sub_25E7BB2A4();
  uint64_t v9 = (void **)&v3[OBJC_IVAR____TtC10TDGSharing33WFSetupServerAnisetteDataProvider_transportableAuthKitAccount];
  swift_beginAccess();
  uint64_t v10 = *v9;
  *uint64_t v9 = v8;

  return v3;
}

uint64_t type metadata accessor for WFSetupServerAnisetteDataProvider()
{
  return self;
}

id WFSetupServerAnisetteDataProvider.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  id v4 = sub_25E7BB730();

  return v4;
}

id WFSetupServerAnisetteDataProvider.init(coder:)(void *a1)
{
  id v2 = sub_25E7BB730();

  return v2;
}

void WFSetupServerAnisetteDataProvider.provisionAnisette(completion:)(void (*a1)(void, void *), uint64_t a2)
{
  uint64_t v3 = v2;
  if (qword_26A7065C0 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_25E7BC2E0();
  __swift_project_value_buffer(v6, (uint64_t)qword_26A7089C8);
  uint64_t v7 = sub_25E7BC2C0();
  os_log_type_t v8 = sub_25E7BC4A0();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    uint64_t v10 = swift_slowAlloc();
    uint64_t aBlock = v10;
    *(_DWORD *)uint64_t v9 = 136446210;
    uint64_t v46 = sub_25E77CF40(0xD00000000000001ELL, 0x800000025E7C1150, &aBlock);
    sub_25E7BC520();
    _os_log_impl(&dword_25E775000, v7, v8, "%{public}s is invoked. ", v9, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2611E3480](v10, -1, -1);
    MEMORY[0x2611E3480](v9, -1, -1);
  }

  uint64_t v11 = (id *)(v3 + OBJC_IVAR____TtC10TDGSharing33WFSetupServerAnisetteDataProvider_session);
  swift_beginAccess();
  if (*v11)
  {
    uint64_t v36 = a2;
    id v37 = *v11;
    uint64_t v12 = MEMORY[0x263F8EE78];
    unint64_t v13 = sub_25E7886EC(MEMORY[0x263F8EE78]);
    uint64_t v14 = (objc_class *)type metadata accessor for AnisetteServiceFactory.AnisetteRequest();
    uint64_t v15 = (char *)objc_allocWithZone(v14);
    uint64_t v16 = OBJC_IVAR___WFAnisetteRequest_data;
    os_log_type_t v17 = v15;
    *(void *)&v15[v16] = sub_25E7886EC(v12);
    uint64_t v18 = &v17[OBJC_IVAR___WFAnisetteRequest_id];
    *(void *)uint64_t v18 = 0x6F697369766F7270;
    *((void *)v18 + 1) = 0xE90000000000006ELL;
    *(void *)&v15[v16] = v13;

    swift_bridgeObjectRelease();
    v44.receiver = v17;
    v44.super_class = v14;
    id v19 = objc_msgSendSuper2(&v44, sel_init);
    uint64_t v26 = sub_25E7B8AC4();
    unint64_t v28 = v27;

    uint64_t v35 = (void *)sub_25E7BC3D0();
    sub_25E7885A8(MEMORY[0x263F8EE78]);
    uint64_t v29 = (void *)sub_25E7BC370();
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A706D80);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_25E7BDF10;
    uint64_t aBlock = 0x6F697369766F7270;
    unint64_t v39 = 0xE90000000000006ELL;
    sub_25E7BC580();
    *(void *)(inited + 96) = MEMORY[0x263F06F78];
    *(void *)(inited + 72) = v26;
    *(void *)(inited + 80) = v28;
    sub_25E77CE0C(v26, v28);
    sub_25E7885A8(inited);
    uint64_t v31 = (void *)sub_25E7BC370();
    swift_bridgeObjectRelease();
    uint64_t v32 = swift_allocObject();
    swift_unknownObjectWeakInit();
    unint64_t v33 = (void *)swift_allocObject();
    v33[2] = a1;
    uint64_t v33[3] = v36;
    v33[4] = v32;
    unint64_t v42 = sub_25E7BBB2C;
    uint64_t v43 = v33;
    uint64_t aBlock = MEMORY[0x263EF8330];
    unint64_t v39 = 1107296256;
    uint64_t v40 = sub_25E7B3604;
    uint64_t v41 = &block_descriptor_3;
    uint64_t v34 = _Block_copy(&aBlock);
    sub_25E785E00((uint64_t)a1);
    swift_release();
    objc_msgSend(v37, sel_sendRequestID_options_request_responseHandler_, v35, v29, v31, v34);
    _Block_release(v34);

    sub_25E77D724(v26, v28);
  }
  else
  {
    uint64_t v20 = sub_25E7BC2C0();
    os_log_type_t v21 = sub_25E7BC490();
    if (os_log_type_enabled(v20, v21))
    {
      unint64_t v22 = (uint8_t *)swift_slowAlloc();
      uint64_t v23 = swift_slowAlloc();
      uint64_t aBlock = v23;
      *(_DWORD *)unint64_t v22 = 136446210;
      uint64_t v45 = sub_25E77CF40(0xD00000000000001ELL, 0x800000025E7C1150, &aBlock);
      sub_25E7BC520();
      _os_log_impl(&dword_25E775000, v20, v21, "%{public}s invoked but session is nil", v22, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2611E3480](v23, -1, -1);
      MEMORY[0x2611E3480](v22, -1, -1);
    }

    if (a1)
    {
      sub_25E7A84C0();
      os_log_type_t v24 = (void *)swift_allocError();
      *(void *)uint64_t v25 = 0;
      *(void *)(v25 + 8) = 0;
      *(unsigned char *)(v25 + 16) = 5;
      a1(0, v24);
    }
  }
}

void sub_25E7B2A2C(unsigned int a1, uint64_t a2, uint64_t a3, void (*a4)(void, void), uint64_t a5, uint64_t a6)
{
  uint64_t v11 = sub_25E7BC2E0();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11, v13);
  uint64_t v15 = (char *)&v59 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a1)
  {
    swift_beginAccess();
    uint64_t v23 = MEMORY[0x2611E34D0](a6 + 16);
    if (v23)
    {
      os_log_type_t v24 = (void *)v23;
      id v37 = (char *)sub_25E7BBF50(a3, 0);

      if (v37)
      {
        uint64_t v38 = *(void *)&v37[OBJC_IVAR___WFAnisetteResponse_data];
        if (*(void *)(v38 + 16))
        {
          swift_bridgeObjectRetain();
          unint64_t v39 = sub_25E7A8D0C(0x7369766F72507369, 0xED000064656E6F69);
          if (v40)
          {
            sub_25E78337C(*(void *)(v38 + 56) + 32 * v39, (uint64_t)&v63);
          }
          else
          {
            uint64_t v63 = 0;
            uint64_t v64 = 0;
            uint64_t v65 = 0;
            uint64_t v66 = 1;
          }
          swift_bridgeObjectRelease();
          if (v66 != 1)
          {
            sub_25E7BC098((uint64_t)&v63, (uint64_t)v67);
            if (v67[3])
            {
              if (swift_dynamicCast())
              {
                uint64_t v61 = a5;
                unsigned int v41 = v62;
                if (qword_26A7065D0 != -1) {
                  swift_once();
                }
                uint64_t v42 = __swift_project_value_buffer(v11, (uint64_t)qword_26A7089F8);
                (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v15, v42, v11);
                uint64_t v43 = sub_25E7BC2C0();
                os_log_type_t v44 = sub_25E7BC4A0();
                BOOL v45 = os_log_type_enabled(v43, v44);
                unsigned int v60 = v41;
                if (v45)
                {
                  uint64_t v46 = swift_slowAlloc();
                  uint64_t v47 = swift_slowAlloc();
                  uint64_t v59 = a4;
                  uint64_t v48 = v47;
                  v67[0] = v47;
                  *(_DWORD *)uint64_t v46 = 67109378;
                  LODWORD(v63) = v41;
                  sub_25E7BC520();
                  *(_WORD *)(v46 + 8) = 2080;
                  uint64_t v63 = sub_25E77CF40(0x6F697369766F7270, 0xE90000000000006ELL, v67);
                  sub_25E7BC520();
                  _os_log_impl(&dword_25E775000, v43, v44, "Received response: isProvisioned %{BOOL}d for service id: %s", (uint8_t *)v46, 0x12u);
                  swift_arrayDestroy();
                  uint64_t v49 = v48;
                  a4 = v59;
                  MEMORY[0x2611E3480](v49, -1, -1);
                  MEMORY[0x2611E3480](v46, -1, -1);
                }

                (*(void (**)(char *, uint64_t))(v12 + 8))(v15, v11);
                if (a4)
                {
                  uint64_t v50 = qword_26A7065C0;
                  swift_retain();
                  if (v50 != -1) {
                    swift_once();
                  }
                  __swift_project_value_buffer(v11, (uint64_t)qword_26A7089C8);
                  unint64_t v51 = sub_25E7BC2C0();
                  os_log_type_t v52 = sub_25E7BC4A0();
                  if (os_log_type_enabled(v51, v52))
                  {
                    uint64_t v53 = (uint8_t *)swift_slowAlloc();
                    uint64_t v54 = swift_slowAlloc();
                    v67[0] = v54;
                    *(_DWORD *)uint64_t v53 = 136446210;
                    uint64_t v63 = sub_25E77CF40(0xD00000000000001ELL, 0x800000025E7C1150, v67);
                    sub_25E7BC520();
                    _os_log_impl(&dword_25E775000, v51, v52, "Invoking completion block that was passed into: %{public}s", v53, 0xCu);
                    swift_arrayDestroy();
                    MEMORY[0x2611E3480](v54, -1, -1);
                    MEMORY[0x2611E3480](v53, -1, -1);
                  }

                  a4(v60, 0);
                  sub_25E785F38((uint64_t)a4);
                }
                else
                {
                  if (qword_26A7065C0 != -1) {
                    swift_once();
                  }
                  __swift_project_value_buffer(v11, (uint64_t)qword_26A7089C8);
                  uint64_t v55 = sub_25E7BC2C0();
                  os_log_type_t v56 = sub_25E7BC4A0();
                  if (os_log_type_enabled(v55, v56))
                  {
                    int v57 = (uint8_t *)swift_slowAlloc();
                    uint64_t v58 = swift_slowAlloc();
                    v67[0] = v58;
                    *(_DWORD *)int v57 = 136446210;
                    uint64_t v63 = sub_25E77CF40(0xD00000000000001ELL, 0x800000025E7C1150, v67);
                    sub_25E7BC520();
                    _os_log_impl(&dword_25E775000, v55, v56, "No completion block passed into %{public}s. ", v57, 0xCu);
                    swift_arrayDestroy();
                    MEMORY[0x2611E3480](v58, -1, -1);
                    MEMORY[0x2611E3480](v57, -1, -1);
                  }
                  else
                  {
                  }
                }
                return;
              }
LABEL_14:
              if (qword_26A7065C0 != -1) {
                swift_once();
              }
              __swift_project_value_buffer(v11, (uint64_t)qword_26A7089C8);
              unint64_t v27 = v37;
              unint64_t v28 = sub_25E7BC2C0();
              os_log_type_t v29 = sub_25E7BC490();
              if (os_log_type_enabled(v28, v29))
              {
                uint64_t v30 = (uint8_t *)swift_slowAlloc();
                uint64_t v31 = swift_slowAlloc();
                v67[0] = v31;
                uint64_t v61 = a5;
                *(_DWORD *)uint64_t v30 = 136315138;
                uint64_t v63 = (uint64_t)v37;
                uint64_t v32 = v27;
                __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A706E10);
                uint64_t v33 = sub_25E7BC3F0();
                uint64_t v63 = sub_25E77CF40(v33, v34, v67);
                sub_25E7BC520();

                swift_bridgeObjectRelease();
                _os_log_impl(&dword_25E775000, v28, v29, "Failed to retrieve value for isProvisioned from anisetteResponse: %s", v30, 0xCu);
                swift_arrayDestroy();
                MEMORY[0x2611E3480](v31, -1, -1);
                MEMORY[0x2611E3480](v30, -1, -1);

                if (a4)
                {
LABEL_18:
                  sub_25E7A84C0();
                  uint64_t v35 = swift_allocError();
                  *(_OWORD *)uint64_t v36 = xmmword_25E7BED70;
                  *(unsigned char *)(v36 + 16) = 0;
                  a4(0, v35);

                  unint64_t v22 = (void *)v35;
                  goto LABEL_19;
                }
              }
              else
              {

                if (a4) {
                  goto LABEL_18;
                }
              }

              return;
            }
            uint64_t v25 = &qword_26A706790;
            uint64_t v26 = v67;
LABEL_13:
            sub_25E784970((uint64_t)v26, v25);
            goto LABEL_14;
          }
LABEL_12:
          uint64_t v25 = (uint64_t *)&unk_26A706E08;
          uint64_t v26 = &v63;
          goto LABEL_13;
        }
      }
    }
    else
    {
      id v37 = 0;
    }
    uint64_t v63 = 0;
    uint64_t v64 = 0;
    uint64_t v65 = 0;
    uint64_t v66 = 1;
    goto LABEL_12;
  }
  if (qword_26A7065C0 != -1) {
    swift_once();
  }
  __swift_project_value_buffer(v11, (uint64_t)qword_26A7089C8);
  uint64_t v16 = sub_25E7BC2C0();
  os_log_type_t v17 = sub_25E7BC490();
  if (os_log_type_enabled(v16, v17))
  {
    uint64_t v18 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v18 = 67240192;
    LODWORD(v67[0]) = a1;
    sub_25E7BC520();
    _os_log_impl(&dword_25E775000, v16, v17, "Provisioning request failed with osstatus code: %{public}d", v18, 8u);
    MEMORY[0x2611E3480](v18, -1, -1);
  }

  if (a4)
  {
    uint64_t v19 = a1;
    sub_25E7A84C0();
    uint64_t v20 = swift_allocError();
    *(void *)uint64_t v21 = v19;
    *(void *)(v21 + 8) = 0;
    *(unsigned char *)(v21 + 16) = 4;
    a4(0, v20);
    unint64_t v22 = (void *)v20;
LABEL_19:
  }
}

uint64_t sub_25E7B35E4(char a1)
{
  return *(void *)&aIsprovisissync[8 * a1];
}

uint64_t sub_25E7B3604(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4;
  uint64_t v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(a1 + 32);
  if (a3)
  {
    uint64_t v7 = sub_25E7BC390();
    if (!v4) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  uint64_t v7 = 0;
  if (a4) {
LABEL_3:
  }
    uint64_t v4 = sub_25E7BC390();
LABEL_4:
  swift_retain();
  v6(a2, v7, v4);
  swift_release();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void WFSetupServerAnisetteDataProvider.syncAnisette(withSIMData:completion:)(uint64_t a1, unint64_t a2, void (*a3)(void, void *), uint64_t a4)
{
  uint64_t v5 = v4;
  if (qword_26A7065C0 != -1) {
    swift_once();
  }
  uint64_t v9 = sub_25E7BC2E0();
  __swift_project_value_buffer(v9, (uint64_t)qword_26A7089C8);
  uint64_t v10 = sub_25E7BC2C0();
  os_log_type_t v11 = sub_25E7BC4A0();
  uint64_t v43 = a3;
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = (uint8_t *)swift_slowAlloc();
    uint64_t v13 = swift_slowAlloc();
    uint64_t aBlock = v13;
    *(_DWORD *)uint64_t v12 = 136446210;
    uint64_t v52 = sub_25E77CF40(0xD000000000000025, 0x800000025E7C11A0, &aBlock);
    sub_25E7BC520();
    _os_log_impl(&dword_25E775000, v10, v11, "%{public}s is invoked. ", v12, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2611E3480](v13, -1, -1);
    MEMORY[0x2611E3480](v12, -1, -1);
  }

  uint64_t v14 = (void **)(v5 + OBJC_IVAR____TtC10TDGSharing33WFSetupServerAnisetteDataProvider_session);
  swift_beginAccess();
  uint64_t v15 = *v14;
  if (*v14)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A7069A8);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_25E7BDF10;
    *(void *)(inited + 32) = 0x617461446D6973;
    *(void *)(inited + 40) = 0xE700000000000000;
    *(void *)(inited + 72) = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A706D90);
    *(void *)(inited + 48) = a1;
    *(void *)(inited + 56) = a2;
    sub_25E77CDF8(a1, a2);
    sub_25E77CDF8(a1, a2);
    id v17 = v15;
    unint64_t v18 = sub_25E7886EC(inited);
    uint64_t v19 = (objc_class *)type metadata accessor for AnisetteServiceFactory.AnisetteRequest();
    uint64_t v20 = (char *)objc_allocWithZone(v19);
    uint64_t v21 = OBJC_IVAR___WFAnisetteRequest_data;
    unint64_t v22 = v20;
    *(void *)&v20[v21] = sub_25E7886EC(MEMORY[0x263F8EE78]);
    uint64_t v23 = &v22[OBJC_IVAR___WFAnisetteRequest_id];
    *(void *)uint64_t v23 = 1668184435;
    *((void *)v23 + 1) = 0xE400000000000000;
    *(void *)&v20[v21] = v18;

    swift_bridgeObjectRelease();
    v50.receiver = v22;
    v50.super_class = v19;
    id v24 = objc_msgSendSuper2(&v50, sel_init);
    sub_25E77D710(a1, a2);
    uint64_t v31 = sub_25E7B8AC4();
    unint64_t v33 = v32;

    unsigned int v41 = (void *)sub_25E7BC3D0();
    sub_25E7885A8(MEMORY[0x263F8EE78]);
    unint64_t v34 = v17;
    uint64_t v35 = (void *)sub_25E7BC370();
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A706D80);
    uint64_t v36 = swift_initStackObject();
    *(_OWORD *)(v36 + 16) = xmmword_25E7BDF10;
    uint64_t aBlock = 1668184435;
    unint64_t v45 = 0xE400000000000000;
    sub_25E7BC580();
    *(void *)(v36 + 96) = MEMORY[0x263F06F78];
    *(void *)(v36 + 72) = v31;
    *(void *)(v36 + 80) = v33;
    sub_25E77CE0C(v31, v33);
    sub_25E7885A8(v36);
    id v37 = (void *)sub_25E7BC370();
    swift_bridgeObjectRelease();
    uint64_t v38 = swift_allocObject();
    swift_unknownObjectWeakInit();
    unint64_t v39 = (void *)swift_allocObject();
    v39[2] = v43;
    v39[3] = a4;
    v39[4] = v38;
    uint64_t v48 = sub_25E7BBB54;
    uint64_t v49 = v39;
    uint64_t aBlock = MEMORY[0x263EF8330];
    unint64_t v45 = 1107296256;
    uint64_t v46 = sub_25E7B3604;
    uint64_t v47 = &block_descriptor_10;
    char v40 = _Block_copy(&aBlock);
    sub_25E785E00((uint64_t)v43);
    swift_release();
    objc_msgSend(v34, sel_sendRequestID_options_request_responseHandler_, v41, v35, v37, v40);
    _Block_release(v40);

    sub_25E77D724(v31, v33);
  }
  else
  {
    if (qword_26A7065D0 != -1) {
      swift_once();
    }
    __swift_project_value_buffer(v9, (uint64_t)qword_26A7089F8);
    uint64_t v25 = sub_25E7BC2C0();
    os_log_type_t v26 = sub_25E7BC490();
    if (os_log_type_enabled(v25, v26))
    {
      unint64_t v27 = (uint8_t *)swift_slowAlloc();
      uint64_t v28 = swift_slowAlloc();
      uint64_t aBlock = v28;
      *(_DWORD *)unint64_t v27 = 136446210;
      uint64_t v51 = sub_25E77CF40(0xD000000000000025, 0x800000025E7C11A0, &aBlock);
      sub_25E7BC520();
      _os_log_impl(&dword_25E775000, v25, v26, "%{public}s invoked but session is nil", v27, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2611E3480](v28, -1, -1);
      MEMORY[0x2611E3480](v27, -1, -1);
    }

    if (v43)
    {
      sub_25E7A84C0();
      os_log_type_t v29 = (void *)swift_allocError();
      *(void *)uint64_t v30 = 0;
      *(void *)(v30 + 8) = 0;
      *(unsigned char *)(v30 + 16) = 5;
      v43(0, v29);
    }
  }
}

void sub_25E7B3F7C(unsigned int a1, uint64_t a2, uint64_t a3, void (*a4)(void, void), uint64_t a5, uint64_t a6)
{
  uint64_t v11 = sub_25E7BC2E0();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11, v13);
  uint64_t v15 = (char *)&v59 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a1)
  {
    swift_beginAccess();
    uint64_t v23 = MEMORY[0x2611E34D0](a6 + 16);
    if (v23)
    {
      id v24 = (void *)v23;
      id v37 = (char *)sub_25E7BBF50(a3, 1);

      if (v37)
      {
        uint64_t v38 = *(void *)&v37[OBJC_IVAR___WFAnisetteResponse_data];
        if (*(void *)(v38 + 16))
        {
          swift_bridgeObjectRetain();
          unint64_t v39 = sub_25E7A8D0C(0x6465636E79537369, 0xE800000000000000);
          if (v40)
          {
            sub_25E78337C(*(void *)(v38 + 56) + 32 * v39, (uint64_t)&v63);
          }
          else
          {
            uint64_t v63 = 0;
            uint64_t v64 = 0;
            uint64_t v65 = 0;
            uint64_t v66 = 1;
          }
          swift_bridgeObjectRelease();
          if (v66 != 1)
          {
            sub_25E7BC098((uint64_t)&v63, (uint64_t)v67);
            if (v67[3])
            {
              if (swift_dynamicCast())
              {
                uint64_t v61 = a5;
                unsigned int v41 = v62;
                if (qword_26A7065D0 != -1) {
                  swift_once();
                }
                uint64_t v42 = __swift_project_value_buffer(v11, (uint64_t)qword_26A7089F8);
                (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v15, v42, v11);
                uint64_t v43 = sub_25E7BC2C0();
                os_log_type_t v44 = sub_25E7BC4A0();
                BOOL v45 = os_log_type_enabled(v43, v44);
                unsigned int v60 = v41;
                if (v45)
                {
                  uint64_t v46 = swift_slowAlloc();
                  uint64_t v47 = swift_slowAlloc();
                  uint64_t v59 = a4;
                  uint64_t v48 = v47;
                  v67[0] = v47;
                  *(_DWORD *)uint64_t v46 = 67109378;
                  LODWORD(v63) = v41;
                  sub_25E7BC520();
                  *(_WORD *)(v46 + 8) = 2082;
                  uint64_t v63 = sub_25E77CF40(1668184435, 0xE400000000000000, v67);
                  sub_25E7BC520();
                  _os_log_impl(&dword_25E775000, v43, v44, "Received response: isSynced %{BOOL}d for service id: %{public}s", (uint8_t *)v46, 0x12u);
                  swift_arrayDestroy();
                  uint64_t v49 = v48;
                  a4 = v59;
                  MEMORY[0x2611E3480](v49, -1, -1);
                  MEMORY[0x2611E3480](v46, -1, -1);
                }

                (*(void (**)(char *, uint64_t))(v12 + 8))(v15, v11);
                if (a4)
                {
                  uint64_t v50 = qword_26A7065C0;
                  swift_retain();
                  if (v50 != -1) {
                    swift_once();
                  }
                  __swift_project_value_buffer(v11, (uint64_t)qword_26A7089C8);
                  uint64_t v51 = sub_25E7BC2C0();
                  os_log_type_t v52 = sub_25E7BC4A0();
                  if (os_log_type_enabled(v51, v52))
                  {
                    uint64_t v53 = (uint8_t *)swift_slowAlloc();
                    uint64_t v54 = swift_slowAlloc();
                    v67[0] = v54;
                    *(_DWORD *)uint64_t v53 = 136446210;
                    uint64_t v63 = sub_25E77CF40(0xD000000000000025, 0x800000025E7C11A0, v67);
                    sub_25E7BC520();
                    _os_log_impl(&dword_25E775000, v51, v52, "Invoking completion block that was passed into: %{public}s", v53, 0xCu);
                    swift_arrayDestroy();
                    MEMORY[0x2611E3480](v54, -1, -1);
                    MEMORY[0x2611E3480](v53, -1, -1);
                  }

                  a4(v60, 0);
                  sub_25E785F38((uint64_t)a4);
                }
                else
                {
                  if (qword_26A7065C0 != -1) {
                    swift_once();
                  }
                  __swift_project_value_buffer(v11, (uint64_t)qword_26A7089C8);
                  uint64_t v55 = sub_25E7BC2C0();
                  os_log_type_t v56 = sub_25E7BC4A0();
                  if (os_log_type_enabled(v55, v56))
                  {
                    int v57 = (uint8_t *)swift_slowAlloc();
                    uint64_t v58 = swift_slowAlloc();
                    v67[0] = v58;
                    *(_DWORD *)int v57 = 136446210;
                    uint64_t v63 = sub_25E77CF40(0xD000000000000025, 0x800000025E7C11A0, v67);
                    sub_25E7BC520();
                    _os_log_impl(&dword_25E775000, v55, v56, "No completion block passed into %{public}s. ", v57, 0xCu);
                    swift_arrayDestroy();
                    MEMORY[0x2611E3480](v58, -1, -1);
                    MEMORY[0x2611E3480](v57, -1, -1);
                  }
                  else
                  {
                  }
                }
                return;
              }
LABEL_14:
              if (qword_26A7065C0 != -1) {
                swift_once();
              }
              __swift_project_value_buffer(v11, (uint64_t)qword_26A7089C8);
              unint64_t v27 = v37;
              uint64_t v28 = sub_25E7BC2C0();
              os_log_type_t v29 = sub_25E7BC490();
              if (os_log_type_enabled(v28, v29))
              {
                uint64_t v30 = (uint8_t *)swift_slowAlloc();
                uint64_t v31 = swift_slowAlloc();
                v67[0] = v31;
                uint64_t v61 = a5;
                *(_DWORD *)uint64_t v30 = 136315138;
                uint64_t v63 = (uint64_t)v37;
                unint64_t v32 = v27;
                __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A706E10);
                uint64_t v33 = sub_25E7BC3F0();
                uint64_t v63 = sub_25E77CF40(v33, v34, v67);
                sub_25E7BC520();

                swift_bridgeObjectRelease();
                _os_log_impl(&dword_25E775000, v28, v29, "Failed to retrieve value for isSynced from anisetteResponse: %s", v30, 0xCu);
                swift_arrayDestroy();
                MEMORY[0x2611E3480](v31, -1, -1);
                MEMORY[0x2611E3480](v30, -1, -1);

                if (a4)
                {
LABEL_18:
                  sub_25E7A84C0();
                  uint64_t v35 = swift_allocError();
                  *(_OWORD *)uint64_t v36 = xmmword_25E7BED90;
                  *(unsigned char *)(v36 + 16) = 0;
                  a4(0, v35);

                  unint64_t v22 = (void *)v35;
                  goto LABEL_19;
                }
              }
              else
              {

                if (a4) {
                  goto LABEL_18;
                }
              }

              return;
            }
            uint64_t v25 = &qword_26A706790;
            os_log_type_t v26 = v67;
LABEL_13:
            sub_25E784970((uint64_t)v26, v25);
            goto LABEL_14;
          }
LABEL_12:
          uint64_t v25 = (uint64_t *)&unk_26A706E08;
          os_log_type_t v26 = &v63;
          goto LABEL_13;
        }
      }
    }
    else
    {
      id v37 = 0;
    }
    uint64_t v63 = 0;
    uint64_t v64 = 0;
    uint64_t v65 = 0;
    uint64_t v66 = 1;
    goto LABEL_12;
  }
  if (qword_26A7065D0 != -1) {
    swift_once();
  }
  __swift_project_value_buffer(v11, (uint64_t)qword_26A7089F8);
  uint64_t v16 = sub_25E7BC2C0();
  os_log_type_t v17 = sub_25E7BC490();
  if (os_log_type_enabled(v16, v17))
  {
    unint64_t v18 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)unint64_t v18 = 67240192;
    LODWORD(v67[0]) = a1;
    sub_25E7BC520();
    _os_log_impl(&dword_25E775000, v16, v17, "Syncing anisette with sim data anisette request failed with error status code: %{public}d", v18, 8u);
    MEMORY[0x2611E3480](v18, -1, -1);
  }

  if (a4)
  {
    uint64_t v19 = a1;
    sub_25E7A84C0();
    uint64_t v20 = swift_allocError();
    *(void *)uint64_t v21 = v19;
    *(void *)(v21 + 8) = 0;
    *(unsigned char *)(v21 + 16) = 4;
    a4(0, v20);
    unint64_t v22 = (void *)v20;
LABEL_19:
  }
}

void WFSetupServerAnisetteDataProvider.eraseAnisette(completion:)(void (*a1)(void, void *), uint64_t a2)
{
  uint64_t v3 = v2;
  if (qword_26A7065C0 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_25E7BC2E0();
  __swift_project_value_buffer(v5, (uint64_t)qword_26A7089C8);
  uint64_t v6 = sub_25E7BC2C0();
  os_log_type_t v7 = sub_25E7BC4A0();
  if (os_log_type_enabled(v6, v7))
  {
    os_log_type_t v8 = (uint8_t *)swift_slowAlloc();
    uint64_t v9 = swift_slowAlloc();
    uint64_t aBlock = v9;
    *(_DWORD *)os_log_type_t v8 = 136446210;
    uint64_t v45 = sub_25E77CF40(0xD00000000000001ALL, 0x800000025E7C11D0, &aBlock);
    sub_25E7BC520();
    _os_log_impl(&dword_25E775000, v6, v7, "%{public}s is invoked. ", v8, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2611E3480](v9, -1, -1);
    MEMORY[0x2611E3480](v8, -1, -1);
  }

  uint64_t v10 = (id *)(v3 + OBJC_IVAR____TtC10TDGSharing33WFSetupServerAnisetteDataProvider_session);
  swift_beginAccess();
  if (*v10)
  {
    id v35 = *v10;
    uint64_t v11 = MEMORY[0x263F8EE78];
    unint64_t v12 = sub_25E7886EC(MEMORY[0x263F8EE78]);
    uint64_t v13 = (objc_class *)type metadata accessor for AnisetteServiceFactory.AnisetteRequest();
    uint64_t v14 = (char *)objc_allocWithZone(v13);
    uint64_t v15 = OBJC_IVAR___WFAnisetteRequest_data;
    uint64_t v16 = v14;
    *(void *)&v14[v15] = sub_25E7886EC(v11);
    os_log_type_t v17 = &v16[OBJC_IVAR___WFAnisetteRequest_id];
    *(void *)os_log_type_t v17 = 0x6573617265;
    *((void *)v17 + 1) = 0xE500000000000000;
    *(void *)&v14[v15] = v12;

    swift_bridgeObjectRelease();
    v43.receiver = v16;
    v43.super_class = v13;
    id v18 = objc_msgSendSuper2(&v43, sel_init);
    uint64_t v25 = sub_25E7B8AC4();
    unint64_t v27 = v26;

    unint64_t v34 = (void *)sub_25E7BC3D0();
    sub_25E7885A8(MEMORY[0x263F8EE78]);
    uint64_t v28 = (void *)sub_25E7BC370();
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A706D80);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_25E7BDF10;
    uint64_t aBlock = 0x6573617265;
    unint64_t v38 = 0xE500000000000000;
    sub_25E7BC580();
    *(void *)(inited + 96) = MEMORY[0x263F06F78];
    *(void *)(inited + 72) = v25;
    *(void *)(inited + 80) = v27;
    sub_25E77CE0C(v25, v27);
    sub_25E7885A8(inited);
    uint64_t v30 = (void *)sub_25E7BC370();
    swift_bridgeObjectRelease();
    uint64_t v31 = swift_allocObject();
    swift_unknownObjectWeakInit();
    unint64_t v32 = (void *)swift_allocObject();
    _OWORD v32[2] = a1;
    uint64_t v32[3] = a2;
    v32[4] = v31;
    unsigned int v41 = sub_25E7BBB64;
    uint64_t v42 = v32;
    uint64_t aBlock = MEMORY[0x263EF8330];
    unint64_t v38 = 1107296256;
    unint64_t v39 = sub_25E7B3604;
    char v40 = &block_descriptor_17;
    uint64_t v33 = _Block_copy(&aBlock);
    sub_25E785E00((uint64_t)a1);
    swift_release();
    objc_msgSend(v35, sel_sendRequestID_options_request_responseHandler_, v34, v28, v30, v33);
    _Block_release(v33);

    sub_25E77D724(v25, v27);
  }
  else
  {
    if (qword_26A7065D0 != -1) {
      swift_once();
    }
    __swift_project_value_buffer(v5, (uint64_t)qword_26A7089F8);
    uint64_t v19 = sub_25E7BC2C0();
    os_log_type_t v20 = sub_25E7BC490();
    if (os_log_type_enabled(v19, v20))
    {
      uint64_t v21 = (uint8_t *)swift_slowAlloc();
      uint64_t v22 = swift_slowAlloc();
      uint64_t aBlock = v22;
      *(_DWORD *)uint64_t v21 = 136446210;
      uint64_t v44 = sub_25E77CF40(0xD00000000000001ALL, 0x800000025E7C11D0, &aBlock);
      sub_25E7BC520();
      _os_log_impl(&dword_25E775000, v19, v20, "%{public}s invoked but session is nil", v21, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2611E3480](v22, -1, -1);
      MEMORY[0x2611E3480](v21, -1, -1);
    }

    if (a1)
    {
      sub_25E7A84C0();
      uint64_t v23 = (void *)swift_allocError();
      *(void *)uint64_t v24 = 0;
      *(void *)(v24 + 8) = 0;
      *(unsigned char *)(v24 + 16) = 5;
      a1(0, v23);
    }
  }
}

void sub_25E7B52E4(unsigned int a1, uint64_t a2, uint64_t a3, void (*a4)(void, void), uint64_t a5, uint64_t a6)
{
  uint64_t v11 = sub_25E7BC2E0();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11, v13);
  uint64_t v15 = (char *)v59 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a1)
  {
    swift_beginAccess();
    uint64_t v23 = MEMORY[0x2611E34D0](a6 + 16);
    if (v23)
    {
      uint64_t v24 = (void *)v23;
      id v37 = (char *)sub_25E7BBF50(a3, 2);

      if (v37)
      {
        uint64_t v38 = *(void *)&v37[OBJC_IVAR___WFAnisetteResponse_data];
        if (*(void *)(v38 + 16))
        {
          swift_bridgeObjectRetain();
          unint64_t v39 = sub_25E7A8D0C(0x6465736172457369, 0xE800000000000000);
          if (v40)
          {
            sub_25E78337C(*(void *)(v38 + 56) + 32 * v39, (uint64_t)&v64);
          }
          else
          {
            uint64_t v64 = 0;
            uint64_t v65 = 0;
            uint64_t v66 = 0;
            uint64_t v67 = 1;
          }
          swift_bridgeObjectRelease();
          if (v67 != 1)
          {
            sub_25E7BC098((uint64_t)&v64, (uint64_t)v68);
            if (v68[3])
            {
              if (swift_dynamicCast())
              {
                uint64_t v61 = a5;
                unsigned int v41 = v63;
                if (qword_26A7065C0 != -1) {
                  swift_once();
                }
                uint64_t v42 = __swift_project_value_buffer(v11, (uint64_t)qword_26A7089C8);
                (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v15, v42, v11);
                objc_super v43 = sub_25E7BC2C0();
                os_log_type_t v44 = sub_25E7BC4A0();
                BOOL v45 = os_log_type_enabled(v43, v44);
                unsigned int v60 = v41;
                if (v45)
                {
                  uint64_t v46 = swift_slowAlloc();
                  unsigned __int8 v62 = a4;
                  uint64_t v47 = v46;
                  uint64_t v48 = swift_slowAlloc();
                  v59[1] = v42;
                  uint64_t v49 = v48;
                  v68[0] = v48;
                  *(_DWORD *)uint64_t v47 = 67109378;
                  LODWORD(v64) = v41;
                  sub_25E7BC520();
                  *(_WORD *)(v47 + 8) = 2080;
                  uint64_t v64 = sub_25E77CF40(0x6573617265, 0xE500000000000000, v68);
                  sub_25E7BC520();
                  _os_log_impl(&dword_25E775000, v43, v44, "Received response: isErased %{BOOL}d for service id: %s", (uint8_t *)v47, 0x12u);
                  swift_arrayDestroy();
                  MEMORY[0x2611E3480](v49, -1, -1);
                  uint64_t v50 = v47;
                  a4 = v62;
                  MEMORY[0x2611E3480](v50, -1, -1);
                }

                (*(void (**)(char *, uint64_t))(v12 + 8))(v15, v11);
                if (a4)
                {
                  swift_retain();
                  uint64_t v51 = sub_25E7BC2C0();
                  os_log_type_t v52 = sub_25E7BC4A0();
                  if (os_log_type_enabled(v51, v52))
                  {
                    uint64_t v53 = (uint8_t *)swift_slowAlloc();
                    uint64_t v54 = swift_slowAlloc();
                    v68[0] = v54;
                    *(_DWORD *)uint64_t v53 = 136446210;
                    uint64_t v64 = sub_25E77CF40(0xD00000000000001ALL, 0x800000025E7C11D0, v68);
                    sub_25E7BC520();
                    _os_log_impl(&dword_25E775000, v51, v52, "Invoking completion block that was passed into: %{public}s", v53, 0xCu);
                    swift_arrayDestroy();
                    MEMORY[0x2611E3480](v54, -1, -1);
                    MEMORY[0x2611E3480](v53, -1, -1);
                  }

                  a4(v60, 0);
                  sub_25E785F38((uint64_t)a4);
                }
                else
                {
                  uint64_t v55 = sub_25E7BC2C0();
                  os_log_type_t v56 = sub_25E7BC4A0();
                  if (os_log_type_enabled(v55, v56))
                  {
                    int v57 = (uint8_t *)swift_slowAlloc();
                    uint64_t v58 = swift_slowAlloc();
                    v68[0] = v58;
                    *(_DWORD *)int v57 = 136446210;
                    uint64_t v64 = sub_25E77CF40(0xD00000000000001ALL, 0x800000025E7C11D0, v68);
                    sub_25E7BC520();
                    _os_log_impl(&dword_25E775000, v55, v56, "No completion block passed into %{public}s. ", v57, 0xCu);
                    swift_arrayDestroy();
                    MEMORY[0x2611E3480](v58, -1, -1);
                    MEMORY[0x2611E3480](v57, -1, -1);
                  }
                  else
                  {
                  }
                }
                return;
              }
LABEL_14:
              if (qword_26A7065C0 != -1) {
                swift_once();
              }
              __swift_project_value_buffer(v11, (uint64_t)qword_26A7089C8);
              unint64_t v27 = v37;
              uint64_t v28 = sub_25E7BC2C0();
              os_log_type_t v29 = sub_25E7BC490();
              if (os_log_type_enabled(v28, v29))
              {
                uint64_t v30 = (uint8_t *)swift_slowAlloc();
                uint64_t v31 = swift_slowAlloc();
                v68[0] = v31;
                unsigned __int8 v62 = a4;
                *(_DWORD *)uint64_t v30 = 136315138;
                uint64_t v64 = (uint64_t)v37;
                unint64_t v32 = v27;
                __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A706E10);
                uint64_t v33 = sub_25E7BC3F0();
                uint64_t v64 = sub_25E77CF40(v33, v34, v68);
                a4 = v62;
                sub_25E7BC520();

                swift_bridgeObjectRelease();
                _os_log_impl(&dword_25E775000, v28, v29, "Failed to retrieve value for isErased from anisetteResponse: %s", v30, 0xCu);
                swift_arrayDestroy();
                MEMORY[0x2611E3480](v31, -1, -1);
                MEMORY[0x2611E3480](v30, -1, -1);

                if (a4)
                {
LABEL_18:
                  sub_25E7A84C0();
                  uint64_t v35 = swift_allocError();
                  *(_OWORD *)uint64_t v36 = xmmword_25E7BEDB0;
                  *(unsigned char *)(v36 + 16) = 0;
                  a4(0, v35);

                  uint64_t v22 = (void *)v35;
                  goto LABEL_19;
                }
              }
              else
              {

                if (a4) {
                  goto LABEL_18;
                }
              }

              return;
            }
            uint64_t v25 = &qword_26A706790;
            unint64_t v26 = v68;
LABEL_13:
            sub_25E784970((uint64_t)v26, v25);
            goto LABEL_14;
          }
LABEL_12:
          uint64_t v25 = (uint64_t *)&unk_26A706E08;
          unint64_t v26 = &v64;
          goto LABEL_13;
        }
      }
    }
    else
    {
      id v37 = 0;
    }
    uint64_t v64 = 0;
    uint64_t v65 = 0;
    uint64_t v66 = 0;
    uint64_t v67 = 1;
    goto LABEL_12;
  }
  if (qword_26A7065D0 != -1) {
    swift_once();
  }
  __swift_project_value_buffer(v11, (uint64_t)qword_26A7089F8);
  uint64_t v16 = sub_25E7BC2C0();
  os_log_type_t v17 = sub_25E7BC490();
  if (os_log_type_enabled(v16, v17))
  {
    id v18 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)id v18 = 67109120;
    LODWORD(v68[0]) = a1;
    sub_25E7BC520();
    _os_log_impl(&dword_25E775000, v16, v17, "Erase anisette request failed with error: %d", v18, 8u);
    MEMORY[0x2611E3480](v18, -1, -1);
  }

  if (a4)
  {
    uint64_t v19 = a1;
    sub_25E7A84C0();
    uint64_t v20 = swift_allocError();
    *(void *)uint64_t v21 = v19;
    *(void *)(v21 + 8) = 0;
    *(unsigned char *)(v21 + 16) = 4;
    a4(0, v20);
    uint64_t v22 = (void *)v20;
LABEL_19:
  }
}

void WFSetupServerAnisetteDataProvider.fetchAnisetteDataAndProvisionIfNecessary(_:withCompletion:)(char a1, void (*a2)(void, void), uint64_t a3)
{
  uint64_t v4 = v3;
  if (qword_26A7065C0 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_25E7BC2E0();
  __swift_project_value_buffer(v6, (uint64_t)qword_26A7089C8);
  os_log_type_t v7 = sub_25E7BC2C0();
  os_log_type_t v8 = sub_25E7BC4A0();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    uint64_t v10 = a2;
    uint64_t v11 = swift_slowAlloc();
    uint64_t aBlock = v11;
    *(_DWORD *)uint64_t v9 = 136446210;
    uint64_t v50 = sub_25E77CF40(0xD00000000000003BLL, 0x800000025E7C11F0, &aBlock);
    sub_25E7BC520();
    _os_log_impl(&dword_25E775000, v7, v8, "%{public}s is invoked. ", v9, 0xCu);
    swift_arrayDestroy();
    uint64_t v12 = v11;
    a2 = v10;
    MEMORY[0x2611E3480](v12, -1, -1);
    MEMORY[0x2611E3480](v9, -1, -1);
  }

  uint64_t v13 = (void **)(v4 + OBJC_IVAR____TtC10TDGSharing33WFSetupServerAnisetteDataProvider_session);
  swift_beginAccess();
  uint64_t v14 = *v13;
  if (*v13)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A7069A8);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_25E7BDF10;
    *(void *)(inited + 32) = 0x7250646C756F6873;
    *(void *)(inited + 40) = 0xEF6E6F697369766FLL;
    *(void *)(inited + 72) = MEMORY[0x263F8D4F8];
    *(unsigned char *)(inited + 48) = a1 & 1;
    id v16 = v14;
    unint64_t v17 = sub_25E7886EC(inited);
    id v18 = (objc_class *)type metadata accessor for AnisetteServiceFactory.AnisetteRequest();
    uint64_t v19 = (char *)objc_allocWithZone(v18);
    uint64_t v20 = OBJC_IVAR___WFAnisetteRequest_data;
    uint64_t v21 = v19;
    *(void *)&v19[v20] = sub_25E7886EC(MEMORY[0x263F8EE78]);
    uint64_t v22 = &v21[OBJC_IVAR___WFAnisetteRequest_id];
    *(void *)uint64_t v22 = 0x6863746566;
    *((void *)v22 + 1) = 0xE500000000000000;
    *(void *)&v19[v20] = v17;

    swift_bridgeObjectRelease();
    v48.receiver = v21;
    v48.super_class = v18;
    id v23 = objc_msgSendSuper2(&v48, sel_init);
    uint64_t v30 = sub_25E7B8AC4();
    unint64_t v32 = v31;

    char v40 = (void *)sub_25E7BC3D0();
    sub_25E7885A8(MEMORY[0x263F8EE78]);
    uint64_t v33 = (void *)sub_25E7BC370();
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A706D80);
    uint64_t v34 = swift_initStackObject();
    *(_OWORD *)(v34 + 16) = xmmword_25E7BDF10;
    uint64_t aBlock = 0x6863746566;
    unint64_t v43 = 0xE500000000000000;
    sub_25E7BC580();
    *(void *)(v34 + 96) = MEMORY[0x263F06F78];
    *(void *)(v34 + 72) = v30;
    *(void *)(v34 + 80) = v32;
    sub_25E77CE0C(v30, v32);
    sub_25E7885A8(v34);
    uint64_t v35 = (void *)sub_25E7BC370();
    swift_bridgeObjectRelease();
    uint64_t v36 = swift_allocObject();
    swift_unknownObjectWeakInit();
    id v37 = (void *)swift_allocObject();
    _OWORD v37[2] = a2;
    _OWORD v37[3] = a3;
    v37[4] = v36;
    uint64_t v46 = sub_25E7BBB74;
    uint64_t v47 = v37;
    uint64_t aBlock = MEMORY[0x263EF8330];
    unint64_t v43 = 1107296256;
    os_log_type_t v44 = sub_25E7B3604;
    BOOL v45 = &block_descriptor_24_1;
    uint64_t v38 = _Block_copy(&aBlock);
    sub_25E785E00((uint64_t)a2);
    swift_release();
    objc_msgSend(v16, sel_sendRequestID_options_request_responseHandler_, v40, v33, v35, v38);
    _Block_release(v38);

    sub_25E77D724(v30, v32);
  }
  else
  {
    if (qword_26A7065D0 != -1) {
      swift_once();
    }
    __swift_project_value_buffer(v6, (uint64_t)qword_26A7089F8);
    uint64_t v24 = sub_25E7BC2C0();
    os_log_type_t v25 = sub_25E7BC490();
    if (os_log_type_enabled(v24, v25))
    {
      unint64_t v26 = (uint8_t *)swift_slowAlloc();
      uint64_t v27 = swift_slowAlloc();
      uint64_t aBlock = v27;
      *(_DWORD *)unint64_t v26 = 136446210;
      uint64_t v49 = sub_25E77CF40(0xD00000000000003BLL, 0x800000025E7C11F0, &aBlock);
      sub_25E7BC520();
      _os_log_impl(&dword_25E775000, v24, v25, "%{public}s invoked but session is nil", v26, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2611E3480](v27, -1, -1);
      MEMORY[0x2611E3480](v26, -1, -1);
    }

    if (a2)
    {
      sub_25E7A84C0();
      uint64_t v28 = (void *)swift_allocError();
      *(void *)uint64_t v29 = 0;
      *(void *)(v29 + 8) = 0;
      *(unsigned char *)(v29 + 16) = 5;
      a2(0, v28);
    }
  }
}

void WFSetupServerAnisetteDataProvider.legacyAnisetteData(forDSID:withCompletion:)(uint64_t a1, uint64_t a2, void (*a3)(void, void *), uint64_t a4)
{
  uint64_t v5 = v4;
  if (qword_26A7065C0 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_25E7BC2E0();
  __swift_project_value_buffer(v8, (uint64_t)qword_26A7089C8);
  uint64_t v9 = sub_25E7BC2C0();
  os_log_type_t v10 = sub_25E7BC4A0();
  BOOL v45 = a3;
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    uint64_t v12 = a1;
    uint64_t v13 = v5;
    uint64_t v14 = swift_slowAlloc();
    uint64_t aBlock = v14;
    *(_DWORD *)uint64_t v11 = 136446210;
    uint64_t v54 = sub_25E77CF40(0xD00000000000002BLL, 0x800000025E7C1230, &aBlock);
    sub_25E7BC520();
    _os_log_impl(&dword_25E775000, v9, v10, "%{public}s is invoked. ", v11, 0xCu);
    swift_arrayDestroy();
    uint64_t v15 = v14;
    uint64_t v5 = v13;
    a1 = v12;
    MEMORY[0x2611E3480](v15, -1, -1);
    MEMORY[0x2611E3480](v11, -1, -1);
  }

  id v16 = (void **)(v5 + OBJC_IVAR____TtC10TDGSharing33WFSetupServerAnisetteDataProvider_session);
  swift_beginAccess();
  unint64_t v17 = *v16;
  if (*v16)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A7069A8);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_25E7BDF10;
    *(void *)(inited + 32) = 1684632420;
    *(void *)(inited + 40) = 0xE400000000000000;
    *(void *)(inited + 72) = __swift_instantiateConcreteTypeFromMangledName(&qword_26A706640);
    *(void *)(inited + 48) = a1;
    *(void *)(inited + 56) = a2;
    swift_bridgeObjectRetain();
    id v43 = v17;
    unint64_t v19 = sub_25E7886EC(inited);
    uint64_t v20 = (objc_class *)type metadata accessor for AnisetteServiceFactory.AnisetteRequest();
    uint64_t v21 = (char *)objc_allocWithZone(v20);
    uint64_t v22 = OBJC_IVAR___WFAnisetteRequest_data;
    id v23 = v21;
    *(void *)&v21[v22] = sub_25E7886EC(MEMORY[0x263F8EE78]);
    uint64_t v24 = &v23[OBJC_IVAR___WFAnisetteRequest_id];
    *(void *)uint64_t v24 = 0x79636167656CLL;
    *((void *)v24 + 1) = 0xE600000000000000;
    *(void *)&v21[v22] = v19;

    swift_bridgeObjectRelease();
    v52.receiver = v23;
    v52.super_class = v20;
    id v25 = objc_msgSendSuper2(&v52, sel_init);
    uint64_t v32 = sub_25E7B8AC4();
    unint64_t v34 = v33;

    uint64_t v35 = (void *)sub_25E7BC3D0();
    sub_25E7885A8(MEMORY[0x263F8EE78]);
    uint64_t v36 = (void *)sub_25E7BC370();
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A706D80);
    uint64_t v37 = swift_initStackObject();
    *(_OWORD *)(v37 + 16) = xmmword_25E7BDF10;
    uint64_t aBlock = 0x79636167656CLL;
    unint64_t v47 = 0xE600000000000000;
    sub_25E7BC580();
    *(void *)(v37 + 96) = MEMORY[0x263F06F78];
    *(void *)(v37 + 72) = v32;
    *(void *)(v37 + 80) = v34;
    sub_25E77CE0C(v32, v34);
    sub_25E7885A8(v37);
    uint64_t v38 = (void *)sub_25E7BC370();
    swift_bridgeObjectRelease();
    uint64_t v39 = swift_allocObject();
    swift_unknownObjectWeakInit();
    char v40 = (void *)swift_allocObject();
    _OWORD v40[2] = v45;
    v40[3] = a4;
    id v40[4] = v39;
    uint64_t v50 = sub_25E7BBC40;
    uint64_t v51 = v40;
    uint64_t aBlock = MEMORY[0x263EF8330];
    unint64_t v47 = 1107296256;
    objc_super v48 = sub_25E7B3604;
    uint64_t v49 = &block_descriptor_31;
    unsigned int v41 = _Block_copy(&aBlock);
    sub_25E785E00((uint64_t)v45);
    swift_release();
    objc_msgSend(v43, sel_sendRequestID_options_request_responseHandler_, v35, v36, v38, v41);

    _Block_release(v41);
    sub_25E77D724(v32, v34);
  }
  else
  {
    if (qword_26A7065D0 != -1) {
      swift_once();
    }
    __swift_project_value_buffer(v8, (uint64_t)qword_26A7089F8);
    unint64_t v26 = sub_25E7BC2C0();
    os_log_type_t v27 = sub_25E7BC490();
    if (os_log_type_enabled(v26, v27))
    {
      uint64_t v28 = (uint8_t *)swift_slowAlloc();
      uint64_t v29 = swift_slowAlloc();
      uint64_t aBlock = v29;
      *(_DWORD *)uint64_t v28 = 136446210;
      uint64_t v53 = sub_25E77CF40(0xD00000000000002BLL, 0x800000025E7C1230, &aBlock);
      sub_25E7BC520();
      _os_log_impl(&dword_25E775000, v26, v27, "%{public}s invoked but session is nil", v28, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2611E3480](v29, -1, -1);
      MEMORY[0x2611E3480](v28, -1, -1);
    }

    if (v45)
    {
      sub_25E7A84C0();
      uint64_t v30 = (void *)swift_allocError();
      *(void *)uint64_t v31 = 0;
      *(void *)(v31 + 8) = 0;
      *(unsigned char *)(v31 + 16) = 5;
      v45(0, v30);
    }
  }
}

void sub_25E7B6E84(unsigned int a1, __n128 a2, uint64_t a3, uint64_t a4, void (*a5)(void, void), uint64_t a6, uint64_t a7, char a8, const char *a9, uint64_t a10, unint64_t a11, unint64_t a12, const char *a13)
{
  __n128 v85 = a2;
  uint64_t v19 = sub_25E7BC2E0();
  uint64_t v20 = *(void *)(v19 - 8);
  MEMORY[0x270FA5388](v19, v21);
  id v23 = (char *)v78 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a1)
  {
    swift_beginAccess();
    uint64_t v31 = MEMORY[0x2611E34D0](a7 + 16);
    if (v31)
    {
      uint64_t v32 = (void *)v31;
      BOOL v45 = (char *)sub_25E7BBF50(a4, a8);

      if (v45)
      {
        uint64_t v46 = *(void *)&v45[OBJC_IVAR___WFAnisetteResponse_data];
        if (*(void *)(v46 + 16))
        {
          swift_bridgeObjectRetain();
          unint64_t v47 = sub_25E7A8D0C(0x6574746573696E61, 0xEC00000061746144);
          if (v48)
          {
            sub_25E78337C(*(void *)(v46 + 56) + 32 * v47, (uint64_t)&v87);
          }
          else
          {
            uint64_t v87 = 0;
            uint64_t v88 = 0;
            uint64_t v89 = 0;
            uint64_t v90 = 1;
          }
          swift_bridgeObjectRelease();
          if (v90 != 1)
          {
            sub_25E7BC098((uint64_t)&v87, (uint64_t)v91);
            if (v91[3])
            {
              sub_25E78314C(0, &qword_26A706C90);
              if (swift_dynamicCast())
              {
                uint64_t v49 = v86;
                if (qword_26A7065D0 != -1) {
                  swift_once();
                }
                uint64_t v83 = a10;
                unint64_t v84 = (uint8_t *)a11;
                uint64_t v50 = __swift_project_value_buffer(v19, (uint64_t)qword_26A7089F8);
                (*(void (**)(char *, uint64_t, uint64_t))(v20 + 16))(v23, v50, v19);
                id v51 = v49;
                objc_super v52 = sub_25E7BC2C0();
                os_log_type_t v53 = sub_25E7BC4A0();
                int v82 = v53;
                BOOL v54 = os_log_type_enabled(v52, v53);
                v85.n128_u64[0] = (unint64_t)v51;
                if (v54)
                {
                  uint64_t v55 = swift_slowAlloc();
                  os_log_t v79 = v52;
                  uint64_t v56 = v55;
                  uint64_t v80 = swift_slowAlloc();
                  v91[0] = v80;
                  *(_DWORD *)uint64_t v56 = 136315394;
                  v78[1] = v56 + 4;
                  id v57 = objc_msgSend(v51, sel_description);
                  uint64_t v58 = sub_25E7BC3E0();
                  unint64_t v81 = v45;
                  uint64_t v59 = a5;
                  uint64_t v60 = v58;
                  unint64_t v62 = v61;
                  v78[0] = v61;

                  uint64_t v63 = v60;
                  a5 = v59;
                  BOOL v45 = v81;
                  uint64_t v87 = sub_25E77CF40(v63, v62, v91);
                  sub_25E7BC520();
                  uint64_t v64 = (void *)v85.n128_u64[0];

                  swift_bridgeObjectRelease();
                  *(_WORD *)(v56 + 12) = 2080;
                  uint64_t v87 = sub_25E77CF40(0x6863746566, 0xE500000000000000, v91);
                  sub_25E7BC520();
                  os_log_t v65 = v79;
                  _os_log_impl(&dword_25E775000, v79, (os_log_type_t)v82, a9, (uint8_t *)v56, 0x16u);
                  uint64_t v66 = v80;
                  swift_arrayDestroy();
                  MEMORY[0x2611E3480](v66, -1, -1);
                  MEMORY[0x2611E3480](v56, -1, -1);
                }
                else
                {
                }
                (*(void (**)(char *, uint64_t))(v20 + 8))(v23, v19);
                if (a5)
                {
                  uint64_t v67 = qword_26A7065C0;
                  swift_retain();
                  if (v67 != -1) {
                    swift_once();
                  }
                  __swift_project_value_buffer(v19, (uint64_t)qword_26A7089C8);
                  uint64_t v68 = sub_25E7BC2C0();
                  os_log_type_t v69 = sub_25E7BC4A0();
                  if (os_log_type_enabled(v68, v69))
                  {
                    uint64_t v70 = (uint8_t *)swift_slowAlloc();
                    uint64_t v71 = swift_slowAlloc();
                    v91[0] = v71;
                    *(_DWORD *)uint64_t v70 = 136446210;
                    uint64_t v87 = sub_25E77CF40(v83, (unint64_t)v84, v91);
                    sub_25E7BC520();
                    _os_log_impl(&dword_25E775000, v68, v69, "Invoking completion block that was passed into: %{public}s", v70, 0xCu);
                    swift_arrayDestroy();
                    MEMORY[0x2611E3480](v71, -1, -1);
                    MEMORY[0x2611E3480](v70, -1, -1);
                  }

                  unint64_t v72 = v85.n128_u64[0];
                  id v73 = (id)v85.n128_u64[0];
                  a5(v72, 0);

                  sub_25E785F38((uint64_t)a5);
                }
                else
                {
                  if (qword_26A7065C0 != -1) {
                    swift_once();
                  }
                  __swift_project_value_buffer(v19, (uint64_t)qword_26A7089C8);
                  os_log_type_t v74 = sub_25E7BC2C0();
                  os_log_type_t v75 = sub_25E7BC4A0();
                  if (os_log_type_enabled(v74, v75))
                  {
                    uint64_t v76 = (uint8_t *)swift_slowAlloc();
                    uint64_t v77 = swift_slowAlloc();
                    v91[0] = v77;
                    *(_DWORD *)uint64_t v76 = 136446210;
                    uint64_t v87 = sub_25E77CF40(v83, (unint64_t)v84, v91);
                    sub_25E7BC520();
                    _os_log_impl(&dword_25E775000, v74, v75, "No completion block passed into %{public}s. ", v76, 0xCu);
                    swift_arrayDestroy();
                    MEMORY[0x2611E3480](v77, -1, -1);
                    MEMORY[0x2611E3480](v76, -1, -1);
                  }
                  else
                  {
                  }
                }
                return;
              }
LABEL_14:
              if (qword_26A7065C0 != -1) {
                swift_once();
              }
              __swift_project_value_buffer(v19, (uint64_t)qword_26A7089C8);
              uint64_t v35 = v45;
              uint64_t v36 = sub_25E7BC2C0();
              os_log_type_t v37 = sub_25E7BC490();
              if (os_log_type_enabled(v36, v37))
              {
                v85.n128_u64[0] = a12;
                uint64_t v38 = (uint8_t *)swift_slowAlloc();
                uint64_t v39 = swift_slowAlloc();
                v91[0] = v39;
                *(_DWORD *)uint64_t v38 = 136315138;
                unint64_t v84 = v38 + 4;
                uint64_t v87 = (uint64_t)v45;
                char v40 = v35;
                __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A706E10);
                uint64_t v41 = sub_25E7BC3F0();
                uint64_t v87 = sub_25E77CF40(v41, v42, v91);
                sub_25E7BC520();

                swift_bridgeObjectRelease();
                _os_log_impl(&dword_25E775000, v36, v37, (const char *)v85.n128_u64[0], v38, 0xCu);
                swift_arrayDestroy();
                MEMORY[0x2611E3480](v39, -1, -1);
                MEMORY[0x2611E3480](v38, -1, -1);

                if (a5)
                {
LABEL_18:
                  sub_25E7A84C0();
                  uint64_t v43 = swift_allocError();
                  *(_OWORD *)uint64_t v44 = xmmword_25E7BEDE0;
                  *(unsigned char *)(v44 + 16) = 0;
                  a5(0, v43);

                  uint64_t v30 = (void *)v43;
                  goto LABEL_19;
                }
              }
              else
              {

                if (a5) {
                  goto LABEL_18;
                }
              }

              return;
            }
            unint64_t v33 = &qword_26A706790;
            unint64_t v34 = v91;
LABEL_13:
            sub_25E784970((uint64_t)v34, v33);
            goto LABEL_14;
          }
LABEL_12:
          unint64_t v33 = (uint64_t *)&unk_26A706E08;
          unint64_t v34 = &v87;
          goto LABEL_13;
        }
      }
    }
    else
    {
      BOOL v45 = 0;
    }
    uint64_t v87 = 0;
    uint64_t v88 = 0;
    uint64_t v89 = 0;
    uint64_t v90 = 1;
    goto LABEL_12;
  }
  if (qword_26A7065D0 != -1) {
    swift_once();
  }
  __swift_project_value_buffer(v19, (uint64_t)qword_26A7089F8);
  uint64_t v24 = sub_25E7BC2C0();
  os_log_type_t v25 = sub_25E7BC490();
  if (os_log_type_enabled(v24, v25))
  {
    unint64_t v26 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)unint64_t v26 = 67109120;
    LODWORD(v91[0]) = a1;
    sub_25E7BC520();
    _os_log_impl(&dword_25E775000, v24, v25, a13, v26, 8u);
    MEMORY[0x2611E3480](v26, -1, -1);
  }

  if (a5)
  {
    uint64_t v27 = a1;
    sub_25E7A84C0();
    uint64_t v28 = swift_allocError();
    *(void *)uint64_t v29 = v27;
    *(void *)(v29 + 8) = 0;
    *(unsigned char *)(v29 + 16) = 4;
    a5(0, v28);
    uint64_t v30 = (void *)v28;
LABEL_19:
  }
}

uint64_t sub_25E7B7B30(uint64_t a1, unint64_t a2)
{
  sub_25E78314C(0, &qword_26A706C98);
  type metadata accessor for AnisetteServiceFactory.AnisetteResponse();
  uint64_t result = sub_25E7BC4B0();
  if (!result)
  {
    if (qword_26A7065C0 != -1) {
      swift_once();
    }
    uint64_t v5 = sub_25E7BC2E0();
    __swift_project_value_buffer(v5, (uint64_t)qword_26A7089C8);
    sub_25E77CE0C(a1, a2);
    sub_25E77CE0C(a1, a2);
    uint64_t v6 = sub_25E7BC2C0();
    os_log_type_t v7 = sub_25E7BC490();
    if (os_log_type_enabled(v6, v7))
    {
      uint64_t v8 = (uint8_t *)swift_slowAlloc();
      uint64_t v9 = swift_slowAlloc();
      uint64_t v13 = v9;
      *(_DWORD *)uint64_t v8 = 136315138;
      sub_25E77CE0C(a1, a2);
      uint64_t v10 = sub_25E7BC1F0();
      unint64_t v12 = v11;
      sub_25E77D724(a1, a2);
      sub_25E77CF40(v10, v12, &v13);
      sub_25E7BC520();
      swift_bridgeObjectRelease();
      sub_25E77D724(a1, a2);
      sub_25E77D724(a1, a2);
      _os_log_impl(&dword_25E775000, v6, v7, "Failed to unarchive anisette data response for %s", v8, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2611E3480](v9, -1, -1);
      MEMORY[0x2611E3480](v8, -1, -1);
    }
    else
    {
      sub_25E77D724(a1, a2);
      sub_25E77D724(a1, a2);
    }

    return 0;
  }
  return result;
}

uint64_t sub_25E7B7FB8(uint64_t a1)
{
  uint64_t v6 = MEMORY[0x263F8EE78];
  uint64_t v2 = *(void *)(a1 + 16);
  sub_25E7BC5F0();
  if (!v2) {
    return v6;
  }
  for (uint64_t i = a1 + 32; ; i += 32)
  {
    sub_25E77D9C8(i, (uint64_t)v5);
    sub_25E78314C(0, &qword_26A706DA0);
    if (!swift_dynamicCast()) {
      break;
    }
    sub_25E7BC5D0();
    sub_25E7BC600();
    sub_25E7BC610();
    sub_25E7BC5E0();
    if (!--v2) {
      return v6;
    }
  }
  swift_release();

  return 0;
}

id WFSetupServerAnisetteDataProvider.__deallocating_deinit()
{
  return sub_25E7B9EF8(type metadata accessor for WFSetupServerAnisetteDataProvider);
}

uint64_t sub_25E7B8160()
{
  return 540697705;
}

uint64_t sub_25E7B8264(void *a1)
{
  uint64_t v3 = *(void *)(v1 + OBJC_IVAR___WFAnisetteRequest_id);
  uint64_t v4 = *(void *)(v1 + OBJC_IVAR___WFAnisetteRequest_id + 8);
  uint64_t v24 = MEMORY[0x263F8D310];
  v23[0] = v3;
  v23[1] = v4;
  sub_25E78337C((uint64_t)v23, (uint64_t)v21);
  uint64_t v5 = v22;
  if (v22)
  {
    uint64_t v6 = __swift_project_boxed_opaque_existential_0(v21, v22);
    uint64_t v7 = *(void *)(v5 - 8);
    MEMORY[0x270FA5388](v6, v6);
    uint64_t v9 = (char *)v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v7 + 16))(v9);
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_25E7BC6C0();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v5);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v21);
  }
  else
  {
    swift_bridgeObjectRetain();
    uint64_t v10 = 0;
  }
  unint64_t v11 = (void *)sub_25E7BC3D0();
  objc_msgSend(a1, sel_encodeObject_forKey_, v10, v11);
  swift_unknownObjectRelease();

  sub_25E784970((uint64_t)v23, &qword_26A706790);
  uint64_t v12 = *(void *)(v1 + OBJC_IVAR___WFAnisetteRequest_data);
  uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A706E00);
  v23[0] = v12;
  sub_25E78337C((uint64_t)v23, (uint64_t)v21);
  uint64_t v13 = v22;
  if (v22)
  {
    uint64_t v14 = __swift_project_boxed_opaque_existential_0(v21, v22);
    uint64_t v15 = *(void *)(v13 - 8);
    MEMORY[0x270FA5388](v14, v14);
    unint64_t v17 = (char *)v21 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v15 + 16))(v17);
    swift_bridgeObjectRetain();
    uint64_t v18 = sub_25E7BC6C0();
    (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v13);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v21);
  }
  else
  {
    swift_bridgeObjectRetain();
    uint64_t v18 = 0;
  }
  uint64_t v19 = (void *)sub_25E7BC3D0();
  objc_msgSend(a1, sel_encodeObject_forKey_, v18, v19);
  swift_unknownObjectRelease();

  return sub_25E784970((uint64_t)v23, &qword_26A706790);
}

id sub_25E7B85CC(void *a1)
{
  uint64_t v3 = OBJC_IVAR___WFAnisetteRequest_data;
  uint64_t v4 = v1;
  *(void *)&v1[v3] = sub_25E7886EC(MEMORY[0x263F8EE78]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7067C0);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_25E7BDF10;
  uint64_t v6 = sub_25E78314C(0, (unint64_t *)&unk_26A7067D0);
  *(void *)(v5 + 32) = v6;
  sub_25E7BC4F0();
  swift_bridgeObjectRelease();
  if (!v25)
  {
    sub_25E784970((uint64_t)v24, &qword_26A706790);
    goto LABEL_7;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_7:
    if (qword_26A7065C0 != -1) {
      swift_once();
    }
    uint64_t v13 = sub_25E7BC2E0();
    __swift_project_value_buffer(v13, (uint64_t)qword_26A7089C8);
    uint64_t v14 = sub_25E7BC2C0();
    os_log_type_t v15 = sub_25E7BC490();
    if (!os_log_type_enabled(v14, v15)) {
      goto LABEL_18;
    }
    uint64_t v16 = (uint8_t *)swift_slowAlloc();
    uint64_t v17 = swift_slowAlloc();
    v24[0] = v17;
    *(_DWORD *)uint64_t v16 = 136315138;
    uint64_t v22 = sub_25E77CF40(0x6574746573696E41, 0xEF74736575716552, v24);
    sub_25E7BC520();
    uint64_t v18 = "Failed to decode id for object %s";
    goto LABEL_17;
  }
  uint64_t v8 = v22;
  uint64_t v7 = v23;
  uint64_t v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_25E7BEDF0;
  *(void *)(v9 + 32) = v6;
  *(void *)(v9 + 40) = sub_25E78314C(0, (unint64_t *)&unk_26A706DE0);
  *(void *)(v9 + 48) = sub_25E78314C(0, &qword_26A7067F0);
  *(void *)(v9 + 56) = sub_25E78314C(0, (unint64_t *)&qword_26A706DF0);
  sub_25E7BC4F0();
  swift_bridgeObjectRelease();
  if (!v25)
  {
    swift_bridgeObjectRelease();
    sub_25E784970((uint64_t)v24, &qword_26A706790);
LABEL_13:
    if (qword_26A7065C0 != -1) {
      swift_once();
    }
    uint64_t v19 = sub_25E7BC2E0();
    __swift_project_value_buffer(v19, (uint64_t)qword_26A7089C8);
    uint64_t v14 = sub_25E7BC2C0();
    os_log_type_t v15 = sub_25E7BC490();
    if (!os_log_type_enabled(v14, v15)) {
      goto LABEL_18;
    }
    uint64_t v16 = (uint8_t *)swift_slowAlloc();
    uint64_t v17 = swift_slowAlloc();
    v24[0] = v17;
    *(_DWORD *)uint64_t v16 = 136315138;
    uint64_t v22 = sub_25E77CF40(0x6574746573696E41, 0xEF74736575716552, v24);
    sub_25E7BC520();
    uint64_t v18 = "Failed to decode data for object %s";
LABEL_17:
    _os_log_impl(&dword_25E775000, v14, v15, v18, v16, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2611E3480](v17, -1, -1);
    MEMORY[0x2611E3480](v16, -1, -1);
LABEL_18:

    swift_bridgeObjectRelease();
    type metadata accessor for AnisetteServiceFactory.AnisetteRequest();
    swift_deallocPartialClassInstance();
    return 0;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A706E00);
  if ((swift_dynamicCast() & 1) == 0)
  {
    swift_bridgeObjectRelease();
    goto LABEL_13;
  }
  uint64_t v10 = v22;
  unint64_t v11 = (uint64_t *)&v4[OBJC_IVAR___WFAnisetteRequest_id];
  *unint64_t v11 = v8;
  v11[1] = v7;
  *(void *)&v1[v3] = v10;

  swift_bridgeObjectRelease();
  v21.receiver = v4;
  v21.super_class = (Class)type metadata accessor for AnisetteServiceFactory.AnisetteRequest();
  id v12 = objc_msgSendSuper2(&v21, sel_init);

  return v12;
}

uint64_t sub_25E7B8AC4()
{
  v36[1] = *(id *)MEMORY[0x263EF8340];
  v36[0] = 0;
  id v1 = objc_msgSend(self, sel_archivedDataWithRootObject_requiringSecureCoding_error_, v0, 1, v36);
  id v2 = v36[0];
  if (v1)
  {
    uint64_t v3 = sub_25E7BC210();

    if (qword_26A7065C0 != -1) {
      swift_once();
    }
    uint64_t v4 = sub_25E7BC2E0();
    __swift_project_value_buffer(v4, (uint64_t)qword_26A7089C8);
    id v5 = v0;
    uint64_t v6 = sub_25E7BC2C0();
    os_log_type_t v7 = sub_25E7BC4A0();
    if (os_log_type_enabled(v6, v7))
    {
      uint64_t v34 = v3;
      uint64_t v8 = (uint8_t *)swift_slowAlloc();
      uint64_t v9 = (void *)swift_slowAlloc();
      v36[0] = v9;
      *(_DWORD *)uint64_t v8 = 136315138;
      id v10 = objc_msgSend(v5, sel_description);
      uint64_t v11 = sub_25E7BC3E0();
      unint64_t v13 = v12;

      uint64_t v14 = v11;
      uint64_t v3 = v34;
      sub_25E77CF40(v14, v13, (uint64_t *)v36);
      sub_25E7BC520();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25E775000, v6, v7, "Successfully archived request: %s", v8, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2611E3480](v9, -1, -1);
      MEMORY[0x2611E3480](v8, -1, -1);
    }
    else
    {
    }
  }
  else
  {
    os_log_type_t v15 = v2;
    uint64_t v16 = (void *)sub_25E7BC1E0();

    swift_willThrow();
    if (qword_26A7065C0 != -1) {
      swift_once();
    }
    uint64_t v17 = sub_25E7BC2E0();
    uint64_t v3 = __swift_project_value_buffer(v17, (uint64_t)qword_26A7089C8);
    id v18 = v0;
    id v19 = v16;
    id v20 = v18;
    id v21 = v16;
    uint64_t v22 = sub_25E7BC2C0();
    os_log_type_t v23 = sub_25E7BC490();
    if (os_log_type_enabled(v22, v23))
    {
      uint64_t v24 = swift_slowAlloc();
      uint64_t v35 = (void *)swift_slowAlloc();
      v36[0] = v35;
      *(_DWORD *)uint64_t v24 = 136315394;
      id v25 = objc_msgSend(v20, sel_description);
      unint64_t v26 = v16;
      uint64_t v27 = sub_25E7BC3E0();
      unint64_t v29 = v28;

      sub_25E77CF40(v27, v29, (uint64_t *)v36);
      sub_25E7BC520();

      swift_bridgeObjectRelease();
      *(_WORD *)(v24 + 12) = 2082;
      id v30 = v26;
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A706DD0);
      uint64_t v31 = sub_25E7BC3F0();
      sub_25E77CF40(v31, v32, (uint64_t *)v36);
      sub_25E7BC520();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_25E775000, v22, v23, "Failed to archive request %s with error: %{public}s", (uint8_t *)v24, 0x16u);
      uint64_t v3 = (uint64_t)v35;
      swift_arrayDestroy();
      MEMORY[0x2611E3480](v35, -1, -1);
      MEMORY[0x2611E3480](v24, -1, -1);
    }
    else
    {
    }
    swift_willThrow();
  }
  return v3;
}

id sub_25E7B8FB4()
{
  return sub_25E7B9EF8(type metadata accessor for AnisetteServiceFactory.AnisetteRequest);
}

id sub_25E7B8FF8(void *a1, uint64_t a2, void (*a3)(void))
{
  id v4 = a1;
  a3();

  id v5 = (void *)sub_25E7BC3D0();
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_25E7B9068()
{
  return 540697705;
}

uint64_t sub_25E7B916C(char a1)
{
  if (a1) {
    return 1635017060;
  }
  else {
    return 25705;
  }
}

uint64_t sub_25E7B9198(void *a1)
{
  uint64_t v3 = *(void *)(v1 + OBJC_IVAR___WFAnisetteResponse_id);
  uint64_t v4 = *(void *)(v1 + OBJC_IVAR___WFAnisetteResponse_id + 8);
  uint64_t v24 = MEMORY[0x263F8D310];
  v23[0] = v3;
  v23[1] = v4;
  sub_25E78337C((uint64_t)v23, (uint64_t)v21);
  uint64_t v5 = v22;
  if (v22)
  {
    uint64_t v6 = __swift_project_boxed_opaque_existential_0(v21, v22);
    uint64_t v7 = *(void *)(v5 - 8);
    MEMORY[0x270FA5388](v6, v6);
    uint64_t v9 = (char *)v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v7 + 16))(v9);
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_25E7BC6C0();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v5);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v21);
  }
  else
  {
    swift_bridgeObjectRetain();
    uint64_t v10 = 0;
  }
  uint64_t v11 = (void *)sub_25E7BC3D0();
  objc_msgSend(a1, sel_encodeObject_forKey_, v10, v11);
  swift_unknownObjectRelease();

  sub_25E784970((uint64_t)v23, &qword_26A706790);
  uint64_t v12 = *(void *)(v1 + OBJC_IVAR___WFAnisetteResponse_data);
  uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A706DD8);
  v23[0] = v12;
  sub_25E78337C((uint64_t)v23, (uint64_t)v21);
  uint64_t v13 = v22;
  if (v22)
  {
    uint64_t v14 = __swift_project_boxed_opaque_existential_0(v21, v22);
    uint64_t v15 = *(void *)(v13 - 8);
    MEMORY[0x270FA5388](v14, v14);
    uint64_t v17 = (char *)v21 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v15 + 16))(v17);
    swift_bridgeObjectRetain();
    uint64_t v18 = sub_25E7BC6C0();
    (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v13);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v21);
  }
  else
  {
    swift_bridgeObjectRetain();
    uint64_t v18 = 0;
  }
  id v19 = (void *)sub_25E7BC3D0();
  objc_msgSend(a1, sel_encodeObject_forKey_, v18, v19);
  swift_unknownObjectRelease();

  return sub_25E784970((uint64_t)v23, &qword_26A706790);
}

id sub_25E7B9500(void *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7067C0);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_25E7BDF10;
  uint64_t v4 = sub_25E78314C(0, (unint64_t *)&unk_26A7067D0);
  *(void *)(v3 + 32) = v4;
  uint64_t v5 = v1;
  sub_25E7BC4F0();
  swift_bridgeObjectRelease();
  if (!v24)
  {

    sub_25E784970((uint64_t)v23, &qword_26A706790);
LABEL_8:
    if (qword_26A7065C0 != -1) {
      swift_once();
    }
    uint64_t v12 = sub_25E7BC2E0();
    __swift_project_value_buffer(v12, (uint64_t)qword_26A7089C8);
    uint64_t v13 = sub_25E7BC2C0();
    os_log_type_t v14 = sub_25E7BC490();
    if (!os_log_type_enabled(v13, v14)) {
      goto LABEL_19;
    }
    uint64_t v15 = (uint8_t *)swift_slowAlloc();
    uint64_t v16 = swift_slowAlloc();
    v23[0] = v16;
    *(_DWORD *)uint64_t v15 = 136315138;
    uint64_t v21 = sub_25E77CF40(0xD000000000000010, 0x800000025E7BEE50, v23);
    sub_25E7BC520();
    _os_log_impl(&dword_25E775000, v13, v14, "Failed to decode id for object %s", v15, 0xCu);
    goto LABEL_18;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {

    goto LABEL_8;
  }
  uint64_t v7 = v21;
  uint64_t v6 = v22;
  uint64_t v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_25E7BDF40;
  *(void *)(v8 + 32) = v4;
  *(void *)(v8 + 40) = sub_25E78314C(0, (unint64_t *)&unk_26A706DE0);
  *(void *)(v8 + 48) = sub_25E78314C(0, &qword_26A7067F0);
  *(void *)(v8 + 56) = sub_25E78314C(0, (unint64_t *)&qword_26A706DF0);
  *(void *)(v8 + 64) = sub_25E78314C(0, &qword_26A706C90);
  sub_25E7BC4F0();
  swift_bridgeObjectRelease();
  if (!v24)
  {

    swift_bridgeObjectRelease();
    sub_25E784970((uint64_t)v23, &qword_26A706790);
LABEL_14:
    if (qword_26A7065C0 != -1) {
      swift_once();
    }
    uint64_t v17 = sub_25E7BC2E0();
    __swift_project_value_buffer(v17, (uint64_t)qword_26A7089C8);
    uint64_t v13 = sub_25E7BC2C0();
    os_log_type_t v18 = sub_25E7BC490();
    if (!os_log_type_enabled(v13, v18)) {
      goto LABEL_19;
    }
    uint64_t v15 = (uint8_t *)swift_slowAlloc();
    uint64_t v16 = swift_slowAlloc();
    v23[0] = v16;
    *(_DWORD *)uint64_t v15 = 136315138;
    uint64_t v21 = sub_25E77CF40(0xD000000000000010, 0x800000025E7BEE50, v23);
    sub_25E7BC520();
    _os_log_impl(&dword_25E775000, v13, v18, "Failed to decode data for object %s", v15, 0xCu);
LABEL_18:
    swift_arrayDestroy();
    MEMORY[0x2611E3480](v16, -1, -1);
    MEMORY[0x2611E3480](v15, -1, -1);
LABEL_19:

    type metadata accessor for AnisetteServiceFactory.AnisetteResponse();
    swift_deallocPartialClassInstance();
    return 0;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A706DD8);
  if ((swift_dynamicCast() & 1) == 0)
  {

    swift_bridgeObjectRelease();
    goto LABEL_14;
  }
  uint64_t v9 = v21;
  uint64_t v10 = (uint64_t *)&v5[OBJC_IVAR___WFAnisetteResponse_id];
  uint64_t *v10 = v7;
  v10[1] = v6;
  *(void *)&v5[OBJC_IVAR___WFAnisetteResponse_data] = v9;

  v20.receiver = v5;
  v20.super_class = (Class)type metadata accessor for AnisetteServiceFactory.AnisetteResponse();
  id v11 = objc_msgSendSuper2(&v20, sel_init);

  return v11;
}

uint64_t sub_25E7B9A00()
{
  v35[1] = *(id *)MEMORY[0x263EF8340];
  v35[0] = 0;
  id v1 = objc_msgSend(self, sel_archivedDataWithRootObject_requiringSecureCoding_error_, v0, 1, v35);
  id v2 = v35[0];
  if (v1)
  {
    uint64_t v3 = sub_25E7BC210();

    if (qword_26A7065C0 != -1) {
      swift_once();
    }
    uint64_t v4 = sub_25E7BC2E0();
    __swift_project_value_buffer(v4, (uint64_t)qword_26A7089C8);
    id v5 = v0;
    uint64_t v6 = sub_25E7BC2C0();
    os_log_type_t v7 = sub_25E7BC4A0();
    if (os_log_type_enabled(v6, v7))
    {
      uint64_t v34 = v3;
      uint64_t v8 = (uint8_t *)swift_slowAlloc();
      uint64_t v9 = (void *)swift_slowAlloc();
      v35[0] = v9;
      *(_DWORD *)uint64_t v8 = 136315138;
      id v10 = objc_msgSend(v5, sel_description);
      uint64_t v11 = sub_25E7BC3E0();
      unint64_t v13 = v12;

      uint64_t v14 = v11;
      uint64_t v3 = v34;
      sub_25E77CF40(v14, v13, (uint64_t *)v35);
      sub_25E7BC520();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25E775000, v6, v7, "Successfully archived response: %s", v8, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2611E3480](v9, -1, -1);
      MEMORY[0x2611E3480](v8, -1, -1);
    }
    else
    {
    }
  }
  else
  {
    uint64_t v15 = v2;
    uint64_t v16 = (void *)sub_25E7BC1E0();

    swift_willThrow();
    if (qword_26A7065C0 != -1) {
      swift_once();
    }
    uint64_t v17 = sub_25E7BC2E0();
    __swift_project_value_buffer(v17, (uint64_t)qword_26A7089C8);
    id v18 = v0;
    id v19 = v16;
    id v20 = v18;
    id v21 = v16;
    uint64_t v22 = sub_25E7BC2C0();
    os_log_type_t v23 = sub_25E7BC490();
    if (os_log_type_enabled(v22, v23))
    {
      uint64_t v24 = swift_slowAlloc();
      id v25 = (void *)swift_slowAlloc();
      v35[0] = v25;
      *(_DWORD *)uint64_t v24 = 136315394;
      id v26 = objc_msgSend(v20, sel_description);
      uint64_t v27 = sub_25E7BC3E0();
      unint64_t v29 = v28;

      sub_25E77CF40(v27, v29, (uint64_t *)v35);
      sub_25E7BC520();

      swift_bridgeObjectRelease();
      *(_WORD *)(v24 + 12) = 2080;
      id v30 = v16;
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A706DD0);
      uint64_t v31 = sub_25E7BC3F0();
      sub_25E77CF40(v31, v32, (uint64_t *)v35);
      sub_25E7BC520();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_25E775000, v22, v23, "Failed to archive request %s with error: %s", (uint8_t *)v24, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x2611E3480](v25, -1, -1);
      MEMORY[0x2611E3480](v24, -1, -1);
    }
    else
    {
    }
    return 0;
  }
  return v3;
}

id sub_25E7B9EE0()
{
  return sub_25E7B9EF8(type metadata accessor for AnisetteServiceFactory.AnisetteResponse);
}

id sub_25E7B9EF8(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

uint64_t sub_25E7B9F44()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25E7B9F90()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t sub_25E7B9FA0(char a1)
{
  uint64_t result = 0xD000000000000013;
  if (a1)
  {
    if (a1 == 1) {
      return 0xD00000000000001BLL;
    }
    else {
      return 0x6E6F6973736573;
    }
  }
  return result;
}

uint64_t static WFSetupServerAnisetteDataProvider.supportsSecureCoding.getter()
{
  return 1;
}

Swift::Void __swiftcall WFSetupServerAnisetteDataProvider.encode(with:)(NSCoder with)
{
  objc_super v3 = (void **)(v1 + OBJC_IVAR____TtC10TDGSharing33WFSetupServerAnisetteDataProvider_companionAuthDevice);
  swift_beginAccess();
  uint64_t v4 = *v3;
  if (*v3)
  {
    *((void *)&v40 + 1) = sub_25E78314C(0, (unint64_t *)&unk_26A706DA8);
    *(void *)&long long v39 = v4;
    sub_25E78337C((uint64_t)&v39, (uint64_t)v37);
    uint64_t v5 = v38;
    if (v38)
    {
      uint64_t v6 = __swift_project_boxed_opaque_existential_0(v37, v38);
      uint64_t v7 = *(void *)(v5 - 8);
      MEMORY[0x270FA5388](v6, v6);
      uint64_t v9 = (char *)&v37[-1] - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
      (*(void (**)(char *))(v7 + 16))(v9);
      id v10 = v4;
      uint64_t v11 = sub_25E7BC6C0();
      (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v5);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v37);
    }
    else
    {
      id v12 = v4;
      uint64_t v11 = 0;
    }
    unint64_t v13 = (void *)sub_25E7BC3D0();
    [(objc_class *)with.super.isa encodeObject:v11 forKey:v13];
    swift_unknownObjectRelease();
  }
  else
  {
    long long v39 = 0u;
    long long v40 = 0u;
  }
  sub_25E784970((uint64_t)&v39, &qword_26A706790);
  uint64_t v14 = (void **)(v1 + OBJC_IVAR____TtC10TDGSharing33WFSetupServerAnisetteDataProvider_transportableAuthKitAccount);
  swift_beginAccess();
  uint64_t v15 = *v14;
  if (*v14)
  {
    *((void *)&v40 + 1) = sub_25E78314C(0, &qword_26A706DA0);
    *(void *)&long long v39 = v15;
    sub_25E78337C((uint64_t)&v39, (uint64_t)v37);
    uint64_t v16 = v38;
    if (v38)
    {
      uint64_t v17 = __swift_project_boxed_opaque_existential_0(v37, v38);
      uint64_t v18 = *(void *)(v16 - 8);
      MEMORY[0x270FA5388](v17, v17);
      id v20 = (char *)&v37[-1] - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
      (*(void (**)(char *))(v18 + 16))(v20);
      id v21 = v15;
      uint64_t v22 = sub_25E7BC6C0();
      (*(void (**)(char *, uint64_t))(v18 + 8))(v20, v16);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v37);
    }
    else
    {
      id v23 = v15;
      uint64_t v22 = 0;
    }
    uint64_t v24 = (void *)sub_25E7BC3D0();
    [(objc_class *)with.super.isa encodeObject:v22 forKey:v24];
    swift_unknownObjectRelease();
  }
  else
  {
    long long v39 = 0u;
    long long v40 = 0u;
  }
  sub_25E784970((uint64_t)&v39, &qword_26A706790);
  id v25 = (void **)(v1 + OBJC_IVAR____TtC10TDGSharing33WFSetupServerAnisetteDataProvider_session);
  swift_beginAccess();
  id v26 = *v25;
  if (*v25)
  {
    *((void *)&v40 + 1) = sub_25E78314C(0, &qword_26A706A38);
    *(void *)&long long v39 = v26;
    sub_25E78337C((uint64_t)&v39, (uint64_t)v37);
    uint64_t v27 = v38;
    if (v38)
    {
      unint64_t v28 = __swift_project_boxed_opaque_existential_0(v37, v38);
      uint64_t v29 = *(void *)(v27 - 8);
      MEMORY[0x270FA5388](v28, v28);
      uint64_t v31 = (char *)&v37[-1] - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
      (*(void (**)(char *))(v29 + 16))(v31);
      id v32 = v26;
      uint64_t v33 = sub_25E7BC6C0();
      (*(void (**)(char *, uint64_t))(v29 + 8))(v31, v27);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v37);
    }
    else
    {
      id v34 = v26;
      uint64_t v33 = 0;
    }
    uint64_t v35 = (void *)sub_25E7BC3D0();
    [(objc_class *)with.super.isa encodeObject:v33 forKey:v35];
    swift_unknownObjectRelease();
  }
  else
  {
    long long v39 = 0u;
    long long v40 = 0u;
  }
  sub_25E784970((uint64_t)&v39, &qword_26A706790);
}

uint64_t sub_25E7BA58C(uint64_t (*a1)(void))
{
  uint64_t v1 = a1();
  return MEMORY[0x270FA0128](v1, 0);
}

uint64_t sub_25E7BA5C8()
{
  unint64_t v0 = sub_25E7BC680();
  swift_bridgeObjectRelease();
  if (v0 >= 5) {
    return 5;
  }
  else {
    return v0;
  }
}

void *sub_25E7BA614()
{
  if (qword_26A7065C0 != -1) {
    goto LABEL_76;
  }
  while (1)
  {
    uint64_t v0 = sub_25E7BC2E0();
    __swift_project_value_buffer(v0, (uint64_t)qword_26A7089C8);
    uint64_t v1 = sub_25E7BC2C0();
    os_log_type_t v2 = sub_25E7BC4A0();
    if (os_log_type_enabled(v1, v2))
    {
      objc_super v3 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)objc_super v3 = 0;
      _os_log_impl(&dword_25E775000, v1, v2, "Accessing idmsAccountForICloud property", v3, 2u);
      MEMORY[0x2611E3480](v3, -1, -1);
    }

    id v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFB210]), sel_init);
    id v5 = objc_msgSend(v4, sel_aa_primaryAppleAccount);
    if (!v5) {
      break;
    }
    uint64_t v6 = v5;
    id v7 = objc_msgSend(v5, sel_username);
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v84 = sub_25E7BC3E0();
      uint64_t v87 = v9;
    }
    else
    {
      uint64_t v84 = 0;
      uint64_t v87 = 0;
    }
    id v13 = objc_msgSend(v6, sel_aa_altDSID, v80);
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v85 = sub_25E7BC3E0();
      uint64_t v16 = v15;
    }
    else
    {
      uint64_t v85 = 0;
      uint64_t v16 = 0;
    }
    uint64_t v17 = (void *)sub_25E7BC3D0();
    id v18 = objc_msgSend(v6, sel_accountPropertyForKey_, v17);

    if (v18)
    {
      sub_25E7BC540();
      swift_unknownObjectRelease();
    }
    else
    {
      long long v91 = 0u;
      long long v92 = 0u;
    }
    sub_25E7BC098((uint64_t)&v91, (uint64_t)v93);
    if (v94)
    {
      sub_25E78314C(0, (unint64_t *)&unk_26A706DE0);
      if (swift_dynamicCast()) {
        uint64_t v19 = v90;
      }
      else {
        uint64_t v19 = 0;
      }
    }
    else
    {
      sub_25E784970((uint64_t)v93, &qword_26A706790);
      uint64_t v19 = 0;
    }
    id v20 = objc_msgSend(v4, sel_accountTypeWithAccountTypeIdentifier_, *MEMORY[0x263EFAF00]);
    id v21 = objc_msgSend(v4, sel_accountsWithAccountType_, v20);
    if (!v21
      || (uint64_t v22 = v21,
          uint64_t v23 = sub_25E7BC450(),
          v22,
          unint64_t v24 = sub_25E7B7FB8(v23),
          swift_bridgeObjectRelease(),
          !v24))
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v27 = sub_25E7BC2C0();
      os_log_type_t v28 = sub_25E7BC490();
      if (os_log_type_enabled(v27, v28))
      {
        uint64_t v29 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v29 = 0;
        uint64_t v30 = "Failed to retrieve idms accounts";
        goto LABEL_81;
      }
LABEL_82:

      return 0;
    }
    if (v24 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v25 = sub_25E7BC630();
      swift_bridgeObjectRelease();
      if (!v25)
      {
LABEL_78:
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
LABEL_79:
        uint64_t v27 = sub_25E7BC2C0();
        os_log_type_t v28 = sub_25E7BC490();
        if (os_log_type_enabled(v27, v28))
        {
          uint64_t v29 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v29 = 0;
          uint64_t v30 = "Failed to find idms account asscociated with primary icloud account";
LABEL_81:
          _os_log_impl(&dword_25E775000, v27, v28, v30, v29, 2u);
          MEMORY[0x2611E3480](v29, -1, -1);
        }
        goto LABEL_82;
      }
    }
    else
    {
      uint64_t v25 = *(void *)((v24 & 0xFFFFFFFFFFFFFF8) + 0x10);
      if (!v25) {
        goto LABEL_78;
      }
    }
    uint64_t v83 = v19;
    uint64_t v80 = v20;
    unint64_t v81 = v6;
    int v82 = v4;
    uint64_t v26 = 4;
    while (1)
    {
      id v31 = (v24 & 0xC000000000000001) != 0
          ? (id)MEMORY[0x2611E2C70](v26 - 4, v24)
          : *(id *)(v24 + 8 * v26);
      id v32 = v31;
      uint64_t v33 = v26 - 3;
      if (__OFADD__(v26 - 4, 1)) {
        break;
      }
      id v34 = objc_msgSend(v31, sel_aa_altDSID);
      if (v34)
      {
        uint64_t v35 = v34;
        uint64_t v36 = sub_25E7BC3E0();
        unint64_t v38 = v37;

        if (v16)
        {
          if (v36 == v85 && v16 == v38)
          {
            uint64_t v36 = v85;
LABEL_61:
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            id v50 = v32;
            swift_bridgeObjectRetain();
            id v51 = sub_25E7BC2C0();
            os_log_type_t v52 = sub_25E7BC4A0();
            if (!os_log_type_enabled(v51, v52))
            {

              swift_bridgeObjectRelease_n();
              return v32;
            }
            uint64_t v53 = swift_slowAlloc();
            uint64_t v88 = swift_slowAlloc();
            v93[0] = v88;
            *(_DWORD *)uint64_t v53 = 136315394;
            id v54 = objc_msgSend(v50, sel_description);
            uint64_t v55 = sub_25E7BC3E0();
            unint64_t v57 = v56;

            *(void *)&long long v91 = sub_25E77CF40(v55, v57, v93);
            sub_25E7BC520();

            swift_bridgeObjectRelease();
            *(_WORD *)(v53 + 12) = 2080;
            swift_bridgeObjectRetain();
            *(void *)&long long v91 = sub_25E77CF40(v36, v38, v93);
            sub_25E7BC520();
            swift_bridgeObjectRelease_n();
            uint64_t v58 = "Found idms account: %s with matching dsid: %s";
            uint64_t v59 = v51;
            os_log_type_t v60 = v52;
LABEL_67:
            _os_log_impl(&dword_25E775000, v59, v60, v58, (uint8_t *)v53, 0x16u);
            swift_arrayDestroy();
            MEMORY[0x2611E3480](v88, -1, -1);
            MEMORY[0x2611E3480](v53, -1, -1);

LABEL_68:
            uint64_t v67 = v81;
LABEL_70:

LABEL_71:
            return v32;
          }
          if (sub_25E7BC6D0()) {
            goto LABEL_61;
          }
        }
        swift_bridgeObjectRelease();
      }
      id v40 = objc_msgSend(v32, sel_username, v80);
      if (v40)
      {
        uint64_t v41 = v40;
        uint64_t v42 = sub_25E7BC3E0();
        unint64_t v44 = v43;

        if (v87)
        {
          if (v42 == v84 && v87 == v44)
          {
            uint64_t v42 = v84;
LABEL_65:
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            id v61 = v32;
            swift_bridgeObjectRetain();
            id v51 = sub_25E7BC2C0();
            os_log_type_t v62 = sub_25E7BC4A0();
            if (os_log_type_enabled(v51, v62))
            {
              uint64_t v53 = swift_slowAlloc();
              uint64_t v88 = swift_slowAlloc();
              v93[0] = v88;
              *(_DWORD *)uint64_t v53 = 136315394;
              id v63 = objc_msgSend(v61, sel_description);
              uint64_t v64 = sub_25E7BC3E0();
              unint64_t v66 = v65;

              *(void *)&long long v91 = sub_25E77CF40(v64, v66, v93);
              sub_25E7BC520();

              swift_bridgeObjectRelease();
              *(_WORD *)(v53 + 12) = 2080;
              swift_bridgeObjectRetain();
              *(void *)&long long v91 = sub_25E77CF40(v42, v44, v93);
              sub_25E7BC520();
              swift_bridgeObjectRelease_n();
              uint64_t v58 = "Found idms account: %s with matching username: %s";
              uint64_t v59 = v51;
              os_log_type_t v60 = v62;
              goto LABEL_67;
            }

            swift_bridgeObjectRelease_n();
            uint64_t v67 = v83;
            goto LABEL_70;
          }
          if (sub_25E7BC6D0()) {
            goto LABEL_65;
          }
        }
        swift_bridgeObjectRelease();
      }
      BOOL v45 = (void *)sub_25E7BC3D0();
      id v46 = objc_msgSend(v32, sel_accountPropertyForKey_, v45);

      if (v46)
      {
        sub_25E7BC540();
        swift_unknownObjectRelease();
      }
      else
      {
        long long v91 = 0u;
        long long v92 = 0u;
      }
      sub_25E7BC098((uint64_t)&v91, (uint64_t)v93);
      if (v94)
      {
        sub_25E78314C(0, (unint64_t *)&unk_26A706DE0);
        if (swift_dynamicCast())
        {
          if (v83)
          {
            id v47 = v90;
            id v48 = v83;
            char v49 = sub_25E7BC500();

            if (v49)
            {
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              id v68 = v32;
              id v69 = v47;
              id v70 = v68;
              id v71 = v69;
              id v51 = sub_25E7BC2C0();
              os_log_type_t v72 = sub_25E7BC4A0();
              if (os_log_type_enabled(v51, v72))
              {
                uint64_t v73 = swift_slowAlloc();
                uint64_t v86 = (void *)swift_slowAlloc();
                uint64_t v89 = swift_slowAlloc();
                v93[0] = v89;
                *(_DWORD *)uint64_t v73 = 136315394;
                id v74 = objc_msgSend(v70, sel_description);
                uint64_t v75 = sub_25E7BC3E0();
                unint64_t v77 = v76;

                *(void *)&long long v91 = sub_25E77CF40(v75, v77, v93);
                sub_25E7BC520();

                swift_bridgeObjectRelease();
                *(_WORD *)(v73 + 12) = 2112;
                *(void *)&long long v91 = v71;
                id v78 = v71;
                sub_25E7BC520();
                *uint64_t v86 = v71;

                _os_log_impl(&dword_25E775000, v51, v72, "Found idms account: %s with matching dsid: %@", (uint8_t *)v73, 0x16u);
                __swift_instantiateConcreteTypeFromMangledName(&qword_26A7069B0);
                swift_arrayDestroy();
                MEMORY[0x2611E3480](v86, -1, -1);
                swift_arrayDestroy();
                MEMORY[0x2611E3480](v89, -1, -1);
                MEMORY[0x2611E3480](v73, -1, -1);

                goto LABEL_68;
              }

              goto LABEL_71;
            }
          }
          else
          {
          }
        }
      }
      else
      {

        sub_25E784970((uint64_t)v93, &qword_26A706790);
      }
      ++v26;
      if (v33 == v25)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v6 = v81;
        id v4 = v82;
        id v20 = v80;
        uint64_t v19 = v83;
        goto LABEL_79;
      }
    }
    __break(1u);
LABEL_76:
    swift_once();
  }
  id v10 = sub_25E7BC2C0();
  os_log_type_t v11 = sub_25E7BC490();
  if (os_log_type_enabled(v10, v11))
  {
    id v12 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v12 = 0;
    _os_log_impl(&dword_25E775000, v10, v11, "Failed to retrieve primary iCloud account", v12, 2u);
    MEMORY[0x2611E3480](v12, -1, -1);
  }

  return 0;
}

id sub_25E7BB2A4()
{
  v30[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t v0 = sub_25E7BA614();
  if (!v0)
  {
    if (qword_26A7065C0 != -1) {
      swift_once();
    }
    uint64_t v13 = sub_25E7BC2E0();
    __swift_project_value_buffer(v13, (uint64_t)qword_26A7089C8);
    uint64_t v14 = sub_25E7BC2C0();
    os_log_type_t v15 = sub_25E7BC490();
    if (os_log_type_enabled(v14, v15))
    {
      uint64_t v16 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v16 = 0;
      _os_log_impl(&dword_25E775000, v14, v15, "Unable to provide clientDeviceAccount due to failure to retrieve idms account", v16, 2u);
      MEMORY[0x2611E3480](v16, -1, -1);
    }

    return 0;
  }
  uint64_t v1 = v0;
  id v2 = objc_msgSend(self, sel_sharedInstance);
  id v3 = objc_msgSend(v2, sel_transportableAuthKitAccount_, v1);

  id v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFB210]), sel_init);
  v30[0] = 0;
  id v5 = objc_msgSend(v4, sel_credentialForAccount_error_, v3, v30);

  if (!v5)
  {
    id v17 = v30[0];
    id v18 = (void *)sub_25E7BC1E0();

    swift_willThrow();
    if (qword_26A7065C0 != -1) {
      swift_once();
    }
    uint64_t v19 = sub_25E7BC2E0();
    __swift_project_value_buffer(v19, (uint64_t)qword_26A7089C8);
    id v20 = v18;
    id v21 = v18;
    uint64_t v22 = sub_25E7BC2C0();
    os_log_type_t v23 = sub_25E7BC490();
    if (os_log_type_enabled(v22, v23))
    {
      unint64_t v24 = (uint8_t *)swift_slowAlloc();
      uint64_t v25 = (void *)swift_slowAlloc();
      v30[0] = v25;
      *(_DWORD *)unint64_t v24 = 136446210;
      id v26 = v18;
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A706DD0);
      uint64_t v27 = sub_25E7BC3F0();
      sub_25E77CF40(v27, v28, (uint64_t *)v30);
      sub_25E7BC520();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_25E775000, v22, v23, "Failed to retrieve account credentials due to error: %{public}s", v24, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2611E3480](v25, -1, -1);
      MEMORY[0x2611E3480](v24, -1, -1);
    }
    else
    {
    }
    return 0;
  }
  uint64_t v6 = qword_26A7065C0;
  id v7 = v30[0];
  if (v6 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_25E7BC2E0();
  __swift_project_value_buffer(v8, (uint64_t)qword_26A7089C8);
  uint64_t v9 = sub_25E7BC2C0();
  os_log_type_t v10 = sub_25E7BC4A0();
  if (os_log_type_enabled(v9, v10))
  {
    os_log_type_t v11 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)os_log_type_t v11 = 0;
    _os_log_impl(&dword_25E775000, v9, v10, "Successfully retrieved accounts credentials", v11, 2u);
    MEMORY[0x2611E3480](v11, -1, -1);
  }

  if (v3)
  {
    id v12 = v3;
    objc_msgSend(v12, sel_setCredential_, v5);
  }
  else
  {
  }
  return v3;
}

id sub_25E7BB730()
{
  *(void *)&v0[OBJC_IVAR____TtC10TDGSharing33WFSetupServerAnisetteDataProvider_session] = 0;
  uint64_t v1 = (void **)&v0[OBJC_IVAR____TtC10TDGSharing33WFSetupServerAnisetteDataProvider_companionAuthDevice];
  *(void *)&v0[OBJC_IVAR____TtC10TDGSharing33WFSetupServerAnisetteDataProvider_companionAuthDevice] = 0;
  id v2 = (void **)&v0[OBJC_IVAR____TtC10TDGSharing33WFSetupServerAnisetteDataProvider_transportableAuthKitAccount];
  *(void *)&v0[OBJC_IVAR____TtC10TDGSharing33WFSetupServerAnisetteDataProvider_transportableAuthKitAccount] = 0;
  uint64_t v3 = qword_26A7065C0;
  id v4 = v0;
  if (v3 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_25E7BC2E0();
  __swift_project_value_buffer(v5, (uint64_t)qword_26A7089C8);
  uint64_t v6 = sub_25E7BC2C0();
  os_log_type_t v7 = sub_25E7BC4A0();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    uint64_t v9 = swift_slowAlloc();
    v20[0] = v9;
    *(_DWORD *)uint64_t v8 = 136446210;
    uint64_t v19 = sub_25E77CF40(0x646F632874696E69, 0xEC000000293A7265, v20);
    sub_25E7BC520();
    _os_log_impl(&dword_25E775000, v6, v7, "%{public}s is invoked.", v8, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2611E3480](v9, -1, -1);
    MEMORY[0x2611E3480](v8, -1, -1);
  }

  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7067C0);
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_25E7BDF10;
  *(void *)(v10 + 32) = sub_25E78314C(0, (unint64_t *)&unk_26A706DA8);
  sub_25E7BC4F0();
  swift_bridgeObjectRelease();
  if (v21)
  {
    if (swift_dynamicCast()) {
      os_log_type_t v11 = (void *)v19;
    }
    else {
      os_log_type_t v11 = 0;
    }
  }
  else
  {
    sub_25E784970((uint64_t)v20, &qword_26A706790);
    os_log_type_t v11 = 0;
  }
  swift_beginAccess();
  id v12 = *v1;
  *uint64_t v1 = v11;

  uint64_t v13 = swift_allocObject();
  *(_OWORD *)(v13 + 16) = xmmword_25E7BDF10;
  *(void *)(v13 + 32) = sub_25E78314C(0, &qword_26A706DA0);
  sub_25E7BC4F0();
  swift_bridgeObjectRelease();
  if (v21)
  {
    if (swift_dynamicCast()) {
      uint64_t v14 = v17;
    }
    else {
      uint64_t v14 = 0;
    }
  }
  else
  {
    sub_25E784970((uint64_t)v20, &qword_26A706790);
    uint64_t v14 = 0;
  }
  swift_beginAccess();
  os_log_type_t v15 = *v2;
  *id v2 = v14;

  v18.receiver = v4;
  v18.super_class = (Class)type metadata accessor for WFSetupServerAnisetteDataProvider();
  return objc_msgSendSuper2(&v18, sel_init);
}

uint64_t type metadata accessor for AnisetteServiceFactory.AnisetteRequest()
{
  return self;
}

uint64_t sub_25E7BBAF0()
{
  swift_unknownObjectWeakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_25E7BBB2C(unsigned int a1, uint64_t a2, uint64_t a3)
{
  sub_25E7B2A2C(a1, a2, a3, *(void (**)(void, void))(v3 + 16), *(void *)(v3 + 24), *(void *)(v3 + 32));
}

uint64_t block_copy_helper_3(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_3()
{
  return swift_release();
}

void sub_25E7BBB54(unsigned int a1, uint64_t a2, uint64_t a3)
{
  sub_25E7B3F7C(a1, a2, a3, *(void (**)(void, void))(v3 + 16), *(void *)(v3 + 24), *(void *)(v3 + 32));
}

void sub_25E7BBB64(unsigned int a1, uint64_t a2, uint64_t a3)
{
  sub_25E7B52E4(a1, a2, a3, *(void (**)(void, void))(v3 + 16), *(void *)(v3 + 24), *(void *)(v3 + 32));
}

void sub_25E7BBB74(unsigned int a1, uint64_t a2, uint64_t a3)
{
  sub_25E7B6E84(a1, (__n128)xmmword_25E7BEDA0, a2, a3, *(void (**)(void, void))(v3 + 16), *(void *)(v3 + 24), *(void *)(v3 + 32), 3, "Received response: anisetteData %s for service id: %s", 0xD00000000000003BLL, 0x800000025E7C11F0, (unint64_t)"Failed to retrieve value for anisetteData from anisetteResponse: %s", "Fetch Anisette request failed with error: %d");
}

uint64_t objectdestroy_2Tm()
{
  if (*(void *)(v0 + 16)) {
    swift_release();
  }
  swift_release();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

void sub_25E7BBC40(unsigned int a1, uint64_t a2, uint64_t a3)
{
  sub_25E7B6E84(a1, (__n128)xmmword_25E7BEDD0, a2, a3, *(void (**)(void, void))(v3 + 16), *(void *)(v3 + 24), *(void *)(v3 + 32), 4, "Received response: legacyAnisetteData %s for service id: %s", 0xD00000000000002BLL, 0x800000025E7C1230, (unint64_t)"Failed to retrieve value for legacy anisetteData from anisetteResponse: %s", "Legacy fetch Anisette request failed with error: %d");
}

uint64_t type metadata accessor for AnisetteServiceFactory()
{
  return self;
}

uint64_t type metadata accessor for AnisetteServiceFactory.AnisetteResponse()
{
  return self;
}

uint64_t sub_25E7BBD0C(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  if (a3 <= 3u) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t destroy for WFSetupServerAnisetteDataProvider.AnisetteErrors(uint64_t a1)
{
  return sub_25E7BBD34(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16));
}

uint64_t sub_25E7BBD34(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  if (a3 <= 3u) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t _s10TDGSharing33WFSetupServerAnisetteDataProviderC14AnisetteErrorsOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  unsigned __int8 v5 = *(unsigned char *)(a2 + 16);
  sub_25E7BBD0C(*(void *)a2, v4, v5);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for WFSetupServerAnisetteDataProvider.AnisetteErrors(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  unsigned __int8 v5 = *(unsigned char *)(a2 + 16);
  sub_25E7BBD0C(*(void *)a2, v4, v5);
  uint64_t v6 = *(void *)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  unsigned __int8 v8 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v5;
  sub_25E7BBD34(v6, v7, v8);
  return a1;
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for WFSetupServerAnisetteDataProvider.AnisetteErrors(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void *)a1;
  uint64_t v5 = *(void *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  unsigned __int8 v6 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v3;
  sub_25E7BBD34(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for WFSetupServerAnisetteDataProvider.AnisetteErrors(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFB && *(unsigned char *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 251);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 5) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for WFSetupServerAnisetteDataProvider.AnisetteErrors(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFA)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 251;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFB) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFB) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 16) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_25E7BBED8(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 16) <= 4u) {
    return *(unsigned __int8 *)(a1 + 16);
  }
  else {
    return (*(_DWORD *)a1 + 5);
  }
}

uint64_t sub_25E7BBEF0(uint64_t result, unsigned int a2)
{
  if (a2 >= 5)
  {
    *(void *)__n128 result = a2 - 5;
    *(void *)(result + 8) = 0;
    LOBYTE(a2) = 5;
  }
  *(unsigned char *)(result + 16) = a2;
  return result;
}

ValueMetadata *type metadata accessor for WFSetupServerAnisetteDataProvider.AnisetteErrors()
{
  return &type metadata for WFSetupServerAnisetteDataProvider.AnisetteErrors;
}

uint64_t sub_25E7BBF18()
{
  _Block_release(*(const void **)(v0 + 16));
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_25E7BBF50(uint64_t a1, char a2)
{
  if (!a1 || (unint64_t v3 = sub_25E7A753C(a1)) == 0)
  {
    sub_25E7A84C0();
    swift_allocError();
    uint64_t v10 = 0;
    *(void *)uint64_t v11 = 1;
    char v12 = 5;
LABEL_10:
    *(void *)(v11 + 8) = v10;
    *(unsigned char *)(v11 + 16) = v12;
    swift_willThrow();
    return v10;
  }
  unint64_t v4 = v3;
  if (!*(void *)(v3 + 16) || (unint64_t v5 = sub_25E7A8D0C(0xD00000000000001CLL, 0x800000025E7C0CB0), (v6 & 1) == 0))
  {
    swift_bridgeObjectRelease();
LABEL_9:
    uint64_t v13 = 8 * a2;
    uint64_t v14 = *(void *)&aProvisiosync_0[v13];
    uint64_t v10 = *(void *)&aN_0[v13];
    sub_25E7A84C0();
    swift_allocError();
    *(void *)uint64_t v11 = v14;
    char v12 = 3;
    goto LABEL_10;
  }
  uint64_t v7 = (uint64_t *)(*(void *)(v4 + 56) + 16 * v5);
  uint64_t v8 = *v7;
  unint64_t v9 = v7[1];
  sub_25E77CE0C(*v7, v9);
  swift_bridgeObjectRelease();
  uint64_t v10 = sub_25E7B7B30(v8, v9);
  sub_25E77D724(v8, v9);
  if (!v10) {
    goto LABEL_9;
  }
  return v10;
}

uint64_t sub_25E7BC098(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A706790);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_25E7BC130()
{
  return MEMORY[0x270EEDEE8]();
}

uint64_t sub_25E7BC140()
{
  return MEMORY[0x270EEDF30]();
}

uint64_t sub_25E7BC150()
{
  return MEMORY[0x270EEDF38]();
}

uint64_t sub_25E7BC160()
{
  return MEMORY[0x270EEE920]();
}

uint64_t sub_25E7BC170()
{
  return MEMORY[0x270EEE930]();
}

uint64_t sub_25E7BC180()
{
  return MEMORY[0x270EEE950]();
}

uint64_t sub_25E7BC1D0()
{
  return MEMORY[0x270EEF830]();
}

uint64_t sub_25E7BC1E0()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_25E7BC1F0()
{
  return MEMORY[0x270EF0020]();
}

uint64_t sub_25E7BC200()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_25E7BC210()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_25E7BC220()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_25E7BC230()
{
  return MEMORY[0x270EF0C58]();
}

uint64_t sub_25E7BC240()
{
  return MEMORY[0x270EF0C68]();
}

uint64_t sub_25E7BC250()
{
  return MEMORY[0x270EF0C70]();
}

uint64_t sub_25E7BC260()
{
  return MEMORY[0x270EF0C88]();
}

uint64_t sub_25E7BC270()
{
  return MEMORY[0x270EF0CB8]();
}

uint64_t sub_25E7BC280()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_25E7BC290()
{
  return MEMORY[0x270EF0D80]();
}

uint64_t sub_25E7BC2A0()
{
  return MEMORY[0x270EF0F40]();
}

uint64_t sub_25E7BC2B0()
{
  return MEMORY[0x270EF10A8]();
}

uint64_t sub_25E7BC2C0()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_25E7BC2D0()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_25E7BC2E0()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_25E7BC2F0()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_25E7BC300()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_25E7BC310()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_25E7BC320()
{
  return MEMORY[0x270FA0AC0]();
}

uint64_t sub_25E7BC330()
{
  return MEMORY[0x270FA0B00]();
}

uint64_t sub_25E7BC340()
{
  return MEMORY[0x270FA0BA8]();
}

uint64_t sub_25E7BC350()
{
  return MEMORY[0x270FA0BC8]();
}

uint64_t sub_25E7BC360()
{
  return MEMORY[0x270FA0BF0]();
}

uint64_t sub_25E7BC370()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_25E7BC380()
{
  return MEMORY[0x270EF1830]();
}

uint64_t sub_25E7BC390()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_25E7BC3A0()
{
  return MEMORY[0x270F9D060]();
}

uint64_t sub_25E7BC3B0()
{
  return MEMORY[0x270F9D320]();
}

uint64_t sub_25E7BC3C0()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_25E7BC3D0()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_25E7BC3E0()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_25E7BC3F0()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_25E7BC400()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_25E7BC410()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_25E7BC420()
{
  return MEMORY[0x270F9D7C0]();
}

uint64_t sub_25E7BC430()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_25E7BC440()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_25E7BC450()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_25E7BC460()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t sub_25E7BC470()
{
  return MEMORY[0x270F9DBF8]();
}

uint64_t sub_25E7BC480()
{
  return MEMORY[0x270EF1DE8]();
}

uint64_t sub_25E7BC490()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_25E7BC4A0()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_25E7BC4B0()
{
  return MEMORY[0x270EF1F60]();
}

uint64_t sub_25E7BC4C0()
{
  return MEMORY[0x270FA0C78]();
}

uint64_t sub_25E7BC4D0()
{
  return MEMORY[0x270FA0D70]();
}

uint64_t sub_25E7BC4E0()
{
  return MEMORY[0x270FA0DA0]();
}

uint64_t sub_25E7BC4F0()
{
  return MEMORY[0x270EF2100]();
}

uint64_t sub_25E7BC500()
{
  return MEMORY[0x270FA1180]();
}

uint64_t sub_25E7BC510()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_25E7BC520()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_25E7BC530()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_25E7BC540()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_25E7BC550()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_25E7BC560()
{
  return MEMORY[0x270F9E8C0]();
}

uint64_t sub_25E7BC570()
{
  return MEMORY[0x270F9E8C8]();
}

uint64_t sub_25E7BC580()
{
  return MEMORY[0x270F9E8E8]();
}

uint64_t sub_25E7BC590()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_25E7BC5A0()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_25E7BC5B0()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_25E7BC5C0()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_25E7BC5D0()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_25E7BC5E0()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_25E7BC5F0()
{
  return MEMORY[0x270F9EBE0]();
}

uint64_t sub_25E7BC600()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_25E7BC610()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_25E7BC620()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_25E7BC630()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_25E7BC640()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_25E7BC650()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_25E7BC660()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_25E7BC670()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_25E7BC680()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_25E7BC690()
{
  return MEMORY[0x270F9F428]();
}

uint64_t sub_25E7BC6A0()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_25E7BC6B0()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_25E7BC6C0()
{
  return MEMORY[0x270F9F7C0]();
}

uint64_t sub_25E7BC6D0()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_25E7BC6E0()
{
  return MEMORY[0x270F9FA40]();
}

uint64_t sub_25E7BC6F0()
{
  return MEMORY[0x270F9FA68]();
}

uint64_t sub_25E7BC700()
{
  return MEMORY[0x270F9FA88]();
}

uint64_t sub_25E7BC710()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_25E7BC720()
{
  return MEMORY[0x270EF2680]();
}

uint64_t sub_25E7BC730()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_25E7BC740()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_25E7BC750()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_25E7BC760()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_25E7BC770()
{
  return MEMORY[0x270EF2718]();
}

uint64_t sub_25E7BC780()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_25E7BC790()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_25E7BC7A0()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_25E7BC7B0()
{
  return MEMORY[0x270EF2758]();
}

uint64_t sub_25E7BC7C0()
{
  return MEMORY[0x270F9FD98]();
}

uint64_t AnalyticsSendEvent()
{
  return MEMORY[0x270F18A38]();
}

uint64_t MobileGestalt_copy_productType_obj()
{
  return MEMORY[0x270F960A0]();
}

uint64_t MobileGestalt_get_current_device()
{
  return MEMORY[0x270F960E8]();
}

uint64_t NSDictionaryGetNSNumber()
{
  return MEMORY[0x270F24488]();
}

uint64_t SFDeviceClassCodeGet()
{
  return MEMORY[0x270F636F0]();
}

uint64_t _AXSCopySettingsDataBlobForBuddy()
{
  return MEMORY[0x270F906F8]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_release(const void *aBlock)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x270FA0158]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
}

void bzero(void *a1, size_t a2)
{
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x270EDA378](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x270FA0180]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x270FA0190]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x270FA01C0]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x270FA01E0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x270FA01F0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x270FA0200]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x270FA0240]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x270FA02C0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x270FA02D0]();
}

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x270FA02F8]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x270FA0300]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x270FA0348]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x270FA03E8]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x270FA0400]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x270FA0448]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x270FA0478]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
}

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x270FA04D8]();
}

uint64_t swift_once()
{
  return MEMORY[0x270FA04F0]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x270FA0538]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x270FA0558]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x270FA0560]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x270FA05E8]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x270FA05F0]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x270FA05F8]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}