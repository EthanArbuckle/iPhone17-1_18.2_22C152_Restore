void sub_2615114D4(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

Class __getAFPreferencesClass_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!AssistantServicesLibraryCore_frameworkLibrary)
  {
    v3[1] = (void *)MEMORY[0x263EF8330];
    v3[2] = (void *)3221225472;
    v3[3] = __AssistantServicesLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    v3[5] = v3;
    long long v4 = xmmword_2655826A8;
    uint64_t v5 = 0;
    AssistantServicesLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!AssistantServicesLibraryCore_frameworkLibrary)
    {
      abort_report_np();
LABEL_8:
      __getAFPreferencesClass_block_invoke_cold_1();
    }
    if (v3[0]) {
      free(v3[0]);
    }
  }
  Class result = objc_getClass("AFPreferences");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    goto LABEL_8;
  }
  getAFPreferencesClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __AssistantServicesLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  AssistantServicesLibraryCore_frameworkLibrary = result;
  return result;
}

void sub_261511BBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getNSLocaleClass_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!IntlPreferencesLibraryCore_frameworkLibrary)
  {
    v3[1] = (void *)MEMORY[0x263EF8330];
    v3[2] = (void *)3221225472;
    v3[3] = __IntlPreferencesLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    v3[5] = v3;
    long long v4 = xmmword_2655826E0;
    uint64_t v5 = 0;
    IntlPreferencesLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!IntlPreferencesLibraryCore_frameworkLibrary)
    {
      abort_report_np();
LABEL_8:
      __getNSLocaleClass_block_invoke_cold_1();
    }
    if (v3[0]) {
      free(v3[0]);
    }
  }
  Class result = objc_getClass("NSLocale");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    goto LABEL_8;
  }
  getNSLocaleClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __IntlPreferencesLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  IntlPreferencesLibraryCore_frameworkLibrary = result;
  return result;
}

uint64_t sub_261511D8C(uint64_t a1, uint64_t a2)
{
  v3 = v2;
  uint64_t v6 = (__CFString *)sub_26151A008();
  CFTypeRef v7 = SecTaskCopyValueForEntitlement(v3, v6, 0);

  if (v7 && (__swift_instantiateConcreteTypeFromMangledName(&qword_26A920390), (swift_dynamicCast() & 1) != 0))
  {
    char v8 = sub_2615121E8(a1, a2, v10);
    swift_bridgeObjectRelease();
  }
  else
  {
    char v8 = 0;
  }
  return v8 & 1;
}

Swift::Bool __swiftcall NSProcessInfo.hasEntitlement(_:)(Swift::String a1)
{
  SecTaskRef v1 = SecTaskCreateFromSelf((CFAllocatorRef)*MEMORY[0x263EFFB08]);
  if (!v1) {
    return 0;
  }
  v2 = v1;
  v3 = (__CFString *)sub_26151A008();
  CFTypeRef v4 = SecTaskCopyValueForEntitlement(v2, v3, 0);

  if (!v4)
  {

    return 0;
  }
  self;
  uint64_t v5 = (void *)swift_dynamicCastObjCClass();
  if (!v5)
  {

    swift_unknownObjectRelease();
    return 0;
  }
  unsigned __int8 v6 = objc_msgSend(v5, sel_BOOLValue);

  swift_unknownObjectRelease();
  return v6;
}

uint64_t sub_261511F20@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_26151A018();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t _sSo13NSProcessInfoC12VoiceControlE23canReadPreferenceDomainySbSSF_0(uint64_t a1, uint64_t a2)
{
  SecTaskRef v4 = SecTaskCreateFromSelf((CFAllocatorRef)*MEMORY[0x263EFFB08]);
  if (v4)
  {
    uint64_t v5 = v4;
    unsigned __int8 v6 = (__CFString *)sub_26151A008();
    CFTypeRef v7 = SecTaskCopyValueForEntitlement(v5, v6, 0);

    if (v7)
    {
      self;
      char v8 = (void *)swift_dynamicCastObjCClass();
      if (!v8)
      {

        swift_unknownObjectRelease();
        char v10 = 1;
        return v10 & 1;
      }
      unsigned __int8 v9 = objc_msgSend(v8, sel_BOOLValue);
      swift_unknownObjectRelease();
      if ((v9 & 1) != 0 && (sub_261511D8C(a1, a2) & 1) == 0)
      {
        char v10 = sub_261511D8C(a1, a2);

        return v10 & 1;
      }
    }

    char v10 = 1;
  }
  else
  {
    char v10 = 0;
  }
  return v10 & 1;
}

uint64_t _sSo13NSProcessInfoC12VoiceControlE24canWritePreferenceDomainySbSSF_0(uint64_t a1, uint64_t a2)
{
  SecTaskRef v4 = SecTaskCreateFromSelf((CFAllocatorRef)*MEMORY[0x263EFFB08]);
  if (!v4)
  {
    char v10 = 0;
    return v10 & 1;
  }
  uint64_t v5 = v4;
  unsigned __int8 v6 = (__CFString *)sub_26151A008();
  CFTypeRef v7 = SecTaskCopyValueForEntitlement(v5, v6, 0);

  if (!v7) {
    goto LABEL_7;
  }
  self;
  char v8 = (void *)swift_dynamicCastObjCClass();
  if (!v8)
  {

    swift_unknownObjectRelease();
    goto LABEL_9;
  }
  unsigned __int8 v9 = objc_msgSend(v8, sel_BOOLValue);
  swift_unknownObjectRelease();
  if ((v9 & 1) == 0)
  {
LABEL_7:

LABEL_9:
    char v10 = 1;
    return v10 & 1;
  }
  char v10 = sub_261511D8C(a1, a2);

  return v10 & 1;
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

uint64_t sub_2615121E8(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = a3[2];
  if (!v3) {
    return 0;
  }
  if (a3[4] == a1 && a3[5] == a2) {
    return 1;
  }
  uint64_t result = sub_26151A118();
  if (result) {
    return 1;
  }
  if (v3 == 1) {
    return 0;
  }
  unsigned __int8 v9 = a3 + 7;
  for (uint64_t i = 1; ; ++i)
  {
    uint64_t v11 = i + 1;
    if (__OFADD__(i, 1)) {
      break;
    }
    BOOL v12 = *(v9 - 1) == a1 && *v9 == a2;
    if (v12 || (sub_26151A118() & 1) != 0) {
      return 1;
    }
    uint64_t result = 0;
    v9 += 2;
    if (v11 == v3) {
      return result;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_2615122F0()
{
  uint64_t result = sub_26151A008();
  qword_26A920398 = result;
  return result;
}

id static VCNotification.AlwaysShowOverlayTypeSettingsChanged.getter()
{
  return sub_26151353C(&qword_26A920358, (void **)&qword_26A920398);
}

uint64_t sub_26151234C()
{
  uint64_t result = sub_26151A008();
  qword_26A9203A0 = result;
  return result;
}

id static VCNotification.LocaleIdentifierChanged.getter()
{
  return sub_26151353C(&qword_26A920360, (void **)&qword_26A9203A0);
}

uint64_t sub_2615123A8()
{
  uint64_t result = sub_26151A008();
  qword_26A9203A8 = result;
  return result;
}

id static VCNotification.PlaySoundUponRecognitionSettingsChanged.getter()
{
  return sub_26151353C(&qword_26A920368, (void **)&qword_26A9203A8);
}

uint64_t sub_261512404()
{
  uint64_t result = sub_26151A008();
  qword_26A9203B0 = result;
  return result;
}

id static VCNotification.UserHintsSettingsChanged.getter()
{
  return sub_26151353C(&qword_26A920370, (void **)&qword_26A9203B0);
}

void sub_261512460()
{
  if (*MEMORY[0x263F8B178]) {
    qword_26A9203B8 = *MEMORY[0x263F8B178];
  }
  else {
    __break(1u);
  }
}

id static VCNotification.VoiceControlEnabledChanged.getter()
{
  return sub_26151353C(&qword_26A920378, (void **)&qword_26A9203B8);
}

uint64_t sub_2615124A4()
{
  uint64_t result = sub_26151A008();
  qword_26A9203C0 = result;
  return result;
}

id static VCNotification.ShowTextResponseUponRecognitionSettingsChanged.getter()
{
  return sub_26151353C(&qword_26A920380, (void **)&qword_26A9203C0);
}

id VCNotification.__deallocating_deinit(uint64_t a1)
{
  return sub_261515C30(a1, type metadata accessor for VCNotification);
}

uint64_t type metadata accessor for VCNotification()
{
  return self;
}

uint64_t sub_261512540(char a1)
{
  uint64_t v1 = 0;
  switch(a1)
  {
    case 1:
      if (qword_26A920360 != -1) {
        swift_once();
      }
      v2 = &qword_26A9203A0;
      goto LABEL_20;
    case 2:
      if (qword_26A920368 != -1) {
        swift_once();
      }
      v2 = &qword_26A9203A8;
      goto LABEL_20;
    case 3:
      if (qword_26A920378 != -1) {
        swift_once();
      }
      v2 = &qword_26A9203B8;
      goto LABEL_20;
    case 4:
      return v1;
    case 5:
      if (qword_26A920380 != -1) {
        swift_once();
      }
      v2 = &qword_26A9203C0;
      goto LABEL_20;
    case 6:
      if (qword_26A920370 != -1) {
        swift_once();
      }
      v2 = &qword_26A9203B0;
      goto LABEL_20;
    default:
      if (qword_26A920358 != -1) {
        swift_once();
      }
      v2 = &qword_26A920398;
LABEL_20:
      uint64_t v1 = *v2;
      id v3 = (id)*v2;
      return v1;
  }
}

uint64_t sub_261512710(unsigned __int8 a1, char a2)
{
  unint64_t v2 = 1701736270;
  unint64_t v3 = 0xE400000000000000;
  uint64_t v4 = a1;
  unint64_t v5 = 1701736270;
  switch(v4)
  {
    case 1:
      unint64_t v5 = 0xD000000000000010;
      unsigned __int8 v6 = "NumberedElements";
      goto LABEL_10;
    case 2:
      unint64_t v5 = 0x656C4564656D614ELL;
      unsigned int v7 = 1953391981;
      goto LABEL_7;
    case 3:
      unint64_t v5 = 0x64657265626D754ELL;
      unint64_t v3 = 0xEC00000064697247;
      break;
    case 4:
      unint64_t v5 = 0x64657265626D754ELL;
      unsigned int v7 = 1685221207;
      goto LABEL_7;
    case 5:
      unint64_t v5 = 0x64657265626D754ELL;
      unsigned int v7 = 1701734732;
LABEL_7:
      unint64_t v3 = v7 | 0xED00007300000000;
      break;
    case 6:
      char v8 = "NumberedCharacters";
      goto LABEL_12;
    case 7:
      unint64_t v5 = 0xD000000000000011;
      unsigned __int8 v6 = "NumberedSentences";
LABEL_10:
      unint64_t v3 = (unint64_t)(v6 - 32) | 0x8000000000000000;
      break;
    case 8:
      char v8 = "NumberedParagraphs";
LABEL_12:
      unint64_t v3 = (unint64_t)(v8 - 32) | 0x8000000000000000;
      unint64_t v5 = 0xD000000000000012;
      break;
    default:
      break;
  }
  unint64_t v9 = 0xE400000000000000;
  switch(a2)
  {
    case 1:
      unint64_t v2 = 0xD000000000000010;
      char v10 = "NumberedElements";
      goto LABEL_24;
    case 2:
      uint64_t v11 = 0x656C4564656D614ELL;
      unsigned int v12 = 1953391981;
      goto LABEL_20;
    case 3:
      unint64_t v9 = 0xEC00000064697247;
      if (v5 != 0x64657265626D754ELL) {
        goto LABEL_30;
      }
      goto LABEL_26;
    case 4:
      uint64_t v11 = 0x64657265626D754ELL;
      unsigned int v12 = 1685221207;
      goto LABEL_20;
    case 5:
      uint64_t v11 = 0x64657265626D754ELL;
      unsigned int v12 = 1701734732;
LABEL_20:
      unint64_t v9 = v12 | 0xED00007300000000;
      if (v5 != v11) {
        goto LABEL_30;
      }
      goto LABEL_26;
    case 6:
      v13 = "NumberedCharacters";
      goto LABEL_29;
    case 7:
      unint64_t v2 = 0xD000000000000011;
      char v10 = "NumberedSentences";
LABEL_24:
      unint64_t v9 = (unint64_t)(v10 - 32) | 0x8000000000000000;
      goto LABEL_25;
    case 8:
      v13 = "NumberedParagraphs";
LABEL_29:
      unint64_t v9 = (unint64_t)(v13 - 32) | 0x8000000000000000;
      if (v5 != 0xD000000000000012) {
        goto LABEL_30;
      }
      goto LABEL_26;
    default:
LABEL_25:
      if (v5 != v2) {
        goto LABEL_30;
      }
LABEL_26:
      if (v3 == v9) {
        char v14 = 1;
      }
      else {
LABEL_30:
      }
        char v14 = sub_26151A118();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v14 & 1;
  }
}

uint64_t sub_2615129E4()
{
  sub_26151A028();

  return swift_bridgeObjectRelease();
}

VoiceControl::RXDebugAutomationMode_optional __swiftcall RXDebugAutomationMode.init(rawValue:)(Swift::Int rawValue)
{
  char v2 = 4;
  if ((unint64_t)rawValue < 4) {
    char v2 = rawValue;
  }
  *uint64_t v1 = v2;
  return (VoiceControl::RXDebugAutomationMode_optional)rawValue;
}

void *static RXDebugAutomationMode.allCases.getter()
{
  return &unk_270D658C8;
}

uint64_t RXDebugAutomationMode.rawValue.getter()
{
  return *v0;
}

BOOL sub_261512B5C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_261512B70()
{
  return sub_26151A158();
}

uint64_t sub_261512BB8()
{
  return sub_26151A148();
}

uint64_t sub_261512BE4()
{
  return sub_26151A158();
}

VoiceControl::RXDebugAutomationMode_optional sub_261512C28(Swift::Int *a1)
{
  return RXDebugAutomationMode.init(rawValue:)(*a1);
}

void sub_261512C30(void *a1@<X8>)
{
  *a1 = *v1;
}

void sub_261512C3C(void *a1@<X8>)
{
  *a1 = &unk_270D658F0;
}

VoiceControl::VCOverlayType_optional __swiftcall VCOverlayType.init(rawValue:)(Swift::String rawValue)
{
  char v2 = v1;
  unint64_t v3 = sub_26151A0E8();
  result.value = swift_bridgeObjectRelease();
  char v5 = 9;
  if (v3 < 9) {
    char v5 = v3;
  }
  char *v2 = v5;
  return result;
}

void *static VCOverlayType.allCases.getter()
{
  return &unk_270D65A10;
}

unint64_t VCOverlayType.rawValue.getter()
{
  unint64_t result = 1701736270;
  switch(*v0)
  {
    case 1:
      unint64_t result = 0xD000000000000010;
      break;
    case 2:
      unint64_t result = 0x656C4564656D614ELL;
      break;
    case 3:
    case 4:
    case 5:
      unint64_t result = 0x64657265626D754ELL;
      break;
    case 6:
    case 8:
      unint64_t result = 0xD000000000000012;
      break;
    case 7:
      unint64_t result = 0xD000000000000011;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_261512DCC(unsigned __int8 *a1, char *a2)
{
  return sub_261512710(*a1, *a2);
}

uint64_t sub_261512DD8()
{
  return sub_26151A158();
}

uint64_t sub_261512E20()
{
  return sub_2615129E4();
}

uint64_t sub_261512E28()
{
  return sub_26151A158();
}

VoiceControl::VCOverlayType_optional sub_261512E6C(Swift::String *a1)
{
  return VCOverlayType.init(rawValue:)(*a1);
}

unint64_t sub_261512E78@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = VCOverlayType.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

void sub_261512EA0(void *a1@<X8>)
{
  *a1 = &unk_270D65A10;
}

id sub_261512EB0(id result, uint64_t a2)
{
  if (a2)
  {
    uint64_t v4 = (uint64_t)result;
    char v5 = (uint64_t *)&v2[OBJC_IVAR____TtC12VoiceControlP33_B83C1536E71AFC7DD8A14C611F75D0B914VCUserDefaults_prefDomain];
    *char v5 = (uint64_t)result;
    v5[1] = a2;
    unsigned __int8 v6 = self;
    unsigned int v7 = v2;
    swift_bridgeObjectRetain();
    id v8 = objc_msgSend(v6, sel_processInfo);
    swift_bridgeObjectRetain();
    char PreferenceDomainySbSSF_0 = _sSo13NSProcessInfoC12VoiceControlE23canReadPreferenceDomainySbSSF_0(v4, a2);

    swift_bridgeObjectRelease();
    v7[OBJC_IVAR____TtC12VoiceControlP33_B83C1536E71AFC7DD8A14C611F75D0B914VCUserDefaults_canReadDomain] = PreferenceDomainySbSSF_0 & 1;
    id v10 = objc_msgSend(v6, sel_processInfo);
    uint64_t v11 = *v5;
    uint64_t v12 = v5[1];
    swift_bridgeObjectRetain();
    LOBYTE(v11) = _sSo13NSProcessInfoC12VoiceControlE24canWritePreferenceDomainySbSSF_0(v11, v12);

    swift_bridgeObjectRelease();
    v7[OBJC_IVAR____TtC12VoiceControlP33_B83C1536E71AFC7DD8A14C611F75D0B914VCUserDefaults_canWriteDomain] = v11 & 1;

    v13 = (void *)sub_26151A008();
    swift_bridgeObjectRelease();
    v15.receiver = v7;
    v15.super_class = (Class)type metadata accessor for VCUserDefaults();
    id v14 = objc_msgSendSuper2(&v15, sel_initWithSuiteName_, v13);

    if (v14) {
    return v14;
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_261513220(uint64_t a1)
{
  sub_261518F38(a1, (uint64_t)v16);
  uint64_t v2 = v17;
  if (v17)
  {
    unint64_t v3 = __swift_project_boxed_opaque_existential_0(v16, v17);
    uint64_t v4 = *(void *)(v2 - 8);
    MEMORY[0x270FA5388](v3, v3);
    unsigned __int8 v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v4 + 16))(v6);
    uint64_t v7 = sub_26151A108();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v2);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v16);
  }
  else
  {
    uint64_t v7 = 0;
  }
  id v8 = (void *)sub_26151A008();
  unint64_t v9 = (objc_class *)type metadata accessor for VCUserDefaults();
  v15.receiver = v1;
  v15.super_class = v9;
  objc_msgSendSuper2(&v15, sel_setObject_forKey_, v7, v8);
  swift_unknownObjectRelease();

  swift_bridgeObjectRetain();
  char v10 = sub_261518144();
  if (v10 != 7)
  {
    uint64_t v11 = sub_261512540(v10);
    if (v11)
    {
      uint64_t v12 = (void *)v11;
      v13 = CFNotificationCenterGetDarwinNotifyCenter();
      sub_26151A018();
      id v14 = (__CFString *)sub_26151A008();
      swift_bridgeObjectRelease();
      CFNotificationCenterPostNotification(v13, v14, 0, 0, 1u);
    }
  }
}

id sub_2615134B8()
{
  return sub_261515C30(0, type metadata accessor for VCUserDefaults);
}

id sub_2615134E8()
{
  id result = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for VCSettings()), sel_init);
  qword_26A9203C8 = (uint64_t)result;
  return result;
}

id static VCSettings.shared.getter()
{
  return sub_26151353C(&qword_26A920388, (void **)&qword_26A9203C8);
}

id sub_26151353C(void *a1, void **a2)
{
  if (*a1 != -1) {
    swift_once();
  }
  unint64_t v3 = *a2;

  return v3;
}

void sub_261513604(char a1)
{
  uint64_t v2 = v1;
  sub_26151A038();
  uint64_t v4 = (objc_class *)type metadata accessor for VCUserDefaults();
  id v5 = objc_allocWithZone(v4);
  unsigned __int8 v6 = (void *)sub_26151A008();
  swift_bridgeObjectRelease();
  id v7 = objc_msgSend(v5, sel_initWithSuiteName_, v6);

  uint64_t v8 = OBJC_IVAR____TtC12VoiceControl10VCSettings_defaultsMain;
  unint64_t v9 = *(void **)(v2 + OBJC_IVAR____TtC12VoiceControl10VCSettings_defaultsMain);
  *(void *)(v2 + OBJC_IVAR____TtC12VoiceControl10VCSettings_defaultsMain) = v7;

  sub_26151A038();
  swift_bridgeObjectRelease();
  id v10 = objc_allocWithZone(v4);
  uint64_t v11 = (void *)sub_26151A008();
  swift_bridgeObjectRelease();
  id v12 = objc_msgSend(v10, sel_initWithSuiteName_, v11);

  uint64_t v13 = OBJC_IVAR____TtC12VoiceControl10VCSettings_defaultsDaemon;
  id v14 = *(void **)(v2 + OBJC_IVAR____TtC12VoiceControl10VCSettings_defaultsDaemon);
  *(void *)(v2 + OBJC_IVAR____TtC12VoiceControl10VCSettings_defaultsDaemon) = v12;

  if (a1)
  {
    objc_super v15 = *(void **)(v2 + v8);
    if (v15)
    {
      id v16 = v15;
      swift_bridgeObjectRetain();
      uint64_t v17 = (void *)sub_26151A008();
      swift_bridgeObjectRelease();
      objc_msgSend(v16, sel_removePersistentDomainForName_, v17);
    }
    v18 = *(void **)(v2 + v13);
    if (v18)
    {
      id v19 = v18;
      swift_bridgeObjectRetain();
      id v20 = (id)sub_26151A008();
      swift_bridgeObjectRelease();
      objc_msgSend(v19, sel_removePersistentDomainForName_, v20);
    }
  }
}

uint64_t sub_261513864()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC12VoiceControl10VCSettings_testMode);
  swift_beginAccess();
  return *v1;
}

void sub_2615138AC(char a1)
{
  unint64_t v3 = (char *)(v1 + OBJC_IVAR____TtC12VoiceControl10VCSettings_testMode);
  swift_beginAccess();
  char *v3 = a1;
  sub_261513604(a1);
}

void (*sub_261513908(void *a1))(void **a1, char a2)
{
  unint64_t v3 = malloc(0x28uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR____TtC12VoiceControl10VCSettings_testMode;
  v3[3] = v1;
  v3[4] = v4;
  swift_beginAccess();
  return sub_261513974;
}

void sub_261513974(void **a1, char a2)
{
  unint64_t v3 = *a1;
  swift_endAccess();
  if ((a2 & 1) == 0) {
    sub_261513604(*(unsigned char *)(v3[3] + v3[4]));
  }

  free(v3);
}

BOOL sub_2615139C4()
{
  return _AXSCommandAndControlEnabled() != 0;
}

uint64_t sub_2615139E4(char a1)
{
  return MEMORY[0x270F906C8](a1 & 1);
}

uint64_t (*sub_2615139EC(BOOL *a1))(unsigned __int8 *a1)
{
  *a1 = _AXSCommandAndControlEnabled() != 0;
  return sub_261513A38;
}

uint64_t sub_261513A38(unsigned __int8 *a1)
{
  return MEMORY[0x270F906C8](*a1);
}

uint64_t String.voiceControlLocaleIdentifier.getter()
{
  uint64_t v0 = sub_261519F78();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0, v2);
  uint64_t v4 = (char *)v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v4, *MEMORY[0x263F07570], v0);
  uint64_t v5 = sub_261519F58();
  uint64_t v7 = v6;
  (*(void (**)(char *, uint64_t))(v1 + 8))(v4, v0);
  v10[4] = v5;
  v10[5] = v7;
  v10[2] = 45;
  v10[3] = 0xE100000000000000;
  v10[0] = 95;
  v10[1] = 0xE100000000000000;
  sub_261513BBC();
  uint64_t v8 = sub_26151A088();
  swift_bridgeObjectRelease();
  return v8;
}

