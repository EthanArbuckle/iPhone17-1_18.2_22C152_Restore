BOOL MNNavigationServiceStateIsNavigating(unint64_t a1)
{
  return a1 > 3;
}

__CFString *MNLocaleDidChangeNotification()
{
  if (MNLocaleDidChangeNotification_onceToken != -1) {
    dispatch_once(&MNLocaleDidChangeNotification_onceToken, &__block_literal_global_24);
  }
  return @"MNLocaleDidChangeNotification";
}

void sub_1B542E160(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location)
{
  objc_destroyWeak(v24);
  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id GetAudioLogForMNUserOptionsEngineCategory()
{
  if (qword_1EB59C160 != -1) {
    dispatch_once(&qword_1EB59C160, &__block_literal_global_86);
  }
  v0 = (void *)qword_1EB59C158;
  return v0;
}

void sub_1B542E6F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B542E83C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1B542EEFC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 112));
  _Unwind_Resume(a1);
}

id GetAudioLogForMNVoiceLanguageUtilCategory()
{
  if (qword_1EB59C2C0 != -1) {
    dispatch_once(&qword_1EB59C2C0, &__block_literal_global_46);
  }
  v0 = (void *)_MergedGlobals_46;
  return v0;
}

id MNGetMNNavigationServiceLog()
{
  if (MNGetMNNavigationServiceLog_onceToken != -1) {
    dispatch_once(&MNGetMNNavigationServiceLog_onceToken, &__block_literal_global_53);
  }
  v0 = (void *)MNGetMNNavigationServiceLog_log;
  return v0;
}

void sub_1B5430660(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id MNGetPuckTrackingLog()
{
  if (MNGetPuckTrackingLog_onceToken != -1) {
    dispatch_once(&MNGetPuckTrackingLog_onceToken, &__block_literal_global_107);
  }
  v0 = (void *)MNGetPuckTrackingLog_log;
  return v0;
}

id MNGetMNLocationProviderLog()
{
  if (MNGetMNLocationProviderLog_onceToken != -1) {
    dispatch_once(&MNGetMNLocationProviderLog_onceToken, &__block_literal_global_47);
  }
  v0 = (void *)MNGetMNLocationProviderLog_log;
  return v0;
}

void sub_1B5431724(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

id MNGetMNNavigationDetailsLog()
{
  if (MNGetMNNavigationDetailsLog_onceToken != -1) {
    dispatch_once(&MNGetMNNavigationDetailsLog_onceToken, &__block_literal_global_51);
  }
  v0 = (void *)MNGetMNNavigationDetailsLog_log;
  return v0;
}

uint64_t MNInstructionsCalculateScaledDistanceUnits(int a1, int a2, uint64_t a3, int a4, double a5)
{
  if (a1)
  {
    if (a5 >= 1000.0) {
      goto LABEL_58;
    }
    if (a5 <= 500.0 || a3 == 2)
    {
      double v6 = floor(a5);
      double v7 = round(a5 / 5.0) * 5.0;
      if (a5 <= 5.0) {
        double v7 = v6;
      }
      double v8 = round(a5 / 10.0);
      BOOL v9 = a5 <= 30.0 || a3 == 2;
      double v10 = v9 ? v7 : v8 * 10.0;
      double v11 = round(a5 / 50.0);
      BOOL v12 = a5 <= 100.0 || a3 == 2;
      double v26 = v12 ? v10 : v11 * 50.0;
    }
    else
    {
      double v26 = round(a5 / 100.0) * 100.0;
    }
    if (v26 >= 1000.0) {
LABEL_58:
    }
      uint64_t v27 = 1;
    else {
      uint64_t v27 = 0;
    }
    if (a4) {
      return v27;
    }
    else {
      return 0;
    }
  }
  else
  {
    double v13 = a5 * 0.000621371192;
    double v14 = a5 * 3.2808399;
    if (!a2)
    {
      double v15 = floor(v14 / 5.0) * 5.0;
      double v16 = round(v14 / 10.0);
      if (v14 > 30.0) {
        double v15 = v16 * 10.0;
      }
      double v17 = round(v14 / 50.0);
      if (v14 <= 100.0 || a3 == 2) {
        double v19 = v15;
      }
      else {
        double v19 = v17 * 50.0;
      }
      double v20 = round(v14 / 100.0);
      if (v14 <= 500.0 || a3 == 2) {
        double v14 = v19;
      }
      else {
        double v14 = v20 * 100.0;
      }
    }
    double v22 = 0.1;
    if (v13 > 0.1 && a3 != 1)
    {
      if (v13 < 1.0 && a3 == 2) {
        double v22 = 0.05;
      }
      double v13 = round(v13 / v22) * v22;
    }
    if (v14 >= 1000.0)
    {
      if (a3 == 1 && v13 < 0.875)
      {
        uint64_t v25 = 5;
        if (v13 < 0.625) {
          uint64_t v25 = 5;
        }
      }
      else
      {
        uint64_t v25 = 4;
      }
    }
    else if (a2)
    {
      uint64_t v25 = 2;
    }
    else
    {
      uint64_t v25 = 3;
    }
    if (a4) {
      return v25;
    }
    else {
      return 3;
    }
  }
}

uint64_t ___registerStateCaptureCallbacks_block_invoke()
{
  _stateCaptureCallbackRegistration = 1;
  return MEMORY[0x1F411C598](0, _getConfigStoreStringKeysForStateCapture);
}

void sub_1B5433AD4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Block_object_dispose((const void *)(v23 - 96), 8);
  _Unwind_Resume(a1);
}

void MNRunAsynchronouslyOnMainThread(void *a1)
{
  v1 = (void *)MEMORY[0x1E4F29060];
  block = a1;
  if ([v1 isMainThread]) {
    block[2]();
  }
  else {
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void _registerStateCaptureCallbacks()
{
  if (_registerStateCaptureCallbacks_onceToken != -1) {
    dispatch_once(&_registerStateCaptureCallbacks_onceToken, &__block_literal_global_23);
  }
}

void sub_1B5434634(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1B5434818(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __MNGetMNNavigationServiceLog_block_invoke()
{
  MNGetMNNavigationServiceLog_log = (uint64_t)os_log_create("com.apple.Navigation", "MNNavigationService");
  return MEMORY[0x1F41817F8]();
}

uint64_t __MNGetMNNavigationDetailsLog_block_invoke()
{
  MNGetMNNavigationDetailsLog_log = (uint64_t)os_log_create("com.apple.Navigation", "MNNavigationDetails");
  return MEMORY[0x1F41817F8]();
}

uint64_t __GetAudioLogForMNVoiceLanguageUtilCategory_block_invoke()
{
  _MergedGlobals_46 = (uint64_t)os_log_create("com.apple.Navigation.Audio", "MNVoiceLanguageUtil");
  return MEMORY[0x1F41817F8]();
}

void __MNLocaleDidChangeNotification_block_invoke()
{
  LocalCenter = CFNotificationCenterGetLocalCenter();
  CFStringRef v1 = (const __CFString *)*MEMORY[0x1E4F1D200];
  CFNotificationCenterAddObserver(LocalCenter, 0, (CFNotificationCallback)_currentLocaleChanged, v1, 0, CFNotificationSuspensionBehaviorCoalesce);
}

__CFString *MNNavigationServiceStateAsString(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 5) {
    return @"Stopped";
  }
  else {
    return off_1E60F7460[a1 - 1];
  }
}

id sub_1B5435508(void *a1)
{
  v9[1] = *(id *)MEMORY[0x1E4F143B8];
  *(void *)&v1[OBJC_IVAR____TtC10Navigation22MNTraceSelectStatement____lazy_storage____columnToIndexLookup] = 0;
  uint64_t v3 = (void *)sub_1B5531ED0();
  swift_bridgeObjectRelease();
  v9[0] = 0;
  v8.receiver = v1;
  v8.super_class = (Class)type metadata accessor for MNTraceSelectStatement();
  id v4 = objc_msgSendSuper2(&v8, sel_initForTrace_statement_outError_, a1, v3, v9);

  if (v9[0])
  {
    id v5 = v9[0];
    swift_willThrow();
  }
  else
  {
    id v6 = v4;
    sub_1B5435614();
  }
  return v4;
}

uint64_t sub_1B5435614()
{
  CFStringRef v1 = v0;
  uint64_t result = sqlite3_column_count((sqlite3_stmt *)objc_msgSend(v0, sel_rawStatement));
  if ((result & 0x80000000) != 0) {
    goto LABEL_28;
  }
  int v3 = result;
  if (result)
  {
    int v4 = 0;
    uint64_t v24 = OBJC_IVAR____TtC10Navigation22MNTraceSelectStatement____lazy_storage____columnToIndexLookup;
    while (1)
    {
      if (v3 == v4)
      {
        __break(1u);
LABEL_26:
        __break(1u);
LABEL_27:
        __break(1u);
LABEL_28:
        __break(1u);
LABEL_29:
        uint64_t result = sub_1B5532100();
        __break(1u);
        return result;
      }
      uint64_t result = (uint64_t)sqlite3_column_name((sqlite3_stmt *)objc_msgSend(v1, sel_rawStatement), v4);
      if (result) {
        break;
      }
LABEL_7:
      if (v3 == ++v4) {
        return result;
      }
    }
    uint64_t v5 = sub_1B5531F20();
    uint64_t v7 = v6;
    uint64_t v8 = HIBYTE(v6) & 0xF;
    if ((v6 & 0x2000000000000000) == 0) {
      uint64_t v8 = v5 & 0xFFFFFFFFFFFFLL;
    }
    if (!v8)
    {
LABEL_6:
      uint64_t result = swift_bridgeObjectRelease();
      goto LABEL_7;
    }
    uint64_t v9 = v5;
    double v10 = (void *)sub_1B543581C();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    unint64_t v13 = sub_1B543825C(v9, v7);
    uint64_t v14 = v10[2];
    BOOL v15 = (v12 & 1) == 0;
    uint64_t v16 = v14 + v15;
    if (__OFADD__(v14, v15)) {
      goto LABEL_26;
    }
    char v17 = v12;
    if (v10[3] < v16)
    {
      sub_1B543830C(v16, isUniquelyReferenced_nonNull_native);
      unint64_t v18 = sub_1B543825C(v9, v7);
      if ((v17 & 1) != (v19 & 1)) {
        goto LABEL_29;
      }
      unint64_t v13 = v18;
      if ((v17 & 1) == 0) {
        goto LABEL_20;
      }
LABEL_4:
      *(_DWORD *)(v10[7] + 4 * v13) = v4;
LABEL_5:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      *(void *)&v1[v24] = v10;
      goto LABEL_6;
    }
    if (isUniquelyReferenced_nonNull_native)
    {
      if (v12) {
        goto LABEL_4;
      }
    }
    else
    {
      sub_1B54386FC();
      if (v17) {
        goto LABEL_4;
      }
    }
LABEL_20:
    v10[(v13 >> 6) + 8] |= 1 << v13;
    double v20 = (uint64_t *)(v10[6] + 16 * v13);
    *double v20 = v9;
    v20[1] = v7;
    *(_DWORD *)(v10[7] + 4 * v13) = v4;
    uint64_t v21 = v10[2];
    BOOL v22 = __OFADD__(v21, 1);
    uint64_t v23 = v21 + 1;
    if (v22) {
      goto LABEL_27;
    }
    v10[2] = v23;
    swift_bridgeObjectRetain();
    goto LABEL_5;
  }
  return result;
}

unint64_t sub_1B543581C()
{
  uint64_t v1 = OBJC_IVAR____TtC10Navigation22MNTraceSelectStatement____lazy_storage____columnToIndexLookup;
  if (*(void *)(v0 + OBJC_IVAR____TtC10Navigation22MNTraceSelectStatement____lazy_storage____columnToIndexLookup))
  {
    unint64_t v2 = *(void *)(v0 + OBJC_IVAR____TtC10Navigation22MNTraceSelectStatement____lazy_storage____columnToIndexLookup);
  }
  else
  {
    unint64_t v2 = sub_1B5435888(MEMORY[0x1E4FBC860]);
    *(void *)(v0 + v1) = v2;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  return v2;
}

unint64_t sub_1B5435888(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    unint64_t v2 = (void *)MEMORY[0x1E4FBC868];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D54E40);
  unint64_t v2 = (void *)sub_1B55320C0();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  int v4 = (_DWORD *)(a1 + 48);
  while (1)
  {
    uint64_t v5 = *((void *)v4 - 2);
    uint64_t v6 = *((void *)v4 - 1);
    int v7 = *v4;
    swift_bridgeObjectRetain();
    unint64_t result = sub_1B543825C(v5, v6);
    if (v9) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    double v10 = (uint64_t *)(v2[6] + 16 * result);
    *double v10 = v5;
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

id MNTraceSelectStatement.__allocating_init(for:statement:outError:)(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v7 = objc_allocWithZone(v4);
  uint64_t v8 = (void *)sub_1B5531ED0();
  swift_bridgeObjectRelease();
  id v9 = objc_msgSend(v7, sel_initForTrace_statement_outError_, a1, v8, a4);

  return v9;
}

void MNTraceSelectStatement.init(for:statement:outError:)()
{
}

id MNTraceSelectStatement.__deallocating_deinit()
{
  return sub_1B543796C(type metadata accessor for MNTraceSelectStatement);
}

uint64_t type metadata accessor for MNTraceSelectStatement()
{
  return self;
}

Swift::Int __swiftcall MNTraceSelectStatement.intValue(_:)(Swift::String a1)
{
  unint64_t v2 = v1;
  object = a1._object;
  uint64_t countAndFlagsBits = a1._countAndFlagsBits;
  swift_bridgeObjectRetain();
  unint64_t v5 = sub_1B543581C();
  if (*(void *)(v5 + 16) && (unint64_t v6 = sub_1B543825C(countAndFlagsBits, (uint64_t)object), (v7 & 1) != 0))
  {
    int v8 = *(_DWORD *)(*(void *)(v5 + 56) + 4 * v6);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return sqlite3_column_int((sqlite3_stmt *)objc_msgSend(v2, sel_rawStatement), v8);
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (qword_1E9D54DC0 != -1) {
      swift_once();
    }
    uint64_t v10 = sub_1B5531EA0();
    __swift_project_value_buffer(v10, (uint64_t)qword_1E9D57910);
    swift_bridgeObjectRetain_n();
    uint64_t v11 = sub_1B5531E80();
    os_log_type_t v12 = sub_1B5531F70();
    if (os_log_type_enabled(v11, v12))
    {
      uint64_t v13 = (uint8_t *)swift_slowAlloc();
      uint64_t v14 = swift_slowAlloc();
      uint64_t v15 = v14;
      *(_DWORD *)uint64_t v13 = 136315138;
      swift_bridgeObjectRetain();
      sub_1B5437C04(countAndFlagsBits, (unint64_t)object, &v15);
      sub_1B5531FF0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1B542B000, v11, v12, "No column named '%s' found.", v13, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1BA99BA00](v14, -1, -1);
      MEMORY[0x1BA99BA00](v13, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    return 0;
  }
}

Swift::Double __swiftcall MNTraceSelectStatement.doubleValue(_:)(Swift::String a1)
{
  unint64_t v2 = v1;
  object = a1._object;
  uint64_t countAndFlagsBits = a1._countAndFlagsBits;
  swift_bridgeObjectRetain();
  unint64_t v5 = sub_1B543581C();
  if (*(void *)(v5 + 16) && (unint64_t v6 = sub_1B543825C(countAndFlagsBits, (uint64_t)object), (v7 & 1) != 0))
  {
    int v8 = *(_DWORD *)(*(void *)(v5 + 56) + 4 * v6);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    id v9 = (sqlite3_stmt *)objc_msgSend(v2, sel_rawStatement);
    return sqlite3_column_double(v9, v8);
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (qword_1E9D54DC0 != -1) {
      swift_once();
    }
    uint64_t v11 = sub_1B5531EA0();
    __swift_project_value_buffer(v11, (uint64_t)qword_1E9D57910);
    swift_bridgeObjectRetain_n();
    os_log_type_t v12 = sub_1B5531E80();
    os_log_type_t v13 = sub_1B5531F70();
    if (os_log_type_enabled(v12, v13))
    {
      uint64_t v14 = (uint8_t *)swift_slowAlloc();
      uint64_t v15 = swift_slowAlloc();
      uint64_t v16 = v15;
      *(_DWORD *)uint64_t v14 = 136315138;
      swift_bridgeObjectRetain();
      sub_1B5437C04(countAndFlagsBits, (unint64_t)object, &v16);
      sub_1B5531FF0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1B542B000, v12, v13, "No column named '%s' found.", v14, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1BA99BA00](v15, -1, -1);
      MEMORY[0x1BA99BA00](v14, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    return 0.0;
  }
}

Swift::String_optional __swiftcall MNTraceSelectStatement.stringValue(_:)(Swift::String a1)
{
  unint64_t v2 = v1;
  object = a1._object;
  uint64_t countAndFlagsBits = a1._countAndFlagsBits;
  swift_bridgeObjectRetain();
  unint64_t v5 = sub_1B543581C();
  if (!*(void *)(v5 + 16) || (unint64_t v6 = sub_1B543825C(countAndFlagsBits, (uint64_t)object), (v7 & 1) == 0))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (qword_1E9D54DC0 != -1) {
      swift_once();
    }
    uint64_t v11 = sub_1B5531EA0();
    __swift_project_value_buffer(v11, (uint64_t)qword_1E9D57910);
    swift_bridgeObjectRetain_n();
    os_log_type_t v12 = sub_1B5531E80();
    os_log_type_t v13 = sub_1B5531F70();
    if (os_log_type_enabled(v12, v13))
    {
      uint64_t v14 = (uint8_t *)swift_slowAlloc();
      uint64_t v15 = swift_slowAlloc();
      uint64_t v17 = v15;
      *(_DWORD *)uint64_t v14 = 136315138;
      swift_bridgeObjectRetain();
      sub_1B5437C04(countAndFlagsBits, (unint64_t)object, &v17);
      sub_1B5531FF0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1B542B000, v12, v13, "No column named '%s' found.", v14, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1BA99BA00](v15, -1, -1);
      MEMORY[0x1BA99BA00](v14, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    uint64_t v9 = 0;
    goto LABEL_11;
  }
  int v8 = *(_DWORD *)(*(void *)(v5 + 56) + 4 * v6);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v9 = (uint64_t)sqlite3_column_text((sqlite3_stmt *)objc_msgSend(v2, sel_rawStatement), v8);
  if (!v9)
  {
LABEL_11:
    uint64_t v10 = 0;
    goto LABEL_12;
  }
  uint64_t v9 = sub_1B5531F30();
LABEL_12:
  result.value._object = v10;
  result.value._uint64_t countAndFlagsBits = v9;
  return result;
}

unsigned char *MNTraceSelectStatement.dataValue(_:)(uint64_t a1, unint64_t a2)
{
  uint64_t v3 = v2;
  swift_bridgeObjectRetain();
  unint64_t v6 = sub_1B543581C();
  if (!*(void *)(v6 + 16) || (unint64_t v7 = sub_1B543825C(a1, a2), (v8 & 1) == 0))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (qword_1E9D54DC0 != -1) {
      swift_once();
    }
    uint64_t v13 = sub_1B5531EA0();
    __swift_project_value_buffer(v13, (uint64_t)qword_1E9D57910);
    swift_bridgeObjectRetain_n();
    uint64_t v14 = sub_1B5531E80();
    os_log_type_t v15 = sub_1B5531F70();
    if (os_log_type_enabled(v14, v15))
    {
      uint64_t v16 = (uint8_t *)swift_slowAlloc();
      uint64_t v17 = swift_slowAlloc();
      uint64_t v18 = v17;
      *(_DWORD *)uint64_t v16 = 136315138;
      swift_bridgeObjectRetain();
      sub_1B5437C04(a1, a2, &v18);
      sub_1B5531FF0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1B542B000, v14, v15, "No column named '%s' found.", v16, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1BA99BA00](v17, -1, -1);
      MEMORY[0x1BA99BA00](v16, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    return 0;
  }
  int v9 = *(_DWORD *)(*(void *)(v6 + 56) + 4 * v7);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  int v10 = sqlite3_column_bytes((sqlite3_stmt *)objc_msgSend(v3, sel_rawStatement), v9);
  if (v10 < 1) {
    return 0;
  }
  unsigned int v11 = v10;
  Swift::String_optional result = sqlite3_column_blob((sqlite3_stmt *)objc_msgSend(v3, sel_rawStatement), v9);
  if (result) {
    return (unsigned char *)sub_1B5438970(result, v11);
  }
  __break(1u);
  return result;
}

uint64_t MNTraceSelectStatement.objectValue<A>(_:of:)()
{
  uint64_t v1 = (void *)sub_1B5531ED0();
  id v2 = objc_msgSend(v0, sel_dataValue_, v1);

  if (!v2) {
    return 0;
  }
  uint64_t v3 = sub_1B5531E70();
  unint64_t v5 = v4;

  sub_1B5438B88(0, &qword_1E9D54DC8);
  uint64_t v6 = sub_1B5531FA0();
  sub_1B5438A24(v3, v5);
  return v6;
}

uint64_t MNTraceSelectStatement.objectValue(_:ofClass:)()
{
  return MNTraceSelectStatement.objectValue<A>(_:of:)();
}

Swift::OpaquePointer_optional __swiftcall MNTraceSelectStatement.objectsValue(_:of:)(Swift::String _, Swift::OpaquePointer of)
{
  uint64_t v3 = (void *)sub_1B5531ED0();
  id v4 = objc_msgSend(v2, sel_dataValue_, v3);

  if (v4)
  {
    uint64_t v6 = sub_1B5531E70();
    unint64_t v8 = v7;

    sub_1B5438B88(0, &qword_1E9D54DC8);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D54DD0);
    uint64_t v9 = swift_allocObject();
    *(_OWORD *)(v9 + 16) = xmmword_1B55424B0;
    *(void *)(v9 + 32) = sub_1B5438B88(0, &qword_1E9D54DD8);
    uint64_t v11 = sub_1B5531FB0();
    swift_bridgeObjectRelease();
    if (v11)
    {
      uint64_t v12 = sub_1B54368A4(v11);
      sub_1B5438A24(v6, v8);
      swift_bridgeObjectRelease();
      int v10 = (void *)v12;
      goto LABEL_7;
    }
    sub_1B5438A24(v6, v8);
  }
  int v10 = 0;
LABEL_7:
  result.value._rawValue = v10;
  result.is_nil = v5;
  return result;
}

uint64_t sub_1B54368A4(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D54E50);
    uint64_t v2 = sub_1B55320C0();
  }
  else
  {
    uint64_t v2 = MEMORY[0x1E4FBC868];
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
      uint64_t v11 = (v5 - 1) & v5;
      unint64_t v12 = __clz(__rbit64(v5)) | (v8 << 6);
      int64_t v13 = v8;
      goto LABEL_28;
    }
    int64_t v14 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
LABEL_44:
      __break(1u);
      goto LABEL_45;
    }
    if (v14 >= v27) {
      goto LABEL_42;
    }
    unint64_t v15 = *(void *)(v28 + 8 * v14);
    int64_t v13 = v8 + 1;
    if (!v15)
    {
      int64_t v13 = v8 + 2;
      if (v8 + 2 >= v27) {
        goto LABEL_42;
      }
      unint64_t v15 = *(void *)(v28 + 8 * v13);
      if (!v15)
      {
        int64_t v13 = v8 + 3;
        if (v8 + 3 >= v27) {
          goto LABEL_42;
        }
        unint64_t v15 = *(void *)(v28 + 8 * v13);
        if (!v15)
        {
          int64_t v13 = v8 + 4;
          if (v8 + 4 >= v27) {
            goto LABEL_42;
          }
          unint64_t v15 = *(void *)(v28 + 8 * v13);
          if (!v15) {
            break;
          }
        }
      }
    }
LABEL_27:
    uint64_t v11 = (v15 - 1) & v15;
    unint64_t v12 = __clz(__rbit64(v15)) + (v13 << 6);
LABEL_28:
    sub_1B5439258(*(void *)(a1 + 48) + 40 * v12, (uint64_t)v34);
    sub_1B54392B4(*(void *)(a1 + 56) + 32 * v12, (uint64_t)v35 + 8);
    v32[0] = v35[0];
    v32[1] = v35[1];
    uint64_t v33 = v36;
    v31[0] = v34[0];
    v31[1] = v34[1];
    uint64_t v17 = (void *)sub_1B5532020();
    self;
    uint64_t v18 = swift_dynamicCastObjCClass();
    if (!v18)
    {

      sub_1B5439310((uint64_t)v31);
      swift_release();
      goto LABEL_41;
    }
    uint64_t v19 = v18;
    sub_1B54392B4((uint64_t)v32 + 8, (uint64_t)v30);
    sub_1B5439310((uint64_t)v31);
    if ((swift_dynamicCast() & 1) == 0)
    {

      swift_release();
      swift_unknownObjectRelease();
LABEL_41:
      sub_1B5439370();
      swift_release();
      return 0;
    }
    uint64_t result = sub_1B5531FD0();
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
          goto LABEL_44;
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
    uint64_t v10 = 8 * v9;
    *(void *)(*(void *)(v2 + 48) + v10) = v19;
    *(void *)(*(void *)(v2 + 56) + v10) = v29;
    ++*(void *)(v2 + 16);
    int64_t v8 = v13;
    unint64_t v5 = v11;
  }
  int64_t v16 = v8 + 5;
  if (v8 + 5 >= v27)
  {
LABEL_42:
    swift_release();
    sub_1B5439370();
    return v2;
  }
  unint64_t v15 = *(void *)(v28 + 8 * v16);
  if (v15)
  {
    int64_t v13 = v8 + 5;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v13 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v13 >= v27) {
      goto LABEL_42;
    }
    unint64_t v15 = *(void *)(v28 + 8 * v13);
    ++v16;
    if (v15) {
      goto LABEL_27;
    }
  }
LABEL_45:
  __break(1u);
  return result;
}

id MNTraceSelectStatementBuilder.__allocating_init(trace:tableName:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v7 = (char *)objc_allocWithZone(v3);
  *(void *)&v7[OBJC_IVAR____TtC10Navigation29MNTraceSelectStatementBuilder__columns] = MEMORY[0x1E4FBC860];
  *(void *)&v7[OBJC_IVAR____TtC10Navigation29MNTraceSelectStatementBuilder__trace] = a1;
  int64_t v8 = &v7[OBJC_IVAR____TtC10Navigation29MNTraceSelectStatementBuilder__tableName];
  *(void *)int64_t v8 = a2;
  *((void *)v8 + 1) = a3;
  v10.receiver = v7;
  v10.super_class = v3;
  return objc_msgSendSuper2(&v10, sel_init);
}

id MNTraceSelectStatementBuilder.init(trace:tableName:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)&v3[OBJC_IVAR____TtC10Navigation29MNTraceSelectStatementBuilder__columns] = MEMORY[0x1E4FBC860];
  *(void *)&v3[OBJC_IVAR____TtC10Navigation29MNTraceSelectStatementBuilder__trace] = a1;
  uint64_t v4 = &v3[OBJC_IVAR____TtC10Navigation29MNTraceSelectStatementBuilder__tableName];
  *(void *)uint64_t v4 = a2;
  *((void *)v4 + 1) = a3;
  v6.receiver = v3;
  v6.super_class = (Class)type metadata accessor for MNTraceSelectStatementBuilder();
  return objc_msgSendSuper2(&v6, sel_init);
}

uint64_t sub_1B5436F04(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void **)(v2 + OBJC_IVAR____TtC10Navigation29MNTraceSelectStatementBuilder__columns);
  swift_beginAccess();
  objc_super v6 = *v5;
  swift_bridgeObjectRetain();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *unint64_t v5 = v6;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    objc_super v6 = sub_1B5437AF4(0, v6[2] + 1, 1, v6);
    *unint64_t v5 = v6;
  }
  unint64_t v9 = v6[2];
  unint64_t v8 = v6[3];
  if (v9 >= v8 >> 1)
  {
    objc_super v6 = sub_1B5437AF4((void *)(v8 > 1), v9 + 1, 1, v6);
    *unint64_t v5 = v6;
  }
  v6[2] = v9 + 1;
  objc_super v10 = &v6[2 * v9];
  v10[4] = a1;
  v10[5] = a2;
  return swift_endAccess();
}

uint64_t sub_1B54370F4()
{
  swift_beginAccess();
  uint64_t v0 = swift_bridgeObjectRetain();
  sub_1B5437150(v0);
  return swift_endAccess();
}

uint64_t sub_1B5437150(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = *(void **)v1;
  int64_t v4 = *(void *)(*(void *)v1 + 16);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  char isUniquelyReferenced_nonNull_native = (void *)swift_isUniquelyReferenced_nonNull_native();
  if (isUniquelyReferenced_nonNull_native && v5 <= v3[3] >> 1)
  {
    if (*(void *)(a1 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_18;
  }
  if (v4 <= v5) {
    int64_t v14 = v4 + v2;
  }
  else {
    int64_t v14 = v4;
  }
  uint64_t v3 = sub_1B5437AF4(isUniquelyReferenced_nonNull_native, v14, 1, v3);
  if (!*(void *)(a1 + 16))
  {
LABEL_18:
    if (!v2) {
      goto LABEL_19;
    }
    goto LABEL_21;
  }
LABEL_5:
  uint64_t v8 = v3[2];
  if ((v3[3] >> 1) - v8 < v2)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  unint64_t v9 = (unint64_t)&v3[2 * v8 + 4];
  if (a1 + 32 < v9 + 16 * v2 && v9 < a1 + 32 + 16 * v2) {
    goto LABEL_24;
  }
  swift_arrayInitWithCopy();
  if (!v2)
  {
LABEL_19:
    uint64_t result = swift_bridgeObjectRelease();
    *(void *)uint64_t v1 = v3;
    return result;
  }
  uint64_t v11 = v3[2];
  BOOL v12 = __OFADD__(v11, v2);
  uint64_t v13 = v11 + v2;
  if (!v12)
  {
    v3[2] = v13;
    goto LABEL_19;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  uint64_t result = sub_1B55320D0();
  __break(1u);
  return result;
}

uint64_t sub_1B5437330()
{
  uint64_t v2 = v1;
  uint64_t v3 = v0 + OBJC_IVAR____TtC10Navigation29MNTraceSelectStatementBuilder__columns;
  swift_beginAccess();
  if (*(void *)(*(void *)v3 + 16))
  {
    sub_1B5532030();
    swift_bridgeObjectRelease();
    id v18 = *(id *)v3;
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D54DF8);
    sub_1B5438AE4();
    sub_1B5531EC0();
    swift_bridgeObjectRelease();
    sub_1B5531F10();
    swift_bridgeObjectRelease();
    sub_1B5531F10();
    swift_bridgeObjectRetain();
    sub_1B5531F10();
    swift_bridgeObjectRelease();
    sub_1B5531F10();
    int64_t v4 = *(void **)(v0 + OBJC_IVAR____TtC10Navigation29MNTraceSelectStatementBuilder__trace);
    id v5 = objc_allocWithZone((Class)type metadata accessor for MNTraceSelectStatement());
    id v6 = v4;
    swift_bridgeObjectRetain();
    unint64_t v7 = v6;
    uint64_t v8 = v2;
    id v9 = sub_1B5435508(v7);
    if (v2)
    {
      id v10 = v2;
      uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D54E08);
      sub_1B5438B88(0, &qword_1E9D54E10);
      if (swift_dynamicCast())
      {

        uint64_t v0 = (uint64_t)v18;
        id v11 = objc_msgSend(v18, sel_debugDescription);
        uint64_t v12 = sub_1B5531EE0();
        uint64_t v14 = v13;

        sub_1B5438BC4();
        swift_allocError();
        *unint64_t v15 = 0x205443454C4553;
        v15[1] = 0xE700000000000000;
        v15[2] = v12;
        v15[3] = v14;
        swift_willThrow();
      }
      else
      {
        swift_bridgeObjectRelease();
      }
    }
    else
    {
      uint64_t v0 = (uint64_t)v9;
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    sub_1B5438BC4();
    swift_allocError();
    *int64_t v16 = 0u;
    v16[1] = 0u;
    swift_willThrow();
  }
  return v0;
}

uint64_t sub_1B5437688()
{
  return sub_1B5437330();
}

id MNTraceSelectStatementBuilder.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void MNTraceSelectStatementBuilder.init()()
{
}

id MNTraceSelectStatementBuilder.__deallocating_deinit()
{
  return sub_1B543796C(type metadata accessor for MNTraceSelectStatementBuilder);
}

id sub_1B543796C(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

unint64_t MNTraceSelectStatementBuilder.Error.errorDescription.getter()
{
  if (!*(void *)(v0 + 8)) {
    return 0xD000000000000039;
  }
  sub_1B5532030();
  sub_1B5531F10();
  sub_1B5531F10();
  sub_1B5531F10();
  sub_1B5531F10();
  return 0;
}

void *sub_1B5437AF4(void *result, int64_t a2, char a3, void *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D54E48);
      id v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
      uint64_t v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      id v10 = (void *)MEMORY[0x1E4FBC860];
      uint64_t v13 = (void *)(MEMORY[0x1E4FBC860] + 32);
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[2 * v8 + 4]) {
          memmove(v13, a4 + 4, 16 * v8);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_1B5439160(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_1B5437C04(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_1B5437CD8(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_1B54392B4((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    uint64_t ObjectType = MEMORY[0x1E4FBB9B0];
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_1B54392B4((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_1B5437CD8(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_1B5532000();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_1B5437E94(a5, a6);
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
  uint64_t v8 = sub_1B5532060();
  if (!v8)
  {
    sub_1B5532070();
    __break(1u);
LABEL_17:
    uint64_t result = sub_1B55320D0();
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

uint64_t sub_1B5437E94(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_1B5437F2C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_1B543810C(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_1B543810C(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_1B5437F2C(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_1B54380A4(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_1B5532040();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_1B5532070();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_1B5531F40();
      if (!v2) {
        return MEMORY[0x1E4FBC860];
      }
    }
    sub_1B55320D0();
    __break(1u);
LABEL_14:
    uint64_t result = sub_1B5532070();
    __break(1u);
  }
  else
  {
    return MEMORY[0x1E4FBC860];
  }
  return result;
}

void *sub_1B54380A4(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return (void *)MEMORY[0x1E4FBC860];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D54E60);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_1B543810C(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D54E60);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x1E4FBC860];
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
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
  uint64_t result = sub_1B55320D0();
  __break(1u);
  return result;
}

unint64_t sub_1B543825C(uint64_t a1, uint64_t a2)
{
  sub_1B5532170();
  sub_1B5531EF0();
  uint64_t v4 = sub_1B5532180();
  return sub_1B5438618(a1, a2, v4);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_1B543830C(uint64_t a1, char a2)
{
  unint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D54E40);
  char v37 = a2;
  uint64_t v6 = sub_1B55320B0();
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
  v34 = v2;
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
    unint64_t v22 = (void *)(v5 + 64);
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
          unint64_t v3 = v34;
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
    uint64_t v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v20);
    uint64_t v31 = *v29;
    uint64_t v30 = v29[1];
    int v32 = *(_DWORD *)(*(void *)(v5 + 56) + 4 * v20);
    if ((v37 & 1) == 0) {
      swift_bridgeObjectRetain();
    }
    sub_1B5532170();
    sub_1B5531EF0();
    uint64_t result = sub_1B5532180();
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
    id v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    *id v18 = v31;
    v18[1] = v30;
    *(_DWORD *)(*(void *)(v7 + 56) + 4 * v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  unint64_t v3 = v34;
  unint64_t v22 = (void *)(v5 + 64);
  if ((v37 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v33 = 1 << *(unsigned char *)(v5 + 32);
  if (v33 >= 64) {
    bzero(v22, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *unint64_t v22 = -1 << v33;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *unint64_t v3 = v7;
  return result;
}

unint64_t sub_1B5438618(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    unint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_1B55320F0() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        int64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_1B55320F0() & 1) == 0);
    }
  }
  return v6;
}

void *sub_1B54386FC()
{
  id v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D54E40);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_1B55320A0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    uint64_t *v1 = v4;
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
    unint64_t v12 = (v23 - 1) & v23;
    unint64_t v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    unint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    uint64_t v20 = 4 * v15;
    LODWORD(v17) = *(_DWORD *)(*(void *)(v2 + 56) + v20);
    int64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *int64_t v21 = v19;
    v21[1] = v18;
    *(_DWORD *)(*(void *)(v4 + 56) + v20) = v17;
    uint64_t result = (void *)swift_bridgeObjectRetain();
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

uint64_t sub_1B54388AC(unsigned char *__src, unsigned char *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (__src) {
    unint64_t v2 = a2 - __src;
  }
  else {
    unint64_t v2 = 0;
  }
  if ((v2 & 0x8000000000000000) != 0)
  {
    __break(1u);
LABEL_11:
    __break(1u);
  }
  if (v2 > 0xFF) {
    goto LABEL_11;
  }
  memset(__dst, 0, sizeof(__dst));
  char v5 = v2;
  if (__src && a2 != __src) {
    memcpy(__dst, __src, a2 - __src);
  }
  return *(void *)__dst;
}

uint64_t sub_1B5438970(unsigned char *__src, uint64_t a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 <= 14) {
    return sub_1B54388AC(__src, &__src[a2]);
  }
  sub_1B5531E00();
  swift_allocObject();
  sub_1B5531DC0();
  if ((unint64_t)a2 < 0x7FFFFFFF) {
    return a2 << 32;
  }
  sub_1B5531E50();
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = 0;
  *(void *)(result + 24) = a2;
  return result;
}

uint64_t sub_1B5438A24(uint64_t a1, unint64_t a2)
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

uint64_t type metadata accessor for MNTraceSelectStatementBuilder()
{
  return self;
}

unint64_t sub_1B5438AE4()
{
  unint64_t result = qword_1E9D54E00;
  if (!qword_1E9D54E00)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9D54DF8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9D54E00);
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

uint64_t sub_1B5438B88(uint64_t a1, unint64_t *a2)
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

unint64_t sub_1B5438BC4()
{
  unint64_t result = qword_1E9D54E18;
  if (!qword_1E9D54E18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9D54E18);
  }
  return result;
}

uint64_t method lookup function for MNTraceSelectStatement(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for MNTraceSelectStatement);
}

uint64_t method lookup function for MNTraceSelectStatementBuilder(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for MNTraceSelectStatementBuilder);
}

uint64_t dispatch thunk of MNTraceSelectStatementBuilder.__allocating_init(trace:tableName:)()
{
  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t dispatch thunk of MNTraceSelectStatementBuilder.addColumn(_:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x70))();
}

uint64_t dispatch thunk of MNTraceSelectStatementBuilder.addColumns(_:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x78))();
}

uint64_t dispatch thunk of MNTraceSelectStatementBuilder.selectStatement()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x80))();
}

uint64_t dispatch thunk of MNTraceSelectStatementBuilder.selectStatementNoThrow()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x88))();
}

uint64_t initializeBufferWithCopyOfBuffer for MNTraceSelectStatementBuilder.Error(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

unint64_t destroy for MNTraceSelectStatementBuilder.Error(uint64_t a1)
{
  unint64_t result = *(void *)(a1 + 8);
  if (result >= 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t initializeWithCopy for MNTraceSelectStatementBuilder.Error(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(a2 + 8);
  if (v3 < 0xFFFFFFFF)
  {
    long long v5 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v5;
  }
  else
  {
    *(void *)a1 = *(void *)a2;
    *(void *)(a1 + 8) = v3;
    uint64_t v4 = *(void *)(a2 + 24);
    *(void *)(a1 + 16) = *(void *)(a2 + 16);
    *(void *)(a1 + 24) = v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

void *assignWithCopy for MNTraceSelectStatementBuilder.Error(void *a1, void *a2)
{
  unint64_t v4 = a2[1];
  if (a1[1] < 0xFFFFFFFFuLL)
  {
    if (v4 >= 0xFFFFFFFF)
    {
      *a1 = *a2;
      a1[1] = a2[1];
      a1[2] = a2[2];
      a1[3] = a2[3];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      return a1;
    }
LABEL_7:
    long long v5 = *((_OWORD *)a2 + 1);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *((_OWORD *)a1 + 1) = v5;
    return a1;
  }
  if (v4 < 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_7;
  }
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
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

uint64_t assignWithTake for MNTraceSelectStatementBuilder.Error(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 8) < 0xFFFFFFFFuLL) {
    goto LABEL_5;
  }
  unint64_t v4 = *(void *)(a2 + 8);
  if (v4 < 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_5:
    long long v6 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v6;
    return a1;
  }
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for MNTraceSelectStatementBuilder.Error(uint64_t a1, unsigned int a2)
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
  if ((v3 + 1) >= 2) {
    return v3;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for MNTraceSelectStatementBuilder.Error(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_OWORD *)__n128 result = 0u;
    *(_OWORD *)(result + 16) = 0u;
    *(_DWORD *)__n128 result = a2 - 0x7FFFFFFF;
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

uint64_t sub_1B543903C(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 8);
  if (v1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  return (v1 + 1);
}

void *sub_1B5439058(void *result, int a2)
{
  if (a2 < 0)
  {
    result[2] = 0;
    result[3] = 0;
    *__n128 result = a2 ^ 0x80000000;
    result[1] = 0;
  }
  else if (a2)
  {
    result[1] = (a2 - 1);
  }
  return result;
}

ValueMetadata *type metadata accessor for MNTraceSelectStatementBuilder.Error()
{
  return &type metadata for MNTraceSelectStatementBuilder.Error;
}

void type metadata accessor for GEOOfflineState()
{
  if (!qword_1E9D54E28)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_1E9D54E28);
    }
  }
}

unint64_t sub_1B54390E4()
{
  unint64_t result = qword_1E9D54E38;
  if (!qword_1E9D54E38)
  {
    sub_1B5438B88(255, &qword_1E9D54DD8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9D54E38);
  }
  return result;
}

uint64_t sub_1B543914C(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_1B5438A24(a1, a2);
  }
  return a1;
}

uint64_t sub_1B5439160(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 16 * a1 + 32;
    unint64_t v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_1B55320D0();
  __break(1u);
  return result;
}

uint64_t sub_1B5439258(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_1B54392B4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_1B5439310(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D54E58);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1B5439370()
{
  return swift_release();
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

void *MNNavigationServiceCallback_DidUpdateNavTrayGuidance.navTrayGuidanceEvent.getter()
{
  uint64_t v1 = *(void **)(v0
                + OBJC_IVAR____TtC10Navigation52MNNavigationServiceCallback_DidUpdateNavTrayGuidance_navTrayGuidanceEvent);
  id v2 = v1;
  return v1;
}

id MNNavigationServiceCallback_DidUpdateNavTrayGuidance.__allocating_init(navTrayGuidanceEvent:)(uint64_t a1)
{
  return sub_1B5439A48(a1, &OBJC_IVAR____TtC10Navigation52MNNavigationServiceCallback_DidUpdateNavTrayGuidance_navTrayGuidanceEvent);
}

id MNNavigationServiceCallback_DidUpdateNavTrayGuidance.init(navTrayGuidanceEvent:)(uint64_t a1)
{
  return sub_1B5439AC0(a1, &OBJC_IVAR____TtC10Navigation52MNNavigationServiceCallback_DidUpdateNavTrayGuidance_navTrayGuidanceEvent, type metadata accessor for MNNavigationServiceCallback_DidUpdateNavTrayGuidance);
}

uint64_t type metadata accessor for MNNavigationServiceCallback_DidUpdateNavTrayGuidance()
{
  return self;
}

id MNNavigationServiceCallback_DidUpdateNavTrayGuidance.init(coder:)(void *a1)
{
  type metadata accessor for MNNavTrayGuidanceEvent(0);
  uint64_t v3 = v1;
  *(void *)&v3[OBJC_IVAR____TtC10Navigation52MNNavigationServiceCallback_DidUpdateNavTrayGuidance_navTrayGuidanceEvent] = sub_1B5531FC0();

  v6.receiver = v3;
  v6.super_class = (Class)type metadata accessor for MNNavigationServiceCallback_DidUpdateNavTrayGuidance();
  id v4 = objc_msgSendSuper2(&v6, sel_initWithCoder_, a1);

  return v4;
}

void MNNavigationServiceCallback_DidUpdateNavTrayGuidance.init()()
{
}

id MNNavigationServiceCallback_DidUpdateNavTrayGuidance.__deallocating_deinit()
{
  return sub_1B5439E1C(type metadata accessor for MNNavigationServiceCallback_DidUpdateNavTrayGuidance);
}

uint64_t MNNavigationServiceCallback_DidUpdateTargetLegIndex.targetLegIndex.getter()
{
  return *(void *)(v0
                   + OBJC_IVAR____TtC10Navigation51MNNavigationServiceCallback_DidUpdateTargetLegIndex_targetLegIndex);
}

id MNNavigationServiceCallback_DidUpdateTargetLegIndex.__allocating_init(targetLegIndex:)(uint64_t a1)
{
  return sub_1B5439A48(a1, &OBJC_IVAR____TtC10Navigation51MNNavigationServiceCallback_DidUpdateTargetLegIndex_targetLegIndex);
}

id MNNavigationServiceCallback_DidUpdateTargetLegIndex.init(targetLegIndex:)(uint64_t a1)
{
  return sub_1B5439AC0(a1, &OBJC_IVAR____TtC10Navigation51MNNavigationServiceCallback_DidUpdateTargetLegIndex_targetLegIndex, type metadata accessor for MNNavigationServiceCallback_DidUpdateTargetLegIndex);
}

uint64_t type metadata accessor for MNNavigationServiceCallback_DidUpdateTargetLegIndex()
{
  return self;
}

id MNNavigationServiceCallback_DidUpdateTargetLegIndex.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

id MNNavigationServiceCallback_DidUpdateTargetLegIndex.init(coder:)(void *a1)
{
  return sub_1B5439BD8(a1, 0x654C746567726174, 0xEE007865646E4967, &OBJC_IVAR____TtC10Navigation51MNNavigationServiceCallback_DidUpdateTargetLegIndex_targetLegIndex, type metadata accessor for MNNavigationServiceCallback_DidUpdateTargetLegIndex);
}

id MNNavigationServiceCallback_DidUpdateTargetLegIndex.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void MNNavigationServiceCallback_DidUpdateTargetLegIndex.init()()
{
}

id MNNavigationServiceCallback_DidUpdateTargetLegIndex.__deallocating_deinit()
{
  return sub_1B5439E1C(type metadata accessor for MNNavigationServiceCallback_DidUpdateTargetLegIndex);
}

uint64_t MNNavigationServiceCallback_DidUpdateUpcomingAnchorPointIndex.anchorPointIndex.getter()
{
  return *(void *)(v0
                   + OBJC_IVAR____TtC10Navigation61MNNavigationServiceCallback_DidUpdateUpcomingAnchorPointIndex_anchorPointIndex);
}

id MNNavigationServiceCallback_DidUpdateUpcomingAnchorPointIndex.__allocating_init(anchorPointIndex:)(uint64_t a1)
{
  return sub_1B5439A48(a1, &OBJC_IVAR____TtC10Navigation61MNNavigationServiceCallback_DidUpdateUpcomingAnchorPointIndex_anchorPointIndex);
}

id sub_1B5439A48(uint64_t a1, void *a2)
{
  unint64_t v5 = (char *)objc_allocWithZone(v2);
  *(void *)&v5[*a2] = a1;
  v7.receiver = v5;
  v7.super_class = v2;
  return objc_msgSendSuper2(&v7, sel_init);
}

id MNNavigationServiceCallback_DidUpdateUpcomingAnchorPointIndex.init(anchorPointIndex:)(uint64_t a1)
{
  return sub_1B5439AC0(a1, &OBJC_IVAR____TtC10Navigation61MNNavigationServiceCallback_DidUpdateUpcomingAnchorPointIndex_anchorPointIndex, type metadata accessor for MNNavigationServiceCallback_DidUpdateUpcomingAnchorPointIndex);
}

id sub_1B5439AC0(uint64_t a1, void *a2, uint64_t (*a3)(void))
{
  *(void *)&v3[*a2] = a1;
  v5.receiver = v3;
  v5.super_class = (Class)a3();
  return objc_msgSendSuper2(&v5, sel_init);
}

uint64_t type metadata accessor for MNNavigationServiceCallback_DidUpdateUpcomingAnchorPointIndex()
{
  return self;
}

id sub_1B5439B44(char *a1, uint64_t a2, uint64_t a3, void *a4, uint64_t (*a5)(void))
{
  *(void *)&a1[*a4] = a3;
  v6.receiver = a1;
  v6.super_class = (Class)a5();
  return objc_msgSendSuper2(&v6, sel_init);
}

id MNNavigationServiceCallback_DidUpdateUpcomingAnchorPointIndex.init(coder:)(void *a1)
{
  return sub_1B5439BD8(a1, 0xD000000000000010, 0x80000001B5543390, &OBJC_IVAR____TtC10Navigation61MNNavigationServiceCallback_DidUpdateUpcomingAnchorPointIndex_anchorPointIndex, type metadata accessor for MNNavigationServiceCallback_DidUpdateUpcomingAnchorPointIndex);
}

id sub_1B5439BD8(void *a1, uint64_t a2, uint64_t a3, void *a4, uint64_t (*a5)(void))
{
  int64_t v9 = v5;
  uint64_t v10 = (void *)sub_1B5531ED0();
  id v11 = objc_msgSend(a1, sel_decodeIntegerForKey_, v10);

  *(void *)&v9[*a4] = v11;
  v14.receiver = v9;
  v14.super_class = (Class)a5();
  id v12 = objc_msgSendSuper2(&v14, sel_initWithCoder_, a1);

  return v12;
}

void sub_1B5439CEC(void *a1, uint64_t a2, void *a3, uint64_t (*a4)(void), void *a5)
{
  v11.receiver = a1;
  v11.super_class = (Class)a4();
  id v7 = a3;
  uint64_t v8 = (char *)v11.receiver;
  objc_msgSendSuper2(&v11, sel_encodeWithCoder_, v7);
  uint64_t v9 = *(void *)&v8[*a5];
  uint64_t v10 = (void *)sub_1B5531ED0();
  objc_msgSend(v7, sel_encodeInteger_forKey_, v9, v10, v11.receiver, v11.super_class);
}

void MNNavigationServiceCallback_DidUpdateUpcomingAnchorPointIndex.init()()
{
}

id MNNavigationServiceCallback_DidUpdateUpcomingAnchorPointIndex.__deallocating_deinit()
{
  return sub_1B5439E1C(type metadata accessor for MNNavigationServiceCallback_DidUpdateUpcomingAnchorPointIndex);
}

id sub_1B5439E1C(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

uint64_t method lookup function for MNNavigationServiceCallback_DidUpdateNavTrayGuidance(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for MNNavigationServiceCallback_DidUpdateNavTrayGuidance);
}

uint64_t dispatch thunk of MNNavigationServiceCallback_DidUpdateNavTrayGuidance.__allocating_init(navTrayGuidanceEvent:)()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t method lookup function for MNNavigationServiceCallback_DidUpdateTargetLegIndex(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for MNNavigationServiceCallback_DidUpdateTargetLegIndex);
}

uint64_t dispatch thunk of MNNavigationServiceCallback_DidUpdateTargetLegIndex.__allocating_init(targetLegIndex:)()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t method lookup function for MNNavigationServiceCallback_DidUpdateUpcomingAnchorPointIndex(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for MNNavigationServiceCallback_DidUpdateUpcomingAnchorPointIndex);
}

uint64_t dispatch thunk of MNNavigationServiceCallback_DidUpdateUpcomingAnchorPointIndex.__allocating_init(anchorPointIndex:)()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t MNOfflineCoordinator.__allocating_init(navigationSessionState:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return MNOfflineCoordinator.init(navigationSessionState:)(a1);
}

uint64_t MNOfflineCoordinator.init(navigationSessionState:)(void *a1)
{
  swift_unknownObjectWeakInit();
  *(void *)&v1[OBJC_IVAR____TtC10Navigation20MNOfflineCoordinator__currentState] = 0;
  *(void *)&v1[OBJC_IVAR____TtC10Navigation20MNOfflineCoordinator__navigationSessionState] = 0;
  id v3 = &v1[OBJC_IVAR____TtC10Navigation20MNOfflineCoordinator__pendingRerouteFinishedState];
  *(_DWORD *)id v3 = 0;
  v3[4] = 1;
  v8.receiver = v1;
  v8.super_class = (Class)type metadata accessor for MNOfflineCoordinator();
  id v4 = (char *)objc_msgSendSuper2(&v8, sel_init);
  objc_msgSend(v4, sel_setNavigationSessionState_, a1);
  type metadata accessor for MNOfflineCoordinatorState.Online();
  uint64_t v5 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v6 = OBJC_IVAR____TtC10Navigation20MNOfflineCoordinator__currentState;
  *(void *)&v4[OBJC_IVAR____TtC10Navigation20MNOfflineCoordinator__currentState] = v5;
  uint64_t result = swift_release();
  if (*(void *)&v4[v6])
  {
    swift_retain();

    swift_unknownObjectWeakAssign();
    swift_release();

    return (uint64_t)v4;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t type metadata accessor for MNOfflineCoordinator()
{
  return self;
}

uint64_t type metadata accessor for MNOfflineCoordinatorState.Online()
{
  return self;
}

uint64_t sub_1B543A0F4()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC10Navigation20MNOfflineCoordinator_delegate;
  swift_beginAccess();
  return MEMORY[0x1BA99BA60](v1);
}

uint64_t sub_1B543A194()
{
  return swift_unknownObjectRelease();
}

void (*sub_1B543A1F0(void *a1))(void **a1, char a2)
{
  id v3 = malloc(0x30uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR____TtC10Navigation20MNOfflineCoordinator_delegate;
  v3[4] = v1;
  v3[5] = v4;
  uint64_t v5 = v1 + v4;
  swift_beginAccess();
  v3[3] = MEMORY[0x1BA99BA60](v5);
  return sub_1B543A274;
}

void sub_1B543A274(void **a1, char a2)
{
  id v3 = *a1;
  swift_unknownObjectWeakAssign();
  if (a2)
  {
    swift_unknownObjectRelease();
    swift_endAccess();
  }
  else
  {
    swift_endAccess();
    swift_unknownObjectRelease();
  }
  free(v3);
}

void sub_1B543A2F4()
{
  uint64_t v1 = v0;
  if (qword_1E9D54DA8 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_1B5531EA0();
  __swift_project_value_buffer(v2, (uint64_t)qword_1E9D578F8);
  id v3 = sub_1B5531E80();
  os_log_type_t v4 = sub_1B5531F90();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_1B542B000, v3, v4, "Taking control over offline service state.", v5, 2u);
    MEMORY[0x1BA99BA00](v5, -1, -1);
  }

  id v6 = objc_msgSend(self, sel_shared);
  objc_msgSend(v6, sel_setDelegate_, v1);
  objc_msgSend(v6, sel_startServiceIfEnabled);
}

uint64_t sub_1B543A480()
{
  return sub_1B543A4B0((void (*)(void))type metadata accessor for MNOfflineCoordinatorState.Offline);
}

uint64_t sub_1B543A498()
{
  return sub_1B543A4B0((void (*)(void))type metadata accessor for MNOfflineCoordinatorState.Online);
}

uint64_t sub_1B543A4B0(void (*a1)(void))
{
  a1(0);
  uint64_t v2 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v3 = OBJC_IVAR____TtC10Navigation20MNOfflineCoordinator__currentState;
  *(void *)(v1 + OBJC_IVAR____TtC10Navigation20MNOfflineCoordinator__currentState) = v2;
  swift_retain();
  uint64_t result = swift_release();
  if (!*(void *)(v1 + v3))
  {
    __break(1u);
    goto LABEL_7;
  }
  uint64_t result = swift_unknownObjectWeakAssign();
  uint64_t v5 = *(void *)(v1 + v3);
  if (!v5)
  {
LABEL_7:
    __break(1u);
    return result;
  }
  id v6 = *(void (**)(uint64_t))(*(void *)v5 + 96);
  uint64_t v7 = swift_retain();
  v6(v7);
  swift_release();
  return swift_release();
}

id MNOfflineCoordinator.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void MNOfflineCoordinator.init()()
{
}

id MNOfflineCoordinator.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MNOfflineCoordinator();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id MNOfflineCoordinator.navigationSessionState.getter()
{
  id result = *(id *)(v0 + OBJC_IVAR____TtC10Navigation20MNOfflineCoordinator__navigationSessionState);
  if (result) {
    return result;
  }
  __break(1u);
  return result;
}

void MNOfflineCoordinator.navigationSessionState.setter(NSObject *a1)
{
  objc_super v2 = v1;
  uint64_t v4 = OBJC_IVAR____TtC10Navigation20MNOfflineCoordinator__navigationSessionState;
  id v5 = objc_msgSend(*(id *)&v1[OBJC_IVAR____TtC10Navigation20MNOfflineCoordinator__navigationSessionState], sel_currentRouteInfo);
  id v6 = objc_msgSend(v5, sel_route);

  id v7 = [a1 currentRouteInfo];
  id v8 = objc_msgSend(v7, sel_route);

  [a1 copy];
  sub_1B5532010();
  swift_unknownObjectRelease();
  sub_1B5438B88(0, &qword_1E9D54DA0);
  int v9 = swift_dynamicCast();
  uint64_t v10 = v70;
  if (!v9) {
    uint64_t v10 = 0;
  }
  objc_super v11 = *(void **)&v2[v4];
  *(void *)&v2[v4] = v10;

  if (!v8)
  {
    if (qword_1E9D54DA8 != -1) {
      swift_once();
    }
    uint64_t v25 = sub_1B5531EA0();
    __swift_project_value_buffer(v25, (uint64_t)qword_1E9D578F8);
    unint64_t v26 = sub_1B5531E80();
    os_log_type_t v27 = sub_1B5531F70();
    if (os_log_type_enabled(v26, v27))
    {
      uint64_t v28 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v28 = 0;
      _os_log_impl(&dword_1B542B000, v26, v27, "Got a nil route, which should not happen.", v28, 2u);
      MEMORY[0x1BA99BA00](v28, -1, -1);
      id v12 = v6;
    }
    else
    {
      id v12 = v26;
      unint64_t v26 = a1;
      a1 = v6;
    }
    goto LABEL_38;
  }
  id v12 = v8;
  if (!v6) {
    goto LABEL_24;
  }
  int64_t v13 = v6;
  if (([v13 isOfflineRoute] & 1) != 0
    || ([v12 isOfflineRoute] & 1) == 0)
  {
    goto LABEL_23;
  }
  id v14 = objc_msgSend(self, sel_shared);
  unsigned __int8 v15 = objc_msgSend(v14, sel_state);

  if (v15 == 2)
  {
    if (qword_1E9D54DA8 != -1) {
      swift_once();
    }
    uint64_t v16 = sub_1B5531EA0();
    __swift_project_value_buffer(v16, (uint64_t)qword_1E9D578F8);
    unint64_t v17 = sub_1B5531E80();
    os_log_type_t v18 = sub_1B5531F90();
    if (!os_log_type_enabled(v17, v18)) {
      goto LABEL_22;
    }
    os_log_type_t type = v18;
    uint64_t v19 = (uint8_t *)swift_slowAlloc();
    os_log_t log = (os_log_t)swift_slowAlloc();
    v71[0] = (uint64_t)log;
    *(_DWORD *)uint64_t v19 = 136315138;
    buf = v19;
    id v20 = (id)GEOOfflineModeAsString();
    uint64_t v21 = sub_1B5531EE0();
    unint64_t v23 = v22;

    sub_1B5437C04(v21, v23, v71);
    sub_1B5531FF0();
    swift_bridgeObjectRelease();
  }
  else
  {
    if (qword_1E9D54DA8 != -1) {
      swift_once();
    }
    uint64_t v29 = sub_1B5531EA0();
    __swift_project_value_buffer(v29, (uint64_t)qword_1E9D578F8);
    unint64_t v17 = sub_1B5531E80();
    os_log_type_t v30 = sub_1B5531F90();
    if (!os_log_type_enabled(v17, v30)) {
      goto LABEL_22;
    }
    os_log_type_t type = v30;
    uint64_t v31 = (uint8_t *)swift_slowAlloc();
    os_log_t log = (os_log_t)swift_slowAlloc();
    v71[0] = (uint64_t)log;
    *(_DWORD *)uint64_t v31 = 136315138;
    buf = v31;
    id v32 = (id)GEOOfflineModeAsString();
    uint64_t v33 = sub_1B5531EE0();
    unint64_t v35 = v34;

    sub_1B5437C04(v33, v35, v71);
    sub_1B5531FF0();
    swift_bridgeObjectRelease();
          "il the OfflineService tells us to.";
  }
  _os_log_impl(&dword_1B542B000, v17, type, v24, buf, 0xCu);
  swift_arrayDestroy();
  MEMORY[0x1BA99BA00](log, -1, -1);
  MEMORY[0x1BA99BA00](buf, -1, -1);
LABEL_22:

LABEL_23:
  sub_1B5438B88(0, &qword_1E9D54DB8);
  uint64_t v36 = v12;
  char v37 = v13;
  char v38 = sub_1B5531FE0();

  if ((v38 & 1) == 0) {
LABEL_24:
  }
    sub_1B543CDD4((uint64_t)[a1 lastRerouteReason]);
  if ([a1 navigationState] == 5) {
    goto LABEL_37;
  }
  v39 = (unsigned int *)&v2[OBJC_IVAR____TtC10Navigation20MNOfflineCoordinator__pendingRerouteFinishedState];
  if (v2[OBJC_IVAR____TtC10Navigation20MNOfflineCoordinator__pendingRerouteFinishedState + 4] == 1) {
    goto LABEL_37;
  }
  uint64_t v40 = *v39;
  if (qword_1E9D54DA8 != -1) {
    swift_once();
  }
  uint64_t v41 = sub_1B5531EA0();
  __swift_project_value_buffer(v41, (uint64_t)qword_1E9D578F8);
  v42 = v2;
  v43 = sub_1B5531E80();
  os_log_type_t v44 = sub_1B5531F90();
  v45 = &OBJC_IVAR___MNCoreLocationProvider__desiredAccuracy;
  if (os_log_type_enabled(v43, v44))
  {
    os_log_type_t bufa = v44;
    loga = v43;
    uint64_t v46 = swift_slowAlloc();
    uint64_t v63 = swift_slowAlloc();
    v71[0] = v63;
    *(_DWORD *)uint64_t v46 = 136315650;
    *(void *)typea = v40;
    id v47 = (id)GEOOfflineStateAsString();
    uint64_t v48 = sub_1B5531EE0();
    unint64_t v50 = v49;

    sub_1B5437C04(v48, v50, v71);
    sub_1B5531FF0();
    uint64_t v51 = swift_bridgeObjectRelease();
    *(_WORD *)(v46 + 12) = 2080;
    uint64_t v52 = *(void *)&v42[OBJC_IVAR____TtC10Navigation20MNOfflineCoordinator__currentState];
    if (v52)
    {
      uint64_t v53 = (*(uint64_t (**)(uint64_t))(*(void *)v52 + 104))(v51);
      unint64_t v55 = v54;
    }
    else
    {
      unint64_t v55 = 0xE700000000000000;
      uint64_t v53 = 0x6E776F6E6B6E55;
    }
    sub_1B5437C04(v53, v55, v71);
    sub_1B5531FF0();

    swift_bridgeObjectRelease();
    *(_WORD *)(v46 + 22) = 2080;
    id v56 = objc_msgSend(self, sel_shared);
    objc_msgSend(v56, sel_state);

    id v57 = (id)GEOOfflineStateAsString();
    uint64_t v58 = sub_1B5531EE0();
    unint64_t v60 = v59;

    sub_1B5437C04(v58, v60, v71);
    sub_1B5531FF0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1B542B000, loga, bufa, "We have a pending state and are no longer in the rerouting state. Attempting to apply: %s, current state: %s, offline state: %s", (uint8_t *)v46, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x1BA99BA00](v63, -1, -1);
    MEMORY[0x1BA99BA00](v46, -1, -1);

    uint64_t v40 = *(void *)typea;
    v45 = &OBJC_IVAR___MNCoreLocationProvider__desiredAccuracy;
  }
  else
  {
  }
  unsigned int *v39 = 0;
  *((unsigned char *)v39 + 4) = 1;
  uint64_t v61 = *(void *)&v42[*((void *)v45 + 465)];
  if (v61)
  {
    v62 = *(void (**)(uint64_t))(*(void *)v61 + 88);
    swift_retain();
    v62(v40);
    swift_release();
LABEL_37:

    unint64_t v26 = v12;
LABEL_38:

    return;
  }

  __break(1u);
}

void MNOfflineCoordinator.offlineService(_:wouldLikeToSwitchTo:)(uint64_t a1, __CFString *a2)
{
}

void sub_1B543AFF4(__CFString *a1)
{
  objc_super v2 = v1;
  uint64_t v4 = sub_1B5531EA0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790]();
  id v7 = (char *)&v42 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v8 = objc_msgSend(v2, sel_navigationSessionState);
  unsigned int v9 = objc_msgSend(v8, sel_navigationState);

  if (v9 == 5)
  {
    if (qword_1E9D54DA8 != -1) {
      swift_once();
    }
    __swift_project_value_buffer(v4, (uint64_t)qword_1E9D578F8);
    uint64_t v10 = sub_1B5531E80();
    os_log_type_t v11 = sub_1B5531F90();
    if (os_log_type_enabled(v10, v11))
    {
      id v12 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v12 = 0;
      _os_log_impl(&dword_1B542B000, v10, v11, "NavigationSession is currently rerouting. Saving state as pending and will attempt later.", v12, 2u);
      MEMORY[0x1BA99BA00](v12, -1, -1);
    }

    goto LABEL_7;
  }
  id v14 = *(void **)&v2[OBJC_IVAR____TtC10Navigation20MNOfflineCoordinator__navigationSessionState];
  if (!v14)
  {
    __break(1u);
    goto LABEL_37;
  }
  id v15 = objc_msgSend(v14, sel_currentRouteInfo);
  id v16 = objc_msgSend(v15, sel_route);

  if (!v16)
  {
    if (qword_1E9D54DA8 != -1) {
      swift_once();
    }
    uint64_t v29 = __swift_project_value_buffer(v4, (uint64_t)qword_1E9D578F8);
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v29, v4);
    objc_super v2 = v2;
    os_log_type_t v30 = sub_1B5531E80();
    int v31 = sub_1B5531F70();
    if (os_log_type_enabled(v30, (os_log_type_t)v31))
    {
      int v44 = v31;
      LODWORD(v45) = a1;
      id v32 = (uint8_t *)swift_slowAlloc();
      uint64_t v43 = swift_slowAlloc();
      uint64_t v47 = v43;
      *(_DWORD *)id v32 = 136315138;
      id v33 = objc_msgSend(v2, sel_navigationSessionState);
      id v34 = objc_msgSend(v33, sel_navigationState);

      switch((int)v34)
      {
        case 0:
          unint64_t v35 = @"NOT_NAVIGATING";
          goto LABEL_33;
        case 1:
          unint64_t v35 = @"PROCEEDING_TO_ROUTE";
          goto LABEL_33;
        case 2:
          unint64_t v35 = @"ON_ROUTE";
          goto LABEL_33;
        case 3:
          unint64_t v35 = @"OFF_ROUTE_OFF_ROAD";
          goto LABEL_33;
        case 4:
          unint64_t v35 = @"OFF_ROUTE_ON_ROAD";
          goto LABEL_33;
        case 5:
          unint64_t v35 = @"RECALCULATING";
          goto LABEL_33;
        case 6:
          unint64_t v35 = @"END_OF_ROUTE";
          goto LABEL_33;
        case 7:
          unint64_t v35 = @"END_OF_SEGMENT";
          goto LABEL_33;
        case 8:
          unint64_t v35 = @"OUTSIDE_NAVIGABLE_AREA";
LABEL_33:
          uint64_t v36 = v35;
          break;
        default:
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v34);
          unint64_t v35 = (__CFString *)objc_claimAutoreleasedReturnValue();
          break;
      }
      char v37 = v35;
      if (!v37)
      {
LABEL_38:

        __break(1u);
        JUMPOUT(0x1B543B6A4);
      }
      a1 = v37;
      uint64_t v38 = sub_1B5531EE0();
      unint64_t v40 = v39;

      uint64_t v46 = sub_1B5437C04(v38, v40, &v47);
      sub_1B5531FF0();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1B542B000, v30, (os_log_type_t)v44, "We don't currently have a route for some reason. Navigation state: %s. Saving state as pending and will attempt later.", v32, 0xCu);
      uint64_t v41 = v43;
      swift_arrayDestroy();
      MEMORY[0x1BA99BA00](v41, -1, -1);
      MEMORY[0x1BA99BA00](v32, -1, -1);

      (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
      LODWORD(a1) = v45;
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    }
LABEL_7:
    int64_t v13 = &v2[OBJC_IVAR____TtC10Navigation20MNOfflineCoordinator__pendingRerouteFinishedState];
    *(_DWORD *)int64_t v13 = a1;
    v13[4] = 0;
    return;
  }
  unint64_t v17 = &v2[OBJC_IVAR____TtC10Navigation20MNOfflineCoordinator__pendingRerouteFinishedState];
  if ((v2[OBJC_IVAR____TtC10Navigation20MNOfflineCoordinator__pendingRerouteFinishedState + 4] & 1) == 0)
  {
    *(_DWORD *)unint64_t v17 = 0;
    v17[4] = 1;
    if (qword_1E9D54DA8 != -1) {
      swift_once();
    }
    __swift_project_value_buffer(v4, (uint64_t)qword_1E9D578F8);
    os_log_type_t v18 = sub_1B5531E80();
    os_log_type_t v19 = sub_1B5531F90();
    if (os_log_type_enabled(v18, v19))
    {
      id v20 = (uint8_t *)swift_slowAlloc();
      uint64_t v21 = swift_slowAlloc();
      uint64_t v47 = v21;
      *(_DWORD *)id v20 = 136315138;
      v45 = v20 + 4;
      id v22 = (id)GEOOfflineStateAsString();
      uint64_t v23 = sub_1B5531EE0();
      int64_t v24 = a1;
      unint64_t v26 = v25;

      uint64_t v46 = sub_1B5437C04(v23, v26, &v47);
      sub_1B5531FF0();
      a1 = v24;
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1B542B000, v18, v19, "We got a new state suggestion while we already have a pending state. Dropping pending state: %s", v20, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1BA99BA00](v21, -1, -1);
      MEMORY[0x1BA99BA00](v20, -1, -1);
    }
  }
  uint64_t v27 = *(void *)&v2[OBJC_IVAR____TtC10Navigation20MNOfflineCoordinator__currentState];
  if (!v27)
  {
LABEL_37:
    __break(1u);
    goto LABEL_38;
  }
  uint64_t v28 = *(void (**)(__CFString *))(*(void *)v27 + 88);
  swift_retain();
  v28(a1);
  swift_release();
}

void sub_1B543B734()
{
}

void sub_1B543B790()
{
}

void sub_1B543B7EC()
{
}

void sub_1B543B848(char a1)
{
  uint64_t v3 = v1 + 16;
  uint64_t v4 = MEMORY[0x1BA99BA60](v1 + 16);
  if (!v4)
  {
    __break(1u);
    goto LABEL_43;
  }
  uint64_t v5 = (void *)v4;
  uint64_t v6 = *(void **)(v4 + OBJC_IVAR____TtC10Navigation20MNOfflineCoordinator__navigationSessionState);
  if (!v6)
  {
LABEL_43:
    __break(1u);
    goto LABEL_44;
  }
  id v7 = objc_msgSend(v6, sel_currentRouteInfo);
  id v52 = objc_msgSend(v7, sel_route);

  if (!v52)
  {
LABEL_44:
    __break(1u);
    goto LABEL_45;
  }
  if (!a1)
  {
    if (qword_1E9D54DA8 != -1) {
      swift_once();
    }
    uint64_t v18 = sub_1B5531EA0();
    __swift_project_value_buffer(v18, (uint64_t)qword_1E9D578F8);
    os_log_type_t v19 = sub_1B5531E80();
    os_log_type_t v20 = sub_1B5531F70();
    if (os_log_type_enabled(v19, v20))
    {
      uint64_t v21 = (uint8_t *)swift_slowAlloc();
      uint64_t v22 = swift_slowAlloc();
      v53[0] = v22;
      *(_DWORD *)uint64_t v21 = 136315138;
      id v23 = (id)GEOOfflineModeAsString();
      uint64_t v24 = sub_1B5531EE0();
      unint64_t v26 = v25;

      uint64_t v54 = sub_1B5437C04(v24, v26, v53);
      sub_1B5531FF0();
      swift_bridgeObjectRelease();
      swift_arrayDestroy();
      uint64_t v27 = v22;
LABEL_30:
      MEMORY[0x1BA99BA00](v27, -1, -1);
      MEMORY[0x1BA99BA00](v21, -1, -1);

      goto LABEL_41;
    }
    goto LABEL_31;
  }
  if (a1 != 2)
  {
    if (a1 == 1)
    {
      if (!objc_msgSend(v52, sel_isOfflineRoute))
      {
        if (qword_1E9D54DA8 != -1) {
          swift_once();
        }
        uint64_t v41 = sub_1B5531EA0();
        __swift_project_value_buffer(v41, (uint64_t)qword_1E9D578F8);
        uint64_t v42 = sub_1B5531E80();
        os_log_type_t v43 = sub_1B5531F90();
        if (os_log_type_enabled(v42, v43))
        {
          int v44 = (uint8_t *)swift_slowAlloc();
          uint64_t v45 = swift_slowAlloc();
          v53[0] = v45;
          *(_DWORD *)int v44 = 136315138;
          id v46 = (id)GEOOfflineModeAsString();
          uint64_t v47 = sub_1B5531EE0();
          unint64_t v49 = v48;

          uint64_t v54 = sub_1B5437C04(v47, v49, v53);
          sub_1B5531FF0();
          swift_bridgeObjectRelease();
          swift_arrayDestroy();
          MEMORY[0x1BA99BA00](v45, -1, -1);
          MEMORY[0x1BA99BA00](v44, -1, -1);
        }

        uint64_t v50 = MEMORY[0x1BA99BA60](v3);
        if (v50)
        {
          uint64_t v51 = (void *)v50;
          sub_1B543A498();

          goto LABEL_41;
        }
LABEL_47:
        __break(1u);
LABEL_48:
        __break(1u);
        return;
      }
      if (qword_1E9D54DA8 != -1) {
        swift_once();
      }
      uint64_t v8 = sub_1B5531EA0();
      __swift_project_value_buffer(v8, (uint64_t)qword_1E9D578F8);
      unsigned int v9 = sub_1B5531E80();
      os_log_type_t v10 = sub_1B5531F90();
      if (os_log_type_enabled(v9, v10))
      {
        os_log_type_t v11 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)os_log_type_t v11 = 0;
        _os_log_impl(&dword_1B542B000, v9, v10, "Attempting to upgrade route to online.", v11, 2u);
        MEMORY[0x1BA99BA00](v11, -1, -1);
      }

      uint64_t v12 = MEMORY[0x1BA99BA60](v3);
      if (v12)
      {
        int64_t v13 = (void *)v12;
        uint64_t v14 = v12 + OBJC_IVAR____TtC10Navigation20MNOfflineCoordinator_delegate;
        swift_beginAccess();
        id v15 = (void *)MEMORY[0x1BA99BA60](v14);

        if (v15)
        {
          uint64_t v16 = MEMORY[0x1BA99BA60](v3);
          if (v16)
          {
            unint64_t v17 = (void *)v16;
            objc_msgSend(v15, sel_offlineCoordinatorDidDetectOnline_, v16);

            swift_unknownObjectRelease();
            return;
          }
          goto LABEL_48;
        }
LABEL_41:

        return;
      }
LABEL_46:
      __break(1u);
      goto LABEL_47;
    }
    if (qword_1E9D54DA8 != -1) {
      swift_once();
    }
    uint64_t v34 = sub_1B5531EA0();
    __swift_project_value_buffer(v34, (uint64_t)qword_1E9D578F8);
    os_log_type_t v19 = sub_1B5531E80();
    os_log_type_t v35 = sub_1B5531F80();
    if (os_log_type_enabled(v19, v35))
    {
      uint64_t v21 = (uint8_t *)swift_slowAlloc();
      uint64_t v36 = swift_slowAlloc();
      v53[0] = v36;
      *(_DWORD *)uint64_t v21 = 136315138;
      id v37 = (id)GEOOfflineModeAsString();
      uint64_t v38 = sub_1B5531EE0();
      unint64_t v40 = v39;

      uint64_t v54 = sub_1B5437C04(v38, v40, v53);
      sub_1B5531FF0();
      swift_bridgeObjectRelease();
      swift_arrayDestroy();
      uint64_t v27 = v36;
      goto LABEL_30;
    }
LABEL_31:

    goto LABEL_32;
  }
  if (qword_1E9D54DA8 != -1) {
    swift_once();
  }
  uint64_t v28 = sub_1B5531EA0();
  __swift_project_value_buffer(v28, (uint64_t)qword_1E9D578F8);
  uint64_t v29 = sub_1B5531E80();
  os_log_type_t v30 = sub_1B5531F70();
  if (os_log_type_enabled(v29, v30))
  {
    int v31 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)int v31 = 0;
    _os_log_impl(&dword_1B542B000, v29, v30, "Got recommendation to switch to offline, but we're already offline. Switching anyway.", v31, 2u);
    MEMORY[0x1BA99BA00](v31, -1, -1);
  }

  uint64_t v32 = MEMORY[0x1BA99BA60](v3);
  if (!v32)
  {
LABEL_45:
    __break(1u);
    goto LABEL_46;
  }
  id v33 = (void *)v32;
  sub_1B543A480();

LABEL_32:
}

void sub_1B543BF88()
{
}

uint64_t sub_1B543BF90()
{
  return 0x656E696C66664FLL;
}

void sub_1B543BFAC(char a1)
{
  uint64_t v3 = v1 + 16;
  uint64_t v4 = MEMORY[0x1BA99BA60](v1 + 16);
  if (!v4)
  {
    __break(1u);
    goto LABEL_36;
  }
  uint64_t v5 = (void *)v4;
  uint64_t v6 = *(void **)(v4 + OBJC_IVAR____TtC10Navigation20MNOfflineCoordinator__navigationSessionState);
  if (!v6)
  {
LABEL_36:
    __break(1u);
    goto LABEL_37;
  }
  id v7 = objc_msgSend(v6, sel_currentRouteInfo);
  id v38 = objc_msgSend(v7, sel_route);

  if (!v38)
  {
LABEL_37:
    __break(1u);
    goto LABEL_38;
  }
  if (!a1)
  {
    if (qword_1E9D54DA8 != -1) {
      swift_once();
    }
    uint64_t v18 = sub_1B5531EA0();
    __swift_project_value_buffer(v18, (uint64_t)qword_1E9D578F8);
    os_log_type_t v19 = sub_1B5531E80();
    os_log_type_t v20 = sub_1B5531F70();
    if (os_log_type_enabled(v19, v20))
    {
      uint64_t v21 = (uint8_t *)swift_slowAlloc();
      uint64_t v22 = swift_slowAlloc();
      v39[0] = v22;
      *(_DWORD *)uint64_t v21 = 136315138;
      id v23 = (id)GEOOfflineModeAsString();
      uint64_t v24 = sub_1B5531EE0();
      unint64_t v26 = v25;

      uint64_t v40 = sub_1B5437C04(v24, v26, v39);
      sub_1B5531FF0();
      swift_bridgeObjectRelease();
      swift_arrayDestroy();
      uint64_t v27 = v22;
LABEL_25:
      MEMORY[0x1BA99BA00](v27, -1, -1);
      MEMORY[0x1BA99BA00](v21, -1, -1);

      goto LABEL_26;
    }
LABEL_31:

    goto LABEL_32;
  }
  if (a1 != 2)
  {
    if (a1 == 1)
    {
      if (objc_msgSend(v38, sel_isOfflineRoute))
      {
        if (qword_1E9D54DA8 != -1) {
          swift_once();
        }
        uint64_t v8 = sub_1B5531EA0();
        __swift_project_value_buffer(v8, (uint64_t)qword_1E9D578F8);
        unsigned int v9 = sub_1B5531E80();
        os_log_type_t v10 = sub_1B5531F70();
        if (os_log_type_enabled(v9, v10))
        {
          os_log_type_t v11 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)os_log_type_t v11 = 0;
          _os_log_impl(&dword_1B542B000, v9, v10, "We are already online but somehow have an offline route. Attempting to upgrade route.", v11, 2u);
          MEMORY[0x1BA99BA00](v11, -1, -1);
        }

        uint64_t v12 = MEMORY[0x1BA99BA60](v3);
        if (v12)
        {
          int64_t v13 = (void *)v12;
          uint64_t v14 = v12 + OBJC_IVAR____TtC10Navigation20MNOfflineCoordinator_delegate;
          swift_beginAccess();
          id v15 = (void *)MEMORY[0x1BA99BA60](v14);

          if (v15)
          {
            uint64_t v16 = MEMORY[0x1BA99BA60](v3);
            if (v16)
            {
              unint64_t v17 = (void *)v16;
              objc_msgSend(v15, sel_offlineCoordinatorDidDetectOnline_, v16);

              swift_unknownObjectRelease();
              return;
            }
            goto LABEL_39;
          }
LABEL_26:

          return;
        }
LABEL_38:
        __break(1u);
LABEL_39:
        __break(1u);
        return;
      }
      if (qword_1E9D54DA8 != -1) {
        swift_once();
      }
      uint64_t v35 = sub_1B5531EA0();
      __swift_project_value_buffer(v35, (uint64_t)qword_1E9D578F8);
      os_log_type_t v19 = sub_1B5531E80();
      os_log_type_t v36 = sub_1B5531F90();
      if (os_log_type_enabled(v19, v36))
      {
        id v37 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)id v37 = 0;
        _os_log_impl(&dword_1B542B000, v19, v36, "We are already online and have an online route. Ignoring update.", v37, 2u);
        MEMORY[0x1BA99BA00](v37, -1, -1);
      }
      goto LABEL_31;
    }
    if (qword_1E9D54DA8 != -1) {
      swift_once();
    }
    uint64_t v28 = sub_1B5531EA0();
    __swift_project_value_buffer(v28, (uint64_t)qword_1E9D578F8);
    os_log_type_t v19 = sub_1B5531E80();
    os_log_type_t v29 = sub_1B5531F80();
    if (os_log_type_enabled(v19, v29))
    {
      uint64_t v21 = (uint8_t *)swift_slowAlloc();
      uint64_t v30 = swift_slowAlloc();
      v39[0] = v30;
      *(_DWORD *)uint64_t v21 = 136315138;
      id v31 = (id)GEOOfflineModeAsString();
      uint64_t v32 = sub_1B5531EE0();
      unint64_t v34 = v33;

      uint64_t v40 = sub_1B5437C04(v32, v34, v39);
      sub_1B5531FF0();
      swift_bridgeObjectRelease();
      swift_arrayDestroy();
      uint64_t v27 = v30;
      goto LABEL_25;
    }
    goto LABEL_31;
  }
  sub_1B543C7AC();
LABEL_32:
}

void sub_1B543C554()
{
}

void sub_1B543C55C(unsigned __int8 a1)
{
  if (qword_1E9D54DA8 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_1B5531EA0();
  __swift_project_value_buffer(v2, (uint64_t)qword_1E9D578F8);
  uint64_t v3 = sub_1B5531E80();
  os_log_type_t v4 = sub_1B5531F90();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = swift_slowAlloc();
    uint64_t v6 = swift_slowAlloc();
    uint64_t v16 = v6;
    *(_DWORD *)uint64_t v5 = 136315394;
    id v7 = (id)GEOOfflineModeAsString();
    uint64_t v8 = sub_1B5531EE0();
    unint64_t v10 = v9;

    sub_1B5437C04(v8, v10, &v16);
    sub_1B5531FF0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v5 + 12) = 2080;
    id v11 = (id)GEOOfflineDeviceAsString();
    uint64_t v12 = sub_1B5531EE0();
    unint64_t v14 = v13;

    sub_1B5437C04(v12, v14, &v16);
    sub_1B5531FF0();
    swift_bridgeObjectRelease();
    swift_arrayDestroy();
    MEMORY[0x1BA99BA00](v6, -1, -1);
    MEMORY[0x1BA99BA00](v5, -1, -1);
  }

  id v15 = objc_msgSend(self, sel_shared);
  objc_msgSend(v15, sel_delegatePrefersMode_device_, a1, 1);
}

uint64_t sub_1B543C798()
{
  return 0x656E696C6E4FLL;
}

void sub_1B543C7AC()
{
  uint64_t v1 = sub_1B5531EA0();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x1F4188790]();
  os_log_type_t v4 = (char *)&v42 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = v0 + 16;
  uint64_t v6 = MEMORY[0x1BA99BA60](v0 + 16);
  if (!v6)
  {
    __break(1u);
    goto LABEL_21;
  }
  id v7 = (void *)v6;
  uint64_t v8 = *(void **)(v6 + OBJC_IVAR____TtC10Navigation20MNOfflineCoordinator__navigationSessionState);
  if (!v8)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  id v9 = objc_msgSend(v8, sel_currentRouteInfo);
  id v44 = objc_msgSend(v9, sel_route);

  if (!v44)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  GEOConfigGetDouble();
  double v11 = v10;
  uint64_t v12 = MEMORY[0x1BA99BA60](v5);
  if (!v12)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  unint64_t v13 = (void *)v12;
  unint64_t v14 = *(void **)(v12 + OBJC_IVAR____TtC10Navigation20MNOfflineCoordinator__navigationSessionState);
  if (!v14)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  id v15 = objc_msgSend(v14, sel_location);
  id v16 = objc_msgSend(v15, sel_routeMatch);

  if (v16)
  {
    id v17 = objc_msgSend(v16, sel_routeCoordinate);

    unint64_t v13 = v16;
  }
  else
  {
    id v17 = 0;
  }

  id v18 = objc_msgSend(v44, sel_routeCoordinateForDistance_afterRouteCoordinate_, v17, v11);
  objc_msgSend(v44, sel_coarseBoundsForRange_, v17, v18);
  GEOMapRectMakeWithMapBox((uint64_t)&v46);
  GEOCoordinateRegionForMapRect();
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;
  id v27 = objc_msgSend(self, sel_shared);
  unsigned __int8 v28 = objc_msgSend(v27, sel_canUseOfflineForCoordinateRegion_, v20, v22, v24, v26);

  if (v28 != 2)
  {
    if (qword_1E9D54DA8 != -1) {
      swift_once();
    }
    uint64_t v32 = __swift_project_value_buffer(v1, (uint64_t)qword_1E9D578F8);
    (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v4, v32, v1);
    unint64_t v33 = sub_1B5531E80();
    os_log_type_t v34 = sub_1B5531F90();
    if (!os_log_type_enabled(v33, v34))
    {

      (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
      return;
    }
    uint64_t v43 = v2;
    uint64_t v35 = (uint8_t *)swift_slowAlloc();
    uint64_t v36 = swift_slowAlloc();
    *(void *)&long long v46 = v36;
    *(_DWORD *)uint64_t v35 = 136315138;
    id v37 = (id)GEOStringFromCoordinateRegionBounds();
    if (v37)
    {
      id v38 = v37;
      uint64_t v39 = sub_1B5531EE0();
      unint64_t v41 = v40;

      uint64_t v45 = sub_1B5437C04(v39, v41, (uint64_t *)&v46);
      sub_1B5531FF0();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1B542B000, v33, v34, "Not switching to offline state because the route's bounds is outside of the downloaded region. Bounds: %s", v35, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1BA99BA00](v36, -1, -1);
      MEMORY[0x1BA99BA00](v35, -1, -1);

      (*(void (**)(char *, uint64_t))(v43 + 8))(v4, v1);
      return;
    }
    goto LABEL_26;
  }
  uint64_t v29 = MEMORY[0x1BA99BA60](v5);
  if (!v29)
  {
LABEL_25:
    __break(1u);
LABEL_26:
    __break(1u);
    return;
  }
  uint64_t v30 = (void *)v29;
  sub_1B543A480();

  id v31 = v44;
}

uint64_t sub_1B543CC64()
{
  swift_unknownObjectWeakDestroy();
  return MEMORY[0x1F4186488](v0, 24, 7);
}

void sub_1B543CDD4(uint64_t a1)
{
  if (a1 != 15) {
    return;
  }
  if (qword_1E9D54DA8 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_1B5531EA0();
  __swift_project_value_buffer(v2, (uint64_t)qword_1E9D578F8);
  uint64_t v3 = v1;
  os_log_type_t v4 = sub_1B5531E80();
  os_log_type_t v5 = sub_1B5531F90();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = swift_slowAlloc();
    uint64_t v7 = swift_slowAlloc();
    uint64_t v31 = v7;
    *(_DWORD *)uint64_t v6 = 136315394;
    uint64_t v8 = *(void *)&v3[OBJC_IVAR____TtC10Navigation20MNOfflineCoordinator__currentState];
    if (v8)
    {
      uint64_t v9 = (*(uint64_t (**)(void))(*(void *)v8 + 104))();
      unint64_t v11 = v10;
    }
    else
    {
      unint64_t v11 = 0xE700000000000000;
      uint64_t v9 = 0x6E776F6E6B6E55;
    }
    sub_1B5437C04(v9, v11, &v31);
    sub_1B5531FF0();

    swift_bridgeObjectRelease();
    *(_WORD *)(v6 + 12) = 2080;
    id v12 = objc_msgSend(self, sel_shared);
    objc_msgSend(v12, sel_state);

    id v13 = (id)GEOOfflineStateAsString();
    uint64_t v14 = sub_1B5531EE0();
    unint64_t v16 = v15;

    sub_1B5437C04(v14, v16, &v31);
    sub_1B5531FF0();
    swift_bridgeObjectRelease();
    swift_arrayDestroy();
    MEMORY[0x1BA99BA00](v7, -1, -1);
    MEMORY[0x1BA99BA00](v6, -1, -1);
  }
  else
  {
  }
  type metadata accessor for MNOfflineCoordinatorState.Online();
  uint64_t v17 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v18 = OBJC_IVAR____TtC10Navigation20MNOfflineCoordinator__currentState;
  *(void *)&v3[OBJC_IVAR____TtC10Navigation20MNOfflineCoordinator__currentState] = v17;
  swift_retain();
  swift_release();
  if (!*(void *)&v3[v18])
  {
    __break(1u);
    goto LABEL_18;
  }
  swift_unknownObjectWeakAssign();
  uint64_t v19 = *(void *)&v3[v18];
  if (!v19)
  {
LABEL_18:
    __break(1u);
    return;
  }
  double v20 = *(void (**)(uint64_t))(*(void *)v19 + 96);
  uint64_t v21 = swift_retain();
  v20(v21);
  swift_release();
  swift_release();
  double v22 = &v3[OBJC_IVAR____TtC10Navigation20MNOfflineCoordinator__pendingRerouteFinishedState];
  if ((v3[OBJC_IVAR____TtC10Navigation20MNOfflineCoordinator__pendingRerouteFinishedState + 4] & 1) == 0)
  {
    double v23 = sub_1B5531E80();
    os_log_type_t v24 = sub_1B5531F90();
    if (os_log_type_enabled(v23, v24))
    {
      double v25 = (uint8_t *)swift_slowAlloc();
      uint64_t v26 = swift_slowAlloc();
      uint64_t v31 = v26;
      *(_DWORD *)double v25 = 136315138;
      id v27 = (id)GEOOfflineStateAsString();
      uint64_t v28 = sub_1B5531EE0();
      unint64_t v30 = v29;

      sub_1B5437C04(v28, v30, &v31);
      sub_1B5531FF0();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1B542B000, v23, v24, "We had a pending state: %s, but we're dropping it because we just got an online route.", v25, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1BA99BA00](v26, -1, -1);
      MEMORY[0x1BA99BA00](v25, -1, -1);
    }

    *(_DWORD *)double v22 = 0;
    v22[4] = 1;
  }
}

void sub_1B543D248(__CFString *a1)
{
  if (qword_1E9D54DA8 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_1B5531EA0();
  __swift_project_value_buffer(v2, (uint64_t)qword_1E9D578F8);
  uint64_t v3 = sub_1B5531E80();
  os_log_type_t v4 = sub_1B5531F90();
  if (os_log_type_enabled(v3, v4))
  {
    os_log_type_t v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v6 = swift_slowAlloc();
    uint64_t v11 = v6;
    *(_DWORD *)os_log_type_t v5 = 136315138;
    id v7 = (id)GEOOfflineStateAsString();
    uint64_t v8 = sub_1B5531EE0();
    unint64_t v10 = v9;

    sub_1B5437C04(v8, v10, &v11);
    sub_1B5531FF0();
    swift_bridgeObjectRelease();
    swift_arrayDestroy();
    MEMORY[0x1BA99BA00](v6, -1, -1);
    MEMORY[0x1BA99BA00](v5, -1, -1);
  }

  sub_1B543AFF4(a1);
}

uint64_t sub_1B543D404@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = *a1 + OBJC_IVAR____TtC10Navigation20MNOfflineCoordinator_delegate;
  swift_beginAccess();
  uint64_t result = MEMORY[0x1BA99BA60](v3);
  *a2 = result;
  return result;
}

uint64_t sub_1B543D45C()
{
  return swift_unknownObjectWeakAssign();
}

char *keypath_get_selector_navigationSessionState()
{
  return sel_navigationSessionState;
}

id sub_1B543D4C0@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_navigationSessionState);
  *a2 = result;
  return result;
}

id sub_1B543D4FC(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setNavigationSessionState_, *a1);
}

uint64_t method lookup function for MNOfflineCoordinator(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for MNOfflineCoordinator);
}

uint64_t dispatch thunk of MNOfflineCoordinator.__allocating_init(navigationSessionState:)()
{
  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t dispatch thunk of MNOfflineCoordinator.delegate.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x78))();
}

uint64_t dispatch thunk of MNOfflineCoordinator.delegate.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x80))();
}

uint64_t dispatch thunk of MNOfflineCoordinator.delegate.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x88))();
}

uint64_t dispatch thunk of MNOfflineCoordinator.start()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x90))();
}

uint64_t dispatch thunk of MNOfflineCoordinator.stop()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x98))();
}

uint64_t type metadata accessor for MNOfflineCoordinatorState()
{
  return self;
}

uint64_t type metadata accessor for MNOfflineCoordinatorState.Offline()
{
  return self;
}

double GEOMapRectMakeWithMapBox(uint64_t a1)
{
  return *(double *)a1;
}

uint64_t sub_1B543D694(uint64_t a1)
{
  return a1;
}

uint64_t sub_1B543D6BC(uint64_t a1)
{
  return sub_1B543D764(a1, qword_1E9D578F8);
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

uint64_t sub_1B543D744(uint64_t a1)
{
  return sub_1B543D764(a1, qword_1E9D57910);
}

uint64_t sub_1B543D764(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_1B5531EA0();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  return sub_1B5531E90();
}

id MNTrace.initialRoute.getter()
{
  id result = objc_msgSend(v0, sel_directions);
  if (!result) {
    goto LABEL_26;
  }
  uint64_t v3 = result;
  sub_1B5438B88(0, &qword_1E9D54FD0);
  unint64_t v4 = sub_1B5531F60();

  if (!(v4 >> 62))
  {
    os_log_type_t v5 = *(void **)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v5) {
      goto LABEL_4;
    }
LABEL_17:
    swift_bridgeObjectRelease();
    return 0;
  }
  swift_bridgeObjectRetain();
  os_log_type_t v5 = (void *)sub_1B5532090();
  swift_bridgeObjectRelease();
  if (!v5) {
    goto LABEL_17;
  }
LABEL_4:
  if ((v4 & 0xC000000000000001) != 0)
  {
    id v6 = (id)MEMORY[0x1BA99A4C0](0, v4);
  }
  else
  {
    if (!*(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      goto LABEL_20;
    }
    id v6 = *(id *)(v4 + 32);
  }
  os_log_type_t v5 = v6;
  swift_bridgeObjectRelease();
  id v7 = objc_msgSend(v5, sel_routes);
  if (!v7)
  {
LABEL_15:

    return v7;
  }
  sub_1B5438B88(0, &qword_1E9D54DB8);
  unint64_t v4 = sub_1B5531F60();

  id result = objc_msgSend(v5, sel_selectedRouteIndex);
  unint64_t v1 = (unint64_t)result;
  if (v4 >> 62)
  {
LABEL_20:
    swift_bridgeObjectRetain();
    uint64_t v8 = sub_1B5532090();
    id result = (id)swift_bridgeObjectRelease();
    if (v8 <= 0) {
      goto LABEL_21;
    }
    goto LABEL_10;
  }
  uint64_t v8 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v8 <= 0)
  {
LABEL_21:
    swift_bridgeObjectRelease();

    return 0;
  }
LABEL_10:
  if (v1 >= v8) {
    goto LABEL_21;
  }
  if ((v4 & 0xC000000000000001) != 0)
  {
    id v9 = (id)MEMORY[0x1BA99A4C0](v1, v4);
    goto LABEL_14;
  }
  if ((int64_t)v1 < *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    id v9 = *(id *)(v4 + 8 * v1 + 32);
LABEL_14:
    id v7 = v9;
    swift_bridgeObjectRelease();
    goto LABEL_15;
  }
  __break(1u);
LABEL_26:
  __break(1u);
  return result;
}

Swift::tuple_routes_OpaquePointer_selectedRouteIndex_Int_optional __swiftcall MNTrace.routeSet(atRowIndex:)(Swift::Int atRowIndex)
{
  id v3 = objc_msgSend((id)v1, sel_directions);
  if (!v3)
  {
    __break(1u);
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  id v6 = v3;
  unint64_t v7 = sub_1B5438B88(0, &qword_1E9D54FD0);
  unint64_t v8 = sub_1B5531F60();

  if (v8 >> 62) {
    goto LABEL_16;
  }
  id v9 = *(char ***)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    swift_bridgeObjectRelease();
    if ((uint64_t)v9 <= atRowIndex) {
      break;
    }
    id v3 = objc_msgSend((id)v1, sel_directions);
    if (!v3) {
      goto LABEL_26;
    }
    unint64_t v10 = v3;
    unint64_t v1 = sub_1B5531F60();

    if ((v1 & 0xC000000000000001) != 0)
    {
      id v11 = (id)MEMORY[0x1BA99A4C0](atRowIndex, v1);
    }
    else
    {
      if (atRowIndex < 0)
      {
        __break(1u);
LABEL_19:
        __break(1u);
        goto LABEL_20;
      }
      if (*(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10) <= (unint64_t)atRowIndex) {
        goto LABEL_19;
      }
      id v11 = *(id *)(v1 + 8 * atRowIndex + 32);
    }
    atRowIndex = (Swift::Int)v11;
    swift_bridgeObjectRelease();
    id v12 = objc_msgSend((id)atRowIndex, sel_routes);
    if (!v12) {
      goto LABEL_22;
    }
    id v13 = v12;
    sub_1B5438B88(0, &qword_1E9D54DB8);
    unint64_t v1 = sub_1B5531F60();

    id v9 = &selRef_navigationSession_didUpdateTargetLegIndex_;
    unint64_t v7 = (unint64_t)objc_msgSend((id)atRowIndex, sel_selectedRouteIndex);
    if (!(v1 >> 62))
    {
      uint64_t v14 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
      if (v14 < 1) {
        goto LABEL_21;
      }
      goto LABEL_13;
    }
LABEL_20:
    swift_bridgeObjectRetain();
    uint64_t v14 = sub_1B5532090();
    swift_bridgeObjectRelease();
    if (v14 < 1)
    {
LABEL_21:
      swift_bridgeObjectRelease();
LABEL_22:

      break;
    }
LABEL_13:
    if (v7 >= v14) {
      goto LABEL_21;
    }
    unint64_t v7 = (unint64_t)[(id)atRowIndex v9[459]];

    if ((v7 & 0x8000000000000000) == 0) {
      goto LABEL_24;
    }
    __break(1u);
LABEL_16:
    swift_bridgeObjectRetain();
    id v9 = (char **)sub_1B5532090();
    swift_bridgeObjectRelease();
  }
  unint64_t v1 = 0;
  unint64_t v7 = 0;
LABEL_24:
  id v3 = (id)v1;
  Swift::Int v4 = v7;
LABEL_27:
  result.value.selectedRouteIndex = v4;
  result.value.routes._rawValue = v3;
  result.is_nil = v5;
  return result;
}

void *MNTrace.route(atRowIndex:)(Swift::Int a1)
{
  Swift::tuple_routes_OpaquePointer_selectedRouteIndex_Int_optional v5 = MNTrace.routeSet(atRowIndex:)(a1);
  if (v5.value.routes._rawValue)
  {
    if (((unint64_t)v5.value.routes._rawValue & 0xC000000000000001) != 0)
    {
      id v2 = (id)MEMORY[0x1BA99A4C0](v5.value.selectedRouteIndex, v5.value.routes._rawValue, *(void *)&v5.is_nil);
    }
    else
    {
      if (v5.value.selectedRouteIndex >= *(void *)(((uint64_t)v5.value.routes._rawValue & 0xFFFFFFFFFFFFFF8) + 0x10))
      {
        __break(1u);
        return v5.value.routes._rawValue;
      }
      id v2 = *((id *)v5.value.routes._rawValue + v5.value.selectedRouteIndex + 4);
    }
    id v3 = v2;
    swift_bridgeObjectRelease();
  }
  else
  {
    id v3 = 0;
  }
  v5.value.routes._rawValue = v3;
  return v5.value.routes._rawValue;
}

id MNTrace.routeSet(directionsResponseID:)(uint64_t a1, unint64_t a2)
{
  id result = objc_msgSend(v2, sel_directions);
  if (!result) {
    return result;
  }
  id v6 = result;
  sub_1B5438B88(0, &qword_1E9D54FD0);
  unint64_t v7 = sub_1B5531F60();

  if (!(v7 >> 62))
  {
    uint64_t v8 = *(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10);
    sub_1B543DF3C(a1, a2);
    if (v8) {
      goto LABEL_4;
    }
LABEL_16:
    sub_1B5438A24(a1, a2);
    swift_bridgeObjectRelease();
    return 0;
  }
LABEL_20:
  sub_1B543DF3C(a1, a2);
  swift_bridgeObjectRetain();
  uint64_t v8 = sub_1B5532090();
  swift_bridgeObjectRelease();
  if (!v8) {
    goto LABEL_16;
  }
LABEL_4:
  Swift::Int v9 = 0;
  while (1)
  {
    id v10 = (v7 & 0xC000000000000001) != 0 ? (id)MEMORY[0x1BA99A4C0](v9, v7) : *(id *)(v7 + 8 * v9 + 32);
    id v11 = v10;
    id result = objc_msgSend(v10, sel_response);
    if (!result) {
      break;
    }
    id v12 = result;
    id v13 = objc_msgSend(result, sel_directionsResponseID);

    if (v13)
    {
      uint64_t v14 = sub_1B5531E70();
      unint64_t v16 = v15;

      sub_1B543DF3C(a1, a2);
      sub_1B543DF3C(v14, v16);
      char v17 = sub_1B543F300(v14, v16, a1, a2);
      sub_1B5438A24(a1, a2);
      sub_1B5438A24(v14, v16);
      sub_1B5438A24(v14, v16);

      if (v17)
      {
        sub_1B5438A24(a1, a2);
        swift_bridgeObjectRelease();
        return (id)MNTrace.routeSet(atRowIndex:)(v9);
      }
      Swift::Int v18 = v9 + 1;
      if (__OFADD__(v9, 1))
      {
LABEL_19:
        __break(1u);
        goto LABEL_20;
      }
    }
    else
    {
      sub_1B543DF3C(a1, a2);
      sub_1B543914C(0, 0xF000000000000000);
      sub_1B543914C(a1, a2);

      Swift::Int v18 = v9 + 1;
      if (__OFADD__(v9, 1)) {
        goto LABEL_19;
      }
    }
    ++v9;
    if (v18 == v8) {
      goto LABEL_16;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_1B543DF3C(uint64_t a1, unint64_t a2)
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

uint64_t MNTrace.route(beforeTimestamp:)(double a1)
{
  id v2 = v1;
  uint64_t result = (uint64_t)objc_msgSend(v1, sel_navigationUpdates);
  if (!result) {
    goto LABEL_36;
  }
  Swift::tuple_routes_OpaquePointer_selectedRouteIndex_Int_optional v5 = (void *)result;
  sub_1B5438B88(0, &qword_1E9D54FD8);
  unint64_t v6 = sub_1B5531F60();

  if (v6 >> 62) {
    goto LABEL_19;
  }
  unint64_t v7 = *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (v7)
  {
    while (__OFSUB__(v7--, 1))
    {
      __break(1u);
LABEL_17:
      __break(1u);
LABEL_18:
      __break(1u);
LABEL_19:
      swift_bridgeObjectRetain();
      unint64_t v7 = sub_1B5532090();
      swift_bridgeObjectRelease();
      if (!v7) {
        goto LABEL_20;
      }
    }
    if ((v6 & 0xC000000000000001) != 0)
    {
      id v9 = (id)MEMORY[0x1BA99A4C0](v7, v6);
      goto LABEL_13;
    }
    if ((v7 & 0x8000000000000000) != 0) {
      goto LABEL_17;
    }
    if (v7 >= *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      goto LABEL_18;
    }
    id v9 = *(id *)(v6 + 32 + 8 * v7);
LABEL_13:
    id v10 = v9;
    if (objc_msgSend(v9, sel_navigationUpdateType) == (id)1)
    {
      objc_msgSend(v10, sel_timestamp);
      double v12 = v11;

      if (v12 < a1)
      {
        MEMORY[0x1F4188790]();
        unint64_t v17 = v7;
        sub_1B543F598(&v17, (unint64_t *)&v18);
        id v13 = v18;
        goto LABEL_21;
      }
    }
    else
    {
    }
  }
LABEL_20:
  id v13 = 0;
LABEL_21:
  swift_bridgeObjectRelease();
  if (!v13) {
    return 0;
  }
  self;
  uint64_t v14 = (void *)swift_dynamicCastObjCClass();
  if (!v14)
  {
LABEL_29:

    return (uint64_t)v14;
  }
  id v13 = v13;
  uint64_t result = sub_1B543E218(v14, v2);
  if (!result)
  {

    return 0;
  }
  if ((result & 0xC000000000000001) != 0)
  {
    id v16 = (id)MEMORY[0x1BA99A4C0](v15, result);
    goto LABEL_28;
  }
  if ((v15 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (v15 < *(void *)((result & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    id v16 = *(id *)(result + 8 * v15 + 32);
LABEL_28:
    uint64_t v14 = v16;
    swift_bridgeObjectRelease();

    goto LABEL_29;
  }
  __break(1u);
LABEL_36:
  __break(1u);
  return result;
}

uint64_t sub_1B543E218(void *a1, void *a2)
{
  id v4 = objc_msgSend(a1, sel_directionsResponseID);
  if (!v4)
  {
    id v25 = objc_msgSend(a1, sel_etauResponseID);
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v8 = sub_1B5531E70();
      unint64_t v5 = v27;
    }
    else
    {
      uint64_t v8 = 0;
      unint64_t v5 = 0xF000000000000000;
    }
    id v28 = objc_msgSend(a2, sel_directions);
    if (!v28) {
      goto LABEL_41;
    }
    unint64_t v29 = v28;
    sub_1B5438B88(0, &qword_1E9D54FD0);
    unint64_t v30 = sub_1B5531F60();

    if (v30 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v31 = sub_1B5532090();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v31 = *(void *)((v30 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    swift_bridgeObjectRelease();
    if (v31 >= 1)
    {
      unint64_t v32 = (unint64_t)MNTrace.routeSet(atRowIndex:)(0);
      sub_1B543914C(v8, v5);
      return v32;
    }
    sub_1B543914C(v8, v5);
    return 0;
  }
  unint64_t v5 = (unint64_t)v4;
  uint64_t v6 = sub_1B5531E70();
  uint64_t v8 = v7;

  id v9 = objc_msgSend(a1, sel_directionsResponseID);
  if (v9)
  {
    unint64_t v5 = (unint64_t)v9;
    uint64_t v10 = sub_1B5531E70();
    unint64_t v12 = v11;

    id v13 = objc_msgSend(a2, sel_directions);
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v34 = v6;
      unint64_t v35 = v8;
      sub_1B5438B88(0, &qword_1E9D54FD0);
      uint64_t v15 = sub_1B5531F60();

      if ((unint64_t)v15 >> 62)
      {
LABEL_33:
        if (v15 < 0) {
          unint64_t v5 = v15;
        }
        else {
          unint64_t v5 = v15 & 0xFFFFFFFFFFFFFF8;
        }
        sub_1B543DF3C(v10, v12);
        swift_bridgeObjectRetain();
        uint64_t v16 = sub_1B5532090();
        swift_bridgeObjectRelease();
        if (v16)
        {
LABEL_6:
          Swift::Int v17 = 0;
          while (1)
          {
            id v18 = (v15 & 0xC000000000000001) != 0
                ? (id)MEMORY[0x1BA99A4C0](v17, v15)
                : *(id *)(v15 + 8 * v17 + 32);
            uint64_t v19 = v18;
            id v20 = objc_msgSend(v18, sel_response);
            if (!v20) {
              break;
            }
            uint64_t v21 = v20;
            unint64_t v5 = (unint64_t)objc_msgSend(v20, sel_directionsResponseID);

            if (v5)
            {
              uint64_t v22 = sub_1B5531E70();
              uint64_t v8 = v23;

              sub_1B543DF3C(v10, v12);
              sub_1B543DF3C(v22, v8);
              unint64_t v5 = sub_1B543F300(v22, v8, v10, v12);
              sub_1B5438A24(v10, v12);
              sub_1B5438A24(v22, v8);
              sub_1B5438A24(v22, v8);

              if (v5)
              {
                sub_1B5438A24(v10, v12);
                swift_bridgeObjectRelease();
                unint64_t v32 = (unint64_t)MNTrace.routeSet(atRowIndex:)(v17);
                sub_1B5438A24(v10, v12);
                sub_1B5438A24(v34, v35);
                return v32;
              }
              Swift::Int v24 = v17 + 1;
              if (__OFADD__(v17, 1))
              {
LABEL_32:
                __break(1u);
                goto LABEL_33;
              }
            }
            else
            {
              sub_1B543DF3C(v10, v12);
              sub_1B543914C(0, 0xF000000000000000);
              sub_1B543914C(v10, v12);

              Swift::Int v24 = v17 + 1;
              if (__OFADD__(v17, 1)) {
                goto LABEL_32;
              }
            }
            ++v17;
            if (v24 == v16) {
              goto LABEL_18;
            }
          }
          __break(1u);
          goto LABEL_40;
        }
      }
      else
      {
        uint64_t v16 = *(void *)((v15 & 0xFFFFFFFFFFFFFF8) + 0x10);
        sub_1B543DF3C(v10, v12);
        if (v16) {
          goto LABEL_6;
        }
      }
LABEL_18:
      sub_1B5438A24(v10, v12);
      swift_bridgeObjectRelease();
      sub_1B5438A24(v10, v12);
      sub_1B5438A24(v34, v35);
    }
    else
    {
      sub_1B5438A24(v10, v12);
      sub_1B5438A24(v6, v8);
    }
    return 0;
  }
LABEL_40:
  __break(1u);
LABEL_41:
  uint64_t result = sub_1B543914C(v8, v5);
  __break(1u);
  return result;
}

id MNTrace.objcOnly_routesWithDirectionsResponseID(directionsResponseID:selectedRouteIndex:)(uint64_t a1, unint64_t a2, unint64_t a3)
{
  id result = objc_msgSend(v3, sel_directions);
  if (!result) {
    return result;
  }
  uint64_t v8 = result;
  sub_1B5438B88(0, &qword_1E9D54FD0);
  unint64_t v9 = sub_1B5531F60();

  if (v9 >> 62)
  {
LABEL_22:
    sub_1B543DF3C(a1, a2);
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_1B5532090();
    swift_bridgeObjectRelease();
    if (v10) {
      goto LABEL_4;
    }
LABEL_16:
    sub_1B5438A24(a1, a2);
    swift_bridgeObjectRelease();
    return 0;
  }
  uint64_t v10 = *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10);
  sub_1B543DF3C(a1, a2);
  if (!v10) {
    goto LABEL_16;
  }
LABEL_4:
  uint64_t v21 = (void *)a3;
  Swift::Int v11 = 0;
  while (1)
  {
    if ((v9 & 0xC000000000000001) != 0) {
      id v12 = (id)MEMORY[0x1BA99A4C0](v11, v9);
    }
    else {
      id v12 = *(id *)(v9 + 8 * v11 + 32);
    }
    id v13 = v12;
    id result = objc_msgSend(v12, sel_response, v21);
    if (!result)
    {
      __break(1u);
      return result;
    }
    uint64_t v14 = result;
    id v15 = objc_msgSend(result, sel_directionsResponseID);

    if (v15) {
      break;
    }
    sub_1B543DF3C(a1, a2);
    sub_1B543914C(0, 0xF000000000000000);
    sub_1B543914C(a1, a2);

    Swift::Int v19 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
LABEL_21:
      __break(1u);
      goto LABEL_22;
    }
LABEL_15:
    ++v11;
    if (v19 == v10) {
      goto LABEL_16;
    }
  }
  uint64_t v16 = sub_1B5531E70();
  a3 = v17;

  sub_1B543DF3C(a1, a2);
  sub_1B543DF3C(v16, a3);
  char v18 = sub_1B543F300(v16, a3, a1, a2);
  sub_1B5438A24(a1, a2);
  sub_1B5438A24(v16, a3);
  sub_1B5438A24(v16, a3);

  if ((v18 & 1) == 0)
  {
    Swift::Int v19 = v11 + 1;
    if (__OFADD__(v11, 1)) {
      goto LABEL_21;
    }
    goto LABEL_15;
  }
  sub_1B5438A24(a1, a2);
  swift_bridgeObjectRelease();
  *(_OWORD *)&id result = (unsigned __int128)MNTrace.routeSet(atRowIndex:)(v11);
  if (result)
  {
    if (v21) {
      *uint64_t v21 = v20;
    }
  }
  return result;
}

Swift::Int_optional __swiftcall MNTrace.locationIndex(afterTimestamp:)(Swift::Double afterTimestamp)
{
  id v3 = (char *)objc_msgSend(v1, sel_locations);
  if (v3)
  {
    unint64_t v5 = v3;
    sub_1B5438B88(0, &qword_1E9D54FE0);
    unint64_t v6 = sub_1B5531F60();

    if (v6 >> 62) {
      goto LABEL_12;
    }
    uint64_t v7 = *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t v8 = 0;
    if (v7)
    {
      while (1)
      {
        id v9 = (v6 & 0xC000000000000001) != 0
           ? (id)MEMORY[0x1BA99A4C0](v8, v6)
           : *(id *)(v6 + 8 * (void)v8 + 32);
        uint64_t v10 = v9;
        objc_msgSend(v9, sel_timestamp);
        double v12 = v11;

        BOOL v13 = v12 < afterTimestamp;
        if (v12 >= afterTimestamp) {
          break;
        }
        uint64_t v14 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
          __break(1u);
LABEL_12:
          swift_bridgeObjectRetain();
          uint64_t v7 = sub_1B5532090();
          swift_bridgeObjectRelease();
          uint64_t v8 = 0;
          if (!v7) {
            goto LABEL_13;
          }
        }
        else
        {
          ++v8;
          if (v14 == (char *)v7)
          {
            uint64_t v8 = 0;
            break;
          }
        }
      }
    }
    else
    {
LABEL_13:
      BOOL v13 = 1;
    }
    swift_bridgeObjectRelease();
    id v3 = v8;
    Swift::Bool v4 = v13;
  }
  else
  {
    __break(1u);
  }
  result.value = (Swift::Int)v3;
  result.is_nil = v4;
  return result;
}

Swift::Int __swiftcall MNTrace.locationIndexAfterTimestamp(_:)(Swift::Double a1)
{
  Swift::Int_optional v3 = MNTrace.locationIndex(afterTimestamp:)(a1);
  if (v3.is_nil)
  {
    v3.value = sub_1B5531DB0();
  }
  return v3.value;
}

void MNTraceDirectionsRow.routes.getter()
{
  id v1 = objc_msgSend(v0, sel_error);
  if (v1)
  {

    return;
  }
  id v2 = objc_msgSend(v0, sel_response);

  if (v2)
  {
    id v3 = objc_msgSend(v0, sel_response);
    if (v3)
    {
      Swift::Bool v4 = v3;
      id v5 = objc_msgSend(v3, sel_waypointRoutes);

      if (v5)
      {
        uint64_t v6 = (uint64_t)objc_msgSend(v5, sel_count);

        if (v6 < 1) {
          return;
        }
        id v7 = objc_msgSend(v0, sel_waypoints);
        if (v7)
        {
          uint64_t v8 = v7;
          sub_1B5438B88(0, &qword_1E9D54FE8);
          sub_1B5531F60();

          id v9 = objc_msgSend(v0, sel_request);
          if (v9)
          {
            uint64_t v10 = v9;
            id v11 = objc_msgSend(v9, sel_routeAttributes);

            if (v11)
            {
              id v12 = objc_msgSend(v0, sel_response);
              if (v12)
              {
                BOOL v13 = v12;
                id v14 = objc_msgSend(v0, sel_request);
                if (v14)
                {
                  id v15 = v14;
                  id v16 = objc_allocWithZone(MEMORY[0x1E4F649D0]);
                  unint64_t v17 = (void *)sub_1B5531F50();
                  swift_bridgeObjectRelease();
                  id v18 = objc_msgSend(v16, sel_initWithWaypoints_routeAttributes_directionsResponse_directionsRequest_, v17, v11, v13, v15);

                  id v19 = objc_msgSend(v18, sel_allRoutes);
                  if (v19)
                  {
                    uint64_t v20 = v19;
                    sub_1B5438B88(0, &qword_1E9D54DB8);
                    sub_1B5531F60();
                  }
                  return;
                }
LABEL_23:
                __break(1u);
                return;
              }
LABEL_22:
              __break(1u);
              goto LABEL_23;
            }
LABEL_21:
            __break(1u);
            goto LABEL_22;
          }
LABEL_20:
          __break(1u);
          goto LABEL_21;
        }
LABEL_19:
        __break(1u);
        goto LABEL_20;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_19;
  }
}

uint64_t sub_1B543EEA0@<X0>(uint64_t __s1@<X0>, uint64_t a2@<X2>, unint64_t a3@<X3>, char *a4@<X8>)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v7 = (const void *)__s1;
  switch(a3 >> 62)
  {
    case 1uLL:
      uint64_t v9 = (a2 >> 32) - (int)a2;
      if (a2 >> 32 < (int)a2)
      {
        __break(1u);
LABEL_31:
        __break(1u);
LABEL_32:
        __break(1u);
        goto LABEL_33;
      }
      sub_1B543DF3C(a2, a3);
      uint64_t v10 = (char *)sub_1B5531DD0();
      if (!v10) {
        goto LABEL_8;
      }
      uint64_t v11 = sub_1B5531DF0();
      if (__OFSUB__((int)a2, v11)) {
LABEL_33:
      }
        __break(1u);
      v10 += (int)a2 - v11;
LABEL_8:
      uint64_t v12 = sub_1B5531DE0();
      if (v12 >= v9) {
        size_t v13 = (a2 >> 32) - (int)a2;
      }
      else {
        size_t v13 = v12;
      }
      if (!v7)
      {
LABEL_35:
        __break(1u);
LABEL_36:
        __break(1u);
LABEL_37:
        __break(1u);
LABEL_38:
        __break(1u);
LABEL_39:
        __break(1u);
        JUMPOUT(0x1B543F104);
      }
      if (!v10) {
        goto LABEL_36;
      }
      int v14 = memcmp(v7, v10, v13);
      __s1 = sub_1B5438A24(a2, a3);
      BOOL v8 = v14 == 0;
LABEL_24:
      char v24 = v8;
LABEL_29:
      *a4 = v24;
      return __s1;
    case 2uLL:
      uint64_t v15 = *(void *)(a2 + 16);
      uint64_t v16 = *(void *)(a2 + 24);
      swift_retain();
      swift_retain();
      unint64_t v17 = (char *)sub_1B5531DD0();
      if (!v17) {
        goto LABEL_17;
      }
      uint64_t v18 = sub_1B5531DF0();
      if (__OFSUB__(v15, v18)) {
        goto LABEL_32;
      }
      v17 += v15 - v18;
LABEL_17:
      BOOL v19 = __OFSUB__(v16, v15);
      int64_t v20 = v16 - v15;
      if (v19) {
        goto LABEL_31;
      }
      uint64_t v21 = sub_1B5531DE0();
      if (v21 >= v20) {
        size_t v22 = v20;
      }
      else {
        size_t v22 = v21;
      }
      if (!v7) {
        goto LABEL_37;
      }
      if (!v17) {
        goto LABEL_38;
      }
      int v23 = memcmp(v7, v17, v22);
      swift_release();
      __s1 = swift_release();
      BOOL v8 = v23 == 0;
      goto LABEL_24;
    case 3uLL:
      if (!__s1) {
        goto LABEL_39;
      }
      char v24 = 1;
      goto LABEL_29;
    default:
      uint64_t __s2 = a2;
      __int16 v26 = a3;
      char v27 = BYTE2(a3);
      char v28 = BYTE3(a3);
      char v29 = BYTE4(a3);
      char v30 = BYTE5(a3);
      if (__s1)
      {
        __s1 = memcmp((const void *)__s1, &__s2, BYTE6(a3));
        BOOL v8 = __s1 == 0;
        goto LABEL_24;
      }
      __break(1u);
      goto LABEL_35;
  }
}

unint64_t sub_1B543F114(unint64_t result, uint64_t a2)
{
  if ((a2 & 0xC000000000000001) != 0) {
    return MEMORY[0x1BA99A4C0]();
  }
  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10) > result)
  {
    return (unint64_t)*(id *)(a2 + 8 * result + 32);
  }
  __break(1u);
  return result;
}

uint64_t sub_1B543F170(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t __s1 = a1;
  __int16 v9 = a2;
  char v10 = BYTE2(a2);
  char v11 = BYTE3(a2);
  char v12 = BYTE4(a2);
  char v13 = BYTE5(a2);
  sub_1B543EEA0((uint64_t)&__s1, a3, a4, &v7);
  if (!v4) {
    char v5 = v7;
  }
  return v5 & 1;
}

uint64_t sub_1B543F248(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  uint64_t result = sub_1B5531DD0();
  uint64_t v11 = result;
  if (result)
  {
    uint64_t result = sub_1B5531DF0();
    if (__OFSUB__(a1, result))
    {
LABEL_9:
      __break(1u);
      return result;
    }
    v11 += a1 - result;
  }
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
    goto LABEL_9;
  }
  sub_1B5531DE0();
  sub_1B543EEA0(v11, a4, a5, &v13);
  if (!v5) {
    char v12 = v13;
  }
  return v12 & 1;
}

uint64_t sub_1B543F300(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v8 = 0;
  switch(a2 >> 62)
  {
    case 1uLL:
      LODWORD(v8) = HIDWORD(a1) - a1;
      if (__OFSUB__(HIDWORD(a1), a1))
      {
        __break(1u);
LABEL_26:
        __break(1u);
LABEL_27:
        __break(1u);
LABEL_28:
        __break(1u);
LABEL_29:
        __break(1u);
        JUMPOUT(0x1B543F568);
      }
      uint64_t v8 = (int)v8;
LABEL_6:
      switch(a4 >> 62)
      {
        case 1uLL:
          LODWORD(v12) = HIDWORD(a3) - a3;
          if (__OFSUB__(HIDWORD(a3), a3)) {
            goto LABEL_27;
          }
          uint64_t v12 = (int)v12;
LABEL_11:
          if (v8 == v12)
          {
            if (v8 < 1)
            {
              char v17 = 1;
            }
            else
            {
              switch(a2 >> 62)
              {
                case 1uLL:
                  if (a1 >> 32 < (int)a1) {
                    goto LABEL_29;
                  }
                  sub_1B543DF3C(a3, a4);
                  sub_1B543DF3C(a1, a2);
                  char v17 = sub_1B543F248((int)a1, a1 >> 32, a2 & 0x3FFFFFFFFFFFFFFFLL, a3, a4);
                  sub_1B5438A24(a3, a4);
                  uint64_t v18 = a1;
                  unint64_t v19 = a2;
                  break;
                case 2uLL:
                  uint64_t v20 = a2 & 0x3FFFFFFFFFFFFFFFLL;
                  uint64_t v21 = *(void *)(a1 + 16);
                  uint64_t v22 = *(void *)(a1 + 24);
                  sub_1B543DF3C(a3, a4);
                  swift_retain();
                  swift_retain();
                  char v17 = sub_1B543F248(v21, v22, v20, a3, a4);
                  sub_1B5438A24(a3, a4);
                  swift_release();
                  swift_release();
                  return v17 & 1;
                case 3uLL:
                  sub_1B543DF3C(a3, a4);
                  uint64_t v16 = 0;
                  uint64_t v15 = 0;
                  goto LABEL_22;
                default:
                  sub_1B543DF3C(a3, a4);
                  uint64_t v15 = a2 & 0xFFFFFFFFFFFFFFLL;
                  uint64_t v16 = a1;
LABEL_22:
                  char v17 = sub_1B543F170(v16, v15, a3, a4);
                  uint64_t v18 = a3;
                  unint64_t v19 = a4;
                  break;
              }
              sub_1B5438A24(v18, v19);
            }
          }
          else
          {
            char v17 = 0;
          }
          return v17 & 1;
        case 2uLL:
          uint64_t v14 = *(void *)(a3 + 16);
          uint64_t v13 = *(void *)(a3 + 24);
          BOOL v11 = __OFSUB__(v13, v14);
          uint64_t v12 = v13 - v14;
          if (!v11) {
            goto LABEL_11;
          }
          goto LABEL_28;
        case 3uLL:
          char v17 = v8 == 0;
          return v17 & 1;
        default:
          uint64_t v12 = BYTE6(a4);
          goto LABEL_11;
      }
    case 2uLL:
      uint64_t v10 = *(void *)(a1 + 16);
      uint64_t v9 = *(void *)(a1 + 24);
      BOOL v11 = __OFSUB__(v9, v10);
      uint64_t v8 = v9 - v10;
      if (!v11) {
        goto LABEL_6;
      }
      goto LABEL_26;
    case 3uLL:
      goto LABEL_6;
    default:
      uint64_t v8 = BYTE6(a2);
      goto LABEL_6;
  }
}

unint64_t sub_1B543F598@<X0>(unint64_t *a1@<X0>, unint64_t *a2@<X8>)
{
  unint64_t result = sub_1B543F114(*a1, **(void **)(v2 + 16));
  if (!v3) {
    *a2 = result;
  }
  return result;
}

id sub_1B543F6F0()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MNTestClass();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for MNTestClass()
{
  return self;
}

uint64_t static MNTrace.currentVersion.getter()
{
  return 61;
}

unint64_t static MNTrace.mainSchema.getter()
{
  return 0xD000000000003460;
}

unint64_t static MNTrace.upgradeSchema(fromVersion:)(unint64_t a1)
{
  return sub_1B543F978(a1);
}

unint64_t MNTrace.TraceUpgradeError.errorDescription.getter()
{
  if (*(unsigned char *)(v0 + 8))
  {
    if (*(unsigned char *)(v0 + 8) == 1) {
      return 0xD00000000000006CLL;
    }
    else {
      return 0xD000000000000030;
    }
  }
  else
  {
    sub_1B5532030();
    sub_1B5531F10();
    sub_1B55320E0();
    sub_1B5531F10();
    swift_bridgeObjectRelease();
    sub_1B5531F10();
    return 0;
  }
}

unint64_t sub_1B543F978(unint64_t a1)
{
  if (a1 > 0x3D)
  {
    __break(1u);
LABEL_16:
    sub_1B5532080();
    __break(1u);
    JUMPOUT(0x1B543FBB4);
  }
  unint64_t v1 = a1;
  if (a1 == 61)
  {
    unint64_t v1 = 0;
  }
  else
  {
    if (a1 < 0x38)
    {
      sub_1B543FBCC();
      swift_allocError();
      *(void *)uint64_t v2 = v1;
      *(unsigned char *)(v2 + 8) = 0;
      swift_willThrow();
      swift_bridgeObjectRelease();
      return v1;
    }
    unint64_t v3 = a1;
    while (2)
    {
      switch(v3)
      {
        case '8':
        case '9':
        case ':':
        case ';':
        case '<':
          sub_1B5531F10();
          swift_bridgeObjectRelease();
          if (v3 == 60) {
            goto LABEL_11;
          }
          if (++v3 >= v1) {
            continue;
          }
          __break(1u);
LABEL_11:
          unint64_t v1 = 0;
          break;
        default:
          goto LABEL_16;
      }
      break;
    }
  }
  swift_bridgeObjectRetain();
  uint64_t v4 = sub_1B5531F00();
  swift_bridgeObjectRelease();
  if (v4 >= 1)
  {
    sub_1B5532030();
    swift_bridgeObjectRelease();
    sub_1B5531F10();
    swift_bridgeObjectRelease();
    sub_1B5531F10();
    return 0xD000000000000014;
  }
  return v1;
}

unint64_t sub_1B543FBCC()
{
  unint64_t result = qword_1E9D54FF8;
  if (!qword_1E9D54FF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9D54FF8);
  }
  return result;
}

uint64_t __swift_memcpy9_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *(unsigned char *)(result + 8) = *((unsigned char *)a2 + 8);
  *(void *)unint64_t result = v2;
  return result;
}

uint64_t _s17TraceUpgradeErrorOwet(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFE && *(unsigned char *)(a1 + 9)) {
    return (*(_DWORD *)a1 + 254);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 8);
  if (v3 <= 2) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t _s17TraceUpgradeErrorOwst(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(unsigned char *)(result + 8) = 0;
    *(void *)unint64_t result = a2 - 254;
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 9) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 9) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 8) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_1B543FCC4(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 8) <= 1u) {
    return *(unsigned __int8 *)(a1 + 8);
  }
  else {
    return (*(_DWORD *)a1 + 2);
  }
}

uint64_t sub_1B543FCDC(uint64_t result, unsigned int a2)
{
  if (a2 >= 2)
  {
    *(void *)unint64_t result = a2 - 2;
    LOBYTE(a2) = 2;
  }
  *(unsigned char *)(result + 8) = a2;
  return result;
}

ValueMetadata *type metadata accessor for MNTrace.TraceUpgradeError()
{
  return &type metadata for MNTrace.TraceUpgradeError;
}

id MNNavTrayGuidanceEvent.init(guidanceEvent:)(void *a1)
{
  id v2 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithGuidanceEvent_, a1);

  return v2;
}

id MNNavTrayGuidanceEvent.init(guidanceEvent:)(uint64_t a1)
{
  *(void *)(v1 + OBJC_IVAR___MNNavTrayGuidanceEvent__guidanceEvent) = a1;
  v3.super_class = (Class)MNNavTrayGuidanceEvent;
  return objc_msgSendSuper2(&v3, sel_init);
}

id MNNavTrayGuidanceEvent.title.getter()
{
  id v1 = objc_msgSend(*(id *)(v0 + OBJC_IVAR___MNNavTrayGuidanceEvent__guidanceEvent), sel_navTrayTitleString);
  return v1;
}

id MNNavTrayGuidanceEvent.detail.getter()
{
  id v1 = objc_msgSend(*(id *)(v0 + OBJC_IVAR___MNNavTrayGuidanceEvent__guidanceEvent), sel_navTrayDetailString);
  return v1;
}

uint64_t MNNavTrayGuidanceEvent.description.getter()
{
  id v1 = v0;
  sub_1B5532030();
  sub_1B5531F10();
  id v2 = objc_msgSend(v0, sel_title);
  if (v2)
  {
    objc_super v3 = v2;
    id v4 = objc_msgSend(v2, sel_stringWithDefaultOptions);

    sub_1B5531EE0();
  }
  sub_1B5531F10();
  swift_bridgeObjectRelease();
  sub_1B5531F10();
  id v5 = objc_msgSend(v1, sel_detail);
  if (v5)
  {
    uint64_t v6 = v5;
    id v7 = objc_msgSend(v5, sel_stringWithDefaultOptions);

    sub_1B5531EE0();
  }
  sub_1B5531F10();
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t static MNNavTrayGuidanceEvent.supportsSecureCoding.getter()
{
  return 1;
}

Swift::Void __swiftcall MNNavTrayGuidanceEvent.encode(with:)(NSCoder with)
{
  uint64_t v3 = *(void *)(v1 + OBJC_IVAR___MNNavTrayGuidanceEvent__guidanceEvent);
  id v4 = (id)sub_1B5531ED0();
  [(objc_class *)with.super.isa encodeObject:v3 forKey:v4];
}

void __swiftcall MNNavTrayGuidanceEvent.init(coder:)(MNNavTrayGuidanceEvent_optional *__return_ptr retstr, NSCoder coder)
{
}

id MNNavTrayGuidanceEvent.init(coder:)(void *a1)
{
  sub_1B5438B88(0, (unint64_t *)&unk_1E9D55008);
  uint64_t v3 = v1;
  *(void *)&v3[OBJC_IVAR___MNNavTrayGuidanceEvent__guidanceEvent] = sub_1B5531FC0();

  v6.receiver = v3;
  v6.super_class = (Class)MNNavTrayGuidanceEvent;
  id v4 = objc_msgSendSuper2(&v6, sel_init);

  return v4;
}

void __swiftcall MNNavTrayGuidanceEvent.init()(MNNavTrayGuidanceEvent *__return_ptr retstr)
{
  id v1 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  objc_msgSend(v1, sel_init);
}

void MNNavTrayGuidanceEvent.init()()
{
}

uint64_t type metadata accessor for MNNavTrayGuidanceEvent(uint64_t a1)
{
  return sub_1B5438B88(a1, &qword_1E9D550E0);
}

uint64_t _nlc_connect(_DWORD *a1)
{
  *(void *)sp = 0;
  id v2 = (mach_port_t *)MEMORY[0x1E4F14638];
  bootstrap_look_up(*MEMORY[0x1E4F14638], "com.apple.NetworkLinkConditioner", sp);
  if (bootstrap_look_up(*v2, "com.apple.NetworkLinkConditioner", sp))
  {
    puts("NLCd : Bootstrap failure");
    return 100;
  }
  else
  {
    mach_error_t v4 = nlc_connect(sp[0], a1, a1 + 1, &sp[1]);
    if (v4) {
      mach_error("nlc_connect:", v4);
    }
    return sp[1];
  }
}

uint64_t _nlc_disconnect(int *a1)
{
  unsigned int v4 = 0;
  mach_error_t v2 = nlc_disconnect(*a1, a1[1], &v4);
  if (v2) {
    mach_error("nlc_disconnect:", v2);
  }
  mach_port_deallocate(*MEMORY[0x1E4F14960], *a1);
  return v4;
}

uint64_t _nlc_start_simulation(mach_port_name_t *a1, long long *a2)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  unsigned int v17 = 0;
  *((_DWORD *)a2 + 1) = 0;
  long long v3 = a2[11];
  long long v28 = a2[10];
  long long v29 = v3;
  long long v30 = a2[12];
  long long v4 = a2[7];
  long long v24 = a2[6];
  long long v25 = v4;
  long long v5 = a2[9];
  long long v26 = a2[8];
  long long v27 = v5;
  long long v6 = a2[3];
  long long v20 = a2[2];
  long long v21 = v6;
  long long v7 = a2[5];
  long long v22 = a2[4];
  long long v23 = v7;
  long long v8 = a2[1];
  long long v18 = *a2;
  long long v19 = v8;
  mach_error_t v9 = nlc_simulate(*a1, (uint64_t)&v18, 0xD0u, a1[1], &v17);
  if (v9) {
    mach_error("_nlc_start_simulation:", v9);
  }
  long long v10 = v29;
  a2[10] = v28;
  a2[11] = v10;
  a2[12] = v30;
  long long v11 = v25;
  a2[6] = v24;
  a2[7] = v11;
  long long v12 = v27;
  a2[8] = v26;
  a2[9] = v12;
  long long v13 = v21;
  a2[2] = v20;
  a2[3] = v13;
  long long v14 = v23;
  a2[4] = v22;
  a2[5] = v14;
  long long v15 = v19;
  *a2 = v18;
  a2[1] = v15;
  return v17;
}

uint64_t _nlc_stop_simulation(mach_port_name_t *a1, long long *a2)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  unsigned int v17 = 0;
  *((_DWORD *)a2 + 1) = 1;
  long long v3 = a2[11];
  long long v28 = a2[10];
  long long v29 = v3;
  long long v30 = a2[12];
  long long v4 = a2[7];
  long long v24 = a2[6];
  long long v25 = v4;
  long long v5 = a2[9];
  long long v26 = a2[8];
  long long v27 = v5;
  long long v6 = a2[3];
  long long v20 = a2[2];
  long long v21 = v6;
  long long v7 = a2[5];
  long long v22 = a2[4];
  long long v23 = v7;
  long long v8 = a2[1];
  long long v18 = *a2;
  long long v19 = v8;
  mach_error_t v9 = nlc_stop_simulation(*a1, (uint64_t)&v18, 0xD0u, a1[1], &v17);
  if (v9) {
    mach_error("_nlc_stop_simulation:", v9);
  }
  long long v10 = v29;
  a2[10] = v28;
  a2[11] = v10;
  a2[12] = v30;
  long long v11 = v25;
  a2[6] = v24;
  a2[7] = v11;
  long long v12 = v27;
  a2[8] = v26;
  a2[9] = v12;
  long long v13 = v21;
  a2[2] = v20;
  a2[3] = v13;
  long long v14 = v23;
  a2[4] = v22;
  a2[5] = v14;
  long long v15 = v19;
  *a2 = v18;
  a2[1] = v15;
  return v17;
}

uint64_t _nlc_get_status(mach_port_name_t *a1, _DWORD *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  a2[1] = 2;
  size_t __n = 208;
  long long v4 = *((_OWORD *)a2 + 11);
  v14[10] = *((_OWORD *)a2 + 10);
  v14[11] = v4;
  v14[12] = *((_OWORD *)a2 + 12);
  long long v5 = *((_OWORD *)a2 + 7);
  v14[6] = *((_OWORD *)a2 + 6);
  v14[7] = v5;
  long long v6 = *((_OWORD *)a2 + 9);
  v14[8] = *((_OWORD *)a2 + 8);
  v14[9] = v6;
  long long v7 = *((_OWORD *)a2 + 3);
  v14[2] = *((_OWORD *)a2 + 2);
  v14[3] = v7;
  long long v8 = *((_OWORD *)a2 + 5);
  v14[4] = *((_OWORD *)a2 + 4);
  v14[5] = v8;
  long long v9 = *((_OWORD *)a2 + 1);
  v14[0] = *(_OWORD *)a2;
  v14[1] = v9;
  bzero(__src, 0x400uLL);
  mach_error_t status = nlc_get_status(*a1, (uint64_t)v14, 0xD0u, __src, &__n, a1[1], (_DWORD *)&__n + 1);
  if (status) {
    mach_error("_nlc_get_status:", status);
  }
  memcpy(a2, __src, __n);
  return HIDWORD(__n);
}

uint64_t nlc_connect(int a1, _DWORD *a2, _DWORD *a3, _DWORD *a4)
{
  memset(v18, 0, sizeof(v18));
  *(_OWORD *)&rcv_name_12[4] = 0u;
  int rcv_name = 0;
  mach_port_name_t reply_port = mig_get_reply_port();
  int rcv_name_4 = a1;
  mach_port_t rcv_name_8 = reply_port;
  int v13 = 5395;
  *(void *)rcv_name_12 = 0x9D4C00000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v13);
    mach_port_name_t reply_port = rcv_name_8;
  }
  uint64_t v9 = mach_msg((mach_msg_header_t *)&v13, 3, 0x18u, 0x40u, reply_port, 0, 0);
  uint64_t v10 = v9;
  if ((v9 - 268435458) <= 0xE && ((1 << (v9 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(rcv_name_8);
  }
  else
  {
    if (!v9)
    {
      if (*(_DWORD *)&rcv_name_12[4] == 71)
      {
        uint64_t v10 = 4294966988;
      }
      else if (*(_DWORD *)&rcv_name_12[4] == 40368)
      {
        if (v13 < 0)
        {
          uint64_t v10 = 4294966996;
          if (*(_DWORD *)&rcv_name_12[8] == 1 && rcv_name == 56 && !rcv_name_4 && HIWORD(v18[0]) << 16 == 1114112)
          {
            uint64_t v10 = 0;
            int v11 = v18[3];
            *a2 = *(_DWORD *)&rcv_name_12[12];
            *a3 = v11;
            *a4 = v18[4];
            return v10;
          }
        }
        else if (rcv_name == 36)
        {
          uint64_t v10 = 4294966996;
          if (*(_DWORD *)&rcv_name_12[16])
          {
            if (rcv_name_4) {
              uint64_t v10 = 4294966996;
            }
            else {
              uint64_t v10 = *(unsigned int *)&rcv_name_12[16];
            }
          }
        }
        else
        {
          uint64_t v10 = 4294966996;
        }
      }
      else
      {
        uint64_t v10 = 4294966995;
      }
      mach_msg_destroy((mach_msg_header_t *)&v13);
      return v10;
    }
    mig_dealloc_reply_port(rcv_name_8);
  }
  return v10;
}

uint64_t nlc_disconnect(int a1, int a2, _DWORD *a3)
{
  memset(&rcv_name[16], 0, 28);
  *(_OWORD *)int rcv_name = 0u;
  *(void *)&rcv_name[20] = *MEMORY[0x1E4F14068];
  *(_DWORD *)&rcv_name[28] = a2;
  mach_port_name_t reply_port = mig_get_reply_port();
  *(_DWORD *)&rcv_name[4] = a1;
  *(_DWORD *)&rcv_name[8] = reply_port;
  int v10 = 5395;
  *(void *)&rcv_name[12] = 0x9D4D00000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v10);
    mach_port_name_t reply_port = *(_DWORD *)&rcv_name[8];
  }
  uint64_t v6 = mach_msg((mach_msg_header_t *)&v10, 3, 0x24u, 0x30u, reply_port, 0, 0);
  uint64_t v7 = v6;
  if ((v6 - 268435458) > 0xE || ((1 << (v6 - 2)) & 0x4003) == 0)
  {
    if (v6)
    {
      mig_dealloc_reply_port(*(mach_port_t *)&rcv_name[8]);
      return v7;
    }
    if (*(_DWORD *)&rcv_name[16] == 71)
    {
      uint64_t v7 = 4294966988;
    }
    else if (*(_DWORD *)&rcv_name[16] == 40369)
    {
      if ((v10 & 0x80000000) == 0)
      {
        if (*(_DWORD *)rcv_name == 40)
        {
          if (!*(_DWORD *)&rcv_name[4])
          {
            uint64_t v7 = *(unsigned int *)&rcv_name[28];
            if (!*(_DWORD *)&rcv_name[28])
            {
              *a3 = *(_DWORD *)&rcv_name[32];
              return v7;
            }
            goto LABEL_23;
          }
        }
        else if (*(_DWORD *)rcv_name == 36)
        {
          if (*(_DWORD *)&rcv_name[4]) {
            BOOL v8 = 1;
          }
          else {
            BOOL v8 = *(_DWORD *)&rcv_name[28] == 0;
          }
          if (v8) {
            uint64_t v7 = 4294966996;
          }
          else {
            uint64_t v7 = *(unsigned int *)&rcv_name[28];
          }
          goto LABEL_23;
        }
      }
      uint64_t v7 = 4294966996;
    }
    else
    {
      uint64_t v7 = 4294966995;
    }
LABEL_23:
    mach_msg_destroy((mach_msg_header_t *)&v10);
    return v7;
  }
  mig_put_reply_port(*(mach_port_t *)&rcv_name[8]);
  return v7;
}

uint64_t nlc_simulate(mach_port_name_t a1, uint64_t a2, unsigned int a3, mach_port_name_t a4, _DWORD *a5)
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  *(_OWORD *)int rcv_name = 0u;
  long long v17 = 0u;
  *((void *)&v17 + 1) = *MEMORY[0x1E4F14068];
  if (a3 <= 0x400)
  {
    __memcpy_chk();
    LODWORD(v18) = a3;
    uint64_t v10 = (a3 + 3) & 0xFFFFFFFC;
    mach_msg_size_t v11 = v10 + 40;
    *(mach_port_name_t *)((char *)&rcv_name[9] + v10) = a4;
    mach_port_name_t reply_port = mig_get_reply_port();
    rcv_name[2] = a1;
    rcv_name[3] = reply_port;
    rcv_name[0] = 5395;
    *(void *)&long long v17 = 0x9D4E00000000;
    if (MEMORY[0x1E4F14B18])
    {
      voucher_mach_msg_set((mach_msg_header_t *)rcv_name);
      mach_port_name_t reply_port = rcv_name[3];
    }
    uint64_t v13 = mach_msg((mach_msg_header_t *)rcv_name, 3, v11, 0x30u, reply_port, 0, 0);
    uint64_t v5 = v13;
    if ((v13 - 268435458) <= 0xE && ((1 << (v13 - 2)) & 0x4003) != 0)
    {
      mig_put_reply_port(rcv_name[3]);
      return v5;
    }
    if (v13)
    {
      mig_dealloc_reply_port(rcv_name[3]);
      return v5;
    }
    if (DWORD1(v17) == 71)
    {
      uint64_t v5 = 4294966988;
    }
    else if (DWORD1(v17) == 40370)
    {
      if ((rcv_name[0] & 0x80000000) == 0)
      {
        if (rcv_name[1] == 40)
        {
          if (!rcv_name[2])
          {
            uint64_t v5 = v18;
            if (!v18)
            {
              *a5 = DWORD1(v18);
              return v5;
            }
            goto LABEL_25;
          }
        }
        else if (rcv_name[1] == 36)
        {
          if (rcv_name[2]) {
            BOOL v14 = 1;
          }
          else {
            BOOL v14 = v18 == 0;
          }
          if (v14) {
            uint64_t v5 = 4294966996;
          }
          else {
            uint64_t v5 = v18;
          }
          goto LABEL_25;
        }
      }
      uint64_t v5 = 4294966996;
    }
    else
    {
      uint64_t v5 = 4294966995;
    }
LABEL_25:
    mach_msg_destroy((mach_msg_header_t *)rcv_name);
    return v5;
  }
  return 4294966989;
}

uint64_t nlc_stop_simulation(mach_port_name_t a1, uint64_t a2, unsigned int a3, mach_port_name_t a4, _DWORD *a5)
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  *(_OWORD *)int rcv_name = 0u;
  long long v17 = 0u;
  *((void *)&v17 + 1) = *MEMORY[0x1E4F14068];
  if (a3 <= 0x400)
  {
    __memcpy_chk();
    LODWORD(v18) = a3;
    uint64_t v10 = (a3 + 3) & 0xFFFFFFFC;
    mach_msg_size_t v11 = v10 + 40;
    *(mach_port_name_t *)((char *)&rcv_name[9] + v10) = a4;
    mach_port_name_t reply_port = mig_get_reply_port();
    rcv_name[2] = a1;
    rcv_name[3] = reply_port;
    rcv_name[0] = 5395;
    *(void *)&long long v17 = 0x9D4F00000000;
    if (MEMORY[0x1E4F14B18])
    {
      voucher_mach_msg_set((mach_msg_header_t *)rcv_name);
      mach_port_name_t reply_port = rcv_name[3];
    }
    uint64_t v13 = mach_msg((mach_msg_header_t *)rcv_name, 3, v11, 0x30u, reply_port, 0, 0);
    uint64_t v5 = v13;
    if ((v13 - 268435458) <= 0xE && ((1 << (v13 - 2)) & 0x4003) != 0)
    {
      mig_put_reply_port(rcv_name[3]);
      return v5;
    }
    if (v13)
    {
      mig_dealloc_reply_port(rcv_name[3]);
      return v5;
    }
    if (DWORD1(v17) == 71)
    {
      uint64_t v5 = 4294966988;
    }
    else if (DWORD1(v17) == 40371)
    {
      if ((rcv_name[0] & 0x80000000) == 0)
      {
        if (rcv_name[1] == 40)
        {
          if (!rcv_name[2])
          {
            uint64_t v5 = v18;
            if (!v18)
            {
              *a5 = DWORD1(v18);
              return v5;
            }
            goto LABEL_25;
          }
        }
        else if (rcv_name[1] == 36)
        {
          if (rcv_name[2]) {
            BOOL v14 = 1;
          }
          else {
            BOOL v14 = v18 == 0;
          }
          if (v14) {
            uint64_t v5 = 4294966996;
          }
          else {
            uint64_t v5 = v18;
          }
          goto LABEL_25;
        }
      }
      uint64_t v5 = 4294966996;
    }
    else
    {
      uint64_t v5 = 4294966995;
    }
LABEL_25:
    mach_msg_destroy((mach_msg_header_t *)rcv_name);
    return v5;
  }
  return 4294966989;
}

uint64_t nlc_get_status(mach_port_name_t a1, uint64_t a2, unsigned int a3, void *a4, _DWORD *a5, mach_port_name_t a6, _DWORD *a7)
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  *(_OWORD *)size_t __n = 0u;
  long long v27 = 0u;
  *(_OWORD *)int rcv_name = 0u;
  long long v25 = 0u;
  *((void *)&v25 + 1) = *MEMORY[0x1E4F14068];
  if (a3 <= 0x400)
  {
    __memcpy_chk();
    LODWORD(__n[0]) = a3;
    uint64_t v14 = (a3 + 3) & 0xFFFFFFFC;
    mach_msg_size_t v15 = v14 + 40;
    *(mach_port_name_t *)((char *)&rcv_name[9] + v14) = a6;
    mach_port_name_t reply_port = mig_get_reply_port();
    rcv_name[2] = a1;
    rcv_name[3] = reply_port;
    rcv_name[0] = 5395;
    *(void *)&long long v25 = 0x9D5000000000;
    if (MEMORY[0x1E4F14B18])
    {
      voucher_mach_msg_set((mach_msg_header_t *)rcv_name);
      mach_port_name_t reply_port = rcv_name[3];
    }
    uint64_t v17 = mach_msg((mach_msg_header_t *)rcv_name, 3, v15, 0x434u, reply_port, 0, 0);
    uint64_t v7 = v17;
    if ((v17 - 268435458) <= 0xE && ((1 << (v17 - 2)) & 0x4003) != 0)
    {
      mig_put_reply_port(rcv_name[3]);
      return v7;
    }
    if (v17)
    {
      mig_dealloc_reply_port(rcv_name[3]);
      return v7;
    }
    if (DWORD1(v25) == 71)
    {
      uint64_t v7 = 4294966988;
    }
    else if (DWORD1(v25) == 40372)
    {
      if ((rcv_name[0] & 0x80000000) == 0)
      {
        if (rcv_name[1] - 1069 <= 0xFFFFFBFE)
        {
          if (rcv_name[2]) {
            BOOL v18 = 1;
          }
          else {
            BOOL v18 = LODWORD(__n[0]) == 0;
          }
          if (!v18 && rcv_name[1] == 36) {
            uint64_t v7 = LODWORD(__n[0]);
          }
          else {
            uint64_t v7 = 4294966996;
          }
          goto LABEL_27;
        }
        if (!rcv_name[2])
        {
          uint64_t v7 = LODWORD(__n[0]);
          if (LODWORD(__n[0])) {
            goto LABEL_27;
          }
          int v21 = HIDWORD(__n[0]);
          if (HIDWORD(__n[0]) <= 0x400)
          {
            uint64_t v7 = 4294966996;
            if (rcv_name[1] - 44 >= HIDWORD(__n[0]))
            {
              unsigned int v22 = (HIDWORD(__n[0]) + 3) & 0xFFFFFFFC;
              if (rcv_name[1] == v22 + 44)
              {
                long long v23 = (char *)&rcv_name[-256] + v22;
                memcpy(a4, &__n[1], HIDWORD(__n[0]));
                uint64_t v7 = 0;
                *a5 = v21;
                *a7 = *((_DWORD *)v23 + 266);
                return v7;
              }
            }
            goto LABEL_27;
          }
        }
      }
      uint64_t v7 = 4294966996;
    }
    else
    {
      uint64_t v7 = 4294966995;
    }
LABEL_27:
    mach_msg_destroy((mach_msg_header_t *)rcv_name);
    return v7;
  }
  return 4294966989;
}

void sub_1B54423B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B54431A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
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

void sub_1B54434F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B5445514(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43)
{
  _Block_object_dispose(&a43, 8);
  _Block_object_dispose((const void *)(v43 - 256), 8);
  _Block_object_dispose((const void *)(v43 - 208), 8);
  _Block_object_dispose((const void *)(v43 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_1B5445F48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41)
{
  _Block_object_dispose(&a41, 8);
  _Block_object_dispose((const void *)(v41 - 240), 8);
  _Block_object_dispose((const void *)(v41 - 192), 8);
  _Block_object_dispose((const void *)(v41 - 144), 8);
  _Unwind_Resume(a1);
}

id GetAudioLogForMNSoundEffectResourceControllerCategory()
{
  if (qword_1EB59BFC8 != -1) {
    dispatch_once(&qword_1EB59BFC8, &__block_literal_global);
  }
  uint64_t v0 = (void *)_MergedGlobals_15;
  return v0;
}

uint64_t __GetAudioLogForMNSoundEffectResourceControllerCategory_block_invoke()
{
  _MergedGlobals_15 = (uint64_t)os_log_create("com.apple.Navigation.Audio", "MNSoundEffectResourceController");
  return MEMORY[0x1F41817F8]();
}

BOOL MNProtocolDeclaresSelector(void *a1, const char *a2)
{
  long long v3 = a1;
  BOOL v4 = 1;
  if (!(unint64_t)protocol_getMethodDescription(v3, a2, 1, 1).name) {
    BOOL v4 = (unint64_t)protocol_getMethodDescription(v3, a2, 0, 1).name != 0;
  }

  return v4;
}

void sub_1B544A1E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, char a17)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a17, 8);
  _Unwind_Resume(a1);
}

void sub_1B544A400(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

void sub_1B544A74C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id location,char a26)
{
  objc_destroyWeak(v26);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a26, 8);
  _Unwind_Resume(a1);
}

void sub_1B544CC3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id GetAudioLogForMNAnnouncementEngineCategory()
{
  if (qword_1EB59BFE8 != -1) {
    dispatch_once(&qword_1EB59BFE8, &__block_literal_global_36);
  }
  uint64_t v0 = (void *)_MergedGlobals_17;
  return v0;
}

uint64_t __GetAudioLogForMNAnnouncementEngineCategory_block_invoke()
{
  _MergedGlobals_17 = (uint64_t)os_log_create("com.apple.Navigation.Audio", "MNAnnouncementEngine");
  return MEMORY[0x1F41817F8]();
}

__CFString *NAVAudioErrorDomain()
{
  return @"MNAudioSystemError";
}

void _MNNavigationServerExceptionHandler(void *a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  uint64_t v2 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    LOWORD(v5) = 0;
    _os_log_impl(&dword_1B542B000, v2, OS_LOG_TYPE_ERROR, "***** navd exception, call stack: *****", (uint8_t *)&v5, 2u);
  }

  long long v3 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    BOOL v4 = [v1 callStackSymbols];
    int v5 = 138477827;
    uint64_t v6 = v4;
    _os_log_impl(&dword_1B542B000, v3, OS_LOG_TYPE_ERROR, "%{private}@", (uint8_t *)&v5, 0xCu);
  }
}

void sub_1B5453400(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41)
{
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

id MNGetErrorsLog()
{
  if (MNGetErrorsLog_onceToken != -1) {
    dispatch_once(&MNGetErrorsLog_onceToken, &__block_literal_global_5);
  }
  uint64_t v0 = (void *)MNGetErrorsLog_log;
  return v0;
}

uint64_t __MNGetErrorsLog_block_invoke()
{
  MNGetErrorsLog_os_log_t log = (uint64_t)os_log_create("com.apple.Navigation", "Errors");
  return MEMORY[0x1F41817F8]();
}

id MNGetMNCarPlayConnectionMonitorLog()
{
  if (MNGetMNCarPlayConnectionMonitorLog_onceToken != -1) {
    dispatch_once(&MNGetMNCarPlayConnectionMonitorLog_onceToken, &__block_literal_global_34);
  }
  uint64_t v0 = (void *)MNGetMNCarPlayConnectionMonitorLog_log;
  return v0;
}

uint64_t __MNGetMNCarPlayConnectionMonitorLog_block_invoke()
{
  MNGetMNCarPlayConnectionMonitorLog_os_log_t log = (uint64_t)os_log_create("com.apple.Navigation", "MNCarPlayConnectionMonitor");
  return MEMORY[0x1F41817F8]();
}

id MNGetMNDepartureUpdaterLog()
{
  if (MNGetMNDepartureUpdaterLog_onceToken != -1) {
    dispatch_once(&MNGetMNDepartureUpdaterLog_onceToken, &__block_literal_global_37_0);
  }
  uint64_t v0 = (void *)MNGetMNDepartureUpdaterLog_log;
  return v0;
}

uint64_t __MNGetMNDepartureUpdaterLog_block_invoke()
{
  MNGetMNDepartureUpdaterLog_os_log_t log = (uint64_t)os_log_create("com.apple.Navigation", "MNDepartureUpdater");
  return MEMORY[0x1F41817F8]();
}

id MNGetMNDirectionsRequestLog()
{
  if (MNGetMNDirectionsRequestLog_onceToken != -1) {
    dispatch_once(&MNGetMNDirectionsRequestLog_onceToken, &__block_literal_global_40);
  }
  uint64_t v0 = (void *)MNGetMNDirectionsRequestLog_log;
  return v0;
}

uint64_t __MNGetMNDirectionsRequestLog_block_invoke()
{
  MNGetMNDirectionsRequestLog_os_log_t log = (uint64_t)os_log_create("com.apple.Navigation", "MNDirectionsRequest");
  return MEMORY[0x1F41817F8]();
}

id MNGetMNGuidanceManagerLog()
{
  if (MNGetMNGuidanceManagerLog_onceToken != -1) {
    dispatch_once(&MNGetMNGuidanceManagerLog_onceToken, &__block_literal_global_42_0);
  }
  uint64_t v0 = (void *)MNGetMNGuidanceManagerLog_log;
  return v0;
}

uint64_t __MNGetMNGuidanceManagerLog_block_invoke()
{
  MNGetMNGuidanceManagerLog_os_log_t log = (uint64_t)os_log_create("com.apple.Navigation", "MNGuidanceManager");
  return MEMORY[0x1F41817F8]();
}

id MNGetMNIdleTimerUpdaterLog()
{
  if (MNGetMNIdleTimerUpdaterLog_onceToken != -1) {
    dispatch_once(&MNGetMNIdleTimerUpdaterLog_onceToken, &__block_literal_global_44_0);
  }
  uint64_t v0 = (void *)MNGetMNIdleTimerUpdaterLog_log;
  return v0;
}

uint64_t __MNGetMNIdleTimerUpdaterLog_block_invoke()
{
  MNGetMNIdleTimerUpdaterLog_os_log_t log = (uint64_t)os_log_create("com.apple.Navigation", "MNIdleTimerUpdater");
  return MEMORY[0x1F41817F8]();
}

uint64_t __MNGetMNLocationProviderLog_block_invoke()
{
  MNGetMNLocationProviderLog_os_log_t log = (uint64_t)os_log_create("com.apple.Navigation", "MNLocationProvider");
  return MEMORY[0x1F41817F8]();
}

id MNGetMNLocationTrackerLog()
{
  if (MNGetMNLocationTrackerLog_onceToken != -1) {
    dispatch_once(&MNGetMNLocationTrackerLog_onceToken, &__block_literal_global_49);
  }
  uint64_t v0 = (void *)MNGetMNLocationTrackerLog_log;
  return v0;
}

uint64_t __MNGetMNLocationTrackerLog_block_invoke()
{
  MNGetMNLocationTrackerLog_os_log_t log = (uint64_t)os_log_create("com.apple.Navigation", "MNLocationTracker");
  return MEMORY[0x1F41817F8]();
}

id MNGetMNNavigationSessionLog()
{
  if (MNGetMNNavigationSessionLog_onceToken != -1) {
    dispatch_once(&MNGetMNNavigationSessionLog_onceToken, &__block_literal_global_56);
  }
  uint64_t v0 = (void *)MNGetMNNavigationSessionLog_log;
  return v0;
}

uint64_t __MNGetMNNavigationSessionLog_block_invoke()
{
  MNGetMNNavigationSessionLog_os_log_t log = (uint64_t)os_log_create("com.apple.Navigation", "MNNavigationSession");
  return MEMORY[0x1F41817F8]();
}

id MNGetMNNavigationSimulationLog()
{
  if (MNGetMNNavigationSimulationLog_onceToken != -1) {
    dispatch_once(&MNGetMNNavigationSimulationLog_onceToken, &__block_literal_global_58);
  }
  uint64_t v0 = (void *)MNGetMNNavigationSimulationLog_log;
  return v0;
}

uint64_t __MNGetMNNavigationSimulationLog_block_invoke()
{
  MNGetMNNavigationSimulationLog_os_log_t log = (uint64_t)os_log_create("com.apple.Navigation", "MNNavigationSimulation");
  return MEMORY[0x1F41817F8]();
}

id MNGetMNNavigationStateManagerLog()
{
  if (MNGetMNNavigationStateManagerLog_onceToken != -1) {
    dispatch_once(&MNGetMNNavigationStateManagerLog_onceToken, &__block_literal_global_61);
  }
  uint64_t v0 = (void *)MNGetMNNavigationStateManagerLog_log;
  return v0;
}

uint64_t __MNGetMNNavigationStateManagerLog_block_invoke()
{
  MNGetMNNavigationStateManagerLog_os_log_t log = (uint64_t)os_log_create("com.apple.Navigation", "MNNavigationStateManager");
  return MEMORY[0x1F41817F8]();
}

id MNGetMNNavigationXPCLog()
{
  if (MNGetMNNavigationXPCLog_onceToken != -1) {
    dispatch_once(&MNGetMNNavigationXPCLog_onceToken, &__block_literal_global_63);
  }
  uint64_t v0 = (void *)MNGetMNNavigationXPCLog_log;
  return v0;
}

uint64_t __MNGetMNNavigationXPCLog_block_invoke()
{
  MNGetMNNavigationXPCLog_os_log_t log = (uint64_t)os_log_create("com.apple.Navigation", "MNNavigationXPC");
  return MEMORY[0x1F41817F8]();
}

id MNGetMNParkedVehicleDetectorLog()
{
  if (MNGetMNParkedVehicleDetectorLog_onceToken != -1) {
    dispatch_once(&MNGetMNParkedVehicleDetectorLog_onceToken, &__block_literal_global_65);
  }
  uint64_t v0 = (void *)MNGetMNParkedVehicleDetectorLog_log;
  return v0;
}

uint64_t __MNGetMNParkedVehicleDetectorLog_block_invoke()
{
  MNGetMNParkedVehicleDetectorLog_os_log_t log = (uint64_t)os_log_create("com.apple.Navigation", "MNParkedVehicleDetector");
  return MEMORY[0x1F41817F8]();
}

id MNGetMNRouteAttributesLog()
{
  if (MNGetMNRouteAttributesLog_onceToken != -1) {
    dispatch_once(&MNGetMNRouteAttributesLog_onceToken, &__block_literal_global_68);
  }
  uint64_t v0 = (void *)MNGetMNRouteAttributesLog_log;
  return v0;
}

uint64_t __MNGetMNRouteAttributesLog_block_invoke()
{
  MNGetMNRouteAttributesLog_os_log_t log = (uint64_t)os_log_create("com.apple.Navigation", "MNRouteAttributes");
  return MEMORY[0x1F41817F8]();
}

id MNGetMNRouteEditorLog()
{
  if (MNGetMNRouteEditorLog_onceToken != -1) {
    dispatch_once(&MNGetMNRouteEditorLog_onceToken, &__block_literal_global_71);
  }
  uint64_t v0 = (void *)MNGetMNRouteEditorLog_log;
  return v0;
}

uint64_t __MNGetMNRouteEditorLog_block_invoke()
{
  MNGetMNRouteEditorLog_os_log_t log = (uint64_t)os_log_create("com.apple.Navigation", "MNRouteEditor");
  return MEMORY[0x1F41817F8]();
}

id MNGetMNRouteStorageLog()
{
  if (MNGetMNRouteStorageLog_onceToken != -1) {
    dispatch_once(&MNGetMNRouteStorageLog_onceToken, &__block_literal_global_74);
  }
  uint64_t v0 = (void *)MNGetMNRouteStorageLog_log;
  return v0;
}

uint64_t __MNGetMNRouteStorageLog_block_invoke()
{
  MNGetMNRouteStorageLog_os_log_t log = (uint64_t)os_log_create("com.apple.Navigation", "MNRouteStorage");
  return MEMORY[0x1F41817F8]();
}

id MNGetMNServerSessionStateInfoLog()
{
  if (MNGetMNServerSessionStateInfoLog_onceToken != -1) {
    dispatch_once(&MNGetMNServerSessionStateInfoLog_onceToken, &__block_literal_global_76);
  }
  uint64_t v0 = (void *)MNGetMNServerSessionStateInfoLog_log;
  return v0;
}

uint64_t __MNGetMNServerSessionStateInfoLog_block_invoke()
{
  MNGetMNServerSessionStateInfoLog_os_log_t log = (uint64_t)os_log_create("com.apple.Navigation", "MNServerSessionStateInfo");
  return MEMORY[0x1F41817F8]();
}

id MNGetMNStringExtrasLog()
{
  if (MNGetMNStringExtrasLog_onceToken != -1) {
    dispatch_once(&MNGetMNStringExtrasLog_onceToken, &__block_literal_global_79);
  }
  uint64_t v0 = (void *)MNGetMNStringExtrasLog_log;
  return v0;
}

uint64_t __MNGetMNStringExtrasLog_block_invoke()
{
  MNGetMNStringExtrasLog_os_log_t log = (uint64_t)os_log_create("com.apple.Navigation", "MNStringExtras");
  return MEMORY[0x1F41817F8]();
}

id MNGetMNSuggestedNavigationModeLog()
{
  if (MNGetMNSuggestedNavigationModeLog_onceToken != -1) {
    dispatch_once(&MNGetMNSuggestedNavigationModeLog_onceToken, &__block_literal_global_82);
  }
  uint64_t v0 = (void *)MNGetMNSuggestedNavigationModeLog_log;
  return v0;
}

uint64_t __MNGetMNSuggestedNavigationModeLog_block_invoke()
{
  MNGetMNSuggestedNavigationModeLog_os_log_t log = (uint64_t)os_log_create("com.apple.Navigation", "MNSuggestedNavigationMode");
  return MEMORY[0x1F41817F8]();
}

id MNGetMNTimeAndDistanceUpdaterLog()
{
  if (MNGetMNTimeAndDistanceUpdaterLog_onceToken != -1) {
    dispatch_once(&MNGetMNTimeAndDistanceUpdaterLog_onceToken, &__block_literal_global_85);
  }
  uint64_t v0 = (void *)MNGetMNTimeAndDistanceUpdaterLog_log;
  return v0;
}

uint64_t __MNGetMNTimeAndDistanceUpdaterLog_block_invoke()
{
  MNGetMNTimeAndDistanceUpdaterLog_os_log_t log = (uint64_t)os_log_create("com.apple.Navigation", "MNTimeAndDistanceUpdater");
  return MEMORY[0x1F41817F8]();
}

id MNGetMNTraceLog()
{
  if (MNGetMNTraceLog_onceToken != -1) {
    dispatch_once(&MNGetMNTraceLog_onceToken, &__block_literal_global_88);
  }
  uint64_t v0 = (void *)MNGetMNTraceLog_log;
  return v0;
}

uint64_t __MNGetMNTraceLog_block_invoke()
{
  MNGetMNTraceLog_os_log_t log = (uint64_t)os_log_create("com.apple.Navigation", "MNTrace");
  return MEMORY[0x1F41817F8]();
}

id MNGetMNTunnelProjectorLog()
{
  if (MNGetMNTunnelProjectorLog_onceToken != -1) {
    dispatch_once(&MNGetMNTunnelProjectorLog_onceToken, &__block_literal_global_90);
  }
  uint64_t v0 = (void *)MNGetMNTunnelProjectorLog_log;
  return v0;
}

uint64_t __MNGetMNTunnelProjectorLog_block_invoke()
{
  MNGetMNTunnelProjectorLog_os_log_t log = (uint64_t)os_log_create("com.apple.Navigation", "MNTunnelProjector");
  return MEMORY[0x1F41817F8]();
}

id MNGetMNVehicleMonitorLog()
{
  if (MNGetMNVehicleMonitorLog_onceToken != -1) {
    dispatch_once(&MNGetMNVehicleMonitorLog_onceToken, &__block_literal_global_93);
  }
  uint64_t v0 = (void *)MNGetMNVehicleMonitorLog_log;
  return v0;
}

uint64_t __MNGetMNVehicleMonitorLog_block_invoke()
{
  MNGetMNVehicleMonitorLog_os_log_t log = (uint64_t)os_log_create("com.apple.Navigation", "MNVehicleMonitor");
  return MEMORY[0x1F41817F8]();
}

id MNGetMNVirtualGarageManagerLog()
{
  if (MNGetMNVirtualGarageManagerLog_onceToken != -1) {
    dispatch_once(&MNGetMNVirtualGarageManagerLog_onceToken, &__block_literal_global_96);
  }
  uint64_t v0 = (void *)MNGetMNVirtualGarageManagerLog_log;
  return v0;
}

uint64_t __MNGetMNVirtualGarageManagerLog_block_invoke()
{
  MNGetMNVirtualGarageManagerLog_os_log_t log = (uint64_t)os_log_create("com.apple.Navigation", "MNVirtualGarageManager");
  return MEMORY[0x1F41817F8]();
}

id MNGetMNWalkingRouteBackgroundLoaderLog()
{
  if (MNGetMNWalkingRouteBackgroundLoaderLog_onceToken != -1) {
    dispatch_once(&MNGetMNWalkingRouteBackgroundLoaderLog_onceToken, &__block_literal_global_99);
  }
  uint64_t v0 = (void *)MNGetMNWalkingRouteBackgroundLoaderLog_log;
  return v0;
}

uint64_t __MNGetMNWalkingRouteBackgroundLoaderLog_block_invoke()
{
  MNGetMNWalkingRouteBackgroundLoaderLog_os_log_t log = (uint64_t)os_log_create("com.apple.Navigation", "MNWalkingRouteBackgroundLoader");
  return MEMORY[0x1F41817F8]();
}

id MNGetMNXPCTransactionManagerLog()
{
  if (MNGetMNXPCTransactionManagerLog_onceToken != -1) {
    dispatch_once(&MNGetMNXPCTransactionManagerLog_onceToken, &__block_literal_global_102);
  }
  uint64_t v0 = (void *)MNGetMNXPCTransactionManagerLog_log;
  return v0;
}

uint64_t __MNGetMNXPCTransactionManagerLog_block_invoke()
{
  MNGetMNXPCTransactionManagerLog_os_log_t log = (uint64_t)os_log_create("com.apple.Navigation", "MNXPCTransactionManager");
  return MEMORY[0x1F41817F8]();
}

id MNGetProcessHandlingLog()
{
  if (qword_1EB59C008 != -1) {
    dispatch_once(&qword_1EB59C008, &__block_literal_global_104);
  }
  uint64_t v0 = (void *)_MergedGlobals_19;
  return v0;
}

uint64_t __MNGetProcessHandlingLog_block_invoke()
{
  _MergedGlobals_19 = (uint64_t)os_log_create("com.apple.Navigation", "ProcessHandling");
  return MEMORY[0x1F41817F8]();
}

uint64_t __MNGetPuckTrackingLog_block_invoke()
{
  MNGetPuckTrackingLog_os_log_t log = (uint64_t)os_log_create("com.apple.Navigation", "PuckTracking");
  return MEMORY[0x1F41817F8]();
}

BOOL MNFormattedStringOptionsIsEqual(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2
      && *((void *)a1 + 1) == *((void *)a2 + 1)
      && a1[16] == a2[16]
      && a1[17] == a2[17]
      && a1[18] == a2[18]
      && *((double *)a1 + 3) == *((double *)a2 + 3);
}

unint64_t MNFormattedStringOptionsHash(unsigned __int8 *a1)
{
  return *((void *)a1 + 1) ^ *a1 ^ a1[16] ^ (unint64_t)a1[17];
}

int *MNGetHoursAndMinutesForTimeInterval(int *result, int *a2, double a3)
{
  int v3 = (int)(a3 / 3600.0);
  *unint64_t result = v3;
  int v4 = vcvtpd_s64_f64((a3 - (double)(3600 * v3)) / 60.0);
  if (v4 >= 59) {
    int v4 = 59;
  }
  *a2 = v4;
  return result;
}

id MNGetMNSequenceLog()
{
  if (qword_1EB59C098 != -1) {
    dispatch_once(&qword_1EB59C098, &__block_literal_global_8);
  }
  uint64_t v0 = (void *)_MergedGlobals_22;
  return v0;
}

void sub_1B545EFF4(_Unwind_Exception *a1)
{
}

void sub_1B545F188(_Unwind_Exception *a1)
{
}

void sub_1B545F624(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose((const void *)(v31 - 144), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2(uint64_t a1, uint64_t a2)
{
  uint64_t result = MEMORY[0x1BA99B3A0](*(void *)(a2 + 40));
  *(void *)(a1 + 40) = result;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
}

void sub_1B545FBD0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

uint64_t __MNGetMNSequenceLog_block_invoke()
{
  _MergedGlobals_22 = (uint64_t)os_log_create("com.apple.Navigation", "MNSequence");
  return MEMORY[0x1F41817F8]();
}

void sub_1B546024C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B5465814(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id GetAudioLogForMNAudioHardwareEngineCategory()
{
  if (qword_1EB59C0A8 != -1) {
    dispatch_once(&qword_1EB59C0A8, &__block_literal_global_10);
  }
  uint64_t v0 = (void *)_MergedGlobals_23;
  return v0;
}

void sub_1B54669F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3(uint64_t a1)
{
}

uint64_t __GetAudioLogForMNAudioHardwareEngineCategory_block_invoke()
{
  _MergedGlobals_23 = (uint64_t)os_log_create("com.apple.Navigation.Audio", "MNAudioHardwareEngine");
  return MEMORY[0x1F41817F8]();
}

id _routeStorageQueue()
{
  if (qword_1EB59C0B8 != -1) {
    dispatch_once(&qword_1EB59C0B8, &__block_literal_global_11);
  }
  uint64_t v0 = (void *)_MergedGlobals_24;
  return v0;
}

void ___routeStorageQueue_block_invoke()
{
  uint64_t v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.navd.routeStorageQueue", v2);
  uint64_t v1 = (void *)_MergedGlobals_24;
  _MergedGlobals_24 = (uint64_t)v0;
}

id MNRouteStorageDirectory(void *a1)
{
  id v1 = a1;
  uint64_t v2 = +[MNFilePaths navTempDirectoryPath];
  if ([v1 length])
  {
    uint64_t v3 = [v2 stringByAppendingPathComponent:v1];

    uint64_t v2 = (void *)v3;
  }

  return v2;
}

BOOL MNSaveRoute(void *a1, char a2, void *a3)
{
  return MNSaveRouteWithSubpath(a1, 0, a2, a3);
}

BOOL MNSaveRouteWithSubpath(void *a1, void *a2, char a3, void *a4)
{
  id v7 = a1;
  id v8 = a2;
  if (v7)
  {
    uint64_t v33 = 0;
    long long v34 = &v33;
    uint64_t v35 = 0x2020000000;
    char v36 = 1;
    *(void *)uint64_t v27 = 0;
    long long v28 = v27;
    uint64_t v29 = 0x3032000000;
    long long v30 = __Block_byref_object_copy__4;
    uint64_t v31 = __Block_byref_object_dispose__4;
    id v32 = 0;
    uint64_t v9 = MNGetMNRouteStorageLog();
    os_signpost_id_t v10 = os_signpost_id_generate(v9);

    mach_msg_size_t v11 = MNGetMNRouteStorageLog();
    long long v12 = v11;
    if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B542B000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "ActiveRouteInfoDiskWrite", "", buf, 2u);
    }

    uint64_t v13 = _routeStorageQueue();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __MNSaveRouteWithSubpath_block_invoke;
    block[3] = &unk_1E60F6F48;
    id v21 = v8;
    char v25 = a3;
    id v22 = v7;
    long long v23 = v27;
    long long v24 = &v33;
    dispatch_sync(v13, block);

    uint64_t v14 = MNGetMNRouteStorageLog();
    mach_msg_size_t v15 = v14;
    if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B542B000, v15, OS_SIGNPOST_INTERVAL_END, v10, "ActiveRouteInfoDiskWrite", "", buf, 2u);
    }

    if (a4)
    {
      uint64_t v16 = (void *)*((void *)v28 + 5);
      if (v16) {
        *a4 = v16;
      }
    }
    BOOL v17 = *((unsigned char *)v34 + 24) != 0;

    _Block_object_dispose(v27, 8);
    _Block_object_dispose(&v33, 8);
  }
  else
  {
    BOOL v18 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v27 = 0;
      _os_log_impl(&dword_1B542B000, v18, OS_LOG_TYPE_ERROR, "No route passed for saving", v27, 2u);
    }

    BOOL v17 = 0;
  }

  return v17;
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4(uint64_t a1)
{
}

void __MNSaveRouteWithSubpath_block_invoke(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = MNRouteStorageDirectory(*(void **)(a1 + 32));
  uint64_t v3 = [*(id *)(a1 + 40) uniqueRouteID];
  int v4 = [v3 UUIDString];
  int v5 = [v2 stringByAppendingPathComponent:v4];
  uint64_t v6 = +[MNFilePaths routeHandleExtension];
  id v7 = [v5 stringByAppendingPathExtension:v6];

  id v8 = [MEMORY[0x1E4F28CB8] defaultManager];
  if ([v8 fileExistsAtPath:v7])
  {
    int v9 = *(unsigned __int8 *)(a1 + 64);

    if (!v9)
    {
LABEL_14:
      os_signpost_id_t v10 = [MEMORY[0x1E4F28CB8] defaultManager];
      uint64_t v22 = *MEMORY[0x1E4F28310];
      long long v12 = [MEMORY[0x1E4F1C9C8] date];
      long long v23 = v12;
      BOOL v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v23 forKeys:&v22 count:1];
      [v10 setAttributes:v17 ofItemAtPath:v7 error:0];
      goto LABEL_15;
    }
  }
  else
  {
  }
  os_signpost_id_t v10 = (void *)[objc_alloc(MEMORY[0x1E4F28DB0]) initRequiringSecureCoding:1];
  [v10 encodeObject:*(void *)(a1 + 40) forKey:@"_route"];
  uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
  id obj = *(id *)(v11 + 40);
  +[MNFilePaths createFolderIfNotPresent:v2 error:&obj];
  objc_storeStrong((id *)(v11 + 40), obj);
  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    long long v12 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      *(_DWORD *)buf = 138412290;
      char v25 = v13;
      _os_log_impl(&dword_1B542B000, v12, OS_LOG_TYPE_ERROR, "Encountered error <%@> when creating tmp folder", buf, 0xCu);
    }
  }
  else
  {
    uint64_t v14 = [v10 encodedData];
    uint64_t v15 = *(void *)(*(void *)(a1 + 48) + 8);
    id v20 = *(id *)(v15 + 40);
    [v14 writeToFile:v7 options:1073741825 error:&v20];
    objc_storeStrong((id *)(v15 + 40), v20);

    if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
      long long v19 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        char v25 = v7;
        _os_log_impl(&dword_1B542B000, v19, OS_LOG_TYPE_DEFAULT, "Saved %@", buf, 0xCu);
      }

      goto LABEL_14;
    }
    long long v12 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      BOOL v17 = [*(id *)(a1 + 40) uniqueRouteID];
      BOOL v18 = [v17 UUIDString];
      *(_DWORD *)buf = 138412546;
      char v25 = v16;
      __int16 v26 = 2112;
      uint64_t v27 = v18;
      _os_log_impl(&dword_1B542B000, v12, OS_LOG_TYPE_ERROR, "Encountered error <%@> when saving route %@", buf, 0x16u);

LABEL_15:
    }
  }
}

id MNGetRouteWithID(void *a1, void *a2)
{
  return MNGetRouteFromSubpathWithID(a1, 0, a2);
}

id MNGetRouteFromSubpathWithID(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  if (v5)
  {
    *(void *)long long v30 = 0;
    uint64_t v31 = v30;
    uint64_t v32 = 0x3032000000;
    uint64_t v33 = __Block_byref_object_copy__4;
    long long v34 = __Block_byref_object_dispose__4;
    id v35 = 0;
    uint64_t v24 = 0;
    char v25 = &v24;
    uint64_t v26 = 0x3032000000;
    uint64_t v27 = __Block_byref_object_copy__4;
    uint64_t v28 = __Block_byref_object_dispose__4;
    id v29 = 0;
    id v7 = MNGetMNRouteStorageLog();
    os_signpost_id_t v8 = os_signpost_id_generate(v7);

    int v9 = MNGetMNRouteStorageLog();
    os_signpost_id_t v10 = v9;
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B542B000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "ActiveRouteInfoDiskRead", "", buf, 2u);
    }

    uint64_t v11 = _routeStorageQueue();
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __MNGetRouteFromSubpathWithID_block_invoke;
    v18[3] = &unk_1E60F6F70;
    id v19 = v6;
    id v20 = v5;
    id v21 = &v24;
    uint64_t v22 = v30;
    dispatch_sync(v11, v18);

    long long v12 = MNGetMNRouteStorageLog();
    uint64_t v13 = v12;
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B542B000, v13, OS_SIGNPOST_INTERVAL_END, v8, "ActiveRouteInfoDiskRead", "", buf, 2u);
    }

    if (a3)
    {
      uint64_t v14 = (void *)v25[5];
      if (v14) {
        *a3 = v14;
      }
    }
    id v15 = *((id *)v31 + 5);

    _Block_object_dispose(&v24, 8);
    _Block_object_dispose(v30, 8);
  }
  else
  {
    uint64_t v16 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long v30 = 0;
      _os_log_impl(&dword_1B542B000, v16, OS_LOG_TYPE_ERROR, "No route ID passed for retrieving.", v30, 2u);
    }

    id v15 = 0;
  }

  return v15;
}

void __MNGetRouteFromSubpathWithID_block_invoke(uint64_t a1)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = MNRouteStorageDirectory(*(void **)(a1 + 32));
  uint64_t v3 = [*(id *)(a1 + 40) UUIDString];
  uint64_t v4 = [v2 stringByAppendingPathComponent:v3];
  id v5 = +[MNFilePaths routeHandleExtension];
  id v6 = [(id)v4 stringByAppendingPathExtension:v5];

  id v7 = [MEMORY[0x1E4F28CB8] defaultManager];
  LOBYTE(v4) = [v7 fileExistsAtPath:v6];

  if (v4)
  {
    uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
    id obj = *(id *)(v8 + 40);
    int v9 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v6 options:0 error:&obj];
    objc_storeStrong((id *)(v8 + 40), obj);
    if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
    {
      os_signpost_id_t v10 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        uint64_t v11 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
        *(_DWORD *)buf = 138412546;
        id v35 = v11;
        __int16 v36 = 2112;
        long long v37 = v6;
        _os_log_impl(&dword_1B542B000, v10, OS_LOG_TYPE_ERROR, "Encountered error <%@> while reading route %@", buf, 0x16u);
      }
      goto LABEL_15;
    }
    id v16 = objc_alloc(MEMORY[0x1E4F28DC0]);
    uint64_t v17 = *(void *)(*(void *)(a1 + 48) + 8);
    id v30 = *(id *)(v17 + 40);
    os_signpost_id_t v10 = [v16 initForReadingFromData:v9 error:&v30];
    objc_storeStrong((id *)(v17 + 40), v30);
    if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
    {
      BOOL v18 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        id v19 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
        *(_DWORD *)buf = 138412546;
        id v35 = v19;
        __int16 v36 = 2112;
        long long v37 = v6;
        _os_log_impl(&dword_1B542B000, v18, OS_LOG_TYPE_ERROR, "Encountered error <%@> while reading route %@", buf, 0x16u);
      }
    }
    else
    {
      uint64_t v20 = [v10 decodeObjectOfClass:objc_opt_class() forKey:@"_route"];
      uint64_t v21 = *(void *)(*(void *)(a1 + 56) + 8);
      uint64_t v22 = *(void **)(v21 + 40);
      *(void *)(v21 + 40) = v20;

      long long v23 = [MEMORY[0x1E4F28CB8] defaultManager];
      uint64_t v32 = *MEMORY[0x1E4F28310];
      uint64_t v24 = [MEMORY[0x1E4F1C9C8] date];
      uint64_t v33 = v24;
      char v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v33 forKeys:&v32 count:1];
      uint64_t v26 = *(void *)(*(void *)(a1 + 48) + 8);
      id v29 = *(id *)(v26 + 40);
      [v23 setAttributes:v25 ofItemAtPath:v6 error:&v29];
      objc_storeStrong((id *)(v26 + 40), v29);

      if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
      {
LABEL_15:

        goto LABEL_16;
      }
      BOOL v18 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        uint64_t v27 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
        uint64_t v28 = [*(id *)(a1 + 40) UUIDString];
        *(_DWORD *)buf = 138412546;
        id v35 = v27;
        __int16 v36 = 2112;
        long long v37 = v28;
        _os_log_impl(&dword_1B542B000, v18, OS_LOG_TYPE_ERROR, "Encountered error <%@> when touching route %@", buf, 0x16u);
      }
    }

    goto LABEL_15;
  }
  long long v12 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    uint64_t v13 = [*(id *)(a1 + 40) UUIDString];
    *(_DWORD *)buf = 138412290;
    id v35 = v13;
    _os_log_impl(&dword_1B542B000, v12, OS_LOG_TYPE_ERROR, "Route file for ID %@ could not be found on disk.", buf, 0xCu);
  }
  uint64_t v14 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:4 userInfo:0];
  uint64_t v15 = *(void *)(*(void *)(a1 + 48) + 8);
  int v9 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v14;
LABEL_16:
}

void MNClearStoredRoutesUsedBefore(void *a1)
{
}

void MNClearStoredRoutesWithSubpathUsedBefore(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = MNGetMNRouteStorageLog();
  os_signpost_id_t v6 = os_signpost_id_generate(v5);

  id v7 = MNGetMNRouteStorageLog();
  uint64_t v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B542B000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "ActiveRouteInfoDiskRemove", "", buf, 2u);
  }

  int v9 = _routeStorageQueue();
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __MNClearStoredRoutesWithSubpathUsedBefore_block_invoke;
  v14[3] = &unk_1E60F6668;
  id v15 = v4;
  id v16 = v3;
  id v10 = v3;
  id v11 = v4;
  dispatch_sync(v9, v14);

  long long v12 = MNGetMNRouteStorageLog();
  uint64_t v13 = v12;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B542B000, v13, OS_SIGNPOST_INTERVAL_END, v6, "ActiveRouteInfoDiskRemove", "", buf, 2u);
  }
}

void __MNClearStoredRoutesWithSubpathUsedBefore_block_invoke(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  MNRouteStorageDirectory(*(void **)(a1 + 32));
  BOOL v18 = v21 = v2;
  id v3 = objc_msgSend(v2, "contentsOfDirectoryAtPath:error:");
  id v19 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v23;
    uint64_t v20 = *MEMORY[0x1E4F28310];
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v23 != v7) {
          objc_enumerationMutation(v4);
        }
        int v9 = *(void **)(*((void *)&v22 + 1) + 8 * v8);
        id v10 = +[MNFilePaths routeHandleExtension];
        int v11 = [v9 hasSuffix:v10];

        if (v11)
        {
          long long v12 = +[MNFilePaths navTempDirectoryPath];
          uint64_t v13 = [v12 stringByAppendingPathComponent:v9];

          if (*(void *)(a1 + 40))
          {
            uint64_t v14 = [v21 attributesOfItemAtPath:v13 error:0];
            id v15 = [v14 objectForKeyedSubscript:v20];
            if ([v15 compare:*(void *)(a1 + 40)] == -1)
            {
              [v21 removeItemAtPath:v13 error:0];
              [v19 addObject:v9];
            }
          }
          else
          {
            [v21 removeItemAtPath:v13 error:0];
            [v19 addObject:v9];
          }
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v22 objects:v30 count:16];
    }
    while (v6);
  }

  id v16 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v17 = [v19 count];
    *(_DWORD *)buf = 134218243;
    uint64_t v27 = v17;
    __int16 v28 = 2113;
    id v29 = v19;
    _os_log_impl(&dword_1B542B000, v16, OS_LOG_TYPE_DEFAULT, "Cleared %lu stored routes: %{private}@", buf, 0x16u);
  }
}

uint64_t MNRecommendedDateForClearingRoutes()
{
  return [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-5.0];
}

__CFString *MNNavigationServiceCallbackTypeAsString(unint64_t a1)
{
  if (a1 > 0x10) {
    return @"MNNavigationServiceCallbackType_DidChangeVoiceGuidanceLevel";
  }
  else {
    return off_1E60F6F90[a1];
  }
}

void sub_1B5481DA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

BOOL MNNavigationServiceStateChangedToNavigating(unint64_t a1, unint64_t a2)
{
  return a1 < 4 && a2 > 3;
}

BOOL MNNavigationServiceStateChangedFromNavigatingToStopped(unint64_t a1, uint64_t a2)
{
  return a1 > 3 && a2 == 0;
}

void _mnLPRWrappedError(void *a1, uint64_t a2, void *a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  uint64_t v14 = v13;
  if (a1)
  {
    if (v13)
    {
      uint64_t v15 = [[NSString alloc] initWithFormat:v13 arguments:&a9];
      id v16 = (void *)v15;
      if (v12)
      {
        uint64_t v17 = *MEMORY[0x1E4F1D190];
        uint64_t v25 = *MEMORY[0x1E4F1D138];
        uint64_t v26 = v17;
        uint64_t v27 = v15;
        id v28 = v12;
        BOOL v18 = (void *)MEMORY[0x1E4F1C9E8];
        id v19 = &v27;
        uint64_t v20 = &v25;
        uint64_t v21 = 2;
      }
      else
      {
        uint64_t v23 = *MEMORY[0x1E4F1D138];
        uint64_t v24 = v15;
        BOOL v18 = (void *)MEMORY[0x1E4F1C9E8];
        id v19 = &v24;
        uint64_t v20 = &v23;
        uint64_t v21 = 1;
      }
      long long v22 = objc_msgSend(v18, "dictionaryWithObjects:forKeys:count:", v19, v20, v21, &a9, v23, v24, v25, v26, v27, v28, v29);
    }
    else
    {
      long long v22 = 0;
    }
    *a1 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MapsNavLPRErrorDomain" code:a2 userInfo:v22];
  }
}

void sub_1B5482EE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B5483040(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__5(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5(uint64_t a1)
{
}

void sub_1B5484644(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B5487D44(_Unwind_Exception *a1)
{
}

id MNGetMNLPRRuleMatcherLog()
{
  if (qword_1EB59C0F8 != -1) {
    dispatch_once(&qword_1EB59C0F8, &__block_literal_global_14);
  }
  dispatch_queue_t v0 = (void *)_MergedGlobals_26;
  return v0;
}

void sub_1B5488F70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va1, a7);
  va_start(va, a7);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t __MNGetMNLPRRuleMatcherLog_block_invoke()
{
  _MergedGlobals_26 = (uint64_t)os_log_create("com.apple.Navigation", "MNLPRRuleMatcher");
  return MEMORY[0x1F41817F8]();
}

void sub_1B5489938(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 80));
  _Unwind_Resume(a1);
}

void sub_1B548FAF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__6(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__6(uint64_t a1)
{
}

void sub_1B5491010(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id GetAudioLogForMNHapticResourceControllerCategory()
{
  if (qword_1EB59C108 != -1) {
    dispatch_once(&qword_1EB59C108, &__block_literal_global_16);
  }
  dispatch_queue_t v0 = (void *)_MergedGlobals_27;
  return v0;
}

uint64_t __GetAudioLogForMNHapticResourceControllerCategory_block_invoke()
{
  _MergedGlobals_27 = (uint64_t)os_log_create("com.apple.Navigation.Audio", "MNHapticResourceController");
  return MEMORY[0x1F41817F8]();
}

uint64_t __Block_byref_object_copy__7(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__7(uint64_t a1)
{
}

__CFString *MNTraceNavigationEventTypeAsString(unint64_t a1)
{
  if (a1 > 0x1F) {
    return @"Unknown";
  }
  else {
    return off_1E60F78B8[a1];
  }
}

void sub_1B5494A1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id GetAudioLogForMNAudioSystemOptionsCategory()
{
  if (qword_1EB59C118 != -1) {
    dispatch_once(&qword_1EB59C118, &__block_literal_global_18);
  }
  dispatch_queue_t v0 = (void *)_MergedGlobals_28;
  return v0;
}

uint64_t __GetAudioLogForMNAudioSystemOptionsCategory_block_invoke()
{
  _MergedGlobals_28 = (uint64_t)os_log_create("com.apple.Navigation.Audio", "MNAudioSystemOptions");
  return MEMORY[0x1F41817F8]();
}

void sub_1B549B7F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
}

void sub_1B549E100(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B54A23B0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 96));
  _Unwind_Resume(a1);
}

uint64_t MNHeadphonesAreInUse()
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  dispatch_queue_t v0 = [getAVAudioSessionClass() sharedInstance];
  id v1 = [v0 currentRoute];
  uint64_t v2 = [v1 outputs];

  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v3 = v2;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v9;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v3);
        }
        if (objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * i), "isHeadphones", (void)v8))
        {
          uint64_t v4 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v4;
}

id getAVAudioSessionClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  dispatch_queue_t v0 = (void *)getAVAudioSessionClass_softClass;
  uint64_t v7 = getAVAudioSessionClass_softClass;
  if (!getAVAudioSessionClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getAVAudioSessionClass_block_invoke;
    v3[3] = &unk_1E60F7E88;
    v3[4] = &v4;
    __getAVAudioSessionClass_block_invoke((uint64_t)v3);
    dispatch_queue_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1B54A63F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t MNDeviceSpeakerIsInUse()
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v12 = [getAVAudioSessionClass() sharedInstance];
  dispatch_queue_t v0 = [v12 currentRoute];
  id v1 = [v0 outputs];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v2 = v1;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v13 objects:v26 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v14 != v4) {
          objc_enumerationMutation(v2);
        }
        uint64_t v6 = [*(id *)(*((void *)&v13 + 1) + 8 * i) portType];
        uint64_t v22 = 0;
        uint64_t v23 = &v22;
        uint64_t v24 = 0x2020000000;
        uint64_t v7 = (void *)getAVAudioSessionPortBuiltInSpeakerSymbolLoc_ptr;
        uint64_t v25 = getAVAudioSessionPortBuiltInSpeakerSymbolLoc_ptr;
        if (!getAVAudioSessionPortBuiltInSpeakerSymbolLoc_ptr)
        {
          uint64_t v17 = MEMORY[0x1E4F143A8];
          uint64_t v18 = 3221225472;
          id v19 = __getAVAudioSessionPortBuiltInSpeakerSymbolLoc_block_invoke;
          uint64_t v20 = &unk_1E60F7E88;
          uint64_t v21 = &v22;
          long long v8 = (void *)AVFoundationLibrary();
          long long v9 = dlsym(v8, "AVAudioSessionPortBuiltInSpeaker");
          *(void *)(v21[1] + 24) = v9;
          getAVAudioSessionPortBuiltInSpeakerSymbolLoc_ptr = *(void *)(v21[1] + 24);
          uint64_t v7 = (void *)v23[3];
        }
        _Block_object_dispose(&v22, 8);
        if (!v7)
        {
          dlerror();
          abort_report_np();
          __break(1u);
        }
        char v10 = [v6 isEqualToString:*v7];

        if (v10)
        {
          uint64_t v3 = 1;
          goto LABEL_14;
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v13 objects:v26 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_14:

  return v3;
}

void sub_1B54A6644(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getAVAudioSessionClass_block_invoke(uint64_t a1)
{
  AVFoundationLibrary();
  Class result = objc_getClass("AVAudioSession");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getAVAudioSessionClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    abort_report_np();
    return (Class)AVFoundationLibrary();
  }
  return result;
}

uint64_t AVFoundationLibrary()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!AVFoundationLibraryCore_frameworkLibrary)
  {
    v3[1] = MEMORY[0x1E4F143A8];
    v3[2] = 3221225472;
    v3[3] = __AVFoundationLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_1E60F7EA8;
    uint64_t v5 = 0;
    AVFoundationLibraryCore_frameworkLibrary = _sl_dlopen();
    id v1 = (void *)v3[0];
    uint64_t v0 = AVFoundationLibraryCore_frameworkLibrary;
    if (AVFoundationLibraryCore_frameworkLibrary)
    {
      if (!v3[0]) {
        return v0;
      }
    }
    else
    {
      id v1 = (void *)abort_report_np();
    }
    free(v1);
    return v0;
  }
  return AVFoundationLibraryCore_frameworkLibrary;
}

uint64_t __AVFoundationLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  AVFoundationLibraryCore_frameworkLibrary = result;
  return result;
}

void *__getAVAudioSessionPortBuiltInSpeakerSymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)AVFoundationLibrary();
  uint64_t result = dlsym(v2, "AVAudioSessionPortBuiltInSpeaker");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAVAudioSessionPortBuiltInSpeakerSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __GetAudioLogForMNUserOptionsEngineCategory_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.Navigation.Audio", "MNUserOptionsEngine");
  uint64_t v1 = qword_1EB59C158;
  qword_1EB59C158 = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

void sub_1B54A7814(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__8(uint64_t a1)
{
}

void sub_1B54A8104(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

id MNGetMNRouteLoggingLog()
{
  if (qword_1EB59C170 != -1) {
    dispatch_once(&qword_1EB59C170, &__block_literal_global_23);
  }
  os_log_t v0 = (void *)_MergedGlobals_31;
  return v0;
}

uint64_t __MNGetMNRouteLoggingLog_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.Navigation", "MNRouteLogging");
  uint64_t v1 = _MergedGlobals_31;
  _MergedGlobals_31 = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

id _MNLocalizedStringFromThisBundle(void *a1)
{
  uint64_t v1 = (void *)MEMORY[0x1E4F28B50];
  id v2 = a1;
  uint64_t v3 = [v1 _navigationBundle];
  long long v4 = objc_msgSend(v3, "_navigation_localizedStringForKey:value:table:", v2, @"<unlocalized>", @"Navigation");

  return v4;
}

id _MNStringFromSpokenLocalization(void *a1)
{
  id v1 = a1;
  id v2 = +[MNUserOptionsEngine sharedInstance];
  uint64_t v3 = [v2 localizedStringForKey:v1];

  return v3;
}

void sub_1B54A9E18(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B54A9FF8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B54AA0C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)MNTurnByTurnLocationTracker;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void __clang_call_terminate(void *a1)
{
}

void sub_1B54AA1AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1B54AA21C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B54AA2DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1B54AA358(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B54AA448(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B54AA608(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_1B54AA738(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B54AA948(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B54AA9C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B54AAFB8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B54AB13C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B54AB3F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19)
{
  _Unwind_Resume(a1);
}

void sub_1B54AB520(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B54AB64C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B54AB9F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  _Unwind_Resume(a1);
}

void sub_1B54ABB30(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B54ABFF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_1B54AC278(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B54AC544(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B54AC790(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  _Unwind_Resume(a1);
}

void sub_1B54AC850(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B54AC91C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B54ACBA0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B54AD328(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object, void *a11)
{
  _Unwind_Resume(a1);
}

void sub_1B54AD4EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B54AD808(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B54ADE70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, void *a17, void *a18, uint64_t a19, uint64_t a20,void *a21,uint64_t a22,uint64_t a23,void *a24)
{
  if (v25) {
    operator delete(v25);
  }

  _Unwind_Resume(a1);
}

void sub_1B54AE2D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B54AE610(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  _Unwind_Resume(a1);
}

void sub_1B54AE9E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B54AEC04(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B54AEE88(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B54AF564(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  _Unwind_Resume(a1);
}

void sub_1B54AF808(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  id v19 = v17;

  _Unwind_Resume(a1);
}

void sub_1B54AF954(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B54AFAF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B54B0304(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1B54B0604(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B54B0688(_Unwind_Exception *a1)
{
  long long v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1B54B0AD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_1B54B0CB8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B54B0DD0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B54B1404(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B54B15E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B54B1700(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B54B177C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B54B1BE0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B54B1D40(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B54B225C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B54B257C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B54B29DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B54B2C38(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B54B2E90(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B54B2F74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B54B30E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B54B332C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B54B353C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B54B364C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B54B36D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B54B3834(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B54B3A18(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B54B3D04(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B54B3DA0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B54B3E40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B54B3EC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B54B4074(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B54B4164(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B54B43D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B54B4878(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1B54B4B5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void std::vector<CLMapsRouteHint>::__throw_length_error[abi:ne180100]()
{
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_1E60F5D60, MEMORY[0x1E4FBA1C8]);
}

void sub_1B54B4C04(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  uint64_t result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x1E4FBA4D0] + 16);
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<CLMapsRouteHint>>(unint64_t a1)
{
  if (a1 >= 0x666666666666667) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(40 * a1);
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  id v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x1E4FBA350], MEMORY[0x1E4FBA1F8]);
}

void sub_1B54B9CD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

uint64_t __Block_byref_object_copy__9(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__9(uint64_t a1)
{
}

void _currentLocaleChanged()
{
  id v0 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v0 postNotificationName:@"MNLocaleDidChangeNotification" object:0];
}

void sub_1B54BB588(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B54BB718(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B54BB784(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B54BB7EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B54BB960(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  _Unwind_Resume(a1);
}

void sub_1B54BBB08(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B54BC020(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B54BC7DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16, void *a17, uint64_t a18, void *a19, void *a20,void *a21,void *a22)
{
  _Unwind_Resume(a1);
}

void sub_1B54BC994(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B54BCA18(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B54BCE80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1B54BD0DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  _Unwind_Resume(a1);
}

void sub_1B54BD354(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B54BD604(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B54BD740(_Unwind_Exception *a1)
{
  uint64_t v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1B54BD8D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B54BD9F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1B54BDA7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void *NavigationConfig_GetUserDefaultStringKeysForWatchSync()
{
  return &unk_1F0E357C0;
}

uint64_t NavigationConfig_GetConfigStoreStringKeysForWatchSync()
{
  return MEMORY[0x1E4F1CBF0];
}

void *_getConfigStoreStringKeysForStateCapture()
{
  return &unk_1F0E357D8;
}

void sub_1B54BEF28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id obj)
{
}

void sub_1B54BF200(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B54BF580(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B54BF630(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B54BF980(_Unwind_Exception *a1)
{
  objc_destroyWeak(v4);
  objc_destroyWeak(v3);
  objc_destroyWeak((id *)(v5 - 72));

  _Unwind_Resume(a1);
}

void sub_1B54BFBD8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B54BFCE4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B54BFD54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)MNRouteGeniusRemoteService;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1B54C0000(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B54C0084(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B54C014C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B54C0400(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B54C0484(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B54C05E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  objc_destroyWeak(v14);

  _Unwind_Resume(a1);
}

void sub_1B54C0740(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B54C08C0(_Unwind_Exception *a1)
{
  uint64_t v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1B54C09A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B54C0BB4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B54C11B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void MNRunSynchronouslyOnMainThread(void *a1)
{
  id v1 = (void *)MEMORY[0x1E4F29060];
  block = a1;
  if ([v1 isMainThread]) {
    block[2]();
  }
  else {
    dispatch_sync(MEMORY[0x1E4F14428], block);
  }
}

BOOL CLCoordinateEqualToCoordinateEpsilon(double a1, double a2, double a3, double a4, double a5)
{
  BOOL v5 = vabdd_f64(a1, a3) < a5;
  return vabdd_f64(a2, a4) < a5 && v5;
}

id MNInstructionsShortPromptTypeToString(uint64_t a1)
{
  v34[5] = *MEMORY[0x1E4F143B8];
  v33[0] = &unk_1F0E354C0;
  v33[1] = &unk_1F0E354D8;
  v34[0] = @"Continuation";
  v34[1] = @"General Maneuver";
  v33[2] = &unk_1F0E354F0;
  v33[3] = &unk_1F0E35508;
  _OWORD v34[2] = @"Start";
  v34[3] = @"Arrival";
  v33[4] = &unk_1F0E35520;
  v34[4] = @"Started Walking";
  id v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:v33 count:5];
  v31[0] = &unk_1F0E35538;
  v31[1] = &unk_1F0E35550;
  v32[0] = @"Direction (Left)";
  v32[1] = @"Direction (Right)";
  _OWORD v31[2] = &unk_1F0E35568;
  _OWORD v32[2] = @"Must Not Replace Speech";
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v31 count:3];
  long long v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  BOOL v5 = [v2 allKeys];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v26 != v8) {
          objc_enumerationMutation(v5);
        }
        char v10 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        if ((a1 & 0xF) == [v10 unsignedIntegerValue])
        {
          long long v11 = [v2 objectForKeyedSubscript:v10];
          [v4 addObject:v11];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v7);
  }

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v12 = objc_msgSend(v3, "allKeys", 0);
  uint64_t v13 = [v12 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v22;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v22 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void **)(*((void *)&v21 + 1) + 8 * j);
        if (([v17 unsignedIntegerValue] & ~a1) == 0)
        {
          uint64_t v18 = [v3 objectForKeyedSubscript:v17];
          [v4 addObject:v18];
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v14);
  }

  id v19 = [v4 componentsJoinedByString:@"|"];

  return v19;
}

uint64_t MNInstructionsCalculateDistanceUnits(int a1, int a2, uint64_t a3, double a4)
{
  return MNInstructionsCalculateScaledDistanceUnits(a1, a2, a3, 1, a4);
}

uint64_t MNInstructionsShortPromptTypeForManeuver(uint64_t result, int a2)
{
  uint64_t result = result;
  switch((int)result)
  {
    case 0:
      return result;
    case 1:
    case 20:
    case 27:
    case 29:
    case 60:
    case 62:
      return 18;
    case 2:
    case 21:
    case 28:
    case 30:
    case 61:
    case 63:
      return 34;
    case 3:
    case 5:
      return 1;
    case 4:
    case 26:
    case 35:
      BOOL v2 = a2 == 1;
      uint64_t v3 = 18;
      uint64_t v4 = 34;
      goto LABEL_3;
    case 11:
    case 41:
    case 42:
    case 43:
    case 44:
    case 45:
    case 46:
    case 47:
    case 48:
    case 49:
    case 50:
    case 51:
    case 52:
    case 53:
    case 54:
    case 55:
    case 56:
    case 57:
    case 58:
    case 59:
      BOOL v2 = a2 == 1;
      uint64_t v3 = 34;
      uint64_t v4 = 18;
      goto LABEL_3;
    case 16:
    case 18:
    case 39:
      return 4;
    case 17:
      return 3;
    case 25:
      BOOL v2 = a2 == 1;
      uint64_t v3 = 19;
      uint64_t v4 = 35;
LABEL_3:
      if (v2) {
        uint64_t result = v4;
      }
      else {
        uint64_t result = v3;
      }
      break;
    case 33:
      uint64_t result = 20;
      break;
    case 34:
      uint64_t result = 36;
      break;
    default:
      uint64_t result = 2;
      break;
  }
  return result;
}

id MNInstructionsLocalizedMetricUnits()
{
  v26[8] = *MEMORY[0x1E4F143B8];
  uint64_t v17 = _MNLocalizedStringFromThisBundle(@"distance parsing: m");
  v25[0] = v17;
  v25[1] = &unk_1F0E35580;
  long long v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:2];
  v26[0] = v16;
  uint64_t v15 = _MNLocalizedStringFromThisBundle(@"distance parsing: m(s)");
  v24[0] = v15;
  v24[1] = &unk_1F0E35580;
  uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:2];
  v26[1] = v14;
  uint64_t v13 = _MNLocalizedStringFromThisBundle(@"distance parsing: meter");
  v23[0] = v13;
  v23[1] = &unk_1F0E35580;
  uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:2];
  v26[2] = v12;
  long long v11 = _MNLocalizedStringFromThisBundle(@"distance parsing: meters");
  v22[0] = v11;
  v22[1] = &unk_1F0E35580;
  id v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:2];
  v26[3] = v0;
  id v1 = _MNLocalizedStringFromThisBundle(@"distance parsing: km");
  v21[0] = v1;
  v21[1] = &unk_1F0E35598;
  BOOL v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:2];
  v26[4] = v2;
  uint64_t v3 = _MNLocalizedStringFromThisBundle(@"distance parsing: km(s)");
  v20[0] = v3;
  v20[1] = &unk_1F0E35598;
  uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:2];
  v26[5] = v4;
  BOOL v5 = _MNLocalizedStringFromThisBundle(@"distance parsing: kilometer");
  v19[0] = v5;
  v19[1] = &unk_1F0E35598;
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];
  v26[6] = v6;
  uint64_t v7 = _MNLocalizedStringFromThisBundle(@"distance parsing: kilometers");
  v18[0] = v7;
  v18[1] = &unk_1F0E35598;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];
  v26[7] = v8;
  long long v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:8];

  return v9;
}

id MNInstructionsLocalizedImperialUnits()
{
  v38[12] = *MEMORY[0x1E4F143B8];
  long long v25 = _MNLocalizedStringFromThisBundle(@"distance parsing: yd");
  v37[0] = v25;
  v37[1] = &unk_1F0E355B0;
  long long v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:2];
  v38[0] = v24;
  long long v23 = _MNLocalizedStringFromThisBundle(@"distance parsing: yd(s)");
  v36[0] = v23;
  v36[1] = &unk_1F0E355B0;
  long long v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:2];
  v38[1] = v22;
  long long v21 = _MNLocalizedStringFromThisBundle(@"distance parsing: yard");
  v35[0] = v21;
  v35[1] = &unk_1F0E355B0;
  uint64_t v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:2];
  v38[2] = v20;
  id v19 = _MNLocalizedStringFromThisBundle(@"distance parsing: yards");
  v34[0] = v19;
  v34[1] = &unk_1F0E355B0;
  uint64_t v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:2];
  v38[3] = v18;
  uint64_t v17 = _MNLocalizedStringFromThisBundle(@"distance parsing: ft");
  v33[0] = v17;
  v33[1] = &unk_1F0E355C8;
  long long v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:2];
  v38[4] = v16;
  uint64_t v15 = _MNLocalizedStringFromThisBundle(@"distance parsing: ft(s)");
  v32[0] = v15;
  v32[1] = &unk_1F0E355C8;
  uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:2];
  v38[5] = v14;
  uint64_t v13 = _MNLocalizedStringFromThisBundle(@"distance parsing: foot");
  v31[0] = v13;
  v31[1] = &unk_1F0E355C8;
  uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:2];
  v38[6] = v12;
  long long v11 = _MNLocalizedStringFromThisBundle(@"distance parsing: feet(s)");
  v30[0] = v11;
  v30[1] = &unk_1F0E355C8;
  id v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:2];
  v38[7] = v0;
  id v1 = _MNLocalizedStringFromThisBundle(@"distance parsing: mi");
  v29[0] = v1;
  v29[1] = &unk_1F0E355E0;
  BOOL v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:2];
  v38[8] = v2;
  uint64_t v3 = _MNLocalizedStringFromThisBundle(@"distance parsing: mi(s)");
  v28[0] = v3;
  v28[1] = &unk_1F0E355E0;
  uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:2];
  v38[9] = v4;
  BOOL v5 = _MNLocalizedStringFromThisBundle(@"distance parsing: mile");
  v27[0] = v5;
  v27[1] = &unk_1F0E355E0;
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:2];
  v38[10] = v6;
  uint64_t v7 = _MNLocalizedStringFromThisBundle(@"distance parsing: miles");
  v26[0] = v7;
  v26[1] = &unk_1F0E355E0;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:2];
  v38[11] = v8;
  long long v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:12];

  return v9;
}

double MNInstructionsDistanceTypeConvertToMeters(uint64_t a1, double result)
{
  switch(a1)
  {
    case 1:
      return result * 1000.0;
    case 2:
      double v2 = 1.0936133;
      goto LABEL_7;
    case 3:
      double v2 = 3.2808399;
      goto LABEL_7;
    case 4:
      goto LABEL_6;
    case 5:
      uint64_t result = result * 4.0;
LABEL_6:
      double v2 = 0.000621371192;
LABEL_7:
      uint64_t result = result / v2;
      break;
    default:
      return result;
  }
  return result;
}

void sub_1B54C5198(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B54C5D80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 192), 8);
  _Unwind_Resume(a1);
}

void sub_1B54C6814(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B54C86AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B54C8DE0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B54C9098(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B54C9344(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B54C94E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B54C97B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B54C99D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B54C9D34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1B54CA5FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13, void *a14, void *a15, void *a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20)
{
  std::__tree<std::__value_type<geo::PolylineCoordinate,std::pair<MNRouteDivergenceResult * {__strong},MNRouteDivergenceResult * {__strong}>>,std::__map_value_compare<geo::PolylineCoordinate,std::__value_type<geo::PolylineCoordinate,std::pair<MNRouteDivergenceResult * {__strong},MNRouteDivergenceResult * {__strong}>>,std::less<geo::PolylineCoordinate>,true>,std::allocator<std::__value_type<geo::PolylineCoordinate,std::pair<MNRouteDivergenceResult * {__strong},MNRouteDivergenceResult * {__strong}>>>>::destroy(a20);
  _Unwind_Resume(a1);
}

id MNGetMNRouteDivergenceLog(void)
{
  if (qword_1EB59C1F0 != -1) {
    dispatch_once(&qword_1EB59C1F0, &__block_literal_global_280_0);
  }
  id v0 = (void *)_MergedGlobals_36;
  return v0;
}

void sub_1B54CB5D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17, void *a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,char a46,uint64_t a47,uint64_t a48,void **a49)
{
  a49 = (void **)&a46;
  std::vector<std::vector<-[MNRouteDivergenceFinder findAllOverlapRangesBetweenRoutes:]::OverlapCoordinate>>::__destroy_vector::operator()[abi:ne180100](&a49);

  _Unwind_Resume(a1);
}

void sub_1B54CC930(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18, void *a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,void *a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,void *a50,uint64_t a51,uint64_t a52,char a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,void **a59)
{
  std::__tree<std::__value_type<-[MNRouteDivergenceFinder findOverlappingSectionsForRoutes:]::RouteSectionKey,std::vector<-[MNRouteDivergenceFinder findOverlappingSectionsForRoutes:]::RouteSection>>,std::__map_value_compare<-[MNRouteDivergenceFinder findOverlappingSectionsForRoutes:]::RouteSectionKey,std::__value_type<-[MNRouteDivergenceFinder findOverlappingSectionsForRoutes:]::RouteSectionKey,std::vector<-[MNRouteDivergenceFinder findOverlappingSectionsForRoutes:]::RouteSection>>,-[MNRouteDivergenceFinder findOverlappingSectionsForRoutes:]::RouteSectionKeyCompare,false>,std::allocator<std::__value_type<-[MNRouteDivergenceFinder findOverlappingSectionsForRoutes:]::RouteSectionKey,std::vector<-[MNRouteDivergenceFinder findOverlappingSectionsForRoutes:]::RouteSection>>>>::destroy(a50);
  a59 = (void **)&a53;
  std::vector<std::map<geo::PolylineCoordinate,std::vector<-[MNRouteDivergenceFinder findOverlappingSectionsForRoutes:]::RouteSectionEndpoint>>>::__destroy_vector::operator()[abi:ne180100](&a59);

  _Unwind_Resume(a1);
}

void sub_1B54CD29C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20,void *a21)
{
  _Unwind_Resume(a1);
}

void sub_1B54CD444(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B54CD9AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17, uint64_t a18, uint64_t a19, void *a20,void *a21)
{
  _Unwind_Resume(a1);
}

void sub_1B54CE3B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  std::__hash_table<-[MNRouteDivergenceFinder findAllOverlapRangesBetweenRoutes:]::OverlapCoordinate,-[MNRouteDivergenceFinder findAllOverlapRangesBetweenRoutes:]::$_1,-[MNRouteDivergenceFinder findAllOverlapRangesBetweenRoutes:]::$_2,std::allocator<-[MNRouteDivergenceFinder findAllOverlapRangesBetweenRoutes:]::OverlapCoordinate>>::~__hash_table((uint64_t)&a25);
  std::__hash_table<-[MNRouteDivergenceFinder findAllOverlapRangesBetweenRoutes:]::OverlapCoordinate,-[MNRouteDivergenceFinder findAllOverlapRangesBetweenRoutes:]::$_1,-[MNRouteDivergenceFinder findAllOverlapRangesBetweenRoutes:]::$_2,std::allocator<-[MNRouteDivergenceFinder findAllOverlapRangesBetweenRoutes:]::OverlapCoordinate>>::~__hash_table((uint64_t)&a31);
  std::deque<_MNRouteConvergencePoint>::~deque[abi:ne180100](v31 - 208);

  _Unwind_Resume(a1);
}

void sub_1B54CE820(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, id a14)
{
  _Unwind_Resume(a1);
}

__n128 std::deque<_MNRouteConvergencePoint>::emplace_back<_MNRouteConvergencePoint&>(void *a1, uint64_t a2)
{
  uint64_t v4 = (char *)a1[1];
  BOOL v5 = (char *)a1[2];
  unint64_t v6 = (v5 - v4) >> 3;
  if (v5 == v4) {
    uint64_t v7 = 0;
  }
  else {
    uint64_t v7 = 42 * v6 - 1;
  }
  unint64_t v8 = a1[4];
  unint64_t v9 = a1[5] + v8;
  if (v7 == v9)
  {
    if (v8 < 0x2A)
    {
      long long v23 = (char *)a1[3];
      long long v24 = (char *)*a1;
      uint64_t v25 = (uint64_t)&v23[-*a1];
      if (v6 >= v25 >> 3)
      {
        uint64_t v28 = v25 >> 2;
        if (v23 == v24) {
          unint64_t v29 = 1;
        }
        else {
          unint64_t v29 = v28;
        }
        id v30 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<_MNRouteConvergencePoint *>>(v29);
        uint64_t v32 = v31;
        uint64_t v33 = operator new(0xFC0uLL);
        long long v34 = &v30[8 * v6];
        id v35 = &v30[8 * v32];
        if (v6 == v32)
        {
          uint64_t v36 = 8 * v6;
          if (v5 - v4 < 1)
          {
            v76 = v33;
            uint64_t v77 = v36 >> 2;
            if (v5 == v4) {
              unint64_t v78 = 1;
            }
            else {
              unint64_t v78 = v77;
            }
            v79 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<_MNRouteConvergencePoint *>>(v78);
            long long v34 = &v79[8 * (v78 >> 2)];
            id v35 = &v79[8 * v80];
            if (v30) {
              operator delete(v30);
            }
            id v30 = v79;
            uint64_t v33 = v76;
          }
          else
          {
            uint64_t v37 = v36 >> 3;
            if (v37 >= -1) {
              unint64_t v38 = v37 + 1;
            }
            else {
              unint64_t v38 = v37 + 2;
            }
            v34 -= 8 * (v38 >> 1);
          }
        }
        *(void *)long long v34 = v33;
        v81 = v34 + 8;
        for (uint64_t i = a1[2]; i != a1[1]; i -= 8)
        {
          if (v34 == v30)
          {
            if (v81 >= v35)
            {
              if (v35 == v30) {
                unint64_t v87 = 1;
              }
              else {
                unint64_t v87 = (v35 - v30) >> 2;
              }
              v88 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<_MNRouteConvergencePoint *>>(v87);
              v90 = v88;
              long long v34 = &v88[(2 * v87 + 6) & 0xFFFFFFFFFFFFFFF8];
              uint64_t v92 = v81 - v30;
              BOOL v91 = v81 == v30;
              v81 = v34;
              if (!v91)
              {
                v81 = &v34[v92 & 0xFFFFFFFFFFFFFFF8];
                uint64_t v93 = 8 * (v92 >> 3);
                v94 = v34;
                v95 = (uint64_t *)v30;
                do
                {
                  uint64_t v96 = *v95++;
                  *(void *)v94 = v96;
                  v94 += 8;
                  v93 -= 8;
                }
                while (v93);
              }
              id v35 = &v88[8 * v89];
              if (v30) {
                operator delete(v30);
              }
              id v30 = v90;
            }
            else
            {
              uint64_t v83 = (v35 - v81) >> 3;
              if (v83 >= -1) {
                uint64_t v84 = v83 + 1;
              }
              else {
                uint64_t v84 = v83 + 2;
              }
              uint64_t v85 = v84 >> 1;
              long long v34 = &v30[8 * (v84 >> 1)];
              v86 = v30;
              if (v81 != v30)
              {
                memmove(v34, v30, v81 - v30);
                v86 = v81;
              }
              v81 = &v86[8 * v85];
            }
          }
          uint64_t v97 = *(void *)(i - 8);
          *((void *)v34 - 1) = v97;
          v34 -= 8;
        }
        v98 = (char *)*a1;
        *a1 = v30;
        a1[1] = v34;
        a1[2] = v81;
        a1[3] = v35;
        if (v98) {
          operator delete(v98);
        }
        goto LABEL_36;
      }
      long long v26 = operator new(0xFC0uLL);
      long long v27 = v26;
      if (v23 == v5)
      {
        if (v4 == v24)
        {
          if (v5 == v4) {
            unint64_t v54 = 1;
          }
          else {
            unint64_t v54 = (v23 - v4) >> 2;
          }
          uint64_t v55 = 2 * v54;
          uint64_t v56 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<_MNRouteConvergencePoint *>>(v54);
          uint64_t v4 = &v56[(v55 + 6) & 0xFFFFFFFFFFFFFFF8];
          uint64_t v58 = (uint64_t *)a1[1];
          unint64_t v59 = v4;
          uint64_t v60 = a1[2] - (void)v58;
          if (v60)
          {
            unint64_t v59 = &v4[v60 & 0xFFFFFFFFFFFFFFF8];
            uint64_t v61 = 8 * (v60 >> 3);
            v62 = &v56[(v55 + 6) & 0xFFFFFFFFFFFFFFF8];
            do
            {
              uint64_t v63 = *v58++;
              *(void *)v62 = v63;
              v62 += 8;
              v61 -= 8;
            }
            while (v61);
          }
          v64 = (char *)*a1;
          *a1 = v56;
          a1[1] = v4;
          a1[2] = v59;
          a1[3] = &v56[8 * v57];
          if (v64)
          {
            operator delete(v64);
            uint64_t v4 = (char *)a1[1];
          }
        }
        *((void *)v4 - 1) = v27;
        v65 = (char *)a1[1];
        v66 = (char *)a1[2];
        a1[1] = v65 - 8;
        uint64_t v67 = *((void *)v65 - 1);
        a1[1] = v65;
        if (v66 == (char *)a1[3])
        {
          uint64_t v68 = (uint64_t)&v65[-*a1];
          if ((unint64_t)v65 <= *a1)
          {
            if (v66 == (char *)*a1) {
              unint64_t v99 = 1;
            }
            else {
              unint64_t v99 = (uint64_t)&v66[-*a1] >> 2;
            }
            v100 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<_MNRouteConvergencePoint *>>(v99);
            v102 = &v100[8 * (v99 >> 2)];
            v103 = (uint64_t *)a1[1];
            v66 = v102;
            uint64_t v104 = a1[2] - (void)v103;
            if (v104)
            {
              v66 = &v102[v104 & 0xFFFFFFFFFFFFFFF8];
              uint64_t v105 = 8 * (v104 >> 3);
              v106 = &v100[8 * (v99 >> 2)];
              do
              {
                uint64_t v107 = *v103++;
                *(void *)v106 = v107;
                v106 += 8;
                v105 -= 8;
              }
              while (v105);
            }
            v108 = (char *)*a1;
            *a1 = v100;
            a1[1] = v102;
            a1[2] = v66;
            a1[3] = &v100[8 * v101];
            if (v108)
            {
              operator delete(v108);
              v66 = (char *)a1[2];
            }
          }
          else
          {
            uint64_t v69 = v68 >> 3;
            BOOL v15 = v68 >> 3 < -1;
            uint64_t v70 = (v68 >> 3) + 2;
            if (v15) {
              uint64_t v71 = v70;
            }
            else {
              uint64_t v71 = v69 + 1;
            }
            uint64_t v72 = -(v71 >> 1);
            uint64_t v73 = v71 >> 1;
            v74 = &v65[-8 * v73];
            int64_t v75 = v66 - v65;
            if (v66 != v65)
            {
              memmove(&v65[-8 * v73], v65, v66 - v65);
              v65 = (char *)a1[1];
            }
            v66 = &v74[v75];
            a1[1] = &v65[8 * v72];
            a1[2] = &v74[v75];
          }
        }
        *(void *)v66 = v67;
      }
      else
      {
        *(void *)BOOL v5 = v26;
      }
    }
    else
    {
      a1[4] = v8 - 42;
      uint64_t v12 = *(void *)v4;
      char v10 = v4 + 8;
      uint64_t v11 = v12;
      a1[1] = v10;
      if (v5 == (char *)a1[3])
      {
        uint64_t v13 = (uint64_t)&v10[-*a1];
        if ((unint64_t)v10 <= *a1)
        {
          if (v5 == (char *)*a1) {
            unint64_t v39 = 1;
          }
          else {
            unint64_t v39 = (uint64_t)&v5[-*a1] >> 2;
          }
          long long v40 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<_MNRouteConvergencePoint *>>(v39);
          long long v42 = &v40[8 * (v39 >> 2)];
          uint64_t v43 = (uint64_t *)a1[1];
          BOOL v5 = v42;
          uint64_t v44 = a1[2] - (void)v43;
          if (v44)
          {
            BOOL v5 = &v42[v44 & 0xFFFFFFFFFFFFFFF8];
            uint64_t v45 = 8 * (v44 >> 3);
            long long v46 = &v40[8 * (v39 >> 2)];
            do
            {
              uint64_t v47 = *v43++;
              *(void *)long long v46 = v47;
              v46 += 8;
              v45 -= 8;
            }
            while (v45);
          }
          long long v48 = (char *)*a1;
          *a1 = v40;
          a1[1] = v42;
          a1[2] = v5;
          a1[3] = &v40[8 * v41];
          if (v48)
          {
            operator delete(v48);
            BOOL v5 = (char *)a1[2];
          }
        }
        else
        {
          uint64_t v14 = v13 >> 3;
          BOOL v15 = v13 >> 3 < -1;
          uint64_t v16 = (v13 >> 3) + 2;
          if (v15) {
            uint64_t v17 = v16;
          }
          else {
            uint64_t v17 = v14 + 1;
          }
          uint64_t v18 = -(v17 >> 1);
          uint64_t v19 = v17 >> 1;
          uint64_t v20 = &v10[-8 * v19];
          int64_t v21 = v5 - v10;
          if (v5 != v10)
          {
            memmove(&v10[-8 * v19], v10, v5 - v10);
            BOOL v5 = (char *)a1[1];
          }
          long long v22 = &v5[8 * v18];
          BOOL v5 = &v20[v21];
          a1[1] = v22;
          a1[2] = &v20[v21];
        }
      }
      *(void *)BOOL v5 = v11;
    }
    a1[2] += 8;
LABEL_36:
    uint64_t v4 = (char *)a1[1];
    unint64_t v9 = a1[5] + a1[4];
  }
  unint64_t v49 = *(void *)&v4[8 * (v9 / 0x2A)] + 96 * (v9 % 0x2A);
  long long v50 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)unint64_t v49 = *(_OWORD *)a2;
  *(_OWORD *)(v49 + 16) = v50;
  __n128 result = *(__n128 *)(a2 + 32);
  long long v52 = *(_OWORD *)(a2 + 48);
  long long v53 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(v49 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(v49 + 80) = v53;
  *(__n128 *)(v49 + 32) = result;
  *(_OWORD *)(v49 + 4_Block_object_dispose(&STACK[0x1160], 8) = v52;
  ++a1[5];
  return result;
}

void sub_1B54CEDB0(_Unwind_Exception *a1)
{
  operator delete(v2);
  if (v1) {
    operator delete(v1);
  }
  _Unwind_Resume(a1);
}

void sub_1B54CF4E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B54CF7C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B54CF8F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B54CF9F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B54CFA58(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B54CFBD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id a24)
{
  _Block_object_dispose(&a19, 8);

  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__10(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__10(uint64_t a1)
{
}

void sub_1B54CFCCC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B54CFD58(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B54CFE04(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B54CFEE8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B54D0010(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B54D00D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  _Unwind_Resume(a1);
}

void sub_1B54D0258(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B54D05E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B54D07C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B54D0928(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id a22)
{
  _Block_object_dispose(&a17, 8);

  _Unwind_Resume(a1);
}

void sub_1B54D0A08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B54D0A8C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B54D0B24(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B54D0C2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1B54D0CAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t ___ZL25MNGetMNRouteDivergenceLogv_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.Navigation", "MNRouteDivergence");
  uint64_t v1 = _MergedGlobals_36;
  _MergedGlobals_36 = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

void std::__tree<std::__value_type<geo::PolylineCoordinate,std::pair<MNRouteDivergenceResult * {__strong},MNRouteDivergenceResult * {__strong}>>,std::__map_value_compare<geo::PolylineCoordinate,std::__value_type<geo::PolylineCoordinate,std::pair<MNRouteDivergenceResult * {__strong},MNRouteDivergenceResult * {__strong}>>,std::less<geo::PolylineCoordinate>,true>,std::allocator<std::__value_type<geo::PolylineCoordinate,std::pair<MNRouteDivergenceResult * {__strong},MNRouteDivergenceResult * {__strong}>>>>::destroy(void *a1)
{
  if (a1)
  {
    std::__tree<std::__value_type<geo::PolylineCoordinate,std::pair<MNRouteDivergenceResult * {__strong},MNRouteDivergenceResult * {__strong}>>,std::__map_value_compare<geo::PolylineCoordinate,std::__value_type<geo::PolylineCoordinate,std::pair<MNRouteDivergenceResult * {__strong},MNRouteDivergenceResult * {__strong}>>,std::less<geo::PolylineCoordinate>,true>,std::allocator<std::__value_type<geo::PolylineCoordinate,std::pair<MNRouteDivergenceResult * {__strong},MNRouteDivergenceResult * {__strong}>>>>::destroy(*a1);
    std::__tree<std::__value_type<geo::PolylineCoordinate,std::pair<MNRouteDivergenceResult * {__strong},MNRouteDivergenceResult * {__strong}>>,std::__map_value_compare<geo::PolylineCoordinate,std::__value_type<geo::PolylineCoordinate,std::pair<MNRouteDivergenceResult * {__strong},MNRouteDivergenceResult * {__strong}>>,std::less<geo::PolylineCoordinate>,true>,std::allocator<std::__value_type<geo::PolylineCoordinate,std::pair<MNRouteDivergenceResult * {__strong},MNRouteDivergenceResult * {__strong}>>>>::destroy(a1[1]);

    operator delete(a1);
  }
}

char *std::__tree<std::__value_type<geo::PolylineCoordinate,std::pair<MNRouteDivergenceResult * {__strong},MNRouteDivergenceResult * {__strong}>>,std::__map_value_compare<geo::PolylineCoordinate,std::__value_type<geo::PolylineCoordinate,std::pair<MNRouteDivergenceResult * {__strong},MNRouteDivergenceResult * {__strong}>>,std::less<geo::PolylineCoordinate>,true>,std::allocator<std::__value_type<geo::PolylineCoordinate,std::pair<MNRouteDivergenceResult * {__strong},MNRouteDivergenceResult * {__strong}>>>>::__emplace_unique_key_args<geo::PolylineCoordinate,geo::PolylineCoordinate,std::pair<MNRouteDivergenceResult * {__strong},MNRouteDivergenceResult * {__strong}>>(uint64_t **a1, unsigned int a2, uint64_t a3, long long *a4, float a5)
{
  unint64_t v9 = a1 + 1;
  unint64_t v8 = (char *)a1[1];
  if (!v8)
  {
    char v10 = (char *)(a1 + 1);
    goto LABEL_13;
  }
  do
  {
    while (1)
    {
      char v10 = v8;
      unsigned int v11 = *((_DWORD *)v8 + 8);
      if (v11 <= a2) {
        break;
      }
LABEL_5:
      unint64_t v8 = *(char **)v10;
      unint64_t v9 = (uint64_t **)v10;
      if (!*(void *)v10) {
        goto LABEL_13;
      }
    }
    if (v11 == a2)
    {
      float v12 = *((float *)v10 + 9);
      if (v12 > a5) {
        goto LABEL_5;
      }
      if (v12 >= a5) {
        return v10;
      }
    }
    else if (v11 >= a2)
    {
      return v10;
    }
    unint64_t v8 = (char *)*((void *)v10 + 1);
  }
  while (v8);
  unint64_t v9 = (uint64_t **)(v10 + 8);
LABEL_13:
  uint64_t v13 = v10;
  char v10 = (char *)operator new(0x38uLL);
  *((void *)v10 + 4) = a3;
  long long v14 = *a4;
  *a4 = 0u;
  *(_OWORD *)(v10 + 40) = v14;
  *(_OWORD *)char v10 = 0u;
  *((void *)v10 + 2) = v13;
  *unint64_t v9 = (uint64_t *)v10;
  BOOL v15 = (uint64_t *)**a1;
  uint64_t v16 = (uint64_t *)v10;
  if (v15)
  {
    *a1 = v15;
    uint64_t v16 = *v9;
  }
  std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(a1[1], v16);
  a1[2] = (uint64_t *)((char *)a1[2] + 1);
  return v10;
}

uint64_t *std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(uint64_t *result, uint64_t *a2)
{
  *((unsigned char *)a2 + 24) = a2 == result;
  if (a2 != result)
  {
    do
    {
      double v2 = (uint64_t *)a2[2];
      if (*((unsigned char *)v2 + 24)) {
        return result;
      }
      uint64_t v3 = (uint64_t *)v2[2];
      uint64_t v4 = (uint64_t *)*v3;
      if ((uint64_t *)*v3 == v2)
      {
        uint64_t v7 = v3[1];
        if (!v7 || (int v8 = *(unsigned __int8 *)(v7 + 24), v5 = (unsigned char *)(v7 + 24), v8))
        {
          if ((uint64_t *)*v2 == a2)
          {
            unint64_t v9 = (uint64_t **)a2[2];
          }
          else
          {
            unint64_t v9 = (uint64_t **)v2[1];
            char v10 = *v9;
            v2[1] = (uint64_t)*v9;
            if (v10)
            {
              v10[2] = (uint64_t)v2;
              uint64_t v3 = (uint64_t *)v2[2];
            }
            id v9[2] = v3;
            *(void *)(v2[2] + 8 * (*(void *)v2[2] != (void)v2)) = v9;
            *unint64_t v9 = v2;
            v2[2] = (uint64_t)v9;
            uint64_t v3 = v9[2];
            double v2 = (uint64_t *)*v3;
          }
          *((unsigned char *)v9 + 24) = 1;
          *((unsigned char *)v3 + 24) = 0;
          uint64_t v13 = v2[1];
          *uint64_t v3 = v13;
          if (v13) {
            *(void *)(v13 + 16) = v3;
          }
          v2[2] = v3[2];
          *(void *)(v3[2] + 8 * (*(void *)v3[2] != (void)v3)) = v2;
          v2[1] = (uint64_t)v3;
          goto LABEL_27;
        }
      }
      else if (!v4 || (int v6 = *((unsigned __int8 *)v4 + 24), v5 = v4 + 3, v6))
      {
        if ((uint64_t *)*v2 == a2)
        {
          uint64_t v11 = a2[1];
          uint64_t *v2 = v11;
          if (v11)
          {
            *(void *)(v11 + 16) = v2;
            uint64_t v3 = (uint64_t *)v2[2];
          }
          a2[2] = (uint64_t)v3;
          *(void *)(v2[2] + 8 * (*(void *)v2[2] != (void)v2)) = a2;
          a2[1] = (uint64_t)v2;
          v2[2] = (uint64_t)a2;
          uint64_t v3 = (uint64_t *)a2[2];
        }
        else
        {
          a2 = (uint64_t *)a2[2];
        }
        *((unsigned char *)a2 + 24) = 1;
        *((unsigned char *)v3 + 24) = 0;
        double v2 = (uint64_t *)v3[1];
        uint64_t v12 = *v2;
        v3[1] = *v2;
        if (v12) {
          *(void *)(v12 + 16) = v3;
        }
        v2[2] = v3[2];
        *(void *)(v3[2] + 8 * (*(void *)v3[2] != (void)v3)) = v2;
        uint64_t *v2 = (uint64_t)v3;
LABEL_27:
        v3[2] = (uint64_t)v2;
        return result;
      }
      *((unsigned char *)v2 + 24) = 1;
      a2 = v3;
      *((unsigned char *)v3 + 24) = v3 == result;
      *BOOL v5 = 1;
    }
    while (v3 != result);
  }
  return result;
}

LABEL_1:
  uint64_t v11 = &a2[-2].n128_u32[2];
  uint64_t j = a1;
  while (1)
  {
    a1 = j;
    uint64_t v13 = (uint64_t)a2 - j;
    long long v14 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)((uint64_t)a2 - j) >> 3);
    if (v6 || !v5) {
      break;
    }
    if (v13 <= 575)
    {
      uint64_t v67 = (__n128 *)(j + 24);
      uint64_t v69 = (__n128 *)j == a2 || v67 == a2;
      if (a4)
      {
        if (v69) {
          return a5.n128_f32[0];
        }
        uint64_t v70 = 0;
        uint64_t v71 = j;
        while (2)
        {
          uint64_t v72 = v71;
          uint64_t v71 = (unint64_t)v67;
          uint64_t v73 = *(_DWORD *)(v72 + 24);
          if (v73 < *(_DWORD *)v72)
          {
            a5.n128_u32[0] = *(_DWORD *)(v72 + 28);
            goto LABEL_111;
          }
          if (v73 == *(_DWORD *)v72)
          {
            a5.n128_u32[0] = *(_DWORD *)(v72 + 28);
            if (a5.n128_f32[0] < *(float *)(v72 + 4))
            {
LABEL_111:
              v125 = *(_OWORD *)(v72 + 32);
              *(unsigned char *)(v71 + 16) = *(unsigned char *)(v72 + 16);
              *(_OWORD *)uint64_t v71 = *(_OWORD *)v72;
              v74 = j;
              if (v72 != j)
              {
                int64_t v75 = v70;
                do
                {
                  v76 = j + v75;
                  uint64_t v77 = *(_DWORD *)(j + v75 - 24);
                  if (v73 >= v77)
                  {
                    if (v73 != v77)
                    {
                      v74 = v72;
                      goto LABEL_122;
                    }
                    v74 = j + v75;
                    if (a5.n128_f32[0] >= *(float *)(j + v75 - 20)) {
                      goto LABEL_122;
                    }
                  }
                  v72 -= 24;
                  *(_OWORD *)v76 = *(_OWORD *)(j + v75 - 24);
                  *(unsigned char *)(v76 + 16) = *(unsigned char *)(j + v75 - 8);
                  v75 -= 24;
                }
                while (v75);
                v74 = j;
              }
LABEL_122:
              *(_DWORD *)v74 = v73;
              *(_DWORD *)(v74 + 4) = a5.n128_u32[0];
              *(void *)(v74 + _Block_object_dispose(&STACK[0x1160], 8) = v125;
              *(unsigned char *)(v74 + 16) = BYTE8(v125);
            }
          }
          uint64_t v67 = (__n128 *)(v71 + 24);
          v70 += 24;
          if ((__n128 *)(v71 + 24) == a2) {
            return a5.n128_f32[0];
          }
          continue;
        }
      }
      if (v69) {
        return a5.n128_f32[0];
      }
      while (2)
      {
        v111 = a1;
        a1 = (unint64_t)v67;
        v112 = *(_DWORD *)(v111 + 24);
        if (v112 >= *(_DWORD *)v111)
        {
          if (v112 == *(_DWORD *)v111)
          {
            a5.n128_u32[0] = *(_DWORD *)(v111 + 28);
            if (a5.n128_f32[0] < *(float *)(v111 + 4)) {
              goto LABEL_185;
            }
          }
        }
        else
        {
          a5.n128_u32[0] = *(_DWORD *)(v111 + 28);
LABEL_185:
          v128 = *(_OWORD *)(v111 + 32);
          do
          {
            do
            {
              v113 = v111;
              *(_OWORD *)(v111 + 24) = *(_OWORD *)v111;
              *(unsigned char *)(v111 + 40) = *(unsigned char *)(v111 + 16);
              v114 = *(_DWORD *)(v111 - 24);
              v111 -= 24;
              v115 = v112 == v114;
            }
            while (v112 < v114);
          }
          while (v115 && a5.n128_f32[0] < *(float *)(v113 - 20));
          *(_DWORD *)v113 = v112;
          *(_DWORD *)(v113 + 4) = a5.n128_u32[0];
          *(void *)(v113 + _Block_object_dispose(&STACK[0x1160], 8) = v128;
          *(unsigned char *)(v113 + 16) = BYTE8(v128);
        }
        uint64_t v67 = (__n128 *)(a1 + 24);
        if ((__n128 *)(a1 + 24) == a2) {
          return a5.n128_f32[0];
        }
        continue;
      }
    }
    if (!a3)
    {
      if ((__n128 *)j == a2) {
        return a5.n128_f32[0];
      }
      unint64_t v78 = (v14 - 2) >> 1;
      v79 = v78;
      while (2)
      {
        uint64_t v80 = v79;
        if (v78 >= v79)
        {
          v81 = (2 * v79) | 1;
          v82 = j + 24 * v81;
          if (2 * v80 + 2 < (uint64_t)v14)
          {
            uint64_t v83 = *(_DWORD *)(v82 + 24);
            if (*(_DWORD *)v82 < v83 || *(_DWORD *)v82 == v83 && *(float *)(v82 + 4) < *(float *)(v82 + 28))
            {
              v82 += 24;
              v81 = 2 * v80 + 2;
            }
          }
          uint64_t v84 = j + 24 * v80;
          uint64_t v85 = *(_DWORD *)v84;
          if (*(_DWORD *)v82 >= *(_DWORD *)v84)
          {
            if (*(_DWORD *)v82 != v85)
            {
              v86 = *(float *)(v84 + 4);
              goto LABEL_137;
            }
            v86 = *(float *)(v84 + 4);
            if (*(float *)(v82 + 4) >= v86)
            {
LABEL_137:
              v126 = *(_OWORD *)(v84 + 8);
              unint64_t v87 = *(_OWORD *)v82;
              *(unsigned char *)(v84 + 16) = *(unsigned char *)(v82 + 16);
              *(_OWORD *)uint64_t v84 = v87;
              if (v78 >= v81)
              {
                while (1)
                {
                  uint64_t v89 = 2 * v81;
                  v81 = (2 * v81) | 1;
                  v88 = j + 24 * v81;
                  v90 = v89 + 2;
                  if (v90 < (uint64_t)v14)
                  {
                    BOOL v91 = *(_DWORD *)(v88 + 24);
                    if (*(_DWORD *)v88 < v91 || *(_DWORD *)v88 == v91 && *(float *)(v88 + 4) < *(float *)(v88 + 28))
                    {
                      v88 += 24;
                      v81 = v90;
                    }
                  }
                  if (*(_DWORD *)v88 < v85 || *(_DWORD *)v88 == v85 && *(float *)(v88 + 4) < v86) {
                    break;
                  }
                  uint64_t v92 = *(_OWORD *)v88;
                  *(unsigned char *)(v82 + 16) = *(unsigned char *)(v88 + 16);
                  *(_OWORD *)v82 = v92;
                  v82 = v88;
                  if (v78 < v81) {
                    goto LABEL_139;
                  }
                }
              }
              v88 = v82;
LABEL_139:
              *(_DWORD *)v88 = v85;
              *(float *)(v88 + 4) = v86;
              *(void *)(v88 + _Block_object_dispose(&STACK[0x1160], 8) = v126;
              *(unsigned char *)(v88 + 16) = BYTE8(v126);
            }
          }
        }
        v79 = v80 - 1;
        if (v80) {
          continue;
        }
        break;
      }
      uint64_t v93 = v13 / 0x18uLL;
      while (2)
      {
        v94 = 0;
        v134 = *(void *)(j + 16);
        v127 = *(__n128 *)j;
        v95 = j;
        do
        {
          uint64_t v96 = v95;
          v95 += 24 * v94 + 24;
          uint64_t v97 = 2 * v94;
          v94 = (2 * v94) | 1;
          v98 = v97 + 2;
          if (v98 < v93)
          {
            unint64_t v99 = *(_DWORD *)(v95 + 24);
            if (*(_DWORD *)v95 < v99 || *(_DWORD *)v95 == v99 && *(float *)(v95 + 4) < *(float *)(v95 + 28))
            {
              v95 += 24;
              v94 = v98;
            }
          }
          v100 = *(_OWORD *)v95;
          *(unsigned char *)(v96 + 16) = *(unsigned char *)(v95 + 16);
          *(_OWORD *)uint64_t v96 = v100;
        }
        while (v94 <= (uint64_t)((unint64_t)(v93 - 2) >> 1));
        a2 = (__n128 *)((char *)a2 - 24);
        if ((__n128 *)v95 == a2)
        {
          a5.n128_u32[0] = v127.n128_u32[0];
          *(unsigned char *)(v95 + 16) = v134;
          *(__n128 *)v95 = v127;
        }
        else
        {
          a5 = *a2;
          *(unsigned char *)(v95 + 16) = a2[1].n128_u8[0];
          *(__n128 *)v95 = a5;
          a5.n128_u32[0] = v127.n128_u32[0];
          a2[1].n128_u8[0] = v134;
          *a2 = v127;
          uint64_t v101 = v95 - j + 24;
          if (v101 >= 25)
          {
            v102 = v101 / 0x18uLL - 2;
            v103 = v102 >> 1;
            uint64_t v104 = j + 24 * (v102 >> 1);
            uint64_t v105 = *(_DWORD *)v95;
            if (*(_DWORD *)v104 < *(_DWORD *)v95)
            {
              a5.n128_u32[0] = *(_DWORD *)(v95 + 4);
              goto LABEL_166;
            }
            if (*(_DWORD *)v104 == v105)
            {
              a5.n128_u32[0] = *(_DWORD *)(v95 + 4);
              if (*(float *)(v104 + 4) < a5.n128_f32[0])
              {
LABEL_166:
                v119 = *(_OWORD *)(v95 + 8);
                v106 = *(_OWORD *)v104;
                *(unsigned char *)(v95 + 16) = *(unsigned char *)(v104 + 16);
                *(_OWORD *)v95 = v106;
                if (v102 >= 2)
                {
                  while (1)
                  {
                    v108 = v103 - 1;
                    v103 = (v103 - 1) >> 1;
                    uint64_t v107 = j + 24 * v103;
                    if (*(_DWORD *)v107 >= v105 && (*(_DWORD *)v107 != v105 || *(float *)(v107 + 4) >= a5.n128_f32[0])) {
                      break;
                    }
                    v109 = *(_OWORD *)v107;
                    *(unsigned char *)(v104 + 16) = *(unsigned char *)(v107 + 16);
                    *(_OWORD *)uint64_t v104 = v109;
                    uint64_t v104 = j + 24 * v103;
                    if (v108 <= 1) {
                      goto LABEL_172;
                    }
                  }
                }
                uint64_t v107 = v104;
LABEL_172:
                *(_DWORD *)uint64_t v107 = v105;
                *(_DWORD *)(v107 + 4) = a5.n128_u32[0];
                *(void *)(v107 + _Block_object_dispose(&STACK[0x1160], 8) = v119;
                *(unsigned char *)(v107 + 16) = BYTE8(v119);
              }
            }
          }
        }
        if (v93-- <= 2) {
          return a5.n128_f32[0];
        }
        continue;
      }
    }
    BOOL v15 = v14 >> 1;
    uint64_t v16 = (__n128 *)(j + 24 * (v14 >> 1));
    if ((unint64_t)v13 >= 0xC01)
    {
      v17.n128_f32[0] = std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[MNRouteDivergenceFinder findAllOverlapRangesBetweenRoutes:]::$_0 &,-[MNRouteDivergenceFinder findAllOverlapRangesBetweenRoutes:]::OverlapCoordinate *>((__n128 *)a1, (__n128 *)(a1 + 24 * (v14 >> 1)), (__n128 *)((char *)a2 - 24), a5);
      uint64_t v18 = 3 * v15;
      uint64_t v19 = (__n128 *)(a1 + 24 * v15 - 24);
      v20.n128_f32[0] = std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[MNRouteDivergenceFinder findAllOverlapRangesBetweenRoutes:]::$_0 &,-[MNRouteDivergenceFinder findAllOverlapRangesBetweenRoutes:]::OverlapCoordinate *>((__n128 *)(a1 + 24), v19, a2 - 3, v17);
      int64_t v21 = (__n128 *)(a1 + 24 + 8 * v18);
      v22.n128_f32[0] = std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[MNRouteDivergenceFinder findAllOverlapRangesBetweenRoutes:]::$_0 &,-[MNRouteDivergenceFinder findAllOverlapRangesBetweenRoutes:]::OverlapCoordinate *>((__n128 *)(a1 + 48), v21, (__n128 *)((char *)a2 - 72), v20);
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[MNRouteDivergenceFinder findAllOverlapRangesBetweenRoutes:]::$_0 &,-[MNRouteDivergenceFinder findAllOverlapRangesBetweenRoutes:]::OverlapCoordinate *>(v19, v16, v21, v22);
      v129 = *(void *)(a1 + 16);
      v120 = *(__n128 *)a1;
      long long v23 = v16[1].n128_u8[0];
      *(__n128 *)a1 = *v16;
      *(unsigned char *)(a1 + 16) = v23;
      a5 = v120;
      v16[1].n128_u8[0] = v129;
      *uint64_t v16 = v120;
    }
    else
    {
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[MNRouteDivergenceFinder findAllOverlapRangesBetweenRoutes:]::$_0 &,-[MNRouteDivergenceFinder findAllOverlapRangesBetweenRoutes:]::OverlapCoordinate *>((__n128 *)(a1 + 24 * (v14 >> 1)), (__n128 *)a1, (__n128 *)((char *)a2 - 24), a5);
    }
    --a3;
    long long v24 = *(_DWORD *)a1;
    if (a4) {
      goto LABEL_14;
    }
    uint64_t v25 = *(_DWORD *)(a1 - 24);
    if (v25 < v24) {
      goto LABEL_14;
    }
    if (v25 == v24)
    {
      a5.n128_u32[0] = *(_DWORD *)(a1 + 4);
      if (*(float *)(a1 - 20) >= a5.n128_f32[0]) {
        goto LABEL_51;
      }
LABEL_14:
      long long v26 = 0;
      a5.n128_u32[0] = *(_DWORD *)(a1 + 4);
      v117 = *(_OWORD *)(a1 + 8);
      while (1)
      {
        long long v27 = *(_DWORD *)(a1 + v26 + 24);
        if (v27 >= v24 && (v27 != v24 || *(float *)(a1 + v26 + 28) >= a5.n128_f32[0])) {
          break;
        }
        v26 += 24;
      }
      uint64_t v28 = a1 + v26 + 24;
      if (v26)
      {
        unint64_t v29 = *v11;
        for (uint64_t i = (__n128 *)((char *)a2 - 24);
              v29 >= v24 && (v29 != v24 || i->n128_f32[1] >= a5.n128_f32[0]);
              uint64_t i = (__n128 *)((char *)i - 24))
        {
          uint64_t v31 = i[-2].n128_u32[2];
          unint64_t v29 = v31;
        }
      }
      else
      {
        uint64_t i = a2;
        if (v28 < (unint64_t)a2)
        {
          uint64_t v32 = *v11;
          uint64_t i = (__n128 *)((char *)a2 - 24);
          if (*v11 >= v24)
          {
            uint64_t i = (__n128 *)((char *)a2 - 24);
            do
            {
              if (v32 == v24)
              {
                if (v28 >= (unint64_t)i || i->n128_f32[1] < a5.n128_f32[0]) {
                  break;
                }
              }
              else if (v28 >= (unint64_t)i)
              {
                break;
              }
              uint64_t v33 = i[-2].n128_u32[2];
              uint64_t i = (__n128 *)((char *)i - 24);
              uint64_t v32 = v33;
            }
            while (v33 >= v24);
          }
        }
      }
      uint64_t j = v28;
      if (v28 < (unint64_t)i)
      {
        long long v34 = (unint64_t)i;
        do
        {
          v130 = *(void *)(j + 16);
          v121 = *(__n128 *)j;
          id v35 = *(_OWORD *)v34;
          *(unsigned char *)(j + 16) = *(unsigned char *)(v34 + 16);
          *(_OWORD *)uint64_t j = v35;
          *(unsigned char *)(v34 + 16) = v130;
          *(__n128 *)long long v34 = v121;
          do
          {
            do
            {
              uint64_t v36 = *(_DWORD *)(j + 24);
              j += 24;
              uint64_t v37 = v36 == v24;
            }
            while (v36 < v24);
          }
          while (v37 && *(float *)(j + 4) < a5.n128_f32[0]);
          do
          {
            unint64_t v39 = *(_DWORD *)(v34 - 24);
            v34 -= 24;
            unint64_t v38 = v39;
          }
          while (v39 >= v24 && (v38 != v24 || *(float *)(v34 + 4) >= a5.n128_f32[0]));
        }
        while (j < v34);
      }
      if (j - 24 != a1)
      {
        long long v40 = *(_OWORD *)(j - 24);
        *(unsigned char *)(a1 + 16) = *(unsigned char *)(j - 8);
        *(_OWORD *)a1 = v40;
      }
      *(_DWORD *)(j - 24) = v24;
      *(_DWORD *)(j - 20) = a5.n128_u32[0];
      *(unsigned char *)(j - _Block_object_dispose(&STACK[0x1160], 8) = BYTE8(v117);
      *(void *)(j - 16) = v117;
      if (v28 < (unint64_t)i) {
        goto LABEL_50;
      }
      uint64_t v41 = std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,-[MNRouteDivergenceFinder findAllOverlapRangesBetweenRoutes:]::$_0 &,[(MNRouteDivergenceFinder *)a1 findAllOverlapRangesBetweenRoutes:a5];
      if (std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,-[MNRouteDivergenceFinder findAllOverlapRangesBetweenRoutes:]::$_0 &,[(MNRouteDivergenceFinder *)j findAllOverlapRangesBetweenRoutes:v42])
      {
        a2 = (__n128 *)(j - 24);
        if (v41) {
          return a5.n128_f32[0];
        }
        goto LABEL_1;
      }
      if (!v41)
      {
LABEL_50:
        std::__introsort<std::_ClassicAlgPolicy,-[MNRouteDivergenceFinder findAllOverlapRangesBetweenRoutes:]::$_0 &,-[MNRouteDivergenceFinder findAllOverlapRangesBetweenRoutes:]::OverlapCoordinate *,false>(a1, j - 24, a3, a4 & 1);
        a4 = 0;
      }
    }
    else
    {
      a5.n128_u32[0] = *(_DWORD *)(a1 + 4);
LABEL_51:
      v118 = *(_OWORD *)(a1 + 8);
      uint64_t v43 = *v11;
      if (v24 < *v11 || v24 == v43 && a5.n128_f32[0] < a2[-2].n128_f32[3])
      {
        uint64_t j = a1;
        do
        {
          uint64_t v45 = *(_DWORD *)(j + 24);
          j += 24;
          uint64_t v44 = v45;
        }
        while (v24 >= v45 && (v24 != v44 || a5.n128_f32[0] >= *(float *)(j + 4)));
      }
      else
      {
        for (uint64_t j = a1 + 24;
              j < (unint64_t)a2
           && v24 >= *(_DWORD *)j
           && (v24 != *(_DWORD *)j || a5.n128_f32[0] >= *(float *)(j + 4));
      }
      k = a2;
      if (j < (unint64_t)a2)
      {
        for (k = (__n128 *)((char *)a2 - 24);
              v24 < v43 || v24 == v43 && a5.n128_f32[0] < k->n128_f32[1];
              k = (__n128 *)((char *)k - 24))
        {
          uint64_t v47 = k[-2].n128_u32[2];
          uint64_t v43 = v47;
        }
      }
      while (j < (unint64_t)k)
      {
        v131 = *(void *)(j + 16);
        v122 = *(__n128 *)j;
        long long v48 = *k;
        *(unsigned char *)(j + 16) = k[1].n128_u8[0];
        *(__n128 *)uint64_t j = v48;
        k[1].n128_u8[0] = v131;
        *k = v122;
        do
        {
          long long v50 = *(_DWORD *)(j + 24);
          j += 24;
          unint64_t v49 = v50;
        }
        while (v24 >= v50 && (v24 != v49 || a5.n128_f32[0] >= *(float *)(j + 4)));
        do
        {
          do
          {
            long long v51 = k[-2].n128_u32[2];
            k = (__n128 *)((char *)k - 24);
            long long v52 = v24 == v51;
          }
          while (v24 < v51);
        }
        while (v52 && a5.n128_f32[0] < k->n128_f32[1]);
      }
      BOOL v5 = j - 24 >= a1;
      int v6 = j - 24 == a1;
      if (j - 24 != a1)
      {
        long long v53 = *(_OWORD *)(j - 24);
        *(unsigned char *)(a1 + 16) = *(unsigned char *)(j - 8);
        *(_OWORD *)a1 = v53;
      }
      a4 = 0;
      *(_DWORD *)(j - 24) = v24;
      *(_DWORD *)(j - 20) = a5.n128_u32[0];
      *(unsigned char *)(j - _Block_object_dispose(&STACK[0x1160], 8) = BYTE8(v118);
      *(void *)(j - 16) = v118;
    }
  }
  switch(v14)
  {
    case 0uLL:
    case 1uLL:
      return a5.n128_f32[0];
    case 2uLL:
      unint64_t v54 = (__n128 *)((char *)a2 - 24);
      uint64_t v55 = a2[-2].n128_u32[2];
      if (v55 < *(_DWORD *)j
        || v55 == *(_DWORD *)j && (a5.n128_u32[0] = a2[-2].n128_u32[3], a5.n128_f32[0] < *(float *)(j + 4)))
      {
        v132 = *(void *)(j + 16);
        v123 = *(__n128 *)j;
        a5 = *v54;
        *(unsigned char *)(j + 16) = a2[-1].n128_u8[8];
        *(__n128 *)uint64_t j = a5;
        a5.n128_u32[0] = v123.n128_u32[0];
        a2[-1].n128_u8[8] = v132;
        *unint64_t v54 = v123;
      }
      break;
    case 3uLL:
      a5.n128_f32[0] = std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[MNRouteDivergenceFinder findAllOverlapRangesBetweenRoutes:]::$_0 &,-[MNRouteDivergenceFinder findAllOverlapRangesBetweenRoutes:]::OverlapCoordinate *>((__n128 *)j, (__n128 *)(j + 24), (__n128 *)((char *)a2 - 24), a5);
      break;
    case 4uLL:
      a5.n128_f32[0] = std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,-[MNRouteDivergenceFinder findAllOverlapRangesBetweenRoutes:]::$_0 &,-[MNRouteDivergenceFinder findAllOverlapRangesBetweenRoutes:]::OverlapCoordinate *>((__n128 *)j, (__n128 *)(j + 24), (__n128 *)(j + 48), (__n128 *)((char *)a2 - 24), a5);
      break;
    case 5uLL:
      uint64_t v56 = (__n128 *)(j + 24);
      uint64_t v57 = (__n128 *)(j + 48);
      uint64_t v58 = (__n128 *)(j + 72);
      a5.n128_f32[0] = std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,-[MNRouteDivergenceFinder findAllOverlapRangesBetweenRoutes:]::$_0 &,-[MNRouteDivergenceFinder findAllOverlapRangesBetweenRoutes:]::OverlapCoordinate *>((__n128 *)j, (__n128 *)(j + 24), (__n128 *)(j + 48), (__n128 *)(j + 72), a5);
      unint64_t v59 = (__n128 *)((char *)a2 - 24);
      uint64_t v60 = a2[-2].n128_u32[2];
      uint64_t v61 = *(_DWORD *)(j + 72);
      if (v60 < v61 || v60 == v61 && (a5.n128_u32[0] = a2[-2].n128_u32[3], a5.n128_f32[0] < *(float *)(j + 76)))
      {
        a5 = *v58;
        v62 = *(void *)(j + 88);
        uint64_t v63 = a2[-1].n128_u8[8];
        *uint64_t v58 = *v59;
        *(unsigned char *)(j + 8_Block_object_dispose(&STACK[0x1160], 8) = v63;
        a2[-1].n128_u8[8] = v62;
        *unint64_t v59 = a5;
        if (v58->n128_u32[0] < v57->n128_u32[0]
          || v58->n128_u32[0] == v57->n128_u32[0]
          && (a5.n128_u32[0] = *(_DWORD *)(j + 76), a5.n128_f32[0] < *(float *)(j + 52)))
        {
          v64 = *(void *)(j + 64);
          a5 = *v57;
          *uint64_t v57 = *v58;
          *(unsigned char *)(j + 64) = *(unsigned char *)(j + 88);
          *uint64_t v58 = a5;
          *(unsigned char *)(j + 8_Block_object_dispose(&STACK[0x1160], 8) = v64;
          if (v57->n128_u32[0] < v56->n128_u32[0]
            || v57->n128_u32[0] == v56->n128_u32[0]
            && (a5.n128_u32[0] = *(_DWORD *)(j + 52), a5.n128_f32[0] < *(float *)(j + 28)))
          {
            v65 = *(void *)(j + 40);
            a5 = *v56;
            *uint64_t v56 = *v57;
            *(unsigned char *)(j + 40) = *(unsigned char *)(j + 64);
            *uint64_t v57 = a5;
            *(unsigned char *)(j + 64) = v65;
            v66 = *(_DWORD *)(j + 24);
            if (v66 < *(_DWORD *)j
              || v66 == *(_DWORD *)j && (a5.n128_u32[0] = *(_DWORD *)(j + 28), a5.n128_f32[0] < *(float *)(j + 4)))
            {
              v133 = *(void *)(j + 16);
              v124 = *(__n128 *)j;
              *(__n128 *)uint64_t j = *v56;
              *(unsigned char *)(j + 16) = *(unsigned char *)(j + 40);
              a5.n128_u32[0] = v124.n128_u32[0];
              *uint64_t v56 = v124;
              *(unsigned char *)(j + 40) = v133;
            }
          }
        }
      }
      break;
    default:
      JUMPOUT(0);
  }
  return a5.n128_f32[0];
}

float std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[MNRouteDivergenceFinder findAllOverlapRangesBetweenRoutes:]::$_0 &,-[MNRouteDivergenceFinder findAllOverlapRangesBetweenRoutes:]::OverlapCoordinate *>(__n128 *a1, __n128 *a2, __n128 *a3, __n128 a4)
{
  unsigned __int32 v4 = a2->n128_u32[0];
  if (a2->n128_u32[0] < a1->n128_u32[0]
    || v4 == a1->n128_u32[0] && (a4.n128_u32[0] = a2->n128_u32[1], a4.n128_f32[0] < a1->n128_f32[1]))
  {
    if (a3->n128_u32[0] < v4 || a3->n128_u32[0] == v4 && a3->n128_f32[1] < a2->n128_f32[1])
    {
      a4 = *a1;
      unint64_t v5 = a1[1].n128_u64[0];
      unsigned __int8 v6 = a3[1].n128_u8[0];
      *a1 = *a3;
      a1[1].n128_u8[0] = v6;
LABEL_17:
      a3[1].n128_u8[0] = v5;
      *a3 = a4;
      return a4.n128_f32[0];
    }
    a4 = *a1;
    unint64_t v11 = a1[1].n128_u64[0];
    unsigned __int8 v12 = a2[1].n128_u8[0];
    *a1 = *a2;
    a1[1].n128_u8[0] = v12;
    a2[1].n128_u8[0] = v11;
    *a2 = a4;
    if (a3->n128_u32[0] < a2->n128_u32[0]
      || a3->n128_u32[0] == a2->n128_u32[0] && (a4.n128_u32[0] = a3->n128_u32[1], a4.n128_f32[0] < a2->n128_f32[1]))
    {
      a4 = *a2;
      unint64_t v5 = a2[1].n128_u64[0];
      unsigned __int8 v13 = a3[1].n128_u8[0];
      *a2 = *a3;
      a2[1].n128_u8[0] = v13;
      goto LABEL_17;
    }
  }
  else if (a3->n128_u32[0] < v4 {
         || a3->n128_u32[0] == v4 && (a4.n128_u32[0] = a3->n128_u32[1], a4.n128_f32[0] < a2->n128_f32[1]))
  }
  {
    a4 = *a2;
    unint64_t v7 = a2[1].n128_u64[0];
    unsigned __int8 v8 = a3[1].n128_u8[0];
    *a2 = *a3;
    a2[1].n128_u8[0] = v8;
    a3[1].n128_u8[0] = v7;
    *a3 = a4;
    if (a2->n128_u32[0] < a1->n128_u32[0]
      || a2->n128_u32[0] == a1->n128_u32[0] && (a4.n128_u32[0] = a2->n128_u32[1], a4.n128_f32[0] < a1->n128_f32[1]))
    {
      a4 = *a1;
      unint64_t v9 = a1[1].n128_u64[0];
      unsigned __int8 v10 = a2[1].n128_u8[0];
      *a1 = *a2;
      a1[1].n128_u8[0] = v10;
      a2[1].n128_u8[0] = v9;
      *a2 = a4;
    }
  }
  return a4.n128_f32[0];
}

BOOL std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,-[MNRouteDivergenceFinder findAllOverlapRangesBetweenRoutes:]::$_0 &,-[MNRouteDivergenceFinder findAllOverlapRangesBetweenRoutes:]::OverlapCoordinate *>(uint64_t a1, uint64_t a2, __n128 a3)
{
  uint64_t v5 = (a2 - a1) >> 3;
  BOOL result = 1;
  switch(0xAAAAAAAAAAAAAAABLL * v5)
  {
    case 0uLL:
    case 1uLL:
      return result;
    case 2uLL:
      unint64_t v7 = (__n128 *)(a2 - 24);
      unsigned int v8 = *(_DWORD *)(a2 - 24);
      if (v8 < *(_DWORD *)a1 || v8 == *(_DWORD *)a1 && *(float *)(a2 - 20) < *(float *)(a1 + 4))
      {
        __n128 v9 = *(__n128 *)a1;
        uint64_t v10 = *(void *)(a1 + 16);
        char v11 = *(unsigned char *)(a2 - 8);
        *(__n128 *)a1 = *v7;
        *(unsigned char *)(a1 + 16) = v11;
        *(unsigned char *)(a2 - _Block_object_dispose(&STACK[0x1160], 8) = v10;
        *unint64_t v7 = v9;
      }
      return result;
    case 3uLL:
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[MNRouteDivergenceFinder findAllOverlapRangesBetweenRoutes:]::$_0 &,-[MNRouteDivergenceFinder findAllOverlapRangesBetweenRoutes:]::OverlapCoordinate *>((__n128 *)a1, (__n128 *)(a1 + 24), (__n128 *)(a2 - 24), a3);
      return 1;
    case 4uLL:
      std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,-[MNRouteDivergenceFinder findAllOverlapRangesBetweenRoutes:]::$_0 &,-[MNRouteDivergenceFinder findAllOverlapRangesBetweenRoutes:]::OverlapCoordinate *>((__n128 *)a1, (__n128 *)(a1 + 24), (__n128 *)(a1 + 48), (__n128 *)(a2 - 24), a3);
      return 1;
    case 5uLL:
      int64_t v21 = (__n128 *)(a1 + 24);
      long long v22 = (__n128 *)(a1 + 48);
      long long v23 = (__n128 *)(a1 + 72);
      std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,-[MNRouteDivergenceFinder findAllOverlapRangesBetweenRoutes:]::$_0 &,-[MNRouteDivergenceFinder findAllOverlapRangesBetweenRoutes:]::OverlapCoordinate *>((__n128 *)a1, (__n128 *)(a1 + 24), (__n128 *)(a1 + 48), (__n128 *)(a1 + 72), a3);
      long long v24 = (__n128 *)(a2 - 24);
      unsigned int v25 = *(_DWORD *)(a2 - 24);
      unsigned int v26 = *(_DWORD *)(a1 + 72);
      if (v25 < v26 || v25 == v26 && *(float *)(a2 - 20) < *(float *)(a1 + 76))
      {
        __n128 v27 = *v23;
        uint64_t v28 = *(void *)(a1 + 88);
        char v29 = *(unsigned char *)(a2 - 8);
        __n128 *v23 = *v24;
        *(unsigned char *)(a1 + 8_Block_object_dispose(&STACK[0x1160], 8) = v29;
        *(unsigned char *)(a2 - _Block_object_dispose(&STACK[0x1160], 8) = v28;
        __n128 *v24 = v27;
        if (v23->n128_u32[0] < v22->n128_u32[0]
          || v23->n128_u32[0] == v22->n128_u32[0] && *(float *)(a1 + 76) < *(float *)(a1 + 52))
        {
          uint64_t v30 = *(void *)(a1 + 64);
          __n128 v31 = *v22;
          *long long v22 = *v23;
          *(unsigned char *)(a1 + 64) = *(unsigned char *)(a1 + 88);
          __n128 *v23 = v31;
          *(unsigned char *)(a1 + 8_Block_object_dispose(&STACK[0x1160], 8) = v30;
          if (v22->n128_u32[0] < v21->n128_u32[0]
            || v22->n128_u32[0] == v21->n128_u32[0] && *(float *)(a1 + 52) < *(float *)(a1 + 28))
          {
            uint64_t v32 = *(void *)(a1 + 40);
            __n128 v33 = *v21;
            *int64_t v21 = *v22;
            *(unsigned char *)(a1 + 40) = *(unsigned char *)(a1 + 64);
            *long long v22 = v33;
            *(unsigned char *)(a1 + 64) = v32;
            unsigned int v34 = *(_DWORD *)(a1 + 24);
            if (v34 < *(_DWORD *)a1 || v34 == *(_DWORD *)a1 && *(float *)(a1 + 28) < *(float *)(a1 + 4))
            {
              uint64_t v35 = *(void *)(a1 + 16);
              __n128 v36 = *(__n128 *)a1;
              *(__n128 *)a1 = *v21;
              *(unsigned char *)(a1 + 16) = *(unsigned char *)(a1 + 40);
              *int64_t v21 = v36;
              *(unsigned char *)(a1 + 40) = v35;
            }
          }
        }
      }
      return 1;
    default:
      uint64_t v12 = a1 + 48;
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[MNRouteDivergenceFinder findAllOverlapRangesBetweenRoutes:]::$_0 &,-[MNRouteDivergenceFinder findAllOverlapRangesBetweenRoutes:]::OverlapCoordinate *>((__n128 *)a1, (__n128 *)(a1 + 24), (__n128 *)(a1 + 48), a3);
      uint64_t v13 = a1 + 72;
      if (a1 + 72 == a2) {
        return 1;
      }
      uint64_t v14 = 0;
      int v15 = 0;
      break;
  }
  while (1)
  {
    unsigned int v16 = *(_DWORD *)v13;
    if (*(_DWORD *)v13 < *(_DWORD *)v12) {
      break;
    }
    if (v16 == *(_DWORD *)v12)
    {
      float v17 = *(float *)(v13 + 4);
      if (v17 < *(float *)(v12 + 4)) {
        goto LABEL_10;
      }
    }
LABEL_20:
    uint64_t v12 = v13;
    v14 += 24;
    v13 += 24;
    if (v13 == a2) {
      return 1;
    }
  }
  float v17 = *(float *)(v13 + 4);
LABEL_10:
  long long v37 = *(_OWORD *)(v13 + 8);
  *(unsigned char *)(v13 + 16) = *(unsigned char *)(v12 + 16);
  *(_OWORD *)uint64_t v13 = *(_OWORD *)v12;
  uint64_t v18 = a1;
  if (v12 != a1)
  {
    uint64_t v19 = v14;
    while (1)
    {
      unsigned int v20 = *(_DWORD *)(a1 + v19 + 24);
      if (v16 >= v20)
      {
        if (v16 != v20)
        {
          uint64_t v18 = a1 + v19 + 48;
          goto LABEL_19;
        }
        if (v17 >= *(float *)(a1 + v19 + 28)) {
          break;
        }
      }
      v12 -= 24;
      *(_OWORD *)(a1 + v19 + 4_Block_object_dispose(&STACK[0x1160], 8) = *(_OWORD *)(a1 + v19 + 24);
      *(unsigned char *)(a1 + v19 + 64) = *(unsigned char *)(a1 + v19 + 40);
      v19 -= 24;
      if (v19 == -48)
      {
        uint64_t v18 = a1;
        goto LABEL_19;
      }
    }
    uint64_t v18 = v12;
  }
LABEL_19:
  *(_DWORD *)uint64_t v18 = v16;
  *(float *)(v18 + 4) = v17;
  *(void *)(v18 + _Block_object_dispose(&STACK[0x1160], 8) = v37;
  *(unsigned char *)(v18 + 16) = BYTE8(v37);
  if (++v15 != 8) {
    goto LABEL_20;
  }
  return v13 + 24 == a2;
}

float std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,-[MNRouteDivergenceFinder findAllOverlapRangesBetweenRoutes:]::$_0 &,-[MNRouteDivergenceFinder findAllOverlapRangesBetweenRoutes:]::OverlapCoordinate *>(__n128 *a1, __n128 *a2, __n128 *a3, __n128 *a4, __n128 a5)
{
  v9.n128_f32[0] = std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[MNRouteDivergenceFinder findAllOverlapRangesBetweenRoutes:]::$_0 &,-[MNRouteDivergenceFinder findAllOverlapRangesBetweenRoutes:]::OverlapCoordinate *>(a1, a2, a3, a5);
  if (a4->n128_u32[0] < a3->n128_u32[0]
    || a4->n128_u32[0] == a3->n128_u32[0] && (v9.n128_u32[0] = a4->n128_u32[1], v9.n128_f32[0] < a3->n128_f32[1]))
  {
    __n128 v9 = *a3;
    unint64_t v10 = a3[1].n128_u64[0];
    unsigned __int8 v11 = a4[1].n128_u8[0];
    *a3 = *a4;
    a3[1].n128_u8[0] = v11;
    a4[1].n128_u8[0] = v10;
    *a4 = v9;
    if (a3->n128_u32[0] < a2->n128_u32[0]
      || a3->n128_u32[0] == a2->n128_u32[0] && (v9.n128_u32[0] = a3->n128_u32[1], v9.n128_f32[0] < a2->n128_f32[1]))
    {
      __n128 v9 = *a2;
      unint64_t v12 = a2[1].n128_u64[0];
      unsigned __int8 v13 = a3[1].n128_u8[0];
      *a2 = *a3;
      a2[1].n128_u8[0] = v13;
      a3[1].n128_u8[0] = v12;
      *a3 = v9;
      if (a2->n128_u32[0] < a1->n128_u32[0]
        || a2->n128_u32[0] == a1->n128_u32[0] && (v9.n128_u32[0] = a2->n128_u32[1], v9.n128_f32[0] < a1->n128_f32[1]))
      {
        __n128 v9 = *a1;
        unint64_t v14 = a1[1].n128_u64[0];
        unsigned __int8 v15 = a2[1].n128_u8[0];
        *a1 = *a2;
        a1[1].n128_u8[0] = v15;
        a2[1].n128_u8[0] = v14;
        *a2 = v9;
      }
    }
  }
  return v9.n128_f32[0];
}

uint64_t *std::__tree<unsigned long>::__emplace_hint_unique_key_args<unsigned long,unsigned long const&>(uint64_t *result, uint64_t *a2, unint64_t a3, uint64_t a4)
{
  uint64_t v5 = (uint64_t **)a2;
  unsigned __int8 v6 = (uint64_t **)result;
  unint64_t v7 = (uint64_t **)(result + 1);
  if (result + 1 == a2 || (unint64_t v8 = a2[4], v8 > a3))
  {
    uint64_t v9 = *a2;
    if ((uint64_t *)*result == a2)
    {
      unsigned __int8 v11 = a2;
LABEL_16:
      if (v9) {
        float v17 = v11;
      }
      else {
        float v17 = a2;
      }
      if (v9) {
        unsigned __int8 v13 = (uint64_t **)(v11 + 1);
      }
      else {
        unsigned __int8 v13 = (uint64_t **)a2;
      }
      if (*v13) {
        return result;
      }
      uint64_t v5 = (uint64_t **)v17;
LABEL_43:
      long long v23 = (uint64_t *)operator new(0x28uLL);
      v23[4] = a4;
      return std::__tree<unsigned long>::__insert_node_at(v6, (uint64_t)v5, v13, v23);
    }
    if (v9)
    {
      unint64_t v10 = (uint64_t *)*a2;
      do
      {
        unsigned __int8 v11 = v10;
        unint64_t v10 = (uint64_t *)v10[1];
      }
      while (v10);
    }
    else
    {
      unsigned __int8 v15 = a2;
      do
      {
        unsigned __int8 v11 = (uint64_t *)v15[2];
        BOOL v16 = *v11 == (void)v15;
        unsigned __int8 v15 = v11;
      }
      while (v16);
    }
    if (v11[4] < a3) {
      goto LABEL_16;
    }
    uint64_t v18 = *v7;
    unsigned __int8 v13 = (uint64_t **)(result + 1);
    uint64_t v5 = (uint64_t **)(result + 1);
    if (!*v7) {
      goto LABEL_43;
    }
    while (1)
    {
      while (1)
      {
        uint64_t v5 = (uint64_t **)v18;
        unint64_t v19 = v18[4];
        if (v19 <= a3) {
          break;
        }
        uint64_t v18 = (uint64_t *)*v18;
        unsigned __int8 v13 = v5;
        if (!*v5) {
          goto LABEL_43;
        }
      }
      if (v19 >= a3) {
        break;
      }
      uint64_t v18 = (uint64_t *)v18[1];
      if (!v18) {
        goto LABEL_30;
      }
    }
  }
  else
  {
    if (v8 >= a3) {
      return result;
    }
    unsigned __int8 v13 = (uint64_t **)(a2 + 1);
    unint64_t v12 = (uint64_t *)a2[1];
    if (v12)
    {
      do
      {
        unsigned __int8 v13 = (uint64_t **)v12;
        unint64_t v12 = (uint64_t *)*v12;
        uint64_t v5 = v13;
        unint64_t v14 = v13;
      }
      while (v12);
    }
    else
    {
      unint64_t v14 = (uint64_t **)a2;
      do
      {
        unsigned int v20 = v14;
        unint64_t v14 = (uint64_t **)v14[2];
      }
      while (*v14 != (uint64_t *)v20);
    }
    if (v14 == v7) {
      goto LABEL_43;
    }
    if ((unint64_t)v14[4] > a3) {
      goto LABEL_43;
    }
    int64_t v21 = *v7;
    unsigned __int8 v13 = (uint64_t **)(result + 1);
    uint64_t v5 = (uint64_t **)(result + 1);
    if (!*v7) {
      goto LABEL_43;
    }
    while (1)
    {
      while (1)
      {
        uint64_t v5 = (uint64_t **)v21;
        unint64_t v22 = v21[4];
        if (v22 <= a3) {
          break;
        }
        int64_t v21 = (uint64_t *)*v21;
        unsigned __int8 v13 = v5;
        if (!*v5) {
          goto LABEL_43;
        }
      }
      if (v22 >= a3) {
        break;
      }
      int64_t v21 = (uint64_t *)v21[1];
      if (!v21)
      {
LABEL_30:
        unsigned __int8 v13 = v5 + 1;
        goto LABEL_43;
      }
    }
  }
  return result;
}

uint64_t *std::__tree<unsigned long>::__insert_node_at(uint64_t **a1, uint64_t a2, uint64_t **a3, uint64_t *a4)
{
  *a4 = 0;
  a4[1] = 0;
  a4[2] = a2;
  *a3 = a4;
  uint64_t v5 = (uint64_t *)**a1;
  if (v5)
  {
    *a1 = v5;
    a4 = *a3;
  }
  BOOL result = std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(a1[1], a4);
  a1[2] = (uint64_t *)((char *)a1[2] + 1);
  return result;
}

void std::__tree<unsigned long>::destroy(void *a1)
{
  if (a1)
  {
    std::__tree<unsigned long>::destroy(*a1);
    std::__tree<unsigned long>::destroy(a1[1]);
    operator delete(a1);
  }
}

uint64_t *std::set<unsigned long>::set[abi:ne180100](uint64_t *a1, void *a2)
{
  a1[1] = 0;
  uint64_t v3 = a1 + 1;
  a1[2] = 0;
  *a1 = (uint64_t)(a1 + 1);
  unsigned __int32 v4 = a2 + 1;
  uint64_t v5 = (void *)*a2;
  if ((void *)*a2 != a2 + 1)
  {
    do
    {
      std::__tree<unsigned long>::__emplace_hint_unique_key_args<unsigned long,unsigned long const&>(a1, v3, v5[4], v5[4]);
      unsigned __int8 v6 = (void *)v5[1];
      if (v6)
      {
        do
        {
          unint64_t v7 = v6;
          unsigned __int8 v6 = (void *)*v6;
        }
        while (v6);
      }
      else
      {
        do
        {
          unint64_t v7 = (void *)v5[2];
          BOOL v8 = *v7 == (void)v5;
          uint64_t v5 = v7;
        }
        while (!v8);
      }
      uint64_t v5 = v7;
    }
    while (v7 != v4);
  }
  return a1;
}

void sub_1B54D2928(_Unwind_Exception *a1)
{
  std::__tree<unsigned long>::destroy(*v1);
  _Unwind_Resume(a1);
}

uint64_t std::deque<_MNRouteConvergencePoint>::~deque[abi:ne180100](uint64_t a1)
{
  double v2 = *(void ***)(a1 + 8);
  uint64_t v3 = *(void ***)(a1 + 16);
  *(void *)(a1 + 40) = 0;
  unint64_t v4 = (char *)v3 - (char *)v2;
  if ((unint64_t)((char *)v3 - (char *)v2) >= 0x11)
  {
    do
    {
      operator delete(*v2);
      uint64_t v3 = *(void ***)(a1 + 16);
      double v2 = (void **)(*(void *)(a1 + 8) + 8);
      *(void *)(a1 + _Block_object_dispose(&STACK[0x1160], 8) = v2;
      unint64_t v4 = (char *)v3 - (char *)v2;
    }
    while ((unint64_t)((char *)v3 - (char *)v2) > 0x10);
  }
  unint64_t v5 = v4 >> 3;
  if (v5 == 1)
  {
    uint64_t v6 = 21;
    goto LABEL_7;
  }
  if (v5 == 2)
  {
    uint64_t v6 = 42;
LABEL_7:
    *(void *)(a1 + 32) = v6;
  }
  if (v2 != v3)
  {
    do
    {
      unint64_t v7 = *v2++;
      operator delete(v7);
    }
    while (v2 != v3);
    uint64_t v9 = *(void *)(a1 + 8);
    uint64_t v8 = *(void *)(a1 + 16);
    if (v8 != v9) {
      *(void *)(a1 + 16) = v8 + ((v9 - v8 + 7) & 0xFFFFFFFFFFFFFFF8);
    }
  }
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

__n128 std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[MNRouteDivergenceFinder _findFirstConvergenceBetweenRoute:range:andRoute:range:outRouteCoordinate:outRouteCoordinate:]::$_3 &,std::__deque_iterator<_MNRouteConvergencePoint,_MNRouteConvergencePoint*,_MNRouteConvergencePoint&,_MNRouteConvergencePoint**,long,42l>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  result.n128_u64[0] = *(void *)(a4 + 8);
  double v7 = *(double *)(a2 + 8);
  if (result.n128_f64[0] < v7
    || result.n128_f64[0] <= v7 && (*(unsigned char *)(a4 + 88) ? (BOOL v13 = *(unsigned char *)(a2 + 88) == 0) : (BOOL v13 = 0), v13))
  {
    double v8 = *(double *)(a6 + 8);
    if (v8 < result.n128_f64[0] || v8 <= result.n128_f64[0] && *(unsigned char *)(a6 + 88) && !*(unsigned char *)(a4 + 88))
    {
      long long v41 = *(_OWORD *)(a2 + 32);
      long long v45 = *(_OWORD *)(a2 + 48);
      *(_OWORD *)unint64_t v49 = *(_OWORD *)(a2 + 64);
      *(_OWORD *)&v49[16] = *(_OWORD *)(a2 + 80);
      __n128 v33 = *(__n128 *)a2;
      long long v37 = *(_OWORD *)(a2 + 16);
      long long v9 = *(_OWORD *)(a6 + 16);
      *(_OWORD *)a2 = *(_OWORD *)a6;
      *(_OWORD *)(a2 + 16) = v9;
      long long v11 = *(_OWORD *)(a6 + 48);
      long long v10 = *(_OWORD *)(a6 + 64);
      long long v12 = *(_OWORD *)(a6 + 32);
      *(_OWORD *)(a2 + 74) = *(_OWORD *)(a6 + 74);
      *(_OWORD *)(a2 + 4_Block_object_dispose(&STACK[0x1160], 8) = v11;
      *(_OWORD *)(a2 + 64) = v10;
      *(_OWORD *)(a2 + 32) = v12;
    }
    else
    {
      long long v44 = *(_OWORD *)(a2 + 32);
      long long v48 = *(_OWORD *)(a2 + 48);
      *(_OWORD *)long long v52 = *(_OWORD *)(a2 + 64);
      *(_OWORD *)&v52[16] = *(_OWORD *)(a2 + 80);
      __n128 v36 = *(__n128 *)a2;
      long long v40 = *(_OWORD *)(a2 + 16);
      long long v24 = *(_OWORD *)(a4 + 16);
      *(_OWORD *)a2 = *(_OWORD *)a4;
      *(_OWORD *)(a2 + 16) = v24;
      long long v26 = *(_OWORD *)(a4 + 48);
      long long v25 = *(_OWORD *)(a4 + 64);
      long long v27 = *(_OWORD *)(a4 + 32);
      *(_OWORD *)(a2 + 74) = *(_OWORD *)(a4 + 74);
      *(_OWORD *)(a2 + 4_Block_object_dispose(&STACK[0x1160], 8) = v26;
      *(_OWORD *)(a2 + 64) = v25;
      *(_OWORD *)(a2 + 32) = v27;
      *(_OWORD *)(a4 + 64) = *(_OWORD *)v52;
      *(_OWORD *)(a4 + 74) = *(_OWORD *)&v52[10];
      *(_OWORD *)(a4 + 32) = v44;
      *(_OWORD *)(a4 + 4_Block_object_dispose(&STACK[0x1160], 8) = v48;
      result.n128_u64[1] = v36.n128_u64[1];
      *(__n128 *)a4 = v36;
      *(_OWORD *)(a4 + 16) = v40;
      result.n128_u64[0] = *(void *)(a6 + 8);
      double v28 = *(double *)(a4 + 8);
      if (result.n128_f64[0] >= v28 && (result.n128_f64[0] > v28 || !*(unsigned char *)(a6 + 88) || *(unsigned char *)(a4 + 88))) {
        return result;
      }
      long long v41 = *(_OWORD *)(a4 + 32);
      long long v45 = *(_OWORD *)(a4 + 48);
      *(_OWORD *)unint64_t v49 = *(_OWORD *)(a4 + 64);
      *(_OWORD *)&v49[16] = *(_OWORD *)(a4 + 80);
      __n128 v33 = *(__n128 *)a4;
      long long v37 = *(_OWORD *)(a4 + 16);
      long long v29 = *(_OWORD *)(a6 + 16);
      *(_OWORD *)a4 = *(_OWORD *)a6;
      *(_OWORD *)(a4 + 16) = v29;
      long long v31 = *(_OWORD *)(a6 + 48);
      long long v30 = *(_OWORD *)(a6 + 64);
      long long v32 = *(_OWORD *)(a6 + 32);
      *(_OWORD *)(a4 + 74) = *(_OWORD *)(a6 + 74);
      *(_OWORD *)(a4 + 4_Block_object_dispose(&STACK[0x1160], 8) = v31;
      *(_OWORD *)(a4 + 64) = v30;
      *(_OWORD *)(a4 + 32) = v32;
    }
    *(_OWORD *)(a6 + 64) = *(_OWORD *)v49;
    *(_OWORD *)(a6 + 74) = *(_OWORD *)&v49[10];
    *(_OWORD *)(a6 + 32) = v41;
    *(_OWORD *)(a6 + 4_Block_object_dispose(&STACK[0x1160], 8) = v45;
    __n128 result = v33;
    *(__n128 *)a6 = v33;
    *(_OWORD *)(a6 + 16) = v37;
    return result;
  }
  double v14 = *(double *)(a6 + 8);
  if (v14 < result.n128_f64[0] || v14 <= result.n128_f64[0] && *(unsigned char *)(a6 + 88) && !*(unsigned char *)(a4 + 88))
  {
    long long v42 = *(_OWORD *)(a4 + 32);
    long long v46 = *(_OWORD *)(a4 + 48);
    *(_OWORD *)long long v50 = *(_OWORD *)(a4 + 64);
    *(_OWORD *)&v50[16] = *(_OWORD *)(a4 + 80);
    __n128 v34 = *(__n128 *)a4;
    long long v38 = *(_OWORD *)(a4 + 16);
    long long v15 = *(_OWORD *)(a6 + 16);
    *(_OWORD *)a4 = *(_OWORD *)a6;
    *(_OWORD *)(a4 + 16) = v15;
    long long v17 = *(_OWORD *)(a6 + 48);
    long long v16 = *(_OWORD *)(a6 + 64);
    long long v18 = *(_OWORD *)(a6 + 32);
    *(_OWORD *)(a4 + 74) = *(_OWORD *)(a6 + 74);
    *(_OWORD *)(a4 + 4_Block_object_dispose(&STACK[0x1160], 8) = v17;
    *(_OWORD *)(a4 + 64) = v16;
    *(_OWORD *)(a4 + 32) = v18;
    *(_OWORD *)(a6 + 64) = *(_OWORD *)v50;
    *(_OWORD *)(a6 + 74) = *(_OWORD *)&v50[10];
    *(_OWORD *)(a6 + 32) = v42;
    *(_OWORD *)(a6 + 4_Block_object_dispose(&STACK[0x1160], 8) = v46;
    result.n128_u64[1] = v34.n128_u64[1];
    *(__n128 *)a6 = v34;
    *(_OWORD *)(a6 + 16) = v38;
    result.n128_u64[0] = *(void *)(a4 + 8);
    double v19 = *(double *)(a2 + 8);
    if (result.n128_f64[0] < v19 || result.n128_f64[0] <= v19 && *(unsigned char *)(a4 + 88) && !*(unsigned char *)(a2 + 88))
    {
      long long v43 = *(_OWORD *)(a2 + 32);
      long long v47 = *(_OWORD *)(a2 + 48);
      *(_OWORD *)long long v51 = *(_OWORD *)(a2 + 64);
      *(_OWORD *)&v51[16] = *(_OWORD *)(a2 + 80);
      __n128 v35 = *(__n128 *)a2;
      long long v39 = *(_OWORD *)(a2 + 16);
      long long v20 = *(_OWORD *)(a4 + 16);
      *(_OWORD *)a2 = *(_OWORD *)a4;
      *(_OWORD *)(a2 + 16) = v20;
      long long v22 = *(_OWORD *)(a4 + 48);
      long long v21 = *(_OWORD *)(a4 + 64);
      long long v23 = *(_OWORD *)(a4 + 32);
      *(_OWORD *)(a2 + 74) = *(_OWORD *)(a4 + 74);
      *(_OWORD *)(a2 + 4_Block_object_dispose(&STACK[0x1160], 8) = v22;
      *(_OWORD *)(a2 + 64) = v21;
      *(_OWORD *)(a2 + 32) = v23;
      *(_OWORD *)(a4 + 64) = *(_OWORD *)v51;
      *(_OWORD *)(a4 + 74) = *(_OWORD *)&v51[10];
      *(_OWORD *)(a4 + 32) = v43;
      *(_OWORD *)(a4 + 4_Block_object_dispose(&STACK[0x1160], 8) = v47;
      __n128 result = v35;
      *(__n128 *)a4 = v35;
      *(_OWORD *)(a4 + 16) = v39;
    }
  }
  return result;
}

uint64_t std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,-[MNRouteDivergenceFinder _findFirstConvergenceBetweenRoute:range:andRoute:range:outRouteCoordinate:outRouteCoordinate:]::$_3 &,std::__deque_iterator<_MNRouteConvergencePoint,_MNRouteConvergencePoint*,_MNRouteConvergencePoint&,_MNRouteConvergencePoint**,long,42l>>(void *a1, uint64_t a2, uint64_t *a3, uint64_t a4)
{
  if (a4 == a2) {
    return 1;
  }
  uint64_t v4 = a4;
  uint64_t v5 = (uint64_t)a3;
  uint64_t v7 = *a3;
  uint64_t v8 = a2 - *a1;
  uint64_t v9 = v8 >> 5;
  BOOL v10 = 1;
  switch(42 * (a3 - a1) - 0x5555555555555555 * ((a4 - *a3) >> 5) + 0x5555555555555555 * (v8 >> 5))
  {
    case 0:
    case 1:
      return v10;
    case 2:
      if (v7 == a4) {
        uint64_t v4 = *(a3 - 1) + 4032;
      }
      double v11 = *(double *)(v4 - 88);
      double v12 = *(double *)(a2 + 8);
      if (v11 < v12) {
        goto LABEL_6;
      }
      if (v11 > v12) {
        return 1;
      }
      BOOL v10 = 1;
      if (*(unsigned char *)(v4 - 8) && !*(unsigned char *)(a2 + 88))
      {
LABEL_6:
        BOOL v13 = (_OWORD *)(v4 - 96);
        long long v123 = *(_OWORD *)(a2 + 32);
        long long v129 = *(_OWORD *)(a2 + 48);
        *(_OWORD *)v135 = *(_OWORD *)(a2 + 64);
        *(_OWORD *)&v135[16] = *(_OWORD *)(a2 + 80);
        long long v111 = *(_OWORD *)a2;
        long long v117 = *(_OWORD *)(a2 + 16);
        long long v14 = *(_OWORD *)(v4 - 80);
        *(_OWORD *)a2 = *(_OWORD *)(v4 - 96);
        *(_OWORD *)(a2 + 16) = v14;
        long long v16 = *(_OWORD *)(v4 - 48);
        long long v15 = *(_OWORD *)(v4 - 32);
        long long v17 = *(_OWORD *)(v4 - 64);
        *(_OWORD *)(a2 + 74) = *(_OWORD *)(v4 - 22);
        *(_OWORD *)(a2 + 4_Block_object_dispose(&STACK[0x1160], 8) = v16;
        *(_OWORD *)(a2 + 64) = v15;
        *(_OWORD *)(a2 + 32) = v17;
        v13[4] = *(_OWORD *)v135;
        *(_OWORD *)((char *)v13 + 74) = *(_OWORD *)&v135[10];
        v13[2] = v123;
        v13[3] = v129;
        BOOL v10 = 1;
        *BOOL v13 = v111;
        v13[1] = v117;
      }
      return v10;
    case 3:
      unint64_t v24 = 0xAAAAAAAAAAAAAAABLL * v9;
      if (v8 < -95)
      {
        unint64_t v37 = 40 - v24;
        long long v26 = &a1[-(v37 / 0x2A)];
        uint64_t v27 = *v26 + 96 * (42 * (v37 / 0x2A) - v37) + 3936;
      }
      else
      {
        unint64_t v25 = v24 + 1;
        long long v26 = &a1[v25 / 0x2A];
        uint64_t v27 = *v26 + 96 * (v25 % 0x2A);
      }
      if (v7 == v4)
      {
        uint64_t v38 = *(void *)(v5 - 8);
        v5 -= 8;
        uint64_t v4 = v38 + 4032;
      }
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[MNRouteDivergenceFinder _findFirstConvergenceBetweenRoute:range:andRoute:range:outRouteCoordinate:outRouteCoordinate:]::$_3 &,std::__deque_iterator<_MNRouteConvergencePoint,_MNRouteConvergencePoint*,_MNRouteConvergencePoint&,_MNRouteConvergencePoint**,long,42l>>((uint64_t)a1, a2, (uint64_t)v26, v27, v5, v4 - 96);
      return 1;
    case 4:
      unint64_t v28 = 0xAAAAAAAAAAAAAAABLL * v9;
      if (v8 >= -95)
      {
        long long v29 = &a1[(v28 + 1) / 0x2A];
        uint64_t v30 = *v29 + 96 * ((v28 + 1) % 0x2A);
        unint64_t v31 = v28 + 2;
LABEL_29:
        long long v40 = &a1[v31 / 0x2A];
        uint64_t v41 = *v40 + 96 * (v31 % 0x2A);
        goto LABEL_82;
      }
      unint64_t v39 = (40 - v28) / 0x2A;
      long long v29 = &a1[-v39];
      uint64_t v30 = *v29 + 96 * (v28 - 40 + 42 * v39) + 3936;
      if ((unint64_t)v8 >= 0xFFFFFFFFFFFFFF41)
      {
        unint64_t v31 = 1;
        goto LABEL_29;
      }
      unint64_t v105 = 39 - v28;
      long long v40 = &a1[-(v105 / 0x2A)];
      uint64_t v41 = *v40 + 96 * (42 * (v105 / 0x2A) - v105) + 3936;
LABEL_82:
      if (v7 == v4)
      {
        uint64_t v106 = *(void *)(v5 - 8);
        v5 -= 8;
        uint64_t v4 = v106 + 4032;
      }
      std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,[(MNRouteDivergenceFinder *)(uint64_t)a1 _findFirstConvergenceBetweenRoute:(uint64_t)v29 range:v30 andRoute:(uint64_t)v40 range:v41 outRouteCoordinate:v5 outRouteCoordinate:v4 - 96];
      return 1;
    case 5:
      unint64_t v32 = 0xAAAAAAAAAAAAAAABLL * v9;
      if (v8 >= -95)
      {
        __n128 v33 = &a1[(v32 + 1) / 0x2A];
        uint64_t v34 = *v33 + 96 * ((v32 + 1) % 0x2A);
        unint64_t v35 = v32 + 2;
LABEL_32:
        long long v43 = &a1[v35 / 0x2A];
        uint64_t v44 = *v43 + 96 * (v35 % 0x2A);
        unint64_t v45 = v32 + 3;
LABEL_33:
        long long v46 = &a1[v45 / 0x2A];
        uint64_t v47 = *v46 + 96 * (v45 % 0x2A);
        goto LABEL_34;
      }
      unint64_t v42 = (40 - v32) / 0x2A;
      __n128 v33 = &a1[-v42];
      uint64_t v34 = *v33 + 96 * (v32 - 40 + 42 * v42) + 3936;
      if ((unint64_t)v8 >= 0xFFFFFFFFFFFFFF41)
      {
        unint64_t v35 = 1;
        goto LABEL_32;
      }
      unint64_t v108 = (39 - v32) / 0x2A;
      long long v43 = &a1[-v108];
      uint64_t v44 = *v43 + 96 * (v32 - 39 + 42 * v108) + 3936;
      if ((unint64_t)v8 >= 0xFFFFFFFFFFFFFEE1)
      {
        unint64_t v45 = 1;
        goto LABEL_33;
      }
      unint64_t v110 = 38 - v32;
      long long v46 = &a1[-(v110 / 0x2A)];
      uint64_t v47 = *v46 + 96 * (42 * (v110 / 0x2A) - v110) + 3936;
LABEL_34:
      if (v7 == a4) {
        uint64_t v4 = *(void *)(v5 - 8) + 4032;
      }
      std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,[(MNRouteDivergenceFinder *)(uint64_t)a1 _findFirstConvergenceBetweenRoute:(uint64_t)v33 range:v34 andRoute:(uint64_t)v43 range:v44 outRouteCoordinate:(uint64_t)v46 outRouteCoordinate:v47];
      double v48 = *(double *)(v4 - 88);
      double v49 = *(double *)(v47 + 8);
      if (v48 < v49) {
        goto LABEL_37;
      }
      if (v48 > v49) {
        return 1;
      }
      BOOL v10 = 1;
      if (!*(unsigned char *)(v4 - 8) || *(unsigned char *)(v47 + 88)) {
        return v10;
      }
LABEL_37:
      long long v50 = (_OWORD *)(v4 - 96);
      long long v124 = *(_OWORD *)(v47 + 32);
      long long v130 = *(_OWORD *)(v47 + 48);
      *(_OWORD *)v136 = *(_OWORD *)(v47 + 64);
      *(_OWORD *)&v136[16] = *(_OWORD *)(v47 + 80);
      long long v112 = *(_OWORD *)v47;
      long long v118 = *(_OWORD *)(v47 + 16);
      long long v51 = *(_OWORD *)(v4 - 80);
      *(_OWORD *)uint64_t v47 = *(_OWORD *)(v4 - 96);
      *(_OWORD *)(v47 + 16) = v51;
      long long v53 = *(_OWORD *)(v4 - 48);
      long long v52 = *(_OWORD *)(v4 - 32);
      long long v54 = *(_OWORD *)(v4 - 64);
      *(_OWORD *)(v47 + 74) = *(_OWORD *)(v4 - 22);
      *(_OWORD *)(v47 + 4_Block_object_dispose(&STACK[0x1160], 8) = v53;
      *(_OWORD *)(v47 + 64) = v52;
      *(_OWORD *)(v47 + 32) = v54;
      v50[4] = *(_OWORD *)v136;
      *(_OWORD *)((char *)v50 + 74) = *(_OWORD *)&v136[10];
      v50[2] = v124;
      v50[3] = v130;
      *long long v50 = v112;
      v50[1] = v118;
      double v55 = *(double *)(v47 + 8);
      double v56 = *(double *)(v44 + 8);
      if (v55 >= v56)
      {
        if (v55 > v56) {
          return 1;
        }
        if (!*(unsigned char *)(v47 + 88) || *(unsigned char *)(v44 + 88) != 0) {
          return 1;
        }
      }
      long long v113 = *(_OWORD *)v44;
      long long v119 = *(_OWORD *)(v44 + 16);
      *(_OWORD *)v137 = *(_OWORD *)(v44 + 64);
      *(_OWORD *)&v137[16] = *(_OWORD *)(v44 + 80);
      long long v125 = *(_OWORD *)(v44 + 32);
      long long v131 = *(_OWORD *)(v44 + 48);
      long long v59 = *(_OWORD *)(v47 + 48);
      long long v58 = *(_OWORD *)(v47 + 64);
      long long v60 = *(_OWORD *)(v47 + 32);
      *(_OWORD *)(v44 + 74) = *(_OWORD *)(v47 + 74);
      *(_OWORD *)(v44 + 4_Block_object_dispose(&STACK[0x1160], 8) = v59;
      *(_OWORD *)(v44 + 64) = v58;
      *(_OWORD *)(v44 + 32) = v60;
      long long v61 = *(_OWORD *)(v47 + 16);
      *(_OWORD *)uint64_t v44 = *(_OWORD *)v47;
      *(_OWORD *)(v44 + 16) = v61;
      *(_OWORD *)(v47 + 32) = v125;
      *(_OWORD *)(v47 + 4_Block_object_dispose(&STACK[0x1160], 8) = v131;
      *(_OWORD *)(v47 + 64) = *(_OWORD *)v137;
      *(_OWORD *)(v47 + 74) = *(_OWORD *)&v137[10];
      *(_OWORD *)uint64_t v47 = v113;
      *(_OWORD *)(v47 + 16) = v119;
      double v62 = *(double *)(v44 + 8);
      double v63 = *(double *)(v34 + 8);
      if (v62 < v63) {
        goto LABEL_45;
      }
      if (v62 > v63) {
        return 1;
      }
      BOOL v10 = 1;
      if (!*(unsigned char *)(v44 + 88) || *(unsigned char *)(v34 + 88)) {
        return v10;
      }
LABEL_45:
      long long v114 = *(_OWORD *)v34;
      long long v120 = *(_OWORD *)(v34 + 16);
      *(_OWORD *)v138 = *(_OWORD *)(v34 + 64);
      *(_OWORD *)&v138[16] = *(_OWORD *)(v34 + 80);
      long long v126 = *(_OWORD *)(v34 + 32);
      long long v132 = *(_OWORD *)(v34 + 48);
      long long v65 = *(_OWORD *)(v44 + 48);
      long long v64 = *(_OWORD *)(v44 + 64);
      long long v66 = *(_OWORD *)(v44 + 32);
      *(_OWORD *)(v34 + 74) = *(_OWORD *)(v44 + 74);
      *(_OWORD *)(v34 + 4_Block_object_dispose(&STACK[0x1160], 8) = v65;
      *(_OWORD *)(v34 + 64) = v64;
      *(_OWORD *)(v34 + 32) = v66;
      long long v67 = *(_OWORD *)(v44 + 16);
      *(_OWORD *)uint64_t v34 = *(_OWORD *)v44;
      *(_OWORD *)(v34 + 16) = v67;
      *(_OWORD *)uint64_t v44 = v114;
      *(_OWORD *)(v44 + 16) = v120;
      *(_OWORD *)(v44 + 74) = *(_OWORD *)&v138[10];
      *(_OWORD *)(v44 + 4_Block_object_dispose(&STACK[0x1160], 8) = v132;
      *(_OWORD *)(v44 + 64) = *(_OWORD *)v138;
      *(_OWORD *)(v44 + 32) = v126;
      double v68 = *(double *)(v34 + 8);
      double v69 = *(double *)(a2 + 8);
      if (v68 < v69) {
        goto LABEL_46;
      }
      if (v68 > v69) {
        return 1;
      }
      BOOL v10 = 1;
      if (!*(unsigned char *)(v34 + 88) || *(unsigned char *)(a2 + 88)) {
        return v10;
      }
LABEL_46:
      long long v127 = *(_OWORD *)(a2 + 32);
      long long v133 = *(_OWORD *)(a2 + 48);
      *(_OWORD *)v139 = *(_OWORD *)(a2 + 64);
      *(_OWORD *)&v139[16] = *(_OWORD *)(a2 + 80);
      long long v115 = *(_OWORD *)a2;
      long long v121 = *(_OWORD *)(a2 + 16);
      long long v70 = *(_OWORD *)(v34 + 16);
      *(_OWORD *)a2 = *(_OWORD *)v34;
      *(_OWORD *)(a2 + 16) = v70;
      long long v72 = *(_OWORD *)(v34 + 48);
      long long v71 = *(_OWORD *)(v34 + 64);
      long long v73 = *(_OWORD *)(v34 + 32);
      *(_OWORD *)(a2 + 74) = *(_OWORD *)(v34 + 74);
      *(_OWORD *)(a2 + 4_Block_object_dispose(&STACK[0x1160], 8) = v72;
      *(_OWORD *)(a2 + 64) = v71;
      *(_OWORD *)(a2 + 32) = v73;
      *(_OWORD *)uint64_t v34 = v115;
      *(_OWORD *)(v34 + 16) = v121;
      *(_OWORD *)(v34 + 74) = *(_OWORD *)&v139[10];
      *(_OWORD *)(v34 + 4_Block_object_dispose(&STACK[0x1160], 8) = v133;
      *(_OWORD *)(v34 + 64) = *(_OWORD *)v139;
      *(_OWORD *)(v34 + 32) = v127;
      return 1;
    default:
      uint64_t v18 = v8 >> 5;
      if (v8 <= -192)
      {
        unint64_t v36 = (39 - v18) / 0x2AuLL;
        double v19 = &a1[-v36];
        uint64_t v20 = *v19 + 96 * (v18 - 39 + 42 * v36) + 3936;
        unint64_t v23 = 40 - v18;
      }
      else
      {
        double v19 = &a1[(v18 + 2) / 0x2AuLL];
        uint64_t v20 = *v19 + 96 * ((v18 + 2) % 0x2AuLL);
        BOOL v21 = __CFADD__(v18, 1);
        unint64_t v22 = v18 + 1;
        if (!v21)
        {
          v74 = &a1[v22 / 0x2A];
          uint64_t v75 = *v74 + 96 * (v22 % 0x2A);
          goto LABEL_51;
        }
        unint64_t v23 = 41;
      }
      v74 = &a1[-(v23 / 0x2A)];
      uint64_t v75 = *v74 + 96 * (42 * (v23 / 0x2A) - v23) + 3936;
LABEL_51:
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[MNRouteDivergenceFinder _findFirstConvergenceBetweenRoute:range:andRoute:range:outRouteCoordinate:outRouteCoordinate:]::$_3 &,std::__deque_iterator<_MNRouteConvergencePoint,_MNRouteConvergencePoint*,_MNRouteConvergencePoint&,_MNRouteConvergencePoint**,long,42l>>((uint64_t)a1, a2, (uint64_t)v74, v75, (uint64_t)v19, v20);
      uint64_t v76 = v20 - *v19;
      unint64_t v77 = 0xAAAAAAAAAAAAAAABLL * (v76 >> 5);
      if (v76 < -95)
      {
        unint64_t v82 = 40 - v77;
        v79 = &v19[-(v82 / 0x2A)];
        unint64_t v80 = *v79;
        unint64_t v81 = *v79 + 96 * (42 * (v82 / 0x2A) - v82) + 3936;
      }
      else
      {
        unint64_t v78 = v77 + 1;
        v79 = &v19[v78 / 0x2A];
        unint64_t v80 = *v79;
        unint64_t v81 = *v79 + 96 * (v78 % 0x2A);
      }
      if (v81 == v4) {
        return 1;
      }
      int v83 = 0;
      while (2)
      {
        unint64_t v84 = v81;
        uint64_t v85 = v79;
        double v86 = *(double *)(v81 + 8);
        double v87 = *(double *)(v20 + 8);
        if (v86 >= v87)
        {
          if (v86 > v87 || (*(unsigned char *)(v81 + 88) ? (BOOL v89 = *(unsigned char *)(v20 + 88) == 0) : (BOOL v89 = 0), !v89))
          {
LABEL_77:
            unint64_t v81 = v84 + 96;
            v79 = v85;
            if (v84 + 96 - v80 == 4032)
            {
              v79 = v85 + 1;
              unint64_t v80 = v85[1];
              unint64_t v81 = v80;
            }
            double v19 = v85;
            uint64_t v20 = v84;
            if (v81 == v4) {
              return 1;
            }
            continue;
          }
          int v88 = 1;
        }
        else
        {
          int v88 = *(unsigned __int8 *)(v81 + 88);
        }
        break;
      }
      uint64_t v90 = *(void *)v81;
      uint64_t v140 = *(void *)(v81 + 80);
      long long v128 = *(_OWORD *)(v81 + 48);
      long long v134 = *(_OWORD *)(v81 + 64);
      long long v122 = *(_OWORD *)(v81 + 32);
      long long v116 = *(_OWORD *)(v81 + 16);
      char v91 = *(unsigned char *)(v81 + 89);
      long long v92 = *(_OWORD *)(v20 + 74);
      long long v94 = *(_OWORD *)(v20 + 48);
      long long v93 = *(_OWORD *)(v20 + 64);
      *(_OWORD *)(v81 + 32) = *(_OWORD *)(v20 + 32);
      *(_OWORD *)(v81 + 4_Block_object_dispose(&STACK[0x1160], 8) = v94;
      *(_OWORD *)(v81 + 64) = v93;
      *(_OWORD *)(v81 + 74) = v92;
      long long v95 = *(_OWORD *)(v20 + 16);
      *(_OWORD *)unint64_t v81 = *(_OWORD *)v20;
      *(_OWORD *)(v81 + 16) = v95;
      if (v20 == a2)
      {
LABEL_74:
        uint64_t v20 = a2;
      }
      else
      {
        while (1)
        {
          if (v20 == *v19)
          {
            uint64_t v97 = *--v19;
            uint64_t v96 = v97 + 4032;
          }
          else
          {
            uint64_t v96 = v20;
          }
          double v98 = *(double *)(v96 - 88);
          if (v86 >= v98 && (v86 > v98 || !v88 || *(unsigned char *)(v96 - 8))) {
            break;
          }
          long long v100 = *(_OWORD *)(v96 - 96);
          long long v101 = *(_OWORD *)(v96 - 80);
          unint64_t v99 = (_OWORD *)(v96 - 96);
          *(_OWORD *)uint64_t v20 = v100;
          *(_OWORD *)(v20 + 16) = v101;
          long long v102 = v99[2];
          long long v103 = v99[3];
          long long v104 = v99[4];
          *(_OWORD *)(v20 + 74) = *(_OWORD *)((char *)v99 + 74);
          *(_OWORD *)(v20 + 4_Block_object_dispose(&STACK[0x1160], 8) = v103;
          *(_OWORD *)(v20 + 64) = v104;
          *(_OWORD *)(v20 + 32) = v102;
          uint64_t v20 = (uint64_t)v99;
          if (v99 == (_OWORD *)a2) {
            goto LABEL_74;
          }
        }
      }
      *(void *)uint64_t v20 = v90;
      *(double *)(v20 + _Block_object_dispose(&STACK[0x1160], 8) = v86;
      *(_OWORD *)(v20 + 4_Block_object_dispose(&STACK[0x1160], 8) = v128;
      *(_OWORD *)(v20 + 64) = v134;
      *(void *)(v20 + 80) = v140;
      *(_OWORD *)(v20 + 16) = v116;
      *(_OWORD *)(v20 + 32) = v122;
      *(unsigned char *)(v20 + 8_Block_object_dispose(&STACK[0x1160], 8) = v88;
      ++v83;
      *(unsigned char *)(v20 + 89) = v91;
      if (v83 != 8)
      {
        unint64_t v80 = *v85;
        goto LABEL_77;
      }
      unint64_t v109 = v84 + 96;
      if (v84 + 96 - *v85 == 4032) {
        unint64_t v109 = v85[1];
      }
      BOOL v10 = v109 == v4;
      break;
  }
  return v10;
}

void *std::__deque_iterator<_MNRouteConvergencePoint,_MNRouteConvergencePoint*,_MNRouteConvergencePoint&,_MNRouteConvergencePoint**,long,42l>::operator+=[abi:ne180100](void *result, uint64_t a2)
{
  if (a2)
  {
    double v2 = (void *)*result;
    unint64_t v3 = a2 - 0x5555555555555555 * ((uint64_t)(result[1] - *(void *)*result) >> 5);
    if ((uint64_t)v3 < 1)
    {
      unint64_t v5 = 41 - v3;
      uint64_t v6 = &v2[-(v5 / 0x2A)];
      *__n128 result = v6;
      unint64_t v4 = *v6 + 96 * (42 * (v5 / 0x2A) - v5) + 3936;
    }
    else
    {
      *__n128 result = &v2[v3 / 0x2A];
      unint64_t v4 = v2[v3 / 0x2A] + 96 * (v3 % 0x2A);
    }
    result[1] = v4;
  }
  return result;
}

__n128 std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,-[MNRouteDivergenceFinder _findFirstConvergenceBetweenRoute:range:andRoute:range:outRouteCoordinate:outRouteCoordinate:]::$_3 &,std::__deque_iterator<_MNRouteConvergencePoint,_MNRouteConvergencePoint*,_MNRouteConvergencePoint&,_MNRouteConvergencePoint**,long,42l>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[MNRouteDivergenceFinder _findFirstConvergenceBetweenRoute:range:andRoute:range:outRouteCoordinate:outRouteCoordinate:]::$_3 &,std::__deque_iterator<_MNRouteConvergencePoint,_MNRouteConvergencePoint*,_MNRouteConvergencePoint&,_MNRouteConvergencePoint**,long,42l>>(a1, a2, a3, a4, a5, a6);
  result.n128_u64[0] = *(void *)(a8 + 8);
  double v13 = *(double *)(a6 + 8);
  if (result.n128_f64[0] < v13 || result.n128_f64[0] <= v13 && *(unsigned char *)(a8 + 88) && !*(unsigned char *)(a6 + 88))
  {
    long long v34 = *(_OWORD *)(a6 + 32);
    long long v37 = *(_OWORD *)(a6 + 48);
    *(_OWORD *)long long v40 = *(_OWORD *)(a6 + 64);
    *(_OWORD *)&v40[16] = *(_OWORD *)(a6 + 80);
    long long v28 = *(_OWORD *)a6;
    long long v31 = *(_OWORD *)(a6 + 16);
    long long v14 = *(_OWORD *)(a8 + 16);
    *(_OWORD *)a6 = *(_OWORD *)a8;
    *(_OWORD *)(a6 + 16) = v14;
    long long v16 = *(_OWORD *)(a8 + 48);
    long long v15 = *(_OWORD *)(a8 + 64);
    long long v17 = *(_OWORD *)(a8 + 32);
    *(_OWORD *)(a6 + 74) = *(_OWORD *)(a8 + 74);
    *(_OWORD *)(a6 + 4_Block_object_dispose(&STACK[0x1160], 8) = v16;
    *(_OWORD *)(a6 + 64) = v15;
    *(_OWORD *)(a6 + 32) = v17;
    *(_OWORD *)(a8 + 64) = *(_OWORD *)v40;
    *(_OWORD *)(a8 + 74) = *(_OWORD *)&v40[10];
    *(_OWORD *)(a8 + 32) = v34;
    *(_OWORD *)(a8 + 4_Block_object_dispose(&STACK[0x1160], 8) = v37;
    result.n128_u64[1] = *((void *)&v28 + 1);
    *(_OWORD *)a8 = v28;
    *(_OWORD *)(a8 + 16) = v31;
    result.n128_u64[0] = *(void *)(a6 + 8);
    double v18 = *(double *)(a4 + 8);
    if (result.n128_f64[0] < v18 || result.n128_f64[0] <= v18 && *(unsigned char *)(a6 + 88) && !*(unsigned char *)(a4 + 88))
    {
      long long v35 = *(_OWORD *)(a4 + 32);
      long long v38 = *(_OWORD *)(a4 + 48);
      *(_OWORD *)uint64_t v41 = *(_OWORD *)(a4 + 64);
      *(_OWORD *)&v41[16] = *(_OWORD *)(a4 + 80);
      long long v29 = *(_OWORD *)a4;
      long long v32 = *(_OWORD *)(a4 + 16);
      long long v19 = *(_OWORD *)(a6 + 16);
      *(_OWORD *)a4 = *(_OWORD *)a6;
      *(_OWORD *)(a4 + 16) = v19;
      long long v21 = *(_OWORD *)(a6 + 48);
      long long v20 = *(_OWORD *)(a6 + 64);
      long long v22 = *(_OWORD *)(a6 + 32);
      *(_OWORD *)(a4 + 74) = *(_OWORD *)(a6 + 74);
      *(_OWORD *)(a4 + 4_Block_object_dispose(&STACK[0x1160], 8) = v21;
      *(_OWORD *)(a4 + 64) = v20;
      *(_OWORD *)(a4 + 32) = v22;
      *(_OWORD *)(a6 + 64) = *(_OWORD *)v41;
      *(_OWORD *)(a6 + 74) = *(_OWORD *)&v41[10];
      *(_OWORD *)(a6 + 32) = v35;
      *(_OWORD *)(a6 + 4_Block_object_dispose(&STACK[0x1160], 8) = v38;
      result.n128_u64[1] = *((void *)&v29 + 1);
      *(_OWORD *)a6 = v29;
      *(_OWORD *)(a6 + 16) = v32;
      result.n128_u64[0] = *(void *)(a4 + 8);
      double v23 = *(double *)(a2 + 8);
      if (result.n128_f64[0] < v23 || result.n128_f64[0] <= v23 && *(unsigned char *)(a4 + 88) && !*(unsigned char *)(a2 + 88))
      {
        long long v36 = *(_OWORD *)(a2 + 32);
        long long v39 = *(_OWORD *)(a2 + 48);
        *(_OWORD *)unint64_t v42 = *(_OWORD *)(a2 + 64);
        *(_OWORD *)&v42[16] = *(_OWORD *)(a2 + 80);
        __n128 v30 = *(__n128 *)a2;
        long long v33 = *(_OWORD *)(a2 + 16);
        long long v24 = *(_OWORD *)(a4 + 16);
        *(_OWORD *)a2 = *(_OWORD *)a4;
        *(_OWORD *)(a2 + 16) = v24;
        long long v26 = *(_OWORD *)(a4 + 48);
        long long v25 = *(_OWORD *)(a4 + 64);
        long long v27 = *(_OWORD *)(a4 + 32);
        *(_OWORD *)(a2 + 74) = *(_OWORD *)(a4 + 74);
        *(_OWORD *)(a2 + 4_Block_object_dispose(&STACK[0x1160], 8) = v26;
        *(_OWORD *)(a2 + 64) = v25;
        *(_OWORD *)(a2 + 32) = v27;
        *(_OWORD *)(a4 + 64) = *(_OWORD *)v42;
        *(_OWORD *)(a4 + 74) = *(_OWORD *)&v42[10];
        *(_OWORD *)(a4 + 32) = v36;
        *(_OWORD *)(a4 + 4_Block_object_dispose(&STACK[0x1160], 8) = v39;
        __n128 result = v30;
        *(__n128 *)a4 = v30;
        *(_OWORD *)(a4 + 16) = v33;
      }
    }
  }
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<_MNRouteConvergencePoint *>>(unint64_t a1)
{
  if (a1 >> 61) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(8 * a1);
}

void MNDisplayETAAndRemainingMinutes(void *a1, void *a2, double a3)
{
  uint64_t v6 = [MEMORY[0x1E4F1C9C8] date];
  if (v6)
  {
    double v12 = v6;
    uint64_t v7 = objc_msgSend(v6, "dateByAddingTimeInterval:", fmax(a3, 60.0));
    uint64_t v8 = v7;
    if (a1) {
      *a1 = v7;
    }
    if (a2)
    {
      [v12 timeIntervalSinceReferenceDate];
      double v10 = floor(v9 / 60.0);
      [v8 timeIntervalSinceReferenceDate];
      *a2 = (unint64_t)(floor(v11 / 60.0) - v10);
    }

    uint64_t v6 = v12;
  }
  else
  {
    if (a1) {
      *a1 = 0;
    }
    if (a2) {
      *a2 = 0;
    }
  }
}

void sub_1B54D7C5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__11(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__11(uint64_t a1)
{
}

BOOL MNTransportTypeSupportsTurnByTurn(int a1)
{
  return (a1 & 0xFFFFFFFD) == 0 || a1 == 3;
}

uint64_t ____scheduleDebugConfigKeyReset_block_invoke()
{
  return _GEOConfigRemoveValue();
}

id GetAudioLogForMNAudioSystemEventQueueCategory()
{
  if (qword_1EB59C200 != -1) {
    dispatch_once(&qword_1EB59C200, &__block_literal_global_32);
  }
  os_log_t v0 = (void *)_MergedGlobals_37;
  return v0;
}

uint64_t __Block_byref_object_copy__12(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__12(uint64_t a1)
{
}

uint64_t __GetAudioLogForMNAudioSystemEventQueueCategory_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.Navigation.Audio", "MNAudioSystemEventQueue");
  uint64_t v1 = _MergedGlobals_37;
  _MergedGlobals_37 = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

BOOL _navigation_GEOLatLngIsNilOrZero(void *a1)
{
  id v1 = a1;
  double v2 = v1;
  if (v1)
  {
    [v1 lat];
    if (v3 == 0.0)
    {
      [v2 lng];
      BOOL v5 = v4 == 0.0;
    }
    else
    {
      BOOL v5 = 0;
    }
  }
  else
  {
    BOOL v5 = 1;
  }

  return v5;
}

id _regionsFromLatLngs(void *a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  if ([v1 count])
  {
    GEOConfigGetDouble();
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = ___regionsFromLatLngs_block_invoke;
    v16[3] = &__block_descriptor_40_e33___GEOMapRegion_16__0__GEOLatLng_8l;
    v16[4] = v2;
    double v3 = (void (**)(void, void))MEMORY[0x1BA99B3A0](v16);
    double v4 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:2];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v5 = v1;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          double v10 = v3[2](v3, *(void *)(*((void *)&v12 + 1) + 8 * i));
          objc_msgSend(v4, "addObject:", v10, (void)v12);
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v17 count:16];
      }
      while (v7);
    }
  }
  else
  {
    double v4 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v4;
}

id ___regionsFromLatLngs_block_invoke(uint64_t a1, void *a2)
{
  [a2 coordinate];
  GEOMapRectMakeWithRadialDistance();
  uint64_t v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F64700]), "initWithMapRect:", v2, v3, v4, v5);
  return v6;
}

void sub_1B54E19E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__13(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__13(uint64_t a1)
{
}

void sub_1B54E1B10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B54E28E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B54E7358(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B54E7834(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_1B54E83B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id GetAudioLogForMNAudioSessionResourceAccessCategory()
{
  if (qword_1EB59C270 != -1) {
    dispatch_once(&qword_1EB59C270, &__block_literal_global_40);
  }
  os_log_t v0 = (void *)_MergedGlobals_41;
  return v0;
}

uint64_t __GetAudioLogForMNAudioSessionResourceAccessCategory_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.Navigation.Audio", "MNAudioSessionResourceAccess");
  uint64_t v1 = _MergedGlobals_41;
  _MergedGlobals_41 = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

id GetAudioLogForMNSpeechResourceControllerCategory()
{
  if (qword_1EB59C280 != -1) {
    dispatch_once(&qword_1EB59C280, &__block_literal_global_41);
  }
  os_log_t v0 = (void *)_MergedGlobals_42;
  return v0;
}

void sub_1B54EDEF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location,id a24,char a25)
{
  objc_destroyWeak(v26);
  objc_destroyWeak(v25);
  _Block_object_dispose(&a25, 8);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a24);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__14(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__14(uint64_t a1)
{
}

void sub_1B54EE810(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,id location,id a30,char a31)
{
  objc_destroyWeak(v34);
  objc_destroyWeak(v33);
  _Block_object_dispose(&a31, 8);
  objc_destroyWeak(v32);
  objc_destroyWeak(v31);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a30);
  _Unwind_Resume(a1);
}

uint64_t __GetAudioLogForMNSpeechResourceControllerCategory_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.Navigation.Audio", "MNSpeechResourceController");
  uint64_t v1 = _MergedGlobals_42;
  _MergedGlobals_42 = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

id MNMap(void *a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  double v4 = a2;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = v3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = 0;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v6);
        }
        long long v12 = v4[2](v4, *(void *)(*((void *)&v15 + 1) + 8 * i), v9 + i);
        if (v12) {
          objc_msgSend(v5, "addObject:", v12, (void)v15);
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      v9 += i;
    }
    while (v8);
  }

  long long v13 = (void *)[v5 copy];
  return v13;
}

void sub_1B54F3358(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id location)
{
}

BOOL MNCurrentNavigationStateAllowsDoom()
{
  os_log_t v0 = +[MNNavigationStateManager sharedManager];
  uint64_t v1 = [v0 currentStateType];

  return (unint64_t)(v1 - 7) < 0xFFFFFFFFFFFFFFFCLL;
}

void sub_1B54F7A58(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1B54F7C88(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1B54F7E30(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_1B54F7F40(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_1B54F8050(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_1B54F8160(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_1B54F8270(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_1B54F8380(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_1B54F8490(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_1B54F85A0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_1B54F86B0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_1B54F87EC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_1B54F8930(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_1B54F8A60(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_1B54FB320(_Unwind_Exception *a1)
{
}

uint64_t __Block_byref_object_copy__15(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__15(uint64_t a1)
{
}

void sub_1B54FBB68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B54FC188(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

id navDisplayAddressForMapItem(void *a1, _DWORD *a2)
{
  id v3 = [a1 addressObject];
  double v4 = [v3 shortAddress];

  if (a2) {
    *a2 = 2;
  }
  return v4;
}

id navDisplayNameForMapItem(void *a1, int a2, _DWORD *a3)
{
  id v5 = a1;
  id v6 = [v5 contactName];
  if (!a2) {
    goto LABEL_23;
  }
  int v7 = [v5 contactAddressType];
  if (v7 == 3)
  {
    if (a3) {
      *a3 = 3;
    }
    if ([v5 contactIsMe])
    {
      uint64_t v8 = @"MapsExtra_School";
      goto LABEL_17;
    }
    if ([v6 length])
    {
      uint64_t v10 = NSString;
      double v11 = @"MapsExtra_ContactSchool";
      goto LABEL_31;
    }
    goto LABEL_23;
  }
  if (v7 == 2)
  {
    if (a3) {
      *a3 = 3;
    }
    if ([v5 contactIsMe])
    {
      uint64_t v8 = @"MapsExtras_Work";
      goto LABEL_17;
    }
    if (v6)
    {
      if ([v6 length])
      {
        uint64_t v10 = NSString;
        double v11 = @"MapsExtras_ContactWork";
        goto LABEL_31;
      }
LABEL_24:
      if (a3) {
        *a3 = 3;
      }
      id v9 = v6;
      goto LABEL_27;
    }
LABEL_32:
    if ([v5 _hasTransit])
    {
      long long v13 = [v5 _transitInfo];
      long long v15 = [v13 displayName];
      uint64_t v16 = [v15 length];

      if (v16)
      {
        if (a3) {
          *a3 = 4;
        }
        id v14 = [v13 displayName];
        goto LABEL_44;
      }
    }
    long long v17 = [v5 name];
    long long v13 = v17;
    if (v17 && [v17 length])
    {
      if (a3) {
        *a3 = 4;
      }
      id v14 = v13;
    }
    else
    {
      navDisplayAddressForMapItem(v5, a3);
      id v14 = (id)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_44;
  }
  if (v7 != 1)
  {
LABEL_23:
    if (v6) {
      goto LABEL_24;
    }
    goto LABEL_32;
  }
  if (a3) {
    *a3 = 3;
  }
  if ([v5 contactIsMe])
  {
    uint64_t v8 = @"MapsExtras_Home";
LABEL_17:
    _MNLocalizedStringFromThisBundle(v8);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
LABEL_27:
    long long v12 = v9;
    goto LABEL_45;
  }
  if (!v6) {
    goto LABEL_32;
  }
  if (![v6 length]) {
    goto LABEL_24;
  }
  uint64_t v10 = NSString;
  double v11 = @"MapsExtras_ContactHome";
LABEL_31:
  long long v13 = _MNLocalizedStringFromThisBundle(v11);
  objc_msgSend(v10, "stringWithFormat:", v13, v6);
  id v14 = (id)objc_claimAutoreleasedReturnValue();
LABEL_44:
  long long v12 = v14;

LABEL_45:
  return v12;
}

uint64_t __CoreWiFiLibraryCore_block_invoke(uint64_t a1)
{
  uint64_t result = _sl_dlopen();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  CoreWiFiLibraryCore_frameworkLibrary = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void CoreWiFiLibrary()
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v2[0] = 0;
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v0 = CoreWiFiLibraryCore_frameworkLibrary;
  uint64_t v8 = CoreWiFiLibraryCore_frameworkLibrary;
  if (!CoreWiFiLibraryCore_frameworkLibrary)
  {
    v2[1] = (void *)MEMORY[0x1E4F143A8];
    v2[2] = (void *)3221225472;
    v2[3] = __CoreWiFiLibraryCore_block_invoke;
    v2[4] = &unk_1E60FB780;
    id v3 = &v5;
    double v4 = v2;
    long long v9 = xmmword_1E60FB758;
    long long v10 = *(_OWORD *)&off_1E60FB768;
    v6[3] = _sl_dlopen();
    CoreWiFiLibraryCore_frameworkLibrary = *(void *)(v3[1] + 24);
    uint64_t v0 = v6[3];
  }
  _Block_object_dispose(&v5, 8);
  uint64_t v1 = v2[0];
  if (!v0)
  {
    uint64_t v1 = (void *)abort_report_np();
    __break(1u);
    goto LABEL_7;
  }
  if (v2[0]) {
LABEL_7:
  }
    free(v1);
}

void sub_1B54FCE84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getCWFInterfaceClass_block_invoke(uint64_t a1)
{
  CoreWiFiLibrary();
  Class result = objc_getClass("CWFInterface");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getCWFInterfaceClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = abort_report_np();
    return (Class)__CoreAutomationDeviceLibraryCore_block_invoke(v3);
  }
  return result;
}

uint64_t __CoreAutomationDeviceLibraryCore_block_invoke(uint64_t a1)
{
  uint64_t result = _sl_dlopen();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  CoreAutomationDeviceLibraryCore_frameworkLibrary = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void CoreAutomationDeviceLibrary()
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v2[0] = 0;
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v0 = CoreAutomationDeviceLibraryCore_frameworkLibrary;
  uint64_t v8 = CoreAutomationDeviceLibraryCore_frameworkLibrary;
  if (!CoreAutomationDeviceLibraryCore_frameworkLibrary)
  {
    v2[1] = (void *)MEMORY[0x1E4F143A8];
    v2[2] = (void *)3221225472;
    v2[3] = __CoreAutomationDeviceLibraryCore_block_invoke;
    v2[4] = &unk_1E60FB780;
    uint64_t v3 = &v5;
    double v4 = v2;
    long long v9 = xmmword_1E60FB7A0;
    long long v10 = *(_OWORD *)&off_1E60FB7B0;
    v6[3] = _sl_dlopen();
    CoreAutomationDeviceLibraryCore_frameworkLibrary = *(void *)(v3[1] + 24);
    uint64_t v0 = v6[3];
  }
  _Block_object_dispose(&v5, 8);
  uint64_t v1 = v2[0];
  if (!v0)
  {
    uint64_t v1 = (void *)abort_report_np();
    __break(1u);
    goto LABEL_7;
  }
  if (v2[0]) {
LABEL_7:
  }
    free(v1);
}

void sub_1B54FD0DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getCAMDEmbeddedDeviceServiceClass_block_invoke(uint64_t a1)
{
  CoreAutomationDeviceLibrary();
  Class result = objc_getClass("CAMDEmbeddedDeviceService");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    _MergedGlobals_43 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = abort_report_np();
    return (Class)__ConditionInducerLibraryCore_block_invoke(v3);
  }
  return result;
}

uint64_t __ConditionInducerLibraryCore_block_invoke(uint64_t a1)
{
  uint64_t result = _sl_dlopen();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  ConditionInducerLibraryCore_frameworkLibrary = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void ConditionInducerLibrary()
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v2[0] = 0;
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v0 = ConditionInducerLibraryCore_frameworkLibrary;
  uint64_t v8 = ConditionInducerLibraryCore_frameworkLibrary;
  if (!ConditionInducerLibraryCore_frameworkLibrary)
  {
    v2[1] = (void *)MEMORY[0x1E4F143A8];
    v2[2] = (void *)3221225472;
    v2[3] = __ConditionInducerLibraryCore_block_invoke;
    v2[4] = &unk_1E60FB780;
    uint64_t v3 = &v5;
    double v4 = v2;
    long long v9 = xmmword_1E60FB7C0;
    long long v10 = *(_OWORD *)&off_1E60FB7D0;
    v6[3] = _sl_dlopen();
    ConditionInducerLibraryCore_frameworkLibrary = *(void *)(v3[1] + 24);
    uint64_t v0 = v6[3];
  }
  _Block_object_dispose(&v5, 8);
  uint64_t v1 = v2[0];
  if (!v0)
  {
    uint64_t v1 = (void *)abort_report_np();
    __break(1u);
    goto LABEL_7;
  }
  if (v2[0]) {
LABEL_7:
  }
    free(v1);
}

void sub_1B54FD334(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getCOConditionSessionClass_block_invoke(uint64_t a1)
{
  ConditionInducerLibrary();
  Class result = objc_getClass("COConditionSession");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getCOConditionSessionClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = (void *)abort_report_np();
    return (Class)+[MNTraceNetworkConditionHelper getCurrentState];
  }
  return result;
}

void sub_1B54FD870(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B54FD97C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id errorFromCTError(uint64_t a1)
{
  v11[1] = *MEMORY[0x1E4F143B8];
  switch(a1)
  {
    case 0:
      SEL v4 = 0;
      goto LABEL_10;
    case 2:
      uint64_t v2 = (__CFString *)(id)*MEMORY[0x1E4F285A8];
      uint64_t v3 = mach_error_string(SHIDWORD(a1));
      break;
    case 1:
      uint64_t v2 = (__CFString *)(id)*MEMORY[0x1E4F28798];
      uint64_t v3 = strerror(SHIDWORD(a1));
      break;
    default:
      uint64_t v5 = "Unknown";
      uint64_t v2 = @"Unknown";
      goto LABEL_9;
  }
  uint64_t v5 = v3;
LABEL_9:
  id v6 = [NSString stringWithUTF8String:v5];
  uint64_t v7 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v10 = *MEMORY[0x1E4F28228];
  v11[0] = v6;
  uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
  SEL v4 = [v7 errorWithDomain:v2 code:a1 >> 32 userInfo:v8];

LABEL_10:
  return v4;
}

uint64_t ctConnection()
{
  uint64_t result = ctConnection_connection;
  if (!ctConnection_connection)
  {
    uint64_t result = _CTServerConnectionCreateOnTargetQueue();
    ctConnection_connection = result;
  }
  return result;
}

void sub_1B54FDF34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __ATKLoggerLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  qword_1EB59C290 = result;
  return result;
}

void sub_1B54FF0E0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B54FF19C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B5502044(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void sub_1B5502AA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B5502CCC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B5507028(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1B5507178(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1B5507334(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B550C0D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v10 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1B5518B0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B551C61C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__16(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__16(uint64_t a1)
{
}

void sub_1B551CEF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id GetAudioLogForMNAudioPathwayResourceAccessCategory()
{
  if (qword_1EB59C300 != -1) {
    dispatch_once(&qword_1EB59C300, &__block_literal_global_51);
  }
  uint64_t v0 = (void *)_MergedGlobals_50;
  return v0;
}

uint64_t __GetAudioLogForMNAudioPathwayResourceAccessCategory_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.Navigation.Audio", "MNAudioPathwayResourceAccess");
  uint64_t v1 = _MergedGlobals_50;
  _MergedGlobals_50 = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

void sub_1B5521AA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__17(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__17(uint64_t a1)
{
}

void sub_1B552473C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B5525BAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, id *location, uint64_t a11, uint64_t a12, id *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,id a56,char a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,char a63)
{
  objc_destroyWeak(v69);
  objc_destroyWeak(location);
  objc_destroyWeak(a13);
  objc_destroyWeak(&a56);
  _Block_object_dispose(&a57, 8);
  _Block_object_dispose(&a63, 8);
  _Block_object_dispose(&a69, 8);
  _Block_object_dispose((const void *)(v70 - 240), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__18(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__18(uint64_t a1)
{
}

void sub_1B5527E60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id GetAudioLogForMNAudioManagerCategory()
{
  if (qword_1EB59C320 != -1) {
    dispatch_once(&qword_1EB59C320, &__block_literal_global_53);
  }
  os_log_t v0 = (void *)_MergedGlobals_52;
  return v0;
}

uint64_t __GetAudioLogForMNAudioManagerCategory_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.Navigation.Audio", "MNAudioManager");
  uint64_t v1 = _MergedGlobals_52;
  _MergedGlobals_52 = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

void sub_1B552EE5C(_Unwind_Exception *a1)
{
}

void sub_1B552EEC4(_Unwind_Exception *a1)
{
}

void sub_1B552F0E8(_Unwind_Exception *a1)
{
}

void sub_1B552F1F4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1B552F598(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t __CoreRoutineLibraryCore_block_invoke(uint64_t a1)
{
  uint64_t result = _sl_dlopen();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  _MergedGlobals_54 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id getRTRoutineManagerClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  os_log_t v0 = (void *)qword_1EB59C340;
  uint64_t v7 = qword_1EB59C340;
  if (!qword_1EB59C340)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getRTRoutineManagerClass_block_invoke;
    v3[3] = &unk_1E60F7E88;
    v3[4] = &v4;
    __getRTRoutineManagerClass_block_invoke((uint64_t)v3);
    os_log_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1B553097C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getRTRoutineManagerClass_block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v5[0] = 0;
  uint64_t v8 = 0;
  long long v9 = &v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v2 = _MergedGlobals_54;
  uint64_t v11 = _MergedGlobals_54;
  if (!_MergedGlobals_54)
  {
    v5[1] = (void *)MEMORY[0x1E4F143A8];
    v5[2] = (void *)3221225472;
    v5[3] = __CoreRoutineLibraryCore_block_invoke;
    v5[4] = &unk_1E60FB780;
    uint64_t v6 = &v8;
    uint64_t v7 = v5;
    long long v12 = xmmword_1E60FC088;
    long long v13 = *(_OWORD *)&off_1E60FC098;
    v9[3] = _sl_dlopen();
    _MergedGlobals_54 = *(void *)(v6[1] + 24);
    uint64_t v2 = v9[3];
  }
  _Block_object_dispose(&v8, 8);
  uint64_t v3 = v5[0];
  if (v2)
  {
    if (!v5[0]) {
      goto LABEL_5;
    }
  }
  else
  {
    uint64_t v3 = (void *)abort_report_np();
    __break(1u);
  }
  free(v3);
LABEL_5:
  Class result = objc_getClass("RTRoutineManager");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    abort_report_np();
  }
  qword_1EB59C340 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1B5530B20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B5530D64(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 56));
  _Unwind_Resume(a1);
}

void sub_1B5531B5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t sub_1B5531DB0()
{
  return MEMORY[0x1F40E2E10]();
}

uint64_t sub_1B5531DC0()
{
  return MEMORY[0x1F40E37D0]();
}

uint64_t sub_1B5531DD0()
{
  return MEMORY[0x1F40E37E0]();
}

uint64_t sub_1B5531DE0()
{
  return MEMORY[0x1F40E3800]();
}

uint64_t sub_1B5531DF0()
{
  return MEMORY[0x1F40E3818]();
}

uint64_t sub_1B5531E00()
{
  return MEMORY[0x1F40E3830]();
}

uint64_t sub_1B5531E10()
{
  return MEMORY[0x1F40E3A90]();
}

uint64_t sub_1B5531E20()
{
  return MEMORY[0x1F40E3A98]();
}

uint64_t sub_1B5531E30()
{
  return MEMORY[0x1F40E3AC0]();
}

uint64_t sub_1B5531E40()
{
  return MEMORY[0x1F40E4540]();
}

uint64_t sub_1B5531E50()
{
  return MEMORY[0x1F40E4C80]();
}

uint64_t sub_1B5531E60()
{
  return MEMORY[0x1F40E4D48]();
}

uint64_t sub_1B5531E70()
{
  return MEMORY[0x1F40E4DA8]();
}

uint64_t sub_1B5531E80()
{
  return MEMORY[0x1F4188670]();
}

uint64_t sub_1B5531E90()
{
  return MEMORY[0x1F4188680]();
}

uint64_t sub_1B5531EA0()
{
  return MEMORY[0x1F41886A0]();
}

uint64_t sub_1B5531EB0()
{
  return MEMORY[0x1F40E6000]();
}

uint64_t sub_1B5531EC0()
{
  return MEMORY[0x1F4183730]();
}

uint64_t sub_1B5531ED0()
{
  return MEMORY[0x1F40E6190]();
}

uint64_t sub_1B5531EE0()
{
  return MEMORY[0x1F40E61D8]();
}

uint64_t sub_1B5531EF0()
{
  return MEMORY[0x1F41839B0]();
}

uint64_t sub_1B5531F00()
{
  return MEMORY[0x1F41839F0]();
}

uint64_t sub_1B5531F10()
{
  return MEMORY[0x1F4183A38]();
}

uint64_t sub_1B5531F20()
{
  return MEMORY[0x1F4183A60]();
}

uint64_t sub_1B5531F30()
{
  return MEMORY[0x1F4183A68]();
}

uint64_t sub_1B5531F40()
{
  return MEMORY[0x1F4183A80]();
}

uint64_t sub_1B5531F50()
{
  return MEMORY[0x1F40E6338]();
}

uint64_t sub_1B5531F60()
{
  return MEMORY[0x1F40E6370]();
}

uint64_t sub_1B5531F70()
{
  return MEMORY[0x1F41886E0]();
}

uint64_t sub_1B5531F80()
{
  return MEMORY[0x1F41886E8]();
}

uint64_t sub_1B5531F90()
{
  return MEMORY[0x1F4188700]();
}

uint64_t sub_1B5531FA0()
{
  return MEMORY[0x1F40E66C8]();
}

uint64_t sub_1B5531FB0()
{
  return MEMORY[0x1F40E66E8]();
}

uint64_t sub_1B5531FC0()
{
  return MEMORY[0x1F40E6858]();
}

uint64_t sub_1B5531FD0()
{
  return MEMORY[0x1F41874A8]();
}

uint64_t sub_1B5531FE0()
{
  return MEMORY[0x1F41874C0]();
}

uint64_t sub_1B5531FF0()
{
  return MEMORY[0x1F41847C0]();
}

uint64_t sub_1B5532000()
{
  return MEMORY[0x1F4184820]();
}

uint64_t sub_1B5532010()
{
  return MEMORY[0x1F4184978]();
}

uint64_t sub_1B5532020()
{
  return MEMORY[0x1F40E6DB8]();
}

uint64_t sub_1B5532030()
{
  return MEMORY[0x1F4184CE8]();
}

uint64_t sub_1B5532040()
{
  return MEMORY[0x1F4184CF0]();
}

uint64_t sub_1B5532050()
{
  return MEMORY[0x1F4184D80]();
}

uint64_t sub_1B5532060()
{
  return MEMORY[0x1F4184E68]();
}

uint64_t sub_1B5532070()
{
  return MEMORY[0x1F4185298]();
}

uint64_t sub_1B5532080()
{
  return MEMORY[0x1F41852A0]();
}

uint64_t sub_1B5532090()
{
  return MEMORY[0x1F4185350]();
}

uint64_t sub_1B55320A0()
{
  return MEMORY[0x1F4185368]();
}

uint64_t sub_1B55320B0()
{
  return MEMORY[0x1F4185370]();
}

uint64_t sub_1B55320C0()
{
  return MEMORY[0x1F4185380]();
}

uint64_t sub_1B55320D0()
{
  return MEMORY[0x1F4185398]();
}

uint64_t sub_1B55320E0()
{
  return MEMORY[0x1F4185758]();
}

uint64_t sub_1B55320F0()
{
  return MEMORY[0x1F4185A40]();
}

uint64_t sub_1B5532100()
{
  return MEMORY[0x1F4185DE0]();
}

uint64_t sub_1B5532110()
{
  return MEMORY[0x1F40E6E30]();
}

uint64_t sub_1B5532120()
{
  return MEMORY[0x1F4185E00]();
}

uint64_t sub_1B5532130()
{
  return MEMORY[0x1F4185E08]();
}

uint64_t sub_1B5532140()
{
  return MEMORY[0x1F4185E10]();
}

uint64_t sub_1B5532150()
{
  return MEMORY[0x1F4185E18]();
}

uint64_t sub_1B5532160()
{
  return MEMORY[0x1F4185E90]();
}

uint64_t sub_1B5532170()
{
  return MEMORY[0x1F4185EB0]();
}

uint64_t sub_1B5532180()
{
  return MEMORY[0x1F4185EF8]();
}

void AudioServicesPlaySystemSoundWithCompletion(SystemSoundID inSystemSoundID, void *inCompletionBlock)
{
}

uint64_t AudioServicesPlaySystemSoundWithOptions()
{
  return MEMORY[0x1F40D4E48]();
}

uint64_t AudioServicesStopSystemSound()
{
  return MEMORY[0x1F40D4E70]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x1F40D70A8]();
  return result;
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1F40D7420]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1F40D7430](BOOLean);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1F40D7B80](cf);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetLocalCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1F40D7D20]();
}

Boolean CFNumberIsFloatType(CFNumberRef number)
{
  return MEMORY[0x1F40D7E30](number);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x1F40D7E90](applicationID);
}

void CFRelease(CFTypeRef cf)
{
}

CFStringRef CFStringTokenizerCopyBestStringLanguage(CFStringRef string, CFRange range)
{
  return (CFStringRef)MEMORY[0x1F40D8688](string, range.location, range.length);
}

BOOL CLLocationCoordinate2DIsValid(CLLocationCoordinate2D coord)
{
  return MEMORY[0x1F40DB598]((__n128)coord, *(__n128 *)&coord.longitude);
}

CLLocationCoordinate2D CLLocationCoordinate2DMake(CLLocationDegrees latitude, CLLocationDegrees longitude)
{
  MEMORY[0x1F40DB5A0](latitude, longitude);
  result.longitude = v3;
  result.latitude = v2;
  return result;
}

uint64_t CLSetMapMatchingRouteHint()
{
  return MEMORY[0x1F40DB5B8]();
}

uint64_t GEOAngleDifferenceDegrees()
{
  return MEMORY[0x1F411C028]();
}

uint64_t GEOBearingFromCoordinateToCoordinate()
{
  return MEMORY[0x1F411C038]();
}

uint64_t GEOCalculateDistance()
{
  return MEMORY[0x1F411C040]();
}

uint64_t GEOClosestCoordinateOnLineSegmentFromCoordinate3D()
{
  return MEMORY[0x1F411C060]();
}

uint64_t GEOConfigGetBOOL()
{
  return MEMORY[0x1F411C078]();
}

uint64_t GEOConfigGetDate()
{
  return MEMORY[0x1F411C080]();
}

uint64_t GEOConfigGetDouble()
{
  return MEMORY[0x1F411C090]();
}

uint64_t GEOConfigGetInteger()
{
  return MEMORY[0x1F411C098]();
}

uint64_t GEOConfigGetPropertiesForKey()
{
  return MEMORY[0x1F411C0A0]();
}

uint64_t GEOConfigGetString()
{
  return MEMORY[0x1F411C0A8]();
}

uint64_t GEOConfigGetUInteger()
{
  return MEMORY[0x1F411C0B0]();
}

uint64_t GEOConfigRemoveBlockListener()
{
  return MEMORY[0x1F411C0C0]();
}

uint64_t GEOConfigRemoveDelegateListenerForAllKeys()
{
  return MEMORY[0x1F411C0C8]();
}

uint64_t GEOConfigSetArray()
{
  return MEMORY[0x1F411C0D0]();
}

uint64_t GEOConfigSetBOOL()
{
  return MEMORY[0x1F411C0D8]();
}

uint64_t GEOCoordinate2DForMapPoint()
{
  return MEMORY[0x1F411C100]();
}

uint64_t GEOCoordinateRegionForMapRect()
{
  return MEMORY[0x1F411C110]();
}

uint64_t GEOErrorDomain()
{
  return MEMORY[0x1F411C140]();
}

uint64_t GEOErrorReasonKey()
{
  return MEMORY[0x1F411C148]();
}

uint64_t GEOEvChargingConnectorTypeFromVGConnectorType()
{
  return MEMORY[0x1F4167960]();
}

uint64_t GEOFeatureGetLocalizedLabel()
{
  return MEMORY[0x1F411C150]();
}

uint64_t GEOFeatureGetLocalizedShield()
{
  return MEMORY[0x1F411C158]();
}

uint64_t GEOFeatureGetNativeLabel()
{
  return MEMORY[0x1F411C160]();
}

uint64_t GEOFindOrCreateLog()
{
  return MEMORY[0x1F411C170]();
}

uint64_t GEOMapPointForCoordinate()
{
  return MEMORY[0x1F411C1E8]();
}

uint64_t GEOMapPointsPerMeterAtLatitude()
{
  return MEMORY[0x1F411C1F0]();
}

uint64_t GEOMapRectForCoordinateRegion()
{
  return MEMORY[0x1F411C208]();
}

uint64_t GEOMapRectForGEOTileKey()
{
  return MEMORY[0x1F411C210]();
}

uint64_t GEOMapRectIntersectsRect()
{
  return MEMORY[0x1F411C228]();
}

uint64_t GEOMapRectMakeWithRadialDistance()
{
  return MEMORY[0x1F411C240]();
}

uint64_t GEOMapRectUnion()
{
  return MEMORY[0x1F411C248]();
}

uint64_t GEOMultiSectionFeaturePoints()
{
  return MEMORY[0x1F411C268]();
}

uint64_t GEOOfflineDeviceAsString()
{
  return MEMORY[0x1F411C2A0]();
}

uint64_t GEOOfflineModeAsString()
{
  return MEMORY[0x1F411C2A8]();
}

uint64_t GEOOfflineStateAsString()
{
  return MEMORY[0x1F411C2B0]();
}

uint64_t GEOPolylineCoordinateAsFullString()
{
  return MEMORY[0x1F411C2D8]();
}

uint64_t GEOPolylineCoordinateAsShortString()
{
  return MEMORY[0x1F411C2E0]();
}

uint64_t GEOPolylineCoordinateAsString()
{
  return MEMORY[0x1F411C2E8]();
}

uint64_t GEOPolylineCoordinateCompare()
{
  return MEMORY[0x1F411C2F0]();
}

uint64_t GEOPolylineCoordinateEqual()
{
  return MEMORY[0x1F411C2F8]();
}

uint64_t GEOPolylineCoordinateInRange()
{
  return MEMORY[0x1F411C308]();
}

uint64_t GEOPolylineCoordinateIsABeforeB()
{
  return MEMORY[0x1F411C310]();
}

uint64_t GEOPolylineCoordinateIsABeforeOrEqualToB()
{
  return MEMORY[0x1F411C318]();
}

uint64_t GEOPolylineCoordinateIsInvalid()
{
  return MEMORY[0x1F411C320]();
}

uint64_t GEOPolylineCoordinateIsValid()
{
  return MEMORY[0x1F411C328]();
}

uint64_t GEOPolylineCoordinateNearestIndex()
{
  return MEMORY[0x1F411C330]();
}

uint64_t GEOPolylineCoordinateRangeAsString()
{
  return MEMORY[0x1F411C338]();
}

uint64_t GEOPolylineCoordinateRangeEncompassesRange()
{
  return MEMORY[0x1F411C340]();
}

uint64_t GEOPolylineCoordinateRangeEqual()
{
  return MEMORY[0x1F411C348]();
}

uint64_t GEOPolylineCoordinateRangeIntersectsRange()
{
  return MEMORY[0x1F411C350]();
}

uint64_t GEOPolylineCoordinateRangeIsInvalid()
{
  return MEMORY[0x1F411C358]();
}

uint64_t GEOPolylineCoordinateRangeIsValid()
{
  return MEMORY[0x1F411C360]();
}

uint64_t GEOPolylineCoordinateWithinRange()
{
  return MEMORY[0x1F411C368]();
}

uint64_t GEORegisterPListStateCaptureLegacy()
{
  return MEMORY[0x1F411C770]();
}

uint64_t GEOResourcesPath()
{
  return MEMORY[0x1F411C390]();
}

uint64_t GEORoundedDistanceMeasurement()
{
  return MEMORY[0x1F411C3A0]();
}

uint64_t GEOServerFormatTokenEqual()
{
  return MEMORY[0x1F411C3B0]();
}

uint64_t GEOStringForDuration()
{
  return MEMORY[0x1F411C3C8]();
}

uint64_t GEOStringForError()
{
  return MEMORY[0x1F411C3D0]();
}

uint64_t GEOStringFromCoordinateRegionBounds()
{
  return MEMORY[0x1F411C3D8]();
}

uint64_t GEOTileKeyMake()
{
  return MEMORY[0x1F411C408]();
}

uint64_t GEOTileLoaderClientIdentifier()
{
  return MEMORY[0x1F411C418]();
}

uint64_t GEOTransitDepartureIsImminentDepartureTimeInterval()
{
  return MEMORY[0x1F411C420]();
}

uint64_t GEOUnregisterStateCaptureLegacy()
{
  return MEMORY[0x1F411C778]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1F417CDE0]();
}

uint64_t MapsFeature_IsEnabled_DrivingMultiWaypointRoutes()
{
  return MEMORY[0x1F411C490]();
}

void NSSetUncaughtExceptionHandler(NSUncaughtExceptionHandler *a1)
{
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1F40E72B0](aSelector);
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x1F40F7138](task, entitlement, error);
}

SecTaskRef SecTaskCreateFromSelf(CFAllocatorRef allocator)
{
  return (SecTaskRef)MEMORY[0x1F40F7160](allocator);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFPreferencesCopyValueWithContainer()
{
  return MEMORY[0x1F40D8F58]();
}

uint64_t _CFPreferencesSetValueWithContainer()
{
  return MEMORY[0x1F40D8FD0]();
}

uint64_t _CTServerConnectionCreateOnTargetQueue()
{
  return MEMORY[0x1F40DF0C8]();
}

uint64_t _CTServerConnectionGetCellularDataIsEnabled()
{
  return MEMORY[0x1F40DF128]();
}

uint64_t _CTServerConnectionSetCellularDataIsEnabled()
{
  return MEMORY[0x1F40DF200]();
}

uint64_t _GEOConfigAddBlockListenerForKey()
{
  return MEMORY[0x1F411C580]();
}

uint64_t _GEOConfigAddDelegateListenerForKey()
{
  return MEMORY[0x1F411C588]();
}

uint64_t _GEOConfigHasValue()
{
  return MEMORY[0x1F411C590]();
}

uint64_t _GEOConfigRemoveValue()
{
  return MEMORY[0x1F411C5A0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x1F417E448](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x1F417E530](this);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x1F417E588](__n);
}

void std::terminate(void)
{
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x1F417EF30](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x1F417EF48](a1);
}

void __cxa_free_exception(void *a1)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

int *__error(void)
{
  return (int *)MEMORY[0x1F40C9B88]();
}

double __exp10(double a1)
{
  MEMORY[0x1F40C9B90](a1);
  return result;
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x1F40C9C28]();
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x1F40C9CD8]();
}

uint64_t _geo_isolate_lock()
{
  return MEMORY[0x1F411C798]();
}

uint64_t _geo_isolate_lock_data()
{
  return MEMORY[0x1F411C7A0]();
}

uint64_t _geo_isolate_unlock()
{
  return MEMORY[0x1F411C7A8]();
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return (os_activity_t)MEMORY[0x1F40C9F70](dso, description, activity, *(void *)&flags);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1F415B160]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1F4186388]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x1F40CA1E8]();
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x1F40CA3C0](*(void *)&__upper_bound);
}

kern_return_t bootstrap_look_up(mach_port_t bp, const name_t service_name, mach_port_t *sp)
{
  return MEMORY[0x1F40CA548](*(void *)&bp, service_name, sp);
}

void bzero(void *a1, size_t a2)
{
}

uint64_t descriptionForLaneInfos()
{
  return MEMORY[0x1F411C680]();
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1F40CBA60](identifier, flags);
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1F40CBA88]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBAC0](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBA8](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1F40CBDB0]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1F40CBDC8](__handle, __symbol);
}

void exit(int a1)
{
}

long double fmod(long double __x, long double __y)
{
  MEMORY[0x1F40CC1A0](__x, __y);
  return result;
}

void free(void *a1)
{
}

int fsctl(const char *a1, unint64_t a2, void *a3, unsigned int a4)
{
  return MEMORY[0x1F40CC288](a1, a2, a3, *(void *)&a4);
}

uint64_t geo_dispatch_queue_create()
{
  return MEMORY[0x1F411C7D0]();
}

uint64_t geo_dispatch_queue_create_with_qos()
{
  return MEMORY[0x1F411C7E0]();
}

uint64_t geo_get_global_queue()
{
  return MEMORY[0x1F411C828]();
}

uint64_t geo_isolate_sync()
{
  return MEMORY[0x1F411C840]();
}

uint64_t geo_isolate_sync_data()
{
  return MEMORY[0x1F411C848]();
}

uint64_t geo_isolater_create()
{
  return MEMORY[0x1F411C850]();
}

void mach_error(const char *str, mach_error_t error_value)
{
}

char *__cdecl mach_error_string(mach_error_t error_value)
{
  return (char *)MEMORY[0x1F40CC940](*(void *)&error_value);
}

mach_msg_return_t mach_msg(mach_msg_header_t *msg, mach_msg_option_t option, mach_msg_size_t send_size, mach_msg_size_t rcv_size, mach_port_name_t rcv_name, mach_msg_timeout_t timeout, mach_port_name_t notify)
{
  return MEMORY[0x1F40CC970](msg, *(void *)&option, *(void *)&send_size, *(void *)&rcv_size, *(void *)&rcv_name, *(void *)&timeout, *(void *)&notify);
}

void mach_msg_destroy(mach_msg_header_t *a1)
{
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x1F40CC9B8](*(void *)&task, *(void *)&name);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1F40CCB10](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1F40CCB80](ptr);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB98](size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1F40CCCE8](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD10](__dst, __src, __len);
}

void mig_dealloc_reply_port(mach_port_t reply_port)
{
}

mach_port_t mig_get_reply_port(void)
{
  return MEMORY[0x1F40CCD70]();
}

void mig_put_reply_port(mach_port_t reply_port)
{
}

float modff(float a1, float *a2)
{
  MEMORY[0x1F40CCE50](a2, a1);
  return result;
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1F40CD028](*(void *)&token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1F40CD060](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1F4181640](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1F4181660](a1);
}

{
  MEMORY[0x1F4181668](context);
}

{
  return (void *)MEMORY[0x1F4181670]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
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

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x1F4181718](object, key);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1F4181728](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1F4181748](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1F4181758](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1F4181780](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F4181798](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1F41817B8]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1F41817C0]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1F41817C8]();
}

uint64_t self
{
  return MEMORY[0x1F41817D0]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1F41818B8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
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
  return (id)MEMORY[0x1F4181A18](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1F4181A28](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1F4181A30](obj);
}

void objc_terminate(void)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181A40](a1);
}

void os_activity_scope_enter(os_activity_t activity, os_activity_scope_state_t state)
{
}

void os_activity_scope_leave(os_activity_scope_state_t state)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1F40CD550](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x1F40CD558](log);
}

os_signpost_id_t os_signpost_id_make_with_pointer(os_log_t log, const void *ptr)
{
  return MEMORY[0x1F40CD560](log, ptr);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x1F40CD5A0]();
}

int proc_pidpath(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x1F40CD8B8](*(void *)&pid, buffer, *(void *)&buffersize);
}

objc_method_description *__cdecl protocol_copyMethodDescriptionList(Protocol *p, BOOL isRequiredMethod, BOOL isInstanceMethod, unsigned int *outCount)
{
  return (objc_method_description *)MEMORY[0x1F4181AE8](p, isRequiredMethod, isInstanceMethod, outCount);
}

objc_method_description protocol_getMethodDescription(Protocol *p, SEL aSel, BOOL isRequiredMethod, BOOL isInstanceMethod)
{
  uint64_t v4 = (const char *)MEMORY[0x1F4181B08](p, aSel, isRequiredMethod, isInstanceMethod);
  result.types = v5;
  result.name = v4;
  return result;
}

int puts(const char *a1)
{
  return MEMORY[0x1F40CDBB8](a1);
}

uint64_t sandbox_extension_consume()
{
  return MEMORY[0x1F40CDDF8]();
}

uint64_t sandbox_extension_issue_file()
{
  return MEMORY[0x1F40CDE00]();
}

uint64_t sandbox_extension_release()
{
  return MEMORY[0x1F40CDE50]();
}

int setxattr(const char *path, const char *name, const void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x1F40CDFD8](path, name, value, size, *(void *)&position, *(void *)&options);
}

int sqlite3_bind_blob(sqlite3_stmt *a1, int a2, const void *a3, int n, void (__cdecl *a5)(void *))
{
  return MEMORY[0x1F4181F90](a1, *(void *)&a2, a3, *(void *)&n, a5);
}

int sqlite3_bind_double(sqlite3_stmt *a1, int a2, double a3)
{
  return MEMORY[0x1F4181FA8](a1, *(void *)&a2, a3);
}

int sqlite3_bind_int(sqlite3_stmt *a1, int a2, int a3)
{
  return MEMORY[0x1F4181FB0](a1, *(void *)&a2, *(void *)&a3);
}

int sqlite3_bind_null(sqlite3_stmt *a1, int a2)
{
  return MEMORY[0x1F4181FC0](a1, *(void *)&a2);
}

int sqlite3_bind_parameter_index(sqlite3_stmt *a1, const char *zName)
{
  return MEMORY[0x1F4181FD0](a1, zName);
}

int sqlite3_bind_text(sqlite3_stmt *a1, int a2, const char *a3, int a4, void (__cdecl *a5)(void *))
{
  return MEMORY[0x1F4181FE8](a1, *(void *)&a2, a3, *(void *)&a4, a5);
}

int sqlite3_clear_bindings(sqlite3_stmt *a1)
{
  return MEMORY[0x1F4182058](a1);
}

int sqlite3_close(sqlite3 *a1)
{
  return MEMORY[0x1F4182060](a1);
}

const void *__cdecl sqlite3_column_blob(sqlite3_stmt *a1, int iCol)
{
  return (const void *)MEMORY[0x1F4182070](a1, *(void *)&iCol);
}

int sqlite3_column_bytes(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1F4182078](a1, *(void *)&iCol);
}

int sqlite3_column_count(sqlite3_stmt *pStmt)
{
  return MEMORY[0x1F4182088](pStmt);
}

double sqlite3_column_double(sqlite3_stmt *a1, int iCol)
{
  MEMORY[0x1F4182098](a1, *(void *)&iCol);
  return result;
}

int sqlite3_column_int(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1F41820A0](a1, *(void *)&iCol);
}

const char *__cdecl sqlite3_column_name(sqlite3_stmt *a1, int N)
{
  return (const char *)MEMORY[0x1F41820B0](a1, *(void *)&N);
}

const unsigned __int8 *__cdecl sqlite3_column_text(sqlite3_stmt *a1, int iCol)
{
  return (const unsigned __int8 *)MEMORY[0x1F41820C8](a1, *(void *)&iCol);
}

int sqlite3_column_type(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1F41820D8](a1, *(void *)&iCol);
}

int sqlite3_data_count(sqlite3_stmt *pStmt)
{
  return MEMORY[0x1F4182140](pStmt);
}

int sqlite3_db_config(sqlite3 *a1, int op, ...)
{
  return MEMORY[0x1F4182148](a1, *(void *)&op);
}

const char *__cdecl sqlite3_errmsg(sqlite3 *a1)
{
  return (const char *)MEMORY[0x1F4182198](a1);
}

const char *__cdecl sqlite3_errstr(int a1)
{
  return (const char *)MEMORY[0x1F41821A0](*(void *)&a1);
}

int sqlite3_exec(sqlite3 *a1, const char *sql, int (__cdecl *callback)(void *, int, char **, char **), void *a4, char **errmsg)
{
  return MEMORY[0x1F41821A8](a1, sql, callback, a4, errmsg);
}

char *__cdecl sqlite3_expanded_sql(sqlite3_stmt *pStmt)
{
  return (char *)MEMORY[0x1F41821B8](pStmt);
}

int sqlite3_finalize(sqlite3_stmt *pStmt)
{
  return MEMORY[0x1F41821D8](pStmt);
}

sqlite3_int64 sqlite3_last_insert_rowid(sqlite3 *a1)
{
  return MEMORY[0x1F4182230](a1);
}

int sqlite3_open_v2(const char *filename, sqlite3 **ppDb, int flags, const char *zVfs)
{
  return MEMORY[0x1F4182280](filename, ppDb, *(void *)&flags, zVfs);
}

int sqlite3_prepare_v2(sqlite3 *db, const char *zSql, int nByte, sqlite3_stmt **ppStmt, const char **pzTail)
{
  return MEMORY[0x1F4182290](db, zSql, *(void *)&nByte, ppStmt, pzTail);
}

int sqlite3_reset(sqlite3_stmt *pStmt)
{
  return MEMORY[0x1F41822C0](pStmt);
}

int sqlite3_step(sqlite3_stmt *a1)
{
  return MEMORY[0x1F41823B0](a1);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1F40CE188](*(void *)&__errnum);
}

uint64_t swift_allocError()
{
  return MEMORY[0x1F41863E0]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1F41863E8]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x1F4186410]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x1F4186418]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x1F4186430]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1F4186440]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x1F4186448]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1F4186450]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x1F4186458]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1F41864B8]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x1F41864E0]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x1F4186518]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x1F4186528]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x1F4186530]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x1F4186580]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1F41865A8]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x1F41865F8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1F4186608]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1F4186610]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1F4186668]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x1F4186670]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1F4186680]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1F4186700]();
}

uint64_t swift_once()
{
  return MEMORY[0x1F4186728]();
}

uint64_t swift_release()
{
  return MEMORY[0x1F4186758]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1F4186770]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1F4186798]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1F41867A0]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1F41867E0]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1F41867F0]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x1F4186840]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x1F4186858]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x1F4186860]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x1F4186868]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x1F41868E0]();
}

BOOLean_t voucher_mach_msg_set(mach_msg_header_t *msg)
{
  return MEMORY[0x1F40CE758](msg);
}