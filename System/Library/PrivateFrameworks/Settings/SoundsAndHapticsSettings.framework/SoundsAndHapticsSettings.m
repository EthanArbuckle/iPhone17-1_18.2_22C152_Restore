void sub_237308D00(_Unwind_Exception *a1)
{
  __48__SHSRingerControl_canChangeRingtoneWithButtons__block_invoke();
  _Unwind_Resume(a1);
}

void sub_2373095F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_23730A394(_Unwind_Exception *a1)
{
}

void sub_23730A5FC(_Unwind_Exception *a1)
{
}

void sub_23730A7FC(_Unwind_Exception *exception_object)
{
}

void sub_23730A814(_Unwind_Exception *a1, int a2)
{
  if (a2) {
    objc_terminate();
  }
  sub_23730A7FC(a1);
}

void sub_23730AAC8(_Unwind_Exception *exception_object)
{
}

void sub_23730AD0C(_Unwind_Exception *a1)
{
}

void sub_23730B224(_Unwind_Exception *a1)
{
}

void sub_23730B7B4(_Unwind_Exception *a1)
{
}

void sub_23730BCA4(_Unwind_Exception *a1)
{
}

void sub_23730BE80(_Unwind_Exception *a1)
{
}

void unknownWiredDeviceStatusChanged(uint64_t a1, void *a2)
{
  [a2 reloadSpecifiers];
  id v8 = [a2 audioSettingsManager];
  uint64_t v3 = [v8 getPreferenceFor:*MEMORY[0x263F28BA0]];
  if (v3)
  {
    v4 = (void *)v3;
  }
  else
  {
    v5 = [a2 audioSettingsManager];
    v6 = [v5 getPreferenceFor:*MEMORY[0x263F28BD0]];
    uint64_t v7 = [v6 count];

    if (v7) {
      return;
    }
    id v8 = [MEMORY[0x263F01880] defaultWorkspace];
    v4 = [NSURL URLWithString:@"prefs:root=Sounds&path=HEADPHONE_LEVEL_LIMIT_SETTING"];
    [v8 openSensitiveURL:v4 withOptions:0];
  }
}

void sub_23731061C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t unknownWiredDeviceStatusChanged_0(uint64_t a1, void *a2)
{
  return [a2 reloadSpecifiers];
}

void sub_237312E64(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 104));
  _Unwind_Resume(a1);
}

id _SHSCTClient()
{
  if (_SHSCTClient_onceToken != -1) {
    dispatch_once(&_SHSCTClient_onceToken, &__block_literal_global);
  }
  v0 = (void *)_SHSCTClient_coreTelephonyClient;
  return v0;
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

id SHS_BundleForSoundsAndHapticsSettingsFramework()
{
  if (SHS_BundleForSoundsAndHapticsSettingsFramework_onceToken != -1) {
    dispatch_once(&SHS_BundleForSoundsAndHapticsSettingsFramework_onceToken, &__block_literal_global_0);
  }
  v0 = (void *)SHS_BundleForSoundsAndHapticsSettingsFramework__soundsAndHapticsSettingsFrameworkBundle;
  return v0;
}

id SHS_LocalizedStringForSounds(void *a1)
{
  id v1 = a1;
  uint64_t v2 = SHS_BundleForSoundsAndHapticsSettingsFramework();
  uint64_t v3 = [v2 localizedStringForKey:v1 value:0 table:@"Sounds"];

  return v3;
}

id SHSLogForCategory(unint64_t a1)
{
  if (a1 >= 2) {
    SHSLogForCategory_cold_1();
  }
  if (SHSLogForCategory_loggingToken != -1) {
    dispatch_once(&SHSLogForCategory_loggingToken, &__block_literal_global_1);
  }
  uint64_t v2 = (void *)SHSLogForCategory_logObjects[a1];
  return v2;
}

uint64_t __SHSLogForCategory_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.settings.SoundsAndHaptics", "Base");
  id v1 = (void *)SHSLogForCategory_logObjects[0];
  SHSLogForCategory_logObjects[0] = (uint64_t)v0;

  qword_26AC32CD8 = (uint64_t)os_log_create("com.apple.settings.SoundsAndHaptics", "Volume");
  return MEMORY[0x270F9A758]();
}

BOOL SHSSystemHapticsSetting()
{
  return CFPreferencesGetAppBooleanValue(@"effects-haptic", @"com.apple.preferences.sounds", 0) != 0;
}

id sub_23731AB78()
{
  id result = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for HeadphoneAudioNotificationModel()), sel_init);
  static HeadphoneAudioNotificationModel.shared = (uint64_t)result;
  return result;
}

uint64_t *HeadphoneAudioNotificationModel.shared.unsafeMutableAddressor()
{
  if (qword_2689176C8 != -1) {
    swift_once();
  }
  return &static HeadphoneAudioNotificationModel.shared;
}

id static HeadphoneAudioNotificationModel.shared.getter()
{
  if (qword_2689176C8 != -1) {
    swift_once();
  }
  os_log_t v0 = (void *)static HeadphoneAudioNotificationModel.shared;
  return v0;
}

uint64_t property wrapper backing initializer of HeadphoneAudioNotificationModel.data()
{
  return sub_237322950();
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

Swift::Void __swiftcall HeadphoneAudioNotificationModel.setData(_:)(Swift::OpaquePointer a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689176E0);
  uint64_t v4 = *(void *)(v3 - 8);
  ((void (*)(void))MEMORY[0x270FA5388])();
  v6 = (char *)&v45 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v60 = sub_2373226D0();
  uint64_t v7 = *(void *)(v60 - 8);
  ((void (*)(void))MEMORY[0x270FA5388])();
  v59 = (char *)&v45 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v63 = sub_2373226E0();
  uint64_t v9 = *(void *)(v63 - 8);
  uint64_t v10 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  v58 = (char *)&v45 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  v62 = (char *)&v45 - v12;
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689176E8);
  MEMORY[0x270FA5388](v13 - 8);
  v15 = (char *)&v45 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_237322710();
  MEMORY[0x270FA5388](v16);
  v68 = (char *)&v45 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = *((void *)a1._rawValue + 2);
  if (!v19)
  {
    v44 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_28;
  }
  v57 = v6;
  uint64_t v54 = v4;
  v55 = (int *)v3;
  v61 = v1;
  v20 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v17 + 56);
  v21 = (unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48);
  v66 = (void (**)(char *, char *, uint64_t))(v17 + 32);
  v53 = (void (**)(char *, uint64_t))(v7 + 8);
  v56 = (void (**)(char *, uint64_t))(v9 + 8);
  v52 = (void (**)(uint64_t, char *, uint64_t))(v17 + 16);
  v65 = (void (**)(char *, uint64_t))(v17 + 8);
  swift_bridgeObjectRetain();
  uint64_t v22 = 0;
  v64 = (void *)MEMORY[0x263F8EE78];
  uint64_t v67 = MEMORY[0x263F8EE58] + 8;
  do
  {
    uint64_t v23 = *((void *)a1._rawValue + v22 + 4);
    uint64_t v24 = *(void *)(v23 + 16);
    swift_bridgeObjectRetain();
    if (!v24 || (unint64_t v25 = sub_23731B8E4(1702125924, 0xE400000000000000), (v26 & 1) == 0))
    {
      (*v20)(v15, 1, 1, v16);
LABEL_4:
      swift_bridgeObjectRelease();
      sub_23731BA04((uint64_t)v15, &qword_2689176E8);
      goto LABEL_5;
    }
    sub_23731B9A8(*(void *)(v23 + 56) + 32 * v25, (uint64_t)&v70);
    int v27 = swift_dynamicCast();
    (*v20)(v15, v27 ^ 1u, 1, v16);
    if ((*v21)(v15, 1, v16) == 1) {
      goto LABEL_4;
    }
    (*v66)(v68, v15, v16);
    if (*(void *)(v23 + 16)
      && (unint64_t v28 = sub_23731B8E4(0x746E756F63, 0xE500000000000000), (v29 & 1) != 0)
      && (sub_23731B9A8(*(void *)(v23 + 56) + 32 * v28, (uint64_t)&v70), (swift_dynamicCast() & 1) != 0))
    {
      uint64_t v30 = v69;
      if (*(void *)(v23 + 16) && (unint64_t v31 = sub_23731B8E4(1668506980, 0xE400000000000000), (v32 & 1) != 0))
      {
        sub_23731B9A8(*(void *)(v23 + 56) + 32 * v31, (uint64_t)&v70);
      }
      else
      {
        long long v70 = 0u;
        long long v71 = 0u;
      }
      swift_bridgeObjectRelease();
      if (*((void *)&v71 + 1))
      {
        if (swift_dynamicCast())
        {
          uint64_t v50 = *((void *)&v69 + 1);
          uint64_t v51 = v69;
          v33 = v58;
          MEMORY[0x237E1AB20]();
          uint64_t v49 = v30;
          v34 = v59;
          sub_2373226C0();
          sub_2373226B0();
          (*v53)(v34, v60);
          v48 = *v56;
          v48(v33, v63);
          sub_23731BA60(&qword_268917708, MEMORY[0x263F07258]);
          v35 = v62;
          sub_237322700();
          v48(v35, v63);
          long long v69 = v70;
          swift_bridgeObjectRetain();
          sub_237322D20();
          swift_bridgeObjectRelease();
          uint64_t v47 = *((void *)&v69 + 1);
          v48 = (void (*)(char *, uint64_t))v69;
          uint64_t v46 = v55[12];
          uint64_t v36 = (uint64_t)v57;
          v37 = &v57[v55[16]];
          v45 = &v57[v55[20]];
          (*v52)((uint64_t)v57, v68, v16);
          *(void *)(v36 + v46) = v49;
          uint64_t v38 = v47;
          *(void *)v37 = v48;
          *((void *)v37 + 1) = v38;
          v39 = v45;
          uint64_t v40 = v50;
          *(void *)v45 = v51;
          *((void *)v39 + 1) = v40;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            v64 = (void *)sub_23731BAA8(0, v64[2] + 1, 1, v64);
          }
          unint64_t v42 = v64[2];
          unint64_t v41 = v64[3];
          if (v42 >= v41 >> 1) {
            v64 = (void *)sub_23731BAA8(v41 > 1, v42 + 1, 1, v64);
          }
          v43 = v64;
          v64[2] = v42 + 1;
          sub_23731BC84((uint64_t)v57, (uint64_t)v43+ ((*(unsigned __int8 *)(v54 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v54 + 80))+ *(void *)(v54 + 72) * v42);
        }
      }
      else
      {
        sub_23731BA04((uint64_t)&v70, &qword_268917700);
      }
    }
    else
    {
      swift_bridgeObjectRelease();
    }
    (*v65)(v68, v16);
LABEL_5:
    ++v22;
  }
  while (v19 != v22);
  swift_bridgeObjectRelease();
  id v1 = v61;
  v44 = v64;
