void OUTLINED_FUNCTION_5(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  uint64_t v9;

  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x26u);
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, int a3, const char *a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint8_t buf)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &buf, 0x26u);
}

id NDSharedServiceLog()
{
  if (NDSharedServiceLog_once != -1) {
    dispatch_once(&NDSharedServiceLog_once, &__block_literal_global);
  }
  v0 = (void *)NDSharedServiceLog_result;

  return v0;
}

uint64_t __NDSharedServiceLog_block_invoke()
{
  NDSharedServiceLog_result = (uint64_t)os_log_create("com.apple.news", "newsd");

  return MEMORY[0x270F9A758]();
}

id NDSharedClientLog()
{
  if (NDSharedClientLog_once != -1) {
    dispatch_once(&NDSharedClientLog_once, &__block_literal_global_4);
  }
  v0 = (void *)NDSharedClientLog_result;

  return v0;
}

uint64_t __NDSharedClientLog_block_invoke()
{
  NDSharedClientLog_result = (uint64_t)os_log_create("com.apple.newsd.client", "general");

  return MEMORY[0x270F9A758]();
}

id NDAnalyticsEnvelopeSubmissionDatesByContentType(void *a1)
{
  id v1 = a1;
  if (!v1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    NDAnalyticsEnvelopeSubmissionDatesByContentType_cold_1();
  }
  v2 = objc_msgSend(v1, "fc_dictionaryOfTransformedSortedObjectsWithKeyBlock:valueBlock:", &__block_literal_global_0, &__block_literal_global_10);

  return v2;
}

uint64_t __NDAnalyticsEnvelopeSubmissionDatesByContentType_block_invoke(uint64_t a1, void *a2)
{
  v2 = NSNumber;
  uint64_t v3 = [a2 envelopeContentType];

  return [v2 numberWithInt:v3];
}

uint64_t __NDAnalyticsEnvelopeSubmissionDatesByContentType_block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 envelopeSubmissionDate];
}

void sub_21FDD921C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va1, a7);
  va_start(va, a7);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
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

void sub_21FDD97CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id NDAnalyticsEnvelopeContentTypesFromEntries(void *a1)
{
  id v1 = a1;
  if (!v1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    NDAnalyticsEnvelopeContentTypesFromEntries_cold_1();
  }
  v2 = objc_msgSend(v1, "fc_arrayByTransformingWithBlock:", &__block_literal_global_1);

  return v2;
}

uint64_t __NDAnalyticsEnvelopeContentTypesFromEntries_block_invoke(uint64_t a1, void *a2)
{
  v2 = NSNumber;
  uint64_t v3 = [a2 envelopeContentType];

  return [v2 numberWithInt:v3];
}

void sub_21FDDB0A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
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

void sub_21FDDB294(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_21FDDB4DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21FDDB7AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21FDDCF24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
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

BOOL NAUAnalyticsEnvelopeTrackerContentTypeIsSupported(unsigned int a1)
{
  return a1 < 9;
}

id NDAnalyticsEnvelopeStoreStringRepresentationsOfEntries(void *a1)
{
  id v1 = a1;
  if (!v1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    NDAnalyticsEnvelopeStoreStringRepresentationsOfEntries_cold_1();
  }
  v2 = objc_msgSend(v1, "fc_arrayByTransformingWithBlock:", &__block_literal_global_5);

  return v2;
}

id __NDAnalyticsEnvelopeStoreStringRepresentationsOfEntries_block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  uint64_t v3 = FCDynamicCast();

  v4 = [v3 stringRepresentation];

  return v4;
}

id NDAnalyticsEnvelopeStoreEntriesFromStringRepresentations(void *a1)
{
  id v1 = a1;
  if (!v1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    NDAnalyticsEnvelopeStoreEntriesFromStringRepresentations_cold_1();
  }
  id v2 = objc_msgSend(v1, "fc_arrayByTransformingWithBlock:", &__block_literal_global_11);

  return v2;
}

NDAnalyticsEnvelopeStoreEntry *__NDAnalyticsEnvelopeStoreEntriesFromStringRepresentations_block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [[NDAnalyticsEnvelopeStoreEntry alloc] initWithStringRepresentation:v2];

  return v3;
}

void sub_21FDE07DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
}

void sub_21FDE0E78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id NDAnalyticsEntryDeliveryWindowEarlierDate(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  if (!v5 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    NDAnalyticsEntryDeliveryWindowEarlierDate_cold_2();
    if (v7) {
      goto LABEL_6;
    }
  }
  else if (v7)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    NDAnalyticsEntryDeliveryWindowEarlierDate_cold_1();
  }
LABEL_6:
  uint64_t v8 = [v7 seedTime];
  if (v6) {
    [v6 dateByAddingTimeInterval:(double)(unint64_t)(60 * v8)];
  }
  else {
  uint64_t v9 = [MEMORY[0x263EFF910] distantPast];
  }
  uint64_t v10 = [v9 laterDate:v5];

  return v10;
}

id NDAnalyticsEntryDeliveryWindow(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  if (!v5 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    NDAnalyticsEntryDeliveryWindow_cold_2();
    if (v7) {
      goto LABEL_6;
    }
  }
  else if (v7)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    NDAnalyticsEntryDeliveryWindow_cold_1();
  }
LABEL_6:
  uint64_t v8 = 60 * [v7 seedTime];
  uint64_t v9 = NDAnalyticsEntryDeliveryWindowEarlierDate(v5, v6, v7);
  uint64_t v10 = [v5 dateByAddingTimeInterval:(double)(unint64_t)v8];
  uint64_t v11 = [v10 laterDate:v9];
  uint64_t v12 = [MEMORY[0x263F59410] dateRangeWithEarlierDate:v9 laterDate:v11];

  return v12;
}

uint64_t NDAnalyticsEntryCanBeUploaded(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a1;
  id v8 = a2;
  id v9 = a3;
  id v10 = a4;
  if (!v7 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    NDAnalyticsEntryCanBeUploaded_cold_3();
    if (v8) {
      goto LABEL_6;
    }
  }
  else if (v8)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    NDAnalyticsEntryCanBeUploaded_cold_2();
  }
LABEL_6:
  if (!v10 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    NDAnalyticsEntryCanBeUploaded_cold_1();
  }
  uint64_t v11 = NDAnalyticsEntryDeliveryWindowEarlierDate(v7, v9, v10);
  uint64_t v12 = objc_msgSend(v8, "fc_isLaterThanOrEqualTo:", v11);

  return v12;
}

id sub_21FDE1C00(void *a1)
{
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_21FDF6058();
  id result = (id)sub_21FDF61D8();
  if (result)
  {
    id v2 = result;
    uint64_t v3 = (objc_class *)type metadata accessor for TelemetryUploader();
    v4 = (char *)objc_allocWithZone(v3);
    *(void *)&v4[OBJC_IVAR___NDAnalyticsTelemetryUploader_sessionManager] = v2;
    v5.receiver = v4;
    v5.super_class = v3;
    return objc_msgSendSuper2(&v5, sel_init);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_21FDE1C90()
{
  sub_21FDF6058();
  sub_21FDF6228();
  sub_21FDF61C8();
  swift_release();
  swift_release();
  sub_21FDF60C8();
  sub_21FDF6228();
  swift_release();
  sub_21FDF6128();
  sub_21FDF6228();
  swift_release();
  sub_21FDF6178();
  sub_21FDF6228();
  swift_release();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AB38CA0);
  sub_21FDF6228();
  swift_release();
  sub_21FDF6068();
  sub_21FDF6238();

  return swift_release();
}

uint64_t sub_21FDE1E3C(void *a1)
{
  sub_21FDF5F28();
  MEMORY[0x270FA5388]();
  v8[2] = (char *)v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AB38CB0);
  MEMORY[0x270FA5388]();
  v4 = (char *)v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21FDF6038();
  MEMORY[0x270FA5388]();
  v8[1] = dispatch_group_create();
  sub_21FDF5EE8();
  sub_21FDF5ED8();
  sub_21FDF6098();
  swift_allocObject();
  v8[0] = sub_21FDF6088();
  uint64_t v9 = MEMORY[0x263F8EE78];
  sub_21FDE29E0(&qword_26AB38CA8, MEMORY[0x263F24D68]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AB38E20);
  sub_21FDE2A28((unint64_t *)&unk_26AB38E28, &qword_26AB38E20);
  sub_21FDF6348();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  uint64_t v5 = sub_21FDF6068();
  sub_21FDF61E8();
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v5 - 8) + 48))(v4, 1, v5);
  if (result == 1)
  {
    __break(1u);
  }
  else
  {
    sub_21FDF6058();
    sub_21FDF5ED8();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AB38E40);
    uint64_t v7 = swift_allocObject();
    *(_OWORD *)(v7 + 16) = xmmword_21FDF7360;
    sub_21FDF5F18();
    sub_21FDF5EF8();
    sub_21FDF5F08();
    uint64_t v9 = v7;
    sub_21FDE29E0(&qword_26AB38C98, MEMORY[0x263F24CF0]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AB38E10);
    sub_21FDE2A28(&qword_26AB38E18, &qword_26AB38E10);
    sub_21FDF6348();
    sub_21FDF5FD8();
    swift_allocObject();
    sub_21FDF5FC8();
    sub_21FDF6158();
    swift_allocObject();
    sub_21FDF6148();
    return sub_21FDF5FF8();
  }
  return result;
}

uint64_t sub_21FDE2240(uint64_t a1, void *a2)
{
  sub_21FDF5FE8();
  __swift_project_boxed_opaque_existential_1(a2, a2[3]);
  sub_21FDF60C8();
  uint64_t result = sub_21FDF61D8();
  if (!result)
  {
    __break(1u);
    goto LABEL_7;
  }
  sub_21FDF6078();
  swift_release();
  swift_release();
  sub_21FDF5FE8();
  __swift_project_boxed_opaque_existential_1(a2, a2[3]);
  sub_21FDF6128();
  uint64_t result = sub_21FDF61D8();
  if (!result)
  {
LABEL_7:
    __break(1u);
    return result;
  }
  sub_21FDF6078();
  swift_release();

  return swift_release();
}

uint64_t sub_21FDE2348()
{
  sub_21FDF6138();
  MEMORY[0x270FA5388]();
  id v1 = (uint64_t *)((char *)&v4 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0));
  *id v1 = 11;
  (*(void (**)(void *, void))(v2 + 104))(v1, *MEMORY[0x263F24E00]);
  sub_21FDF60C8();
  swift_allocObject();
  return sub_21FDF60B8();
}

uint64_t sub_21FDE2448(void *a1)
{
  uint64_t v2 = sub_21FDF5E48();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_21FDF6178();
  uint64_t result = sub_21FDF61D8();
  if (result)
  {
    uint64_t v7 = result;
    __swift_project_boxed_opaque_existential_1(a1, a1[3]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AB38CA0);
    uint64_t result = sub_21FDF61D8();
    if (result)
    {
      uint64_t v8 = result;
      sub_21FDF6128();
      sub_21FDF6108();
      uint64_t v9 = (void *)sub_21FDF60F8();
      id v10 = objc_msgSend(self, sel_newsdDocumentsURL);
      sub_21FDF5E38();

      uint64_t v11 = (void *)sub_21FDF60E8();
      (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
      id v12 = objc_msgSend(self, sel_standardUserDefaults);
      uint64_t v13 = (void *)sub_21FDF6288();
      objc_msgSend(v12, sel_BOOLForKey_, v13);

      uint64_t v14 = sub_21FDF60D8();
      return MEMORY[0x223C5EED0](v7, v8, 1, v14);
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_21FDE2678()
{
  sub_21FDF6178();
  id v0 = objc_msgSend(self, sel_mainBundle);
  return sub_21FDF6168();
}

uint64_t sub_21FDE26C4(void *a1)
{
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AB38E38);
  uint64_t result = sub_21FDF61D8();
  if (result)
  {
    uint64_t v2 = result;
    type metadata accessor for DynamicEndpoint();
    uint64_t v3 = swift_allocObject();
    *(void *)(v3 + 16) = v2;
    *(void *)(v3 + 24) = FCDefaultsReadEndpointEnvironment();
    return v3;
  }
  else
  {
    __break(1u);
  }
  return result;
}

void *sub_21FDE2748@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AB38E38);
  uint64_t result = (void *)sub_21FDF61D8();
  if (result)
  {
    id v4 = objc_msgSend(result, sel_possiblyUnfetchedAppConfiguration);
    swift_unknownObjectRelease();
    return (void *)sub_21FDE2CFC(v4, a2);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_21FDE27E0()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t type metadata accessor for TelemetryAssembly()
{
  return self;
}

void type metadata accessor for FCEndpointEnvironment()
{
  if (!qword_267EFCBF8)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_267EFCBF8);
    }
  }
}

uint64_t sub_21FDE286C()
{
  sub_21FDF61F8();
  type metadata accessor for TelemetryUploader();
  sub_21FDF6228();
  swift_release();
  swift_release();
  sub_21FDF6208();
  sub_21FDF6218();

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

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
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

uint64_t sub_21FDE29E0(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_21FDE2A28(unint64_t *a1, uint64_t *a2)
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

uint64_t Assembly.assemblies.getter()
{
  return swift_bridgeObjectRetain();
}

id Assembly.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

id Assembly.init()()
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v2 = OBJC_IVAR___NDAnalyticsUploadFrameworkAssembly_assemblies;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AB38E48);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_21FDF7410;
  uint64_t v4 = type metadata accessor for TelemetryAssembly();
  uint64_t v5 = swift_allocObject();
  *(void *)(v3 + 56) = v4;
  *(void *)(v3 + 64) = sub_21FDE2B70();
  *(void *)(v3 + 32) = v5;
  *(void *)&v0[v2] = v3;
  v7.receiver = v0;
  v7.super_class = ObjectType;
  return objc_msgSendSuper2(&v7, sel_init);
}

unint64_t sub_21FDE2B70()
{
  unint64_t result = qword_26AB38D68;
  if (!qword_26AB38D68)
  {
    type metadata accessor for TelemetryAssembly();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AB38D68);
  }
  return result;
}

id Assembly.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_21FDE2CC4()
{
  return swift_bridgeObjectRetain();
}

uint64_t type metadata accessor for Assembly()
{
  return self;
}

uint64_t sub_21FDE2CFC@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_21FDF6068();
  uint64_t v15 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388]();
  id v6 = (unint64_t *)((char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  if ((objc_msgSend(a1, sel_respondsToSelector_, sel_isAnalyticsJitterEnabled) & 1) != 0
    && !objc_msgSend(a1, sel_isAnalyticsJitterEnabled))
  {
    swift_unknownObjectRelease();
    uint64_t v12 = *MEMORY[0x263F24D80];
    uint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v15 + 104);
    return v13(a2, v12, v4);
  }
  else
  {
    if (objc_msgSend(a1, sel_respondsToSelector_, sel_analyticsJitterLowerBound))
    {
      objc_msgSend(a1, sel_analyticsJitterLowerBound);
      unint64_t v8 = v7;
    }
    else
    {
      unint64_t v8 = 0xC082C00000000000;
    }
    if (objc_msgSend(a1, sel_respondsToSelector_, sel_analyticsJitterUpperBound))
    {
      objc_msgSend(a1, sel_analyticsJitterUpperBound);
      uint64_t v10 = v9;
    }
    else
    {
      uint64_t v10 = 0x4082C00000000000;
    }
    swift_unknownObjectRelease();
    *id v6 = v8;
    v6[1] = v10;
    (*(void (**)(unint64_t *, void, uint64_t))(v15 + 104))(v6, *MEMORY[0x263F24D78], v4);
    return (*(uint64_t (**)(uint64_t, unint64_t *, uint64_t))(v15 + 32))(a2, v6, v4);
  }
}

uint64_t sub_21FDE3094()
{
  uint64_t result = 0x316F6D6564;
  switch(*(void *)(v0 + 24))
  {
    case 1:
      uint64_t result = 0x69746375646F7270;
      break;
    case 2:
      uint64_t result = 0x676E6967617473;
      break;
    case 3:
      uint64_t result = 24945;
      break;
    case 4:
      uint64_t result = 1953719668;
      break;
    case 5:
      uint64_t result = 0x3164756F6C6369;
      break;
    case 6:
      uint64_t result = 0x6C65766564;
      break;
    case 7:
      uint64_t result = 0x786F62646E6173;
      break;
    case 8:
      return result;
    case 9:
      uint64_t result = 0x326F6D6564;
      break;
    default:
      uint64_t result = 0x6E776F6E6B6E75;
      break;
  }
  return result;
}

uint64_t sub_21FDE31B8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = sub_21FDF5E48();
  uint64_t v33 = *(void *)(v5 - 8);
  uint64_t v6 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  unint64_t v8 = (char *)&v32 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v32 - v9;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EFCC68);
  uint64_t v12 = MEMORY[0x270FA5388](v11 - 8);
  uint64_t v14 = (char *)&v32 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  v16 = (char *)&v32 - v15;
  switch(a1)
  {
    case 0:
    case 1:
    case 2:
    case 3:
    case 4:
      id v17 = objc_msgSend(*(id *)(v2 + 16), sel_appConfiguration);
      if ((objc_msgSend(v17, sel_respondsToSelector_, sel_appAnalyticsEndpointUrlForEnvironment_) & 1) == 0) {
        goto LABEL_15;
      }
      id v18 = objc_msgSend(v17, sel_appAnalyticsEndpointUrlForEnvironment_, *(void *)(v2 + 24));
      goto LABEL_4;
    case 5:
      id v23 = objc_msgSend(*(id *)(v2 + 16), sel_appConfiguration);
      if ((objc_msgSend(v23, sel_respondsToSelector_, sel_appAnalyticsNotificationReceiptEndpointUrlForEnvironment_) & 1) == 0)goto LABEL_15; {
      id v24 = objc_msgSend(v23, sel_appAnalyticsNotificationReceiptEndpointUrlForEnvironment_, *(void *)(v2 + 24));
      }
      if (v24)
      {
        v25 = v24;
        sub_21FDF5E38();

        (*(void (**)(char *, void, uint64_t, uint64_t))(v33 + 56))(v16, 0, 1, v5);
      }
      else
      {
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v33 + 56))(v16, 1, 1, v5);
      }
      sub_21FDE38C4((uint64_t)v16, a2);
      return swift_unknownObjectRelease();
    case 6:
      id v26 = objc_msgSend(self, sel_appAnalyticsSportsEventsBaseURLForConfiguration_, objc_msgSend(*(id *)(v2 + 16), sel_appConfiguration));
      swift_unknownObjectRelease();
      if (!v26)
      {
        v28 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v33 + 56);
        v28(v14, 1, 1, v5);
LABEL_21:
        sub_21FDE3864((uint64_t)v14);
        return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))v28)(a2, 1, 1, v5);
      }
      sub_21FDF5E38();

      v27 = *(void (**)(char *, char *, uint64_t))(v33 + 32);
      v27(v14, v8, v5);
      v28 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v33 + 56);
      v28(v14, 0, 1, v5);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v33 + 48))(v14, 1, v5) == 1) {
        goto LABEL_21;
      }
      v27(v10, v14, v5);
      v27((char *)a2, v10, v5);
      return ((uint64_t (*)(uint64_t, void, uint64_t, uint64_t))v28)(a2, 0, 1, v5);
    case 7:
      id v29 = objc_msgSend(*(id *)(v2 + 16), sel_appConfiguration);
      if ((objc_msgSend(v29, sel_respondsToSelector_, sel_appAnalyticsAppHealthEndpointUrlForEnvironment_) & 1) == 0)goto LABEL_15; {
      id v18 = objc_msgSend(v29, sel_appAnalyticsAppHealthEndpointUrlForEnvironment_, *(void *)(v2 + 24));
      }
      goto LABEL_4;
    case 8:
      id v30 = objc_msgSend(*(id *)(v2 + 16), sel_appConfiguration);
      if (objc_msgSend(v30, sel_respondsToSelector_, sel_appAnalyticsAppHeartbeatEndpointUrlForEnvironment_))
      {
        id v18 = objc_msgSend(v30, sel_appAnalyticsAppHeartbeatEndpointUrlForEnvironment_, *(void *)(v2 + 24));
LABEL_4:
        id v19 = v18;
        sub_21FDF5E38();
        swift_unknownObjectRelease();

        v20 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v33 + 56);
        uint64_t v21 = a2;
        uint64_t v22 = 0;
      }
      else
      {
LABEL_15:
        swift_unknownObjectRelease();
LABEL_16:
        v20 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v33 + 56);
        uint64_t v21 = a2;
        uint64_t v22 = 1;
      }
      return v20(v21, v22, 1, v5);
    default:
      goto LABEL_16;
  }
}

