id HKMHPromptedAssessmentsManagerServerInterface()
{
  void *v0;
  id v1;
  uint64_t vars8;

  v0 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_2704B30C8];
  v1 = (id)objc_msgSend(v0, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_remote_getPromptedAssessmentsWithCompletion_, 0, 1);
  return v0;
}

uint64_t HKMHPromptedAssessmentsManagerClientInterface()
{
  return [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_2704B15B8];
}

id _NotificationSettingKeys()
{
  v2[5] = *MEMORY[0x263EF8340];
  v2[0] = @"StateOfMindLoggingReminderNotificationMiddayEnabledKey";
  v2[1] = @"StateOfMindLoggingReminderNotificationEndOfDayEnabledKey";
  v2[2] = @"StateOfMindLoggingReminderNotificationCustomScheduleKey";
  v2[3] = @"PeriodicPromptedAssessmentNotificationEnabledKey";
  v2[4] = @"PeriodicPromptedAssessmentNotificationTimeOfDayOverride";
  v0 = [MEMORY[0x263EFF8C0] arrayWithObjects:v2 count:5];
  return v0;
}

id OUTLINED_FUNCTION_1(id a1)
{
  return a1;
}

void OUTLINED_FUNCTION_2(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_3(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

id HKMHFrameworkBundle()
{
  v0 = (void *)HKMHFrameworkBundle___ClassBundle;
  if (!HKMHFrameworkBundle___ClassBundle)
  {
    uint64_t v1 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v2 = (void *)HKMHFrameworkBundle___ClassBundle;
    HKMHFrameworkBundle___ClassBundle = v1;

    v0 = (void *)HKMHFrameworkBundle___ClassBundle;
  }
  return v0;
}

id HKMHLocalizedString(void *a1)
{
  id v1 = a1;
  v2 = HKMHFrameworkBundle();
  v3 = [v2 localizedStringForKey:v1 value:&stru_2704AB188 table:0];

  return v3;
}

uint64_t HKMHMindfulnessSettingsURL()
{
  return [NSURL URLWithString:@"bridge:root=com.apple.MindSettings"];
}

void sub_255F1A6A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 64), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void sub_255F1A920(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_255F1AA98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_255F1AFE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 48), 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void type metadata accessor for __HKStateOfMindReflectiveInterval(uint64_t a1)
{
}

uint64_t *sub_255F1C7BC(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v17 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (uint64_t *)(v17 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
    v7 = (int *)type metadata accessor for MentalHealthInjector.Configuration();
    uint64_t v8 = v7[6];
    v9 = (char *)v4 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_255F26A10();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
    *(uint64_t *)((char *)v4 + v7[7]) = *(uint64_t *)((char *)a2 + v7[7]);
    *(uint64_t *)((char *)v4 + v7[8]) = *(uint64_t *)((char *)a2 + v7[8]);
    *(_OWORD *)((char *)v4 + v7[9]) = *(_OWORD *)((char *)a2 + v7[9]);
    *(uint64_t *)((char *)v4 + v7[10]) = *(uint64_t *)((char *)a2 + v7[10]);
    uint64_t v12 = *(int *)(a3 + 20);
    uint64_t v13 = (char *)v4 + v12;
    v14 = (char *)a2 + v12;
    uint64_t v15 = sub_255F26A50();
    v16 = *(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 16);
    swift_bridgeObjectRetain();
    v16(v13, v14, v15);
    *(uint64_t *)((char *)v4 + *(int *)(a3 + 24)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 24));
  }
  return v4;
}

uint64_t sub_255F1C944(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = a1 + *(int *)(type metadata accessor for MentalHealthInjector.Configuration() + 24);
  uint64_t v5 = sub_255F26A10();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  swift_bridgeObjectRelease();
  uint64_t v6 = a1 + *(int *)(a2 + 20);
  uint64_t v7 = sub_255F26A50();
  uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8);
  return v8(v6, v7);
}

_OWORD *sub_255F1CA14(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = (int *)type metadata accessor for MentalHealthInjector.Configuration();
  uint64_t v7 = v6[6];
  uint64_t v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  uint64_t v10 = sub_255F26A10();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  *(void *)((char *)a1 + v6[7]) = *(void *)((char *)a2 + v6[7]);
  *(void *)((char *)a1 + v6[8]) = *(void *)((char *)a2 + v6[8]);
  *(_OWORD *)((char *)a1 + v6[9]) = *(_OWORD *)((char *)a2 + v6[9]);
  *(void *)((char *)a1 + v6[10]) = *(void *)((char *)a2 + v6[10]);
  uint64_t v11 = *(int *)(a3 + 20);
  uint64_t v12 = (char *)a1 + v11;
  uint64_t v13 = (char *)a2 + v11;
  uint64_t v14 = sub_255F26A50();
  uint64_t v15 = *(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 16);
  swift_bridgeObjectRetain();
  v15(v12, v13, v14);
  *(void *)((char *)a1 + *(int *)(a3 + 24)) = *(void *)((char *)a2 + *(int *)(a3 + 24));
  return a1;
}

void *sub_255F1CB4C(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  uint64_t v6 = (int *)type metadata accessor for MentalHealthInjector.Configuration();
  uint64_t v7 = v6[6];
  uint64_t v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  uint64_t v10 = sub_255F26A10();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 24))(v8, v9, v10);
  *(void *)((char *)a1 + v6[7]) = *(void *)((char *)a2 + v6[7]);
  *(void *)((char *)a1 + v6[8]) = *(void *)((char *)a2 + v6[8]);
  uint64_t v11 = v6[9];
  uint64_t v12 = (void *)((char *)a1 + v11);
  uint64_t v13 = (void *)((char *)a2 + v11);
  *uint64_t v12 = *v13;
  v12[1] = v13[1];
  *(void *)((char *)a1 + v6[10]) = *(void *)((char *)a2 + v6[10]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v14 = *(int *)(a3 + 20);
  uint64_t v15 = (char *)a1 + v14;
  v16 = (char *)a2 + v14;
  uint64_t v17 = sub_255F26A50();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v17 - 8) + 24))(v15, v16, v17);
  *(void *)((char *)a1 + *(int *)(a3 + 24)) = *(void *)((char *)a2 + *(int *)(a3 + 24));
  return a1;
}

_OWORD *sub_255F1CC90(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = (int *)type metadata accessor for MentalHealthInjector.Configuration();
  uint64_t v7 = v6[6];
  uint64_t v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  uint64_t v10 = sub_255F26A10();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  *(void *)((char *)a1 + v6[7]) = *(void *)((char *)a2 + v6[7]);
  *(void *)((char *)a1 + v6[8]) = *(void *)((char *)a2 + v6[8]);
  *(_OWORD *)((char *)a1 + v6[9]) = *(_OWORD *)((char *)a2 + v6[9]);
  *(void *)((char *)a1 + v6[10]) = *(void *)((char *)a2 + v6[10]);
  uint64_t v11 = *(int *)(a3 + 20);
  uint64_t v12 = (char *)a1 + v11;
  uint64_t v13 = (char *)a2 + v11;
  uint64_t v14 = sub_255F26A50();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 32))(v12, v13, v14);
  *(void *)((char *)a1 + *(int *)(a3 + 24)) = *(void *)((char *)a2 + *(int *)(a3 + 24));
  return a1;
}

_OWORD *sub_255F1CDAC(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = (int *)type metadata accessor for MentalHealthInjector.Configuration();
  uint64_t v7 = v6[6];
  uint64_t v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  uint64_t v10 = sub_255F26A10();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  *(void *)((char *)a1 + v6[7]) = *(void *)((char *)a2 + v6[7]);
  *(void *)((char *)a1 + v6[8]) = *(void *)((char *)a2 + v6[8]);
  *(_OWORD *)((char *)a1 + v6[9]) = *(_OWORD *)((char *)a2 + v6[9]);
  *(void *)((char *)a1 + v6[10]) = *(void *)((char *)a2 + v6[10]);
  swift_bridgeObjectRelease();
  uint64_t v11 = *(int *)(a3 + 20);
  uint64_t v12 = (char *)a1 + v11;
  uint64_t v13 = (char *)a2 + v11;
  uint64_t v14 = sub_255F26A50();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 40))(v12, v13, v14);
  *(void *)((char *)a1 + *(int *)(a3 + 24)) = *(void *)((char *)a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t sub_255F1CED0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_255F1CEE4);
}

uint64_t sub_255F1CEE4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for MentalHealthInjector.Configuration();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    uint64_t v10 = sub_255F26A50();
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 48);
    uint64_t v12 = v10;
    uint64_t v13 = a1 + *(int *)(a3 + 20);
    return v11(v13, a2, v12);
  }
}

uint64_t sub_255F1CFDC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_255F1CFF0);
}

uint64_t sub_255F1CFF0(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = type metadata accessor for MentalHealthInjector.Configuration();
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, v8);
  }
  else
  {
    uint64_t v12 = sub_255F26A50();
    uint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56);
    uint64_t v14 = v12;
    uint64_t v15 = a1 + *(int *)(a4 + 20);
    return v13(v15, a2, a2, v14);
  }
}

uint64_t _s13DateGeneratorVMa()
{
  uint64_t result = qword_269F40510;
  if (!qword_269F40510) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_255F1D140()
{
  uint64_t result = type metadata accessor for MentalHealthInjector.Configuration();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_255F26A50();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

void type metadata accessor for __HKStateOfMindDomain(uint64_t a1)
{
}

uint64_t sub_255F1D228()
{
  return sub_255F1DBC8(&qword_269F40528, type metadata accessor for __HKStateOfMindDomain);
}

void sub_255F1D270(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v41 = a1;
  uint64_t v43 = sub_255F26A50();
  uint64_t v3 = *(void *)(v43 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v5 = (char *)&v38 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_255F26A10();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v9 = (char *)&v38 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_255F26A80();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v13 = (char *)&v38 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = type metadata accessor for MentalHealthInjector.Configuration();
  uint64_t v15 = v2 + *(int *)(v14 + 24);
  uint64_t v39 = v7;
  uint64_t v40 = v6;
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v15, v6);
  uint64_t v16 = _s13DateGeneratorVMa();
  uint64_t v17 = *(void (**)(char *))(v3 + 16);
  uint64_t v42 = v2 + *(int *)(v16 + 20);
  v17(v5);
  sub_255F26A60();
  uint64_t v18 = sub_255F26A70();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  uint64_t v19 = v18 - 1;
  if (__OFSUB__(v18, 1))
  {
    __break(1u);
    goto LABEL_12;
  }
  uint64_t v20 = *(void *)(v2 + 8);
  if (!v20)
  {
LABEL_12:
    __break(1u);
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  uint64_t v21 = *(int *)(v16 + 24);
  uint64_t v22 = *(void *)(v2 + v21);
  if (v22 == 0x8000000000000000 && v20 == -1) {
    goto LABEL_18;
  }
  uint64_t v23 = v22 / v20;
  uint64_t v24 = *(void *)(v2 + *(int *)(v14 + 28));
  BOOL v25 = __OFADD__(v23, v24);
  uint64_t v26 = v23 + v24;
  if (v25) {
    goto LABEL_13;
  }
  uint64_t v27 = v19 - v26;
  if (__OFSUB__(v19, v26))
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v28 = self;
  v29 = (void *)sub_255F26A40();
  id v30 = objc_msgSend(v28, sel_hk_dateOnDayIndex_atHour_calendar_, v27, 1, v29);

  objc_msgSend(v30, sel_timeIntervalSinceReferenceDate);
  double v32 = v31;

  v33 = (void *)sub_255F26A40();
  id v34 = objc_msgSend(v28, sel_hk_dateOnDayIndex_atHour_calendar_, v27, 23, v33);

  objc_msgSend(v34, sel_timeIntervalSinceReferenceDate);
  double v36 = v35;

  if (v32 > v36)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  if ((~COERCE__INT64(v36 - v32) & 0x7FF0000000000000) != 0)
  {
    sub_255F22334(0x20000000000001);
    if (!__OFADD__(v22, 1))
    {
      *(void *)(v2 + v21) = v22 + 1;
      uint64_t v37 = v41;
      sub_255F26A00();
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v39 + 56))(v37, 0, 1, v40);
      return;
    }
    goto LABEL_17;
  }
LABEL_16:
  __break(1u);
LABEL_17:
  __break(1u);
LABEL_18:
  __break(1u);
}

uint64_t sub_255F1D654@<X0>(uint64_t a1@<X8>)
{
  return sub_255F1DCF8(v1, a1, (uint64_t (*)(void))_s13DateGeneratorVMa);
}

uint64_t sub_255F1D688()
{
  return 0;
}

uint64_t sub_255F1D690()
{
  return 2;
}

uint64_t sub_255F1D698()
{
  uint64_t v1 = sub_255F1EB70(v0);
  sub_255F1DC98(v0, (uint64_t (*)(void))_s13DateGeneratorVMa);
  return v1;
}

uint64_t sub_255F1D6E4(uint64_t a1, char *a2, uint64_t a3)
{
  uint64_t v4 = v3;
  sub_255F1DC10();
  MEMORY[0x270FA5388]();
  uint64_t v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_255F26A10();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v13 = (char *)&v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  _s13DateGeneratorVMa();
  MEMORY[0x270FA5388]();
  uint64_t v15 = (char *)&v19 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = sub_255F1DCF8(v4, (uint64_t)v15, (uint64_t (*)(void))_s13DateGeneratorVMa);
  if (!a2)
  {
    a3 = 0;
    goto LABEL_12;
  }
  if (!a3)
  {
LABEL_12:
    sub_255F1DCF8((uint64_t)v15, a1, (uint64_t (*)(void))_s13DateGeneratorVMa);
    return a3;
  }
  if ((a3 & 0x8000000000000000) == 0)
  {
    uint64_t v21 = a1;
    sub_255F1D270((uint64_t)v9);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10) == 1)
    {
      a3 = 0;
LABEL_10:
      sub_255F1DC98((uint64_t)v9, (uint64_t (*)(void))sub_255F1DC10);
      a1 = v21;
    }
    else
    {
      uint64_t v17 = a3;
      a3 = 0;
      uint64_t v18 = *(void (**)(char *, char *, uint64_t))(v11 + 32);
      uint64_t v20 = v17;
      uint64_t v22 = v17 - 1;
      while (1)
      {
        v18(v13, v9, v10);
        v18(a2, v13, v10);
        if (v22 == a3) {
          break;
        }
        a2 += *(void *)(v11 + 72);
        sub_255F1D270((uint64_t)v9);
        ++a3;
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10) == 1) {
          goto LABEL_10;
        }
      }
      a3 = v20;
      a1 = v21;
    }
    goto LABEL_12;
  }
  __break(1u);
  return result;
}

uint64_t sub_255F1D988(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = type metadata accessor for MentalHealthInjector();
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = sub_255F1DCF8(v4, (uint64_t)v10, (uint64_t (*)(void))type metadata accessor for MentalHealthInjector);
  if (!a2)
  {
    uint64_t i = 0;
    goto LABEL_10;
  }
  if (!a3)
  {
LABEL_9:
    uint64_t i = a3;
    goto LABEL_10;
  }
  if ((a3 & 0x8000000000000000) == 0)
  {
    unint64_t v12 = (unint64_t)MentalHealthInjector.next()();
    for (uint64_t i = 0; v12; ++i)
    {
      *(void *)(a2 + 8 * i) = v12;
      if (a3 - 1 == i) {
        goto LABEL_9;
      }
      unint64_t v12 = (unint64_t)MentalHealthInjector.next()();
    }
LABEL_10:
    sub_255F1DCF8((uint64_t)v10, a1, (uint64_t (*)(void))type metadata accessor for MentalHealthInjector);
    return i;
  }
  __break(1u);
  return result;
}

uint64_t sub_255F1DA98()
{
  return sub_255F26AB0();
}

uint64_t sub_255F1DAC8()
{
  return sub_255F26CC0();
}

uint64_t sub_255F1DB10()
{
  return sub_255F26CB0();
}

uint64_t sub_255F1DB3C()
{
  return sub_255F26CC0();
}

uint64_t sub_255F1DB80()
{
  return sub_255F1DBC8(&qword_269F40530, (void (*)(uint64_t))_s13DateGeneratorVMa);
}

uint64_t sub_255F1DBC8(unint64_t *a1, void (*a2)(uint64_t))
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

void sub_255F1DC10()
{
  if (!qword_269F40538)
  {
    sub_255F26A10();
    unint64_t v0 = sub_255F26B30();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_269F40538);
    }
  }
}

BOOL sub_255F1DC68(void *a1, void *a2)
{
  return *a1 == *a2;
}