LABEL_28:
  swift_getKeyPath();
  swift_getKeyPath();
  *(void *)&long long v70 = v44;
  v1;
  sub_237322970();
  type metadata accessor for HeadphoneAudioNotificationModel();
  sub_23731BA60(&qword_2689176F8, (void (*)(uint64_t))type metadata accessor for HeadphoneAudioNotificationModel);
  sub_237322930();
  sub_237322940();
  swift_release();
}

uint64_t sub_23731B690()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_237322960();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_23731B704@<X0>(void *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_237322960();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_23731B784(uint64_t a1, void **a2)
{
  uint64_t v2 = *a2;
  swift_getKeyPath();
  swift_getKeyPath();
  swift_bridgeObjectRetain();
  id v3 = v2;
  return sub_237322970();
}

id HeadphoneAudioNotificationModel.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for HeadphoneAudioNotificationModel();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_23731B8A4@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for HeadphoneAudioNotificationModel();
  uint64_t result = sub_237322930();
  *a1 = result;
  return result;
}

unint64_t sub_23731B8E4(uint64_t a1, uint64_t a2)
{
  sub_237322DA0();
  sub_237322D10();
  uint64_t v4 = sub_237322DC0();
  return sub_23731BE38(a1, a2, v4);
}

uint64_t type metadata accessor for HeadphoneAudioNotificationModel()
{
  uint64_t result = qword_268917710;
  if (!qword_268917710) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_23731B9A8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_23731BA04(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_23731BA60(unint64_t *a1, void (*a2)(uint64_t))
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

size_t sub_23731BAA8(size_t result, int64_t a2, char a3, void *a4)
{
  char v5 = result;
  if (a3)
  {
    unint64_t v6 = a4[3];
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_30:
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
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (!v9)
  {
    uint64_t v13 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_268917738);
  uint64_t v10 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2689176E0) - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (void *)swift_allocObject();
  uint64_t result = _swift_stdlib_malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  if (result - v12 == 0x8000000000000000 && v11 == -1) {
    goto LABEL_29;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(result - v12) / v11);
LABEL_19:
  uint64_t v15 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2689176E0) - 8);
  if (v5)
  {
    if (v13 < a4
      || (unint64_t v16 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80),
          (char *)v13 + v16 >= (char *)a4 + v16 + *(void *)(v15 + 72) * v8))
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return (size_t)v13;
}

uint64_t sub_23731BC84(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689176E0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_23731BCEC()
{
  return MEMORY[0x263EFDDD8];
}

uint64_t sub_23731BCF8()
{
  return type metadata accessor for HeadphoneAudioNotificationModel();
}

void sub_23731BD00()
{
  sub_23731BD90();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void sub_23731BD90()
{
  if (!qword_268917720)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2689176D8);
    unint64_t v0 = sub_237322980();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_268917720);
    }
  }
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

unint64_t sub_23731BE38(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_237322D80() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        uint64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_237322D80() & 1) == 0);
    }
  }
  return v6;
}

uint64_t static HeadphoneNotificationChartFactory.create()()
{
  if (qword_2689176C8 != -1) {
    swift_once();
  }
  unint64_t v0 = (void *)static HeadphoneAudioNotificationModel.shared;
  type metadata accessor for HeadphoneAudioNotificationModel();
  sub_23731E3A0(&qword_2689176F8, (void (*)(uint64_t))type metadata accessor for HeadphoneAudioNotificationModel);
  id v1 = v0;
  sub_2373229A0();
  id v2 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_268917740));
  return sub_237322A70();
}

id HeadphoneNotificationChartFactory.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

id HeadphoneNotificationChartFactory.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for HeadphoneNotificationChartFactory();
  return objc_msgSendSuper2(&v2, sel_init);
}

uint64_t type metadata accessor for HeadphoneNotificationChartFactory()
{
  return self;
}

id HeadphoneNotificationChartFactory.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for HeadphoneNotificationChartFactory();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void *initializeBufferWithCopyOfBuffer for HeadphoneNotificationChart(void *a1, void *a2)
{
  uint64_t v3 = (void *)a2[1];
  *a1 = *a2;
  a1[1] = v3;
  id v4 = v3;
  return a1;
}

void destroy for HeadphoneNotificationChart(uint64_t a1)
{
}

void *assignWithCopy for HeadphoneNotificationChart(void *a1, void *a2)
{
  *a1 = *a2;
  uint64_t v3 = (void *)a2[1];
  id v4 = (void *)a1[1];
  a1[1] = v3;
  id v5 = v3;

  return a1;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

void *assignWithTake for HeadphoneNotificationChart(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  id v4 = (void *)a1[1];
  *a1 = *a2;
  a1[1] = v3;

  return a1;
}

uint64_t getEnumTagSinglePayload for HeadphoneNotificationChart(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 16)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for HeadphoneNotificationChart(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 16) = 1;
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
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for HeadphoneNotificationChart()
{
  return &type metadata for HeadphoneNotificationChart;
}

uint64_t sub_23731C330()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_23731C34C@<X0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v54 = a1;
  uint64_t v70 = a3;
  uint64_t v58 = __swift_instantiateConcreteTypeFromMangledName(&qword_268917748);
  uint64_t v59 = *(void *)(v58 - 8);
  MEMORY[0x270FA5388](v58);
  v56 = (char *)v52 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v61 = __swift_instantiateConcreteTypeFromMangledName(&qword_268917750);
  uint64_t v63 = *(void *)(v61 - 8);
  MEMORY[0x270FA5388](v61);
  v55 = (char *)v52 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268917758);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v67 = v7;
  uint64_t v68 = v8;
  MEMORY[0x270FA5388](v7);
  v57 = (char *)v52 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v69 = __swift_instantiateConcreteTypeFromMangledName(&qword_268917760);
  uint64_t v66 = *(void *)(v69 - 8);
  MEMORY[0x270FA5388](v69);
  uint64_t v60 = (char *)v52 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v64 = __swift_instantiateConcreteTypeFromMangledName(&qword_268917768) - 8;
  MEMORY[0x270FA5388](v64);
  uint64_t v12 = (char *)v52 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v65 = __swift_instantiateConcreteTypeFromMangledName(&qword_268917770) - 8;
  MEMORY[0x270FA5388](v65);
  uint64_t v62 = (uint64_t)v52 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  swift_getKeyPath();
  id v14 = a2;
  sub_237322960();

  swift_release();
  swift_release();
  uint64_t v77 = v73;
  v52[3] = swift_getKeyPath();
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = a1;
  *(void *)(v15 + 24) = v14;
  id v53 = v14;
  v52[2] = __swift_instantiateConcreteTypeFromMangledName(&qword_2689176D8);
  v52[1] = __swift_instantiateConcreteTypeFromMangledName(&qword_268917778);
  sub_23731ED3C(&qword_268917780, &qword_2689176D8);
  sub_23731E3A0(&qword_268917788, MEMORY[0x263F07490]);
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268917790);
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268917798);
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2689177A0);
  uint64_t v73 = sub_237322900();
  uint64_t v74 = MEMORY[0x263EFCD08];
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  unint64_t v20 = sub_23731E274();
  uint64_t v21 = MEMORY[0x263F8D310];
  uint64_t v73 = v18;
  uint64_t v74 = MEMORY[0x263F8D310];
  uint64_t v75 = OpaqueTypeConformance2;
  unint64_t v76 = v20;
  uint64_t v22 = swift_getOpaqueTypeConformance2();
  uint64_t v73 = v17;
  uint64_t v74 = v21;
  uint64_t v75 = v22;
  unint64_t v76 = v20;
  uint64_t v23 = swift_getOpaqueTypeConformance2();
  uint64_t v73 = v16;
  uint64_t v74 = MEMORY[0x263F1A830];
  uint64_t v75 = v23;
  unint64_t v76 = MEMORY[0x263F1A820];
  swift_getOpaqueTypeConformance2();
  uint64_t v24 = v56;
  sub_2373228E0();
  uint64_t v25 = sub_23731ED3C(&qword_2689177B0, &qword_268917748);
  char v26 = v55;
  uint64_t v27 = v58;
  sub_237322B50();
  uint64_t v28 = v27;
  (*(void (**)(char *, uint64_t))(v59 + 8))(v24, v27);
  uint64_t v71 = v54;
  id v72 = v53;
  uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689177B8);
  uint64_t v73 = v28;
  uint64_t v74 = v25;
  uint64_t v30 = swift_getOpaqueTypeConformance2();
  uint64_t v31 = sub_23731ED3C(&qword_2689177C0, &qword_2689177B8);
  char v32 = v57;
  uint64_t v33 = v61;
  sub_237322B40();
  (*(void (**)(char *, uint64_t))(v63 + 8))(v26, v33);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2689177C8);
  uint64_t v73 = v33;
  uint64_t v74 = v29;
  uint64_t v75 = v30;
  unint64_t v76 = v31;
  swift_getOpaqueTypeConformance2();
  sub_23731E2D0();
  v34 = v60;
  uint64_t v35 = v67;
  sub_237322B60();
  (*(void (**)(char *, uint64_t))(v68 + 8))(v32, v35);
  uint64_t v36 = sub_237322BD0();
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v38 = v66;
  uint64_t v39 = v69;
  (*(void (**)(char *, char *, uint64_t))(v66 + 16))(v12, v34, v69);
  uint64_t v40 = (uint64_t *)&v12[*(int *)(v64 + 44)];
  *uint64_t v40 = KeyPath;
  v40[1] = v36;
  (*(void (**)(char *, uint64_t))(v38 + 8))(v34, v39);
  uint64_t v41 = sub_237322BF0();
  LOBYTE(KeyPath) = sub_237322A90();
  uint64_t v42 = v62;
  sub_23731E710((uint64_t)v12, v62, &qword_268917768);
  uint64_t v43 = v42 + *(int *)(v65 + 44);
  *(void *)uint64_t v43 = v41;
  *(unsigned char *)(v43 + 8) = KeyPath;
  sub_23731BA04((uint64_t)v12, &qword_268917768);
  LOBYTE(v41) = sub_237322A90();
  uint64_t v44 = v70;
  sub_23731E710(v42, v70, &qword_268917770);
  uint64_t v45 = v44 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2689177F0) + 36);
  *(unsigned char *)uint64_t v45 = v41;
  *(_OWORD *)(v45 + 8) = xmmword_2373249B0;
  __asm { FMOV            V0.2D, #9.0 }
  *(_OWORD *)(v45 + 24) = _Q0;
  *(unsigned char *)(v45 + 40) = 0;
  return sub_23731BA04(v42, &qword_268917770);
}