unint64_t sub_261513BBC()
{
  unint64_t result = qword_26A9203D8;
  if (!qword_26A9203D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A9203D8);
  }
  return result;
}

unint64_t sub_261513C14(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A920458);
  uint64_t v2 = (void *)sub_26151A0D8();
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
    unint64_t result = sub_261516B94(v5, v6);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v2[6] + 16 * result);
    *uint64_t v11 = v5;
    v11[1] = v6;
    id v12 = (void *)(v2[7] + 16 * result);
    *id v12 = v8;
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

uint64_t sub_261513D38(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5)
{
  uint64_t v29 = a1;
  uint64_t v30 = a2;
  uint64_t v6 = sub_261519F78();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6, v8);
  char v10 = (char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v31 = a5;
  uint64_t v11 = *a5;
  id v12 = *(void (**)(void))(v7 + 104);
  unsigned int v28 = *MEMORY[0x263F07570];
  v27 = (void (*)(char *, void, uint64_t))v12;
  v12(v10);
  swift_bridgeObjectRetain();
  uint64_t v13 = sub_261519F58();
  uint64_t v15 = v14;
  v26 = *(void (**)(char *, uint64_t))(v7 + 8);
  v26(v10, v6);
  uint64_t v36 = v13;
  uint64_t v37 = v15;
  uint64_t v34 = 45;
  unint64_t v35 = 0xE100000000000000;
  uint64_t v32 = 95;
  unint64_t v33 = 0xE100000000000000;
  sub_261513BBC();
  uint64_t v16 = sub_26151A088();
  uint64_t v18 = v17;
  swift_bridgeObjectRelease();
  LOBYTE(v16) = sub_261513FD4(v16, v18, v11);
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  if (v16)
  {
    v27(v10, v28, v6);
    uint64_t v20 = sub_261519F58();
    uint64_t v22 = v21;
    v26(v10, v6);
    uint64_t v36 = v20;
    uint64_t v37 = v22;
    uint64_t v34 = 45;
    unint64_t v35 = 0xE100000000000000;
    uint64_t v32 = 95;
    unint64_t v33 = 0xE100000000000000;
    uint64_t v23 = sub_26151A088();
    uint64_t v25 = v24;
    swift_bridgeObjectRelease();
    sub_2615169E4(&v36, v23, v25);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_261513FD4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a3 + 16))
  {
    sub_26151A138();
    sub_26151A028();
    uint64_t v6 = sub_26151A158();
    uint64_t v7 = -1 << *(unsigned char *)(a3 + 32);
    unint64_t v8 = v6 & ~v7;
    uint64_t v9 = a3 + 56;
    if ((*(void *)(a3 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8))
    {
      uint64_t v10 = *(void *)(a3 + 48);
      uint64_t v11 = (void *)(v10 + 16 * v8);
      BOOL v12 = *v11 == a1 && v11[1] == a2;
      if (v12 || (sub_26151A118() & 1) != 0) {
        return 1;
      }
      uint64_t v14 = ~v7;
      unint64_t v15 = (v8 + 1) & v14;
      if ((*(void *)(v9 + ((v15 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v15))
      {
        while (1)
        {
          uint64_t v16 = (void *)(v10 + 16 * v15);
          BOOL v17 = *v16 == a1 && v16[1] == a2;
          if (v17 || (sub_26151A118() & 1) != 0) {
            break;
          }
          uint64_t result = 0;
          unint64_t v15 = (v15 + 1) & v14;
          if (((*(void *)(v9 + ((v15 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v15) & 1) == 0) {
            return result;
          }
        }
        return 1;
      }
    }
  }
  return 0;
}

uint64_t sub_26151410C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v74 = a3;
  uint64_t v76 = sub_261519F78();
  uint64_t v5 = *(void *)(v76 - 8);
  MEMORY[0x270FA5388](v76, v6);
  unint64_t v8 = (char *)v67 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v77 = a2;
  if (a2)
  {
    uint64_t v9 = self;
    uint64_t v10 = v77;
    swift_bridgeObjectRetain();
    sub_261518E2C();
    uint64_t v11 = (void *)sub_26151A048();
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A9203E0);
    uint64_t v12 = swift_allocObject();
    *(_OWORD *)(v12 + 16) = xmmword_26151A7B0;
    *(void *)(v12 + 32) = a1;
    *(void *)(v12 + 40) = v10;
    uint64_t v13 = (void *)sub_26151A048();
    swift_bridgeObjectRelease();
    id v14 = objc_msgSend(v9, sel_preferredLocalizationsFromArray_forPreferences_, v11, v13);

    uint64_t v15 = sub_26151A058();
    if (*(void *)(v15 + 16))
    {
LABEL_5:
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      uint64_t v21 = *MEMORY[0x263F07570];
      uint64_t v22 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 104);
      uint64_t v23 = v76;
      v22(v8, v21, v76);
      uint64_t v24 = sub_261519F58();
      uint64_t v26 = v25;
      (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v23);
      uint64_t v82 = v24;
      uint64_t v83 = v26;
      uint64_t v80 = 45;
      unint64_t v81 = 0xE100000000000000;
      uint64_t v78 = 95;
      unint64_t v79 = 0xE100000000000000;
      sub_261513BBC();
      uint64_t v27 = v23;
      uint64_t v73 = sub_26151A088();
      uint64_t v75 = v28;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      unint64_t v29 = (v5 + 104) & 0xFFFFFFFFFFFFLL | 0xB2E4000000000000;
      goto LABEL_7;
    }
    swift_bridgeObjectRelease();
  }
  uint64_t v16 = self;
  sub_261518E2C();
  BOOL v17 = (void *)sub_26151A048();
  swift_bridgeObjectRelease();
  sub_261519F88();
  uint64_t v18 = (void *)sub_26151A048();
  swift_bridgeObjectRelease();
  id v19 = objc_msgSend(v16, sel_preferredLocalizationsFromArray_forPreferences_, v17, v18);

  uint64_t v20 = sub_26151A058();
  if (*(void *)(v20 + 16)) {
    goto LABEL_5;
  }
  swift_bridgeObjectRelease();
  uint64_t v73 = 0;
  uint64_t v75 = 0;
  uint64_t v21 = *MEMORY[0x263F07570];
  uint64_t v22 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 104);
  unint64_t v29 = (v5 + 104) & 0xFFFFFFFFFFFFLL | 0xB2E4000000000000;
  uint64_t v27 = v76;
LABEL_7:
  v22(v8, v21, v27);
  uint64_t v30 = sub_261519F58();
  uint64_t v32 = v31;
  v71 = *(void (**)(char *, uint64_t))(v5 + 8);
  uint64_t v72 = v5 + 8;
  v71(v8, v27);
  uint64_t v82 = v30;
  uint64_t v83 = v32;
  uint64_t v33 = v27;
  uint64_t v80 = 45;
  unint64_t v81 = 0xE100000000000000;
  uint64_t v78 = 95;
  unint64_t v79 = 0xE100000000000000;
  sub_261513BBC();
  uint64_t v34 = sub_26151A088();
  uint64_t v36 = v35;
  swift_bridgeObjectRelease();
  if (v77)
  {
    swift_bridgeObjectRelease();
    if (!v75) {
      goto LABEL_24;
    }
    goto LABEL_23;
  }
  v69 = v22;
  uint64_t v70 = v34;
  uint64_t v77 = v36;
  unsigned int v68 = v21;
  v67[1] = v29;
  v22(v8, v21, v33);
  uint64_t v37 = v75;
  swift_bridgeObjectRetain();
  uint64_t v38 = sub_261519F58();
  uint64_t v40 = v39;
  v41 = v8;
  v42 = v8;
  v43 = v71;
  v71(v42, v33);
  uint64_t v82 = v38;
  uint64_t v83 = v40;
  uint64_t v80 = 45;
  unint64_t v81 = 0xE100000000000000;
  uint64_t v78 = 95;
  unint64_t v79 = 0xE100000000000000;
  uint64_t v44 = sub_26151A088();
  uint64_t v46 = v45;
  swift_bridgeObjectRelease();
  if (v37)
  {
    v47 = v43;
    if (v73 == v44 && v37 == v46)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v48 = v76;
      v50 = v69;
      uint64_t v49 = v70;
      v51 = v41;
    }
    else
    {
      char v52 = sub_26151A118();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v48 = v76;
      v50 = v69;
      uint64_t v49 = v70;
      v51 = v41;
      if ((v52 & 1) == 0) {
        goto LABEL_22;
      }
    }
    v53 = sub_261518E2C();
    uint64_t v54 = v77;
    char v55 = sub_2615121E8(v49, v77, v53);
    swift_bridgeObjectRelease();
    if (v55)
    {
      id v56 = objc_msgSend(self, sel_sharedPreferences);
      id v57 = objc_msgSend(v56, sel_languageCode);

      if (v57)
      {
        sub_26151A018();

        v50(v51, v68, v48);
        uint64_t v58 = sub_261519F58();
        uint64_t v60 = v59;
        v47(v51, v48);
        uint64_t v82 = v58;
        uint64_t v83 = v60;
        uint64_t v80 = 45;
        unint64_t v81 = 0xE100000000000000;
        uint64_t v78 = 95;
        unint64_t v79 = 0xE100000000000000;
        uint64_t v61 = sub_26151A088();
        uint64_t v63 = v62;
        swift_bridgeObjectRelease();
        uint64_t v64 = v70;
        swift_bridgeObjectRelease();
        if (v61 == v64 && v63 == v54)
        {
          swift_bridgeObjectRelease();
LABEL_26:
          swift_bridgeObjectRelease();
          swift_bridgeObjectRetain();
          goto LABEL_24;
        }
        char v66 = sub_26151A118();
        swift_bridgeObjectRelease();
        if (v66) {
          goto LABEL_26;
        }
      }
    }
LABEL_22:
    swift_bridgeObjectRelease();
LABEL_23:
    swift_bridgeObjectRetain();
    goto LABEL_24;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
LABEL_24:
  sub_261519F38();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2615148C4()
{
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC12VoiceControl10VCSettings_defaultsMain);
  if (!v1)
  {
    long long v7 = 0u;
    long long v8 = 0u;
LABEL_11:
    sub_261519E84((uint64_t)&v7, &qword_26A9203F0);
    return 0;
  }
  id v2 = v1;
  uint64_t v3 = (void *)sub_26151A008();
  id v4 = objc_msgSend(v2, sel_objectForKey_, v3);

  if (v4)
  {
    sub_26151A098();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
  }
  sub_261519034((uint64_t)v6, (uint64_t)&v7);

  if (!*((void *)&v8 + 1)) {
    goto LABEL_11;
  }
  if (swift_dynamicCast()) {
    return *(void *)&v6[0];
  }
  else {
    return 0;
  }
}

uint64_t sub_2615149E4(uint64_t result, uint64_t a2)
{
  uint64_t v3 = *(void **)(v2 + OBJC_IVAR____TtC12VoiceControl10VCSettings_defaultsMain);
  if (v3)
  {
    if (a2)
    {
      *((void *)&v16 + 1) = MEMORY[0x263F8D310];
      *(void *)&long long v15 = result;
      *((void *)&v15 + 1) = a2;
    }
    else
    {
      long long v15 = 0u;
      long long v16 = 0u;
    }
    sub_261518F38((uint64_t)&v15, (uint64_t)v13);
    uint64_t v4 = v14;
    if (v14)
    {
      uint64_t v5 = __swift_project_boxed_opaque_existential_0(v13, v14);
      uint64_t v6 = *(void *)(v4 - 8);
      MEMORY[0x270FA5388](v5, v5);
      long long v8 = (char *)v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
      (*(void (**)(char *))(v6 + 16))(v8);
      swift_bridgeObjectRetain();
      id v9 = v3;
      uint64_t v10 = sub_26151A108();
      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v4);
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v13);
    }
    else
    {
      swift_bridgeObjectRetain();
      id v11 = v3;
      uint64_t v10 = 0;
    }
    uint64_t v12 = (void *)sub_26151A008();
    objc_msgSend(v3, sel_setObject_forKey_, v10, v12);

    swift_unknownObjectRelease();
    return sub_261519E84((uint64_t)&v15, &qword_26A9203F0);
  }
  return result;
}

