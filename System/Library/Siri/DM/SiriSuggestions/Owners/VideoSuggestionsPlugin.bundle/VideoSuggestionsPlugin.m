uint64_t sub_1AC0()
{
  sub_3450();
  sub_3510();
  sub_1B60();
  return sub_3430();
}

uint64_t sub_1B60()
{
  sub_1D30(&qword_80A0);
  __chkstk_darwin();
  v1 = (char *)v8 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_8090 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_3370();
  sub_1DC4(v2, (uint64_t)qword_89C0);
  strcpy(v1, "com.apple.tv");
  v1[13] = 0;
  *((_WORD *)v1 + 7) = -5120;
  uint64_t v3 = enum case for Image.appIcon(_:);
  uint64_t v4 = sub_34C0();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v4 - 8) + 104))(v1, v3, v4);
  sub_1DFC((uint64_t)v1, 0, 1, v4);
  uint64_t v5 = sub_3490();
  swift_allocObject();
  uint64_t v6 = sub_3480();
  v9[3] = v5;
  v9[4] = &protocol witness table for StaticIconUrlProvider;
  v9[0] = v6;
  v8[3] = &type metadata for FindVideoActionProvider;
  v8[4] = sub_1E24();
  sub_33C0();
  sub_1E70(v8);
  return sub_1E70(v9);
}

uint64_t sub_1D30(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_1D74@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_33F0();
  uint64_t v3 = sub_33E0();
  a1[3] = v2;
  unint64_t result = sub_1ED0();
  a1[4] = result;
  *a1 = v3;
  return result;
}

uint64_t sub_1DC4(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_1DFC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

unint64_t sub_1E24()
{
  unint64_t result = qword_80A8;
  if (!qword_80A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_80A8);
  }
  return result;
}

uint64_t sub_1E70(void *a1)
{
  uint64_t v1 = *(void *)(a1[3] - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return _swift_release(*a1);
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

ValueMetadata *type metadata accessor for FindVideoActionProvider()
{
  return &type metadata for FindVideoActionProvider;
}

unint64_t sub_1ED0()
{
  unint64_t result = qword_80B0;
  if (!qword_80B0)
  {
    sub_33F0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_80B0);
  }
  return result;
}

uint64_t sub_1F20()
{
  uint64_t v0 = sub_3370();
  sub_1F88(v0, qword_89C0);
  sub_1DC4(v0, (uint64_t)qword_89C0);
  return sub_3360();
}

uint64_t *sub_1F88(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

ValueMetadata *type metadata accessor for VideoGenerator()
{
  return &type metadata for VideoGenerator;
}

uint64_t sub_1FFC()
{
  sub_1D30(&qword_80E0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_3820;
  sub_34F0();
  *(void *)(inited + 32) = sub_34D0();
  sub_1D30(&qword_80E8);
  uint64_t v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_3830;
  *(void *)(v1 + 56) = &type metadata for VideoConfiguration;
  unint64_t v2 = sub_2580();
  *(void *)(v1 + 64) = v2;
  *(void *)(v1 + 32) = 0xD00000000000002ALL;
  *(void *)(v1 + 40) = 0x80000000000035F0;
  *(void *)(inited + 40) = v1;
  uint64_t v3 = sub_33D0();
  v7[3] = v3;
  v7[4] = sub_2630(&qword_80F8, (void (*)(uint64_t))&type metadata accessor for CoreSignalTypes);
  uint64_t v4 = sub_25CC(v7);
  (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v3 - 8) + 104))(v4, enum case for CoreSignalTypes.app(_:), v3);
  *(void *)(inited + 48) = sub_34E0();
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_3830;
  *(void *)(v5 + 56) = &type metadata for VideoConfiguration;
  *(void *)(v5 + 64) = v2;
  *(void *)(v5 + 32) = 0xD00000000000002ALL;
  *(void *)(v5 + 40) = 0x80000000000035F0;
  *(void *)(inited + 56) = v5;
  sub_1D30(&qword_8100);
  sub_2630(&qword_8108, (void (*)(uint64_t))&type metadata accessor for Signal);
  return sub_3510();
}

uint64_t sub_220C()
{
  sub_2A40();
  return sub_2678(v1, v0, (uint64_t)&_swiftEmptyArrayStorage);
}

uint64_t sub_2230(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_2A20;
  return SignalSubscriber.getAsyncSubscriptions()(a1, a2);
}

uint64_t sub_22D8(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_2A20;
  return SignalSubscriber.getAsyncLookupSubscriptions()(a1, a2);
}

uint64_t sub_2380()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_240C;
  return sub_220C();
}