void *sub_255F1DC7C@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void sub_255F1DC8C(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_255F1DC98(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_255F1DCF8(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

void type metadata accessor for Label(uint64_t a1)
{
}

void sub_255F1DD74(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_255F1DDBC()
{
  return sub_255F1DBC8(&qword_269F40548, type metadata accessor for Label);
}

uint64_t *sub_255F1DE14(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = type metadata accessor for MentalHealthInjector.Configuration();
  int v5 = *(_DWORD *)(*(void *)(v4 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v11 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v11 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v6 = (int *)v4;
    *(_OWORD *)a1 = *(_OWORD *)a2;
    uint64_t v7 = *(int *)(v4 + 24);
    uint64_t v8 = (char *)a1 + v7;
    uint64_t v9 = (char *)a2 + v7;
    uint64_t v10 = sub_255F26A10();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
    *(uint64_t *)((char *)a1 + v6[7]) = *(uint64_t *)((char *)a2 + v6[7]);
    *(uint64_t *)((char *)a1 + v6[8]) = *(uint64_t *)((char *)a2 + v6[8]);
    *(_OWORD *)((char *)a1 + v6[9]) = *(_OWORD *)((char *)a2 + v6[9]);
    *(uint64_t *)((char *)a1 + v6[10]) = *(uint64_t *)((char *)a2 + v6[10]);
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_255F1DF2C(uint64_t a1)
{
  uint64_t v1 = a1 + *(int *)(type metadata accessor for MentalHealthInjector.Configuration() + 24);
  uint64_t v2 = sub_255F26A10();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  return swift_bridgeObjectRelease();
}

_OWORD *sub_255F1DFB8(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  uint64_t v4 = (int *)type metadata accessor for MentalHealthInjector.Configuration();
  uint64_t v5 = v4[6];
  uint64_t v6 = (char *)a1 + v5;
  uint64_t v7 = (char *)a2 + v5;
  uint64_t v8 = sub_255F26A10();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 16))(v6, v7, v8);
  *(void *)((char *)a1 + v4[7]) = *(void *)((char *)a2 + v4[7]);
  *(void *)((char *)a1 + v4[8]) = *(void *)((char *)a2 + v4[8]);
  *(_OWORD *)((char *)a1 + v4[9]) = *(_OWORD *)((char *)a2 + v4[9]);
  *(void *)((char *)a1 + v4[10]) = *(void *)((char *)a2 + v4[10]);
  swift_bridgeObjectRetain();
  return a1;
}

void *sub_255F1E080(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  uint64_t v4 = (int *)type metadata accessor for MentalHealthInjector.Configuration();
  uint64_t v5 = v4[6];
  uint64_t v6 = (char *)a1 + v5;
  uint64_t v7 = (char *)a2 + v5;
  uint64_t v8 = sub_255F26A10();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 24))(v6, v7, v8);
  *(void *)((char *)a1 + v4[7]) = *(void *)((char *)a2 + v4[7]);
  *(void *)((char *)a1 + v4[8]) = *(void *)((char *)a2 + v4[8]);
  uint64_t v9 = v4[9];
  uint64_t v10 = (void *)((char *)a1 + v9);
  uint64_t v11 = (void *)((char *)a2 + v9);
  *uint64_t v10 = *v11;
  v10[1] = v11[1];
  *(void *)((char *)a1 + v4[10]) = *(void *)((char *)a2 + v4[10]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_OWORD *sub_255F1E16C(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  uint64_t v4 = (int *)type metadata accessor for MentalHealthInjector.Configuration();
  uint64_t v5 = v4[6];
  uint64_t v6 = (char *)a1 + v5;
  uint64_t v7 = (char *)a2 + v5;
  uint64_t v8 = sub_255F26A10();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 32))(v6, v7, v8);
  *(void *)((char *)a1 + v4[7]) = *(void *)((char *)a2 + v4[7]);
  *(void *)((char *)a1 + v4[8]) = *(void *)((char *)a2 + v4[8]);
  *(_OWORD *)((char *)a1 + v4[9]) = *(_OWORD *)((char *)a2 + v4[9]);
  *(void *)((char *)a1 + v4[10]) = *(void *)((char *)a2 + v4[10]);
  return a1;
}

_OWORD *sub_255F1E230(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  uint64_t v4 = (int *)type metadata accessor for MentalHealthInjector.Configuration();
  uint64_t v5 = v4[6];
  uint64_t v6 = (char *)a1 + v5;
  uint64_t v7 = (char *)a2 + v5;
  uint64_t v8 = sub_255F26A10();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 40))(v6, v7, v8);
  *(void *)((char *)a1 + v4[7]) = *(void *)((char *)a2 + v4[7]);
  *(void *)((char *)a1 + v4[8]) = *(void *)((char *)a2 + v4[8]);
  *(_OWORD *)((char *)a1 + v4[9]) = *(_OWORD *)((char *)a2 + v4[9]);
  *(void *)((char *)a1 + v4[10]) = *(void *)((char *)a2 + v4[10]);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_255F1E2FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_255F1E310);
}

uint64_t sub_255F1E310(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for MentalHealthInjector.Configuration();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);
  return v5(a1, a2, v4);
}

uint64_t sub_255F1E37C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_255F1E390);
}

uint64_t sub_255F1E390(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for MentalHealthInjector.Configuration();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);
  return v5(a1, a2, a2, v4);
}

uint64_t _s16ValenceGeneratorVMa()
{
  uint64_t result = qword_269F40550;
  if (!qword_269F40550) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_255F1E44C()
{
  uint64_t result = type metadata accessor for MentalHealthInjector.Configuration();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_255F1E4D8()
{
  _s16ValenceGeneratorVMa();
  MEMORY[0x270FA5388]();
  uint64_t v2 = (char *)&v9 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_255F1F4C8(v0, (uint64_t)v2, (uint64_t (*)(void))_s16ValenceGeneratorVMa);
  uint64_t v3 = (double *)&v2[*(int *)(type metadata accessor for MentalHealthInjector.Configuration() + 36)];
  double v5 = *v3;
  double v4 = v3[1];
  uint64_t result = sub_255F1F3A8((uint64_t)v2, (uint64_t (*)(void))type metadata accessor for MentalHealthInjector.Configuration);
  if ((~COERCE__INT64(v4 - v5) & 0x7FF0000000000000) != 0)
  {
    unint64_t v7 = sub_255F22334(0x20000000000001);
    double v8 = v5 + (v4 - v5) * ((double)v7 * 1.11022302e-16);
    if (v7 == 0x20000000000000) {
      double v8 = v4;
    }
    return *(void *)&v8;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_255F1E5EC@<X0>(uint64_t a1@<X8>)
{
  return sub_255F1F344(v1, a1);
}

void sub_255F1E5F8()
{
  sub_255F1E8D0(v0);
}

uint64_t sub_255F1E610(uint64_t a1)
{
  sub_255F1F3A8(v1, (uint64_t (*)(void))_s16ValenceGeneratorVMa);
  return a1;
}

uint64_t sub_255F1E644@<X0>(uint64_t a1@<X8>)
{
  uint64_t result = sub_255F1E4D8();
  *(void *)a1 = result;
  *(unsigned char *)(a1 + 8) = 0;
  return result;
}

unint64_t sub_255F1E674()
{
  unint64_t result = qword_269F40560;
  if (!qword_269F40560)
  {
    _s16ValenceGeneratorVMa();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269F40560);
  }
  return result;
}

uint64_t sub_255F1E6CC(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for MentalHealthInjector();
  MEMORY[0x270FA5388](v2 - 8);
  double v4 = (char *)&v24 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_255F1F4C8(a1, (uint64_t)v4, (uint64_t (*)(void))type metadata accessor for MentalHealthInjector);
  uint64_t result = (unint64_t)MentalHealthInjector.next()();
  uint64_t v6 = (void *)MEMORY[0x263F8EE78];
  if (result)
  {
    uint64_t v7 = result;
    uint64_t v8 = 0;
    uint64_t v9 = (uint64_t *)(MEMORY[0x263F8EE78] + 32);
    while (1)
    {
      if (!v8)
      {
        unint64_t v10 = v6[3];
        if ((uint64_t)((v10 >> 1) + 0x4000000000000000) < 0) {
          goto LABEL_28;
        }
        int64_t v11 = v10 & 0xFFFFFFFFFFFFFFFELL;
        if (v11 <= 1) {
          uint64_t v12 = 1;
        }
        else {
          uint64_t v12 = v11;
        }
        sub_255F1F464(0, &qword_269F40578, (uint64_t (*)(uint64_t))sub_255F1F530, MEMORY[0x263F8E0F8]);
        uint64_t v13 = (void *)swift_allocObject();
        int64_t v14 = _swift_stdlib_malloc_size(v13);
        uint64_t v15 = v14 - 32;
        if (v14 < 32) {
          uint64_t v15 = v14 - 25;
        }
        uint64_t v16 = v15 >> 3;
        v13[2] = v12;
        v13[3] = 2 * (v15 >> 3);
        unint64_t v17 = (unint64_t)(v13 + 4);
        uint64_t v18 = v6[3] >> 1;
        if (v6[2])
        {
          if (v13 != v6 || v17 >= (unint64_t)&v6[v18 + 4]) {
            memmove(v13 + 4, v6 + 4, 8 * v18);
          }
          v6[2] = 0;
        }
        uint64_t v9 = (uint64_t *)(v17 + 8 * v18);
        uint64_t v8 = (v16 & 0x7FFFFFFFFFFFFFFFLL) - v18;
        uint64_t result = swift_release();
        uint64_t v6 = v13;
      }
      BOOL v20 = __OFSUB__(v8--, 1);
      if (v20) {
        break;
      }
      *v9++ = v7;
      uint64_t result = (unint64_t)MentalHealthInjector.next()();
      uint64_t v7 = result;
      if (!result) {
        goto LABEL_23;
      }
    }
    __break(1u);
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  uint64_t v8 = 0;
LABEL_23:
  uint64_t result = sub_255F1F3A8((uint64_t)v4, (uint64_t (*)(void))type metadata accessor for MentalHealthInjector);
  unint64_t v21 = v6[3];
  if (v21 < 2) {
    return (uint64_t)v6;
  }
  unint64_t v22 = v21 >> 1;
  BOOL v20 = __OFSUB__(v22, v8);
  uint64_t v23 = v22 - v8;
  if (!v20)
  {
    v6[2] = v23;
    return (uint64_t)v6;
  }
LABEL_29:
  __break(1u);
  return result;
}

void sub_255F1E8D0(uint64_t a1)
{
  uint64_t v2 = _s16ValenceGeneratorVMa();
  uint64_t v3 = MEMORY[0x270FA5388](v2 - 8);
  double v5 = (char *)&v29 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  uint64_t v7 = (char *)&v29 - v6;
  sub_255F1F4C8(a1, (uint64_t)&v29 - v6, (uint64_t (*)(void))_s16ValenceGeneratorVMa);
  sub_255F1F4C8((uint64_t)v7, (uint64_t)v5, (uint64_t (*)(void))_s16ValenceGeneratorVMa);
  uint64_t v8 = type metadata accessor for MentalHealthInjector.Configuration();
  uint64_t v9 = (double *)&v5[*(int *)(v8 + 36)];
  double v11 = *v9;
  double v10 = v9[1];
  sub_255F1F3A8((uint64_t)v5, (uint64_t (*)(void))type metadata accessor for MentalHealthInjector.Configuration);
  double v12 = v10 - v11;
  if ((~COERCE__INT64(v10 - v11) & 0x7FF0000000000000) != 0)
  {
    uint64_t v13 = 0;
    int64_t v14 = (void *)MEMORY[0x263F8EE78];
    uint64_t v15 = (double *)(MEMORY[0x263F8EE78] + 32);
    while (1)
    {
      do
      {
        unint64_t v30 = 0;
        MEMORY[0x25A29D200](&v30, 8);
      }
      while (0x20000000000001 * v30 < 0x1FFFFFFFFFF801);
      unint64_t v16 = (v30 * (unsigned __int128)0x20000000000001uLL) >> 64;
      if (v16 != 0x20000000000000) {
        double v10 = v11 + v12 * ((double)v16 * 1.11022302e-16);
      }
      if (!v13)
      {
        unint64_t v17 = v14[3];
        if ((uint64_t)((v17 >> 1) + 0x4000000000000000) < 0) {
          goto LABEL_23;
        }
        int64_t v18 = v17 & 0xFFFFFFFFFFFFFFFELL;
        if (v18 <= 1) {
          uint64_t v19 = 1;
        }
        else {
          uint64_t v19 = v18;
        }
        sub_255F1F408();
        BOOL v20 = (void *)swift_allocObject();
        int64_t v21 = _swift_stdlib_malloc_size(v20);
        uint64_t v22 = v21 - 32;
        if (v21 < 32) {
          uint64_t v22 = v21 - 25;
        }
        uint64_t v23 = v22 >> 3;
        v20[2] = v19;
        v20[3] = 2 * (v22 >> 3);
        unint64_t v24 = (unint64_t)(v20 + 4);
        uint64_t v25 = v14[3] >> 1;
        if (v14[2])
        {
          uint64_t v26 = v14 + 4;
          if (v20 != v14 || v24 >= (unint64_t)v26 + 8 * v25) {
            memmove(v20 + 4, v26, 8 * v25);
          }
          v14[2] = 0;
        }
        uint64_t v15 = (double *)(v24 + 8 * v25);
        uint64_t v13 = (v23 & 0x7FFFFFFFFFFFFFFFLL) - v25;
        swift_release();
        int64_t v14 = v20;
      }
      if (__OFSUB__(v13--, 1)) {
        break;
      }
      *v15++ = v10;
      sub_255F1F4C8((uint64_t)v7, (uint64_t)v5, (uint64_t (*)(void))_s16ValenceGeneratorVMa);
      v28 = (double *)&v5[*(int *)(v8 + 36)];
      double v11 = *v28;
      double v10 = v28[1];
      sub_255F1F3A8((uint64_t)v5, (uint64_t (*)(void))type metadata accessor for MentalHealthInjector.Configuration);
      double v12 = v10 - v11;
      if ((~COERCE__INT64(v10 - v11) & 0x7FF0000000000000) == 0) {
        goto LABEL_21;
      }
    }
  }
  else
  {
LABEL_21:
    __break(1u);
  }
  __break(1u);
LABEL_23:
  __break(1u);
}

uint64_t sub_255F1EB70(uint64_t a1)
{
  sub_255F1DC10();
  MEMORY[0x270FA5388]();
  uint64_t v3 = (char *)v43 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_255F26A10();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v7 = (char *)v43 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  _s13DateGeneratorVMa();
  MEMORY[0x270FA5388]();
  uint64_t v9 = (char *)v43 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *(unsigned __int8 *)(v5 + 80);
  sub_255F1F4C8(a1, (uint64_t)v9, (uint64_t (*)(void))_s13DateGeneratorVMa);
  v44 = v9;
  sub_255F1D270((uint64_t)v3);
  double v11 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v5 + 48);
  v43[2] = v5 + 48;
  v46 = v11;
  int v12 = v11(v3, 1, v4);
  uint64_t v13 = (void *)MEMORY[0x263F8EE78];
  if (v12 != 1)
  {
    uint64_t v14 = 0;
    uint64_t v45 = (v10 + 32) & ~v10;
    uint64_t v21 = MEMORY[0x263F8EE78] + v45;
    uint64_t v47 = v4;
    uint64_t v48 = v5;
    uint64_t v22 = v5 + 32;
    uint64_t v23 = *(void (**)(uint64_t, char *, uint64_t))(v5 + 32);
    v43[0] = v3;
    v43[1] = v10 | 7;
    unint64_t v24 = (void *)MEMORY[0x263F8EE78];
    uint64_t v15 = (uint64_t)v44;
    while (1)
    {
      uint64_t v27 = v4;
      uint64_t v28 = v22;
      uint64_t v29 = v23;
      uint64_t result = ((uint64_t (*)(char *, char *, uint64_t))v23)(v7, v3, v27);
      if (v14)
      {
        uint64_t v13 = v24;
        BOOL v19 = __OFSUB__(v14--, 1);
        if (v19) {
          goto LABEL_32;
        }
      }
      else
      {
        unint64_t v30 = v24[3];
        if ((uint64_t)((v30 >> 1) + 0x4000000000000000) < 0) {
          goto LABEL_33;
        }
        int64_t v31 = v30 & 0xFFFFFFFFFFFFFFFELL;
        if (v31 <= 1) {
          uint64_t v32 = 1;
        }
        else {
          uint64_t v32 = v31;
        }
        sub_255F1F464(0, &qword_269F40570, MEMORY[0x263F07490], MEMORY[0x263F8E0F8]);
        uint64_t v33 = *(void *)(v48 + 72);
        uint64_t v34 = v45;
        uint64_t v13 = (void *)swift_allocObject();
        uint64_t result = _swift_stdlib_malloc_size(v13);
        if (!v33) {
          goto LABEL_34;
        }
        uint64_t v35 = result - v34;
        if (result - v34 == 0x8000000000000000 && v33 == -1) {
          goto LABEL_35;
        }
        uint64_t v37 = v35 / v33;
        v13[2] = v32;
        v13[3] = 2 * (v35 / v33);
        uint64_t v38 = (char *)v13 + v34;
        uint64_t v39 = v24[3] >> 1;
        uint64_t v40 = v39 * v33;
        if (v24[2])
        {
          if (v13 < v24 || v38 >= (char *)v24 + v45 + v40)
          {
            swift_arrayInitWithTakeFrontToBack();
          }
          else if (v13 != v24)
          {
            swift_arrayInitWithTakeBackToFront();
          }
          v24[2] = 0;
        }
        uint64_t v21 = (uint64_t)&v38[v40];
        uint64_t v42 = (v37 & 0x7FFFFFFFFFFFFFFFLL) - v39;
        uint64_t result = swift_release();
        uint64_t v3 = (char *)v43[0];
        uint64_t v15 = (uint64_t)v44;
        BOOL v19 = __OFSUB__(v42, 1);
        uint64_t v14 = v42 - 1;
        if (v19)
        {
LABEL_32:
          __break(1u);
LABEL_33:
          __break(1u);
LABEL_34:
          __break(1u);
LABEL_35:
          __break(1u);
LABEL_36:
          __break(1u);
          return result;
        }
      }
      uint64_t v25 = v47;
      v29(v21, v7, v47);
      v21 += *(void *)(v48 + 72);
      sub_255F1D270((uint64_t)v3);
      int v26 = v46(v3, 1, v25);
      uint64_t v23 = v29;
      uint64_t v22 = v28;
      uint64_t v4 = v25;
      unint64_t v24 = v13;
      if (v26 == 1) {
        goto LABEL_3;
      }
    }
  }
  uint64_t v14 = 0;
  uint64_t v15 = (uint64_t)v44;
LABEL_3:
  sub_255F1F3A8(v15, (uint64_t (*)(void))_s13DateGeneratorVMa);
  uint64_t result = sub_255F1F3A8((uint64_t)v3, (uint64_t (*)(void))sub_255F1DC10);
  unint64_t v17 = v13[3];
  if (v17 >= 2)
  {
    unint64_t v18 = v17 >> 1;
    BOOL v19 = __OFSUB__(v18, v14);
    uint64_t v20 = v18 - v14;
    if (v19) {
      goto LABEL_36;
    }
    v13[2] = v20;
  }
  return (uint64_t)v13;
}

void *sub_255F1EF74(void *result, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4 + 56;
  uint64_t v5 = -1;
  uint64_t v6 = -1 << *(unsigned char *)(a4 + 32);
  if (-v6 < 64) {
    uint64_t v5 = ~(-1 << -(char)v6);
  }
  unint64_t v7 = v5 & *(void *)(a4 + 56);
  if (!a2)
  {
    int64_t v8 = 0;
    a3 = 0;
LABEL_35:
    *uint64_t result = a4;
    result[1] = v4;
    result[2] = ~v6;
    result[3] = v8;
    result[4] = v7;
    return (void *)a3;
  }
  if (!a3)
  {
    int64_t v8 = 0;
    goto LABEL_35;
  }
  if (a3 < 0)
  {
LABEL_37:
    __break(1u);
    goto LABEL_38;
  }
  int64_t v8 = 0;
  uint64_t v9 = 0;
  int64_t v10 = (unint64_t)(63 - v6) >> 6;
  while (v7)
  {
    unint64_t v11 = __clz(__rbit64(v7));
    v7 &= v7 - 1;
    unint64_t v12 = v11 | (v8 << 6);
LABEL_8:
    ++v9;
    *a2++ = *(void *)(*(void *)(a4 + 48) + 8 * v12);
    if (v9 == a3) {
      goto LABEL_35;
    }
  }
  int64_t v13 = v8 + 1;
  if (__OFADD__(v8, 1))
  {
    __break(1u);
    goto LABEL_37;
  }
  if (v13 >= v10) {
    goto LABEL_30;
  }
  unint64_t v14 = *(void *)(v4 + 8 * v13);
  if (v14) {
    goto LABEL_19;
  }
  v8 += 2;
  if (v13 + 1 >= v10)
  {
    unint64_t v7 = 0;
    int64_t v8 = v13;
    goto LABEL_34;
  }
  unint64_t v14 = *(void *)(v4 + 8 * v8);
  if (v14)
  {
LABEL_15:
    int64_t v13 = v8;
LABEL_19:
    unint64_t v16 = __clz(__rbit64(v14));
    unint64_t v7 = (v14 - 1) & v14;
    unint64_t v12 = v16 + (v13 << 6);
    int64_t v8 = v13;
    goto LABEL_8;
  }
  int64_t v15 = v13 + 2;
  if (v13 + 2 >= v10) {
    goto LABEL_30;
  }
  unint64_t v14 = *(void *)(v4 + 8 * v15);
  if (v14)
  {
LABEL_18:
    int64_t v13 = v15;
    goto LABEL_19;
  }
  int64_t v8 = v13 + 3;
  if (v13 + 3 >= v10)
  {
    unint64_t v7 = 0;
    int64_t v8 = v13 + 2;
    goto LABEL_34;
  }
  unint64_t v14 = *(void *)(v4 + 8 * v8);
  if (v14) {
    goto LABEL_15;
  }
  int64_t v15 = v13 + 4;
  if (v13 + 4 >= v10)
  {
LABEL_30:
    unint64_t v7 = 0;
LABEL_34:
    a3 = v9;
    goto LABEL_35;
  }
  unint64_t v14 = *(void *)(v4 + 8 * v15);
  if (v14) {
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v13 = v15 + 1;
    if (__OFADD__(v15, 1)) {
      break;
    }
    if (v13 >= v10)
    {
      unint64_t v7 = 0;
      int64_t v8 = v10 - 1;
      goto LABEL_34;
    }
    unint64_t v14 = *(void *)(v4 + 8 * v13);
    ++v15;
    if (v14) {
      goto LABEL_19;
    }
  }
LABEL_38:
  __break(1u);
  return result;
}

uint64_t sub_255F1F108(uint64_t a1, double *a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = _s16ValenceGeneratorVMa();
  uint64_t v9 = MEMORY[0x270FA5388](v8 - 8);
  unint64_t v11 = (char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  int64_t v13 = (char *)&v24 - v12;
  uint64_t result = sub_255F1F344(v4, (uint64_t)&v24 - v12);
  if (!a2)
  {
    a3 = 0;
    goto LABEL_14;
  }
  if (!a3)
  {
LABEL_14:
    sub_255F1F344((uint64_t)v13, a1);
    return a3;
  }
  if ((a3 & 0x8000000000000000) == 0)
  {
    uint64_t v24 = a1;
    sub_255F1F4C8((uint64_t)v13, (uint64_t)v11, (uint64_t (*)(void))_s16ValenceGeneratorVMa);
    uint64_t v15 = type metadata accessor for MentalHealthInjector.Configuration();
    unint64_t v16 = (double *)&v11[*(int *)(v15 + 36)];
    double v18 = *v16;
    double v17 = v16[1];
    sub_255F1F3A8((uint64_t)v11, (uint64_t (*)(void))type metadata accessor for MentalHealthInjector.Configuration);
    double v19 = v17 - v18;
    if ((~COERCE__INT64(v17 - v18) & 0x7FF0000000000000) != 0)
    {
      uint64_t v20 = 1;
      while (1)
      {
        do
        {
          unint64_t v25 = 0;
          MEMORY[0x25A29D200](&v25, 8);
        }
        while (0x20000000000001 * v25 < 0x1FFFFFFFFFF801);
        unint64_t v21 = (v25 * (unsigned __int128)0x20000000000001uLL) >> 64;
        double v22 = v18 + v19 * ((double)v21 * 1.11022302e-16);
        if (v21 == 0x20000000000000) {
          double v22 = v17;
        }
        *a2 = v22;
        if (v20 == a3) {
          break;
        }
        ++a2;
        ++v20;
        sub_255F1F4C8((uint64_t)v13, (uint64_t)v11, (uint64_t (*)(void))_s16ValenceGeneratorVMa);
        uint64_t v23 = (double *)&v11[*(int *)(v15 + 36)];
        double v18 = *v23;
        double v17 = v23[1];
        sub_255F1F3A8((uint64_t)v11, (uint64_t (*)(void))type metadata accessor for MentalHealthInjector.Configuration);
        double v19 = v17 - v18;
        if ((~COERCE__INT64(v17 - v18) & 0x7FF0000000000000) == 0) {
          goto LABEL_11;
        }
      }
    }
    else
    {
LABEL_11:
      __break(1u);
    }
    a1 = v24;
    goto LABEL_14;
  }
  __break(1u);
  return result;
}

uint64_t sub_255F1F344(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = _s16ValenceGeneratorVMa();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_255F1F3A8(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

void sub_255F1F408()
{
  if (!qword_269F40568)
  {
    unint64_t v0 = sub_255F26C60();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_269F40568);
    }
  }
}

void sub_255F1F464(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v7 = a3(255);
    unint64_t v8 = a4(a1, v7);
    if (!v9) {
      atomic_store(v8, a2);
    }
  }
}

uint64_t sub_255F1F4C8(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

void sub_255F1F530(uint64_t a1)
{
}

unint64_t sub_255F1F564()
{
  unint64_t result = qword_269F40588;
  if (!qword_269F40588)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_269F40588);
  }
  return result;
}

uint64_t static MentalHealthInjector.Configuration.Constants.noneDomainKey.getter()
{
  return 0x6E5F6E69616D6F64;
}

uint64_t MentalHealthInjector.Configuration.init(reflectiveInterval:daysToBackfill:samplesPerDay:injectionDate:injectionDayOffset:valenceRange:domainCounts:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, void *a7@<X8>, double a8@<D0>, double a9@<D1>)
{
  if ((sub_255F1FB88(a6) & 1) == 0)
  {
    swift_bridgeObjectRelease();
    uint64_t v39 = self;
    uint64_t v40 = (void *)sub_255F26A90();
    objc_msgSend(v39, sel_hk_error_description_, 3, v40);

    swift_willThrow();
    uint64_t v41 = sub_255F26A10();
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v41 - 8) + 8))(a4, v41);
  }
  double v18 = (int *)type metadata accessor for MentalHealthInjector.Configuration();
  *(void *)((char *)a7 + v18[8]) = a1;
  *a7 = a2;
  a7[1] = a3;
  *(void *)((char *)a7 + v18[10]) = a6;
  double v19 = (double *)((char *)a7 + v18[9]);
  *double v19 = a8;
  v19[1] = a9;
  uint64_t v20 = (char *)a7 + v18[6];
  uint64_t v21 = sub_255F26A10();
  uint64_t v22 = a4;
  uint64_t v23 = *(void *)(v21 - 8);
  uint64_t v45 = v22;
  uint64_t result = (*(uint64_t (**)(char *))(v23 + 16))(v20);
  int64_t v25 = 0;
  uint64_t v26 = 0;
  *(void *)((char *)a7 + v18[7]) = a5;
  uint64_t v27 = a6 + 64;
  uint64_t v28 = 1 << *(unsigned char *)(a6 + 32);
  uint64_t v29 = -1;
  if (v28 < 64) {
    uint64_t v29 = ~(-1 << v28);
  }
  unint64_t v30 = v29 & *(void *)(a6 + 64);
  int64_t v31 = (unint64_t)(v28 + 63) >> 6;
  while (v30)
  {
    unint64_t v32 = __clz(__rbit64(v30));
    v30 &= v30 - 1;
    unint64_t v33 = v32 | (v25 << 6);
LABEL_6:
    uint64_t v34 = *(void *)(*(void *)(a6 + 56) + 8 * v33);
    BOOL v35 = __OFADD__(v26, v34);
    v26 += v34;
    if (v35)
    {
      __break(1u);
LABEL_32:
      __break(1u);
      goto LABEL_33;
    }
  }
  int64_t v36 = v25 + 1;
  if (__OFADD__(v25, 1)) {
    goto LABEL_32;
  }
  if (v36 < v31)
  {
    unint64_t v37 = *(void *)(v27 + 8 * v36);
    ++v25;
    if (!v37)
    {
      int64_t v25 = v36 + 1;
      if (v36 + 1 >= v31) {
        goto LABEL_27;
      }
      unint64_t v37 = *(void *)(v27 + 8 * v25);
      if (!v37)
      {
        int64_t v25 = v36 + 2;
        if (v36 + 2 >= v31) {
          goto LABEL_27;
        }
        unint64_t v37 = *(void *)(v27 + 8 * v25);
        if (!v37)
        {
          int64_t v25 = v36 + 3;
          if (v36 + 3 >= v31) {
            goto LABEL_27;
          }
          unint64_t v37 = *(void *)(v27 + 8 * v25);
          if (!v37)
          {
            int64_t v25 = v36 + 4;
            if (v36 + 4 >= v31) {
              goto LABEL_27;
            }
            unint64_t v37 = *(void *)(v27 + 8 * v25);
            if (!v37)
            {
              int64_t v38 = v36 + 5;
              if (v38 >= v31) {
                goto LABEL_27;
              }
              unint64_t v37 = *(void *)(v27 + 8 * v38);
              if (!v37)
              {
                while (1)
                {
                  int64_t v25 = v38 + 1;
                  if (__OFADD__(v38, 1)) {
                    goto LABEL_34;
                  }
                  if (v25 >= v31) {
                    goto LABEL_27;
                  }
                  unint64_t v37 = *(void *)(v27 + 8 * v25);
                  ++v38;
                  if (v37) {
                    goto LABEL_25;
                  }
                }
              }
              int64_t v25 = v38;
            }
          }
        }
      }
    }
LABEL_25:
    unint64_t v30 = (v37 - 1) & v37;
    unint64_t v33 = __clz(__rbit64(v37)) + (v25 << 6);
    goto LABEL_6;
  }