uint64_t sub_261514BB0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_2615148C4();
  sub_26151410C(v2, v3, a1);

  return swift_bridgeObjectRelease();
}

uint64_t sub_261514BF4()
{
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC12VoiceControl10VCSettings_defaultsMain);
  if (!v1)
  {
    long long v7 = 0u;
    long long v8 = 0u;
LABEL_9:
    sub_261519E84((uint64_t)&v7, &qword_26A9203F0);
    return 1;
  }
  id v2 = v1;
  uint64_t v3 = (void *)sub_26151A008();
  id v4 = objc_msgSend(v2, sel_objectForKey_, v3);

  if (v4)
  {
    sub_26151A098();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
  }
  sub_261519034((uint64_t)v6, (uint64_t)&v7);

  if (!*((void *)&v8 + 1)) {
    goto LABEL_9;
  }
  if (swift_dynamicCast()) {
    return LOBYTE(v6[0]);
  }
  return 1;
}

uint64_t sub_261514D08(uint64_t result)
{
  return sub_261514EC8(result);
}

uint64_t (*sub_261514D24(uint64_t a1))(uint64_t a1)
{
  *(void *)a1 = v1;
  *(unsigned char *)(a1 + 8) = sub_261514BF4() & 1;
  return sub_261514D70;
}

uint64_t sub_261514D70(uint64_t a1)
{
  return sub_261514D08(*(unsigned __int8 *)(a1 + 8));
}

uint64_t sub_261514D98()
{
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC12VoiceControl10VCSettings_defaultsMain);
  if (!v1)
  {
    long long v7 = 0u;
    long long v8 = 0u;
LABEL_9:
    sub_261519E84((uint64_t)&v7, &qword_26A9203F0);
    return 0;
  }
  id v2 = v1;
  uint64_t v3 = (void *)sub_26151A008();
  id v4 = objc_msgSend(v2, sel_objectForKey_, v3);

  if (v4)
  {
    sub_26151A098();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
  }
  sub_261519034((uint64_t)v6, (uint64_t)&v7);

  if (!*((void *)&v8 + 1)) {
    goto LABEL_9;
  }
  uint64_t result = swift_dynamicCast();
  if (result) {
    return LOBYTE(v6[0]);
  }
  return result;
}

uint64_t sub_261514EAC(uint64_t result)
{
  return sub_261514EC8(result);
}

uint64_t sub_261514EC8(uint64_t result)
{
  id v2 = *(void **)(v1 + OBJC_IVAR____TtC12VoiceControl10VCSettings_defaultsMain);
  if (v2)
  {
    uint64_t v15 = MEMORY[0x263F8D4F8];
    v14[0] = result & 1;
    sub_261518F38((uint64_t)v14, (uint64_t)v12);
    uint64_t v3 = v13;
    if (v13)
    {
      id v4 = __swift_project_boxed_opaque_existential_0(v12, v13);
      uint64_t v5 = *(void *)(v3 - 8);
      MEMORY[0x270FA5388](v4, v4);
      long long v7 = (char *)v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
      (*(void (**)(char *))(v5 + 16))(v7);
      id v8 = v2;
      uint64_t v9 = sub_26151A108();
      (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v3);
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
    }
    else
    {
      id v10 = v2;
      uint64_t v9 = 0;
    }
    id v11 = (void *)sub_26151A008();
    objc_msgSend(v2, sel_setObject_forKey_, v9, v11);

    swift_unknownObjectRelease();
    return sub_261519E84((uint64_t)v14, &qword_26A9203F0);
  }
  return result;
}

uint64_t (*sub_26151506C(uint64_t a1))(uint64_t a1)
{
  *(void *)a1 = v1;
  *(unsigned char *)(a1 + 8) = sub_261514D98() & 1;
  return sub_2615150B8;
}

uint64_t sub_2615150B8(uint64_t a1)
{
  return sub_261514EAC(*(unsigned __int8 *)(a1 + 8));
}

uint64_t sub_2615150E0()
{
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC12VoiceControl10VCSettings_defaultsMain);
  if (!v1)
  {
    long long v7 = 0u;
    long long v8 = 0u;
LABEL_11:
    sub_261519E84((uint64_t)&v7, &qword_26A9203F0);
    return 3;
  }
  id v2 = v1;
  uint64_t v3 = (void *)sub_26151A008();
  id v4 = objc_msgSend(v2, sel_objectForKey_, v3);

  if (v4)
  {
    sub_26151A098();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
  }
  sub_261519034((uint64_t)v6, (uint64_t)&v7);

  if (!*((void *)&v8 + 1)) {
    goto LABEL_11;
  }
  if ((swift_dynamicCast() & 1) == 0) {
    return 3;
  }
  if (*(void *)&v6[0] >= 4uLL) {
    return 3;
  }
  else {
    return LODWORD(v6[0]);
  }
}

BOOL sub_261515200()
{
  return sub_2615150E0() == 3;
}

uint64_t sub_261515224(uint64_t result)
{
  id v2 = *(void **)(v1 + OBJC_IVAR____TtC12VoiceControl10VCSettings_defaultsMain);
  if (v2)
  {
    uint64_t v3 = 3;
    if ((result & 1) == 0) {
      uint64_t v3 = 0;
    }
    v15[3] = MEMORY[0x263F8D6C8];
    v15[0] = v3;
    sub_261518F38((uint64_t)v15, (uint64_t)v13);
    uint64_t v4 = v14;
    if (v14)
    {
      uint64_t v5 = __swift_project_boxed_opaque_existential_0(v13, v14);
      uint64_t v6 = *(void *)(v4 - 8);
      MEMORY[0x270FA5388](v5, v5);
      long long v8 = (char *)v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
      (*(void (**)(char *))(v6 + 16))(v8);
      id v9 = v2;
      uint64_t v10 = sub_26151A108();
      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v4);
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v13);
    }
    else
    {
      id v11 = v2;
      uint64_t v10 = 0;
    }
    uint64_t v12 = (void *)sub_26151A008();
    objc_msgSend(v2, sel_setObject_forKey_, v10, v12);

    swift_unknownObjectRelease();
    return sub_261519E84((uint64_t)v15, &qword_26A9203F0);
  }
  return result;
}

uint64_t (*sub_2615153D0(uint64_t a1))(uint64_t a1)
{
  *(void *)a1 = v1;
  *(unsigned char *)(a1 + 8) = sub_2615150E0() == 3;
  return sub_261515424;
}

uint64_t sub_261515424(uint64_t a1)
{
  return sub_261515224(*(unsigned __int8 *)(a1 + 8));
}

uint64_t sub_26151544C@<X0>(unsigned char *a1@<X8>)
{
  uint64_t v3 = *(void **)(v1 + OBJC_IVAR____TtC12VoiceControl10VCSettings_defaultsDaemon);
  if (!v3)
  {
    long long v10 = 0u;
    long long v11 = 0u;
LABEL_11:
    uint64_t result = sub_261519E84((uint64_t)&v10, &qword_26A9203F0);
    goto LABEL_12;
  }
  id v4 = v3;
  uint64_t v5 = (void *)sub_26151A008();
  id v6 = objc_msgSend(v4, sel_objectForKey_, v5);

  if (v6)
  {
    sub_26151A098();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v9, 0, sizeof(v9));
  }
  sub_261519034((uint64_t)v9, (uint64_t)&v10);

  if (!*((void *)&v11 + 1)) {
    goto LABEL_11;
  }
  uint64_t result = swift_dynamicCast();
  if ((result & 1) == 0)
  {
LABEL_12:
    char v8 = 0;
    goto LABEL_13;
  }
  if (*(void *)&v9[0] >= 4uLL) {
    char v8 = 0;
  }
  else {
    char v8 = v9[0];
  }
LABEL_13:
  *a1 = v8;
  return result;
}

unsigned __int8 *sub_261515570(unsigned __int8 *result)
{
  id v2 = *(void **)(v1 + OBJC_IVAR____TtC12VoiceControl10VCSettings_defaultsDaemon);
  if (v2)
  {
    uint64_t v3 = *result;
    v15[3] = MEMORY[0x263F8D6C8];
    v15[0] = v3;
    sub_261518F38((uint64_t)v15, (uint64_t)v13);
    uint64_t v4 = v14;
    if (v14)
    {
      uint64_t v5 = __swift_project_boxed_opaque_existential_0(v13, v14);
      uint64_t v6 = *(void *)(v4 - 8);
      MEMORY[0x270FA5388](v5, v5);
      char v8 = (char *)v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
      (*(void (**)(char *))(v6 + 16))(v8);
      id v9 = v2;
      uint64_t v10 = sub_26151A108();
      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v4);
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v13);
    }
    else
    {
      id v11 = v2;
      uint64_t v10 = 0;
    }
    uint64_t v12 = (void *)sub_26151A008();
    objc_msgSend(v2, sel_setObject_forKey_, v10, v12);

    swift_unknownObjectRelease();
    return (unsigned __int8 *)sub_261519E84((uint64_t)v15, &qword_26A9203F0);
  }
  return result;
}