uint64_t sub_240C(uint64_t a1)
{
  sub_2A28();
  uint64_t v3 = *v1;
  sub_2A5C();
  *uint64_t v4 = v3;
  swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(uint64_t))(v3 + 8);
  return v5(a1);
}

unint64_t sub_24E4()
{
  unint64_t result = qword_80B8[0];
  if (!qword_80B8[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_80B8);
  }
  return result;
}

unint64_t sub_2534()
{
  unint64_t result = qword_80D8;
  if (!qword_80D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_80D8);
  }
  return result;
}

unint64_t sub_2580()
{
  unint64_t result = qword_80F0;
  if (!qword_80F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_80F0);
  }
  return result;
}

uint64_t *sub_25CC(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t sub_2630(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_2678(uint64_t (*a1)(uint64_t), uint64_t a2, uint64_t a3)
{
  return a1(a3);
}

void *initializeBufferWithCopyOfBuffer for VideoConfiguration(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for VideoConfiguration()
{
  return swift_bridgeObjectRelease();
}

void *assignWithCopy for VideoConfiguration(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 initializeWithTake for VideoConfiguration(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

void *assignWithTake for VideoConfiguration(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for VideoConfiguration(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 16))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 8);
      if (v2 >= 0xFFFFFFFF) {
        LODWORD(v2) = -1;
      }
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for VideoConfiguration(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for VideoConfiguration()
{
  return &type metadata for VideoConfiguration;
}

uint64_t sub_27D0()
{
  sub_2A40();
  return sub_2A18(v0);
}

uint64_t sub_27E4()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_2814()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_28A0;
  return sub_27D0();
}

uint64_t sub_28A0()
{
  sub_2A28();
  uint64_t v1 = *v0;
  sub_2A5C();
  *unint64_t v2 = v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(void))(v1 + 8);
  return v3();
}

uint64_t sub_2968(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_240C;
  return CandidateSuggestionConfigurator.isValid(signal:)(a1, a2, a3);
}

uint64_t sub_2A18(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_2A6C()
{
  sub_1D30(&qword_81D0);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_3830;
  *(void *)(v0 + 56) = &type metadata for VideoOwnerDefinition;
  *(void *)(v0 + 64) = sub_2B98();
  return v0;
}

uint64_t sub_2AC8()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for VideoOwnerDefinitionFactory()
{
  return self;
}

uint64_t sub_2AFC()
{
  return sub_2A6C();
}

uint64_t sub_2B14()
{
  uint64_t v1 = sub_34A0();
  unint64_t v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return sub_2678(v2, v0, v1);
}

unint64_t sub_2B98()
{
  unint64_t result = qword_81D8;
  if (!qword_81D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_81D8);
  }
  return result;
}

ValueMetadata *type metadata accessor for VideoOwnerDefinition()
{
  return &type metadata for VideoOwnerDefinition;
}

uint64_t sub_2BF4()
{
  sub_33A0();
  swift_allocObject();
  uint64_t result = sub_33B0();
  qword_89D8 = result;
  return result;
}

unint64_t sub_2C44@<X0>(uint64_t a1@<X8>)
{
  *(void *)(a1 + 24) = &type metadata for VideoGenerator;
  unint64_t result = sub_2DBC();
  *(void *)(a1 + 32) = result;
  return result;
}

unint64_t sub_2C78@<X0>(uint64_t a1@<X8>)
{
  *(void *)(a1 + 24) = &type metadata for VideoTargetOwnerDefinition;
  unint64_t result = sub_2D70();
  *(void *)(a1 + 32) = result;
  return result;
}

uint64_t sub_2CB8@<X0>(uint64_t *a1@<X8>)
{
  return sub_2EE8(a1);
}

unint64_t sub_2CD4()
{
  unint64_t result = qword_81E0;
  if (!qword_81E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_81E0);
  }
  return result;
}

unint64_t sub_2D24()
{
  unint64_t result = qword_81E8;
  if (!qword_81E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_81E8);
  }
  return result;
}

unint64_t sub_2D70()
{
  unint64_t result = qword_81F0;
  if (!qword_81F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_81F0);
  }
  return result;
}

unint64_t sub_2DBC()
{
  unint64_t result = qword_81F8;
  if (!qword_81F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_81F8);
  }
  return result;
}

unint64_t sub_2E08()
{
  unint64_t result = qword_8200;
  if (!qword_8200)
  {
    sub_33A0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_8200);
  }
  return result;
}

ValueMetadata *type metadata accessor for VideoTargetOwnerDefinition()
{
  return &type metadata for VideoTargetOwnerDefinition;
}

unint64_t sub_2E68@<X0>(uint64_t a1@<X8>)
{
  *(void *)(a1 + 24) = &type metadata for VideoSuggestionsRepository;
  unint64_t result = sub_2FC4();
  *(void *)(a1 + 32) = result;
  return result;
}

