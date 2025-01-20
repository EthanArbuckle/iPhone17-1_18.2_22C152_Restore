void protocol witness for Collection.startIndex.getter in conformance DispatchData(void *a1@<X8>)
{
  *a1 = 0;
}

uint64_t protocol witness for SetAlgebra.init<A>(_:) in conformance OS_dispatch_queue.Attributes(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x1F4184B08](a1, a4, a2, a5, a3);
}

void destroy for DispatchDataIterator(id *a1)
{
}

ValueMetadata *type metadata accessor for DispatchQoS()
{
  return &type metadata for DispatchQoS;
}

ValueMetadata *type metadata accessor for DispatchWorkItemFlags()
{
  return &type metadata for DispatchWorkItemFlags;
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

uint64_t block_destroy_helper_1()
{
  return swift_release();
}

uint64_t block_destroy_helper_2()
{
  return swift_release();
}

BOOL protocol witness for SetAlgebra.insert(_:) in conformance OS_dispatch_queue.Attributes(void *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = *v2 & *a2;
  if (v4 != *a2) {
    *v2 |= v3;
  }
  *a1 = v3;
  return v4 != v3;
}

unsigned char *destructiveInjectEnumTag for OS_dispatch_queue.GlobalQueuePriority(unsigned char *result, char a2)
{
  *result = a2;
  return result;
}

void static DispatchQoS.unspecified.getter(uint64_t a1@<X8>)
{
  *(unsigned char *)a1 = 5;
  *(void *)(a1 + 8) = 0;
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

void static OS_dispatch_queue.Attributes.concurrent.getter(void *a1@<X8>)
{
  *a1 = 2;
}

ValueMetadata *type metadata accessor for OS_dispatch_queue.Attributes()
{
  return &type metadata for OS_dispatch_queue.Attributes;
}

ValueMetadata *type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency()
{
  return &type metadata for OS_dispatch_queue.AutoreleaseFrequency;
}

uint64_t destructiveInjectEnumTag for DispatchPredicate(uint64_t result, char a2)
{
  *(unsigned char *)(result + 8) = a2;
  return result;
}

ValueMetadata *type metadata accessor for DispatchTime()
{
  return &type metadata for DispatchTime;
}

ValueMetadata *type metadata accessor for DispatchTimeInterval()
{
  return &type metadata for DispatchTimeInterval;
}

ValueMetadata *type metadata accessor for DispatchPredicate()
{
  return &type metadata for DispatchPredicate;
}

uint64_t destructiveInjectEnumTag for DispatchTimeInterval(uint64_t result, unsigned int a2)
{
  if (a2 >= 4)
  {
    *(void *)result = a2 - 4;
    LOBYTE(a2) = 4;
  }
  *(unsigned char *)(result + 8) = a2;
  return result;
}

BOOL protocol witness for static Comparable.< infix(_:_:) in conformance DispatchTime(void *a1, void *a2)
{
  return *a1 < *a2;
}

ValueMetadata *type metadata accessor for DispatchQoS.QoSClass()
{
  return &type metadata for DispatchQoS.QoSClass;
}

void static DispatchWorkItemFlags.barrier.getter(void *a1@<X8>)
{
  *a1 = 1;
}

Swift::Int __swiftcall OS_dispatch_semaphore.signal()()
{
  return dispatch_semaphore_signal(v0);
}

BOOL protocol witness for static Comparable.>= infix(_:_:) in conformance DispatchTime(void *a1, void *a2)
{
  return *a1 >= *a2;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

void static DispatchWorkItemFlags.enforceQoS.getter(void *a1@<X8>)
{
  *a1 = 32;
}

Swift::Void __swiftcall OS_dispatch_semaphore.wait()()
{
  dispatch_semaphore_wait(v0, 0xFFFFFFFFFFFFFFFFLL);
}

uint64_t getEnumTagSinglePayload for OS_dispatch_queue.SchedulerOptions(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 32)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  unint64_t v3 = *(void *)(a1 + 24);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t OS_dispatch_queue.getSpecific<A>(key:)@<X0>(uint64_t *key@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = *key;
  specific = (char *)dispatch_queue_get_specific(v2, key);
  if (specific)
  {
    v6 = &specific[*(void *)(*(void *)specific + 88)];
    uint64_t v7 = *(void *)(v4 + 80);
    uint64_t v14 = *(void *)(v7 - 8);
    v8 = *(void (**)(uint64_t, char *, uint64_t))(v14 + 16);
    swift_retain();
    v8(a2, v6, v7);
    swift_release();
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
    uint64_t v10 = a2;
    uint64_t v11 = 0;
    uint64_t v12 = v7;
  }
  else
  {
    uint64_t v12 = *(void *)(v4 + 80);
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56);
    uint64_t v10 = a2;
    uint64_t v11 = 1;
  }

  return v9(v10, v11, 1, v12);
}

dispatch_time_t static DispatchWallTime.now()@<X0>(dispatch_time_t *a1@<X8>)
{
  dispatch_time_t result = dispatch_walltime(0, 0);
  *a1 = result;
  return result;
}

uint64_t OS_dispatch_source.setEventHandler(handler:)(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, uint64_t))
{
  self;
  uint64_t v4 = swift_dynamicCastObjCClassUnconditional();
  uint64_t v5 = *(void *)(a1 + 16);

  return a3(v4, v5);
}

uint64_t base witness table accessor for Executor in OS_dispatch_queue_serial_executor()
{
  return lazy protocol witness table accessor for type OS_dispatch_queue_serial_executor and conformance OS_dispatch_queue_serial_executor(&lazy protocol witness table cache variable for type OS_dispatch_queue_serial_executor and conformance OS_dispatch_queue_serial_executor);
}

uint64_t OS_dispatch_queue_serial_executor.asUnownedSerialExecutor()()
{
  lazy protocol witness table accessor for type OS_dispatch_queue_serial_executor and conformance OS_dispatch_queue_serial_executor(&lazy protocol witness table cache variable for type OS_dispatch_queue_serial_executor and conformance OS_dispatch_queue_serial_executor);
  return v0;
}

uint64_t lazy protocol witness table accessor for type OS_dispatch_queue_serial_executor and conformance OS_dispatch_queue_serial_executor(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for OS_dispatch_queue_serial_executor();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t type metadata accessor for OS_dispatch_queue_serial_executor()
{
  unint64_t result = lazy cache variable for type metadata for OS_dispatch_queue_serial_executor;
  if (!lazy cache variable for type metadata for OS_dispatch_queue_serial_executor)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&lazy cache variable for type metadata for OS_dispatch_queue_serial_executor);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags()
{
  unint64_t result = lazy protocol witness table cache variable for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags;
  if (!lazy protocol witness table cache variable for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags;
  if (!lazy protocol witness table cache variable for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags;
  if (!lazy protocol witness table cache variable for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags;
  if (!lazy protocol witness table cache variable for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags);
  }
  return result;
}

void OS_dispatch_source_timer.scheduleRepeating(deadline:interval:leeway:)(dispatch_time_t *a1, uint64_t a2, double a3)
{
  dispatch_time_t v4 = *a1;
  uint64_t v5 = *(void *)a2;
  uint64_t v6 = *(unsigned __int8 *)(a2 + 8);
  self;
  uint64_t v7 = swift_dynamicCastObjCClassUnconditional();
  if ((*(void *)&a3 & 0x7FFFFFFFFFFFFFFFLL) == 0x7FF0000000000000)
  {
    uint64_t v8 = -1;
    goto LABEL_7;
  }
  double v9 = a3 * 1000000000.0;
  if ((~COERCE__INT64(a3 * 1000000000.0) & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_19;
  }
  if (v9 <= -1.0)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  if (v9 >= 1.84467441e19)
  {
LABEL_20:
    __break(1u);
    return;
  }
  uint64_t v8 = (unint64_t)v9;
LABEL_7:
  uint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v11 = v5;
  switch(v6)
  {
    case 1:
      uint64_t v12 = 1000000;
      goto LABEL_11;
    case 2:
      uint64_t v12 = 1000;
      goto LABEL_11;
    case 3:
      goto LABEL_14;
    case 4:
      goto LABEL_15;
    default:
      uint64_t v12 = 1000000000;
LABEL_11:
      uint64_t v11 = v5 * v12;
      if ((unsigned __int128)(v5 * (__int128)v12) >> 64 == (v5 * v12) >> 63) {
        goto LABEL_14;
      }
      if (v5 <= 0)
      {
        do
        {
          __break(1u);
LABEL_14:
          uint64_t v10 = v11;
        }
        while ((v11 & 0x8000000000000000) != 0);
      }
LABEL_15:
      dispatch_source_set_timer(v7, v4, v8, v10);
      break;
  }
}

uint64_t DispatchTime.init(uptimeNanoseconds:)@<X0>(uint64_t result@<X0>, unint64_t *a2@<X8>)
{
  unint64_t v2 = result;
  if (result == -1) {
    goto LABEL_10;
  }
  if (one-time initialization token for timebaseInfo != -1) {
    unint64_t result = swift_once();
  }
  if (static DispatchTime.timebaseInfo == HIDWORD(static DispatchTime.timebaseInfo)) {
    goto LABEL_10;
  }
  if (!is_mul_ok(v2, HIDWORD(static DispatchTime.timebaseInfo))) {
    goto LABEL_9;
  }
  unsigned int v4 = static DispatchTime.timebaseInfo - 1;
  if (static DispatchTime.timebaseInfo)
  {
    unint64_t v5 = v2 * HIDWORD(static DispatchTime.timebaseInfo);
    BOOL v6 = __CFADD__(v5, v4);
    unint64_t v7 = v5 + v4;
    if (!v6)
    {
      unint64_t v2 = v7 / static DispatchTime.timebaseInfo;
LABEL_10:
      *a2 = v2;
      return result;
    }
LABEL_9:
    unint64_t v2 = -1;
    goto LABEL_10;
  }
  __break(1u);
  return result;
}

BOOL DispatchWorkItem.isCancelled.getter()
{
  return _swift_dispatch_block_testcancel(*(void **)(v0 + 16)) != 0;
}

intptr_t _swift_dispatch_block_testcancel(void *a1)
{
  id v1 = a1;
  intptr_t v2 = dispatch_block_testcancel(v1);

  return v2;
}

void OS_dispatch_queue_serial.init(label:qos:attributes:autoreleaseFrequency:target:)(uint64_t a1, uint64_t a2, char *a3, unsigned char *a4, unsigned char *a5, void *a6)
{
  uint64_t v7 = *a3;
  uint64_t v8 = *((void *)a3 + 1);
  dispatch_autorelease_frequency_t v9 = (unint64_t)*a5;
  if ((*a4 & 4) != 0)
  {
    uint64_t v10 = dispatch_queue_attr_make_initially_inactive(0);
    if (!v9) {
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v10 = 0;
    if (!*a5) {
      goto LABEL_9;
    }
  }
  if (v9 == DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM) {
    dispatch_autorelease_frequency_t v11 = v9;
  }
  else {
    dispatch_autorelease_frequency_t v11 = DISPATCH_AUTORELEASE_FREQUENCY_NEVER;
  }
  uint64_t v12 = dispatch_queue_attr_make_with_autorelease_frequency(v10, v11);

  uint64_t v10 = v12;
LABEL_9:
  if (v7 == 5 && v8 == 0) {
    goto LABEL_16;
  }
  if (v8 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
  }
  else if (v8 <= 0x7FFFFFFF)
  {
    uint64_t v14 = dispatch_queue_attr_make_with_qos_class(v10, (dispatch_qos_class_t)dword_18BFADA08[v7], v8);

    uint64_t v10 = v14;
LABEL_16:
    uint64_t v15 = String.utf8CString.getter();
    swift_bridgeObjectRelease();
    dispatch_concurrent_queue_create_with_target_4swift((const char *)(v15 + 32), v10, a6);
    swift_release();

    return;
  }
  __break(1u);
}

dispatch_queue_t dispatch_concurrent_queue_create_with_target_4swift(const char *a1, void *a2, void *a3)
{
  unint64_t v5 = a2;
  BOOL v6 = a3;
  dispatch_queue_t v7 = dispatch_queue_create_with_target_V2(a1, v5, v6);

  return v7;
}

void OS_dispatch_source_timer.scheduleRepeating(deadline:interval:leeway:)(dispatch_time_t *a1, uint64_t a2, uint64_t a3)
{
  dispatch_time_t v3 = *a1;
  uint64_t v4 = *(void *)a2;
  uint64_t v5 = *(unsigned __int8 *)(a2 + 8);
  uint64_t v6 = *(void *)a3;
  uint64_t v7 = *(unsigned __int8 *)(a3 + 8);
  self;
  uint64_t v8 = swift_dynamicCastObjCClassUnconditional();
  if (v5 == 4 && v4 == 0)
  {
    uint64_t v10 = -1;
  }
  else
  {
    uint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v11 = v4;
    switch(v5)
    {
      case 1:
        uint64_t v12 = 1000000;
        goto LABEL_9;
      case 2:
        goto LABEL_12;
      case 3:
        goto LABEL_15;
      case 4:
        goto LABEL_16;
      default:
        uint64_t v12 = 1000000000;
LABEL_9:
        uint64_t v11 = v4 * v12;
        if ((unsigned __int128)(v4 * (__int128)v12) >> 64 == (v4 * v12) >> 63) {
          goto LABEL_15;
        }
        if (v4 > 0) {
          goto LABEL_16;
        }
        break;
    }
    do
    {
      while (1)
      {
        __break(1u);
LABEL_12:
        uint64_t v11 = 1000 * v4;
        if ((unsigned __int128)(v4 * (__int128)1000) >> 64 == (1000 * v4) >> 63) {
          break;
        }
        if (v4 >= 1) {
          goto LABEL_16;
        }
      }
LABEL_15:
      uint64_t v10 = v11;
    }
    while (v11 < 0);
  }
LABEL_16:
  uint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v14 = v6;
  switch(v7)
  {
    case 1:
      uint64_t v15 = 1000000;
      goto LABEL_20;
    case 2:
      uint64_t v15 = 1000;
      goto LABEL_20;
    case 3:
      goto LABEL_23;
    case 4:
      goto LABEL_24;
    default:
      uint64_t v15 = 1000000000;
LABEL_20:
      uint64_t v14 = v6 * v15;
      if ((unsigned __int128)(v6 * (__int128)v15) >> 64 == (v6 * v15) >> 63) {
        goto LABEL_23;
      }
      if (v6 <= 0)
      {
        do
        {
          __break(1u);
LABEL_23:
          uint64_t v13 = v14;
        }
        while ((v14 & 0x8000000000000000) != 0);
      }
LABEL_24:
      dispatch_source_set_timer(v8, v3, v10, v13);
      return;
  }
}

BOOL OS_dispatch_group.wait(wallTimeout:)(dispatch_time_t *a1)
{
  return dispatch_group_wait(v1, *a1) != 0;
}

uint64_t OS_dispatch_queue.setSpecific<A>(key:value:)(const void *a1)
{
  uint64_t v11 = *(void *)(*(void *)a1 + 80);
  uint64_t v3 = v11;
  type metadata accessor for Optional();
  uint64_t v4 = type metadata accessor for _DispatchSpecificValue();
  uint64_t v5 = MEMORY[0x1E4FBC248];
  _sSq3mapyqd_0_Sgqd_0_xqd__YKXEqd__YKs5ErrorRd__Ri_d_0_r0_lF((void (*)(char *, char *))partial apply for closure #1 in OS_dispatch_queue.setSpecific<A>(key:value:), (uint64_t)v10, MEMORY[0x1E4FBC248], v4, v6, (uint64_t)&context);
  uint64_t v12 = context;
  v9[2] = v3;
  type metadata accessor for Optional();
  _sSq3mapyqd_0_Sgqd_0_xqd__YKXEqd__YKs5ErrorRd__Ri_d_0_r0_lF((void (*)(char *, char *))partial apply for closure #2 in OS_dispatch_queue.setSpecific<A>(key:value:), (uint64_t)v9, v5, MEMORY[0x1E4FBB870], v7, (uint64_t)&context);
  dispatch_queue_set_specific(v1, a1, context, (dispatch_function_t)@objc _destructDispatchSpecificValue(ptr:));
  return swift_release();
}

uint64_t _sSq3mapyqd_0_Sgqd_0_xqd__YKXEqd__YKs5ErrorRd__Ri_d_0_r0_lF@<X0>(void (*a1)(char *, char *)@<X0>, uint64_t a2@<X1>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X6>, uint64_t a6@<X8>)
{
  uint64_t v25 = a5;
  uint64_t v26 = a2;
  uint64_t v28 = a4;
  v27 = a1;
  uint64_t v24 = *(void *)(a3 - 8);
  uint64_t v10 = ((uint64_t (*)(void))MEMORY[0x1F4188790])();
  uint64_t v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = *(void *)(v13 + 16);
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = MEMORY[0x1F4188790](v10);
  v18 = (char *)&v24 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v16);
  v20 = (char *)&v24 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v21 + 16))(v20, v6);
  uint64_t v22 = 1;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v20, 1, v14) != 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v18, v20, v14);
    v27(v18, v12);
    (*(void (**)(char *, uint64_t))(v15 + 8))(v18, v14);
    if (v7) {
      return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v24 + 32))(v25, v12, a3);
    }
    uint64_t v22 = 0;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v28 - 8) + 56))(a6, v22, 1);
}

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
}

uint64_t type metadata accessor for _DispatchSpecificValue()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t partial apply for closure #2 in OS_dispatch_queue.setSpecific<A>(key:value:)@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  *a2 = *a1;
  return swift_retain();
}

uint64_t partial apply for closure #1 in OS_dispatch_queue.setSpecific<A>(key:value:)@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return closure #1 in OS_dispatch_queue.setSpecific<A>(key:value:)(a1, *(void *)(v2 + 16), a2);
}

uint64_t closure #1 in OS_dispatch_queue.setSpecific<A>(key:value:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v6 = *(void *)(a2 - 8);
  MEMORY[0x1F4188790](a1);
  uint64_t v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for _DispatchSpecificValue();
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, a1, a2);
  uint64_t result = _DispatchSpecificValue.__allocating_init(value:)((uint64_t)v8);
  *a3 = result;
  return result;
}

uint64_t _DispatchSpecificValue.__allocating_init(value:)(uint64_t a1)
{
  uint64_t v2 = swift_allocObject();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(*(void *)(*(void *)v2 + 80) - 8) + 32))(v2 + *(void *)(*(void *)v2 + 88), a1);
  return v2;
}

uint64_t static OS_dispatch_queue.concurrentPerform(iterations:execute:)(size_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = a2;
  *(void *)(v6 + 24) = a3;
  void v9[4] = partial apply for thunk for @callee_guaranteed (@unowned Int) -> ();
  v9[5] = v6;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 1107296256;
  v9[2] = thunk for @escaping @callee_guaranteed (@unowned Int) -> ();
  v9[3] = &block_descriptor_0;
  uint64_t v7 = _Block_copy(v9);
  swift_retain();
  swift_release();
  _swift_dispatch_apply_current(a1, v7);
  _Block_release(v7);
  LOBYTE(v7) = swift_isEscapingClosureAtFileLocation();
  uint64_t result = swift_release();
  if (v7) {
    __break(1u);
  }
  return result;
}

void _swift_dispatch_apply_current(size_t a1, void *a2)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = ___swift_dispatch_apply_current_block_invoke;
  block[3] = &unk_1E54D7A78;
  uint64_t v6 = a2;
  id v3 = a2;
  dispatch_apply(a1, 0, block);
  uint64_t v4 = v6;
}

void _swift_dispatch_block_cancel(void *a1)
{
  id v1 = a1;
  dispatch_block_cancel(v1);
}

void partial apply for implicit closure #2 in implicit closure #1 in OS_dispatch_queue.schedule(after:interval:tolerance:options:_:)()
{
}

uint64_t OS_dispatch_source.activate()(uint64_t a1, uint64_t (*a2)(uint64_t))
{
  self;
  uint64_t v2 = swift_dynamicCastObjCClassUnconditional();

  return a2(v2);
}

Swift::Void __swiftcall OS_dispatch_source.cancel()()
{
  OS_dispatch_source.activate()(v0, MEMORY[0x1E4F147C0]);
}

uint64_t thunk for @escaping @callee_guaranteed () -> ()(uint64_t a1)
{
  id v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

uint64_t DispatchWorkItem.__deallocating_deinit()
{
  _Block_release(*(const void **)(v0 + 16));

  return MEMORY[0x1F4186488](v0, 24, 7);
}

dispatch_time_t protocol witness for Strideable.advanced(by:) in conformance OS_dispatch_queue.SchedulerTimeType@<X0>(int64_t *a1@<X0>, dispatch_time_t *a2@<X8>)
{
  dispatch_time_t result = dispatch_time(*v2, *a1);
  *a2 = result;
  return result;
}

uint64_t DispatchWorkItem.init(flags:block:)(dispatch_block_flags_t *a1, void *aBlock)
{
  dispatch_block_flags_t v4 = *a1;
  uint64_t v5 = _Block_copy(aBlock);
  id v6 = _swift_dispatch_block_create(v4, v5);
  _Block_release(aBlock);
  _Block_release(v5);
  *(void *)(v2 + 16) = v6;
  return v2;
}

id _swift_dispatch_block_create(dispatch_block_flags_t a1, void *a2)
{
  id v3 = a2;
  dispatch_block_t v4 = dispatch_block_create(a1, v3);

  return v4;
}

dispatch_time_t protocol witness for Scheduler.now.getter in conformance OS_dispatch_queue@<X0>(dispatch_time_t *a1@<X8>)
{
  dispatch_time_t result = dispatch_time(0, 0);
  *a1 = result;
  return result;
}

dispatch_time_t + infix(_:_:)@<X0>(dispatch_time_t *a1@<X0>, dispatch_time_t *a2@<X8>, double a3@<D0>)
{
  dispatch_time_t v4 = *a1;
  int64_t v5 = toInt64Clamped(_:)(a3 * 1000000000.0);
  dispatch_time_t result = dispatch_time(v4, v5);
  *a2 = result;
  return result;
}

uint64_t toInt64Clamped(_:)(double a1)
{
  uint64_t v1 = *(void *)&a1 & 0x7FF0000000000000;
  BOOL v3 = (*(void *)&a1 & 0xFFFFFFFFFFFFFLL) != 0 && v1 == 0x7FF0000000000000;
  uint64_t result = 0x7FFFFFFFFFFFFFFFLL;
  if (a1 < 9.22337204e18 && !v3)
  {
    if (a1 <= -9.22337204e18) {
      return 0x8000000000000000;
    }
    if (v1 == 0x7FF0000000000000)
    {
      __break(1u);
    }
    else if (a1 > -9.22337204e18)
    {
      if (a1 < 9.22337204e18) {
        return (uint64_t)a1;
      }
LABEL_18:
      __break(1u);
      return result;
    }
    __break(1u);
    goto LABEL_18;
  }
  return result;
}

uint64_t protocol witness for Scheduler.schedule(options:_:) in conformance OS_dispatch_queue(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  return OS_dispatch_queue.schedule(options:_:)(a1, a2, a3);
}

dispatch_time_t + infix(_:_:)@<X0>(dispatch_time_t *a1@<X0>, uint64_t a2@<X1>, dispatch_time_t *a3@<X8>)
{
  dispatch_time_t v4 = *a1;
  uint64_t v5 = *(void *)a2;
  uint64_t v6 = *(unsigned __int8 *)(a2 + 8);
  int64_t v7 = *(void *)a2;
  switch(v6)
  {
    case 1:
      uint64_t v8 = 1000000;
      goto LABEL_5;
    case 2:
      uint64_t v8 = 1000;
      goto LABEL_5;
    case 3:
      goto LABEL_10;
    case 4:
      int64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
      goto LABEL_10;
    default:
      uint64_t v8 = 1000000000;
LABEL_5:
      int64_t v7 = v5 * v8;
      if ((unsigned __int128)(v5 * (__int128)v8) >> 64 != (v5 * v8) >> 63)
      {
        if (v5 > 0) {
          int64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
        }
        else {
          int64_t v7 = 0x8000000000000000;
        }
      }
LABEL_10:
      dispatch_time_t result = dispatch_time(v4, v7);
      *a3 = result;
      return result;
  }
}

uint64_t partial apply for thunk for @callee_guaranteed () -> ()()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t partial apply for closure #1 in closure #1 in OS_dispatch_queue._syncHelper<A>(fn:execute:rescue:)()
{
  return closure #1 in closure #1 in OS_dispatch_queue._syncHelper<A>(fn:execute:rescue:)(*(void *)(v0 + 24), *(void (**)(uint64_t))(v0 + 32), *(void *)(v0 + 40), *(void *)(v0 + 48), *(void *)(v0 + 16));
}

uint64_t closure #1 in closure #1 in OS_dispatch_queue._syncHelper<A>(fn:execute:rescue:)(uint64_t a1, void (*a2)(uint64_t), uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8 = type metadata accessor for Optional();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = MEMORY[0x1F4188790](v8);
  uint64_t v12 = (char *)&v14 - v11;
  a2(v10);
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(a5 - 8) + 56))(v12, 0, 1, a5);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v9 + 40))(a1, v12, v8);
}

uint64_t thunk for @callee_guaranteed () -> (@out A, @error @owned Error)partial apply()
{
  return partial apply for thunk for @callee_guaranteed () -> (@out A, @error @owned Error)();
}

uint64_t partial apply for thunk for @callee_guaranteed () -> (@out A, @error @owned Error)()
{
  return (*(uint64_t (**)(void))(v0 + 24))();
}

void OS_dispatch_group.notify(qos:flags:queue:execute:)(unsigned __int8 *a1, dispatch_block_flags_t *a2, void *a3, void *aBlock)
{
  uint64_t v5 = v4;
  int v7 = *a1;
  uint64_t v8 = *((void *)a1 + 1);
  dispatch_block_flags_t v9 = *a2;
  uint64_t v10 = _Block_copy(aBlock);
  uint64_t v11 = v10;
  if (v7 == 5 && v8 == 0)
  {
    if (v9)
    {
      uint64_t v13 = _Block_copy(v10);
      id v14 = _swift_dispatch_block_create(v9, v13);
      _Block_release(v13);
      _Block_release(v11);
      uint64_t v11 = v14;
    }
  }
  else
  {
    v16[0] = v7;
    uint64_t v17 = v8;
    dispatch_block_flags_t v15 = v9;
    type metadata accessor for DispatchWorkItem();
    swift_initStackObject();
    uint64_t v11 = (void *)*((void *)DispatchWorkItem.init(qos:flags:block:)(v16, &v15, v11) + 2);
    _Block_copy(v11);
    swift_release();
  }
  _swift_dispatch_group_notify(v5, a3, v11);
  _Block_release(v11);
}

void _swift_dispatch_group_notify(void *a1, void *a2, void *a3)
{
  uint64_t v5 = a1;
  uint64_t v6 = a2;
  id v7 = a3;
  dispatch_group_notify(v5, v6, v7);
}

id static OS_dispatch_queue.main.getter()
{
  main_queue = _swift_dispatch_get_main_queue();

  return main_queue;
}

void *_swift_dispatch_get_main_queue()
{
  uint64_t v0 = (void *)MEMORY[0x1E4F14428];
  id v1 = MEMORY[0x1E4F14428];
  id v2 = v0;
  return v0;
}

dispatch_queue_global_t static OS_dispatch_queue.global(qos:)(char *a1)
{
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(qword_18BFAD9D8[*a1], 0);

  return global_queue;
}

uint64_t OS_dispatch_queue.label.getter()
{
  label = dispatch_queue_get_label(v0);
  uint64_t result = MEMORY[0x18C13AAC0](label);
  if (!v3) {
    __break(1u);
  }
  return result;
}

void protocol witness for Scheduler.schedule(after:interval:tolerance:options:_:) in conformance OS_dispatch_queue(dispatch_time_t *a1@<X0>, uint64_t *a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t *a6@<X8>)
{
}