uint64_t (*sub_261515714(uint64_t a1))(uint64_t a1, char a2)
{
  *(void *)a1 = v1;
  sub_26151544C((unsigned char *)(a1 + 8));
  return sub_261515768;
}

uint64_t sub_261515768(uint64_t a1, char a2)
{
  return sub_261515BCC(a1, a2, (uint64_t (*)(char *))sub_261515570);
}

char sub_261515780@<W0>(unsigned char *a1@<X8>)
{
  uint64_t v3 = *(void **)(v1 + OBJC_IVAR____TtC12VoiceControl10VCSettings_defaultsMain);
  if (!v3)
  {
    long long v10 = 0u;
    long long v11 = 0u;
LABEL_11:
    char result = sub_261519E84((uint64_t)&v10, &qword_26A9203F0);
    goto LABEL_12;
  }
  id v4 = v3;
  uint64_t v5 = (void *)sub_26151A008();
  id v6 = objc_msgSend(v4, sel_objectForKey_, v5);

  if (v6)
  {
    sub_26151A098();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v9, 0, sizeof(v9));
  }
  sub_261519034((uint64_t)v9, (uint64_t)&v10);

  if (!*((void *)&v11 + 1)) {
    goto LABEL_11;
  }
  char result = swift_dynamicCast();
  if ((result & 1) == 0)
  {
LABEL_12:
    char v8 = 0;
    goto LABEL_13;
  }
  char result = VCOverlayType.init(rawValue:)(v9[0]).value;
  char v8 = v10;
  if (v10 == 9) {
    char v8 = 0;
  }
LABEL_13:
  *a1 = v8;
  return result;
}

unsigned char *sub_2615158B0(unsigned char *result)
{
  id v2 = *(void **)(v1 + OBJC_IVAR____TtC12VoiceControl10VCSettings_defaultsMain);
  if (v2)
  {
    unint64_t v3 = 0xE400000000000000;
    unint64_t v4 = 1701736270;
    switch(*result)
    {
      case 1:
        unint64_t v4 = 0xD000000000000010;
        uint64_t v5 = "NumberedElements";
        goto LABEL_12;
      case 2:
        unint64_t v3 = 0xED000073746E656DLL;
        unint64_t v4 = 0x656C4564656D614ELL;
        break;
      case 3:
        unint64_t v3 = 0xEC00000064697247;
        goto LABEL_9;
      case 4:
        unsigned int v6 = 1685221207;
        goto LABEL_8;
      case 5:
        unsigned int v6 = 1701734732;
LABEL_8:
        unint64_t v3 = v6 | 0xED00007300000000;
LABEL_9:
        unint64_t v4 = 0x64657265626D754ELL;
        break;
      case 6:
        uint64_t v7 = "NumberedCharacters";
        goto LABEL_14;
      case 7:
        unint64_t v4 = 0xD000000000000011;
        uint64_t v5 = "NumberedSentences";
LABEL_12:
        unint64_t v3 = (unint64_t)(v5 - 32) | 0x8000000000000000;
        break;
      case 8:
        uint64_t v7 = "NumberedParagraphs";
LABEL_14:
        unint64_t v3 = (unint64_t)(v7 - 32) | 0x8000000000000000;
        unint64_t v4 = 0xD000000000000012;
        break;
      default:
        break;
    }
    v19[3] = MEMORY[0x263F8D310];
    v19[0] = v4;
    v19[1] = v3;
    sub_261518F38((uint64_t)v19, (uint64_t)v17);
    uint64_t v8 = v18;
    if (v18)
    {
      id v9 = __swift_project_boxed_opaque_existential_0(v17, v18);
      uint64_t v10 = *(void *)(v8 - 8);
      MEMORY[0x270FA5388](v9, v9);
      uint64_t v12 = (char *)v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
      (*(void (**)(char *))(v10 + 16))(v12);
      id v13 = v2;
      uint64_t v14 = sub_26151A108();
      (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v8);
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v17);
    }
    else
    {
      id v15 = v2;
      uint64_t v14 = 0;
    }
    long long v16 = (void *)sub_26151A008();
    objc_msgSend(v2, sel_setObject_forKey_, v14, v16);

    swift_unknownObjectRelease();
    return (unsigned char *)sub_261519E84((uint64_t)v19, &qword_26A9203F0);
  }
  return result;
}

uint64_t (*sub_261515B60(uint64_t a1))(uint64_t a1, char a2)
{
  *(void *)a1 = v1;
  sub_261515780((unsigned char *)(a1 + 8));
  return sub_261515BB4;
}

uint64_t sub_261515BB4(uint64_t a1, char a2)
{
  return sub_261515BCC(a1, a2, (uint64_t (*)(char *))sub_2615158B0);
}

uint64_t sub_261515BCC(uint64_t a1, char a2, uint64_t (*a3)(char *))
{
  if (a2)
  {
    char v5 = *(unsigned char *)(a1 + 8);
    unint64_t v3 = &v5;
  }
  else
  {
    char v6 = *(unsigned char *)(a1 + 8);
    unint64_t v3 = &v6;
  }
  return a3(v3);
}

id VCSettings.__deallocating_deinit(uint64_t a1)
{
  return sub_261515C30(a1, type metadata accessor for VCSettings);
}

id sub_261515C30(uint64_t a1, uint64_t (*a2)(void))
{
  v4.receiver = v2;
  v4.super_class = (Class)a2();
  return objc_msgSendSuper2(&v4, sel_dealloc);
}

uint64_t sub_261515CB4(char **a1)
{
  id v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    id v2 = sub_261517F30((uint64_t)v2);
  }
  uint64_t v3 = *((void *)v2 + 2);
  v5[0] = (uint64_t)(v2 + 32);
  v5[1] = v3;
  uint64_t result = sub_261515E08(v5);
  *a1 = v2;
  return result;
}

void *sub_261515D20(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return (void *)MEMORY[0x263F8EE78];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A9203E0);
  uint64_t v3 = (void *)swift_allocObject();
  int64_t v4 = _swift_stdlib_malloc_size(v3);
  uint64_t v5 = v4 - 32;
  if (v4 < 32) {
    uint64_t v5 = v4 - 17;
  }
  v3[2] = v1;
  v3[3] = 2 * (v5 >> 4);
  uint64_t v6 = sub_261517F44((uint64_t)&v8, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  sub_261519E6C();
  if (v6 != v1)
  {
    __break(1u);
    return (void *)MEMORY[0x263F8EE78];
  }
  return v3;
}

uint64_t sub_261515E08(uint64_t *a1)
{
  uint64_t v3 = a1[1];
  uint64_t result = sub_26151A0F8();
  if (result >= v3)
  {
    if (v3 < 0) {
      goto LABEL_152;
    }
    if (v3) {
      return sub_2615164B0(0, v3, 1, a1);
    }
    return result;
  }
  if (v3 >= 0) {
    uint64_t v5 = v3;
  }
  else {
    uint64_t v5 = v3 + 1;
  }
  if (v3 < -1) {
    goto LABEL_151;
  }
  uint64_t v101 = result;
  v98 = a1;
  if (v3 <= 1)
  {
    uint64_t v7 = MEMORY[0x263F8EE78];
    v104 = (char *)(MEMORY[0x263F8EE78] + 32);
    if (v3 != 1)
    {
      unint64_t v11 = *(void *)(MEMORY[0x263F8EE78] + 16);
      uint64_t v10 = MEMORY[0x263F8EE78];
LABEL_117:
      uint64_t result = v10;
      uint64_t v100 = v7;
      if (v11 >= 2)
      {
        uint64_t v91 = *v98;
        do
        {
          unint64_t v92 = v11 - 2;
          if (v11 < 2) {
            goto LABEL_146;
          }
          if (!v91) {
            goto LABEL_159;
          }
          uint64_t v93 = result;
          uint64_t v94 = *(void *)(result + 32 + 16 * v92);
          uint64_t v95 = *(void *)(result + 32 + 16 * (v11 - 1) + 8);
          uint64_t result = sub_261516580((char *)(v91 + 16 * v94), (char *)(v91 + 16 * *(void *)(result + 32 + 16 * (v11 - 1))), v91 + 16 * v95, v104);
          if (v1) {
            break;
          }
          if (v95 < v94) {
            goto LABEL_147;
          }
          uint64_t result = swift_isUniquelyReferenced_nonNull_native();
          if ((result & 1) == 0)
          {
            uint64_t result = (uint64_t)sub_2615168AC(v93);
            uint64_t v93 = result;
          }
          if (v92 >= *(void *)(v93 + 16)) {
            goto LABEL_148;
          }
          v96 = (void *)(v93 + 32 + 16 * v92);
          void *v96 = v94;
          v96[1] = v95;
          unint64_t v97 = *(void *)(v93 + 16);
          if (v11 > v97) {
            goto LABEL_149;
          }
          memmove((void *)(v93 + 32 + 16 * (v11 - 1)), (const void *)(v93 + 32 + 16 * v11), 16 * (v97 - v11));
          uint64_t result = v93;
          *(void *)(v93 + 16) = v97 - 1;
          unint64_t v11 = v97 - 1;
        }
        while (v97 > 2);
      }
LABEL_114:
      swift_bridgeObjectRelease();
      *(void *)(v100 + 16) = 0;
      return swift_bridgeObjectRelease();
    }
    uint64_t v100 = MEMORY[0x263F8EE78];
  }
  else
  {
    uint64_t v6 = v5 >> 1;
    uint64_t result = sub_26151A068();
    *(void *)(result + 16) = v6;
    uint64_t v100 = result;
    v104 = (char *)(result + 32);
  }
  uint64_t v8 = 0;
  uint64_t v9 = *a1;
  uint64_t v99 = v9 + 8;
  uint64_t v10 = MEMORY[0x263F8EE78];
  uint64_t v102 = v3;
  while (1)
  {
    uint64_t v12 = v8++;
    if (v8 >= v3) {
      goto LABEL_45;
    }
    id v13 = (uint64_t *)(v9 + 16 * v8);
    uint64_t result = *v13;
    uint64_t v14 = v13[1];
    id v15 = (void *)(v9 + 16 * v12);
    if (result == *v15 && v14 == v15[1])
    {
      uint64_t v18 = v12 + 2;
      if (v12 + 2 >= v3) {
        goto LABEL_44;
      }
      int v17 = 0;
    }
    else
    {
      uint64_t result = sub_26151A118();
      int v17 = result;
      uint64_t v18 = v12 + 2;
      if (v12 + 2 >= v3) {
        goto LABEL_36;
      }
    }
    id v19 = (void *)(v99 + 16 * v18);
    do
    {
      uint64_t result = *(v19 - 1);
      uint64_t v21 = (void *)(v9 + 16 * v8);
      if (result == *v21 && *v19 == v21[1])
      {
        if (v17) {
          goto LABEL_37;
        }
      }
      else
      {
        uint64_t result = sub_26151A118();
        if ((v17 ^ result)) {
          goto LABEL_36;
        }
      }
      v19 += 2;
      uint64_t v20 = v18 + 1;
      uint64_t v8 = v18;
      uint64_t v18 = v20;
    }
    while (v20 < v3);
    uint64_t v18 = v20;
LABEL_36:
    uint64_t v8 = v18;
    if (v17)
    {
LABEL_37:
      if (v18 < v12) {
        goto LABEL_155;
      }
      if (v12 < v18)
      {
        uint64_t v23 = 16 * v18;
        uint64_t v24 = 16 * v12;
        uint64_t v25 = v18;
        uint64_t v26 = v12;
        do
        {
          if (v26 != --v25)
          {
            if (!v9) {
              goto LABEL_158;
            }
            uint64_t v27 = v9 + v23;
            uint64_t v28 = *(void *)(v9 + v24);
            uint64_t v29 = *(void *)(v9 + v24 + 8);
            *(_OWORD *)(v9 + v24) = *(_OWORD *)(v9 + v23 - 16);
            *(void *)(v27 - 16) = v28;
            *(void *)(v27 - 8) = v29;
          }
          ++v26;
          v23 -= 16;
          v24 += 16;
        }
        while (v26 < v25);
      }
LABEL_44:
      uint64_t v8 = v18;
    }
LABEL_45:
    if (v8 < v3)
    {
      if (__OFSUB__(v8, v12)) {
        goto LABEL_150;
      }
      if (v8 - v12 < v101) {
        break;
      }
    }
LABEL_66:
    if (v8 < v12) {
      goto LABEL_145;
    }
    uint64_t result = swift_isUniquelyReferenced_nonNull_native();
    if ((result & 1) == 0)
    {
      uint64_t result = (uint64_t)sub_2615167B0(0, *(void *)(v10 + 16) + 1, 1, (char *)v10);
      uint64_t v10 = result;
    }
    unint64_t v38 = *(void *)(v10 + 16);
    unint64_t v37 = *(void *)(v10 + 24);
    unint64_t v11 = v38 + 1;
    if (v38 >= v37 >> 1)
    {
      uint64_t result = (uint64_t)sub_2615167B0((char *)(v37 > 1), v38 + 1, 1, (char *)v10);
      uint64_t v10 = result;
    }
    *(void *)(v10 + 16) = v11;
    uint64_t v39 = v10 + 32;
    uint64_t v40 = (uint64_t *)(v10 + 32 + 16 * v38);
    *uint64_t v40 = v12;
    v40[1] = v8;
    if (v38)
    {
      uint64_t v103 = v8;
      while (1)
      {
        unint64_t v41 = v11 - 1;
        if (v11 >= 4)
        {
          unint64_t v46 = v39 + 16 * v11;
          uint64_t v47 = *(void *)(v46 - 64);
          uint64_t v48 = *(void *)(v46 - 56);
          BOOL v52 = __OFSUB__(v48, v47);
          uint64_t v49 = v48 - v47;
          if (v52) {
            goto LABEL_134;
          }
          uint64_t v51 = *(void *)(v46 - 48);
          uint64_t v50 = *(void *)(v46 - 40);
          BOOL v52 = __OFSUB__(v50, v51);
          uint64_t v44 = v50 - v51;
          char v45 = v52;
          if (v52) {
            goto LABEL_135;
          }
          unint64_t v53 = v11 - 2;
          uint64_t v54 = (uint64_t *)(v39 + 16 * (v11 - 2));
          uint64_t v56 = *v54;
          uint64_t v55 = v54[1];
          BOOL v52 = __OFSUB__(v55, v56);
          uint64_t v57 = v55 - v56;
          if (v52) {
            goto LABEL_136;
          }
          BOOL v52 = __OFADD__(v44, v57);
          uint64_t v58 = v44 + v57;
          if (v52) {
            goto LABEL_138;
          }
          if (v58 >= v49)
          {
            uint64_t v76 = (uint64_t *)(v39 + 16 * v41);
            uint64_t v78 = *v76;
            uint64_t v77 = v76[1];
            BOOL v52 = __OFSUB__(v77, v78);
            uint64_t v79 = v77 - v78;
            if (v52) {
              goto LABEL_144;
            }
            BOOL v69 = v44 < v79;
            goto LABEL_104;
          }
        }
        else
        {
          if (v11 != 3)
          {
            uint64_t v70 = *(void *)(v10 + 32);
            uint64_t v71 = *(void *)(v10 + 40);
            BOOL v52 = __OFSUB__(v71, v70);
            uint64_t v63 = v71 - v70;
            char v64 = v52;
            goto LABEL_98;
          }
          uint64_t v43 = *(void *)(v10 + 32);
          uint64_t v42 = *(void *)(v10 + 40);
          BOOL v52 = __OFSUB__(v42, v43);
          uint64_t v44 = v42 - v43;
          char v45 = v52;
        }
        if (v45) {
          goto LABEL_137;
        }
        unint64_t v53 = v11 - 2;
        uint64_t v59 = (uint64_t *)(v39 + 16 * (v11 - 2));
        uint64_t v61 = *v59;
        uint64_t v60 = v59[1];
        BOOL v62 = __OFSUB__(v60, v61);
        uint64_t v63 = v60 - v61;
        char v64 = v62;
        if (v62) {
          goto LABEL_139;
        }
        v65 = (uint64_t *)(v39 + 16 * v41);
        uint64_t v67 = *v65;
        uint64_t v66 = v65[1];
        BOOL v52 = __OFSUB__(v66, v67);
        uint64_t v68 = v66 - v67;
        if (v52) {
          goto LABEL_141;
        }
        if (__OFADD__(v63, v68)) {
          goto LABEL_143;
        }
        if (v63 + v68 >= v44)
        {
          BOOL v69 = v44 < v68;
LABEL_104:
          if (v69) {
            unint64_t v41 = v53;
          }
          goto LABEL_106;
        }
LABEL_98:
        if (v64) {
          goto LABEL_140;
        }
        uint64_t v72 = (uint64_t *)(v39 + 16 * v41);
        uint64_t v74 = *v72;
        uint64_t v73 = v72[1];
        BOOL v52 = __OFSUB__(v73, v74);
        uint64_t v75 = v73 - v74;
        if (v52) {
          goto LABEL_142;
        }
        if (v75 < v63) {
          goto LABEL_15;
        }
LABEL_106:
        unint64_t v80 = v41 - 1;
        if (v41 - 1 >= v11)
        {
          __break(1u);
LABEL_131:
          __break(1u);
LABEL_132:
          __break(1u);
LABEL_133:
          __break(1u);
LABEL_134:
          __break(1u);
LABEL_135:
          __break(1u);
LABEL_136:
          __break(1u);
LABEL_137:
          __break(1u);
LABEL_138:
          __break(1u);
LABEL_139:
          __break(1u);
LABEL_140:
          __break(1u);
LABEL_141:
          __break(1u);
LABEL_142:
          __break(1u);
LABEL_143:
          __break(1u);
LABEL_144:
          __break(1u);
LABEL_145:
          __break(1u);
LABEL_146:
          __break(1u);
LABEL_147:
          __break(1u);
LABEL_148:
          __break(1u);
LABEL_149:
          __break(1u);
LABEL_150:
          __break(1u);
LABEL_151:
          __break(1u);
LABEL_152:
          __break(1u);
LABEL_153:
          __break(1u);
          goto LABEL_154;
        }
        uint64_t v81 = v9;
        if (!v9) {
          goto LABEL_157;
        }
        uint64_t v82 = v10;
        uint64_t v83 = (uint64_t *)(v39 + 16 * v80);
        uint64_t v84 = *v83;
        uint64_t v85 = v39;
        unint64_t v86 = v41;
        v87 = (void *)(v39 + 16 * v41);
        uint64_t v88 = v87[1];
        uint64_t v89 = v81;
        uint64_t result = sub_261516580((char *)(v81 + 16 * *v83), (char *)(v81 + 16 * *v87), v81 + 16 * v88, v104);
        if (v1) {
          goto LABEL_114;
        }
        if (v88 < v84) {
          goto LABEL_131;
        }
        if (v86 > *(void *)(v82 + 16)) {
          goto LABEL_132;
        }
        *uint64_t v83 = v84;
        *(void *)(v85 + 16 * v80 + 8) = v88;
        unint64_t v90 = *(void *)(v82 + 16);
        if (v86 >= v90) {
          goto LABEL_133;
        }
        uint64_t v10 = v82;
        unint64_t v11 = v90 - 1;
        uint64_t result = (uint64_t)memmove(v87, v87 + 2, 16 * (v90 - 1 - v86));
        uint64_t v39 = v85;
        *(void *)(v82 + 16) = v90 - 1;
        uint64_t v9 = v89;
        uint64_t v8 = v103;
        if (v90 <= 2) {
          goto LABEL_15;
        }
      }
    }
    unint64_t v11 = 1;
LABEL_15:
    uint64_t v3 = v102;
    if (v8 >= v102)
    {
      uint64_t v7 = v100;
      goto LABEL_117;
    }
  }
  if (__OFADD__(v12, v101)) {
    goto LABEL_153;
  }
  if (v12 + v101 >= v3) {
    uint64_t v30 = v3;
  }
  else {
    uint64_t v30 = v12 + v101;
  }
  if (v30 >= v12)
  {
    if (v8 != v30)
    {
      uint64_t v31 = (uint64_t *)(v9 + 16 * v8);
      do
      {
        uint64_t v32 = (uint64_t *)(v9 + 16 * v8);
        uint64_t result = *v32;
        uint64_t v33 = v32[1];
        uint64_t v34 = v12;
        uint64_t v35 = v31;
        do
        {
          if (result == *(v35 - 2) && v33 == *(v35 - 1)) {
            break;
          }
          uint64_t result = sub_26151A118();
          if ((result & 1) == 0) {
            break;
          }
          if (!v9) {
            goto LABEL_156;
          }
          uint64_t result = *v35;
          uint64_t v33 = v35[1];
          *(_OWORD *)uint64_t v35 = *((_OWORD *)v35 - 1);
          *(v35 - 1) = v33;
          *(v35 - 2) = result;
          v35 -= 2;
          ++v34;
        }
        while (v8 != v34);
        ++v8;
        v31 += 2;
      }
      while (v8 != v30);
      uint64_t v8 = v30;
    }
    goto LABEL_66;
  }
LABEL_154:
  __break(1u);
LABEL_155:
  __break(1u);
LABEL_156:
  __break(1u);
LABEL_157:
  __break(1u);
LABEL_158:
  __break(1u);
LABEL_159:
  __break(1u);
  return result;
}