uint64_t sub_23731CBAC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v76 = a2;
  uint64_t v77 = a3;
  uint64_t v82 = a1;
  uint64_t v80 = a4;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689176E0) - 8;
  MEMORY[0x270FA5388](v4);
  uint64_t v75 = (char *)&v58 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_237322890();
  uint64_t v78 = *(void *)(v6 - 8);
  uint64_t v79 = v6;
  MEMORY[0x270FA5388](v6);
  uint64_t v74 = (char *)&v58 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v71 = sub_237322A60();
  uint64_t v70 = *(void *)(v71 - 8);
  MEMORY[0x270FA5388](v71);
  uint64_t v69 = (char *)&v58 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_268917830);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v65 = (char *)&v58 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_268917808);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v13 = (char *)&v58 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_237322780();
  uint64_t v15 = *(void *)(v14 - 8);
  MEMORY[0x270FA5388](v14);
  uint64_t v17 = (char *)&v58 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_268917838);
  MEMORY[0x270FA5388](v18 - 8);
  uint64_t v63 = sub_237322900();
  uint64_t v64 = *(void *)(v63 - 8);
  MEMORY[0x270FA5388](v63);
  uint64_t v60 = (char *)&v58 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v66 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689177A0);
  uint64_t v67 = *(void *)(v66 - 8);
  MEMORY[0x270FA5388](v66);
  uint64_t v61 = (char *)&v58 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v81 = __swift_instantiateConcreteTypeFromMangledName(&qword_268917798);
  uint64_t v68 = *(void *)(v81 - 8);
  MEMORY[0x270FA5388](v81);
  uint64_t v62 = (char *)&v58 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v72 = __swift_instantiateConcreteTypeFromMangledName(&qword_268917790);
  uint64_t v73 = *(void *)(v72 - 8);
  MEMORY[0x270FA5388](v72);
  v83 = (char *)&v58 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_237322A50();
  (*(void (**)(char *, void, uint64_t))(v15 + 104))(v17, *MEMORY[0x263F078A8], v14);
  uint64_t v23 = sub_237322790();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56))(v13, 1, 1, v23);
  uint64_t v24 = v82;
  sub_237322830();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_23731BA04((uint64_t)v13, &qword_268917808);
  (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
  sub_237322A50();
  uint64_t v25 = (int *)v4;
  uint64_t v59 = *(int *)(v4 + 56);
  uint64_t v26 = v24;
  uint64_t v87 = *(void *)(v24 + v59);
  sub_237322840();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v58 = sub_237322710();
  uint64_t v27 = v60;
  sub_2373228F0();
  uint64_t v28 = v70;
  uint64_t v29 = v69;
  uint64_t v30 = v71;
  (*(void (**)(char *, void, uint64_t))(v70 + 104))(v69, *MEMORY[0x263F19860], v71);
  uint64_t v31 = MEMORY[0x263EFCD08];
  char v32 = v61;
  uint64_t v33 = v63;
  sub_2373227B0();
  (*(void (**)(char *, uint64_t))(v28 + 8))(v29, v30);
  (*(void (**)(char *, uint64_t))(v64 + 8))(v27, v33);
  v34 = (uint64_t *)(v26 + v25[22]);
  uint64_t v35 = v34[1];
  uint64_t v87 = *v34;
  uint64_t v88 = v35;
  uint64_t v91 = v33;
  uint64_t v92 = v31;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  unint64_t v37 = sub_23731E274();
  uint64_t v38 = v62;
  uint64_t v39 = v66;
  uint64_t v40 = MEMORY[0x263F8D310];
  sub_2373227D0();
  (*(void (**)(char *, uint64_t))(v67 + 8))(v32, v39);
  uint64_t v41 = (uint64_t *)(v26 + v25[18]);
  uint64_t v42 = v41[1];
  uint64_t v91 = *v41;
  uint64_t v92 = v42;
  uint64_t v87 = v39;
  uint64_t v88 = v40;
  uint64_t v89 = OpaqueTypeConformance2;
  unint64_t v90 = v37;
  uint64_t v43 = swift_getOpaqueTypeConformance2();
  uint64_t v44 = v81;
  sub_2373227C0();
  (*(void (**)(char *, uint64_t))(v68 + 8))(v38, v44);
  uint64_t v45 = v74;
  sub_237322880();
  uint64_t v46 = v25[14];
  uint64_t v47 = v25[18];
  v48 = v25;
  uint64_t v49 = (uint64_t)v75;
  uint64_t v50 = &v75[v47];
  uint64_t v51 = &v75[v48[22]];
  uint64_t v52 = v82;
  (*(void (**)(char *, uint64_t))(*(void *)(v58 - 8) + 16))(v75, v82);
  *(void *)(v49 + v46) = *(void *)(v52 + v59);
  uint64_t v53 = v41[1];
  *(void *)uint64_t v50 = *v41;
  *((void *)v50 + 1) = v53;
  uint64_t v54 = v34[1];
  *(void *)uint64_t v51 = *v34;
  *((void *)v51 + 1) = v54;
  uint64_t v84 = v49;
  uint64_t v85 = v76;
  uint64_t v86 = v77;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_237322CA0();
  uint64_t v87 = v81;
  uint64_t v88 = MEMORY[0x263F8D310];
  uint64_t v89 = v43;
  unint64_t v90 = v37;
  swift_getOpaqueTypeConformance2();
  uint64_t v55 = v72;
  v56 = v83;
  sub_2373227A0();
  (*(void (**)(char *, uint64_t))(v78 + 8))(v45, v79);
  (*(void (**)(char *, uint64_t))(v73 + 8))(v56, v55);
  return sub_23731BA04(v49, &qword_2689176E0);
}