void OS_dispatch_queue.schedule(after:interval:tolerance:options:_:)(dispatch_time_t *a1@<X0>, uint64_t *a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t *a6@<X8>)
{
  dispatch_time_t v10 = *a1;
  uint64_t v11 = *a2;
  uint64_t v12 = *a3;
  uint64_t v13 = _swift_dispatch_source_create_0(v6);
  if (((v12 | v11) & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else
  {
    id v14 = v13;
    dispatch_source_set_timer(v13, v10, v11, v12);
    v20[4] = a4;
    v20[5] = a5;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 1107296256;
    v20[2] = thunk for @escaping @callee_guaranteed () -> ();
    v20[3] = &block_descriptor_9;
    dispatch_block_flags_t v15 = _Block_copy(v20);
    swift_retain();
    specialized OS_dispatch_source.setEventHandler(qos:flags:handler:)(5, 0, 0, v15);
    _Block_release(v15);
    swift_release();
    dispatch_resume(v14);
    *(void *)(swift_allocObject() + 16) = v14;
    uint64_t v16 = type metadata accessor for AnyCancellable();
    swift_allocObject();
    uint64_t v17 = v14;
    uint64_t v18 = AnyCancellable.init(_:)();
    uint64_t v19 = MEMORY[0x1E4F1AB10];
    a6[3] = v16;
    a6[4] = v19;

    *a6 = v18;
  }
}

dispatch_source_t _swift_dispatch_source_create(const dispatch_source_type_s *a1, uintptr_t a2, uintptr_t a3, void *a4)
{
  id v7 = a4;
  dispatch_source_t v8 = dispatch_source_create(a1, a2, a3, v7);
  if (!v8) {
    _swift_dispatch_source_create_abort();
  }

  return v8;
}

dispatch_source_t _swift_dispatch_source_create_0(void *a1)
{
  id v1 = a1;
  dispatch_source_t v2 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v1);
  if (!v2) {
    _swift_dispatch_source_create_abort();
  }

  return v2;
}

void specialized OS_dispatch_source.setEventHandler(qos:flags:handler:)(char a1, uint64_t a2, uint64_t a3, void *aBlock)
{
  uint64_t v5 = v4;
  dispatch_block_flags_t v9 = _Block_copy(aBlock);
  if (v9 && (a1 != 5 || a2 || a3))
  {
    v12[0] = a1;
    uint64_t v13 = a2;
    uint64_t v11 = a3;
    type metadata accessor for DispatchWorkItem();
    swift_initStackObject();
    _Block_copy(v9);
    dispatch_time_t v10 = (void **)DispatchWorkItem.init(qos:flags:block:)(v12, (dispatch_block_flags_t *)&v11, v9);
    _swift_dispatch_source_set_event_handler_0(v5, v10[2]);
    swift_release();
    _Block_release(v9);
  }
  else
  {
    _swift_dispatch_source_set_event_handler_0(v5, v9);
    _Block_release(v9);
  }
}

void OS_dispatch_source.setEventHandler(qos:flags:handler:)(unsigned __int8 *a1, uint64_t *a2, void *aBlock, uint64_t a4, void (*a5)(uint64_t, void *))
{
  int v6 = *a1;
  uint64_t v7 = *((void *)a1 + 1);
  uint64_t v8 = *a2;
  dispatch_block_flags_t v9 = _Block_copy(aBlock);
  if (!v9 || (v6 == 5 ? (BOOL v10 = v7 == 0) : (BOOL v10 = 0), v10 ? (v11 = v8 == 0) : (v11 = 0), v11))
  {
    self;
    uint64_t v14 = swift_dynamicCastObjCClassUnconditional();
    a5(v14, v9);
    _Block_release(v9);
  }
  else
  {
    v16[0] = v6;
    uint64_t v17 = v7;
    uint64_t v15 = v8;
    type metadata accessor for DispatchWorkItem();
    swift_initStackObject();
    _Block_copy(v9);
    uint64_t v12 = DispatchWorkItem.init(qos:flags:block:)(v16, (dispatch_block_flags_t *)&v15, v9);
    self;
    uint64_t v13 = swift_dynamicCastObjCClassUnconditional();
    a5(v13, (void *)v12[2]);
    swift_release();
    _Block_release(v9);
  }
}

void _swift_dispatch_source_set_event_handler(void *a1, void *a2)
{
  uint64_t v3 = a1;
  id v4 = a2;
  dispatch_source_set_event_handler(v3, v4);
}

void _swift_dispatch_source_set_event_handler_0(void *a1, void *a2)
{
  uint64_t v3 = a1;
  id v4 = a2;
  dispatch_source_set_event_handler(v3, v4);
}

uint64_t protocol witness for Scheduler.schedule(after:tolerance:options:_:) in conformance OS_dispatch_queue(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return OS_dispatch_queue.schedule(after:tolerance:options:_:)(a1, a2, a3, a4, a5);
}

uint64_t OS_dispatch_queue.schedule(after:tolerance:options:_:)(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = *a1;
  if (*(void *)(a3 + 24) == 1)
  {
    uint64_t v6 = 0;
    uint64_t v7 = 0;
    char v8 = 5;
  }
  else
  {
    uint64_t v7 = *(void *)(a3 + 8);
    uint64_t v6 = *(void *)(a3 + 16);
    char v8 = *(unsigned char *)a3;
  }
  aBlock[4] = a4;
  aBlock[5] = a5;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = thunk for @escaping @callee_guaranteed () -> ();
  aBlock[3] = &block_descriptor_6;
  dispatch_block_flags_t v9 = _Block_copy(aBlock);
  BOOL v10 = _Block_copy(v9);
  uint64_t v14 = v7;
  uint64_t v15 = v5;
  v13[0] = v8;
  uint64_t v12 = v6;
  swift_retain();
  OS_dispatch_queue._asyncAfterUnsafeHelper(deadline:qos:flags:execute:)(&v15, v13, &v12, v10);
  _Block_release(v10);
  _Block_release(v9);
  return swift_release();
}

void OS_dispatch_queue.asyncAfterUnsafe(deadline:qos:flags:execute:)(dispatch_time_t *a1, uint64_t a2, uint64_t *a3, void *aBlock)
{
  dispatch_time_t v4 = *a1;
  unsigned __int8 v5 = *(unsigned char *)a2;
  uint64_t v6 = *(void *)(a2 + 8);
  uint64_t v7 = *a3;
  char v8 = _Block_copy(aBlock);
  uint64_t v11 = v6;
  dispatch_time_t v12 = v4;
  v10[0] = v5;
  uint64_t v9 = v7;
  OS_dispatch_queue._asyncAfterUnsafeHelper(deadline:qos:flags:execute:)(&v12, v10, (dispatch_block_flags_t *)&v9, v8);

  _Block_release(v8);
}

void OS_dispatch_queue._asyncAfterUnsafeHelper(deadline:qos:flags:execute:)(dispatch_time_t *a1, unsigned __int8 *a2, dispatch_block_flags_t *a3, void *aBlock)
{
  unsigned __int8 v5 = v4;
  dispatch_time_t v6 = *a1;
  int v7 = *a2;
  uint64_t v8 = *((void *)a2 + 1);
  dispatch_block_flags_t v9 = *a3;
  BOOL v10 = _Block_copy(aBlock);
  uint64_t v11 = v10;
  if (v7 == 5 && v8 == 0)
  {
    if (v9)
    {
      uint64_t v13 = _Block_copy(v10);
      id v14 = _swift_dispatch_block_create(v9, v13);
      _Block_release(v13);
      _Block_release(v11);
      uint64_t v11 = v14;
    }
  }
  else
  {
    v16[0] = v7;
    uint64_t v17 = v8;
    dispatch_block_flags_t v15 = v9;
    type metadata accessor for DispatchWorkItem();
    swift_initStackObject();
    uint64_t v11 = (void *)*((void *)DispatchWorkItem.init(qos:flags:block:)(v16, &v15, v11) + 2);
    _Block_copy(v11);
    swift_release();
  }
  _swift_dispatch_after(v6, v5, v11);
  _Block_release(v11);
}

void _swift_dispatch_after(dispatch_time_t a1, void *a2, void *a3)
{
  unsigned __int8 v5 = a2;
  id v6 = a3;
  dispatch_after(a1, v5, v6);
}

uint64_t type metadata accessor for DispatchWorkItem()
{
  return self;
}

void *DispatchWorkItem.init(qos:flags:block:)(char *a1, dispatch_block_flags_t *a2, void *aBlock)
{
  uint64_t v5 = *a1;
  uint64_t v6 = *((void *)a1 + 1);
  dispatch_block_flags_t v7 = *a2;
  uint64_t result = _Block_copy(aBlock);
  dispatch_block_flags_t v9 = result;
  if (v5 == 5 && v6 == 0)
  {
    dispatch_block_t v11 = _swift_dispatch_block_create(v7, result);
    goto LABEL_9;
  }
  if (v6 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
  }
  else if (v6 <= 0x7FFFFFFF)
  {
    dispatch_block_t v11 = _swift_dispatch_block_create_with_qos_class(v7, (dispatch_qos_class_t)dword_18BFAEC1C[v5], v6, result);
LABEL_9:
    dispatch_block_t v12 = v11;
    _Block_release(aBlock);
    _Block_release(v9);
    *(void *)(v3 + 16) = v12;
    return (void *)v3;
  }
  __break(1u);
  return result;
}

dispatch_block_t _swift_dispatch_block_create_with_qos_class(dispatch_block_flags_t a1, dispatch_qos_class_t a2, int a3, void *a4)
{
  id v7 = a4;
  dispatch_block_t v8 = dispatch_block_create_with_qos_class(a1, a2, a3, v7);

  return v8;
}

void _swift_dispatch_source_set_cancel_handler(void *a1, void *a2)
{
  uint64_t v3 = a1;
  id v4 = a2;
  dispatch_source_set_cancel_handler(v3, v4);
}

dispatch_time_t DispatchTime.advanced(by:)@<X0>(uint64_t a1@<X0>, dispatch_time_t *a2@<X8>)
{
  uint64_t v4 = *(void *)a1;
  int64_t v5 = *(void *)a1;
  switch(*(unsigned char *)(a1 + 8))
  {
    case 1:
      uint64_t v6 = 1000000;
      goto LABEL_5;
    case 2:
      uint64_t v6 = 1000;
      goto LABEL_5;
    case 3:
      goto LABEL_10;
    case 4:
      int64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
      goto LABEL_10;
    default:
      uint64_t v6 = 1000000000;
LABEL_5:
      int64_t v5 = v4 * v6;
      if ((unsigned __int128)(v4 * (__int128)v6) >> 64 != (v4 * v6) >> 63)
      {
        if (v4 > 0) {
          int64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
        }
        else {
          int64_t v5 = 0x8000000000000000;
        }
      }
LABEL_10:
      dispatch_time_t result = dispatch_time(*v2, v5);
      *a2 = result;
      return result;
  }
}

BOOL OS_dispatch_semaphore.wait(wallTimeout:)(dispatch_time_t *a1)
{
  return dispatch_semaphore_wait(v1, *a1) != 0;
}

uint64_t _dispatchPreconditionTest(_:)(uint64_t a1)
{
  dispatch_source_t v2 = *(NSObject **)a1;
  int v3 = *(unsigned __int8 *)(a1 + 8);
  if (v3)
  {
    if (v3 == 1) {
      dispatch_assert_queue_barrier(v2);
    }
    else {
      dispatch_assert_queue_not_V2(v2);
    }
  }
  else
  {
    dispatch_assert_queue_V2(v2);
  }
  return 1;
}

dispatch_time_t static DispatchTime.now()@<X0>(dispatch_time_t *a1@<X8>)
{
  dispatch_time_t result = dispatch_time(0, 0);
  *a1 = result;
  return result;
}

uint64_t OS_dispatch_queue.schedule(options:_:)(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  int v3 = (void *)a1[3];
  if (v3 == (void *)1)
  {
    uint64_t v4 = 0;
    uint64_t v5 = 0;
    LOBYTE(v6) = 5;
LABEL_5:
    uint64_t v20 = a2;
    uint64_t v21 = a3;
    uint64_t aBlock = MEMORY[0x1E4F143A8];
    uint64_t v17 = 1107296256;
    uint64_t v18 = thunk for @escaping @callee_guaranteed () -> ();
    uint64_t v19 = &block_descriptor_1;
    BOOL v10 = _Block_copy(&aBlock);
    dispatch_block_t v11 = _Block_copy(v10);
    v14[0] = v6;
    uint64_t v15 = v5;
    uint64_t v13 = v4;
    swift_retain();
    OS_dispatch_queue._asyncHelper(group:qos:flags:execute:)(0, v14, (dispatch_block_flags_t *)&v13, v11);
    _Block_release(v11);
    dispatch_block_flags_t v9 = v10;
    goto LABEL_6;
  }
  uint64_t v6 = *a1;
  uint64_t v5 = a1[1];
  uint64_t v4 = a1[2];
  if (!v3) {
    goto LABEL_5;
  }
  uint64_t v20 = a2;
  uint64_t v21 = a3;
  uint64_t aBlock = MEMORY[0x1E4F143A8];
  uint64_t v17 = 1107296256;
  uint64_t v18 = thunk for @escaping @callee_guaranteed () -> ();
  uint64_t v19 = &block_descriptor_3;
  id v7 = _Block_copy(&aBlock);
  dispatch_block_t v8 = _Block_copy(v7);
  v14[0] = v6;
  uint64_t v15 = v5;
  uint64_t v13 = v4;
  outlined copy of OS_dispatch_queue.SchedulerOptions?(v6, v5, v4, v3);
  outlined copy of OS_dispatch_queue.SchedulerOptions?(v6, v5, v4, v3);
  swift_retain();
  OS_dispatch_queue._asyncHelper(group:qos:flags:execute:)(v3, v14, (dispatch_block_flags_t *)&v13, v8);
  _Block_release(v8);
  outlined consume of OS_dispatch_queue.SchedulerOptions?(v6, v5, v4, (uint64_t)v3);
  outlined consume of OS_dispatch_queue.SchedulerOptions?(v6, v5, v4, (uint64_t)v3);
  dispatch_block_flags_t v9 = v7;
LABEL_6:
  _Block_release(v9);
  return swift_release();
}

void OS_dispatch_queue.asyncUnsafe(group:qos:flags:execute:)(void *a1, uint64_t a2, uint64_t *a3, void *aBlock)
{
  unsigned __int8 v5 = *(unsigned char *)a2;
  uint64_t v6 = *(void *)(a2 + 8);
  uint64_t v7 = *a3;
  dispatch_block_t v8 = _Block_copy(aBlock);
  v10[0] = v5;
  uint64_t v11 = v6;
  uint64_t v9 = v7;
  OS_dispatch_queue._asyncHelper(group:qos:flags:execute:)(a1, v10, (dispatch_block_flags_t *)&v9, v8);

  _Block_release(v8);
}

void OS_dispatch_queue._asyncHelper(group:qos:flags:execute:)(void *a1, unsigned __int8 *a2, dispatch_block_flags_t *a3, void *aBlock)
{
  unsigned __int8 v5 = v4;
  int v7 = *a2;
  uint64_t v8 = *((void *)a2 + 1);
  dispatch_block_flags_t v9 = *a3;
  BOOL v10 = _Block_copy(aBlock);
  uint64_t v11 = v10;
  if (a1) {
    goto LABEL_10;
  }
  if (v7 != 5 || v8 != 0) {
    goto LABEL_10;
  }
  if (v9 == DISPATCH_BLOCK_BARRIER)
  {
    _swift_dispatch_barrier_async(v5, v10);
  }
  else
  {
    if (v9)
    {
LABEL_10:
      if (v7 == 5 && v8 == 0)
      {
        if (v9)
        {
          id v14 = _Block_copy(v10);
          id v15 = _swift_dispatch_block_create(v9, v14);
          _Block_release(v14);
          _Block_release(v11);
          uint64_t v11 = v15;
        }
      }
      else
      {
        v18[0] = v7;
        uint64_t v19 = v8;
        dispatch_block_flags_t v17 = v9;
        type metadata accessor for DispatchWorkItem();
        swift_initStackObject();
        uint64_t v11 = (void *)*((void *)DispatchWorkItem.init(qos:flags:block:)(v18, &v17, v11) + 2);
        _Block_copy(v11);
        swift_release();
      }
      if (a1)
      {
        id v16 = a1;
        _swift_dispatch_group_async(v16, v5, v11);
        _Block_release(v11);
      }
      else
      {
        _swift_dispatch_async(v5, v11);
        _Block_release(v11);
      }
      return;
    }
    _swift_dispatch_async(v5, v10);
  }

  _Block_release(v11);
}

void _swift_dispatch_async(void *a1, void *a2)
{
  int v3 = a1;
  id v4 = a2;
  dispatch_async(v3, v4);
}

uint64_t OS_dispatch_queue.sync<A>(flags:execute:)@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v10 = *a1;
  if (*a1)
  {
    if (v10 != 1)
    {
      uint64_t v16 = swift_allocObject();
      *(void *)(v16 + 16) = v5;
      uint64_t v21 = v10;
      MEMORY[0x1F4188790](v16);
      uint64_t v20 = a4;
      id v17 = v5;
      OS_dispatch_queue._syncHelper<A>(fn:flags:execute:rescue:)((void (*)(uint64_t))partial apply for implicit closure #4 in implicit closure #3 in OS_dispatch_queue.sync<A>(flags:execute:), v16, (dispatch_block_flags_t *)&v21, a2, a3, (void (*)(void *))partial apply for closure #1 in OS_dispatch_queue.asyncAndWait<A>(execute:), (uint64_t)v19, a4, a5);
      return swift_release();
    }
    uint64_t v11 = swift_allocObject();
    *(void *)(v11 + 16) = v5;
    MEMORY[0x1F4188790](v11);
    uint64_t v20 = a4;
    id v12 = v5;
    uint64_t v13 = (void (*)(uint64_t (*)(), char *))partial apply for implicit closure #2 in implicit closure #1 in OS_dispatch_queue.sync<A>(flags:execute:);
  }
  else
  {
    uint64_t v14 = swift_allocObject();
    *(void *)(v14 + 16) = v5;
    MEMORY[0x1F4188790](v14);
    uint64_t v20 = a4;
    id v15 = v5;
    uint64_t v13 = (void (*)(uint64_t (*)(), char *))partial apply for implicit closure #6 in implicit closure #5 in OS_dispatch_queue.sync<A>(flags:execute:);
  }
  OS_dispatch_queue._syncHelper<A>(fn:execute:rescue:)(v13, a2, a3, (void (*)(id))partial apply for closure #1 in OS_dispatch_queue.asyncAndWait<A>(execute:), (uint64_t)v19, a4, a5);
  return swift_release();
}

uint64_t OS_dispatch_queue.sync<A>(execute:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  return OS_dispatch_queue.asyncAndWait<A>(execute:)(a1, a2, a3, (void (*)(uint64_t (*)(), char *))partial apply for implicit closure #2 in implicit closure #1 in OS_dispatch_queue.sync<A>(execute:), (void (*)(id))partial apply for closure #1 in OS_dispatch_queue.asyncAndWait<A>(execute:), a4);
}

uint64_t OS_dispatch_queue.asyncAndWait<A>(execute:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void (*a4)(uint64_t (*)(), char *)@<X4>, void (*a5)(id)@<X5>, uint64_t a6@<X8>)
{
  *(void *)(swift_allocObject() + 16) = v6;
  v15[2] = a3;
  id v13 = v6;
  OS_dispatch_queue._syncHelper<A>(fn:execute:rescue:)(a4, a1, a2, a5, (uint64_t)v15, a3, a6);
  return swift_release();
}

uint64_t OS_dispatch_queue._syncHelper<A>(fn:execute:rescue:)@<X0>(void (*a1)(uint64_t (*)(), char *)@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, void (*a4)(id)@<X4>, uint64_t a5@<X5>, uint64_t a6@<X6>, uint64_t a7@<X8>)
{
  uint64_t v25 = a7;
  uint64_t v23 = a5;
  uint64_t v24 = a4;
  v27 = a1;
  uint64_t v26 = type metadata accessor for Optional();
  uint64_t v10 = *(void *)(v26 - 8);
  uint64_t v11 = MEMORY[0x1F4188790](v26);
  id v13 = (char *)&v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v11);
  id v15 = (char *)&v23 - v14;
  uint64_t v16 = *(void *)(a6 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v16 + 56))((char *)&v23 - v14, 1, 1, a6);
  id v34 = 0;
  id v17 = (void *)swift_allocObject();
  v17[2] = a6;
  v17[3] = a2;
  v17[4] = a3;
  uint64_t v29 = a6;
  v30 = v15;
  v31 = thunk for @callee_guaranteed () -> (@out A, @error @owned Error)partial apply;
  v32 = v17;
  v33 = &v34;
  v27(partial apply for closure #1 in closure #1 in OS_dispatch_queue._syncHelper<A>(fn:execute:rescue:), v28);
  char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  uint64_t result = swift_release();
  if (isEscapingClosureAtFileLocation)
  {
    __break(1u);
LABEL_8:
    __break(1u);
    return result;
  }
  id v20 = v34;
  if (v34)
  {
    id v21 = v34;
    v24(v20);

    return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v15, v26);
  }
  uint64_t v22 = v26;
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v13, v15, v26);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v16 + 48))(v13, 1, a6);
  if (result == 1) {
    goto LABEL_8;
  }
  (*(void (**)(char *, uint64_t))(v10 + 8))(v15, v22);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v16 + 32))(v25, v13, a6);
}

uint64_t partial apply for implicit closure #2 in implicit closure #1 in OS_dispatch_queue.sync<A>(execute:)(uint64_t a1, uint64_t a2)
{
  return implicit closure #2 in implicit closure #1 in OS_dispatch_queue.asyncAndWait<A>(execute:)(a1, a2, *(void *)(v2 + 16), (uint64_t)&unk_1ED98CD20, (uint64_t)thunk for @callee_guaranteed () -> ()partial apply, (uint64_t)&block_descriptor_55, MEMORY[0x1E4F147E8]);
}

uint64_t implicit closure #2 in implicit closure #1 in OS_dispatch_queue.asyncAndWait<A>(execute:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void (*a7)(uint64_t, void *))
{
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = a1;
  *(void *)(v13 + 24) = a2;
  v16[4] = a5;
  v16[5] = v13;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 1107296256;
  v16[2] = thunk for @escaping @callee_guaranteed () -> ();
  v16[3] = a6;
  uint64_t v14 = _Block_copy(v16);
  swift_retain();
  swift_release();
  a7(a3, v14);
  _Block_release(v14);
  LOBYTE(a7) = swift_isEscapingClosureAtFileLocation();
  uint64_t result = swift_release();
  if (a7) {
    __break(1u);
  }
  return result;
}

void OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)(uint64_t a1, uint64_t a2, char *a3, uint64_t *a4, unsigned __int8 *a5, NSObject *a6)
{
  uint64_t v7 = *a3;
  uint64_t v8 = *((void *)a3 + 1);
  uint64_t v9 = *a4;
  dispatch_autorelease_frequency_t v10 = (unint64_t)*a5;
  if ((*a4 & 2) != 0)
  {
    uint64_t v11 = (id)_swift_dispatch_queue_concurrent();
    if ((v9 & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  uint64_t v11 = 0;
  if ((v9 & 4) != 0)
  {
LABEL_5:
    uint64_t v12 = dispatch_queue_attr_make_initially_inactive(v11);

    uint64_t v11 = v12;
  }
LABEL_6:
  if (v10)
  {
    if (v10 == DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM) {
      dispatch_autorelease_frequency_t v13 = v10;
    }
    else {
      dispatch_autorelease_frequency_t v13 = DISPATCH_AUTORELEASE_FREQUENCY_NEVER;
    }
    uint64_t v14 = dispatch_queue_attr_make_with_autorelease_frequency(v11, v13);

    uint64_t v11 = v14;
  }
  if (v7 == 5 && v8 == 0) {
    goto LABEL_18;
  }
  if (v8 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
  }
  else if (v8 <= 0x7FFFFFFF)
  {
    uint64_t v16 = dispatch_queue_attr_make_with_qos_class(v11, (dispatch_qos_class_t)dword_18BFADA08[v7], v8);

    uint64_t v11 = v16;
LABEL_18:
    uint64_t v17 = String.utf8CString.getter();
    swift_bridgeObjectRelease();
    dispatch_queue_create_with_target_V2((const char *)(v17 + 32), v11, a6);
    swift_release();

    return;
  }
  __break(1u);
}

uint64_t static OS_dispatch_queue.getSpecific<A>(key:)@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *a1;
  specific = (char *)dispatch_get_specific(a1);
  if (specific)
  {
    unsigned __int8 v5 = &specific[*(void *)(*(void *)specific + 88)];
    uint64_t v6 = *(void *)(v3 + 80);
    uint64_t v13 = *(void *)(v6 - 8);
    uint64_t v7 = *(void (**)(uint64_t, char *, uint64_t))(v13 + 16);
    swift_retain();
    v7(a2, v5, v6);
    swift_release();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v13 + 56);
    uint64_t v9 = a2;
    uint64_t v10 = 0;
    uint64_t v11 = v6;
  }
  else
  {
    uint64_t v11 = *(void *)(v3 + 80);
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56);
    uint64_t v9 = a2;
    uint64_t v10 = 1;
  }

  return v8(v9, v10, 1, v11);
}

uint64_t _swift_dispatch_queue_concurrent()
{
  uint64_t v0 = MEMORY[0x1E4F14430];
  id v1 = MEMORY[0x1E4F14430];
  return v0;
}

uint64_t partial apply for implicit closure #2 in implicit closure #1 in OS_dispatch_queue.sync<A>(flags:execute:)(uint64_t a1, uint64_t a2)
{
  return implicit closure #2 in implicit closure #1 in OS_dispatch_queue.sync<A>(flags:execute:)(a1, a2, *(NSObject **)(v2 + 16));
}

uint64_t implicit closure #2 in implicit closure #1 in OS_dispatch_queue.sync<A>(flags:execute:)(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = a1;
  *(void *)(v6 + 24) = a2;
  void v9[4] = partial apply for thunk for @callee_guaranteed () -> ();
  v9[5] = v6;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 1107296256;
  v9[2] = thunk for @escaping @callee_guaranteed () -> ();
  v9[3] = &block_descriptor_41;
  uint64_t v7 = _Block_copy(v9);
  swift_retain();
  swift_release();
  dispatch_barrier_sync(a3, v7);
  _Block_release(v7);
  LOBYTE(a3) = swift_isEscapingClosureAtFileLocation();
  uint64_t result = swift_release();
  if (a3) {
    __break(1u);
  }
  return result;
}

void _swift_dispatch_barrier_async(void *a1, void *a2)
{
  uint64_t v3 = a1;
  id v4 = a2;
  dispatch_barrier_async(v3, v4);
}

uint64_t ___swift_dispatch_apply_current_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

ValueMetadata *type metadata accessor for OS_dispatch_queue.SchedulerOptions()
{
  return &type metadata for OS_dispatch_queue.SchedulerOptions;
}

void OS_dispatch_group.notify(queue:work:)(void *a1, uint64_t a2)
{
  _swift_dispatch_group_notify(v2, a1, *(void **)(a2 + 16));
}

Dispatch::DispatchQoS __swiftcall DispatchQoS.init(qosClass:relativePriority:)(Dispatch::DispatchQoS::QoSClass qosClass, Swift::Int relativePriority)
{
  *(unsigned char *)uint64_t v2 = *(unsigned char *)qosClass;
  *(void *)(v2 + 8) = relativePriority;
  result.relativePriority = relativePriority;
  result.qosClass = qosClass;
  return result;
}

BOOL static DispatchTimeoutResult.== infix(_:_:)(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

Swift::Void __swiftcall DispatchWorkItem.perform()()
{
  (*(void (**)(void))(*(void *)(v0 + 16) + 16))();
}

ValueMetadata *type metadata accessor for OS_dispatch_source.TimerFlags()
{
  return &type metadata for OS_dispatch_source.TimerFlags;
}

uint64_t thunk for @escaping @callee_guaranteed (@unowned Int) -> ()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a1 + 32))(a2);
}

uint64_t partial apply for thunk for @callee_guaranteed (@unowned Int) -> ()()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

void static DispatchQoS.utility.getter(uint64_t a1@<X8>)
{
  *(unsigned char *)a1 = 1;
  *(void *)(a1 + 8) = 0;
}

void static DispatchQoS.background.getter(uint64_t a1@<X8>)
{
  *(unsigned char *)a1 = 0;
  *(void *)(a1 + 8) = 0;
}

void static DispatchQoS.userInitiated.getter(uint64_t a1@<X8>)
{
  *(unsigned char *)a1 = 3;
  *(void *)(a1 + 8) = 0;
}

void OS_dispatch_source.setEventHandler(qos:flags:handler:)(unsigned __int8 *a1, uint64_t *a2, void *a3, uint64_t a4)
{
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance DispatchQoS(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2 && *((void *)a1 + 1) == *((void *)a2 + 1);
}

uint64_t storeEnumTagSinglePayload for OS_dispatch_queue.SchedulerOptions(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)Dispatch::DispatchQoS result = a2 - 0x7FFFFFFF;
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
      *(void *)(result + 24) = a2;
    }
  }
  return result;
}

uint64_t dispatch thunk of DispatchWorkItem.perform()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 128))();
}

dispatch_source_t static OS_dispatch_source.makeTimerSource(flags:queue:)(uintptr_t *a1, void *a2)
{
  return _swift_dispatch_source_create(MEMORY[0x1E4F14490], 0, *a1, a2);
}

Swift::Void __swiftcall OS_dispatch_source.activate()()
{
  OS_dispatch_source.activate()(v0, MEMORY[0x1E4F14750]);
}

Swift::Void __swiftcall DispatchWorkItem.cancel()()
{
  _swift_dispatch_block_cancel(*(void **)(v0 + 16));
}

uint64_t __swift_memcpy9_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *(unsigned char *)(result + 8) = *((unsigned char *)a2 + 8);
  *(void *)Dispatch::DispatchQoS result = v2;
  return result;
}

void *protocol witness for OptionSet.init(rawValue:) in conformance OS_dispatch_queue.Attributes@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

void OS_dispatch_queue.async(execute:)(uint64_t a1)
{
  _swift_dispatch_async(v1, *(void **)(a1 + 16));
}

void protocol witness for SerialExecutor.checkIsolated() in conformance OS_dispatch_queue_serial_executor()
{
  dispatch_assert_queue_V2(v0);
}

ValueMetadata *type metadata accessor for OS_dispatch_queue.SchedulerTimeType.Stride()
{
  return &type metadata for OS_dispatch_queue.SchedulerTimeType.Stride;
}

Swift::Void __swiftcall OS_dispatch_group.wait()()
{
  dispatch_group_wait(v0, 0xFFFFFFFFFFFFFFFFLL);
}

void OS_dispatch_queue.asyncAfter(wallDeadline:execute:)(dispatch_time_t *a1, uint64_t a2)
{
  _swift_dispatch_after(*a1, v2, *(void **)(a2 + 16));
}

Dispatch::DispatchQoS::QoSClass_optional __swiftcall DispatchQoS.QoSClass.init(rawValue:)(qos_class_t rawValue)
{
  char v2 = 1;
  switch(rawValue)
  {
    case QOS_CLASS_UNSPECIFIED:
      *id v1 = 5;
      break;
    case QOS_CLASS_BACKGROUND:
      char v2 = 0;
      goto LABEL_5;
    case QOS_CLASS_UTILITY:
LABEL_5:
      *id v1 = v2;
      break;
    case QOS_CLASS_DEFAULT:
      *id v1 = 2;
      break;
    case QOS_CLASS_USER_INITIATED:
      *id v1 = 3;
      break;
    case QOS_CLASS_USER_INTERACTIVE:
      *id v1 = 4;
      break;
    default:
      *id v1 = 6;
      break;
  }
  return (Dispatch::DispatchQoS::QoSClass_optional)rawValue;
}

void static DispatchQoS.default.getter(uint64_t a1@<X8>)
{
  *(unsigned char *)a1 = 2;
  *(void *)(a1 + 8) = 0;
}

uint64_t getEnumTagSinglePayload for DispatchQoS.QoSClass(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFB) {
    goto LABEL_17;
  }
  if (a2 + 5 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 5) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 5;
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
      return (*a1 | (v4 << 8)) - 5;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 5;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 6;
  int v8 = v6 - 6;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

Swift::Void __swiftcall OS_dispatch_source.resume()()
{
  OS_dispatch_source.activate()(v0, MEMORY[0x1E4F147B8]);
}

void static DispatchTime.distantFuture.getter(void *a1@<X8>)
{
  *a1 = -1;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *Dispatch::DispatchQoS result = *a2;
  return result;
}

void static DispatchQoS.userInteractive.getter(uint64_t a1@<X8>)
{
  *(unsigned char *)a1 = 4;
  *(void *)(a1 + 8) = 0;
}

ValueMetadata *type metadata accessor for OS_dispatch_source.MemoryPressureEvent()
{
  return &type metadata for OS_dispatch_source.MemoryPressureEvent;
}

uint64_t type metadata instantiation function for DispatchSpecificKey()
{
  return MEMORY[0x1F41863F0]();
}

void static OS_dispatch_source.FileSystemEvent.write.getter(void *a1@<X8>)
{
  *a1 = 2;
}

uint64_t dispatch thunk of DispatchWorkItem.cancel()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 176))();
}

uint64_t getEnumTagSinglePayload for DispatchQoS(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFB && a1[16]) {
    return (*(_DWORD *)a1 + 251);
  }
  unsigned int v3 = *a1;
  BOOL v4 = v3 >= 6;
  int v5 = v3 - 6;
  if (!v4) {
    int v5 = -1;
  }
  return (v5 + 1);
}

ValueMetadata *type metadata accessor for OS_dispatch_queue_serial.Attributes()
{
  return &type metadata for OS_dispatch_queue_serial.Attributes;
}

void static OS_dispatch_queue.Attributes.initiallyInactive.getter(void *a1@<X8>)
{
  *a1 = 4;
}

dispatch_source_t static OS_dispatch_source.makeMemoryPressureSource(eventMask:queue:)(uintptr_t *a1, void *a2)
{
  return _swift_dispatch_source_create(MEMORY[0x1E4F14468], 0, *a1, a2);
}

uint64_t protocol witness for SerialExecutor.enqueue(_:) in conformance OS_dispatch_queue_serial_executor()
{
  uint64_t v1 = UnownedJob.init(_:)();
  _swift_job_set_executor_queue(v1, v0);
  uint64_t v2 = _swift_job_priority(v1);

  return MEMORY[0x1F40CB980](v0, v1, v2);
}

uint64_t _swift_job_set_executor_queue(uint64_t result, uint64_t a2)
{
  *(void *)(result + 24) = a2;
  return result;
}

uint64_t _swift_job_priority(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 33);
}

uint64_t storeEnumTagSinglePayload for DispatchQoS(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFA)
  {
    *(void *)Dispatch::DispatchQoS result = a2 - 251;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFB) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFB) {
      *(unsigned char *)(result + 16) = 0;
    }
    if (a2) {
      *(unsigned char *)Dispatch::DispatchQoS result = a2 + 5;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for DispatchData()
{
  return &type metadata for DispatchData;
}

unint64_t DispatchTime.uptimeNanoseconds.getter()
{
  unint64_t v1 = *v0;
  if (*v0 == -1) {
    return v1;
  }
  if (one-time initialization token for timebaseInfo != -1) {
    unint64_t result = swift_once();
  }
  if (static DispatchTime.timebaseInfo == HIDWORD(static DispatchTime.timebaseInfo)) {
    return v1;
  }
  if (!is_mul_ok(v1, static DispatchTime.timebaseInfo)) {
    return -1;
  }
  if (HIDWORD(static DispatchTime.timebaseInfo)) {
    return v1 * static DispatchTime.timebaseInfo / HIDWORD(static DispatchTime.timebaseInfo);
  }
  __break(1u);
  return result;
}

dispatch_source_t static OS_dispatch_source.makeSignalSource(signal:queue:)(NSObject *a1, void *a2)
{
  return static OS_dispatch_source.makeReadSource(fileDescriptor:queue:)(a1, a2, MEMORY[0x1E4F14480]);
}

uint64_t getEnumTag for DispatchTimeInterval(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 8) <= 3u) {
    return *(unsigned __int8 *)(a1 + 8);
  }
  else {
    return (*(_DWORD *)a1 + 4);
  }
}

id DispatchData._bridgeToObjectiveC()()
{
  return *v0;
}

ValueMetadata *type metadata accessor for OS_dispatch_queue.SchedulerTimeType()
{
  return &type metadata for OS_dispatch_queue.SchedulerTimeType;
}

Swift::Void __swiftcall OS_dispatch_source.suspend()()
{
  OS_dispatch_source.activate()(v0, MEMORY[0x1E4F147E0]);
}

uint64_t @objc _destructDispatchSpecificValue(ptr:)(uint64_t result)
{
  if (result) {
    return swift_unknownObjectRelease();
  }
  return result;
}

void static OS_dispatch_source.TimerFlags.strict.getter(void *a1@<X8>)
{
  *a1 = 1;
}

unint64_t lazy protocol witness table accessor for type OS_dispatch_queue.Attributes and conformance OS_dispatch_queue.Attributes()
{
  unint64_t result = lazy protocol witness table cache variable for type OS_dispatch_queue.Attributes and conformance OS_dispatch_queue.Attributes;
  if (!lazy protocol witness table cache variable for type OS_dispatch_queue.Attributes and conformance OS_dispatch_queue.Attributes)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OS_dispatch_queue.Attributes and conformance OS_dispatch_queue.Attributes);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type OS_dispatch_queue.Attributes and conformance OS_dispatch_queue.Attributes;
  if (!lazy protocol witness table cache variable for type OS_dispatch_queue.Attributes and conformance OS_dispatch_queue.Attributes)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OS_dispatch_queue.Attributes and conformance OS_dispatch_queue.Attributes);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type OS_dispatch_queue.Attributes and conformance OS_dispatch_queue.Attributes;
  if (!lazy protocol witness table cache variable for type OS_dispatch_queue.Attributes and conformance OS_dispatch_queue.Attributes)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OS_dispatch_queue.Attributes and conformance OS_dispatch_queue.Attributes);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type OS_dispatch_queue.Attributes and conformance OS_dispatch_queue.Attributes;
  if (!lazy protocol witness table cache variable for type OS_dispatch_queue.Attributes and conformance OS_dispatch_queue.Attributes)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OS_dispatch_queue.Attributes and conformance OS_dispatch_queue.Attributes);
  }
  return result;
}

uint64_t static OS_dispatch_queue.SchedulerTimeType.Stride.milliseconds(_:)@<X0>(uint64_t result@<X0>, uint64_t *a2@<X8>)
{
  unint64_t v2 = 0x7FFFFFFFFFFFFFFFLL;
  if (result <= 0) {
    unint64_t v2 = 0x8000000000000000;
  }
  if ((unsigned __int128)(result * (__int128)1000000) >> 64 == (1000000 * result) >> 63) {
    uint64_t v3 = 1000000 * result;
  }
  else {
    uint64_t v3 = v2;
  }
  *a2 = v3;
  return result;
}

dispatch_source_t static OS_dispatch_source.makeReadSource(fileDescriptor:queue:)(dispatch_source_t result, void *a2, const dispatch_source_type_s *a3)
{
  if ((result & 0x80000000) == 0) {
    return _swift_dispatch_source_create(a3, result, 0, a2);
  }
  __break(1u);
  return result;
}

