__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_2627181A4(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_2627181C4(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)result = (a2 - 1);
    *(void *)(result + 8) = 0;
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
  *(unsigned char *)(result + 16) = v3;
  return result;
}

void type metadata accessor for orc_rt_CWrapperFunctionResult(uint64_t a1)
{
}

void sub_262718200()
{
  qword_26A957088 = MEMORY[0x263EF86D8];
}

void sub_262718214()
{
  qword_26A957090 = MEMORY[0x263EF86F8];
}

void sub_262718228()
{
  qword_26A957098 = MEMORY[0x263EF8708];
}

void sub_26271823C()
{
  qword_26A9570A0 = MEMORY[0x263EF87A0];
}

void type metadata accessor for orc_rt_CWrapperFunctionResultDataUnion(uint64_t a1)
{
}

void sub_262718264(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t XOJITExecutor.JITDylibHandle.rawValue.getter()
{
  return *(void *)v0;
}

uint64_t XOJITExecutor.JITDylibHandle.rawValue.setter(uint64_t result)
{
  void *v1 = result;
  return result;
}

uint64_t (*XOJITExecutor.JITDylibHandle.rawValue.modify())()
{
  return nullsub_1;
}

BOOL static XOJITExecutor.JITDylibHandle.== infix(_:_:)(void *a1, void *a2)
{
  return *a1 == *a2;
}

BOOL static XOJITExecutor.TerminationResult.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t XOJITExecutor.TerminationResult.hash(into:)()
{
  return sub_262722CCC();
}

uint64_t XOJITExecutor.TerminationResult.hashValue.getter()
{
  return sub_262722CDC();
}

uint64_t sub_26271838C()
{
  return sub_262722CDC();
}

uint64_t sub_2627183D0()
{
  uint64_t v1 = OUTLINED_FUNCTION_6();
  return MEMORY[0x270FA0228](v1);
}

uint64_t sub_262718400()
{
  *(void *)(v0 + 16) = 0;
  *(void *)(v0 + 24) = 0;
  *(unsigned char *)(v0 + 32) = 1;
  *(void *)(v0 + 40) = dispatch_semaphore_create(0);
  return v0;
}

uint64_t sub_262718430()
{
  return v0;
}

uint64_t sub_262718458()
{
  sub_262718430();
  return MEMORY[0x270FA0228](v0);
}

uint64_t sub_26271848C()
{
  *(void *)(v0 + 16) = 0;
  *(void *)(v0 + 24) = 0;
  *(void *)(v0 + 32) = 0;
  *(unsigned char *)(v0 + 40) = 1;
  dispatch_semaphore_t v1 = dispatch_semaphore_create(0);
  *(void *)(v0 + 56) = 0;
  *(void *)(v0 + 64) = 0;
  *(void *)(v0 + 48) = v1;
  *(unsigned char *)(v0 + 72) = 1;
  *(void *)(v0 + 80) = dispatch_semaphore_create(0);
  return v0;
}

uint64_t sub_2627184DC()
{
  uint64_t v0 = sub_262722A9C();
  __swift_allocate_value_buffer(v0, qword_26A9570A8);
  __swift_project_value_buffer(v0, (uint64_t)qword_26A9570A8);
  return sub_262722A8C();
}

void XOJITExecutor.__allocating_init(connection:)(uint64_t a1)
{
}

void XOJITExecutor.init(connection:)(uint64_t a1)
{
  uint64_t v2 = v1;
  sub_262722BBC();
  OUTLINED_FUNCTION_0();
  uint64_t v4 = v3;
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_9();
  sub_262722BAC();
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_7();
  sub_262722AFC();
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_7();
  *(void *)(v1 + 16) = 0;
  sub_262718A3C();
  sub_262722AEC();
  sub_26271C038(&qword_26A956F78, MEMORY[0x263F8F0F8]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A956F80);
  sub_26271C080(&qword_26A956F88, &qword_26A956F80);
  sub_262722C3C();
  v5 = *(void (**)(void))(v4 + 104);
  OUTLINED_FUNCTION_11();
  v5();
  *(void *)(v1 + 24) = sub_262722BFC();
  sub_262722B9C();
  sub_262722AEC();
  OUTLINED_FUNCTION_11();
  v5();
  OUTLINED_FUNCTION_10();
  *(void *)(v1 + 32) = sub_262722BFC();
  *(void *)(v1 + 40) = dispatch_group_create();
  sub_262722AEC();
  sub_262722C3C();
  OUTLINED_FUNCTION_11();
  v5();
  OUTLINED_FUNCTION_10();
  *(void *)(v1 + 48) = sub_262722BFC();
  type metadata accessor for XOJITExecutor.ActiveRunWrapper();
  *(void *)(v1 + 56) = sub_262722B2C();
  *(void *)(v1 + 64) = 0;
  *(void *)(v1 + 72) = 0;
  *(void *)(v1 + 80) = 0;
  *(void *)(v1 + 88) = dispatch_semaphore_create(0);
  *(_WORD *)(v1 + 112) = 0;
  type metadata accessor for XOJITExecutor.ActiveRunProgram();
  uint64_t v6 = swift_allocObject();
  sub_26271848C();
  *(void *)(v2 + 120) = v6;
  *(void *)(v2 + 16) = a1;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  xojit_xpcmemmgr_create();
}

unint64_t sub_262718A3C()
{
  unint64_t result = qword_26A956F70;
  if (!qword_26A956F70)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26A956F70);
  }
  return result;
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

uint64_t type metadata accessor for XOJITExecutor.ActiveRunWrapper()
{
  return self;
}

uint64_t type metadata accessor for XOJITExecutor.ActiveRunProgram()
{
  return self;
}

_xpc_connection_s *sub_262718B54(void *a1)
{
  uint64_t v3 = MEMORY[0x263E51510]();
  if (qword_26A956EB0 != -1) {
    swift_once();
  }
  if (qword_26A957098 != v3)
  {
    char v13 = 2;
    return (_xpc_connection_s *)sub_26271947C(&v13);
  }
  swift_unknownObjectRetain();
  uint64_t v5 = sub_26271988C(6516847, 0xE300000000000000, a1);
  if ((v6 & 1) != 0 || v5 > 1)
  {
    uint64_t result = *(_xpc_connection_s **)(v1 + 16);
    if (result)
    {
      xpc_connection_cancel(result);
      char v12 = 1;
      v7 = &v12;
LABEL_9:
      sub_26271947C(v7);
      return (_xpc_connection_s *)swift_unknownObjectRelease();
    }
    __break(1u);
LABEL_21:
    __break(1u);
LABEL_22:
    __break(1u);
    return result;
  }
  if (v5)
  {
    sub_262719B5C(a1);
    if (v8)
    {
      swift_bridgeObjectRelease();
      uint64_t result = *(_xpc_connection_s **)(v1 + 16);
      if (result)
      {
        xpc_connection_cancel(result);
        char v11 = 1;
        v7 = &v11;
        goto LABEL_9;
      }
      goto LABEL_21;
    }
  }
  else
  {
    sub_262719960(a1);
    if (v9)
    {
      swift_bridgeObjectRelease();
      uint64_t result = *(_xpc_connection_s **)(v1 + 16);
      if (result)
      {
        xpc_connection_cancel(result);
        char v10 = 1;
        v7 = &v10;
        goto LABEL_9;
      }
      goto LABEL_22;
    }
  }
  return (_xpc_connection_s *)swift_unknownObjectRelease();
}

uint64_t sub_262718CC4(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  uint64_t v2 = swift_unknownObjectRetain();
  v1(v2);
  swift_release();
  return swift_unknownObjectRelease();
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

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t XOJITExecutor.deinit()
{
  if (*(void *)(v0 + 16))
  {
    uint64_t result = sub_262722C7C();
    __break(1u);
  }
  else
  {
    uint64_t v1 = *(std::mutex **)(v0 + 104);
    if (v1) {
      xojit_dylibmgr_destroy(v1);
    }
    uint64_t v2 = *(std::mutex **)(v0 + 96);
    if (v2) {
      xojit_xpcmemmgr_destroy(v2);
    }
    swift_unknownObjectRelease();

    swift_bridgeObjectRelease();
    sub_26271B908(*(void *)(v0 + 72));

    swift_release();
    return v0;
  }
  return result;
}

uint64_t XOJITExecutor.__deallocating_deinit()
{
  XOJITExecutor.deinit();
  return MEMORY[0x270FA0228](v0);
}

Swift::Void __swiftcall XOJITExecutor.disconnect()()
{
  uint64_t v1 = v0;
  if (qword_26A956EC0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_262722A9C();
  __swift_project_value_buffer(v2, (uint64_t)qword_26A9570A8);
  uint64_t v3 = sub_262722A7C();
  os_log_type_t v4 = sub_262722B6C();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)OUTLINED_FUNCTION_5();
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_262716000, v3, v4, "deleting executor -- cancelling connection", v5, 2u);
    OUTLINED_FUNCTION_1();
  }

  char v6 = *(_xpc_connection_s **)(v1 + 16);
  if (v6)
  {
    xpc_connection_cancel(v6);
    sub_262722B8C();
    *(void *)(v1 + 16) = 0;
    swift_unknownObjectRelease();
    oslog = sub_262722A7C();
    os_log_type_t v7 = sub_262722B6C();
    if (os_log_type_enabled(oslog, v7))
    {
      uint64_t v8 = (uint8_t *)OUTLINED_FUNCTION_5();
      *(_WORD *)uint64_t v8 = 0;
      _os_log_impl(&dword_262716000, oslog, v7, "deleting executor -- connection destroyed", v8, 2u);
      OUTLINED_FUNCTION_1();
    }
  }
  else
  {
    __break(1u);
  }
}

_xpc_connection_s *XOJITExecutor.start(terminationHandler:)(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = v2;
  uint64_t v4 = *(void *)(v2 + 80);
  if (*(void *)(v2 + 72))
  {
    uint64_t v33 = *(void *)(v2 + 72);
    uint64_t v34 = swift_allocObject();
    *(void *)(v34 + 16) = v33;
    *(void *)(v34 + 24) = v4;
    sub_26271B918(v33);
    uint64_t result = (_xpc_connection_s *)sub_26271B908((uint64_t)sub_26271B9AC);
    __break(1u);
LABEL_32:
    __break(1u);
    goto LABEL_33;
  }
  sub_26271B918(0);
  sub_26271B908(0);
  os_log_type_t v7 = (void *)swift_allocObject();
  v7[2] = a1;
  v7[3] = a2;
  v7[4] = v3;
  uint64_t v8 = *(void *)(v3 + 72);
  *(void *)(v3 + 72) = sub_26271B968;
  *(void *)(v3 + 80) = v7;
  swift_retain();
  swift_retain();
  sub_26271B908(v8);
  int is_sandboxed = xojit_executor_is_sandboxed();
  if (is_sandboxed)
  {
    if (is_sandboxed == -1)
    {
      char v35 = 3;
      char v10 = &v35;
      return (_xpc_connection_s *)sub_26271947C(v10);
    }
    char v11 = 1;
  }
  else
  {
    char v11 = 0;
  }
  *(unsigned char *)(v3 + 113) = v11;
  int v12 = xojit_executor_use_oopjit();
  if (v12)
  {
    if (v12 == -1)
    {
      char v36 = 3;
      char v10 = &v36;
      return (_xpc_connection_s *)sub_26271947C(v10);
    }
    char v13 = 1;
  }
  else
  {
    char v13 = 0;
  }
  *(unsigned char *)(v3 + 112) = v13;
  if (qword_26A956EC0 != -1) {
    swift_once();
  }
  uint64_t v14 = sub_262722A9C();
  __swift_project_value_buffer(v14, (uint64_t)qword_26A9570A8);
  swift_retain();
  v15 = sub_262722A7C();
  os_log_type_t v16 = sub_262722B6C();
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v17 = swift_slowAlloc();
    *(_DWORD *)uint64_t v17 = 67109376;
    int v38 = *(unsigned __int8 *)(v3 + 112);
    sub_262722C2C();
    *(_WORD *)(v17 + 8) = 1024;
    int v37 = *(unsigned __int8 *)(v3 + 113);
    sub_262722C2C();
    swift_release();
    _os_log_impl(&dword_262716000, v15, v16, "use OOP-JIT: %{BOOL}d, sandboxed: %{BOOL}d", (uint8_t *)v17, 0xEu);
    OUTLINED_FUNCTION_1();
  }
  else
  {

    swift_release();
  }
  v18 = sub_262722A7C();
  os_log_type_t v19 = sub_262722B6C();
  if (os_log_type_enabled(v18, v19))
  {
    v20 = (uint8_t *)OUTLINED_FUNCTION_5();
    *(_WORD *)v20 = 0;
    _os_log_impl(&dword_262716000, v18, v19, "starting executor", v20, 2u);
    OUTLINED_FUNCTION_1();
  }

  uint64_t result = *(_xpc_connection_s **)(v3 + 16);
  if (!result) {
    goto LABEL_32;
  }
  xpc_connection_resume(result);
  v22 = sub_262722A7C();
  os_log_type_t v23 = sub_262722B6C();
  if (os_log_type_enabled(v22, v23))
  {
    *(_WORD *)OUTLINED_FUNCTION_5() = 0;
    OUTLINED_FUNCTION_13(&dword_262716000, v24, v25, "sending connect message");
    OUTLINED_FUNCTION_1();
  }

  if (qword_26A956EF0 != -1) {
    swift_once();
  }
  if (qword_26A956EE0 != -1) {
    swift_once();
  }
  v26 = (void *)qword_26A9570F0;
  char v27 = *(unsigned char *)(v3 + 112);
  char v28 = *(unsigned char *)(v3 + 113);
  uint64_t v29 = *(void *)(v3 + 96);
  uint64_t v30 = *(void *)(v3 + 104);
  uint64_t v31 = sub_262722B3C();
  xpc_object_t v32 = xojit_create_setup_message((std::string::value_type *)(v31 + 32), v26, v27, v28, (uint64_t)sub_26271B648, v3, v29, v30);
  swift_release();
  if (!v32)
  {
    char v39 = 3;
    char v10 = &v39;
    return (_xpc_connection_s *)sub_26271947C(v10);
  }
  uint64_t result = *(_xpc_connection_s **)(v3 + 16);
  if (result)
  {
    xpc_connection_send_message(result, v32);
    return (_xpc_connection_s *)swift_unknownObjectRelease();
  }
LABEL_33:
  __break(1u);
  return result;
}

uint64_t sub_262719434(char *a1, void (*a2)(char *))
{
  char v3 = *a1;
  a2(&v3);
  return sub_262722C1C();
}

uint64_t sub_26271947C(char *a1)
{
  uint64_t v2 = v1;
  char v3 = *a1;
  uint64_t v4 = *(NSObject **)(v2 + 48);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v2;
  *(unsigned char *)(v5 + 24) = v3;
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = sub_26271BC64;
  *(void *)(v6 + 24) = v5;
  v9[4] = sub_26271BC7C;
  v9[5] = v6;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 1107296256;
  v9[2] = sub_26271B758;
  v9[3] = &block_descriptor_27;
  os_log_type_t v7 = _Block_copy(v9);
  swift_retain();
  swift_retain();
  swift_release();
  dispatch_sync(v4, v7);
  _Block_release(v7);
  LOBYTE(v4) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  uint64_t result = swift_release();
  if (v4) {
    __break(1u);
  }
  return result;
}

Swift::Void __swiftcall XOJITExecutor.waitForTermination()()
{
}

Swift::Void __swiftcall XOJITExecutor.handleRunProgramOnMainThread()()
{
  uint64_t v3 = v0;
  uint64_t v4 = sub_262722B0C();
  OUTLINED_FUNCTION_0();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_4();
  sub_262718A3C();
  uint64_t *v1 = sub_262722BCC();
  (*(void (**)(uint64_t *, void, uint64_t))(v6 + 104))(v1, *MEMORY[0x263F8F0E0], v4);
  char v7 = sub_262722B1C();
  (*(void (**)(uint64_t *, uint64_t))(v6 + 8))(v1, v4);
  if ((v7 & 1) == 0)
  {
    __break(1u);
LABEL_8:
    swift_once();
    goto LABEL_4;
  }
  xojit_executor_set_run_program_on_main_thread(v3, (uint64_t)sub_262719888);
  uint64_t v2 = *(void *)(v3 + 120);
  id v8 = *(id *)(v2 + 48);
  sub_262722C0C();

  if (*(unsigned char *)(v2 + 40))
  {
    __break(1u);
    return;
  }
  uint64_t v3 = *(void *)(v2 + 16);
  uint64_t v4 = *(void *)(v2 + 24);
  uint64_t v1 = *(uint64_t **)(v2 + 32);
  if (qword_26A956EC0 != -1) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v9 = sub_262722A9C();
  __swift_project_value_buffer(v9, (uint64_t)qword_26A9570A8);
  char v10 = sub_262722A7C();
  os_log_type_t v11 = sub_262722B6C();
  if (os_log_type_enabled(v10, v11))
  {
    int v12 = (uint8_t *)OUTLINED_FUNCTION_5();
    *(_WORD *)int v12 = 0;
    _os_log_impl(&dword_262716000, v10, v11, "Running main", v12, 2u);
    OUTLINED_FUNCTION_1();
  }

  *(void *)(v2 + 56) = __xojit_run_wrapper((uint64_t (*)(uint64_t, uint64_t))v3, v4, (uint64_t)v1);
  *(void *)(v2 + 64) = v13;
  *(unsigned char *)(v2 + 72) = 0;
  id v14 = *(id *)(v2 + 80);
  sub_262722C1C();
}

void sub_2627197F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a1)
  {
    uint64_t v5 = *(void *)(a1 + 120);
    *(void *)(v5 + 16) = a2;
    *(void *)(v5 + 24) = a3;
    *(void *)(v5 + 32) = a4;
    *(unsigned char *)(v5 + 40) = 0;
    id v6 = *(id *)(v5 + 48);
    swift_retain();
    sub_262722C1C();

    id v7 = *(id *)(*(void *)(a1 + 120) + 80);
    sub_262722C0C();

    if ((*(unsigned char *)(*(void *)(a1 + 120) + 72) & 1) == 0)
    {
      swift_release();
      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

uint64_t sub_26271988C(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = sub_262722B3C();
  xpc_object_t v5 = xpc_dictionary_get_value(a3, (const char *)(v4 + 32));
  swift_release();
  if (!v5) {
    return 0;
  }
  uint64_t v6 = MEMORY[0x263E51510](v5);
  if (qword_26A956EB8 != -1) {
    swift_once();
  }
  if (v6 == qword_26A9570A0) {
    uint64_t value = xpc_uint64_get_value(v5);
  }
  else {
    uint64_t value = 0;
  }
  swift_unknownObjectRelease();
  return value;
}

unint64_t sub_262719960(void *a1)
{
  unint64_t v2 = 0xD00000000000001DLL;
  uint64_t v3 = sub_26271988C(6582383, 0xE300000000000000, a1);
  if ((v4 & 1) == 0)
  {
    uint64_t v5 = v3;
    uint64_t v6 = sub_26271988C(7431539, 0xE300000000000000, a1);
    if ((v7 & 1) == 0)
    {
      uint64_t v8 = v6;
      uint64_t v9 = sub_26271988C(6775156, 0xE300000000000000, a1);
      if ((v10 & 1) == 0)
      {
        uint64_t v11 = v9;
        xpc_object_t v12 = sub_26271A8FC(6714722, 0xE300000000000000, a1, &qword_26A956EA8, &qword_26A957090);
        if (v12)
        {
          switch(v5)
          {
            case 0uLL:
              swift_unknownObjectRelease();
              return 0xD00000000000002DLL;
            case 1uLL:
              goto LABEL_11;
            case 2uLL:
              sub_26271A5E8(v8, v12);
              goto LABEL_11;
            case 3uLL:
              sub_26271A6B0(v11, v8, (uint64_t)v12);
LABEL_11:
              swift_unknownObjectRelease();
              unint64_t v2 = 0;
              break;
            default:
              OUTLINED_FUNCTION_2();
              sub_262722C4C();
              swift_bridgeObjectRelease();
              sub_262722C8C();
              sub_262722B4C();
              swift_unknownObjectRelease();
              swift_bridgeObjectRelease();
              unint64_t v2 = 0xD000000000000013;
              break;
          }
        }
      }
    }
  }
  return v2;
}

uint64_t sub_262719B5C(void *a1)
{
  unint64_t v4 = 0xD00000000000001DLL;
  uint64_t v5 = sub_262722ADC();
  OUTLINED_FUNCTION_0();
  uint64_t v7 = v6;
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_7();
  uint64_t v10 = v9 - v8;
  uint64_t v11 = sub_262722AFC();
  OUTLINED_FUNCTION_0();
  uint64_t v13 = v12;
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_8();
  uint64_t v14 = sub_26271988C(25705, 0xE200000000000000, a1);
  if (v15) {
    return 0xD000000000000024;
  }
  uint64_t v16 = v14;
  uint64_t v54 = v13;
  xpc_object_t v17 = sub_26271A8FC(0x7370756F7267, 0xE600000000000000, a1, &qword_26A956EA0, &qword_26A957088);
  if (!v17) {
    return 0xD000000000000028;
  }
  v18 = v17;
  xpc_object_t v19 = sub_26271A8FC(0x7365736162, 0xE500000000000000, a1, &qword_26A956EA0, &qword_26A957088);
  if (!v19)
  {
    swift_unknownObjectRelease();
    return 0xD000000000000027;
  }
  v53 = v19;
  xpc_object_t v20 = sub_26271A8FC(0x73657A6973, 0xE500000000000000, a1, &qword_26A956EA0, &qword_26A957088);
  if (!v20)
  {
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    return 0xD000000000000027;
  }
  v52 = v20;
  xpc_object_t v21 = sub_26271A8FC(0x73656372756F73, 0xE700000000000000, a1, &qword_26A956EA0, &qword_26A957088);
  if (!v21)
  {
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    return 0xD000000000000029;
  }
  v51 = v21;
  xpc_object_t v22 = sub_26271A8FC(24929, 0xE200000000000000, a1, &qword_26A956EA8, &qword_26A957090);
  if (!v22)
  {
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    return 0xD000000000000024;
  }
  uint64_t v49 = v7;
  xpc_object_t v50 = v22;
  size_t count = xpc_array_get_count(v18);
  if (xpc_array_get_count(v53) != count || xpc_array_get_count(v52) != count)
  {
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    return 0xD00000000000001ELL;
  }
  if (xpc_array_get_count(v51) != count)
  {
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    return 0xD000000000000020;
  }
  uint64_t result = swift_allocObject();
  uint64_t v47 = result;
  *(void *)(result + 16) = -1;
  if ((count & 0x8000000000000000) != 0)
  {
    __break(1u);
    return result;
  }
  if (!count)
  {
LABEL_45:
    uint64_t v46 = *(void *)(v1 + 40);
    char v39 = (void *)swift_allocObject();
    v39[2] = v50;
    v39[3] = v1;
    v39[4] = v47;
    v39[5] = v16;
    v59 = sub_26271C16C;
    v60 = v39;
    unint64_t aBlock = MEMORY[0x263EF8330];
    unint64_t v56 = 1107296256;
    v57 = sub_26271AF6C;
    v58 = &block_descriptor_42;
    v40 = _Block_copy(&aBlock);
    swift_unknownObjectRetain();
    swift_retain();
    swift_retain();
    sub_262722AEC();
    sub_26271C038(&qword_26A957010, MEMORY[0x263F8F030]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A957018);
    sub_26271C080((unint64_t *)&unk_26A957020, &qword_26A957018);
    sub_262722C3C();
    MEMORY[0x263E50D60](v46, v2, v10, v40);
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    _Block_release(v40);
    swift_unknownObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v49 + 8))(v10, v5);
    (*(void (**)(uint64_t, uint64_t))(v54 + 8))(v2, v11);
    swift_release();
    swift_release();
    return 0;
  }
  if ((uint64_t)xpc_array_get_count(v18) < 1)
  {
LABEL_47:
    swift_release();
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    return 0xD00000000000001ELL;
  }
  size_t v25 = 0;
  size_t v41 = count - 1;
  while (1)
  {
    xpc_object_t v26 = xpc_array_get_value(v18, v25);
    if (!v26) {
      goto LABEL_47;
    }
    char v27 = v26;
    int64_t v48 = v25;
    uint64_t v28 = MEMORY[0x263E51510]();
    if (qword_26A956EB8 != -1) {
      swift_once();
    }
    if (v28 != qword_26A9570A0)
    {
      swift_unknownObjectRelease();
      goto LABEL_47;
    }
    char value = xpc_uint64_get_value(v27);
    swift_unknownObjectRelease();
    if (v48 >= (uint64_t)xpc_array_get_count(v53)) {
      goto LABEL_49;
    }
    xpc_object_t v29 = xpc_array_get_value(v53, v48);
    if (!v29) {
      goto LABEL_49;
    }
    uint64_t v30 = v29;
    if (MEMORY[0x263E51510]() != qword_26A9570A0)
    {
      swift_unknownObjectRelease();
LABEL_49:
      swift_release();
      swift_unknownObjectRelease();
      swift_unknownObjectRelease();
      swift_unknownObjectRelease();
      swift_unknownObjectRelease();
      swift_unknownObjectRelease();
      return v4;
    }
    v45 = (void *)xpc_uint64_get_value(v30);
    swift_unknownObjectRelease();
    if (v48 >= (uint64_t)xpc_array_get_count(v52)) {
      goto LABEL_49;
    }
    xpc_object_t v31 = xpc_array_get_value(v52, v48);
    if (!v31) {
      goto LABEL_49;
    }
    xpc_object_t v32 = v31;
    if (MEMORY[0x263E51510]() != qword_26A9570A0)
    {
      swift_unknownObjectRelease();
      goto LABEL_49;
    }
    uint64_t v44 = xpc_uint64_get_value(v32);
    swift_unknownObjectRelease();
    if (!xpc_array_get_value(v51, v48))
    {
      swift_release();
      swift_unknownObjectRelease();
      swift_unknownObjectRelease();
      swift_unknownObjectRelease();
      swift_unknownObjectRelease();
      swift_unknownObjectRelease();
      return 0xD000000000000018;
    }
    uint64_t v33 = *(void **)(v47 + 16);
    if (v45 < v33) {
      uint64_t v33 = v45;
    }
    *(void *)(v47 + 16) = v33;
    uint64_t v34 = MEMORY[0x263E51510]();
    if (v34 == sub_262722AAC()) {
      break;
    }
    vm_prot_t v43 = sub_26271A9A8(value);
    mem_entry_name_port_t right = xpc_mach_send_get_right();
    sub_26271AC8C((mach_vm_address_t)v45, v44, v43, right);
    if (v36)
    {
      sub_262722C4C();
      swift_bridgeObjectRelease();
      unint64_t aBlock = 0xD00000000000001DLL;
      unint64_t v56 = 0x80000002627242A0;
      sub_262722B4C();
      swift_unknownObjectRelease();
      swift_unknownObjectRelease();
      swift_unknownObjectRelease();
      swift_unknownObjectRelease();
      swift_unknownObjectRelease();
      goto LABEL_56;
    }
LABEL_33:
    swift_unknownObjectRelease();
    if (v41 == v48) {
      goto LABEL_45;
    }
    size_t v25 = v48 + 1;
    if (v48 + 1 >= (uint64_t)xpc_array_get_count(v18)) {
      goto LABEL_47;
    }
  }
  if (v48 >= (uint64_t)xpc_array_get_count(v51) || !xpc_array_get_string(v51, v48))
  {
    swift_release();
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    return 0xD000000000000017;
  }
  sub_262722B5C();
  sub_26271A9EC(v45, v44);
  uint64_t v38 = v37;
  swift_bridgeObjectRelease();
  if (!v38) {
    goto LABEL_33;
  }
  sub_262722C4C();
  swift_bridgeObjectRelease();
  unint64_t aBlock = 0xD000000000000019;
  unint64_t v56 = 0x80000002627242E0;
  sub_262722B4C();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
LABEL_56:
  swift_bridgeObjectRelease();
  unint64_t v4 = aBlock;
  swift_release();
  swift_unknownObjectRelease();
  return v4;
}

uint64_t sub_26271A5E8(uint64_t a1, void *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A957008);
  uint64_t result = sub_262722BDC();
  if (v7)
  {
    swift_unknownObjectRetain();
    swift_retain();
    bytes_ptr = xpc_data_get_bytes_ptr(a2);
    size_t length = xpc_data_get_length(a2);
    if (bytes_ptr) {
      uint64_t v6 = (uint64_t)bytes_ptr + length;
    }
    else {
      uint64_t v6 = 0;
    }
    sub_26271B0B8(bytes_ptr, v6, v7);
    swift_release_n();
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_26271A6B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v9 = sub_262722ADC();
  OUTLINED_FUNCTION_0();
  uint64_t v11 = v10;
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_4();
  uint64_t v12 = sub_262722AFC();
  OUTLINED_FUNCTION_0();
  uint64_t v14 = v13;
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_9();
  uint64_t v18 = *(void *)(v3 + 40);
  char v15 = (void *)swift_allocObject();
  v15[2] = a3;
  v15[3] = a1;
  v15[4] = a2;
  v15[5] = v3;
  aBlock[4] = sub_26271C02C;
  aBlock[5] = v15;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_26271AF6C;
  aBlock[3] = &block_descriptor_33;
  uint64_t v16 = _Block_copy(aBlock);
  swift_unknownObjectRetain();
  swift_retain();
  sub_262722AEC();
  sub_26271C038(&qword_26A957010, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A957018);
  sub_26271C080((unint64_t *)&unk_26A957020, &qword_26A957018);
  sub_262722C3C();
  MEMORY[0x263E50D60](v18, v5, v4, v16);
  _Block_release(v16);
  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v4, v9);
  (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v5, v12);
  return swift_release();
}