uint64_t sub_21FDE3808()
{
  swift_unknownObjectRelease();

  return MEMORY[0x270FA0228](v0, 32, 7);
}

uint64_t type metadata accessor for DynamicEndpoint()
{
  return self;
}

uint64_t sub_21FDE3864(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EFCC68);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_21FDE38C4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EFCC68);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t destroy for AppData()
{
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for AppData(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for AppData(void *a1, void *a2)
{
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

void *assignWithTake for AppData(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for AppData(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 32)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AppData(uint64_t result, int a2, int a3)
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 32) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AppData()
{
  return &type metadata for AppData;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *__n128 result = *a2;
  return result;
}

ValueMetadata *type metadata accessor for ContentEnvironmentData()
{
  return &type metadata for ContentEnvironmentData;
}

uint64_t initializeBufferWithCopyOfBuffer for DeviceData(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for DeviceData()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for DeviceData(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(_WORD *)(a1 + 16) = *(_WORD *)(a2 + 16);
  uint64_t v4 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v4;
  uint64_t v5 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for DeviceData(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(unsigned char *)(a1 + 17) = *(unsigned char *)(a2 + 17);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy56_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 32);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for DeviceData(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_WORD *)(a1 + 16) = *(_WORD *)(a2 + 16);
  uint64_t v5 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v6;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for DeviceData(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 56)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for DeviceData(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 56) = 1;
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
    *(unsigned char *)(result + 56) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for DeviceData()
{
  return &type metadata for DeviceData;
}

uint64_t destroy for SessionData()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for SessionData(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  uint64_t v3 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v3;
  uint64_t v4 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v4;
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  uint64_t v5 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v5;
  uint64_t v6 = *(void *)(a2 + 72);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = v6;
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(_DWORD *)(a1 + 88) = *(_DWORD *)(a2 + 88);
  *(unsigned char *)(a1 + 92) = *(unsigned char *)(a2 + 92);
  *(_WORD *)(a1 + 93) = *(_WORD *)(a2 + 93);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for SessionData(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 88) = *(unsigned char *)(a2 + 88);
  *(unsigned char *)(a1 + 89) = *(unsigned char *)(a2 + 89);
  *(unsigned char *)(a1 + 90) = *(unsigned char *)(a2 + 90);
  *(unsigned char *)(a1 + 91) = *(unsigned char *)(a2 + 91);
  *(unsigned char *)(a1 + 92) = *(unsigned char *)(a2 + 92);
  *(unsigned char *)(a1 + 93) = *(unsigned char *)(a2 + 93);
  *(unsigned char *)(a1 + 94) = *(unsigned char *)(a2 + 94);
  return a1;
}

__n128 __swift_memcpy95_8(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  __n128 result = *(__n128 *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  long long v5 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 79) = *(_OWORD *)(a2 + 79);
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)(a1 + 64) = v5;
  *(__n128 *)(a1 + 32) = result;
  return result;
}

uint64_t assignWithTake for SessionData(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  uint64_t v4 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v5;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 88) = *(unsigned char *)(a2 + 88);
  *(unsigned char *)(a1 + 89) = *(unsigned char *)(a2 + 89);
  *(unsigned char *)(a1 + 90) = *(unsigned char *)(a2 + 90);
  *(unsigned char *)(a1 + 91) = *(unsigned char *)(a2 + 91);
  *(unsigned char *)(a1 + 92) = *(unsigned char *)(a2 + 92);
  *(unsigned char *)(a1 + 93) = *(unsigned char *)(a2 + 93);
  *(unsigned char *)(a1 + 94) = *(unsigned char *)(a2 + 94);
  return a1;
}

uint64_t getEnumTagSinglePayload for SessionData(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 95)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 56);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SessionData(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 94) = 0;
    *(_WORD *)(result + 92) = 0;
    *(_DWORD *)(result + 88) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 95) = 1;
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
      *(void *)(result + 56) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 95) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SessionData()
{
  return &type metadata for SessionData;
}

uint64_t destroy for UserData()
{
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for UserData(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(_WORD *)(a1 + 16) = *(_WORD *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  uint64_t v4 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for UserData(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(unsigned char *)(a1 + 17) = *(unsigned char *)(a2 + 17);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  *(_DWORD *)(a1 + 36) = *(_DWORD *)(a2 + 36);
  *(_DWORD *)(a1 + 40) = *(_DWORD *)(a2 + 40);
  *(_DWORD *)(a1 + 44) = *(_DWORD *)(a2 + 44);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy64_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for UserData(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_WORD *)(a1 + 16) = *(_WORD *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  *(_DWORD *)(a1 + 36) = *(_DWORD *)(a2 + 36);
  *(_DWORD *)(a1 + 40) = *(_DWORD *)(a2 + 40);
  *(_DWORD *)(a1 + 44) = *(_DWORD *)(a2 + 44);
  uint64_t v5 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v5;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for UserData(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 64)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for UserData(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 64) = 1;
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
    *(unsigned char *)(result + 64) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for UserData()
{
  return &type metadata for UserData;
}

uint64_t sub_21FDE4404(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EFCC70);
  uint64_t v5 = **(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8);

  return v5(a1, a2, v4);
}

uint64_t sub_21FDE4474(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EFCC70);
  long long v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);

  return v3(a1, v2);
}

uint64_t sub_21FDE44DC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EFCC70);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t sub_21FDE4544(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EFCC70);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t sub_21FDE45AC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EFCC70);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t sub_21FDE4614(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EFCC70);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t sub_21FDE467C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_21FDE4690);
}

uint64_t sub_21FDE4690(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EFCC70);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);

  return v5(a1, a2, v4);
}

uint64_t sub_21FDE4700(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_21FDE4714);
}

uint64_t sub_21FDE4714(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EFCC70);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);

  return v5(a1, a2, a2, v4);
}

uint64_t type metadata accessor for TelemetryEvent(uint64_t a1)
{
  return sub_21FDE4920(a1, (uint64_t *)&unk_267EFCC78);
}

void sub_21FDE47A8()
{
  sub_21FDE4834();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_21FDE4834()
{
  if (!qword_267EFCC88)
  {
    type metadata accessor for NetworkEventData(255);
    sub_21FDE4958(&qword_267EFCC90, (void (*)(uint64_t))type metadata accessor for NetworkEventData);
    sub_21FDE4958(&qword_267EFCC98, (void (*)(uint64_t))type metadata accessor for NetworkEventData);
    unint64_t v0 = sub_21FDF5FA8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_267EFCC88);
    }
  }
}

uint64_t type metadata accessor for NetworkEventData(uint64_t a1)
{
  return sub_21FDE4920(a1, (uint64_t *)&unk_267EFCCA0);
}

uint64_t sub_21FDE4920(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_21FDE4958(unint64_t *a1, void (*a2)(uint64_t))
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

void *sub_21FDE49A0(void *a1, void *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v17 = *a2;
    *a1 = *a2;
    a1 = (void *)(v17 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_21FDF5E98();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = a3[6];
    *(void *)((char *)a1 + a3[5]) = *(void *)((char *)a2 + a3[5]);
    *(void *)((char *)a1 + v8) = *(void *)((char *)a2 + v8);
    uint64_t v9 = a3[8];
    *(void *)((char *)a1 + a3[7]) = *(void *)((char *)a2 + a3[7]);
    *(void *)((char *)a1 + v9) = *(void *)((char *)a2 + v9);
    uint64_t v10 = a3[10];
    *(void *)((char *)a1 + a3[9]) = *(void *)((char *)a2 + a3[9]);
    *((unsigned char *)a1 + v10) = *((unsigned char *)a2 + v10);
    uint64_t v11 = a3[12];
    *(void *)((char *)a1 + a3[11]) = *(void *)((char *)a2 + a3[11]);
    *(void *)((char *)a1 + v11) = *(void *)((char *)a2 + v11);
    uint64_t v12 = a3[14];
    *((unsigned char *)a1 + a3[13]) = *((unsigned char *)a2 + a3[13]);
    *((unsigned char *)a1 + v12) = *((unsigned char *)a2 + v12);
    uint64_t v13 = a3[16];
    *((unsigned char *)a1 + a3[15]) = *((unsigned char *)a2 + a3[15]);
    uint64_t v14 = (void *)((char *)a1 + v13);
    uint64_t v15 = (void *)((char *)a2 + v13);
    uint64_t v16 = v15[1];
    *uint64_t v14 = *v15;
    v14[1] = v16;
    *((unsigned char *)a1 + a3[17]) = *((unsigned char *)a2 + a3[17]);
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_21FDE4AF0(uint64_t a1)
{
  uint64_t v2 = sub_21FDF5E98();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);

  return swift_bridgeObjectRelease();
}

uint64_t sub_21FDE4B68(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_21FDF5E98();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  *(void *)(a1 + v7) = *(void *)(a2 + v7);
  uint64_t v8 = a3[8];
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  *(void *)(a1 + v8) = *(void *)(a2 + v8);
  uint64_t v9 = a3[10];
  *(void *)(a1 + a3[9]) = *(void *)(a2 + a3[9]);
  *(unsigned char *)(a1 + v9) = *(unsigned char *)(a2 + v9);
  uint64_t v10 = a3[12];
  *(void *)(a1 + a3[11]) = *(void *)(a2 + a3[11]);
  *(void *)(a1 + v10) = *(void *)(a2 + v10);
  uint64_t v11 = a3[14];
  *(unsigned char *)(a1 + a3[13]) = *(unsigned char *)(a2 + a3[13]);
  *(unsigned char *)(a1 + v11) = *(unsigned char *)(a2 + v11);
  uint64_t v12 = a3[16];
  *(unsigned char *)(a1 + a3[15]) = *(unsigned char *)(a2 + a3[15]);
  uint64_t v13 = (void *)(a1 + v12);
  uint64_t v14 = (void *)(a2 + v12);
  uint64_t v15 = v14[1];
  *uint64_t v13 = *v14;
  v13[1] = v15;
  *(unsigned char *)(a1 + a3[17]) = *(unsigned char *)(a2 + a3[17]);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_21FDE4C68(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_21FDF5E98();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  *(void *)(a1 + a3[6]) = *(void *)(a2 + a3[6]);
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  *(void *)(a1 + a3[8]) = *(void *)(a2 + a3[8]);
  *(void *)(a1 + a3[9]) = *(void *)(a2 + a3[9]);
  *(unsigned char *)(a1 + a3[10]) = *(unsigned char *)(a2 + a3[10]);
  *(void *)(a1 + a3[11]) = *(void *)(a2 + a3[11]);
  *(void *)(a1 + a3[12]) = *(void *)(a2 + a3[12]);
  *(unsigned char *)(a1 + a3[13]) = *(unsigned char *)(a2 + a3[13]);
  *(unsigned char *)(a1 + a3[14]) = *(unsigned char *)(a2 + a3[14]);
  *(unsigned char *)(a1 + a3[15]) = *(unsigned char *)(a2 + a3[15]);
  uint64_t v7 = a3[16];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  *uint64_t v8 = *v9;
  v8[1] = v9[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + a3[17]) = *(unsigned char *)(a2 + a3[17]);
  return a1;
}

uint64_t sub_21FDE4D94(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_21FDF5E98();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  *(void *)(a1 + v7) = *(void *)(a2 + v7);
  uint64_t v8 = a3[8];
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  *(void *)(a1 + v8) = *(void *)(a2 + v8);
  uint64_t v9 = a3[10];
  *(void *)(a1 + a3[9]) = *(void *)(a2 + a3[9]);
  *(unsigned char *)(a1 + v9) = *(unsigned char *)(a2 + v9);
  uint64_t v10 = a3[12];
  *(void *)(a1 + a3[11]) = *(void *)(a2 + a3[11]);
  *(void *)(a1 + v10) = *(void *)(a2 + v10);
  uint64_t v11 = a3[14];
  *(unsigned char *)(a1 + a3[13]) = *(unsigned char *)(a2 + a3[13]);
  *(unsigned char *)(a1 + v11) = *(unsigned char *)(a2 + v11);
  uint64_t v12 = a3[16];
  *(unsigned char *)(a1 + a3[15]) = *(unsigned char *)(a2 + a3[15]);
  *(_OWORD *)(a1 + v12) = *(_OWORD *)(a2 + v12);
  *(unsigned char *)(a1 + a3[17]) = *(unsigned char *)(a2 + a3[17]);
  return a1;
}

uint64_t sub_21FDE4E88(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_21FDF5E98();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  *(void *)(a1 + v7) = *(void *)(a2 + v7);
  uint64_t v8 = a3[8];
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  *(void *)(a1 + v8) = *(void *)(a2 + v8);
  uint64_t v9 = a3[10];
  *(void *)(a1 + a3[9]) = *(void *)(a2 + a3[9]);
  *(unsigned char *)(a1 + v9) = *(unsigned char *)(a2 + v9);
  uint64_t v10 = a3[12];
  *(void *)(a1 + a3[11]) = *(void *)(a2 + a3[11]);
  *(void *)(a1 + v10) = *(void *)(a2 + v10);
  uint64_t v11 = a3[14];
  *(unsigned char *)(a1 + a3[13]) = *(unsigned char *)(a2 + a3[13]);
  *(unsigned char *)(a1 + v11) = *(unsigned char *)(a2 + v11);
  uint64_t v12 = a3[16];
  *(unsigned char *)(a1 + a3[15]) = *(unsigned char *)(a2 + a3[15]);
  uint64_t v13 = (void *)(a1 + v12);
  uint64_t v14 = (uint64_t *)(a2 + v12);
  uint64_t v16 = *v14;
  uint64_t v15 = v14[1];
  *uint64_t v13 = v16;
  v13[1] = v15;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + a3[17]) = *(unsigned char *)(a2 + a3[17]);
  return a1;
}

uint64_t sub_21FDE4F8C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_21FDE4FA0);
}

uint64_t sub_21FDE4FA0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_21FDF5E98();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 64) + 8);
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
}

uint64_t sub_21FDE5064(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_21FDE5078);
}

uint64_t sub_21FDE5078(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_21FDF5E98();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 64) + 8) = (a2 - 1);
  }
  return result;
}