void static OS_dispatch_queue.SchedulerTimeType.Stride.seconds(_:)(uint64_t *a1@<X8>, double a2@<D0>)
{
  double v2 = trunc(a2 * 1000000000.0);
  uint64_t v3 = 0x8000000000000000;
  if (a2 > 0.0) {
    uint64_t v3 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if (v2 < 9.22337204e18 && v2 > -9.22337204e18) {
    uint64_t v3 = (uint64_t)(a2 * 1000000000.0);
  }
  *a1 = v3;
}

uint64_t type metadata accessor for DispatchSpecificKey()
{
  return __swift_instantiateGenericMetadata();
}

void static OS_dispatch_source.FileSystemEvent.extend.getter(void *a1@<X8>)
{
  *a1 = 4;
}

uint64_t DispatchSpecificKey.init()()
{
  return v0;
}

ValueMetadata *type metadata accessor for OS_dispatch_source.FileSystemEvent()
{
  return &type metadata for OS_dispatch_source.FileSystemEvent;
}

uint64_t static OS_dispatch_queue.SchedulerTimeType.Stride.seconds(_:)@<X0>(uint64_t result@<X0>, uint64_t *a2@<X8>)
{
  unint64_t v2 = 0x7FFFFFFFFFFFFFFFLL;
  if (result <= 0) {
    unint64_t v2 = 0x8000000000000000;
  }
  if ((unsigned __int128)(result * (__int128)1000000000) >> 64 == (1000000000 * result) >> 63) {
    uint64_t v3 = 1000000000 * result;
  }
  else {
    uint64_t v3 = v2;
  }
  *a2 = v3;
  return result;
}

unint64_t lazy protocol witness table accessor for type OS_dispatch_source.TimerFlags and conformance OS_dispatch_source.TimerFlags()
{
  unint64_t result = lazy protocol witness table cache variable for type OS_dispatch_source.TimerFlags and conformance OS_dispatch_source.TimerFlags;
  if (!lazy protocol witness table cache variable for type OS_dispatch_source.TimerFlags and conformance OS_dispatch_source.TimerFlags)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OS_dispatch_source.TimerFlags and conformance OS_dispatch_source.TimerFlags);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type OS_dispatch_source.TimerFlags and conformance OS_dispatch_source.TimerFlags;
  if (!lazy protocol witness table cache variable for type OS_dispatch_source.TimerFlags and conformance OS_dispatch_source.TimerFlags)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OS_dispatch_source.TimerFlags and conformance OS_dispatch_source.TimerFlags);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type OS_dispatch_source.TimerFlags and conformance OS_dispatch_source.TimerFlags;
  if (!lazy protocol witness table cache variable for type OS_dispatch_source.TimerFlags and conformance OS_dispatch_source.TimerFlags)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OS_dispatch_source.TimerFlags and conformance OS_dispatch_source.TimerFlags);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type OS_dispatch_source.TimerFlags and conformance OS_dispatch_source.TimerFlags;
  if (!lazy protocol witness table cache variable for type OS_dispatch_source.TimerFlags and conformance OS_dispatch_source.TimerFlags)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OS_dispatch_source.TimerFlags and conformance OS_dispatch_source.TimerFlags);
  }
  return result;
}

uint64_t dispatch thunk of DispatchWorkItem.isCancelled.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 184))();
}

void OS_dispatch_queue.SchedulerTimeType.Stride.init(floatLiteral:)(uint64_t *a1@<X8>, double a2@<D0>)
{
  double v2 = trunc(a2 * 1000000000.0);
  uint64_t v3 = 0x8000000000000000;
  if (a2 > 0.0) {
    uint64_t v3 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if (v2 < 9.22337204e18 && v2 > -9.22337204e18) {
    uint64_t v3 = (uint64_t)(a2 * 1000000000.0);
  }
  *a1 = v3;
}

unint64_t lazy protocol witness table accessor for type OS_dispatch_queue.SchedulerTimeType and conformance OS_dispatch_queue.SchedulerTimeType()
{
  unint64_t result = lazy protocol witness table cache variable for type OS_dispatch_queue.SchedulerTimeType and conformance OS_dispatch_queue.SchedulerTimeType;
  if (!lazy protocol witness table cache variable for type OS_dispatch_queue.SchedulerTimeType and conformance OS_dispatch_queue.SchedulerTimeType)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OS_dispatch_queue.SchedulerTimeType and conformance OS_dispatch_queue.SchedulerTimeType);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type OS_dispatch_queue.SchedulerTimeType and conformance OS_dispatch_queue.SchedulerTimeType;
  if (!lazy protocol witness table cache variable for type OS_dispatch_queue.SchedulerTimeType and conformance OS_dispatch_queue.SchedulerTimeType)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OS_dispatch_queue.SchedulerTimeType and conformance OS_dispatch_queue.SchedulerTimeType);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type OS_dispatch_queue.SchedulerTimeType and conformance OS_dispatch_queue.SchedulerTimeType;
  if (!lazy protocol witness table cache variable for type OS_dispatch_queue.SchedulerTimeType and conformance OS_dispatch_queue.SchedulerTimeType)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OS_dispatch_queue.SchedulerTimeType and conformance OS_dispatch_queue.SchedulerTimeType);
  }
  return result;
}

uint64_t type metadata completion function for DispatchSpecificKey()
{
  return swift_initClassMetadata2();
}

unint64_t lazy protocol witness table accessor for type DispatchTime and conformance DispatchTime()
{
  unint64_t result = lazy protocol witness table cache variable for type DispatchTime and conformance DispatchTime;
  if (!lazy protocol witness table cache variable for type DispatchTime and conformance DispatchTime)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type DispatchTime and conformance DispatchTime);
  }
  return result;
}

ValueMetadata *type metadata accessor for DispatchWallTime()
{
  return &type metadata for DispatchWallTime;
}

id static DispatchData.empty.getter@<X0>(void *a1@<X8>)
{
  if (one-time initialization token for empty != -1) {
    swift_once();
  }
  double v2 = (void *)static DispatchData.empty;
  *a1 = static DispatchData.empty;

  return v2;
}

double one-time initialization function for timebaseInfo()
{
  v1[1] = *(mach_timebase_info *)MEMORY[0x1E4F143B8];
  v1[0] = (mach_timebase_info)0x100000001;
  mach_timebase_info(v1);
  double result = *(double *)v1;
  static DispatchTime.timebaseInfo = (uint64_t)v1[0];
  return result;
}

uint64_t _DispatchSpecificValue.__deallocating_deinit()
{
  (*(void (**)(uint64_t))(*(void *)(*(void *)(*(void *)v0 + 80) - 8) + 8))(v0 + *(void *)(*(void *)v0 + 88));
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x1F4186488](v0, v1, v2);
}

uint64_t type metadata completion function for _DispatchSpecificValue()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_initClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

void OS_dispatch_source.setCancelHandler(qos:flags:handler:)(unsigned __int8 *a1, uint64_t *a2, void *a3, uint64_t a4)
{
}

uint64_t OS_dispatch_source.setEventHandler(handler:)(uint64_t a1, uint64_t a2)
{
  return OS_dispatch_source.setEventHandler(handler:)(a1, a2, (uint64_t (*)(uint64_t, uint64_t))_swift_dispatch_source_set_event_handler);
}

unint64_t lazy protocol witness table accessor for type OS_dispatch_source.MemoryPressureEvent and conformance OS_dispatch_source.MemoryPressureEvent()
{
  unint64_t result = lazy protocol witness table cache variable for type OS_dispatch_source.MemoryPressureEvent and conformance OS_dispatch_source.MemoryPressureEvent;
  if (!lazy protocol witness table cache variable for type OS_dispatch_source.MemoryPressureEvent and conformance OS_dispatch_source.MemoryPressureEvent)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OS_dispatch_source.MemoryPressureEvent and conformance OS_dispatch_source.MemoryPressureEvent);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type OS_dispatch_source.MemoryPressureEvent and conformance OS_dispatch_source.MemoryPressureEvent;
  if (!lazy protocol witness table cache variable for type OS_dispatch_source.MemoryPressureEvent and conformance OS_dispatch_source.MemoryPressureEvent)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OS_dispatch_source.MemoryPressureEvent and conformance OS_dispatch_source.MemoryPressureEvent);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type OS_dispatch_source.MemoryPressureEvent and conformance OS_dispatch_source.MemoryPressureEvent;
  if (!lazy protocol witness table cache variable for type OS_dispatch_source.MemoryPressureEvent and conformance OS_dispatch_source.MemoryPressureEvent)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OS_dispatch_source.MemoryPressureEvent and conformance OS_dispatch_source.MemoryPressureEvent);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type OS_dispatch_source.MemoryPressureEvent and conformance OS_dispatch_source.MemoryPressureEvent;
  if (!lazy protocol witness table cache variable for type OS_dispatch_source.MemoryPressureEvent and conformance OS_dispatch_source.MemoryPressureEvent)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OS_dispatch_source.MemoryPressureEvent and conformance OS_dispatch_source.MemoryPressureEvent);
  }
  return result;
}

unint64_t *DispatchTime.distance(to:)@<X0>(unint64_t *result@<X0>, uint64_t a2@<X8>)
{
  unint64_t v4 = *result;
  unint64_t v5 = *v2;
  if (*result == -1) {
    goto LABEL_7;
  }
  if (one-time initialization token for timebaseInfo != -1) {
    unint64_t result = (unint64_t *)swift_once();
  }
  if (static DispatchTime.timebaseInfo == HIDWORD(static DispatchTime.timebaseInfo))
  {
LABEL_7:
    if (v5 == -1) {
      goto LABEL_16;
    }
    goto LABEL_8;
  }
  if (!is_mul_ok(v4, static DispatchTime.timebaseInfo))
  {
    unint64_t v4 = -1;
    goto LABEL_7;
  }
  if (!HIDWORD(static DispatchTime.timebaseInfo))
  {
    __break(1u);
    goto LABEL_26;
  }
  unint64_t v4 = v4 * static DispatchTime.timebaseInfo / HIDWORD(static DispatchTime.timebaseInfo);
  if (v5 == -1)
  {
LABEL_16:
    unint64_t v7 = v4 - v5;
    BOOL v6 = (uint64_t)(v4 - v5) < 0;
    if (v4 >= v5) {
      goto LABEL_21;
    }
    goto LABEL_17;
  }
LABEL_8:
  if (one-time initialization token for timebaseInfo != -1) {
    unint64_t result = (unint64_t *)swift_once();
  }
  if (static DispatchTime.timebaseInfo == HIDWORD(static DispatchTime.timebaseInfo)) {
    goto LABEL_16;
  }
  if (!is_mul_ok(v5, static DispatchTime.timebaseInfo))
  {
    unint64_t v5 = -1;
    unint64_t v7 = v4 + 1;
    BOOL v6 = (uint64_t)(v4 + 1) < 0;
    if (v4 == -1)
    {
LABEL_21:
      if (!v6)
      {
        char v8 = 3;
        goto LABEL_24;
      }
      goto LABEL_23;
    }
LABEL_17:
    if ((uint64_t)(v5 - v4) >= 0)
    {
      unint64_t v7 = v4 - v5;
      char v8 = 3;
LABEL_24:
      *(void *)a2 = v7;
      *(unsigned char *)(a2 + 8) = v8;
      return result;
    }
LABEL_23:
    unint64_t v7 = 0;
    char v8 = 4;
    goto LABEL_24;
  }
  if (HIDWORD(static DispatchTime.timebaseInfo))
  {
    unint64_t v5 = v5 * static DispatchTime.timebaseInfo / HIDWORD(static DispatchTime.timebaseInfo);
    unint64_t v7 = v4 - v5;
    BOOL v6 = (uint64_t)(v4 - v5) < 0;
    if (v4 >= v5) {
      goto LABEL_21;
    }
    goto LABEL_17;
  }
LABEL_26:
  __break(1u);
  return result;
}

unint64_t lazy protocol witness table accessor for type OS_dispatch_queue_serial.Attributes and conformance OS_dispatch_queue_serial.Attributes()
{
  unint64_t result = lazy protocol witness table cache variable for type OS_dispatch_queue_serial.Attributes and conformance OS_dispatch_queue_serial.Attributes;
  if (!lazy protocol witness table cache variable for type OS_dispatch_queue_serial.Attributes and conformance OS_dispatch_queue_serial.Attributes)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OS_dispatch_queue_serial.Attributes and conformance OS_dispatch_queue_serial.Attributes);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type OS_dispatch_queue_serial.Attributes and conformance OS_dispatch_queue_serial.Attributes;
  if (!lazy protocol witness table cache variable for type OS_dispatch_queue_serial.Attributes and conformance OS_dispatch_queue_serial.Attributes)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OS_dispatch_queue_serial.Attributes and conformance OS_dispatch_queue_serial.Attributes);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type OS_dispatch_queue_serial.Attributes and conformance OS_dispatch_queue_serial.Attributes;
  if (!lazy protocol witness table cache variable for type OS_dispatch_queue_serial.Attributes and conformance OS_dispatch_queue_serial.Attributes)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OS_dispatch_queue_serial.Attributes and conformance OS_dispatch_queue_serial.Attributes);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type OS_dispatch_queue_serial.Attributes and conformance OS_dispatch_queue_serial.Attributes;
  if (!lazy protocol witness table cache variable for type OS_dispatch_queue_serial.Attributes and conformance OS_dispatch_queue_serial.Attributes)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OS_dispatch_queue_serial.Attributes and conformance OS_dispatch_queue_serial.Attributes);
  }
  return result;
}

uint64_t OS_dispatch_queue.SchedulerTimeType.Stride.init(integerLiteral:)@<X0>(uint64_t result@<X0>, uint64_t *a2@<X8>)
{
  unint64_t v2 = 0x7FFFFFFFFFFFFFFFLL;
  if (result <= 0) {
    unint64_t v2 = 0x8000000000000000;
  }
  if ((unsigned __int128)(result * (__int128)1000000000) >> 64 == (1000000000 * result) >> 63) {
    uint64_t v3 = 1000000000 * result;
  }
  else {
    uint64_t v3 = v2;
  }
  *a2 = v3;
  return result;
}

uint64_t OS_dispatch_queue.SchedulerTimeType.Stride.init(_:)@<X0>(uint64_t result@<X0>, unint64_t *a2@<X8>)
{
  uint64_t v2 = *(void *)result;
  unint64_t v3 = *(void *)result;
  switch(*(unsigned char *)(result + 8))
  {
    case 1:
      uint64_t v4 = 1000000;
      goto LABEL_5;
    case 2:
      uint64_t v4 = 1000;
      goto LABEL_5;
    case 3:
      goto LABEL_8;
    case 4:
      *a2 = 0x7FFFFFFFFFFFFFFFLL;
      return result;
    default:
      uint64_t v4 = 1000000000;
LABEL_5:
      unint64_t v3 = v2 * v4;
      if ((unsigned __int128)(v2 * (__int128)v4) >> 64 != (v2 * v4) >> 63)
      {
        unint64_t v3 = 0x7FFFFFFFFFFFFFFFLL;
        if (v2 <= 0) {
          unint64_t v3 = 0x8000000000000000;
        }
      }
LABEL_8:
      *a2 = v3;
      return result;
  }
}

unsigned char *storeEnumTagSinglePayload for DispatchQoS.QoSClass(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 5 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 5) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFB) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFA)
  {
    unsigned int v6 = ((a2 - 251) >> 8) + 1;
    *unint64_t result = a2 + 5;
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
        break;
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
          *unint64_t result = a2 + 5;
        break;
    }
  }
  return result;
}

void _swift_dispatch_source_create_abort()
{
}

id one-time initialization function for empty()
{
  id result = (id)_swift_dispatch_data_empty();
  static DispatchData.empty = (uint64_t)result;
  return result;
}

id DispatchData.init(bytes:)@<X0>(const void *a1@<X0>, size_t a2@<X1>, void *a3@<X8>)
{
  if (a1)
  {
    id v6 = 0;
    _swift_dispatch_data_create(a1, a2, 0, v6);
    _Block_release(v6);
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
    type metadata accessor for OS_dispatch_data();
    swift_dynamicCast();
    id result = v8;
  }
  else
  {
    id result = (id)_swift_dispatch_data_empty();
  }
  *a3 = result;
  return result;
}

uint64_t _swift_dispatch_data_empty()
{
  uint64_t v0 = MEMORY[0x1E4F14410];
  id v1 = MEMORY[0x1E4F14410];
  return v0;
}

dispatch_data_t _swift_dispatch_data_create(const void *a1, size_t a2, void *a3, void *a4)
{
  unint64_t v7 = a3;
  id v8 = a4;
  dispatch_data_t v9 = dispatch_data_create(a1, a2, v7, v8);

  return v9;
}

unint64_t type metadata accessor for OS_dispatch_data()
{
  unint64_t result = lazy cache variable for type metadata for OS_dispatch_data;
  if (!lazy cache variable for type metadata for OS_dispatch_data)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&lazy cache variable for type metadata for OS_dispatch_data);
  }
  return result;
}

id DispatchData.init(bytes:)@<X0>(const void *a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  if (a1)
  {
    size_t v5 = a2 - (void)a1;
    id v6 = 0;
    _swift_dispatch_data_create(a1, v5, 0, v6);
    _Block_release(v6);
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
    type metadata accessor for OS_dispatch_data();
    swift_dynamicCast();
    id result = v8;
  }
  else
  {
    id result = (id)_swift_dispatch_data_empty();
  }
  *a3 = result;
  return result;
}

void DispatchData.init(bytesNoCopy:deallocator:)(const void *a1@<X0>, size_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X8>)
{
  id v7 = *(id *)(a3 + 8);
  if (v7)
  {
    if (v7 != (id)1)
    {
      id v11 = *(id *)a3;
      id v9 = *(id *)a3;
      _Block_copy(v7);
      outlined consume of DispatchData.Deallocator(v11, v7);
      if (a1) {
        goto LABEL_6;
      }
LABEL_8:
      id v10 = (id)_swift_dispatch_data_empty();
      _Block_release(v7);

      goto LABEL_9;
    }
    id v8 = _swift_dispatch_data_destructor_munmap();
  }
  else
  {
    id v8 = _swift_dispatch_data_destructor_free();
  }
  id v7 = v8;
  id v9 = 0;
  if (!a1) {
    goto LABEL_8;
  }
LABEL_6:
  _swift_dispatch_data_create(a1, a2, v9, v7);
  _bridgeAnyObjectToAny(_:)();
  _Block_release(v7);

  swift_unknownObjectRelease();
  type metadata accessor for OS_dispatch_data();
  swift_dynamicCast();
  id v10 = v12;
LABEL_9:
  *a4 = v10;
}

void outlined consume of DispatchData.Deallocator(void *a1, const void *a2)
{
  if ((unint64_t)a2 >= 2)
  {

    _Block_release(a2);
  }
}

id _swift_dispatch_data_destructor_munmap()
{
  uint64_t v0 = _Block_copy((const void *)*MEMORY[0x1E4F143F8]);

  return v0;
}

id _swift_dispatch_data_destructor_free()
{
  uint64_t v0 = _Block_copy((const void *)*MEMORY[0x1E4F143F0]);

  return v0;
}

void DispatchData.init(bytesNoCopy:deallocator:)(const void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X8>)
{
  id v7 = *(id *)(a3 + 8);
  if (v7)
  {
    if (v7 != (id)1)
    {
      id v11 = *(id *)a3;
      id v9 = *(id *)a3;
      _Block_copy(v7);
      outlined consume of DispatchData.Deallocator(v11, v7);
      if (a1) {
        goto LABEL_6;
      }
LABEL_8:
      id v10 = (id)_swift_dispatch_data_empty();
      _Block_release(v7);

      goto LABEL_9;
    }
    id v8 = _swift_dispatch_data_destructor_munmap();
  }
  else
  {
    id v8 = _swift_dispatch_data_destructor_free();
  }
  id v7 = v8;
  id v9 = 0;
  if (!a1) {
    goto LABEL_8;
  }
LABEL_6:
  _swift_dispatch_data_create(a1, a2 - (void)a1, v9, v7);
  _bridgeAnyObjectToAny(_:)();
  _Block_release(v7);

  swift_unknownObjectRelease();
  type metadata accessor for OS_dispatch_data();
  swift_dynamicCast();
  id v10 = v12;
LABEL_9:
  *a4 = v10;
}

size_t DispatchData.count.getter()
{
  return dispatch_data_get_size(*v0);
}