xpc_object_t sub_26271A8FC(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  uint64_t v8 = sub_262722B3C();
  xpc_object_t v9 = xpc_dictionary_get_value(a3, (const char *)(v8 + 32));
  swift_release();
  if (v9)
  {
    uint64_t v10 = MEMORY[0x263E51510](v9);
    if (*a4 != -1) {
      swift_once();
    }
    if (v10 != *a5)
    {
      swift_unknownObjectRelease();
      return 0;
    }
  }
  return v9;
}

uint64_t sub_26271A9A8(char a1)
{
  if ((a1 & 1) == 0)
  {
    if ((a1 & 2) != 0)
    {
      uint64_t v1 = 2;
      if ((a1 & 4) == 0) {
        return v1;
      }
    }
    else
    {
      uint64_t v1 = 0;
      if ((a1 & 4) == 0) {
        return v1;
      }
    }
    return v1 | 4;
  }
  if ((a1 & 2) == 0)
  {
    uint64_t v1 = 1;
    if ((a1 & 4) == 0) {
      return v1;
    }
    return v1 | 4;
  }
  uint64_t v1 = 3;
  if ((a1 & 4) != 0) {
    return v1 | 4;
  }
  return v1;
}

uint64_t sub_26271A9EC(void *a1, size_t a2)
{
  sub_262722B3C();
  int v5 = sub_262722ABC();
  uint64_t result = swift_release();
  if (v5 == -1)
  {
    OUTLINED_FUNCTION_2();
    sub_262722C4C();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_12();
    goto LABEL_8;
  }
  if (qword_26A956EE0 != -1) {
    uint64_t result = swift_once();
  }
  if (!qword_26A9570F0)
  {
    __break(1u);
LABEL_24:
    __break(1u);
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  if (a2 % qword_26A9570F0)
  {
    OUTLINED_FUNCTION_2();
    sub_262722C4C();
    sub_262722B4C();
    sub_262722C8C();
    sub_262722B4C();
    swift_bridgeObjectRelease();
LABEL_8:
    sub_262722B4C();
    return v12[0];
  }
  if ((a2 & 0x8000000000000000) != 0) {
    goto LABEL_24;
  }
  if (*(unsigned char *)(v2 + 112)) {
    int v7 = 5;
  }
  else {
    int v7 = 3;
  }
  uint64_t v8 = mmap(a1, a2, v7, 18, v5, 0);
  uint64_t v9 = close(v5);
  if (v8 == (void *)-1)
  {
    int v11 = MEMORY[0x263E50C40](v9);
    uint64_t result = (uint64_t)strerror(v11);
    if (result)
    {
      sub_262722B5C();
      strcpy((char *)v12, "mmap failed: ");
      HIWORD(v12[1]) = -4864;
      sub_262722B4C();
      goto LABEL_22;
    }
    goto LABEL_25;
  }
  if ((*(unsigned char *)(v2 + 112) & 1) != 0 || !mprotect(v8, a2, 5)) {
    return 0;
  }
  int v10 = MEMORY[0x263E50C40]();
  uint64_t result = (uint64_t)strerror(v10);
  if (result)
  {
    sub_262722B5C();
    OUTLINED_FUNCTION_2();
    sub_262722C4C();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_12();
    sub_262722B4C();
LABEL_22:
    swift_bridgeObjectRelease();
    return v12[0];
  }
LABEL_26:
  __break(1u);
  return result;
}

uint64_t sub_26271AC8C(mach_vm_address_t a1, mach_vm_size_t size, vm_prot_t max_protection, mem_entry_name_port_t object)
{
  address[2] = *MEMORY[0x263EF8340];
  if (qword_26A956EE0 != -1) {
    swift_once();
  }
  if (!qword_26A9570F0) {
    __break(1u);
  }
  if (size % qword_26A9570F0)
  {
    address[1] = 0xE000000000000000;
    sub_262722C4C();
    sub_262722B4C();
    sub_262722C8C();
    sub_262722B4C();
    swift_bridgeObjectRelease();
    sub_262722B4C();
    return 0;
  }
  else
  {
    address[0] = a1;
    if (mach_vm_map(*MEMORY[0x263EF8960], address, size, 0, 0x4000, object, 0, 0, max_protection, max_protection, 2u))
    {
      return 0xD000000000000022;
    }
    else
    {
      return 0;
    }
  }
}

_xpc_connection_s *sub_26271AE3C(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = (uint64_t *)(a3 + 16);
  uint64_t v9 = (void *)swift_unknownObjectRetain();
  bytes_ptr = (unint64_t *)xpc_data_get_bytes_ptr(v9);
  size_t length = xpc_data_get_length(a1);
  uint64_t v12 = *(void *)(a2 + 96);
  swift_beginAccess();
  if (bytes_ptr) {
    unint64_t v13 = length;
  }
  else {
    unint64_t v13 = 0;
  }
  uint64_t v14 = xojit_xpcmemmgr_run_finalize_actions(v12, *(void *)(a3 + 16), bytes_ptr, v13);
  swift_unknownObjectRelease();
  xpc_object_t empty = xpc_dictionary_create_empty();
  xpc_dictionary_set_uint64(empty, "opc", 1uLL);
  xpc_dictionary_set_uint64(empty, "id", a4);
  if (v14)
  {
    xpc_dictionary_set_string(empty, "err", v14);
  }
  else
  {
    swift_beginAccess();
    xpc_dictionary_set_uint64(empty, "fa", *v8);
  }
  uint64_t result = *(_xpc_connection_s **)(a2 + 16);
  if (result)
  {
    xpc_connection_send_message(result, empty);
    return (_xpc_connection_s *)swift_unknownObjectRelease();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_26271AF6C(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t sub_26271AFB0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  int v5 = (uint64_t *)(a1 + 56);
  swift_beginAccess();
  unint64_t v6 = sub_26271BCC0(a2);
  uint64_t v7 = 0;
  if (v8)
  {
    unint64_t v9 = v6;
    swift_isUniquelyReferenced_nonNull_native();
    uint64_t v11 = *v5;
    *int v5 = 0x8000000000000000;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A957000);
    sub_262722C5C();
    uint64_t v7 = *(void *)(*(void *)(v11 + 56) + 8 * v9);
    type metadata accessor for XOJITExecutor.ActiveRunWrapper();
    sub_262722C6C();
    *int v5 = v11;
    swift_bridgeObjectRelease();
  }
  *a3 = v7;
  return swift_endAccess();
}

void sub_26271B0B8(const void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  if (a1)
  {
    size_t v5 = a2 - (void)a1;
    if (a2 - (uint64_t)a1 > 8)
    {
      unint64_t v6 = (unint64_t)malloc(a2 - (void)a1);
      unsigned __int8 v7 = v6;
      unint64_t v19 = v6 >> 16;
      unint64_t v20 = v6 >> 8;
      unint64_t v18 = v6 >> 24;
      unint64_t v8 = HIDWORD(v6);
      unint64_t v9 = v6 >> 40;
      unint64_t v10 = HIWORD(v6);
      unint64_t v11 = HIBYTE(v6);
      memcpy((void *)v6, a1, v5);
      unsigned __int8 v13 = v19;
      unsigned __int8 v12 = v20;
      unsigned __int8 v14 = v18;
      unint64_t v15 = v11;
      goto LABEL_9;
    }
  }
  else
  {
    size_t v5 = 0;
  }
  if (v5 <= 7) {
    size_t v16 = 8 - v5;
  }
  else {
    size_t v16 = 0;
  }
  bzero(&__dst[v5], v16);
  memcpy(__dst, a1, v5);
  unsigned __int8 v7 = __dst[0];
  unsigned __int8 v12 = __dst[1];
  unsigned __int8 v13 = __dst[2];
  unsigned __int8 v14 = __dst[3];
  LOBYTE(v8) = __dst[4];
  LOBYTE(v9) = __dst[5];
  LOBYTE(v10) = __dst[6];
  unint64_t v15 = __dst[7];
LABEL_9:
  *(void *)(a3 + 16) = ((unint64_t)v10 << 48) | (v15 << 56) | ((unint64_t)v9 << 40) | ((unint64_t)v8 << 32) | ((unint64_t)v14 << 24) | ((unint64_t)v13 << 16) | ((unint64_t)v12 << 8) | v7;
  *(void *)(a3 + 24) = v5;
  *(unsigned char *)(a3 + 32) = 0;
  id v17 = *(id *)(a3 + 40);
  sub_262722C1C();
}

void sub_26271B230(void *a1, uint64_t (*a2)(uint64_t, uint64_t), uint64_t a3, uint64_t a4)
{
  v18[2] = *MEMORY[0x263EF8340];
  unint64_t v8 = (void *)swift_unknownObjectRetain();
  bytes_ptr = xpc_data_get_bytes_ptr(v8);
  size_t length = xpc_data_get_length(a1);
  if (bytes_ptr) {
    uint64_t v11 = length;
  }
  else {
    uint64_t v11 = 0;
  }
  uint64_t v12 = __xojit_run_wrapper(a2, (uint64_t)bytes_ptr, v11);
  size_t v14 = v13;
  swift_unknownObjectRelease();
  v18[0] = v12;
  v18[1] = v14;
  if (orc_rt_CWrapperFunctionResultGetOutOfBandError(v18))
  {
    sub_262722B5C();
    swift_bridgeObjectRelease();
LABEL_11:
    orc_rt_DisposeCWrapperFunctionResult((uint64_t)v18);
    return;
  }
  unint64_t v15 = orc_rt_CWrapperFunctionResultData(v18);
  xpc_object_t empty = xpc_dictionary_create_empty();
  xpc_dictionary_set_uint64(empty, "opc", 0);
  xpc_dictionary_set_uint64(empty, "opd", 2uLL);
  xpc_dictionary_set_uint64(empty, "tag", 0);
  xpc_dictionary_set_uint64(empty, "seq", a3);
  if (v14)
  {
    if (v15) {
      xpc_dictionary_set_data(empty, "buf", v15, v14);
    }
  }
  id v17 = *(_xpc_connection_s **)(a4 + 16);
  if (v17)
  {
    xpc_connection_send_message(v17, empty);
    swift_unknownObjectRelease();
    goto LABEL_11;
  }
  __break(1u);
}

uint64_t sub_26271B39C()
{
  uint64_t v2 = sub_262722B0C();
  OUTLINED_FUNCTION_0();
  uint64_t v4 = v3;
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_8();
  size_t v5 = *(void **)(v0 + 48);
  void *v1 = v5;
  (*(void (**)(void *, void, uint64_t))(v4 + 104))(v1, *MEMORY[0x263F8F0E0], v2);
  id v6 = v5;
  LOBYTE(v5) = sub_262722B1C();
  uint64_t result = (*(uint64_t (**)(void *, uint64_t))(v4 + 8))(v1, v2);
  if (v5)
  {
    uint64_t result = *(void *)(v0 + 64);
    if (result != -1)
    {
      *(void *)(v0 + 64) = result + 1;
      return result;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_26271B480(uint64_t a1, uint64_t a2, const void *a3, size_t a4)
{
  swift_retain();
  sub_26271B4E4(a2, a3, a4);
  uint64_t v8 = v7;
  swift_release();
  return v8;
}

void sub_26271B4E4(uint64_t a1, const void *a2, size_t a3)
{
  type metadata accessor for XOJITExecutor.ActiveRunWrapper();
  uint64_t v7 = swift_allocObject();
  sub_262718400();
  sub_262722BDC();
  xpc_object_t empty = xpc_dictionary_create_empty();
  xpc_dictionary_set_uint64(empty, "opc", 0);
  xpc_dictionary_set_uint64(empty, "opd", 3uLL);
  xpc_dictionary_set_uint64(empty, "tag", a1);
  xpc_dictionary_set_uint64(empty, "seq", v11);
  if ((a3 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_6;
  }
  xpc_dictionary_set_data(empty, "buf", a2, a3);
  unint64_t v9 = *(_xpc_connection_s **)(v3 + 16);
  if (!v9)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  xpc_connection_send_message(v9, empty);
  id v10 = *(id *)(v7 + 40);
  sub_262722C0C();

  if ((*(unsigned char *)(v7 + 32) & 1) == 0)
  {
    swift_release();
    swift_unknownObjectRelease();
    return;
  }
LABEL_7:
  __break(1u);
}

uint64_t sub_26271B64C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_26271B39C();
  swift_beginAccess();
  uint64_t v3 = swift_retain();
  sub_26271BDA0(v3, v2);
  uint64_t result = swift_endAccess();
  *a1 = v2;
  return result;
}

uint64_t sub_26271B6D0(uint64_t a1, char a2)
{
  uint64_t v4 = (void *)(a1 + 72);
  uint64_t v3 = *(void (**)(char *))(a1 + 72);
  if (v3)
  {
    char v7 = a2;
    swift_retain();
    v3(&v7);
    sub_26271B908((uint64_t)v3);
    uint64_t v5 = *(void *)(a1 + 72);
  }
  else
  {
    uint64_t v5 = 0;
  }
  *uint64_t v4 = 0;
  v4[1] = 0;
  return sub_26271B908(v5);
}

uint64_t sub_26271B758(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

void sub_26271B780()
{
  qword_26A9570C0 = 0x6534366D7261;
  *(void *)algn_26A9570C8 = 0xE600000000000000;
}

void sub_26271B7A0()
{
  qword_26A9570D0 = 7565161;
  *(void *)algn_26A9570D8 = 0xE300000000000000;
}

void sub_26271B7BC()
{
  qword_26A9570E0 = 825110834;
  *(void *)algn_26A9570E8 = 0xE400000000000000;
}

void sub_26271B7D8()
{
  qword_26A9570F0 = *MEMORY[0x263EF8AF8];
}

void sub_26271B7F0()
{
  qword_26A9570F8 = 0x656C707061;
  unk_26A957100 = 0xE500000000000000;
}

uint64_t sub_26271B810()
{
  if (qword_26A956EC8 != -1) {
    uint64_t result = swift_once();
  }
  if (qword_26A956EE8 != -1) {
    uint64_t result = swift_once();
  }
  if (qword_26A956ED0 != -1) {
    uint64_t result = swift_once();
  }
  if (qword_26A956ED8 != -1) {
    uint64_t result = swift_once();
  }
  qword_26A957108 = 0xD000000000000014;
  unk_26A957110 = 0x8000000262723F90;
  return result;
}

uint64_t sub_26271B908(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_26271B918(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_26271B928()
{
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_26271B968(char *a1)
{
  return sub_262719434(a1, *(void (**)(char *))(v1 + 16));
}

uint64_t sub_26271B974()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_26271B9AC()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

unint64_t sub_26271B9D8()
{
  unint64_t result = qword_26A956F90;
  if (!qword_26A956F90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A956F90);
  }
  return result;
}

uint64_t type metadata accessor for XOJITExecutor()
{
  return self;
}

uint64_t method lookup function for XOJITExecutor(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for XOJITExecutor);
}

uint64_t dispatch thunk of XOJITExecutor.__allocating_init(connection:)()
{
  return (*(uint64_t (**)(void))(v0 + 192))();
}

ValueMetadata *type metadata accessor for XOJITExecutor.JITDylibHandle()
{
  return &type metadata for XOJITExecutor.JITDylibHandle;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for XOJITExecutor.TerminationResult(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFD)
  {
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
      if (!v4) {
        goto LABEL_17;
      }
    }
    else if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
    }
    else
    {
      int v4 = a1[1];
      if (!a1[1]) {
        goto LABEL_17;
      }
    }
    int v5 = (*a1 | (v4 << 8)) - 4;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 4;
  int v5 = v6 - 4;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for XOJITExecutor.TerminationResult(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x26271BBE4);
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

uint64_t sub_26271BC0C(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_26271BC14(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for XOJITExecutor.TerminationResult()
{
  return &type metadata for XOJITExecutor.TerminationResult;
}

uint64_t sub_26271BC2C()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 25, 7);
}

uint64_t sub_26271BC64()
{
  return sub_26271B6D0(*(void *)(v0 + 16), *(unsigned char *)(v0 + 24));
}

uint64_t sub_26271BC70()
{
  return OUTLINED_FUNCTION_3(v0, 32);
}

uint64_t sub_26271BC7C()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_26271BCA4@<X0>(uint64_t *a1@<X8>)
{
  return sub_26271B64C(a1);
}

unint64_t sub_26271BCC0(uint64_t a1)
{
  uint64_t v2 = sub_262722CAC();
  return sub_26271BD04(a1, v2);
}

unint64_t sub_26271BD04(uint64_t a1, uint64_t a2)
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

uint64_t sub_26271BDA0(uint64_t a1, uint64_t a2)
{
  swift_isUniquelyReferenced_nonNull_native();
  uint64_t v6 = *v2;
  *uint64_t v2 = 0x8000000000000000;
  sub_26271BE20(a1, a2);
  *uint64_t v2 = v6;
  return swift_bridgeObjectRelease();
}

unint64_t sub_26271BE20(uint64_t a1, uint64_t a2)
{
  int v3 = (void **)v2;
  uint64_t v6 = (void *)*v2;
  unint64_t v7 = sub_26271BCC0(a2);
  if (__OFADD__(v6[2], (v8 & 1) == 0))
  {
    __break(1u);
    goto LABEL_11;
  }
  unint64_t v9 = v7;
  char v10 = v8;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A957000);
  if ((sub_262722C5C() & 1) == 0) {
    goto LABEL_5;
  }
  unint64_t v11 = sub_26271BCC0(a2);
  if ((v10 & 1) != (v12 & 1))
  {
LABEL_11:
    unint64_t result = sub_262722C9C();
    __break(1u);
    return result;
  }
  unint64_t v9 = v11;
LABEL_5:
  size_t v13 = *v3;
  if (v10)
  {
    uint64_t v14 = v13[7];
    unint64_t result = swift_release();
    *(void *)(v14 + 8 * v9) = a1;
  }
  else
  {
    return sub_26271BF30(v9, a2, a1, v13);
  }
  return result;
}

unint64_t sub_26271BF30(unint64_t result, uint64_t a2, uint64_t a3, void *a4)
{
  a4[(result >> 6) + 8] |= 1 << result;
  *(void *)(a4[6] + 8 * result) = a2;
  *(void *)(a4[7] + 8 * result) = a3;
  uint64_t v4 = a4[2];
  BOOL v5 = __OFADD__(v4, 1);
  uint64_t v6 = v4 + 1;
  if (v5) {
    __break(1u);
  }
  else {
    a4[2] = v6;
  }
  return result;
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

uint64_t sub_26271BFD8@<X0>(void *a1@<X8>)
{
  return sub_26271AFB0(*(void *)(v1 + 16), *(void *)(v1 + 24), a1);
}

uint64_t sub_26271BFF4()
{
  swift_unknownObjectRelease();
  swift_release();
  uint64_t v0 = OUTLINED_FUNCTION_6();
  return MEMORY[0x270FA0238](v0, v1, v2);
}

void sub_26271C02C()
{
  sub_26271B230(*(void **)(v0 + 16), *(uint64_t (**)(uint64_t, uint64_t))(v0 + 24), *(void *)(v0 + 32), *(void *)(v0 + 40));
}

uint64_t sub_26271C038(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_26271C080(unint64_t *a1, uint64_t *a2)
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

uint64_t orc_rt_CWrapperFunctionResultGetOutOfBandError(void *a1)
{
  if (a1[1]) {
    return 0;
  }
  else {
    return *a1;
  }
}

void *orc_rt_CWrapperFunctionResultData(void *result)
{
  if (result[1] >= 9uLL) {
    return (void *)*result;
  }
  return result;
}

void orc_rt_DisposeCWrapperFunctionResult(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 8);
  if (v1 >= 9)
  {
    uint64_t v2 = *(void **)a1;
LABEL_3:
    free(v2);
    return;
  }
  if (!v1)
  {
    uint64_t v2 = *(void **)a1;
    if (v2) {
      goto LABEL_3;
    }
  }
}

uint64_t sub_26271C120()
{
  return OUTLINED_FUNCTION_3(v0, 24);
}

uint64_t sub_26271C12C()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  uint64_t v0 = OUTLINED_FUNCTION_6();
  return MEMORY[0x270FA0238](v0, v1, v2);
}

_xpc_connection_s *sub_26271C16C()
{
  return sub_26271AE3C(*(void **)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32), *(void *)(v0 + 40));
}

void OUTLINED_FUNCTION_1()
{
  JUMPOUT(0x263E513F0);
}

uint64_t OUTLINED_FUNCTION_3(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA0238](a1, a2, 7);
}

uint64_t OUTLINED_FUNCTION_4()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_5()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_6()
{
  return v0;
}

void OUTLINED_FUNCTION_13(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v5, a4, v6, 2u);
}

void anonymous namespace'::LogManager::~LogManager(void **this)
{
}

char *xojit_xpcmemmgr_run_finalize_actions(uint64_t a1, unint64_t a2, unint64_t *a3, unint64_t a4)
{
  v88 = 0;
  v89 = 0;
  unint64_t v90 = 0;
  if (a4 >= 8)
  {
    uint64_t v5 = a1;
    unint64_t v6 = *a3;
    v87[0] = a3 + 1;
    v87[1] = a4 - 8;
    if (v6)
    {
      if (v6 >> 58) {
LABEL_161:
      }
        abort();
      __p[0] = &v90;
      __s1[0] = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<__orc_rt::AllocationActionsPair>>(v6);
      __s1[1] = __s1[0];
      *(char **)&long long v92 = __s1[0];
      *((void *)&v92 + 1) = &__s1[0][64 * v7];
      std::vector<__orc_rt::AllocationActionsPair>::__swap_out_circular_buffer((uint64_t *)&v88, __s1);
      std::__split_buffer<__orc_rt::AllocationActionsPair>::~__split_buffer((uint64_t)__s1);
      char v8 = __p;
      while (1)
      {
        *(_OWORD *)__p = 0u;
        long long v94 = 0u;
        *(_OWORD *)__s1 = 0u;
        long long v92 = 0u;
        if (!__orc_rt::SPSSerializationTraits<__orc_rt::SPSTuple<__orc_rt::SPSExecutorAddr,__orc_rt::SPSSequence<char>>,__orc_rt::WrapperFunctionCall,void>::deserialize((uint64_t)v87, __s1)|| !__orc_rt::SPSSerializationTraits<__orc_rt::SPSTuple<__orc_rt::SPSExecutorAddr,__orc_rt::SPSSequence<char>>,__orc_rt::WrapperFunctionCall,void>::deserialize((uint64_t)v87, v8))
        {
          break;
        }
        unint64_t v85 = v6;
        unint64_t v9 = __s1[0];
        char v10 = __s1[1];
        unint64_t v4 = *((void *)&v92 + 1);
        unint64_t v11 = (void *)v92;
        __s1[1] = 0;
        long long v92 = 0uLL;
        char v12 = __p[0];
        size_t v13 = __p[1];
        long long v14 = v94;
        unint64_t v15 = v89;
        if ((unint64_t)v89 >= v90)
        {
          id v17 = v8;
          uint64_t v18 = ((char *)v89 - v88) >> 6;
          unint64_t v19 = v18 + 1;
          if ((unint64_t)(v18 + 1) >> 58) {
            goto LABEL_161;
          }
          uint64_t v20 = v90 - (void)v88;
          if ((uint64_t)(v90 - (void)v88) >> 5 > v19) {
            unint64_t v19 = v20 >> 5;
          }
          if ((unint64_t)v20 >= 0x7FFFFFFFFFFFFFC0) {
            unint64_t v21 = 0x3FFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v21 = v19;
          }
          v95[4] = (void **)&v90;
          uint64_t v22 = (void **)std::__allocate_at_least[abi:nn180100]<std::allocator<__orc_rt::AllocationActionsPair>>(v21);
          os_log_type_t v23 = &v22[8 * v18];
          v95[0] = v22;
          v95[1] = v23;
          v95[3] = &v22[8 * v24];
          *os_log_type_t v23 = v9;
          v23[1] = v10;
          v23[2] = v11;
          v23[3] = (void *)v4;
          v23[4] = v12;
          v23[5] = v13;
          v23[6] = 0;
          *((_OWORD *)v23 + 3) = v14;
          v95[2] = v23 + 8;
          std::vector<__orc_rt::AllocationActionsPair>::__swap_out_circular_buffer((uint64_t *)&v88, v95);
          size_t v16 = v89;
          std::__split_buffer<__orc_rt::AllocationActionsPair>::~__split_buffer((uint64_t)v95);
          char v8 = v17;
        }
        else
        {
          *v89 = __s1[0];
          v15[1] = v10;
          v15[2] = (char *)v11;
          v15[3] = (char *)v4;
          v15[4] = (char *)v12;
          v15[5] = (char *)v13;
          size_t v16 = v15 + 8;
          *((_OWORD *)v15 + 3) = v14;
        }
        v89 = v16;
        unint64_t v6 = v85 - 1;
        if (v85 == 1)
        {
          size_t v25 = (char **)v88;
          unint64_t v26 = v90;
          uint64_t v5 = a1;
          goto LABEL_24;
        }
      }
      if (__p[1]) {
        operator delete(__p[1]);
      }
      if (__s1[1]) {
        operator delete(__s1[1]);
      }
      goto LABEL_22;
    }
    unint64_t v26 = 0;
    size_t v16 = 0;
    size_t v25 = 0;
LABEL_24:
    v86[0] = v25;
    v86[1] = v16;
    v86[2] = v26;
    v89 = 0;
    unint64_t v90 = 0;
    v88 = 0;
    __s1[0] = 0;
    __s1[1] = 0;
    *(void *)&long long v92 = 0;
    if (v25 != v16)
    {
      uint64_t v28 = 0;
      unint64_t v4 = 0x7FFFFFFFFFFFFFFLL;
      while (1)
      {
        if (*v25)
        {
          __orc_rt::WrapperFunctionCall::runWithSPSRet<__orc_rt::SPSEmpty,__orc_rt::SPSEmpty>(v95, (uint64_t)v25);
          unint64_t v29 = (unint64_t)v95[0] & 0xFFFFFFFFFFFFFFFELL;
          if (((unint64_t)v95[0] & 0xFFFFFFFFFFFFFFFELL) != 0)
          {
            __orc_rt::Error::assertIsChecked(1);
            __orc_rt::Error::assertIsChecked(1);
            int64_t v48 = __s1[0];
            if (__s1[0] != v28)
            {
              do
              {
                uint64_t v49 = v28 - 32;
                __orc_rt::WrapperFunctionCall::runWithSPSRet<__orc_rt::SPSEmpty,__orc_rt::SPSEmpty>(v87, (uint64_t)(v28 - 32));
                unint64_t v50 = v87[0] & 0xFFFFFFFFFFFFFFFELL;
                unint64_t v51 = v87[0] & 0xFFFFFFFFFFFFFFFELL | ((v87[0] & 0xFFFFFFFFFFFFFFFELL) == 0);
                v87[0] = v51;
                if (v50
                  && (*(unsigned int (**)(unint64_t, void *))(*(void *)v50 + 24))(v50, &_MergedGlobals))
                {
                  v87[0] = 1;
                  (*(void (**)(unint64_t))(*(void *)v50 + 8))(v50);
                  unint64_t v51 = 1;
                }
                __orc_rt::Error::assertIsChecked(v51);
                v52 = (void *)*((void *)v28 - 3);
                if (v52)
                {
                  *((void *)v28 - 2) = v52;
                  operator delete(v52);
                }
                __s1[1] = v28 - 32;
                v28 -= 32;
              }
              while (v49 != v48);
            }
            __orc_rt::Error::assertIsChecked(1);
            goto LABEL_141;
          }
          __orc_rt::Error::assertIsChecked((unint64_t)v95[0] | 1);
        }
        if (v25[4])
        {
          if ((unint64_t)v28 >= (unint64_t)v92)
          {
            uint64_t v30 = (v28 - __s1[0]) >> 5;
            if ((unint64_t)(v30 + 1) >> 59) {
              goto LABEL_161;
            }
            unint64_t v31 = (uint64_t)(v92 - (unint64_t)__s1[0]) >> 4;
            if (v31 <= v30 + 1) {
              unint64_t v31 = v30 + 1;
            }
            if ((unint64_t)v92 - (unint64_t)__s1[0] >= 0x7FFFFFFFFFFFFFE0) {
              unint64_t v32 = 0x7FFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v32 = v31;
            }
            if (v32)
            {
              if (v32 >> 59) {
                goto LABEL_162;
              }
              uint64_t v33 = (char *)operator new(32 * v32);
            }
            else
            {
              uint64_t v33 = 0;
            }
            uint64_t v34 = &v33[32 * v30];
            char v35 = &v33[32 * v32];
            std::construct_at[abi:nn180100]<__orc_rt::WrapperFunctionCall,__orc_rt::WrapperFunctionCall const&,__orc_rt::WrapperFunctionCall*>(v34, v25 + 4);
            uint64_t v36 = __s1[0];
            uint64_t v37 = __s1[1];
            if (__s1[1] == __s1[0])
            {
              __s1[0] = v34;
              *(void *)&long long v92 = v35;
            }
            else
            {
              uint64_t v38 = 0;
              do
              {
                char v39 = &v34[v38];
                v40 = &v37[v38];
                *((void *)v39 - 4) = *(void *)&v37[v38 - 32];
                *((void *)v39 - 3) = 0;
                *((void *)v39 - 2) = 0;
                *((void *)v39 - 1) = 0;
                *(_OWORD *)(v39 - 24) = *(_OWORD *)&v37[v38 - 24];
                *((void *)v39 - 1) = *(void *)&v37[v38 - 8];
                *((void *)v40 - 3) = 0;
                *((void *)v40 - 2) = 0;
                *((void *)v40 - 1) = 0;
                v38 -= 32;
              }
              while (&v37[v38] != v36);
              uint64_t v37 = __s1[0];
              size_t v41 = __s1[1];
              __s1[0] = &v34[v38];
              *(void *)&long long v92 = v35;
              while (v41 != v37)
              {
                v42 = (void *)*((void *)v41 - 3);
                if (v42)
                {
                  *((void *)v41 - 2) = v42;
                  operator delete(v42);
                }
                v41 -= 32;
              }
            }
            uint64_t v28 = v34 + 32;
            uint64_t v5 = a1;
            if (v37) {
              operator delete(v37);
            }
          }
          else
          {
            std::construct_at[abi:nn180100]<__orc_rt::WrapperFunctionCall,__orc_rt::WrapperFunctionCall const&,__orc_rt::WrapperFunctionCall*>(v28, v25 + 4);
            v28 += 32;
          }
          __s1[1] = v28;
        }
        v25 += 8;
        if (v25 == v16) {
          goto LABEL_57;
        }
      }
    }
    uint64_t v28 = 0;
LABEL_57:
    std::mutex::lock((std::mutex *)v5);
    unint64_t v43 = 0x9DDFEA08EB382D69 * (((8 * a2) + 8) ^ HIDWORD(a2));
    unint64_t v44 = 0x9DDFEA08EB382D69 * (HIDWORD(a2) ^ (v43 >> 47) ^ v43);
    unint64_t v45 = 0x9DDFEA08EB382D69 * (v44 ^ (v44 >> 47));
    unint64_t v46 = *(void *)(v5 + 112);
    if (v46)
    {
      uint8x8_t v47 = (uint8x8_t)vcnt_s8((int8x8_t)v46);
      v47.i16[0] = vaddlv_u8(v47);
      if (v47.u32[0] > 1uLL)
      {
        unint64_t v4 = 0x9DDFEA08EB382D69 * (v44 ^ (v44 >> 47));
        if (v45 >= v46) {
          unint64_t v4 = v45 % v46;
        }
      }
      else
      {
        unint64_t v4 = (v46 - 1) & v45;
      }
      v53 = *(void **)(*(void *)(v5 + 104) + 8 * v4);
      if (v53)
      {
        uint64_t v54 = (void *)*v53;
        if (*v53)
        {
          do
          {
            unint64_t v55 = v54[1];
            if (v55 == v45)
            {
              if (v54[2] == a2) {
                goto LABEL_138;
              }
            }
            else
            {
              if (v47.u32[0] > 1uLL)
              {
                if (v55 >= v46) {
                  v55 %= v46;
                }
              }
              else
              {
                v55 &= v46 - 1;
              }
              if (v55 != v4) {
                break;
              }
            }
            uint64_t v54 = (void *)*v54;
          }
          while (v54);
        }
      }
    }
    unint64_t v56 = (void *)(v5 + 120);
    uint64_t v54 = operator new(0x30uLL);
    *uint64_t v54 = 0;
    v54[1] = v45;
    v54[2] = a2;
    v54[3] = 0;
    v54[4] = 0;
    v54[5] = 0;
    float v57 = (float)(unint64_t)(*(void *)(v5 + 128) + 1);
    float v58 = *(float *)(v5 + 136);
    if (v46 && (float)(v58 * (float)v46) >= v57)
    {
LABEL_128:
      uint64_t v75 = *(void *)(v5 + 104);
      v76 = *(void **)(v75 + 8 * v4);
      if (v76)
      {
        *uint64_t v54 = *v76;
      }
      else
      {
        v77 = (void *)*v56;
        *uint64_t v54 = *v56;
        *unint64_t v56 = v54;
        *(void *)(v75 + 8 * v4) = v56;
        if (!v77) {
          goto LABEL_137;
        }
        unint64_t v78 = v77[1];
        if ((v46 & (v46 - 1)) != 0)
        {
          if (v78 >= v46) {
            v78 %= v46;
          }
        }
        else
        {
          v78 &= v46 - 1;
        }
        v76 = (void *)(*(void *)(v5 + 104) + 8 * v78);
      }
      void *v76 = v54;
LABEL_137:
      ++*(void *)(v5 + 128);
LABEL_138:
      if (v54[3])
      {
        std::vector<__orc_rt::WrapperFunctionCall>::__clear[abi:nn180100](v54 + 3);
        operator delete((void *)v54[3]);
        uint64_t v28 = __s1[1];
      }
      uint64_t v79 = v92;
      v54[3] = __s1[0];
      v54[4] = v28;
      v54[5] = v79;
      __s1[1] = 0;
      *(void *)&long long v92 = 0;
      __s1[0] = 0;
      std::mutex::unlock((std::mutex *)v5);
      unint64_t v29 = 0;
LABEL_141:
      __orc_rt::Error::assertIsChecked(1);
      v95[0] = (void **)__s1;
      std::vector<__orc_rt::WrapperFunctionCall>::__destroy_vector::operator()[abi:nn180100](v95);
      __s1[0] = (char *)v86;
      std::vector<__orc_rt::AllocationActionsPair>::__destroy_vector::operator()[abi:nn180100]((void ***)__s1);
      if (!v29)
      {
        char v27 = 0;
LABEL_149:
        __orc_rt::Error::assertIsChecked(1);
        goto LABEL_150;
      }
      __orc_rt::Error::assertIsChecked(1);
      if ((*(uint64_t (**)(unint64_t, void *))(*(void *)v29 + 24))(v29, &_MergedGlobals))
      {
        (*(void (**)(char **__return_ptr, unint64_t))(*(void *)v29 + 40))(__s1, v29);
        (*(void (**)(unint64_t))(*(void *)v29 + 8))(v29);
        if (SBYTE7(v92) < 0)
        {
          v81 = __s1[0];
          char v27 = strdup(__s1[0]);
          operator delete(v81);
          unint64_t v29 = 1;
          goto LABEL_148;
        }
        unint64_t v29 = 1;
      }
      else
      {
        __s1[0] = 0;
        __s1[1] = 0;
        *(void *)&long long v92 = 0;
      }
      char v27 = strdup((const char *)__s1);
LABEL_148:
      __orc_rt::Error::assertIsChecked(v29);
      goto LABEL_149;
    }
    BOOL v59 = 1;
    if (v46 >= 3) {
      BOOL v59 = (v46 & (v46 - 1)) != 0;
    }
    unint64_t v60 = v59 | (2 * v46);
    unint64_t v61 = vcvtps_u32_f32(v57 / v58);
    if (v60 <= v61) {
      int8x8_t prime = (int8x8_t)v61;
    }
    else {
      int8x8_t prime = (int8x8_t)v60;
    }
    if (*(void *)&prime == 1)
    {
      int8x8_t prime = (int8x8_t)2;
    }
    else if ((*(void *)&prime & (*(void *)&prime - 1)) != 0)
    {
      int8x8_t prime = (int8x8_t)std::__next_prime(*(void *)&prime);
      unint64_t v46 = *(void *)(v5 + 112);
    }
    if (*(void *)&prime > v46) {
      goto LABEL_94;
    }
    if (*(void *)&prime < v46)
    {
      unint64_t v69 = vcvtps_u32_f32((float)*(unint64_t *)(v5 + 128) / *(float *)(v5 + 136));
      if (v46 < 3 || (uint8x8_t v70 = (uint8x8_t)vcnt_s8((int8x8_t)v46), v70.i16[0] = vaddlv_u8(v70), v70.u32[0] > 1uLL))
      {
        unint64_t v69 = std::__next_prime(v69);
      }
      else
      {
        uint64_t v71 = 1 << -(char)__clz(v69 - 1);
        if (v69 >= 2) {
          unint64_t v69 = v71;
        }
      }
      if (*(void *)&prime <= v69) {
        int8x8_t prime = (int8x8_t)v69;
      }
      if (*(void *)&prime >= v46)
      {
        unint64_t v46 = *(void *)(v5 + 112);
      }
      else
      {
        if (prime)
        {
LABEL_94:
          if (*(void *)&prime >> 61) {
LABEL_162:
          }
            std::__throw_bad_array_new_length[abi:nn180100]();
          v63 = operator new(8 * *(void *)&prime);
          v64 = *(void **)(v5 + 104);
          *(void *)(v5 + 104) = v63;
          if (v64) {
            operator delete(v64);
          }
          uint64_t v65 = 0;
          *(int8x8_t *)(v5 + 112) = prime;
          do
            *(void *)(*(void *)(v5 + 104) + 8 * v65++) = 0;
          while (*(void *)&prime != v65);
          v66 = (void *)*v56;
          if (*v56)
          {
            unint64_t v67 = v66[1];
            uint8x8_t v68 = (uint8x8_t)vcnt_s8(prime);
            v68.i16[0] = vaddlv_u8(v68);
            if (v68.u32[0] > 1uLL)
            {
              if (v67 >= *(void *)&prime) {
                v67 %= *(void *)&prime;
              }
            }
            else
            {
              v67 &= *(void *)&prime - 1;
            }
            *(void *)(*(void *)(v5 + 104) + 8 * v67) = v56;
            v72 = (void *)*v66;
            if (*v66)
            {
              do
              {
                unint64_t v73 = v72[1];
                if (v68.u32[0] > 1uLL)
                {
                  if (v73 >= *(void *)&prime) {
                    v73 %= *(void *)&prime;
                  }
                }
                else
                {
                  v73 &= *(void *)&prime - 1;
                }
                if (v73 != v67)
                {
                  uint64_t v74 = *(void *)(v5 + 104);
                  if (!*(void *)(v74 + 8 * v73))
                  {
                    *(void *)(v74 + 8 * v73) = v66;
                    goto LABEL_119;
                  }
                  void *v66 = *v72;
                  void *v72 = **(void **)(*(void *)(v5 + 104) + 8 * v73);
                  **(void **)(*(void *)(v5 + 104) + 8 * v73) = v72;
                  v72 = v66;
                }
                unint64_t v73 = v67;
LABEL_119:
                v66 = v72;
                v72 = (void *)*v72;
                unint64_t v67 = v73;
              }
              while (v72);
            }
          }
          unint64_t v46 = (unint64_t)prime;
          goto LABEL_123;
        }
        v82 = *(void **)(v5 + 104);
        *(void *)(v5 + 104) = 0;
        if (v82) {
          operator delete(v82);
        }
        unint64_t v46 = 0;
        *(void *)(v5 + 112) = 0;
      }
    }
LABEL_123:
    if ((v46 & (v46 - 1)) != 0)
    {
      if (v45 >= v46) {
        unint64_t v4 = v45 % v46;
      }
      else {
        unint64_t v4 = v45;
      }
    }
    else
    {
      unint64_t v4 = (v46 - 1) & v45;
    }
    goto LABEL_128;
  }
LABEL_22:
  char v27 = strdup("Failed to deserialize allocation actions");
LABEL_150:
  __s1[0] = (char *)&v88;
  std::vector<__orc_rt::AllocationActionsPair>::__destroy_vector::operator()[abi:nn180100]((void ***)__s1);
  return v27;
}

unint64_t __xojit_executor_write_mem(unint64_t *a1, unint64_t a2)
{
  unint64_t v4 = qword_26B420070;
  if (os_log_type_enabled((os_log_t)qword_26B420070, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_262716000, v4, OS_LOG_TYPE_DEBUG, "write_mem", buf, 2u);
  }
  v42[0] = 0;
  v42[1] = 0;
  v43[0] = 0;
  unint64_t v5 = a2 - 8;
  if (a2 >= 8)
  {
    unint64_t v6 = *a1;
    v40 = (uint64_t *)(a1 + 1);
    unint64_t v41 = v5;
    if (!v6) {
      return v6;
    }
    if (v6 >> 59) {
LABEL_41:
    }
      abort();
    unint64_t v51 = v43;
    uint64_t v7 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<__orc_rt::RemoteSymbolLookupSetElement>>(v6);
    int64x2_t v9 = vdupq_n_s64((unint64_t)v42[1]);
    v42[0] = v7;
    v42[1] = v7;
    int64x2_t v49 = v9;
    char v10 = (char *)v43[0];
    v43[0] = &v7[32 * v8];
    unint64_t v50 = v10;
    *(void *)buf = v9.i64[0];
    std::__split_buffer<std::pair<__orc_rt::ExecutorAddr,std::vector<char>>>::~__split_buffer((uint64_t)buf);
    uint64_t v11 = 0;
    while (1)
    {
      __p = 0;
      uint64_t v46 = 0;
      uint64_t v47 = 0;
      if (v41 < 8) {
        break;
      }
      uint64_t v12 = *v40++;
      v41 -= 8;
      uint64_t v44 = v12;
      int v13 = __orc_rt::SPSSerializationTraits<__orc_rt::SPSSequence<char>,std::vector<char>,void>::deserialize((uint64_t)&v40, (unint64_t *)&__p);
      long long v14 = __p;
      if (!v13)
      {
        if (__p) {
          operator delete(__p);
        }
        break;
      }
      uint64_t v15 = v44;
      uint64_t v17 = v46;
      uint64_t v16 = v47;
      uint64_t v18 = v42[1];
      if (v42[1] >= (void *)v43[0])
      {
        int64_t v20 = ((char *)v42[1] - (char *)v42[0]) >> 5;
        unint64_t v21 = v20 + 1;
        if ((unint64_t)(v20 + 1) >> 59) {
          goto LABEL_41;
        }
        int64_t v22 = v43[0] - (unint64_t)v42[0];
        if ((uint64_t)(v43[0] - (unint64_t)v42[0]) >> 4 > v21) {
          unint64_t v21 = v22 >> 4;
        }
        if ((unint64_t)v22 >= 0x7FFFFFFFFFFFFFE0) {
          unint64_t v23 = 0x7FFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v23 = v21;
        }
        unint64_t v51 = v43;
        uint64_t v24 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<__orc_rt::RemoteSymbolLookupSetElement>>(v23);
        size_t v25 = &v24[32 * v20];
        *(void *)buf = v24;
        v49.i64[0] = (uint64_t)v25;
        unint64_t v50 = &v24[32 * v26];
        *(void *)size_t v25 = v15;
        *((void *)v25 + 1) = v14;
        *((void *)v25 + 2) = 0;
        *((void *)v25 + 3) = v16;
        *((void *)v25 + 2) = v17;
        unint64_t v19 = (const void **)(v25 + 32);
        v49.i64[1] = (uint64_t)(v25 + 32);
        uint64_t v28 = (char *)v42[0];
        char v27 = (char *)v42[1];
        unint64_t v29 = (char *)v49.i64[0];
        if (v42[1] == v42[0])
        {
          int64x2_t v33 = vdupq_n_s64((unint64_t)v42[1]);
        }
        else
        {
          uint64_t v30 = 0;
          do
          {
            unint64_t v31 = &v29[v30];
            unint64_t v32 = &v27[v30];
            *((void *)v31 - 4) = *(void *)&v27[v30 - 32];
            *((void *)v31 - 3) = 0;
            *((void *)v31 - 2) = 0;
            *((void *)v31 - 1) = 0;
            *(_OWORD *)(v31 - 24) = *(_OWORD *)&v27[v30 - 24];
            *((void *)v31 - 1) = *(void *)&v27[v30 - 8];
            *((void *)v32 - 3) = 0;
            *((void *)v32 - 2) = 0;
            *((void *)v32 - 1) = 0;
            v30 -= 32;
          }
          while (&v27[v30] != v28);
          int64x2_t v33 = *(int64x2_t *)v42;
          unint64_t v19 = (const void **)v49.i64[1];
          v29 += v30;
        }
        v42[0] = v29;
        v42[1] = v19;
        int64x2_t v49 = v33;
        uint64_t v34 = (char *)v43[0];
        v43[0] = v50;
        unint64_t v50 = v34;
        *(void *)buf = v33.i64[0];
        std::__split_buffer<std::pair<__orc_rt::ExecutorAddr,std::vector<char>>>::~__split_buffer((uint64_t)buf);
      }
      else
      {
        *(void *)v42[1] = v44;
        v18[1] = v14;
        unint64_t v19 = (const void **)(v18 + 4);
        v18[2] = v17;
        void v18[3] = v16;
      }
      v42[1] = v19;
      if (++v11 == v6)
      {
        char v35 = (const void **)v42[0];
        if (v42[0] != v19)
        {
          do
          {
            memcpy((void *)*v35, v35[1], (unsigned char *)v35[2] - (unsigned char *)v35[1]);
            v35 += 4;
          }
          while (v35 != v19);
          unint64_t v6 = 0;
          goto LABEL_31;
        }
        unint64_t v6 = 0;
        if (v19) {
          goto LABEL_32;
        }
        return v6;
      }
    }
  }
  __orc_rt::WrapperFunctionResult::createOutOfBandError((__orc_rt::WrapperFunctionResult *)buf, "Could not deserialize arguments");
  unint64_t v6 = *(void *)buf;
LABEL_31:
  unint64_t v19 = (const void **)v42[0];
  if (v42[0])
  {
LABEL_32:
    uint64_t v36 = (const void **)v42[1];
    uint64_t v37 = v19;
    if (v42[1] != v19)
    {
      do
      {
        uint64_t v38 = (void *)*(v36 - 3);
        if (v38)
        {
          *(v36 - 2) = v38;
          operator delete(v38);
        }
        v36 -= 4;
      }
      while (v36 != v19);
      uint64_t v37 = (const void **)v42[0];
    }
    v42[1] = v19;
    operator delete(v37);
  }
  return v6;
}

char *__orc_rt::WrapperFunctionResult::createOutOfBandError(__orc_rt::WrapperFunctionResult *this, const char *__s)
{
  size_t v4 = strlen(__s);
  unint64_t v5 = (char *)malloc_type_malloc(v4 + 1, 0xBD88B51uLL);
  uint64_t result = strcpy(v5, __s);
  *(void *)this = result;
  *((void *)this + 1) = 0;
  return result;
}

uint64_t __xojit_executor_epc_run_as_main()
{
  uint64_t v0 = qword_26B420070;
  if (os_log_type_enabled((os_log_t)qword_26B420070, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)uint64_t v2 = 0;
    _os_log_debug_impl(&dword_262716000, v0, OS_LOG_TYPE_DEBUG, "runAsMain", v2, 2u);
  }
  return 0;
}

uint64_t __xojit_executor_epc_run_as_void()
{
  uint64_t v0 = qword_26B420070;
  if (os_log_type_enabled((os_log_t)qword_26B420070, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)uint64_t v2 = 0;
    _os_log_debug_impl(&dword_262716000, v0, OS_LOG_TYPE_DEBUG, "runAsVoid", v2, 2u);
  }
  return 0;
}

uint64_t __xojit_executor_epc_run_as_int()
{
  uint64_t v0 = qword_26B420070;
  if (os_log_type_enabled((os_log_t)qword_26B420070, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)uint64_t v2 = 0;
    _os_log_debug_impl(&dword_262716000, v0, OS_LOG_TYPE_DEBUG, "runAsInt", v2, 2u);
  }
  return 0;
}

void xojit_executor_set_run_program_on_main_thread(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = qword_26B420078;
  if (!qword_26B420078
    || (std::mutex::lock((std::mutex *)(qword_26B420078 + 24)), (*(unsigned char *)(v2 + 136) & 1) != 0)
    || (v7.__ptr_ = 0, uint64_t v5 = *(void *)(v2 + 16), std::exception_ptr::~exception_ptr(&v7), v5))
  {
    uint64_t v6 = std::__throw_future_error[abi:nn180100]();
    __xojit_executor_run_program_on_main_thread(v6);
  }
  else
  {
    *(void *)(v2 + 144) = a1;
    *(void *)(v2 + 152) = a2;
    *(_DWORD *)(v2 + 136) |= 5u;
    std::condition_variable::notify_all((std::condition_variable *)(v2 + 88));
    std::mutex::unlock((std::mutex *)(v2 + 24));
  }
}

uint64_t __xojit_executor_run_program_on_main_thread(void *a1, unint64_t a2)
{
  uint64_t v3 = (std::__assoc_sub_state *)qword_26B420078;
  if (!qword_26B420078
    || (p_exception = (const std::exception_ptr *)(qword_26B420078 + 24),
        std::mutex::lock((std::mutex *)(qword_26B420078 + 24)),
        unsigned int state = v3->__state_,
        (state & 2) != 0))
  {
    std::__throw_future_error[abi:nn180100]();
  }
  else
  {
    atomic_fetch_add_explicit(&v3->__shared_owners_, 1uLL, memory_order_relaxed);
    v3->__state_ = state | 2;
    std::mutex::unlock(&v3->__mut_);
    __lk.__m_ = &v3->__mut_;
    __lk.__owns_ = 1;
    std::mutex::lock(&v3->__mut_);
    std::__assoc_sub_state::__sub_wait(v3, &__lk);
    p_exception = &v3->__exception_;
    ptr = v3->__exception_.__ptr_;
    v12.__ptr_ = 0;
    std::exception_ptr::~exception_ptr(&v12);
    if (!ptr)
    {
      uint64_t v8 = v3[1].__vftable;
      shared_owners = (void (*)(std::__assoc_sub_state_vtbl *, void, void *, unint64_t))v3[1].__shared_owners_;
      if (__lk.__owns_) {
        std::mutex::unlock(__lk.__m_);
      }
      if (!atomic_fetch_add(&v3->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL)) {
        ((void (*)(std::__assoc_sub_state *))v3->__on_zero_shared)(v3);
      }
      if (a2 < 8) {
        __orc_rt::WrapperFunctionResult::createOutOfBandError((__orc_rt::WrapperFunctionResult *)&__lk, "Could not serialize result");
      }
      else {
        shared_owners(v8, *a1, a1 + 1, a2 - 8);
      }
      operator new();
    }
  }
  std::exception_ptr::exception_ptr(&v12, p_exception);
  v10.__ptr_ = &v12;
  std::rethrow_exception(v10);
  return __xojit_executor_run_program_wrapper();
}

uint64_t __xojit_executor_run_program_wrapper(uint64_t a1, uint64_t a2)
{
  uint64_t v93 = *MEMORY[0x263EF8340];
  size_t v4 = qword_26B420070;
  if (os_log_type_enabled((os_log_t)qword_26B420070, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_262716000, v4, OS_LOG_TYPE_DEFAULT, "__xojit_executor_run_program_wrapper", buf, 2u);
  }
  v87 = 0;
  long long v85 = 0u;
  *(_OWORD *)__p = 0u;
  *(_OWORD *)buf = 0u;
  *(_OWORD *)v84 = 0u;
  *(void *)unint64_t v90 = a1;
  *(void *)&v90[8] = a2;
  if (!__orc_rt::SPSSerializationTraits<__orc_rt::SPSSequence<char>,std::string,void>::deserialize((uint64_t)v90, (std::string *)buf)|| !__orc_rt::SPSSerializationTraits<__orc_rt::SPSSequence<char>,std::string,void>::deserialize((uint64_t)v90, (std::string *)&v84[1])|| *(void *)&v90[8] < 8uLL)
  {
LABEL_43:
    __orc_rt::WrapperFunctionResult::createOutOfBandError((__orc_rt::WrapperFunctionResult *)v90, "Could not deserialize arguments for wrapper function call");
    goto LABEL_44;
  }
  unint64_t v5 = **(void **)v90;
  *(void *)v90 += 8;
  *(void *)&v90[8] -= 8;
  if (v5 > (v87 - (char *)__p[0]) >> 4)
  {
    if (v5 >> 60) {
      goto LABEL_126;
    }
    int64_t v6 = (char *)__p[1] - (char *)__p[0];
    std::exception_ptr v7 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<__orc_rt::ExecutorSymbolDef>>(v5);
    uint64_t v8 = &v7[v6 & 0xFFFFFFFFFFFFFFF0];
    std::exception_ptr v10 = &v7[16 * v9];
    std::exception_ptr v12 = (char *)__p[0];
    uint64_t v11 = (char *)__p[1];
    int v13 = v8;
    if (__p[1] != __p[0])
    {
      do
      {
        *((_OWORD *)v13 - 1) = *((_OWORD *)v11 - 1);
        v13 -= 16;
        v11 -= 16;
      }
      while (v11 != v12);
      uint64_t v11 = (char *)__p[0];
    }
    __p[0] = v13;
    __p[1] = v8;
    v87 = v10;
    if (v11) {
      operator delete(v11);
    }
  }
  if (v5)
  {
    uint64_t v14 = 0;
    do
    {
      unint64_t v15 = *(void *)&v90[8] - 8;
      if (*(void *)&v90[8] < 8uLL) {
        goto LABEL_43;
      }
      uint64_t v16 = **(void **)v90;
      BOOL v17 = v15 >= **(void **)v90;
      unint64_t v18 = v15 - **(void **)v90;
      if (!v17) {
        goto LABEL_43;
      }
      uint64_t v19 = *(void *)v90 + 8;
      *(void *)v90 += 8 + v16;
      *(void *)&v90[8] = v18;
      int64_t v20 = __p[1];
      if (__p[1] >= v87)
      {
        int64_t v22 = ((char *)__p[1] - (char *)__p[0]) >> 4;
        unint64_t v23 = v22 + 1;
        if ((unint64_t)(v22 + 1) >> 60) {
          goto LABEL_126;
        }
        uint64_t v24 = v87 - (char *)__p[0];
        if ((v87 - (char *)__p[0]) >> 3 > v23) {
          unint64_t v23 = v24 >> 3;
        }
        if ((unint64_t)v24 >= 0x7FFFFFFFFFFFFFF0) {
          unint64_t v25 = 0xFFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v25 = v23;
        }
        if (v25) {
          unint64_t v25 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<__orc_rt::ExecutorSymbolDef>>(v25);
        }
        else {
          uint64_t v26 = 0;
        }
        char v27 = (uint64_t *)(v25 + 16 * v22);
        *char v27 = v19;
        v27[1] = v16;
        unint64_t v29 = (char *)__p[0];
        uint64_t v28 = (char *)__p[1];
        uint64_t v30 = v27;
        if (__p[1] != __p[0])
        {
          do
          {
            *((_OWORD *)v30 - 1) = *((_OWORD *)v28 - 1);
            v30 -= 2;
            v28 -= 16;
          }
          while (v28 != v29);
          uint64_t v28 = (char *)__p[0];
        }
        unint64_t v21 = v27 + 2;
        __p[0] = v30;
        __p[1] = v27 + 2;
        v87 = (char *)(v25 + 16 * v26);
        if (v28) {
          operator delete(v28);
        }
      }
      else
      {
        *(void *)__p[1] = v19;
        v20[1] = v16;
        unint64_t v21 = v20 + 2;
      }
      __p[1] = v21;
    }
    while (++v14 != v5);
  }
  unint64_t v31 = qword_26B420070;
  if (os_log_type_enabled((os_log_t)qword_26B420070, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unint64_t v90 = 0;
    _os_log_impl(&dword_262716000, v31, OS_LOG_TYPE_DEFAULT, "__xojit_executor_run_program_wrapper -- CB", v90, 2u);
  }
  v88[0] = 0;
  v88[1] = 0;
  v89 = 0;
  unint64_t v32 = __p[0];
  int64x2_t v33 = __p[1];
  int64_t v34 = (char *)__p[1] - (char *)__p[0];
  if (__p[1] != __p[0])
  {
    if (v34 < 0) {
      goto LABEL_126;
    }
    long long v92 = &v89;
    char v35 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<__orc_rt::ExecutorAddr>>(v34 >> 4);
    uint64_t v38 = v88[0];
    uint64_t v37 = v88[1];
    if (v88[1] == v88[0])
    {
      int64x2_t v41 = vdupq_n_s64((unint64_t)v88[1]);
      char v39 = v35;
    }
    else
    {
      char v39 = v35;
      do
      {
        uint64_t v40 = *--v37;
        *uint64_t v37 = 0;
        *((void *)v39 - 1) = v40;
        v39 -= 8;
      }
      while (v37 != v38);
      int64x2_t v41 = *(int64x2_t *)v88;
    }
    v88[0] = v39;
    v88[1] = v35;
    *(int64x2_t *)&v90[8] = v41;
    unint64_t v43 = v89;
    v89 = &v35[8 * v36];
    v91 = v43;
    *(void *)unint64_t v90 = v41.i64[0];
    std::__split_buffer<std::unique_ptr<char []>>::~__split_buffer((uint64_t)v90);
    unint64_t v32 = __p[0];
    int64x2_t v33 = __p[1];
  }
  if (v32 != v33) {
    operator new[]();
  }
  uint64_t v44 = (uint64_t *)v88[0];
  unint64_t v45 = (uint64_t *)v88[1];
  int64_t v46 = ((char *)v88[1] - (char *)v88[0]) >> 3;
  unint64_t v47 = v46 + 1;
  if (v46 == -1)
  {
    int64_t v48 = 0;
    int64x2_t v49 = 0;
  }
  else
  {
    if (v47 >> 61) {
      goto LABEL_126;
    }
    int64_t v48 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<__orc_rt::ExecutorAddr>>(v47);
    int64x2_t v49 = &v48[8 * v50];
    uint64_t v44 = (uint64_t *)v88[0];
    unint64_t v45 = (uint64_t *)v88[1];
  }
  if (v44 == v45)
  {
    v53 = v48;
  }
  else
  {
    unint64_t v51 = v48;
    do
    {
      uint64_t v52 = *v44;
      if (v51 >= v49)
      {
        uint64_t v54 = (v51 - v48) >> 3;
        unint64_t v55 = v54 + 1;
        if ((unint64_t)(v54 + 1) >> 61) {
          goto LABEL_126;
        }
        if ((v49 - v48) >> 2 > v55) {
          unint64_t v55 = (v49 - v48) >> 2;
        }
        if ((unint64_t)(v49 - v48) >= 0x7FFFFFFFFFFFFFF8) {
          unint64_t v56 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v56 = v55;
        }
        if (v56) {
          unint64_t v56 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<__orc_rt::ExecutorAddr>>(v56);
        }
        else {
          uint64_t v57 = 0;
        }
        float v58 = (char *)(v56 + 8 * v54);
        *(void *)float v58 = v52;
        v53 = v58 + 8;
        while (v51 != v48)
        {
          uint64_t v59 = *((void *)v51 - 1);
          v51 -= 8;
          *((void *)v58 - 1) = v59;
          v58 -= 8;
        }
        int64x2_t v49 = (char *)(v56 + 8 * v57);
        if (v48) {
          operator delete(v48);
        }
        int64_t v48 = v58;
      }
      else
      {
        *(void *)unint64_t v51 = v52;
        v53 = v51 + 8;
      }
      ++v44;
      unint64_t v51 = v53;
    }
    while (v44 != v45);
  }
  if (v53 < v49)
  {
    *(void *)v53 = 0;
    unint64_t v60 = v53 + 8;
    unint64_t v61 = 0x26B420000;
    v62 = (const char *)&v84[1];
    goto LABEL_97;
  }
  uint64_t v63 = (v53 - v48) >> 3;
  unint64_t v64 = v63 + 1;
  unint64_t v61 = 0x26B420000uLL;
  v62 = (const char *)&v84[1];
  if ((unint64_t)(v63 + 1) >> 61) {
LABEL_126:
  }
    abort();
  if ((v49 - v48) >> 2 > v64) {
    unint64_t v64 = (v49 - v48) >> 2;
  }
  if ((unint64_t)(v49 - v48) >= 0x7FFFFFFFFFFFFFF8) {
    unint64_t v65 = 0x1FFFFFFFFFFFFFFFLL;
  }
  else {
    unint64_t v65 = v64;
  }
  if (v65) {
    unint64_t v65 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<__orc_rt::ExecutorAddr>>(v65);
  }
  v66 = (char *)(v65 + 8 * v63);
  *(void *)v66 = 0;
  unint64_t v60 = v66 + 8;
  while (v53 != v48)
  {
    uint64_t v67 = *((void *)v53 - 1);
    v53 -= 8;
    *((void *)v66 - 1) = v67;
    v66 -= 8;
  }
  if (v48) {
    operator delete(v48);
  }
  int64_t v48 = v66;
LABEL_97:
  if (SHIBYTE(v84[0]) >= 0) {
    uint8x8_t v68 = buf;
  }
  else {
    uint8x8_t v68 = *(uint8_t **)buf;
  }
  if (v85 < 0) {
    v62 = (const char *)v84[1];
  }
  unint64_t v69 = *(NSObject **)(v61 + 112);
  if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)unint64_t v90 = 136315650;
    *(void *)&v90[4] = v68;
    *(_WORD *)&v90[12] = 2080;
    *(void *)&v90[14] = v62;
    *(_WORD *)&v90[22] = 1024;
    LODWORD(v91) = ((unint64_t)(v60 - v48) >> 3) - 1;
    _os_log_impl(&dword_262716000, v69, OS_LOG_TYPE_DEFAULT, "__xojit_executor_run_program %s %s %d", v90, 0x1Cu);
  }
  uint8x8_t v70 = dlopen((const char *)v68, 1);
  if (v70)
  {
    uint64_t v71 = (uint64_t (*)(void, char *))dlsym(v70, v62);
    v72 = *(NSObject **)(v61 + 112);
    if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)unint64_t v90 = 134217984;
      *(void *)&v90[4] = v71;
      _os_log_impl(&dword_262716000, v72, OS_LOG_TYPE_DEFAULT, "  Main = %p", v90, 0xCu);
    }
    if (v71)
    {
      int v73 = v71(((unint64_t)(v60 - v48) >> 3) - 1, v48);
      uint64_t v74 = *(NSObject **)(v61 + 112);
      if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)unint64_t v90 = 67109120;
        *(_DWORD *)&v90[4] = v73;
        _os_log_impl(&dword_262716000, v74, OS_LOG_TYPE_DEFAULT, "  Result = %d", v90, 8u);
      }
      uint64_t v75 = v73;
      goto LABEL_116;
    }
    v76 = *(NSObject **)(v61 + 112);
    if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_114;
    }
  }
  else
  {
    v76 = *(NSObject **)(v61 + 112);
    if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
    {
LABEL_114:
      v77 = dlerror();
      *(_DWORD *)unint64_t v90 = 136315138;
      *(void *)&v90[4] = v77;
      _os_log_impl(&dword_262716000, v76, OS_LOG_TYPE_DEFAULT, "%s", v90, 0xCu);
    }
  }
  uint64_t v75 = -1;