uint64_t sub_21FDE5138()
{
  uint64_t result = sub_21FDF5E98();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

BOOL sub_21FDE5210(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_21FDE5228()
{
  return sub_21FDF64F8();
}

uint64_t sub_21FDE5270()
{
  return sub_21FDF64E8();
}

uint64_t sub_21FDE529C()
{
  return sub_21FDF64F8();
}

uint64_t sub_21FDE52E0()
{
  if (*v0) {
    return 0x646C697542707061;
  }
  else {
    return 0x6973726556707061;
  }
}

uint64_t sub_21FDE532C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_21FDEA828(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_21FDE5354()
{
  return 0;
}

void sub_21FDE5360(unsigned char *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_21FDE536C(uint64_t a1)
{
  unint64_t v2 = sub_21FDEAB54();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_21FDE53A8(uint64_t a1)
{
  unint64_t v2 = sub_21FDEAB54();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_21FDE53E4(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v12[0] = a4;
  v12[1] = a5;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EFCD10);
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  unint64_t v10 = (char *)v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_21FDEAB54();
  sub_21FDF6518();
  char v14 = 0;
  sub_21FDF6458();
  if (!v5)
  {
    char v13 = 1;
    sub_21FDF6458();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

uint64_t sub_21FDE555C()
{
  return sub_21FDF5F88();
}

uint64_t sub_21FDE5574()
{
  return sub_21FDF5F98();
}

uint64_t sub_21FDE558C()
{
  return sub_21FDF5F78();
}

uint64_t sub_21FDE55A4@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_21FDEA94C(a1);
  if (!v2)
  {
    *a2 = result;
    a2[1] = v5;
    a2[2] = v6;
    a2[3] = v7;
  }
  return result;
}

uint64_t sub_21FDE55D4(void *a1)
{
  return sub_21FDE53E4(a1, *v1, v1[1], v1[2], v1[3]);
}

unint64_t sub_21FDE55F4(char a1)
{
  unint64_t result = 0x657366664F637475;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x65676175676E616CLL;
      break;
    case 2:
      unint64_t result = 0x437972746E756F63;
      break;
    case 3:
    case 14:
      unint64_t result = 0xD000000000000012;
      break;
    case 4:
      unint64_t result = 0x54746375646F7270;
      break;
    case 5:
      unint64_t result = 0xD00000000000001CLL;
      break;
    case 6:
      unint64_t result = 0xD00000000000001DLL;
      break;
    case 7:
      unint64_t result = 0x44496E6F69676572;
      break;
    case 8:
      unint64_t result = 0x4465726F74537369;
      break;
    case 9:
      unint64_t result = 0xD000000000000017;
      break;
    case 10:
      unint64_t result = 0xD000000000000014;
      break;
    case 11:
      unint64_t result = 0xD00000000000001CLL;
      break;
    case 12:
      unint64_t result = 0xD000000000000018;
      break;
    case 13:
      unint64_t result = 0xD000000000000011;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_21FDE57F4(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EFCDC8);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_21FDECB94();
  sub_21FDF6518();
  LOBYTE(v11) = 0;
  sub_21FDF6498();
  if (!v2)
  {
    LOBYTE(v11) = 1;
    sub_21FDF6428();
    LOBYTE(v11) = 2;
    sub_21FDF6428();
    LOBYTE(v11) = *(unsigned char *)(v3 + 40);
    char v12 = 3;
    sub_21FDECC90();
    sub_21FDF6488();
    LOBYTE(v11) = 4;
    sub_21FDF6458();
    uint64_t v11 = *(void *)(v3 + 64);
    char v12 = 5;
    __swift_instantiateConcreteTypeFromMangledName(&qword_267EFCD90);
    sub_21FDECCE4(&qword_267EFCDD8, &qword_267EFCD90);
    sub_21FDF6488();
    uint64_t v11 = *(void *)(v3 + 72);
    char v12 = 6;
    __swift_instantiateConcreteTypeFromMangledName(&qword_267EFCDA0);
    sub_21FDECCE4(&qword_267EFCDE0, &qword_267EFCDA0);
    sub_21FDF6488();
    sub_21FDECD44(v3 + 80, (uint64_t)v14, &qword_267EFCDE8);
    sub_21FDECD44((uint64_t)v14, (uint64_t)&v11, &qword_267EFCDE8);
    char v12 = 7;
    __swift_instantiateConcreteTypeFromMangledName(&qword_267EFCDB0);
    sub_21FDECCE4(&qword_267EFCDF0, &qword_267EFCDB0);
    sub_21FDF6448();
    LOBYTE(v11) = 8;
    sub_21FDF6468();
    LOBYTE(v11) = 9;
    sub_21FDF6468();
    LOBYTE(v11) = 10;
    sub_21FDF6468();
    LOBYTE(v11) = 11;
    sub_21FDF6468();
    LOBYTE(v11) = 12;
    sub_21FDF6438();
    LOBYTE(v11) = 13;
    sub_21FDF6468();
    sub_21FDECD44(v3 + 94, (uint64_t)&v13, &qword_267EFCDF8);
    sub_21FDECD44((uint64_t)&v13, (uint64_t)&v11, &qword_267EFCDF8);
    char v12 = 14;
    sub_21FDECDA8();
    sub_21FDF6448();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

unint64_t sub_21FDE5CC4()
{
  return sub_21FDE55F4(*v0);
}

uint64_t sub_21FDE5CCC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_21FDEABF8(a1, a2);
  *a3 = result;
  return result;
}

void sub_21FDE5CF4(unsigned char *a1@<X8>)
{
  *a1 = 15;
}

uint64_t sub_21FDE5D00(uint64_t a1)
{
  unint64_t v2 = sub_21FDECB94();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_21FDE5D3C(uint64_t a1)
{
  unint64_t v2 = sub_21FDECB94();

  return MEMORY[0x270FA00B8](a1, v2);
}

double sub_21FDE5D78@<D0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  sub_21FDEB1F8(a1, v7);
  if (!v2)
  {
    long long v5 = v7[3];
    a2[2] = v7[2];
    a2[3] = v5;
    a2[4] = v8[0];
    *(_OWORD *)((char *)a2 + 79) = *(_OWORD *)((char *)v8 + 15);
    double result = *(double *)v7;
    long long v6 = v7[1];
    *a2 = v7[0];
    a2[1] = v6;
  }
  return result;
}

uint64_t sub_21FDE5DCC(void *a1)
{
  return sub_21FDE57F4(a1);
}

uint64_t sub_21FDE5E18(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_21FDE60EC(*a1, *a2);
}

uint64_t sub_21FDE5E24(unsigned __int8 a1, unsigned __int8 a2)
{
  int v2 = a1;
  if (a1)
  {
    if (a1 == 1) {
      uint64_t v3 = 7824750;
    }
    else {
      uint64_t v3 = 0x6E696E7275746572;
    }
    if (v2 == 1) {
      unint64_t v4 = 0xE300000000000000;
    }
    else {
      unint64_t v4 = 0xE900000000000067;
    }
    int v5 = a2;
    if (a2)
    {
LABEL_9:
      if (v5 == 1) {
        uint64_t v6 = 7824750;
      }
      else {
        uint64_t v6 = 0x6E696E7275746572;
      }
      if (v5 == 1) {
        unint64_t v7 = 0xE300000000000000;
      }
      else {
        unint64_t v7 = 0xE900000000000067;
      }
      if (v3 != v6) {
        goto LABEL_21;
      }
      goto LABEL_19;
    }
  }
  else
  {
    unint64_t v4 = 0xE700000000000000;
    uint64_t v3 = 0x6E776F6E6B6E75;
    int v5 = a2;
    if (a2) {
      goto LABEL_9;
    }
  }
  unint64_t v7 = 0xE700000000000000;
  if (v3 != 0x6E776F6E6B6E75)
  {
LABEL_21:
    char v8 = sub_21FDF64B8();
    goto LABEL_22;
  }
LABEL_19:
  if (v4 != v7) {
    goto LABEL_21;
  }
  char v8 = 1;
LABEL_22:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_21FDE5F38(unsigned __int8 a1, char a2)
{
  uint64_t v2 = 0x6E776F6E6B6E75;
  unint64_t v3 = 0xE700000000000000;
  uint64_t v4 = a1;
  uint64_t v5 = 0x6E776F6E6B6E75;
  switch(v4)
  {
    case 1:
      unint64_t v3 = 0xE400000000000000;
      uint64_t v5 = 1768319351;
      break;
    case 2:
      unint64_t v3 = 0xE400000000000000;
      uint64_t v5 = 1851881335;
      break;
    case 3:
      unint64_t v3 = 0xE600000000000000;
      uint64_t v5 = 0x47356E617777;
      break;
    case 4:
      uint64_t v5 = 0x6863616552746F6ELL;
      unint64_t v3 = 0xEC000000656C6261;
      break;
    default:
      break;
  }
  unint64_t v6 = 0xE700000000000000;
  switch(a2)
  {
    case 1:
      unint64_t v6 = 0xE400000000000000;
      if (v5 == 1768319351) {
        goto LABEL_13;
      }
      goto LABEL_16;
    case 2:
      unint64_t v6 = 0xE400000000000000;
      if (v5 != 1851881335) {
        goto LABEL_16;
      }
      goto LABEL_13;
    case 3:
      unint64_t v6 = 0xE600000000000000;
      uint64_t v2 = 0x47356E617777;
      goto LABEL_12;
    case 4:
      unint64_t v6 = 0xEC000000656C6261;
      if (v5 != 0x6863616552746F6ELL) {
        goto LABEL_16;
      }
      goto LABEL_13;
    default:
LABEL_12:
      if (v5 != v2) {
        goto LABEL_16;
      }
LABEL_13:
      if (v3 == v6) {
        char v7 = 1;
      }
      else {
LABEL_16:
      }
        char v7 = sub_21FDF64B8();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v7 & 1;
  }
}

uint64_t sub_21FDE60EC(unsigned __int8 a1, unsigned __int8 a2)
{
  int v2 = a1;
  if (a1)
  {
    if (a1 == 1) {
      uint64_t v3 = 0x6E496E6567676F6CLL;
    }
    else {
      uint64_t v3 = 0x754F646567676F6CLL;
    }
    if (v2 == 1) {
      unint64_t v4 = 0xE800000000000000;
    }
    else {
      unint64_t v4 = 0xE900000000000074;
    }
    int v5 = a2;
    if (a2)
    {
LABEL_9:
      if (v5 == 1) {
        uint64_t v6 = 0x6E496E6567676F6CLL;
      }
      else {
        uint64_t v6 = 0x754F646567676F6CLL;
      }
      if (v5 == 1) {
        unint64_t v7 = 0xE800000000000000;
      }
      else {
        unint64_t v7 = 0xE900000000000074;
      }
      if (v3 != v6) {
        goto LABEL_21;
      }
      goto LABEL_19;
    }
  }
  else
  {
    unint64_t v4 = 0xE700000000000000;
    uint64_t v3 = 0x6E776F6E6B6E75;
    int v5 = a2;
    if (a2) {
      goto LABEL_9;
    }
  }
  unint64_t v7 = 0xE700000000000000;
  if (v3 != 0x6E776F6E6B6E75)
  {
LABEL_21:
    char v8 = sub_21FDF64B8();
    goto LABEL_22;
  }
LABEL_19:
  if (v4 != v7) {
    goto LABEL_21;
  }
  char v8 = 1;
LABEL_22:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_21FDE6210(unsigned __int8 a1, char a2)
{
  uint64_t v2 = 0x6E776F6E6B6E75;
  unint64_t v3 = 0xE700000000000000;
  uint64_t v4 = a1;
  uint64_t v5 = 0x6E776F6E6B6E75;
  switch(v4)
  {
    case 1:
      unint64_t v3 = 0xE200000000000000;
      uint64_t v5 = 24945;
      break;
    case 2:
      uint64_t v5 = 0x676E6967617473;
      break;
    case 3:
      unint64_t v3 = 0xE400000000000000;
      uint64_t v5 = 1685025392;
      break;
    default:
      break;
  }
  unint64_t v6 = 0xE700000000000000;
  switch(a2)
  {
    case 1:
      unint64_t v6 = 0xE200000000000000;
      if (v5 == 24945) {
        goto LABEL_12;
      }
      goto LABEL_14;
    case 2:
      uint64_t v2 = 0x676E6967617473;
      goto LABEL_9;
    case 3:
      unint64_t v6 = 0xE400000000000000;
      if (v5 == 1685025392) {
        goto LABEL_12;
      }
      goto LABEL_14;
    default:
LABEL_9:
      if (v5 != v2) {
        goto LABEL_14;
      }
LABEL_12:
      if (v3 == v6) {
        char v7 = 1;
      }
      else {
LABEL_14:
      }
        char v7 = sub_21FDF64B8();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v7 & 1;
  }
}

uint64_t sub_21FDE6370(unsigned __int8 a1, unsigned __int8 a2)
{
  unint64_t v2 = 0xEA00000000006465;
  uint64_t v3 = 0x766C6F7365726E75;
  int v4 = a1;
  if (a1)
  {
    if (a1 == 1) {
      uint64_t v5 = 0x6C75666574617473;
    }
    else {
      uint64_t v5 = 0x73656C6574617473;
    }
    if (v4 == 1) {
      unint64_t v6 = 0xE800000000000000;
    }
    else {
      unint64_t v6 = 0xE900000000000073;
    }
    int v7 = a2;
    if (!a2) {
      goto LABEL_15;
    }
    goto LABEL_9;
  }
  uint64_t v5 = 0x766C6F7365726E75;
  unint64_t v6 = 0xEA00000000006465;
  int v7 = a2;
  if (a2)
  {
LABEL_9:
    if (v7 == 1) {
      uint64_t v3 = 0x6C75666574617473;
    }
    else {
      uint64_t v3 = 0x73656C6574617473;
    }
    if (v7 == 1) {
      unint64_t v2 = 0xE800000000000000;
    }
    else {
      unint64_t v2 = 0xE900000000000073;
    }
  }
LABEL_15:
  if (v5 == v3 && v6 == v2) {
    char v8 = 1;
  }
  else {
    char v8 = sub_21FDF64B8();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_21FDE6494(char a1, unsigned __int8 a2)
{
  if (a1)
  {
    if (a1 == 1) {
      uint64_t v2 = 0x6C616E7265746E69;
    }
    else {
      uint64_t v2 = 0x6C616E7265747865;
    }
    unint64_t v3 = 0xE800000000000000;
    int v4 = a2;
    if (a2)
    {
LABEL_6:
      if (v4 == 1) {
        uint64_t v5 = 0x6C616E7265746E69;
      }
      else {
        uint64_t v5 = 0x6C616E7265747865;
      }
      unint64_t v6 = 0xE800000000000000;
      if (v2 != v5) {
        goto LABEL_15;
      }
      goto LABEL_13;
    }
  }
  else
  {
    unint64_t v3 = 0xE700000000000000;
    uint64_t v2 = 0x6E776F6E6B6E75;
    int v4 = a2;
    if (a2) {
      goto LABEL_6;
    }
  }
  unint64_t v6 = 0xE700000000000000;
  if (v2 != 0x6E776F6E6B6E75)
  {
LABEL_15:
    char v7 = sub_21FDF64B8();
    goto LABEL_16;
  }
LABEL_13:
  if (v3 != v6) {
    goto LABEL_15;
  }
  char v7 = 1;
LABEL_16:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_21FDE6588(unsigned __int8 a1, char a2)
{
  uint64_t v2 = 0x6E776F6E6B6E75;
  unint64_t v3 = 0xE700000000000000;
  uint64_t v4 = a1;
  uint64_t v5 = 0x6E776F6E6B6E75;
  switch(v4)
  {
    case 1:
      unint64_t v3 = 0xE300000000000000;
      uint64_t v5 = 5459817;
      break;
    case 2:
      unint64_t v3 = 0xE600000000000000;
      uint64_t v5 = 0x534F64615069;
      break;
    case 3:
      unint64_t v3 = 0xE500000000000000;
      uint64_t v5 = 0x534F63616DLL;
      break;
    default:
      break;
  }
  unint64_t v6 = 0xE700000000000000;
  switch(a2)
  {
    case 1:
      unint64_t v6 = 0xE300000000000000;
      if (v5 == 5459817) {
        goto LABEL_12;
      }
      goto LABEL_14;
    case 2:
      unint64_t v6 = 0xE600000000000000;
      uint64_t v2 = 0x534F64615069;
      goto LABEL_9;
    case 3:
      unint64_t v6 = 0xE500000000000000;
      if (v5 == 0x534F63616DLL) {
        goto LABEL_12;
      }
      goto LABEL_14;
    default:
LABEL_9:
      if (v5 != v2) {
        goto LABEL_14;
      }
LABEL_12:
      if (v3 == v6) {
        char v7 = 1;
      }
      else {
LABEL_14:
      }
        char v7 = sub_21FDF64B8();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v7 & 1;
  }
}

uint64_t sub_21FDE66F8(unsigned __int8 a1, unsigned __int8 a2)
{
  int v2 = a1;
  if (a1)
  {
    if (a1 == 1) {
      uint64_t v3 = 7629160;
    }
    else {
      uint64_t v3 = 1936943469;
    }
    if (v2 == 1) {
      unint64_t v4 = 0xE300000000000000;
    }
    else {
      unint64_t v4 = 0xE400000000000000;
    }
    int v5 = a2;
    if (a2)
    {
LABEL_9:
      if (v5 == 1) {
        uint64_t v6 = 7629160;
      }
      else {
        uint64_t v6 = 1936943469;
      }
      if (v5 == 1) {
        unint64_t v7 = 0xE300000000000000;
      }
      else {
        unint64_t v7 = 0xE400000000000000;
      }
      if (v3 != v6) {
        goto LABEL_21;
      }
      goto LABEL_19;
    }
  }
  else
  {
    unint64_t v4 = 0xE700000000000000;
    uint64_t v3 = 0x6E776F6E6B6E75;
    int v5 = a2;
    if (a2) {
      goto LABEL_9;
    }
  }
  unint64_t v7 = 0xE700000000000000;
  if (v3 != 0x6E776F6E6B6E75)
  {
LABEL_21:
    char v8 = sub_21FDF64B8();
    goto LABEL_22;
  }
LABEL_19:
  if (v4 != v7) {
    goto LABEL_21;
  }
  char v8 = 1;
LABEL_22:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_21FDE67F4()
{
  return sub_21FDF64F8();
}

uint64_t sub_21FDE689C()
{
  sub_21FDF62A8();

  return swift_bridgeObjectRelease();
}

uint64_t sub_21FDE6930()
{
  return sub_21FDF64F8();
}

uint64_t sub_21FDE69D4@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_21FDEF370();
  *a1 = result;
  return result;
}

void sub_21FDE6A0C(uint64_t *a1@<X8>)
{
  int v2 = *v1;
  unint64_t v3 = 0xE700000000000000;
  unint64_t v4 = 0xE800000000000000;
  uint64_t v5 = 0x6E496E6567676F6CLL;
  if (v2 != 1)
  {
    uint64_t v5 = 0x754F646567676F6CLL;
    unint64_t v4 = 0xE900000000000074;
  }
  BOOL v6 = v2 == 0;
  if (*v1) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = 0x6E776F6E6B6E75;
  }
  if (!v6) {
    unint64_t v3 = v4;
  }
  *a1 = v7;
  a1[1] = v3;
}

uint64_t sub_21FDE6A70()
{
  return sub_21FDF62C8();
}

uint64_t sub_21FDE6AD0()
{
  return sub_21FDF62B8();
}

uint64_t sub_21FDE6B20(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_21FDE6370(*a1, *a2);
}

uint64_t sub_21FDE6B2C()
{
  return sub_21FDF64F8();
}

uint64_t sub_21FDE6BD8()
{
  sub_21FDF62A8();

  return swift_bridgeObjectRelease();
}

uint64_t sub_21FDE6C70()
{
  return sub_21FDF64F8();
}

uint64_t sub_21FDE6D18@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_21FDEF370();
  *a1 = result;
  return result;
}

void sub_21FDE6D50(uint64_t *a1@<X8>)
{
  int v2 = *v1;
  unint64_t v3 = 0xEA00000000006465;
  unint64_t v4 = 0xE800000000000000;
  uint64_t v5 = 0x6C75666574617473;
  if (v2 != 1)
  {
    uint64_t v5 = 0x73656C6574617473;
    unint64_t v4 = 0xE900000000000073;
  }
  BOOL v6 = v2 == 0;
  if (*v1) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = 0x766C6F7365726E75;
  }
  if (!v6) {
    unint64_t v3 = v4;
  }
  *a1 = v7;
  a1[1] = v3;
}

uint64_t sub_21FDE6DB8()
{
  return sub_21FDF62C8();
}

uint64_t sub_21FDE6E18()
{
  return sub_21FDF62B8();
}

uint64_t sub_21FDE6E68(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EFCD60);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  char v8 = &v10[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_21FDEC9F0();
  sub_21FDF6518();
  v10[15] = 0;
  sub_21FDF6458();
  if (!v2)
  {
    v10[14] = *(unsigned char *)(v3 + 16);
    v10[13] = 1;
    sub_21FDECAEC();
    sub_21FDF6488();
    v10[12] = *(unsigned char *)(v3 + 17);
    v10[11] = 2;
    sub_21FDECB40();
    sub_21FDF6488();
    v10[10] = 3;
    sub_21FDF6458();
    v10[9] = 4;
    sub_21FDF6458();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v8, v5);
}

BOOL sub_21FDE7070(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

unint64_t sub_21FDE7084()
{
  unint64_t result = 0x6F4D656369766564;
  switch(*v0)
  {
    case 1:
      unint64_t result = 0x6C50656369766564;
      break;
    case 2:
      unint64_t result = 0xD000000000000010;
      break;
    case 3:
      unint64_t result = 0x6F6973726556736FLL;
      break;
    case 4:
      unint64_t result = 0x656C646E7542736FLL;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_21FDE7158@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_21FDEBA14(a1, a2);
  *a3 = result;
  return result;
}

void sub_21FDE7180(unsigned char *a1@<X8>)
{
  *a1 = 5;
}

uint64_t sub_21FDE718C(uint64_t a1)
{
  unint64_t v2 = sub_21FDEC9F0();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_21FDE71C8(uint64_t a1)
{
  unint64_t v2 = sub_21FDEC9F0();

  return MEMORY[0x270FA00B8](a1, v2);
}

double sub_21FDE7204@<D0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  sub_21FDEBC98(a1, (uint64_t)v6);
  if (!v2)
  {
    long long v5 = v6[1];
    *(_OWORD *)a2 = v6[0];
    *(_OWORD *)(a2 + 16) = v5;
    double result = *(double *)&v7;
    *(_OWORD *)(a2 + 32) = v7;
    *(void *)(a2 + 48) = v8;
  }
  return result;
}

uint64_t sub_21FDE7254(void *a1)
{
  return sub_21FDE6E68(a1);
}

uint64_t sub_21FDE726C(unsigned __int8 *a1, char *a2)
{
  return sub_21FDE6588(*a1, *a2);
}

uint64_t sub_21FDE7278()
{
  return sub_21FDF64F8();
}

uint64_t sub_21FDE7344()
{
  sub_21FDF62A8();

  return swift_bridgeObjectRelease();
}

uint64_t sub_21FDE73F8()
{
  return sub_21FDF64F8();
}

uint64_t sub_21FDE74C0@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_21FDEEBA4();
  *a1 = result;
  return result;
}

void sub_21FDE74F8(uint64_t *a1@<X8>)
{
  unint64_t v2 = 0xE700000000000000;
  uint64_t v3 = 0x6E776F6E6B6E75;
  switch(*v1)
  {
    case 1:
      unint64_t v2 = 0xE300000000000000;
      uint64_t v3 = 5459817;
      goto LABEL_3;
    case 2:
      *a1 = 0x534F64615069;
      a1[1] = 0xE600000000000000;
      break;
    case 3:
      *a1 = 0x534F63616DLL;
      a1[1] = 0xE500000000000000;
      break;
    default:
LABEL_3:
      *a1 = v3;
      a1[1] = v2;
      break;
  }
}

uint64_t sub_21FDE7584()
{
  return sub_21FDF62C8();
}

uint64_t sub_21FDE75E4()
{
  return sub_21FDF62B8();
}

uint64_t sub_21FDE7634(char *a1, unsigned __int8 *a2)
{
  return sub_21FDE6494(*a1, *a2);
}

uint64_t sub_21FDE7640()
{
  return sub_21FDF64F8();
}

uint64_t sub_21FDE76D8()
{
  sub_21FDF62A8();

  return swift_bridgeObjectRelease();
}

uint64_t sub_21FDE775C()
{
  return sub_21FDF64F8();
}

uint64_t sub_21FDE77F0@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_21FDEF370();
  *a1 = result;
  return result;
}

void sub_21FDE7828(uint64_t *a1@<X8>)
{
  int v2 = *v1;
  unint64_t v3 = 0xE700000000000000;
  uint64_t v4 = 0x6C616E7265746E69;
  if (v2 != 1) {
    uint64_t v4 = 0x6C616E7265747865;
  }
  BOOL v5 = v2 == 0;
  if (*v1) {
    uint64_t v6 = v4;
  }
  else {
    uint64_t v6 = 0x6E776F6E6B6E75;
  }
  if (!v5) {
    unint64_t v3 = 0xE800000000000000;
  }
  *a1 = v6;
  a1[1] = v3;
}

uint64_t sub_21FDE787C()
{
  return sub_21FDF62C8();
}

uint64_t sub_21FDE78DC()
{
  return sub_21FDF62B8();
}

unint64_t sub_21FDE792C(char a1)
{
  unint64_t result = 0x444972657375;
  switch(a1)
  {
    case 1:
      unint64_t result = 0xD000000000000011;
      break;
    case 2:
      unint64_t result = 0x6570795472657375;
      break;
    case 3:
      unint64_t result = 0x7261745372657375;
      break;
    case 4:
      unint64_t result = 0x6B63617242656761;
      break;
    case 5:
      unint64_t result = 0xD000000000000019;
      break;
    case 6:
      unint64_t result = 0x7265646E6567;
      break;
    case 7:
      unint64_t result = 0xD000000000000015;
      break;
    case 8:
      unint64_t result = 0xD000000000000010;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_21FDE7A64(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EFCE20);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = &v10[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_21FDECDFC();
  sub_21FDF6518();
  v10[15] = 0;
  sub_21FDF6458();
  if (!v2)
  {
    v10[14] = 1;
    sub_21FDF6438();
    v10[13] = *(unsigned char *)(v3 + 17);
    v10[12] = 2;
    sub_21FDECEA4();
    sub_21FDF6488();
    v10[11] = 3;
    sub_21FDF64A8();
    v10[10] = 4;
    sub_21FDF6498();
    v10[9] = 5;
    sub_21FDF6478();
    v10[8] = 6;
    sub_21FDF6498();
    v10[7] = 7;
    sub_21FDF6478();
    v10[6] = 8;
    sub_21FDF6458();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v8, v5);
}

unint64_t sub_21FDE7CF4()
{
  return sub_21FDE792C(*v0);
}

uint64_t sub_21FDE7CFC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_21FDEBFD8(a1, a2);
  *a3 = result;
  return result;
}

void sub_21FDE7D24(unsigned char *a1@<X8>)
{
  *a1 = 9;
}

uint64_t sub_21FDE7D30(uint64_t a1)
{
  unint64_t v2 = sub_21FDECDFC();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_21FDE7D6C(uint64_t a1)
{
  unint64_t v2 = sub_21FDECDFC();

  return MEMORY[0x270FA00B8](a1, v2);
}

double sub_21FDE7DA8@<D0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  sub_21FDEC384(a1, (uint64_t)v7);
  if (!v2)
  {
    long long v5 = v7[1];
    *a2 = v7[0];
    a2[1] = v5;
    double result = *(double *)&v8;
    long long v6 = v9;
    a2[2] = v8;
    a2[3] = v6;
  }
  return result;
}

uint64_t sub_21FDE7DEC(void *a1)
{
  return sub_21FDE7A64(a1);
}

uint64_t sub_21FDE7E04(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_21FDE5E24(*a1, *a2);
}

uint64_t sub_21FDE7E10()
{
  return sub_21FDF64F8();
}

uint64_t sub_21FDE7EB0()
{
  sub_21FDF62A8();

  return swift_bridgeObjectRelease();
}

uint64_t sub_21FDE7F3C()
{
  return sub_21FDF64F8();
}

uint64_t sub_21FDE7FD8@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_21FDEF370();
  *a1 = result;
  return result;
}

void sub_21FDE8010(uint64_t *a1@<X8>)
{
  int v2 = *v1;
  unint64_t v3 = 0xE700000000000000;
  unint64_t v4 = 0xE300000000000000;
  uint64_t v5 = 7824750;
  if (v2 != 1)
  {
    uint64_t v5 = 0x6E696E7275746572;
    unint64_t v4 = 0xE900000000000067;
  }
  BOOL v6 = v2 == 0;
  if (*v1) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = 0x6E776F6E6B6E75;
  }
  if (!v6) {
    unint64_t v3 = v4;
  }
  *a1 = v7;
  a1[1] = v3;
}

uint64_t sub_21FDE806C()
{
  return sub_21FDF62C8();
}

uint64_t sub_21FDE80CC()
{
  return sub_21FDF62B8();
}

uint64_t sub_21FDE811C(void *a1, char a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EFCD30);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = &v9[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_21FDEC8F4();
  sub_21FDF6518();
  v9[15] = a2;
  sub_21FDEC99C();
  sub_21FDF6488();
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t sub_21FDE8260()
{
  return 1;
}

uint64_t sub_21FDE8268()
{
  return sub_21FDF64F8();
}

uint64_t sub_21FDE82AC()
{
  return sub_21FDF64E8();
}

uint64_t sub_21FDE82D4()
{
  return sub_21FDF64F8();
}

unint64_t sub_21FDE8314()
{
  return 0xD000000000000012;
}

uint64_t sub_21FDE8330@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_21FDEC700(a1, a2);
  *a3 = result & 1;
  return result;
}

void sub_21FDE835C(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_21FDE8368(uint64_t a1)
{
  unint64_t v2 = sub_21FDEC8F4();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_21FDE83A4(uint64_t a1)
{
  unint64_t v2 = sub_21FDEC8F4();

  return MEMORY[0x270FA00B8](a1, v2);
}

void *sub_21FDE83E0@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_21FDEC788(a1);
  if (!v2) {
    *a2 = (_BYTE)result;
  }
  return result;
}

uint64_t sub_21FDE840C(void *a1)
{
  return sub_21FDE811C(a1, *v1);
}

uint64_t sub_21FDE8428(unsigned __int8 *a1, char *a2)
{
  return sub_21FDE6210(*a1, *a2);
}

uint64_t sub_21FDE8434()
{
  return sub_21FDF64F8();
}

uint64_t sub_21FDE84F8()
{
  sub_21FDF62A8();

  return swift_bridgeObjectRelease();
}

uint64_t sub_21FDE85A4()
{
  return sub_21FDF64F8();
}

uint64_t sub_21FDE8664@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_21FDEEBA4();
  *a1 = result;
  return result;
}

void sub_21FDE869C(uint64_t *a1@<X8>)
{
  unint64_t v2 = 0xE700000000000000;
  uint64_t v3 = 0x6E776F6E6B6E75;
  switch(*v1)
  {
    case 1:
      unint64_t v2 = 0xE200000000000000;
      uint64_t v3 = 24945;
      goto LABEL_3;
    case 2:
      *a1 = 0x676E6967617473;
      a1[1] = 0xE700000000000000;
      break;
    case 3:
      *a1 = 1685025392;
      a1[1] = 0xE400000000000000;
      break;
    default:
LABEL_3:
      *a1 = v3;
      a1[1] = v2;
      break;
  }
}

uint64_t sub_21FDE8720()
{
  return sub_21FDF62C8();
}

uint64_t sub_21FDE8780()
{
  return sub_21FDF62B8();
}

uint64_t sub_21FDE87D0(uint64_t a1)
{
  return sub_21FDE8820(a1, MEMORY[0x263F24D18], qword_267EFFF90, MEMORY[0x263F24D10]);
}

uint64_t sub_21FDE87F8(uint64_t a1)
{
  return sub_21FDE8820(a1, MEMORY[0x263F24DD8], qword_267EFFFA8, MEMORY[0x263F24DC8]);
}

uint64_t sub_21FDE8820(uint64_t a1, uint64_t (*a2)(void), uint64_t *a3, unsigned int *a4)
{
  uint64_t v6 = a2(0);
  __swift_allocate_value_buffer(v6, a3);
  uint64_t v7 = __swift_project_value_buffer(v6, (uint64_t)a3);
  uint64_t v8 = *a4;
  long long v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 104);

  return v9(v7, v8, v6);
}

uint64_t sub_21FDE88AC@<X0>(uint64_t a1@<X8>)
{
  return sub_21FDE8920(&qword_267EFCB70, MEMORY[0x263F24D18], (uint64_t)qword_267EFFF90, a1);
}

uint64_t sub_21FDE88E8@<X0>(uint64_t a1@<X8>)
{
  return sub_21FDE8920(&qword_267EFCB78, MEMORY[0x263F24DD8], (uint64_t)qword_267EFFFA8, a1);
}

uint64_t sub_21FDE8920@<X0>(void *a1@<X2>, uint64_t (*a2)(void)@<X3>, uint64_t a3@<X4>, uint64_t a4@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v7 = a2(0);
  uint64_t v8 = __swift_project_value_buffer(v7, a3);
  long long v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 16);

  return v9(a4, v8, v7);
}

uint64_t sub_21FDE89C8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = *MEMORY[0x263F24D38];
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EFCC70);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 104);

  return v4(a1, v2, v3);
}

uint64_t sub_21FDE8A40(char a1)
{
  uint64_t result = 0x6D69547472617473;
  switch(a1)
  {
    case 1:
      uint64_t result = 0x7461727544736E64;
      break;
    case 2:
      uint64_t v3 = 0x63656E6E6F63;
      goto LABEL_5;
    case 3:
      uint64_t v3 = 0x736575716572;
LABEL_5:
      uint64_t result = v3 & 0xFFFFFFFFFFFFLL | 0x4474000000000000;
      break;
    case 4:
      uint64_t result = 0xD000000000000010;
      break;
    case 5:
      uint64_t result = 0x65736E6F70736572;
      break;
    case 6:
      uint64_t result = 0x6174536568636163;
      break;
    case 7:
      uint64_t result = 0x6F43737574617473;
      break;
    case 8:
      uint64_t result = 0x646F43726F727265;
      break;
    case 9:
      uint64_t result = 0x707954746E657665;
      break;
    case 10:
      uint64_t result = 0xD000000000000016;
      break;
    case 11:
      uint64_t result = 0xD00000000000001DLL;
      break;
    case 12:
      uint64_t result = 0x69646E6F70736572;
      break;
    case 13:
      uint64_t result = 0xD000000000000011;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_21FDE8C24(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EFCE60);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_21FDECEF8();
  sub_21FDF6518();
  char v13 = 0;
  sub_21FDF5E98();
  sub_21FDE4958(&qword_267EFCE68, MEMORY[0x263F07490]);
  sub_21FDF6488();
  if (!v2)
  {
    long long v9 = (int *)type metadata accessor for NetworkEventData(0);
    char v13 = 1;
    sub_21FDF64A8();
    char v13 = 2;
    sub_21FDF64A8();
    char v13 = 3;
    sub_21FDF64A8();
    char v13 = 4;
    sub_21FDF64A8();
    char v13 = 5;
    sub_21FDF64A8();
    char v13 = *(unsigned char *)(v3 + v9[10]);
    char v12 = 6;
    sub_21FDED108();
    sub_21FDF6488();
    char v13 = 7;
    sub_21FDF64A8();
    char v13 = 8;
    sub_21FDF64A8();
    char v13 = *(unsigned char *)(v3 + v9[13]);
    char v12 = 9;
    sub_21FDED15C();
    sub_21FDF6488();
    char v13 = 10;
    sub_21FDF6468();
    char v13 = *(unsigned char *)(v3 + v9[15]);
    char v12 = 11;
    sub_21FDED1B0();
    sub_21FDF6488();
    char v13 = 12;
    sub_21FDF6458();
    char v13 = 13;
    sub_21FDF6468();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_21FDE9038@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v25 = a2;
  uint64_t v4 = sub_21FDF5E98();
  uint64_t v27 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  v28 = (char *)&v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EFCE30);
  uint64_t v26 = *(void *)(v30 - 8);
  MEMORY[0x270FA5388](v30);
  uint64_t v7 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for NetworkEventData(0);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_21FDECEF8();
  id v29 = v7;
  sub_21FDF6508();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  id v23 = v10;
  id v24 = (int *)v8;
  uint64_t v12 = v26;
  uint64_t v11 = v27;
  char v32 = 0;
  sub_21FDE4958(&qword_267EFCE40, MEMORY[0x263F07490]);
  char v13 = v28;
  sub_21FDF63F8();
  char v14 = v23;
  (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v23, v13, v4);
  char v32 = 1;
  *(void *)&v14[v24[5]] = sub_21FDF6418();
  char v32 = 2;
  *(void *)&v14[v24[6]] = sub_21FDF6418();
  char v32 = 3;
  *(void *)&v14[v24[7]] = sub_21FDF6418();
  char v32 = 4;
  *(void *)&v14[v24[8]] = sub_21FDF6418();
  char v32 = 5;
  *(void *)&v14[v24[9]] = sub_21FDF6418();
  char v31 = 6;
  sub_21FDECF4C();
  sub_21FDF63F8();
  v14[v24[10]] = v32;
  char v32 = 7;
  *(void *)&v14[v24[11]] = sub_21FDF6418();
  char v32 = 8;
  *(void *)&v14[v24[12]] = sub_21FDF6418();
  char v31 = 9;
  sub_21FDECFA0();
  sub_21FDF63F8();
  v23[v24[13]] = v32;
  char v32 = 10;
  v23[v24[14]] = sub_21FDF63D8() & 1;
  char v31 = 11;
  sub_21FDECFF4();
  sub_21FDF63F8();
  v23[v24[15]] = v32;
  char v32 = 12;
  uint64_t v15 = sub_21FDF63C8();
  uint64_t v16 = (uint64_t *)&v23[v24[16]];
  uint64_t *v16 = v15;
  v16[1] = v17;
  char v32 = 13;
  char v18 = sub_21FDF63D8();
  (*(void (**)(char *, uint64_t))(v12 + 8))(v29, v30);
  uint64_t v19 = v25;
  char v20 = v18 & 1;
  uint64_t v21 = (uint64_t)v23;
  v23[v24[17]] = v20;
  sub_21FDED048(v21, v19);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return sub_21FDED0AC(v21);
}

unint64_t sub_21FDE965C(char a1)
{
  unint64_t result = 0x6E776F6E6B6E75;
  switch(a1)
  {
    case 1:
      unint64_t result = 7234659;
      break;
    case 2:
      unint64_t result = 0x6F437070416E6463;
      break;
    case 3:
      unint64_t result = 1937208931;
      break;
    case 4:
      unint64_t result = 0x63696C6275506B63;
      break;
    case 5:
      unint64_t result = 0x7461766972506B63;
      break;
    case 6:
      unint64_t result = 0xD000000000000011;
      break;
    case 7:
      unint64_t result = 0x656764457377656ELL;
      break;
    case 8:
      unint64_t result = 0xD000000000000013;
      break;
    case 9:
      unint64_t result = 0xD000000000000014;
      break;
    case 10:
      unint64_t result = 0xD000000000000026;
      break;
    case 11:
      unint64_t result = 0xD000000000000015;
      break;
    case 12:
      unint64_t result = 0x437961646F546B63;
      break;
    case 13:
      unint64_t result = 0x4669746C754D6B63;
      break;
    case 14:
      unint64_t result = 0x46726564724F6B63;
      break;
    case 15:
    case 17:
      unint64_t result = 0xD000000000000010;
      break;
    case 16:
      unint64_t result = 0x6165536761546B63;
      break;
    case 18:
      unint64_t result = 0xD000000000000011;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_21FDE98CC()
{
  return sub_21FDE8A40(*v0);
}

uint64_t sub_21FDE98D4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_21FDEEBEC(a1, a2);
  *a3 = result;
  return result;
}

void sub_21FDE98FC(unsigned char *a1@<X8>)
{
  *a1 = 14;
}

uint64_t sub_21FDE9908(uint64_t a1)
{
  unint64_t v2 = sub_21FDECEF8();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_21FDE9944(uint64_t a1)
{
  unint64_t v2 = sub_21FDECEF8();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_21FDE9980@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_21FDE9038(a1, a2);
}

uint64_t sub_21FDE9998(void *a1)
{
  return sub_21FDE8C24(a1);
}

unint64_t sub_21FDE99B4()
{
  unint64_t result = qword_267EFCCB0;
  if (!qword_267EFCCB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EFCCB0);
  }
  return result;
}

unint64_t sub_21FDE9A0C()
{
  unint64_t result = qword_267EFCCB8;
  if (!qword_267EFCCB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EFCCB8);
  }
  return result;
}

unint64_t sub_21FDE9A64()
{
  unint64_t result = qword_267EFCCC0;
  if (!qword_267EFCCC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EFCCC0);
  }
  return result;
}

unint64_t sub_21FDE9ABC()
{
  unint64_t result = qword_267EFCCC8;
  if (!qword_267EFCCC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EFCCC8);
  }
  return result;
}

unint64_t sub_21FDE9B14()
{
  unint64_t result = qword_267EFCCD0;
  if (!qword_267EFCCD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EFCCD0);
  }
  return result;
}

unint64_t sub_21FDE9B6C()
{
  unint64_t result = qword_267EFCCD8;
  if (!qword_267EFCCD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EFCCD8);
  }
  return result;
}

