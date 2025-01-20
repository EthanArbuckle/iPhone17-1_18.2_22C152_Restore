uint64_t NCIsEqual(void *a1, void *a2)
{
  if (a1 && a2) {
    return [a1 isEqual:a2];
  }
  else {
    return a1 == a2;
  }
}

uint64_t NCIsEqualToArray(void *a1, void *a2)
{
  if (a1 && a2) {
    return [a1 isEqualToArray:a2];
  }
  else {
    return a1 == a2;
  }
}

uint64_t NCIsEqualToSet(void *a1, void *a2)
{
  if (a1 && a2) {
    return [a1 isEqualToSet:a2];
  }
  else {
    return a1 == a2;
  }
}

uint64_t NCIsEqualToDictionary(void *a1, void *a2)
{
  if (a1 && a2) {
    return [a1 isEqualToDictionary:a2];
  }
  else {
    return a1 == a2;
  }
}

id NCUserNotificationsKitFrameworkBundle()
{
  if (NCUserNotificationsKitFrameworkBundle___once[0] != -1) {
    dispatch_once(NCUserNotificationsKitFrameworkBundle___once, &__block_literal_global);
  }
  v0 = (void *)NCUserNotificationsKitFrameworkBundle___bundle;

  return v0;
}

uint64_t __NCUserNotificationsKitFrameworkBundle_block_invoke()
{
  NCUserNotificationsKitFrameworkBundle___bundle = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.UserNotificationsKit"];

  return MEMORY[0x270F9A758]();
}

void sub_220131180(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 48), 8);
  _Unwind_Resume(a1);
}

void NCRegisterUserNotificationsUILogging()
{
  if (NCRegisterUserNotificationsUILogging_onceToken != -1) {
    dispatch_once(&NCRegisterUserNotificationsUILogging_onceToken, &__block_literal_global_3);
  }
}

uint64_t __NCRegisterUserNotificationsUILogging_block_invoke()
{
  os_log_t v0 = os_log_create((const char *)NCUILogSubsystem, "Dispatch");
  v1 = (void *)NCUILogDispatch;
  NCUILogDispatch = (uint64_t)v0;

  os_log_t v2 = os_log_create((const char *)NCUILogSubsystem, "Client");
  v3 = (void *)NCUILogClient;
  NCUILogClient = (uint64_t)v2;

  os_log_t v4 = os_log_create((const char *)NCUILogSubsystem, "Lists");
  v5 = (void *)NCUILogLists;
  NCUILogLists = (uint64_t)v4;

  os_log_t v6 = os_log_create((const char *)NCUILogSubsystem, "ListStates");
  uint64_t v7 = (void *)NCUILogListStates;
  NCUILogListStates = (uint64_t)v6;

  os_log_t v8 = os_log_create((const char *)NCUILogSubsystem, "Management");
  v9 = (void *)NCUILogManagement;
  NCUILogManagement = (uint64_t)v8;

  os_log_t v10 = os_log_create((const char *)NCUILogSubsystem, "Icons");
  v11 = (void *)NCUILogIcons;
  NCUILogIcons = (uint64_t)v10;

  os_log_t v12 = os_log_create((const char *)NCUILogSubsystem, "CommunicationNotifications");
  v13 = (void *)NCUILogCommunicationNotifications;
  NCUILogCommunicationNotifications = (uint64_t)v12;

  os_log_t v14 = os_log_create((const char *)NCUILogSubsystem, "Onboarding");
  v15 = (void *)NCUILogOnboarding;
  NCUILogOnboarding = (uint64_t)v14;

  os_log_t v16 = os_log_create((const char *)NCUILogSubsystem, "Utilities");
  v17 = (void *)NCUILogOnboarding;
  NCUILogOnboarding = (uint64_t)v16;

  os_log_t v18 = os_log_create((const char *)NCUILogSubsystem, "Summarization");
  v19 = (void *)NCUILogSummarization;
  NCUILogSummarization = (uint64_t)v18;

  NCUILogScrollPosition = (uint64_t)os_log_create((const char *)NCUILogSubsystem, "ScrollPosition");

  return MEMORY[0x270F9A758]();
}

void sub_22013DB78(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22013DC5C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_1_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x20u);
}

__CFString *NCNotificationSuppressionToString(unint64_t a1)
{
  if (a1 > 2) {
    return @"<invalid>";
  }
  else {
    return off_264559FB0[a1];
  }
}

__CFString *NCNotificationIntelligentInterruptionBehaviorToString(unint64_t a1)
{
  if (a1 > 3) {
    return 0;
  }
  else {
    return off_264559FC8[a1];
  }
}

__CFString *NCNotificationDeliveryReasonToString(unint64_t a1)
{
  if (a1 > 4) {
    return @"<invalid>";
  }
  else {
    return off_264559FE8[a1];
  }
}

void sub_220142BFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, os_activity_scope_state_s state, uint64_t a18, uint64_t a19, char a20)
{
}

void sub_220143008(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, os_activity_scope_state_s state)
{
}

void sub_2201433F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, os_activity_scope_state_s state)
{
}

void OUTLINED_FUNCTION_0_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_2(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

uint64_t sub_220145E1C()
{
  uint64_t v0 = sub_220181C80();
  __swift_allocate_value_buffer(v0, qword_267F09C58);
  uint64_t v1 = __swift_project_value_buffer(v0, (uint64_t)qword_267F09C58);
  if (qword_267F09C78 != -1) {
    swift_once();
  }
  uint64_t v2 = __swift_project_value_buffer(v0, (uint64_t)qword_267F0C108);
  v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);

  return v3(v1, v2, v0);
}

BOOL sub_220145EE4(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_220145EFC()
{
  return sub_220182A00();
}

uint64_t sub_220145F44()
{
  return sub_2201829C0();
}

uint64_t sub_220145F70()
{
  return sub_220182A00();
}

uint64_t sub_220145FB4@<X0>(uint64_t a1@<X8>)
{
  unint64_t v3 = *(void *)(v1 + 8);
  uint64_t v4 = *(void **)(v1 + 16);
  uint64_t v5 = *(void *)(v1 + 40);
  uint64_t v17 = *(void *)v1;
  uint64_t v18 = *(void *)(v1 + 32);
  type metadata accessor for ViewState();
  sub_220149768(&qword_267F09E00, (void (*)(uint64_t))type metadata accessor for ViewState);
  swift_bridgeObjectRetain();
  id v6 = v4;
  swift_bridgeObjectRetain();
  uint64_t v7 = sub_220181D30();
  char v8 = *(unsigned char *)(v1 + 24);
  swift_retain();
  uint64_t v9 = sub_220181D80();
  uint64_t v11 = v10;
  if (*(void *)(v7 + 40))
  {

    swift_release();
  }
  else
  {
    char v12 = v8;
    id v13 = sub_220146670(v17, v3);
    os_log_t v14 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v13;
    id v15 = v13;

    sub_220146128();
    char v8 = v12;

    swift_release();
  }
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)a1 = v18;
  *(void *)(a1 + 8) = v5;
  *(unsigned char *)(a1 + 16) = v8;
  *(void *)(a1 + 24) = v9;
  *(void *)(a1 + 32) = v11;
  return result;
}

void sub_220146128()
{
  uint64_t v1 = (void *)v0[5];
  if (v1)
  {
    id v2 = objc_msgSend(v1, sel_rootLayer);
    if (v2)
    {
      unint64_t v3 = v2;
      id v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F158B0]), sel_initWithLayer_, v2);
      uint64_t v5 = (void *)v0[4];
      v0[4] = v4;

      id v6 = (void *)v0[5];
      if (!v6) {
        goto LABEL_7;
      }
      id v7 = objc_msgSend(v6, sel_rootLayer);
      if (!v7
        || (char v8 = v7, v9 = objc_msgSend(v7, sel_states), v8, !v9)
        || (uint64_t v10 = sub_220182500(), v9, v11 = sub_2201462F8(v10), swift_bridgeObjectRelease(), !v11))
      {
LABEL_7:
        swift_bridgeObjectRelease();
        unint64_t v11 = MEMORY[0x263F8EE78];
      }
      if (v11 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v15 = sub_220182870();
        swift_bridgeObjectRelease();
        if (v15) {
          goto LABEL_10;
        }
      }
      else if (*(void *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x10))
      {
LABEL_10:
        if ((v11 & 0xC000000000000001) != 0)
        {
          id v12 = (id)MEMORY[0x223C66AB0](0, v11);
        }
        else
        {
          if (!*(void *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x10))
          {
            __break(1u);
            return;
          }
          id v12 = *(id *)(v11 + 32);
        }
        id v13 = v12;
        swift_bridgeObjectRelease();
        goto LABEL_17;
      }
      swift_bridgeObjectRelease();
      id v13 = 0;
LABEL_17:
      os_log_t v16 = (void *)v0[6];
      v0[6] = v13;
      id v17 = v13;
      sub_220146414(v16);

      os_log_t v14 = v17;
      goto LABEL_18;
    }
  }
  os_log_t v14 = (void *)v0[4];
  v0[4] = 0;
LABEL_18:
}

uint64_t sub_2201462F8(uint64_t a1)
{
  uint64_t v6 = MEMORY[0x263F8EE78];
  uint64_t v2 = *(void *)(a1 + 16);
  sub_2201827E0();
  if (!v2) {
    return v6;
  }
  for (uint64_t i = a1 + 32; ; i += 32)
  {
    sub_2201497B0(i, (uint64_t)v5);
    sub_220149EE0(0, &qword_267F09E08);
    if (!swift_dynamicCast()) {
      break;
    }
    sub_2201827C0();
    sub_2201827F0();
    sub_220182800();
    sub_2201827D0();
    if (!--v2) {
      return v6;
    }
  }
  swift_release();

  return 0;
}

void sub_220146414(void *a1)
{
  uint64_t v2 = *(void **)(v1 + 48);
  if (!v2) {
    return;
  }
  id v20 = v2;
  id v4 = objc_msgSend(v20, sel_name);
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = sub_220182460();
    char v8 = v7;

    if (a1) {
      goto LABEL_4;
    }
LABEL_9:
    uint64_t v11 = 0;
    id v13 = v20;
    if (!v8) {
      goto LABEL_15;
    }
    goto LABEL_10;
  }
  uint64_t v6 = 0;
  char v8 = 0;
  if (!a1) {
    goto LABEL_9;
  }
LABEL_4:
  id v9 = objc_msgSend(a1, sel_name);
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = sub_220182460();
    a1 = v12;

    id v13 = v20;
    if (!v8)
    {
LABEL_15:
      if (a1) {
        goto LABEL_16;
      }
      goto LABEL_24;
    }
  }
  else
  {
    uint64_t v11 = 0;
    a1 = 0;
    id v13 = v20;
    if (!v8) {
      goto LABEL_15;
    }
  }
LABEL_10:
  if (!a1)
  {
LABEL_16:
    swift_bridgeObjectRelease();
    goto LABEL_17;
  }
  if (v6 == v11 && v8 == a1)
  {

    swift_bridgeObjectRelease();
LABEL_19:
    swift_bridgeObjectRelease();
    return;
  }
  char v19 = sub_220182910();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v19 & 1) == 0)
  {
LABEL_17:
    id v14 = objc_msgSend(v20, sel_name);
    if (!v14)
    {
      __break(1u);
      return;
    }
    uint64_t v15 = v14;
    uint64_t v16 = sub_220182460();
    uint64_t v18 = v17;

    sub_220146D14(v16, v18);
    goto LABEL_19;
  }
  id v13 = v20;
LABEL_24:
}

void *sub_220146600(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[4] = 0;
  v5[5] = 0;
  v5[6] = 0;
  v5[2] = a1;
  v5[3] = a2;
  sub_22014B388(0);
  id v9 = (void *)v5[4];
  v5[4] = a3;

  uint64_t v10 = (void *)v5[5];
  v5[5] = a4;

  uint64_t v11 = (void *)v5[6];
  v5[6] = a5;

  return v5;
}

id sub_220146670(uint64_t a1, unint64_t a2)
{
  uint64_t v5 = sub_220181B70();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void *)(v6 + 64);
  ((void (*)(void))MEMORY[0x270FA5388])();
  unint64_t v8 = (v7 + 15) & 0xFFFFFFFFFFFFFFF0;
  v42 = (char *)&v41 - v8;
  v43 = (void *)a1;
  id v9 = (void *)sub_220182450();
  uint64_t v10 = (void *)sub_220182450();
  id v11 = objc_msgSend(v2, sel_URLForResource_withExtension_, v9, v10);

  __swift_instantiateConcreteTypeFromMangledName(&qword_267F09E10);
  uint64_t v12 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  id v14 = (char *)&v41 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!v11)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56))(v14, 1, 1, v5);
    goto LABEL_9;
  }
  MEMORY[0x270FA5388](v12);
  sub_220181B60();

  uint64_t v15 = *(void (**)(char *, char *, uint64_t))(v6 + 32);
  v15(v14, (char *)&v41 - v8, v5);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v6 + 56))(v14, 0, 1, v5);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v14, 1, v5) == 1)
  {
LABEL_9:
    sub_22014ACAC((uint64_t)v14, &qword_267F09E10);
    if (qword_267F09C50 != -1) {
      swift_once();
    }
    uint64_t v33 = sub_220181C80();
    __swift_project_value_buffer(v33, (uint64_t)qword_267F09C58);
    swift_bridgeObjectRetain_n();
    v34 = sub_220181C60();
    os_log_type_t v35 = sub_2201825F0();
    if (os_log_type_enabled(v34, v35))
    {
      v36 = (uint8_t *)swift_slowAlloc();
      uint64_t v37 = swift_slowAlloc();
      uint64_t v45 = v37;
      *(_DWORD *)v36 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v44 = sub_220149888((uint64_t)v43, a2, &v45);
      sub_2201826B0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_22012C000, v34, v35, "Fail to create packageURL with name:%s", v36, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x223C676F0](v37, -1, -1);
      MEMORY[0x223C676F0](v36, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    return 0;
  }
  uint64_t v16 = v42;
  v15(v42, v14, v5);
  uint64_t v17 = v16;
  uint64_t v18 = sub_220149EE0(0, &qword_267F09E18);
  MEMORY[0x270FA5388](v18);
  char v19 = *(void (**)(char *, char *, uint64_t))(v6 + 16);
  v19((char *)&v41 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), v16, v5);
  uint64_t v20 = sub_220182460();
  id v22 = sub_220149438((uint64_t)&v41 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), v20, v21, 0);
  id v39 = v22;
  if (v22)
  {
    (*(void (**)(char *, uint64_t))(v6 + 8))(v16, v5);
    return v39;
  }
  if (qword_267F09C50 != -1) {
    swift_once();
  }
  uint64_t v23 = sub_220181C80();
  uint64_t v24 = __swift_project_value_buffer(v23, (uint64_t)qword_267F09C58);
  MEMORY[0x270FA5388](v24);
  v25 = (char *)&v41 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19(v25, v16, v5);
  v26 = sub_220181C60();
  os_log_type_t v27 = sub_2201825F0();
  if (os_log_type_enabled(v26, v27))
  {
    v28 = (uint8_t *)swift_slowAlloc();
    uint64_t v29 = swift_slowAlloc();
    uint64_t v45 = v29;
    v43 = &v41;
    *(_DWORD *)v28 = 136315138;
    v41 = v28 + 4;
    sub_220149F1C();
    uint64_t v30 = sub_2201828F0();
    uint64_t v44 = sub_220149888(v30, v31, &v45);
    sub_2201826B0();
    swift_bridgeObjectRelease();
    v32 = *(void (**)(char *, uint64_t))(v6 + 8);
    v32(v25, v5);
    _os_log_impl(&dword_22012C000, v26, v27, "Fail to load Mica file from URL:%s", v28, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x223C676F0](v29, -1, -1);
    MEMORY[0x223C676F0](v28, -1, -1);

    v32(v17, v5);
  }
  else
  {

    v38 = *(void (**)(char *, uint64_t))(v6 + 8);
    v38((char *)&v41 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), v5);
    v38(v17, v5);
  }
  return 0;
}

void sub_220146D14(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void **)(v2 + 32);
  if (!v3) {
    return;
  }
  uint64_t v4 = v2;
  uint64_t v7 = *(void **)(v2 + 40);
  id v19 = v3;
  id v8 = objc_msgSend(v7, sel_rootLayer);
  if (!v8) {
    goto LABEL_14;
  }
  id v18 = v8;
  id v9 = (void *)sub_220182450();
  id v10 = objc_msgSend(v18, sel_stateWithName_, v9);

  if (!v10)
  {

    uint64_t v15 = v18;
    goto LABEL_15;
  }
  id v11 = objc_msgSend(v19, sel_stateOfLayer_, v18);
  if (v11)
  {
    uint64_t v13 = v11;
    sub_220149EE0(0, &qword_267F09E08);
    id v17 = v10;
    id v14 = v13;
    LOBYTE(v13) = sub_220182690();

    if (v13)
    {

      uint64_t v15 = v17;
LABEL_15:

      return;
    }
  }
  LODWORD(v12) = 1.0;
  objc_msgSend(v19, sel_setState_ofLayer_transitionSpeed_, v10, v18, v12);
  objc_msgSend(v19, sel_cancelTimers);
  uint64_t v16 = *(void (**)(uint64_t, uint64_t))(v4 + 16);
  if (!v16)
  {

LABEL_14:
    uint64_t v15 = v19;
    goto LABEL_15;
  }
  swift_retain();
  v16(a1, a2);

  sub_22014B388((uint64_t)v16);
}

uint64_t sub_220146F30()
{
  sub_22014B388(*(void *)(v0 + 16));

  return MEMORY[0x270FA0228](v0, 56, 7);
}

uint64_t type metadata accessor for ViewState()
{
  return self;
}

uint64_t sub_220146FA4@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for ViewState();
  uint64_t result = sub_220181CB0();
  *a1 = result;
  return result;
}

void *sub_220146FE4(uint64_t a1, uint64_t a2)
{
  type metadata accessor for AnimatedViewState();
  uint64_t v4 = (void *)swift_allocObject();
  v4[8] = 0;
  v4[9] = 0;
  v4[7] = 0;
  swift_retain();
  return sub_220146600(a1, a2, 0, 0, 0);
}

uint64_t sub_220147054@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v57 = a1;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F09F58);
  uint64_t v55 = *(void *)(v3 - 8);
  uint64_t v56 = v3;
  MEMORY[0x270FA5388](v3);
  v54 = (char *)&v46 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F09F60);
  uint64_t v52 = *(void *)(v5 - 8);
  uint64_t v53 = v5;
  MEMORY[0x270FA5388](v5);
  v51 = (char *)&v46 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v49 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F09F68);
  MEMORY[0x270FA5388](v49);
  v50 = (char *)&v46 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v8 = *(void *)(v1 + 8);
  uint64_t v47 = *(void *)v1;
  id v9 = *(void **)(v1 + 16);
  uint64_t v48 = *(void *)(v1 + 24);
  uint64_t v10 = *(void *)(v1 + 32);
  type metadata accessor for AnimatedViewState();
  sub_220149768(&qword_267F09F70, (void (*)(uint64_t))type metadata accessor for AnimatedViewState);
  swift_bridgeObjectRetain();
  id v11 = v9;
  swift_bridgeObjectRetain();
  uint64_t v12 = sub_220181D30();
  char v13 = *(unsigned char *)(v1 + 42);
  type metadata accessor for ViewState();
  sub_220149768(&qword_267F09E00, (void (*)(uint64_t))type metadata accessor for ViewState);
  swift_retain();
  uint64_t v14 = sub_220181D80();
  uint64_t v16 = v15;
  if (*(void *)(v12 + 40))
  {

    swift_release();
  }
  else
  {
    id v17 = sub_220146670(v47, v8);
    id v18 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v17;
    id v19 = v17;

    sub_220146128();
    swift_release();
  }
  swift_bridgeObjectRelease();
  uint64_t v20 = (_OWORD *)swift_allocObject();
  long long v21 = *(_OWORD *)(v2 + 80);
  v20[5] = *(_OWORD *)(v2 + 64);
  v20[6] = v21;
  *(_OWORD *)((char *)v20 + 105) = *(_OWORD *)(v2 + 89);
  long long v22 = *(_OWORD *)(v2 + 16);
  v20[1] = *(_OWORD *)v2;
  v20[2] = v22;
  long long v23 = *(_OWORD *)(v2 + 48);
  v20[3] = *(_OWORD *)(v2 + 32);
  v20[4] = v23;
  uint64_t v58 = v48;
  uint64_t v59 = v10;
  LOBYTE(v60) = v13;
  uint64_t v61 = v14;
  uint64_t v62 = v16;
  v63 = sub_22014B568;
  v64 = v20;
  uint64_t v65 = 0;
  uint64_t v66 = 0;
  LOBYTE(v68) = *(unsigned char *)(v2 + 40);
  uint64_t v24 = (_OWORD *)swift_allocObject();
  long long v25 = *(_OWORD *)(v2 + 80);
  v24[5] = *(_OWORD *)(v2 + 64);
  v24[6] = v25;
  *(_OWORD *)((char *)v24 + 105) = *(_OWORD *)(v2 + 89);
  long long v26 = *(_OWORD *)(v2 + 16);
  v24[1] = *(_OWORD *)v2;
  v24[2] = v26;
  long long v27 = *(_OWORD *)(v2 + 48);
  v24[3] = *(_OWORD *)(v2 + 32);
  v24[4] = v27;
  sub_22014B270(v2);
  sub_22014B270(v2);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F09F78);
  sub_22014B30C();
  v28 = v51;
  sub_2201821A0();
  swift_release();
  uint64_t v29 = (uint64_t)v63;
  uint64_t v30 = v65;
  swift_release();
  swift_bridgeObjectRelease();
  sub_22014B388(v29);
  sub_22014B388(v30);
  uint64_t v31 = *(void *)(v2 + 64);
  uint64_t v32 = *(void *)(v2 + 72);
  uint64_t v67 = *(void *)(v2 + 80);
  uint64_t v68 = v31;
  uint64_t v58 = v31;
  uint64_t v59 = v32;
  uint64_t v60 = v67;
  sub_22014B398((uint64_t)&v68);
  swift_retain();
  sub_22014B3C4((uint64_t)&v67);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F09F88);
  uint64_t v33 = v54;
  sub_220181CD0();
  v34 = (_OWORD *)swift_allocObject();
  long long v35 = *(_OWORD *)(v2 + 80);
  v34[5] = *(_OWORD *)(v2 + 64);
  v34[6] = v35;
  *(_OWORD *)((char *)v34 + 105) = *(_OWORD *)(v2 + 89);
  long long v36 = *(_OWORD *)(v2 + 16);
  v34[1] = *(_OWORD *)v2;
  v34[2] = v36;
  long long v37 = *(_OWORD *)(v2 + 48);
  v34[3] = *(_OWORD *)(v2 + 32);
  v34[4] = v37;
  uint64_t v39 = v52;
  uint64_t v38 = v53;
  uint64_t v40 = (uint64_t)v50;
  (*(void (**)(char *, char *, uint64_t))(v52 + 16))(v50, v28, v53);
  uint64_t v41 = v49;
  uint64_t v43 = v55;
  uint64_t v42 = v56;
  (*(void (**)(uint64_t, char *, uint64_t))(v55 + 16))(v40 + *(int *)(v49 + 52), v33, v56);
  uint64_t v44 = (void (**)(uint64_t))(v40 + *(int *)(v41 + 56));
  *uint64_t v44 = sub_22014B468;
  v44[1] = (void (*)(uint64_t))v34;
  sub_22014B270(v2);
  (*(void (**)(char *, uint64_t))(v43 + 8))(v33, v42);
  (*(void (**)(char *, uint64_t))(v39 + 8))(v28, v38);
  return sub_22014B470(v40, v57, &qword_267F09F68);
}

uint64_t sub_2201475C0(uint64_t result)
{
  if (*(unsigned char *)(result + 40))
  {
    uint64_t v1 = result;
    type metadata accessor for AnimatedViewState();
    sub_220149768(&qword_267F09F70, (void (*)(uint64_t))type metadata accessor for AnimatedViewState);
    sub_220181D30();
    uint64_t v2 = *(void *)(v1 + 48);
    uint64_t v3 = *(void *)(v1 + 56);
    int v4 = *(unsigned __int8 *)(v1 + 41);
    uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F09F88);
    MEMORY[0x223C66600](&v6, v5);
    sub_220147CD4(v4, v6, v2, v3);
    swift_release();
    return swift_bridgeObjectRelease();
  }
  return result;
}

void sub_2201476C0(uint64_t a1, uint64_t a2)
{
  type metadata accessor for AnimatedViewState();
  sub_220149768(&qword_267F09F70, (void (*)(uint64_t))type metadata accessor for AnimatedViewState);
  *(void *)(sub_220181D30() + 64) = 0;
  swift_release();
  uint64_t v3 = sub_22014788C();
  uint64_t v4 = sub_220181D30();
  uint64_t v5 = *(void **)(v4 + 48);
  *(void *)(v4 + 48) = v3;
  id v10 = v3;
  sub_220146414(v5);
  swift_release();

  if (*(unsigned char *)(a2 + 40))
  {
    sub_220181D30();
    uint64_t v6 = *(void *)(a2 + 48);
    uint64_t v7 = *(void *)(a2 + 56);
    int v8 = *(unsigned __int8 *)(a2 + 41);
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F09F88);
    MEMORY[0x223C66600](&v11, v9);
    sub_220147CD4(v8, v11, v6, v7);
    swift_release();

    swift_bridgeObjectRelease();
  }
  else
  {
  }
}

void *sub_22014788C()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F09F88);
  MEMORY[0x223C66600](&v11, v0);
  if (!v11[2])
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  uint64_t v2 = v11[4];
  uint64_t v1 = v11[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  if (!v1) {
    return 0;
  }
  type metadata accessor for AnimatedViewState();
  sub_220149768(&qword_267F09F70, (void (*)(uint64_t))type metadata accessor for AnimatedViewState);
  uint64_t v3 = *(void **)(sub_220181D30() + 40);
  if (!v3) {
    goto LABEL_10;
  }
  id v4 = objc_msgSend(v3, sel_rootLayer);
  if (!v4) {
    goto LABEL_10;
  }
  uint64_t v5 = v4;
  id v6 = objc_msgSend(v4, sel_states);

  if (v6 && (uint64_t v7 = sub_220182500(), v6, v8 = sub_2201462F8(v7), swift_bridgeObjectRelease(), v8))
  {
    swift_release();
  }
  else
  {
LABEL_10:
    swift_release();
    swift_bridgeObjectRelease();
    unint64_t v8 = MEMORY[0x263F8EE78];
  }
  swift_bridgeObjectRetain();
  uint64_t v9 = sub_22014A2E4(v8, v2, v1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease_n();
  return v9;
}

uint64_t sub_220147A58@<X0>(uint64_t a1@<X8>)
{
  return sub_220147054(a1);
}

void sub_220147AA4(char a1, void *a2, uint64_t a3, void (*a4)(void), uint64_t a5)
{
  if (!*(void *)(v5 + 48)) {
    return;
  }
  int64_t v6 = a3 + 1;
  if (__OFADD__(a3, 1))
  {
    __break(1u);
    goto LABEL_13;
  }
  int64_t v11 = a2[2];
  if ((a1 & 1) == 0) {
    goto LABEL_6;
  }
  if (!v11)
  {
LABEL_13:
    __break(1u);
    return;
  }
  v6 %= v11;
LABEL_6:
  if (v6 >= v11)
  {
    a4();
  }
  else
  {
    uint64_t v12 = sub_220147BB0(a2, v6, v5);
    char v13 = *(void **)(v5 + 48);
    *(void *)(v5 + 48) = v12;
    uint64_t v14 = v12;
    sub_220146414(v13);

    *(void *)(v5 + 64) = v6;
    sub_220147CD4(a1 & 1, (uint64_t)a2, (uint64_t)a4, a5);
  }
}

void *sub_220147BB0(void *result, unint64_t a2, uint64_t a3)
{
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (result[2] > a2)
  {
    uint64_t v3 = (char *)&result[4 * a2];
    uint64_t v5 = *((void *)v3 + 4);
    uint64_t v4 = *((void *)v3 + 5);
    int64_t v6 = *(void **)(a3 + 40);
    if (v6)
    {
      swift_bridgeObjectRetain();
      id v7 = objc_msgSend(v6, sel_rootLayer);
      if (v7)
      {
        unint64_t v8 = v7;
        id v9 = objc_msgSend(v7, sel_states);

        if (v9)
        {
          uint64_t v10 = sub_220182500();

          unint64_t v11 = sub_2201462F8(v10);
          swift_bridgeObjectRelease();
          if (v11) {
            goto LABEL_10;
          }
        }
      }
    }
    else
    {
      swift_bridgeObjectRetain();
    }
    swift_bridgeObjectRelease();
    unint64_t v11 = MEMORY[0x263F8EE78];
LABEL_10:
    swift_bridgeObjectRetain();
    uint64_t v12 = sub_22014A478(v11, v5, v4);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    return v12;
  }
  __break(1u);
  return result;
}

uint64_t sub_220147CD4(int a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F09E90);
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v12 = (char *)&v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(void *)(v4 + 72))
  {
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_267F09E98);
    sub_2201825A0();
    swift_release();
  }
  *(void *)(v4 + 72) = 0;
  uint64_t result = swift_release();
  uint64_t v14 = *(void *)(v4 + 64);
  uint64_t v15 = *(void *)(a2 + 16);
  uint64_t v26 = a3;
  HIDWORD(v25) = a1;
  if (v14 >= v15)
  {
    if (v14)
    {
      uint64_t v18 = sub_220182A50();
      uint64_t v17 = v19;
    }
    else
    {
      uint64_t v17 = 0;
      uint64_t v18 = 4000000000000000000;
    }
    goto LABEL_9;
  }
  if ((v14 & 0x8000000000000000) == 0)
  {
    uint64_t v16 = a2 + 32 * v14;
    uint64_t v18 = *(void *)(v16 + 48);
    uint64_t v17 = *(void *)(v16 + 56);
LABEL_9:
    uint64_t v20 = sub_220182590();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v12, 1, 1, v20);
    uint64_t v21 = swift_allocObject();
    swift_weakInit();
    sub_220182570();
    swift_retain();
    swift_bridgeObjectRetain();
    swift_retain();
    uint64_t v22 = sub_220182560();
    uint64_t v23 = swift_allocObject();
    uint64_t v24 = MEMORY[0x263F8F500];
    *(void *)(v23 + 16) = v22;
    *(void *)(v23 + 24) = v24;
    *(void *)(v23 + 32) = v18;
    *(void *)(v23 + 40) = v17;
    *(void *)(v23 + 48) = v21;
    *(unsigned char *)(v23 + 56) = BYTE4(v25) & 1;
    *(void *)(v23 + 64) = a2;
    *(void *)(v23 + 72) = v14;
    *(void *)(v23 + 80) = v26;
    *(void *)(v23 + 88) = a4;
    swift_release();
    *(void *)(v5 + 72) = sub_220172C3C((uint64_t)v12, (uint64_t)&unk_267F09EA8, v23);
    return swift_release();
  }
  __break(1u);
  return result;
}

uint64_t sub_220147F2C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7, uint64_t a8)
{
  *(void *)(v8 + 88) = v15;
  *(_OWORD *)(v8 + 72) = v14;
  *(unsigned char *)(v8 + 160) = a7;
  *(void *)(v8 + 56) = a6;
  *(void *)(v8 + 64) = a8;
  *(void *)(v8 + 40) = a4;
  *(void *)(v8 + 48) = a5;
  uint64_t v9 = sub_220182830();
  *(void *)(v8 + 96) = v9;
  *(void *)(v8 + 104) = *(void *)(v9 - 8);
  *(void *)(v8 + 112) = swift_task_alloc();
  sub_220182570();
  *(void *)(v8 + 120) = sub_220182560();
  uint64_t v11 = sub_220182550();
  *(void *)(v8 + 128) = v11;
  *(void *)(v8 + 136) = v10;
  return MEMORY[0x270FA2498](sub_22014803C, v11, v10);
}

uint64_t sub_22014803C()
{
  uint64_t v1 = sub_220182A20();
  uint64_t v2 = 1000000000000000000 * v1;
  uint64_t v3 = ((v1 >> 63) & 0xF21F494C589C0000) + (((unint64_t)v1 * (unsigned __int128)0xDE0B6B3A7640000uLL) >> 64);
  sub_220182820();
  int64_t v6 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, char))((char *)&dword_267F0AAF0 + dword_267F0AAF0);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v0 + 144) = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_220148138;
  return v6(v2, v3, 0, 0, 1);
}

uint64_t sub_220148138()
{
  uint64_t v2 = *v1;
  uint64_t v3 = *(void *)(*v1 + 112);
  uint64_t v4 = *(void *)(*v1 + 104);
  uint64_t v5 = *(void *)(*v1 + 96);
  *(void *)(*v1 + 152) = v0;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  uint64_t v6 = *(void *)(v2 + 136);
  uint64_t v7 = *(void *)(v2 + 128);
  if (v0) {
    uint64_t v8 = sub_2201483AC;
  }
  else {
    uint64_t v8 = sub_2201482D0;
  }
  return MEMORY[0x270FA2498](v8, v7, v6);
}

uint64_t sub_2201482D0()
{
  uint64_t v1 = *(void *)(v0 + 152);
  swift_release();
  sub_2201825B0();
  if (!v1)
  {
    swift_beginAccess();
    if (swift_weakLoadStrong())
    {
      sub_220147AA4(*(unsigned char *)(v0 + 160), *(void **)(v0 + 64), *(void *)(v0 + 72), *(void (**)(void))(v0 + 80), *(void *)(v0 + 88));
      swift_release();
    }
  }
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_2201483AC()
{
  swift_release();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_220148418()
{
  return swift_release();
}

uint64_t sub_220148448()
{
  sub_22014B388(*(void *)(v0 + 16));

  swift_release();

  return MEMORY[0x270FA0228](v0, 80, 7);
}

uint64_t type metadata accessor for AnimatedViewState()
{
  return self;
}

uint64_t sub_2201484CC(void *a1, void *a2)
{
  uint64_t v3 = a1[1];
  uint64_t v4 = a1[2];
  uint64_t v5 = a1[3];
  uint64_t v6 = a2[1];
  uint64_t v7 = a2[2];
  uint64_t v8 = a2[3];
  if (v3)
  {
    if (v6)
    {
      BOOL v9 = *a1 == *a2 && v3 == v6;
      if (v9 || (sub_220182910() & 1) != 0) {
        goto LABEL_8;
      }
    }
    return 0;
  }
  if (v6) {
    return 0;
  }
LABEL_8:

  return MEMORY[0x270F9FFC8](v4, v5, v7, v8);
}

uint64_t sub_220148564()
{
  uint64_t v1 = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F09F20);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = &v17[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F09F28);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = &v17[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  type metadata accessor for CAPackageViewLayer();
  sub_22014B470(v1, (uint64_t)v19, &qword_267F09F30);
  long long v18 = *(_OWORD *)(v1 + 24);
  uint64_t v9 = swift_allocObject();
  long long v10 = *(_OWORD *)(v1 + 16);
  *(_OWORD *)(v9 + 16) = *(_OWORD *)v1;
  *(_OWORD *)(v9 + 32) = v10;
  *(void *)(v9 + 48) = *(void *)(v1 + 32);
  sub_22014AA9C((uint64_t)v19);
  sub_22014AAC8((uint64_t)&v18);
  sub_220181D60();
  uint64_t v11 = swift_allocObject();
  long long v12 = *(_OWORD *)(v1 + 16);
  *(_OWORD *)(v11 + 16) = *(_OWORD *)v1;
  *(_OWORD *)(v11 + 32) = v12;
  *(void *)(v11 + 48) = *(void *)(v1 + 32);
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v3 + 16))(v8, v5, v2);
  uint64_t v13 = (uint64_t (**)())&v8[*(int *)(v6 + 36)];
  void *v13 = sub_22014AAF8;
  v13[1] = (uint64_t (*)())v11;
  v13[2] = 0;
  v13[3] = 0;
  sub_22014AA9C((uint64_t)v19);
  sub_22014AAC8((uint64_t)&v18);
  (*(void (**)(unsigned char *, uint64_t))(v3 + 8))(v5, v2);
  sub_22014B470((uint64_t)v19, (uint64_t)v17, &qword_267F09F30);
  uint64_t v14 = swift_allocObject();
  long long v15 = *(_OWORD *)(v1 + 16);
  *(_OWORD *)(v14 + 16) = *(_OWORD *)v1;
  *(_OWORD *)(v14 + 32) = v15;
  *(void *)(v14 + 48) = *(void *)(v1 + 32);
  sub_22014AA9C((uint64_t)v19);
  sub_22014AA9C((uint64_t)v19);
  sub_22014AAC8((uint64_t)&v18);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F09F30);
  sub_22014AB58();
  sub_22014AC40();
  sub_2201821A0();
  swift_release();
  swift_bridgeObjectRelease();
  return sub_22014ACAC((uint64_t)v8, &qword_267F09F28);
}

void sub_220148858(char *a1, uint64_t a2)
{
  id v4 = objc_msgSend(*(id *)(*(void *)(a2 + 32) + 40), sel_rootLayer);
  if (v4)
  {
    uint64_t v5 = OBJC_IVAR____TtC20UserNotificationsKitP33_FEAE57ECABF8A8575F8E92CA6992345618CAPackageViewLayer_packageLayer;
    uint64_t v6 = *(void **)&a1[OBJC_IVAR____TtC20UserNotificationsKitP33_FEAE57ECABF8A8575F8E92CA6992345618CAPackageViewLayer_packageLayer];
    *(void *)&a1[OBJC_IVAR____TtC20UserNotificationsKitP33_FEAE57ECABF8A8575F8E92CA6992345618CAPackageViewLayer_packageLayer] = v4;
    id v7 = v4;
    objc_msgSend(v6, sel_removeFromSuperlayer);
    if (*(void *)&a1[v5]) {
      objc_msgSend(a1, sel_addSublayer_);
    }

    a1[OBJC_IVAR____TtC20UserNotificationsKitP33_FEAE57ECABF8A8575F8E92CA6992345618CAPackageViewLayer_contentMode] = *(unsigned char *)(a2 + 16);
  }
}

uint64_t sub_220148910(uint64_t a1)
{
  sub_22014B470(a1, (uint64_t)v6, &qword_267F09F30);
  uint64_t result = sub_22014B470((uint64_t)v6, (uint64_t)&v7, &qword_267F09F30);
  uint64_t v3 = v8;
  if (v8)
  {
    uint64_t v4 = v7;
    long long v5 = *(_OWORD *)(a1 + 24);
    swift_retain();
    sub_220146D14(v4, v3);
    return sub_22014AD08((uint64_t)&v5);
  }
  return result;
}

uint64_t sub_22014899C()
{
  return sub_220182190();
}

uint64_t sub_2201489B8()
{
  return sub_220148564();
}

void sub_2201489F4()
{
  v18.receiver = v0;
  v18.super_class = (Class)type metadata accessor for CAPackageViewLayer();
  objc_msgSendSuper2(&v18, sel_layoutSublayers);
  uint64_t v1 = *(void **)&v0[OBJC_IVAR____TtC20UserNotificationsKitP33_FEAE57ECABF8A8575F8E92CA6992345618CAPackageViewLayer_packageLayer];
  if (v1)
  {
    id v2 = v1;
    objc_msgSend(v0, sel_bounds);
    CGFloat v4 = v3;
    CGFloat v6 = v5;
    CGFloat v8 = v7;
    CGFloat v10 = v9;
    objc_msgSend(v2, sel_bounds);
    sub_220148B60((uint64_t)v0, &v19, v4, v6, v8, v10, v11, v12, v13, v14);
    CGAffineTransform m = v19;
    CATransform3DMakeAffineTransform(&v16, &m);
    objc_msgSend(v2, sel_setTransform_, &v16);
    objc_msgSend(v0, sel_bounds);
    double MidX = CGRectGetMidX(v20);
    objc_msgSend(v0, sel_bounds);
    objc_msgSend(v2, sel_setPosition_, MidX, CGRectGetMidY(v21));
    objc_msgSend(v2, sel_setGeometryFlipped_, 0);
  }
}

CGFloat sub_220148B60@<D0>(uint64_t a1@<X0>, _OWORD *a2@<X8>, CGFloat a3@<D0>, CGFloat a4@<D1>, CGFloat a5@<D2>, CGFloat a6@<D3>, CGFloat a7@<D4>, CGFloat a8@<D5>, CGFloat a9@<D6>, CGFloat a10@<D7>)
{
  char v18 = *(unsigned char *)(a1
                 + OBJC_IVAR____TtC20UserNotificationsKitP33_FEAE57ECABF8A8575F8E92CA6992345618CAPackageViewLayer_contentMode);
  double Width = CGRectGetWidth(*(CGRect *)&a3);
  if (v18)
  {
    v33.origin.x = a7;
    v33.origin.y = a8;
    v33.size.width = a9;
    v33.size.height = a10;
    double v20 = Width / CGRectGetWidth(v33);
    v34.origin.x = a3;
    v34.origin.y = a4;
    v34.size.width = a5;
    v34.size.height = a6;
    double Height = CGRectGetHeight(v34);
    v35.origin.x = a7;
    v35.origin.y = a8;
    v35.size.width = a9;
    v35.size.height = a10;
    double v22 = Height / CGRectGetHeight(v35);
    double v23 = v20;
  }
  else
  {
    v36.origin.x = a3;
    v36.origin.y = a4;
    v36.size.width = a5;
    v36.size.height = a6;
    double v30 = Width / CGRectGetHeight(v36);
    v37.origin.x = a7;
    v37.origin.y = a8;
    v37.size.width = a9;
    v37.size.height = a10;
    double v29 = CGRectGetWidth(v37);
    v38.origin.x = a7;
    v38.origin.y = a8;
    v38.size.width = a9;
    v38.size.height = a10;
    if (v30 >= v29 / CGRectGetHeight(v38))
    {
      v41.origin.x = a3;
      v41.origin.y = a4;
      v41.size.width = a5;
      v41.size.height = a6;
      double v24 = CGRectGetHeight(v41);
      v42.origin.x = a7;
      v42.origin.y = a8;
      v42.size.width = a9;
      v42.size.height = a10;
      double v25 = CGRectGetHeight(v42);
    }
    else
    {
      v39.origin.x = a3;
      v39.origin.y = a4;
      v39.size.width = a5;
      v39.size.height = a6;
      double v24 = CGRectGetWidth(v39);
      v40.origin.x = a7;
      v40.origin.y = a8;
      v40.size.width = a9;
      v40.size.height = a10;
      double v25 = CGRectGetWidth(v40);
    }
    double v23 = v24 / v25;
    double v22 = v23;
  }
  CGAffineTransformMakeScale(&v32, v23, v22);
  CGFloat result = v32.a;
  long long v27 = *(_OWORD *)&v32.c;
  long long v28 = *(_OWORD *)&v32.tx;
  *a2 = *(_OWORD *)&v32.a;
  a2[1] = v27;
  a2[2] = v28;
  return result;
}

id sub_220148EC8()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CAPackageViewLayer();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for CAPackageViewLayer()
{
  return self;
}

uint64_t destroy for MicaView(uint64_t a1)
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();

  return sub_22014ADAC();
}

uint64_t initializeWithCopy for MicaView(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  CGFloat v4 = *(void **)(a2 + 16);
  *(void *)(a1 + 16) = v4;
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  uint64_t v5 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v5;
  uint64_t v6 = *(void *)(a2 + 48);
  uint64_t v7 = *(void *)(a2 + 56);
  char v8 = *(unsigned char *)(a2 + 64);
  swift_bridgeObjectRetain();
  id v9 = v4;
  swift_bridgeObjectRetain();
  sub_22014AD34();
  *(void *)(a1 + 48) = v6;
  *(void *)(a1 + 56) = v7;
  *(unsigned char *)(a1 + 64) = v8;
  return a1;
}

uint64_t assignWithCopy for MicaView(uint64_t a1, void *a2)
{
  objc_super v2 = a2;
  *(void *)a1 = *a2;
  *(void *)(a1 + 8) = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  CGFloat v4 = (void *)v2[2];
  uint64_t v5 = *(void **)(a1 + 16);
  *(void *)(a1 + 16) = v4;
  id v6 = v4;

  *(unsigned char *)(a1 + 24) = *((unsigned char *)v2 + 24);
  *(void *)(a1 + 32) = v2[4];
  *(void *)(a1 + 40) = v2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v7 = v2[6];
  uint64_t v8 = v2[7];
  LOBYTE(v2) = *((unsigned char *)v2 + 64);
  sub_22014AD34();
  *(void *)(a1 + 48) = v7;
  *(void *)(a1 + 56) = v8;
  *(unsigned char *)(a1 + 64) = (_BYTE)v2;
  sub_22014ADAC();
  return a1;
}

__n128 __swift_memcpy65_8(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  __n128 result = *(__n128 *)(a2 + 16);
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)(a1 + 16) = result;
  return result;
}

uint64_t assignWithTake for MicaView(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  long long v4 = *(void **)(a1 + 16);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);

  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  uint64_t v5 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v5;
  swift_bridgeObjectRelease();
  char v6 = *(unsigned char *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(unsigned char *)(a1 + 64) = v6;
  sub_22014ADAC();
  return a1;
}

uint64_t getEnumTagSinglePayload for MicaView(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 65)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for MicaView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 64) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 65) = 1;
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
    *(unsigned char *)(result + 65) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for MicaView()
{
  return &type metadata for MicaView;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *__n128 result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for MicaView.ContentMode(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for MicaView.ContentMode(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *__n128 result = a2 + 1;
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
        JUMPOUT(0x220149378);
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
          *__n128 result = a2 + 1;
        break;
    }
  }
  return result;
}

uint64_t sub_2201493A0(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_2201493AC(unsigned char *result, char a2)
{
  *__n128 result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for MicaView.ContentMode()
{
  return &type metadata for MicaView.ContentMode;
}

void type metadata accessor for NotificationOnboardingClient(uint64_t a1)
{
}

void type metadata accessor for NotificationOnboardingExperience(uint64_t a1)
{
}

uint64_t sub_2201493F0()
{
  return sub_220149768(&qword_267F09DF0, type metadata accessor for NotificationOnboardingExperience);
}

id sub_220149438(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v17[1] = *(id *)MEMORY[0x263EF8340];
  unsigned int v6 = (void *)sub_220181B50();
  BOOL v7 = (void *)sub_220182450();
  swift_bridgeObjectRelease();
  if (a4)
  {
    int v8 = (void *)sub_220182420();
    swift_bridgeObjectRelease();
  }
  else
  {
    int v8 = 0;
  }
  v17[0] = 0;
  id v9 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_packageWithContentsOfURL_type_options_error_, v6, v7, v8, v17);

  id v10 = v17[0];
  if (v9)
  {
    uint64_t v11 = sub_220181B70();
    CGFloat v12 = *(void (**)(uint64_t, uint64_t))(*(void *)(v11 - 8) + 8);
    id v13 = v10;
    v12(a1, v11);
  }
  else
  {
    id v14 = v17[0];
    sub_220181B30();

    swift_willThrow();
    uint64_t v15 = sub_220181B70();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v15 - 8) + 8))(a1, v15);
  }
  return v9;
}

BOOL sub_220149600(void *a1, void *a2)
{
  return *a1 == *a2;
}

void *sub_220149614@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void sub_220149624(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_220149630()
{
  return sub_220182A00();
}

uint64_t sub_220149678()
{
  return sub_2201829C0();
}

uint64_t sub_2201496A4()
{
  return sub_220182A00();
}

unint64_t sub_2201496EC()
{
  unint64_t result = qword_267F09DF8;
  if (!qword_267F09DF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F09DF8);
  }
  return result;
}

uint64_t sub_220149740()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_22014975C()
{
  return MEMORY[0x263EFDDD8];
}

uint64_t sub_220149768(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_2201497B0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
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

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_220149888(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_22014995C(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_2201497B0((uint64_t)v12, *a3);
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
      sub_2201497B0((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_22014995C(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_2201826C0();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_220149B18(a5, a6);
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
  uint64_t v8 = sub_2201827B0();
  if (!v8)
  {
    sub_220182850();
    __break(1u);
LABEL_17:
    uint64_t result = sub_2201828B0();
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

uint64_t sub_220149B18(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_220149BB0(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_220149D90(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_220149D90(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_220149BB0(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_220149D28(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_220182790();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_220182850();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_2201824C0();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_2201828B0();
    __break(1u);
LABEL_14:
    uint64_t result = sub_220182850();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_220149D28(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F09E28);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_220149D90(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_267F09E28);
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
  id v13 = a4 + 32;
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
  uint64_t result = sub_2201828B0();
  __break(1u);
  return result;
}

uint64_t sub_220149EE0(uint64_t a1, unint64_t *a2)
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

unint64_t sub_220149F1C()
{
  unint64_t result = qword_267F09E20;
  if (!qword_267F09E20)
  {
    sub_220181B70();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F09E20);
  }
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

void *__swift_project_boxed_opaque_existential_0(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_22014A064()
{
  swift_weakDestroy();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_22014A09C()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();

  return MEMORY[0x270FA0238](v0, 96, 7);
}

uint64_t sub_22014A0EC(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = *(void *)(v1 + 24);
  uint64_t v6 = *(void *)(v1 + 32);
  uint64_t v7 = *(void *)(v1 + 40);
  uint64_t v8 = *(void *)(v1 + 48);
  char v9 = *(unsigned char *)(v1 + 56);
  uint64_t v10 = *(void *)(v1 + 64);
  size_t v11 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v11;
  void *v11 = v2;
  v11[1] = sub_22014A1F0;
  return sub_220147F2C(a1, v4, v5, v6, v7, v8, v9, v10);
}

uint64_t sub_22014A1F0()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

void *sub_22014A2E4(unint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1 >> 62) {
    goto LABEL_20;
  }
  uint64_t v5 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v5; uint64_t v5 = sub_220182870())
  {
    uint64_t v6 = 4;
    while (1)
    {
      id v7 = (a1 & 0xC000000000000001) != 0 ? (id)MEMORY[0x223C66AB0](v6 - 4, a1) : *(id *)(a1 + 8 * v6);
      uint64_t v8 = v7;
      uint64_t v9 = v6 - 3;
      if (__OFADD__(v6 - 4, 1)) {
        break;
      }
      id v10 = objc_msgSend(v7, sel_name);
      if (v10)
      {
        size_t v11 = v10;
        uint64_t v12 = sub_220182460();
        uint64_t v14 = v13;

        if (v12 == a2 && v14 == a3)
        {
          swift_bridgeObjectRelease();
LABEL_18:
          swift_bridgeObjectRelease();
          return v8;
        }
        char v16 = sub_220182910();
        swift_bridgeObjectRelease();
        if (v16) {
          goto LABEL_18;
        }
      }

      ++v6;
      if (v9 == v5) {
        goto LABEL_21;
      }
    }
    __break(1u);
LABEL_20:
    swift_bridgeObjectRetain();
  }
LABEL_21:
  swift_bridgeObjectRelease();
  return 0;
}

void *sub_22014A478(unint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1 >> 62)
  {
LABEL_25:
    swift_bridgeObjectRetain();
    uint64_t v5 = sub_220182870();
    if (v5) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v5 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v5)
    {
LABEL_3:
      uint64_t v6 = 4;
      do
      {
        if ((a1 & 0xC000000000000001) != 0) {
          id v7 = (id)MEMORY[0x223C66AB0](v6 - 4, a1);
        }
        else {
          id v7 = *(id *)(a1 + 8 * v6);
        }
        uint64_t v8 = v7;
        uint64_t v9 = v6 - 3;
        if (__OFADD__(v6 - 4, 1))
        {
          __break(1u);
          goto LABEL_25;
        }
        id v10 = objc_msgSend(v7, sel_name);
        if (v10)
        {
          size_t v11 = v10;
          uint64_t v12 = sub_220182460();
          uint64_t v14 = v13;

          if (!a3)
          {

            swift_bridgeObjectRelease();
            goto LABEL_6;
          }
          if (v12 == a2 && v14 == a3)
          {
            swift_bridgeObjectRelease();
LABEL_23:
            swift_bridgeObjectRelease();
            return v8;
          }
          char v16 = sub_220182910();
          swift_bridgeObjectRelease();
          if (v16) {
            goto LABEL_23;
          }
        }
        else if (!a3)
        {
          goto LABEL_23;
        }

LABEL_6:
        ++v6;
      }
      while (v9 != v5);
    }
  }
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t destroy for AnimationTimelineEntry()
{
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for AnimationTimelineEntry(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for AnimationTimelineEntry(void *a1, void *a2)
{
  *a1 = *a2;
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

uint64_t assignWithTake for AnimationTimelineEntry(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  return a1;
}

uint64_t getEnumTagSinglePayload for AnimationTimelineEntry(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 32)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  unint64_t v3 = *(void *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for AnimationTimelineEntry(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    *(void *)(result + 8) = 0;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 32) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 32) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AnimationTimelineEntry()
{
  return &type metadata for AnimationTimelineEntry;
}

uint64_t initializeBufferWithCopyOfBuffer for _CAPackageView(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for _CAPackageView()
{
  swift_bridgeObjectRelease();

  return swift_release();
}

uint64_t initializeWithCopy for _CAPackageView(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v4;
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for _CAPackageView(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_retain();
  swift_release();
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

uint64_t assignWithTake for _CAPackageView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  uint64_t v5 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v5;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for _CAPackageView(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 40)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 32);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for _CAPackageView(uint64_t result, int a2, int a3)
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
      *(void *)(result + 32) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 40) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for _CAPackageView()
{
  return &type metadata for _CAPackageView;
}

void type metadata accessor for CGImage(uint64_t a1)
{
}

unint64_t sub_22014AA20()
{
  unint64_t result = qword_267F09EB8;
  if (!qword_267F09EB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F09EB8);
  }
  return result;
}

uint64_t sub_22014AA74()
{
  return swift_getOpaqueTypeConformance2();
}

void sub_22014AA94(char *a1)
{
  sub_220148858(a1, v1 + 16);
}

uint64_t sub_22014AA9C(uint64_t a1)
{
  return a1;
}

uint64_t sub_22014AAC8(uint64_t a1)
{
  return a1;
}

uint64_t sub_22014AAF8()
{
  return sub_220148910(v0 + 16);
}

uint64_t objectdestroy_77Tm()
{
  swift_bridgeObjectRelease();
  swift_release();

  return MEMORY[0x270FA0238](v0, 56, 7);
}

unint64_t sub_22014AB58()
{
  unint64_t result = qword_267F09F38;
  if (!qword_267F09F38)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267F09F28);
    sub_22014B510(&qword_267F09F40, &qword_267F09F20);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F09F38);
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

unint64_t sub_22014AC40()
{
  unint64_t result = qword_267F09F48;
  if (!qword_267F09F48)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267F09F30);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F09F48);
  }
  return result;
}

uint64_t sub_22014ACAC(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_22014AD08(uint64_t a1)
{
  return a1;
}

uint64_t sub_22014AD34()
{
  return swift_retain();
}

uint64_t destroy for AnimatedMicaView(uint64_t a1)
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();

  return sub_22014ADAC();
}

uint64_t sub_22014ADAC()
{
  return swift_release();
}

uint64_t initializeWithCopy for AnimatedMicaView(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v5 = *(void **)(a2 + 16);
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(_WORD *)(a1 + 40) = *(_WORD *)(a2 + 40);
  *(unsigned char *)(a1 + 42) = *(unsigned char *)(a2 + 42);
  uint64_t v6 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v6;
  uint64_t v7 = *(void *)(a2 + 72);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = v7;
  uint64_t v8 = *(void *)(a2 + 88);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  uint64_t v9 = *(void *)(a2 + 96);
  char v10 = *(unsigned char *)(a2 + 104);
  swift_bridgeObjectRetain();
  id v11 = v5;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  sub_22014AD34();
  *(void *)(a1 + 88) = v8;
  *(void *)(a1 + 96) = v9;
  *(unsigned char *)(a1 + 104) = v10;
  return a1;
}

uint64_t assignWithCopy for AnimatedMicaView(uint64_t a1, void *a2)
{
  unint64_t v2 = a2;
  *(void *)a1 = *a2;
  *(void *)(a1 + 8) = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = (void *)v2[2];
  uint64_t v5 = *(void **)(a1 + 16);
  *(void *)(a1 + 16) = v4;
  id v6 = v4;

  *(void *)(a1 + 24) = v2[3];
  *(void *)(a1 + 32) = v2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 40) = *((unsigned char *)v2 + 40);
  *(unsigned char *)(a1 + 41) = *((unsigned char *)v2 + 41);
  *(unsigned char *)(a1 + 42) = *((unsigned char *)v2 + 42);
  uint64_t v7 = v2[7];
  *(void *)(a1 + 48) = v2[6];
  *(void *)(a1 + 56) = v7;
  swift_retain();
  swift_release();
  *(void *)(a1 + 64) = v2[8];
  swift_retain();
  swift_release();
  *(void *)(a1 + 72) = v2[9];
  swift_retain();
  swift_release();
  *(void *)(a1 + 80) = v2[10];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v8 = v2[11];
  uint64_t v9 = v2[12];
  LOBYTE(v2) = *((unsigned char *)v2 + 104);
  sub_22014AD34();
  *(void *)(a1 + 88) = v8;
  *(void *)(a1 + 96) = v9;
  *(unsigned char *)(a1 + 104) = (_BYTE)v2;
  sub_22014ADAC();
  return a1;
}

__n128 __swift_memcpy105_8(uint64_t a1, long long *a2)
{
  long long v2 = *a2;
  long long v3 = a2[2];
  *(_OWORD *)(a1 + 16) = a2[1];
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)a1 = v2;
  __n128 result = (__n128)a2[3];
  long long v5 = a2[4];
  long long v6 = a2[5];
  *(_OWORD *)(a1 + 89) = *(long long *)((char *)a2 + 89);
  *(_OWORD *)(a1 + 64) = v5;
  *(_OWORD *)(a1 + 80) = v6;
  *(__n128 *)(a1 + 48) = result;
  return result;
}

uint64_t assignWithTake for AnimatedMicaView(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void **)(a1 + 16);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);

  uint64_t v5 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v5;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  *(unsigned char *)(a1 + 41) = *(unsigned char *)(a2 + 41);
  *(unsigned char *)(a1 + 42) = *(unsigned char *)(a2 + 42);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  swift_release();
  swift_release();
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  swift_release();
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  swift_bridgeObjectRelease();
  char v6 = *(unsigned char *)(a2 + 104);
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  *(unsigned char *)(a1 + 104) = v6;
  sub_22014ADAC();
  return a1;
}

uint64_t getEnumTagSinglePayload for AnimatedMicaView(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 105)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AnimatedMicaView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 104) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 105) = 1;
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
    *(unsigned char *)(result + 105) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AnimatedMicaView()
{
  return &type metadata for AnimatedMicaView;
}

void type metadata accessor for NotificationOnboardingOutcome(uint64_t a1)
{
}

void sub_22014B168(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_22014B1B0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_22014B230()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_22014B254()
{
  return sub_2201475C0(v0 + 16);
}

uint64_t sub_22014B270(uint64_t a1)
{
  unint64_t v2 = *(void **)(a1 + 16);
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v3 = v2;
  swift_bridgeObjectRetain();
  swift_retain();
  sub_22014AD34();
  return a1;
}

unint64_t sub_22014B30C()
{
  unint64_t result = qword_267F09F80;
  if (!qword_267F09F80)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267F09F78);
    sub_22014AA20();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F09F80);
  }
  return result;
}

uint64_t sub_22014B388(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_22014B398(uint64_t a1)
{
  return a1;
}

uint64_t sub_22014B3C4(uint64_t a1)
{
  return a1;
}

uint64_t objectdestroy_89Tm()
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  sub_22014ADAC();

  return MEMORY[0x270FA0238](v0, 121, 7);
}

void sub_22014B468(uint64_t a1)
{
  sub_2201476C0(a1, v1 + 16);
}

uint64_t sub_22014B470(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_22014B4D4()
{
  return sub_22014B510((unint64_t *)&unk_267F09F90, &qword_267F09F68);
}

uint64_t sub_22014B510(unint64_t *a1, uint64_t *a2)
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

uint64_t sub_22014B570@<X0>(uint64_t a1@<X8>)
{
  uint64_t v26 = a1;
  uint64_t v2 = type metadata accessor for NotificationSummarizationOnboardingCustomizationByAppListView();
  uint64_t v24 = *(void *)(v2 - 8);
  uint64_t v3 = *(void *)(v24 + 64);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = sub_220182000();
  MEMORY[0x270FA5388](v4);
  uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F0A090);
  uint64_t v5 = *(void *)(v25 - 8);
  MEMORY[0x270FA5388](v25);
  uint64_t v7 = (char *)&v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F0A098);
  uint64_t v9 = v8 - 8;
  MEMORY[0x270FA5388](v8);
  uint64_t v22 = v1;
  double v23 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = v1;
  sub_220181F60();
  int v28 = 0;
  sub_22014FB48(&qword_267F0A0A0, MEMORY[0x263F19D28]);
  sub_220182A60();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F0A0A8);
  sub_22014EA28();
  sub_220181CF0();
  uint64_t v21 = (uint64_t)&v21 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22014F688(v1, v21, (uint64_t (*)(void))type metadata accessor for NotificationSummarizationOnboardingCustomizationByAppListView);
  unint64_t v11 = (*(unsigned __int8 *)(v24 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v24 + 80);
  uint64_t v12 = swift_allocObject();
  sub_22014EB7C((uint64_t)&v21 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), v12 + v11);
  uint64_t v13 = (uint64_t)v23;
  uint64_t v14 = v25;
  (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v23, v7, v25);
  uint64_t v15 = (uint64_t (**)())(v13 + *(int *)(v9 + 44));
  void *v15 = sub_22014EBE0;
  v15[1] = (uint64_t (*)())v12;
  v15[2] = 0;
  v15[3] = 0;
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v14);
  uint64_t v16 = v21;
  sub_22014F688(v22, v21, (uint64_t (*)(void))type metadata accessor for NotificationSummarizationOnboardingCustomizationByAppListView);
  uint64_t v17 = swift_allocObject();
  sub_22014EB7C(v16, v17 + v11);
  uint64_t v18 = v26;
  sub_22014FA88(v13, v26, &qword_267F0A098);
  CGAffineTransform v19 = (void *)(v18 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267F0A0E0) + 36));
  void *v19 = 0;
  v19[1] = 0;
  v19[2] = sub_22014ED48;
  v19[3] = v17;
  return sub_22014ACAC(v13, &qword_267F0A098);
}

uint64_t sub_22014B93C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v177 = a2;
  uint64_t v176 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F0A0C0);
  MEMORY[0x270FA5388](v176);
  v172 = (uint64_t *)((char *)&v136 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v170 = sub_220181D90();
  MEMORY[0x270FA5388](v170);
  v171 = (char *)&v136 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v169 = sub_220181D10();
  uint64_t v168 = *(void *)(v169 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v169);
  v144 = (char *)&v136 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v167 = (uint64_t)&v136 - v7;
  uint64_t v157 = sub_220181F00();
  uint64_t v156 = *(void *)(v157 - 8);
  MEMORY[0x270FA5388](v157);
  v155 = (char *)&v136 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v146 = sub_220182000();
  MEMORY[0x270FA5388](v146);
  v147 = (char *)&v136 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v152 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F0A0E8);
  uint64_t v151 = *(void *)(v152 - 8);
  MEMORY[0x270FA5388](v152);
  v149 = (char *)&v136 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v154 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F0A0F0);
  uint64_t v153 = *(void *)(v154 - 8);
  MEMORY[0x270FA5388](v154);
  v150 = (char *)&v136 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v148 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F0A0F8);
  MEMORY[0x270FA5388](v148);
  uint64_t v178 = (uint64_t)&v136 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v159 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F0A100);
  MEMORY[0x270FA5388](v159);
  uint64_t v162 = (uint64_t)&v136 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v160 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F0A108);
  MEMORY[0x270FA5388](v160);
  v165 = (char *)&v136 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v161 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F0A110);
  MEMORY[0x270FA5388](v161);
  uint64_t v166 = (uint64_t)&v136 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v164 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F0A118);
  uint64_t v16 = MEMORY[0x270FA5388](v164);
  uint64_t v179 = (uint64_t)&v136 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = MEMORY[0x270FA5388](v16);
  uint64_t v163 = (uint64_t)&v136 - v19;
  MEMORY[0x270FA5388](v18);
  uint64_t v180 = (uint64_t)&v136 - v20;
  uint64_t v175 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F0A120);
  MEMORY[0x270FA5388](v175);
  uint64_t v22 = (char *)&v136 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = sub_220182020();
  uint64_t v185 = *(void *)(v23 - 8);
  MEMORY[0x270FA5388](v23);
  uint64_t v25 = (char *)&v136 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F0A0C8);
  uint64_t v184 = *(void *)(v26 - 8);
  MEMORY[0x270FA5388](v26);
  int v28 = (char *)&v136 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F0A128);
  uint64_t v30 = *(void *)(v29 - 8);
  uint64_t v31 = MEMORY[0x270FA5388](v29);
  CGRect v33 = (char *)&v136 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v31);
  CGRect v35 = (char *)&v136 - v34;
  uint64_t v145 = type metadata accessor for NotificationSummarizationOnboardingCustomizationByAppListView();
  uint64_t v36 = *(int *)(v145 + 28);
  uint64_t v158 = a1;
  long long v186 = *(_OWORD *)(a1 + v36);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F0A060);
  sub_2201822A0();
  if (!v189)
  {
    sub_220181D50();
    sub_220182010();
    uint64_t v183 = sub_22014B510(&qword_267F0A0D0, &qword_267F0A0C8);
    uint64_t v182 = sub_22014FB48(&qword_267F0A0D8, MEMORY[0x263F1A1D8]);
    sub_220182150();
    (*(void (**)(char *, uint64_t))(v185 + 8))(v25, v23);
    (*(void (**)(char *, uint64_t))(v184 + 8))(v28, v26);
    (*(void (**)(char *, char *, uint64_t))(v30 + 32))(v35, v33, v29);
    (*(void (**)(char *, char *, uint64_t))(v30 + 16))(v22, v35, v29);
    swift_storeEnumTagMultiPayload();
    sub_22014B510(&qword_267F0A0B8, &qword_267F0A0C0);
    *(void *)&long long v186 = v26;
    *((void *)&v186 + 1) = v23;
    uint64_t v187 = v183;
    uint64_t v188 = v182;
    swift_getOpaqueTypeConformance2();
    sub_220181FF0();
    return (*(uint64_t (**)(char *, uint64_t))(v30 + 8))(v35, v29);
  }
  uint64_t v141 = v26;
  uint64_t v142 = v29;
  uint64_t v143 = v23;
  id v174 = v189;
  if ((*((unsigned char *)v189
        + OBJC_IVAR____TtC20UserNotificationsKit44NotificationSummarizationOnboardingViewModel_sourcesSortMethod) & 1) != 0)
  {
    char v37 = sub_220182910();
    uint64_t v38 = swift_bridgeObjectRelease();
    if ((v37 & 1) == 0)
    {
      uint64_t v184 = 0;
      uint64_t v185 = 0;
      uint64_t v39 = 0;
      uint64_t v182 = 0;
      uint64_t v183 = 0;
      uint64_t v181 = 0;
      uint64_t v173 = 0;
      uint64_t v140 = 0;
      uint64_t v139 = 0;
      goto LABEL_16;
    }
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  if (qword_267F09C70 != -1) {
    swift_once();
  }
  id v41 = (id)qword_267F0C100;
  CGRect v42 = (void *)sub_220182450();
  uint64_t v43 = (void *)sub_220182450();
  id v44 = objc_msgSend(v41, sel_localizedStringForKey_value_table_, v42, 0, v43);

  uint64_t v45 = sub_220182460();
  uint64_t v47 = v46;

  *(void *)&long long v186 = v45;
  *((void *)&v186 + 1) = v47;
  sub_22014F7F4();
  uint64_t v48 = sub_220182120();
  uint64_t v50 = v49;
  char v52 = v51;
  if (qword_267F09C88 != -1) {
    swift_once();
  }
  uint64_t v53 = sub_220182110();
  uint64_t v55 = v54;
  char v57 = v56;
  sub_22014F7E4(v48, v50, v52 & 1);
  swift_bridgeObjectRelease();
  if (qword_267F09C90 != -1) {
    swift_once();
  }
  *(void *)&long long v186 = qword_267F0C148;
  swift_retain();
  uint64_t v58 = sub_220182100();
  uint64_t v184 = v59;
  uint64_t v185 = v58;
  uint64_t v183 = v60;
  uint64_t v39 = v61 & 1;
  sub_22014F7E4(v53, v55, v57 & 1);
  swift_release();
  swift_bridgeObjectRelease();
  unsigned __int8 v62 = sub_220182070();
  if (qword_267F09C98 != -1) {
    swift_once();
  }
  uint64_t v38 = sub_220181CE0();
  uint64_t v182 = v63;
  uint64_t v173 = v64;
  uint64_t v140 = v65;
  uint64_t v139 = v66;
  uint64_t v181 = v62;
LABEL_16:
  MEMORY[0x270FA5388](v38);
  sub_220181F60();
  LODWORD(v186) = 0;
  sub_22014FB48(&qword_267F0A0A0, MEMORY[0x263F19D28]);
  sub_220182A60();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F0A130);
  sub_22014EDCC();
  uint64_t v67 = v149;
  sub_220181CF0();
  uint64_t v68 = v155;
  sub_220181EF0();
  sub_22014B510(&qword_267F0A180, &qword_267F0A0E8);
  sub_22014FB48(&qword_267F0A188, MEMORY[0x263F19708]);
  v69 = v150;
  uint64_t v70 = v152;
  uint64_t v71 = v157;
  sub_220182180();
  (*(void (**)(char *, uint64_t))(v156 + 8))(v68, v71);
  (*(void (**)(char *, uint64_t))(v151 + 8))(v67, v70);
  uint64_t v72 = sub_2201821E0();
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v74 = v153;
  uint64_t v75 = v178;
  uint64_t v76 = v154;
  (*(void (**)(uint64_t, char *, uint64_t))(v153 + 16))(v178, v69, v154);
  v77 = (uint64_t *)(v75 + *(int *)(v148 + 36));
  uint64_t *v77 = KeyPath;
  v77[1] = v72;
  (*(void (**)(char *, uint64_t))(v74 + 8))(v69, v76);
  uint64_t v78 = v167;
  sub_22014F114(v167);
  id v79 = objc_msgSend(self, sel_currentDevice);
  id v80 = objc_msgSend(v79, sel_userInterfaceIdiom);

  v138 = v22;
  if (v80)
  {
    uint64_t v81 = v168;
    v82 = v144;
    uint64_t v83 = v169;
    (*(void (**)(char *, void, uint64_t))(v168 + 104))(v144, *MEMORY[0x263F184F8], v169);
    char v84 = sub_220181D00();
    v85 = *(void (**)(char *, uint64_t))(v81 + 8);
    v85(v82, v83);
    if ((v84 & 1) == 0)
    {
      if (qword_267F09D28 != -1) {
        swift_once();
      }
      v87 = &qword_267F0C1E8;
      goto LABEL_27;
    }
    if (qword_267F09D30 != -1) {
      swift_once();
    }
  }
  else
  {
    uint64_t v83 = v169;
    uint64_t v86 = v168;
    if (qword_267F09D30 != -1) {
      swift_once();
    }
    v85 = *(void (**)(char *, uint64_t))(v86 + 8);
  }
  v87 = &qword_267F0C1F0;
LABEL_27:
  uint64_t v88 = *v87;
  swift_retain();
  v85((char *)v78, v83);
  char v89 = sub_220182070();
  uint64_t v90 = v178;
  uint64_t v91 = v162;
  sub_22014FA88(v178, v162, &qword_267F0A0F8);
  uint64_t v92 = v91 + *(int *)(v159 + 36);
  *(void *)uint64_t v92 = v88;
  *(unsigned char *)(v92 + 8) = v89;
  sub_22014ACAC(v90, &qword_267F0A0F8);
  v93 = v171;
  v94 = &v171[*(int *)(v170 + 20)];
  uint64_t v95 = *MEMORY[0x263F19860];
  uint64_t v96 = sub_220181F50();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v96 - 8) + 104))(v94, v95, v96);
  __asm { FMOV            V0.2D, #10.0 }
  _OWORD *v93 = _Q0;
  uint64_t v102 = (uint64_t)v165;
  uint64_t v103 = (uint64_t)&v165[*(int *)(v160 + 36)];
  sub_22014F688((uint64_t)v93, v103, MEMORY[0x263F19048]);
  *(_WORD *)(v103 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267F0A190) + 36)) = 256;
  sub_22014FA88(v91, v102, &qword_267F0A100);
  sub_22014F6F0((uint64_t)v93);
  sub_22014ACAC(v91, &qword_267F0A100);
  LOBYTE(v103) = sub_220182080();
  sub_220181CE0();
  uint64_t v105 = v104;
  uint64_t v107 = v106;
  uint64_t v109 = v108;
  uint64_t v111 = v110;
  uint64_t v112 = v166;
  sub_22014FA88(v102, v166, &qword_267F0A108);
  uint64_t v113 = v112 + *(int *)(v161 + 36);
  *(unsigned char *)uint64_t v113 = v103;
  *(void *)(v113 + 8) = v105;
  *(void *)(v113 + 16) = v107;
  *(void *)(v113 + 24) = v109;
  *(void *)(v113 + 32) = v111;
  *(unsigned char *)(v113 + 40) = 0;
  sub_22014ACAC(v102, &qword_267F0A108);
  LOBYTE(v103) = sub_220182060();
  sub_220181CE0();
  uint64_t v115 = v114;
  uint64_t v117 = v116;
  uint64_t v119 = v118;
  uint64_t v121 = v120;
  uint64_t v122 = v163;
  sub_22014FA88(v112, v163, &qword_267F0A110);
  uint64_t v123 = v122 + *(int *)(v164 + 36);
  *(unsigned char *)uint64_t v123 = v103;
  *(void *)(v123 + 8) = v115;
  *(void *)(v123 + 16) = v117;
  *(void *)(v123 + 24) = v119;
  *(void *)(v123 + 32) = v121;
  *(unsigned char *)(v123 + 40) = 0;
  sub_22014ACAC(v112, &qword_267F0A110);
  uint64_t v124 = v180;
  sub_22014B470(v122, v180, &qword_267F0A118);
  uint64_t v125 = v179;
  sub_22014FA88(v124, v179, &qword_267F0A118);
  uint64_t v126 = (uint64_t)v172;
  uint64_t v127 = v184;
  void *v172 = v185;
  *(void *)(v126 + 8) = v127;
  uint64_t v137 = v39;
  uint64_t v128 = v182;
  uint64_t v129 = v183;
  *(void *)(v126 + 16) = v39;
  *(void *)(v126 + 24) = v129;
  uint64_t v130 = v181;
  *(void *)(v126 + 32) = v181;
  *(void *)(v126 + 40) = v128;
  uint64_t v182 = v128;
  uint64_t v131 = v140;
  *(void *)(v126 + 48) = v173;
  *(void *)(v126 + 56) = v131;
  *(void *)(v126 + 64) = v139;
  *(unsigned char *)(v126 + 72) = 0;
  uint64_t v132 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F0A198);
  sub_22014FA88(v125, v126 + *(int *)(v132 + 48), &qword_267F0A118);
  uint64_t v133 = v185;
  sub_22014F74C(v185, v127, v39, v129);
  uint64_t v184 = v127;
  LOBYTE(v124) = v137;
  uint64_t v183 = v129;
  uint64_t v181 = v130;
  sub_22014F74C(v133, v127, v137, v129);
  sub_22014ACAC(v179, &qword_267F0A118);
  sub_22014F7A0(v133, v127, v124, v129);
  sub_22014FA88(v126, (uint64_t)v138, &qword_267F0A0C0);
  swift_storeEnumTagMultiPayload();
  sub_22014B510(&qword_267F0A0B8, &qword_267F0A0C0);
  uint64_t v134 = sub_22014B510(&qword_267F0A0D0, &qword_267F0A0C8);
  uint64_t v135 = sub_22014FB48(&qword_267F0A0D8, MEMORY[0x263F1A1D8]);
  *(void *)&long long v186 = v141;
  *((void *)&v186 + 1) = v143;
  uint64_t v187 = v134;
  uint64_t v188 = v135;
  swift_getOpaqueTypeConformance2();
  sub_220181FF0();

  sub_22014F7A0(v185, v184, v124, v183);
  sub_22014ACAC(v126, &qword_267F0A0C0);
  return sub_22014ACAC(v180, &qword_267F0A118);
}

uint64_t sub_22014CF18(void *a1)
{
  *(void *)(swift_allocObject() + 16) = a1;
  swift_bridgeObjectRetain();
  id v2 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F0A1A8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F0A148);
  sub_22014B510(&qword_267F0A1B0, &qword_267F0A1A8);
  sub_22014EE40();
  sub_22014FB48(&qword_267F0A1B8, (void (*)(uint64_t))sub_22014F888);
  return sub_220182320();
}

unint64_t sub_22014D058@<X0>(void **a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v83 = a3;
  uint64_t v84 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F0A168);
  uint64_t v5 = *(void *)(v84 - 8);
  MEMORY[0x270FA5388](v84);
  uint64_t v7 = (char *)&v74 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F0A158);
  uint64_t v9 = v8 - 8;
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v74 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v80 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F0A148);
  MEMORY[0x270FA5388](v80);
  uint64_t v81 = (uint64_t)&v74 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = *a1;
  sub_220182570();
  id v14 = a2;
  id v15 = v13;
  uint64_t v16 = sub_220182560();
  uint64_t v17 = (void *)swift_allocObject();
  uint64_t v18 = MEMORY[0x263F8F500];
  id v17[2] = v16;
  v17[3] = v18;
  v17[4] = v14;
  v17[5] = v15;
  uint64_t v19 = (char *)v14;
  id v20 = v15;
  uint64_t v21 = sub_220182560();
  uint64_t v22 = (void *)swift_allocObject();
  v22[2] = v21;
  v22[3] = v18;
  v22[4] = v19;
  v22[5] = v20;
  sub_220182300();
  id v85 = v20;
  uint64_t v86 = v19;
  swift_retain();
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F0A1C0);
  sub_22014F938();
  sub_2201822E0();
  LOBYTE(v18) = sub_220182070();
  sub_220181CE0();
  uint64_t v24 = v23;
  uint64_t v26 = v25;
  uint64_t v28 = v27;
  uint64_t v30 = v29;
  uint64_t v31 = v84;
  (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v11, v7, v84);
  uint64_t v32 = *(int *)(v9 + 44);
  v82 = v11;
  CGRect v33 = &v11[v32];
  *CGRect v33 = v18;
  *((void *)v33 + 1) = v24;
  *((void *)v33 + 2) = v26;
  *((void *)v33 + 3) = v28;
  *((void *)v33 + 4) = v30;
  v33[40] = 0;
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v31);
  sub_220182330();
  sub_220181D70();
  uint64_t v77 = v90;
  char v34 = v91;
  uint64_t v78 = v92;
  unint64_t v35 = v93;
  uint64_t v84 = v94;
  uint64_t v79 = v95;
  int v76 = sub_2201820A0();
  if (qword_267F09CA0 != -1) {
    swift_once();
  }
  sub_220181CE0();
  uint64_t v37 = v36;
  uint64_t v39 = v38;
  uint64_t v41 = v40;
  uint64_t v43 = v42;
  unint64_t v44 = *(void *)&v19[OBJC_IVAR____TtC20UserNotificationsKit44NotificationSummarizationOnboardingViewModel_sources];
  unint64_t v45 = v44 >> 62;
  if (!(v44 >> 62))
  {
    unint64_t v46 = *(void *)((v44 & 0xFFFFFFFFFFFFFF8) + 0x10);
    unint64_t result = swift_bridgeObjectRetain();
    if (v46) {
      goto LABEL_5;
    }
LABEL_23:
    swift_bridgeObjectRelease();
    double v64 = 1.0;
    goto LABEL_24;
  }
  swift_bridgeObjectRetain();
  unint64_t result = sub_220182870();
  unint64_t v46 = result;
  if (!result) {
    goto LABEL_23;
  }
LABEL_5:
  BOOL v48 = __OFSUB__(v46, 1);
  unint64_t v49 = v46 - 1;
  if (v48)
  {
    __break(1u);
  }
  else
  {
    int v75 = v35;
    unint64_t v35 = v44 & 0xC000000000000001;
    if ((v44 & 0xC000000000000001) == 0)
    {
      if ((v49 & 0x8000000000000000) != 0)
      {
LABEL_31:
        __break(1u);
        goto LABEL_32;
      }
      uint64_t v50 = v44 & 0xFFFFFFFFFFFFFF8;
      unint64_t v51 = *(void *)((v44 & 0xFFFFFFFFFFFFFF8) + 0x10);
      unint64_t result = swift_bridgeObjectRelease();
      if (v49 >= v51)
      {
LABEL_32:
        __break(1u);
        goto LABEL_33;
      }
      if (!v45) {
        goto LABEL_10;
      }
      goto LABEL_29;
    }
  }
  MEMORY[0x223C66AB0](v49, v44);
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v50 = v44 & 0xFFFFFFFFFFFFFF8;
  if (!v45)
  {
LABEL_10:
    uint64_t v52 = *(void *)(v50 + 16);
    swift_bridgeObjectRetain();
    if (v52) {
      goto LABEL_11;
    }
    goto LABEL_30;
  }
LABEL_29:
  swift_bridgeObjectRetain();
  uint64_t v52 = sub_220182870();
  if (!v52)
  {
LABEL_30:
    unint64_t result = swift_bridgeObjectRelease();
    __break(1u);
    goto LABEL_31;
  }
LABEL_11:
  unint64_t result = v52 - 1;
  if (__OFSUB__(v52, 1))
  {
LABEL_33:
    __break(1u);
    goto LABEL_34;
  }
  if (!v35)
  {
    if ((result & 0x8000000000000000) == 0)
    {
      if (result < *(void *)((v44 & 0xFFFFFFFFFFFFFF8) + 0x10))
      {
        id v53 = *(id *)(v44 + 8 * result + 32);
        goto LABEL_17;
      }
LABEL_35:
      __break(1u);
      return result;
    }
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  id v53 = (id)MEMORY[0x223C66AB0](result, v44);
LABEL_17:
  uint64_t v54 = v53;
  swift_bridgeObjectRelease();
  id v55 = objc_msgSend(v54, sel_sourceIdentifier);
  uint64_t v56 = sub_220182460();
  uint64_t v58 = v57;

  id v59 = objc_msgSend(v20, sel_sourceIdentifier);
  uint64_t v60 = sub_220182460();
  uint64_t v62 = v61;

  if (v56 == v60 && v58 == v62)
  {
    swift_bridgeObjectRelease_n();
    LOBYTE(v35) = v75;
LABEL_21:
    double v64 = 0.0;
    goto LABEL_24;
  }
  char v63 = sub_220182910();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  double v64 = 1.0;
  LOBYTE(v35) = v75;
  if (v63) {
    goto LABEL_21;
  }
LABEL_24:
  if (qword_267F09CA8 != -1) {
    swift_once();
  }
  uint64_t v65 = qword_267F0C160;
  uint64_t KeyPath = swift_getKeyPath();
  swift_retain();
  uint64_t v67 = sub_220182330();
  uint64_t v69 = v68;
  swift_release();
  swift_release();
  char v89 = v34;
  char v88 = v35;
  char v87 = 0;
  uint64_t v70 = (uint64_t)v82;
  uint64_t v71 = v81;
  sub_22014FA88((uint64_t)v82, v81, &qword_267F0A158);
  uint64_t v72 = v71 + *(int *)(v80 + 36);
  *(void *)uint64_t v72 = v77;
  *(unsigned char *)(v72 + 8) = v89;
  *(void *)(v72 + 16) = v78;
  *(unsigned char *)(v72 + 24) = v88;
  uint64_t v73 = v79;
  *(void *)(v72 + 32) = v84;
  *(void *)(v72 + 40) = v73;
  *(unsigned char *)(v72 + 48) = v76;
  *(void *)(v72 + 56) = v37;
  *(void *)(v72 + 64) = v39;
  *(void *)(v72 + 72) = v41;
  *(void *)(v72 + 80) = v43;
  *(unsigned char *)(v72 + 88) = v87;
  *(double *)(v72 + 96) = v64;
  *(void *)(v72 + 104) = KeyPath;
  *(void *)(v72 + 112) = v65;
  *(void *)(v72 + 120) = v67;
  *(void *)(v72 + 128) = v69;
  sub_22014ACAC(v70, &qword_267F0A158);
  return sub_22014B470(v71, v83, &qword_267F0A148);
}

uint64_t sub_22014D77C@<X0>(uint64_t a1@<X2>, void *a2@<X3>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_220166370(a2, *(void *)(a1+ OBJC_IVAR____TtC20UserNotificationsKit44NotificationSummarizationOnboardingViewModel_sources));
  if (v6)
  {
    char v9 = 0;
    goto LABEL_6;
  }
  unint64_t v7 = result;
  swift_getKeyPath();
  sub_22014FB48((unint64_t *)&qword_267F0A920, (void (*)(uint64_t))type metadata accessor for NotificationSummarizationOnboardingViewModel);
  sub_220181BF0();
  swift_release();
  uint64_t v8 = a1
     + OBJC_IVAR____TtC20UserNotificationsKit44NotificationSummarizationOnboardingViewModel__isSummarizationEnabledByIndex;
  uint64_t result = swift_beginAccess();
  if ((v7 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (v7 < *(void *)(*(void *)v8 + 16))
  {
    char v9 = *(unsigned char *)(*(void *)v8 + v7 + 32);
LABEL_6:
    *a3 = v9;
    return result;
  }
  __break(1u);
  return result;
}

uint64_t sub_22014D894(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  char v6 = *a1;
  uint64_t result = sub_220166370(a5, *(void *)(a4+ OBJC_IVAR____TtC20UserNotificationsKit44NotificationSummarizationOnboardingViewModel_sources));
  if ((v8 & 1) == 0)
  {
    unint64_t v9 = result;
    swift_getKeyPath();
    sub_22014FB48((unint64_t *)&qword_267F0A920, (void (*)(uint64_t))type metadata accessor for NotificationSummarizationOnboardingViewModel);
    sub_220181BF0();
    swift_release();
    swift_getKeyPath();
    sub_220181C10();
    swift_release();
    uint64_t v10 = (uint64_t *)(a4
                    + OBJC_IVAR____TtC20UserNotificationsKit44NotificationSummarizationOnboardingViewModel__isSummarizationEnabledByIndex);
    swift_beginAccess();
    uint64_t v11 = *v10;
    uint64_t result = swift_isUniquelyReferenced_nonNull_native();
    *uint64_t v10 = v11;
    if (result)
    {
      if ((v9 & 0x8000000000000000) == 0) {
        goto LABEL_4;
      }
    }
    else
    {
      uint64_t result = (uint64_t)sub_22014FBCC(v11);
      uint64_t v11 = result;
      *uint64_t v10 = result;
      if ((v9 & 0x8000000000000000) == 0)
      {
LABEL_4:
        if (v9 < *(void *)(v11 + 16))
        {
          *(unsigned char *)(v11 + v9 + 32) = v6;
          swift_endAccess();
          swift_getKeyPath();
          sub_220181C00();
          return swift_release();
        }
LABEL_9:
        __break(1u);
        return result;
      }
    }
    __break(1u);
    goto LABEL_9;
  }
  return result;
}

uint64_t sub_22014DA30@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v22 = sub_220181F20();
  sub_22014DB4C(a1, a2, (uint64_t)v23);
  uint64_t v21 = v23[0];
  uint64_t v6 = v23[1];
  uint64_t v7 = v25;
  char v8 = v26;
  long long v19 = v27;
  long long v20 = v24;
  uint64_t v9 = v28;
  uint64_t v10 = v29;
  char v11 = v30;
  uint64_t v13 = v31;
  uint64_t v12 = v32;
  LOBYTE(a1) = v33;
  char v37 = 0;
  char v36 = v26;
  char v35 = v30;
  char v34 = v33;
  LOBYTE(a2) = sub_2201820C0();
  uint64_t result = sub_220181CE0();
  LOBYTE(v23[0]) = 0;
  *(void *)a3 = v22;
  *(void *)(a3 + 8) = 0x4024000000000000;
  *(unsigned char *)(a3 + 16) = 0;
  *(void *)(a3 + 24) = v21;
  *(void *)(a3 + 32) = v6;
  *(_OWORD *)(a3 + 40) = v20;
  *(void *)(a3 + 56) = v7;
  *(unsigned char *)(a3 + 64) = v8;
  *(_OWORD *)(a3 + 72) = v19;
  *(void *)(a3 + 88) = v9;
  *(void *)(a3 + 96) = v10;
  *(unsigned char *)(a3 + 104) = v11;
  *(void *)(a3 + 112) = v13;
  *(void *)(a3 + 120) = v12;
  *(unsigned char *)(a3 + 128) = (_BYTE)a1;
  *(unsigned char *)(a3 + 136) = a2;
  *(void *)(a3 + 144) = v15;
  *(void *)(a3 + 152) = v16;
  *(void *)(a3 + 160) = v17;
  *(void *)(a3 + 168) = v18;
  *(unsigned char *)(a3 + 176) = v23[0];
  return result;
}

uint64_t sub_22014DB4C@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5 = qword_267F09CA0;
  id v6 = a1;
  if (v5 != -1) {
    swift_once();
  }
  uint64_t v7 = qword_267F0C158;
  type metadata accessor for NotificationSourceIconCache();
  sub_22014FB48((unint64_t *)&qword_267F0A1E0, (void (*)(uint64_t))type metadata accessor for NotificationSourceIconCache);
  uint64_t v8 = sub_220181DE0();
  uint64_t v25 = v9;
  uint64_t KeyPath = swift_getKeyPath();
  swift_getKeyPath();
  sub_22014FB48((unint64_t *)&qword_267F0A920, (void (*)(uint64_t))type metadata accessor for NotificationSummarizationOnboardingViewModel);
  sub_220181BF0();
  swift_release();
  uint64_t v11 = *(void *)(a2 + OBJC_IVAR____TtC20UserNotificationsKit44NotificationSummarizationOnboardingViewModel__iconCache);
  swift_retain();
  uint64_t v12 = sub_220181CA0();
  id v13 = objc_msgSend(v6, sel_displayName);
  sub_220182460();

  uint64_t v14 = sub_2201824A0();
  swift_bridgeObjectRelease();
  uint64_t v15 = &selRef_sourceIdentifier;
  if (v14 > 0) {
    uint64_t v15 = &selRef_displayName;
  }
  id v16 = [v6 *v15];
  sub_220182460();

  sub_22014F7F4();
  uint64_t v17 = sub_220182120();
  uint64_t v19 = v18;
  *(void *)a3 = v6;
  char v21 = v20 & 1;
  *(void *)(a3 + 8) = v7;
  *(void *)(a3 + 16) = v8;
  *(void *)(a3 + 24) = v25;
  *(void *)(a3 + 32) = KeyPath;
  *(unsigned char *)(a3 + 40) = 0;
  *(void *)(a3 + 48) = v12;
  *(void *)(a3 + 56) = v11;
  *(void *)(a3 + 64) = v17;
  *(void *)(a3 + 72) = v18;
  *(unsigned char *)(a3 + 80) = v20 & 1;
  *(void *)(a3 + 88) = v22;
  *(void *)(a3 + 96) = 0;
  *(unsigned char *)(a3 + 104) = 1;
  swift_retain();
  id v23 = v6;
  sub_22014FB90(KeyPath, 0);
  swift_retain();
  swift_retain();
  sub_22014F790(v17, v19, v21);
  swift_bridgeObjectRetain();
  sub_22014F7E4(v17, v19, v21);
  swift_bridgeObjectRelease();
  swift_release();

  sub_22014FB9C(KeyPath, 0);
  swift_release();
  return swift_release();
}

uint64_t sub_22014DE48()
{
  return 0;
}

uint64_t sub_22014DE54()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F0A060);
  sub_2201822A0();
  return v1;
}

void *sub_22014DEA0(void *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *a1 = *a2;
    uint64_t v4 = (void *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    if (*a2)
    {
      uint64_t v7 = a2[1];
      *uint64_t v4 = *a2;
      v4[1] = v7;
      swift_retain();
    }
    else
    {
      *(_OWORD *)a1 = *(_OWORD *)a2;
    }
    uint64_t v9 = a2[2];
    if (v9)
    {
      uint64_t v10 = a2[3];
      v4[2] = v9;
      v4[3] = v10;
      swift_retain();
    }
    else
    {
      *((_OWORD *)v4 + 1) = *((_OWORD *)a2 + 1);
    }
    uint64_t v11 = *(int *)(a3 + 24);
    uint64_t v12 = (void *)((char *)v4 + v11);
    id v13 = (void *)((char *)a2 + v11);
    __swift_instantiateConcreteTypeFromMangledName(&qword_267F0AAA0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v14 = sub_220181D10();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v14 - 8) + 16))(v12, v13, v14);
    }
    else
    {
      *uint64_t v12 = *v13;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v15 = *(int *)(a3 + 28);
    id v16 = (void *)((char *)v4 + v15);
    uint64_t v17 = (char *)a2 + v15;
    uint64_t v18 = *(void **)v17;
    uint64_t v19 = *((void *)v17 + 1);
    *id v16 = *(void *)v17;
    v16[1] = v19;
    id v20 = v18;
  }
  swift_retain();
  return v4;
}

uint64_t sub_22014E028(void *a1, uint64_t a2)
{
  if (*a1) {
    swift_release();
  }
  if (a1[2]) {
    swift_release();
  }
  uint64_t v4 = (char *)a1 + *(int *)(a2 + 24);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F0AAA0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = sub_220181D10();
    (*(void (**)(char *, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  }
  else
  {
    swift_release();
  }

  return swift_release();
}

void *sub_22014E104(void *a1, void *a2, uint64_t a3)
{
  if (*a2)
  {
    uint64_t v6 = a2[1];
    *a1 = *a2;
    a1[1] = v6;
    swift_retain();
  }
  else
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
  }
  uint64_t v7 = a2[2];
  if (v7)
  {
    uint64_t v8 = a2[3];
    a1[2] = v7;
    a1[3] = v8;
    swift_retain();
  }
  else
  {
    *((_OWORD *)a1 + 1) = *((_OWORD *)a2 + 1);
  }
  uint64_t v9 = *(int *)(a3 + 24);
  uint64_t v10 = (void *)((char *)a1 + v9);
  uint64_t v11 = (void *)((char *)a2 + v9);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F0AAA0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v12 = sub_220181D10();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v12 - 8) + 16))(v10, v11, v12);
  }
  else
  {
    *uint64_t v10 = *v11;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v13 = *(int *)(a3 + 28);
  uint64_t v14 = (void *)((char *)a1 + v13);
  uint64_t v15 = (char *)a2 + v13;
  id v16 = *(void **)v15;
  uint64_t v17 = *((void *)v15 + 1);
  *uint64_t v14 = *(void *)v15;
  v14[1] = v17;
  id v18 = v16;
  swift_retain();
  return a1;
}

void *sub_22014E240(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = *a2;
  if (*a1)
  {
    if (v6)
    {
      uint64_t v7 = a2[1];
      *a1 = v6;
      a1[1] = v7;
      swift_retain();
      swift_release();
      goto LABEL_8;
    }
    swift_release();
  }
  else if (v6)
  {
    uint64_t v8 = a2[1];
    *a1 = v6;
    a1[1] = v8;
    swift_retain();
    goto LABEL_8;
  }
  *(_OWORD *)a1 = *(_OWORD *)a2;
LABEL_8:
  uint64_t v9 = a2[2];
  if (a1[2])
  {
    if (v9)
    {
      uint64_t v10 = a2[3];
      a1[2] = v9;
      a1[3] = v10;
      swift_retain();
      swift_release();
      goto LABEL_15;
    }
    swift_release();
  }
  else if (v9)
  {
    uint64_t v11 = a2[3];
    a1[2] = v9;
    a1[3] = v11;
    swift_retain();
    goto LABEL_15;
  }
  *((_OWORD *)a1 + 1) = *((_OWORD *)a2 + 1);
LABEL_15:
  if (a1 != a2)
  {
    uint64_t v12 = *(int *)(a3 + 24);
    uint64_t v13 = (void *)((char *)a1 + v12);
    uint64_t v14 = (void *)((char *)a2 + v12);
    sub_22014ACAC((uint64_t)a1 + v12, &qword_267F0AAA0);
    __swift_instantiateConcreteTypeFromMangledName(&qword_267F0AAA0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v15 = sub_220181D10();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v15 - 8) + 16))(v13, v14, v15);
    }
    else
    {
      void *v13 = *v14;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v16 = *(int *)(a3 + 28);
  uint64_t v17 = (void *)((char *)a1 + v16);
  id v18 = (char *)a2 + v16;
  uint64_t v19 = *(void **)((char *)a1 + v16);
  id v20 = *(void **)v18;
  void *v17 = *(void *)v18;
  id v21 = v20;

  v17[1] = *((void *)v18 + 1);
  swift_retain();
  swift_release();
  return a1;
}

void *sub_22014E404(void *a1, void *a2, uint64_t a3)
{
  if (*a2)
  {
    uint64_t v6 = a2[1];
    *a1 = *a2;
    a1[1] = v6;
  }
  else
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
  }
  uint64_t v7 = a2[2];
  if (v7)
  {
    uint64_t v8 = a2[3];
    a1[2] = v7;
    a1[3] = v8;
  }
  else
  {
    *((_OWORD *)a1 + 1) = *((_OWORD *)a2 + 1);
  }
  uint64_t v9 = *(int *)(a3 + 24);
  uint64_t v10 = (char *)a1 + v9;
  uint64_t v11 = (char *)a2 + v9;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F0AAA0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v13 = sub_220181D10();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 32))(v10, v11, v13);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v10, v11, *(void *)(*(void *)(v12 - 8) + 64));
  }
  *(_OWORD *)((char *)a1 + *(int *)(a3 + 28)) = *(_OWORD *)((char *)a2 + *(int *)(a3 + 28));
  return a1;
}

void *sub_22014E52C(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = *a2;
  if (*a1)
  {
    if (v6)
    {
      uint64_t v7 = a2[1];
      *a1 = v6;
      a1[1] = v7;
      swift_release();
      goto LABEL_8;
    }
    swift_release();
  }
  else if (v6)
  {
    uint64_t v8 = a2[1];
    *a1 = v6;
    a1[1] = v8;
    goto LABEL_8;
  }
  *(_OWORD *)a1 = *(_OWORD *)a2;
LABEL_8:
  uint64_t v9 = a2[2];
  if (a1[2])
  {
    if (v9)
    {
      uint64_t v10 = a2[3];
      a1[2] = v9;
      a1[3] = v10;
      swift_release();
      goto LABEL_15;
    }
    swift_release();
  }
  else if (v9)
  {
    uint64_t v11 = a2[3];
    a1[2] = v9;
    a1[3] = v11;
    goto LABEL_15;
  }
  *((_OWORD *)a1 + 1) = *((_OWORD *)a2 + 1);
LABEL_15:
  if (a1 != a2)
  {
    uint64_t v12 = *(int *)(a3 + 24);
    uint64_t v13 = (char *)a1 + v12;
    uint64_t v14 = (char *)a2 + v12;
    sub_22014ACAC((uint64_t)a1 + v12, &qword_267F0AAA0);
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F0AAA0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v16 = sub_220181D10();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 32))(v13, v14, v16);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v13, v14, *(void *)(*(void *)(v15 - 8) + 64));
    }
  }
  uint64_t v17 = *(int *)(a3 + 28);
  id v18 = (void *)((char *)a1 + v17);
  uint64_t v19 = (void *)((char *)a2 + v17);
  id v20 = *(void **)((char *)a1 + v17);
  *id v18 = *v19;

  v18[1] = v19[1];
  swift_release();
  return a1;
}

uint64_t sub_22014E6DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_22014E6F0);
}

uint64_t sub_22014E6F0(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 2147483646)
  {
    uint64_t v4 = *a1;
    if ((unint64_t)*a1 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    int v5 = v4 - 1;
    if (v5 < 0) {
      int v5 = -1;
    }
    return (v5 + 1);
  }
  else
  {
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F0A068);
    uint64_t v10 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v9 - 8) + 48);
    uint64_t v11 = v9;
    uint64_t v12 = (char *)a1 + *(int *)(a3 + 24);
    return v10(v12, a2, v11);
  }
}

uint64_t sub_22014E7B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_22014E7C4);
}

void *sub_22014E7C4(void *result, uint64_t a2, int a3, uint64_t a4)
{
  int v5 = result;
  if (a3 == 2147483646)
  {
    *uint64_t result = a2;
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F0A068);
    uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = (char *)v5 + *(int *)(a4 + 24);
    return (void *)v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t type metadata accessor for NotificationSummarizationOnboardingCustomizationByAppListView()
{
  uint64_t result = qword_267F0A070;
  if (!qword_267F0A070) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_22014E8BC()
{
  sub_22014E954();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_22014E954()
{
  if (!qword_267F0A080)
  {
    sub_220181D10();
    unint64_t v0 = sub_220181D20();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_267F0A080);
    }
  }
}

uint64_t sub_22014E9AC(uint64_t a1)
{
  uint64_t result = sub_22014FB48(&qword_267F0A088, (void (*)(uint64_t))type metadata accessor for NotificationSummarizationOnboardingCustomizationByAppListView);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_22014EA04()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_22014EA20@<X0>(uint64_t a1@<X8>)
{
  return sub_22014B93C(*(void *)(v1 + 16), a1);
}

unint64_t sub_22014EA28()
{
  unint64_t result = qword_267F0A0B0;
  if (!qword_267F0A0B0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267F0A0A8);
    sub_22014B510(&qword_267F0A0B8, &qword_267F0A0C0);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267F0A0C8);
    sub_220182020();
    sub_22014B510(&qword_267F0A0D0, &qword_267F0A0C8);
    sub_22014FB48(&qword_267F0A0D8, MEMORY[0x263F1A1D8]);
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F0A0B0);
  }
  return result;
}

uint64_t sub_22014EB7C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for NotificationSummarizationOnboardingCustomizationByAppListView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_22014EBE0()
{
  return sub_22014ED50(1);
}

uint64_t objectdestroyTm()
{
  uint64_t v1 = type metadata accessor for NotificationSummarizationOnboardingCustomizationByAppListView();
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*(void *)(v1 - 8) + 64);
  uint64_t v5 = v0 + v3;
  if (*(void *)(v0 + v3)) {
    swift_release();
  }
  if (*(void *)(v5 + 16)) {
    swift_release();
  }
  uint64_t v6 = v5 + *(int *)(v1 + 24);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F0AAA0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_220181D10();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  }
  else
  {
    swift_release();
  }

  swift_release();

  return MEMORY[0x270FA0238](v0, v3 + v4, v2 | 7);
}

uint64_t sub_22014ED48()
{
  return sub_22014ED50(0);
}

uint64_t sub_22014ED50(char a1)
{
  uint64_t v3 = type metadata accessor for NotificationSummarizationOnboardingCustomizationByAppListView();
  uint64_t v5 = *(void *)(v3 - 8);
  uint64_t result = v3 - 8;
  uint64_t v6 = (uint64_t (**)(void))(v1
                                       + ((*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80)));
  if (*v6) {
    return (*v6)(a1 & 1);
  }
  return result;
}

uint64_t sub_22014EDC4()
{
  return sub_22014CF18(*(void **)(v0 + 16));
}

unint64_t sub_22014EDCC()
{
  unint64_t result = qword_267F0A138;
  if (!qword_267F0A138)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267F0A130);
    sub_22014EE40();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F0A138);
  }
  return result;
}

unint64_t sub_22014EE40()
{
  unint64_t result = qword_267F0A140;
  if (!qword_267F0A140)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267F0A148);
    sub_22014EEE0();
    sub_22014B510(&qword_267F0A170, &qword_267F0A178);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F0A140);
  }
  return result;
}

unint64_t sub_22014EEE0()
{
  unint64_t result = qword_267F0A150;
  if (!qword_267F0A150)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267F0A158);
    sub_22014B510(&qword_267F0A160, &qword_267F0A168);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F0A150);
  }
  return result;
}

uint64_t sub_22014EF80@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_22014FB48((unint64_t *)&qword_267F0A920, (void (*)(uint64_t))type metadata accessor for NotificationSummarizationOnboardingViewModel);
  sub_220181BF0();
  swift_release();
  *a2 = *(void *)(v3 + OBJC_IVAR____TtC20UserNotificationsKit44NotificationSummarizationOnboardingViewModel__iconCache);
  return swift_retain();
}

uint64_t sub_22014F034()
{
  return swift_release();
}

uint64_t sub_22014F114@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_220181EE0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F0AAA0);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22014FA88(v2, (uint64_t)v10, &qword_267F0AAA0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v11 = sub_220181D10();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(void *)(v11 - 8) + 32))(a1, v10, v11);
  }
  else
  {
    os_log_type_t v13 = sub_220182600();
    uint64_t v14 = sub_220182050();
    os_log_type_t v15 = v13;
    if (os_log_type_enabled(v14, v13))
    {
      uint64_t v16 = (uint8_t *)swift_slowAlloc();
      uint64_t v17 = swift_slowAlloc();
      v19[1] = a1;
      uint64_t v18 = v17;
      uint64_t v20 = v17;
      *(_DWORD *)uint64_t v16 = 136315138;
      v19[2] = sub_220149888(0x686353726F6C6F43, 0xEB00000000656D65, &v20);
      sub_2201826B0();
      _os_log_impl(&dword_22012C000, v14, v15, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v16, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x223C676F0](v18, -1, -1);
      MEMORY[0x223C676F0](v16, -1, -1);
    }

    sub_220181ED0();
    swift_getAtKeyPath();
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
}

double sub_22014F3D0(uint64_t a1, char a2)
{
  uint64_t v4 = sub_220181EE0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2) {
    return *(double *)&a1;
  }
  swift_retain();
  os_log_type_t v8 = sub_220182600();
  uint64_t v9 = sub_220182050();
  os_log_type_t v10 = v8;
  if (os_log_type_enabled(v9, v8))
  {
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    uint64_t v12 = swift_slowAlloc();
    double v15 = *(double *)&v12;
    *(_DWORD *)uint64_t v11 = 136315138;
    uint64_t v14 = sub_220149888(0x74616F6C464743, 0xE700000000000000, (uint64_t *)&v15);
    sub_2201826B0();
    _os_log_impl(&dword_22012C000, v9, v10, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v11, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x223C676F0](v12, -1, -1);
    MEMORY[0x223C676F0](v11, -1, -1);
  }

  sub_220181ED0();
  swift_getAtKeyPath();
  sub_22014FB9C(a1, 0);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v15;
}

uint64_t sub_22014F5DC@<X0>(void *a1@<X8>)
{
  uint64_t result = sub_220181E10();
  *a1 = v3;
  return result;
}

uint64_t sub_22014F608()
{
  return sub_220181E20();
}

uint64_t sub_22014F630@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_220181EB0();
  *a1 = result;
  return result;
}

uint64_t sub_22014F65C()
{
  return sub_220181EC0();
}

uint64_t sub_22014F688(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_22014F6F0(uint64_t a1)
{
  uint64_t v2 = sub_220181D90();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_22014F74C(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_22014F790(result, a2, a3 & 1);
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_22014F790(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_retain();
  }
  else {
    return swift_bridgeObjectRetain();
  }
}

uint64_t sub_22014F7A0(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_22014F7E4(result, a2, a3 & 1);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_22014F7E4(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

unint64_t sub_22014F7F4()
{
  unint64_t result = qword_267F0A1A0;
  if (!qword_267F0A1A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F0A1A0);
  }
  return result;
}

uint64_t sub_22014F848()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

unint64_t sub_22014F880@<X0>(void **a1@<X0>, uint64_t a2@<X8>)
{
  return sub_22014D058(a1, *(void **)(v2 + 16), a2);
}

unint64_t sub_22014F888()
{
  unint64_t result = qword_267F0A9A0;
  if (!qword_267F0A9A0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_267F0A9A0);
  }
  return result;
}

uint64_t sub_22014F8CC@<X0>(unsigned char *a1@<X8>)
{
  return sub_22014D77C(*(void *)(v1 + 32), *(void **)(v1 + 40), a1);
}

uint64_t objectdestroy_15Tm()
{
  swift_unknownObjectRelease();

  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_22014F924(char *a1)
{
  return sub_22014D894(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32), *(void **)(v1 + 40));
}

uint64_t sub_22014F930@<X0>(uint64_t a1@<X8>)
{
  return sub_22014DA30(*(void **)(v1 + 16), *(void *)(v1 + 24), a1);
}

unint64_t sub_22014F938()
{
  unint64_t result = qword_267F0A1C8;
  if (!qword_267F0A1C8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267F0A1C0);
    sub_22014B510(&qword_267F0A1D0, &qword_267F0A1D8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F0A1C8);
  }
  return result;
}

uint64_t sub_22014F9D8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_220181E30();
  *a1 = result;
  return result;
}

uint64_t sub_22014FA04@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_220181E30();
  *a1 = result;
  return result;
}

uint64_t sub_22014FA30()
{
  return sub_220181E40();
}

uint64_t sub_22014FA5C()
{
  return sub_220181E40();
}

uint64_t sub_22014FA88(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_22014FAEC@<X0>(void *a1@<X8>)
{
  uint64_t result = sub_220181E10();
  *a1 = v3;
  return result;
}

uint64_t sub_22014FB18()
{
  return sub_220181E20();
}

uint64_t sub_22014FB48(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_22014FB90(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_22014FB9C(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    return swift_release();
  }
  return result;
}

uint64_t sub_22014FBA8()
{
  return sub_220166674(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

char *sub_22014FBCC(uint64_t a1)
{
  return sub_22016BE1C(0, *(void *)(a1 + 16), 0, (char *)a1);
}

unint64_t sub_22014FBE4()
{
  unint64_t result = qword_267F0A1E8;
  if (!qword_267F0A1E8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267F0A0E0);
    sub_22014FC60();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F0A1E8);
  }
  return result;
}

unint64_t sub_22014FC60()
{
  unint64_t result = qword_267F0A1F0;
  if (!qword_267F0A1F0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267F0A098);
    sub_22014B510(&qword_267F0A1F8, &qword_267F0A090);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F0A1F0);
  }
  return result;
}

void *sub_22014FD00(void *a1)
{
  return sub_22016BF18(0, a1[2], 0, a1);
}

uint64_t destroy for NotificationSourceIconView(uint64_t a1)
{
  swift_release();
  uint64_t v2 = *(void *)(a1 + 32);
  char v3 = *(unsigned char *)(a1 + 40);

  return sub_22014FB9C(v2, v3);
}

uint64_t initializeWithCopy for NotificationSourceIconView(uint64_t a1, uint64_t a2)
{
  char v3 = *(void **)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  uint64_t v6 = *(void *)(a2 + 32);
  char v7 = *(unsigned char *)(a2 + 40);
  id v8 = v3;
  swift_retain();
  sub_22014FB90(v6, v7);
  *(void *)(a1 + 32) = v6;
  *(unsigned char *)(a1 + 40) = v7;
  return a1;
}

uint64_t assignWithCopy for NotificationSourceIconView(uint64_t a1, void **a2)
{
  uint64_t v2 = a2;
  uint64_t v4 = *a2;
  uint64_t v5 = *(void **)a1;
  *(void *)a1 = *a2;
  id v6 = v4;

  *(void *)(a1 + 8) = v2[1];
  *(void *)(a1 + 16) = v2[2];
  swift_retain();
  swift_release();
  *(void *)(a1 + 24) = v2[3];
  uint64_t v7 = (uint64_t)v2[4];
  LOBYTE(v2) = *((unsigned char *)v2 + 40);
  sub_22014FB90(v7, (char)v2);
  uint64_t v8 = *(void *)(a1 + 32);
  char v9 = *(unsigned char *)(a1 + 40);
  *(void *)(a1 + 32) = v7;
  *(unsigned char *)(a1 + 40) = (_BYTE)v2;
  sub_22014FB9C(v8, v9);
  return a1;
}

__n128 __swift_memcpy41_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 25) = *(_OWORD *)(a2 + 25);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for NotificationSourceIconView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a1;
  *(void *)a1 = *(void *)a2;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_release();
  char v5 = *(unsigned char *)(a2 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  char v7 = *(unsigned char *)(a1 + 40);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(unsigned char *)(a1 + 40) = v5;
  sub_22014FB9C(v6, v7);
  return a1;
}

uint64_t getEnumTagSinglePayload for NotificationSourceIconView(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 41)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for NotificationSourceIconView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 40) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 41) = 1;
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
    *(unsigned char *)(result + 41) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for NotificationSourceIconView()
{
  return &type metadata for NotificationSourceIconView;
}

uint64_t sub_22014FF78()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_22014FF94@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_220182260();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *(void *)(v1 + 16);
  if (v7)
  {
    uint64_t v8 = *(void **)v1;
    double v9 = *(double *)(v1 + 8);
    uint64_t v10 = *(void *)(v1 + 32);
    char v11 = *(unsigned char *)(v1 + 40);
    swift_retain();
    sub_22014FB90(v10, v11);
    double v12 = sub_22014F3D0(v10, v11);
    sub_22014FB9C(v10, v11);
    swift_beginAccess();
    uint64_t v13 = *(void *)(v7 + 64);
    if (*(void *)(v13 + 16))
    {
      id v14 = v8;
      unint64_t v15 = sub_22017A08C(v8, v9, v12);
      if (v16)
      {
        uint64_t v17 = (uint64_t *)(*(void *)(v13 + 56) + 16 * v15);
        uint64_t v18 = *v17;
        uint64_t v19 = (void *)v17[1];
        swift_endAccess();
        swift_retain_n();
        id v20 = v19;

        sub_2201504F0(v18, v19);
        swift_release();
        (*(void (**)(char *, void, uint64_t))(v4 + 104))(v6, *MEMORY[0x263F1B4B8], v3);
        uint64_t v21 = sub_220182280();
        (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
        uint64_t v29 = v21;
        char v30 = 0;
        swift_retain();
        __swift_instantiateConcreteTypeFromMangledName(&qword_267F0A200);
        sub_220150484();
        sub_220181FF0();
        swift_release();
        uint64_t result = swift_release();
LABEL_9:
        char v27 = v32;
        *(void *)a1 = v31;
        *(unsigned char *)(a1 + 8) = v27;
        return result;
      }
    }
    swift_endAccess();
    swift_release();
    swift_retain();
    sub_22014FB90(v10, v11);
    double v23 = sub_22014F3D0(v10, v11);
    sub_22014FB9C(v10, v11);
    sub_220153768(v8, v9, v23);
    swift_release();
    swift_retain();
    sub_22014FB90(v10, v11);
    double v24 = sub_22014F3D0(v10, v11);
    sub_22014FB9C(v10, v11);
    uint64_t v25 = sub_220153D40(v9, v24);
    swift_release();
    if (v25)
    {
      id v26 = v25;
      sub_220182230();
      (*(void (**)(char *, void, uint64_t))(v4 + 104))(v6, *MEMORY[0x263F1B4B8], v3);
      uint64_t v25 = (void *)sub_220182280();

      swift_release();
      (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    }
    uint64_t v29 = (uint64_t)v25;
    char v30 = 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_267F0A200);
    sub_220150484();
    uint64_t result = sub_220181FF0();
    goto LABEL_9;
  }
  type metadata accessor for NotificationSourceIconCache();
  sub_22015042C();
  uint64_t result = sub_220181DD0();
  __break(1u);
  return result;
}

double sub_220150380@<D0>(uint64_t a1@<X8>)
{
  long long v3 = v1[1];
  long long v18 = *v1;
  v19[0] = v3;
  *(_OWORD *)((char *)v19 + 9) = *(long long *)((char *)v1 + 25);
  sub_22014FF94((uint64_t)&v11);
  uint64_t v4 = v11;
  char v5 = v12;
  sub_220182350();
  sub_220181D70();
  uint64_t v6 = v13;
  char v7 = v14;
  uint64_t v8 = v15;
  char v9 = v16;
  *(void *)a1 = v4;
  *(unsigned char *)(a1 + 8) = v5;
  *(void *)(a1 + 16) = v6;
  *(unsigned char *)(a1 + 24) = v7;
  *(void *)(a1 + 32) = v8;
  *(unsigned char *)(a1 + 40) = v9;
  double result = *(double *)&v17;
  *(_OWORD *)(a1 + 48) = v17;
  return result;
}

unint64_t sub_22015042C()
{
  unint64_t result = qword_267F0A1E0;
  if (!qword_267F0A1E0)
  {
    type metadata accessor for NotificationSourceIconCache();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F0A1E0);
  }
  return result;
}

unint64_t sub_220150484()
{
  unint64_t result = qword_267F0A208;
  if (!qword_267F0A208)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267F0A200);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F0A208);
  }
  return result;
}

void sub_2201504F0(uint64_t a1, void *a2)
{
  if (a1)
  {
    swift_release();
  }
}

unint64_t sub_220150534()
{
  unint64_t result = qword_267F0A210;
  if (!qword_267F0A210)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267F0A218);
    sub_2201505B0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F0A210);
  }
  return result;
}

unint64_t sub_2201505B0()
{
  unint64_t result = qword_267F0A220;
  if (!qword_267F0A220)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267F0A228);
    sub_220150484();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F0A220);
  }
  return result;
}

id sub_22015062C()
{
  sub_220150684();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id result = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  qword_267F0C100 = (uint64_t)result;
  return result;
}

unint64_t sub_220150684()
{
  unint64_t result = qword_267F0A230;
  if (!qword_267F0A230)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_267F0A230);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for NotificationsUIFeatureFlags(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 41)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for NotificationsUIFeatureFlags(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 40) = 0;
    *(void *)unint64_t result = (a2 - 1);
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
  *(unsigned char *)(result + 41) = v3;
  return result;
}

ValueMetadata *type metadata accessor for NotificationsUIFeatureFlags()
{
  return &type metadata for NotificationsUIFeatureFlags;
}

uint64_t sub_22015072C()
{
  return *(void *)v0;
}

uint64_t sub_220150738()
{
  return *(void *)(v0 + 24);
}

uint64_t getEnumTagSinglePayload for NotificationSourceCategory(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for NotificationSourceCategory(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x2201508A0);
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

unsigned char *sub_2201508C8(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for NotificationSourceCategory()
{
  return &type metadata for NotificationSourceCategory;
}

unint64_t sub_2201508E0(char a1)
{
  unint64_t result = 0xD000000000000016;
  switch(a1)
  {
    case 1:
      unint64_t result = 0xD000000000000014;
      break;
    case 2:
      unint64_t result = 0x726568746FLL;
      break;
    case 3:
      unint64_t result = 1701736302;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_220150974()
{
  return sub_220164324();
}

uint64_t sub_22015097C()
{
  return sub_220164508();
}

uint64_t sub_220150984()
{
  return sub_2201645D0();
}

uint64_t sub_22015098C@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_220150B98();
  *a1 = result;
  return result;
}

unint64_t sub_2201509BC@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_2201508E0(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

void sub_2201509E8(void *a1@<X8>)
{
  *a1 = &unk_26D1FEB60;
}

uint64_t sub_2201509F8(char *a1, char *a2)
{
  return sub_2201640C8(*a1, *a2);
}

unint64_t sub_220150A08()
{
  unint64_t result = qword_267F0A238;
  if (!qword_267F0A238)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267F0A240);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F0A238);
  }
  return result;
}

unint64_t sub_220150A68()
{
  unint64_t result = qword_267F0A248;
  if (!qword_267F0A248)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F0A248);
  }
  return result;
}

id sub_220150ABC(uint64_t a1, uint64_t a2, char a3)
{
  v10[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t v5 = (void *)sub_220182450();
  swift_bridgeObjectRelease();
  v10[0] = 0;
  id v6 = objc_msgSend(v3, sel_initWithBundleIdentifier_allowPlaceholder_error_, v5, a3 & 1, v10);

  if (v6)
  {
    id v7 = v10[0];
  }
  else
  {
    id v8 = v10[0];
    sub_220181B30();

    swift_willThrow();
  }
  return v6;
}

uint64_t sub_220150B98()
{
  unint64_t v0 = sub_2201828C0();
  swift_bridgeObjectRelease();
  if (v0 >= 4) {
    return 4;
  }
  else {
    return v0;
  }
}

uint64_t sub_220150BE4(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000010 && a2 == 0x80000002201887F0
    || (sub_220182910() & 1) != 0
    || a1 == 0xD000000000000011 && a2 == 0x8000000220188810
    || (sub_220182910() & 1) != 0)
  {
    return 2;
  }
  if (a1 == 0xD000000000000012 && a2 == 0x8000000220188830) {
    return 0;
  }
  char v5 = sub_220182910();
  uint64_t result = 0;
  if (v5) {
    return result;
  }
  if (a1 == 0xD000000000000013 && a2 == 0x8000000220188850) {
    return 0;
  }
  char v6 = sub_220182910();
  uint64_t result = 0;
  if (v6) {
    return result;
  }
  if (a1 == 0xD000000000000015 && a2 == 0x8000000220188870) {
    return 0;
  }
  char v7 = sub_220182910();
  uint64_t result = 0;
  if (v7) {
    return result;
  }
  if (a1 == 0xD000000000000013 && a2 == 0x8000000220188890
    || (sub_220182910() & 1) != 0
    || a1 == 0x6C7070612E6D6F63 && a2 == 0xEE00737069742E65
    || (sub_220182910() & 1) != 0)
  {
    return 2;
  }
  if (a1 == 0xD000000000000010 && a2 == 0x80000002201888B0) {
    return 1;
  }
  char v8 = sub_220182910();
  BOOL v10 = a1 == 0x6C7070612E6D6F63 && a2 == 0xEF636973754D2E65;
  uint64_t result = 1;
  if ((v8 & 1) == 0 && !v10)
  {
    if (sub_220182910()) {
      return 1;
    }
    if (a1 == 0xD000000000000015 && a2 == 0x80000002201888D0) {
      return 2;
    }
    char v11 = sub_220182910();
    BOOL v13 = a1 == 0xD000000000000012 && a2 == 0x80000002201888F0;
    uint64_t result = 2;
    if ((v11 & 1) != 0 || v13) {
      return result;
    }
    if ((sub_220182910() & 1) != 0 || a1 == 0xD000000000000016 && a2 == 0x8000000220188910) {
      return 2;
    }
    char v14 = sub_220182910();
    BOOL v16 = a1 == 0xD000000000000016 && a2 == 0x8000000220188930;
    uint64_t result = 2;
    if ((v14 & 1) != 0 || v16) {
      return result;
    }
    char v17 = sub_220182910();
    BOOL v18 = a1 == 0xD000000000000013 && a2 == 0x8000000220188950;
    BOOL v19 = v18;
    uint64_t result = 2;
    if ((v17 & 1) != 0 || v19) {
      return result;
    }
    if ((sub_220182910() & 1) != 0 || a1 == 0xD000000000000014 && a2 == 0x8000000220188970) {
      return 2;
    }
    char v20 = sub_220182910();
    BOOL v22 = a1 == 0xD000000000000011 && a2 == 0x8000000220188990;
    uint64_t result = 2;
    if ((v20 & 1) != 0 || v22) {
      return result;
    }
    char v23 = sub_220182910();
    BOOL v24 = a1 == 0xD000000000000011 && a2 == 0x80000002201889B0;
    BOOL v25 = v24;
    uint64_t result = 2;
    if ((v23 & 1) != 0 || v25) {
      return result;
    }
    char v26 = sub_220182910();
    BOOL v27 = a1 == 0xD000000000000014 && a2 == 0x80000002201889D0;
    BOOL v28 = v27;
    uint64_t result = 2;
    if ((v26 & 1) != 0 || v28) {
      return result;
    }
    char v29 = sub_220182910();
    BOOL v30 = a1 == 0xD000000000000015 && a2 == 0x80000002201889F0;
    BOOL v31 = v30;
    uint64_t result = 2;
    if ((v29 & 1) != 0 || v31) {
      return result;
    }
    char v32 = sub_220182910();
    BOOL v33 = a1 == 0xD000000000000015 && a2 == 0x8000000220188A10;
    BOOL v34 = v33;
    uint64_t result = 2;
    if ((v32 & 1) != 0 || v34) {
      return result;
    }
    char v35 = sub_220182910();
    BOOL v36 = a1 == 0xD000000000000012 && a2 == 0x8000000220188A30;
    BOOL v37 = v36;
    uint64_t result = 2;
    if ((v35 & 1) != 0 || v37) {
      return result;
    }
    char v38 = sub_220182910();
    BOOL v39 = a1 == 0x6C7070612E6D6F63 && a2 == 0xEE00656D6F482E65;
    BOOL v40 = v39;
    uint64_t result = 2;
    if ((v38 & 1) != 0 || v40) {
      return result;
    }
    char v41 = sub_220182910();
    BOOL v42 = a1 == 0xD000000000000010 && a2 == 0x8000000220188A50;
    BOOL v43 = v42;
    uint64_t result = 2;
    if ((v41 & 1) != 0 || v43) {
      return result;
    }
    char v44 = sub_220182910();
    BOOL v45 = a1 == 0xD000000000000010 && a2 == 0x8000000220188A70;
    BOOL v46 = v45;
    uint64_t result = 2;
    if ((v44 & 1) != 0 || v46) {
      return result;
    }
    char v47 = sub_220182910();
    BOOL v48 = a1 == 0xD000000000000013 && a2 == 0x8000000220188A90;
    BOOL v49 = v48;
    uint64_t result = 2;
    if ((v47 & 1) != 0 || v49) {
      return result;
    }
    char v50 = sub_220182910();
    BOOL v51 = a1 == 0xD000000000000010 && a2 == 0x8000000220188AB0;
    BOOL v52 = v51;
    uint64_t result = 2;
    if ((v50 & 1) != 0 || v52) {
      return result;
    }
    char v53 = sub_220182910();
    BOOL v54 = a1 == 0xD000000000000010 && a2 == 0x8000000220188AD0;
    BOOL v55 = v54;
    uint64_t result = 2;
    if ((v53 & 1) != 0 || v55) {
      return result;
    }
    char v56 = sub_220182910();
    BOOL v57 = a1 == 0x6C7070612E6D6F63 && a2 == 0xEE007370614D2E65;
    BOOL v58 = v57;
    uint64_t result = 2;
    if ((v56 & 1) != 0 || v58) {
      return result;
    }
    if (sub_220182910()) {
      return 2;
    }
    if (a1 == 0xD00000000000001BLL && a2 == 0x8000000220188AF0) {
      return 0;
    }
    char v59 = sub_220182910();
    uint64_t result = 0;
    if (v59) {
      return result;
    }
    if (a1 == 0xD000000000000013 && a2 == 0x8000000220188B10 || (sub_220182910() & 1) != 0) {
      return 2;
    }
    if (a1 == 0xD000000000000014 && a2 == 0x8000000220188B30) {
      return 0;
    }
    char v60 = sub_220182910();
    uint64_t result = 0;
    if (v60) {
      return result;
    }
    if (a1 == 0xD000000000000015 && a2 == 0x8000000220188B50
      || (sub_220182910() & 1) != 0
      || a1 == 0xD000000000000019 && a2 == 0x8000000220188B70
      || (sub_220182910() & 1) != 0)
    {
      return 2;
    }
    if (a1 == 0x6C7070612E6D6F63 && a2 == 0xEE007377656E2E65) {
      return 1;
    }
    char v61 = sub_220182910();
    BOOL v63 = a1 == 0xD000000000000012 && a2 == 0x8000000220188B90;
    uint64_t result = 1;
    if ((v61 & 1) != 0 || v63) {
      return result;
    }
    if (sub_220182910()) {
      return 1;
    }
    if ((a1 != 0xD000000000000013 || a2 != 0x8000000220188BB0) && (sub_220182910() & 1) == 0)
    {
      if (a1 == 0x6C7070612E6D6F63 && a2 == 0xEC00000076742E65 || (sub_220182910() & 1) != 0) {
        return 1;
      }
      if ((a1 != 0xD000000000000011 || a2 != 0x8000000220188BD0) && (sub_220182910() & 1) == 0)
      {
        if (a1 == 0xD000000000000010 && a2 == 0x8000000220188BF0) {
          return 0;
        }
        char v64 = sub_220182910();
        uint64_t result = 0;
        if ((v64 & 1) == 0)
        {
          if (a1 == 0xD00000000000001CLL && a2 == 0x8000000220188C10) {
            return 0;
          }
          char v65 = sub_220182910();
          uint64_t result = 0;
          BOOL v66 = a1 == 0xD000000000000012 && a2 == 0x8000000220188C30;
          BOOL v67 = v66;
          if ((v65 & 1) == 0 && !v67)
          {
            char v68 = sub_220182910();
            uint64_t result = 0;
            BOOL v69 = a1 == 0xD000000000000016 && a2 == 0x8000000220188C50;
            BOOL v70 = v69;
            if ((v68 & 1) == 0 && !v70)
            {
              char v71 = sub_220182910();
              uint64_t result = 0;
              BOOL v72 = a1 == 0xD000000000000019 && a2 == 0x8000000220188C70;
              BOOL v73 = v72;
              if ((v71 & 1) == 0 && !v73)
              {
                char v74 = sub_220182910();
                uint64_t result = 0;
                if ((v74 & 1) == 0)
                {
                  if (a1 == 0xD000000000000018 && a2 == 0x8000000220188C90) {
                    return 0;
                  }
                  char v75 = sub_220182910();
                  uint64_t result = 0;
                  BOOL v76 = a1 == 0xD000000000000013 && a2 == 0x8000000220188CB0;
                  BOOL v77 = v76;
                  if ((v75 & 1) == 0 && !v77)
                  {
                    char v78 = sub_220182910();
                    uint64_t result = 0;
                    if ((v78 & 1) == 0)
                    {
                      if (a1 == 0xD000000000000011 && a2 == 0x8000000220188CD0 || (sub_220182910() & 1) != 0) {
                        return 1;
                      }
                      if (a1 == 0xD000000000000017 && a2 == 0x8000000220188CF0) {
                        return 0;
                      }
                      char v79 = sub_220182910();
                      uint64_t result = 0;
                      BOOL v80 = a1 == 0xD000000000000013 && a2 == 0x8000000220188D10;
                      BOOL v81 = v80;
                      if ((v79 & 1) == 0 && !v81)
                      {
                        char v82 = sub_220182910();
                        uint64_t result = 0;
                        if ((v82 & 1) == 0)
                        {
                          if (a1 == 0xD000000000000016 && a2 == 0x8000000220188D30 || (sub_220182910() & 1) != 0) {
                            return 1;
                          }
                          if (a1 == 0xD000000000000014 && a2 == 0x8000000220188D50) {
                            return 0;
                          }
                          char v83 = sub_220182910();
                          uint64_t result = 0;
                          BOOL v85 = a1 == 0xD000000000000018 && a2 == 0x8000000220188D70;
                          if ((v83 & 1) == 0 && !v85)
                          {
                            char v86 = sub_220182910();
                            uint64_t result = 0;
                            BOOL v87 = a1 == 0xD000000000000015 && a2 == 0x8000000220188D90;
                            BOOL v88 = v87;
                            if ((v86 & 1) == 0 && !v88)
                            {
                              char v89 = sub_220182910();
                              uint64_t result = 0;
                              if ((v89 & 1) == 0)
                              {
                                if (a1 == 0x6E2E64622E6D6F63 && a2 == 0xEF7463656A6F7270) {
                                  return 0;
                                }
                                char v90 = sub_220182910();
                                uint64_t result = 0;
                                BOOL v91 = a1 == 0xD000000000000013 && a2 == 0x8000000220188DB0;
                                BOOL v92 = v91;
                                if ((v90 & 1) == 0 && !v92)
                                {
                                  char v93 = sub_220182910();
                                  uint64_t result = 0;
                                  BOOL v94 = a1 == 0xD000000000000019 && a2 == 0x8000000220188DD0;
                                  BOOL v95 = v94;
                                  if ((v93 & 1) == 0 && !v95)
                                  {
                                    char v96 = sub_220182910();
                                    uint64_t result = 0;
                                    BOOL v97 = a1 == 0xD000000000000016 && a2 == 0x8000000220188DF0;
                                    BOOL v98 = v97;
                                    if ((v96 & 1) == 0 && !v98)
                                    {
                                      char v99 = sub_220182910();
                                      uint64_t result = 0;
                                      if ((v99 & 1) == 0)
                                      {
                                        if (a1 == 0x6F6461622E6D6F63 && a2 == 0xEF6F6F6461422E6FLL) {
                                          return 0;
                                        }
                                        char v100 = sub_220182910();
                                        uint64_t result = 0;
                                        if ((v100 & 1) == 0)
                                        {
                                          if (a1 == 0x6F746365762E6D69 && a2 == 0xED00007070612E72) {
                                            return 0;
                                          }
                                          if (sub_220182910()) {
                                            return 0;
                                          }
                                          else {
                                            return 4;
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
                  }
                }
              }
            }
          }
        }
        return result;
      }
    }
    return 2;
  }
  return result;
}

uint64_t sub_220151CF0(uint64_t a1, char a2, uint64_t a3, unint64_t a4)
{
  uint64_t v4 = 2;
  if ((a2 & 1) == 0 && (a1 & 0xFFFFFFFFFFFFFFFCLL) != 0x1770)
  {
    if (a1 == 6004) {
      return 1;
    }
    if (a1 == 6005) {
      return 0;
    }
    if ((unint64_t)(a1 - 6006) < 3) {
      return 2;
    }
    if ((unint64_t)(a1 - 6009) < 3) {
      return 0x10201u >> (8 * (a1 - 121));
    }
    if ((a1 & 0xFFFFFFFFFFFFFFFCLL) == 0x177C) {
      return 2;
    }
    char v7 = a1 + 0x80;
    if ((unint64_t)(a1 - 6016) <= 0xB)
    {
      if (((1 << v7) & 0xF80) != 0 || ((1 << v7) & 0x16) != 0) {
        return 2;
      }
      if (((1 << v7) & 0x61) != 0) {
        return 1;
      }
    }
    if (!a1) {
      return 2;
    }
    if (qword_267F09C80 != -1) {
      swift_once();
    }
    uint64_t v9 = sub_220181C80();
    __swift_project_value_buffer(v9, (uint64_t)qword_267F0C120);
    swift_bridgeObjectRetain_n();
    BOOL v10 = sub_220181C60();
    os_log_type_t v11 = sub_2201825F0();
    if (os_log_type_enabled(v10, v11))
    {
      uint64_t v12 = swift_slowAlloc();
      uint64_t v13 = swift_slowAlloc();
      uint64_t v16 = v13;
      *(_DWORD *)uint64_t v12 = 136446466;
      __swift_instantiateConcreteTypeFromMangledName(&qword_267F0A258);
      uint64_t v14 = sub_220182470();
      sub_220149888(v14, v15, &v16);
      sub_2201826B0();
      swift_bridgeObjectRelease();
      *(_WORD *)(v12 + 12) = 2082;
      swift_bridgeObjectRetain();
      sub_220149888(a3, a4, &v16);
      sub_2201826B0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_22012C000, v10, v11, "Unknown iTunesCategory: %{public}s for bundleId: %{public}s", (uint8_t *)v12, 0x16u);
      uint64_t v4 = 2;
      swift_arrayDestroy();
      MEMORY[0x223C676F0](v13, -1, -1);
      MEMORY[0x223C676F0](v12, -1, -1);
    }
    else
    {

      uint64_t v4 = 2;
      swift_bridgeObjectRelease_n();
    }
  }
  return v4;
}

uint64_t sub_220151FD8(uint64_t a1, unint64_t a2)
{
  uint64_t v4 = sub_220150BE4(a1, a2);
  if (v4 == 4)
  {
    id v5 = objc_allocWithZone(MEMORY[0x263F01878]);
    swift_bridgeObjectRetain();
    id v6 = sub_220150ABC(a1, a2, 1);
    char v7 = v6;
    if (v6)
    {
      id v8 = objc_msgSend(v6, sel_iTunesMetadata);
      id v9 = objc_msgSend(v8, sel_genreIdentifier);

      char v10 = 0;
    }
    else
    {
      id v9 = 0;
      char v10 = 1;
    }
    uint64_t v4 = sub_220151CF0((uint64_t)v9, v10, a1, a2);
  }
  return v4;
}

uint64_t sub_220152308(unint64_t a1)
{
  if (a1 >> 62) {
    goto LABEL_29;
  }
  uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (!v2)
  {
LABEL_30:
    uint64_t v4 = (void *)MEMORY[0x263F8EE80];
LABEL_31:
    swift_bridgeObjectRelease();
    return (uint64_t)v4;
  }
LABEL_3:
  if (v2 >= 1)
  {
    uint64_t v3 = 0;
    uint64_t v4 = (void *)MEMORY[0x263F8EE80];
    uint64_t v32 = v2;
    while (1)
    {
      if ((a1 & 0xC000000000000001) != 0) {
        id v6 = (id)MEMORY[0x223C66AB0](v3, a1);
      }
      else {
        id v6 = *(id *)(a1 + 8 * v3 + 32);
      }
      char v7 = v6;
      id v8 = objc_msgSend(v6, sel_sourceIdentifier);
      uint64_t v9 = sub_220182460();
      unint64_t v11 = v10;

      unsigned __int8 v12 = sub_220151FD8(v9, v11);
      swift_bridgeObjectRelease();
      if (v4[2])
      {
        unint64_t v13 = sub_22017A15C(v12);
        uint64_t v14 = MEMORY[0x263F8EE78];
        if (v15)
        {
          uint64_t v14 = *(void *)(v4[7] + 8 * v13);
          swift_bridgeObjectRetain();
        }
      }
      else
      {
        uint64_t v14 = MEMORY[0x263F8EE78];
      }
      id v16 = v7;
      uint64_t v17 = swift_bridgeObjectRetain();
      MEMORY[0x223C667E0](v17);
      if (*(void *)((v14 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v14 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        sub_220182520();
      }
      sub_220182540();
      sub_220182510();
      uint64_t v18 = v14;
      swift_bridgeObjectRelease();

      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      unint64_t v21 = sub_22017A15C(v12);
      uint64_t v22 = v4[2];
      BOOL v23 = (v20 & 1) == 0;
      uint64_t v24 = v22 + v23;
      if (__OFADD__(v22, v23))
      {
        __break(1u);
LABEL_28:
        __break(1u);
LABEL_29:
        swift_bridgeObjectRetain();
        uint64_t v2 = sub_220182870();
        if (!v2) {
          goto LABEL_30;
        }
        goto LABEL_3;
      }
      char v25 = v20;
      if (v4[3] >= v24)
      {
        if (isUniquelyReferenced_nonNull_native)
        {
          if (v20) {
            goto LABEL_5;
          }
        }
        else
        {
          sub_22017CFE8();
          if (v25) {
            goto LABEL_5;
          }
        }
      }
      else
      {
        sub_22017AB7C(v24, isUniquelyReferenced_nonNull_native);
        unint64_t v26 = sub_22017A15C(v12);
        if ((v25 & 1) != (v27 & 1)) {
          goto LABEL_33;
        }
        unint64_t v21 = v26;
        if (v25)
        {
LABEL_5:
          uint64_t v5 = v4[7];
          swift_bridgeObjectRelease();
          *(void *)(v5 + 8 * v21) = v18;
          goto LABEL_6;
        }
      }
      v4[(v21 >> 6) + 8] |= 1 << v21;
      *(unsigned char *)(v4[6] + v21) = v12;
      *(void *)(v4[7] + 8 * v21) = v18;
      uint64_t v28 = v4[2];
      BOOL v29 = __OFADD__(v28, 1);
      uint64_t v30 = v28 + 1;
      if (v29) {
        goto LABEL_28;
      }
      v4[2] = v30;
LABEL_6:
      ++v3;

      swift_bridgeObjectRelease();
      if (v32 == v3) {
        goto LABEL_31;
      }
    }
  }
  __break(1u);
LABEL_33:
  uint64_t result = sub_220182940();
  __break(1u);
  return result;
}

id sub_22015260C()
{
  id v1 = objc_msgSend(v0, sel_icon);
  id v2 = objc_msgSend(v1, sel_applicationIdentifier);

  if (v2)
  {
    sub_220182460();

    id v3 = objc_allocWithZone(MEMORY[0x263F4B540]);
    uint64_t v4 = (void *)sub_220182450();
    swift_bridgeObjectRelease();
    id v5 = objc_msgSend(v3, sel_initWithBundleIdentifier_, v4);
  }
  else
  {
    id v6 = objc_msgSend(v0, sel_icon);
    id v7 = objc_msgSend(v6, sel_name);

    if (v7)
    {
      sub_220182460();

      id v5 = sub_220152800();
    }
    else
    {
      id v8 = objc_msgSend(v0, sel_icon);
      id v9 = objc_msgSend(v8, sel_data);

      if (v9)
      {
        uint64_t v10 = sub_220181B90();
        unint64_t v12 = v11;

        id v5 = sub_220152A34(v10, v12);
        sub_220152D94(v10, v12);
        return v5;
      }
      id v14 = objc_msgSend(v0, sel_icon);
      id v5 = objc_msgSend(v14, sel_path);

      if (!v5) {
        return v5;
      }
      sub_220182460();

      id v5 = sub_220152BE8();
    }
    swift_bridgeObjectRelease();
  }
  return v5;
}

id sub_220152800()
{
  id v1 = objc_msgSend(v0, sel_bundlePath);
  sub_220182460();

  id v2 = objc_allocWithZone(MEMORY[0x263F086E0]);
  id v3 = (void *)sub_220182450();
  swift_bridgeObjectRelease();
  id v4 = objc_msgSend(v2, sel_initWithPath_, v3);

  swift_bridgeObjectRetain();
  id v5 = (void *)sub_220182450();
  swift_bridgeObjectRelease();
  id v6 = objc_msgSend(self, sel_imageNamed_inBundle_, v5, v4);

  if (!v6) {
    return 0;
  }
  id v7 = v6;
  id v8 = objc_msgSend(v7, sel_CGImage);
  if (!v8)
  {

    return 0;
  }
  id v9 = v8;
  objc_msgSend(v7, sel_scale);
  id v11 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F4B500]), sel_initWithCGImage_scale_, v9, v10);

  __swift_instantiateConcreteTypeFromMangledName(&qword_267F0A9F0);
  uint64_t v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_2201863F0;
  *(void *)(v12 + 32) = v11;
  sub_220182510();
  id v13 = objc_allocWithZone(MEMORY[0x263F4B540]);
  sub_220152DEC();
  id v14 = v11;
  char v15 = (void *)sub_2201824E0();
  swift_bridgeObjectRelease();
  id v16 = objc_msgSend(v13, sel_initWithImages_, v15);

  return v16;
}

id sub_220152A34(uint64_t a1, unint64_t a2)
{
  id v4 = objc_allocWithZone(MEMORY[0x263F827E8]);
  sub_220152E2C(a1, a2);
  id v5 = (void *)sub_220181B80();
  id v6 = objc_msgSend(v4, sel_initWithData_, v5);
  sub_220152D94(a1, a2);

  if (!v6) {
    return 0;
  }
  id v7 = v6;
  id v8 = objc_msgSend(v7, sel_CGImage);
  if (!v8)
  {

    return 0;
  }
  id v9 = v8;
  objc_msgSend(v7, sel_scale);
  id v11 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F4B500]), sel_initWithCGImage_scale_, v9, v10);

  __swift_instantiateConcreteTypeFromMangledName(&qword_267F0A9F0);
  uint64_t v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_2201863F0;
  *(void *)(v12 + 32) = v11;
  sub_220182510();
  id v13 = objc_allocWithZone(MEMORY[0x263F4B540]);
  sub_220152DEC();
  id v14 = v11;
  char v15 = (void *)sub_2201824E0();
  swift_bridgeObjectRelease();
  id v16 = objc_msgSend(v13, sel_initWithImages_, v15);

  return v16;
}

id sub_220152BE8()
{
  id v0 = objc_allocWithZone(MEMORY[0x263F827E8]);
  swift_bridgeObjectRetain();
  id v1 = (void *)sub_220182450();
  swift_bridgeObjectRelease();
  id v2 = objc_msgSend(v0, sel_initWithContentsOfFile_, v1);

  if (!v2) {
    return 0;
  }
  id v3 = v2;
  id v4 = objc_msgSend(v3, sel_CGImage);
  if (!v4)
  {

    return 0;
  }
  id v5 = v4;
  objc_msgSend(v3, sel_scale);
  id v7 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F4B500]), sel_initWithCGImage_scale_, v5, v6);

  __swift_instantiateConcreteTypeFromMangledName(&qword_267F0A9F0);
  uint64_t v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_2201863F0;
  *(void *)(v8 + 32) = v7;
  sub_220182510();
  id v9 = objc_allocWithZone(MEMORY[0x263F4B540]);
  sub_220152DEC();
  id v10 = v7;
  id v11 = (void *)sub_2201824E0();
  swift_bridgeObjectRelease();
  id v12 = objc_msgSend(v9, sel_initWithImages_, v11);

  return v12;
}

uint64_t sub_220152D94(uint64_t a1, unint64_t a2)
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

unint64_t sub_220152DEC()
{
  unint64_t result = qword_267F0A260;
  if (!qword_267F0A260)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_267F0A260);
  }
  return result;
}

uint64_t sub_220152E2C(uint64_t a1, unint64_t a2)
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

uint64_t sub_220152E84(uint64_t a1)
{
  return sub_220152EC8(a1, qword_267F0C108);
}

uint64_t sub_220152EA4(uint64_t a1)
{
  return sub_220152EC8(a1, qword_267F0C120);
}

uint64_t sub_220152EC8(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_220181C80();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  return sub_220181C70();
}

uint64_t sub_220152F40@<X0>(uint64_t a1@<X8>)
{
  if (qword_267F09C70 != -1) {
    swift_once();
  }
  id v2 = (id)qword_267F0C100;
  uint64_t v3 = (void *)sub_220182450();
  id v4 = (void *)sub_220182450();
  id v5 = objc_msgSend(v2, sel_URLForResource_withExtension_, v3, v4);

  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F09E10);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (v5)
  {
    sub_220181B60();

    uint64_t v9 = sub_220181B70();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v8, 0, 1, v9);
  }
  else
  {
    uint64_t v10 = sub_220181B70();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v8, 1, 1, v10);
  }
  sub_22015311C((uint64_t)v8, a1);
  return swift_bridgeObjectRelease();
}

uint64_t sub_22015311C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F09E10);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_220153184()
{
  uint64_t result = sub_2201820E0();
  qword_267F0C140 = result;
  return result;
}

uint64_t sub_2201531A4()
{
  uint64_t result = sub_220182210();
  qword_267F0C148 = result;
  return result;
}

void sub_2201531C4()
{
  qword_267F0C150 = 0x4030000000000000;
}

void sub_2201531D4()
{
  qword_267F0C158 = 0x4040000000000000;
}

uint64_t sub_2201531E4(uint64_t a1)
{
  return sub_220153534(a1, MEMORY[0x263F1B3B8], &qword_267F0C160);
}

void sub_220153208()
{
  qword_267F0C168 = 0x4030000000000000;
}

uint64_t sub_220153218()
{
  uint64_t result = sub_2201820F0();
  qword_267F0C170 = result;
  return result;
}

uint64_t sub_220153238()
{
  uint64_t result = sub_220182200();
  qword_267F0C178 = result;
  return result;
}

uint64_t sub_220153258()
{
  uint64_t result = sub_2201820E0();
  qword_267F0C180 = result;
  return result;
}

uint64_t sub_220153278()
{
  uint64_t result = sub_220182210();
  qword_267F0C188 = result;
  return result;
}

void sub_220153298()
{
  qword_267F0C190 = 0x402E000000000000;
}

uint64_t sub_2201532A8()
{
  uint64_t result = sub_2201821D0();
  qword_267F0C198 = result;
  return result;
}

void sub_2201532C8()
{
  qword_267F0C1A0 = 0x4000000000000000;
}

void sub_2201532D8()
{
  qword_267F0C1A8 = 0x402C000000000000;
}

uint64_t sub_2201532E8(uint64_t a1)
{
  return sub_220153534(a1, MEMORY[0x263F1B3B8], &qword_267F0C1B0);
}

uint64_t sub_22015330C(uint64_t a1)
{
  return sub_220153420(0.219607843, 0.22745098, a1, &qword_267F0C1B8);
}

uint64_t sub_22015332C(uint64_t a1)
{
  return sub_220153420(0.419607843, 0.42745098, a1, &qword_267F0C1C0);
}

uint64_t sub_220153348()
{
  if (qword_267F09CE0 != -1) {
    swift_once();
  }
  qword_267F0C1C8 = qword_267F0C198;

  return swift_retain();
}

uint64_t sub_2201533AC()
{
  uint64_t result = sub_2201820D0();
  qword_267F0C1D0 = result;
  return result;
}

void sub_2201533CC()
{
  qword_267F0C1D8 = 0x656C63726963;
  unk_267F0C1E0 = 0xE600000000000000;
}

uint64_t sub_2201533EC(uint64_t a1)
{
  return sub_220153420(0.949019608, 0.949019608, a1, &qword_267F0C1E8);
}

uint64_t sub_220153404(uint64_t a1)
{
  return sub_220153420(0.152941176, 0.164705882, a1, &qword_267F0C1F0);
}

uint64_t sub_220153420(double a1, double a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v7 = sub_2201821C0();
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void))(v10 + 104))(v9, *MEMORY[0x263F1B388]);
  uint64_t result = MEMORY[0x223C66530](v9, a1, a1, a2, 1.0);
  *a4 = result;
  return result;
}

uint64_t sub_220153508(uint64_t a1)
{
  return sub_220153534(a1, MEMORY[0x263F1B3C0], &qword_267F0C1F8);
}

uint64_t sub_220153534(uint64_t a1, void (*a2)(void), uint64_t *a3)
{
  a2();
  uint64_t v4 = sub_2201821F0();
  uint64_t result = swift_release();
  *a3 = v4;
  return result;
}

double sub_22015358C()
{
  double result = 0.0;
  xmmword_267F0C200 = xmmword_220186440;
  return result;
}

void sub_2201535A0()
{
  qword_267F0C210 = 0x4008000000000000;
}

uint64_t sub_2201535B0()
{
  uint64_t result = sub_220182A50();
  qword_267F0C218 = result;
  unk_267F0C220 = v1;
  return result;
}

uint64_t sub_2201535DC()
{
  uint64_t result = sub_220182A50();
  qword_267F0C228 = result;
  unk_267F0C230 = v1;
  return result;
}

uint64_t sub_22015360C()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F0A268);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_220186450;
  strcpy((char *)(v0 + 32), "Not Summarized");
  *(unsigned char *)(v0 + 47) = -18;
  *(_OWORD *)(v0 + 48) = xmmword_220186460;
  *(unsigned char *)(v0 + 64) = 0;
  *(void *)(v0 + 72) = 0x7A6972616D6D7553;
  *(void *)(v0 + 80) = 0xEA00000000006465;
  if (qword_267F09D50 != -1) {
    swift_once();
  }
  *(void *)(v0 + 88) = MEMORY[0x223C66D40](qword_267F0C218, unk_267F0C220, 3000000000000000000, 0);
  *(void *)(v0 + 96) = v1;
  *(unsigned char *)(v0 + 104) = 1;
  strcpy((char *)(v0 + 112), "Not Summarized");
  *(unsigned char *)(v0 + 127) = -18;
  if (qword_267F09D58 != -1) {
    swift_once();
  }
  uint64_t result = MEMORY[0x223C66D40](qword_267F0C228, unk_267F0C230, 2000000000000000000, 0);
  *(void *)(v0 + 128) = result;
  *(void *)(v0 + 136) = v3;
  *(unsigned char *)(v0 + 144) = 1;
  qword_267F0C238 = v0;
  return result;
}

void sub_220153768(void *a1, double a2, double a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = sub_220182400();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  id v11 = (uint64_t *)((char *)&v58 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_220149EE0(0, &qword_267F0A278);
  uint64_t *v11 = sub_220182620();
  (*(void (**)(uint64_t *, void, uint64_t))(v9 + 104))(v11, *MEMORY[0x263F8F0E8], v8);
  char v12 = sub_220182410();
  (*(void (**)(uint64_t *, uint64_t))(v9 + 8))(v11, v8);
  if (v12)
  {
    swift_beginAccess();
    uint64_t v13 = *(void *)(v4[8] + 16);
    id v60 = a1;
    if (v13)
    {
      sub_22017A08C(a1, a2, a3);
      if (v14)
      {
        swift_endAccess();

        return;
      }
    }
    uint64_t v58 = (uint64_t)a1;
    swift_endAccess();
    swift_beginAccess();
    uint64_t v15 = v4[6];
    uint64_t v16 = *(void *)(v15 + 16);
    char v59 = v4;
    if (v16)
    {
      sub_2201829B0();
      sub_2201829D0();
      id v17 = v60;
      swift_bridgeObjectRetain();
      sub_2201826A0();

      sub_2201829E0();
      sub_2201829E0();
      uint64_t v18 = sub_220182A00();
      uint64_t v19 = -1 << *(unsigned char *)(v15 + 32);
      unint64_t v20 = v18 & ~v19;
      if ((*(void *)(v15 + 56 + ((v20 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v20))
      {
        uint64_t v21 = ~v19;
        do
        {
          uint64_t v22 = *(void *)(v15 + 48);
          BOOL v23 = *(void **)(v22 + 24 * v20);
          if (v23)
          {
            uint64_t v24 = v22 + 24 * v20;
            double v26 = *(double *)(v24 + 8);
            double v25 = *(double *)(v24 + 16);
            sub_220149EE0(0, (unint64_t *)&qword_267F0A9A0);
            id v27 = v17;
            id v28 = v23;
            char v29 = sub_220182690();

            if ((v29 & 1) != 0 && v26 == a2 && v25 == a3) {
              goto LABEL_29;
            }
          }
          unint64_t v20 = (v20 + 1) & v21;
        }
        while (((*(void *)(v15 + 56 + ((v20 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v20) & 1) != 0);
      }
      swift_bridgeObjectRelease();
      uint64_t v4 = v59;
    }
    swift_beginAccess();
    uint64_t v31 = v4[7];
    if (*(void *)(v31 + 16))
    {
      sub_2201829B0();
      sub_2201829D0();
      id v32 = v60;
      swift_bridgeObjectRetain();
      sub_2201826A0();

      sub_2201829E0();
      sub_2201829E0();
      uint64_t v33 = sub_220182A00();
      uint64_t v34 = -1 << *(unsigned char *)(v31 + 32);
      unint64_t v35 = v33 & ~v34;
      if ((*(void *)(v31 + 56 + ((v35 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v35))
      {
        uint64_t v36 = ~v34;
        while (1)
        {
          uint64_t v37 = *(void *)(v31 + 48);
          char v38 = *(void **)(v37 + 24 * v35);
          if (v38)
          {
            uint64_t v39 = v37 + 24 * v35;
            double v41 = *(double *)(v39 + 8);
            double v40 = *(double *)(v39 + 16);
            sub_220149EE0(0, (unint64_t *)&qword_267F0A9A0);
            id v27 = v32;
            id v42 = v38;
            char v43 = sub_220182690();

            if ((v43 & 1) != 0 && v41 == a2 && v40 == a3) {
              break;
            }
          }
          unint64_t v35 = (v35 + 1) & v36;
          if (((*(void *)(v31 + 56 + ((v35 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v35) & 1) == 0) {
            goto LABEL_30;
          }
        }
LABEL_29:

        swift_bridgeObjectRelease();
        return;
      }
LABEL_30:
      swift_bridgeObjectRelease();
      uint64_t v4 = v59;
    }
    swift_beginAccess();
    uint64_t v45 = v4[5];
    uint64_t v46 = *(void *)(v45 + 16);
    if (v46)
    {
      swift_bridgeObjectRetain();
      unint64_t v47 = 0;
      BOOL v48 = (double *)(v45 + 48);
      do
      {
        BOOL v49 = (void *)*((void *)v48 - 2);
        if (v49)
        {
          double v51 = *(v48 - 1);
          double v50 = *v48;
          sub_220149EE0(0, (unint64_t *)&qword_267F0A9A0);
          id v52 = v60;
          id v53 = v49;
          char v54 = sub_220182690();

          if ((v54 & 1) != 0 && v51 == a2 && v50 == a3)
          {
            swift_bridgeObjectRelease();
            swift_beginAccess();
            char v56 = (void *)sub_220154248(v47);
            swift_endAccess();

            goto LABEL_43;
          }
        }
        ++v47;
        v48 += 3;
      }
      while (v46 != v47);
      swift_bridgeObjectRelease();
    }
LABEL_43:
    swift_beginAccess();
    id v57 = v60;
    sub_2201612A4(0, 0, v58, a2, a3);
    swift_endAccess();
    sub_220154338();
  }
  else
  {
    __break(1u);
  }
}

id sub_220153D40(double a1, double a2)
{
  id v5 = (uint64_t *)(v2 + 72);
  swift_beginAccess();
  uint64_t v6 = *(void *)(v2 + 72);
  if (*(void *)(v6 + 16) && (unint64_t v7 = sub_22017A08C(0, a1, a2), (v8 & 1) != 0))
  {
    uint64_t v9 = *(void **)(*(void *)(v6 + 56) + 8 * v7);
    swift_endAccess();
    return v9;
  }
  else
  {
    swift_endAccess();
    id v11 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F4B558]), sel_initWithSize_scale_, a1, a1, a2);
    objc_msgSend(v11, sel_setDrawBorder_, 1);
    id v12 = objc_msgSend(self, sel_genericApplicationIcon);
    id v13 = objc_msgSend(v12, sel_CGImageForDescriptor_, v11);
    id v14 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F827E8]), sel_initWithCGImage_, v13);

    swift_beginAccess();
    id v10 = v14;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v17 = *v5;
    uint64_t *v5 = 0x8000000000000000;
    sub_22017C44C((uint64_t)v10, 0, isUniquelyReferenced_nonNull_native, a1, a2);
    uint64_t *v5 = v17;
    swift_bridgeObjectRelease();
    swift_endAccess();
  }
  return v10;
}

uint64_t sub_220153EF0(uint64_t a1, void *a2)
{
  if (a2)
  {
    sub_2201829D0();
    id v3 = a2;
    sub_2201826A0();
  }
  else
  {
    sub_2201829D0();
  }
  sub_2201829E0();
  return sub_2201829E0();
}

uint64_t sub_220153F84(void *a1)
{
  sub_2201829B0();
  sub_2201829D0();
  if (a1)
  {
    id v2 = a1;
    sub_2201826A0();
  }
  sub_2201829E0();
  sub_2201829E0();
  return sub_220182A00();
}

uint64_t sub_220154028()
{
  return sub_220153F84(*v0);
}

uint64_t sub_220154034(uint64_t a1)
{
  return sub_220153EF0(a1, *v1);
}

uint64_t sub_220154040()
{
  uint64_t v1 = *v0;
  sub_2201829B0();
  sub_2201829D0();
  if (v1)
  {
    id v2 = v1;
    sub_2201826A0();
  }
  sub_2201829E0();
  sub_2201829E0();
  return sub_220182A00();
}

BOOL sub_2201540D4(uint64_t a1, uint64_t a2)
{
  return sub_2201553B0(*(void *)a1, *(void **)a2, *(double *)(a1 + 8), *(double *)(a1 + 16), *(double *)(a2 + 8), *(double *)(a2 + 16));
}

void *sub_2201540F0(uint64_t a1)
{
  id v2 = (void *)v1;
  *(unsigned char *)(v1 + 16) = 0;
  sub_220149EE0(0, &qword_267F0A278);
  uint64_t v4 = sub_2201823D0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  unint64_t v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t))(v5 + 104))(v7, *MEMORY[0x263F8F070], v4);
  uint64_t v8 = sub_220182640();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  uint64_t v9 = MEMORY[0x263F8EE78];
  v2[3] = v8;
  uint64_t v10 = MEMORY[0x263F8EE88];
  v2[5] = v9;
  v2[6] = v10;
  v2[7] = v10;
  v2[8] = sub_220164734(v9);
  v2[9] = sub_22016487C(v9);
  v2[4] = a1;
  return v2;
}

uint64_t sub_220154248(unint64_t a1)
{
  id v3 = *v1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    id v3 = sub_22014FD00(v3);
  }
  unint64_t v4 = v3[2];
  if (v4 <= a1)
  {
    __break(1u);
  }
  else
  {
    unint64_t v5 = v4 - 1;
    uint64_t v6 = v4 - 1 - a1;
    if (v6 >= 0)
    {
      unint64_t v7 = &v3[3 * a1];
      uint64_t v8 = v7[4];
      memmove(v7 + 4, v7 + 7, 24 * v6);
      v3[2] = v5;
      void *v1 = v3;
      return v8;
    }
  }
  uint64_t result = sub_2201828B0();
  __break(1u);
  return result;
}

uint64_t sub_220154338()
{
  uint64_t v1 = v0;
  id v2 = v0 + 5;
  uint64_t result = swift_beginAccess();
  uint64_t v4 = v0[5];
  int64_t v5 = *(void *)(v4 + 16);
  if (v5)
  {
    uint64_t result = swift_beginAccess();
    uint64_t v6 = *(void *)(v1[6] + 16);
    uint64_t v7 = v1[4];
    BOOL v8 = __OFSUB__(v7, v6);
    uint64_t v9 = v7 - v6;
    if (!((v9 < 0) ^ v8 | (v9 == 0)))
    {
      double v50 = v2;
      if (v9 >= v5) {
        int64_t v10 = v5;
      }
      else {
        int64_t v10 = v9;
      }
      unint64_t v49 = v10;
      v48[1] = sub_22015494C(v10, v4);
      int64_t v14 = v13 >> 1;
      if (v13 >> 1 == v12)
      {
        swift_bridgeObjectRetain();
      }
      else
      {
        uint64_t v15 = v11;
        uint64_t v16 = v12;
        uint64_t v17 = self;
        uint64_t result = sub_2201823C0();
        uint64_t v56 = result;
        BOOL v18 = v14 <= v16;
        uint64_t v19 = v14 - v16;
        if (v18) {
          goto LABEL_19;
        }
        uint64_t v53 = v1[3];
        id v52 = v65;
        uint64_t v51 = v56 - 8;
        swift_bridgeObjectRetain();
        unint64_t v20 = (double *)(v15 + 24 * v16 + 16);
        BOOL v55 = v1 + 6;
        char v54 = v17;
        do
        {
          uint64_t v62 = v20;
          uint64_t v63 = v19;
          uint64_t v21 = (void *)*((void *)v20 - 2);
          double v22 = *(v20 - 1);
          double v23 = *v20;
          swift_beginAccess();
          id v24 = v21;
          sub_22016C35C((uint64_t)aBlock, v21, v22, v23);
          swift_endAccess();

          uint64_t v25 = swift_allocObject();
          *(unsigned char *)(v25 + 16) = 0;
          id v26 = objc_msgSend(v17, sel_currentTraitCollection);
          id v27 = objc_msgSend(v26, sel_layoutDirection);

          BOOL v28 = v27 == 0;
          id v29 = objc_msgSend(v17, sel_currentTraitCollection);
          id v30 = objc_msgSend(v29, sel_accessibilityContrast);

          swift_beginAccess();
          *(unsigned char *)(v25 + 16) = v30 == (id)1;
          id v31 = objc_msgSend(v17, sel_currentTraitCollection);
          id v32 = objc_msgSend(v31, sel_userInterfaceStyle);

          uint64_t v33 = swift_allocObject();
          swift_weakInit();
          uint64_t v34 = swift_allocObject();
          *(void *)(v34 + 16) = v33;
          *(void *)(v34 + 24) = v21;
          *(double *)(v34 + 32) = v22;
          *(double *)(v34 + 40) = v23;
          *(unsigned char *)(v34 + 48) = v28;
          uint64_t v59 = v25;
          *(void *)(v34 + 56) = v25;
          *(unsigned char *)(v34 + 64) = v32 == (id)2;
          v65[2] = sub_220155500;
          v65[3] = v34;
          aBlock[0] = (id)MEMORY[0x263EF8330];
          aBlock[1] = (id)1107296256;
          v65[0] = sub_220154EE8;
          v65[1] = &block_descriptor;
          unint64_t v35 = _Block_copy(aBlock);
          uint64_t v60 = sub_2201823F0();
          char v61 = v48;
          uint64_t v36 = *(void *)(v60 - 8);
          MEMORY[0x270FA5388](v60);
          char v38 = (char *)v48 - ((v37 + 15) & 0xFFFFFFFFFFFFFFF0);
          id v57 = v24;
          swift_retain();
          swift_retain();
          uint64_t v39 = sub_2201823E0();
          uint64_t v58 = v48;
          uint64_t v40 = v56;
          uint64_t v41 = *(void *)(v56 - 8);
          MEMORY[0x270FA5388](v39);
          char v43 = (char *)v48 - v42;
          v65[7] = MEMORY[0x263F8EE78];
          sub_220155530();
          __swift_instantiateConcreteTypeFromMangledName(&qword_267F0A288);
          sub_22015557C();
          sub_2201826E0();
          MEMORY[0x223C66940](0, v38, v43, v35);
          char v44 = v35;
          uint64_t v17 = v54;
          _Block_release(v44);

          (*(void (**)(char *, uint64_t))(v41 + 8))(v43, v40);
          uint64_t v45 = v38;
          uint64_t v46 = v63;
          (*(void (**)(char *, uint64_t))(v36 + 8))(v45, v60);
          swift_release();
          swift_release();
          swift_release();
          unint64_t v20 = v62 + 3;
          uint64_t v19 = v46 - 1;
        }
        while (v19);
      }
      swift_unknownObjectRelease();
      unint64_t v47 = v50;
      uint64_t result = swift_beginAccess();
      if (!v49) {
        return swift_endAccess();
      }
      if ((v49 & 0x8000000000000000) != 0)
      {
        __break(1u);
      }
      else if (*(void *)(*v47 + 16) >= v49)
      {
        sub_22016171C(0, v49);
        return swift_endAccess();
      }
      __break(1u);
LABEL_19:
      __break(1u);
    }
  }
  return result;
}

int64_t sub_22015494C(int64_t result, uint64_t a2)
{
  if (result < 0)
  {
    __break(1u);
  }
  else
  {
    unint64_t v2 = *(void *)(a2 + 16);
    if ((uint64_t)v2 >= result) {
      unint64_t v3 = result;
    }
    else {
      unint64_t v3 = *(void *)(a2 + 16);
    }
    if (!result) {
      unint64_t v3 = 0;
    }
    if (v2 >= v3) {
      return a2;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_220154990(double a1, double a2, uint64_t a3, void *a4, char a5, uint64_t a6, char a7)
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    swift_beginAccess();
    id v14 = sub_2201555D8(a4, a5 & 1, *(unsigned char *)(a6 + 16), a7 & 1, a1, a2);
    sub_220149EE0(0, &qword_267F0A278);
    uint64_t v31 = sub_220182620();
    uint64_t v15 = swift_allocObject();
    swift_weakInit();
    uint64_t v16 = swift_allocObject();
    *(void *)(v16 + 16) = v15;
    *(void *)(v16 + 24) = v14;
    *(void *)(v16 + 32) = a4;
    *(double *)(v16 + 40) = a1;
    *(double *)(v16 + 48) = a2;
    aBlock[4] = sub_220155A1C;
    aBlock[5] = v16;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    id aBlock[2] = sub_220154EE8;
    aBlock[3] = &block_descriptor_14;
    uint64_t v17 = _Block_copy(aBlock);
    id v18 = a4;
    id v29 = v14;
    swift_release();
    uint64_t v19 = sub_2201823F0();
    id v30 = &v28;
    uint64_t v20 = *(void *)(v19 - 8);
    MEMORY[0x270FA5388](v19);
    double v22 = (char *)&v28 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
    sub_2201823E0();
    uint64_t v23 = sub_2201823C0();
    uint64_t v28 = (uint64_t)&v28;
    uint64_t v24 = *(void *)(v23 - 8);
    MEMORY[0x270FA5388](v23);
    id v26 = (char *)&v28 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
    aBlock[0] = MEMORY[0x263F8EE78];
    sub_220155530();
    __swift_instantiateConcreteTypeFromMangledName(&qword_267F0A288);
    sub_22015557C();
    sub_2201826E0();
    id v27 = (void *)v31;
    MEMORY[0x223C66940](0, v22, v26, v17);
    _Block_release(v17);
    swift_release();

    (*(void (**)(char *, uint64_t))(v24 + 8))(v26, v23);
    return (*(uint64_t (**)(char *, uint64_t))(v20 + 8))(v22, v19);
  }
  return result;
}

uint64_t sub_220154CF8(double a1, double a2, uint64_t a3, void *a4, void *a5)
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v10 = result;
    type metadata accessor for NotificationSourceIconCache();
    sub_22015042C();
    sub_220181CB0();
    sub_220181CC0();
    swift_release();
    if (a4)
    {
      id v11 = a4;
      uint64_t v12 = sub_220182240();
      swift_beginAccess();
      id v13 = a5;
      id v14 = v11;
      swift_retain();
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v18 = *(void *)(v10 + 64);
      *(void *)(v10 + 64) = 0x8000000000000000;
      sub_22017C5A0(v12, (uint64_t)v14, a5, isUniquelyReferenced_nonNull_native, a1, a2);
      *(void *)(v10 + 64) = v18;

      swift_bridgeObjectRelease();
      swift_endAccess();
      swift_release();
    }
    else
    {
      swift_beginAccess();
      id v16 = a5;
      sub_22016C35C((uint64_t)v19, a5, a1, a2);
      swift_endAccess();
    }
    swift_beginAccess();
    uint64_t v17 = (void *)sub_22016EC00(a5, a1, a2);
    swift_endAccess();
    sub_220155A2C(v17);
    sub_220154338();
    return swift_release();
  }
  return result;
}

uint64_t sub_220154EEC(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

uint64_t sub_220154F30()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0228](v0, 80, 7);
}

uint64_t type metadata accessor for NotificationSourceIconCache()
{
  return self;
}

void *initializeBufferWithCopyOfBuffer for NotificationSourceIconCache.Icon(void *a1, void *a2)
{
  unint64_t v3 = (void *)a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  id v4 = v3;
  return a1;
}

void destroy for NotificationSourceIconCache.Icon(uint64_t a1)
{
  swift_release();
  uint64_t v2 = *(void **)(a1 + 8);
}

void *assignWithCopy for NotificationSourceIconCache.Icon(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  id v4 = (void *)a2[1];
  int64_t v5 = (void *)a1[1];
  a1[1] = v4;
  id v6 = v4;

  return a1;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t assignWithTake for NotificationSourceIconCache.Icon(uint64_t a1, _OWORD *a2)
{
  swift_release();
  id v4 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *a2;

  return a1;
}

uint64_t getEnumTagSinglePayload for NotificationSourceIconCache.Icon(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 16)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for NotificationSourceIconCache.Icon(uint64_t result, int a2, int a3)
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
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for NotificationSourceIconCache.Icon()
{
  return &type metadata for NotificationSourceIconCache.Icon;
}

uint64_t initializeBufferWithCopyOfBuffer for NotificationSourceIconCache.Key(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  id v4 = v3;
  return a1;
}

void destroy for NotificationSourceIconCache.Key(id *a1)
{
}

uint64_t assignWithCopy for NotificationSourceIconCache.Key(uint64_t a1, uint64_t a2)
{
  id v4 = *(void **)a1;
  int64_t v5 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  id v6 = v5;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  return a1;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for NotificationSourceIconCache.Key(uint64_t a1, uint64_t a2)
{
  id v4 = *(void **)a1;
  *(void *)a1 = *(void *)a2;

  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  return a1;
}

uint64_t getEnumTagSinglePayload for NotificationSourceIconCache.Key(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *((unsigned char *)a1 + 24)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  uint64_t v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for NotificationSourceIconCache.Key(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 24) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 24) = 0;
    }
    if (a2) {
      *(void *)__n128 result = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for NotificationSourceIconCache.Key()
{
  return &type metadata for NotificationSourceIconCache.Key;
}

unint64_t sub_22015530C()
{
  unint64_t result = qword_267F0A270;
  if (!qword_267F0A270)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F0A270);
  }
  return result;
}

uint64_t sub_220155360@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_220181CB0();
  *a1 = result;
  return result;
}

BOOL sub_2201553B0(BOOL result, void *a2, double a3, double a4, double a5, double a6)
{
  if (!result)
  {
    if (a2) {
      return result;
    }
LABEL_6:
    if (a3 == a5) {
      return a4 == a6;
    }
    return result;
  }
  if (!a2) {
    return 0;
  }
  id v11 = (void *)result;
  sub_220149EE0(0, (unint64_t *)&qword_267F0A9A0);
  id v12 = a2;
  id v13 = v11;
  LOBYTE(v11) = sub_220182690();

  uint64_t result = 0;
  if (v11) {
    goto LABEL_6;
  }
  return result;
}

uint64_t sub_220155470()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_220155480()
{
  swift_weakDestroy();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_2201554B8()
{
  swift_release();

  swift_release();

  return MEMORY[0x270FA0238](v0, 65, 7);
}

uint64_t sub_220155500()
{
  return sub_220154990(*(double *)(v0 + 32), *(double *)(v0 + 40), *(void *)(v0 + 16), *(void **)(v0 + 24), *(unsigned char *)(v0 + 48), *(void *)(v0 + 56), *(unsigned char *)(v0 + 64));
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

unint64_t sub_220155530()
{
  unint64_t result = qword_267F0A280;
  if (!qword_267F0A280)
  {
    sub_2201823C0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F0A280);
  }
  return result;
}

unint64_t sub_22015557C()
{
  unint64_t result = qword_267F0A290;
  if (!qword_267F0A290)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267F0A288);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F0A290);
  }
  return result;
}

id sub_2201555D8(void *a1, char a2, char a3, char a4, double a5, double a6)
{
  if (!a1)
  {
    if (qword_267F09C80 != -1) {
      swift_once();
    }
    uint64_t v20 = sub_220181C80();
    __swift_project_value_buffer(v20, (uint64_t)qword_267F0C120);
    uint64_t v21 = sub_220181C60();
    os_log_type_t v22 = sub_2201825F0();
    if (os_log_type_enabled(v21, v22))
    {
      uint64_t v23 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v23 = 0;
      _os_log_impl(&dword_22012C000, v21, v22, "should never call loadImage(for:completion) where request.source is nil. use placeholder(...) instead", v23, 2u);
      MEMORY[0x223C676F0](v23, -1, -1);
    }
    goto LABEL_21;
  }
  id v11 = a1;
  id v12 = sub_22015260C();
  if (!v12)
  {
    if (qword_267F09C80 != -1) {
      swift_once();
    }
    uint64_t v24 = sub_220181C80();
    __swift_project_value_buffer(v24, (uint64_t)qword_267F0C120);
    uint64_t v21 = v11;
    uint64_t v25 = sub_220181C60();
    os_log_type_t v26 = sub_2201825F0();
    if (os_log_type_enabled(v25, v26))
    {
      id v27 = (uint8_t *)swift_slowAlloc();
      uint64_t v28 = swift_slowAlloc();
      uint64_t v36 = v28;
      *(_DWORD *)id v27 = 136446210;
      id v29 = [v21 sourceIdentifier];
      uint64_t v30 = sub_220182460();
      unint64_t v32 = v31;

      sub_220149888(v30, v32, &v36);
      sub_2201826B0();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_22012C000, v25, v26, "could not load icon for %{public}s", v27, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x223C676F0](v28, -1, -1);
      MEMORY[0x223C676F0](v27, -1, -1);

      return 0;
    }

LABEL_21:
    return 0;
  }
  id v13 = v12;
  id v14 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F4B558]), sel_initWithSize_scale_, a5, a5, a6);
  objc_msgSend(v14, sel_setDrawBorder_, 1);
  if (a2) {
    uint64_t v15 = 1;
  }
  else {
    uint64_t v15 = 2;
  }
  objc_msgSend(v14, sel_setLanguageDirection_, v15);
  objc_msgSend(v14, sel_setContrast_, a3 & 1);
  objc_msgSend(v14, sel_setAppearance_, a4 & 1);
  id v16 = objc_msgSend(v13, sel_imageForDescriptor_, v14);
  if (v16)
  {
    id v17 = v16;
    id v18 = v17;
    if (!objc_msgSend(v17, sel_placeholder)
      || (id v19 = v14,
          id v18 = objc_msgSend(v13, sel_prepareImageForDescriptor_, v19),
          v19,
          v17,
          v18))
    {

      id v17 = v18;
    }
  }
  else
  {
    id v17 = 0;
  }
  id v33 = v17;
  id v34 = objc_msgSend(v33, sel_CGImage);

  return v34;
}

uint64_t sub_2201559D4()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_220155A1C()
{
  return sub_220154CF8(*(double *)(v0 + 40), *(double *)(v0 + 48), *(void *)(v0 + 16), *(void **)(v0 + 24), *(void **)(v0 + 32));
}

void sub_220155A2C(id a1)
{
  if (a1 != (id)1) {
}
  }

uint64_t sub_220155A4C()
{
  if (qword_267F09C70 != -1) {
    swift_once();
  }
  id v0 = (id)qword_267F0C100;
  uint64_t v1 = (void *)sub_220182450();
  uint64_t v2 = (void *)sub_220182450();
  id v3 = objc_msgSend(v0, sel_localizedStringForKey_value_table_, v1, 0, v2);

  uint64_t v4 = sub_220182460();
  return v4;
}

uint64_t sub_220155B44@<X0>(uint64_t a1@<X8>)
{
  uint64_t v21 = a1;
  uint64_t v2 = type metadata accessor for NotificationSummarizationOnboardingCustomizationByCategoriesView(0);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  MEMORY[0x270FA5388](v2 - 8);
  int64_t v5 = (char *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F0A2B0);
  MEMORY[0x270FA5388](v6 - 8);
  BOOL v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F0A2B8);
  uint64_t v10 = v9 - 8;
  MEMORY[0x270FA5388](v9);
  id v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = v1;
  sub_220155DE4(v1, (uint64_t)v8);
  sub_22015792C(v1, (uint64_t)v5, type metadata accessor for NotificationSummarizationOnboardingCustomizationByCategoriesView);
  unint64_t v13 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v14 = swift_allocObject();
  sub_22015C70C((uint64_t)v5, v14 + v13, type metadata accessor for NotificationSummarizationOnboardingCustomizationByCategoriesView);
  sub_22014FA88((uint64_t)v8, (uint64_t)v12, &qword_267F0A2B0);
  uint64_t v15 = (uint64_t (**)())&v12[*(int *)(v10 + 44)];
  void *v15 = sub_220157640;
  v15[1] = (uint64_t (*)())v14;
  v15[2] = 0;
  v15[3] = 0;
  sub_22014ACAC((uint64_t)v8, &qword_267F0A2B0);
  sub_22015792C(v20, (uint64_t)v5, type metadata accessor for NotificationSummarizationOnboardingCustomizationByCategoriesView);
  uint64_t v16 = swift_allocObject();
  sub_22015C70C((uint64_t)v5, v16 + v13, type metadata accessor for NotificationSummarizationOnboardingCustomizationByCategoriesView);
  uint64_t v17 = v21;
  sub_22014FA88((uint64_t)v12, v21, &qword_267F0A2B8);
  id v18 = (void *)(v17 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267F0A2C0) + 36));
  *id v18 = 0;
  v18[1] = 0;
  v18[2] = sub_2201577A8;
  v18[3] = v16;
  return sub_22014ACAC((uint64_t)v12, &qword_267F0A2B8);
}

uint64_t sub_220155DE4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v69 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F0A2C8);
  MEMORY[0x270FA5388](v3 - 8);
  int64_t v5 = (char *)&v58 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v62 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F0A2D0);
  MEMORY[0x270FA5388](v62);
  uint64_t v63 = (uint64_t)&v58 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v67 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F0A2D8);
  uint64_t v7 = MEMORY[0x270FA5388](v67);
  uint64_t v64 = (uint64_t)&v58 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v65 = (uint64_t)&v58 - v9;
  uint64_t v68 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F0A2E0);
  MEMORY[0x270FA5388](v68);
  BOOL v66 = (char *)&v58 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_220182020();
  uint64_t v60 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  unint64_t v13 = (char *)&v58 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F0A0C8);
  uint64_t v59 = *(void *)(v14 - 8);
  MEMORY[0x270FA5388](v14);
  uint64_t v16 = (char *)&v58 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F0A128);
  uint64_t v61 = *(void *)(v17 - 8);
  uint64_t v18 = MEMORY[0x270FA5388](v17);
  uint64_t v20 = (char *)&v58 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v18);
  os_log_type_t v22 = (char *)&v58 - v21;
  uint64_t v23 = a1;
  long long v70 = *(_OWORD *)(a1
                  + *(int *)(type metadata accessor for NotificationSummarizationOnboardingCustomizationByCategoriesView(0)
                           + 28));
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F0A060);
  sub_2201822A0();
  uint64_t v24 = v73;
  if (v73)
  {
    uint64_t v61 = v17;
    uint64_t v25 = v11;
    uint64_t v27 = (uint64_t)v66;
    uint64_t v26 = v67;
    *(void *)int64_t v5 = sub_220181F60();
    *((void *)v5 + 1) = 0x4018000000000000;
    v5[16] = 0;
    uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F0A300);
    sub_220156584(v24, v23, (uint64_t)&v5[*(int *)(v28 + 44)]);
    char v29 = sub_220182080();
    sub_220181CE0();
    uint64_t v31 = v30;
    uint64_t v33 = v32;
    uint64_t v35 = v34;
    uint64_t v37 = v36;
    uint64_t v38 = v63;
    sub_22014FA88((uint64_t)v5, v63, &qword_267F0A2C8);
    uint64_t v39 = v38 + *(int *)(v62 + 36);
    *(unsigned char *)uint64_t v39 = v29;
    *(void *)(v39 + 8) = v31;
    *(void *)(v39 + 16) = v33;
    *(void *)(v39 + 24) = v35;
    *(void *)(v39 + 32) = v37;
    *(unsigned char *)(v39 + 40) = 0;
    sub_22014ACAC((uint64_t)v5, &qword_267F0A2C8);
    char v40 = sub_220182060();
    if (qword_267F09CF0 != -1) {
      swift_once();
    }
    sub_220181CE0();
    uint64_t v42 = v41;
    uint64_t v44 = v43;
    uint64_t v46 = v45;
    uint64_t v48 = v47;
    uint64_t v49 = v64;
    sub_22014FA88(v38, v64, &qword_267F0A2D0);
    uint64_t v50 = v49 + *(int *)(v26 + 36);
    *(unsigned char *)uint64_t v50 = v40;
    *(void *)(v50 + 8) = v42;
    *(void *)(v50 + 16) = v44;
    *(void *)(v50 + 24) = v46;
    *(void *)(v50 + 32) = v48;
    *(unsigned char *)(v50 + 40) = 0;
    sub_22014ACAC(v38, &qword_267F0A2D0);
    uint64_t v51 = v65;
    sub_22014B470(v49, v65, &qword_267F0A2D8);
    sub_22014FA88(v51, v27, &qword_267F0A2D8);
    swift_storeEnumTagMultiPayload();
    sub_22015C344(&qword_267F0A2E8, &qword_267F0A2D8, (void (*)(void))sub_22015786C);
    uint64_t v52 = sub_22014B510(&qword_267F0A0D0, &qword_267F0A0C8);
    uint64_t v53 = sub_220157824(&qword_267F0A0D8, MEMORY[0x263F1A1D8]);
    *(void *)&long long v70 = v14;
    *((void *)&v70 + 1) = v25;
    uint64_t v71 = v52;
    uint64_t v72 = v53;
    swift_getOpaqueTypeConformance2();
    sub_220181FF0();

    return sub_22014ACAC(v51, &qword_267F0A2D8);
  }
  else
  {
    sub_220181D50();
    sub_220182010();
    uint64_t v55 = sub_22014B510(&qword_267F0A0D0, &qword_267F0A0C8);
    uint64_t v56 = sub_220157824(&qword_267F0A0D8, MEMORY[0x263F1A1D8]);
    sub_220182150();
    (*(void (**)(char *, uint64_t))(v60 + 8))(v13, v11);
    (*(void (**)(char *, uint64_t))(v59 + 8))(v16, v14);
    uint64_t v57 = v61;
    (*(void (**)(char *, char *, uint64_t))(v61 + 32))(v22, v20, v17);
    (*(void (**)(char *, char *, uint64_t))(v57 + 16))(v66, v22, v17);
    swift_storeEnumTagMultiPayload();
    sub_22015C344(&qword_267F0A2E8, &qword_267F0A2D8, (void (*)(void))sub_22015786C);
    *(void *)&long long v70 = v14;
    *((void *)&v70 + 1) = v11;
    uint64_t v71 = v55;
    uint64_t v72 = v56;
    swift_getOpaqueTypeConformance2();
    sub_220181FF0();
    return (*(uint64_t (**)(char *, uint64_t))(v57 + 8))(v22, v17);
  }
}

uint64_t sub_220156584@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v97 = a2;
  uint64_t v103 = a3;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F0A308);
  uint64_t v105 = *(void *)(v4 - 8);
  uint64_t v106 = v4;
  uint64_t v5 = MEMORY[0x270FA5388](v4);
  uint64_t v104 = (char *)&v93 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v110 = (char *)&v93 - v7;
  uint64_t v96 = sub_220181D10();
  uint64_t v8 = *(void *)(v96 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v96);
  BOOL v95 = (char *)&v93 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v93 - v11;
  uint64_t v13 = sub_220181D90();
  uint64_t v14 = v13 - 8;
  MEMORY[0x270FA5388](v13);
  uint64_t v16 = (_OWORD *)((char *)&v93 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v94 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F0A310);
  MEMORY[0x270FA5388](v94);
  uint64_t v18 = (char *)&v93 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v98 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F0A318);
  MEMORY[0x270FA5388](v98);
  uint64_t v20 = (char *)&v93 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F0A320);
  MEMORY[0x270FA5388](v21 - 8);
  uint64_t v101 = (uint64_t)&v93 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v100 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F0A328);
  uint64_t v23 = MEMORY[0x270FA5388](v100);
  uint64_t v114 = (uint64_t)&v93 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = MEMORY[0x270FA5388](v23);
  uint64_t v99 = (uint64_t)&v93 - v26;
  MEMORY[0x270FA5388](v25);
  uint64_t v111 = (uint64_t)&v93 - v27;
  uint64_t v102 = type metadata accessor for SourceGroupView(0);
  uint64_t v28 = MEMORY[0x270FA5388](v102);
  uint64_t v115 = (uint64_t)&v93 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v30 = MEMORY[0x270FA5388](v28);
  uint64_t v113 = (uint64_t)&v93 - v31;
  uint64_t v32 = MEMORY[0x270FA5388](v30);
  uint64_t v112 = (uint64_t *)((char *)&v93 - v33);
  uint64_t v34 = MEMORY[0x270FA5388](v32);
  uint64_t v36 = (uint64_t *)((char *)&v93 - v35);
  uint64_t v37 = MEMORY[0x270FA5388](v34);
  uint64_t v39 = (uint64_t *)((char *)&v93 - v38);
  MEMORY[0x270FA5388](v37);
  uint64_t v41 = (uint64_t *)((char *)&v93 - v40);
  id v42 = a1;
  uint64_t v107 = v41;
  sub_220157088(1u, v42, v41);
  id v43 = v42;
  uint64_t v108 = v39;
  sub_220157088(0, v43, v39);
  id v44 = v43;
  uint64_t v109 = v36;
  uint64_t v45 = v36;
  id v46 = v44;
  sub_220157088(2u, v44, v45);
  uint64_t v47 = (char *)v16 + *(int *)(v14 + 28);
  uint64_t v48 = *MEMORY[0x263F19860];
  uint64_t v49 = sub_220181F50();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v49 - 8) + 104))(v47, v48, v49);
  __asm { FMOV            V0.2D, #1.0 }
  *uint64_t v16 = _Q0;
  char v55 = sub_220182060();
  if (qword_267F09CB0 != -1) {
    swift_once();
  }
  sub_220181CE0();
  uint64_t v57 = v56;
  uint64_t v59 = v58;
  uint64_t v61 = v60;
  uint64_t v63 = v62;
  sub_22015792C((uint64_t)v16, (uint64_t)v18, MEMORY[0x263F19048]);
  uint64_t v64 = &v18[*(int *)(v94 + 36)];
  char *v64 = v55;
  *((void *)v64 + 1) = v57;
  *((void *)v64 + 2) = v59;
  *((void *)v64 + 3) = v61;
  *((void *)v64 + 4) = v63;
  v64[40] = 0;
  sub_22015B9E0((uint64_t)v16, MEMORY[0x263F19048]);
  type metadata accessor for NotificationSummarizationOnboardingCustomizationByCategoriesView(0);
  sub_22014F114((uint64_t)v12);
  uint64_t v65 = v95;
  uint64_t v66 = v96;
  (*(void (**)(char *, void, uint64_t))(v8 + 104))(v95, *MEMORY[0x263F184F8], v96);
  sub_220181D00();
  uint64_t v67 = *(void (**)(char *, uint64_t))(v8 + 8);
  v67(v65, v66);
  v67(v12, v66);
  if (qword_267F09CF8 != -1) {
    swift_once();
  }
  id v68 = objc_msgSend(self, sel_currentDevice);
  objc_msgSend(v68, sel_userInterfaceIdiom);

  uint64_t v69 = sub_2201821F0();
  uint64_t KeyPath = swift_getKeyPath();
  sub_22014FA88((uint64_t)v18, (uint64_t)v20, &qword_267F0A310);
  uint64_t v71 = (uint64_t *)&v20[*(int *)(v98 + 36)];
  *uint64_t v71 = KeyPath;
  v71[1] = v69;
  sub_22014ACAC((uint64_t)v18, &qword_267F0A310);
  uint64_t v72 = sub_220182350();
  uint64_t v73 = v101;
  sub_220157190(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, v101, 0.0, 1, 0.0, 1, v72, v74, &qword_267F0A318, &qword_267F0A320);
  sub_22014ACAC((uint64_t)v20, &qword_267F0A318);
  sub_220182350();
  sub_220181D70();
  uint64_t v75 = v99;
  sub_22014FA88(v73, v99, &qword_267F0A320);
  BOOL v76 = (_OWORD *)(v75 + *(int *)(v100 + 36));
  long long v77 = v117;
  *BOOL v76 = v116;
  v76[1] = v77;
  v76[2] = v118;
  sub_22014ACAC(v73, &qword_267F0A320);
  uint64_t v78 = v111;
  sub_22014B470(v75, v111, &qword_267F0A328);
  id v79 = v46;
  BOOL v80 = v112;
  sub_220157088(3u, v79, v112);
  type metadata accessor for NotificationSummarizationOnboardingViewModel();
  sub_220157824(&qword_267F0A330, (void (*)(uint64_t))type metadata accessor for SourceGroupView);
  sub_220157824((unint64_t *)&qword_267F0A920, (void (*)(uint64_t))type metadata accessor for NotificationSummarizationOnboardingViewModel);
  BOOL v81 = v104;
  sub_220182170();
  sub_22015B9E0((uint64_t)v80, type metadata accessor for SourceGroupView);
  uint64_t v83 = v105;
  uint64_t v82 = v106;
  uint64_t v84 = v110;
  (*(void (**)(char *, char *, uint64_t))(v105 + 32))(v110, v81, v106);
  sub_22015792C((uint64_t)v107, (uint64_t)v80, type metadata accessor for SourceGroupView);
  uint64_t v85 = v113;
  sub_22015792C((uint64_t)v108, v113, type metadata accessor for SourceGroupView);
  sub_22015792C((uint64_t)v109, v115, type metadata accessor for SourceGroupView);
  sub_22014FA88(v78, v114, &qword_267F0A328);
  char v86 = *(void (**)(char *, char *, uint64_t))(v83 + 16);
  v86(v81, v84, v82);
  uint64_t v87 = (uint64_t)v80;
  uint64_t v88 = v103;
  sub_22015792C(v87, v103, type metadata accessor for SourceGroupView);
  char v89 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_267F0A338);
  sub_22015792C(v85, v88 + v89[12], type metadata accessor for SourceGroupView);
  sub_22015792C(v115, v88 + v89[16], type metadata accessor for SourceGroupView);
  uint64_t v90 = v114;
  sub_22014FA88(v114, v88 + v89[20], &qword_267F0A328);
  v86((char *)(v88 + v89[24]), v81, v82);
  BOOL v91 = *(void (**)(char *, uint64_t))(v83 + 8);
  v91(v110, v82);
  sub_22014ACAC(v111, &qword_267F0A328);
  sub_22015B9E0((uint64_t)v109, type metadata accessor for SourceGroupView);
  sub_22015B9E0((uint64_t)v108, type metadata accessor for SourceGroupView);
  sub_22015B9E0((uint64_t)v107, type metadata accessor for SourceGroupView);
  v91(v81, v82);
  sub_22014ACAC(v90, &qword_267F0A328);
  sub_22015B9E0(v115, type metadata accessor for SourceGroupView);
  sub_22015B9E0(v113, type metadata accessor for SourceGroupView);
  return sub_22015B9E0((uint64_t)v112, type metadata accessor for SourceGroupView);
}

void sub_220157088(unsigned __int8 a1@<W0>, void *a2@<X1>, uint64_t *a3@<X8>)
{
  *a3 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F0AAA0);
  swift_storeEnumTagMultiPayload();
  uint64_t v6 = (int *)type metadata accessor for SourceGroupView(0);
  *((unsigned char *)a3 + v6[5]) = a1;
  uint64_t v7 = (uint64_t *)((char *)a3 + v6[6]);
  type metadata accessor for NotificationSummarizationOnboardingViewModel();
  uint64_t v8 = a2;
  sub_220182290();
  *uint64_t v7 = v13;
  v7[1] = v14;
  uint64_t v9 = *(void *)&v8[OBJC_IVAR____TtC20UserNotificationsKit44NotificationSummarizationOnboardingViewModel_categorizedSources];
  if (*(void *)(v9 + 16) && (unint64_t v10 = sub_22017A15C(a1), (v11 & 1) != 0))
  {
    uint64_t v12 = *(void *)(*(void *)(v9 + 56) + 8 * v10);
    swift_bridgeObjectRetain();
  }
  else
  {
    uint64_t v12 = MEMORY[0x263F8EE78];
  }

  *(uint64_t *)((char *)a3 + v6[7]) = v12;
}

__n128 sub_220157190@<Q0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15, uint64_t *a16, uint64_t *a17)
{
  uint64_t v19 = a17;
  if (a2) {
    a1 = -INFINITY;
  }
  if (a4) {
    a3 = a1;
  }
  if (a6) {
    a5 = a3;
  }
  if (a1 > a3 || a3 > a5) {
    goto LABEL_22;
  }
  if (a8) {
    a7 = -INFINITY;
  }
  if (a11) {
    a10 = a7;
  }
  if (a13) {
    a12 = a10;
  }
  if (a7 > a10 || a10 > a12)
  {
LABEL_22:
    sub_220182600();
    uint64_t v28 = (void *)sub_220182050();
    sub_220181C50();

    uint64_t v19 = a17;
  }
  sub_220181DA0();
  sub_22014FA88(v17, a9, a16);
  uint64_t v29 = (_OWORD *)(a9 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(v19) + 36));
  v29[4] = v35;
  v29[5] = v36;
  v29[6] = v37;
  *uint64_t v29 = v31;
  v29[1] = v32;
  __n128 result = v34;
  v29[2] = v33;
  v29[3] = v34;
  return result;
}

uint64_t sub_220157360()
{
  return sub_220155A4C();
}

uint64_t sub_220157378(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_22015738C);
}

uint64_t sub_22015738C(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 2147483646)
  {
    uint64_t v4 = *a1;
    if ((unint64_t)*a1 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    int v5 = v4 - 1;
    if (v5 < 0) {
      int v5 = -1;
    }
    return (v5 + 1);
  }
  else
  {
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F0A068);
    unint64_t v10 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v9 - 8) + 48);
    uint64_t v11 = v9;
    uint64_t v12 = (char *)a1 + *(int *)(a3 + 24);
    return v10(v12, a2, v11);
  }
}

uint64_t sub_22015744C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_220157460);
}

void *sub_220157460(void *result, uint64_t a2, int a3, uint64_t a4)
{
  int v5 = result;
  if (a3 == 2147483646)
  {
    *__n128 result = a2;
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F0A068);
    uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    unint64_t v10 = (char *)v5 + *(int *)(a4 + 24);
    return (void *)v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t type metadata accessor for NotificationSummarizationOnboardingCustomizationByCategoriesView(uint64_t a1)
{
  return sub_22015D2B0(a1, (uint64_t *)&unk_267F0A298);
}

void sub_22015752C()
{
  sub_22014E954();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

uint64_t sub_2201575C4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2201575E4(uint64_t a1)
{
  uint64_t result = sub_220157824(&qword_267F0A2A8, (void (*)(uint64_t))type metadata accessor for NotificationSummarizationOnboardingCustomizationByCategoriesView);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_220157640()
{
  return sub_2201577B0(1);
}

uint64_t objectdestroyTm_0()
{
  uint64_t v1 = type metadata accessor for NotificationSummarizationOnboardingCustomizationByCategoriesView(0);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*(void *)(v1 - 8) + 64);
  uint64_t v5 = v0 + v3;
  if (*(void *)(v0 + v3)) {
    swift_release();
  }
  if (*(void *)(v5 + 16)) {
    swift_release();
  }
  uint64_t v6 = v5 + *(int *)(v1 + 24);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F0AAA0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_220181D10();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  }
  else
  {
    swift_release();
  }

  swift_release();

  return MEMORY[0x270FA0238](v0, v3 + v4, v2 | 7);
}

uint64_t sub_2201577A8()
{
  return sub_2201577B0(0);
}

uint64_t sub_2201577B0(char a1)
{
  uint64_t v3 = type metadata accessor for NotificationSummarizationOnboardingCustomizationByCategoriesView(0);
  uint64_t v5 = *(void *)(v3 - 8);
  uint64_t result = v3 - 8;
  uint64_t v6 = (uint64_t (**)(void))(v1
                                       + ((*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80)));
  if (*v6) {
    return (*v6)(a1 & 1);
  }
  return result;
}

uint64_t sub_220157824(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_22015786C()
{
  unint64_t result = qword_267F0A2F0;
  if (!qword_267F0A2F0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267F0A2D0);
    sub_22014B510(&qword_267F0A2F8, &qword_267F0A2C8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F0A2F0);
  }
  return result;
}

uint64_t type metadata accessor for SourceGroupView(uint64_t a1)
{
  return sub_22015D2B0(a1, (uint64_t *)&unk_267F0A340);
}

uint64_t sub_22015792C(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_220157994(char a1)
{
  switch(a1)
  {
    case 1:
      if (qword_267F09C70 != -1) {
        goto LABEL_10;
      }
      break;
    case 2:
      if (qword_267F09C70 != -1) {
        goto LABEL_10;
      }
      break;
    case 3:
      if (qword_267F09C70 != -1) {
        goto LABEL_10;
      }
      break;
    default:
      if (qword_267F09C70 != -1) {
LABEL_10:
      }
        swift_once();
      break;
  }
  id v1 = (id)qword_267F0C100;
  uint64_t v2 = (void *)sub_220182450();
  uint64_t v3 = (void *)sub_220182450();
  id v4 = objc_msgSend(v1, sel_localizedStringForKey_value_table_, v2, 0, v3);

  uint64_t v5 = sub_220182460();
  return v5;
}

uint64_t sub_220157BC0()
{
  unint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for SourceGroupView(0) + 28));
  if (!(v1 >> 62))
  {
    uint64_t v2 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v2) {
      goto LABEL_3;
    }
LABEL_13:
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267F0A950);
    sub_22014B510((unint64_t *)&qword_267F0A478, (uint64_t *)&unk_267F0A950);
    uint64_t v14 = sub_220182440();
    swift_bridgeObjectRelease();
    return v14;
  }
  swift_bridgeObjectRetain();
  uint64_t v2 = sub_220182870();
  if (!v2) {
    goto LABEL_13;
  }
LABEL_3:
  uint64_t v15 = MEMORY[0x263F8EE78];
  uint64_t result = sub_22015FB60(0, v2 & ~(v2 >> 63), 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    uint64_t v4 = 0;
    do
    {
      if ((v1 & 0xC000000000000001) != 0) {
        id v5 = (id)MEMORY[0x223C66AB0](v4, v1);
      }
      else {
        id v5 = *(id *)(v1 + 8 * v4 + 32);
      }
      uint64_t v6 = v5;
      id v7 = objc_msgSend(v5, sel_displayName);
      uint64_t v8 = sub_220182460();
      uint64_t v10 = v9;

      unint64_t v12 = *(void *)(v15 + 16);
      unint64_t v11 = *(void *)(v15 + 24);
      if (v12 >= v11 >> 1) {
        sub_22015FB60(v11 > 1, v12 + 1, 1);
      }
      ++v4;
      *(void *)(v15 + 16) = v12 + 1;
      uint64_t v13 = v15 + 16 * v12;
      *(void *)(v13 + 32) = v8;
      *(void *)(v13 + 40) = v10;
    }
    while (v2 != v4);
    goto LABEL_13;
  }
  __break(1u);
  return result;
}

void sub_220157DB0(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for SourceGroupView(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F0A458);
  sub_2201822A0();
  sub_220165094(*(unsigned __int8 *)(a1 + *(int *)(v2 + 20)));
}

uint64_t sub_220157E28@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v52 = a2;
  uint64_t v3 = sub_220181D10();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  id v7 = (char *)&v48 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v48 - v8;
  uint64_t v48 = sub_220181D90();
  MEMORY[0x270FA5388](v48);
  unint64_t v11 = (uint64_t *)((char *)&v48 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F0A3B8);
  MEMORY[0x270FA5388](v12 - 8);
  uint64_t v14 = (char *)&v48 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F0A3A0);
  MEMORY[0x270FA5388](v15 - 8);
  uint64_t v17 = (uint64_t *)((char *)&v48 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F0A390);
  MEMORY[0x270FA5388](v18 - 8);
  uint64_t v20 = (char *)&v48 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v49 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F0A378);
  MEMORY[0x270FA5388](v49);
  uint64_t v50 = (char *)&v48 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t *v17 = sub_220182350();
  v17[1] = v22;
  uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F0A3C0);
  sub_220158454(a1, (uint64_t)v17 + *(int *)(v23 + 44));
  uint64_t v24 = sub_220182350();
  uint64_t v51 = v20;
  sub_220157190(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)v20, 0.0, 1, 0.0, 1, v24, v25, &qword_267F0A3A0, &qword_267F0A390);
  sub_22014ACAC((uint64_t)v17, &qword_267F0A3A0);
  if (qword_267F09CB0 != -1) {
    swift_once();
  }
  uint64_t v26 = qword_267F0C168;
  uint64_t v27 = (char *)v11 + *(int *)(v48 + 20);
  uint64_t v28 = *MEMORY[0x263F19860];
  uint64_t v29 = sub_220181F50();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v29 - 8) + 104))(v27, v28, v29);
  uint64_t *v11 = v26;
  v11[1] = v26;
  sub_22014F114((uint64_t)v9);
  (*(void (**)(char *, void, uint64_t))(v4 + 104))(v7, *MEMORY[0x263F184F8], v3);
  sub_220181D00();
  uint64_t v30 = *(void (**)(char *, uint64_t))(v4 + 8);
  v30(v7, v3);
  v30(v9, v3);
  if (qword_267F09CE0 != -1) {
    swift_once();
  }
  id v31 = objc_msgSend(self, sel_currentDevice);
  objc_msgSend(v31, sel_userInterfaceIdiom);

  uint64_t v32 = sub_2201821F0();
  if (qword_267F09CE8 != -1) {
    swift_once();
  }
  sub_220181D40();
  sub_22015792C((uint64_t)v11, (uint64_t)v14, MEMORY[0x263F19048]);
  long long v33 = &v14[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267F0A3C8) + 36)];
  long long v34 = v54;
  *(_OWORD *)long long v33 = v53;
  *((_OWORD *)v33 + 1) = v34;
  *((void *)v33 + 4) = v55;
  uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F0A3D0);
  *(void *)&v14[*(int *)(v35 + 52)] = v32;
  *(_WORD *)&v14[*(int *)(v35 + 56)] = 256;
  uint64_t v36 = sub_220182350();
  uint64_t v38 = v37;
  uint64_t v39 = (uint64_t *)&v14[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267F0A3D8) + 36)];
  *uint64_t v39 = v36;
  v39[1] = v38;
  sub_22015B9E0((uint64_t)v11, MEMORY[0x263F19048]);
  uint64_t v40 = sub_220182350();
  uint64_t v42 = v41;
  uint64_t v43 = (uint64_t)v50;
  uint64_t v44 = (uint64_t)&v50[*(int *)(v49 + 36)];
  sub_22014FA88((uint64_t)v14, v44, &qword_267F0A3B8);
  uint64_t v45 = (uint64_t *)(v44 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267F0A3B0) + 36));
  *uint64_t v45 = v40;
  v45[1] = v42;
  uint64_t v46 = (uint64_t)v51;
  sub_22014FA88((uint64_t)v51, v43, &qword_267F0A390);
  sub_22014ACAC((uint64_t)v14, &qword_267F0A3B8);
  sub_22014ACAC(v46, &qword_267F0A390);
  return sub_22014B470(v43, v52, &qword_267F0A378);
}

uint64_t sub_220158454@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F0A3E0);
  uint64_t v5 = MEMORY[0x270FA5388](v4 - 8);
  id v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v20 - v8;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F0A3E8);
  uint64_t v11 = MEMORY[0x270FA5388](v10 - 8);
  uint64_t v13 = (char *)&v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)&v20 - v14;
  *(void *)uint64_t v15 = sub_220181F20();
  *((void *)v15 + 1) = 0;
  v15[16] = 1;
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F0A3F0);
  sub_220158640(a1, (uint64_t)&v15[*(int *)(v16 + 44)]);
  *(void *)uint64_t v9 = sub_220181F80();
  *((void *)v9 + 1) = 0;
  v9[16] = 0;
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F0A3F8);
  sub_220158FEC(a1, (uint64_t)&v9[*(int *)(v17 + 44)]);
  sub_22014FA88((uint64_t)v15, (uint64_t)v13, &qword_267F0A3E8);
  sub_22014FA88((uint64_t)v9, (uint64_t)v7, &qword_267F0A3E0);
  sub_22014FA88((uint64_t)v13, a2, &qword_267F0A3E8);
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F0A400);
  sub_22014FA88((uint64_t)v7, a2 + *(int *)(v18 + 48), &qword_267F0A3E0);
  sub_22014ACAC((uint64_t)v9, &qword_267F0A3E0);
  sub_22014ACAC((uint64_t)v15, &qword_267F0A3E8);
  sub_22014ACAC((uint64_t)v7, &qword_267F0A3E0);
  return sub_22014ACAC((uint64_t)v13, &qword_267F0A3E8);
}

uint64_t sub_220158640@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v39 = a1;
  uint64_t v45 = a2;
  uint64_t v3 = type metadata accessor for SourceGroupIconView(0);
  uint64_t v4 = v3 - 8;
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (uint64_t *)((char *)&v38 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v44 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F0A468) - 8;
  uint64_t v7 = MEMORY[0x270FA5388](v44);
  uint64_t v42 = (uint64_t)&v38 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v43 = (uint64_t)&v38 - v9;
  uint64_t v10 = type metadata accessor for SourceGroupView(0);
  uint64_t v11 = *(void *)(a1 + *(int *)(v10 + 28));
  uint64_t v40 = type metadata accessor for NotificationSourceIconCache();
  uint64_t v41 = sub_220157824((unint64_t *)&qword_267F0A1E0, (void (*)(uint64_t))type metadata accessor for NotificationSourceIconCache);
  swift_bridgeObjectRetain();
  uint64_t v12 = sub_220181DE0();
  uint64_t v14 = v13;
  *(uint64_t *)((char *)v6 + *(int *)(v4 + 28)) = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F0AAA0);
  swift_storeEnumTagMultiPayload();
  *uint64_t v6 = v12;
  v6[1] = v14;
  *(uint64_t *)((char *)v6 + *(int *)(v4 + 32)) = v11;
  uint64_t v15 = v39;
  uint64_t v16 = (char **)(v39 + *(int *)(v10 + 24));
  uint64_t v18 = *v16;
  uint64_t v17 = v16[1];
  uint64_t v52 = v18;
  long long v53 = v17;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F0A458);
  sub_2201822A0();
  uint64_t v19 = (char *)v50;
  swift_getKeyPath();
  uint64_t v52 = v19;
  sub_220157824((unint64_t *)&qword_267F0A920, (void (*)(uint64_t))type metadata accessor for NotificationSummarizationOnboardingViewModel);
  sub_220181BF0();
  swift_release();
  uint64_t v20 = *(void *)&v19[OBJC_IVAR____TtC20UserNotificationsKit44NotificationSummarizationOnboardingViewModel__iconCache];
  swift_retain();

  uint64_t v21 = sub_220181CA0();
  uint64_t v22 = v42;
  sub_22015792C((uint64_t)v6, v42, type metadata accessor for SourceGroupIconView);
  uint64_t v23 = (uint64_t *)(v22 + *(int *)(v44 + 44));
  *uint64_t v23 = v21;
  v23[1] = v20;
  sub_22015B9E0((uint64_t)v6, type metadata accessor for SourceGroupIconView);
  uint64_t v24 = v43;
  sub_22014B470(v22, v43, &qword_267F0A468);
  uint64_t v25 = sub_220181F70();
  sub_220158B20(v15, (uint64_t)v46);
  *(_OWORD *)&v48[151] = v46[9];
  *(_OWORD *)&v48[167] = v46[10];
  *(_OWORD *)&v48[183] = v46[11];
  *(_OWORD *)&v48[87] = v46[5];
  *(_OWORD *)&v48[103] = v46[6];
  *(_OWORD *)&v48[119] = v46[7];
  *(_OWORD *)&v48[135] = v46[8];
  *(_OWORD *)&v48[23] = v46[1];
  *(_OWORD *)&v48[39] = v46[2];
  *(_OWORD *)&v48[55] = v46[3];
  *(_OWORD *)&v48[71] = v46[4];
  char v49 = 1;
  v48[199] = v47;
  *(_OWORD *)&v48[7] = v46[0];
  sub_22014FA88(v24, v22, &qword_267F0A468);
  uint64_t v26 = v45;
  sub_22014FA88(v22, v45, &qword_267F0A468);
  uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F0A470);
  uint64_t v28 = *(int *)(v27 + 48);
  *(_OWORD *)((char *)&v51[9] + 1) = *(_OWORD *)&v48[144];
  *(_OWORD *)((char *)&v51[10] + 1) = *(_OWORD *)&v48[160];
  *(_OWORD *)((char *)&v51[11] + 1) = *(_OWORD *)&v48[176];
  *(_OWORD *)((char *)&v51[5] + 1) = *(_OWORD *)&v48[80];
  *(_OWORD *)((char *)&v51[6] + 1) = *(_OWORD *)&v48[96];
  *(_OWORD *)((char *)&v51[7] + 1) = *(_OWORD *)&v48[112];
  *(_OWORD *)((char *)&v51[8] + 1) = *(_OWORD *)&v48[128];
  *(_OWORD *)((char *)&v51[1] + 1) = *(_OWORD *)&v48[16];
  *(_OWORD *)((char *)&v51[2] + 1) = *(_OWORD *)&v48[32];
  *(_OWORD *)((char *)&v51[3] + 1) = *(_OWORD *)&v48[48];
  uint64_t v29 = (_OWORD *)(v26 + v28);
  long long v50 = (unint64_t)v25;
  LOBYTE(v51[0]) = 1;
  *(void *)((char *)&v51[12] + 1) = *(void *)&v48[192];
  *(_OWORD *)((char *)&v51[4] + 1) = *(_OWORD *)&v48[64];
  *(_OWORD *)((char *)v51 + 1) = *(_OWORD *)v48;
  long long v30 = v51[10];
  v29[10] = v51[9];
  v29[11] = v30;
  v29[12] = v51[11];
  *(_OWORD *)((char *)v29 + 201) = *(_OWORD *)((char *)&v51[11] + 9);
  long long v31 = v51[6];
  v29[6] = v51[5];
  v29[7] = v31;
  long long v32 = v51[8];
  v29[8] = v51[7];
  v29[9] = v32;
  long long v33 = v51[2];
  v29[2] = v51[1];
  v29[3] = v33;
  long long v34 = v51[4];
  v29[4] = v51[3];
  v29[5] = v34;
  long long v35 = v51[0];
  *uint64_t v29 = v50;
  v29[1] = v35;
  uint64_t v36 = v26 + *(int *)(v27 + 64);
  *(void *)uint64_t v36 = 0;
  *(unsigned char *)(v36 + 8) = 1;
  sub_22015C9CC((uint64_t)&v50);
  sub_22014ACAC(v24, &qword_267F0A468);
  long long v64 = *(_OWORD *)&v48[144];
  long long v65 = *(_OWORD *)&v48[160];
  long long v66 = *(_OWORD *)&v48[176];
  long long v60 = *(_OWORD *)&v48[80];
  long long v61 = *(_OWORD *)&v48[96];
  long long v62 = *(_OWORD *)&v48[112];
  long long v63 = *(_OWORD *)&v48[128];
  long long v56 = *(_OWORD *)&v48[16];
  long long v57 = *(_OWORD *)&v48[32];
  long long v58 = *(_OWORD *)&v48[48];
  long long v59 = *(_OWORD *)&v48[64];
  uint64_t v52 = (char *)v25;
  long long v53 = 0;
  char v54 = 1;
  uint64_t v67 = *(void *)&v48[192];
  long long v55 = *(_OWORD *)v48;
  sub_22015CA60((uint64_t)&v52);
  return sub_22014ACAC(v22, &qword_267F0A468);
}

uint64_t sub_220158B20@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = type metadata accessor for SourceGroupView(0);
  sub_220157994(*(unsigned char *)(a1 + *(int *)(v4 + 20)));
  sub_22014F7F4();
  uint64_t v5 = sub_220182120();
  uint64_t v7 = v6;
  char v9 = v8;
  if (qword_267F09CB8 != -1) {
    swift_once();
  }
  uint64_t v10 = sub_220182110();
  uint64_t v54 = v11;
  uint64_t v55 = v10;
  char v51 = v12;
  uint64_t v56 = v13;
  sub_22014F7E4(v5, v7, v9 & 1);
  swift_bridgeObjectRelease();
  if (qword_267F09CC0 != -1) {
    swift_once();
  }
  uint64_t v53 = qword_267F0C178;
  swift_retain();
  char v52 = sub_2201820C0();
  sub_220181CE0();
  uint64_t v15 = v14;
  uint64_t v17 = v16;
  uint64_t v19 = v18;
  uint64_t v21 = v20;
  sub_220157BC0();
  uint64_t v22 = sub_220182120();
  uint64_t v24 = v23;
  char v26 = v25;
  if (qword_267F09CC8 != -1) {
    swift_once();
  }
  char v27 = v26 & 1;
  uint64_t v28 = sub_220182110();
  uint64_t v30 = v29;
  char v32 = v31;
  sub_22014F7E4(v22, v24, v27);
  swift_bridgeObjectRelease();
  if (qword_267F09CD0 != -1) {
    swift_once();
  }
  uint64_t v57 = qword_267F0C188;
  swift_retain();
  uint64_t v33 = sub_220182100();
  uint64_t v35 = v34;
  char v37 = v36;
  uint64_t v50 = v38;
  sub_22014F7E4(v28, v30, v32 & 1);
  swift_release();
  swift_bridgeObjectRelease();
  char v49 = sub_2201820C0();
  if (qword_267F09CD8 != -1) {
    swift_once();
  }
  sub_220181CE0();
  uint64_t v40 = v39;
  uint64_t v42 = v41;
  uint64_t v44 = v43;
  uint64_t v46 = v45;
  uint64_t KeyPath = swift_getKeyPath();
  *(_DWORD *)(a2 + 17) = v57;
  *(_DWORD *)(a2 + 20) = *(_DWORD *)((char *)&v57 + 3);
  *(_DWORD *)(a2 + 34) = v63;
  *(_WORD *)(a2 + 38) = v64;
  *(_DWORD *)(a2 + 49) = *(_DWORD *)v62;
  *(_DWORD *)(a2 + 52) = *(_DWORD *)&v62[3];
  *(_DWORD *)(a2 + 89) = *(_DWORD *)v61;
  *(_DWORD *)(a2 + 92) = *(_DWORD *)&v61[3];
  *(_DWORD *)(a2 + 113) = *(_DWORD *)v60;
  *(_DWORD *)(a2 + 116) = *(_DWORD *)&v60[3];
  *(_DWORD *)(a2 + 129) = *(_DWORD *)v59;
  *(_DWORD *)(a2 + 132) = *(_DWORD *)&v59[3];
  *(_DWORD *)(a2 + 172) = *(_DWORD *)&v58[3];
  *(_DWORD *)(a2 + 169) = *(_DWORD *)v58;
  *(void *)a2 = v55;
  *(void *)(a2 + 8) = v54;
  *(unsigned char *)(a2 + 16) = v51 & 1;
  *(void *)(a2 + 24) = v56;
  *(_WORD *)(a2 + 32) = 256;
  *(void *)(a2 + 40) = v53;
  *(unsigned char *)(a2 + 48) = v52;
  *(void *)(a2 + 56) = v15;
  *(void *)(a2 + 64) = v17;
  *(void *)(a2 + 72) = v19;
  *(void *)(a2 + 80) = v21;
  *(unsigned char *)(a2 + 88) = 0;
  *(void *)(a2 + 96) = v33;
  *(void *)(a2 + 104) = v35;
  *(unsigned char *)(a2 + 112) = v37 & 1;
  *(void *)(a2 + 120) = v50;
  *(unsigned char *)(a2 + 128) = v49;
  *(void *)(a2 + 136) = v40;
  *(void *)(a2 + 144) = v42;
  *(void *)(a2 + 152) = v44;
  *(void *)(a2 + 160) = v46;
  *(unsigned char *)(a2 + 168) = 0;
  *(void *)(a2 + 176) = KeyPath;
  *(void *)(a2 + 184) = 1;
  *(unsigned char *)(a2 + 192) = 0;
  sub_22014F790(v55, v54, v51 & 1);
  swift_bridgeObjectRetain();
  swift_retain();
  sub_22014F790(v33, v35, v37 & 1);
  swift_bridgeObjectRetain();
  swift_retain();
  sub_22014F7E4(v33, v35, v37 & 1);
  swift_release();
  swift_bridgeObjectRelease();
  sub_22014F7E4(v55, v54, v51 & 1);
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_220158FEC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v41 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F0A408);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (uint64_t *)((char *)&v40 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F0A410);
  uint64_t v7 = MEMORY[0x270FA5388](v6);
  char v9 = (char *)&v40 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = MEMORY[0x270FA5388](v7);
  char v12 = (char *)&v40 - v11;
  MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v40 - v13;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F0A418);
  uint64_t v16 = MEMORY[0x270FA5388](v15 - 8);
  uint64_t v18 = (char *)&v40 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16);
  uint64_t v20 = (char *)&v40 - v19;
  *(void *)uint64_t v20 = sub_220181F10();
  *((void *)v20 + 1) = 0;
  v20[16] = 0;
  uint64_t *v5 = sub_220182340();
  v5[1] = v21;
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F0A420);
  sub_220159354(a1, (uint64_t)v5 + *(int *)(v22 + 44));
  unsigned __int8 v23 = sub_2201820C0();
  unsigned __int8 v24 = sub_220182080();
  char v25 = sub_2201820B0();
  sub_2201820B0();
  if (sub_2201820B0() != v23) {
    char v25 = sub_2201820B0();
  }
  sub_2201820B0();
  if (sub_2201820B0() != v24) {
    char v25 = sub_2201820B0();
  }
  char v26 = &v20[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267F0A428) + 44)];
  sub_220181CE0();
  uint64_t v28 = v27;
  uint64_t v30 = v29;
  uint64_t v32 = v31;
  uint64_t v34 = v33;
  sub_22014FA88((uint64_t)v5, (uint64_t)v12, &qword_267F0A408);
  uint64_t v35 = &v12[*(int *)(v6 + 36)];
  *uint64_t v35 = v25;
  *((void *)v35 + 1) = v28;
  *((void *)v35 + 2) = v30;
  *((void *)v35 + 3) = v32;
  *((void *)v35 + 4) = v34;
  v35[40] = 0;
  sub_22014ACAC((uint64_t)v5, &qword_267F0A408);
  sub_22014B470((uint64_t)v12, (uint64_t)v14, &qword_267F0A410);
  sub_22014FA88((uint64_t)v14, (uint64_t)v9, &qword_267F0A410);
  *(void *)char v26 = 0;
  v26[8] = 1;
  uint64_t v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F0A430);
  sub_22014FA88((uint64_t)v9, (uint64_t)&v26[*(int *)(v36 + 48)], &qword_267F0A410);
  sub_22014ACAC((uint64_t)v14, &qword_267F0A410);
  sub_22014ACAC((uint64_t)v9, &qword_267F0A410);
  sub_22014FA88((uint64_t)v20, (uint64_t)v18, &qword_267F0A418);
  uint64_t v37 = v41;
  sub_22014FA88((uint64_t)v18, v41, &qword_267F0A418);
  uint64_t v38 = v37 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267F0A438) + 48);
  *(void *)uint64_t v38 = 0;
  *(unsigned char *)(v38 + 8) = 1;
  sub_22014ACAC((uint64_t)v20, &qword_267F0A418);
  return sub_22014ACAC((uint64_t)v18, &qword_267F0A418);
}

uint64_t sub_220159354@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v71 = a2;
  uint64_t v69 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F0A440);
  MEMORY[0x270FA5388](v69);
  long long v70 = (uint64_t *)((char *)&v48 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v4 = sub_2201823B0();
  uint64_t v64 = *(void *)(v4 - 8);
  uint64_t v65 = v4;
  MEMORY[0x270FA5388](v4);
  int v63 = (char *)&v48 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v61 = sub_220182390();
  uint64_t v62 = *(void *)(v61 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v61);
  long long v59 = (char *)&v48 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  long long v58 = (char *)&v48 - v9;
  MEMORY[0x270FA5388](v8);
  uint64_t v57 = (char *)&v48 - v10;
  uint64_t v11 = sub_220181DC0();
  uint64_t v67 = *(void *)(v11 - 8);
  uint64_t v68 = v11;
  MEMORY[0x270FA5388](v11);
  long long v66 = (char *)&v48 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F0A448);
  MEMORY[0x270FA5388](v13 - 8);
  uint64_t v15 = (char *)&v48 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v60 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F0A450);
  MEMORY[0x270FA5388](v60);
  uint64_t v17 = (char *)&v48 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = type metadata accessor for SourceGroupView(0);
  uint64_t v19 = (char **)(a1 + *(int *)(v18 + 24));
  uint64_t v20 = v19[1];
  BOOL v76 = *v19;
  long long v77 = v20;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F0A458);
  sub_2201822A0();
  uint64_t v21 = v75;
  swift_getKeyPath();
  BOOL v76 = v21;
  sub_220157824((unint64_t *)&qword_267F0A920, (void (*)(uint64_t))type metadata accessor for NotificationSummarizationOnboardingViewModel);
  sub_220181BF0();
  swift_release();
  uint64_t v22 = (uint64_t *)&v21[OBJC_IVAR____TtC20UserNotificationsKit44NotificationSummarizationOnboardingViewModel__selectedCategories];
  swift_beginAccess();
  uint64_t v23 = *v22;
  swift_bridgeObjectRetain();

  uint64_t v24 = *(int *)(v18 + 20);
  LOBYTE(v18) = sub_220164BCC(*(unsigned char *)(a1 + v24), v23);
  swift_bridgeObjectRelease();
  if ((v18 & 1) == 0)
  {
    if (qword_267F09D20 != -1) {
      swift_once();
    }
    swift_bridgeObjectRetain();
  }
  sub_220182250();
  sub_220181F90();
  uint64_t v25 = sub_220181FA0();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v25 - 8) + 56))(v15, 0, 1, v25);
  uint64_t v56 = sub_220182270();
  swift_release();
  sub_22014ACAC((uint64_t)v15, &qword_267F0A448);
  sub_220182350();
  sub_220181D70();
  char v26 = v76;
  int v53 = v77;
  uint64_t v52 = v78;
  int v51 = v79;
  uint64_t v50 = v80;
  uint64_t v49 = v81;
  if (qword_267F09D18 != -1) {
    swift_once();
  }
  uint64_t v27 = qword_267F0C1D0;
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v28 = v19[1];
  uint64_t v72 = *v19;
  uint64_t v73 = v28;
  uint64_t v54 = v27;
  swift_retain();
  sub_2201822A0();
  uint64_t v29 = v74;
  swift_getKeyPath();
  uint64_t v72 = v29;
  sub_220181BF0();
  swift_release();
  uint64_t v30 = (uint64_t *)&v29[OBJC_IVAR____TtC20UserNotificationsKit44NotificationSummarizationOnboardingViewModel__selectedCategories];
  swift_beginAccess();
  uint64_t v31 = *v30;
  swift_bridgeObjectRetain();

  LOBYTE(v27) = sub_220164BCC(*(unsigned char *)(a1 + v24), v31);
  swift_bridgeObjectRelease();
  if (v27)
  {
    uint64_t v32 = sub_2201821B0();
  }
  else
  {
    if (qword_267F09D10 != -1) {
      swift_once();
    }
    uint64_t v32 = qword_267F0C1C8;
    swift_retain();
  }
  uint64_t v33 = swift_getKeyPath();
  uint64_t v34 = v57;
  sub_220182380();
  uint64_t v35 = v58;
  sub_220182360();
  uint64_t v36 = *(void (**)(char *, uint64_t))(v62 + 8);
  uint64_t v37 = v61;
  v36(v34, v61);
  uint64_t v38 = v59;
  sub_220182370();
  v36(v35, v37);
  uint64_t v39 = v63;
  sub_2201823A0();
  sub_220157824(&qword_267F0A460, MEMORY[0x263F1BBC8]);
  uint64_t v40 = v66;
  sub_220181DB0();
  (*(void (**)(char *, uint64_t))(v64 + 8))(v39, v65);
  v36(v38, v37);
  uint64_t v41 = swift_getKeyPath();
  uint64_t v42 = v70;
  uint64_t v44 = v67;
  uint64_t v43 = v68;
  (*(void (**)(char *, char *, uint64_t))(v67 + 16))((char *)v70 + *(int *)(v69 + 28), v40, v68);
  uint64_t *v42 = v41;
  sub_22014FA88((uint64_t)v42, (uint64_t)&v17[*(int *)(v60 + 36)], &qword_267F0A440);
  *(void *)uint64_t v17 = v56;
  *((void *)v17 + 1) = v26;
  v17[16] = v53;
  *((void *)v17 + 3) = v52;
  v17[32] = v51;
  uint64_t v45 = v49;
  *((void *)v17 + 5) = v50;
  *((void *)v17 + 6) = v45;
  uint64_t v46 = v54;
  *((void *)v17 + 7) = KeyPath;
  *((void *)v17 + 8) = v46;
  *((void *)v17 + 9) = v33;
  *((void *)v17 + 10) = v32;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  sub_22014ACAC((uint64_t)v42, &qword_267F0A440);
  (*(void (**)(char *, uint64_t))(v44 + 8))(v40, v43);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return sub_22014B470((uint64_t)v17, v71, &qword_267F0A450);
}

uint64_t sub_220159C38(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 - 8);
  uint64_t v3 = *(void *)(v2 + 64);
  MEMORY[0x270FA5388](a1 - 8);
  sub_22015792C(v1, (uint64_t)&v7[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)], type metadata accessor for SourceGroupView);
  unint64_t v4 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v5 = swift_allocObject();
  sub_22015C70C((uint64_t)&v7[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)], v5 + v4, type metadata accessor for SourceGroupView);
  uint64_t v8 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F0A378);
  sub_22015C7DC();
  return sub_2201822D0();
}

uint64_t sub_220159D94@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F0A4A0);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (uint64_t *)((char *)&v39 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F0A4A8);
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v39 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F0A4B0);
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (char *)&v39 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  *uint64_t v6 = sub_220182350();
  v6[1] = v13;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F0A4B8);
  sub_22015A090(v2, (uint64_t)v6 + *(int *)(v14 + 44));
  unsigned __int8 v15 = sub_220182080();
  unsigned __int8 v16 = sub_2201820A0();
  unsigned __int8 v17 = sub_220182090();
  char v18 = sub_2201820B0();
  sub_2201820B0();
  if (sub_2201820B0() != v15) {
    char v18 = sub_2201820B0();
  }
  sub_2201820B0();
  if (sub_2201820B0() != v16) {
    char v18 = sub_2201820B0();
  }
  sub_2201820B0();
  if (sub_2201820B0() != v17) {
    char v18 = sub_2201820B0();
  }
  if (qword_267F09CE8 != -1) {
    swift_once();
  }
  sub_220181CE0();
  uint64_t v20 = v19;
  uint64_t v22 = v21;
  uint64_t v24 = v23;
  uint64_t v26 = v25;
  sub_22014FA88((uint64_t)v6, (uint64_t)v9, &qword_267F0A4A0);
  uint64_t v27 = &v9[*(int *)(v7 + 36)];
  *uint64_t v27 = v18;
  *((void *)v27 + 1) = v20;
  *((void *)v27 + 2) = v22;
  *((void *)v27 + 3) = v24;
  *((void *)v27 + 4) = v26;
  v27[40] = 0;
  sub_22014ACAC((uint64_t)v6, &qword_267F0A4A0);
  char v28 = sub_2201820C0();
  sub_220181CE0();
  uint64_t v30 = v29;
  uint64_t v32 = v31;
  uint64_t v34 = v33;
  uint64_t v36 = v35;
  sub_22014FA88((uint64_t)v9, (uint64_t)v12, &qword_267F0A4A8);
  uint64_t v37 = &v12[*(int *)(v10 + 36)];
  *uint64_t v37 = v28;
  *((void *)v37 + 1) = v30;
  *((void *)v37 + 2) = v32;
  *((void *)v37 + 3) = v34;
  *((void *)v37 + 4) = v36;
  v37[40] = 0;
  sub_22014ACAC((uint64_t)v9, &qword_267F0A4A8);
  return sub_22014B470((uint64_t)v12, a1, &qword_267F0A4B0);
}

uint64_t sub_22015A090@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v52 = a1;
  uint64_t v57 = a2;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F0A4C0);
  uint64_t v3 = MEMORY[0x270FA5388](v2 - 8);
  uint64_t v58 = (uint64_t)&v51 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v51 - v5;
  uint64_t v53 = sub_220181D10();
  uint64_t v7 = *(void *)(v53 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v53);
  uint64_t v10 = (char *)&v51 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v51 - v11;
  uint64_t v13 = sub_220181D90();
  uint64_t v14 = v13 - 8;
  MEMORY[0x270FA5388](v13);
  unsigned __int8 v16 = (_OWORD *)((char *)&v51 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F0A4C8);
  uint64_t v18 = v17 - 8;
  MEMORY[0x270FA5388](v17);
  uint64_t v20 = (char *)&v51 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v54 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F0A4D0);
  uint64_t v21 = MEMORY[0x270FA5388](v54);
  uint64_t v56 = (uint64_t)&v51 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = MEMORY[0x270FA5388](v21);
  uint64_t v25 = (char *)&v51 - v24;
  MEMORY[0x270FA5388](v23);
  uint64_t v55 = (uint64_t)&v51 - v26;
  uint64_t v27 = (char *)v16 + *(int *)(v14 + 28);
  uint64_t v28 = *MEMORY[0x263F19860];
  uint64_t v29 = sub_220181F50();
  uint64_t v30 = v28;
  uint64_t v31 = v52;
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v29 - 8) + 104))(v27, v30, v29);
  __asm { FMOV            V0.2D, #6.0 }
  *unsigned __int8 v16 = _Q0;
  sub_220182350();
  sub_220181D70();
  sub_22015792C((uint64_t)v16, (uint64_t)v20, MEMORY[0x263F19048]);
  uint64_t v37 = &v20[*(int *)(v18 + 44)];
  long long v38 = v60;
  *(_OWORD *)uint64_t v37 = v59;
  *((_OWORD *)v37 + 1) = v38;
  *((_OWORD *)v37 + 2) = v61;
  sub_22015B9E0((uint64_t)v16, MEMORY[0x263F19048]);
  type metadata accessor for SourceGroupIconView(0);
  sub_22014F114((uint64_t)v12);
  uint64_t v39 = v53;
  (*(void (**)(char *, void, uint64_t))(v7 + 104))(v10, *MEMORY[0x263F184F8], v53);
  sub_220181D00();
  uint64_t v40 = *(void (**)(char *, uint64_t))(v7 + 8);
  v40(v10, v39);
  v40(v12, v39);
  if (qword_267F09D08 != -1) {
    swift_once();
  }
  id v41 = objc_msgSend(self, sel_currentDevice);
  objc_msgSend(v41, sel_userInterfaceIdiom);

  uint64_t v42 = sub_2201821F0();
  sub_22014FA88((uint64_t)v20, (uint64_t)v25, &qword_267F0A4C8);
  *(void *)&v25[*(int *)(v54 + 36)] = v42;
  sub_22014ACAC((uint64_t)v20, &qword_267F0A4C8);
  uint64_t v43 = v55;
  sub_22014B470((uint64_t)v25, v55, &qword_267F0A4D0);
  *(void *)uint64_t v6 = sub_220182350();
  *((void *)v6 + 1) = v44;
  *((void *)v6 + 2) = 0x4008000000000000;
  v6[24] = 0;
  *((void *)v6 + 4) = 0x4008000000000000;
  v6[40] = 0;
  uint64_t v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F0A4D8);
  sub_22015A620(v31, (uint64_t)&v6[*(int *)(v45 + 44)]);
  uint64_t v46 = v56;
  sub_22014FA88(v43, v56, &qword_267F0A4D0);
  uint64_t v47 = v58;
  sub_22014FA88((uint64_t)v6, v58, &qword_267F0A4C0);
  uint64_t v48 = v57;
  sub_22014FA88(v46, v57, &qword_267F0A4D0);
  uint64_t v49 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F0A4E0);
  sub_22014FA88(v47, v48 + *(int *)(v49 + 48), &qword_267F0A4C0);
  sub_22014ACAC((uint64_t)v6, &qword_267F0A4C0);
  sub_22014ACAC(v43, &qword_267F0A4D0);
  sub_22014ACAC(v47, &qword_267F0A4C0);
  return sub_22014ACAC(v46, &qword_267F0A4D0);
}

uint64_t sub_22015A620@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F0A4E8);
  uint64_t v5 = v4 - 8;
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = MEMORY[0x270FA5388](v6);
  uint64_t v11 = (char *)&v19 - v10;
  uint64_t v12 = MEMORY[0x270FA5388](v9);
  uint64_t v14 = (char *)&v19 - v13;
  MEMORY[0x270FA5388](v12);
  unsigned __int8 v16 = (char *)&v19 - v15;
  *(void *)unsigned __int8 v16 = 0;
  v16[8] = 1;
  sub_22015A7CC(a1, (uint64_t)&v19 + *(int *)(v5 + 44) - v15);
  *(void *)uint64_t v14 = 0;
  v14[8] = 1;
  sub_22015AD5C(a1, (uint64_t)&v14[*(int *)(v5 + 44)]);
  sub_22014FA88((uint64_t)v16, (uint64_t)v11, &qword_267F0A4E8);
  sub_22014FA88((uint64_t)v14, (uint64_t)v8, &qword_267F0A4E8);
  sub_22014FA88((uint64_t)v11, a2, &qword_267F0A4E8);
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F0A4F0);
  sub_22014FA88((uint64_t)v8, a2 + *(int *)(v17 + 48), &qword_267F0A4E8);
  sub_22014ACAC((uint64_t)v14, &qword_267F0A4E8);
  sub_22014ACAC((uint64_t)v16, &qword_267F0A4E8);
  sub_22014ACAC((uint64_t)v8, &qword_267F0A4E8);
  return sub_22014ACAC((uint64_t)v11, &qword_267F0A4E8);
}

uint64_t sub_22015A7CC@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v63 = type metadata accessor for SourceIconContainerView(0);
  uint64_t v4 = MEMORY[0x270FA5388](v63);
  uint64_t v6 = (void *)((char *)v54 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v4);
  uint64_t v8 = (void *)((char *)v54 - v7);
  uint64_t v64 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F0A4F8);
  uint64_t v9 = MEMORY[0x270FA5388](v64);
  uint64_t v11 = (char *)v54 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = MEMORY[0x270FA5388](v9);
  uint64_t v14 = (char *)v54 - v13;
  uint64_t v15 = MEMORY[0x270FA5388](v12);
  uint64_t v55 = (uint64_t)v54 - v16;
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  uint64_t v19 = (char *)v54 - v18;
  uint64_t v20 = MEMORY[0x270FA5388](v17);
  unint64_t v22 = (unint64_t)v54 - v21;
  MEMORY[0x270FA5388](v20);
  long long v61 = (void *)((char *)v54 - v23);
  uint64_t v60 = *(int *)(type metadata accessor for SourceGroupIconView(0) + 24);
  unint64_t v24 = *(void *)((char *)a1 + v60);
  if (v24 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v25 = sub_220182870();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v25 = *(void *)((v24 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  uint64_t v57 = v11;
  uint64_t v58 = a2;
  uint64_t v56 = v14;
  long long v59 = v19;
  uint64_t v62 = v6;
  if (v25 < 1)
  {
    uint64_t v28 = a1;
    uint64_t v27 = 0;
  }
  else
  {
    if ((v24 & 0xC000000000000001) != 0)
    {
      id v26 = (id)MEMORY[0x223C66AB0](0, v24);
    }
    else
    {
      if (!*(void *)((v24 & 0xFFFFFFFFFFFFFF8) + 0x10))
      {
        __break(1u);
        goto LABEL_24;
      }
      id v26 = *(id *)(v24 + 32);
    }
    uint64_t v27 = (uint64_t)v26;
    uint64_t v28 = a1;
  }
  type metadata accessor for NotificationSourceIconCache();
  sub_220157824((unint64_t *)&qword_267F0A1E0, (void (*)(uint64_t))type metadata accessor for NotificationSourceIconCache);
  uint64_t v29 = sub_220181DE0();
  uint64_t v31 = v30;
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v33 = v63;
  *(uint64_t *)((char *)v8 + *(int *)(v63 + 20)) = KeyPath;
  v54[1] = __swift_instantiateConcreteTypeFromMangledName(&qword_267F0AAA0);
  swift_storeEnumTagMultiPayload();
  *uint64_t v8 = v29;
  v8[1] = v31;
  *(uint64_t *)((char *)v8 + *(int *)(v33 + 24)) = v27;
  a1 = v28;
  uint64_t v34 = *v28;
  if (!*v28) {
    goto LABEL_26;
  }
  swift_retain();
  uint64_t v35 = sub_220181CA0();
  sub_22015792C((uint64_t)v8, v22, type metadata accessor for SourceIconContainerView);
  uint64_t v36 = (uint64_t *)(v22 + *(int *)(v64 + 36));
  uint64_t *v36 = v35;
  v36[1] = v34;
  sub_22015B9E0((uint64_t)v8, type metadata accessor for SourceIconContainerView);
  uint64_t v8 = v61;
  sub_22014B470(v22, (uint64_t)v61, &qword_267F0A4F8);
  unint64_t v22 = *(void *)((char *)v28 + v60);
  uint64_t v6 = v62;
  if (v22 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v37 = sub_220182870();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v37 = *(void *)((v22 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  uint64_t v19 = v59;
  if (v37 > 1)
  {
    if ((v22 & 0xC000000000000001) == 0)
    {
      if (*(void *)((v22 & 0xFFFFFFFFFFFFFF8) + 0x10) < 2uLL)
      {
        __break(1u);
        goto LABEL_26;
      }
      id v38 = *(id *)(v22 + 40);
      goto LABEL_16;
    }
LABEL_24:
    id v38 = (id)MEMORY[0x223C66AB0](1, v22);
LABEL_16:
    uint64_t v39 = (uint64_t)v38;
    goto LABEL_18;
  }
  uint64_t v39 = 0;
LABEL_18:
  uint64_t v40 = sub_220181DE0();
  uint64_t v42 = v41;
  uint64_t v43 = swift_getKeyPath();
  uint64_t v44 = v63;
  *(uint64_t *)((char *)v6 + *(int *)(v63 + 20)) = v43;
  swift_storeEnumTagMultiPayload();
  *uint64_t v6 = v40;
  v6[1] = v42;
  *(uint64_t *)((char *)v6 + *(int *)(v44 + 24)) = v39;
  uint64_t v45 = *a1;
  if (*a1)
  {
    swift_retain();
    uint64_t v46 = sub_220181CA0();
    uint64_t v47 = v55;
    sub_22015792C((uint64_t)v6, v55, type metadata accessor for SourceIconContainerView);
    uint64_t v48 = (uint64_t *)(v47 + *(int *)(v64 + 36));
    *uint64_t v48 = v46;
    v48[1] = v45;
    sub_22015B9E0((uint64_t)v6, type metadata accessor for SourceIconContainerView);
    sub_22014B470(v47, (uint64_t)v19, &qword_267F0A4F8);
    uint64_t v49 = (uint64_t)v56;
    sub_22014FA88((uint64_t)v8, (uint64_t)v56, &qword_267F0A4F8);
    uint64_t v50 = (uint64_t)v57;
    sub_22014FA88((uint64_t)v19, (uint64_t)v57, &qword_267F0A4F8);
    uint64_t v51 = v58;
    sub_22014FA88(v49, v58, &qword_267F0A4F8);
    uint64_t v52 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F0A500);
    sub_22014FA88(v50, v51 + *(int *)(v52 + 48), &qword_267F0A4F8);
    sub_22014ACAC((uint64_t)v19, &qword_267F0A4F8);
    sub_22014ACAC((uint64_t)v8, &qword_267F0A4F8);
    sub_22014ACAC(v50, &qword_267F0A4F8);
    return sub_22014ACAC(v49, &qword_267F0A4F8);
  }
LABEL_26:
  uint64_t result = sub_220181DD0();
  __break(1u);
  return result;
}

uint64_t sub_22015AD5C@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v68 = type metadata accessor for SourceIconContainerView(0);
  uint64_t v4 = MEMORY[0x270FA5388](v68);
  uint64_t v6 = (char *)v59 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v8 = (void *)((char *)v59 - v7);
  uint64_t v69 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F0A4F8);
  uint64_t v9 = MEMORY[0x270FA5388](v69);
  uint64_t v11 = (char *)v59 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = MEMORY[0x270FA5388](v9);
  uint64_t v14 = (char *)v59 - v13;
  uint64_t v15 = MEMORY[0x270FA5388](v12);
  uint64_t v60 = (uint64_t)v59 - v16;
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  uint64_t v19 = (char *)v59 - v18;
  uint64_t v20 = MEMORY[0x270FA5388](v17);
  unint64_t v22 = (char *)v59 - v21;
  MEMORY[0x270FA5388](v20);
  uint64_t v66 = (uint64_t)v59 - v23;
  uint64_t v65 = *(int *)(type metadata accessor for SourceGroupIconView(0) + 24);
  unint64_t v24 = *(uint64_t *)((char *)a1 + v65);
  if (v24 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v25 = sub_220182870();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v25 = *(void *)((v24 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  uint64_t v62 = v11;
  uint64_t v63 = a2;
  long long v61 = v14;
  uint64_t v64 = v19;
  uint64_t v67 = (uint64_t *)v6;
  if (v25 < 3)
  {
    uint64_t v28 = a1;
    uint64_t v27 = 0;
  }
  else
  {
    if ((v24 & 0xC000000000000001) != 0)
    {
      id v26 = (id)MEMORY[0x223C66AB0](2, v24);
    }
    else
    {
      if (*(void *)((v24 & 0xFFFFFFFFFFFFFF8) + 0x10) < 3uLL)
      {
        __break(1u);
        goto LABEL_25;
      }
      id v26 = *(id *)(v24 + 48);
    }
    uint64_t v27 = (uint64_t)v26;
    uint64_t v28 = a1;
  }
  type metadata accessor for NotificationSourceIconCache();
  sub_220157824((unint64_t *)&qword_267F0A1E0, (void (*)(uint64_t))type metadata accessor for NotificationSourceIconCache);
  uint64_t v29 = sub_220181DE0();
  uint64_t v31 = v30;
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v33 = v68;
  *(uint64_t *)((char *)v8 + *(int *)(v68 + 20)) = KeyPath;
  v59[1] = __swift_instantiateConcreteTypeFromMangledName(&qword_267F0AAA0);
  swift_storeEnumTagMultiPayload();
  *uint64_t v8 = v29;
  v8[1] = v31;
  *(uint64_t *)((char *)v8 + *(int *)(v33 + 24)) = v27;
  uint64_t v34 = v28;
  uint64_t v35 = *v28;
  if (!*v28) {
    goto LABEL_26;
  }
  swift_retain();
  uint64_t v36 = sub_220181CA0();
  sub_22015792C((uint64_t)v8, (uint64_t)v22, type metadata accessor for SourceIconContainerView);
  uint64_t v37 = (uint64_t *)&v22[*(int *)(v69 + 36)];
  *uint64_t v37 = v36;
  v37[1] = v35;
  sub_22015B9E0((uint64_t)v8, type metadata accessor for SourceIconContainerView);
  uint64_t v38 = v66;
  sub_22014B470((uint64_t)v22, v66, &qword_267F0A4F8);
  unint64_t v39 = *(uint64_t *)((char *)v28 + v65);
  uint64_t v40 = v67;
  if (v39 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v41 = sub_220182870();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v41 = *(void *)((v39 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  uint64_t v42 = (uint64_t)v64;
  if (v41 > 3)
  {
    if ((v39 & 0xC000000000000001) != 0)
    {
      id v43 = (id)MEMORY[0x223C66AB0](3, v39);
      goto LABEL_16;
    }
    if (*(void *)((v39 & 0xFFFFFFFFFFFFFF8) + 0x10) >= 4uLL)
    {
      id v43 = *(id *)(v39 + 56);
LABEL_16:
      uint64_t v44 = (uint64_t)v43;
      goto LABEL_18;
    }
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  uint64_t v44 = 0;
LABEL_18:
  uint64_t v45 = sub_220181DE0();
  uint64_t v47 = v46;
  uint64_t v48 = swift_getKeyPath();
  uint64_t v49 = v68;
  *(uint64_t *)((char *)v40 + *(int *)(v68 + 20)) = v48;
  swift_storeEnumTagMultiPayload();
  *uint64_t v40 = v45;
  v40[1] = v47;
  *(uint64_t *)((char *)v40 + *(int *)(v49 + 24)) = v44;
  uint64_t v50 = *v34;
  if (*v34)
  {
    swift_retain();
    uint64_t v51 = sub_220181CA0();
    uint64_t v52 = v60;
    sub_22015792C((uint64_t)v40, v60, type metadata accessor for SourceIconContainerView);
    uint64_t v53 = (uint64_t *)(v52 + *(int *)(v69 + 36));
    *uint64_t v53 = v51;
    v53[1] = v50;
    sub_22015B9E0((uint64_t)v40, type metadata accessor for SourceIconContainerView);
    sub_22014B470(v52, v42, &qword_267F0A4F8);
    uint64_t v54 = (uint64_t)v61;
    sub_22014FA88(v38, (uint64_t)v61, &qword_267F0A4F8);
    uint64_t v55 = (uint64_t)v62;
    sub_22014FA88(v42, (uint64_t)v62, &qword_267F0A4F8);
    uint64_t v56 = v63;
    sub_22014FA88(v54, v63, &qword_267F0A4F8);
    uint64_t v57 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F0A500);
    sub_22014FA88(v55, v56 + *(int *)(v57 + 48), &qword_267F0A4F8);
    sub_22014ACAC(v42, &qword_267F0A4F8);
    sub_22014ACAC(v38, &qword_267F0A4F8);
    sub_22014ACAC(v55, &qword_267F0A4F8);
    return sub_22014ACAC(v54, &qword_267F0A4F8);
  }
LABEL_26:
  uint64_t result = sub_220181DD0();
  __break(1u);
  return result;
}

void sub_22015B2F4(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v48 = a2;
  uint64_t v47 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F0A540);
  MEMORY[0x270FA5388](v47);
  uint64_t v4 = (char *)&v41 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_220181D10();
  uint64_t v45 = *(void *)(v5 - 8);
  uint64_t v46 = v5;
  uint64_t v6 = MEMORY[0x270FA5388](v5);
  uint64_t v44 = (char *)&v41 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v41 - v8;
  uint64_t v10 = sub_220181D90();
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (_OWORD *)((char *)&v41 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F0A548);
  uint64_t v14 = MEMORY[0x270FA5388](v13);
  uint64_t v16 = (char *)&v41 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  uint64_t v18 = (char *)&v41 - v17;
  uint64_t v19 = *(void **)(a1 + *(int *)(type metadata accessor for SourceIconContainerView(0) + 24));
  if (v19)
  {
    type metadata accessor for NotificationSourceIconCache();
    sub_220157824((unint64_t *)&qword_267F0A1E0, (void (*)(uint64_t))type metadata accessor for NotificationSourceIconCache);
    id v20 = v19;
    uint64_t v21 = sub_220181DE0();
    uint64_t v23 = v22;
    uint64_t KeyPath = swift_getKeyPath();
    *(void *)uint64_t v4 = v20;
    *((void *)v4 + 1) = 0x4032000000000000;
    *((void *)v4 + 2) = v21;
    *((void *)v4 + 3) = v23;
    *((void *)v4 + 4) = KeyPath;
    v4[40] = 0;
    swift_storeEnumTagMultiPayload();
    sub_22015DC28();
    sub_22015DC7C();
    swift_retain();
    swift_retain();
    sub_220181FF0();
    swift_release();
    swift_release();
  }
  else
  {
    uint64_t v42 = v16;
    id v43 = v18;
    uint64_t v25 = (char *)v12 + *(int *)(v10 + 20);
    uint64_t v26 = *MEMORY[0x263F19860];
    uint64_t v27 = sub_220181F50();
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v27 - 8) + 104))(v25, v26, v27);
    __asm { FMOV            V0.2D, #4.0 }
    *uint64_t v12 = _Q0;
    sub_22014F114((uint64_t)v9);
    uint64_t v34 = v44;
    uint64_t v33 = v45;
    uint64_t v35 = v46;
    (*(void (**)(char *, void, uint64_t))(v45 + 104))(v44, *MEMORY[0x263F184F8], v46);
    sub_220181D00();
    uint64_t v36 = *(void (**)(char *, uint64_t))(v33 + 8);
    v36(v34, v35);
    v36(v9, v35);
    if (qword_267F09D00 != -1) {
      swift_once();
    }
    id v37 = objc_msgSend(self, sel_currentDevice);
    objc_msgSend(v37, sel_userInterfaceIdiom);

    uint64_t v38 = sub_2201821F0();
    uint64_t v39 = (uint64_t)v42;
    sub_22015792C((uint64_t)v12, (uint64_t)v42, MEMORY[0x263F19048]);
    *(void *)(v39 + *(int *)(v13 + 36)) = v38;
    sub_22015B9E0((uint64_t)v12, MEMORY[0x263F19048]);
    uint64_t v40 = (uint64_t)v43;
    sub_22014B470(v39, (uint64_t)v43, &qword_267F0A548);
    sub_22014FA88(v40, (uint64_t)v4, &qword_267F0A548);
    swift_storeEnumTagMultiPayload();
    sub_22015DC28();
    sub_22015DC7C();
    sub_220181FF0();
    sub_22014ACAC(v40, &qword_267F0A548);
  }
}

uint64_t sub_22015B824@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F0A530);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22015B2F4(v1, (uint64_t)v5);
  sub_220182350();
  sub_220181D70();
  sub_22014FA88((uint64_t)v5, a1, &qword_267F0A530);
  uint64_t v6 = (_OWORD *)(a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267F0A538) + 36));
  long long v7 = v9[1];
  *uint64_t v6 = v9[0];
  v6[1] = v7;
  v6[2] = v9[2];
  return sub_22014ACAC((uint64_t)v5, &qword_267F0A530);
}

uint64_t sub_22015B910(uint64_t a1)
{
  uint64_t v2 = sub_220181DC0();
  MEMORY[0x270FA5388](v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return sub_220181E60();
}

uint64_t sub_22015B9E0(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

void *sub_22015BA48(void *a1, void *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *a1 = *a2;
    a1 = (void *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_267F0AAA0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_220181D10();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v9 = a3[6];
    *((unsigned char *)a1 + a3[5]) = *((unsigned char *)a2 + a3[5]);
    uint64_t v10 = (void *)((char *)a1 + v9);
    uint64_t v11 = (char *)a2 + v9;
    uint64_t v12 = *(void **)v11;
    uint64_t v13 = *((void *)v11 + 1);
    *uint64_t v10 = *(void *)v11;
    v10[1] = v13;
    *(void *)((char *)a1 + a3[7]) = *(void *)((char *)a2 + a3[7]);
    id v14 = v12;
    swift_retain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_22015BB94(uint64_t a1, uint64_t a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F0AAA0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v4 = sub_220181D10();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  }
  else
  {
    swift_release();
  }

  swift_release();

  return swift_bridgeObjectRelease();
}

void *sub_22015BC54(void *a1, void *a2, int *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F0AAA0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_220181D10();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  }
  else
  {
    *a1 = *a2;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v7 = a3[6];
  *((unsigned char *)a1 + a3[5]) = *((unsigned char *)a2 + a3[5]);
  uint64_t v8 = (void *)((char *)a1 + v7);
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = *(void **)v9;
  uint64_t v11 = *((void *)v9 + 1);
  *uint64_t v8 = *(void *)v9;
  v8[1] = v11;
  *(void *)((char *)a1 + a3[7]) = *(void *)((char *)a2 + a3[7]);
  id v12 = v10;
  swift_retain();
  swift_bridgeObjectRetain();
  return a1;
}

void *sub_22015BD50(void *a1, void *a2, int *a3)
{
  if (a1 != a2)
  {
    sub_22014ACAC((uint64_t)a1, &qword_267F0AAA0);
    __swift_instantiateConcreteTypeFromMangledName(&qword_267F0AAA0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = sub_220181D10();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  *((unsigned char *)a1 + a3[5]) = *((unsigned char *)a2 + a3[5]);
  uint64_t v7 = a3[6];
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = *(void **)((char *)a2 + v7);
  uint64_t v11 = *(void **)v8;
  *(void *)uint64_t v8 = v10;
  id v12 = v10;

  *((void *)v8 + 1) = *((void *)v9 + 1);
  swift_retain();
  swift_release();
  *(void *)((char *)a1 + a3[7]) = *(void *)((char *)a2 + a3[7]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

char *sub_22015BE90(char *a1, char *a2, int *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F0AAA0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_220181D10();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
  }
  uint64_t v8 = a3[6];
  a1[a3[5]] = a2[a3[5]];
  *(_OWORD *)&a1[v8] = *(_OWORD *)&a2[v8];
  *(void *)&a1[a3[7]] = *(void *)&a2[a3[7]];
  return a1;
}

char *sub_22015BF78(char *a1, char *a2, int *a3)
{
  if (a1 != a2)
  {
    sub_22014ACAC((uint64_t)a1, &qword_267F0AAA0);
    uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F0AAA0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_220181D10();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
    }
  }
  uint64_t v8 = a3[6];
  a1[a3[5]] = a2[a3[5]];
  uint64_t v9 = &a1[v8];
  uint64_t v10 = &a2[v8];
  uint64_t v11 = *(void *)&a2[v8];
  id v12 = *(void **)&a1[v8];
  *(void *)uint64_t v9 = v11;

  *((void *)v9 + 1) = *((void *)v10 + 1);
  swift_release();
  *(void *)&a1[a3[7]] = *(void *)&a2[a3[7]];
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_22015C0A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_22015C0BC);
}

uint64_t sub_22015C0BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F0A068);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 24));
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
}

uint64_t sub_22015C180(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_22015C194);
}

uint64_t sub_22015C194(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = __swift_instantiateConcreteTypeFromMangledName(&qword_267F0A068);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 24)) = (a2 - 1);
  }
  return result;
}

void sub_22015C254()
{
  sub_22014E954();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

uint64_t sub_22015C300()
{
  return sub_22015C344(&qword_267F0A350, &qword_267F0A2C0, (void (*)(void))sub_22015C3C0);
}

uint64_t sub_22015C344(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_22015C3C0()
{
  unint64_t result = qword_267F0A358;
  if (!qword_267F0A358)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267F0A2B8);
    sub_22015DDF8(&qword_267F0A360, &qword_267F0A2B0, (void (*)(void))sub_22015C460);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F0A358);
  }
  return result;
}

unint64_t sub_22015C460()
{
  unint64_t result = qword_267F0A368;
  if (!qword_267F0A368)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267F0A370);
    sub_22015C344(&qword_267F0A2E8, &qword_267F0A2D8, (void (*)(void))sub_22015786C);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267F0A0C8);
    sub_220182020();
    sub_22014B510(&qword_267F0A0D0, &qword_267F0A0C8);
    sub_220157824(&qword_267F0A0D8, MEMORY[0x263F1A1D8]);
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F0A368);
  }
  return result;
}

uint64_t sub_22015C5B8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_22015C5D4()
{
  uint64_t v1 = type metadata accessor for SourceGroupView(0);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*(void *)(v1 - 8) + 64);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F0AAA0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = sub_220181D10();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v0 + v3, v5);
  }
  else
  {
    swift_release();
  }

  swift_release();
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, v3 + v4, v2 | 7);
}

uint64_t sub_22015C70C(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

void sub_22015C774()
{
  uint64_t v1 = *(void *)(type metadata accessor for SourceGroupView(0) - 8);
  uint64_t v2 = v0 + ((*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80));

  sub_220157DB0(v2);
}

uint64_t sub_22015C7D4@<X0>(uint64_t a1@<X8>)
{
  return sub_220157E28(*(void *)(v1 + 16), a1);
}

unint64_t sub_22015C7DC()
{
  unint64_t result = qword_267F0A380;
  if (!qword_267F0A380)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267F0A378);
    sub_22015C87C();
    sub_22014B510(&qword_267F0A3A8, &qword_267F0A3B0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F0A380);
  }
  return result;
}

unint64_t sub_22015C87C()
{
  unint64_t result = qword_267F0A388;
  if (!qword_267F0A388)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267F0A390);
    sub_22014B510(&qword_267F0A398, &qword_267F0A3A0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F0A388);
  }
  return result;
}

uint64_t sub_22015C924@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_220181E70();
  *a1 = result;
  return result;
}

uint64_t sub_22015C950()
{
  return sub_220181E80();
}

uint64_t sub_22015C97C()
{
  return sub_220181E50();
}

uint64_t type metadata accessor for SourceGroupIconView(uint64_t a1)
{
  return sub_22015D2B0(a1, (uint64_t *)&unk_267F0A480);
}

uint64_t sub_22015C9CC(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 120);
  uint64_t v3 = *(void *)(a1 + 128);
  char v4 = *(unsigned char *)(a1 + 136);
  sub_22014F790(*(void *)(a1 + 24), *(void *)(a1 + 32), *(unsigned char *)(a1 + 40));
  swift_bridgeObjectRetain();
  swift_retain();
  sub_22014F790(v2, v3, v4);
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

uint64_t sub_22015CA60(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 120);
  uint64_t v3 = *(void *)(a1 + 128);
  char v4 = *(unsigned char *)(a1 + 136);
  sub_22014F7E4(*(void *)(a1 + 24), *(void *)(a1 + 32), *(unsigned char *)(a1 + 40));
  swift_release();
  swift_bridgeObjectRelease();
  sub_22014F7E4(v2, v3, v4);
  swift_release();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_22015CAF4@<X0>(uint64_t a1@<X8>)
{
  uint64_t result = sub_220181E90();
  *(void *)a1 = result;
  *(unsigned char *)(a1 + 8) = v3 & 1;
  return result;
}

uint64_t sub_22015CB28()
{
  return sub_220181EA0();
}

uint64_t *sub_22015CB58(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  uint64_t v5 = *a2;
  *a1 = *a2;
  if ((v4 & 0x20000) != 0)
  {
    a1 = (uint64_t *)(v5 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    a1[1] = a2[1];
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (uint64_t *)((char *)a1 + v8);
    unint64_t v10 = (uint64_t *)((char *)a2 + v8);
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_267F0AAA0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v11 = sub_220181D10();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
    }
    else
    {
      void *v9 = *v10;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    *(uint64_t *)((char *)a1 + *(int *)(a3 + 24)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 24));
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_22015CC90(uint64_t a1, uint64_t a2)
{
  swift_release();
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F0AAA0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = sub_220181D10();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  }
  else
  {
    swift_release();
  }

  return swift_bridgeObjectRelease();
}

void *sub_22015CD48(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)((char *)a1 + v7);
  uint64_t v9 = (void *)((char *)a2 + v7);
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F0AAA0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v10 = sub_220181D10();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  }
  else
  {
    *uint64_t v8 = *v9;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  *(void *)((char *)a1 + *(int *)(a3 + 24)) = *(void *)((char *)a2 + *(int *)(a3 + 24));
  swift_bridgeObjectRetain();
  return a1;
}

void *sub_22015CE30(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  if (a1 != a2)
  {
    uint64_t v6 = *(int *)(a3 + 20);
    uint64_t v7 = (void *)((char *)a1 + v6);
    uint64_t v8 = (void *)((char *)a2 + v6);
    sub_22014ACAC((uint64_t)a1 + v6, &qword_267F0AAA0);
    __swift_instantiateConcreteTypeFromMangledName(&qword_267F0AAA0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v9 = sub_220181D10();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v9 - 8) + 16))(v7, v8, v9);
    }
    else
    {
      *uint64_t v7 = *v8;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  *(void *)((char *)a1 + *(int *)(a3 + 24)) = *(void *)((char *)a2 + *(int *)(a3 + 24));
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *sub_22015CF54(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_release();
  a1[1] = a2[1];
  if (a1 != a2)
  {
    uint64_t v6 = *(int *)(a3 + 20);
    uint64_t v7 = (char *)a1 + v6;
    uint64_t v8 = (char *)a2 + v6;
    sub_22014ACAC((uint64_t)a1 + v6, &qword_267F0AAA0);
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F0AAA0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v10 = sub_220181D10();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 32))(v7, v8, v10);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v7, v8, *(void *)(*(void *)(v9 - 8) + 64));
    }
  }
  *(void *)((char *)a1 + *(int *)(a3 + 24)) = *(void *)((char *)a2 + *(int *)(a3 + 24));
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_22015D074(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_22015D088);
}

uint64_t sub_22015D088(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F0A068);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1 + *(int *)(a3 + 20);
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v10(v9, a2, v8);
  }
  else
  {
    unint64_t v12 = *(void *)(a1 + *(int *)(a3 + 24));
    if (v12 >= 0xFFFFFFFF) {
      LODWORD(v12) = -1;
    }
    return (v12 + 1);
  }
}

uint64_t sub_22015D150(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_22015D164);
}

uint64_t sub_22015D164(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = __swift_instantiateConcreteTypeFromMangledName(&qword_267F0A068);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = result;
    uint64_t v11 = a1 + *(int *)(a4 + 20);
    unint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v12(v11, a2, a2, v10);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 24)) = (a2 - 1);
  }
  return result;
}

void sub_22015D228()
{
}

uint64_t sub_22015D238()
{
  return sub_22014B510(&qword_267F0A490, &qword_267F0A498);
}

uint64_t sub_22015D274()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t type metadata accessor for SourceIconContainerView(uint64_t a1)
{
  return sub_22015D2B0(a1, (uint64_t *)&unk_267F0A508);
}

uint64_t sub_22015D2B0(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t *sub_22015D2E8(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  uint64_t v5 = *a2;
  *a1 = *a2;
  if ((v4 & 0x20000) != 0)
  {
    a1 = (uint64_t *)(v5 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    a1[1] = a2[1];
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (uint64_t *)((char *)a1 + v8);
    uint64_t v10 = (uint64_t *)((char *)a2 + v8);
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_267F0AAA0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v11 = sub_220181D10();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
    }
    else
    {
      void *v9 = *v10;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v12 = *(int *)(a3 + 24);
    uint64_t v13 = *(void **)((char *)a2 + v12);
    *(uint64_t *)((char *)a1 + v12) = (uint64_t)v13;
    id v14 = v13;
  }
  return a1;
}

void sub_22015D420(uint64_t a1, uint64_t a2)
{
  swift_release();
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F0AAA0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = sub_220181D10();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  }
  else
  {
    swift_release();
  }
  uint64_t v6 = *(void **)(a1 + *(int *)(a2 + 24));
}

void *sub_22015D4D8(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)((char *)a1 + v7);
  uint64_t v9 = (void *)((char *)a2 + v7);
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F0AAA0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v10 = sub_220181D10();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  }
  else
  {
    *uint64_t v8 = *v9;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v11 = *(int *)(a3 + 24);
  uint64_t v12 = *(void **)((char *)a2 + v11);
  *(void *)((char *)a1 + v11) = v12;
  id v13 = v12;
  return a1;
}

void *sub_22015D5C0(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  if (a1 != a2)
  {
    uint64_t v6 = *(int *)(a3 + 20);
    uint64_t v7 = (void *)((char *)a1 + v6);
    uint64_t v8 = (void *)((char *)a2 + v6);
    sub_22014ACAC((uint64_t)a1 + v6, &qword_267F0AAA0);
    __swift_instantiateConcreteTypeFromMangledName(&qword_267F0AAA0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v9 = sub_220181D10();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v9 - 8) + 16))(v7, v8, v9);
    }
    else
    {
      *uint64_t v7 = *v8;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v10 = *(int *)(a3 + 24);
  uint64_t v11 = *(void **)((char *)a1 + v10);
  uint64_t v12 = *(void **)((char *)a2 + v10);
  *(void *)((char *)a1 + v10) = v12;
  id v13 = v12;

  return a1;
}

_OWORD *sub_22015D6DC(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F0AAA0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v10 = sub_220181D10();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 32))(v7, v8, v10);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v7, v8, *(void *)(*(void *)(v9 - 8) + 64));
  }
  *(void *)((char *)a1 + *(int *)(a3 + 24)) = *(void *)((char *)a2 + *(int *)(a3 + 24));
  return a1;
}

void *sub_22015D7CC(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_release();
  a1[1] = a2[1];
  if (a1 != a2)
  {
    uint64_t v6 = *(int *)(a3 + 20);
    uint64_t v7 = (char *)a1 + v6;
    uint64_t v8 = (char *)a2 + v6;
    sub_22014ACAC((uint64_t)a1 + v6, &qword_267F0AAA0);
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F0AAA0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v10 = sub_220181D10();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 32))(v7, v8, v10);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v7, v8, *(void *)(*(void *)(v9 - 8) + 64));
    }
  }
  uint64_t v11 = *(int *)(a3 + 24);
  uint64_t v12 = *(void **)((char *)a1 + v11);
  *(void *)((char *)a1 + v11) = *(void *)((char *)a2 + v11);

  return a1;
}

uint64_t sub_22015D8EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_22015D900);
}

uint64_t sub_22015D900(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 2147483646)
  {
    uint64_t v4 = *a1;
    if ((unint64_t)*a1 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    int v5 = v4 - 1;
    if (v5 < 0) {
      int v5 = -1;
    }
    return (v5 + 1);
  }
  else
  {
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F0A068);
    uint64_t v10 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v9 - 8) + 48);
    uint64_t v11 = v9;
    uint64_t v12 = (char *)a1 + *(int *)(a3 + 20);
    return v10(v12, a2, v11);
  }
}

uint64_t sub_22015D9C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_22015D9D4);
}

void *sub_22015D9D4(void *result, uint64_t a2, int a3, uint64_t a4)
{
  int v5 = result;
  if (a3 == 2147483646)
  {
    *uint64_t result = a2;
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F0A068);
    uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = (char *)v5 + *(int *)(a4 + 20);
    return (void *)v8(v10, a2, a2, v9);
  }
  return result;
}

void sub_22015DA80()
{
}

void sub_22015DA8C()
{
  sub_22014E954();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

uint64_t sub_22015DB28()
{
  return sub_22015C344(&qword_267F0A518, &qword_267F0A4B0, (void (*)(void))sub_22015DB6C);
}

unint64_t sub_22015DB6C()
{
  unint64_t result = qword_267F0A520;
  if (!qword_267F0A520)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267F0A4A8);
    sub_22014B510(&qword_267F0A528, &qword_267F0A4A0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F0A520);
  }
  return result;
}

uint64_t sub_22015DC0C()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_22015DC28()
{
  unint64_t result = qword_267F0A550;
  if (!qword_267F0A550)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F0A550);
  }
  return result;
}

unint64_t sub_22015DC7C()
{
  unint64_t result = qword_267F0A558;
  if (!qword_267F0A558)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267F0A548);
    sub_220157824(&qword_267F0A560, MEMORY[0x263F19048]);
    sub_22014B510(&qword_267F0A568, &qword_267F0A570);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F0A558);
  }
  return result;
}

unint64_t sub_22015DD58()
{
  unint64_t result = qword_267F0A578;
  if (!qword_267F0A578)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267F0A538);
    sub_22015DDF8(&qword_267F0A580, &qword_267F0A530, (void (*)(void))sub_22015DE70);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F0A578);
  }
  return result;
}

uint64_t sub_22015DDF8(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_22015DE70()
{
  unint64_t result = qword_267F0A588;
  if (!qword_267F0A588)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267F0A590);
    sub_22015DC28();
    sub_22015DC7C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F0A588);
  }
  return result;
}

uint64_t sub_22015DEEC()
{
  if (qword_267F09C70 != -1) {
    swift_once();
  }
  id v0 = (id)qword_267F0C100;
  uint64_t v1 = (void *)sub_220182450();
  uint64_t v2 = (void *)sub_220182450();
  id v3 = objc_msgSend(v0, sel_localizedStringForKey_value_table_, v1, 0, v2);

  uint64_t v4 = sub_220182460();
  return v4;
}

uint64_t sub_22015DFE4()
{
  if (qword_267F09D60 != -1) {
    swift_once();
  }
  uint64_t v0 = qword_267F0C238;
  int64_t v1 = *(void *)(qword_267F0C238 + 16);
  uint64_t v2 = MEMORY[0x263F8EE78];
  if (v1)
  {
    uint64_t v11 = MEMORY[0x263F8EE78];
    swift_bridgeObjectRetain();
    sub_22015FB80(0, v1, 0);
    uint64_t v2 = v11;
    id v3 = (_OWORD *)(v0 + 48);
    do
    {
      uint64_t v5 = *((void *)v3 - 2);
      uint64_t v4 = *((void *)v3 - 1);
      long long v10 = *v3;
      unint64_t v6 = *(void *)(v11 + 16);
      unint64_t v7 = *(void *)(v11 + 24);
      swift_bridgeObjectRetain();
      if (v6 >= v7 >> 1) {
        sub_22015FB80(v7 > 1, v6 + 1, 1);
      }
      id v3 = (_OWORD *)((char *)v3 + 40);
      *(void *)(v11 + 16) = v6 + 1;
      uint64_t v8 = v11 + 32 * v6;
      *(void *)(v8 + 32) = v5;
      *(void *)(v8 + 40) = v4;
      *(_OWORD *)(v8 + 48) = v10;
      --v1;
    }
    while (v1);
    swift_bridgeObjectRelease();
  }
  return v2;
}

uint64_t sub_22015E110@<X0>(uint64_t a1@<X8>)
{
  uint64_t v22 = a1;
  uint64_t v2 = type metadata accessor for NotificationSummarizationOnboardingIntroView();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F0A5C0);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F0A5C8);
  uint64_t v10 = v9 - 8;
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)uint64_t v8 = sub_220181F60();
  *((void *)v8 + 1) = 0;
  v8[16] = 0;
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F0A5D0);
  sub_22015E38C(v1, &v8[*(int *)(v13 + 44)]);
  sub_220160D5C(v1, (uint64_t)v5);
  unint64_t v14 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v15 = swift_allocObject();
  sub_220160DC4((uint64_t)v5, v15 + v14);
  sub_22014FA88((uint64_t)v8, (uint64_t)v12, &qword_267F0A5C0);
  uint64_t v16 = (uint64_t (**)())&v12[*(int *)(v10 + 44)];
  *uint64_t v16 = sub_220160E28;
  v16[1] = (uint64_t (*)())v15;
  v16[2] = 0;
  v16[3] = 0;
  sub_22014ACAC((uint64_t)v8, &qword_267F0A5C0);
  sub_220160D5C(v1, (uint64_t)v5);
  uint64_t v17 = swift_allocObject();
  sub_220160DC4((uint64_t)v5, v17 + v14);
  uint64_t v18 = v22;
  sub_22014FA88((uint64_t)v12, v22, &qword_267F0A5C8);
  uint64_t v19 = (void *)(v18 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267F0A5D8) + 36));
  void *v19 = 0;
  v19[1] = 0;
  _OWORD v19[2] = sub_220160E34;
  id v19[3] = v17;
  return sub_22014ACAC((uint64_t)v12, &qword_267F0A5C8);
}

uint64_t sub_22015E38C@<X0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v120 = a2;
  uint64_t v3 = sub_220181F40();
  uint64_t v114 = *(void *)(v3 - 8);
  uint64_t v115 = v3;
  MEMORY[0x270FA5388](v3);
  uint64_t v113 = (char *)v104 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F0A5E0);
  uint64_t v117 = *(void *)(v5 - 8);
  uint64_t v118 = v5;
  uint64_t v6 = MEMORY[0x270FA5388](v5);
  uint64_t v111 = (char *)v104 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  long long v116 = (char *)v104 - v8;
  uint64_t v9 = type metadata accessor for NotificationSummarizationOnboardingIntroView();
  v104[0] = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  v104[1] = v10;
  uint64_t v105 = (uint64_t)v104 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F0A5E8);
  uint64_t v107 = *(void *)(v11 - 8);
  uint64_t v108 = v11;
  MEMORY[0x270FA5388](v11);
  uint64_t v106 = (char *)v104 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v109 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F0A5F0);
  MEMORY[0x270FA5388](v109);
  uint64_t v112 = (char *)v104 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F0A5F8);
  uint64_t v121 = *(void *)(v14 - 8);
  uint64_t v122 = v14;
  MEMORY[0x270FA5388](v14);
  uint64_t v110 = (uint64_t)v104 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F0A600);
  uint64_t v17 = MEMORY[0x270FA5388](v16 - 8);
  uint64_t v126 = (uint64_t)v104 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v17);
  uint64_t v125 = (char *)v104 - v19;
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F0A608);
  MEMORY[0x270FA5388](v20 - 8);
  uint64_t v22 = (char *)v104 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v119 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F0A610);
  uint64_t v23 = MEMORY[0x270FA5388](v119);
  uint64_t v124 = (uint64_t)v104 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = MEMORY[0x270FA5388](v23);
  uint64_t v27 = (char *)v104 - v26;
  MEMORY[0x270FA5388](v25);
  uint64_t v123 = (uint64_t)v104 - v28;
  uint64_t v29 = sub_220181D10();
  uint64_t v30 = *(void *)(v29 - 8);
  uint64_t v31 = MEMORY[0x270FA5388](v29);
  uint64_t v33 = (char *)v104 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v31);
  uint64_t v35 = (char *)v104 - v34;
  sub_22014F114((uint64_t)v104 - v34);
  (*(void (**)(char *, void, uint64_t))(v30 + 104))(v33, *MEMORY[0x263F184F8], v29);
  char v36 = sub_220181D00();
  id v37 = *(void (**)(char *, uint64_t))(v30 + 8);
  v37(v33, v29);
  v37(v35, v29);
  if (v36)
  {
    sub_22015EF1C(1, (uint64_t)&v139);
    sub_22016129C((uint64_t)&v139);
  }
  else
  {
    sub_22015EF1C(0, (uint64_t)&v139);
    sub_220160EB0((uint64_t)&v139);
  }
  sub_22014B470((uint64_t)&v139, (uint64_t)v137, &qword_267F0A618);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F0A620);
  sub_220160EBC();
  sub_220181FF0();
  *(void *)uint64_t v22 = sub_220181F20();
  *((void *)v22 + 1) = 0xC024000000000000;
  v22[16] = 0;
  uint64_t v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F0A658);
  sub_22015F450((uint64_t)&v22[*(int *)(v38 + 44)]);
  char v39 = sub_220182080();
  sub_220181CE0();
  uint64_t v41 = v40;
  uint64_t v43 = v42;
  uint64_t v45 = v44;
  uint64_t v47 = v46;
  sub_22014FA88((uint64_t)v22, (uint64_t)v27, &qword_267F0A608);
  uint64_t v48 = &v27[*(int *)(v119 + 36)];
  *uint64_t v48 = v39;
  *((void *)v48 + 1) = v41;
  *((void *)v48 + 2) = v43;
  *((void *)v48 + 3) = v45;
  *((void *)v48 + 4) = v47;
  v48[40] = 0;
  sub_22014ACAC((uint64_t)v22, &qword_267F0A608);
  uint64_t v49 = v123;
  sub_22014B470((uint64_t)v27, v123, &qword_267F0A610);
  *((void *)&v140 + 1) = &type metadata for NotificationsUIFeatureFlags;
  *(void *)&long long v141 = sub_220160FDC();
  uint64_t v50 = swift_allocObject();
  *(void *)&long long v139 = v50;
  *(void *)(v50 + 16) = "NotificationsUI";
  *(void *)(v50 + 24) = 15;
  *(unsigned char *)(v50 + 32) = 2;
  *(void *)(v50 + 40) = "GreymatterOnboardingWithAppCategorization";
  *(void *)(v50 + 48) = 41;
  *(unsigned char *)(v50 + 56) = 2;
  char v51 = sub_220181C40();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)&v139);
  uint64_t v52 = (uint64_t)v125;
  if (v51)
  {
    uint64_t v53 = 1;
    uint64_t v54 = v122;
  }
  else
  {
    uint64_t v55 = v105;
    sub_220160D5C(a1, v105);
    unint64_t v56 = (*(unsigned __int8 *)(v104[0] + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v104[0] + 80);
    uint64_t v57 = swift_allocObject();
    sub_220160DC4(v55, v57 + v56);
    uint64_t v58 = v49;
    long long v59 = v106;
    sub_2201822D0();
    uint64_t v60 = v113;
    sub_220181F30();
    sub_22014B510(&qword_267F0A668, &qword_267F0A5E8);
    sub_220161C18(&qword_267F0A670, MEMORY[0x263F197A8]);
    long long v61 = v111;
    uint64_t v62 = v108;
    uint64_t v63 = v115;
    sub_220182160();
    (*(void (**)(char *, uint64_t))(v114 + 8))(v60, v63);
    uint64_t v65 = v116;
    uint64_t v64 = v117;
    uint64_t v66 = v118;
    (*(void (**)(char *, char *, uint64_t))(v117 + 32))(v116, v61, v118);
    uint64_t v67 = v59;
    uint64_t v49 = v58;
    (*(void (**)(char *, uint64_t))(v107 + 8))(v67, v62);
    char v68 = sub_220182080();
    sub_220181CE0();
    uint64_t v70 = v69;
    uint64_t v72 = v71;
    uint64_t v74 = v73;
    uint64_t v76 = v75;
    uint64_t v77 = (uint64_t)v112;
    (*(void (**)(char *, char *, uint64_t))(v64 + 16))(v112, v65, v66);
    uint64_t v78 = v77 + *(int *)(v109 + 36);
    *(unsigned char *)uint64_t v78 = v68;
    *(void *)(v78 + 8) = v70;
    *(void *)(v78 + 16) = v72;
    *(void *)(v78 + 24) = v74;
    *(void *)(v78 + 32) = v76;
    *(unsigned char *)(v78 + 40) = 0;
    (*(void (**)(char *, uint64_t))(v64 + 8))(v65, v66);
    char v79 = sub_220182090();
    sub_220181CE0();
    uint64_t v81 = v80;
    uint64_t v83 = v82;
    uint64_t v85 = v84;
    uint64_t v87 = v86;
    uint64_t v88 = v110;
    sub_22014FA88(v77, v110, &qword_267F0A5F0);
    uint64_t v54 = v122;
    uint64_t v89 = v88 + *(int *)(v122 + 36);
    *(unsigned char *)uint64_t v89 = v79;
    *(void *)(v89 + 8) = v81;
    *(void *)(v89 + 16) = v83;
    *(void *)(v89 + 24) = v85;
    *(void *)(v89 + 32) = v87;
    *(unsigned char *)(v89 + 40) = 0;
    sub_22014ACAC(v77, &qword_267F0A5F0);
    sub_22014B470(v88, v52, &qword_267F0A5F8);
    uint64_t v53 = 0;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v121 + 56))(v52, v53, 1, v54);
  long long v135 = v148[10];
  v136[0] = v149[0];
  *(_OWORD *)((char *)v136 + 10) = *(_OWORD *)((char *)v149 + 10);
  long long v131 = v148[6];
  long long v132 = v148[7];
  long long v133 = v148[8];
  long long v134 = v148[9];
  long long v127 = v148[2];
  long long v128 = v148[3];
  long long v129 = v148[4];
  long long v130 = v148[5];
  uint64_t v90 = v124;
  sub_22014FA88(v49, v124, &qword_267F0A610);
  uint64_t v91 = v126;
  sub_22014FA88(v52, v126, &qword_267F0A600);
  long long v92 = v136[0];
  v137[8] = v135;
  v138[0] = v136[0];
  *(_OWORD *)((char *)v138 + 10) = *(_OWORD *)((char *)v136 + 10);
  long long v93 = v131;
  long long v94 = v132;
  v137[4] = v131;
  v137[5] = v132;
  long long v96 = v133;
  long long v95 = v134;
  v137[6] = v133;
  v137[7] = v134;
  long long v97 = v127;
  long long v98 = v128;
  v137[0] = v127;
  v137[1] = v128;
  long long v100 = v129;
  long long v99 = v130;
  v137[2] = v129;
  v137[3] = v130;
  uint64_t v101 = v120;
  v120[8] = v135;
  v101[9] = v92;
  *(_OWORD *)((char *)v101 + 154) = *(_OWORD *)((char *)v136 + 10);
  v101[4] = v93;
  v101[5] = v94;
  v101[6] = v96;
  v101[7] = v95;
  *uint64_t v101 = v97;
  v101[1] = v98;
  v101[2] = v100;
  v101[3] = v99;
  uint64_t v102 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F0A678);
  sub_22014FA88(v90, (uint64_t)v101 + *(int *)(v102 + 48), &qword_267F0A610);
  sub_22014FA88(v91, (uint64_t)v101 + *(int *)(v102 + 64), &qword_267F0A600);
  sub_220161168((uint64_t)v137, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, _WORD))sub_2201610B0);
  sub_22014ACAC(v52, &qword_267F0A600);
  sub_22014ACAC(v49, &qword_267F0A610);
  sub_22014ACAC(v91, &qword_267F0A600);
  sub_22014ACAC(v90, &qword_267F0A610);
  long long v147 = v135;
  v148[0] = v136[0];
  *(_OWORD *)((char *)v148 + 10) = *(_OWORD *)((char *)v136 + 10);
  long long v143 = v131;
  long long v144 = v132;
  long long v145 = v133;
  long long v146 = v134;
  long long v139 = v127;
  long long v140 = v128;
  long long v141 = v129;
  long long v142 = v130;
  return sub_220161168((uint64_t)&v139, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, _WORD))sub_2201611E4);
}

double sub_22015EF1C@<D0>(int a1@<W0>, uint64_t a2@<X8>)
{
  int v44 = a1;
  uint64_t v45 = sub_220181D10();
  uint64_t v4 = *(void *)(v45 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v45);
  uint64_t v7 = &v35[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v5);
  uint64_t v9 = &v35[-v8];
  uint64_t v10 = type metadata accessor for NotificationSummarizationOnboardingIntroView();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(void *)(v11 + 64);
  MEMORY[0x270FA5388](v10);
  if (qword_267F09C70 != -1) {
    swift_once();
  }
  uint64_t v13 = (uint64_t *)(v2 + *(int *)(v10 + 32));
  uint64_t v15 = *v13;
  uint64_t v14 = v13[1];
  uint64_t v53 = v15;
  uint64_t v54 = v14;
  id v43 = (id)qword_267F0C100;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F0A6F0);
  sub_2201822C0();
  uint64_t v41 = v55;
  long long v42 = v56;
  sub_220160D5C(v2, (uint64_t)&v35[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)]);
  unint64_t v16 = (*(unsigned __int8 *)(v11 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  uint64_t v17 = swift_allocObject();
  sub_220160DC4((uint64_t)&v35[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)], v17 + v16);
  uint64_t v18 = swift_allocObject();
  *(void *)(v18 + 16) = sub_220161DD0;
  *(void *)(v18 + 24) = v17;
  sub_220182350();
  sub_220181D70();
  uint64_t v37 = v55;
  int v36 = v56;
  char v19 = v57;
  uint64_t v40 = v58;
  uint64_t v38 = *((void *)&v56 + 1);
  uint64_t v39 = v59;
  sub_22014F114((uint64_t)v9);
  id v20 = objc_msgSend(self, sel_currentDevice);
  id v21 = objc_msgSend(v20, sel_userInterfaceIdiom);

  if (!v21)
  {
    uint64_t v22 = v45;
    if (qword_267F09D30 != -1) {
      swift_once();
    }
    uint64_t v24 = *(void (**)(unsigned char *, uint64_t))(v4 + 8);
    goto LABEL_10;
  }
  uint64_t v22 = v45;
  (*(void (**)(unsigned char *, void, uint64_t))(v4 + 104))(v7, *MEMORY[0x263F184F8], v45);
  char v23 = sub_220181D00();
  uint64_t v24 = *(void (**)(unsigned char *, uint64_t))(v4 + 8);
  v24(v7, v22);
  if (v23)
  {
    if (qword_267F09D30 != -1) {
      swift_once();
    }
LABEL_10:
    uint64_t v25 = &qword_267F0C1F0;
    goto LABEL_14;
  }
  if (qword_267F09D28 != -1) {
    swift_once();
  }
  uint64_t v25 = &qword_267F0C1E8;
LABEL_14:
  if (v44) {
    unint64_t v26 = 0x80000002201891C0;
  }
  else {
    unint64_t v26 = 0x80000002201891A0;
  }
  uint64_t v27 = *v25;
  char v50 = 0;
  if (v44) {
    unint64_t v28 = 0xD00000000000001ELL;
  }
  else {
    unint64_t v28 = 0xD00000000000001FLL;
  }
  char v49 = v36;
  char v47 = v19;
  swift_retain();
  v24(v9, v22);
  char v29 = sub_220182070();
  char v30 = v50;
  char v31 = v49;
  char v32 = v47;
  *(void *)a2 = v28;
  *(void *)(a2 + 8) = v26;
  *(void *)(a2 + 24) = 0;
  *(void *)(a2 + 32) = 0;
  *(void *)(a2 + 16) = v43;
  *(_WORD *)(a2 + 40) = 257;
  *(unsigned char *)(a2 + 42) = 0;
  *(_DWORD *)(a2 + 43) = v51;
  *(unsigned char *)(a2 + 47) = v52;
  *(void *)(a2 + 48) = nullsub_1;
  *(void *)(a2 + 56) = 0;
  *(void *)(a2 + 64) = v41;
  double result = *(double *)&v42;
  *(_OWORD *)(a2 + 72) = v42;
  *(void *)(a2 + 88) = sub_220161E50;
  *(void *)(a2 + 96) = v18;
  *(unsigned char *)(a2 + 104) = v30;
  *(_DWORD *)(a2 + 108) = *(_DWORD *)((char *)&v53 + 3);
  *(_DWORD *)(a2 + 105) = v53;
  *(void *)(a2 + 112) = v37;
  *(unsigned char *)(a2 + 120) = v31;
  *(_DWORD *)(a2 + 124) = *(_DWORD *)&v48[3];
  *(_DWORD *)(a2 + 121) = *(_DWORD *)v48;
  *(void *)(a2 + 128) = v38;
  *(unsigned char *)(a2 + 136) = v32;
  *(_DWORD *)(a2 + 137) = *(_DWORD *)v46;
  *(_DWORD *)(a2 + 140) = *(_DWORD *)&v46[3];
  uint64_t v34 = v39;
  *(void *)(a2 + 144) = v40;
  *(void *)(a2 + 152) = v34;
  *(void *)(a2 + 160) = v27;
  *(unsigned char *)(a2 + 168) = v29;
  return result;
}

uint64_t sub_22015F450@<X0>(uint64_t a1@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F0A060);
  sub_2201822A0();
  if (v10)
  {
    id v2 = v10;
    uint64_t v3 = swift_bridgeObjectRetain();
    unint64_t v4 = sub_220161894(v3, (uint64_t)v2);
    swift_bridgeObjectRelease();

    sub_22016144C(v4);
    swift_bridgeObjectRelease();
    swift_getKeyPath();
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v2;
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = sub_2201619DC;
    *(void *)(v6 + 24) = v5;
    __swift_instantiateConcreteTypeFromMangledName(&qword_267F0A688);
    __swift_instantiateConcreteTypeFromMangledName(&qword_267F0A690);
    sub_22014B510(&qword_267F0A698, &qword_267F0A688);
    sub_220161A4C(&qword_267F0A6A0, &qword_267F0A690, (void (*)(void))sub_220161AC8);
    sub_220182310();
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F0A680);
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(a1, 0, 1, v7);
  }
  else
  {
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F0A680);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(a1, 1, 1, v9);
  }
}

uint64_t sub_22015F69C@<X0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  type metadata accessor for NotificationSourceIconCache();
  sub_220161C18((unint64_t *)&qword_267F0A1E0, (void (*)(uint64_t))type metadata accessor for NotificationSourceIconCache);
  id v7 = a2;
  uint64_t v8 = sub_220181DE0();
  uint64_t v10 = v9;
  uint64_t KeyPath = swift_getKeyPath();
  swift_getKeyPath();
  sub_220161C18((unint64_t *)&qword_267F0A920, (void (*)(uint64_t))type metadata accessor for NotificationSummarizationOnboardingViewModel);
  sub_220181BF0();
  swift_release();
  uint64_t v12 = *(void *)(a3 + OBJC_IVAR____TtC20UserNotificationsKit44NotificationSummarizationOnboardingViewModel__iconCache);
  swift_retain();
  uint64_t v13 = sub_220181CA0();
  if (qword_267F09D38 != -1) {
    swift_once();
  }
  uint64_t v14 = qword_267F0C1F8;
  if (qword_267F09D48 != -1) {
    swift_once();
  }
  uint64_t v15 = qword_267F0C210;
  if (qword_267F09D40 != -1) {
    swift_once();
  }
  *(void *)a4 = v7;
  *(void *)(a4 + 8) = 0x4044000000000000;
  *(void *)(a4 + 16) = v8;
  *(void *)(a4 + 24) = v10;
  *(void *)(a4 + 32) = KeyPath;
  *(unsigned char *)(a4 + 40) = 0;
  *(void *)(a4 + 48) = v13;
  *(void *)(a4 + 56) = v12;
  *(double *)(a4 + 64) = -(double)a1;
  *(void *)(a4 + 72) = v14;
  *(void *)(a4 + 80) = v15;
  *(_OWORD *)(a4 + 88) = xmmword_267F0C200;
  return swift_retain();
}

uint64_t sub_22015F8E4@<X0>(uint64_t a1@<X8>)
{
  if (qword_267F09C70 != -1) {
    swift_once();
  }
  id v2 = (id)qword_267F0C100;
  uint64_t v3 = (void *)sub_220182450();
  unint64_t v4 = (void *)sub_220182450();
  id v5 = objc_msgSend(v2, sel_localizedStringForKey_value_table_, v3, 0, v4);

  sub_220182460();
  sub_22014F7F4();
  uint64_t result = sub_220182120();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v7;
  *(unsigned char *)(a1 + 16) = v8 & 1;
  *(void *)(a1 + 24) = v9;
  return result;
}

uint64_t sub_22015FA14()
{
  type metadata accessor for NotificationSummarizationOnboardingIntroView();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F0A6F0);
  sub_2201822A0();
  uint64_t v0 = *(void *)(v2 + 16);
  uint64_t result = swift_bridgeObjectRelease();
  if (v0 == 3)
  {
    swift_retain();
    swift_bridgeObjectRetain();
    uint64_t result = sub_2201822A0();
    if (*(void *)(v2 + 16))
    {
      sub_220161E58(0, 1);
      sub_2201822B0();
      swift_release();
      return swift_bridgeObjectRelease();
    }
    else
    {
      __break(1u);
    }
  }
  return result;
}

uint64_t sub_22015FAFC()
{
  return sub_22015DEEC();
}

uint64_t sub_22015FB14()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F0A060);
  sub_2201822A0();
  return v1;
}

uint64_t sub_22015FB60(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_22015FBE0(a1, a2, a3, *v3);
  void *v3 = (char *)result;
  return result;
}

uint64_t sub_22015FB80(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_22015FD4C(a1, a2, a3, *v3);
  void *v3 = (char *)result;
  return result;
}

uint64_t sub_22015FBA0(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_22015FEB8(a1, a2, a3, *v3);
  void *v3 = (char *)result;
  return result;
}

uint64_t sub_22015FBC0(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_220160018(a1, a2, a3, *v3);
  void *v3 = (char *)result;
  return result;
}

uint64_t sub_22015FBE0(char a1, int64_t a2, char a3, char *a4)
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
        goto LABEL_32;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_267F0A598);
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
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[16 * v8] || v13 >= &v14[16 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_2201828B0();
  __break(1u);
  return result;
}

uint64_t sub_22015FD4C(char a1, int64_t a2, char a3, char *a4)
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
        goto LABEL_32;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_267F0AA30);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 1;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 5);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[32 * v8]) {
      memmove(v13, v14, 32 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[32 * v8] || v13 >= &v14[32 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_2201828B0();
  __break(1u);
  return result;
}

uint64_t sub_22015FEB8(char a1, int64_t a2, char a3, char *a4)
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
        goto LABEL_32;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_267F0A9C0);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 25;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 3);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[8 * v8]) {
      memmove(v13, v14, 8 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[8 * v8] || v13 >= &v14[8 * v8])
  {
    memcpy(v13, v14, 8 * v8);
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_2201828B0();
  __break(1u);
  return result;
}

uint64_t sub_220160018(char a1, int64_t a2, char a3, char *a4)
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
        goto LABEL_32;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_267F0A5A0);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 1;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 5);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[32 * v8]) {
      memmove(v13, v14, 32 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[32 * v8] || v13 >= &v14[32 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_2201828B0();
  __break(1u);
  return result;
}

void *sub_220160188(void *a1, void *a2, uint64_t a3)
{
  unint64_t v4 = a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *a1 = *a2;
    unint64_t v4 = (void *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    if (*a2)
    {
      uint64_t v7 = a2[1];
      *unint64_t v4 = *a2;
      v4[1] = v7;
      swift_retain();
    }
    else
    {
      *(_OWORD *)a1 = *(_OWORD *)a2;
    }
    uint64_t v9 = a2[2];
    if (v9)
    {
      uint64_t v10 = a2[3];
      v4[2] = v9;
      v4[3] = v10;
      swift_retain();
    }
    else
    {
      *((_OWORD *)v4 + 1) = *((_OWORD *)a2 + 1);
    }
    int64_t v11 = (void *)a2[4];
    uint64_t v12 = a2[5];
    v4[4] = v11;
    v4[5] = v12;
    uint64_t v13 = *(int *)(a3 + 28);
    uint64_t v14 = (void *)((char *)v4 + v13);
    uint64_t v15 = (void *)((char *)a2 + v13);
    id v16 = v11;
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_267F0AAA0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v17 = sub_220181D10();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v17 - 8) + 16))(v14, v15, v17);
    }
    else
    {
      *uint64_t v14 = *v15;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v18 = *(int *)(a3 + 32);
    char v19 = (void *)((char *)v4 + v18);
    id v20 = (void *)((char *)a2 + v18);
    uint64_t v21 = v20[1];
    void *v19 = *v20;
    v19[1] = v21;
    swift_bridgeObjectRetain();
  }
  swift_retain();
  return v4;
}

uint64_t sub_22016031C(uint64_t a1, uint64_t a2)
{
  if (*(void *)a1) {
    swift_release();
  }
  if (*(void *)(a1 + 16)) {
    swift_release();
  }

  swift_release();
  uint64_t v4 = a1 + *(int *)(a2 + 28);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F0AAA0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = sub_220181D10();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  }
  else
  {
    swift_release();
  }
  swift_bridgeObjectRelease();

  return swift_release();
}

void *sub_220160408(void *a1, void *a2, uint64_t a3)
{
  if (*a2)
  {
    uint64_t v6 = a2[1];
    *a1 = *a2;
    a1[1] = v6;
    swift_retain();
  }
  else
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
  }
  uint64_t v7 = a2[2];
  if (v7)
  {
    uint64_t v8 = a2[3];
    a1[2] = v7;
    a1[3] = v8;
    swift_retain();
  }
  else
  {
    *((_OWORD *)a1 + 1) = *((_OWORD *)a2 + 1);
  }
  uint64_t v9 = (void *)a2[4];
  uint64_t v10 = a2[5];
  a1[4] = v9;
  a1[5] = v10;
  uint64_t v11 = *(int *)(a3 + 28);
  uint64_t v12 = (void *)((char *)a1 + v11);
  uint64_t v13 = (void *)((char *)a2 + v11);
  id v14 = v9;
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F0AAA0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v15 = sub_220181D10();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v15 - 8) + 16))(v12, v13, v15);
  }
  else
  {
    *uint64_t v12 = *v13;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v16 = *(int *)(a3 + 32);
  uint64_t v17 = (void *)((char *)a1 + v16);
  uint64_t v18 = (void *)((char *)a2 + v16);
  uint64_t v19 = v18[1];
  void *v17 = *v18;
  v17[1] = v19;
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

void *sub_220160550(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = *a2;
  if (*a1)
  {
    if (v6)
    {
      uint64_t v7 = a2[1];
      *a1 = v6;
      a1[1] = v7;
      swift_retain();
      swift_release();
      goto LABEL_8;
    }
    swift_release();
  }
  else if (v6)
  {
    uint64_t v8 = a2[1];
    *a1 = v6;
    a1[1] = v8;
    swift_retain();
    goto LABEL_8;
  }
  *(_OWORD *)a1 = *(_OWORD *)a2;
LABEL_8:
  uint64_t v9 = a2[2];
  if (a1[2])
  {
    if (v9)
    {
      uint64_t v10 = a2[3];
      a1[2] = v9;
      a1[3] = v10;
      swift_retain();
      swift_release();
      goto LABEL_15;
    }
    swift_release();
  }
  else if (v9)
  {
    uint64_t v11 = a2[3];
    a1[2] = v9;
    a1[3] = v11;
    swift_retain();
    goto LABEL_15;
  }
  *((_OWORD *)a1 + 1) = *((_OWORD *)a2 + 1);
LABEL_15:
  uint64_t v12 = (void *)a1[4];
  uint64_t v13 = (void *)a2[4];
  a1[4] = v13;
  id v14 = v13;

  a1[5] = a2[5];
  swift_retain();
  swift_release();
  if (a1 != a2)
  {
    uint64_t v15 = *(int *)(a3 + 28);
    uint64_t v16 = (void *)((char *)a1 + v15);
    uint64_t v17 = (void *)((char *)a2 + v15);
    sub_22014ACAC((uint64_t)a1 + v15, &qword_267F0AAA0);
    __swift_instantiateConcreteTypeFromMangledName(&qword_267F0AAA0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v18 = sub_220181D10();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v18 - 8) + 16))(v16, v17, v18);
    }
    else
    {
      *uint64_t v16 = *v17;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v19 = *(int *)(a3 + 32);
  id v20 = (char *)a1 + v19;
  uint64_t v21 = (char *)a2 + v19;
  *(void *)((char *)a1 + v19) = *(void *)((char *)a2 + v19);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((void *)v20 + 1) = *((void *)v21 + 1);
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_220160744(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)a2)
  {
    uint64_t v6 = *(void *)(a2 + 8);
    *(void *)a1 = *(void *)a2;
    *(void *)(a1 + 8) = v6;
  }
  else
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
  }
  uint64_t v7 = *(void *)(a2 + 16);
  if (v7)
  {
    uint64_t v8 = *(void *)(a2 + 24);
    *(void *)(a1 + 16) = v7;
    *(void *)(a1 + 24) = v8;
  }
  else
  {
    *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  }
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  uint64_t v9 = *(int *)(a3 + 28);
  uint64_t v10 = (void *)(a1 + v9);
  uint64_t v11 = (const void *)(a2 + v9);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F0AAA0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v13 = sub_220181D10();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v13 - 8) + 32))(v10, v11, v13);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v10, v11, *(void *)(*(void *)(v12 - 8) + 64));
  }
  *(_OWORD *)(a1 + *(int *)(a3 + 32)) = *(_OWORD *)(a2 + *(int *)(a3 + 32));
  return a1;
}

void *sub_220160874(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = *a2;
  if (*a1)
  {
    if (v6)
    {
      uint64_t v7 = a2[1];
      *a1 = v6;
      a1[1] = v7;
      swift_release();
      goto LABEL_8;
    }
    swift_release();
  }
  else if (v6)
  {
    uint64_t v8 = a2[1];
    *a1 = v6;
    a1[1] = v8;
    goto LABEL_8;
  }
  *(_OWORD *)a1 = *(_OWORD *)a2;
LABEL_8:
  uint64_t v9 = a2[2];
  if (a1[2])
  {
    if (v9)
    {
      uint64_t v10 = a2[3];
      a1[2] = v9;
      a1[3] = v10;
      swift_release();
      goto LABEL_15;
    }
    swift_release();
  }
  else if (v9)
  {
    uint64_t v11 = a2[3];
    a1[2] = v9;
    a1[3] = v11;
    goto LABEL_15;
  }
  *((_OWORD *)a1 + 1) = *((_OWORD *)a2 + 1);
LABEL_15:
  uint64_t v12 = (void *)a1[4];
  a1[4] = a2[4];

  a1[5] = a2[5];
  swift_release();
  if (a1 != a2)
  {
    uint64_t v13 = *(int *)(a3 + 28);
    id v14 = (char *)a1 + v13;
    uint64_t v15 = (char *)a2 + v13;
    sub_22014ACAC((uint64_t)a1 + v13, &qword_267F0AAA0);
    uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F0AAA0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v17 = sub_220181D10();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v17 - 8) + 32))(v14, v15, v17);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v14, v15, *(void *)(*(void *)(v16 - 8) + 64));
    }
  }
  uint64_t v18 = *(int *)(a3 + 32);
  uint64_t v19 = (char *)a1 + v18;
  id v20 = (void *)((char *)a2 + v18);
  *(void *)((char *)a1 + v18) = *v20;
  swift_bridgeObjectRelease();
  *((void *)v19 + 1) = v20[1];
  swift_release();
  return a1;
}

uint64_t sub_220160A44(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_220160A58);
}

uint64_t sub_220160A58(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F0A068);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1 + *(int *)(a3 + 28);
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v10(v9, a2, v8);
  }
  else
  {
    unint64_t v12 = *(void *)(a1 + *(int *)(a3 + 32));
    if (v12 >= 0xFFFFFFFF) {
      LODWORD(v12) = -1;
    }
    return (v12 + 1);
  }
}

uint64_t sub_220160B20(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_220160B34);
}

uint64_t sub_220160B34(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = __swift_instantiateConcreteTypeFromMangledName(&qword_267F0A068);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = result;
    uint64_t v11 = a1 + *(int *)(a4 + 28);
    unint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v12(v11, a2, a2, v10);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 32)) = (a2 - 1);
  }
  return result;
}

uint64_t type metadata accessor for NotificationSummarizationOnboardingIntroView()
{
  uint64_t result = qword_267F0A5A8;
  if (!qword_267F0A5A8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_220160C44()
{
  sub_22014E954();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

uint64_t sub_220160CE8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_220160D04(uint64_t a1)
{
  uint64_t result = sub_220161C18(&qword_267F0A5B8, (void (*)(uint64_t))type metadata accessor for NotificationSummarizationOnboardingIntroView);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_220160D5C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for NotificationSummarizationOnboardingIntroView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_220160DC4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for NotificationSummarizationOnboardingIntroView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_220160E28()
{
  return sub_220160E3C(1);
}

uint64_t sub_220160E34()
{
  return sub_220160E3C(0);
}

uint64_t sub_220160E3C(char a1)
{
  uint64_t v3 = type metadata accessor for NotificationSummarizationOnboardingIntroView();
  uint64_t v5 = *(void *)(v3 - 8);
  uint64_t result = v3 - 8;
  uint64_t v6 = *(uint64_t (**)(void))(v1
                                        + ((*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80))
                                        + 16);
  if (v6) {
    return v6(a1 & 1);
  }
  return result;
}

uint64_t sub_220160EB0(uint64_t result)
{
  *(unsigned char *)(result + 169) = 1;
  return result;
}

unint64_t sub_220160EBC()
{
  unint64_t result = qword_267F0A628;
  if (!qword_267F0A628)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267F0A620);
    sub_220161A4C(&qword_267F0A630, &qword_267F0A638, (void (*)(void))sub_220160F88);
    sub_22014B510(&qword_267F0A648, &qword_267F0A650);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F0A628);
  }
  return result;
}

unint64_t sub_220160F88()
{
  unint64_t result = qword_267F0A640;
  if (!qword_267F0A640)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F0A640);
  }
  return result;
}

unint64_t sub_220160FDC()
{
  unint64_t result = qword_267F0A660;
  if (!qword_267F0A660)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F0A660);
  }
  return result;
}

uint64_t sub_220161030()
{
  return MEMORY[0x270FA0238](v0, 64, 7);
}

uint64_t sub_220161044()
{
  uint64_t v1 = type metadata accessor for NotificationSummarizationOnboardingIntroView();
  uint64_t v3 = *(void *)(v1 - 8);
  uint64_t result = v1 - 8;
  uint64_t v4 = (uint64_t (**)(void))(v0
                          + ((*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80)));
  if (*v4) {
    return (*v4)();
  }
  return result;
}

uint64_t sub_2201610B0(uint64_t a1, uint64_t a2, void *a3)
{
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v4 = a3;
  swift_bridgeObjectRetain();
  swift_retain();
  sub_22014AD34();

  return swift_retain();
}

uint64_t sub_220161168(uint64_t a1, void (*a2)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, _WORD))
{
  a2(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72), *(void *)(a1 + 80), *(void *)(a1 + 88), *(void *)(a1 + 96), *(void *)(a1 + 104), *(void *)(a1 + 112), *(void *)(a1 + 120), *(void *)(a1 + 128), *(void *)(a1 + 136), *(void *)(a1 + 144),
    *(void *)(a1 + 152),
    *(void *)(a1 + 160),
    *(_WORD *)(a1 + 168));
  return a1;
}

uint64_t sub_2201611E4(uint64_t a1, uint64_t a2, void *a3)
{
  swift_bridgeObjectRelease();

  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  sub_22014ADAC();

  return swift_release();
}

uint64_t sub_22016129C(uint64_t result)
{
  *(unsigned char *)(result + 169) = 0;
  return result;
}

char *sub_2201612A4(uint64_t a1, int64_t a2, uint64_t a3, double a4, double a5)
{
  if (a1 < 0)
  {
    __break(1u);
    goto LABEL_22;
  }
  uint64_t v7 = *(void **)v5;
  int64_t v8 = *(void *)(*(void *)v5 + 16);
  if (v8 < a2)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  uint64_t v10 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  uint64_t v11 = 1 - v10;
  if (__OFSUB__(1, v10))
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  int64_t v12 = v8 + v11;
  if (__OFADD__(v8, v11))
  {
LABEL_25:
    __break(1u);
LABEL_26:
    __break(1u);
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  char isUniquelyReferenced_nonNull_native = (void *)swift_isUniquelyReferenced_nonNull_native();
  if (!isUniquelyReferenced_nonNull_native || v12 > v7[3] >> 1)
  {
    if (v8 <= v12) {
      int64_t v17 = v8 + v11;
    }
    else {
      int64_t v17 = v8;
    }
    uint64_t v7 = sub_22016BF18(isUniquelyReferenced_nonNull_native, v17, 1, v7);
  }
  uint64_t v18 = v7 + 4;
  uint64_t v19 = &v7[3 * a1 + 4];
  uint64_t result = (char *)swift_arrayDestroy();
  if (!v11) {
    goto LABEL_20;
  }
  uint64_t v21 = v7[2];
  BOOL v22 = __OFSUB__(v21, a2);
  uint64_t v23 = v21 - a2;
  if (v22) {
    goto LABEL_26;
  }
  if ((v23 & 0x8000000000000000) == 0)
  {
    uint64_t result = (char *)(v19 + 3);
    uint64_t v24 = (char *)&v18[3 * a2];
    if (v19 + 3 != (void *)v24 || result >= &v24[24 * v23]) {
      uint64_t result = (char *)memmove(result, v24, 24 * v23);
    }
    uint64_t v25 = v7[2];
    BOOL v22 = __OFADD__(v25, v11);
    uint64_t v26 = v25 + v11;
    if (!v22)
    {
      v7[2] = v26;
LABEL_20:
      void *v19 = a3;
      uint64_t v27 = (double *)&v18[3 * a1];
      v27[1] = a4;
      v27[2] = a5;
      *(void *)uint64_t v5 = v7;
      return result;
    }
    goto LABEL_27;
  }
LABEL_28:
  uint64_t result = (char *)sub_2201828B0();
  __break(1u);
  return result;
}

uint64_t sub_22016144C(unint64_t a1)
{
  if (a1 >> 62) {
    goto LABEL_52;
  }
  uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t result = swift_bridgeObjectRetain();
  if (v2)
  {
    while (1)
    {
      if (v2 < 1)
      {
        __break(1u);
        goto LABEL_59;
      }
      if ((a1 & 0xC000000000000001) == 0) {
        break;
      }
      uint64_t v4 = 0;
      uint64_t v5 = 0;
      uint64_t v6 = (void *)MEMORY[0x263F8EE78];
      uint64_t v7 = (void *)(MEMORY[0x263F8EE78] + 32);
      while (1)
      {
        uint64_t v8 = MEMORY[0x223C66AB0](v5, a1);
        if (!v4)
        {
          unint64_t v9 = v6[3];
          if ((uint64_t)((v9 >> 1) + 0x4000000000000000) < 0) {
            goto LABEL_50;
          }
          int64_t v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
          if (v10 <= 1) {
            uint64_t v11 = 1;
          }
          else {
            uint64_t v11 = v10;
          }
          __swift_instantiateConcreteTypeFromMangledName(&qword_267F0A6E8);
          int64_t v12 = (void *)swift_allocObject();
          int64_t v13 = _swift_stdlib_malloc_size(v12);
          uint64_t v14 = v13 - 32;
          if (v13 < 32) {
            uint64_t v14 = v13 - 17;
          }
          uint64_t v15 = v14 >> 4;
          v12[2] = v11;
          uint64_t v12[3] = 2 * (v14 >> 4);
          unint64_t v16 = (unint64_t)(v12 + 4);
          uint64_t v17 = v6[3] >> 1;
          if (v6[2])
          {
            if (v12 != v6 || v16 >= (unint64_t)&v6[2 * v17 + 4]) {
              memmove(v12 + 4, v6 + 4, 16 * v17);
            }
            v6[2] = 0;
          }
          uint64_t v7 = (void *)(v16 + 16 * v17);
          uint64_t v4 = (v15 & 0x7FFFFFFFFFFFFFFFLL) - v17;
          swift_release();
          uint64_t v6 = v12;
        }
        BOOL v19 = __OFSUB__(v4--, 1);
        if (v19) {
          break;
        }
        *uint64_t v7 = v5;
        v7[1] = v8;
        v7 += 2;
        if (v2 == ++v5) {
          goto LABEL_47;
        }
      }
      __break(1u);
LABEL_49:
      __break(1u);
LABEL_50:
      __break(1u);
LABEL_51:
      __break(1u);
LABEL_52:
      swift_bridgeObjectRetain();
      uint64_t result = sub_220182870();
      uint64_t v2 = result;
      if (!result) {
        goto LABEL_53;
      }
    }
    uint64_t v4 = 0;
    uint64_t v20 = 0;
    uint64_t v6 = (void *)MEMORY[0x263F8EE78];
    uint64_t v21 = (void *)(MEMORY[0x263F8EE78] + 32);
    do
    {
      BOOL v22 = *(void **)(a1 + 8 * v20 + 32);
      if (v4)
      {
        id v23 = v22;
        BOOL v19 = __OFSUB__(v4--, 1);
        if (v19) {
          goto LABEL_49;
        }
      }
      else
      {
        unint64_t v24 = v6[3];
        if ((uint64_t)((v24 >> 1) + 0x4000000000000000) < 0) {
          goto LABEL_51;
        }
        int64_t v25 = v24 & 0xFFFFFFFFFFFFFFFELL;
        if (v25 <= 1) {
          uint64_t v26 = 1;
        }
        else {
          uint64_t v26 = v25;
        }
        __swift_instantiateConcreteTypeFromMangledName(&qword_267F0A6E8);
        uint64_t v27 = (void *)swift_allocObject();
        int64_t v28 = _swift_stdlib_malloc_size(v27);
        uint64_t v29 = v28 - 32;
        if (v28 < 32) {
          uint64_t v29 = v28 - 17;
        }
        uint64_t v30 = v29 >> 4;
        v27[2] = v26;
        v27[3] = 2 * (v29 >> 4);
        char v31 = v27 + 4;
        uint64_t v32 = v6[3] >> 1;
        uint64_t v21 = &v27[2 * v32 + 4];
        uint64_t v33 = (v30 & 0x7FFFFFFFFFFFFFFFLL) - v32;
        if (v6[2])
        {
          if (v27 != v6 || v31 >= &v6[2 * v32 + 4]) {
            memmove(v31, v6 + 4, 16 * v32);
          }
          id v35 = v22;
          v6[2] = 0;
        }
        else
        {
          id v36 = v22;
        }
        swift_release();
        uint64_t v6 = v27;
        BOOL v19 = __OFSUB__(v33, 1);
        uint64_t v4 = v33 - 1;
        if (v19) {
          goto LABEL_49;
        }
      }
      *uint64_t v21 = v20;
      v21[1] = v22;
      v21 += 2;
      ++v20;
    }
    while (v2 != v20);
LABEL_47:
    uint64_t result = swift_bridgeObjectRelease();
  }
  else
  {
LABEL_53:
    uint64_t result = swift_bridgeObjectRelease();
    uint64_t v4 = 0;
    uint64_t v6 = (void *)MEMORY[0x263F8EE78];
  }
  unint64_t v37 = v6[3];
  if (v37 < 2) {
    return (uint64_t)v6;
  }
  unint64_t v38 = v37 >> 1;
  BOOL v19 = __OFSUB__(v38, v4);
  uint64_t v39 = v38 - v4;
  if (!v19)
  {
    v6[2] = v39;
    return (uint64_t)v6;
  }
LABEL_59:
  __break(1u);
  return result;
}

uint64_t sub_22016171C(uint64_t a1, int64_t a2)
{
  if (a1 < 0)
  {
    __break(1u);
    goto LABEL_22;
  }
  uint64_t v4 = *(void **)v2;
  int64_t v5 = *(void *)(*(void *)v2 + 16);
  if (v5 < a2)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  uint64_t v7 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  uint64_t v8 = a1 - a2;
  if (__OFSUB__(0, v7))
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  int64_t v9 = v5 - v7;
  if (__OFADD__(v5, v8))
  {
LABEL_25:
    __break(1u);
LABEL_26:
    __break(1u);
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  char isUniquelyReferenced_nonNull_native = (void *)swift_isUniquelyReferenced_nonNull_native();
  if (!isUniquelyReferenced_nonNull_native || v9 > v4[3] >> 1)
  {
    if (v5 <= v9) {
      int64_t v11 = v5 + v8;
    }
    else {
      int64_t v11 = v5;
    }
    uint64_t v4 = sub_22016BF18(isUniquelyReferenced_nonNull_native, v11, 1, v4);
  }
  uint64_t result = swift_arrayDestroy();
  if (!v7) {
    goto LABEL_20;
  }
  uint64_t v13 = v4[2];
  BOOL v14 = __OFSUB__(v13, a2);
  uint64_t v15 = v13 - a2;
  if (v14) {
    goto LABEL_26;
  }
  if ((v15 & 0x8000000000000000) == 0)
  {
    unint64_t v16 = (char *)&v4[3 * a2 + 4];
    if (a1 != a2 || &v4[3 * a1 + 4] >= (void *)&v16[24 * v15]) {
      uint64_t result = (uint64_t)memmove(&v4[3 * a1 + 4], v16, 24 * v15);
    }
    uint64_t v17 = v4[2];
    BOOL v14 = __OFADD__(v17, v8);
    uint64_t v18 = v17 - v7;
    if (!v14)
    {
      v4[2] = v18;
LABEL_20:
      *(void *)uint64_t v2 = v4;
      return result;
    }
    goto LABEL_27;
  }
LABEL_28:
  uint64_t result = sub_2201828B0();
  __break(1u);
  return result;
}

unint64_t sub_220161894(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 16);
  unint64_t result = MEMORY[0x263F8EE78];
  if (!v3) {
    return result;
  }
  uint64_t v10 = MEMORY[0x263F8EE78];
  sub_2201827E0();
  uint64_t v6 = (unint64_t *)(a1 + 32);
  uint64_t v7 = *(void *)(a2 + OBJC_IVAR____TtC20UserNotificationsKit44NotificationSummarizationOnboardingViewModel_sources);
  while (1)
  {
    unint64_t v8 = *v6++;
    unint64_t result = v8;
    if ((v7 & 0xC000000000000001) != 0)
    {
      MEMORY[0x223C66AB0](result, v7);
      goto LABEL_4;
    }
    if ((result & 0x8000000000000000) != 0) {
      break;
    }
    if (result >= *(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      goto LABEL_12;
    }
    id v9 = *(id *)(v7 + 32 + 8 * result);
LABEL_4:
    sub_2201827C0();
    sub_2201827F0();
    sub_220182800();
    sub_2201827D0();
    if (!--v3) {
      return v10;
    }
  }
  __break(1u);
LABEL_12:
  __break(1u);
  return result;
}

uint64_t sub_2201619A4()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_2201619DC@<X0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  return sub_22015F69C(a1, a2, *(void *)(v3 + 16), a3);
}

uint64_t sub_2201619E4()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_220161A1C(void *a1)
{
  return (*(uint64_t (**)(void, void))(v1 + 16))(*a1, a1[1]);
}

uint64_t sub_220161A4C(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_220161AC8()
{
  unint64_t result = qword_267F0A6A8;
  if (!qword_267F0A6A8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267F0A6B0);
    sub_220161B68();
    sub_22014B510(&qword_267F0A6D8, &qword_267F0A6E0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F0A6A8);
  }
  return result;
}

unint64_t sub_220161B68()
{
  unint64_t result = qword_267F0A6B8;
  if (!qword_267F0A6B8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267F0A6C0);
    sub_22015DC28();
    sub_22014B510(&qword_267F0A6C8, &qword_267F0A6D0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F0A6B8);
  }
  return result;
}

uint64_t sub_220161C18(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t objectdestroyTm_1()
{
  uint64_t v1 = type metadata accessor for NotificationSummarizationOnboardingIntroView();
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*(void *)(v1 - 8) + 64);
  uint64_t v5 = v0 + v3;
  if (*(void *)(v0 + v3)) {
    swift_release();
  }
  if (*(void *)(v5 + 16)) {
    swift_release();
  }

  swift_release();
  uint64_t v6 = v5 + *(int *)(v1 + 28);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F0AAA0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_220181D10();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  }
  else
  {
    swift_release();
  }
  swift_bridgeObjectRelease();
  swift_release();

  return MEMORY[0x270FA0238](v0, v3 + v4, v2 | 7);
}

uint64_t sub_220161DD0()
{
  type metadata accessor for NotificationSummarizationOnboardingIntroView();

  return sub_22015FA14();
}

void *sub_220161E50()
{
  return sub_220146FE4(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_220161E58(uint64_t a1, int64_t a2)
{
  if (a1 < 0)
  {
    __break(1u);
    goto LABEL_22;
  }
  uint64_t v4 = *(void **)v2;
  int64_t v5 = *(void *)(*(void *)v2 + 16);
  if (v5 < a2)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  uint64_t v7 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  uint64_t v8 = a1 - a2;
  if (__OFSUB__(0, v7))
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  int64_t v9 = v5 - v7;
  if (__OFADD__(v5, v8))
  {
LABEL_25:
    __break(1u);
LABEL_26:
    __break(1u);
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  char isUniquelyReferenced_nonNull_native = (void *)swift_isUniquelyReferenced_nonNull_native();
  if (!isUniquelyReferenced_nonNull_native || v9 > v4[3] >> 1)
  {
    if (v5 <= v9) {
      int64_t v11 = v5 + v8;
    }
    else {
      int64_t v11 = v5;
    }
    uint64_t v4 = sub_22016C040(isUniquelyReferenced_nonNull_native, v11, 1, v4);
  }
  uint64_t result = swift_arrayDestroy();
  if (!v7) {
    goto LABEL_20;
  }
  uint64_t v13 = v4[2];
  BOOL v14 = __OFSUB__(v13, a2);
  uint64_t v15 = v13 - a2;
  if (v14) {
    goto LABEL_26;
  }
  if ((v15 & 0x8000000000000000) == 0)
  {
    unint64_t v16 = (char *)&v4[4 * a2 + 4];
    if (a1 != a2 || &v4[4 * a1 + 4] >= (void *)&v16[32 * v15]) {
      uint64_t result = (uint64_t)memmove(&v4[4 * a1 + 4], v16, 32 * v15);
    }
    uint64_t v17 = v4[2];
    BOOL v14 = __OFADD__(v17, v8);
    uint64_t v18 = v17 - v7;
    if (!v14)
    {
      v4[2] = v18;
LABEL_20:
      *(void *)uint64_t v2 = v4;
      return result;
    }
    goto LABEL_27;
  }
LABEL_28:
  uint64_t result = sub_2201828B0();
  __break(1u);
  return result;
}

uint64_t sub_220161FC4()
{
  return sub_220161A4C(&qword_267F0A6F8, &qword_267F0A5D8, (void (*)(void))sub_220162008);
}

unint64_t sub_220162008()
{
  unint64_t result = qword_267F0A700;
  if (!qword_267F0A700)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267F0A5C8);
    sub_22014B510(&qword_267F0A708, &qword_267F0A5C0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F0A700);
  }
  return result;
}

uint64_t sub_2201620B0()
{
  return swift_initClassMetadata2();
}

void *sub_22016210C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t result = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(a3 + 56))(a2, a3);
  if (result)
  {
    objc_msgSend(result, sel_saveWithOutcome_, a1);
    return (void *)swift_unknownObjectRelease();
  }
  return result;
}

id sub_220162180()
{
  sub_220163C10();
  uint64_t v0 = (void *)swift_unknownObjectRetain();

  return v0;
}

void sub_2201621B8(void *a1, uint64_t a2, uint64_t a3)
{
  swift_unknownObjectRetain();
  id v5 = a1;
  sub_220162218(a3);
}

uint64_t sub_220162218(uint64_t a1)
{
  *(void *)(v1 + qword_267F0A770) = a1;
  return swift_unknownObjectRelease();
}

id sub_220162230(void *a1)
{
  id v1 = a1;
  uint64_t v2 = (void *)sub_220162274();

  return v2;
}

uint64_t sub_220162274()
{
  v4.receiver = v0;
  v4.super_class = (Class)type metadata accessor for NotificationOnboardingViewHost();
  id v1 = objc_msgSendSuper2(&v4, sel_traitCollection);
  uint64_t v2 = sub_220182650();

  return v2;
}

void sub_220162324(uint64_t a1)
{
  id v2 = objc_msgSend(self, sel_currentDevice);
  id v3 = objc_msgSend(v2, sel_userInterfaceIdiom);

  if (v3 != (id)1)
  {
    __swift_mutable_project_boxed_opaque_existential_1(a1, *(void *)(a1 + 24));
    sub_220181C90();
  }
}

void sub_2201623B4(uint64_t a1)
{
  id v2 = v1;
  uint64_t v3 = *(void *)((*MEMORY[0x263F8EED0] & *(void *)v1) + 0x50);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v6 = (char *)v40 - v5;
  uint64_t v8 = *(void *)(v7 + 88);
  int64_t v9 = (objc_class *)type metadata accessor for NotificationOnboardingViewHost();
  v41.receiver = v1;
  v41.super_class = v9;
  objc_msgSendSuper2(&v41, sel_viewDidLoad);
  uint64_t v10 = *(void **)&v1[qword_267F0A780];
  if (v10)
  {
    id v11 = v10;
    sub_220181FE0();

    (*(void (**)(uint64_t, uint64_t))(v8 + 24))(v3, v8);
    uint64_t v13 = v12;
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    if (v13)
    {
      id v14 = objc_msgSend(v2, sel_buttonTray);
      uint64_t v15 = (void *)sub_220182450();
      swift_bridgeObjectRelease();
      objc_msgSend(v14, sel_setCaptionText_, v15);
    }
    unint64_t v16 = (unint64_t *)&v2[qword_267F0A788];
    uint64_t v17 = *(void *)&v2[qword_267F0A788 + 16];
    if (v17)
    {
      uint64_t v18 = v16[3];
      unint64_t v20 = *v16;
      uint64_t v19 = v16[1];
      uint64_t v21 = self;
      sub_220163BBC(v20, v19, v17);
      id v22 = objc_msgSend(v21, sel_boldButton);
      sub_220162ADC(v22, v20, v19, v17, v18);
      objc_msgSend(v22, sel_addTarget_action_forControlEvents_, v2, sel_primaryButtonPressed, 64);
      id v23 = objc_msgSend(v2, sel_buttonTray);
      objc_msgSend(v23, sel_addButton_, v22);

      sub_220163C20(v20);
      swift_release();
    }
    unint64_t v24 = (unint64_t *)&v2[qword_267F0A790];
    uint64_t v25 = *(void *)&v2[qword_267F0A790 + 16];
    if (v25)
    {
      uint64_t v26 = v24[3];
      unint64_t v28 = *v24;
      uint64_t v27 = v24[1];
      uint64_t v29 = self;
      sub_220163BBC(v28, v27, v25);
      id v30 = objc_msgSend(v29, sel_linkButton);
      sub_220162ADC(v30, v28, v27, v25, v26);
      objc_msgSend(v30, sel_addTarget_action_forControlEvents_, v2, sel_secondaryButtonPressed, 64);
      id v31 = objc_msgSend(v2, sel_buttonTray);
      objc_msgSend(v31, sel_addButton_, v30);

      sub_220163C20(v28);
      swift_release();
    }
    uint64_t v32 = (unint64_t *)&v2[qword_267F0A7A0];
    uint64_t v33 = *(void *)&v2[qword_267F0A7A0 + 16];
    if (v33)
    {
      uint64_t v34 = v32[3];
      unint64_t v36 = *v32;
      uint64_t v35 = v32[1];
      sub_220163BBC(*v32, v35, *(void *)&v2[qword_267F0A7A0 + 16]);
      id v37 = objc_msgSend(v2, sel_navigationItem);
      objc_msgSend(v37, sel_setHidesBackButton_, 1);

      v40[1] = v2;
      id v38 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F824A8]), sel_initWithTitle_style_target_action_, 0, 0, sub_220182900(), sel_backButtonPressed);
      swift_unknownObjectRelease();
      sub_22016288C(v38, v36, v35, v33, v34);
      id v39 = objc_msgSend(v2, sel_navigationItem);
      objc_msgSend(v39, sel_setLeftBarButtonItem_, v38);

      sub_220163C20(v36);
      swift_release();
    }
  }
  else
  {
    __break(1u);
  }
}

void sub_220162844(void *a1)
{
  id v1 = a1;
  sub_2201623B4((uint64_t)v1);
}

void sub_22016288C(void *a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v11 = *MEMORY[0x263F8EED0] & *v5;
  uint64_t v12 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = *(void *)(v11 + 80);
  v13[3] = *(void *)(v11 + 88);
  v13[4] = v12;
  v13[5] = a1;
  v13[6] = a2;
  v13[7] = a3;
  v13[8] = a4;
  v13[9] = a5;
  swift_retain();
  id v14 = a1;
  sub_220163BFC(a2);
  swift_retain();
  sub_220162DD4();
  swift_release();
  swift_release();
  if (qword_267F09C70 != -1) {
    swift_once();
  }
  id v15 = (id)qword_267F0C100;
  unint64_t v16 = (void *)sub_220182450();
  uint64_t v17 = (void *)sub_220182450();
  id v18 = objc_msgSend(v15, sel_localizedStringForKey_value_table_, v16, 0, v17);

  sub_220182460();
  swift_bridgeObjectRelease();

  id v19 = (id)sub_220182450();
  swift_bridgeObjectRelease();
  objc_msgSend(v14, sel_setTitle_, v19);
}

id sub_220162ADC(void *a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v11 = *MEMORY[0x263F8EED0] & *v5;
  uint64_t v12 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = *(void *)(v11 + 80);
  v13[3] = *(void *)(v11 + 88);
  v13[4] = v12;
  v13[5] = a1;
  v13[6] = a2;
  v13[7] = a3;
  v13[8] = a4;
  v13[9] = a5;
  swift_retain();
  id v14 = a1;
  sub_220163BFC(a2);
  swift_retain();
  sub_220162DD4();
  char v16 = v15;
  swift_release();
  swift_release();
  if (qword_267F09C70 != -1) {
    swift_once();
  }
  id v17 = (id)qword_267F0C100;
  id v18 = (void *)sub_220182450();
  id v19 = (void *)sub_220182450();
  id v20 = objc_msgSend(v17, sel_localizedStringForKey_value_table_, v18, 0, v19);

  sub_220182460();
  swift_bridgeObjectRelease();

  uint64_t v21 = (void *)sub_220182450();
  swift_bridgeObjectRelease();
  objc_msgSend(v14, sel_setTitle_forState_, v21, 0);

  return objc_msgSend(v14, sel_setEnabled_, v16 & 1);
}

void sub_220162D3C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void (*a9)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v14 = a1 + 16;
  swift_beginAccess();
  uint64_t v15 = MEMORY[0x223C677B0](v14);
  if (v15)
  {
    char v16 = (void *)v15;
    a9(a2, a3, a4, a5, a6);
  }
}

uint64_t sub_220162DD4()
{
  swift_allocObject();
  swift_unknownObjectWeakInit();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267F0A838);
  sub_220181BD0();
  swift_release();
  return v1;
}

void sub_220162EFC(uint64_t a1@<X0>, uint64_t (*a2)(void *)@<X2>, uint64_t a3@<X5>, uint64_t a4@<X6>, uint64_t a5@<X8>)
{
  uint64_t v9 = *(void *)(a3 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v11 = (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = v12 + 16;
  swift_beginAccess();
  uint64_t v14 = MEMORY[0x223C677B0](v13);
  if (!v14) {
    goto LABEL_6;
  }
  uint64_t v15 = (void *)v14;
  char v16 = *(void **)(v14 + qword_267F0A780);
  id v17 = v16;

  if (v16)
  {
    sub_220181FE0();

    uint64_t v18 = (*(uint64_t (**)(uint64_t, uint64_t))(a4 + 56))(a3, a4);
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, a3);
    if (v18)
    {
      type metadata accessor for NotificationSummarizationOnboardingViewModel();
      id v19 = (void *)swift_dynamicCastClass();
      if (!v19) {
        swift_unknownObjectRelease();
      }
      goto LABEL_7;
    }
LABEL_6:
    id v19 = 0;
LABEL_7:
    uint64_t v20 = a2(v19);
    uint64_t v22 = v21;
    char v24 = v23;

    *(void *)a5 = v20;
    *(void *)(a5 + 8) = v22;
    *(unsigned char *)(a5 + 16) = v24 & 1;
    return;
  }
  __break(1u);
}

uint64_t sub_2201630AC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F09E90);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_220182590();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v6, 1, 1, v7);
  sub_220182570();
  swift_retain();
  uint64_t v8 = sub_220182560();
  uint64_t v9 = (void *)swift_allocObject();
  uint64_t v10 = MEMORY[0x263F8F500];
  v9[2] = v8;
  _OWORD v9[3] = v10;
  v9[4] = a1;
  v9[5] = a2;
  sub_220174760((uint64_t)v6, (uint64_t)&unk_267F0A850, (uint64_t)v9);
  return swift_release();
}

uint64_t sub_2201631C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[2] = a4;
  v5[3] = a5;
  sub_220182570();
  v5[4] = sub_220182560();
  uint64_t v7 = sub_220182550();
  return MEMORY[0x270FA2498](sub_220163260, v7, v6);
}

uint64_t sub_220163260()
{
  uint64_t v1 = *(void (**)(uint64_t))(v0 + 16);
  uint64_t v2 = swift_release();
  v1(v2);
  uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

unint64_t sub_2201632CC()
{
  return sub_2201633C8(&qword_267F0A788, 0xD000000000000016, 0x8000000220189360);
}

void sub_2201632F0(void *a1)
{
  id v1 = a1;
  sub_2201632CC();
}

unint64_t sub_220163338()
{
  return sub_2201633C8(&qword_267F0A790, 0xD000000000000018, 0x8000000220189340);
}

void sub_22016335C(void *a1)
{
  id v1 = a1;
  sub_220163338();
}

unint64_t sub_2201633A4()
{
  return sub_2201633C8(&qword_267F0A7A0, 0xD000000000000013, 0x8000000220189320);
}

unint64_t sub_2201633C8(void *a1, uint64_t a2, unint64_t a3)
{
  uint64_t v6 = (unint64_t *)(v3 + *a1);
  uint64_t v7 = (uint64_t (*)(unint64_t))*v6;
  uint64_t v8 = v6[1];
  uint64_t v9 = v6[2];
  uint64_t v10 = v6[3];
  sub_220163BBC(*v6, v8, v9);
  sub_2201634AC(v7, v8, v9, v10, a2, a3);

  return sub_220163C34((unint64_t)v7, v8, v9);
}

void sub_220163464(void *a1)
{
  id v1 = a1;
  sub_2201633A4();
}

void sub_2201634AC(uint64_t (*a1)(unint64_t), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6)
{
  uint64_t v7 = v6;
  uint64_t v12 = *MEMORY[0x263F8EED0] & *v7;
  uint64_t v13 = *(void *)(v12 + 0x50);
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](a1);
  id v17 = (char *)&v32 - v16;
  if (v15)
  {
    if (a1)
    {
      if (a1 == (uint64_t (*)(unint64_t))1)
      {
        uint64_t v27 = *(void **)((char *)v7 + qword_267F0A780);
        if (v27)
        {
          id v28 = v27;
          swift_retain();
          sub_220163BFC(1uLL);
          sub_220181FE0();

          sub_22016210C(1, v13, *(void *)(v12 + 88));
          (*(void (**)(char *, uint64_t))(v14 + 8))(v17, v13);
          uint64_t v29 = *(void **)((char *)v7 + qword_267F0A770);
          if (v29) {
            objc_msgSend(v29, sel_onboardingControllerDidFinish_, v7);
          }
          goto LABEL_27;
        }
LABEL_29:
        __break(1u);
        return;
      }
      if (a1 == (uint64_t (*)(unint64_t))2)
      {
        uint64_t v18 = *(void **)((char *)v7 + qword_267F0A780);
        if (v18)
        {
          id v19 = v18;
          swift_retain();
          sub_220163BFC(2uLL);
          sub_220181FE0();

          sub_22016210C(2, v13, *(void *)(v12 + 88));
          (*(void (**)(char *, uint64_t))(v14 + 8))(v17, v13);
          uint64_t v20 = *(void **)((char *)v7 + qword_267F0A770);
          if (v20) {
            objc_msgSend(v20, sel_onboardingControllerRequestsCancellation_, v7);
          }
LABEL_27:
          swift_release();
          return;
        }
        __break(1u);
        goto LABEL_29;
      }
      sub_220163BBC((unint64_t)a1, a2, v15);
      unint64_t v30 = sub_220163BFC((unint64_t)a1);
      id v31 = (void *)a1(v30);
      if (*(void *)((char *)v7 + qword_267F0A770))
      {
        objc_msgSend((id)swift_unknownObjectRetain(), sel_onboardingController_requestsPushingTo_, v7, v31);
        sub_220163C20((unint64_t)a1);
        swift_unknownObjectRelease();
        sub_220163C20((unint64_t)a1);
      }
      else
      {
        sub_220163C20((unint64_t)a1);

        sub_220163C20((unint64_t)a1);
      }
LABEL_25:
      goto LABEL_27;
    }
    uint64_t v26 = *(void **)((char *)v7 + qword_267F0A770);
    if (v26)
    {
      sub_220163BFC(0);
      swift_retain();
      objc_msgSend(v26, sel_onboardingControllerRequestsGoingBack_, v7);
      goto LABEL_25;
    }
    sub_220163BFC(0);
  }
  else
  {
    if (qword_267F09C80 != -1) {
      swift_once();
    }
    uint64_t v21 = sub_220181C80();
    __swift_project_value_buffer(v21, (uint64_t)qword_267F0C120);
    swift_bridgeObjectRetain_n();
    uint64_t v22 = sub_220181C60();
    os_log_type_t v23 = sub_220182610();
    if (os_log_type_enabled(v22, v23))
    {
      char v24 = (uint8_t *)swift_slowAlloc();
      uint64_t v25 = swift_slowAlloc();
      uint64_t v33 = v25;
      *(_DWORD *)char v24 = 136446210;
      swift_bridgeObjectRetain();
      uint64_t v32 = sub_220149888(a5, a6, &v33);
      sub_2201826B0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_22012C000, v22, v23, "Action not implemented for '%{public}s'", v24, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x223C676F0](v25, -1, -1);
      MEMORY[0x223C676F0](v24, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
}

void sub_22016399C()
{
}

void sub_2201639E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v5 = a5;

  sub_220163F64();
}

id sub_220163A54()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for NotificationOnboardingViewHost();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_220163AC8(uint64_t a1)
{
  swift_unknownObjectRelease();

  sub_220163C34(*(void *)(a1 + qword_267F0A788), *(void *)(a1 + qword_267F0A788 + 8), *(void *)(a1 + qword_267F0A788 + 16));
  sub_220163C34(*(void *)(a1 + qword_267F0A790), *(void *)(a1 + qword_267F0A790 + 8), *(void *)(a1 + qword_267F0A790 + 16));
  sub_220163C34(*(void *)(a1 + qword_267F0A798), *(void *)(a1 + qword_267F0A798 + 8), *(void *)(a1 + qword_267F0A798 + 16));
  sub_220163C34(*(void *)(a1 + qword_267F0A7A0), *(void *)(a1 + qword_267F0A7A0 + 8), *(void *)(a1 + qword_267F0A7A0 + 16));

  return swift_release();
}

uint64_t type metadata accessor for NotificationOnboardingViewHost()
{
  return __swift_instantiateGenericMetadata();
}

unint64_t sub_220163BBC(unint64_t result, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    sub_220163BFC(result);
    return swift_retain();
  }
  return result;
}

unint64_t sub_220163BFC(unint64_t result)
{
  if (result >= 3) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_220163C10()
{
  return *(void *)(v0 + qword_267F0A770);
}

unint64_t sub_220163C20(unint64_t result)
{
  if (result >= 3) {
    return swift_release();
  }
  return result;
}

unint64_t sub_220163C34(unint64_t result, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    sub_220163C20(result);
    return swift_release();
  }
  return result;
}

uint64_t sub_220163C74()
{
  swift_unknownObjectWeakDestroy();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_220163CAC(uint64_t a1@<X8>)
{
  sub_220162EFC(*(void *)(v1 + 32), *(uint64_t (**)(void *))(v1 + 48), *(void *)(v1 + 16), *(void *)(v1 + 24), a1);
}

uint64_t (*sub_220163CC0())()
{
  uint64_t v2 = *(void *)(v0 + 16);
  uint64_t v1 = *(void *)(v0 + 24);
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = v2;
  *(void *)(v3 + 24) = v1;
  swift_retain();
  return sub_220163D60;
}

uint64_t sub_220163D28()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_220163D60()
{
  return sub_2201630AC(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_220163D68()
{
  swift_unknownObjectRelease();
  swift_release();

  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_220163DA8(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v6 = v1[5];
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  *uint64_t v8 = v2;
  v8[1] = sub_22014A1F0;
  return sub_2201631C8(a1, v4, v5, v7, v6);
}

void sub_220163E6C()
{
}

uint64_t objectdestroy_11Tm()
{
  swift_release();

  if (*(void *)(v0 + 48) >= 3uLL) {
    swift_release();
  }
  swift_release();

  return MEMORY[0x270FA0238](v0, 80, 7);
}

void sub_220163EE4()
{
}

void sub_220163EFC(void (*a1)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  sub_220162D3C(v1[4], v1[5], v1[6], v1[7], v1[8], v1[9], v1[2], v1[3], a1);
}

void sub_220163F34()
{
}

void sub_220163F64()
{
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

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
}

uint64_t sub_220164014(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    unint64_t v3 = 0x7465626168706C61;
  }
  else {
    unint64_t v3 = 0xD000000000000015;
  }
  if (v2) {
    unint64_t v4 = 0x8000000220188340;
  }
  else {
    unint64_t v4 = 0xEC0000006C616369;
  }
  if (a2) {
    unint64_t v5 = 0x7465626168706C61;
  }
  else {
    unint64_t v5 = 0xD000000000000015;
  }
  if (a2) {
    unint64_t v6 = 0xEC0000006C616369;
  }
  else {
    unint64_t v6 = 0x8000000220188340;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = sub_220182910();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_2201640C8(char a1, char a2)
{
  unint64_t v3 = 0xD000000000000016;
  unint64_t v4 = 0x8000000220188300;
  switch(a1)
  {
    case 1:
      unint64_t v4 = 0x8000000220188320;
      unint64_t v3 = 0xD000000000000014;
      break;
    case 2:
      unint64_t v4 = 0xE500000000000000;
      unint64_t v3 = 0x726568746FLL;
      break;
    case 3:
      unint64_t v4 = 0xE400000000000000;
      unint64_t v3 = 1701736302;
      break;
    default:
      break;
  }
  unint64_t v5 = 0xD000000000000016;
  unint64_t v6 = 0x8000000220188300;
  switch(a2)
  {
    case 1:
      unint64_t v6 = 0x8000000220188320;
      if (v3 == 0xD000000000000014) {
        goto LABEL_12;
      }
      goto LABEL_14;
    case 2:
      unint64_t v6 = 0xE500000000000000;
      unint64_t v5 = 0x726568746FLL;
      goto LABEL_9;
    case 3:
      unint64_t v6 = 0xE400000000000000;
      if (v3 == 1701736302) {
        goto LABEL_12;
      }
      goto LABEL_14;
    default:
LABEL_9:
      if (v3 != v5) {
        goto LABEL_14;
      }
LABEL_12:
      if (v4 == v6) {
        char v7 = 1;
      }
      else {
LABEL_14:
      }
        char v7 = sub_220182910();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v7 & 1;
  }
}

uint64_t sub_220164244()
{
  return swift_retain();
}

uint64_t UNNotificationSource.id.getter()
{
  id v1 = objc_msgSend(v0, sel_sourceIdentifier);
  uint64_t v2 = sub_220182460();

  return v2;
}

uint64_t sub_220164318()
{
  return MEMORY[0x263F8D320];
}

uint64_t sub_220164324()
{
  return sub_220182A00();
}

uint64_t sub_220164400()
{
  return sub_220182A00();
}

uint64_t sub_220164490()
{
  sub_220182490();

  return swift_bridgeObjectRelease();
}

uint64_t sub_220164508()
{
  sub_220182490();

  return swift_bridgeObjectRelease();
}

uint64_t sub_2201645D0()
{
  return sub_220182A00();
}

uint64_t sub_2201646A8()
{
  return sub_220182A00();
}

unint64_t sub_220164734(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F0A9D0);
  uint64_t v2 = (void *)sub_2201828A0();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  unint64_t v4 = (_OWORD *)(a1 + 56);
  while (1)
  {
    unint64_t v5 = (void *)*((void *)v4 - 3);
    double v6 = *((double *)v4 - 2);
    double v7 = *((double *)v4 - 1);
    long long v16 = *v4;
    id v8 = v5;
    swift_retain();
    id v9 = *((id *)&v16 + 1);
    unint64_t result = sub_22017A08C(v5, v6, v7);
    if (v11) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v12 = (double *)(v2[6] + 24 * result);
    *(void *)uint64_t v12 = v5;
    v12[1] = v6;
    v12[2] = v7;
    *(_OWORD *)(v2[7] + 16 * result) = v16;
    uint64_t v13 = v2[2];
    BOOL v14 = __OFADD__(v13, 1);
    uint64_t v15 = v13 + 1;
    if (v14) {
      goto LABEL_11;
    }
    v2[2] = v15;
    unint64_t v4 = (_OWORD *)((char *)v4 + 40);
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

unint64_t sub_22016487C(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F0A9C8);
  uint64_t v2 = (void *)sub_2201828A0();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  unint64_t v4 = (void **)(a1 + 56);
  while (1)
  {
    unint64_t v5 = *(v4 - 3);
    double v6 = *((double *)v4 - 2);
    double v7 = *((double *)v4 - 1);
    id v8 = *v4;
    id v9 = v5;
    id v10 = v8;
    unint64_t result = sub_22017A08C(v5, v6, v7);
    if (v12) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v13 = (double *)(v2[6] + 24 * result);
    *(void *)uint64_t v13 = v5;
    v13[1] = v6;
    v13[2] = v7;
    *(void *)(v2[7] + 8 * result) = v10;
    uint64_t v14 = v2[2];
    BOOL v15 = __OFADD__(v14, 1);
    uint64_t v16 = v14 + 1;
    if (v15) {
      goto LABEL_11;
    }
    v2[2] = v16;
    v4 += 4;
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

unint64_t sub_2201649AC(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F0A9E0);
  uint64_t v2 = (void *)sub_2201828A0();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  unint64_t v4 = (void *)(a1 + 40);
  while (1)
  {
    unsigned __int8 v5 = *((unsigned char *)v4 - 8);
    uint64_t v6 = *v4;
    swift_bridgeObjectRetain();
    unint64_t result = sub_22017A15C(v5);
    if (v8) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    *(unsigned char *)(v2[6] + result) = v5;
    *(void *)(v2[7] + 8 * result) = v6;
    uint64_t v9 = v2[2];
    BOOL v10 = __OFADD__(v9, 1);
    uint64_t v11 = v9 + 1;
    if (v10) {
      goto LABEL_11;
    }
    v2[2] = v11;
    v4 += 2;
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

unint64_t sub_220164AB0(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F0A968);
  uint64_t v2 = (void *)sub_2201828A0();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  unint64_t v4 = (void **)(a1 + 48);
  while (1)
  {
    uint64_t v5 = (uint64_t)*(v4 - 2);
    uint64_t v6 = (uint64_t)*(v4 - 1);
    double v7 = *v4;
    swift_bridgeObjectRetain();
    id v8 = v7;
    unint64_t result = sub_22017A2C8(v5, v6);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v2[6] + 16 * result);
    uint64_t *v11 = v5;
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

uint64_t sub_220164BCC(unsigned __int8 a1, uint64_t a2)
{
  if (*(void *)(a2 + 16))
  {
    sub_2201829B0();
    sub_220182490();
    swift_bridgeObjectRelease();
    uint64_t v4 = sub_220182A00();
    uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
    unint64_t v6 = v4 & ~v5;
    if ((*(void *)(a2 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
    {
      uint64_t v7 = ~v5;
      uint64_t v8 = a1;
      while (1)
      {
        unint64_t v9 = 0xD000000000000016;
        unint64_t v10 = 0x8000000220188300;
        switch(*(unsigned char *)(*(void *)(a2 + 48) + v6))
        {
          case 1:
            unint64_t v10 = 0x8000000220188320;
            unint64_t v9 = 0xD000000000000014;
            break;
          case 2:
            unint64_t v10 = 0xE500000000000000;
            unint64_t v9 = 0x726568746FLL;
            break;
          case 3:
            unint64_t v10 = 0xE400000000000000;
            unint64_t v9 = 1701736302;
            break;
          default:
            break;
        }
        unint64_t v11 = 0xD000000000000016;
        unint64_t v12 = 0x8000000220188300;
        switch(v8)
        {
          case 1:
            unint64_t v12 = 0x8000000220188320;
            if (v9 == 0xD000000000000014) {
              goto LABEL_15;
            }
            goto LABEL_16;
          case 2:
            unint64_t v12 = 0xE500000000000000;
            unint64_t v11 = 0x726568746FLL;
            goto LABEL_12;
          case 3:
            unint64_t v12 = 0xE400000000000000;
            if (v9 == 1701736302) {
              goto LABEL_15;
            }
            goto LABEL_16;
          default:
LABEL_12:
            if (v9 != v11) {
              goto LABEL_16;
            }
LABEL_15:
            if (v10 == v12)
            {
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              char v13 = 1;
              return v13 & 1;
            }
LABEL_16:
            char v13 = sub_220182910();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            if (v13) {
              return v13 & 1;
            }
            unint64_t v6 = (v6 + 1) & v7;
            if (((*(void *)(a2 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
              return v13 & 1;
            }
            break;
        }
      }
    }
  }
  char v13 = 0;
  return v13 & 1;
}

uint64_t sub_220164E80(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = MEMORY[0x263F8EE78];
  if (v1)
  {
    uint64_t v3 = a1;
    uint64_t v21 = MEMORY[0x263F8EE78];
    sub_22015FB60(0, v1, 0);
    uint64_t v2 = v21;
    int64_t v4 = sub_22017016C(v3);
    int v6 = v5;
    char v8 = v7 & 1;
    uint64_t v19 = v3;
    uint64_t v20 = v3 + 56;
    do
    {
      if (v4 < 0 || v4 >= 1 << *(unsigned char *)(v3 + 32))
      {
        __break(1u);
LABEL_17:
        __break(1u);
LABEL_18:
        __break(1u);
        JUMPOUT(0x220165070);
      }
      if (((*(void *)(v20 + (((unint64_t)v4 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v4) & 1) == 0) {
        goto LABEL_17;
      }
      if (*(_DWORD *)(v3 + 36) != v6) {
        goto LABEL_18;
      }
      uint64_t v9 = *(unsigned __int8 *)(*(void *)(v3 + 48) + v4);
      unint64_t v10 = 0xD000000000000016;
      unint64_t v11 = 0x8000000220188300;
      switch(v9)
      {
        case 1:
          unint64_t v11 = 0x8000000220188320;
          unint64_t v10 = 0xD000000000000014;
          break;
        case 2:
          unint64_t v11 = 0xE500000000000000;
          unint64_t v10 = 0x726568746FLL;
          break;
        case 3:
          unint64_t v11 = 0xE400000000000000;
          unint64_t v10 = 1701736302;
          break;
        default:
          break;
      }
      unint64_t v13 = *(void *)(v21 + 16);
      unint64_t v12 = *(void *)(v21 + 24);
      if (v13 >= v12 >> 1) {
        sub_22015FB60(v12 > 1, v13 + 1, 1);
      }
      *(void *)(v21 + 16) = v13 + 1;
      uint64_t v14 = v21 + 16 * v13;
      *(void *)(v14 + 32) = v10;
      *(void *)(v14 + 40) = v11;
      uint64_t v3 = v19;
      int64_t v15 = sub_22017020C(v4, v6, v8 & 1, v19);
      int64_t v4 = v15;
      int v6 = v16;
      char v8 = v17 & 1;
      --v1;
    }
    while (v1);
    sub_220172850(v15, v16, v17 & 1);
  }
  return v2;
}

uint64_t sub_220165080()
{
  return sub_22016612C();
}

uint64_t sub_220165094(uint64_t a1)
{
  uint64_t v2 = v1;
  swift_getKeyPath();
  uint64_t v17 = v1;
  sub_22016BD54();
  sub_220181BF0();
  swift_release();
  int64_t v4 = (uint64_t *)(v1
                 + OBJC_IVAR____TtC20UserNotificationsKit44NotificationSummarizationOnboardingViewModel__selectedCategories);
  swift_beginAccess();
  uint64_t v5 = *v4;
  swift_bridgeObjectRetain();
  char v6 = sub_220164BCC(a1, v5);
  swift_bridgeObjectRelease();
  if (v6)
  {
    swift_getKeyPath();
    sub_220181BF0();
    swift_release();
    uint64_t v17 = v2;
    swift_getKeyPath();
    sub_220181C10();
    swift_release();
    swift_beginAccess();
    sub_22016EE3C(a1);
    goto LABEL_15;
  }
  switch((char)a1)
  {
    case 3:
      swift_bridgeObjectRelease();
      goto LABEL_13;
    default:
      char v7 = sub_220182910();
      swift_bridgeObjectRelease();
      if (v7)
      {
LABEL_13:
        swift_getKeyPath();
        sub_220181BF0();
        swift_release();
        swift_getKeyPath();
        sub_220181C10();
        swift_release();
        *int64_t v4 = MEMORY[0x263F8EE88];
        swift_bridgeObjectRelease();
        uint64_t v17 = v2;
        swift_getKeyPath();
        sub_220181C00();
        swift_release();
        goto LABEL_14;
      }
      swift_getKeyPath();
      uint64_t v17 = v2;
      sub_220181BF0();
      swift_release();
      uint64_t v8 = *v4;
      if (!*(void *)(*v4 + 16)) {
        goto LABEL_14;
      }
      sub_2201829B0();
      swift_bridgeObjectRetain();
      sub_220182490();
      uint64_t v9 = sub_220182A00();
      uint64_t v10 = -1 << *(unsigned char *)(v8 + 32);
      unint64_t v11 = v9 & ~v10;
      if (((*(void *)(v8 + 56 + ((v11 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v11) & 1) == 0)
      {
        swift_bridgeObjectRelease();
        goto LABEL_14;
      }
      uint64_t v15 = a1;
      uint64_t v12 = ~v10;
      break;
  }
  while (2)
  {
    switch(*(unsigned char *)(*(void *)(v8 + 48) + v11))
    {
      case 3:
        swift_bridgeObjectRelease();
        goto LABEL_18;
      default:
        char v13 = sub_220182910();
        swift_bridgeObjectRelease();
        if ((v13 & 1) == 0)
        {
          unint64_t v11 = (v11 + 1) & v12;
          if (((*(void *)(v8 + 56 + ((v11 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v11) & 1) == 0)
          {
            swift_bridgeObjectRelease();
            goto LABEL_19;
          }
          continue;
        }
LABEL_18:
        swift_bridgeObjectRelease();
        swift_getKeyPath();
        sub_220181BF0();
        swift_release();
        swift_getKeyPath();
        sub_220181C10();
        swift_release();
        swift_beginAccess();
        sub_22016EE3C(3u);
        swift_endAccess();
        uint64_t v17 = v2;
        swift_getKeyPath();
        sub_220181C00();
        swift_release();
LABEL_19:
        a1 = v15;
LABEL_14:
        swift_getKeyPath();
        sub_220181BF0();
        swift_release();
        uint64_t v17 = v2;
        swift_getKeyPath();
        sub_220181C10();
        swift_release();
        swift_beginAccess();
        sub_22016C5B8(&v16, a1);
LABEL_15:
        swift_endAccess();
        uint64_t v17 = v2;
        swift_getKeyPath();
        sub_220181C00();
        return swift_release();
    }
  }
}

uint64_t sub_22016562C()
{
  swift_getKeyPath();
  sub_22016BD54();
  sub_220181BF0();
  swift_release();
  uint64_t v1 = (uint64_t *)(v0
                 + OBJC_IVAR____TtC20UserNotificationsKit44NotificationSummarizationOnboardingViewModel__selectedCategories);
  swift_beginAccess();
  if (!*(void *)(*v1 + 16)) {
    return 0;
  }
  swift_getKeyPath();
  sub_220181BF0();
  swift_release();
  if (*(void *)(*v1 + 16) == 1)
  {
    swift_getKeyPath();
    sub_220181BF0();
    swift_release();
    uint64_t v2 = *v1;
    if (*(void *)(*v1 + 16))
    {
      sub_2201829B0();
      swift_bridgeObjectRetain();
      sub_220182490();
      uint64_t v3 = sub_220182A00();
      uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
      unint64_t v5 = v3 & ~v4;
      if ((*(void *)(v2 + 56 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
      {
        uint64_t v6 = ~v4;
        while (1)
        {
          switch(*(unsigned char *)(*(void *)(v2 + 48) + v5))
          {
            case 3:
              swift_bridgeObjectRelease();
              goto LABEL_17;
            default:
              char v7 = sub_220182910();
              swift_bridgeObjectRelease();
              if (v7)
              {
LABEL_17:
                swift_bridgeObjectRelease();
                if (qword_267F09C70 == -1) {
                  goto LABEL_18;
                }
LABEL_20:
                swift_once();
                goto LABEL_18;
              }
              unint64_t v5 = (v5 + 1) & v6;
              if (((*(void *)(v2 + 56 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5) & 1) == 0) {
                goto LABEL_9;
              }
              break;
          }
        }
      }
LABEL_9:
      swift_bridgeObjectRelease();
    }
  }
  swift_getKeyPath();
  sub_220181BF0();
  swift_release();
  if (*(void *)(*v1 + 16) == 3)
  {
    if (qword_267F09C70 != -1) {
      goto LABEL_20;
    }
  }
  else if (qword_267F09C70 != -1)
  {
    goto LABEL_20;
  }
LABEL_18:
  id v9 = (id)qword_267F0C100;
  uint64_t v10 = (void *)sub_220182450();
  unint64_t v11 = (void *)sub_220182450();
  id v12 = objc_msgSend(v9, sel_localizedStringForKey_value_table_, v10, 0, v11);

  uint64_t v8 = sub_220182460();
  return v8;
}

uint64_t sub_220165A6C(uint64_t a1, uint64_t a2)
{
  return sub_220166304(a1, a2, &OBJC_IVAR____TtC20UserNotificationsKit44NotificationSummarizationOnboardingViewModel__selectedCategories);
}

id sub_220165A8C()
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  *(void *)&v0[OBJC_IVAR____TtC20UserNotificationsKit44NotificationSummarizationOnboardingViewModel__selectedCategories] = MEMORY[0x263F8EE88];
  type metadata accessor for NotificationSourceIconCache();
  swift_allocObject();
  uint64_t v2 = v0;
  *(void *)&v2[OBJC_IVAR____TtC20UserNotificationsKit44NotificationSummarizationOnboardingViewModel__iconCache] = sub_2201540F0(8);
  sub_220181C20();
  unint64_t v3 = sub_220165C08();
  uint64_t v5 = v4;
  char v7 = v6;
  *(void *)&v2[OBJC_IVAR____TtC20UserNotificationsKit44NotificationSummarizationOnboardingViewModel_sources] = v3;
  *(void *)&v2[OBJC_IVAR____TtC20UserNotificationsKit44NotificationSummarizationOnboardingViewModel_categorizedSources] = v8;
  if (v3 >> 62)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    size_t v9 = sub_220182870();
  }
  else
  {
    size_t v9 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  *(void *)&v2[OBJC_IVAR____TtC20UserNotificationsKit44NotificationSummarizationOnboardingViewModel__isSummarizationEnabledByIndex] = sub_220165F44(1, v9);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(void *)&v2[OBJC_IVAR____TtC20UserNotificationsKit44NotificationSummarizationOnboardingViewModel_topSourcesIndexes] = v5;
  v2[OBJC_IVAR____TtC20UserNotificationsKit44NotificationSummarizationOnboardingViewModel_sourcesSortMethod] = v7 & 1;

  v11.receiver = v2;
  v11.super_class = ObjectType;
  return objc_msgSendSuper2(&v11, sel_init);
}

unint64_t sub_220165C08()
{
  sub_2201709C8();
  uint64_t v0 = sub_22016A5BC();
  swift_bridgeObjectRetain();
  uint64_t v1 = swift_bridgeObjectRetain();
  uint64_t v2 = sub_22016C260(v1);
  swift_bridgeObjectRelease();
  v19[0] = v2;
  sub_220171B58(v19, v0);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease_n();
  unint64_t v3 = v19[0];
  id v19[3] = (uint64_t)&type metadata for NotificationsUIFeatureFlags;
  v19[4] = sub_220160FDC();
  uint64_t v4 = swift_allocObject();
  v19[0] = v4;
  *(void *)(v4 + 16) = "NotificationsUI";
  *(void *)(v4 + 24) = 15;
  *(unsigned char *)(v4 + 32) = 2;
  *(void *)(v4 + 40) = "GreymatterOnboardingWithAppCategorization";
  *(void *)(v4 + 48) = 41;
  *(unsigned char *)(v4 + 56) = 2;
  LOBYTE(v0) = sub_220181C40();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v19);
  if (v0) {
    sub_220152308(v3);
  }
  else {
    sub_2201649AC(MEMORY[0x263F8EE78]);
  }
  if ((v3 & 0x8000000000000000) != 0 || (v3 & 0x4000000000000000) != 0) {
    goto LABEL_29;
  }
  uint64_t v5 = *(void *)(v3 + 16);
  while (1)
  {
    int64_t v6 = v5 >= 5 ? 5 : v5;
    if ((v6 & 0x8000000000000000) == 0) {
      break;
    }
    __break(1u);
LABEL_29:
    swift_bridgeObjectRetain();
    uint64_t v5 = sub_220182870();
    swift_release();
  }
  if (v6)
  {
    v19[0] = MEMORY[0x263F8EE78];
    sub_22015FBA0(0, v6, 0);
    uint64_t v7 = v19[0];
    unint64_t v9 = *(void *)(v19[0] + 16);
    unint64_t v8 = *(void *)(v19[0] + 24);
    unint64_t v10 = v9 + 1;
    if (v9 >= v8 >> 1)
    {
      sub_22015FBA0(v8 > 1, v9 + 1, 1);
      uint64_t v7 = v19[0];
    }
    *(void *)(v7 + 16) = v10;
    *(void *)(v7 + 8 * v9 + 32) = 0;
    if (v6 != 1)
    {
      v19[0] = v7;
      unint64_t v11 = *(void *)(v7 + 24);
      unint64_t v12 = v9 + 2;
      if (v10 >= v11 >> 1)
      {
        sub_22015FBA0(v11 > 1, v9 + 2, 1);
        uint64_t v7 = v19[0];
      }
      *(void *)(v7 + 16) = v12;
      *(void *)(v7 + 8 * v10 + 32) = 1;
      if (v6 != 2)
      {
        v19[0] = v7;
        unint64_t v13 = *(void *)(v7 + 24);
        unint64_t v14 = v9 + 3;
        if (v12 >= v13 >> 1)
        {
          sub_22015FBA0(v13 > 1, v9 + 3, 1);
          uint64_t v7 = v19[0];
        }
        *(void *)(v7 + 16) = v14;
        *(void *)(v7 + 8 * v12 + 32) = 2;
        if (v6 != 3)
        {
          v19[0] = v7;
          unint64_t v15 = *(void *)(v7 + 24);
          unint64_t v16 = v9 + 4;
          if (v14 >= v15 >> 1)
          {
            sub_22015FBA0(v15 > 1, v9 + 4, 1);
            uint64_t v7 = v19[0];
          }
          *(void *)(v7 + 16) = v16;
          *(void *)(v7 + 8 * v14 + 32) = 3;
          if (v6 != 4)
          {
            v19[0] = v7;
            unint64_t v17 = *(void *)(v7 + 24);
            if (v16 >= v17 >> 1)
            {
              sub_22015FBA0(v17 > 1, v9 + 5, 1);
              uint64_t v7 = v19[0];
            }
            *(void *)(v7 + 16) = v9 + 5;
            *(void *)(v7 + 8 * v16 + 32) = 4;
          }
        }
      }
    }
  }
  return v3;
}

uint64_t sub_220165F44(char a1, size_t a2)
{
  if ((a2 & 0x8000000000000000) != 0)
  {
    uint64_t result = sub_220182850();
    __break(1u);
  }
  else
  {
    if (!a2) {
      return MEMORY[0x263F8EE78];
    }
    uint64_t v4 = sub_220182530();
    *(void *)(v4 + 16) = a2;
    memset((void *)(v4 + 32), a1 & 1, a2);
    return v4;
  }
  return result;
}

uint64_t sub_220166024(char a1)
{
  if (a1) {
    return 0x7465626168706C61;
  }
  else {
    return 0xD000000000000015;
  }
}

uint64_t sub_220166068(char *a1, char *a2)
{
  return sub_220164014(*a1, *a2);
}

uint64_t sub_220166074()
{
  return sub_220164400();
}

uint64_t sub_22016607C()
{
  return sub_220164490();
}

uint64_t sub_220166084()
{
  return sub_2201646A8();
}

uint64_t sub_22016608C@<X0>(char *a1@<X8>)
{
  uint64_t v2 = sub_2201828C0();
  uint64_t result = swift_bridgeObjectRelease();
  if (v2 == 1) {
    char v4 = 1;
  }
  else {
    char v4 = 2;
  }
  if (!v2) {
    char v4 = 0;
  }
  *a1 = v4;
  return result;
}

uint64_t sub_2201660EC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_220166024(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_220166118()
{
  return sub_22016612C();
}

uint64_t sub_22016612C()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_2201661B8@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_22016BD54();
  sub_220181BF0();
  swift_release();
  uint64_t v4 = (void *)(v3
                + OBJC_IVAR____TtC20UserNotificationsKit44NotificationSummarizationOnboardingViewModel__isSummarizationEnabledByIndex);
  swift_beginAccess();
  *a2 = *v4;
  return swift_bridgeObjectRetain();
}

uint64_t sub_220166254()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_220166304(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = (void *)(a1 + *a3);
  swift_beginAccess();
  *uint64_t v4 = a2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_220166370(void *a1, unint64_t a2)
{
  if (a2 >> 62)
  {
LABEL_27:
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_220182870();
    if (v3) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v3 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v3)
    {
LABEL_3:
      uint64_t v4 = 0;
      unint64_t v37 = a2 & 0xC000000000000001;
      do
      {
        if (v37) {
          id v6 = (id)MEMORY[0x223C66AB0](v4, a2);
        }
        else {
          id v6 = *(id *)(a2 + 8 * v4 + 32);
        }
        uint64_t v7 = v6;
        uint64_t v8 = v4 + 1;
        if (__OFADD__(v4, 1))
        {
          __break(1u);
          goto LABEL_27;
        }
        id v9 = objc_msgSend(v6, sel_sourceIdentifier);
        uint64_t v10 = sub_220182460();
        uint64_t v12 = v11;

        id v13 = objc_msgSend(a1, sel_sourceIdentifier);
        uint64_t v14 = sub_220182460();
        uint64_t v16 = v15;

        if (v10 == v14 && v12 == v16)
        {
          swift_bridgeObjectRelease_n();
        }
        else
        {
          char v18 = sub_220182910();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v18 & 1) == 0) {
            goto LABEL_24;
          }
        }
        id v19 = objc_msgSend(v7, sel_displayName, v37);
        uint64_t v20 = sub_220182460();
        uint64_t v22 = v21;

        id v23 = objc_msgSend(a1, sel_displayName);
        uint64_t v24 = sub_220182460();
        uint64_t v26 = v25;

        if (v20 == v24 && v22 == v26)
        {
          swift_bridgeObjectRelease_n();
        }
        else
        {
          char v27 = sub_220182910();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v27 & 1) == 0)
          {
LABEL_24:

            goto LABEL_5;
          }
        }
        id v28 = objc_msgSend(v7, sel_bundlePath);
        uint64_t v29 = sub_220182460();
        uint64_t v31 = v30;

        id v32 = objc_msgSend(a1, sel_bundlePath);
        uint64_t v33 = sub_220182460();
        uint64_t v35 = v34;

        if (v29 == v33 && v31 == v35)
        {
          swift_bridgeObjectRelease();

          swift_bridgeObjectRelease();
          goto LABEL_29;
        }
        char v5 = sub_220182910();

        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (v5) {
          goto LABEL_29;
        }
LABEL_5:
        ++v4;
      }
      while (v8 != v3);
    }
  }
  uint64_t v4 = 0;
LABEL_29:
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_220166674(uint64_t a1, uint64_t a2)
{
  *(void *)(a1 + OBJC_IVAR____TtC20UserNotificationsKit44NotificationSummarizationOnboardingViewModel__iconCache) = a2;
  swift_retain();
  return swift_release();
}

uint64_t sub_2201666EC()
{
  uint64_t v1 = v0;
  sub_220182A10();
  sub_220182490();
  swift_bridgeObjectRelease();
  unint64_t v2 = *(void *)(v0 + OBJC_IVAR____TtC20UserNotificationsKit44NotificationSummarizationOnboardingViewModel_sources);
  if (v2 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_220182870();
    if (v3) {
      goto LABEL_3;
    }
LABEL_13:
    swift_bridgeObjectRelease();
    uint64_t v6 = MEMORY[0x263F8EE78];
    goto LABEL_14;
  }
  uint64_t v3 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (!v3) {
    goto LABEL_13;
  }
LABEL_3:
  *(void *)&long long v29 = MEMORY[0x263F8EE78];
  uint64_t result = sub_22015FB60(0, v3 & ~(v3 >> 63), 0);
  if (v3 < 0)
  {
    __break(1u);
    return result;
  }
  uint64_t v26 = v0;
  uint64_t v5 = 0;
  uint64_t v6 = v29;
  do
  {
    if ((v2 & 0xC000000000000001) != 0) {
      id v7 = (id)MEMORY[0x223C66AB0](v5, v2);
    }
    else {
      id v7 = *(id *)(v2 + 8 * v5 + 32);
    }
    uint64_t v8 = v7;
    id v9 = objc_msgSend(v7, sel_sourceIdentifier, v26);
    uint64_t v10 = sub_220182460();
    uint64_t v12 = v11;

    *(void *)&long long v29 = v6;
    unint64_t v14 = *(void *)(v6 + 16);
    unint64_t v13 = *(void *)(v6 + 24);
    if (v14 >= v13 >> 1)
    {
      sub_22015FB60(v13 > 1, v14 + 1, 1);
      uint64_t v6 = v29;
    }
    ++v5;
    *(void *)(v6 + 16) = v14 + 1;
    uint64_t v15 = v6 + 16 * v14;
    *(void *)(v15 + 32) = v10;
    *(void *)(v15 + 40) = v12;
  }
  while (v3 != v5);
  swift_bridgeObjectRelease();
  uint64_t v1 = v26;
LABEL_14:
  sub_2201829C0();
  uint64_t v16 = *(void *)(v6 + 16);
  if (v16)
  {
    uint64_t v17 = v6 + 40;
    do
    {
      swift_bridgeObjectRetain();
      sub_220182490();
      swift_bridgeObjectRelease();
      v17 += 16;
      --v16;
    }
    while (v16);
  }
  swift_bridgeObjectRelease();
  uint64_t v18 = sub_22016FB00(*(void *)(v1
                                + OBJC_IVAR____TtC20UserNotificationsKit44NotificationSummarizationOnboardingViewModel_categorizedSources));
  sub_2201702F0((uint64_t)v27, v18);
  swift_release();
  uint64_t v19 = *(void *)(v1
                  + OBJC_IVAR____TtC20UserNotificationsKit44NotificationSummarizationOnboardingViewModel_topSourcesIndexes);
  sub_2201829C0();
  uint64_t v20 = *(void *)(v19 + 16);
  if (v20)
  {
    uint64_t v21 = v19 + 32;
    do
    {
      v21 += 8;
      sub_2201829C0();
      --v20;
    }
    while (v20);
  }
  swift_getKeyPath();
  *(void *)&long long v29 = v1;
  sub_22016BD54();
  sub_220181BF0();
  swift_release();
  uint64_t v22 = (uint64_t *)(v1
                  + OBJC_IVAR____TtC20UserNotificationsKit44NotificationSummarizationOnboardingViewModel__isSummarizationEnabledByIndex);
  swift_beginAccess();
  uint64_t v23 = *v22;
  sub_2201829C0();
  uint64_t v24 = *(void *)(v23 + 16);
  if (v24)
  {
    uint64_t v25 = v23 + 32;
    do
    {
      ++v25;
      sub_2201829D0();
      --v24;
    }
    while (v24);
  }
  long long v31 = v27[2];
  long long v32 = v27[3];
  uint64_t v33 = v28;
  long long v29 = v27[0];
  long long v30 = v27[1];
  return sub_2201829F0();
}

uint64_t sub_220166A4C(uint64_t a1)
{
  uint64_t v2 = v1;
  swift_getObjectType();
  sub_22017286C(a1, (uint64_t)v20);
  if (!v20[3])
  {
    sub_22014ACAC((uint64_t)v20, &qword_267F0ABB0);
    goto LABEL_28;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_28:
    char v17 = 0;
    return v17 & 1;
  }
  unint64_t v4 = *(void *)(v1 + OBJC_IVAR____TtC20UserNotificationsKit44NotificationSummarizationOnboardingViewModel_sources);
  unint64_t v5 = *(void *)&v19[OBJC_IVAR____TtC20UserNotificationsKit44NotificationSummarizationOnboardingViewModel_sources];
  swift_bridgeObjectRetain();
  LOBYTE(v4) = sub_220171C04(v4, v5);
  swift_bridgeObjectRelease();
  if ((v4 & 1) == 0) {
    goto LABEL_27;
  }
  uint64_t v6 = *(void *)(v2
                 + OBJC_IVAR____TtC20UserNotificationsKit44NotificationSummarizationOnboardingViewModel_categorizedSources);
  uint64_t v7 = *(void *)&v19[OBJC_IVAR____TtC20UserNotificationsKit44NotificationSummarizationOnboardingViewModel_categorizedSources];
  swift_bridgeObjectRetain();
  LOBYTE(v6) = sub_220171F98(v6, v7);
  swift_bridgeObjectRelease();
  if ((v6 & 1) == 0) {
    goto LABEL_27;
  }
  if (*(unsigned char *)(v2
                + OBJC_IVAR____TtC20UserNotificationsKit44NotificationSummarizationOnboardingViewModel_sourcesSortMethod))
    unint64_t v8 = 0x7465626168706C61;
  else {
    unint64_t v8 = 0xD000000000000015;
  }
  if (*(unsigned char *)(v2
                + OBJC_IVAR____TtC20UserNotificationsKit44NotificationSummarizationOnboardingViewModel_sourcesSortMethod))
    unint64_t v9 = 0xEC0000006C616369;
  else {
    unint64_t v9 = 0x8000000220188340;
  }
  if (v19[OBJC_IVAR____TtC20UserNotificationsKit44NotificationSummarizationOnboardingViewModel_sourcesSortMethod]) {
    unint64_t v10 = 0x7465626168706C61;
  }
  else {
    unint64_t v10 = 0xD000000000000015;
  }
  if (v19[OBJC_IVAR____TtC20UserNotificationsKit44NotificationSummarizationOnboardingViewModel_sourcesSortMethod]) {
    unint64_t v11 = 0xEC0000006C616369;
  }
  else {
    unint64_t v11 = 0x8000000220188340;
  }
  if (v8 == v10 && v9 == v11)
  {
    swift_bridgeObjectRelease_n();
  }
  else
  {
    char v13 = sub_220182910();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v13 & 1) == 0) {
      goto LABEL_27;
    }
  }
  if (!sub_220166CF4(*(void **)(v2+ OBJC_IVAR____TtC20UserNotificationsKit44NotificationSummarizationOnboardingViewModel_topSourcesIndexes), *(void **)&v19[OBJC_IVAR____TtC20UserNotificationsKit44NotificationSummarizationOnboardingViewModel_topSourcesIndexes]))
  {
LABEL_27:

    goto LABEL_28;
  }
  swift_getKeyPath();
  v20[0] = v2;
  sub_22016BD54();
  sub_220181BF0();
  swift_release();
  unint64_t v14 = (uint64_t *)(v2
                  + OBJC_IVAR____TtC20UserNotificationsKit44NotificationSummarizationOnboardingViewModel__isSummarizationEnabledByIndex);
  swift_beginAccess();
  uint64_t v15 = *v14;
  swift_getKeyPath();
  swift_bridgeObjectRetain();
  sub_220181BF0();
  swift_release();
  uint64_t v16 = (uint64_t *)&v19[OBJC_IVAR____TtC20UserNotificationsKit44NotificationSummarizationOnboardingViewModel__isSummarizationEnabledByIndex];
  swift_beginAccess();
  char v17 = sub_220166D68(v15, *v16);

  swift_bridgeObjectRelease();
  return v17 & 1;
}

BOOL sub_220166CF4(void *a1, void *a2)
{
  uint64_t v2 = a1[2];
  if (v2 != a2[2]) {
    return 0;
  }
  if (!v2 || a1 == a2) {
    return 1;
  }
  if (a1[4] != a2[4]) {
    return 0;
  }
  if (v2 == 1) {
    return 1;
  }
  uint64_t v4 = v2 - 2;
  unint64_t v5 = a1 + 5;
  uint64_t v6 = a2 + 5;
  do
  {
    uint64_t v8 = *v5++;
    uint64_t v7 = v8;
    uint64_t v10 = *v6++;
    uint64_t v9 = v10;
    BOOL v12 = v4-- != 0;
    BOOL result = v7 == v9;
  }
  while (v7 == v9 && v12);
  return result;
}

uint64_t sub_220166D68(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2 != *(void *)(a2 + 16)) {
    return 0;
  }
  if (!v2 || a1 == a2) {
    return 1;
  }
  if (*(unsigned __int8 *)(a1 + 32) != *(unsigned __int8 *)(a2 + 32)) {
    return 0;
  }
  if (v2 != 1)
  {
    uint64_t v4 = v2 - 2;
    unint64_t v5 = (unsigned char *)(a1 + 33);
    uint64_t v6 = (unsigned char *)(a2 + 33);
    do
    {
      uint64_t v7 = v4;
      char v8 = *v5 ^ *v6;
      if (v8) {
        break;
      }
      --v4;
      ++v5;
      ++v6;
    }
    while (v7);
    LOBYTE(v2) = v8 ^ 1;
  }
  return v2 & 1;
}

id sub_220166E6C@<X0>(void *a1@<X8>)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v4 = *(void *)(v1 + OBJC_IVAR____TtC20UserNotificationsKit44NotificationSummarizationOnboardingViewModel_sources);
  uint64_t v5 = *(void *)(v1
                 + OBJC_IVAR____TtC20UserNotificationsKit44NotificationSummarizationOnboardingViewModel_categorizedSources);
  char v6 = *(unsigned char *)(v1
                + OBJC_IVAR____TtC20UserNotificationsKit44NotificationSummarizationOnboardingViewModel_sourcesSortMethod);
  uint64_t v7 = *(void *)(v1
                 + OBJC_IVAR____TtC20UserNotificationsKit44NotificationSummarizationOnboardingViewModel_topSourcesIndexes);
  swift_getKeyPath();
  sub_22016BD54();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_220181BF0();
  swift_release();
  char v8 = (uint64_t *)(v1
                 + OBJC_IVAR____TtC20UserNotificationsKit44NotificationSummarizationOnboardingViewModel__isSummarizationEnabledByIndex);
  swift_beginAccess();
  uint64_t v9 = *v8;
  objc_allocWithZone(ObjectType);
  swift_bridgeObjectRetain();
  id result = sub_220167008(v4, v5, v6, v7, v9);
  a1[3] = ObjectType;
  *a1 = result;
  return result;
}

id sub_220167008(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  *(void *)&v5[OBJC_IVAR____TtC20UserNotificationsKit44NotificationSummarizationOnboardingViewModel__selectedCategories] = MEMORY[0x263F8EE88];
  type metadata accessor for NotificationSourceIconCache();
  swift_allocObject();
  BOOL v12 = v5;
  *(void *)&v12[OBJC_IVAR____TtC20UserNotificationsKit44NotificationSummarizationOnboardingViewModel__iconCache] = sub_2201540F0(8);
  sub_220181C20();
  *(void *)&v12[OBJC_IVAR____TtC20UserNotificationsKit44NotificationSummarizationOnboardingViewModel_sources] = a1;
  *(void *)&v12[OBJC_IVAR____TtC20UserNotificationsKit44NotificationSummarizationOnboardingViewModel_categorizedSources] = a2;
  v12[OBJC_IVAR____TtC20UserNotificationsKit44NotificationSummarizationOnboardingViewModel_sourcesSortMethod] = a3 & 1;
  *(void *)&v12[OBJC_IVAR____TtC20UserNotificationsKit44NotificationSummarizationOnboardingViewModel_topSourcesIndexes] = a4;
  *(void *)&v12[OBJC_IVAR____TtC20UserNotificationsKit44NotificationSummarizationOnboardingViewModel__isSummarizationEnabledByIndex] = a5;

  v14.receiver = v12;
  v14.super_class = ObjectType;
  return objc_msgSendSuper2(&v14, sel_init);
}

void sub_220167128(void *a1)
{
  uint64_t v2 = *(void *)(v1
                 + OBJC_IVAR____TtC20UserNotificationsKit44NotificationSummarizationOnboardingViewModel_topSourcesIndexes);
  id v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFF980]), sel_init);
  uint64_t v4 = *(void *)(v2 + 16);
  if (v4)
  {
    swift_bridgeObjectRetain();
    uint64_t v5 = 0;
    do
    {
      uint64_t v6 = *(void *)(v2 + 8 * v5++ + 32);
      id v7 = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithInteger_, v6);
      objc_msgSend(v3, sel_addObject_, v7);
    }
    while (v4 != v5);
    swift_bridgeObjectRelease();
  }
  char v8 = (void *)sub_220182450();
  objc_msgSend(a1, sel_encodeObject_forKey_, v3, v8);

  uint64_t v9 = (void *)sub_220182450();
  swift_bridgeObjectRelease();
  uint64_t v10 = (void *)sub_220182450();
  objc_msgSend(a1, sel_encodeObject_forKey_, v9, v10);

  sub_22016776C(*(void *)(v37
                          + OBJC_IVAR____TtC20UserNotificationsKit44NotificationSummarizationOnboardingViewModel_sources));
  id v11 = objc_allocWithZone(MEMORY[0x263EFF8C0]);
  BOOL v12 = (void *)sub_2201824E0();
  swift_bridgeObjectRelease();
  id v13 = objc_msgSend(v11, sel_initWithArray_, v12);

  objc_super v14 = (void *)sub_220182450();
  objc_msgSend(a1, sel_encodeObject_forKey_, v13, v14);

  id v15 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFF9A0]), sel_init);
  uint64_t v16 = *(void *)(v37
                  + OBJC_IVAR____TtC20UserNotificationsKit44NotificationSummarizationOnboardingViewModel_categorizedSources);
  uint64_t v39 = v16 + 64;
  uint64_t v17 = 1 << *(unsigned char *)(v16 + 32);
  uint64_t v18 = -1;
  if (v17 < 64) {
    uint64_t v18 = ~(-1 << v17);
  }
  uint64_t v19 = v18 & *(void *)(v16 + 64);
  int64_t v20 = (unint64_t)(v17 + 63) >> 6;
  swift_bridgeObjectRetain();
  int64_t v21 = 0;
  while (1)
  {
    if (v19)
    {
      v19 &= v19 - 1;
      goto LABEL_8;
    }
    int64_t v23 = v21 + 1;
    if (__OFADD__(v21, 1))
    {
      __break(1u);
      goto LABEL_31;
    }
    if (v23 >= v20) {
      goto LABEL_25;
    }
    uint64_t v24 = *(void *)(v39 + 8 * v23);
    ++v21;
    if (!v24)
    {
      int64_t v21 = v23 + 1;
      if (v23 + 1 >= v20) {
        goto LABEL_25;
      }
      uint64_t v24 = *(void *)(v39 + 8 * v21);
      if (!v24)
      {
        int64_t v21 = v23 + 2;
        if (v23 + 2 >= v20) {
          goto LABEL_25;
        }
        uint64_t v24 = *(void *)(v39 + 8 * v21);
        if (!v24) {
          break;
        }
      }
    }
LABEL_24:
    uint64_t v19 = (v24 - 1) & v24;
LABEL_8:
    sub_220149EE0(0, (unint64_t *)&qword_267F0A9A0);
    swift_bridgeObjectRetain();
    uint64_t v22 = (void *)sub_2201824E0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    objc_msgSend(v15, sel___swift_setObject_forKeyedSubscript_, v22, sub_220182920());
    swift_bridgeObjectRelease();

    swift_unknownObjectRelease();
  }
  int64_t v25 = v23 + 3;
  if (v25 < v20)
  {
    uint64_t v24 = *(void *)(v39 + 8 * v25);
    if (!v24)
    {
      while (1)
      {
        int64_t v21 = v25 + 1;
        if (__OFADD__(v25, 1)) {
          break;
        }
        if (v21 >= v20) {
          goto LABEL_25;
        }
        uint64_t v24 = *(void *)(v39 + 8 * v21);
        ++v25;
        if (v24) {
          goto LABEL_24;
        }
      }
LABEL_31:
      __break(1u);
      JUMPOUT(0x22016775CLL);
    }
    int64_t v21 = v25;
    goto LABEL_24;
  }
LABEL_25:
  swift_release();
  id v26 = v15;
  char v27 = (void *)sub_220182450();
  objc_msgSend(a1, sel_encodeObject_forKey_, v26, v27);

  swift_getKeyPath();
  sub_22016BD54();
  sub_220181BF0();
  swift_release();
  uint64_t v28 = (uint64_t *)(v37
                  + OBJC_IVAR____TtC20UserNotificationsKit44NotificationSummarizationOnboardingViewModel__isSummarizationEnabledByIndex);
  swift_beginAccess();
  uint64_t v29 = *v28;
  id v30 = objc_allocWithZone(MEMORY[0x263EFF980]);
  swift_bridgeObjectRetain();
  id v31 = objc_msgSend(v30, sel_init);
  uint64_t v32 = *(void *)(v29 + 16);
  if (v32)
  {
    swift_bridgeObjectRetain();
    uint64_t v33 = 0;
    do
    {
      uint64_t v34 = *(unsigned __int8 *)(v29 + v33++ + 32);
      id v35 = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithBool_, v34);
      objc_msgSend(v31, sel_addObject_, v35);
    }
    while (v32 != v33);
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  unint64_t v36 = (void *)sub_220182450();
  objc_msgSend(a1, sel_encodeObject_forKey_, v31, v36);
}

uint64_t sub_22016776C(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_220182870();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  uint64_t v3 = MEMORY[0x263F8EE78];
  if (!v2) {
    return v3;
  }
  uint64_t v13 = MEMORY[0x263F8EE78];
  uint64_t result = sub_22015FBC0(0, v2 & ~(v2 >> 63), 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    if ((a1 & 0xC000000000000001) != 0)
    {
      for (uint64_t i = 0; i != v2; ++i)
      {
        MEMORY[0x223C66AB0](i, a1);
        sub_220149EE0(0, (unint64_t *)&qword_267F0A9A0);
        swift_dynamicCast();
        uint64_t v3 = v13;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_22015FBC0(0, *(void *)(v3 + 16) + 1, 1);
          uint64_t v3 = v13;
        }
        unint64_t v7 = *(void *)(v3 + 16);
        unint64_t v6 = *(void *)(v3 + 24);
        if (v7 >= v6 >> 1)
        {
          sub_22015FBC0(v6 > 1, v7 + 1, 1);
          uint64_t v3 = v13;
        }
        *(void *)(v3 + 16) = v7 + 1;
        sub_22017285C(v12, (_OWORD *)(v3 + 32 * v7 + 32));
      }
    }
    else
    {
      char v8 = (id *)(a1 + 32);
      sub_220149EE0(0, (unint64_t *)&qword_267F0A9A0);
      do
      {
        id v9 = *v8;
        swift_dynamicCast();
        uint64_t v3 = v13;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_22015FBC0(0, *(void *)(v3 + 16) + 1, 1);
          uint64_t v3 = v13;
        }
        unint64_t v11 = *(void *)(v3 + 16);
        unint64_t v10 = *(void *)(v3 + 24);
        if (v11 >= v10 >> 1)
        {
          sub_22015FBC0(v10 > 1, v11 + 1, 1);
          uint64_t v3 = v13;
        }
        *(void *)(v3 + 16) = v11 + 1;
        sub_22017285C(v12, (_OWORD *)(v3 + 32 * v11 + 32));
        ++v8;
        --v2;
      }
      while (v2);
    }
    return v3;
  }
  __break(1u);
  return result;
}

uint64_t sub_220167A38(void *a1)
{
  swift_getObjectType();
  *(void *)&v1[OBJC_IVAR____TtC20UserNotificationsKit44NotificationSummarizationOnboardingViewModel__selectedCategories] = MEMORY[0x263F8EE88];
  type metadata accessor for NotificationSourceIconCache();
  swift_allocObject();
  uint64_t v3 = v1;
  *(char **)((char *)v3 + OBJC_IVAR____TtC20UserNotificationsKit44NotificationSummarizationOnboardingViewModel__iconCache) = (char *)sub_2201540F0(8);
  uint64_t v4 = (char **)((char *)v3
               + OBJC_IVAR____TtC20UserNotificationsKit44NotificationSummarizationOnboardingViewModel___observationRegistrar);
  sub_220181C20();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F0A970);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_220186B60;
  uint64_t v6 = sub_220149EE0(0, &qword_267F0A978);
  *(void *)(v5 + 32) = v6;
  *(void *)(v5 + 40) = sub_220149EE0(0, (unint64_t *)&unk_267F0A980);
  int v51 = a1;
  sub_220182670();
  swift_bridgeObjectRelease();
  if (!v55)
  {
    sub_22014ACAC((uint64_t)v54, &qword_267F0ABB0);
    goto LABEL_15;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_15:
    if (qword_267F09C80 != -1) {
      swift_once();
    }
    uint64_t v15 = sub_220181C80();
    __swift_project_value_buffer(v15, (uint64_t)qword_267F0C120);
    uint64_t v16 = sub_220181C60();
    os_log_type_t v17 = sub_2201825F0();
    if (os_log_type_enabled(v16, v17))
    {
      uint64_t v18 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v18 = 0;
      _os_log_impl(&dword_22012C000, v16, v17, "NotificationSummarizationOnboardingViewModel decoding: Cannot get 'topSourcesIndexesNSArray'", v18, 2u);
      MEMORY[0x223C676F0](v18, -1, -1);
    }

    goto LABEL_20;
  }
  uint64_t v47 = v6;
  unint64_t v7 = (unint64_t)objc_msgSend(v53, sel_count);
  if ((v7 & 0x8000000000000000) != 0)
  {
    __break(1u);

    uint64_t v4 = v49;
    goto LABEL_20;
  }
  char v8 = (char *)v7;
  char v50 = v4;
  uint64_t v48 = v3;
  if (v7)
  {
    id v9 = 0;
    unint64_t v10 = (void *)MEMORY[0x263F8EE78];
    uint64_t v4 = &selRef_readyDestinations;
    uint64_t v3 = &selRef_readyDestinations;
    while (1)
    {
      if (v8 == v9)
      {
        __break(1u);

        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_22014ACAC((uint64_t)v54, &qword_267F0ABB0);
        swift_bridgeObjectRelease();
        goto LABEL_20;
      }
      id v11 = objc_msgSend(v53, sel_objectAtIndexedSubscript_, v9);
      sub_2201826D0();
      swift_unknownObjectRelease();
      if (!swift_dynamicCast()) {
        break;
      }
      id v12 = objc_msgSend(v53, sel_integerValue);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        unint64_t v10 = sub_22016C150(0, v10[2] + 1, 1, v10);
      }
      unint64_t v14 = v10[2];
      unint64_t v13 = v10[3];
      if (v14 >= v13 >> 1) {
        unint64_t v10 = sub_22016C150((void *)(v13 > 1), v14 + 1, 1, v10);
      }
      ++v9;
      id v10[2] = v14 + 1;
      v10[v14 + 4] = v12;

      if (v8 == v9) {
        goto LABEL_22;
      }
    }
    swift_bridgeObjectRelease();
    if (qword_267F09C80 != -1) {
      swift_once();
    }
    uint64_t v25 = sub_220181C80();
    __swift_project_value_buffer(v25, (uint64_t)qword_267F0C120);
    id v26 = v53;
    char v27 = sub_220181C60();
    os_log_type_t v28 = sub_2201825F0();
    uint64_t v3 = v48;
    if (os_log_type_enabled(v27, v28))
    {
      uint64_t v29 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v29 = 134349056;
      v54[0] = objc_msgSend(v26, sel_count);
      sub_2201826B0();

      _os_log_impl(&dword_22012C000, v27, v28, "NotificationSummarizationOnboardingViewModel decoding: Cannot create 'topSourcesIndexes' from 'topSourcesIndexesNSArray' with count '%{public}ld'", v29, 0xCu);
      MEMORY[0x223C676F0](v29, -1, -1);
      goto LABEL_30;
    }

    uint64_t v4 = v50;
    goto LABEL_20;
  }
LABEL_22:
  sub_220149EE0(0, (unint64_t *)&unk_267F0A990);
  uint64_t v21 = sub_220182660();
  uint64_t v3 = v48;
  uint64_t v4 = v50;
  if (!v21)
  {
    swift_bridgeObjectRelease();
    if (qword_267F09C80 != -1) {
      swift_once();
    }
    uint64_t v31 = sub_220181C80();
    __swift_project_value_buffer(v31, (uint64_t)qword_267F0C120);
    uint64_t v32 = sub_220181C60();
    os_log_type_t v33 = sub_2201825F0();
    if (os_log_type_enabled(v32, v33))
    {
      uint64_t v34 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v34 = 0;
      _os_log_impl(&dword_22012C000, v32, v33, "NotificationSummarizationOnboardingViewModel decoding: Cannot get 'sortMethodRawValue'", v34, 2u);
      MEMORY[0x223C676F0](v34, -1, -1);

LABEL_44:
      objc_super v41 = v51;
LABEL_50:

      goto LABEL_20;
    }

LABEL_49:
    objc_super v41 = v53;
    goto LABEL_50;
  }
  uint64_t v22 = (void *)v21;
  sub_220182460();
  uint64_t v23 = sub_2201828C0();
  swift_bridgeObjectRelease();
  if (!v23)
  {
    uint64_t v24 = a1;
    goto LABEL_37;
  }
  uint64_t v24 = a1;
  if (v23 != 1)
  {
    swift_bridgeObjectRelease();
    if (qword_267F09C80 != -1) {
      swift_once();
    }
    uint64_t v36 = sub_220181C80();
    __swift_project_value_buffer(v36, (uint64_t)qword_267F0C120);
    id v37 = v22;
    uint64_t v32 = sub_220181C60();
    os_log_type_t v38 = sub_2201825F0();
    if (os_log_type_enabled(v32, v38))
    {
      uint64_t v39 = (uint8_t *)swift_slowAlloc();
      char v52 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v39 = 138543362;
      uint64_t v4 = v50;
      v54[0] = v37;
      id v40 = v37;
      uint64_t v3 = v48;
      sub_2201826B0();
      *char v52 = v22;

      _os_log_impl(&dword_22012C000, v32, v38, "NotificationSummarizationOnboardingViewModel decoding: Cannot create 'sortMethod' from 'sortMethodRawValue' with value '%{public}@'", v39, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_267F0A250);
      swift_arrayDestroy();
      MEMORY[0x223C676F0](v52, -1, -1);
      MEMORY[0x223C676F0](v39, -1, -1);

      goto LABEL_44;
    }

    goto LABEL_49;
  }
LABEL_37:
  uint64_t v35 = swift_allocObject();
  *(_OWORD *)(v35 + 16) = xmmword_220186B60;
  *(void *)(v35 + 32) = v47;
  *(void *)(v35 + 40) = sub_220149EE0(0, (unint64_t *)&qword_267F0A9A0);
  sub_220182670();
  swift_bridgeObjectRelease();
  if (!v55)
  {

    swift_bridgeObjectRelease();
    sub_22014ACAC((uint64_t)v54, &qword_267F0ABB0);
LABEL_20:
    swift_bridgeObjectRelease();
    swift_release();
    uint64_t v19 = sub_220181C30();
    (*(void (**)(char **, uint64_t))(*(void *)(v19 - 8) + 8))(v4, v19);
    goto LABEL_21;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {

    swift_bridgeObjectRelease();
    goto LABEL_20;
  }
  v54[0] = 0;
  sub_2201824F0();
  swift_bridgeObjectRelease();
  if (qword_267F09C80 != -1) {
    swift_once();
  }
  uint64_t v42 = sub_220181C80();
  __swift_project_value_buffer(v42, (uint64_t)qword_267F0C120);
  id v26 = v53;
  char v27 = sub_220181C60();
  os_log_type_t v43 = sub_2201825F0();
  if (!os_log_type_enabled(v27, v43))
  {

    goto LABEL_20;
  }
  int v44 = (uint8_t *)swift_slowAlloc();
  *(_DWORD *)int v44 = 134349056;
  v54[0] = objc_msgSend(v26, sel_count);
  sub_2201826B0();

  _os_log_impl(&dword_22012C000, v27, v43, "NotificationSummarizationOnboardingViewModel decoding: Cannot create 'sources' from 'sourcesNSArray' with count '%{public}ld'", v44, 0xCu);
  MEMORY[0x223C676F0](v44, -1, -1);

LABEL_30:
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v30 = sub_220181C30();
  (*(void (**)(char **, uint64_t))(*(void *)(v30 - 8) + 8))(v50, v30);
LABEL_21:

  swift_deallocPartialClassInstance();
  return 0;
}

uint64_t sub_220168F4C(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v37 = a1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F0A940);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (uint64_t *)((char *)&v36 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v7 = (void *)sub_220182450();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F0A948);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_220186B60;
  *(void *)(inited + 32) = 0x656D6F6374756FLL;
  *(void *)(inited + 40) = 0xE700000000000000;
  *(void *)(inited + 48) = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithUnsignedInteger_, a1);
  *(void *)(inited + 56) = 0x69726F6765746163;
  *(void *)(inited + 64) = 0xEA00000000007365;
  swift_getKeyPath();
  uint64_t v44 = v1;
  sub_22016BD54();
  sub_220181BF0();
  swift_release();
  id v9 = (uint64_t *)(v1
                 + OBJC_IVAR____TtC20UserNotificationsKit44NotificationSummarizationOnboardingViewModel__selectedCategories);
  swift_beginAccess();
  uint64_t v10 = swift_bridgeObjectRetain();
  uint64_t v11 = sub_220164E80(v10);
  swift_bridgeObjectRelease();
  uint64_t v43 = v11;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267F0A950);
  sub_2201727F4();
  sub_220182440();
  swift_bridgeObjectRelease();
  id v12 = objc_allocWithZone(NSString);
  unint64_t v13 = (void *)sub_220182450();
  swift_bridgeObjectRelease();
  id v14 = objc_msgSend(v12, sel_initWithString_, v13);

  *(void *)(inited + 72) = v14;
  sub_220164AB0(inited);
  sub_220149EE0(0, &qword_267F0A960);
  uint64_t v15 = (void *)sub_220182420();
  swift_bridgeObjectRelease();
  AnalyticsSendEvent();

  uint64_t v16 = v37;
  uint64_t v17 = 0;
  if (v16 == 1)
  {
    swift_getKeyPath();
    uint64_t v43 = v2;
    sub_220181BF0();
    swift_release();
    uint64_t v18 = *v9;
    int64_t v19 = *(void *)(*v9 + 16);
    uint64_t v17 = MEMORY[0x263F8EE78];
    if (v19)
    {
      uint64_t v43 = MEMORY[0x263F8EE78];
      swift_bridgeObjectRetain();
      sub_22015FB60(0, v19, 0);
      uint64_t v17 = v43;
      int64_t v20 = sub_22017016C(v18);
      int v22 = v21;
      char v24 = v23 & 1;
      objc_super v41 = v6;
      uint64_t v42 = v18 + 56;
      unint64_t v38 = (unint64_t)"communicationAndSocial";
      unint64_t v39 = (unint64_t)" text)";
      uint64_t v40 = v18;
      do
      {
        if (v20 < 0 || v20 >= 1 << *(unsigned char *)(v18 + 32))
        {
          __break(1u);
LABEL_19:
          __break(1u);
LABEL_20:
          __break(1u);
          JUMPOUT(0x22016948CLL);
        }
        if (((*(void *)(v42 + (((unint64_t)v20 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v20) & 1) == 0) {
          goto LABEL_19;
        }
        if (*(_DWORD *)(v18 + 36) != v22) {
          goto LABEL_20;
        }
        uint64_t v25 = *(unsigned __int8 *)(*(void *)(v18 + 48) + v20);
        unint64_t v26 = 0xD000000000000016;
        unint64_t v27 = v39 | 0x8000000000000000;
        switch(v25)
        {
          case 1:
            unint64_t v27 = v38 | 0x8000000000000000;
            unint64_t v26 = 0xD000000000000014;
            break;
          case 2:
            unint64_t v27 = 0xE500000000000000;
            unint64_t v26 = 0x726568746FLL;
            break;
          case 3:
            unint64_t v27 = 0xE400000000000000;
            unint64_t v26 = 1701736302;
            break;
          default:
            break;
        }
        uint64_t v43 = v17;
        unint64_t v29 = *(void *)(v17 + 16);
        unint64_t v28 = *(void *)(v17 + 24);
        if (v29 >= v28 >> 1)
        {
          sub_22015FB60(v28 > 1, v29 + 1, 1);
          uint64_t v17 = v43;
        }
        *(void *)(v17 + 16) = v29 + 1;
        uint64_t v30 = v17 + 16 * v29;
        *(void *)(v30 + 32) = v26;
        *(void *)(v30 + 40) = v27;
        uint64_t v18 = v40;
        int64_t v31 = sub_22017020C(v20, v22, v24 & 1, v40);
        int64_t v20 = v31;
        int v22 = v32;
        char v24 = v33 & 1;
        --v19;
        uint64_t v6 = v41;
      }
      while (v19);
      sub_220172850(v31, v32, v33 & 1);
      swift_bridgeObjectRelease();
    }
    uint64_t v16 = v37;
  }
  uint64_t v43 = sub_22017E250();
  swift_bridgeObjectRetain();
  sub_220177FD8(v16, v17, v6);
  uint64_t v34 = type metadata accessor for OnboardingDefaults.ShownExperienceRecord();
  (*(void (**)(void *, void, uint64_t, uint64_t))(*(void *)(v34 - 8) + 56))(v6, 0, 1, v34);
  sub_220172DC4((uint64_t)v6, 0);
  sub_220177DB4();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void sub_22016949C(uint64_t a1)
{
  if (a1)
  {
    v16[3] = &type metadata for NotificationsUIFeatureFlags;
    v16[4] = sub_220160FDC();
    uint64_t v2 = swift_allocObject();
    v16[0] = v2;
    *(void *)(v2 + 16) = "NotificationsUI";
    *(void *)(v2 + 24) = 15;
    *(unsigned char *)(v2 + 32) = 2;
    *(void *)(v2 + 40) = "GreymatterOnboardingWithAppCategorization";
    *(void *)(v2 + 48) = 41;
    *(unsigned char *)(v2 + 56) = 2;
    char v3 = sub_220181C40();
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v16);
    if (v3) {
      char v4 = sub_2201698C8(a1);
    }
    else {
      char v4 = sub_22016A14C(a1);
    }
    char v5 = v4;
    id v6 = objc_msgSend(self, sel_currentNotificationSettingsCenter);
    id v7 = objc_msgSend(v6, sel_notificationSystemSettings);
    objc_msgSend(v7, sel_mutableCopy);

    sub_2201826D0();
    swift_unknownObjectRelease();
    sub_220149EE0(0, &qword_267F0A930);
    if (swift_dynamicCast())
    {
      if (v5) {
        uint64_t v8 = 2;
      }
      else {
        uint64_t v8 = 1;
      }
      objc_msgSend(v15, sel_setSummarizationSetting_, v8);
      id v9 = objc_msgSend(v6, sel_setNotificationSystemSettings_, v15);
      MEMORY[0x270FA5388](v9);
      uint64_t v10 = swift_bridgeObjectRetain();
      sub_220172610(v10, (void (*)(uint64_t, uint64_t, id))sub_22016BDBC);

      swift_bridgeObjectRelease_n();
    }
    else
    {
      swift_bridgeObjectRelease();
      if (qword_267F09C80 != -1) {
        swift_once();
      }
      uint64_t v11 = sub_220181C80();
      __swift_project_value_buffer(v11, (uint64_t)qword_267F0C120);
      id v12 = sub_220181C60();
      os_log_type_t v13 = sub_220182600();
      if (os_log_type_enabled(v12, v13))
      {
        id v14 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)id v14 = 0;
        _os_log_impl(&dword_22012C000, v12, v13, "Cannot get a mutable copy of UNNotificationSystemSettings", v14, 2u);
        MEMORY[0x223C676F0](v14, -1, -1);
      }
    }
  }
}

id sub_2201697C0()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_2201698C8(uint64_t a1)
{
  uint64_t v2 = v1;
  char v3 = &OBJC_PROTOCOL___NSCoding;
  if (a1 == 1)
  {
    swift_getKeyPath();
    sub_22016BD54();
    sub_220181BF0();
    swift_release();
    char v4 = (uint64_t *)(v1
                   + OBJC_IVAR____TtC20UserNotificationsKit44NotificationSummarizationOnboardingViewModel__selectedCategories);
    swift_beginAccess();
    uint64_t v5 = *v4;
    if (*(void *)(v5 + 16))
    {
      sub_2201829B0();
      swift_bridgeObjectRetain();
      sub_220182490();
      uint64_t v6 = sub_220182A00();
      uint64_t v7 = -1 << *(unsigned char *)(v5 + 32);
      unint64_t v8 = v6 & ~v7;
      if ((*(void *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8))
      {
        uint64_t v9 = ~v7;
        while (2)
        {
          switch(*(unsigned char *)(*(void *)(v5 + 48) + v8))
          {
            case 3:
              swift_bridgeObjectRelease();
              char v58 = 0;
              break;
            default:
              char v10 = sub_220182910();
              swift_bridgeObjectRelease();
              if ((v10 & 1) == 0)
              {
                unint64_t v8 = (v8 + 1) & v9;
                if ((*(void *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8)) {
                  continue;
                }
              }
              char v58 = v10 ^ 1;
              break;
          }
          break;
        }
        uint64_t v2 = v59;
        char v3 = &OBJC_PROTOCOL___NSCoding;
      }
      else
      {
        char v58 = 1;
      }
      swift_bridgeObjectRelease();
    }
    else
    {
      char v58 = 1;
    }
  }
  else
  {
    char v58 = 0;
  }
  swift_getKeyPath();
  sub_22016BD54();
  sub_220181BF0();
  swift_release();
  uint64_t v11 = (uint64_t *)&v3[31].name[v2];
  swift_beginAccess();
  uint64_t v62 = v11;
  uint64_t v12 = *v11;
  if (!*(void *)(v12 + 16))
  {
    char v60 = 0;
    goto LABEL_24;
  }
  sub_2201829B0();
  swift_bridgeObjectRetain();
  sub_220182490();
  uint64_t v13 = sub_220182A00();
  uint64_t v14 = -1 << *(unsigned char *)(v12 + 32);
  unint64_t v15 = v13 & ~v14;
  if ((*(void *)(v12 + 56 + ((v15 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v15))
  {
    uint64_t v16 = ~v14;
    while (2)
    {
      switch(*(unsigned char *)(*(void *)(v12 + 48) + v15))
      {
        case 3:
          goto LABEL_63;
        default:
          char v17 = sub_220182910();
          swift_bridgeObjectRelease();
          char v60 = v17;
          if ((v17 & 1) == 0)
          {
            unint64_t v15 = (v15 + 1) & v16;
            if ((*(void *)(v12 + 56 + ((v15 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v15)) {
              continue;
            }
          }
          break;
      }
      break;
    }
  }
  else
  {
    char v60 = 0;
  }
LABEL_23:
  swift_bridgeObjectRelease();
LABEL_24:
  uint64_t v18 = 0;
  uint64_t v19 = *(void *)(v2
                  + OBJC_IVAR____TtC20UserNotificationsKit44NotificationSummarizationOnboardingViewModel_categorizedSources);
  uint64_t v65 = (void *)MEMORY[0x263F8EE80];
  uint64_t v61 = v19;
  do
  {
    unsigned __int8 v20 = *((unsigned char *)&unk_26D1FEC58 + v18 + 32);
    swift_getKeyPath();
    sub_220181BF0();
    swift_release();
    uint64_t v21 = *v62;
    swift_bridgeObjectRetain();
    unsigned __int8 v22 = sub_220164BCC(v20, v21);
    swift_bridgeObjectRelease();
    if (*(void *)(v19 + 16))
    {
      unint64_t v23 = sub_22017A15C(v20);
      unint64_t v24 = MEMORY[0x263F8EE78];
      if (v25)
      {
        unint64_t v24 = *(void *)(*(void *)(v19 + 56) + 8 * v23);
        swift_bridgeObjectRetain();
      }
    }
    else
    {
      unint64_t v24 = MEMORY[0x263F8EE78];
    }
    uint64_t v66 = v18;
    if (v24 >> 62)
    {
      swift_bridgeObjectRetain_n();
      uint64_t v26 = sub_220182870();
      swift_bridgeObjectRelease();
      if (v26)
      {
LABEL_32:
        unint64_t v27 = v24 & 0xC000000000000001;
        uint64_t v28 = 1;
        if ((v60 | v22)) {
          uint64_t v28 = 2;
        }
        uint64_t v64 = v28;
        uint64_t v29 = 0;
        if (!v27)
        {
LABEL_39:
          id v30 = *(id *)(v24 + 8 * v29 + 32);
          goto LABEL_40;
        }
        while (1)
        {
          id v30 = (id)MEMORY[0x223C66AB0](v29, v24);
LABEL_40:
          int64_t v31 = v30;
          uint64_t v32 = v29 + 1;
          if (__OFADD__(v29, 1)) {
            break;
          }
          id v33 = objc_msgSend(v30, sel_sourceSettings);
          id v34 = objc_msgSend(v33, sel_notificationSettings);

          objc_msgSend(v34, sel_mutableCopy);
          sub_2201826D0();
          swift_unknownObjectRelease();
          sub_220149EE0(0, &qword_267F0A938);
          if (swift_dynamicCast())
          {
            objc_msgSend(v67, sel_setSummarizationSetting_, v64);
            id v39 = objc_msgSend(v31, sel_sourceIdentifier);
            uint64_t v40 = sub_220182460();
            uint64_t v42 = v41;

            char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
            uint64_t v63 = v40;
            unint64_t v45 = sub_22017A2C8(v40, v42);
            uint64_t v46 = v65[2];
            BOOL v47 = (v44 & 1) == 0;
            uint64_t v48 = v46 + v47;
            if (__OFADD__(v46, v47))
            {
              __break(1u);
LABEL_66:
              __break(1u);
LABEL_67:
              sub_220182940();
              __break(1u);
              JUMPOUT(0x22016A12CLL);
            }
            char v49 = v44;
            if (v65[3] >= v48)
            {
              if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
                sub_22017D5D4();
              }
            }
            else
            {
              sub_22017B624(v48, isUniquelyReferenced_nonNull_native);
              unint64_t v50 = sub_22017A2C8(v63, v42);
              if ((v49 & 1) != (v51 & 1)) {
                goto LABEL_67;
              }
              unint64_t v45 = v50;
            }
            if (v49)
            {
              uint64_t v52 = v65[7];

              *(void *)(v52 + 8 * v45) = v67;
            }
            else
            {
              v65[(v45 >> 6) + 8] |= 1 << v45;
              uint64_t v53 = (uint64_t *)(v65[6] + 16 * v45);
              *uint64_t v53 = v63;
              v53[1] = v42;
              *(void *)(v65[7] + 8 * v45) = v67;
              uint64_t v54 = v65[2];
              BOOL v55 = __OFADD__(v54, 1);
              uint64_t v56 = v54 + 1;
              if (v55) {
                goto LABEL_66;
              }
              v65[2] = v56;
              swift_bridgeObjectRetain();
            }

            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            uint64_t v2 = v59;
            if (v32 == v26) {
              goto LABEL_25;
            }
            uint64_t v29 = v32;
            if (!v27) {
              goto LABEL_39;
            }
          }
          else
          {
            if (qword_267F09C80 != -1) {
              swift_once();
            }
            uint64_t v35 = sub_220181C80();
            __swift_project_value_buffer(v35, (uint64_t)qword_267F0C120);
            uint64_t v36 = sub_220181C60();
            os_log_type_t v37 = sub_2201825F0();
            if (os_log_type_enabled(v36, v37))
            {
              unint64_t v38 = (uint8_t *)swift_slowAlloc();
              *(_WORD *)unint64_t v38 = 0;
              _os_log_impl(&dword_22012C000, v36, v37, "Cannot get a mutable copy of UNNotificationSettings", v38, 2u);
              MEMORY[0x223C676F0](v38, -1, -1);
            }

            ++v29;
            if (v32 == v26) {
              goto LABEL_25;
            }
            if (!v27) {
              goto LABEL_39;
            }
          }
        }
        __break(1u);
LABEL_63:
        swift_bridgeObjectRelease();
        char v60 = 1;
        goto LABEL_23;
      }
    }
    else
    {
      uint64_t v26 = *(void *)((v24 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      if (v26) {
        goto LABEL_32;
      }
    }
LABEL_25:
    uint64_t v18 = v66 + 1;
    swift_bridgeObjectRelease_n();
    uint64_t v19 = v61;
  }
  while (v66 != 3);
  return v58 & 1;
}

uint64_t sub_22016A14C(uint64_t a1)
{
  uint64_t v2 = a1;
  if (a1 != 1) {
    return v2 == 1;
  }
  uint64_t v3 = v1;
  swift_getKeyPath();
  sub_22016BD54();
  sub_220181BF0();
  swift_release();
  uint64_t v4 = v1
     + OBJC_IVAR____TtC20UserNotificationsKit44NotificationSummarizationOnboardingViewModel__isSummarizationEnabledByIndex;
  swift_beginAccess();
  unint64_t v5 = *(void *)(*(void *)v4 + 16);
  if (!v5) {
    return v2 == 1;
  }
  uint64_t v6 = *(void *)(v3 + OBJC_IVAR____TtC20UserNotificationsKit44NotificationSummarizationOnboardingViewModel_sources);
  unint64_t v7 = v6 & 0xC000000000000001;
  if ((v6 & 0xC000000000000001) == 0 && v5 > *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
    goto LABEL_36;
  }
  uint64_t v47 = 1;
  uint64_t v8 = swift_bridgeObjectRetain();
  uint64_t v9 = 0;
  char v10 = (void *)MEMORY[0x263F8EE80];
  uint64_t v11 = &selRef_readyDestinations;
  unint64_t v51 = v5;
  unint64_t v49 = v6 & 0xC000000000000001;
  uint64_t v50 = v6;
  uint64_t v48 = v8;
  while (1)
  {
    int v12 = *(unsigned __int8 *)(v8 + v9 + 32);
    uint64_t v13 = v8;
    unint64_t v14 = v5;
    uint64_t v15 = v6;
    if (v7) {
      id v16 = (id)MEMORY[0x223C66AB0](v9, v6);
    }
    else {
      id v16 = *(id *)(v6 + 8 * v9 + 32);
    }
    char v17 = v11[443];
    uint64_t v18 = v16;
    id v19 = objc_msgSend(v16, v17, v47);
    id v20 = objc_msgSend(v19, sel_notificationSettings);

    objc_msgSend(v20, sel_mutableCopy);
    sub_2201826D0();
    swift_unknownObjectRelease();
    sub_220149EE0(0, &qword_267F0A938);
    if (!swift_dynamicCast())
    {
      if (qword_267F09C80 != -1) {
        swift_once();
      }
      uint64_t v41 = sub_220181C80();
      __swift_project_value_buffer(v41, (uint64_t)qword_267F0C120);
      uint64_t v42 = sub_220181C60();
      os_log_type_t v43 = sub_2201825F0();
      if (os_log_type_enabled(v42, v43))
      {
        char v44 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)char v44 = 0;
        _os_log_impl(&dword_22012C000, v42, v43, "Cannot get a mutable copy of UNNotificationSettings", v44, 2u);
        MEMORY[0x223C676F0](v44, -1, -1);
      }

      unint64_t v5 = v14;
      uint64_t v6 = v15;
      uint64_t v8 = v13;
      goto LABEL_7;
    }
    uint64_t v21 = v12 ? 2 : 1;
    objc_msgSend(v52, sel_setSummarizationSetting_, v21);
    unsigned __int8 v22 = v18;
    id v23 = objc_msgSend(v18, sel_sourceIdentifier);
    uint64_t v24 = sub_220182460();
    uint64_t v26 = v25;

    id v27 = v52;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    unint64_t v30 = sub_22017A2C8(v24, v26);
    uint64_t v31 = v10[2];
    BOOL v32 = (v29 & 1) == 0;
    uint64_t v33 = v31 + v32;
    if (__OFADD__(v31, v32)) {
      break;
    }
    char v34 = v29;
    if (v10[3] >= v33)
    {
      if (isUniquelyReferenced_nonNull_native)
      {
        if ((v29 & 1) == 0) {
          goto LABEL_19;
        }
      }
      else
      {
        sub_22017D5D4();
        if ((v34 & 1) == 0) {
          goto LABEL_19;
        }
      }
    }
    else
    {
      sub_22017B624(v33, isUniquelyReferenced_nonNull_native);
      unint64_t v35 = sub_22017A2C8(v24, v26);
      if ((v34 & 1) != (v36 & 1)) {
        goto LABEL_37;
      }
      unint64_t v30 = v35;
      if ((v34 & 1) == 0)
      {
LABEL_19:
        v10[(v30 >> 6) + 8] |= 1 << v30;
        os_log_type_t v37 = (uint64_t *)(v10[6] + 16 * v30);
        *os_log_type_t v37 = v24;
        v37[1] = v26;
        *(void *)(v10[7] + 8 * v30) = v27;
        uint64_t v38 = v10[2];
        BOOL v39 = __OFADD__(v38, 1);
        uint64_t v40 = v38 + 1;
        if (v39) {
          goto LABEL_35;
        }
        id v10[2] = v40;
        swift_bridgeObjectRetain();
        goto LABEL_28;
      }
    }
    uint64_t v45 = v10[7];

    *(void *)(v45 + 8 * v30) = v27;
LABEL_28:

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v8 = v48;
    unint64_t v7 = v49;
    uint64_t v6 = v50;
    unint64_t v5 = v51;
LABEL_7:
    uint64_t v11 = &selRef_readyDestinations;
    if (v5 == ++v9)
    {
      swift_bridgeObjectRelease();
      uint64_t v2 = v47;
      return v2 == 1;
    }
  }
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
LABEL_37:
  uint64_t result = sub_220182940();
  __break(1u);
  return result;
}

uint64_t sub_22016A5BC()
{
  uint64_t v1 = swift_allocObject();
  *(void *)(v1 + 16) = 0;
  uint64_t v39 = v1 + 16;
  uint64_t v2 = swift_allocObject();
  *(void *)(v2 + 16) = 0;
  if (qword_267F09C80 != -1) {
    swift_once();
  }
  uint64_t v40 = v1;
  uint64_t v3 = sub_220181C80();
  uint64_t v35 = __swift_project_value_buffer(v3, (uint64_t)qword_267F0C120);
  uint64_t v4 = sub_220181C60();
  os_log_type_t v5 = sub_2201825E0();
  uint64_t v34 = v0;
  uint64_t v41 = v2;
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    uint64_t v7 = swift_slowAlloc();
    uint64_t aBlock = v7;
    *(_DWORD *)uint64_t v6 = 136446210;
    uint64_t v43 = sub_220149888(0xD000000000000016, 0x80000002201897D0, &aBlock);
    sub_2201826B0();
    _os_log_impl(&dword_22012C000, v4, v5, "[Fetch %{public}s] Starting", v6, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x223C676F0](v7, -1, -1);
    MEMORY[0x223C676F0](v6, -1, -1);
  }

  id v8 = objc_msgSend((id)BiomeLibrary(), sel_Notification);
  swift_unknownObjectRelease();
  id v37 = objc_msgSend(v8, sel_Usage);
  swift_unknownObjectRelease();
  unint64_t v33 = (unint64_t)"Swift/Array.swift";
  uint64_t v9 = (void *)sub_220182450();
  sub_220149EE0(0, &qword_267F0AA00);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F0AA08);
  char v36 = &v32;
  uint64_t v11 = *(void *)(*(void *)(v10 - 8) + 64);
  MEMORY[0x270FA5388](v10 - 8);
  unint64_t v12 = (v11 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v13 = sub_220181BC0();
  unint64_t v14 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56);
  uint64_t v15 = v14((char *)&v32 - v12, 1, 1, v13);
  MEMORY[0x270FA5388](v15);
  v14((char *)&v32 - v12, 1, 1, v13);
  id v16 = sub_22016B240((uint64_t)&v32 - v12, (uint64_t)&v32 - v12, 50000, 0, 1);
  id v17 = v37;
  id v18 = objc_msgSend(v37, sel_publisherWithUseCase_options_, v9, v16);

  uint64_t v19 = swift_allocObject();
  *(void *)(v19 + 16) = v38;
  uint64_t v48 = sub_220172990;
  uint64_t v49 = v19;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v45 = 1107296256;
  uint64_t v46 = sub_22016B628;
  uint64_t v47 = &block_descriptor_0;
  id v20 = _Block_copy(&aBlock);
  swift_release();
  uint64_t v21 = swift_allocObject();
  uint64_t v23 = v40;
  uint64_t v22 = v41;
  *(void *)(v21 + 16) = v40;
  *(void *)(v21 + 24) = v22;
  uint64_t v48 = sub_2201729F0;
  uint64_t v49 = v21;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v45 = 1107296256;
  uint64_t v46 = sub_22016B968;
  uint64_t v47 = &block_descriptor_30;
  uint64_t v24 = _Block_copy(&aBlock);
  swift_retain();
  swift_retain();
  swift_release();
  id v25 = objc_msgSend(v18, sel_sinkWithCompletion_shouldContinue_, v20, v24);
  _Block_release(v24);
  _Block_release(v20);

  swift_beginAccess();
  uint64_t v26 = *(void *)(v23 + 16);
  if (v26)
  {
    swift_bridgeObjectRetain_n();
    id v27 = sub_220181C60();
    os_log_type_t v28 = sub_2201825E0();
    if (os_log_type_enabled(v27, v28))
    {
      uint64_t v29 = swift_slowAlloc();
      uint64_t v30 = swift_slowAlloc();
      uint64_t v43 = v30;
      *(_DWORD *)uint64_t v29 = 136446466;
      uint64_t v42 = sub_220149888(0xD000000000000016, v33 | 0x8000000000000000, &v43);
      sub_2201826B0();
      *(_WORD *)(v29 + 12) = 2050;
      uint64_t v42 = *(void *)(v26 + 16);
      sub_2201826B0();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_22012C000, v27, v28, "[Fetch %{public}s] End with number of bundles fetched: %{public}ld", (uint8_t *)v29, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x223C676F0](v30, -1, -1);
      MEMORY[0x223C676F0](v29, -1, -1);
      swift_release();
      swift_release();
    }
    else
    {
      swift_release();
      swift_release();

      swift_bridgeObjectRelease();
    }
  }
  else
  {
    sub_2201729F8();
    swift_allocError();
    swift_willThrow();
    swift_release();
    swift_release();
  }
  return v26;
}

BOOL sub_22016AC68(id *a1, void **a2, uint64_t a3)
{
  id v3 = *a1;
  uint64_t v4 = *a2;
  if (a3)
  {
    id v6 = objc_msgSend(*a1, sel_sourceIdentifier);
    uint64_t v7 = sub_220182460();
    uint64_t v9 = v8;

    if (*(void *)(a3 + 16) && (unint64_t v10 = sub_22017A2C8(v7, v9), (v11 & 1) != 0)) {
      uint64_t v12 = *(void *)(*(void *)(a3 + 56) + 8 * v10);
    }
    else {
      uint64_t v12 = 0;
    }
    swift_bridgeObjectRelease();
    id v13 = objc_msgSend(v4, sel_sourceIdentifier);
    uint64_t v14 = sub_220182460();
    uint64_t v16 = v15;

    if (*(void *)(a3 + 16))
    {
      unint64_t v17 = sub_22017A2C8(v14, v16);
      if (v18)
      {
        uint64_t v19 = *(void *)(*(void *)(a3 + 56) + 8 * v17);
        swift_bridgeObjectRelease();
        if (v12 == v19) {
          goto LABEL_13;
        }
        return v19 < v12;
      }
    }
    swift_bridgeObjectRelease();
    if (v12)
    {
      uint64_t v19 = 0;
      return v19 < v12;
    }
  }
LABEL_13:
  id v21 = objc_msgSend(v3, sel_displayName);
  sub_220182460();

  uint64_t v22 = sub_220182480();
  uint64_t v24 = v23;
  swift_bridgeObjectRelease();
  id v25 = objc_msgSend(v4, sel_displayName);
  sub_220182460();

  uint64_t v26 = sub_220182480();
  uint64_t v28 = v27;
  swift_bridgeObjectRelease();
  if (v22 == v26 && v24 == v28)
  {
    swift_bridgeObjectRelease_n();
    return 0;
  }
  else
  {
    char v30 = sub_220182910();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return v30 & 1;
  }
}

void sub_22016AE6C(void *a1, uint64_t a2)
{
  id v4 = objc_msgSend(a1, sel_bundleIdentifier);
  if (v4)
  {
    os_log_type_t v5 = v4;
    uint64_t v22 = a2;
    sub_220182460();

    uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F09E10);
    uint64_t v7 = *(void *)(*(void *)(v6 - 8) + 64);
    MEMORY[0x270FA5388](v6 - 8);
    unint64_t v8 = (v7 + 15) & 0xFFFFFFFFFFFFFFF0;
    uint64_t v9 = (char *)&v22 - v8;
    id v10 = objc_msgSend(a1, sel_bundleContainerURL, v22);
    if (MEMORY[0x270FA5388](v10))
    {
      sub_220181B60();

      uint64_t v11 = sub_220181B70();
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))((char *)&v22 - v8, 0, 1, v11);
    }
    else
    {
      uint64_t v11 = sub_220181B70();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))((char *)&v22 - v8, 1, 1, v11);
    }
    sub_22015311C((uint64_t)&v22 - v8, (uint64_t)&v22 - v8);
    sub_220181B70();
    uint64_t v12 = *(void *)(v11 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v9, 1, v11) == 1)
    {
      swift_bridgeObjectRelease();
      sub_22014ACAC((uint64_t)v9, &qword_267F09E10);
    }
    else
    {
      sub_220181B40();
      (*(void (**)(char *, uint64_t))(v12 + 8))(v9, v11);
      id v13 = objc_msgSend(a1, sel_localizedName);
      sub_220182460();

      swift_bridgeObjectRetain();
      uint64_t v14 = (void *)sub_220182450();
      swift_bridgeObjectRelease();
      id v15 = objc_msgSend(self, sel_iconNamed_, v14);

      id v16 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F84598]), sel_init);
      id v17 = objc_allocWithZone(MEMORY[0x263F84588]);
      char v18 = (void *)sub_220182450();
      swift_bridgeObjectRelease();
      uint64_t v19 = (void *)sub_220182450();
      swift_bridgeObjectRelease();
      id v20 = (void *)sub_220182450();
      swift_bridgeObjectRelease();
      id v21 = objc_msgSend(v17, sel_initWithIdentifier_isHidden_displayName_icon_settings_bundlePath_, v18, 0, v19, v15, v16, v20);

      sub_22016C8E8(&v23, v21);
    }
  }
}

void sub_22016B1F4(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void (**)(void))(a1 + 32);
  id v3 = a2;
  v2();
}

id sub_22016B240(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t v9 = sub_220181BC0();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v10 + 48);
  uint64_t v12 = 0;
  if (v11(a1, 1, v9) != 1)
  {
    uint64_t v12 = (void *)sub_220181BA0();
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(a1, v9);
  }
  if (v11(a2, 1, v9) == 1)
  {
    id v13 = 0;
  }
  else
  {
    id v13 = (void *)sub_220181BA0();
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(a2, v9);
  }
  id v14 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithStartDate_endDate_maxEvents_lastN_reversed_, v12, v13, a3, a4, a5 & 1);

  return v14;
}

void sub_22016B3C0(void *a1)
{
  if (objc_msgSend(a1, sel_state) == (id)1)
  {
    if (qword_267F09C80 != -1) {
      swift_once();
    }
    uint64_t v2 = sub_220181C80();
    __swift_project_value_buffer(v2, (uint64_t)qword_267F0C120);
    id v9 = a1;
    id v3 = sub_220181C60();
    os_log_type_t v4 = sub_2201825F0();
    if (os_log_type_enabled(v3, v4))
    {
      uint64_t v5 = swift_slowAlloc();
      uint64_t v6 = (void *)swift_slowAlloc();
      uint64_t v7 = swift_slowAlloc();
      uint64_t v10 = v7;
      *(_DWORD *)uint64_t v5 = 136446466;
      sub_220149888(0xD000000000000016, 0x80000002201897D0, &v10);
      sub_2201826B0();
      *(_WORD *)(v5 + 12) = 2114;
      id v8 = v9;
      sub_2201826B0();
      *uint64_t v6 = v9;

      _os_log_impl(&dword_22012C000, v3, v4, "[Fetch %{public}s] Couldn't sort notifications by weekly avg: %{public}@", (uint8_t *)v5, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_267F0A250);
      swift_arrayDestroy();
      MEMORY[0x223C676F0](v6, -1, -1);
      swift_arrayDestroy();
      MEMORY[0x223C676F0](v7, -1, -1);
      MEMORY[0x223C676F0](v5, -1, -1);
    }
    else
    {
    }
  }
}

void sub_22016B628(uint64_t a1, void *a2)
{
  id v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

uint64_t sub_22016B690(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = (uint64_t *)(a2 + 16);
  swift_beginAccess();
  if (!*(void *)(a2 + 16))
  {
    swift_beginAccess();
    *uint64_t v6 = MEMORY[0x263F8EE80];
    swift_bridgeObjectRelease();
  }
  id v7 = objc_msgSend(a1, sel_eventBody);
  if (!v7) {
    return 1;
  }
  id v8 = v7;
  if (objc_msgSend(v7, sel_usageType) != 17 && objc_msgSend(v8, sel_usageType) != 18
    || (id v9 = objc_msgSend(v8, sel_bundleID)) == 0)
  {
LABEL_20:

    return 1;
  }
  uint64_t v10 = v9;
  uint64_t v11 = (uint64_t *)(a3 + 16);
  uint64_t v12 = sub_220182460();
  uint64_t v14 = v13;

  uint64_t result = swift_beginAccess();
  uint64_t v16 = *v11 + 1;
  if (__OFADD__(*v11, 1))
  {
    __break(1u);
    goto LABEL_24;
  }
  uint64_t *v11 = v16;
  if (v16 >= 15001)
  {

    swift_bridgeObjectRelease();
    return 0;
  }
  swift_beginAccess();
  uint64_t v18 = *v6;
  if (!*v6 || !*(void *)(v18 + 16))
  {
LABEL_17:
    swift_endAccess();
    swift_beginAccess();
    if (*v6)
    {
      swift_bridgeObjectRetain();
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v27 = *v6;
      *uint64_t v6 = 0x8000000000000000;
      uint64_t v17 = 1;
      sub_22017C85C(1, v12, v14, isUniquelyReferenced_nonNull_native);
      *uint64_t v6 = v27;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_endAccess();
      swift_bridgeObjectRelease();

      return v17;
    }
    goto LABEL_19;
  }
  swift_bridgeObjectRetain();
  unint64_t v19 = sub_22017A2C8(v12, v14);
  if ((v20 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    goto LABEL_17;
  }
  uint64_t v21 = *(void *)(*(void *)(v18 + 56) + 8 * v19);
  swift_endAccess();
  swift_bridgeObjectRelease();
  uint64_t result = swift_beginAccess();
  if (!*v6)
  {
LABEL_19:
    swift_endAccess();
    swift_bridgeObjectRelease();
    goto LABEL_20;
  }
  BOOL v22 = __OFADD__(v21, 1);
  uint64_t v23 = v21 + 1;
  if (!v22)
  {
    swift_bridgeObjectRetain();
    char v24 = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v26 = *v6;
    *uint64_t v6 = 0x8000000000000000;
    sub_22017C85C(v23, v12, v14, v24);
    *uint64_t v6 = v26;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_19;
  }
LABEL_24:
  __break(1u);
  return result;
}

uint64_t sub_22016B968(uint64_t a1, void *a2)
{
  id v3 = *(uint64_t (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  LOBYTE(v3) = v3();
  swift_release();

  return v3 & 1;
}

uint64_t sub_22016B9C0()
{
  return 1;
}

uint64_t sub_22016B9C8()
{
  return sub_220182A00();
}

uint64_t sub_22016BA0C()
{
  return sub_2201829C0();
}

uint64_t sub_22016BA34()
{
  return sub_220182A00();
}

void sub_22016BA84(uint64_t *a1@<X8>)
{
  id v3 = objc_msgSend(*v1, sel_sourceIdentifier);
  uint64_t v4 = sub_220182460();
  uint64_t v6 = v5;

  *a1 = v4;
  a1[1] = v6;
}

uint64_t sub_22016BADC()
{
  return type metadata accessor for NotificationSummarizationOnboardingViewModel();
}

uint64_t type metadata accessor for NotificationSummarizationOnboardingViewModel()
{
  uint64_t result = qword_267F0A908;
  if (!qword_267F0A908) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_22016BB30()
{
  uint64_t result = sub_220181C30();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for NotificationSummarizationOnboardingViewModel.SortMethod(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x22016BCBCLL);
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

ValueMetadata *type metadata accessor for NotificationSummarizationOnboardingViewModel.SortMethod()
{
  return &type metadata for NotificationSummarizationOnboardingViewModel.SortMethod;
}

unint64_t sub_22016BCF8()
{
  unint64_t result = qword_267F0A918;
  if (!qword_267F0A918)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F0A918);
  }
  return result;
}

unint64_t sub_22016BD54()
{
  unint64_t result = qword_267F0A920;
  if (!qword_267F0A920)
  {
    type metadata accessor for NotificationSummarizationOnboardingViewModel();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F0A920);
  }
  return result;
}

uint64_t sub_22016BDAC()
{
  return MEMORY[0x270FA0238](v0, 64, 7);
}

void sub_22016BDBC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void **)(v3 + 16);
  id v6 = (id)sub_220182450();
  objc_msgSend(v5, sel_replaceNotificationSettings_forNotificationSourceIdentifier_, a3, v6);
}

char *sub_22016BE1C(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    int64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = *((void *)a4 + 3);
  int64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      int64_t v7 = a2;
    }
LABEL_8:
    int64_t v8 = *((void *)a4 + 2);
    if (v7 <= v8) {
      int64_t v9 = *((void *)a4 + 2);
    }
    else {
      int64_t v9 = v7;
    }
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_267F0A9B8);
      uint64_t v10 = (char *)swift_allocObject();
      size_t v11 = _swift_stdlib_malloc_size(v10);
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * v11 - 64;
      uint64_t v12 = v10 + 32;
      if (v5)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[v8 + 32]) {
          memmove(v12, a4 + 32, v8);
        }
        *((void *)a4 + 2) = 0;
        goto LABEL_22;
      }
    }
    else
    {
      uint64_t v10 = (char *)MEMORY[0x263F8EE78];
      uint64_t v12 = (char *)(MEMORY[0x263F8EE78] + 32);
      if (result) {
        goto LABEL_13;
      }
    }
    sub_220170580(0, v8, v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_22016BF18(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = a4[3];
  uint64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v7 = a2;
    }
LABEL_8:
    uint64_t v8 = a4[2];
    if (v7 <= v8) {
      uint64_t v9 = a4[2];
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_267F0AA40);
      uint64_t v10 = (void *)swift_allocObject();
      size_t v11 = _swift_stdlib_malloc_size(v10);
      id v10[2] = v8;
      v10[3] = 2 * ((uint64_t)(v11 - 32) / 24);
      uint64_t v12 = v10 + 4;
      if (v5)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[3 * v8 + 4]) {
          memmove(v12, a4 + 4, 24 * v8);
        }
        a4[2] = 0;
        goto LABEL_22;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x263F8EE78];
      uint64_t v12 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result) {
        goto LABEL_13;
      }
    }
    sub_220170668(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_22016C040(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = a4[3];
  uint64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v7 = a2;
    }
LABEL_8:
    uint64_t v8 = a4[2];
    if (v7 <= v8) {
      uint64_t v9 = a4[2];
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_267F0AA30);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 1;
      }
      id v10[2] = v8;
      v10[3] = 2 * (v12 >> 5);
      uint64_t v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x263F8EE78];
      uint64_t v13 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[4 * v8 + 4]) {
          memmove(v13, a4 + 4, 32 * v8);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_220170760(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_22016C150(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = a4[3];
  uint64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v7 = a2;
    }
LABEL_8:
    uint64_t v8 = a4[2];
    if (v7 <= v8) {
      uint64_t v9 = a4[2];
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_267F0A9C0);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 25;
      }
      id v10[2] = v8;
      v10[3] = 2 * (v12 >> 3);
      uint64_t v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x263F8EE78];
      uint64_t v13 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[v8 + 4]) {
          memmove(v13, a4 + 4, 8 * v8);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_220172524(0, v8, (char *)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_22016C260(uint64_t a1)
{
  if ((a1 & 0xC000000000000001) != 0)
  {
    uint64_t v2 = sub_220182720();
    if (v2) {
      goto LABEL_3;
    }
    return MEMORY[0x263F8EE78];
  }
  uint64_t v2 = *(void *)(a1 + 16);
  if (!v2) {
    return MEMORY[0x263F8EE78];
  }
LABEL_3:
  if (v2 <= 0)
  {
    uint64_t v3 = (void *)MEMORY[0x263F8EE78];
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_267F0A9F0);
    uint64_t v3 = (void *)swift_allocObject();
    int64_t v4 = _swift_stdlib_malloc_size(v3);
    uint64_t v5 = v4 - 32;
    if (v4 < 32) {
      uint64_t v5 = v4 - 25;
    }
    v3[2] = v2;
    v3[3] = (2 * (v5 >> 3)) | 1;
  }
  swift_bridgeObjectRetain();
  unint64_t v6 = sub_22016FE4C(&v8, v3 + 4, v2, a1);
  uint64_t result = sub_2201728D4();
  if (v6 == (void *)v2) {
    return (uint64_t)v3;
  }
  __break(1u);
  return result;
}

uint64_t sub_22016C35C(uint64_t a1, void *a2, double a3, double a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = *v4;
  sub_2201829B0();
  sub_2201829D0();
  swift_bridgeObjectRetain();
  if (a2)
  {
    id v11 = a2;
    sub_2201826A0();
  }
  sub_2201829E0();
  sub_2201829E0();
  uint64_t v12 = sub_220182A00();
  uint64_t v13 = -1 << *(unsigned char *)(v10 + 32);
  unint64_t v14 = v12 & ~v13;
  char v30 = v5;
  if (((*(void *)(v10 + 56 + ((v14 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v14) & 1) == 0)
  {
LABEL_16:
    swift_bridgeObjectRelease();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v31 = *v30;
    *char v30 = 0x8000000000000000;
    id v25 = a2;
    sub_22016D754(a2, v14, isUniquelyReferenced_nonNull_native, a3, a4);
    *char v30 = v31;
    swift_bridgeObjectRelease();
    *(void *)a1 = a2;
    uint64_t result = 1;
    *(double *)(a1 + 8) = a3;
    *(double *)(a1 + 16) = a4;
    return result;
  }
  uint64_t v15 = ~v13;
  while (1)
  {
    uint64_t v17 = *(void *)(v10 + 48) + 24 * v14;
    uint64_t v18 = *(void **)v17;
    double v20 = *(double *)(v17 + 8);
    double v19 = *(double *)(v17 + 16);
    if (*(void *)v17) {
      break;
    }
    if (!a2) {
      goto LABEL_5;
    }
LABEL_9:
    unint64_t v14 = (v14 + 1) & v15;
    if (((*(void *)(v10 + 56 + ((v14 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v14) & 1) == 0) {
      goto LABEL_16;
    }
  }
  if (!a2) {
    goto LABEL_9;
  }
  sub_220149EE0(0, (unint64_t *)&qword_267F0A9A0);
  id v21 = a2;
  id v22 = v18;
  char v23 = sub_220182690();

  if ((v23 & 1) == 0) {
    goto LABEL_9;
  }
LABEL_5:
  if (v20 != a3 || v19 != a4) {
    goto LABEL_9;
  }

  swift_bridgeObjectRelease();
  uint64_t v27 = *(void *)(*v30 + 48) + 24 * v14;
  uint64_t v28 = *(void **)v27;
  *(void *)a1 = *(void *)v27;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(v27 + 8);
  id v29 = v28;
  return 0;
}

uint64_t sub_22016C5B8(unsigned char *a1, uint64_t a2)
{
  uint64_t v4 = *v2;
  sub_2201829B0();
  swift_bridgeObjectRetain();
  sub_220182490();
  swift_bridgeObjectRelease();
  uint64_t v5 = sub_220182A00();
  uint64_t v6 = -1 << *(unsigned char *)(v4 + 32);
  unint64_t v7 = v5 & ~v6;
  uint64_t v18 = a2;
  if (((*(void *)(v4 + 56 + ((v7 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v7) & 1) == 0)
  {
LABEL_17:
    swift_bridgeObjectRelease();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v21 = *v19;
    uint64_t *v19 = 0x8000000000000000;
    char v16 = v18;
    sub_22016D984(v18, v7, isUniquelyReferenced_nonNull_native);
    uint64_t *v19 = v21;
    swift_bridgeObjectRelease();
    uint64_t result = 1;
    goto LABEL_20;
  }
  uint64_t v8 = ~v6;
  uint64_t v9 = a2;
  while (2)
  {
    unint64_t v10 = 0xD000000000000016;
    unint64_t v11 = 0x8000000220188300;
    switch(*(unsigned char *)(*(void *)(v4 + 48) + v7))
    {
      case 1:
        unint64_t v11 = 0x8000000220188320;
        unint64_t v10 = 0xD000000000000014;
        break;
      case 2:
        unint64_t v11 = 0xE500000000000000;
        unint64_t v10 = 0x726568746FLL;
        break;
      case 3:
        unint64_t v11 = 0xE400000000000000;
        unint64_t v10 = 1701736302;
        break;
      default:
        break;
    }
    unint64_t v12 = 0xD000000000000016;
    unint64_t v13 = 0x8000000220188300;
    switch(v9)
    {
      case 1:
        unint64_t v13 = 0x8000000220188320;
        if (v10 == 0xD000000000000014) {
          goto LABEL_14;
        }
        goto LABEL_15;
      case 2:
        unint64_t v13 = 0xE500000000000000;
        unint64_t v12 = 0x726568746FLL;
        goto LABEL_11;
      case 3:
        unint64_t v13 = 0xE400000000000000;
        if (v10 == 1701736302) {
          goto LABEL_14;
        }
        goto LABEL_15;
      default:
LABEL_11:
        if (v10 != v12) {
          goto LABEL_15;
        }
LABEL_14:
        if (v11 != v13)
        {
LABEL_15:
          char v14 = sub_220182910();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if (v14) {
            goto LABEL_19;
          }
          unint64_t v7 = (v7 + 1) & v8;
          if (((*(void *)(v4 + 56 + ((v7 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v7) & 1) == 0) {
            goto LABEL_17;
          }
          continue;
        }
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
LABEL_19:
        swift_bridgeObjectRelease();
        uint64_t result = 0;
        char v16 = *(unsigned char *)(*(void *)(*v19 + 48) + v7);
LABEL_20:
        *a1 = v16;
        return result;
    }
  }
}

uint64_t sub_22016C8E8(void *a1, void *a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = *v2;
  if ((*v2 & 0xC000000000000001) != 0)
  {
    if (v6 < 0) {
      uint64_t v7 = *v2;
    }
    else {
      uint64_t v7 = v6 & 0xFFFFFFFFFFFFFF8;
    }
    swift_bridgeObjectRetain();
    id v8 = a2;
    uint64_t v9 = sub_220182730();

    if (v9)
    {
      swift_bridgeObjectRelease();

      sub_220149EE0(0, (unint64_t *)&qword_267F0A9A0);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      *a1 = v26;
      swift_unknownObjectRelease();
      return 0;
    }
    uint64_t result = sub_220182720();
    if (__OFADD__(result, 1))
    {
      __break(1u);
      return result;
    }
    uint64_t v21 = sub_22016CB88(v7, result + 1);
    uint64_t v27 = v21;
    if (*(void *)(v21 + 24) <= *(void *)(v21 + 16))
    {
      id v25 = v8;
      sub_22016D430();
      uint64_t v22 = v27;
    }
    else
    {
      uint64_t v22 = v21;
      id v23 = v8;
    }
    sub_22016D6D0((uint64_t)v8, v22);
    uint64_t *v3 = v22;
  }
  else
  {
    swift_bridgeObjectRetain();
    uint64_t v11 = sub_220182680();
    uint64_t v12 = -1 << *(unsigned char *)(v6 + 32);
    unint64_t v13 = v11 & ~v12;
    if ((*(void *)(v6 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13))
    {
      sub_220149EE0(0, (unint64_t *)&qword_267F0A9A0);
      id v14 = *(id *)(*(void *)(v6 + 48) + 8 * v13);
      char v15 = sub_220182690();

      if (v15)
      {
LABEL_12:

        swift_bridgeObjectRelease();
        double v19 = *(void **)(*(void *)(*v2 + 48) + 8 * v13);
        *a1 = v19;
        id v20 = v19;
        return 0;
      }
      uint64_t v16 = ~v12;
      while (1)
      {
        unint64_t v13 = (v13 + 1) & v16;
        if (((*(void *)(v6 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13) & 1) == 0) {
          break;
        }
        id v17 = *(id *)(*(void *)(v6 + 48) + 8 * v13);
        char v18 = sub_220182690();

        if (v18) {
          goto LABEL_12;
        }
      }
    }
    swift_bridgeObjectRelease();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v28 = *v2;
    *uint64_t v2 = 0x8000000000000000;
    id v8 = a2;
    sub_22016DCB8((uint64_t)v8, v13, isUniquelyReferenced_nonNull_native);
    *uint64_t v2 = v28;
  }
  swift_bridgeObjectRelease();
  *a1 = v8;
  return 1;
}

uint64_t sub_22016CB88(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_267F0AA20);
    uint64_t v2 = sub_220182770();
    uint64_t v14 = v2;
    sub_220182710();
    if (sub_220182740())
    {
      sub_220149EE0(0, (unint64_t *)&qword_267F0A9A0);
      do
      {
        swift_dynamicCast();
        uint64_t v2 = v14;
        if (*(void *)(v14 + 24) <= *(void *)(v14 + 16))
        {
          sub_22016D430();
          uint64_t v2 = v14;
        }
        uint64_t result = sub_220182680();
        uint64_t v4 = v2 + 56;
        uint64_t v5 = -1 << *(unsigned char *)(v2 + 32);
        unint64_t v6 = result & ~v5;
        unint64_t v7 = v6 >> 6;
        if (((-1 << v6) & ~*(void *)(v2 + 56 + 8 * (v6 >> 6))) != 0)
        {
          unint64_t v8 = __clz(__rbit64((-1 << v6) & ~*(void *)(v2 + 56 + 8 * (v6 >> 6)))) | v6 & 0x7FFFFFFFFFFFFFC0;
        }
        else
        {
          char v9 = 0;
          unint64_t v10 = (unint64_t)(63 - v5) >> 6;
          do
          {
            if (++v7 == v10 && (v9 & 1) != 0)
            {
              __break(1u);
              return result;
            }
            BOOL v11 = v7 == v10;
            if (v7 == v10) {
              unint64_t v7 = 0;
            }
            v9 |= v11;
            uint64_t v12 = *(void *)(v4 + 8 * v7);
          }
          while (v12 == -1);
          unint64_t v8 = __clz(__rbit64(~v12)) + (v7 << 6);
        }
        *(void *)(v4 + ((v8 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v8;
        *(void *)(*(void *)(v2 + 48) + 8 * v8) = v13;
        ++*(void *)(v2 + 16);
      }
      while (sub_220182740());
    }
    swift_release();
  }
  else
  {
    swift_unknownObjectRelease();
    return MEMORY[0x263F8EE88];
  }
  return v2;
}

uint64_t sub_22016CD80()
{
  unint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F0AA48);
  uint64_t v3 = sub_220182760();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    uint64_t v32 = v0;
    unint64_t v33 = (void *)(v2 + 56);
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
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        if (v16 >= v8) {
          goto LABEL_35;
        }
        unint64_t v17 = v33[v16];
        ++v11;
        if (!v17)
        {
          int64_t v11 = v16 + 1;
          if (v16 + 1 >= v8) {
            goto LABEL_35;
          }
          unint64_t v17 = v33[v11];
          if (!v17)
          {
            int64_t v11 = v16 + 2;
            if (v16 + 2 >= v8) {
              goto LABEL_35;
            }
            unint64_t v17 = v33[v11];
            if (!v17)
            {
              int64_t v18 = v16 + 3;
              if (v18 >= v8)
              {
LABEL_35:
                swift_release();
                unint64_t v1 = v32;
                uint64_t v31 = 1 << *(unsigned char *)(v2 + 32);
                if (v31 > 63) {
                  bzero(v33, ((unint64_t)(v31 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *unint64_t v33 = -1 << v31;
                }
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v17 = v33[v18];
              if (!v17)
              {
                while (1)
                {
                  int64_t v11 = v18 + 1;
                  if (__OFADD__(v18, 1)) {
                    goto LABEL_41;
                  }
                  if (v11 >= v8) {
                    goto LABEL_35;
                  }
                  unint64_t v17 = v33[v11];
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
      uint64_t v19 = *(void *)(v2 + 48) + 24 * v15;
      id v20 = *(void **)v19;
      uint64_t v21 = *(void *)(v19 + 8);
      uint64_t v22 = *(void *)(v19 + 16);
      sub_2201829B0();
      sub_2201829D0();
      if (v20)
      {
        id v23 = v20;
        sub_2201826A0();
      }
      sub_2201829E0();
      sub_2201829E0();
      uint64_t result = sub_220182A00();
      uint64_t v24 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v25 = result & ~v24;
      unint64_t v26 = v25 >> 6;
      if (((-1 << v25) & ~*(void *)(v9 + 8 * (v25 >> 6))) != 0)
      {
        unint64_t v12 = __clz(__rbit64((-1 << v25) & ~*(void *)(v9 + 8 * (v25 >> 6)))) | v25 & 0x7FFFFFFFFFFFFFC0;
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
            goto LABEL_40;
          }
          BOOL v29 = v26 == v28;
          if (v26 == v28) {
            unint64_t v26 = 0;
          }
          v27 |= v29;
          uint64_t v30 = *(void *)(v9 + 8 * v26);
        }
        while (v30 == -1);
        unint64_t v12 = __clz(__rbit64(~v30)) + (v26 << 6);
      }
      *(void *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
      uint64_t v13 = (void *)(*(void *)(v4 + 48) + 24 * v12);
      void *v13 = v20;
      v13[1] = v21;
      v13[2] = v22;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  uint64_t *v1 = v4;
  return result;
}

uint64_t sub_22016D0BC()
{
  unint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F0AA38);
  uint64_t v3 = sub_220182760();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16)) {
    goto LABEL_37;
  }
  uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
  unint64_t v28 = (void *)(v2 + 56);
  if (v5 < 64) {
    uint64_t v6 = ~(-1 << v5);
  }
  else {
    uint64_t v6 = -1;
  }
  unint64_t v7 = v6 & *(void *)(v2 + 56);
  int64_t v8 = (unint64_t)(v5 + 63) >> 6;
  uint64_t v9 = v3 + 56;
  swift_retain();
  int64_t v10 = 0;
  while (1)
  {
    if (v7)
    {
      unint64_t v12 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      unint64_t v13 = v12 | (v10 << 6);
      goto LABEL_24;
    }
    int64_t v14 = v10 + 1;
    if (__OFADD__(v10, 1)) {
      goto LABEL_38;
    }
    if (v14 >= v8) {
      break;
    }
    unint64_t v15 = v28[v14];
    ++v10;
    if (!v15)
    {
      int64_t v10 = v14 + 1;
      if (v14 + 1 >= v8) {
        break;
      }
      unint64_t v15 = v28[v10];
      if (!v15)
      {
        int64_t v10 = v14 + 2;
        if (v14 + 2 >= v8) {
          break;
        }
        unint64_t v15 = v28[v10];
        if (!v15)
        {
          int64_t v16 = v14 + 3;
          if (v16 >= v8) {
            break;
          }
          unint64_t v15 = v28[v16];
          if (!v15)
          {
            while (1)
            {
              int64_t v10 = v16 + 1;
              if (__OFADD__(v16, 1)) {
                goto LABEL_39;
              }
              if (v10 >= v8) {
                goto LABEL_33;
              }
              unint64_t v15 = v28[v10];
              ++v16;
              if (v15) {
                goto LABEL_23;
              }
            }
          }
          int64_t v10 = v16;
        }
      }
    }
LABEL_23:
    unint64_t v7 = (v15 - 1) & v15;
    unint64_t v13 = __clz(__rbit64(v15)) + (v10 << 6);
LABEL_24:
    char v17 = *(unsigned char *)(*(void *)(v2 + 48) + v13);
    sub_2201829B0();
    sub_220182490();
    swift_bridgeObjectRelease();
    uint64_t v18 = sub_220182A00();
    uint64_t v19 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v20 = v18 & ~v19;
    unint64_t v21 = v20 >> 6;
    if (((-1 << v20) & ~*(void *)(v9 + 8 * (v20 >> 6))) != 0)
    {
      unint64_t v11 = __clz(__rbit64((-1 << v20) & ~*(void *)(v9 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
      goto LABEL_7;
    }
    char v22 = 0;
    unint64_t v23 = (unint64_t)(63 - v19) >> 6;
    do
    {
      if (++v21 == v23 && (v22 & 1) != 0)
      {
        __break(1u);
LABEL_38:
        __break(1u);
LABEL_39:
        __break(1u);
        JUMPOUT(0x22016D420);
      }
      BOOL v24 = v21 == v23;
      if (v21 == v23) {
        unint64_t v21 = 0;
      }
      v22 |= v24;
      uint64_t v25 = *(void *)(v9 + 8 * v21);
    }
    while (v25 == -1);
    unint64_t v11 = __clz(__rbit64(~v25)) + (v21 << 6);
LABEL_7:
    *(void *)(v9 + ((v11 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v11;
    *(unsigned char *)(*(void *)(v4 + 48) + v11) = v17;
    ++*(void *)(v4 + 16);
  }
LABEL_33:
  swift_release();
  unint64_t v1 = v0;
  uint64_t v26 = 1 << *(unsigned char *)(v2 + 32);
  if (v26 > 63) {
    bzero(v28, ((unint64_t)(v26 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    void *v28 = -1 << v26;
  }
  *(void *)(v2 + 16) = 0;
LABEL_37:
  uint64_t result = swift_release();
  uint64_t *v1 = v4;
  return result;
}

uint64_t sub_22016D430()
{
  unint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F0AA20);
  uint64_t v3 = sub_220182760();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    unint64_t v28 = v0;
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    uint64_t v6 = (void *)(v2 + 56);
    if (v5 < 64) {
      uint64_t v7 = ~(-1 << v5);
    }
    else {
      uint64_t v7 = -1;
    }
    unint64_t v8 = v7 & *(void *)(v2 + 56);
    int64_t v9 = (unint64_t)(v5 + 63) >> 6;
    uint64_t v10 = v3 + 56;
    uint64_t result = swift_retain();
    int64_t v12 = 0;
    while (1)
    {
      if (v8)
      {
        unint64_t v14 = __clz(__rbit64(v8));
        v8 &= v8 - 1;
        unint64_t v15 = v14 | (v12 << 6);
      }
      else
      {
        int64_t v16 = v12 + 1;
        if (__OFADD__(v12, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v16 >= v9) {
          goto LABEL_33;
        }
        unint64_t v17 = v6[v16];
        ++v12;
        if (!v17)
        {
          int64_t v12 = v16 + 1;
          if (v16 + 1 >= v9) {
            goto LABEL_33;
          }
          unint64_t v17 = v6[v12];
          if (!v17)
          {
            int64_t v12 = v16 + 2;
            if (v16 + 2 >= v9) {
              goto LABEL_33;
            }
            unint64_t v17 = v6[v12];
            if (!v17)
            {
              int64_t v18 = v16 + 3;
              if (v18 >= v9)
              {
LABEL_33:
                swift_release();
                unint64_t v1 = v28;
                uint64_t v27 = 1 << *(unsigned char *)(v2 + 32);
                if (v27 > 63) {
                  bzero((void *)(v2 + 56), ((unint64_t)(v27 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v6 = -1 << v27;
                }
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v17 = v6[v18];
              if (!v17)
              {
                while (1)
                {
                  int64_t v12 = v18 + 1;
                  if (__OFADD__(v18, 1)) {
                    goto LABEL_39;
                  }
                  if (v12 >= v9) {
                    goto LABEL_33;
                  }
                  unint64_t v17 = v6[v12];
                  ++v18;
                  if (v17) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v12 = v18;
            }
          }
        }
LABEL_23:
        unint64_t v8 = (v17 - 1) & v17;
        unint64_t v15 = __clz(__rbit64(v17)) + (v12 << 6);
      }
      uint64_t v19 = *(void *)(*(void *)(v2 + 48) + 8 * v15);
      uint64_t result = sub_220182680();
      uint64_t v20 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v21 = result & ~v20;
      unint64_t v22 = v21 >> 6;
      if (((-1 << v21) & ~*(void *)(v10 + 8 * (v21 >> 6))) != 0)
      {
        unint64_t v13 = __clz(__rbit64((-1 << v21) & ~*(void *)(v10 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
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
          uint64_t v26 = *(void *)(v10 + 8 * v22);
        }
        while (v26 == -1);
        unint64_t v13 = __clz(__rbit64(~v26)) + (v22 << 6);
      }
      *(void *)(v10 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
      *(void *)(*(void *)(v4 + 48) + 8 * v13) = v19;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  uint64_t *v1 = v4;
  return result;
}

unint64_t sub_22016D6D0(uint64_t a1, uint64_t a2)
{
  sub_220182680();
  unint64_t result = sub_220182700();
  *(void *)(a2 + 56 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
  *(void *)(*(void *)(a2 + 48) + 8 * result) = a1;
  ++*(void *)(a2 + 16);
  return result;
}

void sub_22016D754(void *a1, unint64_t a2, char a3, double a4, double a5)
{
  uint64_t v6 = v5;
  unint64_t v11 = *(void *)(*v5 + 16);
  unint64_t v12 = *(void *)(*v5 + 24);
  if (v12 <= v11 || (a3 & 1) == 0)
  {
    if (a3)
    {
      sub_22016CD80();
    }
    else
    {
      if (v12 > v11)
      {
        sub_22016DE40();
        goto LABEL_23;
      }
      sub_22016E340();
    }
    uint64_t v13 = *v5;
    sub_2201829B0();
    sub_2201829D0();
    if (a1)
    {
      id v14 = a1;
      sub_2201826A0();
    }
    sub_2201829E0();
    sub_2201829E0();
    uint64_t v15 = sub_220182A00();
    uint64_t v16 = -1 << *(unsigned char *)(v13 + 32);
    a2 = v15 & ~v16;
    if ((*(void *)(v13 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
    {
      uint64_t v17 = ~v16;
      do
      {
        uint64_t v19 = *(void *)(v13 + 48) + 24 * a2;
        uint64_t v20 = *(void **)v19;
        double v22 = *(double *)(v19 + 8);
        double v21 = *(double *)(v19 + 16);
        if (*(void *)v19)
        {
          if (!a1) {
            goto LABEL_16;
          }
          sub_220149EE0(0, (unint64_t *)&qword_267F0A9A0);
          id v23 = a1;
          id v24 = v20;
          char v25 = sub_220182690();

          if ((v25 & 1) == 0) {
            goto LABEL_16;
          }
        }
        else if (a1)
        {
          goto LABEL_16;
        }
        if (v22 == a4 && v21 == a5) {
          goto LABEL_26;
        }
LABEL_16:
        a2 = (a2 + 1) & v17;
      }
      while (((*(void *)(v13 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) != 0);
    }
  }
LABEL_23:
  uint64_t v26 = *v6;
  *(void *)(*v6 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  uint64_t v27 = *(void *)(v26 + 48) + 24 * a2;
  *(void *)uint64_t v27 = a1;
  *(double *)(v27 + 8) = a4;
  *(double *)(v27 + 16) = a5;
  uint64_t v28 = *(void *)(v26 + 16);
  BOOL v29 = __OFADD__(v28, 1);
  uint64_t v30 = v28 + 1;
  if (v29)
  {
    __break(1u);
LABEL_26:
    sub_220182930();
    __break(1u);
  }
  else
  {
    *(void *)(v26 + 16) = v30;
  }
}

uint64_t sub_22016D984(uint64_t result, unint64_t a2, char a3)
{
  unsigned __int8 v5 = result;
  unint64_t v6 = *(void *)(*v3 + 16);
  unint64_t v7 = *(void *)(*v3 + 24);
  if (v7 <= v6 || (a3 & 1) == 0)
  {
    if (a3)
    {
      sub_22016D0BC();
    }
    else
    {
      if (v7 > v6)
      {
        unint64_t result = (uint64_t)sub_22016E000();
        goto LABEL_25;
      }
      sub_22016E648();
    }
    uint64_t v8 = *v3;
    sub_2201829B0();
    sub_220182490();
    swift_bridgeObjectRelease();
    unint64_t result = sub_220182A00();
    uint64_t v9 = -1 << *(unsigned char *)(v8 + 32);
    a2 = result & ~v9;
    if ((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
    {
      uint64_t v10 = ~v9;
      uint64_t v11 = v5;
      while (2)
      {
        unint64_t v12 = 0xD000000000000016;
        unint64_t v13 = 0x8000000220188300;
        switch(*(unsigned char *)(*(void *)(v8 + 48) + a2))
        {
          case 1:
            unint64_t v13 = 0x8000000220188320;
            unint64_t v12 = 0xD000000000000014;
            break;
          case 2:
            unint64_t v13 = 0xE500000000000000;
            unint64_t v12 = 0x726568746FLL;
            break;
          case 3:
            unint64_t v13 = 0xE400000000000000;
            unint64_t v12 = 1701736302;
            break;
          default:
            break;
        }
        unint64_t v14 = 0xD000000000000016;
        unint64_t v15 = 0x8000000220188300;
        switch(v11)
        {
          case 1:
            unint64_t v15 = 0x8000000220188320;
            if (v12 != 0xD000000000000014) {
              goto LABEL_20;
            }
            goto LABEL_19;
          case 2:
            unint64_t v15 = 0xE500000000000000;
            unint64_t v14 = 0x726568746FLL;
            goto LABEL_18;
          case 3:
            unint64_t v15 = 0xE400000000000000;
            if (v12 != 1701736302) {
              goto LABEL_20;
            }
            goto LABEL_19;
          default:
LABEL_18:
            if (v12 != v14) {
              goto LABEL_20;
            }
LABEL_19:
            if (v13 == v15) {
              goto LABEL_28;
            }
LABEL_20:
            char v16 = sub_220182910();
            swift_bridgeObjectRelease();
            unint64_t result = swift_bridgeObjectRelease();
            if (v16) {
              goto LABEL_29;
            }
            a2 = (a2 + 1) & v10;
            if (((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) == 0) {
              break;
            }
            continue;
        }
        break;
      }
    }
  }
LABEL_25:
  uint64_t v17 = *v21;
  *(void *)(*v21 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(unsigned char *)(*(void *)(v17 + 48) + a2) = v22;
  uint64_t v18 = *(void *)(v17 + 16);
  BOOL v19 = __OFADD__(v18, 1);
  uint64_t v20 = v18 + 1;
  if (v19)
  {
    __break(1u);
LABEL_28:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_29:
    sub_220182930();
    __break(1u);
    JUMPOUT(0x22016DC88);
  }
  *(void *)(v17 + 16) = v20;
  return result;
}

void sub_22016DCB8(uint64_t a1, unint64_t a2, char a3)
{
  unint64_t v6 = *(void *)(*v3 + 16);
  unint64_t v7 = *(void *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0) {
    goto LABEL_14;
  }
  if (a3)
  {
    sub_22016D430();
  }
  else
  {
    if (v7 > v6)
    {
      sub_22016E194();
      goto LABEL_14;
    }
    sub_22016E984();
  }
  uint64_t v8 = *v3;
  uint64_t v9 = sub_220182680();
  uint64_t v10 = -1 << *(unsigned char *)(v8 + 32);
  a2 = v9 & ~v10;
  if ((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    sub_220149EE0(0, (unint64_t *)&qword_267F0A9A0);
    id v11 = *(id *)(*(void *)(v8 + 48) + 8 * a2);
    char v12 = sub_220182690();

    if (v12)
    {
LABEL_13:
      sub_220182930();
      __break(1u);
    }
    else
    {
      uint64_t v13 = ~v10;
      while (1)
      {
        a2 = (a2 + 1) & v13;
        if (((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) == 0) {
          break;
        }
        id v14 = *(id *)(*(void *)(v8 + 48) + 8 * a2);
        char v15 = sub_220182690();

        if (v15) {
          goto LABEL_13;
        }
      }
    }
  }
LABEL_14:
  uint64_t v16 = *v3;
  *(void *)(*v3 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(void *)(*(void *)(v16 + 48) + 8 * a2) = a1;
  uint64_t v17 = *(void *)(v16 + 16);
  BOOL v18 = __OFADD__(v17, 1);
  uint64_t v19 = v17 + 1;
  if (v18) {
    __break(1u);
  }
  else {
    *(void *)(v16 + 16) = v19;
  }
}

id sub_22016DE40()
{
  unint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F0AA48);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_220182750();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    id result = (id)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  id result = (id)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 56), 8 * v7);
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
    int64_t v21 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v21 >= v13) {
      goto LABEL_28;
    }
    unint64_t v22 = *(void *)(v6 + 8 * v21);
    ++v9;
    if (!v22)
    {
      int64_t v9 = v21 + 1;
      if (v21 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v22 = *(void *)(v6 + 8 * v9);
      if (!v22)
      {
        int64_t v9 = v21 + 2;
        if (v21 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v22 = *(void *)(v6 + 8 * v9);
        if (!v22) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v22 - 1) & v22;
    unint64_t v15 = __clz(__rbit64(v22)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 24 * v15;
    uint64_t v17 = *(void *)(v2 + 48) + v16;
    BOOL v18 = *(void **)v17;
    uint64_t v19 = *(void *)(v4 + 48) + v16;
    long long v20 = *(_OWORD *)(v17 + 8);
    *(void *)uint64_t v19 = *(void *)v17;
    *(_OWORD *)(v19 + 8) = v20;
    id result = v18;
  }
  int64_t v23 = v21 + 3;
  if (v23 >= v13) {
    goto LABEL_28;
  }
  unint64_t v22 = *(void *)(v6 + 8 * v23);
  if (v22)
  {
    int64_t v9 = v23;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v23 + 1;
    if (__OFADD__(v23, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v22 = *(void *)(v6 + 8 * v9);
    ++v23;
    if (v22) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

void *sub_22016E000()
{
  unint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F0AA38);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_220182750();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    id result = (void *)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  id result = (void *)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 56), 8 * v7);
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
    *(unsigned char *)(*(void *)(v4 + 48) + v15) = *(unsigned char *)(*(void *)(v2 + 48) + v15);
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

id sub_22016E194()
{
  unint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F0AA20);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_220182750();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    id result = (id)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  id result = (id)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 56), 8 * v7);
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
    int64_t v18 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v18 >= v13) {
      goto LABEL_28;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v18);
    ++v9;
    if (!v19)
    {
      int64_t v9 = v18 + 1;
      if (v18 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v19 = *(void *)(v6 + 8 * v9);
      if (!v19)
      {
        int64_t v9 = v18 + 2;
        if (v18 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v19 = *(void *)(v6 + 8 * v9);
        if (!v19) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v19 - 1) & v19;
    unint64_t v15 = __clz(__rbit64(v19)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    unint64_t v17 = *(void **)(*(void *)(v2 + 48) + v16);
    *(void *)(*(void *)(v4 + 48) + v16) = v17;
    id result = v17;
  }
  int64_t v20 = v18 + 3;
  if (v20 >= v13) {
    goto LABEL_28;
  }
  unint64_t v19 = *(void *)(v6 + 8 * v20);
  if (v19)
  {
    int64_t v9 = v20;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v9);
    ++v20;
    if (v19) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_22016E340()
{
  unint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F0AA48);
  uint64_t v3 = sub_220182760();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_37:
    uint64_t *v1 = v4;
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
  uint64_t v31 = v0;
  int64_t v32 = (unint64_t)(v5 + 63) >> 6;
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
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    if (v16 >= v32) {
      goto LABEL_35;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v11;
    if (!v17)
    {
      int64_t v11 = v16 + 1;
      if (v16 + 1 >= v32) {
        goto LABEL_35;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v11);
      if (!v17)
      {
        int64_t v11 = v16 + 2;
        if (v16 + 2 >= v32) {
          goto LABEL_35;
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
    uint64_t v19 = *(void *)(v2 + 48) + 24 * v15;
    int64_t v20 = *(void **)v19;
    uint64_t v21 = *(void *)(v19 + 8);
    uint64_t v22 = *(void *)(v19 + 16);
    sub_2201829B0();
    sub_2201829D0();
    if (v20)
    {
      id v23 = v20;
      sub_2201826A0();
    }
    sub_2201829E0();
    sub_2201829E0();
    uint64_t result = sub_220182A00();
    uint64_t v24 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v25 = result & ~v24;
    unint64_t v26 = v25 >> 6;
    if (((-1 << v25) & ~*(void *)(v9 + 8 * (v25 >> 6))) != 0)
    {
      unint64_t v12 = __clz(__rbit64((-1 << v25) & ~*(void *)(v9 + 8 * (v25 >> 6)))) | v25 & 0x7FFFFFFFFFFFFFC0;
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
          goto LABEL_38;
        }
        BOOL v29 = v26 == v28;
        if (v26 == v28) {
          unint64_t v26 = 0;
        }
        v27 |= v29;
        uint64_t v30 = *(void *)(v9 + 8 * v26);
      }
      while (v30 == -1);
      unint64_t v12 = __clz(__rbit64(~v30)) + (v26 << 6);
    }
    *(void *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    int64_t v13 = (void *)(*(void *)(v4 + 48) + 24 * v12);
    void *v13 = v20;
    v13[1] = v21;
    v13[2] = v22;
    ++*(void *)(v4 + 16);
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v32)
  {
LABEL_35:
    uint64_t result = swift_release_n();
    unint64_t v1 = v31;
    goto LABEL_37;
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
    if (v11 >= v32) {
      goto LABEL_35;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v11);
    ++v18;
    if (v17) {
      goto LABEL_23;
    }
  }
LABEL_39:
  __break(1u);
  return result;
}

uint64_t sub_22016E648()
{
  unint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F0AA38);
  uint64_t v3 = sub_220182760();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
    goto LABEL_35;
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
  int64_t v27 = (unint64_t)(v5 + 63) >> 6;
  uint64_t v9 = v3 + 56;
  swift_retain();
  int64_t v10 = 0;
  while (1)
  {
    if (v8)
    {
      unint64_t v12 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v13 = v12 | (v10 << 6);
      goto LABEL_24;
    }
    int64_t v14 = v10 + 1;
    if (__OFADD__(v10, 1)) {
      goto LABEL_36;
    }
    if (v14 >= v27) {
      break;
    }
    unint64_t v15 = *(void *)(v6 + 8 * v14);
    ++v10;
    if (!v15)
    {
      int64_t v10 = v14 + 1;
      if (v14 + 1 >= v27) {
        break;
      }
      unint64_t v15 = *(void *)(v6 + 8 * v10);
      if (!v15)
      {
        int64_t v10 = v14 + 2;
        if (v14 + 2 >= v27) {
          break;
        }
        unint64_t v15 = *(void *)(v6 + 8 * v10);
        if (!v15)
        {
          int64_t v16 = v14 + 3;
          if (v16 >= v27) {
            break;
          }
          unint64_t v15 = *(void *)(v6 + 8 * v16);
          if (!v15)
          {
            while (1)
            {
              int64_t v10 = v16 + 1;
              if (__OFADD__(v16, 1)) {
                goto LABEL_37;
              }
              if (v10 >= v27) {
                goto LABEL_33;
              }
              unint64_t v15 = *(void *)(v6 + 8 * v10);
              ++v16;
              if (v15) {
                goto LABEL_23;
              }
            }
          }
          int64_t v10 = v16;
        }
      }
    }
LABEL_23:
    unint64_t v8 = (v15 - 1) & v15;
    unint64_t v13 = __clz(__rbit64(v15)) + (v10 << 6);
LABEL_24:
    char v17 = *(unsigned char *)(*(void *)(v2 + 48) + v13);
    sub_2201829B0();
    sub_220182490();
    swift_bridgeObjectRelease();
    uint64_t v18 = sub_220182A00();
    uint64_t v19 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v20 = v18 & ~v19;
    unint64_t v21 = v20 >> 6;
    if (((-1 << v20) & ~*(void *)(v9 + 8 * (v20 >> 6))) != 0)
    {
      unint64_t v11 = __clz(__rbit64((-1 << v20) & ~*(void *)(v9 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
      goto LABEL_7;
    }
    char v22 = 0;
    unint64_t v23 = (unint64_t)(63 - v19) >> 6;
    do
    {
      if (++v21 == v23 && (v22 & 1) != 0)
      {
        __break(1u);
LABEL_36:
        __break(1u);
LABEL_37:
        __break(1u);
        JUMPOUT(0x22016E974);
      }
      BOOL v24 = v21 == v23;
      if (v21 == v23) {
        unint64_t v21 = 0;
      }
      v22 |= v24;
      uint64_t v25 = *(void *)(v9 + 8 * v21);
    }
    while (v25 == -1);
    unint64_t v11 = __clz(__rbit64(~v25)) + (v21 << 6);
LABEL_7:
    *(void *)(v9 + ((v11 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v11;
    *(unsigned char *)(*(void *)(v4 + 48) + v11) = v17;
    ++*(void *)(v4 + 16);
  }
LABEL_33:
  uint64_t result = swift_release_n();
  unint64_t v1 = v0;
LABEL_35:
  uint64_t *v1 = v4;
  return result;
}

uint64_t sub_22016E984()
{
  unint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F0AA20);
  uint64_t v3 = sub_220182760();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    uint64_t *v1 = v4;
    return result;
  }
  int64_t v27 = v0;
  uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v6 = v2 + 56;
  if (v5 < 64) {
    uint64_t v7 = ~(-1 << v5);
  }
  else {
    uint64_t v7 = -1;
  }
  unint64_t v8 = v7 & *(void *)(v2 + 56);
  int64_t v9 = (unint64_t)(v5 + 63) >> 6;
  uint64_t v10 = v3 + 56;
  uint64_t result = swift_retain();
  int64_t v12 = 0;
  while (1)
  {
    if (v8)
    {
      unint64_t v14 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v15 = v14 | (v12 << 6);
      goto LABEL_24;
    }
    int64_t v16 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v16 >= v9) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v12;
    if (!v17)
    {
      int64_t v12 = v16 + 1;
      if (v16 + 1 >= v9) {
        goto LABEL_33;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v12);
      if (!v17)
      {
        int64_t v12 = v16 + 2;
        if (v16 + 2 >= v9) {
          goto LABEL_33;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v12);
        if (!v17) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v8 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v12 << 6);
LABEL_24:
    id v19 = *(id *)(*(void *)(v2 + 48) + 8 * v15);
    uint64_t result = sub_220182680();
    uint64_t v20 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v21 = result & ~v20;
    unint64_t v22 = v21 >> 6;
    if (((-1 << v21) & ~*(void *)(v10 + 8 * (v21 >> 6))) != 0)
    {
      unint64_t v13 = __clz(__rbit64((-1 << v21) & ~*(void *)(v10 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
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
          goto LABEL_36;
        }
        BOOL v25 = v22 == v24;
        if (v22 == v24) {
          unint64_t v22 = 0;
        }
        v23 |= v25;
        uint64_t v26 = *(void *)(v10 + 8 * v22);
      }
      while (v26 == -1);
      unint64_t v13 = __clz(__rbit64(~v26)) + (v22 << 6);
    }
    *(void *)(v10 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
    *(void *)(*(void *)(v4 + 48) + 8 * v13) = v19;
    ++*(void *)(v4 + 16);
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v9)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    unint64_t v1 = v27;
    goto LABEL_35;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    int64_t v12 = v18;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v12 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v12 >= v9) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v12);
    ++v18;
    if (v17) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_22016EC00(void *a1, double a2, double a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = *v3;
  sub_2201829B0();
  sub_2201829D0();
  swift_bridgeObjectRetain();
  if (a1)
  {
    id v9 = a1;
    sub_2201826A0();
  }
  sub_2201829E0();
  sub_2201829E0();
  uint64_t v10 = sub_220182A00();
  uint64_t v11 = -1 << *(unsigned char *)(v8 + 32);
  unint64_t v12 = v10 & ~v11;
  if (((*(void *)(v8 + 56 + ((v12 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v12) & 1) == 0)
  {
LABEL_16:
    swift_bridgeObjectRelease();
    return 1;
  }
  uint64_t v26 = v4;
  uint64_t v13 = ~v11;
  while (1)
  {
    uint64_t v15 = *(void *)(v8 + 48) + 24 * v12;
    int64_t v16 = *(void **)v15;
    double v18 = *(double *)(v15 + 8);
    double v17 = *(double *)(v15 + 16);
    if (*(void *)v15) {
      break;
    }
    if (!a1) {
      goto LABEL_5;
    }
LABEL_9:
    unint64_t v12 = (v12 + 1) & v13;
    if (((*(void *)(v8 + 56 + ((v12 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v12) & 1) == 0) {
      goto LABEL_16;
    }
  }
  if (!a1) {
    goto LABEL_9;
  }
  sub_220149EE0(0, (unint64_t *)&qword_267F0A9A0);
  id v19 = a1;
  id v20 = v16;
  char v21 = sub_220182690();

  if ((v21 & 1) == 0) {
    goto LABEL_9;
  }
LABEL_5:
  if (v18 != a2 || v17 != a3) {
    goto LABEL_9;
  }
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v24 = *v26;
  uint64_t v27 = *v26;
  uint64_t *v26 = 0x8000000000000000;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    sub_22016DE40();
    uint64_t v24 = v27;
  }
  uint64_t v22 = *(void *)(*(void *)(v24 + 48) + 24 * v12);
  sub_22016F168(v12);
  uint64_t *v26 = v27;
  swift_bridgeObjectRelease();
  return v22;
}

uint64_t sub_22016EE3C(unsigned __int8 a1)
{
  uint64_t v3 = *v1;
  sub_2201829B0();
  swift_bridgeObjectRetain();
  sub_220182490();
  swift_bridgeObjectRelease();
  uint64_t v4 = sub_220182A00();
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = v4 & ~v5;
  if (((*(void *)(v3 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
  {
LABEL_18:
    swift_bridgeObjectRelease();
    return 4;
  }
  double v18 = v1;
  uint64_t v7 = ~v5;
  uint64_t v8 = a1;
  while (2)
  {
    unint64_t v9 = 0xD000000000000016;
    unint64_t v10 = 0x8000000220188300;
    switch(*(unsigned char *)(*(void *)(v3 + 48) + v6))
    {
      case 1:
        unint64_t v10 = 0x8000000220188320;
        unint64_t v9 = 0xD000000000000014;
        break;
      case 2:
        unint64_t v10 = 0xE500000000000000;
        unint64_t v9 = 0x726568746FLL;
        break;
      case 3:
        unint64_t v10 = 0xE400000000000000;
        unint64_t v9 = 1701736302;
        break;
      default:
        break;
    }
    unint64_t v11 = 0xD000000000000016;
    unint64_t v12 = 0x8000000220188300;
    switch(v8)
    {
      case 1:
        unint64_t v12 = 0x8000000220188320;
        if (v9 == 0xD000000000000014) {
          goto LABEL_12;
        }
        goto LABEL_13;
      case 2:
        unint64_t v12 = 0xE500000000000000;
        unint64_t v11 = 0x726568746FLL;
        goto LABEL_11;
      case 3:
        unint64_t v12 = 0xE400000000000000;
        if (v9 != 1701736302) {
          goto LABEL_13;
        }
        goto LABEL_12;
      default:
LABEL_11:
        if (v9 != v11) {
          goto LABEL_13;
        }
LABEL_12:
        if (v10 != v12)
        {
LABEL_13:
          char v13 = sub_220182910();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if (v13) {
            goto LABEL_20;
          }
          unint64_t v6 = (v6 + 1) & v7;
          if (((*(void *)(v3 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
            goto LABEL_18;
          }
          continue;
        }
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
LABEL_20:
        swift_bridgeObjectRelease();
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        uint64_t v16 = *v18;
        uint64_t v19 = *v18;
        *double v18 = 0x8000000000000000;
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        {
          sub_22016E000();
          uint64_t v16 = v19;
        }
        uint64_t v14 = *(unsigned __int8 *)(*(void *)(v16 + 48) + v6);
        sub_22016F380(v6);
        *double v18 = v19;
        swift_bridgeObjectRelease();
        return v14;
    }
  }
}

unint64_t sub_22016F168(unint64_t result)
{
  int64_t v2 = result;
  uint64_t v3 = *v1;
  uint64_t v4 = *v1 + 56;
  uint64_t v5 = -1 << *(unsigned char *)(*v1 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(v4 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    swift_retain();
    uint64_t v8 = sub_2201826F0();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v9 = (v8 + 1) & v7;
      do
      {
        id v11 = *(id *)(*(void *)(v3 + 48) + 24 * v6);
        sub_2201829B0();
        sub_2201829D0();
        if (v11)
        {
          id v11 = v11;
          sub_2201826A0();
        }
        sub_2201829E0();
        sub_2201829E0();
        uint64_t v12 = sub_220182A00();

        unint64_t v13 = v12 & v7;
        if (v2 >= (uint64_t)v9)
        {
          if (v13 < v9) {
            goto LABEL_5;
          }
        }
        else if (v13 >= v9)
        {
          goto LABEL_13;
        }
        if (v2 >= (uint64_t)v13)
        {
LABEL_13:
          uint64_t v14 = *(void *)(v3 + 48);
          unint64_t v15 = v14 + 24 * v2;
          uint64_t v16 = (long long *)(v14 + 24 * v6);
          if (v2 != v6 || (int64_t v2 = v6, v15 >= (unint64_t)v16 + 24))
          {
            long long v10 = *v16;
            *(void *)(v15 + 16) = *((void *)v16 + 2);
            *(_OWORD *)unint64_t v15 = v10;
            int64_t v2 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    *(void *)(v4 + (((unint64_t)v2 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << v2) - 1;
    uint64_t result = swift_release();
  }
  else
  {
    *(void *)(v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << result) - 1;
  }
  uint64_t v17 = *(void *)(v3 + 16);
  BOOL v18 = __OFSUB__(v17, 1);
  uint64_t v19 = v17 - 1;
  if (v18)
  {
    __break(1u);
  }
  else
  {
    *(void *)(v3 + 16) = v19;
    ++*(_DWORD *)(v3 + 36);
  }
  return result;
}

unint64_t sub_22016F380(unint64_t result)
{
  int64_t v2 = result;
  uint64_t v3 = *v1;
  uint64_t v4 = *v1 + 56;
  uint64_t v5 = -1 << *(unsigned char *)(*v1 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(v4 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    swift_retain();
    uint64_t v8 = sub_2201826F0();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v9 = (v8 + 1) & v7;
      do
      {
        sub_2201829B0();
        sub_220182490();
        swift_bridgeObjectRelease();
        unint64_t v10 = sub_220182A00() & v7;
        if (v2 >= (uint64_t)v9)
        {
          if (v10 < v9) {
            goto LABEL_5;
          }
        }
        else if (v10 >= v9)
        {
          goto LABEL_11;
        }
        if (v2 >= (uint64_t)v10)
        {
LABEL_11:
          uint64_t v11 = *(void *)(v3 + 48);
          uint64_t v12 = (unsigned char *)(v11 + v2);
          unint64_t v13 = (unsigned char *)(v11 + v6);
          if (v2 != v6 || (int64_t v2 = v6, v12 >= v13 + 1))
          {
            *uint64_t v12 = *v13;
            int64_t v2 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    *(void *)(v4 + (((unint64_t)v2 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << v2) - 1;
    uint64_t result = swift_release();
  }
  else
  {
    *(void *)(v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << result) - 1;
  }
  uint64_t v14 = *(void *)(v3 + 16);
  BOOL v15 = __OFSUB__(v14, 1);
  uint64_t v16 = v14 - 1;
  if (v15)
  {
    __break(1u);
    JUMPOUT(0x22016F5C0);
  }
  *(void *)(v3 + 16) = v16;
  ++*(_DWORD *)(v3 + 36);
  return result;
}

uint64_t sub_22016F5D0(void **__src, id *a2, unint64_t a3, void **__dst, uint64_t a5)
{
  uint64_t v5 = __dst;
  uint64_t v7 = a2;
  uint64_t v8 = __src;
  int64_t v9 = (char *)a2 - (char *)__src;
  int64_t v10 = (char *)a2 - (char *)__src + 7;
  if ((char *)a2 - (char *)__src >= 0) {
    int64_t v10 = (char *)a2 - (char *)__src;
  }
  uint64_t v11 = v10 >> 3;
  uint64_t v12 = a3 - (void)a2;
  uint64_t v13 = a3 - (void)a2 + 7;
  if ((uint64_t)(a3 - (void)a2) >= 0) {
    uint64_t v13 = a3 - (void)a2;
  }
  uint64_t v14 = v13 >> 3;
  uint64_t v46 = __src;
  uint64_t v45 = __dst;
  if (v11 >= v13 >> 3)
  {
    if (v12 >= -7)
    {
      if (__dst != a2 || &a2[v14] <= __dst) {
        memmove(__dst, a2, 8 * v14);
      }
      BOOL v25 = &v5[v14];
      char v44 = v25;
      uint64_t v46 = v7;
      if (v8 < v7 && v12 >= 8)
      {
        uint64_t v26 = (id *)(a3 - 8);
        uint64_t v27 = v7;
        uint64_t v38 = v5;
        uint64_t v39 = v8;
        while (1)
        {
          unint64_t v28 = (unint64_t)v25;
          BOOL v29 = v25 - 1;
          id v43 = *(v25 - 1);
          uint64_t v30 = *--v27;
          uint64_t v42 = v30;
          id v31 = v43;
          id v32 = v30;
          BOOL v33 = sub_22016AC68(&v43, &v42, a5);
          if (v41) {
            break;
          }
          BOOL v34 = v33;
          uint64_t v41 = 0;
          uint64_t v35 = v26 + 1;

          if (v34)
          {
            if (v35 != v7 || v26 >= v7) {
              id *v26 = *v27;
            }
            uint64_t v46 = v27;
            char v36 = v38;
            BOOL v25 = (void **)v28;
            if (v27 <= v39) {
              goto LABEL_48;
            }
          }
          else
          {
            char v44 = v29;
            if ((unint64_t)v35 < v28 || (unint64_t)v26 >= v28 || v35 != (id *)v28) {
              id *v26 = *v29;
            }
            uint64_t v27 = v7;
            BOOL v25 = v29;
            char v36 = v38;
            if (v7 <= v39) {
              goto LABEL_48;
            }
          }
          --v26;
          uint64_t v7 = v27;
          if (v25 <= v36) {
            goto LABEL_48;
          }
        }
      }
      goto LABEL_48;
    }
  }
  else if (v9 >= -7)
  {
    if (__dst != __src || &__src[v11] <= __dst) {
      memmove(__dst, __src, 8 * v11);
    }
    BOOL v15 = &v5[v11];
    char v44 = v15;
    if ((unint64_t)v7 < a3 && v9 >= 8)
    {
      while (1)
      {
        uint64_t v16 = v8;
        id v43 = *v7;
        uint64_t v17 = v5;
        uint64_t v42 = *v5;
        BOOL v18 = v42;
        id v19 = v43;
        id v20 = v18;
        BOOL v21 = sub_22016AC68(&v43, &v42, a5);
        if (v41) {
          break;
        }
        BOOL v22 = v21;

        if (v22)
        {
          char v23 = v7 + 1;
          uint64_t v24 = v16;
          if (v16 < v7 || v16 >= v23 || v16 != v7) {
            *uint64_t v16 = *v7;
          }
          uint64_t v5 = v17;
        }
        else
        {
          uint64_t v24 = v16;
          if (v16 != v17) {
            *uint64_t v16 = *v17;
          }
          uint64_t v5 = v17 + 1;
          uint64_t v45 = v17 + 1;
          char v23 = v7;
        }
        uint64_t v41 = 0;
        uint64_t v8 = v24 + 1;
        uint64_t v46 = v8;
        if (v5 < v15)
        {
          uint64_t v7 = v23;
          if ((unint64_t)v23 < a3) {
            continue;
          }
        }
        goto LABEL_48;
      }
    }
LABEL_48:
    sub_22016FA30((void **)&v46, (const void **)&v45, &v44);
    swift_bridgeObjectRelease();
    return 1;
  }
  swift_bridgeObjectRelease();
  uint64_t result = sub_2201828B0();
  __break(1u);
  return result;
}

char *sub_22016F934(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_267F0A9E8);
    int64_t v10 = (char *)swift_allocObject();
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
    int64_t v10 = (char *)MEMORY[0x263F8EE78];
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

char *sub_22016FA30(void **a1, const void **a2, void *a3)
{
  uint64_t v3 = (char *)*a2;
  uint64_t v4 = *a3 - (void)v3;
  uint64_t v5 = v4 + 7;
  if (v4 >= 0) {
    uint64_t v5 = *a3 - (void)v3;
  }
  if (v4 <= -8)
  {
    uint64_t result = (char *)sub_2201828B0();
    __break(1u);
  }
  else
  {
    uint64_t result = (char *)*a1;
    uint64_t v7 = v5 >> 3;
    if (result != v3 || result >= &v3[8 * v7])
    {
      return (char *)memmove(result, v3, 8 * v7);
    }
  }
  return result;
}

char *sub_22016FAEC(uint64_t a1)
{
  return sub_22016F934(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_22016FB00(uint64_t a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F0A9D8);
  uint64_t result = sub_220182880();
  uint64_t v3 = (void *)result;
  int64_t v4 = 0;
  uint64_t v37 = a1;
  uint64_t v5 = *(void *)(a1 + 64);
  BOOL v33 = (void *)result;
  uint64_t v34 = a1 + 64;
  uint64_t v6 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v7 = -1;
  if (v6 < 64) {
    uint64_t v7 = ~(-1 << v6);
  }
  unint64_t v8 = v7 & v5;
  int64_t v35 = (unint64_t)(v6 + 63) >> 6;
  uint64_t v36 = result + 64;
  if ((v7 & v5) == 0) {
    goto LABEL_5;
  }
LABEL_4:
  unint64_t v9 = __clz(__rbit64(v8));
  v8 &= v8 - 1;
  for (unint64_t i = v9 | (v4 << 6); ; unint64_t i = __clz(__rbit64(v12)) + (v4 << 6))
  {
    char v14 = *(unsigned char *)(*(void *)(v37 + 48) + i);
    unint64_t v15 = *(void *)(*(void *)(v37 + 56) + 8 * i);
    if (v15 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v16 = sub_220182870();
      if (!v16)
      {
LABEL_31:
        uint64_t result = swift_bridgeObjectRelease();
        uint64_t v18 = MEMORY[0x263F8EE78];
        goto LABEL_32;
      }
    }
    else
    {
      uint64_t v16 = *(void *)((v15 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      if (!v16) {
        goto LABEL_31;
      }
    }
    char v41 = v14;
    uint64_t v43 = MEMORY[0x263F8EE78];
    uint64_t result = sub_22015FB60(0, v16 & ~(v16 >> 63), 0);
    if (v16 < 0) {
      goto LABEL_37;
    }
    unint64_t v38 = i;
    unint64_t v39 = v8;
    int64_t v40 = v4;
    uint64_t v17 = 0;
    uint64_t v18 = v43;
    unint64_t v42 = v15 & 0xC000000000000001;
    unint64_t v19 = v15;
    uint64_t v20 = v16;
    do
    {
      if (v42) {
        id v21 = (id)MEMORY[0x223C66AB0](v17, v15);
      }
      else {
        id v21 = *(id *)(v15 + 8 * v17 + 32);
      }
      BOOL v22 = v21;
      id v23 = objc_msgSend(v21, sel_sourceIdentifier);
      uint64_t v24 = sub_220182460();
      uint64_t v26 = v25;

      unint64_t v28 = *(void *)(v43 + 16);
      unint64_t v27 = *(void *)(v43 + 24);
      if (v28 >= v27 >> 1) {
        sub_22015FB60(v27 > 1, v28 + 1, 1);
      }
      ++v17;
      *(void *)(v43 + 16) = v28 + 1;
      uint64_t v29 = v43 + 16 * v28;
      *(void *)(v29 + 32) = v24;
      *(void *)(v29 + 40) = v26;
      unint64_t v15 = v19;
    }
    while (v20 != v17);
    uint64_t result = swift_bridgeObjectRelease();
    uint64_t v3 = v33;
    unint64_t v8 = v39;
    int64_t v4 = v40;
    unint64_t i = v38;
    char v14 = v41;
LABEL_32:
    *(void *)(v36 + ((i >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << i;
    *(unsigned char *)(v3[6] + i) = v14;
    *(void *)(v3[7] + 8 * i) = v18;
    uint64_t v30 = v3[2];
    BOOL v31 = __OFADD__(v30, 1);
    uint64_t v32 = v30 + 1;
    if (v31)
    {
      __break(1u);
LABEL_37:
      __break(1u);
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    v3[2] = v32;
    if (v8) {
      goto LABEL_4;
    }
LABEL_5:
    int64_t v11 = v4 + 1;
    if (__OFADD__(v4, 1)) {
      goto LABEL_38;
    }
    if (v11 >= v35) {
      return (uint64_t)v3;
    }
    unint64_t v12 = *(void *)(v34 + 8 * v11);
    ++v4;
    if (!v12)
    {
      int64_t v4 = v11 + 1;
      if (v11 + 1 >= v35) {
        return (uint64_t)v3;
      }
      unint64_t v12 = *(void *)(v34 + 8 * v4);
      if (!v12)
      {
        int64_t v4 = v11 + 2;
        if (v11 + 2 >= v35) {
          return (uint64_t)v3;
        }
        unint64_t v12 = *(void *)(v34 + 8 * v4);
        if (!v12) {
          break;
        }
      }
    }
LABEL_18:
    unint64_t v8 = (v12 - 1) & v12;
  }
  int64_t v13 = v11 + 3;
  if (v13 >= v35) {
    return (uint64_t)v3;
  }
  unint64_t v12 = *(void *)(v34 + 8 * v13);
  if (v12)
  {
    int64_t v4 = v13;
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v4 = v13 + 1;
    if (__OFADD__(v13, 1)) {
      break;
    }
    if (v4 >= v35) {
      return (uint64_t)v3;
    }
    unint64_t v12 = *(void *)(v34 + 8 * v4);
    ++v13;
    if (v12) {
      goto LABEL_18;
    }
  }
LABEL_39:
  __break(1u);
  return result;
}

void *sub_22016FE4C(void *result, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4;
  uint64_t v6 = a2;
  uint64_t v7 = result;
  if ((a4 & 0xC000000000000001) != 0)
  {
    sub_220182710();
    sub_220149EE0(0, (unint64_t *)&qword_267F0A9A0);
    sub_2201728DC();
    uint64_t result = (void *)sub_2201825D0();
    uint64_t v4 = v27;
    uint64_t v8 = v28;
    uint64_t v9 = v29;
    int64_t v10 = v30;
    unint64_t v11 = v31;
    uint64_t v24 = v7;
    if (v6) {
      goto LABEL_3;
    }
LABEL_36:
    uint64_t v12 = 0;
LABEL_46:
    *uint64_t v24 = v4;
    v24[1] = v8;
    v24[2] = v9;
    v24[3] = v10;
    v24[4] = v11;
    return (void *)v12;
  }
  int64_t v10 = 0;
  uint64_t v20 = -1 << *(unsigned char *)(a4 + 32);
  uint64_t v8 = a4 + 56;
  uint64_t v9 = ~v20;
  uint64_t v21 = -v20;
  if (v21 < 64) {
    uint64_t v22 = ~(-1 << v21);
  }
  else {
    uint64_t v22 = -1;
  }
  unint64_t v11 = v22 & *(void *)(a4 + 56);
  uint64_t v24 = result;
  if (!a2) {
    goto LABEL_36;
  }
LABEL_3:
  if (!a3)
  {
    uint64_t v12 = 0;
    goto LABEL_46;
  }
  if (a3 < 0) {
    goto LABEL_48;
  }
  uint64_t v12 = 0;
  int64_t v25 = (unint64_t)(v9 + 64) >> 6;
  uint64_t v23 = v9;
  while (1)
  {
    if (v4 < 0)
    {
      if (!sub_220182740()) {
        goto LABEL_45;
      }
      sub_220149EE0(0, (unint64_t *)&qword_267F0A9A0);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      unint64_t v15 = v26;
      uint64_t result = (void *)swift_unknownObjectRelease();
      if (!v26) {
        goto LABEL_45;
      }
      goto LABEL_8;
    }
    if (v11)
    {
      unint64_t v13 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      unint64_t v14 = v13 | (v10 << 6);
      goto LABEL_7;
    }
    int64_t v16 = v10 + 1;
    if (__OFADD__(v10, 1)) {
      break;
    }
    if (v16 >= v25)
    {
      unint64_t v11 = 0;
      goto LABEL_45;
    }
    unint64_t v17 = *(void *)(v8 + 8 * v16);
    if (v17) {
      goto LABEL_23;
    }
    int64_t v18 = v10 + 2;
    if (v10 + 2 >= v25)
    {
      unint64_t v11 = 0;
      ++v10;
      goto LABEL_45;
    }
    unint64_t v17 = *(void *)(v8 + 8 * v18);
    if (!v17)
    {
      if (v10 + 3 >= v25) {
        goto LABEL_42;
      }
      unint64_t v17 = *(void *)(v8 + 8 * (v10 + 3));
      if (v17)
      {
        int64_t v16 = v10 + 3;
        goto LABEL_23;
      }
      int64_t v18 = v10 + 4;
      if (v10 + 4 >= v25)
      {
        unint64_t v11 = 0;
        v10 += 3;
        goto LABEL_45;
      }
      unint64_t v17 = *(void *)(v8 + 8 * v18);
      if (!v17)
      {
        int64_t v16 = v10 + 5;
        if (v10 + 5 >= v25)
        {
LABEL_42:
          unint64_t v11 = 0;
          int64_t v10 = v18;
          goto LABEL_45;
        }
        unint64_t v17 = *(void *)(v8 + 8 * v16);
        if (!v17)
        {
          int64_t v19 = v10 + 6;
          while (v25 != v19)
          {
            unint64_t v17 = *(void *)(v8 + 8 * v19++);
            if (v17)
            {
              int64_t v16 = v19 - 1;
              goto LABEL_23;
            }
          }
          unint64_t v11 = 0;
          int64_t v10 = v25 - 1;
          goto LABEL_45;
        }
        goto LABEL_23;
      }
    }
    int64_t v16 = v18;
LABEL_23:
    unint64_t v11 = (v17 - 1) & v17;
    unint64_t v14 = __clz(__rbit64(v17)) + (v16 << 6);
    int64_t v10 = v16;
LABEL_7:
    uint64_t result = *(id *)(*(void *)(v4 + 48) + 8 * v14);
    unint64_t v15 = result;
    if (!result) {
      goto LABEL_45;
    }
LABEL_8:
    ++v12;
    *v6++ = v15;
    if (v12 == a3)
    {
      uint64_t v12 = a3;
LABEL_45:
      uint64_t v9 = v23;
      goto LABEL_46;
    }
  }
  __break(1u);
LABEL_48:
  __break(1u);
  return result;
}

void sub_220170158()
{
}

uint64_t sub_22017016C(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 56);
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
  unint64_t v1 = *(void *)(a1 + 64);
  if (v1)
  {
    uint64_t v2 = 64;
    return __clz(__rbit64(v1)) + v2;
  }
  if (v6 < 8) {
    return v3;
  }
  unint64_t v1 = *(void *)(a1 + 72);
  if (v1)
  {
    uint64_t v2 = 128;
    return __clz(__rbit64(v1)) + v2;
  }
  unint64_t v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 3) {
    unint64_t v7 = 3;
  }
  unint64_t v8 = v7 - 3;
  uint64_t v9 = (unint64_t *)(a1 + 80);
  uint64_t v2 = 128;
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

int64_t sub_22017020C(int64_t result, int a2, char a3, uint64_t a4)
{
  if (a3) {
    goto LABEL_20;
  }
  unint64_t v4 = result;
  if (result < 0 || (uint64_t result = 1 << *(unsigned char *)(a4 + 32), result <= (uint64_t)v4))
  {
    __break(1u);
    goto LABEL_18;
  }
  unint64_t v5 = v4 >> 6;
  uint64_t v6 = a4 + 56;
  unint64_t v7 = *(void *)(a4 + 56 + 8 * (v4 >> 6));
  if (((v7 >> v4) & 1) == 0)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  if (*(_DWORD *)(a4 + 36) != a2)
  {
LABEL_19:
    __break(1u);
LABEL_20:
    __break(1u);
    return result;
  }
  unint64_t v8 = v7 & (-2 << (v4 & 0x3F));
  if (v8) {
    return __clz(__rbit64(v8)) | v4 & 0xFFFFFFFFFFFFFFC0;
  }
  unint64_t v9 = v5 + 1;
  unint64_t v10 = (unint64_t)(result + 63) >> 6;
  if (v5 + 1 < v10)
  {
    unint64_t v11 = *(void *)(v6 + 8 * v9);
    if (v11) {
      return __clz(__rbit64(v11)) + (v9 << 6);
    }
    unint64_t v9 = v5 + 2;
    if (v5 + 2 < v10)
    {
      unint64_t v11 = *(void *)(v6 + 8 * v9);
      if (v11) {
        return __clz(__rbit64(v11)) + (v9 << 6);
      }
      while (v10 - 3 != v5)
      {
        unint64_t v11 = *(void *)(a4 + 80 + 8 * v5++);
        if (v11)
        {
          unint64_t v9 = v5 + 2;
          return __clz(__rbit64(v11)) + (v9 << 6);
        }
      }
    }
  }
  return result;
}

uint64_t sub_2201702F0(uint64_t a1, uint64_t a2)
{
  uint64_t v17 = a2 + 64;
  uint64_t v3 = 1 << *(unsigned char *)(a2 + 32);
  uint64_t v4 = -1;
  if (v3 < 64) {
    uint64_t v4 = ~(-1 << v3);
  }
  unint64_t v5 = v4 & *(void *)(a2 + 64);
  int64_t v18 = (unint64_t)(v3 + 63) >> 6;
  swift_bridgeObjectRetain();
  uint64_t v6 = 0;
  int64_t v7 = 0;
  while (1)
  {
    if (v5)
    {
      unint64_t v8 = __clz(__rbit64(v5));
      v5 &= v5 - 1;
      unint64_t v9 = v8 | (v7 << 6);
      goto LABEL_19;
    }
    int64_t v10 = v7 + 1;
    if (__OFADD__(v7, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v10 >= v18) {
      goto LABEL_23;
    }
    unint64_t v11 = *(void *)(v17 + 8 * v10);
    ++v7;
    if (!v11)
    {
      int64_t v7 = v10 + 1;
      if (v10 + 1 >= v18) {
        goto LABEL_23;
      }
      unint64_t v11 = *(void *)(v17 + 8 * v7);
      if (!v11) {
        break;
      }
    }
LABEL_18:
    unint64_t v5 = (v11 - 1) & v11;
    unint64_t v9 = __clz(__rbit64(v11)) + (v7 << 6);
LABEL_19:
    uint64_t v13 = *(void *)(*(void *)(a2 + 56) + 8 * v9);
    swift_bridgeObjectRetain();
    sub_220182490();
    swift_bridgeObjectRelease();
    sub_2201829C0();
    uint64_t v14 = *(void *)(v13 + 16);
    if (v14)
    {
      uint64_t v15 = v13 + 40;
      do
      {
        swift_bridgeObjectRetain();
        sub_220182490();
        swift_bridgeObjectRelease();
        v15 += 16;
        --v14;
      }
      while (v14);
    }
    swift_bridgeObjectRelease();
    v6 ^= sub_220182A00();
  }
  int64_t v12 = v10 + 2;
  if (v12 < v18)
  {
    unint64_t v11 = *(void *)(v17 + 8 * v12);
    if (!v11)
    {
      while (1)
      {
        int64_t v7 = v12 + 1;
        if (__OFADD__(v12, 1)) {
          break;
        }
        if (v7 >= v18) {
          goto LABEL_23;
        }
        unint64_t v11 = *(void *)(v17 + 8 * v7);
        ++v12;
        if (v11) {
          goto LABEL_18;
        }
      }
LABEL_25:
      __break(1u);
      JUMPOUT(0x220170570);
    }
    int64_t v7 = v12;
    goto LABEL_18;
  }
LABEL_23:
  swift_release();
  return sub_2201829C0();
}

char *sub_220170580(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  size_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = (char *)(a4 + a1 + 32);
    uint64_t v6 = &__dst[v4];
    if (v5 >= &__dst[v4] || &v5[v4] <= __dst)
    {
      memcpy(__dst, v5, v4);
      return v6;
    }
  }
  uint64_t result = (char *)sub_2201828B0();
  __break(1u);
  return result;
}

uint64_t sub_220170668(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 24 * a1 + 32;
    unint64_t v6 = a3 + 24 * v4;
    if (v5 >= v6 || v5 + 24 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_2201828B0();
  __break(1u);
  return result;
}

uint64_t sub_220170760(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 32 * a1 + 32;
    unint64_t v6 = a3 + 32 * v4;
    if (v5 >= v6 || v5 + 32 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_2201828B0();
  __break(1u);
  return result;
}

uint64_t sub_220170854()
{
  uint64_t v7 = MEMORY[0x263F8EE88];
  uint64_t v0 = self;
  uint64_t v1 = swift_allocObject();
  *(void *)(v1 + 16) = &v7;
  uint64_t v2 = swift_allocObject();
  *(void *)(v2 + 16) = sub_220172A5C;
  *(void *)(v2 + 24) = v1;
  aBlock[4] = sub_220172A74;
  aBlock[5] = v2;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  id aBlock[2] = sub_22016B1F4;
  aBlock[3] = &block_descriptor_39;
  uint64_t v3 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  objc_msgSend((id)v0, sel_unkit_enumerateApplicationRecordsEligibleToDeliverNotifications_, v3);
  _Block_release(v3);
  LOBYTE(v0) = swift_isEscapingClosureAtFileLocation();
  uint64_t result = swift_release();
  if (v0)
  {
    __break(1u);
  }
  else
  {
    uint64_t v5 = v7;
    swift_release();
    return v5;
  }
  return result;
}

uint64_t sub_2201709C8()
{
  id v0 = objc_msgSend(self, sel_currentNotificationSettingsCenter);
  id v1 = objc_msgSend(v0, sel_notificationSourcesWithFilter_, *MEMORY[0x263F845C0]);

  sub_220149EE0(0, (unint64_t *)&qword_267F0A9A0);
  sub_2201728DC();
  uint64_t v2 = sub_2201825C0();

  uint64_t v13 = v2;
  if ((v2 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_220182720();
    swift_bridgeObjectRelease();
    if (v3) {
      goto LABEL_14;
    }
  }
  else if (*(void *)(v2 + 16))
  {
    goto LABEL_14;
  }
  swift_bridgeObjectRelease();
  if (qword_267F09C80 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_220181C80();
  __swift_project_value_buffer(v4, (uint64_t)qword_267F0C120);
  uint64_t v5 = sub_220181C60();
  os_log_type_t v6 = sub_220182600();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl(&dword_22012C000, v5, v6, "[Loading notification sources] Unable to load UserNotificationsSettings notification sources. Perhaps you are missing an entitlement?", v7, 2u);
    MEMORY[0x223C676F0](v7, -1, -1);
  }

  uint64_t v8 = sub_220170854();
  uint64_t v13 = v8;
  swift_bridgeObjectRetain();
  unint64_t v9 = sub_220181C60();
  os_log_type_t v10 = sub_2201825F0();
  if (os_log_type_enabled(v9, v10))
  {
    unint64_t v11 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)unint64_t v11 = 134349056;
    if ((v8 & 0xC000000000000001) != 0) {
      sub_220182720();
    }
    sub_2201826B0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_22012C000, v9, v10, "[Loading notification sources] Loaded %{public}ld sources from LaunchServices. This might be missing system sources provided by UserNotificationsSettings.", v11, 0xCu);
    MEMORY[0x223C676F0](v11, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease();
  }
LABEL_14:
  swift_beginAccess();
  return v13;
}

void sub_220170C68(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t a5)
{
  if (a3 != a2)
  {
    uint64_t v5 = a5;
    uint64_t v6 = a3;
    uint64_t v42 = *a4;
    uint64_t v7 = *a4 + 8 * a3 - 8;
LABEL_6:
    uint64_t v8 = *(void **)(v42 + 8 * v6);
    uint64_t v9 = a1;
    uint64_t v40 = v7;
    uint64_t v41 = v6;
    while (1)
    {
      os_log_type_t v10 = *(void **)v7;
      id v11 = v8;
      id v46 = v10;
      if (v5)
      {
        id v43 = v11;
        id v12 = objc_msgSend(v11, sel_sourceIdentifier);
        uint64_t v13 = sub_220182460();
        uint64_t v15 = v14;

        if (*(void *)(v5 + 16) && (unint64_t v16 = sub_22017A2C8(v13, v15), (v17 & 1) != 0)) {
          uint64_t v18 = *(void *)(*(void *)(v5 + 56) + 8 * v16);
        }
        else {
          uint64_t v18 = 0;
        }
        swift_bridgeObjectRelease();
        id v19 = objc_msgSend(v46, sel_sourceIdentifier);
        uint64_t v20 = sub_220182460();
        uint64_t v22 = v21;

        if (*(void *)(v5 + 16) && (v23 = sub_22017A2C8(v20, v22), uint64_t v5 = a5, (v24 & 1) != 0))
        {
          uint64_t v25 = *(void *)(*(void *)(a5 + 56) + 8 * v23);
          swift_bridgeObjectRelease();
          id v11 = v43;
          if (v18 != v25) {
            goto LABEL_18;
          }
        }
        else
        {
          swift_bridgeObjectRelease();
          id v11 = v43;
          if (v18)
          {
            uint64_t v25 = 0;
LABEL_18:

            if (v25 >= v18) {
              goto LABEL_5;
            }
            goto LABEL_25;
          }
        }
      }
      uint64_t v44 = v9;
      id v26 = objc_msgSend(v11, sel_displayName);
      sub_220182460();
      uint64_t v27 = v11;

      uint64_t v28 = sub_220182480();
      uint64_t v30 = v29;
      swift_bridgeObjectRelease();
      id v31 = objc_msgSend(v46, sel_displayName);
      sub_220182460();

      uint64_t v32 = sub_220182480();
      uint64_t v34 = v33;
      swift_bridgeObjectRelease();
      if (v28 == v32 && v30 == v34)
      {

        swift_bridgeObjectRelease_n();
        uint64_t v6 = v41;
        uint64_t v5 = a5;
LABEL_5:
        ++v6;
        uint64_t v7 = v40 + 8;
        if (v6 == a2) {
          return;
        }
        goto LABEL_6;
      }
      char v36 = sub_220182910();

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v6 = v41;
      uint64_t v9 = v44;
      uint64_t v5 = a5;
      if ((v36 & 1) == 0) {
        goto LABEL_5;
      }
LABEL_25:
      if (!v42)
      {
        __break(1u);
        return;
      }
      uint64_t v37 = *(void **)v7;
      uint64_t v8 = *(void **)(v7 + 8);
      *(void *)uint64_t v7 = v8;
      *(void *)(v7 + 8) = v37;
      v7 -= 8;
      if (v6 == ++v9) {
        goto LABEL_5;
      }
    }
  }
}

uint64_t sub_220170F40(uint64_t *a1, uint64_t a2)
{
  uint64_t v4 = a1;
  uint64_t v5 = a1[1];
  swift_bridgeObjectRetain_n();
  uint64_t v6 = sub_2201828E0();
  if (v6 >= v5)
  {
    if (v5 < 0) {
      goto LABEL_174;
    }
    if (v5)
    {
      swift_bridgeObjectRetain();
      sub_220170C68(0, v5, 1, v4, a2);
    }
    return swift_bridgeObjectRelease_n();
  }
  if (v5 >= 0) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = v5 + 1;
  }
  if (v5 < -1) {
    goto LABEL_182;
  }
  uint64_t v171 = v5;
  uint64_t v167 = v6;
  uint64_t v177 = v2;
  uint64_t v164 = v4;
  if (v5 < 2)
  {
    uint64_t v12 = v5;
    uint64_t v13 = (char *)MEMORY[0x263F8EE78];
    uint64_t v189 = MEMORY[0x263F8EE78];
    __dst = (void **)((MEMORY[0x263F8EE78] & 0xFFFFFFFFFFFFFF8) + 32);
    if (v12 != 1)
    {
      unint64_t v101 = *(void *)(MEMORY[0x263F8EE78] + 16);
      goto LABEL_139;
    }
  }
  else
  {
    uint64_t v8 = v4;
    uint64_t v9 = v7 >> 1;
    sub_220149EE0(0, (unint64_t *)&qword_267F0A9A0);
    uint64_t v10 = sub_220182530();
    *(void *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10) = v9;
    uint64_t v4 = v8;
    __dst = (void **)((v10 & 0xFFFFFFFFFFFFFF8) + 32);
    uint64_t v189 = v10;
  }
  uint64_t v14 = 0;
  uint64_t v165 = *v4 + 16;
  uint64_t v166 = *v4 - 8;
  uint64_t v13 = (char *)MEMORY[0x263F8EE78];
  uint64_t v178 = *v4;
  uint64_t v179 = a2;
  uint64_t v15 = v171;
  uint64_t v16 = *v4;
  do
  {
    uint64_t v17 = v14;
    uint64_t v18 = v14 + 1;
    uint64_t v175 = v14;
    if (v14 + 1 >= v15)
    {
      uint64_t v53 = v167;
    }
    else
    {
      id v19 = *(void **)(v16 + 8 * v18);
      uint64_t v187 = *(void **)(v16 + 8 * v14);
      uint64_t v20 = v187;
      id v188 = v19;
      id v21 = v19;
      id v22 = v20;
      BOOL v183 = sub_22016AC68(&v188, &v187, a2);
      if (v177)
      {
        swift_bridgeObjectRelease();

        goto LABEL_151;
      }

      uint64_t v18 = v17 + 2;
      if (v17 + 2 < v171)
      {
        unint64_t v23 = (id *)(v165 + 8 * v17);
        while (1)
        {
          uint64_t v180 = v18;
          char v24 = *(v23 - 1);
          id v25 = *v23;
          id v26 = v24;
          if (!a2) {
            break;
          }
          id v172 = v25;
          id v27 = objc_msgSend(v25, sel_sourceIdentifier);
          uint64_t v28 = sub_220182460();
          uint64_t v30 = v29;

          if (*(void *)(a2 + 16))
          {
            unint64_t v31 = sub_22017A2C8(v28, v30);
            uint64_t v32 = v26;
            if (v33) {
              uint64_t v34 = *(void *)(*(void *)(a2 + 56) + 8 * v31);
            }
            else {
              uint64_t v34 = 0;
            }
          }
          else
          {
            uint64_t v34 = 0;
            uint64_t v32 = v26;
          }
          swift_bridgeObjectRelease();
          id v35 = objc_msgSend(v32, sel_sourceIdentifier);
          uint64_t v36 = sub_220182460();
          uint64_t v38 = v37;

          if (*(void *)(a2 + 16) && (unint64_t v39 = sub_22017A2C8(v36, v38), (v40 & 1) != 0))
          {
            uint64_t v41 = *(void *)(*(void *)(a2 + 56) + 8 * v39);
            swift_bridgeObjectRelease();
            uint64_t v16 = v178;
            id v25 = v172;
            if (v34 == v41) {
              break;
            }
          }
          else
          {
            swift_bridgeObjectRelease();
            uint64_t v16 = v178;
            id v25 = v172;
            if (!v34) {
              break;
            }
            uint64_t v41 = 0;
          }

          int v42 = v41 < v34;
LABEL_38:
          uint64_t v18 = v180;
          uint64_t v17 = v175;
          if ((v183 ^ v42)) {
            goto LABEL_41;
          }
          uint64_t v18 = v180 + 1;
          ++v23;
          if (v171 == v180 + 1)
          {
            uint64_t v18 = v171;
            goto LABEL_41;
          }
        }
        id v43 = v25;
        id v44 = objc_msgSend(v25, sel_displayName);
        sub_220182460();

        uint64_t v45 = sub_220182480();
        uint64_t v47 = v46;
        swift_bridgeObjectRelease();
        id v48 = objc_msgSend(v26, sel_displayName);
        sub_220182460();

        uint64_t v49 = sub_220182480();
        uint64_t v51 = v50;
        swift_bridgeObjectRelease();
        if (v45 == v49 && v47 == v51) {
          int v42 = 0;
        }
        else {
          int v42 = sub_220182910();
        }
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();

        uint64_t v16 = v178;
        a2 = v179;
        goto LABEL_38;
      }
LABEL_41:
      uint64_t v53 = v167;
      if (v183)
      {
        if (v18 < v17) {
          goto LABEL_177;
        }
        if (v17 < v18)
        {
          uint64_t v54 = (uint64_t *)(v166 + 8 * v18);
          uint64_t v55 = v18;
          uint64_t v56 = v17;
          char v57 = (uint64_t *)(v16 + 8 * v17);
          do
          {
            if (v56 != --v55)
            {
              if (!v16) {
                goto LABEL_180;
              }
              uint64_t v58 = *v57;
              *char v57 = *v54;
              uint64_t *v54 = v58;
            }
            ++v56;
            --v54;
            ++v57;
          }
          while (v56 < v55);
        }
      }
    }
    if (v18 >= v171) {
      goto LABEL_86;
    }
    if (__OFSUB__(v18, v17)) {
      goto LABEL_173;
    }
    if (v18 - v17 >= v53) {
      goto LABEL_86;
    }
    if (__OFADD__(v17, v53)) {
      goto LABEL_175;
    }
    uint64_t v59 = v171;
    if (v17 + v53 < v171) {
      uint64_t v59 = v17 + v53;
    }
    if (v59 < v17)
    {
LABEL_176:
      __break(1u);
LABEL_177:
      __break(1u);
LABEL_178:
      swift_bridgeObjectRelease_n();
      __break(1u);
LABEL_179:
      swift_bridgeObjectRelease_n();
      __break(1u);
LABEL_180:
      swift_bridgeObjectRelease_n();
      __break(1u);
LABEL_181:
      swift_bridgeObjectRelease_n();
      __break(1u);
LABEL_182:
      swift_bridgeObjectRelease_n();
      uint64_t result = sub_220182850();
      __break(1u);
      return result;
    }
    if (v18 == v59) {
      goto LABEL_86;
    }
    uint64_t v168 = v13;
    uint64_t v170 = v59;
    uint64_t v60 = v166 + 8 * v18;
    uint64_t v61 = v16;
    while (2)
    {
      uint64_t v63 = v60;
      uint64_t v64 = *(void **)(v61 + 8 * v18);
      uint64_t v65 = v17;
      uint64_t v173 = v63;
      uint64_t v66 = v63;
      uint64_t v181 = v18;
      while (1)
      {
        uint64_t v184 = v65;
        id v67 = *(void **)v66;
        id v68 = v64;
        id v69 = v67;
        if (!a2) {
          break;
        }
        id v70 = v68;
        id v71 = objc_msgSend(v68, sel_sourceIdentifier);
        uint64_t v72 = sub_220182460();
        uint64_t v74 = v73;

        if (*(void *)(a2 + 16))
        {
          unint64_t v75 = sub_22017A2C8(v72, v74);
          uint64_t v76 = v69;
          if (v77) {
            uint64_t v78 = *(void *)(*(void *)(a2 + 56) + 8 * v75);
          }
          else {
            uint64_t v78 = 0;
          }
        }
        else
        {
          uint64_t v78 = 0;
          uint64_t v76 = v69;
        }
        swift_bridgeObjectRelease();
        id v79 = objc_msgSend(v76, sel_sourceIdentifier);
        uint64_t v80 = sub_220182460();
        uint64_t v82 = v81;

        if (*(void *)(a2 + 16) && (unint64_t v83 = sub_22017A2C8(v80, v82), (v84 & 1) != 0))
        {
          uint64_t v85 = *(void *)(*(void *)(a2 + 56) + 8 * v83);
          swift_bridgeObjectRelease();
          id v68 = v70;
          if (v78 == v85) {
            break;
          }
        }
        else
        {
          swift_bridgeObjectRelease();
          id v68 = v70;
          if (!v78) {
            break;
          }
          uint64_t v85 = 0;
        }

        if (v85 >= v78) {
          goto LABEL_60;
        }
LABEL_82:
        uint64_t v62 = v181;
        if (!v61) {
          goto LABEL_178;
        }
        long long v98 = *(void **)v66;
        uint64_t v64 = *(void **)(v66 + 8);
        *(void *)uint64_t v66 = v64;
        *(void *)(v66 + 8) = v98;
        v66 -= 8;
        uint64_t v65 = v184 + 1;
        if (v181 == v184 + 1) {
          goto LABEL_61;
        }
      }
      id v86 = objc_msgSend(v68, sel_displayName);
      sub_220182460();
      uint64_t v87 = v68;

      uint64_t v88 = sub_220182480();
      uint64_t v90 = v89;
      swift_bridgeObjectRelease();
      uint64_t v91 = v69;
      id v92 = objc_msgSend(v69, sel_displayName);
      sub_220182460();

      uint64_t v93 = sub_220182480();
      uint64_t v95 = v94;
      swift_bridgeObjectRelease();
      if (v88 != v93 || v90 != v95)
      {
        char v97 = sub_220182910();

        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v61 = v178;
        a2 = v179;
        if ((v97 & 1) == 0) {
          goto LABEL_60;
        }
        goto LABEL_82;
      }

      swift_bridgeObjectRelease_n();
      uint64_t v61 = v178;
      a2 = v179;
LABEL_60:
      uint64_t v62 = v181;
LABEL_61:
      uint64_t v18 = v62 + 1;
      uint64_t v60 = v173 + 8;
      uint64_t v17 = v175;
      if (v18 != v170) {
        continue;
      }
      break;
    }
    uint64_t v16 = v61;
    uint64_t v18 = v170;
    uint64_t v13 = v168;
LABEL_86:
    if (v18 < v17) {
      goto LABEL_169;
    }
    uint64_t v182 = v18;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v13 = sub_22016F934(0, *((void *)v13 + 2) + 1, 1, v13);
    }
    unint64_t v100 = *((void *)v13 + 2);
    unint64_t v99 = *((void *)v13 + 3);
    unint64_t v101 = v100 + 1;
    if (v100 >= v99 >> 1) {
      uint64_t v13 = sub_22016F934((char *)(v99 > 1), v100 + 1, 1, v13);
    }
    *((void *)v13 + 2) = v101;
    uint64_t v102 = v13 + 32;
    uint64_t v103 = &v13[16 * v100 + 32];
    *(void *)uint64_t v103 = v17;
    *((void *)v103 + 1) = v182;
    if (v100)
    {
      while (2)
      {
        unint64_t v104 = v101 - 1;
        if (v101 >= 4)
        {
          uint64_t v109 = &v102[16 * v101];
          uint64_t v110 = *((void *)v109 - 8);
          uint64_t v111 = *((void *)v109 - 7);
          BOOL v115 = __OFSUB__(v111, v110);
          uint64_t v112 = v111 - v110;
          if (v115) {
            goto LABEL_157;
          }
          uint64_t v114 = *((void *)v109 - 6);
          uint64_t v113 = *((void *)v109 - 5);
          BOOL v115 = __OFSUB__(v113, v114);
          uint64_t v107 = v113 - v114;
          char v108 = v115;
          if (v115) {
            goto LABEL_158;
          }
          unint64_t v116 = v101 - 2;
          uint64_t v117 = &v102[16 * v101 - 32];
          uint64_t v119 = *(void *)v117;
          uint64_t v118 = *((void *)v117 + 1);
          BOOL v115 = __OFSUB__(v118, v119);
          uint64_t v120 = v118 - v119;
          if (v115) {
            goto LABEL_160;
          }
          BOOL v115 = __OFADD__(v107, v120);
          uint64_t v121 = v107 + v120;
          if (v115) {
            goto LABEL_163;
          }
          if (v121 >= v112)
          {
            long long v139 = &v102[16 * v104];
            uint64_t v141 = *(void *)v139;
            uint64_t v140 = *((void *)v139 + 1);
            BOOL v115 = __OFSUB__(v140, v141);
            uint64_t v142 = v140 - v141;
            if (v115) {
              goto LABEL_167;
            }
            BOOL v132 = v107 < v142;
          }
          else
          {
LABEL_105:
            if (v108) {
              goto LABEL_159;
            }
            unint64_t v116 = v101 - 2;
            uint64_t v122 = &v102[16 * v101 - 32];
            uint64_t v124 = *(void *)v122;
            uint64_t v123 = *((void *)v122 + 1);
            BOOL v125 = __OFSUB__(v123, v124);
            uint64_t v126 = v123 - v124;
            char v127 = v125;
            if (v125) {
              goto LABEL_162;
            }
            long long v128 = &v102[16 * v104];
            uint64_t v130 = *(void *)v128;
            uint64_t v129 = *((void *)v128 + 1);
            BOOL v115 = __OFSUB__(v129, v130);
            uint64_t v131 = v129 - v130;
            if (v115) {
              goto LABEL_165;
            }
            if (__OFADD__(v126, v131)) {
              goto LABEL_166;
            }
            if (v126 + v131 < v107) {
              goto LABEL_117;
            }
            BOOL v132 = v107 < v131;
          }
          if (v132) {
            unint64_t v104 = v116;
          }
        }
        else
        {
          if (v101 == 3)
          {
            uint64_t v106 = *((void *)v13 + 4);
            uint64_t v105 = *((void *)v13 + 5);
            BOOL v115 = __OFSUB__(v105, v106);
            uint64_t v107 = v105 - v106;
            char v108 = v115;
            goto LABEL_105;
          }
          uint64_t v133 = *((void *)v13 + 4);
          uint64_t v134 = *((void *)v13 + 5);
          BOOL v115 = __OFSUB__(v134, v133);
          uint64_t v126 = v134 - v133;
          char v127 = v115;
LABEL_117:
          if (v127) {
            goto LABEL_161;
          }
          long long v135 = &v102[16 * v104];
          uint64_t v137 = *(void *)v135;
          uint64_t v136 = *((void *)v135 + 1);
          BOOL v115 = __OFSUB__(v136, v137);
          uint64_t v138 = v136 - v137;
          if (v115) {
            goto LABEL_164;
          }
          if (v138 < v126) {
            goto LABEL_134;
          }
        }
        unint64_t v143 = v104 - 1;
        if (v104 - 1 >= v101)
        {
          __break(1u);
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
LABEL_160:
          __break(1u);
LABEL_161:
          __break(1u);
LABEL_162:
          __break(1u);
LABEL_163:
          __break(1u);
LABEL_164:
          __break(1u);
LABEL_165:
          __break(1u);
LABEL_166:
          __break(1u);
LABEL_167:
          __break(1u);
LABEL_168:
          __break(1u);
LABEL_169:
          __break(1u);
LABEL_170:
          __break(1u);
LABEL_171:
          __break(1u);
LABEL_172:
          __break(1u);
LABEL_173:
          __break(1u);
LABEL_174:
          __break(1u);
LABEL_175:
          __break(1u);
          goto LABEL_176;
        }
        if (!v16) {
          goto LABEL_179;
        }
        uint64_t v144 = v16;
        long long v145 = &v102[16 * v143];
        long long v146 = v102;
        uint64_t v147 = *(void *)v145;
        uint64_t v148 = v146;
        unint64_t v149 = v104;
        v150 = &v146[16 * v104];
        uint64_t v151 = *((void *)v150 + 1);
        uint64_t v152 = (void **)(v144 + 8 * *(void *)v145);
        uint64_t v185 = (id *)(v144 + 8 * *(void *)v150);
        unint64_t v176 = v144 + 8 * v151;
        swift_bridgeObjectRetain();
        sub_22016F5D0(v152, v185, v176, __dst, v179);
        if (v177) {
          goto LABEL_150;
        }
        if (v151 < v147) {
          goto LABEL_154;
        }
        if (v149 > *((void *)v13 + 2)) {
          goto LABEL_155;
        }
        unint64_t v153 = v149;
        *(void *)long long v145 = v147;
        uint64_t v102 = v148;
        *(void *)&v148[16 * v143 + 8] = v151;
        unint64_t v154 = *((void *)v13 + 2);
        if (v149 >= v154) {
          goto LABEL_156;
        }
        unint64_t v101 = v154 - 1;
        memmove(v150, v150 + 16, 16 * (v154 - 1 - v153));
        *((void *)v13 + 2) = v154 - 1;
        uint64_t v16 = v178;
        a2 = v179;
        if (v154 <= 2) {
          goto LABEL_134;
        }
        continue;
      }
    }
    unint64_t v101 = 1;
LABEL_134:
    uint64_t v15 = v171;
    uint64_t v14 = v182;
  }
  while (v182 < v171);
LABEL_139:
  uint64_t v169 = v13;
  if (v101 >= 2)
  {
    uint64_t v155 = *v164;
    uint64_t v186 = *v164;
    do
    {
      unint64_t v156 = v101 - 2;
      if (v101 < 2) {
        goto LABEL_168;
      }
      if (!v155) {
        goto LABEL_181;
      }
      uint64_t v157 = *(void *)&v169[16 * v156 + 32];
      uint64_t v158 = *(void *)&v169[16 * v101 + 24];
      uint64_t v159 = (void **)(v155 + 8 * v157);
      uint64_t v160 = (id *)(v155 + 8 * *(void *)&v169[16 * v101 + 16]);
      unint64_t v161 = v155 + 8 * v158;
      swift_bridgeObjectRetain();
      sub_22016F5D0(v159, v160, v161, __dst, a2);
      if (v177) {
        break;
      }
      if (v158 < v157) {
        goto LABEL_170;
      }
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v169 = sub_22016FAEC((uint64_t)v169);
      }
      if (v156 >= *((void *)v169 + 2)) {
        goto LABEL_171;
      }
      uint64_t v162 = &v169[16 * v156 + 32];
      *(void *)uint64_t v162 = v157;
      *((void *)v162 + 1) = v158;
      unint64_t v163 = *((void *)v169 + 2);
      if (v101 > v163) {
        goto LABEL_172;
      }
      memmove(&v169[16 * v101 + 16], &v169[16 * v101 + 32], 16 * (v163 - v101));
      *((void *)v169 + 2) = v163 - 1;
      unint64_t v101 = v163 - 1;
      uint64_t v155 = v186;
    }
    while (v163 > 2);
  }
LABEL_150:
  swift_bridgeObjectRelease();
LABEL_151:
  *(void *)((v189 & 0xFFFFFFFFFFFFFF8) + 0x10) = 0;
  sub_220182510();
  swift_bridgeObjectRelease_n();
  return swift_bridgeObjectRelease();
}

uint64_t sub_220171B58(uint64_t *a1, uint64_t a2)
{
  uint64_t v4 = *a1;
  swift_bridgeObjectRetain_n();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *a1 = v4;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
    sub_220170158();
  }
  uint64_t v6 = *(void *)(v4 + 16);
  v8[0] = v4 + 32;
  v8[1] = v6;
  swift_bridgeObjectRetain();
  sub_220170F40(v8, a2);
  swift_bridgeObjectRelease();
  sub_2201827D0();
  return swift_bridgeObjectRelease_n();
}

unint64_t sub_220171C04(unint64_t result, unint64_t a2)
{
  unint64_t v2 = a2;
  if (!result) {
    return !a2;
  }
  if (!a2) {
    return 0;
  }
  unint64_t v3 = result;
  if (result >> 62) {
    goto LABEL_37;
  }
  uint64_t v4 = *(void *)((result & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    uint64_t v38 = v2 & 0xFFFFFFFFFFFFFF8;
    if (v2 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v37 = sub_220182870();
      uint64_t result = swift_bridgeObjectRelease();
      if (v4 != v37) {
        return 0;
      }
    }
    else if (v4 != *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      return 0;
    }
    if (v4 < 0) {
      break;
    }
    if (!v4) {
      return 1;
    }
    unint64_t v5 = 0;
    unint64_t v40 = v2 & 0xC000000000000001;
    unint64_t v39 = v2;
    while (v4 != v5)
    {
      if ((v3 & 0xC000000000000001) != 0) {
        id v7 = (id)MEMORY[0x223C66AB0](v5, v3);
      }
      else {
        id v7 = *(id *)(v3 + 8 * v5 + 32);
      }
      uint64_t v8 = v7;
      if (v40)
      {
        id v9 = (id)MEMORY[0x223C66AB0](v5, v2);
      }
      else
      {
        if (v5 >= *(void *)(v38 + 16)) {
          goto LABEL_36;
        }
        id v9 = *(id *)(v2 + 8 * v5 + 32);
      }
      uint64_t v10 = v9;
      id v11 = objc_msgSend(v8, sel_sourceIdentifier, v38);
      uint64_t v12 = sub_220182460();
      uint64_t v14 = v13;

      id v15 = objc_msgSend(v10, sel_sourceIdentifier);
      uint64_t v16 = sub_220182460();
      uint64_t v18 = v17;

      if (v12 == v16 && v14 == v18)
      {
        swift_bridgeObjectRelease_n();
      }
      else
      {
        char v19 = sub_220182910();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v19 & 1) == 0) {
          goto LABEL_34;
        }
      }
      id v20 = objc_msgSend(v8, sel_displayName);
      uint64_t v21 = sub_220182460();
      uint64_t v23 = v22;

      id v24 = objc_msgSend(v10, sel_displayName);
      uint64_t v25 = sub_220182460();
      uint64_t v27 = v26;

      if (v21 == v25 && v23 == v27)
      {
        swift_bridgeObjectRelease_n();
      }
      else
      {
        char v28 = sub_220182910();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v28 & 1) == 0)
        {
LABEL_34:

          return 0;
        }
      }
      id v29 = objc_msgSend(v8, sel_bundlePath);
      uint64_t v30 = sub_220182460();
      uint64_t v32 = v31;

      id v33 = objc_msgSend(v10, sel_bundlePath);
      uint64_t v34 = sub_220182460();
      uint64_t v36 = v35;

      if (v30 == v34 && v32 == v36)
      {

        swift_bridgeObjectRelease_n();
      }
      else
      {
        char v6 = sub_220182910();

        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v6 & 1) == 0) {
          return 0;
        }
      }
      ++v5;
      unint64_t v2 = v39;
      if (v4 == v5) {
        return 1;
      }
    }
    __break(1u);
LABEL_36:
    __break(1u);
LABEL_37:
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_220182870();
    uint64_t result = swift_bridgeObjectRelease();
  }
  __break(1u);
  return result;
}

uint64_t sub_220171F98(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2;
  if (!a1) {
    return !a2;
  }
  if (!a2) {
    return 0;
  }
  uint64_t v3 = a1;
  if (*(void *)(a1 + 16) != *(void *)(a2 + 16)) {
    return 0;
  }
  uint64_t v54 = a1 + 64;
  uint64_t v4 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v5 = -1;
  if (v4 < 64) {
    uint64_t v5 = ~(-1 << v4);
  }
  unint64_t v6 = v5 & *(void *)(a1 + 64);
  int64_t v55 = (unint64_t)(v4 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v8 = 0;
  uint64_t v53 = v2;
  uint64_t v56 = v3;
  while (1)
  {
    if (v6)
    {
      unint64_t v9 = __clz(__rbit64(v6));
      uint64_t v10 = (v6 - 1) & v6;
      unint64_t v11 = v9 | (v8 << 6);
      if (!*(void *)(v2 + 16)) {
        goto LABEL_61;
      }
    }
    else
    {
      int64_t v12 = v8 + 1;
      if (__OFADD__(v8, 1)) {
        goto LABEL_69;
      }
      if (v12 >= v55)
      {
LABEL_65:
        swift_release();
        return 1;
      }
      unint64_t v13 = *(void *)(v54 + 8 * v12);
      ++v8;
      if (!v13)
      {
        int64_t v8 = v12 + 1;
        if (v12 + 1 >= v55) {
          goto LABEL_65;
        }
        unint64_t v13 = *(void *)(v54 + 8 * v8);
        if (!v13)
        {
          int64_t v8 = v12 + 2;
          if (v12 + 2 >= v55) {
            goto LABEL_65;
          }
          unint64_t v13 = *(void *)(v54 + 8 * v8);
          if (!v13)
          {
            int64_t v14 = v12 + 3;
            if (v14 >= v55) {
              goto LABEL_65;
            }
            unint64_t v13 = *(void *)(v54 + 8 * v14);
            if (!v13)
            {
              while (1)
              {
                int64_t v8 = v14 + 1;
                if (__OFADD__(v14, 1)) {
                  goto LABEL_70;
                }
                if (v8 >= v55) {
                  goto LABEL_65;
                }
                unint64_t v13 = *(void *)(v54 + 8 * v8);
                ++v14;
                if (v13) {
                  goto LABEL_26;
                }
              }
            }
            int64_t v8 = v14;
          }
        }
      }
LABEL_26:
      uint64_t v10 = (v13 - 1) & v13;
      unint64_t v11 = __clz(__rbit64(v13)) + (v8 << 6);
      if (!*(void *)(v2 + 16)) {
        goto LABEL_61;
      }
    }
    unint64_t v15 = *(void *)(*(void *)(v3 + 56) + 8 * v11);
    unsigned __int8 v16 = *(unsigned char *)(*(void *)(v3 + 48) + v11);
    swift_bridgeObjectRetain();
    unint64_t v17 = sub_22017A15C(v16);
    if ((v18 & 1) == 0)
    {
      swift_release();
      swift_bridgeObjectRelease();
      return 0;
    }
    unint64_t v57 = v10;
    unint64_t v19 = *(void *)(*(void *)(v2 + 56) + 8 * v17);
    if (v15 >> 62)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t v20 = sub_220182870();
      uint64_t result = swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v20 = *(void *)((v15 & 0xFFFFFFFFFFFFFF8) + 0x10);
      uint64_t result = swift_bridgeObjectRetain();
    }
    int64_t v58 = v8;
    if (v19 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v52 = sub_220182870();
      uint64_t result = swift_bridgeObjectRelease();
      if (v20 != v52)
      {
LABEL_60:
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
LABEL_61:
        swift_release();
        return 0;
      }
    }
    else if (v20 != *(void *)((v19 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      goto LABEL_60;
    }
    if (v20 < 0) {
      break;
    }
    if (v20)
    {
      unint64_t v21 = 0;
      unint64_t v61 = v19 & 0xC000000000000001;
      uint64_t v59 = v19 & 0xFFFFFFFFFFFFFF8;
      unint64_t v60 = v19;
      while (v20 != v21)
      {
        if ((v15 & 0xC000000000000001) != 0) {
          uint64_t result = MEMORY[0x223C66AB0](v21, v15);
        }
        else {
          uint64_t result = (uint64_t)*(id *)(v15 + 8 * v21 + 32);
        }
        uint64_t v23 = (void *)result;
        if (v61)
        {
          id v24 = (id)MEMORY[0x223C66AB0](v21, v19);
        }
        else
        {
          if (v21 >= *(void *)(v59 + 16)) {
            goto LABEL_67;
          }
          id v24 = *(id *)(v19 + 8 * v21 + 32);
        }
        uint64_t v25 = v24;
        id v26 = objc_msgSend(v23, sel_sourceIdentifier, v53);
        uint64_t v27 = sub_220182460();
        uint64_t v29 = v28;

        id v30 = objc_msgSend(v25, sel_sourceIdentifier);
        uint64_t v31 = sub_220182460();
        uint64_t v33 = v32;

        if (v27 == v31 && v29 == v33)
        {
          swift_bridgeObjectRelease_n();
        }
        else
        {
          char v34 = sub_220182910();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v34 & 1) == 0) {
            goto LABEL_59;
          }
        }
        id v35 = objc_msgSend(v23, sel_displayName);
        uint64_t v36 = sub_220182460();
        uint64_t v38 = v37;

        id v39 = objc_msgSend(v25, sel_displayName);
        uint64_t v40 = sub_220182460();
        uint64_t v42 = v41;

        if (v36 == v40 && v38 == v42)
        {
          swift_bridgeObjectRelease_n();
        }
        else
        {
          char v43 = sub_220182910();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v43 & 1) == 0)
          {
LABEL_59:

            goto LABEL_60;
          }
        }
        id v44 = objc_msgSend(v23, sel_bundlePath);
        uint64_t v45 = sub_220182460();
        uint64_t v47 = v46;

        id v48 = objc_msgSend(v25, sel_bundlePath);
        uint64_t v49 = sub_220182460();
        uint64_t v51 = v50;

        if (v45 == v49 && v47 == v51)
        {

          uint64_t result = swift_bridgeObjectRelease_n();
          unint64_t v19 = v60;
        }
        else
        {
          char v22 = sub_220182910();

          swift_bridgeObjectRelease();
          uint64_t result = swift_bridgeObjectRelease();
          unint64_t v19 = v60;
          if ((v22 & 1) == 0) {
            goto LABEL_60;
          }
        }
        if (v20 == ++v21) {
          goto LABEL_9;
        }
      }
      __break(1u);
LABEL_67:
      __break(1u);
      break;
    }
LABEL_9:
    swift_bridgeObjectRelease();
    uint64_t result = swift_bridgeObjectRelease();
    uint64_t v3 = v56;
    unint64_t v6 = v57;
    uint64_t v2 = v53;
    int64_t v8 = v58;
  }
  __break(1u);
LABEL_69:
  __break(1u);
LABEL_70:
  __break(1u);
  return result;
}

char *sub_220172524(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v5 = (char *)(a4 + 8 * a1 + 32);
    size_t v6 = 8 * v4;
    id v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  uint64_t result = (char *)sub_2201828B0();
  __break(1u);
  return result;
}

uint64_t sub_220172610(uint64_t a1, void (*a2)(uint64_t, uint64_t, id))
{
  uint64_t v20 = a1 + 64;
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
    int64_t v17 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v17 >= v7) {
      return swift_release();
    }
    unint64_t v18 = *(void *)(v20 + 8 * v17);
    ++v9;
    if (!v18)
    {
      int64_t v9 = v17 + 1;
      if (v17 + 1 >= v7) {
        return swift_release();
      }
      unint64_t v18 = *(void *)(v20 + 8 * v9);
      if (!v18)
      {
        int64_t v9 = v17 + 2;
        if (v17 + 2 >= v7) {
          return swift_release();
        }
        unint64_t v18 = *(void *)(v20 + 8 * v9);
        if (!v18)
        {
          int64_t v9 = v17 + 3;
          if (v17 + 3 >= v7) {
            return swift_release();
          }
          unint64_t v18 = *(void *)(v20 + 8 * v9);
          if (!v18) {
            break;
          }
        }
      }
    }
LABEL_22:
    unint64_t v6 = (v18 - 1) & v18;
    unint64_t v11 = __clz(__rbit64(v18)) + (v9 << 6);
LABEL_5:
    int64_t v12 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v11);
    uint64_t v13 = *v12;
    uint64_t v14 = v12[1];
    unint64_t v15 = *(void **)(*(void *)(a1 + 56) + 8 * v11);
    swift_bridgeObjectRetain();
    id v16 = v15;
    a2(v13, v14, v16);

    uint64_t result = swift_bridgeObjectRelease();
  }
  int64_t v19 = v17 + 4;
  if (v19 >= v7) {
    return swift_release();
  }
  unint64_t v18 = *(void *)(v20 + 8 * v19);
  if (v18)
  {
    int64_t v9 = v19;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v9 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
    }
    if (v9 >= v7) {
      return swift_release();
    }
    unint64_t v18 = *(void *)(v20 + 8 * v9);
    ++v19;
    if (v18) {
      goto LABEL_22;
    }
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_2201727D0()
{
  return sub_220166304(*(void *)(v0 + 16), *(void *)(v0 + 24), &OBJC_IVAR____TtC20UserNotificationsKit44NotificationSummarizationOnboardingViewModel__isSummarizationEnabledByIndex);
}

unint64_t sub_2201727F4()
{
  unint64_t result = qword_267F0A478;
  if (!qword_267F0A478)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_267F0A950);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F0A478);
  }
  return result;
}

uint64_t sub_220172850(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

_OWORD *sub_22017285C(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_22017286C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F0ABB0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2201728D4()
{
  return swift_release();
}

unint64_t sub_2201728DC()
{
  unint64_t result = qword_267F0A9F8;
  if (!qword_267F0A9F8)
  {
    sub_220149EE0(255, (unint64_t *)&qword_267F0A9A0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F0A9F8);
  }
  return result;
}

uint64_t sub_220172938()
{
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_220172970()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_220172980()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_220172990(void *a1)
{
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

uint64_t sub_2201729B0()
{
  swift_release();
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_2201729F0(void *a1)
{
  return sub_22016B690(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

unint64_t sub_2201729F8()
{
  unint64_t result = qword_267F0AA10;
  if (!qword_267F0AA10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F0AA10);
  }
  return result;
}

uint64_t sub_220172A4C()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_220172A5C(void *a1)
{
  sub_22016AE6C(a1, *(void *)(v1 + 16));
}

uint64_t sub_220172A64()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_220172A74()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t getEnumTagSinglePayload for NotificationSummarizationOnboardingViewModel.ModelError(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for NotificationSummarizationOnboardingViewModel.ModelError(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x220172B8CLL);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_220172BB4()
{
  return 0;
}

ValueMetadata *type metadata accessor for NotificationSummarizationOnboardingViewModel.ModelError()
{
  return &type metadata for NotificationSummarizationOnboardingViewModel.ModelError;
}

unint64_t sub_220172BD0()
{
  unint64_t result = qword_267F0AA28;
  if (!qword_267F0AA28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F0AA28);
  }
  return result;
}

uint64_t sub_220172C3C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_220182590();
  uint64_t v6 = *(void *)(v5 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(a1, 1, v5) != 1)
  {
    sub_220182580();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
    if (!*(void *)(a3 + 16)) {
      return swift_task_create();
    }
    goto LABEL_3;
  }
  sub_22014ACAC(a1, &qword_267F09E90);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_220182550();
    swift_unknownObjectRelease();
  }
  return swift_task_create();
}

uint64_t sub_220172DC4(uint64_t a1, uint64_t a2)
{
  int v3 = v2;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F0A940);
  MEMORY[0x270FA5388](v6 - 8);
  int64_t v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for OnboardingDefaults.ShownExperienceRecord();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  int64_t v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(a1, 1, v9) == 1)
  {
    sub_22014ACAC(a1, &qword_267F0A940);
    unint64_t v13 = sub_22017A25C(a2);
    if (v14)
    {
      unint64_t v15 = v13;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v17 = *v3;
      uint64_t v21 = *v3;
      uint64_t *v3 = 0x8000000000000000;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        sub_22017D36C();
        uint64_t v17 = v21;
      }
      sub_220180548(*(void *)(v17 + 56) + *(void *)(v10 + 72) * v15, (uint64_t)v8);
      sub_22017C258(v15, v17);
      uint64_t *v3 = v17;
      swift_bridgeObjectRelease();
      (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v8, 0, 1, v9);
    }
    else
    {
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56))(v8, 1, 1, v9);
    }
    return sub_22014ACAC((uint64_t)v8, &qword_267F0A940);
  }
  else
  {
    sub_220180548(a1, (uint64_t)v12);
    char v18 = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v21 = *v3;
    uint64_t *v3 = 0x8000000000000000;
    sub_22017C710((uint64_t)v12, a2, v18);
    uint64_t *v3 = v21;
    return swift_bridgeObjectRelease();
  }
}

void sub_220172FFC(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, unint64_t a6, uint64_t a7, char *a8, uint64_t a9, unint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, unint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, unint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21)
{
  long long v128 = a8;
  uint64_t v141 = a7;
  uint64_t v129 = a5;
  v124[1] = a4;
  id v131 = a3;
  uint64_t v130 = a2;
  uint64_t v142 = a1;
  uint64_t v137 = a21;
  uint64_t v134 = a19;
  uint64_t v135 = a20;
  unint64_t v133 = a18;
  uint64_t v145 = a15;
  uint64_t v146 = a17;
  uint64_t v143 = a16;
  unint64_t v144 = a14;
  uint64_t v139 = a12;
  uint64_t v140 = a13;
  uint64_t v138 = a11;
  unint64_t v136 = a10;
  uint64_t v23 = sub_220182040();
  MEMORY[0x270FA5388](v23 - 8);
  uint64_t v126 = (char *)v124 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = type metadata accessor for NotificationSummarizationOnboardingIntroView();
  MEMORY[0x270FA5388](v25 - 8);
  uint64_t v132 = (uint64_t)v124 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)&v21[qword_267F0A770] = 0;
  *(void *)&v21[qword_267F0A778] = 0;
  *(void *)&v21[qword_267F0A780] = 0;
  uint64_t v27 = &v21[qword_267F0A788];
  *(_OWORD *)uint64_t v27 = 0u;
  *((_OWORD *)v27 + 1) = 0u;
  uint64_t v28 = &v21[qword_267F0A790];
  *(_OWORD *)uint64_t v28 = 0u;
  *((_OWORD *)v28 + 1) = 0u;
  uint64_t v29 = &v21[qword_267F0A798];
  *(_OWORD *)uint64_t v29 = 0u;
  *((_OWORD *)v29 + 1) = 0u;
  id v30 = &v21[qword_267F0A7A0];
  *(_OWORD *)id v30 = 0u;
  *((_OWORD *)v30 + 1) = 0u;
  *(void *)&v21[qword_267F0A7A8] = 0;
  *(void *)&v21[qword_267F0A7B0] = 0;
  unint64_t v31 = *(void *)v27;
  uint64_t v32 = *((void *)v27 + 1);
  uint64_t v127 = *((void *)v27 + 2);
  uint64_t v33 = v141;
  *(void *)uint64_t v27 = a6;
  *((void *)v27 + 1) = v33;
  *((void *)v27 + 2) = v128;
  *((void *)v27 + 3) = a9;
  long long v128 = v21;
  v124[2] = a9;
  swift_retain();
  unint64_t v125 = a6;
  sub_220163BFC(a6);
  uint64_t v34 = v32;
  uint64_t v35 = v143;
  sub_220163C34(v31, v34, v127);
  unint64_t v36 = *(void *)v28;
  uint64_t v37 = *((void *)v28 + 1);
  uint64_t v38 = *((void *)v28 + 2);
  unint64_t v39 = v136;
  uint64_t v40 = v138;
  uint64_t v41 = v139;
  *(void *)uint64_t v28 = v136;
  *((void *)v28 + 1) = v40;
  uint64_t v42 = v140;
  *((void *)v28 + 2) = v41;
  *((void *)v28 + 3) = v42;
  sub_220163BBC(v39, v40, v41);
  sub_220163C34(v36, v37, v38);
  unint64_t v43 = *(void *)v29;
  uint64_t v44 = *((void *)v29 + 1);
  uint64_t v45 = *((void *)v29 + 2);
  unint64_t v46 = v144;
  uint64_t v47 = v145;
  *(void *)uint64_t v29 = v144;
  *((void *)v29 + 1) = v47;
  uint64_t v48 = v146;
  *((void *)v29 + 2) = v35;
  *((void *)v29 + 3) = v48;
  sub_220163BBC(v46, v47, v35);
  sub_220163C34(v43, v44, v45);
  unint64_t v49 = *(void *)v30;
  uint64_t v50 = *((void *)v30 + 1);
  uint64_t v51 = *((void *)v30 + 2);
  unint64_t v52 = v133;
  uint64_t v53 = v134;
  uint64_t v54 = v135;
  *(void *)id v30 = v133;
  *((void *)v30 + 1) = v53;
  uint64_t v55 = v137;
  *((void *)v30 + 2) = v54;
  *((void *)v30 + 3) = v55;
  sub_220163BBC(v52, v53, v54);
  unint64_t v56 = v49;
  uint64_t v57 = v129;
  sub_220163C34(v56, v50, v51);
  int64_t v58 = v128;

  uint64_t v59 = (void *)sub_220182450();
  swift_bridgeObjectRelease();
  if (v57)
  {
    unint64_t v60 = (void *)sub_220182450();
    swift_bridgeObjectRelease();
  }
  else
  {
    unint64_t v60 = 0;
  }
  unint64_t v61 = (objc_class *)__swift_instantiateConcreteTypeFromMangledName(&qword_267F0AAB8);
  v149.receiver = v58;
  v149.super_class = v61;
  id v62 = objc_msgSendSuper2(&v149, sel_initWithTitle_detailText_symbolName_contentLayout_, v59, v60, 0, 3);

  sub_22018060C(v142, v132, (uint64_t (*)(void))type metadata accessor for NotificationSummarizationOnboardingIntroView);
  id v63 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267F0AAC0));
  uint64_t v64 = (char *)v62;
  uint64_t v65 = sub_220181FC0();
  uint64_t v66 = qword_267F0A780;
  id v67 = *(void **)&v64[qword_267F0A780];
  *(void *)&v64[qword_267F0A780] = v65;

  if (!v35) {
    goto LABEL_7;
  }
  id v68 = *(void **)&v64[v66];
  if (v68)
  {
    uint64_t v69 = swift_allocObject();
    swift_unknownObjectWeakInit();
    id v70 = (void *)swift_allocObject();
    v70[2] = v69;
    unint64_t v71 = v144;
    uint64_t v72 = v145;
    v70[3] = v144;
    v70[4] = v72;
    uint64_t v73 = v146;
    v70[5] = v35;
    v70[6] = v73;
    sub_220163BBC(v71, v72, v35);
    id v74 = v68;
    swift_retain();
    unint64_t v75 = (void (*)(_OWORD *, void))sub_220181FD0();
    uint64_t v77 = *v76;
    *uint64_t v76 = (uint64_t)sub_22017FC04;
    v76[1] = (uint64_t)v70;
    sub_22014B388(v77);
    v75(v148, 0);

    swift_release();
LABEL_7:
    uint64_t v78 = v64;
    id v79 = objc_msgSend(v78, sel_headerView);
    objc_msgSend(v79, sel_setTitleStyle_, 1);

    id v80 = objc_msgSend(self, sel_currentDevice);
    id v81 = objc_msgSend(v80, sel_userInterfaceIdiom);

    if (v81 == (id)1) {
      objc_msgSend(v78, sel_set_shouldInlineButtontray_, 1);
    }
    id v82 = objc_msgSend(v78, sel_headerView);
    id v83 = objc_msgSend(v82, sel_animationView);

    char v84 = *(void **)&v78[qword_267F0A778];
    *(void *)&v78[qword_267F0A778] = v83;

    uint64_t v85 = *(void **)&v64[v66];
    if (v85)
    {
      id v86 = objc_msgSend(v85, sel_view);
      if (v86)
      {
        uint64_t v87 = v86;
        objc_msgSend(v86, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
        objc_msgSend(v87, sel_invalidateIntrinsicContentSize);
        uint64_t v88 = *(void **)&v64[v66];
        if (v88)
        {
          id v89 = v88;
          sub_220182030();
          sub_220181FB0();

          sub_220175E84();
          if (*(void *)&v64[v66])
          {
            objc_msgSend(v78, sel_addChildViewController_);
            id v90 = objc_msgSend(v78, sel_contentView);
            objc_msgSend(v90, sel_addSubview_, v87);

            uint64_t v91 = *(void **)&v64[v66];
            if (v91)
            {
              objc_msgSend(v91, sel_didMoveToParentViewController_, v78);
              id v92 = *(void **)&v64[v66];
              if (v92)
              {
                id v93 = objc_msgSend(v92, sel_view);
                if (v93)
                {
                  uint64_t v94 = v93;
                  objc_msgSend(v93, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);

                  id v131 = self;
                  __swift_instantiateConcreteTypeFromMangledName(&qword_267F0A9F0);
                  uint64_t v95 = swift_allocObject();
                  *(_OWORD *)(v95 + 16) = xmmword_220186E40;
                  id v96 = objc_msgSend(v87, sel_leadingAnchor);
                  id v97 = objc_msgSend(v78, sel_contentView);
                  id v98 = objc_msgSend(v97, sel_leadingAnchor);

                  id v99 = objc_msgSend(v96, sel_constraintEqualToAnchor_, v98);
                  *(void *)(v95 + 32) = v99;
                  id v100 = objc_msgSend(v87, sel_trailingAnchor);
                  id v101 = objc_msgSend(v78, sel_contentView);
                  id v102 = objc_msgSend(v101, sel_trailingAnchor);

                  id v103 = objc_msgSend(v100, sel_constraintEqualToAnchor_, v102);
                  *(void *)(v95 + 40) = v103;
                  id v104 = objc_msgSend(v87, sel_topAnchor);
                  id v105 = objc_msgSend(v78, sel_contentView);
                  id v106 = objc_msgSend(v105, sel_topAnchor);

                  id v107 = objc_msgSend(v104, sel_constraintEqualToAnchor_, v106);
                  *(void *)(v95 + 48) = v107;
                  id v108 = objc_msgSend(v87, sel_bottomAnchor);
                  id v109 = objc_msgSend(v78, sel_contentView);
                  id v110 = objc_msgSend(v109, sel_bottomAnchor);

                  id v111 = objc_msgSend(v108, sel_constraintEqualToAnchor_, v110);
                  *(void *)(v95 + 56) = v111;
                  *(void *)&v148[0] = v95;
                  sub_220182510();
                  sub_220149EE0(0, (unint64_t *)&unk_267F0AAD0);
                  uint64_t v112 = (void *)sub_2201824E0();
                  swift_bridgeObjectRelease();
                  objc_msgSend(v131, sel_activateConstraints_, v112);

                  uint64_t v113 = *(void **)&v64[v66];
                  if (v113)
                  {
                    uint64_t v114 = swift_allocObject();
                    swift_unknownObjectWeakInit();
                    swift_retain();
                    id v115 = v113;
                    unint64_t v116 = (void (*)(_OWORD *, void))sub_220181FD0();
                    uint64_t v118 = *(void *)(v117 + 16);
                    *(void *)(v117 + 16) = sub_22017FBC0;
                    *(void *)(v117 + 24) = v114;
                    sub_22014B388(v118);
                    v116(v148, 0);

                    swift_release();
                    uint64_t v119 = *(void **)&v64[v66];
                    uint64_t v120 = v143;
                    if (v119)
                    {
                      id v121 = v119;
                      uint64_t v122 = v132;
                      sub_220181FE0();

                      v148[0] = *(_OWORD *)(v122 + 32);
                      __swift_instantiateConcreteTypeFromMangledName(&qword_267F0A060);
                      sub_2201822A0();
                      id v123 = v147;
                      objc_msgSend(v147, sel_saveWithOutcome_, 0);

                      sub_220163C34(v133, v134, v135);
                      sub_220163C34(v144, v145, v120);
                      sub_220163C34(v136, v138, v139);
                      sub_220163C20(v125);

                      swift_release();
                      sub_2201805AC(v142, (uint64_t (*)(void))type metadata accessor for NotificationSummarizationOnboardingIntroView);
                      sub_2201805AC(v122, (uint64_t (*)(void))type metadata accessor for NotificationSummarizationOnboardingIntroView);
                      return;
                    }
                    goto LABEL_27;
                  }
LABEL_26:
                  __break(1u);
LABEL_27:
                  __break(1u);
                  goto LABEL_28;
                }
LABEL_25:
                __break(1u);
                goto LABEL_26;
              }
LABEL_24:
              __break(1u);
              goto LABEL_25;
            }
LABEL_23:
            __break(1u);
            goto LABEL_24;
          }
LABEL_22:
          __break(1u);
          goto LABEL_23;
        }
LABEL_21:
        __break(1u);
        goto LABEL_22;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_21;
  }
LABEL_28:
  __break(1u);
}

void sub_220173AB4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6, unint64_t a7, char *a8, unint64_t a9, unint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, unint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, unint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t (*a22)(void),uint64_t *a23,uint64_t (*a24)(void),uint64_t *a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29)
{
  uint64_t v138 = a8;
  unint64_t v155 = a7;
  uint64_t v139 = a5;
  uint64_t v133 = a4;
  uint64_t v141 = a3;
  uint64_t v140 = a2;
  uint64_t v156 = a1;
  uint64_t v144 = a26;
  uint64_t v143 = a25;
  uint64_t v157 = a24;
  uint64_t v142 = a23;
  uint64_t v149 = a20;
  uint64_t v148 = a19;
  unint64_t v147 = a18;
  uint64_t v160 = a15;
  uint64_t v161 = a17;
  uint64_t v158 = a16;
  unint64_t v159 = a14;
  uint64_t v152 = a12;
  uint64_t v153 = a13;
  unint64_t v150 = a10;
  uint64_t v151 = a11;
  unint64_t v154 = a9;
  uint64_t v145 = a21;
  uint64_t v31 = sub_220182040();
  MEMORY[0x270FA5388](v31 - 8);
  unint64_t v136 = (char *)&v133 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v134 = a22(0);
  MEMORY[0x270FA5388](v134);
  uint64_t v146 = (uint64_t)&v133 - v33;
  *(void *)&v29[qword_267F0A770] = 0;
  *(void *)&v29[qword_267F0A778] = 0;
  *(void *)&v29[qword_267F0A780] = 0;
  uint64_t v34 = (unint64_t *)&v29[qword_267F0A788];
  *(_OWORD *)uint64_t v34 = 0u;
  *((_OWORD *)v34 + 1) = 0u;
  uint64_t v35 = &v29[qword_267F0A790];
  *(_OWORD *)uint64_t v35 = 0u;
  *((_OWORD *)v35 + 1) = 0u;
  unint64_t v36 = &v29[qword_267F0A798];
  *(_OWORD *)unint64_t v36 = 0u;
  *((_OWORD *)v36 + 1) = 0u;
  uint64_t v37 = &v29[qword_267F0A7A0];
  *(_OWORD *)uint64_t v37 = 0u;
  *((_OWORD *)v37 + 1) = 0u;
  *(void *)&v29[qword_267F0A7A8] = 0;
  *(void *)&v29[qword_267F0A7B0] = 0;
  unint64_t v39 = *v34;
  uint64_t v38 = v34[1];
  uint64_t v40 = v34[2];
  unint64_t v137 = v34[3];
  unint64_t v41 = v154;
  unint64_t v42 = v155;
  unint64_t *v34 = a6;
  v34[1] = v42;
  v34[2] = (unint64_t)v138;
  v34[3] = v41;
  uint64_t v138 = v29;
  swift_retain();
  unint64_t v135 = a6;
  sub_220163BFC(a6);
  uint64_t v43 = v158;
  sub_220163C34(v39, v38, v40);
  unint64_t v44 = *(void *)v35;
  uint64_t v45 = *((void *)v35 + 1);
  uint64_t v46 = *((void *)v35 + 2);
  unint64_t v47 = v150;
  uint64_t v48 = v151;
  *(void *)uint64_t v35 = v150;
  *((void *)v35 + 1) = v48;
  uint64_t v49 = v152;
  uint64_t v50 = v153;
  *((void *)v35 + 2) = v152;
  *((void *)v35 + 3) = v50;
  sub_220163BBC(v47, v48, v49);
  sub_220163C34(v44, v45, v46);
  unint64_t v51 = *(void *)v36;
  uint64_t v52 = *((void *)v36 + 1);
  uint64_t v53 = *((void *)v36 + 2);
  unint64_t v54 = v159;
  uint64_t v55 = v160;
  *(void *)unint64_t v36 = v159;
  *((void *)v36 + 1) = v55;
  uint64_t v56 = v161;
  *((void *)v36 + 2) = v43;
  *((void *)v36 + 3) = v56;
  sub_220163BBC(v54, v55, v43);
  sub_220163C34(v51, v52, v53);
  unint64_t v57 = *(void *)v37;
  uint64_t v58 = *((void *)v37 + 1);
  uint64_t v59 = *((void *)v37 + 2);
  unint64_t v60 = v147;
  uint64_t v61 = v148;
  *(void *)uint64_t v37 = v147;
  *((void *)v37 + 1) = v61;
  uint64_t v62 = v149;
  uint64_t v63 = v145;
  *((void *)v37 + 2) = v149;
  *((void *)v37 + 3) = v63;
  uint64_t v64 = v138;
  sub_220163BBC(v60, v61, v62);
  unint64_t v65 = v57;
  uint64_t v66 = v139;
  sub_220163C34(v65, v58, v59);

  id v67 = (void *)sub_220182450();
  swift_bridgeObjectRelease();
  if (v66)
  {
    id v68 = (void *)sub_220182450();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v68 = 0;
  }
  uint64_t v69 = (objc_class *)__swift_instantiateConcreteTypeFromMangledName(v142);
  v164.receiver = v64;
  v164.super_class = v69;
  id v70 = objc_msgSendSuper2(&v164, sel_initWithTitle_detailText_symbolName_contentLayout_, v67, v68, 0, 3, v133);

  sub_22018060C(v156, v146, v157);
  id v71 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(v143));
  uint64_t v72 = (char *)v70;
  uint64_t v73 = sub_220181FC0();
  uint64_t v74 = qword_267F0A780;
  unint64_t v75 = *(void **)&v72[qword_267F0A780];
  *(void *)&v72[qword_267F0A780] = v73;

  if (!v43) {
    goto LABEL_7;
  }
  uint64_t v76 = *(void **)&v72[v74];
  if (v76)
  {
    uint64_t v77 = swift_allocObject();
    swift_unknownObjectWeakInit();
    uint64_t v78 = (void *)swift_allocObject();
    v78[2] = v77;
    unint64_t v79 = v159;
    uint64_t v80 = v160;
    v78[3] = v159;
    v78[4] = v80;
    uint64_t v81 = v161;
    v78[5] = v43;
    v78[6] = v81;
    sub_220163BBC(v79, v80, v43);
    id v82 = v76;
    swift_retain();
    id v83 = (void (*)(long long *, void))sub_220181FD0();
    uint64_t v85 = *(void *)(v84 + 16);
    *(void *)(v84 + 16) = a28;
    *(void *)(v84 + 24) = v78;
    sub_22014B388(v85);
    v83(&v163, 0);

    swift_release();
LABEL_7:
    id v86 = v72;
    id v87 = objc_msgSend(v86, sel_headerView);
    objc_msgSend(v87, sel_setTitleStyle_, 1);

    id v88 = objc_msgSend(self, sel_currentDevice);
    id v89 = objc_msgSend(v88, sel_userInterfaceIdiom);

    if (v89 == (id)1) {
      objc_msgSend(v86, sel_set_shouldInlineButtontray_, 1);
    }
    id v90 = objc_msgSend(v86, sel_headerView);
    id v91 = objc_msgSend(v90, sel_animationView);

    id v92 = *(void **)&v86[qword_267F0A778];
    *(void *)&v86[qword_267F0A778] = v91;

    id v93 = *(void **)&v72[v74];
    if (v93)
    {
      id v94 = objc_msgSend(v93, sel_view);
      if (v94)
      {
        uint64_t v95 = v94;
        objc_msgSend(v94, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
        objc_msgSend(v95, sel_invalidateIntrinsicContentSize);
        id v96 = *(void **)&v72[v74];
        if (v96)
        {
          id v97 = v96;
          sub_220182030();
          sub_220181FB0();

          sub_220175E84();
          if (*(void *)&v72[v74])
          {
            objc_msgSend(v86, sel_addChildViewController_);
            id v98 = objc_msgSend(v86, sel_contentView);
            objc_msgSend(v98, sel_addSubview_, v95);

            id v99 = *(void **)&v72[v74];
            if (v99)
            {
              objc_msgSend(v99, sel_didMoveToParentViewController_, v86);
              id v100 = *(void **)&v72[v74];
              if (v100)
              {
                id v101 = objc_msgSend(v100, sel_view);
                if (v101)
                {
                  id v102 = v101;
                  objc_msgSend(v101, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);

                  uint64_t v143 = (uint64_t *)self;
                  __swift_instantiateConcreteTypeFromMangledName(&qword_267F0A9F0);
                  uint64_t v103 = swift_allocObject();
                  *(_OWORD *)(v103 + 16) = xmmword_220186E40;
                  id v104 = objc_msgSend(v95, sel_leadingAnchor);
                  id v105 = objc_msgSend(v86, sel_contentView);
                  id v106 = objc_msgSend(v105, sel_leadingAnchor);

                  id v107 = objc_msgSend(v104, sel_constraintEqualToAnchor_, v106);
                  *(void *)(v103 + 32) = v107;
                  id v108 = objc_msgSend(v95, sel_trailingAnchor);
                  id v109 = objc_msgSend(v86, sel_contentView);
                  id v110 = objc_msgSend(v109, sel_trailingAnchor);

                  id v111 = objc_msgSend(v108, sel_constraintEqualToAnchor_, v110);
                  *(void *)(v103 + 40) = v111;
                  id v112 = objc_msgSend(v95, sel_topAnchor);
                  id v113 = objc_msgSend(v86, sel_contentView);
                  id v114 = objc_msgSend(v113, sel_topAnchor);

                  id v115 = objc_msgSend(v112, sel_constraintEqualToAnchor_, v114);
                  *(void *)(v103 + 48) = v115;
                  id v116 = objc_msgSend(v95, sel_bottomAnchor);
                  id v117 = objc_msgSend(v86, sel_contentView);
                  id v118 = objc_msgSend(v117, sel_bottomAnchor);

                  id v119 = objc_msgSend(v116, sel_constraintEqualToAnchor_, v118);
                  *(void *)(v103 + 56) = v119;
                  *(void *)&long long v163 = v103;
                  sub_220182510();
                  sub_220149EE0(0, (unint64_t *)&unk_267F0AAD0);
                  uint64_t v120 = (void *)sub_2201824E0();
                  swift_bridgeObjectRelease();
                  objc_msgSend(v143, sel_activateConstraints_, v120);

                  id v121 = *(void **)&v72[v74];
                  if (v121)
                  {
                    uint64_t v122 = swift_allocObject();
                    swift_unknownObjectWeakInit();
                    swift_retain();
                    id v123 = v121;
                    uint64_t v124 = (void (*)(long long *, void))sub_220181FD0();
                    uint64_t v126 = *v125;
                    *unint64_t v125 = a29;
                    v125[1] = v122;
                    sub_22014B388(v126);
                    v124(&v163, 0);

                    swift_release();
                    uint64_t v127 = *(void **)&v72[v74];
                    uint64_t v128 = v158;
                    if (v127)
                    {
                      id v129 = v127;
                      uint64_t v130 = v146;
                      sub_220181FE0();

                      long long v163 = *(_OWORD *)(v130 + *(int *)(v134 + 28));
                      __swift_instantiateConcreteTypeFromMangledName(&qword_267F0A060);
                      sub_2201822A0();
                      id v131 = v162;
                      objc_msgSend(v162, sel_saveWithOutcome_, 0);

                      sub_220163C34(v147, v148, v149);
                      sub_220163C34(v159, v160, v128);
                      sub_220163C34(v150, v151, v152);
                      sub_220163C20(v135);

                      swift_release();
                      uint64_t v132 = v157;
                      sub_2201805AC(v156, v157);
                      sub_2201805AC(v130, v132);
                      return;
                    }
                    goto LABEL_27;
                  }
LABEL_26:
                  __break(1u);
LABEL_27:
                  __break(1u);
                  goto LABEL_28;
                }
LABEL_25:
                __break(1u);
                goto LABEL_26;
              }
LABEL_24:
              __break(1u);
              goto LABEL_25;
            }
LABEL_23:
            __break(1u);
            goto LABEL_24;
          }
LABEL_22:
          __break(1u);
          goto LABEL_23;
        }
LABEL_21:
        __break(1u);
        goto LABEL_22;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_21;
  }
LABEL_28:
  __break(1u);
}

void sub_220174580(uint64_t a1, uint64_t (*a2)(unint64_t), uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9 = a1 + 16;
  swift_beginAccess();
  uint64_t v10 = MEMORY[0x223C677B0](v9);
  if (v10)
  {
    uint64_t v11 = (void *)v10;
    sub_220174AC0(a2, a3, a4, a5, 0xD00000000000004ELL, 0x8000000220189AB0);
  }
}

void sub_220174620(uint64_t a1, uint64_t (*a2)(unint64_t), uint64_t a3, uint64_t a4, uint64_t a5, uint64_t (*a6)(void), uint64_t (*a7)(void))
{
  uint64_t v13 = a1 + 16;
  swift_beginAccess();
  uint64_t v14 = MEMORY[0x223C677B0](v13);
  if (v14)
  {
    unint64_t v15 = (void *)v14;
    sub_220174F9C(a2, a3, a4, a5, 0xD00000000000004ELL, 0x8000000220189AB0, a6, a7);
  }
}

void sub_2201746D8(char a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9 = a2 + 16;
  swift_beginAccess();
  uint64_t v10 = MEMORY[0x223C677B0](v9);
  if (v10)
  {
    uint64_t v11 = (void *)v10;
    sub_22017547C(a1 & 1, a3, a4, a5);
  }
}

uint64_t sub_220174760(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_220182590();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_220182580();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_22014ACAC(a1, &qword_267F09E90);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_220182550();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_22017490C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_220182590();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_220182580();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_22014ACAC(a1, &qword_267F09E90);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_220182550();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267F0AB50);
  return swift_task_create();
}

void sub_220174AC0(uint64_t (*a1)(unint64_t), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6)
{
  uint64_t v7 = v6;
  uint64_t v13 = type metadata accessor for NotificationSummarizationOnboardingIntroView();
  MEMORY[0x270FA5388](v13 - 8);
  unint64_t v15 = (char *)v32 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    if (a1)
    {
      if (a1 == (uint64_t (*)(unint64_t))1)
      {
        uint64_t v26 = *(void **)(v7 + qword_267F0A780);
        if (v26)
        {
          sub_220163BBC(1uLL, a2, a3);
          id v27 = v26;
          sub_220181FE0();

          *(_OWORD *)uint64_t v32 = *((_OWORD *)v15 + 2);
          __swift_instantiateConcreteTypeFromMangledName(&qword_267F0A060);
          sub_2201822A0();
          id v28 = v33;
          objc_msgSend(v33, sel_saveWithOutcome_, 1);

          sub_2201805AC((uint64_t)v15, (uint64_t (*)(void))type metadata accessor for NotificationSummarizationOnboardingIntroView);
          uint64_t v29 = *(void **)(v7 + qword_267F0A770);
          if (v29) {
            objc_msgSend(v29, sel_onboardingControllerDidFinish_, v7);
          }
          goto LABEL_27;
        }
LABEL_29:
        __break(1u);
        return;
      }
      if (a1 == (uint64_t (*)(unint64_t))2)
      {
        id v16 = *(void **)(v7 + qword_267F0A780);
        if (v16)
        {
          sub_220163BBC(2uLL, a2, a3);
          id v17 = v16;
          sub_220181FE0();

          *(_OWORD *)uint64_t v32 = *((_OWORD *)v15 + 2);
          __swift_instantiateConcreteTypeFromMangledName(&qword_267F0A060);
          sub_2201822A0();
          id v18 = v33;
          objc_msgSend(v33, sel_saveWithOutcome_, 2);

          sub_2201805AC((uint64_t)v15, (uint64_t (*)(void))type metadata accessor for NotificationSummarizationOnboardingIntroView);
          int64_t v19 = *(void **)(v7 + qword_267F0A770);
          if (v19) {
            objc_msgSend(v19, sel_onboardingControllerRequestsCancellation_, v7);
          }
LABEL_27:
          swift_release();
          return;
        }
        __break(1u);
        goto LABEL_29;
      }
      sub_220163BBC((unint64_t)a1, a2, a3);
      unint64_t v30 = sub_220163BFC((unint64_t)a1);
      uint64_t v31 = (void *)a1(v30);
      if (*(void *)(v7 + qword_267F0A770))
      {
        objc_msgSend((id)swift_unknownObjectRetain(), sel_onboardingController_requestsPushingTo_, v7, v31);
        sub_220163C20((unint64_t)a1);
        swift_unknownObjectRelease();
        sub_220163C20((unint64_t)a1);
      }
      else
      {
        sub_220163C20((unint64_t)a1);

        sub_220163C20((unint64_t)a1);
      }
LABEL_25:
      goto LABEL_27;
    }
    uint64_t v25 = *(void **)(v7 + qword_267F0A770);
    if (v25)
    {
      sub_220163BFC(0);
      swift_retain();
      objc_msgSend(v25, sel_onboardingControllerRequestsGoingBack_, v7);
      goto LABEL_25;
    }
    sub_220163BFC(0);
  }
  else
  {
    if (qword_267F09C80 != -1) {
      swift_once();
    }
    uint64_t v20 = sub_220181C80();
    __swift_project_value_buffer(v20, (uint64_t)qword_267F0C120);
    swift_bridgeObjectRetain_n();
    uint64_t v21 = sub_220181C60();
    os_log_type_t v22 = sub_220182610();
    if (os_log_type_enabled(v21, v22))
    {
      uint64_t v23 = (uint8_t *)swift_slowAlloc();
      uint64_t v24 = swift_slowAlloc();
      v32[0] = v24;
      *(_DWORD *)uint64_t v23 = 136446210;
      swift_bridgeObjectRetain();
      id v33 = (id)sub_220149888(a5, a6, v32);
      sub_2201826B0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_22012C000, v21, v22, "Action not implemented for '%{public}s'", v23, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x223C676F0](v24, -1, -1);
      MEMORY[0x223C676F0](v23, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
}

void sub_220174F9C(uint64_t (*a1)(unint64_t), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6, uint64_t (*a7)(void), uint64_t (*a8)(void))
{
  uint64_t v10 = v8;
  uint64_t v16 = a7(0);
  MEMORY[0x270FA5388](v16);
  id v18 = (char *)v35 - v17;
  if (a3)
  {
    if (a1)
    {
      if (a1 == (uint64_t (*)(unint64_t))1)
      {
        uint64_t v29 = *(void **)(v10 + qword_267F0A780);
        if (v29)
        {
          sub_220163BBC(1uLL, a2, a3);
          id v30 = v29;
          sub_220181FE0();

          *(_OWORD *)uint64_t v35 = *(_OWORD *)&v18[*(int *)(v16 + 28)];
          __swift_instantiateConcreteTypeFromMangledName(&qword_267F0A060);
          sub_2201822A0();
          id v31 = v36;
          objc_msgSend(v36, sel_saveWithOutcome_, 1);

          sub_2201805AC((uint64_t)v18, a8);
          uint64_t v32 = *(void **)(v10 + qword_267F0A770);
          if (v32) {
            objc_msgSend(v32, sel_onboardingControllerDidFinish_, v10);
          }
          goto LABEL_27;
        }
LABEL_29:
        __break(1u);
        return;
      }
      if (a1 == (uint64_t (*)(unint64_t))2)
      {
        int64_t v19 = *(void **)(v10 + qword_267F0A780);
        if (v19)
        {
          sub_220163BBC(2uLL, a2, a3);
          id v20 = v19;
          sub_220181FE0();

          *(_OWORD *)uint64_t v35 = *(_OWORD *)&v18[*(int *)(v16 + 28)];
          __swift_instantiateConcreteTypeFromMangledName(&qword_267F0A060);
          sub_2201822A0();
          id v21 = v36;
          objc_msgSend(v36, sel_saveWithOutcome_, 2);

          sub_2201805AC((uint64_t)v18, a8);
          os_log_type_t v22 = *(void **)(v10 + qword_267F0A770);
          if (v22) {
            objc_msgSend(v22, sel_onboardingControllerRequestsCancellation_, v10);
          }
LABEL_27:
          swift_release();
          return;
        }
        __break(1u);
        goto LABEL_29;
      }
      sub_220163BBC((unint64_t)a1, a2, a3);
      unint64_t v33 = sub_220163BFC((unint64_t)a1);
      uint64_t v34 = (void *)a1(v33);
      if (*(void *)(v10 + qword_267F0A770))
      {
        objc_msgSend((id)swift_unknownObjectRetain(), sel_onboardingController_requestsPushingTo_, v10, v34);
        sub_220163C20((unint64_t)a1);
        swift_unknownObjectRelease();
        sub_220163C20((unint64_t)a1);
      }
      else
      {
        sub_220163C20((unint64_t)a1);

        sub_220163C20((unint64_t)a1);
      }
LABEL_25:
      goto LABEL_27;
    }
    id v28 = *(void **)(v10 + qword_267F0A770);
    if (v28)
    {
      sub_220163BFC(0);
      swift_retain();
      objc_msgSend(v28, sel_onboardingControllerRequestsGoingBack_, v10);
      goto LABEL_25;
    }
    sub_220163BFC(0);
  }
  else
  {
    if (qword_267F09C80 != -1) {
      swift_once();
    }
    uint64_t v23 = sub_220181C80();
    __swift_project_value_buffer(v23, (uint64_t)qword_267F0C120);
    swift_bridgeObjectRetain_n();
    uint64_t v24 = sub_220181C60();
    os_log_type_t v25 = sub_220182610();
    if (os_log_type_enabled(v24, v25))
    {
      uint64_t v26 = (uint8_t *)swift_slowAlloc();
      uint64_t v27 = swift_slowAlloc();
      v35[0] = v27;
      *(_DWORD *)uint64_t v26 = 136446210;
      swift_bridgeObjectRetain();
      id v36 = (id)sub_220149888(a5, a6, v35);
      sub_2201826B0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_22012C000, v24, v25, "Action not implemented for '%{public}s'", v26, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x223C676F0](v27, -1, -1);
      MEMORY[0x223C676F0](v26, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
}

id sub_22017547C(char a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = v4;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F09E90);
  id result = (id)MEMORY[0x270FA5388](v8 - 8);
  uint64_t v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = qword_267F0A7B0;
  uint64_t v13 = *(void *)(v4 + qword_267F0A7B0);
  if (a1)
  {
    if (!v13)
    {
      uint64_t v14 = sub_220182590();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
      uint64_t v15 = swift_allocObject();
      swift_unknownObjectWeakInit();
      sub_220182570();
      swift_retain();
      uint64_t v16 = sub_220182560();
      uint64_t v17 = (void *)swift_allocObject();
      uint64_t v18 = MEMORY[0x263F8F500];
      id v17[2] = v16;
      v17[3] = v18;
      v17[4] = v15;
      swift_release();
      *(void *)(v6 + v12) = sub_220172C3C((uint64_t)v11, a4, (uint64_t)v17);
      return (id)swift_release();
    }
  }
  else
  {
    if (v13)
    {
      swift_retain();
      __swift_instantiateConcreteTypeFromMangledName(&qword_267F09E98);
      sub_2201825A0();
      swift_release();
    }
    *(void *)(v6 + v12) = 0;
    swift_release();
    int64_t v19 = *(void **)(v6 + qword_267F0A7A8);
    return objc_msgSend(v19, sel_stopAnimation);
  }
  return result;
}

uint64_t sub_220175680(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[5] = a4;
  uint64_t v5 = sub_220182830();
  v4[6] = v5;
  v4[7] = *(void *)(v5 - 8);
  v4[8] = swift_task_alloc();
  sub_220182570();
  v4[9] = sub_220182560();
  uint64_t v7 = sub_220182550();
  v4[10] = v7;
  v4[11] = v6;
  return MEMORY[0x270FA2498](sub_220175774, v7, v6);
}

uint64_t sub_220175774()
{
  sub_220182820();
  int v3 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, char))((char *)&dword_267F0AAF0 + dword_267F0AAF0);
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 96) = v1;
  void *v1 = v0;
  v1[1] = sub_22017583C;
  return v3(1000000000000000000, 0, 0, 0, 1);
}

uint64_t sub_22017583C()
{
  uint64_t v2 = *v1;
  uint64_t v3 = *(void *)(*v1 + 64);
  uint64_t v4 = *(void *)(*v1 + 56);
  uint64_t v5 = *(void *)(*v1 + 48);
  *(void *)(*v1 + 104) = v0;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  uint64_t v6 = *(void *)(v2 + 88);
  uint64_t v7 = *(void *)(v2 + 80);
  if (v0) {
    uint64_t v8 = sub_2201811AC;
  }
  else {
    uint64_t v8 = sub_2201811D8;
  }
  return MEMORY[0x270FA2498](v8, v7, v6);
}

uint64_t sub_2201759D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[5] = a4;
  uint64_t v5 = sub_220182830();
  v4[6] = v5;
  v4[7] = *(void *)(v5 - 8);
  v4[8] = swift_task_alloc();
  sub_220182570();
  v4[9] = sub_220182560();
  uint64_t v7 = sub_220182550();
  v4[10] = v7;
  v4[11] = v6;
  return MEMORY[0x270FA2498](sub_220175AC8, v7, v6);
}

uint64_t sub_220175AC8()
{
  sub_220182820();
  uint64_t v3 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, char))((char *)&dword_267F0AAF0 + dword_267F0AAF0);
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 96) = v1;
  void *v1 = v0;
  v1[1] = sub_220175B90;
  return v3(1000000000000000000, 0, 0, 0, 1);
}

uint64_t sub_220175B90()
{
  uint64_t v2 = *v1;
  uint64_t v3 = *(void *)(*v1 + 64);
  uint64_t v4 = *(void *)(*v1 + 56);
  uint64_t v5 = *(void *)(*v1 + 48);
  *(void *)(*v1 + 104) = v0;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  uint64_t v6 = *(void *)(v2 + 88);
  uint64_t v7 = *(void *)(v2 + 80);
  if (v0) {
    uint64_t v8 = sub_220175E18;
  }
  else {
    uint64_t v8 = sub_220175D28;
  }
  return MEMORY[0x270FA2498](v8, v7, v6);
}

uint64_t sub_220175D28()
{
  uint64_t v1 = v0[13];
  swift_release();
  sub_2201825B0();
  if (!v1)
  {
    uint64_t v2 = v0[5] + 16;
    swift_beginAccess();
    uint64_t v3 = MEMORY[0x223C677B0](v2);
    if (v3)
    {
      uint64_t v4 = (char *)v3;
      uint64_t v5 = qword_267F0A7A8;
      objc_msgSend(*(id *)(v3 + qword_267F0A7A8), sel_stopAnimation);
      objc_msgSend(*(id *)&v4[v5], sel_startAnimation);
    }
  }
  swift_task_dealloc();
  uint64_t v6 = (uint64_t (*)(void))v0[1];
  return v6();
}

uint64_t sub_220175E18()
{
  swift_release();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

void sub_220175E84()
{
  uint64_t v1 = v0;
  id v2 = objc_msgSend(v0, sel_headerView);
  objc_msgSend(v2, sel_setAllowFullWidthIcon_, 1);

  uint64_t v3 = *(void **)&v0[qword_267F0A778];
  if (v3)
  {
    uint64_t v4 = sub_220181B70();
    uint64_t v5 = *(void *)(v4 - 8);
    uint64_t v6 = *(void *)(v5 + 64);
    MEMORY[0x270FA5388](v4);
    uint64_t v50 = (char *)&v45 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
    unint64_t v51 = ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F09E10);
    MEMORY[0x270FA5388](v7 - 8);
    uint64_t v9 = (char *)&v45 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
    id v10 = v3;
    id v11 = objc_msgSend(v1, sel_traitCollection);
    objc_msgSend(v11, sel_userInterfaceStyle);

    sub_220152F40((uint64_t)v9);
    uint64_t v12 = v5;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v9, 1, v4) == 1)
    {
      sub_22014ACAC((uint64_t)v9, &qword_267F09E10);
      if (qword_267F09C80 != -1) {
        swift_once();
      }
      uint64_t v13 = sub_220181C80();
      __swift_project_value_buffer(v13, (uint64_t)qword_267F0C120);
      uint64_t v14 = sub_220181C60();
      os_log_type_t v15 = sub_2201825F0();
      if (os_log_type_enabled(v14, v15))
      {
        uint64_t v16 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v16 = 0;
        _os_log_impl(&dword_22012C000, v14, v15, "Can't load icon. micaAsset is nil.", v16, 2u);
        MEMORY[0x223C676F0](v16, -1, -1);
      }
      else
      {
      }
      return;
    }
    uint64_t v48 = &v45;
    id v49 = v10;
    uint64_t v20 = v5;
    id v21 = v50;
    (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v50, v9, v4);
    __swift_instantiateConcreteTypeFromMangledName(&qword_267F0A9F0);
    uint64_t v22 = swift_allocObject();
    *(_OWORD *)(v22 + 16) = xmmword_220186E50;
    id v23 = objc_allocWithZone(MEMORY[0x263F5B888]);
    uint64_t v24 = (void *)sub_220182450();
    id v25 = objc_msgSend(v23, sel_initWithStateName_transitionDuration_transitionSpeed_, v24, 0.01, 1.0);

    *(void *)(v22 + 32) = v25;
    id v26 = objc_allocWithZone(MEMORY[0x263F5B888]);
    uint64_t v27 = (void *)sub_220182450();
    id v28 = objc_msgSend(v26, sel_initWithStateName_transitionDuration_transitionSpeed_, v27, 2.0, 1.0);

    *(void *)(v22 + 40) = v28;
    uint64_t v52 = v22;
    uint64_t v29 = sub_220182510();
    unint64_t v30 = v52;
    MEMORY[0x270FA5388](v29);
    int64_t v31 = (char *)&v45 - (char *)v51;
    (*(void (**)(int64_t, char *, uint64_t))(v20 + 16))((char *)&v45 - (char *)v51, v21, v4);
    uint64_t v32 = v20;
    if (v30 >> 62)
    {
      id v34 = v49;
      id v44 = v49;
      swift_bridgeObjectRetain();
      unint64_t v33 = (void *)sub_220182870();
      swift_bridgeObjectRelease();
      uint64_t v46 = &v45;
      uint64_t v47 = v32;
      if (!v33) {
        goto LABEL_20;
      }
    }
    else
    {
      unint64_t v33 = *(void **)((v30 & 0xFFFFFFFFFFFFFF8) + 0x10);
      id v34 = v49;
      id v35 = v49;
      uint64_t v46 = &v45;
      uint64_t v47 = v32;
      if (!v33) {
        goto LABEL_20;
      }
    }
    if ((v30 & 0xC000000000000001) != 0)
    {
      id v36 = (id)MEMORY[0x223C66AB0](0, v30);
    }
    else
    {
      if (!*(void *)((v30 & 0xFFFFFFFFFFFFFF8) + 0x10))
      {
        __break(1u);
        return;
      }
      id v36 = *(id *)(v30 + 32);
    }
    unint64_t v33 = v36;
LABEL_20:
    id v37 = objc_allocWithZone(MEMORY[0x263F5B880]);
    uint64_t v38 = (void *)sub_220181B50();
    sub_220149EE0(0, &qword_267F0AB10);
    unint64_t v39 = (void *)sub_2201824E0();
    swift_bridgeObjectRelease();
    id v40 = objc_msgSend(v37, sel_initWithUrlToPackage_animationView_animatedStates_startAtFirstState_, v38, v34, v39, v33);

    unint64_t v41 = v34;
    unint64_t v42 = *(void (**)(int64_t, uint64_t))(v47 + 8);
    v42(v31, v4);
    uint64_t v43 = *(void **)&v1[qword_267F0A7A8];
    *(void *)&v1[qword_267F0A7A8] = v40;

    v42((int64_t)v21, v4);
    return;
  }
  if (qword_267F09C80 != -1) {
    swift_once();
  }
  uint64_t v17 = sub_220181C80();
  __swift_project_value_buffer(v17, (uint64_t)qword_267F0C120);
  unint64_t v51 = sub_220181C60();
  os_log_type_t v18 = sub_2201825F0();
  if (os_log_type_enabled(v51, v18))
  {
    int64_t v19 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)int64_t v19 = 0;
    _os_log_impl(&dword_22012C000, v51, v18, "Can't load icon. animationView is nil.", v19, 2u);
    MEMORY[0x223C676F0](v19, -1, -1);
  }
}

uint64_t sub_2201764E0@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_220180028((unint64_t *)&qword_267F0A920, (void (*)(uint64_t))type metadata accessor for NotificationSummarizationOnboardingViewModel);
  sub_220181BF0();
  swift_release();
  uint64_t v4 = (void *)(v3
                + OBJC_IVAR____TtC20UserNotificationsKit44NotificationSummarizationOnboardingViewModel__selectedCategories);
  swift_beginAccess();
  *a2 = *v4;
  return swift_bridgeObjectRetain();
}

uint64_t sub_2201765AC()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_2201767A4(void *a1)
{
  uint64_t v3 = type metadata accessor for NotificationSummarizationOnboardingIntroView();
  MEMORY[0x270FA5388](v3);
  uint64_t v5 = (_OWORD *)((char *)&v36 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  type metadata accessor for NotificationSummarizationOnboardingViewModel();
  uint64_t v6 = 0;
  if (objc_msgSend(a1, sel_isKindOfClass_, swift_getObjCClassFromMetadata()))
  {
    uint64_t v7 = swift_dynamicCastClass();
    if (v7)
    {
      uint64_t v8 = v7;
      id v49 = &type metadata for NotificationsUIFeatureFlags;
      unint64_t v50 = sub_220160FDC();
      uint64_t v9 = swift_allocObject();
      *(void *)&long long v48 = v9;
      *(void *)(v9 + 16) = "NotificationsUI";
      *(void *)(v9 + 24) = 15;
      *(unsigned char *)(v9 + 32) = 2;
      *(void *)(v9 + 40) = "GreymatterOnboardingWithAppCategorization";
      *(void *)(v9 + 48) = 41;
      *(unsigned char *)(v9 + 56) = 2;
      swift_unknownObjectRetain();
      char v10 = sub_220181C40();
      __swift_destroy_boxed_opaque_existential_0((uint64_t)&v48);
      uint64_t v11 = swift_allocObject();
      *(void *)(v11 + 16) = v1;
      *(void *)(v11 + 24) = v8;
      uint64_t v12 = swift_allocObject();
      *(void *)(v12 + 16) = v1;
      *(void *)(v12 + 24) = v8;
      uint64_t v13 = swift_allocObject();
      if (v10)
      {
        uint64_t v37 = 0;
        uint64_t v38 = 0;
        *(void *)(v13 + 16) = 0xD00000000000002ELL;
        *(void *)(v13 + 24) = 0x8000000220189A80;
        uint64_t v44 = v13;
        uint64_t v42 = 0;
        uint64_t v43 = (char *)sub_2201811E8;
        unint64_t v39 = 0;
        unint64_t v40 = (unint64_t)sub_22017FB30;
        uint64_t v41 = v12;
      }
      else
      {
        *(void *)(v13 + 16) = 0xD00000000000002ELL;
        *(void *)(v13 + 24) = 0x8000000220189990;
        uint64_t v44 = v13;
        uint64_t v14 = swift_allocObject();
        uint64_t v41 = 0;
        uint64_t v42 = v14;
        *(void *)(v14 + 16) = 0xD00000000000002DLL;
        *(void *)(v14 + 24) = 0x8000000220189170;
        uint64_t v43 = (char *)sub_22017FB58;
        unint64_t v39 = sub_2201811E8;
        uint64_t v37 = v11;
        uint64_t v38 = sub_22017FB28;
        unint64_t v40 = 1;
      }
      uint64_t v45 = v12;
      uint64_t v46 = v11;
      swift_retain();
      uint64_t v15 = swift_allocObject();
      *(void *)(v15 + 16) = 0xD00000000000002ALL;
      *(void *)(v15 + 24) = 0x80000002201899C0;
      *(void *)((char *)v5 + *(int *)(v3 + 28)) = swift_getKeyPath();
      __swift_instantiateConcreteTypeFromMangledName(&qword_267F0AAA0);
      swift_storeEnumTagMultiPayload();
      _OWORD *v5 = 0u;
      v5[1] = 0u;
      uint64_t v47 = v8;
      swift_unknownObjectRetain_n();
      __swift_instantiateConcreteTypeFromMangledName(&qword_267F0AAA8);
      sub_220182290();
      v5[2] = v48;
      uint64_t v16 = (void *)((char *)v5 + *(int *)(v3 + 32));
      uint64_t v47 = sub_22015DFE4();
      __swift_instantiateConcreteTypeFromMangledName(&qword_267F0AAB0);
      sub_220182290();
      uint64_t v17 = *((void *)&v48 + 1);
      *uint64_t v16 = v48;
      v16[1] = v17;
      if (qword_267F09C70 != -1) {
        swift_once();
      }
      id v18 = (id)qword_267F0C100;
      int64_t v19 = (void *)sub_220182450();
      uint64_t v20 = (void *)sub_220182450();
      id v21 = objc_msgSend(v18, sel_localizedStringForKey_value_table_, v19, 0, v20);

      uint64_t v22 = sub_220182460();
      uint64_t v24 = v23;

      id v25 = (id)qword_267F0C100;
      id v26 = (void *)sub_220182450();
      uint64_t v27 = (void *)sub_220182450();
      id v28 = objc_msgSend(v25, sel_localizedStringForKey_value_table_, v26, 0, v27);

      uint64_t v29 = sub_220182460();
      uint64_t v31 = v30;

      uint64_t v32 = swift_allocObject();
      *(void *)(v32 + 16) = 0xD000000000000022;
      *(void *)(v32 + 24) = 0x8000000220189A50;
      id v33 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_267F0AAB8));
      sub_220172FFC((uint64_t)v5, v22, v24, v29, v31, v40, v41, v43, v44, 2uLL, 0, (uint64_t)sub_2201811E8, v15, (unint64_t)v38, v37, (uint64_t)v39, v42, 0, 0,
        (uint64_t)sub_2201811E8,
        v32);
      uint64_t v6 = v34;
      swift_release();
      swift_release();
      swift_unknownObjectRelease();
    }
    else
    {
      return 0;
    }
  }
  return v6;
}

uint64_t sub_220176D70(void *a1)
{
  uint64_t v2 = type metadata accessor for NotificationSummarizationOnboardingCustomizationByCategoriesView(0);
  uint64_t v3 = v2 - 8;
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (_OWORD *)((char *)v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  *(void *)((char *)v5 + *(int *)(v3 + 32)) = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F0AAA0);
  swift_storeEnumTagMultiPayload();
  _OWORD *v5 = 0u;
  v5[1] = 0u;
  uint64_t v6 = *(int *)(v3 + 36);
  v20[1] = a1;
  a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F0AAA8);
  sub_220182290();
  *(_OWORD *)((char *)v5 + v6) = v21;
  if (qword_267F09C70 != -1) {
    swift_once();
  }
  id v7 = (id)qword_267F0C100;
  uint64_t v8 = (void *)sub_220182450();
  uint64_t v9 = (void *)sub_220182450();
  id v10 = objc_msgSend(v7, sel_localizedStringForKey_value_table_, v8, 0, v9);

  uint64_t v11 = sub_220182460();
  uint64_t v13 = v12;

  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = 0xD000000000000022;
  *(void *)(v14 + 24) = 0x8000000220189A50;
  id v15 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_267F0AB18));
  sub_220173AB4((uint64_t)v5, v11, v13, 0, 0, 1uLL, 0, (char *)sub_22017713C, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    (uint64_t)sub_2201811E8,
    v14,
    type metadata accessor for NotificationSummarizationOnboardingCustomizationByCategoriesView,
    &qword_267F0AB18,
    type metadata accessor for NotificationSummarizationOnboardingCustomizationByCategoriesView,
    &qword_267F0AB70,
    (uint64_t)&unk_26D1FFF30,
    (uint64_t)&unk_26D1FFF58,
    (uint64_t)sub_220180188,
    (uint64_t)sub_220180144);
  uint64_t v17 = v16;
  uint64_t v18 = MEMORY[0x270FA5388](v16);
  MEMORY[0x270FA5388](v18);
  sub_220181BD0();
  return v17;
}

unint64_t sub_22017713C(void *a1)
{
  unint64_t v1 = 0xD000000000000043;
  if (a1)
  {
    swift_getKeyPath();
    sub_220180028((unint64_t *)&qword_267F0A920, (void (*)(uint64_t))type metadata accessor for NotificationSummarizationOnboardingViewModel);
    uint64_t v3 = a1;
    sub_220181BF0();
    swift_release();
    uint64_t v4 = &v3[OBJC_IVAR____TtC20UserNotificationsKit44NotificationSummarizationOnboardingViewModel__selectedCategories];
    swift_beginAccess();
    if (!*(void *)(*(void *)v4 + 16)) {
      goto LABEL_16;
    }
    swift_getKeyPath();
    sub_220181BF0();
    swift_release();
    uint64_t v5 = *(void *)v4;
    if (*(void *)(*(void *)v4 + 16))
    {
      sub_2201829B0();
      swift_bridgeObjectRetain();
      sub_220182490();
      uint64_t v6 = sub_220182A00();
      uint64_t v7 = -1 << *(unsigned char *)(v5 + 32);
      unint64_t v8 = v6 & ~v7;
      if ((*(void *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8))
      {
        uint64_t v9 = ~v7;
        while (1)
        {
          switch(*(unsigned char *)(*(void *)(v5 + 48) + v8))
          {
            case 3:
              swift_bridgeObjectRelease();
              goto LABEL_15;
            default:
              char v10 = sub_220182910();
              swift_bridgeObjectRelease();
              if (v10)
              {
LABEL_15:
                swift_bridgeObjectRelease();
                unint64_t v1 = 0xD000000000000048;
                goto LABEL_16;
              }
              unint64_t v8 = (v8 + 1) & v9;
              if (((*(void *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8) & 1) == 0) {
                goto LABEL_9;
              }
              break;
          }
        }
      }
LABEL_9:
      swift_bridgeObjectRelease();
    }
    swift_getKeyPath();
    sub_220181BF0();
    swift_release();
    if (*(void *)(*(void *)v4 + 16) == 3) {
      unint64_t v1 = 0xD000000000000047;
    }
    else {
      unint64_t v1 = 0xD000000000000048;
    }
LABEL_16:
  }
  return v1;
}

uint64_t sub_220177478()
{
  return swift_release();
}

uint64_t (*sub_220177514(uint64_t a1, void *a2, void *a3))()
{
  uint64_t v6 = (void *)swift_allocObject();
  v6[2] = a1;
  v6[3] = a2;
  v6[4] = a3;
  id v7 = a2;
  id v8 = a3;
  return sub_22017FD20;
}

uint64_t sub_220177588(uint64_t a1, void *a2, void *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F09E90);
  MEMORY[0x270FA5388](v6 - 8);
  id v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_220182590();
  char v10 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56);
  v10(v8, 1, 1, v9);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = a1;
  v11[5] = a2;
  v11[6] = a3;
  id v12 = a2;
  id v13 = a3;
  sub_220174760((uint64_t)v8, (uint64_t)&unk_267F0AB28, (uint64_t)v11);
  swift_release();
  v10(v8, 1, 1, v9);
  sub_220182570();
  id v14 = v12;
  id v15 = v13;
  uint64_t v16 = sub_220182560();
  uint64_t v17 = (void *)swift_allocObject();
  uint64_t v18 = MEMORY[0x263F8F500];
  id v17[2] = v16;
  v17[3] = v18;
  v17[4] = v15;
  v17[5] = v14;
  sub_22017490C((uint64_t)v8, (uint64_t)&unk_267F0AB38, (uint64_t)v17);
  return swift_release();
}

uint64_t sub_22017773C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[3] = a5;
  v6[4] = a6;
  v6[2] = a4;
  return MEMORY[0x270FA2498](sub_220177760, 0, 0);
}

uint64_t sub_220177760()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = swift_task_alloc();
  uint64_t v3 = swift_task_alloc();
  long long v4 = *(_OWORD *)(v0 + 24);
  *(void *)(v2 + 16) = v4;
  *(void *)(v3 + 16) = v1;
  *(_OWORD *)(v3 + 24) = v4;
  sub_220181BD0();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(void))(v0 + 8);
  return v5();
}

uint64_t sub_22017783C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[6] = a4;
  v5[7] = a5;
  v5[5] = a1;
  sub_220182570();
  v5[8] = sub_220182560();
  uint64_t v7 = sub_220182550();
  return MEMORY[0x270FA2498](sub_2201778D8, v7, v6);
}

uint64_t sub_2201778D8()
{
  uint64_t v1 = *(void *)(v0 + 48);
  swift_release();
  uint64_t v2 = *(void **)(v1 + qword_267F0A770);
  if (v2
    && (objc_msgSend(*(id *)(v1 + qword_267F0A770), sel_respondsToSelector_, sel_onboardingController_canProceed_nextButtonText_) & 1) != 0)
  {
    uint64_t v3 = *(void *)(v0 + 56);
    swift_getKeyPath();
    *(void *)(v0 + 16) = v3;
    sub_220180028((unint64_t *)&qword_267F0A920, (void (*)(uint64_t))type metadata accessor for NotificationSummarizationOnboardingViewModel);
    swift_unknownObjectRetain();
    sub_220181BF0();
    swift_release();
    uint64_t v4 = v3 + OBJC_IVAR____TtC20UserNotificationsKit44NotificationSummarizationOnboardingViewModel__selectedCategories;
    swift_beginAccess();
    uint64_t v5 = *(void *)(*(void *)v4 + 16);
    sub_22016562C();
    if (v6) {
      uint64_t v7 = (void *)sub_220182450();
    }
    else {
      uint64_t v7 = 0;
    }
    objc_msgSend(v2, sel_onboardingController_canProceed_nextButtonText_, *(void *)(v0 + 48), v5 > 0, v7);

    swift_unknownObjectRelease();
    swift_bridgeObjectRelease();
    char v8 = 0;
  }
  else
  {
    char v8 = 1;
  }
  **(unsigned char **)(v0 + 40) = v8;
  uint64_t v9 = *(uint64_t (**)(void))(v0 + 8);
  return v9();
}

UNNotificationOnboarding __swiftcall UNNotificationOnboarding.init()()
{
  id v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());

  return (UNNotificationOnboarding)objc_msgSend(v0, sel_init);
}

id UNNotificationOnboarding.init()()
{
  v1.super_class = (Class)UNNotificationOnboarding;
  return objc_msgSendSuper2(&v1, sel_init);
}

uint64_t sub_220177C00()
{
  if (qword_267F09C70 != -1) {
    swift_once();
  }
  id v0 = (id)qword_267F0C100;
  objc_super v1 = (void *)sub_220182450();
  uint64_t v2 = (void *)sub_220182450();
  id v3 = objc_msgSend(v0, sel_localizedStringForKey_value_table_, v1, 0, v2);

  uint64_t v4 = sub_220182460();
  return v4;
}

uint64_t sub_220177CF4(uint64_t a1)
{
  if (!a1) {
    return 0xD00000000000002FLL;
  }
  sub_220182780();
  sub_2201824B0();
  uint64_t result = sub_220182860();
  __break(1u);
  return result;
}

void sub_220177DB4()
{
  id v0 = sub_22017DECC();
  if (v0)
  {
    objc_super v1 = v0;
    MEMORY[0x270FA5388](v0);
    uint64_t v2 = swift_bridgeObjectRetain();
    sub_22017E3D8(v2, (void (*)(uint64_t, uint64_t))sub_220180748);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_267F0ABD0);
    id v3 = (void *)sub_220182420();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    uint64_t v4 = (void *)sub_220182450();
    swift_bridgeObjectRelease();
    objc_msgSend(v1, sel_setObject_forKey_, v3, v4);
    swift_bridgeObjectRelease();
  }
  else
  {
    if (qword_267F09C80 != -1) {
      swift_once();
    }
    uint64_t v5 = sub_220181C80();
    __swift_project_value_buffer(v5, (uint64_t)qword_267F0C120);
    char v8 = sub_220181C60();
    os_log_type_t v6 = sub_220182600();
    if (os_log_type_enabled(v8, v6))
    {
      uint64_t v7 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl(&dword_22012C000, v8, v6, "Skipping save, cannot get defaults.", v7, 2u);
      MEMORY[0x223C676F0](v7, -1, -1);
    }
  }
}

uint64_t sub_220177FD8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  id v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F29BF8]), sel_init);
  if (!v6)
  {
    if (qword_267F09C80 != -1) {
      swift_once();
    }
    uint64_t v7 = sub_220181C80();
    __swift_project_value_buffer(v7, (uint64_t)qword_267F0C120);
    char v8 = sub_220181C60();
    os_log_type_t v9 = sub_2201825F0();
    if (os_log_type_enabled(v8, v9))
    {
      char v10 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)char v10 = 0;
      _os_log_impl(&dword_22012C000, v8, v9, "Failed to get build version", v10, 2u);
      MEMORY[0x223C676F0](v10, -1, -1);
    }

    id v6 = 0;
  }
  *a3 = v6;
  id v11 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F29CB8]), sel_init);
  id v12 = objc_msgSend(v11, sel_bundleIdentifier);

  if (v12)
  {
    uint64_t v13 = sub_220182460();
    uint64_t v15 = v14;

    uint64_t v16 = (int *)type metadata accessor for OnboardingDefaults.ShownExperienceRecord();
    uint64_t v17 = (void *)((char *)a3 + v16[6]);
    uint64_t *v17 = v13;
    v17[1] = v15;
  }
  else
  {
    if (qword_267F09C80 != -1) {
      swift_once();
    }
    uint64_t v18 = sub_220181C80();
    __swift_project_value_buffer(v18, (uint64_t)qword_267F0C120);
    int64_t v19 = sub_220181C60();
    os_log_type_t v20 = sub_2201825F0();
    if (os_log_type_enabled(v19, v20))
    {
      long long v21 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)long long v21 = 0;
      _os_log_impl(&dword_22012C000, v19, v20, "Failed to get bundle identifier for current process", v21, 2u);
      MEMORY[0x223C676F0](v21, -1, -1);
    }

    uint64_t v16 = (int *)type metadata accessor for OnboardingDefaults.ShownExperienceRecord();
    uint64_t v22 = (void *)((char *)a3 + v16[6]);
    *uint64_t v22 = 0;
    v22[1] = 0;
  }
  type metadata accessor for OnboardingDefaults.ShownExperienceRecord();
  uint64_t result = sub_220181BB0();
  uint64_t v24 = (char *)a3 + v16[7];
  *(void *)uint64_t v24 = a1;
  v24[8] = 0;
  *(void *)((char *)a3 + v16[8]) = a2;
  return result;
}

uint64_t sub_220178250@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = (int *)type metadata accessor for OnboardingDefaults.ShownExperienceRecord();
  uint64_t v5 = *((void *)v4 - 1);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v82 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_220181BC0();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  id v11 = (char *)&v82 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F0AA08);
  MEMORY[0x270FA5388](v12 - 8);
  uint64_t v14 = (char *)&v82 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(void *)(a1 + 16) && (unint64_t v15 = sub_22017A2C8(1702125924, 0xE400000000000000), (v16 & 1) != 0))
  {
    sub_2201497B0(*(void *)(a1 + 56) + 32 * v15, (uint64_t)&v90);
    int v17 = swift_dynamicCast();
    (*(void (**)(char *, void, uint64_t, uint64_t))(v9 + 56))(v14, v17 ^ 1u, 1, v8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v14, 1, v8) != 1)
    {
      (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v11, v14, v8);
      (*(void (**)(char *, char *, uint64_t))(v9 + 16))(&v7[v4[5]], v11, v8);
      uint64_t v18 = *(void *)(a1 + 16);
      uint64_t v87 = a2;
      if (v18
        && (unint64_t v19 = sub_22017A2C8(0x646C697562, 0xE500000000000000), (v20 & 1) != 0)
        && (sub_2201497B0(*(void *)(a1 + 56) + 32 * v19, (uint64_t)&v90), (swift_dynamicCast() & 1) != 0))
      {
        uint64_t v22 = v88;
        unint64_t v21 = v89;
        id v23 = objc_allocWithZone(MEMORY[0x263F29BF8]);
        swift_bridgeObjectRetain();
        uint64_t v86 = v22;
        uint64_t v24 = (void *)sub_220182450();
        swift_bridgeObjectRelease();
        id v25 = objc_msgSend(v23, sel_initWithString_, v24);

        if (v25)
        {
          swift_bridgeObjectRelease();
          *(void *)uint64_t v7 = v25;
          a2 = v87;
LABEL_22:
          if (*(void *)(a1 + 16)
            && (unint64_t v37 = sub_22017A2C8(0x656C646E7562, 0xE600000000000000), (v38 & 1) != 0)
            && (sub_2201497B0(*(void *)(a1 + 56) + 32 * v37, (uint64_t)&v90), (swift_dynamicCast() & 1) != 0))
          {
            unint64_t v39 = v89;
            unint64_t v40 = (uint64_t *)&v7[v4[6]];
            *unint64_t v40 = v88;
            v40[1] = v39;
          }
          else
          {
            if (qword_267F09C80 != -1) {
              swift_once();
            }
            uint64_t v41 = sub_220181C80();
            __swift_project_value_buffer(v41, (uint64_t)qword_267F0C120);
            uint64_t v42 = sub_220181C60();
            os_log_type_t v43 = sub_2201825F0();
            if (os_log_type_enabled(v42, v43))
            {
              uint64_t v44 = (uint8_t *)swift_slowAlloc();
              *(_WORD *)uint64_t v44 = 0;
              _os_log_impl(&dword_22012C000, v42, v43, "Bundle is unavailable for previously stored ShownExperienceRecord.", v44, 2u);
              uint64_t v45 = v44;
              a2 = v87;
              MEMORY[0x223C676F0](v45, -1, -1);
            }

            uint64_t v46 = &v7[v4[6]];
            *(void *)uint64_t v46 = 0;
            *((void *)v46 + 1) = 0;
          }
          if (*(void *)(a1 + 16)
            && (unint64_t v47 = sub_22017A2C8(0x656D6F6374756FLL, 0xE700000000000000), (v48 & 1) != 0)
            && (sub_2201497B0(*(void *)(a1 + 56) + 32 * v47, (uint64_t)&v90), (swift_dynamicCast() & 1) != 0))
          {
            uint64_t v50 = v88;
            unint64_t v49 = v89;
            swift_bridgeObjectRetain();
            unint64_t v51 = sub_2201828C0();
            swift_bridgeObjectRelease();
            if (v51 < 3)
            {
              swift_bridgeObjectRelease();
              char v52 = 0;
              uint64_t v53 = &v7[v4[7]];
              *(void *)uint64_t v53 = v51;
              a2 = v87;
LABEL_42:
              v53[8] = v52;
              if (*(void *)(a1 + 16)
                && (unint64_t v59 = sub_22017A2C8(0x6F697463656C6573, 0xE90000000000006ELL), (v60 & 1) != 0))
              {
                sub_2201497B0(*(void *)(a1 + 56) + 32 * v59, (uint64_t)&v90);
              }
              else
              {
                long long v90 = 0u;
                long long v91 = 0u;
              }
              swift_bridgeObjectRelease();
              if (*((void *)&v91 + 1))
              {
                __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267F0A950);
                if (swift_dynamicCast())
                {
                  uint64_t v61 = v88;
                  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
LABEL_55:
                  *(void *)&v7[v4[8]] = v61;
                  sub_220180548((uint64_t)v7, a2);
                  uint64_t v30 = 0;
                  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, int *))(v5 + 56))(a2, v30, 1, v4);
                }
              }
              else
              {
                sub_22014ACAC((uint64_t)&v90, &qword_267F0ABB0);
              }
              if (qword_267F09C80 != -1) {
                swift_once();
              }
              uint64_t v62 = sub_220181C80();
              __swift_project_value_buffer(v62, (uint64_t)qword_267F0C120);
              uint64_t v63 = sub_220181C60();
              os_log_type_t v64 = sub_2201825F0();
              if (os_log_type_enabled(v63, v64))
              {
                unint64_t v65 = (uint8_t *)swift_slowAlloc();
                *(_WORD *)unint64_t v65 = 0;
                _os_log_impl(&dword_22012C000, v63, v64, "No selection persisted.", v65, 2u);
                MEMORY[0x223C676F0](v65, -1, -1);
              }

              (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
              uint64_t v61 = 0;
              goto LABEL_55;
            }
            if (qword_267F09C80 != -1) {
              swift_once();
            }
            uint64_t v66 = sub_220181C80();
            __swift_project_value_buffer(v66, (uint64_t)qword_267F0C120);
            swift_bridgeObjectRetain();
            id v67 = sub_220181C60();
            os_log_type_t v68 = sub_2201825F0();
            LODWORD(v86) = v68;
            if (os_log_type_enabled(v67, v68))
            {
              uint64_t v85 = (uint8_t *)swift_slowAlloc();
              uint64_t v84 = swift_slowAlloc();
              *(void *)&long long v90 = v84;
              os_log_t v83 = v67;
              uint64_t v69 = v85;
              *(_DWORD *)uint64_t v85 = 136446210;
              id v82 = v69 + 4;
              swift_bridgeObjectRetain();
              uint64_t v88 = sub_220149888(v50, v49, (uint64_t *)&v90);
              sub_2201826B0();
              swift_bridgeObjectRelease_n();
              os_log_t v70 = v83;
              id v71 = v85;
              _os_log_impl(&dword_22012C000, v83, (os_log_type_t)v86, "Cannot convert string, '%{public}s', to Outcome for previously stored ShownExperienceRecord.", v85, 0xCu);
              uint64_t v72 = v84;
              swift_arrayDestroy();
              MEMORY[0x223C676F0](v72, -1, -1);
              MEMORY[0x223C676F0](v71, -1, -1);
            }
            else
            {

              swift_bridgeObjectRelease_n();
            }
            a2 = v87;
          }
          else
          {
            if (qword_267F09C80 != -1) {
              swift_once();
            }
            uint64_t v54 = sub_220181C80();
            __swift_project_value_buffer(v54, (uint64_t)qword_267F0C120);
            uint64_t v55 = sub_220181C60();
            os_log_type_t v56 = sub_2201825F0();
            if (os_log_type_enabled(v55, v56))
            {
              unint64_t v57 = (uint8_t *)swift_slowAlloc();
              *(_WORD *)unint64_t v57 = 0;
              _os_log_impl(&dword_22012C000, v55, v56, "Outcome string is unavailable for previously stored ShownExperienceRecord.", v57, 2u);
              uint64_t v58 = v57;
              a2 = v87;
              MEMORY[0x223C676F0](v58, -1, -1);
            }
          }
          uint64_t v53 = &v7[v4[7]];
          *(void *)uint64_t v53 = 0;
          char v52 = 1;
          goto LABEL_42;
        }
        if (qword_267F09C80 != -1) {
          swift_once();
        }
        uint64_t v73 = sub_220181C80();
        __swift_project_value_buffer(v73, (uint64_t)qword_267F0C120);
        swift_bridgeObjectRetain();
        uint64_t v74 = sub_220181C60();
        os_log_type_t v75 = sub_2201825F0();
        int v76 = v75;
        if (os_log_type_enabled(v74, v75))
        {
          uint64_t v77 = swift_slowAlloc();
          LODWORD(v85) = v76;
          uint64_t v78 = (uint8_t *)v77;
          uint64_t v84 = swift_slowAlloc();
          *(void *)&long long v90 = v84;
          os_log_t v83 = v74;
          unint64_t v79 = v78;
          *(_DWORD *)uint64_t v78 = 136446210;
          id v82 = v78 + 4;
          swift_bridgeObjectRetain();
          uint64_t v88 = sub_220149888(v86, v21, (uint64_t *)&v90);
          sub_2201826B0();
          swift_bridgeObjectRelease_n();
          os_log_t v80 = v83;
          _os_log_impl(&dword_22012C000, v83, (os_log_type_t)v85, "Cannot convert string, '%{public}s', to BSBuildVersion for previously stored ShownExperienceRecord.", v79, 0xCu);
          uint64_t v81 = v84;
          swift_arrayDestroy();
          MEMORY[0x223C676F0](v81, -1, -1);
          MEMORY[0x223C676F0](v79, -1, -1);
        }
        else
        {

          swift_bridgeObjectRelease_n();
        }
        a2 = v87;
      }
      else
      {
        if (qword_267F09C80 != -1) {
          swift_once();
        }
        uint64_t v32 = sub_220181C80();
        __swift_project_value_buffer(v32, (uint64_t)qword_267F0C120);
        id v33 = sub_220181C60();
        os_log_type_t v34 = sub_2201825F0();
        if (os_log_type_enabled(v33, v34))
        {
          id v35 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)id v35 = 0;
          _os_log_impl(&dword_22012C000, v33, v34, "Build string is unavailable for previously stored ShownExperienceRecord.", v35, 2u);
          uint64_t v36 = v35;
          a2 = v87;
          MEMORY[0x223C676F0](v36, -1, -1);
        }
      }
      *(void *)uint64_t v7 = 0;
      goto LABEL_22;
    }
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(v14, 1, 1, v8);
  }
  swift_bridgeObjectRelease();
  sub_22014ACAC((uint64_t)v14, &qword_267F0AA08);
  if (qword_267F09C80 != -1) {
    swift_once();
  }
  uint64_t v26 = sub_220181C80();
  __swift_project_value_buffer(v26, (uint64_t)qword_267F0C120);
  uint64_t v27 = sub_220181C60();
  os_log_type_t v28 = sub_2201825F0();
  if (os_log_type_enabled(v27, v28))
  {
    uint64_t v29 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v29 = 0;
    _os_log_impl(&dword_22012C000, v27, v28, "Date is unavailable for previously stored ShownExperienceRecord.", v29, 2u);
    MEMORY[0x223C676F0](v29, -1, -1);
  }

  uint64_t v30 = 1;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, int *))(v5 + 56))(a2, v30, 1, v4);
}

uint64_t UNNotificationOnboardingOutcome.init(stringValue:)()
{
  uint64_t v0 = sub_2201828C0();
  swift_bridgeObjectRelease();
  if (v0 == 2) {
    return 2;
  }
  else {
    return v0 == 1;
  }
}

uint64_t sub_220178F04()
{
  objc_super v1 = v0;
  uint64_t v2 = (int *)type metadata accessor for OnboardingDefaults.ShownExperienceRecord();
  id v3 = (char *)v0 + v2[5];
  uint64_t v4 = sub_220181BC0();
  uint64_t v30 = v4;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)&v29);
  (*(void (**)(uint64_t *, char *, uint64_t))(*(void *)(v4 - 8) + 16))(boxed_opaque_existential_0, v3, v4);
  sub_22017285C(&v29, v28);
  uint64_t v6 = MEMORY[0x263F8EE80];
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  sub_22017C9C0(v28, 1702125924, 0xE400000000000000, isUniquelyReferenced_nonNull_native);
  swift_bridgeObjectRelease();
  uint64_t v8 = MEMORY[0x263F8D310];
  if (*v1)
  {
    id v9 = *v1;
    id v10 = objc_msgSend(v9, sel_stringRepresentation);
    uint64_t v11 = sub_220182460();
    uint64_t v13 = v12;

    uint64_t v30 = v8;
    *(void *)&long long v29 = v11;
    *((void *)&v29 + 1) = v13;
    sub_22017285C(&v29, v28);
    char v14 = swift_isUniquelyReferenced_nonNull_native();
    sub_22017C9C0(v28, 0x646C697562, 0xE500000000000000, v14);

    swift_bridgeObjectRelease();
  }
  unint64_t v15 = (char *)v1 + v2[7];
  if ((v15[8] & 1) == 0)
  {
    unint64_t v16 = *(void *)v15;
    if (v16 >= 3)
    {
      uint64_t result = sub_220182860();
      __break(1u);
      return result;
    }
    uint64_t v17 = 8 * v16;
    uint64_t v18 = *(void *)&aIncomplecomple[v17];
    uint64_t v19 = *(void *)&aIncomplecomple[v17 + 24];
    uint64_t v30 = v8;
    *(void *)&long long v29 = v18;
    *((void *)&v29 + 1) = v19;
    sub_22017285C(&v29, v28);
    char v20 = swift_isUniquelyReferenced_nonNull_native();
    sub_22017C9C0(v28, 0x656D6F6374756FLL, 0xE700000000000000, v20);
    swift_bridgeObjectRelease();
  }
  unint64_t v21 = (uint64_t *)((char *)v1 + v2[6]);
  uint64_t v22 = v21[1];
  if (v22)
  {
    uint64_t v23 = *v21;
    uint64_t v30 = v8;
    *(void *)&long long v29 = v23;
    *((void *)&v29 + 1) = v22;
    sub_22017285C(&v29, v28);
    swift_bridgeObjectRetain();
    char v24 = swift_isUniquelyReferenced_nonNull_native();
    sub_22017C9C0(v28, 0x656C646E7562, 0xE600000000000000, v24);
    swift_bridgeObjectRelease();
  }
  uint64_t v25 = *(uint64_t *)((char *)v1 + v2[8]);
  if (v25)
  {
    uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267F0A950);
    *(void *)&long long v29 = v25;
    sub_22017285C(&v29, v28);
    swift_bridgeObjectRetain();
    char v26 = swift_isUniquelyReferenced_nonNull_native();
    sub_22017C9C0(v28, 0x6F697463656C6573, 0xE90000000000006ELL, v26);
    swift_bridgeObjectRelease();
  }
  return v6;
}

void sub_22017922C(uint64_t a1, unint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F0A940);
  uint64_t v5 = MEMORY[0x270FA5388](v4 - 8);
  uint64_t v7 = (char *)&v31 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  id v9 = (char *)&v31 - v8;
  uint64_t v10 = type metadata accessor for OnboardingDefaults.ShownExperienceRecord();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v31 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_bridgeObjectRetain();
  uint64_t v14 = sub_22017F67C(a1, a2);
  if (v15)
  {
    if (qword_267F09C80 != -1) {
      swift_once();
    }
    uint64_t v26 = sub_220181C80();
    __swift_project_value_buffer(v26, (uint64_t)qword_267F0C120);
    swift_bridgeObjectRetain_n();
    uint64_t v27 = sub_220181C60();
    os_log_type_t v28 = sub_2201825F0();
    if (os_log_type_enabled(v27, v28))
    {
      long long v29 = (uint8_t *)swift_slowAlloc();
      uint64_t v30 = swift_slowAlloc();
      uint64_t v32 = v30;
      *(_DWORD *)long long v29 = 136446210;
      swift_bridgeObjectRetain();
      uint64_t v31 = sub_220149888(a1, a2, &v32);
      sub_2201826B0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_22012C000, v27, v28, "Cannot create NotificationOnboardingExperience from '%{public}s'.", v29, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x223C676F0](v30, -1, -1);
      MEMORY[0x223C676F0](v29, -1, -1);

      return;
    }
  }
  else
  {
    uint64_t v16 = v14;
    uint64_t v17 = swift_bridgeObjectRetain();
    sub_220178250(v17, (uint64_t)v9);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10) != 1)
    {
      sub_220180548((uint64_t)v9, (uint64_t)v13);
      sub_22018060C((uint64_t)v13, (uint64_t)v7, (uint64_t (*)(void))type metadata accessor for OnboardingDefaults.ShownExperienceRecord);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v7, 0, 1, v10);
      sub_220172DC4((uint64_t)v7, v16);
      sub_2201805AC((uint64_t)v13, (uint64_t (*)(void))type metadata accessor for OnboardingDefaults.ShownExperienceRecord);
      return;
    }
    sub_22014ACAC((uint64_t)v9, &qword_267F0A940);
    if (qword_267F09C80 != -1) {
      swift_once();
    }
    uint64_t v18 = sub_220181C80();
    __swift_project_value_buffer(v18, (uint64_t)qword_267F0C120);
    swift_bridgeObjectRetain_n();
    uint64_t v19 = sub_220181C60();
    os_log_type_t v20 = sub_2201825F0();
    if (os_log_type_enabled(v19, v20))
    {
      unint64_t v21 = (uint8_t *)swift_slowAlloc();
      uint64_t v22 = swift_slowAlloc();
      uint64_t v32 = v22;
      *(_DWORD *)unint64_t v21 = 136446210;
      swift_bridgeObjectRetain();
      uint64_t v23 = sub_220182430();
      unint64_t v25 = v24;
      swift_bridgeObjectRelease();
      uint64_t v31 = sub_220149888(v23, v25, &v32);
      sub_2201826B0();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_22012C000, v19, v20, "Cannot create ShownExperienceRecord from '%{public}s'.", v21, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x223C676F0](v22, -1, -1);
      MEMORY[0x223C676F0](v21, -1, -1);

      return;
    }
  }
  swift_bridgeObjectRelease_n();
}

uint64_t sub_220179728(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v4 = sub_220177CF4(a1);
  uint64_t v6 = v5;
  uint64_t v7 = sub_220178F04();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v10 = *a3;
  *a3 = 0x8000000000000000;
  sub_22017CB14(v7, v4, v6, isUniquelyReferenced_nonNull_native);
  *a3 = v10;
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t UNNotificationOnboardingExperience.description.getter(uint64_t a1)
{
  if (!a1) {
    return 0x7A6972616D6D7573;
  }
  uint64_t result = sub_220182860();
  __break(1u);
  return result;
}

uint64_t sub_220179854()
{
  return UNNotificationOnboardingExperience.description.getter(*v0);
}

uint64_t UNNotificationOnboardingClient.description.getter(uint64_t a1)
{
  if (!a1) {
    return 0x64647542696E696DLL;
  }
  if (a1 == 1) {
    return 0x73676E6974746573;
  }
  uint64_t result = sub_220182860();
  __break(1u);
  return result;
}

uint64_t sub_2201798F8()
{
  return UNNotificationOnboardingClient.description.getter(*v0);
}

uint64_t sub_220179900()
{
  return sub_220181DF0();
}

uint64_t sub_220179924(uint64_t a1)
{
  uint64_t v2 = sub_220181D10();
  MEMORY[0x270FA5388](v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return sub_220181E00();
}

uint64_t sub_2201799EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  *(void *)(v6 + 56) = v5;
  uint64_t v12 = sub_220182810();
  *(void *)(v6 + 64) = v12;
  *(void *)(v6 + 72) = *(void *)(v12 - 8);
  *(void *)(v6 + 80) = swift_task_alloc();
  *(void *)(v6 + 88) = swift_task_alloc();
  *(void *)(v6 + 40) = a1;
  *(void *)(v6 + 48) = a2;
  *(void *)(v6 + 16) = a3;
  *(void *)(v6 + 24) = a4;
  *(unsigned char *)(v6 + 32) = a5 & 1;
  return MEMORY[0x270FA2498](sub_220179AF0, 0, 0);
}

uint64_t sub_220179AF0()
{
  uint64_t v1 = v0[10];
  uint64_t v2 = v0[8];
  uint64_t v3 = v0[9];
  uint64_t v4 = sub_220182830();
  uint64_t v5 = sub_220180028(&qword_267F0AAF8, MEMORY[0x263F8F710]);
  sub_220182950();
  sub_220180028((unint64_t *)&unk_267F0AB00, MEMORY[0x263F8F6D8]);
  sub_220182840();
  uint64_t v6 = *(void (**)(uint64_t, uint64_t))(v3 + 8);
  v0[12] = v6;
  v0[13] = (v3 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v6(v1, v2);
  uint64_t v7 = (void *)swift_task_alloc();
  v0[14] = v7;
  *uint64_t v7 = v0;
  v7[1] = sub_220179C90;
  uint64_t v8 = v0[11];
  return MEMORY[0x270FA2380](v8, v0 + 2, v4, v5);
}

uint64_t sub_220179C90()
{
  uint64_t v2 = *(void (**)(uint64_t, uint64_t))(*v1 + 96);
  uint64_t v3 = *(void *)(*v1 + 88);
  uint64_t v4 = *(void *)(*v1 + 64);
  uint64_t v5 = *v1;
  *(void *)(v5 + 120) = v0;
  swift_task_dealloc();
  v2(v3, v4);
  if (!v0)
  {
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v6 = *(void *)(v5 + 8);
    __asm { BRAA            X1, X16 }
  }
  return MEMORY[0x270FA2498](sub_220179E4C, 0, 0);
}

uint64_t sub_220179E4C()
{
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_220179EB8(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_220179F94;
  return v6(a1);
}

uint64_t sub_220179F94()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

unint64_t sub_22017A08C(void *a1, double a2, double a3)
{
  sub_2201829B0();
  sub_2201829D0();
  if (a1)
  {
    id v6 = a1;
    sub_2201826A0();
  }
  sub_2201829E0();
  sub_2201829E0();
  uint64_t v7 = sub_220182A00();

  return sub_22017A340(a1, v7, a2, a3);
}

unint64_t sub_22017A15C(unsigned __int8 a1)
{
  sub_2201829B0();
  sub_220182490();
  swift_bridgeObjectRelease();
  uint64_t v2 = sub_220182A00();

  return sub_22017A478(a1, v2);
}

unint64_t sub_22017A25C(uint64_t a1)
{
  sub_2201829B0();
  sub_2201829C0();
  uint64_t v2 = sub_220182A00();

  return sub_22017A680(a1, v2);
}

unint64_t sub_22017A2C8(uint64_t a1, uint64_t a2)
{
  sub_2201829B0();
  sub_220182490();
  uint64_t v4 = sub_220182A00();

  return sub_22017A71C(a1, a2, v4);
}

unint64_t sub_22017A340(void *a1, uint64_t a2, double a3, double a4)
{
  uint64_t v5 = v4 + 64;
  uint64_t v6 = -1 << *(unsigned char *)(v4 + 32);
  unint64_t v7 = a2 & ~v6;
  if ((*(void *)(v4 + 64 + ((v7 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v7))
  {
    uint64_t v8 = v4;
    uint64_t v12 = ~v6;
    do
    {
      uint64_t v14 = *(void *)(v8 + 48) + 24 * v7;
      char v15 = *(void **)v14;
      double v17 = *(double *)(v14 + 8);
      double v16 = *(double *)(v14 + 16);
      if (*(void *)v14)
      {
        if (!a1) {
          goto LABEL_7;
        }
        sub_220149EE0(0, (unint64_t *)&qword_267F0A9A0);
        id v18 = v15;
        id v19 = a1;
        char v20 = sub_220182690();

        if ((v20 & 1) == 0) {
          goto LABEL_7;
        }
      }
      else if (a1)
      {
        goto LABEL_7;
      }
      if (v17 == a3 && v16 == a4) {
        return v7;
      }
LABEL_7:
      unint64_t v7 = (v7 + 1) & v12;
    }
    while (((*(void *)(v5 + ((v7 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v7) & 1) != 0);
  }
  return v7;
}

unint64_t sub_22017A478(unsigned __int8 a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    uint64_t v6 = a1;
    while (1)
    {
      unint64_t v7 = 0xD000000000000016;
      unint64_t v8 = 0x8000000220188300;
      switch(*(unsigned char *)(*(void *)(v2 + 48) + v4))
      {
        case 1:
          unint64_t v8 = 0x8000000220188320;
          unint64_t v7 = 0xD000000000000014;
          break;
        case 2:
          unint64_t v8 = 0xE500000000000000;
          unint64_t v7 = 0x726568746FLL;
          break;
        case 3:
          unint64_t v8 = 0xE400000000000000;
          unint64_t v7 = 1701736302;
          break;
        default:
          break;
      }
      unint64_t v9 = 0xD000000000000016;
      unint64_t v10 = 0x8000000220188300;
      switch(v6)
      {
        case 1:
          unint64_t v10 = 0x8000000220188320;
          if (v7 == 0xD000000000000014) {
            goto LABEL_14;
          }
          goto LABEL_15;
        case 2:
          unint64_t v10 = 0xE500000000000000;
          unint64_t v9 = 0x726568746FLL;
          goto LABEL_11;
        case 3:
          unint64_t v10 = 0xE400000000000000;
          if (v7 == 1701736302) {
            goto LABEL_14;
          }
          goto LABEL_15;
        default:
LABEL_11:
          if (v7 != v9) {
            goto LABEL_15;
          }
LABEL_14:
          if (v8 == v10)
          {
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            return v4;
          }
LABEL_15:
          char v11 = sub_220182910();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if (v11) {
            return v4;
          }
          unint64_t v4 = (v4 + 1) & v5;
          if (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) == 0) {
            return v4;
          }
          break;
      }
    }
  }
  return v4;
}

unint64_t sub_22017A680(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t result = a2 & ~v5;
  if ((*(void *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result))
  {
    uint64_t v7 = *(void *)(v2 + 48);
    if (*(void *)(v7 + 8 * result) != a1)
    {
      uint64_t v8 = ~v5;
      for (unint64_t result = (result + 1) & v8;
            ((*(void *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            unint64_t result = (result + 1) & v8)
      {
        if (*(void *)(v7 + 8 * result) == a1) {
          break;
        }
      }
    }
  }
  return result;
}

unint64_t sub_22017A71C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    unint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_220182910() & 1) == 0)
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
      while (!v14 && (sub_220182910() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_22017A800(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F0A9C8);
  char v39 = a2;
  uint64_t v6 = sub_220182890();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_42;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v38 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  int64_t v37 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v17 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v18 = v17 | (v13 << 6);
      goto LABEL_22;
    }
    int64_t v19 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_43:
      __break(1u);
LABEL_44:
      __break(1u);
      return result;
    }
    if (v19 >= v37) {
      break;
    }
    char v20 = (void *)(v5 + 64);
    unint64_t v21 = *(void *)(v38 + 8 * v19);
    ++v13;
    if (!v21)
    {
      int64_t v13 = v19 + 1;
      if (v19 + 1 >= v37) {
        goto LABEL_35;
      }
      unint64_t v21 = *(void *)(v38 + 8 * v13);
      if (!v21)
      {
        int64_t v22 = v19 + 2;
        if (v22 >= v37)
        {
LABEL_35:
          swift_release();
          if ((v39 & 1) == 0) {
            goto LABEL_42;
          }
          goto LABEL_38;
        }
        unint64_t v21 = *(void *)(v38 + 8 * v22);
        if (!v21)
        {
          while (1)
          {
            int64_t v13 = v22 + 1;
            if (__OFADD__(v22, 1)) {
              goto LABEL_44;
            }
            if (v13 >= v37) {
              goto LABEL_35;
            }
            unint64_t v21 = *(void *)(v38 + 8 * v13);
            ++v22;
            if (v21) {
              goto LABEL_21;
            }
          }
        }
        int64_t v13 = v22;
      }
    }
LABEL_21:
    unint64_t v10 = (v21 - 1) & v21;
    unint64_t v18 = __clz(__rbit64(v21)) + (v13 << 6);
LABEL_22:
    uint64_t v23 = *(void *)(v5 + 48) + 24 * v18;
    long long v40 = *(_OWORD *)v23;
    uint64_t v24 = *(void *)(v23 + 16);
    unint64_t v25 = *(void **)(*(void *)(v5 + 56) + 8 * v18);
    if ((v39 & 1) == 0)
    {
      id v26 = (id)v40;
      id v27 = v25;
    }
    sub_2201829B0();
    sub_2201829D0();
    if ((void)v40)
    {
      id v28 = (id)v40;
      sub_2201826A0();
    }
    sub_2201829E0();
    sub_2201829E0();
    uint64_t result = sub_220182A00();
    uint64_t v29 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v30 = result & ~v29;
    unint64_t v31 = v30 >> 6;
    if (((-1 << v30) & ~*(void *)(v11 + 8 * (v30 >> 6))) != 0)
    {
      unint64_t v14 = __clz(__rbit64((-1 << v30) & ~*(void *)(v11 + 8 * (v30 >> 6)))) | v30 & 0x7FFFFFFFFFFFFFC0;
      long long v15 = v40;
    }
    else
    {
      char v32 = 0;
      unint64_t v33 = (unint64_t)(63 - v29) >> 6;
      long long v15 = v40;
      do
      {
        if (++v31 == v33 && (v32 & 1) != 0)
        {
          __break(1u);
          goto LABEL_43;
        }
        BOOL v34 = v31 == v33;
        if (v31 == v33) {
          unint64_t v31 = 0;
        }
        v32 |= v34;
        uint64_t v35 = *(void *)(v11 + 8 * v31);
      }
      while (v35 == -1);
      unint64_t v14 = __clz(__rbit64(~v35)) + (v31 << 6);
    }
    *(void *)(v11 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
    uint64_t v16 = *(void *)(v7 + 48) + 24 * v14;
    *(_OWORD *)uint64_t v16 = v15;
    *(void *)(v16 + 16) = v24;
    *(void *)(*(void *)(v7 + 56) + 8 * v14) = v25;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  char v20 = (void *)(v5 + 64);
  if ((v39 & 1) == 0) {
    goto LABEL_42;
  }
LABEL_38:
  uint64_t v36 = 1 << *(unsigned char *)(v5 + 32);
  if (v36 >= 64) {
    bzero(v20, ((unint64_t)(v36 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *char v20 = -1 << v36;
  }
  *(void *)(v5 + 16) = 0;
LABEL_42:
  uint64_t result = swift_release();
  uint64_t *v3 = v7;
  return result;
}

uint64_t sub_22017AB7C(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F0A9E0);
  char v34 = a2;
  uint64_t v6 = sub_220182890();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v33 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  int64_t v32 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  swift_retain();
  int64_t v12 = 0;
LABEL_8:
  if (v10)
  {
    unint64_t v14 = __clz(__rbit64(v10));
    v10 &= v10 - 1;
    unint64_t v15 = v14 | (v12 << 6);
    goto LABEL_22;
  }
  int64_t v16 = v12 + 1;
  if (__OFADD__(v12, 1)) {
    goto LABEL_41;
  }
  if (v16 >= v32)
  {
    swift_release();
    unint64_t v17 = (void *)(v5 + 64);
    if (v34)
    {
LABEL_36:
      uint64_t v30 = 1 << *(unsigned char *)(v5 + 32);
      if (v30 >= 64) {
        bzero(v17, ((unint64_t)(v30 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
      }
      else {
        void *v17 = -1 << v30;
      }
      *(void *)(v5 + 16) = 0;
    }
  }
  else
  {
    unint64_t v17 = (void *)(v5 + 64);
    unint64_t v18 = *(void *)(v33 + 8 * v16);
    ++v12;
    if (v18) {
      goto LABEL_21;
    }
    int64_t v12 = v16 + 1;
    if (v16 + 1 >= v32) {
      goto LABEL_33;
    }
    unint64_t v18 = *(void *)(v33 + 8 * v12);
    if (v18)
    {
LABEL_21:
      unint64_t v10 = (v18 - 1) & v18;
      unint64_t v15 = __clz(__rbit64(v18)) + (v12 << 6);
LABEL_22:
      char v20 = *(unsigned char *)(*(void *)(v5 + 48) + v15);
      uint64_t v21 = *(void *)(*(void *)(v5 + 56) + 8 * v15);
      if ((v34 & 1) == 0) {
        swift_bridgeObjectRetain();
      }
      sub_2201829B0();
      sub_220182490();
      swift_bridgeObjectRelease();
      uint64_t v22 = sub_220182A00();
      uint64_t v23 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v24 = v22 & ~v23;
      unint64_t v25 = v24 >> 6;
      if (((-1 << v24) & ~*(void *)(v11 + 8 * (v24 >> 6))) != 0)
      {
        unint64_t v13 = __clz(__rbit64((-1 << v24) & ~*(void *)(v11 + 8 * (v24 >> 6)))) | v24 & 0x7FFFFFFFFFFFFFC0;
        goto LABEL_7;
      }
      char v26 = 0;
      unint64_t v27 = (unint64_t)(63 - v23) >> 6;
      while (++v25 != v27 || (v26 & 1) == 0)
      {
        BOOL v28 = v25 == v27;
        if (v25 == v27) {
          unint64_t v25 = 0;
        }
        v26 |= v28;
        uint64_t v29 = *(void *)(v11 + 8 * v25);
        if (v29 != -1)
        {
          unint64_t v13 = __clz(__rbit64(~v29)) + (v25 << 6);
LABEL_7:
          *(void *)(v11 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
          *(unsigned char *)(*(void *)(v7 + 48) + v13) = v20;
          *(void *)(*(void *)(v7 + 56) + 8 * v13) = v21;
          ++*(void *)(v7 + 16);
          goto LABEL_8;
        }
      }
      __break(1u);
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      JUMPOUT(0x22017AF08);
    }
    int64_t v19 = v16 + 2;
    if (v19 < v32)
    {
      unint64_t v18 = *(void *)(v33 + 8 * v19);
      if (!v18)
      {
        while (1)
        {
          int64_t v12 = v19 + 1;
          if (__OFADD__(v19, 1)) {
            goto LABEL_42;
          }
          if (v12 >= v32) {
            goto LABEL_33;
          }
          unint64_t v18 = *(void *)(v33 + 8 * v12);
          ++v19;
          if (v18) {
            goto LABEL_21;
          }
        }
      }
      int64_t v12 = v19;
      goto LABEL_21;
    }
LABEL_33:
    swift_release();
    if (v34) {
      goto LABEL_36;
    }
  }
LABEL_40:
  uint64_t result = swift_release();
  uint64_t *v3 = v7;
  return result;
}

uint64_t sub_22017AF18(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F0A9D0);
  char v38 = a2;
  uint64_t v6 = sub_220182890();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_42;
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
  int64_t v36 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v17 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v18 = v17 | (v13 << 6);
      goto LABEL_22;
    }
    int64_t v19 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_43:
      __break(1u);
LABEL_44:
      __break(1u);
      return result;
    }
    if (v19 >= v36) {
      break;
    }
    char v20 = (void *)(v5 + 64);
    unint64_t v21 = *(void *)(v37 + 8 * v19);
    ++v13;
    if (!v21)
    {
      int64_t v13 = v19 + 1;
      if (v19 + 1 >= v36) {
        goto LABEL_35;
      }
      unint64_t v21 = *(void *)(v37 + 8 * v13);
      if (!v21)
      {
        int64_t v22 = v19 + 2;
        if (v22 >= v36)
        {
LABEL_35:
          swift_release();
          if ((v38 & 1) == 0) {
            goto LABEL_42;
          }
          goto LABEL_38;
        }
        unint64_t v21 = *(void *)(v37 + 8 * v22);
        if (!v21)
        {
          while (1)
          {
            int64_t v13 = v22 + 1;
            if (__OFADD__(v22, 1)) {
              goto LABEL_44;
            }
            if (v13 >= v36) {
              goto LABEL_35;
            }
            unint64_t v21 = *(void *)(v37 + 8 * v13);
            ++v22;
            if (v21) {
              goto LABEL_21;
            }
          }
        }
        int64_t v13 = v22;
      }
    }
LABEL_21:
    unint64_t v10 = (v21 - 1) & v21;
    unint64_t v18 = __clz(__rbit64(v21)) + (v13 << 6);
LABEL_22:
    uint64_t v23 = *(void *)(v5 + 48) + 24 * v18;
    uint64_t v24 = *(void *)(v23 + 16);
    long long v39 = *(_OWORD *)(*(void *)(v5 + 56) + 16 * v18);
    long long v40 = *(_OWORD *)v23;
    if ((v38 & 1) == 0)
    {
      id v25 = (id)v40;
      swift_retain();
      id v26 = *((id *)&v39 + 1);
    }
    sub_2201829B0();
    sub_2201829D0();
    if ((void)v40)
    {
      id v27 = (id)v40;
      sub_2201826A0();
    }
    sub_2201829E0();
    sub_2201829E0();
    uint64_t result = sub_220182A00();
    uint64_t v28 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v29 = result & ~v28;
    unint64_t v30 = v29 >> 6;
    if (((-1 << v29) & ~*(void *)(v11 + 8 * (v29 >> 6))) != 0)
    {
      unint64_t v14 = __clz(__rbit64((-1 << v29) & ~*(void *)(v11 + 8 * (v29 >> 6)))) | v29 & 0x7FFFFFFFFFFFFFC0;
      long long v15 = v40;
    }
    else
    {
      char v31 = 0;
      unint64_t v32 = (unint64_t)(63 - v28) >> 6;
      long long v15 = v40;
      do
      {
        if (++v30 == v32 && (v31 & 1) != 0)
        {
          __break(1u);
          goto LABEL_43;
        }
        BOOL v33 = v30 == v32;
        if (v30 == v32) {
          unint64_t v30 = 0;
        }
        v31 |= v33;
        uint64_t v34 = *(void *)(v11 + 8 * v30);
      }
      while (v34 == -1);
      unint64_t v14 = __clz(__rbit64(~v34)) + (v30 << 6);
    }
    *(void *)(v11 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
    uint64_t v16 = *(void *)(v7 + 48) + 24 * v14;
    *(_OWORD *)uint64_t v16 = v15;
    *(void *)(v16 + 16) = v24;
    *(_OWORD *)(*(void *)(v7 + 56) + 16 * v14) = v39;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  char v20 = (void *)(v5 + 64);
  if ((v38 & 1) == 0) {
    goto LABEL_42;
  }
LABEL_38:
  uint64_t v35 = 1 << *(unsigned char *)(v5 + 32);
  if (v35 >= 64) {
    bzero(v20, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *char v20 = -1 << v35;
  }
  *(void *)(v5 + 16) = 0;
LABEL_42:
  uint64_t result = swift_release();
  uint64_t *v3 = v7;
  return result;
}

uint64_t sub_22017B2A8(uint64_t a1, int a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = type metadata accessor for OnboardingDefaults.ShownExperienceRecord();
  uint64_t v37 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v34 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F0ABC0);
  int v38 = a2;
  uint64_t result = sub_220182890();
  uint64_t v10 = result;
  if (*(void *)(v8 + 16))
  {
    uint64_t v34 = v2;
    int64_t v11 = 0;
    uint64_t v12 = *(void *)(v8 + 64);
    int64_t v36 = (void *)(v8 + 64);
    uint64_t v13 = 1 << *(unsigned char *)(v8 + 32);
    if (v13 < 64) {
      uint64_t v14 = ~(-1 << v13);
    }
    else {
      uint64_t v14 = -1;
    }
    unint64_t v15 = v14 & v12;
    int64_t v35 = (unint64_t)(v13 + 63) >> 6;
    uint64_t v16 = result + 64;
    while (1)
    {
      if (v15)
      {
        unint64_t v18 = __clz(__rbit64(v15));
        v15 &= v15 - 1;
        unint64_t v19 = v18 | (v11 << 6);
      }
      else
      {
        int64_t v20 = v11 + 1;
        if (__OFADD__(v11, 1))
        {
LABEL_42:
          __break(1u);
LABEL_43:
          __break(1u);
          return result;
        }
        uint64_t result = (uint64_t)v36;
        if (v20 >= v35) {
          goto LABEL_34;
        }
        unint64_t v21 = v36[v20];
        ++v11;
        if (!v21)
        {
          int64_t v11 = v20 + 1;
          if (v20 + 1 >= v35) {
            goto LABEL_34;
          }
          unint64_t v21 = v36[v11];
          if (!v21)
          {
            int64_t v22 = v20 + 2;
            if (v22 >= v35)
            {
LABEL_34:
              if ((v38 & 1) == 0)
              {
                uint64_t result = swift_release();
                uint64_t v3 = v34;
                goto LABEL_41;
              }
              uint64_t v33 = 1 << *(unsigned char *)(v8 + 32);
              if (v33 >= 64) {
                bzero(v36, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              }
              else {
                void *v36 = -1 << v33;
              }
              uint64_t v3 = v34;
              *(void *)(v8 + 16) = 0;
              break;
            }
            unint64_t v21 = v36[v22];
            if (!v21)
            {
              while (1)
              {
                int64_t v11 = v22 + 1;
                if (__OFADD__(v22, 1)) {
                  goto LABEL_43;
                }
                if (v11 >= v35) {
                  goto LABEL_34;
                }
                unint64_t v21 = v36[v11];
                ++v22;
                if (v21) {
                  goto LABEL_21;
                }
              }
            }
            int64_t v11 = v22;
          }
        }
LABEL_21:
        unint64_t v15 = (v21 - 1) & v21;
        unint64_t v19 = __clz(__rbit64(v21)) + (v11 << 6);
      }
      uint64_t v23 = *(void *)(*(void *)(v8 + 48) + 8 * v19);
      uint64_t v24 = *(void *)(v37 + 72);
      uint64_t v25 = *(void *)(v8 + 56) + v24 * v19;
      if (v38) {
        sub_220180548(v25, (uint64_t)v7);
      }
      else {
        sub_22018060C(v25, (uint64_t)v7, (uint64_t (*)(void))type metadata accessor for OnboardingDefaults.ShownExperienceRecord);
      }
      sub_2201829B0();
      sub_2201829C0();
      uint64_t result = sub_220182A00();
      uint64_t v26 = -1 << *(unsigned char *)(v10 + 32);
      unint64_t v27 = result & ~v26;
      unint64_t v28 = v27 >> 6;
      if (((-1 << v27) & ~*(void *)(v16 + 8 * (v27 >> 6))) != 0)
      {
        unint64_t v17 = __clz(__rbit64((-1 << v27) & ~*(void *)(v16 + 8 * (v27 >> 6)))) | v27 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v29 = 0;
        unint64_t v30 = (unint64_t)(63 - v26) >> 6;
        do
        {
          if (++v28 == v30 && (v29 & 1) != 0)
          {
            __break(1u);
            goto LABEL_42;
          }
          BOOL v31 = v28 == v30;
          if (v28 == v30) {
            unint64_t v28 = 0;
          }
          v29 |= v31;
          uint64_t v32 = *(void *)(v16 + 8 * v28);
        }
        while (v32 == -1);
        unint64_t v17 = __clz(__rbit64(~v32)) + (v28 << 6);
      }
      *(void *)(v16 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
      *(void *)(*(void *)(v10 + 48) + 8 * v17) = v23;
      uint64_t result = sub_220180548((uint64_t)v7, *(void *)(v10 + 56) + v24 * v17);
      ++*(void *)(v10 + 16);
    }
  }
  uint64_t result = swift_release();
LABEL_41:
  uint64_t *v3 = v10;
  return result;
}

uint64_t sub_22017B624(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F0ABC8);
  char v38 = a2;
  uint64_t v6 = sub_220182890();
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
  int64_t v35 = v2;
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
    int64_t v22 = (void *)(v5 + 64);
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
    char v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v20);
    uint64_t v31 = *v29;
    uint64_t v30 = v29[1];
    uint64_t v32 = *(void **)(*(void *)(v5 + 56) + 8 * v20);
    if ((v38 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      id v33 = v32;
    }
    sub_2201829B0();
    sub_220182490();
    uint64_t result = sub_220182A00();
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
    unint64_t v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    *unint64_t v18 = v31;
    v18[1] = v30;
    *(void *)(*(void *)(v7 + 56) + 8 * v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v35;
  int64_t v22 = (void *)(v5 + 64);
  if ((v38 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v34 = 1 << *(unsigned char *)(v5 + 32);
  if (v34 >= 64) {
    bzero(v22, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *int64_t v22 = -1 << v34;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  uint64_t *v3 = v7;
  return result;
}

uint64_t sub_22017B934(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267F0ABF0);
  char v37 = a2;
  uint64_t v6 = sub_220182890();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
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
  uint64_t v34 = v2;
  int64_t v35 = (unint64_t)(v8 + 63) >> 6;
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
    if (v21 >= v35) {
      break;
    }
    int64_t v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v36 + 8 * v21);
    ++v13;
    if (!v23)
    {
      int64_t v13 = v21 + 1;
      if (v21 + 1 >= v35) {
        goto LABEL_33;
      }
      unint64_t v23 = *(void *)(v36 + 8 * v13);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v35)
        {
LABEL_33:
          swift_release();
          uint64_t v3 = v34;
          if ((v37 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v23 = *(void *)(v36 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v13 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v35) {
              goto LABEL_33;
            }
            unint64_t v23 = *(void *)(v36 + 8 * v13);
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
    char v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v20);
    uint64_t v31 = *v29;
    uint64_t v30 = v29[1];
    uint64_t v32 = *(void *)(*(void *)(v5 + 56) + 8 * v20);
    if ((v37 & 1) == 0) {
      swift_bridgeObjectRetain();
    }
    sub_2201829B0();
    sub_220182490();
    uint64_t result = sub_220182A00();
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
    unint64_t v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    *unint64_t v18 = v31;
    v18[1] = v30;
    *(void *)(*(void *)(v7 + 56) + 8 * v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v34;
  int64_t v22 = (void *)(v5 + 64);
  if ((v37 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v33 = 1 << *(unsigned char *)(v5 + 32);
  if (v33 >= 64) {
    bzero(v22, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *int64_t v22 = -1 << v33;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  uint64_t *v3 = v7;
  return result;
}

uint64_t sub_22017BC40(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F0ABE8);
  uint64_t v6 = sub_220182890();
  uint64_t v7 = v6;
  if (*(void *)(v5 + 16))
  {
    uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
    uint64_t v34 = (void *)(v5 + 64);
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
                  void *v34 = -1 << v32;
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
      int64_t v21 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v17);
      uint64_t v23 = *v21;
      uint64_t v22 = v21[1];
      int64_t v24 = (_OWORD *)(*(void *)(v5 + 56) + 32 * v17);
      if (a2)
      {
        sub_22017285C(v24, v35);
      }
      else
      {
        sub_2201497B0((uint64_t)v24, (uint64_t)v35);
        swift_bridgeObjectRetain();
      }
      sub_2201829B0();
      sub_220182490();
      uint64_t result = sub_220182A00();
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
      void *v15 = v23;
      v15[1] = v22;
      uint64_t result = (uint64_t)sub_22017285C(v35, (_OWORD *)(*(void *)(v7 + 56) + 32 * v14));
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
  uint64_t *v3 = v7;
  return result;
}

uint64_t sub_22017BF40(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F0ABE0);
  char v36 = a2;
  uint64_t v6 = sub_220182890();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v35 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  int64_t v34 = (unint64_t)(v8 + 63) >> 6;
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
    if (v21 >= v34) {
      break;
    }
    uint64_t v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v35 + 8 * v21);
    ++v13;
    if (!v23)
    {
      int64_t v13 = v21 + 1;
      if (v21 + 1 >= v34) {
        goto LABEL_33;
      }
      unint64_t v23 = *(void *)(v35 + 8 * v13);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v34)
        {
LABEL_33:
          swift_release();
          if ((v36 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v23 = *(void *)(v35 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v13 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v34) {
              goto LABEL_33;
            }
            unint64_t v23 = *(void *)(v35 + 8 * v13);
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
    uint64_t v32 = *(void *)(*(void *)(v5 + 56) + 8 * v20);
    if ((v36 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    sub_2201829B0();
    sub_220182490();
    uint64_t result = sub_220182A00();
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
    int64_t v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    *int64_t v18 = v31;
    v18[1] = v30;
    *(void *)(*(void *)(v7 + 56) + 8 * v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v22 = (void *)(v5 + 64);
  if ((v36 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v33 = 1 << *(unsigned char *)(v5 + 32);
  if (v33 >= 64) {
    bzero(v22, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v22 = -1 << v33;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  uint64_t *v3 = v7;
  return result;
}

unint64_t sub_22017C258(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_2201826F0();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      while (1)
      {
        sub_2201829B0();
        sub_2201829C0();
        uint64_t result = sub_220182A00();
        unint64_t v9 = result & v7;
        if (v3 >= (uint64_t)v8) {
          break;
        }
        if (v9 < v8) {
          goto LABEL_11;
        }
LABEL_12:
        uint64_t v10 = *(void *)(a2 + 48);
        uint64_t v11 = (void *)(v10 + 8 * v3);
        uint64_t v12 = (void *)(v10 + 8 * v6);
        if (v3 != v6 || v11 >= v12 + 1) {
          void *v11 = *v12;
        }
        uint64_t v13 = *(void *)(a2 + 56);
        uint64_t v14 = *(void *)(*(void *)(type metadata accessor for OnboardingDefaults.ShownExperienceRecord() - 8) + 72);
        int64_t v15 = v14 * v3;
        uint64_t result = v13 + v14 * v3;
        int64_t v16 = v14 * v6;
        unint64_t v17 = v13 + v14 * v6 + v14;
        if (v15 < v16 || result >= v17)
        {
          uint64_t result = swift_arrayInitWithTakeFrontToBack();
        }
        else
        {
          int64_t v3 = v6;
          if (v15 == v16) {
            goto LABEL_6;
          }
          uint64_t result = swift_arrayInitWithTakeBackToFront();
        }
        int64_t v3 = v6;
LABEL_6:
        unint64_t v6 = (v6 + 1) & v7;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          goto LABEL_21;
        }
      }
      if (v9 < v8) {
        goto LABEL_6;
      }
LABEL_11:
      if (v3 < (uint64_t)v9) {
        goto LABEL_6;
      }
      goto LABEL_12;
    }
LABEL_21:
    unint64_t v19 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v20 = *v19;
    uint64_t v21 = (-1 << v3) - 1;
  }
  else
  {
    unint64_t v19 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v21 = *v19;
    uint64_t v20 = (-1 << result) - 1;
  }
  uint64_t *v19 = v21 & v20;
  uint64_t v22 = *(void *)(a2 + 16);
  BOOL v23 = __OFSUB__(v22, 1);
  uint64_t v24 = v22 - 1;
  if (v23)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v24;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

void sub_22017C44C(uint64_t a1, void *a2, char a3, double a4, double a5)
{
  unint64_t v6 = (void **)v5;
  uint64_t v11 = (void *)*v5;
  unint64_t v13 = sub_22017A08C(a2, a4, a5);
  uint64_t v14 = v11[2];
  BOOL v15 = (v12 & 1) == 0;
  uint64_t v16 = v14 + v15;
  if (__OFADD__(v14, v15))
  {
    __break(1u);
    goto LABEL_15;
  }
  char v17 = v12;
  uint64_t v18 = v11[3];
  if (v18 >= v16 && (a3 & 1) != 0)
  {
LABEL_7:
    unint64_t v19 = *v6;
    if (v17)
    {
LABEL_8:
      uint64_t v20 = v19[7];

      *(void *)(v20 + 8 * v13) = a1;
      return;
    }
    goto LABEL_11;
  }
  if (v18 >= v16 && (a3 & 1) == 0)
  {
    sub_22017CE28();
    goto LABEL_7;
  }
  sub_22017A800(v16, a3 & 1);
  unint64_t v21 = sub_22017A08C(a2, a4, a5);
  if ((v17 & 1) != (v22 & 1))
  {
LABEL_15:
    sub_220182940();
    __break(1u);
    return;
  }
  unint64_t v13 = v21;
  unint64_t v19 = *v6;
  if (v17) {
    goto LABEL_8;
  }
LABEL_11:
  sub_22017CC84(v13, (uint64_t)a2, a1, v19, a4, a5);

  id v23 = a2;
}

id sub_22017C5A0(uint64_t a1, uint64_t a2, void *a3, char a4, double a5, double a6)
{
  uint64_t v7 = (void **)v6;
  unint64_t v13 = (void *)*v6;
  unint64_t v15 = sub_22017A08C(a3, a5, a6);
  uint64_t v16 = v13[2];
  BOOL v17 = (v14 & 1) == 0;
  uint64_t v18 = v16 + v17;
  if (__OFADD__(v16, v17))
  {
    __break(1u);
    goto LABEL_15;
  }
  char v19 = v14;
  uint64_t v20 = v13[3];
  if (v20 >= v18 && (a4 & 1) != 0)
  {
LABEL_7:
    unint64_t v21 = *v7;
    if (v19)
    {
LABEL_8:
      uint64_t v22 = v21[7] + 16 * v15;

      id result = (id)swift_release();
      *(void *)uint64_t v22 = a1;
      *(void *)(v22 + 8) = a2;
      return result;
    }
    goto LABEL_11;
  }
  if (v20 >= v18 && (a4 & 1) == 0)
  {
    sub_22017D18C();
    goto LABEL_7;
  }
  sub_22017AF18(v18, a4 & 1);
  unint64_t v24 = sub_22017A08C(a3, a5, a6);
  if ((v19 & 1) != (v25 & 1))
  {
LABEL_15:
    id result = (id)sub_220182940();
    __break(1u);
    return result;
  }
  unint64_t v15 = v24;
  unint64_t v21 = *v7;
  if (v19) {
    goto LABEL_8;
  }
LABEL_11:
  sub_22017CCD4(v15, (uint64_t)a3, a1, a2, v21, a5, a6);

  return a3;
}

uint64_t sub_22017C710(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v4 = (void **)v3;
  unint64_t v8 = (void *)*v3;
  unint64_t v10 = sub_22017A25C(a2);
  uint64_t v11 = v8[2];
  BOOL v12 = (v9 & 1) == 0;
  uint64_t v13 = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
    goto LABEL_17;
  }
  char v14 = v9;
  uint64_t v15 = v8[3];
  if (v15 < v13 || (a3 & 1) == 0)
  {
    if (v15 >= v13 && (a3 & 1) == 0)
    {
      sub_22017D36C();
      goto LABEL_7;
    }
    sub_22017B2A8(v13, a3 & 1);
    unint64_t v20 = sub_22017A25C(a2);
    if ((v14 & 1) == (v21 & 1))
    {
      unint64_t v10 = v20;
      uint64_t v16 = *v4;
      if (v14) {
        goto LABEL_8;
      }
      goto LABEL_13;
    }
LABEL_17:
    type metadata accessor for NotificationOnboardingExperience(0);
    uint64_t result = sub_220182940();
    __break(1u);
    return result;
  }
LABEL_7:
  uint64_t v16 = *v4;
  if (v14)
  {
LABEL_8:
    uint64_t v17 = v16[7];
    uint64_t v18 = v17
        + *(void *)(*(void *)(type metadata accessor for OnboardingDefaults.ShownExperienceRecord() - 8) + 72)
        * v10;
    return sub_2201806E4(a1, v18);
  }
LABEL_13:

  return sub_22017CD28(v10, a2, a1, v16);
}

uint64_t sub_22017C85C(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = *v4;
  unint64_t v12 = sub_22017A2C8(a2, a3);
  uint64_t v13 = *(void *)(v10 + 16);
  BOOL v14 = (v11 & 1) == 0;
  uint64_t result = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v16 = v11;
  uint64_t v17 = *(void *)(v10 + 24);
  if (v17 >= result && (a4 & 1) != 0) {
    goto LABEL_7;
  }
  if (v17 >= result && (a4 & 1) == 0)
  {
    uint64_t result = (uint64_t)sub_22017D788();
LABEL_7:
    uint64_t v18 = (void *)*v5;
    if (v16)
    {
LABEL_8:
      *(void *)(v18[7] + 8 * v12) = a1;
      return result;
    }
    goto LABEL_11;
  }
  sub_22017B934(result, a4 & 1);
  uint64_t result = sub_22017A2C8(a2, a3);
  if ((v16 & 1) != (v19 & 1))
  {
LABEL_17:
    uint64_t result = sub_220182940();
    __break(1u);
    return result;
  }
  unint64_t v12 = result;
  uint64_t v18 = (void *)*v5;
  if (v16) {
    goto LABEL_8;
  }
LABEL_11:
  v18[(v12 >> 6) + 8] |= 1 << v12;
  unint64_t v20 = (uint64_t *)(v18[6] + 16 * v12);
  *unint64_t v20 = a2;
  v20[1] = a3;
  *(void *)(v18[7] + 8 * v12) = a1;
  uint64_t v21 = v18[2];
  BOOL v22 = __OFADD__(v21, 1);
  uint64_t v23 = v21 + 1;
  if (v22)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v18[2] = v23;

  return swift_bridgeObjectRetain();
}

_OWORD *sub_22017C9C0(_OWORD *a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = (void **)v4;
  uint64_t v10 = (void *)*v4;
  unint64_t v12 = sub_22017A2C8(a2, a3);
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
      sub_22017D938();
      goto LABEL_7;
    }
    sub_22017BC40(v15, a4 & 1);
    unint64_t v21 = sub_22017A2C8(a2, a3);
    if ((v16 & 1) == (v22 & 1))
    {
      unint64_t v12 = v21;
      uint64_t v18 = *v5;
      if (v16) {
        goto LABEL_8;
      }
      goto LABEL_13;
    }
LABEL_17:
    uint64_t result = (_OWORD *)sub_220182940();
    __break(1u);
    return result;
  }
LABEL_7:
  uint64_t v18 = *v5;
  if (v16)
  {
LABEL_8:
    char v19 = (_OWORD *)(v18[7] + 32 * v12);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v19);
    return sub_22017285C(a1, v19);
  }
LABEL_13:
  sub_22017CDBC(v12, a2, a3, a1, v18);

  return (_OWORD *)swift_bridgeObjectRetain();
}

uint64_t sub_22017CB14(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = *v4;
  unint64_t v12 = sub_22017A2C8(a2, a3);
  uint64_t v13 = *(void *)(v10 + 16);
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v16 = v11;
  uint64_t v17 = *(void *)(v10 + 24);
  if (v17 >= v15 && (a4 & 1) != 0) {
    goto LABEL_7;
  }
  if (v17 >= v15 && (a4 & 1) == 0)
  {
    sub_22017DB20();
LABEL_7:
    uint64_t v18 = (void *)*v5;
    if (v16)
    {
LABEL_8:
      uint64_t v19 = v18[7];
      uint64_t result = swift_bridgeObjectRelease();
      *(void *)(v19 + 8 * v12) = a1;
      return result;
    }
    goto LABEL_11;
  }
  sub_22017BF40(v15, a4 & 1);
  unint64_t v21 = sub_22017A2C8(a2, a3);
  if ((v16 & 1) != (v22 & 1))
  {
LABEL_17:
    uint64_t result = sub_220182940();
    __break(1u);
    return result;
  }
  unint64_t v12 = v21;
  uint64_t v18 = (void *)*v5;
  if (v16) {
    goto LABEL_8;
  }
LABEL_11:
  v18[(v12 >> 6) + 8] |= 1 << v12;
  uint64_t v23 = (uint64_t *)(v18[6] + 16 * v12);
  *uint64_t v23 = a2;
  v23[1] = a3;
  *(void *)(v18[7] + 8 * v12) = a1;
  uint64_t v24 = v18[2];
  BOOL v25 = __OFADD__(v24, 1);
  uint64_t v26 = v24 + 1;
  if (v25)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v18[2] = v26;

  return swift_bridgeObjectRetain();
}

unint64_t sub_22017CC84(unint64_t result, uint64_t a2, uint64_t a3, void *a4, double a5, double a6)
{
  a4[(result >> 6) + 8] |= 1 << result;
  uint64_t v6 = a4[6] + 24 * result;
  *(void *)uint64_t v6 = a2;
  *(double *)(v6 + 8) = a5;
  *(double *)(v6 + 16) = a6;
  *(void *)(a4[7] + 8 * result) = a3;
  uint64_t v7 = a4[2];
  BOOL v8 = __OFADD__(v7, 1);
  uint64_t v9 = v7 + 1;
  if (v8) {
    __break(1u);
  }
  else {
    a4[2] = v9;
  }
  return result;
}

unint64_t sub_22017CCD4(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, double a6, double a7)
{
  a5[(result >> 6) + 8] |= 1 << result;
  uint64_t v7 = a5[6] + 24 * result;
  *(void *)uint64_t v7 = a2;
  *(double *)(v7 + 8) = a6;
  *(double *)(v7 + 16) = a7;
  BOOL v8 = (void *)(a5[7] + 16 * result);
  *BOOL v8 = a3;
  v8[1] = a4;
  uint64_t v9 = a5[2];
  BOOL v10 = __OFADD__(v9, 1);
  uint64_t v11 = v9 + 1;
  if (v10) {
    __break(1u);
  }
  else {
    a5[2] = v11;
  }
  return result;
}

uint64_t sub_22017CD28(unint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  *(void *)(a4[6] + 8 * a1) = a2;
  uint64_t v7 = a4[7];
  uint64_t v8 = type metadata accessor for OnboardingDefaults.ShownExperienceRecord();
  uint64_t result = sub_220180548(a3, v7 + *(void *)(*(void *)(v8 - 8) + 72) * a1);
  uint64_t v10 = a4[2];
  BOOL v11 = __OFADD__(v10, 1);
  uint64_t v12 = v10 + 1;
  if (v11) {
    __break(1u);
  }
  else {
    a4[2] = v12;
  }
  return result;
}

_OWORD *sub_22017CDBC(unint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4, void *a5)
{
  a5[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v6 = (void *)(a5[6] + 16 * a1);
  *uint64_t v6 = a2;
  v6[1] = a3;
  uint64_t result = sub_22017285C(a4, (_OWORD *)(a5[7] + 32 * a1));
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

id sub_22017CE28()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F0A9C8);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_220182880();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (id)swift_release();
    uint64_t *v1 = v4;
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
    int64_t v24 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v24 >= v13) {
      goto LABEL_26;
    }
    unint64_t v25 = *(void *)(v6 + 8 * v24);
    ++v9;
    if (!v25)
    {
      int64_t v9 = v24 + 1;
      if (v24 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v25 = *(void *)(v6 + 8 * v9);
      if (!v25) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v25 - 1) & v25;
    unint64_t v15 = __clz(__rbit64(v25)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 24 * v15;
    uint64_t v17 = *(void *)(v2 + 48) + 24 * v15;
    uint64_t v18 = *(void **)v17;
    uint64_t v19 = 8 * v15;
    unint64_t v20 = *(void **)(*(void *)(v2 + 56) + v19);
    uint64_t v21 = *(void *)(v4 + 48) + v16;
    long long v22 = *(_OWORD *)(v17 + 8);
    *(void *)uint64_t v21 = *(void *)v17;
    *(_OWORD *)(v21 + 8) = v22;
    *(void *)(*(void *)(v4 + 56) + v19) = v20;
    id v23 = v18;
    id result = v20;
  }
  int64_t v26 = v24 + 2;
  if (v26 >= v13) {
    goto LABEL_26;
  }
  unint64_t v25 = *(void *)(v6 + 8 * v26);
  if (v25)
  {
    int64_t v9 = v26;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v26 + 1;
    if (__OFADD__(v26, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v25 = *(void *)(v6 + 8 * v9);
    ++v26;
    if (v25) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_22017CFE8()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F0A9E0);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_220182880();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (void *)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  id result = (void *)(v3 + 64);
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
    int64_t v17 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v17 >= v13) {
      goto LABEL_26;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    ++v9;
    if (!v18)
    {
      int64_t v9 = v17 + 1;
      if (v17 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v18 = *(void *)(v6 + 8 * v9);
      if (!v18) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v18 - 1) & v18;
    unint64_t v15 = __clz(__rbit64(v18)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = *(void *)(*(void *)(v2 + 56) + 8 * v15);
    *(unsigned char *)(*(void *)(v4 + 48) + v15) = *(unsigned char *)(*(void *)(v2 + 48) + v15);
    *(void *)(*(void *)(v4 + 56) + 8 * v15) = v16;
    id result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v19 = v17 + 2;
  if (v19 >= v13) {
    goto LABEL_26;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18)
  {
    int64_t v9 = v19;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v9);
    ++v19;
    if (v18) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

id sub_22017D18C()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F0A9D0);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_220182880();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (id)swift_release();
    uint64_t *v1 = v4;
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
    int64_t v23 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v23 >= v13) {
      goto LABEL_26;
    }
    unint64_t v24 = *(void *)(v6 + 8 * v23);
    ++v9;
    if (!v24)
    {
      int64_t v9 = v23 + 1;
      if (v23 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v24 = *(void *)(v6 + 8 * v9);
      if (!v24) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v24 - 1) & v24;
    unint64_t v15 = __clz(__rbit64(v24)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 24 * v15;
    uint64_t v17 = *(void *)(v2 + 48) + 24 * v15;
    unint64_t v18 = *(void **)v17;
    uint64_t v19 = 16 * v15;
    uint64_t v20 = *(void *)(v4 + 48) + v16;
    long long v26 = *(_OWORD *)(*(void *)(v2 + 56) + v19);
    long long v21 = *(_OWORD *)(v17 + 8);
    *(void *)uint64_t v20 = *(void *)v17;
    *(_OWORD *)(v20 + 8) = v21;
    *(_OWORD *)(*(void *)(v4 + 56) + v19) = v26;
    id v22 = v18;
    swift_retain();
    id result = *((id *)&v26 + 1);
  }
  int64_t v25 = v23 + 2;
  if (v25 >= v13) {
    goto LABEL_26;
  }
  unint64_t v24 = *(void *)(v6 + 8 * v25);
  if (v24)
  {
    int64_t v9 = v25;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v25 + 1;
    if (__OFADD__(v25, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v24 = *(void *)(v6 + 8 * v9);
    ++v25;
    if (v24) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_22017D36C()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for OnboardingDefaults.ShownExperienceRecord();
  uint64_t v25 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v24 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F0ABC0);
  uint64_t v5 = *v0;
  uint64_t v6 = sub_220182880();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16))
  {
    id result = (void *)swift_release();
LABEL_25:
    uint64_t *v1 = v7;
    return result;
  }
  unint64_t v24 = v1;
  id result = (void *)(v6 + 64);
  uint64_t v9 = v5 + 64;
  unint64_t v10 = (unint64_t)((1 << *(unsigned char *)(v7 + 32)) + 63) >> 6;
  if (v7 != v5 || (unint64_t)result >= v9 + 8 * v10) {
    id result = memmove(result, (const void *)(v5 + 64), 8 * v10);
  }
  int64_t v11 = 0;
  *(void *)(v7 + 16) = *(void *)(v5 + 16);
  uint64_t v12 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v13 = -1;
  if (v12 < 64) {
    uint64_t v13 = ~(-1 << v12);
  }
  unint64_t v14 = v13 & *(void *)(v5 + 64);
  int64_t v15 = (unint64_t)(v12 + 63) >> 6;
  while (1)
  {
    if (v14)
    {
      unint64_t v16 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      unint64_t v17 = v16 | (v11 << 6);
      goto LABEL_9;
    }
    int64_t v21 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v21 >= v15) {
      goto LABEL_23;
    }
    unint64_t v22 = *(void *)(v9 + 8 * v21);
    ++v11;
    if (!v22)
    {
      int64_t v11 = v21 + 1;
      if (v21 + 1 >= v15) {
        goto LABEL_23;
      }
      unint64_t v22 = *(void *)(v9 + 8 * v11);
      if (!v22) {
        break;
      }
    }
LABEL_22:
    unint64_t v14 = (v22 - 1) & v22;
    unint64_t v17 = __clz(__rbit64(v22)) + (v11 << 6);
LABEL_9:
    uint64_t v18 = 8 * v17;
    uint64_t v19 = *(void *)(*(void *)(v5 + 48) + 8 * v17);
    unint64_t v20 = *(void *)(v25 + 72) * v17;
    sub_22018060C(*(void *)(v5 + 56) + v20, (uint64_t)v4, (uint64_t (*)(void))type metadata accessor for OnboardingDefaults.ShownExperienceRecord);
    *(void *)(*(void *)(v7 + 48) + v18) = v19;
    id result = (void *)sub_220180548((uint64_t)v4, *(void *)(v7 + 56) + v20);
  }
  int64_t v23 = v21 + 2;
  if (v23 >= v15)
  {
LABEL_23:
    id result = (void *)swift_release();
    uint64_t v1 = v24;
    goto LABEL_25;
  }
  unint64_t v22 = *(void *)(v9 + 8 * v23);
  if (v22)
  {
    int64_t v11 = v23;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v11 = v23 + 1;
    if (__OFADD__(v23, 1)) {
      break;
    }
    if (v11 >= v15) {
      goto LABEL_23;
    }
    unint64_t v22 = *(void *)(v9 + 8 * v11);
    ++v23;
    if (v22) {
      goto LABEL_22;
    }
  }
LABEL_27:
  __break(1u);
  return result;
}

id sub_22017D5D4()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F0ABC8);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_220182880();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (id)swift_release();
    uint64_t *v1 = v4;
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
    unint64_t v17 = (void *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v18 = v17[1];
    uint64_t v19 = 8 * v15;
    unint64_t v20 = *(void **)(*(void *)(v2 + 56) + v19);
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

void *sub_22017D788()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267F0ABF0);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_220182880();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (void *)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  id result = (void *)(v3 + 64);
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
    int64_t v23 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v23 >= v13) {
      goto LABEL_26;
    }
    unint64_t v24 = *(void *)(v6 + 8 * v23);
    ++v9;
    if (!v24)
    {
      int64_t v9 = v23 + 1;
      if (v23 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v24 = *(void *)(v6 + 8 * v9);
      if (!v24) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v24 - 1) & v24;
    unint64_t v15 = __clz(__rbit64(v24)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    unint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    uint64_t v20 = 8 * v15;
    uint64_t v21 = *(void *)(*(void *)(v2 + 56) + v20);
    int64_t v22 = (void *)(*(void *)(v4 + 48) + v16);
    *int64_t v22 = v19;
    v22[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v20) = v21;
    id result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v25 = v23 + 2;
  if (v25 >= v13) {
    goto LABEL_26;
  }
  unint64_t v24 = *(void *)(v6 + 8 * v25);
  if (v24)
  {
    int64_t v9 = v25;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v25 + 1;
    if (__OFADD__(v25, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v24 = *(void *)(v6 + 8 * v9);
    ++v25;
    if (v24) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_22017D938()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F0ABE8);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_220182880();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    id result = (void *)swift_release();
LABEL_28:
    uint64_t *v1 = v4;
    return result;
  }
  int64_t v25 = v1;
  id result = (void *)(v3 + 64);
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
    sub_2201497B0(*(void *)(v2 + 56) + 32 * v15, (uint64_t)v26);
    uint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *uint64_t v21 = v19;
    v21[1] = v18;
    sub_22017285C(v26, (_OWORD *)(*(void *)(v4 + 56) + v20));
    id result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v13)
  {
LABEL_26:
    id result = (void *)swift_release();
    uint64_t v1 = v25;
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

void *sub_22017DB20()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F0ABE0);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_220182880();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (void *)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  id result = (void *)(v3 + 64);
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
    unint64_t v17 = (void *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v18 = v17[1];
    uint64_t v19 = 8 * v15;
    uint64_t v20 = *(void *)(*(void *)(v2 + 56) + v19);
    uint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *uint64_t v21 = *v17;
    v21[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    id result = (void *)swift_bridgeObjectRetain();
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

uint64_t sub_22017DCD8(uint64_t a1, int *a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v5 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v3;
  void *v3 = v2;
  v3[1] = sub_22017DDB8;
  return v5(v2 + 32);
}

uint64_t sub_22017DDB8()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(unsigned char **)(*v0 + 16);
  uint64_t v5 = *v0;
  swift_task_dealloc();
  *uint64_t v2 = *(unsigned char *)(v1 + 32);
  uint64_t v3 = *(uint64_t (**)(void))(v5 + 8);
  return v3();
}

id sub_22017DECC()
{
  id v0 = objc_allocWithZone(MEMORY[0x263EFFA40]);
  swift_bridgeObjectRetain();
  uint64_t v1 = (void *)sub_220182450();
  swift_bridgeObjectRelease();
  id v2 = objc_msgSend(v0, sel_initWithSuiteName_, v1);

  if (!v2)
  {
    if (qword_267F09C80 != -1) {
      swift_once();
    }
    uint64_t v3 = sub_220181C80();
    __swift_project_value_buffer(v3, (uint64_t)qword_267F0C120);
    uint64_t v4 = sub_220181C60();
    os_log_type_t v5 = sub_2201825F0();
    if (os_log_type_enabled(v4, v5))
    {
      uint64_t v6 = (uint8_t *)swift_slowAlloc();
      uint64_t v7 = swift_slowAlloc();
      uint64_t v11 = v7;
      *(_DWORD *)uint64_t v6 = 136446210;
      uint64_t v8 = qword_267F0AA50;
      int64_t v9 = off_267F0AA58;
      swift_bridgeObjectRetain();
      sub_220149888(v8, (unint64_t)v9, &v11);
      sub_2201826B0();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_22012C000, v4, v5, "Cannot access defaults with suite domain '%{public}s'", v6, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x223C676F0](v7, -1, -1);
      MEMORY[0x223C676F0](v6, -1, -1);
    }

    return 0;
  }
  return v2;
}

uint64_t sub_22017E0B0(uint64_t a1, void (*a2)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v4 = a1 + 64;
  uint64_t v5 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v6 = -1;
  if (v5 < 64) {
    uint64_t v6 = ~(-1 << v5);
  }
  unint64_t v7 = v6 & *(void *)(a1 + 64);
  int64_t v8 = (unint64_t)(v5 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v10 = 0;
  while (1)
  {
    if (v7)
    {
      unint64_t v11 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      unint64_t v12 = v11 | (v10 << 6);
      goto LABEL_5;
    }
    int64_t v17 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v17 >= v8) {
      return swift_release();
    }
    unint64_t v18 = *(void *)(v4 + 8 * v17);
    ++v10;
    if (!v18)
    {
      int64_t v10 = v17 + 1;
      if (v17 + 1 >= v8) {
        return swift_release();
      }
      unint64_t v18 = *(void *)(v4 + 8 * v10);
      if (!v18)
      {
        int64_t v10 = v17 + 2;
        if (v17 + 2 >= v8) {
          return swift_release();
        }
        unint64_t v18 = *(void *)(v4 + 8 * v10);
        if (!v18)
        {
          int64_t v10 = v17 + 3;
          if (v17 + 3 >= v8) {
            return swift_release();
          }
          unint64_t v18 = *(void *)(v4 + 8 * v10);
          if (!v18) {
            break;
          }
        }
      }
    }
LABEL_22:
    unint64_t v7 = (v18 - 1) & v18;
    unint64_t v12 = __clz(__rbit64(v18)) + (v10 << 6);
LABEL_5:
    int64_t v13 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v12);
    uint64_t v14 = *v13;
    uint64_t v15 = v13[1];
    uint64_t v16 = *(void *)(*(void *)(a1 + 56) + 8 * v12);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    a2(v14, v15, v16);
    swift_bridgeObjectRelease();
    uint64_t result = swift_bridgeObjectRelease();
  }
  int64_t v19 = v17 + 4;
  if (v19 >= v8) {
    return swift_release();
  }
  unint64_t v18 = *(void *)(v4 + 8 * v19);
  if (v18)
  {
    int64_t v10 = v19;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v10 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
    }
    if (v10 >= v8) {
      return swift_release();
    }
    unint64_t v18 = *(void *)(v4 + 8 * v10);
    ++v19;
    if (v18) {
      goto LABEL_22;
    }
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_22017E250()
{
  id v0 = sub_22017DECC();
  if (!v0)
  {
    long long v8 = 0u;
    long long v9 = 0u;
LABEL_9:
    sub_22014ACAC((uint64_t)&v8, &qword_267F0ABB0);
    return MEMORY[0x263F8EE80];
  }
  uint64_t v1 = v0;
  swift_bridgeObjectRetain();
  id v2 = (void *)sub_220182450();
  swift_bridgeObjectRelease();
  id v3 = objc_msgSend(v1, sel_objectForKey_, v2);

  if (v3)
  {
    sub_2201826D0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v7, 0, sizeof(v7));
  }
  sub_220180674((uint64_t)v7, (uint64_t)&v8);
  if (!*((void *)&v9 + 1)) {
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F0ABB8);
  uint64_t v4 = swift_dynamicCast();
  if (v4)
  {
    uint64_t v5 = *(void *)&v7[0];
    *(void *)&long long v8 = MEMORY[0x263F8EE80];
    MEMORY[0x270FA5388](v4);
    sub_22017E0B0(v5, (void (*)(uint64_t, uint64_t, uint64_t))sub_2201806DC);
    swift_bridgeObjectRelease();
    return v8;
  }
  return MEMORY[0x263F8EE80];
}

uint64_t sub_22017E3D8(uint64_t a1, void (*a2)(uint64_t, uint64_t))
{
  int64_t v24 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F0ABD8);
  MEMORY[0x270FA5388](v3);
  uint64_t v5 = (uint64_t *)((char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v6 = *(void *)(a1 + 64);
  uint64_t v22 = a1 + 64;
  uint64_t v7 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v8 = -1;
  if (v7 < 64) {
    uint64_t v8 = ~(-1 << v7);
  }
  unint64_t v9 = v8 & v6;
  int64_t v23 = (unint64_t)(v7 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v11 = 0;
  while (1)
  {
    if (v9)
    {
      unint64_t v12 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      unint64_t v13 = v12 | (v11 << 6);
      goto LABEL_5;
    }
    int64_t v18 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v18 >= v23) {
      return swift_release();
    }
    unint64_t v19 = *(void *)(v22 + 8 * v18);
    ++v11;
    if (!v19)
    {
      int64_t v11 = v18 + 1;
      if (v18 + 1 >= v23) {
        return swift_release();
      }
      unint64_t v19 = *(void *)(v22 + 8 * v11);
      if (!v19)
      {
        int64_t v11 = v18 + 2;
        if (v18 + 2 >= v23) {
          return swift_release();
        }
        unint64_t v19 = *(void *)(v22 + 8 * v11);
        if (!v19)
        {
          int64_t v11 = v18 + 3;
          if (v18 + 3 >= v23) {
            return swift_release();
          }
          unint64_t v19 = *(void *)(v22 + 8 * v11);
          if (!v19) {
            break;
          }
        }
      }
    }
LABEL_22:
    unint64_t v9 = (v19 - 1) & v19;
    unint64_t v13 = __clz(__rbit64(v19)) + (v11 << 6);
LABEL_5:
    uint64_t v14 = *(void *)(a1 + 56);
    uint64_t v15 = *(void *)(*(void *)(a1 + 48) + 8 * v13);
    uint64_t v16 = v14
        + *(void *)(*(void *)(type metadata accessor for OnboardingDefaults.ShownExperienceRecord() - 8) + 72)
        * v13;
    uint64_t v17 = (uint64_t)v5 + *(int *)(v3 + 48);
    sub_22018060C(v16, v17, (uint64_t (*)(void))type metadata accessor for OnboardingDefaults.ShownExperienceRecord);
    void *v5 = v15;
    v24(v15, v17);
    uint64_t result = sub_22014ACAC((uint64_t)v5, &qword_267F0ABD8);
  }
  int64_t v20 = v18 + 4;
  if (v20 >= v23) {
    return swift_release();
  }
  unint64_t v19 = *(void *)(v22 + 8 * v20);
  if (v19)
  {
    int64_t v11 = v20;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v11 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v11 >= v23) {
      return swift_release();
    }
    unint64_t v19 = *(void *)(v22 + 8 * v11);
    ++v20;
    if (v19) {
      goto LABEL_22;
    }
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_22017E63C()
{
  id v0 = objc_allocWithZone(MEMORY[0x263EFFA40]);
  swift_bridgeObjectRetain();
  uint64_t v1 = (void *)sub_220182450();
  swift_bridgeObjectRelease();
  id v2 = objc_msgSend(v0, sel_initWithSuiteName_, v1);

  if (!v2)
  {
    long long v7 = 0u;
    long long v8 = 0u;
LABEL_9:
    sub_22014ACAC((uint64_t)&v7, &qword_267F0ABB0);
    return 0;
  }
  uint64_t v3 = (void *)sub_220182450();
  id v4 = objc_msgSend(v2, sel_objectForKey_, v3);

  if (v4)
  {
    sub_2201826D0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
  }
  sub_220180674((uint64_t)v6, (uint64_t)&v7);
  if (!*((void *)&v8 + 1)) {
    goto LABEL_9;
  }
  uint64_t result = swift_dynamicCast();
  if (result) {
    return LOBYTE(v6[0]);
  }
  return result;
}

uint64_t sub_22017E794(uint64_t a1, uint64_t a2)
{
  uint64_t v57 = a2;
  uint64_t v65 = sub_220181C80();
  uint64_t v3 = *(void *)(v65 - 8);
  MEMORY[0x270FA5388](v65);
  uint64_t v5 = &v53[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v6 = type metadata accessor for OnboardingDefaults.ShownExperienceRecord();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  unint64_t v9 = (id *)&v53[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F0A940);
  uint64_t v11 = MEMORY[0x270FA5388](v10 - 8);
  unint64_t v13 = &v53[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v11);
  uint64_t v15 = &v53[-v14];
  int v64 = sub_22017E63C();
  int v16 = UNCCatchMe();
  uint64_t v69 = &type metadata for NotificationsUIFeatureFlags;
  unint64_t v70 = sub_220160FDC();
  uint64_t v17 = swift_allocObject();
  uint64_t v67 = v17;
  *(void *)(v17 + 16) = "NotificationsUI";
  *(void *)(v17 + 24) = 15;
  *(unsigned char *)(v17 + 32) = 2;
  *(void *)(v17 + 40) = "GreymatterOnboardingiOS";
  *(void *)(v17 + 48) = 23;
  *(unsigned char *)(v17 + 56) = 2;
  int v63 = sub_220181C40();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)&v67);
  uint64_t v18 = sub_22017E250();
  uint64_t v19 = *(void *)(v18 + 16);
  uint64_t v59 = a1;
  if (v19 && (unint64_t v20 = sub_22017A25C(a1), (v21 & 1) != 0))
  {
    sub_22018060C(*(void *)(v18 + 56) + *(void *)(v7 + 72) * v20, (uint64_t)v15, (uint64_t (*)(void))type metadata accessor for OnboardingDefaults.ShownExperienceRecord);
    uint64_t v22 = 0;
  }
  else
  {
    uint64_t v22 = 1;
  }
  (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(v7 + 56))(v15, v22, 1, v6);
  swift_bridgeObjectRelease();
  sub_2201804E0((uint64_t)v15, (uint64_t)v13);
  int v23 = (*(uint64_t (**)(unsigned char *, uint64_t, uint64_t))(v7 + 48))(v13, 1, v6);
  uint64_t v61 = v5;
  uint64_t v62 = v3;
  char v60 = v15;
  int v58 = v16;
  if (v23 == 1)
  {
    sub_22014ACAC((uint64_t)v13, &qword_267F0A940);
    char v24 = v64 | v16 & v63;
    unint64_t v25 = 0x8000000220189C90;
    int v56 = 1;
    uint64_t v55 = 0xD000000000000012;
    uint64_t v26 = 1;
    uint64_t v27 = v59;
    uint64_t v28 = v65;
    if (v24) {
      goto LABEL_31;
    }
    goto LABEL_30;
  }
  sub_220180548((uint64_t)v13, (uint64_t)v9);
  unint64_t v29 = (char *)v9 + *(int *)(v6 + 28);
  unint64_t v30 = *(void *)v29;
  char v31 = v29[8];
  if ((v31 & 1) == 0 && !v30)
  {
    unint64_t v32 = 0xEA00000000006574;
    goto LABEL_23;
  }
  if (!*v9)
  {
    unint64_t v32 = 0xE900000000000064;
    goto LABEL_23;
  }
  id v33 = *v9;
  if (objc_msgSend(v33, sel_majorBuildNumber) == (id)22 && (uint64_t)objc_msgSend(v33, sel_minorBuildNumber) < 55)
  {
    id v34 = objc_msgSend(v33, sel_majorBuildLetterString);
    if (v34)
    {
      uint64_t v35 = v34;
      uint64_t v36 = sub_220182460();
      uint64_t v38 = v37;

      if (v38)
      {
        if (v36 == 66 && v38 == 0xE100000000000000)
        {
          swift_bridgeObjectRelease();
LABEL_21:
          uint64_t v67 = 0;
          unint64_t v68 = 0xE000000000000000;
          sub_220182780();
          swift_bridgeObjectRelease();
          uint64_t v67 = 0xD00000000000001DLL;
          unint64_t v68 = 0x8000000220189D10;
          id v40 = objc_msgSend(v33, sel_stringRepresentation);
          sub_220182460();

          sub_2201824B0();
          swift_bridgeObjectRelease();
          unint64_t v32 = v68;
          goto LABEL_23;
        }
        char v39 = sub_220182910();
        swift_bridgeObjectRelease();
        if (v39) {
          goto LABEL_21;
        }
      }
    }
  }

  unint64_t v32 = 0;
LABEL_23:
  uint64_t v67 = 0;
  unint64_t v68 = 0xE000000000000000;
  sub_220182780();
  sub_2201824B0();
  BOOL v54 = v32 != 0;
  sub_2201824B0();
  swift_bridgeObjectRelease();
  sub_2201824B0();
  if (*v9)
  {
    id v41 = objc_msgSend(*v9, sel_stringRepresentation);
    sub_220182460();
  }
  sub_2201824B0();
  swift_bridgeObjectRelease();
  sub_2201824B0();
  if ((v31 & 1) == 0 && v30 >= 3) {
    goto LABEL_45;
  }
  sub_2201824B0();
  swift_bridgeObjectRelease();
  sub_2201824B0();
  swift_bridgeObjectRetain();
  sub_2201824B0();
  swift_bridgeObjectRelease();
  sub_2201824B0();
  unint64_t v25 = v68;
  uint64_t v55 = v67;
  sub_2201805AC((uint64_t)v9, (uint64_t (*)(void))type metadata accessor for OnboardingDefaults.ShownExperienceRecord);
  swift_bridgeObjectRelease();
  if (v64)
  {
    int v56 = 0;
    uint64_t v26 = 1;
    uint64_t v5 = v61;
    uint64_t v3 = v62;
    uint64_t v27 = v59;
    uint64_t v15 = v60;
    uint64_t v28 = v65;
  }
  else
  {
    int v56 = 0;
    uint64_t v5 = v61;
    uint64_t v3 = v62;
    uint64_t v27 = v59;
    uint64_t v15 = v60;
    uint64_t v28 = v65;
    uint64_t v26 = v54;
    if ((v58 & v63 & 1) == 0) {
LABEL_30:
    }
      uint64_t v26 = 0;
  }
LABEL_31:
  if (qword_267F09C80 != -1) {
    swift_once();
  }
  uint64_t v42 = __swift_project_value_buffer(v28, (uint64_t)qword_267F0C120);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v3 + 16))(v5, v42, v28);
  swift_bridgeObjectRetain();
  os_log_type_t v43 = sub_220181C60();
  os_log_type_t v44 = sub_220182610();
  if (!os_log_type_enabled(v43, v44))
  {
    swift_bridgeObjectRelease_n();

    (*(void (**)(unsigned char *, uint64_t))(v3 + 8))(v5, v28);
    uint64_t v51 = (uint64_t)v15;
LABEL_41:
    sub_22014ACAC(v51, &qword_267F0A940);
    return v26;
  }
  uint64_t v45 = swift_slowAlloc();
  uint64_t v46 = swift_slowAlloc();
  uint64_t v67 = v46;
  *(_DWORD *)uint64_t v45 = 136448002;
  if (!v27)
  {
    uint64_t v47 = v46;
    uint64_t v66 = sub_220149888(0x7A6972616D6D7573, 0xED00006E6F697461, &v67);
    sub_2201826B0();
    *(_WORD *)(v45 + 12) = 2082;
    if (!v57)
    {
      uint64_t v48 = v26;
      unint64_t v49 = 0xE900000000000079;
      uint64_t v50 = 0x64647542696E696DLL;
LABEL_40:
      uint64_t v66 = sub_220149888(v50, v49, &v67);
      sub_2201826B0();
      swift_bridgeObjectRelease();
      *(_WORD *)(v45 + 22) = 1026;
      LODWORD(v66) = v48;
      sub_2201826B0();
      *(_WORD *)(v45 + 28) = 1024;
      LODWORD(v66) = v64 & 1;
      sub_2201826B0();
      *(_WORD *)(v45 + 34) = 1026;
      LODWORD(v66) = v58;
      sub_2201826B0();
      *(_WORD *)(v45 + 40) = 1026;
      LODWORD(v66) = v63 & 1;
      sub_2201826B0();
      *(_WORD *)(v45 + 46) = 2082;
      swift_bridgeObjectRetain();
      uint64_t v66 = sub_220149888(v55, v25, &v67);
      uint64_t v26 = v48;
      sub_2201826B0();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v45 + 56) = 1026;
      LODWORD(v66) = v56;
      sub_2201826B0();
      _os_log_impl(&dword_22012C000, v43, v44, "Should show onboarding experience, '%{public}s', in '%{public}s'? %{BOOL,public}d. [Force=%{BOOL}d OR GreymatterEnabled=%{BOOL,public}d && OnboardingEnabled=%{BOOL,public}d && (ReasonToReshowOnboarding=%{public}s) || FreshOnboardingPresentation=%{BOOL,public}d)", (uint8_t *)v45, 0x3Eu);
      swift_arrayDestroy();
      MEMORY[0x223C676F0](v47, -1, -1);
      MEMORY[0x223C676F0](v45, -1, -1);

      (*(void (**)(unsigned char *, uint64_t))(v62 + 8))(v61, v65);
      uint64_t v51 = (uint64_t)v60;
      goto LABEL_41;
    }
    if (v57 == 1)
    {
      uint64_t v48 = v26;
      unint64_t v49 = 0xE800000000000000;
      uint64_t v50 = 0x73676E6974746573;
      goto LABEL_40;
    }
  }
  swift_bridgeObjectRelease();
LABEL_45:
  uint64_t result = sub_220182860();
  __break(1u);
  return result;
}

void sub_22017F284(void *a1)
{
  uint64_t v2 = type metadata accessor for NotificationSummarizationOnboardingCustomizationByAppListView();
  uint64_t v3 = v2 - 8;
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (_OWORD *)((char *)v26 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  *(void *)((char *)v5 + *(int *)(v3 + 32)) = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F0AAA0);
  swift_storeEnumTagMultiPayload();
  _OWORD *v5 = 0u;
  v5[1] = 0u;
  uint64_t v6 = *(int *)(v3 + 36);
  v26[1] = a1;
  id v7 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F0AAA8);
  sub_220182290();
  *(_OWORD *)((char *)v5 + v6) = v27;
  if (qword_267F09C70 != -1) {
    swift_once();
  }
  id v8 = (id)qword_267F0C100;
  unint64_t v9 = (void *)sub_220182450();
  uint64_t v10 = (void *)sub_220182450();
  id v11 = objc_msgSend(v8, sel_localizedStringForKey_value_table_, v9, 0, v10);

  uint64_t v12 = sub_220182460();
  uint64_t v14 = v13;

  id v15 = (id)qword_267F0C100;
  int v16 = (void *)sub_220182450();
  uint64_t v17 = (void *)sub_220182450();
  id v18 = objc_msgSend(v15, sel_localizedStringForKey_value_table_, v16, 0, v17);

  uint64_t v19 = sub_220182460();
  uint64_t v21 = v20;

  unint64_t v22 = swift_allocObject();
  *(void *)(v22 + 16) = 0xD000000000000036;
  *(void *)(v22 + 24) = 0x8000000220189BF0;
  uint64_t v23 = swift_allocObject();
  *(void *)(v23 + 16) = 0xD000000000000035;
  *(void *)(v23 + 24) = 0x8000000220189C30;
  uint64_t v24 = swift_allocObject();
  *(void *)(v24 + 16) = 0xD000000000000022;
  *(void *)(v24 + 24) = 0x8000000220189A50;
  id v25 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_267F0AB88));
  sub_220173AB4((uint64_t)v5, v12, v14, v19, v21, 1uLL, 0, (char *)sub_2201811E8, v22, 2uLL, 0, (uint64_t)sub_2201811E8, v23, 0, 0, 0, 0, 0, 0,
    (uint64_t)sub_2201811E8,
    v24,
    (uint64_t (*)(void))type metadata accessor for NotificationSummarizationOnboardingCustomizationByAppListView,
    &qword_267F0AB88,
    (uint64_t (*)(void))type metadata accessor for NotificationSummarizationOnboardingCustomizationByAppListView,
    &qword_267F0AB90,
    (uint64_t)&unk_26D200020,
    (uint64_t)&unk_26D200048,
    (uint64_t)sub_220180370,
    (uint64_t)sub_2201802D0);
}

uint64_t sub_22017F67C(uint64_t a1, unint64_t a2)
{
  swift_bridgeObjectRetain();
  uint64_t v4 = sub_2201828C0();
  swift_bridgeObjectRelease();
  if (v4)
  {
    if (qword_267F09C80 != -1) {
      swift_once();
    }
    uint64_t v5 = sub_220181C80();
    __swift_project_value_buffer(v5, (uint64_t)qword_267F0C120);
    swift_bridgeObjectRetain();
    uint64_t v6 = sub_220181C60();
    os_log_type_t v7 = sub_2201825F0();
    if (os_log_type_enabled(v6, v7))
    {
      id v8 = (uint8_t *)swift_slowAlloc();
      uint64_t v9 = swift_slowAlloc();
      uint64_t v11 = v9;
      *(_DWORD *)id v8 = 136446210;
      swift_bridgeObjectRetain();
      sub_220149888(a1, a2, &v11);
      sub_2201826B0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_22012C000, v6, v7, "Unknown NotificationOnboardingExperience.rawValue, '%{public}s'", v8, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x223C676F0](v9, -1, -1);
      MEMORY[0x223C676F0](v8, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  return 0;
}

uint64_t type metadata accessor for UNNotificationOnboarding(uint64_t a1)
{
  return sub_220149EE0(a1, &qword_267F0AA78);
}

uint64_t _s6ActionVwxx(void *a1)
{
  if (*a1 >= 3uLL) {
    swift_release();
  }

  return swift_release();
}

void *_s6ActionVwcp(void *a1, void *a2)
{
  if (*a2 >= 3uLL)
  {
    uint64_t v4 = a2[1];
    *a1 = *a2;
    a1[1] = v4;
    swift_retain();
  }
  else
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
  }
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_retain();
  return a1;
}

unint64_t *_s6ActionVwca(unint64_t *a1, unint64_t *a2)
{
  unint64_t v4 = *a2;
  if (*a1 >= 3)
  {
    if (v4 >= 3)
    {
      unint64_t v6 = a2[1];
      *a1 = v4;
      a1[1] = v6;
      swift_retain();
      swift_release();
      goto LABEL_8;
    }
    sub_22014ACAC((uint64_t)a1, &qword_267F0AA80);
    goto LABEL_6;
  }
  if (v4 < 3)
  {
LABEL_6:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    goto LABEL_8;
  }
  unint64_t v5 = a2[1];
  *a1 = v4;
  a1[1] = v5;
  swift_retain();
LABEL_8:
  unint64_t v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t _s6ActionVwta(uint64_t a1, uint64_t a2)
{
  if (*(void *)a1 >= 3uLL)
  {
    if (*(void *)a2 >= 3uLL)
    {
      uint64_t v4 = *(void *)(a2 + 8);
      *(void *)a1 = *(void *)a2;
      *(void *)(a1 + 8) = v4;
      swift_release();
      goto LABEL_6;
    }
    sub_22014ACAC(a1, &qword_267F0AA80);
  }
  *(_OWORD *)a1 = *(_OWORD *)a2;
LABEL_6:
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  swift_release();
  return a1;
}

uint64_t _s6ActionVwet(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 32)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t _s6ActionVwst(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)uint64_t result = a2 ^ 0x80000000;
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
      *(void *)(result + 16) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 32) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *_s6ActionVMa()
{
  return &_s6ActionVN;
}

uint64_t sub_22017FAE0()
{
  return MEMORY[0x270FA0238](v0, 64, 7);
}

uint64_t sub_22017FAF0()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

void sub_22017FB28()
{
  sub_22017F284(*(void **)(v0 + 24));
}

uint64_t sub_22017FB30()
{
  return sub_220176D70(*(void **)(v0 + 24));
}

uint64_t sub_22017FB58()
{
  return sub_220177C00();
}

uint64_t sub_22017FB60()
{
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_22017FB98()
{
  return sub_220181DF0();
}

void sub_22017FBC0(char a1)
{
  sub_2201746D8(a1, v1, (uint64_t)&unk_26D1FFDC8, (uint64_t)&unk_26D1FFE18, (uint64_t)&unk_267F0AAE8);
}

void sub_22017FC04()
{
  sub_220174580(*(void *)(v0 + 16), *(uint64_t (**)(unint64_t))(v0 + 24), *(void *)(v0 + 32), *(void *)(v0 + 40), *(void *)(v0 + 48));
}

uint64_t sub_22017FC18(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  unint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *unint64_t v7 = v2;
  v7[1] = sub_2201811A8;
  return sub_220175680(a1, v4, v5, v6);
}

uint64_t sub_22017FCCC()
{
  return sub_220177478();
}

uint64_t (*sub_22017FCD4())()
{
  return sub_220177514(*(void *)(v0 + 16), *(void **)(v0 + 24), *(void **)(v0 + 32));
}

uint64_t sub_22017FCE0()
{
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_22017FD20()
{
  return sub_220177588(*(void *)(v0 + 16), *(void **)(v0 + 24), *(void **)(v0 + 32));
}

uint64_t sub_22017FD2C()
{
  swift_unknownObjectRelease();

  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_22017FD74()
{
  uint64_t v2 = *(void *)(v0 + 48);
  uint64_t v3 = swift_task_alloc();
  long long v4 = *(_OWORD *)(v0 + 32);
  *(void *)(v1 + 16) = v3;
  *(void *)uint64_t v3 = v1;
  *(void *)(v3 + 8) = sub_2201811A8;
  *(void *)(v3 + 32) = v2;
  *(_OWORD *)(v3 + 16) = v4;
  return MEMORY[0x270FA2498](sub_220177760, 0, 0);
}

uint64_t sub_22017FE28()
{
  swift_unknownObjectRelease();

  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_22017FE70(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v6 = v1[5];
  id v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  *id v8 = v2;
  v8[1] = sub_22014A1F0;
  return sub_22017783C(a1, v4, v5, v7, v6);
}

uint64_t sub_22017FF30()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_22017FF68(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_2201811A8;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_267F0AB40 + dword_267F0AB40);
  return v6(a1, v4);
}

uint64_t sub_220180028(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_220180070()
{
  return sub_220165A6C(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_22018008C(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_2201811A8;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_267F0AB60 + dword_267F0AB60);
  return v6(a1, v4);
}

void sub_220180144(char a1)
{
  sub_2201746D8(a1, v1, (uint64_t)&unk_26D1FFF30, (uint64_t)&unk_26D1FFF80, (uint64_t)&unk_267F0AB80);
}

void sub_220180188()
{
}

void sub_2201801B4(uint64_t (*a1)(void), uint64_t (*a2)(void))
{
  sub_220174620(*(void *)(v2 + 16), *(uint64_t (**)(unint64_t))(v2 + 24), *(void *)(v2 + 32), *(void *)(v2 + 40), *(void *)(v2 + 48), a1, a2);
}

uint64_t sub_2201801E4(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_2201811A8;
  return sub_220175680(a1, v4, v5, v6);
}

uint64_t sub_220180298()
{
  swift_unknownObjectWeakDestroy();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_2201802D0(char a1)
{
  sub_2201746D8(a1, v1, (uint64_t)&unk_26D200020, (uint64_t)&unk_26D200070, (uint64_t)&unk_267F0ABA0);
}

uint64_t objectdestroy_32Tm()
{
  swift_release();
  if (*(void *)(v0 + 40))
  {
    if (*(void *)(v0 + 24) >= 3uLL) {
      swift_release();
    }
    swift_release();
  }

  return MEMORY[0x270FA0238](v0, 56, 7);
}

void sub_220180370()
{
}

uint64_t objectdestroy_36Tm()
{
  swift_unknownObjectRelease();
  swift_release();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_2201803E0(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_22014A1F0;
  return sub_2201759D4(a1, v4, v5, v6);
}

uint64_t type metadata accessor for OnboardingDefaults.ShownExperienceRecord()
{
  uint64_t result = qword_267F0AC00;
  if (!qword_267F0AC00) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_2201804E0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F0A940);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_220180548(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for OnboardingDefaults.ShownExperienceRecord();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_2201805AC(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_22018060C(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_220180674(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F0ABB0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_2201806DC(uint64_t a1, unint64_t a2)
{
}

uint64_t sub_2201806E4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for OnboardingDefaults.ShownExperienceRecord();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_220180748(uint64_t a1, uint64_t a2)
{
  return sub_220179728(a1, a2, *(uint64_t **)(v2 + 16));
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

ValueMetadata *type metadata accessor for OnboardingDefaults()
{
  return &type metadata for OnboardingDefaults;
}

void **sub_2201807C4(void **a1, void **a2, int *a3)
{
  int v3 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  uint64_t v4 = (char *)*a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    uint64_t v7 = (void **)&v4[(v3 + 16) & ~(unint64_t)v3];
    swift_retain();
  }
  else
  {
    uint64_t v7 = a1;
    uint64_t v8 = a3[5];
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_220181BC0();
    uint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
    uint64_t v13 = v4;
    v12(v9, v10, v11);
    uint64_t v14 = a3[6];
    uint64_t v15 = a3[7];
    int v16 = (void **)((char *)v7 + v14);
    uint64_t v17 = (void **)((char *)a2 + v14);
    uint64_t v18 = v17[1];
    *int v16 = *v17;
    v16[1] = v18;
    uint64_t v19 = (char *)v7 + v15;
    uint64_t v20 = (char *)a2 + v15;
    v19[8] = v20[8];
    *(void *)uint64_t v19 = *(void *)v20;
    *(void **)((char *)v7 + a3[8]) = *(void **)((char *)a2 + a3[8]);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return v7;
}

uint64_t sub_2201808F8(id *a1, uint64_t a2)
{
  uint64_t v4 = (char *)a1 + *(int *)(a2 + 20);
  uint64_t v5 = sub_220181BC0();
  (*(void (**)(char *, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void **sub_220180994(void **a1, void **a2, int *a3)
{
  uint64_t v6 = *a2;
  *a1 = *a2;
  uint64_t v7 = a3[5];
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_220181BC0();
  uint64_t v11 = *(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16);
  id v12 = v6;
  v11(v8, v9, v10);
  uint64_t v13 = a3[6];
  uint64_t v14 = a3[7];
  uint64_t v15 = (void **)((char *)a1 + v13);
  int v16 = (void **)((char *)a2 + v13);
  uint64_t v17 = v16[1];
  void *v15 = *v16;
  v15[1] = v17;
  uint64_t v18 = (char *)a1 + v14;
  uint64_t v19 = (char *)a2 + v14;
  v18[8] = v19[8];
  *(void *)uint64_t v18 = *(void *)v19;
  *(void **)((char *)a1 + a3[8]) = *(void **)((char *)a2 + a3[8]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void **sub_220180A7C(void **a1, void **a2, int *a3)
{
  uint64_t v6 = *a1;
  uint64_t v7 = *a2;
  *a1 = *a2;
  id v8 = v7;

  uint64_t v9 = a3[5];
  uint64_t v10 = (char *)a1 + v9;
  uint64_t v11 = (char *)a2 + v9;
  uint64_t v12 = sub_220181BC0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 24))(v10, v11, v12);
  uint64_t v13 = a3[6];
  uint64_t v14 = (void **)((char *)a1 + v13);
  uint64_t v15 = (void **)((char *)a2 + v13);
  *uint64_t v14 = *v15;
  v14[1] = v15[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v16 = a3[7];
  uint64_t v17 = (char *)a1 + v16;
  uint64_t v18 = (char *)a2 + v16;
  uint64_t v19 = *(void *)v18;
  unsigned char v17[8] = v18[8];
  *(void *)uint64_t v17 = v19;
  *(void **)((char *)a1 + a3[8]) = *(void **)((char *)a2 + a3[8]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *sub_220180B78(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  id v8 = (char *)a2 + v6;
  uint64_t v9 = sub_220181BC0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  uint64_t v10 = a3[7];
  *(_OWORD *)((char *)a1 + a3[6]) = *(_OWORD *)((char *)a2 + a3[6]);
  uint64_t v11 = (char *)a1 + v10;
  uint64_t v12 = (char *)a2 + v10;
  v11[8] = v12[8];
  *(void *)uint64_t v11 = *(void *)v12;
  *(void *)((char *)a1 + a3[8]) = *(void *)((char *)a2 + a3[8]);
  return a1;
}

void **sub_220180C34(void **a1, void **a2, int *a3)
{
  uint64_t v6 = *a1;
  *a1 = *a2;

  uint64_t v7 = a3[5];
  id v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_220181BC0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  uint64_t v11 = a3[6];
  uint64_t v12 = (void **)((char *)a1 + v11);
  uint64_t v13 = (uint64_t *)((char *)a2 + v11);
  uint64_t v15 = *v13;
  uint64_t v14 = v13[1];
  *uint64_t v12 = v15;
  v12[1] = v14;
  swift_bridgeObjectRelease();
  uint64_t v16 = a3[7];
  uint64_t v17 = a3[8];
  uint64_t v18 = (char *)a1 + v16;
  uint64_t v19 = (char *)a2 + v16;
  *(void *)uint64_t v18 = *(void *)v19;
  v18[8] = v19[8];
  *(void **)((char *)a1 + v17) = *(void **)((char *)a2 + v17);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_220180D10(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_220180D24);
}

uint64_t sub_220180D24(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 2147483646)
  {
    uint64_t v4 = *a1;
    if ((unint64_t)*a1 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    int v5 = v4 - 1;
    if (v5 < 0) {
      int v5 = -1;
    }
    return (v5 + 1);
  }
  else
  {
    uint64_t v9 = sub_220181BC0();
    uint64_t v10 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v9 - 8) + 48);
    uint64_t v11 = v9;
    uint64_t v12 = (char *)a1 + *(int *)(a3 + 20);
    return v10(v12, a2, v11);
  }
}

uint64_t sub_220180DE0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_220180DF4);
}

void *sub_220180DF4(void *result, uint64_t a2, int a3, uint64_t a4)
{
  int v5 = result;
  if (a3 == 2147483646)
  {
    *uint64_t result = a2;
  }
  else
  {
    uint64_t v7 = sub_220181BC0();
    id v8 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = (char *)v5 + *(int *)(a4 + 20);
    return (void *)v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_220180E9C()
{
  uint64_t result = sub_220181BC0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

void *_s6ActionV4KindOwxx(void *result)
{
  if (*result >= 0xFFFFFFFFuLL) {
    return (void *)swift_release();
  }
  return result;
}

uint64_t _s6ActionV4KindOwCP_0(uint64_t a1, uint64_t a2)
{
  if (*(void *)a2 < 0xFFFFFFFFuLL)
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
  }
  else
  {
    uint64_t v3 = *(void *)(a2 + 8);
    *(void *)a1 = *(void *)a2;
    *(void *)(a1 + 8) = v3;
    swift_retain();
  }
  return a1;
}

unint64_t *_s6ActionV4KindOwca(unint64_t *a1, unint64_t *a2)
{
  unint64_t v4 = *a2;
  if (*a1 < 0xFFFFFFFF)
  {
    if (v4 >= 0xFFFFFFFF)
    {
      unint64_t v6 = a2[1];
      *a1 = v4;
      a1[1] = v6;
      swift_retain();
      return a1;
    }
LABEL_7:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }
  if (v4 < 0xFFFFFFFF)
  {
    swift_release();
    goto LABEL_7;
  }
  unint64_t v5 = a2[1];
  *a1 = v4;
  a1[1] = v5;
  swift_retain();
  swift_release();
  return a1;
}

void *_s6ActionV4KindOwta(void *a1, uint64_t a2)
{
  if (*a1 < 0xFFFFFFFFuLL) {
    goto LABEL_5;
  }
  if (*(void *)a2 < 0xFFFFFFFFuLL)
  {
    swift_release();
LABEL_5:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }
  uint64_t v4 = *(void *)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v4;
  swift_release();
  return a1;
}

uint64_t _s6ActionV4KindOwet(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFD && *((unsigned char *)a1 + 16)) {
    return (*(_DWORD *)a1 + 2147483645);
  }
  uint64_t v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  unsigned int v4 = v3 + 1;
  unsigned int v5 = v3 - 2;
  if (v4 >= 4) {
    return v5;
  }
  else {
    return 0;
  }
}

uint64_t _s6ActionV4KindOwst(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 >= 0x7FFFFFFD)
  {
    *(void *)uint64_t result = 0;
    *(void *)(result + 8) = 0;
    *(_DWORD *)uint64_t result = a2 - 2147483645;
    if (a3 >= 0x7FFFFFFD) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFD) {
      *(unsigned char *)(result + 16) = 0;
    }
    if (a2) {
      *(void *)uint64_t result = a2 + 2;
    }
  }
  return result;
}

uint64_t sub_22018115C(uint64_t *a1)
{
  uint64_t v1 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  return (v1 + 1);
}

void *sub_220181174(void *result, int a2)
{
  if (a2 < 0)
  {
    uint64_t v2 = a2 ^ 0x80000000;
    result[1] = 0;
  }
  else
  {
    if (!a2) {
      return result;
    }
    uint64_t v2 = (a2 - 1);
  }
  *uint64_t result = v2;
  return result;
}

ValueMetadata *_s6ActionV4KindOMa()
{
  return &_s6ActionV4KindON;
}

uint64_t sub_220181B30()
{
  return MEMORY[0x270EEF838]();
}

uint64_t sub_220181B40()
{
  return MEMORY[0x270EEFC60]();
}

uint64_t sub_220181B50()
{
  return MEMORY[0x270EEFD20]();
}

uint64_t sub_220181B60()
{
  return MEMORY[0x270EEFE28]();
}

uint64_t sub_220181B70()
{
  return MEMORY[0x270EEFF70]();
}

uint64_t sub_220181B80()
{
  return MEMORY[0x270EF0128]();
}

uint64_t sub_220181B90()
{
  return MEMORY[0x270EF0170]();
}

uint64_t sub_220181BA0()
{
  return MEMORY[0x270EF0990]();
}

uint64_t sub_220181BB0()
{
  return MEMORY[0x270EF0BC0]();
}

uint64_t sub_220181BC0()
{
  return MEMORY[0x270EF0C38]();
}

uint64_t sub_220181BD0()
{
  return MEMORY[0x270FA11B8]();
}

uint64_t sub_220181BE0()
{
  return MEMORY[0x270FA1200]();
}

uint64_t sub_220181BF0()
{
  return MEMORY[0x270FA1210]();
}

uint64_t sub_220181C00()
{
  return MEMORY[0x270FA1218]();
}

uint64_t sub_220181C10()
{
  return MEMORY[0x270FA1230]();
}

uint64_t sub_220181C20()
{
  return MEMORY[0x270FA1240]();
}

uint64_t sub_220181C30()
{
  return MEMORY[0x270FA1248]();
}

uint64_t sub_220181C40()
{
  return MEMORY[0x270F28690]();
}

uint64_t sub_220181C50()
{
  return MEMORY[0x270FA2C78]();
}

uint64_t sub_220181C60()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_220181C70()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_220181C80()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_220181C90()
{
  return MEMORY[0x270F819F8]();
}

uint64_t sub_220181CA0()
{
  return MEMORY[0x270EFEB58]();
}

uint64_t sub_220181CB0()
{
  return MEMORY[0x270EE3C20]();
}

uint64_t sub_220181CC0()
{
  return MEMORY[0x270EE3CE0]();
}

uint64_t sub_220181CD0()
{
  return MEMORY[0x270EE3D40]();
}

uint64_t sub_220181CE0()
{
  return MEMORY[0x270EFECF8]();
}

uint64_t sub_220181CF0()
{
  return MEMORY[0x270EFEDA0]();
}

uint64_t sub_220181D00()
{
  return MEMORY[0x270EFEF10]();
}

uint64_t sub_220181D10()
{
  return MEMORY[0x270EFEF30]();
}

uint64_t sub_220181D20()
{
  return MEMORY[0x270EFEFD0]();
}

uint64_t sub_220181D30()
{
  return MEMORY[0x270EFF108]();
}

uint64_t sub_220181D40()
{
  return MEMORY[0x270EFF128]();
}

uint64_t sub_220181D50()
{
  return MEMORY[0x270EFF3B8]();
}

uint64_t sub_220181D60()
{
  return MEMORY[0x270EFF588]();
}

uint64_t sub_220181D70()
{
  return MEMORY[0x270EFF598]();
}

uint64_t sub_220181D80()
{
  return MEMORY[0x270EFFB80]();
}

uint64_t sub_220181D90()
{
  return MEMORY[0x270F00598]();
}

uint64_t sub_220181DA0()
{
  return MEMORY[0x270F00688]();
}

uint64_t sub_220181DB0()
{
  return MEMORY[0x270F00780]();
}

uint64_t sub_220181DC0()
{
  return MEMORY[0x270F007E0]();
}

uint64_t sub_220181DD0()
{
  return MEMORY[0x270F00828]();
}

uint64_t sub_220181DE0()
{
  return MEMORY[0x270F00840]();
}

uint64_t sub_220181DF0()
{
  return MEMORY[0x270F008D0]();
}

uint64_t sub_220181E00()
{
  return MEMORY[0x270F008D8]();
}

uint64_t sub_220181E10()
{
  return MEMORY[0x270F00940]();
}

uint64_t sub_220181E20()
{
  return MEMORY[0x270F00948]();
}

uint64_t sub_220181E30()
{
  return MEMORY[0x270F00A20]();
}

uint64_t sub_220181E40()
{
  return MEMORY[0x270F00A30]();
}

uint64_t sub_220181E50()
{
  return MEMORY[0x270F00AF0]();
}

uint64_t sub_220181E60()
{
  return MEMORY[0x270F00AF8]();
}

uint64_t sub_220181E70()
{
  return MEMORY[0x270F00D80]();
}

uint64_t sub_220181E80()
{
  return MEMORY[0x270F00D90]();
}

uint64_t sub_220181E90()
{
  return MEMORY[0x270F00E88]();
}

uint64_t sub_220181EA0()
{
  return MEMORY[0x270F00E98]();
}

uint64_t sub_220181EB0()
{
  return MEMORY[0x270F00EB8]();
}

uint64_t sub_220181EC0()
{
  return MEMORY[0x270F00EC0]();
}

uint64_t sub_220181ED0()
{
  return MEMORY[0x270F00ED8]();
}

uint64_t sub_220181EE0()
{
  return MEMORY[0x270F00EE0]();
}

uint64_t sub_220181EF0()
{
  return MEMORY[0x270F00FE8]();
}

uint64_t sub_220181F00()
{
  return MEMORY[0x270F00FF8]();
}

uint64_t sub_220181F10()
{
  return MEMORY[0x270F01050]();
}

uint64_t sub_220181F20()
{
  return MEMORY[0x270F01070]();
}

uint64_t sub_220181F30()
{
  return MEMORY[0x270F01148]();
}

uint64_t sub_220181F40()
{
  return MEMORY[0x270F01150]();
}

uint64_t sub_220181F50()
{
  return MEMORY[0x270F01358]();
}

uint64_t sub_220181F60()
{
  return MEMORY[0x270F01510]();
}

uint64_t sub_220181F70()
{
  return MEMORY[0x270F01520]();
}

uint64_t sub_220181F80()
{
  return MEMORY[0x270F01528]();
}

uint64_t sub_220181F90()
{
  return MEMORY[0x270F015E0]();
}

uint64_t sub_220181FA0()
{
  return MEMORY[0x270F01610]();
}

uint64_t sub_220181FB0()
{
  return MEMORY[0x270F01660]();
}

uint64_t sub_220181FC0()
{
  return MEMORY[0x270F016A0]();
}

uint64_t sub_220181FD0()
{
  return MEMORY[0x270F016B0]();
}

uint64_t sub_220181FE0()
{
  return MEMORY[0x270F016B8]();
}

uint64_t sub_220181FF0()
{
  return MEMORY[0x270F01800]();
}

uint64_t sub_220182000()
{
  return MEMORY[0x270F01BA0]();
}

uint64_t sub_220182010()
{
  return MEMORY[0x270F02290]();
}

uint64_t sub_220182020()
{
  return MEMORY[0x270F022A0]();
}

uint64_t sub_220182030()
{
  return MEMORY[0x270F02888]();
}

uint64_t sub_220182040()
{
  return MEMORY[0x270F02898]();
}

uint64_t sub_220182050()
{
  return MEMORY[0x270F029E0]();
}

uint64_t sub_220182060()
{
  return MEMORY[0x270F02A20]();
}

uint64_t sub_220182070()
{
  return MEMORY[0x270F02A30]();
}

uint64_t sub_220182080()
{
  return MEMORY[0x270F02A38]();
}

uint64_t sub_220182090()
{
  return MEMORY[0x270F02A48]();
}

uint64_t sub_2201820A0()
{
  return MEMORY[0x270F02A60]();
}

uint64_t sub_2201820B0()
{
  return MEMORY[0x270F02A68]();
}

uint64_t sub_2201820C0()
{
  return MEMORY[0x270F02A78]();
}

uint64_t sub_2201820D0()
{
  return MEMORY[0x270F02C70]();
}

uint64_t sub_2201820E0()
{
  return MEMORY[0x270F02D08]();
}

uint64_t sub_2201820F0()
{
  return MEMORY[0x270F02D10]();
}

uint64_t sub_220182100()
{
  return MEMORY[0x270F03010]();
}

uint64_t sub_220182110()
{
  return MEMORY[0x270F030A8]();
}

uint64_t sub_220182120()
{
  return MEMORY[0x270F03250]();
}

uint64_t sub_220182130()
{
  return MEMORY[0x270F032C0]();
}

uint64_t sub_220182140()
{
  return MEMORY[0x270F032D0]();
}

uint64_t sub_220182150()
{
  return MEMORY[0x270F032F0]();
}

uint64_t sub_220182160()
{
  return MEMORY[0x270F03438]();
}

uint64_t sub_220182170()
{
  return MEMORY[0x270F03498]();
}

uint64_t sub_220182180()
{
  return MEMORY[0x270F03548]();
}

uint64_t sub_220182190()
{
  return MEMORY[0x270F036C0]();
}

uint64_t sub_2201821A0()
{
  return MEMORY[0x270F041A0]();
}

uint64_t sub_2201821B0()
{
  return MEMORY[0x270F04388]();
}

uint64_t sub_2201821C0()
{
  return MEMORY[0x270F043A8]();
}

uint64_t sub_2201821D0()
{
  return MEMORY[0x270F04410]();
}

uint64_t sub_2201821E0()
{
  return MEMORY[0x270F04488]();
}

uint64_t sub_2201821F0()
{
  return MEMORY[0x270F044E8]();
}

uint64_t sub_220182200()
{
  return MEMORY[0x270F044F0]();
}

uint64_t sub_220182210()
{
  return MEMORY[0x270F04558]();
}

uint64_t sub_220182220()
{
  return MEMORY[0x270F04570]();
}

uint64_t sub_220182230()
{
  return MEMORY[0x270F04630]();
}

uint64_t sub_220182240()
{
  return MEMORY[0x270F04638]();
}

uint64_t sub_220182250()
{
  return MEMORY[0x270F04650]();
}

uint64_t sub_220182260()
{
  return MEMORY[0x270F04690]();
}

uint64_t sub_220182270()
{
  return MEMORY[0x270F046D0]();
}

uint64_t sub_220182280()
{
  return MEMORY[0x270F04718]();
}

uint64_t sub_220182290()
{
  return MEMORY[0x270F04818]();
}

uint64_t sub_2201822A0()
{
  return MEMORY[0x270F04820]();
}

uint64_t sub_2201822B0()
{
  return MEMORY[0x270F04830]();
}

uint64_t sub_2201822C0()
{
  return MEMORY[0x270F04848]();
}

uint64_t sub_2201822D0()
{
  return MEMORY[0x270F048B0]();
}

uint64_t sub_2201822E0()
{
  return MEMORY[0x270F04AB0]();
}

uint64_t sub_2201822F0()
{
  return MEMORY[0x270F04B30]();
}

uint64_t sub_220182300()
{
  return MEMORY[0x270F04B80]();
}

uint64_t sub_220182310()
{
  return MEMORY[0x270F04C90]();
}

uint64_t sub_220182320()
{
  return MEMORY[0x270F04CA8]();
}

uint64_t sub_220182330()
{
  return MEMORY[0x270F05048]();
}

uint64_t sub_220182340()
{
  return MEMORY[0x270F05058]();
}

uint64_t sub_220182350()
{
  return MEMORY[0x270F05078]();
}

uint64_t sub_220182360()
{
  return MEMORY[0x270F05490]();
}

uint64_t sub_220182370()
{
  return MEMORY[0x270F05498]();
}

uint64_t sub_220182380()
{
  return MEMORY[0x270F054A0]();
}

uint64_t sub_220182390()
{
  return MEMORY[0x270F054A8]();
}

uint64_t sub_2201823A0()
{
  return MEMORY[0x270F054B0]();
}

uint64_t sub_2201823B0()
{
  return MEMORY[0x270F054B8]();
}

uint64_t sub_2201823C0()
{
  return MEMORY[0x270FA09A0]();
}

uint64_t sub_2201823D0()
{
  return MEMORY[0x270FA09C8]();
}

uint64_t sub_2201823E0()
{
  return MEMORY[0x270FA09F0]();
}

uint64_t sub_2201823F0()
{
  return MEMORY[0x270FA0A50]();
}

uint64_t sub_220182400()
{
  return MEMORY[0x270FA0BA0]();
}

uint64_t sub_220182410()
{
  return MEMORY[0x270FA0BF8]();
}

uint64_t sub_220182420()
{
  return MEMORY[0x270EF1810]();
}

uint64_t sub_220182430()
{
  return MEMORY[0x270F9D060]();
}

uint64_t sub_220182440()
{
  return MEMORY[0x270F9D478]();
}

uint64_t sub_220182450()
{
  return MEMORY[0x270EF19A8]();
}

uint64_t sub_220182460()
{
  return MEMORY[0x270EF19F0]();
}

uint64_t sub_220182470()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_220182480()
{
  return MEMORY[0x270F9D5F8]();
}

uint64_t sub_220182490()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_2201824A0()
{
  return MEMORY[0x270F9D740]();
}

uint64_t sub_2201824B0()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_2201824C0()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_2201824D0()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_2201824E0()
{
  return MEMORY[0x270EF1B90]();
}

uint64_t sub_2201824F0()
{
  return MEMORY[0x270EF1BA0]();
}

uint64_t sub_220182500()
{
  return MEMORY[0x270EF1BB0]();
}

uint64_t sub_220182510()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_220182520()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_220182530()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_220182540()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_220182550()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_220182560()
{
  return MEMORY[0x270FA1EA0]();
}

uint64_t sub_220182570()
{
  return MEMORY[0x270FA1EA8]();
}

uint64_t sub_220182580()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_220182590()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_2201825A0()
{
  return MEMORY[0x270FA1FB0]();
}

uint64_t sub_2201825B0()
{
  return MEMORY[0x270FA1FE8]();
}

uint64_t sub_2201825C0()
{
  return MEMORY[0x270EF1CC8]();
}

uint64_t sub_2201825D0()
{
  return MEMORY[0x270F9DF80]();
}

uint64_t sub_2201825E0()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_2201825F0()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_220182600()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t sub_220182610()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_220182620()
{
  return MEMORY[0x270FA0D68]();
}

uint64_t sub_220182630()
{
  return MEMORY[0x270FA0D98]();
}

uint64_t sub_220182640()
{
  return MEMORY[0x270FA0DD8]();
}

uint64_t sub_220182650()
{
  return MEMORY[0x270F825A0]();
}

uint64_t sub_220182660()
{
  return MEMORY[0x270EF20F0]();
}

uint64_t sub_220182670()
{
  return MEMORY[0x270EF2108]();
}

uint64_t sub_220182680()
{
  return MEMORY[0x270FA1178]();
}

uint64_t sub_220182690()
{
  return MEMORY[0x270FA1188]();
}

uint64_t sub_2201826A0()
{
  return MEMORY[0x270FA1198]();
}

uint64_t sub_2201826B0()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_2201826C0()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_2201826D0()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_2201826E0()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_2201826F0()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_220182700()
{
  return MEMORY[0x270F9E800]();
}

uint64_t sub_220182710()
{
  return MEMORY[0x270F9E818]();
}

uint64_t sub_220182720()
{
  return MEMORY[0x270F9E848]();
}

uint64_t sub_220182730()
{
  return MEMORY[0x270F9E858]();
}

uint64_t sub_220182740()
{
  return MEMORY[0x270F9E870]();
}

uint64_t sub_220182750()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_220182760()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_220182770()
{
  return MEMORY[0x270F9E968]();
}

uint64_t sub_220182780()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_220182790()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_2201827A0()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_2201827B0()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_2201827C0()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_2201827D0()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_2201827E0()
{
  return MEMORY[0x270F9EBE0]();
}

uint64_t sub_2201827F0()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_220182800()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_220182810()
{
  return MEMORY[0x270FA21A0]();
}

uint64_t sub_220182820()
{
  return MEMORY[0x270FA21A8]();
}

uint64_t sub_220182830()
{
  return MEMORY[0x270FA21B0]();
}

uint64_t sub_220182840()
{
  return MEMORY[0x270F9ECD8]();
}

uint64_t sub_220182850()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_220182860()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_220182870()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_220182880()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_220182890()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_2201828A0()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_2201828B0()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_2201828C0()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_2201828D0()
{
  return MEMORY[0x270F9F4C0]();
}

uint64_t sub_2201828E0()
{
  return MEMORY[0x270F9F4C8]();
}

uint64_t sub_2201828F0()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_220182900()
{
  return MEMORY[0x270F9F7C0]();
}

uint64_t sub_220182910()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_220182920()
{
  return MEMORY[0x270F9FA88]();
}

uint64_t sub_220182930()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_220182940()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_220182950()
{
  return MEMORY[0x270FA2378]();
}

uint64_t sub_220182970()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_220182980()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_220182990()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_2201829A0()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_2201829B0()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_2201829C0()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_2201829D0()
{
  return MEMORY[0x270F9FC68]();
}

uint64_t sub_2201829E0()
{
  return MEMORY[0x270F9FC80]();
}

uint64_t sub_2201829F0()
{
  return MEMORY[0x270F9FC88]();
}

uint64_t sub_220182A00()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_220182A10()
{
  return MEMORY[0x270F9FC98]();
}

uint64_t sub_220182A20()
{
  return MEMORY[0x270F9FF68]();
}

uint64_t sub_220182A30()
{
  return MEMORY[0x270F9FFB8]();
}

uint64_t sub_220182A50()
{
  return MEMORY[0x270F9FFE8]();
}

uint64_t sub_220182A60()
{
  return MEMORY[0x270FA00C0]();
}

uint64_t AnalyticsSendEvent()
{
  return MEMORY[0x270F18A38]();
}

uint64_t BSDispatchMain()
{
  return MEMORY[0x270F10748]();
}

uint64_t BSDispatchQueueAssertMain()
{
  return MEMORY[0x270F10758]();
}

uint64_t BSStringFromBOOL()
{
  return MEMORY[0x270F10960]();
}

uint64_t BiomeLibrary()
{
  return MEMORY[0x270F10AF0]();
}

CATransform3D *__cdecl CATransform3DMakeAffineTransform(CATransform3D *__return_ptr retstr, CGAffineTransform *m)
{
  return (CATransform3D *)MEMORY[0x270EFB930](retstr, m);
}

Boolean CFStringFindCharacterFromSet(CFStringRef theString, CFCharacterSetRef theSet, CFRange rangeToSearch, CFStringCompareFlags searchOptions, CFRange *result)
{
  return MEMORY[0x270EE5158](theString, theSet, rangeToSearch.location, rangeToSearch.length, searchOptions, result);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x270EE59A8](retstr, sx, sy);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x270EE71A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  MEMORY[0x270EE71D8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  MEMORY[0x270EE71F0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x270EE7218]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

uint64_t UNCCatchMe()
{
  return MEMORY[0x270F06400]();
}

uint64_t UNSafeCast()
{
  return MEMORY[0x270F064A8]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return (os_activity_t)MEMORY[0x270ED8028](dso, description, activity, *(void *)&flags);
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

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9448](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
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

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x270EDA498](__b, *(void *)&__c, __len);
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

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
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

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x270F9AA18](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x270F9AA20](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

void os_activity_scope_enter(os_activity_t activity, os_activity_scope_state_t state)
{
}

void os_activity_scope_leave(os_activity_scope_state_t state)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t sandbox_extension_issue_file()
{
  return MEMORY[0x270EDB2C0]();
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
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

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x270FA01A0]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x270FA01C0]();
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

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x270FA0268]();
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

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x270FA0310]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x270FA0338]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x270FA03B0]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x270FA03B8]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x270FA03D0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x270FA03E8]();
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

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x270FA0458]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x270FA0478]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x270FA0498]();
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

uint64_t swift_release_n()
{
  return MEMORY[0x270FA0528]();
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

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x270FA0578]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x270FA2450]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x270FA2458]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x270FA2460]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x270FA05A8]();
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

uint64_t swift_weakDestroy()
{
  return MEMORY[0x270FA0648]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x270FA0650]();
}

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x270FA0658]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}