LABEL_116:
  if (v48) {
    operator delete(v48);
  }
  unint64_t v78 = v88[0];
  if (v88[0])
  {
    uint64_t v79 = v88[1];
    v80 = v88[0];
    if (v88[1] != v88[0])
    {
      do
      {
        uint64_t v82 = *--v79;
        uint64_t v81 = v82;
        *uint64_t v79 = 0;
        if (v82) {
          MEMORY[0x263E50FA0](v81, 0x1000C8077774924);
        }
      }
      while (v79 != v78);
      v80 = v88[0];
    }
    v88[1] = v78;
    operator delete(v80);
  }
  *(void *)unint64_t v90 = v75;
  *(void *)&v90[8] = 8;
LABEL_44:
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  if (SHIBYTE(v85) < 0) {
    operator delete(v84[1]);
  }
  if (SHIBYTE(v84[0]) < 0) {
    operator delete(*(void **)buf);
  }
  return *(void *)v90;
}

uint64_t __xojit_run_wrapper(uint64_t (*a1)(uint64_t, uint64_t), uint64_t a2, uint64_t a3)
{
  return a1(a2, a3);
}

uint64_t llvm_orc_registerJITLoaderGDBAllocAction(uint64_t a1, unint64_t a2)
{
  if (a2 >= 8 && a2 != 16 && (a2 & 0xFFFFFFFFFFFFFFF8) != 8) {
    operator new();
  }
  __orc_rt::WrapperFunctionResult::createOutOfBandError((__orc_rt::WrapperFunctionResult *)&v3, "Could not deserialize arguments for wrapper function call");
  return v3;
}