uint64_t sub_2615164B0(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  if (a3 != a2)
  {
    uint64_t v4 = a3;
    uint64_t v6 = result;
    uint64_t v7 = *a4;
    uint64_t v8 = *a4 + 16 * a3;
LABEL_5:
    uint64_t v9 = (uint64_t *)(v7 + 16 * v4);
    uint64_t result = *v9;
    uint64_t v10 = v9[1];
    uint64_t v11 = v6;
    uint64_t v12 = (uint64_t *)v8;
    while (1)
    {
      BOOL v13 = result == *(v12 - 2) && v10 == *(v12 - 1);
      if (v13 || (uint64_t result = sub_26151A118(), (result & 1) == 0))
      {
LABEL_4:
        ++v4;
        v8 += 16;
        if (v4 == a2) {
          return result;
        }
        goto LABEL_5;
      }
      if (!v7) {
        break;
      }
      uint64_t result = *v12;
      uint64_t v10 = v12[1];
      *(_OWORD *)uint64_t v12 = *((_OWORD *)v12 - 1);
      *(v12 - 1) = v10;
      *(v12 - 2) = result;
      v12 -= 2;
      if (v4 == ++v11) {
        goto LABEL_4;
      }
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_261516580(char *__dst, char *__src, unint64_t a3, char *a4)
{
  uint64_t v4 = a4;
  uint64_t v6 = __src;
  uint64_t v7 = __dst;
  int64_t v8 = __src - __dst;
  int64_t v9 = __src - __dst + 15;
  if (__src - __dst >= 0) {
    int64_t v9 = __src - __dst;
  }
  uint64_t v10 = v9 >> 4;
  uint64_t v11 = a3 - (void)__src;
  uint64_t v12 = a3 - (void)__src + 15;
  if ((uint64_t)(a3 - (void)__src) >= 0) {
    uint64_t v12 = a3 - (void)__src;
  }
  uint64_t v13 = v12 >> 4;
  if (v10 >= v12 >> 4)
  {
    if (a4 != __src || &__src[16 * v13] <= a4) {
      memmove(a4, __src, 16 * v13);
    }
    uint64_t v14 = &v4[16 * v13];
    if (v7 >= v6 || v11 < 16) {
      goto LABEL_48;
    }
    int v17 = (char *)(a3 - 16);
    while (1)
    {
      uint64_t v18 = v17 + 16;
      id v19 = v6 - 16;
      BOOL v20 = *((void *)v14 - 2) == *((void *)v6 - 2) && *((void *)v14 - 1) == *((void *)v6 - 1);
      if (v20 || (sub_26151A118() & 1) == 0)
      {
        id v19 = v14 - 16;
        if (v18 != v14)
        {
          v14 -= 16;
LABEL_45:
          *(_OWORD *)int v17 = *(_OWORD *)v19;
          goto LABEL_46;
        }
        BOOL v21 = v17 >= v14;
        v14 -= 16;
        if (v21) {
          goto LABEL_45;
        }
      }
      else
      {
        if (v18 != v6)
        {
          v6 -= 16;
          goto LABEL_45;
        }
        BOOL v21 = v17 >= v6;
        v6 -= 16;
        if (v21) {
          goto LABEL_45;
        }
      }
LABEL_46:
      if (v6 > v7)
      {
        v17 -= 16;
        if (v14 > v4) {
          continue;
        }
      }
      goto LABEL_48;
    }
  }
  if (a4 != __dst || &__dst[16 * v10] <= a4) {
    memmove(a4, __dst, 16 * v10);
  }
  uint64_t v14 = &v4[16 * v10];
  if ((unint64_t)v6 < a3 && v8 >= 16)
  {
    while (1)
    {
      BOOL v15 = *(void *)v6 == *(void *)v4 && *((void *)v6 + 1) == *((void *)v4 + 1);
      if (v15 || (sub_26151A118() & 1) == 0) {
        break;
      }
      long long v16 = v6;
      BOOL v15 = v7 == v6;
      v6 += 16;
      if (!v15) {
        goto LABEL_20;
      }
LABEL_21:
      v7 += 16;
      if (v4 >= v14 || (unint64_t)v6 >= a3) {
        goto LABEL_23;
      }
    }
    long long v16 = v4;
    BOOL v15 = v7 == v4;
    v4 += 16;
    if (v15) {
      goto LABEL_21;
    }
LABEL_20:
    *(_OWORD *)uint64_t v7 = *(_OWORD *)v16;
    goto LABEL_21;
  }
LABEL_23:
  uint64_t v6 = v7;
LABEL_48:
  if (v6 != v4 || v6 >= &v4[(v14 - v4 + (v14 - v4 < 0 ? 0xFuLL : 0)) & 0xFFFFFFFFFFFFFFF0]) {
    memmove(v6, v4, 16 * ((v14 - v4) / 16));
  }
  return 1;
}

char *sub_2615167B0(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
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
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A920448);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 16 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_2615168AC(uint64_t a1)
{
  return sub_2615167B0(0, *(void *)(a1 + 16), 0, (char *)a1);
}

char *sub_2615168C0(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_2615168E0(a1, a2, a3, *v3);
  void *v3 = result;
  return result;
}

char *sub_2615168E0(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
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
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A9203E0);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

uint64_t sub_2615169E4(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *v3;
  sub_26151A138();
  swift_bridgeObjectRetain();
  sub_26151A028();
  uint64_t v8 = sub_26151A158();
  uint64_t v9 = -1 << *(unsigned char *)(v7 + 32);
  unint64_t v10 = v8 & ~v9;
  if ((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10))
  {
    uint64_t v11 = *(void *)(v7 + 48);
    uint64_t v12 = (void *)(v11 + 16 * v10);
    BOOL v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_26151A118() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v14 = (uint64_t *)(*(void *)(*v3 + 48) + 16 * v10);
      uint64_t v15 = v14[1];
      *a1 = *v14;
      a1[1] = v15;
      swift_bridgeObjectRetain();
      return 0;
    }
    uint64_t v17 = ~v9;
    while (1)
    {
      unint64_t v10 = (v10 + 1) & v17;
      if (((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) == 0) {
        break;
      }
      uint64_t v18 = (void *)(v11 + 16 * v10);
      BOOL v19 = *v18 == a2 && v18[1] == a3;
      if (v19 || (sub_26151A118() & 1) != 0) {
        goto LABEL_7;
      }
    }
  }
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v21 = *v3;
  uint64_t *v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_261517930(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  uint64_t *v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

unint64_t sub_261516B94(uint64_t a1, uint64_t a2)
{
  sub_26151A138();
  sub_26151A028();
  uint64_t v4 = sub_26151A158();

  return sub_26151784C(a1, a2, v4);
}

uint64_t sub_261516C0C()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A920450);
  uint64_t v3 = sub_26151A0B8();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    uint64_t v30 = (void *)(v2 + 56);
    if (v5 < 64) {
      uint64_t v6 = ~(-1 << v5);
    }
    else {
      uint64_t v6 = -1;
    }
    unint64_t v7 = v6 & *(void *)(v2 + 56);
    int64_t v8 = (unint64_t)(v5 + 63) >> 6;
    uint64_t v9 = v3 + 56;
    uint64_t result = swift_retain();
    int64_t v11 = 0;
    while (1)
    {
      if (v7)
      {
        unint64_t v14 = __clz(__rbit64(v7));
        v7 &= v7 - 1;
        unint64_t v15 = v14 | (v11 << 6);
      }
      else
      {
        int64_t v16 = v11 + 1;
        if (__OFADD__(v11, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v16 >= v8) {
          goto LABEL_33;
        }
        unint64_t v17 = v30[v16];
        ++v11;
        if (!v17)
        {
          int64_t v11 = v16 + 1;
          if (v16 + 1 >= v8) {
            goto LABEL_33;
          }
          unint64_t v17 = v30[v11];
          if (!v17)
          {
            int64_t v11 = v16 + 2;
            if (v16 + 2 >= v8) {
              goto LABEL_33;
            }
            unint64_t v17 = v30[v11];
            if (!v17)
            {
              int64_t v18 = v16 + 3;
              if (v18 >= v8)
              {
LABEL_33:
                swift_release();
                uint64_t v1 = v0;
                uint64_t v29 = 1 << *(unsigned char *)(v2 + 32);
                if (v29 > 63) {
                  bzero(v30, ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v30 = -1 << v29;
                }
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v17 = v30[v18];
              if (!v17)
              {
                while (1)
                {
                  int64_t v11 = v18 + 1;
                  if (__OFADD__(v18, 1)) {
                    goto LABEL_39;
                  }
                  if (v11 >= v8) {
                    goto LABEL_33;
                  }
                  unint64_t v17 = v30[v11];
                  ++v18;
                  if (v17) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v11 = v18;
            }
          }
        }
LABEL_23:
        unint64_t v7 = (v17 - 1) & v17;
        unint64_t v15 = __clz(__rbit64(v17)) + (v11 << 6);
      }
      BOOL v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
      uint64_t v20 = *v19;
      uint64_t v21 = v19[1];
      sub_26151A138();
      sub_26151A028();
      uint64_t result = sub_26151A158();
      uint64_t v22 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v23 = result & ~v22;
      unint64_t v24 = v23 >> 6;
      if (((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6))) != 0)
      {
        unint64_t v12 = __clz(__rbit64((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v25 = 0;
        unint64_t v26 = (unint64_t)(63 - v22) >> 6;
        do
        {
          if (++v24 == v26 && (v25 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v27 = v24 == v26;
          if (v24 == v26) {
            unint64_t v24 = 0;
          }
          v25 |= v27;
          uint64_t v28 = *(void *)(v9 + 8 * v24);
        }
        while (v28 == -1);
        unint64_t v12 = __clz(__rbit64(~v28)) + (v24 << 6);
      }
      *(void *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
      BOOL v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
      void *v13 = v20;
      v13[1] = v21;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v1 = v4;
  return result;
}

uint64_t sub_261516EEC(uint64_t isStackAllocationSafe, uint64_t a2)
{
  uint64_t v3 = isStackAllocationSafe;
  v10[1] = *MEMORY[0x263EF8340];
  char v4 = *(unsigned char *)(a2 + 32);
  unint64_t v5 = (unint64_t)((1 << v4) + 63) >> 6;
  size_t v6 = 8 * v5;
  if ((v4 & 0x3Fu) <= 0xD
    || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    MEMORY[0x270FA5388](isStackAllocationSafe, a2);
    bzero((char *)v10 - ((v6 + 15) & 0x3FFFFFFFFFFFFFF0), v6);
    uint64_t v7 = sub_261517074((uint64_t)v10 - ((v6 + 15) & 0x3FFFFFFFFFFFFFF0), v5, a2, v3);
    swift_release();
  }
  else
  {
    int64_t v8 = (void *)swift_slowAlloc();
    bzero(v8, v6);
    uint64_t v7 = sub_261517074((uint64_t)v8, v5, a2, v3);
    swift_release();
    MEMORY[0x263E38950](v8, -1, -1);
  }
  return v7;
}

uint64_t sub_261517074(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4;
  uint64_t v5 = a3;
  uint64_t v57 = (unint64_t *)result;
  if (*(void *)(a4 + 16) < *(void *)(a3 + 16))
  {
    int64_t v6 = 0;
    uint64_t v58 = a4 + 56;
    uint64_t v7 = 1 << *(unsigned char *)(a4 + 32);
    if (v7 < 64) {
      uint64_t v8 = ~(-1 << v7);
    }
    else {
      uint64_t v8 = -1;
    }
    unint64_t v9 = v8 & *(void *)(a4 + 56);
    int64_t v59 = (unint64_t)(v7 + 63) >> 6;
    uint64_t v61 = 0;
    uint64_t v10 = a3 + 56;
    while (1)
    {
      while (1)
      {
        if (v9)
        {
          unint64_t v11 = __clz(__rbit64(v9));
          v9 &= v9 - 1;
          int64_t v62 = v6;
          unint64_t v12 = v11 | (v6 << 6);
        }
        else
        {
          int64_t v13 = v6 + 1;
          if (__OFADD__(v6, 1))
          {
            __break(1u);
            goto LABEL_81;
          }
          if (v13 >= v59) {
            goto LABEL_79;
          }
          unint64_t v14 = *(void *)(v58 + 8 * v13);
          int64_t v15 = v6 + 1;
          if (!v14)
          {
            int64_t v15 = v6 + 2;
            if (v6 + 2 >= v59) {
              goto LABEL_79;
            }
            unint64_t v14 = *(void *)(v58 + 8 * v15);
            if (!v14)
            {
              int64_t v15 = v6 + 3;
              if (v6 + 3 >= v59) {
                goto LABEL_79;
              }
              unint64_t v14 = *(void *)(v58 + 8 * v15);
              if (!v14)
              {
                uint64_t v16 = v6 + 4;
                if (v6 + 4 >= v59) {
                  goto LABEL_79;
                }
                unint64_t v14 = *(void *)(v58 + 8 * v16);
                if (!v14)
                {
                  while (1)
                  {
                    int64_t v15 = v16 + 1;
                    if (__OFADD__(v16, 1)) {
                      goto LABEL_83;
                    }
                    if (v15 >= v59) {
                      goto LABEL_79;
                    }
                    unint64_t v14 = *(void *)(v58 + 8 * v15);
                    ++v16;
                    if (v14) {
                      goto LABEL_22;
                    }
                  }
                }
                int64_t v15 = v6 + 4;
              }
            }
          }
LABEL_22:
          unint64_t v9 = (v14 - 1) & v14;
          int64_t v62 = v15;
          unint64_t v12 = __clz(__rbit64(v14)) + (v15 << 6);
        }
        unint64_t v17 = (uint64_t *)(*(void *)(v4 + 48) + 16 * v12);
        uint64_t v19 = *v17;
        uint64_t v18 = v17[1];
        sub_26151A138();
        swift_bridgeObjectRetain();
        sub_26151A028();
        uint64_t v20 = sub_26151A158();
        uint64_t v21 = -1 << *(unsigned char *)(v5 + 32);
        unint64_t v22 = v20 & ~v21;
        unint64_t v23 = v22 >> 6;
        uint64_t v24 = 1 << v22;
        if (((1 << v22) & *(void *)(v10 + 8 * (v22 >> 6))) != 0) {
          break;
        }
LABEL_6:
        uint64_t result = swift_bridgeObjectRelease();
        int64_t v6 = v62;
        uint64_t v5 = a3;
        uint64_t v4 = a4;
      }
      uint64_t v25 = *(void *)(a3 + 48);
      unint64_t v26 = (void *)(v25 + 16 * v22);
      BOOL v27 = *v26 == v19 && v26[1] == v18;
      if (!v27 && (sub_26151A118() & 1) == 0)
      {
        uint64_t v28 = ~v21;
        for (unint64_t i = v22 + 1; ; unint64_t i = v30 + 1)
        {
          unint64_t v30 = i & v28;
          if (((*(void *)(v10 + (((i & v28) >> 3) & 0xFFFFFFFFFFFFFF8)) >> (i & v28)) & 1) == 0) {
            break;
          }
          uint64_t v31 = (void *)(v25 + 16 * v30);
          BOOL v32 = *v31 == v19 && v31[1] == v18;
          if (v32 || (sub_26151A118() & 1) != 0)
          {
            uint64_t result = swift_bridgeObjectRelease();
            unint64_t v23 = v30 >> 6;
            uint64_t v24 = 1 << v30;
            goto LABEL_38;
          }
        }
        goto LABEL_6;
      }
      uint64_t result = swift_bridgeObjectRelease();
LABEL_38:
      int64_t v6 = v62;
      uint64_t v5 = a3;
      v57[v23] |= v24;
      BOOL v33 = __OFADD__(v61++, 1);
      uint64_t v4 = a4;
      if (v33) {
        goto LABEL_82;
      }
    }
  }
  int64_t v34 = 0;
  uint64_t v60 = a3 + 56;
  uint64_t v61 = 0;
  uint64_t v35 = 1 << *(unsigned char *)(a3 + 32);
  if (v35 < 64) {
    uint64_t v36 = ~(-1 << v35);
  }
  else {
    uint64_t v36 = -1;
  }
  unint64_t v37 = v36 & *(void *)(a3 + 56);
  int64_t v63 = (unint64_t)(v35 + 63) >> 6;
  uint64_t v38 = a4 + 56;
  while (1)
  {
    if (v37)
    {
      unint64_t v39 = __clz(__rbit64(v37));
      v37 &= v37 - 1;
      unint64_t v40 = v39 | (v34 << 6);
      goto LABEL_63;
    }
    int64_t v41 = v34 + 1;
    if (__OFADD__(v34, 1))
    {
LABEL_81:
      __break(1u);
LABEL_82:
      __break(1u);
LABEL_83:
      __break(1u);
      goto LABEL_84;
    }
    if (v41 >= v63) {
      goto LABEL_79;
    }
    unint64_t v42 = *(void *)(v60 + 8 * v41);
    ++v34;
    if (!v42)
    {
      int64_t v34 = v41 + 1;
      if (v41 + 1 >= v63) {
        goto LABEL_79;
      }
      unint64_t v42 = *(void *)(v60 + 8 * v34);
      if (!v42)
      {
        int64_t v34 = v41 + 2;
        if (v41 + 2 >= v63) {
          goto LABEL_79;
        }
        unint64_t v42 = *(void *)(v60 + 8 * v34);
        if (!v42) {
          break;
        }
      }
    }
LABEL_62:
    unint64_t v37 = (v42 - 1) & v42;
    unint64_t v40 = __clz(__rbit64(v42)) + (v34 << 6);
LABEL_63:
    uint64_t v44 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v40);
    uint64_t v46 = *v44;
    uint64_t v45 = v44[1];
    sub_26151A138();
    swift_bridgeObjectRetain();
    sub_26151A028();
    uint64_t v47 = sub_26151A158();
    uint64_t v48 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v49 = v47 & ~v48;
    if (((*(void *)(v38 + ((v49 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v49) & 1) == 0) {
      goto LABEL_46;
    }
    uint64_t v50 = *(void *)(a4 + 48);
    uint64_t v51 = (void *)(v50 + 16 * v49);
    BOOL v52 = *v51 == v46 && v51[1] == v45;
    if (v52 || (sub_26151A118() & 1) != 0)
    {
LABEL_76:
      uint64_t result = swift_bridgeObjectRelease();
      *(unint64_t *)((char *)v57 + ((v40 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v40;
      BOOL v33 = __OFADD__(v61++, 1);
      uint64_t v5 = a3;
      uint64_t v4 = a4;
      if (v33)
      {
        __break(1u);
LABEL_79:
        swift_retain();
        return sub_2615175B4(v57, a2, v61, v5);
      }
    }
    else
    {
      uint64_t v53 = ~v48;
      while (1)
      {
        unint64_t v49 = (v49 + 1) & v53;
        if (((*(void *)(v38 + ((v49 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v49) & 1) == 0) {
          break;
        }
        uint64_t v54 = (void *)(v50 + 16 * v49);
        BOOL v55 = *v54 == v46 && v54[1] == v45;
        if (v55 || (sub_26151A118() & 1) != 0) {
          goto LABEL_76;
        }
      }
LABEL_46:
      uint64_t result = swift_bridgeObjectRelease();
      uint64_t v5 = a3;
      uint64_t v4 = a4;
    }
  }
  int64_t v43 = v41 + 3;
  if (v43 >= v63) {
    goto LABEL_79;
  }
  unint64_t v42 = *(void *)(v60 + 8 * v43);
  if (v42)
  {
    int64_t v34 = v43;
    goto LABEL_62;
  }
  while (1)
  {
    int64_t v34 = v43 + 1;
    if (__OFADD__(v43, 1)) {
      break;
    }
    if (v34 >= v63) {
      goto LABEL_79;
    }
    unint64_t v42 = *(void *)(v60 + 8 * v34);
    ++v43;
    if (v42) {
      goto LABEL_62;
    }
  }
LABEL_84:
  __break(1u);
  return result;
}

uint64_t sub_2615175B4(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4;
  if (!a3)
  {
    uint64_t v8 = MEMORY[0x263F8EE88];
LABEL_36:
    swift_release();
    return v8;
  }
  uint64_t v5 = a3;
  if (*(void *)(a4 + 16) == a3) {
    return v4;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A920450);
  uint64_t result = sub_26151A0C8();
  uint64_t v8 = result;
  uint64_t v30 = a2;
  if (a2 < 1) {
    unint64_t v9 = 0;
  }
  else {
    unint64_t v9 = *a1;
  }
  uint64_t v10 = 0;
  uint64_t v11 = result + 56;
  while (1)
  {
    if (v9)
    {
      unint64_t v12 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      unint64_t v13 = v12 | (v10 << 6);
      goto LABEL_24;
    }
    uint64_t v14 = v10 + 1;
    if (__OFADD__(v10, 1)) {
      goto LABEL_39;
    }
    if (v14 >= v30) {
      goto LABEL_36;
    }
    unint64_t v15 = a1[v14];
    ++v10;
    if (!v15)
    {
      uint64_t v10 = v14 + 1;
      if (v14 + 1 >= v30) {
        goto LABEL_36;
      }
      unint64_t v15 = a1[v10];
      if (!v15)
      {
        uint64_t v10 = v14 + 2;
        if (v14 + 2 >= v30) {
          goto LABEL_36;
        }
        unint64_t v15 = a1[v10];
        if (!v15) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v9 = (v15 - 1) & v15;
    unint64_t v13 = __clz(__rbit64(v15)) + (v10 << 6);
LABEL_24:
    unint64_t v17 = (uint64_t *)(*(void *)(v4 + 48) + 16 * v13);
    uint64_t v18 = *v17;
    uint64_t v19 = v17[1];
    sub_26151A138();
    swift_bridgeObjectRetain();
    sub_26151A028();
    uint64_t result = sub_26151A158();
    uint64_t v20 = -1 << *(unsigned char *)(v8 + 32);
    unint64_t v21 = result & ~v20;
    unint64_t v22 = v21 >> 6;
    if (((-1 << v21) & ~*(void *)(v11 + 8 * (v21 >> 6))) != 0)
    {
      unint64_t v23 = __clz(__rbit64((-1 << v21) & ~*(void *)(v11 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v24 = 0;
      unint64_t v25 = (unint64_t)(63 - v20) >> 6;
      do
      {
        if (++v22 == v25 && (v24 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        BOOL v26 = v22 == v25;
        if (v22 == v25) {
          unint64_t v22 = 0;
        }
        v24 |= v26;
        uint64_t v27 = *(void *)(v11 + 8 * v22);
      }
      while (v27 == -1);
      unint64_t v23 = __clz(__rbit64(~v27)) + (v22 << 6);
    }
    *(void *)(v11 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v23;
    uint64_t v28 = (void *)(*(void *)(v8 + 48) + 16 * v23);
    *uint64_t v28 = v18;
    v28[1] = v19;
    ++*(void *)(v8 + 16);
    if (__OFSUB__(v5--, 1))
    {
LABEL_38:
      __break(1u);
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }
    if (!v5) {
      goto LABEL_36;
    }
  }
  uint64_t v16 = v14 + 3;
  if (v16 >= v30) {
    goto LABEL_36;
  }
  unint64_t v15 = a1[v16];
  if (v15)
  {
    uint64_t v10 = v16;
    goto LABEL_23;
  }
  while (1)
  {
    uint64_t v10 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v10 >= v30) {
      goto LABEL_36;
    }
    unint64_t v15 = a1[v10];
    ++v16;
    if (v15) {
      goto LABEL_23;
    }
  }
LABEL_40:
  __break(1u);
  return result;
}

unint64_t sub_26151784C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_26151A118() & 1) == 0)
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
      while (!v14 && (sub_26151A118() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_261517930(uint64_t result, uint64_t a2, unint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v8 = result;
  unint64_t v9 = *(void *)(*v4 + 16);
  unint64_t v10 = *(void *)(*v4 + 24);
  if (v10 > v9 && (a4 & 1) != 0) {
    goto LABEL_22;
  }
  if (a4)
  {
    sub_261516C0C();
  }
  else
  {
    if (v10 > v9)
    {
      uint64_t result = (uint64_t)sub_261517ACC();
      goto LABEL_22;
    }
    sub_261517C80();
  }
  uint64_t v11 = *v4;
  sub_26151A138();
  sub_26151A028();
  uint64_t result = sub_26151A158();
  uint64_t v12 = -1 << *(unsigned char *)(v11 + 32);
  a3 = result & ~v12;
  uint64_t v13 = v11 + 56;
  if ((*(void *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3))
  {
    uint64_t v14 = *(void *)(v11 + 48);
    unint64_t v15 = (void *)(v14 + 16 * a3);
    BOOL v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (uint64_t result = sub_26151A118(), (result & 1) != 0))
    {
LABEL_21:
      uint64_t result = sub_26151A128();
      __break(1u);
    }
    else
    {
      uint64_t v17 = ~v12;
      while (1)
      {
        a3 = (a3 + 1) & v17;
        if (((*(void *)(v13 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3) & 1) == 0) {
          break;
        }
        uint64_t v18 = (void *)(v14 + 16 * a3);
        if (*v18 != v8 || v18[1] != a2)
        {
          uint64_t result = sub_26151A118();
          if ((result & 1) == 0) {
            continue;
          }
        }
        goto LABEL_21;
      }
    }
  }
LABEL_22:
  uint64_t v20 = *v5;
  *(void *)(*v5 + 8 * (a3 >> 6) + 56) |= 1 << a3;
  unint64_t v21 = (uint64_t *)(*(void *)(v20 + 48) + 16 * a3);
  *unint64_t v21 = v8;
  v21[1] = a2;
  uint64_t v22 = *(void *)(v20 + 16);
  BOOL v23 = __OFADD__(v22, 1);
  uint64_t v24 = v22 + 1;
  if (v23) {
    __break(1u);
  }
  else {
    *(void *)(v20 + 16) = v24;
  }
  return result;
}

void *sub_261517ACC()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A920450);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_26151A0A8();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    uint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 56);
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
    int64_t v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v20 >= v13) {
      goto LABEL_28;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      int64_t v9 = v20 + 1;
      if (v20 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v21 = *(void *)(v6 + 8 * v9);
      if (!v21)
      {
        int64_t v9 = v20 + 2;
        if (v20 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v21 = *(void *)(v6 + 8 * v9);
        if (!v21) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v21 - 1) & v21;
    unint64_t v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (void *)(*(void *)(v2 + 48) + v16);
    uint64_t v18 = v17[1];
    uint64_t v19 = (void *)(*(void *)(v4 + 48) + v16);
    *uint64_t v19 = *v17;
    v19[1] = v18;
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v22 = v20 + 3;
  if (v22 >= v13) {
    goto LABEL_28;
  }
  unint64_t v21 = *(void *)(v6 + 8 * v22);
  if (v21)
  {
    int64_t v9 = v22;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v9);
    ++v22;
    if (v21) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_261517C80()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A920450);
  uint64_t v3 = sub_26151A0B8();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v6 = v2 + 56;
  if (v5 < 64) {
    uint64_t v7 = ~(-1 << v5);
  }
  else {
    uint64_t v7 = -1;
  }
  unint64_t v8 = v7 & *(void *)(v2 + 56);
  int64_t v29 = (unint64_t)(v5 + 63) >> 6;
  uint64_t v9 = v3 + 56;
  uint64_t result = swift_retain();
  int64_t v11 = 0;
  while (1)
  {
    if (v8)
    {
      unint64_t v14 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v15 = v14 | (v11 << 6);
      goto LABEL_24;
    }
    int64_t v16 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v16 >= v29) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v11;
    if (!v17)
    {
      int64_t v11 = v16 + 1;
      if (v16 + 1 >= v29) {
        goto LABEL_33;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v11);
      if (!v17)
      {
        int64_t v11 = v16 + 2;
        if (v16 + 2 >= v29) {
          goto LABEL_33;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v11);
        if (!v17) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v8 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v11 << 6);
LABEL_24:
    uint64_t v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v20 = *v19;
    uint64_t v21 = v19[1];
    sub_26151A138();
    swift_bridgeObjectRetain();
    sub_26151A028();
    uint64_t result = sub_26151A158();
    uint64_t v22 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v23 = result & ~v22;
    unint64_t v24 = v23 >> 6;
    if (((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6))) != 0)
    {
      unint64_t v12 = __clz(__rbit64((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v22) >> 6;
      do
      {
        if (++v24 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v27 = v24 == v26;
        if (v24 == v26) {
          unint64_t v24 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v9 + 8 * v24);
      }
      while (v28 == -1);
      unint64_t v12 = __clz(__rbit64(~v28)) + (v24 << 6);
    }
    *(void *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    int64_t v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
    void *v13 = v20;
    v13[1] = v21;
    ++*(void *)(v4 + 16);
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v29)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    uint64_t v1 = v0;
    goto LABEL_35;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    int64_t v11 = v18;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v11 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v11 >= v29) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v11);
    ++v18;
    if (v17) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

char *sub_261517F30(uint64_t a1)
{
  return sub_2615168E0(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_261517F44(uint64_t result, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = (void *)result;
  uint64_t v6 = a4 + 56;
  uint64_t v7 = -1 << *(unsigned char *)(a4 + 32);
  if (-v7 < 64) {
    uint64_t v8 = ~(-1 << -(char)v7);
  }
  else {
    uint64_t v8 = -1;
  }
  unint64_t v9 = v8 & *(void *)(a4 + 56);
  if (!a2)
  {
    int64_t v12 = 0;
    uint64_t v10 = 0;
LABEL_38:
    *uint64_t v5 = a4;
    v5[1] = v6;
    uint64_t v5[2] = ~v7;
    v5[3] = v12;
    v5[4] = v9;
    return v10;
  }
  uint64_t v10 = a3;
  if (!a3)
  {
    int64_t v12 = 0;
    goto LABEL_38;
  }
  if (a3 < 0)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  int64_t v11 = a2;
  int64_t v12 = 0;
  uint64_t v13 = 0;
  int64_t v14 = (unint64_t)(63 - v7) >> 6;
  if (!v9) {
    goto LABEL_9;
  }
LABEL_8:
  unint64_t v15 = __clz(__rbit64(v9));
  v9 &= v9 - 1;
  unint64_t v16 = v15 | (v12 << 6);
  while (1)
  {
    ++v13;
    uint64_t v20 = (void *)(*(void *)(a4 + 48) + 16 * v16);
    uint64_t v21 = v20[1];
    *int64_t v11 = *v20;
    v11[1] = v21;
    if (v13 == v10)
    {
      swift_bridgeObjectRetain();
      goto LABEL_38;
    }
    v11 += 2;
    uint64_t result = swift_bridgeObjectRetain();
    if (v9) {
      goto LABEL_8;
    }
LABEL_9:
    int64_t v17 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_40;
    }
    if (v17 >= v14) {
      goto LABEL_33;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    if (!v18) {
      break;
    }
LABEL_18:
    unint64_t v9 = (v18 - 1) & v18;
    unint64_t v16 = __clz(__rbit64(v18)) + (v17 << 6);
    int64_t v12 = v17;
  }
  v12 += 2;
  if (v17 + 1 >= v14)
  {
    unint64_t v9 = 0;
    int64_t v12 = v17;
    goto LABEL_37;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v12);
  if (v18) {
    goto LABEL_14;
  }
  int64_t v19 = v17 + 2;
  if (v17 + 2 >= v14) {
    goto LABEL_33;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18) {
    goto LABEL_17;
  }
  int64_t v12 = v17 + 3;
  if (v17 + 3 >= v14)
  {
    unint64_t v9 = 0;
    int64_t v12 = v17 + 2;
    goto LABEL_37;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v12);
  if (v18)
  {
LABEL_14:
    int64_t v17 = v12;
    goto LABEL_18;
  }
  int64_t v19 = v17 + 4;
  if (v17 + 4 >= v14)
  {
LABEL_33:
    unint64_t v9 = 0;
LABEL_37:
    uint64_t v10 = v13;
    goto LABEL_38;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18)
  {
LABEL_17:
    int64_t v17 = v19;
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v17 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
    }
    if (v17 >= v14)
    {
      unint64_t v9 = 0;
      int64_t v12 = v14 - 1;
      goto LABEL_37;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    ++v19;
    if (v18) {
      goto LABEL_18;
    }
  }
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_261518144()
{
  unint64_t v0 = sub_26151A0E8();
  swift_bridgeObjectRelease();
  if (v0 >= 7) {
    return 7;
  }
  else {
    return v0;
  }
}

uint64_t sub_261518190()
{
  uint64_t v30 = sub_261519F78();
  uint64_t v0 = *(void *)(v30 - 8);
  MEMORY[0x270FA5388](v30, v1);
  uint64_t v3 = (char *)&v25 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v4 = objc_allocWithZone(MEMORY[0x263F086E0]);
  uint64_t v5 = (void *)sub_26151A008();
  id v6 = objc_msgSend(v4, sel_initWithPath_, v5);

  if (!v6)
  {
    __break(1u);
    goto LABEL_13;
  }
  uint64_t v7 = (void *)sub_26151A008();
  id v8 = objc_msgSend(v6, sel_objectForInfoDictionaryKey_, v7);

  if (!v8)
  {
LABEL_13:
    __break(1u);
    uint64_t result = swift_release();
    __break(1u);
    return result;
  }
  sub_26151A098();
  swift_unknownObjectRelease();
  sub_261519E74(&v34, v35);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A920390);
  swift_dynamicCast();
  uint64_t v9 = v36;
  int64_t v10 = *(void *)(v36 + 16);
  uint64_t v11 = MEMORY[0x263F8EE78];
  if (v10)
  {
    id v26 = v6;
    uint64_t v33 = MEMORY[0x263F8EE78];
    swift_bridgeObjectRetain();
    sub_2615168C0(0, v10, 0);
    unsigned int v28 = *MEMORY[0x263F07570];
    BOOL v27 = *(void (**)(char *, void, uint64_t))(v0 + 104);
    uint64_t v29 = v0 + 104;
    int64_t v12 = (void (**)(char *, uint64_t))(v0 + 8);
    uint64_t v25 = v9;
    uint64_t v13 = v9 + 40;
    do
    {
      uint64_t v14 = v30;
      v27(v3, v28, v30);
      swift_bridgeObjectRetain();
      uint64_t v15 = sub_261519F58();
      uint64_t v17 = v16;
      (*v12)(v3, v14);
      *(void *)&v35[0] = v15;
      *((void *)&v35[0] + 1) = v17;
      *(void *)&long long v34 = 45;
      *((void *)&v34 + 1) = 0xE100000000000000;
      uint64_t v31 = 95;
      unint64_t v32 = 0xE100000000000000;
      sub_261513BBC();
      uint64_t v18 = sub_26151A088();
      uint64_t v20 = v19;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v11 = v33;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_2615168C0(0, *(void *)(v11 + 16) + 1, 1);
        uint64_t v11 = v33;
      }
      unint64_t v22 = *(void *)(v11 + 16);
      unint64_t v21 = *(void *)(v11 + 24);
      if (v22 >= v21 >> 1)
      {
        sub_2615168C0((char *)(v21 > 1), v22 + 1, 1);
        uint64_t v11 = v33;
      }
      v13 += 16;
      *(void *)(v11 + 16) = v22 + 1;
      uint64_t v23 = v11 + 16 * v22;
      *(void *)(v23 + 32) = v18;
      *(void *)(v23 + 40) = v20;
      --v10;
    }
    while (v10);
    swift_bridgeObjectRelease();
    id v6 = v26;
  }
  uint64_t v36 = v11;
  swift_bridgeObjectRelease();
  *(void *)&v35[0] = v36;
  swift_bridgeObjectRetain_n();
  sub_261515CB4((char **)v35);
  swift_bridgeObjectRelease();

  uint64_t v36 = *(void *)&v35[0];
  swift_bridgeObjectRelease();
  return v36;
}

char *sub_261518558()
{
  uint64_t v66 = sub_261519F78();
  uint64_t v0 = *(void *)(v66 - 8);
  MEMORY[0x270FA5388](v66, v1);
  v65 = (char *)&v50 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A920460);
  uint64_t v5 = MEMORY[0x270FA5388](v3 - 8, v4);
  char v64 = (char *)&v50 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5, v7);
  int64_t v63 = (char *)&v50 - v8;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A920468);
  MEMORY[0x270FA5388](v9 - 8, v10);
  int64_t v62 = (char *)&v50 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A920470);
  MEMORY[0x270FA5388](v12 - 8, v13);
  uint64_t v61 = (char *)&v50 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v60 = sub_261519FF8();
  uint64_t v15 = *(void *)(v60 - 8);
  MEMORY[0x270FA5388](v60, v16);
  int64_t v59 = (char *)&v50 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_261519FE8();
  uint64_t v19 = *(void *)(v18 - 8);
  MEMORY[0x270FA5388](v18, v20);
  unint64_t v22 = (char *)&v50 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = sub_261519FB8();
  int64_t v24 = *(void *)(v23 + 16);
  if (v24)
  {
    uint64_t v72 = MEMORY[0x263F8EE78];
    sub_2615168C0(0, v24, 0);
    id v26 = *(void (**)(char *, unint64_t, uint64_t))(v19 + 16);
    uint64_t v25 = v19 + 16;
    uint64_t v57 = v26;
    unint64_t v27 = (*(unsigned __int8 *)(v25 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v25 + 64);
    uint64_t v50 = v23;
    unint64_t v28 = v23 + v27;
    uint64_t v29 = *(void *)(v25 + 56);
    BOOL v55 = (void (**)(char *, uint64_t))(v15 + 8);
    uint64_t v56 = v29;
    unsigned int v54 = *MEMORY[0x263F07570];
    uint64_t v53 = (void (**)(char *, void, uint64_t))(v0 + 104);
    BOOL v52 = (void (**)(char *, uint64_t))(v0 + 8);
    uint64_t v51 = (void (**)(char *, uint64_t))(v25 - 8);
    uint64_t v58 = v25;
    do
    {
      uint64_t v30 = v18;
      v57(v22, v28, v18);
      sub_261519FA8();
      sub_261519FD8();
      sub_261519FC8();
      uint64_t v31 = v59;
      sub_261519F68();
      sub_261519F48();
      (*v55)(v31, v60);
      uint64_t v32 = (uint64_t)v64;
      sub_261519FC8();
      uint64_t v33 = sub_261519F98();
      LODWORD(v31) = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v33 - 8) + 48))(v32, 1, v33);
      sub_261519E84(v32, &qword_26A920460);
      if (v31 == 1)
      {
        long long v34 = self;
        uint64_t v35 = (void *)sub_26151A008();
        swift_bridgeObjectRelease();
        id v36 = objc_msgSend(v34, sel_addLikelySubtagsForLocaleIdentifier_, v35, v50);

        sub_26151A018();
      }
      unint64_t v37 = v65;
      uint64_t v38 = v66;
      (*v53)(v65, v54, v66);
      unint64_t v39 = (char *)sub_261519F58();
      int64_t v41 = v40;
      (*v52)(v37, v38);
      v71[0] = v39;
      v71[1] = v41;
      uint64_t v69 = 45;
      unint64_t v70 = 0xE100000000000000;
      uint64_t v67 = 95;
      unint64_t v68 = 0xE100000000000000;
      sub_261513BBC();
      uint64_t v42 = sub_26151A088();
      uint64_t v44 = v43;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v18 = v30;
      (*v51)(v22, v30);
      uint64_t v45 = v72;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_2615168C0(0, *(void *)(v45 + 16) + 1, 1);
        uint64_t v45 = v72;
      }
      unint64_t v47 = *(void *)(v45 + 16);
      unint64_t v46 = *(void *)(v45 + 24);
      if (v47 >= v46 >> 1)
      {
        sub_2615168C0((char *)(v46 > 1), v47 + 1, 1);
        uint64_t v45 = v72;
      }
      *(void *)(v45 + 16) = v47 + 1;
      uint64_t v48 = v45 + 16 * v47;
      *(void *)(v48 + 32) = v42;
      *(void *)(v48 + 40) = v44;
      v28 += v56;
      --v24;
    }
    while (v24);
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v45 = MEMORY[0x263F8EE78];
  }
  v71[0] = (char *)v45;
  swift_bridgeObjectRetain();
  sub_261515CB4(v71);
  swift_bridgeObjectRelease();
  return v71[0];
}

uint64_t sub_261518BCC(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t result = sub_26151A078();
  uint64_t v8 = result;
  if (v2)
  {
    uint64_t v4 = (uint64_t *)(a1 + 40);
    do
    {
      uint64_t v5 = *(v4 - 1);
      uint64_t v6 = *v4;
      swift_bridgeObjectRetain();
      sub_2615169E4(&v7, v5, v6);
      swift_bridgeObjectRelease();
      v4 += 2;
      --v2;
    }
    while (v2);
    return v8;
  }
  return result;
}

uint64_t sub_261518C64(uint64_t a1, void (*a2)(uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v22 = a1 + 64;
  uint64_t v4 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v5 = -1;
  if (v4 < 64) {
    uint64_t v5 = ~(-1 << v4);
  }
  unint64_t v6 = v5 & *(void *)(a1 + 64);
  int64_t v7 = (unint64_t)(v4 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v9 = 0;
  while (1)
  {
    if (v6)
    {
      unint64_t v10 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      unint64_t v11 = v10 | (v9 << 6);
      goto LABEL_5;
    }
    int64_t v19 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v19 >= v7) {
      return swift_release();
    }
    unint64_t v20 = *(void *)(v22 + 8 * v19);
    ++v9;
    if (!v20)
    {
      int64_t v9 = v19 + 1;
      if (v19 + 1 >= v7) {
        return swift_release();
      }
      unint64_t v20 = *(void *)(v22 + 8 * v9);
      if (!v20)
      {
        int64_t v9 = v19 + 2;
        if (v19 + 2 >= v7) {
          return swift_release();
        }
        unint64_t v20 = *(void *)(v22 + 8 * v9);
        if (!v20)
        {
          int64_t v9 = v19 + 3;
          if (v19 + 3 >= v7) {
            return swift_release();
          }
          unint64_t v20 = *(void *)(v22 + 8 * v9);
          if (!v20) {
            break;
          }
        }
      }
    }
LABEL_22:
    unint64_t v6 = (v20 - 1) & v20;
    unint64_t v11 = __clz(__rbit64(v20)) + (v9 << 6);
LABEL_5:
    uint64_t v12 = 16 * v11;
    uint64_t v13 = (uint64_t *)(*(void *)(a1 + 48) + v12);
    uint64_t v14 = *v13;
    uint64_t v15 = v13[1];
    uint64_t v16 = (uint64_t *)(*(void *)(a1 + 56) + v12);
    uint64_t v17 = *v16;
    uint64_t v18 = v16[1];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    a2(v14, v15, v17, v18);
    swift_bridgeObjectRelease();
    uint64_t result = swift_bridgeObjectRelease();
  }
  int64_t v21 = v19 + 4;
  if (v21 >= v7) {
    return swift_release();
  }
  unint64_t v20 = *(void *)(v22 + 8 * v21);
  if (v20)
  {
    int64_t v9 = v21;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v9 = v21 + 1;
    if (__OFADD__(v21, 1)) {
      break;
    }
    if (v9 >= v7) {
      return swift_release();
    }
    unint64_t v20 = *(void *)(v22 + 8 * v9);
    ++v21;
    if (v20) {
      goto LABEL_22;
    }
  }
LABEL_25:
  __break(1u);
  return result;
}

char *sub_261518E2C()
{
  uint64_t v0 = sub_261518558();
  uint64_t v1 = (char *)sub_261518BCC((uint64_t)v0);
  swift_bridgeObjectRelease();
  Swift::String v9[2] = v1;
  unint64_t v2 = sub_261513C14((uint64_t)&unk_270D65A40);
  sub_261518C64(v2, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_261519E60);
  swift_bridgeObjectRelease();
  uint64_t v3 = sub_261518190();
  uint64_t v4 = sub_261518BCC(v3);
  swift_bridgeObjectRelease();
  uint64_t v5 = swift_bridgeObjectRetain();
  uint64_t v6 = sub_261516EEC(v5, v4);
  swift_bridgeObjectRelease();
  int64_t v7 = (char *)sub_261515D20(v6);
  swift_release();
  v9[0] = v7;
  swift_retain();
  sub_261515CB4(v9);
  swift_bridgeObjectRelease();
  swift_release();
  return v9[0];
}

uint64_t sub_261518F38(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A9203F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void *__swift_project_boxed_opaque_existential_0(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t __swift_destroy_boxed_opaque_existential_0(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_261519034(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A9203F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t type metadata accessor for VCSettings()
{
  return self;
}

unint64_t sub_2615190C4()
{
  unint64_t result = qword_26A920400;
  if (!qword_26A920400)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A920400);
  }
  return result;
}

uint64_t sub_261519118()
{
  return sub_261519208(&qword_26A920408, &qword_26A920410);
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

unint64_t sub_26151918C()
{
  unint64_t result = qword_26A920418;
  if (!qword_26A920418)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A920418);
  }
  return result;
}

uint64_t sub_2615191E0()
{
  return sub_261519208(&qword_26A920420, &qword_26A920428);
}

uint64_t sub_261519208(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_261519258@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v3 = (unsigned char *)(*a1 + OBJC_IVAR____TtC12VoiceControl10VCSettings_testMode);
  uint64_t result = swift_beginAccess();
  *a2 = *v3;
  return result;
}

void sub_2615192AC(char *a1, void *a2)
{
  char v2 = *a1;
  uint64_t v3 = (char *)(*a2 + OBJC_IVAR____TtC12VoiceControl10VCSettings_testMode);
  swift_beginAccess();
  char *v3 = v2;
  sub_261513604(v2);
}

uint64_t sub_26151930C@<X0>(BOOL *a1@<X8>)
{
  uint64_t result = _AXSCommandAndControlEnabled();
  *a1 = result != 0;
  return result;
}

uint64_t sub_26151933C(unsigned __int8 *a1)
{
  return MEMORY[0x270F906C8](*a1);
}

uint64_t sub_261519344@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_261514BF4();
  *a1 = result & 1;
  return result;
}

uint64_t sub_261519374(unsigned __int8 *a1)
{
  return sub_261514D08(*a1);
}

uint64_t sub_26151939C@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_261514D98();
  *a1 = result & 1;
  return result;
}

uint64_t sub_2615193CC(unsigned __int8 *a1)
{
  return sub_261514EAC(*a1);
}

uint64_t sub_2615193F4@<X0>(BOOL *a1@<X8>)
{
  uint64_t result = sub_2615150E0();
  *a1 = result == 3;
  return result;
}

uint64_t sub_26151942C(unsigned __int8 *a1)
{
  return sub_261515224(*a1);
}

uint64_t sub_261519454@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_26151544C(&v3);
  *a1 = v3;
  return result;
}

unsigned __int8 *sub_261519490(unsigned __int8 *a1)
{
  unsigned __int8 v2 = *a1;
  return sub_261515570(&v2);
}

uint64_t sub_2615194C8@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_261515780(&v3);
  *a1 = v3;
  return result;
}

unsigned char *sub_261519504(char *a1)
{
  char v2 = *a1;
  return sub_2615158B0(&v2);
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for RXDebugAutomationMode(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for RXDebugAutomationMode(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 3;
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
        JUMPOUT(0x2615196A8);
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
          *uint64_t result = a2 + 3;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for RXDebugAutomationMode()
{
  return &type metadata for RXDebugAutomationMode;
}

uint64_t getEnumTagSinglePayload for VCOverlayType(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF8) {
    goto LABEL_17;
  }
  if (a2 + 8 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 8) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 8;
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
      return (*a1 | (v4 << 8)) - 8;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 8;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 9;
  int v8 = v6 - 9;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for VCOverlayType(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 8 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 8) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF8) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF7)
  {
    unsigned int v6 = ((a2 - 248) >> 8) + 1;
    *uint64_t result = a2 + 8;
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
        JUMPOUT(0x261519840);
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
          *uint64_t result = a2 + 8;
        break;
    }
  }
  return result;
}

uint64_t sub_261519868(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_261519870(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for VCOverlayType()
{
  return &type metadata for VCOverlayType;
}

uint64_t type metadata accessor for VCUserDefaults()
{
  return self;
}

uint64_t method lookup function for VCSettings(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for VCSettings);
}

uint64_t dispatch thunk of VCSettings.testMode.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xA0))();
}

uint64_t dispatch thunk of VCSettings.testMode.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xA8))();
}

uint64_t dispatch thunk of VCSettings.testMode.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xB0))();
}

uint64_t dispatch thunk of VCSettings.enabled.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xB8))();
}

uint64_t dispatch thunk of VCSettings.enabled.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xC0))();
}

uint64_t dispatch thunk of VCSettings.enabled.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xC8))();
}

uint64_t dispatch thunk of VCSettings.supportedLocales.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xE8))();
}

uint64_t dispatch thunk of VCSettings.bestSupportedLocaleFor(_:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xF0))();
}