void DispatchData.withUnsafeBytes<A, B>(body:)(void (*a1)(void), uint64_t a2, uint64_t a3, uint64_t a4)
{
  buffer_ptr[1] = *(void **)MEMORY[0x1E4F143B8];
  id v7 = *v4;
  size_t size_ptr = 0;
  buffer_ptr[0] = 0;
  dispatch_data_t v8 = dispatch_data_create_map(v7, (const void **)buffer_ptr, &size_ptr);
  if (!buffer_ptr[0]) {
LABEL_10:
  }
    __break(1u);
  uint64_t v9 = *(void *)(*(void *)(a4 - 8) + 72);
  if (!v9)
  {
    __break(1u);
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  if (v9 == -1 && size_ptr == 0x8000000000000000) {
    goto LABEL_9;
  }
  a1();
}

uint64_t DispatchData.enumerateBytes(_:)(uint64_t a1, uint64_t a2)
{
  size_t v5 = *v2;
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = a1;
  *(void *)(v6 + 24) = a2;
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = partial apply for closure #1 in DispatchData.enumerateBytesCommon(_:);
  *(void *)(v7 + 24) = v6;
  v10[4] = partial apply for thunk for @callee_guaranteed (@in_guaranteed Any, @unowned Int, @unowned UnsafeRawPointer, @unowned Int) -> (@unowned UInt32);
  v10[5] = v7;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 1107296256;
  v10[2] = thunk for @escaping @callee_guaranteed (@in_guaranteed Any, @unowned Int, @unowned UnsafeRawPointer, @unowned Int) -> (@unowned UInt32);
  v10[3] = &block_descriptor;
  dispatch_data_t v8 = _Block_copy(v10);
  swift_retain();
  swift_release();
  _swift_dispatch_data_apply(v5, v8);
  _Block_release(v8);
  LOBYTE(v5) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  uint64_t result = swift_release();
  if (v5) {
    __break(1u);
  }
  return result;
}

uint64_t DispatchData.enumerateBytes(block:)(uint64_t a1, uint64_t a2)
{
  size_t v5 = *v2;
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = a1;
  *(void *)(v6 + 24) = a2;
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = partial apply for closure #1 in DispatchData.enumerateBytesCommon(_:);
  *(void *)(v7 + 24) = v6;
  v10[4] = thunk for @callee_guaranteed (@in_guaranteed Any, @unowned Int, @unowned UnsafeRawPointer, @unowned Int) -> (@unowned UInt32)partial apply;
  v10[5] = v7;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 1107296256;
  v10[2] = thunk for @escaping @callee_guaranteed (@in_guaranteed Any, @unowned Int, @unowned UnsafeRawPointer, @unowned Int) -> (@unowned UInt32);
  v10[3] = &block_descriptor_16;
  dispatch_data_t v8 = _Block_copy(v10);
  swift_retain();
  swift_release();
  _swift_dispatch_data_apply(v5, v8);
  _Block_release(v8);
  LOBYTE(v5) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  uint64_t result = swift_release();
  if (v5) {
    __break(1u);
  }
  return result;
}

uint64_t sub_18BFA1664()
{
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_18BFA1678()
{
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t partial apply for thunk for @callee_guaranteed (@in_guaranteed Any, @unowned Int, @unowned UnsafeRawPointer, @unowned Int) -> (@unowned UInt32)()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t thunk for @escaping @callee_guaranteed (@in_guaranteed Any, @unowned Int, @unowned UnsafeRawPointer, @unowned Int) -> (@unowned UInt32)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9 = *(uint64_t (**)(void *, uint64_t, uint64_t, uint64_t))(a1 + 32);
  v12[3] = swift_getObjectType();
  v12[0] = a2;
  swift_unknownObjectRetain();
  uint64_t v10 = v9(v12, a3, a4, a5);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v10;
}

void _swift_dispatch_data_apply(void *a1, void *a2)
{
  applier[0] = MEMORY[0x1E4F143A8];
  applier[1] = 3221225472;
  applier[2] = ___swift_dispatch_data_apply_block_invoke;
  applier[3] = &unk_1E54D7A28;
  uint64_t v7 = a2;
  int v3 = a1;
  id v4 = a2;
  dispatch_data_apply(v3, applier);
  size_t v5 = v7;
}

uint64_t sub_18BFA17E0()
{
  return MEMORY[0x1F4186498](v0, 32, 7);
}

BOOL partial apply for closure #1 in DispatchData.enumerateBytesCommon(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  size_t v5 = *(void (**)(uint64_t, uint64_t, uint64_t, char *))(v4 + 16);
  char v7 = 0;
  v5(a3, a4, a2, &v7);
  return (v7 & 1) == 0;
}

uint64_t sub_18BFA1844()
{
  return MEMORY[0x1F4186498](v0, 32, 7);
}

void DispatchData.append(_:count:)(const void *a1, size_t a2)
{
  id v5 = 0;
  _swift_dispatch_data_create(a1, a2, 0, v5);
  _Block_release(v5);
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  type metadata accessor for OS_dispatch_data();
  swift_dynamicCast();
  uint64_t v6 = *v2;
  char v7 = v9;
  dispatch_data_t concat = dispatch_data_create_concat(v6, v7);

  unint64_t *v2 = concat;
}

void DispatchData.append(_:)(dispatch_data_t *a1)
{
  dispatch_data_t v2 = *v1;
  dispatch_data_t concat = dispatch_data_create_concat(*v1, *a1);

  *id v1 = concat;
}

void DispatchData.append(_:)(const void *a1, uint64_t a2)
{
  if (a1)
  {
    size_t v4 = a2 - (void)a1;
    id v5 = 0;
    _swift_dispatch_data_create(a1, v4, 0, v5);
    _Block_release(v5);
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
    type metadata accessor for OS_dispatch_data();
    swift_dynamicCast();
    uint64_t v6 = *v2;
    char v7 = v9;
    dispatch_data_t concat = dispatch_data_create_concat(v6, v7);

    unint64_t *v2 = concat;
  }
}

void DispatchData.append<A>(_:)()
{
  uint64_t v1 = MEMORY[0x18C13AAE0]();
  if (v1)
  {
    int v3 = (const void *)v1;
    size_t v4 = v2 - v1;
    id v5 = 0;
    _swift_dispatch_data_create(v3, v4, 0, v5);
    _Block_release(v5);
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
    type metadata accessor for OS_dispatch_data();
    swift_dynamicCast();
    uint64_t v6 = *v0;
    char v7 = v9;
    dispatch_data_t concat = dispatch_data_create_concat(v6, v7);

    dispatch_data_t *v0 = concat;
  }
}

uint64_t DispatchData._copyBytesHelper(to:from:)(uint64_t result, uint64_t a2, uint64_t a3)
{
  size_t v4 = *v3;
  uint64_t v14 = 0;
  if (a2 != a3)
  {
    uint64_t v7 = a3 - a2;
    if (__OFSUB__(a3, a2))
    {
      __break(1u);
    }
    else
    {
      uint64_t v8 = result;
      uint64_t v9 = (void *)swift_allocObject();
      v9[2] = a2;
      v9[3] = a3;
      void v9[4] = v7;
      v9[5] = &v14;
      void v9[6] = v8;
      uint64_t v10 = swift_allocObject();
      *(void *)(v10 + 16) = partial apply for closure #1 in DispatchData._copyBytesHelper(to:from:);
      *(void *)(v10 + 24) = v9;
      aBlock[4] = thunk for @callee_guaranteed (@guaranteed OS_dispatch_data, @unowned Int, @unowned UnsafeRawPointer, @unowned Int) -> (@unowned Bool)partial apply;
      aBlock[5] = v10;
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 1107296256;
      aBlock[2] = thunk for @escaping @callee_guaranteed (@guaranteed OS_dispatch_data, @unowned Int, @unowned UnsafeRawPointer, @unowned Int) -> (@unowned Bool);
      aBlock[3] = &block_descriptor_69;
      id v11 = _Block_copy(aBlock);
      swift_retain();
      swift_release();
      dispatch_data_apply(v4, v11);
      _Block_release(v11);
      char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
      swift_release();
      uint64_t result = swift_release();
      if ((isEscapingClosureAtFileLocation & 1) == 0) {
        return result;
      }
    }
    __break(1u);
  }
  return result;
}

uint64_t closure #1 in DispatchData._copyBytesHelper(to:from:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int64_t a7, int64_t *a8, uint64_t a9)
{
  if (a2 >= a6) {
    return 0;
  }
  if (a2 >= a5)
  {
    if (a4 < 1) {
      return 1;
    }
    uint64_t v11 = 0;
  }
  else
  {
    uint64_t v11 = a5 - a2;
    if (__OFSUB__(a5, a2))
    {
      __break(1u);
      goto LABEL_18;
    }
    if (v11 >= a4) {
      return 1;
    }
  }
  if (__OFSUB__(a7, *a8))
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  if (!__OFSUB__(a4, v11))
  {
    if (a4 - v11 >= a7 - *a8) {
      size_t v13 = a7 - *a8;
    }
    else {
      size_t v13 = a4 - v11;
    }
    uint64_t result = (uint64_t)memcpy((void *)(a9 + *a8), (const void *)(a3 + v11), v13);
    int64_t v14 = *a8 + v13;
    if (!__OFADD__(*a8, v13))
    {
      *a8 = v14;
      return v14 < a7;
    }
    goto LABEL_20;
  }
LABEL_19:
  __break(1u);
LABEL_20:
  __break(1u);
  return result;
}

uint64_t thunk for @escaping @callee_guaranteed (@guaranteed OS_dispatch_data, @unowned Int, @unowned UnsafeRawPointer, @unowned Int) -> (@unowned Bool)(uint64_t a1, void *a2)
{
  uint64_t v2 = *(uint64_t (**)(void))(a1 + 32);
  id v3 = a2;
  char v4 = v2();

  return v4 & 1;
}

uint64_t DispatchData.copyBytes(to:count:)(uint64_t result, uint64_t a2)
{
  if (a2 < 0)
  {
    __break(1u);
LABEL_6:
    __break(1u);
    return result;
  }
  char v4 = *v2;
  uint64_t v11 = 0;
  if (a2)
  {
    uint64_t v5 = result;
    uint64_t v6 = (void *)swift_allocObject();
    v6[2] = 0;
    v6[3] = a2;
    v6[4] = a2;
    v6[5] = &v11;
    v6[6] = v5;
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = partial apply for closure #1 in DispatchData._copyBytesHelper(to:from:);
    *(void *)(v7 + 24) = v6;
    aBlock[4] = partial apply for thunk for @callee_guaranteed (@guaranteed OS_dispatch_data, @unowned Int, @unowned UnsafeRawPointer, @unowned Int) -> (@unowned Bool);
    aBlock[5] = v7;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 1107296256;
    aBlock[2] = thunk for @escaping @callee_guaranteed (@guaranteed OS_dispatch_data, @unowned Int, @unowned UnsafeRawPointer, @unowned Int) -> (@unowned Bool);
    aBlock[3] = &block_descriptor_25;
    uint64_t v8 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    dispatch_data_apply(v4, v8);
    _Block_release(v8);
    char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
    swift_release();
    uint64_t result = swift_release();
    if (isEscapingClosureAtFileLocation) {
      goto LABEL_6;
    }
  }
  return result;
}

uint64_t sub_18BFA1F10()
{
  return MEMORY[0x1F4186498](v0, 56, 7);
}

uint64_t sub_18BFA1F24()
{
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t partial apply for thunk for @callee_guaranteed (@guaranteed OS_dispatch_data, @unowned Int, @unowned UnsafeRawPointer, @unowned Int) -> (@unowned Bool)()
{
  return (*(uint64_t (**)(void))(v0 + 16))() & 1;
}

uint64_t DispatchData.copyBytes(to:count:)(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (result)
  {
    if (a3 < 0)
    {
      __break(1u);
    }
    else
    {
      uint64_t v5 = *v3;
      uint64_t v12 = 0;
      if (!a3) {
        return result;
      }
      uint64_t v6 = result;
      uint64_t v7 = (void *)swift_allocObject();
      v7[2] = 0;
      v7[3] = a3;
      v7[4] = a3;
      v7[5] = &v12;
      v7[6] = v6;
      uint64_t v8 = swift_allocObject();
      *(void *)(v8 + 16) = partial apply for closure #1 in DispatchData._copyBytesHelper(to:from:);
      *(void *)(v8 + 24) = v7;
      aBlock[4] = thunk for @callee_guaranteed (@guaranteed OS_dispatch_data, @unowned Int, @unowned UnsafeRawPointer, @unowned Int) -> (@unowned Bool)partial apply;
      aBlock[5] = v8;
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 1107296256;
      aBlock[2] = thunk for @escaping @callee_guaranteed (@guaranteed OS_dispatch_data, @unowned Int, @unowned UnsafeRawPointer, @unowned Int) -> (@unowned Bool);
      aBlock[3] = &block_descriptor_36;
      uint64_t v9 = _Block_copy(aBlock);
      swift_retain();
      swift_release();
      dispatch_data_apply(v5, v9);
      _Block_release(v9);
      char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
      swift_release();
      uint64_t result = swift_release();
      if ((isEscapingClosureAtFileLocation & 1) == 0) {
        return result;
      }
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_18BFA20D0()
{
  return MEMORY[0x1F4186498](v0, 56, 7);
}

uint64_t sub_18BFA20E0()
{
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t DispatchData.copyBytes(to:from:)(uint64_t result, uint64_t a2, uint64_t a3)
{
  char v4 = *v3;
  uint64_t v14 = 0;
  if (a2 != a3)
  {
    uint64_t v7 = a3 - a2;
    if (__OFSUB__(a3, a2))
    {
      __break(1u);
    }
    else
    {
      uint64_t v8 = result;
      uint64_t v9 = (void *)swift_allocObject();
      v9[2] = a2;
      v9[3] = a3;
      void v9[4] = v7;
      v9[5] = &v14;
      void v9[6] = v8;
      uint64_t v10 = swift_allocObject();
      *(void *)(v10 + 16) = partial apply for closure #1 in DispatchData._copyBytesHelper(to:from:);
      *(void *)(v10 + 24) = v9;
      aBlock[4] = thunk for @callee_guaranteed (@guaranteed OS_dispatch_data, @unowned Int, @unowned UnsafeRawPointer, @unowned Int) -> (@unowned Bool)partial apply;
      aBlock[5] = v10;
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 1107296256;
      aBlock[2] = thunk for @escaping @callee_guaranteed (@guaranteed OS_dispatch_data, @unowned Int, @unowned UnsafeRawPointer, @unowned Int) -> (@unowned Bool);
      aBlock[3] = &block_descriptor_47;
      uint64_t v11 = _Block_copy(aBlock);
      swift_retain();
      swift_release();
      dispatch_data_apply(v4, v11);
      _Block_release(v11);
      char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
      swift_release();
      uint64_t result = swift_release();
      if ((isEscapingClosureAtFileLocation & 1) == 0) {
        return result;
      }
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_18BFA2268()
{
  return MEMORY[0x1F4186498](v0, 56, 7);
}

uint64_t sub_18BFA2278()
{
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t DispatchData.copyBytes(to:from:)(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (result)
  {
    uint64_t v7 = *v4;
    uint64_t v14 = 0;
    if (a3 != a4)
    {
      if (__OFSUB__(a4, a3))
      {
        __break(1u);
      }
      else
      {
        uint64_t v8 = result;
        uint64_t v9 = (void *)swift_allocObject();
        v9[2] = a3;
        v9[3] = a4;
        void v9[4] = a4 - a3;
        v9[5] = &v14;
        void v9[6] = v8;
        uint64_t v10 = swift_allocObject();
        *(void *)(v10 + 16) = partial apply for closure #1 in DispatchData._copyBytesHelper(to:from:);
        *(void *)(v10 + 24) = v9;
        aBlock[4] = thunk for @callee_guaranteed (@guaranteed OS_dispatch_data, @unowned Int, @unowned UnsafeRawPointer, @unowned Int) -> (@unowned Bool)partial apply;
        aBlock[5] = v10;
        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 1107296256;
        aBlock[2] = thunk for @escaping @callee_guaranteed (@guaranteed OS_dispatch_data, @unowned Int, @unowned UnsafeRawPointer, @unowned Int) -> (@unowned Bool);
        aBlock[3] = &block_descriptor_58;
        uint64_t v11 = _Block_copy(aBlock);
        swift_retain();
        swift_release();
        dispatch_data_apply(v7, v11);
        _Block_release(v11);
        char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
        swift_release();
        uint64_t result = swift_release();
        if ((isEscapingClosureAtFileLocation & 1) == 0) {
          return result;
        }
      }
      __break(1u);
    }
  }
  return result;
}

uint64_t sub_18BFA2404()
{
  return MEMORY[0x1F4186498](v0, 56, 7);
}

uint64_t sub_18BFA2414()
{
  return MEMORY[0x1F4186498](v0, 32, 7);
}

int64_t DispatchData.copyBytes<A>(to:from:)(uint64_t a1, uint64_t a2, uint64_t a3, int64_t a4, char a5, uint64_t a6)
{
  int64_t result = dispatch_data_get_size(*v6);
  if (result < 1) {
    return 0;
  }
  if ((a5 & 1) == 0)
  {
    int64_t v14 = a4 - a3;
    if (a4 == a3) {
      return 0;
    }
    if (result >= a4 && ((a4 | a3) & 0x8000000000000000) == 0 && result > a3)
    {
      uint64_t v18 = *(void *)(*(void *)(a6 - 8) + 72);
      if ((unsigned __int128)(a2 * (__int128)v18) >> 64 == (a2 * v18) >> 63)
      {
        if (v14 >= a2 * v18) {
          int64_t v14 = a2 * v18;
        }
        uint64_t v17 = a3 + v14;
        if (!__OFADD__(a3, v14))
        {
          if (v17 >= a3) {
            goto LABEL_19;
          }
LABEL_28:
          __break(1u);
          goto LABEL_29;
        }
LABEL_27:
        __break(1u);
        goto LABEL_28;
      }
LABEL_26:
      __break(1u);
      goto LABEL_27;
    }
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  uint64_t v16 = *(void *)(*(void *)(a6 - 8) + 72);
  if ((unsigned __int128)(a2 * (__int128)v16) >> 64 != (a2 * v16) >> 63)
  {
    __break(1u);
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  if (result >= a2 * v16) {
    uint64_t v17 = a2 * v16;
  }
  else {
    uint64_t v17 = result;
  }
  if (v17 < 0) {
    goto LABEL_24;
  }
  a3 = 0;
LABEL_19:
  uint64_t v15 = v17 - a3;
  if (v17 == a3) {
    return v15;
  }
  int64_t result = MEMORY[0x18C13AB40](a1, a2, a6);
  if (result)
  {
    DispatchData._copyBytesHelper(to:from:)(result, a3, v17);
    return v15;
  }
LABEL_29:
  __break(1u);
  return result;
}

uint64_t DispatchData.subscript.getter(size_t location)
{
  buffer_ptr[1] = *(void **)MEMORY[0x1E4F143B8];
  id v3 = *v1;
  size_t offset_ptr = 0;
  char v4 = dispatch_data_copy_region(v3, location, &offset_ptr);
  buffer_ptr[0] = 0;
  size_t v8 = 0;
  dispatch_data_t v5 = dispatch_data_create_map(v4, (const void **)buffer_ptr, &v8);
  if (!buffer_ptr[0]) {
LABEL_5:
  }
    __break(1u);
  if (__OFSUB__(location, offset_ptr))
  {
    __break(1u);
    goto LABEL_5;
  }
  uint64_t v6 = *((unsigned __int8 *)buffer_ptr[0] + location - offset_ptr);

  return v6;
}

id DispatchData.subscript.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  char v4 = *v3;
  a3[1] = a2;
  a3[2] = v4;
  *a3 = a1;
  return v4;
}

dispatch_data_t DispatchData.subdata(in:)@<X0>(dispatch_data_t offset@<X0>, uint64_t a2@<X1>, dispatch_data_t *a3@<X8>)
{
  if (__OFSUB__(a2, offset))
  {
    __break(1u);
  }
  else
  {
    offset = dispatch_data_create_subrange(*v3, (size_t)offset, a2 - (void)offset);
    *a3 = offset;
  }
  return offset;
}

size_t DispatchData.region(location:)(dispatch_data_t *a1, size_t a2)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  char v4 = *v2;
  v6[0] = 0;
  *a1 = dispatch_data_copy_region(v4, a2, v6);
  return v6[0];
}

uint64_t DispatchData.startIndex.getter()
{
  return 0;
}

Swift::Int __swiftcall DispatchData.index(before:)(Swift::Int before)
{
  BOOL v1 = __OFSUB__(before, 1);
  Swift::Int result = before - 1;
  if (v1) {
    __break(1u);
  }
  return result;
}

Swift::Int __swiftcall DispatchData.index(after:)(Swift::Int after)
{
  BOOL v1 = __OFADD__(after, 1);
  Swift::Int result = after + 1;
  if (v1) {
    __break(1u);
  }
  return result;
}

dispatch_data_t DispatchData.makeIterator()@<X0>(dispatch_data_t *a1@<X8>)
{
  v8[2] = *MEMORY[0x1E4F143B8];
  id v3 = *v1;
  uint64_t v7 = 0;
  v8[0] = 0;
  dispatch_data_t result = dispatch_data_create_map(v3, (const void **)&v7, v8);
  dispatch_data_t v5 = v7;
  size_t v6 = v8[0];
  *a1 = result;
  a1[1] = v5;
  a1[2] = (dispatch_data_t)v6;
  a1[3] = 0;
  return result;
}

void DispatchDataIterator.init(_data:)(NSObject **a1@<X0>, dispatch_data_t *a2@<X8>)
{
  v8[2] = *MEMORY[0x1E4F143B8];
  id v3 = *a1;
  uint64_t v7 = 0;
  v8[0] = 0;
  dispatch_data_t map = dispatch_data_create_map(v3, (const void **)&v7, v8);

  dispatch_data_t v5 = v7;
  size_t v6 = v8[0];
  *a2 = map;
  a2[1] = v5;
  a2[2] = (dispatch_data_t)v6;
  a2[3] = 0;
}

id protocol witness for _ObjectiveCBridgeable._bridgeToObjectiveC() in conformance DispatchData()
{
  return *v0;
}

id protocol witness for static _ObjectiveCBridgeable._forceBridgeFromObjectiveC(_:result:) in conformance DispatchData(void *a1, id *a2)
{
  *a2 = a1;

  return a1;
}

id static DispatchData._forceBridgeFromObjectiveC(_:result:)(void *a1, id *a2)
{
  *a2 = a1;

  return a1;
}

uint64_t protocol witness for static _ObjectiveCBridgeable._conditionallyBridgeFromObjectiveC(_:result:) in conformance DispatchData(void *a1, id *a2)
{
  *a2 = a1;
  id v4 = a1;
  return 1;
}

uint64_t static DispatchData._conditionallyBridgeFromObjectiveC(_:result:)(void *a1, id *a2)
{
  *a2 = a1;
  id v4 = a1;
  return 1;
}

id protocol witness for static _ObjectiveCBridgeable._unconditionallyBridgeFromObjectiveC(_:) in conformance DispatchData@<X0>(id result@<X0>, id *a2@<X8>)
{
  if (result)
  {
    *a2 = result;
    return result;
  }
  else
  {
    __break(1u);
  }
  return result;
}

id static DispatchData._unconditionallyBridgeFromObjectiveC(_:)@<X0>(id result@<X0>, id *a2@<X8>)
{
  if (result)
  {
    *a2 = result;
    return result;
  }
  else
  {
    __break(1u);
  }
  return result;
}

void *protocol witness for BidirectionalCollection.index(before:) in conformance DispatchData@<X0>(void *result@<X0>, void *a2@<X8>)
{
  if (__OFSUB__(*result, 1)) {
    __break(1u);
  }
  else {
    *a2 = *result - 1;
  }
  return result;
}

void *protocol witness for BidirectionalCollection.formIndex(before:) in conformance DispatchData(void *result)
{
  if (__OFSUB__(*result, 1)) {
    __break(1u);
  }
  else {
    --*result;
  }
  return result;
}

uint64_t protocol witness for BidirectionalCollection.index(_:offsetBy:) in conformance DispatchData@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t result = specialized BidirectionalCollection.index(_:offsetBy:)(*a1, a2);
  *a3 = result;
  return result;
}

uint64_t protocol witness for BidirectionalCollection.distance(from:to:) in conformance DispatchData(uint64_t *a1, uint64_t *a2)
{
  return specialized BidirectionalCollection.distance(from:to:)(*a1, *a2);
}

size_t protocol witness for Collection.endIndex.getter in conformance DispatchData@<X0>(size_t *a1@<X8>)
{
  size_t result = dispatch_data_get_size(*v1);
  *a1 = result;
  return result;
}

uint64_t (*protocol witness for Collection.subscript.read in conformance DispatchData(unsigned char *a1, size_t *a2))()
{
  *a1 = DispatchData.subscript.getter(*a2);
  return protocol witness for Collection.subscript.read in conformance DispatchData;
}

id protocol witness for Collection.subscript.getter in conformance DispatchData@<X0>(_OWORD *a1@<X0>, uint64_t a2@<X8>)
{
  id v3 = *v2;
  *(void *)(a2 + 16) = *v2;
  *(_OWORD *)a2 = *a1;
  return v3;
}

NSObject *protocol witness for Collection.indices.getter in conformance DispatchData@<X0>(NSObject **a1@<X8>)
{
  id v3 = *v1;
  *a1 = *v1;
  a1[1] = 0;
  a1[2] = dispatch_data_get_size(v3);

  return v3;
}

BOOL protocol witness for Collection.isEmpty.getter in conformance DispatchData()
{
  return dispatch_data_get_size(*v0) == 0;
}

void protocol witness for Collection._customIndexOfEquatableElement(_:) in conformance DispatchData(uint64_t a1@<X8>)
{
  *(void *)a1 = 0;
  *(_WORD *)(a1 + 8) = 256;
}

uint64_t protocol witness for RandomAccessCollection.index(_:offsetBy:limitedBy:) in conformance DispatchData@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t result = specialized RandomAccessCollection.index(_:offsetBy:limitedBy:)(*a1, a2, *a3);
  *(void *)a4 = result;
  *(unsigned char *)(a4 + 8) = v6 & 1;
  return result;
}

uint64_t *protocol witness for Collection._failEarlyRangeCheck(_:bounds:) in conformance DispatchData(uint64_t *result, uint64_t *a2)
{
  uint64_t v2 = *result;
  uint64_t v3 = a2[1];
  if (*result >= *a2)
  {
    BOOL v5 = __OFSUB__(v2, v3);
    BOOL v4 = v2 - v3 < 0;
  }
  else
  {
    BOOL v5 = 0;
    BOOL v4 = 0;
  }
  if (v4 == v5) {
    __break(1u);
  }
  return result;
}

void *protocol witness for Collection._failEarlyRangeCheck(_:bounds:) in conformance DispatchData(void *result, void *a2)
{
  if (*result < *a2 || a2[1] < *result) {
    __break(1u);
  }
  return result;
}

{
  if (*result < *a2 || a2[1] < result[1]) {
    __break(1u);
  }
  return result;
}

void *protocol witness for Collection.index(after:) in conformance DispatchData@<X0>(void *result@<X0>, void *a2@<X8>)
{
  if (__OFADD__(*result, 1)) {
    __break(1u);
  }
  else {
    *a2 = *result + 1;
  }
  return result;
}

void *protocol witness for Collection.formIndex(after:) in conformance DispatchData(void *result)
{
  if (__OFADD__(*result, 1)) {
    __break(1u);
  }
  else {
    ++*result;
  }
  return result;
}

void protocol witness for Sequence.makeIterator() in conformance DispatchData(dispatch_data_t *a1@<X8>)
{
  v8[2] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *v1;
  uint64_t v7 = 0;
  v8[0] = 0;
  dispatch_data_t map = dispatch_data_create_map(v3, (const void **)&v7, v8);

  BOOL v5 = v7;
  size_t v6 = v8[0];
  *a1 = map;
  a1[1] = v5;
  a1[2] = (dispatch_data_t)v6;
  a1[3] = 0;
}

size_t protocol witness for Sequence.underestimatedCount.getter in conformance DispatchData()
{
  return dispatch_data_get_size(*v0);
}

uint64_t protocol witness for Sequence._customContainsEquatableElement(_:) in conformance DispatchData()
{
  return 2;
}

uint64_t protocol witness for Sequence._copyToContiguousArray() in conformance DispatchData()
{
  BOOL v1 = *v0;
  specialized _copyCollectionToContiguousArray<A>(_:)(*v0);
  uint64_t v3 = v2;

  return v3;
}

size_t protocol witness for Sequence._copyContents(initializing:) in conformance DispatchData(dispatch_data_t *a1, unsigned char *a2, size_t a3)
{
  return specialized Sequence._copySequenceContents(initializing:)(a1, a2, a3, *v3);
}

uint64_t protocol witness for Sequence.withContiguousStorageIfAvailable<A>(_:) in conformance DispatchData()
{
  return Sequence.withContiguousStorageIfAvailable<A>(_:)();
}

Swift::UInt8_optional __swiftcall DispatchDataIterator.next()()
{
  uint64_t v2 = v0[2];
  uint64_t v1 = v0[3];
  if (v1 != v2)
  {
    uint64_t v4 = v0[1];
    if (v4)
    {
      if (!__OFADD__(v1, 1))
      {
        __int16 v3 = *(unsigned __int8 *)(v4 + v1);
        v0[3] = v1 + 1;
        return (Swift::UInt8_optional)(v3 | ((v1 == v2) << 8));
      }
      __break(1u);
    }
    __break(1u);
    return v5;
  }
  __int16 v3 = 0;
  return (Swift::UInt8_optional)(v3 | ((v1 == v2) << 8));
}

unint64_t lazy protocol witness table accessor for type DispatchData and conformance DispatchData()
{
  unint64_t result = lazy protocol witness table cache variable for type DispatchData and conformance DispatchData;
  if (!lazy protocol witness table cache variable for type DispatchData and conformance DispatchData)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type DispatchData and conformance DispatchData);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type DispatchData and conformance DispatchData;
  if (!lazy protocol witness table cache variable for type DispatchData and conformance DispatchData)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type DispatchData and conformance DispatchData);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type DispatchData and conformance DispatchData;
  if (!lazy protocol witness table cache variable for type DispatchData and conformance DispatchData)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type DispatchData and conformance DispatchData);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type DispatchData and conformance DispatchData;
  if (!lazy protocol witness table cache variable for type DispatchData and conformance DispatchData)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type DispatchData and conformance DispatchData);
  }
  return result;
}

uint64_t associated type witness table accessor for Collection.Indices : RandomAccessCollection in DispatchData()
{
  return lazy protocol witness table accessor for type DefaultIndices<DispatchData> and conformance <> DefaultIndices<A>(&lazy protocol witness table cache variable for type DefaultIndices<DispatchData> and conformance <> DefaultIndices<A>, &demangling cache variable for type metadata for DefaultIndices<DispatchData>, (void (*)(void))lazy protocol witness table accessor for type DispatchData and conformance DispatchData);
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

uint64_t associated type witness table accessor for Collection.SubSequence : RandomAccessCollection in DispatchData()
{
  return lazy protocol witness table accessor for type DefaultIndices<DispatchData> and conformance <> DefaultIndices<A>(&lazy protocol witness table cache variable for type Slice<DispatchData> and conformance <> Slice<A>, &demangling cache variable for type metadata for Slice<DispatchData>, (void (*)(void))lazy protocol witness table accessor for type DispatchData and conformance DispatchData);
}

uint64_t associated type witness table accessor for Collection.Indices : BidirectionalCollection in DispatchData()
{
  return lazy protocol witness table accessor for type DefaultIndices<DispatchData> and conformance <> DefaultIndices<A>(&lazy protocol witness table cache variable for type DefaultIndices<DispatchData> and conformance <> DefaultIndices<A>, &demangling cache variable for type metadata for DefaultIndices<DispatchData>, (void (*)(void))lazy protocol witness table accessor for type DispatchData and conformance DispatchData);
}

uint64_t associated type witness table accessor for Collection.SubSequence : BidirectionalCollection in DispatchData()
{
  return lazy protocol witness table accessor for type DefaultIndices<DispatchData> and conformance <> DefaultIndices<A>(&lazy protocol witness table cache variable for type Slice<DispatchData> and conformance <> Slice<A>, &demangling cache variable for type metadata for Slice<DispatchData>, (void (*)(void))lazy protocol witness table accessor for type DispatchData and conformance DispatchData);
}

uint64_t lazy protocol witness table accessor for type DefaultIndices<DispatchData> and conformance <> DefaultIndices<A>(unint64_t *a1, uint64_t *a2, void (*a3)(void))
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

uint64_t associated type witness table accessor for Collection.Index : Comparable in DispatchData()
{
  return MEMORY[0x1E4FBB568];
}

uint64_t associated type witness table accessor for Collection.Indices : Collection in DispatchData()
{
  return lazy protocol witness table accessor for type DefaultIndices<DispatchData> and conformance DefaultIndices<A>(&lazy protocol witness table cache variable for type DefaultIndices<DispatchData> and conformance DefaultIndices<A>, &demangling cache variable for type metadata for DefaultIndices<DispatchData>);
}

uint64_t associated type witness table accessor for Collection.SubSequence : Collection in DispatchData()
{
  return lazy protocol witness table accessor for type DefaultIndices<DispatchData> and conformance DefaultIndices<A>(&lazy protocol witness table cache variable for type Slice<DispatchData> and conformance Slice<A>, &demangling cache variable for type metadata for Slice<DispatchData>);
}

uint64_t lazy protocol witness table accessor for type DefaultIndices<DispatchData> and conformance DefaultIndices<A>(unint64_t *a1, uint64_t *a2)
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

unint64_t lazy protocol witness table accessor for type DispatchDataIterator and conformance DispatchDataIterator()
{
  unint64_t result = lazy protocol witness table cache variable for type DispatchDataIterator and conformance DispatchDataIterator;
  if (!lazy protocol witness table cache variable for type DispatchDataIterator and conformance DispatchDataIterator)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type DispatchDataIterator and conformance DispatchDataIterator);
  }
  return result;
}

void protocol witness for IteratorProtocol.next() in conformance DispatchDataIterator(unsigned char *a1@<X8>)
{
  uint64_t v3 = v1[2];
  uint64_t v2 = v1[3];
  if (v2 == v3)
  {
    char v4 = 0;
LABEL_6:
    *a1 = v4;
    a1[1] = v2 == v3;
    return;
  }
  uint64_t v5 = v1[1];
  if (v5)
  {
    if (!__OFADD__(v2, 1))
    {
      char v4 = *(unsigned char *)(v5 + v2);
      v1[3] = v2 + 1;
      goto LABEL_6;
    }
    __break(1u);
  }
  __break(1u);
}

__n128 protocol witness for Sequence.makeIterator() in conformance DispatchDataIterator@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v2 = *(void *)(v1 + 24);
  *(void *)a1 = *(void *)v1;
  __n128 result = *(__n128 *)(v1 + 8);
  *(__n128 *)(a1 + 8) = result;
  *(void *)(a1 + 24) = v2;
  return result;
}

uint64_t protocol witness for Sequence.underestimatedCount.getter in conformance DispatchDataIterator()
{
  return 0;
}

uint64_t protocol witness for Sequence._copyToContiguousArray() in conformance DispatchDataIterator()
{
  uint64_t v1 = *(void **)v0;
  specialized _copySequenceToContiguousArray<A>(_:)(*(void **)v0, *(void *)(v0 + 8), *(void *)(v0 + 16), *(void *)(v0 + 24));
  uint64_t v3 = v2;

  return v3;
}

void *protocol witness for Sequence._copyContents(initializing:) in conformance DispatchDataIterator(void *a1, unsigned char *a2, uint64_t a3)
{
  return specialized Sequence._copySequenceContents(initializing:)(a1, a2, a3, *v3, v3[1], v3[2], v3[3]);
}

void destroy for DispatchData.Deallocator(uint64_t a1)
{
  uint64_t v1 = *(const void **)(a1 + 8);
  if ((unint64_t)v1 >= 0xFFFFFFFF)
  {

    _Block_release(v1);
  }
}

uint64_t initializeBufferWithCopyOfBuffer for DispatchData.Deallocator(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(const void **)(a2 + 8);
  if ((unint64_t)v3 < 0xFFFFFFFF)
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
  }
  else
  {
    char v4 = *(void **)a2;
    *(void *)a1 = *(void *)a2;
    id v5 = v4;
    _Block_copy(v3);
    *(void *)(a1 + 8) = v3;
  }
  return a1;
}

uint64_t assignWithCopy for DispatchData.Deallocator(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = *(void *)(a2 + 8);
  if (*(void *)(a1 + 8) < 0xFFFFFFFFuLL)
  {
    if (v4 >= 0xFFFFFFFF)
    {
      uint64_t v10 = *(void **)a2;
      *(void *)a1 = *(void *)a2;
      uint64_t v11 = *(const void **)(a2 + 8);
      id v12 = v10;
      _Block_copy(v11);
      *(void *)(a1 + 8) = v11;
      return a1;
    }
LABEL_7:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }
  id v5 = *(void **)a1;
  if (v4 < 0xFFFFFFFF)
  {

    _Block_release(*(const void **)(a1 + 8));
    goto LABEL_7;
  }
  size_t v6 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  id v7 = v6;

  size_t v8 = *(const void **)(a2 + 8);
  _Block_copy(v8);
  uint64_t v9 = *(const void **)(a1 + 8);
  *(void *)(a1 + 8) = v8;
  _Block_release(v9);
  return a1;
}

uint64_t assignWithTake for DispatchData.Deallocator(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = *(const void **)(a1 + 8);
  if ((unint64_t)v4 < 0xFFFFFFFF) {
    goto LABEL_5;
  }
  unint64_t v5 = *(void *)(a2 + 8);
  if (v5 < 0xFFFFFFFF)
  {

    _Block_release(v4);
LABEL_5:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }
  id v6 = *(id *)a1;
  *(void *)a1 = *(void *)a2;

  *(void *)(a1 + 8) = v5;
  _Block_release(v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for DispatchData.Deallocator(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFE && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 2147483646);
  }
  unint64_t v3 = *(void *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  unsigned int v4 = v3 + 1;
  unsigned int v5 = v3 - 1;
  if (v4 >= 3) {
    return v5;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for DispatchData.Deallocator(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFD)
  {
    *(void *)__n128 result = 0;
    *(void *)(result + 8) = 0;
    *(_DWORD *)__n128 result = a2 - 2147483646;
    if (a3 >= 0x7FFFFFFE) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFE) {
      *(unsigned char *)(result + 16) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = a2 + 1;
    }
  }
  return result;
}

uint64_t getEnumTag for DispatchData.Deallocator(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 8);
  if (v1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  return (v1 + 1);
}

void *destructiveInjectEnumTag for DispatchData.Deallocator(void *result, int a2)
{
  if (a2 < 0)
  {
    *__n128 result = a2 ^ 0x80000000;
    result[1] = 0;
  }
  else if (a2)
  {
    result[1] = (a2 - 1);
  }
  return result;
}

ValueMetadata *type metadata accessor for DispatchData.Deallocator()
{
  return &type metadata for DispatchData.Deallocator;
}

uint64_t initializeBufferWithCopyOfBuffer for DispatchDataIterator(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t initializeWithCopy for DispatchDataIterator(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  id v4 = v3;
  return a1;
}

uint64_t assignWithCopy for DispatchDataIterator(uint64_t a1, uint64_t a2)
{
  id v4 = *(void **)a2;
  unsigned int v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
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

uint64_t assignWithTake for DispatchDataIterator(uint64_t a1, uint64_t a2)
{
  id v4 = *(void **)a1;
  *(void *)a1 = *(void *)a2;

  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  return a1;
}

uint64_t getEnumTagSinglePayload for DispatchDataIterator(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for DispatchDataIterator(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for DispatchDataIterator()
{
  return &type metadata for DispatchDataIterator;
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance qos_class_t(_DWORD *a1, _DWORD *a2)
{
  return *a1 == *a2;
}

void protocol witness for RawRepresentable.rawValue.getter in conformance qos_class_t(_DWORD *a1@<X8>)
{
  *a1 = *v1;
}

void specialized _copyCollectionToContiguousArray<A>(_:)(NSObject *a1)
{
  int64_t size = dispatch_data_get_size(a1);
  if (size)
  {
    size_t v3 = size;
    if (size <= 0)
    {
      uint64_t v4 = MEMORY[0x1E4FBC860];
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<UInt8>);
      uint64_t v4 = swift_allocObject();
      size_t v5 = _swift_stdlib_malloc_size((const void *)v4);
      *(void *)(v4 + 16) = v3;
      *(void *)(v4 + 24) = 2 * v5 - 64;
    }
    size_t v6 = specialized Sequence._copySequenceContents(initializing:)(&v7, (unsigned char *)(v4 + 32), v3, a1);

    if (v6 != v3) {
      __break(1u);
    }
  }
}

void *specialized Sequence._copySequenceContents(initializing:)(void *result, unsigned char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  if (!a2) {
    goto LABEL_5;
  }
  if (!a3)
  {
LABEL_6:
    *__n128 result = a4;
    result[1] = a5;
    result[2] = a6;
    result[3] = a7;
    return (void *)a3;
  }
  if (a3 < 0)
  {
    __break(1u);
  }
  else
  {
    uint64_t v7 = a6 - a7;
    if (a6 == a7)
    {
LABEL_5:
      a3 = 0;
      goto LABEL_6;
    }
    if (a5)
    {
      if (a7 == 0x7FFFFFFFFFFFFFFFLL)
      {
LABEL_24:
        __break(1u);
LABEL_25:
        a7 = a6;
        a3 = v7;
      }
      else
      {
        uint64_t v8 = a7 + 1;
        unint64_t v9 = ~a7 + a6;
        if (v9 >= 0x7FFFFFFFFFFFFFFELL - a7) {
          unint64_t v9 = 0x7FFFFFFFFFFFFFFELL - a7;
        }
        if (v9 >= a3 - 1) {
          unint64_t v9 = a3 - 1;
        }
        unint64_t v10 = v9 + 1;
        if (v10 > 0x10 && (unint64_t)&a2[-a7 - a5] >= 0x10)
        {
          size_t v13 = a2;
          uint64_t v14 = v10 & 0xF;
          if ((v10 & 0xF) == 0) {
            uint64_t v14 = 16;
          }
          unint64_t v15 = v10 - v14;
          v8 += v10 - v14;
          a2 += v10 - v14;
          uint64_t v12 = v10 - v14 + a7;
          uint64_t v11 = v15 + 1;
          uint64_t v16 = (long long *)(a5 + a7);
          do
          {
            long long v17 = *v16++;
            *v13++ = v17;
            v15 -= 16;
          }
          while (v15);
        }
        else
        {
          uint64_t v11 = 1;
          uint64_t v12 = a7;
        }
        uint64_t v18 = 0x8000000000000000 - a7;
        a7 = v12;
        while (1)
        {
          char v19 = *(unsigned char *)(a5 + a7);
          a7 = v8;
          *a2 = v19;
          if (a3 == v11) {
            break;
          }
          if (v7 == v11) {
            goto LABEL_25;
          }
          ++v11;
          ++a2;
          ++v8;
          if (v18 == v11) {
            goto LABEL_24;
          }
        }
      }
      goto LABEL_6;
    }
  }
  __break(1u);
  return result;
}

size_t specialized Sequence._copySequenceContents(initializing:)(dispatch_data_t *a1, unsigned char *a2, size_t a3, dispatch_data_t data)
{
  v24[2] = *MEMORY[0x1E4F143B8];
  uint64_t v23 = 0;
  v24[0] = 0;
  dispatch_data_t map = dispatch_data_create_map(data, (const void **)&v23, v24);

  unint64_t v9 = v23;
  size_t v10 = v24[0];
  if (!a2)
  {
    size_t result = 0;
LABEL_23:
    *a1 = map;
    a1[1] = (dispatch_data_t)v9;
    a1[2] = (dispatch_data_t)v10;
    a1[3] = (dispatch_data_t)result;
    return result;
  }
  if (!a3)
  {
LABEL_22:
    size_t result = a3;
    goto LABEL_23;
  }
  if ((a3 & 0x8000000000000000) != 0) {
    __break(1u);
  }
  size_t result = v24[0];
  if (!v24[0]) {
    goto LABEL_23;
  }
  if (v23)
  {
    *a2 = *v23;
    if (a3 != 1)
    {
      size_t v12 = a3 - 2;
      if (a3 - 2 >= v10 - 1) {
        size_t v12 = v10 - 1;
      }
      unint64_t v13 = v12 + 1;
      if (v13 >= 0x11 && (unint64_t)(a2 - v9) > 0xF)
      {
        uint64_t v17 = v13 & 0xF;
        if ((v13 & 0xF) == 0) {
          uint64_t v17 = 16;
        }
        unint64_t v18 = v13 - v17;
        uint64_t v16 = &a2[v13 - v17];
        uint64_t v15 = v18 + 1;
        char v19 = a2 + 1;
        id v20 = (long long *)(v9 + 1);
        do
        {
          long long v21 = *v20++;
          *v19++ = v21;
          v18 -= 16;
        }
        while (v18);
      }
      else
      {
        uint64_t v15 = 1;
        uint64_t v16 = a2;
      }
      uint64_t v22 = v16 + 1;
      while (v10 != v15)
      {
        *v22++ = v9[v15];
        if (a3 == ++v15) {
          goto LABEL_22;
        }
      }
      size_t result = v10;
      goto LABEL_23;
    }
    goto LABEL_22;
  }
  __break(1u);
  return result;
}

void specialized _copySequenceToContiguousArray<A>(_:)(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  size_t v5 = (void *)MEMORY[0x1E4FBC860];
  if (a4 == a3)
  {
    size_t v4 = 0;
  }
  else
  {
    uint64_t v6 = a4;
    id v24 = a1;
    if (!a2)
    {
LABEL_33:
      __break(1u);
      return;
    }
    uint64_t v9 = v6 + 1;
    if (!__OFADD__(v6, 1))
    {
      size_t v4 = 0;
      size_t v10 = v5 + 4;
      while (1)
      {
        char v11 = *(unsigned char *)(a2 + v6);
        if (!v4)
        {
          unint64_t v12 = v5[3];
          if ((uint64_t)((v12 >> 1) + 0x4000000000000000) < 0) {
            goto LABEL_31;
          }
          int64_t v13 = v12 & 0xFFFFFFFFFFFFFFFELL;
          if (v13 <= 1) {
            uint64_t v14 = 1;
          }
          else {
            uint64_t v14 = v13;
          }
          __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<UInt8>);
          uint64_t v15 = (void *)swift_allocObject();
          size_t v16 = 2 * _swift_stdlib_malloc_size(v15) - 64;
          v15[2] = v14;
          v15[3] = v16;
          unint64_t v17 = (unint64_t)(v15 + 4);
          size_t v18 = v5[3] >> 1;
          if (v5[2])
          {
            if (v15 != v5 || v17 >= (unint64_t)v5 + v18 + 32) {
              memmove(v15 + 4, v5 + 4, v18);
            }
            v5[2] = 0;
          }
          size_t v10 = (unsigned char *)(v17 + v18);
          size_t v4 = (v16 >> 1) - v18;
          swift_release();
          size_t v5 = v15;
        }
        BOOL v20 = __OFSUB__(v4--, 1);
        if (v20) {
          break;
        }
        *size_t v10 = v11;
        if (v9 == a3) {
          goto LABEL_25;
        }
        uint64_t v6 = v9;
        ++v10;
        BOOL v20 = __OFADD__(v9++, 1);
        if (v20) {
          goto LABEL_24;
        }
      }
      __break(1u);
LABEL_31:
      __break(1u);
LABEL_32:
      __break(1u);
      goto LABEL_33;
    }
LABEL_24:
    __break(1u);
LABEL_25:
  }
  unint64_t v21 = v5[3];
  if (v21 < 2) {
    return;
  }
  unint64_t v22 = v21 >> 1;
  BOOL v20 = __OFSUB__(v22, v4);
  unint64_t v23 = v22 - v4;
  if (v20) {
    goto LABEL_32;
  }
  v5[2] = v23;
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

uint64_t specialized BidirectionalCollection.distance(from:to:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = a2 - a1;
  BOOL v3 = a2 < a1;
  if (a2 <= a1)
  {
    uint64_t result = 0;
    if (!v3) {
      return result;
    }
    unint64_t v7 = ~a2 + a1;
    unint64_t v8 = a1 ^ 0x8000000000000000;
    if (v7 >= v8) {
      unint64_t v7 = v8;
    }
    unint64_t v9 = 0x8000000000000000;
    if (v7 < 0x8000000000000000) {
      unint64_t v9 = v7;
    }
    while ((v7 & 0x8000000000000000) == 0)
    {
      if (v8 == v9) {
        goto LABEL_18;
      }
      if (v4 == --result) {
        return result;
      }
    }
  }
  else
  {
    uint64_t result = 0;
    unint64_t v6 = ~a1 + a2;
    while (v6 <= 0x7FFFFFFFFFFFFFFELL)
    {
      if (v4 == ++result) {
        return result;
      }
    }
    __break(1u);
  }
  __break(1u);
LABEL_18:
  __break(1u);
  return result;
}

uint64_t specialized BidirectionalCollection.index(_:offsetBy:)(uint64_t result, uint64_t a2)
{
  if (a2 < 0)
  {
    uint64_t v4 = 0;
    while ((result ^ 0x8000000000000000) > ~a2)
    {
      if (--v4 <= a2)
      {
        result += v4;
        return result;
      }
    }
    goto LABEL_12;
  }
  if (a2)
  {
    unint64_t v2 = result ^ 0x7FFFFFFFFFFFFFFFLL;
    unint64_t v3 = a2 - 1;
    while (v2 > v3)
    {
      ++result;
      if (!--a2) {
        return result;
      }
    }
    __break(1u);
LABEL_12:
    __break(1u);
  }
  return result;
}

uint64_t specialized RandomAccessCollection.index(_:offsetBy:limitedBy:)(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = 0;
  uint64_t v4 = a3 - result;
  if (a3 > result)
  {
    while ((unint64_t)(~result + a3) <= 0x7FFFFFFFFFFFFFFELL)
    {
      if (v4 == ++v3) {
        goto LABEL_13;
      }
    }
    __break(1u);
    goto LABEL_32;
  }
  if (a3 < result)
  {
    unint64_t v5 = ~a3 + result;
    if (v5 >= (result ^ 0x8000000000000000)) {
      unint64_t v5 = result ^ 0x8000000000000000;
    }
    unint64_t v6 = 0x8000000000000000;
    if (v5 < 0x8000000000000000) {
      unint64_t v6 = v5;
    }
    while ((v5 & 0x8000000000000000) == 0)
    {
      if ((result ^ 0x8000000000000000) == v6) {
        goto LABEL_34;
      }
      if (v4 == --v3)
      {
LABEL_13:
        if (a2 > 0)
        {
          if ((v3 & 0x8000000000000000) == 0) {
            goto LABEL_19;
          }
          goto LABEL_20;
        }
        if (v3 >= 1) {
          goto LABEL_26;
        }
        goto LABEL_24;
      }
    }
    goto LABEL_33;
  }
  if (a2 > 0)
  {
LABEL_19:
    if (v3 >= (unint64_t)a2)
    {
LABEL_20:
      unint64_t v7 = result ^ 0x7FFFFFFFFFFFFFFFLL;
      unint64_t v8 = a2 - 1;
      while (v7 > v8)
      {
        ++result;
        if (!--a2) {
          return result;
        }
      }
LABEL_32:
      __break(1u);
LABEL_33:
      __break(1u);
LABEL_34:
      __break(1u);
      goto LABEL_35;
    }
    return 0;
  }
LABEL_24:
  if (v3 > a2) {
    return 0;
  }
LABEL_26:
  if ((a2 & 0x8000000000000000) == 0) {
    return result;
  }
  uint64_t v9 = 0;
  while ((result ^ 0x8000000000000000) > ~a2)
  {
    if (--v9 <= a2)
    {
      result += v9;
      return result;
    }
  }
LABEL_35:
  __break(1u);
  return result;
}

uint64_t sub_18BFA3DCC()
{
  return MEMORY[0x1F4186498](v0, 56, 7);
}

uint64_t partial apply for closure #1 in DispatchData._copyBytesHelper(to:from:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return closure #1 in DispatchData._copyBytesHelper(to:from:)(a1, a2, a3, a4, *(void *)(v4 + 16), *(void *)(v4 + 24), *(void *)(v4 + 32), *(int64_t **)(v4 + 40), *(void *)(v4 + 48)) & 1;
}

uint64_t sub_18BFA3E10()
{
  return MEMORY[0x1F4186498](v0, 32, 7);
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

BOOL ___swift_dispatch_data_apply_block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(uint64_t (**)(uint64_t, id, uint64_t, uint64_t, uint64_t))(v8 + 16);
  id v10 = a2;
  LODWORD(a5) = v9(v8, v10, a3, a4, a5);

  return a5 != 0;
}

uint64_t DispatchSpecificKey.__allocating_init()()
{
  return swift_allocObject();
}

uint64_t DispatchSpecificKey.deinit()
{
  return v0;
}

uint64_t DispatchSpecificKey.__deallocating_deinit()
{
  return MEMORY[0x1F4186488](v0, 16, 7);
}

uint64_t _DispatchSpecificValue.init(value:)(uint64_t a1)
{
  (*(void (**)(uint64_t, uint64_t))(*(void *)(*(void *)(*(void *)v1 + 80) - 8) + 32))(v1 + *(void *)(*(void *)v1 + 88), a1);
  return v1;
}

uint64_t _DispatchSpecificValue.deinit()
{
  (*(void (**)(uint64_t))(*(void *)(*(void *)(*(void *)v0 + 80) - 8) + 8))(v0 + *(void *)(*(void *)v0 + 88));
  return v0;
}

uint64_t OS_dispatch_queue.Attributes.rawValue.getter()
{
  return *(void *)v0;
}

uint64_t OS_dispatch_queue.Attributes.init(rawValue:)@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = result;
  return result;
}

void *protocol witness for SetAlgebra.union(_:) in conformance OS_dispatch_queue.Attributes@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 | *result;
  return result;
}

void *protocol witness for SetAlgebra.intersection(_:) in conformance OS_dispatch_queue.Attributes@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & *result;
  return result;
}

void *protocol witness for SetAlgebra.symmetricDifference(_:) in conformance OS_dispatch_queue.Attributes@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 ^ *result;
  return result;
}