uint64_t xojit_executor_is_sandboxed()
{
  uint64_t v0 = getpid();
  return MEMORY[0x270EDB290](v0, 0, 0);
}

uint64_t xojit_executor_use_oopjit()
{
  return 1;
}

xpc_object_t xojit_create_setup_message(std::string::value_type *__s, void *a2, char a3, char a4, uint64_t a5, unint64_t a6, uint64_t a7, uint64_t a8)
{
  v111[40] = *MEMORY[0x263EF8340];
  memset(&v103, 0, sizeof(v103));
  *(_OWORD *)v105 = 0u;
  *(_OWORD *)v106 = 0u;
  int v107 = 1065353216;
  *(_OWORD *)__p = 0u;
  *(_OWORD *)v109 = 0u;
  float v110 = 1.0;
  std::string::__assign_external(&v103, __s);
  uint64_t v13 = 0;
  v104 = a2;
  v111[0] = "__llvm_orc_SimpleRemoteEPC_dispatch_fn";
  v111[1] = a5;
  v111[2] = "__llvm_orc_SimpleRemoteEPC_dispatch_ctx";
  v111[3] = a6;
  v111[4] = "__xojit_xpcmemmgr_instance";
  v111[5] = a7;
  v111[6] = "__xojit_xpcmemmgr_acquire_slab";
  v111[7] = xojit_xpcmemmgr_acquire_slab;
  v111[8] = "__xojit_xpcmemmgr_release_slab";
  v111[9] = xojit_xpcmemmgr_release_slab;
  v111[10] = "__xojit_xpcmemmgr_deallocate";
  v111[11] = xojit_xpcmemmgr_deallocate;
  v111[12] = "__xojit_xpcmemmgr_make_read_only";
  v111[13] = xojit_xpcmemmgr_make_read_only;
  v111[14] = "__xojit_xpcmemmgr_apply_sandbox_extension";
  v111[15] = xojit_xpcmemmgr_apply_sandbox_extension;
  v111[16] = "__xojit_memaccess_write_uint8s";
  v111[17] = xojit_memaccess_write_uints_wrapper<unsigned char>;
  v111[18] = "__xojit_memaccess_write_uint16s";
  v111[19] = xojit_memaccess_write_uints_wrapper<unsigned short>;
  v111[20] = "__xojit_memaccess_write_uint32s";
  v111[21] = xojit_memaccess_write_uints_wrapper<unsigned int>;
  v111[22] = "__xojit_memaccess_write_uint64s";
  v111[23] = xojit_memaccess_write_uints_wrapper<unsigned long long>;
  v111[24] = "__xojit_memaccess_write_buffers";
  v111[25] = xojit_memaccess_write_buffers_wrapper;
  v111[26] = "__llvm_orc_SimpleExecutorDylibManager_Instance";
  v111[27] = a8;
  v111[28] = "__llvm_orc_SimpleExecutorDylibManager_open_wrapper";
  v111[29] = xojit_dylibmgr_dlopen_wrapper;
  v111[30] = "__llvm_orc_SimpleExecutorDylibManager_lookup_wrapper";
  v111[31] = xojit_dylibmgr_dlsym_wrapper;
  v111[32] = "__llvm_orc_bootstrap_run_as_main_wrapper";
  v111[33] = __xojit_executor_epc_run_as_main;
  v111[34] = "__llvm_orc_bootstrap_run_as_void_function_wrapper";
  v111[35] = __xojit_executor_epc_run_as_void;
  v111[36] = "__llvm_orc_bootstrap_run_as_int_function_wrapper";
  v111[37] = __xojit_executor_epc_run_as_int;
  v111[38] = "_llvm_orc_registerJITLoaderGDBAllocAction";
  v111[39] = llvm_orc_registerJITLoaderGDBAllocAction;
  do
  {
    uint64_t v14 = (char **)&v111[2 * v13];
    unint64_t v15 = v14[1];
    std::string::basic_string[abi:nn180100]<0>(v101, *v14);
    char v16 = HIBYTE(v102);
    if (v102 >= 0) {
      BOOL v17 = (uint64_t *)v101;
    }
    else {
      BOOL v17 = (uint64_t *)v101[0];
    }
    if (v102 >= 0) {
      unint64_t v18 = HIBYTE(v102);
    }
    else {
      unint64_t v18 = (unint64_t)v101[1];
    }
    unint64_t v19 = std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:nn180100](v17, v18);
    unint64_t v20 = v19;
    unint64_t v21 = (unint64_t)__p[1];
    if (__p[1])
    {
      uint8x8_t v22 = (uint8x8_t)vcnt_s8((int8x8_t)__p[1]);
      v22.i16[0] = vaddlv_u8(v22);
      unint64_t v23 = v22.u32[0];
      if (v22.u32[0] > 1uLL)
      {
        a6 = v19;
        if ((void *)v19 >= __p[1]) {
          a6 = v19 % (unint64_t)__p[1];
        }
      }
      else
      {
        a6 = ((unint64_t)__p[1] - 1) & v19;
      }
      uint64_t v24 = (unsigned __int8 **)*((void *)__p[0] + a6);
      if (v24)
      {
        for (i = *v24; i; i = *(unsigned __int8 **)i)
        {
          unint64_t v26 = *((void *)i + 1);
          if (v26 == v20)
          {
            if (std::equal_to<std::string>::operator()[abi:nn180100](i + 16, (unsigned __int8 *)v101)) {
              goto LABEL_80;
            }
          }
          else
          {
            if (v23 > 1)
            {
              if (v26 >= v21) {
                v26 %= v21;
              }
            }
            else
            {
              v26 &= v21 - 1;
            }
            if (v26 != a6) {
              break;
            }
          }
        }
      }
    }
    i = (unsigned __int8 *)operator new(0x30uLL);
    *(void *)i = 0;
    *((void *)i + 1) = v20;
    *((_OWORD *)i + 1) = *(_OWORD *)v101;
    uint64_t v27 = v102;
    v101[0] = 0;
    v101[1] = 0;
    uint64_t v102 = 0;
    *((void *)i + 4) = v27;
    *((void *)i + 5) = 0;
    float v28 = (float)((unint64_t)v109[1] + 1);
    if (!v21 || (float)(v110 * (float)v21) < v28)
    {
      BOOL v29 = (v21 & (v21 - 1)) != 0;
      if (v21 < 3) {
        BOOL v29 = 1;
      }
      unint64_t v30 = v29 | (2 * v21);
      unint64_t v31 = vcvtps_u32_f32(v28 / v110);
      if (v30 <= v31) {
        int8x8_t prime = (int8x8_t)v31;
      }
      else {
        int8x8_t prime = (int8x8_t)v30;
      }
      if (*(void *)&prime == 1)
      {
        int8x8_t prime = (int8x8_t)2;
      }
      else if ((*(void *)&prime & (*(void *)&prime - 1)) != 0)
      {
        int8x8_t prime = (int8x8_t)std::__next_prime(*(void *)&prime);
        unint64_t v21 = (unint64_t)__p[1];
      }
      if (*(void *)&prime > v21) {
        goto LABEL_36;
      }
      if (*(void *)&prime < v21)
      {
        unint64_t v39 = vcvtps_u32_f32((float)(unint64_t)v109[1] / v110);
        if (v21 < 3 || (uint8x8_t v40 = (uint8x8_t)vcnt_s8((int8x8_t)v21), v40.i16[0] = vaddlv_u8(v40), v40.u32[0] > 1uLL))
        {
          unint64_t v39 = std::__next_prime(v39);
        }
        else
        {
          uint64_t v41 = 1 << -(char)__clz(v39 - 1);
          if (v39 >= 2) {
            unint64_t v39 = v41;
          }
        }
        if (*(void *)&prime <= v39) {
          int8x8_t prime = (int8x8_t)v39;
        }
        if (*(void *)&prime >= v21)
        {
          unint64_t v21 = (unint64_t)__p[1];
        }
        else
        {
          if (prime)
          {
LABEL_36:
            if (*(void *)&prime >> 61) {
              std::__throw_bad_array_new_length[abi:nn180100]();
            }
            int64x2_t v33 = operator new(8 * *(void *)&prime);
            int64_t v34 = __p[0];
            __p[0] = v33;
            if (v34) {
              operator delete(v34);
            }
            uint64_t v35 = 0;
            __p[1] = (void *)prime;
            do
              *((void *)__p[0] + v35++) = 0;
            while (*(void *)&prime != v35);
            uint64_t v36 = (void **)v109[0];
            if (v109[0])
            {
              unint64_t v37 = *((void *)v109[0] + 1);
              uint8x8_t v38 = (uint8x8_t)vcnt_s8(prime);
              v38.i16[0] = vaddlv_u8(v38);
              if (v38.u32[0] > 1uLL)
              {
                if (v37 >= *(void *)&prime) {
                  v37 %= *(void *)&prime;
                }
              }
              else
              {
                v37 &= *(void *)&prime - 1;
              }
              *((void *)__p[0] + v37) = v109;
              for (j = *v36; j; unint64_t v37 = v43)
              {
                unint64_t v43 = j[1];
                if (v38.u32[0] > 1uLL)
                {
                  if (v43 >= *(void *)&prime) {
                    v43 %= *(void *)&prime;
                  }
                }
                else
                {
                  v43 &= *(void *)&prime - 1;
                }
                if (v43 != v37)
                {
                  if (!*((void *)__p[0] + v43))
                  {
                    *((void *)__p[0] + v43) = v36;
                    goto LABEL_61;
                  }
                  *uint64_t v36 = (void *)*j;
                  void *j = **((void **)__p[0] + v43);
                  **((void **)__p[0] + v43) = j;
                  j = v36;
                }
                unint64_t v43 = v37;
LABEL_61:
                uint64_t v36 = (void **)j;
                j = (void *)*j;
              }
            }
            unint64_t v21 = (unint64_t)prime;
            goto LABEL_65;
          }
          unint64_t v47 = __p[0];
          __p[0] = 0;
          if (v47) {
            operator delete(v47);
          }
          unint64_t v21 = 0;
          __p[1] = 0;
        }
      }
LABEL_65:
      if ((v21 & (v21 - 1)) != 0)
      {
        if (v20 >= v21) {
          a6 = v20 % v21;
        }
        else {
          a6 = v20;
        }
      }
      else
      {
        a6 = (v21 - 1) & v20;
      }
    }
    uint64_t v44 = __p[0];
    unint64_t v45 = (unsigned __int8 **)*((void *)__p[0] + a6);
    if (v45)
    {
      *(void *)i = *v45;
LABEL_78:
      uint64_t *v45 = i;
      goto LABEL_79;
    }
    *(void **)i = v109[0];
    v109[0] = i;
    v44[a6] = v109;
    if (*(void *)i)
    {
      unint64_t v46 = *(void *)(*(void *)i + 8);
      if ((v21 & (v21 - 1)) != 0)
      {
        if (v46 >= v21) {
          v46 %= v21;
        }
      }
      else
      {
        v46 &= v21 - 1;
      }
      unint64_t v45 = (unsigned __int8 **)((char *)__p[0] + 8 * v46);
      goto LABEL_78;
    }
LABEL_79:
    ++v109[1];
    char v16 = HIBYTE(v102);
LABEL_80:
    *((void *)i + 5) = v15;
    if (v16 < 0) {
      operator delete(v101[0]);
    }
    ++v13;
  }
  while (v13 != 20);
  int64_t v48 = operator new(1uLL);
  *int64_t v48 = a4;
  int64x2_t v49 = v48 + 1;
  std::string::basic_string[abi:nn180100]<0>(v101, "IsSandboxed");
  uint64_t v50 = std::__hash_table<std::__hash_value_type<std::string,std::vector<char>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::vector<char>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::vector<char>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::vector<char>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t *)v105, (uint64_t)v101, (uint64_t)v101);
  unint64_t v51 = v50;
  uint64_t v52 = (void *)v50[5];
  if (v52)
  {
    v51[6] = v52;
    operator delete(v52);
  }
  v51[5] = v48;
  v51[6] = v49;
  v51[7] = v49;
  if (SHIBYTE(v102) < 0) {
    operator delete(v101[0]);
  }
  v53 = operator new(1uLL);
  unsigned char *v53 = a3;
  uint64_t v54 = v53 + 1;
  std::string::basic_string[abi:nn180100]<0>(v101, "UseOOPJIT");
  unint64_t v55 = std::__hash_table<std::__hash_value_type<std::string,std::vector<char>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::vector<char>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::vector<char>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::vector<char>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t *)v105, (uint64_t)v101, (uint64_t)v101);
  unint64_t v56 = (void *)v55[5];
  if (v56)
  {
    v55[6] = v56;
    operator delete(v56);
  }
  v55[5] = v53;
  v55[6] = v54;
  v55[7] = v54;
  if (SHIBYTE(v102) < 0) {
    operator delete(v101[0]);
  }
  std::string::size_type size = HIBYTE(v103.__r_.__value_.__r.__words[2]);
  if ((v103.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
    std::string::size_type size = v103.__r_.__value_.__l.__size_;
  }
  float v58 = v106[0];
  uint64_t v59 = v109[0];
  if (v106[0])
  {
    uint64_t v60 = 8;
    do
    {
      uint64_t v61 = *((unsigned __int8 *)v58 + 39);
      if ((v61 & 0x80u) != 0) {
        uint64_t v61 = v58[3];
      }
      uint64_t v62 = v58[6] - v58[5] + 8;
      if (v58[6] == v58[5]) {
        uint64_t v62 = 8;
      }
      v60 += v61 + v62 + 8;
      float v58 = (void *)*v58;
    }
    while (v58);
  }
  else
  {
    uint64_t v60 = 8;
  }
  uint64_t v63 = 8;
  if (v109[0])
  {
    do
    {
      uint64_t v64 = *((unsigned __int8 *)v59 + 39);
      if ((v64 & 0x80u) != 0) {
        uint64_t v64 = v59[3];
      }
      v63 += v64 + 16;
      uint64_t v59 = (void *)*v59;
    }
    while (v59);
  }
  std::string::size_type v65 = size + v60 + v63;
  v66 = (void *)(v65 + 16);
  if (v65 + 16 < 9) {
    uint64_t v67 = 0;
  }
  else {
    uint64_t v67 = malloc_type_malloc(v65 + 16, 0xB91D0188uLL);
  }
  v101[0] = v67;
  v101[1] = v66;
  uint8x8_t v68 = v101;
  if ((unint64_t)v66 > 8) {
    uint8x8_t v68 = (void **)v67;
  }
  v99 = v68;
  unint64_t v100 = (unint64_t)v66;
  if (!__orc_rt::SPSSerializationTraits<__orc_rt::SPSSequence<char>,std::string,void>::serialize(&v99, (uint64_t)&v103)) {
    goto LABEL_151;
  }
  unint64_t v69 = v100;
  if (v100 < 8) {
    goto LABEL_151;
  }
  uint8x8_t v70 = v99;
  *v99 = v104;
  if ((v69 & 0xFFFFFFFFFFFFFFF8) == 8) {
    goto LABEL_151;
  }
  v70[1] = v106[1];
  uint64_t v71 = v70 + 2;
  unint64_t v72 = v69 - 16;
  v99 = v71;
  unint64_t v100 = v72;
  int v73 = v106[0];
  if (!v106[0])
  {
LABEL_141:
    if (v72 >= 8)
    {
      *uint64_t v71 = v109[1];
      ++v99;
      v100 -= 8;
      v84 = v109[0];
      if (v109[0])
      {
        xpc_object_t empty = 0;
        while (__orc_rt::SPSSerializationTraits<__orc_rt::SPSSequence<char>,std::string,void>::serialize(&v99, (uint64_t)(v84 + 2)))
        {
          unint64_t v85 = v100 - 8;
          if (v100 < 8) {
            break;
          }
          v86 = v99;
          *v99 = (void *)v84[5];
          v99 = v86 + 1;
          unint64_t v100 = v85;
          v84 = (void *)*v84;
          if (!v84) {
            goto LABEL_147;
          }
        }
      }
      else
      {
LABEL_147:
        xpc_object_t empty = xpc_dictionary_create_empty();
        xpc_dictionary_set_uint64(empty, "opd", 0);
        xpc_dictionary_set_uint64(empty, "seq", 0);
        xpc_dictionary_set_uint64(empty, "tag", 0);
        if (v101[1] <= (void *)8) {
          v87 = v101;
        }
        else {
          v87 = (void **)v101[0];
        }
        xpc_dictionary_set_data(empty, "buf", v87, (size_t)v101[1]);
      }
      goto LABEL_152;
    }
LABEL_151:
    xpc_object_t empty = 0;
    goto LABEL_152;
  }
  while (1)
  {
    xpc_object_t empty = 0;
    if (!__orc_rt::SPSSerializationTraits<__orc_rt::SPSSequence<char>,std::string,void>::serialize(&v99, (uint64_t)(v73 + 2)))break; {
    unint64_t v75 = v100;
    }
    unint64_t v72 = v100 - 8;
    if (v100 < 8) {
      break;
    }
    v76 = v99;
    *v99 = (void *)(v73[6] - v73[5]);
    uint64_t v71 = v76 + 1;
    v99 = v71;
    unint64_t v100 = v72;
    uint64_t v78 = v73[5];
    uint64_t v77 = v73[6];
    if (v78 == v77 || v72 == 0)
    {
      if (v78 != v77) {
        goto LABEL_151;
      }
    }
    else
    {
      uint64_t v80 = 0;
      do
      {
        uint64_t v81 = v78 + v80 + 1;
        *((unsigned char *)v71 + v80) = *(unsigned char *)(v78 + v80);
        uint64_t v82 = v80 + 1;
      }
      while (v81 != v77 && v75 - 9 != v80++);
      uint64_t v71 = (void **)((char *)v71 + v82);
      unint64_t v72 = v75 - v82 - 8;
      v99 = v71;
      unint64_t v100 = v72;
      if (v81 != v77) {
        goto LABEL_151;
      }
    }
    int v73 = (void *)*v73;
    if (!v73) {
      goto LABEL_141;
    }
  }
LABEL_152:
  if (v101[1] >= (void *)9)
  {
    v88 = v101[0];
    goto LABEL_156;
  }
  if (!v101[1])
  {
    v88 = v101[0];
    if (v101[0]) {
LABEL_156:
    }
      free(v88);
  }
  v89 = (void **)v109[0];
  if (v109[0])
  {
    do
    {
      unint64_t v90 = (void **)*v89;
      if (*((char *)v89 + 39) < 0) {
        operator delete(v89[2]);
      }
      operator delete(v89);
      v89 = v90;
    }
    while (v90);
  }
  v91 = __p[0];
  __p[0] = 0;
  if (v91) {
    operator delete(v91);
  }
  long long v92 = (char *)v106[0];
  if (v106[0])
  {
    do
    {
      uint64_t v93 = *(char **)v92;
      long long v94 = (void *)*((void *)v92 + 5);
      if (v94)
      {
        *((void *)v92 + 6) = v94;
        operator delete(v94);
      }
      if (v92[39] < 0) {
        operator delete(*((void **)v92 + 2));
      }
      operator delete(v92);
      long long v92 = v93;
    }
    while (v93);
  }
  v95 = v105[0];
  v105[0] = 0;
  if (v95) {
    operator delete(v95);
  }
  if (SHIBYTE(v103.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v103.__r_.__value_.__l.__data_);
  }
  return empty;
}

uint64_t xojit_xpcmemmgr_acquire_slab(const char *a1, unint64_t a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if (a2 < 8 || (a2 & 0xFFFFFFFFFFFFFFF8) == 8)
  {
    __orc_rt::WrapperFunctionResult::createOutOfBandError((__orc_rt::WrapperFunctionResult *)&v4, "Could not deserialize arguments for wrapper function call");
  }
  else
  {
    mach_vm_size_t v2 = *((void *)a1 + 1);
    mach_vm_address_t address = 0;
    if (mach_vm_map(*MEMORY[0x263EF8960], &address, v2, 0, 1, 0, 0, 0, 0, 7, 2u)) {
      operator new();
    }
    mach_vm_address_t v7 = address;
    char v6 = 2;
    char v8 = 0;
    __orc_rt::detail::ResultSerializer<__orc_rt::SPSExpected<__orc_rt::SPSExecutorAddr>,__orc_rt::Expected<__orc_rt::ExecutorAddr>>::serialize((__orc_rt::WrapperFunctionResult *)&v4, (uint64_t)&address);
    __orc_rt::Expected<__orc_rt::ExecutorAddr>::~Expected((uint64_t *)&address);
    __orc_rt::Expected<__orc_rt::ExecutorAddr>::~Expected((uint64_t *)&v7);
  }
  return v4;
}

uint64_t xojit_xpcmemmgr_release_slab(const char *a1, unint64_t a2)
{
  if (a2 < 8 || (a2 & 0xFFFFFFFFFFFFFFF8) == 8)
  {
    __orc_rt::WrapperFunctionResult::createOutOfBandError((__orc_rt::WrapperFunctionResult *)&v3, "Could not deserialize arguments for wrapper function call");
  }
  else
  {
    __orc_rt::Error::assertIsChecked(1);
    uint64_t v4 = 0;
    __orc_rt::detail::ResultSerializer<__orc_rt::SPSError,__orc_rt::Error>::serialize((__orc_rt::WrapperFunctionResult *)&v3, &v4);
    __orc_rt::Error::assertIsChecked(v4);
    __orc_rt::Error::assertIsChecked(1);
  }
  return v3;
}