uint64_t dispatch thunk of VCSettings.setPreferredLocale(_:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x110))();
}

uint64_t dispatch thunk of VCSettings.activeLocale.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x118))();
}

uint64_t dispatch thunk of VCSettings.showTextResponseUponRecognition.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x120))();
}

uint64_t dispatch thunk of VCSettings.showTextResponseUponRecognition.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x128))();
}

uint64_t dispatch thunk of VCSettings.showTextResponseUponRecognition.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x130))();
}

uint64_t dispatch thunk of VCSettings.playSoundUponRecognition.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x138))();
}

uint64_t dispatch thunk of VCSettings.playSoundUponRecognition.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x140))();
}

uint64_t dispatch thunk of VCSettings.playSoundUponRecognition.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x148))();
}

uint64_t dispatch thunk of VCSettings.showUserHints.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x168))();
}

uint64_t dispatch thunk of VCSettings.showUserHints.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x170))();
}

uint64_t dispatch thunk of VCSettings.showUserHints.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x178))();
}

uint64_t dispatch thunk of VCSettings.automationMode.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x180))();
}

uint64_t dispatch thunk of VCSettings.automationMode.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x188))();
}

uint64_t dispatch thunk of VCSettings.automationMode.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x190))();
}

uint64_t dispatch thunk of VCSettings.alwaysShowOverlayType.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x198))();
}