unint64_t sub_21FDE9BC4()
{
  unint64_t result = qword_267EFCCE0;
  if (!qword_267EFCCE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EFCCE0);
  }
  return result;
}

unint64_t sub_21FDE9C1C()
{
  unint64_t result = qword_267EFCCE8;
  if (!qword_267EFCCE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EFCCE8);
  }
  return result;
}

unint64_t sub_21FDE9C74()
{
  unint64_t result = qword_267EFCCF0;
  if (!qword_267EFCCF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EFCCF0);
  }
  return result;
}

unint64_t sub_21FDE9CCC()
{
  unint64_t result = qword_267EFCCF8;
  if (!qword_267EFCCF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EFCCF8);
  }
  return result;
}

uint64_t sub_21FDE9D20()
{
  return sub_21FDE4958(&qword_267EFCC90, (void (*)(uint64_t))type metadata accessor for NetworkEventData);
}

uint64_t sub_21FDE9D68()
{
  return sub_21FDE4958(&qword_267EFCC98, (void (*)(uint64_t))type metadata accessor for NetworkEventData);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
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

uint64_t sub_21FDE9E4C(char *a1, char *a2)
{
  char v2 = *a2;
  unint64_t v3 = sub_21FDE965C(*a1);
  uint64_t v5 = v4;
  if (v3 == sub_21FDE965C(v2) && v5 == v6) {
    char v8 = 1;
  }
  else {
    char v8 = sub_21FDF64B8();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_21FDE9ED8()
{
  char v1 = *v0;
  sub_21FDF64D8();
  sub_21FDE965C(v1);
  sub_21FDF62A8();
  swift_bridgeObjectRelease();
  return sub_21FDF64F8();
}

uint64_t sub_21FDE9F3C()
{
  sub_21FDE965C(*v0);
  sub_21FDF62A8();

  return swift_bridgeObjectRelease();
}

uint64_t sub_21FDE9F90()
{
  char v1 = *v0;
  sub_21FDF64D8();
  sub_21FDE965C(v1);
  sub_21FDF62A8();
  swift_bridgeObjectRelease();
  return sub_21FDF64F8();
}

uint64_t sub_21FDE9FF0@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_21FDEF31C();
  *a1 = result;
  return result;
}

unint64_t sub_21FDEA020@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_21FDE965C(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_21FDEA04C()
{
  return sub_21FDF62C8();
}

uint64_t sub_21FDEA0AC()
{
  return sub_21FDF62B8();
}

uint64_t sub_21FDEA0FC(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_21FDE66F8(*a1, *a2);
}

uint64_t sub_21FDEA108()
{
  return sub_21FDF64F8();
}

uint64_t sub_21FDEA19C()
{
  sub_21FDF62A8();

  return swift_bridgeObjectRelease();
}

uint64_t sub_21FDEA21C()
{
  return sub_21FDF64F8();
}

uint64_t sub_21FDEA2AC@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_21FDEF370();
  *a1 = result;
  return result;
}

void sub_21FDEA2E4(uint64_t *a1@<X8>)
{
  int v2 = *v1;
  unint64_t v3 = 0xE700000000000000;
  unint64_t v4 = 0xE300000000000000;
  uint64_t v5 = 7629160;
  if (v2 != 1)
  {
    uint64_t v5 = 1936943469;
    unint64_t v4 = 0xE400000000000000;
  }
  BOOL v6 = v2 == 0;
  if (*v1) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = 0x6E776F6E6B6E75;
  }
  if (!v6) {
    unint64_t v3 = v4;
  }
  *a1 = v7;
  a1[1] = v3;
}

uint64_t sub_21FDEA334()
{
  return sub_21FDF62C8();
}

uint64_t sub_21FDEA394()
{
  return sub_21FDF62B8();
}

uint64_t sub_21FDEA3E4(unsigned __int8 *a1, char *a2)
{
  return sub_21FDE5F38(*a1, *a2);
}

uint64_t sub_21FDEA3F0()
{
  return sub_21FDF64F8();
}

uint64_t sub_21FDEA4DC()
{
  sub_21FDF62A8();

  return swift_bridgeObjectRelease();
}

uint64_t sub_21FDEA5B0()
{
  return sub_21FDF64F8();
}

uint64_t sub_21FDEA698@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_21FDEF3B8();
  *a1 = result;
  return result;
}