void *protocol witness for SetAlgebra.formUnion(_:) in conformance OS_dispatch_queue.Attributes(void *result)
{
  *v1 |= *result;
  return result;
}

void *protocol witness for SetAlgebra.formIntersection(_:) in conformance OS_dispatch_queue.Attributes(void *result)
{
  *v1 &= *result;
  return result;
}

void *protocol witness for SetAlgebra.formSymmetricDifference(_:) in conformance OS_dispatch_queue.Attributes(void *result)
{
  *v1 ^= *result;
  return result;
}

void *protocol witness for SetAlgebra.subtracting(_:) in conformance OS_dispatch_queue.Attributes@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & ~*result;
  return result;
}

BOOL protocol witness for SetAlgebra.isSubset(of:) in conformance OS_dispatch_queue.Attributes(void *a1)
{
  return (*v1 & ~*a1) == 0;
}

BOOL protocol witness for SetAlgebra.isDisjoint(with:) in conformance OS_dispatch_queue.Attributes(void *a1)
{
  return (*v1 & *a1) == 0;
}

BOOL protocol witness for SetAlgebra.isSuperset(of:) in conformance OS_dispatch_queue.Attributes(void *a1)
{
  return (*a1 & ~*v1) == 0;
}

BOOL protocol witness for SetAlgebra.isEmpty.getter in conformance OS_dispatch_queue.Attributes()
{
  return *v0 == 0;
}

void *protocol witness for SetAlgebra.subtract(_:) in conformance OS_dispatch_queue.Attributes(void *result)
{
  *v1 &= ~*result;
  return result;
}

void *protocol witness for RawRepresentable.init(rawValue:) in conformance OS_dispatch_queue.Attributes@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void protocol witness for RawRepresentable.rawValue.getter in conformance OS_dispatch_queue.Attributes(void *a1@<X8>)
{
  *a1 = *v1;
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance OS_dispatch_queue.Attributes(void *a1, void *a2)
{
  return *a1 == *a2;
}

BOOL static OS_dispatch_queue.GlobalQueuePriority.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

void OS_dispatch_queue.GlobalQueuePriority.hash(into:)()
{
  Hasher._combine(_:)(*v0);
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance OS_dispatch_queue.GlobalQueuePriority(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

void protocol witness for Hashable.hash(into:) in conformance OS_dispatch_queue.GlobalQueuePriority()
{
  Hasher._combine(_:)(*v0);
}

Swift::Int OS_dispatch_queue.GlobalQueuePriority.hashValue.getter()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance OS_dispatch_queue.GlobalQueuePriority()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

uint64_t sub_18BFA4298()
{
  return MEMORY[0x1F4186498](v0, 32, 7);
}

dispatch_queue_global_t static OS_dispatch_queue.global(priority:)(char *a1)
{
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(qword_18BFAD9B8[*a1], 0);

  return global_queue;
}

void OS_dispatch_queue.sync(execute:)(uint64_t a1)
{
  _swift_dispatch_sync(v1, *(void **)(a1 + 16));
}

void OS_dispatch_queue.asyncAndWait(execute:)(uint64_t a1)
{
  _swift_dispatch_async_and_wait(v1, *(void **)(a1 + 16));
}

void OS_dispatch_queue.async(group:execute:)(void *a1, uint64_t a2)
{
  _swift_dispatch_group_async(a1, v2, *(void **)(a2 + 16));
}

uint64_t OS_dispatch_queue._syncHelper<A>(fn:flags:execute:rescue:)@<X0>(void (*a1)(uint64_t)@<X0>, uint64_t a2@<X1>, dispatch_block_flags_t *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, void (*a6)(void *)@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>)
{
  uint64_t v33 = a4;
  uint64_t v30 = a7;
  v31 = a6;
  uint64_t v34 = a5;
  v35 = a1;
  uint64_t v36 = a2;
  uint64_t v32 = a9;
  uint64_t v11 = type metadata accessor for Optional();
  uint64_t v28 = *(void *)(v11 - 8);
  MEMORY[0x1F4188790](v11);
  uint64_t v29 = (char *)&v27 - v12;
  dispatch_block_flags_t v13 = *a3;
  uint64_t v14 = swift_allocBox();
  uint64_t v16 = v15;
  uint64_t v17 = *(void *)(a8 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v17 + 56))(v15, 1, 1, a8);
  uint64_t v18 = swift_allocObject();
  *(void *)(v18 + 16) = 0;
  char v19 = (void **)(v18 + 16);
  BOOL v20 = (void *)swift_allocObject();
  uint64_t v21 = v33;
  v20[2] = a8;
  v20[3] = v21;
  unint64_t v22 = v35;
  v20[4] = v34;
  closure #1 in OS_dispatch_queue._syncHelper<A>(fn:flags:execute:rescue:)((uint64_t)partial apply for thunk for @callee_guaranteed () -> (@out A, @error @owned Error), (uint64_t)v20, v13, v14, v18, v22, v36, a8);
  LOBYTE(v13) = swift_isEscapingClosureAtFileLocation();
  uint64_t result = swift_release();
  if (v13)
  {
    __break(1u);
  }
  else
  {
    swift_beginAccess();
    id v24 = *v19;
    if (*v19)
    {
      id v25 = v24;
      v31(v24);

LABEL_6:
      swift_release();
      return swift_release();
    }
    swift_beginAccess();
    uint64_t v26 = v29;
    (*(void (**)(char *, uint64_t, uint64_t))(v28 + 16))(v29, v16, v11);
    uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v17 + 48))(v26, 1, a8);
    if (result != 1)
    {
      (*(void (**)(uint64_t, char *, uint64_t))(v17 + 32))(v32, v26, a8);
      goto LABEL_6;
    }
  }
  __break(1u);
  return result;
}

uint64_t closure #1 in OS_dispatch_queue._syncHelper<A>(fn:flags:execute:rescue:)(uint64_t a1, uint64_t a2, dispatch_block_flags_t a3, uint64_t a4, uint64_t a5, void (*a6)(uint64_t), uint64_t a7, uint64_t a8)
{
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = a8;
  v15[3] = a4;
  void v15[4] = a1;
  v15[5] = a2;
  v15[6] = a5;
  v21[4] = partial apply for closure #1 in closure #1 in OS_dispatch_queue._syncHelper<A>(fn:flags:execute:rescue:);
  v21[5] = v15;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 1107296256;
  v21[2] = thunk for @escaping @callee_guaranteed () -> ();
  v21[3] = &block_descriptor_74;
  uint64_t v16 = _Block_copy(v21);
  type metadata accessor for DispatchWorkItem();
  uint64_t v17 = swift_allocObject();
  uint64_t v18 = _Block_copy(v16);
  swift_retain();
  swift_retain();
  swift_retain();
  id v19 = _swift_dispatch_block_create(a3, v18);
  _Block_release(v16);
  _Block_release(v18);
  *(void *)(v17 + 16) = v19;
  swift_release();
  a6(v17);
  return swift_release();
}

uint64_t closure #1 in closure #1 in OS_dispatch_queue._syncHelper<A>(fn:flags:execute:rescue:)(uint64_t a1, void (*a2)(void), uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v7 = type metadata accessor for Optional();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7);
  id v10 = &v13[-v9];
  uint64_t v11 = swift_projectBox();
  a2();
  (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(*(void *)(a5 - 8) + 56))(v10, 0, 1, a5);
  swift_beginAccess();
  return (*(uint64_t (**)(uint64_t, unsigned char *, uint64_t))(v8 + 40))(v11, v10, v7);
}

uint64_t OS_dispatch_queue.asyncAndWait<A>(execute:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  return OS_dispatch_queue.asyncAndWait<A>(execute:)(a1, a2, a3, (void (*)(uint64_t (*)(), char *))partial apply for implicit closure #2 in implicit closure #1 in OS_dispatch_queue.asyncAndWait<A>(execute:), (void (*)(id))partial apply for closure #1 in OS_dispatch_queue.asyncAndWait<A>(execute:), a4);
}

uint64_t OS_dispatch_queue.asyncAndWait<A>(flags:execute:)@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v10 = *a1;
  if (*a1)
  {
    uint64_t v11 = swift_allocObject();
    *(void *)(v11 + 16) = v5;
    uint64_t v18 = v10;
    MEMORY[0x1F4188790](v11);
    uint64_t v17 = a4;
    id v12 = v5;
    OS_dispatch_queue._syncHelper<A>(fn:flags:execute:rescue:)((void (*)(uint64_t))partial apply for implicit closure #2 in implicit closure #1 in OS_dispatch_queue.asyncAndWait<A>(flags:execute:), v11, (dispatch_block_flags_t *)&v18, a2, a3, (void (*)(void *))partial apply for closure #1 in OS_dispatch_queue.asyncAndWait<A>(execute:), (uint64_t)v16, a4, a5);
  }
  else
  {
    uint64_t v13 = swift_allocObject();
    *(void *)(v13 + 16) = v5;
    MEMORY[0x1F4188790](v13);
    uint64_t v17 = a4;
    id v14 = v5;
    OS_dispatch_queue._syncHelper<A>(fn:execute:rescue:)((void (*)(uint64_t (*)(), char *))partial apply for implicit closure #4 in implicit closure #3 in OS_dispatch_queue.asyncAndWait<A>(flags:execute:), a2, a3, (void (*)(id))partial apply for closure #1 in OS_dispatch_queue.asyncAndWait<A>(execute:), (uint64_t)v16, a4, a5);
  }
  return swift_release();
}

Dispatch::DispatchQoS::QoSClass_optional OS_dispatch_queue.qos.getter@<W0>(uint64_t a1@<X8>)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int v6 = 0;
  qos_class_t qos_class = dispatch_queue_get_qos_class(v1, &v6);
  result.value = DispatchQoS.QoSClass.init(rawValue:)(qos_class).value;
  if (v7 == 6) {
    __break(1u);
  }
  uint64_t v5 = v6;
  *(unsigned char *)a1 = v7;
  *(void *)(a1 + 8) = v5;
  return result;
}

uint64_t OS_dispatch_queue_serial_executor.enqueue(_:)()
{
  uint64_t v1 = UnownedJob.init(_:)();
  _swift_job_set_executor_queue(v1, v0);
  uint64_t v2 = _swift_job_priority(v1);

  return MEMORY[0x1F40CB980](v0, v1, v2);
}

uint64_t protocol witness for SerialExecutor.enqueue(_:) in conformance OS_dispatch_queue_serial_executor(uint64_t a1, uint64_t a2)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return MEMORY[0x1F4187C20](a1, a2, WitnessTable);
}

{
  uint64_t WitnessTable;
  uint64_t vars8;

  uint64_t WitnessTable = swift_getWitnessTable();

  return MEMORY[0x1F4187C30](a1, a2, WitnessTable);
}

uint64_t protocol witness for SerialExecutor.asUnownedSerialExecutor() in conformance OS_dispatch_queue_serial_executor()
{
  return v0;
}

uint64_t protocol witness for SerialExecutor.isSameExclusiveExecutionContext(other:) in conformance OS_dispatch_queue_serial_executor()
{
  return MEMORY[0x1F4187E18]();
}

uint64_t protocol witness for Executor.enqueue(_:) in conformance OS_dispatch_queue_serial_executor()
{
  return MEMORY[0x1F4187C20]();
}

{
  return MEMORY[0x1F4187C30]();
}

uint64_t OS_dispatch_queue_serial.Attributes.rawValue.getter()
{
  return *(void *)v0;
}

uint64_t OS_dispatch_queue_concurrent.Attributes.rawValue.getter()
{
  return *(void *)v0;
}

void OS_dispatch_queue_concurrent.init(label:qos:attributes:autoreleaseFrequency:target:)(uint64_t a1, uint64_t a2, char *a3, uint64_t *a4, unsigned __int8 *a5, void *a6)
{
  uint64_t v7 = *a3;
  uint64_t v8 = *((void *)a3 + 1);
  uint64_t v9 = *a4;
  dispatch_autorelease_frequency_t v10 = (unint64_t)*a5;
  uint64_t v11 = (id)_swift_dispatch_queue_concurrent();
  id v12 = v11;
  if ((v9 & 4) != 0)
  {
    uint64_t v13 = dispatch_queue_attr_make_initially_inactive(v11);

    id v12 = v13;
  }
  if (v10)
  {
    if (v10 == DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM) {
      dispatch_autorelease_frequency_t v14 = v10;
    }
    else {
      dispatch_autorelease_frequency_t v14 = DISPATCH_AUTORELEASE_FREQUENCY_NEVER;
    }
    uint64_t v15 = dispatch_queue_attr_make_with_autorelease_frequency(v12, v14);

    id v12 = v15;
  }
  if (v7 == 5 && v8 == 0) {
    goto LABEL_15;
  }
  if (v8 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
  }
  else if (v8 <= 0x7FFFFFFF)
  {
    uint64_t v17 = dispatch_queue_attr_make_with_qos_class(v12, (dispatch_qos_class_t)dword_18BFADA08[v7], v8);

    id v12 = v17;
LABEL_15:
    uint64_t v18 = String.utf8CString.getter();
    swift_bridgeObjectRelease();
    dispatch_concurrent_queue_create_with_target_4swift((const char *)(v18 + 32), v12, a6);
    swift_release();

    return;
  }
  __break(1u);
}

uint64_t OS_dispatch_workloop.Attributes.rawValue.getter()
{
  return *(void *)v0;
}

void *protocol witness for SetAlgebra.remove(_:) in conformance OS_dispatch_queue.Attributes@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *v2 & *result;
  if (v3) {
    *v2 &= ~*result;
  }
  *(void *)a2 = v3;
  *(unsigned char *)(a2 + 8) = v3 == 0;
  return result;
}

uint64_t *protocol witness for SetAlgebra.update(with:) in conformance OS_dispatch_queue.Attributes@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *result;
  uint64_t v4 = *v2;
  *v2 |= *result;
  uint64_t v5 = v4 & v3;
  *(void *)a2 = v5;
  *(unsigned char *)(a2 + 8) = v5 == 0;
  return result;
}

NSObject *OS_dispatch_workloop.init(label:attributes:autoreleaseFrequency:osWorkgroup:)(uint64_t a1, uint64_t a2, uint64_t a3, unsigned __int8 *a4, OS_os_workgroup *a5)
{
  dispatch_autorelease_frequency_t v6 = (unint64_t)*a4;
  uint64_t v7 = String.utf8CString.getter();
  swift_bridgeObjectRelease();
  dispatch_workloop_t inactive = dispatch_workloop_create_inactive((const char *)(v7 + 32));
  swift_release();
  if (v6)
  {
    if (v6 == DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM)
    {
      uint64_t v9 = inactive;
      if (!a5) {
        goto LABEL_8;
      }
      goto LABEL_7;
    }
    dispatch_autorelease_frequency_t v6 = DISPATCH_AUTORELEASE_FREQUENCY_NEVER;
  }
  dispatch_workloop_set_autorelease_frequency(inactive, v6);
  if (a5) {
LABEL_7:
  }
    dispatch_workloop_set_os_workgroup(inactive, a5);
LABEL_8:
  dispatch_autorelease_frequency_t v10 = inactive;
  dispatch_activate(v10);

  return v10;
}

void _swift_dispatch_sync(void *a1, void *a2)
{
  uint64_t v3 = a1;
  id v4 = a2;
  dispatch_sync(v3, v4);
}

void _swift_dispatch_async_and_wait(void *a1, void *a2)
{
  uint64_t v3 = a1;
  id v4 = a2;
  dispatch_async_and_wait(v3, v4);
}

void _swift_dispatch_group_async(void *a1, void *a2, void *a3)
{
  uint64_t v5 = a1;
  dispatch_autorelease_frequency_t v6 = a2;
  id v7 = a3;
  dispatch_group_async(v5, v6, v7);
}

uint64_t partial apply for implicit closure #2 in implicit closure #1 in OS_dispatch_queue.asyncAndWait<A>(execute:)(uint64_t a1, uint64_t a2)
{
  return implicit closure #2 in implicit closure #1 in OS_dispatch_queue.asyncAndWait<A>(execute:)(a1, a2, *(void *)(v2 + 16), (uint64_t)&unk_1ED98CE10, (uint64_t)thunk for @callee_guaranteed () -> ()partial apply, (uint64_t)&block_descriptor_85, MEMORY[0x1E4F14770]);
}

id partial apply for closure #1 in OS_dispatch_queue.asyncAndWait<A>(execute:)(void *a1)
{
  return partial apply for closure #1 in OS_dispatch_queue.asyncAndWait<A>(execute:)(a1);
}

{
  swift_willThrow();
  return a1;
}

uint64_t partial apply for implicit closure #2 in implicit closure #1 in OS_dispatch_queue.asyncAndWait<A>(flags:execute:)(uint64_t a1)
{
  return partial apply for implicit closure #2 in implicit closure #1 in OS_dispatch_queue.asyncAndWait<A>(flags:execute:)(a1, (uint64_t (*)(void, void))_swift_dispatch_async_and_wait);
}

uint64_t partial apply for implicit closure #4 in implicit closure #3 in OS_dispatch_queue.asyncAndWait<A>(flags:execute:)(uint64_t a1, uint64_t a2)
{
  return implicit closure #2 in implicit closure #1 in OS_dispatch_queue.asyncAndWait<A>(execute:)(a1, a2, *(void *)(v2 + 16), (uint64_t)&unk_1ED98CD48, (uint64_t)thunk for @callee_guaranteed () -> ()partial apply, (uint64_t)&block_descriptor_62, MEMORY[0x1E4F14770]);
}

uint64_t sub_18BFA50BC()
{
  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t partial apply for implicit closure #4 in implicit closure #3 in OS_dispatch_queue.sync<A>(flags:execute:)(uint64_t a1)
{
  return partial apply for implicit closure #2 in implicit closure #1 in OS_dispatch_queue.asyncAndWait<A>(flags:execute:)(a1, (uint64_t (*)(void, void))_swift_dispatch_sync);
}

uint64_t partial apply for implicit closure #2 in implicit closure #1 in OS_dispatch_queue.asyncAndWait<A>(flags:execute:)(uint64_t a1, uint64_t (*a2)(void, void))
{
  return a2(*(void *)(v2 + 16), *(void *)(a1 + 16));
}

uint64_t partial apply for implicit closure #6 in implicit closure #5 in OS_dispatch_queue.sync<A>(flags:execute:)(uint64_t a1, uint64_t a2)
{
  return implicit closure #2 in implicit closure #1 in OS_dispatch_queue.asyncAndWait<A>(execute:)(a1, a2, *(void *)(v2 + 16), (uint64_t)&unk_1ED98CCF8, (uint64_t)thunk for @callee_guaranteed () -> ()partial apply, (uint64_t)&block_descriptor_48, MEMORY[0x1E4F147E8]);
}

unint64_t lazy protocol witness table accessor for type OS_dispatch_queue.GlobalQueuePriority and conformance OS_dispatch_queue.GlobalQueuePriority()
{
  unint64_t result = lazy protocol witness table cache variable for type OS_dispatch_queue.GlobalQueuePriority and conformance OS_dispatch_queue.GlobalQueuePriority;
  if (!lazy protocol witness table cache variable for type OS_dispatch_queue.GlobalQueuePriority and conformance OS_dispatch_queue.GlobalQueuePriority)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OS_dispatch_queue.GlobalQueuePriority and conformance OS_dispatch_queue.GlobalQueuePriority);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type OS_dispatch_queue.AutoreleaseFrequency and conformance OS_dispatch_queue.AutoreleaseFrequency()
{
  unint64_t result = lazy protocol witness table cache variable for type OS_dispatch_queue.AutoreleaseFrequency and conformance OS_dispatch_queue.AutoreleaseFrequency;
  if (!lazy protocol witness table cache variable for type OS_dispatch_queue.AutoreleaseFrequency and conformance OS_dispatch_queue.AutoreleaseFrequency)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OS_dispatch_queue.AutoreleaseFrequency and conformance OS_dispatch_queue.AutoreleaseFrequency);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type OS_dispatch_queue_concurrent.Attributes and conformance OS_dispatch_queue_concurrent.Attributes()
{
  unint64_t result = lazy protocol witness table cache variable for type OS_dispatch_queue_concurrent.Attributes and conformance OS_dispatch_queue_concurrent.Attributes;
  if (!lazy protocol witness table cache variable for type OS_dispatch_queue_concurrent.Attributes and conformance OS_dispatch_queue_concurrent.Attributes)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OS_dispatch_queue_concurrent.Attributes and conformance OS_dispatch_queue_concurrent.Attributes);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type OS_dispatch_queue_concurrent.Attributes and conformance OS_dispatch_queue_concurrent.Attributes;
  if (!lazy protocol witness table cache variable for type OS_dispatch_queue_concurrent.Attributes and conformance OS_dispatch_queue_concurrent.Attributes)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OS_dispatch_queue_concurrent.Attributes and conformance OS_dispatch_queue_concurrent.Attributes);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type OS_dispatch_queue_concurrent.Attributes and conformance OS_dispatch_queue_concurrent.Attributes;
  if (!lazy protocol witness table cache variable for type OS_dispatch_queue_concurrent.Attributes and conformance OS_dispatch_queue_concurrent.Attributes)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OS_dispatch_queue_concurrent.Attributes and conformance OS_dispatch_queue_concurrent.Attributes);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type OS_dispatch_queue_concurrent.Attributes and conformance OS_dispatch_queue_concurrent.Attributes;
  if (!lazy protocol witness table cache variable for type OS_dispatch_queue_concurrent.Attributes and conformance OS_dispatch_queue_concurrent.Attributes)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OS_dispatch_queue_concurrent.Attributes and conformance OS_dispatch_queue_concurrent.Attributes);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type OS_dispatch_workloop.Attributes and conformance OS_dispatch_workloop.Attributes()
{
  unint64_t result = lazy protocol witness table cache variable for type OS_dispatch_workloop.Attributes and conformance OS_dispatch_workloop.Attributes;
  if (!lazy protocol witness table cache variable for type OS_dispatch_workloop.Attributes and conformance OS_dispatch_workloop.Attributes)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OS_dispatch_workloop.Attributes and conformance OS_dispatch_workloop.Attributes);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type OS_dispatch_workloop.Attributes and conformance OS_dispatch_workloop.Attributes;
  if (!lazy protocol witness table cache variable for type OS_dispatch_workloop.Attributes and conformance OS_dispatch_workloop.Attributes)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OS_dispatch_workloop.Attributes and conformance OS_dispatch_workloop.Attributes);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type OS_dispatch_workloop.Attributes and conformance OS_dispatch_workloop.Attributes;
  if (!lazy protocol witness table cache variable for type OS_dispatch_workloop.Attributes and conformance OS_dispatch_workloop.Attributes)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OS_dispatch_workloop.Attributes and conformance OS_dispatch_workloop.Attributes);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type OS_dispatch_workloop.Attributes and conformance OS_dispatch_workloop.Attributes;
  if (!lazy protocol witness table cache variable for type OS_dispatch_workloop.Attributes and conformance OS_dispatch_workloop.Attributes)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OS_dispatch_workloop.Attributes and conformance OS_dispatch_workloop.Attributes);
  }
  return result;
}

uint64_t method lookup function for DispatchSpecificKey(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for DispatchSpecificKey);
}