LABEL_27:
  if ((unsigned __int128)(a3 * (__int128)a2) >> 64 != (a3 * a2) >> 63)
  {
LABEL_33:
    __break(1u);
LABEL_34:
    __break(1u);
    return result;
  }
  if (a3 * a2 >= v26) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(v23 + 8))(v45, v21);
  }
  uint64_t v42 = self;
  uint64_t v43 = (void *)sub_255F26A90();
  objc_msgSend(v42, sel_hk_error_description_, 3, v43);

  swift_willThrow();
  v44 = *(void (**)(uint64_t, uint64_t))(v23 + 8);
  v44(v45, v21);
  v44((uint64_t)v20, v21);
  return swift_bridgeObjectRelease();
}

uint64_t MentalHealthInjector.Configuration.init(reflectiveInterval:daysToBackfill:samplesPerDay:injectionDate:injectionDayOffset:valenceRange:domainPercentages:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, void *a7@<X8>, double a8@<D0>, double a9@<D1>)
{
  uint64_t v32 = a4;
  uint64_t v18 = sub_255F26A10();
  uint64_t v19 = *(void *)(v18 - 8);
  uint64_t result = MEMORY[0x270FA5388](v18);
  uint64_t v22 = (char *)&v28 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((unsigned __int128)(a3 * (__int128)a2) >> 64 == (a3 * a2) >> 63)
  {
    uint64_t v29 = a7;
    uint64_t v30 = v9;
    uint64_t v31 = result;
    uint64_t v23 = sub_255F1FD08(a6, a3 * a2);
    swift_bridgeObjectRelease();
    if (v23)
    {
      uint64_t v24 = v32;
      uint64_t v25 = v31;
      (*(void (**)(char *, uint64_t, uint64_t))(v19 + 16))(v22, v32, v31);
      MentalHealthInjector.Configuration.init(reflectiveInterval:daysToBackfill:samplesPerDay:injectionDate:injectionDayOffset:valenceRange:domainCounts:)(a1, a2, a3, (uint64_t)v22, a5, v23, v29, a8, a9);
      return (*(uint64_t (**)(uint64_t, uint64_t))(v19 + 8))(v24, v25);
    }
    else
    {
      uint64_t v26 = self;
      uint64_t v27 = (void *)sub_255F26A90();
      objc_msgSend(v26, sel_hk_error_description_, 3, v27);

      swift_willThrow();
      return (*(uint64_t (**)(uint64_t, uint64_t))(v19 + 8))(v32, v31);
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_255F1FB88(uint64_t result)
{
  int64_t v1 = 0;
  uint64_t v2 = result + 64;
  uint64_t v3 = 1 << *(unsigned char *)(result + 32);
  uint64_t v4 = -1;
  if (v3 < 64) {
    uint64_t v4 = ~(-1 << v3);
  }
  unint64_t v5 = v4 & *(void *)(result + 64);
  int64_t v6 = (unint64_t)(v3 + 63) >> 6;
  while (v5)
  {
    unint64_t v7 = __clz(__rbit64(v5));
    v5 &= v5 - 1;
    unint64_t v8 = v7 | (v1 << 6);
LABEL_5:
    if (*(uint64_t *)(*(void *)(result + 56) + 8 * v8) <= 0) {
      return 0;
    }
  }
  int64_t v9 = v1 + 1;
  if (__OFADD__(v1, 1))
  {
    __break(1u);
    goto LABEL_28;
  }
  if (v9 >= v6) {
    return 1;
  }
  unint64_t v10 = *(void *)(v2 + 8 * v9);
  ++v1;
  if (v10) {
    goto LABEL_24;
  }
  int64_t v1 = v9 + 1;
  if (v9 + 1 >= v6) {
    return 1;
  }
  unint64_t v10 = *(void *)(v2 + 8 * v1);
  if (v10) {
    goto LABEL_24;
  }
  int64_t v1 = v9 + 2;
  if (v9 + 2 >= v6) {
    return 1;
  }
  unint64_t v10 = *(void *)(v2 + 8 * v1);
  if (v10) {
    goto LABEL_24;
  }
  int64_t v1 = v9 + 3;
  if (v9 + 3 >= v6) {
    return 1;
  }
  unint64_t v10 = *(void *)(v2 + 8 * v1);
  if (v10) {
    goto LABEL_24;
  }
  int64_t v1 = v9 + 4;
  if (v9 + 4 >= v6) {
    return 1;
  }
  unint64_t v10 = *(void *)(v2 + 8 * v1);
  if (v10)
  {
LABEL_24:
    unint64_t v5 = (v10 - 1) & v10;
    unint64_t v8 = __clz(__rbit64(v10)) + (v1 << 6);
    goto LABEL_5;
  }
  int64_t v11 = v9 + 5;
  if (v11 >= v6) {
    return 1;
  }
  unint64_t v10 = *(void *)(v2 + 8 * v11);
  if (v10)
  {
    int64_t v1 = v11;
    goto LABEL_24;
  }
  while (1)
  {
    int64_t v1 = v11 + 1;
    if (__OFADD__(v11, 1)) {
      break;
    }
    if (v1 >= v6) {
      return 1;
    }
    unint64_t v10 = *(void *)(v2 + 8 * v1);
    ++v11;
    if (v10) {
      goto LABEL_24;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t type metadata accessor for MentalHealthInjector.Configuration()
{
  uint64_t result = qword_269F40590;
  if (!qword_269F40590) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_255F1FD08(uint64_t a1, uint64_t a2)
{
  double v40 = 0.0;
  uint64_t v4 = a1 + 64;
  uint64_t v5 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v6 = -1;
  if (v5 < 64) {
    uint64_t v6 = ~(-1 << v5);
  }
  unint64_t v7 = v6 & *(void *)(a1 + 64);
  swift_bridgeObjectRetain();
  swift_beginAccess();
  int64_t v8 = 0;
  int64_t v39 = (unint64_t)(v5 + 63) >> 6;
  double v9 = (double)a2;
  unint64_t v10 = (void *)MEMORY[0x263F8EE80];
  double v11 = 0.0;
  while (1)
  {
    if (v7)
    {
      unint64_t v12 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      unint64_t v13 = v12 | (v8 << 6);
    }
    else
    {
      int64_t v14 = v8 + 1;
      if (__OFADD__(v8, 1)) {
        goto LABEL_46;
      }
      if (v14 >= v39)
      {
LABEL_39:
        swift_release();
        return (uint64_t)v10;
      }
      unint64_t v15 = *(void *)(v4 + 8 * v14);
      ++v8;
      if (!v15)
      {
        int64_t v8 = v14 + 1;
        if (v14 + 1 >= v39) {
          goto LABEL_39;
        }
        unint64_t v15 = *(void *)(v4 + 8 * v8);
        if (!v15)
        {
          int64_t v8 = v14 + 2;
          if (v14 + 2 >= v39) {
            goto LABEL_39;
          }
          unint64_t v15 = *(void *)(v4 + 8 * v8);
          if (!v15)
          {
            int64_t v16 = v14 + 3;
            if (v16 >= v39) {
              goto LABEL_39;
            }
            unint64_t v15 = *(void *)(v4 + 8 * v16);
            if (!v15)
            {
              while (1)
              {
                int64_t v8 = v16 + 1;
                if (__OFADD__(v16, 1)) {
                  goto LABEL_47;
                }
                if (v8 >= v39) {
                  goto LABEL_39;
                }
                unint64_t v15 = *(void *)(v4 + 8 * v8);
                ++v16;
                if (v15) {
                  goto LABEL_21;
                }
              }
            }
            int64_t v8 = v16;
          }
        }
      }
LABEL_21:
      unint64_t v7 = (v15 - 1) & v15;
      unint64_t v13 = __clz(__rbit64(v15)) + (v8 << 6);
    }
    double v17 = 1.0 - v11;
    if (v17 <= 2.22507386e-308)
    {
      swift_bridgeObjectRelease();
      swift_release();
      return 0;
    }
    uint64_t v18 = *(void *)(a1 + 56);
    double v19 = *(double *)(v18 + 8 * v13) >= v17 ? v17 : *(double *)(v18 + 8 * v13);
    double v20 = floor(v19 * v9);
    if ((~*(void *)&v20 & 0x7FF0000000000000) == 0) {
      break;
    }
    if (v20 <= -9.22337204e18) {
      goto LABEL_42;
    }
    if (v20 >= 9.22337204e18) {
      goto LABEL_43;
    }
    uint64_t v21 = *(void *)(a1 + 48) + 16 * v13;
    uint64_t v22 = *(void *)v21;
    char v23 = *(unsigned char *)(v21 + 8);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    unint64_t v26 = sub_255F223C4(v22, v23);
    uint64_t v27 = v10[2];
    BOOL v28 = (v25 & 1) == 0;
    uint64_t v29 = v27 + v28;
    if (__OFADD__(v27, v28)) {
      goto LABEL_44;
    }
    char v30 = v25;
    if (v10[3] >= v29)
    {
      if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
        sub_255F25768();
      }
    }
    else
    {
      sub_255F25110(v29, isUniquelyReferenced_nonNull_native);
      unint64_t v31 = sub_255F223C4(v22, v23);
      if ((v30 & 1) != (v32 & 1)) {
        goto LABEL_48;
      }
      unint64_t v26 = v31;
    }
    uint64_t v33 = (uint64_t)v20;
    if (v30)
    {
      *(void *)(v10[7] + 8 * v26) = v33;
    }
    else
    {
      v10[(v26 >> 6) + 8] |= 1 << v26;
      uint64_t v34 = v10[6] + 16 * v26;
      *(void *)uint64_t v34 = v22;
      *(unsigned char *)(v34 + 8) = v23;
      *(void *)(v10[7] + 8 * v26) = v33;
      uint64_t v35 = v10[2];
      BOOL v36 = __OFADD__(v35, 1);
      uint64_t v37 = v35 + 1;
      if (v36) {
        goto LABEL_45;
      }
      v10[2] = v37;
    }
    swift_bridgeObjectRelease();
    double v11 = v19 + v40;
    double v40 = v19 + v40;
  }
  __break(1u);
LABEL_42:
  __break(1u);
LABEL_43:
  __break(1u);
LABEL_44:
  __break(1u);
LABEL_45:
  __break(1u);
LABEL_46:
  __break(1u);
LABEL_47:
  __break(1u);
LABEL_48:
  uint64_t result = sub_255F26C90();
  __break(1u);
  return result;
}

uint64_t *_s13ConfigurationVwCP(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v13 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (uint64_t *)(v13 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
    uint64_t v7 = a3[6];
    int64_t v8 = (char *)a1 + v7;
    double v9 = (char *)a2 + v7;
    uint64_t v10 = sub_255F26A10();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
    uint64_t v11 = a3[8];
    *(uint64_t *)((char *)v4 + a3[7]) = *(uint64_t *)((char *)a2 + a3[7]);
    *(uint64_t *)((char *)v4 + v11) = *(uint64_t *)((char *)a2 + v11);
    uint64_t v12 = a3[10];
    *(_OWORD *)((char *)v4 + a3[9]) = *(_OWORD *)((char *)a2 + a3[9]);
    *(uint64_t *)((char *)v4 + v12) = *(uint64_t *)((char *)a2 + v12);
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t _s13ConfigurationVwxx(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a1 + *(int *)(a2 + 24);
  uint64_t v3 = sub_255F26A10();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(v2, v3);
  return swift_bridgeObjectRelease();
}

_OWORD *_s13ConfigurationVwcp(_OWORD *a1, _OWORD *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[6];
  uint64_t v7 = (char *)a1 + v6;
  int64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_255F26A10();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16))(v7, v8, v9);
  uint64_t v10 = a3[8];
  *(void *)((char *)a1 + a3[7]) = *(void *)((char *)a2 + a3[7]);
  *(void *)((char *)a1 + v10) = *(void *)((char *)a2 + v10);
  uint64_t v11 = a3[10];
  *(_OWORD *)((char *)a1 + a3[9]) = *(_OWORD *)((char *)a2 + a3[9]);
  *(void *)((char *)a1 + v11) = *(void *)((char *)a2 + v11);
  swift_bridgeObjectRetain();
  return a1;
}

void *_s13ConfigurationVwca(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  uint64_t v6 = a3[6];
  uint64_t v7 = (char *)a1 + v6;
  int64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_255F26A10();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  *(void *)((char *)a1 + a3[7]) = *(void *)((char *)a2 + a3[7]);
  *(void *)((char *)a1 + a3[8]) = *(void *)((char *)a2 + a3[8]);
  uint64_t v10 = a3[9];
  uint64_t v11 = (void *)((char *)a1 + v10);
  uint64_t v12 = (void *)((char *)a2 + v10);
  *uint64_t v11 = *v12;
  v11[1] = v12[1];
  *(void *)((char *)a1 + a3[10]) = *(void *)((char *)a2 + a3[10]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_OWORD *_s13ConfigurationVwtk(_OWORD *a1, _OWORD *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[6];
  uint64_t v7 = (char *)a1 + v6;
  int64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_255F26A10();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  uint64_t v10 = a3[8];
  *(void *)((char *)a1 + a3[7]) = *(void *)((char *)a2 + a3[7]);
  *(void *)((char *)a1 + v10) = *(void *)((char *)a2 + v10);
  uint64_t v11 = a3[10];
  *(_OWORD *)((char *)a1 + a3[9]) = *(_OWORD *)((char *)a2 + a3[9]);
  *(void *)((char *)a1 + v11) = *(void *)((char *)a2 + v11);
  return a1;
}

_OWORD *_s13ConfigurationVwta(_OWORD *a1, _OWORD *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[6];
  uint64_t v7 = (char *)a1 + v6;
  int64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_255F26A10();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 40))(v7, v8, v9);
  uint64_t v10 = a3[8];
  *(void *)((char *)a1 + a3[7]) = *(void *)((char *)a2 + a3[7]);
  *(void *)((char *)a1 + v10) = *(void *)((char *)a2 + v10);
  uint64_t v11 = a3[10];
  *(_OWORD *)((char *)a1 + a3[9]) = *(_OWORD *)((char *)a2 + a3[9]);
  *(void *)((char *)a1 + v11) = *(void *)((char *)a2 + v11);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s13ConfigurationVwet(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_255F204F4);
}

uint64_t sub_255F204F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_255F26A10();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1 + *(int *)(a3 + 24);
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v10(v9, a2, v8);
  }
  else
  {
    unint64_t v12 = *(void *)(a1 + *(int *)(a3 + 40));
    if (v12 >= 0xFFFFFFFF) {
      LODWORD(v12) = -1;
    }
    return (v12 + 1);
  }
}

uint64_t _s13ConfigurationVwst(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_255F205CC);
}

uint64_t sub_255F205CC(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_255F26A10();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = result;
    uint64_t v11 = a1 + *(int *)(a4 + 24);
    unint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v12(v11, a2, a2, v10);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 40)) = (a2 - 1);
  }
  return result;
}