uint64_t sub_23731D5DC@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v42 = a2;
  uint64_t v3 = sub_237322750();
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v40 = (char *)&v40 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_268917840);
  MEMORY[0x270FA5388](v41);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689176E0);
  uint64_t v6 = (int *)MEMORY[0x270FA5388](v5 - 8);
  uint64_t v8 = (char *)&v40 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = v6[14];
  uint64_t v10 = v6[18];
  uint64_t v11 = &v8[v10];
  uint64_t v12 = v6[22];
  uint64_t v13 = &v8[v12];
  uint64_t v14 = (void *)(a1 + v10);
  uint64_t v15 = (void *)(a1 + v12);
  uint64_t v16 = sub_237322710();
  uint64_t v17 = *(void *)(v16 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v17 + 16))(v8, a1, v16);
  uint64_t v18 = *(void *)(a1 + v9);
  *(void *)&v8[v9] = v18;
  uint64_t v19 = v14[1];
  *(void *)uint64_t v11 = *v14;
  *((void *)v11 + 1) = v19;
  uint64_t v20 = v15[1];
  *(void *)uint64_t v13 = *v15;
  *((void *)v13 + 1) = v20;
  uint64_t v43 = v18;
  sub_237322730();
  sub_23731E9D4();
  sub_237322650();
  sub_23731ED3C(&qword_268917850, &qword_268917840);
  uint64_t v21 = sub_237322B10();
  uint64_t v23 = v22;
  char v25 = v24 & 1;
  (*(void (**)(char *, uint64_t))(v17 + 8))(v8, v16);
  id v26 = objc_msgSend(self, sel_tertiaryLabelColor);
  MEMORY[0x237E1B0F0](v26);
  uint64_t v27 = sub_237322AF0();
  uint64_t v29 = v28;
  LOBYTE(v17) = v30;
  swift_release();
  LOBYTE(a1) = v17 & 1;
  sub_23731EA28(v21, v23, v25);
  swift_bridgeObjectRelease();
  sub_237322AD0();
  uint64_t v31 = sub_237322B00();
  uint64_t v33 = v32;
  char v35 = v34;
  uint64_t v37 = v36;
  swift_release();
  sub_23731EA28(v27, v29, a1);
  uint64_t result = swift_bridgeObjectRelease();
  uint64_t v39 = v42;
  *uint64_t v42 = v31;
  v39[1] = v33;
  *((unsigned char *)v39 + 16) = v35 & 1;
  v39[3] = v37;
  return result;
}

uint64_t sub_23731D8FC@<X0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  v21[1] = a3;
  uint64_t v5 = sub_237322860();
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v6 = sub_2373227F0();
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268917808);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_237322780();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_237322810();
  MEMORY[0x270FA5388](v14 - 8);
  (*(void (**)(char *, void, uint64_t))(v11 + 104))(v13, *MEMORY[0x263F078A8], v10);
  uint64_t v15 = sub_237322790();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v9, 1, 1, v15);
  sub_237322800();
  sub_23731BA04((uint64_t)v9, &qword_268917808);
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = a1;
  *(void *)(v16 + 24) = a2;
  id v17 = a2;
  sub_2373227E0();
  sub_237322850();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268917810);
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268917818);
  uint64_t v19 = sub_23731ED3C(&qword_268917820, &qword_268917818);
  v21[2] = v18;
  v21[3] = v19;
  swift_getOpaqueTypeConformance2();
  return sub_237322920();
}

uint64_t sub_23731DC54()
{
  uint64_t v0 = sub_2373228B0();
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v1 = sub_2373228D0();
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268917818);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7[1] = sub_23731E77C();
  sub_2373228C0();
  sub_2373228A0();
  sub_23731E974();
  sub_237322820();
  sub_237322AD0();
  sub_237322AB0();
  sub_237322AC0();
  swift_release();
  sub_23731ED3C(&qword_268917820, &qword_268917818);
  sub_237322910();
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_23731DE98@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_237322C90();
  uint64_t v6 = v5;
  uint64_t v7 = a2 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2689177C8) + 36);
  sub_23731DF54(v7);
  uint64_t v8 = (uint64_t *)(v7 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2689177E8) + 36));
  *uint64_t v8 = v4;
  v8[1] = v6;
  uint64_t v9 = sub_237322870();
  uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 16);
  return v10(a2, a1, v9);
}

uint64_t sub_23731DF54@<X0>(uint64_t a1@<X8>)
{
  uint64_t v22 = a1;
  uint64_t v1 = sub_237322A30();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)&v21 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_237322C60();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689177F8);
  uint64_t v10 = v9 - 8;
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_237322C50();
  id v13 = objc_msgSend(self, sel_separatorColor);
  uint64_t v14 = MEMORY[0x237E1B0F0](v13);
  uint64_t KeyPath = swift_getKeyPath();
  (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v12, v8, v5);
  uint64_t v16 = (uint64_t *)&v12[*(int *)(v10 + 44)];
  *uint64_t v16 = KeyPath;
  v16[1] = v14;
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  sub_237322A20();
  sub_2373229D0();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  sub_237322CA0();
  sub_237322990();
  uint64_t v17 = v22;
  sub_23731E710((uint64_t)v12, v22, &qword_2689177F8);
  uint64_t v18 = (_OWORD *)(v17 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268917800) + 36));
  long long v19 = v24;
  *uint64_t v18 = v23;
  v18[1] = v19;
  v18[2] = v25;
  return sub_23731BA04((uint64_t)v12, &qword_2689177F8);
}

uint64_t sub_23731E208()
{
  return sub_237322BC0();
}

uint64_t sub_23731E224@<X0>(uint64_t a1@<X8>)
{
  return sub_23731C34C(*(void *)v1, *(void **)(v1 + 8), a1);
}

uint64_t sub_23731E234()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_23731E26C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_23731CBAC(a1, *(void *)(v2 + 16), *(void *)(v2 + 24), a2);
}

unint64_t sub_23731E274()
{
  unint64_t result = qword_2689177A8;
  if (!qword_2689177A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2689177A8);
  }
  return result;
}

uint64_t sub_23731E2C8@<X0>(uint64_t a1@<X8>)
{
  return sub_23731D8FC(*(void *)(v1 + 16), *(void **)(v1 + 24), a1);
}

unint64_t sub_23731E2D0()
{
  unint64_t result = qword_2689177D0;
  if (!qword_2689177D0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2689177C8);
    sub_23731E3A0(&qword_2689177D8, MEMORY[0x263EFCC70]);
    sub_23731ED3C(&qword_2689177E0, &qword_2689177E8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2689177D0);
  }
  return result;
}

uint64_t sub_23731E3A0(unint64_t *a1, void (*a2)(uint64_t))
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

void sub_23731E3E8(uint64_t *a1@<X8>)
{
  uint64_t v3 = *v1;
  uint64_t v4 = (void *)sub_2373226F0();
  id v5 = objc_msgSend(v3, sel_stringFromDate_, v4);

  uint64_t v6 = sub_237322CF0();
  uint64_t v8 = v7;

  *a1 = v6;
  a1[1] = v8;
}

void sub_23731E460()
{
}

void sub_23731E4C4()
{
}

uint64_t sub_23731E528()
{
  uint64_t v1 = *v0;
  sub_237322DA0();
  id v2 = v1;
  sub_237322D60();

  return sub_237322DC0();
}

void sub_23731E578()
{
  id v1 = *v0;
  sub_237322D60();
}

uint64_t sub_23731E5D0()
{
  id v1 = *v0;
  sub_237322DA0();
  id v2 = v1;
  sub_237322D60();

  return sub_237322DC0();
}

uint64_t sub_23731E61C()
{
  return sub_237322D50() & 1;
}

uint64_t sub_23731E660@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_2373229E0();
  *a1 = result;
  return result;
}

uint64_t sub_23731E68C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_2373229E0();
  *a1 = result;
  return result;
}

uint64_t sub_23731E6B8()
{
  return sub_2373229F0();
}

uint64_t sub_23731E6E4()
{
  return sub_2373229F0();
}

uint64_t sub_23731E710(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_23731E774()
{
  return sub_23731DC54();
}

id sub_23731E77C()
{
  uint64_t v0 = sub_237322790();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v13 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_237322750();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08790]), sel_init);
  sub_237322730();
  uint64_t v9 = (void *)sub_237322720();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  objc_msgSend(v8, sel_setLocale_, v9);

  sub_237322770();
  uint64_t v10 = (void *)sub_237322760();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  objc_msgSend(v8, sel_setCalendar_, v10);

  uint64_t v11 = (void *)sub_237322CE0();
  objc_msgSend(v8, sel_setLocalizedDateFormatFromTemplate_, v11);

  return v8;
}

unint64_t sub_23731E974()
{
  unint64_t result = qword_268917828;
  if (!qword_268917828)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268917828);
  }
  return result;
}

uint64_t sub_23731E9C8@<X0>(uint64_t *a1@<X8>)
{
  return sub_23731D5DC(*(void *)(v1 + 16), a1);
}

unint64_t sub_23731E9D4()
{
  unint64_t result = qword_268917848;
  if (!qword_268917848)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268917848);
  }
  return result;
}

uint64_t sub_23731EA28(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

ValueMetadata *type metadata accessor for DateFormatterFormatStyle()
{
  return &type metadata for DateFormatterFormatStyle;
}

unint64_t sub_23731EA4C()
{
  unint64_t result = qword_268917858;
  if (!qword_268917858)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2689177F0);
    sub_23731EAC8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268917858);
  }
  return result;
}

unint64_t sub_23731EAC8()
{
  unint64_t result = qword_268917860;
  if (!qword_268917860)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268917770);
    sub_23731EB68();
    sub_23731ED3C(&qword_268917880, &qword_268917888);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268917860);
  }
  return result;
}

unint64_t sub_23731EB68()
{
  unint64_t result = qword_268917868;
  if (!qword_268917868)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268917768);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268917758);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2689177C8);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268917750);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2689177B8);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268917748);
    sub_23731ED3C(&qword_2689177B0, &qword_268917748);
    swift_getOpaqueTypeConformance2();
    sub_23731ED3C(&qword_2689177C0, &qword_2689177B8);
    swift_getOpaqueTypeConformance2();
    sub_23731E2D0();
    swift_getOpaqueTypeConformance2();
    sub_23731ED3C(&qword_268917870, &qword_268917878);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268917868);
  }
  return result;
}

uint64_t sub_23731ED3C(unint64_t *a1, uint64_t *a2)
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

unint64_t sub_23731ED84()
{
  unint64_t result = qword_268917890;
  if (!qword_268917890)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268917890);
  }
  return result;
}