void **xojit_xpcmemmgr_deallocate(const char *a1, unint64_t a2)
{
  if (a2 < 8 || (a2 & 0xFFFFFFFFFFFFFFF8) == 8)
  {
    __orc_rt::WrapperFunctionResult::createOutOfBandError((__orc_rt::WrapperFunctionResult *)&v64, "Could not deserialize arguments for wrapper function call");
    return v64;
  }
  uint64_t v3 = *(std::mutex **)a1;
  unint64_t v4 = *((void *)a1 + 1);
  if (!v4)
  {
    std::mutex::lock(*(std::mutex **)a1);
    unint64_t v58 = 0;
    mach_vm_address_t v7 = 0;
LABEL_107:
    uint8x8_t v22 = 0;
    std::mutex::unlock(v3);
    goto LABEL_108;
  }
  uint64_t v63 = *(std::mutex **)a1;
  if (v4 >> 61) {
LABEL_115:
  }
    abort();
  unint64_t v5 = a1 + 16;
  unint64_t v6 = a2 - 16;
  mach_vm_address_t v7 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<__orc_rt::ExecutorAddr>>(v4);
  uint64_t v8 = 0;
  std::exception_ptr v10 = &v7[8 * v9];
  uint64_t v11 = v7;
  do
  {
    BOOL v12 = v6 >= 8;
    v6 -= 8;
    if (!v12)
    {
      __orc_rt::WrapperFunctionResult::createOutOfBandError((__orc_rt::WrapperFunctionResult *)&v64, "Could not deserialize arguments for wrapper function call");
      if (v7) {
        operator delete(v7);
      }
      return v64;
    }
    uint64_t v14 = *(void *)v5;
    v5 += 8;
    uint64_t v13 = v14;
    if (v11 >= v10)
    {
      uint64_t v15 = (v11 - v7) >> 3;
      unint64_t v16 = v15 + 1;
      if ((unint64_t)(v15 + 1) >> 61) {
        goto LABEL_115;
      }
      if ((v10 - v7) >> 2 > v16) {
        unint64_t v16 = (v10 - v7) >> 2;
      }
      if ((unint64_t)(v10 - v7) >= 0x7FFFFFFFFFFFFFF8) {
        unint64_t v17 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v17 = v16;
      }
      if (v17) {
        unint64_t v17 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<__orc_rt::ExecutorAddr>>(v17);
      }
      else {
        uint64_t v18 = 0;
      }
      unint64_t v19 = (char *)(v17 + 8 * v15);
      *(void *)unint64_t v19 = v13;
      unint64_t v20 = v19 + 8;
      while (v11 != v7)
      {
        uint64_t v21 = *((void *)v11 - 1);
        v11 -= 8;
        *((void *)v19 - 1) = v21;
        v19 -= 8;
      }
      std::exception_ptr v10 = (char *)(v17 + 8 * v18);
      if (v7) {
        operator delete(v7);
      }
      mach_vm_address_t v7 = v19;
      uint64_t v11 = v20;
    }
    else
    {
      *(void *)uint64_t v11 = v13;
      v11 += 8;
    }
    ++v8;
  }
  while (v8 != v4);
  uint64_t v3 = v63;
  std::mutex::lock(v63);
  if (v7 == v11)
  {
    unint64_t v58 = 0;
    unint64_t v4 = 0;
    goto LABEL_107;
  }
  unint64_t v4 = 0;
  uint8x8_t v22 = 0;
  unint64_t v23 = 0;
  uint64_t v24 = &v63[1].__m_.__opaque[48];
  unint64_t v25 = v7;
  do
  {
    int8x8_t v26 = *(int8x8_t *)&v3[1].__m_.__opaque[40];
    if (!*(void *)&v26) {
      goto LABEL_105;
    }
    unint64_t v27 = 0x9DDFEA08EB382D69 * ((8 * *(void *)v25 + 8) ^ HIDWORD(*(void *)v25));
    unint64_t v28 = 0x9DDFEA08EB382D69 * (HIDWORD(*(void *)v25) ^ (v27 >> 47) ^ v27);
    unint64_t v29 = 0x9DDFEA08EB382D69 * (v28 ^ (v28 >> 47));
    uint8x8_t v30 = (uint8x8_t)vcnt_s8(v26);
    v30.i16[0] = vaddlv_u8(v30);
    if (v30.u32[0] > 1uLL)
    {
      unint64_t v31 = v29;
      if (v29 >= *(void *)&v26) {
        unint64_t v31 = v29 % *(void *)&v26;
      }
    }
    else
    {
      unint64_t v31 = v29 & (*(void *)&v26 - 1);
    }
    unint64_t v32 = *(void ***)(*(void *)&v63[1].__m_.__opaque[32] + 8 * v31);
    if (!v32 || (int64x2_t v33 = (char *)*v32) == 0) {
LABEL_105:
    }
      operator new();
    while (1)
    {
      unint64_t v34 = *((void *)v33 + 1);
      if (v34 == v29) {
        break;
      }
      if (v30.u32[0] > 1uLL)
      {
        if (v34 >= *(void *)&v26) {
          v34 %= *(void *)&v26;
        }
      }
      else
      {
        v34 &= *(void *)&v26 - 1;
      }
      if (v34 != v31) {
        goto LABEL_105;
      }
LABEL_45:
      int64x2_t v33 = *(char **)v33;
      if (!v33) {
        goto LABEL_105;
      }
    }
    if (*((void *)v33 + 2) != *(void *)v25) {
      goto LABEL_45;
    }
    uint64_t v35 = (void **)(v33 + 24);
    if ((unint64_t)v22 < v23)
    {
      NSObject *v22 = 0;
      v22[1] = 0;
      v22[2] = 0;
      *(_OWORD *)uint8x8_t v22 = *(_OWORD *)(v33 + 24);
      v22[2] = (void *)*((void *)v33 + 5);
      *uint64_t v35 = 0;
      *((void *)v33 + 4) = 0;
      *((void *)v33 + 5) = 0;
      v22 += 3;
      goto LABEL_64;
    }
    unint64_t v36 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)((uint64_t)v22 - v4) >> 3) + 1;
    if (v36 > 0xAAAAAAAAAAAAAAALL) {
      goto LABEL_115;
    }
    if (0x5555555555555556 * ((uint64_t)(v23 - v4) >> 3) > v36) {
      unint64_t v36 = 0x5555555555555556 * ((uint64_t)(v23 - v4) >> 3);
    }
    if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v23 - v4) >> 3) >= 0x555555555555555) {
      unint64_t v36 = 0xAAAAAAAAAAAAAAALL;
    }
    if (v36 > 0xAAAAAAAAAAAAAAALL) {
      std::__throw_bad_array_new_length[abi:nn180100]();
    }
    uint64_t v61 = 3 * v36;
    uint64_t v62 = v24;
    unint64_t v37 = (char *)operator new(24 * v36);
    uint8x8_t v38 = &v37[8 * ((uint64_t)((uint64_t)v22 - v4) >> 3)];
    unint64_t v39 = v37;
    *((void *)v38 + 1) = 0;
    *((void *)v38 + 2) = 0;
    *(_OWORD *)uint8x8_t v38 = *(_OWORD *)(v33 + 24);
    *((void *)v38 + 2) = *((void *)v33 + 5);
    *((void *)v33 + 3) = 0;
    *((void *)v33 + 4) = 0;
    *((void *)v33 + 5) = 0;
    if (v22 == (void **)v4)
    {
      uint64_t v35 = (void **)(v33 + 24);
      uint64_t v41 = &v37[8 * ((uint64_t)((uint64_t)v22 - v4) >> 3)];
    }
    else
    {
      uint8x8_t v40 = v22;
      uint64_t v41 = &v37[8 * ((uint64_t)((uint64_t)v22 - v4) >> 3)];
      do
      {
        *((void *)v41 - 3) = 0;
        *((void *)v41 - 2) = 0;
        v41 -= 24;
        *((void *)v41 + 2) = 0;
        long long v42 = *(_OWORD *)(v40 - 3);
        v40 -= 3;
        *(_OWORD *)uint64_t v41 = v42;
        *((void *)v41 + 2) = v40[2];
        uint64_t *v40 = 0;
        v40[1] = 0;
        v40[2] = 0;
      }
      while (v40 != (void **)v4);
      do
      {
        v22 -= 3;
        uint64_t v64 = v22;
        std::vector<__orc_rt::WrapperFunctionCall>::__destroy_vector::operator()[abi:nn180100](&v64);
      }
      while (v22 != (void **)v4);
      uint64_t v35 = (void **)(v33 + 24);
    }
    unint64_t v43 = &v39[8 * v61];
    uint8x8_t v22 = (void **)(v38 + 24);
    if (v4)
    {
      operator delete((void *)v4);
      uint64_t v35 = (void **)(v33 + 24);
    }
    unint64_t v4 = (unint64_t)v41;
    uint64_t v24 = v62;
    unint64_t v23 = (unint64_t)v43;
LABEL_64:
    int8x8_t v44 = *(int8x8_t *)&v63[1].__m_.__opaque[40];
    uint64_t v45 = *(void *)v33;
    unint64_t v46 = *((void *)v33 + 1);
    uint8x8_t v47 = (uint8x8_t)vcnt_s8(v44);
    v47.i16[0] = vaddlv_u8(v47);
    if (v47.u32[0] > 1uLL)
    {
      if (v46 >= *(void *)&v44) {
        v46 %= *(void *)&v44;
      }
    }
    else
    {
      v46 &= *(void *)&v44 - 1;
    }
    uint64_t v48 = *(void *)&v63[1].__m_.__opaque[32];
    int64x2_t v49 = *(char **)(v48 + 8 * v46);
    do
    {
      uint64_t v50 = v49;
      int64x2_t v49 = *(char **)v49;
    }
    while (v49 != v33);
    if (v50 == v24) {
      goto LABEL_81;
    }
    unint64_t v51 = *((void *)v50 + 1);
    if (v47.u32[0] > 1uLL)
    {
      if (v51 >= *(void *)&v44) {
        v51 %= *(void *)&v44;
      }
    }
    else
    {
      v51 &= *(void *)&v44 - 1;
    }
    if (v51 == v46)
    {
LABEL_83:
      if (v45)
      {
        unint64_t v52 = *(void *)(v45 + 8);
        goto LABEL_85;
      }
    }
    else
    {
LABEL_81:
      if (!v45) {
        goto LABEL_82;
      }
      unint64_t v52 = *(void *)(v45 + 8);
      if (v47.u32[0] > 1uLL)
      {
        unint64_t v53 = *(void *)(v45 + 8);
        if (v52 >= *(void *)&v44) {
          unint64_t v53 = v52 % *(void *)&v44;
        }
      }
      else
      {
        unint64_t v53 = v52 & (*(void *)&v44 - 1);
      }
      if (v53 != v46)
      {
LABEL_82:
        *(void *)(v48 + 8 * v46) = 0;
        uint64_t v45 = *(void *)v33;
        goto LABEL_83;
      }
LABEL_85:
      if (v47.u32[0] > 1uLL)
      {
        if (v52 >= *(void *)&v44) {
          v52 %= *(void *)&v44;
        }
      }
      else
      {
        v52 &= *(void *)&v44 - 1;
      }
      if (v52 != v46)
      {
        *(void *)(*(void *)&v63[1].__m_.__opaque[32] + 8 * v52) = v50;
        uint64_t v45 = *(void *)v33;
      }
    }
    *(void *)uint64_t v50 = v45;
    *(void *)int64x2_t v33 = 0;
    uint64_t v3 = v63;
    --v63[2].__m_.__sig;
    uint64_t v64 = v35;
    std::vector<__orc_rt::WrapperFunctionCall>::__destroy_vector::operator()[abi:nn180100](&v64);
    operator delete(v33);
    v25 += 8;
  }
  while (v25 != v11);
  std::mutex::unlock(v63);
  if ((void **)v4 != v22)
  {
    uint64_t v54 = v22;
    do
    {
      uint64_t v56 = (uint64_t)*(v54 - 3);
      uint64_t v55 = (uint64_t)*(v54 - 2);
      v54 -= 3;
      while (v56 != v55)
      {
        __orc_rt::WrapperFunctionCall::runWithSPSRet<__orc_rt::SPSEmpty,__orc_rt::SPSEmpty>(&v66, v55 - 32);
        unint64_t v57 = v66 & 0xFFFFFFFFFFFFFFFELL;
        unint64_t v58 = v66 & 0xFFFFFFFFFFFFFFFELL | ((v66 & 0xFFFFFFFFFFFFFFFELL) == 0);
        unint64_t v66 = v58;
        if (v57) {
          goto LABEL_108;
        }
        __orc_rt::Error::assertIsChecked(v58);
        uint64_t v59 = (uint64_t)*(v22 - 2);
        uint64_t v60 = *(void **)(v59 - 24);
        if (v60)
        {
          *(void *)(v59 - 16) = v60;
          operator delete(v60);
        }
        uint64_t v55 = v59 - 32;
        *(v22 - 2) = (void *)(v59 - 32);
        uint64_t v56 = (uint64_t)*(v22 - 3);
      }
      uint64_t v64 = v54;
      std::vector<__orc_rt::WrapperFunctionCall>::__destroy_vector::operator()[abi:nn180100](&v64);
      uint8x8_t v22 = v54;
    }
    while ((void **)v4 != v54);
  }
  unint64_t v58 = 0;
  uint8x8_t v22 = (void **)v4;
LABEL_108:
  if (v4)
  {
    while (v22 != (void **)v4)
    {
      v22 -= 3;
      uint64_t v64 = v22;
      std::vector<__orc_rt::WrapperFunctionCall>::__destroy_vector::operator()[abi:nn180100](&v64);
    }
    operator delete((void *)v4);
  }
  if (v7) {
    operator delete(v7);
  }
  __orc_rt::Error::assertIsChecked(1);
  std::string::size_type v65 = (__orc_rt::Error *)(v58 & 0xFFFFFFFFFFFFFFFELL);
  __orc_rt::detail::ResultSerializer<__orc_rt::SPSError,__orc_rt::Error>::serialize((__orc_rt::WrapperFunctionResult *)&v64, (uint64_t *)&v65);
  __orc_rt::Error::assertIsChecked((uint64_t)v65);
  __orc_rt::Error::assertIsChecked(1);
  return v64;
}

uint64_t xojit_xpcmemmgr_make_read_only(const char *a1)
{
  return 0;
}

std::string::size_type xojit_xpcmemmgr_apply_sandbox_extension(const char *a1, unint64_t a2)
{
  v13[2] = *MEMORY[0x263EF8340];
  *(_OWORD *)__p = 0u;
  long long v11 = 0u;
  if (a2 > 7
    && (mach_vm_size_t v2 = *(void **)a1,
        buf.__r_.__value_.__r.__words[0] = (std::string::size_type)(a1 + 8),
        buf.__r_.__value_.__l.__size_ = a2 - 8,
        __p[0] = v2,
        __orc_rt::SPSSerializationTraits<__orc_rt::SPSSequence<char>,std::string,void>::deserialize((uint64_t)&buf, (std::string *)&__p[1])))
  {
    uint64_t v3 = qword_26B420070;
    if (os_log_type_enabled((os_log_t)qword_26B420070, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf.__r_.__value_.__l.__data_) = 0;
      _os_log_impl(&dword_262716000, v3, OS_LOG_TYPE_DEFAULT, "Consuming sandbox extension", (uint8_t *)&buf, 2u);
    }
    std::mutex::lock((std::mutex *)__p[0]);
    uint64_t v4 = sandbox_extension_consume();
    if (v4 == -1)
    {
      std::string::basic_string[abi:nn180100]<0>(&buf, "Error applying sandbox extension: ");
      unint64_t v5 = __error();
      unint64_t v6 = strerror(*v5);
      size_t v7 = strlen(v6);
      uint64_t v8 = std::string::append(&buf, v6, v7);
      v13[0] = v8->__r_.__value_.__l.__size_;
      *(uint64_t *)((char *)v13 + 7) = *(std::string::size_type *)((char *)&v8->__r_.__value_.__r.__words[1] + 7);
      v8->__r_.__value_.__l.__size_ = 0;
      v8->__r_.__value_.__r.__words[2] = 0;
      v8->__r_.__value_.__r.__words[0] = 0;
      operator new();
    }
    *((void *)__p[0] + 18) = v4;
    std::mutex::unlock((std::mutex *)__p[0]);
    __orc_rt::Error::assertIsChecked(1);
    v13[0] = 0;
    __orc_rt::detail::ResultSerializer<__orc_rt::SPSError,__orc_rt::Error>::serialize((__orc_rt::WrapperFunctionResult *)&buf, v13);
    __orc_rt::Error::assertIsChecked(v13[0]);
    __orc_rt::Error::assertIsChecked(1);
  }
  else
  {
    __orc_rt::WrapperFunctionResult::createOutOfBandError((__orc_rt::WrapperFunctionResult *)&buf, "Could not deserialize arguments for wrapper function call");
  }
  if (SHIBYTE(v11) < 0) {
    operator delete(__p[1]);
  }
  return buf.__r_.__value_.__r.__words[0];
}

uint64_t xojit_memaccess_write_uints_wrapper<unsigned char>(unint64_t *a1, unint64_t a2)
{
  unint64_t v3 = a2 - 8;
  if (a2 < 8)
  {
    unint64_t v6 = 0;
  }
  else
  {
    uint64_t v4 = a1 + 1;
    unint64_t v5 = *a1;
    if (!*a1)
    {
      unint64_t v6 = 0;
LABEL_33:
      v24[0] = 0;
      v24[1] = 0;
      if (v6) {
        goto LABEL_30;
      }
      return v24[0];
    }
    if (v5 >> 60) {
LABEL_35:
    }
      abort();
    unint64_t v6 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<__orc_rt::ExecutorSymbolDef>>(*a1);
    uint64_t v7 = 0;
    uint64_t v9 = &v6[16 * v8];
    std::exception_ptr v10 = v6;
    while (v3 > 8)
    {
      unint64_t v11 = *v4;
      unint64_t v2 = v2 & 0xFFFFFFFFFFFFFF00 | *((unsigned __int8 *)v4 + 8);
      if (v10 >= v9)
      {
        uint64_t v12 = (v10 - v6) >> 4;
        unint64_t v13 = v12 + 1;
        if ((unint64_t)(v12 + 1) >> 60) {
          goto LABEL_35;
        }
        if ((v9 - v6) >> 3 > v13) {
          unint64_t v13 = (v9 - v6) >> 3;
        }
        if ((unint64_t)(v9 - v6) >= 0x7FFFFFFFFFFFFFF0) {
          unint64_t v14 = 0xFFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v14 = v13;
        }
        if (v14) {
          unint64_t v14 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<__orc_rt::ExecutorSymbolDef>>(v14);
        }
        else {
          uint64_t v15 = 0;
        }
        unint64_t v16 = (unint64_t *)(v14 + 16 * v12);
        *unint64_t v16 = v11;
        v16[1] = v2;
        unint64_t v17 = v16;
        while (v10 != v6)
        {
          unint64_t v18 = *((void *)v10 - 2);
          v10 -= 16;
          char v19 = v10[8];
          *(v17 - 2) = v18;
          v17 -= 2;
          *((unsigned char *)v17 + 8) = v19;
        }
        uint64_t v9 = (char *)(v14 + 16 * v15);
        std::exception_ptr v10 = (char *)(v16 + 2);
        if (v6) {
          operator delete(v6);
        }
        unint64_t v6 = (char *)v17;
      }
      else
      {
        *(void *)std::exception_ptr v10 = v11;
        *((void *)v10 + 1) = v2;
        v10 += 16;
      }
      uint64_t v4 = (unint64_t *)((char *)v4 + 9);
      v3 -= 9;
      if (++v7 == v5)
      {
        if (v6 != v10)
        {
          unint64_t v20 = v6;
          do
          {
            char v21 = v20[8];
            uint8x8_t v22 = *(char **)v20;
            v20 += 16;
            char *v22 = v21;
          }
          while (v20 != v10);
        }
        goto LABEL_33;
      }
    }
  }
  __orc_rt::WrapperFunctionResult::createOutOfBandError((__orc_rt::WrapperFunctionResult *)v24, "Could not deserialize arguments for wrapper function call");
  if (v6) {
LABEL_30:
  }
    operator delete(v6);
  return v24[0];
}

uint64_t xojit_memaccess_write_uints_wrapper<unsigned short>(unint64_t *a1, unint64_t a2)
{
  unint64_t v3 = a2 - 8;
  if (a2 < 8)
  {
    unint64_t v6 = 0;
  }
  else
  {
    uint64_t v4 = a1 + 1;
    unint64_t v5 = *a1;
    if (!*a1)
    {
      unint64_t v6 = 0;
LABEL_34:
      v24[0] = 0;
      v24[1] = 0;
      if (v6) {
        goto LABEL_31;
      }
      return v24[0];
    }
    if (v5 >> 60) {
LABEL_36:
    }
      abort();
    unint64_t v6 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<__orc_rt::ExecutorSymbolDef>>(*a1);
    uint64_t v7 = 0;
    uint64_t v9 = &v6[16 * v8];
    std::exception_ptr v10 = v6;
    while (v3 >= 8 && (v3 & 0xFFFFFFFFFFFFFFFELL) != 8)
    {
      unint64_t v11 = *v4;
      unint64_t v2 = v2 & 0xFFFFFFFFFFFF0000 | *((unsigned __int16 *)v4 + 4);
      if (v10 >= v9)
      {
        uint64_t v12 = (v10 - v6) >> 4;
        unint64_t v13 = v12 + 1;
        if ((unint64_t)(v12 + 1) >> 60) {
          goto LABEL_36;
        }
        if ((v9 - v6) >> 3 > v13) {
          unint64_t v13 = (v9 - v6) >> 3;
        }
        if ((unint64_t)(v9 - v6) >= 0x7FFFFFFFFFFFFFF0) {
          unint64_t v14 = 0xFFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v14 = v13;
        }
        if (v14) {
          unint64_t v14 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<__orc_rt::ExecutorSymbolDef>>(v14);
        }
        else {
          uint64_t v15 = 0;
        }
        unint64_t v16 = (unint64_t *)(v14 + 16 * v12);
        *unint64_t v16 = v11;
        v16[1] = v2;
        unint64_t v17 = v16;
        while (v10 != v6)
        {
          unint64_t v18 = *((void *)v10 - 2);
          v10 -= 16;
          __int16 v19 = *((_WORD *)v10 + 4);
          *(v17 - 2) = v18;
          v17 -= 2;
          *((_WORD *)v17 + 4) = v19;
        }
        uint64_t v9 = (char *)(v14 + 16 * v15);
        std::exception_ptr v10 = (char *)(v16 + 2);
        if (v6) {
          operator delete(v6);
        }
        unint64_t v6 = (char *)v17;
      }
      else
      {
        *(void *)std::exception_ptr v10 = v11;
        *((void *)v10 + 1) = v2;
        v10 += 16;
      }
      uint64_t v4 = (unint64_t *)((char *)v4 + 10);
      v3 -= 10;
      if (++v7 == v5)
      {
        if (v6 != v10)
        {
          unint64_t v20 = v6;
          do
          {
            __int16 v21 = *((_WORD *)v20 + 4);
            uint8x8_t v22 = *(_WORD **)v20;
            v20 += 16;
            _WORD *v22 = v21;
          }
          while (v20 != v10);
        }
        goto LABEL_34;
      }
    }
  }
  __orc_rt::WrapperFunctionResult::createOutOfBandError((__orc_rt::WrapperFunctionResult *)v24, "Could not deserialize arguments for wrapper function call");
  if (v6) {
LABEL_31:
  }
    operator delete(v6);
  return v24[0];
}

uint64_t xojit_memaccess_write_uints_wrapper<unsigned int>(unint64_t *a1, unint64_t a2)
{
  unint64_t v3 = a2 - 8;
  if (a2 < 8)
  {
    unint64_t v6 = 0;
  }
  else
  {
    uint64_t v4 = a1 + 1;
    unint64_t v5 = *a1;
    if (!*a1)
    {
      unint64_t v6 = 0;
LABEL_34:
      v24[0] = 0;
      v24[1] = 0;
      if (v6) {
        goto LABEL_31;
      }
      return v24[0];
    }
    if (v5 >> 60) {
LABEL_36:
    }
      abort();
    unint64_t v6 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<__orc_rt::ExecutorSymbolDef>>(*a1);
    uint64_t v7 = 0;
    uint64_t v9 = &v6[16 * v8];
    std::exception_ptr v10 = v6;
    while (v3 >= 8 && (v3 & 0xFFFFFFFFFFFFFFFCLL) != 8)
    {
      unint64_t v11 = *v4;
      unint64_t v2 = v2 & 0xFFFFFFFF00000000 | *((unsigned int *)v4 + 2);
      if (v10 >= v9)
      {
        uint64_t v12 = (v10 - v6) >> 4;
        unint64_t v13 = v12 + 1;
        if ((unint64_t)(v12 + 1) >> 60) {
          goto LABEL_36;
        }
        if ((v9 - v6) >> 3 > v13) {
          unint64_t v13 = (v9 - v6) >> 3;
        }
        if ((unint64_t)(v9 - v6) >= 0x7FFFFFFFFFFFFFF0) {
          unint64_t v14 = 0xFFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v14 = v13;
        }
        if (v14) {
          unint64_t v14 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<__orc_rt::ExecutorSymbolDef>>(v14);
        }
        else {
          uint64_t v15 = 0;
        }
        unint64_t v16 = (unint64_t *)(v14 + 16 * v12);
        *unint64_t v16 = v11;
        v16[1] = v2;
        unint64_t v17 = v16;
        while (v10 != v6)
        {
          unint64_t v18 = *((void *)v10 - 2);
          v10 -= 16;
          int v19 = *((_DWORD *)v10 + 2);
          *(v17 - 2) = v18;
          v17 -= 2;
          *((_DWORD *)v17 + 2) = v19;
        }
        uint64_t v9 = (char *)(v14 + 16 * v15);
        std::exception_ptr v10 = (char *)(v16 + 2);
        if (v6) {
          operator delete(v6);
        }
        unint64_t v6 = (char *)v17;
      }
      else
      {
        *(void *)std::exception_ptr v10 = v11;
        *((void *)v10 + 1) = v2;
        v10 += 16;
      }
      uint64_t v4 = (unint64_t *)((char *)v4 + 12);
      v3 -= 12;
      if (++v7 == v5)
      {
        if (v6 != v10)
        {
          unint64_t v20 = v6;
          do
          {
            int v21 = *((_DWORD *)v20 + 2);
            uint8x8_t v22 = *(_DWORD **)v20;
            v20 += 16;
            _DWORD *v22 = v21;
          }
          while (v20 != v10);
        }
        goto LABEL_34;
      }
    }
  }
  __orc_rt::WrapperFunctionResult::createOutOfBandError((__orc_rt::WrapperFunctionResult *)v24, "Could not deserialize arguments for wrapper function call");
  if (v6) {
LABEL_31:
  }
    operator delete(v6);
  return v24[0];
}

uint64_t xojit_memaccess_write_uints_wrapper<unsigned long long>(unint64_t *a1, unint64_t a2)
{
  unint64_t v2 = a2 - 8;
  if (a2 < 8)
  {
    unint64_t v5 = 0;
  }
  else
  {
    unint64_t v3 = (uint64_t *)(a1 + 1);
    unint64_t v4 = *a1;
    if (!*a1)
    {
      unint64_t v5 = 0;
LABEL_36:
      v23[0] = 0;
      v23[1] = 0;
      if (v5) {
        goto LABEL_33;
      }
      return v23[0];
    }
    if (v4 >> 60) {
LABEL_38:
    }
      abort();
    unint64_t v5 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<__orc_rt::ExecutorSymbolDef>>(*a1);
    uint64_t v6 = 0;
    uint64_t v8 = &v5[16 * v7];
    uint64_t v9 = v5;
    while (v2 >= 8 && (v2 & 0xFFFFFFFFFFFFFFF8) != 8)
    {
      uint64_t v10 = *v3;
      uint64_t v11 = v3[1];
      if (v9 >= v8)
      {
        uint64_t v12 = (v9 - v5) >> 4;
        unint64_t v13 = v12 + 1;
        if ((unint64_t)(v12 + 1) >> 60) {
          goto LABEL_38;
        }
        if ((v8 - v5) >> 3 > v13) {
          unint64_t v13 = (v8 - v5) >> 3;
        }
        if ((unint64_t)(v8 - v5) >= 0x7FFFFFFFFFFFFFF0) {
          unint64_t v14 = 0xFFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v14 = v13;
        }
        if (v14) {
          unint64_t v14 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<__orc_rt::ExecutorSymbolDef>>(v14);
        }
        else {
          uint64_t v15 = 0;
        }
        unint64_t v16 = (void *)(v14 + 16 * v12);
        *unint64_t v16 = v10;
        v16[1] = v11;
        if (v9 == v5)
        {
          unint64_t v18 = (char *)(v14 + 16 * v12);
        }
        else
        {
          unint64_t v17 = v14 + 16 * v12;
          do
          {
            unint64_t v18 = (char *)(v17 - 16);
            *(_OWORD *)(v17 - 16) = *((_OWORD *)v9 - 1);
            v9 -= 16;
            v17 -= 16;
          }
          while (v9 != v5);
        }
        uint64_t v8 = (char *)(v14 + 16 * v15);
        uint64_t v9 = (char *)(v16 + 2);
        if (v5) {
          operator delete(v5);
        }
        unint64_t v5 = v18;
      }
      else
      {
        *(void *)uint64_t v9 = v10;
        *((void *)v9 + 1) = v11;
        v9 += 16;
      }
      v3 += 2;
      v2 -= 16;
      if (++v6 == v4)
      {
        if (v5 != v9)
        {
          int v19 = v5;
          do
          {
            int v21 = *(void **)v19;
            uint64_t v20 = *((void *)v19 + 1);
            v19 += 16;
            *int v21 = v20;
          }
          while (v19 != v9);
        }
        goto LABEL_36;
      }
    }
  }
  __orc_rt::WrapperFunctionResult::createOutOfBandError((__orc_rt::WrapperFunctionResult *)v23, "Could not deserialize arguments for wrapper function call");
  if (v5) {
LABEL_33:
  }
    operator delete(v5);
  return v23[0];
}