uint64_t sub_255F2068C()
{
  uint64_t result = sub_255F26A10();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for MentalHealthInjector.Configuration.Constants()
{
  return &type metadata for MentalHealthInjector.Configuration.Constants;
}

uint64_t MentalHealthInjector.StateOfMindDomainOrNone.hash(into:)()
{
  if ((*(unsigned char *)(v0 + 8) & 1) == 0) {
    sub_255F26CB0();
  }
  return sub_255F26CB0();
}

BOOL static MentalHealthInjector.StateOfMindDomainOrNone.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  if (*(unsigned char *)(a1 + 8)) {
    return (*(unsigned char *)(a2 + 8) & 1) != 0;
  }
  if (*(unsigned char *)(a2 + 8)) {
    return 0;
  }
  return *(void *)a1 == *(void *)a2;
}

BOOL sub_255F207D4(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_255F207EC()
{
  return sub_255F26CC0();
}

uint64_t sub_255F20834()
{
  return sub_255F26CB0();
}

uint64_t sub_255F20860()
{
  return sub_255F26CC0();
}

uint64_t sub_255F208A4()
{
  if (*v0) {
    return 1701736302;
  }
  else {
    return 0x6E69616D6F64;
  }
}

uint64_t sub_255F208D4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_255F2306C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_255F208FC()
{
  return 0;
}

void sub_255F20908(unsigned char *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_255F20914(uint64_t a1)
{
  unint64_t v2 = sub_255F22134();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_255F20950(uint64_t a1)
{
  unint64_t v2 = sub_255F22134();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_255F2098C()
{
  return 1;
}

uint64_t sub_255F20994()
{
  return sub_255F26CC0();
}

uint64_t sub_255F209D8()
{
  return sub_255F26CB0();
}

uint64_t sub_255F20A00()
{
  return sub_255F26CC0();
}

uint64_t sub_255F20A40()
{
  return 12383;
}

uint64_t sub_255F20A4C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  if (a1 == 12383 && a2 == 0xE200000000000000)
  {
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = 0;
  }
  else
  {
    char v5 = sub_255F26C70();
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

void sub_255F20ACC(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_255F20AD8(uint64_t a1)
{
  unint64_t v2 = sub_255F220E0();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_255F20B14(uint64_t a1)
{
  unint64_t v2 = sub_255F220E0();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_255F20B50()
{
  return 0;
}

uint64_t sub_255F20B5C@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = 1;
  return result;
}

uint64_t sub_255F20B8C(uint64_t a1)
{
  unint64_t v2 = sub_255F2208C();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_255F20BC8(uint64_t a1)
{
  unint64_t v2 = sub_255F2208C();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t MentalHealthInjector.StateOfMindDomainOrNone.encode(to:)(void *a1)
{
  uint64_t v3 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))MEMORY[0x263F8E0C0];
  sub_255F221CC(0, &qword_269F405A0, (uint64_t (*)(void))sub_255F2208C, (uint64_t)&type metadata for MentalHealthInjector.StateOfMindDomainOrNone.NoneCodingKeys, MEMORY[0x263F8E0C0]);
  uint64_t v21 = *(void *)(v4 - 8);
  uint64_t v22 = v4;
  MEMORY[0x270FA5388](v4);
  double v20 = (char *)&v18 - v5;
  sub_255F221CC(0, &qword_269F405B0, (uint64_t (*)(void))sub_255F220E0, (uint64_t)&type metadata for MentalHealthInjector.StateOfMindDomainOrNone.DomainCodingKeys, v3);
  uint64_t v23 = *(void *)(v6 - 8);
  uint64_t v24 = v6;
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v18 - v7;
  sub_255F221CC(0, &qword_269F405C0, (uint64_t (*)(void))sub_255F22134, (uint64_t)&type metadata for MentalHealthInjector.StateOfMindDomainOrNone.CodingKeys, v3);
  uint64_t v25 = v9;
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  unint64_t v12 = (char *)&v18 - v11;
  uint64_t v19 = *v1;
  LOBYTE(v3) = *((unsigned char *)v1 + 8);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_255F22134();
  sub_255F26CE0();
  if (v3)
  {
    char v28 = 1;
    sub_255F2208C();
    uint64_t v13 = v20;
    uint64_t v14 = v25;
    sub_255F26C40();
    (*(void (**)(char *, uint64_t))(v21 + 8))(v13, v22);
    return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v14);
  }
  else
  {
    char v27 = 0;
    sub_255F220E0();
    uint64_t v16 = v25;
    sub_255F26C40();
    uint64_t v26 = v19;
    type metadata accessor for __HKStateOfMindDomain(0);
    sub_255F24B88(&qword_269F405D0, type metadata accessor for __HKStateOfMindDomain);
    uint64_t v17 = v24;
    sub_255F26C50();
    (*(void (**)(char *, uint64_t))(v23 + 8))(v8, v17);
    return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v16);
  }
}

uint64_t MentalHealthInjector.StateOfMindDomainOrNone.hashValue.getter()
{
  char v1 = *(unsigned char *)(v0 + 8);
  sub_255F26CA0();
  if ((v1 & 1) == 0) {
    sub_255F26CB0();
  }
  sub_255F26CB0();
  return sub_255F26CC0();
}

uint64_t MentalHealthInjector.StateOfMindDomainOrNone.init(from:)@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v29 = a2;
  uint64_t v3 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))MEMORY[0x263F8E040];
  sub_255F221CC(0, &qword_269F405D8, (uint64_t (*)(void))sub_255F2208C, (uint64_t)&type metadata for MentalHealthInjector.StateOfMindDomainOrNone.NoneCodingKeys, MEMORY[0x263F8E040]);
  uint64_t v26 = *(void *)(v4 - 8);
  uint64_t v27 = v4;
  MEMORY[0x270FA5388](v4);
  unint64_t v31 = (char *)&v26 - v5;
  sub_255F221CC(0, &qword_269F405E0, (uint64_t (*)(void))sub_255F220E0, (uint64_t)&type metadata for MentalHealthInjector.StateOfMindDomainOrNone.DomainCodingKeys, v3);
  uint64_t v7 = v6;
  uint64_t v28 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v26 - v8;
  sub_255F221CC(0, &qword_269F405E8, (uint64_t (*)(void))sub_255F22134, (uint64_t)&type metadata for MentalHealthInjector.StateOfMindDomainOrNone.CodingKeys, v3);
  uint64_t v11 = v10;
  uint64_t v30 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v26 - v12;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_255F22134();
  uint64_t v14 = v32;
  sub_255F26CD0();
  if (v14) {
    goto LABEL_6;
  }
  unint64_t v15 = v31;
  char v32 = a1;
  uint64_t v16 = sub_255F26C30();
  if (*(void *)(v16 + 16) != 1)
  {
    uint64_t v19 = sub_255F26BA0();
    swift_allocError();
    uint64_t v21 = v20;
    sub_255F22284();
    *uint64_t v21 = &type metadata for MentalHealthInjector.StateOfMindDomainOrNone;
    sub_255F26C10();
    sub_255F26B80();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v19 - 8) + 104))(v21, *MEMORY[0x263F8DCB0], v19);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v30 + 8))(v13, v11);
    a1 = v32;
LABEL_6:
    uint64_t v22 = (uint64_t)a1;
    return __swift_destroy_boxed_opaque_existential_1(v22);
  }
  char v17 = *(unsigned char *)(v16 + 32);
  if (v17)
  {
    char v35 = 1;
    sub_255F2208C();
    sub_255F26C00();
    (*(void (**)(char *, uint64_t))(v26 + 8))(v15, v27);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v30 + 8))(v13, v11);
    uint64_t v18 = 0;
  }
  else
  {
    char v34 = 0;
    sub_255F220E0();
    sub_255F26C00();
    type metadata accessor for __HKStateOfMindDomain(0);
    sub_255F24B88(&qword_269F40600, type metadata accessor for __HKStateOfMindDomain);
    sub_255F26C20();
    uint64_t v24 = v30;
    (*(void (**)(char *, uint64_t))(v28 + 8))(v9, v7);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v24 + 8))(v13, v11);
    uint64_t v18 = v33;
  }
  uint64_t v25 = v29;
  void *v29 = v18;
  *((unsigned char *)v25 + 8) = v17;
  uint64_t v22 = (uint64_t)v32;
  return __swift_destroy_boxed_opaque_existential_1(v22);
}

uint64_t sub_255F21578()
{
  char v1 = *(unsigned char *)(v0 + 8);
  sub_255F26CA0();
  if ((v1 & 1) == 0) {
    sub_255F26CB0();
  }
  sub_255F26CB0();
  return sub_255F26CC0();
}

uint64_t sub_255F215DC()
{
  if ((*(unsigned char *)(v0 + 8) & 1) == 0) {
    sub_255F26CB0();
  }
  return sub_255F26CB0();
}

uint64_t sub_255F21624()
{
  char v1 = *(unsigned char *)(v0 + 8);
  sub_255F26CA0();
  if ((v1 & 1) == 0) {
    sub_255F26CB0();
  }
  sub_255F26CB0();
  return sub_255F26CC0();
}

uint64_t sub_255F21684@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return MentalHealthInjector.StateOfMindDomainOrNone.init(from:)(a1, a2);
}

uint64_t sub_255F2169C(void *a1)
{
  return MentalHealthInjector.StateOfMindDomainOrNone.encode(to:)(a1);
}

uint64_t sub_255F216B4(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a1 + 8);
  uint64_t result = *(unsigned __int8 *)(a2 + 8);
  if ((v3 & 1) == 0) {
    return (*(void *)a1 == *(void *)a2) & ~result;
  }
  return result;
}