unint64_t sub_23731EDDC()
{
  unint64_t result = qword_268917898;
  if (!qword_268917898)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268917898);
  }
  return result;
}

unint64_t sub_23731EE34()
{
  unint64_t result = qword_2689178A0;
  if (!qword_2689178A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2689178A0);
  }
  return result;
}

unint64_t sub_23731EE8C()
{
  unint64_t result = qword_2689178A8;
  if (!qword_2689178A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2689178A8);
  }
  return result;
}

unint64_t sub_23731EEE0()
{
  unint64_t result = qword_2689178B0;
  if (!qword_2689178B0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2689178B0);
  }
  return result;
}

void *initializeBufferWithCopyOfBuffer for SHSHapticsOptionsView(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  return a1;
}

void *assignWithCopy for SHSHapticsOptionsView(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  return a1;
}

void *assignWithTake for SHSHapticsOptionsView(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_release();
  return a1;
}

ValueMetadata *type metadata accessor for SHSHapticsOptionsView()
{
  return &type metadata for SHSHapticsOptionsView;
}

uint64_t sub_23731EFE0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_23731EFFC()
{
  uint64_t v0 = sub_237322750();
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v1 = sub_237322CD0();
  MEMORY[0x270FA5388](v1 - 8);
  swift_retain();
  sub_237322CC0();
  if (qword_2689176D0 != -1) {
    swift_once();
  }
  id v2 = (id)qword_2689179F8;
  sub_237322740();
  sub_237322D00();
  swift_release();
  sub_23731E274();
  sub_237322B30();
  swift_retain();
  sub_23732192C();
  swift_release();
  sub_237322B30();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2689178D8);
  sub_23731F5BC();
  return sub_237322C80();
}

uint64_t sub_23731F24C(uint64_t a1, uint64_t a2)
{
  swift_getKeyPath();
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = a1;
  *(void *)(v4 + 24) = a2;
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2689178F0);
  sub_23731ED3C(&qword_2689178F8, &qword_2689178F0);
  sub_23731F630();
  return sub_237322C70();
}

uint64_t sub_23731F350@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = *a1;
  type metadata accessor for SHSHapticsOptionsViewModel();
  sub_2373204FC((unint64_t *)&qword_268917900, (void (*)(uint64_t))type metadata accessor for SHSHapticsOptionsViewModel);
  swift_retain();
  uint64_t result = sub_2373229A0();
  *a2 = result;
  a2[1] = v5;
  a2[2] = v3;
  return result;
}

uint64_t sub_23731F3E8()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689178B8);
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = &v7[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = v0[1];
  uint64_t v8 = *v0;
  uint64_t v9 = v5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2689178C0);
  sub_23731F53C();
  sub_237322AE0();
  sub_23731ED3C(&qword_2689178E8, &qword_2689178B8);
  sub_237322B70();
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v2 + 8))(v4, v1);
}

uint64_t sub_23731F534()
{
  return sub_23731EFFC();
}

unint64_t sub_23731F53C()
{
  unint64_t result = qword_2689178C8;
  if (!qword_2689178C8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2689178C0);
    sub_23731F5BC();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2689178C8);
  }
  return result;
}

unint64_t sub_23731F5BC()
{
  unint64_t result = qword_2689178D0;
  if (!qword_2689178D0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2689178D8);
    sub_23731F630();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2689178D0);
  }
  return result;
}

unint64_t sub_23731F630()
{
  unint64_t result = qword_2689178E0;
  if (!qword_2689178E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2689178E0);
  }
  return result;
}

uint64_t sub_23731F684()
{
  return sub_23731F24C(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_23731F68C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a2 + 16) == a3)
  {
    swift_retain();
  }
  else
  {
    type metadata accessor for SHSHapticsOptionsViewModel();
    sub_2373204FC((unint64_t *)&qword_268917900, (void (*)(uint64_t))type metadata accessor for SHSHapticsOptionsViewModel);
    swift_retain();
    sub_237322930();
    sub_237322940();
    swift_release();
    uint64_t v5 = (void *)MEMORY[0x237E1BAD0](a2 + 24);
    if (v5)
    {
      objc_msgSend(v5, sel_hapticsOptionsDidChange_, a3);
      swift_unknownObjectRelease();
    }
  }
  *(void *)(a2 + 16) = a3;
  return swift_release();
}

uint64_t sub_23731F77C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_268917928);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = &v13[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v17 = a1;
  uint64_t v18 = a2;
  uint64_t v19 = a3;
  uint64_t v14 = a1;
  uint64_t v15 = a2;
  uint64_t v16 = a3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268917950);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268917958);
  sub_23731ED3C(&qword_268917960, &qword_268917950);
  sub_237320558();
  sub_237322C30();
  (*(void (**)(uint64_t, unsigned char *, uint64_t))(v9 + 16))(a4, v11, v8);
  *(unsigned char *)(a4 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268917910) + 36)) = 0;
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v9 + 8))(v11, v8);
}

__n128 sub_23731F938@<Q0>(uint64_t a1@<X2>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_237322A40();
  sub_23731F9C4(a1, (uint64_t)&v10);
  char v5 = v11;
  uint64_t v6 = v12;
  uint64_t v7 = v13;
  char v8 = v14;
  __n128 result = v10;
  *(void *)a2 = v4;
  *(void *)(a2 + 8) = 0;
  *(unsigned char *)(a2 + 16) = 1;
  *(__n128 *)(a2 + 24) = result;
  *(unsigned char *)(a2 + 40) = v5;
  *(void *)(a2 + 48) = v6;
  *(void *)(a2 + 56) = v7;
  *(unsigned char *)(a2 + 64) = v8;
  return result;
}

uint64_t sub_23731F9C4@<X0>(uint64_t a1@<X2>, uint64_t a2@<X8>)
{
  switch(a1)
  {
    case 0:
    case 1:
    case 2:
    case 3:
      sub_237322A50();
      if (qword_2689176D0 != -1) {
        swift_once();
      }
      id v3 = (id)qword_2689179F8;
      uint64_t v4 = sub_237322B20();
      uint64_t v6 = v5;
      *(void *)a2 = v4;
      *(void *)(a2 + 8) = v5;
      char v8 = v7 & 1;
      *(unsigned char *)(a2 + 16) = v7 & 1;
      *(void *)(a2 + 24) = v9;
      *(void *)(a2 + 32) = 0;
      *(unsigned char *)(a2 + 40) = 1;
      sub_2373208D8(v4, v5, v7 & 1);
      swift_bridgeObjectRetain();
      sub_23731EA28(v4, v6, v8);
      return swift_bridgeObjectRelease();
    default:
      sub_237322D90();
      __break(1u);
      JUMPOUT(0x23731FBA0);
  }
}

uint64_t sub_23731FBB0@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689179A0);
  MEMORY[0x270FA5388](v6);
  char v8 = (uint64_t *)((char *)&v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689179A8);
  uint64_t v32 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  char v11 = (char *)&v28 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_268917978);
  uint64_t v13 = MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)&v28 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  uint64_t v17 = (char *)&v28 - v16;
  if (*(void *)(a1 + 16) == a2)
  {
    uint64_t v18 = sub_237322C10();
    uint64_t v19 = sub_237322AD0();
    uint64_t v31 = a3;
    uint64_t v20 = v19;
    uint64_t KeyPath = swift_getKeyPath();
    uint64_t v30 = v6;
    uint64_t v33 = v18;
    uint64_t v34 = KeyPath;
    uint64_t v35 = v20;
    sub_237322AA0();
    uint64_t v29 = v12;
    __swift_instantiateConcreteTypeFromMangledName(&qword_268917980);
    uint64_t v28 = v9;
    sub_2373206A8();
    sub_237322BA0();
    swift_release();
    swift_release();
    swift_release();
    uint64_t v22 = sub_237322BE0();
    uint64_t v23 = swift_getKeyPath();
    uint64_t v24 = v32;
    uint64_t v25 = v28;
    (*(void (**)(char *, char *, uint64_t))(v32 + 16))(v15, v11, v28);
    id v26 = (uint64_t *)&v15[*(int *)(v29 + 36)];
    *id v26 = v23;
    v26[1] = v22;
    (*(void (**)(char *, uint64_t))(v24 + 8))(v11, v25);
    sub_2373207A8((uint64_t)v15, (uint64_t)v17);
    sub_237320810((uint64_t)v17, (uint64_t)v8);
    swift_storeEnumTagMultiPayload();
    sub_2373205D4();
    sub_237322A80();
    return sub_237320878((uint64_t)v17);
  }
  else
  {
    *char v8 = sub_237322C20();
    swift_storeEnumTagMultiPayload();
    sub_2373205D4();
    return sub_237322A80();
  }
}

uint64_t sub_23731FEF8@<X0>(uint64_t a1@<X8>)
{
  v15[1] = a1;
  uint64_t v2 = sub_2373229C0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268917908);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *v1;
  uint64_t v11 = v1[1];
  uint64_t v12 = v1[2];
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = v10;
  v13[3] = v11;
  v13[4] = v12;
  v15[4] = v10;
  v15[5] = v11;
  v15[6] = v12;
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268917910);
  sub_237320438();
  sub_237322C40();
  sub_2373229B0();
  sub_23731ED3C(&qword_268917940, &qword_268917908);
  sub_2373204FC(&qword_268917948, MEMORY[0x263F18FD0]);
  sub_237322BB0();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

void *sub_237320178@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