void sub_21FDEA6C8(uint64_t a1@<X8>)
{
  unint64_t v2 = 0xE700000000000000;
  uint64_t v3 = 0x6E776F6E6B6E75;
  switch(*v1)
  {
    case 1:
      unint64_t v2 = 0xE400000000000000;
      uint64_t v3 = 1768319351;
      goto LABEL_3;
    case 2:
      *(void *)a1 = 1851881335;
      *(void *)(a1 + 8) = 0xE400000000000000;
      break;
    case 3:
      *(void *)a1 = 0x47356E617777;
      *(void *)(a1 + 8) = 0xE600000000000000;
      break;
    case 4:
      strcpy((char *)a1, "notReachable");
      *(unsigned char *)(a1 + 13) = 0;
      *(_WORD *)(a1 + 14) = -5120;
      break;
    default:
LABEL_3:
      *(void *)a1 = v3;
      *(void *)(a1 + 8) = v2;
      break;
  }
}

uint64_t sub_21FDEA778()
{
  return sub_21FDF62C8();
}

uint64_t sub_21FDEA7D8()
{
  return sub_21FDF62B8();
}

uint64_t sub_21FDEA828(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x6973726556707061 && a2 == 0xEA00000000006E6FLL;
  if (v2 || (sub_21FDF64B8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x646C697542707061 && a2 == 0xEE007265626D754ELL)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_21FDF64B8();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_21FDEA94C(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EFCD00);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  char v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_21FDEAB54();
  sub_21FDF6508();
  if (v1)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  else
  {
    char v11 = 0;
    uint64_t v7 = sub_21FDF63C8();
    char v10 = 1;
    swift_bridgeObjectRetain();
    sub_21FDF63C8();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    swift_bridgeObjectRetain();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return v7;
}

unint64_t sub_21FDEAB54()
{
  unint64_t result = qword_267EFCD08;
  if (!qword_267EFCD08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EFCD08);
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

uint64_t sub_21FDEABF8(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x657366664F637475 && a2 == 0xE900000000000074 || (sub_21FDF64B8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x65676175676E616CLL && a2 == 0xEC00000065646F43 || (sub_21FDF64B8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x437972746E756F63 && a2 == 0xEB0000000065646FLL || (sub_21FDF64B8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0xD000000000000012 && a2 == 0x800000021FDFB200 || (sub_21FDF64B8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x54746375646F7270 && a2 == 0xEB00000000657079 || (sub_21FDF64B8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0xD00000000000001CLL && a2 == 0x800000021FDFB220 || (sub_21FDF64B8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0xD00000000000001DLL && a2 == 0x800000021FDFB240 || (sub_21FDF64B8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (a1 == 0x44496E6F69676572 && a2 == 0xE900000000000073 || (sub_21FDF64B8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else if (a1 == 0x4465726F74537369 && a2 == 0xEF726573556F6D65 || (sub_21FDF64B8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 8;
  }
  else if (a1 == 0xD000000000000017 && a2 == 0x800000021FDFB260 || (sub_21FDF64B8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 9;
  }
  else if (a1 == 0xD000000000000014 && a2 == 0x800000021FDFB280 || (sub_21FDF64B8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 10;
  }
  else if (a1 == 0xD00000000000001CLL && a2 == 0x800000021FDFB2A0 || (sub_21FDF64B8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 11;
  }
  else if (a1 == 0xD000000000000018 && a2 == 0x800000021FDFB2C0 || (sub_21FDF64B8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 12;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x800000021FDFB2E0 || (sub_21FDF64B8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 13;
  }
  else if (a1 == 0xD000000000000012 && a2 == 0x800000021FDFB300)
  {
    swift_bridgeObjectRelease();
    return 14;
  }
  else
  {
    char v5 = sub_21FDF64B8();
    swift_bridgeObjectRelease();
    if (v5) {
      return 14;
    }
    else {
      return 15;
    }
  }
}

uint64_t sub_21FDEB1F8@<X0>(void *a1@<X0>, _DWORD *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EFCD78);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  char v8 = (char *)&v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_21FDECB94();
  sub_21FDF6508();
  if (v2)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  else
  {
    LOBYTE(v41) = 0;
    int v9 = sub_21FDF6408();
    LOBYTE(v41) = 1;
    uint64_t v10 = sub_21FDF6398();
    uint64_t v12 = v11;
    uint64_t v38 = v10;
    int v42 = v9;
    LOBYTE(v41) = 2;
    swift_bridgeObjectRetain();
    uint64_t v13 = sub_21FDF6398();
    uint64_t v15 = v14;
    uint64_t v37 = v13;
    char v43 = 3;
    sub_21FDECBE8();
    swift_bridgeObjectRetain();
    sub_21FDF63F8();
    int v36 = v41;
    LOBYTE(v41) = 4;
    uint64_t v34 = sub_21FDF63C8();
    v35 = a2;
    uint64_t v17 = v16;
    __swift_instantiateConcreteTypeFromMangledName(&qword_267EFCD90);
    char v43 = 5;
    sub_21FDECCE4(&qword_267EFCD98, &qword_267EFCD90);
    uint64_t v39 = v17;
    swift_bridgeObjectRetain();
    sub_21FDF63F8();
    uint64_t v18 = v41;
    __swift_instantiateConcreteTypeFromMangledName(&qword_267EFCDA0);
    char v43 = 6;
    sub_21FDECCE4(&qword_267EFCDA8, &qword_267EFCDA0);
    uint64_t v33 = v18;
    swift_bridgeObjectRetain();
    sub_21FDF63F8();
    uint64_t v19 = v41;
    __swift_instantiateConcreteTypeFromMangledName(&qword_267EFCDB0);
    char v43 = 7;
    sub_21FDECCE4(&qword_267EFCDB8, &qword_267EFCDB0);
    uint64_t v40 = v19;
    swift_bridgeObjectRetain();
    sub_21FDF63B8();
    uint64_t v20 = v41;
    LOBYTE(v41) = 8;
    swift_bridgeObjectRetain();
    int v32 = sub_21FDF63D8();
    LOBYTE(v41) = 9;
    int v31 = sub_21FDF63D8();
    LOBYTE(v41) = 10;
    int v30 = sub_21FDF63D8();
    LOBYTE(v41) = 11;
    int v29 = sub_21FDF63D8();
    LOBYTE(v41) = 12;
    int v28 = sub_21FDF63A8();
    LOBYTE(v41) = 13;
    int v27 = sub_21FDF63D8();
    char v43 = 14;
    sub_21FDECC3C();
    sub_21FDF63B8();
    v31 &= 1u;
    v32 &= 1u;
    v29 &= 1u;
    v30 &= 1u;
    LOBYTE(v19) = v27 & 1;
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    char v21 = v41;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    swift_bridgeObjectRelease();
    uint64_t v22 = v40;
    swift_bridgeObjectRelease();
    uint64_t v23 = v33;
    swift_bridgeObjectRelease();
    uint64_t v24 = v39;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t result = swift_bridgeObjectRelease();
    uint64_t v26 = v35;
    _DWORD *v35 = v42;
    *((void *)v26 + 1) = v38;
    *((void *)v26 + 2) = v12;
    *((void *)v26 + 3) = v37;
    *((void *)v26 + 4) = v15;
    *((unsigned char *)v26 + 40) = v36;
    *((void *)v26 + 6) = v34;
    *((void *)v26 + 7) = v24;
    *((void *)v26 + 8) = v23;
    *((void *)v26 + 9) = v22;
    *((void *)v26 + 10) = v20;
    *((unsigned char *)v26 + 88) = v32;
    *((unsigned char *)v26 + 89) = v31;
    *((unsigned char *)v26 + 90) = v30;
    *((unsigned char *)v26 + 91) = v29;
    *((unsigned char *)v26 + 92) = v28;
    *((unsigned char *)v26 + 93) = v19;
    *((unsigned char *)v26 + 94) = v21;
  }
  return result;
}

uint64_t sub_21FDEBA14(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x6F4D656369766564 && a2 == 0xEB000000006C6564;
  if (v2 || (sub_21FDF64B8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6C50656369766564 && a2 == 0xEE006D726F667461 || (sub_21FDF64B8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x800000021FDFB1E0 || (sub_21FDF64B8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x6F6973726556736FLL && a2 == 0xE90000000000006ELL || (sub_21FDF64B8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x656C646E7542736FLL && a2 == 0xEF6E6F6973726556)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else
  {
    char v6 = sub_21FDF64B8();
    swift_bridgeObjectRelease();
    if (v6) {
      return 4;
    }
    else {
      return 5;
    }
  }
}

uint64_t sub_21FDEBC98@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EFCD40);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  char v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_21FDEC9F0();
  sub_21FDF6508();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  char v30 = 0;
  uint64_t v9 = sub_21FDF63C8();
  uint64_t v11 = v10;
  char v28 = 1;
  sub_21FDECA44();
  swift_bridgeObjectRetain();
  sub_21FDF63F8();
  int v23 = v29;
  char v26 = 2;
  sub_21FDECA98();
  sub_21FDF63F8();
  int v22 = v27;
  char v25 = 3;
  uint64_t v20 = sub_21FDF63C8();
  uint64_t v21 = v12;
  char v24 = 4;
  swift_bridgeObjectRetain();
  uint64_t v13 = sub_21FDF63C8();
  uint64_t v15 = v14;
  uint64_t v16 = *(void (**)(char *, uint64_t))(v6 + 8);
  uint64_t v19 = v13;
  v16(v8, v5);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  swift_bridgeObjectRelease();
  uint64_t v17 = v21;
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)a2 = v9;
  *(void *)(a2 + 8) = v11;
  *(unsigned char *)(a2 + 16) = v23;
  *(unsigned char *)(a2 + 17) = v22;
  *(void *)(a2 + 24) = v20;
  *(void *)(a2 + 32) = v17;
  *(void *)(a2 + 40) = v19;
  *(void *)(a2 + 48) = v15;
  return result;
}

uint64_t sub_21FDEBFD8(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x444972657375 && a2 == 0xE600000000000000;
  if (v2 || (sub_21FDF64B8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x800000021FDFB320 || (sub_21FDF64B8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6570795472657375 && a2 == 0xE800000000000000 || (sub_21FDF64B8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x7261745372657375 && a2 == 0xED00006574614474 || (sub_21FDF64B8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x6B63617242656761 && a2 == 0xEA00000000007465 || (sub_21FDF64B8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0xD000000000000019 && a2 == 0x800000021FDFB340 || (sub_21FDF64B8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0x7265646E6567 && a2 == 0xE600000000000000 || (sub_21FDF64B8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (a1 == 0xD000000000000015 && a2 == 0x800000021FDFB360 || (sub_21FDF64B8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x800000021FDFB380)
  {
    swift_bridgeObjectRelease();
    return 8;
  }
  else
  {
    char v6 = sub_21FDF64B8();
    swift_bridgeObjectRelease();
    if (v6) {
      return 8;
    }
    else {
      return 9;
    }
  }
}

uint64_t sub_21FDEC384@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EFCE08);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  char v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_21FDECDFC();
  sub_21FDF6508();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  char v35 = 0;
  uint64_t v9 = sub_21FDF63C8();
  uint64_t v11 = v10;
  char v34 = 1;
  swift_bridgeObjectRetain();
  int v25 = sub_21FDF63A8();
  char v32 = 2;
  sub_21FDECE50();
  sub_21FDF63F8();
  int v24 = v33;
  char v31 = 3;
  uint64_t v23 = sub_21FDF6418();
  char v30 = 4;
  int v22 = sub_21FDF6408();
  char v29 = 5;
  sub_21FDF63E8();
  int v13 = v12;
  char v28 = 6;
  int v21 = sub_21FDF6408();
  char v27 = 7;
  sub_21FDF63E8();
  int v20 = v14;
  char v26 = 8;
  uint64_t v19 = sub_21FDF63C8();
  uint64_t v16 = v15;
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  swift_bridgeObjectRetain();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)a2 = v9;
  *(void *)(a2 + 8) = v11;
  *(unsigned char *)(a2 + 16) = v25;
  *(unsigned char *)(a2 + 17) = v24;
  *(void *)(a2 + 24) = v23;
  *(_DWORD *)(a2 + 32) = v22;
  *(_DWORD *)(a2 + 36) = v13;
  *(_DWORD *)(a2 + 40) = v21;
  *(_DWORD *)(a2 + 44) = v20;
  *(void *)(a2 + 48) = v19;
  *(void *)(a2 + 56) = v16;
  return result;
}

uint64_t sub_21FDEC700(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000012 && a2 == 0x800000021FDFB1C0)
  {
    swift_bridgeObjectRelease();
    char v2 = 0;
  }
  else
  {
    char v3 = sub_21FDF64B8();
    swift_bridgeObjectRelease();
    char v2 = v3 ^ 1;
  }
  return v2 & 1;
}

void *sub_21FDEC788(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EFCD18);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = &v9[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v7 = __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_21FDEC8F4();
  sub_21FDF6508();
  if (v1)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  else
  {
    sub_21FDEC948();
    sub_21FDF63F8();
    (*(void (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
    uint64_t v7 = (void *)v9[15];
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  return v7;
}

unint64_t sub_21FDEC8F4()
{
  unint64_t result = qword_267EFCD20;
  if (!qword_267EFCD20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EFCD20);
  }
  return result;
}

unint64_t sub_21FDEC948()
{
  unint64_t result = qword_267EFCD28;
  if (!qword_267EFCD28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EFCD28);
  }
  return result;
}

unint64_t sub_21FDEC99C()
{
  unint64_t result = qword_267EFCD38;
  if (!qword_267EFCD38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EFCD38);
  }
  return result;
}

unint64_t sub_21FDEC9F0()
{
  unint64_t result = qword_267EFCD48;
  if (!qword_267EFCD48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EFCD48);
  }
  return result;
}

unint64_t sub_21FDECA44()
{
  unint64_t result = qword_267EFCD50;
  if (!qword_267EFCD50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EFCD50);
  }
  return result;
}

unint64_t sub_21FDECA98()
{
  unint64_t result = qword_267EFCD58;
  if (!qword_267EFCD58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EFCD58);
  }
  return result;
}

unint64_t sub_21FDECAEC()
{
  unint64_t result = qword_267EFCD68;
  if (!qword_267EFCD68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EFCD68);
  }
  return result;
}

unint64_t sub_21FDECB40()
{
  unint64_t result = qword_267EFCD70;
  if (!qword_267EFCD70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EFCD70);
  }
  return result;
}

unint64_t sub_21FDECB94()
{
  unint64_t result = qword_267EFCD80;
  if (!qword_267EFCD80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EFCD80);
  }
  return result;
}

unint64_t sub_21FDECBE8()
{
  unint64_t result = qword_267EFCD88;
  if (!qword_267EFCD88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EFCD88);
  }
  return result;
}

unint64_t sub_21FDECC3C()
{
  unint64_t result = qword_267EFCDC0;
  if (!qword_267EFCDC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EFCDC0);
  }
  return result;
}

unint64_t sub_21FDECC90()
{
  unint64_t result = qword_267EFCDD0;
  if (!qword_267EFCDD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EFCDD0);
  }
  return result;
}

uint64_t sub_21FDECCE4(unint64_t *a1, uint64_t *a2)
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

uint64_t sub_21FDECD44(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

unint64_t sub_21FDECDA8()
{
  unint64_t result = qword_267EFCE00;
  if (!qword_267EFCE00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EFCE00);
  }
  return result;
}

unint64_t sub_21FDECDFC()
{
  unint64_t result = qword_267EFCE10;
  if (!qword_267EFCE10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EFCE10);
  }
  return result;
}

unint64_t sub_21FDECE50()
{
  unint64_t result = qword_267EFCE18;
  if (!qword_267EFCE18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EFCE18);
  }
  return result;
}

unint64_t sub_21FDECEA4()
{
  unint64_t result = qword_267EFCE28;
  if (!qword_267EFCE28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EFCE28);
  }
  return result;
}

unint64_t sub_21FDECEF8()
{
  unint64_t result = qword_267EFCE38;
  if (!qword_267EFCE38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EFCE38);
  }
  return result;
}

unint64_t sub_21FDECF4C()
{
  unint64_t result = qword_267EFCE48;
  if (!qword_267EFCE48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EFCE48);
  }
  return result;
}

unint64_t sub_21FDECFA0()
{
  unint64_t result = qword_267EFCE50;
  if (!qword_267EFCE50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EFCE50);
  }
  return result;
}

unint64_t sub_21FDECFF4()
{
  unint64_t result = qword_267EFCE58;
  if (!qword_267EFCE58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EFCE58);
  }
  return result;
}

uint64_t sub_21FDED048(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for NetworkEventData(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_21FDED0AC(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for NetworkEventData(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_21FDED108()
{
  unint64_t result = qword_267EFCE70;
  if (!qword_267EFCE70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EFCE70);
  }
  return result;
}

unint64_t sub_21FDED15C()
{
  unint64_t result = qword_267EFCE78;
  if (!qword_267EFCE78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EFCE78);
  }
  return result;
}

unint64_t sub_21FDED1B0()
{
  unint64_t result = qword_267EFCE80;
  if (!qword_267EFCE80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EFCE80);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for NetworkEventData.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF3) {
    goto LABEL_17;
  }
  if (a2 + 13 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 13) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 13;
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
      return (*a1 | (v4 << 8)) - 13;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 13;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0xE;
  int v8 = v6 - 14;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for NetworkEventData.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 13 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 13) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF3) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF2)
  {
    unsigned int v6 = ((a2 - 243) >> 8) + 1;
    *unint64_t result = a2 + 13;
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
        JUMPOUT(0x21FDED360);
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
          *unint64_t result = a2 + 13;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for NetworkEventData.CodingKeys()
{
  return &type metadata for NetworkEventData.CodingKeys;
}

uint64_t getEnumTagSinglePayload for UserData.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for UserData.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 8;
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
        JUMPOUT(0x21FDED4F8);
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
          *unint64_t result = a2 + 8;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for UserData.CodingKeys()
{
  return &type metadata for UserData.CodingKeys;
}

uint64_t getEnumTagSinglePayload for SessionData.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF2) {
    goto LABEL_17;
  }
  if (a2 + 14 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 14) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 14;
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
      return (*a1 | (v4 << 8)) - 14;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 14;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0xF;
  int v8 = v6 - 15;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for SessionData.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 14 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 14) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF2) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF1)
  {
    unsigned int v6 = ((a2 - 242) >> 8) + 1;
    *unint64_t result = a2 + 14;
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
        JUMPOUT(0x21FDED68CLL);
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
          *unint64_t result = a2 + 14;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SessionData.CodingKeys()
{
  return &type metadata for SessionData.CodingKeys;
}

ValueMetadata *type metadata accessor for DeviceData.CodingKeys()
{
  return &type metadata for DeviceData.CodingKeys;
}

uint64_t getEnumTagSinglePayload for ContentEnvironmentData.CodingKeys(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for ContentEnvironmentData.CodingKeys(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x21FDED7CCLL);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_21FDED7F4()
{
  return 0;
}

ValueMetadata *type metadata accessor for ContentEnvironmentData.CodingKeys()
{
  return &type metadata for ContentEnvironmentData.CodingKeys;
}

uint64_t getEnumTagSinglePayload for AppData.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for AppData.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 1;
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
        JUMPOUT(0x21FDED968);
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
          *unint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

uint64_t sub_21FDED990(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_21FDED998(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for AppData.CodingKeys()
{
  return &type metadata for AppData.CodingKeys;
}

ValueMetadata *type metadata accessor for ContentEnvironment()
{
  return &type metadata for ContentEnvironment;
}

ValueMetadata *type metadata accessor for OsInstallVariant()
{
  return &type metadata for OsInstallVariant;
}

uint64_t _s19NewsAnalyticsUpload18ContentEnvironmentOwet_0(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *_s19NewsAnalyticsUpload18ContentEnvironmentOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x21FDEDB38);
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

ValueMetadata *type metadata accessor for DevicePlatform()
{
  return &type metadata for DevicePlatform;
}

ValueMetadata *type metadata accessor for AggregateStateMode()
{
  return &type metadata for AggregateStateMode;
}

ValueMetadata *type metadata accessor for ICloudAccountState()
{
  return &type metadata for ICloudAccountState;
}

ValueMetadata *type metadata accessor for UserType()
{
  return &type metadata for UserType;
}

uint64_t _s19NewsAnalyticsUpload29CellularRadioAccessTechnologyOwet_0(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *_s19NewsAnalyticsUpload29CellularRadioAccessTechnologyOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x21FDEDCFCLL);
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

ValueMetadata *type metadata accessor for CellularRadioAccessTechnology()
{
  return &type metadata for CellularRadioAccessTechnology;
}

uint64_t getEnumTagSinglePayload for NetworkEventType(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xEE) {
    goto LABEL_17;
  }
  if (a2 + 18 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 18) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 18;
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
      return (*a1 | (v4 << 8)) - 18;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 18;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0x13;
  int v8 = v6 - 19;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for NetworkEventType(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 18 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 18) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xEE) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xED)
  {
    unsigned int v6 = ((a2 - 238) >> 8) + 1;
    *unint64_t result = a2 + 18;
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
        JUMPOUT(0x21FDEDE90);
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
          *unint64_t result = a2 + 18;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for NetworkEventType()
{
  return &type metadata for NetworkEventType;
}

uint64_t _s19NewsAnalyticsUpload16OsInstallVariantOwet_0(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *_s19NewsAnalyticsUpload16OsInstallVariantOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x21FDEE024);
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

unsigned char *sub_21FDEE04C(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for CacheState()
{
  return &type metadata for CacheState;
}

unint64_t sub_21FDEE068()
{
  unint64_t result = qword_267EFCE88;
  if (!qword_267EFCE88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EFCE88);
  }
  return result;
}

unint64_t sub_21FDEE0C0()
{
  unint64_t result = qword_267EFCE90;
  if (!qword_267EFCE90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EFCE90);
  }
  return result;
}

unint64_t sub_21FDEE118()
{
  unint64_t result = qword_267EFCE98;
  if (!qword_267EFCE98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EFCE98);
  }
  return result;
}

unint64_t sub_21FDEE170()
{
  unint64_t result = qword_267EFCEA0;
  if (!qword_267EFCEA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EFCEA0);
  }
  return result;
}

unint64_t sub_21FDEE1C8()
{
  unint64_t result = qword_267EFCEA8;
  if (!qword_267EFCEA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EFCEA8);
  }
  return result;
}

unint64_t sub_21FDEE220()
{
  unint64_t result = qword_267EFCEB0;
  if (!qword_267EFCEB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EFCEB0);
  }
  return result;
}

unint64_t sub_21FDEE278()
{
  unint64_t result = qword_267EFCEB8;
  if (!qword_267EFCEB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EFCEB8);
  }
  return result;
}

unint64_t sub_21FDEE2D0()
{
  unint64_t result = qword_267EFCEC0;
  if (!qword_267EFCEC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EFCEC0);
  }
  return result;
}