uint64_t dispatch thunk of VCSettings.alwaysShowOverlayType.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1A0))();
}

uint64_t dispatch thunk of VCSettings.alwaysShowOverlayType.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1A8))();
}

uint64_t sub_261519E60(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_261513D38(a1, a2, a3, a4, *(uint64_t **)(v4 + 16));
}

uint64_t sub_261519E6C()
{
  return swift_release();
}

_OWORD *sub_261519E74(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_261519E84(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

void __getAFPreferencesClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  __getNSLocaleClass_block_invoke_cold_1(v0);
}

void __getNSLocaleClass_block_invoke_cold_1()
{
}

uint64_t sub_261519F38()
{
  return MEMORY[0x270EF0D78]();
}

uint64_t sub_261519F48()
{
  return MEMORY[0x270EF0D80]();
}

uint64_t sub_261519F58()
{
  return MEMORY[0x270EF0D90]();
}

uint64_t sub_261519F68()
{
  return MEMORY[0x270EF0DF0]();
}

uint64_t sub_261519F78()
{
  return MEMORY[0x270EF0E00]();
}

uint64_t sub_261519F88()
{
  return MEMORY[0x270EF0ED0]();
}

uint64_t sub_261519F98()
{
  return MEMORY[0x270EF0F70]();
}

uint64_t sub_261519FA8()
{
  return MEMORY[0x270EF1008]();
}

uint64_t sub_261519FB8()
{
  return MEMORY[0x270EF1018]();
}

uint64_t sub_261519FC8()
{
  return MEMORY[0x270EF1050]();
}

uint64_t sub_261519FD8()
{
  return MEMORY[0x270EF1058]();
}

uint64_t sub_261519FE8()
{
  return MEMORY[0x270EF1060]();
}

uint64_t sub_261519FF8()
{
  return MEMORY[0x270EF10A8]();
}

uint64_t sub_26151A008()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_26151A018()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_26151A028()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_26151A038()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_26151A048()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_26151A058()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_26151A068()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_26151A078()
{
  return MEMORY[0x270F9DEF0]();
}

uint64_t sub_26151A088()
{
  return MEMORY[0x270EF24A0]();
}

uint64_t sub_26151A098()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_26151A0A8()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_26151A0B8()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_26151A0C8()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_26151A0D8()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_26151A0E8()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_26151A0F8()
{
  return MEMORY[0x270F9F4C8]();
}

uint64_t sub_26151A108()
{
  return MEMORY[0x270F9F7C0]();
}

uint64_t sub_26151A118()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_26151A128()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_26151A138()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_26151A148()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_26151A158()
{
  return MEMORY[0x270F9FC90]();
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x270EE4B88]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x270EFDCB0](task, entitlement, error);
}

SecTaskRef SecTaskCreateFromSelf(CFAllocatorRef allocator)
{
  return (SecTaskRef)MEMORY[0x270EFDCD0](allocator);
}

uint64_t _AXSCommandAndControlEnabled()
{
  return MEMORY[0x270F906C0]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x270F76310]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x270ED8458]();
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void free(void *a1)
{
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x270EDA328](__size);
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

void objc_enumerationMutation(id obj)
{
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x270F9A658](name);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
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

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x270FA01C8]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x270FA01E0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x270FA0200]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x270FA0288]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x270FA02C0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
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

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
}

uint64_t swift_once()
{
  return MEMORY[0x270FA04F0]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x270FA0528]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x270FA0558]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x270FA0560]();
}

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return MEMORY[0x270FA0568]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}