uint64_t MentalHealthInjector.init(configuration:batchSize:)@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  uint64_t v6 = sub_255F26A20();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _s13DateGeneratorVMa();
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for MentalHealthInjector.Configuration();
  uint64_t result = MEMORY[0x270FA5388](v13);
  uint64_t v16 = (char *)&v24 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  *a3 = a2;
  a3[1] = *(uint64_t *)((char *)a1 + *(int *)(result + 32));
  uint64_t v17 = a1[1];
  uint64_t v18 = v17 * *a1;
  if ((unsigned __int128)(v17 * (__int128)*a1) >> 64 == v18 >> 63)
  {
    uint64_t v19 = swift_bridgeObjectRetain();
    a3[2] = sub_255F25E9C(v19, v18);
    a3[3] = v20;
    a3[4] = v21;
    a3[5] = v22;
    sub_255F249A4((uint64_t)a1, (uint64_t)v16, (uint64_t (*)(void))type metadata accessor for MentalHealthInjector.Configuration);
    uint64_t v23 = type metadata accessor for MentalHealthInjector();
    uint64_t v25 = (uint64_t)a3 + *(int *)(v23 + 28);
    (*(void (**)(char *, void, uint64_t))(v7 + 104))(v9, *MEMORY[0x263F07740], v6);
    sub_255F26A30();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    *(void *)&v12[*(int *)(v10 + 24)] = 0;
    sub_255F248D0((uint64_t)v16, (uint64_t)v12, (uint64_t (*)(void))type metadata accessor for MentalHealthInjector.Configuration);
    sub_255F248D0((uint64_t)v12, v25, (uint64_t (*)(void))_s13DateGeneratorVMa);
    return sub_255F248D0((uint64_t)a1, (uint64_t)a3 + *(int *)(v23 + 32), (uint64_t (*)(void))type metadata accessor for MentalHealthInjector.Configuration);
  }
  else
  {
    __break(1u);
  }
  return result;
}