unint64_t sub_21FDEE328()
{
  unint64_t result = qword_267EFCEC8;
  if (!qword_267EFCEC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EFCEC8);
  }
  return result;
}

unint64_t sub_21FDEE380()
{
  unint64_t result = qword_267EFCED0;
  if (!qword_267EFCED0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EFCED0);
  }
  return result;
}

unint64_t sub_21FDEE3D8()
{
  unint64_t result = qword_267EFCED8;
  if (!qword_267EFCED8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EFCED8);
  }
  return result;
}

unint64_t sub_21FDEE430()
{
  unint64_t result = qword_267EFCEE0;
  if (!qword_267EFCEE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EFCEE0);
  }
  return result;
}

unint64_t sub_21FDEE488()
{
  unint64_t result = qword_267EFCEE8;
  if (!qword_267EFCEE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EFCEE8);
  }
  return result;
}

unint64_t sub_21FDEE4E0()
{
  unint64_t result = qword_267EFCEF0;
  if (!qword_267EFCEF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EFCEF0);
  }
  return result;
}

unint64_t sub_21FDEE538()
{
  unint64_t result = qword_267EFCEF8;
  if (!qword_267EFCEF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EFCEF8);
  }
  return result;
}

unint64_t sub_21FDEE590()
{
  unint64_t result = qword_267EFCF00;
  if (!qword_267EFCF00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EFCF00);
  }
  return result;
}

unint64_t sub_21FDEE5E8()
{
  unint64_t result = qword_267EFCF08;
  if (!qword_267EFCF08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EFCF08);
  }
  return result;
}

unint64_t sub_21FDEE640()
{
  unint64_t result = qword_267EFCF10;
  if (!qword_267EFCF10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EFCF10);
  }
  return result;
}

unint64_t sub_21FDEE698()
{
  unint64_t result = qword_267EFCF18;
  if (!qword_267EFCF18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EFCF18);
  }
  return result;
}

unint64_t sub_21FDEE6F0()
{
  unint64_t result = qword_267EFCF20;
  if (!qword_267EFCF20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EFCF20);
  }
  return result;
}

unint64_t sub_21FDEE748()
{
  unint64_t result = qword_267EFCF28;
  if (!qword_267EFCF28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EFCF28);
  }
  return result;
}

unint64_t sub_21FDEE7A0()
{
  unint64_t result = qword_267EFCF30;
  if (!qword_267EFCF30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EFCF30);
  }
  return result;
}

unint64_t sub_21FDEE7F8()
{
  unint64_t result = qword_267EFCF38;
  if (!qword_267EFCF38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EFCF38);
  }
  return result;
}

unint64_t sub_21FDEE850()
{
  unint64_t result = qword_267EFCF40;
  if (!qword_267EFCF40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EFCF40);
  }
  return result;
}

unint64_t sub_21FDEE8A8()
{
  unint64_t result = qword_267EFCF48;
  if (!qword_267EFCF48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EFCF48);
  }
  return result;
}

unint64_t sub_21FDEE900()
{
  unint64_t result = qword_267EFCF50;
  if (!qword_267EFCF50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EFCF50);
  }
  return result;
}

unint64_t sub_21FDEE958()
{
  unint64_t result = qword_267EFCF58;
  if (!qword_267EFCF58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EFCF58);
  }
  return result;
}

unint64_t sub_21FDEE9AC()
{
  unint64_t result = qword_267EFCF60;
  if (!qword_267EFCF60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EFCF60);
  }
  return result;
}

unint64_t sub_21FDEEA00()
{
  unint64_t result = qword_267EFCF68;
  if (!qword_267EFCF68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EFCF68);
  }
  return result;
}

unint64_t sub_21FDEEA54()
{
  unint64_t result = qword_267EFCF70;
  if (!qword_267EFCF70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EFCF70);
  }
  return result;
}

unint64_t sub_21FDEEAA8()
{
  unint64_t result = qword_267EFCF78;
  if (!qword_267EFCF78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EFCF78);
  }
  return result;
}

unint64_t sub_21FDEEAFC()
{
  unint64_t result = qword_267EFCF80;
  if (!qword_267EFCF80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EFCF80);
  }
  return result;
}

unint64_t sub_21FDEEB50()
{
  unint64_t result = qword_267EFCF88;
  if (!qword_267EFCF88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EFCF88);
  }
  return result;
}

uint64_t sub_21FDEEBA4()
{
  unint64_t v0 = sub_21FDF6388();
  swift_bridgeObjectRelease();
  if (v0 >= 4) {
    return 4;
  }
  else {
    return v0;
  }
}

uint64_t sub_21FDEEBEC(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x6D69547472617473 && a2 == 0xE900000000000065;
  if (v2 || (sub_21FDF64B8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x7461727544736E64 && a2 == 0xEB000000006E6F69 || (sub_21FDF64B8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x447463656E6E6F63 && a2 == 0xEF6E6F6974617275 || (sub_21FDF64B8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x4474736575716572 && a2 == 0xEF6E6F6974617275 || (sub_21FDF64B8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x800000021FDFB3A0 || (sub_21FDF64B8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x65736E6F70736572 && a2 == 0xEC000000657A6953 || (sub_21FDF64B8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0x6174536568636163 && a2 == 0xEA00000000006574 || (sub_21FDF64B8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (a1 == 0x6F43737574617473 && a2 == 0xEA00000000006564 || (sub_21FDF64B8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else if (a1 == 0x646F43726F727265 && a2 == 0xE900000000000065 || (sub_21FDF64B8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 8;
  }
  else if (a1 == 0x707954746E657665 && a2 == 0xE900000000000065 || (sub_21FDF64B8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 9;
  }
  else if (a1 == 0xD000000000000016 && a2 == 0x800000021FDFB3C0 || (sub_21FDF64B8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 10;
  }
  else if (a1 == 0xD00000000000001DLL && a2 == 0x800000021FDFB3E0 || (sub_21FDF64B8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 11;
  }
  else if (a1 == 0x69646E6F70736572 && a2 == 0xED0000706F50676ELL || (sub_21FDF64B8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 12;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x800000021FDFB400)
  {
    swift_bridgeObjectRelease();
    return 13;
  }
  else
  {
    char v6 = sub_21FDF64B8();
    swift_bridgeObjectRelease();
    if (v6) {
      return 13;
    }
    else {
      return 14;
    }
  }
}

unint64_t sub_21FDEF220()
{
  unint64_t result = qword_267EFCF90;
  if (!qword_267EFCF90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EFCF90);
  }
  return result;
}

unint64_t sub_21FDEF274()
{
  unint64_t result = qword_267EFCF98;
  if (!qword_267EFCF98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EFCF98);
  }
  return result;
}

unint64_t sub_21FDEF2C8()
{
  unint64_t result = qword_267EFCFA0;
  if (!qword_267EFCFA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EFCFA0);
  }
  return result;
}

uint64_t sub_21FDEF31C()
{
  unint64_t v0 = sub_21FDF64C8();
  swift_bridgeObjectRelease();
  if (v0 >= 0x13) {
    return 19;
  }
  else {
    return v0;
  }
}

uint64_t sub_21FDEF370()
{
  unint64_t v0 = sub_21FDF6388();
  swift_bridgeObjectRelease();
  if (v0 >= 3) {
    return 3;
  }
  else {
    return v0;
  }
}

uint64_t sub_21FDEF3B8()
{
  unint64_t v0 = sub_21FDF6388();
  swift_bridgeObjectRelease();
  if (v0 >= 5) {
    return 5;
  }
  else {
    return v0;
  }
}

uint64_t TelemetryUploader.uploadEnvelopes(_:completion:)(unint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v88 = a3;
  uint64_t v87 = a2;
  unint64_t v4 = sub_21FDF6258();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  v91 = (char *)&v86 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_21FDF6278();
  uint64_t v90 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  v89 = (char *)&v86 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v113 = sub_21FDF5E98();
  uint64_t v9 = *(void *)(v113 - 8);
  MEMORY[0x270FA5388](v113);
  v107 = (char *)&v86 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v106 = sub_21FDF6188();
  uint64_t v11 = *(char **)(v106 - 8);
  MEMORY[0x270FA5388](v106);
  v105 = (char *)&v86 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_21FDF5EC8();
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  uint64_t v16 = (char *)&v86 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21FDF5EB8();
  uint64_t v96 = sub_21FDF5EA8();
  uint64_t v95 = v17;
  uint64_t v18 = *(void (**)(char *, uint64_t))(v14 + 8);
  v102 = v16;
  uint64_t v104 = v13;
  uint64_t v103 = v14 + 8;
  v101 = v18;
  v18(v16, v13);
  uint64_t v19 = (void *)*MEMORY[0x263F58EF0];
  uint64_t v119 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EFCFA8);
  int v20 = (_OWORD *)swift_allocObject();
  v20[1] = xmmword_21FDF8910;
  unint64_t v21 = a1 >> 62;
  unint64_t v114 = a1;
  if (a1 >> 62)
  {
LABEL_39:
    id v85 = v19;
    swift_bridgeObjectRetain();
    uint64_t v22 = sub_21FDF6378();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v22 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    id v23 = v19;
  }
  uint64_t v24 = MEMORY[0x263F8D750];
  *((void *)v20 + 7) = MEMORY[0x263F8D6C8];
  *((void *)v20 + 8) = v24;
  *((void *)v20 + 4) = v22;
  *((void *)v20 + 12) = MEMORY[0x263F8D310];
  unint64_t v109 = sub_21FDF022C();
  *((void *)v20 + 13) = v109;
  uint64_t v25 = v95;
  *((void *)v20 + 9) = v96;
  *((void *)v20 + 10) = v25;
  swift_bridgeObjectRetain();
  sub_21FDF6318();
  sub_21FDF6248();

  swift_bridgeObjectRelease();
  dispatch_group_t v110 = dispatch_group_create();
  unint64_t v94 = v4;
  uint64_t v93 = v5;
  uint64_t v92 = v7;
  if (v21)
  {
    unint64_t v21 = v114;
    swift_bridgeObjectRetain();
    uint64_t v26 = sub_21FDF6378();
    if (!v26) {
      goto LABEL_35;
    }
    goto LABEL_7;
  }
  unint64_t v21 = v114;
  uint64_t v26 = *(void *)((v114 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (v26)
  {
LABEL_7:
    unint64_t v4 = v21 & 0xC000000000000001;
    v100 = (void (**)(char *, void, uint64_t))(v11 + 104);
    uint64_t v99 = OBJC_IVAR___NDAnalyticsTelemetryUploader_sessionManager;
    v112 = (void (**)(char *, uint64_t))(v9 + 8);
    v98 = (void (**)(char *, uint64_t))(v11 + 8);
    unsigned int v97 = *MEMORY[0x263F24E58];
    uint64_t v7 = 4;
    long long v118 = xmmword_21FDF7410;
    unint64_t v116 = v21 & 0xC000000000000001;
    uint64_t v117 = v26;
    while (1)
    {
      uint64_t v19 = (void *)(v7 - 4);
      if (v4) {
        char v29 = (char *)MEMORY[0x223C5F110](v7 - 4, v21);
      }
      else {
        char v29 = (char *)*(id *)(v21 + 8 * v7);
      }
      uint64_t v11 = v29;
      uint64_t v5 = v7 - 3;
      if (__OFADD__(v19, 1))
      {
        __break(1u);
        goto LABEL_39;
      }
      if (objc_msgSend(v29, sel_contentType) == 2) {
        break;
      }
      id v27 = (id)*MEMORY[0x263F58EF0];
      int v20 = (_OWORD *)sub_21FDF6308();
      uint64_t v9 = swift_allocObject();
      *(_OWORD *)(v9 + 16) = v118;
      unsigned int v28 = objc_msgSend(v11, sel_contentType);
      *(void *)(v9 + 56) = MEMORY[0x263F8E548];
      *(void *)(v9 + 64) = MEMORY[0x263F8E5B0];
      *(_DWORD *)(v9 + 32) = v28;
      sub_21FDF6248();

      swift_bridgeObjectRelease();
LABEL_9:
      ++v7;
      if (v5 == v26) {
        goto LABEL_35;
      }
    }
    id v30 = objc_msgSend(v11, sel_content);
    if (!v30) {
      goto LABEL_42;
    }
    char v31 = v30;
    int v20 = objc_msgSend(v30, sel_fc_zlibInflate);

    if (v20)
    {
      uint64_t v9 = sub_21FDF5E68();
      unint64_t v33 = v32;

      char v34 = (void *)sub_21FDF5E58();
      sub_21FDF15B4(v9, v33);
    }
    else
    {
      char v34 = 0;
    }
    id v35 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F5A328]), sel_initWithData_, v34);

    if (!v35)
    {
      int v20 = (id)*MEMORY[0x263F58EF0];
      uint64_t v9 = sub_21FDF6308();
      uint64_t v56 = swift_allocObject();
      *(_OWORD *)(v56 + 16) = v118;
      id v57 = objc_msgSend(v11, sel_content);
      if (!v57) {
        goto LABEL_43;
      }
      v58 = v57;
      uint64_t v59 = sub_21FDF5E68();
      unint64_t v61 = v60;

      switch(v61 >> 62)
      {
        case 1uLL:
          sub_21FDF15B4(v59, v61);
          LODWORD(v62) = HIDWORD(v59) - v59;
          if (__OFSUB__(HIDWORD(v59), v59))
          {
            __break(1u);
LABEL_41:
            __break(1u);
LABEL_42:
            __break(1u);
LABEL_43:
            __break(1u);
            JUMPOUT(0x21FDF021CLL);
          }
          uint64_t v62 = (int)v62;
LABEL_31:
          unint64_t v21 = v114;
LABEL_33:
          *(void *)(v56 + 56) = MEMORY[0x263F8D6C8];
          *(void *)(v56 + 64) = MEMORY[0x263F8D750];
          *(void *)(v56 + 32) = v62;
          sub_21FDF6248();

          swift_bridgeObjectRelease();
          break;
        case 2uLL:
          uint64_t v65 = *(void *)(v59 + 16);
          uint64_t v64 = *(void *)(v59 + 24);
          sub_21FDF15B4(v59, v61);
          uint64_t v62 = v64 - v65;
          if (!__OFSUB__(v64, v65)) {
            goto LABEL_31;
          }
          goto LABEL_41;
        case 3uLL:
          sub_21FDF15B4(v59, v61);
          uint64_t v62 = 0;
          goto LABEL_33;
        default:
          sub_21FDF15B4(v59, v61);
          uint64_t v62 = BYTE6(v61);
          goto LABEL_33;
      }
      goto LABEL_34;
    }
    id v36 = objc_msgSend(v35, sel_networkEventGroups);
    if (v36)
    {
      uint64_t v37 = v36;
      if (objc_msgSend(v36, sel_count))
      {
        uint64_t v38 = v102;
        sub_21FDF5EB8();
        uint64_t v39 = sub_21FDF5EA8();
        uint64_t v115 = v39;
        uint64_t v41 = v40;
        v101(v38, v104);
        int v42 = (void *)*MEMORY[0x263F58EF0];
        uint64_t v43 = swift_allocObject();
        id v111 = v37;
        *(_OWORD *)(v43 + 16) = v118;
        unint64_t v44 = v109;
        *(void *)(v43 + 56) = MEMORY[0x263F8D310];
        *(void *)(v43 + 64) = v44;
        *(void *)(v43 + 32) = v39;
        *(void *)(v43 + 40) = v41;
        id v45 = v42;
        swift_bridgeObjectRetain();
        sub_21FDF6318();
        sub_21FDF6248();

        swift_bridgeObjectRelease();
        uint64_t v46 = *(void *)(v108 + v99);
        v47 = v105;
        uint64_t v48 = v106;
        (*v100)(v105, v97, v106);
        v49 = v107;
        sub_21FDF5E88();
        sub_21FDF6028();
        v50 = *v112;
        (*v112)(v49, v113);
        (*v98)(v47, v48);
        *(void *)(swift_allocObject() + 16) = v35;
        id v51 = v35;
        sub_21FDF6008();
        swift_release();
        uint64_t v9 = v46;
        sub_21FDF6048();
        *(void *)(swift_allocObject() + 16) = v51;
        id v52 = v51;
        sub_21FDF6198();
        swift_release();
        swift_release();
        dispatch_group_t v53 = v110;
        dispatch_group_enter(v110);
        v54 = (void *)swift_allocObject();
        v54[2] = v115;
        v54[3] = v41;
        v54[4] = v53;
        v55 = v53;
        sub_21FDF5E88();
        int v20 = (_OWORD *)v9;
        sub_21FDF6018();

        unint64_t v21 = v114;
        swift_release();
        v50(v49, v113);
LABEL_34:
        unint64_t v4 = v116;
        uint64_t v26 = v117;
        goto LABEL_9;
      }
    }
    id v63 = (id)*MEMORY[0x263F58EF0];
    sub_21FDF6318();
    sub_21FDF6248();

    goto LABEL_34;
  }
LABEL_35:
  swift_bridgeObjectRelease();
  dispatch_group_t v66 = v110;
  int IsEmpty = FCDispatchGroupIsEmpty();
  v68 = (void *)*MEMORY[0x263F58EF0];
  uint64_t v69 = swift_allocObject();
  *(_OWORD *)(v69 + 16) = xmmword_21FDF7410;
  unint64_t v70 = v109;
  *(void *)(v69 + 56) = MEMORY[0x263F8D310];
  *(void *)(v69 + 64) = v70;
  uint64_t v71 = v96;
  uint64_t v72 = v95;
  *(void *)(v69 + 32) = v96;
  *(void *)(v69 + 40) = v72;
  if (IsEmpty)
  {
    id v73 = v68;
    sub_21FDF6318();
    sub_21FDF6248();

    return swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v75 = MEMORY[0x263F8EE78];
    swift_bridgeObjectRetain();
    id v76 = v68;
    sub_21FDF6318();
    sub_21FDF6248();

    swift_bridgeObjectRelease();
    sub_21FDF264C(0, &qword_267EFCFC0);
    v77 = (void *)sub_21FDF6338();
    v78 = (void *)swift_allocObject();
    v78[2] = v71;
    v78[3] = v72;
    uint64_t v79 = v87;
    uint64_t v80 = v88;
    v78[4] = v87;
    v78[5] = v80;
    aBlock[4] = sub_21FDF153C;
    aBlock[5] = v78;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_21FDF1548;
    aBlock[3] = &block_descriptor;
    v81 = _Block_copy(aBlock);
    sub_21FDF15A4(v79);
    v82 = v89;
    sub_21FDF6268();
    uint64_t v120 = v75;
    sub_21FDF25A4(&qword_267EFCFC8, MEMORY[0x263F8F030]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_267EFCFD0);
    sub_21FDF2688(&qword_267EFCFD8, &qword_267EFCFD0);
    v83 = v91;
    unint64_t v84 = v94;
    sub_21FDF6348();
    sub_21FDF6328();
    _Block_release(v81);

    (*(void (**)(char *, unint64_t))(v93 + 8))(v83, v84);
    (*(void (**)(char *, uint64_t))(v90 + 8))(v82, v92);
    return swift_release();
  }
}

unint64_t sub_21FDF022C()
{
  unint64_t result = qword_267EFCFB0;
  if (!qword_267EFCFB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EFCFB0);
  }
  return result;
}

id sub_21FDF0280(uint64_t a1)
{
  BOOL v2 = v1;
  uint64_t v78 = a1;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EFD028);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v55 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EFD030);
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v55 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v69 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EFD038);
  uint64_t v68 = *(void *)(v69 - 8);
  MEMORY[0x270FA5388](v69);
  v67 = (char *)&v55 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v66 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EFD040);
  uint64_t v65 = *(void *)(v66 - 8);
  MEMORY[0x270FA5388](v66);
  uint64_t v64 = (char *)&v55 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v63 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EFD048);
  uint64_t v13 = *(void *)(v63 - 8);
  MEMORY[0x270FA5388](v63);
  uint64_t v15 = (char *)&v55 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  id result = objc_msgSend(v2, sel_appVersion);
  if (!result)
  {
    __break(1u);
    goto LABEL_9;
  }
  uint64_t v17 = result;
  unint64_t v60 = v10;
  uint64_t v61 = v8;
  uint64_t v62 = v7;
  uint64_t v56 = v6;
  uint64_t v57 = v4;
  uint64_t v58 = v3;
  uint64_t v18 = sub_21FDF6298();
  uint64_t v20 = v19;

  id v74 = v2;
  id result = objc_msgSend(v2, sel_appBuildNumber);
  if (!result)
  {
LABEL_9:
    __break(1u);
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  unint64_t v21 = result;
  uint64_t v22 = sub_21FDF6298();
  uint64_t v24 = v23;

  uint64_t v81 = v18;
  uint64_t v82 = v20;
  uint64_t v83 = v22;
  uint64_t v84 = v24;
  sub_21FDF26CC();
  sub_21FDF5F38();
  uint64_t v77 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EFCFF0);
  uint64_t v25 = sub_21FDF5FB8();
  uint64_t v26 = *(unsigned __int8 *)(*(void *)(v25 - 8) + 80);
  uint64_t v27 = *(void *)(v25 - 8);
  uint64_t v80 = ((v26 + 32) & ~v26) + *(void *)(v27 + 72);
  uint64_t v28 = (v26 + 32) & ~v26;
  uint64_t v71 = v28;
  uint64_t v75 = v26 | 7;
  uint64_t v29 = swift_allocObject();
  long long v79 = xmmword_21FDF7410;
  *(_OWORD *)(v29 + 16) = xmmword_21FDF7410;
  uint64_t v30 = *MEMORY[0x263F24D40];
  id v73 = *(void (**)(uint64_t, uint64_t, uint64_t))(v27 + 104);
  unsigned int v76 = v30;
  uint64_t v70 = v25;
  v73(v29 + v28, v30, v25);
  uint64_t v59 = v27 + 104;
  v55 = "or group type %d";
  unint64_t v72 = 0x800000021FDFB790;
  sub_21FDF60A8();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v63);
  unsigned int v31 = objc_msgSend(v74, sel_contentEnvironment);
  unsigned int v32 = 0x1020300u >> (8 * v31);
  if (v31 >= 4) {
    LOBYTE(v32) = 0;
  }
  LOBYTE(v81) = v32;
  sub_21FDF2720();
  unint64_t v33 = v64;
  sub_21FDF5F38();
  uint64_t v34 = swift_allocObject();
  *(_OWORD *)(v34 + 16) = v79;
  uint64_t v35 = v71;
  id v36 = v73;
  v73(v34 + v71, v30, v25);
  sub_21FDF60A8();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v65 + 8))(v33, v66);
  id v37 = v74;
  sub_21FDF192C((uint64_t)&v81);
  sub_21FDF2774();
  uint64_t v38 = v67;
  sub_21FDF5F38();
  uint64_t v39 = swift_allocObject();
  *(_OWORD *)(v39 + 16) = v79;
  uint64_t v40 = v70;
  v36(v39 + v35, v76, v70);
  sub_21FDF60A8();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v68 + 8))(v38, v69);
  uint64_t v41 = v37;
  sub_21FDF1A14((uint64_t)&v81);
  sub_21FDF27C8();
  int v42 = v60;
  sub_21FDF5F38();
  uint64_t v43 = swift_allocObject();
  *(_OWORD *)(v43 + 16) = v79;
  unint64_t v44 = v73;
  v73(v43 + v35, v76, v40);
  sub_21FDF60A8();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v61 + 8))(v42, v62);
  id result = objc_msgSend(v37, sel_userId);
  if (!result) {
    goto LABEL_10;
  }
  id v45 = result;
  uint64_t v46 = sub_21FDF6298();
  uint64_t v48 = v47;

  id result = objc_msgSend(v41, sel_userStorefrontId);
  if (result)
  {
    v49 = result;
    uint64_t v50 = sub_21FDF6298();
    uint64_t v52 = v51;

    uint64_t v81 = v46;
    uint64_t v82 = v48;
    LOWORD(v83) = 2;
    uint64_t v84 = 0;
    uint64_t v85 = 0;
    uint64_t v86 = 0;
    uint64_t v87 = v50;
    uint64_t v88 = v52;
    sub_21FDF281C();
    dispatch_group_t v53 = v56;
    sub_21FDF5F38();
    uint64_t v54 = swift_allocObject();
    *(_OWORD *)(v54 + 16) = v79;
    v44(v54 + v71, v76, v70);
    sub_21FDF60A8();
    swift_bridgeObjectRelease();
    return (id)(*(uint64_t (**)(char *, uint64_t))(v57 + 8))(v53, v58);
  }