uint64_t sub_237320184()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_2373201BC@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_23731F350(a1, a2);
}

uint64_t destroy for HapticsOptionRow()
{
  return swift_release();
}

void *_s24SoundsAndHapticsSettings16HapticsOptionRowVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_retain();
  return a1;
}

void *assignWithCopy for HapticsOptionRow(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  a1[2] = a2[2];
  return a1;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

void *assignWithTake for HapticsOptionRow(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_release();
  a1[2] = a2[2];
  return a1;
}

uint64_t getEnumTagSinglePayload for HapticsOptionRow(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 24)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for HapticsOptionRow(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 24) = 1;
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
    *(unsigned char *)(result + 24) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for HapticsOptionRow()
{
  return &type metadata for HapticsOptionRow;
}

uint64_t sub_23732034C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2373203CC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2373203E8()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_237320420()
{
  return sub_23731F68C(v0[2], v0[3], v0[4]);
}

uint64_t sub_23732042C@<X0>(uint64_t a1@<X8>)
{
  return sub_23731F77C(v1[2], v1[3], v1[4], a1);
}

unint64_t sub_237320438()
{
  unint64_t result = qword_268917918;
  if (!qword_268917918)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268917910);
    sub_23731ED3C(&qword_268917920, &qword_268917928);
    sub_23731ED3C(&qword_268917930, &qword_268917938);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268917918);
  }
  return result;
}

uint64_t sub_2373204FC(unint64_t *a1, void (*a2)(uint64_t))
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

double sub_237320544@<D0>(uint64_t a1@<X8>)
{
  *(void *)&double result = sub_23731F938(*(void *)(v1 + 32), a1).n128_u64[0];
  return result;
}

uint64_t sub_237320550@<X0>(uint64_t a1@<X8>)
{
  return sub_23731FBB0(*(void *)(v1 + 24), *(void *)(v1 + 32), a1);
}

unint64_t sub_237320558()
{
  unint64_t result = qword_268917968;
  if (!qword_268917968)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268917958);
    sub_2373205D4();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268917968);
  }
  return result;
}

unint64_t sub_2373205D4()
{
  unint64_t result = qword_268917970;
  if (!qword_268917970)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268917978);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268917980);
    sub_2373206A8();
    swift_getOpaqueTypeConformance2();
    sub_23731ED3C(&qword_268917870, &qword_268917878);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268917970);
  }
  return result;
}

unint64_t sub_2373206A8()
{
  unint64_t result = qword_268917988;
  if (!qword_268917988)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268917980);
    sub_23731ED3C(&qword_268917990, &qword_268917998);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268917988);
  }
  return result;
}

uint64_t sub_237320748@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_237322A00();
  *a1 = result;
  return result;
}

uint64_t sub_237320774()
{
  return sub_237322A10();
}

uint64_t sub_2373207A8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268917978);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_237320810(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268917978);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_237320878(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268917978);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2373208D8(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_retain();
  }
  else {
    return swift_bridgeObjectRetain();
  }
}

uint64_t sub_2373208E8()
{
  return swift_getOpaqueTypeConformance2();
}

char *static SHSViewControllerFactory.createHapticsOptionsViewController(_:delegate:)(uint64_t a1)
{
  id v2 = objc_allocWithZone((Class)type metadata accessor for SHSHapticsOptionsViewController());
  swift_unknownObjectRetain();
  uint64_t v3 = (char *)objc_msgSend(v2, sel_init);
  *(void *)&v3[OBJC_IVAR____TtC24SoundsAndHapticsSettings31SHSHapticsOptionsViewController_selectedOption] = a1;
  swift_unknownObjectWeakAssign();
  swift_unknownObjectRelease();
  return v3;
}

uint64_t type metadata accessor for SHSHapticsOptionsViewController()
{
  return self;
}

id SHSViewControllerFactory.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

id SHSViewControllerFactory.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SHSViewControllerFactory();
  return objc_msgSendSuper2(&v2, sel_init);
}

uint64_t type metadata accessor for SHSViewControllerFactory()
{
  return self;
}

id SHSViewControllerFactory.__deallocating_deinit()
{
  return sub_237321660(type metadata accessor for SHSViewControllerFactory);
}

uint64_t sub_237320BDC()
{
  uint64_t v1 = OBJC_IVAR____TtC24SoundsAndHapticsSettings31SHSHapticsOptionsViewController____lazy_storage___hapticsOptionsViewModel;
  if (*(void *)(v0
                 + OBJC_IVAR____TtC24SoundsAndHapticsSettings31SHSHapticsOptionsViewController____lazy_storage___hapticsOptionsViewModel))
  {
    uint64_t v2 = *(void *)(v0
                   + OBJC_IVAR____TtC24SoundsAndHapticsSettings31SHSHapticsOptionsViewController____lazy_storage___hapticsOptionsViewModel);
  }
  else
  {
    uint64_t v3 = *(void *)(v0 + OBJC_IVAR____TtC24SoundsAndHapticsSettings31SHSHapticsOptionsViewController_selectedOption);
    MEMORY[0x237E1BAD0](v0 + OBJC_IVAR____TtC24SoundsAndHapticsSettings31SHSHapticsOptionsViewController_delegate);
    type metadata accessor for SHSHapticsOptionsViewModel();
    uint64_t v2 = swift_allocObject();
    *(void *)(v2 + 16) = 0;
    swift_unknownObjectWeakInit();
    *(void *)(v2 + 16) = v3;
    swift_unknownObjectWeakAssign();
    swift_unknownObjectRelease();
    *(void *)(v0 + v1) = v2;
    swift_retain();
    swift_release();
  }
  swift_retain();
  return v2;
}