Swift::OpaquePointer_optional __swiftcall MentalHealthInjector.next()()
{
  char v1 = v0;
  sub_255F24A90(0, (unint64_t *)&qword_269F40538, MEMORY[0x263F07490], MEMORY[0x263F8D8F0]);
  ((void (*)(void))MEMORY[0x270FA5388])();
  unint64_t v3 = (unint64_t)&v26 - v2;
  uint64_t v4 = sub_255F26A10();
  unint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  char v34 = (char *)&v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (uint64_t *)((char *)&v26 - v9);
  unint64_t v42 = MEMORY[0x263F8EE78];
  if ((MEMORY[0x263F8EE78] & 0xC000000000000000) != 0)
  {
LABEL_38:
    uint64_t v11 = (void *)MEMORY[0x263F8EE78];
    if (sub_255F26BB0() >= *v1) {
      goto LABEL_33;
    }
  }
  else if (*v1 < 1)
  {
    uint64_t v11 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_33;
  }
  BOOL v36 = v1 + 2;
  char v32 = (void (**)(char *, unint64_t, uint64_t))(v5 + 32);
  uint64_t v33 = (unsigned int (**)(unint64_t, uint64_t, uint64_t))(v5 + 48);
  uint64_t v30 = (void (**)(char *, char *, uint64_t))(v5 + 16);
  uint64_t v11 = (void *)MEMORY[0x263F8EE78];
  unint64_t v31 = (void (**)(uint64_t *, uint64_t))(v5 + 8);
  long long v26 = xmmword_255F28460;
  unint64_t v28 = v3;
  uint64_t v29 = v1;
  uint64_t v27 = v4;
  do
  {
    sub_255F24DDC((uint64_t)&v39);
    if (v41) {
      break;
    }
    uint64_t v12 = v39;
    int v13 = v40;
    uint64_t v14 = type metadata accessor for MentalHealthInjector();
    sub_255F1D270(v3);
    if ((*v33)(v3, 1, v4) == 1)
    {
      sub_255F23194(v3);
      break;
    }
    (*v32)((char *)v10, v3, v4);
    unint64_t v5 = (unint64_t)v1 + *(int *)(v14 + 32);
    sub_255F1E4D8();
    if (v15)
    {
      (*v31)(v10, v4);
      uint64_t v11 = (void *)v42;
      break;
    }
    int v37 = v13;
    uint64_t v16 = v10;
    uint64_t v17 = sub_255F26B10();
    unint64_t v18 = sub_255F22338(2uLL);
    uint64_t v39 = MEMORY[0x263F8EE88];
    uint64_t v10 = (uint64_t *)(v18 + 1);
    if ((uint64_t)(v18 + 1) < 0) {
      goto LABEL_36;
    }
    if (v18 != -1)
    {
      uint64_t v35 = v12;
      unint64_t v19 = *(void *)(v17 + 16);
      if (v19)
      {
        uint64_t v20 = (uint64_t *)v18;
        char v1 = 0;
        uint64_t v4 = v17 + 32;
        unint64_t v3 = -(uint64_t)v19;
        while (v1 != v10)
        {
          unint64_t v38 = 0;
          MEMORY[0x25A29D200](&v38, 8);
          uint64_t v21 = (v38 * (unsigned __int128)v19) >> 64;
          if (v19 > v38 * v19)
          {
            unint64_t v5 = v3 % v19;
            if (v3 % v19 > v38 * v19)
            {
              do
              {
                unint64_t v38 = 0;
                MEMORY[0x25A29D200](&v38, 8);
              }
              while (v5 > v38 * v19);
              uint64_t v21 = (v38 * (unsigned __int128)v19) >> 64;
            }
          }
          if (v21 >= *(void *)(v17 + 16)) {
            goto LABEL_35;
          }
          unint64_t v5 = (unint64_t)&v39;
          sub_255F22634((uint64_t *)&v38, *(void *)(v4 + 8 * v21));
          BOOL v22 = v1 == v20;
          char v1 = (uint64_t *)((char *)v1 + 1);
          if (v22)
          {
            swift_bridgeObjectRelease();
            unint64_t v3 = v28;
            char v1 = v29;
            uint64_t v4 = v27;
            uint64_t v12 = v35;
            goto LABEL_21;
          }
        }
        __break(1u);
LABEL_35:
        __break(1u);
LABEL_36:
        __break(1u);
      }
      __break(1u);
      goto LABEL_38;
    }
    swift_bridgeObjectRelease();
LABEL_21:
    uint64_t v10 = v16;
    if ((v37 & 1) == 0)
    {
      sub_255F24A90(0, &qword_269F40610, (uint64_t (*)(uint64_t))type metadata accessor for __HKStateOfMindDomain, MEMORY[0x263F8E0F8]);
      uint64_t v23 = swift_allocObject();
      *(_OWORD *)(v23 + 16) = v26;
      *(void *)(v23 + 32) = v12;
    }
    sub_255F23220();
    (*v30)(v34, (char *)v16, v4);
    sub_255F22F58(v39);
    swift_bridgeObjectRelease();
    sub_255F21EBC(MEMORY[0x263F8EE78]);
    sub_255F26B00();
    MEMORY[0x25A29CA50]();
    if (*(void *)((v42 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v42 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_255F26AE0();
    }
    sub_255F26AF0();
    sub_255F26AD0();
    (*v31)(v16, v4);
    uint64_t v11 = (void *)v42;
    if (v42 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v24 = sub_255F26BB0();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v24 = *(void *)((v42 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
  }
  while (v24 < *v1);
LABEL_33:
  uint64_t v25 = v11;
  result.value._rawValue = v25;
  result.is_nil = v8;
  return result;
}

unint64_t sub_255F21EBC(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    unint64_t v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  sub_255F24938();
  uint64_t v2 = sub_255F26BE0();
  unint64_t v3 = (void *)v2;
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
    sub_255F249A4(v6, (uint64_t)&v15, (uint64_t (*)(void))sub_255F24A0C);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_255F22454(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v3[6] + 16 * result);
    *uint64_t v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_255F24A78(&v17, (_OWORD *)(v3[7] + 32 * result));
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

uint64_t sub_255F21FF8@<X0>(uint64_t a1@<X8>)
{
  return sub_255F248D0(v1, a1, (uint64_t (*)(void))type metadata accessor for MentalHealthInjector);
}

uint64_t sub_255F2202C()
{
  uint64_t v1 = sub_255F1E6CC(v0);
  sub_255F24874(v0);
  return v1;
}

unint64_t sub_255F22064@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = (unint64_t)MentalHealthInjector.next()();
  *a1 = result;
  return result;
}

unint64_t sub_255F2208C()
{
  unint64_t result = qword_269F405A8;
  if (!qword_269F405A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269F405A8);
  }
  return result;
}

unint64_t sub_255F220E0()
{
  unint64_t result = qword_269F405B8;
  if (!qword_269F405B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269F405B8);
  }
  return result;
}

unint64_t sub_255F22134()
{
  unint64_t result = qword_269F405C8;
  if (!qword_269F405C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269F405C8);
  }
  return result;
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

void sub_255F221CC(uint64_t a1, unint64_t *a2, uint64_t (*a3)(void), uint64_t a4, uint64_t (*a5)(uint64_t, uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v9 = a3();
    unint64_t v10 = a5(a1, a4, v9);
    if (!v11) {
      atomic_store(v10, a2);
    }
  }
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

void sub_255F22284()
{
  if (!qword_269F405F0)
  {
    sub_255F222F4();
    sub_255F26B90();
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1) {
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_269F405F0);
    }
  }
}

unint64_t sub_255F222F4()
{
  unint64_t result = qword_269F405F8;
  if (!qword_269F405F8)
  {
    unint64_t result = swift_getExistentialMetatypeMetadata();
    atomic_store(result, (unint64_t *)&qword_269F405F8);
  }
  return result;
}

unint64_t sub_255F22338(unint64_t result)
{
  if (result)
  {
    unint64_t v1 = result;
    unint64_t v3 = 0;
    MEMORY[0x25A29D200](&v3, 8);
    unint64_t result = (v3 * (unsigned __int128)v1) >> 64;
    if (v3 * v1 < v1)
    {
      unint64_t v2 = -(uint64_t)v1 % v1;
      if (v2 > v3 * v1)
      {
        do
        {
          unint64_t v3 = 0;
          MEMORY[0x25A29D200](&v3, 8);
        }
        while (v2 > v3 * v1);
        return (v3 * (unsigned __int128)v1) >> 64;
      }
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

unint64_t sub_255F223C4(uint64_t a1, char a2)
{
  char v4 = a2 & 1;
  sub_255F26CA0();
  if ((a2 & 1) == 0) {
    sub_255F26CB0();
  }
  sub_255F26CB0();
  uint64_t v5 = sub_255F26CC0();
  return sub_255F224CC(a1, v4, v5);
}

unint64_t sub_255F22454(uint64_t a1, uint64_t a2)
{
  sub_255F26CA0();
  sub_255F26AA0();
  uint64_t v4 = sub_255F26CC0();
  return sub_255F22550(a1, a2, v4);
}

unint64_t sub_255F224CC(uint64_t a1, char a2, uint64_t a3)
{
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t result = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result))
  {
    uint64_t v7 = ~v5;
    do
    {
      uint64_t v8 = *(void *)(v3 + 48) + 16 * result;
      if (*(unsigned char *)(v8 + 8))
      {
        if (a2) {
          return result;
        }
      }
      else if ((a2 & 1) == 0 && *(void *)v8 == a1)
      {
        return result;
      }
      unint64_t result = (result + 1) & v7;
    }
    while (((*(void *)(v3 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result) & 1) != 0);
  }
  return result;
}

unint64_t sub_255F22550(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    unint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_255F26C70() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        BOOL v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_255F26C70() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_255F22634(uint64_t *a1, uint64_t a2)
{
  uint64_t v5 = *v2;
  sub_255F26CA0();
  sub_255F26CB0();
  uint64_t v6 = sub_255F26CC0();
  uint64_t v7 = -1 << *(unsigned char *)(v5 + 32);
  unint64_t v8 = v6 & ~v7;
  if (((*(void *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8) & 1) == 0)
  {
LABEL_7:
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v13 = *v2;
    uint64_t *v2 = 0x8000000000000000;
    sub_255F229FC(a2, v8, isUniquelyReferenced_nonNull_native);
    uint64_t *v2 = v13;
    swift_bridgeObjectRelease();
    uint64_t result = 1;
    goto LABEL_8;
  }
  uint64_t v9 = *(void *)(v5 + 48);
  if (*(void *)(v9 + 8 * v8) != a2)
  {
    uint64_t v10 = ~v7;
    do
    {
      unint64_t v8 = (v8 + 1) & v10;
      if (((*(void *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8) & 1) == 0) {
        goto LABEL_7;
      }
    }
    while (*(void *)(v9 + 8 * v8) != a2);
  }
  uint64_t result = 0;
  a2 = *(void *)(*(void *)(*v2 + 48) + 8 * v8);
LABEL_8:
  *a1 = a2;
  return result;
}

uint64_t sub_255F22754()
{
  unint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_255F24AF4();
  uint64_t result = sub_255F26B60();
  uint64_t v4 = result;
  if (*(void *)(v2 + 16))
  {
    int64_t v5 = 0;
    uint64_t v6 = (void *)(v2 + 56);
    uint64_t v7 = 1 << *(unsigned char *)(v2 + 32);
    if (v7 < 64) {
      uint64_t v8 = ~(-1 << v7);
    }
    else {
      uint64_t v8 = -1;
    }
    unint64_t v9 = v8 & *(void *)(v2 + 56);
    int64_t v10 = (unint64_t)(v7 + 63) >> 6;
    uint64_t v11 = result + 56;
    while (1)
    {
      if (v9)
      {
        unint64_t v13 = __clz(__rbit64(v9));
        v9 &= v9 - 1;
        unint64_t v14 = v13 | (v5 << 6);
      }
      else
      {
        int64_t v15 = v5 + 1;
        if (__OFADD__(v5, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v15 >= v10) {
          goto LABEL_33;
        }
        unint64_t v16 = v6[v15];
        ++v5;
        if (!v16)
        {
          int64_t v5 = v15 + 1;
          if (v15 + 1 >= v10) {
            goto LABEL_33;
          }
          unint64_t v16 = v6[v5];
          if (!v16)
          {
            int64_t v5 = v15 + 2;
            if (v15 + 2 >= v10) {
              goto LABEL_33;
            }
            unint64_t v16 = v6[v5];
            if (!v16)
            {
              int64_t v17 = v15 + 3;
              if (v17 >= v10)
              {
LABEL_33:
                uint64_t v26 = 1 << *(unsigned char *)(v2 + 32);
                if (v26 > 63) {
                  bzero((void *)(v2 + 56), ((unint64_t)(v26 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v6 = -1 << v26;
                }
                unint64_t v1 = v0;
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v16 = v6[v17];
              if (!v16)
              {
                while (1)
                {
                  int64_t v5 = v17 + 1;
                  if (__OFADD__(v17, 1)) {
                    goto LABEL_39;
                  }
                  if (v5 >= v10) {
                    goto LABEL_33;
                  }
                  unint64_t v16 = v6[v5];
                  ++v17;
                  if (v16) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v5 = v17;
            }
          }
        }
LABEL_23:
        unint64_t v9 = (v16 - 1) & v16;
        unint64_t v14 = __clz(__rbit64(v16)) + (v5 << 6);
      }
      uint64_t v18 = *(void *)(*(void *)(v2 + 48) + 8 * v14);
      sub_255F26CA0();
      sub_255F26CB0();
      uint64_t result = sub_255F26CC0();
      uint64_t v19 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v20 = result & ~v19;
      unint64_t v21 = v20 >> 6;
      if (((-1 << v20) & ~*(void *)(v11 + 8 * (v20 >> 6))) != 0)
      {
        unint64_t v12 = __clz(__rbit64((-1 << v20) & ~*(void *)(v11 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v22 = 0;
        unint64_t v23 = (unint64_t)(63 - v19) >> 6;
        do
        {
          if (++v21 == v23 && (v22 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v24 = v21 == v23;
          if (v21 == v23) {
            unint64_t v21 = 0;
          }
          v22 |= v24;
          uint64_t v25 = *(void *)(v11 + 8 * v21);
        }
        while (v25 == -1);
        unint64_t v12 = __clz(__rbit64(~v25)) + (v21 << 6);
      }
      *(void *)(v11 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
      *(void *)(*(void *)(v4 + 48) + 8 * v12) = v18;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  *unint64_t v1 = v4;
  return result;
}

uint64_t sub_255F229FC(uint64_t result, unint64_t a2, char a3)
{
  uint64_t v5 = result;
  unint64_t v6 = *(void *)(*v3 + 16);
  unint64_t v7 = *(void *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0) {
    goto LABEL_14;
  }
  if (a3)
  {
    sub_255F22754();
  }
  else
  {
    if (v7 > v6)
    {
      uint64_t result = (uint64_t)sub_255F22B4C();
      goto LABEL_14;
    }
    sub_255F22CE0();
  }
  uint64_t v8 = *v3;
  sub_255F26CA0();
  sub_255F26CB0();
  uint64_t result = sub_255F26CC0();
  uint64_t v9 = -1 << *(unsigned char *)(v8 + 32);
  a2 = result & ~v9;
  if ((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    uint64_t v10 = *(void *)(v8 + 48);
    if (*(void *)(v10 + 8 * a2) == v5)
    {
LABEL_13:
      type metadata accessor for Label(0);
      uint64_t result = sub_255F26C80();
      __break(1u);
    }
    else
    {
      uint64_t v11 = ~v9;
      while (1)
      {
        a2 = (a2 + 1) & v11;
        if (((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) == 0) {
          break;
        }
        if (*(void *)(v10 + 8 * a2) == v5) {
          goto LABEL_13;
        }
      }
    }
  }
LABEL_14:
  uint64_t v12 = *v3;
  *(void *)(*v3 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(void *)(*(void *)(v12 + 48) + 8 * a2) = v5;
  uint64_t v13 = *(void *)(v12 + 16);
  BOOL v14 = __OFADD__(v13, 1);
  uint64_t v15 = v13 + 1;
  if (v14) {
    __break(1u);
  }
  else {
    *(void *)(v12 + 16) = v15;
  }
  return result;
}

void *sub_255F22B4C()
{
  unint64_t v1 = v0;
  sub_255F24AF4();
  uint64_t v2 = *v0;
  uint64_t v3 = sub_255F26B50();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    uint64_t result = (void *)swift_release();
    *unint64_t v1 = v4;
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
    int64_t v16 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v16 >= v13) {
      goto LABEL_28;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v9;
    if (!v17)
    {
      int64_t v9 = v16 + 1;
      if (v16 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v9);
      if (!v17)
      {
        int64_t v9 = v16 + 2;
        if (v16 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v9);
        if (!v17) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v9 << 6);
LABEL_12:
    *(void *)(*(void *)(v4 + 48) + 8 * v15) = *(void *)(*(void *)(v2 + 48) + 8 * v15);
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v13) {
    goto LABEL_28;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    int64_t v9 = v18;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v9);
    ++v18;
    if (v17) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_255F22CE0()
{
  unint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_255F24AF4();
  uint64_t result = sub_255F26B60();
  uint64_t v4 = result;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    *unint64_t v1 = v4;
    return result;
  }
  int64_t v5 = 0;
  uint64_t v6 = v2 + 56;
  uint64_t v7 = 1 << *(unsigned char *)(v2 + 32);
  if (v7 < 64) {
    uint64_t v8 = ~(-1 << v7);
  }
  else {
    uint64_t v8 = -1;
  }
  unint64_t v9 = v8 & *(void *)(v2 + 56);
  int64_t v10 = (unint64_t)(v7 + 63) >> 6;
  uint64_t v11 = result + 56;
  while (1)
  {
    if (v9)
    {
      unint64_t v13 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      unint64_t v14 = v13 | (v5 << 6);
      goto LABEL_24;
    }
    int64_t v15 = v5 + 1;
    if (__OFADD__(v5, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v15 >= v10) {
      goto LABEL_33;
    }
    unint64_t v16 = *(void *)(v6 + 8 * v15);
    ++v5;
    if (!v16)
    {
      int64_t v5 = v15 + 1;
      if (v15 + 1 >= v10) {
        goto LABEL_33;
      }
      unint64_t v16 = *(void *)(v6 + 8 * v5);
      if (!v16)
      {
        int64_t v5 = v15 + 2;
        if (v15 + 2 >= v10) {
          goto LABEL_33;
        }
        unint64_t v16 = *(void *)(v6 + 8 * v5);
        if (!v16) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v9 = (v16 - 1) & v16;
    unint64_t v14 = __clz(__rbit64(v16)) + (v5 << 6);
LABEL_24:
    uint64_t v18 = *(void *)(*(void *)(v2 + 48) + 8 * v14);
    sub_255F26CA0();
    sub_255F26CB0();
    uint64_t result = sub_255F26CC0();
    uint64_t v19 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v20 = result & ~v19;
    unint64_t v21 = v20 >> 6;
    if (((-1 << v20) & ~*(void *)(v11 + 8 * (v20 >> 6))) != 0)
    {
      unint64_t v12 = __clz(__rbit64((-1 << v20) & ~*(void *)(v11 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v22 = 0;
      unint64_t v23 = (unint64_t)(63 - v19) >> 6;
      do
      {
        if (++v21 == v23 && (v22 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v24 = v21 == v23;
        if (v21 == v23) {
          unint64_t v21 = 0;
        }
        v22 |= v24;
        uint64_t v25 = *(void *)(v11 + 8 * v21);
      }
      while (v25 == -1);
      unint64_t v12 = __clz(__rbit64(~v25)) + (v21 << 6);
    }
    *(void *)(v11 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    *(void *)(*(void *)(v4 + 48) + 8 * v12) = v18;
    ++*(void *)(v4 + 16);
  }
  int64_t v17 = v15 + 3;
  if (v17 >= v10)
  {
LABEL_33:
    uint64_t result = swift_release();
    unint64_t v1 = v0;
    goto LABEL_35;
  }
  unint64_t v16 = *(void *)(v6 + 8 * v17);
  if (v16)
  {
    int64_t v5 = v17;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v5 = v17 + 1;
    if (__OFADD__(v17, 1)) {
      break;
    }
    if (v5 >= v10) {
      goto LABEL_33;
    }
    unint64_t v16 = *(void *)(v6 + 8 * v5);
    ++v17;
    if (v16) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

void *sub_255F22F58(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return (void *)MEMORY[0x263F8EE78];
  }
  sub_255F24A90(0, &qword_269F40688, (uint64_t (*)(uint64_t))type metadata accessor for Label, MEMORY[0x263F8E0F8]);
  uint64_t v3 = (void *)swift_allocObject();
  int64_t v4 = _swift_stdlib_malloc_size(v3);
  uint64_t v5 = v4 - 32;
  if (v4 < 32) {
    uint64_t v5 = v4 - 25;
  }
  v3[2] = v1;
  v3[3] = 2 * (v5 >> 3);
  uint64_t v6 = sub_255F1EF74(&v8, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  sub_255F24A88();
  if (v6 != (void *)v1)
  {
    __break(1u);
    return (void *)MEMORY[0x263F8EE78];
  }
  return v3;
}

uint64_t sub_255F2306C(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x6E69616D6F64 && a2 == 0xE600000000000000;
  if (v2 || (sub_255F26C70() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 1701736302 && a2 == 0xE400000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_255F26C70();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t type metadata accessor for MentalHealthInjector()
{
  uint64_t result = qword_269F40628;
  if (!qword_269F40628) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_255F23194(uint64_t a1)
{
  sub_255F24A90(0, (unint64_t *)&qword_269F40538, MEMORY[0x263F07490], MEMORY[0x263F8D8F0]);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_255F23220()
{
  unint64_t result = qword_269F40608;
  if (!qword_269F40608)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_269F40608);
  }
  return result;
}

unint64_t sub_255F23264()
{
  unint64_t result = qword_269F40618;
  if (!qword_269F40618)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269F40618);
  }
  return result;
}

uint64_t sub_255F232B8()
{
  return sub_255F24B88(&qword_269F40620, (void (*)(uint64_t))type metadata accessor for MentalHealthInjector);
}

void *initializeBufferWithCopyOfBuffer for MentalHealthInjector(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  int64_t v4 = (void *)a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v19 = *a2;
    *int64_t v4 = *a2;
    int64_t v4 = (void *)(v19 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
    uint64_t v6 = a2[3];
    *(void *)(a1 + 16) = a2[2];
    *(void *)(a1 + 24) = v6;
    *(_OWORD *)(a1 + 32) = *((_OWORD *)a2 + 2);
    uint64_t v7 = *(int *)(a3 + 28);
    uint64_t v8 = a1 + v7;
    uint64_t v9 = (uint64_t)a2 + v7;
    *(_OWORD *)(a1 + v7) = *(_OWORD *)((char *)a2 + v7);
    int64_t v10 = (int *)type metadata accessor for MentalHealthInjector.Configuration();
    uint64_t v11 = v10[6];
    uint64_t v21 = v9 + v11;
    uint64_t v23 = v8 + v11;
    uint64_t v26 = sub_255F26A10();
    uint64_t v25 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v26 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v25(v23, v21, v26);
    *(void *)(v8 + v10[7]) = *(void *)(v9 + v10[7]);
    *(void *)(v8 + v10[8]) = *(void *)(v9 + v10[8]);
    *(_OWORD *)(v8 + v10[9]) = *(_OWORD *)(v9 + v10[9]);
    *(void *)(v8 + v10[10]) = *(void *)(v9 + v10[10]);
    uint64_t v12 = _s13DateGeneratorVMa();
    uint64_t v13 = *(int *)(v12 + 20);
    uint64_t v22 = v9 + v13;
    uint64_t v24 = v8 + v13;
    uint64_t v14 = sub_255F26A50();
    int64_t v15 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 16);
    swift_bridgeObjectRetain();
    v15(v24, v22, v14);
    *(void *)(v8 + *(int *)(v12 + 24)) = *(void *)(v9 + *(int *)(v12 + 24));
    uint64_t v16 = *(int *)(a3 + 32);
    int64_t v17 = (char *)v4 + v16;
    uint64_t v18 = (_OWORD *)((char *)a2 + v16);
    *(_OWORD *)((char *)v4 + v16) = *v18;
    v25((uint64_t)v4 + v16 + v10[6], (uint64_t)v18 + v10[6], v26);
    *(void *)&v17[v10[7]] = *(void *)((char *)v18 + v10[7]);
    *(void *)&v17[v10[8]] = *(void *)((char *)v18 + v10[8]);
    *(_OWORD *)&v17[v10[9]] = *(_OWORD *)((char *)v18 + v10[9]);
    *(void *)&v17[v10[10]] = *(void *)((char *)v18 + v10[10]);
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t destroy for MentalHealthInjector(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 28);
  uint64_t v5 = type metadata accessor for MentalHealthInjector.Configuration();
  uint64_t v6 = v4 + *(int *)(v5 + 24);
  uint64_t v7 = sub_255F26A10();
  uint64_t v8 = *(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8);
  v8(v6, v7);
  swift_bridgeObjectRelease();
  uint64_t v9 = v4 + *(int *)(_s13DateGeneratorVMa() + 20);
  uint64_t v10 = sub_255F26A50();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8))(v9, v10);
  v8(a1 + *(int *)(a2 + 32) + *(int *)(v5 + 24), v7);
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for MentalHealthInjector(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  uint64_t v6 = *(int *)(a3 + 28);
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  *(_OWORD *)(a1 + v6) = *(_OWORD *)(a2 + v6);
  uint64_t v9 = (int *)type metadata accessor for MentalHealthInjector.Configuration();
  uint64_t v10 = v9[6];
  uint64_t v19 = (char *)(v8 + v10);
  uint64_t v21 = v7 + v10;
  uint64_t v24 = sub_255F26A10();
  uint64_t v23 = *(void (**)(uint64_t, char *, uint64_t))(*(void *)(v24 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v23(v21, v19, v24);
  *(void *)(v7 + v9[7]) = *(void *)(v8 + v9[7]);
  *(void *)(v7 + v9[8]) = *(void *)(v8 + v9[8]);
  *(_OWORD *)(v7 + v9[9]) = *(_OWORD *)(v8 + v9[9]);
  *(void *)(v7 + v9[10]) = *(void *)(v8 + v9[10]);
  uint64_t v11 = _s13DateGeneratorVMa();
  uint64_t v12 = *(int *)(v11 + 20);
  uint64_t v20 = v8 + v12;
  uint64_t v22 = v7 + v12;
  uint64_t v13 = sub_255F26A50();
  uint64_t v14 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 16);
  swift_bridgeObjectRetain();
  v14(v22, v20, v13);
  *(void *)(v7 + *(int *)(v11 + 24)) = *(void *)(v8 + *(int *)(v11 + 24));
  uint64_t v15 = *(int *)(a3 + 32);
  uint64_t v16 = a1 + v15;
  int64_t v17 = (char *)(a2 + v15);
  *(_OWORD *)(a1 + v15) = *(_OWORD *)v17;
  v23(a1 + v15 + v9[6], &v17[v9[6]], v24);
  *(void *)(v16 + v9[7]) = *(void *)&v17[v9[7]];
  *(void *)(v16 + v9[8]) = *(void *)&v17[v9[8]];
  *(_OWORD *)(v16 + v9[9]) = *(_OWORD *)&v17[v9[9]];
  *(void *)(v16 + v9[10]) = *(void *)&v17[v9[10]];
  swift_bridgeObjectRetain();
  return a1;
}

char *assignWithCopy for MentalHealthInjector(char *a1, void *a2, uint64_t a3)
{
  *(void *)a1 = *a2;
  *((void *)a1 + 1) = a2[1];
  *((void *)a1 + 2) = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((void *)a1 + 3) = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((void *)a1 + 4) = a2[4];
  *((void *)a1 + 5) = a2[5];
  uint64_t v6 = *(int *)(a3 + 28);
  uint64_t v7 = &a1[v6];
  uint64_t v8 = (char *)a2 + v6;
  *(void *)uint64_t v7 = *(void *)((char *)a2 + v6);
  *((void *)v7 + 1) = *(void *)((char *)a2 + v6 + 8);
  uint64_t v9 = (int *)type metadata accessor for MentalHealthInjector.Configuration();
  uint64_t v10 = v9[6];
  uint64_t v11 = &v7[v10];
  uint64_t v12 = &v8[v10];
  uint64_t v13 = sub_255F26A10();
  uint64_t v29 = *(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 24);
  v29(v11, v12, v13);
  *(void *)&v7[v9[7]] = *(void *)&v8[v9[7]];
  *(void *)&v7[v9[8]] = *(void *)&v8[v9[8]];
  uint64_t v14 = v9[9];
  uint64_t v15 = &v7[v14];
  uint64_t v16 = &v8[v14];
  *(void *)uint64_t v15 = *(void *)v16;
  *((void *)v15 + 1) = *((void *)v16 + 1);
  *(void *)&v7[v9[10]] = *(void *)&v8[v9[10]];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v17 = _s13DateGeneratorVMa();
  uint64_t v18 = *(int *)(v17 + 20);
  uint64_t v19 = &v7[v18];
  uint64_t v20 = &v8[v18];
  uint64_t v21 = sub_255F26A50();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v21 - 8) + 24))(v19, v20, v21);
  *(void *)&v7[*(int *)(v17 + 24)] = *(void *)&v8[*(int *)(v17 + 24)];
  uint64_t v22 = *(int *)(a3 + 32);
  uint64_t v23 = &a1[v22];
  uint64_t v24 = (char *)a2 + v22;
  *(void *)uint64_t v23 = *(void *)v24;
  *((void *)v23 + 1) = *((void *)v24 + 1);
  v29(&a1[v22 + v9[6]], &v24[v9[6]], v13);
  *(void *)&v23[v9[7]] = *(void *)&v24[v9[7]];
  *(void *)&v23[v9[8]] = *(void *)&v24[v9[8]];
  uint64_t v25 = v9[9];
  uint64_t v26 = &v23[v25];
  uint64_t v27 = &v24[v25];
  *(void *)uint64_t v26 = *(void *)v27;
  *((void *)v26 + 1) = *((void *)v27 + 1);
  *(void *)&v23[v9[10]] = *(void *)&v24[v9[10]];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

char *initializeWithTake for MentalHealthInjector(char *a1, _OWORD *a2, uint64_t a3)
{
  long long v5 = a2[1];
  *(_OWORD *)a1 = *a2;
  *((_OWORD *)a1 + 1) = v5;
  *((_OWORD *)a1 + 2) = a2[2];
  uint64_t v6 = *(int *)(a3 + 28);
  uint64_t v7 = &a1[v6];
  uint64_t v8 = (char *)a2 + v6;
  *(_OWORD *)&a1[v6] = *(_OWORD *)((char *)a2 + v6);
  uint64_t v9 = (int *)type metadata accessor for MentalHealthInjector.Configuration();
  uint64_t v10 = v9[6];
  uint64_t v11 = &v7[v10];
  uint64_t v12 = &v8[v10];
  uint64_t v13 = sub_255F26A10();
  uint64_t v23 = *(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 32);
  v23(v11, v12, v13);
  *(void *)&v7[v9[7]] = *(void *)&v8[v9[7]];
  *(void *)&v7[v9[8]] = *(void *)&v8[v9[8]];
  *(_OWORD *)&v7[v9[9]] = *(_OWORD *)&v8[v9[9]];
  *(void *)&v7[v9[10]] = *(void *)&v8[v9[10]];
  uint64_t v14 = _s13DateGeneratorVMa();
  uint64_t v15 = *(int *)(v14 + 20);
  uint64_t v16 = &v7[v15];
  uint64_t v17 = &v8[v15];
  uint64_t v18 = sub_255F26A50();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v18 - 8) + 32))(v16, v17, v18);
  *(void *)&v7[*(int *)(v14 + 24)] = *(void *)&v8[*(int *)(v14 + 24)];
  uint64_t v19 = *(int *)(a3 + 32);
  uint64_t v20 = &a1[v19];
  uint64_t v21 = (char *)a2 + v19;
  *(_OWORD *)&a1[v19] = *(_OWORD *)v21;
  v23(&a1[v19 + v9[6]], &v21[v9[6]], v13);
  *(void *)&v20[v9[7]] = *(void *)&v21[v9[7]];
  *(void *)&v20[v9[8]] = *(void *)&v21[v9[8]];
  *(_OWORD *)&v20[v9[9]] = *(_OWORD *)&v21[v9[9]];
  *(void *)&v20[v9[10]] = *(void *)&v21[v9[10]];
  return a1;
}

uint64_t assignWithTake for MentalHealthInjector(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  uint64_t v6 = *(int *)(a3 + 28);
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  *(_OWORD *)(a1 + v6) = *(_OWORD *)(a2 + v6);
  uint64_t v9 = (int *)type metadata accessor for MentalHealthInjector.Configuration();
  uint64_t v10 = v9[6];
  uint64_t v11 = v7 + v10;
  uint64_t v12 = (char *)(v8 + v10);
  uint64_t v13 = sub_255F26A10();
  uint64_t v23 = *(void (**)(uint64_t, char *, uint64_t))(*(void *)(v13 - 8) + 40);
  v23(v11, v12, v13);
  *(void *)(v7 + v9[7]) = *(void *)(v8 + v9[7]);
  *(void *)(v7 + v9[8]) = *(void *)(v8 + v9[8]);
  *(_OWORD *)(v7 + v9[9]) = *(_OWORD *)(v8 + v9[9]);
  *(void *)(v7 + v9[10]) = *(void *)(v8 + v9[10]);
  swift_bridgeObjectRelease();
  uint64_t v14 = _s13DateGeneratorVMa();
  uint64_t v15 = *(int *)(v14 + 20);
  uint64_t v16 = v7 + v15;
  uint64_t v17 = v8 + v15;
  uint64_t v18 = sub_255F26A50();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 40))(v16, v17, v18);
  *(void *)(v7 + *(int *)(v14 + 24)) = *(void *)(v8 + *(int *)(v14 + 24));
  uint64_t v19 = *(int *)(a3 + 32);
  uint64_t v20 = a1 + v19;
  uint64_t v21 = (char *)(a2 + v19);
  *(_OWORD *)(a1 + v19) = *(_OWORD *)v21;
  v23(a1 + v19 + v9[6], &v21[v9[6]], v13);
  *(void *)(v20 + v9[7]) = *(void *)&v21[v9[7]];
  *(void *)(v20 + v9[8]) = *(void *)&v21[v9[8]];
  *(_OWORD *)(v20 + v9[9]) = *(_OWORD *)&v21[v9[9]];
  *(void *)(v20 + v9[10]) = *(void *)&v21[v9[10]];
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for MentalHealthInjector(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_255F23EB8);
}

uint64_t sub_255F23EB8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 16);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = _s13DateGeneratorVMa();
    uint64_t v9 = *(void *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a2)
    {
      uint64_t v10 = v8;
      uint64_t v11 = a1 + *(int *)(a3 + 28);
      uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 48);
      return v12(v11, a2, v10);
    }
    else
    {
      uint64_t v13 = _s16ValenceGeneratorVMa();
      uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 48);
      uint64_t v15 = v13;
      uint64_t v16 = a1 + *(int *)(a3 + 32);
      return v14(v16, a2, v15);
    }
  }
}

uint64_t storeEnumTagSinglePayload for MentalHealthInjector(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_255F23FF8);
}

uint64_t sub_255F23FF8(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 16) = (a2 - 1);
  }
  else
  {
    uint64_t v8 = _s13DateGeneratorVMa();
    uint64_t v9 = *(void *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      uint64_t v10 = v8;
      uint64_t v11 = v5 + *(int *)(a4 + 28);
      uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
      return v12(v11, a2, a2, v10);
    }
    else
    {
      uint64_t v13 = _s16ValenceGeneratorVMa();
      uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56);
      uint64_t v15 = v13;
      uint64_t v16 = v5 + *(int *)(a4 + 32);
      return v14(v16, a2, a2, v15);
    }
  }
  return result;
}

uint64_t sub_255F24124()
{
  uint64_t result = _s13DateGeneratorVMa();
  if (v1 <= 0x3F)
  {
    uint64_t result = type metadata accessor for MentalHealthInjector.Configuration();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t __swift_memcpy9_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *(unsigned char *)(result + 8) = *((unsigned char *)a2 + 8);
  *(void *)uint64_t result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for MentalHealthInjector.StateOfMindDomainOrNone(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 9)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for MentalHealthInjector.StateOfMindDomainOrNone(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)uint64_t result = 0;
    *(unsigned char *)(result + 8) = 0;
    *(_DWORD *)uint64_t result = a2 - 1;
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 9) = v3;
  return result;
}

uint64_t sub_255F24270(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 8)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_255F24290(uint64_t result, int a2)
{
  if (a2)
  {
    *(void *)uint64_t result = (a2 - 1);
    *(unsigned char *)(result + 8) = 1;
  }
  else
  {
    *(unsigned char *)(result + 8) = 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for MentalHealthInjector.StateOfMindDomainOrNone()
{
  return &type metadata for MentalHealthInjector.StateOfMindDomainOrNone;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for MentalHealthInjector.StateOfMindDomainOrNone.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFF) {
    goto LABEL_17;
  }
  if (a2 + 1 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 1;
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
      return (*a1 | (v4 << 8)) - 1;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 2;
  int v8 = v6 - 2;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for MentalHealthInjector.StateOfMindDomainOrNone.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFE)
  {
    unsigned int v6 = ((a2 - 255) >> 8) + 1;
    *uint64_t result = a2 + 1;
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
        JUMPOUT(0x255F24428);
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
          *uint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

uint64_t sub_255F24450(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_255F24458(unsigned char *result, char a2)
{
  *uint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for MentalHealthInjector.StateOfMindDomainOrNone.CodingKeys()
{
  return &type metadata for MentalHealthInjector.StateOfMindDomainOrNone.CodingKeys;
}

uint64_t getEnumTagSinglePayload for MentalHealthInjector.StateOfMindDomainOrNone.DomainCodingKeys(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for MentalHealthInjector.StateOfMindDomainOrNone.DomainCodingKeys(unsigned char *result, int a2, int a3)
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
        *uint64_t result = a2;
        return result;
      case 2:
        *(_WORD *)uint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)uint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *uint64_t result = 0;
      break;
    case 2:
      *(_WORD *)uint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x255F24564);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_255F2458C()
{
  return 0;
}

ValueMetadata *type metadata accessor for MentalHealthInjector.StateOfMindDomainOrNone.DomainCodingKeys()
{
  return &type metadata for MentalHealthInjector.StateOfMindDomainOrNone.DomainCodingKeys;
}

ValueMetadata *type metadata accessor for MentalHealthInjector.StateOfMindDomainOrNone.NoneCodingKeys()
{
  return &type metadata for MentalHealthInjector.StateOfMindDomainOrNone.NoneCodingKeys;
}

unint64_t sub_255F245B8()
{
  unint64_t result = qword_269F40638;
  if (!qword_269F40638)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269F40638);
  }
  return result;
}

unint64_t sub_255F24610()
{
  unint64_t result = qword_269F40640;
  if (!qword_269F40640)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269F40640);
  }
  return result;
}

unint64_t sub_255F24668()
{
  unint64_t result = qword_269F40648;
  if (!qword_269F40648)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269F40648);
  }
  return result;
}

unint64_t sub_255F246C0()
{
  unint64_t result = qword_269F40650;
  if (!qword_269F40650)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269F40650);
  }
  return result;
}

unint64_t sub_255F24718()
{
  unint64_t result = qword_269F40658;
  if (!qword_269F40658)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269F40658);
  }
  return result;
}

unint64_t sub_255F24770()
{
  unint64_t result = qword_269F40660;
  if (!qword_269F40660)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269F40660);
  }
  return result;
}

unint64_t sub_255F247C8()
{
  unint64_t result = qword_269F40668;
  if (!qword_269F40668)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269F40668);
  }
  return result;
}

unint64_t sub_255F24820()
{
  unint64_t result = qword_269F40670;
  if (!qword_269F40670)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269F40670);
  }
  return result;
}

uint64_t sub_255F24874(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for MentalHealthInjector();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_255F248D0(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

void sub_255F24938()
{
  if (!qword_269F40678)
  {
    unint64_t v0 = sub_255F26BF0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_269F40678);
    }
  }
}

uint64_t sub_255F249A4(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

void sub_255F24A0C()
{
  if (!qword_269F40680)
  {
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1) {
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_269F40680);
    }
  }
}

_OWORD *sub_255F24A78(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_255F24A88()
{
  return swift_release();
}

void sub_255F24A90(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v7 = a3(255);
    unint64_t v8 = a4(a1, v7);
    if (!v9) {
      atomic_store(v8, a2);
    }
  }
}

void sub_255F24AF4()
{
  if (!qword_269F40690)
  {
    type metadata accessor for Label(255);
    sub_255F24B88(&qword_269F40698, type metadata accessor for Label);
    unint64_t v0 = sub_255F26B70();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_269F40690);
    }
  }
}

uint64_t sub_255F24B88(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t _s7CounterVwCP(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t _s7CounterVwxx()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t _s7CounterVwcp(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *_s7CounterVwca(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  return a1;
}

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

_OWORD *_s7CounterVwta(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  return a1;
}

uint64_t _s7CounterVwet(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 32)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t _s7CounterVwst(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 32) = 1;
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
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 32) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *_s7CounterVMa()
{
  return &_s7CounterVN;
}

uint64_t sub_255F24DDC@<X0>(uint64_t a1@<X8>)
{
  uint64_t result = v1[3];
  uint64_t v4 = result - 1;
  if (result < 1) {
    goto LABEL_34;
  }
  uint64_t v5 = v1;
  uint64_t result = sub_255F22334(result);
  uint64_t v6 = v1[2];
  if (v6) {
    BOOL v7 = result < v6;
  }
  else {
    BOOL v7 = 0;
  }
  if (v7)
  {
    uint64_t v28 = v1[1];
    unint64_t v29 = *(void *)(v28 + 16);
    if (v29)
    {
      swift_bridgeObjectRetain();
      uint64_t result = sub_255F22338(v29);
      if (result < 0)
      {
LABEL_43:
        __break(1u);
      }
      else if ((unint64_t)result < *(void *)(v28 + 16))
      {
        uint64_t v30 = v28 + 16 * result;
        uint64_t v25 = *(void *)(v30 + 32);
        char v26 = *(unsigned char *)(v30 + 40);
        uint64_t result = swift_bridgeObjectRelease();
        v5[2] = v6 - 1;
        goto LABEL_37;
      }
      __break(1u);
      goto LABEL_45;
    }
LABEL_34:
    uint64_t v25 = 0;
    char v26 = 0;
    char v31 = 1;
    goto LABEL_38;
  }
  int64_t v8 = 0;
  uint64_t v9 = *v1;
  uint64_t v10 = *v1 + 64;
  uint64_t v11 = 1 << *(unsigned char *)(*v1 + 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & *(void *)(*v1 + 64);
  int64_t v14 = (unint64_t)(v11 + 63) >> 6;
  do
  {
    if (v13)
    {
      unint64_t v15 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v16 = v15 | (v8 << 6);
    }
    else
    {
      int64_t v17 = v8 + 1;
      if (__OFADD__(v8, 1)) {
        goto LABEL_40;
      }
      if (v17 >= v14) {
        goto LABEL_34;
      }
      unint64_t v18 = *(void *)(v10 + 8 * v17);
      ++v8;
      if (!v18)
      {
        int64_t v8 = v17 + 1;
        if (v17 + 1 >= v14) {
          goto LABEL_34;
        }
        unint64_t v18 = *(void *)(v10 + 8 * v8);
        if (!v18)
        {
          int64_t v8 = v17 + 2;
          if (v17 + 2 >= v14) {
            goto LABEL_34;
          }
          unint64_t v18 = *(void *)(v10 + 8 * v8);
          if (!v18)
          {
            int64_t v19 = v17 + 3;
            if (v19 >= v14) {
              goto LABEL_34;
            }
            unint64_t v18 = *(void *)(v10 + 8 * v19);
            if (!v18)
            {
              while (1)
              {
                int64_t v8 = v19 + 1;
                if (__OFADD__(v19, 1)) {
                  goto LABEL_41;
                }
                if (v8 >= v14) {
                  goto LABEL_34;
                }
                unint64_t v18 = *(void *)(v10 + 8 * v8);
                ++v19;
                if (v18) {
                  goto LABEL_24;
                }
              }
            }
            int64_t v8 = v19;
          }
        }
      }
LABEL_24:
      unint64_t v20 = __clz(__rbit64(v18));
      unint64_t v13 = (v18 - 1) & v18;
      unint64_t v16 = v20 + (v8 << 6);
    }
    uint64_t v21 = *(void *)(*(void *)(v9 + 56) + 8 * v16);
    BOOL v22 = __OFADD__(v6, v21);
    v6 += v21;
    if (v22)
    {
      __break(1u);
LABEL_40:
      __break(1u);
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      goto LABEL_43;
    }
  }
  while (result >= v6);
  uint64_t v23 = v21 - 1;
  if (__OFSUB__(v21, 1)) {
    goto LABEL_42;
  }
  uint64_t v24 = *(void *)(v9 + 48) + 16 * v16;
  uint64_t v25 = *(void *)v24;
  char v26 = *(unsigned char *)(v24 + 8);
  if (v21 == 1)
  {
    swift_bridgeObjectRetain();
    sub_255F25060(v25, v26);
    uint64_t result = swift_release();
  }
  else
  {
    swift_bridgeObjectRetain();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v33 = *v1;
    *uint64_t v1 = 0x8000000000000000;
    sub_255F255EC(v23, v25, v26, isUniquelyReferenced_nonNull_native);
    *uint64_t v1 = v33;
    swift_release();
    uint64_t result = swift_bridgeObjectRelease();
  }
  uint64_t v32 = v1[3];
  uint64_t v4 = v32 - 1;
  if (__OFSUB__(v32, 1))
  {
LABEL_45:
    __break(1u);
    return result;
  }
LABEL_37:
  char v31 = 0;
  v5[3] = v4;
LABEL_38:
  *(void *)a1 = v25;
  *(unsigned char *)(a1 + 8) = v26;
  *(unsigned char *)(a1 + 9) = v31;
  return result;
}

uint64_t sub_255F25060(uint64_t a1, char a2)
{
  long long v3 = v2;
  unint64_t v4 = sub_255F223C4(a1, a2 & 1);
  if ((v5 & 1) == 0) {
    return 0;
  }
  unint64_t v6 = v4;
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v8 = *v2;
  uint64_t v11 = *v3;
  uint64_t *v3 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_255F25768();
    uint64_t v8 = v11;
  }
  uint64_t v9 = *(void *)(*(void *)(v8 + 56) + 8 * v6);
  sub_255F25400(v6, v8);
  uint64_t *v3 = v8;
  swift_bridgeObjectRelease();
  return v9;
}

uint64_t sub_255F25110(uint64_t a1, char a2)
{
  long long v3 = v2;
  uint64_t v5 = *v2;
  sub_255F259FC();
  uint64_t result = sub_255F26BD0();
  uint64_t v7 = result;
  if (*(void *)(v5 + 16))
  {
    char v32 = a2;
    int64_t v8 = 0;
    char v34 = (void *)(v5 + 64);
    uint64_t v9 = 1 << *(unsigned char *)(v5 + 32);
    if (v9 < 64) {
      uint64_t v10 = ~(-1 << v9);
    }
    else {
      uint64_t v10 = -1;
    }
    unint64_t v11 = v10 & *(void *)(v5 + 64);
    int64_t v33 = (unint64_t)(v9 + 63) >> 6;
    uint64_t v12 = result + 64;
    while (1)
    {
      if (v11)
      {
        unint64_t v15 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        unint64_t v16 = v15 | (v8 << 6);
      }
      else
      {
        int64_t v17 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
          return result;
        }
        uint64_t result = v5 + 64;
        if (v17 >= v33) {
          goto LABEL_33;
        }
        unint64_t v18 = v34[v17];
        ++v8;
        if (!v18)
        {
          int64_t v8 = v17 + 1;
          if (v17 + 1 >= v33) {
            goto LABEL_33;
          }
          unint64_t v18 = v34[v8];
          if (!v18)
          {
            int64_t v19 = v17 + 2;
            if (v19 >= v33)
            {
LABEL_33:
              if ((v32 & 1) == 0)
              {
                uint64_t result = swift_release();
                long long v3 = v2;
                goto LABEL_40;
              }
              uint64_t v31 = 1 << *(unsigned char *)(v5 + 32);
              if (v31 >= 64) {
                bzero(v34, ((unint64_t)(v31 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              }
              else {
                *char v34 = -1 << v31;
              }
              long long v3 = v2;
              *(void *)(v5 + 16) = 0;
              break;
            }
            unint64_t v18 = v34[v19];
            if (!v18)
            {
              while (1)
              {
                int64_t v8 = v19 + 1;
                if (__OFADD__(v19, 1)) {
                  goto LABEL_42;
                }
                if (v8 >= v33) {
                  goto LABEL_33;
                }
                unint64_t v18 = v34[v8];
                ++v19;
                if (v18) {
                  goto LABEL_21;
                }
              }
            }
            int64_t v8 = v19;
          }
        }
LABEL_21:
        unint64_t v11 = (v18 - 1) & v18;
        unint64_t v16 = __clz(__rbit64(v18)) + (v8 << 6);
      }
      uint64_t v20 = *(void *)(v5 + 48) + 16 * v16;
      char v21 = *(unsigned char *)(v20 + 8);
      uint64_t v22 = *(void *)v20;
      uint64_t v23 = *(void *)(*(void *)(v5 + 56) + 8 * v16);
      sub_255F26CA0();
      if ((v21 & 1) == 0) {
        sub_255F26CB0();
      }
      sub_255F26CB0();
      uint64_t result = sub_255F26CC0();
      uint64_t v24 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v25 = result & ~v24;
      unint64_t v26 = v25 >> 6;
      if (((-1 << v25) & ~*(void *)(v12 + 8 * (v25 >> 6))) != 0)
      {
        unint64_t v13 = __clz(__rbit64((-1 << v25) & ~*(void *)(v12 + 8 * (v25 >> 6)))) | v25 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v27 = 0;
        unint64_t v28 = (unint64_t)(63 - v24) >> 6;
        do
        {
          if (++v26 == v28 && (v27 & 1) != 0)
          {
            __break(1u);
            goto LABEL_41;
          }
          BOOL v29 = v26 == v28;
          if (v26 == v28) {
            unint64_t v26 = 0;
          }
          v27 |= v29;
          uint64_t v30 = *(void *)(v12 + 8 * v26);
        }
        while (v30 == -1);
        unint64_t v13 = __clz(__rbit64(~v30)) + (v26 << 6);
      }
      *(void *)(v12 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
      uint64_t v14 = *(void *)(v7 + 48) + 16 * v13;
      *(void *)uint64_t v14 = v22;
      *(unsigned char *)(v14 + 8) = v21;
      *(void *)(*(void *)(v7 + 56) + 8 * v13) = v23;
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
LABEL_40:
  uint64_t *v3 = v7;
  return result;
}

unint64_t sub_255F25400(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_255F26B40();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        uint64_t v9 = 16 * v6;
        char v10 = *(unsigned char *)(*(void *)(a2 + 48) + 16 * v6 + 8);
        sub_255F26CA0();
        if ((v10 & 1) == 0) {
          sub_255F26CB0();
        }
        sub_255F26CB0();
        uint64_t result = sub_255F26CC0();
        unint64_t v11 = result & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v11 < v8) {
            goto LABEL_5;
          }
        }
        else if (v11 >= v8)
        {
          goto LABEL_13;
        }
        if (v3 >= (uint64_t)v11)
        {
LABEL_13:
          uint64_t v12 = *(void *)(a2 + 48);
          unint64_t v13 = (_OWORD *)(v12 + 16 * v3);
          uint64_t v14 = (_OWORD *)(v12 + v9);
          if (16 * v3 != v9 || v13 >= v14 + 1) {
            *unint64_t v13 = *v14;
          }
          uint64_t v15 = *(void *)(a2 + 56);
          unint64_t v16 = (void *)(v15 + 8 * v3);
          int64_t v17 = (void *)(v15 + 8 * v6);
          if (v3 != v6 || (int64_t v3 = v6, v16 >= v17 + 1))
          {
            void *v16 = *v17;
            int64_t v3 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    unint64_t v18 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v19 = *v18;
    uint64_t v20 = (-1 << v3) - 1;
  }
  else
  {
    unint64_t v18 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v20 = *v18;
    uint64_t v19 = (-1 << result) - 1;
  }
  *unint64_t v18 = v20 & v19;
  uint64_t v21 = *(void *)(a2 + 16);
  BOOL v22 = __OFSUB__(v21, 1);
  uint64_t v23 = v21 - 1;
  if (v22)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v23;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

uint64_t sub_255F255EC(uint64_t a1, uint64_t a2, char a3, char a4)
{
  uint64_t v5 = (void **)v4;
  char v9 = a3 & 1;
  char v10 = (void *)*v4;
  unint64_t v12 = sub_255F223C4(a2, a3 & 1);
  uint64_t v13 = v10[2];
  BOOL v14 = (v11 & 1) == 0;
  uint64_t result = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_15;
  }
  char v16 = v11;
  uint64_t v17 = v10[3];
  if (v17 >= result && (a4 & 1) != 0)
  {
LABEL_7:
    unint64_t v18 = *v5;
    if (v16)
    {
LABEL_8:
      *(void *)(v18[7] + 8 * v12) = a1;
      return result;
    }
    goto LABEL_11;
  }
  if (v17 >= result && (a4 & 1) == 0)
  {
    uint64_t result = (uint64_t)sub_255F25768();
    goto LABEL_7;
  }
  sub_255F25110(result, a4 & 1);
  uint64_t result = sub_255F223C4(a2, v9);
  if ((v16 & 1) != (v19 & 1))
  {
LABEL_15:
    uint64_t result = sub_255F26C90();
    __break(1u);
    return result;
  }
  unint64_t v12 = result;
  unint64_t v18 = *v5;
  if (v16) {
    goto LABEL_8;
  }
LABEL_11:
  return sub_255F25718(v12, a2, v9, a1, v18);
}

unint64_t sub_255F25718(unint64_t result, uint64_t a2, char a3, uint64_t a4, void *a5)
{
  a5[(result >> 6) + 8] |= 1 << result;
  uint64_t v5 = a5[6] + 16 * result;
  *(void *)uint64_t v5 = a2;
  *(unsigned char *)(v5 + 8) = a3 & 1;
  *(void *)(a5[7] + 8 * result) = a4;
  uint64_t v6 = a5[2];
  BOOL v7 = __OFADD__(v6, 1);
  uint64_t v8 = v6 + 1;
  if (v7) {
    __break(1u);
  }
  else {
    a5[2] = v8;
  }
  return result;
}

void *sub_255F25768()
{
  uint64_t v1 = v0;
  sub_255F259FC();
  uint64_t v2 = *v0;
  uint64_t v3 = sub_255F26BC0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
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
    unint64_t v25 = __clz(__rbit64(v23));
    unint64_t v12 = (v23 - 1) & v23;
    unint64_t v15 = v25 + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = *(void *)(v2 + 48) + 16 * v15;
    uint64_t v18 = *(void *)v17;
    LOBYTE(v17) = *(unsigned char *)(v17 + 8);
    uint64_t v19 = 8 * v15;
    uint64_t v20 = *(void *)(*(void *)(v2 + 56) + v19);
    uint64_t v21 = *(void *)(v4 + 48) + v16;
    *(void *)uint64_t v21 = v18;
    *(unsigned char *)(v21 + 8) = v17;
    *(void *)(*(void *)(v4 + 56) + v19) = v20;
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

char *sub_255F25908(char *result, int64_t a2, char a3, char *a4)
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
    sub_255F26008();
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
  int64_t v13 = v10 + 32;
  unint64_t v14 = a4 + 32;
  size_t v15 = 16 * v8;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[v15]) {
      memmove(v13, v14, v15);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, v15);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void sub_255F259FC()
{
  if (!qword_269F406A0)
  {
    sub_255F25A60();
    unint64_t v0 = sub_255F26BF0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_269F406A0);
    }
  }
}

unint64_t sub_255F25A60()
{
  unint64_t result = qword_269F406A8;
  if (!qword_269F406A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269F406A8);
  }
  return result;
}

uint64_t sub_255F25AB4(uint64_t a1)
{
  uint64_t v2 = sub_255F26B20();
  uint64_t v3 = v2;
  uint64_t v4 = *(void *)(v2 + 16);
  if (v4)
  {
    unint64_t v5 = 0;
    uint64_t v6 = a1 + 64;
    uint64_t v7 = v2 + 32;
    uint64_t v8 = (char *)MEMORY[0x263F8EE78];
    uint64_t v39 = v2 + 32;
    while (1)
    {
      if (v5 >= *(void *)(v3 + 16)) {
        goto LABEL_69;
      }
      int64_t v10 = 0;
      uint64_t v11 = *(void *)(v7 + 8 * v5++);
      uint64_t v12 = 1 << *(unsigned char *)(a1 + 32);
      uint64_t v13 = v12 < 64 ? ~(-1 << v12) : -1;
      unint64_t v14 = v13 & *(void *)(a1 + 64);
      int64_t v15 = (unint64_t)(v12 + 63) >> 6;
      while (1)
      {
        if (v14)
        {
          unint64_t v16 = __clz(__rbit64(v14));
          v14 &= v14 - 1;
          unint64_t v17 = v16 | (v10 << 6);
          goto LABEL_30;
        }
        int64_t v18 = v10 + 1;
        if (__OFADD__(v10, 1))
        {
          __break(1u);
LABEL_69:
          __break(1u);
LABEL_70:
          __break(1u);
          goto LABEL_71;
        }
        if (v18 >= v15) {
          goto LABEL_33;
        }
        unint64_t v19 = *(void *)(v6 + 8 * v18);
        ++v10;
        if (!v19)
        {
          int64_t v10 = v18 + 1;
          if (v18 + 1 >= v15) {
            goto LABEL_33;
          }
          unint64_t v19 = *(void *)(v6 + 8 * v10);
          if (!v19)
          {
            int64_t v10 = v18 + 2;
            if (v18 + 2 >= v15) {
              goto LABEL_33;
            }
            unint64_t v19 = *(void *)(v6 + 8 * v10);
            if (!v19)
            {
              int64_t v10 = v18 + 3;
              if (v18 + 3 >= v15) {
                goto LABEL_33;
              }
              unint64_t v19 = *(void *)(v6 + 8 * v10);
              if (!v19)
              {
                int64_t v10 = v18 + 4;
                if (v18 + 4 >= v15) {
                  goto LABEL_33;
                }
                unint64_t v19 = *(void *)(v6 + 8 * v10);
                if (!v19) {
                  break;
                }
              }
            }
          }
        }
LABEL_29:
        unint64_t v14 = (v19 - 1) & v19;
        unint64_t v17 = __clz(__rbit64(v19)) + (v10 << 6);
LABEL_30:
        uint64_t v21 = *(void *)(a1 + 48) + 16 * v17;
        if ((*(unsigned char *)(v21 + 8) & 1) == 0 && v11 == *(void *)v21) {
          goto LABEL_4;
        }
      }
      int64_t v20 = v18 + 5;
      if (v20 < v15) {
        break;
      }
LABEL_33:
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v8 = sub_255F25908(0, *((void *)v8 + 2) + 1, 1, v8);
      }
      unint64_t v23 = *((void *)v8 + 2);
      unint64_t v22 = *((void *)v8 + 3);
      if (v23 >= v22 >> 1) {
        uint64_t v8 = sub_255F25908((char *)(v22 > 1), v23 + 1, 1, v8);
      }
      *((void *)v8 + 2) = v23 + 1;
      uint64_t v9 = &v8[16 * v23];
      *((void *)v9 + 4) = v11;
      v9[40] = 0;
      uint64_t v7 = v39;
LABEL_4:
      if (v5 == v4)
      {
        uint64_t result = swift_bridgeObjectRelease();
        goto LABEL_39;
      }
    }
    unint64_t v19 = *(void *)(v6 + 8 * v20);
    if (!v19)
    {
      while (1)
      {
        int64_t v10 = v20 + 1;
        if (__OFADD__(v20, 1)) {
          break;
        }
        if (v10 >= v15) {
          goto LABEL_33;
        }
        unint64_t v19 = *(void *)(v6 + 8 * v10);
        ++v20;
        if (v19) {
          goto LABEL_29;
        }
      }
LABEL_71:
      __break(1u);
LABEL_72:
      uint64_t v8 = sub_255F25908(0, *((void *)v8 + 2) + 1, 1, v8);
      goto LABEL_64;
    }
    int64_t v10 = v20;
    goto LABEL_29;
  }
  uint64_t result = swift_bridgeObjectRelease();
  uint64_t v8 = (char *)MEMORY[0x263F8EE78];
LABEL_39:
  int64_t v25 = 0;
  uint64_t v26 = a1 + 64;
  uint64_t v27 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v28 = -1;
  if (v27 < 64) {
    uint64_t v28 = ~(-1 << v27);
  }
  unint64_t v29 = v28 & *(void *)(a1 + 64);
  int64_t v30 = (unint64_t)(v27 + 63) >> 6;
  while (1)
  {
    if (v29)
    {
      unint64_t v31 = __clz(__rbit64(v29));
      v29 &= v29 - 1;
      unint64_t v32 = v31 | (v25 << 6);
      goto LABEL_43;
    }
    int64_t v33 = v25 + 1;
    if (__OFADD__(v25, 1)) {
      goto LABEL_70;
    }
    if (v33 >= v30) {
      break;
    }
    unint64_t v34 = *(void *)(v26 + 8 * v33);
    ++v25;
    if (!v34)
    {
      int64_t v25 = v33 + 1;
      if (v33 + 1 >= v30) {
        break;
      }
      unint64_t v34 = *(void *)(v26 + 8 * v25);
      if (!v34)
      {
        int64_t v25 = v33 + 2;
        if (v33 + 2 >= v30) {
          break;
        }
        unint64_t v34 = *(void *)(v26 + 8 * v25);
        if (!v34)
        {
          int64_t v25 = v33 + 3;
          if (v33 + 3 >= v30) {
            break;
          }
          unint64_t v34 = *(void *)(v26 + 8 * v25);
          if (!v34)
          {
            int64_t v25 = v33 + 4;
            if (v33 + 4 >= v30) {
              break;
            }
            unint64_t v34 = *(void *)(v26 + 8 * v25);
            if (!v34)
            {
              int64_t v35 = v33 + 5;
              if (v35 >= v30) {
                break;
              }
              unint64_t v34 = *(void *)(v26 + 8 * v35);
              if (!v34)
              {
                while (1)
                {
                  int64_t v25 = v35 + 1;
                  if (__OFADD__(v35, 1)) {
                    break;
                  }
                  if (v25 >= v30) {
                    goto LABEL_63;
                  }
                  unint64_t v34 = *(void *)(v26 + 8 * v25);
                  ++v35;
                  if (v34) {
                    goto LABEL_62;
                  }
                }
                __break(1u);
                return result;
              }
              int64_t v25 = v35;
            }
          }
        }
      }
    }
LABEL_62:
    unint64_t v29 = (v34 - 1) & v34;
    unint64_t v32 = __clz(__rbit64(v34)) + (v25 << 6);
LABEL_43:
    if (*(unsigned char *)(*(void *)(a1 + 48) + 16 * v32 + 8)) {
      return (uint64_t)v8;
    }
  }
LABEL_63:
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    goto LABEL_72;
  }
LABEL_64:
  unint64_t v37 = *((void *)v8 + 2);
  unint64_t v36 = *((void *)v8 + 3);
  if (v37 >= v36 >> 1) {
    uint64_t v8 = sub_255F25908((char *)(v36 > 1), v37 + 1, 1, v8);
  }
  *((void *)v8 + 2) = v37 + 1;
  unint64_t v38 = &v8[16 * v37];
  *((void *)v38 + 4) = 0;
  v38[40] = 1;
  return (uint64_t)v8;
}

uint64_t sub_255F25E9C(uint64_t a1, uint64_t a2)
{
  uint64_t result = sub_255F25AB4(a1);
  int64_t v5 = 0;
  uint64_t v6 = 0;
  uint64_t v7 = a1 + 64;
  uint64_t v8 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v9 = -1;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  unint64_t v10 = v9 & *(void *)(a1 + 64);
  int64_t v11 = (unint64_t)(v8 + 63) >> 6;
  while (v10)
  {
    unint64_t v12 = __clz(__rbit64(v10));
    v10 &= v10 - 1;
    unint64_t v13 = v12 | (v5 << 6);
LABEL_5:
    uint64_t v14 = *(void *)(*(void *)(a1 + 56) + 8 * v13);
    BOOL v15 = __OFADD__(v6, v14);
    v6 += v14;
    if (v15)
    {
      __break(1u);
LABEL_28:
      __break(1u);
LABEL_29:
      __break(1u);
      goto LABEL_30;
    }
  }
  int64_t v16 = v5 + 1;
  if (__OFADD__(v5, 1)) {
    goto LABEL_28;
  }
  if (v16 >= v11)
  {
LABEL_25:
    if (!__OFSUB__(a2, v6)) {
      return a1;
    }
    goto LABEL_29;
  }
  unint64_t v17 = *(void *)(v7 + 8 * v16);
  ++v5;
  if (v17) {
    goto LABEL_24;
  }
  int64_t v5 = v16 + 1;
  if (v16 + 1 >= v11) {
    goto LABEL_25;
  }
  unint64_t v17 = *(void *)(v7 + 8 * v5);
  if (v17) {
    goto LABEL_24;
  }
  int64_t v5 = v16 + 2;
  if (v16 + 2 >= v11) {
    goto LABEL_25;
  }
  unint64_t v17 = *(void *)(v7 + 8 * v5);
  if (v17) {
    goto LABEL_24;
  }
  int64_t v5 = v16 + 3;
  if (v16 + 3 >= v11) {
    goto LABEL_25;
  }
  unint64_t v17 = *(void *)(v7 + 8 * v5);
  if (v17) {
    goto LABEL_24;
  }
  int64_t v5 = v16 + 4;
  if (v16 + 4 >= v11) {
    goto LABEL_25;
  }
  unint64_t v17 = *(void *)(v7 + 8 * v5);
  if (v17)
  {
LABEL_24:
    unint64_t v10 = (v17 - 1) & v17;
    unint64_t v13 = __clz(__rbit64(v17)) + (v5 << 6);
    goto LABEL_5;
  }
  int64_t v18 = v16 + 5;
  if (v18 >= v11) {
    goto LABEL_25;
  }
  unint64_t v17 = *(void *)(v7 + 8 * v18);
  if (v17)
  {
    int64_t v5 = v18;
    goto LABEL_24;
  }
  while (1)
  {
    int64_t v5 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v5 >= v11) {
      goto LABEL_25;
    }
    unint64_t v17 = *(void *)(v7 + 8 * v5);
    ++v18;
    if (v17) {
      goto LABEL_24;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

void sub_255F26008()
{
  if (!qword_269F406B0)
  {
    unint64_t v0 = sub_255F26C60();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_269F406B0);
    }
  }
}

uint64_t sub_255F26A00()
{
  return MEMORY[0x270EF02B0]();
}

uint64_t sub_255F26A10()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_255F26A20()
{
  return MEMORY[0x270EF10C8]();
}

uint64_t sub_255F26A30()
{
  return MEMORY[0x270EF10D8]();
}

uint64_t sub_255F26A40()
{
  return MEMORY[0x270EF12C8]();
}

uint64_t sub_255F26A50()
{
  return MEMORY[0x270EF1440]();
}

uint64_t sub_255F26A60()
{
  return MEMORY[0x270EF3360]();
}

uint64_t sub_255F26A70()
{
  return MEMORY[0x270EF3370]();
}

uint64_t sub_255F26A80()
{
  return MEMORY[0x270EF3390]();
}

uint64_t sub_255F26A90()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_255F26AA0()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_255F26AB0()
{
  return MEMORY[0x270F9D968]();
}

uint64_t sub_255F26AC0()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_255F26AD0()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_255F26AE0()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_255F26AF0()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_255F26B00()
{
  return MEMORY[0x270EF33C8]();
}

uint64_t sub_255F26B10()
{
  return MEMORY[0x270EF34C8]();
}

uint64_t sub_255F26B20()
{
  return MEMORY[0x270EF34D0]();
}

uint64_t sub_255F26B30()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_255F26B40()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_255F26B50()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_255F26B60()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_255F26B70()
{
  return MEMORY[0x270F9E978]();
}

uint64_t sub_255F26B80()
{
  return MEMORY[0x270F9EA78]();
}

uint64_t sub_255F26B90()
{
  return MEMORY[0x270F9EA90]();
}

uint64_t sub_255F26BA0()
{
  return MEMORY[0x270F9EA98]();
}

uint64_t sub_255F26BB0()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_255F26BC0()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_255F26BD0()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_255F26BE0()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_255F26BF0()
{
  return MEMORY[0x270F9F0B8]();
}

uint64_t sub_255F26C00()
{
  return MEMORY[0x270F9F250]();
}

uint64_t sub_255F26C10()
{
  return MEMORY[0x270F9F258]();
}

uint64_t sub_255F26C20()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_255F26C30()
{
  return MEMORY[0x270F9F360]();
}

uint64_t sub_255F26C40()
{
  return MEMORY[0x270F9F390]();
}

uint64_t sub_255F26C50()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_255F26C60()
{
  return MEMORY[0x270F9F4F8]();
}

uint64_t sub_255F26C70()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_255F26C80()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_255F26C90()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_255F26CA0()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_255F26CB0()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_255F26CC0()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_255F26CD0()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_255F26CE0()
{
  return MEMORY[0x270F9FD98]();
}

uint64_t HKSensitiveLogItem()
{
  return MEMORY[0x270EF3808]();
}

uint64_t HKShowSensitiveLogItems()
{
  return MEMORY[0x270EF3818]();
}

uint64_t HKSynchronizeNanoPreferencesUserDefaults()
{
  return MEMORY[0x270EF3898]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

uint64_t NSStringFromHKDayIndexRange()
{
  return MEMORY[0x270EF38C0]();
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x270EF2C38](aSelector);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _HKInitializeLogging()
{
  return MEMORY[0x270EF3970]();
}

uint64_t _HKLogDroppedError()
{
  return MEMORY[0x270EF3978]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
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

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t swift_allocError()
{
  return MEMORY[0x270FA0190]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
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

uint64_t swift_getExistentialMetatypeMetadata()
{
  return MEMORY[0x270FA0350]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x270FA0400]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x270FA0428]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t swift_stdlib_random()
{
  return MEMORY[0x270FA0570]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}