LABEL_11:
  __break(1u);
  return result;
}

void sub_21FDF0BE8(uint64_t a1)
{
  uint64_t v47 = a1;
  uint64_t v46 = type metadata accessor for NetworkEventData(0);
  MEMORY[0x270FA5388](v46);
  uint64_t v45 = (uint64_t)&v32 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v3 = objc_msgSend(v1, sel_networkEventGroups);
  if (!v3) {
    goto LABEL_29;
  }
  uint64_t v4 = v3;
  if (!objc_msgSend(v3, sel_count))
  {

LABEL_29:
    id v50 = (id)*MEMORY[0x263F58EF0];
    sub_21FDF6318();
    sub_21FDF6248();
LABEL_30:
    id v30 = v50;

    return;
  }
  *(void *)&v51[0] = 0;
  sub_21FDF264C(0, &qword_267EFCFE8);
  id v5 = v4;
  sub_21FDF62D8();

  uint64_t v6 = (void **)MEMORY[0x263F58EF0];
  if (!*(void *)&v51[0])
  {
    id v50 = (id)*MEMORY[0x263F58EF0];
    sub_21FDF6308();
    sub_21FDF6248();

    goto LABEL_30;
  }
  id v7 = (id)*MEMORY[0x263F58EF0];
  unint64_t v35 = *(void *)&v51[0];
  uint64_t v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EFCFA8);
  uint64_t v8 = swift_allocObject();
  unint64_t v9 = v35;
  long long v44 = xmmword_21FDF7410;
  *(_OWORD *)(v8 + 16) = xmmword_21FDF7410;
  unint64_t v10 = v9 >> 62;
  if (v9 >> 62) {
    goto LABEL_42;
  }
  uint64_t v11 = *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10);
  id v12 = v7;
LABEL_6:
  uint64_t v13 = MEMORY[0x263F8D750];
  *(void *)(v8 + 56) = MEMORY[0x263F8D6C8];
  *(void *)(v8 + 64) = v13;
  *(void *)(v8 + 32) = v11;
  sub_21FDF6318();
  sub_21FDF6248();

  swift_bridgeObjectRelease();
  if (v10)
  {
    swift_bridgeObjectRetain();
    id v7 = (id)sub_21FDF6378();
    swift_bridgeObjectRelease();
    if (v7) {
      goto LABEL_8;
    }
  }
  else
  {
    id v7 = *(id *)((v35 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v7)
    {
LABEL_8:
      unint64_t v10 = 0;
      unint64_t v39 = v35 & 0xC000000000000001;
      uint64_t v34 = v35 & 0xFFFFFFFFFFFFFF8;
      unint64_t v33 = v35 + 32;
      unsigned int v43 = *MEMORY[0x263F24D48];
      long long v38 = xmmword_21FDF8910;
      unint64_t v42 = 0x800000021FDFB790;
      id v37 = v5;
      id v36 = v7;
      while (1)
      {
        if (v39)
        {
          id v14 = (id)MEMORY[0x223C5F110](v10, v35);
        }
        else
        {
          if (v10 >= *(void *)(v34 + 16)) {
            goto LABEL_41;
          }
          id v14 = *(id *)(v33 + 8 * v10);
        }
        id v50 = v14;
        if (__OFADD__(v10++, 1))
        {
          __break(1u);
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
LABEL_42:
          id v31 = v7;
          swift_bridgeObjectRetain();
          uint64_t v11 = sub_21FDF6378();
          swift_bridgeObjectRelease();
          goto LABEL_6;
        }
        id v41 = (id)v10;
        uint64_t v16 = *v6;
        uint64_t v8 = swift_allocObject();
        *(_OWORD *)(v8 + 16) = v38;
        id v17 = v16;
        unint64_t v18 = sub_21FDF1B18();
        if (v18 >> 62) {
          uint64_t v6 = (void **)sub_21FDF6378();
        }
        else {
          uint64_t v6 = *(void ***)((v18 & 0xFFFFFFFFFFFFFF8) + 0x10);
        }
        swift_bridgeObjectRelease();
        *(void *)(v8 + 56) = MEMORY[0x263F8D6C8];
        *(void *)(v8 + 64) = MEMORY[0x263F8D750];
        *(void *)(v8 + 32) = v6;
        id v7 = v50;
        unsigned int v19 = objc_msgSend(v50, sel_eventType);
        *(void *)(v8 + 96) = MEMORY[0x263F8E548];
        *(void *)(v8 + 104) = MEMORY[0x263F8E5B0];
        *(_DWORD *)(v8 + 72) = v19;
        sub_21FDF6318();
        sub_21FDF6248();

        swift_bridgeObjectRelease();
        unint64_t v20 = sub_21FDF1B18();
        unint64_t v10 = v20;
        if (v20 >> 62)
        {
          uint64_t v21 = sub_21FDF6378();
          if (!v21) {
            goto LABEL_9;
          }
        }
        else
        {
          uint64_t v21 = *(void *)((v20 & 0xFFFFFFFFFFFFFF8) + 0x10);
          if (!v21) {
            goto LABEL_9;
          }
        }
        type metadata accessor for TelemetryEvent(0);
        if (v21 < 1) {
          goto LABEL_40;
        }
        uint64_t v8 = 0;
        unint64_t v48 = v10 & 0xC000000000000001;
        unint64_t v49 = v10;
        do
        {
          if (v48) {
            id v22 = (id)MEMORY[0x223C5F110](v8, v10);
          }
          else {
            id v22 = *(id *)(v10 + 8 * v8 + 32);
          }
          ++v8;
          id v23 = v22;
          id v24 = v50;
          uint64_t v25 = v45;
          sub_21FDF1C24(v23, v24, v45);
          __swift_instantiateConcreteTypeFromMangledName(&qword_267EFCFF0);
          uint64_t v26 = sub_21FDF5FB8();
          uint64_t v27 = *(void *)(v26 - 8);
          unint64_t v28 = (*(unsigned __int8 *)(v27 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v27 + 80);
          uint64_t v29 = swift_allocObject();
          *(_OWORD *)(v29 + 16) = v44;
          (*(void (**)(unint64_t, void, uint64_t))(v27 + 104))(v29 + v28, v43, v26);
          sub_21FDF25A4(&qword_267EFCFF8, (void (*)(uint64_t))type metadata accessor for NetworkEventData);
          sub_21FDF5F48();
          swift_bridgeObjectRelease();
          sub_21FDED0AC(v25);
          sub_21FDF25A4(&qword_267EFD000, (void (*)(uint64_t))type metadata accessor for TelemetryEvent);
          memset(v51, 0, 32);
          sub_21FDF5F58();

          sub_21FDF25EC((uint64_t)v51);
          unint64_t v10 = v49;
        }
        while (v21 != v8);
LABEL_9:

        swift_bridgeObjectRelease();
        id v7 = v36;
        unint64_t v10 = (unint64_t)v41;
        id v5 = v37;
        uint64_t v6 = (void **)MEMORY[0x263F58EF0];
        if (v41 == v36)
        {

          swift_bridgeObjectRelease();
          return;
        }
      }
    }
  }

  swift_bridgeObjectRelease();
}

void sub_21FDF1338(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v6 = (void *)*MEMORY[0x263F58EF0];
  __swift_instantiateConcreteTypeFromMangledName(&qword_267EFCFA8);
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_21FDF7410;
  *(void *)(v7 + 56) = MEMORY[0x263F8D310];
  *(void *)(v7 + 64) = sub_21FDF022C();
  *(void *)(v7 + 32) = a1;
  *(void *)(v7 + 40) = a2;
  id v8 = v6;
  swift_bridgeObjectRetain();
  sub_21FDF6318();
  sub_21FDF6248();

  swift_bridgeObjectRelease();

  dispatch_group_leave(a3);
}

uint64_t sub_21FDF1418(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v6 = (void *)*MEMORY[0x263F58EF0];
  __swift_instantiateConcreteTypeFromMangledName(&qword_267EFCFA8);
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_21FDF7410;
  *(void *)(v7 + 56) = MEMORY[0x263F8D310];
  *(void *)(v7 + 64) = sub_21FDF022C();
  *(void *)(v7 + 32) = a1;
  *(void *)(v7 + 40) = a2;
  id v8 = v6;
  swift_bridgeObjectRetain();
  sub_21FDF6318();
  sub_21FDF6248();

  uint64_t result = swift_bridgeObjectRelease();
  if (a3) {
    return a3(result);
  }
  return result;
}

uint64_t sub_21FDF14F4()
{
  swift_bridgeObjectRelease();
  if (*(void *)(v0 + 32)) {
    swift_release();
  }

  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_21FDF153C()
{
  return sub_21FDF1418(*(void *)(v0 + 16), *(void *)(v0 + 24), *(uint64_t (**)(uint64_t))(v0 + 32));
}

uint64_t sub_21FDF1548(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
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

uint64_t sub_21FDF15A4(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_21FDF15B4(uint64_t a1, unint64_t a2)
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

uint64_t sub_21FDF160C()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

id sub_21FDF1644(uint64_t a1)
{
  return sub_21FDF0280(a1);
}

void sub_21FDF1668(uint64_t a1)
{
}

uint64_t sub_21FDF168C()
{
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

void sub_21FDF16CC()
{
  sub_21FDF1338(*(void *)(v0 + 16), *(void *)(v0 + 24), *(NSObject **)(v0 + 32));
}

id TelemetryUploader.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

void TelemetryUploader.init()()
{
}

id TelemetryUploader.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for TelemetryUploader()
{
  return self;
}

uint64_t method lookup function for TelemetryUploader(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for TelemetryUploader);
}

uint64_t sub_21FDF18D4(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_21FDF18E4()
{
  _Block_release(*(const void **)(v0 + 16));

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_21FDF191C()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

void sub_21FDF192C(uint64_t a1@<X8>)
{
  objc_super v2 = v1;
  id v4 = objc_msgSend(v1, sel_deviceModel);
  if (!v4)
  {
    __break(1u);
    goto LABEL_8;
  }
  id v5 = v4;
  uint64_t v6 = sub_21FDF6298();
  uint64_t v8 = v7;

  char v9 = sub_21FDF1F28();
  unsigned int v10 = objc_msgSend(v2, sel_osInstallVariant);
  id v11 = objc_msgSend(v2, sel_osVersion);
  if (!v11)
  {
LABEL_8:
    __break(1u);
    return;
  }
  id v12 = v11;
  if (v10 == 2) {
    char v13 = 2;
  }
  else {
    char v13 = v10 == 1;
  }
  uint64_t v14 = sub_21FDF6298();
  uint64_t v16 = v15;

  *(void *)a1 = v6;
  *(void *)(a1 + 8) = v8;
  *(unsigned char *)(a1 + 16) = v9;
  *(unsigned char *)(a1 + 17) = v13;
  *(void *)(a1 + 24) = v14;
  *(void *)(a1 + 32) = v16;
  *(void *)(a1 + 40) = 0;
  *(void *)(a1 + 48) = 0xE000000000000000;
}

void sub_21FDF1A14(uint64_t a1@<X8>)
{
  objc_super v2 = v1;
  id v4 = objc_msgSend(v1, sel_languageCode);
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = sub_21FDF6298();
    uint64_t v8 = v7;
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v8 = 0;
  }
  id v9 = objc_msgSend(v2, sel_countryCode);
  if (v9)
  {
    unsigned int v10 = v9;
    uint64_t v11 = sub_21FDF6298();
    uint64_t v13 = v12;
  }
  else
  {
    uint64_t v11 = 0;
    uint64_t v13 = 0;
  }
  *(_DWORD *)a1 = 0;
  *(void *)(a1 + 8) = v6;
  *(void *)(a1 + 16) = v8;
  *(void *)(a1 + 24) = v11;
  *(void *)(a1 + 32) = v13;
  *(unsigned char *)(a1 + 40) = 0;
  strcpy((char *)(a1 + 48), "com.apple.news");
  *(unsigned char *)(a1 + 63) = -18;
  uint64_t v14 = MEMORY[0x263F8EE78];
  *(void *)(a1 + 64) = MEMORY[0x263F8EE78];
  *(void *)(a1 + 72) = v14;
  *(void *)(a1 + 80) = 0;
  *(_DWORD *)(a1 + 88) = 0;
  *(_WORD *)(a1 + 92) = 2;
  *(unsigned char *)(a1 + 94) = 3;
}

uint64_t sub_21FDF1B18()
{
  id v1 = objc_msgSend(v0, sel_successes);
  if (v1)
  {
    objc_super v2 = v1;
    sub_21FDF264C(0, &qword_267EFD010);
    sub_21FDF62D8();
  }
  swift_bridgeObjectRelease();
  uint64_t v3 = MEMORY[0x263F8EE78];
  id v4 = objc_msgSend(v0, sel_failures);
  if (v4)
  {
    id v5 = v4;
    sub_21FDF264C(0, &qword_267EFD010);
    sub_21FDF62D8();
  }
  swift_bridgeObjectRelease();
  sub_21FDF20D0(MEMORY[0x263F8EE78]);
  return v3;
}

int *sub_21FDF1C24@<X0>(void *a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = sub_21FDF5E98();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  id v9 = (char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  objc_msgSend(a1, sel_startTime);
  sub_21FDF5E78();
  id v10 = objc_msgSend(a1, sel_dnsDuration);
  id v11 = objc_msgSend(a1, sel_connectDuration);
  id v12 = objc_msgSend(a1, sel_requestDuration);
  id v31 = objc_msgSend(a1, sel_responseDuration);
  id v30 = objc_msgSend(a1, sel_responseSize);
  unsigned int v13 = objc_msgSend(a1, sel_cacheState);
  id v29 = objc_msgSend(a1, sel_httpStatusCode);
  id v28 = objc_msgSend(a1, sel_errorCode);
  int v27 = sub_21FDF208C(a2);
  unsigned int v26 = objc_msgSend(a2, sel_wifiReachabilityStatus);
  unsigned int v14 = objc_msgSend(a2, sel_cellularRadioAccessTechnology) - 1;
  id v33 = v11;
  id v34 = v10;
  id v32 = v12;
  uint64_t v15 = v6;
  if (v14 > 0xC) {
    int v25 = 0;
  }
  else {
    int v25 = byte_21FDF895A[v14];
  }
  id v16 = objc_msgSend(a2, sel_respondingPop);
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = sub_21FDF6298();
    unint64_t v20 = v19;
  }
  else
  {

    uint64_t v18 = 0;
    unint64_t v20 = 0xE000000000000000;
  }

  if (v13 == 2) {
    char v21 = 2;
  }
  else {
    char v21 = v13 == 1;
  }
  (*(void (**)(uint64_t, char *, uint64_t))(v7 + 32))(a3, v9, v15);
  uint64_t result = (int *)type metadata accessor for NetworkEventData(0);
  *(void *)(a3 + result[5]) = v34;
  *(void *)(a3 + result[6]) = v33;
  *(void *)(a3 + result[7]) = v32;
  *(void *)(a3 + result[8]) = v31;
  *(void *)(a3 + result[9]) = v30;
  *(unsigned char *)(a3 + result[10]) = v21;
  *(void *)(a3 + result[11]) = v29;
  *(void *)(a3 + result[12]) = v28;
  *(unsigned char *)(a3 + result[13]) = v27;
  *(unsigned char *)(a3 + result[14]) = v26;
  *(unsigned char *)(a3 + result[15]) = v25;
  id v23 = (uint64_t *)(a3 + result[16]);
  *id v23 = v18;
  v23[1] = v20;
  *(unsigned char *)(a3 + result[17]) = 0;
  return result;
}

uint64_t sub_21FDF1F28()
{
  id v0 = (id)NFSystemName();
  if (!v0) {
    return 0;
  }
  id v1 = v0;
  uint64_t v2 = sub_21FDF6298();
  uint64_t v4 = v3;

  if (v2 == 5459817 && v4 == 0xE300000000000000 || (sub_21FDF64B8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  if (v2 == 0x534F64615069 && v4 == 0xE600000000000000 || (sub_21FDF64B8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  if (v2 == 0x534F63616DLL && v4 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  char v6 = sub_21FDF64B8();
  swift_bridgeObjectRelease();
  if (v6) {
    return 3;
  }
  else {
    return 0;
  }
}

uint64_t sub_21FDF208C(void *a1)
{
  unsigned int v1 = objc_msgSend(a1, sel_eventType) - 1;
  if (v1 > 0x11) {
    return 0;
  }
  else {
    return byte_21FDF8967[v1];
  }
}

uint64_t sub_21FDF20D0(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_21FDF6378();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  unint64_t v4 = *v1;
  if (*v1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v5 = sub_21FDF6378();
    swift_bridgeObjectRelease();
    uint64_t v6 = v5 + v3;
    if (!__OFADD__(v5, v3)) {
      goto LABEL_5;
    }
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  uint64_t v5 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t v6 = v5 + v3;
  if (__OFADD__(v5, v3)) {
    goto LABEL_25;
  }
LABEL_5:
  unint64_t v4 = *v1;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *unsigned int v1 = v4;
  uint64_t v5 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v4 & 0x8000000000000000) == 0 && (v4 & 0x4000000000000000) == 0)
  {
    uint64_t v8 = v4 & 0xFFFFFFFFFFFFFF8;
    if (v6 <= *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      goto LABEL_15;
    }
    uint64_t v5 = 1;
  }
  if (v4 >> 62) {
    goto LABEL_27;
  }
  uint64_t v9 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    if (v9 <= v6) {
      uint64_t v9 = v6;
    }
    swift_bridgeObjectRetain();
    unint64_t v4 = MEMORY[0x223C5F120](v5, v9, 1, v4);
    swift_bridgeObjectRelease();
    *unsigned int v1 = v4;
    uint64_t v8 = v4 & 0xFFFFFFFFFFFFFF8;
LABEL_15:
    uint64_t v10 = sub_21FDF229C(v8 + 8 * *(void *)(v8 + 16) + 32, (*(void *)(v8 + 24) >> 1) - *(void *)(v8 + 16), a1);
    if (v11 >= v3) {
      break;
    }
LABEL_26:
    __break(1u);
LABEL_27:
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_21FDF6378();
    swift_bridgeObjectRelease();
  }
  if (v11 >= 1)
  {
    uint64_t v12 = *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    BOOL v13 = __OFADD__(v12, v11);
    uint64_t v14 = v12 + v11;
    if (v13)
    {
      __break(1u);
      return MEMORY[0x270F9DBB8](v10);
    }
    *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10) = v14;
  }
  uint64_t v10 = swift_bridgeObjectRelease();

  return MEMORY[0x270F9DBB8](v10);
}

uint64_t sub_21FDF229C(uint64_t result, uint64_t a2, unint64_t a3)
{
  uint64_t v5 = result;
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_21FDF6378();
    uint64_t result = swift_bridgeObjectRelease();
    if (!v7) {
      return a3;
    }
  }
  else
  {
    uint64_t v7 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v7) {
      return a3;
    }
  }
  if (v5)
  {
    if (v6)
    {
      swift_bridgeObjectRetain();
      uint64_t v8 = sub_21FDF6378();
      uint64_t result = swift_bridgeObjectRelease();
      if (v8 <= a2)
      {
        if (v7 >= 1)
        {
          sub_21FDF2688(&qword_267EFD020, &qword_267EFD018);
          swift_bridgeObjectRetain();
          for (unint64_t i = 0; i != v7; ++i)
          {
            __swift_instantiateConcreteTypeFromMangledName(&qword_267EFD018);
            uint64_t v10 = sub_21FDF246C(v13, i, a3);
            id v12 = *v11;
            ((void (*)(void (**)(id *), void))v10)(v13, 0);
            *(void *)(v5 + 8 * i) = v12;
          }
          swift_bridgeObjectRelease();
          return a3;
        }
        goto LABEL_16;
      }
    }
    else
    {
      if (*(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) <= a2)
      {
        sub_21FDF264C(0, &qword_267EFD010);
        swift_arrayInitWithCopy();
        return a3;
      }
      __break(1u);
    }
    __break(1u);
LABEL_16:
    __break(1u);
  }
  __break(1u);
  return result;
}

void (*sub_21FDF246C(void (**a1)(id *a1), unint64_t a2, uint64_t a3))(void *a1)
{
  unint64_t v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((void *)v6 + 4) = sub_21FDF251C(v6, a2, a3);
  return sub_21FDF24D4;
}

void sub_21FDF24D4(void *a1)
{
  unsigned int v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);

  free(v1);
}

void (*sub_21FDF251C(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
{
  uint64_t v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    id v4 = (id)MEMORY[0x223C5F110](a2, a3);
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) > a2)
  {
    id v4 = *(id *)(a3 + 8 * a2 + 32);
LABEL_5:
    *(void *)uint64_t v3 = v4;
    return sub_21FDF259C;
  }
  __break(1u);
  return result;
}

void sub_21FDF259C(id *a1)
{
}

uint64_t sub_21FDF25A4(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_21FDF25EC(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EFD008);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_21FDF264C(uint64_t a1, unint64_t *a2)
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

uint64_t sub_21FDF2688(unint64_t *a1, uint64_t *a2)
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

unint64_t sub_21FDF26CC()
{
  unint64_t result = qword_267EFD050;
  if (!qword_267EFD050)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EFD050);
  }
  return result;
}

unint64_t sub_21FDF2720()
{
  unint64_t result = qword_267EFD058;
  if (!qword_267EFD058)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EFD058);
  }
  return result;
}

unint64_t sub_21FDF2774()
{
  unint64_t result = qword_267EFD060;
  if (!qword_267EFD060)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EFD060);
  }
  return result;
}