void sub_237320CA0()
{
  uint64_t v1 = v0;
  v17.receiver = v0;
  v17.super_class = (Class)type metadata accessor for SHSHapticsOptionsViewController();
  objc_msgSendSuper2(&v17, sel_viewDidLoad);
  sub_237320BDC();
  type metadata accessor for SHSHapticsOptionsViewModel();
  sub_2373216E4();
  uint64_t v15 = sub_2373229A0();
  uint64_t v16 = v2;
  id v3 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_2689179D8));
  uint64_t v4 = (void *)sub_237322A70();
  id v5 = objc_msgSend(v4, sel_view, v15, v16);
  if (!v5)
  {
    uint64_t v6 = v4;
    goto LABEL_6;
  }
  uint64_t v6 = v5;
  id v7 = objc_msgSend(v1, sel_view);
  if (v7)
  {
    uint64_t v8 = v7;
    objc_msgSend(v7, sel_addSubview_, v6);

    id v9 = objc_msgSend(v1, sel_view);
    if (v9)
    {
      uint64_t v10 = v9;
      objc_msgSend(v9, sel_bounds);
      double v12 = v11;
      double v14 = v13;

      objc_msgSend(v6, sel_setFrame_, 0.0, 0.0, v12, v14);
      objc_msgSend(v6, sel_setAutoresizingMask_, 18);
      objc_msgSend(v1, sel_addChildViewController_, v4);
      objc_msgSend(v4, sel_didMoveToParentViewController_, v1);

LABEL_6:
      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

id sub_237320E80(char a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689179C8);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v40 = (char *)&v37 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v47 = sub_237322CB0();
  uint64_t v45 = *(void *)(v47 - 8);
  MEMORY[0x270FA5388](v47);
  uint64_t v44 = (char **)((char *)&v37 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v6 = sub_237322660();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  id v9 = (objc_class **)((char *)&v37 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v10 = sub_237322750();
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v11 = sub_237322CD0();
  uint64_t v12 = MEMORY[0x270FA5388](v11 - 8);
  uint64_t v39 = (char *)&v37 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v14 = sub_237322670();
  uint64_t v42 = *(void *)(v14 - 8);
  uint64_t v43 = v14;
  uint64_t v15 = MEMORY[0x270FA5388](v14);
  uint64_t v46 = (char *)&v37 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  uint64_t v18 = (char *)&v37 - v17;
  uint64_t v19 = (objc_class *)type metadata accessor for SHSHapticsOptionsViewController();
  uint64_t v38 = v1;
  v48.receiver = v1;
  v48.super_class = v19;
  objc_msgSendSuper2(&v48, sel_viewDidAppear_, a1 & 1);
  sub_237322CC0();
  sub_237322740();
  *id v9 = v19;
  uint64_t v20 = *MEMORY[0x263F06D30];
  uint64_t v21 = *(void (**)(objc_class **, uint64_t, uint64_t))(v7 + 104);
  uint64_t v41 = v6;
  v21(v9, v20, v6);
  uint64_t v37 = v18;
  sub_237322680();
  id result = (id)MobileGestalt_get_current_device();
  if (result)
  {
    uint64_t v23 = result;
    MobileGestalt_get_deviceSupportsClosedLoopHaptics();

    sub_237322CC0();
    uint64_t v24 = v40;
    uint64_t v25 = v46;
    sub_237322740();
    *id v9 = v19;
    v21(v9, v20, v41);
    sub_237322680();
    uint64_t v27 = v44;
    uint64_t v26 = v45;
    void *v44 = 0xD00000000000001CLL;
    v27[1] = 0x8000000237327900;
    (*(void (**)(void *, void, uint64_t))(v26 + 104))(v27, *MEMORY[0x263F67E48], v47);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2689179D0);
    uint64_t v28 = v42;
    uint64_t v29 = v25;
    unint64_t v30 = (*(unsigned __int8 *)(v42 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v42 + 80);
    uint64_t v31 = swift_allocObject();
    *(_OWORD *)(v31 + 16) = xmmword_237324D90;
    uint64_t v32 = v43;
    (*(void (**)(unint64_t, char *, uint64_t))(v28 + 16))(v31 + v30, v29, v43);
    sub_237322690();
    uint64_t v33 = sub_2373226A0();
    uint64_t v34 = *(void *)(v33 - 8);
    id result = (id)(*(uint64_t (**)(char *, uint64_t, uint64_t))(v34 + 48))(v24, 1, v33);
    if (result != 1)
    {
      uint64_t v35 = v37;
      sub_237322D40();
      swift_bridgeObjectRelease();
      (*(void (**)(void *, uint64_t))(v26 + 8))(v27, v47);
      uint64_t v36 = *(void (**)(char *, uint64_t))(v28 + 8);
      v36(v46, v32);
      v36(v35, v32);
      return (id)(*(uint64_t (**)(char *, uint64_t))(v34 + 8))(v24, v33);
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

id sub_2373214BC(uint64_t a1, uint64_t a2, void *a3)
{
  *(void *)&v3[OBJC_IVAR____TtC24SoundsAndHapticsSettings31SHSHapticsOptionsViewController_selectedOption] = 0;
  swift_unknownObjectWeakInit();
  *(void *)&v3[OBJC_IVAR____TtC24SoundsAndHapticsSettings31SHSHapticsOptionsViewController____lazy_storage___hapticsOptionsViewModel] = 0;
  if (a2)
  {
    uint64_t v6 = (void *)sub_237322CE0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v6 = 0;
  }
  v9.receiver = v3;
  v9.super_class = (Class)type metadata accessor for SHSHapticsOptionsViewController();
  id v7 = objc_msgSendSuper2(&v9, sel_initWithNibName_bundle_, v6, a3);

  return v7;
}

id sub_237321648()
{
  return sub_237321660(type metadata accessor for SHSHapticsOptionsViewController);
}

id sub_237321660(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

unint64_t sub_2373216E4()
{
  unint64_t result = qword_268917900;
  if (!qword_268917900)
  {
    type metadata accessor for SHSHapticsOptionsViewModel();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268917900);
  }
  return result;
}

uint64_t sub_23732173C(uint64_t a1)
{
  return a1;
}

void *static SHSHapticsOption.allCases.getter()
{
  return &unk_26EA42660;
}

uint64_t SHSHapticsOption.title.getter(uint64_t a1)
{
  switch(a1)
  {
    case 0:
    case 1:
    case 2:
    case 3:
      return sub_237322A50();
    default:
      sub_237322D90();
      __break(1u);
      JUMPOUT(0x23732185CLL);
  }
}

void sub_23732186C()
{
  uint64_t v0 = (void *)sub_237322CE0();
  id v1 = (id)SFRuntimeAbsoluteFilePathForPath();

  sub_237322CF0();
  id v2 = objc_allocWithZone(MEMORY[0x263F086E0]);
  objc_super v3 = (void *)sub_237322CE0();
  swift_bridgeObjectRelease();
  id v4 = objc_msgSend(v2, sel_initWithPath_, v3);

  if (v4) {
    qword_2689179F8 = (uint64_t)v4;
  }
  else {
    __break(1u);
  }
}

uint64_t sub_23732192C()
{
  uint64_t v1 = sub_237322750();
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v2 = sub_237322CD0();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)v12 - v7;
  switch(*(void *)(v0 + 16))
  {
    case 0:
    case 1:
    case 2:
    case 3:
      sub_237322CC0();
      (*(void (**)(char *, char *, uint64_t))(v3 + 16))(v6, v8, v2);
      if (qword_2689176D0 != -1) {
        swift_once();
      }
      id v9 = (id)qword_2689179F8;
      sub_237322740();
      uint64_t v10 = sub_237322D00();
      (*(void (**)(char *, uint64_t))(v3 + 8))(v8, v2);
      return v10;
    default:
      v12[1] = *(void *)(v0 + 16);
      sub_237322D90();
      __break(1u);
      JUMPOUT(0x237321BBCLL);
  }
}

uint64_t sub_237321BCC()
{
  sub_23732173C(v0 + 24);
  return MEMORY[0x270FA0228](v0, 32, 7);
}

uint64_t sub_237321C04@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for SHSHapticsOptionsViewModel();
  uint64_t result = sub_237322930();
  *a1 = result;
  return result;
}

unint64_t SHSHapticsOption.init(rawValue:)(unint64_t a1)
{
  return sub_237321D7C(a1);
}

BOOL sub_237321C60(void *a1, void *a2)
{
  return *a1 == *a2;
}

uint64_t sub_237321C74()
{
  return sub_237322DC0();
}

uint64_t sub_237321CBC()
{
  return sub_237322DB0();
}

uint64_t sub_237321CE8()
{
  return sub_237322DC0();
}

unint64_t sub_237321D2C@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result = sub_237321D7C(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

void sub_237321D60(void *a1@<X8>)
{
  *a1 = *v1;
}

void sub_237321D6C(void *a1@<X8>)
{
  *a1 = &unk_26EA426A0;
}

unint64_t sub_237321D7C(unint64_t result)
{
  if (result > 3) {
    return 0;
  }
  return result;
}

unint64_t sub_237321D90()
{
  unint64_t result = qword_2689179E0;
  if (!qword_2689179E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2689179E0);
  }
  return result;
}

unint64_t sub_237321DE8()
{
  unint64_t result = qword_2689179E8;
  if (!qword_2689179E8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2689178F0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2689179E8);
  }
  return result;
}

uint64_t sub_237321E44()
{
  return MEMORY[0x263F8D6D8];
}

uint64_t type metadata accessor for SHSHapticsOptionsViewModel()
{
  return self;
}

ValueMetadata *type metadata accessor for SHSHapticsOption()
{
  return &type metadata for SHSHapticsOption;
}

uint64_t sub_237321E88()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

void SHSLogForCategory_cold_1()
{
}

uint64_t sub_237322640()
{
  return MEMORY[0x270EEDD40]();
}

uint64_t sub_237322650()
{
  return MEMORY[0x270EEF0A0]();
}

uint64_t sub_237322660()
{
  return MEMORY[0x270EEF870]();
}

uint64_t sub_237322670()
{
  return MEMORY[0x270EEF8C0]();
}

uint64_t sub_237322680()
{
  return MEMORY[0x270EEF8D8]();
}

uint64_t sub_237322690()
{
  return MEMORY[0x270EEFF00]();
}

uint64_t sub_2373226A0()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_2373226B0()
{
  return MEMORY[0x270EF0448]();
}

uint64_t sub_2373226C0()
{
  return MEMORY[0x270EF0580]();
}

uint64_t sub_2373226D0()
{
  return MEMORY[0x270EF0598]();
}

uint64_t sub_2373226E0()
{
  return MEMORY[0x270EF06E0]();
}

uint64_t sub_2373226F0()
{
  return MEMORY[0x270EF0998]();
}

uint64_t sub_237322700()
{
  return MEMORY[0x270EF0C20]();
}

uint64_t sub_237322710()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_237322720()
{
  return MEMORY[0x270EF0EE0]();
}

uint64_t sub_237322730()
{
  return MEMORY[0x270EF0EF8]();
}

uint64_t sub_237322740()
{
  return MEMORY[0x270EF0FA0]();
}

uint64_t sub_237322750()
{
  return MEMORY[0x270EF10A8]();
}

uint64_t sub_237322760()
{
  return MEMORY[0x270EF12C8]();
}

uint64_t sub_237322770()
{
  return MEMORY[0x270EF12E0]();
}

uint64_t sub_237322780()
{
  return MEMORY[0x270EF1428]();
}

uint64_t sub_237322790()
{
  return MEMORY[0x270EF1440]();
}

uint64_t sub_2373227A0()
{
  return MEMORY[0x270EE2B90]();
}

uint64_t sub_2373227B0()
{
  return MEMORY[0x270EE2BA8]();
}

uint64_t sub_2373227C0()
{
  return MEMORY[0x270EE2BD0]();
}

uint64_t sub_2373227D0()
{
  return MEMORY[0x270EE2BE0]();
}

uint64_t sub_2373227E0()
{
  return MEMORY[0x270EE2C98]();
}

uint64_t sub_2373227F0()
{
  return MEMORY[0x270EE2CA0]();
}

uint64_t sub_237322800()
{
  return MEMORY[0x270EE2CB0]();
}

uint64_t sub_237322810()
{
  return MEMORY[0x270EE2CC8]();
}

uint64_t sub_237322820()
{
  return MEMORY[0x270EE2CD0]();
}

uint64_t sub_237322830()
{
  return MEMORY[0x270EE2D08]();
}

uint64_t sub_237322840()
{
  return MEMORY[0x270EE2D20]();
}

uint64_t sub_237322850()
{
  return MEMORY[0x270EE2D88]();
}

uint64_t sub_237322860()
{
  return MEMORY[0x270EE2D90]();
}

uint64_t sub_237322870()
{
  return MEMORY[0x270EE2D98]();
}

uint64_t sub_237322880()
{
  return MEMORY[0x270EE2DB0]();
}

uint64_t sub_237322890()
{
  return MEMORY[0x270EE2DE0]();
}

uint64_t sub_2373228A0()
{
  return MEMORY[0x270EE2E50]();
}

uint64_t sub_2373228B0()
{
  return MEMORY[0x270EE2E58]();
}

uint64_t sub_2373228C0()
{
  return MEMORY[0x270EE2EC8]();
}

uint64_t sub_2373228D0()
{
  return MEMORY[0x270EE2ED0]();
}

uint64_t sub_2373228E0()
{
  return MEMORY[0x270EE2EF8]();
}

uint64_t sub_2373228F0()
{
  return MEMORY[0x270EE2F08]();
}

uint64_t sub_237322900()
{
  return MEMORY[0x270EE2F20]();
}

uint64_t sub_237322910()
{
  return MEMORY[0x270EE2F50]();
}

uint64_t sub_237322920()
{
  return MEMORY[0x270EE2FF8]();
}

uint64_t sub_237322930()
{
  return MEMORY[0x270EE3C20]();
}

uint64_t sub_237322940()
{
  return MEMORY[0x270EE3CE0]();
}

uint64_t sub_237322950()
{
  return MEMORY[0x270EE3DA8]();
}

uint64_t sub_237322960()
{
  return MEMORY[0x270EE3DD8]();
}

uint64_t sub_237322970()
{
  return MEMORY[0x270EE3DE0]();
}

uint64_t sub_237322980()
{
  return MEMORY[0x270EE3DF0]();
}

uint64_t sub_237322990()
{
  return MEMORY[0x270EFF598]();
}

uint64_t sub_2373229A0()
{
  return MEMORY[0x270EFFB80]();
}

uint64_t sub_2373229B0()
{
  return MEMORY[0x270F004D0]();
}

uint64_t sub_2373229C0()
{
  return MEMORY[0x270F004E8]();
}

uint64_t sub_2373229D0()
{
  return MEMORY[0x270F00918]();
}

uint64_t sub_2373229E0()
{
  return MEMORY[0x270F00A20]();
}

uint64_t sub_2373229F0()
{
  return MEMORY[0x270F00A30]();
}

uint64_t sub_237322A00()
{
  return MEMORY[0x270F00D80]();
}

uint64_t sub_237322A10()
{
  return MEMORY[0x270F00D90]();
}

uint64_t sub_237322A20()
{
  return MEMORY[0x270F00ED8]();
}

uint64_t sub_237322A30()
{
  return MEMORY[0x270F00EE0]();
}

uint64_t sub_237322A40()
{
  return MEMORY[0x270F01070]();
}

uint64_t sub_237322A50()
{
  return MEMORY[0x270F01270]();
}

uint64_t sub_237322A60()
{
  return MEMORY[0x270F01358]();
}

uint64_t sub_237322A70()
{
  return MEMORY[0x270F016A0]();
}

uint64_t sub_237322A80()
{
  return MEMORY[0x270F01800]();
}

uint64_t sub_237322A90()
{
  return MEMORY[0x270F02A30]();
}

uint64_t sub_237322AA0()
{
  return MEMORY[0x270F02BC0]();
}

uint64_t sub_237322AB0()
{
  return MEMORY[0x270F02BF8]();
}

uint64_t sub_237322AC0()
{
  return MEMORY[0x270F02C98]();
}

uint64_t sub_237322AD0()
{
  return MEMORY[0x270F02D08]();
}

uint64_t sub_237322AE0()
{
  return MEMORY[0x270F02DC8]();
}

uint64_t sub_237322AF0()
{
  return MEMORY[0x270F03008]();
}

uint64_t sub_237322B00()
{
  return MEMORY[0x270F030A8]();
}

uint64_t sub_237322B10()
{
  return MEMORY[0x270F03220]();
}

uint64_t sub_237322B20()
{
  return MEMORY[0x270F03228]();
}

uint64_t sub_237322B30()
{
  return MEMORY[0x270F03250]();
}

uint64_t sub_237322B40()
{
  return MEMORY[0x270EE3070]();
}

uint64_t sub_237322B50()
{
  return MEMORY[0x270EE3088]();
}

uint64_t sub_237322B60()
{
  return MEMORY[0x270EE30D0]();
}

uint64_t sub_237322B70()
{
  return MEMORY[0x270F5D070]();
}

uint64_t sub_237322B80()
{
  return MEMORY[0x270F032C0]();
}

uint64_t sub_237322B90()
{
  return MEMORY[0x270F032D0]();
}

uint64_t sub_237322BA0()
{
  return MEMORY[0x270F03360]();
}

uint64_t sub_237322BB0()
{
  return MEMORY[0x270F03438]();
}

uint64_t sub_237322BC0()
{
  return MEMORY[0x270F036C0]();
}

uint64_t sub_237322BD0()
{
  return MEMORY[0x270F04388]();
}

uint64_t sub_237322BE0()
{
  return MEMORY[0x270F043F8]();
}

uint64_t sub_237322BF0()
{
  return MEMORY[0x270F04478]();
}

uint64_t sub_237322C00()
{
  return MEMORY[0x270F045A8]();
}

uint64_t sub_237322C10()
{
  return MEMORY[0x270F04650]();
}

uint64_t sub_237322C20()
{
  return MEMORY[0x270F04738]();
}

uint64_t sub_237322C30()
{
  return MEMORY[0x270F04748]();
}

uint64_t sub_237322C40()
{
  return MEMORY[0x270F048B0]();
}

uint64_t sub_237322C50()
{
  return MEMORY[0x270F04C20]();
}

uint64_t sub_237322C60()
{
  return MEMORY[0x270F04C30]();
}

uint64_t sub_237322C70()
{
  return MEMORY[0x270F04C90]();
}

uint64_t sub_237322C80()
{
  return MEMORY[0x270F04D50]();
}

uint64_t sub_237322C90()
{
  return MEMORY[0x270F05068]();
}

uint64_t sub_237322CA0()
{
  return MEMORY[0x270F05078]();
}

uint64_t sub_237322CB0()
{
  return MEMORY[0x270F5D090]();
}

uint64_t sub_237322CC0()
{
  return MEMORY[0x270EF18D0]();
}

uint64_t sub_237322CD0()
{
  return MEMORY[0x270EF1958]();
}

uint64_t sub_237322CE0()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_237322CF0()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_237322D00()
{
  return MEMORY[0x270EF1AF8]();
}

uint64_t sub_237322D10()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_237322D20()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_237322D30()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_237322D40()
{
  return MEMORY[0x270F55420]();
}

uint64_t sub_237322D50()
{
  return MEMORY[0x270FA1180]();
}

uint64_t sub_237322D60()
{
  return MEMORY[0x270FA1190]();
}

uint64_t sub_237322D70()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_237322D80()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_237322D90()
{
  return MEMORY[0x270F9FA68]();
}

uint64_t sub_237322DA0()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_237322DB0()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_237322DC0()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t AnalyticsSendEvent()
{
  return MEMORY[0x270F18A38]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x270F18A48]();
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x270EE4B88]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
}

uint64_t CFPhoneNumberCreate()
{
  return MEMORY[0x270F1B710]();
}

uint64_t CFPhoneNumberCreateString()
{
  return MEMORY[0x270F1B718]();
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x270EE4CA0](key, applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x270EE4CD0](key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return MEMORY[0x270EE4D08](applicationID, userName, hostName);
}

void CFRelease(CFTypeRef cf)
{
}

CMTime *__cdecl CMTimeMake(CMTime *__return_ptr retstr, int64_t value, int32_t timescale)
{
  return (CMTime *)MEMORY[0x270EE7E10](retstr, value, *(void *)&timescale);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x270F95F98]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x270F95FB8]();
}