uint64_t xojit_memaccess_write_buffers_wrapper(const char *a1, unint64_t a2)
{
  unint64_t v2 = a2 - 8;
  if (a2 < 8)
  {
    unint64_t v5 = 0;
  }
  else
  {
    unint64_t v4 = a1 + 8;
    unint64_t v3 = *(void *)a1;
    if (!*(void *)a1)
    {
      unint64_t v5 = 0;
LABEL_38:
      v24[0] = 0;
      v24[1] = 0;
      if (v5) {
        goto LABEL_35;
      }
      return v24[0];
    }
    if (v3 > 0xAAAAAAAAAAAAAAALL) {
LABEL_40:
    }
      abort();
    unint64_t v5 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<__orc_rt::BufferWrite>>(*(void *)a1);
    uint64_t v6 = 0;
    uint64_t v8 = &v5[24 * v7];
    uint64_t v9 = v5;
    while (v2 >= 8)
    {
      if ((v2 & 0xFFFFFFFFFFFFFFF8) == 8) {
        break;
      }
      unint64_t v10 = *((void *)v4 + 1);
      BOOL v11 = v2 - 16 >= v10;
      unint64_t v2 = v2 - 16 - v10;
      if (!v11) {
        break;
      }
      uint64_t v14 = *(void *)v4;
      uint64_t v12 = v4 + 16;
      uint64_t v13 = v14;
      if (v9 >= v8)
      {
        unint64_t v15 = 0xAAAAAAAAAAAAAAABLL * ((v9 - v5) >> 3) + 1;
        if (v15 > 0xAAAAAAAAAAAAAAALL) {
          goto LABEL_40;
        }
        if (0x5555555555555556 * ((v8 - v5) >> 3) > v15) {
          unint64_t v15 = 0x5555555555555556 * ((v8 - v5) >> 3);
        }
        if (0xAAAAAAAAAAAAAAABLL * ((v8 - v5) >> 3) >= 0x555555555555555) {
          unint64_t v16 = 0xAAAAAAAAAAAAAAALL;
        }
        else {
          unint64_t v16 = v15;
        }
        if (v16) {
          unint64_t v16 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<__orc_rt::BufferWrite>>(v16);
        }
        else {
          uint64_t v17 = 0;
        }
        unint64_t v18 = (void *)(v16 + 8 * ((v9 - v5) >> 3));
        void *v18 = v13;
        v18[1] = v12;
        v18[2] = v10;
        if (v9 == v5)
        {
          int v21 = (char *)(v16 + 8 * ((v9 - v5) >> 3));
        }
        else
        {
          unint64_t v19 = v16 + 8 * ((v9 - v5) >> 3);
          do
          {
            long long v20 = *(_OWORD *)(v9 - 24);
            int v21 = (char *)(v19 - 24);
            *(void *)(v19 - 8) = *((void *)v9 - 1);
            *(_OWORD *)(v19 - 24) = v20;
            v9 -= 24;
            v19 -= 24;
          }
          while (v9 != v5);
        }
        uint64_t v8 = (char *)(v16 + 24 * v17);
        uint64_t v9 = (char *)(v18 + 3);
        if (v5) {
          operator delete(v5);
        }
        unint64_t v5 = v21;
      }
      else
      {
        *(void *)uint64_t v9 = v13;
        *((void *)v9 + 1) = v12;
        *((void *)v9 + 2) = v10;
        v9 += 24;
      }
      unint64_t v4 = &v12[v10];
      if (++v6 == v3)
      {
        if (v5 != v9)
        {
          uint8x8_t v22 = v5;
          do
          {
            memcpy(*(void **)v22, *((const void **)v22 + 1), *((void *)v22 + 2));
            v22 += 24;
          }
          while (v22 != v9);
        }
        goto LABEL_38;
      }
    }
  }
  __orc_rt::WrapperFunctionResult::createOutOfBandError((__orc_rt::WrapperFunctionResult *)v24, "Could not deserialize arguments for wrapper function call");
  if (v5) {
LABEL_35:
  }
    operator delete(v5);
  return v24[0];
}

uint64_t xojit_dylibmgr_dlopen_wrapper(const char *a1, unint64_t a2)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  uint64_t v20 = 0;
  memset(&v19[2], 0, 32);
  if (a2 >= 8
    && (uint64_t v2 = *(void *)a1,
        __p[0] = (void *)(a1 + 8),
        __p[1] = (void *)(a2 - 8),
        v19[2] = v2,
        __orc_rt::SPSSerializationTraits<__orc_rt::SPSSequence<char>,std::string,void>::deserialize((uint64_t)__p, (std::string *)&v19[3]))&& __p[1] > (void *)7)
  {
    uint64_t v20 = *(void *)__p[0];
    uint64_t v3 = v19[2];
    uint64_t v24 = v19[5];
    *(_OWORD *)__p = *(_OWORD *)&v19[3];
    memset(&v19[3], 0, 24);
    if (SHIBYTE(v24) < 0)
    {
      if (__p[1]) {
        unint64_t v4 = (void **)__p[0];
      }
      else {
        unint64_t v4 = 0;
      }
    }
    else if (HIBYTE(v24))
    {
      unint64_t v4 = __p;
    }
    else
    {
      unint64_t v4 = 0;
    }
    unint64_t v5 = dlopen((const char *)v4, 8);
    if (!v5)
    {
      dlerror();
      operator new();
    }
    uint64_t v6 = v5;
    std::mutex::lock((std::mutex *)v19[2]);
    uint64_t v8 = *(void **)(v19[2] + 72);
    unint64_t v7 = *(void *)(v19[2] + 80);
    if ((unint64_t)v8 >= v7)
    {
      unint64_t v10 = *(void **)(v19[2] + 64);
      uint64_t v11 = v8 - v10;
      unint64_t v12 = v11 + 1;
      if ((unint64_t)(v11 + 1) >> 61) {
        abort();
      }
      uint64_t v13 = v7 - (void)v10;
      if (v13 >> 2 > v12) {
        unint64_t v12 = v13 >> 2;
      }
      if ((unint64_t)v13 >= 0x7FFFFFFFFFFFFFF8) {
        unint64_t v14 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v14 = v12;
      }
      if (v14)
      {
        if (v14 >> 61) {
          std::__throw_bad_array_new_length[abi:nn180100]();
        }
        unint64_t v15 = (char *)operator new(8 * v14);
      }
      else
      {
        unint64_t v15 = 0;
      }
      unint64_t v16 = &v15[8 * v11];
      *(void *)unint64_t v16 = v6;
      uint64_t v9 = v16 + 8;
      if (v8 != v10)
      {
        do
        {
          uint64_t v17 = *--v8;
          *((void *)v16 - 1) = v17;
          v16 -= 8;
        }
        while (v8 != v10);
        uint64_t v8 = *(void **)(v3 + 64);
      }
      *(void *)(v3 + 64) = v16;
      *(void *)(v3 + 72) = v9;
      *(void *)(v3 + 80) = &v15[8 * v14];
      if (v8) {
        operator delete(v8);
      }
    }
    else
    {
      *uint64_t v8 = v6;
      uint64_t v9 = v8 + 1;
    }
    *(void *)(v3 + 72) = v9;
    std::mutex::unlock((std::mutex *)v3);
    int v21 = v6;
    if (SHIBYTE(v24) < 0) {
      operator delete(__p[0]);
    }
    LOBYTE(__p[1]) = 2;
    char v22 = 0;
    __p[0] = v6;
    __orc_rt::detail::ResultSerializer<__orc_rt::SPSExpected<__orc_rt::SPSExecutorAddr>,__orc_rt::Expected<__orc_rt::ExecutorAddr>>::serialize((__orc_rt::WrapperFunctionResult *)v19, (uint64_t)__p);
    __orc_rt::Expected<__orc_rt::ExecutorAddr>::~Expected((uint64_t *)__p);
    __orc_rt::Expected<__orc_rt::ExecutorAddr>::~Expected((uint64_t *)&v21);
  }
  else
  {
    __orc_rt::WrapperFunctionResult::createOutOfBandError((__orc_rt::WrapperFunctionResult *)v19, "Could not deserialize arguments for wrapper function call");
  }
  if (SHIBYTE(v19[5]) < 0) {
    operator delete((void *)v19[3]);
  }
  return v19[0];
}

uint64_t xojit_dylibmgr_dlsym_wrapper(const char *a1, unint64_t a2)
{
  uint64_t v104 = *MEMORY[0x263EF8340];
  long long v89 = 0u;
  memset(v90, 0, 24);
  if (a2 < 8
    || (*(void *)&long long v89 = *(void *)a1, (a2 & 0xFFFFFFFFFFFFFFF8) == 8)
    || (*((void *)&v89 + 1) = *((void *)a1 + 1), (a2 & 0xFFFFFFFFFFFFFFF8) == 0x10))
  {
LABEL_94:
    __orc_rt::WrapperFunctionResult::createOutOfBandError((__orc_rt::WrapperFunctionResult *)&v88, "Could not deserialize arguments for wrapper function call");
    goto LABEL_95;
  }
  unint64_t v2 = *((void *)a1 + 2);
  v98 = a1 + 24;
  *(void *)&long long v99 = a2 - 24;
  if (v2)
  {
    if (v2 >> 59) {
LABEL_145:
    }
      abort();
    __p[0] = &v90[1];
    uint64_t v3 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<__orc_rt::RemoteSymbolLookupSetElement>>(v2);
    uint64_t v5 = *((void *)&v90[0] + 1);
    uint64_t v6 = *(void *)&v90[0];
    if (*((void *)&v90[0] + 1) == *(void *)&v90[0])
    {
      int64x2_t v9 = vdupq_n_s64(*((unint64_t *)&v90[0] + 1));
      unint64_t v7 = v3;
    }
    else
    {
      unint64_t v7 = v3;
      do
      {
        long long v8 = *(_OWORD *)(v5 - 32);
        *((void *)v7 - 2) = *(void *)(v5 - 16);
        *((_OWORD *)v7 - 2) = v8;
        *(void *)(v5 - 24) = 0;
        *(void *)(v5 - 16) = 0;
        *(void *)(v5 - 32) = 0;
        *(v7 - 8) = *(unsigned char *)(v5 - 8);
        v7 -= 32;
        v5 -= 32;
      }
      while (v5 != v6);
      int64x2_t v9 = (int64x2_t)v90[0];
    }
    *(void *)&v90[0] = v7;
    *((void *)&v90[0] + 1) = v3;
    *(int64x2_t *)&v91[8] = v9;
    uint64_t v10 = *(void *)&v90[1];
    *(void *)&v90[1] = &v3[32 * v4];
    *(void *)&v91[24] = v10;
    *(void *)v91 = v9.i64[0];
    std::__split_buffer<__orc_rt::RemoteSymbolLookupSetElement>::~__split_buffer((uint64_t)v91);
    uint64_t v11 = 0;
    while (1)
    {
      memset(&v101, 0, sizeof(v101));
      if (!__orc_rt::SPSSerializationTraits<__orc_rt::SPSSequence<char>,std::string,void>::deserialize((uint64_t)&v98, &v101)|| !(void)v99)
      {
        break;
      }
      char v12 = *v98++;
      *(void *)&long long v99 = v99 - 1;
      char v102 = v12;
      v96[0] = v101.__r_.__value_.__l.__size_;
      std::string::size_type v13 = v101.__r_.__value_.__r.__words[0];
      *(void *)((char *)v96 + 7) = *(std::string::size_type *)((char *)&v101.__r_.__value_.__r.__words[1] + 7);
      char v14 = HIBYTE(v101.__r_.__value_.__r.__words[2]);
      memset(&v101, 0, sizeof(v101));
      uint64_t v15 = *((void *)&v90[0] + 1);
      if (*((void *)&v90[0] + 1) >= *(void *)&v90[1])
      {
        uint64_t v17 = (uint64_t)(*((void *)&v90[0] + 1) - *(void *)&v90[0]) >> 5;
        unint64_t v18 = v17 + 1;
        if ((unint64_t)(v17 + 1) >> 59) {
          goto LABEL_145;
        }
        uint64_t v19 = *(void *)&v90[1] - *(void *)&v90[0];
        if ((uint64_t)(*(void *)&v90[1] - *(void *)&v90[0]) >> 4 > v18) {
          unint64_t v18 = v19 >> 4;
        }
        if ((unint64_t)v19 >= 0x7FFFFFFFFFFFFFE0) {
          unint64_t v20 = 0x7FFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v20 = v18;
        }
        __p[0] = &v90[1];
        int v21 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<__orc_rt::RemoteSymbolLookupSetElement>>(v20);
        unint64_t v23 = &v21[32 * v17];
        *(void *)unint64_t v23 = v13;
        *((void *)v23 + 1) = v96[0];
        *(void *)(v23 + 15) = *(void *)((char *)v96 + 7);
        v23[23] = v14;
        v96[0] = 0;
        *(void *)((char *)v96 + 7) = 0;
        v23[24] = v12;
        uint64_t v24 = *((void *)&v90[0] + 1);
        uint64_t v25 = *(void *)&v90[0];
        if (*((void *)&v90[0] + 1) == *(void *)&v90[0])
        {
          int64x2_t v28 = vdupq_n_s64(*((unint64_t *)&v90[0] + 1));
          int8x8_t v26 = &v21[32 * v17];
        }
        else
        {
          int8x8_t v26 = &v21[32 * v17];
          do
          {
            long long v27 = *(_OWORD *)(v24 - 32);
            *((void *)v26 - 2) = *(void *)(v24 - 16);
            *((_OWORD *)v26 - 2) = v27;
            *(void *)(v24 - 24) = 0;
            *(void *)(v24 - 16) = 0;
            *(void *)(v24 - 32) = 0;
            *(v26 - 8) = *(unsigned char *)(v24 - 8);
            v26 -= 32;
            v24 -= 32;
          }
          while (v24 != v25);
          int64x2_t v28 = (int64x2_t)v90[0];
        }
        unint64_t v16 = v23 + 32;
        *(void *)&v90[0] = v26;
        *((void *)&v90[0] + 1) = v23 + 32;
        *(int64x2_t *)&v91[8] = v28;
        uint64_t v29 = *(void *)&v90[1];
        *(void *)&v90[1] = &v21[32 * v22];
        *(void *)&v91[24] = v29;
        *(void *)v91 = v28.i64[0];
        std::__split_buffer<__orc_rt::RemoteSymbolLookupSetElement>::~__split_buffer((uint64_t)v91);
      }
      else
      {
        **((void **)&v90[0] + 1) = v13;
        *(void *)(v15 + 8) = v96[0];
        *(void *)(v15 + 15) = *(void *)((char *)v96 + 7);
        *(unsigned char *)(v15 + 23) = v14;
        v96[0] = 0;
        *(void *)((char *)v96 + 7) = 0;
        *(unsigned char *)(v15 + 24) = v12;
        unint64_t v16 = (char *)(v15 + 32);
      }
      *((void *)&v90[0] + 1) = v16;
      if (SHIBYTE(v101.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v101.__r_.__value_.__l.__data_);
      }
      if (++v11 == v2) {
        goto LABEL_31;
      }
    }
    if (SHIBYTE(v101.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v101.__r_.__value_.__l.__data_);
    }
    goto LABEL_94;
  }
LABEL_31:
  uint8x8_t v30 = (void *)*((void *)&v89 + 1);
  unsigned long long v33 = v90[0];
  unint64_t v32 = (uint64_t *)(v33 >> 64);
  unint64_t v31 = (uint64_t *)v33;
  v96[0] = *(void *)&v90[0];
  *(_OWORD *)&v96[1] = *(_OWORD *)((char *)v90 + 8);
  memset(v90, 0, 24);
  unint64_t v34 = v32;
  if (v31 != v32)
  {
    unint64_t v35 = 0;
    unint64_t v36 = 0;
    unint64_t v37 = 0;
    while (1)
    {
      if (*((char *)v31 + 23) < 0)
      {
        if (!v31[1])
        {
LABEL_42:
          if (*((unsigned char *)v31 + 24)) {
            operator new();
          }
          if ((unint64_t)v36 >= v35)
          {
            uint64_t v42 = (v36 - v37) >> 4;
            unint64_t v43 = v42 + 1;
            if ((unint64_t)(v42 + 1) >> 60) {
              goto LABEL_145;
            }
            if ((uint64_t)(v35 - (void)v37) >> 3 > v43) {
              unint64_t v43 = (uint64_t)(v35 - (void)v37) >> 3;
            }
            if (v35 - (unint64_t)v37 >= 0x7FFFFFFFFFFFFFF0) {
              unint64_t v44 = 0xFFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v44 = v43;
            }
            if (v44) {
              unint64_t v44 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<__orc_rt::ExecutorSymbolDef>>(v44);
            }
            else {
              uint64_t v45 = 0;
            }
            uint64_t v50 = (char *)(v44 + 16 * v42);
            *(void *)uint64_t v50 = 0;
            *((void *)v50 + 1) = 0;
            if (v36 != v37)
            {
              unint64_t v51 = v44 + 16 * v42;
              do
              {
                uint64_t v54 = *((void *)v36 - 2);
                v36 -= 16;
                __int16 v55 = *((_WORD *)v36 + 4);
                *(void *)(v51 - 16) = v54;
                v51 -= 16;
                *(_WORD *)(v51 + 8) = v55;
              }
              while (v36 != v37);
              goto LABEL_86;
            }
            goto LABEL_87;
          }
LABEL_54:
          uint64_t v41 = v36 + 16;
          *(void *)unint64_t v36 = 0;
          *((void *)v36 + 1) = 0;
          goto LABEL_90;
        }
        uint8x8_t v38 = (const char *)*v31;
      }
      else
      {
        uint8x8_t v38 = (const char *)v31;
        if (!*((unsigned char *)v31 + 23)) {
          goto LABEL_42;
        }
      }
      if (*v38 != 95)
      {
        uint64_t v59 = (std::string *)std::string::basic_string[abi:nn180100]<0>(&v101, "lookup called on ");
        int v60 = *((char *)v31 + 23);
        if (v60 >= 0) {
          uint64_t v61 = (const std::string::value_type *)v31;
        }
        else {
          uint64_t v61 = (const std::string::value_type *)*v31;
        }
        if (v60 >= 0) {
          std::string::size_type v62 = *((unsigned __int8 *)v31 + 23);
        }
        else {
          std::string::size_type v62 = v31[1];
        }
        uint64_t v63 = std::string::append(v59, v61, v62);
        std::string::size_type v64 = v63->__r_.__value_.__r.__words[2];
        *(_OWORD *)v91 = *(_OWORD *)&v63->__r_.__value_.__l.__data_;
        *(void *)&v91[16] = v64;
        v63->__r_.__value_.__l.__size_ = 0;
        v63->__r_.__value_.__r.__words[2] = 0;
        v63->__r_.__value_.__r.__words[0] = 0;
        std::string::size_type v65 = ", but symbol does notstart with an '_'";
        std::string::size_type v66 = 38;
LABEL_113:
        int v73 = std::string::append((std::string *)v91, v65, v66);
        *(void *)&long long v103 = v73->__r_.__value_.__l.__size_;
        *(void *)((char *)&v103 + 7) = *(std::string::size_type *)((char *)&v73->__r_.__value_.__r.__words[1] + 7);
        v73->__r_.__value_.__l.__size_ = 0;
        v73->__r_.__value_.__r.__words[2] = 0;
        v73->__r_.__value_.__r.__words[0] = 0;
        operator new();
      }
      unint64_t v39 = dlsym(v30, v38 + 1);
      if (!v39)
      {
        if (*((unsigned char *)v31 + 24))
        {
          uint64_t v67 = (std::string *)std::string::basic_string[abi:nn180100]<0>(&v101, "symbol ");
          int v68 = *((char *)v31 + 23);
          if (v68 >= 0) {
            unint64_t v69 = (const std::string::value_type *)v31;
          }
          else {
            unint64_t v69 = (const std::string::value_type *)*v31;
          }
          if (v68 >= 0) {
            std::string::size_type v70 = *((unsigned __int8 *)v31 + 23);
          }
          else {
            std::string::size_type v70 = v31[1];
          }
          uint64_t v71 = std::string::append(v67, v69, v70);
          std::string::size_type v72 = v71->__r_.__value_.__r.__words[2];
          *(_OWORD *)v91 = *(_OWORD *)&v71->__r_.__value_.__l.__data_;
          *(void *)&v91[16] = v72;
          v71->__r_.__value_.__l.__size_ = 0;
          v71->__r_.__value_.__r.__words[2] = 0;
          v71->__r_.__value_.__r.__words[0] = 0;
          std::string::size_type v65 = " not found";
          std::string::size_type v66 = 10;
          goto LABEL_113;
        }
        if ((unint64_t)v36 >= v35)
        {
          uint64_t v48 = (v36 - v37) >> 4;
          unint64_t v49 = v48 + 1;
          if ((unint64_t)(v48 + 1) >> 60) {
            goto LABEL_145;
          }
          if ((uint64_t)(v35 - (void)v37) >> 3 > v49) {
            unint64_t v49 = (uint64_t)(v35 - (void)v37) >> 3;
          }
          if (v35 - (unint64_t)v37 >= 0x7FFFFFFFFFFFFFF0) {
            unint64_t v44 = 0xFFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v44 = v49;
          }
          if (v44) {
            unint64_t v44 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<__orc_rt::ExecutorSymbolDef>>(v44);
          }
          else {
            uint64_t v45 = 0;
          }
          uint64_t v50 = (char *)(v44 + 16 * v48);
          *(void *)uint64_t v50 = 0;
          *((void *)v50 + 1) = 0;
          if (v36 != v37)
          {
            unint64_t v51 = v44 + 16 * v48;
            do
            {
              uint64_t v56 = *((void *)v36 - 2);
              v36 -= 16;
              __int16 v57 = *((_WORD *)v36 + 4);
              *(void *)(v51 - 16) = v56;
              v51 -= 16;
              *(_WORD *)(v51 + 8) = v57;
            }
            while (v36 != v37);
LABEL_86:
            unint64_t v36 = v37;
            unint64_t v37 = (char *)v51;
            goto LABEL_88;
          }
LABEL_87:
          unint64_t v37 = v50;
          goto LABEL_88;
        }
        goto LABEL_54;
      }
      uint8x8_t v40 = v39;
      if ((unint64_t)v36 >= v35)
      {
        uint64_t v46 = (v36 - v37) >> 4;
        unint64_t v47 = v46 + 1;
        if ((unint64_t)(v46 + 1) >> 60) {
          goto LABEL_145;
        }
        if ((uint64_t)(v35 - (void)v37) >> 3 > v47) {
          unint64_t v47 = (uint64_t)(v35 - (void)v37) >> 3;
        }
        if (v35 - (unint64_t)v37 >= 0x7FFFFFFFFFFFFFF0) {
          unint64_t v44 = 0xFFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v44 = v47;
        }
        if (v44) {
          unint64_t v44 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<__orc_rt::ExecutorSymbolDef>>(v44);
        }
        else {
          uint64_t v45 = 0;
        }
        uint64_t v50 = (char *)(v44 + 16 * v46);
        *(void *)uint64_t v50 = v40;
        *((_WORD *)v50 + 4) = 12288;
        if (v36 != v37)
        {
          unint64_t v51 = v44 + 16 * v46;
          do
          {
            uint64_t v52 = *((void *)v36 - 2);
            v36 -= 16;
            __int16 v53 = *((_WORD *)v36 + 4);
            *(void *)(v51 - 16) = v52;
            v51 -= 16;
            *(_WORD *)(v51 + 8) = v53;
          }
          while (v36 != v37);
          goto LABEL_86;
        }
        unint64_t v37 = (char *)(v44 + 16 * v46);
LABEL_88:
        unint64_t v35 = v44 + 16 * v45;
        uint64_t v41 = v50 + 16;
        if (v36) {
          operator delete(v36);
        }
        goto LABEL_90;
      }
      *(void *)unint64_t v36 = v39;
      *((_WORD *)v36 + 4) = 12288;
      uint64_t v41 = v36 + 16;
LABEL_90:
      v31 += 4;
      unint64_t v36 = v41;
      if (v31 == v34) {
        goto LABEL_97;
      }
    }
  }
  unint64_t v35 = 0;
  uint64_t v41 = 0;
  unint64_t v37 = 0;
LABEL_97:
  v98 = v37;
  *(void *)&long long v99 = v41;
  *((void *)&v99 + 1) = v35;
  *(void *)v91 = v96;
  std::vector<__orc_rt::RemoteSymbolLookupSetElement>::__destroy_vector::operator()[abi:nn180100]((void ***)v91);
  char v100 = 0;
  uint64_t v74 = v98;
  long long v75 = v99;
  v98 = 0;
  long long v99 = 0uLL;
  memset(v96, 0, sizeof(v96));
  char v97 = 0;
  char v102 = 0;
  v91[0] = 1;
  *(void *)&v91[8] = v74;
  *(_OWORD *)&v91[16] = v75;
  memset(&v101, 0, sizeof(v101));
  __p[1] = 0;
  uint64_t v93 = 0;
  v76 = (char *)&v103 + 1;
  __p[0] = 0;
  if (v74 == (const char *)v75)
  {
    unint64_t v77 = 8;
    size_t v79 = 9;
LABEL_118:
    uint64_t v80 = (long long *)malloc_type_malloc(v79, 0xB91D0188uLL);
    v76 = (char *)v80 + 1;
    *(void *)&long long v103 = v80;
    *((void *)&v103 + 1) = v79;
    char v78 = v91[0];
    goto LABEL_121;
  }
  unint64_t v77 = 10 * ((unint64_t)(v75 - (void)v74 - 16) >> 4) + 18;
  char v78 = 1;
  size_t v79 = 10 * ((unint64_t)(v75 - (void)v74 - 16) >> 4) + 19;
  if (v79 >= 9) {
    goto LABEL_118;
  }
  *(void *)&long long v103 = 0;
  *((void *)&v103 + 1) = 10 * ((unint64_t)(v75 - (void)v74 - 16) >> 4) + 19;
  if (10 * ((unint64_t)(v75 - (void)v74 - 16) >> 4) == -19) {
    goto LABEL_135;
  }
  uint64_t v80 = &v103;
LABEL_121:
  *(unsigned char *)uint64_t v80 = v78;
  long long v94 = v76;
  unint64_t v95 = v77;
  if (v91[0])
  {
    if (v77 < 8) {
      goto LABEL_135;
    }
    *(void *)((char *)v80 + 1) = (uint64_t)(*(void *)&v91[16] - *(void *)&v91[8]) >> 4;
    unint64_t v95 = v77 - 8;
    uint64_t v82 = *(void *)&v91[16];
    uint64_t v81 = *(void *)&v91[8];
    if (*(void *)&v91[8] != *(void *)&v91[16])
    {
      if (v77 - 8 >= 8)
      {
        v83 = (char *)v80 + 9;
        unint64_t v84 = v77 - 18;
        while (1)
        {
          *(void *)v83 = *(void *)v81;
          if (v84 == -2 || (v83[8] = *(unsigned char *)(v81 + 9), v84 == -1))
          {
            unint64_t v87 = 0;
            goto LABEL_134;
          }
          v83[9] = *(unsigned char *)(v81 + 8);
          v81 += 16;
          if (v81 == v82) {
            break;
          }
          v83 += 10;
          unint64_t v85 = v84 - 10;
          BOOL v86 = v84 >= 8;
          v84 -= 10;
          if (!v86)
          {
            unint64_t v87 = v85 + 10;
LABEL_134:
            unint64_t v95 = v87;
            goto LABEL_135;
          }
        }
        unint64_t v95 = v84;
        goto LABEL_132;
      }
LABEL_135:
      __orc_rt::WrapperFunctionResult::createOutOfBandError((__orc_rt::WrapperFunctionResult *)&v88, "Error serializing arguments to blob in call");
      if (*((void *)&v103 + 1) > 8uLL || !*((void *)&v103 + 1) && (void)v103) {
        free((void *)v103);
      }
      goto LABEL_139;
    }
  }
  else if (!__orc_rt::SPSSerializationTraits<__orc_rt::SPSSequence<char>,std::string,void>::serialize(&v94, (uint64_t)__p))
  {
    goto LABEL_135;
  }
LABEL_132:
  long long v88 = v103;
LABEL_139:
  if (SHIBYTE(v93) < 0) {
    operator delete(__p[0]);
  }
  if (*(void *)&v91[8])
  {
    *(void *)&v91[16] = *(void *)&v91[8];
    operator delete(*(void **)&v91[8]);
  }
  __orc_rt::Expected<std::vector<__orc_rt::ExecutorSymbolDef>>::~Expected((uint64_t)&v101);
  __orc_rt::Expected<std::vector<__orc_rt::ExecutorSymbolDef>>::~Expected((uint64_t)v96);
  __orc_rt::Expected<std::vector<__orc_rt::ExecutorSymbolDef>>::~Expected((uint64_t)&v98);
LABEL_95:
  *(void *)v91 = v90;
  std::vector<__orc_rt::RemoteSymbolLookupSetElement>::__destroy_vector::operator()[abi:nn180100]((void ***)v91);
  return v88;
}

void xojit_dylibmgr_create()
{
}

std::mutex *xojit_dylibmgr_destroy(std::mutex *this)
{
  if (this)
  {
    uint64_t v1 = this;
    sig = (void *)this[1].__m_.__sig;
    if (sig)
    {
      *(void *)v1[1].__m_.__opaque = sig;
      operator delete(sig);
    }
    std::mutex::~mutex(v1);
    JUMPOUT(0x263E50FC0);
  }
  return this;
}

void xojit_xpcmemmgr_create()
{
}

std::mutex *xojit_xpcmemmgr_destroy(std::mutex *this)
{
  if (this)
  {
    uint64_t v1 = this;
    unint64_t v2 = *(char **)&this[1].__m_.__opaque[48];
    if (v2)
    {
      do
      {
        uint64_t v3 = *(char **)v2;
        long long v8 = (void **)(v2 + 24);
        std::vector<__orc_rt::WrapperFunctionCall>::__destroy_vector::operator()[abi:nn180100](&v8);
        operator delete(v2);
        unint64_t v2 = v3;
      }
      while (v3);
    }
    uint64_t v4 = *(void **)&v1[1].__m_.__opaque[32];
    *(void *)&v1[1].__m_.__opaque[32] = 0;
    if (v4) {
      operator delete(v4);
    }
    uint64_t v5 = *(void **)&v1[1].__m_.__opaque[8];
    if (v5)
    {
      do
      {
        uint64_t v6 = (void *)*v5;
        operator delete(v5);
        uint64_t v5 = v6;
      }
      while (v6);
    }
    sig = (void *)v1[1].__m_.__sig;
    v1[1].__m_.__sig = 0;
    if (sig) {
      operator delete(sig);
    }
    std::mutex::~mutex(v1);
    JUMPOUT(0x263E50FC0);
  }
  return this;
}