unint64_t sub_21FDF27C8()
{
  unint64_t result = qword_267EFD068;
  if (!qword_267EFD068)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EFD068);
  }
  return result;
}

unint64_t sub_21FDF281C()
{
  unint64_t result = qword_267EFD070;
  if (!qword_267EFD070)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EFD070);
  }
  return result;
}

void NDAnalyticsEnvelopeSubmissionDatesByContentType_cold_1()
{
  id v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21FDD6000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"entries", v6, 2u);
}

void NDAnalyticsEnvelopeContentTypesFromEntries_cold_1()
{
  id v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21FDD6000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"entries", v6, 2u);
}

void NDAnalyticsEnvelopeStoreStringRepresentationsOfEntries_cold_1()
{
  id v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21FDD6000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"entries", v6, 2u);
}

void NDAnalyticsEnvelopeStoreEntriesFromStringRepresentations_cold_1()
{
  id v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21FDD6000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"stringRepresentations", v6, 2u);
}

void NDAnalyticsEntryDeliveryWindowEarlierDate_cold_1()
{
  id v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21FDD6000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"contentTypeConfig", v6, 2u);
}

void NDAnalyticsEntryDeliveryWindowEarlierDate_cold_2()
{
  id v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21FDD6000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"envelopeSubmissionDate", v6, 2u);
}

void NDAnalyticsEntryDeliveryWindow_cold_1()
{
  id v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21FDD6000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"contentTypeConfig", v6, 2u);
}

void NDAnalyticsEntryDeliveryWindow_cold_2()
{
  id v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21FDD6000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"envelopeSubmissionDate", v6, 2u);
}

void NDAnalyticsEntryCanBeUploaded_cold_1()
{
  id v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21FDD6000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"contentTypeConfig", v6, 2u);
}

void NDAnalyticsEntryCanBeUploaded_cold_2()
{
  id v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21FDD6000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"targetDate", v6, 2u);
}

void NDAnalyticsEntryCanBeUploaded_cold_3()
{
  id v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21FDD6000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"envelopeSubmissionDate", v6, 2u);
}

uint64_t sub_21FDF5E28()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_21FDF5E38()
{
  return MEMORY[0x270EEFE20]();
}

uint64_t sub_21FDF5E48()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_21FDF5E58()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_21FDF5E68()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_21FDF5E78()
{
  return MEMORY[0x270EF0AF0]();
}

uint64_t sub_21FDF5E88()
{
  return MEMORY[0x270EF0C30]();
}

uint64_t sub_21FDF5E98()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_21FDF5EA8()
{
  return MEMORY[0x270EF0C68]();
}

uint64_t sub_21FDF5EB8()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_21FDF5EC8()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_21FDF5ED8()
{
  return MEMORY[0x270F0C2A8]();
}

uint64_t sub_21FDF5EE8()
{
  return MEMORY[0x270F0C2B0]();
}

uint64_t sub_21FDF5EF8()
{
  return MEMORY[0x270F0C2B8]();
}

uint64_t sub_21FDF5F08()
{
  return MEMORY[0x270F0C2C0]();
}

uint64_t sub_21FDF5F18()
{
  return MEMORY[0x270F0C2C8]();
}

uint64_t sub_21FDF5F28()
{
  return MEMORY[0x270F0C2D0]();
}

uint64_t sub_21FDF5F38()
{
  return MEMORY[0x270F0C2D8]();
}

uint64_t sub_21FDF5F48()
{
  return MEMORY[0x270F0C370]();
}

uint64_t sub_21FDF5F58()
{
  return MEMORY[0x270F0C380]();
}

uint64_t sub_21FDF5F68()
{
  return MEMORY[0x270F0C398]();
}

uint64_t sub_21FDF5F78()
{
  return MEMORY[0x270F0C3A0]();
}

uint64_t sub_21FDF5F88()
{
  return MEMORY[0x270F0C3A8]();
}

uint64_t sub_21FDF5F98()
{
  return MEMORY[0x270F0C3B0]();
}

uint64_t sub_21FDF5FA8()
{
  return MEMORY[0x270F0C3B8]();
}

uint64_t sub_21FDF5FB8()
{
  return MEMORY[0x270F0C3D0]();
}

uint64_t sub_21FDF5FC8()
{
  return MEMORY[0x270F0C3E0]();
}

uint64_t sub_21FDF5FD8()
{
  return MEMORY[0x270F0C3E8]();
}

uint64_t sub_21FDF5FE8()
{
  return MEMORY[0x270F0C3F0]();
}

uint64_t sub_21FDF5FF8()
{
  return MEMORY[0x270F0C3F8]();
}

uint64_t sub_21FDF6008()
{
  return MEMORY[0x270F0C400]();
}

uint64_t sub_21FDF6018()
{
  return MEMORY[0x270F0C408]();
}

uint64_t sub_21FDF6028()
{
  return MEMORY[0x270F0C418]();
}

uint64_t sub_21FDF6038()
{
  return MEMORY[0x270F0C430]();
}

uint64_t sub_21FDF6048()
{
  return MEMORY[0x270F0C438]();
}

uint64_t sub_21FDF6058()
{
  return MEMORY[0x270F0C440]();
}

uint64_t sub_21FDF6068()
{
  return MEMORY[0x270F0C458]();
}

uint64_t sub_21FDF6078()
{
  return MEMORY[0x270F0C478]();
}

uint64_t sub_21FDF6088()
{
  return MEMORY[0x270F0C4E8]();
}

uint64_t sub_21FDF6098()
{
  return MEMORY[0x270F0C4F0]();
}

uint64_t sub_21FDF60A8()
{
  return MEMORY[0x270F0C4F8]();
}

uint64_t sub_21FDF60B8()
{
  return MEMORY[0x270F0C530]();
}

uint64_t sub_21FDF60C8()
{
  return MEMORY[0x270F0C540]();
}

uint64_t sub_21FDF60D8()
{
  return MEMORY[0x270F0C558]();
}

uint64_t sub_21FDF60E8()
{
  return MEMORY[0x270F0C560]();
}

uint64_t sub_21FDF60F8()
{
  return MEMORY[0x270F0C568]();
}

uint64_t sub_21FDF6108()
{
  return MEMORY[0x270F0C570]();
}

uint64_t sub_21FDF6118()
{
  return MEMORY[0x270F0C588]();
}

uint64_t sub_21FDF6128()
{
  return MEMORY[0x270F0C590]();
}

uint64_t sub_21FDF6138()
{
  return MEMORY[0x270F0C5D0]();
}

uint64_t sub_21FDF6148()
{
  return MEMORY[0x270F0C600]();
}

uint64_t sub_21FDF6158()
{
  return MEMORY[0x270F0C608]();
}

uint64_t sub_21FDF6168()
{
  return MEMORY[0x270F0C668]();
}

uint64_t sub_21FDF6178()
{
  return MEMORY[0x270F0C678]();
}

uint64_t sub_21FDF6188()
{
  return MEMORY[0x270F0C688]();
}

uint64_t sub_21FDF6198()
{
  return MEMORY[0x270F0C6B0]();
}

uint64_t sub_21FDF61A8()
{
  return MEMORY[0x270F0C738]();
}

uint64_t sub_21FDF61B8()
{
  return MEMORY[0x270F0C740]();
}

uint64_t sub_21FDF61C8()
{
  return MEMORY[0x270F79EC8]();
}

uint64_t sub_21FDF61D8()
{
  return MEMORY[0x270F7A000]();
}

uint64_t sub_21FDF61E8()
{
  return MEMORY[0x270F7A008]();
}

uint64_t sub_21FDF61F8()
{
  return MEMORY[0x270F7A0C0]();
}

uint64_t sub_21FDF6208()
{
  return MEMORY[0x270F7A0C8]();
}

uint64_t sub_21FDF6218()
{
  return MEMORY[0x270F7A418]();
}

uint64_t sub_21FDF6228()
{
  return MEMORY[0x270F7A420]();
}

uint64_t sub_21FDF6238()
{
  return MEMORY[0x270F7A428]();
}

uint64_t sub_21FDF6248()
{
  return MEMORY[0x270FA2C68]();
}

uint64_t sub_21FDF6258()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_21FDF6268()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_21FDF6278()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_21FDF6288()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_21FDF6298()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_21FDF62A8()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_21FDF62B8()
{
  return MEMORY[0x270F9DA80]();
}

uint64_t sub_21FDF62C8()
{
  return MEMORY[0x270F9DB00]();
}

uint64_t sub_21FDF62D8()
{
  return MEMORY[0x270EF1BA8]();
}

uint64_t sub_21FDF62E8()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_21FDF6308()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_21FDF6318()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_21FDF6328()
{
  return MEMORY[0x270FA0C20]();
}

uint64_t sub_21FDF6338()
{
  return MEMORY[0x270FA0D70]();
}

uint64_t sub_21FDF6348()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_21FDF6358()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_21FDF6368()
{
  return MEMORY[0x270F9EA48]();
}

uint64_t sub_21FDF6378()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_21FDF6388()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_21FDF6398()
{
  return MEMORY[0x270F9F270]();
}

uint64_t sub_21FDF63A8()
{
  return MEMORY[0x270F9F278]();
}

uint64_t sub_21FDF63B8()
{
  return MEMORY[0x270F9F2A0]();
}

uint64_t sub_21FDF63C8()
{
  return MEMORY[0x270F9F2E8]();
}

uint64_t sub_21FDF63D8()
{
  return MEMORY[0x270F9F2F0]();
}

uint64_t sub_21FDF63E8()
{
  return MEMORY[0x270F9F300]();
}

uint64_t sub_21FDF63F8()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_21FDF6408()
{
  return MEMORY[0x270F9F330]();
}

uint64_t sub_21FDF6418()
{
  return MEMORY[0x270F9F338]();
}

uint64_t sub_21FDF6428()
{
  return MEMORY[0x270F9F3B0]();
}

uint64_t sub_21FDF6438()
{
  return MEMORY[0x270F9F3B8]();
}

uint64_t sub_21FDF6448()
{
  return MEMORY[0x270F9F3E0]();
}

uint64_t sub_21FDF6458()
{
  return MEMORY[0x270F9F428]();
}

uint64_t sub_21FDF6468()
{
  return MEMORY[0x270F9F430]();
}

uint64_t sub_21FDF6478()
{
  return MEMORY[0x270F9F440]();
}

uint64_t sub_21FDF6488()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_21FDF6498()
{
  return MEMORY[0x270F9F470]();
}

uint64_t sub_21FDF64A8()
{
  return MEMORY[0x270F9F478]();
}

uint64_t sub_21FDF64B8()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_21FDF64C8()
{
  return MEMORY[0x270F9FA40]();
}

uint64_t sub_21FDF64D8()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_21FDF64E8()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_21FDF64F8()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_21FDF6508()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_21FDF6518()
{
  return MEMORY[0x270F9FD98]();
}

uint64_t FCDefaultsReadEndpointEnvironment()
{
  return MEMORY[0x270F4EFF8]();
}

uint64_t FCDeviceIdentifierForVendor()
{
  return MEMORY[0x270F4F000]();
}

uint64_t FCDispatchGroupIsEmpty()
{
  return MEMORY[0x270F4F008]();
}

uint64_t FCDispatchQueueForQualityOfService()
{
  return MEMORY[0x270F4F018]();
}

uint64_t FCDynamicCast()
{
  return MEMORY[0x270F4F020]();
}

uint64_t FCURLForFeldsparUserAccountHomeDirectory()
{
  return MEMORY[0x270F4F088]();
}

uint64_t NFInternalBuild()
{
  return MEMORY[0x270F50028]();
}

uint64_t NFSystemName()
{
  return MEMORY[0x270F50040]();
}

uint64_t NewsCoreUserDefaults()
{
  return MEMORY[0x270F4F0B8]();
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

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x270ED9340]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
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

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
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

void objc_exception_throw(id exception)
{
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

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x270EDAA90]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x270FA01C8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
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

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x270FA04C0]();
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

uint64_t swift_slowAlloc()
{
  return MEMORY[0x270FA0558]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}