uint64_t MobileGestalt_get_current_device()
{
  return MEMORY[0x270F960E8]();
}

uint64_t MobileGestalt_get_deviceSupportsClosedLoopHaptics()
{
  return MEMORY[0x270F96110]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x270EF2C28](range.location, range.length);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x270EF2C38](aSelector);
}

uint64_t NSStringFromTLAlertType()
{
  return MEMORY[0x270F7F8D0]();
}

uint64_t PSGetCapabilityBoolAnswer()
{
  return MEMORY[0x270F55208]();
}

uint64_t PSShouldInsetListView()
{
  return MEMORY[0x270F552E8]();
}

uint64_t PSTableViewSideInset()
{
  return MEMORY[0x270F55320]();
}

uint64_t PreferencesTableViewCellLeftPad()
{
  return MEMORY[0x270F55350]();
}

uint64_t PreferencesTableViewCellRightPad()
{
  return MEMORY[0x270F55358]();
}

uint64_t PreferencesTableViewFooterColor()
{
  return MEMORY[0x270F55360]();
}

uint64_t PreferencesTableViewFooterFont()
{
  return MEMORY[0x270F55368]();
}

uint64_t SFRuntimeAbsoluteFilePathForPath()
{
  return MEMORY[0x270F5D1B8]();
}

uint64_t TLAlertTypeFromString()
{
  return MEMORY[0x270F7F8D8]();
}

BOOL UIContentSizeCategoryIsAccessibilityCategory(UIContentSizeCategory category)
{
  return MEMORY[0x270F82CD0](category);
}

NSDictionary *_NSDictionaryOfVariableBindings(NSString *commaSeparatedKeysString, id firstValue, ...)
{
  return (NSDictionary *)MEMORY[0x270EF2C98](commaSeparatedKeysString, firstValue);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x270ED8070]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x270EDA378](ptr);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
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

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
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

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

void objc_terminate(void)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x270FA01C8]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x270FA01D0]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x270FA01D8]();
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

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x270FA02C0]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x270FA03B8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x270FA03F0]();
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

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x270FA0578]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x270FA05D0]();
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