void __orc_rt::WrapperFunctionCall::runWithSPSRet<__orc_rt::SPSEmpty,__orc_rt::SPSEmpty>(void *a1, uint64_t a2)
{
  uint64_t v3 = (void *)(*(uint64_t (**)(void, void))a2)(*(void *)(a2 + 8), *(void *)(a2 + 16) - *(void *)(a2 + 8));
  if (!v4)
  {
    if (v3) {
      operator new();
    }
    goto LABEL_9;
  }
  if (v4 <= 8)
  {
LABEL_9:
    *a1 = 0;
    return;
  }
  *a1 = 0;
  free(v3);
}

void __orc_rt::StringError::~StringError(void **this)
{
  *this = &unk_270DC44D0;
  if (*((char *)this + 31) < 0) {
    operator delete(this[1]);
  }
}

{
  uint64_t vars8;

  *this = &unk_270DC44D0;
  if (*((char *)this + 31) < 0) {
    operator delete(this[1]);
  }
  JUMPOUT(0x263E50FC0);
}

void *__orc_rt::RTTIExtends<__orc_rt::StringError,__orc_rt::ErrorInfoBase>::dynamicClassID()
{
  return &unk_26B420069;
}

uint64_t __orc_rt::RTTIExtends<__orc_rt::StringError,__orc_rt::ErrorInfoBase>::isA(uint64_t a1, void *a2)
{
  BOOL v3 = a2 == &_MergedGlobals || a2 == &__orc_rt::RTTIRoot::ID;
  return a2 == &unk_26B420069 || v3;
}

void __orc_rt::StringError::toString(__orc_rt::StringError *this@<X0>, std::string *a2@<X8>)
{
  if (*((char *)this + 31) < 0)
  {
    std::string::__init_copy_ctor_external(a2, *((const std::string::value_type **)this + 1), *((void *)this + 2));
  }
  else
  {
    *(_OWORD *)&a2->__r_.__value_.__l.__data_ = *(_OWORD *)((char *)this + 8);
    a2->__r_.__value_.__r.__words[2] = *((void *)this + 3);
  }
}

void std::string::__init_copy_ctor_external(std::string *this, const std::string::value_type *__s, std::string::size_type __sz)
{
  uint64_t v5 = this;
  if (__sz > 0x16)
  {
    if (__sz >= 0x7FFFFFFFFFFFFFF8) {
      abort();
    }
    std::string::size_type v6 = (__sz & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__sz | 7) != 0x17) {
      std::string::size_type v6 = __sz | 7;
    }
    std::string::size_type v7 = v6 + 1;
    long long v8 = (std::string *)operator new(v6 + 1);
    v5->__r_.__value_.__l.__size_ = __sz;
    v5->__r_.__value_.__r.__words[2] = v7 | 0x8000000000000000;
    v5->__r_.__value_.__r.__words[0] = (std::string::size_type)v8;
    uint64_t v5 = v8;
  }
  else
  {
    *((unsigned char *)&this->__r_.__value_.__s + 23) = __sz;
  }
  memmove(v5, __s, __sz + 1);
}

void std::__throw_bad_array_new_length[abi:nn180100]()
{
}

uint64_t __orc_rt::Error::assertIsChecked(uint64_t this)
{
  if (this != 1)
  {
    fwrite("Error must be checked prior to destruction.\n", 0x2CuLL, 1uLL, (FILE *)*MEMORY[0x263EF8348]);
    abort();
  }
  return this;
}

void *std::construct_at[abi:nn180100]<__orc_rt::WrapperFunctionCall,__orc_rt::WrapperFunctionCall const&,__orc_rt::WrapperFunctionCall*>(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = 0;
  a1[2] = 0;
  a1[3] = 0;
  unint64_t v4 = (unsigned char *)a2[1];
  BOOL v3 = (unsigned char *)a2[2];
  size_t v5 = v3 - v4;
  if (v3 != v4)
  {
    if (v3 - v4 < 0) {
      abort();
    }
    std::string::size_type v6 = (char *)operator new(v3 - v4);
    a1[1] = v6;
    a1[2] = v6;
    std::string::size_type v7 = &v6[v5];
    a1[3] = &v6[v5];
    memmove(v6, v4, v5);
    a1[2] = v7;
  }
  return a1;
}

unint64_t std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:nn180100](uint64_t *a1, unint64_t a2)
{
  if (a2 > 0x20)
  {
    if (a2 <= 0x40)
    {
      uint64_t v5 = *(uint64_t *)((char *)a1 + a2 - 16);
      uint64_t v6 = *a1 - 0x3C5A37A36834CED9 * (v5 + a2);
      uint64_t v8 = a1[2];
      uint64_t v7 = a1[3];
      uint64_t v9 = __ROR8__(v6 + v7, 52);
      uint64_t v10 = v6 + a1[1];
      uint64_t v11 = __ROR8__(v10, 7);
      uint64_t v12 = v10 + v8;
      uint64_t v13 = *(uint64_t *)((char *)a1 + a2 - 32) + v8;
      uint64_t v14 = *(uint64_t *)((char *)a1 + a2 - 8) + v7;
      uint64_t v15 = __ROR8__(v14 + v13, 52);
      uint64_t v16 = v11 + __ROR8__(*a1 - 0x3C5A37A36834CED9 * (v5 + a2), 37) + v9;
      uint64_t v17 = __ROR8__(v13, 37);
      uint64_t v18 = *(uint64_t *)((char *)a1 + a2 - 24) + v13;
      uint64_t v19 = __ROR8__(v18, 7);
      uint64_t v20 = v16 + __ROR8__(v12, 31);
      uint64_t v21 = v18 + v5;
      uint64_t v22 = v21 + v14;
      unint64_t v23 = 0x9AE16A3B2F90404FLL;
      unint64_t v24 = 0xC3A5C85C97CB3127 * (v22 + v20) - 0x651E95C4D06FBFB1 * (v12 + v7 + v17 + v19 + v15 + __ROR8__(v21, 31));
      unint64_t v25 = v20 - 0x3C5A37A36834CED9 * (v24 ^ (v24 >> 47));
      return (v25 ^ (v25 >> 47)) * v23;
    }
    unint64_t v4 = 0x9DDFEA08EB382D69;
    uint64_t v32 = *(uint64_t *)((char *)a1 + a2 - 48);
    uint64_t v33 = *(uint64_t *)((char *)a1 + a2 - 40);
    uint64_t v34 = *(uint64_t *)((char *)a1 + a2 - 24);
    uint64_t v36 = *(uint64_t *)((char *)a1 + a2 - 64);
    uint64_t v35 = *(uint64_t *)((char *)a1 + a2 - 56);
    uint64_t v37 = *(uint64_t *)((char *)a1 + a2 - 16);
    uint64_t v38 = *(uint64_t *)((char *)a1 + a2 - 8);
    unint64_t v39 = v35 + v37;
    unint64_t v40 = 0x9DDFEA08EB382D69
        * (v34 ^ ((0x9DDFEA08EB382D69 * (v34 ^ (v32 + a2))) >> 47) ^ (0x9DDFEA08EB382D69 * (v34 ^ (v32 + a2))));
    unint64_t v41 = 0x9DDFEA08EB382D69 * (v40 ^ (v40 >> 47));
    unint64_t v42 = v32 + v35 + v36 + a2;
    uint64_t v43 = v42 + v33;
    unint64_t v44 = __ROR8__(v42, 44) + v36 + a2 + __ROR8__(v36 + a2 + v33 - 0x622015F714C7D297 * (v40 ^ (v40 >> 47)), 21);
    uint64_t v45 = v35 + v37 + *(uint64_t *)((char *)a1 + a2 - 32) - 0x4B6D499041670D8DLL;
    uint64_t v46 = v34 + v37 + v45;
    uint64_t v47 = __ROR8__(v46, 44);
    uint64_t v48 = v46 + v38;
    uint64_t v49 = v47 + v45 + __ROR8__(v45 + v33 + v38, 21);
    uint64_t v51 = *a1;
    uint64_t v50 = a1 + 4;
    unint64_t v52 = v51 - 0x4B6D499041670D8DLL * v33;
    uint64_t v53 = -(uint64_t)((a2 - 1) & 0xFFFFFFFFFFFFFFC0);
    do
    {
      uint64_t v54 = *(v50 - 3);
      uint64_t v55 = v52 + v43 + v39 + v54;
      uint64_t v56 = v50[2];
      uint64_t v57 = v50[3];
      uint64_t v58 = v50[1];
      unint64_t v39 = v58 + v43 - 0x4B6D499041670D8DLL * __ROR8__(v39 + v44 + v56, 42);
      uint64_t v59 = v41 + v48;
      uint64_t v60 = *(v50 - 2);
      uint64_t v61 = *(v50 - 1);
      uint64_t v62 = *(v50 - 4) - 0x4B6D499041670D8DLL * v44;
      uint64_t v63 = v62 + v48 + v61;
      uint64_t v64 = v62 + v54 + v60;
      uint64_t v43 = v64 + v61;
      uint64_t v65 = __ROR8__(v64, 44) + v62;
      unint64_t v66 = (0xB492B66FBE98F273 * __ROR8__(v55, 37)) ^ v49;
      unint64_t v52 = 0xB492B66FBE98F273 * __ROR8__(v59, 33);
      unint64_t v44 = v65 + __ROR8__(v63 + v66, 21);
      unint64_t v67 = v52 + v49 + *v50;
      uint64_t v48 = v58 + v56 + v67 + v57;
      uint64_t v49 = __ROR8__(v58 + v56 + v67, 44) + v67 + __ROR8__(v39 + v60 + v67 + v57, 21);
      v50 += 8;
      unint64_t v41 = v66;
      v53 += 64;
    }
    while (v53);
    unint64_t v68 = v52
        - 0x622015F714C7D297
        * ((0x9DDFEA08EB382D69
          * (v49 ^ ((0x9DDFEA08EB382D69 * (v49 ^ v44)) >> 47) ^ (0x9DDFEA08EB382D69 * (v49 ^ v44)))) ^ ((0x9DDFEA08EB382D69 * (v49 ^ ((0x9DDFEA08EB382D69 * (v49 ^ v44)) >> 47) ^ (0x9DDFEA08EB382D69 * (v49 ^ v44)))) >> 47));
    unint64_t v69 = 0x9DDFEA08EB382D69
        * (v68 ^ (v66
                - 0x4B6D499041670D8DLL * (v39 ^ (v39 >> 47))
                - 0x622015F714C7D297
                * ((0x9DDFEA08EB382D69
                  * (v48 ^ ((0x9DDFEA08EB382D69 * (v48 ^ v43)) >> 47) ^ (0x9DDFEA08EB382D69 * (v48 ^ v43)))) ^ ((0x9DDFEA08EB382D69 * (v48 ^ ((0x9DDFEA08EB382D69 * (v48 ^ v43)) >> 47) ^ (0x9DDFEA08EB382D69 * (v48 ^ v43)))) >> 47))));
    unint64_t v70 = 0x9DDFEA08EB382D69 * (v68 ^ (v69 >> 47) ^ v69);
    goto LABEL_13;
  }
  if (a2 > 0x10)
  {
    uint64_t v26 = a1[1];
    unint64_t v27 = 0xB492B66FBE98F273 * *a1;
    uint64_t v28 = __ROR8__(0x9AE16A3B2F90404FLL * *(uint64_t *)((char *)a1 + a2 - 8), 30) + __ROR8__(v27 - v26, 43);
    unint64_t v29 = v27 + a2 + __ROR8__(v26 ^ 0xC949D7C7509E6557, 20) - 0x9AE16A3B2F90404FLL * *(uint64_t *)((char *)a1 + a2 - 8);
    unint64_t v23 = 0x9DDFEA08EB382D69;
    unint64_t v30 = 0x9DDFEA08EB382D69 * ((v28 - 0x3C5A37A36834CED9 * *(uint64_t *)((char *)a1 + a2 - 16)) ^ v29);
    unint64_t v31 = v29 ^ (v30 >> 47) ^ v30;
LABEL_8:
    unint64_t v25 = 0x9DDFEA08EB382D69 * v31;
    return (v25 ^ (v25 >> 47)) * v23;
  }
  if (a2 < 9)
  {
    if (a2 >= 4)
    {
      uint64_t v72 = *(unsigned int *)((char *)a1 + a2 - 4);
      unint64_t v23 = 0x9DDFEA08EB382D69;
      unint64_t v73 = 0x9DDFEA08EB382D69 * (((8 * *(_DWORD *)a1) + a2) ^ v72);
      unint64_t v31 = v72 ^ (v73 >> 47) ^ v73;
      goto LABEL_8;
    }
    unint64_t v4 = 0x9AE16A3B2F90404FLL;
    if (!a2) {
      return v4;
    }
    unint64_t v70 = (0xC949D7C7509E6557 * (a2 + 4 * *((unsigned __int8 *)a1 + a2 - 1))) ^ (0x9AE16A3B2F90404FLL
                                                                                   * (*(unsigned __int8 *)a1 | ((unint64_t)*((unsigned __int8 *)a1 + (a2 >> 1)) << 8)));
LABEL_13:
    v4 *= v70 ^ (v70 >> 47);
    return v4;
  }
  uint64_t v2 = *(uint64_t *)((char *)a1 + a2 - 8);
  uint64_t v3 = __ROR8__(v2 + a2, a2);
  return (0x9DDFEA08EB382D69
        * ((0x9DDFEA08EB382D69
          * (v3 ^ ((0x9DDFEA08EB382D69 * (v3 ^ *a1)) >> 47) ^ (0x9DDFEA08EB382D69 * (v3 ^ *a1)))) ^ ((0x9DDFEA08EB382D69 * (v3 ^ ((0x9DDFEA08EB382D69 * (v3 ^ *a1)) >> 47) ^ (0x9DDFEA08EB382D69 * (v3 ^ *a1)))) >> 47))) ^ v2;
}

void std::vector<__orc_rt::WrapperFunctionCall>::__clear[abi:nn180100](uint64_t *a1)
{
  uint64_t v2 = *a1;
  for (uint64_t i = a1[1]; i != v2; i -= 32)
  {
    unint64_t v4 = *(void **)(i - 24);
    if (v4)
    {
      *(void *)(i - 16) = v4;
      operator delete(v4);
    }
  }
  a1[1] = v2;
}

void std::vector<__orc_rt::WrapperFunctionCall>::__destroy_vector::operator()[abi:nn180100](void ***a1)
{
  uint64_t v2 = *a1;
  if (*v2)
  {
    std::vector<__orc_rt::WrapperFunctionCall>::__clear[abi:nn180100]((uint64_t *)v2);
    uint64_t v3 = **a1;
    operator delete(v3);
  }
}

void std::vector<__orc_rt::AllocationActionsPair>::__destroy_vector::operator()[abi:nn180100](void ***a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = **a1;
  if (v2)
  {
    unint64_t v4 = v1[1];
    uint64_t v5 = **a1;
    if (v4 != v2)
    {
      do
      {
        v4 -= 8;
        std::__destroy_at[abi:nn180100]<__orc_rt::AllocationActionsPair,0>(v4);
      }
      while (v4 != v2);
      uint64_t v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void std::__destroy_at[abi:nn180100]<__orc_rt::AllocationActionsPair,0>(void *a1)
{
  uint64_t v2 = (void *)a1[5];
  if (v2)
  {
    a1[6] = v2;
    operator delete(v2);
  }
  uint64_t v3 = (void *)a1[1];
  if (v3)
  {
    a1[2] = v3;
    operator delete(v3);
  }
}

void std::__assoc_state<std::pair<void *,orc_rt_CWrapperFunctionResult (*)(void *,unsigned long long,char const*,unsigned long)>>::~__assoc_state(uint64_t a1)
{
  *(void *)a1 = MEMORY[0x263F8C320] + 16;
  uint64_t v2 = (std::exception_ptr *)(a1 + 16);
  std::condition_variable::~condition_variable((std::condition_variable *)(a1 + 88));
  std::mutex::~mutex((std::mutex *)(a1 + 24));
  std::exception_ptr::~exception_ptr(v2);
  std::__shared_count::~__shared_count((std::__shared_count *)a1);
}

{
  std::exception_ptr *v2;
  uint64_t vars8;

  *(void *)a1 = MEMORY[0x263F8C320] + 16;
  uint64_t v2 = (std::exception_ptr *)(a1 + 16);
  std::condition_variable::~condition_variable((std::condition_variable *)(a1 + 88));
  std::mutex::~mutex((std::mutex *)(a1 + 24));
  std::exception_ptr::~exception_ptr(v2);
  std::__shared_count::~__shared_count((std::__shared_count *)a1);
  JUMPOUT(0x263E50FC0);
}

uint64_t std::__assoc_state<std::pair<void *,orc_rt_CWrapperFunctionResult (*)(void *,unsigned long long,char const*,unsigned long)>>::__on_zero_shared(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)a1 + 8))();
}

uint64_t *std::promise<std::pair<void *,orc_rt_CWrapperFunctionResult (*)(void *,unsigned long long,char const*,unsigned long)>>::~promise(uint64_t *a1)
{
  uint64_t v2 = *a1;
  if (v2)
  {
    if ((*(unsigned char *)(v2 + 136) & 1) == 0)
    {
      v7.__ptr_ = 0;
      uint64_t v3 = *(void *)(v2 + 16);
      std::exception_ptr::~exception_ptr(&v7);
      uint64_t v2 = *a1;
      if (!v3 && *(uint64_t *)(v2 + 8) >= 1)
      {
        uint64_t v5 = std::future_category();
        MEMORY[0x263E50EF0](v6, 4, v5);
        abort();
      }
    }
    if (!atomic_fetch_add((atomic_ullong *volatile)(v2 + 8), 0xFFFFFFFFFFFFFFFFLL)) {
      (*(void (**)(uint64_t))(*(void *)v2 + 16))(v2);
    }
  }
  return a1;
}

std::string *__cdecl std::string::__assign_external(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  LODWORD(v6) = SHIBYTE(this->__r_.__value_.__r.__words[2]);
  if ((v6 & 0x80000000) != 0)
  {
    unint64_t v10 = this->__r_.__value_.__r.__words[2];
    unint64_t v9 = (v10 & 0x7FFFFFFFFFFFFFFFLL) - 1;
    if (v9 < __n)
    {
      std::string::size_type size = this->__r_.__value_.__l.__size_;
      goto LABEL_6;
    }
    unint64_t v6 = HIBYTE(v10);
    std::exception_ptr v7 = (std::string *)this->__r_.__value_.__r.__words[0];
  }
  else
  {
    std::exception_ptr v7 = this;
    if (__n > 0x16)
    {
      std::string::size_type size = HIBYTE(this->__r_.__value_.__r.__words[2]);
      unint64_t v9 = 22;
LABEL_6:
      std::string::__grow_by_and_replace(this, v9, __n - v9, size, 0, size, __n, __s);
      return this;
    }
  }
  if (__n)
  {
    memmove(v7, __s, __n);
    LOBYTE(v6) = *((unsigned char *)&this->__r_.__value_.__s + 23);
  }
  if ((v6 & 0x80) != 0) {
    this->__r_.__value_.__l.__size_ = __n;
  }
  else {
    *((unsigned char *)&this->__r_.__value_.__s + 23) = __n & 0x7F;
  }
  v7->__r_.__value_.__s.__data_[__n] = 0;
  return this;
}

std::string *__cdecl std::string::__assign_external(std::string *this, const std::string::value_type *__s)
{
  size_t v4 = strlen(__s);
  return std::string::__assign_external(this, __s, v4);
}

uint64_t *__orc_rt::detail::ResultSerializer<__orc_rt::SPSExpected<__orc_rt::SPSExecutorAddr>,__orc_rt::Expected<__orc_rt::ExecutorAddr>>::serialize(__orc_rt::WrapperFunctionResult *a1, uint64_t a2)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  char v3 = *(unsigned char *)(a2 + 8);
  *(unsigned char *)(a2 + 8) = v3 & 0xFD;
  if ((v3 & 1) == 0)
  {
    uint64_t v21 = *(void *)a2;
    char v22 = 0;
    char v14 = 1;
    __orc_rt::Expected<__orc_rt::ExecutorAddr>::assertIsChecked(0);
    uint64_t v15 = v21;
    __p = 0;
    size_t v4 = 9;
    unint64_t v17 = 0;
    uint64_t v18 = 0;
LABEL_10:
    unint64_t v9 = (char *)malloc_type_malloc(v4, 0xB91D0188uLL);
    *(void *)&long long v20 = v9;
    *((void *)&v20 + 1) = v4;
    char v10 = v14;
    goto LABEL_11;
  }
  uint64_t v5 = *(void *)a2;
  *(void *)a2 = 0;
  char v14 = 0;
  uint64_t v15 = 0;
  char v22 = v3 & 1;
  uint64_t v21 = 0;
  unint64_t v6 = v5 & 0xFFFFFFFFFFFFFFFELL;
  if ((v5 & 0xFFFFFFFFFFFFFFFELL) != 0
    && (*(unsigned int (**)(unint64_t, void *))(*(void *)v6 + 24))(v5 & 0xFFFFFFFFFFFFFFFELL, &_MergedGlobals))
  {
    (*(void (**)(void **__return_ptr, unint64_t))(*(void *)v6 + 40))(&__p, v5 & 0xFFFFFFFFFFFFFFFELL);
    (*(void (**)(unint64_t))(*(void *)v6 + 8))(v5 & 0xFFFFFFFFFFFFFFFELL);
    uint64_t v7 = 1;
  }
  else
  {
    uint64_t v7 = v5 | 1;
    __p = 0;
    unint64_t v17 = 0;
    uint64_t v18 = 0;
  }
  __orc_rt::Error::assertIsChecked(v7);
  unint64_t v8 = HIBYTE(v18);
  if (v18 < 0) {
    unint64_t v8 = v17;
  }
  size_t v4 = v8 + 9;
  if (v8 <= 0xFFFFFFFFFFFFFFF6) {
    goto LABEL_10;
  }
  *(void *)&long long v20 = 0;
  *((void *)&v20 + 1) = v8 + 9;
  if (v8 == -9) {
    goto LABEL_20;
  }
  char v10 = 0;
  unint64_t v9 = 0;
LABEL_11:
  uint64_t v11 = (char *)&v20;
  if (v4 > 8) {
    uint64_t v11 = v9;
  }
  *uint64_t v11 = v10;
  uint64_t v12 = (uint64_t *)(v11 + 1);
  v19[0] = v12;
  v19[1] = v4 - 1;
  if (v14)
  {
    if (v4 - 1 >= 8)
    {
      *uint64_t v12 = v15;
LABEL_17:
      *(_OWORD *)a1 = v20;
      goto LABEL_24;
    }
  }
  else if (__orc_rt::SPSSerializationTraits<__orc_rt::SPSSequence<char>,std::string,void>::serialize(v19, (uint64_t)&__p))
  {
    goto LABEL_17;
  }
LABEL_20:
  __orc_rt::WrapperFunctionResult::createOutOfBandError(a1, "Error serializing arguments to blob in call");
  if (*((void *)&v20 + 1) > 8uLL || !*((void *)&v20 + 1) && (void)v20) {
    free((void *)v20);
  }
LABEL_24:
  if (SHIBYTE(v18) < 0) {
    operator delete(__p);
  }
  return __orc_rt::Expected<__orc_rt::ExecutorAddr>::~Expected(&v21);
}