uint64_t dispatch thunk of DispatchSpecificKey.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t getEnumTagSinglePayload for OS_dispatch_queue.GlobalQueuePriority(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for OS_dispatch_queue.GlobalQueuePriority(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x18BFA5754);
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

uint64_t getEnumTag for OS_dispatch_queue.GlobalQueuePriority(unsigned __int8 *a1)
{
  return *a1;
}

ValueMetadata *type metadata accessor for OS_dispatch_queue.GlobalQueuePriority()
{
  return &type metadata for OS_dispatch_queue.GlobalQueuePriority;
}

uint64_t getEnumTagSinglePayload for OS_dispatch_queue.AutoreleaseFrequency(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for OS_dispatch_queue.AutoreleaseFrequency(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x18BFA58F0);
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

ValueMetadata *type metadata accessor for OS_dispatch_queue_concurrent.Attributes()
{
  return &type metadata for OS_dispatch_queue_concurrent.Attributes;
}

ValueMetadata *type metadata accessor for OS_dispatch_workloop.Attributes()
{
  return &type metadata for OS_dispatch_workloop.Attributes;
}

uint64_t sub_18BFA5938()
{
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_18BFA5948()
{
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_18BFA5958()
{
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_18BFA5968()
{
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_18BFA5978()
{
  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_18BFA59B0()
{
  return MEMORY[0x1F4186498](v0, 40, 7);
}

uint64_t sub_18BFA59C0()
{
  swift_release();
  swift_release();
  swift_release();

  return MEMORY[0x1F4186498](v0, 56, 7);
}

uint64_t partial apply for closure #1 in closure #1 in OS_dispatch_queue._syncHelper<A>(fn:flags:execute:rescue:)()
{
  return closure #1 in closure #1 in OS_dispatch_queue._syncHelper<A>(fn:flags:execute:rescue:)(*(void *)(v0 + 24), *(void (**)(void))(v0 + 32), *(void *)(v0 + 40), *(void *)(v0 + 48), *(void *)(v0 + 16));
}

uint64_t sub_18BFA5A18()
{
  return MEMORY[0x1F4186498](v0, 40, 7);
}

uint64_t sub_18BFA5A28()
{
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t OS_dispatch_source.setCancelHandler(handler:)(uint64_t a1, uint64_t a2)
{
  return OS_dispatch_source.setEventHandler(handler:)(a1, a2, (uint64_t (*)(uint64_t, uint64_t))_swift_dispatch_source_set_cancel_handler);
}

void OS_dispatch_source.setRegistrationHandler(qos:flags:handler:)(unsigned __int8 *a1, uint64_t *a2, void *a3, uint64_t a4)
{
}

uint64_t OS_dispatch_source.setRegistrationHandler(handler:)(uint64_t a1, uint64_t a2)
{
  return OS_dispatch_source.setEventHandler(handler:)(a1, a2, (uint64_t (*)(uint64_t, uint64_t))_swift_dispatch_source_set_registration_handler);
}

uint64_t OS_dispatch_source.handle.getter(uint64_t a1)
{
  return OS_dispatch_source.handle.getter(a1, MEMORY[0x1E4F147D0]);
}

uint64_t OS_dispatch_source.mask.getter(uint64_t a1)
{
  return OS_dispatch_source.handle.getter(a1, MEMORY[0x1E4F147D8]);
}

uint64_t OS_dispatch_source.data.getter(uint64_t a1)
{
  return OS_dispatch_source.handle.getter(a1, MEMORY[0x1E4F147C8]);
}

uint64_t OS_dispatch_source.handle.getter(uint64_t a1, uint64_t (*a2)(uint64_t))
{
  self;
  uint64_t v2 = swift_dynamicCastObjCClassUnconditional();

  return a2(v2);
}

BOOL OS_dispatch_source.isCancelled.getter()
{
  self;
  uint64_t v0 = swift_dynamicCastObjCClassUnconditional();
  return dispatch_source_testcancel(v0) != 0;
}

uint64_t OS_dispatch_source.MachSendEvent.rawValue.getter()
{
  return *(void *)v0;
}

uint64_t OS_dispatch_source.MemoryPressureEvent.rawValue.getter()
{
  return *(void *)v0;
}

void static OS_dispatch_source.MemoryPressureEvent.mslStatus.getter(void *a1@<X8>)
{
  *a1 = 4026531840;
}

void one-time initialization function for all()
{
  uint64_t v0 = unk_1ED98C320;
  if ((unk_1ED98C320 & ~qword_1ED98C318) == 0) {
    uint64_t v0 = 0;
  }
  uint64_t v1 = qword_1ED98C328;
  if ((qword_1ED98C328 & ~(v0 | qword_1ED98C318)) == 0) {
    uint64_t v1 = 0;
  }
  static OS_dispatch_source.MemoryPressureEvent.all = v1 | v0 | qword_1ED98C318;
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  uint64_t v0 = unk_1ED98C210;
  if ((unk_1ED98C210 & ~qword_1ED98C208) == 0) {
    uint64_t v0 = 0;
  }
  uint64_t v1 = v0 | qword_1ED98C208;
  int v3 = qword_1ED98C218;
  uint64_t v2 = unk_1ED98C220;
  if ((qword_1ED98C218 & ~v1) == 0) {
    int v3 = 0;
  }
  unsigned int v4 = v3 | v1;
  if ((unk_1ED98C220 & ~v4) == 0) {
    uint64_t v2 = 0;
  }
  static OS_dispatch_source.ProcessEvent.all = v2 | v4;
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  uint64_t v0 = unk_1ED98C2A0;
  if ((unk_1ED98C2A0 & ~qword_1ED98C298) == 0) {
    uint64_t v0 = 0;
  }
  uint64_t v1 = v0 | qword_1ED98C298;
  uint64_t v2 = qword_1ED98C2A8;
  if ((qword_1ED98C2A8 & ~v1) == 0) {
    uint64_t v2 = 0;
  }
  int v3 = v2 | v1;
  if ((unk_1ED98C2B0 & ~v3) != 0) {
    unsigned int v4 = unk_1ED98C2B0;
  }
  else {
    unsigned int v4 = 0;
  }
  uint64_t v5 = v4 | v3;
  unsigned int v6 = qword_1ED98C2B8;
  if ((qword_1ED98C2B8 & ~v5) == 0) {
    unsigned int v6 = 0;
  }
  BOOL v7 = v6 | v5;
  if ((unk_1ED98C2C0 & ~v7) != 0) {
    int v8 = unk_1ED98C2C0;
  }
  else {
    int v8 = 0;
  }
  uint64_t v9 = v8 | v7;
  dispatch_autorelease_frequency_t v10 = qword_1ED98C2C8;
  if ((qword_1ED98C2C8 & ~v9) == 0) {
    dispatch_autorelease_frequency_t v10 = 0;
  }
  static OS_dispatch_source.FileSystemEvent.all = v10 | v9;
}

void *static OS_dispatch_source.MemoryPressureEvent.all.getter@<X0>(void *a1@<X8>)
{
  return static OS_dispatch_source.MemoryPressureEvent.all.getter(&one-time initialization token for all, &static OS_dispatch_source.MemoryPressureEvent.all, a1);
}

uint64_t OS_dispatch_source.MemoryPressureEvent.description.getter()
{
  uint64_t result = 0x6C616D726F6ELL;
  switch(*v0)
  {
    case 1:
      return result;
    case 2:
      uint64_t result = 0x676E696E726177;
      break;
    case 3:
    case 5:
    case 6:
    case 7:
    case 8:
    case 9:
    case 0xALL:
    case 0xBLL:
    case 0xCLL:
    case 0xDLL:
    case 0xELL:
    case 0xFLL:
    case 0x11:
    case 0x12:
    case 0x13:
    case 0x14:
    case 0x15:
    case 0x16:
    case 0x17:
    case 0x18:
    case 0x19:
    case 0x1ALL:
    case 0x1BLL:
    case 0x1CLL:
    case 0x1DLL:
    case 0x1ELL:
    case 0x1FLL:
      goto LABEL_5;
    case 4:
      uint64_t result = 0x6C61636974697263;
      break;
    case 0x10:
      uint64_t result = 0xD000000000000015;
      break;
    case 0x20:
      uint64_t result = 0xD000000000000016;
      break;
    default:
      if (*v0 == 4026531840) {
        uint64_t result = 0xD000000000000014;
      }
      else {
LABEL_5:
      }
        uint64_t result = dispatch thunk of CustomStringConvertible.description.getter();
      break;
  }
  return result;
}

uint64_t OS_dispatch_source.ProcessEvent.rawValue.getter()
{
  return *(void *)v0;
}

void static OS_dispatch_source.ProcessEvent.exit.getter(void *a1@<X8>)
{
  *a1 = 0x80000000;
}

void static OS_dispatch_source.ProcessEvent.fork.getter(void *a1@<X8>)
{
  *a1 = 0x40000000;
}

void static OS_dispatch_source.ProcessEvent.exec.getter(void *a1@<X8>)
{
  *a1 = 0x20000000;
}

void static OS_dispatch_source.ProcessEvent.signal.getter(void *a1@<X8>)
{
  *a1 = 0x8000000;
}

void *static OS_dispatch_source.ProcessEvent.all.getter@<X0>(void *a1@<X8>)
{
  return static OS_dispatch_source.MemoryPressureEvent.all.getter(&one-time initialization token for all, &static OS_dispatch_source.ProcessEvent.all, a1);
}

uint64_t OS_dispatch_source.TimerFlags.rawValue.getter()
{
  return *(void *)v0;
}

uint64_t OS_dispatch_source.TimerFlags.init(rawValue:)@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t OS_dispatch_source.FileSystemEvent.rawValue.getter()
{
  return *(void *)v0;
}

void static OS_dispatch_source.FileSystemEvent.attrib.getter(void *a1@<X8>)
{
  *a1 = 8;
}

void static OS_dispatch_source.FileSystemEvent.link.getter(void *a1@<X8>)
{
  *a1 = 16;
}

void static OS_dispatch_source.FileSystemEvent.rename.getter(void *a1@<X8>)
{
  *a1 = 32;
}

void static OS_dispatch_source.FileSystemEvent.revoke.getter(void *a1@<X8>)
{
  *a1 = 64;
}

void static OS_dispatch_source.FileSystemEvent.funlock.getter(void *a1@<X8>)
{
  *a1 = 256;
}

void *static OS_dispatch_source.FileSystemEvent.all.getter@<X0>(void *a1@<X8>)
{
  return static OS_dispatch_source.MemoryPressureEvent.all.getter(&one-time initialization token for all, &static OS_dispatch_source.FileSystemEvent.all, a1);
}

void *static OS_dispatch_source.MemoryPressureEvent.all.getter@<X0>(void *result@<X0>, void *a2@<X1>, void *a3@<X8>)
{
  if (*result != -1) {
    uint64_t result = (void *)swift_once();
  }
  *a3 = *a2;
  return result;
}

dispatch_source_t static OS_dispatch_source.makeMachSendSource(port:eventMask:queue:)(unsigned int a1, uintptr_t *a2, void *a3)
{
  return _swift_dispatch_source_create(MEMORY[0x1E4F14460], a1, *a2, a3);
}

dispatch_source_t static OS_dispatch_source.makeMachReceiveSource(port:queue:)(unsigned int a1, void *a2)
{
  return _swift_dispatch_source_create(MEMORY[0x1E4F14458], a1, 0, a2);
}

dispatch_source_t static OS_dispatch_source.makeProcessSource(identifier:eventMask:queue:)(NSObject *a1, uintptr_t *a2, void *a3)
{
  return static OS_dispatch_source.makeProcessSource(identifier:eventMask:queue:)(a1, a2, a3, MEMORY[0x1E4F14470]);
}

dispatch_source_t static OS_dispatch_source.makeReadSource(fileDescriptor:queue:)(NSObject *a1, void *a2)
{
  return static OS_dispatch_source.makeReadSource(fileDescriptor:queue:)(a1, a2, MEMORY[0x1E4F14478]);
}

dispatch_source_t static OS_dispatch_source.makeUserDataAddSource(queue:)(void *a1)
{
  return _swift_dispatch_source_create(MEMORY[0x1E4F14438], 0, 0, a1);
}

dispatch_source_t static OS_dispatch_source.makeUserDataOrSource(queue:)(void *a1)
{
  return _swift_dispatch_source_create(MEMORY[0x1E4F14440], 0, 0, a1);
}

dispatch_source_t static OS_dispatch_source.makeUserDataReplaceSource(queue:)(void *a1)
{
  return _swift_dispatch_source_create(MEMORY[0x1E4F14448], 0, 0, a1);
}

dispatch_source_t static OS_dispatch_source.makeFileSystemObjectSource(fileDescriptor:eventMask:queue:)(NSObject *a1, uintptr_t *a2, void *a3)
{
  return static OS_dispatch_source.makeProcessSource(identifier:eventMask:queue:)(a1, a2, a3, MEMORY[0x1E4F144A8]);
}

dispatch_source_t static OS_dispatch_source.makeProcessSource(identifier:eventMask:queue:)(dispatch_source_t result, uintptr_t *a2, void *a3, const dispatch_source_type_s *a4)
{
  if ((result & 0x80000000) == 0) {
    return _swift_dispatch_source_create(a4, result, *a2, a3);
  }
  __break(1u);
  return result;
}

dispatch_source_t static OS_dispatch_source.makeWriteSource(fileDescriptor:queue:)(NSObject *a1, void *a2)
{
  return static OS_dispatch_source.makeReadSource(fileDescriptor:queue:)(a1, a2, MEMORY[0x1E4F144B0]);
}

uint64_t OS_dispatch_source_mach_send.data.getter@<X0>(uint64_t *a1@<X8>)
{
  return OS_dispatch_source_mach_send.data.getter(MEMORY[0x1E4F147C8], a1);
}

uint64_t OS_dispatch_source_mach_send.mask.getter@<X0>(uint64_t *a1@<X8>)
{
  return OS_dispatch_source_mach_send.data.getter(MEMORY[0x1E4F147D8], a1);
}

uintptr_t OS_dispatch_source_mach_send.handle.getter()
{
  self;
  uint64_t v0 = swift_dynamicCastObjCClassUnconditional();
  uintptr_t result = dispatch_source_get_handle(v0);
  if (HIDWORD(result)) {
    __break(1u);
  }
  return result;
}

uint64_t OS_dispatch_source_memorypressure.data.getter@<X0>(uint64_t *a1@<X8>)
{
  return OS_dispatch_source_mach_send.data.getter(MEMORY[0x1E4F147C8], a1);
}

uint64_t OS_dispatch_source_memorypressure.mask.getter@<X0>(uint64_t *a1@<X8>)
{
  return OS_dispatch_source_mach_send.data.getter(MEMORY[0x1E4F147D8], a1);
}

uint64_t OS_dispatch_source_proc.data.getter@<X0>(uint64_t *a1@<X8>)
{
  return OS_dispatch_source_mach_send.data.getter(MEMORY[0x1E4F147C8], a1);
}

uint64_t OS_dispatch_source_proc.mask.getter@<X0>(uint64_t *a1@<X8>)
{
  return OS_dispatch_source_mach_send.data.getter(MEMORY[0x1E4F147D8], a1);
}

void OS_dispatch_source_timer.scheduleOneshot(deadline:leeway:)(dispatch_time_t *a1, uint64_t a2)
{
  dispatch_time_t v2 = *a1;
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)a2;
  uint64_t v5 = *(unsigned __int8 *)(a2 + 8);
  self;
  unsigned int v6 = swift_dynamicCastObjCClassUnconditional();
  uint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
  switch(v5)
  {
    case 1:
      uint64_t v8 = 1000000;
      goto LABEL_5;
    case 2:
      uint64_t v8 = 1000;
      goto LABEL_5;
    case 3:
      goto LABEL_8;
    case 4:
      goto LABEL_9;
    default:
      uint64_t v8 = 1000000000;
LABEL_5:
      uint64_t v4 = v3 * v8;
      if ((unsigned __int128)(v3 * (__int128)v8) >> 64 == (v3 * v8) >> 63) {
        goto LABEL_8;
      }
      if (v3 <= 0)
      {
        do
        {
          __break(1u);
LABEL_8:
          uint64_t v7 = v4;
        }
        while ((v4 & 0x8000000000000000) != 0);
      }
LABEL_9:
      dispatch_source_set_timer(v6, v2, 0xFFFFFFFFFFFFFFFFLL, v7);
      return;
  }
}

uintptr_t OS_dispatch_source_proc.handle.getter()
{
  self;
  uint64_t v0 = swift_dynamicCastObjCClassUnconditional();
  uintptr_t result = dispatch_source_get_handle(v0);
  if (result >> 31) {
    __break(1u);
  }
  return result;
}

uint64_t OS_dispatch_source_vnode.data.getter@<X0>(uint64_t *a1@<X8>)
{
  return OS_dispatch_source_mach_send.data.getter(MEMORY[0x1E4F147C8], a1);
}

uint64_t OS_dispatch_source_vnode.mask.getter@<X0>(uint64_t *a1@<X8>)
{
  return OS_dispatch_source_mach_send.data.getter(MEMORY[0x1E4F147D8], a1);
}

uint64_t OS_dispatch_source_mach_send.data.getter@<X0>(uint64_t (*a1)(uint64_t)@<X1>, uint64_t *a2@<X8>)
{
  self;
  uint64_t v4 = swift_dynamicCastObjCClassUnconditional();
  uint64_t result = a1(v4);
  *a2 = result;
  return result;
}

void OS_dispatch_source_data_add.add(data:)(uintptr_t a1)
{
  self;
  dispatch_time_t v2 = swift_dynamicCastObjCClassUnconditional();

  dispatch_source_merge_data(v2, a1);
}

dispatch_source_t static OS_dispatch_source.makeExclavesNotificationSource(identifier:eventMask:queue:)(uintptr_t a1, unsigned int a2, void *a3)
{
  return _swift_dispatch_source_create(MEMORY[0x1E4F14450], a1, a2, a3);
}

void _swift_dispatch_source_set_registration_handler(void *a1, void *a2)
{
  uint64_t v3 = a1;
  id v4 = a2;
  dispatch_source_set_registration_handler(v3, v4);
}

unint64_t lazy protocol witness table accessor for type OS_dispatch_source.MachSendEvent and conformance OS_dispatch_source.MachSendEvent()
{
  unint64_t result = lazy protocol witness table cache variable for type OS_dispatch_source.MachSendEvent and conformance OS_dispatch_source.MachSendEvent;
  if (!lazy protocol witness table cache variable for type OS_dispatch_source.MachSendEvent and conformance OS_dispatch_source.MachSendEvent)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OS_dispatch_source.MachSendEvent and conformance OS_dispatch_source.MachSendEvent);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type OS_dispatch_source.MachSendEvent and conformance OS_dispatch_source.MachSendEvent;
  if (!lazy protocol witness table cache variable for type OS_dispatch_source.MachSendEvent and conformance OS_dispatch_source.MachSendEvent)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OS_dispatch_source.MachSendEvent and conformance OS_dispatch_source.MachSendEvent);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type OS_dispatch_source.MachSendEvent and conformance OS_dispatch_source.MachSendEvent;
  if (!lazy protocol witness table cache variable for type OS_dispatch_source.MachSendEvent and conformance OS_dispatch_source.MachSendEvent)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OS_dispatch_source.MachSendEvent and conformance OS_dispatch_source.MachSendEvent);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type OS_dispatch_source.MachSendEvent and conformance OS_dispatch_source.MachSendEvent;
  if (!lazy protocol witness table cache variable for type OS_dispatch_source.MachSendEvent and conformance OS_dispatch_source.MachSendEvent)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OS_dispatch_source.MachSendEvent and conformance OS_dispatch_source.MachSendEvent);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type OS_dispatch_source.ProcessEvent and conformance OS_dispatch_source.ProcessEvent()
{
  unint64_t result = lazy protocol witness table cache variable for type OS_dispatch_source.ProcessEvent and conformance OS_dispatch_source.ProcessEvent;
  if (!lazy protocol witness table cache variable for type OS_dispatch_source.ProcessEvent and conformance OS_dispatch_source.ProcessEvent)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OS_dispatch_source.ProcessEvent and conformance OS_dispatch_source.ProcessEvent);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type OS_dispatch_source.ProcessEvent and conformance OS_dispatch_source.ProcessEvent;
  if (!lazy protocol witness table cache variable for type OS_dispatch_source.ProcessEvent and conformance OS_dispatch_source.ProcessEvent)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OS_dispatch_source.ProcessEvent and conformance OS_dispatch_source.ProcessEvent);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type OS_dispatch_source.ProcessEvent and conformance OS_dispatch_source.ProcessEvent;
  if (!lazy protocol witness table cache variable for type OS_dispatch_source.ProcessEvent and conformance OS_dispatch_source.ProcessEvent)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OS_dispatch_source.ProcessEvent and conformance OS_dispatch_source.ProcessEvent);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type OS_dispatch_source.ProcessEvent and conformance OS_dispatch_source.ProcessEvent;
  if (!lazy protocol witness table cache variable for type OS_dispatch_source.ProcessEvent and conformance OS_dispatch_source.ProcessEvent)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OS_dispatch_source.ProcessEvent and conformance OS_dispatch_source.ProcessEvent);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type OS_dispatch_source.FileSystemEvent and conformance OS_dispatch_source.FileSystemEvent()
{
  unint64_t result = lazy protocol witness table cache variable for type OS_dispatch_source.FileSystemEvent and conformance OS_dispatch_source.FileSystemEvent;
  if (!lazy protocol witness table cache variable for type OS_dispatch_source.FileSystemEvent and conformance OS_dispatch_source.FileSystemEvent)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OS_dispatch_source.FileSystemEvent and conformance OS_dispatch_source.FileSystemEvent);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type OS_dispatch_source.FileSystemEvent and conformance OS_dispatch_source.FileSystemEvent;
  if (!lazy protocol witness table cache variable for type OS_dispatch_source.FileSystemEvent and conformance OS_dispatch_source.FileSystemEvent)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OS_dispatch_source.FileSystemEvent and conformance OS_dispatch_source.FileSystemEvent);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type OS_dispatch_source.FileSystemEvent and conformance OS_dispatch_source.FileSystemEvent;
  if (!lazy protocol witness table cache variable for type OS_dispatch_source.FileSystemEvent and conformance OS_dispatch_source.FileSystemEvent)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OS_dispatch_source.FileSystemEvent and conformance OS_dispatch_source.FileSystemEvent);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type OS_dispatch_source.FileSystemEvent and conformance OS_dispatch_source.FileSystemEvent;
  if (!lazy protocol witness table cache variable for type OS_dispatch_source.FileSystemEvent and conformance OS_dispatch_source.FileSystemEvent)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OS_dispatch_source.FileSystemEvent and conformance OS_dispatch_source.FileSystemEvent);
  }
  return result;
}

ValueMetadata *type metadata accessor for OS_dispatch_source.MachSendEvent()
{
  return &type metadata for OS_dispatch_source.MachSendEvent;
}

ValueMetadata *type metadata accessor for OS_dispatch_source.ProcessEvent()
{
  return &type metadata for OS_dispatch_source.ProcessEvent;
}

uint64_t DispatchTime.rawValue.getter()
{
  return *(void *)v0;
}

BOOL static DispatchTime.< infix(_:_:)(void *a1, void *a2)
{
  return *a1 < *a2;
}

BOOL protocol witness for static Comparable.<= infix(_:_:) in conformance DispatchTime(void *a1, void *a2)
{
  return *a2 >= *a1;
}

BOOL protocol witness for static Comparable.> infix(_:_:) in conformance DispatchTime(void *a1, void *a2)
{
  return *a2 < *a1;
}

BOOL static DispatchTime.== infix(_:_:)(void *a1, void *a2)
{
  return *a1 == *a2;
}

uint64_t DispatchWallTime.rawValue.getter()
{
  return *(void *)v0;
}

dispatch_time_t DispatchWallTime.init(timespec:)@<X0>(__darwin_time_t a1@<X0>, uint64_t a2@<X1>, dispatch_time_t *a3@<X8>)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  when.tv_sec = a1;
  when.tv_nsec = a2;
  dispatch_time_t result = dispatch_walltime(&when, 0);
  *a3 = result;
  return result;
}

uint64_t *protocol witness for static Comparable.< infix(_:_:) in conformance DispatchWallTime(uint64_t *result, uint64_t *a2)
{
  uint64_t v2 = *result;
  uint64_t v3 = *a2;
  if (*a2 == -1) {
    return (uint64_t *)(v2 != -1);
  }
  if (v2 == -1) {
    return 0;
  }
  BOOL v4 = __OFSUB__(0, v2);
  uint64_t v5 = -v2;
  if (v4)
  {
    __break(1u);
  }
  else
  {
    BOOL v4 = __OFSUB__(0, v3);
    uint64_t v6 = -v3;
    if (!v4) {
      return (uint64_t *)(v5 < v6);
    }
  }
  __break(1u);
  return result;
}

uint64_t *static DispatchWallTime.< infix(_:_:)(uint64_t *result, uint64_t *a2)
{
  uint64_t v2 = *result;
  uint64_t v3 = *a2;
  if (*a2 == -1) {
    return (uint64_t *)(v2 != -1);
  }
  if (v2 == -1) {
    return 0;
  }
  BOOL v4 = __OFSUB__(0, v2);
  uint64_t v5 = -v2;
  if (v4)
  {
    __break(1u);
  }
  else
  {
    BOOL v4 = __OFSUB__(0, v3);
    uint64_t v6 = -v3;
    if (!v4) {
      return (uint64_t *)(v5 < v6);
    }
  }
  __break(1u);
  return result;
}

BOOL protocol witness for static Comparable.<= infix(_:_:) in conformance DispatchWallTime(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = *a2;
  BOOL result = *a2 == -1 || *a1 != -1;
  if (v2 != -1 && v3 != -1)
  {
    BOOL v6 = __OFSUB__(0, v3);
    uint64_t v7 = -v3;
    if (v6)
    {
      __break(1u);
    }
    else
    {
      BOOL v6 = __OFSUB__(0, v2);
      uint64_t v8 = -v2;
      if (!v6) {
        return v7 >= v8;
      }
    }
    __break(1u);
  }
  return result;
}

BOOL protocol witness for static Comparable.>= infix(_:_:) in conformance DispatchWallTime(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = *a2;
  BOOL result = *a1 == -1 || *a2 != -1;
  if (v3 != -1 && v2 != -1)
  {
    BOOL v6 = __OFSUB__(0, v2);
    uint64_t v7 = -v2;
    if (v6)
    {
      __break(1u);
    }
    else
    {
      BOOL v6 = __OFSUB__(0, v3);
      uint64_t v8 = -v3;
      if (!v6) {
        return v7 >= v8;
      }
    }
    __break(1u);
  }
  return result;
}

uint64_t *protocol witness for static Comparable.> infix(_:_:) in conformance DispatchWallTime(uint64_t *result, uint64_t *a2)
{
  uint64_t v2 = *result;
  uint64_t v3 = *a2;
  if (*result == -1) {
    return (uint64_t *)(v3 != -1);
  }
  if (v3 == -1) {
    return 0;
  }
  BOOL v4 = __OFSUB__(0, v3);
  uint64_t v5 = -v3;
  if (v4)
  {
    __break(1u);
  }
  else
  {
    BOOL v4 = __OFSUB__(0, v2);
    uint64_t v6 = -v2;
    if (!v4) {
      return (uint64_t *)(v5 < v6);
    }
  }
  __break(1u);
  return result;
}

dispatch_time_t - infix(_:_:)@<X0>(dispatch_time_t *a1@<X0>, uint64_t a2@<X1>, dispatch_time_t *a3@<X8>)
{
  dispatch_time_t v3 = *a1;
  uint64_t v4 = *(void *)a2;
  unint64_t v6 = *(void *)a2;
  switch(*(unsigned char *)(a2 + 8))
  {
    case 1:
      uint64_t v7 = 1000000;
      goto LABEL_5;
    case 2:
      uint64_t v7 = 1000;
      goto LABEL_5;
    case 3:
      goto LABEL_8;
    case 4:
      int64_t v8 = 0x8000000000000001;
      goto LABEL_9;
    default:
      uint64_t v7 = 1000000000;
LABEL_5:
      unint64_t v6 = v4 * v7;
      if ((unsigned __int128)(v4 * (__int128)v7) >> 64 != (v4 * v7) >> 63)
      {
        unint64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
        if (v4 <= 0) {
          unint64_t v6 = 0x8000000000000000;
        }
      }
LABEL_8:
      int64_t v8 = -(uint64_t)v6;
      if (__OFSUB__(0, v6))
      {
        __break(1u);
        JUMPOUT(0x18BFA6D64);
      }
LABEL_9:
      dispatch_time_t result = dispatch_time(v3, v8);
      *a3 = result;
      return result;
  }
}

dispatch_time_t - infix(_:_:)@<X0>(dispatch_time_t *a1@<X0>, dispatch_time_t *a2@<X8>, double a3@<D0>)
{
  dispatch_time_t v4 = *a1;
  int64_t v5 = toInt64Clamped(_:)(a3 * -1000000000.0);
  dispatch_time_t result = dispatch_time(v4, v5);
  *a2 = result;
  return result;
}

BOOL specialized static DispatchTimeInterval.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)a1;
  uint64_t v3 = *(unsigned __int8 *)(a1 + 8);
  uint64_t v4 = *(void *)a2;
  BOOL v6 = v3 == 4 && v2 == 0;
  BOOL v7 = *(unsigned char *)(a2 + 8) == 4 && v4 == 0;
  char v8 = v7;
  BOOL result = v7 && v6;
  if (!v6 && (v8 & 1) == 0)
  {
    unint64_t v10 = v2;
    unint64_t v11 = *(void *)a2;
    switch(v3)
    {
      case 1:
        uint64_t v12 = 1000000;
        goto LABEL_22;
      case 2:
        uint64_t v12 = 1000;
        goto LABEL_22;
      case 3:
        goto LABEL_27;
      case 4:
        unint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
        goto LABEL_27;
      default:
        uint64_t v12 = 1000000000;
LABEL_22:
        unint64_t v10 = v2 * v12;
        if ((unsigned __int128)(v2 * (__int128)v12) >> 64 != (v2 * v12) >> 63)
        {
          unint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
          if (v2 <= 0) {
            unint64_t v10 = 0x8000000000000000;
          }
        }
LABEL_27:
        switch(*(unsigned char *)(a2 + 8))
        {
          case 1:
            uint64_t v13 = 1000000;
            goto LABEL_31;
          case 2:
            uint64_t v13 = 1000;
            goto LABEL_31;
          case 3:
            goto LABEL_36;
          case 4:
            unint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
            goto LABEL_36;
          default:
            uint64_t v13 = 1000000000;
LABEL_31:
            unint64_t v11 = v4 * v13;
            if ((unsigned __int128)(v4 * (__int128)v13) >> 64 != (v4 * v13) >> 63)
            {
              if (v4 > 0) {
                unint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
              }
              else {
                unint64_t v11 = 0x8000000000000000;
              }
            }
LABEL_36:
            BOOL result = v10 == v11;
            break;
        }
        break;
    }
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type DispatchWallTime and conformance DispatchWallTime()
{
  unint64_t result = lazy protocol witness table cache variable for type DispatchWallTime and conformance DispatchWallTime;
  if (!lazy protocol witness table cache variable for type DispatchWallTime and conformance DispatchWallTime)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type DispatchWallTime and conformance DispatchWallTime);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for DispatchTimeInterval(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFC && *(unsigned char *)(a1 + 9)) {
    return (*(_DWORD *)a1 + 252);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 8);
  if (v3 <= 4) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for DispatchTimeInterval(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFB)
  {
    *(unsigned char *)(result + 8) = 0;
    *(void *)unint64_t result = a2 - 252;
    if (a3 >= 0xFC) {
      *(unsigned char *)(result + 9) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFC) {
      *(unsigned char *)(result + 9) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 8) = -(char)a2;
    }
  }
  return result;
}

void OS_dispatch_queue.SchedulerTimeType.dispatchTime.getter(void *a1@<X8>)
{
  *a1 = *v1;
}

void *OS_dispatch_queue.SchedulerTimeType.dispatchTime.setter(void *result)
{
  *uint64_t v1 = *result;
  return result;
}

uint64_t (*OS_dispatch_queue.SchedulerTimeType.dispatchTime.modify())()
{
  return protocol witness for Collection.subscript.read in conformance DispatchData;
}

void *OS_dispatch_queue.SchedulerTimeType.init(_:)@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

uint64_t OS_dispatch_queue.SchedulerTimeType.init(from:)@<X0>(void *a1@<X0>, unint64_t *a2@<X8>)
{
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  dispatch thunk of Decoder.singleValueContainer()();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  }
  __swift_project_boxed_opaque_existential_1(v11, v11[3]);
  uint64_t result = dispatch thunk of SingleValueDecodingContainer.decode(_:)();
  unint64_t v6 = result;
  if (result == -1) {
    goto LABEL_11;
  }
  if (one-time initialization token for timebaseInfo != -1) {
    uint64_t result = swift_once();
  }
  if (static DispatchTime.timebaseInfo == HIDWORD(static DispatchTime.timebaseInfo))
  {
LABEL_11:
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v11);
    *a2 = v6;
    return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  }
  if (!is_mul_ok(v6, HIDWORD(static DispatchTime.timebaseInfo)))
  {
LABEL_10:
    unint64_t v6 = -1;
    goto LABEL_11;
  }
  unsigned int v7 = static DispatchTime.timebaseInfo - 1;
  if (static DispatchTime.timebaseInfo)
  {
    unint64_t v8 = v6 * HIDWORD(static DispatchTime.timebaseInfo);
    BOOL v9 = __CFADD__(v8, v7);
    unint64_t v10 = v8 + v7;
    if (!v9)
    {
      unint64_t v6 = v10 / static DispatchTime.timebaseInfo;
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  __break(1u);
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

uint64_t OS_dispatch_queue.SchedulerTimeType.encode(to:)(void *a1)
{
  unint64_t v2 = *v1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  uint64_t result = dispatch thunk of Encoder.singleValueContainer()();
  if (v2 == -1) {
    goto LABEL_7;
  }
  if (one-time initialization token for timebaseInfo != -1) {
    uint64_t result = swift_once();
  }
  if (static DispatchTime.timebaseInfo == HIDWORD(static DispatchTime.timebaseInfo)
    || !is_mul_ok(v2, static DispatchTime.timebaseInfo)
    || HIDWORD(static DispatchTime.timebaseInfo))
  {
LABEL_7:
    __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v4, v5);
    dispatch thunk of SingleValueEncodingContainer.encode(_:)();
    return __swift_destroy_boxed_opaque_existential_0((uint64_t)v4);
  }
  else
  {
    __break(1u);
  }
  return result;
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

unint64_t *OS_dispatch_queue.SchedulerTimeType.distance(to:)@<X0>(unint64_t *a1@<X0>, unint64_t *a2@<X8>)
{
  unint64_t v4 = *v2;
  v8[0] = *a1;
  v8[1] = v4;
  uint64_t result = DispatchTime.distance(to:)(v8, (uint64_t)&v9);
  unint64_t v6 = v9;
  switch(v10)
  {
    case 1:
      uint64_t v7 = 1000000;
      goto LABEL_5;
    case 2:
      uint64_t v7 = 1000;
      goto LABEL_5;
    case 3:
      goto LABEL_10;
    case 4:
      unint64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
      goto LABEL_10;
    default:
      uint64_t v7 = 1000000000;
LABEL_5:
      unint64_t v6 = v9 * v7;
      if ((unsigned __int128)(v9 * (__int128)v7) >> 64 != (v9 * v7) >> 63)
      {
        unint64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
        if (v9 <= 0) {
          unint64_t v6 = 0x8000000000000000;
        }
      }
LABEL_10:
      *a2 = v6;
      return result;
  }
}

dispatch_time_t OS_dispatch_queue.SchedulerTimeType.advanced(by:)@<X0>(int64_t *a1@<X0>, dispatch_time_t *a2@<X8>)
{
  dispatch_time_t result = dispatch_time(*v2, *a1);
  *a2 = result;
  return result;
}

void OS_dispatch_queue.SchedulerTimeType.Stride.timeInterval.getter(uint64_t a1@<X8>)
{
  *(void *)a1 = *v1;
  *(unsigned char *)(a1 + 8) = 3;
}

void OS_dispatch_queue.SchedulerTimeType.hash(into:)()
{
  Hasher._combine(_:)(*v0);
}

uint64_t OS_dispatch_queue.SchedulerTimeType.Stride.magnitude.getter()
{
  return *(void *)v0;
}

uint64_t OS_dispatch_queue.SchedulerTimeType.Stride.magnitude.setter(uint64_t result)
{
  *uint64_t v1 = result;
  return result;
}

uint64_t (*OS_dispatch_queue.SchedulerTimeType.Stride.magnitude.modify(void *a1))(uint64_t result)
{
  *a1 = *v1;
  a1[1] = v1;
  return OS_dispatch_queue.SchedulerTimeType.Stride.magnitude.modify;
}

uint64_t OS_dispatch_queue.SchedulerTimeType.Stride.magnitude.modify(uint64_t result)
{
  **(void **)(result + 8) = *(void *)result;
  return result;
}

uint64_t OS_dispatch_queue.SchedulerTimeType.Stride.init<A>(exactly:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v75 = a4;
  uint64_t v71 = *(void *)(*(void *)(a3 + 24) + 16);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v6 = MEMORY[0x1F4188790](AssociatedTypeWitness);
  v70 = (char *)&v66 - v7;
  uint64_t v8 = *(void *)(a2 - 8);
  uint64_t v9 = MEMORY[0x1F4188790](v6);
  v68 = (char *)&v66 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = MEMORY[0x1F4188790](v9);
  uint64_t v13 = (char *)&v66 - v12;
  uint64_t v14 = MEMORY[0x1F4188790](v11);
  v73 = (char *)&v66 - v15;
  uint64_t v16 = MEMORY[0x1F4188790](v14);
  v74 = (char *)&v66 - v17;
  uint64_t v18 = MEMORY[0x1F4188790](v16);
  v72 = (char *)&v66 - v19;
  uint64_t v20 = MEMORY[0x1F4188790](v18);
  unint64_t v22 = (char *)&v66 - v21;
  uint64_t v23 = MEMORY[0x1F4188790](v20);
  id v25 = (char *)&v66 - v24;
  MEMORY[0x1F4188790](v23);
  uint64_t v27 = (char *)&v66 - v26;
  uint64_t v77 = v8;
  uint64_t v28 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 16);
  v28((char *)&v66 - v26, a1, a2);
  char v29 = dispatch thunk of static BinaryInteger.isSigned.getter();
  v28(v25, (uint64_t)v27, a2);
  uint64_t v76 = a1;
  v69 = v13;
  BOOL v30 = (v29 & 1) != 0 && dispatch thunk of BinaryInteger.bitWidth.getter() > 64;
  v31 = *(void (**)(char *, uint64_t))(v77 + 8);
  v31(v25, a2);
  v28(v22, (uint64_t)v27, a2);
  if (!v30) {
    goto LABEL_15;
  }
  int64_t v79 = 0x8000000000000000;
  if ((dispatch thunk of static BinaryInteger.isSigned.getter() & 1) == 0)
  {
    char v32 = dispatch thunk of static BinaryInteger.isSigned.getter();
    uint64_t v33 = dispatch thunk of BinaryInteger.bitWidth.getter();
    if (v32)
    {
      if (v33 <= 64)
      {
        swift_getAssociatedConformanceWitness();
        dispatch thunk of _ExpressibleByBuiltinIntegerLiteral.init(_builtinIntegerLiteral:)();
        v59 = v72;
        dispatch thunk of ExpressibleByIntegerLiteral.init(integerLiteral:)();
        char v60 = dispatch thunk of static Comparable.< infix(_:_:)();
        v31(v59, a2);
        v61 = v68;
        (*(void (**)(char *, char *, uint64_t))(v77 + 32))(v68, v22, a2);
        if (v60)
        {
          v31(v61, a2);
          uint64_t v36 = v75;
        }
        else
        {
          v62 = v61;
          int64_t v63 = v79;
          uint64_t v64 = dispatch thunk of BinaryInteger._lowWord.getter();
          v31(v62, a2);
          BOOL v65 = v64 < v63;
          uint64_t v36 = v75;
          if (!v65) {
            goto LABEL_16;
          }
        }
LABEL_37:
        v31(v27, a2);
        uint64_t result = ((uint64_t (*)(uint64_t, uint64_t))v31)(v76, a2);
        uint64_t v53 = 0;
        BOOL v56 = 1;
        goto LABEL_38;
      }
LABEL_10:
      lazy protocol witness table accessor for type Int64 and conformance Int64();
      uint64_t v34 = v72;
      dispatch thunk of BinaryInteger.init<A>(truncatingIfNeeded:)();
      char v35 = dispatch thunk of static Comparable.< infix(_:_:)();
      v31(v34, a2);
      v31(v22, a2);
      uint64_t v36 = v75;
      if ((v35 & 1) == 0) {
        goto LABEL_16;
      }
      goto LABEL_37;
    }
    if (v33 < 64) {
      goto LABEL_13;
    }
LABEL_15:
    v31(v22, a2);
    uint64_t v36 = v75;
    goto LABEL_16;
  }
  if (dispatch thunk of BinaryInteger.bitWidth.getter() >= 64) {
    goto LABEL_10;
  }
LABEL_13:
  uint64_t v37 = dispatch thunk of BinaryInteger._lowWord.getter();
  v31(v22, a2);
  uint64_t v36 = v75;
  if (v37 < v79) {
    goto LABEL_37;
  }
LABEL_16:
  uint64_t v38 = dispatch thunk of BinaryInteger.bitWidth.getter();
  v39 = v74;
  v28(v74, (uint64_t)v27, a2);
  if (v38 < 65)
  {
    uint64_t v42 = dispatch thunk of BinaryInteger.bitWidth.getter();
    v31(v39, a2);
    if (v42 != 64)
    {
      v50 = v73;
      v28(v73, (uint64_t)v27, a2);
      v41 = v50;
      goto LABEL_26;
    }
    char v43 = dispatch thunk of static BinaryInteger.isSigned.getter();
    v44 = v73;
    v28(v73, (uint64_t)v27, a2);
    v41 = v44;
    if (v43)
    {
LABEL_26:
      v31(v41, a2);
      goto LABEL_27;
    }
  }
  else
  {
    v31(v39, a2);
    v40 = v73;
    v28(v73, (uint64_t)v27, a2);
    v41 = v40;
  }
  int64_t v79 = 0x7FFFFFFFFFFFFFFFLL;
  char v45 = dispatch thunk of static BinaryInteger.isSigned.getter();
  uint64_t v46 = dispatch thunk of BinaryInteger.bitWidth.getter();
  if (v45)
  {
    if (v46 > 64)
    {
      lazy protocol witness table accessor for type Int64 and conformance Int64();
      v47 = v72;
      dispatch thunk of BinaryInteger.init<A>(truncatingIfNeeded:)();
      char v48 = dispatch thunk of static Comparable.< infix(_:_:)();
      v31(v47, a2);
      v49 = v41;
      goto LABEL_31;
    }
    goto LABEL_24;
  }
  if (v46 <= 63)
  {
LABEL_24:
    dispatch thunk of BinaryInteger._lowWord.getter();
    goto LABEL_26;
  }
  uint64_t v78 = 0x7FFFFFFFFFFFFFFFLL;
  v57 = v72;
  (*(void (**)(char *, char *, uint64_t))(v77 + 32))(v72, v41, a2);
  lazy protocol witness table accessor for type Int64 and conformance Int64();
  v58 = v69;
  dispatch thunk of BinaryInteger.init<A>(truncatingIfNeeded:)();
  char v48 = dispatch thunk of static Comparable.< infix(_:_:)();
  v31(v58, a2);
  v49 = v57;
LABEL_31:
  v31(v49, a2);
  if (v48) {
    goto LABEL_37;
  }
LABEL_27:
  uint64_t v51 = dispatch thunk of BinaryInteger._lowWord.getter();
  v31(v27, a2);
  uint64_t result = ((uint64_t (*)(uint64_t, uint64_t))v31)(v76, a2);
  uint64_t v53 = 1000000000 * v51;
  uint64_t v54 = (unsigned __int128)(v51 * (__int128)1000000000) >> 64;
  BOOL v55 = v54 == (1000000000 * v51) >> 63;
  BOOL v56 = v54 != (1000000000 * v51) >> 63;
  if (!v55) {
    uint64_t v53 = 0;
  }
LABEL_38:
  *(void *)uint64_t v36 = v53;
  *(unsigned char *)(v36 + 8) = v56;
  return result;
}

unint64_t lazy protocol witness table accessor for type Int64 and conformance Int64()
{
  unint64_t result = lazy protocol witness table cache variable for type Int64 and conformance Int64;
  if (!lazy protocol witness table cache variable for type Int64 and conformance Int64)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Int64 and conformance Int64);
  }
  return result;
}