void *sub_2E9C()
{
  return &_swiftEmptyArrayStorage;
}

uint64_t sub_2EA8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_3470();
  uint64_t result = sub_3460();
  a1[3] = v2;
  a1[4] = (uint64_t)&protocol witness table for NoOpSuggestionFilter;
  *a1 = result;
  return result;
}

uint64_t sub_2EE8@<X0>(uint64_t *a1@<X8>)
{
  if (qword_8098 != -1) {
    swift_once();
  }
  uint64_t v2 = qword_89D8;
  a1[3] = sub_33A0();
  a1[4] = sub_2E08();
  *a1 = v2;
  return _swift_retain(v2);
}

unint64_t sub_2F78()
{
  unint64_t result = qword_8208;
  if (!qword_8208)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_8208);
  }
  return result;
}

unint64_t sub_2FC4()
{
  unint64_t result = qword_8210;
  if (!qword_8210)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_8210);
  }
  return result;
}

ValueMetadata *type metadata accessor for VideoSuggestionsRepository()
{
  return &type metadata for VideoSuggestionsRepository;
}

uint64_t sub_3020()
{
  sub_1D30((uint64_t *)&unk_8230);
  sub_3440();
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_3830;
  sub_1AC0();
  return v0;
}

uint64_t sub_30D0(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_3178;
  return InternalSuggestionsRepository.getAsyncPooledSuggestions()(a1, a2);
}

uint64_t sub_3178(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

uint64_t sub_3274(uint64_t a1)
{
  unint64_t v2 = sub_2FC4();
  return SuggestionsRepository.getOwner()(a1, v2);
}

unint64_t sub_32C4()
{
  unint64_t result = qword_8218;
  if (!qword_8218)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_8218);
  }
  return result;
}

unint64_t sub_3314()
{
  unint64_t result = qword_8228;
  if (!qword_8228)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_8228);
  }
  return result;
}

uint64_t sub_3360()
{
  return URL.init(fileURLWithPath:isDirectory:)();
}

uint64_t sub_3370()
{
  return type metadata accessor for URL();
}

uint64_t sub_33A0()
{
  return type metadata accessor for DomainOwner();
}

uint64_t sub_33B0()
{
  return DomainOwner.init(_:)();
}

uint64_t sub_33C0()
{
  return static ViewCallbacks.createCatViewCallback(dialogId:templateDirectory:assetsProvider:invocationActionProvider:)();
}

uint64_t sub_33D0()
{
  return type metadata accessor for CoreSignalTypes();
}

uint64_t sub_33E0()
{
  return UtteranceAction.__allocating_init()();
}

uint64_t sub_33F0()
{
  return type metadata accessor for UtteranceAction();
}

uint64_t sub_3410()
{
  return SignalSubscriber.getConfiguratorProvider()();
}

uint64_t sub_3430()
{
  return SuggestionDetails.init(suggestionId:resolverParams:viewProvider:actionIdKeyMapper:filter:)();
}

uint64_t sub_3440()
{
  return type metadata accessor for SuggestionDetails();
}

uint64_t sub_3450()
{
  return type metadata accessor for ResolvableParameter();
}

uint64_t sub_3460()
{
  return static NoOpSuggestionFilter.Instance.getter();
}

uint64_t sub_3470()
{
  return type metadata accessor for NoOpSuggestionFilter();
}

uint64_t sub_3480()
{
  return StaticIconUrlProvider.init(icon:)();
}

uint64_t sub_3490()
{
  return type metadata accessor for StaticIconUrlProvider();
}

uint64_t sub_34A0()
{
  return static OwnerDefinitionFactory.createOwnerDefinitions(builderFactory:)();
}

uint64_t sub_34C0()
{
  return type metadata accessor for Image();
}

uint64_t sub_34D0()
{
  return static Signal.HomeScreen.getter();
}

uint64_t sub_34E0()
{
  return Signal.__allocating_init(signalType:signalValue:fallbackSignals:)();
}

uint64_t sub_34F0()
{
  return type metadata accessor for Signal();
}

uint64_t sub_3500()
{
  return Wrappable.getRoot()();
}

uint64_t sub_3510()
{
  return Dictionary.init(dictionaryLiteral:)();
}

uint64_t self
{
  return _self;
}

uint64_t swift_allocBox()
{
  return _swift_allocBox();
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

uint64_t swift_initStackObject()
{
  return _swift_initStackObject();
}

uint64_t swift_once()
{
  return _swift_once();
}

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_task_alloc()
{
  return _swift_task_alloc();
}

uint64_t swift_task_dealloc()
{
  return _swift_task_dealloc();
}