BOOL __orc_rt::SPSSerializationTraits<__orc_rt::SPSSequence<char>,std::string,void>::serialize(void *a1, uint64_t a2)
{
  if (a1[1] < 8uLL) {
    return 0;
  }
  uint64_t v2 = *(unsigned __int8 *)(a2 + 23);
  if ((v2 & 0x80u) != 0) {
    uint64_t v2 = *(void *)(a2 + 8);
  }
  *(void *)*a1 = v2;
  char v3 = (unsigned char *)(*a1 + 8);
  uint64_t v4 = a1[1] - 8;
  *a1 = v3;
  a1[1] = v4;
  int v5 = *(char *)(a2 + 23);
  BOOL v6 = v5 < 0;
  if (v5 >= 0) {
    uint64_t v7 = (char *)a2;
  }
  else {
    uint64_t v7 = *(char **)a2;
  }
  if (v6) {
    uint64_t v8 = *(void *)(a2 + 8);
  }
  else {
    uint64_t v8 = *(unsigned __int8 *)(a2 + 23);
  }
  BOOL v9 = v8 == 0;
  if (v8) {
    BOOL v10 = v4 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (!v10)
  {
    uint64_t v11 = v8 - 1;
    do
    {
      char v12 = *v7++;
      *char v3 = v12;
      char v3 = (unsigned char *)(*a1 + 1);
      uint64_t v13 = a1[1] - 1;
      *a1 = v3;
      a1[1] = v13;
      BOOL v9 = v11 == 0;
      if (!v11) {
        break;
      }
      --v11;
    }
    while (v13);
  }
  return v9;
}

uint64_t __orc_rt::Expected<__orc_rt::ExecutorAddr>::assertIsChecked(uint64_t result)
{
  if ((result & 2) != 0)
  {
    fwrite("Expected<T> must be checked before access or destruction.\n", 0x3AuLL, 1uLL, (FILE *)*MEMORY[0x263EF8348]);
    abort();
  }
  return result;
}

uint64_t *__orc_rt::Expected<__orc_rt::ExecutorAddr>::~Expected(uint64_t *a1)
{
  __orc_rt::Expected<__orc_rt::ExecutorAddr>::assertIsChecked(*((unsigned __int8 *)a1 + 8));
  if (a1[1])
  {
    uint64_t v2 = *a1;
    *a1 = 0;
    if (v2) {
      (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
    }
  }
  return a1;
}

uint64_t __orc_rt::detail::ResultSerializer<__orc_rt::SPSError,__orc_rt::Error>::serialize(__orc_rt::WrapperFunctionResult *a1, uint64_t *a2)
{
  __orc_rt::Error::assertIsChecked(1);
  uint64_t v4 = *a2;
  *a2 = 1;
  unint64_t v5 = v4 & 0xFFFFFFFFFFFFFFFELL;
  if ((v4 & 0xFFFFFFFFFFFFFFFELL) != 0)
  {
    char v12 = 1;
    __orc_rt::Error::assertIsChecked(1);
    if ((*(unsigned int (**)(unint64_t, void *))(*(void *)v5 + 24))(v5, &_MergedGlobals))
    {
      (*(void (**)(void **__return_ptr, unint64_t))(*(void *)v5 + 40))(&__p, v5);
      (*(void (**)(unint64_t))(*(void *)v5 + 8))(v5);
      unint64_t v5 = 1;
    }
    else
    {
      __p = 0;
      unint64_t v14 = 0;
      uint64_t v15 = 0;
    }
    __orc_rt::Error::assertIsChecked(v5);
    BOOL v6 = (char *)&v17 + 1;
    unint64_t v7 = HIBYTE(v15);
    if (v15 < 0) {
      unint64_t v7 = v14;
    }
    uint64_t v8 = v7 + 9;
    if (v7 > 0xFFFFFFFFFFFFFFF6)
    {
      *(void *)&long long v17 = 0;
      *((void *)&v17 + 1) = v7 + 9;
      if (v7 == -9) {
        goto LABEL_17;
      }
      BOOL v9 = &v17;
      char v10 = 1;
    }
    else
    {
      BOOL v9 = (long long *)malloc_type_malloc(v7 + 9, 0xB91D0188uLL);
      BOOL v6 = (char *)v9 + 1;
      *(void *)&long long v17 = v9;
      *((void *)&v17 + 1) = v8;
      char v10 = 1;
    }
  }
  else
  {
    char v12 = 0;
    unint64_t v14 = 0;
    uint64_t v15 = 0;
    __p = 0;
    BOOL v6 = (char *)&v17 + 1;
    char v10 = 0;
    long long v17 = xmmword_262723690;
    BOOL v9 = &v17;
    uint64_t v8 = 1;
  }
  *(unsigned char *)BOOL v9 = v10;
  v16[0] = v6;
  v16[1] = v8 - 1;
  if (!v12
    || __orc_rt::SPSSerializationTraits<__orc_rt::SPSSequence<char>,std::string,void>::serialize(v16, (uint64_t)&__p))
  {
    *(_OWORD *)a1 = v17;
    goto LABEL_21;
  }
LABEL_17:
  __orc_rt::WrapperFunctionResult::createOutOfBandError(a1, "Error serializing arguments to blob in call");
  if (*((void *)&v17 + 1) > 8uLL || !*((void *)&v17 + 1) && (void)v17) {
    free((void *)v17);
  }
LABEL_21:
  if (SHIBYTE(v15) < 0) {
    operator delete(__p);
  }
  return __orc_rt::Error::assertIsChecked(1);
}

void *std::__allocate_at_least[abi:nn180100]<std::allocator<__orc_rt::ExecutorAddr>>(unint64_t a1)
{
  if (a1 >> 61) {
    std::__throw_bad_array_new_length[abi:nn180100]();
  }
  return operator new(8 * a1);
}

BOOL __orc_rt::SPSSerializationTraits<__orc_rt::SPSSequence<char>,std::string,void>::deserialize(uint64_t a1, std::string *this)
{
  unint64_t v2 = *(void *)(a1 + 8);
  BOOL v3 = v2 >= 8;
  unint64_t v4 = v2 - 8;
  if (!v3) {
    return 0;
  }
  std::string::size_type v7 = **(void **)a1;
  *(void *)a1 += 8;
  *(void *)(a1 + 8) = v4;
  std::string::reserve(this, v7);
  if (!v7) {
    return 1;
  }
  do
  {
    uint64_t v8 = *(void *)(a1 + 8);
    BOOL v10 = v8 != 0;
    if (!v8) {
      break;
    }
    std::string::value_type v9 = *(unsigned char *)(*(void *)a1)++;
    *(void *)(a1 + 8) = v8 - 1;
    std::string::push_back(this, v9);
    --v7;
  }
  while (v7);
  return v10;
}

void *std::__allocate_at_least[abi:nn180100]<std::allocator<__orc_rt::BufferWrite>>(unint64_t a1)
{
  if (a1 >= 0xAAAAAAAAAAAAAABLL) {
    std::__throw_bad_array_new_length[abi:nn180100]();
  }
  return operator new(24 * a1);
}

void *std::__allocate_at_least[abi:nn180100]<std::allocator<__orc_rt::RemoteSymbolLookupSetElement>>(unint64_t a1)
{
  if (a1 >> 59) {
    std::__throw_bad_array_new_length[abi:nn180100]();
  }
  return operator new(32 * a1);
}

uint64_t std::__split_buffer<__orc_rt::RemoteSymbolLookupSetElement>::~__split_buffer(uint64_t a1)
{
  BOOL v3 = *(void ***)(a1 + 8);
  unint64_t v2 = *(void ***)(a1 + 16);
  if (v2 != v3)
  {
    do
    {
      unint64_t v4 = v2 - 4;
      *(void *)(a1 + 16) = v2 - 4;
      if (*((char *)v2 - 9) < 0)
      {
        operator delete(*v4);
        unint64_t v4 = *(void ***)(a1 + 16);
      }
      unint64_t v2 = v4;
    }
    while (v4 != v3);
  }
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void std::vector<__orc_rt::RemoteSymbolLookupSetElement>::__destroy_vector::operator()[abi:nn180100](void ***a1)
{
  uint64_t v1 = *a1;
  unint64_t v2 = (void **)**a1;
  if (v2)
  {
    unint64_t v4 = (void **)v1[1];
    unint64_t v5 = **a1;
    if (v4 != v2)
    {
      do
      {
        if (*((char *)v4 - 9) < 0) {
          operator delete(*(v4 - 4));
        }
        v4 -= 4;
      }
      while (v4 != v2);
      unint64_t v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

uint64_t __orc_rt::Expected<std::vector<__orc_rt::ExecutorSymbolDef>>::~Expected(uint64_t a1)
{
  __orc_rt::Expected<__orc_rt::ExecutorAddr>::assertIsChecked(*(unsigned __int8 *)(a1 + 24));
  unint64_t v2 = *(void **)a1;
  if (*(unsigned char *)(a1 + 24))
  {
    *(void *)a1 = 0;
    if (v2) {
      (*(void (**)(void *))(*(void *)v2 + 8))(v2);
    }
  }
  else if (v2)
  {
    *(void *)(a1 + 8) = v2;
    operator delete(v2);
  }
  return a1;
}

void *std::__allocate_at_least[abi:nn180100]<std::allocator<__orc_rt::ExecutorSymbolDef>>(unint64_t a1)
{
  if (a1 >> 60) {
    std::__throw_bad_array_new_length[abi:nn180100]();
  }
  return operator new(16 * a1);
}

void *std::string::basic_string[abi:nn180100]<0>(void *a1, char *__s)
{
  size_t v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8) {
    abort();
  }
  size_t v5 = v4;
  if (v4 >= 0x17)
  {
    uint64_t v7 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17) {
      uint64_t v7 = v4 | 7;
    }
    uint64_t v8 = v7 + 1;
    BOOL v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000;
    *a1 = v6;
  }
  else
  {
    *((unsigned char *)a1 + 23) = v4;
    BOOL v6 = a1;
    if (!v4) {
      goto LABEL_9;
    }
  }
  memmove(v6, __s, v5);
LABEL_9:
  *((unsigned char *)v6 + v5) = 0;
  return a1;
}

uint64_t *std::vector<__orc_rt::AllocationActionsPair>::__swap_out_circular_buffer(uint64_t *result, void *a2)
{
  uint64_t v3 = *result;
  uint64_t v2 = result[1];
  uint64_t v4 = a2[1];
  if (v2 != *result)
  {
    uint64_t v5 = 0;
    do
    {
      uint64_t v6 = v4 + v5;
      uint64_t v7 = v2 + v5;
      *(void *)(v6 - 64) = *(void *)(v2 + v5 - 64);
      *(void *)(v6 - 56) = 0;
      *(void *)(v6 - 48) = 0;
      *(void *)(v6 - 40) = 0;
      *(_OWORD *)(v6 - 56) = *(_OWORD *)(v2 + v5 - 56);
      uint64_t v8 = *(void *)(v2 + v5 - 32);
      *(void *)(v6 - 40) = *(void *)(v2 + v5 - 40);
      *(void *)(v7 - 48) = 0;
      *(void *)(v7 - 40) = 0;
      *(void *)(v7 - 56) = 0;
      *(void *)(v6 - 16) = 0;
      *(void *)(v6 - 8) = 0;
      *(void *)(v6 - 32) = v8;
      *(void *)(v6 - 24) = 0;
      *(_OWORD *)(v6 - 24) = *(_OWORD *)(v2 + v5 - 24);
      *(void *)(v6 - 8) = *(void *)(v2 + v5 - 8);
      *(void *)(v7 - 24) = 0;
      *(void *)(v7 - 16) = 0;
      *(void *)(v7 - 8) = 0;
      v5 -= 64;
    }
    while (v2 + v5 != v3);
    v4 += v5;
  }
  a2[1] = v4;
  uint64_t v9 = *result;
  *uint64_t result = v4;
  a2[1] = v9;
  uint64_t v10 = result[1];
  result[1] = a2[2];
  a2[2] = v10;
  uint64_t v11 = result[2];
  result[2] = a2[3];
  a2[3] = v11;
  *a2 = a2[1];
  return result;
}

void *std::__allocate_at_least[abi:nn180100]<std::allocator<__orc_rt::AllocationActionsPair>>(unint64_t a1)
{
  if (a1 >> 58) {
    std::__throw_bad_array_new_length[abi:nn180100]();
  }
  return operator new(a1 << 6);
}

uint64_t std::__split_buffer<__orc_rt::AllocationActionsPair>::~__split_buffer(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  for (uint64_t i = *(void *)(a1 + 16); i != v3; uint64_t i = *(void *)(a1 + 16))
  {
    *(void *)(a1 + 16) = i - 64;
    std::__destroy_at[abi:nn180100]<__orc_rt::AllocationActionsPair,0>((void *)(i - 64));
  }
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

uint64_t __orc_rt::SPSSerializationTraits<__orc_rt::SPSTuple<__orc_rt::SPSExecutorAddr,__orc_rt::SPSSequence<char>>,__orc_rt::WrapperFunctionCall,void>::deserialize(uint64_t a1, void *a2)
{
  __p = 0;
  long long v14 = 0uLL;
  unint64_t v2 = *(void *)(a1 + 8);
  BOOL v3 = v2 >= 8;
  unint64_t v4 = v2 - 8;
  if (!v3) {
    return 0;
  }
  uint64_t v6 = **(void **)a1;
  *(void *)a1 += 8;
  *(void *)(a1 + 8) = v4;
  int v7 = __orc_rt::SPSSerializationTraits<__orc_rt::SPSSequence<char>,std::vector<char>,void>::deserialize(a1, (unint64_t *)&__p);
  uint64_t v8 = __p;
  if (!v7)
  {
    if (__p) {
      operator delete(__p);
    }
    return 0;
  }
  long long v9 = v14;
  *a2 = v6;
  uint64_t v10 = (void *)a2[1];
  if (v10)
  {
    a2[2] = v10;
    long long v12 = v9;
    operator delete(v10);
    long long v9 = v12;
  }
  a2[1] = v8;
  *((_OWORD *)a2 + 1) = v9;
  return 1;
}

uint64_t __orc_rt::SPSSerializationTraits<__orc_rt::SPSSequence<char>,std::vector<char>,void>::deserialize(uint64_t a1, unint64_t *a2)
{
  unint64_t v2 = *(void *)(a1 + 8);
  BOOL v3 = v2 >= 8;
  unint64_t v4 = v2 - 8;
  if (!v3) {
    return 0;
  }
  size_t v7 = **(void **)a1;
  *(void *)a1 += 8;
  *(void *)(a1 + 8) = v4;
  unint64_t v8 = *a2;
  if (a2[2] - *a2 < v7)
  {
    if ((v7 & 0x8000000000000000) != 0) {
LABEL_35:
    }
      abort();
    long long v9 = (char *)a2[1];
    uint64_t v10 = operator new(v7);
    uint64_t v11 = &v9[(void)v10 - v8];
    long long v12 = v11;
    if (v9 != (char *)v8)
    {
      uint64_t v13 = &v9[~v8];
      do
      {
        char v14 = *--v9;
        (v13--)[(void)v10] = v14;
      }
      while (v9 != (char *)v8);
      long long v12 = v10;
    }
    *a2 = (unint64_t)v12;
    a2[1] = (unint64_t)v11;
    a2[2] = (unint64_t)&v10[v7];
    if (v8) {
      operator delete((void *)v8);
    }
  }
  if (!v7) {
    return 1;
  }
  for (uint64_t i = 0; i != v7; ++i)
  {
    uint64_t v16 = *(void *)(a1 + 8);
    BOOL v31 = v16 != 0;
    if (!v16) {
      break;
    }
    char v17 = *(unsigned char *)(*(void *)a1)++;
    *(void *)(a1 + 8) = v16 - 1;
    uint64_t v19 = (unsigned char *)a2[1];
    unint64_t v18 = a2[2];
    if ((unint64_t)v19 >= v18)
    {
      unint64_t v21 = *a2;
      char v22 = &v19[-*a2];
      unint64_t v23 = (unint64_t)(v22 + 1);
      if ((uint64_t)(v22 + 1) < 0) {
        goto LABEL_35;
      }
      unint64_t v24 = v18 - v21;
      if (2 * v24 > v23) {
        unint64_t v23 = 2 * v24;
      }
      if (v24 >= 0x3FFFFFFFFFFFFFFFLL) {
        size_t v25 = 0x7FFFFFFFFFFFFFFFLL;
      }
      else {
        size_t v25 = v23;
      }
      if (v25) {
        uint64_t v26 = (char *)operator new(v25);
      }
      else {
        uint64_t v26 = 0;
      }
      unint64_t v27 = &v22[(void)v26];
      uint64_t v28 = &v22[(void)v26];
      *uint64_t v28 = v17;
      long long v20 = v28 + 1;
      if (v19 != (unsigned char *)v21)
      {
        unint64_t v29 = &v19[~v21];
        do
        {
          char v30 = *--v19;
          (v29--)[(void)v26] = v30;
        }
        while (v19 != (unsigned char *)v21);
        uint64_t v19 = (unsigned char *)*a2;
        unint64_t v27 = v26;
      }
      *a2 = (unint64_t)v27;
      a2[1] = (unint64_t)v20;
      a2[2] = (unint64_t)&v26[v25];
      if (v19) {
        operator delete(v19);
      }
    }
    else
    {
      *uint64_t v19 = v17;
      long long v20 = v19 + 1;
    }
    a2[1] = (unint64_t)v20;
  }
  return v31;
}

uint64_t std::__split_buffer<std::pair<__orc_rt::ExecutorAddr,std::vector<char>>>::~__split_buffer(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  uint64_t v2 = *(void *)(a1 + 16);
  while (v2 != v3)
  {
    *(void *)(a1 + 16) = v2 - 32;
    unint64_t v4 = *(void **)(v2 - 24);
    if (v4)
    {
      *(void *)(v2 - 16) = v4;
      operator delete(v4);
      uint64_t v2 = *(void *)(a1 + 16);
    }
    else
    {
      v2 -= 32;
    }
  }
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

uint64_t std::__throw_future_error[abi:nn180100]()
{
  return std::__split_buffer<std::unique_ptr<char []>>::~__split_buffer();
}

uint64_t std::__split_buffer<std::unique_ptr<char []>>::~__split_buffer(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  for (uint64_t i = *(void *)(a1 + 16); i != v3; uint64_t i = *(void *)(a1 + 16))
  {
    *(void *)(a1 + 16) = i - 8;
    uint64_t v4 = *(void *)(i - 8);
    *(void *)(i - 8) = 0;
    if (v4) {
      MEMORY[0x263E50FA0](v4, 0x1000C8077774924);
    }
  }
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

BOOL std::equal_to<std::string>::operator()[abi:nn180100](unsigned __int8 *a1, unsigned __int8 *a2)
{
  uint64_t v2 = a1[23];
  if ((v2 & 0x80u) == 0) {
    uint64_t v3 = a1[23];
  }
  else {
    uint64_t v3 = *((void *)a1 + 1);
  }
  uint64_t v4 = a2[23];
  int v5 = (char)v4;
  if ((v4 & 0x80u) != 0) {
    uint64_t v4 = *((void *)a2 + 1);
  }
  if (v3 != v4) {
    return 0;
  }
  if (v5 < 0) {
    a2 = *(unsigned __int8 **)a2;
  }
  if ((v2 & 0x80) != 0) {
    return memcmp(*(const void **)a1, a2, *((void *)a1 + 1)) == 0;
  }
  if (!a1[23]) {
    return 1;
  }
  uint64_t v6 = v2 - 1;
  do
  {
    int v8 = *a1++;
    int v7 = v8;
    int v10 = *a2++;
    int v9 = v10;
    BOOL v12 = v6-- != 0;
    BOOL v13 = v7 == v9;
    BOOL v14 = v7 == v9;
  }
  while (v13 && v12);
  return v14;
}

void *std::__hash_table<std::__hash_value_type<std::string,std::vector<char>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::vector<char>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::vector<char>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::vector<char>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  int v7 = *(char *)(a2 + 23);
  if (v7 >= 0) {
    int v8 = (uint64_t *)a2;
  }
  else {
    int v8 = *(uint64_t **)a2;
  }
  if (v7 >= 0) {
    unint64_t v9 = *(unsigned __int8 *)(a2 + 23);
  }
  else {
    unint64_t v9 = *(void *)(a2 + 8);
  }
  unint64_t v10 = std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:nn180100](v8, v9);
  unint64_t v11 = v10;
  unint64_t v12 = a1[1];
  if (v12)
  {
    uint8x8_t v13 = (uint8x8_t)vcnt_s8((int8x8_t)v12);
    v13.i16[0] = vaddlv_u8(v13);
    unint64_t v14 = v13.u32[0];
    if (v13.u32[0] > 1uLL)
    {
      unint64_t v3 = v10;
      if (v10 >= v12) {
        unint64_t v3 = v10 % v12;
      }
    }
    else
    {
      unint64_t v3 = (v12 - 1) & v10;
    }
    uint64_t v15 = *(void ***)(*a1 + 8 * v3);
    if (v15)
    {
      for (uint64_t i = *v15; i; uint64_t i = *(void **)i)
      {
        unint64_t v17 = *((void *)i + 1);
        if (v17 == v11)
        {
          if (std::equal_to<std::string>::operator()[abi:nn180100]((unsigned __int8 *)i + 16, (unsigned __int8 *)a2)) {
            return i;
          }
        }
        else
        {
          if (v14 > 1)
          {
            if (v17 >= v12) {
              v17 %= v12;
            }
          }
          else
          {
            v17 &= v12 - 1;
          }
          if (v17 != v3) {
            break;
          }
        }
      }
    }
  }
  unint64_t v18 = a1 + 2;
  uint64_t i = operator new(0x40uLL);
  *(void *)uint64_t i = 0;
  *((void *)i + 1) = v11;
  *((_OWORD *)i + 1) = *(_OWORD *)a3;
  uint64_t v19 = *(void *)(a3 + 16);
  *(void *)a3 = 0;
  *(void *)(a3 + 8) = 0;
  *(void *)(a3 + 16) = 0;
  *((void *)i + 4) = v19;
  *((void *)i + 5) = 0;
  *((void *)i + 6) = 0;
  *((void *)i + 7) = 0;
  float v20 = (float)(unint64_t)(a1[3] + 1);
  float v21 = *((float *)a1 + 8);
  if (!v12 || (float)(v21 * (float)v12) < v20)
  {
    BOOL v22 = 1;
    if (v12 >= 3) {
      BOOL v22 = (v12 & (v12 - 1)) != 0;
    }
    unint64_t v23 = v22 | (2 * v12);
    unint64_t v24 = vcvtps_u32_f32(v20 / v21);
    if (v23 <= v24) {
      int8x8_t prime = (int8x8_t)v24;
    }
    else {
      int8x8_t prime = (int8x8_t)v23;
    }
    if (*(void *)&prime == 1)
    {
      int8x8_t prime = (int8x8_t)2;
    }
    else if ((*(void *)&prime & (*(void *)&prime - 1)) != 0)
    {
      int8x8_t prime = (int8x8_t)std::__next_prime(*(void *)&prime);
    }
    unint64_t v12 = a1[1];
    if (*(void *)&prime > v12) {
      goto LABEL_36;
    }
    if (*(void *)&prime < v12)
    {
      unint64_t v32 = vcvtps_u32_f32((float)(unint64_t)a1[3] / *((float *)a1 + 8));
      if (v12 < 3 || (uint8x8_t v33 = (uint8x8_t)vcnt_s8((int8x8_t)v12), v33.i16[0] = vaddlv_u8(v33), v33.u32[0] > 1uLL))
      {
        unint64_t v32 = std::__next_prime(v32);
      }
      else
      {
        uint64_t v34 = 1 << -(char)__clz(v32 - 1);
        if (v32 >= 2) {
          unint64_t v32 = v34;
        }
      }
      if (*(void *)&prime <= v32) {
        int8x8_t prime = (int8x8_t)v32;
      }
      if (*(void *)&prime >= v12)
      {
        unint64_t v12 = a1[1];
      }
      else
      {
        if (prime)
        {
LABEL_36:
          if (*(void *)&prime >> 61) {
            std::__throw_bad_array_new_length[abi:nn180100]();
          }
          uint64_t v26 = operator new(8 * *(void *)&prime);
          unint64_t v27 = (void *)*a1;
          *a1 = (uint64_t)v26;
          if (v27) {
            operator delete(v27);
          }
          uint64_t v28 = 0;
          a1[1] = (uint64_t)prime;
          do
            *(void *)(*a1 + 8 * v28++) = 0;
          while (*(void *)&prime != v28);
          unint64_t v29 = (void *)*v18;
          if (*v18)
          {
            unint64_t v30 = v29[1];
            uint8x8_t v31 = (uint8x8_t)vcnt_s8(prime);
            v31.i16[0] = vaddlv_u8(v31);
            if (v31.u32[0] > 1uLL)
            {
              if (v30 >= *(void *)&prime) {
                v30 %= *(void *)&prime;
              }
            }
            else
            {
              v30 &= *(void *)&prime - 1;
            }
            *(void *)(*a1 + 8 * v30) = v18;
            uint64_t v35 = (void *)*v29;
            if (*v29)
            {
              do
              {
                unint64_t v36 = v35[1];
                if (v31.u32[0] > 1uLL)
                {
                  if (v36 >= *(void *)&prime) {
                    v36 %= *(void *)&prime;
                  }
                }
                else
                {
                  v36 &= *(void *)&prime - 1;
                }
                if (v36 != v30)
                {
                  if (!*(void *)(*a1 + 8 * v36))
                  {
                    *(void *)(*a1 + 8 * v36) = v29;
                    goto LABEL_61;
                  }
                  *unint64_t v29 = *v35;
                  *uint64_t v35 = **(void **)(*a1 + 8 * v36);
                  **(void **)(*a1 + 8 * v36) = v35;
                  uint64_t v35 = v29;
                }
                unint64_t v36 = v30;
LABEL_61:
                unint64_t v29 = v35;
                uint64_t v35 = (void *)*v35;
                unint64_t v30 = v36;
              }
              while (v35);
            }
          }
          unint64_t v12 = (unint64_t)prime;
          goto LABEL_65;
        }
        unint64_t v41 = (void *)*a1;
        *a1 = 0;
        if (v41) {
          operator delete(v41);
        }
        unint64_t v12 = 0;
        a1[1] = 0;
      }
    }
LABEL_65:
    if ((v12 & (v12 - 1)) != 0)
    {
      if (v11 >= v12) {
        unint64_t v3 = v11 % v12;
      }
      else {
        unint64_t v3 = v11;
      }
    }
    else
    {
      unint64_t v3 = (v12 - 1) & v11;
    }
  }
  uint64_t v37 = *a1;
  uint64_t v38 = *(void **)(*a1 + 8 * v3);
  if (v38)
  {
    *(void *)uint64_t i = *v38;
LABEL_78:
    *uint64_t v38 = i;
    goto LABEL_79;
  }
  *(void *)uint64_t i = *v18;
  void *v18 = i;
  *(void *)(v37 + 8 * v3) = v18;
  if (*(void *)i)
  {
    unint64_t v39 = *(void *)(*(void *)i + 8);
    if ((v12 & (v12 - 1)) != 0)
    {
      if (v39 >= v12) {
        v39 %= v12;
      }
    }
    else
    {
      v39 &= v12 - 1;
    }
    uint64_t v38 = (void *)(*a1 + 8 * v39);
    goto LABEL_78;
  }
LABEL_79:
  ++a1[3];
  return i;
}

void _GLOBAL__sub_I_XOJITExecutor_cpp()
{
  qword_26B420070 = (uint64_t)os_log_create("com.apple.XOJIT", "Instance");
  operator new();
}

uint64_t sub_262722A7C()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_262722A8C()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_262722A9C()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_262722AAC()
{
  return MEMORY[0x270FA1A00]();
}

uint64_t sub_262722ABC()
{
  return MEMORY[0x270FA08C0]();
}

uint64_t sub_262722ACC()
{
  return MEMORY[0x270FA2C30]();
}

uint64_t sub_262722ADC()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_262722AEC()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_262722AFC()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_262722B0C()
{
  return MEMORY[0x270FA0BA8]();
}

uint64_t sub_262722B1C()
{
  return MEMORY[0x270FA0BF0]();
}

uint64_t sub_262722B2C()
{
  return MEMORY[0x270F9D0A8]();
}

uint64_t sub_262722B3C()
{
  return MEMORY[0x270F9D620]();
}

uint64_t sub_262722B4C()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_262722B5C()
{
  return MEMORY[0x270F9D7C0]();
}

uint64_t sub_262722B6C()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_262722B7C()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_262722B8C()
{
  return MEMORY[0x270FA0C10]();
}

uint64_t sub_262722B9C()
{
  return MEMORY[0x270FA0C38]();
}

uint64_t sub_262722BAC()
{
  return MEMORY[0x270FA0C50]();
}

uint64_t sub_262722BBC()
{
  return MEMORY[0x270FA0D50]();
}

uint64_t sub_262722BCC()
{
  return MEMORY[0x270FA0D70]();
}

uint64_t sub_262722BDC()
{
  return MEMORY[0x270FA0D88]();
}

uint64_t sub_262722BEC()
{
  return MEMORY[0x270FA0DA0]();
}

uint64_t sub_262722BFC()
{
  return MEMORY[0x270FA0DB8]();
}

uint64_t sub_262722C0C()
{
  return MEMORY[0x270FA0F10]();
}

uint64_t sub_262722C1C()
{
  return MEMORY[0x270FA0F28]();
}

uint64_t sub_262722C2C()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_262722C3C()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_262722C4C()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_262722C5C()
{
  return MEMORY[0x270F9EF08]();
}

uint64_t sub_262722C6C()
{
  return MEMORY[0x270F9EF20]();
}

uint64_t sub_262722C7C()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_262722C8C()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_262722C9C()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_262722CAC()
{
  return MEMORY[0x270F9FC40]();
}

uint64_t sub_262722CBC()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_262722CCC()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_262722CDC()
{
  return MEMORY[0x270F9FC90]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_release(const void *aBlock)
{
}

std::exception_ptr *__cdecl std::exception_ptr::exception_ptr(std::exception_ptr *this, const std::exception_ptr *a2)
{
  return (std::exception_ptr *)MEMORY[0x270F98398](this, a2);
}

void std::exception_ptr::~exception_ptr(std::exception_ptr *this)
{
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x270F98458](__n);
}

void std::string::__grow_by_and_replace(std::string *this, std::string::size_type __old_cap, std::string::size_type __delta_cap, std::string::size_type __old_sz, std::string::size_type __n_copy, std::string::size_type __n_del, std::string::size_type __n_add, const std::string::value_type *__p_new_stuff)
{
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x270F984A0](this, __s, __n);
}

void std::string::reserve(std::string *this, std::string::size_type __requested_capacity)
{
}

void std::string::push_back(std::string *this, std::string::value_type __c)
{
}

std::future_error *__cdecl std::future_error::future_error(std::future_error *this, std::error_code __ec)
{
  return (std::future_error *)MEMORY[0x270F985E0](this, *(void *)&__ec.__val_, __ec.__cat_);
}

void std::__shared_count::~__shared_count(std::__shared_count *this)
{
}

const std::error_category *std::future_category(void)
{
  return (const std::error_category *)MEMORY[0x270F988E0]();
}

void std::__assoc_sub_state::__sub_wait(std::__assoc_sub_state *this, std::unique_lock<std::mutex> *__lk)
{
}

void std::condition_variable::notify_all(std::condition_variable *this)
{
}

void std::condition_variable::~condition_variable(std::condition_variable *this)
{
}

void std::__libcpp_verbose_abort(const char *__format, ...)
{
}

void std::mutex::lock(std::mutex *this)
{
}

void std::mutex::unlock(std::mutex *this)
{
}

void std::mutex::~mutex(std::mutex *this)
{
}

void std::rethrow_exception(std::exception_ptr a1)
{
}

void operator delete[]()
{
  while (1)
    ;
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void operator delete()
{
  while (1)
    ;
}

void operator new[]()
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void operator new()
{
  while (1)
    ;
}

int __cxa_atexit(void (*lpfunc)(void *), void *obj, void *lpdso_handle)
{
  return MEMORY[0x270ED7DA0](lpfunc, obj, lpdso_handle);
}

int __cxa_guard_acquire(__guard *a1)
{
  return MEMORY[0x270F98F10](a1);
}

void __cxa_guard_release(__guard *a1)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void abort(void)
{
}

void bzero(void *a1, size_t a2)
{
}

int close(int a1)
{
  return MEMORY[0x270ED8F18](*(void *)&a1);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x270ED9340]();
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x270ED94B8](value);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

char *dlerror(void)
{
  return (char *)MEMORY[0x270ED9620]();
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x270ED9628](__path, *(void *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x270ED9648](__handle, __symbol);
}

void free(void *a1)
{
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x270ED9B88](__ptr, __size, __nitems, __stream);
}

pid_t getpid(void)
{
  return MEMORY[0x270ED9CE0]();
}

kern_return_t mach_vm_map(vm_map_t target_task, mach_vm_address_t *address, mach_vm_size_t size, mach_vm_offset_t mask, int flags, mem_entry_name_port_t object, memory_object_offset_t offset, BOOLean_t copy, vm_prot_t cur_protection, vm_prot_t max_protection, vm_inherit_t inheritance)
{
  return MEMORY[0x270EDA2A8](*(void *)&target_task, address, size, mask, *(void *)&flags, *(void *)&object, offset, *(void *)&copy);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x270EDA328](__size);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x270EDA468](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x270EDA598](a1, a2, *(void *)&a3, *(void *)&a4, *(void *)&a5, a6);
}

int mprotect(void *a1, size_t a2, int a3)
{
  return MEMORY[0x270EDA5C0](a1, a2, *(void *)&a3);
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
}

void objc_release(id a1)
{
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

void os_release(void *object)
{
}

uint64_t sandbox_extension_consume()
{
  return MEMORY[0x270EDB2B8]();
}

char *__cdecl strcpy(char *__dst, const char *__src)
{
  return (char *)MEMORY[0x270EDB5C0](__dst, __src);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x270EDB5D0](__s1);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x270EDB5D8](*(void *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x270FA01E0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x270FA02C0]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
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

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x270FA0498]();
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

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x270EDBD38](xarray);
}

const char *__cdecl xpc_array_get_string(xpc_object_t xarray, size_t index)
{
  return (const char *)MEMORY[0x270EDBD70](xarray, index);
}

xpc_object_t xpc_array_get_value(xpc_object_t xarray, size_t index)
{
  return (xpc_object_t)MEMORY[0x270EDBD88](xarray, index);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
}

void xpc_connection_resume(xpc_connection_t connection)
{
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

void xpc_connection_set_target_queue(xpc_connection_t connection, dispatch_queue_t targetq)
{
}

const void *__cdecl xpc_data_get_bytes_ptr(xpc_object_t xdata)
{
  return (const void *)MEMORY[0x270EDBFA8](xdata);
}

size_t xpc_data_get_length(xpc_object_t xdata)
{
  return MEMORY[0x270EDBFB8](xdata);
}

xpc_object_t xpc_dictionary_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x270EDC018]();
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x270EDC0C0](xdict, key);
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x270EDC200](object);
}

uint64_t xpc_mach_send_get_right()
{
  return MEMORY[0x270EDC278]();
}