BOOL static OS_dispatch_queue.SchedulerTimeType.Stride.< infix(_:_:)(void *a1, void *a2)
{
  return *a1 < *a2;
}

uint64_t *static OS_dispatch_queue.SchedulerTimeType.Stride.* infix(_:_:)@<X0>(uint64_t *result@<X0>, uint64_t *a2@<X1>, uint64_t *a3@<X8>)
{
  double v3 = (double)*result / 1000000000.0 * ((double)*a2 / 1000000000.0);
  double v4 = trunc(v3 * 1000000000.0);
  uint64_t v5 = 0x8000000000000000;
  if (v3 > 0.0) {
    uint64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if (v4 < 9.22337204e18 && v4 > -9.22337204e18) {
    uint64_t v5 = (uint64_t)(v3 * 1000000000.0);
  }
  *a3 = v5;
  return result;
}

void *static OS_dispatch_queue.SchedulerTimeType.Stride.+ infix(_:_:)@<X0>(void *result@<X0>, void *a2@<X1>, void *a3@<X8>)
{
  if (__OFADD__(*result, *a2)) {
    __break(1u);
  }
  else {
    *a3 = *result + *a2;
  }
  return result;
}

void *static OS_dispatch_queue.SchedulerTimeType.Stride.- infix(_:_:)@<X0>(void *result@<X0>, void *a2@<X1>, void *a3@<X8>)
{
  if (__OFSUB__(*result, *a2)) {
    __break(1u);
  }
  else {
    *a3 = *result - *a2;
  }
  return result;
}

void *static OS_dispatch_queue.SchedulerTimeType.Stride.-= infix(_:_:)(void *result, void *a2)
{
  if (__OFSUB__(*result, *a2)) {
    __break(1u);
  }
  else {
    *result -= *a2;
  }
  return result;
}

void *static OS_dispatch_queue.SchedulerTimeType.Stride.+= infix(_:_:)(void *result, void *a2)
{
  if (__OFADD__(*result, *a2)) {
    __break(1u);
  }
  else {
    *result += *a2;
  }
  return result;
}

uint64_t static OS_dispatch_queue.SchedulerTimeType.Stride.microseconds(_:)@<X0>(uint64_t result@<X0>, uint64_t *a2@<X8>)
{
  unint64_t v2 = 0x7FFFFFFFFFFFFFFFLL;
  if (result <= 0) {
    unint64_t v2 = 0x8000000000000000;
  }
  if ((unsigned __int128)(result * (__int128)1000) >> 64 == (1000 * result) >> 63) {
    uint64_t v3 = 1000 * result;
  }
  else {
    uint64_t v3 = v2;
  }
  *a2 = v3;
  return result;
}

uint64_t static OS_dispatch_queue.SchedulerTimeType.Stride.nanoseconds(_:)@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = result;
  return result;
}

BOOL static OS_dispatch_queue.SchedulerTimeType.Stride.== infix(_:_:)(void *a1, void *a2)
{
  return *a1 == *a2;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance OS_dispatch_queue.SchedulerTimeType.Stride.CodingKeys()
{
  return 1;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance OS_dispatch_queue.SchedulerTimeType.Stride.CodingKeys()
{
  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance OS_dispatch_queue.SchedulerTimeType.Stride.CodingKeys()
{
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance OS_dispatch_queue.SchedulerTimeType.Stride.CodingKeys()
{
  return Hasher._finalize()();
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance OS_dispatch_queue.SchedulerTimeType.Stride.CodingKeys()
{
  return 0x6365736F6E616E5FLL;
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance OS_dispatch_queue.SchedulerTimeType.Stride.CodingKeys@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  if (a1 == 0x6365736F6E616E5FLL && a2 == 0xEC00000073646E6FLL)
  {
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = 0;
  }
  else
  {
    char v5 = _stringCompareWithSmolCheck(_:_:expecting:)();
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t protocol witness for CodingKey.intValue.getter in conformance OS_dispatch_queue.SchedulerTimeType.Stride.CodingKeys()
{
  return 0;
}

void protocol witness for CodingKey.init(intValue:) in conformance OS_dispatch_queue.SchedulerTimeType.Stride.CodingKeys(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance OS_dispatch_queue.SchedulerTimeType.Stride.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type OS_dispatch_queue.SchedulerTimeType.Stride.CodingKeys and conformance OS_dispatch_queue.SchedulerTimeType.Stride.CodingKeys();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance OS_dispatch_queue.SchedulerTimeType.Stride.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type OS_dispatch_queue.SchedulerTimeType.Stride.CodingKeys and conformance OS_dispatch_queue.SchedulerTimeType.Stride.CodingKeys();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t OS_dispatch_queue.SchedulerTimeType.Stride.encode(to:)(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<OS_dispatch_queue.SchedulerTimeType.Stride.CodingKeys>);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  char v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type OS_dispatch_queue.SchedulerTimeType.Stride.CodingKeys and conformance OS_dispatch_queue.SchedulerTimeType.Stride.CodingKeys();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  KeyedEncodingContainer.encode(_:forKey:)();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t OS_dispatch_queue.SchedulerTimeType.Stride.init(from:)@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<OS_dispatch_queue.SchedulerTimeType.Stride.CodingKeys>);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  uint64_t v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type OS_dispatch_queue.SchedulerTimeType.Stride.CodingKeys and conformance OS_dispatch_queue.SchedulerTimeType.Stride.CodingKeys();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (!v2)
  {
    uint64_t v9 = KeyedDecodingContainer.decode(_:forKey:)();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *a2 = v9;
  }
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
}

uint64_t protocol witness for static SchedulerTimeIntervalConvertible.seconds(_:) in conformance OS_dispatch_queue.SchedulerTimeType.Stride@<X0>(uint64_t result@<X0>, uint64_t *a2@<X8>)
{
  unint64_t v2 = 0x7FFFFFFFFFFFFFFFLL;
  if (result <= 0) {
    unint64_t v2 = 0x8000000000000000;
  }
  if ((unsigned __int128)(result * (__int128)1000000000) >> 64 == (1000000000 * result) >> 63) {
    uint64_t v3 = 1000000000 * result;
  }
  else {
    uint64_t v3 = v2;
  }
  *a2 = v3;
  return result;
}

void protocol witness for static SchedulerTimeIntervalConvertible.seconds(_:) in conformance OS_dispatch_queue.SchedulerTimeType.Stride(uint64_t *a1@<X8>, double a2@<D0>)
{
  double v2 = trunc(a2 * 1000000000.0);
  uint64_t v3 = 0x8000000000000000;
  if (a2 > 0.0) {
    uint64_t v3 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if (v2 < 9.22337204e18 && v2 > -9.22337204e18) {
    uint64_t v3 = (uint64_t)(a2 * 1000000000.0);
  }
  *a1 = v3;
}

uint64_t protocol witness for static SchedulerTimeIntervalConvertible.milliseconds(_:) in conformance OS_dispatch_queue.SchedulerTimeType.Stride@<X0>(uint64_t result@<X0>, uint64_t *a2@<X8>)
{
  unint64_t v2 = 0x7FFFFFFFFFFFFFFFLL;
  if (result <= 0) {
    unint64_t v2 = 0x8000000000000000;
  }
  if ((unsigned __int128)(result * (__int128)1000000) >> 64 == (1000000 * result) >> 63) {
    uint64_t v3 = 1000000 * result;
  }
  else {
    uint64_t v3 = v2;
  }
  *a2 = v3;
  return result;
}

uint64_t protocol witness for static SchedulerTimeIntervalConvertible.microseconds(_:) in conformance OS_dispatch_queue.SchedulerTimeType.Stride@<X0>(uint64_t result@<X0>, uint64_t *a2@<X8>)
{
  unint64_t v2 = 0x7FFFFFFFFFFFFFFFLL;
  if (result <= 0) {
    unint64_t v2 = 0x8000000000000000;
  }
  if ((unsigned __int128)(result * (__int128)1000) >> 64 == (1000 * result) >> 63) {
    uint64_t v3 = 1000 * result;
  }
  else {
    uint64_t v3 = v2;
  }
  *a2 = v3;
  return result;
}

uint64_t protocol witness for static SchedulerTimeIntervalConvertible.nanoseconds(_:) in conformance OS_dispatch_queue.SchedulerTimeType.Stride@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = result;
  return result;
}

BOOL protocol witness for static Comparable.< infix(_:_:) in conformance OS_dispatch_queue.SchedulerTimeType.Stride(void *a1, void *a2)
{
  return *a1 < *a2;
}

BOOL protocol witness for static Comparable.<= infix(_:_:) in conformance OS_dispatch_queue.SchedulerTimeType.Stride(void *a1, void *a2)
{
  return *a2 >= *a1;
}

BOOL protocol witness for static Comparable.>= infix(_:_:) in conformance OS_dispatch_queue.SchedulerTimeType.Stride(void *a1, void *a2)
{
  return *a1 >= *a2;
}

BOOL protocol witness for static Comparable.> infix(_:_:) in conformance OS_dispatch_queue.SchedulerTimeType.Stride(void *a1, void *a2)
{
  return *a2 < *a1;
}

void *protocol witness for static SignedNumeric.- prefix(_:) in conformance OS_dispatch_queue.SchedulerTimeType.Stride@<X0>(void *result@<X0>, void *a2@<X8>)
{
  if (__OFSUB__(0, *result)) {
    __break(1u);
  }
  else {
    *a2 = -*result;
  }
  return result;
}

void protocol witness for SignedNumeric.negate() in conformance OS_dispatch_queue.SchedulerTimeType.Stride()
{
  if (__OFSUB__(0, *v0)) {
    __break(1u);
  }
  else {
    void *v0 = -*v0;
  }
}

double *protocol witness for ExpressibleByFloatLiteral.init(floatLiteral:) in conformance OS_dispatch_queue.SchedulerTimeType.Stride@<X0>(double *result@<X0>, uint64_t *a2@<X8>)
{
  double v2 = *result * 1000000000.0;
  double v3 = trunc(v2);
  uint64_t v4 = 0x8000000000000000;
  if (*result > 0.0) {
    uint64_t v4 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if (v3 < 9.22337204e18 && v3 > -9.22337204e18) {
    uint64_t v4 = (uint64_t)v2;
  }
  *a2 = v4;
  return result;
}

void protocol witness for Hashable.hash(into:) in conformance OS_dispatch_queue.SchedulerTimeType.Stride()
{
  Hasher._combine(_:)(*v0);
}

uint64_t protocol witness for Decodable.init(from:) in conformance OS_dispatch_queue.SchedulerTimeType.Stride@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return OS_dispatch_queue.SchedulerTimeType.Stride.init(from:)(a1, a2);
}

uint64_t protocol witness for Encodable.encode(to:) in conformance OS_dispatch_queue.SchedulerTimeType.Stride(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<OS_dispatch_queue.SchedulerTimeType.Stride.CodingKeys>);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  uint64_t v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type OS_dispatch_queue.SchedulerTimeType.Stride.CodingKeys and conformance OS_dispatch_queue.SchedulerTimeType.Stride.CodingKeys();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  KeyedEncodingContainer.encode(_:forKey:)();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

void *protocol witness for static AdditiveArithmetic.+ infix(_:_:) in conformance OS_dispatch_queue.SchedulerTimeType.Stride@<X0>(void *result@<X0>, void *a2@<X1>, void *a3@<X8>)
{
  if (__OFADD__(*result, *a2)) {
    __break(1u);
  }
  else {
    *a3 = *result + *a2;
  }
  return result;
}

void *protocol witness for static AdditiveArithmetic.+= infix(_:_:) in conformance OS_dispatch_queue.SchedulerTimeType.Stride(void *result, void *a2)
{
  if (__OFADD__(*result, *a2)) {
    __break(1u);
  }
  else {
    *result += *a2;
  }
  return result;
}

void *protocol witness for static AdditiveArithmetic.- infix(_:_:) in conformance OS_dispatch_queue.SchedulerTimeType.Stride@<X0>(void *result@<X0>, void *a2@<X1>, void *a3@<X8>)
{
  if (__OFSUB__(*result, *a2)) {
    __break(1u);
  }
  else {
    *a3 = *result - *a2;
  }
  return result;
}

void *protocol witness for static AdditiveArithmetic.-= infix(_:_:) in conformance OS_dispatch_queue.SchedulerTimeType.Stride(void *result, void *a2)
{
  if (__OFSUB__(*result, *a2)) {
    __break(1u);
  }
  else {
    *result -= *a2;
  }
  return result;
}

uint64_t *protocol witness for ExpressibleByIntegerLiteral.init(integerLiteral:) in conformance OS_dispatch_queue.SchedulerTimeType.Stride@<X0>(uint64_t *result@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2 = 0x7FFFFFFFFFFFFFFFLL;
  if (*result <= 0) {
    uint64_t v2 = 0x8000000000000000;
  }
  if ((unsigned __int128)(*result * (__int128)1000000000) >> 64 == (1000000000 * *result) >> 63) {
    uint64_t v2 = 1000000000 * *result;
  }
  *a2 = v2;
  return result;
}

Swift::Int OS_dispatch_queue.SchedulerTimeType.Stride.hashValue.getter()
{
  Swift::UInt64 v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

uint64_t protocol witness for static Strideable._step(after:from:by:) in conformance OS_dispatch_queue.SchedulerTimeType(dispatch_time_t *a1, uint64_t a2, uint64_t a3, dispatch_time_t *a4, uint64_t a5, int64_t *a6)
{
  *a1 = dispatch_time(*a4, *a6);
  return 0;
}

uint64_t protocol witness for Decodable.init(from:) in conformance OS_dispatch_queue.SchedulerTimeType@<X0>(void *a1@<X0>, unint64_t *a2@<X8>)
{
  return OS_dispatch_queue.SchedulerTimeType.init(from:)(a1, a2);
}

uint64_t protocol witness for Encodable.encode(to:) in conformance OS_dispatch_queue.SchedulerTimeType(void *a1)
{
  return OS_dispatch_queue.SchedulerTimeType.encode(to:)(a1);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance OS_dispatch_queue.SchedulerTimeType.Stride()
{
  Swift::UInt64 v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance OS_dispatch_queue.SchedulerTimeType(unint64_t *a1, unint64_t *a2)
{
  unint64_t v2 = *a1;
  v5[0] = *a2;
  v5[1] = v2;
  OS_dispatch_queue.SchedulerTimeType.distance(to:)(v5, &v4);
  return v4 == 0;
}

void OS_dispatch_queue.SchedulerOptions.qos.getter(uint64_t a1@<X8>)
{
  uint64_t v2 = *(void *)(v1 + 8);
  *(unsigned char *)a1 = *(unsigned char *)v1;
  *(void *)(a1 + 8) = v2;
}

uint64_t OS_dispatch_queue.SchedulerOptions.qos.setter(uint64_t result)
{
  uint64_t v2 = *(void *)(result + 8);
  *(unsigned char *)uint64_t v1 = *(unsigned char *)result;
  *(void *)(v1 + 8) = v2;
  return result;
}

uint64_t (*OS_dispatch_queue.SchedulerOptions.qos.modify())()
{
  return protocol witness for Collection.subscript.read in conformance DispatchData;
}

void OS_dispatch_queue.SchedulerOptions.flags.getter(void *a1@<X8>)
{
  *a1 = *(void *)(v1 + 16);
}

void *OS_dispatch_queue.SchedulerOptions.flags.setter(void *result)
{
  *(void *)(v1 + 16) = *result;
  return result;
}

uint64_t (*OS_dispatch_queue.SchedulerOptions.flags.modify())()
{
  return protocol witness for Collection.subscript.read in conformance DispatchData;
}

void *OS_dispatch_queue.SchedulerOptions.group.getter()
{
  uint64_t v1 = *(void **)(v0 + 24);
  id v2 = v1;
  return v1;
}

void OS_dispatch_queue.SchedulerOptions.group.setter(uint64_t a1)
{
  *(void *)(v1 + 24) = a1;
}

uint64_t (*OS_dispatch_queue.SchedulerOptions.group.modify())()
{
  return protocol witness for Collection.subscript.read in conformance DispatchData;
}

uint64_t OS_dispatch_queue.SchedulerOptions.init(qos:flags:group:)@<X0>(uint64_t result@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v4 = *(void *)(result + 8);
  uint64_t v5 = *a2;
  *(unsigned char *)a4 = *(unsigned char *)result;
  *(void *)(a4 + 8) = v4;
  *(void *)(a4 + 16) = v5;
  *(void *)(a4 + 24) = a3;
  return result;
}

void OS_dispatch_queue.minimumTolerance.getter(void *a1@<X8>)
{
  *a1 = 0;
}

dispatch_time_t OS_dispatch_queue.now.getter@<X0>(dispatch_time_t *a1@<X8>)
{
  dispatch_time_t result = dispatch_time(0, 0);
  *a1 = result;
  return result;
}

uint64_t *specialized static OS_dispatch_queue.SchedulerTimeType.Stride.*= infix(_:_:)(uint64_t *result, uint64_t *a2)
{
  double v2 = (double)*a2 / 1000000000.0 * ((double)*result / 1000000000.0);
  double v3 = trunc(v2 * 1000000000.0);
  uint64_t v4 = 0x8000000000000000;
  if (v2 > 0.0) {
    uint64_t v4 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if (v3 < 9.22337204e18 && v3 > -9.22337204e18) {
    uint64_t v4 = (uint64_t)(v2 * 1000000000.0);
  }
  *dispatch_time_t result = v4;
  return result;
}

unint64_t lazy protocol witness table accessor for type OS_dispatch_queue.SchedulerTimeType.Stride.CodingKeys and conformance OS_dispatch_queue.SchedulerTimeType.Stride.CodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type OS_dispatch_queue.SchedulerTimeType.Stride.CodingKeys and conformance OS_dispatch_queue.SchedulerTimeType.Stride.CodingKeys;
  if (!lazy protocol witness table cache variable for type OS_dispatch_queue.SchedulerTimeType.Stride.CodingKeys and conformance OS_dispatch_queue.SchedulerTimeType.Stride.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OS_dispatch_queue.SchedulerTimeType.Stride.CodingKeys and conformance OS_dispatch_queue.SchedulerTimeType.Stride.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type OS_dispatch_queue.SchedulerTimeType.Stride.CodingKeys and conformance OS_dispatch_queue.SchedulerTimeType.Stride.CodingKeys;
  if (!lazy protocol witness table cache variable for type OS_dispatch_queue.SchedulerTimeType.Stride.CodingKeys and conformance OS_dispatch_queue.SchedulerTimeType.Stride.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OS_dispatch_queue.SchedulerTimeType.Stride.CodingKeys and conformance OS_dispatch_queue.SchedulerTimeType.Stride.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type OS_dispatch_queue.SchedulerTimeType.Stride.CodingKeys and conformance OS_dispatch_queue.SchedulerTimeType.Stride.CodingKeys;
  if (!lazy protocol witness table cache variable for type OS_dispatch_queue.SchedulerTimeType.Stride.CodingKeys and conformance OS_dispatch_queue.SchedulerTimeType.Stride.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OS_dispatch_queue.SchedulerTimeType.Stride.CodingKeys and conformance OS_dispatch_queue.SchedulerTimeType.Stride.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type OS_dispatch_queue.SchedulerTimeType.Stride.CodingKeys and conformance OS_dispatch_queue.SchedulerTimeType.Stride.CodingKeys;
  if (!lazy protocol witness table cache variable for type OS_dispatch_queue.SchedulerTimeType.Stride.CodingKeys and conformance OS_dispatch_queue.SchedulerTimeType.Stride.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OS_dispatch_queue.SchedulerTimeType.Stride.CodingKeys and conformance OS_dispatch_queue.SchedulerTimeType.Stride.CodingKeys);
  }
  return result;
}

id outlined copy of OS_dispatch_queue.SchedulerOptions?(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  if (a4 != (void *)1) {
    return a4;
  }
  return result;
}

uint64_t outlined consume of OS_dispatch_queue.SchedulerOptions?(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a4 != 1) {
    return MEMORY[0x1F4181870]();
  }
  return result;
}

uint64_t sub_18BFA8A24()
{
  swift_unknownObjectRelease();

  return MEMORY[0x1F4186498](v0, 24, 7);
}

unint64_t lazy protocol witness table accessor for type OS_dispatch_queue.SchedulerTimeType.Stride and conformance OS_dispatch_queue.SchedulerTimeType.Stride()
{
  unint64_t result = lazy protocol witness table cache variable for type OS_dispatch_queue.SchedulerTimeType.Stride and conformance OS_dispatch_queue.SchedulerTimeType.Stride;
  if (!lazy protocol witness table cache variable for type OS_dispatch_queue.SchedulerTimeType.Stride and conformance OS_dispatch_queue.SchedulerTimeType.Stride)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OS_dispatch_queue.SchedulerTimeType.Stride and conformance OS_dispatch_queue.SchedulerTimeType.Stride);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type OS_dispatch_queue.SchedulerTimeType.Stride and conformance OS_dispatch_queue.SchedulerTimeType.Stride;
  if (!lazy protocol witness table cache variable for type OS_dispatch_queue.SchedulerTimeType.Stride and conformance OS_dispatch_queue.SchedulerTimeType.Stride)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OS_dispatch_queue.SchedulerTimeType.Stride and conformance OS_dispatch_queue.SchedulerTimeType.Stride);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type OS_dispatch_queue.SchedulerTimeType.Stride and conformance OS_dispatch_queue.SchedulerTimeType.Stride;
  if (!lazy protocol witness table cache variable for type OS_dispatch_queue.SchedulerTimeType.Stride and conformance OS_dispatch_queue.SchedulerTimeType.Stride)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OS_dispatch_queue.SchedulerTimeType.Stride and conformance OS_dispatch_queue.SchedulerTimeType.Stride);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type OS_dispatch_queue.SchedulerTimeType.Stride and conformance OS_dispatch_queue.SchedulerTimeType.Stride;
  if (!lazy protocol witness table cache variable for type OS_dispatch_queue.SchedulerTimeType.Stride and conformance OS_dispatch_queue.SchedulerTimeType.Stride)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OS_dispatch_queue.SchedulerTimeType.Stride and conformance OS_dispatch_queue.SchedulerTimeType.Stride);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type OS_dispatch_queue.SchedulerTimeType.Stride and conformance OS_dispatch_queue.SchedulerTimeType.Stride;
  if (!lazy protocol witness table cache variable for type OS_dispatch_queue.SchedulerTimeType.Stride and conformance OS_dispatch_queue.SchedulerTimeType.Stride)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OS_dispatch_queue.SchedulerTimeType.Stride and conformance OS_dispatch_queue.SchedulerTimeType.Stride);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type OS_dispatch_queue.SchedulerTimeType.Stride and conformance OS_dispatch_queue.SchedulerTimeType.Stride;
  if (!lazy protocol witness table cache variable for type OS_dispatch_queue.SchedulerTimeType.Stride and conformance OS_dispatch_queue.SchedulerTimeType.Stride)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OS_dispatch_queue.SchedulerTimeType.Stride and conformance OS_dispatch_queue.SchedulerTimeType.Stride);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type OS_dispatch_queue.SchedulerTimeType.Stride and conformance OS_dispatch_queue.SchedulerTimeType.Stride;
  if (!lazy protocol witness table cache variable for type OS_dispatch_queue.SchedulerTimeType.Stride and conformance OS_dispatch_queue.SchedulerTimeType.Stride)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OS_dispatch_queue.SchedulerTimeType.Stride and conformance OS_dispatch_queue.SchedulerTimeType.Stride);
  }
  return result;
}

uint64_t associated type witness table accessor for ExpressibleByFloatLiteral.FloatLiteralType : _ExpressibleByBuiltinFloatLiteral in OS_dispatch_queue.SchedulerTimeType.Stride()
{
  return MEMORY[0x1E4FBB450];
}

uint64_t associated type witness table accessor for Numeric.Magnitude : Numeric in OS_dispatch_queue.SchedulerTimeType.Stride()
{
  return MEMORY[0x1E4FBB588];
}

uint64_t associated type witness table accessor for ExpressibleByIntegerLiteral.IntegerLiteralType : _ExpressibleByBuiltinIntegerLiteral in OS_dispatch_queue.SchedulerTimeType.Stride()
{
  return MEMORY[0x1E4FBB5C0];
}

void *sub_18BFA8CE8@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

void *sub_18BFA8CF4(void *result, void *a2)
{
  *a2 = *result;
  return result;
}

void destroy for OS_dispatch_queue.SchedulerOptions(uint64_t a1)
{
}

uint64_t initializeWithCopy for OS_dispatch_queue.SchedulerOptions(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  double v3 = *(void **)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v3;
  id v4 = v3;
  return a1;
}

uint64_t assignWithCopy for OS_dispatch_queue.SchedulerOptions(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  double v3 = *(void **)(a1 + 24);
  id v4 = *(void **)(a2 + 24);
  *(void *)(a1 + 24) = v4;
  id v5 = v4;

  return a1;
}

uint64_t assignWithTake for OS_dispatch_queue.SchedulerOptions(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  double v3 = *(void **)(a1 + 24);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);

  return a1;
}

uint64_t getEnumTagSinglePayload for OS_dispatch_queue.SchedulerTimeType.Stride.CodingKeys(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for OS_dispatch_queue.SchedulerTimeType.Stride.CodingKeys(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x18BFA8EC4);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t getEnumTag for OS_dispatch_queue.SchedulerTimeType.Stride.CodingKeys()
{
  return 0;
}

void *type metadata accessor for OS_dispatch_queue.SchedulerTimeType.Stride.CodingKeys()
{
  return &unk_1ED98BFD0;
}

uint64_t DispatchWorkItem.__allocating_init(qos:flags:block:)(char *a1, dispatch_block_flags_t *a2, void *a3)
{
  uint64_t v6 = swift_allocObject();
  DispatchWorkItem.init(qos:flags:block:)(a1, a2, a3);
  return v6;
}

uint64_t DispatchWorkItem.__allocating_init(flags:block:)(dispatch_block_flags_t *a1, const void *a2)
{
  uint64_t v4 = swift_allocObject();
  dispatch_block_flags_t v5 = *a1;
  uint64_t v6 = _Block_copy(a2);
  id v7 = _swift_dispatch_block_create(v5, v6);
  _Block_release(a2);
  _Block_release(v6);
  *(void *)(v4 + 16) = v7;
  return v4;
}

uint64_t DispatchWorkItemFlags.rawValue.getter()
{
  return *(void *)v0;
}

Dispatch::DispatchWorkItemFlags __swiftcall DispatchWorkItemFlags.init(rawValue:)(Dispatch::DispatchWorkItemFlags rawValue)
{
  v1->rawValue = rawValue.rawValue;
  return rawValue;
}

void static DispatchWorkItemFlags.detached.getter(void *a1@<X8>)
{
  *a1 = 2;
}

void static DispatchWorkItemFlags.assignCurrentContext.getter(void *a1@<X8>)
{
  *a1 = 4;
}

void static DispatchWorkItemFlags.noQoS.getter(void *a1@<X8>)
{
  *a1 = 8;
}

void static DispatchWorkItemFlags.inheritQoS.getter(void *a1@<X8>)
{
  *a1 = 16;
}

Swift::Void __swiftcall DispatchWorkItem.wait()()
{
  _swift_dispatch_block_wait(*(void **)(v0 + 16), 0xFFFFFFFFFFFFFFFFLL);
}

BOOL DispatchWorkItem.wait(wallTimeout:)(dispatch_time_t *a1)
{
  return _swift_dispatch_block_wait(*(void **)(v1 + 16), *a1) != 0;
}

void DispatchWorkItem.notify(qos:flags:queue:execute:)(unsigned __int8 *a1, uint64_t *a2, void *a3, void *aBlock)
{
  uint64_t v5 = v4;
  int v7 = *a1;
  uint64_t v8 = *((void *)a1 + 1);
  uint64_t v9 = *a2;
  uint64_t v10 = _Block_copy(aBlock);
  if (v7 == 5 && v8 == 0 && v9 == 0)
  {
    uint64_t v14 = *(void **)(v5 + 16);
    _Block_copy(v14);
    _swift_dispatch_block_notify(v14, a3, v10);
    _Block_release(v10);
    _Block_release(v14);
  }
  else
  {
    v16[0] = v7;
    uint64_t v17 = v8;
    uint64_t v15 = v9;
    type metadata accessor for DispatchWorkItem();
    uint64_t inited = swift_initStackObject();
    DispatchWorkItem.init(qos:flags:block:)(v16, (dispatch_block_flags_t *)&v15, v10);
    _swift_dispatch_block_notify(*(void **)(v5 + 16), a3, *(void **)(inited + 16));
    swift_release();
  }
}

void DispatchWorkItem.notify(queue:execute:)(void *a1, uint64_t a2)
{
  _swift_dispatch_block_notify(*(void **)(v2 + 16), a1, *(void **)(a2 + 16));
}

uint64_t DispatchWorkItem.deinit()
{
  _Block_release(*(const void **)(v0 + 16));
  return v0;
}

intptr_t _swift_dispatch_block_wait(void *a1, dispatch_time_t a2)
{
  id v3 = a1;
  intptr_t v4 = dispatch_block_wait(v3, a2);

  return v4;
}

void _swift_dispatch_block_notify(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  uint64_t v6 = a2;
  id v7 = a3;
  dispatch_block_notify(v5, v6, v7);
}

uint64_t method lookup function for DispatchWorkItem(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for DispatchWorkItem);
}

uint64_t dispatch thunk of DispatchWorkItem.__allocating_init(qos:flags:block:)()
{
  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t dispatch thunk of DispatchWorkItem.__allocating_init(flags:block:)()
{
  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t dispatch thunk of DispatchWorkItem.wait()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 136))();
}

uint64_t dispatch thunk of DispatchWorkItem.wait(timeout:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 144))() & 1;
}

uint64_t dispatch thunk of DispatchWorkItem.wait(wallTimeout:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 152))() & 1;
}

uint64_t dispatch thunk of DispatchWorkItem.notify(qos:flags:queue:execute:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 160))();
}

uint64_t dispatch thunk of DispatchWorkItem.notify(queue:execute:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 168))();
}

uint64_t specialized SetAlgebra<>.init(arrayLiteral:)@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *(void *)(a1 + 16);
  if (v3)
  {
    uint64_t v4 = 0;
    id v5 = (uint64_t *)(a1 + 32);
    do
    {
      uint64_t v7 = *v5++;
      uint64_t v6 = v7;
      if ((v7 & ~v4) == 0) {
        uint64_t v6 = 0;
      }
      v4 |= v6;
      --v3;
    }
    while (v3);
  }
  else
  {
    uint64_t v4 = 0;
  }
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v4;
  return result;
}

uint64_t OS_dispatch_io.StreamType.init(rawValue:)@<X0>(uint64_t result@<X0>, char *a2@<X8>)
{
  if (result == 1) {
    char v2 = 1;
  }
  else {
    char v2 = 2;
  }
  if (!result) {
    char v2 = 0;
  }
  *a2 = v2;
  return result;
}

uint64_t OS_dispatch_io.StreamType.rawValue.getter()
{
  return *v0;
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance OS_dispatch_io.StreamType(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

void *protocol witness for RawRepresentable.init(rawValue:) in conformance OS_dispatch_io.StreamType@<X0>(void *result@<X0>, char *a2@<X8>)
{
  if (*result == 1) {
    char v2 = 1;
  }
  else {
    char v2 = 2;
  }
  if (*result) {
    char v3 = v2;
  }
  else {
    char v3 = 0;
  }
  *a2 = v3;
  return result;
}

void protocol witness for RawRepresentable.rawValue.getter in conformance OS_dispatch_io.StreamType(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t OS_dispatch_io.CloseFlags.rawValue.getter()
{
  return *(void *)v0;
}

uint64_t OS_dispatch_io.CloseFlags.init(rawValue:)@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = result;
  return result;
}

void static OS_dispatch_io.CloseFlags.stop.getter(void *a1@<X8>)
{
  *a1 = 1;
}

uint64_t protocol witness for ExpressibleByArrayLiteral.init(arrayLiteral:) in conformance OS_dispatch_io.CloseFlags@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  return specialized SetAlgebra<>.init(arrayLiteral:)(a1, a2);
}

uint64_t OS_dispatch_io.IntervalFlags.rawValue.getter()
{
  return *(void *)v0;
}

void OS_dispatch_io.IntervalFlags.init(nilLiteral:)(void *a1@<X8>)
{
  *a1 = 0;
}

void static OS_dispatch_io.read(fromFileDescriptor:maxLength:runningHandlerOn:handler:)(dispatch_fd_t a1, size_t a2, NSObject *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = a4;
  *(void *)(v10 + 24) = a5;
  void v12[4] = partial apply for closure #1 in static OS_dispatch_io.read(fromFileDescriptor:maxLength:runningHandlerOn:handler:);
  v12[5] = v10;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 1107296256;
  v12[2] = thunk for @escaping @callee_guaranteed (@guaranteed OS_dispatch_data, @unowned Int32) -> ();
  v12[3] = &block_descriptor_2;
  uint64_t v11 = _Block_copy(v12);
  swift_retain();
  swift_release();
  dispatch_read(a1, a2, a3, v11);
  _Block_release(v11);
}

uint64_t sub_18BFA9730()
{
  swift_release();

  return MEMORY[0x1F4186498](v0, 32, 7);
}

void partial apply for closure #1 in static OS_dispatch_io.read(fromFileDescriptor:maxLength:runningHandlerOn:handler:)(void *a1, uint64_t a2)
{
  uint64_t v4 = *(void (**)(void **, uint64_t))(v2 + 16);
  uint64_t v6 = a1;
  id v5 = a1;
  v4(&v6, a2);
}

void thunk for @escaping @callee_guaranteed (@guaranteed OS_dispatch_data, @unowned Int32) -> ()(uint64_t a1, void *a2)
{
  char v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

void static OS_dispatch_io.write(toFileDescriptor:data:runningHandlerOn:handler:)(dispatch_fd_t a1, void **a2, NSObject *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9 = *a2;
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = a4;
  *(void *)(v10 + 24) = a5;
  v13[4] = partial apply for closure #1 in static OS_dispatch_io.read(fromFileDescriptor:maxLength:runningHandlerOn:handler:);
  v13[5] = v10;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 1107296256;
  v13[2] = thunk for @escaping @callee_guaranteed (@guaranteed OS_dispatch_data?, @unowned Int32) -> ();
  v13[3] = &block_descriptor_6_0;
  uint64_t v11 = _Block_copy(v13);
  uint64_t v12 = v9;
  swift_retain();
  swift_release();
  dispatch_write(a1, v12, a3, v11);
  _Block_release(v11);
}

void thunk for @escaping @callee_guaranteed (@guaranteed OS_dispatch_data?, @unowned Int32) -> ()(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(void (**)(void *, uint64_t))(a1 + 32);
  swift_retain();
  id v6 = a2;
  v5(a2, a3);
  swift_release();
}

dispatch_io_t OS_dispatch_io.init(type:fileDescriptor:queue:cleanupHandler:)(unsigned __int8 *a1, dispatch_fd_t a2, NSObject *a3, uint64_t a4, uint64_t a5)
{
  dispatch_io_type_t v7 = *a1;
  void v11[4] = a4;
  v11[5] = a5;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 1107296256;
  v11[2] = thunk for @escaping @callee_guaranteed (@unowned Int32) -> ();
  v11[3] = &block_descriptor_9_0;
  uint64_t v8 = _Block_copy(v11);
  swift_retain();
  swift_release();
  dispatch_io_t v9 = dispatch_io_create(v7, a2, a3, v8);

  swift_release();
  _Block_release(v8);
  return v9;
}

uint64_t thunk for @escaping @callee_guaranteed (@unowned Int32) -> ()(uint64_t a1, uint64_t a2)
{
  char v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);

  return swift_release();
}

dispatch_io_t OS_dispatch_io.init(type:path:oflag:mode:queue:cleanupHandler:)(unsigned __int8 *a1, const char *a2, int a3, mode_t a4, NSObject *a5, uint64_t a6, uint64_t a7)
{
  dispatch_io_type_t v11 = *a1;
  void v15[4] = a6;
  v15[5] = a7;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 1107296256;
  v15[2] = thunk for @escaping @callee_guaranteed (@unowned Int32) -> ();
  v15[3] = &block_descriptor_12;
  uint64_t v12 = _Block_copy(v15);
  swift_retain();
  swift_release();
  dispatch_io_t v13 = dispatch_io_create_with_path(v11, a2, a3, a4, a5, v12);

  swift_release();
  _Block_release(v12);
  return v13;
}

{
  dispatch_io_type_t v11;
  void *v12;
  dispatch_io_t v13;
  void v15[6];

  dispatch_io_type_t v11 = *a1;
  void v15[4] = a6;
  v15[5] = a7;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 1107296256;
  v15[2] = thunk for @escaping @callee_guaranteed (@unowned Int32) -> ();
  v15[3] = &block_descriptor_15;
  uint64_t v12 = _Block_copy(v15);
  swift_retain();
  swift_release();
  dispatch_io_t v13 = dispatch_io_create_with_path(v11, a2, a3, a4, a5, v12);

  swift_release();
  _Block_release(v12);
  return v13;
}

dispatch_io_t OS_dispatch_io.init(type:io:queue:cleanupHandler:)(unsigned __int8 *a1, NSObject *a2, NSObject *a3, uint64_t a4, uint64_t a5)
{
  dispatch_io_type_t v7 = *a1;
  void v11[4] = a4;
  v11[5] = a5;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 1107296256;
  v11[2] = thunk for @escaping @callee_guaranteed (@unowned Int32) -> ();
  v11[3] = &block_descriptor_18;
  uint64_t v8 = _Block_copy(v11);
  swift_retain();
  swift_release();
  dispatch_io_t v9 = dispatch_io_create_with_io(v7, a2, a3, v8);

  swift_release();
  _Block_release(v8);
  return v9;
}

void OS_dispatch_io.read(offset:length:queue:ioHandler:)(off_t a1, size_t a2, NSObject *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = a4;
  *(void *)(v11 + 24) = a5;
  v13[4] = partial apply for closure #1 in OS_dispatch_io.read(offset:length:queue:ioHandler:);
  v13[5] = v11;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 1107296256;
  v13[2] = thunk for @escaping @callee_guaranteed (@unowned Bool, @guaranteed OS_dispatch_data?, @unowned Int32) -> ();
  v13[3] = &block_descriptor_24;
  uint64_t v12 = _Block_copy(v13);
  swift_retain();
  swift_release();
  dispatch_io_read(v5, a1, a2, a3, v12);
  _Block_release(v12);
}

void thunk for @escaping @callee_guaranteed (@unowned Bool, @guaranteed OS_dispatch_data?, @unowned Int32) -> ()(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  dispatch_io_type_t v7 = *(void (**)(uint64_t, void *, uint64_t))(a1 + 32);
  swift_retain();
  id v8 = a3;
  v7(a2, a3, a4);
  swift_release();
}

void OS_dispatch_io.write(offset:data:queue:ioHandler:)(off_t a1, void **a2, NSObject *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10 = *a2;
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = a4;
  *(void *)(v11 + 24) = a5;
  v14[4] = partial apply for closure #1 in OS_dispatch_io.read(offset:length:queue:ioHandler:);
  v14[5] = v11;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 1107296256;
  v14[2] = thunk for @escaping @callee_guaranteed (@unowned Bool, @guaranteed OS_dispatch_data?, @unowned Int32) -> ();
  v14[3] = &block_descriptor_30;
  uint64_t v12 = _Block_copy(v14);
  dispatch_io_t v13 = v10;
  swift_retain();
  swift_release();
  dispatch_io_write(v5, a1, v13, a3, v12);
  _Block_release(v12);
}

void partial apply for closure #1 in OS_dispatch_io.read(offset:length:queue:ioHandler:)(uint64_t a1, void *a2, uint64_t a3)
{
  id v6 = *(void (**)(uint64_t, void **, uint64_t))(v3 + 16);
  id v8 = a2;
  id v7 = a2;
  v6(a1, &v8, a3);
}

void OS_dispatch_io.setInterval(interval:flags:)(uint64_t a1, dispatch_io_interval_flags_t *a2)
{
  uint64_t v3 = *(void *)a1;
  dispatch_io_interval_flags_t v4 = *a2;
  uint64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v6 = *(void *)a1;
  switch(*(unsigned char *)(a1 + 8))
  {
    case 1:
      uint64_t v7 = 1000000;
      goto LABEL_5;
    case 2:
      uint64_t v7 = 1000;
      goto LABEL_5;
    case 3:
      goto LABEL_8;
    case 4:
      goto LABEL_9;
    default:
      uint64_t v7 = 1000000000;
LABEL_5:
      uint64_t v6 = v3 * v7;
      if ((unsigned __int128)(v3 * (__int128)v7) >> 64 == (v3 * v7) >> 63) {
        goto LABEL_8;
      }
      if (v3 <= 0)
      {
        do
        {
          __break(1u);
LABEL_8:
          uint64_t v5 = v6;
        }
        while ((v6 & 0x8000000000000000) != 0);
      }
LABEL_9:
      dispatch_io_set_interval(v2, v5, v4);
      return;
  }
}

void OS_dispatch_io.close(flags:)(dispatch_io_close_flags_t *a1)
{
  dispatch_io_close(v1, *a1);
}

unint64_t lazy protocol witness table accessor for type OS_dispatch_io.StreamType and conformance OS_dispatch_io.StreamType()
{
  unint64_t result = lazy protocol witness table cache variable for type OS_dispatch_io.StreamType and conformance OS_dispatch_io.StreamType;
  if (!lazy protocol witness table cache variable for type OS_dispatch_io.StreamType and conformance OS_dispatch_io.StreamType)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OS_dispatch_io.StreamType and conformance OS_dispatch_io.StreamType);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type OS_dispatch_io.CloseFlags and conformance OS_dispatch_io.CloseFlags()
{
  unint64_t result = lazy protocol witness table cache variable for type OS_dispatch_io.CloseFlags and conformance OS_dispatch_io.CloseFlags;
  if (!lazy protocol witness table cache variable for type OS_dispatch_io.CloseFlags and conformance OS_dispatch_io.CloseFlags)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OS_dispatch_io.CloseFlags and conformance OS_dispatch_io.CloseFlags);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type OS_dispatch_io.CloseFlags and conformance OS_dispatch_io.CloseFlags;
  if (!lazy protocol witness table cache variable for type OS_dispatch_io.CloseFlags and conformance OS_dispatch_io.CloseFlags)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OS_dispatch_io.CloseFlags and conformance OS_dispatch_io.CloseFlags);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type OS_dispatch_io.CloseFlags and conformance OS_dispatch_io.CloseFlags;
  if (!lazy protocol witness table cache variable for type OS_dispatch_io.CloseFlags and conformance OS_dispatch_io.CloseFlags)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OS_dispatch_io.CloseFlags and conformance OS_dispatch_io.CloseFlags);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type OS_dispatch_io.CloseFlags and conformance OS_dispatch_io.CloseFlags;
  if (!lazy protocol witness table cache variable for type OS_dispatch_io.CloseFlags and conformance OS_dispatch_io.CloseFlags)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OS_dispatch_io.CloseFlags and conformance OS_dispatch_io.CloseFlags);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type OS_dispatch_io.IntervalFlags and conformance OS_dispatch_io.IntervalFlags()
{
  unint64_t result = lazy protocol witness table cache variable for type OS_dispatch_io.IntervalFlags and conformance OS_dispatch_io.IntervalFlags;
  if (!lazy protocol witness table cache variable for type OS_dispatch_io.IntervalFlags and conformance OS_dispatch_io.IntervalFlags)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OS_dispatch_io.IntervalFlags and conformance OS_dispatch_io.IntervalFlags);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type OS_dispatch_io.IntervalFlags and conformance OS_dispatch_io.IntervalFlags;
  if (!lazy protocol witness table cache variable for type OS_dispatch_io.IntervalFlags and conformance OS_dispatch_io.IntervalFlags)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OS_dispatch_io.IntervalFlags and conformance OS_dispatch_io.IntervalFlags);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type OS_dispatch_io.IntervalFlags and conformance OS_dispatch_io.IntervalFlags;
  if (!lazy protocol witness table cache variable for type OS_dispatch_io.IntervalFlags and conformance OS_dispatch_io.IntervalFlags)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OS_dispatch_io.IntervalFlags and conformance OS_dispatch_io.IntervalFlags);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type OS_dispatch_io.IntervalFlags and conformance OS_dispatch_io.IntervalFlags;
  if (!lazy protocol witness table cache variable for type OS_dispatch_io.IntervalFlags and conformance OS_dispatch_io.IntervalFlags)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OS_dispatch_io.IntervalFlags and conformance OS_dispatch_io.IntervalFlags);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for OS_dispatch_io.StreamType(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for OS_dispatch_io.StreamType(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x18BFAA5C4);
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

unsigned char *destructiveInjectEnumTag for OS_dispatch_io.StreamType(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for OS_dispatch_io.StreamType()
{
  return &type metadata for OS_dispatch_io.StreamType;
}

ValueMetadata *type metadata accessor for OS_dispatch_io.CloseFlags()
{
  return &type metadata for OS_dispatch_io.CloseFlags;
}

ValueMetadata *type metadata accessor for OS_dispatch_io.IntervalFlags()
{
  return &type metadata for OS_dispatch_io.IntervalFlags;
}

uint64_t DispatchQoS.QoSClass.rawValue.getter()
{
  return *(unsigned int *)&asc_18BFAF1B8[4 * *v0];
}

BOOL static DispatchQoS.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2 && *((void *)a1 + 1) == *((void *)a2 + 1);
}

void dispatchPrecondition(condition:)(void (*a1)(dispatch_queue_t *__return_ptr))
{
  a1(&queue);
  dispatch_queue_t v1 = queue;
  if (v3)
  {
    if (v3 == 1) {
      dispatch_assert_queue_barrier(queue);
    }
    else {
      dispatch_assert_queue_not_V2(queue);
    }
  }
  else
  {
    dispatch_assert_queue_V2(queue);
  }
}

void DispatchQoS.qosClass.getter(unsigned char *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t DispatchQoS.relativePriority.getter()
{
  return *(void *)(v0 + 8);
}

BOOL static DispatchQoS.QoSClass.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

void DispatchQoS.QoSClass.hash(into:)()
{
  Hasher._combine(_:)(*v0);
}

Swift::Int DispatchQoS.QoSClass.hashValue.getter()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void DispatchTimeoutResult.hash(into:)(uint64_t a1, char a2)
{
}

Swift::Int DispatchTimeoutResult.hashValue.getter(char a1)
{
  return Hasher._finalize()();
}

unint64_t lazy protocol witness table accessor for type DispatchQoS.QoSClass and conformance DispatchQoS.QoSClass()
{
  unint64_t result = lazy protocol witness table cache variable for type DispatchQoS.QoSClass and conformance DispatchQoS.QoSClass;
  if (!lazy protocol witness table cache variable for type DispatchQoS.QoSClass and conformance DispatchQoS.QoSClass)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type DispatchQoS.QoSClass and conformance DispatchQoS.QoSClass);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type DispatchTimeoutResult and conformance DispatchTimeoutResult()
{
  unint64_t result = lazy protocol witness table cache variable for type DispatchTimeoutResult and conformance DispatchTimeoutResult;
  if (!lazy protocol witness table cache variable for type DispatchTimeoutResult and conformance DispatchTimeoutResult)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type DispatchTimeoutResult and conformance DispatchTimeoutResult);
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for DispatchPredicate(uint64_t a1, uint64_t a2)
{
  char v3 = *(void **)a2;
  char v4 = *(unsigned char *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = v4;
  id v5 = v3;
  return a1;
}

uint64_t assignWithCopy for DispatchPredicate(uint64_t a1, uint64_t a2)
{
  char v3 = *(void **)a2;
  char v4 = *(unsigned char *)(a2 + 8);
  id v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = v4;
  id v6 = v3;

  return a1;
}

uint64_t assignWithTake for DispatchPredicate(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 8);
  char v4 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = v3;

  return a1;
}

uint64_t getEnumTagSinglePayload for DispatchPredicate(uint64_t a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for DispatchPredicate(uint64_t result, unsigned int a2, unsigned int a3)
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

uint64_t getEnumTag for DispatchPredicate(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 8);
}

unsigned char *storeEnumTagSinglePayload for DispatchTimeoutResult(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x18BFAAB8CLL);
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

ValueMetadata *type metadata accessor for DispatchTimeoutResult()
{
  return &type metadata for DispatchTimeoutResult;
}

void dispatch_queue_create(_:_:)()
{
}

void dispatch_queue_create_with_target(_:_:_:)()
{
}

void dispatch_io_create(_:_:_:_:)()
{
}

void dispatch_io_create_with_path(_:_:_:_:_:_:)()
{
}

void dispatch_io_create_with_io(_:_:_:_:)()
{
}

void dispatch_read(_:_:_:_:)()
{
}

void dispatch_data_create(_:_:_:_:)()
{
}

void dispatch_data_get_size(_:)()
{
}

void dispatch_data_create_map(_:_:_:)()
{
}

void dispatch_data_create_concat(_:_:)()
{
}

void dispatch_data_create_subrange(_:_:_:)()
{
}

void dispatch_data_apply(_:_:)()
{
}

void dispatch_data_copy_region(_:_:_:)()
{
}

void dispatch_group_async(_:_:_:)()
{
}

void dispatch_group_notify(_:_:_:)()
{
}

void dispatch_group_wait(_:_:)()
{
}

void dispatch_io_close(_:_:)()
{
}

void dispatch_io_set_interval(_:_:_:)()
{
}

void dispatch_apply(_:_:_:)()
{
}

void dispatch_async(_:_:)()
{
}

void dispatch_get_global_queue(_:_:)()
{
}

void dispatch_get_main_queue()()
{
}

void dispatch_queue_attr_make_initially_inactive(_:)()
{
}

void dispatch_queue_attr_make_with_autorelease_frequency(_:_:)()
{
}

void dispatch_queue_attr_make_with_qos_class(_:_:_:)()
{
}

void dispatch_queue_get_label(_:)()
{
}

void dispatch_queue_get_qos_class(_:_:)()
{
}

void dispatch_after(_:_:_:)()
{
}

void dispatch_barrier_async(_:_:)()
{
}

void dispatch_barrier_sync(_:_:)()
{
}

void dispatch_queue_set_specific(_:_:_:_:)()
{
}

void dispatch_queue_get_specific(_:_:)()
{
}

void dispatch_get_specific(_:)()
{
}

void dispatch_assert_queue(_:)()
{
}

void dispatch_assert_queue_barrier(_:)()
{
}

void dispatch_assert_queue_not(_:)()
{
}

void dispatch_semaphore_wait(_:_:)()
{
}

void dispatch_semaphore_signal(_:)()
{
}

void dispatch_source_create(_:_:_:_:)()
{
}

void dispatch_source_set_event_handler(_:_:)()
{
}

void dispatch_source_set_cancel_handler(_:_:)()
{
}

void dispatch_source_cancel(_:)()
{
}

void dispatch_source_testcancel(_:)()
{
}

void dispatch_source_get_handle(_:)()
{
}

void dispatch_source_get_mask(_:)()
{
}

void dispatch_source_get_data(_:)()
{
}

void dispatch_source_merge_data(_:_:)()
{
}

void dispatch_source_set_timer(_:_:_:_:)()
{
}

void dispatch_source_set_registration_handler(_:_:)()
{
}

Swift::UInt64 __swiftcall dispatch_time(_:_:)(Swift::UInt64 a1, Swift::Int64 a2)
{
  Swift::UInt64 result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

void dispatch_walltime(_:_:)()
{
}

void DISPATCH_QUEUE_PRIORITY_HIGH.getter()
{
}

void DISPATCH_QUEUE_PRIORITY_DEFAULT.getter()
{
}

void DISPATCH_QUEUE_PRIORITY_LOW.getter()
{
}

void DISPATCH_QUEUE_PRIORITY_BACKGROUND.getter()
{
}

void DISPATCH_IO_STREAM.getter()
{
}

void DISPATCH_IO_RANDOM.getter()
{
}

void DISPATCH_IO_STOP.getter()
{
}

void DISPATCH_IO_STRICT_INTERVAL.getter()
{
}

void DISPATCH_MACH_SEND_DEAD.getter()
{
}

void DISPATCH_MEMORYPRESSURE_NORMAL.getter()
{
}

void DISPATCH_MEMORYPRESSURE_WARN.getter()
{
}

void DISPATCH_MEMORYPRESSURE_CRITICAL.getter()
{
}

void DISPATCH_PROC_EXIT.getter()
{
}

void DISPATCH_PROC_FORK.getter()
{
}

void DISPATCH_PROC_EXEC.getter()
{
}

void DISPATCH_PROC_SIGNAL.getter()
{
}

void DISPATCH_TIMER_STRICT.getter()
{
}

void DISPATCH_VNODE_DELETE.getter()
{
}

void DISPATCH_VNODE_WRITE.getter()
{
}

void DISPATCH_VNODE_EXTEND.getter()
{
}

void DISPATCH_VNODE_ATTRIB.getter()
{
}

void DISPATCH_VNODE_LINK.getter()
{
}

void DISPATCH_VNODE_RENAME.getter()
{
}

void DISPATCH_VNODE_REVOKE.getter()
{
}

void DISPATCH_VNODE_FUNLOCK.getter()
{
}

void DISPATCH_TIME_NOW.getter()
{
}

void DISPATCH_TIME_FOREVER.getter()
{
}

uint64_t type metadata accessor for AnyCancellable()
{
  return MEMORY[0x1F40D6958]();
}

uint64_t AnyCancellable.init(_:)()
{
  return MEMORY[0x1F40D6980]();
}

uint64_t dispatch thunk of static Comparable.< infix(_:_:)()
{
  return MEMORY[0x1F4183740]();
}

uint64_t String.utf8CString.getter()
{
  return MEMORY[0x1F41838B8]();
}

uint64_t String.init(validatingUTF8:)()
{
  return MEMORY[0x1F41838F8]();
}

uint64_t Sequence.withContiguousStorageIfAvailable<A>(_:)()
{
  return MEMORY[0x1F4183C18]();
}

uint64_t UnsafeRawBufferPointer.init<A>(_:)()
{
  return MEMORY[0x1F4183D40]();
}

uint64_t UnownedJob.init(_:)()
{
  return MEMORY[0x1F4187C90]();
}

uint64_t type metadata accessor for Optional()
{
  return MEMORY[0x1F4184640]();
}

uint64_t UnsafeMutableBufferPointer.baseAddress.getter()
{
  return MEMORY[0x1F4184680]();
}

uint64_t dispatch thunk of BinaryInteger.init<A>(truncatingIfNeeded:)()
{
  return MEMORY[0x1F41848C0]();
}

uint64_t dispatch thunk of BinaryInteger._lowWord.getter()
{
  return MEMORY[0x1F4184938]();
}

uint64_t dispatch thunk of BinaryInteger.bitWidth.getter()
{
  return MEMORY[0x1F4184940]();
}

uint64_t dispatch thunk of static BinaryInteger.isSigned.getter()
{
  return MEMORY[0x1F4184950]();
}

uint64_t _bridgeAnyObjectToAny(_:)()
{
  return MEMORY[0x1F4184978]();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return MEMORY[0x1F41852A0]();
}

uint64_t KeyedDecodingContainer.decode(_:forKey:)()
{
  return MEMORY[0x1F41855B8]();
}

uint64_t KeyedEncodingContainer.encode(_:forKey:)()
{
  return MEMORY[0x1F41856E0]();
}

uint64_t dispatch thunk of CustomStringConvertible.description.getter()
{
  return MEMORY[0x1F4185758]();
}

uint64_t dispatch thunk of ExpressibleByIntegerLiteral.init(integerLiteral:)()
{
  return MEMORY[0x1F4185A20]();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return MEMORY[0x1F4185A40]();
}

uint64_t dispatch thunk of SingleValueDecodingContainer.decode(_:)()
{
  return MEMORY[0x1F4185AB8]();
}

uint64_t dispatch thunk of SingleValueEncodingContainer.encode(_:)()
{
  return MEMORY[0x1F4185B60]();
}

uint64_t dispatch thunk of _ExpressibleByBuiltinIntegerLiteral.init(_builtinIntegerLiteral:)()
{
  return MEMORY[0x1F4185D58]();
}

uint64_t Hasher.init(_seed:)()
{
  return MEMORY[0x1F4185EB0]();
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt a1)
{
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt64 a1)
{
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return MEMORY[0x1F4185EF8]();
}

uint64_t dispatch thunk of Decoder.singleValueContainer()()
{
  return MEMORY[0x1F4185FB8]();
}

uint64_t dispatch thunk of Decoder.container<A>(keyedBy:)()
{
  return MEMORY[0x1F4185FC8]();
}

uint64_t dispatch thunk of Encoder.singleValueContainer()()
{
  return MEMORY[0x1F4185FE0]();
}

uint64_t dispatch thunk of Encoder.container<A>(keyedBy:)()
{
  return MEMORY[0x1F4185FF0]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1F40C9A70](aBlock);
}

void _Block_release(const void *aBlock)
{
}

void abort(void)
{
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_apply(size_t iterations, dispatch_queue_t queue, void *block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_assert_queue_barrier(dispatch_queue_t queue)
{
}

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async_and_wait(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_barrier_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_barrier_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_block_cancel(dispatch_block_t block)
{
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1F40CB9C0](flags, block);
}

dispatch_block_t dispatch_block_create_with_qos_class(dispatch_block_flags_t flags, dispatch_qos_class_t qos_class, int relative_priority, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1F40CB9C8](flags, *(void *)&qos_class, *(void *)&relative_priority, block);
}

void dispatch_block_notify(dispatch_block_t block, dispatch_queue_t queue, dispatch_block_t notification_block)
{
}

intptr_t dispatch_block_testcancel(dispatch_block_t block)
{
  return MEMORY[0x1F40CB9F0](block);
}

intptr_t dispatch_block_wait(dispatch_block_t block, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CB9F8](block, timeout);
}

BOOL dispatch_data_apply(dispatch_data_t data, dispatch_data_applier_t applier)
{
  return MEMORY[0x1F40CBA00](data, applier);
}

dispatch_data_t dispatch_data_copy_region(dispatch_data_t data, size_t location, size_t *offset_ptr)
{
  return (dispatch_data_t)MEMORY[0x1F40CBA08](data, location, offset_ptr);
}

dispatch_data_t dispatch_data_create(const void *buffer, size_t size, dispatch_queue_t queue, dispatch_block_t destructor)
{
  return (dispatch_data_t)MEMORY[0x1F40CBA10](buffer, size, queue, destructor);
}

dispatch_data_t dispatch_data_create_concat(dispatch_data_t data1, dispatch_data_t data2)
{
  return (dispatch_data_t)MEMORY[0x1F40CBA20](data1, data2);
}

dispatch_data_t dispatch_data_create_map(dispatch_data_t data, const void **buffer_ptr, size_t *size_ptr)
{
  return (dispatch_data_t)MEMORY[0x1F40CBA30](data, buffer_ptr, size_ptr);
}

dispatch_data_t dispatch_data_create_subrange(dispatch_data_t data, size_t offset, size_t length)
{
  return (dispatch_data_t)MEMORY[0x1F40CBA38](data, offset, length);
}

size_t dispatch_data_get_size(dispatch_data_t data)
{
  return MEMORY[0x1F40CBA48](data);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1F40CBA60](identifier, flags);
}

void *__cdecl dispatch_get_specific(const void *key)
{
  return (void *)MEMORY[0x1F40CBA68](key);
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBAC0](group, timeout);
}

void dispatch_io_close(dispatch_io_t channel, dispatch_io_close_flags_t flags)
{
}

dispatch_io_t dispatch_io_create(dispatch_io_type_t type, dispatch_fd_t fd, dispatch_queue_t queue, void *cleanup_handler)
{
  return (dispatch_io_t)MEMORY[0x1F40CBAD8](type, *(void *)&fd, queue, cleanup_handler);
}

dispatch_io_t dispatch_io_create_with_io(dispatch_io_type_t type, dispatch_io_t io, dispatch_queue_t queue, void *cleanup_handler)
{
  return (dispatch_io_t)MEMORY[0x1F40CBAE0](type, io, queue, cleanup_handler);
}

dispatch_io_t dispatch_io_create_with_path(dispatch_io_type_t type, const char *path, int oflag, mode_t mode, dispatch_queue_t queue, void *cleanup_handler)
{
  return (dispatch_io_t)MEMORY[0x1F40CBAE8](type, path, *(void *)&oflag, mode, queue, cleanup_handler);
}

void dispatch_io_read(dispatch_io_t channel, off_t offset, size_t length, dispatch_queue_t queue, dispatch_io_handler_t io_handler)
{
}

void dispatch_io_set_interval(dispatch_io_t channel, uint64_t interval, dispatch_io_interval_flags_t flags)
{
}

void dispatch_io_write(dispatch_io_t channel, off_t offset, dispatch_data_t data, dispatch_queue_t queue, dispatch_io_handler_t io_handler)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_initially_inactive(dispatch_queue_attr_t attr)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBA0](attr);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBA8](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBB8](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBD0](label, attr, target);
}

const char *__cdecl dispatch_queue_get_label(dispatch_queue_t queue)
{
  return (const char *)MEMORY[0x1F40CBBD8](queue);
}

dispatch_qos_class_t dispatch_queue_get_qos_class(dispatch_queue_t queue, int *relative_priority_ptr)
{
  return MEMORY[0x1F40CBBE0](queue, relative_priority_ptr);
}

void *__cdecl dispatch_queue_get_specific(dispatch_queue_t queue, const void *key)
{
  return (void *)MEMORY[0x1F40CBBE8](queue, key);
}

void dispatch_queue_set_specific(dispatch_queue_t queue, const void *key, void *context, dispatch_function_t destructor)
{
}

void dispatch_read(dispatch_fd_t fd, size_t length, dispatch_queue_t queue, void *handler)
{
}

void dispatch_resume(dispatch_object_t object)
{
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1F40CBC40](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBC50](dsema, timeout);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1F40CBC98](type, handle, mask, queue);
}

uintptr_t dispatch_source_get_handle(dispatch_source_t source)
{
  return MEMORY[0x1F40CBCA8](source);
}

void dispatch_source_merge_data(dispatch_source_t source, uintptr_t value)
{
}

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_registration_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

intptr_t dispatch_source_testcancel(dispatch_source_t source)
{
  return MEMORY[0x1F40CBCF8](source);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

dispatch_time_t dispatch_walltime(const timespec *when, int64_t delta)
{
  return MEMORY[0x1F40CBD40](when, delta);
}

dispatch_workloop_t dispatch_workloop_create_inactive(const char *label)
{
  return (dispatch_workloop_t)MEMORY[0x1F40CBD58](label);
}

void dispatch_workloop_set_autorelease_frequency(dispatch_workloop_t workloop, dispatch_autorelease_frequency_t frequency)
{
}

void dispatch_workloop_set_os_workgroup(dispatch_workloop_t workloop, os_workgroup_t workgroup)
{
}

void dispatch_write(dispatch_fd_t fd, dispatch_data_t data, dispatch_queue_t queue, void *handler)
{
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1F40CCA60](info);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1F40CCB80](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD10](__dst, __src, __len);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
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

uint64_t swift_allocBox()
{
  return MEMORY[0x1F41863D0]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1F41863E8]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x1F4186430]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1F4186440]();
}

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x1F4186460]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1F41864B8]();
}

uint64_t swift_dynamicCastObjCClassUnconditional()
{
  return MEMORY[0x1F41864E8]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x1F4186528]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x1F4186530]();
}

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x1F4186538]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x1F4186540]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x1F41865E0]();
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

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x1F4186688]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x1F41866A8]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x1F41866C8]();
}

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x1F4186710]();
}

uint64_t swift_once()
{
  return MEMORY[0x1F4186728]();
}

uint64_t swift_projectBox()
{
  return MEMORY[0x1F4186730]();
}

uint64_t swift_release()
{
  return MEMORY[0x1F4186758]();
}

uint64_t swift_reportError()
{
  return MEMORY[0x1F4186768]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1F4186770]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1F41867E0]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1F41867F0]();
}