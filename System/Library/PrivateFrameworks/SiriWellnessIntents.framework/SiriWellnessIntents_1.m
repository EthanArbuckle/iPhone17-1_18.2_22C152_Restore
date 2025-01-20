uint64_t GetHealthQuantityIntentResponse.code.setter(uint64_t a1)
{
  uint64_t v1;
  void *v3;

  v3 = (void *)(v1 + OBJC_IVAR___GetHealthQuantityIntentResponse_code);
  swift_beginAccess();
  *v3 = a1;
  return swift_endAccess();
}

uint64_t (*GetHealthQuantityIntentResponse.code.modify())()
{
  return LogQuantityIntentResponse.code.modify;
}

void key path getter for GetHealthQuantityIntentResponse.code : GetHealthQuantityIntentResponse(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v3 = *a1;
  id v2 = *a1;
  *a2 = GetHealthQuantityIntentResponse.code.getter();
}

void key path setter for GetHealthQuantityIntentResponse.code : GetHealthQuantityIntentResponse(uint64_t *a1, id *a2)
{
  uint64_t v4 = *a1;
  id v3 = *a2;
  id v2 = *a2;
  GetHealthQuantityIntentResponse.code.setter(v4);
}

char *GetHealthQuantityIntentResponse.init(code:userActivity:)(uint64_t a1, void *a2)
{
  v9 = (char *)objc_msgSend(v10, sel_init);
  id v2 = v9;
  id v3 = v9;
  uint64_t v4 = v9;
  v6 = &v9[OBJC_IVAR___GetHealthQuantityIntentResponse_code];
  swift_beginAccess();
  *(void *)v6 = a1;
  swift_endAccess();

  objc_msgSend(v9, sel_setUserActivity_, a2);
  return v9;
}

uint64_t type metadata accessor for GetHealthQuantityIntent()
{
  return self;
}

id GetHealthQuantityIntentResponse.__allocating_init()()
{
  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id GetHealthQuantityIntentResponse.init()()
{
  v1 = v0;
  v6 = v0;
  *(void *)&v0[OBJC_IVAR___GetHealthQuantityIntentResponse_code] = 0;

  v5.receiver = v6;
  v5.super_class = (Class)type metadata accessor for GetHealthQuantityIntentResponse();
  id v4 = objc_msgSendSuper2(&v5, sel_init);
  id v2 = v4;
  v6 = v4;

  return v4;
}

uint64_t type metadata accessor for GetHealthQuantityIntentResponse()
{
  return self;
}

id GetHealthQuantityIntentResponse.__allocating_init(coder:)(void *a1)
{
  id v4 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v4;
}

id GetHealthQuantityIntentResponse.init(coder:)(void *a1)
{
  v9 = a1;
  id v2 = v1;
  id v10 = v1;
  *(void *)&v1[OBJC_IVAR___GetHealthQuantityIntentResponse_code] = 0;

  v8.receiver = v10;
  v8.super_class = (Class)type metadata accessor for GetHealthQuantityIntentResponse();
  id v7 = objc_msgSendSuper2(&v8, sel_initWithCoder_, a1);
  if (v7)
  {
    id v3 = v7;
    id v10 = v7;

    return v7;
  }
  else
  {

    return 0;
  }
}

id GetHealthQuantityIntentResponse.__allocating_init(backingStore:)(void *a1)
{
  id v4 = objc_msgSend(objc_allocWithZone(v1), sel_initWithBackingStore_, a1);

  return v4;
}

id GetHealthQuantityIntentResponse.init(backingStore:)(void *a1)
{
  v9 = a1;
  id v2 = v1;
  id v10 = v1;
  *(void *)&v1[OBJC_IVAR___GetHealthQuantityIntentResponse_code] = 0;

  v8.receiver = v10;
  v8.super_class = (Class)type metadata accessor for GetHealthQuantityIntentResponse();
  id v7 = objc_msgSendSuper2(&v8, sel_initWithBackingStore_, a1);
  if (v7)
  {
    id v3 = v7;
    id v10 = v7;

    return v7;
  }
  else
  {

    return 0;
  }
}

id GetHealthQuantityIntentResponse.__allocating_init(propertiesByName:)(uint64_t a1)
{
  id v8 = objc_allocWithZone(v1);
  if (a1)
  {
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    id v2 = objc_msgSend(v8, sel_initWithPropertiesByName_, isa);
  }
  else
  {
    id v2 = objc_msgSend(v8, sel_initWithPropertiesByName_, 0);
  }
  id v5 = v2;

  return v5;
}

id GetHealthQuantityIntentResponse.init(propertiesByName:)(uint64_t a1)
{
  uint64_t v11 = a1;
  id v2 = v1;
  id v12 = v1;
  *(void *)&v1[OBJC_IVAR___GetHealthQuantityIntentResponse_code] = 0;

  swift_bridgeObjectRetain();
  if (a1)
  {
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    Class v8 = isa;
  }
  else
  {
    Class v8 = 0;
  }
  v10.receiver = v12;
  v10.super_class = (Class)type metadata accessor for GetHealthQuantityIntentResponse();
  id v6 = objc_msgSendSuper2(&v10, sel_initWithPropertiesByName_, v8);

  if (v6)
  {
    id v3 = v6;
    id v12 = v6;
    swift_bridgeObjectRelease();

    return v6;
  }
  else
  {

    swift_bridgeObjectRelease();
    return 0;
  }
}

id GetHealthQuantityIntentResponse.__deallocating_deinit()
{
  id v3 = v0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for GetHealthQuantityIntentResponse();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t base witness table accessor for Equatable in GetHealthQuantityIntentResponseCode()
{
  return lazy protocol witness table accessor for type GetHealthQuantityIntentResponseCode and conformance GetHealthQuantityIntentResponseCode();
}

unint64_t lazy protocol witness table accessor for type GetHealthQuantityIntentResponseCode and conformance GetHealthQuantityIntentResponseCode()
{
  uint64_t v2 = lazy protocol witness table cache variable for type GetHealthQuantityIntentResponseCode and conformance GetHealthQuantityIntentResponseCode;
  if (!lazy protocol witness table cache variable for type GetHealthQuantityIntentResponseCode and conformance GetHealthQuantityIntentResponseCode)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type GetHealthQuantityIntentResponseCode and conformance GetHealthQuantityIntentResponseCode);
    return WitnessTable;
  }
  return v2;
}

{
  unint64_t WitnessTable;
  uint64_t v2;

  uint64_t v2 = lazy protocol witness table cache variable for type GetHealthQuantityIntentResponseCode and conformance GetHealthQuantityIntentResponseCode;
  if (!lazy protocol witness table cache variable for type GetHealthQuantityIntentResponseCode and conformance GetHealthQuantityIntentResponseCode)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type GetHealthQuantityIntentResponseCode and conformance GetHealthQuantityIntentResponseCode);
    return WitnessTable;
  }
  return v2;
}

void sub_25DEFBD48(id *a1@<X0>, uint64_t *a2@<X8>)
{
}

void sub_25DEFBD60(uint64_t *a1, id *a2)
{
}

ValueMetadata *type metadata accessor for GetHealthQuantityIntentResponseCode()
{
  return &type metadata for GetHealthQuantityIntentResponseCode;
}

SiriWellnessIntents::DataProviderFactory __swiftcall DataProviderFactory.init()()
{
  id v3 = 0;
  type metadata accessor for HKHealthStore();
  uint64_t v2 = NSDateFormatter.__allocating_init()();
  id v0 = v2;
  id v3 = v2;
  outlined destroy of HealthKitPersistor(&v3);
  return (SiriWellnessIntents::DataProviderFactory)v2;
}

void *DataProviderFactory.ambiguousDistanceProvider()@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  id v2 = a1;
  static HealthKitDistanceProvider<A>.ambiguousDistance(store:)(a1, v7);

  a2[3] = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for HealthKitDistanceProvider<GetAmbiguousDistanceIntentResponse>);
  a2[4] = (uint64_t)&protocol witness table for <A> HealthKitDistanceProvider<A>;
  uint64_t v3 = swift_allocObject();
  *a2 = v3;
  return memcpy((void *)(v3 + 16), v7, 0x30uLL);
}

uint64_t sub_25DEFBF10()
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

void *DataProviderFactory.bloodPressureProvider()@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  id v2 = a1;
  static HealthKitCorrelationProvider<A>.bloodPressure(store:)(a1, v7);

  a2[3] = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for HealthKitCorrelationProvider<GetBloodPressureIntentResponse>);
  a2[4] = (uint64_t)&protocol witness table for <A> HealthKitCorrelationProvider<A>;
  uint64_t v3 = swift_allocObject();
  *a2 = v3;
  return memcpy((void *)(v3 + 16), v7, 0x40uLL);
}

uint64_t sub_25DEFC010()
{
  swift_release();
  swift_release();
  return swift_deallocObject();
}

void *protocol witness for DataProviderFactoryProtocol.ambiguousDistanceProvider() in conformance DataProviderFactory@<X0>(uint64_t *a1@<X8>)
{
  return DataProviderFactory.ambiguousDistanceProvider()(*v1, a1);
}

void *protocol witness for DataProviderFactoryProtocol.bloodPressureProvider() in conformance DataProviderFactory@<X0>(uint64_t *a1@<X8>)
{
  return DataProviderFactory.bloodPressureProvider()(*v1, a1);
}

ValueMetadata *type metadata accessor for DataProviderFactory()
{
  return &type metadata for DataProviderFactory;
}

uint64_t PeriodFlow.init(healthLogValueCategoryValue:)()
{
  swift_bridgeObjectRetain();
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("light", 5uLL, 1);
  swift_bridgeObjectRetain();
  char v6 = static String.== infix(_:_:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v6)
  {
    swift_bridgeObjectRelease();
    uint64_t v7 = 3;
LABEL_11:
    swift_bridgeObjectRelease();
    return v7;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("medium", 6uLL, 1);
  swift_bridgeObjectRetain();
  char v5 = static String.== infix(_:_:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v5)
  {
    swift_bridgeObjectRelease();
    uint64_t v7 = 4;
    goto LABEL_11;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("heavy", 5uLL, 1);
  swift_bridgeObjectRetain();
  char v4 = static String.== infix(_:_:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v4)
  {
    swift_bridgeObjectRelease();
    uint64_t v7 = 5;
    goto LABEL_11;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("not", 3uLL, 1);
  swift_bridgeObjectRetain();
  char v3 = static String.== infix(_:_:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v3 & 1) != 0
    || (swift_bridgeObjectRelease(),
        swift_bridgeObjectRetain(),
        String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("none", 4uLL, 1),
        swift_bridgeObjectRetain(),
        char v2 = static String.== infix(_:_:)(),
        swift_bridgeObjectRelease(),
        swift_bridgeObjectRelease(),
        (v2 & 1) != 0))
  {
    swift_bridgeObjectRelease();
    uint64_t v7 = 1;
    goto LABEL_11;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t PeriodFlow.init(rawDoubleValue:)(unint64_t a1, char a2)
{
  if (a2) {
    return 2;
  }
  if (((a1 >> 52) & 0x7FF) == 0x7FF)
  {
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  if (*(double *)&a1 <= -9.22337204e18)
  {
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  if (*(double *)&a1 >= 9.22337204e18)
  {
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  uint64_t v4 = PeriodFlow.init(rawValue:)((uint64_t)*(double *)&a1);
  if (v2) {
    return 2;
  }
  else {
    return v4;
  }
}

BOOL WellnessMagnitudeUnit.init(rawValue:)(uint64_t a1, void *a2)
{
  string._countAndFlagsBits = a1;
  string._object = a2;
  uint64_t v2 = _allocateUninitializedArray<A>(_:)();
  *(void *)uint64_t v3 = "none";
  *(void *)(v3 + 8) = 4;
  *(unsigned char *)(v3 + 16) = 2;
  _finalizeUninitializedArray<A>(_:)();
  Swift::Int v6 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)v2, string);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v6 != 0;
}

uint64_t WellnessMagnitudeUnit.rawValue.getter()
{
  return String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("none", 4uLL, 1)._countAndFlagsBits;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance WellnessMagnitudeUnit()
{
  return == infix<A>(_:_:)() & 1;
}

unint64_t base witness table accessor for Equatable in WellnessMagnitudeUnit()
{
  return lazy protocol witness table accessor for type WellnessMagnitudeUnit and conformance WellnessMagnitudeUnit();
}

unint64_t lazy protocol witness table accessor for type WellnessMagnitudeUnit and conformance WellnessMagnitudeUnit()
{
  uint64_t v2 = lazy protocol witness table cache variable for type WellnessMagnitudeUnit and conformance WellnessMagnitudeUnit;
  if (!lazy protocol witness table cache variable for type WellnessMagnitudeUnit and conformance WellnessMagnitudeUnit)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type WellnessMagnitudeUnit and conformance WellnessMagnitudeUnit);
    return WitnessTable;
  }
  return v2;
}

{
  unint64_t WitnessTable;
  uint64_t v2;

  uint64_t v2 = lazy protocol witness table cache variable for type WellnessMagnitudeUnit and conformance WellnessMagnitudeUnit;
  if (!lazy protocol witness table cache variable for type WellnessMagnitudeUnit and conformance WellnessMagnitudeUnit)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type WellnessMagnitudeUnit and conformance WellnessMagnitudeUnit);
    return WitnessTable;
  }
  return v2;
}

uint64_t protocol witness for Hashable.hashValue.getter in conformance WellnessMagnitudeUnit()
{
  return RawRepresentable<>.hashValue.getter();
}

uint64_t protocol witness for Hashable.hash(into:) in conformance WellnessMagnitudeUnit()
{
  return RawRepresentable<>.hash(into:)();
}

uint64_t protocol witness for Hashable._rawHashValue(seed:) in conformance WellnessMagnitudeUnit()
{
  return RawRepresentable<>._rawHashValue(seed:)();
}

BOOL protocol witness for RawRepresentable.init(rawValue:) in conformance WellnessMagnitudeUnit@<W0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  BOOL result = WellnessMagnitudeUnit.init(rawValue:)(*(void *)a1, *(void **)(a1 + 8));
  *a2 = result;
  return result;
}

uint64_t protocol witness for RawRepresentable.rawValue.getter in conformance WellnessMagnitudeUnit@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = WellnessMagnitudeUnit.rawValue.getter();
  *a1 = result;
  a1[1] = v2;
  return result;
}

ValueMetadata *type metadata accessor for WellnessMagnitudeUnit()
{
  return &type metadata for WellnessMagnitudeUnit;
}

id DeleteHealthSampleIntent.__allocating_init()()
{
  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id DeleteHealthSampleIntent.init()()
{
  id v4 = 0;
  v3.receiver = 0;
  v3.super_class = (Class)type metadata accessor for DeleteHealthSampleIntent();
  id v2 = objc_msgSendSuper2(&v3, sel_init);
  id v0 = v2;
  id v4 = v2;

  return v2;
}

uint64_t type metadata accessor for DeleteHealthSampleIntent()
{
  return self;
}

id DeleteHealthSampleIntent.__allocating_init(coder:)(void *a1)
{
  id v4 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v4;
}

id DeleteHealthSampleIntent.init(coder:)(void *a1)
{
  id v8 = 0;
  uint64_t v7 = a1;
  v6.receiver = 0;
  v6.super_class = (Class)type metadata accessor for DeleteHealthSampleIntent();
  id v5 = objc_msgSendSuper2(&v6, sel_initWithCoder_, a1);
  if (v5)
  {
    id v1 = v5;
    id v8 = v5;

    return v5;
  }
  else
  {

    return 0;
  }
}

id DeleteHealthSampleIntent.__allocating_init(identifier:backingStore:)(uint64_t a1, uint64_t a2, void *a3)
{
  id v11 = objc_allocWithZone(v3);
  if (a2)
  {
    uint64_t v6 = MEMORY[0x2611C8860](a1);
    swift_bridgeObjectRelease();
    uint64_t v7 = (void *)v6;
  }
  else
  {
    uint64_t v7 = 0;
  }
  id v5 = objc_msgSend(v11, sel_initWithIdentifier_backingStore_);

  return v5;
}

id DeleteHealthSampleIntent.init(identifier:backingStore:)(uint64_t a1, uint64_t a2, void *a3)
{
  id v15 = 0;
  uint64_t v13 = a1;
  uint64_t v14 = a2;
  id v12 = a3;
  swift_bridgeObjectRetain();
  if (a2)
  {
    uint64_t v6 = MEMORY[0x2611C8860](a1);
    swift_bridgeObjectRelease();
    uint64_t v7 = (void *)v6;
  }
  else
  {
    uint64_t v7 = 0;
  }
  v11.receiver = 0;
  v11.super_class = (Class)type metadata accessor for DeleteHealthSampleIntent();
  id v5 = objc_msgSendSuper2(&v11, sel_initWithIdentifier_backingStore_, v7, a3);

  id v3 = v5;
  id v15 = v5;

  swift_bridgeObjectRelease();
  return v5;
}

id DeleteHealthSampleIntent.__allocating_init(domain:verb:parametersByName:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v13 = objc_allocWithZone(v5);
  v16 = (void *)MEMORY[0x2611C8860](a1, a2);
  v18 = (void *)MEMORY[0x2611C8860](a3, a4);
  if (a5)
  {
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    id v6 = objc_msgSend(v13, sel_initWithDomain_verb_parametersByName_, v16, v18, isa);
  }
  else
  {
    id v6 = objc_msgSend(v13, sel_initWithDomain_verb_parametersByName_, v16, v18, 0);
  }
  id v9 = v6;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v9;
}

id DeleteHealthSampleIntent.init(domain:verb:parametersByName:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v23 = 0;
  uint64_t v21 = a1;
  uint64_t v22 = a2;
  uint64_t v19 = a3;
  uint64_t v20 = a4;
  uint64_t v18 = a5;
  swift_bridgeObjectRetain();
  id v12 = (id)MEMORY[0x2611C8860](a1, a2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  id v15 = (void *)MEMORY[0x2611C8860](a3, a4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  if (a5)
  {
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    Class v9 = isa;
  }
  else
  {
    Class v9 = 0;
  }
  v17.receiver = 0;
  v17.super_class = (Class)type metadata accessor for DeleteHealthSampleIntent();
  id v7 = objc_msgSendSuper2(&v17, sel_initWithDomain_verb_parametersByName_, v12, v15, v9);

  id v5 = v7;
  id v23 = v7;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return v7;
}

id DeleteHealthSampleIntent.__deallocating_deinit()
{
  id v3 = v0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DeleteHealthSampleIntent();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t DeleteHealthSampleIntentResponseCode.init(rawValue:)(uint64_t a1)
{
  switch(a1)
  {
    case 0:
      return 0;
    case 1:
      return 1;
    case 2:
      return 2;
    case 3:
      return 3;
    case 4:
      return 4;
    case 5:
      return 5;
    case 6:
      return 6;
    case 100:
      return 100;
    case 101:
      return 101;
    case 102:
      return 102;
  }
  return 0;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance DeleteHealthSampleIntentResponseCode()
{
  return == infix<A>(_:_:)() & 1;
}

uint64_t protocol witness for Hashable.hashValue.getter in conformance DeleteHealthSampleIntentResponseCode()
{
  return RawRepresentable<>.hashValue.getter();
}

uint64_t protocol witness for Hashable.hash(into:) in conformance DeleteHealthSampleIntentResponseCode()
{
  return RawRepresentable<>.hash(into:)();
}

uint64_t protocol witness for Hashable._rawHashValue(seed:) in conformance DeleteHealthSampleIntentResponseCode()
{
  return RawRepresentable<>._rawHashValue(seed:)();
}

uint64_t protocol witness for RawRepresentable.init(rawValue:) in conformance DeleteHealthSampleIntentResponseCode@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = DeleteHealthSampleIntentResponseCode.init(rawValue:)(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v3 & 1;
  return result;
}

void protocol witness for RawRepresentable.rawValue.getter in conformance DeleteHealthSampleIntentResponseCode(void *a1@<X8>)
{
  DeleteHealthSampleIntentResponseCode.rawValue.getter();
  *a1 = v1;
}

uint64_t DeleteHealthSampleIntentResponse.code.getter()
{
  objc_super v2 = (uint64_t *)(v0 + OBJC_IVAR___DeleteHealthSampleIntentResponse_code);
  swift_beginAccess();
  uint64_t v3 = *v2;
  swift_endAccess();
  return v3;
}

uint64_t DeleteHealthSampleIntentResponse.code.setter(uint64_t a1)
{
  uint64_t v3 = (void *)(v1 + OBJC_IVAR___DeleteHealthSampleIntentResponse_code);
  swift_beginAccess();
  *uint64_t v3 = a1;
  return swift_endAccess();
}

uint64_t (*DeleteHealthSampleIntentResponse.code.modify())()
{
  return LogQuantityIntentResponse.code.modify;
}

void key path getter for DeleteHealthSampleIntentResponse.code : DeleteHealthSampleIntentResponse(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v3 = *a1;
  id v2 = *a1;
  *a2 = DeleteHealthSampleIntentResponse.code.getter();
}

void key path setter for DeleteHealthSampleIntentResponse.code : DeleteHealthSampleIntentResponse(uint64_t *a1, id *a2)
{
  uint64_t v4 = *a1;
  id v3 = *a2;
  id v2 = *a2;
  DeleteHealthSampleIntentResponse.code.setter(v4);
}

char *DeleteHealthSampleIntentResponse.__allocating_init(code:userActivity:)(uint64_t a1, void *a2)
{
  id v3 = objc_allocWithZone(v2);
  return DeleteHealthSampleIntentResponse.init(code:userActivity:)(a1, a2);
}

char *DeleteHealthSampleIntentResponse.init(code:userActivity:)(uint64_t a1, void *a2)
{
  Class v9 = (char *)objc_msgSend(v10, sel_init);
  id v2 = v9;
  id v3 = v9;
  uint64_t v4 = v9;
  id v6 = &v9[OBJC_IVAR___DeleteHealthSampleIntentResponse_code];
  swift_beginAccess();
  *(void *)id v6 = a1;
  swift_endAccess();

  objc_msgSend(v9, sel_setUserActivity_, a2);
  return v9;
}

id DeleteHealthSampleIntentResponse.__allocating_init()()
{
  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id DeleteHealthSampleIntentResponse.init()()
{
  uint64_t v1 = v0;
  id v6 = v0;
  *(void *)&v0[OBJC_IVAR___DeleteHealthSampleIntentResponse_code] = 0;

  v5.receiver = v6;
  v5.super_class = (Class)type metadata accessor for DeleteHealthSampleIntentResponse();
  id v4 = objc_msgSendSuper2(&v5, sel_init);
  id v2 = v4;
  id v6 = v4;

  return v4;
}

uint64_t type metadata accessor for DeleteHealthSampleIntentResponse()
{
  return self;
}

id DeleteHealthSampleIntentResponse.__allocating_init(coder:)(void *a1)
{
  id v4 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v4;
}

id DeleteHealthSampleIntentResponse.init(coder:)(void *a1)
{
  Class v9 = a1;
  id v2 = v1;
  id v10 = v1;
  *(void *)&v1[OBJC_IVAR___DeleteHealthSampleIntentResponse_code] = 0;

  v8.receiver = v10;
  v8.super_class = (Class)type metadata accessor for DeleteHealthSampleIntentResponse();
  id v7 = objc_msgSendSuper2(&v8, sel_initWithCoder_, a1);
  if (v7)
  {
    id v3 = v7;
    id v10 = v7;

    return v7;
  }
  else
  {

    return 0;
  }
}

id DeleteHealthSampleIntentResponse.__allocating_init(backingStore:)(void *a1)
{
  id v4 = objc_msgSend(objc_allocWithZone(v1), sel_initWithBackingStore_, a1);

  return v4;
}

id DeleteHealthSampleIntentResponse.init(backingStore:)(void *a1)
{
  Class v9 = a1;
  id v2 = v1;
  id v10 = v1;
  *(void *)&v1[OBJC_IVAR___DeleteHealthSampleIntentResponse_code] = 0;

  v8.receiver = v10;
  v8.super_class = (Class)type metadata accessor for DeleteHealthSampleIntentResponse();
  id v7 = objc_msgSendSuper2(&v8, sel_initWithBackingStore_, a1);
  if (v7)
  {
    id v3 = v7;
    id v10 = v7;

    return v7;
  }
  else
  {

    return 0;
  }
}

id DeleteHealthSampleIntentResponse.__allocating_init(propertiesByName:)(uint64_t a1)
{
  id v8 = objc_allocWithZone(v1);
  if (a1)
  {
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    id v2 = objc_msgSend(v8, sel_initWithPropertiesByName_, isa);
  }
  else
  {
    id v2 = objc_msgSend(v8, sel_initWithPropertiesByName_, 0);
  }
  id v5 = v2;

  return v5;
}

id DeleteHealthSampleIntentResponse.init(propertiesByName:)(uint64_t a1)
{
  uint64_t v11 = a1;
  id v2 = v1;
  id v12 = v1;
  *(void *)&v1[OBJC_IVAR___DeleteHealthSampleIntentResponse_code] = 0;

  swift_bridgeObjectRetain();
  if (a1)
  {
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    Class v8 = isa;
  }
  else
  {
    Class v8 = 0;
  }
  v10.receiver = v12;
  v10.super_class = (Class)type metadata accessor for DeleteHealthSampleIntentResponse();
  id v6 = objc_msgSendSuper2(&v10, sel_initWithPropertiesByName_, v8);

  if (v6)
  {
    id v3 = v6;
    id v12 = v6;
    swift_bridgeObjectRelease();

    return v6;
  }
  else
  {

    swift_bridgeObjectRelease();
    return 0;
  }
}

id DeleteHealthSampleIntentResponse.__deallocating_deinit()
{
  id v3 = v0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DeleteHealthSampleIntentResponse();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t base witness table accessor for Equatable in DeleteHealthSampleIntentResponseCode()
{
  return lazy protocol witness table accessor for type DeleteHealthSampleIntentResponseCode and conformance DeleteHealthSampleIntentResponseCode();
}

unint64_t lazy protocol witness table accessor for type DeleteHealthSampleIntentResponseCode and conformance DeleteHealthSampleIntentResponseCode()
{
  uint64_t v2 = lazy protocol witness table cache variable for type DeleteHealthSampleIntentResponseCode and conformance DeleteHealthSampleIntentResponseCode;
  if (!lazy protocol witness table cache variable for type DeleteHealthSampleIntentResponseCode and conformance DeleteHealthSampleIntentResponseCode)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type DeleteHealthSampleIntentResponseCode and conformance DeleteHealthSampleIntentResponseCode);
    return WitnessTable;
  }
  return v2;
}

{
  unint64_t WitnessTable;
  uint64_t v2;

  uint64_t v2 = lazy protocol witness table cache variable for type DeleteHealthSampleIntentResponseCode and conformance DeleteHealthSampleIntentResponseCode;
  if (!lazy protocol witness table cache variable for type DeleteHealthSampleIntentResponseCode and conformance DeleteHealthSampleIntentResponseCode)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type DeleteHealthSampleIntentResponseCode and conformance DeleteHealthSampleIntentResponseCode);
    return WitnessTable;
  }
  return v2;
}

void sub_25DEFE2F0(id *a1@<X0>, uint64_t *a2@<X8>)
{
}

void sub_25DEFE308(uint64_t *a1, id *a2)
{
}

ValueMetadata *type metadata accessor for DeleteHealthSampleIntentResponseCode()
{
  return &type metadata for DeleteHealthSampleIntentResponseCode;
}

SiriWellnessIntents::WellnessSort_optional __swiftcall WellnessSort.init(rawValue:)(Swift::String rawValue)
{
  uint64_t v1 = _allocateUninitializedArray<A>(_:)();
  *(void *)uint64_t v2 = "average";
  *(void *)(v2 + 8) = 7;
  *(unsigned char *)(v2 + 16) = 2;
  *(void *)(v2 + 24) = "minimum";
  *(void *)(v2 + 32) = 7;
  *(unsigned char *)(v2 + 40) = 2;
  *(void *)(v2 + 48) = "maximum";
  *(void *)(v2 + 56) = 7;
  *(unsigned char *)(v2 + 64) = 2;
  *(void *)(v2 + 72) = "sum";
  *(void *)(v2 + 80) = 3;
  *(unsigned char *)(v2 + 88) = 2;
  *(void *)(v2 + 96) = "first";
  *(void *)(v2 + 104) = 5;
  *(unsigned char *)(v2 + 112) = 2;
  *(void *)(v2 + 120) = "last";
  *(void *)(v2 + 128) = 4;
  *(unsigned char *)(v2 + 136) = 2;
  *(void *)(v2 + 144) = "next";
  *(void *)(v2 + 152) = 4;
  *(unsigned char *)(v2 + 160) = 2;
  *(void *)(v2 + 168) = "above";
  *(void *)(v2 + 176) = 5;
  *(unsigned char *)(v2 + 184) = 2;
  *(void *)(v2 + 192) = "below";
  *(void *)(v2 + 200) = 5;
  *(unsigned char *)(v2 + 208) = 2;
  *(void *)(v2 + 216) = "unspecified";
  *(void *)(v2 + 224) = 11;
  *(unsigned char *)(v2 + 232) = 2;
  _finalizeUninitializedArray<A>(_:)();
  Swift::Int v6 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)v1, rawValue);
  swift_bridgeObjectRelease();
  switch(v6)
  {
    case 0:
      v7.value = SiriWellnessIntents_WellnessSort_average;
LABEL_22:
      swift_bridgeObjectRelease();
      return v7;
    case 1:
      v7.value = SiriWellnessIntents_WellnessSort_minimum;
      goto LABEL_22;
    case 2:
      v7.value = SiriWellnessIntents_WellnessSort_maximum;
      goto LABEL_22;
    case 3:
      v7.value = SiriWellnessIntents_WellnessSort_sum;
      goto LABEL_22;
    case 4:
      v7.value = SiriWellnessIntents_WellnessSort_first;
      goto LABEL_22;
    case 5:
      v7.value = SiriWellnessIntents_WellnessSort_last;
      goto LABEL_22;
    case 6:
      v7.value = SiriWellnessIntents_WellnessSort_next;
      goto LABEL_22;
    case 7:
      v7.value = SiriWellnessIntents_WellnessSort_above;
      goto LABEL_22;
    case 8:
      v7.value = SiriWellnessIntents_WellnessSort_below;
      goto LABEL_22;
    case 9:
      v7.value = SiriWellnessIntents_WellnessSort_unspecified;
      goto LABEL_22;
  }
  swift_bridgeObjectRelease();
  return (SiriWellnessIntents::WellnessSort_optional)10;
}

uint64_t WellnessSort.rawValue.getter(char a1)
{
  switch(a1)
  {
    case 1:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("minimum", 7uLL, 1)._countAndFlagsBits;
      break;
    case 2:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("maximum", 7uLL, 1)._countAndFlagsBits;
      break;
    case 3:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("sum", 3uLL, 1)._countAndFlagsBits;
      break;
    case 4:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("first", 5uLL, 1)._countAndFlagsBits;
      break;
    case 5:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("last", 4uLL, 1)._countAndFlagsBits;
      break;
    case 6:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("next", 4uLL, 1)._countAndFlagsBits;
      break;
    case 7:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("above", 5uLL, 1)._countAndFlagsBits;
      break;
    case 8:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("below", 5uLL, 1)._countAndFlagsBits;
      break;
    case 9:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("unspecified", 0xBuLL, 1)._countAndFlagsBits;
      break;
    default:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("average", 7uLL, 1)._countAndFlagsBits;
      break;
  }
  return countAndFlagsBits;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance WellnessSort()
{
  return == infix<A>(_:_:)() & 1;
}

unint64_t base witness table accessor for Equatable in WellnessSort()
{
  return lazy protocol witness table accessor for type WellnessSort and conformance WellnessSort();
}

unint64_t lazy protocol witness table accessor for type WellnessSort and conformance WellnessSort()
{
  uint64_t v2 = lazy protocol witness table cache variable for type WellnessSort and conformance WellnessSort;
  if (!lazy protocol witness table cache variable for type WellnessSort and conformance WellnessSort)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type WellnessSort and conformance WellnessSort);
    return WitnessTable;
  }
  return v2;
}

{
  unint64_t WitnessTable;
  uint64_t v2;

  uint64_t v2 = lazy protocol witness table cache variable for type WellnessSort and conformance WellnessSort;
  if (!lazy protocol witness table cache variable for type WellnessSort and conformance WellnessSort)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type WellnessSort and conformance WellnessSort);
    return WitnessTable;
  }
  return v2;
}

uint64_t protocol witness for Hashable.hashValue.getter in conformance WellnessSort()
{
  return RawRepresentable<>.hashValue.getter();
}

uint64_t protocol witness for Hashable.hash(into:) in conformance WellnessSort()
{
  return RawRepresentable<>.hash(into:)();
}

uint64_t protocol witness for Hashable._rawHashValue(seed:) in conformance WellnessSort()
{
  return RawRepresentable<>._rawHashValue(seed:)();
}

SiriWellnessIntents::WellnessSort_optional protocol witness for RawRepresentable.init(rawValue:) in conformance WellnessSort@<W0>(Swift::String *a1@<X0>, SiriWellnessIntents::WellnessSort_optional *a2@<X8>)
{
  result.value = WellnessSort.init(rawValue:)(*a1).value;
  a2->value = result.value;
  return result;
}

uint64_t protocol witness for RawRepresentable.rawValue.getter in conformance WellnessSort@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = WellnessSort.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t getEnumTagSinglePayload for WellnessSort(unsigned __int8 *a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 <= 0xF6) {
      goto LABEL_15;
    }
    unsigned int v7 = ((a2 + 9) >> 8) + 1;
    int v8 = 1;
    if (v7 >= 0x100)
    {
      if (v7 >= 0x10000) {
        int v2 = 4;
      }
      else {
        int v2 = 2;
      }
      int v8 = v2;
    }
    if (v8 == 1) {
      int v6 = a1[1];
    }
    else {
      int v6 = v8 == 2 ? *(unsigned __int16 *)(a1 + 1) : *(_DWORD *)(a1 + 1);
    }
    if (v6)
    {
      int v5 = (*a1 | ((v6 - 1) << 8)) + 246;
    }
    else
    {
LABEL_15:
      int v3 = *a1 - 10;
      if (v3 < 0) {
        int v3 = -1;
      }
      int v5 = v3;
    }
  }
  else
  {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for WellnessSort(unsigned char *result, unsigned int a2, unsigned int a3)
{
  int v7 = 0;
  if (a3 > 0xF6)
  {
    unsigned int v5 = ((a3 + 9) >> 8) + 1;
    int v6 = 1;
    if (v5 >= 0x100)
    {
      if (v5 >= 0x10000) {
        int v3 = 4;
      }
      else {
        int v3 = 2;
      }
      int v6 = v3;
    }
    int v7 = v6;
  }
  if (a2 > 0xF6)
  {
    unsigned int v4 = ((a2 - 247) >> 8) + 1;
    *uint64_t result = a2 + 9;
    if (v7)
    {
      if (v7 == 1)
      {
        result[1] = v4;
      }
      else if (v7 == 2)
      {
        *(_WORD *)(result + 1) = v4;
      }
      else
      {
        *(_DWORD *)(result + 1) = v4;
      }
    }
  }
  else
  {
    if (v7)
    {
      if (v7 == 1)
      {
        result[1] = 0;
      }
      else if (v7 == 2)
      {
        *(_WORD *)(result + 1) = 0;
      }
      else
      {
        *(_DWORD *)(result + 1) = 0;
      }
    }
    if (a2) {
      *uint64_t result = a2 + 9;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for WellnessSort()
{
  return &type metadata for WellnessSort;
}

char *GetAcitivitySummaryIntentResponse.__allocating_init(code:userActivity:)(uint64_t a1, void *a2)
{
  id v3 = objc_allocWithZone(v2);
  return GetAcitivitySummaryIntentResponse.init(code:userActivity:)(a1, a2);
}

id GetAcitivitySummaryIntent.__allocating_init()()
{
  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id GetAcitivitySummaryIntent.init()()
{
  id v4 = 0;
  v3.receiver = 0;
  v3.super_class = (Class)type metadata accessor for GetAcitivitySummaryIntent();
  id v2 = objc_msgSendSuper2(&v3, sel_init);
  id v0 = v2;
  id v4 = v2;

  return v2;
}

id GetAcitivitySummaryIntent.__allocating_init(coder:)(void *a1)
{
  id v4 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v4;
}

id GetAcitivitySummaryIntent.init(coder:)(void *a1)
{
  id v8 = 0;
  int v7 = a1;
  v6.receiver = 0;
  v6.super_class = (Class)type metadata accessor for GetAcitivitySummaryIntent();
  id v5 = objc_msgSendSuper2(&v6, sel_initWithCoder_, a1);
  if (v5)
  {
    id v1 = v5;
    id v8 = v5;

    return v5;
  }
  else
  {

    return 0;
  }
}

id GetAcitivitySummaryIntent.__allocating_init(identifier:backingStore:)(uint64_t a1, uint64_t a2, void *a3)
{
  id v11 = objc_allocWithZone(v3);
  if (a2)
  {
    uint64_t v6 = MEMORY[0x2611C8860](a1);
    swift_bridgeObjectRelease();
    int v7 = (void *)v6;
  }
  else
  {
    int v7 = 0;
  }
  id v5 = objc_msgSend(v11, sel_initWithIdentifier_backingStore_);

  return v5;
}

id GetAcitivitySummaryIntent.init(identifier:backingStore:)(uint64_t a1, uint64_t a2, void *a3)
{
  id v15 = 0;
  uint64_t v13 = a1;
  uint64_t v14 = a2;
  id v12 = a3;
  swift_bridgeObjectRetain();
  if (a2)
  {
    uint64_t v6 = MEMORY[0x2611C8860](a1);
    swift_bridgeObjectRelease();
    int v7 = (void *)v6;
  }
  else
  {
    int v7 = 0;
  }
  v11.receiver = 0;
  v11.super_class = (Class)type metadata accessor for GetAcitivitySummaryIntent();
  id v5 = objc_msgSendSuper2(&v11, sel_initWithIdentifier_backingStore_, v7, a3);

  id v3 = v5;
  id v15 = v5;

  swift_bridgeObjectRelease();
  return v5;
}

id GetAcitivitySummaryIntent.__allocating_init(domain:verb:parametersByName:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v13 = objc_allocWithZone(v5);
  v16 = (void *)MEMORY[0x2611C8860](a1, a2);
  uint64_t v18 = (void *)MEMORY[0x2611C8860](a3, a4);
  if (a5)
  {
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    id v6 = objc_msgSend(v13, sel_initWithDomain_verb_parametersByName_, v16, v18, isa);
  }
  else
  {
    id v6 = objc_msgSend(v13, sel_initWithDomain_verb_parametersByName_, v16, v18, 0);
  }
  id v9 = v6;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v9;
}

id GetAcitivitySummaryIntent.init(domain:verb:parametersByName:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v23 = 0;
  uint64_t v21 = a1;
  uint64_t v22 = a2;
  uint64_t v19 = a3;
  uint64_t v20 = a4;
  uint64_t v18 = a5;
  swift_bridgeObjectRetain();
  id v12 = (id)MEMORY[0x2611C8860](a1, a2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  id v15 = (void *)MEMORY[0x2611C8860](a3, a4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  if (a5)
  {
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    Class v9 = isa;
  }
  else
  {
    Class v9 = 0;
  }
  v17.receiver = 0;
  v17.super_class = (Class)type metadata accessor for GetAcitivitySummaryIntent();
  id v7 = objc_msgSendSuper2(&v17, sel_initWithDomain_verb_parametersByName_, v12, v15, v9);

  id v5 = v7;
  id v23 = v7;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return v7;
}

id GetAcitivitySummaryIntent.__deallocating_deinit()
{
  id v3 = v0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for GetAcitivitySummaryIntent();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t GetAcitivitySummaryIntentResponseCode.init(rawValue:)(uint64_t a1)
{
  switch(a1)
  {
    case 0:
      return 0;
    case 1:
      return 1;
    case 2:
      return 2;
    case 3:
      return 3;
    case 4:
      return 4;
    case 5:
      return 5;
    case 6:
      return 6;
    case 100:
      return 100;
    case 101:
      return 101;
    case 102:
      return 102;
    case 103:
      return 103;
  }
  return 0;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance GetAcitivitySummaryIntentResponseCode()
{
  return == infix<A>(_:_:)() & 1;
}

uint64_t protocol witness for Hashable.hashValue.getter in conformance GetAcitivitySummaryIntentResponseCode()
{
  return RawRepresentable<>.hashValue.getter();
}

uint64_t protocol witness for Hashable.hash(into:) in conformance GetAcitivitySummaryIntentResponseCode()
{
  return RawRepresentable<>.hash(into:)();
}

uint64_t protocol witness for Hashable._rawHashValue(seed:) in conformance GetAcitivitySummaryIntentResponseCode()
{
  return RawRepresentable<>._rawHashValue(seed:)();
}

uint64_t protocol witness for RawRepresentable.init(rawValue:) in conformance GetAcitivitySummaryIntentResponseCode@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = GetAcitivitySummaryIntentResponseCode.init(rawValue:)(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v3 & 1;
  return result;
}

void protocol witness for RawRepresentable.rawValue.getter in conformance GetAcitivitySummaryIntentResponseCode(void *a1@<X8>)
{
  GetAcitivitySummaryIntentResponseCode.rawValue.getter();
  *a1 = v1;
}

uint64_t GetAcitivitySummaryIntentResponse.code.getter()
{
  objc_super v2 = (uint64_t *)(v0 + OBJC_IVAR___GetAcitivitySummaryIntentResponse_code);
  swift_beginAccess();
  uint64_t v3 = *v2;
  swift_endAccess();
  return v3;
}

uint64_t GetAcitivitySummaryIntentResponse.code.setter(uint64_t a1)
{
  uint64_t v3 = (void *)(v1 + OBJC_IVAR___GetAcitivitySummaryIntentResponse_code);
  swift_beginAccess();
  *uint64_t v3 = a1;
  return swift_endAccess();
}

uint64_t (*GetAcitivitySummaryIntentResponse.code.modify())()
{
  return LogQuantityIntentResponse.code.modify;
}

void key path getter for GetAcitivitySummaryIntentResponse.code : GetAcitivitySummaryIntentResponse(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v3 = *a1;
  id v2 = *a1;
  *a2 = GetAcitivitySummaryIntentResponse.code.getter();
}

void key path setter for GetAcitivitySummaryIntentResponse.code : GetAcitivitySummaryIntentResponse(uint64_t *a1, id *a2)
{
  uint64_t v4 = *a1;
  id v3 = *a2;
  id v2 = *a2;
  GetAcitivitySummaryIntentResponse.code.setter(v4);
}

char *GetAcitivitySummaryIntentResponse.init(code:userActivity:)(uint64_t a1, void *a2)
{
  Class v9 = (char *)objc_msgSend(v10, sel_init);
  id v2 = v9;
  id v3 = v9;
  uint64_t v4 = v9;
  id v6 = &v9[OBJC_IVAR___GetAcitivitySummaryIntentResponse_code];
  swift_beginAccess();
  *(void *)id v6 = a1;
  swift_endAccess();

  objc_msgSend(v9, sel_setUserActivity_, a2);
  return v9;
}

uint64_t type metadata accessor for GetAcitivitySummaryIntent()
{
  return self;
}

id GetAcitivitySummaryIntentResponse.__allocating_init()()
{
  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id GetAcitivitySummaryIntentResponse.init()()
{
  uint64_t v1 = v0;
  id v6 = v0;
  *(void *)&v0[OBJC_IVAR___GetAcitivitySummaryIntentResponse_code] = 0;

  v5.receiver = v6;
  v5.super_class = (Class)type metadata accessor for GetAcitivitySummaryIntentResponse();
  id v4 = objc_msgSendSuper2(&v5, sel_init);
  id v2 = v4;
  id v6 = v4;

  return v4;
}

uint64_t type metadata accessor for GetAcitivitySummaryIntentResponse()
{
  return self;
}

id GetAcitivitySummaryIntentResponse.__allocating_init(coder:)(void *a1)
{
  id v4 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v4;
}

id GetAcitivitySummaryIntentResponse.init(coder:)(void *a1)
{
  Class v9 = a1;
  id v2 = v1;
  id v10 = v1;
  *(void *)&v1[OBJC_IVAR___GetAcitivitySummaryIntentResponse_code] = 0;

  v8.receiver = v10;
  v8.super_class = (Class)type metadata accessor for GetAcitivitySummaryIntentResponse();
  id v7 = objc_msgSendSuper2(&v8, sel_initWithCoder_, a1);
  if (v7)
  {
    id v3 = v7;
    id v10 = v7;

    return v7;
  }
  else
  {

    return 0;
  }
}

id GetAcitivitySummaryIntentResponse.__allocating_init(backingStore:)(void *a1)
{
  id v4 = objc_msgSend(objc_allocWithZone(v1), sel_initWithBackingStore_, a1);

  return v4;
}

id GetAcitivitySummaryIntentResponse.init(backingStore:)(void *a1)
{
  Class v9 = a1;
  id v2 = v1;
  id v10 = v1;
  *(void *)&v1[OBJC_IVAR___GetAcitivitySummaryIntentResponse_code] = 0;

  v8.receiver = v10;
  v8.super_class = (Class)type metadata accessor for GetAcitivitySummaryIntentResponse();
  id v7 = objc_msgSendSuper2(&v8, sel_initWithBackingStore_, a1);
  if (v7)
  {
    id v3 = v7;
    id v10 = v7;

    return v7;
  }
  else
  {

    return 0;
  }
}

id GetAcitivitySummaryIntentResponse.__allocating_init(propertiesByName:)(uint64_t a1)
{
  id v8 = objc_allocWithZone(v1);
  if (a1)
  {
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    id v2 = objc_msgSend(v8, sel_initWithPropertiesByName_, isa);
  }
  else
  {
    id v2 = objc_msgSend(v8, sel_initWithPropertiesByName_, 0);
  }
  id v5 = v2;

  return v5;
}

id GetAcitivitySummaryIntentResponse.init(propertiesByName:)(uint64_t a1)
{
  uint64_t v11 = a1;
  id v2 = v1;
  id v12 = v1;
  *(void *)&v1[OBJC_IVAR___GetAcitivitySummaryIntentResponse_code] = 0;

  swift_bridgeObjectRetain();
  if (a1)
  {
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    Class v8 = isa;
  }
  else
  {
    Class v8 = 0;
  }
  v10.receiver = v12;
  v10.super_class = (Class)type metadata accessor for GetAcitivitySummaryIntentResponse();
  id v6 = objc_msgSendSuper2(&v10, sel_initWithPropertiesByName_, v8);

  if (v6)
  {
    id v3 = v6;
    id v12 = v6;
    swift_bridgeObjectRelease();

    return v6;
  }
  else
  {

    swift_bridgeObjectRelease();
    return 0;
  }
}

id GetAcitivitySummaryIntentResponse.__deallocating_deinit()
{
  id v3 = v0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for GetAcitivitySummaryIntentResponse();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t base witness table accessor for Equatable in GetAcitivitySummaryIntentResponseCode()
{
  return lazy protocol witness table accessor for type GetAcitivitySummaryIntentResponseCode and conformance GetAcitivitySummaryIntentResponseCode();
}

unint64_t lazy protocol witness table accessor for type GetAcitivitySummaryIntentResponseCode and conformance GetAcitivitySummaryIntentResponseCode()
{
  uint64_t v2 = lazy protocol witness table cache variable for type GetAcitivitySummaryIntentResponseCode and conformance GetAcitivitySummaryIntentResponseCode;
  if (!lazy protocol witness table cache variable for type GetAcitivitySummaryIntentResponseCode and conformance GetAcitivitySummaryIntentResponseCode)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type GetAcitivitySummaryIntentResponseCode and conformance GetAcitivitySummaryIntentResponseCode);
    return WitnessTable;
  }
  return v2;
}

{
  unint64_t WitnessTable;
  uint64_t v2;

  uint64_t v2 = lazy protocol witness table cache variable for type GetAcitivitySummaryIntentResponseCode and conformance GetAcitivitySummaryIntentResponseCode;
  if (!lazy protocol witness table cache variable for type GetAcitivitySummaryIntentResponseCode and conformance GetAcitivitySummaryIntentResponseCode)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type GetAcitivitySummaryIntentResponseCode and conformance GetAcitivitySummaryIntentResponseCode);
    return WitnessTable;
  }
  return v2;
}

void sub_25DF00888(id *a1@<X0>, uint64_t *a2@<X8>)
{
}

void sub_25DF008A0(uint64_t *a1, id *a2)
{
}

ValueMetadata *type metadata accessor for GetAcitivitySummaryIntentResponseCode()
{
  return &type metadata for GetAcitivitySummaryIntentResponseCode;
}

id GetCardioFitnessIntent.__allocating_init()()
{
  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id GetCardioFitnessIntent.init()()
{
  id v4 = 0;
  v3.receiver = 0;
  v3.super_class = (Class)type metadata accessor for GetCardioFitnessIntent();
  id v2 = objc_msgSendSuper2(&v3, sel_init);
  id v0 = v2;
  id v4 = v2;

  return v2;
}

uint64_t type metadata accessor for GetCardioFitnessIntent()
{
  return self;
}

id GetCardioFitnessIntent.__allocating_init(coder:)(void *a1)
{
  id v4 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v4;
}

id GetCardioFitnessIntent.init(coder:)(void *a1)
{
  id v8 = 0;
  id v7 = a1;
  v6.receiver = 0;
  v6.super_class = (Class)type metadata accessor for GetCardioFitnessIntent();
  id v5 = objc_msgSendSuper2(&v6, sel_initWithCoder_, a1);
  if (v5)
  {
    id v1 = v5;
    id v8 = v5;

    return v5;
  }
  else
  {

    return 0;
  }
}

id GetCardioFitnessIntent.__allocating_init(identifier:backingStore:)(uint64_t a1, uint64_t a2, void *a3)
{
  id v11 = objc_allocWithZone(v3);
  if (a2)
  {
    uint64_t v6 = MEMORY[0x2611C8860](a1);
    swift_bridgeObjectRelease();
    id v7 = (void *)v6;
  }
  else
  {
    id v7 = 0;
  }
  id v5 = objc_msgSend(v11, sel_initWithIdentifier_backingStore_);

  return v5;
}

id GetCardioFitnessIntent.init(identifier:backingStore:)(uint64_t a1, uint64_t a2, void *a3)
{
  id v15 = 0;
  uint64_t v13 = a1;
  uint64_t v14 = a2;
  id v12 = a3;
  swift_bridgeObjectRetain();
  if (a2)
  {
    uint64_t v6 = MEMORY[0x2611C8860](a1);
    swift_bridgeObjectRelease();
    id v7 = (void *)v6;
  }
  else
  {
    id v7 = 0;
  }
  v11.receiver = 0;
  v11.super_class = (Class)type metadata accessor for GetCardioFitnessIntent();
  id v5 = objc_msgSendSuper2(&v11, sel_initWithIdentifier_backingStore_, v7, a3);

  id v3 = v5;
  id v15 = v5;

  swift_bridgeObjectRelease();
  return v5;
}

id GetCardioFitnessIntent.__allocating_init(domain:verb:parametersByName:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v13 = objc_allocWithZone(v5);
  v16 = (void *)MEMORY[0x2611C8860](a1, a2);
  uint64_t v18 = (void *)MEMORY[0x2611C8860](a3, a4);
  if (a5)
  {
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    id v6 = objc_msgSend(v13, sel_initWithDomain_verb_parametersByName_, v16, v18, isa);
  }
  else
  {
    id v6 = objc_msgSend(v13, sel_initWithDomain_verb_parametersByName_, v16, v18, 0);
  }
  id v9 = v6;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v9;
}

id GetCardioFitnessIntent.init(domain:verb:parametersByName:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v23 = 0;
  uint64_t v21 = a1;
  uint64_t v22 = a2;
  uint64_t v19 = a3;
  uint64_t v20 = a4;
  uint64_t v18 = a5;
  swift_bridgeObjectRetain();
  id v12 = (id)MEMORY[0x2611C8860](a1, a2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  id v15 = (void *)MEMORY[0x2611C8860](a3, a4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  if (a5)
  {
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    Class v9 = isa;
  }
  else
  {
    Class v9 = 0;
  }
  v17.receiver = 0;
  v17.super_class = (Class)type metadata accessor for GetCardioFitnessIntent();
  id v7 = objc_msgSendSuper2(&v17, sel_initWithDomain_verb_parametersByName_, v12, v15, v9);

  id v5 = v7;
  id v23 = v7;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return v7;
}

id GetCardioFitnessIntent.__deallocating_deinit()
{
  id v3 = v0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for GetCardioFitnessIntent();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t GetCardioFitnessIntentResponseCode.init(rawValue:)(uint64_t a1)
{
  switch(a1)
  {
    case 0:
      return 0;
    case 1:
      return 1;
    case 2:
      return 2;
    case 3:
      return 3;
    case 4:
      return 4;
    case 5:
      return 5;
    case 6:
      return 6;
    case 100:
      return 100;
    case 101:
      return 101;
    case 102:
      return 102;
    case 103:
      return 103;
  }
  return 0;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance GetCardioFitnessIntentResponseCode()
{
  return == infix<A>(_:_:)() & 1;
}

uint64_t protocol witness for Hashable.hashValue.getter in conformance GetCardioFitnessIntentResponseCode()
{
  return RawRepresentable<>.hashValue.getter();
}

uint64_t protocol witness for Hashable.hash(into:) in conformance GetCardioFitnessIntentResponseCode()
{
  return RawRepresentable<>.hash(into:)();
}

uint64_t protocol witness for Hashable._rawHashValue(seed:) in conformance GetCardioFitnessIntentResponseCode()
{
  return RawRepresentable<>._rawHashValue(seed:)();
}

uint64_t protocol witness for RawRepresentable.init(rawValue:) in conformance GetCardioFitnessIntentResponseCode@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = GetCardioFitnessIntentResponseCode.init(rawValue:)(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v3 & 1;
  return result;
}

void protocol witness for RawRepresentable.rawValue.getter in conformance GetCardioFitnessIntentResponseCode(void *a1@<X8>)
{
  GetCardioFitnessIntentResponseCode.rawValue.getter();
  *a1 = v1;
}

uint64_t GetCardioFitnessIntentResponse.code.getter()
{
  objc_super v2 = (uint64_t *)(v0 + OBJC_IVAR___GetCardioFitnessIntentResponse_code);
  swift_beginAccess();
  uint64_t v3 = *v2;
  swift_endAccess();
  return v3;
}

uint64_t GetCardioFitnessIntentResponse.code.setter(uint64_t a1)
{
  uint64_t v3 = (void *)(v1 + OBJC_IVAR___GetCardioFitnessIntentResponse_code);
  swift_beginAccess();
  *uint64_t v3 = a1;
  return swift_endAccess();
}

uint64_t (*GetCardioFitnessIntentResponse.code.modify())()
{
  return LogQuantityIntentResponse.code.modify;
}

void key path getter for GetCardioFitnessIntentResponse.code : GetCardioFitnessIntentResponse(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v3 = *a1;
  id v2 = *a1;
  *a2 = GetCardioFitnessIntentResponse.code.getter();
}

void key path setter for GetCardioFitnessIntentResponse.code : GetCardioFitnessIntentResponse(uint64_t *a1, id *a2)
{
  uint64_t v4 = *a1;
  id v3 = *a2;
  id v2 = *a2;
  GetCardioFitnessIntentResponse.code.setter(v4);
}

char *GetCardioFitnessIntentResponse.__allocating_init(code:userActivity:)(uint64_t a1, void *a2)
{
  id v3 = objc_allocWithZone(v2);
  return GetCardioFitnessIntentResponse.init(code:userActivity:)(a1, a2);
}

char *GetCardioFitnessIntentResponse.init(code:userActivity:)(uint64_t a1, void *a2)
{
  Class v9 = (char *)objc_msgSend(v10, sel_init);
  id v2 = v9;
  id v3 = v9;
  uint64_t v4 = v9;
  id v6 = &v9[OBJC_IVAR___GetCardioFitnessIntentResponse_code];
  swift_beginAccess();
  *(void *)id v6 = a1;
  swift_endAccess();

  objc_msgSend(v9, sel_setUserActivity_, a2);
  return v9;
}

id GetCardioFitnessIntentResponse.__allocating_init()()
{
  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id GetCardioFitnessIntentResponse.init()()
{
  uint64_t v1 = v0;
  id v6 = v0;
  *(void *)&v0[OBJC_IVAR___GetCardioFitnessIntentResponse_code] = 0;

  v5.receiver = v6;
  v5.super_class = (Class)type metadata accessor for GetCardioFitnessIntentResponse();
  id v4 = objc_msgSendSuper2(&v5, sel_init);
  id v2 = v4;
  id v6 = v4;

  return v4;
}

uint64_t type metadata accessor for GetCardioFitnessIntentResponse()
{
  return self;
}

id GetCardioFitnessIntentResponse.__allocating_init(coder:)(void *a1)
{
  id v4 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v4;
}

id GetCardioFitnessIntentResponse.init(coder:)(void *a1)
{
  Class v9 = a1;
  id v2 = v1;
  id v10 = v1;
  *(void *)&v1[OBJC_IVAR___GetCardioFitnessIntentResponse_code] = 0;

  v8.receiver = v10;
  v8.super_class = (Class)type metadata accessor for GetCardioFitnessIntentResponse();
  id v7 = objc_msgSendSuper2(&v8, sel_initWithCoder_, a1);
  if (v7)
  {
    id v3 = v7;
    id v10 = v7;

    return v7;
  }
  else
  {

    return 0;
  }
}

id GetCardioFitnessIntentResponse.__allocating_init(backingStore:)(void *a1)
{
  id v4 = objc_msgSend(objc_allocWithZone(v1), sel_initWithBackingStore_, a1);

  return v4;
}

id GetCardioFitnessIntentResponse.init(backingStore:)(void *a1)
{
  Class v9 = a1;
  id v2 = v1;
  id v10 = v1;
  *(void *)&v1[OBJC_IVAR___GetCardioFitnessIntentResponse_code] = 0;

  v8.receiver = v10;
  v8.super_class = (Class)type metadata accessor for GetCardioFitnessIntentResponse();
  id v7 = objc_msgSendSuper2(&v8, sel_initWithBackingStore_, a1);
  if (v7)
  {
    id v3 = v7;
    id v10 = v7;

    return v7;
  }
  else
  {

    return 0;
  }
}

id GetCardioFitnessIntentResponse.__allocating_init(propertiesByName:)(uint64_t a1)
{
  id v8 = objc_allocWithZone(v1);
  if (a1)
  {
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    id v2 = objc_msgSend(v8, sel_initWithPropertiesByName_, isa);
  }
  else
  {
    id v2 = objc_msgSend(v8, sel_initWithPropertiesByName_, 0);
  }
  id v5 = v2;

  return v5;
}

id GetCardioFitnessIntentResponse.init(propertiesByName:)(uint64_t a1)
{
  uint64_t v11 = a1;
  id v2 = v1;
  id v12 = v1;
  *(void *)&v1[OBJC_IVAR___GetCardioFitnessIntentResponse_code] = 0;

  swift_bridgeObjectRetain();
  if (a1)
  {
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    Class v8 = isa;
  }
  else
  {
    Class v8 = 0;
  }
  v10.receiver = v12;
  v10.super_class = (Class)type metadata accessor for GetCardioFitnessIntentResponse();
  id v6 = objc_msgSendSuper2(&v10, sel_initWithPropertiesByName_, v8);

  if (v6)
  {
    id v3 = v6;
    id v12 = v6;
    swift_bridgeObjectRelease();

    return v6;
  }
  else
  {

    swift_bridgeObjectRelease();
    return 0;
  }
}

id GetCardioFitnessIntentResponse.__deallocating_deinit()
{
  id v3 = v0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for GetCardioFitnessIntentResponse();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t base witness table accessor for Equatable in GetCardioFitnessIntentResponseCode()
{
  return lazy protocol witness table accessor for type GetCardioFitnessIntentResponseCode and conformance GetCardioFitnessIntentResponseCode();
}

unint64_t lazy protocol witness table accessor for type GetCardioFitnessIntentResponseCode and conformance GetCardioFitnessIntentResponseCode()
{
  uint64_t v2 = lazy protocol witness table cache variable for type GetCardioFitnessIntentResponseCode and conformance GetCardioFitnessIntentResponseCode;
  if (!lazy protocol witness table cache variable for type GetCardioFitnessIntentResponseCode and conformance GetCardioFitnessIntentResponseCode)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type GetCardioFitnessIntentResponseCode and conformance GetCardioFitnessIntentResponseCode);
    return WitnessTable;
  }
  return v2;
}

{
  unint64_t WitnessTable;
  uint64_t v2;

  uint64_t v2 = lazy protocol witness table cache variable for type GetCardioFitnessIntentResponseCode and conformance GetCardioFitnessIntentResponseCode;
  if (!lazy protocol witness table cache variable for type GetCardioFitnessIntentResponseCode and conformance GetCardioFitnessIntentResponseCode)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type GetCardioFitnessIntentResponseCode and conformance GetCardioFitnessIntentResponseCode);
    return WitnessTable;
  }
  return v2;
}

void sub_25DF02214(id *a1@<X0>, uint64_t *a2@<X8>)
{
}

void sub_25DF0222C(uint64_t *a1, id *a2)
{
}

ValueMetadata *type metadata accessor for GetCardioFitnessIntentResponseCode()
{
  return &type metadata for GetCardioFitnessIntentResponseCode;
}

SiriWellnessIntents::WellnessConfirmation_optional __swiftcall WellnessConfirmation.init(rawValue:)(Swift::String rawValue)
{
  uint64_t v1 = _allocateUninitializedArray<A>(_:)();
  *(void *)uint64_t v2 = "yes";
  *(void *)(v2 + 8) = 3;
  *(unsigned char *)(v2 + 16) = 2;
  *(void *)(v2 + 24) = "no";
  *(void *)(v2 + 32) = 2;
  *(unsigned char *)(v2 + 40) = 2;
  *(void *)(v2 + 48) = "cancel";
  *(void *)(v2 + 56) = 6;
  *(unsigned char *)(v2 + 64) = 2;
  _finalizeUninitializedArray<A>(_:)();
  Swift::Int v6 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)v1, rawValue);
  swift_bridgeObjectRelease();
  switch(v6)
  {
    case 0:
      v7.value = SiriWellnessIntents_WellnessConfirmation_yes;
LABEL_8:
      swift_bridgeObjectRelease();
      return v7;
    case 1:
      v7.value = SiriWellnessIntents_WellnessConfirmation_no;
      goto LABEL_8;
    case 2:
      v7.value = SiriWellnessIntents_WellnessConfirmation_cancel;
      goto LABEL_8;
  }
  swift_bridgeObjectRelease();
  return (SiriWellnessIntents::WellnessConfirmation_optional)3;
}

uint64_t WellnessConfirmation.rawValue.getter(char a1)
{
  if (!a1) {
    return String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("yes", 3uLL, 1)._countAndFlagsBits;
  }
  if (a1 == 1) {
    return String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("no", 2uLL, 1)._countAndFlagsBits;
  }
  else {
    return String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("cancel", 6uLL, 1)._countAndFlagsBits;
  }
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance WellnessConfirmation()
{
  return == infix<A>(_:_:)() & 1;
}

unint64_t base witness table accessor for Equatable in WellnessConfirmation()
{
  return lazy protocol witness table accessor for type WellnessConfirmation and conformance WellnessConfirmation();
}

unint64_t lazy protocol witness table accessor for type WellnessConfirmation and conformance WellnessConfirmation()
{
  uint64_t v2 = lazy protocol witness table cache variable for type WellnessConfirmation and conformance WellnessConfirmation;
  if (!lazy protocol witness table cache variable for type WellnessConfirmation and conformance WellnessConfirmation)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type WellnessConfirmation and conformance WellnessConfirmation);
    return WitnessTable;
  }
  return v2;
}

{
  unint64_t WitnessTable;
  uint64_t v2;

  uint64_t v2 = lazy protocol witness table cache variable for type WellnessConfirmation and conformance WellnessConfirmation;
  if (!lazy protocol witness table cache variable for type WellnessConfirmation and conformance WellnessConfirmation)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type WellnessConfirmation and conformance WellnessConfirmation);
    return WitnessTable;
  }
  return v2;
}

uint64_t protocol witness for Hashable.hashValue.getter in conformance WellnessConfirmation()
{
  return RawRepresentable<>.hashValue.getter();
}

uint64_t protocol witness for Hashable.hash(into:) in conformance WellnessConfirmation()
{
  return RawRepresentable<>.hash(into:)();
}

uint64_t protocol witness for Hashable._rawHashValue(seed:) in conformance WellnessConfirmation()
{
  return RawRepresentable<>._rawHashValue(seed:)();
}

SiriWellnessIntents::WellnessConfirmation_optional protocol witness for RawRepresentable.init(rawValue:) in conformance WellnessConfirmation@<W0>(Swift::String *a1@<X0>, SiriWellnessIntents::WellnessConfirmation_optional *a2@<X8>)
{
  result.value = WellnessConfirmation.init(rawValue:)(*a1).value;
  a2->value = result.value;
  return result;
}

uint64_t protocol witness for RawRepresentable.rawValue.getter in conformance WellnessConfirmation@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = WellnessConfirmation.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t getEnumTagSinglePayload for WellnessConfirmation(unsigned __int8 *a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 <= 0xFD) {
      goto LABEL_15;
    }
    unsigned int v7 = ((a2 + 2) >> 8) + 1;
    int v8 = 1;
    if (v7 >= 0x100)
    {
      if (v7 >= 0x10000) {
        int v2 = 4;
      }
      else {
        int v2 = 2;
      }
      int v8 = v2;
    }
    if (v8 == 1) {
      int v6 = a1[1];
    }
    else {
      int v6 = v8 == 2 ? *(unsigned __int16 *)(a1 + 1) : *(_DWORD *)(a1 + 1);
    }
    if (v6)
    {
      int v5 = (*a1 | ((v6 - 1) << 8)) + 253;
    }
    else
    {
LABEL_15:
      int v3 = *a1 - 3;
      if (v3 < 0) {
        int v3 = -1;
      }
      int v5 = v3;
    }
  }
  else
  {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for WellnessConfirmation(unsigned char *result, unsigned int a2, unsigned int a3)
{
  int v7 = 0;
  if (a3 > 0xFD)
  {
    unsigned int v5 = ((a3 + 2) >> 8) + 1;
    int v6 = 1;
    if (v5 >= 0x100)
    {
      if (v5 >= 0x10000) {
        int v3 = 4;
      }
      else {
        int v3 = 2;
      }
      int v6 = v3;
    }
    int v7 = v6;
  }
  if (a2 > 0xFD)
  {
    unsigned int v4 = ((a2 - 254) >> 8) + 1;
    *uint64_t result = a2 + 2;
    if (v7)
    {
      if (v7 == 1)
      {
        result[1] = v4;
      }
      else if (v7 == 2)
      {
        *(_WORD *)(result + 1) = v4;
      }
      else
      {
        *(_DWORD *)(result + 1) = v4;
      }
    }
  }
  else
  {
    if (v7)
    {
      if (v7 == 1)
      {
        result[1] = 0;
      }
      else if (v7 == 2)
      {
        *(_WORD *)(result + 1) = 0;
      }
      else
      {
        *(_DWORD *)(result + 1) = 0;
      }
    }
    if (a2) {
      *uint64_t result = a2 + 2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for WellnessConfirmation()
{
  return &type metadata for WellnessConfirmation;
}

Swift::tuple_Double_Double __swiftcall minMaxForSample(sample:unit:oMin:oMax:)(HKSample sample, HKUnit unit, Swift::Double oMin, Swift::Double oMax)
{
  unsigned int v4 = sample.super.super.isa;
  self;
  uint64_t v19 = swift_dynamicCastObjCClass();
  if (v19)
  {
    uint64_t v14 = (void *)v19;
  }
  else
  {

    uint64_t v14 = 0;
  }
  if (v14)
  {
    id v12 = objc_msgSend(v14, sel_quantity);
    objc_msgSend(v12, sel_doubleValueForUnit_, unit.super.isa);
    double v13 = v5;

    if (oMin == 0.0)
    {
      double v11 = v13;
    }
    else
    {
      min<A>(_:_:)();
      double v11 = v21;
    }
    max<A>(_:_:)();

    Swift::Double v9 = v11;
    Swift::Double v10 = v20;
  }
  else
  {
    Swift::Double v9 = oMin;
    Swift::Double v10 = oMax;
  }
  double v6 = v9;
  double v7 = v10;
  result._1 = v7;
  result._0 = v6;
  return result;
}

void conjugate<A>(for:units:target:minKey:maxKey:valueKey:accumulator:)(void *a1, uint64_t a2, void *a3)
{
  id v4 = objc_msgSend(a1, sel_objectsForType_, 0);
  type metadata accessor for HKSample();
  lazy protocol witness table accessor for type HKSample and conformance NSObject();
  static Set._unconditionallyBridgeFromObjectiveC(_:)();
  swift_bridgeObjectRetain();
  id v3 = a3;
  swift_retain();
  swift_retain();
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Set<HKSample>);
  lazy protocol witness table accessor for type Set<HKSample> and conformance Set<A>();
  Sequence.forEach(_:)();
  swift_bridgeObjectRelease();

  swift_release();
  swift_release();
  swift_release();
  outlined destroy of [HKQuantityType]();
}

void closure #1 in conjugate<A>(for:units:target:minKey:maxKey:valueKey:accumulator:)(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7)
{
  uint64_t v60 = a2;
  id v46 = a3;
  uint64_t v47 = a4;
  v48 = a5;
  uint64_t v49 = a6;
  uint64_t v50 = a7;
  Class isa = 0;
  uint64_t v79 = 0;
  uint64_t v78 = 0;
  uint64_t v77 = 0;
  uint64_t v76 = 0;
  uint64_t v75 = 0;
  uint64_t v74 = 0;
  v71 = 0;
  Swift::tuple_Double_Double v68 = (Swift::tuple_Double_Double)0;
  uint64_t v65 = 0;
  id v64 = 0;
  uint64_t v63 = 0;
  uint64_t v51 = *(void *)(*a5 + *MEMORY[0x263F8DE50]);
  uint64_t v81 = v51;
  v52 = *(void **)(v51 - 8);
  uint64_t v53 = v51 - 8;
  uint64_t v55 = v52[8];
  unint64_t v54 = (v55 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](a2);
  v56 = (char *)&v20 - v54;
  unint64_t v57 = v54;
  MEMORY[0x270FA5388](v7);
  v58 = (char *)&v20 - v57;
  v59.super.super.Class isa = *v8;
  Class isa = v59.super.super.isa;
  uint64_t v79 = v9;
  uint64_t v78 = v10;
  uint64_t v77 = v11;
  uint64_t v76 = v12;
  uint64_t v75 = v13;
  uint64_t v74 = v14;
  swift_bridgeObjectRetain();
  if (v60)
  {
    uint64_t v45 = v60;
    uint64_t v42 = v60;
    id v15 = v46;
    v41 = &v61;
    id v61 = v46;
    uint64_t v38 = 0;
    unint64_t v39 = type metadata accessor for HKQuantityType();
    unint64_t v40 = type metadata accessor for HKUnit();
    unint64_t v16 = lazy protocol witness table accessor for type HKQuantityType and conformance NSObject();
    MEMORY[0x2611C8800](v62, v41, v42, v39, v40, v16);

    v43 = (objc_class *)v62[0];
    swift_bridgeObjectRelease();
    v44 = v43;
  }
  else
  {
    v44 = 0;
  }
  v72 = v44;
  if (v44)
  {
    v73 = v72;
  }
  else
  {
    v73 = (objc_class *)objc_msgSend(self, sel_millimeterOfMercuryUnit);
    outlined destroy of HealthKitPersistor((id *)&v72);
  }
  v33.super.Class isa = v73;
  v71 = v73;
  swift_retain();
  v32 = (void (*)(char *, uint64_t, uint64_t))v52[2];
  v31 = v52 + 2;
  v32(v58, v47, v51);
  swift_getAtKeyPath();
  Swift::Double v34 = v70;
  swift_retain();
  v32(v56, v47, v51);
  swift_getAtKeyPath();
  Swift::tuple_Double_Double v37 = minMaxForSample(sample:unit:oMin:oMax:)(v59, v33, v34, v69);
  v36 = (void (*)(char *, uint64_t))v52[1];
  v35 = v52 + 1;
  v36(v56, v51);
  swift_release();
  v36(v58, v51);
  swift_release();
  Swift::tuple_Double_Double v68 = v37;
  swift_retain();
  Swift::Double v67 = v37._0;
  swift_setAtWritableKeyPath();
  swift_release();
  swift_retain();
  Swift::Double v66 = v37._1;
  swift_setAtWritableKeyPath();
  swift_release();
  swift_retain();
  if (v50)
  {
    uint64_t v30 = v50;
    uint64_t v28 = v50;
    uint64_t v65 = v50;
    objc_super v17 = v59.super.super.isa;
    self;
    uint64_t v18 = swift_dynamicCastObjCClass();
    v29 = (void *)v18;
    if (v18)
    {
      v27 = v29;
    }
    else
    {
      v26 = 0;

      v27 = v26;
    }
    id v25 = v27;
    if (v27)
    {
      id v24 = v25;
      id v23 = v25;
      id v64 = v25;
      id v21 = objc_msgSend(v25, sel_quantity);
      objc_msgSend(v21, sel_doubleValueForUnit_, v33.super.isa);
      uint64_t v22 = v19;

      uint64_t v63 = v22;
      swift_retain();
      v62[1] = v22;
      swift_setAtWritableKeyPath();
      swift_release();
    }
    swift_release();
  }
}

void partial apply for closure #1 in conjugate<A>(for:units:target:minKey:maxKey:valueKey:accumulator:)(uint64_t a1)
{
  closure #1 in conjugate<A>(for:units:target:minKey:maxKey:valueKey:accumulator:)(a1, *(void *)(v1 + 16), *(void **)(v1 + 24), *(void *)(v1 + 32), *(void **)(v1 + 40), *(void *)(v1 + 48), *(void *)(v1 + 56));
}

id GetBloodPressureIntentHandler.__allocating_init(provider:)(uint64_t a1)
{
  id v2 = objc_allocWithZone(v1);
  return GetBloodPressureIntentHandler.init(provider:)(a1);
}

id GetBloodPressureIntentHandler.init(provider:)(uint64_t a1)
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v12 = a1;
  id v2 = v1;
  id v3 = v1;
  id v13 = v1;
  OSSignposter.init()();

  outlined init with copy of QuantityPersisting(a1, (uint64_t)v11);
  outlined init with take of QuantityPersisting(v11, &v1[OBJC_IVAR____TtC19SiriWellnessIntents29GetBloodPressureIntentHandler_provider]);

  v10.receiver = v13;
  v10.super_class = ObjectType;
  id v9 = objc_msgSendSuper2(&v10, sel_init);
  id v4 = v9;
  id v13 = v9;
  __swift_destroy_boxed_opaque_existential_1(a1);

  return v9;
}

uint64_t GetBloodPressureIntentHandler.handle(intent:)(uint64_t a1)
{
  v2[73] = v1;
  v2[72] = a1;
  v2[32] = v2;
  v2[33] = 0;
  v2[34] = 0;
  v2[35] = 0;
  v2[41] = 0;
  v2[47] = 0;
  v2[53] = 0;
  v2[54] = 0;
  v2[57] = 0;
  v2[58] = 0;
  v2[60] = 0;
  uint64_t v3 = type metadata accessor for Logger();
  v2[74] = v3;
  v2[75] = *(void *)(v3 - 8);
  v2[76] = swift_task_alloc();
  v2[77] = swift_task_alloc();
  v2[78] = swift_task_alloc();
  v2[79] = swift_task_alloc();
  uint64_t v4 = type metadata accessor for OSSignposter();
  v2[80] = v4;
  v2[81] = *(void *)(v4 - 8);
  v2[82] = swift_task_alloc();
  v2[83] = swift_task_alloc();
  v2[84] = swift_task_alloc();
  uint64_t v5 = type metadata accessor for OSSignpostID();
  v2[85] = v5;
  v2[86] = *(void *)(v5 - 8);
  v2[87] = swift_task_alloc();
  v2[88] = swift_task_alloc();
  v2[89] = swift_task_alloc();
  v2[90] = swift_task_alloc();
  v2[91] = swift_task_alloc();
  v2[33] = a1;
  v2[34] = v1;
  return MEMORY[0x270FA2498](GetBloodPressureIntentHandler.handle(intent:), 0);
}

void GetBloodPressureIntentHandler.handle(intent:)()
{
  uint64_t v45 = v0;
  uint64_t v37 = v0[84];
  uint64_t v35 = v0[83];
  uint64_t v36 = v0[81];
  uint64_t v40 = v0[80];
  uint64_t v39 = v0[73];
  v0[32] = v0;
  uint64_t v1 = OBJC_IVAR____TtC19SiriWellnessIntents29GetBloodPressureIntentHandler_signposter;
  v41 = *(void (**)(uint64_t, uint64_t))(v36 + 16);
  v0[92] = v41;
  v0[93] = (v36 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  v41(v37, v39 + v1);
  OSSignposter.makeSignpostID()();
  id v2 = *(void (**)(uint64_t, uint64_t))(v36 + 8);
  uint64_t v38 = v2;
  v0[94] = v2;
  v0[95] = (v36 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v2(v37, v40);
  ((void (*)(uint64_t, uint64_t, uint64_t))v41)(v35, v39 + OBJC_IVAR____TtC19SiriWellnessIntents29GetBloodPressureIntentHandler_signposter, v40);
  uint64_t v42 = OSSignposter.logHandle.getter();
  os_signpost_type_t v43 = static os_signpost_type_t.begin.getter();
  if (OS_os_log.signpostsEnabled.getter())
  {
    v44[1] = (uint64_t)"GBPIHandle";
    if (!"GBPIHandle")
    {
      _assertionFailure(_:_:file:line:flags:)();
      return;
    }
    uint64_t v24 = *(void *)(v34 + 728);
    uint64_t v26 = *(void *)(v34 + 720);
    uint64_t v25 = *(void *)(v34 + 680);
    uint64_t v23 = *(void *)(v34 + 688);
    closure #1 in _globalStringTablePointerOfStaticString(_:)((uint64_t)"GBPIHandle", v44);
    uint64_t v22 = (const char *)v44[0];
    v44[2] = (uint64_t)"";
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
    uint64_t v32 = _allocateUninitializedArray<A>(_:)();
    uint64_t v3 = v42;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v23 + 16))(v26, v24, v25);
    *(void *)(v34 + 536) = 2;
    lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    lazy protocol witness table accessor for type Int and conformance Int();
    UnsignedInteger<>.init<A>(_:)();
    uint32_t v27 = *(_DWORD *)(v34 + 956);
    v29 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
    uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    uint64_t v30 = createStorage<A>(capacity:type:)(0);
    uint64_t v31 = createStorage<A>(capacity:type:)(0);
    *(void *)(v34 + 544) = v29;
    *(void *)(v34 + 552) = v30;
    *(void *)(v34 + 560) = v31;
    serialize(_:at:)(0, (unsigned char **)(v34 + 544));
    serialize(_:at:)(0, (unsigned char **)(v34 + 544));
    *(void *)(v34 + 568) = v32;
    HKUnit v33 = (void *)swift_task_alloc();
    v33[2] = v34 + 544;
    v33[3] = v34 + 552;
    v33[4] = v34 + 560;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
    lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
    Sequence.forEach(_:)();
    uint64_t v21 = *(void *)(v34 + 720);
    swift_task_dealloc();
    closure #1 in osSignpostWithoutMessage(log:name:id:type:state:formatString:)(v29, v27, v42, v43, v21, v22, "");
    uint64_t v19 = *(void *)(v34 + 720);
    uint64_t v20 = *(void *)(v34 + 680);
    uint64_t v18 = *(void *)(v34 + 688);
    destroyStorage<A>(_:count:)(v30, 0, v28);
    destroyStorage<A>(_:count:)(v31, 0, MEMORY[0x263F8EE58] + 8);
    MEMORY[0x2611C8D90](v29, MEMORY[0x263F8E778]);

    (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v19, v20);
    swift_bridgeObjectRelease();
  }
  *(void *)(v34 + 768) = 0;
  uint64_t v8 = *(void *)(v34 + 728);
  uint64_t v9 = *(void *)(v34 + 712);
  uint64_t v7 = *(void *)(v34 + 680);
  uint64_t v11 = *(void *)(v34 + 664);
  uint64_t v10 = *(void *)(v34 + 640);
  uint64_t v13 = *(void *)(v34 + 584);
  uint64_t v6 = *(void *)(v34 + 688);

  type metadata accessor for OSSignpostIntervalState();
  uint64_t v4 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16);
  *(void *)(v34 + 776) = v4;
  *(void *)(v34 + 784) = (v6 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  v4(v9, v8, v7);
  _swift_stdlib_has_malloc_size();
  uint64_t v12 = OSSignpostIntervalState.__allocating_init(id:isOpen:)();
  *(void *)(v34 + 792) = v12;
  v38(v11, v10);
  *(void *)(v34 + 280) = v12;
  outlined init with copy of QuantityPersisting(v13 + OBJC_IVAR____TtC19SiriWellnessIntents29GetBloodPressureIntentHandler_provider, v34 + 80);
  uint64_t v17 = *(void *)(v34 + 104);
  uint64_t v14 = *(void *)(v34 + 112);
  __swift_project_boxed_opaque_existential_1((void *)(v34 + 80), v17);
  uint64_t v15 = *(void *)(v14 + 8);
  unint64_t v16 = (void (*)(uint64_t, uint64_t))(*(void *)(v15 + 8) + **(int **)(v15 + 8));
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v34 + 800) = v5;
  *uint64_t v5 = *(void *)(v34 + 256);
  v5[1] = GetBloodPressureIntentHandler.handle(intent:);
  v16(v17, v15);
}

{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(char *);
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint8_t *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint32_t v34;
  os_log_type_t v35;
  NSObject *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char *v46;
  uint64_t v47;
  uint8_t *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint32_t v55;
  os_log_type_t v56;
  NSObject *log;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  id v62;
  id v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  char *v69;
  char *v70;
  uint64_t v71;
  uint8_t *buf;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint32_t size;
  os_log_type_t v80;
  NSObject *oslog;
  uint64_t v82;
  void *v83;
  uint64_t v84;
  Class v85;
  uint64_t v86;
  id v87;
  id v88;
  id v89;
  id v90;
  id v91;
  id v92;
  uint64_t v93;
  uint64_t v94;
  void (*v95)(uint64_t, uint64_t);
  id ObjCClassFromMetadata;
  id v97;
  id v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  const char *v104;
  uint64_t v105;
  uint64_t v106;
  void (*v107)(uint64_t, uint64_t, uint64_t);
  uint64_t v108;
  uint32_t v109;
  uint64_t v110;
  uint8_t *v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  void *v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  void (*v119)(uint64_t, uint64_t, uint64_t, NSUInteger);
  Class isa;
  NSObject *v121;
  os_signpost_type_t v122;
  uint64_t v123;
  char v124;
  uint64_t v125[7];
  uint64_t v126;
  uint64_t v127;
  NSDateFormatter v128;

  v126 = v0;
  v124 = *(unsigned char *)(v0 + 960);
  *(void *)(v0 + 256) = v0;
  __swift_destroy_boxed_opaque_existential_1(v0 + 80);
  if ((v124 & 1) == 0)
  {
    uint64_t v14 = *(void *)(v123 + 616);
    HKUnit v33 = *(void *)(v123 + 592);
    uint64_t v31 = *(void *)(v123 + 600);
    uint64_t v32 = Logger.wellness.unsafeMutableAddressor();
    swift_beginAccess();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v31 + 16))(v14, v32, v33);
    swift_endAccess();
    uint64_t v36 = Logger.logObject.getter();
    uint64_t v35 = static os_log_type_t.debug.getter();
    *(void *)(v123 + 288) = 2;
    lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    lazy protocol witness table accessor for type Int and conformance Int();
    UnsignedInteger<>.init<A>(_:)();
    uint64_t v34 = *(_DWORD *)(v123 + 936);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
    uint64_t v37 = _allocateUninitializedArray<A>(_:)();
    if (os_log_type_enabled(v36, v35))
    {
      uint64_t v15 = *(void *)(v123 + 768);
      uint32_t v27 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
      uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      uint64_t v28 = createStorage<A>(capacity:type:)(0);
      v29 = createStorage<A>(capacity:type:)(0);
      *(void *)(v123 + 296) = v27;
      *(void *)(v123 + 304) = v28;
      *(void *)(v123 + 312) = v29;
      serialize(_:at:)(0, (unsigned char **)(v123 + 296));
      serialize(_:at:)(0, (unsigned char **)(v123 + 296));
      *(void *)(v123 + 320) = v37;
      uint64_t v30 = (void *)swift_task_alloc();
      v30[2] = v123 + 296;
      v30[3] = v123 + 304;
      v30[4] = v123 + 312;
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
      lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
      Sequence.forEach(_:)();
      if (v15) {
        return;
      }
      swift_task_dealloc();
      _os_log_impl(&dword_25DE00000, v36, v35, "request requires Authorization", v27, v34);
      destroyStorage<A>(_:count:)(v28, 0, v26);
      destroyStorage<A>(_:count:)(v29, 0, MEMORY[0x263F8EE58] + 8);
      MEMORY[0x2611C8D90](v27, MEMORY[0x263F8E778]);
      swift_bridgeObjectRelease();
    }
    else
    {
      swift_bridgeObjectRelease();
    }
    uint64_t v21 = *(void *)(v123 + 792);
    uint64_t v23 = *(void *)(v123 + 728);
    uint64_t v24 = *(void *)(v123 + 680);
    uint64_t v18 = *(void *)(v123 + 616);
    uint64_t v19 = *(void *)(v123 + 592);
    uint64_t v20 = *(void *)(v123 + 584);
    uint64_t v22 = *(void *)(v123 + 688);
    uint64_t v17 = *(void *)(v123 + 600);

    (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v18, v19);
    type metadata accessor for GetBloodPressureIntentResponse();
    uint64_t v25 = GetBloodPressureIntentResponse.__allocating_init(code:userActivity:)(101, 0);
    $defer #1 () in GetBloodPressureIntentHandler.handle(intent:)(v20, v21);
    swift_release();
    (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v23, v24);
    Swift::Double v70 = v25;
LABEL_37:
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    unint64_t v16 = *(void (**)(char *))(*(void *)(v123 + 256) + 8);
    v16(v70);
    return;
  }
  v119 = *(void (**)(uint64_t, uint64_t, uint64_t, NSUInteger))(v123 + 736);
  v116 = *(void *)(v123 + 656);
  v118 = *(void *)(v123 + 640);
  v117 = *(void *)(v123 + 584);
  type metadata accessor for HKHealthStore();
  v128 = NSDateFormatter.__allocating_init()();
  Class isa = v128.super.super.isa;
  *(void *)(v123 + 808) = v128.super.super.isa;
  *(void *)(v123 + 328) = v128.super.super.isa;
  v119(v116, v117 + OBJC_IVAR____TtC19SiriWellnessIntents29GetBloodPressureIntentHandler_signposter, v118, v128._counter);
  v121 = OSSignposter.logHandle.getter();
  v122 = static os_signpost_type_t.event.getter();
  if ((OS_os_log.signpostsEnabled.getter() & 1) == 0)
  {
    v103 = *(void *)(v123 + 768);
LABEL_8:
    *(void *)(v123 + 816) = v103;
    v95 = *(void (**)(uint64_t, uint64_t))(v123 + 752);
    v93 = *(void *)(v123 + 656);
    v94 = *(void *)(v123 + 640);

    v95(v93, v94);
    type metadata accessor for HKCorrelationType();
    ObjCClassFromMetadata = (id)swift_getObjCClassFromMetadata();
    v97 = (id)*MEMORY[0x263F094C0];
    uint64_t v3 = (id)*MEMORY[0x263F094C0];
    uint64_t v4 = objc_msgSend(ObjCClassFromMetadata, sel_correlationTypeForIdentifier_, v97);
    *(void *)(v123 + 824) = v4;
    v98 = v4;

    if (v98)
    {
      *(void *)(v123 + 376) = v98;
      v90 = self;
      v91 = (id)*MEMORY[0x263F09C28];
      uint64_t v5 = (id)*MEMORY[0x263F09C28];
      uint64_t v6 = objc_msgSend(v90, sel_quantityTypeForIdentifier_, v91);
      *(void *)(v123 + 832) = v6;
      v92 = v6;

      if (v92)
      {
        *(void *)(v123 + 424) = v92;
        v87 = self;
        v88 = (id)*MEMORY[0x263F09C20];
        uint64_t v7 = (id)*MEMORY[0x263F09C20];
        uint64_t v8 = objc_msgSend(v87, sel_quantityTypeForIdentifier_, v88);
        *(void *)(v123 + 840) = v8;
        v89 = v8;

        if (v89)
        {
          *(void *)(v123 + 432) = v89;
          type metadata accessor for HKQuantityType();
          v84 = _allocateUninitializedArray<A>(_:)();
          v83 = v9;
          uint64_t v10 = v92;
          *v83 = v92;
          uint64_t v11 = v89;
          v83[1] = v89;
          _finalizeUninitializedArray<A>(_:)();
          *(void *)(v123 + 448) = v84;
          __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [HKQuantityType]);
          lazy protocol witness table accessor for type HKQuantityType and conformance NSObject();
          lazy protocol witness table accessor for type [HKQuantityType] and conformance [A]();
          Set.init<A>(_:)();
          v85 = Set._bridgeToObjectiveC()().super.isa;
          *(void *)(v123 + 848) = v85;
          swift_bridgeObjectRelease();
          *(void *)(v123 + 16) = *(void *)(v123 + 256);
          *(void *)(v123 + 56) = v123 + 440;
          *(void *)(v123 + 24) = GetBloodPressureIntentHandler.handle(intent:);
          *(void *)(v123 + 152) = swift_continuation_init();
          *(void *)(v123 + 120) = MEMORY[0x263EF8330];
          *(_DWORD *)(v123 + 128) = 0x40000000;
          *(_DWORD *)(v123 + 132) = 0;
          *(void *)(v123 + 136) = @objc completion handler block implementation for @escaping @callee_unowned @convention(block) (@unowned NSDictionary, @unowned NSError?) -> () with result type [HKQuantityType : HKUnit];
          *(void *)(v123 + 144) = &block_descriptor_5;
          -[objc_class preferredUnitsForQuantityTypes:completion:](isa, sel_preferredUnitsForQuantityTypes_completion_, v85);
          __swift_continuation_await_point();
          return;
        }

        v86 = v103;
      }
      else
      {
        v86 = v103;
      }
      uint64_t v12 = *(void *)(v123 + 632);
      uint64_t v78 = *(void *)(v123 + 592);
      uint64_t v76 = *(void *)(v123 + 600);
      uint64_t v77 = Logger.wellness.unsafeMutableAddressor();
      swift_beginAccess();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v76 + 16))(v12, v77, v78);
      swift_endAccess();
      oslog = Logger.logObject.getter();
      v80 = static os_log_type_t.error.getter();
      *(void *)(v123 + 384) = 2;
      lazy protocol witness table accessor for type UInt32 and conformance UInt32();
      lazy protocol witness table accessor for type UInt32 and conformance UInt32();
      lazy protocol witness table accessor for type Int and conformance Int();
      UnsignedInteger<>.init<A>(_:)();
      size = *(_DWORD *)(v123 + 944);
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
      v82 = _allocateUninitializedArray<A>(_:)();
      if (os_log_type_enabled(oslog, v80))
      {
        buf = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
        v71 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
        v73 = createStorage<A>(capacity:type:)(0);
        uint64_t v74 = createStorage<A>(capacity:type:)(0);
        *(void *)(v123 + 392) = buf;
        *(void *)(v123 + 400) = v73;
        *(void *)(v123 + 408) = v74;
        serialize(_:at:)(0, (unsigned char **)(v123 + 392));
        serialize(_:at:)(0, (unsigned char **)(v123 + 392));
        *(void *)(v123 + 416) = v82;
        uint64_t v75 = (void *)swift_task_alloc();
        v75[2] = v123 + 392;
        v75[3] = v123 + 400;
        v75[4] = v123 + 408;
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
        lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
        Sequence.forEach(_:)();
        if (v86) {
          return;
        }
        swift_task_dealloc();
        _os_log_impl(&dword_25DE00000, oslog, v80, "failed to create quantity types sys/dia", buf, size);
        destroyStorage<A>(_:count:)(v73, 0, v71);
        destroyStorage<A>(_:count:)(v74, 0, MEMORY[0x263F8EE58] + 8);
        MEMORY[0x2611C8D90](buf, MEMORY[0x263F8E778]);
        swift_bridgeObjectRelease();
      }
      else
      {
        swift_bridgeObjectRelease();
      }
      uint64_t v63 = *(id *)(v123 + 808);
      uint64_t v65 = *(void *)(v123 + 792);
      Swift::Double v67 = *(void *)(v123 + 728);
      Swift::tuple_Double_Double v68 = *(void *)(v123 + 680);
      uint64_t v60 = *(void *)(v123 + 632);
      id v61 = *(void *)(v123 + 592);
      id v64 = *(void *)(v123 + 584);
      v62 = *(id *)(v123 + 824);
      Swift::Double v66 = *(void *)(v123 + 688);
      HKSample v59 = *(void *)(v123 + 600);

      (*(void (**)(uint64_t, uint64_t))(v59 + 8))(v60, v61);
      type metadata accessor for GetBloodPressureIntentResponse();
      Swift::Double v69 = GetBloodPressureIntentResponse.__allocating_init(code:userActivity:)(5, 0);

      $defer #1 () in GetBloodPressureIntentHandler.handle(intent:)(v64, v65);
      swift_release();
      (*(void (**)(uint64_t, uint64_t))(v66 + 8))(v67, v68);
      Swift::Double v70 = v69;
    }
    else
    {
      uint64_t v13 = *(void *)(v123 + 624);
      unint64_t v54 = *(void *)(v123 + 592);
      v52 = *(void *)(v123 + 600);
      uint64_t v53 = Logger.wellness.unsafeMutableAddressor();
      swift_beginAccess();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v52 + 16))(v13, v53, v54);
      swift_endAccess();
      log = Logger.logObject.getter();
      v56 = static os_log_type_t.error.getter();
      *(void *)(v123 + 336) = 2;
      lazy protocol witness table accessor for type UInt32 and conformance UInt32();
      lazy protocol witness table accessor for type UInt32 and conformance UInt32();
      lazy protocol witness table accessor for type Int and conformance Int();
      UnsignedInteger<>.init<A>(_:)();
      uint64_t v55 = *(_DWORD *)(v123 + 940);
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
      v58 = _allocateUninitializedArray<A>(_:)();
      if (os_log_type_enabled(log, v56))
      {
        v48 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
        uint64_t v47 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
        uint64_t v49 = createStorage<A>(capacity:type:)(0);
        uint64_t v50 = createStorage<A>(capacity:type:)(0);
        *(void *)(v123 + 344) = v48;
        *(void *)(v123 + 352) = v49;
        *(void *)(v123 + 360) = v50;
        serialize(_:at:)(0, (unsigned char **)(v123 + 344));
        serialize(_:at:)(0, (unsigned char **)(v123 + 344));
        *(void *)(v123 + 368) = v58;
        uint64_t v51 = (void *)swift_task_alloc();
        v51[2] = v123 + 344;
        v51[3] = v123 + 352;
        v51[4] = v123 + 360;
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
        lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
        Sequence.forEach(_:)();
        if (v103) {
          return;
        }
        swift_task_dealloc();
        _os_log_impl(&dword_25DE00000, log, v56, "failed to create correlation type for blood pressure", v48, v55);
        destroyStorage<A>(_:count:)(v49, 0, v47);
        destroyStorage<A>(_:count:)(v50, 0, MEMORY[0x263F8EE58] + 8);
        MEMORY[0x2611C8D90](v48, MEMORY[0x263F8E778]);
        swift_bridgeObjectRelease();
      }
      else
      {
        swift_bridgeObjectRelease();
      }
      uint64_t v42 = *(void *)(v123 + 792);
      v44 = *(void *)(v123 + 728);
      uint64_t v45 = *(void *)(v123 + 680);
      uint64_t v39 = *(void *)(v123 + 624);
      uint64_t v40 = *(void *)(v123 + 592);
      v41 = *(void *)(v123 + 584);
      os_signpost_type_t v43 = *(void *)(v123 + 688);
      uint64_t v38 = *(void *)(v123 + 600);

      (*(void (**)(uint64_t, uint64_t))(v38 + 8))(v39, v40);
      type metadata accessor for GetBloodPressureIntentResponse();
      uint64_t v46 = GetBloodPressureIntentResponse.__allocating_init(code:userActivity:)(5, 0);

      $defer #1 () in GetBloodPressureIntentHandler.handle(intent:)(v41, v42);
      swift_release();
      (*(void (**)(uint64_t, uint64_t))(v43 + 8))(v44, v45);
      Swift::Double v70 = v46;
    }
    goto LABEL_37;
  }
  v125[1] = (uint64_t)"HKStore initialized";
  if (!"HKStore initialized")
  {
    _assertionFailure(_:_:file:line:flags:)();
    return;
  }
  v107 = *(void (**)(uint64_t, uint64_t, uint64_t))(v123 + 776);
  uint64_t v1 = *(void *)(v123 + 768);
  v105 = *(void *)(v123 + 728);
  v108 = *(void *)(v123 + 704);
  v106 = *(void *)(v123 + 680);
  closure #1 in _globalStringTablePointerOfStaticString(_:)((uint64_t)"HKStore initialized", v125);
  v104 = (const char *)v125[0];
  v125[2] = (uint64_t)"";
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
  v114 = _allocateUninitializedArray<A>(_:)();
  id v2 = v121;
  v107(v108, v105, v106);
  *(void *)(v123 + 496) = 2;
  lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  lazy protocol witness table accessor for type Int and conformance Int();
  UnsignedInteger<>.init<A>(_:)();
  v109 = *(_DWORD *)(v123 + 952);
  v111 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
  v110 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
  v112 = createStorage<A>(capacity:type:)(0);
  v113 = createStorage<A>(capacity:type:)(0);
  *(void *)(v123 + 504) = v111;
  *(void *)(v123 + 512) = v112;
  *(void *)(v123 + 520) = v113;
  serialize(_:at:)(0, (unsigned char **)(v123 + 504));
  serialize(_:at:)(0, (unsigned char **)(v123 + 504));
  *(void *)(v123 + 528) = v114;
  v115 = (void *)swift_task_alloc();
  v115[2] = v123 + 504;
  v115[3] = v123 + 512;
  v115[4] = v123 + 520;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
  lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
  Sequence.forEach(_:)();
  if (!v1)
  {
    v102 = *(void *)(v123 + 704);
    swift_task_dealloc();
    closure #1 in osSignpostWithoutMessage(log:name:id:type:state:formatString:)(v111, v109, v121, v122, v102, v104, "");
    v100 = *(void *)(v123 + 704);
    v101 = *(void *)(v123 + 680);
    v99 = *(void *)(v123 + 688);
    destroyStorage<A>(_:count:)(v112, 0, v110);
    destroyStorage<A>(_:count:)(v113, 0, MEMORY[0x263F8EE58] + 8);
    MEMORY[0x2611C8D90](v111, MEMORY[0x263F8E778]);

    (*(void (**)(uint64_t, uint64_t))(v99 + 8))(v100, v101);
    swift_bridgeObjectRelease();
    v103 = 0;
    goto LABEL_8;
  }
}

uint64_t GetBloodPressureIntentHandler.handle(intent:)(char a1)
{
  uint64_t v3 = *v1;
  *(void *)(v3 + 256) = *v1;
  *(unsigned char *)(v3 + 960) = a1;
  swift_task_dealloc();
  return MEMORY[0x270FA2498](GetBloodPressureIntentHandler.handle(intent:), 0);
}

uint64_t GetBloodPressureIntentHandler.handle(intent:)()
{
  uint64_t v4 = *v0;
  uint64_t v5 = *v0;
  *(void *)(v5 + 256) = *v0;
  uint64_t v1 = *(void *)(v4 + 48);
  *(void *)(v5 + 856) = v1;
  if (v1)
  {
    id v2 = GetBloodPressureIntentHandler.handle(intent:);
  }
  else
  {
    id v2 = GetBloodPressureIntentHandler.handle(intent:);
  }
  return MEMORY[0x270FA2498](v2, 0);
}

{
  void *v0;
  void *v1;
  void *v2;
  Swift::String v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t (*v12)(char *);
  uint64_t result;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint8_t *buf;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint32_t size;
  os_log_type_t v35;
  NSObject *oslog;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  void (*v41)(uint64_t, uint64_t, uint64_t);
  id v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t BloodPressureIntentResponse;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;

  uint64_t v1 = (void *)v0[106];
  v0[32] = v0;
  uint64_t v51 = v0[55];

  v52 = v0[102];
  v0[108] = v51;
  if (v51)
  {
    uint64_t v47 = *(void **)(v50 + 808);
    v41 = *(void (**)(uint64_t, uint64_t, uint64_t))(v50 + 776);
    uint64_t v39 = *(void *)(v50 + 728);
    os_signpost_type_t v43 = *(void *)(v50 + 696);
    uint64_t v40 = *(void *)(v50 + 680);
    uint64_t v42 = *(id *)(v50 + 584);
    id v2 = *(void **)(v50 + 576);
    uint64_t v46 = *(void **)(v50 + 840);
    v44 = *(void **)(v50 + 832);
    uint64_t v38 = *(void **)(v50 + 824);
    *(void *)(v50 + 456) = v51;
    uint64_t v45 = swift_allocObject();
    *(void *)(v50 + 872) = v45;
    *(void *)(v50 + 464) = v45 + 16;
    BloodPressureIntentResponse = type metadata accessor for GetBloodPressureIntentResponse();
    *(void *)(v50 + 880) = BloodPressureIntentResponse;
    *(void *)(v45 + 16) = GetBloodPressureIntentResponse.__allocating_init(code:userActivity:)(4, 0);
    uint64_t v3 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("handle(intent:)", 0xFuLL, 1);
    *(void *)(v50 + 888) = v3._object;
    uint64_t v4 = v2;
    uint64_t v5 = v38;
    uint64_t v6 = v42;
    v41(v43, v39, v40);
    swift_bridgeObjectRetain();
    uint64_t v7 = v44;
    swift_retain();
    uint64_t v8 = v46;
    uint64_t v9 = v47;
    v48 = (void *)swift_task_alloc();
    *(void *)(v50 + 896) = v48;
    v48[2] = v2;
    v48[3] = v38;
    v48[4] = v42;
    v48[5] = v43;
    v48[6] = v51;
    v48[7] = v44;
    v48[8] = v45;
    v48[9] = v46;
    v48[10] = v47;
    uint64_t v10 = (void *)swift_task_alloc();
    *(void *)(v50 + 904) = v10;
    void *v10 = *(void *)(v50 + 256);
    v10[1] = GetBloodPressureIntentHandler.handle(intent:);
    return MEMORY[0x270FA2360](v50 + 472, 0, 0, v3._countAndFlagsBits, v3._object, partial apply for closure #1 in GetBloodPressureIntentHandler.handle(intent:), v48, BloodPressureIntentResponse);
  }
  else
  {
    uint64_t v30 = *(id *)(v50 + 832);

    uint64_t v11 = *(void *)(v50 + 632);
    HKUnit v33 = *(void *)(v50 + 592);
    uint64_t v31 = *(void *)(v50 + 600);
    uint64_t v32 = Logger.wellness.unsafeMutableAddressor();
    swift_beginAccess();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v31 + 16))(v11, v32, v33);
    swift_endAccess();
    oslog = Logger.logObject.getter();
    uint64_t v35 = static os_log_type_t.error.getter();
    *(void *)(v50 + 384) = 2;
    lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    lazy protocol witness table accessor for type Int and conformance Int();
    UnsignedInteger<>.init<A>(_:)();
    size = *(_DWORD *)(v50 + 944);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
    uint64_t v37 = _allocateUninitializedArray<A>(_:)();
    if (os_log_type_enabled(oslog, v35))
    {
      buf = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
      uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      uint32_t v27 = createStorage<A>(capacity:type:)(0);
      uint64_t v28 = createStorage<A>(capacity:type:)(0);
      *(void *)(v50 + 392) = buf;
      *(void *)(v50 + 400) = v27;
      *(void *)(v50 + 408) = v28;
      serialize(_:at:)(0, (unsigned char **)(v50 + 392));
      serialize(_:at:)(0, (unsigned char **)(v50 + 392));
      *(void *)(v50 + 416) = v37;
      v29 = (void *)swift_task_alloc();
      v29[2] = v50 + 392;
      v29[3] = v50 + 400;
      v29[4] = v50 + 408;
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
      lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
      Swift::tuple_Double_Double result = Sequence.forEach(_:)();
      if (v52) {
        return result;
      }
      swift_task_dealloc();
      _os_log_impl(&dword_25DE00000, oslog, v35, "failed to create quantity types sys/dia", buf, size);
      destroyStorage<A>(_:count:)(v27, 0, v25);
      destroyStorage<A>(_:count:)(v28, 0, MEMORY[0x263F8EE58] + 8);
      MEMORY[0x2611C8D90](buf, MEMORY[0x263F8E778]);
      swift_bridgeObjectRelease();
    }
    else
    {
      swift_bridgeObjectRelease();
    }
    uint64_t v18 = *(id *)(v50 + 808);
    uint64_t v20 = *(void *)(v50 + 792);
    uint64_t v22 = *(void *)(v50 + 728);
    uint64_t v23 = *(void *)(v50 + 680);
    uint64_t v15 = *(void *)(v50 + 632);
    unint64_t v16 = *(void *)(v50 + 592);
    uint64_t v19 = *(void *)(v50 + 584);
    uint64_t v17 = *(id *)(v50 + 824);
    uint64_t v21 = *(void *)(v50 + 688);
    uint64_t v14 = *(void *)(v50 + 600);

    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v15, v16);
    type metadata accessor for GetBloodPressureIntentResponse();
    uint64_t v24 = GetBloodPressureIntentResponse.__allocating_init(code:userActivity:)(5, 0);

    $defer #1 () in GetBloodPressureIntentHandler.handle(intent:)(v19, v20);
    swift_release();
    (*(void (**)(uint64_t, uint64_t))(v21 + 8))(v22, v23);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v12 = *(uint64_t (**)(char *))(*(void *)(v50 + 256) + 8);
    return v12(v24);
  }
}

{
  uint64_t v0;
  void *v1;
  void (*v2)(uint64_t, uint64_t);
  uint64_t (*v3)();
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;

  uint64_t v15 = *v1;
  uint64_t v14 = (void *)(*v1 + 16);
  *(void *)(v15 + 256) = *v1;
  *(void *)(v15 + 912) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = GetBloodPressureIntentHandler.handle(intent:);
  }
  else
  {
    uint64_t v12 = (void *)v14[103];
    uint64_t v11 = (void *)v14[102];
    uint64_t v6 = (void *)v14[101];
    uint64_t v13 = (void *)v14[99];
    uint64_t v9 = v14[85];
    uint64_t v8 = v14[84];
    uint64_t v10 = v14[83];
    uint64_t v7 = (void *)v14[71];
    uint64_t v5 = (void *)v14[70];
    swift_task_dealloc();

    id v2 = *(void (**)(uint64_t, uint64_t))(v8 + 8);
    v14[113] = v2;
    v14[114] = (v8 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
    v2(v9, v10);
    swift_bridgeObjectRelease();

    swift_release();
    swift_bridgeObjectRelease();
    uint64_t v3 = GetBloodPressureIntentHandler.handle(intent:);
  }
  return MEMORY[0x270FA2498](v3, 0);
}

{
  void *v0;
  uint64_t (*v1)(uint64_t);
  id v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;

  uint64_t v11 = (void (*)(uint64_t, uint64_t))v0[115];
  uint64_t v3 = (id)v0[105];
  uint64_t v4 = (id)v0[104];
  uint64_t v5 = (id)v0[103];
  uint64_t v6 = (id)v0[101];
  uint64_t v8 = v0[99];
  uint64_t v9 = v0[91];
  uint64_t v10 = v0[85];
  uint64_t v7 = v0[73];
  v0[32] = v0;
  uint64_t v12 = v0[59];
  swift_release();
  swift_bridgeObjectRelease();

  $defer #1 () in GetBloodPressureIntentHandler.handle(intent:)(v7, v8);
  swift_release();
  v11(v9, v10);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(uint64_t))(v0[32] + 8);
  return v1(v12);
}

{
  uint64_t v0;
  uint64_t v1;
  id v2;
  id v3;
  void *v4;
  uint64_t (*v5)(char *);
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint8_t *buf;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(uint64_t, uint64_t);
  id v30;
  id v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  uint32_t size;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  NSObject *v53;
  os_log_type_t v54;
  uint8_t *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t (*v58)(uint64_t, uint64_t, uint64_t);
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;

  uint64_t v60 = v0;
  uint64_t v36 = *(id *)(v0 + 912);
  uint64_t v31 = *(id *)(v0 + 840);
  uint64_t v32 = *(id *)(v0 + 832);
  uint64_t v24 = *(id *)(v0 + 824);
  uint64_t v30 = *(id *)(v0 + 808);
  uint32_t v27 = *(void *)(v0 + 696);
  uint64_t v26 = *(void *)(v0 + 688);
  uint64_t v28 = *(void *)(v0 + 680);
  uint64_t v1 = *(void *)(v0 + 608);
  HKUnit v33 = *(void *)(v0 + 600);
  uint64_t v35 = *(void *)(v0 + 592);
  uint64_t v25 = *(id *)(v0 + 584);
  uint64_t v23 = *(id *)(v0 + 576);
  *(void *)(v0 + 256) = v0;
  swift_task_dealloc();

  v29 = *(void (**)(uint64_t, uint64_t))(v26 + 8);
  v29(v27, v28);
  swift_bridgeObjectRelease();

  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();

  id v2 = v36;
  *(void *)(v0 + 480) = v36;
  uint64_t v34 = Logger.wellness.unsafeMutableAddressor();
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v33 + 16))(v1, v34, v35);
  swift_endAccess();
  uint64_t v3 = v36;
  uint64_t v40 = swift_allocObject();
  *(void *)(v40 + 16) = v36;
  default argument 2 of OSLogInterpolation.appendInterpolation(_:privacy:attributes:)();
  swift_bridgeObjectRelease();
  uint64_t v53 = Logger.logObject.getter();
  unint64_t v54 = static os_log_type_t.error.getter();
  *(void *)(v0 + 488) = 32;
  lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  lazy protocol witness table accessor for type Int and conformance Int();
  UnsignedInteger<>.init<A>(_:)();
  size = *(_DWORD *)(v0 + 948);
  os_signpost_type_t v43 = swift_allocObject();
  *(unsigned char *)(v43 + 16) = 32;
  v44 = swift_allocObject();
  *(unsigned char *)(v44 + 16) = 8;
  uint64_t v38 = swift_allocObject();
  *(void *)(v38 + 16) = implicit closure #1 in GetBloodPressureIntentHandler.handle(intent:);
  *(void *)(v38 + 24) = 0;
  uint64_t v45 = swift_allocObject();
  *(void *)(v45 + 16) = partial apply for implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:);
  *(void *)(v45 + 24) = v38;
  uint64_t v46 = swift_allocObject();
  *(unsigned char *)(v46 + 16) = 0;
  uint64_t v47 = swift_allocObject();
  *(unsigned char *)(v47 + 16) = 8;
  uint64_t v39 = swift_allocObject();
  *(void *)(v39 + 16) = implicit closure #2 in GetBloodPressureIntentHandler.handle(intent:);
  *(void *)(v39 + 24) = 0;
  v48 = swift_allocObject();
  *(void *)(v48 + 16) = partial apply for thunk for @escaping @callee_guaranteed () -> (@unowned Int);
  *(void *)(v48 + 24) = v39;
  uint64_t v49 = swift_allocObject();
  *(unsigned char *)(v49 + 16) = 64;
  uint64_t v50 = swift_allocObject();
  *(unsigned char *)(v50 + 16) = 8;
  v41 = swift_allocObject();
  *(void *)(v41 + 16) = partial apply for implicit closure #10 in getPreferredUnit(for:store:);
  *(void *)(v41 + 24) = v40;
  uint64_t v42 = swift_allocObject();
  *(void *)(v42 + 16) = partial apply for implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:attributes:);
  *(void *)(v42 + 24) = v41;
  uint64_t v51 = swift_allocObject();
  *(void *)(v51 + 16) = partial apply for implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:);
  *(void *)(v51 + 24) = v42;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
  _allocateUninitializedArray<A>(_:)();
  v52 = v4;
  swift_retain();
  void *v52 = partial apply for closure #1 in OSLogArguments.append(_:);
  v52[1] = v43;
  swift_retain();
  v52[2] = partial apply for closure #1 in OSLogArguments.append(_:);
  v52[3] = v44;
  swift_retain();
  v52[4] = partial apply for closure #1 in OSLogArguments.append(_:);
  v52[5] = v45;
  swift_retain();
  v52[6] = partial apply for closure #1 in OSLogArguments.append(_:);
  v52[7] = v46;
  swift_retain();
  v52[8] = partial apply for closure #1 in OSLogArguments.append(_:);
  v52[9] = v47;
  swift_retain();
  v52[10] = partial apply for closure #1 in OSLogArguments.append<A>(_:);
  v52[11] = v48;
  swift_retain();
  v52[12] = partial apply for closure #1 in OSLogArguments.append(_:);
  v52[13] = v49;
  swift_retain();
  v52[14] = partial apply for closure #1 in OSLogArguments.append(_:);
  v52[15] = v50;
  swift_retain();
  v52[16] = partial apply for closure #1 in OSLogArguments.append(_:);
  v52[17] = v51;
  _finalizeUninitializedArray<A>(_:)();
  swift_bridgeObjectRelease();
  if (os_log_type_enabled(v53, v54))
  {
    buf = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
    uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    uint64_t v20 = createStorage<A>(capacity:type:)(1);
    uint64_t v21 = createStorage<A>(capacity:type:)(1);
    uint64_t v55 = buf;
    v56 = v20;
    unint64_t v57 = v21;
    serialize(_:at:)(2, &v55);
    serialize(_:at:)(3, &v55);
    v58 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
    HKSample v59 = v43;
    closure #1 in osLogInternal(_:log:type:)(&v58, (uint64_t)&v55, (uint64_t)&v56, (uint64_t)&v57);
    v58 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
    HKSample v59 = v44;
    closure #1 in osLogInternal(_:log:type:)(&v58, (uint64_t)&v55, (uint64_t)&v56, (uint64_t)&v57);
    v58 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
    HKSample v59 = v45;
    closure #1 in osLogInternal(_:log:type:)(&v58, (uint64_t)&v55, (uint64_t)&v56, (uint64_t)&v57);
    v58 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
    HKSample v59 = v46;
    closure #1 in osLogInternal(_:log:type:)(&v58, (uint64_t)&v55, (uint64_t)&v56, (uint64_t)&v57);
    v58 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
    HKSample v59 = v47;
    closure #1 in osLogInternal(_:log:type:)(&v58, (uint64_t)&v55, (uint64_t)&v56, (uint64_t)&v57);
    v58 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append<A>(_:);
    HKSample v59 = v48;
    closure #1 in osLogInternal(_:log:type:)(&v58, (uint64_t)&v55, (uint64_t)&v56, (uint64_t)&v57);
    v58 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
    HKSample v59 = v49;
    closure #1 in osLogInternal(_:log:type:)(&v58, (uint64_t)&v55, (uint64_t)&v56, (uint64_t)&v57);
    v58 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
    HKSample v59 = v50;
    closure #1 in osLogInternal(_:log:type:)(&v58, (uint64_t)&v55, (uint64_t)&v56, (uint64_t)&v57);
    v58 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
    HKSample v59 = v51;
    closure #1 in osLogInternal(_:log:type:)(&v58, (uint64_t)&v55, (uint64_t)&v56, (uint64_t)&v57);
    _os_log_impl(&dword_25DE00000, v53, v54, "Failed with Error: %s:%ld %@", buf, size);
    destroyStorage<A>(_:count:)(v20, 1, v18);
    destroyStorage<A>(_:count:)(v21, 1, MEMORY[0x263F8EE58] + 8);
    MEMORY[0x2611C8D90](buf, MEMORY[0x263F8E778]);
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
  }
  else
  {
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
  }
  uint64_t v10 = (id)v22[114];
  uint64_t v12 = (id)v22[101];
  uint64_t v14 = v22[99];
  uint64_t v15 = v22[91];
  unint64_t v16 = v22[85];
  uint64_t v8 = v22[76];
  uint64_t v9 = v22[74];
  uint64_t v13 = v22[73];
  uint64_t v11 = (id)v22[103];
  uint64_t v7 = v22[75];

  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v8, v9);
  uint64_t v17 = GetBloodPressureIntentResponse.__allocating_init(code:userActivity:)(5, 0);

  $defer #1 () in GetBloodPressureIntentHandler.handle(intent:)(v13, v14);
  swift_release();
  v29(v15, v16);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(char *))(v22[32] + 8);
  return v5(v17);
}

{
  void *v0;
  uint64_t v1;
  uint64_t (*v2)(char *);
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint8_t *buf;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint32_t size;
  os_log_type_t v25;
  NSObject *oslog;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;

  uint64_t v30 = (void *)v0[107];
  v29 = (void *)v0[106];
  v0[32] = v0;
  swift_willThrow();

  v0[108] = 0;
  uint64_t v20 = *(id *)(v28 + 832);

  uint64_t v1 = *(void *)(v28 + 632);
  uint64_t v23 = *(void *)(v28 + 592);
  uint64_t v21 = *(void *)(v28 + 600);
  uint64_t v22 = Logger.wellness.unsafeMutableAddressor();
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v21 + 16))(v1, v22, v23);
  swift_endAccess();
  oslog = Logger.logObject.getter();
  uint64_t v25 = static os_log_type_t.error.getter();
  *(void *)(v28 + 384) = 2;
  lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  lazy protocol witness table accessor for type Int and conformance Int();
  UnsignedInteger<>.init<A>(_:)();
  size = *(_DWORD *)(v28 + 944);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
  uint32_t v27 = _allocateUninitializedArray<A>(_:)();
  if (os_log_type_enabled(oslog, v25))
  {
    buf = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    uint64_t v17 = createStorage<A>(capacity:type:)(0);
    uint64_t v18 = createStorage<A>(capacity:type:)(0);
    *(void *)(v28 + 392) = buf;
    *(void *)(v28 + 400) = v17;
    *(void *)(v28 + 408) = v18;
    serialize(_:at:)(0, (unsigned char **)(v28 + 392));
    serialize(_:at:)(0, (unsigned char **)(v28 + 392));
    *(void *)(v28 + 416) = v27;
    uint64_t v19 = (void *)swift_task_alloc();
    v19[2] = v28 + 392;
    v19[3] = v28 + 400;
    v19[4] = v28 + 408;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
    lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
    Sequence.forEach(_:)();
    swift_task_dealloc();
    _os_log_impl(&dword_25DE00000, oslog, v25, "failed to create quantity types sys/dia", buf, size);
    destroyStorage<A>(_:count:)(v17, 0, v15);
    destroyStorage<A>(_:count:)(v18, 0, MEMORY[0x263F8EE58] + 8);
    MEMORY[0x2611C8D90](buf, MEMORY[0x263F8E778]);
  }
  swift_bridgeObjectRelease();
  uint64_t v8 = *(id *)(v28 + 808);
  uint64_t v10 = *(void *)(v28 + 792);
  uint64_t v12 = *(void *)(v28 + 728);
  uint64_t v13 = *(void *)(v28 + 680);
  uint64_t v5 = *(void *)(v28 + 632);
  uint64_t v6 = *(void *)(v28 + 592);
  uint64_t v9 = *(void *)(v28 + 584);
  uint64_t v7 = *(id *)(v28 + 824);
  uint64_t v11 = *(void *)(v28 + 688);
  uint64_t v4 = *(void *)(v28 + 600);

  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v5, v6);
  type metadata accessor for GetBloodPressureIntentResponse();
  uint64_t v14 = GetBloodPressureIntentResponse.__allocating_init(code:userActivity:)(5, 0);

  $defer #1 () in GetBloodPressureIntentHandler.handle(intent:)(v9, v10);
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v12, v13);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  id v2 = *(uint64_t (**)(char *))(*(void *)(v28 + 256) + 8);
  return v2(v14);
}

uint64_t $defer #1 () in GetBloodPressureIntentHandler.handle(intent:)(uint64_t a1, uint64_t a2)
{
  uint64_t v63 = a1;
  uint64_t v68 = a2;
  uint64_t v40 = "GBPIHandle";
  uint64_t v53 = 0;
  v41 = partial apply for closure #1 in osLogInternal(_:log:type:);
  uint64_t v42 = "Assertion failed";
  os_signpost_type_t v43 = "os/OSSignpostStringInterpolationAPI.swift";
  v44 = "Fatal error";
  uint64_t v45 = "Unexpectedly found nil while unwrapping an Optional value";
  uint64_t v46 = "Swift/StaticString.swift";
  uint64_t v82 = 0;
  uint64_t v81 = 0;
  uint64_t v47 = 0;
  uint64_t v48 = type metadata accessor for OSSignpostError();
  uint64_t v49 = *(void *)(v48 - 8);
  uint64_t v50 = v48 - 8;
  unint64_t v51 = (*(void *)(v49 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](0);
  v52 = (char *)&v15 - v51;
  uint64_t v54 = type metadata accessor for OSSignpostID();
  uint64_t v55 = *(void *)(v54 - 8);
  uint64_t v56 = v54 - 8;
  unint64_t v57 = (*(void *)(v55 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v53);
  uint64_t v58 = (uint64_t)&v15 - v57;
  unint64_t v59 = (v2 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v3);
  Swift::Double v66 = (char *)&v15 - v59;
  uint64_t v60 = type metadata accessor for OSSignposter();
  uint64_t v64 = *(void *)(v60 - 8);
  uint64_t v61 = v60 - 8;
  unint64_t v62 = (*(void *)(v64 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  double v4 = MEMORY[0x270FA5388](v60);
  uint64_t v65 = (char *)&v15 - v62;
  uint64_t v82 = v63;
  uint64_t v81 = v5;
  (*(void (**)(char *, uint64_t, double))(v64 + 16))((char *)&v15 - v62, v63 + OBJC_IVAR____TtC19SiriWellnessIntents29GetBloodPressureIntentHandler_signposter, v4);
  Swift::Double v67 = OSSignposter.logHandle.getter();
  OSSignpostIntervalState.signpostID.getter();
  int v69 = static os_signpost_type_t.end.getter();
  swift_retain();
  if ((OS_os_log.signpostsEnabled.getter() & 1) == 0)
  {
LABEL_11:
    (*(void (**)(char *, uint64_t))(v55 + 8))(v66, v54);
    swift_release();

    return (*(uint64_t (**)(char *, uint64_t))(v64 + 8))(v65, v60);
  }
  unsigned __int8 v80 = 0;
  unsigned __int8 v79 = 0;
  uint64_t v77 = v40;
  uint64_t v39 = v40;
  if (v40)
  {
    closure #1 in _globalStringTablePointerOfStaticString(_:)((uint64_t)v39, (uint64_t *)&v78);
    uint64_t v38 = v78;
    uint64_t v76 = "";
    swift_retain();
    checkForErrorAndConsumeState(state:)();
    if ((*(unsigned int (**)(char *, uint64_t))(v49 + 88))(v52, v48) == *MEMORY[0x263F90238])
    {
      String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("[Error] Interval already ended", 0x1EuLL, 1);
      uint64_t v13 = 785;
      int v14 = 0;
      _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
    }
    uint64_t v7 = v47;
    (*(void (**)(char *, uint64_t))(v49 + 8))(v52, v48);
    swift_release();
    uint64_t v17 = v76;
    unsigned int v27 = v80;
    unsigned int v29 = v79;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
    uint64_t v24 = 0;
    uint64_t v30 = _allocateUninitializedArray<A>(_:)();
    uint64_t v8 = v67;
    (*(void (**)(uint64_t, char *, uint64_t))(v55 + 16))(v58, v66, v54);
    uint64_t v20 = &v74;
    uint64_t v21 = 2;
    uint64_t v74 = 2;
    unint64_t v18 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    unint64_t v19 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    lazy protocol witness table accessor for type Int and conformance Int();
    UnsignedInteger<>.init<A>(_:)();
    uint32_t v22 = v75;
    uint64_t v25 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
    uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    uint64_t v26 = createStorage<A>(capacity:type:)(v24);
    uint64_t v28 = createStorage<A>(capacity:type:)(v24);
    HKUnit v33 = &v73;
    v73 = v25;
    uint64_t v34 = &v72;
    uint64_t v72 = v26;
    uint64_t v31 = &v71;
    uint64_t v71 = v28;
    serialize(_:at:)(v27, &v73);
    serialize(_:at:)(v29, v33);
    uint64_t v70 = v30;
    uint64_t v32 = &v15;
    MEMORY[0x270FA5388](&v15);
    uint64_t v9 = v34;
    uint64_t v10 = &v15 - 6;
    uint64_t v35 = &v15 - 6;
    v10[2] = (uint64_t)v33;
    v10[3] = (uint64_t)v9;
    v10[4] = v11;
    uint64_t v36 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
    lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
    Sequence.forEach(_:)();
    uint64_t v37 = v7;
    if (v7) {
      __break(1u);
    }
    else {
      closure #1 in osSignpostWithoutMessage(log:name:id:type:state:formatString:)(v25, v22, v67, (os_signpost_type_t)v69, v58, v38, v17);
    }
    uint64_t v16 = 0;
    destroyStorage<A>(_:count:)(v26, 0, v23);
    destroyStorage<A>(_:count:)(v28, v16, MEMORY[0x263F8EE58] + 8);
    MEMORY[0x2611C8D90](v25, MEMORY[0x263F8E778]);

    (*(void (**)(uint64_t, uint64_t))(v55 + 8))(v58, v54);
    swift_bridgeObjectRelease();
    goto LABEL_11;
  }
  uint64_t result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

void closure #1 in GetBloodPressureIntentHandler.handle(intent:)(uint64_t a1, void *a2, void *a3, char *a4, uint64_t a5, uint64_t a6, void *a7, uint64_t a8, void *a9, void *a10)
{
  uint64_t v199 = a1;
  id v206 = a2;
  id v192 = a3;
  v193 = a4;
  uint64_t v194 = a5;
  uint64_t v195 = a6;
  id v196 = a7;
  uint64_t v197 = a8;
  id v204 = a9;
  id v198 = a10;
  uint64_t v179 = 0;
  v152 = partial apply for closure #1 in closure #1 in GetBloodPressureIntentHandler.handle(intent:);
  v153 = "Query initialized";
  v154 = partial apply for closure #1 in osLogInternal(_:log:type:);
  v155 = "Query execution complete";
  v156 = partial apply for closure #1 in osLogInternal(_:log:type:);
  v157 = "Fatal error";
  v158 = "Unexpectedly found nil while unwrapping an Optional value";
  v159 = "Swift/StaticString.swift";
  uint64_t v243 = 0;
  uint64_t v242 = 0;
  uint64_t v241 = 0;
  uint64_t v240 = 0;
  uint64_t v239 = 0;
  uint64_t v238 = 0;
  uint64_t v237 = 0;
  uint64_t v236 = 0;
  id v235 = 0;
  uint64_t v234 = 0;
  id v232 = 0;
  id v231 = 0;
  uint64_t v160 = 0;
  uint64_t v161 = type metadata accessor for OSSignposter();
  v162 = *(void **)(v161 - 8);
  uint64_t v163 = v161 - 8;
  unint64_t v164 = (v162[8] + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](0);
  v165 = (char *)&v63 - v164;
  unint64_t v166 = (v10 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v11);
  v167 = (char *)&v63 - v166;
  uint64_t v168 = type metadata accessor for OSSignpostID();
  uint64_t v170 = *(void *)(v168 - 8);
  uint64_t v169 = v168 - 8;
  uint64_t v171 = v170;
  uint64_t v172 = *(void *)(v170 + 64);
  unint64_t v173 = (v172 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v168);
  v174 = (char *)&v63 - v173;
  unint64_t v175 = (v12 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388]((char *)&v63 - v173);
  v176 = (char *)&v63 - v175;
  unint64_t v177 = (v13 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388]((char *)&v63 - v175);
  v178 = (char *)&v63 - v177;
  uint64_t v180 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<GetBloodPressureIntentResponse, Error>);
  uint64_t v182 = *(void *)(v180 - 8);
  uint64_t v181 = v180 - 8;
  uint64_t v183 = v182;
  uint64_t v184 = *(void *)(v182 + 64);
  unint64_t v185 = (v184 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v179);
  v186 = (char *)&v63 - v185;
  uint64_t v187 = type metadata accessor for Date();
  uint64_t v188 = *(void *)(v187 - 8);
  uint64_t v189 = v187 - 8;
  unint64_t v190 = (*(void *)(v188 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v187);
  v191 = (char *)&v63 - v190;
  uint64_t v201 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?)
                               - 8)
                   + 64);
  unint64_t v200 = (v201 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v199);
  v202 = (char *)&v63 - v200;
  unint64_t v203 = (v201 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v14);
  v205 = (char *)&v63 - v203;
  uint64_t v243 = v15;
  uint64_t v242 = v16;
  uint64_t v241 = v17;
  uint64_t v240 = v18;
  uint64_t v239 = v19;
  uint64_t v238 = v20;
  uint64_t v237 = v21;
  uint64_t v236 = v22 + 16;
  id v235 = v204;
  uint64_t v234 = v23;
  id v207 = self;
  id v208 = objc_msgSend(v206, sel_startDate);
  if (v208)
  {
    id v151 = v208;
    id v150 = v208;
    static Date._unconditionallyBridgeFromObjectiveC(_:)();
    (*(void (**)(char *, char *, uint64_t))(v188 + 32))(v205, v191, v187);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v188 + 56))(v205, 0, 1, v187);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v188 + 56))(v205, 1, 1, v187);
  }
  v148 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v188 + 48);
  uint64_t v149 = v188 + 48;
  if (v148(v205, 1, v187) == 1)
  {
    Class v147 = 0;
  }
  else
  {
    Class isa = Date._bridgeToObjectiveC()().super.isa;
    (*(void (**)(char *, uint64_t))(v188 + 8))(v205, v187);
    Class v147 = isa;
  }
  Class v144 = v147;
  id v145 = objc_msgSend(v206, sel_endDate);
  if (v145)
  {
    id v143 = v145;
    id v142 = v145;
    static Date._unconditionallyBridgeFromObjectiveC(_:)();
    (*(void (**)(char *, char *, uint64_t))(v188 + 32))(v202, v191, v187);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v188 + 56))(v202, 0, 1, v187);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v188 + 56))(v202, 1, 1, v187);
  }
  if (v148(v202, 1, v187) == 1)
  {
    Class v141 = 0;
  }
  else
  {
    Class v140 = Date._bridgeToObjectiveC()().super.isa;
    (*(void (**)(char *, uint64_t))(v188 + 8))(v202, v187);
    Class v141 = v140;
  }
  Class v119 = v141;
  uint64_t v132 = 0;
  type metadata accessor for HKQueryOptions();
  uint64_t v118 = _allocateUninitializedArray<A>(_:)();
  lazy protocol witness table accessor for type HKQueryOptions and conformance HKQueryOptions();
  SetAlgebra<>.init(arrayLiteral:)();
  id v131 = objc_msgSend(v207, sel_predicateForSamplesWithStartDate_endDate_options_, v144, v119, v233);

  id v232 = v131;
  type metadata accessor for HKCorrelationQuery();
  id v24 = v192;
  id v25 = v131;
  uint64_t v122 = v183;
  (*(void (**)(char *, uint64_t, uint64_t))(v182 + 16))(v186, v199, v180);
  uint64_t v26 = v193;
  uint64_t v123 = v171;
  v120 = *(void (**)(char *, uint64_t, uint64_t))(v170 + 16);
  uint64_t v121 = v170 + 16;
  v120(v178, v194, v168);
  swift_bridgeObjectRetain();
  id v27 = v196;
  swift_retain();
  id v28 = v204;
  id v29 = v198;
  unint64_t v124 = (*(unsigned __int8 *)(v122 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v122 + 80);
  unint64_t v125 = (v124 + v184 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v126 = (v125 + 8 + *(unsigned __int8 *)(v123 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v123 + 80);
  unint64_t v134 = (v126 + v172 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v127 = (v134 + 15) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v128 = (v127 + 15) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v129 = (v128 + 15) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v130 = (v129 + 15) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v133 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v182 + 32))(v133 + v124, v186, v180);
  unint64_t v30 = v126;
  uint64_t v31 = v170;
  uint64_t v32 = v178;
  uint64_t v33 = v168;
  uint64_t v34 = v133;
  *(void *)(v133 + v125) = v193;
  (*(void (**)(unint64_t, char *, uint64_t))(v31 + 32))(v34 + v30, v32, v33);
  id v35 = v196;
  unint64_t v36 = v127;
  unint64_t v37 = v128;
  uint64_t v38 = v197;
  unint64_t v39 = v129;
  id v40 = v204;
  unint64_t v41 = v130;
  id v42 = v198;
  id v43 = v131;
  uint64_t v44 = v132;
  uint64_t v45 = (uint64_t)v152;
  uint64_t v46 = v133;
  id v47 = v192;
  *(void *)(v133 + v134) = v195;
  *(void *)(v46 + v36) = v35;
  *(void *)(v46 + v37) = v38;
  *(void *)(v46 + v39) = v40;
  *(void *)(v46 + v41) = v42;
  id v135 = HKCorrelationQuery.__allocating_init(type:predicate:samplePredicates:completion:)(v47, v43, v44, v45, v46);
  id v231 = v135;
  v136 = (void (*)(char *, char *, uint64_t))v162[2];
  v137 = v162 + 2;
  v136(v167, &v193[OBJC_IVAR____TtC19SiriWellnessIntents29GetBloodPressureIntentHandler_signposter], v161);
  v138 = OSSignposter.logHandle.getter();
  int v139 = static os_signpost_type_t.event.getter();
  if ((OS_os_log.signpostsEnabled.getter() & 1) == 0)
  {
    uint64_t v116 = v160;
    goto LABEL_23;
  }
  unsigned __int8 v219 = 0;
  unsigned __int8 v218 = 0;
  v216 = v153;
  v117 = v153;
  if (!v153)
  {
    char v60 = 2;
    uint64_t v61 = 136;
    int v62 = 0;
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
    goto LABEL_26;
  }
  uint64_t v48 = v160;
  closure #1 in _globalStringTablePointerOfStaticString(_:)((uint64_t)v117, (uint64_t *)&v217);
  v94 = v217;
  v215 = "";
  v95 = "";
  unsigned int v105 = v219;
  unsigned int v107 = v218;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
  uint64_t v102 = 0;
  uint64_t v108 = _allocateUninitializedArray<A>(_:)();
  uint64_t v49 = v138;
  v120(v176, v194, v168);
  v98 = &v213;
  uint64_t v99 = 2;
  uint64_t v213 = 2;
  unint64_t v96 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  unint64_t v97 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  lazy protocol witness table accessor for type Int and conformance Int();
  UnsignedInteger<>.init<A>(_:)();
  uint32_t v100 = v214;
  v103 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
  uint64_t v101 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
  uint64_t v104 = createStorage<A>(capacity:type:)(v102);
  uint64_t v106 = createStorage<A>(capacity:type:)(v102);
  v111 = &v212;
  v212 = v103;
  v112 = &v211;
  uint64_t v211 = v104;
  v109 = &v210;
  uint64_t v210 = v106;
  serialize(_:at:)(v105, &v212);
  serialize(_:at:)(v107, v111);
  uint64_t v209 = v108;
  v110 = &v63;
  MEMORY[0x270FA5388](&v63);
  uint64_t v50 = v112;
  unint64_t v51 = &v63 - 6;
  v113 = &v63 - 6;
  v51[2] = (uint64_t)v111;
  v51[3] = (uint64_t)v50;
  v51[4] = v52;
  uint64_t v114 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
  lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
  Sequence.forEach(_:)();
  uint64_t v115 = v48;
  if (v48)
  {
    __break(1u);
LABEL_21:
    uint64_t v92 = 0;
    destroyStorage<A>(_:count:)(v104, 0, v101);
    destroyStorage<A>(_:count:)(v106, v92, MEMORY[0x263F8EE58] + 8);
    MEMORY[0x2611C8D90](v103, MEMORY[0x263F8E778]);

    (*(void (**)(char *, uint64_t))(v170 + 8))(v176, v168);
    swift_bridgeObjectRelease();
    uint64_t v116 = v93;
    goto LABEL_23;
  }
  uint64_t v53 = v115;
  closure #1 in osSignpostWithoutMessage(log:name:id:type:state:formatString:)(v103, v100, v138, (os_signpost_type_t)v139, (uint64_t)v176, v94, v95);
  uint64_t v93 = v53;
  if (!v53) {
    goto LABEL_21;
  }
  __break(1u);
LABEL_23:
  uint64_t v54 = v165;
  uint64_t v87 = v116;

  v88 = (void (*)(char *, uint64_t))v162[1];
  v89 = v162 + 1;
  v88(v167, v161);
  objc_msgSend(v198, sel_executeQuery_, v135);
  v136(v54, &v193[OBJC_IVAR____TtC19SiriWellnessIntents29GetBloodPressureIntentHandler_signposter], v161);
  v90 = OSSignposter.logHandle.getter();
  int v91 = static os_signpost_type_t.event.getter();
  if ((OS_os_log.signpostsEnabled.getter() & 1) == 0)
  {
LABEL_31:

    v88(v165, v161);
    return;
  }
LABEL_26:
  unsigned __int8 v230 = 0;
  unsigned __int8 v229 = 0;
  v227 = v155;
  v86 = v155;
  if (v155)
  {
    uint64_t v55 = v87;
    closure #1 in _globalStringTablePointerOfStaticString(_:)((uint64_t)v86, (uint64_t *)&v228);
    uint64_t v64 = v228;
    v226 = "";
    uint64_t v65 = "";
    unsigned int v75 = v230;
    unsigned int v77 = v229;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
    uint64_t v72 = 0;
    uint64_t v78 = _allocateUninitializedArray<A>(_:)();
    uint64_t v56 = v90;
    v120(v174, v194, v168);
    uint64_t v68 = &v224;
    uint64_t v69 = 2;
    uint64_t v224 = 2;
    unint64_t v66 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    unint64_t v67 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    lazy protocol witness table accessor for type Int and conformance Int();
    UnsignedInteger<>.init<A>(_:)();
    uint32_t v70 = v225;
    v73 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
    uint64_t v71 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    uint64_t v74 = createStorage<A>(capacity:type:)(v72);
    uint64_t v76 = createStorage<A>(capacity:type:)(v72);
    uint64_t v81 = &v223;
    v223 = v73;
    uint64_t v82 = &v222;
    uint64_t v222 = v74;
    unsigned __int8 v79 = &v221;
    uint64_t v221 = v76;
    serialize(_:at:)(v75, &v223);
    serialize(_:at:)(v77, v81);
    uint64_t v220 = v78;
    unsigned __int8 v80 = &v63;
    MEMORY[0x270FA5388](&v63);
    unint64_t v57 = v82;
    uint64_t v58 = &v63 - 6;
    v83 = &v63 - 6;
    v58[2] = (uint64_t)v81;
    v58[3] = (uint64_t)v57;
    v58[4] = v59;
    uint64_t v84 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
    lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
    Sequence.forEach(_:)();
    uint64_t v85 = v55;
    if (v55) {
      __break(1u);
    }
    else {
      closure #1 in osSignpostWithoutMessage(log:name:id:type:state:formatString:)(v73, v70, v90, (os_signpost_type_t)v91, (uint64_t)v174, v64, v65);
    }
    uint64_t v63 = 0;
    destroyStorage<A>(_:count:)(v74, 0, v71);
    destroyStorage<A>(_:count:)(v76, v63, MEMORY[0x263F8EE58] + 8);
    MEMORY[0x2611C8D90](v73, MEMORY[0x263F8E778]);

    (*(void (**)(char *, uint64_t))(v170 + 8))(v174, v168);
    swift_bridgeObjectRelease();
    goto LABEL_31;
  }
  char v60 = 2;
  uint64_t v61 = 136;
  int v62 = 0;
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

uint64_t closure #1 in closure #1 in GetBloodPressureIntentHandler.handle(intent:)(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8, uint64_t a9, void *a10, void *a11)
{
  uint64_t v246 = a1;
  uint64_t v239 = a2;
  v250 = a3;
  uint64_t v233 = a4;
  uint64_t v234 = a5;
  uint64_t v235 = a6;
  uint64_t v236 = a7;
  id v237 = a8;
  uint64_t v247 = a9;
  id v248 = a10;
  id v238 = a11;
  uint64_t v227 = 0;
  unint64_t v200 = partial apply for implicit closure #1 in closure #1 in closure #1 in GetBloodPressureIntentHandler.handle(intent:);
  uint64_t v201 = partial apply for implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:);
  v202 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
  unint64_t v203 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
  id v204 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
  v205 = "correlation operations begin";
  id v206 = partial apply for closure #1 in osLogInternal(_:log:type:);
  id v207 = partial apply for closure #1 in closure #1 in closure #1 in GetBloodPressureIntentHandler.handle(intent:);
  id v208 = "Fatal error";
  uint64_t v209 = "Unexpectedly found nil while unwrapping an Optional value";
  uint64_t v210 = "Swift/StaticString.swift";
  uint64_t v211 = partial apply for closure #1 in osLogInternal(_:log:type:);
  uint64_t v302 = 0;
  uint64_t v301 = 0;
  v300 = 0;
  uint64_t v299 = 0;
  uint64_t v298 = 0;
  uint64_t v297 = 0;
  uint64_t v296 = 0;
  uint64_t v295 = 0;
  uint64_t v294 = 0;
  id v293 = 0;
  uint64_t v292 = 0;
  uint64_t v212 = 0;
  uint64_t v283 = 0;
  v260 = 0;
  uint64_t v213 = type metadata accessor for Date();
  uint64_t v214 = *(void *)(v213 - 8);
  uint64_t v215 = v213 - 8;
  unint64_t v216 = (*(void *)(v214 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v213);
  v217 = (char *)&v69 - v216;
  unint64_t v218 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?)
                                - 8)
                    + 64)
        + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v227);
  unsigned __int8 v219 = (char *)&v69 - v218;
  unint64_t v220 = (v11 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v12);
  uint64_t v221 = (char *)&v69 - v220;
  uint64_t v222 = type metadata accessor for OSSignpostID();
  uint64_t v223 = *(void *)(v222 - 8);
  uint64_t v224 = v222 - 8;
  unint64_t v225 = (*(void *)(v223 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v227);
  uint64_t v226 = (uint64_t)&v69 - v225;
  uint64_t v228 = type metadata accessor for OSSignposter();
  uint64_t v229 = *(void *)(v228 - 8);
  uint64_t v230 = v228 - 8;
  unint64_t v231 = (*(void *)(v229 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v227);
  id v232 = (char *)&v69 - v231;
  uint64_t v240 = type metadata accessor for Logger();
  uint64_t v241 = *(void *)(v240 - 8);
  uint64_t v242 = v240 - 8;
  uint64_t v244 = *(void *)(v241 + 64);
  unint64_t v243 = (v244 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v250);
  v245 = (char *)&v69 - v243;
  MEMORY[0x270FA5388](v13);
  v249 = (char *)&v69 - v14;
  uint64_t v302 = v246;
  uint64_t v301 = v15;
  v300 = v16;
  uint64_t v299 = v17;
  uint64_t v298 = v18;
  uint64_t v297 = v19;
  uint64_t v296 = v20;
  uint64_t v295 = v21;
  uint64_t v294 = v247 + 16;
  id v293 = v248;
  uint64_t v292 = v22;
  id v23 = v16;
  if (v250)
  {
    uint64_t v199 = v250;
    id v24 = v249;
    id v180 = v250;
    v260 = v250;
    uint64_t v178 = Logger.wellness.unsafeMutableAddressor();
    uint64_t v179 = &v259;
    uint64_t v186 = 32;
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v241 + 16))(v24, v178, v240);
    swift_endAccess();
    id v25 = v180;
    uint64_t v187 = 7;
    uint64_t v188 = swift_allocObject();
    *(void *)(v188 + 16) = v180;
    id v196 = Logger.logObject.getter();
    int v197 = static os_log_type_t.error.getter();
    uint64_t v183 = &v257;
    uint64_t v257 = 12;
    unint64_t v181 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    unint64_t v182 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    lazy protocol witness table accessor for type Int and conformance Int();
    UnsignedInteger<>.init<A>(_:)();
    uint32_t v184 = v258;
    uint64_t v185 = 17;
    uint64_t v190 = swift_allocObject();
    *(unsigned char *)(v190 + 16) = 32;
    uint64_t v191 = swift_allocObject();
    *(unsigned char *)(v191 + 16) = 8;
    uint64_t v26 = swift_allocObject();
    uint64_t v27 = v188;
    uint64_t v189 = v26;
    *(void *)(v26 + 16) = v200;
    *(void *)(v26 + 24) = v27;
    uint64_t v28 = swift_allocObject();
    uint64_t v29 = v189;
    uint64_t v193 = v28;
    *(void *)(v28 + 16) = v201;
    *(void *)(v28 + 24) = v29;
    uint64_t v195 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
    uint64_t v192 = _allocateUninitializedArray<A>(_:)();
    uint64_t v194 = v30;
    swift_retain();
    uint64_t v31 = v190;
    uint64_t v32 = v194;
    *uint64_t v194 = v202;
    v32[1] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v31;
    swift_retain();
    uint64_t v33 = v191;
    uint64_t v34 = v194;
    v194[2] = v203;
    v34[3] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v33;
    swift_retain();
    id v35 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v193;
    unint64_t v36 = v194;
    v194[4] = v204;
    v36[5] = v35;
    _finalizeUninitializedArray<A>(_:)();
    swift_bridgeObjectRelease();
    if (os_log_type_enabled(v196, (os_log_type_t)v197))
    {
      uint64_t v37 = v212;
      uint64_t v171 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
      uint64_t v170 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      uint64_t v172 = createStorage<A>(capacity:type:)(0);
      uint64_t v173 = createStorage<A>(capacity:type:)(1);
      v174 = &v255;
      v255 = v171;
      unint64_t v175 = &v254;
      uint64_t v254 = v172;
      v176 = &v253;
      uint64_t v253 = v173;
      serialize(_:at:)(2, &v255);
      serialize(_:at:)(1, v174);
      v251 = v202;
      uint64_t v252 = v190;
      closure #1 in osLogInternal(_:log:type:)(&v251, (uint64_t)v174, (uint64_t)v175, (uint64_t)v176);
      uint64_t v177 = v37;
      if (v37)
      {
        __break(1u);
      }
      else
      {
        v251 = v203;
        uint64_t v252 = v191;
        closure #1 in osLogInternal(_:log:type:)(&v251, (uint64_t)&v255, (uint64_t)&v254, (uint64_t)&v253);
        uint64_t v168 = 0;
        v251 = v204;
        uint64_t v252 = v193;
        closure #1 in osLogInternal(_:log:type:)(&v251, (uint64_t)&v255, (uint64_t)&v254, (uint64_t)&v253);
        uint64_t v167 = 0;
        _os_log_impl(&dword_25DE00000, v196, (os_log_type_t)v197, "Query Errored out: %s", v171, v184);
        destroyStorage<A>(_:count:)(v172, 0, v170);
        destroyStorage<A>(_:count:)(v173, 1, MEMORY[0x263F8EE58] + 8);
        MEMORY[0x2611C8D90](v171, MEMORY[0x263F8E778]);
        swift_release();
        swift_release();
        swift_release();
        uint64_t v169 = v167;
      }
    }
    else
    {
      uint64_t v38 = v212;
      swift_release();
      swift_release();
      swift_release();
      uint64_t v169 = v38;
    }
    uint64_t v166 = v169;

    (*(void (**)(char *, uint64_t))(v241 + 8))(v249, v240);
    unint64_t v164 = 0;
    type metadata accessor for GetBloodPressureIntentResponse();
    unint64_t v39 = GetBloodPressureIntentResponse.__allocating_init(code:userActivity:)(5, v164);
    v165 = &v256;
    v256 = v39;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<GetBloodPressureIntentResponse, Error>);
    CheckedContinuation.resume(returning:)();

    uint64_t v198 = v166;
  }
  else
  {
    uint64_t v198 = v212;
  }
  uint64_t v163 = v198;
  swift_bridgeObjectRetain();
  if (v239)
  {
    uint64_t v162 = v239;
    uint64_t v158 = v239;
    uint64_t v283 = v239;
    swift_bridgeObjectRetain();
    uint64_t v160 = &v282;
    uint64_t v282 = v158;
    uint64_t v159 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [HKCorrelation]);
    lazy protocol witness table accessor for type [HKCorrelation] and conformance [A]();
    int v161 = Collection.isEmpty.getter();
    outlined destroy of [HKQuantityType]();
    if ((v161 & 1) == 0)
    {
      (*(void (**)(char *, uint64_t, uint64_t))(v229 + 16))(v232, v234 + OBJC_IVAR____TtC19SiriWellnessIntents29GetBloodPressureIntentHandler_signposter, v228);
      v156 = OSSignposter.logHandle.getter();
      int v157 = static os_signpost_type_t.event.getter();
      if ((OS_os_log.signpostsEnabled.getter() & 1) == 0)
      {
        uint64_t v154 = v163;
        goto LABEL_24;
      }
      unsigned __int8 v271 = 0;
      unsigned __int8 v270 = 0;
      v268 = v205;
      v155 = v205;
      if (!v205)
      {
        char v66 = 2;
        uint64_t v67 = 136;
        int v68 = 0;
        _assertionFailure(_:_:file:line:flags:)();
        __break(1u);
LABEL_27:
        swift_bridgeObjectRelease();

        unint64_t v124 = &v280;
        swift_beginAccess();
        id v123 = *(id *)(v247 + 16);
        id v55 = v123;
        swift_endAccess();
        swift_bridgeObjectRetain();
        unint64_t v126 = &v278;
        uint64_t v278 = v158;
        unint64_t v125 = lazy protocol witness table accessor for type [HKCorrelation] and conformance [A]();
        BidirectionalCollection.last.getter();
        outlined destroy of [HKQuantityType]();
        id v127 = v279;
        if (v279)
        {
          id v122 = v127;
          id v120 = v127;
          id v121 = objc_msgSend(v127, sel_startDate);
          static Date._unconditionallyBridgeFromObjectiveC(_:)();
          (*(void (**)(char *, char *, uint64_t))(v214 + 32))(v221, v217, v213);

          (*(void (**)(char *, void, uint64_t, uint64_t))(v214 + 56))(v221, 0, 1, v213);
        }
        else
        {
          (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v214 + 56))(v221, 1, 1, v213);
        }
        uint64_t v118 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v214 + 48);
        uint64_t v119 = v214 + 48;
        if (v118(v221, 1, v213) == 1)
        {
          Class v117 = 0;
        }
        else
        {
          Class isa = Date._bridgeToObjectiveC()().super.isa;
          (*(void (**)(char *, uint64_t))(v214 + 8))(v221, v213);
          Class v117 = isa;
        }
        Class v111 = v117;
        objc_msgSend(v123, sel_setSampleStartDate_);

        v113 = &v277;
        swift_beginAccess();
        id v112 = *(id *)(v247 + 16);
        id v56 = v112;
        swift_endAccess();
        swift_bridgeObjectRetain();
        uint64_t v114 = &v275;
        uint64_t v275 = v158;
        BidirectionalCollection.last.getter();
        outlined destroy of [HKQuantityType]();
        id v115 = v276;
        if (v276)
        {
          id v110 = v115;
          id v108 = v115;
          id v109 = objc_msgSend(v115, sel_endDate);
          static Date._unconditionallyBridgeFromObjectiveC(_:)();
          (*(void (**)(char *, char *, uint64_t))(v214 + 32))(v219, v217, v213);

          (*(void (**)(char *, void, uint64_t, uint64_t))(v214 + 56))(v219, 0, 1, v213);
        }
        else
        {
          (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v214 + 56))(v219, 1, 1, v213);
        }
        if (v118(v219, 1, v213) == 1)
        {
          Class v107 = 0;
        }
        else
        {
          Class v106 = Date._bridgeToObjectiveC()().super.isa;
          (*(void (**)(char *, uint64_t))(v214 + 8))(v219, v213);
          Class v107 = v106;
        }
        Class v94 = v107;
        objc_msgSend(v112, sel_setSampleEndDate_);

        uint64_t v100 = v247 + 16;
        v95 = &v274;
        uint64_t v101 = 32;
        uint64_t v102 = 0;
        swift_beginAccess();
        id v99 = *(id *)(v247 + 16);
        id v57 = v99;
        swift_endAccess();
        v96.super.Class isa = (Class)objc_msgSend(self, sel_millimeterOfMercuryUnit);
        id v58 = v238;
        v303.is_nil = (char)v238;
        v304.is_nil = 0;
        v303.value.super.Class isa = 0;
        Swift::String v97 = localizedUnitName(for:value:store:)(v96, v304, v303);

        id v98 = (id)MEMORY[0x2611C8860](v97._countAndFlagsBits, v97._object);
        swift_bridgeObjectRelease();
        objc_msgSend(v99, sel_setUnit_, v98);

        v103 = &v273;
        swift_beginAccess();
        id v104 = *(id *)(v247 + 16);
        id v59 = v104;
        swift_endAccess();
        unsigned int v105 = &v272;
        id v272 = v104;
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<GetBloodPressureIntentResponse, Error>);
        CheckedContinuation.resume(returning:)();
        return swift_bridgeObjectRelease();
      }
      uint64_t v40 = v163;
      closure #1 in _globalStringTablePointerOfStaticString(_:)((uint64_t)v155, (uint64_t *)&v269);
      uint64_t v132 = v269;
      v267 = "";
      uint64_t v133 = "";
      unsigned int v143 = v271;
      unsigned int v145 = v270;
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
      uint64_t v140 = 0;
      uint64_t v146 = _allocateUninitializedArray<A>(_:)();
      unint64_t v41 = v156;
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v223 + 16))(v226, v235, v222);
      v136 = &v265;
      uint64_t v137 = 2;
      uint64_t v265 = 2;
      unint64_t v134 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
      unint64_t v135 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
      lazy protocol witness table accessor for type Int and conformance Int();
      UnsignedInteger<>.init<A>(_:)();
      uint32_t v138 = v266;
      Class v141 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
      uint64_t v139 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      uint64_t v142 = createStorage<A>(capacity:type:)(v140);
      uint64_t v144 = createStorage<A>(capacity:type:)(v140);
      uint64_t v149 = &v264;
      v264 = v141;
      id v150 = &v263;
      uint64_t v263 = v142;
      Class v147 = &v262;
      uint64_t v262 = v144;
      serialize(_:at:)(v143, &v264);
      serialize(_:at:)(v145, v149);
      uint64_t v261 = v146;
      v148 = &v69;
      MEMORY[0x270FA5388](&v69);
      id v42 = v150;
      id v43 = &v69 - 6;
      id v151 = &v69 - 6;
      v43[2] = (uint64_t)v149;
      v43[3] = (uint64_t)v42;
      v43[4] = v44;
      uint64_t v152 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
      lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
      Sequence.forEach(_:)();
      uint64_t v153 = v40;
      if (v40)
      {
        __break(1u);
      }
      else
      {
        uint64_t v45 = v153;
        closure #1 in osSignpostWithoutMessage(log:name:id:type:state:formatString:)(v141, v138, v156, (os_signpost_type_t)v157, v226, v132, v133);
        uint64_t v131 = v45;
        if (v45)
        {
          __break(1u);
LABEL_24:
          uint64_t v46 = v154;

          (*(void (**)(char *, uint64_t))(v229 + 8))(v232, v228);
          uint64_t v281 = v158;
          swift_bridgeObjectRetain();
          id v47 = v237;
          id v48 = v248;
          unint64_t v128 = &v69;
          MEMORY[0x270FA5388](&v69);
          uint64_t v49 = (uint64_t)v237;
          uint64_t v50 = v247;
          unint64_t v51 = &v69 - 6;
          unint64_t v129 = &v69 - 6;
          v51[2] = v52;
          v51[3] = v49;
          v51[4] = v50 + 16;
          v51[5] = v53;
          lazy protocol witness table accessor for type [HKCorrelation] and conformance [A]();
          uint64_t result = Sequence.forEach(_:)();
          if (v46)
          {
            __break(1u);
            return result;
          }
          goto LABEL_27;
        }
      }
      uint64_t v130 = 0;
      destroyStorage<A>(_:count:)(v142, 0, v139);
      destroyStorage<A>(_:count:)(v144, v130, MEMORY[0x263F8EE58] + 8);
      MEMORY[0x2611C8D90](v141, MEMORY[0x263F8E778]);

      (*(void (**)(uint64_t, uint64_t))(v223 + 8))(v226, v222);
      swift_bridgeObjectRelease();
      uint64_t v154 = v131;
      goto LABEL_24;
    }
    swift_bridgeObjectRelease();
  }
  char v60 = v245;
  uint64_t v85 = Logger.wellness.unsafeMutableAddressor();
  v86 = &v291;
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v241 + 16))(v60, v85, v240);
  swift_endAccess();
  uint64_t v92 = Logger.logObject.getter();
  int v91 = static os_log_type_t.debug.getter();
  v89 = &v289;
  uint64_t v289 = 2;
  unint64_t v87 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  unint64_t v88 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  lazy protocol witness table accessor for type Int and conformance Int();
  UnsignedInteger<>.init<A>(_:)();
  uint32_t v90 = v290;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
  uint64_t v93 = _allocateUninitializedArray<A>(_:)();
  if (os_log_type_enabled(v92, (os_log_type_t)v91))
  {
    uint64_t v61 = v163;
    unsigned int v75 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
    uint64_t v73 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    uint64_t v74 = 0;
    uint64_t v76 = createStorage<A>(capacity:type:)(0);
    uint64_t v77 = createStorage<A>(capacity:type:)(v74);
    uint64_t v81 = &v287;
    v287 = v75;
    uint64_t v82 = &v286;
    uint64_t v286 = v76;
    unsigned __int8 v79 = &v285;
    uint64_t v285 = v77;
    unsigned int v78 = 0;
    serialize(_:at:)(0, &v287);
    serialize(_:at:)(v78, v81);
    uint64_t v284 = v93;
    unsigned __int8 v80 = &v69;
    MEMORY[0x270FA5388](&v69);
    int v62 = v82;
    uint64_t v63 = &v69 - 6;
    v83 = &v69 - 6;
    v63[2] = (uint64_t)v81;
    v63[3] = (uint64_t)v62;
    v63[4] = v64;
    uint64_t v84 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
    lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
    Sequence.forEach(_:)();
    if (v61)
    {
      __break(1u);
    }
    else
    {
      _os_log_impl(&dword_25DE00000, v92, (os_log_type_t)v91, "No data returned", v75, v90);
      uint64_t v72 = 0;
      destroyStorage<A>(_:count:)(v76, 0, v73);
      destroyStorage<A>(_:count:)(v77, v72, MEMORY[0x263F8EE58] + 8);
      MEMORY[0x2611C8D90](v75, MEMORY[0x263F8E778]);
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    swift_bridgeObjectRelease();
  }

  (*(void (**)(char *, uint64_t))(v241 + 8))(v245, v240);
  uint32_t v70 = 0;
  type metadata accessor for GetBloodPressureIntentResponse();
  uint64_t v65 = GetBloodPressureIntentResponse.__allocating_init(code:userActivity:)(102, v70);
  uint64_t v71 = &v288;
  v288 = v65;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<GetBloodPressureIntentResponse, Error>);
  return CheckedContinuation.resume(returning:)();
}

uint64_t implicit closure #1 in closure #1 in closure #1 in GetBloodPressureIntentHandler.handle(intent:)()
{
  return Error.localizedDescription.getter();
}

uint64_t closure #1 in closure #1 in closure #1 in GetBloodPressureIntentHandler.handle(intent:)(void **a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  uint64_t v7 = *a1;
  swift_bridgeObjectRetain();
  swift_getKeyPath();
  swift_getKeyPath();
  swift_getKeyPath();
  swift_beginAccess();
  conjugate<A>(for:units:target:minKey:maxKey:valueKey:accumulator:)(v7, a2, a3);
  swift_endAccess();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  swift_getKeyPath();
  swift_getKeyPath();
  swift_getKeyPath();
  swift_beginAccess();
  conjugate<A>(for:units:target:minKey:maxKey:valueKey:accumulator:)(v7, a2, a5);
  swift_endAccess();
  swift_release();
  swift_release();
  swift_release();
  return swift_bridgeObjectRelease();
}

void key path getter for GetBloodPressureIntentResponse.systolicMinimum : GetBloodPressureIntentResponse(id *a1@<X0>, void *a2@<X8>)
{
  id v4 = *a1;
  id v2 = *a1;
  objc_msgSend(v4, sel_systolicMinimum);
  *a2 = v3;
}

void key path setter for GetBloodPressureIntentResponse.systolicMinimum : GetBloodPressureIntentResponse(double *a1, id *a2)
{
  double v4 = *a1;
  id v3 = *a2;
  id v2 = *a2;
  objc_msgSend(v3, sel_setSystolicMinimum_, v4);
}

void key path getter for GetBloodPressureIntentResponse.systolicMaximum : GetBloodPressureIntentResponse(id *a1@<X0>, void *a2@<X8>)
{
  id v4 = *a1;
  id v2 = *a1;
  objc_msgSend(v4, sel_systolicMaximum);
  *a2 = v3;
}

void key path setter for GetBloodPressureIntentResponse.systolicMaximum : GetBloodPressureIntentResponse(double *a1, id *a2)
{
  double v4 = *a1;
  id v3 = *a2;
  id v2 = *a2;
  objc_msgSend(v3, sel_setSystolicMaximum_, v4);
}

void key path getter for GetBloodPressureIntentResponse.systolic : GetBloodPressureIntentResponse(id *a1@<X0>, void *a2@<X8>)
{
  id v4 = *a1;
  id v2 = *a1;
  objc_msgSend(v4, sel_systolic);
  *a2 = v3;
}

void key path setter for GetBloodPressureIntentResponse.systolic : GetBloodPressureIntentResponse(double *a1, id *a2)
{
  double v4 = *a1;
  id v3 = *a2;
  id v2 = *a2;
  objc_msgSend(v3, sel_setSystolic_, v4);
}

void key path getter for GetBloodPressureIntentResponse.diastolicMinimum : GetBloodPressureIntentResponse(id *a1@<X0>, void *a2@<X8>)
{
  id v4 = *a1;
  id v2 = *a1;
  objc_msgSend(v4, sel_diastolicMinimum);
  *a2 = v3;
}

void key path setter for GetBloodPressureIntentResponse.diastolicMinimum : GetBloodPressureIntentResponse(double *a1, id *a2)
{
  double v4 = *a1;
  id v3 = *a2;
  id v2 = *a2;
  objc_msgSend(v3, sel_setDiastolicMinimum_, v4);
}

void key path getter for GetBloodPressureIntentResponse.diastolicMaximum : GetBloodPressureIntentResponse(id *a1@<X0>, void *a2@<X8>)
{
  id v4 = *a1;
  id v2 = *a1;
  objc_msgSend(v4, sel_diastolicMaximum);
  *a2 = v3;
}

void key path setter for GetBloodPressureIntentResponse.diastolicMaximum : GetBloodPressureIntentResponse(double *a1, id *a2)
{
  double v4 = *a1;
  id v3 = *a2;
  id v2 = *a2;
  objc_msgSend(v3, sel_setDiastolicMaximum_, v4);
}

void key path getter for GetBloodPressureIntentResponse.diastolic : GetBloodPressureIntentResponse(id *a1@<X0>, void *a2@<X8>)
{
  id v4 = *a1;
  id v2 = *a1;
  objc_msgSend(v4, sel_diastolic);
  *a2 = v3;
}

void key path setter for GetBloodPressureIntentResponse.diastolic : GetBloodPressureIntentResponse(double *a1, id *a2)
{
  double v4 = *a1;
  id v3 = *a2;
  id v2 = *a2;
  objc_msgSend(v3, sel_setDiastolic_, v4);
}

id HKCorrelationQuery.__allocating_init(type:predicate:samplePredicates:completion:)(void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v5 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  return @nonobjc HKCorrelationQuery.init(type:predicate:samplePredicates:completion:)(a1, a2, a3, a4, a5);
}

uint64_t implicit closure #1 in GetBloodPressureIntentHandler.handle(intent:)()
{
  return String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("/Library/Caches/com.apple.xbs/Sources/SiriHealth/Wellness/SiriWellnessIntents/Intent Handlers/GetBloodPressureIntentHandler.swift", 0x81uLL, 1)._countAndFlagsBits;
}

uint64_t implicit closure #2 in GetBloodPressureIntentHandler.handle(intent:)()
{
  return 151;
}

uint64_t @objc closure #1 in GetBloodPressureIntentHandler.handle(intent:)(void *a1, const void *a2, void *a3)
{
  v3[4] = a3;
  v3[3] = a1;
  v3[2] = v3;
  id v5 = a1;
  v3[5] = _Block_copy(a2);
  id v6 = a3;
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v10 + 48) = v7;
  *uint64_t v7 = *(void *)(v10 + 16);
  v7[1] = @objc closure #1 in LogQuantityIntentHandler.handle(intent:);
  return GetBloodPressureIntentHandler.handle(intent:)((uint64_t)a1);
}

id GetBloodPressureIntentHandler.__allocating_init()()
{
  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

uint64_t GetBloodPressureIntentHandler.init()()
{
  if (!"SiriWellnessIntents.GetBloodPressureIntentHandler")
  {
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  uint64_t result = closure #1 in _unimplementedInitializer(className:initName:file:line:column:)((uint64_t)"SiriWellnessIntents.GetBloodPressureIntentHandler", 49, (unint64_t)"init()", 6, 2, (unint64_t)"SiriWellnessIntents/GetBloodPressureIntentHandler.swift", 55, 2, v1, 0x3EuLL, 0x14uLL);
  __break(1u);
  return result;
}

id GetBloodPressureIntentHandler.__deallocating_deinit()
{
  id v3 = v0;
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id @nonobjc HKCorrelationQuery.init(type:predicate:samplePredicates:completion:)(void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (a3)
  {
    type metadata accessor for HKSampleType();
    type metadata accessor for NSPredicate();
    lazy protocol witness table accessor for type HKSampleType and conformance NSObject();
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    Class v9 = isa;
  }
  else
  {
    Class v9 = 0;
  }
  uint64_t v20 = a4;
  uint64_t v21 = a5;
  uint64_t aBlock = MEMORY[0x263EF8330];
  int v16 = 1107296256;
  int v17 = 0;
  uint64_t v18 = thunk for @escaping @callee_guaranteed @Sendable (@guaranteed HKCorrelationQuery, @guaranteed [HKCorrelation]?, @guaranteed Error?) -> ();
  uint64_t v19 = &block_descriptor_66;
  id v6 = _Block_copy(&aBlock);
  id v7 = objc_msgSend(v14, sel_initWithType_predicate_samplePredicates_completion_, a1, a2, v9);
  _Block_release(v6);
  swift_release();

  return v7;
}

uint64_t thunk for @escaping @callee_guaranteed @Sendable (@guaranteed HKCorrelationQuery, @guaranteed [HKCorrelation]?, @guaranteed Error?) -> ()(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v12 = *(void (**)(void *, uint64_t))(a1 + 32);
  swift_retain();
  id v4 = a2;
  id v5 = a3;
  if (a3)
  {
    type metadata accessor for HKCorrelation();
    uint64_t v9 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

    uint64_t v10 = v9;
  }
  else
  {
    uint64_t v10 = 0;
  }
  id v6 = a4;
  if (a4) {
    uint64_t v8 = a4;
  }
  else {
    uint64_t v8 = 0;
  }
  v12(a2, v10);

  swift_bridgeObjectRelease();
  return swift_release();
}

uint64_t closure #1 in _globalStringTablePointerOfStaticString(_:)@<X0>(uint64_t result@<X0>, uint64_t *a2@<X8>)
{
  if (result)
  {
    uint64_t v2 = result;
  }
  else
  {
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  *a2 = v2;
  return result;
}

void closure #1 in osSignpostWithoutMessage(log:name:id:type:state:formatString:)(uint8_t *a1, uint32_t a2, NSObject *a3, os_signpost_type_t a4, uint64_t a5, const char *a6, const char *a7)
{
  os_signpost_id_t v7 = OSSignpostID.rawValue.getter();
  _os_signpost_emit_with_name_impl(&dword_25DE00000, a3, a4, v7, a6, a7, a1, a2);
}

unint64_t type metadata accessor for HKCorrelationType()
{
  uint64_t v2 = lazy cache variable for type metadata for HKCorrelationType;
  if (!lazy cache variable for type metadata for HKCorrelationType)
  {
    self;
    unint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&lazy cache variable for type metadata for HKCorrelationType);
    return ObjCClassMetadata;
  }
  return v2;
}

uint64_t sub_25DF0C8BC()
{
  return swift_deallocObject();
}

void partial apply for closure #1 in GetBloodPressureIntentHandler.handle(intent:)(uint64_t a1)
{
  closure #1 in GetBloodPressureIntentHandler.handle(intent:)(a1, *(void **)(v1 + 16), *(void **)(v1 + 24), *(char **)(v1 + 32), *(void *)(v1 + 40), *(void *)(v1 + 48), *(void **)(v1 + 56), *(void *)(v1 + 64), *(void **)(v1 + 72), *(void **)(v1 + 80));
}

uint64_t sub_25DF0C94C()
{
  return swift_deallocObject();
}

uint64_t sub_25DF0C98C()
{
  return swift_deallocObject();
}

uint64_t sub_25DF0C9B8()
{
  return swift_deallocObject();
}

uint64_t sub_25DF0C9E4()
{
  return swift_deallocObject();
}

uint64_t sub_25DF0CA24()
{
  return swift_deallocObject();
}

uint64_t sub_25DF0CA64()
{
  return swift_deallocObject();
}

uint64_t sub_25DF0CA90()
{
  return swift_deallocObject();
}

uint64_t sub_25DF0CABC()
{
  return swift_deallocObject();
}

uint64_t sub_25DF0CAFC()
{
  return swift_deallocObject();
}

uint64_t sub_25DF0CB3C()
{
  return swift_deallocObject();
}

uint64_t sub_25DF0CB68()
{
  return swift_deallocObject();
}

uint64_t sub_25DF0CB94()
{
  return swift_deallocObject();
}

uint64_t sub_25DF0CBD4()
{
  return swift_deallocObject();
}

uint64_t sub_25DF0CC14()
{
  return swift_deallocObject();
}

uint64_t sub_25DF0CC54()
{
  _Block_release(*(const void **)(v0 + 24));
  return swift_deallocObject();
}

uint64_t partial apply for @objc closure #1 in GetBloodPressureIntentHandler.handle(intent:)()
{
  uint64_t v5 = v1;
  *(void *)(v1 + 16) = v1;
  uint64_t v8 = (void *)v0[2];
  id v6 = (const void *)v0[3];
  os_signpost_id_t v7 = (void *)v0[4];
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v5 + 24) = v2;
  *uint64_t v2 = *(void *)(v5 + 16);
  v2[1] = _sIeghH_IeAgH_TRTQ0_;
  uint64_t v3 = async function pointer to @objc closure #1 in GetBloodPressureIntentHandler.handle(intent:);
  return ((uint64_t (*)(void *, const void *, void *))((char *)&async function pointer to @objc closure #1 in GetBloodPressureIntentHandler.handle(intent:)
                                                               + v3))(v8, v6, v7);
}

uint64_t ObjC metadata update function for GetBloodPressureIntentHandler()
{
  return type metadata accessor for GetBloodPressureIntentHandler();
}

uint64_t type metadata accessor for GetBloodPressureIntentHandler()
{
  uint64_t v1 = type metadata singleton initialization cache for GetBloodPressureIntentHandler;
  if (!type metadata singleton initialization cache for GetBloodPressureIntentHandler) {
    return swift_getSingletonMetadata();
  }
  return v1;
}

uint64_t type metadata completion function for GetBloodPressureIntentHandler()
{
  uint64_t updated = type metadata accessor for OSSignposter();
  if (v0 <= 0x3F)
  {
    uint64_t updated = swift_updateClassMetadata2();
    if (!updated) {
      return 0;
    }
  }
  return updated;
}

unint64_t type metadata accessor for HKCorrelationQuery()
{
  uint64_t v2 = lazy cache variable for type metadata for HKCorrelationQuery;
  if (!lazy cache variable for type metadata for HKCorrelationQuery)
  {
    self;
    unint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&lazy cache variable for type metadata for HKCorrelationQuery);
    return ObjCClassMetadata;
  }
  return v2;
}

uint64_t sub_25DF0CF78()
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<GetBloodPressureIntentResponse, Error>);
  uint64_t v4 = *(void *)(v3 - 8);
  unint64_t v2 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  unint64_t v5 = (v2 + *(void *)(v4 + 64) + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v8 = type metadata accessor for OSSignpostID();
  uint64_t v6 = *(void *)(v8 - 8);
  unint64_t v7 = (v5 + 8 + *(unsigned __int8 *)(v6 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  unint64_t v9 = (((v7 + *(void *)(v6 + 64) + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v10 = (((v9 + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8;
  (*(void (**)(unint64_t, uint64_t))(v4 + 8))(v0 + v2, v3);

  (*(void (**)(unint64_t, uint64_t))(v6 + 8))(v0 + v7, v8);
  swift_bridgeObjectRelease();

  swift_release();
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in closure #1 in GetBloodPressureIntentHandler.handle(intent:)(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v9 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<GetBloodPressureIntentResponse, Error>)
                 - 8);
  unint64_t v12 = (*(unsigned __int8 *)(v9 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  unint64_t v10 = (v12 + *(void *)(v9 + 64) + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v4 = type metadata accessor for OSSignpostID();
  unint64_t v5 = (v10 + 8 + *(unsigned __int8 *)(*(void *)(v4 - 8) + 80)) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v4 - 8) + 80);
  unint64_t v6 = (v5 + *(void *)(*(void *)(v4 - 8) + 64) + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v7 = (v6 + 15) & 0xFFFFFFFFFFFFFFF8;
  return closure #1 in closure #1 in GetBloodPressureIntentHandler.handle(intent:)(a1, a2, a3, v3 + v12, *(void *)(v3 + v10), v3 + v5, *(void *)(v3 + v6), *(void **)(v3 + v7), *(void *)(v3 + ((v7 + 15) & 0xFFFFFFFFFFFFFFF8)), *(void **)(v3 + ((((v7 + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8)), *(void **)(v3+ ((((((v7 + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8)));
}

uint64_t block_copy_helper_6(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 32);
  uint64_t v5 = *(void *)(a2 + 40);
  swift_retain();
  uint64_t result = a1;
  *(void *)(a1 + 32) = v4;
  *(void *)(a1 + 40) = v5;
  return result;
}

uint64_t block_destroy_helper_6()
{
  return swift_release();
}

unint64_t type metadata accessor for HKSampleType()
{
  uint64_t v2 = lazy cache variable for type metadata for HKSampleType;
  if (!lazy cache variable for type metadata for HKSampleType)
  {
    self;
    unint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&lazy cache variable for type metadata for HKSampleType);
    return ObjCClassMetadata;
  }
  return v2;
}

unint64_t type metadata accessor for NSPredicate()
{
  uint64_t v2 = lazy cache variable for type metadata for NSPredicate;
  if (!lazy cache variable for type metadata for NSPredicate)
  {
    self;
    unint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&lazy cache variable for type metadata for NSPredicate);
    return ObjCClassMetadata;
  }
  return v2;
}

unint64_t lazy protocol witness table accessor for type HKSampleType and conformance NSObject()
{
  uint64_t v2 = lazy protocol witness table cache variable for type HKSampleType and conformance NSObject;
  if (!lazy protocol witness table cache variable for type HKSampleType and conformance NSObject)
  {
    type metadata accessor for HKSampleType();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type HKSampleType and conformance NSObject);
    return WitnessTable;
  }
  return v2;
}

uint64_t partial apply for closure #1 in closure #1 in closure #1 in GetBloodPressureIntentHandler.handle(intent:)(void **a1)
{
  return closure #1 in closure #1 in closure #1 in GetBloodPressureIntentHandler.handle(intent:)(a1, *(void *)(v1 + 16), *(void **)(v1 + 24), *(void *)(v1 + 32), *(void **)(v1 + 40));
}

uint64_t sub_25DF0D654()
{
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #1 in closure #1 in closure #1 in GetBloodPressureIntentHandler.handle(intent:)()
{
  return implicit closure #1 in closure #1 in closure #1 in GetBloodPressureIntentHandler.handle(intent:)();
}

uint64_t sub_25DF0D69C()
{
  return swift_deallocObject();
}

uint64_t sub_25DF0D6C8()
{
  return swift_deallocObject();
}

uint64_t sub_25DF0D6F4()
{
  return swift_deallocObject();
}

uint64_t sub_25DF0D734()
{
  return swift_deallocObject();
}

char *keypath_get_selector_systolicMinimum()
{
  return sel_systolicMinimum;
}

void sub_25DF0D780(id *a1@<X0>, void *a2@<X8>)
{
}

void sub_25DF0D798(double *a1, id *a2)
{
}

char *keypath_get_selector_systolicMaximum()
{
  return sel_systolicMaximum;
}

void sub_25DF0D7BC(id *a1@<X0>, void *a2@<X8>)
{
}

void sub_25DF0D7D4(double *a1, id *a2)
{
}

char *keypath_get_selector_systolic()
{
  return sel_systolic;
}

void sub_25DF0D7F8(id *a1@<X0>, void *a2@<X8>)
{
}

void sub_25DF0D810(double *a1, id *a2)
{
}

char *keypath_get_selector_diastolicMinimum()
{
  return sel_diastolicMinimum;
}

void sub_25DF0D834(id *a1@<X0>, void *a2@<X8>)
{
}

void sub_25DF0D84C(double *a1, id *a2)
{
}

char *keypath_get_selector_diastolicMaximum()
{
  return sel_diastolicMaximum;
}

void sub_25DF0D870(id *a1@<X0>, void *a2@<X8>)
{
}

void sub_25DF0D888(double *a1, id *a2)
{
}

char *keypath_get_selector_diastolic()
{
  return sel_diastolic;
}

void sub_25DF0D8AC(id *a1@<X0>, void *a2@<X8>)
{
}

void sub_25DF0D8C4(double *a1, id *a2)
{
}

void *HealthKitCategoryProvider.init(store:identifier:categoryEnum:failure:mapIntent:)@<X0>(void *a1@<X0>, void *a2@<X1>, void *a3@<X3>, void *a4@<X4>, void *a5@<X5>, void *a6@<X6>, void *a7@<X7>, void *a8@<X8>, void *a9)
{
  memset(__b, 0, 0x30uLL);
  __b[7] = a7;
  __b[6] = a9;
  id v9 = a1;
  id v10 = a1;
  __b[1] = a1;
  type metadata accessor for HKCategoryType();
  id v11 = a2;
  id v18 = (id)MEMORY[0x2611C8CD0](a2);
  id v12 = v18;
  __b[0] = v18;
  swift_retain();
  swift_retain();
  __b[2] = a3;
  __b[3] = a4;
  swift_retain();
  swift_retain();
  __b[4] = a5;
  __b[5] = a6;
  id v13 = v18;
  id v14 = a1;
  swift_retain();
  swift_retain();
  swift_release();
  swift_release();

  swift_release();
  swift_release();

  outlined destroy of HealthKitCategoryProvider<A, B>(__b);
  uint64_t result = a1;
  *a8 = v18;
  a8[1] = a1;
  a8[2] = a3;
  a8[3] = a4;
  a8[4] = a5;
  a8[5] = a6;
  return result;
}

unint64_t type metadata accessor for HKCategoryType()
{
  uint64_t v2 = lazy cache variable for type metadata for HKCategoryType;
  if (!lazy cache variable for type metadata for HKCategoryType)
  {
    self;
    unint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&lazy cache variable for type metadata for HKCategoryType);
    return ObjCClassMetadata;
  }
  return v2;
}

id *outlined destroy of HealthKitCategoryProvider<A, B>(id *a1)
{
  swift_release();
  swift_release();
  return a1;
}

uint64_t HealthKitCategoryProvider.isQueryAuthorized()()
{
  v1[2] = v1;
  v1[3] = 0;
  v1[3] = v0;
  unint64_t v6 = *(void **)(v0 + 8);
  v1[4] = v6;
  id v2 = v6;
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v5 + 40) = v3;
  *uint64_t v3 = *(void *)(v5 + 16);
  v3[1] = CycleTrackingFetcher.isReadingAuthorized();
  return isSiriAuthorizedToAccessHealthData(store:)((uint64_t)v6);
}

uint64_t HealthKitCategoryProvider.query(start:end:)(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  v5[8] = v4;
  v5[7] = a1;
  v5[2] = v5;
  v5[3] = 0;
  v5[4] = 0;
  v5[5] = 0;
  v5[6] = 0;
  uint64_t v20 = a4[3];
  v5[9] = v20;
  v5[10] = type metadata accessor for Date();
  v5[11] = swift_getTupleTypeMetadata2();
  v5[12] = type metadata accessor for Optional();
  v5[13] = swift_task_alloc();
  uint64_t v6 = a4[2];
  v5[14] = v6;
  v5[15] = *(void *)(v6 - 8);
  v5[16] = swift_task_alloc();
  v5[17] = swift_getTupleTypeMetadata2();
  v5[18] = type metadata accessor for Optional();
  v5[19] = swift_task_alloc();
  uint64_t v21 = swift_task_alloc();
  v5[20] = v21;
  v5[3] = a2;
  v5[4] = a3;
  v5[5] = v4;
  uint64_t v7 = *(void **)(v4 + 8);
  v5[21] = v7;
  id v8 = v7;
  id v9 = *v14;
  uint64_t v17 = (uint64_t)*v14;
  v5[22] = *v14;
  id v10 = v9;
  id v11 = (void *)swift_task_alloc();
  *(void *)(v16 + 184) = v11;
  uint64_t v12 = a4[4];
  *id v11 = *(void *)(v16 + 16);
  v11[1] = HealthKitCategoryProvider.query(start:end:);
  return HKHealthStore.query<A>(categoryType:start:end:enumerationType:)(v21, v17, a2, a3, v20, v20, v12);
}

uint64_t HealthKitCategoryProvider.query(start:end:)()
{
  uint64_t v5 = *v1;
  *(void *)(v5 + 16) = *v1;
  *(void *)(v5 + 192) = v0;
  swift_task_dealloc();
  if (v0)
  {
    id v2 = HealthKitCategoryProvider.query(start:end:);
  }
  else
  {
    uint64_t v4 = *(void **)(v5 + 168);

    id v2 = HealthKitCategoryProvider.query(start:end:);
  }
  return MEMORY[0x270FA2498](v2, 0);
}

{
  void *v0;
  uint64_t v1;
  uint64_t (*v2)(void);
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void (*v21)(void);
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;

  uint64_t v22 = (char *)v0[20];
  uint64_t v26 = (char *)v0[19];
  id v24 = v0[18];
  id v25 = v0[17];
  id v23 = v0[9];
  uint64_t v1 = v0[8];
  v0[2] = v0;
  uint64_t v21 = *(void (**)(void))(v1 + 32);
  swift_retain();
  outlined init with copy of (value: B, startDate: Date)?(v22, v26, v23, v25, v24);
  if ((*(unsigned int (**)(char *, uint64_t))(*(void *)(v25 - 8) + 48))(v26, 1) == 1)
  {
    uint64_t v5 = v20[13];
    uint64_t v4 = v20[11];
    outlined destroy of (value: B, startDate: Date)?(v20[19], v20[9], v20[17]);
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 56))(v5, 1);
  }
  else
  {
    uint64_t v19 = v20[13];
    id v18 = v20[11];
    uint64_t v16 = v20[10];
    uint64_t v15 = v20[19] + *(int *)(v20[17] + 48);
    uint64_t v17 = v19 + *(int *)(v18 + 48);
    (*(void (**)(void))(*(void *)(v20[9] - 8) + 32))();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v16 - 8) + 32))(v17, v15);
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v18 - 8) + 56))(v19, 0, 1);
  }
  uint64_t v12 = v20[20];
  id v14 = v20[17];
  id v11 = v20[16];
  id v10 = v20[14];
  uint64_t v6 = v20[13];
  uint64_t v7 = v20[11];
  id v13 = v20[9];
  id v9 = v20[7];
  id v8 = v20[15];
  v21();
  outlined destroy of (value: B, startDate: Date)?(v6, v13, v7);
  swift_release();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(v9, v11, v10);
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v11, v10);
  outlined destroy of (value: B, startDate: Date)?(v12, v13, v14);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  id v2 = *(uint64_t (**)(void))(v20[2] + 8);
  return v2();
}

{
  void *v0;
  void *v1;
  id v2;
  uint64_t v3;
  uint64_t (*v4)(void);
  id v6;
  uint64_t v7;
  void (*v8)(uint64_t);
  id v9;
  uint64_t v10;

  id v9 = (id)v0[24];
  uint64_t v1 = (void *)v0[22];
  uint64_t v6 = (id)v0[21];
  uint64_t v7 = v0[8];
  v0[2] = v0;

  id v2 = v9;
  v0[6] = v9;
  id v8 = *(void (**)(uint64_t))(v7 + 16);
  uint64_t v3 = swift_retain();
  v8(v3);
  swift_release();

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = *(uint64_t (**)(void))(v0[2] + 8);
  return v4();
}

char *outlined init with copy of (value: B, startDate: Date)?(char *a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v14 = *(void *)(a4 - 8);
  if ((*(unsigned int (**)(char *, uint64_t))(v14 + 48))(a1, 1))
  {
    memcpy(a2, a1, *(void *)(*(void *)(a5 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *))(*(void *)(a3 - 8) + 16))(a2, a1);
    id v8 = &a2[*(int *)(a4 + 48)];
    uint64_t v7 = &a1[*(int *)(a4 + 48)];
    uint64_t v5 = type metadata accessor for Date();
    (*(void (**)(char *, char *))(*(void *)(v5 - 8) + 16))(v8, v7);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v14 + 56))(a2, 0, 1, a4);
  }
  return a2;
}

uint64_t outlined destroy of (value: B, startDate: Date)?(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!(*(unsigned int (**)(uint64_t, uint64_t))(*(void *)(a3 - 8) + 48))(a1, 1))
  {
    (*(void (**)(uint64_t))(*(void *)(a2 - 8) + 8))(a1);
    uint64_t v5 = a1 + *(int *)(a3 + 48);
    uint64_t v3 = type metadata accessor for Date();
    (*(void (**)(uint64_t))(*(void *)(v3 - 8) + 8))(v5);
  }
  return a1;
}

uint64_t protocol witness for DataProviding.isQueryAuthorized() in conformance HealthKitCategoryProvider<A, B>()
{
  *(void *)(v1 + 64) = v1;
  memcpy((void *)(v1 + 16), v0, 0x30uLL);
  id v2 = (void *)swift_task_alloc();
  *(void *)(v4 + 72) = v2;
  *id v2 = *(void *)(v4 + 64);
  v2[1] = protocol witness for DataProviding.isQueryAuthorized() in conformance HealthKitDistanceProvider<A>;
  return HealthKitCategoryProvider.isQueryAuthorized()();
}

uint64_t protocol witness for DataProviding.isLoggingAuthorized() in conformance HealthKitCategoryProvider<A, B>()
{
  *(void *)(v1 + 64) = v1;
  memcpy((void *)(v1 + 16), v0, 0x30uLL);
  id v2 = (void *)swift_task_alloc();
  *(void *)(v4 + 72) = v2;
  *id v2 = *(void *)(v4 + 64);
  v2[1] = protocol witness for DataProviding.isQueryAuthorized() in conformance HealthKitDistanceProvider<A>;
  return HealthKitCategoryProvider.isQueryAuthorized()();
}

uint64_t type metadata instantiation function for HealthKitCategoryProvider()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t destroy for HealthKitCategoryProvider(id *a1)
{
  swift_release();
  return swift_release();
}

void *initializeWithCopy for HealthKitCategoryProvider(void *a1, uint64_t a2)
{
  id v5 = *(id *)a2;
  id v2 = *(id *)a2;
  *a1 = v5;
  uint64_t v6 = *(void **)(a2 + 8);
  id v3 = v6;
  a1[1] = v6;
  uint64_t v7 = *(void *)(a2 + 16);
  uint64_t v8 = *(void *)(a2 + 24);
  swift_retain();
  a1[2] = v7;
  a1[3] = v8;
  uint64_t v11 = *(void *)(a2 + 32);
  uint64_t v12 = *(void *)(a2 + 40);
  swift_retain();
  uint64_t result = a1;
  a1[4] = v11;
  a1[5] = v12;
  return result;
}

uint64_t assignWithCopy for HealthKitCategoryProvider(uint64_t a1, uint64_t a2)
{
  id v7 = *(id *)a2;
  id v2 = *(id *)a2;
  id v3 = *(void **)a1;
  *(void *)a1 = v7;

  uint64_t v8 = *(void **)(a2 + 8);
  id v4 = v8;
  id v5 = *(void **)(a1 + 8);
  *(void *)(a1 + 8) = v8;

  uint64_t v9 = *(void *)(a2 + 16);
  uint64_t v10 = *(void *)(a2 + 24);
  swift_retain();
  *(void *)(a1 + 16) = v9;
  *(void *)(a1 + 24) = v10;
  swift_release();
  uint64_t v12 = *(void *)(a2 + 32);
  uint64_t v13 = *(void *)(a2 + 40);
  swift_retain();
  *(void *)(a1 + 32) = v12;
  *(void *)(a1 + 40) = v13;
  swift_release();
  return a1;
}

uint64_t assignWithTake for HealthKitCategoryProvider(uint64_t a1, void *a2)
{
  id v2 = *(void **)a1;
  *(void *)a1 = *a2;

  id v3 = *(void **)(a1 + 8);
  *(void *)(a1 + 8) = a2[1];

  uint64_t v4 = a2[3];
  *(void *)(a1 + 16) = a2[2];
  *(void *)(a1 + 24) = v4;
  swift_release();
  uint64_t v5 = a2[5];
  *(void *)(a1 + 32) = a2[4];
  *(void *)(a1 + 40) = v5;
  swift_release();
  return a1;
}

uint64_t type metadata accessor for HealthKitCategoryProvider()
{
  return __swift_instantiateGenericMetadata();
}

SiriWellnessIntents::WellnessVerb_optional __swiftcall WellnessVerb.init(rawValue:)(Swift::String rawValue)
{
  uint64_t v1 = _allocateUninitializedArray<A>(_:)();
  *(void *)uint64_t v2 = "askQuestion";
  *(void *)(v2 + 8) = 11;
  *(unsigned char *)(v2 + 16) = 2;
  *(void *)(v2 + 24) = "delete";
  *(void *)(v2 + 32) = 6;
  *(unsigned char *)(v2 + 40) = 2;
  *(void *)(v2 + 48) = "save";
  *(void *)(v2 + 56) = 4;
  *(unsigned char *)(v2 + 64) = 2;
  _finalizeUninitializedArray<A>(_:)();
  Swift::Int v6 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)v1, rawValue);
  swift_bridgeObjectRelease();
  switch(v6)
  {
    case 0:
      v7.value = SiriWellnessIntents_WellnessVerb_askQuestion;
LABEL_8:
      swift_bridgeObjectRelease();
      return v7;
    case 1:
      v7.value = SiriWellnessIntents_WellnessVerb_delete;
      goto LABEL_8;
    case 2:
      v7.value = SiriWellnessIntents_WellnessVerb_save;
      goto LABEL_8;
  }
  swift_bridgeObjectRelease();
  return (SiriWellnessIntents::WellnessVerb_optional)3;
}

uint64_t static WellnessVerb.allCases.getter()
{
  uint64_t result = _allocateUninitializedArray<A>(_:)();
  unsigned char *v1 = 0;
  v1[1] = 1;
  v1[2] = 2;
  _finalizeUninitializedArray<A>(_:)();
  return result;
}

uint64_t WellnessVerb.rawValue.getter(char a1)
{
  if (!a1) {
    return String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("askQuestion", 0xBuLL, 1)._countAndFlagsBits;
  }
  if (a1 == 1) {
    return String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("delete", 6uLL, 1)._countAndFlagsBits;
  }
  else {
    return String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("save", 4uLL, 1)._countAndFlagsBits;
  }
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance WellnessVerb()
{
  return == infix<A>(_:_:)() & 1;
}

unint64_t base witness table accessor for Equatable in WellnessVerb()
{
  return lazy protocol witness table accessor for type WellnessVerb and conformance WellnessVerb();
}

unint64_t lazy protocol witness table accessor for type WellnessVerb and conformance WellnessVerb()
{
  uint64_t v2 = lazy protocol witness table cache variable for type WellnessVerb and conformance WellnessVerb;
  if (!lazy protocol witness table cache variable for type WellnessVerb and conformance WellnessVerb)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type WellnessVerb and conformance WellnessVerb);
    return WitnessTable;
  }
  return v2;
}

{
  unint64_t WitnessTable;
  uint64_t v2;

  uint64_t v2 = lazy protocol witness table cache variable for type WellnessVerb and conformance WellnessVerb;
  if (!lazy protocol witness table cache variable for type WellnessVerb and conformance WellnessVerb)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type WellnessVerb and conformance WellnessVerb);
    return WitnessTable;
  }
  return v2;
}

uint64_t protocol witness for Hashable.hashValue.getter in conformance WellnessVerb()
{
  return RawRepresentable<>.hashValue.getter();
}

uint64_t protocol witness for Hashable.hash(into:) in conformance WellnessVerb()
{
  return RawRepresentable<>.hash(into:)();
}

uint64_t protocol witness for Hashable._rawHashValue(seed:) in conformance WellnessVerb()
{
  return RawRepresentable<>._rawHashValue(seed:)();
}

SiriWellnessIntents::WellnessVerb_optional protocol witness for RawRepresentable.init(rawValue:) in conformance WellnessVerb@<W0>(Swift::String *a1@<X0>, SiriWellnessIntents::WellnessVerb_optional *a2@<X8>)
{
  result.value = WellnessVerb.init(rawValue:)(*a1).value;
  a2->value = result.value;
  return result;
}

uint64_t protocol witness for RawRepresentable.rawValue.getter in conformance WellnessVerb@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = WellnessVerb.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v3;
  return result;
}

unint64_t associated type witness table accessor for CaseIterable.AllCases : Collection in WellnessVerb()
{
  return lazy protocol witness table accessor for type [WellnessVerb] and conformance [A]();
}

unint64_t lazy protocol witness table accessor for type [WellnessVerb] and conformance [A]()
{
  uint64_t v2 = lazy protocol witness table cache variable for type [WellnessVerb] and conformance [A];
  if (!lazy protocol witness table cache variable for type [WellnessVerb] and conformance [A])
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [WellnessVerb]);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type [WellnessVerb] and conformance [A]);
    return WitnessTable;
  }
  return v2;
}

uint64_t protocol witness for static CaseIterable.allCases.getter in conformance WellnessVerb@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = static WellnessVerb.allCases.getter();
  *a1 = result;
  return result;
}

ValueMetadata *type metadata accessor for WellnessVerb()
{
  return &type metadata for WellnessVerb;
}

id DeleteHealthSampleIntentHandler.__allocating_init(storage:)(void *a1)
{
  id v2 = objc_allocWithZone(v1);
  return DeleteHealthSampleIntentHandler.init(storage:)(a1);
}

id DeleteHealthSampleIntentHandler.init(storage:)(void *a1)
{
  ObjectType = (objc_class *)swift_getObjectType();
  __dst[5] = a1;
  id v2 = v1;
  id v13 = v1;
  outlined init with copy of QuantityPersisting?(a1, v11);
  if (v11[3])
  {
    outlined init with take of QuantityPersisting(v11, __dst);
  }
  else
  {
    v3.store.super.Class isa = CycleTrackingFetcher.init()().store.super.isa;
    __dst[3] = &type metadata for HealthSampleDeleter;
    __dst[4] = &protocol witness table for HealthSampleDeleter;
    __dst[0] = v3.store.super.isa;
    outlined destroy of QuantityPersisting?((uint64_t)v11);
  }
  outlined init with take of QuantityPersisting(__dst, &v7[OBJC_IVAR____TtC19SiriWellnessIntents31DeleteHealthSampleIntentHandler_storage]);

  v10.receiver = v13;
  v10.super_class = ObjectType;
  id v6 = objc_msgSendSuper2(&v10, sel_init);
  id v4 = v6;
  id v13 = v6;
  outlined destroy of QuantityPersisting?((uint64_t)a1);

  return v6;
}

uint64_t DeleteHealthSampleIntentHandler.handle(intent:)(uint64_t a1)
{
  v2[19] = v1;
  v2[18] = a1;
  v2[10] = v2;
  v2[11] = 0;
  v2[12] = 0;
  uint64_t v3 = type metadata accessor for Logger();
  v2[20] = v3;
  v2[21] = *(void *)(v3 - 8);
  v2[22] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UUID?);
  v2[23] = swift_task_alloc();
  uint64_t v4 = type metadata accessor for UUID();
  v2[24] = v4;
  v2[25] = *(void *)(v4 - 8);
  v2[26] = swift_task_alloc();
  v2[27] = swift_task_alloc();
  v2[11] = a1;
  v2[12] = v1;
  return MEMORY[0x270FA2498](DeleteHealthSampleIntentHandler.handle(intent:), 0);
}

{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;

  uint64_t v3 = *v1;
  *(void *)(v3 + 80) = *v1;
  *(void *)(v3 + 232) = a1;
  swift_task_dealloc();
  return MEMORY[0x270FA2498](DeleteHealthSampleIntentHandler.handle(intent:), 0);
}

uint64_t DeleteHealthSampleIntentHandler.handle(intent:)()
{
  uint64_t v1 = *(void **)(v0 + 144);
  *(void *)(v0 + 80) = v0;
  id v32 = objc_msgSend(v1, sel_sampleIdentifier);
  if (v32)
  {
    uint64_t v28 = *(void *)(v31 + 208);
    uint64_t v29 = *(void *)(v31 + 192);
    uint64_t v30 = *(void *)(v31 + 184);
    uint64_t v27 = *(void *)(v31 + 200);
    static UUID._unconditionallyBridgeFromObjectiveC(_:)();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v27 + 32))(v30, v28, v29);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v27 + 56))(v30, 0, 1, v29);
  }
  else
  {
    (*(void (**)(void, uint64_t, uint64_t, void))(*(void *)(v31 + 200) + 56))(*(void *)(v31 + 184), 1, 1, *(void *)(v31 + 192));
  }
  if ((*(unsigned int (**)(void, uint64_t, void))(*(void *)(v31 + 200) + 48))(*(void *)(v31 + 184), 1, *(void *)(v31 + 192)) == 1)
  {
    uint64_t v5 = *(void *)(v31 + 176);
    uint64_t v18 = *(void *)(v31 + 160);
    uint64_t v16 = *(void *)(v31 + 168);
    outlined destroy of UUID?(*(void *)(v31 + 184));
    uint64_t v17 = Logger.wellnessIntents.unsafeMutableAddressor();
    swift_beginAccess();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v16 + 16))(v5, v17, v18);
    swift_endAccess();
    uint64_t v21 = Logger.logObject.getter();
    os_log_type_t v20 = static os_log_type_t.error.getter();
    *(void *)(v31 + 104) = 2;
    lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    lazy protocol witness table accessor for type Int and conformance Int();
    UnsignedInteger<>.init<A>(_:)();
    uint32_t v19 = *(_DWORD *)(v31 + 240);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
    uint64_t v22 = _allocateUninitializedArray<A>(_:)();
    if (os_log_type_enabled(v21, v20))
    {
      buf = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
      uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      uint64_t v13 = createStorage<A>(capacity:type:)(0);
      uint64_t v14 = createStorage<A>(capacity:type:)(0);
      *(void *)(v31 + 112) = buf;
      *(void *)(v31 + 120) = v13;
      *(void *)(v31 + 128) = v14;
      serialize(_:at:)(0, (unsigned char **)(v31 + 112));
      serialize(_:at:)(0, (unsigned char **)(v31 + 112));
      *(void *)(v31 + 136) = v22;
      uint64_t v15 = (void *)swift_task_alloc();
      v15[2] = v31 + 112;
      v15[3] = v31 + 120;
      v15[4] = v31 + 128;
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
      lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
      Sequence.forEach(_:)();
      swift_task_dealloc();
      _os_log_impl(&dword_25DE00000, v21, v20, "Missing sampleIdentifier. Aborting delete.", buf, v19);
      destroyStorage<A>(_:count:)(v13, 0, v11);
      destroyStorage<A>(_:count:)(v14, 0, MEMORY[0x263F8EE58] + 8);
      MEMORY[0x2611C8D90](buf, MEMORY[0x263F8E778]);
    }
    swift_bridgeObjectRelease();
    uint64_t v8 = *(void *)(v31 + 176);
    uint64_t v9 = *(void *)(v31 + 160);
    uint64_t v7 = *(void *)(v31 + 168);

    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v8, v9);
    type metadata accessor for DeleteHealthSampleIntentResponse();
    objc_super v10 = DeleteHealthSampleIntentResponse.__allocating_init(code:userActivity:)(5, 0);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    id v6 = *(uint64_t (**)(char *))(*(void *)(v31 + 80) + 8);
    return v6(v10);
  }
  else
  {
    uint64_t v23 = *(void *)(v31 + 152);
    (*(void (**)(void, void, void))(*(void *)(v31 + 200) + 32))(*(void *)(v31 + 216), *(void *)(v31 + 184), *(void *)(v31 + 192));
    outlined init with copy of QuantityPersisting(v23 + OBJC_IVAR____TtC19SiriWellnessIntents31DeleteHealthSampleIntentHandler_storage, v31 + 16);
    uint64_t v24 = *(void *)(v31 + 40);
    uint64_t v25 = *(void *)(v31 + 48);
    __swift_project_boxed_opaque_existential_1((void *)(v31 + 16), v24);
    uint64_t v26 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(v25 + 8) + **(int **)(v25 + 8));
    id v2 = (void *)swift_task_alloc();
    *(void *)(v31 + 224) = v2;
    *id v2 = *(void *)(v31 + 80);
    v2[1] = DeleteHealthSampleIntentHandler.handle(intent:);
    uint64_t v3 = *(void *)(v31 + 216);
    return v26(v3, v24, v25);
  }
}

{
  void *v0;
  uint64_t (*v1)(uint64_t);
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  uint64_t v4 = v0[27];
  uint64_t v3 = v0[25];
  uint64_t v5 = v0[24];
  v0[10] = v0;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 2));
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v4, v5);
  id v6 = v0[29];
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(uint64_t))(v0[10] + 8);
  return v1(v6);
}

uint64_t @objc closure #1 in DeleteHealthSampleIntentHandler.handle(intent:)(void *a1, const void *a2, void *a3)
{
  v3[4] = a3;
  v3[3] = a1;
  v3[2] = v3;
  id v5 = a1;
  v3[5] = _Block_copy(a2);
  id v6 = a3;
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v10 + 48) = v7;
  *uint64_t v7 = *(void *)(v10 + 16);
  v7[1] = @objc closure #1 in LogQuantityIntentHandler.handle(intent:);
  return DeleteHealthSampleIntentHandler.handle(intent:)((uint64_t)a1);
}

id DeleteHealthSampleIntentHandler.__allocating_init()()
{
  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

uint64_t DeleteHealthSampleIntentHandler.init()()
{
  if (!"SiriWellnessIntents.DeleteHealthSampleIntentHandler")
  {
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  uint64_t result = closure #1 in _unimplementedInitializer(className:initName:file:line:column:)((uint64_t)"SiriWellnessIntents.DeleteHealthSampleIntentHandler", 51, (unint64_t)"init()", 6, 2, (unint64_t)"SiriWellnessIntents/DeleteHealthSampleIntentHandler.swift", 57, 2, v1, 0xEuLL, 0x14uLL);
  __break(1u);
  return result;
}

id DeleteHealthSampleIntentHandler.__deallocating_deinit()
{
  uint64_t v3 = v0;
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t HealthSampleDeleter.delete(sampleIdentifier:)(uint64_t a1, uint64_t a2)
{
  v2[46] = a2;
  v2[45] = a1;
  v2[27] = v2;
  v2[28] = 0;
  v2[29] = 0;
  v2[33] = 0;
  v2[36] = 0;
  uint64_t v3 = type metadata accessor for UUID();
  v2[47] = v3;
  uint64_t v6 = *(void *)(v3 - 8);
  v2[48] = v6;
  v2[49] = *(void *)(v6 + 64);
  v2[50] = swift_task_alloc();
  uint64_t v4 = type metadata accessor for Logger();
  v2[51] = v4;
  v2[52] = *(void *)(v4 - 8);
  v2[53] = swift_task_alloc();
  v2[54] = swift_task_alloc();
  v2[55] = swift_task_alloc();
  v2[56] = swift_task_alloc();
  v2[28] = a1;
  v2[29] = a2;
  return MEMORY[0x270FA2498](HealthSampleDeleter.delete(sampleIdentifier:), 0);
}

uint64_t HealthSampleDeleter.delete(sampleIdentifier:)()
{
  uint64_t v59 = v0;
  uint64_t v1 = *(void *)(v0 + 448);
  uint64_t v34 = *(void *)(v0 + 416);
  uint64_t v36 = *(void *)(v0 + 408);
  uint64_t v42 = *(void *)(v0 + 400);
  uint64_t v40 = *(void *)(v0 + 384);
  uint64_t v43 = *(void *)(v0 + 376);
  uint64_t v38 = *(void *)(v0 + 360);
  *(void *)(v0 + 216) = v0;
  uint64_t v35 = Logger.wellnessIntents.unsafeMutableAddressor();
  swift_beginAccess();
  uint64_t v37 = *(void (**)(uint64_t, uint64_t, uint64_t))(v34 + 16);
  *(void *)(v0 + 456) = v37;
  *(void *)(v0 + 464) = (v34 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  v37(v1, v35, v36);
  swift_endAccess();
  unint64_t v39 = *(void (**)(uint64_t, uint64_t, uint64_t))(v40 + 16);
  v39(v42, v38, v43);
  unint64_t v41 = (*(unsigned __int8 *)(v40 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v40 + 80);
  uint64_t v44 = swift_allocObject();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v40 + 32))(v44 + v41, v42, v43);
  swift_retain();
  uint64_t v46 = swift_allocObject();
  *(void *)(v46 + 16) = partial apply for implicit closure #1 in MedsUndoer.convertMatchedMedNamesToDoseEvents(matchingMeds:);
  *(void *)(v46 + 24) = v44;
  swift_release();
  uint64_t v52 = Logger.logObject.getter();
  os_log_type_t v53 = static os_log_type_t.debug.getter();
  *(void *)(v0 + 240) = 12;
  *(void *)(v0 + 472) = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  *(void *)(v0 + 480) = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  *(void *)(v0 + 488) = lazy protocol witness table accessor for type Int and conformance Int();
  UnsignedInteger<>.init<A>(_:)();
  uint32_t v45 = *(_DWORD *)(v0 + 544);
  uint64_t v48 = swift_allocObject();
  *(unsigned char *)(v48 + 16) = 32;
  uint64_t v49 = swift_allocObject();
  *(unsigned char *)(v49 + 16) = 8;
  uint64_t v47 = swift_allocObject();
  *(void *)(v47 + 16) = implicit closure #1 in OSLogInterpolation.appendInterpolation<A>(_:align:privacy:)partial apply;
  *(void *)(v47 + 24) = v46;
  uint64_t v50 = swift_allocObject();
  *(void *)(v50 + 16) = partial apply for implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:);
  *(void *)(v50 + 24) = v47;
  *(void *)(v0 + 496) = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
  _allocateUninitializedArray<A>(_:)();
  unint64_t v51 = v2;
  swift_retain();
  *unint64_t v51 = partial apply for closure #1 in OSLogArguments.append(_:);
  v51[1] = v48;
  swift_retain();
  v51[2] = partial apply for closure #1 in OSLogArguments.append(_:);
  v51[3] = v49;
  swift_retain();
  v51[4] = partial apply for closure #1 in OSLogArguments.append(_:);
  v51[5] = v50;
  _finalizeUninitializedArray<A>(_:)();
  swift_bridgeObjectRelease();
  if (os_log_type_enabled(v52, v53))
  {
    buf = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
    uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    uint64_t v31 = createStorage<A>(capacity:type:)(0);
    uint64_t v32 = createStorage<A>(capacity:type:)(1);
    uint64_t v54 = buf;
    uint64_t v55 = v31;
    uint64_t v56 = v32;
    serialize(_:at:)(2, &v54);
    serialize(_:at:)(1, &v54);
    id v57 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
    uint64_t v58 = v48;
    closure #1 in osLogInternal(_:log:type:)(&v57, (uint64_t)&v54, (uint64_t)&v55, (uint64_t)&v56);
    id v57 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
    uint64_t v58 = v49;
    closure #1 in osLogInternal(_:log:type:)(&v57, (uint64_t)&v54, (uint64_t)&v55, (uint64_t)&v56);
    id v57 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
    uint64_t v58 = v50;
    closure #1 in osLogInternal(_:log:type:)(&v57, (uint64_t)&v54, (uint64_t)&v55, (uint64_t)&v56);
    _os_log_impl(&dword_25DE00000, v52, v53, "Starting to delete health sample with UUID: %s", buf, v45);
    destroyStorage<A>(_:count:)(v31, 0, v29);
    destroyStorage<A>(_:count:)(v32, 1, MEMORY[0x263F8EE58] + 8);
    MEMORY[0x2611C8D90](buf, MEMORY[0x263F8E778]);
    swift_release();
    swift_release();
    swift_release();
  }
  else
  {
    swift_release();
    swift_release();
    swift_release();
  }
  uint64_t v20 = *(void *)(v33 + 448);
  uint64_t v3 = *(void *)(v33 + 440);
  uint64_t v23 = *(void *)(v33 + 408);
  uint64_t v19 = *(void *)(v33 + 416);

  uint64_t v21 = *(void (**)(uint64_t, uint64_t))(v19 + 8);
  *(void *)(v33 + 504) = v21;
  *(void *)(v33 + 512) = (v19 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v21(v20, v23);
  uint64_t v22 = Logger.wellnessIntents.unsafeMutableAddressor();
  swift_beginAccess();
  v37(v3, v22, v23);
  swift_endAccess();
  oslog = Logger.logObject.getter();
  os_log_type_t v25 = static os_log_type_t.debug.getter();
  *(void *)(v33 + 248) = 2;
  UnsignedInteger<>.init<A>(_:)();
  uint32_t size = *(_DWORD *)(v33 + 548);
  uint64_t v27 = _allocateUninitializedArray<A>(_:)();
  if (os_log_type_enabled(oslog, v25))
  {
    uint64_t v15 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    uint64_t v16 = createStorage<A>(capacity:type:)(0);
    uint64_t v17 = createStorage<A>(capacity:type:)(0);
    *(void *)(v33 + 328) = v15;
    *(void *)(v33 + 336) = v16;
    *(void *)(v33 + 344) = v17;
    serialize(_:at:)(0, (unsigned char **)(v33 + 328));
    serialize(_:at:)(0, (unsigned char **)(v33 + 328));
    *(void *)(v33 + 352) = v27;
    uint64_t v18 = (void *)swift_task_alloc();
    v18[2] = v33 + 328;
    v18[3] = v33 + 336;
    v18[4] = v33 + 344;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
    lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
    Sequence.forEach(_:)();
    swift_task_dealloc();
    _os_log_impl(&dword_25DE00000, oslog, v25, "Asking store to delete", v15, size);
    destroyStorage<A>(_:count:)(v16, 0, v14);
    destroyStorage<A>(_:count:)(v17, 0, MEMORY[0x263F8EE58] + 8);
    MEMORY[0x2611C8D90](v15, MEMORY[0x263F8E778]);
  }
  swift_bridgeObjectRelease();
  *(void *)(v33 + 520) = 0;
  uint64_t v7 = *(void *)(v33 + 440);
  uint64_t v8 = *(void *)(v33 + 408);
  uint64_t v10 = *(void *)(v33 + 376);
  id v13 = *(id *)(v33 + 368);
  uint64_t v9 = *(void *)(v33 + 360);

  v21(v7, v8);
  id v4 = v13;
  _allocateUninitializedArray<A>(_:)();
  v39(v5, v9, v10);
  _finalizeUninitializedArray<A>(_:)();
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  *(void *)(v33 + 528) = isa;
  swift_bridgeObjectRelease();
  type metadata accessor for HKDeleteObjectOptions();
  _allocateUninitializedArray<A>(_:)();
  lazy protocol witness table accessor for type HKDeleteObjectOptions and conformance HKDeleteObjectOptions();
  SetAlgebra<>.init(arrayLiteral:)();
  uint64_t v12 = *(void *)(v33 + 256);
  *(void *)(v33 + 16) = *(void *)(v33 + 216);
  *(void *)(v33 + 56) = v28;
  *(void *)(v33 + 24) = HealthSampleDeleter.delete(sampleIdentifier:);
  *(void *)(v33 + 112) = swift_continuation_init();
  *(void *)(v33 + 80) = MEMORY[0x263EF8330];
  *(_DWORD *)(v33 + 88) = 0x40000000;
  *(_DWORD *)(v33 + 92) = 0;
  *(void *)(v33 + 96) = @objc completion handler block implementation for @escaping @callee_unowned @convention(block) @Sendable (@unowned Bool, @unowned NSError?) -> () with result type () zero on error;
  *(void *)(v33 + 104) = &block_descriptor_6;
  objc_msgSend(v13, sel_deleteObjectsWithUUIDs_options_completion_, isa, v12);
  return __swift_continuation_await_point();
}

{
  void *v0;
  uint64_t v1;
  uint64_t (*v2)();
  void *v4;
  uint64_t v5;

  id v4 = (void *)*v0;
  v4[27] = *v0;
  uint64_t v1 = v4[6];
  v4[67] = v1;
  if (v1)
  {
    objc_super v2 = HealthSampleDeleter.delete(sampleIdentifier:);
  }
  else
  {
    objc_super v2 = HealthSampleDeleter.delete(sampleIdentifier:);
  }
  return MEMORY[0x270FA2498](v2, 0);
}

{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t result;
  uint64_t (*v5)(char *);
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t);
  char *v9;
  uint64_t v10;
  uint8_t *buf;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, uint64_t, uint64_t);
  uint32_t v20;
  os_log_type_t v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;

  uint64_t v16 = *(id *)(v0 + 528);
  uint64_t v19 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 456);
  uint64_t v1 = *(void *)(v0 + 432);
  uint64_t v18 = *(void *)(v0 + 408);
  objc_super v2 = *(void **)(v0 + 368);
  *(void *)(v0 + 216) = v0;

  uint64_t v17 = Logger.wellnessIntents.unsafeMutableAddressor();
  swift_beginAccess();
  v19(v1, v17, v18);
  swift_endAccess();
  uint64_t v22 = Logger.logObject.getter();
  uint64_t v21 = static os_log_type_t.debug.getter();
  *(void *)(v0 + 280) = 2;
  UnsignedInteger<>.init<A>(_:)();
  uint64_t v20 = *(_DWORD *)(v0 + 556);
  uint64_t v23 = _allocateUninitializedArray<A>(_:)();
  if (os_log_type_enabled(v22, v21))
  {
    uint64_t v3 = *(void *)(v15 + 520);
    buf = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
    uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    uint64_t v12 = createStorage<A>(capacity:type:)(0);
    id v13 = createStorage<A>(capacity:type:)(0);
    *(void *)(v15 + 296) = buf;
    *(void *)(v15 + 304) = v12;
    *(void *)(v15 + 312) = v13;
    serialize(_:at:)(0, (unsigned char **)(v15 + 296));
    serialize(_:at:)(0, (unsigned char **)(v15 + 296));
    *(void *)(v15 + 320) = v23;
    uint64_t v14 = (void *)swift_task_alloc();
    v14[2] = v15 + 296;
    v14[3] = v15 + 304;
    v14[4] = v15 + 312;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
    lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
    uint64_t result = Sequence.forEach(_:)();
    if (v3) {
      return result;
    }
    swift_task_dealloc();
    _os_log_impl(&dword_25DE00000, v22, v21, "Successfully deleted sample. Returning success response.", buf, v20);
    destroyStorage<A>(_:count:)(v12, 0, v10);
    destroyStorage<A>(_:count:)(v13, 0, MEMORY[0x263F8EE58] + 8);
    MEMORY[0x2611C8D90](buf, MEMORY[0x263F8E778]);
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  uint64_t v8 = *(void (**)(uint64_t, uint64_t))(v15 + 504);
  uint64_t v6 = *(void *)(v15 + 432);
  uint64_t v7 = *(void *)(v15 + 408);

  v8(v6, v7);
  type metadata accessor for DeleteHealthSampleIntentResponse();
  uint64_t v9 = DeleteHealthSampleIntentResponse.__allocating_init(code:userActivity:)(4, 0);
  *(void *)(v15 + 288) = v9;
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(char *))(*(void *)(v15 + 216) + 8);
  return v5(v9);
}

{
  uint64_t v0;
  id v1;
  id v2;
  void *v3;
  uint64_t (*v4)(char *);
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t);
  id v9;
  char *v10;
  uint64_t v11;
  uint8_t *buf;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, uint64_t, uint64_t);
  id v22;
  uint32_t size;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  NSObject *v30;
  os_log_type_t v31;
  uint8_t *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t, uint64_t);
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;

  uint64_t v37 = v0;
  uint64_t v22 = *(id *)(v0 + 536);
  uint64_t v18 = *(id *)(v0 + 528);
  uint64_t v21 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 456);
  uint64_t v16 = *(void *)(v0 + 424);
  uint64_t v20 = *(void *)(v0 + 408);
  uint64_t v17 = *(id *)(v0 + 368);
  *(void *)(v0 + 216) = v0;
  swift_willThrow();

  uint64_t v1 = v22;
  *(void *)(v0 + 264) = v22;
  uint64_t v19 = Logger.wellnessIntents.unsafeMutableAddressor();
  swift_beginAccess();
  v21(v16, v19, v20);
  swift_endAccess();
  objc_super v2 = v22;
  uint64_t v24 = swift_allocObject();
  *(void *)(v24 + 16) = v22;
  uint64_t v30 = Logger.logObject.getter();
  uint64_t v31 = static os_log_type_t.error.getter();
  *(void *)(v0 + 272) = 12;
  UnsignedInteger<>.init<A>(_:)();
  uint32_t size = *(_DWORD *)(v0 + 552);
  uint64_t v26 = swift_allocObject();
  *(unsigned char *)(v26 + 16) = 32;
  uint64_t v27 = swift_allocObject();
  *(unsigned char *)(v27 + 16) = 8;
  os_log_type_t v25 = swift_allocObject();
  *(void *)(v25 + 16) = partial apply for implicit closure #5 in HealthKitPersistor.save(quantityIdentifier:value:units:);
  *(void *)(v25 + 24) = v24;
  uint64_t v28 = swift_allocObject();
  *(void *)(v28 + 16) = partial apply for implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:);
  *(void *)(v28 + 24) = v25;
  _allocateUninitializedArray<A>(_:)();
  uint64_t v29 = v3;
  swift_retain();
  uint8_t *v29 = partial apply for closure #1 in OSLogArguments.append(_:);
  v29[1] = v26;
  swift_retain();
  v29[2] = partial apply for closure #1 in OSLogArguments.append(_:);
  v29[3] = v27;
  swift_retain();
  v29[4] = partial apply for closure #1 in OSLogArguments.append(_:);
  v29[5] = v28;
  _finalizeUninitializedArray<A>(_:)();
  swift_bridgeObjectRelease();
  if (os_log_type_enabled(v30, v31))
  {
    buf = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    id v13 = createStorage<A>(capacity:type:)(0);
    uint64_t v14 = createStorage<A>(capacity:type:)(1);
    uint64_t v32 = buf;
    uint64_t v33 = v13;
    uint64_t v34 = v14;
    serialize(_:at:)(2, &v32);
    serialize(_:at:)(1, &v32);
    uint64_t v35 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
    uint64_t v36 = v26;
    closure #1 in osLogInternal(_:log:type:)(&v35, (uint64_t)&v32, (uint64_t)&v33, (uint64_t)&v34);
    uint64_t v35 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
    uint64_t v36 = v27;
    closure #1 in osLogInternal(_:log:type:)(&v35, (uint64_t)&v32, (uint64_t)&v33, (uint64_t)&v34);
    uint64_t v35 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
    uint64_t v36 = v28;
    closure #1 in osLogInternal(_:log:type:)(&v35, (uint64_t)&v32, (uint64_t)&v33, (uint64_t)&v34);
    _os_log_impl(&dword_25DE00000, v30, v31, "Failed to delete sample. Error: %s", buf, size);
    destroyStorage<A>(_:count:)(v13, 0, v11);
    destroyStorage<A>(_:count:)(v14, 1, MEMORY[0x263F8EE58] + 8);
    MEMORY[0x2611C8D90](buf, MEMORY[0x263F8E778]);
    swift_release();
    swift_release();
    swift_release();
  }
  else
  {
    swift_release();
    swift_release();
    swift_release();
  }
  uint64_t v9 = (id)v15[67];
  uint64_t v8 = (void (*)(uint64_t, uint64_t))v15[63];
  uint64_t v6 = v15[53];
  uint64_t v7 = v15[51];

  v8(v6, v7);
  type metadata accessor for DeleteHealthSampleIntentResponse();
  uint64_t v10 = DeleteHealthSampleIntentResponse.__allocating_init(code:userActivity:)(5, 0);

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  id v4 = *(uint64_t (**)(char *))(v15[27] + 8);
  return v4(v10);
}

uint64_t protocol witness for HealthSampleDeleting.delete(sampleIdentifier:) in conformance HealthSampleDeleter(uint64_t a1)
{
  uint64_t v5 = v2;
  *(void *)(v2 + 16) = v2;
  uint64_t v6 = *v1;
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v5 + 24) = v3;
  *uint64_t v3 = *(void *)(v5 + 16);
  v3[1] = protocol witness for QuantityPersisting.save(quantityIdentifier:value:units:) in conformance HealthKitPersistor;
  return HealthSampleDeleter.delete(sampleIdentifier:)(a1, v6);
}

uint64_t sub_25DF11E54()
{
  _Block_release(*(const void **)(v0 + 24));
  return swift_deallocObject();
}

uint64_t partial apply for @objc closure #1 in DeleteHealthSampleIntentHandler.handle(intent:)()
{
  uint64_t v5 = v1;
  *(void *)(v1 + 16) = v1;
  uint64_t v8 = (void *)v0[2];
  uint64_t v6 = (const void *)v0[3];
  uint64_t v7 = (void *)v0[4];
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v5 + 24) = v2;
  *uint64_t v2 = *(void *)(v5 + 16);
  v2[1] = _sIeghH_IeAgH_TRTQ0_;
  uint64_t v3 = async function pointer to @objc closure #1 in DeleteHealthSampleIntentHandler.handle(intent:);
  return ((uint64_t (*)(void *, const void *, void *))((char *)&async function pointer to @objc closure #1 in DeleteHealthSampleIntentHandler.handle(intent:)
                                                               + v3))(v8, v6, v7);
}

uint64_t sub_25DF11F90()
{
  uint64_t v2 = *(void *)(type metadata accessor for UUID() - 8);
  (*(void (**)(unint64_t))(v2 + 8))(v0 + ((*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80)));
  return swift_deallocObject();
}

uint64_t sub_25DF1205C()
{
  return swift_deallocObject();
}

uint64_t sub_25DF1209C()
{
  return swift_deallocObject();
}

uint64_t sub_25DF120C8()
{
  return swift_deallocObject();
}

uint64_t sub_25DF120F4()
{
  return swift_deallocObject();
}

uint64_t sub_25DF12134()
{
  return swift_deallocObject();
}

uint64_t sub_25DF12174()
{
  return swift_deallocObject();
}

uint64_t sub_25DF121B4()
{
  return swift_deallocObject();
}

uint64_t sub_25DF121E0()
{
  return swift_deallocObject();
}

uint64_t sub_25DF1220C()
{
  return swift_deallocObject();
}

uint64_t sub_25DF1224C()
{
  return swift_deallocObject();
}

uint64_t type metadata accessor for DeleteHealthSampleIntentHandler()
{
  return self;
}

ValueMetadata *type metadata accessor for HealthSampleDeleter()
{
  return &type metadata for HealthSampleDeleter;
}

id MedStorageHelper.__allocating_init(storage:)(void *a1)
{
  id v2 = objc_allocWithZone(v1);
  return MedStorageHelper.init(storage:)(a1);
}

id MedStorageHelper.init(storage:)(void *a1)
{
  ObjectType = (objc_class *)swift_getObjectType();
  __dst[5] = a1;
  id v2 = v1;
  id v14 = v1;
  outlined init with copy of QuantityPersisting?(a1, v12);
  if (v12[3])
  {
    outlined init with take of QuantityPersisting(v12, __dst);
  }
  else
  {
    id v3 = MedsUndoer.init()();
    __dst[3] = &type metadata for SpecificMedicationsPersistor;
    __dst[4] = &protocol witness table for SpecificMedicationsPersistor;
    __dst[0] = v3;
    __dst[1] = v4;
    outlined destroy of QuantityPersisting?((uint64_t)v12);
  }
  outlined init with take of QuantityPersisting(__dst, &v8[OBJC_IVAR____TtC19SiriWellnessIntents16MedStorageHelper_storage]);

  v11.receiver = v14;
  v11.super_class = ObjectType;
  id v7 = objc_msgSendSuper2(&v11, sel_init);
  id v5 = v7;
  id v14 = v7;
  outlined destroy of QuantityPersisting?((uint64_t)a1);

  return v7;
}

uint64_t MedStorageHelper.sampleScheduleIDFor(dateInterval:)(uint64_t a1)
{
  v2[28] = v1;
  v2[27] = a1;
  v2[19] = v2;
  v2[20] = 0;
  v2[21] = 0;
  uint64_t v3 = type metadata accessor for Logger();
  v2[29] = v3;
  v2[30] = *(void *)(v3 - 8);
  v2[31] = swift_task_alloc();
  v2[20] = a1;
  v2[21] = v1;
  return MEMORY[0x270FA2498](MedStorageHelper.sampleScheduleIDFor(dateInterval:), 0);
}

uint64_t MedStorageHelper.sampleScheduleIDFor(dateInterval:)()
{
  uint64_t v1 = v0[28];
  v0[19] = v0;
  outlined init with copy of QuantityPersisting(v1 + OBJC_IVAR____TtC19SiriWellnessIntents16MedStorageHelper_storage, (uint64_t)(v0 + 2));
  uint64_t v7 = v0[5];
  uint64_t v5 = v0[6];
  __swift_project_boxed_opaque_existential_1(v0 + 2, v7);
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(v5 + 8) + **(int **)(v5 + 8));
  id v2 = (void *)swift_task_alloc();
  *(void *)(v4 + 256) = v2;
  *id v2 = *(void *)(v4 + 152);
  v2[1] = MedStorageHelper.sampleScheduleIDFor(dateInterval:);
  return v6(v7, v5);
}

{
  uint64_t v0;
  uint64_t v1;
  Swift::String v2;
  uint64_t (*v3)(uint64_t, void *);
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint8_t *buf;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint32_t v21;
  os_log_type_t v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  uint64_t v27;

  uint64_t v26 = *(unsigned char *)(v0 + 292);
  *(void *)(v0 + 152) = v0;
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  if (v26)
  {
    outlined init with copy of QuantityPersisting(*(void *)(v25 + 224) + OBJC_IVAR____TtC19SiriWellnessIntents16MedStorageHelper_storage, v25 + 56);
    uint64_t v7 = *(void *)(v25 + 80);
    uint64_t v8 = *(void *)(v25 + 88);
    __swift_project_boxed_opaque_existential_1((void *)(v25 + 56), v7);
    uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 + 48) + **(int **)(v8 + 48));
    uint64_t v5 = (void *)swift_task_alloc();
    *(void *)(v25 + 264) = v5;
    *uint64_t v5 = *(void *)(v25 + 152);
    v5[1] = MedStorageHelper.sampleScheduleIDFor(dateInterval:);
    uint64_t v6 = *(void *)(v25 + 216);
    return v9(v6, v7, v8);
  }
  else
  {
    uint64_t v1 = *(void *)(v25 + 248);
    uint64_t v20 = *(void *)(v25 + 232);
    uint64_t v18 = *(void *)(v25 + 240);
    uint64_t v19 = Logger.wellnessIntents.unsafeMutableAddressor();
    swift_beginAccess();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v18 + 16))(v1, v19, v20);
    swift_endAccess();
    uint64_t v23 = Logger.logObject.getter();
    uint64_t v22 = static os_log_type_t.debug.getter();
    *(void *)(v25 + 176) = 2;
    lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    lazy protocol witness table accessor for type Int and conformance Int();
    UnsignedInteger<>.init<A>(_:)();
    uint64_t v21 = *(_DWORD *)(v25 + 288);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
    uint64_t v24 = _allocateUninitializedArray<A>(_:)();
    if (os_log_type_enabled(v23, v22))
    {
      buf = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
      id v13 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      uint64_t v15 = createStorage<A>(capacity:type:)(0);
      uint64_t v16 = createStorage<A>(capacity:type:)(0);
      *(void *)(v25 + 184) = buf;
      *(void *)(v25 + 192) = v15;
      *(void *)(v25 + 200) = v16;
      serialize(_:at:)(0, (unsigned char **)(v25 + 184));
      serialize(_:at:)(0, (unsigned char **)(v25 + 184));
      *(void *)(v25 + 208) = v24;
      uint64_t v17 = (void *)swift_task_alloc();
      v17[2] = v25 + 184;
      v17[3] = v25 + 192;
      v17[4] = v25 + 200;
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
      lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
      Sequence.forEach(_:)();
      swift_task_dealloc();
      _os_log_impl(&dword_25DE00000, v23, v22, "MedStorageHelper is not authorized to read meds data, returning empty string", buf, v21);
      destroyStorage<A>(_:count:)(v15, 0, v13);
      destroyStorage<A>(_:count:)(v16, 0, MEMORY[0x263F8EE58] + 8);
      MEMORY[0x2611C8D90](buf, MEMORY[0x263F8E778]);
    }
    swift_bridgeObjectRelease();
    objc_super v11 = *(void *)(v25 + 248);
    uint64_t v12 = *(void *)(v25 + 232);
    uint64_t v10 = *(void *)(v25 + 240);

    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v11, v12);
    id v2 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("", 0, 1);
    swift_task_dealloc();
    uint64_t v3 = *(uint64_t (**)(uint64_t, void *))(*(void *)(v25 + 152) + 8);
    return v3(v2._countAndFlagsBits, v2._object);
  }
}

{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(uint64_t, uint64_t);
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;

  uint64_t v1 = v0[35];
  id v2 = v0[34];
  v0[19] = v0;
  v0[17] = v2;
  v0[18] = v1;
  if (v0[18])
  {
    uint64_t v3 = v8[18];
    v8[15] = v8[17];
    v8[16] = v3;
  }
  else
  {
    *(Swift::String *)(v8 + 15) = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("", 0, 1);
    outlined destroy of String.UTF8View();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v8 + 7));
  uint64_t v6 = v8[15];
  uint64_t v7 = v8[16];
  swift_task_dealloc();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(v8[19] + 8);
  return v4(v6, v7);
}

uint64_t MedStorageHelper.sampleScheduleIDFor(dateInterval:)(char a1)
{
  uint64_t v3 = *v1;
  *(void *)(v3 + 152) = *v1;
  *(unsigned char *)(v3 + 292) = a1;
  swift_task_dealloc();
  return MEMORY[0x270FA2498](MedStorageHelper.sampleScheduleIDFor(dateInterval:), 0);
}

uint64_t MedStorageHelper.sampleScheduleIDFor(dateInterval:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (void *)*v2;
  v4[19] = *v2;
  v4[34] = a1;
  v4[35] = a2;
  swift_task_dealloc();
  return MEMORY[0x270FA2498](MedStorageHelper.sampleScheduleIDFor(dateInterval:), 0);
}

uint64_t MedStorageHelper.displayNameFor(identifier:)(uint64_t a1, uint64_t a2)
{
  v3[30] = v2;
  v3[29] = a2;
  v3[28] = a1;
  v3[21] = v3;
  v3[15] = 0;
  v3[16] = 0;
  v3[22] = 0;
  uint64_t v4 = type metadata accessor for Logger();
  v3[31] = v4;
  v3[32] = *(void *)(v4 - 8);
  v3[33] = swift_task_alloc();
  v3[15] = a1;
  v3[16] = a2;
  v3[22] = v2;
  return MEMORY[0x270FA2498](MedStorageHelper.displayNameFor(identifier:), 0);
}

{
  void *v2;
  void *v4;
  uint64_t v5;

  uint64_t v4 = (void *)*v2;
  v4[21] = *v2;
  v4[36] = a1;
  v4[37] = a2;
  swift_task_dealloc();
  return MEMORY[0x270FA2498](MedStorageHelper.displayNameFor(identifier:), 0);
}

uint64_t MedStorageHelper.displayNameFor(identifier:)()
{
  uint64_t v1 = v0[30];
  v0[21] = v0;
  outlined init with copy of QuantityPersisting(v1 + OBJC_IVAR____TtC19SiriWellnessIntents16MedStorageHelper_storage, (uint64_t)(v0 + 2));
  uint64_t v7 = v0[5];
  uint64_t v5 = v0[6];
  __swift_project_boxed_opaque_existential_1(v0 + 2, v7);
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(v5 + 8) + **(int **)(v5 + 8));
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v4 + 272) = v2;
  *uint64_t v2 = *(void *)(v4 + 168);
  v2[1] = MedStorageHelper.displayNameFor(identifier:);
  return v6(v7, v5);
}

{
  uint64_t v0;
  uint64_t v1;
  Swift::String v2;
  uint64_t (*v3)(uint64_t, void *);
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint8_t *buf;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint32_t v22;
  os_log_type_t v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  uint64_t v28;

  uint64_t v27 = *(unsigned char *)(v0 + 308);
  *(void *)(v0 + 168) = v0;
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  if (v27)
  {
    outlined init with copy of QuantityPersisting(*(void *)(v26 + 240) + OBJC_IVAR____TtC19SiriWellnessIntents16MedStorageHelper_storage, v26 + 56);
    uint64_t v8 = *(void *)(v26 + 80);
    uint64_t v9 = *(void *)(v26 + 88);
    __swift_project_boxed_opaque_existential_1((void *)(v26 + 56), v8);
    uint64_t v10 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v9 + 40) + **(int **)(v9 + 40));
    uint64_t v5 = (void *)swift_task_alloc();
    *(void *)(v26 + 280) = v5;
    *uint64_t v5 = *(void *)(v26 + 168);
    v5[1] = MedStorageHelper.displayNameFor(identifier:);
    uint64_t v6 = *(void *)(v26 + 232);
    uint64_t v7 = *(void *)(v26 + 224);
    return v10(v7, v6, v8, v9);
  }
  else
  {
    uint64_t v1 = *(void *)(v26 + 264);
    uint64_t v21 = *(void *)(v26 + 248);
    uint64_t v19 = *(void *)(v26 + 256);
    uint64_t v20 = Logger.wellnessIntents.unsafeMutableAddressor();
    swift_beginAccess();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v19 + 16))(v1, v20, v21);
    swift_endAccess();
    uint64_t v24 = Logger.logObject.getter();
    uint64_t v23 = static os_log_type_t.debug.getter();
    *(void *)(v26 + 184) = 2;
    lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    lazy protocol witness table accessor for type Int and conformance Int();
    UnsignedInteger<>.init<A>(_:)();
    uint64_t v22 = *(_DWORD *)(v26 + 304);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
    os_log_type_t v25 = _allocateUninitializedArray<A>(_:)();
    if (os_log_type_enabled(v24, v23))
    {
      buf = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
      id v14 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      uint64_t v16 = createStorage<A>(capacity:type:)(0);
      uint64_t v17 = createStorage<A>(capacity:type:)(0);
      *(void *)(v26 + 192) = buf;
      *(void *)(v26 + 200) = v16;
      *(void *)(v26 + 208) = v17;
      serialize(_:at:)(0, (unsigned char **)(v26 + 192));
      serialize(_:at:)(0, (unsigned char **)(v26 + 192));
      *(void *)(v26 + 216) = v25;
      uint64_t v18 = (void *)swift_task_alloc();
      v18[2] = v26 + 192;
      v18[3] = v26 + 200;
      v18[4] = v26 + 208;
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
      lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
      Sequence.forEach(_:)();
      swift_task_dealloc();
      _os_log_impl(&dword_25DE00000, v24, v23, "SpecificMedStorageHelper is not authorized to read meds data, returning empty string", buf, v22);
      destroyStorage<A>(_:count:)(v16, 0, v14);
      destroyStorage<A>(_:count:)(v17, 0, MEMORY[0x263F8EE58] + 8);
      MEMORY[0x2611C8D90](buf, MEMORY[0x263F8E778]);
    }
    swift_bridgeObjectRelease();
    uint64_t v12 = *(void *)(v26 + 264);
    id v13 = *(void *)(v26 + 248);
    objc_super v11 = *(void *)(v26 + 256);

    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v12, v13);
    uint64_t v2 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("", 0, 1);
    swift_task_dealloc();
    uint64_t v3 = *(uint64_t (**)(uint64_t, void *))(*(void *)(v26 + 168) + 8);
    return v3(v2._countAndFlagsBits, v2._object);
  }
}

{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(uint64_t, uint64_t);
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;

  uint64_t v1 = v0[37];
  uint64_t v2 = v0[36];
  v0[21] = v0;
  v0[19] = v2;
  v0[20] = v1;
  if (v0[20])
  {
    uint64_t v3 = v8[20];
    v8[17] = v8[19];
    v8[18] = v3;
  }
  else
  {
    *(Swift::String *)(v8 + 17) = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("", 0, 1);
    outlined destroy of String.UTF8View();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v8 + 7));
  uint64_t v6 = v8[17];
  uint64_t v7 = v8[18];
  swift_task_dealloc();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(v8[21] + 8);
  return v4(v6, v7);
}

uint64_t MedStorageHelper.displayNameFor(identifier:)(char a1)
{
  uint64_t v3 = *v1;
  *(void *)(v3 + 168) = *v1;
  *(unsigned char *)(v3 + 308) = a1;
  swift_task_dealloc();
  return MEMORY[0x270FA2498](MedStorageHelper.displayNameFor(identifier:), 0);
}

uint64_t MedStorageHelper.buildMatchedMedName(from:shouldIncludeAsNeededParams:)(uint64_t a1, char a2)
{
  *(void *)(v3 + 192) = v2;
  *(unsigned char *)(v3 + 249) = a2 & 1;
  *(void *)(v3 + 184) = a1;
  *(void *)(v3 + 120) = v3;
  *(void *)(v3 + 128) = 0;
  *(unsigned char *)(v3 + 248) = 0;
  *(void *)(v3 + 136) = 0;
  uint64_t v4 = type metadata accessor for Logger();
  *(void *)(v3 + 200) = v4;
  *(void *)(v3 + 208) = *(void *)(v4 - 8);
  *(void *)(v3 + 216) = swift_task_alloc();
  *(void *)(v3 + 128) = a1;
  *(unsigned char *)(v3 + 248) = a2 & 1;
  *(void *)(v3 + 136) = v2;
  return MEMORY[0x270FA2498](MedStorageHelper.buildMatchedMedName(from:shouldIncludeAsNeededParams:), 0);
}

uint64_t MedStorageHelper.buildMatchedMedName(from:shouldIncludeAsNeededParams:)()
{
  uint64_t v1 = v0[24];
  v0[15] = v0;
  outlined init with copy of QuantityPersisting(v1 + OBJC_IVAR____TtC19SiriWellnessIntents16MedStorageHelper_storage, (uint64_t)(v0 + 2));
  uint64_t v7 = v0[5];
  uint64_t v5 = v0[6];
  __swift_project_boxed_opaque_existential_1(v0 + 2, v7);
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(v5 + 8) + **(int **)(v5 + 8));
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v4 + 224) = v2;
  *uint64_t v2 = *(void *)(v4 + 120);
  v2[1] = MedStorageHelper.buildMatchedMedName(from:shouldIncludeAsNeededParams:);
  return v6(v7, v5);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(void);
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint8_t *buf;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint32_t v21;
  os_log_type_t v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  uint64_t v27;

  uint64_t v26 = *(unsigned char *)(v0 + 250);
  *(void *)(v0 + 120) = v0;
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  if (v26)
  {
    outlined init with copy of QuantityPersisting(*(void *)(v25 + 192) + OBJC_IVAR____TtC19SiriWellnessIntents16MedStorageHelper_storage, v25 + 56);
    uint64_t v7 = *(void *)(v25 + 80);
    uint64_t v8 = *(void *)(v25 + 88);
    __swift_project_boxed_opaque_existential_1((void *)(v25 + 56), v7);
    uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v8 + 56) + **(int **)(v8 + 56));
    uint64_t v4 = (void *)swift_task_alloc();
    *(void *)(v25 + 232) = v4;
    *uint64_t v4 = *(void *)(v25 + 120);
    v4[1] = MedStorageHelper.buildMatchedMedName(from:shouldIncludeAsNeededParams:);
    uint64_t v5 = *(void *)(v25 + 184);
    uint64_t v6 = *(unsigned char *)(v25 + 249) & 1;
    return v9(v5, v6, v7, v8);
  }
  else
  {
    uint64_t v1 = *(void *)(v25 + 216);
    uint64_t v20 = *(void *)(v25 + 200);
    uint64_t v18 = *(void *)(v25 + 208);
    uint64_t v19 = Logger.wellnessIntents.unsafeMutableAddressor();
    swift_beginAccess();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v18 + 16))(v1, v19, v20);
    swift_endAccess();
    uint64_t v23 = Logger.logObject.getter();
    uint64_t v22 = static os_log_type_t.debug.getter();
    *(void *)(v25 + 144) = 2;
    lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    lazy protocol witness table accessor for type Int and conformance Int();
    UnsignedInteger<>.init<A>(_:)();
    uint64_t v21 = *(_DWORD *)(v25 + 252);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
    uint64_t v24 = _allocateUninitializedArray<A>(_:)();
    if (os_log_type_enabled(v23, v22))
    {
      buf = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
      id v13 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      uint64_t v15 = createStorage<A>(capacity:type:)(0);
      uint64_t v16 = createStorage<A>(capacity:type:)(0);
      *(void *)(v25 + 152) = buf;
      *(void *)(v25 + 160) = v15;
      *(void *)(v25 + 168) = v16;
      serialize(_:at:)(0, (unsigned char **)(v25 + 152));
      serialize(_:at:)(0, (unsigned char **)(v25 + 152));
      *(void *)(v25 + 176) = v24;
      uint64_t v17 = (void *)swift_task_alloc();
      v17[2] = v25 + 152;
      v17[3] = v25 + 160;
      v17[4] = v25 + 168;
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
      lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
      Sequence.forEach(_:)();
      swift_task_dealloc();
      _os_log_impl(&dword_25DE00000, v23, v22, "MedStorageHelper is not authorized to read meds data, returning empty string", buf, v21);
      destroyStorage<A>(_:count:)(v15, 0, v13);
      destroyStorage<A>(_:count:)(v16, 0, MEMORY[0x263F8EE58] + 8);
      MEMORY[0x2611C8D90](buf, MEMORY[0x263F8E778]);
    }
    swift_bridgeObjectRelease();
    objc_super v11 = *(void *)(v25 + 216);
    uint64_t v12 = *(void *)(v25 + 200);
    uint64_t v10 = *(void *)(v25 + 208);

    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v11, v12);
    swift_task_dealloc();
    uint64_t v2 = *(uint64_t (**)(void))(*(void *)(v25 + 120) + 8);
    return v2(0);
  }
}

{
  uint64_t v0;
  uint64_t (*v1)(uint64_t);
  uint64_t v3;
  uint64_t v4;

  uint64_t v3 = *(void *)(v0 + 240);
  *(void *)(v0 + 120) = v0;
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(uint64_t))(*(void *)(v0 + 120) + 8);
  return v1(v3);
}

uint64_t MedStorageHelper.buildMatchedMedName(from:shouldIncludeAsNeededParams:)(char a1)
{
  uint64_t v3 = *v1;
  *(void *)(v3 + 120) = *v1;
  *(unsigned char *)(v3 + 250) = a1;
  swift_task_dealloc();
  return MEMORY[0x270FA2498](MedStorageHelper.buildMatchedMedName(from:shouldIncludeAsNeededParams:), 0);
}

uint64_t MedStorageHelper.buildMatchedMedName(from:shouldIncludeAsNeededParams:)(uint64_t a1)
{
  uint64_t v3 = *v1;
  *(void *)(v3 + 120) = *v1;
  *(void *)(v3 + 240) = a1;
  swift_task_dealloc();
  return MEMORY[0x270FA2498](MedStorageHelper.buildMatchedMedName(from:shouldIncludeAsNeededParams:), 0);
}

id MedStorageHelper.__allocating_init()()
{
  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

uint64_t MedStorageHelper.init()()
{
  if (!"SiriWellnessIntents.MedStorageHelper")
  {
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  uint64_t result = closure #1 in _unimplementedInitializer(className:initName:file:line:column:)((uint64_t)"SiriWellnessIntents.MedStorageHelper", 36, (unint64_t)"init()", 6, 2, (unint64_t)"SiriWellnessIntents/MedStorageHelper.swift", 42, 2, v1, 0x10uLL, 0x14uLL);
  __break(1u);
  return result;
}

id MedStorageHelper.__deallocating_deinit()
{
  uint64_t v3 = v0;
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t protocol witness for MedStorageHelping.displayNameFor(identifier:) in conformance MedStorageHelper(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = v2;
  *(void *)(v2 + 16) = v2;
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v5 + 24) = v3;
  *uint64_t v3 = *(void *)(v5 + 16);
  v3[1] = protocol witness for SpecificMedicationsPersisting.displayNameFor(identifier:) in conformance SpecificMedicationsPersistor;
  return MedStorageHelper.displayNameFor(identifier:)(a1, a2);
}

uint64_t protocol witness for MedStorageHelping.sampleScheduleIDFor(dateInterval:) in conformance MedStorageHelper(uint64_t a1)
{
  uint64_t v4 = v1;
  *(void *)(v1 + 16) = v1;
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v4 + 24) = v2;
  *uint64_t v2 = *(void *)(v4 + 16);
  v2[1] = protocol witness for SpecificMedicationsPersisting.displayNameFor(identifier:) in conformance SpecificMedicationsPersistor;
  return MedStorageHelper.sampleScheduleIDFor(dateInterval:)(a1);
}

uint64_t protocol witness for MedStorageHelping.buildMatchedMedName(from:shouldIncludeAsNeededParams:) in conformance MedStorageHelper(uint64_t a1, char a2)
{
  uint64_t v5 = v2;
  *(void *)(v2 + 16) = v2;
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v5 + 24) = v3;
  *uint64_t v3 = *(void *)(v5 + 16);
  v3[1] = protocol witness for QuantityPersisting.save(quantityIdentifier:value:units:) in conformance HealthKitPersistor;
  return MedStorageHelper.buildMatchedMedName(from:shouldIncludeAsNeededParams:)(a1, a2 & 1);
}

uint64_t type metadata accessor for MedStorageHelper()
{
  return self;
}

char *GetBloodPressureIntentResponse.__allocating_init(code:userActivity:)(uint64_t a1, void *a2)
{
  id v3 = objc_allocWithZone(v2);
  return GetBloodPressureIntentResponse.init(code:userActivity:)(a1, a2);
}

id GetBloodPressureIntent.__allocating_init()()
{
  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id GetBloodPressureIntent.init()()
{
  id v4 = 0;
  v3.receiver = 0;
  v3.super_class = (Class)type metadata accessor for GetBloodPressureIntent();
  id v2 = objc_msgSendSuper2(&v3, sel_init);
  id v0 = v2;
  id v4 = v2;

  return v2;
}

id GetBloodPressureIntent.__allocating_init(coder:)(void *a1)
{
  id v4 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v4;
}

id GetBloodPressureIntent.init(coder:)(void *a1)
{
  id v8 = 0;
  uint64_t v7 = a1;
  v6.receiver = 0;
  v6.super_class = (Class)type metadata accessor for GetBloodPressureIntent();
  id v5 = objc_msgSendSuper2(&v6, sel_initWithCoder_, a1);
  if (v5)
  {
    id v1 = v5;
    id v8 = v5;

    return v5;
  }
  else
  {

    return 0;
  }
}

id GetBloodPressureIntent.__allocating_init(identifier:backingStore:)(uint64_t a1, uint64_t a2, void *a3)
{
  id v11 = objc_allocWithZone(v3);
  if (a2)
  {
    uint64_t v6 = MEMORY[0x2611C8860](a1);
    swift_bridgeObjectRelease();
    uint64_t v7 = (void *)v6;
  }
  else
  {
    uint64_t v7 = 0;
  }
  id v5 = objc_msgSend(v11, sel_initWithIdentifier_backingStore_);

  return v5;
}

id GetBloodPressureIntent.init(identifier:backingStore:)(uint64_t a1, uint64_t a2, void *a3)
{
  id v15 = 0;
  uint64_t v13 = a1;
  uint64_t v14 = a2;
  uint64_t v12 = a3;
  swift_bridgeObjectRetain();
  if (a2)
  {
    uint64_t v6 = MEMORY[0x2611C8860](a1);
    swift_bridgeObjectRelease();
    uint64_t v7 = (void *)v6;
  }
  else
  {
    uint64_t v7 = 0;
  }
  v11.receiver = 0;
  v11.super_class = (Class)type metadata accessor for GetBloodPressureIntent();
  id v5 = objc_msgSendSuper2(&v11, sel_initWithIdentifier_backingStore_, v7, a3);

  id v3 = v5;
  id v15 = v5;

  swift_bridgeObjectRelease();
  return v5;
}

id GetBloodPressureIntent.__allocating_init(domain:verb:parametersByName:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v13 = objc_allocWithZone(v5);
  uint64_t v16 = (void *)MEMORY[0x2611C8860](a1, a2);
  uint64_t v18 = (void *)MEMORY[0x2611C8860](a3, a4);
  if (a5)
  {
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    id v6 = objc_msgSend(v13, sel_initWithDomain_verb_parametersByName_, v16, v18, isa);
  }
  else
  {
    id v6 = objc_msgSend(v13, sel_initWithDomain_verb_parametersByName_, v16, v18, 0);
  }
  id v9 = v6;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v9;
}

id GetBloodPressureIntent.init(domain:verb:parametersByName:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v23 = 0;
  uint64_t v21 = a1;
  uint64_t v22 = a2;
  uint64_t v19 = a3;
  uint64_t v20 = a4;
  uint64_t v18 = a5;
  swift_bridgeObjectRetain();
  id v12 = (id)MEMORY[0x2611C8860](a1, a2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  id v15 = (void *)MEMORY[0x2611C8860](a3, a4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  if (a5)
  {
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    Class v9 = isa;
  }
  else
  {
    Class v9 = 0;
  }
  v17.receiver = 0;
  v17.super_class = (Class)type metadata accessor for GetBloodPressureIntent();
  id v7 = objc_msgSendSuper2(&v17, sel_initWithDomain_verb_parametersByName_, v12, v15, v9);

  id v5 = v7;
  id v23 = v7;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return v7;
}

id GetBloodPressureIntent.__deallocating_deinit()
{
  id v3 = v0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for GetBloodPressureIntent();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t GetBloodPressureIntentResponseCode.init(rawValue:)(uint64_t a1)
{
  switch(a1)
  {
    case 0:
      return 0;
    case 1:
      return 1;
    case 2:
      return 2;
    case 3:
      return 3;
    case 4:
      return 4;
    case 5:
      return 5;
    case 6:
      return 6;
    case 100:
      return 100;
    case 101:
      return 101;
    case 102:
      return 102;
  }
  return 0;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance GetBloodPressureIntentResponseCode()
{
  return == infix<A>(_:_:)() & 1;
}

uint64_t protocol witness for Hashable.hashValue.getter in conformance GetBloodPressureIntentResponseCode()
{
  return RawRepresentable<>.hashValue.getter();
}

uint64_t protocol witness for Hashable.hash(into:) in conformance GetBloodPressureIntentResponseCode()
{
  return RawRepresentable<>.hash(into:)();
}

uint64_t protocol witness for Hashable._rawHashValue(seed:) in conformance GetBloodPressureIntentResponseCode()
{
  return RawRepresentable<>._rawHashValue(seed:)();
}

uint64_t protocol witness for RawRepresentable.init(rawValue:) in conformance GetBloodPressureIntentResponseCode@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = GetBloodPressureIntentResponseCode.init(rawValue:)(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v3 & 1;
  return result;
}

void protocol witness for RawRepresentable.rawValue.getter in conformance GetBloodPressureIntentResponseCode(void *a1@<X8>)
{
  GetBloodPressureIntentResponseCode.rawValue.getter();
  *a1 = v1;
}

uint64_t GetBloodPressureIntentResponse.code.getter()
{
  objc_super v2 = (uint64_t *)(v0 + OBJC_IVAR___GetBloodPressureIntentResponse_code);
  swift_beginAccess();
  uint64_t v3 = *v2;
  swift_endAccess();
  return v3;
}

uint64_t GetBloodPressureIntentResponse.code.setter(uint64_t a1)
{
  uint64_t v3 = (void *)(v1 + OBJC_IVAR___GetBloodPressureIntentResponse_code);
  swift_beginAccess();
  *uint64_t v3 = a1;
  return swift_endAccess();
}

uint64_t (*GetBloodPressureIntentResponse.code.modify())()
{
  return LogQuantityIntentResponse.code.modify;
}

void key path getter for GetBloodPressureIntentResponse.code : GetBloodPressureIntentResponse(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v3 = *a1;
  id v2 = *a1;
  *a2 = GetBloodPressureIntentResponse.code.getter();
}

void key path setter for GetBloodPressureIntentResponse.code : GetBloodPressureIntentResponse(uint64_t *a1, id *a2)
{
  uint64_t v4 = *a1;
  id v3 = *a2;
  id v2 = *a2;
  GetBloodPressureIntentResponse.code.setter(v4);
}

char *GetBloodPressureIntentResponse.init(code:userActivity:)(uint64_t a1, void *a2)
{
  Class v9 = (char *)objc_msgSend(v10, sel_init);
  id v2 = v9;
  id v3 = v9;
  uint64_t v4 = v9;
  id v6 = &v9[OBJC_IVAR___GetBloodPressureIntentResponse_code];
  swift_beginAccess();
  *(void *)id v6 = a1;
  swift_endAccess();

  objc_msgSend(v9, sel_setUserActivity_, a2);
  return v9;
}

uint64_t type metadata accessor for GetBloodPressureIntent()
{
  return self;
}

id GetBloodPressureIntentResponse.__allocating_init()()
{
  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id GetBloodPressureIntentResponse.init()()
{
  uint64_t v1 = v0;
  id v6 = v0;
  *(void *)&v0[OBJC_IVAR___GetBloodPressureIntentResponse_code] = 0;

  v5.receiver = v6;
  v5.super_class = (Class)type metadata accessor for GetBloodPressureIntentResponse();
  id v4 = objc_msgSendSuper2(&v5, sel_init);
  id v2 = v4;
  id v6 = v4;

  return v4;
}

uint64_t type metadata accessor for GetBloodPressureIntentResponse()
{
  return self;
}

id GetBloodPressureIntentResponse.__allocating_init(coder:)(void *a1)
{
  id v4 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v4;
}

id GetBloodPressureIntentResponse.init(coder:)(void *a1)
{
  Class v9 = a1;
  id v2 = v1;
  id v10 = v1;
  *(void *)&v1[OBJC_IVAR___GetBloodPressureIntentResponse_code] = 0;

  v8.receiver = v10;
  v8.super_class = (Class)type metadata accessor for GetBloodPressureIntentResponse();
  id v7 = objc_msgSendSuper2(&v8, sel_initWithCoder_, a1);
  if (v7)
  {
    id v3 = v7;
    id v10 = v7;

    return v7;
  }
  else
  {

    return 0;
  }
}

id GetBloodPressureIntentResponse.__allocating_init(backingStore:)(void *a1)
{
  id v4 = objc_msgSend(objc_allocWithZone(v1), sel_initWithBackingStore_, a1);

  return v4;
}

id GetBloodPressureIntentResponse.init(backingStore:)(void *a1)
{
  Class v9 = a1;
  id v2 = v1;
  id v10 = v1;
  *(void *)&v1[OBJC_IVAR___GetBloodPressureIntentResponse_code] = 0;

  v8.receiver = v10;
  v8.super_class = (Class)type metadata accessor for GetBloodPressureIntentResponse();
  id v7 = objc_msgSendSuper2(&v8, sel_initWithBackingStore_, a1);
  if (v7)
  {
    id v3 = v7;
    id v10 = v7;

    return v7;
  }
  else
  {

    return 0;
  }
}

id GetBloodPressureIntentResponse.__allocating_init(propertiesByName:)(uint64_t a1)
{
  id v8 = objc_allocWithZone(v1);
  if (a1)
  {
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    id v2 = objc_msgSend(v8, sel_initWithPropertiesByName_, isa);
  }
  else
  {
    id v2 = objc_msgSend(v8, sel_initWithPropertiesByName_, 0);
  }
  id v5 = v2;

  return v5;
}

id GetBloodPressureIntentResponse.init(propertiesByName:)(uint64_t a1)
{
  uint64_t v11 = a1;
  id v2 = v1;
  id v12 = v1;
  *(void *)&v1[OBJC_IVAR___GetBloodPressureIntentResponse_code] = 0;

  swift_bridgeObjectRetain();
  if (a1)
  {
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    Class v8 = isa;
  }
  else
  {
    Class v8 = 0;
  }
  v10.receiver = v12;
  v10.super_class = (Class)type metadata accessor for GetBloodPressureIntentResponse();
  id v6 = objc_msgSendSuper2(&v10, sel_initWithPropertiesByName_, v8);

  if (v6)
  {
    id v3 = v6;
    id v12 = v6;
    swift_bridgeObjectRelease();

    return v6;
  }
  else
  {

    swift_bridgeObjectRelease();
    return 0;
  }
}

id GetBloodPressureIntentResponse.__deallocating_deinit()
{
  id v3 = v0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for GetBloodPressureIntentResponse();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t base witness table accessor for Equatable in GetBloodPressureIntentResponseCode()
{
  return lazy protocol witness table accessor for type GetBloodPressureIntentResponseCode and conformance GetBloodPressureIntentResponseCode();
}

unint64_t lazy protocol witness table accessor for type GetBloodPressureIntentResponseCode and conformance GetBloodPressureIntentResponseCode()
{
  uint64_t v2 = lazy protocol witness table cache variable for type GetBloodPressureIntentResponseCode and conformance GetBloodPressureIntentResponseCode;
  if (!lazy protocol witness table cache variable for type GetBloodPressureIntentResponseCode and conformance GetBloodPressureIntentResponseCode)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type GetBloodPressureIntentResponseCode and conformance GetBloodPressureIntentResponseCode);
    return WitnessTable;
  }
  return v2;
}

{
  unint64_t WitnessTable;
  uint64_t v2;

  uint64_t v2 = lazy protocol witness table cache variable for type GetBloodPressureIntentResponseCode and conformance GetBloodPressureIntentResponseCode;
  if (!lazy protocol witness table cache variable for type GetBloodPressureIntentResponseCode and conformance GetBloodPressureIntentResponseCode)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type GetBloodPressureIntentResponseCode and conformance GetBloodPressureIntentResponseCode);
    return WitnessTable;
  }
  return v2;
}

void sub_25DF16328(id *a1@<X0>, uint64_t *a2@<X8>)
{
}

void sub_25DF16340(uint64_t *a1, id *a2)
{
}

ValueMetadata *type metadata accessor for GetBloodPressureIntentResponseCode()
{
  return &type metadata for GetBloodPressureIntentResponseCode;
}

Swift::Bool __swiftcall isMedDosageUnitSynonym(userSuppliedUnit:systemSuppliedUnit:)(Swift::String userSuppliedUnit, Swift::String systemSuppliedUnit)
{
  swift_bridgeObjectRetain();
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("application", 0xBuLL, 1);
  swift_bridgeObjectRetain();
  char v56 = static String.== infix(_:_:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v56) {
    goto LABEL_38;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("bar", 3uLL, 1);
  swift_bridgeObjectRetain();
  char v55 = static String.== infix(_:_:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v55) {
    goto LABEL_38;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("cartridge", 9uLL, 1);
  swift_bridgeObjectRetain();
  char v54 = static String.== infix(_:_:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v54) {
    goto LABEL_38;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("device", 6uLL, 1);
  swift_bridgeObjectRetain();
  char v53 = static String.== infix(_:_:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v53) {
    goto LABEL_38;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("disc", 4uLL, 1);
  swift_bridgeObjectRetain();
  char v52 = static String.== infix(_:_:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v52) {
    goto LABEL_38;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("drop", 4uLL, 1);
  swift_bridgeObjectRetain();
  char v51 = static String.== infix(_:_:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v51) {
    goto LABEL_38;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("enema", 5uLL, 1);
  swift_bridgeObjectRetain();
  char v50 = static String.== infix(_:_:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v50) {
    goto LABEL_38;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("globule", 7uLL, 1);
  swift_bridgeObjectRetain();
  char v49 = static String.== infix(_:_:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v49) {
    goto LABEL_38;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("implant", 7uLL, 1);
  swift_bridgeObjectRetain();
  char v48 = static String.== infix(_:_:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v48) {
    goto LABEL_38;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("insert", 6uLL, 1);
  swift_bridgeObjectRetain();
  char v47 = static String.== infix(_:_:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v47) {
    goto LABEL_38;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("kit", 3uLL, 1);
  swift_bridgeObjectRetain();
  char v46 = static String.== infix(_:_:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v46) {
    goto LABEL_38;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("packet", 6uLL, 1);
  swift_bridgeObjectRetain();
  char v45 = static String.== infix(_:_:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v45) {
    goto LABEL_38;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("patch", 5uLL, 1);
  swift_bridgeObjectRetain();
  char v44 = static String.== infix(_:_:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v44) {
    goto LABEL_38;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("piece", 5uLL, 1);
  swift_bridgeObjectRetain();
  char v43 = static String.== infix(_:_:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v43) {
    goto LABEL_38;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("popsicle", 8uLL, 1);
  swift_bridgeObjectRetain();
  char v42 = static String.== infix(_:_:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v42) {
    goto LABEL_38;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("scoop", 5uLL, 1);
  swift_bridgeObjectRetain();
  char v41 = static String.== infix(_:_:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v41) {
    goto LABEL_38;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("sponge", 6uLL, 1);
  swift_bridgeObjectRetain();
  char v40 = static String.== infix(_:_:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v40) {
    goto LABEL_38;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("spray", 5uLL, 1);
  swift_bridgeObjectRetain();
  char v39 = static String.== infix(_:_:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v39) {
    goto LABEL_38;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("stick", 5uLL, 1);
  swift_bridgeObjectRetain();
  char v38 = static String.== infix(_:_:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v38) {
    goto LABEL_38;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("strip", 5uLL, 1);
  swift_bridgeObjectRetain();
  char v37 = static String.== infix(_:_:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v37) {
    goto LABEL_38;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("suppository", 0xBuLL, 1);
  swift_bridgeObjectRetain();
  char v36 = static String.== infix(_:_:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v36) {
    goto LABEL_38;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("tampon", 6uLL, 1);
  swift_bridgeObjectRetain();
  char v35 = static String.== infix(_:_:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v35) {
    goto LABEL_38;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("treatment", 9uLL, 1);
  swift_bridgeObjectRetain();
  char v34 = static String.== infix(_:_:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v34) {
    goto LABEL_38;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("unit", 4uLL, 1);
  swift_bridgeObjectRetain();
  char v33 = static String.== infix(_:_:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v33 & 1) != 0
    || (swift_bridgeObjectRelease(),
        swift_bridgeObjectRetain(),
        String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("wick", 4uLL, 1),
        swift_bridgeObjectRetain(),
        char v32 = static String.== infix(_:_:)(),
        swift_bridgeObjectRelease(),
        swift_bridgeObjectRelease(),
        (v32 & 1) != 0))
  {
LABEL_38:
    swift_bridgeObjectRelease();
    char v31 = static String.== infix(_:_:)();
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("inhalation", 0xAuLL, 1);
    swift_bridgeObjectRetain();
    char v30 = static String.== infix(_:_:)();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v30)
    {
      swift_bridgeObjectRelease();
      _allocateUninitializedArray<A>(_:)();
      uint64_t v28 = v2;
      *uint64_t v2 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("inhalation", 0xAuLL, 1);
      v28[1] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("inhaler", 7uLL, 1);
      v28[2] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("puff", 4uLL, 1);
      v28[3] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("nebulizer", 9uLL, 1);
      v28[4] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("neb", 3uLL, 1);
      _finalizeUninitializedArray<A>(_:)();
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String]);
      lazy protocol witness table accessor for type [String] and conformance [A]();
      char v29 = Sequence<>.contains(_:)();
      outlined destroy of [HKQuantityType]();
      char v31 = v29;
    }
    else
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("injection", 9uLL, 1);
      swift_bridgeObjectRetain();
      char v27 = static String.== infix(_:_:)();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v27)
      {
        swift_bridgeObjectRelease();
        _allocateUninitializedArray<A>(_:)();
        os_log_type_t v25 = v3;
        *id v3 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("injection", 9uLL, 1);
        v25[1] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("shot", 4uLL, 1);
        _finalizeUninitializedArray<A>(_:)();
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String]);
        lazy protocol witness table accessor for type [String] and conformance [A]();
        char v26 = Sequence<>.contains(_:)();
        outlined destroy of [HKQuantityType]();
        char v31 = v26;
      }
      else
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRetain();
        String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("lozenge", 7uLL, 1);
        swift_bridgeObjectRetain();
        char v24 = static String.== infix(_:_:)();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (v24)
        {
          swift_bridgeObjectRelease();
          _allocateUninitializedArray<A>(_:)();
          uint64_t v22 = v4;
          *id v4 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("lozenge", 7uLL, 1);
          v22[1] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("drop", 4uLL, 1);
          v22[2] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("troche", 6uLL, 1);
          v22[3] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("pastille", 8uLL, 1);
          _finalizeUninitializedArray<A>(_:)();
          __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String]);
          lazy protocol witness table accessor for type [String] and conformance [A]();
          char v23 = Sequence<>.contains(_:)();
          outlined destroy of [HKQuantityType]();
          char v31 = v23;
        }
        else
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRetain();
          String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("mL", 2uLL, 1);
          swift_bridgeObjectRetain();
          char v21 = static String.== infix(_:_:)();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if (v21)
          {
            swift_bridgeObjectRelease();
            _allocateUninitializedArray<A>(_:)();
            uint64_t v19 = v5;
            *id v5 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("mL", 2uLL, 1);
            v19[1] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("milliliter", 0xAuLL, 1);
            v19[2] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("milliLiter", 0xAuLL, 1);
            _finalizeUninitializedArray<A>(_:)();
            __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String]);
            lazy protocol witness table accessor for type [String] and conformance [A]();
            char v20 = Sequence<>.contains(_:)();
            outlined destroy of [HKQuantityType]();
            char v31 = v20;
          }
          else
          {
            swift_bridgeObjectRelease();
            swift_bridgeObjectRetain();
            String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("mg", 2uLL, 1);
            swift_bridgeObjectRetain();
            char v18 = static String.== infix(_:_:)();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            if (v18)
            {
              swift_bridgeObjectRelease();
              _allocateUninitializedArray<A>(_:)();
              uint64_t v16 = v6;
              Swift::String *v6 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("mg", 2uLL, 1);
              v16[1] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("milligram", 9uLL, 1);
              _finalizeUninitializedArray<A>(_:)();
              __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String]);
              lazy protocol witness table accessor for type [String] and conformance [A]();
              char v17 = Sequence<>.contains(_:)();
              outlined destroy of [HKQuantityType]();
              char v31 = v17;
            }
            else
            {
              swift_bridgeObjectRelease();
              swift_bridgeObjectRetain();
              String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("tablet", 6uLL, 1);
              swift_bridgeObjectRetain();
              char v15 = static String.== infix(_:_:)();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              if (v15)
              {
                swift_bridgeObjectRelease();
                _allocateUninitializedArray<A>(_:)();
                id v13 = v7;
                *id v7 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("tablet", 6uLL, 1);
                v13[1] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("tab", 3uLL, 1);
                v13[2] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("pill", 4uLL, 1);
                v13[3] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("cap", 3uLL, 1);
                v13[4] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("capsule", 7uLL, 1);
                _finalizeUninitializedArray<A>(_:)();
                __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String]);
                lazy protocol witness table accessor for type [String] and conformance [A]();
                char v14 = Sequence<>.contains(_:)();
                outlined destroy of [HKQuantityType]();
                char v31 = v14;
              }
              else
              {
                swift_bridgeObjectRelease();
                swift_bridgeObjectRetain();
                String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("vial", 4uLL, 1);
                swift_bridgeObjectRetain();
                char v12 = static String.== infix(_:_:)();
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                if (v12)
                {
                  _allocateUninitializedArray<A>(_:)();
                  objc_super v10 = v8;
                  *Class v8 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("nebulizer", 9uLL, 1);
                  v10[1] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("neb", 3uLL, 1);
                  v10[2] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("inhalation", 0xAuLL, 1);
                  _finalizeUninitializedArray<A>(_:)();
                  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String]);
                  lazy protocol witness table accessor for type [String] and conformance [A]();
                  char v11 = Sequence<>.contains(_:)();
                  outlined destroy of [HKQuantityType]();
                  char v31 = v11;
                }
                else
                {
                  char v31 = 0;
                }
              }
            }
          }
        }
      }
    }
  }
  return v31 & 1;
}

id LogBloodPressureIntent.__allocating_init()()
{
  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id LogBloodPressureIntent.init()()
{
  id v4 = 0;
  v3.receiver = 0;
  v3.super_class = (Class)type metadata accessor for LogBloodPressureIntent();
  id v2 = objc_msgSendSuper2(&v3, sel_init);
  id v0 = v2;
  id v4 = v2;

  return v2;
}

uint64_t type metadata accessor for LogBloodPressureIntent()
{
  return self;
}

id LogBloodPressureIntent.__allocating_init(coder:)(void *a1)
{
  id v4 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v4;
}

id LogBloodPressureIntent.init(coder:)(void *a1)
{
  id v8 = 0;
  id v7 = a1;
  v6.receiver = 0;
  v6.super_class = (Class)type metadata accessor for LogBloodPressureIntent();
  id v5 = objc_msgSendSuper2(&v6, sel_initWithCoder_, a1);
  if (v5)
  {
    id v1 = v5;
    id v8 = v5;

    return v5;
  }
  else
  {

    return 0;
  }
}

id LogBloodPressureIntent.__allocating_init(identifier:backingStore:)(uint64_t a1, uint64_t a2, void *a3)
{
  id v11 = objc_allocWithZone(v3);
  if (a2)
  {
    uint64_t v6 = MEMORY[0x2611C8860](a1);
    swift_bridgeObjectRelease();
    id v7 = (void *)v6;
  }
  else
  {
    id v7 = 0;
  }
  id v5 = objc_msgSend(v11, sel_initWithIdentifier_backingStore_);

  return v5;
}

id LogBloodPressureIntent.init(identifier:backingStore:)(uint64_t a1, uint64_t a2, void *a3)
{
  id v15 = 0;
  uint64_t v13 = a1;
  uint64_t v14 = a2;
  char v12 = a3;
  swift_bridgeObjectRetain();
  if (a2)
  {
    uint64_t v6 = MEMORY[0x2611C8860](a1);
    swift_bridgeObjectRelease();
    id v7 = (void *)v6;
  }
  else
  {
    id v7 = 0;
  }
  v11.receiver = 0;
  v11.super_class = (Class)type metadata accessor for LogBloodPressureIntent();
  id v5 = objc_msgSendSuper2(&v11, sel_initWithIdentifier_backingStore_, v7, a3);

  id v3 = v5;
  id v15 = v5;

  swift_bridgeObjectRelease();
  return v5;
}

id LogBloodPressureIntent.__allocating_init(domain:verb:parametersByName:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v13 = objc_allocWithZone(v5);
  uint64_t v16 = (void *)MEMORY[0x2611C8860](a1, a2);
  char v18 = (void *)MEMORY[0x2611C8860](a3, a4);
  if (a5)
  {
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    id v6 = objc_msgSend(v13, sel_initWithDomain_verb_parametersByName_, v16, v18, isa);
  }
  else
  {
    id v6 = objc_msgSend(v13, sel_initWithDomain_verb_parametersByName_, v16, v18, 0);
  }
  id v9 = v6;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v9;
}

id LogBloodPressureIntent.init(domain:verb:parametersByName:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v23 = 0;
  uint64_t v21 = a1;
  uint64_t v22 = a2;
  uint64_t v19 = a3;
  uint64_t v20 = a4;
  uint64_t v18 = a5;
  swift_bridgeObjectRetain();
  id v12 = (id)MEMORY[0x2611C8860](a1, a2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  id v15 = (void *)MEMORY[0x2611C8860](a3, a4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  if (a5)
  {
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    Class v9 = isa;
  }
  else
  {
    Class v9 = 0;
  }
  v17.receiver = 0;
  v17.super_class = (Class)type metadata accessor for LogBloodPressureIntent();
  id v7 = objc_msgSendSuper2(&v17, sel_initWithDomain_verb_parametersByName_, v12, v15, v9);

  id v5 = v7;
  id v23 = v7;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return v7;
}

id LogBloodPressureIntent.__deallocating_deinit()
{
  id v3 = v0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for LogBloodPressureIntent();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t LogBloodPressureIntentResponseCode.init(rawValue:)(uint64_t a1)
{
  switch(a1)
  {
    case 0:
      return 0;
    case 1:
      return 1;
    case 2:
      return 2;
    case 3:
      return 3;
    case 4:
      return 4;
    case 5:
      return 5;
    case 6:
      return 6;
    case 100:
      return 100;
    case 101:
      return 101;
    case 102:
      return 102;
    case 103:
      return 103;
    case 104:
      return 104;
  }
  return 0;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance LogBloodPressureIntentResponseCode()
{
  return == infix<A>(_:_:)() & 1;
}

uint64_t protocol witness for Hashable.hashValue.getter in conformance LogBloodPressureIntentResponseCode()
{
  return RawRepresentable<>.hashValue.getter();
}

uint64_t protocol witness for Hashable.hash(into:) in conformance LogBloodPressureIntentResponseCode()
{
  return RawRepresentable<>.hash(into:)();
}

uint64_t protocol witness for Hashable._rawHashValue(seed:) in conformance LogBloodPressureIntentResponseCode()
{
  return RawRepresentable<>._rawHashValue(seed:)();
}

uint64_t protocol witness for RawRepresentable.init(rawValue:) in conformance LogBloodPressureIntentResponseCode@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = LogBloodPressureIntentResponseCode.init(rawValue:)(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v3 & 1;
  return result;
}

void protocol witness for RawRepresentable.rawValue.getter in conformance LogBloodPressureIntentResponseCode(void *a1@<X8>)
{
  LogBloodPressureIntentResponseCode.rawValue.getter();
  *a1 = v1;
}

uint64_t LogBloodPressureIntentResponse.code.getter()
{
  objc_super v2 = (uint64_t *)(v0 + OBJC_IVAR___LogBloodPressureIntentResponse_code);
  swift_beginAccess();
  uint64_t v3 = *v2;
  swift_endAccess();
  return v3;
}

uint64_t LogBloodPressureIntentResponse.code.setter(uint64_t a1)
{
  uint64_t v3 = (void *)(v1 + OBJC_IVAR___LogBloodPressureIntentResponse_code);
  swift_beginAccess();
  *uint64_t v3 = a1;
  return swift_endAccess();
}

uint64_t (*LogBloodPressureIntentResponse.code.modify())()
{
  return LogQuantityIntentResponse.code.modify;
}

void key path getter for LogBloodPressureIntentResponse.code : LogBloodPressureIntentResponse(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v3 = *a1;
  id v2 = *a1;
  *a2 = LogBloodPressureIntentResponse.code.getter();
}

void key path setter for LogBloodPressureIntentResponse.code : LogBloodPressureIntentResponse(uint64_t *a1, id *a2)
{
  uint64_t v4 = *a1;
  id v3 = *a2;
  id v2 = *a2;
  LogBloodPressureIntentResponse.code.setter(v4);
}

char *LogBloodPressureIntentResponse.__allocating_init(code:userActivity:)(uint64_t a1, void *a2)
{
  id v3 = objc_allocWithZone(v2);
  return LogBloodPressureIntentResponse.init(code:userActivity:)(a1, a2);
}

char *LogBloodPressureIntentResponse.init(code:userActivity:)(uint64_t a1, void *a2)
{
  Class v9 = (char *)objc_msgSend(v10, sel_init);
  id v2 = v9;
  id v3 = v9;
  uint64_t v4 = v9;
  id v6 = &v9[OBJC_IVAR___LogBloodPressureIntentResponse_code];
  swift_beginAccess();
  *(void *)id v6 = a1;
  swift_endAccess();

  objc_msgSend(v9, sel_setUserActivity_, a2);
  return v9;
}

id LogBloodPressureIntentResponse.__allocating_init()()
{
  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id LogBloodPressureIntentResponse.init()()
{
  uint64_t v1 = v0;
  id v6 = v0;
  *(void *)&v0[OBJC_IVAR___LogBloodPressureIntentResponse_code] = 0;

  v5.receiver = v6;
  v5.super_class = (Class)type metadata accessor for LogBloodPressureIntentResponse();
  id v4 = objc_msgSendSuper2(&v5, sel_init);
  id v2 = v4;
  id v6 = v4;

  return v4;
}

uint64_t type metadata accessor for LogBloodPressureIntentResponse()
{
  return self;
}

id LogBloodPressureIntentResponse.__allocating_init(coder:)(void *a1)
{
  id v4 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v4;
}

id LogBloodPressureIntentResponse.init(coder:)(void *a1)
{
  Class v9 = a1;
  id v2 = v1;
  id v10 = v1;
  *(void *)&v1[OBJC_IVAR___LogBloodPressureIntentResponse_code] = 0;

  v8.receiver = v10;
  v8.super_class = (Class)type metadata accessor for LogBloodPressureIntentResponse();
  id v7 = objc_msgSendSuper2(&v8, sel_initWithCoder_, a1);
  if (v7)
  {
    id v3 = v7;
    id v10 = v7;

    return v7;
  }
  else
  {

    return 0;
  }
}

id LogBloodPressureIntentResponse.__allocating_init(backingStore:)(void *a1)
{
  id v4 = objc_msgSend(objc_allocWithZone(v1), sel_initWithBackingStore_, a1);

  return v4;
}

id LogBloodPressureIntentResponse.init(backingStore:)(void *a1)
{
  Class v9 = a1;
  id v2 = v1;
  id v10 = v1;
  *(void *)&v1[OBJC_IVAR___LogBloodPressureIntentResponse_code] = 0;

  v8.receiver = v10;
  v8.super_class = (Class)type metadata accessor for LogBloodPressureIntentResponse();
  id v7 = objc_msgSendSuper2(&v8, sel_initWithBackingStore_, a1);
  if (v7)
  {
    id v3 = v7;
    id v10 = v7;

    return v7;
  }
  else
  {

    return 0;
  }
}

id LogBloodPressureIntentResponse.__allocating_init(propertiesByName:)(uint64_t a1)
{
  id v8 = objc_allocWithZone(v1);
  if (a1)
  {
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    id v2 = objc_msgSend(v8, sel_initWithPropertiesByName_, isa);
  }
  else
  {
    id v2 = objc_msgSend(v8, sel_initWithPropertiesByName_, 0);
  }
  id v5 = v2;

  return v5;
}

id LogBloodPressureIntentResponse.init(propertiesByName:)(uint64_t a1)
{
  uint64_t v11 = a1;
  id v2 = v1;
  id v12 = v1;
  *(void *)&v1[OBJC_IVAR___LogBloodPressureIntentResponse_code] = 0;

  swift_bridgeObjectRetain();
  if (a1)
  {
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    Class v8 = isa;
  }
  else
  {
    Class v8 = 0;
  }
  v10.receiver = v12;
  v10.super_class = (Class)type metadata accessor for LogBloodPressureIntentResponse();
  id v6 = objc_msgSendSuper2(&v10, sel_initWithPropertiesByName_, v8);

  if (v6)
  {
    id v3 = v6;
    id v12 = v6;
    swift_bridgeObjectRelease();

    return v6;
  }
  else
  {

    swift_bridgeObjectRelease();
    return 0;
  }
}

id LogBloodPressureIntentResponse.__deallocating_deinit()
{
  id v3 = v0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for LogBloodPressureIntentResponse();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t base witness table accessor for Equatable in LogBloodPressureIntentResponseCode()
{
  return lazy protocol witness table accessor for type LogBloodPressureIntentResponseCode and conformance LogBloodPressureIntentResponseCode();
}

unint64_t lazy protocol witness table accessor for type LogBloodPressureIntentResponseCode and conformance LogBloodPressureIntentResponseCode()
{
  uint64_t v2 = lazy protocol witness table cache variable for type LogBloodPressureIntentResponseCode and conformance LogBloodPressureIntentResponseCode;
  if (!lazy protocol witness table cache variable for type LogBloodPressureIntentResponseCode and conformance LogBloodPressureIntentResponseCode)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type LogBloodPressureIntentResponseCode and conformance LogBloodPressureIntentResponseCode);
    return WitnessTable;
  }
  return v2;
}

{
  unint64_t WitnessTable;
  uint64_t v2;

  uint64_t v2 = lazy protocol witness table cache variable for type LogBloodPressureIntentResponseCode and conformance LogBloodPressureIntentResponseCode;
  if (!lazy protocol witness table cache variable for type LogBloodPressureIntentResponseCode and conformance LogBloodPressureIntentResponseCode)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type LogBloodPressureIntentResponseCode and conformance LogBloodPressureIntentResponseCode);
    return WitnessTable;
  }
  return v2;
}

void sub_25DF19798(id *a1@<X0>, uint64_t *a2@<X8>)
{
}

void sub_25DF197B0(uint64_t *a1, id *a2)
{
}

ValueMetadata *type metadata accessor for LogBloodPressureIntentResponseCode()
{
  return &type metadata for LogBloodPressureIntentResponseCode;
}

char *GetMenstruationPredictionIntentResponse.__allocating_init(code:userActivity:)(uint64_t a1, void *a2)
{
  id v3 = objc_allocWithZone(v2);
  return GetMenstruationPredictionIntentResponse.init(code:userActivity:)(a1, a2);
}

id GetMenstruationPredictionIntent.__allocating_init()()
{
  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id GetMenstruationPredictionIntent.init()()
{
  id v4 = 0;
  v3.receiver = 0;
  v3.super_class = (Class)type metadata accessor for GetMenstruationPredictionIntent();
  id v2 = objc_msgSendSuper2(&v3, sel_init);
  id v0 = v2;
  id v4 = v2;

  return v2;
}

id GetMenstruationPredictionIntent.__allocating_init(coder:)(void *a1)
{
  id v4 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v4;
}

id GetMenstruationPredictionIntent.init(coder:)(void *a1)
{
  id v8 = 0;
  id v7 = a1;
  v6.receiver = 0;
  v6.super_class = (Class)type metadata accessor for GetMenstruationPredictionIntent();
  id v5 = objc_msgSendSuper2(&v6, sel_initWithCoder_, a1);
  if (v5)
  {
    id v1 = v5;
    id v8 = v5;

    return v5;
  }
  else
  {

    return 0;
  }
}

id GetMenstruationPredictionIntent.__allocating_init(identifier:backingStore:)(uint64_t a1, uint64_t a2, void *a3)
{
  id v11 = objc_allocWithZone(v3);
  if (a2)
  {
    uint64_t v6 = MEMORY[0x2611C8860](a1);
    swift_bridgeObjectRelease();
    id v7 = (void *)v6;
  }
  else
  {
    id v7 = 0;
  }
  id v5 = objc_msgSend(v11, sel_initWithIdentifier_backingStore_);

  return v5;
}

id GetMenstruationPredictionIntent.init(identifier:backingStore:)(uint64_t a1, uint64_t a2, void *a3)
{
  id v15 = 0;
  uint64_t v13 = a1;
  uint64_t v14 = a2;
  id v12 = a3;
  swift_bridgeObjectRetain();
  if (a2)
  {
    uint64_t v6 = MEMORY[0x2611C8860](a1);
    swift_bridgeObjectRelease();
    id v7 = (void *)v6;
  }
  else
  {
    id v7 = 0;
  }
  v11.receiver = 0;
  v11.super_class = (Class)type metadata accessor for GetMenstruationPredictionIntent();
  id v5 = objc_msgSendSuper2(&v11, sel_initWithIdentifier_backingStore_, v7, a3);

  id v3 = v5;
  id v15 = v5;

  swift_bridgeObjectRelease();
  return v5;
}

id GetMenstruationPredictionIntent.__allocating_init(domain:verb:parametersByName:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v13 = objc_allocWithZone(v5);
  uint64_t v16 = (void *)MEMORY[0x2611C8860](a1, a2);
  uint64_t v18 = (void *)MEMORY[0x2611C8860](a3, a4);
  if (a5)
  {
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    id v6 = objc_msgSend(v13, sel_initWithDomain_verb_parametersByName_, v16, v18, isa);
  }
  else
  {
    id v6 = objc_msgSend(v13, sel_initWithDomain_verb_parametersByName_, v16, v18, 0);
  }
  id v9 = v6;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v9;
}

id GetMenstruationPredictionIntent.init(domain:verb:parametersByName:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v23 = 0;
  uint64_t v21 = a1;
  uint64_t v22 = a2;
  uint64_t v19 = a3;
  uint64_t v20 = a4;
  uint64_t v18 = a5;
  swift_bridgeObjectRetain();
  id v12 = (id)MEMORY[0x2611C8860](a1, a2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  id v15 = (void *)MEMORY[0x2611C8860](a3, a4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  if (a5)
  {
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    Class v9 = isa;
  }
  else
  {
    Class v9 = 0;
  }
  v17.receiver = 0;
  v17.super_class = (Class)type metadata accessor for GetMenstruationPredictionIntent();
  id v7 = objc_msgSendSuper2(&v17, sel_initWithDomain_verb_parametersByName_, v12, v15, v9);

  id v5 = v7;
  id v23 = v7;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return v7;
}

id GetMenstruationPredictionIntent.__deallocating_deinit()
{
  id v3 = v0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for GetMenstruationPredictionIntent();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t GetMenstruationPredictionIntentResponseCode.init(rawValue:)(uint64_t a1)
{
  switch(a1)
  {
    case 0:
      return 0;
    case 1:
      return 1;
    case 2:
      return 2;
    case 3:
      return 3;
    case 4:
      return 4;
    case 5:
      return 5;
    case 6:
      return 6;
    case 100:
      return 100;
    case 101:
      return 101;
    case 102:
      return 102;
    case 103:
      return 103;
  }
  return 0;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance GetMenstruationPredictionIntentResponseCode()
{
  return == infix<A>(_:_:)() & 1;
}

uint64_t protocol witness for Hashable.hashValue.getter in conformance GetMenstruationPredictionIntentResponseCode()
{
  return RawRepresentable<>.hashValue.getter();
}

uint64_t protocol witness for Hashable.hash(into:) in conformance GetMenstruationPredictionIntentResponseCode()
{
  return RawRepresentable<>.hash(into:)();
}

uint64_t protocol witness for Hashable._rawHashValue(seed:) in conformance GetMenstruationPredictionIntentResponseCode()
{
  return RawRepresentable<>._rawHashValue(seed:)();
}

uint64_t protocol witness for RawRepresentable.init(rawValue:) in conformance GetMenstruationPredictionIntentResponseCode@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = GetMenstruationPredictionIntentResponseCode.init(rawValue:)(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v3 & 1;
  return result;
}

void protocol witness for RawRepresentable.rawValue.getter in conformance GetMenstruationPredictionIntentResponseCode(void *a1@<X8>)
{
  GetMenstruationPredictionIntentResponseCode.rawValue.getter();
  *a1 = v1;
}

uint64_t GetMenstruationPredictionIntentResponse.code.getter()
{
  objc_super v2 = (uint64_t *)(v0 + OBJC_IVAR___GetMenstruationPredictionIntentResponse_code);
  swift_beginAccess();
  uint64_t v3 = *v2;
  swift_endAccess();
  return v3;
}

uint64_t GetMenstruationPredictionIntentResponse.code.setter(uint64_t a1)
{
  uint64_t v3 = (void *)(v1 + OBJC_IVAR___GetMenstruationPredictionIntentResponse_code);
  swift_beginAccess();
  *uint64_t v3 = a1;
  return swift_endAccess();
}

uint64_t (*GetMenstruationPredictionIntentResponse.code.modify())()
{
  return LogQuantityIntentResponse.code.modify;
}

void key path getter for GetMenstruationPredictionIntentResponse.code : GetMenstruationPredictionIntentResponse(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v3 = *a1;
  id v2 = *a1;
  *a2 = GetMenstruationPredictionIntentResponse.code.getter();
}

void key path setter for GetMenstruationPredictionIntentResponse.code : GetMenstruationPredictionIntentResponse(uint64_t *a1, id *a2)
{
  uint64_t v4 = *a1;
  id v3 = *a2;
  id v2 = *a2;
  GetMenstruationPredictionIntentResponse.code.setter(v4);
}

char *GetMenstruationPredictionIntentResponse.init(code:userActivity:)(uint64_t a1, void *a2)
{
  Class v9 = (char *)objc_msgSend(v10, sel_init);
  id v2 = v9;
  id v3 = v9;
  uint64_t v4 = v9;
  id v6 = &v9[OBJC_IVAR___GetMenstruationPredictionIntentResponse_code];
  swift_beginAccess();
  *(void *)id v6 = a1;
  swift_endAccess();

  objc_msgSend(v9, sel_setUserActivity_, a2);
  return v9;
}

uint64_t type metadata accessor for GetMenstruationPredictionIntent()
{
  return self;
}

id GetMenstruationPredictionIntentResponse.__allocating_init()()
{
  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id GetMenstruationPredictionIntentResponse.init()()
{
  uint64_t v1 = v0;
  id v6 = v0;
  *(void *)&v0[OBJC_IVAR___GetMenstruationPredictionIntentResponse_code] = 0;

  v5.receiver = v6;
  v5.super_class = (Class)type metadata accessor for GetMenstruationPredictionIntentResponse();
  id v4 = objc_msgSendSuper2(&v5, sel_init);
  id v2 = v4;
  id v6 = v4;

  return v4;
}

uint64_t type metadata accessor for GetMenstruationPredictionIntentResponse()
{
  return self;
}

id GetMenstruationPredictionIntentResponse.__allocating_init(coder:)(void *a1)
{
  id v4 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v4;
}

id GetMenstruationPredictionIntentResponse.init(coder:)(void *a1)
{
  Class v9 = a1;
  id v2 = v1;
  id v10 = v1;
  *(void *)&v1[OBJC_IVAR___GetMenstruationPredictionIntentResponse_code] = 0;

  v8.receiver = v10;
  v8.super_class = (Class)type metadata accessor for GetMenstruationPredictionIntentResponse();
  id v7 = objc_msgSendSuper2(&v8, sel_initWithCoder_, a1);
  if (v7)
  {
    id v3 = v7;
    id v10 = v7;

    return v7;
  }
  else
  {

    return 0;
  }
}

id GetMenstruationPredictionIntentResponse.__allocating_init(backingStore:)(void *a1)
{
  id v4 = objc_msgSend(objc_allocWithZone(v1), sel_initWithBackingStore_, a1);

  return v4;
}

id GetMenstruationPredictionIntentResponse.init(backingStore:)(void *a1)
{
  Class v9 = a1;
  id v2 = v1;
  id v10 = v1;
  *(void *)&v1[OBJC_IVAR___GetMenstruationPredictionIntentResponse_code] = 0;

  v8.receiver = v10;
  v8.super_class = (Class)type metadata accessor for GetMenstruationPredictionIntentResponse();
  id v7 = objc_msgSendSuper2(&v8, sel_initWithBackingStore_, a1);
  if (v7)
  {
    id v3 = v7;
    id v10 = v7;

    return v7;
  }
  else
  {

    return 0;
  }
}

id GetMenstruationPredictionIntentResponse.__allocating_init(propertiesByName:)(uint64_t a1)
{
  id v8 = objc_allocWithZone(v1);
  if (a1)
  {
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    id v2 = objc_msgSend(v8, sel_initWithPropertiesByName_, isa);
  }
  else
  {
    id v2 = objc_msgSend(v8, sel_initWithPropertiesByName_, 0);
  }
  id v5 = v2;

  return v5;
}

id GetMenstruationPredictionIntentResponse.init(propertiesByName:)(uint64_t a1)
{
  uint64_t v11 = a1;
  id v2 = v1;
  id v12 = v1;
  *(void *)&v1[OBJC_IVAR___GetMenstruationPredictionIntentResponse_code] = 0;

  swift_bridgeObjectRetain();
  if (a1)
  {
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    Class v8 = isa;
  }
  else
  {
    Class v8 = 0;
  }
  v10.receiver = v12;
  v10.super_class = (Class)type metadata accessor for GetMenstruationPredictionIntentResponse();
  id v6 = objc_msgSendSuper2(&v10, sel_initWithPropertiesByName_, v8);

  if (v6)
  {
    id v3 = v6;
    id v12 = v6;
    swift_bridgeObjectRelease();

    return v6;
  }
  else
  {

    swift_bridgeObjectRelease();
    return 0;
  }
}

id GetMenstruationPredictionIntentResponse.__deallocating_deinit()
{
  id v3 = v0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for GetMenstruationPredictionIntentResponse();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t base witness table accessor for Equatable in GetMenstruationPredictionIntentResponseCode()
{
  return lazy protocol witness table accessor for type GetMenstruationPredictionIntentResponseCode and conformance GetMenstruationPredictionIntentResponseCode();
}

unint64_t lazy protocol witness table accessor for type GetMenstruationPredictionIntentResponseCode and conformance GetMenstruationPredictionIntentResponseCode()
{
  uint64_t v2 = lazy protocol witness table cache variable for type GetMenstruationPredictionIntentResponseCode and conformance GetMenstruationPredictionIntentResponseCode;
  if (!lazy protocol witness table cache variable for type GetMenstruationPredictionIntentResponseCode and conformance GetMenstruationPredictionIntentResponseCode)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type GetMenstruationPredictionIntentResponseCode and conformance GetMenstruationPredictionIntentResponseCode);
    return WitnessTable;
  }
  return v2;
}

{
  unint64_t WitnessTable;
  uint64_t v2;

  uint64_t v2 = lazy protocol witness table cache variable for type GetMenstruationPredictionIntentResponseCode and conformance GetMenstruationPredictionIntentResponseCode;
  if (!lazy protocol witness table cache variable for type GetMenstruationPredictionIntentResponseCode and conformance GetMenstruationPredictionIntentResponseCode)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type GetMenstruationPredictionIntentResponseCode and conformance GetMenstruationPredictionIntentResponseCode);
    return WitnessTable;
  }
  return v2;
}

void sub_25DF1B124(id *a1@<X0>, uint64_t *a2@<X8>)
{
}

void sub_25DF1B13C(uint64_t *a1, id *a2)
{
}

ValueMetadata *type metadata accessor for GetMenstruationPredictionIntentResponseCode()
{
  return &type metadata for GetMenstruationPredictionIntentResponseCode;
}

void *static HealthKitCorrelationProvider<A>.bloodPressure(store:)@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  id v2 = a1;
  objc_super v10 = (void *)*MEMORY[0x263F094C0];
  id v3 = (id)*MEMORY[0x263F094C0];
  Class v8 = (void *)*MEMORY[0x263F09C28];
  id v4 = (id)*MEMORY[0x263F09C28];
  Class v9 = (void *)*MEMORY[0x263F09C20];
  id v5 = (id)*MEMORY[0x263F09C20];
  BloodPressureIntentResponse = (void *)type metadata accessor for GetBloodPressureIntentResponse();
  HealthKitCorrelationProvider.init(store:identifier:firstQuantityIdentifier:secondQuantityIdentifier:failure:mapIntent:)(a1, v10, v8, v9, implicit closure #1 in static HealthKitCorrelationProvider<A>.bloodPressure(store:), 0, closure #1 in static HealthKitCorrelationProvider<A>.bloodPressure(store:), 0, v13, BloodPressureIntentResponse);
  return memcpy(a2, v13, 0x40uLL);
}

id HealthKitCorrelationProvider.init(store:identifier:firstQuantityIdentifier:secondQuantityIdentifier:failure:mapIntent:)@<X0>(void *a1@<X0>, void *a2@<X1>, void *a3@<X2>, void *a4@<X3>, void *a5@<X4>, void *a6@<X5>, void *a7@<X6>, void *a8@<X7>, void *a9@<X8>, void *a10)
{
  memset(__b, 0, 0x40uLL);
  id __b[8] = a10;
  id v10 = a1;
  id v11 = a1;
  __b[0] = a1;
  type metadata accessor for HKCorrelationType();
  id v12 = a2;
  id v27 = (id)MEMORY[0x2611C8CF0](a2);
  id v13 = v27;
  __b[1] = v27;
  type metadata accessor for HKQuantityType();
  id v14 = a3;
  id v28 = (id)MEMORY[0x2611C8CE0](a3);
  id v15 = v28;
  __b[2] = v28;
  id v16 = a4;
  id v34 = (id)MEMORY[0x2611C8CE0](a4);
  id v17 = v34;
  __b[3] = v34;
  swift_retain();
  swift_retain();
  __b[4] = a5;
  __b[5] = a6;
  swift_retain();
  swift_retain();
  __b[6] = a7;
  __b[7] = a8;
  id v18 = a1;
  id v19 = v27;
  id v20 = v28;
  id v21 = v34;
  swift_retain();
  swift_retain();
  swift_release();
  swift_release();

  swift_release();
  swift_release();

  outlined destroy of HealthKitCorrelationProvider<A>(__b);
  id result = v34;
  *a9 = a1;
  a9[1] = v27;
  a9[2] = v28;
  a9[3] = v34;
  a9[4] = a5;
  a9[5] = a6;
  a9[6] = a7;
  a9[7] = a8;
  return result;
}

uint64_t HealthKitCorrelationProvider.query(start:end:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[8] = v4;
  v5[7] = a1;
  v5[2] = v5;
  v5[3] = 0;
  v5[4] = 0;
  v5[5] = 0;
  v5[6] = 0;
  uint64_t v6 = *(void *)(a4 + 16);
  v5[9] = v6;
  v5[10] = *(void *)(v6 - 8);
  v5[11] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Statistics<(first: Double, second: Double)>?);
  uint64_t v21 = swift_task_alloc();
  v5[12] = v21;
  v5[3] = a2;
  v5[4] = a3;
  v5[5] = v4;
  id v7 = *v4;
  v5[13] = v7;
  id v8 = v7;
  id v16 = (void *)v14[1];
  v5[14] = v16;
  id v9 = v16;
  id v17 = (void *)v14[2];
  v5[15] = v17;
  id v10 = v17;
  id v18 = (void *)v14[3];
  v5[16] = v18;
  id v11 = v18;
  id v12 = (void *)swift_task_alloc();
  *(void *)(v15 + 136) = v12;
  *id v12 = *(void *)(v15 + 16);
  v12[1] = HealthKitCorrelationProvider.query(start:end:);
  return HKHealthStore.query(correlationType:firstQuantityType:secondQuantityType:start:end:)(v21, (uint64_t)v16, (uint64_t)v17, (uint64_t)v18, a2, a3);
}

uint64_t HealthKitCorrelationProvider.query(start:end:)()
{
  uint64_t v7 = *v1;
  *(void *)(v7 + 16) = *v1;
  *(void *)(v7 + 144) = v0;
  swift_task_dealloc();
  if (v0)
  {
    id v2 = HealthKitCorrelationProvider.query(start:end:);
  }
  else
  {
    id v4 = *(void **)(v7 + 120);
    id v5 = *(void **)(v7 + 112);
    uint64_t v6 = *(void **)(v7 + 104);

    id v2 = HealthKitCorrelationProvider.query(start:end:);
  }
  return MEMORY[0x270FA2498](v2, 0);
}

{
  void *v0;
  uint64_t v1;
  uint64_t (*v2)(void);
  void (*v4)(uint64_t);
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  id v9 = v0[12];
  uint64_t v8 = v0[11];
  uint64_t v6 = v0[10];
  uint64_t v7 = v0[9];
  uint64_t v1 = v0[8];
  id v5 = v0[7];
  v0[2] = v0;
  id v4 = *(void (**)(uint64_t))(v1 + 48);
  swift_retain();
  v4(v9);
  swift_release();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v5, v8, v7);
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v8, v7);
  outlined destroy of Statistics<(first: Double, second: Double)>?(v9);
  swift_task_dealloc();
  swift_task_dealloc();
  id v2 = *(uint64_t (**)(void))(v0[2] + 8);
  return v2();
}

{
  void *v0;
  void *v1;
  id v2;
  uint64_t v3;
  uint64_t (*v4)(void);
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  id v11;
  uint64_t v12;

  id v11 = (id)v0[18];
  uint64_t v1 = (void *)v0[16];
  uint64_t v6 = (id)v0[15];
  uint64_t v7 = (id)v0[14];
  uint64_t v8 = (id)v0[13];
  id v9 = v0[8];
  v0[2] = v0;

  id v2 = v11;
  v0[6] = v11;
  id v10 = *(void (**)(uint64_t))(v9 + 32);
  id v3 = swift_retain();
  v10(v3);
  swift_release();

  swift_task_dealloc();
  swift_task_dealloc();
  id v4 = *(uint64_t (**)(void))(v0[2] + 8);
  return v4();
}

uint64_t protocol witness for DataProviding.isQueryAuthorized() in conformance HealthKitCorrelationProvider<A>()
{
  *(void *)(v1 + 80) = v1;
  memcpy((void *)(v1 + 16), v0, 0x40uLL);
  id v2 = (void *)swift_task_alloc();
  *(void *)(v4 + 88) = v2;
  *id v2 = *(void *)(v4 + 80);
  v2[1] = protocol witness for DataProviding.isQueryAuthorized() in conformance HealthKitCorrelationProvider<A>;
  return HealthKitDistanceProvider.isQueryAuthorized()();
}

uint64_t protocol witness for DataProviding.isQueryAuthorized() in conformance HealthKitCorrelationProvider<A>(unsigned int a1)
{
  uint64_t v4 = *v1;
  *(void *)(v4 + 80) = *v1;
  swift_task_dealloc();
  id v2 = *(uint64_t (**)(void))(*(void *)(v4 + 80) + 8);
  return v2(a1);
}

uint64_t protocol witness for DataProviding.isLoggingAuthorized() in conformance HealthKitCorrelationProvider<A>()
{
  *(void *)(v1 + 80) = v1;
  memcpy((void *)(v1 + 16), v0, 0x40uLL);
  id v2 = (void *)swift_task_alloc();
  *(void *)(v4 + 88) = v2;
  *id v2 = *(void *)(v4 + 80);
  v2[1] = protocol witness for DataProviding.isQueryAuthorized() in conformance HealthKitCorrelationProvider<A>;
  return HealthKitDistanceProvider.isQueryAuthorized()();
}

char *implicit closure #1 in static HealthKitCorrelationProvider<A>.bloodPressure(store:)@<X0>(char **a1@<X8>)
{
  type metadata accessor for GetBloodPressureIntentResponse();
  id result = GetBloodPressureIntentResponse.__allocating_init(code:userActivity:)(5, 0);
  *a1 = result;
  return result;
}

char *closure #1 in static HealthKitCorrelationProvider<A>.bloodPressure(store:)@<X0>(uint64_t a1@<X0>, char **a2@<X8>)
{
  char v29 = a2;
  uint64_t v42 = a1;
  char v51 = 0;
  char v50 = 0;
  char v49 = 0;
  uint64_t v30 = 0;
  uint64_t v31 = type metadata accessor for Date();
  uint64_t v32 = *(void *)(v31 - 8);
  uint64_t v33 = v31 - 8;
  unint64_t v34 = (*(void *)(v32 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](0);
  char v35 = (char *)&v14 - v34;
  uint64_t v36 = type metadata accessor for DateInterval();
  char v37 = *(void **)(v36 - 8);
  uint64_t v38 = v36 - 8;
  unint64_t v39 = (v37[8] + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v36);
  char v40 = (char *)&v14 - v39;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Statistics<(first: Double, second: Double)>?);
  unint64_t v41 = (*(void *)(*(void *)(v2 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v2);
  char v48 = (char *)&v14 - v41;
  char v47 = (int *)__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Statistics<(first: Double, second: Double)>);
  uint64_t v45 = *((void *)v47 - 1);
  char v46 = v47 - 2;
  unint64_t v43 = (*(void *)(v45 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v42);
  char v44 = (char *)&v14 - v43;
  char v51 = (char *)&v14 - v43;
  char v50 = v3;
  outlined init with copy of Statistics<(first: Double, second: Double)>?(v3, v4);
  if ((*(unsigned int (**)(char *, uint64_t, int *))(v45 + 48))(v48, 1, v47) == 1)
  {
    outlined destroy of Statistics<(first: Double, second: Double)>?((uint64_t)v48);
    id v28 = 0;
    type metadata accessor for GetBloodPressureIntentResponse();
    id result = GetBloodPressureIntentResponse.__allocating_init(code:userActivity:)(102, v28);
    uint8_t *v29 = result;
  }
  else
  {
    outlined init with take of Statistics<(first: Double, second: Double)>(v48, v44);
    uint64_t v15 = 0;
    type metadata accessor for GetBloodPressureIntentResponse();
    uint64_t v6 = GetBloodPressureIntentResponse.__allocating_init(code:userActivity:)(4, v15);
    uint64_t v7 = v40;
    id v27 = v6;
    char v49 = v6;
    uint64_t v8 = &v44[v47[9]];
    uint64_t v16 = *(void *)v8;
    uint64_t v17 = *((void *)v8 + 1);
    swift_bridgeObjectRetain();
    id v18 = (id)MEMORY[0x2611C8860](v16, v17);
    swift_bridgeObjectRelease();
    objc_msgSend(v27, sel_setUnit_, v18);

    objc_msgSend(v27, sel_setSystolic_, *(double *)&v44[v47[11]]);
    objc_msgSend(v27, sel_setSystolicMinimum_, *(double *)&v44[v47[10]]);
    objc_msgSend(v27, sel_setSystolicMaximum_, *(double *)&v44[v47[10] + 16]);
    objc_msgSend(v27, sel_setDiastolic_, *(double *)&v44[v47[11] + 8]);
    objc_msgSend(v27, sel_setDiastolicMinimum_, *(double *)&v44[v47[10] + 8]);
    objc_msgSend(v27, sel_setDiastolicMaximum_, *(double *)&v44[v47[10] + 24]);
    id v9 = &v44[v47[7]];
    uint64_t v21 = (void (*)(char *, char *, uint64_t))v37[2];
    id v20 = v37 + 2;
    v21(v7, v9, v36);
    DateInterval.start.getter();
    v10.super.Class isa = Date._bridgeToObjectiveC()().super.isa;
    id v11 = v40;
    Class isa = v10.super.isa;
    id v23 = (void (*)(char *, uint64_t))v37[1];
    uint64_t v22 = v37 + 1;
    v23(v40, v36);
    os_log_type_t v25 = *(void (**)(char *, uint64_t))(v32 + 8);
    uint64_t v24 = v32 + 8;
    v25(v35, v31);
    objc_msgSend(v27, sel_setSampleStartDate_, isa);

    v21(v11, &v44[v47[7]], v36);
    DateInterval.end.getter();
    Class v26 = Date._bridgeToObjectiveC()().super.isa;
    v23(v40, v36);
    v25(v35, v31);
    objc_msgSend(v27, sel_setSampleEndDate_, v26);

    id v12 = v27;
    id v13 = v27;
    uint8_t *v29 = v27;

    return (char *)outlined destroy of Statistics<(first: Double, second: Double)>((uint64_t)v44);
  }
  return result;
}

id *outlined destroy of HealthKitCorrelationProvider<A>(id *a1)
{
  swift_release();
  swift_release();
  return a1;
}

uint64_t outlined destroy of Statistics<(first: Double, second: Double)>?(uint64_t a1)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Statistics<(first: Double, second: Double)>);
  if (!(*(unsigned int (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 48))(a1, 1))
  {
    uint64_t v2 = type metadata accessor for DateInterval();
    uint64_t v3 = *(void *)(v2 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t))(v3 + 48))(a1, 1)) {
      (*(void (**)(uint64_t, uint64_t))(v3 + 8))(a1, v2);
    }
    (*(void (**)(uint64_t, uint64_t))(v3 + 8))(a1 + *(int *)(v5 + 28), v2);
    swift_bridgeObjectRelease();
  }
  return a1;
}

uint64_t protocol witness for BloodPressureProviding.query(start:end:) in conformance <A> HealthKitCorrelationProvider<A>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(v4 + 80) = v4;
  memcpy((void *)(v4 + 16), v3, 0x40uLL);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v7 + 96) = v5;
  *uint64_t v5 = *(void *)(v7 + 80);
  v5[1] = protocol witness for BloodPressureProviding.query(start:end:) in conformance <A> HealthKitCorrelationProvider<A>;
  return HealthKitCorrelationProvider.query(start:end:)(v7 + 88, a1, a2, a3);
}

uint64_t protocol witness for BloodPressureProviding.query(start:end:) in conformance <A> HealthKitCorrelationProvider<A>()
{
  uint64_t v4 = *v0;
  uint64_t v5 = *v0;
  *(void *)(v5 + 80) = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(void *)(v4 + 88);
  uint64_t v2 = *(uint64_t (**)(uint64_t))(*(void *)(v5 + 80) + 8);
  return v2(v1);
}

uint64_t type metadata instantiation function for HealthKitCorrelationProvider()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t destroy for HealthKitCorrelationProvider(id *a1)
{
  swift_release();
  return swift_release();
}

void *initializeWithCopy for HealthKitCorrelationProvider(void *a1, uint64_t a2)
{
  id v7 = *(id *)a2;
  id v2 = *(id *)a2;
  *a1 = v7;
  uint64_t v8 = *(void **)(a2 + 8);
  id v3 = v8;
  a1[1] = v8;
  id v9 = *(void **)(a2 + 16);
  id v4 = v9;
  a1[2] = v9;
  NSDate v10 = *(void **)(a2 + 24);
  id v5 = v10;
  a1[3] = v10;
  uint64_t v11 = *(void *)(a2 + 32);
  uint64_t v12 = *(void *)(a2 + 40);
  swift_retain();
  a1[4] = v11;
  a1[5] = v12;
  uint64_t v15 = *(void *)(a2 + 48);
  uint64_t v16 = *(void *)(a2 + 56);
  swift_retain();
  id result = a1;
  a1[6] = v15;
  a1[7] = v16;
  return result;
}

uint64_t assignWithCopy for HealthKitCorrelationProvider(uint64_t a1, uint64_t a2)
{
  id v11 = *(id *)a2;
  id v2 = *(id *)a2;
  id v3 = *(void **)a1;
  *(void *)a1 = v11;

  uint64_t v12 = *(void **)(a2 + 8);
  id v4 = v12;
  id v5 = *(void **)(a1 + 8);
  *(void *)(a1 + 8) = v12;

  id v13 = *(void **)(a2 + 16);
  id v6 = v13;
  id v7 = *(void **)(a1 + 16);
  *(void *)(a1 + 16) = v13;

  uint64_t v14 = *(void **)(a2 + 24);
  id v8 = v14;
  id v9 = *(void **)(a1 + 24);
  *(void *)(a1 + 24) = v14;

  uint64_t v15 = *(void *)(a2 + 32);
  uint64_t v16 = *(void *)(a2 + 40);
  swift_retain();
  *(void *)(a1 + 32) = v15;
  *(void *)(a1 + 40) = v16;
  swift_release();
  uint64_t v18 = *(void *)(a2 + 48);
  uint64_t v19 = *(void *)(a2 + 56);
  swift_retain();
  *(void *)(a1 + 48) = v18;
  *(void *)(a1 + 56) = v19;
  swift_release();
  return a1;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> __swift_memcpy64_8(void *a1, const void *a2)
{
}

uint64_t assignWithTake for HealthKitCorrelationProvider(uint64_t a1, void *a2)
{
  id v2 = *(void **)a1;
  *(void *)a1 = *a2;

  id v3 = *(void **)(a1 + 8);
  *(void *)(a1 + 8) = a2[1];

  id v4 = *(void **)(a1 + 16);
  *(void *)(a1 + 16) = a2[2];

  id v5 = *(void **)(a1 + 24);
  *(void *)(a1 + 24) = a2[3];

  uint64_t v6 = a2[5];
  *(void *)(a1 + 32) = a2[4];
  *(void *)(a1 + 40) = v6;
  swift_release();
  uint64_t v7 = a2[7];
  *(void *)(a1 + 48) = a2[6];
  *(void *)(a1 + 56) = v7;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for HealthKitCorrelationProvider(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 > 0x7FFFFFFF && *(unsigned char *)(a1 + 64))
    {
      int v4 = *(void *)a1 + 0x7FFFFFFF;
    }
    else
    {
      int v3 = -1;
      if (*(void *)a1 < 0x100000000uLL) {
        int v3 = *(void *)a1;
      }
      int v4 = v3;
    }
  }
  else
  {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for HealthKitCorrelationProvider(uint64_t result, unsigned int a2, unsigned int a3)
{
  BOOL v3 = a3 > 0x7FFFFFFF;
  if (a2 > 0x7FFFFFFF)
  {
    *(void *)id result = a2 + 0x80000000;
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)(result + 32) = 0;
    *(void *)(result + 40) = 0;
    *(void *)(result + 48) = 0;
    *(void *)(result + 56) = 0;
    if (a3 > 0x7FFFFFFF)
    {
      if (v3) {
        *(unsigned char *)(result + 64) = 1;
      }
      else {
        __break(1u);
      }
    }
  }
  else
  {
    if (a3 > 0x7FFFFFFF)
    {
      if (v3) {
        *(unsigned char *)(result + 64) = 0;
      }
      else {
        __break(1u);
      }
    }
    if (a2) {
      *(void *)id result = a2 - 1;
    }
  }
  return result;
}

uint64_t type metadata accessor for HealthKitCorrelationProvider()
{
  return __swift_instantiateGenericMetadata();
}

char *outlined init with copy of Statistics<(first: Double, second: Double)>?(char *a1, char *a2)
{
  uint64_t v14 = (int *)__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Statistics<(first: Double, second: Double)>);
  uint64_t v15 = *((void *)v14 - 1);
  if ((*(unsigned int (**)(char *, uint64_t))(v15 + 48))(a1, 1))
  {
    uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Statistics<(first: Double, second: Double)>?);
    memcpy(a2, a1, *(void *)(*(void *)(v6 - 8) + 64));
  }
  else
  {
    uint64_t v10 = type metadata accessor for DateInterval();
    uint64_t v11 = *(void *)(v10 - 8);
    if ((*(unsigned int (**)(char *, uint64_t))(v11 + 48))(a1, 1))
    {
      uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DateInterval?);
      memcpy(a2, a1, *(void *)(*(void *)(v2 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v11 + 16))(a2, a1, v10);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(a2, 0, 1, v10);
    }
    (*(void (**)(char *, char *, uint64_t))(v11 + 16))(&a2[v14[7]], &a1[v14[7]], v10);
    *(void *)&a2[v14[8]] = *(void *)&a1[v14[8]];
    uint64_t v3 = v14[9];
    id v8 = &a2[v3];
    *(void *)&a2[v3] = *(void *)&a1[v3];
    uint64_t v9 = *(void *)&a1[v3 + 8];
    swift_bridgeObjectRetain();
    *((void *)v8 + 1) = v9;
    int v4 = &a2[v14[10]];
    uint64_t v5 = v14[10];
    *(_OWORD *)int v4 = *(_OWORD *)&a1[v5];
    *((_OWORD *)v4 + 1) = *(_OWORD *)&a1[v5 + 16];
    *(_OWORD *)&a2[v14[11]] = *(_OWORD *)&a1[v14[11]];
    *(_OWORD *)&a2[v14[12]] = *(_OWORD *)&a1[v14[12]];
    *(_OWORD *)&a2[v14[13]] = *(_OWORD *)&a1[v14[13]];
    (*(void (**)(void))(v15 + 56))();
  }
  return a2;
}

__n128 outlined init with take of Statistics<(first: Double, second: Double)>(char *a1, char *a2)
{
  uint64_t v9 = type metadata accessor for DateInterval();
  uint64_t v10 = *(void *)(v9 - 8);
  if ((*(unsigned int (**)(char *, uint64_t))(v10 + 48))(a1, 1))
  {
    uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DateInterval?);
    memcpy(a2, a1, *(void *)(*(void *)(v2 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v10 + 32))(a2, a1, v9);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(a2, 0, 1, v9);
  }
  uint64_t v6 = (int *)__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Statistics<(first: Double, second: Double)>);
  (*(void (**)(char *, char *, uint64_t))(v10 + 32))(&a2[v6[7]], &a1[v6[7]], v9);
  *(void *)&a2[v6[8]] = *(void *)&a1[v6[8]];
  *(_OWORD *)&a2[v6[9]] = *(_OWORD *)&a1[v6[9]];
  uint64_t v3 = &a2[v6[10]];
  uint64_t v4 = v6[10];
  *(_OWORD *)uint64_t v3 = *(_OWORD *)&a1[v4];
  *((_OWORD *)v3 + 1) = *(_OWORD *)&a1[v4 + 16];
  *(_OWORD *)&a2[v6[11]] = *(_OWORD *)&a1[v6[11]];
  *(_OWORD *)&a2[v6[12]] = *(_OWORD *)&a1[v6[12]];
  __n128 result = *(__n128 *)&a1[v6[13]];
  *(__n128 *)&a2[v6[13]] = result;
  return result;
}

uint64_t PeriodFlow.toMenstrualFlow()(uint64_t a1)
{
  if (a1)
  {
    uint64_t v2 = a1;
    char v1 = 1;
  }
  else
  {
    uint64_t v2 = 0;
    char v1 = 0;
  }
  if (v1)
  {
    _diagnoseUnexpectedEnumCaseValue<A, B>(type:rawValue:)();
    __break(1u);
  }
  else
  {
    switch(v2)
    {
      case 0:
        uint64_t v4 = 0;
        break;
      case 1:
        uint64_t v4 = 1;
        break;
      case 2:
        uint64_t v4 = 2;
        break;
      case 3:
        uint64_t v4 = 3;
        break;
      case 4:
        uint64_t v4 = 4;
        break;
      case 5:
        uint64_t v4 = 5;
        break;
      default:
        JUMPOUT(0);
    }
  }
  return v4;
}

uint64_t PeriodFlow.init(flow:)(uint64_t a1)
{
  if (a1)
  {
    uint64_t v2 = a1;
    char v1 = 1;
  }
  else
  {
    uint64_t v2 = 0;
    char v1 = 0;
  }
  if (v1) {
    return 0;
  }
  switch(v2)
  {
    case 0:
      uint64_t v4 = 0;
      break;
    case 1:
      uint64_t v4 = 1;
      break;
    case 2:
      uint64_t v4 = 2;
      break;
    case 3:
      uint64_t v4 = 3;
      break;
    case 4:
      uint64_t v4 = 4;
      break;
    case 5:
      uint64_t v4 = 5;
      break;
    default:
      JUMPOUT(0);
  }
  return v4;
}

char *LogGenericMedicationsIntentResponse.__allocating_init(code:userActivity:)(uint64_t a1, void *a2)
{
  id v3 = objc_allocWithZone(v2);
  return LogGenericMedicationsIntentResponse.init(code:userActivity:)(a1, a2);
}

id LogGenericMedicationsIntent.__allocating_init()()
{
  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id LogGenericMedicationsIntent.init()()
{
  id v4 = 0;
  v3.receiver = 0;
  v3.super_class = (Class)type metadata accessor for LogGenericMedicationsIntent();
  id v2 = objc_msgSendSuper2(&v3, sel_init);
  id v0 = v2;
  id v4 = v2;

  return v2;
}

id LogGenericMedicationsIntent.__allocating_init(coder:)(void *a1)
{
  id v4 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v4;
}

id LogGenericMedicationsIntent.init(coder:)(void *a1)
{
  id v8 = 0;
  uint64_t v7 = a1;
  v6.receiver = 0;
  v6.super_class = (Class)type metadata accessor for LogGenericMedicationsIntent();
  id v5 = objc_msgSendSuper2(&v6, sel_initWithCoder_, a1);
  if (v5)
  {
    id v1 = v5;
    id v8 = v5;

    return v5;
  }
  else
  {

    return 0;
  }
}

id LogGenericMedicationsIntent.__allocating_init(identifier:backingStore:)(uint64_t a1, uint64_t a2, void *a3)
{
  id v11 = objc_allocWithZone(v3);
  if (a2)
  {
    uint64_t v6 = MEMORY[0x2611C8860](a1);
    swift_bridgeObjectRelease();
    uint64_t v7 = (void *)v6;
  }
  else
  {
    uint64_t v7 = 0;
  }
  id v5 = objc_msgSend(v11, sel_initWithIdentifier_backingStore_);

  return v5;
}

id LogGenericMedicationsIntent.init(identifier:backingStore:)(uint64_t a1, uint64_t a2, void *a3)
{
  id v15 = 0;
  uint64_t v13 = a1;
  uint64_t v14 = a2;
  uint64_t v12 = a3;
  swift_bridgeObjectRetain();
  if (a2)
  {
    uint64_t v6 = MEMORY[0x2611C8860](a1);
    swift_bridgeObjectRelease();
    uint64_t v7 = (void *)v6;
  }
  else
  {
    uint64_t v7 = 0;
  }
  v11.receiver = 0;
  v11.super_class = (Class)type metadata accessor for LogGenericMedicationsIntent();
  id v5 = objc_msgSendSuper2(&v11, sel_initWithIdentifier_backingStore_, v7, a3);

  id v3 = v5;
  id v15 = v5;

  swift_bridgeObjectRelease();
  return v5;
}

id LogGenericMedicationsIntent.__allocating_init(domain:verb:parametersByName:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v13 = objc_allocWithZone(v5);
  uint64_t v16 = (void *)MEMORY[0x2611C8860](a1, a2);
  uint64_t v18 = (void *)MEMORY[0x2611C8860](a3, a4);
  if (a5)
  {
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    id v6 = objc_msgSend(v13, sel_initWithDomain_verb_parametersByName_, v16, v18, isa);
  }
  else
  {
    id v6 = objc_msgSend(v13, sel_initWithDomain_verb_parametersByName_, v16, v18, 0);
  }
  id v9 = v6;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v9;
}

id LogGenericMedicationsIntent.init(domain:verb:parametersByName:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v23 = 0;
  uint64_t v21 = a1;
  uint64_t v22 = a2;
  uint64_t v19 = a3;
  uint64_t v20 = a4;
  uint64_t v18 = a5;
  swift_bridgeObjectRetain();
  id v12 = (id)MEMORY[0x2611C8860](a1, a2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  id v15 = (void *)MEMORY[0x2611C8860](a3, a4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  if (a5)
  {
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    Class v9 = isa;
  }
  else
  {
    Class v9 = 0;
  }
  v17.receiver = 0;
  v17.super_class = (Class)type metadata accessor for LogGenericMedicationsIntent();
  id v7 = objc_msgSendSuper2(&v17, sel_initWithDomain_verb_parametersByName_, v12, v15, v9);

  id v5 = v7;
  id v23 = v7;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return v7;
}

id LogGenericMedicationsIntent.__deallocating_deinit()
{
  id v3 = v0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for LogGenericMedicationsIntent();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t LogGenericMedicationsIntentResponseCode.init(rawValue:)(uint64_t a1)
{
  switch(a1)
  {
    case 0:
      return 0;
    case 1:
      return 1;
    case 2:
      return 2;
    case 3:
      return 3;
    case 4:
      return 4;
    case 5:
      return 5;
    case 6:
      return 6;
    case 100:
      return 100;
    case 101:
      return 101;
    case 102:
      return 102;
    case 103:
      return 103;
    case 104:
      return 104;
    case 105:
      return 105;
    case 106:
      return 106;
    case 107:
      return 107;
    case 108:
      return 108;
  }
  return 0;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance LogGenericMedicationsIntentResponseCode()
{
  return == infix<A>(_:_:)() & 1;
}

uint64_t protocol witness for Hashable.hashValue.getter in conformance LogGenericMedicationsIntentResponseCode()
{
  return RawRepresentable<>.hashValue.getter();
}

uint64_t protocol witness for Hashable.hash(into:) in conformance LogGenericMedicationsIntentResponseCode()
{
  return RawRepresentable<>.hash(into:)();
}

uint64_t protocol witness for Hashable._rawHashValue(seed:) in conformance LogGenericMedicationsIntentResponseCode()
{
  return RawRepresentable<>._rawHashValue(seed:)();
}

uint64_t protocol witness for RawRepresentable.init(rawValue:) in conformance LogGenericMedicationsIntentResponseCode@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = LogGenericMedicationsIntentResponseCode.init(rawValue:)(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v3 & 1;
  return result;
}

void protocol witness for RawRepresentable.rawValue.getter in conformance LogGenericMedicationsIntentResponseCode(void *a1@<X8>)
{
  LogGenericMedicationsIntentResponseCode.rawValue.getter();
  *a1 = v1;
}

uint64_t LogGenericMedicationsIntentResponse.code.getter()
{
  objc_super v2 = (uint64_t *)(v0 + OBJC_IVAR___LogGenericMedicationsIntentResponse_code);
  swift_beginAccess();
  uint64_t v3 = *v2;
  swift_endAccess();
  return v3;
}

uint64_t LogGenericMedicationsIntentResponse.code.setter(uint64_t a1)
{
  uint64_t v3 = (void *)(v1 + OBJC_IVAR___LogGenericMedicationsIntentResponse_code);
  swift_beginAccess();
  *uint64_t v3 = a1;
  return swift_endAccess();
}

uint64_t (*LogGenericMedicationsIntentResponse.code.modify())()
{
  return LogQuantityIntentResponse.code.modify;
}

void key path getter for LogGenericMedicationsIntentResponse.code : LogGenericMedicationsIntentResponse(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v3 = *a1;
  id v2 = *a1;
  *a2 = LogGenericMedicationsIntentResponse.code.getter();
}

void key path setter for LogGenericMedicationsIntentResponse.code : LogGenericMedicationsIntentResponse(uint64_t *a1, id *a2)
{
  uint64_t v4 = *a1;
  id v3 = *a2;
  id v2 = *a2;
  LogGenericMedicationsIntentResponse.code.setter(v4);
}

char *LogGenericMedicationsIntentResponse.init(code:userActivity:)(uint64_t a1, void *a2)
{
  Class v9 = (char *)objc_msgSend(v10, sel_init);
  id v2 = v9;
  id v3 = v9;
  uint64_t v4 = v9;
  id v6 = &v9[OBJC_IVAR___LogGenericMedicationsIntentResponse_code];
  swift_beginAccess();
  *(void *)id v6 = a1;
  swift_endAccess();

  objc_msgSend(v9, sel_setUserActivity_, a2);
  return v9;
}

uint64_t type metadata accessor for LogGenericMedicationsIntent()
{
  return self;
}

id LogGenericMedicationsIntentResponse.__allocating_init()()
{
  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id LogGenericMedicationsIntentResponse.init()()
{
  uint64_t v1 = v0;
  id v6 = v0;
  *(void *)&v0[OBJC_IVAR___LogGenericMedicationsIntentResponse_code] = 0;

  v5.receiver = v6;
  v5.super_class = (Class)type metadata accessor for LogGenericMedicationsIntentResponse();
  id v4 = objc_msgSendSuper2(&v5, sel_init);
  id v2 = v4;
  id v6 = v4;

  return v4;
}

uint64_t type metadata accessor for LogGenericMedicationsIntentResponse()
{
  return self;
}

id LogGenericMedicationsIntentResponse.__allocating_init(coder:)(void *a1)
{
  id v4 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v4;
}

id LogGenericMedicationsIntentResponse.init(coder:)(void *a1)
{
  Class v9 = a1;
  id v2 = v1;
  id v10 = v1;
  *(void *)&v1[OBJC_IVAR___LogGenericMedicationsIntentResponse_code] = 0;

  v8.receiver = v10;
  v8.super_class = (Class)type metadata accessor for LogGenericMedicationsIntentResponse();
  id v7 = objc_msgSendSuper2(&v8, sel_initWithCoder_, a1);
  if (v7)
  {
    id v3 = v7;
    id v10 = v7;

    return v7;
  }
  else
  {

    return 0;
  }
}

id LogGenericMedicationsIntentResponse.__allocating_init(backingStore:)(void *a1)
{
  id v4 = objc_msgSend(objc_allocWithZone(v1), sel_initWithBackingStore_, a1);

  return v4;
}

id LogGenericMedicationsIntentResponse.init(backingStore:)(void *a1)
{
  Class v9 = a1;
  id v2 = v1;
  id v10 = v1;
  *(void *)&v1[OBJC_IVAR___LogGenericMedicationsIntentResponse_code] = 0;

  v8.receiver = v10;
  v8.super_class = (Class)type metadata accessor for LogGenericMedicationsIntentResponse();
  id v7 = objc_msgSendSuper2(&v8, sel_initWithBackingStore_, a1);
  if (v7)
  {
    id v3 = v7;
    id v10 = v7;

    return v7;
  }
  else
  {

    return 0;
  }
}

id LogGenericMedicationsIntentResponse.__allocating_init(propertiesByName:)(uint64_t a1)
{
  id v8 = objc_allocWithZone(v1);
  if (a1)
  {
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    id v2 = objc_msgSend(v8, sel_initWithPropertiesByName_, isa);
  }
  else
  {
    id v2 = objc_msgSend(v8, sel_initWithPropertiesByName_, 0);
  }
  id v5 = v2;

  return v5;
}

id LogGenericMedicationsIntentResponse.init(propertiesByName:)(uint64_t a1)
{
  uint64_t v11 = a1;
  id v2 = v1;
  id v12 = v1;
  *(void *)&v1[OBJC_IVAR___LogGenericMedicationsIntentResponse_code] = 0;

  swift_bridgeObjectRetain();
  if (a1)
  {
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    Class v8 = isa;
  }
  else
  {
    Class v8 = 0;
  }
  v10.receiver = v12;
  v10.super_class = (Class)type metadata accessor for LogGenericMedicationsIntentResponse();
  id v6 = objc_msgSendSuper2(&v10, sel_initWithPropertiesByName_, v8);

  if (v6)
  {
    id v3 = v6;
    id v12 = v6;
    swift_bridgeObjectRelease();

    return v6;
  }
  else
  {

    swift_bridgeObjectRelease();
    return 0;
  }
}

id LogGenericMedicationsIntentResponse.__deallocating_deinit()
{
  id v3 = v0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for LogGenericMedicationsIntentResponse();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t base witness table accessor for Equatable in LogGenericMedicationsIntentResponseCode()
{
  return lazy protocol witness table accessor for type LogGenericMedicationsIntentResponseCode and conformance LogGenericMedicationsIntentResponseCode();
}

unint64_t lazy protocol witness table accessor for type LogGenericMedicationsIntentResponseCode and conformance LogGenericMedicationsIntentResponseCode()
{
  uint64_t v2 = lazy protocol witness table cache variable for type LogGenericMedicationsIntentResponseCode and conformance LogGenericMedicationsIntentResponseCode;
  if (!lazy protocol witness table cache variable for type LogGenericMedicationsIntentResponseCode and conformance LogGenericMedicationsIntentResponseCode)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type LogGenericMedicationsIntentResponseCode and conformance LogGenericMedicationsIntentResponseCode);
    return WitnessTable;
  }
  return v2;
}

{
  unint64_t WitnessTable;
  uint64_t v2;

  uint64_t v2 = lazy protocol witness table cache variable for type LogGenericMedicationsIntentResponseCode and conformance LogGenericMedicationsIntentResponseCode;
  if (!lazy protocol witness table cache variable for type LogGenericMedicationsIntentResponseCode and conformance LogGenericMedicationsIntentResponseCode)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type LogGenericMedicationsIntentResponseCode and conformance LogGenericMedicationsIntentResponseCode);
    return WitnessTable;
  }
  return v2;
}

void sub_25DF1EFEC(id *a1@<X0>, uint64_t *a2@<X8>)
{
}

void sub_25DF1F004(uint64_t *a1, id *a2)
{
}

ValueMetadata *type metadata accessor for LogGenericMedicationsIntentResponseCode()
{
  return &type metadata for LogGenericMedicationsIntentResponseCode;
}

SiriWellnessIntents::WellnessNoun_optional __swiftcall WellnessNoun.init(rawValue:)(Swift::String rawValue)
{
  uint64_t v1 = _allocateUninitializedArray<A>(_:)();
  *(void *)uint64_t v2 = "abdominal_cramps";
  *(void *)(v2 + 8) = 16;
  *(unsigned char *)(v2 + 16) = 2;
  *(void *)(v2 + 24) = "acne";
  *(void *)(v2 + 32) = 4;
  *(unsigned char *)(v2 + 40) = 2;
  *(void *)(v2 + 48) = "appetite_changes";
  *(void *)(v2 + 56) = 16;
  *(unsigned char *)(v2 + 64) = 2;
  *(void *)(v2 + 72) = "audiogram";
  *(void *)(v2 + 80) = 9;
  *(unsigned char *)(v2 + 88) = 2;
  *(void *)(v2 + 96) = "basal_body_temperature";
  *(void *)(v2 + 104) = 22;
  *(unsigned char *)(v2 + 112) = 2;
  *(void *)(v2 + 120) = "bicycling";
  *(void *)(v2 + 128) = 9;
  *(unsigned char *)(v2 + 136) = 2;
  *(void *)(v2 + 144) = "biotin";
  *(void *)(v2 + 152) = 6;
  *(unsigned char *)(v2 + 160) = 2;
  *(void *)(v2 + 168) = "bladder_incontinence";
  *(void *)(v2 + 176) = 20;
  *(unsigned char *)(v2 + 184) = 2;
  *(void *)(v2 + 192) = "bloating";
  *(void *)(v2 + 200) = 8;
  *(unsigned char *)(v2 + 208) = 2;
  *(void *)(v2 + 216) = "blood_alcohol_content";
  *(void *)(v2 + 224) = 21;
  *(unsigned char *)(v2 + 232) = 2;
  *(void *)(v2 + 240) = "blood_glucose";
  *(void *)(v2 + 248) = 13;
  *(unsigned char *)(v2 + 256) = 2;
  *(void *)(v2 + 264) = "blood_pressure";
  *(void *)(v2 + 272) = 14;
  *(unsigned char *)(v2 + 280) = 2;
  *(void *)(v2 + 288) = "blood_pressure_diastolic";
  *(void *)(v2 + 296) = 24;
  *(unsigned char *)(v2 + 304) = 2;
  *(void *)(v2 + 312) = "blood_pressure_systolic";
  *(void *)(v2 + 320) = 23;
  *(unsigned char *)(v2 + 328) = 2;
  *(void *)(v2 + 336) = "body_fat_percentage";
  *(void *)(v2 + 344) = 19;
  *(unsigned char *)(v2 + 352) = 2;
  *(void *)(v2 + 360) = "body_mass_index";
  *(void *)(v2 + 368) = 15;
  *(unsigned char *)(v2 + 376) = 2;
  *(void *)(v2 + 384) = "body_temperature";
  *(void *)(v2 + 392) = 16;
  *(unsigned char *)(v2 + 400) = 2;
  *(void *)(v2 + 408) = "caffeine";
  *(void *)(v2 + 416) = 8;
  *(unsigned char *)(v2 + 424) = 2;
  *(void *)(v2 + 432) = "calcium";
  *(void *)(v2 + 440) = 7;
  *(unsigned char *)(v2 + 448) = 2;
  *(void *)(v2 + 456) = "carbohydrates";
  *(void *)(v2 + 464) = 13;
  *(unsigned char *)(v2 + 472) = 2;
  *(void *)(v2 + 480) = "cervical_mucus_quality";
  *(void *)(v2 + 488) = 22;
  *(unsigned char *)(v2 + 496) = 2;
  *(void *)(v2 + 504) = "chills";
  *(void *)(v2 + 512) = 6;
  *(unsigned char *)(v2 + 520) = 2;
  *(void *)(v2 + 528) = "chloride";
  *(void *)(v2 + 536) = 8;
  *(unsigned char *)(v2 + 544) = 2;
  *(void *)(v2 + 552) = "chromium";
  *(void *)(v2 + 560) = 8;
  *(unsigned char *)(v2 + 568) = 2;
  *(void *)(v2 + 576) = "constipation";
  *(void *)(v2 + 584) = 12;
  *(unsigned char *)(v2 + 592) = 2;
  *(void *)(v2 + 600) = "copper";
  *(void *)(v2 + 608) = 6;
  *(unsigned char *)(v2 + 616) = 2;
  *(void *)(v2 + 624) = "diarrhea";
  *(void *)(v2 + 632) = 8;
  *(unsigned char *)(v2 + 640) = 2;
  *(void *)(v2 + 648) = "diastolic_blood_pressure";
  *(void *)(v2 + 656) = 24;
  *(unsigned char *)(v2 + 664) = 2;
  *(void *)(v2 + 672) = "dietary_cholesterol";
  *(void *)(v2 + 680) = 19;
  *(unsigned char *)(v2 + 688) = 2;
  *(void *)(v2 + 696) = "dietary_sugar";
  *(void *)(v2 + 704) = 13;
  *(unsigned char *)(v2 + 712) = 2;
  *(void *)(v2 + 720) = "double_support";
  *(void *)(v2 + 728) = 14;
  *(unsigned char *)(v2 + 736) = 2;
  *(void *)(v2 + 744) = "dry_skin";
  *(void *)(v2 + 752) = 8;
  *(unsigned char *)(v2 + 760) = 2;
  *(void *)(v2 + 768) = "electrocardiogram";
  *(void *)(v2 + 776) = 17;
  *(unsigned char *)(v2 + 784) = 2;
  *(void *)(v2 + 792) = "electrodermal_activity";
  *(void *)(v2 + 800) = 22;
  *(unsigned char *)(v2 + 808) = 2;
  *(void *)(v2 + 816) = "environment_noise";
  *(void *)(v2 + 824) = 17;
  *(unsigned char *)(v2 + 832) = 2;
  *(void *)(v2 + 840) = "energy_consumed";
  *(void *)(v2 + 848) = 15;
  *(unsigned char *)(v2 + 856) = 2;
  *(void *)(v2 + 864) = "exercise";
  *(void *)(v2 + 872) = 8;
  *(unsigned char *)(v2 + 880) = 2;
  *(void *)(v2 + 888) = "exercise_ring";
  *(void *)(v2 + 896) = 13;
  *(unsigned char *)(v2 + 904) = 2;
  *(void *)(v2 + 912) = "fatigue";
  *(void *)(v2 + 920) = 7;
  *(unsigned char *)(v2 + 928) = 2;
  *(void *)(v2 + 936) = "fat_monounsaturated";
  *(void *)(v2 + 944) = 19;
  *(unsigned char *)(v2 + 952) = 2;
  *(void *)(v2 + 960) = "fat_polyunsaturated";
  *(void *)(v2 + 968) = 19;
  *(unsigned char *)(v2 + 976) = 2;
  *(void *)(v2 + 984) = "fat_saturated";
  *(void *)(v2 + 992) = 13;
  *(unsigned char *)(v2 + 1000) = 2;
  *(void *)(v2 + 1008) = "fat_total";
  *(void *)(v2 + 1016) = 9;
  *(unsigned char *)(v2 + 1024) = 2;
  *(void *)(v2 + 1032) = "fiber";
  *(void *)(v2 + 1040) = 5;
  *(unsigned char *)(v2 + 1048) = 2;
  *(void *)(v2 + 1056) = "flights";
  *(void *)(v2 + 1064) = 7;
  *(unsigned char *)(v2 + 1072) = 2;
  *(void *)(v2 + 1080) = "folate";
  *(void *)(v2 + 1088) = 6;
  *(unsigned char *)(v2 + 1096) = 2;
  *(void *)(v2 + 1104) = "forced_expiratory_volume";
  *(void *)(v2 + 1112) = 24;
  *(unsigned char *)(v2 + 1120) = 2;
  *(void *)(v2 + 1128) = "forced_vital_capacity";
  *(void *)(v2 + 1136) = 21;
  *(unsigned char *)(v2 + 1144) = 2;
  *(void *)(v2 + 1152) = "hair_loss";
  *(void *)(v2 + 1160) = 9;
  *(unsigned char *)(v2 + 1168) = 2;
  *(void *)(v2 + 1176) = "handwash";
  *(void *)(v2 + 1184) = 8;
  *(unsigned char *)(v2 + 1192) = 2;
  *(void *)(v2 + 1200) = "headache";
  *(void *)(v2 + 1208) = 8;
  *(unsigned char *)(v2 + 1216) = 2;
  *(void *)(v2 + 1224) = "headphone_audio";
  *(void *)(v2 + 1232) = 15;
  *(unsigned char *)(v2 + 1240) = 2;
  *(void *)(v2 + 1248) = "heart_rate";
  *(void *)(v2 + 1256) = 10;
  *(unsigned char *)(v2 + 1264) = 2;
  *(void *)(v2 + 1272) = "heart_rate_variability_sdnn";
  *(void *)(v2 + 1280) = 27;
  *(unsigned char *)(v2 + 1288) = 2;
  *(void *)(v2 + 1296) = "height";
  *(void *)(v2 + 1304) = 6;
  *(unsigned char *)(v2 + 1312) = 2;
  *(void *)(v2 + 1320) = "high_heart_rate";
  *(void *)(v2 + 1328) = 15;
  *(unsigned char *)(v2 + 1336) = 2;
  *(void *)(v2 + 1344) = "hot_flashes";
  *(void *)(v2 + 1352) = 11;
  *(unsigned char *)(v2 + 1360) = 2;
  *(void *)(v2 + 1368) = "inhaler_usage";
  *(void *)(v2 + 1376) = 13;
  *(unsigned char *)(v2 + 1384) = 2;
  *(void *)(v2 + 1392) = "insulin_delivery";
  *(void *)(v2 + 1400) = 16;
  *(unsigned char *)(v2 + 1408) = 2;
  *(void *)(v2 + 1416) = "iodine";
  *(void *)(v2 + 1424) = 6;
  *(unsigned char *)(v2 + 1432) = 2;
  *(void *)(v2 + 1440) = "irregular_heart_rate";
  *(void *)(v2 + 1448) = 20;
  *(unsigned char *)(v2 + 1456) = 2;
  *(void *)(v2 + 1464) = "iron";
  *(void *)(v2 + 1472) = 4;
  *(unsigned char *)(v2 + 1480) = 2;
  *(void *)(v2 + 1488) = "lean_body_mass";
  *(void *)(v2 + 1496) = 14;
  *(unsigned char *)(v2 + 1504) = 2;
  *(void *)(v2 + 1512) = "lower_back_pain";
  *(void *)(v2 + 1520) = 15;
  *(unsigned char *)(v2 + 1528) = 2;
  *(void *)(v2 + 1536) = "low_heart_rate";
  *(void *)(v2 + 1544) = 14;
  *(unsigned char *)(v2 + 1552) = 2;
  *(void *)(v2 + 1560) = "magnesium";
  *(void *)(v2 + 1568) = 9;
  *(unsigned char *)(v2 + 1576) = 2;
  *(void *)(v2 + 1584) = "manganese";
  *(void *)(v2 + 1592) = 9;
  *(unsigned char *)(v2 + 1600) = 2;
  *(void *)(v2 + 1608) = "memory_lapse";
  *(void *)(v2 + 1616) = 12;
  *(unsigned char *)(v2 + 1624) = 2;
  *(void *)(v2 + 1632) = "menstruation";
  *(void *)(v2 + 1640) = 12;
  *(unsigned char *)(v2 + 1648) = 2;
  *(void *)(v2 + 1656) = "mindful";
  *(void *)(v2 + 1664) = 7;
  *(unsigned char *)(v2 + 1672) = 2;
  *(void *)(v2 + 1680) = "mood_swing";
  *(void *)(v2 + 1688) = 10;
  *(unsigned char *)(v2 + 1696) = 2;
  *(void *)(v2 + 1704) = "move";
  *(void *)(v2 + 1712) = 4;
  *(unsigned char *)(v2 + 1720) = 2;
  *(void *)(v2 + 1728) = "move_ring";
  *(void *)(v2 + 1736) = 9;
  *(unsigned char *)(v2 + 1744) = 2;
  *(void *)(v2 + 1752) = "molybdenum";
  *(void *)(v2 + 1760) = 10;
  *(unsigned char *)(v2 + 1768) = 2;
  *(void *)(v2 + 1776) = "nausea";
  *(void *)(v2 + 1784) = 6;
  *(unsigned char *)(v2 + 1792) = 2;
  *(void *)(v2 + 1800) = "niacin";
  *(void *)(v2 + 1808) = 6;
  *(unsigned char *)(v2 + 1816) = 2;
  *(void *)(v2 + 1824) = "night_sweats";
  *(void *)(v2 + 1832) = 12;
  *(unsigned char *)(v2 + 1840) = 2;
  *(void *)(v2 + 1848) = "nikeFuel";
  *(void *)(v2 + 1856) = 8;
  *(unsigned char *)(v2 + 1864) = 2;
  *(void *)(v2 + 1872) = "number_of_times_fallen";
  *(void *)(v2 + 1880) = 22;
  *(unsigned char *)(v2 + 1888) = 2;
  *(void *)(v2 + 1896) = "oxygen_saturation";
  *(void *)(v2 + 1904) = 17;
  *(unsigned char *)(v2 + 1912) = 2;
  *(void *)(v2 + 1920) = "ovulation";
  *(void *)(v2 + 1928) = 9;
  *(unsigned char *)(v2 + 1936) = 2;
  *(void *)(v2 + 1944) = "pantothenic_acid";
  *(void *)(v2 + 1952) = 16;
  *(unsigned char *)(v2 + 1960) = 2;
  *(void *)(v2 + 1968) = "peak_expiratory_flow_rate";
  *(void *)(v2 + 1976) = 25;
  *(unsigned char *)(v2 + 1984) = 2;
  *(void *)(v2 + 1992) = "pelvic_pain";
  *(void *)(v2 + 2000) = 11;
  *(unsigned char *)(v2 + 2008) = 2;
  *(void *)(v2 + 2016) = "peripheral_perfusion_index";
  *(void *)(v2 + 2024) = 26;
  *(unsigned char *)(v2 + 2032) = 2;
  *(void *)(v2 + 2040) = "phosphorus";
  *(void *)(v2 + 2048) = 10;
  *(unsigned char *)(v2 + 2056) = 2;
  *(void *)(v2 + 2064) = "potassium";
  *(void *)(v2 + 2072) = 9;
  *(unsigned char *)(v2 + 2080) = 2;
  *(void *)(v2 + 2088) = "protein";
  *(void *)(v2 + 2096) = 7;
  *(unsigned char *)(v2 + 2104) = 2;
  *(void *)(v2 + 2112) = "respiratory_rate";
  *(void *)(v2 + 2120) = 16;
  *(unsigned char *)(v2 + 2128) = 2;
  *(void *)(v2 + 2136) = "resting_heart_rate";
  *(void *)(v2 + 2144) = 18;
  *(unsigned char *)(v2 + 2152) = 2;
  *(void *)(v2 + 2160) = "riboflavin";
  *(void *)(v2 + 2168) = 10;
  *(unsigned char *)(v2 + 2176) = 2;
  *(void *)(v2 + 2184) = "running";
  *(void *)(v2 + 2192) = 7;
  *(unsigned char *)(v2 + 2200) = 2;
  *(void *)(v2 + 2208) = "selenium";
  *(void *)(v2 + 2216) = 8;
  *(unsigned char *)(v2 + 2224) = 2;
  *(void *)(v2 + 2232) = "sexual_activity";
  *(void *)(v2 + 2240) = 15;
  *(unsigned char *)(v2 + 2248) = 2;
  *(void *)(v2 + 2256) = "six_minute_walk";
  *(void *)(v2 + 2264) = 15;
  *(unsigned char *)(v2 + 2272) = 2;
  *(void *)(v2 + 2280) = "sleep";
  *(void *)(v2 + 2288) = 5;
  *(unsigned char *)(v2 + 2296) = 2;
  *(void *)(v2 + 2304) = "sleep_changes";
  *(void *)(v2 + 2312) = 13;
  *(unsigned char *)(v2 + 2320) = 2;
  *(void *)(v2 + 2328) = "spotting";
  *(void *)(v2 + 2336) = 8;
  *(unsigned char *)(v2 + 2344) = 2;
  *(void *)(v2 + 2352) = "stand";
  *(void *)(v2 + 2360) = 5;
  *(unsigned char *)(v2 + 2368) = 2;
  *(void *)(v2 + 2376) = "stand_ring";
  *(void *)(v2 + 2384) = 10;
  *(unsigned char *)(v2 + 2392) = 2;
  *(void *)(v2 + 2400) = "swimming";
  *(void *)(v2 + 2408) = 8;
  *(unsigned char *)(v2 + 2416) = 2;
  *(void *)(v2 + 2424) = "sodium";
  *(void *)(v2 + 2432) = 6;
  *(unsigned char *)(v2 + 2440) = 2;
  *(void *)(v2 + 2448) = "thiamin";
  *(void *)(v2 + 2456) = 7;
  *(unsigned char *)(v2 + 2464) = 2;
  *(void *)(v2 + 2472) = "uv_index";
  *(void *)(v2 + 2480) = 8;
  *(unsigned char *)(v2 + 2488) = 2;
  *(void *)(v2 + 2496) = "vaginal_dryness";
  *(void *)(v2 + 2504) = 15;
  *(unsigned char *)(v2 + 2512) = 2;
  *(void *)(v2 + 2520) = "vitamin_a";
  *(void *)(v2 + 2528) = 9;
  *(unsigned char *)(v2 + 2536) = 2;
  *(void *)(v2 + 2544) = "vitamin_b12";
  *(void *)(v2 + 2552) = 11;
  *(unsigned char *)(v2 + 2560) = 2;
  *(void *)(v2 + 2568) = "vitamin_b6";
  *(void *)(v2 + 2576) = 10;
  *(unsigned char *)(v2 + 2584) = 2;
  *(void *)(v2 + 2592) = "vitamin_c";
  *(void *)(v2 + 2600) = 9;
  *(unsigned char *)(v2 + 2608) = 2;
  *(void *)(v2 + 2616) = "vitamin_d";
  *(void *)(v2 + 2624) = 9;
  *(unsigned char *)(v2 + 2632) = 2;
  *(void *)(v2 + 2640) = "vitamin_e";
  *(void *)(v2 + 2648) = 9;
  *(unsigned char *)(v2 + 2656) = 2;
  *(void *)(v2 + 2664) = "vitamin_k";
  *(void *)(v2 + 2672) = 9;
  *(unsigned char *)(v2 + 2680) = 2;
  *(void *)(v2 + 2688) = "vo2_max";
  *(void *)(v2 + 2696) = 7;
  *(unsigned char *)(v2 + 2704) = 2;
  *(void *)(v2 + 2712) = "waist_circumference";
  *(void *)(v2 + 2720) = 19;
  *(unsigned char *)(v2 + 2728) = 2;
  *(void *)(v2 + 2736) = "walking";
  *(void *)(v2 + 2744) = 7;
  *(unsigned char *)(v2 + 2752) = 2;
  *(void *)(v2 + 2760) = "walking_heart_rate_average";
  *(void *)(v2 + 2768) = 26;
  *(unsigned char *)(v2 + 2776) = 2;
  *(void *)(v2 + 2784) = "water";
  *(void *)(v2 + 2792) = 5;
  *(unsigned char *)(v2 + 2800) = 2;
  *(void *)(v2 + 2808) = "weight";
  *(void *)(v2 + 2816) = 6;
  *(unsigned char *)(v2 + 2824) = 2;
  *(void *)(v2 + 2832) = "workouts";
  *(void *)(v2 + 2840) = 8;
  *(unsigned char *)(v2 + 2848) = 2;
  *(void *)(v2 + 2856) = "zinc";
  *(void *)(v2 + 2864) = 4;
  *(unsigned char *)(v2 + 2872) = 2;
  *(void *)(v2 + 2880) = "unsupported";
  *(void *)(v2 + 2888) = 11;
  *(unsigned char *)(v2 + 2896) = 2;
  *(void *)(v2 + 2904) = "active_energy_burned";
  *(void *)(v2 + 2912) = 20;
  *(unsigned char *)(v2 + 2920) = 2;
  *(void *)(v2 + 2928) = "inBed";
  *(void *)(v2 + 2936) = 5;
  *(unsigned char *)(v2 + 2944) = 2;
  *(void *)(v2 + 2952) = "stepCount";
  *(void *)(v2 + 2960) = 9;
  *(unsigned char *)(v2 + 2968) = 2;
  _finalizeUninitializedArray<A>(_:)();
  Swift::Int v6 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)v1, rawValue);
  swift_bridgeObjectRelease();
  switch(v6)
  {
    case 0:
      v7.value = SiriWellnessIntents_WellnessNoun_abdominal_cramps;
LABEL_250:
      swift_bridgeObjectRelease();
      return v7;
    case 1:
      v7.value = SiriWellnessIntents_WellnessNoun_acne;
      goto LABEL_250;
    case 2:
      v7.value = SiriWellnessIntents_WellnessNoun_appetite_changes;
      goto LABEL_250;
    case 3:
      v7.value = SiriWellnessIntents_WellnessNoun_audiogram;
      goto LABEL_250;
    case 4:
      v7.value = SiriWellnessIntents_WellnessNoun_basal_body_temperature;
      goto LABEL_250;
    case 5:
      v7.value = SiriWellnessIntents_WellnessNoun_bicycling;
      goto LABEL_250;
    case 6:
      v7.value = SiriWellnessIntents_WellnessNoun_biotin;
      goto LABEL_250;
    case 7:
      v7.value = SiriWellnessIntents_WellnessNoun_bladder_incontinence;
      goto LABEL_250;
    case 8:
      v7.value = SiriWellnessIntents_WellnessNoun_bloating;
      goto LABEL_250;
    case 9:
      v7.value = SiriWellnessIntents_WellnessNoun_blood_alcohol_content;
      goto LABEL_250;
    case 10:
      v7.value = SiriWellnessIntents_WellnessNoun_blood_glucose;
      goto LABEL_250;
    case 11:
      v7.value = SiriWellnessIntents_WellnessNoun_blood_pressure;
      goto LABEL_250;
    case 12:
      v7.value = SiriWellnessIntents_WellnessNoun_blood_pressure_diastolic;
      goto LABEL_250;
    case 13:
      v7.value = SiriWellnessIntents_WellnessNoun_blood_pressure_systolic;
      goto LABEL_250;
    case 14:
      v7.value = SiriWellnessIntents_WellnessNoun_body_fat_percentage;
      goto LABEL_250;
    case 15:
      v7.value = SiriWellnessIntents_WellnessNoun_body_mass_index;
      goto LABEL_250;
    case 16:
      v7.value = SiriWellnessIntents_WellnessNoun_body_temperature;
      goto LABEL_250;
    case 17:
      v7.value = SiriWellnessIntents_WellnessNoun_caffeine;
      goto LABEL_250;
    case 18:
      v7.value = SiriWellnessIntents_WellnessNoun_calcium;
      goto LABEL_250;
    case 19:
      v7.value = SiriWellnessIntents_WellnessNoun_carbohydrates;
      goto LABEL_250;
    case 20:
      v7.value = SiriWellnessIntents_WellnessNoun_cervical_mucus_quality;
      goto LABEL_250;
    case 21:
      v7.value = SiriWellnessIntents_WellnessNoun_chills;
      goto LABEL_250;
    case 22:
      v7.value = SiriWellnessIntents_WellnessNoun_chloride;
      goto LABEL_250;
    case 23:
      v7.value = SiriWellnessIntents_WellnessNoun_chromium;
      goto LABEL_250;
    case 24:
      v7.value = SiriWellnessIntents_WellnessNoun_constipation;
      goto LABEL_250;
    case 25:
      v7.value = SiriWellnessIntents_WellnessNoun_copper;
      goto LABEL_250;
    case 26:
      v7.value = SiriWellnessIntents_WellnessNoun_diarrhea;
      goto LABEL_250;
    case 27:
      v7.value = SiriWellnessIntents_WellnessNoun_diastolic_blood_pressure;
      goto LABEL_250;
    case 28:
      v7.value = SiriWellnessIntents_WellnessNoun_dietary_cholesterol;
      goto LABEL_250;
    case 29:
      v7.value = SiriWellnessIntents_WellnessNoun_dietary_sugar;
      goto LABEL_250;
    case 30:
      v7.value = SiriWellnessIntents_WellnessNoun_double_support;
      goto LABEL_250;
    case 31:
      v7.value = SiriWellnessIntents_WellnessNoun_dry_skin;
      goto LABEL_250;
    case 32:
      v7.value = SiriWellnessIntents_WellnessNoun_electrocardiogram;
      goto LABEL_250;
    case 33:
      v7.value = SiriWellnessIntents_WellnessNoun_electrodermal_activity;
      goto LABEL_250;
    case 34:
      v7.value = SiriWellnessIntents_WellnessNoun_environment_noise;
      goto LABEL_250;
    case 35:
      v7.value = SiriWellnessIntents_WellnessNoun_energy_consumed;
      goto LABEL_250;
    case 36:
      v7.value = SiriWellnessIntents_WellnessNoun_exercise;
      goto LABEL_250;
    case 37:
      v7.value = SiriWellnessIntents_WellnessNoun_exercise_ring;
      goto LABEL_250;
    case 38:
      v7.value = SiriWellnessIntents_WellnessNoun_fatigue;
      goto LABEL_250;
    case 39:
      v7.value = SiriWellnessIntents_WellnessNoun_fat_monounsaturated;
      goto LABEL_250;
    case 40:
      v7.value = SiriWellnessIntents_WellnessNoun_fat_polyunsaturated;
      goto LABEL_250;
    case 41:
      v7.value = SiriWellnessIntents_WellnessNoun_fat_saturated;
      goto LABEL_250;
    case 42:
      v7.value = SiriWellnessIntents_WellnessNoun_fat_total;
      goto LABEL_250;
    case 43:
      v7.value = SiriWellnessIntents_WellnessNoun_fiber;
      goto LABEL_250;
    case 44:
      v7.value = SiriWellnessIntents_WellnessNoun_flights;
      goto LABEL_250;
    case 45:
      v7.value = SiriWellnessIntents_WellnessNoun_folate;
      goto LABEL_250;
    case 46:
      v7.value = SiriWellnessIntents_WellnessNoun_forced_expiratory_volume;
      goto LABEL_250;
    case 47:
      v7.value = SiriWellnessIntents_WellnessNoun_forced_vital_capacity;
      goto LABEL_250;
    case 48:
      v7.value = SiriWellnessIntents_WellnessNoun_hair_loss;
      goto LABEL_250;
    case 49:
      v7.value = SiriWellnessIntents_WellnessNoun_handwash;
      goto LABEL_250;
    case 50:
      v7.value = SiriWellnessIntents_WellnessNoun_headache;
      goto LABEL_250;
    case 51:
      v7.value = SiriWellnessIntents_WellnessNoun_headphone_audio;
      goto LABEL_250;
    case 52:
      v7.value = SiriWellnessIntents_WellnessNoun_heart_rate;
      goto LABEL_250;
    case 53:
      v7.value = SiriWellnessIntents_WellnessNoun_heart_rate_variability_sdnn;
      goto LABEL_250;
    case 54:
      v7.value = SiriWellnessIntents_WellnessNoun_height;
      goto LABEL_250;
    case 55:
      v7.value = SiriWellnessIntents_WellnessNoun_high_heart_rate;
      goto LABEL_250;
    case 56:
      v7.value = SiriWellnessIntents_WellnessNoun_hot_flashes;
      goto LABEL_250;
    case 57:
      v7.value = SiriWellnessIntents_WellnessNoun_inhaler_usage;
      goto LABEL_250;
    case 58:
      v7.value = SiriWellnessIntents_WellnessNoun_insulin_delivery;
      goto LABEL_250;
    case 59:
      v7.value = SiriWellnessIntents_WellnessNoun_iodine;
      goto LABEL_250;
    case 60:
      v7.value = SiriWellnessIntents_WellnessNoun_irregular_heart_rate;
      goto LABEL_250;
    case 61:
      v7.value = SiriWellnessIntents_WellnessNoun_iron;
      goto LABEL_250;
    case 62:
      v7.value = SiriWellnessIntents_WellnessNoun_lean_body_mass;
      goto LABEL_250;
    case 63:
      v7.value = SiriWellnessIntents_WellnessNoun_lower_back_pain;
      goto LABEL_250;
    case 64:
      v7.value = SiriWellnessIntents_WellnessNoun_low_heart_rate;
      goto LABEL_250;
    case 65:
      v7.value = SiriWellnessIntents_WellnessNoun_magnesium;
      goto LABEL_250;
    case 66:
      v7.value = SiriWellnessIntents_WellnessNoun_manganese;
      goto LABEL_250;
    case 67:
      v7.value = SiriWellnessIntents_WellnessNoun_memory_lapse;
      goto LABEL_250;
    case 68:
      v7.value = SiriWellnessIntents_WellnessNoun_menstruation;
      goto LABEL_250;
    case 69:
      v7.value = SiriWellnessIntents_WellnessNoun_mindful;
      goto LABEL_250;
    case 70:
      v7.value = SiriWellnessIntents_WellnessNoun_mood_swing;
      goto LABEL_250;
    case 71:
      v7.value = SiriWellnessIntents_WellnessNoun_move;
      goto LABEL_250;
    case 72:
      v7.value = SiriWellnessIntents_WellnessNoun_move_ring;
      goto LABEL_250;
    case 73:
      v7.value = SiriWellnessIntents_WellnessNoun_molybdenum;
      goto LABEL_250;
    case 74:
      v7.value = SiriWellnessIntents_WellnessNoun_nausea;
      goto LABEL_250;
    case 75:
      v7.value = SiriWellnessIntents_WellnessNoun_niacin;
      goto LABEL_250;
    case 76:
      v7.value = SiriWellnessIntents_WellnessNoun_night_sweats;
      goto LABEL_250;
    case 77:
      v7.value = SiriWellnessIntents_WellnessNoun_nikeFuel;
      goto LABEL_250;
    case 78:
      v7.value = SiriWellnessIntents_WellnessNoun_number_of_times_fallen;
      goto LABEL_250;
    case 79:
      v7.value = SiriWellnessIntents_WellnessNoun_oxygen_saturation;
      goto LABEL_250;
    case 80:
      v7.value = SiriWellnessIntents_WellnessNoun_ovulation;
      goto LABEL_250;
    case 81:
      v7.value = SiriWellnessIntents_WellnessNoun_pantothenic_acid;
      goto LABEL_250;
    case 82:
      v7.value = SiriWellnessIntents_WellnessNoun_peak_expiratory_flow_rate;
      goto LABEL_250;
    case 83:
      v7.value = SiriWellnessIntents_WellnessNoun_pelvic_pain;
      goto LABEL_250;
    case 84:
      v7.value = SiriWellnessIntents_WellnessNoun_peripheral_perfusion_index;
      goto LABEL_250;
    case 85:
      v7.value = SiriWellnessIntents_WellnessNoun_phosphorus;
      goto LABEL_250;
    case 86:
      v7.value = SiriWellnessIntents_WellnessNoun_potassium;
      goto LABEL_250;
    case 87:
      v7.value = SiriWellnessIntents_WellnessNoun_protein;
      goto LABEL_250;
    case 88:
      v7.value = SiriWellnessIntents_WellnessNoun_respiratory_rate;
      goto LABEL_250;
    case 89:
      v7.value = SiriWellnessIntents_WellnessNoun_resting_heart_rate;
      goto LABEL_250;
    case 90:
      v7.value = SiriWellnessIntents_WellnessNoun_riboflavin;
      goto LABEL_250;
    case 91:
      v7.value = SiriWellnessIntents_WellnessNoun_running;
      goto LABEL_250;
    case 92:
      v7.value = SiriWellnessIntents_WellnessNoun_selenium;
      goto LABEL_250;
    case 93:
      v7.value = SiriWellnessIntents_WellnessNoun_sexual_activity;
      goto LABEL_250;
    case 94:
      v7.value = SiriWellnessIntents_WellnessNoun_six_minute_walk;
      goto LABEL_250;
    case 95:
      v7.value = SiriWellnessIntents_WellnessNoun_sleep;
      goto LABEL_250;
    case 96:
      v7.value = SiriWellnessIntents_WellnessNoun_sleep_changes;
      goto LABEL_250;
    case 97:
      v7.value = SiriWellnessIntents_WellnessNoun_spotting;
      goto LABEL_250;
    case 98:
      v7.value = SiriWellnessIntents_WellnessNoun_stand;
      goto LABEL_250;
    case 99:
      v7.value = SiriWellnessIntents_WellnessNoun_stand_ring;
      goto LABEL_250;
    case 100:
      v7.value = SiriWellnessIntents_WellnessNoun_swimming;
      goto LABEL_250;
    case 101:
      v7.value = SiriWellnessIntents_WellnessNoun_sodium;
      goto LABEL_250;
    case 102:
      v7.value = SiriWellnessIntents_WellnessNoun_thiamin;
      goto LABEL_250;
    case 103:
      v7.value = SiriWellnessIntents_WellnessNoun_uv_index;
      goto LABEL_250;
    case 104:
      v7.value = SiriWellnessIntents_WellnessNoun_vaginal_dryness;
      goto LABEL_250;
    case 105:
      v7.value = SiriWellnessIntents_WellnessNoun_vitamin_a;
      goto LABEL_250;
    case 106:
      v7.value = SiriWellnessIntents_WellnessNoun_vitamin_b12;
      goto LABEL_250;
    case 107:
      v7.value = SiriWellnessIntents_WellnessNoun_vitamin_b6;
      goto LABEL_250;
    case 108:
      v7.value = SiriWellnessIntents_WellnessNoun_vitamin_c;
      goto LABEL_250;
    case 109:
      v7.value = SiriWellnessIntents_WellnessNoun_vitamin_d;
      goto LABEL_250;
    case 110:
      v7.value = SiriWellnessIntents_WellnessNoun_vitamin_e;
      goto LABEL_250;
    case 111:
      v7.value = SiriWellnessIntents_WellnessNoun_vitamin_k;
      goto LABEL_250;
    case 112:
      v7.value = SiriWellnessIntents_WellnessNoun_vo2_max;
      goto LABEL_250;
    case 113:
      v7.value = SiriWellnessIntents_WellnessNoun_waist_circumference;
      goto LABEL_250;
    case 114:
      v7.value = SiriWellnessIntents_WellnessNoun_walking;
      goto LABEL_250;
    case 115:
      v7.value = SiriWellnessIntents_WellnessNoun_walking_heart_rate_average;
      goto LABEL_250;
    case 116:
      v7.value = SiriWellnessIntents_WellnessNoun_water;
      goto LABEL_250;
    case 117:
      v7.value = SiriWellnessIntents_WellnessNoun_weight;
      goto LABEL_250;
    case 118:
      v7.value = SiriWellnessIntents_WellnessNoun_workouts;
      goto LABEL_250;
    case 119:
      v7.value = SiriWellnessIntents_WellnessNoun_zinc;
      goto LABEL_250;
    case 120:
      v7.value = SiriWellnessIntents_WellnessNoun_unsupported;
      goto LABEL_250;
    case 121:
      v7.value = SiriWellnessIntents_WellnessNoun_active_energy_burned;
      goto LABEL_250;
    case 122:
      v7.value = SiriWellnessIntents_WellnessNoun_inBed;
      goto LABEL_250;
    case 123:
      v7.value = SiriWellnessIntents_WellnessNoun_stepCount;
      goto LABEL_250;
  }
  swift_bridgeObjectRelease();
  return (SiriWellnessIntents::WellnessNoun_optional)124;
}

uint64_t static WellnessNoun.allCases.getter()
{
  uint64_t result = _allocateUninitializedArray<A>(_:)();
  unsigned char *v1 = 0;
  v1[1] = 1;
  v1[2] = 2;
  v1[3] = 3;
  v1[4] = 4;
  v1[5] = 5;
  v1[6] = 6;
  v1[7] = 7;
  v1[8] = 8;
  v1[9] = 9;
  v1[10] = 10;
  v1[11] = 11;
  v1[12] = 12;
  v1[13] = 13;
  v1[14] = 14;
  v1[15] = 15;
  v1[16] = 16;
  v1[17] = 17;
  v1[18] = 18;
  v1[19] = 19;
  v1[20] = 20;
  v1[21] = 21;
  v1[22] = 22;
  v1[23] = 23;
  v1[24] = 24;
  v1[25] = 25;
  v1[26] = 26;
  v1[27] = 27;
  v1[28] = 28;
  v1[29] = 29;
  v1[30] = 30;
  v1[31] = 31;
  _finalizeUninitializedArray<A>(_:)();
  return result;
}

uint64_t WellnessNoun.rawValue.getter(char a1)
{
  switch(a1)
  {
    case 1:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("acne", 4uLL, 1)._countAndFlagsBits;
      break;
    case 2:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("appetite_changes", 0x10uLL, 1)._countAndFlagsBits;
      break;
    case 3:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("audiogram", 9uLL, 1)._countAndFlagsBits;
      break;
    case 4:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("basal_body_temperature", 0x16uLL, 1)._countAndFlagsBits;
      break;
    case 5:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("bicycling", 9uLL, 1)._countAndFlagsBits;
      break;
    case 6:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("biotin", 6uLL, 1)._countAndFlagsBits;
      break;
    case 7:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("bladder_incontinence", 0x14uLL, 1)._countAndFlagsBits;
      break;
    case 8:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("bloating", 8uLL, 1)._countAndFlagsBits;
      break;
    case 9:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("blood_alcohol_content", 0x15uLL, 1)._countAndFlagsBits;
      break;
    case 10:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("blood_glucose", 0xDuLL, 1)._countAndFlagsBits;
      break;
    case 11:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("blood_pressure", 0xEuLL, 1)._countAndFlagsBits;
      break;
    case 12:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("blood_pressure_diastolic", 0x18uLL, 1)._countAndFlagsBits;
      break;
    case 13:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("blood_pressure_systolic", 0x17uLL, 1)._countAndFlagsBits;
      break;
    case 14:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("body_fat_percentage", 0x13uLL, 1)._countAndFlagsBits;
      break;
    case 15:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("body_mass_index", 0xFuLL, 1)._countAndFlagsBits;
      break;
    case 16:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("body_temperature", 0x10uLL, 1)._countAndFlagsBits;
      break;
    case 17:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("caffeine", 8uLL, 1)._countAndFlagsBits;
      break;
    case 18:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("calcium", 7uLL, 1)._countAndFlagsBits;
      break;
    case 19:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("carbohydrates", 0xDuLL, 1)._countAndFlagsBits;
      break;
    case 20:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("cervical_mucus_quality", 0x16uLL, 1)._countAndFlagsBits;
      break;
    case 21:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("chills", 6uLL, 1)._countAndFlagsBits;
      break;
    case 22:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("chloride", 8uLL, 1)._countAndFlagsBits;
      break;
    case 23:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("chromium", 8uLL, 1)._countAndFlagsBits;
      break;
    case 24:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("constipation", 0xCuLL, 1)._countAndFlagsBits;
      break;
    case 25:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("copper", 6uLL, 1)._countAndFlagsBits;
      break;
    case 26:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("diarrhea", 8uLL, 1)._countAndFlagsBits;
      break;
    case 27:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("diastolic_blood_pressure", 0x18uLL, 1)._countAndFlagsBits;
      break;
    case 28:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("dietary_cholesterol", 0x13uLL, 1)._countAndFlagsBits;
      break;
    case 29:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("dietary_sugar", 0xDuLL, 1)._countAndFlagsBits;
      break;
    case 30:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("double_support", 0xEuLL, 1)._countAndFlagsBits;
      break;
    case 31:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("dry_skin", 8uLL, 1)._countAndFlagsBits;
      break;
    case 32:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("electrocardiogram", 0x11uLL, 1)._countAndFlagsBits;
      break;
    case 33:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("electrodermal_activity", 0x16uLL, 1)._countAndFlagsBits;
      break;
    case 34:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("environment_noise", 0x11uLL, 1)._countAndFlagsBits;
      break;
    case 35:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("energy_consumed", 0xFuLL, 1)._countAndFlagsBits;
      break;
    case 36:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("exercise", 8uLL, 1)._countAndFlagsBits;
      break;
    case 37:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("exercise_ring", 0xDuLL, 1)._countAndFlagsBits;
      break;
    case 38:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("fatigue", 7uLL, 1)._countAndFlagsBits;
      break;
    case 39:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("fat_monounsaturated", 0x13uLL, 1)._countAndFlagsBits;
      break;
    case 40:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("fat_polyunsaturated", 0x13uLL, 1)._countAndFlagsBits;
      break;
    case 41:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("fat_saturated", 0xDuLL, 1)._countAndFlagsBits;
      break;
    case 42:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("fat_total", 9uLL, 1)._countAndFlagsBits;
      break;
    case 43:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("fiber", 5uLL, 1)._countAndFlagsBits;
      break;
    case 44:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("flights", 7uLL, 1)._countAndFlagsBits;
      break;
    case 45:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("folate", 6uLL, 1)._countAndFlagsBits;
      break;
    case 46:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("forced_expiratory_volume", 0x18uLL, 1)._countAndFlagsBits;
      break;
    case 47:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("forced_vital_capacity", 0x15uLL, 1)._countAndFlagsBits;
      break;
    case 48:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("hair_loss", 9uLL, 1)._countAndFlagsBits;
      break;
    case 49:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("handwash", 8uLL, 1)._countAndFlagsBits;
      break;
    case 50:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("headache", 8uLL, 1)._countAndFlagsBits;
      break;
    case 51:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("headphone_audio", 0xFuLL, 1)._countAndFlagsBits;
      break;
    case 52:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("heart_rate", 0xAuLL, 1)._countAndFlagsBits;
      break;
    case 53:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("heart_rate_variability_sdnn", 0x1BuLL, 1)._countAndFlagsBits;
      break;
    case 54:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("height", 6uLL, 1)._countAndFlagsBits;
      break;
    case 55:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("high_heart_rate", 0xFuLL, 1)._countAndFlagsBits;
      break;
    case 56:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("hot_flashes", 0xBuLL, 1)._countAndFlagsBits;
      break;
    case 57:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("inhaler_usage", 0xDuLL, 1)._countAndFlagsBits;
      break;
    case 58:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("insulin_delivery", 0x10uLL, 1)._countAndFlagsBits;
      break;
    case 59:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("iodine", 6uLL, 1)._countAndFlagsBits;
      break;
    case 60:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("irregular_heart_rate", 0x14uLL, 1)._countAndFlagsBits;
      break;
    case 61:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("iron", 4uLL, 1)._countAndFlagsBits;
      break;
    case 62:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("lean_body_mass", 0xEuLL, 1)._countAndFlagsBits;
      break;
    case 63:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("lower_back_pain", 0xFuLL, 1)._countAndFlagsBits;
      break;
    case 64:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("low_heart_rate", 0xEuLL, 1)._countAndFlagsBits;
      break;
    case 65:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("magnesium", 9uLL, 1)._countAndFlagsBits;
      break;
    case 66:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("manganese", 9uLL, 1)._countAndFlagsBits;
      break;
    case 67:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("memory_lapse", 0xCuLL, 1)._countAndFlagsBits;
      break;
    case 68:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("menstruation", 0xCuLL, 1)._countAndFlagsBits;
      break;
    case 69:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("mindful", 7uLL, 1)._countAndFlagsBits;
      break;
    case 70:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("mood_swing", 0xAuLL, 1)._countAndFlagsBits;
      break;
    case 71:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("move", 4uLL, 1)._countAndFlagsBits;
      break;
    case 72:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("move_ring", 9uLL, 1)._countAndFlagsBits;
      break;
    case 73:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("molybdenum", 0xAuLL, 1)._countAndFlagsBits;
      break;
    case 74:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("nausea", 6uLL, 1)._countAndFlagsBits;
      break;
    case 75:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("niacin", 6uLL, 1)._countAndFlagsBits;
      break;
    case 76:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("night_sweats", 0xCuLL, 1)._countAndFlagsBits;
      break;
    case 77:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("nikeFuel", 8uLL, 1)._countAndFlagsBits;
      break;
    case 78:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("number_of_times_fallen", 0x16uLL, 1)._countAndFlagsBits;
      break;
    case 79:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("oxygen_saturation", 0x11uLL, 1)._countAndFlagsBits;
      break;
    case 80:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("ovulation", 9uLL, 1)._countAndFlagsBits;
      break;
    case 81:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("pantothenic_acid", 0x10uLL, 1)._countAndFlagsBits;
      break;
    case 82:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("peak_expiratory_flow_rate", 0x19uLL, 1)._countAndFlagsBits;
      break;
    case 83:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("pelvic_pain", 0xBuLL, 1)._countAndFlagsBits;
      break;
    case 84:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("peripheral_perfusion_index", 0x1AuLL, 1)._countAndFlagsBits;
      break;
    case 85:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("phosphorus", 0xAuLL, 1)._countAndFlagsBits;
      break;
    case 86:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("potassium", 9uLL, 1)._countAndFlagsBits;
      break;
    case 87:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("protein", 7uLL, 1)._countAndFlagsBits;
      break;
    case 88:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("respiratory_rate", 0x10uLL, 1)._countAndFlagsBits;
      break;
    case 89:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("resting_heart_rate", 0x12uLL, 1)._countAndFlagsBits;
      break;
    case 90:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("riboflavin", 0xAuLL, 1)._countAndFlagsBits;
      break;
    case 91:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("running", 7uLL, 1)._countAndFlagsBits;
      break;
    case 92:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("selenium", 8uLL, 1)._countAndFlagsBits;
      break;
    case 93:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("sexual_activity", 0xFuLL, 1)._countAndFlagsBits;
      break;
    case 94:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("six_minute_walk", 0xFuLL, 1)._countAndFlagsBits;
      break;
    case 95:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("sleep", 5uLL, 1)._countAndFlagsBits;
      break;
    case 96:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("sleep_changes", 0xDuLL, 1)._countAndFlagsBits;
      break;
    case 97:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("spotting", 8uLL, 1)._countAndFlagsBits;
      break;
    case 98:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("stand", 5uLL, 1)._countAndFlagsBits;
      break;
    case 99:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("stand_ring", 0xAuLL, 1)._countAndFlagsBits;
      break;
    case 100:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("swimming", 8uLL, 1)._countAndFlagsBits;
      break;
    case 101:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("sodium", 6uLL, 1)._countAndFlagsBits;
      break;
    case 102:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("thiamin", 7uLL, 1)._countAndFlagsBits;
      break;
    case 103:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("uv_index", 8uLL, 1)._countAndFlagsBits;
      break;
    case 104:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("vaginal_dryness", 0xFuLL, 1)._countAndFlagsBits;
      break;
    case 105:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("vitamin_a", 9uLL, 1)._countAndFlagsBits;
      break;
    case 106:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("vitamin_b12", 0xBuLL, 1)._countAndFlagsBits;
      break;
    case 107:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("vitamin_b6", 0xAuLL, 1)._countAndFlagsBits;
      break;
    case 108:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("vitamin_c", 9uLL, 1)._countAndFlagsBits;
      break;
    case 109:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("vitamin_d", 9uLL, 1)._countAndFlagsBits;
      break;
    case 110:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("vitamin_e", 9uLL, 1)._countAndFlagsBits;
      break;
    case 111:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("vitamin_k", 9uLL, 1)._countAndFlagsBits;
      break;
    case 112:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("vo2_max", 7uLL, 1)._countAndFlagsBits;
      break;
    case 113:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("waist_circumference", 0x13uLL, 1)._countAndFlagsBits;
      break;
    case 114:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("walking", 7uLL, 1)._countAndFlagsBits;
      break;
    case 115:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("walking_heart_rate_average", 0x1AuLL, 1)._countAndFlagsBits;
      break;
    case 116:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("water", 5uLL, 1)._countAndFlagsBits;
      break;
    case 117:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("weight", 6uLL, 1)._countAndFlagsBits;
      break;
    case 118:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("workouts", 8uLL, 1)._countAndFlagsBits;
      break;
    case 119:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("zinc", 4uLL, 1)._countAndFlagsBits;
      break;
    case 120:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("unsupported", 0xBuLL, 1)._countAndFlagsBits;
      break;
    case 121:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("active_energy_burned", 0x14uLL, 1)._countAndFlagsBits;
      break;
    case 122:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("inBed", 5uLL, 1)._countAndFlagsBits;
      break;
    case 123:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("stepCount", 9uLL, 1)._countAndFlagsBits;
      break;
    default:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("abdominal_cramps", 0x10uLL, 1)._countAndFlagsBits;
      break;
  }
  return countAndFlagsBits;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance WellnessNoun()
{
  return == infix<A>(_:_:)() & 1;
}

unint64_t base witness table accessor for Equatable in WellnessNoun()
{
  return lazy protocol witness table accessor for type WellnessNoun and conformance WellnessNoun();
}

unint64_t lazy protocol witness table accessor for type WellnessNoun and conformance WellnessNoun()
{
  uint64_t v2 = lazy protocol witness table cache variable for type WellnessNoun and conformance WellnessNoun;
  if (!lazy protocol witness table cache variable for type WellnessNoun and conformance WellnessNoun)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type WellnessNoun and conformance WellnessNoun);
    return WitnessTable;
  }
  return v2;
}

{
  unint64_t WitnessTable;
  uint64_t v2;

  uint64_t v2 = lazy protocol witness table cache variable for type WellnessNoun and conformance WellnessNoun;
  if (!lazy protocol witness table cache variable for type WellnessNoun and conformance WellnessNoun)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type WellnessNoun and conformance WellnessNoun);
    return WitnessTable;
  }
  return v2;
}

uint64_t protocol witness for Hashable.hashValue.getter in conformance WellnessNoun()
{
  return RawRepresentable<>.hashValue.getter();
}

uint64_t protocol witness for Hashable.hash(into:) in conformance WellnessNoun()
{
  return RawRepresentable<>.hash(into:)();
}

uint64_t protocol witness for Hashable._rawHashValue(seed:) in conformance WellnessNoun()
{
  return RawRepresentable<>._rawHashValue(seed:)();
}

SiriWellnessIntents::WellnessNoun_optional protocol witness for RawRepresentable.init(rawValue:) in conformance WellnessNoun@<W0>(Swift::String *a1@<X0>, SiriWellnessIntents::WellnessNoun_optional *a2@<X8>)
{
  result.value = WellnessNoun.init(rawValue:)(*a1).value;
  a2->value = result.value;
  return result;
}

uint64_t protocol witness for RawRepresentable.rawValue.getter in conformance WellnessNoun@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = WellnessNoun.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v3;
  return result;
}

unint64_t associated type witness table accessor for CaseIterable.AllCases : Collection in WellnessNoun()
{
  return lazy protocol witness table accessor for type [WellnessNoun] and conformance [A]();
}

unint64_t lazy protocol witness table accessor for type [WellnessNoun] and conformance [A]()
{
  uint64_t v2 = lazy protocol witness table cache variable for type [WellnessNoun] and conformance [A];
  if (!lazy protocol witness table cache variable for type [WellnessNoun] and conformance [A])
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [WellnessNoun]);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type [WellnessNoun] and conformance [A]);
    return WitnessTable;
  }
  return v2;
}

uint64_t protocol witness for static CaseIterable.allCases.getter in conformance WellnessNoun@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = static WellnessNoun.allCases.getter();
  *a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for WellnessNoun(unsigned __int8 *a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 <= 0x84) {
      goto LABEL_15;
    }
    unsigned int v7 = ((a2 + 123) >> 8) + 1;
    int v8 = 1;
    if (v7 >= 0x100)
    {
      if (v7 >= 0x10000) {
        int v2 = 4;
      }
      else {
        int v2 = 2;
      }
      int v8 = v2;
    }
    if (v8 == 1) {
      int v6 = a1[1];
    }
    else {
      int v6 = v8 == 2 ? *(unsigned __int16 *)(a1 + 1) : *(_DWORD *)(a1 + 1);
    }
    if (v6)
    {
      int v5 = (*a1 | ((v6 - 1) << 8)) + 132;
    }
    else
    {
LABEL_15:
      int v3 = *a1 - 124;
      if (v3 < 0) {
        int v3 = -1;
      }
      int v5 = v3;
    }
  }
  else
  {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for WellnessNoun(unsigned char *result, unsigned int a2, unsigned int a3)
{
  int v7 = 0;
  if (a3 > 0x84)
  {
    unsigned int v5 = ((a3 + 123) >> 8) + 1;
    int v6 = 1;
    if (v5 >= 0x100)
    {
      if (v5 >= 0x10000) {
        int v3 = 4;
      }
      else {
        int v3 = 2;
      }
      int v6 = v3;
    }
    int v7 = v6;
  }
  if (a2 > 0x84)
  {
    unsigned int v4 = ((a2 - 133) >> 8) + 1;
    *uint64_t result = a2 + 123;
    if (v7)
    {
      if (v7 == 1)
      {
        result[1] = v4;
      }
      else if (v7 == 2)
      {
        *(_WORD *)(result + 1) = v4;
      }
      else
      {
        *(_DWORD *)(result + 1) = v4;
      }
    }
  }
  else
  {
    if (v7)
    {
      if (v7 == 1)
      {
        result[1] = 0;
      }
      else if (v7 == 2)
      {
        *(_WORD *)(result + 1) = 0;
      }
      else
      {
        *(_DWORD *)(result + 1) = 0;
      }
    }
    if (a2) {
      *uint64_t result = a2 + 123;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for WellnessNoun()
{
  return &type metadata for WellnessNoun;
}

id LogBloodPressureIntentHandler.__allocating_init(storage:)(void *a1)
{
  id v2 = objc_allocWithZone(v1);
  return LogBloodPressureIntentHandler.init(storage:)(a1);
}

id LogBloodPressureIntentHandler.init(storage:)(void *a1)
{
  ObjectType = (objc_class *)swift_getObjectType();
  __dst[5] = a1;
  id v2 = v1;
  id v13 = v1;
  outlined init with copy of QuantityPersisting?(a1, v11);
  if (v11[3])
  {
    outlined init with take of QuantityPersisting(v11, __dst);
  }
  else
  {
    v3.store.super.Class isa = BloodPressurePersistor.init()().store.super.isa;
    __dst[3] = &type metadata for BloodPressurePersistor;
    __dst[4] = &protocol witness table for BloodPressurePersistor;
    __dst[0] = v3.store.super.isa;
    outlined destroy of QuantityPersisting?((uint64_t)v11);
  }
  outlined init with take of QuantityPersisting(__dst, &v7[OBJC_IVAR____TtC19SiriWellnessIntents29LogBloodPressureIntentHandler_storage]);

  v10.receiver = v13;
  v10.super_class = ObjectType;
  id v6 = objc_msgSendSuper2(&v10, sel_init);
  id v4 = v6;
  id v13 = v6;
  outlined destroy of QuantityPersisting?((uint64_t)a1);

  return v6;
}

SiriWellnessIntents::BloodPressurePersistor __swiftcall BloodPressurePersistor.init()()
{
  id v3 = 0;
  type metadata accessor for HKHealthStore();
  id v2 = NSDateFormatter.__allocating_init()();
  id v0 = v2;
  id v3 = v2;
  outlined destroy of HealthKitPersistor(&v3);
  return (SiriWellnessIntents::BloodPressurePersistor)v2;
}

uint64_t LogBloodPressureIntentHandler.handle(intent:)(uint64_t a1)
{
  v2[44] = v1;
  v2[43] = a1;
  v2[24] = v2;
  v2[25] = 0;
  v2[26] = 0;
  uint64_t v3 = type metadata accessor for Logger();
  v2[45] = v3;
  v2[46] = *(void *)(v3 - 8);
  v2[47] = swift_task_alloc();
  v2[48] = swift_task_alloc();
  v2[49] = swift_task_alloc();
  v2[50] = swift_task_alloc();
  v2[25] = a1;
  v2[26] = v1;
  return MEMORY[0x270FA2498](LogBloodPressureIntentHandler.handle(intent:), 0);
}

{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;

  uint64_t v3 = *v1;
  *(void *)(v3 + 192) = *v1;
  *(void *)(v3 + 504) = a1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA2498](LogBloodPressureIntentHandler.handle(intent:), 0);
}

uint64_t LogBloodPressureIntentHandler.handle(intent:)()
{
  uint64_t v1 = *(void *)(v0 + 400);
  uint64_t v19 = *(void *)(v0 + 368);
  uint64_t v21 = *(void *)(v0 + 360);
  *(void *)(v0 + 192) = v0;
  uint64_t v20 = Logger.wellnessIntents.unsafeMutableAddressor();
  swift_beginAccess();
  id v2 = *(void (**)(uint64_t, uint64_t, uint64_t))(v19 + 16);
  *(void *)(v0 + 408) = v2;
  *(void *)(v0 + 416) = (v19 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  v2(v1, v20, v21);
  swift_endAccess();
  uint64_t v24 = Logger.logObject.getter();
  os_log_type_t v23 = static os_log_type_t.debug.getter();
  *(void *)(v0 + 216) = 2;
  *(void *)(v0 + 424) = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  *(void *)(v0 + 432) = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  *(void *)(v0 + 440) = lazy protocol witness table accessor for type Int and conformance Int();
  UnsignedInteger<>.init<A>(_:)();
  uint64_t v22 = *(unsigned int *)(v0 + 512);
  *(void *)(v0 + 448) = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
  uint64_t v25 = _allocateUninitializedArray<A>(_:)();
  if (os_log_type_enabled(v24, v23))
  {
    buf = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    uint64_t v15 = createStorage<A>(capacity:type:)(0);
    uint64_t v16 = createStorage<A>(capacity:type:)(0);
    *(void *)(v18 + 312) = buf;
    *(void *)(v18 + 320) = v15;
    *(void *)(v18 + 328) = v16;
    serialize(_:at:)(0, (unsigned char **)(v18 + 312));
    serialize(_:at:)(0, (unsigned char **)(v18 + 312));
    *(void *)(v18 + 336) = v25;
    objc_super v17 = (void *)swift_task_alloc();
    v17[2] = v18 + 312;
    v17[3] = v18 + 320;
    v17[4] = v18 + 328;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
    lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
    Sequence.forEach(_:)();
    swift_task_dealloc();
    _os_log_impl(&dword_25DE00000, v24, v23, "Checking authorization for Blood Pressure...", buf, v22);
    destroyStorage<A>(_:count:)(v15, 0, v13);
    destroyStorage<A>(_:count:)(v16, 0, MEMORY[0x263F8EE58] + 8);
    MEMORY[0x2611C8D90](buf, MEMORY[0x263F8E778]);
  }
  swift_bridgeObjectRelease();
  *(void *)(v18 + 456) = 0;
  uint64_t v7 = *(void *)(v18 + 400);
  uint64_t v8 = *(void *)(v18 + 360);
  uint64_t v9 = *(void *)(v18 + 352);
  uint64_t v6 = *(void *)(v18 + 368);

  uint64_t v3 = *(void (**)(uint64_t, uint64_t))(v6 + 8);
  *(void *)(v18 + 464) = v3;
  *(void *)(v18 + 472) = (v6 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v3(v7, v8);
  outlined init with copy of QuantityPersisting(v9 + OBJC_IVAR____TtC19SiriWellnessIntents29LogBloodPressureIntentHandler_storage, v18 + 16);
  uint64_t v12 = *(void *)(v18 + 40);
  uint64_t v10 = *(void *)(v18 + 48);
  __swift_project_boxed_opaque_existential_1((void *)(v18 + 16), v12);
  uint64_t v11 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(v10 + 8) + **(int **)(v10 + 8));
  id v4 = (void *)swift_task_alloc();
  *(void *)(v18 + 480) = v4;
  *id v4 = *(void *)(v18 + 192);
  v4[1] = LogBloodPressureIntentHandler.handle(intent:);
  return v11(v12, v10);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  void *v12;
  __n128 v13;
  __n128 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(char *);
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, uint64_t);
  char *v21;
  uint64_t v22;
  uint8_t *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(uint64_t, uint64_t, uint64_t);
  uint32_t v30;
  os_log_type_t v31;
  NSObject *log;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t, uint64_t, uint64_t, __n128, __n128);
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void (*v41)(uint64_t, uint64_t);
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  id v46;
  unint64_t v47;
  id v48;
  uint64_t v49;
  uint8_t *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void (*v54)(uint64_t, uint64_t);
  uint64_t v55;
  uint64_t v56;
  void (*v57)(uint64_t, uint64_t, uint64_t);
  id v58;
  uint32_t size;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  NSObject *oslog;
  os_log_type_t v77;
  uint64_t v78;
  uint64_t v79;
  uint8_t *buf;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  uint64_t v84;
  uint64_t v85;
  void (*v86)(uint64_t, uint64_t, uint64_t);
  uint32_t v87;
  os_log_type_t v88;
  NSObject *v89;
  uint64_t v90;
  uint64_t v91;
  char v92;
  uint8_t *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t (*v96)(uint64_t, uint64_t, uint64_t);
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;

  id v98 = v0;
  uint64_t v92 = *(unsigned char *)(v0 + 528);
  *(void *)(v0 + 192) = v0;
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  if (v92)
  {
    v86 = *(void (**)(uint64_t, uint64_t, uint64_t))(v91 + 408);
    uint64_t v1 = *(void *)(v91 + 392);
    uint64_t v85 = *(void *)(v91 + 360);
    uint64_t v84 = Logger.wellnessIntents.unsafeMutableAddressor();
    swift_beginAccess();
    v86(v1, v84, v85);
    swift_endAccess();
    v89 = Logger.logObject.getter();
    unint64_t v88 = static os_log_type_t.debug.getter();
    *(void *)(v91 + 264) = 2;
    UnsignedInteger<>.init<A>(_:)();
    unint64_t v87 = *(_DWORD *)(v91 + 520);
    uint32_t v90 = _allocateUninitializedArray<A>(_:)();
    if (os_log_type_enabled(v89, v88))
    {
      id v2 = *(void *)(v91 + 456);
      buf = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
      unsigned __int8 v79 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      uint64_t v81 = createStorage<A>(capacity:type:)(0);
      uint64_t v82 = createStorage<A>(capacity:type:)(0);
      *(void *)(v91 + 280) = buf;
      *(void *)(v91 + 288) = v81;
      *(void *)(v91 + 296) = v82;
      serialize(_:at:)(0, (unsigned char **)(v91 + 280));
      serialize(_:at:)(0, (unsigned char **)(v91 + 280));
      *(void *)(v91 + 304) = v90;
      v83 = (void *)swift_task_alloc();
      v83[2] = v91 + 280;
      v83[3] = v91 + 288;
      v83[4] = v91 + 296;
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
      lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
      uint64_t result = Sequence.forEach(_:)();
      if (v2) {
        return result;
      }
      swift_task_dealloc();
      _os_log_impl(&dword_25DE00000, v89, v88, "Authorization check successful for Blood Pressure!", buf, v87);
      destroyStorage<A>(_:count:)(v81, 0, v79);
      destroyStorage<A>(_:count:)(v82, 0, MEMORY[0x263F8EE58] + 8);
      MEMORY[0x2611C8D90](buf, MEMORY[0x263F8E778]);
      swift_bridgeObjectRelease();
      unsigned int v78 = 0;
    }
    else
    {
      swift_bridgeObjectRelease();
      unsigned int v78 = *(void *)(v91 + 456);
    }
    char v54 = *(void (**)(uint64_t, uint64_t))(v91 + 464);
    id v57 = *(void (**)(uint64_t, uint64_t, uint64_t))(v91 + 408);
    char v53 = *(void *)(v91 + 392);
    id v4 = *(void *)(v91 + 384);
    char v56 = *(void *)(v91 + 360);
    uint64_t v58 = *(id *)(v91 + 344);

    v54(v53, v56);
    char v55 = Logger.wellnessIntents.unsafeMutableAddressor();
    swift_beginAccess();
    v57(v4, v55, v56);
    swift_endAccess();
    unsigned int v5 = v58;
    uint64_t v60 = swift_allocObject();
    *(void *)(v60 + 16) = v58;
    uint64_t v6 = v58;
    int v62 = swift_allocObject();
    *(void *)(v62 + 16) = v58;
    uint64_t v7 = v58;
    uint64_t v64 = swift_allocObject();
    *(void *)(v64 + 16) = v58;
    oslog = Logger.logObject.getter();
    uint64_t v77 = static os_log_type_t.debug.getter();
    *(void *)(v91 + 272) = 32;
    UnsignedInteger<>.init<A>(_:)();
    uint32_t size = *(_DWORD *)(v91 + 524);
    char v66 = swift_allocObject();
    *(unsigned char *)(v66 + 16) = 0;
    uint64_t v67 = swift_allocObject();
    *(unsigned char *)(v67 + 16) = 8;
    uint64_t v61 = swift_allocObject();
    *(void *)(v61 + 16) = partial apply for implicit closure #1 in LogBloodPressureIntentHandler.handle(intent:);
    *(void *)(v61 + 24) = v60;
    int v68 = swift_allocObject();
    *(void *)(v68 + 16) = partial apply for implicit closure #1 in OSLogInterpolation.appendInterpolation(_:format:align:privacy:);
    *(void *)(v68 + 24) = v61;
    uint64_t v69 = swift_allocObject();
    *(unsigned char *)(v69 + 16) = 0;
    uint32_t v70 = swift_allocObject();
    *(unsigned char *)(v70 + 16) = 8;
    uint64_t v63 = swift_allocObject();
    *(void *)(v63 + 16) = partial apply for implicit closure #2 in LogBloodPressureIntentHandler.handle(intent:);
    *(void *)(v63 + 24) = v62;
    uint64_t v71 = swift_allocObject();
    *(void *)(v71 + 16) = partial apply for implicit closure #1 in OSLogInterpolation.appendInterpolation(_:format:align:privacy:);
    *(void *)(v71 + 24) = v63;
    uint64_t v72 = swift_allocObject();
    *(unsigned char *)(v72 + 16) = 32;
    uint64_t v73 = swift_allocObject();
    *(unsigned char *)(v73 + 16) = 8;
    uint64_t v65 = swift_allocObject();
    *(void *)(v65 + 16) = partial apply for implicit closure #3 in LogBloodPressureIntentHandler.handle(intent:);
    *(void *)(v65 + 24) = v64;
    uint64_t v74 = swift_allocObject();
    *(void *)(v74 + 16) = partial apply for implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:);
    *(void *)(v74 + 24) = v65;
    _allocateUninitializedArray<A>(_:)();
    unsigned int v75 = v8;
    swift_retain();
    *unsigned int v75 = partial apply for closure #1 in OSLogArguments.append(_:);
    v75[1] = v66;
    swift_retain();
    v75[2] = partial apply for closure #1 in OSLogArguments.append(_:);
    v75[3] = v67;
    swift_retain();
    v75[4] = partial apply for closure #1 in OSLogArguments.append(_:);
    v75[5] = v68;
    swift_retain();
    v75[6] = partial apply for closure #1 in OSLogArguments.append(_:);
    v75[7] = v69;
    swift_retain();
    v75[8] = partial apply for closure #1 in OSLogArguments.append(_:);
    v75[9] = v70;
    swift_retain();
    v75[10] = partial apply for closure #1 in OSLogArguments.append(_:);
    v75[11] = v71;
    swift_retain();
    v75[12] = partial apply for closure #1 in OSLogArguments.append(_:);
    v75[13] = v72;
    swift_retain();
    v75[14] = partial apply for closure #1 in OSLogArguments.append(_:);
    v75[15] = v73;
    swift_retain();
    v75[16] = partial apply for closure #1 in OSLogArguments.append(_:);
    v75[17] = v74;
    _finalizeUninitializedArray<A>(_:)();
    swift_bridgeObjectRelease();
    if (os_log_type_enabled(oslog, v77))
    {
      char v50 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
      char v49 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      char v51 = createStorage<A>(capacity:type:)(0);
      char v52 = createStorage<A>(capacity:type:)(1);
      uint64_t v93 = v50;
      Class v94 = v51;
      v95 = v52;
      serialize(_:at:)(2, &v93);
      serialize(_:at:)(3, &v93);
      HKUnit v96 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
      Swift::String v97 = v66;
      uint64_t result = closure #1 in osLogInternal(_:log:type:)(&v96, (uint64_t)&v93, (uint64_t)&v94, (uint64_t)&v95);
      if (v78) {
        return result;
      }
      HKUnit v96 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
      Swift::String v97 = v67;
      closure #1 in osLogInternal(_:log:type:)(&v96, (uint64_t)&v93, (uint64_t)&v94, (uint64_t)&v95);
      HKUnit v96 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
      Swift::String v97 = v68;
      closure #1 in osLogInternal(_:log:type:)(&v96, (uint64_t)&v93, (uint64_t)&v94, (uint64_t)&v95);
      HKUnit v96 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
      Swift::String v97 = v69;
      closure #1 in osLogInternal(_:log:type:)(&v96, (uint64_t)&v93, (uint64_t)&v94, (uint64_t)&v95);
      HKUnit v96 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
      Swift::String v97 = v70;
      closure #1 in osLogInternal(_:log:type:)(&v96, (uint64_t)&v93, (uint64_t)&v94, (uint64_t)&v95);
      HKUnit v96 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
      Swift::String v97 = v71;
      closure #1 in osLogInternal(_:log:type:)(&v96, (uint64_t)&v93, (uint64_t)&v94, (uint64_t)&v95);
      HKUnit v96 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
      Swift::String v97 = v72;
      closure #1 in osLogInternal(_:log:type:)(&v96, (uint64_t)&v93, (uint64_t)&v94, (uint64_t)&v95);
      HKUnit v96 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
      Swift::String v97 = v73;
      closure #1 in osLogInternal(_:log:type:)(&v96, (uint64_t)&v93, (uint64_t)&v94, (uint64_t)&v95);
      HKUnit v96 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
      Swift::String v97 = v74;
      closure #1 in osLogInternal(_:log:type:)(&v96, (uint64_t)&v93, (uint64_t)&v94, (uint64_t)&v95);
      _os_log_impl(&dword_25DE00000, oslog, v77, "Persisting sample...\n  systolic: %f\n  diastolic: %f\n  unit: %s", v50, size);
      destroyStorage<A>(_:count:)(v51, 0, v49);
      destroyStorage<A>(_:count:)(v52, 1, MEMORY[0x263F8EE58] + 8);
      MEMORY[0x2611C8D90](v50, MEMORY[0x263F8E778]);
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
    }
    else
    {
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
    }
    unint64_t v41 = *(void (**)(uint64_t, uint64_t))(v91 + 464);
    unint64_t v39 = *(void *)(v91 + 384);
    char v40 = *(void *)(v91 + 360);
    uint64_t v42 = *(void *)(v91 + 352);
    char v46 = *(id *)(v91 + 344);

    v41(v39, v40);
    outlined init with copy of QuantityPersisting(v42 + OBJC_IVAR____TtC19SiriWellnessIntents29LogBloodPressureIntentHandler_storage, v91 + 56);
    unint64_t v43 = *(void *)(v91 + 80);
    char v44 = *(void *)(v91 + 88);
    __swift_project_boxed_opaque_existential_1((void *)(v91 + 56), v43);
    objc_msgSend(v46, sel_systolic);
    uint64_t v45 = v9;
    objc_msgSend(v46, sel_diastolic);
    char v47 = v10;
    char v48 = objc_msgSend(v46, sel_unit);
    if (v48)
    {
      char v35 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v36 = v11;

      char v37 = v35;
      uint64_t v38 = v36;
    }
    else
    {
      char v37 = 0;
      uint64_t v38 = 0;
    }
    *(void *)(v91 + 488) = v38;
    unint64_t v34 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, __n128, __n128))(*(void *)(v44 + 16)
                                                                                     + **(int **)(v44 + 16));
    uint64_t v12 = (void *)swift_task_alloc();
    v13.n128_u64[0] = v45;
    v14.n128_u64[0] = v47;
    *(void *)(v91 + 496) = v12;
    *uint64_t v12 = *(void *)(v91 + 192);
    v12[1] = LogBloodPressureIntentHandler.handle(intent:);
    return v34(v37, v38, v43, v44, v13, v14);
  }
  else
  {
    char v29 = *(void (**)(uint64_t, uint64_t, uint64_t))(v91 + 408);
    uint64_t v15 = *(void *)(v91 + 376);
    id v28 = *(void *)(v91 + 360);
    id v27 = Logger.wellnessIntents.unsafeMutableAddressor();
    swift_beginAccess();
    v29(v15, v27, v28);
    swift_endAccess();
    log = Logger.logObject.getter();
    uint64_t v31 = static os_log_type_t.error.getter();
    *(void *)(v91 + 224) = 2;
    UnsignedInteger<>.init<A>(_:)();
    uint64_t v30 = *(_DWORD *)(v91 + 516);
    uint64_t v33 = _allocateUninitializedArray<A>(_:)();
    if (os_log_type_enabled(log, v31))
    {
      uint64_t v16 = *(void *)(v91 + 456);
      os_log_type_t v23 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
      uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      uint64_t v24 = createStorage<A>(capacity:type:)(0);
      uint64_t v25 = createStorage<A>(capacity:type:)(0);
      *(void *)(v91 + 232) = v23;
      *(void *)(v91 + 240) = v24;
      *(void *)(v91 + 248) = v25;
      serialize(_:at:)(0, (unsigned char **)(v91 + 232));
      serialize(_:at:)(0, (unsigned char **)(v91 + 232));
      *(void *)(v91 + 256) = v33;
      uint64_t v26 = (void *)swift_task_alloc();
      v26[2] = v91 + 232;
      v26[3] = v91 + 240;
      v26[4] = v91 + 248;
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
      lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
      uint64_t result = Sequence.forEach(_:)();
      if (v16) {
        return result;
      }
      swift_task_dealloc();
      _os_log_impl(&dword_25DE00000, log, v31, "Not authorized to write Blood Pressure data.", v23, v30);
      destroyStorage<A>(_:count:)(v24, 0, v22);
      destroyStorage<A>(_:count:)(v25, 0, MEMORY[0x263F8EE58] + 8);
      MEMORY[0x2611C8D90](v23, MEMORY[0x263F8E778]);
      swift_bridgeObjectRelease();
    }
    else
    {
      swift_bridgeObjectRelease();
    }
    uint64_t v20 = *(void (**)(uint64_t, uint64_t))(v91 + 464);
    uint64_t v18 = *(void *)(v91 + 376);
    uint64_t v19 = *(void *)(v91 + 360);

    v20(v18, v19);
    type metadata accessor for LogBloodPressureIntentResponse();
    uint64_t v21 = LogBloodPressureIntentResponse.__allocating_init(code:userActivity:)(101, 0);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    objc_super v17 = *(uint64_t (**)(char *))(*(void *)(v91 + 192) + 8);
    return v17(v21);
  }
}

{
  uint64_t v0;
  uint64_t (*v1)(uint64_t);
  uint64_t v3;
  uint64_t v4;

  *(void *)(v0 + 192) = v0;
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);
  uint64_t v3 = *(void *)(v0 + 504);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(uint64_t))(*(void *)(v0 + 192) + 8);
  return v1(v3);
}

uint64_t LogBloodPressureIntentHandler.handle(intent:)(char a1)
{
  uint64_t v3 = *v1;
  *(void *)(v3 + 192) = *v1;
  *(unsigned char *)(v3 + 528) = a1;
  swift_task_dealloc();
  return MEMORY[0x270FA2498](LogBloodPressureIntentHandler.handle(intent:), 0);
}

id implicit closure #1 in LogBloodPressureIntentHandler.handle(intent:)(void *a1)
{
  return objc_msgSend(a1, sel_systolic);
}

id implicit closure #2 in LogBloodPressureIntentHandler.handle(intent:)(void *a1)
{
  return objc_msgSend(a1, sel_diastolic);
}

uint64_t implicit closure #3 in LogBloodPressureIntentHandler.handle(intent:)(void *a1)
{
  id v2 = objc_msgSend(a1, sel_unit);
  if (v2)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for String?);
  lazy protocol witness table accessor for type String? and conformance A?();
  return String.init<A>(describing:)();
}

uint64_t @objc closure #1 in LogBloodPressureIntentHandler.handle(intent:)(void *a1, const void *a2, void *a3)
{
  v3[4] = a3;
  v3[3] = a1;
  v3[2] = v3;
  id v5 = a1;
  v3[5] = _Block_copy(a2);
  id v6 = a3;
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v10 + 48) = v7;
  *uint64_t v7 = *(void *)(v10 + 16);
  v7[1] = @objc closure #1 in LogQuantityIntentHandler.handle(intent:);
  return LogBloodPressureIntentHandler.handle(intent:)((uint64_t)a1);
}

id LogBloodPressureIntentHandler.__allocating_init()()
{
  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

uint64_t LogBloodPressureIntentHandler.init()()
{
  if (!"SiriWellnessIntents.LogBloodPressureIntentHandler")
  {
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  uint64_t result = closure #1 in _unimplementedInitializer(className:initName:file:line:column:)((uint64_t)"SiriWellnessIntents.LogBloodPressureIntentHandler", 49, (unint64_t)"init()", 6, 2, (unint64_t)"SiriWellnessIntents/LogBloodPressureIntentHandler.swift", 55, 2, v1, 0xEuLL, 0x14uLL);
  __break(1u);
  return result;
}

id LogBloodPressureIntentHandler.__deallocating_deinit()
{
  uint64_t v3 = v0;
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t BloodPressurePersistor.isLoggingAuthorized()(void *a1)
{
  v1[4] = a1;
  v1[2] = v1;
  v1[3] = 0;
  v1[3] = a1;
  id v2 = a1;
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v5 + 40) = v3;
  *uint64_t v3 = *(void *)(v5 + 16);
  v3[1] = CycleTrackingFetcher.isReadingAuthorized();
  return isSiriAuthorizedToAccessHealthData(store:)((uint64_t)a1);
}

uint64_t BloodPressurePersistor.save(systolic:diastolic:units:)(uint64_t a1, uint64_t a2, uint64_t a3, double a4, double a5)
{
  *(void *)(v5 + 1240) = a3;
  *(void *)(v5 + 1232) = a2;
  *(void *)(v5 + 1224) = a1;
  *(double *)(v5 + 1216) = a5;
  *(double *)(v5 + 1208) = a4;
  *(void *)(v5 + 512) = v5;
  *(void *)(v5 + 520) = 0;
  *(void *)(v5 + 528) = 0;
  *(void *)(v5 + 480) = 0;
  *(void *)(v5 + 488) = 0;
  *(void *)(v5 + 536) = 0;
  *(void *)(v5 + 592) = 0;
  *(void *)(v5 + 600) = 0;
  *(void *)(v5 + 608) = 0;
  *(void *)(v5 + 680) = 0;
  *(void *)(v5 + 696) = 0;
  *(void *)(v5 + 704) = 0;
  *(void *)(v5 + 720) = 0;
  *(void *)(v5 + 728) = 0;
  *(void *)(v5 + 744) = 0;
  *(void *)(v5 + 752) = 0;
  *(void *)(v5 + 768) = 0;
  *(void *)(v5 + 792) = 0;
  *(void *)(v5 + 496) = 0;
  *(void *)(v5 + 504) = 0;
  uint64_t v6 = type metadata accessor for Date();
  *(void *)(v5 + 1248) = v6;
  *(void *)(v5 + 1256) = *(void *)(v6 - 8);
  *(void *)(v5 + 1264) = swift_task_alloc();
  *(void *)(v5 + 1272) = swift_task_alloc();
  *(void *)(v5 + 1280) = swift_task_alloc();
  *(void *)(v5 + 1288) = swift_task_alloc();
  uint64_t v7 = type metadata accessor for Logger();
  *(void *)(v5 + 1296) = v7;
  *(void *)(v5 + 1304) = *(void *)(v7 - 8);
  *(void *)(v5 + 1312) = swift_task_alloc();
  *(void *)(v5 + 1320) = swift_task_alloc();
  *(void *)(v5 + 1328) = swift_task_alloc();
  *(void *)(v5 + 1336) = swift_task_alloc();
  *(void *)(v5 + 1344) = swift_task_alloc();
  *(void *)(v5 + 1352) = swift_task_alloc();
  *(void *)(v5 + 1360) = swift_task_alloc();
  *(void *)(v5 + 1368) = swift_task_alloc();
  *(void *)(v5 + 1376) = swift_task_alloc();
  *(void *)(v5 + 1384) = swift_task_alloc();
  *(void *)(v5 + 1392) = swift_task_alloc();
  *(void *)(v5 + 1400) = swift_task_alloc();
  *(void *)(v5 + 1408) = swift_task_alloc();
  *(void *)(v5 + 1416) = swift_task_alloc();
  *(void *)(v5 + 1424) = swift_task_alloc();
  *(double *)(v5 + 520) = a4;
  *(double *)(v5 + 528) = a5;
  *(void *)(v5 + 480) = a1;
  *(void *)(v5 + 488) = a2;
  *(void *)(v5 + 536) = a3;
  return MEMORY[0x270FA2498](BloodPressurePersistor.save(systolic:diastolic:units:), 0);
}

uint64_t BloodPressurePersistor.save(systolic:diastolic:units:)(uint64_t a1)
{
  uint64_t v339 = v1;
  MEMORY[0x270FA5388](a1);
  v325 = (void *)v1;
  uint64_t v2 = *(void *)(v1 + 1424);
  uint64_t v326 = *(void *)(v1 + 1304);
  uint64_t v328 = *(void *)(v1 + 1296);
  *(void *)(v1 + 512) = v1;
  uint64_t v327 = Logger.wellnessIntents.unsafeMutableAddressor();
  swift_beginAccess();
  uint64_t v3 = *(void (**)(uint64_t, uint64_t, uint64_t))(v326 + 16);
  v329 = v3;
  *(void *)(v1 + 1432) = v3;
  *(void *)(v1 + 1440) = (v326 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  v3(v2, v327, v328);
  swift_endAccess();
  v332 = Logger.logObject.getter();
  os_log_type_t v331 = static os_log_type_t.debug.getter();
  *(void *)(v1 + 544) = 2;
  *(void *)(v1 + 1448) = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  *(void *)(v1 + 1456) = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  *(void *)(v1 + 1464) = lazy protocol witness table accessor for type Int and conformance Int();
  UnsignedInteger<>.init<A>(_:)();
  uint64_t v330 = *(unsigned int *)(v1 + 1632);
  *(void *)(v1 + 1472) = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
  uint64_t v333 = _allocateUninitializedArray<A>(_:)();
  if (os_log_type_enabled(v332, v331))
  {
    buf = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
    uint64_t v320 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    uint64_t v322 = createStorage<A>(capacity:type:)(0);
    uint64_t v323 = createStorage<A>(capacity:type:)(0);
    *(void *)(v1 + 1176) = buf;
    *(void *)(v1 + 1184) = v322;
    *(void *)(v1 + 1192) = v323;
    serialize(_:at:)(0, (unsigned char **)(v1 + 1176));
    serialize(_:at:)(0, (unsigned char **)(v1 + 1176));
    *(void *)(v1 + 1200) = v333;
    v324 = (void *)swift_task_alloc();
    v324[2] = v1 + 1176;
    v324[3] = v1 + 1184;
    v324[4] = v1 + 1192;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
    lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
    Sequence.forEach(_:)();
    swift_task_dealloc();
    _os_log_impl(&dword_25DE00000, v332, v331, "Starting to save blood pressure.", buf, v330);
    destroyStorage<A>(_:count:)(v322, 0, v320);
    destroyStorage<A>(_:count:)(v323, 0, MEMORY[0x263F8EE58] + 8);
    MEMORY[0x2611C8D90](buf, MEMORY[0x263F8E778]);
  }
  swift_bridgeObjectRelease();
  uint64_t v314 = *(void *)(v1 + 1424);
  uint64_t v315 = *(void *)(v1 + 1296);
  uint64_t v313 = *(void *)(v1 + 1304);

  v316 = *(void (**)(uint64_t, uint64_t))(v313 + 8);
  *(void *)(v1 + 1480) = v316;
  *(void *)(v1 + 1488) = (v313 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v316(v314, v315);
  type metadata accessor for HKQuantityType();
  id ObjCClassFromMetadata = (id)swift_getObjCClassFromMetadata();
  id v318 = (id)*MEMORY[0x263F09C28];
  id v4 = (id)*MEMORY[0x263F09C28];
  id v5 = objc_msgSend(ObjCClassFromMetadata, sel_quantityTypeForIdentifier_, v318);
  *(void *)(v1 + 1496) = v5;
  id v319 = v5;

  if (!v319) {
    goto LABEL_54;
  }
  *(void *)(v1 + 592) = v319;
  id v310 = (id)swift_getObjCClassFromMetadata();
  id v311 = (id)*MEMORY[0x263F09C20];
  id v6 = (id)*MEMORY[0x263F09C20];
  id v7 = objc_msgSend(v310, sel_quantityTypeForIdentifier_, v311);
  *(void *)(v1 + 1504) = v7;
  id v312 = v7;

  if (!v312)
  {

LABEL_54:
    uint64_t v45 = *(void *)(v1 + 1320);
    uint64_t v55 = *(void *)(v1 + 1296);
    uint64_t v54 = Logger.wellnessIntents.unsafeMutableAddressor();
    swift_beginAccess();
    v329(v45, v54, v55);
    swift_endAccess();
    uint64_t v58 = Logger.logObject.getter();
    os_log_type_t v57 = static os_log_type_t.error.getter();
    *(void *)(v1 + 552) = 2;
    UnsignedInteger<>.init<A>(_:)();
    uint32_t v56 = *(_DWORD *)(v1 + 1636);
    uint64_t v59 = _allocateUninitializedArray<A>(_:)();
    if (os_log_type_enabled(v58, v57))
    {
      char v50 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
      uint64_t v49 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      uint64_t v51 = createStorage<A>(capacity:type:)(0);
      uint64_t v52 = createStorage<A>(capacity:type:)(0);
      *(void *)(v1 + 560) = v50;
      *(void *)(v1 + 568) = v51;
      *(void *)(v1 + 576) = v52;
      serialize(_:at:)(0, (unsigned char **)(v1 + 560));
      serialize(_:at:)(0, (unsigned char **)(v1 + 560));
      *(void *)(v1 + 584) = v59;
      char v53 = (void *)swift_task_alloc();
      v53[2] = v1 + 560;
      v53[3] = v1 + 568;
      v53[4] = v1 + 576;
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
      lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
      Sequence.forEach(_:)();
      swift_task_dealloc();
      _os_log_impl(&dword_25DE00000, v58, v57, "Could not create any Blood Pressure types.", v50, v56);
      destroyStorage<A>(_:count:)(v51, 0, v49);
      destroyStorage<A>(_:count:)(v52, 0, MEMORY[0x263F8EE58] + 8);
      MEMORY[0x2611C8D90](v50, MEMORY[0x263F8E778]);
    }
    swift_bridgeObjectRelease();
    uint64_t v47 = *(void *)(v1 + 1320);
    uint64_t v48 = *(void *)(v1 + 1296);

    v316(v47, v48);
    type metadata accessor for LogBloodPressureIntentResponse();
    unint64_t v231 = LogBloodPressureIntentResponse.__allocating_init(code:userActivity:)(5, 0);
    goto LABEL_57;
  }
  *(void *)(v1 + 600) = v312;
  type metadata accessor for HKCorrelationType();
  id v307 = (id)swift_getObjCClassFromMetadata();
  id v308 = (id)*MEMORY[0x263F094C0];
  id v8 = (id)*MEMORY[0x263F094C0];
  id v9 = objc_msgSend(v307, sel_correlationTypeForIdentifier_, v308);
  *(void *)(v1 + 1512) = v9;
  id v309 = v9;

  if (!v309)
  {

    goto LABEL_54;
  }
  uint64_t v306 = *(void *)(v1 + 1232);
  *(void *)(v1 + 608) = v309;
  swift_bridgeObjectRetain();
  if (v306)
  {
    uint64_t v10 = *(void *)(v1 + 1232);
    uint64_t v11 = *(void *)(v1 + 1416);
    uint64_t v301 = *(void *)(v1 + 1296);
    *(void *)(v1 + 496) = *(void *)(v1 + 1224);
    *(void *)(v1 + 504) = v10;
    uint64_t v300 = Logger.wellnessIntents.unsafeMutableAddressor();
    swift_beginAccess();
    v329(v11, v300, v301);
    swift_endAccess();
    oslog = Logger.logObject.getter();
    os_log_type_t v303 = static os_log_type_t.debug.getter();
    *(void *)(v1 + 1136) = 2;
    UnsignedInteger<>.init<A>(_:)();
    uint32_t size = *(_DWORD *)(v1 + 1688);
    uint64_t v305 = _allocateUninitializedArray<A>(_:)();
    if (os_log_type_enabled(oslog, v303))
    {
      uint64_t v296 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
      uint64_t v295 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      uint64_t v297 = createStorage<A>(capacity:type:)(0);
      uint64_t v298 = createStorage<A>(capacity:type:)(0);
      *(void *)(v1 + 1144) = v296;
      *(void *)(v1 + 1152) = v297;
      *(void *)(v1 + 1160) = v298;
      serialize(_:at:)(0, (unsigned char **)(v1 + 1144));
      serialize(_:at:)(0, (unsigned char **)(v1 + 1144));
      *(void *)(v1 + 1168) = v305;
      uint64_t v299 = (void *)swift_task_alloc();
      v299[2] = v1 + 1144;
      v299[3] = v1 + 1152;
      v299[4] = v1 + 1160;
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
      lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
      Sequence.forEach(_:)();
      swift_task_dealloc();
      _os_log_impl(&dword_25DE00000, oslog, v303, "Trying to convert unit to HKUnit.", v296, size);
      destroyStorage<A>(_:count:)(v297, 0, v295);
      destroyStorage<A>(_:count:)(v298, 0, MEMORY[0x263F8EE58] + 8);
      MEMORY[0x2611C8D90](v296, MEMORY[0x263F8E778]);
    }
    swift_bridgeObjectRelease();
    uint64_t v286 = *(void *)(v1 + 1416);
    uint64_t v287 = *(void *)(v1 + 1296);

    v316(v286, v287);
    type metadata accessor for HKUnit();
    swift_bridgeObjectRetain();
    *(void *)(v1 + 616) = @nonobjc HKUnit.__allocating_init(from:)();
    swift_bridgeObjectRelease();
    uint32_t v290 = *(void (**)(uint64_t, uint64_t, uint64_t))(v1 + 1432);
    uint64_t v12 = *(void *)(v1 + 1400);
    uint64_t v289 = *(void *)(v1 + 1296);
    uint64_t v288 = Logger.wellnessIntents.unsafeMutableAddressor();
    swift_beginAccess();
    v290(v12, v288, v289);
    swift_endAccess();
    id v293 = Logger.logObject.getter();
    os_log_type_t v292 = static os_log_type_t.debug.getter();
    *(void *)(v1 + 632) = 2;
    UnsignedInteger<>.init<A>(_:)();
    uint32_t v291 = *(_DWORD *)(v1 + 1644);
    uint64_t v294 = _allocateUninitializedArray<A>(_:)();
    if (os_log_type_enabled(v293, v292))
    {
      v269 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
      uint64_t v268 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      uint64_t v270 = createStorage<A>(capacity:type:)(0);
      uint64_t v271 = createStorage<A>(capacity:type:)(0);
      *(void *)(v1 + 1072) = v269;
      *(void *)(v1 + 1080) = v270;
      *(void *)(v1 + 1088) = v271;
      serialize(_:at:)(0, (unsigned char **)(v1 + 1072));
      serialize(_:at:)(0, (unsigned char **)(v1 + 1072));
      *(void *)(v1 + 1096) = v294;
      id v272 = (void *)swift_task_alloc();
      v272[2] = v1 + 1072;
      v272[3] = v1 + 1080;
      v272[4] = v1 + 1088;
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
      lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
      Sequence.forEach(_:)();
      swift_task_dealloc();
      _os_log_impl(&dword_25DE00000, v293, v292, "Starting to convert optional HKUnit to non-optional HKUnit.", v269, v291);
      destroyStorage<A>(_:count:)(v270, 0, v268);
      destroyStorage<A>(_:count:)(v271, 0, MEMORY[0x263F8EE58] + 8);
      MEMORY[0x2611C8D90](v269, MEMORY[0x263F8E778]);
    }
    swift_bridgeObjectRelease();
    uint32_t v266 = *(void (**)(uint64_t, uint64_t))(v1 + 1480);
    uint64_t v264 = *(void *)(v1 + 1400);
    uint64_t v265 = *(void *)(v1 + 1296);

    v266(v264, v265);
    v267 = *(void **)(v1 + 616);
    *(void *)(v1 + 1544) = v267;
    id v17 = v267;
    if (!v267)
    {
      uint64_t v74 = *(void (**)(uint64_t, uint64_t, uint64_t))(v1 + 1432);
      uint64_t v44 = *(void *)(v1 + 1328);
      uint64_t v73 = *(void *)(v1 + 1296);
      uint64_t v72 = Logger.wellnessIntents.unsafeMutableAddressor();
      swift_beginAccess();
      v74(v44, v72, v73);
      swift_endAccess();
      uint64_t v77 = Logger.logObject.getter();
      os_log_type_t v76 = static os_log_type_t.error.getter();
      *(void *)(v1 + 640) = 2;
      UnsignedInteger<>.init<A>(_:)();
      uint32_t v75 = *(_DWORD *)(v1 + 1648);
      uint64_t v78 = _allocateUninitializedArray<A>(_:)();
      if (os_log_type_enabled(v77, v76))
      {
        int v68 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
        uint64_t v67 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
        uint64_t v69 = createStorage<A>(capacity:type:)(0);
        uint64_t v70 = createStorage<A>(capacity:type:)(0);
        *(void *)(v1 + 648) = v68;
        *(void *)(v1 + 656) = v69;
        *(void *)(v1 + 664) = v70;
        serialize(_:at:)(0, (unsigned char **)(v1 + 648));
        serialize(_:at:)(0, (unsigned char **)(v1 + 648));
        *(void *)(v1 + 672) = v78;
        uint64_t v71 = (void *)swift_task_alloc();
        v71[2] = v1 + 648;
        v71[3] = v1 + 656;
        v71[4] = v1 + 664;
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
        lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
        Sequence.forEach(_:)();
        swift_task_dealloc();
        _os_log_impl(&dword_25DE00000, v77, v76, "Could not create an HKUnit.", v68, v75);
        destroyStorage<A>(_:count:)(v69, 0, v67);
        destroyStorage<A>(_:count:)(v70, 0, MEMORY[0x263F8EE58] + 8);
        MEMORY[0x2611C8D90](v68, MEMORY[0x263F8E778]);
      }
      swift_bridgeObjectRelease();
      int v62 = *(void (**)(uint64_t, uint64_t))(v1 + 1480);
      uint64_t v60 = *(void *)(v1 + 1328);
      uint64_t v61 = *(void *)(v1 + 1296);
      id v63 = *(id *)(v1 + 1512);
      id v64 = *(id *)(v1 + 1504);
      id v65 = *(id *)(v1 + 1496);

      v62(v60, v61);
      type metadata accessor for LogBloodPressureIntentResponse();
      char v66 = LogBloodPressureIntentResponse.__allocating_init(code:userActivity:)(5, 0);
      outlined destroy of HealthKitPersistor((id *)(v1 + 616));

      unint64_t v231 = v66;
      goto LABEL_57;
    }
    uint64_t v18 = *(void **)(v1 + 1496);
    id v262 = *(id *)(v1 + 1504);
    *(void *)(v1 + 680) = v267;
    unsigned __int8 v263 = objc_msgSend(v18, sel_isCompatibleWithUnit_);
    id v19 = v262;
    id v20 = v267;
    if (v263) {
      unsigned int v261 = objc_msgSend(*(id *)(v1 + 1504), sel_isCompatibleWithUnit_, v267) ^ 1;
    }
    else {
      LOBYTE(v261) = 1;
    }

    if (v261)
    {
      uint64_t v239 = *(void (**)(uint64_t, uint64_t, uint64_t))(v1 + 1432);
      uint64_t v21 = *(void *)(v1 + 1392);
      uint64_t v238 = *(void *)(v1 + 1296);
      uint64_t v241 = *(void **)(v1 + 1504);
      uint64_t v240 = *(void **)(v1 + 1496);
      uint64_t v237 = Logger.wellnessIntents.unsafeMutableAddressor();
      swift_beginAccess();
      v239(v21, v237, v238);
      swift_endAccess();
      id v22 = v267;
      uint64_t v243 = swift_allocObject();
      *(void *)(v243 + 16) = v267;
      id v23 = v240;
      uint64_t v245 = swift_allocObject();
      *(void *)(v245 + 16) = v240;
      id v24 = v241;
      uint64_t v247 = swift_allocObject();
      *(void *)(v247 + 16) = v241;
      uint64_t v259 = Logger.logObject.getter();
      os_log_type_t v260 = static os_log_type_t.error.getter();
      *(void *)(v1 + 1064) = 32;
      UnsignedInteger<>.init<A>(_:)();
      uint32_t v242 = *(_DWORD *)(v1 + 1684);
      uint64_t v249 = swift_allocObject();
      *(unsigned char *)(v249 + 16) = 64;
      uint64_t v250 = swift_allocObject();
      *(unsigned char *)(v250 + 16) = 8;
      uint64_t v244 = swift_allocObject();
      *(void *)(v244 + 16) = partial apply for implicit closure #3 in LogQuantityIntentHandler.handle(intent:);
      *(void *)(v244 + 24) = v243;
      uint64_t v251 = swift_allocObject();
      *(void *)(v251 + 16) = partial apply for implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:);
      *(void *)(v251 + 24) = v244;
      uint64_t v252 = swift_allocObject();
      *(unsigned char *)(v252 + 16) = 64;
      uint64_t v253 = swift_allocObject();
      *(unsigned char *)(v253 + 16) = 8;
      uint64_t v246 = swift_allocObject();
      *(void *)(v246 + 16) = partial apply for implicit closure #3 in LogQuantityIntentHandler.handle(intent:);
      *(void *)(v246 + 24) = v245;
      uint64_t v254 = swift_allocObject();
      *(void *)(v254 + 16) = partial apply for implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:);
      *(void *)(v254 + 24) = v246;
      uint64_t v255 = swift_allocObject();
      *(unsigned char *)(v255 + 16) = 64;
      uint64_t v256 = swift_allocObject();
      *(unsigned char *)(v256 + 16) = 8;
      uint64_t v248 = swift_allocObject();
      *(void *)(v248 + 16) = partial apply for implicit closure #3 in LogQuantityIntentHandler.handle(intent:);
      *(void *)(v248 + 24) = v247;
      uint64_t v257 = swift_allocObject();
      *(void *)(v257 + 16) = partial apply for implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:);
      *(void *)(v257 + 24) = v248;
      _allocateUninitializedArray<A>(_:)();
      uint32_t v258 = v25;
      swift_retain();
      *uint32_t v258 = partial apply for closure #1 in OSLogArguments.append(_:);
      v258[1] = v249;
      swift_retain();
      v258[2] = partial apply for closure #1 in OSLogArguments.append(_:);
      v258[3] = v250;
      swift_retain();
      v258[4] = partial apply for closure #1 in OSLogArguments.append(_:);
      v258[5] = v251;
      swift_retain();
      v258[6] = partial apply for closure #1 in OSLogArguments.append(_:);
      v258[7] = v252;
      swift_retain();
      v258[8] = partial apply for closure #1 in OSLogArguments.append(_:);
      v258[9] = v253;
      swift_retain();
      v258[10] = partial apply for closure #1 in OSLogArguments.append(_:);
      v258[11] = v254;
      swift_retain();
      v258[12] = partial apply for closure #1 in OSLogArguments.append(_:);
      v258[13] = v255;
      swift_retain();
      v258[14] = partial apply for closure #1 in OSLogArguments.append(_:);
      v258[15] = v256;
      swift_retain();
      v258[16] = partial apply for closure #1 in OSLogArguments.append(_:);
      v258[17] = v257;
      _finalizeUninitializedArray<A>(_:)();
      swift_bridgeObjectRelease();
      if (os_log_type_enabled(v259, v260))
      {
        uint64_t v234 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
        uint64_t v233 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
        uint64_t v235 = createStorage<A>(capacity:type:)(3);
        uint64_t v236 = createStorage<A>(capacity:type:)(0);
        v334 = v234;
        uint64_t v335 = v235;
        uint64_t v336 = v236;
        serialize(_:at:)(2, &v334);
        serialize(_:at:)(3, &v334);
        v337 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
        uint64_t v338 = v249;
        closure #1 in osLogInternal(_:log:type:)(&v337, (uint64_t)&v334, (uint64_t)&v335, (uint64_t)&v336);
        v337 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
        uint64_t v338 = v250;
        closure #1 in osLogInternal(_:log:type:)(&v337, (uint64_t)&v334, (uint64_t)&v335, (uint64_t)&v336);
        v337 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
        uint64_t v338 = v251;
        closure #1 in osLogInternal(_:log:type:)(&v337, (uint64_t)&v334, (uint64_t)&v335, (uint64_t)&v336);
        v337 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
        uint64_t v338 = v252;
        closure #1 in osLogInternal(_:log:type:)(&v337, (uint64_t)&v334, (uint64_t)&v335, (uint64_t)&v336);
        v337 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
        uint64_t v338 = v253;
        closure #1 in osLogInternal(_:log:type:)(&v337, (uint64_t)&v334, (uint64_t)&v335, (uint64_t)&v336);
        v337 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
        uint64_t v338 = v254;
        closure #1 in osLogInternal(_:log:type:)(&v337, (uint64_t)&v334, (uint64_t)&v335, (uint64_t)&v336);
        v337 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
        uint64_t v338 = v255;
        closure #1 in osLogInternal(_:log:type:)(&v337, (uint64_t)&v334, (uint64_t)&v335, (uint64_t)&v336);
        v337 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
        uint64_t v338 = v256;
        closure #1 in osLogInternal(_:log:type:)(&v337, (uint64_t)&v334, (uint64_t)&v335, (uint64_t)&v336);
        v337 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
        uint64_t v338 = v257;
        closure #1 in osLogInternal(_:log:type:)(&v337, (uint64_t)&v334, (uint64_t)&v335, (uint64_t)&v336);
        _os_log_impl(&dword_25DE00000, v259, v260, "%@ is incompatible with %@ or %@.", v234, v242);
        destroyStorage<A>(_:count:)(v235, 3, v233);
        destroyStorage<A>(_:count:)(v236, 0, MEMORY[0x263F8EE58] + 8);
        MEMORY[0x2611C8D90](v234, MEMORY[0x263F8E778]);
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
      }
      else
      {
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
      }
      uint64_t v226 = *(void (**)(uint64_t, uint64_t))(v1 + 1480);
      uint64_t v224 = *(void *)(v1 + 1392);
      uint64_t v225 = *(void *)(v1 + 1296);
      id v227 = *(id *)(v1 + 1512);
      id v228 = *(id *)(v1 + 1504);
      id v229 = *(id *)(v1 + 1496);

      v226(v224, v225);
      type metadata accessor for LogBloodPressureIntentResponse();
      uint64_t v230 = LogBloodPressureIntentResponse.__allocating_init(code:userActivity:)(102, 0);

      outlined destroy of HealthKitPersistor((id *)(v1 + 616));
      unint64_t v231 = v230;
LABEL_57:
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      char v46 = *(uint64_t (**)(char *))(*(void *)(v1 + 512) + 8);
      return v46(v231);
    }
    unsigned __int8 v219 = *(void (**)(uint64_t, uint64_t, uint64_t))(v1 + 1432);
    uint64_t v26 = *(void *)(v1 + 1384);
    uint64_t v218 = *(void *)(v1 + 1296);
    uint64_t v214 = *(void *)(v1 + 1288);
    uint64_t v213 = *(void *)(v1 + 1280);
    uint64_t v215 = *(void *)(v1 + 1248);
    uint64_t v212 = *(void *)(v1 + 1256);
    Date.init()();
    unint64_t v216 = *(void (**)(uint64_t, uint64_t, uint64_t))(v212 + 16);
    *(void *)(v1 + 1552) = v216;
    *(void *)(v1 + 1560) = (v212 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
    v216(v213, v214, v215);
    uint64_t v217 = Logger.wellnessIntents.unsafeMutableAddressor();
    swift_beginAccess();
    v219(v26, v217, v218);
    swift_endAccess();
    uint64_t v222 = Logger.logObject.getter();
    os_log_type_t v221 = static os_log_type_t.debug.getter();
    *(void *)(v1 + 688) = 2;
    UnsignedInteger<>.init<A>(_:)();
    uint32_t v220 = *(_DWORD *)(v1 + 1652);
    uint64_t v223 = _allocateUninitializedArray<A>(_:)();
    if (os_log_type_enabled(v222, v221))
    {
      id v208 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
      uint64_t v207 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      uint64_t v209 = createStorage<A>(capacity:type:)(0);
      uint64_t v210 = createStorage<A>(capacity:type:)(0);
      *(void *)(v1 + 1032) = v208;
      *(void *)(v1 + 1040) = v209;
      *(void *)(v1 + 1048) = v210;
      serialize(_:at:)(0, (unsigned char **)(v1 + 1032));
      serialize(_:at:)(0, (unsigned char **)(v1 + 1032));
      *(void *)(v1 + 1056) = v223;
      uint64_t v211 = (void *)swift_task_alloc();
      v211[2] = v1 + 1032;
      v211[3] = v1 + 1040;
      v211[4] = v1 + 1048;
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
      lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
      Sequence.forEach(_:)();
      swift_task_dealloc();
      _os_log_impl(&dword_25DE00000, v222, v221, "Creating HKQuantity for Systolic.", v208, v220);
      destroyStorage<A>(_:count:)(v209, 0, v207);
      destroyStorage<A>(_:count:)(v210, 0, MEMORY[0x263F8EE58] + 8);
      MEMORY[0x2611C8D90](v208, MEMORY[0x263F8E778]);
    }
    swift_bridgeObjectRelease();
    uint64_t v195 = *(void (**)(uint64_t, uint64_t))(v1 + 1480);
    uint64_t v193 = *(void *)(v1 + 1384);
    uint64_t v194 = *(void *)(v1 + 1296);
    uint64_t v197 = *(void *)(v1 + 1288);
    uint64_t v198 = *(void *)(v1 + 1280);
    uint64_t v200 = *(void *)(v1 + 1272);
    uint64_t v201 = *(void *)(v1 + 1264);
    uint64_t v199 = *(void *)(v1 + 1248);
    double v196 = *(double *)(v1 + 1208);
    v202 = *(void **)(v1 + 1496);

    v195(v193, v194);
    type metadata accessor for HKQuantity();
    id v27 = v267;
    id v204 = @nonobjc HKQuantity.__allocating_init(unit:doubleValue:)(v267, v196);
    *(void *)(v1 + 1568) = v204;
    *(void *)(v1 + 696) = v204;
    type metadata accessor for HKQuantitySample();
    id v28 = v202;
    id v29 = v204;
    v216(v200, v197, v199);
    v216(v201, v198, v199);
    id v203 = @nonobjc HKQuantitySample.__allocating_init(type:quantity:start:end:)(v202, v204, v200, v201);
    *(void *)(v1 + 1576) = v203;
    *(void *)(v1 + 704) = v203;
    identifier = (NSString *)*MEMORY[0x263F09C28];
    id v30 = (id)*MEMORY[0x263F09C28];
    Swift::Bool v206 = validateQuantity(identifier:quantity:)(identifier, (HKQuantity)v204);

    if (!v206)
    {
      uint64_t v188 = *(void (**)(uint64_t, uint64_t, uint64_t))(v1 + 1432);
      uint64_t v31 = *(void *)(v1 + 1376);
      uint64_t v187 = *(void *)(v1 + 1296);
      uint64_t v186 = Logger.wellnessIntents.unsafeMutableAddressor();
      swift_beginAccess();
      v188(v31, v186, v187);
      swift_endAccess();
      uint64_t v191 = Logger.logObject.getter();
      os_log_type_t v190 = static os_log_type_t.error.getter();
      *(void *)(v1 + 992) = 2;
      UnsignedInteger<>.init<A>(_:)();
      uint32_t v189 = *(_DWORD *)(v1 + 1680);
      uint64_t v192 = _allocateUninitializedArray<A>(_:)();
      if (os_log_type_enabled(v191, v190))
      {
        unint64_t v182 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
        uint64_t v181 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
        uint64_t v183 = createStorage<A>(capacity:type:)(0);
        uint64_t v184 = createStorage<A>(capacity:type:)(0);
        *(void *)(v1 + 1000) = v182;
        *(void *)(v1 + 1008) = v183;
        *(void *)(v1 + 1016) = v184;
        serialize(_:at:)(0, (unsigned char **)(v1 + 1000));
        serialize(_:at:)(0, (unsigned char **)(v1 + 1000));
        *(void *)(v1 + 1024) = v192;
        uint64_t v185 = (void *)swift_task_alloc();
        v185[2] = v1 + 1000;
        v185[3] = v1 + 1008;
        v185[4] = v1 + 1016;
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
        lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
        Sequence.forEach(_:)();
        swift_task_dealloc();
        _os_log_impl(&dword_25DE00000, v191, v190, "Quantity validation failed - systolic blood pressure value outside valid bounds.", v182, v189);
        destroyStorage<A>(_:count:)(v183, 0, v181);
        destroyStorage<A>(_:count:)(v184, 0, MEMORY[0x263F8EE58] + 8);
        MEMORY[0x2611C8D90](v182, MEMORY[0x263F8E778]);
      }
      swift_bridgeObjectRelease();
      uint64_t v171 = *(void (**)(uint64_t, uint64_t))(v1 + 1480);
      uint64_t v169 = *(void *)(v1 + 1376);
      uint64_t v170 = *(void *)(v1 + 1296);
      uint64_t v174 = *(void *)(v1 + 1288);
      uint64_t v173 = *(void *)(v1 + 1280);
      uint64_t v175 = *(void *)(v1 + 1248);
      id v177 = *(id *)(v1 + 1512);
      id v178 = *(id *)(v1 + 1504);
      id v179 = *(id *)(v1 + 1496);
      uint64_t v172 = *(void *)(v1 + 1256);

      v171(v169, v170);
      type metadata accessor for LogBloodPressureIntentResponse();
      id v180 = LogBloodPressureIntentResponse.__allocating_init(code:userActivity:)(102, 0);

      v176 = *(void (**)(uint64_t, uint64_t))(v172 + 8);
      v176(v173, v175);
      v176(v174, v175);

      outlined destroy of HealthKitPersistor((id *)(v1 + 616));
      unint64_t v231 = v180;
      goto LABEL_57;
    }
    unint64_t v164 = *(void (**)(uint64_t, uint64_t, uint64_t))(v1 + 1432);
    uint64_t v32 = *(void *)(v1 + 1368);
    uint64_t v163 = *(void *)(v1 + 1296);
    uint64_t v162 = Logger.wellnessIntents.unsafeMutableAddressor();
    swift_beginAccess();
    v164(v32, v162, v163);
    swift_endAccess();
    uint64_t v167 = Logger.logObject.getter();
    os_log_type_t v166 = static os_log_type_t.debug.getter();
    *(void *)(v1 + 712) = 2;
    UnsignedInteger<>.init<A>(_:)();
    uint32_t v165 = *(_DWORD *)(v1 + 1656);
    uint64_t v168 = _allocateUninitializedArray<A>(_:)();
    if (os_log_type_enabled(v167, v166))
    {
      uint64_t v158 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
      uint64_t v157 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      uint64_t v159 = createStorage<A>(capacity:type:)(0);
      uint64_t v160 = createStorage<A>(capacity:type:)(0);
      *(void *)(v1 + 960) = v158;
      *(void *)(v1 + 968) = v159;
      *(void *)(v1 + 976) = v160;
      serialize(_:at:)(0, (unsigned char **)(v1 + 960));
      serialize(_:at:)(0, (unsigned char **)(v1 + 960));
      *(void *)(v1 + 984) = v168;
      int v161 = (void *)swift_task_alloc();
      v161[2] = v1 + 960;
      v161[3] = v1 + 968;
      v161[4] = v1 + 976;
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
      lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
      Sequence.forEach(_:)();
      swift_task_dealloc();
      _os_log_impl(&dword_25DE00000, v167, v166, "Creating HKQuantity for Diastolic.", v158, v165);
      destroyStorage<A>(_:count:)(v159, 0, v157);
      destroyStorage<A>(_:count:)(v160, 0, MEMORY[0x263F8EE58] + 8);
      MEMORY[0x2611C8D90](v158, MEMORY[0x263F8E778]);
    }
    swift_bridgeObjectRelease();
    unsigned int v145 = *(void (**)(uint64_t, uint64_t))(v1 + 1480);
    uint64_t v143 = *(void *)(v1 + 1368);
    uint64_t v144 = *(void *)(v1 + 1296);
    uint64_t v147 = *(void *)(v1 + 1288);
    uint64_t v148 = *(void *)(v1 + 1280);
    uint64_t v150 = *(void *)(v1 + 1272);
    uint64_t v151 = *(void *)(v1 + 1264);
    uint64_t v149 = *(void *)(v1 + 1248);
    double v146 = *(double *)(v1 + 1216);
    uint64_t v152 = *(void **)(v1 + 1504);

    v145(v143, v144);
    id v33 = v267;
    id v154 = @nonobjc HKQuantity.__allocating_init(unit:doubleValue:)(v267, v146);
    *(void *)(v1 + 1584) = v154;
    *(void *)(v1 + 720) = v154;
    id v34 = v152;
    id v35 = v154;
    v216(v150, v147, v149);
    v216(v151, v148, v149);
    id v153 = @nonobjc HKQuantitySample.__allocating_init(type:quantity:start:end:)(v152, v154, v150, v151);
    *(void *)(v1 + 1592) = v153;
    *(void *)(v1 + 728) = v153;
    v155 = (NSString *)*MEMORY[0x263F09C20];
    id v36 = (id)*MEMORY[0x263F09C20];
    Swift::Bool v156 = validateQuantity(identifier:quantity:)(v155, (HKQuantity)v154);

    if (!v156)
    {
      uint32_t v138 = *(void (**)(uint64_t, uint64_t, uint64_t))(v1 + 1432);
      uint64_t v37 = *(void *)(v1 + 1360);
      uint64_t v137 = *(void *)(v1 + 1296);
      uint64_t v136 = Logger.wellnessIntents.unsafeMutableAddressor();
      swift_beginAccess();
      v138(v37, v136, v137);
      swift_endAccess();
      Class v141 = Logger.logObject.getter();
      os_log_type_t v140 = static os_log_type_t.error.getter();
      *(void *)(v1 + 920) = 2;
      UnsignedInteger<>.init<A>(_:)();
      uint32_t v139 = *(_DWORD *)(v1 + 1676);
      uint64_t v142 = _allocateUninitializedArray<A>(_:)();
      if (os_log_type_enabled(v141, v140))
      {
        uint64_t v132 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
        uint64_t v131 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
        uint64_t v133 = createStorage<A>(capacity:type:)(0);
        uint64_t v134 = createStorage<A>(capacity:type:)(0);
        *(void *)(v1 + 928) = v132;
        *(void *)(v1 + 936) = v133;
        *(void *)(v1 + 944) = v134;
        serialize(_:at:)(0, (unsigned char **)(v1 + 928));
        serialize(_:at:)(0, (unsigned char **)(v1 + 928));
        *(void *)(v1 + 952) = v142;
        unint64_t v135 = (void *)swift_task_alloc();
        v135[2] = v1 + 928;
        v135[3] = v1 + 936;
        v135[4] = v1 + 944;
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
        lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
        Sequence.forEach(_:)();
        swift_task_dealloc();
        _os_log_impl(&dword_25DE00000, v141, v140, "Quantity validation failed - diastolic blood pressure value outside valid bounds.", v132, v139);
        destroyStorage<A>(_:count:)(v133, 0, v131);
        destroyStorage<A>(_:count:)(v134, 0, MEMORY[0x263F8EE58] + 8);
        MEMORY[0x2611C8D90](v132, MEMORY[0x263F8E778]);
      }
      swift_bridgeObjectRelease();
      id v121 = *(void (**)(uint64_t, uint64_t))(v1 + 1480);
      uint64_t v119 = *(void *)(v1 + 1360);
      uint64_t v120 = *(void *)(v1 + 1296);
      uint64_t v124 = *(void *)(v1 + 1288);
      uint64_t v123 = *(void *)(v1 + 1280);
      uint64_t v125 = *(void *)(v1 + 1248);
      id v127 = *(id *)(v1 + 1512);
      id v128 = *(id *)(v1 + 1504);
      id v129 = *(id *)(v1 + 1496);
      uint64_t v122 = *(void *)(v1 + 1256);

      v121(v119, v120);
      type metadata accessor for LogBloodPressureIntentResponse();
      uint64_t v130 = LogBloodPressureIntentResponse.__allocating_init(code:userActivity:)(102, 0);

      unint64_t v126 = *(void (**)(uint64_t, uint64_t))(v122 + 8);
      v126(v123, v125);
      v126(v124, v125);

      outlined destroy of HealthKitPersistor((id *)(v1 + 616));
      unint64_t v231 = v130;
      goto LABEL_57;
    }
    uint64_t v114 = *(void (**)(uint64_t, uint64_t, uint64_t))(v1 + 1432);
    uint64_t v38 = *(void *)(v1 + 1352);
    uint64_t v113 = *(void *)(v1 + 1296);
    uint64_t v112 = Logger.wellnessIntents.unsafeMutableAddressor();
    swift_beginAccess();
    v114(v38, v112, v113);
    swift_endAccess();
    Class v117 = Logger.logObject.getter();
    os_log_type_t v116 = static os_log_type_t.debug.getter();
    *(void *)(v1 + 736) = 2;
    UnsignedInteger<>.init<A>(_:)();
    uint32_t v115 = *(_DWORD *)(v1 + 1660);
    uint64_t v118 = _allocateUninitializedArray<A>(_:)();
    if (os_log_type_enabled(v117, v116))
    {
      id v108 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
      uint64_t v107 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      uint64_t v109 = createStorage<A>(capacity:type:)(0);
      uint64_t v110 = createStorage<A>(capacity:type:)(0);
      *(void *)(v1 + 888) = v108;
      *(void *)(v1 + 896) = v109;
      *(void *)(v1 + 904) = v110;
      serialize(_:at:)(0, (unsigned char **)(v1 + 888));
      serialize(_:at:)(0, (unsigned char **)(v1 + 888));
      *(void *)(v1 + 912) = v118;
      Class v111 = (void *)swift_task_alloc();
      v111[2] = v1 + 888;
      v111[3] = v1 + 896;
      v111[4] = v1 + 904;
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
      lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
      Sequence.forEach(_:)();
      swift_task_dealloc();
      _os_log_impl(&dword_25DE00000, v117, v116, "Creating HKCorrelation.", v108, v115);
      destroyStorage<A>(_:count:)(v109, 0, v107);
      destroyStorage<A>(_:count:)(v110, 0, MEMORY[0x263F8EE58] + 8);
      MEMORY[0x2611C8D90](v108, MEMORY[0x263F8E778]);
    }
    swift_bridgeObjectRelease();
    v89 = *(void (**)(uint64_t, uint64_t))(v1 + 1480);
    uint64_t v102 = *(void (**)(uint64_t, uint64_t, uint64_t))(v1 + 1432);
    uint64_t v88 = *(void *)(v1 + 1352);
    uint64_t v98 = *(void *)(v1 + 1344);
    uint64_t v101 = *(void *)(v1 + 1296);
    uint64_t v91 = *(void *)(v1 + 1288);
    uint64_t v92 = *(void *)(v1 + 1280);
    uint64_t v95 = *(void *)(v1 + 1272);
    uint64_t v96 = *(void *)(v1 + 1264);
    uint64_t v93 = *(void *)(v1 + 1248);
    Class v94 = *(void **)(v1 + 1512);

    v89(v88, v101);
    type metadata accessor for HKSample();
    _allocateUninitializedArray<A>(_:)();
    uint32_t v90 = v39;
    id v40 = v203;
    void *v90 = v203;
    id v41 = v153;
    v90[1] = v153;
    _finalizeUninitializedArray<A>(_:)();
    lazy protocol witness table accessor for type HKSample and conformance NSObject();
    uint64_t v97 = Set.init(arrayLiteral:)();
    *(void *)(v1 + 1600) = v97;
    *(void *)(v1 + 744) = v97;
    type metadata accessor for HKCorrelation();
    id v42 = v94;
    v216(v95, v91, v93);
    v216(v96, v92, v93);
    swift_bridgeObjectRetain();
    id v99 = @nonobjc HKCorrelation.__allocating_init(type:start:end:objects:)(v94, v95, v96);
    *(void *)(v1 + 1608) = v99;
    *(void *)(v1 + 752) = v99;
    uint64_t v100 = Logger.wellnessIntents.unsafeMutableAddressor();
    swift_beginAccess();
    v102(v98, v100, v101);
    swift_endAccess();
    unsigned int v105 = Logger.logObject.getter();
    os_log_type_t v104 = static os_log_type_t.debug.getter();
    *(void *)(v1 + 760) = 2;
    UnsignedInteger<>.init<A>(_:)();
    uint32_t v103 = *(_DWORD *)(v1 + 1664);
    uint64_t v106 = _allocateUninitializedArray<A>(_:)();
    if (os_log_type_enabled(v105, v104))
    {
      uint64_t v84 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
      uint64_t v83 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      uint64_t v85 = createStorage<A>(capacity:type:)(0);
      uint64_t v86 = createStorage<A>(capacity:type:)(0);
      *(void *)(v1 + 856) = v84;
      *(void *)(v1 + 864) = v85;
      *(void *)(v1 + 872) = v86;
      serialize(_:at:)(0, (unsigned char **)(v1 + 856));
      serialize(_:at:)(0, (unsigned char **)(v1 + 856));
      *(void *)(v1 + 880) = v106;
      unint64_t v87 = (void *)swift_task_alloc();
      v87[2] = v1 + 856;
      v87[3] = v1 + 864;
      v87[4] = v1 + 872;
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
      lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
      Sequence.forEach(_:)();
      swift_task_dealloc();
      _os_log_impl(&dword_25DE00000, v105, v104, "Trying to save to store.", v84, v103);
      destroyStorage<A>(_:count:)(v85, 0, v83);
      destroyStorage<A>(_:count:)(v86, 0, MEMORY[0x263F8EE58] + 8);
      MEMORY[0x2611C8D90](v84, MEMORY[0x263F8E778]);
    }
    swift_bridgeObjectRelease();
    *(void *)(v1 + 1616) = 0;
    uint64_t v81 = *(void (**)(uint64_t, uint64_t))(v1 + 1480);
    uint64_t v79 = *(void *)(v1 + 1344);
    uint64_t v80 = *(void *)(v1 + 1296);
    id v82 = *(id *)(v1 + 1240);

    v81(v79, v80);
    id v43 = v82;
    *(void *)(v1 + 16) = *(void *)(v1 + 512);
    *(void *)(v1 + 56) = v232;
    *(void *)(v1 + 24) = BloodPressurePersistor.save(systolic:diastolic:units:);
    *(void *)(v1 + 112) = swift_continuation_init();
    *(void *)(v1 + 80) = MEMORY[0x263EF8330];
    *(_DWORD *)(v1 + 88) = 0x40000000;
    *(_DWORD *)(v1 + 92) = 0;
    *(void *)(v1 + 96) = @objc completion handler block implementation for @escaping @callee_unowned @convention(block) @Sendable (@unowned Bool, @unowned NSError?) -> () with result type () zero on error;
    *(void *)(v1 + 104) = &block_descriptor_7;
    objc_msgSend(v82, sel_saveObject_withCompletion_, v99);
    return __swift_continuation_await_point();
  }
  else
  {
    uint64_t v13 = *(void *)(v1 + 1408);
    uint64_t v281 = *(void *)(v1 + 1296);
    uint64_t v280 = Logger.wellnessIntents.unsafeMutableAddressor();
    swift_beginAccess();
    v329(v13, v280, v281);
    swift_endAccess();
    log = Logger.logObject.getter();
    os_log_type_t v283 = static os_log_type_t.debug.getter();
    *(void *)(v1 + 624) = 2;
    UnsignedInteger<>.init<A>(_:)();
    uint32_t v282 = *(_DWORD *)(v1 + 1640);
    uint64_t v285 = _allocateUninitializedArray<A>(_:)();
    if (os_log_type_enabled(log, v283))
    {
      v276 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
      uint64_t v275 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      uint64_t v277 = createStorage<A>(capacity:type:)(0);
      uint64_t v278 = createStorage<A>(capacity:type:)(0);
      *(void *)(v1 + 1104) = v276;
      *(void *)(v1 + 1112) = v277;
      *(void *)(v1 + 1120) = v278;
      serialize(_:at:)(0, (unsigned char **)(v1 + 1104));
      serialize(_:at:)(0, (unsigned char **)(v1 + 1104));
      *(void *)(v1 + 1128) = v285;
      v279 = (void *)swift_task_alloc();
      v279[2] = v1 + 1104;
      v279[3] = v1 + 1112;
      v279[4] = v1 + 1120;
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
      lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
      Sequence.forEach(_:)();
      swift_task_dealloc();
      _os_log_impl(&dword_25DE00000, log, v283, "Using preferred unit.", v276, v282);
      destroyStorage<A>(_:count:)(v277, 0, v275);
      destroyStorage<A>(_:count:)(v278, 0, MEMORY[0x263F8EE58] + 8);
      MEMORY[0x2611C8D90](v276, MEMORY[0x263F8E778]);
    }
    swift_bridgeObjectRelease();
    *(void *)(v1 + 1520) = 0;
    uint64_t v273 = *(void *)(v1 + 1408);
    uint64_t v274 = *(void *)(v1 + 1296);

    v316(v273, v274);
    uint64_t v14 = (void *)swift_task_alloc();
    v325[191] = v14;
    *uint64_t v14 = v325[64];
    v14[1] = BloodPressurePersistor.save(systolic:diastolic:units:);
    uint64_t v15 = v325[155];
    return BloodPressurePersistor.preferredUnit()(v15);
  }
}

{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;

  uint64_t v3 = *v1;
  *(void *)(v3 + 512) = *v1;
  *(void *)(v3 + 1536) = a1;
  swift_task_dealloc();
  return MEMORY[0x270FA2498](BloodPressurePersistor.save(systolic:diastolic:units:), 0);
}

uint64_t BloodPressurePersistor.save(systolic:diastolic:units:)()
{
  uint64_t v265 = v0;
  uint64_t v1 = *(void *)(v0 + 1536);
  *(void *)(v0 + 512) = v0;
  *(void *)(v0 + 616) = v1;
  uint64_t v252 = *(void *)(v0 + 1520);
  uint64_t v255 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 1432);
  uint64_t v2 = *(void *)(v0 + 1400);
  uint64_t v254 = *(void *)(v0 + 1296);
  uint64_t v253 = Logger.wellnessIntents.unsafeMutableAddressor();
  swift_beginAccess();
  v255(v2, v253, v254);
  swift_endAccess();
  uint32_t v258 = Logger.logObject.getter();
  os_log_type_t v257 = static os_log_type_t.debug.getter();
  *(void *)(v0 + 632) = 2;
  UnsignedInteger<>.init<A>(_:)();
  uint32_t v256 = *(_DWORD *)(v0 + 1644);
  uint64_t v259 = _allocateUninitializedArray<A>(_:)();
  if (os_log_type_enabled(v258, v257))
  {
    buf = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
    uint64_t v246 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    uint64_t v248 = createStorage<A>(capacity:type:)(0);
    uint64_t v249 = createStorage<A>(capacity:type:)(0);
    *(void *)(v251 + 1072) = buf;
    *(void *)(v251 + 1080) = v248;
    *(void *)(v251 + 1088) = v249;
    serialize(_:at:)(0, (unsigned char **)(v251 + 1072));
    serialize(_:at:)(0, (unsigned char **)(v251 + 1072));
    *(void *)(v251 + 1096) = v259;
    uint64_t v250 = (void *)swift_task_alloc();
    v250[2] = v251 + 1072;
    v250[3] = v251 + 1080;
    v250[4] = v251 + 1088;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
    lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
    uint64_t result = Sequence.forEach(_:)();
    if (v252) {
      return result;
    }
    swift_task_dealloc();
    _os_log_impl(&dword_25DE00000, v258, v257, "Starting to convert optional HKUnit to non-optional HKUnit.", buf, v256);
    destroyStorage<A>(_:count:)(v248, 0, v246);
    destroyStorage<A>(_:count:)(v249, 0, MEMORY[0x263F8EE58] + 8);
    MEMORY[0x2611C8D90](buf, MEMORY[0x263F8E778]);
    swift_bridgeObjectRelease();
    uint64_t v245 = 0;
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v245 = v252;
  }
  uint64_t v243 = *(void (**)(uint64_t, uint64_t))(v251 + 1480);
  uint64_t v241 = *(void *)(v251 + 1400);
  uint64_t v242 = *(void *)(v251 + 1296);

  v243(v241, v242);
  uint64_t v244 = *(void **)(v251 + 616);
  *(void *)(v251 + 1544) = v244;
  id v4 = v244;
  if (!v244)
  {
    uint64_t v47 = *(void (**)(uint64_t, uint64_t, uint64_t))(v251 + 1432);
    uint64_t v31 = *(void *)(v251 + 1328);
    uint64_t v46 = *(void *)(v251 + 1296);
    uint64_t v45 = Logger.wellnessIntents.unsafeMutableAddressor();
    swift_beginAccess();
    v47(v31, v45, v46);
    swift_endAccess();
    char v50 = Logger.logObject.getter();
    os_log_type_t v49 = static os_log_type_t.error.getter();
    *(void *)(v251 + 640) = 2;
    UnsignedInteger<>.init<A>(_:)();
    uint32_t v48 = *(_DWORD *)(v251 + 1648);
    uint64_t v51 = _allocateUninitializedArray<A>(_:)();
    if (os_log_type_enabled(v50, v49))
    {
      id v41 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
      uint64_t v40 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      uint64_t v42 = createStorage<A>(capacity:type:)(0);
      uint64_t v43 = createStorage<A>(capacity:type:)(0);
      *(void *)(v251 + 648) = v41;
      *(void *)(v251 + 656) = v42;
      *(void *)(v251 + 664) = v43;
      serialize(_:at:)(0, (unsigned char **)(v251 + 648));
      serialize(_:at:)(0, (unsigned char **)(v251 + 648));
      *(void *)(v251 + 672) = v51;
      uint64_t v44 = (void *)swift_task_alloc();
      v44[2] = v251 + 648;
      uint64_t v44[3] = v251 + 656;
      v44[4] = v251 + 664;
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
      lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
      uint64_t result = Sequence.forEach(_:)();
      if (v245) {
        return result;
      }
      swift_task_dealloc();
      _os_log_impl(&dword_25DE00000, v50, v49, "Could not create an HKUnit.", v41, v48);
      destroyStorage<A>(_:count:)(v42, 0, v40);
      destroyStorage<A>(_:count:)(v43, 0, MEMORY[0x263F8EE58] + 8);
      MEMORY[0x2611C8D90](v41, MEMORY[0x263F8E778]);
      swift_bridgeObjectRelease();
    }
    else
    {
      swift_bridgeObjectRelease();
    }
    id v35 = *(void (**)(uint64_t, uint64_t))(v251 + 1480);
    uint64_t v33 = *(void *)(v251 + 1328);
    uint64_t v34 = *(void *)(v251 + 1296);
    id v36 = *(id *)(v251 + 1512);
    id v37 = *(id *)(v251 + 1504);
    id v38 = *(id *)(v251 + 1496);

    v35(v33, v34);
    type metadata accessor for LogBloodPressureIntentResponse();
    unint64_t v39 = LogBloodPressureIntentResponse.__allocating_init(code:userActivity:)(5, 0);
    outlined destroy of HealthKitPersistor((id *)(v251 + 616));

    id v208 = v39;
    goto LABEL_60;
  }
  id v5 = *(void **)(v251 + 1496);
  id v239 = *(id *)(v251 + 1504);
  *(void *)(v251 + 680) = v244;
  unsigned __int8 v240 = objc_msgSend(v5, sel_isCompatibleWithUnit_);
  id v6 = v239;
  id v7 = v244;
  if (v240) {
    unsigned int v238 = objc_msgSend(*(id *)(v251 + 1504), sel_isCompatibleWithUnit_, v244) ^ 1;
  }
  else {
    LOBYTE(v238) = 1;
  }

  if (v238)
  {
    unint64_t v216 = *(void (**)(uint64_t, uint64_t, uint64_t))(v251 + 1432);
    uint64_t v8 = *(void *)(v251 + 1392);
    uint64_t v215 = *(void *)(v251 + 1296);
    uint64_t v218 = *(void **)(v251 + 1504);
    uint64_t v217 = *(void **)(v251 + 1496);
    uint64_t v214 = Logger.wellnessIntents.unsafeMutableAddressor();
    swift_beginAccess();
    v216(v8, v214, v215);
    swift_endAccess();
    id v9 = v244;
    uint64_t v220 = swift_allocObject();
    *(void *)(v220 + 16) = v244;
    id v10 = v217;
    uint64_t v222 = swift_allocObject();
    *(void *)(v222 + 16) = v217;
    id v11 = v218;
    uint64_t v224 = swift_allocObject();
    *(void *)(v224 + 16) = v218;
    oslog = Logger.logObject.getter();
    os_log_type_t v237 = static os_log_type_t.error.getter();
    *(void *)(v251 + 1064) = 32;
    UnsignedInteger<>.init<A>(_:)();
    uint32_t size = *(_DWORD *)(v251 + 1684);
    uint64_t v226 = swift_allocObject();
    *(unsigned char *)(v226 + 16) = 64;
    uint64_t v227 = swift_allocObject();
    *(unsigned char *)(v227 + 16) = 8;
    uint64_t v221 = swift_allocObject();
    *(void *)(v221 + 16) = partial apply for implicit closure #3 in LogQuantityIntentHandler.handle(intent:);
    *(void *)(v221 + 24) = v220;
    uint64_t v228 = swift_allocObject();
    *(void *)(v228 + 16) = partial apply for implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:);
    *(void *)(v228 + 24) = v221;
    uint64_t v229 = swift_allocObject();
    *(unsigned char *)(v229 + 16) = 64;
    uint64_t v230 = swift_allocObject();
    *(unsigned char *)(v230 + 16) = 8;
    uint64_t v223 = swift_allocObject();
    *(void *)(v223 + 16) = partial apply for implicit closure #3 in LogQuantityIntentHandler.handle(intent:);
    *(void *)(v223 + 24) = v222;
    uint64_t v231 = swift_allocObject();
    *(void *)(v231 + 16) = partial apply for implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:);
    *(void *)(v231 + 24) = v223;
    uint64_t v232 = swift_allocObject();
    *(unsigned char *)(v232 + 16) = 64;
    uint64_t v233 = swift_allocObject();
    *(unsigned char *)(v233 + 16) = 8;
    uint64_t v225 = swift_allocObject();
    *(void *)(v225 + 16) = partial apply for implicit closure #3 in LogQuantityIntentHandler.handle(intent:);
    *(void *)(v225 + 24) = v224;
    uint64_t v234 = swift_allocObject();
    *(void *)(v234 + 16) = partial apply for implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:);
    *(void *)(v234 + 24) = v225;
    _allocateUninitializedArray<A>(_:)();
    uint64_t v235 = v12;
    swift_retain();
    *uint64_t v235 = partial apply for closure #1 in OSLogArguments.append(_:);
    v235[1] = v226;
    swift_retain();
    v235[2] = partial apply for closure #1 in OSLogArguments.append(_:);
    v235[3] = v227;
    swift_retain();
    v235[4] = partial apply for closure #1 in OSLogArguments.append(_:);
    v235[5] = v228;
    swift_retain();
    v235[6] = partial apply for closure #1 in OSLogArguments.append(_:);
    v235[7] = v229;
    swift_retain();
    v235[8] = partial apply for closure #1 in OSLogArguments.append(_:);
    v235[9] = v230;
    swift_retain();
    v235[10] = partial apply for closure #1 in OSLogArguments.append(_:);
    v235[11] = v231;
    swift_retain();
    v235[12] = partial apply for closure #1 in OSLogArguments.append(_:);
    v235[13] = v232;
    swift_retain();
    v235[14] = partial apply for closure #1 in OSLogArguments.append(_:);
    v235[15] = v233;
    swift_retain();
    v235[16] = partial apply for closure #1 in OSLogArguments.append(_:);
    v235[17] = v234;
    _finalizeUninitializedArray<A>(_:)();
    swift_bridgeObjectRelease();
    if (os_log_type_enabled(oslog, v237))
    {
      uint64_t v211 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
      uint64_t v210 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      uint64_t v212 = createStorage<A>(capacity:type:)(3);
      uint64_t v213 = createStorage<A>(capacity:type:)(0);
      os_log_type_t v260 = v211;
      uint64_t v261 = v212;
      uint64_t v262 = v213;
      serialize(_:at:)(2, &v260);
      serialize(_:at:)(3, &v260);
      unsigned __int8 v263 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
      uint64_t v264 = v226;
      uint64_t result = closure #1 in osLogInternal(_:log:type:)(&v263, (uint64_t)&v260, (uint64_t)&v261, (uint64_t)&v262);
      if (v245) {
        return result;
      }
      unsigned __int8 v263 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
      uint64_t v264 = v227;
      closure #1 in osLogInternal(_:log:type:)(&v263, (uint64_t)&v260, (uint64_t)&v261, (uint64_t)&v262);
      unsigned __int8 v263 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
      uint64_t v264 = v228;
      closure #1 in osLogInternal(_:log:type:)(&v263, (uint64_t)&v260, (uint64_t)&v261, (uint64_t)&v262);
      unsigned __int8 v263 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
      uint64_t v264 = v229;
      closure #1 in osLogInternal(_:log:type:)(&v263, (uint64_t)&v260, (uint64_t)&v261, (uint64_t)&v262);
      unsigned __int8 v263 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
      uint64_t v264 = v230;
      closure #1 in osLogInternal(_:log:type:)(&v263, (uint64_t)&v260, (uint64_t)&v261, (uint64_t)&v262);
      unsigned __int8 v263 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
      uint64_t v264 = v231;
      closure #1 in osLogInternal(_:log:type:)(&v263, (uint64_t)&v260, (uint64_t)&v261, (uint64_t)&v262);
      unsigned __int8 v263 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
      uint64_t v264 = v232;
      closure #1 in osLogInternal(_:log:type:)(&v263, (uint64_t)&v260, (uint64_t)&v261, (uint64_t)&v262);
      unsigned __int8 v263 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
      uint64_t v264 = v233;
      closure #1 in osLogInternal(_:log:type:)(&v263, (uint64_t)&v260, (uint64_t)&v261, (uint64_t)&v262);
      unsigned __int8 v263 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
      uint64_t v264 = v234;
      closure #1 in osLogInternal(_:log:type:)(&v263, (uint64_t)&v260, (uint64_t)&v261, (uint64_t)&v262);
      _os_log_impl(&dword_25DE00000, oslog, v237, "%@ is incompatible with %@ or %@.", v211, size);
      destroyStorage<A>(_:count:)(v212, 3, v210);
      destroyStorage<A>(_:count:)(v213, 0, MEMORY[0x263F8EE58] + 8);
      MEMORY[0x2611C8D90](v211, MEMORY[0x263F8E778]);
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
    }
    else
    {
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
    }
    id v203 = *(void (**)(uint64_t, uint64_t))(v251 + 1480);
    uint64_t v201 = *(void *)(v251 + 1392);
    uint64_t v202 = *(void *)(v251 + 1296);
    id v204 = *(id *)(v251 + 1512);
    id v205 = *(id *)(v251 + 1504);
    id v206 = *(id *)(v251 + 1496);

    v203(v201, v202);
    type metadata accessor for LogBloodPressureIntentResponse();
    uint64_t v207 = LogBloodPressureIntentResponse.__allocating_init(code:userActivity:)(102, 0);

    outlined destroy of HealthKitPersistor((id *)(v251 + 616));
    id v208 = v207;
LABEL_60:
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v32 = *(uint64_t (**)(char *))(*(void *)(v251 + 512) + 8);
    return v32(v208);
  }
  double v196 = *(void (**)(uint64_t, uint64_t, uint64_t))(v251 + 1432);
  uint64_t v13 = *(void *)(v251 + 1384);
  uint64_t v195 = *(void *)(v251 + 1296);
  uint64_t v191 = *(void *)(v251 + 1288);
  uint64_t v190 = *(void *)(v251 + 1280);
  uint64_t v192 = *(void *)(v251 + 1248);
  uint64_t v189 = *(void *)(v251 + 1256);
  Date.init()();
  uint64_t v193 = *(void (**)(uint64_t, uint64_t, uint64_t))(v189 + 16);
  *(void *)(v251 + 1552) = v193;
  *(void *)(v251 + 1560) = (v189 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  v193(v190, v191, v192);
  uint64_t v194 = Logger.wellnessIntents.unsafeMutableAddressor();
  swift_beginAccess();
  v196(v13, v194, v195);
  swift_endAccess();
  log = Logger.logObject.getter();
  os_log_type_t v198 = static os_log_type_t.debug.getter();
  *(void *)(v251 + 688) = 2;
  UnsignedInteger<>.init<A>(_:)();
  uint32_t v197 = *(_DWORD *)(v251 + 1652);
  uint64_t v200 = _allocateUninitializedArray<A>(_:)();
  if (os_log_type_enabled(log, v198))
  {
    uint64_t v185 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
    uint64_t v184 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    uint64_t v186 = createStorage<A>(capacity:type:)(0);
    uint64_t v187 = createStorage<A>(capacity:type:)(0);
    *(void *)(v251 + 1032) = v185;
    *(void *)(v251 + 1040) = v186;
    *(void *)(v251 + 1048) = v187;
    serialize(_:at:)(0, (unsigned char **)(v251 + 1032));
    serialize(_:at:)(0, (unsigned char **)(v251 + 1032));
    *(void *)(v251 + 1056) = v200;
    uint64_t v188 = (void *)swift_task_alloc();
    v188[2] = v251 + 1032;
    v188[3] = v251 + 1040;
    v188[4] = v251 + 1048;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
    lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
    uint64_t result = Sequence.forEach(_:)();
    if (v245) {
      return result;
    }
    swift_task_dealloc();
    _os_log_impl(&dword_25DE00000, log, v198, "Creating HKQuantity for Systolic.", v185, v197);
    destroyStorage<A>(_:count:)(v186, 0, v184);
    destroyStorage<A>(_:count:)(v187, 0, MEMORY[0x263F8EE58] + 8);
    MEMORY[0x2611C8D90](v185, MEMORY[0x263F8E778]);
    swift_bridgeObjectRelease();
    uint64_t v183 = 0;
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v183 = v245;
  }
  uint64_t v171 = *(void (**)(uint64_t, uint64_t))(v251 + 1480);
  uint64_t v169 = *(void *)(v251 + 1384);
  uint64_t v170 = *(void *)(v251 + 1296);
  uint64_t v173 = *(void *)(v251 + 1288);
  uint64_t v174 = *(void *)(v251 + 1280);
  uint64_t v176 = *(void *)(v251 + 1272);
  uint64_t v177 = *(void *)(v251 + 1264);
  uint64_t v175 = *(void *)(v251 + 1248);
  double v172 = *(double *)(v251 + 1208);
  id v178 = *(void **)(v251 + 1496);

  v171(v169, v170);
  type metadata accessor for HKQuantity();
  id v14 = v244;
  id v180 = @nonobjc HKQuantity.__allocating_init(unit:doubleValue:)(v244, v172);
  *(void *)(v251 + 1568) = v180;
  *(void *)(v251 + 696) = v180;
  type metadata accessor for HKQuantitySample();
  id v15 = v178;
  id v16 = v180;
  v193(v176, v173, v175);
  v193(v177, v174, v175);
  id v179 = @nonobjc HKQuantitySample.__allocating_init(type:quantity:start:end:)(v178, v180, v176, v177);
  *(void *)(v251 + 1576) = v179;
  *(void *)(v251 + 704) = v179;
  identifier = (NSString *)*MEMORY[0x263F09C28];
  id v17 = (id)*MEMORY[0x263F09C28];
  Swift::Bool v182 = validateQuantity(identifier:quantity:)(identifier, (HKQuantity)v180);

  if (!v182)
  {
    unint64_t v164 = *(void (**)(uint64_t, uint64_t, uint64_t))(v251 + 1432);
    uint64_t v18 = *(void *)(v251 + 1376);
    uint64_t v163 = *(void *)(v251 + 1296);
    uint64_t v162 = Logger.wellnessIntents.unsafeMutableAddressor();
    swift_beginAccess();
    v164(v18, v162, v163);
    swift_endAccess();
    uint64_t v167 = Logger.logObject.getter();
    os_log_type_t v166 = static os_log_type_t.error.getter();
    *(void *)(v251 + 992) = 2;
    UnsignedInteger<>.init<A>(_:)();
    uint32_t v165 = *(_DWORD *)(v251 + 1680);
    uint64_t v168 = _allocateUninitializedArray<A>(_:)();
    if (os_log_type_enabled(v167, v166))
    {
      uint64_t v158 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
      uint64_t v157 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      uint64_t v159 = createStorage<A>(capacity:type:)(0);
      uint64_t v160 = createStorage<A>(capacity:type:)(0);
      *(void *)(v251 + 1000) = v158;
      *(void *)(v251 + 1008) = v159;
      *(void *)(v251 + 1016) = v160;
      serialize(_:at:)(0, (unsigned char **)(v251 + 1000));
      serialize(_:at:)(0, (unsigned char **)(v251 + 1000));
      *(void *)(v251 + 1024) = v168;
      int v161 = (void *)swift_task_alloc();
      v161[2] = v251 + 1000;
      v161[3] = v251 + 1008;
      v161[4] = v251 + 1016;
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
      lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
      uint64_t result = Sequence.forEach(_:)();
      if (v183) {
        return result;
      }
      swift_task_dealloc();
      _os_log_impl(&dword_25DE00000, v167, v166, "Quantity validation failed - systolic blood pressure value outside valid bounds.", v158, v165);
      destroyStorage<A>(_:count:)(v159, 0, v157);
      destroyStorage<A>(_:count:)(v160, 0, MEMORY[0x263F8EE58] + 8);
      MEMORY[0x2611C8D90](v158, MEMORY[0x263F8E778]);
      swift_bridgeObjectRelease();
    }
    else
    {
      swift_bridgeObjectRelease();
    }
    uint64_t v147 = *(void (**)(uint64_t, uint64_t))(v251 + 1480);
    uint64_t v145 = *(void *)(v251 + 1376);
    uint64_t v146 = *(void *)(v251 + 1296);
    uint64_t v150 = *(void *)(v251 + 1288);
    uint64_t v149 = *(void *)(v251 + 1280);
    uint64_t v151 = *(void *)(v251 + 1248);
    id v153 = *(id *)(v251 + 1512);
    id v154 = *(id *)(v251 + 1504);
    id v155 = *(id *)(v251 + 1496);
    uint64_t v148 = *(void *)(v251 + 1256);

    v147(v145, v146);
    type metadata accessor for LogBloodPressureIntentResponse();
    Swift::Bool v156 = LogBloodPressureIntentResponse.__allocating_init(code:userActivity:)(102, 0);

    uint64_t v152 = *(void (**)(uint64_t, uint64_t))(v148 + 8);
    v152(v149, v151);
    v152(v150, v151);

    outlined destroy of HealthKitPersistor((id *)(v251 + 616));
    id v208 = v156;
    goto LABEL_60;
  }
  os_log_type_t v140 = *(void (**)(uint64_t, uint64_t, uint64_t))(v251 + 1432);
  uint64_t v19 = *(void *)(v251 + 1368);
  uint64_t v139 = *(void *)(v251 + 1296);
  uint64_t v138 = Logger.wellnessIntents.unsafeMutableAddressor();
  swift_beginAccess();
  v140(v19, v138, v139);
  swift_endAccess();
  uint64_t v143 = Logger.logObject.getter();
  os_log_type_t v142 = static os_log_type_t.debug.getter();
  *(void *)(v251 + 712) = 2;
  UnsignedInteger<>.init<A>(_:)();
  uint32_t v141 = *(_DWORD *)(v251 + 1656);
  uint64_t v144 = _allocateUninitializedArray<A>(_:)();
  if (os_log_type_enabled(v143, v142))
  {
    uint64_t v134 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
    uint64_t v133 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    uint64_t v135 = createStorage<A>(capacity:type:)(0);
    uint64_t v136 = createStorage<A>(capacity:type:)(0);
    *(void *)(v251 + 960) = v134;
    *(void *)(v251 + 968) = v135;
    *(void *)(v251 + 976) = v136;
    serialize(_:at:)(0, (unsigned char **)(v251 + 960));
    serialize(_:at:)(0, (unsigned char **)(v251 + 960));
    *(void *)(v251 + 984) = v144;
    uint64_t v137 = (void *)swift_task_alloc();
    v137[2] = v251 + 960;
    v137[3] = v251 + 968;
    v137[4] = v251 + 976;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
    lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
    uint64_t result = Sequence.forEach(_:)();
    if (v183) {
      return result;
    }
    swift_task_dealloc();
    _os_log_impl(&dword_25DE00000, v143, v142, "Creating HKQuantity for Diastolic.", v134, v141);
    destroyStorage<A>(_:count:)(v135, 0, v133);
    destroyStorage<A>(_:count:)(v136, 0, MEMORY[0x263F8EE58] + 8);
    MEMORY[0x2611C8D90](v134, MEMORY[0x263F8E778]);
    swift_bridgeObjectRelease();
    uint64_t v132 = 0;
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v132 = v183;
  }
  uint64_t v120 = *(void (**)(uint64_t, uint64_t))(v251 + 1480);
  uint64_t v118 = *(void *)(v251 + 1368);
  uint64_t v119 = *(void *)(v251 + 1296);
  uint64_t v122 = *(void *)(v251 + 1288);
  uint64_t v123 = *(void *)(v251 + 1280);
  uint64_t v125 = *(void *)(v251 + 1272);
  uint64_t v126 = *(void *)(v251 + 1264);
  uint64_t v124 = *(void *)(v251 + 1248);
  double v121 = *(double *)(v251 + 1216);
  id v127 = *(void **)(v251 + 1504);

  v120(v118, v119);
  id v20 = v244;
  id v129 = @nonobjc HKQuantity.__allocating_init(unit:doubleValue:)(v244, v121);
  *(void *)(v251 + 1584) = v129;
  *(void *)(v251 + 720) = v129;
  id v21 = v127;
  id v22 = v129;
  v193(v125, v122, v124);
  v193(v126, v123, v124);
  id v128 = @nonobjc HKQuantitySample.__allocating_init(type:quantity:start:end:)(v127, v129, v125, v126);
  *(void *)(v251 + 1592) = v128;
  *(void *)(v251 + 728) = v128;
  uint64_t v130 = (NSString *)*MEMORY[0x263F09C20];
  id v23 = (id)*MEMORY[0x263F09C20];
  Swift::Bool v131 = validateQuantity(identifier:quantity:)(v130, (HKQuantity)v129);

  if (!v131)
  {
    uint64_t v113 = *(void (**)(uint64_t, uint64_t, uint64_t))(v251 + 1432);
    uint64_t v24 = *(void *)(v251 + 1360);
    uint64_t v112 = *(void *)(v251 + 1296);
    uint64_t v111 = Logger.wellnessIntents.unsafeMutableAddressor();
    swift_beginAccess();
    v113(v24, v111, v112);
    swift_endAccess();
    os_log_type_t v116 = Logger.logObject.getter();
    os_log_type_t v115 = static os_log_type_t.error.getter();
    *(void *)(v251 + 920) = 2;
    UnsignedInteger<>.init<A>(_:)();
    uint32_t v114 = *(_DWORD *)(v251 + 1676);
    uint64_t v117 = _allocateUninitializedArray<A>(_:)();
    if (os_log_type_enabled(v116, v115))
    {
      uint64_t v107 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
      uint64_t v106 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      uint64_t v108 = createStorage<A>(capacity:type:)(0);
      uint64_t v109 = createStorage<A>(capacity:type:)(0);
      *(void *)(v251 + 928) = v107;
      *(void *)(v251 + 936) = v108;
      *(void *)(v251 + 944) = v109;
      serialize(_:at:)(0, (unsigned char **)(v251 + 928));
      serialize(_:at:)(0, (unsigned char **)(v251 + 928));
      *(void *)(v251 + 952) = v117;
      uint64_t v110 = (void *)swift_task_alloc();
      v110[2] = v251 + 928;
      v110[3] = v251 + 936;
      v110[4] = v251 + 944;
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
      lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
      uint64_t result = Sequence.forEach(_:)();
      if (v132) {
        return result;
      }
      swift_task_dealloc();
      _os_log_impl(&dword_25DE00000, v116, v115, "Quantity validation failed - diastolic blood pressure value outside valid bounds.", v107, v114);
      destroyStorage<A>(_:count:)(v108, 0, v106);
      destroyStorage<A>(_:count:)(v109, 0, MEMORY[0x263F8EE58] + 8);
      MEMORY[0x2611C8D90](v107, MEMORY[0x263F8E778]);
      swift_bridgeObjectRelease();
    }
    else
    {
      swift_bridgeObjectRelease();
    }
    uint64_t v96 = *(void (**)(uint64_t, uint64_t))(v251 + 1480);
    uint64_t v94 = *(void *)(v251 + 1360);
    uint64_t v95 = *(void *)(v251 + 1296);
    uint64_t v99 = *(void *)(v251 + 1288);
    uint64_t v98 = *(void *)(v251 + 1280);
    uint64_t v100 = *(void *)(v251 + 1248);
    id v102 = *(id *)(v251 + 1512);
    id v103 = *(id *)(v251 + 1504);
    id v104 = *(id *)(v251 + 1496);
    uint64_t v97 = *(void *)(v251 + 1256);

    v96(v94, v95);
    type metadata accessor for LogBloodPressureIntentResponse();
    unsigned int v105 = LogBloodPressureIntentResponse.__allocating_init(code:userActivity:)(102, 0);

    uint64_t v101 = *(void (**)(uint64_t, uint64_t))(v97 + 8);
    v101(v98, v100);
    v101(v99, v100);

    outlined destroy of HealthKitPersistor((id *)(v251 + 616));
    id v208 = v105;
    goto LABEL_60;
  }
  v89 = *(void (**)(uint64_t, uint64_t, uint64_t))(v251 + 1432);
  uint64_t v25 = *(void *)(v251 + 1352);
  uint64_t v88 = *(void *)(v251 + 1296);
  uint64_t v87 = Logger.wellnessIntents.unsafeMutableAddressor();
  swift_beginAccess();
  v89(v25, v87, v88);
  swift_endAccess();
  uint64_t v92 = Logger.logObject.getter();
  os_log_type_t v91 = static os_log_type_t.debug.getter();
  *(void *)(v251 + 736) = 2;
  UnsignedInteger<>.init<A>(_:)();
  uint32_t v90 = *(_DWORD *)(v251 + 1660);
  uint64_t v93 = _allocateUninitializedArray<A>(_:)();
  if (os_log_type_enabled(v92, v91))
  {
    uint64_t v83 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
    uint64_t v82 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    uint64_t v84 = createStorage<A>(capacity:type:)(0);
    uint64_t v85 = createStorage<A>(capacity:type:)(0);
    *(void *)(v251 + 888) = v83;
    *(void *)(v251 + 896) = v84;
    *(void *)(v251 + 904) = v85;
    serialize(_:at:)(0, (unsigned char **)(v251 + 888));
    serialize(_:at:)(0, (unsigned char **)(v251 + 888));
    *(void *)(v251 + 912) = v93;
    uint64_t v86 = (void *)swift_task_alloc();
    v86[2] = v251 + 888;
    v86[3] = v251 + 896;
    v86[4] = v251 + 904;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
    lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
    uint64_t result = Sequence.forEach(_:)();
    if (v132) {
      return result;
    }
    swift_task_dealloc();
    _os_log_impl(&dword_25DE00000, v92, v91, "Creating HKCorrelation.", v83, v90);
    destroyStorage<A>(_:count:)(v84, 0, v82);
    destroyStorage<A>(_:count:)(v85, 0, MEMORY[0x263F8EE58] + 8);
    MEMORY[0x2611C8D90](v83, MEMORY[0x263F8E778]);
    swift_bridgeObjectRelease();
    uint64_t v81 = 0;
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v81 = v132;
  }
  id v63 = *(void (**)(uint64_t, uint64_t))(v251 + 1480);
  os_log_type_t v76 = *(void (**)(uint64_t, uint64_t, uint64_t))(v251 + 1432);
  uint64_t v62 = *(void *)(v251 + 1352);
  uint64_t v72 = *(void *)(v251 + 1344);
  uint64_t v75 = *(void *)(v251 + 1296);
  uint64_t v65 = *(void *)(v251 + 1288);
  uint64_t v66 = *(void *)(v251 + 1280);
  uint64_t v69 = *(void *)(v251 + 1272);
  uint64_t v70 = *(void *)(v251 + 1264);
  uint64_t v67 = *(void *)(v251 + 1248);
  int v68 = *(void **)(v251 + 1512);

  v63(v62, v75);
  type metadata accessor for HKSample();
  _allocateUninitializedArray<A>(_:)();
  id v64 = v26;
  id v27 = v179;
  *id v64 = v179;
  id v28 = v128;
  v64[1] = v128;
  _finalizeUninitializedArray<A>(_:)();
  lazy protocol witness table accessor for type HKSample and conformance NSObject();
  uint64_t v71 = Set.init(arrayLiteral:)();
  *(void *)(v251 + 1600) = v71;
  *(void *)(v251 + 744) = v71;
  type metadata accessor for HKCorrelation();
  id v29 = v68;
  v193(v69, v65, v67);
  v193(v70, v66, v67);
  swift_bridgeObjectRetain();
  id v73 = @nonobjc HKCorrelation.__allocating_init(type:start:end:objects:)(v68, v69, v70);
  *(void *)(v251 + 1608) = v73;
  *(void *)(v251 + 752) = v73;
  uint64_t v74 = Logger.wellnessIntents.unsafeMutableAddressor();
  swift_beginAccess();
  v76(v72, v74, v75);
  swift_endAccess();
  uint64_t v79 = Logger.logObject.getter();
  os_log_type_t v78 = static os_log_type_t.debug.getter();
  *(void *)(v251 + 760) = 2;
  UnsignedInteger<>.init<A>(_:)();
  uint32_t v77 = *(_DWORD *)(v251 + 1664);
  uint64_t v80 = _allocateUninitializedArray<A>(_:)();
  if (os_log_type_enabled(v79, v78))
  {
    uint64_t v58 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
    uint64_t v57 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    uint64_t v59 = createStorage<A>(capacity:type:)(0);
    uint64_t v60 = createStorage<A>(capacity:type:)(0);
    *(void *)(v251 + 856) = v58;
    *(void *)(v251 + 864) = v59;
    *(void *)(v251 + 872) = v60;
    serialize(_:at:)(0, (unsigned char **)(v251 + 856));
    serialize(_:at:)(0, (unsigned char **)(v251 + 856));
    *(void *)(v251 + 880) = v80;
    uint64_t v61 = (void *)swift_task_alloc();
    v61[2] = v251 + 856;
    v61[3] = v251 + 864;
    v61[4] = v251 + 872;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
    lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
    uint64_t result = Sequence.forEach(_:)();
    if (v81) {
      return result;
    }
    swift_task_dealloc();
    _os_log_impl(&dword_25DE00000, v79, v78, "Trying to save to store.", v58, v77);
    destroyStorage<A>(_:count:)(v59, 0, v57);
    destroyStorage<A>(_:count:)(v60, 0, MEMORY[0x263F8EE58] + 8);
    MEMORY[0x2611C8D90](v58, MEMORY[0x263F8E778]);
    swift_bridgeObjectRelease();
    uint64_t v56 = 0;
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v56 = v81;
  }
  *(void *)(v251 + 1616) = v56;
  uint64_t v54 = *(void (**)(uint64_t, uint64_t))(v251 + 1480);
  uint64_t v52 = *(void *)(v251 + 1344);
  uint64_t v53 = *(void *)(v251 + 1296);
  id v55 = *(id *)(v251 + 1240);

  v54(v52, v53);
  id v30 = v55;
  *(void *)(v251 + 16) = *(void *)(v251 + 512);
  *(void *)(v251 + 56) = v209;
  *(void *)(v251 + 24) = BloodPressurePersistor.save(systolic:diastolic:units:);
  *(void *)(v251 + 112) = swift_continuation_init();
  *(void *)(v251 + 80) = MEMORY[0x263EF8330];
  *(_DWORD *)(v251 + 88) = 0x40000000;
  *(_DWORD *)(v251 + 92) = 0;
  *(void *)(v251 + 96) = @objc completion handler block implementation for @escaping @callee_unowned @convention(block) @Sendable (@unowned Bool, @unowned NSError?) -> () with result type () zero on error;
  *(void *)(v251 + 104) = &block_descriptor_7;
  objc_msgSend(v55, sel_saveObject_withCompletion_, v73);
  return __swift_continuation_await_point();
}

{
  uint64_t *v0;
  uint64_t v1;
  uint64_t (*v2)();
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  id v4 = *v0;
  id v5 = *v0;
  *(void *)(v5 + 512) = *v0;
  uint64_t v1 = *(void *)(v4 + 48);
  *(void *)(v5 + 1624) = v1;
  if (v1)
  {
    uint64_t v2 = BloodPressurePersistor.save(systolic:diastolic:units:);
  }
  else
  {
    uint64_t v2 = BloodPressurePersistor.save(systolic:diastolic:units:);
  }
  return MEMORY[0x270FA2498](v2, 0);
}

{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t result;
  double v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  Swift::String v10;
  uint64_t (*v11)(char *);
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t);
  id v15;
  double v16;
  id v17;
  double v18;
  Swift::Double value;
  id store;
  id v21;
  uint64_t v22;
  Class isa;
  void (*v24)(uint64_t, uint64_t, uint64_t);
  uint64_t v25;
  Class v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void (*v35)(uint64_t, uint64_t);
  id v36;
  id v37;
  id v38;
  id v39;
  char *v40;
  uint64_t v41;
  uint8_t *buf;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void (*v49)(uint64_t, uint64_t, uint64_t);
  uint32_t v50;
  os_log_type_t v51;
  NSObject *v52;
  uint64_t v53;
  uint64_t v54;
  HKHealthStore_optional v55;
  Swift::Double_optional v56;

  os_log_type_t v49 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 1432);
  uint64_t v1 = *(void *)(v0 + 1336);
  uint32_t v48 = *(void *)(v0 + 1296);
  uint64_t v2 = *(void **)(v0 + 1240);
  *(void *)(v0 + 512) = v0;

  uint64_t v47 = Logger.wellnessIntents.unsafeMutableAddressor();
  swift_beginAccess();
  v49(v1, v47, v48);
  swift_endAccess();
  uint64_t v52 = Logger.logObject.getter();
  uint64_t v51 = static os_log_type_t.debug.getter();
  *(void *)(v0 + 784) = 2;
  UnsignedInteger<>.init<A>(_:)();
  char v50 = *(_DWORD *)(v0 + 1672);
  uint64_t v53 = _allocateUninitializedArray<A>(_:)();
  if (os_log_type_enabled(v52, v51))
  {
    uint64_t v3 = *(void *)(v46 + 1616);
    buf = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
    id v41 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    uint64_t v43 = createStorage<A>(capacity:type:)(0);
    uint64_t v44 = createStorage<A>(capacity:type:)(0);
    *(void *)(v46 + 824) = buf;
    *(void *)(v46 + 832) = v43;
    *(void *)(v46 + 840) = v44;
    serialize(_:at:)(0, (unsigned char **)(v46 + 824));
    serialize(_:at:)(0, (unsigned char **)(v46 + 824));
    *(void *)(v46 + 848) = v53;
    uint64_t v45 = (void *)swift_task_alloc();
    v45[2] = v46 + 824;
    v45[3] = v46 + 832;
    v45[4] = v46 + 840;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
    lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
    uint64_t result = Sequence.forEach(_:)();
    if (v3) {
      return result;
    }
    swift_task_dealloc();
    _os_log_impl(&dword_25DE00000, v52, v51, "Getting intent response.", buf, v50);
    destroyStorage<A>(_:count:)(v43, 0, v41);
    destroyStorage<A>(_:count:)(v44, 0, MEMORY[0x263F8EE58] + 8);
    MEMORY[0x2611C8D90](buf, MEMORY[0x263F8E778]);
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  id v27 = *(id *)(v46 + 1608);
  id v28 = *(id *)(v46 + 1592);
  id v29 = *(id *)(v46 + 1584);
  id v30 = *(id *)(v46 + 1576);
  uint64_t v31 = *(id *)(v46 + 1568);
  uint64_t v24 = *(void (**)(uint64_t, uint64_t, uint64_t))(v46 + 1552);
  id v14 = *(void (**)(uint64_t, uint64_t))(v46 + 1480);
  uint64_t v12 = *(void *)(v46 + 1336);
  uint64_t v13 = *(void *)(v46 + 1296);
  uint64_t v33 = *(void *)(v46 + 1288);
  uint64_t v32 = *(void *)(v46 + 1280);
  uint64_t v25 = *(void *)(v46 + 1272);
  uint64_t v34 = *(void *)(v46 + 1248);
  store = *(id *)(v46 + 1240);
  id v36 = *(id *)(v46 + 1544);
  id v37 = *(id *)(v46 + 1512);
  id v38 = *(id *)(v46 + 1504);
  unint64_t v39 = *(id *)(v46 + 1496);
  id v22 = *(void *)(v46 + 1256);

  v14(v12, v13);
  type metadata accessor for LogBloodPressureIntentResponse();
  uint64_t v40 = LogBloodPressureIntentResponse.__allocating_init(code:userActivity:)(4, 0);
  *(void *)(v46 + 792) = v40;
  id v15 = [v30 (SEL)0x1F76514DBLL];
  objc_msgSend(v15, (SEL)0x1F7C3BF93, v36);
  id v16 = v5;

  objc_msgSend(v40, sel_setSystolic_, v16);
  id v17 = [v28 (SEL)0x1F76514DBLL];
  objc_msgSend(v17, (SEL)0x1F7C3BF93, v36);
  uint64_t v18 = v6;

  objc_msgSend(v40, sel_setDiastolic_, v18);
  objc_msgSend(v40, sel_systolic);
  *(void *)(v46 + 808) = v7;
  objc_msgSend(v40, sel_diastolic);
  *(void *)(v46 + 816) = v8;
  max<A>(_:_:)();
  value = *(double *)(v46 + 800);
  id v9 = store;
  v56.value = value;
  v55.is_nil = (char)store;
  v56.is_nil = LOBYTE(value);
  v55.value.super.Class isa = 0;
  id v10 = localizedUnitName(for:value:store:)((HKUnit)v36, v56, v55);

  id v21 = (id)MEMORY[0x2611C8860](v10._countAndFlagsBits, v10._object);
  swift_bridgeObjectRelease();
  objc_msgSend(v40, sel_setUnit_, v21);

  v24(v25, v33, v34);
  Class isa = Date._bridgeToObjectiveC()().super.isa;
  id v35 = *(void (**)(uint64_t, uint64_t))(v22 + 8);
  v35(v25, v34);
  objc_msgSend(v40, sel_setSampleStart_, isa);

  v24(v25, v32, v34);
  uint64_t v26 = Date._bridgeToObjectiveC()().super.isa;
  v35(v25, v34);
  objc_msgSend(v40, sel_setSampleEnd_, v26);

  swift_bridgeObjectRelease();
  v35(v32, v34);
  v35(v33, v34);

  outlined destroy of HealthKitPersistor((id *)(v46 + 616));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  id v11 = *(uint64_t (**)(char *))(*(void *)(v46 + 512) + 8);
  return v11(v40);
}

{
  uint64_t v0;
  id v1;
  id v2;
  void *v3;
  uint64_t (*v4)(char *);
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t);
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, uint64_t);
  id v20;
  id v21;
  id v22;
  id v23;
  char *v24;
  uint64_t v25;
  uint8_t *buf;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  void (*v34)(uint64_t, uint64_t, uint64_t);
  id v35;
  uint32_t size;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  NSObject *v43;
  os_log_type_t v44;
  uint8_t *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t (*v48)(uint64_t, uint64_t, uint64_t);
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;

  char v50 = v0;
  id v35 = *(id *)(v0 + 1624);
  uint64_t v34 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 1432);
  id v30 = *(void *)(v0 + 1312);
  uint64_t v33 = *(void *)(v0 + 1296);
  uint64_t v31 = *(id *)(v0 + 1240);
  *(void *)(v0 + 512) = v0;
  swift_willThrow();

  uint64_t v1 = v35;
  *(void *)(v0 + 768) = v35;
  uint64_t v32 = Logger.wellnessIntents.unsafeMutableAddressor();
  swift_beginAccess();
  v34(v30, v32, v33);
  swift_endAccess();
  uint64_t v2 = v35;
  id v37 = swift_allocObject();
  *(void *)(v37 + 16) = v35;
  uint64_t v43 = Logger.logObject.getter();
  uint64_t v44 = static os_log_type_t.error.getter();
  *(void *)(v0 + 776) = 12;
  UnsignedInteger<>.init<A>(_:)();
  uint32_t size = *(_DWORD *)(v0 + 1668);
  unint64_t v39 = swift_allocObject();
  *(unsigned char *)(v39 + 16) = 32;
  uint64_t v40 = swift_allocObject();
  *(unsigned char *)(v40 + 16) = 8;
  id v38 = swift_allocObject();
  *(void *)(v38 + 16) = partial apply for implicit closure #5 in HealthKitPersistor.save(quantityIdentifier:value:units:);
  *(void *)(v38 + 24) = v37;
  id v41 = swift_allocObject();
  *(void *)(v41 + 16) = partial apply for implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:);
  *(void *)(v41 + 24) = v38;
  _allocateUninitializedArray<A>(_:)();
  uint64_t v42 = v3;
  swift_retain();
  *uint64_t v42 = partial apply for closure #1 in OSLogArguments.append(_:);
  v42[1] = v39;
  swift_retain();
  v42[2] = partial apply for closure #1 in OSLogArguments.append(_:);
  v42[3] = v40;
  swift_retain();
  v42[4] = partial apply for closure #1 in OSLogArguments.append(_:);
  v42[5] = v41;
  _finalizeUninitializedArray<A>(_:)();
  swift_bridgeObjectRelease();
  if (os_log_type_enabled(v43, v44))
  {
    buf = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
    uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    id v27 = createStorage<A>(capacity:type:)(0);
    id v28 = createStorage<A>(capacity:type:)(1);
    uint64_t v45 = buf;
    uint64_t v46 = v27;
    uint64_t v47 = v28;
    serialize(_:at:)(2, &v45);
    serialize(_:at:)(1, &v45);
    uint32_t v48 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
    os_log_type_t v49 = v39;
    closure #1 in osLogInternal(_:log:type:)(&v48, (uint64_t)&v45, (uint64_t)&v46, (uint64_t)&v47);
    uint32_t v48 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
    os_log_type_t v49 = v40;
    closure #1 in osLogInternal(_:log:type:)(&v48, (uint64_t)&v45, (uint64_t)&v46, (uint64_t)&v47);
    uint32_t v48 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
    os_log_type_t v49 = v41;
    closure #1 in osLogInternal(_:log:type:)(&v48, (uint64_t)&v45, (uint64_t)&v46, (uint64_t)&v47);
    _os_log_impl(&dword_25DE00000, v43, v44, "Failed to persist sample. Error: %s", buf, size);
    destroyStorage<A>(_:count:)(v27, 0, v25);
    destroyStorage<A>(_:count:)(v28, 1, MEMORY[0x263F8EE58] + 8);
    MEMORY[0x2611C8D90](buf, MEMORY[0x263F8E778]);
    swift_release();
    swift_release();
    swift_release();
  }
  else
  {
    swift_release();
    swift_release();
    swift_release();
  }
  id v9 = *(id *)(v29 + 1624);
  id v10 = *(id *)(v29 + 1608);
  id v11 = *(id *)(v29 + 1592);
  uint64_t v12 = *(id *)(v29 + 1584);
  uint64_t v13 = *(id *)(v29 + 1576);
  id v14 = *(id *)(v29 + 1568);
  uint64_t v8 = *(void (**)(uint64_t, uint64_t))(v29 + 1480);
  id v6 = *(void *)(v29 + 1312);
  id v7 = *(void *)(v29 + 1296);
  id v17 = *(void *)(v29 + 1288);
  id v16 = *(void *)(v29 + 1280);
  uint64_t v18 = *(void *)(v29 + 1248);
  id v20 = *(id *)(v29 + 1544);
  id v21 = *(id *)(v29 + 1512);
  id v22 = *(id *)(v29 + 1504);
  id v23 = *(id *)(v29 + 1496);
  id v15 = *(void *)(v29 + 1256);

  v8(v6, v7);
  type metadata accessor for LogBloodPressureIntentResponse();
  uint64_t v24 = LogBloodPressureIntentResponse.__allocating_init(code:userActivity:)(5, 0);

  swift_bridgeObjectRelease();
  uint64_t v19 = *(void (**)(uint64_t, uint64_t))(v15 + 8);
  v19(v16, v18);
  v19(v17, v18);

  outlined destroy of HealthKitPersistor((id *)(v29 + 616));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  id v4 = *(uint64_t (**)(char *))(*(void *)(v29 + 512) + 8);
  return v4(v24);
}

uint64_t BloodPressurePersistor.preferredUnit()(uint64_t a1)
{
  v1[35] = a1;
  v1[21] = v1;
  v1[22] = 0;
  v1[24] = 0;
  v1[26] = 0;
  v1[28] = 0;
  uint64_t v2 = type metadata accessor for Logger();
  v1[36] = v2;
  v1[37] = *(void *)(v2 - 8);
  v1[38] = swift_task_alloc();
  v1[39] = swift_task_alloc();
  v1[22] = a1;
  return MEMORY[0x270FA2498](BloodPressurePersistor.preferredUnit(), 0);
}

uint64_t BloodPressurePersistor.preferredUnit()()
{
  uint64_t v1 = *(void *)(v0 + 312);
  uint64_t v26 = *(void *)(v0 + 296);
  uint64_t v28 = *(void *)(v0 + 288);
  *(void *)(v0 + 168) = v0;
  uint64_t v27 = Logger.wellnessIntents.unsafeMutableAddressor();
  swift_beginAccess();
  uint64_t v2 = *(void (**)(uint64_t, uint64_t, uint64_t))(v26 + 16);
  *(void *)(v0 + 320) = v2;
  *(void *)(v0 + 328) = (v26 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  v2(v1, v27, v28);
  swift_endAccess();
  uint64_t v31 = Logger.logObject.getter();
  os_log_type_t v30 = static os_log_type_t.debug.getter();
  *(void *)(v0 + 184) = 2;
  *(void *)(v0 + 336) = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  *(void *)(v0 + 344) = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  *(void *)(v0 + 352) = lazy protocol witness table accessor for type Int and conformance Int();
  UnsignedInteger<>.init<A>(_:)();
  uint64_t v29 = *(unsigned int *)(v0 + 424);
  *(void *)(v0 + 360) = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
  uint64_t v32 = _allocateUninitializedArray<A>(_:)();
  if (os_log_type_enabled(v31, v30))
  {
    buf = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
    uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    uint64_t v22 = createStorage<A>(capacity:type:)(0);
    uint64_t v23 = createStorage<A>(capacity:type:)(0);
    *(void *)(v25 + 248) = buf;
    *(void *)(v25 + 256) = v22;
    *(void *)(v25 + 264) = v23;
    serialize(_:at:)(0, (unsigned char **)(v25 + 248));
    serialize(_:at:)(0, (unsigned char **)(v25 + 248));
    *(void *)(v25 + 272) = v32;
    uint64_t v24 = (void *)swift_task_alloc();
    v24[2] = v25 + 248;
    v24[3] = v25 + 256;
    v24[4] = v25 + 264;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
    lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
    Sequence.forEach(_:)();
    swift_task_dealloc();
    _os_log_impl(&dword_25DE00000, v31, v30, "Looking for preferred units", buf, v29);
    destroyStorage<A>(_:count:)(v22, 0, v20);
    destroyStorage<A>(_:count:)(v23, 0, MEMORY[0x263F8EE58] + 8);
    MEMORY[0x2611C8D90](buf, MEMORY[0x263F8E778]);
  }
  swift_bridgeObjectRelease();
  uint64_t v15 = *(void *)(v25 + 312);
  uint64_t v16 = *(void *)(v25 + 288);
  uint64_t v14 = *(void *)(v25 + 296);

  uint64_t v3 = *(void (**)(uint64_t, uint64_t))(v14 + 8);
  *(void *)(v25 + 368) = v3;
  *(void *)(v25 + 376) = (v14 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v3(v15, v16);
  id v17 = self;
  id v18 = (id)*MEMORY[0x263F09C28];
  id v4 = (id)*MEMORY[0x263F09C28];
  id v5 = objc_msgSend(v17, sel_quantityTypeForIdentifier_, v18);
  *(void *)(v25 + 384) = v5;
  id v19 = v5;

  if (v19)
  {
    id v13 = *(id *)(v25 + 280);
    *(void *)(v25 + 192) = v19;
    id v6 = v13;
    *(void *)(v25 + 392) = type metadata accessor for HKQuantityType();
    _allocateUninitializedArray<A>(_:)();
    id v11 = v7;
    id v8 = v19;
    *id v11 = v19;
    _finalizeUninitializedArray<A>(_:)();
    *(void *)(v25 + 400) = lazy protocol witness table accessor for type HKQuantityType and conformance NSObject();
    Set.init(arrayLiteral:)();
    Class isa = Set._bridgeToObjectiveC()().super.isa;
    *(void *)(v25 + 408) = isa;
    swift_bridgeObjectRelease();
    *(void *)(v25 + 16) = *(void *)(v25 + 168);
    *(void *)(v25 + 56) = v25 + 200;
    *(void *)(v25 + 24) = BloodPressurePersistor.preferredUnit();
    *(void *)(v25 + 112) = swift_continuation_init();
    *(void *)(v25 + 80) = MEMORY[0x263EF8330];
    *(_DWORD *)(v25 + 88) = 0x40000000;
    *(_DWORD *)(v25 + 92) = 0;
    *(void *)(v25 + 96) = @objc completion handler block implementation for @escaping @callee_unowned @convention(block) (@unowned NSDictionary, @unowned NSError?) -> () with result type [HKQuantityType : HKUnit];
    *(void *)(v25 + 104) = &block_descriptor_147;
    objc_msgSend(v13, sel_preferredUnitsForQuantityTypes_completion_, isa);
    return __swift_continuation_await_point();
  }
  else
  {
    swift_task_dealloc();
    swift_task_dealloc();
    id v10 = *(uint64_t (**)(void))(*(void *)(v25 + 168) + 8);
    return v10(0);
  }
}

{
  void *v0;
  uint64_t v1;
  uint64_t (*v2)();
  void *v4;
  uint64_t v5;

  id v4 = (void *)*v0;
  v4[21] = *v0;
  uint64_t v1 = v4[6];
  v4[52] = v1;
  if (v1)
  {
    uint64_t v2 = BloodPressurePersistor.preferredUnit();
  }
  else
  {
    uint64_t v2 = BloodPressurePersistor.preferredUnit();
  }
  return MEMORY[0x270FA2498](v2, 0);
}

{
  uint64_t v0;
  void *v1;
  id v2;
  unint64_t v3;
  uint64_t (*v4)(uint64_t);
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;

  id v6 = *(id *)(v0 + 408);
  id v8 = *(void *)(v0 + 400);
  id v7 = *(void *)(v0 + 392);
  id v10 = *(id *)(v0 + 384);
  uint64_t v1 = *(void **)(v0 + 280);
  *(void *)(v0 + 168) = v0;
  id v9 = *(void *)(v0 + 200);
  *(void *)(v0 + 224) = v9;

  uint64_t v2 = v10;
  *(void *)(v0 + 240) = v10;
  uint64_t v3 = type metadata accessor for HKUnit();
  MEMORY[0x2611C8800](v0 + 240, v9, v7, v3, v8);

  id v11 = *(void *)(v0 + 232);
  swift_bridgeObjectRelease();

  swift_task_dealloc();
  swift_task_dealloc();
  id v4 = *(uint64_t (**)(uint64_t))(*(void *)(v0 + 168) + 8);
  return v4(v11);
}

{
  uint64_t v0;
  id v1;
  id v2;
  void *v3;
  uint64_t (*v4)(void);
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t);
  id v9;
  id v10;
  uint64_t v11;
  uint8_t *buf;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, uint64_t, uint64_t);
  id v22;
  uint32_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  NSObject *v30;
  os_log_type_t v31;
  uint8_t *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t, uint64_t);
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;

  id v37 = v0;
  uint64_t v22 = *(id *)(v0 + 416);
  id v18 = *(id *)(v0 + 408);
  id v21 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 320);
  uint64_t v16 = *(void *)(v0 + 304);
  uint64_t v20 = *(void *)(v0 + 288);
  id v17 = *(id *)(v0 + 280);
  *(void *)(v0 + 168) = v0;
  swift_willThrow();

  uint64_t v1 = v22;
  *(void *)(v0 + 208) = v22;
  id v19 = Logger.wellnessIntents.unsafeMutableAddressor();
  swift_beginAccess();
  v21(v16, v19, v20);
  swift_endAccess();
  uint64_t v2 = v22;
  uint64_t v24 = swift_allocObject();
  *(void *)(v24 + 16) = v22;
  os_log_type_t v30 = Logger.logObject.getter();
  uint64_t v31 = static os_log_type_t.error.getter();
  *(void *)(v0 + 216) = 12;
  UnsignedInteger<>.init<A>(_:)();
  uint64_t v23 = *(_DWORD *)(v0 + 428);
  uint64_t v26 = swift_allocObject();
  *(unsigned char *)(v26 + 16) = 32;
  uint64_t v27 = swift_allocObject();
  *(unsigned char *)(v27 + 16) = 8;
  uint64_t v25 = swift_allocObject();
  *(void *)(v25 + 16) = partial apply for implicit closure #5 in HealthKitPersistor.save(quantityIdentifier:value:units:);
  *(void *)(v25 + 24) = v24;
  uint64_t v28 = swift_allocObject();
  *(void *)(v28 + 16) = partial apply for implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:);
  *(void *)(v28 + 24) = v25;
  _allocateUninitializedArray<A>(_:)();
  uint64_t v29 = v3;
  swift_retain();
  uint8_t *v29 = partial apply for closure #1 in OSLogArguments.append(_:);
  v29[1] = v26;
  swift_retain();
  v29[2] = partial apply for closure #1 in OSLogArguments.append(_:);
  v29[3] = v27;
  swift_retain();
  v29[4] = partial apply for closure #1 in OSLogArguments.append(_:);
  v29[5] = v28;
  _finalizeUninitializedArray<A>(_:)();
  swift_bridgeObjectRelease();
  if (os_log_type_enabled(v30, v31))
  {
    buf = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
    id v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    id v13 = createStorage<A>(capacity:type:)(0);
    uint64_t v14 = createStorage<A>(capacity:type:)(1);
    uint64_t v32 = buf;
    uint64_t v33 = v13;
    uint64_t v34 = v14;
    serialize(_:at:)(2, &v32);
    serialize(_:at:)(1, &v32);
    id v35 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
    id v36 = v26;
    closure #1 in osLogInternal(_:log:type:)(&v35, (uint64_t)&v32, (uint64_t)&v33, (uint64_t)&v34);
    id v35 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
    id v36 = v27;
    closure #1 in osLogInternal(_:log:type:)(&v35, (uint64_t)&v32, (uint64_t)&v33, (uint64_t)&v34);
    id v35 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
    id v36 = v28;
    closure #1 in osLogInternal(_:log:type:)(&v35, (uint64_t)&v32, (uint64_t)&v33, (uint64_t)&v34);
    _os_log_impl(&dword_25DE00000, v30, v31, "Error fetching preferred units: %s", buf, v23);
    destroyStorage<A>(_:count:)(v13, 0, v11);
    destroyStorage<A>(_:count:)(v14, 1, MEMORY[0x263F8EE58] + 8);
    MEMORY[0x2611C8D90](buf, MEMORY[0x263F8E778]);
    swift_release();
    swift_release();
    swift_release();
  }
  else
  {
    swift_release();
    swift_release();
    swift_release();
  }
  id v9 = (id)v15[52];
  id v8 = (void (*)(uint64_t, uint64_t))v15[46];
  id v6 = v15[38];
  id v7 = v15[36];
  id v10 = (id)v15[48];

  v8(v6, v7);
  swift_task_dealloc();
  swift_task_dealloc();
  id v4 = *(uint64_t (**)(void))(v15[21] + 8);
  return v4(0);
}

id @nonobjc HKCorrelation.__allocating_init(type:start:end:objects:)(void *a1, uint64_t a2, uint64_t a3)
{
  Class isa = Date._bridgeToObjectiveC()().super.isa;
  Class v5 = Date._bridgeToObjectiveC()().super.isa;
  type metadata accessor for HKSample();
  lazy protocol witness table accessor for type HKSample and conformance NSObject();
  Class v4 = Set._bridgeToObjectiveC()().super.isa;
  id v12 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_correlationWithType_startDate_endDate_objects_, a1, isa, v5, v4);

  swift_bridgeObjectRelease();
  uint64_t v9 = type metadata accessor for Date();
  id v10 = *(void (**)(uint64_t))(*(void *)(v9 - 8) + 8);
  v10(a3);

  ((void (*)(uint64_t, uint64_t))v10)(a2, v9);
  return v12;
}

uint64_t protocol witness for BloodPressurePersisting.isLoggingAuthorized() in conformance BloodPressurePersistor()
{
  uint64_t v4 = v1;
  *(void *)(v1 + 16) = v1;
  Class v5 = *v0;
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v4 + 24) = v2;
  *uint64_t v2 = *(void *)(v4 + 16);
  v2[1] = protocol witness for QuantityPersisting.isLoggingAuthorized(for:) in conformance HealthKitPersistor;
  return BloodPressurePersistor.isLoggingAuthorized()(v5);
}

uint64_t protocol witness for BloodPressurePersisting.save(systolic:diastolic:units:) in conformance BloodPressurePersistor(uint64_t a1, uint64_t a2, double a3, double a4)
{
  uint64_t v8 = v5;
  *(void *)(v5 + 16) = v5;
  uint64_t v12 = *v4;
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v8 + 24) = v6;
  void *v6 = *(void *)(v8 + 16);
  v6[1] = protocol witness for QuantityPersisting.save(quantityIdentifier:value:units:) in conformance HealthKitPersistor;
  return BloodPressurePersistor.save(systolic:diastolic:units:)(a1, a2, v12, a3, a4);
}

uint64_t sub_25DF3127C()
{
  return swift_deallocObject();
}

id partial apply for implicit closure #1 in LogBloodPressureIntentHandler.handle(intent:)()
{
  return implicit closure #1 in LogBloodPressureIntentHandler.handle(intent:)(*(void **)(v0 + 16));
}

uint64_t sub_25DF312C4()
{
  return swift_deallocObject();
}

id partial apply for implicit closure #2 in LogBloodPressureIntentHandler.handle(intent:)()
{
  return implicit closure #2 in LogBloodPressureIntentHandler.handle(intent:)(*(void **)(v0 + 16));
}

uint64_t sub_25DF3130C()
{
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #3 in LogBloodPressureIntentHandler.handle(intent:)()
{
  return implicit closure #3 in LogBloodPressureIntentHandler.handle(intent:)(*(void **)(v0 + 16));
}

uint64_t sub_25DF31354()
{
  return swift_deallocObject();
}

uint64_t sub_25DF31380()
{
  return swift_deallocObject();
}

uint64_t sub_25DF313AC()
{
  return swift_deallocObject();
}

uint64_t sub_25DF313EC()
{
  return swift_deallocObject();
}

uint64_t sub_25DF3142C()
{
  return swift_deallocObject();
}

uint64_t sub_25DF31458()
{
  return swift_deallocObject();
}

uint64_t sub_25DF31484()
{
  return swift_deallocObject();
}

uint64_t sub_25DF314C4()
{
  return swift_deallocObject();
}

uint64_t sub_25DF31504()
{
  return swift_deallocObject();
}

uint64_t sub_25DF31530()
{
  return swift_deallocObject();
}

uint64_t sub_25DF3155C()
{
  return swift_deallocObject();
}

uint64_t sub_25DF3159C()
{
  return swift_deallocObject();
}

uint64_t sub_25DF315DC()
{
  _Block_release(*(const void **)(v0 + 24));
  return swift_deallocObject();
}

uint64_t partial apply for @objc closure #1 in LogBloodPressureIntentHandler.handle(intent:)()
{
  uint64_t v5 = v1;
  *(void *)(v1 + 16) = v1;
  uint64_t v8 = (void *)v0[2];
  uint64_t v6 = (const void *)v0[3];
  id v7 = (void *)v0[4];
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v5 + 24) = v2;
  *uint64_t v2 = *(void *)(v5 + 16);
  v2[1] = _sIeghH_IeAgH_TRTQ0_;
  uint64_t v3 = async function pointer to @objc closure #1 in LogBloodPressureIntentHandler.handle(intent:);
  return ((uint64_t (*)(void *, const void *, void *))((char *)&async function pointer to @objc closure #1 in LogBloodPressureIntentHandler.handle(intent:)
                                                               + v3))(v8, v6, v7);
}

uint64_t sub_25DF31718()
{
  return swift_deallocObject();
}

uint64_t sub_25DF31758()
{
  return swift_deallocObject();
}

uint64_t sub_25DF31784()
{
  return swift_deallocObject();
}

uint64_t sub_25DF317B0()
{
  return swift_deallocObject();
}

uint64_t sub_25DF317F0()
{
  return swift_deallocObject();
}

uint64_t sub_25DF31830()
{
  return swift_deallocObject();
}

uint64_t sub_25DF31870()
{
  return swift_deallocObject();
}

uint64_t sub_25DF318B0()
{
  return swift_deallocObject();
}

uint64_t sub_25DF318F0()
{
  return swift_deallocObject();
}

uint64_t sub_25DF3191C()
{
  return swift_deallocObject();
}

uint64_t sub_25DF31948()
{
  return swift_deallocObject();
}

uint64_t sub_25DF31988()
{
  return swift_deallocObject();
}

uint64_t sub_25DF319C8()
{
  return swift_deallocObject();
}

uint64_t sub_25DF319F4()
{
  return swift_deallocObject();
}

uint64_t sub_25DF31A20()
{
  return swift_deallocObject();
}

uint64_t sub_25DF31A60()
{
  return swift_deallocObject();
}

uint64_t sub_25DF31AA0()
{
  return swift_deallocObject();
}

uint64_t sub_25DF31ACC()
{
  return swift_deallocObject();
}

uint64_t sub_25DF31AF8()
{
  return swift_deallocObject();
}

uint64_t sub_25DF31B38()
{
  return swift_deallocObject();
}

uint64_t sub_25DF31B78()
{
  return swift_deallocObject();
}

uint64_t sub_25DF31BB8()
{
  return swift_deallocObject();
}

uint64_t sub_25DF31BE4()
{
  return swift_deallocObject();
}

uint64_t sub_25DF31C10()
{
  return swift_deallocObject();
}

uint64_t sub_25DF31C50()
{
  return swift_deallocObject();
}

uint64_t type metadata accessor for LogBloodPressureIntentHandler()
{
  return self;
}

ValueMetadata *type metadata accessor for BloodPressurePersistor()
{
  return &type metadata for BloodPressurePersistor;
}

char *GetAmbiguousDistanceIntentResponse.__allocating_init(code:userActivity:)(uint64_t a1, void *a2)
{
  id v3 = objc_allocWithZone(v2);
  return GetAmbiguousDistanceIntentResponse.init(code:userActivity:)(a1, a2);
}

id GetAmbiguousDistanceIntent.__allocating_init()()
{
  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id GetAmbiguousDistanceIntent.init()()
{
  id v4 = 0;
  v3.receiver = 0;
  v3.super_class = (Class)type metadata accessor for GetAmbiguousDistanceIntent();
  id v2 = objc_msgSendSuper2(&v3, sel_init);
  id v0 = v2;
  id v4 = v2;

  return v2;
}

id GetAmbiguousDistanceIntent.__allocating_init(coder:)(void *a1)
{
  id v4 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v4;
}

id GetAmbiguousDistanceIntent.init(coder:)(void *a1)
{
  id v8 = 0;
  id v7 = a1;
  v6.receiver = 0;
  v6.super_class = (Class)type metadata accessor for GetAmbiguousDistanceIntent();
  id v5 = objc_msgSendSuper2(&v6, sel_initWithCoder_, a1);
  if (v5)
  {
    id v1 = v5;
    id v8 = v5;

    return v5;
  }
  else
  {

    return 0;
  }
}

id GetAmbiguousDistanceIntent.__allocating_init(identifier:backingStore:)(uint64_t a1, uint64_t a2, void *a3)
{
  id v11 = objc_allocWithZone(v3);
  if (a2)
  {
    uint64_t v6 = MEMORY[0x2611C8860](a1);
    swift_bridgeObjectRelease();
    id v7 = (void *)v6;
  }
  else
  {
    id v7 = 0;
  }
  id v5 = objc_msgSend(v11, sel_initWithIdentifier_backingStore_);

  return v5;
}

id GetAmbiguousDistanceIntent.init(identifier:backingStore:)(uint64_t a1, uint64_t a2, void *a3)
{
  id v15 = 0;
  uint64_t v13 = a1;
  uint64_t v14 = a2;
  uint64_t v12 = a3;
  swift_bridgeObjectRetain();
  if (a2)
  {
    uint64_t v6 = MEMORY[0x2611C8860](a1);
    swift_bridgeObjectRelease();
    id v7 = (void *)v6;
  }
  else
  {
    id v7 = 0;
  }
  v11.receiver = 0;
  v11.super_class = (Class)type metadata accessor for GetAmbiguousDistanceIntent();
  id v5 = objc_msgSendSuper2(&v11, sel_initWithIdentifier_backingStore_, v7, a3);

  id v3 = v5;
  id v15 = v5;

  swift_bridgeObjectRelease();
  return v5;
}

id GetAmbiguousDistanceIntent.__allocating_init(domain:verb:parametersByName:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v13 = objc_allocWithZone(v5);
  uint64_t v16 = (void *)MEMORY[0x2611C8860](a1, a2);
  id v18 = (void *)MEMORY[0x2611C8860](a3, a4);
  if (a5)
  {
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    id v6 = objc_msgSend(v13, sel_initWithDomain_verb_parametersByName_, v16, v18, isa);
  }
  else
  {
    id v6 = objc_msgSend(v13, sel_initWithDomain_verb_parametersByName_, v16, v18, 0);
  }
  id v9 = v6;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v9;
}

id GetAmbiguousDistanceIntent.init(domain:verb:parametersByName:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v23 = 0;
  uint64_t v21 = a1;
  uint64_t v22 = a2;
  uint64_t v19 = a3;
  uint64_t v20 = a4;
  uint64_t v18 = a5;
  swift_bridgeObjectRetain();
  id v12 = (id)MEMORY[0x2611C8860](a1, a2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  id v15 = (void *)MEMORY[0x2611C8860](a3, a4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  if (a5)
  {
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    Class v9 = isa;
  }
  else
  {
    Class v9 = 0;
  }
  v17.receiver = 0;
  v17.super_class = (Class)type metadata accessor for GetAmbiguousDistanceIntent();
  id v7 = objc_msgSendSuper2(&v17, sel_initWithDomain_verb_parametersByName_, v12, v15, v9);

  id v5 = v7;
  id v23 = v7;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return v7;
}

id GetAmbiguousDistanceIntent.__deallocating_deinit()
{
  id v3 = v0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for GetAmbiguousDistanceIntent();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t GetAmbiguousDistanceIntentResponseCode.init(rawValue:)(uint64_t a1)
{
  switch(a1)
  {
    case 0:
      return 0;
    case 1:
      return 1;
    case 2:
      return 2;
    case 3:
      return 3;
    case 4:
      return 4;
    case 5:
      return 5;
    case 6:
      return 6;
    case 100:
      return 100;
    case 101:
      return 101;
    case 102:
      return 102;
  }
  return 0;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance GetAmbiguousDistanceIntentResponseCode()
{
  return == infix<A>(_:_:)() & 1;
}

uint64_t protocol witness for Hashable.hashValue.getter in conformance GetAmbiguousDistanceIntentResponseCode()
{
  return RawRepresentable<>.hashValue.getter();
}

uint64_t protocol witness for Hashable.hash(into:) in conformance GetAmbiguousDistanceIntentResponseCode()
{
  return RawRepresentable<>.hash(into:)();
}

uint64_t protocol witness for Hashable._rawHashValue(seed:) in conformance GetAmbiguousDistanceIntentResponseCode()
{
  return RawRepresentable<>._rawHashValue(seed:)();
}

uint64_t protocol witness for RawRepresentable.init(rawValue:) in conformance GetAmbiguousDistanceIntentResponseCode@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = GetAmbiguousDistanceIntentResponseCode.init(rawValue:)(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v3 & 1;
  return result;
}

void protocol witness for RawRepresentable.rawValue.getter in conformance GetAmbiguousDistanceIntentResponseCode(void *a1@<X8>)
{
  GetAmbiguousDistanceIntentResponseCode.rawValue.getter();
  *a1 = v1;
}

uint64_t GetAmbiguousDistanceIntentResponse.code.getter()
{
  objc_super v2 = (uint64_t *)(v0 + OBJC_IVAR___GetAmbiguousDistanceIntentResponse_code);
  swift_beginAccess();
  uint64_t v3 = *v2;
  swift_endAccess();
  return v3;
}

uint64_t GetAmbiguousDistanceIntentResponse.code.setter(uint64_t a1)
{
  uint64_t v3 = (void *)(v1 + OBJC_IVAR___GetAmbiguousDistanceIntentResponse_code);
  swift_beginAccess();
  *uint64_t v3 = a1;
  return swift_endAccess();
}

uint64_t (*GetAmbiguousDistanceIntentResponse.code.modify())()
{
  return LogQuantityIntentResponse.code.modify;
}

void key path getter for GetAmbiguousDistanceIntentResponse.code : GetAmbiguousDistanceIntentResponse(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v3 = *a1;
  id v2 = *a1;
  *a2 = GetAmbiguousDistanceIntentResponse.code.getter();
}

void key path setter for GetAmbiguousDistanceIntentResponse.code : GetAmbiguousDistanceIntentResponse(uint64_t *a1, id *a2)
{
  uint64_t v4 = *a1;
  id v3 = *a2;
  id v2 = *a2;
  GetAmbiguousDistanceIntentResponse.code.setter(v4);
}

char *GetAmbiguousDistanceIntentResponse.init(code:userActivity:)(uint64_t a1, void *a2)
{
  Class v9 = (char *)objc_msgSend(v10, sel_init);
  id v2 = v9;
  id v3 = v9;
  uint64_t v4 = v9;
  id v6 = &v9[OBJC_IVAR___GetAmbiguousDistanceIntentResponse_code];
  swift_beginAccess();
  *(void *)id v6 = a1;
  swift_endAccess();

  objc_msgSend(v9, sel_setUserActivity_, a2);
  return v9;
}

uint64_t type metadata accessor for GetAmbiguousDistanceIntent()
{
  return self;
}

id GetAmbiguousDistanceIntentResponse.__allocating_init()()
{
  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id GetAmbiguousDistanceIntentResponse.init()()
{
  uint64_t v1 = v0;
  id v6 = v0;
  *(void *)&v0[OBJC_IVAR___GetAmbiguousDistanceIntentResponse_code] = 0;

  v5.receiver = v6;
  v5.super_class = (Class)type metadata accessor for GetAmbiguousDistanceIntentResponse();
  id v4 = objc_msgSendSuper2(&v5, sel_init);
  id v2 = v4;
  id v6 = v4;

  return v4;
}

uint64_t type metadata accessor for GetAmbiguousDistanceIntentResponse()
{
  return self;
}

id GetAmbiguousDistanceIntentResponse.__allocating_init(coder:)(void *a1)
{
  id v4 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v4;
}

id GetAmbiguousDistanceIntentResponse.init(coder:)(void *a1)
{
  Class v9 = a1;
  id v2 = v1;
  id v10 = v1;
  *(void *)&v1[OBJC_IVAR___GetAmbiguousDistanceIntentResponse_code] = 0;

  v8.receiver = v10;
  v8.super_class = (Class)type metadata accessor for GetAmbiguousDistanceIntentResponse();
  id v7 = objc_msgSendSuper2(&v8, sel_initWithCoder_, a1);
  if (v7)
  {
    id v3 = v7;
    id v10 = v7;

    return v7;
  }
  else
  {

    return 0;
  }
}

id GetAmbiguousDistanceIntentResponse.__allocating_init(backingStore:)(void *a1)
{
  id v4 = objc_msgSend(objc_allocWithZone(v1), sel_initWithBackingStore_, a1);

  return v4;
}

id GetAmbiguousDistanceIntentResponse.init(backingStore:)(void *a1)
{
  Class v9 = a1;
  id v2 = v1;
  id v10 = v1;
  *(void *)&v1[OBJC_IVAR___GetAmbiguousDistanceIntentResponse_code] = 0;

  v8.receiver = v10;
  v8.super_class = (Class)type metadata accessor for GetAmbiguousDistanceIntentResponse();
  id v7 = objc_msgSendSuper2(&v8, sel_initWithBackingStore_, a1);
  if (v7)
  {
    id v3 = v7;
    id v10 = v7;

    return v7;
  }
  else
  {

    return 0;
  }
}

id GetAmbiguousDistanceIntentResponse.__allocating_init(propertiesByName:)(uint64_t a1)
{
  id v8 = objc_allocWithZone(v1);
  if (a1)
  {
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    id v2 = objc_msgSend(v8, sel_initWithPropertiesByName_, isa);
  }
  else
  {
    id v2 = objc_msgSend(v8, sel_initWithPropertiesByName_, 0);
  }
  id v5 = v2;

  return v5;
}

id GetAmbiguousDistanceIntentResponse.init(propertiesByName:)(uint64_t a1)
{
  uint64_t v11 = a1;
  id v2 = v1;
  id v12 = v1;
  *(void *)&v1[OBJC_IVAR___GetAmbiguousDistanceIntentResponse_code] = 0;

  swift_bridgeObjectRetain();
  if (a1)
  {
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    Class v8 = isa;
  }
  else
  {
    Class v8 = 0;
  }
  v10.receiver = v12;
  v10.super_class = (Class)type metadata accessor for GetAmbiguousDistanceIntentResponse();
  id v6 = objc_msgSendSuper2(&v10, sel_initWithPropertiesByName_, v8);

  if (v6)
  {
    id v3 = v6;
    id v12 = v6;
    swift_bridgeObjectRelease();

    return v6;
  }
  else
  {

    swift_bridgeObjectRelease();
    return 0;
  }
}

id GetAmbiguousDistanceIntentResponse.__deallocating_deinit()
{
  id v3 = v0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for GetAmbiguousDistanceIntentResponse();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t base witness table accessor for Equatable in GetAmbiguousDistanceIntentResponseCode()
{
  return lazy protocol witness table accessor for type GetAmbiguousDistanceIntentResponseCode and conformance GetAmbiguousDistanceIntentResponseCode();
}

unint64_t lazy protocol witness table accessor for type GetAmbiguousDistanceIntentResponseCode and conformance GetAmbiguousDistanceIntentResponseCode()
{
  uint64_t v2 = lazy protocol witness table cache variable for type GetAmbiguousDistanceIntentResponseCode and conformance GetAmbiguousDistanceIntentResponseCode;
  if (!lazy protocol witness table cache variable for type GetAmbiguousDistanceIntentResponseCode and conformance GetAmbiguousDistanceIntentResponseCode)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type GetAmbiguousDistanceIntentResponseCode and conformance GetAmbiguousDistanceIntentResponseCode);
    return WitnessTable;
  }
  return v2;
}

{
  unint64_t WitnessTable;
  uint64_t v2;

  uint64_t v2 = lazy protocol witness table cache variable for type GetAmbiguousDistanceIntentResponseCode and conformance GetAmbiguousDistanceIntentResponseCode;
  if (!lazy protocol witness table cache variable for type GetAmbiguousDistanceIntentResponseCode and conformance GetAmbiguousDistanceIntentResponseCode)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type GetAmbiguousDistanceIntentResponseCode and conformance GetAmbiguousDistanceIntentResponseCode);
    return WitnessTable;
  }
  return v2;
}

void sub_25DF33570(id *a1@<X0>, uint64_t *a2@<X8>)
{
}

void sub_25DF33588(uint64_t *a1, id *a2)
{
}

ValueMetadata *type metadata accessor for GetAmbiguousDistanceIntentResponseCode()
{
  return &type metadata for GetAmbiguousDistanceIntentResponseCode;
}

Swift::String_optional __swiftcall HKMedicationLoggingUnit.getDisplayUnit(for:)(Swift::Double a1)
{
  abs<A>(_:)();
  if (v5 >= 0.01) {
    uint64_t v4 = HKMedicationLoggingUnit.pluralLoggingUnit.getter();
  }
  else {
    uint64_t v4 = HKMedicationLoggingUnit.singularLoggingUnit.getter();
  }
  uint64_t v2 = v4;
  result.value._object = v1;
  result.value._uint64_t countAndFlagsBits = v2;
  return result;
}

uint64_t HKMedicationLoggingUnit.singularLoggingUnit.getter()
{
  uint64_t v12 = _allocateUninitializedArray<A>(_:)();
  uint64_t v11 = v0;
  Swift::String *v0 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("unknown", 7uLL, 1);
  v11[1] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("capsule", 7uLL, 1);
  v11[2] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("application", 0xBuLL, 1);
  v11[3] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("device", 6uLL, 1);
  v11[4] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("drop", 4uLL, 1);
  void v11[5] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("inhalation", 0xAuLL, 1);
  v11[6] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("injection", 9uLL, 1);
  v11[7] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("milliliter", 0xAuLL, 1);
  v11[8] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("patch", 5uLL, 1);
  v11[9] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("scoop", 5uLL, 1);
  v11[10] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("spray", 5uLL, 1);
  v11[11] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("stick", 5uLL, 1);
  v11[12] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("unit", 4uLL, 1);
  v11[13] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("tablet", 6uLL, 1);
  v11[14] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("bar", 3uLL, 1);
  v11[15] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("cartridge", 9uLL, 1);
  v11[16] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("chewable", 8uLL, 1);
  v11[17] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("disc", 4uLL, 1);
  v11[18] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("enema", 5uLL, 1);
  v11[19] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("globule", 7uLL, 1);
  v11[20] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("implant", 7uLL, 1);
  v11[21] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("insert", 6uLL, 1);
  v11[22] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("kit", 3uLL, 1);
  v11[23] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("lozenge", 7uLL, 1);
  v11[24] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("milligram", 9uLL, 1);
  v11[25] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("packet", 6uLL, 1);
  v11[26] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("piece", 5uLL, 1);
  v11[27] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("popsicle", 8uLL, 1);
  v11[28] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("sponge", 6uLL, 1);
  v11[29] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("strip", 5uLL, 1);
  v11[30] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("suppository", 0xBuLL, 1);
  v11[31] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("tampon", 6uLL, 1);
  v11[32] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("treatment", 9uLL, 1);
  v11[33] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("vial", 4uLL, 1);
  v11[34] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("wick", 4uLL, 1);
  _finalizeUninitializedArray<A>(_:)();
  if (objc_msgSend(v13, sel_loggingUnitCode))
  {
    objc_msgSend(v13, sel_loggingUnitCode);
    HKMedicationDoseEventStatus.rawValue.getter();
    unint64_t v5 = v1;
    uint64_t v6 = MEMORY[0x2611C8A40](v12);
    if (v6 > 0 && v5 < v6)
    {
      objc_msgSend(v13, sel_loggingUnitCode);
      HKMedicationDoseEventStatus.rawValue.getter();
      lazy protocol witness table accessor for type Int and conformance Int();
      lazy protocol witness table accessor for type Int and conformance Int();
      lazy protocol witness table accessor for type UInt and conformance UInt();
      SignedInteger<>.init<A>(_:)();
      uint64_t v3 = MEMORY[0x2611C8AC0](v14, v12);
    }
    else
    {
      uint64_t v3 = 0;
    }
    swift_bridgeObjectRelease();
    return v3;
  }
  else
  {
    id v10 = objc_msgSend(v13, sel_fallbackLoggingUnitSingularString);
    if (v10)
    {
      uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();

      uint64_t v9 = v8;
    }
    else
    {
      uint64_t v9 = 0;
    }
    swift_bridgeObjectRelease();
    return v9;
  }
}

uint64_t HKMedicationLoggingUnit.pluralLoggingUnit.getter()
{
  uint64_t v12 = _allocateUninitializedArray<A>(_:)();
  uint64_t v11 = v0;
  Swift::String *v0 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("unknown", 7uLL, 1);
  v11[1] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("capsules", 8uLL, 1);
  v11[2] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("applications", 0xCuLL, 1);
  v11[3] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("devices", 7uLL, 1);
  v11[4] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("drops", 5uLL, 1);
  void v11[5] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("inhalations", 0xBuLL, 1);
  v11[6] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("injections", 0xAuLL, 1);
  v11[7] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("milliliters", 0xBuLL, 1);
  v11[8] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("patches", 7uLL, 1);
  v11[9] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("scoops", 6uLL, 1);
  v11[10] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("sprays", 6uLL, 1);
  v11[11] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("sticks", 6uLL, 1);
  v11[12] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("units", 5uLL, 1);
  v11[13] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("tablets", 7uLL, 1);
  v11[14] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("bars", 4uLL, 1);
  v11[15] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("cartridges", 0xAuLL, 1);
  v11[16] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("chewables", 9uLL, 1);
  v11[17] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("discs", 5uLL, 1);
  v11[18] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("enemas", 6uLL, 1);
  v11[19] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("globules", 8uLL, 1);
  v11[20] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("implants", 8uLL, 1);
  v11[21] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("inserts", 7uLL, 1);
  v11[22] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("kits", 4uLL, 1);
  v11[23] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("lozenges", 8uLL, 1);
  v11[24] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("milligrams", 0xAuLL, 1);
  v11[25] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("packets", 7uLL, 1);
  v11[26] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("pieces", 6uLL, 1);
  v11[27] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("popsicles", 9uLL, 1);
  v11[28] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("sponges", 7uLL, 1);
  v11[29] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("strips", 6uLL, 1);
  v11[30] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("suppositories", 0xDuLL, 1);
  v11[31] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("tampons", 7uLL, 1);
  v11[32] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("treatments", 0xAuLL, 1);
  v11[33] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("vials", 5uLL, 1);
  v11[34] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("wicks", 5uLL, 1);
  _finalizeUninitializedArray<A>(_:)();
  if (objc_msgSend(v13, sel_loggingUnitCode))
  {
    objc_msgSend(v13, sel_loggingUnitCode);
    HKMedicationDoseEventStatus.rawValue.getter();
    unint64_t v5 = v1;
    uint64_t v6 = MEMORY[0x2611C8A40](v12);
    if (v6 > 0 && v5 < v6)
    {
      objc_msgSend(v13, sel_loggingUnitCode);
      HKMedicationDoseEventStatus.rawValue.getter();
      lazy protocol witness table accessor for type Int and conformance Int();
      lazy protocol witness table accessor for type Int and conformance Int();
      lazy protocol witness table accessor for type UInt and conformance UInt();
      SignedInteger<>.init<A>(_:)();
      uint64_t v3 = MEMORY[0x2611C8AC0](v14, v12);
    }
    else
    {
      uint64_t v3 = 0;
    }
    swift_bridgeObjectRelease();
    return v3;
  }
  else
  {
    id v10 = objc_msgSend(v13, sel_fallbackLoggingUnitPluralString);
    if (v10)
    {
      uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();

      uint64_t v9 = v8;
    }
    else
    {
      uint64_t v9 = 0;
    }
    swift_bridgeObjectRelease();
    return v9;
  }
}

uint64_t dateInterval(startTime:endTime:)@<X0>(uint64_t a1@<X0>, const void *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v83 = a3;
  uint64_t v114 = a1;
  uint64_t v113 = a2;
  uint64_t v107 = 0;
  uint64_t v84 = partial apply for closure #1 in osLogInternal(_:log:type:);
  uint64_t v144 = 0;
  uint64_t v143 = 0;
  os_log_type_t v142 = 0;
  uint32_t v141 = 0;
  os_log_type_t v140 = 0;
  uint64_t v139 = 0;
  uint64_t v85 = 0;
  uint64_t v86 = type metadata accessor for Logger();
  uint64_t v87 = *(void *)(v86 - 8);
  uint64_t v88 = v86 - 8;
  unint64_t v89 = (*(void *)(v87 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](0);
  uint32_t v90 = (char *)v47 - v89;
  uint64_t v91 = type metadata accessor for Calendar();
  uint64_t v92 = *(void *)(v91 - 8);
  uint64_t v93 = v91 - 8;
  unint64_t v94 = (*(void *)(v92 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v91);
  uint64_t v95 = (char *)v47 - v94;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TimeZone?);
  unint64_t v96 = (*(void *)(*(void *)(v3 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v3);
  uint64_t v97 = (char *)v47 - v96;
  unint64_t v98 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Calendar?)
                               - 8)
                   + 64)
       + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v107);
  uint64_t v99 = (char *)v47 - v98;
  uint64_t v100 = type metadata accessor for DateComponents();
  uint64_t v101 = *(void *)(v100 - 8);
  uint64_t v102 = v100 - 8;
  unint64_t v103 = (*(void *)(v101 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v100);
  id v104 = (char *)v47 - v103;
  unint64_t v105 = (v4 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388]((char *)v47 - v103);
  uint64_t v106 = (char *)v47 - v105;
  uint64_t v144 = (char *)v47 - v105;
  unint64_t v108 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?)
                                - 8)
                    + 64)
        + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v5 = MEMORY[0x270FA5388](v107);
  uint64_t v109 = (uint64_t)v47 - v108;
  unint64_t v110 = (v6 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v111 = (char *)v47 - v110;
  unint64_t v112 = (v8 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v7);
  uint64_t v129 = (uint64_t)v47 - v112;
  uint64_t v128 = type metadata accessor for Date();
  uint64_t v126 = *(void *)(v128 - 8);
  uint64_t v127 = v128 - 8;
  uint64_t v122 = *(void *)(v126 + 64);
  unint64_t v115 = (v122 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v9 = MEMORY[0x270FA5388](v114);
  os_log_type_t v116 = (char *)v47 - v115;
  unint64_t v117 = (v122 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v10 = MEMORY[0x270FA5388](v9);
  uint64_t v118 = (char *)v47 - v117;
  unint64_t v119 = (v122 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v11 = MEMORY[0x270FA5388](v10);
  uint64_t v120 = (char *)v47 - v119;
  uint64_t v143 = (char *)v47 - v119;
  unint64_t v121 = (v122 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v12 = MEMORY[0x270FA5388](v11);
  uint64_t v123 = (char *)v47 - v121;
  os_log_type_t v142 = (char *)v47 - v121;
  unint64_t v124 = (v122 + 15) & 0xFFFFFFFFFFFFFFF0;
  id v13 = (const void *)MEMORY[0x270FA5388](v12);
  uint64_t v125 = (char *)v47 - v124;
  uint32_t v141 = (char *)v47 - v124;
  os_log_type_t v140 = v13;
  uint64_t v139 = v14;
  outlined init with copy of Date?(v13, v15);
  uint64_t v130 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v126 + 48);
  uint64_t v131 = v126 + 48;
  if (v130(v129, 1, v128) == 1)
  {
    outlined destroy of Date?(v129);
LABEL_13:
    uint64_t v24 = type metadata accessor for DateInterval();
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v24 - 8) + 56))(v83, 1);
  }
  uint64_t v81 = *(void (**)(char *, uint64_t, uint64_t))(v126 + 32);
  uint64_t v82 = v126 + 32;
  v81(v125, v129, v128);
  outlined init with copy of Date?(v113, v111);
  if (v130((uint64_t)v111, 1, v128) == 1)
  {
    outlined destroy of Date?((uint64_t)v111);
    (*(void (**)(char *, uint64_t))(v126 + 8))(v125, v128);
    goto LABEL_13;
  }
  v81(v123, (uint64_t)v111, v128);
  uint64_t v16 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v92 + 56);
  unsigned int v80 = 1;
  v16(v99, 1, 1, v91);
  uint64_t v75 = 0;
  uint64_t v17 = type metadata accessor for TimeZone();
  (*(void (**)(char *, void))(*(void *)(v17 - 8) + 56))(v97, v80);
  os_log_type_t v76 = &v25;
  uint64_t v25 = 0;
  int v77 = 1;
  char v26 = 1;
  uint64_t v27 = 0;
  char v28 = 1;
  uint64_t v29 = 0;
  char v30 = 1;
  uint64_t v31 = 0;
  char v32 = 1;
  uint64_t v33 = 0;
  char v34 = 1;
  uint64_t v35 = 0;
  char v36 = 1;
  uint64_t v37 = 0;
  char v38 = 1;
  uint64_t v39 = 0;
  char v40 = 1;
  uint64_t v41 = 0;
  char v42 = 1;
  uint64_t v43 = 0;
  LOBYTE(v44) = 1;
  uint64_t v45 = 0;
  char v46 = 1;
  DateComponents.init(calendar:timeZone:era:year:month:day:hour:minute:second:nanosecond:weekday:weekdayOrdinal:quarter:weekOfMonth:weekOfYear:yearForWeekOfYear:)();
  DateComponents.second.setter();
  static Calendar.current.getter();
  (*(void (**)(char *, char *, uint64_t))(v101 + 16))(v104, v106, v100);
  default argument 2 of Calendar.date(byAdding:to:wrappingComponents:)();
  Calendar.date(byAdding:to:wrappingComponents:)();
  os_log_type_t v78 = *(void (**)(char *, uint64_t))(v101 + 8);
  uint64_t v79 = v101 + 8;
  v78(v104, v100);
  (*(void (**)(char *, uint64_t))(v92 + 8))(v95, v91);
  if (v130(v109, v80, v128) == 1)
  {
    uint64_t v20 = v90;
    outlined destroy of Date?(v109);
    uint64_t v62 = Logger.wellnessIntents.unsafeMutableAddressor();
    id v63 = &v138;
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v87 + 16))(v20, v62, v86);
    swift_endAccess();
    uint64_t v69 = Logger.logObject.getter();
    int v68 = static os_log_type_t.error.getter();
    uint64_t v66 = &v136;
    uint64_t v136 = 2;
    unint64_t v64 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    unint64_t v65 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    lazy protocol witness table accessor for type Int and conformance Int();
    UnsignedInteger<>.init<A>(_:)();
    uint32_t v67 = v137;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
    uint64_t v70 = _allocateUninitializedArray<A>(_:)();
    if (os_log_type_enabled(v69, (os_log_type_t)v68))
    {
      uint64_t v21 = v85;
      uint64_t v52 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
      uint64_t v50 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      uint64_t v51 = 0;
      uint64_t v53 = createStorage<A>(capacity:type:)(0);
      uint64_t v54 = createStorage<A>(capacity:type:)(v51);
      uint64_t v58 = &v135;
      uint64_t v135 = v52;
      uint64_t v59 = &v134;
      uint64_t v134 = v53;
      uint64_t v56 = &v133;
      uint64_t v133 = v54;
      unsigned int v55 = 0;
      serialize(_:at:)(0, &v135);
      serialize(_:at:)(v55, v58);
      uint64_t v132 = v70;
      uint64_t v57 = v47;
      MEMORY[0x270FA5388](v47);
      uint64_t v60 = &v41;
      uint64_t v43 = v58;
      uint64_t v44 = v59;
      uint64_t v45 = v22;
      uint64_t v61 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
      lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
      Sequence.forEach(_:)();
      if (v21)
      {
        __break(1u);
      }
      else
      {
        _os_log_impl(&dword_25DE00000, v69, (os_log_type_t)v68, "Failed to create date interval", v52, v67);
        uint64_t v49 = 0;
        destroyStorage<A>(_:count:)(v53, 0, v50);
        destroyStorage<A>(_:count:)(v54, v49, MEMORY[0x263F8EE58] + 8);
        MEMORY[0x2611C8D90](v52, MEMORY[0x263F8E778]);
        swift_bridgeObjectRelease();
      }
    }
    else
    {
      swift_bridgeObjectRelease();
    }

    (*(void (**)(char *, uint64_t))(v87 + 8))(v90, v86);
    uint64_t v23 = type metadata accessor for DateInterval();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v23 - 8) + 56))(v83, 1);
    v78(v106, v100);
    uint32_t v48 = *(void (**)(char *, uint64_t))(v126 + 8);
    v47[1] = v126 + 8;
    v48(v123, v128);
    return ((uint64_t (*)(char *, uint64_t))v48)(v125, v128);
  }
  else
  {
    v81(v120, v109, v128);
    uint64_t v72 = *(void (**)(char *, char *, uint64_t))(v126 + 16);
    uint64_t v71 = v126 + 16;
    v72(v118, v120, v128);
    v72(v116, v123, v128);
    DateInterval.init(start:end:)();
    uint64_t v18 = type metadata accessor for DateInterval();
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v18 - 8) + 56))(v83, 0, 1);
    uint64_t v74 = *(void (**)(char *, uint64_t))(v126 + 8);
    uint64_t v73 = v126 + 8;
    v74(v120, v128);
    v78(v106, v100);
    v74(v123, v128);
    return ((uint64_t (*)(char *, uint64_t))v74)(v125, v128);
  }
}

Swift::Bool __swiftcall allDoseEventsAreUnlogged(doseEvents:)(Swift::OpaquePointer doseEvents)
{
  type metadata accessor for HKMedicationDoseEventStatus();
  _allocateUninitializedArray<A>(_:)();
  void *v1 = 4;
  v1[1] = 5;
  _finalizeUninitializedArray<A>(_:)();
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [HKMedicationExposableDoseEvent]);
  lazy protocol witness table accessor for type [HKMedicationExposableDoseEvent] and conformance [A]();
  char v3 = Sequence.allSatisfy(_:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

Swift::Bool __swiftcall allLoggedWithMixedStatus(doseEvents:)(Swift::OpaquePointer doseEvents)
{
  uint64_t v10 = 0;
  uint64_t v9 = 0;
  uint64_t v8 = 0;
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [HKMedicationExposableDoseEvent]);
  lazy protocol witness table accessor for type [HKMedicationExposableDoseEvent] and conformance [A]();
  Collection<>.makeIterator()();
  while (1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for IndexingIterator<[HKMedicationExposableDoseEvent]>);
    IndexingIterator.next()();
    if (!v7) {
      break;
    }
    objc_msgSend(v7, sel_status);
    type metadata accessor for HKMedicationDoseEventStatus();
    lazy protocol witness table accessor for type HKMedicationDoseEventStatus and conformance HKMedicationDoseEventStatus();
    Swift::Bool result = == infix<A>(_:_:)();
    if (result)
    {
      if (__OFADD__(v10, 1)) {
        goto LABEL_30;
      }
      ++v10;
    }
    else
    {
      objc_msgSend(v7, sel_status);
      Swift::Bool result = == infix<A>(_:_:)();
      if (result)
      {
        if (__OFADD__(v9, 1)) {
          goto LABEL_29;
        }
        ++v9;
      }
      else
      {
        if (__OFADD__(v8, 1))
        {
          __break(1u);
LABEL_29:
          __break(1u);
LABEL_30:
          __break(1u);
          return result;
        }
        ++v8;
      }
    }
  }
  outlined destroy of [HKQuantityType]();
  if (v8) {
    BOOL v6 = 0;
  }
  else {
    BOOL v6 = v10 >= 1;
  }
  return v6 && v9 >= 1;
}

Swift::Bool __swiftcall oneExistingStatusWithConflictingRequest(doseEvents:requestedStatus:)(Swift::OpaquePointer doseEvents, Swift::Bool requestedStatus)
{
  if (requestedStatus)
  {
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [HKMedicationExposableDoseEvent]);
    lazy protocol witness table accessor for type [HKMedicationExposableDoseEvent] and conformance [A]();
    Collection<>.makeIterator()();
    while (1)
    {
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for IndexingIterator<[HKMedicationExposableDoseEvent]>);
      IndexingIterator.next()();
      if (!v4) {
        break;
      }
      objc_msgSend(v4, sel_status);
      type metadata accessor for HKMedicationDoseEventStatus();
      lazy protocol witness table accessor for type HKMedicationDoseEventStatus and conformance HKMedicationDoseEventStatus();
      if (== infix<A>(_:_:)())
      {

        outlined destroy of [HKQuantityType]();
        return 1;
      }
    }
  }
  else
  {
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [HKMedicationExposableDoseEvent]);
    lazy protocol witness table accessor for type [HKMedicationExposableDoseEvent] and conformance [A]();
    Collection<>.makeIterator()();
    while (1)
    {
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for IndexingIterator<[HKMedicationExposableDoseEvent]>);
      IndexingIterator.next()();
      if (!v5) {
        break;
      }
      objc_msgSend(v5, sel_status);
      type metadata accessor for HKMedicationDoseEventStatus();
      lazy protocol witness table accessor for type HKMedicationDoseEventStatus and conformance HKMedicationDoseEventStatus();
      if (== infix<A>(_:_:)())
      {

        outlined destroy of [HKQuantityType]();
        return 1;
      }
    }
  }
  outlined destroy of [HKQuantityType]();
  return 0;
}

uint64_t getUnloggedDoseEvents(doseEvents:)()
{
  type metadata accessor for HKMedicationDoseEventStatus();
  _allocateUninitializedArray<A>(_:)();
  void *v0 = 4;
  v0[1] = 5;
  _finalizeUninitializedArray<A>(_:)();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [HKMedicationExposableDoseEvent]);
  lazy protocol witness table accessor for type [HKMedicationExposableDoseEvent] and conformance [A]();
  uint64_t v2 = _ArrayProtocol.filter(_:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v2;
}

uint64_t getFallbackDateInterval(specifiedDateInterval:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v48 = a2;
  uint64_t v70 = a1;
  uint64_t v49 = "Fatal error";
  uint64_t v50 = "Unexpectedly found nil while unwrapping an Optional value";
  uint64_t v51 = "SiriWellnessIntents/MedicationsHelpers.swift";
  unint64_t v105 = 0;
  id v104 = 0;
  unint64_t v103 = 0;
  uint64_t v102 = 0;
  uint64_t v101 = 0;
  uint64_t v100 = 0;
  uint64_t v74 = 0;
  uint64_t v90 = type metadata accessor for Calendar();
  uint64_t v87 = *(void **)(v90 - 8);
  uint64_t v88 = v90 - 8;
  unint64_t v52 = (v87[8] + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v90);
  unint64_t v89 = (char *)v41 - v52;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  unint64_t v53 = (*(void *)(*(void *)(v3 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v3);
  uint64_t v54 = (char *)v41 - v53;
  unint64_t v55 = (v4 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388]((char *)v41 - v53);
  uint64_t v95 = (char *)v41 - v55;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TimeZone?);
  unint64_t v56 = (*(void *)(*(void *)(v5 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v5);
  uint64_t v73 = (char *)v41 - v56;
  unint64_t v57 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Calendar?)
                               - 8)
                   + 64)
       + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v74);
  uint64_t v72 = (char *)v41 - v57;
  uint64_t v84 = type metadata accessor for DateComponents();
  uint64_t v81 = *(void **)(v84 - 8);
  uint64_t v82 = v84 - 8;
  unint64_t v58 = (v81[8] + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v6 = MEMORY[0x270FA5388](v74);
  uint64_t v83 = (char *)v41 - v58;
  unint64_t v59 = (v7 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v6);
  int v77 = (char *)v41 - v59;
  unint64_t v105 = (char *)v41 - v59;
  uint64_t v97 = type metadata accessor for Date();
  uint64_t v93 = *(void **)(v97 - 8);
  uint64_t v94 = v97 - 8;
  unint64_t v60 = (v93[8] + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v97);
  uint64_t v61 = (char *)v41 - v60;
  unint64_t v62 = (v8 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388]((char *)v41 - v60);
  id v63 = (char *)v41 - v62;
  unint64_t v64 = (v9 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v10 = MEMORY[0x270FA5388]((char *)v41 - v62);
  unint64_t v65 = (char *)v41 - v64;
  id v104 = (char *)v41 - v64;
  unint64_t v66 = (v11 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint32_t v67 = (char *)v41 - v66;
  unint64_t v103 = (char *)v41 - v66;
  unint64_t v68 = (v13 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  uint64_t v71 = (char *)v41 - v68;
  uint64_t v102 = (char *)v41 - v68;
  unint64_t v69 = (v15 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v14);
  unsigned int v80 = (char *)v41 - v69;
  uint64_t v101 = (char *)v41 - v69;
  uint64_t v100 = a1;
  DateInterval.start.getter();
  DateInterval.end.getter();
  uint64_t v16 = (void (*)(char *, uint64_t, uint64_t, uint64_t))v87[7];
  unsigned int v96 = 1;
  v16(v72, 1, 1, v90);
  uint64_t v17 = type metadata accessor for TimeZone();
  (*(void (**)(char *, void))(*(void *)(v17 - 8) + 56))(v73, v96);
  uint64_t v75 = &v19;
  uint64_t v19 = 0;
  int v76 = 1;
  char v20 = 1;
  uint64_t v21 = 0;
  char v22 = 1;
  uint64_t v23 = 0;
  char v24 = 1;
  uint64_t v25 = 0;
  char v26 = 1;
  uint64_t v27 = 0;
  char v28 = 1;
  uint64_t v29 = 0;
  char v30 = 1;
  uint64_t v31 = 0;
  char v32 = 1;
  uint64_t v33 = 0;
  char v34 = 1;
  uint64_t v35 = 0;
  char v36 = 1;
  uint64_t v37 = 0;
  LOBYTE(v38) = 1;
  uint64_t v39 = 0;
  char v40 = 1;
  DateComponents.init(calendar:timeZone:era:year:month:day:hour:minute:second:nanosecond:weekday:weekdayOrdinal:quarter:weekOfMonth:weekOfYear:yearForWeekOfYear:)();
  DateComponents.hour.setter();
  static Calendar.current.getter();
  os_log_type_t v78 = (void (*)(char *, char *, uint64_t))v81[2];
  uint64_t v79 = v81 + 2;
  v78(v83, v77, v84);
  default argument 2 of Calendar.date(byAdding:to:wrappingComponents:)();
  Calendar.date(byAdding:to:wrappingComponents:)();
  uint64_t v85 = (void (*)(char *, uint64_t))v81[1];
  uint64_t v86 = v81 + 1;
  v85(v83, v84);
  uint64_t v91 = (void (*)(char *, uint64_t))v87[1];
  uint64_t v92 = v87 + 1;
  v91(v89, v90);
  unint64_t v98 = (unsigned int (*)(char *, void, uint64_t))v93[6];
  uint64_t v99 = v93 + 6;
  if (v98(v95, v96, v97) == 1)
  {
    LOBYTE(v37) = 2;
    uint64_t v38 = 152;
    LODWORD(v39) = 0;
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  uint64_t v45 = (void (*)(char *, char *, uint64_t))v93[4];
  char v46 = v93 + 4;
  v45(v67, v95, v97);
  static Calendar.current.getter();
  v78(v83, v77, v84);
  default argument 2 of Calendar.date(byAdding:to:wrappingComponents:)();
  unsigned int v47 = 1;
  Calendar.date(byAdding:to:wrappingComponents:)();
  v85(v83, v84);
  v91(v89, v90);
  if (v98(v54, v47, v97) == 1)
  {
    LOBYTE(v37) = 2;
    uint64_t v38 = 153;
    LODWORD(v39) = 0;
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  v45(v65, v54, v97);
  char v42 = (void (*)(char *, char *, uint64_t))v93[2];
  v41[1] = v93 + 2;
  v42(v63, v67, v97);
  v42(v61, v65, v97);
  DateInterval.init(start:end:)();
  uint64_t v44 = (void (*)(char *, uint64_t))v93[1];
  uint64_t v43 = v93 + 1;
  v44(v65, v97);
  v44(v67, v97);
  v85(v77, v84);
  v44(v71, v97);
  return ((uint64_t (*)(char *, uint64_t))v44)(v80, v97);
}

uint64_t filterUniqueDoseEvents(doseEvents:)(uint64_t a1)
{
  uint64_t v334 = a1;
  uint64_t v317 = 0;
  v341 = partial apply for implicit closure #4 in SpecificMedicationsPersistor.saveMedication(named:medStatusTaken:dosage:dosageUnit:);
  v345 = partial apply for thunk for @escaping @callee_guaranteed () -> (@unowned Int);
  v347 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
  v349 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
  v352 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append<A>(_:);
  uint64_t v281 = partial apply for implicit closure #4 in SpecificMedicationsPersistor.saveScheduledMedication(specifiedDateInterval:medStatusTaken:);
  uint32_t v282 = partial apply for implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:);
  os_log_type_t v283 = partial apply for implicit closure #1 in MedsUndoer.getUpdatedDoseEvent(doseEvent:matchingMeds:);
  uint64_t v284 = partial apply for implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:);
  uint64_t v285 = partial apply for implicit closure #7 in SpecificMedicationsPersistor.buildMatchedMedName(from:shouldIncludeAsNeededParams:);
  uint64_t v286 = partial apply for implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:);
  uint64_t v287 = partial apply for implicit closure #5 in filterUniqueDoseEvents(doseEvents:);
  uint64_t v288 = partial apply for implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:);
  uint64_t v289 = partial apply for implicit closure #6 in filterUniqueDoseEvents(doseEvents:);
  uint32_t v290 = partial apply for implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:);
  uint32_t v291 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
  os_log_type_t v292 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
  id v293 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
  uint64_t v294 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
  uint64_t v295 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
  uint64_t v296 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
  uint64_t v297 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
  uint64_t v298 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
  uint64_t v299 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
  uint64_t v300 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
  uint64_t v301 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
  uint64_t v302 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
  os_log_type_t v303 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
  Swift::Double_optional v304 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
  uint64_t v305 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
  uint64_t v306 = partial apply for specialized implicit closure #10 in SpecificMedicationsPersistor.writeDoseEvent(medicationController:doseEvents:medStatusTaken:medicationIDPresent:dosage:dosageUnit:);
  id v307 = partial apply for thunk for @escaping @callee_guaranteed () -> (@unowned Int);
  id v308 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
  id v309 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
  id v310 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append<A>(_:);
  uint64_t v402 = 0;
  uint64_t v398 = 0;
  uint64_t v397 = 0;
  uint64_t v395 = 0;
  uint64_t v396 = 0;
  uint64_t v326 = 0;
  uint64_t v311 = 0;
  v383 = 0;
  BOOL v379 = 0;
  uint64_t v377 = 0;
  uint64_t v378 = 0;
  uint64_t v376 = 0;
  uint64_t v312 = type metadata accessor for Date();
  uint64_t v313 = *(void *)(v312 - 8);
  uint64_t v314 = v312 - 8;
  unint64_t v315 = (*(void *)(v313 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v312);
  v316 = (char *)v113 - v315;
  unint64_t v318 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?)
                                - 8)
                    + 64)
        + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v317);
  uint64_t v319 = (uint64_t)v113 - v318;
  uint64_t v330 = type metadata accessor for Logger();
  uint64_t v327 = *(void **)(v330 - 8);
  uint64_t v328 = v330 - 8;
  unint64_t v320 = (v327[8] + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v1 = MEMORY[0x270FA5388](v334);
  v321 = (char *)v113 - v320;
  unint64_t v322 = (v2 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v3 = MEMORY[0x270FA5388](v1);
  uint64_t v323 = (char *)v113 - v322;
  unint64_t v324 = (v4 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)v113 - v324;
  v325 = (char *)v113 - v324;
  uint64_t v402 = v5;
  uint64_t v329 = Logger.wellnessIntents.unsafeMutableAddressor();
  uint64_t v333 = &v401;
  uint64_t v342 = 32;
  swift_beginAccess();
  os_log_type_t v331 = (void (*)(char *, uint64_t, uint64_t))v327[2];
  v332 = v327 + 2;
  v331(v6, v329, v330);
  swift_endAccess();
  swift_bridgeObjectRetain();
  uint64_t v343 = 7;
  uint64_t v344 = swift_allocObject();
  *(void *)(v344 + 16) = v334;
  v356 = Logger.logObject.getter();
  int v357 = static os_log_type_t.debug.getter();
  v337 = &v399;
  uint64_t v399 = 12;
  unint64_t v335 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  unint64_t v336 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  unint64_t v338 = lazy protocol witness table accessor for type Int and conformance Int();
  UnsignedInteger<>.init<A>(_:)();
  uint32_t v339 = v400;
  uint64_t v340 = 17;
  uint64_t v348 = swift_allocObject();
  *(unsigned char *)(v348 + 16) = 0;
  uint64_t v350 = swift_allocObject();
  *(unsigned char *)(v350 + 16) = 8;
  uint64_t v7 = swift_allocObject();
  uint64_t v8 = v344;
  uint64_t v346 = v7;
  *(void *)(v7 + 16) = v341;
  *(void *)(v7 + 24) = v8;
  uint64_t v9 = swift_allocObject();
  uint64_t v10 = v346;
  uint64_t v353 = v9;
  *(void *)(v9 + 16) = v345;
  *(void *)(v9 + 24) = v10;
  uint64_t v355 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
  uint64_t v351 = _allocateUninitializedArray<A>(_:)();
  v354 = v11;
  swift_retain();
  uint64_t v12 = v348;
  uint64_t v13 = v354;
  *v354 = v347;
  v13[1] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v12;
  swift_retain();
  uint64_t v14 = v350;
  uint64_t v15 = v354;
  v354[2] = v349;
  v15[3] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v14;
  swift_retain();
  uint64_t v16 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v353;
  uint64_t v17 = v354;
  v354[4] = v352;
  v17[5] = v16;
  _finalizeUninitializedArray<A>(_:)();
  swift_bridgeObjectRelease();
  if (os_log_type_enabled(v356, (os_log_type_t)v357))
  {
    uint64_t v18 = v311;
    uint64_t v274 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
    uint64_t v272 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    uint64_t v273 = 0;
    uint64_t v275 = createStorage<A>(capacity:type:)(0);
    uint64_t v276 = createStorage<A>(capacity:type:)(v273);
    uint64_t v277 = &v362;
    v362 = v274;
    uint64_t v278 = &v361;
    uint64_t v361 = v275;
    v279 = &v360;
    uint64_t v360 = v276;
    serialize(_:at:)(0, &v362);
    serialize(_:at:)(1, v277);
    v358 = v347;
    uint64_t v359 = v348;
    closure #1 in osLogInternal(_:log:type:)(&v358, (uint64_t)v277, (uint64_t)v278, (uint64_t)v279);
    uint64_t v280 = v18;
    if (v18)
    {
      __break(1u);
    }
    else
    {
      v358 = v349;
      uint64_t v359 = v350;
      closure #1 in osLogInternal(_:log:type:)(&v358, (uint64_t)&v362, (uint64_t)&v361, (uint64_t)&v360);
      uint64_t v270 = 0;
      uint64_t v20 = v270;
      v358 = v352;
      uint64_t v359 = v353;
      closure #1 in osLogInternal(_:log:type:)(&v358, (uint64_t)&v362, (uint64_t)&v361, (uint64_t)&v360);
      uint64_t v269 = v20;
      _os_log_impl(&dword_25DE00000, v356, (os_log_type_t)v357, "Started filtering with this many dose events: %ld", v274, v339);
      uint64_t v268 = 0;
      destroyStorage<A>(_:count:)(v275, 0, v272);
      destroyStorage<A>(_:count:)(v276, v268, MEMORY[0x263F8EE58] + 8);
      MEMORY[0x2611C8D90](v274, MEMORY[0x263F8E778]);
      swift_release();
      swift_release();
      swift_release();
      uint64_t v271 = v269;
    }
  }
  else
  {
    uint64_t v19 = v311;
    swift_release();
    swift_release();
    swift_release();
    uint64_t v271 = v19;
  }
  uint64_t v266 = v271;

  uint32_t v258 = (void (*)(char *, uint64_t))v327[1];
  uint64_t v259 = v327 + 1;
  v258(v325, v330);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (String?, [String]));
  uint64_t v264 = 0;
  uint64_t v262 = _allocateUninitializedArray<A>(_:)();
  uint64_t v260 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for String?);
  uint64_t v261 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String]);
  unint64_t v263 = lazy protocol witness table accessor for type String? and conformance <A> A?();
  uint64_t v398 = Dictionary.init(dictionaryLiteral:)();
  type metadata accessor for HKMedicationExposableDoseEvent();
  uint64_t v397 = _allocateUninitializedArray<A>(_:)();
  swift_bridgeObjectRetain();
  uint64_t v394 = v334;
  uint64_t v265 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [HKMedicationExposableDoseEvent]);
  lazy protocol witness table accessor for type [HKMedicationExposableDoseEvent] and conformance [A]();
  Collection<>.makeIterator()();
  uint64_t v267 = v266;
  while (1)
  {
    uint64_t v256 = v267;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for IndexingIterator<[HKMedicationExposableDoseEvent]>);
    IndexingIterator.next()();
    os_log_type_t v257 = v393;
    if (!v393) {
      break;
    }
    uint64_t v255 = v257;
    uint64_t v21 = v323;
    id v219 = v257;
    v383 = v257;
    uint64_t v216 = Logger.wellnessIntents.unsafeMutableAddressor();
    uint64_t v217 = &v382;
    uint64_t v232 = 32;
    swift_beginAccess();
    v331(v21, v216, v330);
    swift_endAccess();
    id v22 = v219;
    uint64_t v218 = 24;
    uint64_t v233 = 7;
    uint64_t v23 = swift_allocObject();
    id v24 = v219;
    uint64_t v221 = v23;
    *(void *)(v23 + 16) = v219;
    id v25 = v24;
    uint64_t v26 = swift_allocObject();
    id v27 = v219;
    uint64_t v223 = v26;
    *(void *)(v26 + 16) = v219;
    id v28 = v27;
    uint64_t v29 = swift_allocObject();
    id v30 = v219;
    uint64_t v225 = v29;
    *(void *)(v29 + 16) = v219;
    id v31 = v30;
    uint64_t v32 = swift_allocObject();
    id v33 = v219;
    uint64_t v227 = v32;
    *(void *)(v32 + 16) = v219;
    id v34 = v33;
    uint64_t v234 = swift_allocObject();
    *(void *)(v234 + 16) = v219;
    uint64_t v253 = Logger.logObject.getter();
    int v254 = static os_log_type_t.debug.getter();
    uint64_t v380 = 52;
    UnsignedInteger<>.init<A>(_:)();
    uint32_t v220 = v381;
    uint64_t v230 = 17;
    uint64_t v236 = swift_allocObject();
    int v229 = 32;
    *(unsigned char *)(v236 + 16) = 32;
    uint64_t v237 = swift_allocObject();
    int v231 = 8;
    *(unsigned char *)(v237 + 16) = 8;
    uint64_t v35 = swift_allocObject();
    uint64_t v36 = v221;
    uint64_t v222 = v35;
    *(void *)(v35 + 16) = v281;
    *(void *)(v35 + 24) = v36;
    uint64_t v37 = swift_allocObject();
    uint64_t v38 = v222;
    uint64_t v238 = v37;
    *(void *)(v37 + 16) = v282;
    *(void *)(v37 + 24) = v38;
    uint64_t v239 = swift_allocObject();
    *(unsigned char *)(v239 + 16) = v229;
    uint64_t v240 = swift_allocObject();
    *(unsigned char *)(v240 + 16) = v231;
    uint64_t v39 = swift_allocObject();
    uint64_t v40 = v223;
    uint64_t v224 = v39;
    *(void *)(v39 + 16) = v283;
    *(void *)(v39 + 24) = v40;
    uint64_t v41 = swift_allocObject();
    uint64_t v42 = v224;
    uint64_t v241 = v41;
    *(void *)(v41 + 16) = v284;
    *(void *)(v41 + 24) = v42;
    uint64_t v242 = swift_allocObject();
    *(unsigned char *)(v242 + 16) = v229;
    uint64_t v243 = swift_allocObject();
    *(unsigned char *)(v243 + 16) = v231;
    uint64_t v43 = swift_allocObject();
    uint64_t v44 = v225;
    uint64_t v226 = v43;
    *(void *)(v43 + 16) = v285;
    *(void *)(v43 + 24) = v44;
    uint64_t v45 = swift_allocObject();
    uint64_t v46 = v226;
    uint64_t v244 = v45;
    *(void *)(v45 + 16) = v286;
    *(void *)(v45 + 24) = v46;
    uint64_t v245 = swift_allocObject();
    *(unsigned char *)(v245 + 16) = v229;
    uint64_t v246 = swift_allocObject();
    *(unsigned char *)(v246 + 16) = v231;
    uint64_t v47 = swift_allocObject();
    uint64_t v48 = v227;
    uint64_t v228 = v47;
    *(void *)(v47 + 16) = v287;
    *(void *)(v47 + 24) = v48;
    uint64_t v49 = swift_allocObject();
    uint64_t v50 = v228;
    uint64_t v247 = v49;
    *(void *)(v49 + 16) = v288;
    *(void *)(v49 + 24) = v50;
    uint64_t v248 = swift_allocObject();
    *(unsigned char *)(v248 + 16) = v229;
    uint64_t v249 = swift_allocObject();
    *(unsigned char *)(v249 + 16) = v231;
    uint64_t v51 = swift_allocObject();
    uint64_t v52 = v234;
    uint64_t v235 = v51;
    *(void *)(v51 + 16) = v289;
    *(void *)(v51 + 24) = v52;
    uint64_t v53 = swift_allocObject();
    uint64_t v54 = v235;
    uint64_t v251 = v53;
    *(void *)(v53 + 16) = v290;
    *(void *)(v53 + 24) = v54;
    uint64_t v250 = _allocateUninitializedArray<A>(_:)();
    uint64_t v252 = v55;
    swift_retain();
    uint64_t v56 = v236;
    unint64_t v57 = v252;
    *uint64_t v252 = v291;
    v57[1] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v56;
    swift_retain();
    uint64_t v58 = v237;
    unint64_t v59 = v252;
    v252[2] = v292;
    v59[3] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v58;
    swift_retain();
    unint64_t v60 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v238;
    uint64_t v61 = v252;
    v252[4] = v293;
    v61[5] = v60;
    swift_retain();
    uint64_t v62 = v239;
    id v63 = v252;
    v252[6] = v294;
    v63[7] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v62;
    swift_retain();
    uint64_t v64 = v240;
    unint64_t v65 = v252;
    v252[8] = v295;
    v65[9] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v64;
    swift_retain();
    unint64_t v66 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v241;
    uint32_t v67 = v252;
    v252[10] = v296;
    v67[11] = v66;
    swift_retain();
    uint64_t v68 = v242;
    unint64_t v69 = v252;
    v252[12] = v297;
    v69[13] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v68;
    swift_retain();
    uint64_t v70 = v243;
    uint64_t v71 = v252;
    v252[14] = v298;
    v71[15] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v70;
    swift_retain();
    uint64_t v72 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v244;
    uint64_t v73 = v252;
    v252[16] = v299;
    v73[17] = v72;
    swift_retain();
    uint64_t v74 = v245;
    uint64_t v75 = v252;
    v252[18] = v300;
    v75[19] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v74;
    swift_retain();
    uint64_t v76 = v246;
    int v77 = v252;
    v252[20] = v301;
    v77[21] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v76;
    swift_retain();
    os_log_type_t v78 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v247;
    uint64_t v79 = v252;
    v252[22] = v302;
    v79[23] = v78;
    swift_retain();
    uint64_t v80 = v248;
    uint64_t v81 = v252;
    v252[24] = v303;
    v81[25] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v80;
    swift_retain();
    uint64_t v82 = v249;
    uint64_t v83 = v252;
    v252[26] = v304;
    v83[27] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v82;
    swift_retain();
    uint64_t v84 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v251;
    uint64_t v85 = v252;
    v252[28] = v305;
    v85[29] = v84;
    _finalizeUninitializedArray<A>(_:)();
    swift_bridgeObjectRelease();
    if (os_log_type_enabled(v253, (os_log_type_t)v254))
    {
      uint64_t v86 = v256;
      uint64_t v209 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
      uint64_t v208 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      uint64_t v210 = createStorage<A>(capacity:type:)(0);
      uint64_t v211 = createStorage<A>(capacity:type:)(5);
      uint64_t v212 = v367;
      v367[0] = v209;
      uint64_t v213 = &v366;
      uint64_t v366 = v210;
      uint64_t v214 = &v365;
      uint64_t v365 = v211;
      serialize(_:at:)(2, v367);
      serialize(_:at:)(5, v212);
      v363 = v291;
      uint64_t v364 = v236;
      closure #1 in osLogInternal(_:log:type:)(&v363, (uint64_t)v212, (uint64_t)v213, (uint64_t)v214);
      uint64_t v215 = v86;
      if (v86)
      {
        __break(1u);
      }
      else
      {
        v363 = v292;
        uint64_t v364 = v237;
        closure #1 in osLogInternal(_:log:type:)(&v363, (uint64_t)v367, (uint64_t)&v366, (uint64_t)&v365);
        uint64_t v206 = 0;
        uint64_t v88 = v206;
        v363 = v293;
        uint64_t v364 = v238;
        closure #1 in osLogInternal(_:log:type:)(&v363, (uint64_t)v367, (uint64_t)&v366, (uint64_t)&v365);
        uint64_t v205 = v88;
        v363 = v294;
        uint64_t v364 = v239;
        closure #1 in osLogInternal(_:log:type:)(&v363, (uint64_t)v367, (uint64_t)&v366, (uint64_t)&v365);
        uint64_t v204 = 0;
        v363 = v295;
        uint64_t v364 = v240;
        closure #1 in osLogInternal(_:log:type:)(&v363, (uint64_t)v367, (uint64_t)&v366, (uint64_t)&v365);
        uint64_t v203 = 0;
        v363 = v296;
        uint64_t v364 = v241;
        closure #1 in osLogInternal(_:log:type:)(&v363, (uint64_t)v367, (uint64_t)&v366, (uint64_t)&v365);
        uint64_t v202 = 0;
        v363 = v297;
        uint64_t v364 = v242;
        closure #1 in osLogInternal(_:log:type:)(&v363, (uint64_t)v367, (uint64_t)&v366, (uint64_t)&v365);
        uint64_t v201 = 0;
        v363 = v298;
        uint64_t v364 = v243;
        closure #1 in osLogInternal(_:log:type:)(&v363, (uint64_t)v367, (uint64_t)&v366, (uint64_t)&v365);
        uint64_t v200 = 0;
        v363 = v299;
        uint64_t v364 = v244;
        closure #1 in osLogInternal(_:log:type:)(&v363, (uint64_t)v367, (uint64_t)&v366, (uint64_t)&v365);
        uint64_t v199 = 0;
        v363 = v300;
        uint64_t v364 = v245;
        closure #1 in osLogInternal(_:log:type:)(&v363, (uint64_t)v367, (uint64_t)&v366, (uint64_t)&v365);
        uint64_t v198 = 0;
        v363 = v301;
        uint64_t v364 = v246;
        closure #1 in osLogInternal(_:log:type:)(&v363, (uint64_t)v367, (uint64_t)&v366, (uint64_t)&v365);
        uint64_t v197 = 0;
        v363 = v302;
        uint64_t v364 = v247;
        closure #1 in osLogInternal(_:log:type:)(&v363, (uint64_t)v367, (uint64_t)&v366, (uint64_t)&v365);
        uint64_t v196 = 0;
        v363 = v303;
        uint64_t v364 = v248;
        closure #1 in osLogInternal(_:log:type:)(&v363, (uint64_t)v367, (uint64_t)&v366, (uint64_t)&v365);
        uint64_t v195 = 0;
        v363 = v304;
        uint64_t v364 = v249;
        closure #1 in osLogInternal(_:log:type:)(&v363, (uint64_t)v367, (uint64_t)&v366, (uint64_t)&v365);
        uint64_t v194 = 0;
        v363 = v305;
        uint64_t v364 = v251;
        closure #1 in osLogInternal(_:log:type:)(&v363, (uint64_t)v367, (uint64_t)&v366, (uint64_t)&v365);
        uint64_t v193 = 0;
        _os_log_impl(&dword_25DE00000, v253, (os_log_type_t)v254, "got a dose event with scheduleID: %s, medID: %s, status: %s, scheduledDate: %s, startDate: %s", v209, v220);
        destroyStorage<A>(_:count:)(v210, 0, v208);
        destroyStorage<A>(_:count:)(v211, 5, MEMORY[0x263F8EE58] + 8);
        MEMORY[0x2611C8D90](v209, MEMORY[0x263F8E778]);
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        uint64_t v207 = v193;
      }
    }
    else
    {
      uint64_t v87 = v256;
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      uint64_t v207 = v87;
    }
    uint64_t v191 = v207;

    v258(v323, v330);
    id v192 = objc_msgSend(v219, sel_scheduledDate);
    if (v192)
    {
      id v190 = v192;
      id v189 = v192;
      static Date._unconditionallyBridgeFromObjectiveC(_:)();
      (*(void (**)(uint64_t, char *, uint64_t))(v313 + 32))(v319, v316, v312);
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v313 + 56))(v319, 0, 1, v312);
    }
    else
    {
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v313 + 56))(v319, 1, 1, v312);
    }
    BOOL v188 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v313 + 48))(v319, 1, v312) == 1;
    BOOL v187 = v188;
    outlined destroy of Date?(v319);
    BOOL v379 = v187;
    if (v187)
    {

      uint64_t v267 = v191;
    }
    else
    {
      id v182 = objc_msgSend(v219, sel_medicationIdentifier);
      id v185 = objc_msgSend(v182, sel_underlyingIdentifier);
      uint64_t v183 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v184 = v89;
      uint64_t v377 = v183;
      uint64_t v378 = v89;

      id v186 = objc_msgSend(v219, sel_scheduleItemIdentifier);
      if (v186)
      {
        id v181 = v186;
        id v176 = v186;
        uint64_t v177 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        uint64_t v178 = v90;

        uint64_t v179 = v177;
        uint64_t v180 = v178;
      }
      else
      {
        uint64_t v179 = 0;
        uint64_t v180 = 0;
      }
      uint64_t v174 = v374;
      v374[0] = v179;
      v374[1] = v180;
      MEMORY[0x2611C8800](&v375);
      outlined destroy of String.UTF8View();
      uint64_t v175 = v375;
      if (v375)
      {
        uint64_t v173 = v175;
        uint64_t v169 = v175;
        swift_bridgeObjectRetain();
        uint64_t v376 = v169;
        uint64_t v171 = v371;
        v371[0] = v169;
        uint64_t v170 = v370;
        v370[0] = v183;
        v370[1] = v184;
        lazy protocol witness table accessor for type [String] and conformance [A]();
        int v172 = Sequence<>.contains(_:)();
        outlined destroy of [HKQuantityType]();
        if ((v172 & 1) == 0)
        {
          swift_bridgeObjectRetain();
          v369[1] = v183;
          v369[2] = v184;
          specialized Array.append(_:)();
          id v168 = objc_msgSend(v219, sel_scheduleItemIdentifier);
          if (v168)
          {
            id v167 = v168;
            id v162 = v168;
            uint64_t v163 = static String._unconditionallyBridgeFromObjectiveC(_:)();
            uint64_t v164 = v91;

            uint64_t v165 = v163;
            uint64_t v166 = v164;
          }
          else
          {
            uint64_t v165 = 0;
            uint64_t v166 = 0;
          }
          uint64_t v158 = v166;
          uint64_t v157 = v165;
          int v161 = &v376;
          uint64_t v156 = v376;
          swift_bridgeObjectRetain();
          uint64_t v160 = v369;
          v369[0] = v156;
          uint64_t v159 = v368;
          v368[0] = v157;
          v368[1] = v158;
          __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String? : [String]]);
          Dictionary.subscript.setter();
          id v92 = v219;
          v367[1] = v219;
          Array.append(_:)();
          outlined destroy of [HKQuantityType]();
          goto LABEL_44;
        }
        outlined destroy of [HKQuantityType]();
        swift_bridgeObjectRelease();

        uint64_t v267 = v191;
      }
      else
      {
        id v155 = objc_msgSend(v219, sel_scheduleItemIdentifier);
        if (v155)
        {
          id v154 = v155;
          id v149 = v155;
          uint64_t v150 = static String._unconditionallyBridgeFromObjectiveC(_:)();
          uint64_t v151 = v93;

          uint64_t v152 = v150;
          uint64_t v153 = v151;
        }
        else
        {
          uint64_t v152 = 0;
          uint64_t v153 = 0;
        }
        uint64_t v146 = v153;
        uint64_t v145 = v152;
        uint64_t v144 = MEMORY[0x263F8D310];
        uint64_t v142 = _allocateUninitializedArray<A>(_:)();
        uint64_t v143 = v94;
        swift_bridgeObjectRetain();
        uint64_t v95 = v142;
        uint64_t v96 = v184;
        uint64_t v97 = v143;
        *uint64_t v143 = v183;
        v97[1] = v96;
        _finalizeUninitializedArray<A>(_:)();
        uint64_t v148 = &v373;
        uint64_t v373 = v95;
        uint64_t v147 = v372;
        v372[0] = v145;
        v372[1] = v146;
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String? : [String]]);
        Dictionary.subscript.setter();
        id v98 = v219;
        v371[1] = v219;
        Array.append(_:)();
LABEL_44:
        swift_bridgeObjectRelease();

        uint64_t v267 = v191;
      }
    }
  }
  uint64_t v99 = v321;
  outlined destroy of [HKQuantityType]();
  uint64_t v126 = Logger.wellnessIntents.unsafeMutableAddressor();
  uint64_t v127 = &v392;
  uint64_t v131 = 32;
  swift_beginAccess();
  v331(v99, v126, v330);
  swift_endAccess();
  uint64_t v128 = v397;
  swift_bridgeObjectRetain();
  uint64_t v132 = 7;
  uint64_t v133 = swift_allocObject();
  *(void *)(v133 + 16) = v128;
  os_log_type_t v140 = Logger.logObject.getter();
  int v141 = static os_log_type_t.debug.getter();
  uint64_t v390 = 12;
  UnsignedInteger<>.init<A>(_:)();
  uint32_t v129 = v391;
  uint64_t v130 = 17;
  uint64_t v135 = swift_allocObject();
  *(unsigned char *)(v135 + 16) = 0;
  uint64_t v136 = swift_allocObject();
  *(unsigned char *)(v136 + 16) = 8;
  uint64_t v100 = swift_allocObject();
  uint64_t v101 = v133;
  uint64_t v134 = v100;
  *(void *)(v100 + 16) = v306;
  *(void *)(v100 + 24) = v101;
  uint64_t v102 = swift_allocObject();
  uint64_t v103 = v134;
  uint64_t v138 = v102;
  *(void *)(v102 + 16) = v307;
  *(void *)(v102 + 24) = v103;
  uint64_t v137 = _allocateUninitializedArray<A>(_:)();
  uint64_t v139 = v104;
  swift_retain();
  uint64_t v105 = v135;
  uint64_t v106 = v139;
  *uint64_t v139 = v308;
  v106[1] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v105;
  swift_retain();
  uint64_t v107 = v136;
  unint64_t v108 = v139;
  v139[2] = v309;
  v108[3] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v107;
  swift_retain();
  uint64_t v109 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v138;
  unint64_t v110 = v139;
  v139[4] = v310;
  v110[5] = v109;
  _finalizeUninitializedArray<A>(_:)();
  swift_bridgeObjectRelease();
  if (os_log_type_enabled(v140, (os_log_type_t)v141))
  {
    uint64_t v111 = v256;
    unint64_t v119 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
    uint64_t v117 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    uint64_t v118 = 0;
    uint64_t v120 = createStorage<A>(capacity:type:)(0);
    uint64_t v121 = createStorage<A>(capacity:type:)(v118);
    uint64_t v122 = &v388;
    v388 = v119;
    uint64_t v123 = &v387;
    uint64_t v387 = v120;
    unint64_t v124 = &v386;
    uint64_t v386 = v121;
    serialize(_:at:)(0, &v388);
    serialize(_:at:)(1, v122);
    v384 = v308;
    uint64_t v385 = v135;
    closure #1 in osLogInternal(_:log:type:)(&v384, (uint64_t)v122, (uint64_t)v123, (uint64_t)v124);
    uint64_t v125 = v111;
    if (v111)
    {
      __break(1u);
    }
    else
    {
      v384 = v309;
      uint64_t v385 = v136;
      closure #1 in osLogInternal(_:log:type:)(&v384, (uint64_t)&v388, (uint64_t)&v387, (uint64_t)&v386);
      uint64_t v116 = 0;
      v384 = v310;
      uint64_t v385 = v138;
      closure #1 in osLogInternal(_:log:type:)(&v384, (uint64_t)&v388, (uint64_t)&v387, (uint64_t)&v386);
      _os_log_impl(&dword_25DE00000, v140, (os_log_type_t)v141, "Finished filtering to this many dose events: %ld", v119, v129);
      uint64_t v115 = 0;
      destroyStorage<A>(_:count:)(v120, 0, v117);
      destroyStorage<A>(_:count:)(v121, v115, MEMORY[0x263F8EE58] + 8);
      MEMORY[0x2611C8D90](v119, MEMORY[0x263F8E778]);
      swift_release();
      swift_release();
      swift_release();
    }
  }
  else
  {
    swift_release();
    swift_release();
    swift_release();
  }

  v258(v321, v330);
  v113[2] = &v397;
  v113[1] = &v389;
  swift_beginAccess();
  uint64_t v114 = v397;
  swift_bridgeObjectRetain();
  swift_endAccess();
  outlined destroy of [HKQuantityType]();
  outlined destroy of [HKQuantityType]();
  return v114;
}

BOOL isLogged(doseEvent:)(void *a1)
{
  id v3 = objc_msgSend(a1, sel_status);
  return v3 == (id)4 || v3 == (id)5;
}

Swift::Bool __swiftcall isCompatibleUnit(_:_:)(Swift::String_optional a1, Swift::String_optional a2)
{
  uint64_t countAndFlagsBits = a1.value._countAndFlagsBits;
  object = a1.value._object;
  uint64_t v47 = a2.value._countAndFlagsBits;
  uint64_t v54 = a2.value._object;
  uint64_t v44 = partial apply for closure #1 in osLogInternal(_:log:type:);
  uint64_t v68 = 0;
  uint64_t v69 = 0;
  uint64_t v66 = 0;
  uint64_t v67 = 0;
  uint64_t v45 = 0;
  uint64_t v57 = 0;
  uint64_t v58 = 0;
  uint64_t v55 = 0;
  uint64_t v56 = 0;
  uint64_t v49 = type metadata accessor for Logger();
  uint64_t v50 = *(void *)(v49 - 8);
  uint64_t v51 = v49 - 8;
  unint64_t v52 = (*(void *)(v50 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v2 = MEMORY[0x270FA5388](v54);
  uint64_t v53 = (char *)&v12 - v52;
  uint64_t v68 = v3;
  uint64_t v69 = v4;
  uint64_t v66 = v5;
  uint64_t v67 = v2;
  swift_bridgeObjectRetain();
  if (v54)
  {
    uint64_t v42 = v47;
    uint64_t v43 = v54;
    uint64_t v40 = v54;
    uint64_t v41 = v47;
    uint64_t v57 = v47;
    uint64_t v58 = v54;
    swift_bridgeObjectRetain();
    if (object)
    {
      uint64_t v38 = countAndFlagsBits;
      uint64_t v39 = object;
      uint64_t v35 = object;
      uint64_t v55 = countAndFlagsBits;
      uint64_t v56 = object;
      int v36 = static String.== infix(_:_:)();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      int v37 = v36;
    }
    else
    {
      swift_bridgeObjectRelease();
      int v37 = 1;
    }
  }
  else
  {
    uint64_t v6 = v53;
    uint64_t v26 = Logger.wellnessIntents.unsafeMutableAddressor();
    id v27 = &v65;
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v50 + 16))(v6, v26, v49);
    swift_endAccess();
    id v33 = Logger.logObject.getter();
    int v32 = static os_log_type_t.debug.getter();
    id v30 = &v63;
    uint64_t v63 = 2;
    unint64_t v28 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    unint64_t v29 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    lazy protocol witness table accessor for type Int and conformance Int();
    UnsignedInteger<>.init<A>(_:)();
    uint32_t v31 = v64;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
    uint64_t v34 = _allocateUninitializedArray<A>(_:)();
    if (os_log_type_enabled(v33, (os_log_type_t)v32))
    {
      uint64_t v7 = v45;
      uint64_t v16 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
      uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      uint64_t v15 = 0;
      uint64_t v17 = createStorage<A>(capacity:type:)(0);
      uint64_t v18 = createStorage<A>(capacity:type:)(v15);
      id v22 = &v62;
      uint64_t v62 = v16;
      uint64_t v23 = &v61;
      uint64_t v61 = v17;
      uint64_t v20 = &v60;
      uint64_t v60 = v18;
      unsigned int v19 = 0;
      serialize(_:at:)(0, &v62);
      serialize(_:at:)(v19, v22);
      uint64_t v59 = v34;
      uint64_t v21 = &v12;
      MEMORY[0x270FA5388](&v12);
      uint64_t v8 = v23;
      uint64_t v9 = &v12 - 6;
      id v24 = &v12 - 6;
      v9[2] = (uint64_t)v22;
      v9[3] = (uint64_t)v8;
      v9[4] = v10;
      uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
      lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
      Sequence.forEach(_:)();
      if (v7)
      {
        __break(1u);
      }
      else
      {
        _os_log_impl(&dword_25DE00000, v33, (os_log_type_t)v32, "healthAppDosageUnit was unexpectedly nil, return false", v16, v31);
        uint64_t v13 = 0;
        destroyStorage<A>(_:count:)(v17, 0, v14);
        destroyStorage<A>(_:count:)(v18, v13, MEMORY[0x263F8EE58] + 8);
        MEMORY[0x2611C8D90](v16, MEMORY[0x263F8E778]);
        swift_bridgeObjectRelease();
      }
    }
    else
    {
      swift_bridgeObjectRelease();
    }

    (*(void (**)(char *, uint64_t))(v50 + 8))(v53, v49);
    int v37 = 0;
  }
  return v37 & 1;
}

uint64_t implicit closure #5 in filterUniqueDoseEvents(doseEvents:)(uint64_t a1)
{
  uint64_t v9 = a1;
  uint64_t v4 = type metadata accessor for Date();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = v4 - 8;
  unint64_t v7 = (*(void *)(v5 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)v3 - v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  unint64_t v11 = (*(void *)(*(void *)(v10 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v1 = (void *)MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)v3 - v11;
  id v13 = objc_msgSend(v1, sel_scheduledDate);
  if (v13)
  {
    v3[1] = v13;
    v3[0] = v13;
    static Date._unconditionallyBridgeFromObjectiveC(_:)();
    (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v12, v8, v4);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v5 + 56))(v12, 0, 1, v4);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56))(v12, 1, 1, v4);
  }
  lazy protocol witness table accessor for type Date? and conformance A?();
  return String.init<A>(describing:)();
}

uint64_t implicit closure #6 in filterUniqueDoseEvents(doseEvents:)(uint64_t a1)
{
  uint64_t v4 = a1;
  uint64_t v6 = type metadata accessor for Date();
  unint64_t v5 = (*(void *)(*(void *)(v6 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  unint64_t v7 = (char *)&v3 - v5;
  id v8 = objc_msgSend((id)MEMORY[0x270FA5388](v4), sel_startDate);
  static Date._unconditionallyBridgeFromObjectiveC(_:)();
  lazy protocol witness table accessor for type Date and conformance Date();
  uint64_t v9 = String.init<A>(describing:)();
  uint64_t v10 = v1;

  return v9;
}

uint64_t closure #1 in allDoseEventsAreUnlogged(doseEvents:)(id *a1)
{
  return (Sequence<>.contains(_:)() ^ 1) & 1;
}

uint64_t partial apply for closure #1 in allDoseEventsAreUnlogged(doseEvents:)(id *a1)
{
  return closure #1 in allDoseEventsAreUnlogged(doseEvents:)(a1) & 1;
}

uint64_t sub_25DF396B8()
{
  return swift_deallocObject();
}

uint64_t sub_25DF396F8()
{
  return swift_deallocObject();
}

uint64_t sub_25DF39724()
{
  return swift_deallocObject();
}

uint64_t sub_25DF39750()
{
  return swift_deallocObject();
}

uint64_t sub_25DF39790()
{
  return swift_deallocObject();
}

uint64_t sub_25DF397D0()
{
  return swift_deallocObject();
}

uint64_t sub_25DF39810()
{
  return swift_deallocObject();
}

uint64_t sub_25DF3983C()
{
  return swift_deallocObject();
}

uint64_t sub_25DF39868()
{
  return swift_deallocObject();
}

uint64_t sub_25DF398A8()
{
  return swift_deallocObject();
}

uint64_t sub_25DF398E8()
{
  return swift_deallocObject();
}

uint64_t sub_25DF39928()
{
  return swift_deallocObject();
}

uint64_t sub_25DF39968()
{
  return swift_deallocObject();
}

uint64_t sub_25DF399A8()
{
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #5 in filterUniqueDoseEvents(doseEvents:)()
{
  return implicit closure #5 in filterUniqueDoseEvents(doseEvents:)(*(void *)(v0 + 16));
}

uint64_t sub_25DF399F0()
{
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #6 in filterUniqueDoseEvents(doseEvents:)()
{
  return implicit closure #6 in filterUniqueDoseEvents(doseEvents:)(*(void *)(v0 + 16));
}

uint64_t sub_25DF39A38()
{
  return swift_deallocObject();
}

uint64_t sub_25DF39A64()
{
  return swift_deallocObject();
}

uint64_t sub_25DF39A90()
{
  return swift_deallocObject();
}

uint64_t sub_25DF39AD0()
{
  return swift_deallocObject();
}

uint64_t sub_25DF39B10()
{
  return swift_deallocObject();
}

uint64_t sub_25DF39B3C()
{
  return swift_deallocObject();
}

uint64_t sub_25DF39B68()
{
  return swift_deallocObject();
}

uint64_t sub_25DF39BA8()
{
  return swift_deallocObject();
}

uint64_t sub_25DF39BE8()
{
  return swift_deallocObject();
}

uint64_t sub_25DF39C14()
{
  return swift_deallocObject();
}

uint64_t sub_25DF39C40()
{
  return swift_deallocObject();
}

uint64_t sub_25DF39C80()
{
  return swift_deallocObject();
}

uint64_t sub_25DF39CC0()
{
  return swift_deallocObject();
}

uint64_t sub_25DF39CEC()
{
  return swift_deallocObject();
}

uint64_t sub_25DF39D18()
{
  return swift_deallocObject();
}

uint64_t sub_25DF39D58()
{
  return swift_deallocObject();
}

uint64_t sub_25DF39D98()
{
  return swift_deallocObject();
}

uint64_t sub_25DF39DC4()
{
  return swift_deallocObject();
}

uint64_t sub_25DF39DF0()
{
  return swift_deallocObject();
}

uint64_t sub_25DF39E30()
{
  return swift_deallocObject();
}

unint64_t lazy protocol witness table accessor for type [HKMedicationDoseEventStatus] and conformance [A]()
{
  uint64_t v2 = lazy protocol witness table cache variable for type [HKMedicationDoseEventStatus] and conformance [A];
  if (!lazy protocol witness table cache variable for type [HKMedicationDoseEventStatus] and conformance [A])
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [HKMedicationDoseEventStatus]);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type [HKMedicationDoseEventStatus] and conformance [A]);
    return WitnessTable;
  }
  return v2;
}

char *UndoMedsIntentResponse.__allocating_init(code:userActivity:)(uint64_t a1, void *a2)
{
  id v3 = objc_allocWithZone(v2);
  return UndoMedsIntentResponse.init(code:userActivity:)(a1, a2);
}

id UndoMedsIntent.__allocating_init()()
{
  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id UndoMedsIntent.init()()
{
  id v4 = 0;
  v3.receiver = 0;
  v3.super_class = (Class)type metadata accessor for UndoMedsIntent();
  id v2 = objc_msgSendSuper2(&v3, sel_init);
  id v0 = v2;
  id v4 = v2;

  return v2;
}

id UndoMedsIntent.__allocating_init(coder:)(void *a1)
{
  id v4 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v4;
}

id UndoMedsIntent.init(coder:)(void *a1)
{
  id v8 = 0;
  unint64_t v7 = a1;
  v6.receiver = 0;
  v6.super_class = (Class)type metadata accessor for UndoMedsIntent();
  id v5 = objc_msgSendSuper2(&v6, sel_initWithCoder_, a1);
  if (v5)
  {
    id v1 = v5;
    id v8 = v5;

    return v5;
  }
  else
  {

    return 0;
  }
}

id UndoMedsIntent.__allocating_init(identifier:backingStore:)(uint64_t a1, uint64_t a2, void *a3)
{
  id v11 = objc_allocWithZone(v3);
  if (a2)
  {
    uint64_t v6 = MEMORY[0x2611C8860](a1);
    swift_bridgeObjectRelease();
    unint64_t v7 = (void *)v6;
  }
  else
  {
    unint64_t v7 = 0;
  }
  id v5 = objc_msgSend(v11, sel_initWithIdentifier_backingStore_);

  return v5;
}

id UndoMedsIntent.init(identifier:backingStore:)(uint64_t a1, uint64_t a2, void *a3)
{
  id v15 = 0;
  uint64_t v13 = a1;
  uint64_t v14 = a2;
  uint64_t v12 = a3;
  swift_bridgeObjectRetain();
  if (a2)
  {
    uint64_t v6 = MEMORY[0x2611C8860](a1);
    swift_bridgeObjectRelease();
    unint64_t v7 = (void *)v6;
  }
  else
  {
    unint64_t v7 = 0;
  }
  v11.receiver = 0;
  v11.super_class = (Class)type metadata accessor for UndoMedsIntent();
  id v5 = objc_msgSendSuper2(&v11, sel_initWithIdentifier_backingStore_, v7, a3);

  id v3 = v5;
  id v15 = v5;

  swift_bridgeObjectRelease();
  return v5;
}

id UndoMedsIntent.__allocating_init(domain:verb:parametersByName:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v13 = objc_allocWithZone(v5);
  uint64_t v16 = (void *)MEMORY[0x2611C8860](a1, a2);
  uint64_t v18 = (void *)MEMORY[0x2611C8860](a3, a4);
  if (a5)
  {
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    id v6 = objc_msgSend(v13, sel_initWithDomain_verb_parametersByName_, v16, v18, isa);
  }
  else
  {
    id v6 = objc_msgSend(v13, sel_initWithDomain_verb_parametersByName_, v16, v18, 0);
  }
  id v9 = v6;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v9;
}

id UndoMedsIntent.init(domain:verb:parametersByName:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v23 = 0;
  uint64_t v21 = a1;
  uint64_t v22 = a2;
  uint64_t v19 = a3;
  uint64_t v20 = a4;
  uint64_t v18 = a5;
  swift_bridgeObjectRetain();
  id v12 = (id)MEMORY[0x2611C8860](a1, a2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  id v15 = (void *)MEMORY[0x2611C8860](a3, a4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  if (a5)
  {
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    Class v9 = isa;
  }
  else
  {
    Class v9 = 0;
  }
  v17.receiver = 0;
  v17.super_class = (Class)type metadata accessor for UndoMedsIntent();
  id v7 = objc_msgSendSuper2(&v17, sel_initWithDomain_verb_parametersByName_, v12, v15, v9);

  id v5 = v7;
  id v23 = v7;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return v7;
}

id UndoMedsIntent.__deallocating_deinit()
{
  id v3 = v0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for UndoMedsIntent();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t UndoMedsIntentResponseCode.init(rawValue:)(uint64_t a1)
{
  switch(a1)
  {
    case 0:
      return 0;
    case 1:
      return 1;
    case 2:
      return 2;
    case 3:
      return 3;
    case 4:
      return 4;
    case 5:
      return 5;
    case 6:
      return 6;
    case 100:
      return 100;
  }
  return 0;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance UndoMedsIntentResponseCode()
{
  return == infix<A>(_:_:)() & 1;
}

uint64_t protocol witness for Hashable.hashValue.getter in conformance UndoMedsIntentResponseCode()
{
  return RawRepresentable<>.hashValue.getter();
}

uint64_t protocol witness for Hashable.hash(into:) in conformance UndoMedsIntentResponseCode()
{
  return RawRepresentable<>.hash(into:)();
}

uint64_t protocol witness for Hashable._rawHashValue(seed:) in conformance UndoMedsIntentResponseCode()
{
  return RawRepresentable<>._rawHashValue(seed:)();
}

uint64_t protocol witness for RawRepresentable.init(rawValue:) in conformance UndoMedsIntentResponseCode@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = UndoMedsIntentResponseCode.init(rawValue:)(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v3 & 1;
  return result;
}

void protocol witness for RawRepresentable.rawValue.getter in conformance UndoMedsIntentResponseCode(void *a1@<X8>)
{
  UndoMedsIntentResponseCode.rawValue.getter();
  *a1 = v1;
}

uint64_t UndoMedsIntentResponse.code.getter()
{
  objc_super v2 = (uint64_t *)(v0 + OBJC_IVAR___UndoMedsIntentResponse_code);
  swift_beginAccess();
  uint64_t v3 = *v2;
  swift_endAccess();
  return v3;
}

uint64_t UndoMedsIntentResponse.code.setter(uint64_t a1)
{
  uint64_t v3 = (void *)(v1 + OBJC_IVAR___UndoMedsIntentResponse_code);
  swift_beginAccess();
  *uint64_t v3 = a1;
  return swift_endAccess();
}

uint64_t (*UndoMedsIntentResponse.code.modify())()
{
  return LogQuantityIntentResponse.code.modify;
}

void key path getter for UndoMedsIntentResponse.code : UndoMedsIntentResponse(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v3 = *a1;
  id v2 = *a1;
  *a2 = UndoMedsIntentResponse.code.getter();
}

void key path setter for UndoMedsIntentResponse.code : UndoMedsIntentResponse(uint64_t *a1, id *a2)
{
  uint64_t v4 = *a1;
  id v3 = *a2;
  id v2 = *a2;
  UndoMedsIntentResponse.code.setter(v4);
}

char *UndoMedsIntentResponse.init(code:userActivity:)(uint64_t a1, void *a2)
{
  Class v9 = (char *)objc_msgSend(v10, sel_init);
  id v2 = v9;
  id v3 = v9;
  uint64_t v4 = v9;
  id v6 = &v9[OBJC_IVAR___UndoMedsIntentResponse_code];
  swift_beginAccess();
  *(void *)id v6 = a1;
  swift_endAccess();

  objc_msgSend(v9, sel_setUserActivity_, a2);
  return v9;
}

uint64_t type metadata accessor for UndoMedsIntent()
{
  return self;
}

id UndoMedsIntentResponse.__allocating_init()()
{
  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id UndoMedsIntentResponse.init()()
{
  uint64_t v1 = v0;
  id v6 = v0;
  *(void *)&v0[OBJC_IVAR___UndoMedsIntentResponse_code] = 0;

  v5.receiver = v6;
  v5.super_class = (Class)type metadata accessor for UndoMedsIntentResponse();
  id v4 = objc_msgSendSuper2(&v5, sel_init);
  id v2 = v4;
  id v6 = v4;

  return v4;
}

uint64_t type metadata accessor for UndoMedsIntentResponse()
{
  return self;
}

id UndoMedsIntentResponse.__allocating_init(coder:)(void *a1)
{
  id v4 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v4;
}

id UndoMedsIntentResponse.init(coder:)(void *a1)
{
  Class v9 = a1;
  id v2 = v1;
  id v10 = v1;
  *(void *)&v1[OBJC_IVAR___UndoMedsIntentResponse_code] = 0;

  v8.receiver = v10;
  v8.super_class = (Class)type metadata accessor for UndoMedsIntentResponse();
  id v7 = objc_msgSendSuper2(&v8, sel_initWithCoder_, a1);
  if (v7)
  {
    id v3 = v7;
    id v10 = v7;

    return v7;
  }
  else
  {

    return 0;
  }
}

id UndoMedsIntentResponse.__allocating_init(backingStore:)(void *a1)
{
  id v4 = objc_msgSend(objc_allocWithZone(v1), sel_initWithBackingStore_, a1);

  return v4;
}

id UndoMedsIntentResponse.init(backingStore:)(void *a1)
{
  Class v9 = a1;
  id v2 = v1;
  id v10 = v1;
  *(void *)&v1[OBJC_IVAR___UndoMedsIntentResponse_code] = 0;

  v8.receiver = v10;
  v8.super_class = (Class)type metadata accessor for UndoMedsIntentResponse();
  id v7 = objc_msgSendSuper2(&v8, sel_initWithBackingStore_, a1);
  if (v7)
  {
    id v3 = v7;
    id v10 = v7;

    return v7;
  }
  else
  {

    return 0;
  }
}

id UndoMedsIntentResponse.__allocating_init(propertiesByName:)(uint64_t a1)
{
  id v8 = objc_allocWithZone(v1);
  if (a1)
  {
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    id v2 = objc_msgSend(v8, sel_initWithPropertiesByName_, isa);
  }
  else
  {
    id v2 = objc_msgSend(v8, sel_initWithPropertiesByName_, 0);
  }
  id v5 = v2;

  return v5;
}

id UndoMedsIntentResponse.init(propertiesByName:)(uint64_t a1)
{
  uint64_t v11 = a1;
  id v2 = v1;
  id v12 = v1;
  *(void *)&v1[OBJC_IVAR___UndoMedsIntentResponse_code] = 0;

  swift_bridgeObjectRetain();
  if (a1)
  {
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    Class v8 = isa;
  }
  else
  {
    Class v8 = 0;
  }
  v10.receiver = v12;
  v10.super_class = (Class)type metadata accessor for UndoMedsIntentResponse();
  id v6 = objc_msgSendSuper2(&v10, sel_initWithPropertiesByName_, v8);

  if (v6)
  {
    id v3 = v6;
    id v12 = v6;
    swift_bridgeObjectRelease();

    return v6;
  }
  else
  {

    swift_bridgeObjectRelease();
    return 0;
  }
}

id UndoMedsIntentResponse.__deallocating_deinit()
{
  id v3 = v0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for UndoMedsIntentResponse();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t base witness table accessor for Equatable in UndoMedsIntentResponseCode()
{
  return lazy protocol witness table accessor for type UndoMedsIntentResponseCode and conformance UndoMedsIntentResponseCode();
}

unint64_t lazy protocol witness table accessor for type UndoMedsIntentResponseCode and conformance UndoMedsIntentResponseCode()
{
  uint64_t v2 = lazy protocol witness table cache variable for type UndoMedsIntentResponseCode and conformance UndoMedsIntentResponseCode;
  if (!lazy protocol witness table cache variable for type UndoMedsIntentResponseCode and conformance UndoMedsIntentResponseCode)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type UndoMedsIntentResponseCode and conformance UndoMedsIntentResponseCode);
    return WitnessTable;
  }
  return v2;
}

{
  unint64_t WitnessTable;
  uint64_t v2;

  uint64_t v2 = lazy protocol witness table cache variable for type UndoMedsIntentResponseCode and conformance UndoMedsIntentResponseCode;
  if (!lazy protocol witness table cache variable for type UndoMedsIntentResponseCode and conformance UndoMedsIntentResponseCode)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type UndoMedsIntentResponseCode and conformance UndoMedsIntentResponseCode);
    return WitnessTable;
  }
  return v2;
}

void sub_25DF3B750(id *a1@<X0>, uint64_t *a2@<X8>)
{
}

void sub_25DF3B768(uint64_t *a1, id *a2)
{
}

ValueMetadata *type metadata accessor for UndoMedsIntentResponseCode()
{
  return &type metadata for UndoMedsIntentResponseCode;
}

uint64_t Calendar.dateInterval(for:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v109 = a3;
  uint64_t v177 = a1;
  uint64_t v176 = a2;
  uint64_t v148 = 0;
  unint64_t v110 = partial apply for implicit closure #1 in Calendar.dateInterval(for:);
  uint64_t v111 = partial apply for implicit closure #1 in Calendar.dateInterval(for:);
  unint64_t v112 = _s2os18OSLogInterpolationV06appendC0_5align7privacyyxyXA_AA0B15StringAlignmentVAA0B7PrivacyVts06CustomG11ConvertibleRzlFSSycfu_TA_4;
  uint64_t v113 = partial apply for implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:);
  uint64_t v114 = _s2os18OSLogInterpolationV06appendC0_5align7privacyyxyXA_AA0B15StringAlignmentVAA0B7PrivacyVts06CustomG11ConvertibleRzlFSSycfu_TA_4;
  uint64_t v115 = partial apply for implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:);
  uint64_t v116 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
  uint64_t v117 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
  uint64_t v118 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
  unint64_t v119 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
  uint64_t v120 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
  uint64_t v121 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
  uint64_t v195 = 0;
  uint64_t v194 = 0;
  uint64_t v193 = 0;
  id v192 = 0;
  uint64_t v191 = 0;
  uint64_t v189 = 0;
  uint64_t v190 = 0;
  uint64_t v188 = 0;
  uint64_t v122 = 0;
  uint64_t v123 = type metadata accessor for Logger();
  uint64_t v124 = *(void *)(v123 - 8);
  uint64_t v125 = v123 - 8;
  unint64_t v126 = (*(void *)(v124 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](0);
  uint64_t v127 = (char *)v48 - v126;
  uint64_t v128 = type metadata accessor for DateInterval();
  uint64_t v129 = *(void *)(v128 - 8);
  uint64_t v130 = v128 - 8;
  unint64_t v131 = (*(void *)(v129 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v128);
  uint64_t v132 = (char *)v48 - v131;
  uint64_t v195 = (char *)v48 - v131;
  unint64_t v133 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?)
                                - 8)
                    + 64)
        + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v3 = MEMORY[0x270FA5388](v148);
  uint64_t v134 = (uint64_t)v48 - v133;
  unint64_t v135 = (v4 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v3);
  uint64_t v136 = (uint64_t)v48 - v135;
  uint64_t v137 = type metadata accessor for Date();
  uint64_t v138 = *(void **)(v137 - 8);
  uint64_t v139 = v137 - 8;
  unint64_t v140 = (v138[8] + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v5 = MEMORY[0x270FA5388](v148);
  int v141 = (char *)v48 - v140;
  unint64_t v142 = (v6 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v143 = (char *)v48 - v142;
  unint64_t v144 = (v8 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v145 = (char *)v48 - v144;
  uint64_t v194 = (char *)v48 - v144;
  unint64_t v146 = (v10 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v9);
  uint64_t v147 = (char *)v48 - v146;
  uint64_t v193 = (char *)v48 - v146;
  uint64_t v161 = type metadata accessor for Calendar();
  uint64_t v159 = *(void **)(v161 - 8);
  uint64_t v160 = v161 - 8;
  unint64_t v149 = (v159[8] + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v148);
  uint64_t v11 = (char *)v48 - v149;
  id v162 = (char *)v48 - v149;
  uint64_t v171 = type metadata accessor for DateComponents();
  id v167 = *(void **)(v171 - 8);
  uint64_t v168 = v171 - 8;
  uint64_t v150 = v167;
  uint64_t v154 = v167[8];
  unint64_t v151 = (v154 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v12 = MEMORY[0x270FA5388](v177);
  uint64_t v152 = (char *)v48 - v151;
  id v192 = (char *)v48 - v151;
  unint64_t v153 = (v154 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v13 = MEMORY[0x270FA5388](v12);
  uint64_t v170 = (char *)v48 - v153;
  unint64_t v155 = (v154 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v14 = MEMORY[0x270FA5388](v13);
  uint64_t v169 = (char *)v48 - v155;
  uint64_t v191 = (char *)v48 - v155;
  uint64_t v189 = v14;
  uint64_t v190 = v15;
  uint64_t v188 = v16;
  unint64_t v175 = 0x263EFF000uLL;
  id v165 = self;
  uint64_t v157 = (void (*)(char *, uint64_t, uint64_t))v159[2];
  uint64_t v158 = v159 + 2;
  v157(v11, v156, v161);
  Class isa = Calendar._bridgeToObjectiveC()().super.isa;
  uint64_t v163 = (void (*)(char *, uint64_t))v159[1];
  uint64_t v164 = v159 + 1;
  v163(v162, v161);
  id v174 = objc_msgSend(v165, sel_hk_componentsWithDayIndex_calendar_, v177, isa);

  static DateComponents._unconditionallyBridgeFromObjectiveC(_:)();
  int v172 = (void (*)(char *, char *, uint64_t))v167[4];
  uint64_t v173 = v167 + 4;
  v172(v169, v170, v171);

  objc_super v17 = self;
  uint64_t result = v177;
  id v178 = v17;
  uint64_t v179 = v177 + v176;
  if (__OFADD__(v177, v176))
  {
    __break(1u);
  }
  else
  {
    v157(v162, v156, v161);
    Class v105 = Calendar._bridgeToObjectiveC()().super.isa;
    v163(v162, v161);
    id v106 = objc_msgSend(v178, sel_hk_componentsWithDayIndex_calendar_, v179, v105);

    static DateComponents._unconditionallyBridgeFromObjectiveC(_:)();
    v172(v152, v170, v171);

    Calendar.date(from:)();
    uint64_t v107 = (unsigned int (*)(uint64_t, uint64_t, uint64_t))v138[6];
    unint64_t v108 = v138 + 6;
    if (v107(v136, 1, v137) == 1)
    {
      outlined destroy of Date?(v136);
    }
    else
    {
      uint64_t v103 = (void (*)(char *, uint64_t, uint64_t))v138[4];
      id v104 = v138 + 4;
      v103(v147, v136, v137);
      Calendar.date(from:)();
      if (v107(v134, 1, v137) != 1)
      {
        v103(v145, v134, v137);
        id v98 = (void (*)(char *, char *, uint64_t))v138[2];
        uint64_t v97 = v138 + 2;
        v98(v143, v147, v137);
        v98(v141, v145, v137);
        DateInterval.init(start:end:)();
        (*(void (**)(uint64_t, char *, uint64_t))(v129 + 16))(v109, v132, v128);
        (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v129 + 56))(v109, 0, 1, v128);
        (*(void (**)(char *, uint64_t))(v129 + 8))(v132, v128);
        uint64_t v100 = (void (*)(char *, uint64_t))v138[1];
        uint64_t v99 = v138 + 1;
        v100(v145, v137);
        v100(v147, v137);
        uint64_t v102 = (void (*)(char *, uint64_t))v167[1];
        uint64_t v101 = v167 + 1;
        v102(v152, v171);
        return ((uint64_t (*)(char *, uint64_t))v102)(v169, v171);
      }
      outlined destroy of Date?(v134);
      ((void (*)(char *, uint64_t))v138[1])(v147, v137);
    }
    uint64_t v20 = v127;
    uint64_t v63 = Logger.wellnessIntents.unsafeMutableAddressor();
    uint32_t v64 = &v187;
    uint64_t v82 = 32;
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v124 + 16))(v20, v63, v123);
    swift_endAccess();
    char v65 = v150;
    uint64_t v69 = (void (*)(char *, char *, uint64_t))v167[2];
    uint64_t v68 = v167 + 2;
    v69(v170, v169, v171);
    uint64_t v70 = *((unsigned int *)v65 + 20);
    unint64_t v66 = (v70 + 16) & ~(unint64_t)v70;
    uint64_t v83 = 7;
    uint64_t v67 = swift_allocObject();
    v172((char *)(v67 + v66), v170, v171);
    swift_retain();
    uint64_t v21 = swift_allocObject();
    uint64_t v22 = v67;
    uint64_t v77 = v21;
    *(void *)(v21 + 16) = v110;
    *(void *)(v21 + 24) = v22;
    swift_release();
    v69(v170, v152, v171);
    unint64_t v71 = (v70 + 16) & ~(unint64_t)v70;
    uint64_t v72 = swift_allocObject();
    v172((char *)(v72 + v71), v170, v171);
    swift_retain();
    uint64_t v23 = swift_allocObject();
    uint64_t v24 = v72;
    uint64_t v84 = v23;
    *(void *)(v23 + 16) = v111;
    *(void *)(v23 + 24) = v24;
    swift_release();
    uint64_t v95 = Logger.logObject.getter();
    int v96 = static os_log_type_t.error.getter();
    uint64_t v75 = &v185;
    uint64_t v185 = 22;
    unint64_t v73 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    unint64_t v74 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    lazy protocol witness table accessor for type Int and conformance Int();
    UnsignedInteger<>.init<A>(_:)();
    uint32_t v76 = v186;
    uint64_t v80 = 17;
    uint64_t v86 = swift_allocObject();
    int v79 = 32;
    *(unsigned char *)(v86 + 16) = 32;
    uint64_t v87 = swift_allocObject();
    int v81 = 8;
    *(unsigned char *)(v87 + 16) = 8;
    uint64_t v25 = swift_allocObject();
    uint64_t v26 = v77;
    uint64_t v78 = v25;
    *(void *)(v25 + 16) = v112;
    *(void *)(v25 + 24) = v26;
    uint64_t v27 = swift_allocObject();
    uint64_t v28 = v78;
    uint64_t v88 = v27;
    *(void *)(v27 + 16) = v113;
    *(void *)(v27 + 24) = v28;
    uint64_t v89 = swift_allocObject();
    *(unsigned char *)(v89 + 16) = v79;
    uint64_t v90 = swift_allocObject();
    *(unsigned char *)(v90 + 16) = v81;
    uint64_t v29 = swift_allocObject();
    uint64_t v30 = v84;
    uint64_t v85 = v29;
    *(void *)(v29 + 16) = v114;
    *(void *)(v29 + 24) = v30;
    uint64_t v31 = swift_allocObject();
    uint64_t v32 = v85;
    uint64_t v92 = v31;
    *(void *)(v31 + 16) = v115;
    *(void *)(v31 + 24) = v32;
    uint64_t v94 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
    uint64_t v91 = _allocateUninitializedArray<A>(_:)();
    uint64_t v93 = v33;
    swift_retain();
    uint64_t v34 = v86;
    uint64_t v35 = v93;
    *uint64_t v93 = v116;
    v35[1] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v34;
    swift_retain();
    uint64_t v36 = v87;
    int v37 = v93;
    v93[2] = v117;
    v37[3] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v36;
    swift_retain();
    uint64_t v38 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v88;
    uint64_t v39 = v93;
    v93[4] = v118;
    v39[5] = v38;
    swift_retain();
    uint64_t v40 = v89;
    uint64_t v41 = v93;
    v93[6] = v119;
    v41[7] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v40;
    swift_retain();
    uint64_t v42 = v90;
    uint64_t v43 = v93;
    v93[8] = v120;
    v43[9] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v42;
    swift_retain();
    uint64_t v44 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v92;
    uint64_t v45 = v93;
    v93[10] = v121;
    v45[11] = v44;
    _finalizeUninitializedArray<A>(_:)();
    swift_bridgeObjectRelease();
    if (os_log_type_enabled(v95, (os_log_type_t)v96))
    {
      uint64_t v46 = v122;
      uint64_t v55 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
      uint64_t v54 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      uint64_t v56 = createStorage<A>(capacity:type:)(0);
      uint64_t v57 = createStorage<A>(capacity:type:)(2);
      uint64_t v59 = &v184;
      uint64_t v184 = v55;
      uint64_t v60 = &v183;
      uint64_t v183 = v56;
      uint64_t v61 = &v182;
      uint64_t v182 = v57;
      unsigned int v58 = 2;
      serialize(_:at:)(2, &v184);
      serialize(_:at:)(v58, v59);
      uint64_t v180 = v116;
      uint64_t v181 = v86;
      closure #1 in osLogInternal(_:log:type:)(&v180, (uint64_t)v59, (uint64_t)v60, (uint64_t)v61);
      uint64_t v62 = v46;
      if (v46)
      {
        __break(1u);
      }
      else
      {
        uint64_t v180 = v117;
        uint64_t v181 = v87;
        closure #1 in osLogInternal(_:log:type:)(&v180, (uint64_t)&v184, (uint64_t)&v183, (uint64_t)&v182);
        uint64_t v53 = 0;
        uint64_t v47 = v53;
        uint64_t v180 = v118;
        uint64_t v181 = v88;
        closure #1 in osLogInternal(_:log:type:)(&v180, (uint64_t)&v184, (uint64_t)&v183, (uint64_t)&v182);
        uint64_t v52 = v47;
        uint64_t v180 = v119;
        uint64_t v181 = v89;
        closure #1 in osLogInternal(_:log:type:)(&v180, (uint64_t)&v184, (uint64_t)&v183, (uint64_t)&v182);
        uint64_t v51 = 0;
        uint64_t v180 = v120;
        uint64_t v181 = v90;
        closure #1 in osLogInternal(_:log:type:)(&v180, (uint64_t)&v184, (uint64_t)&v183, (uint64_t)&v182);
        uint64_t v50 = 0;
        uint64_t v180 = v121;
        uint64_t v181 = v92;
        closure #1 in osLogInternal(_:log:type:)(&v180, (uint64_t)&v184, (uint64_t)&v183, (uint64_t)&v182);
        _os_log_impl(&dword_25DE00000, v95, (os_log_type_t)v96, "Failed to convert HKDayIndexRange into a valid date interval. Start: %s End: %s", v55, v76);
        destroyStorage<A>(_:count:)(v56, 0, v54);
        destroyStorage<A>(_:count:)(v57, 2, MEMORY[0x263F8EE58] + 8);
        MEMORY[0x2611C8D90](v55, MEMORY[0x263F8E778]);
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
      }
    }
    else
    {
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
    }

    (*(void (**)(char *, uint64_t))(v124 + 8))(v127, v123);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v129 + 56))(v109, 1, 1, v128);
    uint64_t v49 = (void (*)(char *, uint64_t))v167[1];
    v48[1] = v167 + 1;
    v49(v152, v171);
    return ((uint64_t (*)(char *, uint64_t))v49)(v169, v171);
  }
  return result;
}

uint64_t MenstrualCycleAnalysis.init(_:calendar:)(void *a1, uint64_t a2)
{
  id v69 = a1;
  uint64_t v60 = a2;
  uint64_t v75 = partial apply for implicit closure #3 in LogQuantityIntentHandler.handle(intent:);
  int v79 = partial apply for implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:);
  int v81 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
  uint64_t v83 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
  uint64_t v86 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
  uint64_t v57 = partial apply for implicit closure #2 in MenstrualCycleAnalysis.init(_:calendar:);
  unsigned int v58 = partial apply for thunk for @callee_guaranteed (@unowned HKDayIndexRange) -> (@out DateInterval?, @error @owned Error);
  uint64_t v102 = 0;
  uint64_t v101 = 0;
  uint64_t v100 = 0;
  uint64_t v63 = 0;
  uint64_t v59 = 0;
  uint64_t v67 = type metadata accessor for Logger();
  uint64_t v64 = *(void *)(v67 - 8);
  uint64_t v65 = v67 - 8;
  unint64_t v61 = (*(void *)(v64 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v69);
  uint64_t v2 = (char *)v28 - v61;
  uint64_t v62 = (char *)v28 - v61;
  uint64_t v101 = v3;
  uint64_t v100 = v4;
  uint64_t v66 = Logger.wellnessIntents.unsafeMutableAddressor();
  uint64_t v68 = &v99;
  uint64_t v76 = 32;
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v64 + 16))(v2, v66, v67);
  swift_endAccess();
  id v5 = v69;
  uint64_t v77 = 7;
  uint64_t v78 = swift_allocObject();
  *(void *)(v78 + 16) = v69;
  uint64_t v90 = Logger.logObject.getter();
  int v91 = static os_log_type_t.debug.getter();
  uint64_t v72 = &v97;
  uint64_t v97 = 12;
  unint64_t v70 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  unint64_t v71 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  lazy protocol witness table accessor for type Int and conformance Int();
  UnsignedInteger<>.init<A>(_:)();
  uint32_t v73 = v98;
  uint64_t v74 = 17;
  uint64_t v82 = swift_allocObject();
  *(unsigned char *)(v82 + 16) = 64;
  uint64_t v84 = swift_allocObject();
  *(unsigned char *)(v84 + 16) = 8;
  uint64_t v6 = swift_allocObject();
  uint64_t v7 = v78;
  uint64_t v80 = v6;
  *(void *)(v6 + 16) = v75;
  *(void *)(v6 + 24) = v7;
  uint64_t v8 = swift_allocObject();
  uint64_t v9 = v80;
  uint64_t v87 = v8;
  *(void *)(v8 + 16) = v79;
  *(void *)(v8 + 24) = v9;
  uint64_t v89 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
  uint64_t v85 = _allocateUninitializedArray<A>(_:)();
  uint64_t v88 = v10;
  swift_retain();
  uint64_t v11 = v82;
  uint64_t v12 = v88;
  *uint64_t v88 = v81;
  v12[1] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v11;
  swift_retain();
  uint64_t v13 = v84;
  uint64_t v14 = v88;
  v88[2] = v83;
  v14[3] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v13;
  swift_retain();
  uint64_t v15 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v87;
  uint64_t v16 = v88;
  v88[4] = v86;
  v16[5] = v15;
  _finalizeUninitializedArray<A>(_:)();
  swift_bridgeObjectRelease();
  if (os_log_type_enabled(v90, (os_log_type_t)v91))
  {
    uint64_t v17 = v59;
    uint64_t v50 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
    uint64_t v49 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    uint64_t v51 = createStorage<A>(capacity:type:)(1);
    uint64_t v52 = createStorage<A>(capacity:type:)(0);
    uint64_t v53 = v96;
    v96[0] = v50;
    uint64_t v54 = &v95;
    uint64_t v95 = v51;
    uint64_t v55 = &v94;
    uint64_t v94 = v52;
    serialize(_:at:)(2, v96);
    serialize(_:at:)(1, v53);
    uint64_t v92 = v81;
    uint64_t v93 = v82;
    closure #1 in osLogInternal(_:log:type:)(&v92, (uint64_t)v53, (uint64_t)v54, (uint64_t)v55);
    uint64_t v56 = v17;
    if (v17)
    {
      __break(1u);
    }
    else
    {
      uint64_t v92 = v83;
      uint64_t v93 = v84;
      closure #1 in osLogInternal(_:log:type:)(&v92, (uint64_t)v96, (uint64_t)&v95, (uint64_t)&v94);
      uint64_t v46 = 0;
      uint64_t v19 = v46;
      uint64_t v92 = v86;
      uint64_t v93 = v87;
      closure #1 in osLogInternal(_:log:type:)(&v92, (uint64_t)v96, (uint64_t)&v95, (uint64_t)&v94);
      uint64_t v45 = v19;
      _os_log_impl(&dword_25DE00000, v90, (os_log_type_t)v91, "%@", v50, v73);
      destroyStorage<A>(_:count:)(v51, 1, v49);
      destroyStorage<A>(_:count:)(v52, 0, MEMORY[0x263F8EE58] + 8);
      MEMORY[0x2611C8D90](v50, MEMORY[0x263F8E778]);
      swift_release();
      swift_release();
      swift_release();
      uint64_t v47 = v45;
    }
  }
  else
  {
    uint64_t v18 = v59;
    swift_release();
    swift_release();
    swift_release();
    uint64_t v47 = v18;
  }
  uint64_t v20 = v47;

  (*(void (**)(char *, uint64_t))(v64 + 8))(v62, v67);
  id v38 = objc_msgSend(v69, sel_menstruationProjections);
  uint64_t v39 = 0;
  type metadata accessor for HKMCProjection();
  v96[2] = (unsigned char *)static Array._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t KeyPath = swift_getKeyPath();
  swift_retain();
  uint64_t v41 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [HKMCProjection]);
  uint64_t v42 = type metadata accessor for HKDayIndexRange();
  unint64_t v21 = lazy protocol witness table accessor for type [HKMCProjection] and conformance [A]();
  uint64_t result = _sSlsE3mapySayqd__Gqd__7ElementQzqd_0_YKXEqd_0_YKs5ErrorRd_0_r0_lF((void (*)(char *, char *))v57, KeyPath, v41, v42, MEMORY[0x263F8E628], v21, MEMORY[0x263F8E658], v48);
  uint64_t v43 = v20;
  uint64_t v44 = (unsigned char *)result;
  if (v20)
  {
    __break(1u);
    __break(1u);
  }
  else
  {
    uint64_t v30 = v44;
    swift_release();
    swift_release();
    outlined destroy of [HKQuantityType]();

    v96[1] = v30;
    uint64_t v31 = implicit closure #3 in MenstrualCycleAnalysis.init(_:calendar:)(v60);
    uint64_t v32 = v23;
    swift_retain();
    id v33 = v28;
    MEMORY[0x270FA5388](v31);
    uint64_t v24 = &v28[-4];
    uint64_t v34 = &v28[-4];
    v24[2] = v25;
    v24[3] = v26;
    uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [HKDayIndexRange]);
    uint64_t v36 = type metadata accessor for DateInterval();
    lazy protocol witness table accessor for type [HKDayIndexRange] and conformance [A]();
    uint64_t v37 = Sequence.compactMap<A>(_:)();
    uint64_t v29 = v37;
    swift_release();
    swift_release();
    outlined destroy of [HKQuantityType]();
    swift_bridgeObjectRetain();
    v28[1] = &v102;
    uint64_t v102 = v29;
    uint64_t v27 = type metadata accessor for Calendar();
    (*(void (**)(uint64_t))(*(void *)(v27 - 8) + 8))(v60);

    outlined destroy of [HKQuantityType]();
    return v29;
  }
  return result;
}

void key path getter for HKMCProjection.mostLikelyDays : HKMCProjection(id *a1@<X0>, void *a2@<X8>)
{
  id v4 = *a1;
  id v2 = *a1;
  *a2 = objc_msgSend(v4, sel_mostLikelyDays);
  a2[1] = v3;
}

uint64_t implicit closure #2 in MenstrualCycleAnalysis.init(_:calendar:)(id *a1)
{
  id v3 = *a1;
  id v1 = *a1;
  swift_retain();
  swift_getAtKeyPath();

  return swift_release();
}

uint64_t (*implicit closure #3 in MenstrualCycleAnalysis.init(_:calendar:)(uint64_t a1))@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4 = a1;
  uint64_t v14 = partial apply for implicit closure #4 in implicit closure #3 in MenstrualCycleAnalysis.init(_:calendar:);
  uint64_t v15 = 0;
  uint64_t v12 = type metadata accessor for Calendar();
  uint64_t v8 = *(void *)(v12 - 8);
  uint64_t v9 = v12 - 8;
  uint64_t v6 = v8;
  uint64_t v7 = *(void *)(v8 + 64);
  unint64_t v5 = (v7 + 15) & 0xFFFFFFFFFFFFFFF0;
  double v1 = MEMORY[0x270FA5388](v12);
  uint64_t v11 = (char *)&v4 - v5;
  uint64_t v15 = v2;
  (*(void (**)(double))(v8 + 16))(v1);
  unint64_t v10 = (*(unsigned __int8 *)(v6 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  uint64_t v13 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v8 + 32))(v13 + v10, v11, v12);
  return v14;
}

uint64_t implicit closure #4 in implicit closure #3 in MenstrualCycleAnalysis.init(_:calendar:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return Calendar.dateInterval(for:)(a1, a2, a3);
}

uint64_t thunk for @callee_guaranteed (@unowned HKDayIndexRange) -> (@out DateInterval?, @error @owned Error)(void *a1, uint64_t (*a2)(void, void))
{
  return a2(*a1, a1[1]);
}

uint64_t MenstrualCycleAnalysis.init(menstruationProjections:)(uint64_t a1)
{
  return a1;
}

uint64_t implicit closure #1 in Calendar.dateInterval(for:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2 = type metadata accessor for DateComponents();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 16))(a2, a1);
}

uint64_t sub_25DF3DEF0()
{
  uint64_t v2 = *(void *)(type metadata accessor for DateComponents() - 8);
  (*(void (**)(unint64_t))(v2 + 8))(v0 + ((*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80)));
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #1 in Calendar.dateInterval(for:)@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = type metadata accessor for DateComponents();
  uint64_t v3 = v1
     + ((*(unsigned __int8 *)(*(void *)(v2 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v2 - 8) + 80));
  return implicit closure #1 in Calendar.dateInterval(for:)(v3, a1);
}

uint64_t sub_25DF3E034()
{
  return swift_deallocObject();
}

uint64_t _s2os18OSLogInterpolationV06appendC0_5align7privacyyxyXA_AA0B15StringAlignmentVAA0B7PrivacyVts06CustomG11ConvertibleRzlFSSycfu_TA_4()
{
  uint64_t v5 = *(void *)(v0 + 16);
  uint64_t v3 = *(void *)(v0 + 24);
  uint64_t v4 = type metadata accessor for DateComponents();
  unint64_t v1 = lazy protocol witness table accessor for type DateComponents and conformance DateComponents();
  return implicit closure #1 in OSLogInterpolation.appendInterpolation<A>(_:align:privacy:)(v5, v3, v4, v1);
}

unint64_t lazy protocol witness table accessor for type DateComponents and conformance DateComponents()
{
  uint64_t v2 = lazy protocol witness table cache variable for type DateComponents and conformance DateComponents;
  if (!lazy protocol witness table cache variable for type DateComponents and conformance DateComponents)
  {
    type metadata accessor for DateComponents();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type DateComponents and conformance DateComponents);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_25DF3E154()
{
  uint64_t v2 = *(void *)(type metadata accessor for DateComponents() - 8);
  (*(void (**)(unint64_t))(v2 + 8))(v0 + ((*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80)));
  return swift_deallocObject();
}

uint64_t sub_25DF3E220()
{
  return swift_deallocObject();
}

uint64_t sub_25DF3E260()
{
  return swift_deallocObject();
}

uint64_t sub_25DF3E28C()
{
  return swift_deallocObject();
}

uint64_t sub_25DF3E2B8()
{
  return swift_deallocObject();
}

uint64_t sub_25DF3E2F8()
{
  return swift_deallocObject();
}

uint64_t sub_25DF3E338()
{
  return swift_deallocObject();
}

uint64_t sub_25DF3E364()
{
  return swift_deallocObject();
}

uint64_t sub_25DF3E390()
{
  return swift_deallocObject();
}

uint64_t sub_25DF3E3D0()
{
  return swift_deallocObject();
}

uint64_t sub_25DF3E410()
{
  return swift_deallocObject();
}

uint64_t sub_25DF3E450()
{
  return swift_deallocObject();
}

uint64_t sub_25DF3E47C()
{
  return swift_deallocObject();
}

uint64_t sub_25DF3E4A8()
{
  return swift_deallocObject();
}

uint64_t sub_25DF3E4E8()
{
  return swift_deallocObject();
}

char *keypath_get_selector_mostLikelyDays()
{
  return sel_mostLikelyDays;
}

void sub_25DF3E534(id *a1@<X0>, void *a2@<X8>)
{
}

uint64_t partial apply for implicit closure #2 in MenstrualCycleAnalysis.init(_:calendar:)(id *a1)
{
  return implicit closure #2 in MenstrualCycleAnalysis.init(_:calendar:)(a1);
}

uint64_t partial apply for thunk for @callee_guaranteed (@unowned HKDayIndexRange) -> (@out DateInterval?, @error @owned Error)(void *a1)
{
  return thunk for @callee_guaranteed (@unowned HKDayIndexRange) -> (@out DateInterval?, @error @owned Error)(a1, *(uint64_t (**)(void, void))(v1 + 16));
}

unint64_t lazy protocol witness table accessor for type [HKDayIndexRange] and conformance [A]()
{
  uint64_t v2 = lazy protocol witness table cache variable for type [HKDayIndexRange] and conformance [A];
  if (!lazy protocol witness table cache variable for type [HKDayIndexRange] and conformance [A])
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [HKDayIndexRange]);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type [HKDayIndexRange] and conformance [A]);
    return WitnessTable;
  }
  return v2;
}

ValueMetadata *type metadata accessor for MenstrualCycleAnalysis()
{
  return &type metadata for MenstrualCycleAnalysis;
}

uint64_t sub_25DF3E6C8()
{
  uint64_t v2 = *(void *)(type metadata accessor for Calendar() - 8);
  (*(void (**)(unint64_t))(v2 + 8))(v0 + ((*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80)));
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #4 in implicit closure #3 in MenstrualCycleAnalysis.init(_:calendar:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  type metadata accessor for Calendar();
  return implicit closure #4 in implicit closure #3 in MenstrualCycleAnalysis.init(_:calendar:)(a1, a2, a3);
}

SiriWellnessIntents::WellnessUnit_optional __swiftcall WellnessUnit.init(rawValue:)(Swift::String rawValue)
{
  uint64_t v1 = _allocateUninitializedArray<A>(_:)();
  *(void *)uint64_t v2 = "kilogram";
  *(void *)(v2 + 8) = 8;
  *(unsigned char *)(v2 + 16) = 2;
  *(void *)(v2 + 24) = "gram";
  *(void *)(v2 + 32) = 4;
  *(unsigned char *)(v2 + 40) = 2;
  *(void *)(v2 + 48) = "pound";
  *(void *)(v2 + 56) = 5;
  *(unsigned char *)(v2 + 64) = 2;
  *(void *)(v2 + 72) = "stone";
  *(void *)(v2 + 80) = 5;
  *(unsigned char *)(v2 + 88) = 2;
  *(void *)(v2 + 96) = "centimeter";
  *(void *)(v2 + 104) = 10;
  *(unsigned char *)(v2 + 112) = 2;
  *(void *)(v2 + 120) = "feet";
  *(void *)(v2 + 128) = 4;
  *(unsigned char *)(v2 + 136) = 2;
  *(void *)(v2 + 144) = "meter";
  *(void *)(v2 + 152) = 5;
  *(unsigned char *)(v2 + 160) = 2;
  *(void *)(v2 + 168) = "inch";
  *(void *)(v2 + 176) = 4;
  *(unsigned char *)(v2 + 184) = 2;
  *(void *)(v2 + 192) = "liter";
  *(void *)(v2 + 200) = 5;
  *(unsigned char *)(v2 + 208) = 2;
  *(void *)(v2 + 216) = "second";
  *(void *)(v2 + 224) = 6;
  *(unsigned char *)(v2 + 232) = 2;
  *(void *)(v2 + 240) = "minute";
  *(void *)(v2 + 248) = 6;
  *(unsigned char *)(v2 + 256) = 2;
  *(void *)(v2 + 264) = "hour";
  *(void *)(v2 + 272) = 4;
  *(unsigned char *)(v2 + 280) = 2;
  *(void *)(v2 + 288) = "celsius";
  *(void *)(v2 + 296) = 7;
  *(unsigned char *)(v2 + 304) = 2;
  *(void *)(v2 + 312) = "fahrenheit";
  *(void *)(v2 + 320) = 10;
  *(unsigned char *)(v2 + 328) = 2;
  *(void *)(v2 + 336) = "mmhg";
  *(void *)(v2 + 344) = 4;
  *(unsigned char *)(v2 + 352) = 2;
  *(void *)(v2 + 360) = "bpm";
  *(void *)(v2 + 368) = 3;
  *(unsigned char *)(v2 + 376) = 2;
  *(void *)(v2 + 384) = "breath_min";
  *(void *)(v2 + 392) = 10;
  *(unsigned char *)(v2 + 400) = 2;
  *(void *)(v2 + 408) = "calories";
  *(void *)(v2 + 416) = 8;
  *(unsigned char *)(v2 + 424) = 2;
  *(void *)(v2 + 432) = "joule";
  *(void *)(v2 + 440) = 5;
  *(unsigned char *)(v2 + 448) = 2;
  *(void *)(v2 + 456) = "kilojoule";
  *(void *)(v2 + 464) = 9;
  *(unsigned char *)(v2 + 472) = 2;
  *(void *)(v2 + 480) = "active_energy";
  *(void *)(v2 + 488) = 13;
  *(unsigned char *)(v2 + 496) = 2;
  *(void *)(v2 + 504) = "resting_energy";
  *(void *)(v2 + 512) = 14;
  *(unsigned char *)(v2 + 520) = 2;
  *(void *)(v2 + 528) = "mgdl";
  *(void *)(v2 + 536) = 4;
  *(unsigned char *)(v2 + 544) = 2;
  *(void *)(v2 + 552) = "mmoll";
  *(void *)(v2 + 560) = 5;
  *(unsigned char *)(v2 + 568) = 2;
  *(void *)(v2 + 576) = "percent";
  *(void *)(v2 + 584) = 7;
  *(unsigned char *)(v2 + 592) = 2;
  *(void *)(v2 + 600) = "miles";
  *(void *)(v2 + 608) = 5;
  *(unsigned char *)(v2 + 616) = 2;
  *(void *)(v2 + 624) = "kilometers";
  *(void *)(v2 + 632) = 10;
  *(unsigned char *)(v2 + 640) = 2;
  *(void *)(v2 + 648) = "steps";
  *(void *)(v2 + 656) = 5;
  *(unsigned char *)(v2 + 664) = 2;
  *(void *)(v2 + 672) = "flights";
  *(void *)(v2 + 680) = 7;
  *(unsigned char *)(v2 + 688) = 2;
  *(void *)(v2 + 696) = "wheelchair_pushes";
  *(void *)(v2 + 704) = 17;
  *(unsigned char *)(v2 + 712) = 2;
  *(void *)(v2 + 720) = "strokes";
  *(void *)(v2 + 728) = 7;
  *(unsigned char *)(v2 + 736) = 2;
  _finalizeUninitializedArray<A>(_:)();
  Swift::Int v6 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)v1, rawValue);
  swift_bridgeObjectRelease();
  switch(v6)
  {
    case 0:
      v7.value = SiriWellnessIntents_WellnessUnit_kilogram;
LABEL_64:
      swift_bridgeObjectRelease();
      return v7;
    case 1:
      v7.value = SiriWellnessIntents_WellnessUnit_gram;
      goto LABEL_64;
    case 2:
      v7.value = SiriWellnessIntents_WellnessUnit_pound;
      goto LABEL_64;
    case 3:
      v7.value = SiriWellnessIntents_WellnessUnit_stone;
      goto LABEL_64;
    case 4:
      v7.value = SiriWellnessIntents_WellnessUnit_centimeter;
      goto LABEL_64;
    case 5:
      v7.value = SiriWellnessIntents_WellnessUnit_feet;
      goto LABEL_64;
    case 6:
      v7.value = SiriWellnessIntents_WellnessUnit_meter;
      goto LABEL_64;
    case 7:
      v7.value = SiriWellnessIntents_WellnessUnit_inch;
      goto LABEL_64;
    case 8:
      v7.value = SiriWellnessIntents_WellnessUnit_liter;
      goto LABEL_64;
    case 9:
      v7.value = SiriWellnessIntents_WellnessUnit_second;
      goto LABEL_64;
    case 10:
      v7.value = SiriWellnessIntents_WellnessUnit_minute;
      goto LABEL_64;
    case 11:
      v7.value = SiriWellnessIntents_WellnessUnit_hour;
      goto LABEL_64;
    case 12:
      v7.value = SiriWellnessIntents_WellnessUnit_celsius;
      goto LABEL_64;
    case 13:
      v7.value = SiriWellnessIntents_WellnessUnit_fahrenheit;
      goto LABEL_64;
    case 14:
      v7.value = SiriWellnessIntents_WellnessUnit_mmhg;
      goto LABEL_64;
    case 15:
      v7.value = SiriWellnessIntents_WellnessUnit_bpm;
      goto LABEL_64;
    case 16:
      v7.value = SiriWellnessIntents_WellnessUnit_breath_min;
      goto LABEL_64;
    case 17:
      v7.value = SiriWellnessIntents_WellnessUnit_calories;
      goto LABEL_64;
    case 18:
      v7.value = SiriWellnessIntents_WellnessUnit_joule;
      goto LABEL_64;
    case 19:
      v7.value = SiriWellnessIntents_WellnessUnit_kilojoule;
      goto LABEL_64;
    case 20:
      v7.value = SiriWellnessIntents_WellnessUnit_active_energy;
      goto LABEL_64;
    case 21:
      v7.value = SiriWellnessIntents_WellnessUnit_resting_energy;
      goto LABEL_64;
    case 22:
      v7.value = SiriWellnessIntents_WellnessUnit_mgdl;
      goto LABEL_64;
    case 23:
      v7.value = SiriWellnessIntents_WellnessUnit_mmoll;
      goto LABEL_64;
    case 24:
      v7.value = SiriWellnessIntents_WellnessUnit_percent;
      goto LABEL_64;
    case 25:
      v7.value = SiriWellnessIntents_WellnessUnit_miles;
      goto LABEL_64;
    case 26:
      v7.value = SiriWellnessIntents_WellnessUnit_kilometers;
      goto LABEL_64;
    case 27:
      v7.value = SiriWellnessIntents_WellnessUnit_steps;
      goto LABEL_64;
    case 28:
      v7.value = SiriWellnessIntents_WellnessUnit_flights;
      goto LABEL_64;
    case 29:
      v7.value = SiriWellnessIntents_WellnessUnit_wheelchair_pushes;
      goto LABEL_64;
    case 30:
      v7.value = SiriWellnessIntents_WellnessUnit_strokes;
      goto LABEL_64;
  }
  swift_bridgeObjectRelease();
  return (SiriWellnessIntents::WellnessUnit_optional)31;
}

uint64_t WellnessUnit.rawValue.getter(char a1)
{
  switch(a1)
  {
    case 1:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("gram", 4uLL, 1)._countAndFlagsBits;
      break;
    case 2:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("pound", 5uLL, 1)._countAndFlagsBits;
      break;
    case 3:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("stone", 5uLL, 1)._countAndFlagsBits;
      break;
    case 4:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("centimeter", 0xAuLL, 1)._countAndFlagsBits;
      break;
    case 5:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("feet", 4uLL, 1)._countAndFlagsBits;
      break;
    case 6:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("meter", 5uLL, 1)._countAndFlagsBits;
      break;
    case 7:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("inch", 4uLL, 1)._countAndFlagsBits;
      break;
    case 8:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("liter", 5uLL, 1)._countAndFlagsBits;
      break;
    case 9:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("second", 6uLL, 1)._countAndFlagsBits;
      break;
    case 10:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("minute", 6uLL, 1)._countAndFlagsBits;
      break;
    case 11:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("hour", 4uLL, 1)._countAndFlagsBits;
      break;
    case 12:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("celsius", 7uLL, 1)._countAndFlagsBits;
      break;
    case 13:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("fahrenheit", 0xAuLL, 1)._countAndFlagsBits;
      break;
    case 14:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("mmhg", 4uLL, 1)._countAndFlagsBits;
      break;
    case 15:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("bpm", 3uLL, 1)._countAndFlagsBits;
      break;
    case 16:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("breath_min", 0xAuLL, 1)._countAndFlagsBits;
      break;
    case 17:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("calories", 8uLL, 1)._countAndFlagsBits;
      break;
    case 18:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("joule", 5uLL, 1)._countAndFlagsBits;
      break;
    case 19:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("kilojoule", 9uLL, 1)._countAndFlagsBits;
      break;
    case 20:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("active_energy", 0xDuLL, 1)._countAndFlagsBits;
      break;
    case 21:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("resting_energy", 0xEuLL, 1)._countAndFlagsBits;
      break;
    case 22:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("mgdl", 4uLL, 1)._countAndFlagsBits;
      break;
    case 23:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("mmoll", 5uLL, 1)._countAndFlagsBits;
      break;
    case 24:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("percent", 7uLL, 1)._countAndFlagsBits;
      break;
    case 25:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("miles", 5uLL, 1)._countAndFlagsBits;
      break;
    case 26:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("kilometers", 0xAuLL, 1)._countAndFlagsBits;
      break;
    case 27:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("steps", 5uLL, 1)._countAndFlagsBits;
      break;
    case 28:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("flights", 7uLL, 1)._countAndFlagsBits;
      break;
    case 29:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("wheelchair_pushes", 0x11uLL, 1)._countAndFlagsBits;
      break;
    case 30:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("strokes", 7uLL, 1)._countAndFlagsBits;
      break;
    default:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("kilogram", 8uLL, 1)._countAndFlagsBits;
      break;
  }
  return countAndFlagsBits;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance WellnessUnit()
{
  return == infix<A>(_:_:)() & 1;
}

unint64_t base witness table accessor for Equatable in WellnessUnit()
{
  return lazy protocol witness table accessor for type WellnessUnit and conformance WellnessUnit();
}

unint64_t lazy protocol witness table accessor for type WellnessUnit and conformance WellnessUnit()
{
  uint64_t v2 = lazy protocol witness table cache variable for type WellnessUnit and conformance WellnessUnit;
  if (!lazy protocol witness table cache variable for type WellnessUnit and conformance WellnessUnit)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type WellnessUnit and conformance WellnessUnit);
    return WitnessTable;
  }
  return v2;
}

{
  unint64_t WitnessTable;
  uint64_t v2;

  uint64_t v2 = lazy protocol witness table cache variable for type WellnessUnit and conformance WellnessUnit;
  if (!lazy protocol witness table cache variable for type WellnessUnit and conformance WellnessUnit)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type WellnessUnit and conformance WellnessUnit);
    return WitnessTable;
  }
  return v2;
}

uint64_t protocol witness for Hashable.hashValue.getter in conformance WellnessUnit()
{
  return RawRepresentable<>.hashValue.getter();
}

uint64_t protocol witness for Hashable.hash(into:) in conformance WellnessUnit()
{
  return RawRepresentable<>.hash(into:)();
}

uint64_t protocol witness for Hashable._rawHashValue(seed:) in conformance WellnessUnit()
{
  return RawRepresentable<>._rawHashValue(seed:)();
}

SiriWellnessIntents::WellnessUnit_optional protocol witness for RawRepresentable.init(rawValue:) in conformance WellnessUnit@<W0>(Swift::String *a1@<X0>, SiriWellnessIntents::WellnessUnit_optional *a2@<X8>)
{
  result.value = WellnessUnit.init(rawValue:)(*a1).value;
  a2->value = result.value;
  return result;
}

uint64_t protocol witness for RawRepresentable.rawValue.getter in conformance WellnessUnit@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = WellnessUnit.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t getEnumTagSinglePayload for WellnessUnit(unsigned __int8 *a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 <= 0xE1) {
      goto LABEL_15;
    }
    unsigned int v7 = ((a2 + 30) >> 8) + 1;
    int v8 = 1;
    if (v7 >= 0x100)
    {
      if (v7 >= 0x10000) {
        int v2 = 4;
      }
      else {
        int v2 = 2;
      }
      int v8 = v2;
    }
    if (v8 == 1) {
      int v6 = a1[1];
    }
    else {
      int v6 = v8 == 2 ? *(unsigned __int16 *)(a1 + 1) : *(_DWORD *)(a1 + 1);
    }
    if (v6)
    {
      int v5 = (*a1 | ((v6 - 1) << 8)) + 225;
    }
    else
    {
LABEL_15:
      int v3 = *a1 - 31;
      if (v3 < 0) {
        int v3 = -1;
      }
      int v5 = v3;
    }
  }
  else
  {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for WellnessUnit(unsigned char *result, unsigned int a2, unsigned int a3)
{
  int v7 = 0;
  if (a3 > 0xE1)
  {
    unsigned int v5 = ((a3 + 30) >> 8) + 1;
    int v6 = 1;
    if (v5 >= 0x100)
    {
      if (v5 >= 0x10000) {
        int v3 = 4;
      }
      else {
        int v3 = 2;
      }
      int v6 = v3;
    }
    int v7 = v6;
  }
  if (a2 > 0xE1)
  {
    unsigned int v4 = ((a2 - 226) >> 8) + 1;
    *uint64_t result = a2 + 30;
    if (v7)
    {
      if (v7 == 1)
      {
        result[1] = v4;
      }
      else if (v7 == 2)
      {
        *(_WORD *)(result + 1) = v4;
      }
      else
      {
        *(_DWORD *)(result + 1) = v4;
      }
    }
  }
  else
  {
    if (v7)
    {
      if (v7 == 1)
      {
        result[1] = 0;
      }
      else if (v7 == 2)
      {
        *(_WORD *)(result + 1) = 0;
      }
      else
      {
        *(_DWORD *)(result + 1) = 0;
      }
    }
    if (a2) {
      *uint64_t result = a2 + 30;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for WellnessUnit()
{
  return &type metadata for WellnessUnit;
}

SiriWellnessIntents::WellnessValue_optional __swiftcall WellnessValue.init(rawValue:)(Swift::String rawValue)
{
  uint64_t v1 = _allocateUninitializedArray<A>(_:)();
  *(void *)uint64_t v2 = "dry";
  *(void *)(v2 + 8) = 3;
  *(unsigned char *)(v2 + 16) = 2;
  *(void *)(v2 + 24) = "sticky";
  *(void *)(v2 + 32) = 6;
  *(unsigned char *)(v2 + 40) = 2;
  *(void *)(v2 + 48) = "creamy";
  *(void *)(v2 + 56) = 6;
  *(unsigned char *)(v2 + 64) = 2;
  *(void *)(v2 + 72) = "watery";
  *(void *)(v2 + 80) = 6;
  *(unsigned char *)(v2 + 88) = 2;
  *(void *)(v2 + 96) = "egg_white";
  *(void *)(v2 + 104) = 9;
  *(unsigned char *)(v2 + 112) = 2;
  *(void *)(v2 + 120) = "light";
  *(void *)(v2 + 128) = 5;
  *(unsigned char *)(v2 + 136) = 2;
  *(void *)(v2 + 144) = "medium";
  *(void *)(v2 + 152) = 6;
  *(unsigned char *)(v2 + 160) = 2;
  *(void *)(v2 + 168) = "heavy";
  *(void *)(v2 + 176) = 5;
  *(unsigned char *)(v2 + 184) = 2;
  *(void *)(v2 + 192) = "negative";
  *(void *)(v2 + 200) = 8;
  *(unsigned char *)(v2 + 208) = 2;
  *(void *)(v2 + 216) = "positive";
  *(void *)(v2 + 224) = 8;
  *(unsigned char *)(v2 + 232) = 2;
  *(void *)(v2 + 240) = "indeterminate";
  *(void *)(v2 + 248) = 13;
  *(unsigned char *)(v2 + 256) = 2;
  *(void *)(v2 + 264) = "protected";
  *(void *)(v2 + 272) = 9;
  *(unsigned char *)(v2 + 280) = 2;
  *(void *)(v2 + 288) = "not_protected";
  *(void *)(v2 + 296) = 13;
  *(unsigned char *)(v2 + 304) = 2;
  _finalizeUninitializedArray<A>(_:)();
  Swift::Int v6 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)v1, rawValue);
  swift_bridgeObjectRelease();
  switch(v6)
  {
    case 0:
      v7.value = SiriWellnessIntents_WellnessValue_dry;
LABEL_28:
      swift_bridgeObjectRelease();
      return v7;
    case 1:
      v7.value = SiriWellnessIntents_WellnessValue_sticky;
      goto LABEL_28;
    case 2:
      v7.value = SiriWellnessIntents_WellnessValue_creamy;
      goto LABEL_28;
    case 3:
      v7.value = SiriWellnessIntents_WellnessValue_watery;
      goto LABEL_28;
    case 4:
      v7.value = SiriWellnessIntents_WellnessValue_egg_white;
      goto LABEL_28;
    case 5:
      v7.value = SiriWellnessIntents_WellnessValue_light;
      goto LABEL_28;
    case 6:
      v7.value = SiriWellnessIntents_WellnessValue_medium;
      goto LABEL_28;
    case 7:
      v7.value = SiriWellnessIntents_WellnessValue_heavy;
      goto LABEL_28;
    case 8:
      v7.value = SiriWellnessIntents_WellnessValue_negative;
      goto LABEL_28;
    case 9:
      v7.value = SiriWellnessIntents_WellnessValue_positive;
      goto LABEL_28;
    case 10:
      v7.value = SiriWellnessIntents_WellnessValue_indeterminate;
      goto LABEL_28;
    case 11:
      v7.value = SiriWellnessIntents_WellnessValue_protected;
      goto LABEL_28;
    case 12:
      v7.value = SiriWellnessIntents_WellnessValue_not_protected;
      goto LABEL_28;
  }
  swift_bridgeObjectRelease();
  return (SiriWellnessIntents::WellnessValue_optional)13;
}

uint64_t WellnessValue.rawValue.getter(char a1)
{
  switch(a1)
  {
    case 1:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("sticky", 6uLL, 1)._countAndFlagsBits;
      break;
    case 2:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("creamy", 6uLL, 1)._countAndFlagsBits;
      break;
    case 3:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("watery", 6uLL, 1)._countAndFlagsBits;
      break;
    case 4:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("egg_white", 9uLL, 1)._countAndFlagsBits;
      break;
    case 5:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("light", 5uLL, 1)._countAndFlagsBits;
      break;
    case 6:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("medium", 6uLL, 1)._countAndFlagsBits;
      break;
    case 7:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("heavy", 5uLL, 1)._countAndFlagsBits;
      break;
    case 8:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("negative", 8uLL, 1)._countAndFlagsBits;
      break;
    case 9:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("positive", 8uLL, 1)._countAndFlagsBits;
      break;
    case 10:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("indeterminate", 0xDuLL, 1)._countAndFlagsBits;
      break;
    case 11:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("protected", 9uLL, 1)._countAndFlagsBits;
      break;
    case 12:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("not_protected", 0xDuLL, 1)._countAndFlagsBits;
      break;
    default:
      uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("dry", 3uLL, 1)._countAndFlagsBits;
      break;
  }
  return countAndFlagsBits;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance WellnessValue()
{
  return == infix<A>(_:_:)() & 1;
}

unint64_t base witness table accessor for Equatable in WellnessValue()
{
  return lazy protocol witness table accessor for type WellnessValue and conformance WellnessValue();
}

unint64_t lazy protocol witness table accessor for type WellnessValue and conformance WellnessValue()
{
  uint64_t v2 = lazy protocol witness table cache variable for type WellnessValue and conformance WellnessValue;
  if (!lazy protocol witness table cache variable for type WellnessValue and conformance WellnessValue)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type WellnessValue and conformance WellnessValue);
    return WitnessTable;
  }
  return v2;
}

{
  unint64_t WitnessTable;
  uint64_t v2;

  uint64_t v2 = lazy protocol witness table cache variable for type WellnessValue and conformance WellnessValue;
  if (!lazy protocol witness table cache variable for type WellnessValue and conformance WellnessValue)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type WellnessValue and conformance WellnessValue);
    return WitnessTable;
  }
  return v2;
}

uint64_t protocol witness for Hashable.hashValue.getter in conformance WellnessValue()
{
  return RawRepresentable<>.hashValue.getter();
}

uint64_t protocol witness for Hashable.hash(into:) in conformance WellnessValue()
{
  return RawRepresentable<>.hash(into:)();
}

uint64_t protocol witness for Hashable._rawHashValue(seed:) in conformance WellnessValue()
{
  return RawRepresentable<>._rawHashValue(seed:)();
}

SiriWellnessIntents::WellnessValue_optional protocol witness for RawRepresentable.init(rawValue:) in conformance WellnessValue@<W0>(Swift::String *a1@<X0>, SiriWellnessIntents::WellnessValue_optional *a2@<X8>)
{
  result.value = WellnessValue.init(rawValue:)(*a1).value;
  a2->value = result.value;
  return result;
}

uint64_t protocol witness for RawRepresentable.rawValue.getter in conformance WellnessValue@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = WellnessValue.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t getEnumTagSinglePayload for WellnessValue(unsigned __int8 *a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 <= 0xF3) {
      goto LABEL_15;
    }
    unsigned int v7 = ((a2 + 12) >> 8) + 1;
    int v8 = 1;
    if (v7 >= 0x100)
    {
      if (v7 >= 0x10000) {
        int v2 = 4;
      }
      else {
        int v2 = 2;
      }
      int v8 = v2;
    }
    if (v8 == 1) {
      int v6 = a1[1];
    }
    else {
      int v6 = v8 == 2 ? *(unsigned __int16 *)(a1 + 1) : *(_DWORD *)(a1 + 1);
    }
    if (v6)
    {
      int v5 = (*a1 | ((v6 - 1) << 8)) + 243;
    }
    else
    {
LABEL_15:
      int v3 = *a1 - 13;
      if (v3 < 0) {
        int v3 = -1;
      }
      int v5 = v3;
    }
  }
  else
  {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for WellnessValue(unsigned char *result, unsigned int a2, unsigned int a3)
{
  int v7 = 0;
  if (a3 > 0xF3)
  {
    unsigned int v5 = ((a3 + 12) >> 8) + 1;
    int v6 = 1;
    if (v5 >= 0x100)
    {
      if (v5 >= 0x10000) {
        int v3 = 4;
      }
      else {
        int v3 = 2;
      }
      int v6 = v3;
    }
    int v7 = v6;
  }
  if (a2 > 0xF3)
  {
    unsigned int v4 = ((a2 - 244) >> 8) + 1;
    *uint64_t result = a2 + 12;
    if (v7)
    {
      if (v7 == 1)
      {
        result[1] = v4;
      }
      else if (v7 == 2)
      {
        *(_WORD *)(result + 1) = v4;
      }
      else
      {
        *(_DWORD *)(result + 1) = v4;
      }
    }
  }
  else
  {
    if (v7)
    {
      if (v7 == 1)
      {
        result[1] = 0;
      }
      else if (v7 == 2)
      {
        *(_WORD *)(result + 1) = 0;
      }
      else
      {
        *(_DWORD *)(result + 1) = 0;
      }
    }
    if (a2) {
      *uint64_t result = a2 + 12;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for WellnessValue()
{
  return &type metadata for WellnessValue;
}

uint64_t Statistics.init(queryDateRange:dataDateRange:sampleCount:unit:valueRange:latestValue:averageValue:totalValue:)@<X0>(const void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, char *a9@<X8>, uint64_t a10, uint64_t a11, uint64_t a12)
{
  uint64_t v49 = a9;
  uint64_t v63 = a1;
  uint64_t v61 = a2;
  uint64_t v37 = a3;
  uint64_t v38 = a4;
  uint64_t v58 = a5;
  uint64_t v33 = a6;
  uint64_t v34 = a7;
  uint64_t v54 = a8;
  uint64_t v53 = a10;
  uint64_t v52 = a11;
  uint64_t v64 = a12;
  uint64_t v77 = 0;
  uint64_t v76 = 0;
  uint64_t v75 = 0;
  uint64_t v74 = 0;
  uint64_t v73 = 0;
  uint64_t v71 = 0;
  uint64_t v72 = 0;
  uint64_t v70 = 0;
  uint64_t v69 = 0;
  uint64_t v68 = 0;
  uint64_t v78 = a12;
  uint64_t v50 = *(void **)(a12 - 8);
  uint64_t v51 = a12 - 8;
  unint64_t v27 = (v50[8] + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](a1);
  uint64_t v46 = (char *)&v27 - v27;
  uint64_t v30 = 0;
  uint64_t v62 = type metadata accessor for DateInterval();
  uint64_t v59 = *(void *)(v62 - 8);
  uint64_t v60 = v62 - 8;
  unint64_t v28 = (*(void *)(v59 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v62);
  uint64_t v36 = (char *)&v27 - v28;
  unint64_t v29 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DateInterval?)
                               - 8)
                   + 64)
       + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v30);
  uint64_t v35 = (char *)&v27 - v29;
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  unint64_t v31 = (*(void *)(*(void *)(TupleTypeMetadata2 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v12 = MEMORY[0x270FA5388](v30);
  uint64_t v43 = (char *)&v27 - v31;
  unint64_t v32 = (v13 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v12);
  uint64_t v57 = (uint64_t)&v27 - v32;
  uint64_t v77 = (char *)&v27 - v32;
  uint64_t v66 = (int *)type metadata accessor for Statistics();
  uint64_t v14 = MEMORY[0x270FA5388](v57);
  uint64_t v67 = (char *)&v27 - v15;
  uint64_t v76 = (char *)&v27 - v15;
  uint64_t v75 = v16;
  uint64_t v74 = v61;
  uint64_t v73 = v37;
  uint64_t v71 = v17;
  uint64_t v72 = v18;
  uint64_t v40 = *(int *)(TupleTypeMetadata2 + 48);
  uint64_t v48 = (void (*)(uint64_t))v50[4];
  uint64_t v47 = v50 + 4;
  v48(v14);
  ((void (*)(uint64_t, uint64_t, uint64_t))v48)(v57 + *(int *)(TupleTypeMetadata2 + 48), v34, v64);
  uint64_t v70 = v54;
  uint64_t v69 = v53;
  uint64_t v68 = v52;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v59 + 56))(v67, 1, 1, v62);
  outlined init with copy of DateInterval?(v63, v35);
  outlined assign with take of DateInterval?(v35, v67);
  (*(void (**)(char *, uint64_t, uint64_t))(v59 + 16))(v36, v61, v62);
  (*(void (**)(char *, char *, uint64_t))(v59 + 32))(&v67[v66[7]], v36, v62);
  *(void *)&v67[v66[8]] = v37;
  swift_bridgeObjectRetain();
  uint64_t v19 = v43;
  uint64_t v20 = v50;
  uint64_t v21 = v57;
  uint64_t v22 = v58;
  uint64_t v23 = v64;
  uint64_t v24 = TupleTypeMetadata2;
  uint64_t v25 = &v67[v66[9]];
  *(void *)uint64_t v25 = v38;
  *((void *)v25 + 1) = v22;
  uint64_t v39 = *(int *)(v24 + 48);
  uint64_t v45 = (void (*)(char *, uint64_t, uint64_t))v20[2];
  uint64_t v44 = v20 + 2;
  v45(v19, v21, v23);
  v45(&v43[v39], v57 + v40, v64);
  uint64_t v42 = *(int *)(TupleTypeMetadata2 + 48);
  uint64_t v41 = &v67[v66[10]];
  ((void (*)(void))v48)();
  ((void (*)(char *, char *, uint64_t))v48)(&v41[*(int *)(TupleTypeMetadata2 + 48)], &v43[v42], v64);
  v45(v46, v54, v64);
  ((void (*)(char *, char *, uint64_t))v48)(&v67[v66[11]], v46, v64);
  v45(v46, v53, v64);
  ((void (*)(char *, char *, uint64_t))v48)(&v67[v66[12]], v46, v64);
  v45(v46, v52, v64);
  ((void (*)(char *, char *, uint64_t))v48)(&v67[v66[13]], v46, v64);
  outlined init with copy of Statistics<A>(v67, v49, v64, TupleTypeMetadata2, v66);
  uint64_t v56 = (void (*)(uint64_t, uint64_t))v50[1];
  uint64_t v55 = v50 + 1;
  v56(v52, v64);
  v56(v53, v64);
  v56(v54, v64);
  outlined destroy of (minimum: A, maximum: A)(v57, v64, TupleTypeMetadata2);
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v59 + 8))(v61, v62);
  outlined destroy of DateInterval?((uint64_t)v63);
  return outlined destroy of Statistics<A>((uint64_t)v67, v64, TupleTypeMetadata2, v66);
}

uint64_t type metadata accessor for Statistics()
{
  return __swift_instantiateGenericMetadata();
}

void *outlined assign with take of DateInterval?(const void *a1, void *a2)
{
  uint64_t v7 = type metadata accessor for DateInterval();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v8 + 48);
  if (((unsigned int (*)(void *, uint64_t))v9)(a2, 1))
  {
    if (v9(a1, 1, v7))
    {
      uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DateInterval?);
      memcpy(a2, a1, *(void *)(*(void *)(v3 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, const void *, uint64_t))(v8 + 32))(a2, a1, v7);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v8 + 56))(a2, 0, 1, v7);
    }
  }
  else if (v9(a1, 1, v7))
  {
    (*(void (**)(void *, uint64_t))(v8 + 8))(a2, v7);
    uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DateInterval?);
    memcpy(a2, a1, *(void *)(*(void *)(v2 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v8 + 40))(a2, a1, v7);
  }
  return a2;
}

char *outlined init with copy of Statistics<A>(char *a1, char *a2, uint64_t a3, uint64_t a4, int *a5)
{
  uint64_t v19 = type metadata accessor for DateInterval();
  uint64_t v20 = *(void *)(v19 - 8);
  if ((*(unsigned int (**)(char *, uint64_t))(v20 + 48))(a1, 1))
  {
    uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DateInterval?);
    memcpy(a2, a1, *(void *)(*(void *)(v5 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v20 + 16))(a2, a1, v19);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v20 + 56))(a2, 0, 1, v19);
  }
  (*(void (**)(char *, char *, uint64_t))(v20 + 16))(&a2[a5[7]], &a1[a5[7]], v19);
  *(void *)&a2[a5[8]] = *(void *)&a1[a5[8]];
  uint64_t v6 = a5[9];
  uint64_t v9 = &a2[v6];
  *(void *)&a2[v6] = *(void *)&a1[v6];
  uint64_t v10 = *(void *)&a1[v6 + 8];
  swift_bridgeObjectRetain();
  *((void *)v9 + 1) = v10;
  uint64_t v7 = a5[10];
  uint64_t v11 = &a2[v7];
  uint64_t v12 = &a1[v7];
  uint64_t v13 = *(void (**)(void))(*(void *)(a3 - 8) + 16);
  v13();
  ((void (*)(char *, char *, uint64_t))v13)(&v11[*(int *)(a4 + 48)], &v12[*(int *)(a4 + 48)], a3);
  ((void (*)(char *, char *, uint64_t))v13)(&a2[a5[11]], &a1[a5[11]], a3);
  ((void (*)(char *, char *, uint64_t))v13)(&a2[a5[12]], &a1[a5[12]], a3);
  ((void (*)(char *, char *, uint64_t))v13)(&a2[a5[13]], &a1[a5[13]], a3);
  return a2;
}

uint64_t outlined destroy of (minimum: A, maximum: A)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void (**)(void))(*(void *)(a2 - 8) + 8);
  v6();
  ((void (*)(uint64_t, uint64_t))v6)(a1 + *(int *)(a3 + 48), a2);
  return a1;
}

uint64_t outlined destroy of Statistics<A>(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v11 = type metadata accessor for DateInterval();
  uint64_t v12 = *(void *)(v11 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t))(v12 + 48))(a1, 1)) {
    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(a1, v11);
  }
  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(a1 + a4[7], v11);
  swift_bridgeObjectRelease();
  uint64_t v5 = a1 + a4[10];
  uint64_t v6 = *(void (**)(void))(*(void *)(a2 - 8) + 8);
  v6();
  ((void (*)(uint64_t, uint64_t))v6)(v5 + *(int *)(a3 + 48), a2);
  ((void (*)(uint64_t, uint64_t))v6)(a1 + a4[11], a2);
  ((void (*)(uint64_t, uint64_t))v6)(a1 + a4[12], a2);
  ((void (*)(uint64_t, uint64_t))v6)(a1 + a4[13], a2);
  return a1;
}

void *Statistics.queryDateRange.getter@<X0>(void *a1@<X8>)
{
  return outlined init with copy of DateInterval?(v1, a1);
}

uint64_t Statistics.queryDateRange.setter(uint64_t a1)
{
  uint64_t v5 = a1;
  v3[0] = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DateInterval?)
                                 - 8)
                     + 64)
         + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v5);
  unsigned int v4 = (char *)v3 - v3[0];
  outlined init with copy of DateInterval?(v1, (char *)v3 - v3[0]);
  outlined assign with take of DateInterval?(v4, (void *)v3[1]);
  return outlined destroy of DateInterval?(v5);
}

__C::HKQueryOptions (__swiftcall *Statistics.queryDateRange.modify())(Swift::UInt rawValue)
{
  return HKQueryOptions.init(rawValue:);
}

uint64_t Statistics.dataDateRange.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = *(int *)(a1 + 28);
  uint64_t v3 = type metadata accessor for DateInterval();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 16))(a2, v2 + v5);
}

uint64_t Statistics.dataDateRange.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v12 = a1;
  uint64_t v7 = a2;
  uint64_t v11 = type metadata accessor for DateInterval();
  uint64_t v9 = *(void *)(v11 - 8);
  uint64_t v10 = v11 - 8;
  unint64_t v6 = (*(void *)(v9 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  double v3 = MEMORY[0x270FA5388](v11);
  uint64_t v8 = (char *)&v5 - v6;
  (*(void (**)(double))(v9 + 16))(v3);
  (*(void (**)(uint64_t, char *, uint64_t))(v9 + 40))(v2 + *(int *)(v7 + 28), v8, v11);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v9 + 8))(v12, v11);
}

__C::HKQueryOptions (__swiftcall *Statistics.dataDateRange.modify())(Swift::UInt rawValue)
{
  return HKQueryOptions.init(rawValue:);
}

uint64_t Statistics.sampleCount.getter(uint64_t a1)
{
  return *(void *)(v1 + *(int *)(a1 + 32));
}

uint64_t Statistics.sampleCount.setter(uint64_t result, uint64_t a2)
{
  *(void *)(v2 + *(int *)(a2 + 32)) = result;
  return result;
}

__C::HKQueryOptions (__swiftcall *Statistics.sampleCount.modify())(Swift::UInt rawValue)
{
  return HKQueryOptions.init(rawValue:);
}

uint64_t Statistics.unit.getter(uint64_t a1)
{
  uint64_t v3 = *(void *)(v1 + *(int *)(a1 + 36));
  swift_bridgeObjectRetain();
  return v3;
}

uint64_t Statistics.unit.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  swift_bridgeObjectRetain();
  unsigned int v4 = (void *)(v3 + *(int *)(a3 + 36));
  *unsigned int v4 = a1;
  v4[1] = a2;
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

__C::HKQueryOptions (__swiftcall *Statistics.unit.modify())(Swift::UInt rawValue)
{
  return HKQueryOptions.init(rawValue:);
}

uint64_t Statistics.valueRange.getter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v20 = a1;
  uint64_t v26 = a2;
  uint64_t v11 = a3;
  uint64_t v23 = *(void *)(a3 + 16);
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  unint64_t v10 = (*(void *)(*(void *)(TupleTypeMetadata2 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  double v4 = MEMORY[0x270FA5388](TupleTypeMetadata2);
  uint64_t v22 = (char *)&v9 - v10;
  uint64_t v5 = *(int *)(v11 + 40);
  uint64_t v12 = *(int *)(v6 + 48);
  uint64_t v13 = *(int *)(v6 + 48);
  uint64_t v18 = *(void *)(v7 - 8);
  uint64_t v19 = v7 - 8;
  uint64_t v16 = *(void (**)(double))(v18 + 16);
  uint64_t v15 = v18 + 16;
  uint64_t v14 = v3 + v5;
  v16(v4);
  ((void (*)(char *, uint64_t, uint64_t))v16)(&v22[v12], v14 + v13, v23);
  uint64_t v21 = *(int *)(TupleTypeMetadata2 + 48);
  uint64_t v25 = *(void (**)(uint64_t, char *, uint64_t))(v18 + 32);
  uint64_t v24 = v18 + 32;
  v25(v20, v22, v23);
  return ((uint64_t (*)(uint64_t, char *, uint64_t))v25)(v26, &v22[v21], v23);
}

uint64_t Statistics.valueRange.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v10 = a1;
  uint64_t v14 = a2;
  uint64_t v21 = a3;
  uint64_t v29 = *(void *)(a3 + 16);
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  uint64_t v12 = *(void *)(*(void *)(TupleTypeMetadata2 - 8) + 64);
  unint64_t v11 = (v12 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](TupleTypeMetadata2);
  uint64_t v26 = (char *)&v10 - v11;
  unint64_t v13 = v11;
  double v5 = MEMORY[0x270FA5388](v4);
  uint64_t v31 = (uint64_t)&v10 - v13;
  uint64_t v18 = *(int *)(v6 + 48);
  uint64_t v22 = *(void **)(v7 - 8);
  uint64_t v23 = v7 - 8;
  uint64_t v16 = (void (*)(double))v22[4];
  uint64_t v15 = v22 + 4;
  v16(v5);
  ((void (*)(uint64_t, uint64_t, uint64_t))v16)(v31 + *(int *)(TupleTypeMetadata2 + 48), v14, v29);
  uint64_t v17 = *(int *)(TupleTypeMetadata2 + 48);
  uint64_t v20 = (void (*)(char *, uint64_t, uint64_t))v22[2];
  uint64_t v19 = v22 + 2;
  v20(v26, v31, v29);
  v20(&v26[v17], v31 + v18, v29);
  uint64_t v25 = *(int *)(TupleTypeMetadata2 + 48);
  uint64_t v8 = *(int *)(v21 + 40);
  unint64_t v28 = (void (*)(uint64_t))v22[5];
  unint64_t v27 = v22 + 5;
  uint64_t v24 = v3 + v8;
  v28(v3 + v8);
  ((void (*)(uint64_t, char *, uint64_t))v28)(v24 + *(int *)(TupleTypeMetadata2 + 48), &v26[v25], v29);
  return outlined destroy of (minimum: A, maximum: A)(v31, v29, TupleTypeMetadata2);
}

__C::HKQueryOptions (__swiftcall *Statistics.valueRange.modify())(Swift::UInt rawValue)
{
  return HKQueryOptions.init(rawValue:);
}

uint64_t Statistics.latestValue.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(a1 + 16) - 8) + 16))(a2, v2 + *(int *)(a1 + 44));
}

uint64_t Statistics.latestValue.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v11 = a1;
  uint64_t v6 = a2;
  uint64_t v10 = *(void *)(a2 + 16);
  uint64_t v8 = *(void *)(v10 - 8);
  uint64_t v9 = v10 - 8;
  unint64_t v5 = (*(void *)(v8 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388]();
  uint64_t v7 = (char *)&v4 - v5;
  (*(void (**)(void))(v8 + 16))();
  (*(void (**)(uint64_t, char *, uint64_t))(v8 + 40))(v2 + *(int *)(v6 + 44), v7, v10);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v8 + 8))(v11, v10);
}

__C::HKQueryOptions (__swiftcall *Statistics.latestValue.modify())(Swift::UInt rawValue)
{
  return HKQueryOptions.init(rawValue:);
}

uint64_t Statistics.averageValue.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(a1 + 16) - 8) + 16))(a2, v2 + *(int *)(a1 + 48));
}

uint64_t Statistics.averageValue.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v11 = a1;
  uint64_t v6 = a2;
  uint64_t v10 = *(void *)(a2 + 16);
  uint64_t v8 = *(void *)(v10 - 8);
  uint64_t v9 = v10 - 8;
  unint64_t v5 = (*(void *)(v8 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388]();
  uint64_t v7 = (char *)&v4 - v5;
  (*(void (**)(void))(v8 + 16))();
  (*(void (**)(uint64_t, char *, uint64_t))(v8 + 40))(v2 + *(int *)(v6 + 48), v7, v10);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v8 + 8))(v11, v10);
}

__C::HKQueryOptions (__swiftcall *Statistics.averageValue.modify())(Swift::UInt rawValue)
{
  return HKQueryOptions.init(rawValue:);
}

uint64_t Statistics.totalValue.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(a1 + 16) - 8) + 16))(a2, v2 + *(int *)(a1 + 52));
}

uint64_t Statistics.totalValue.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v11 = a1;
  uint64_t v6 = a2;
  uint64_t v10 = *(void *)(a2 + 16);
  uint64_t v8 = *(void *)(v10 - 8);
  uint64_t v9 = v10 - 8;
  unint64_t v5 = (*(void *)(v8 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388]();
  uint64_t v7 = (char *)&v4 - v5;
  (*(void (**)(void))(v8 + 16))();
  (*(void (**)(uint64_t, char *, uint64_t))(v8 + 40))(v2 + *(int *)(v6 + 52), v7, v10);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v8 + 8))(v11, v10);
}

__C::HKQueryOptions (__swiftcall *Statistics.totalValue.modify())(Swift::UInt rawValue)
{
  return HKQueryOptions.init(rawValue:);
}

uint64_t type metadata instantiation function for Statistics()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t type metadata completion function for Statistics()
{
  uint64_t v7 = type metadata accessor for DateInterval?();
  uint64_t v8 = v7;
  if (v0 <= 0x3F)
  {
    uint64_t v10 = *(void *)(v7 - 8) + 64;
    uint64_t v1 = type metadata accessor for DateInterval();
    uint64_t v8 = v1;
    if (v2 <= 0x3F)
    {
      uint64_t v11 = *(void *)(v1 - 8) + 64;
      uint64_t v12 = MEMORY[0x263F8CF70] + 64;
      unint64_t v13 = &unk_25DF51C10;
      uint64_t v3 = swift_checkMetadataState();
      uint64_t v8 = v3;
      if (v4 <= 0x3F)
      {
        uint64_t v6 = *(void *)(v3 - 8);
        swift_getTupleTypeLayout2();
        uint64_t v14 = &v9;
        uint64_t v15 = v6 + 64;
        uint64_t v16 = v6 + 64;
        uint64_t v17 = v6 + 64;
        swift_initStructMetadata();
        return 0;
      }
    }
  }
  return v8;
}

unint64_t initializeBufferWithCopyOfBuffer for Statistics(void *a1, uint64_t *a2, uint64_t a3)
{
  int v20 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v20 & 0x20000) != 0)
  {
    uint64_t v15 = *a2;
    swift_retain();
    *a1 = v15;
    return *a1 + ((v20 + 16) & ~(unint64_t)v20);
  }
  else
  {
    uint64_t v13 = type metadata accessor for DateInterval();
    uint64_t v14 = *(void *)(v13 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t))(v14 + 48))(a2, 1))
    {
      uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DateInterval?);
      memcpy(a1, a2, *(void *)(*(void *)(v3 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, uint64_t *, uint64_t))(v14 + 16))(a1, a2, v13);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v14 + 56))(a1, 0, 1, v13);
    }
    (*(void (**)(char *, char *, uint64_t))(v14 + 16))((char *)a1 + *(int *)(a3 + 28), (char *)a2 + *(int *)(a3 + 28), v13);
    *(void *)((char *)a1 + *(int *)(a3 + 32)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 32));
    uint64_t v4 = *(int *)(a3 + 36);
    uint64_t v7 = (char *)a1 + v4;
    *(void *)((char *)a1 + v4) = *(uint64_t *)((char *)a2 + v4);
    uint64_t v8 = *(uint64_t *)((char *)a2 + v4 + 8);
    swift_bridgeObjectRetain();
    *((void *)v7 + 1) = v8;
    char v9 = (char *)a1 + *(int *)(a3 + 40);
    uint64_t v10 = (char *)a2 + *(int *)(a3 + 40);
    uint64_t v11 = *(void *)(a3 + 16);
    uint64_t v12 = *(void (**)(void))(*(void *)(v11 - 8) + 16);
    v12();
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    ((void (*)(char *, char *, uint64_t))v12)(&v9[*(int *)(TupleTypeMetadata2 + 48)], &v10[*(int *)(TupleTypeMetadata2 + 48)], v11);
    ((void (*)(char *, char *, uint64_t))v12)((char *)a1 + *(int *)(a3 + 44), (char *)a2 + *(int *)(a3 + 44), v11);
    ((void (*)(char *, char *, uint64_t))v12)((char *)a1 + *(int *)(a3 + 48), (char *)a2 + *(int *)(a3 + 48), v11);
    ((void (*)(char *, char *, uint64_t))v12)((char *)a1 + *(int *)(a3 + 52), (char *)a2 + *(int *)(a3 + 52), v11);
    return (unint64_t)a1;
  }
}

uint64_t destroy for Statistics(uint64_t a1, uint64_t a2)
{
  uint64_t v9 = type metadata accessor for DateInterval();
  uint64_t v10 = *(void *)(v9 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t))(v10 + 48))(a1, 1)) {
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(a1, v9);
  }
  (*(void (**)(uint64_t, uint64_t))(v10 + 8))(a1 + *(int *)(a2 + 28), v9);
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 40);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void (**)(void))(*(void *)(v5 - 8) + 8);
  v6();
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  ((void (*)(uint64_t, uint64_t))v6)(v4 + *(int *)(TupleTypeMetadata2 + 48), v5);
  ((void (*)(uint64_t, uint64_t))v6)(a1 + *(int *)(a2 + 44), v5);
  ((void (*)(uint64_t, uint64_t))v6)(a1 + *(int *)(a2 + 48), v5);
  return ((uint64_t (*)(uint64_t, uint64_t))v6)(a1 + *(int *)(a2 + 52), v5);
}

char *initializeWithCopy for Statistics(char *a1, char *a2, uint64_t a3)
{
  uint64_t v16 = type metadata accessor for DateInterval();
  uint64_t v17 = *(void *)(v16 - 8);
  if ((*(unsigned int (**)(char *, uint64_t))(v17 + 48))(a2, 1))
  {
    uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DateInterval?);
    memcpy(a1, a2, *(void *)(*(void *)(v3 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v17 + 16))(a1, a2, v16);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v17 + 56))(a1, 0, 1, v16);
  }
  (*(void (**)(char *, char *, uint64_t))(v17 + 16))(&a1[*(int *)(a3 + 28)], &a2[*(int *)(a3 + 28)], v16);
  *(void *)&a1[*(int *)(a3 + 32)] = *(void *)&a2[*(int *)(a3 + 32)];
  uint64_t v4 = *(int *)(a3 + 36);
  uint64_t v7 = &a1[v4];
  *(void *)&a1[v4] = *(void *)&a2[v4];
  uint64_t v8 = *(void *)&a2[v4 + 8];
  swift_bridgeObjectRetain();
  *((void *)v7 + 1) = v8;
  uint64_t v9 = &a1[*(int *)(a3 + 40)];
  uint64_t v10 = &a2[*(int *)(a3 + 40)];
  uint64_t v11 = *(void *)(a3 + 16);
  uint64_t v12 = *(void (**)(void))(*(void *)(v11 - 8) + 16);
  v12();
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  ((void (*)(char *, char *, uint64_t))v12)(&v9[*(int *)(TupleTypeMetadata2 + 48)], &v10[*(int *)(TupleTypeMetadata2 + 48)], v11);
  ((void (*)(char *, char *, uint64_t))v12)(&a1[*(int *)(a3 + 44)], &a2[*(int *)(a3 + 44)], v11);
  ((void (*)(char *, char *, uint64_t))v12)(&a1[*(int *)(a3 + 48)], &a2[*(int *)(a3 + 48)], v11);
  ((void (*)(char *, char *, uint64_t))v12)(&a1[*(int *)(a3 + 52)], &a2[*(int *)(a3 + 52)], v11);
  return a1;
}

char *assignWithCopy for Statistics(char *a1, char *a2, uint64_t a3)
{
  uint64_t v17 = type metadata accessor for DateInterval();
  uint64_t v18 = *(void *)(v17 - 8);
  uint64_t v19 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48);
  if (((unsigned int (*)(char *, uint64_t))v19)(a1, 1))
  {
    if (v19(a2, 1, v17))
    {
      uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DateInterval?);
      memcpy(a1, a2, *(void *)(*(void *)(v4 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v18 + 16))(a1, a2, v17);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v18 + 56))(a1, 0, 1, v17);
    }
  }
  else if (v19(a2, 1, v17))
  {
    (*(void (**)(char *, uint64_t))(v18 + 8))(a1, v17);
    uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DateInterval?);
    memcpy(a1, a2, *(void *)(*(void *)(v3 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v18 + 24))(a1, a2, v17);
  }
  (*(void (**)(char *, char *, uint64_t))(v18 + 24))(&a1[*(int *)(a3 + 28)], &a2[*(int *)(a3 + 28)], v17);
  *(void *)&a1[*(int *)(a3 + 32)] = *(void *)&a2[*(int *)(a3 + 32)];
  uint64_t v5 = *(int *)(a3 + 36);
  uint64_t v8 = &a1[v5];
  *(void *)&a1[v5] = *(void *)&a2[v5];
  uint64_t v9 = *(void *)&a2[v5 + 8];
  swift_bridgeObjectRetain();
  *((void *)v8 + 1) = v9;
  swift_bridgeObjectRelease();
  uint64_t v10 = &a1[*(int *)(a3 + 40)];
  uint64_t v11 = &a2[*(int *)(a3 + 40)];
  uint64_t v12 = *(void *)(a3 + 16);
  uint64_t v13 = *(void (**)(void))(*(void *)(v12 - 8) + 24);
  v13();
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  ((void (*)(char *, char *, uint64_t))v13)(&v10[*(int *)(TupleTypeMetadata2 + 48)], &v11[*(int *)(TupleTypeMetadata2 + 48)], v12);
  ((void (*)(char *, char *, uint64_t))v13)(&a1[*(int *)(a3 + 44)], &a2[*(int *)(a3 + 44)], v12);
  ((void (*)(char *, char *, uint64_t))v13)(&a1[*(int *)(a3 + 48)], &a2[*(int *)(a3 + 48)], v12);
  ((void (*)(char *, char *, uint64_t))v13)(&a1[*(int *)(a3 + 52)], &a2[*(int *)(a3 + 52)], v12);
  return a1;
}

char *initializeWithTake for Statistics(char *a1, char *a2, uint64_t a3)
{
  uint64_t v13 = type metadata accessor for DateInterval();
  uint64_t v14 = *(void *)(v13 - 8);
  if ((*(unsigned int (**)(char *, uint64_t))(v14 + 48))(a2, 1))
  {
    uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DateInterval?);
    memcpy(a1, a2, *(void *)(*(void *)(v3 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v14 + 32))(a1, a2, v13);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v14 + 56))(a1, 0, 1, v13);
  }
  (*(void (**)(char *, char *, uint64_t))(v14 + 32))(&a1[*(int *)(a3 + 28)], &a2[*(int *)(a3 + 28)], v13);
  *(void *)&a1[*(int *)(a3 + 32)] = *(void *)&a2[*(int *)(a3 + 32)];
  *(_OWORD *)&a1[*(int *)(a3 + 36)] = *(_OWORD *)&a2[*(int *)(a3 + 36)];
  uint64_t v6 = &a1[*(int *)(a3 + 40)];
  uint64_t v7 = &a2[*(int *)(a3 + 40)];
  uint64_t v8 = *(void *)(a3 + 16);
  uint64_t v9 = *(void (**)(void))(*(void *)(v8 - 8) + 32);
  v9();
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  ((void (*)(char *, char *, uint64_t))v9)(&v6[*(int *)(TupleTypeMetadata2 + 48)], &v7[*(int *)(TupleTypeMetadata2 + 48)], v8);
  ((void (*)(char *, char *, uint64_t))v9)(&a1[*(int *)(a3 + 44)], &a2[*(int *)(a3 + 44)], v8);
  ((void (*)(char *, char *, uint64_t))v9)(&a1[*(int *)(a3 + 48)], &a2[*(int *)(a3 + 48)], v8);
  ((void (*)(char *, char *, uint64_t))v9)(&a1[*(int *)(a3 + 52)], &a2[*(int *)(a3 + 52)], v8);
  return a1;
}

char *assignWithTake for Statistics(char *a1, char *a2, uint64_t a3)
{
  uint64_t v16 = type metadata accessor for DateInterval();
  uint64_t v17 = *(void *)(v16 - 8);
  uint64_t v18 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48);
  if (((unsigned int (*)(char *, uint64_t))v18)(a1, 1))
  {
    if (v18(a2, 1, v16))
    {
      uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DateInterval?);
      memcpy(a1, a2, *(void *)(*(void *)(v4 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v17 + 32))(a1, a2, v16);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v17 + 56))(a1, 0, 1, v16);
    }
  }
  else if (v18(a2, 1, v16))
  {
    (*(void (**)(char *, uint64_t))(v17 + 8))(a1, v16);
    uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DateInterval?);
    memcpy(a1, a2, *(void *)(*(void *)(v3 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v17 + 40))(a1, a2, v16);
  }
  (*(void (**)(char *, char *, uint64_t))(v17 + 40))(&a1[*(int *)(a3 + 28)], &a2[*(int *)(a3 + 28)], v16);
  *(void *)&a1[*(int *)(a3 + 32)] = *(void *)&a2[*(int *)(a3 + 32)];
  uint64_t v5 = *(int *)(a3 + 36);
  uint64_t v6 = &a1[v5];
  *(void *)uint64_t v6 = *(void *)&a2[v5];
  *((void *)v6 + 1) = *(void *)&a2[v5 + 8];
  swift_bridgeObjectRelease();
  uint64_t v9 = &a1[*(int *)(a3 + 40)];
  uint64_t v10 = &a2[*(int *)(a3 + 40)];
  uint64_t v11 = *(void *)(a3 + 16);
  uint64_t v12 = *(void (**)(void))(*(void *)(v11 - 8) + 40);
  v12();
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  ((void (*)(char *, char *, uint64_t))v12)(&v9[*(int *)(TupleTypeMetadata2 + 48)], &v10[*(int *)(TupleTypeMetadata2 + 48)], v11);
  ((void (*)(char *, char *, uint64_t))v12)(&a1[*(int *)(a3 + 44)], &a2[*(int *)(a3 + 44)], v11);
  ((void (*)(char *, char *, uint64_t))v12)(&a1[*(int *)(a3 + 48)], &a2[*(int *)(a3 + 48)], v11);
  ((void (*)(char *, char *, uint64_t))v12)(&a1[*(int *)(a3 + 52)], &a2[*(int *)(a3 + 52)], v11);
  return a1;
}

uint64_t getEnumTagSinglePayload for Statistics()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_25DF43D58(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DateInterval?);
  if (a2 == *(_DWORD *)(*(void *)(v12 - 8) + 84))
  {
    return (*(unsigned int (**)(uint64_t, void, uint64_t))(*(void *)(v12 - 8) + 48))(a1, a2, v12);
  }
  else
  {
    uint64_t v7 = type metadata accessor for DateInterval();
    if (a2 == *(_DWORD *)(*(void *)(v7 - 8) + 84))
    {
      return (*(unsigned int (**)(uint64_t, void, uint64_t))(*(void *)(v7 - 8) + 48))(a1 + *(int *)(a3 + 28), a2, v7);
    }
    else if (a2 == 0x7FFFFFFF)
    {
      int v6 = -1;
      if (*(void *)(a1 + *(int *)(a3 + 36) + 8) < 0x100000000uLL) {
        int v6 = *(void *)(a1 + *(int *)(a3 + 36) + 8);
      }
      return (v6 + 1);
    }
    else
    {
      TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
      if (a2 == *(_DWORD *)(*(void *)(TupleTypeMetadata2 - 8) + 84))
      {
        return (*(unsigned int (**)(uint64_t, void, uint64_t))(*(void *)(TupleTypeMetadata2 - 8) + 48))(a1 + *(int *)(a3 + 40), a2, TupleTypeMetadata2);
      }
      else
      {
        uint64_t v4 = *(void *)(a3 + 16);
        if (a2 == *(_DWORD *)(*(void *)(v4 - 8) + 84)) {
          return (*(unsigned int (**)(uint64_t, void, uint64_t))(*(void *)(v4 - 8) + 48))(a1 + *(int *)(a3 + 44), a2, v4);
        }
        else {
          __break(1u);
        }
      }
    }
  }
  return v8;
}

uint64_t storeEnumTagSinglePayload for Statistics()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_25DF440A4(uint64_t a1, unsigned int a2, int a3, uint64_t a4)
{
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DateInterval?);
  if (a3 == *(_DWORD *)(*(void *)(v10 - 8) + 84)) {
    return (*(uint64_t (**)(uint64_t, void, void, uint64_t))(*(void *)(v10 - 8) + 56))(a1, a2, a2, v10);
  }
  uint64_t result = type metadata accessor for DateInterval();
  if (a3 == *(_DWORD *)(*(void *)(result - 8) + 84)) {
    return (*(uint64_t (**)(uint64_t, void, void, uint64_t))(*(void *)(result - 8) + 56))(a1 + *(int *)(a4 + 28), a2, a2, result);
  }
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(a1 + *(int *)(a4 + 36) + 8) = a2 - 1;
  }
  else
  {
    uint64_t result = swift_getTupleTypeMetadata2();
    if (a3 == *(_DWORD *)(*(void *)(result - 8) + 84))
    {
      return (*(uint64_t (**)(uint64_t, void, void, uint64_t))(*(void *)(result - 8) + 56))(a1 + *(int *)(a4 + 40), a2, a2, result);
    }
    else
    {
      uint64_t v5 = *(void *)(a4 + 16);
      if (a3 == *(_DWORD *)(*(void *)(v5 - 8) + 84)) {
        return (*(uint64_t (**)(uint64_t, void, void, uint64_t))(*(void *)(v5 - 8) + 56))(a1 + *(int *)(a4 + 44), a2, a2, v5);
      }
      else {
        __break(1u);
      }
    }
  }
  return result;
}

uint64_t type metadata accessor for DateInterval?()
{
  uint64_t v4 = lazy cache variable for type metadata for DateInterval?;
  if (!lazy cache variable for type metadata for DateInterval?)
  {
    type metadata accessor for DateInterval();
    unint64_t v3 = type metadata accessor for Optional();
    uint64_t v4 = v3;
    if (!v0)
    {
      unint64_t v1 = v3;
      atomic_store(v3, (unint64_t *)&lazy cache variable for type metadata for DateInterval?);
      return v1;
    }
  }
  return v4;
}

BOOL static InferedMeasurement.__derived_enum_equals(_:_:)(char a1, char a2)
{
  switch(a1)
  {
    case 1:
      uint64_t v4 = 1;
      break;
    case 2:
      uint64_t v4 = 2;
      break;
    case 3:
      uint64_t v4 = 3;
      break;
    default:
      uint64_t v4 = 0;
      break;
  }
  switch(a2)
  {
    case 1:
      uint64_t v3 = 1;
      break;
    case 2:
      uint64_t v3 = 2;
      break;
    case 3:
      uint64_t v3 = 3;
      break;
    default:
      uint64_t v3 = 0;
      break;
  }
  return v4 == v3;
}

uint64_t InferedMeasurement.hash(into:)()
{
  return Hasher.combine<A>(_:)();
}

uint64_t InferedMeasurement.hashValue.getter()
{
  return _hashValue<A>(for:)();
}

unint64_t lazy protocol witness table accessor for type InferedMeasurement and conformance InferedMeasurement()
{
  uint64_t v2 = lazy protocol witness table cache variable for type InferedMeasurement and conformance InferedMeasurement;
  if (!lazy protocol witness table cache variable for type InferedMeasurement and conformance InferedMeasurement)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type InferedMeasurement and conformance InferedMeasurement);
    return WitnessTable;
  }
  return v2;
}

{
  unint64_t WitnessTable;
  uint64_t v2;

  uint64_t v2 = lazy protocol witness table cache variable for type InferedMeasurement and conformance InferedMeasurement;
  if (!lazy protocol witness table cache variable for type InferedMeasurement and conformance InferedMeasurement)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type InferedMeasurement and conformance InferedMeasurement);
    return WitnessTable;
  }
  return v2;
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance InferedMeasurement(char *a1, char *a2)
{
  return static InferedMeasurement.__derived_enum_equals(_:_:)(*a1, *a2);
}

uint64_t protocol witness for Hashable.hashValue.getter in conformance InferedMeasurement()
{
  return InferedMeasurement.hashValue.getter();
}

uint64_t protocol witness for Hashable.hash(into:) in conformance InferedMeasurement()
{
  return InferedMeasurement.hash(into:)();
}

SiriWellnessIntents::InferedMeasurement __swiftcall getMeasurementType(for:)(Swift::String_optional a1)
{
  object = a1.value._object;
  swift_bridgeObjectRetain();
  if (!object) {
    return 3;
  }
  type metadata accessor for HKUnit();
  swift_bridgeObjectRetain();
  id v7 = @nonobjc HKUnit.__allocating_init(from:)();
  id v8 = objc_msgSend(self, sel_meterUnit);
  unsigned __int8 v9 = objc_msgSend(v7, sel__isCompatibleWithUnit_);

  if (v9)
  {

    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    id v4 = objc_msgSend(self, sel_gramUnit);
    unsigned __int8 v5 = objc_msgSend(v7, sel__isCompatibleWithUnit_);

    if (v5)
    {

      swift_bridgeObjectRelease();
      return 0;
    }
    else
    {
      id v2 = objc_msgSend(self, sel_smallCalorieUnit);
      unsigned __int8 v3 = objc_msgSend(v7, sel__isCompatibleWithUnit_);

      swift_bridgeObjectRelease();
      if (v3) {
        return 2;
      }
      else {
        return 3;
      }
    }
  }
}

unint64_t base witness table accessor for Equatable in InferedMeasurement()
{
  return lazy protocol witness table accessor for type InferedMeasurement and conformance InferedMeasurement();
}

uint64_t getEnumTagSinglePayload for InferedMeasurement(unsigned __int8 *a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 <= 0xFC) {
      goto LABEL_15;
    }
    unsigned int v7 = ((a2 + 3) >> 8) + 1;
    int v8 = 1;
    if (v7 >= 0x100)
    {
      if (v7 >= 0x10000) {
        int v2 = 4;
      }
      else {
        int v2 = 2;
      }
      int v8 = v2;
    }
    if (v8 == 1) {
      int v6 = a1[1];
    }
    else {
      int v6 = v8 == 2 ? *(unsigned __int16 *)(a1 + 1) : *(_DWORD *)(a1 + 1);
    }
    if (v6)
    {
      int v5 = (*a1 | ((v6 - 1) << 8)) + 252;
    }
    else
    {
LABEL_15:
      int v3 = *a1 - 4;
      if (v3 < 0) {
        int v3 = -1;
      }
      int v5 = v3;
    }
  }
  else
  {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for InferedMeasurement(unsigned char *result, unsigned int a2, unsigned int a3)
{
  int v7 = 0;
  if (a3 > 0xFC)
  {
    unsigned int v5 = ((a3 + 3) >> 8) + 1;
    int v6 = 1;
    if (v5 >= 0x100)
    {
      if (v5 >= 0x10000) {
        int v3 = 4;
      }
      else {
        int v3 = 2;
      }
      int v6 = v3;
    }
    int v7 = v6;
  }
  if (a2 > 0xFC)
  {
    unsigned int v4 = ((a2 - 253) >> 8) + 1;
    *uint64_t result = a2 + 3;
    if (v7)
    {
      if (v7 == 1)
      {
        result[1] = v4;
      }
      else if (v7 == 2)
      {
        *(_WORD *)(result + 1) = v4;
      }
      else
      {
        *(_DWORD *)(result + 1) = v4;
      }
    }
  }
  else
  {
    if (v7)
    {
      if (v7 == 1)
      {
        result[1] = 0;
      }
      else if (v7 == 2)
      {
        *(_WORD *)(result + 1) = 0;
      }
      else
      {
        *(_DWORD *)(result + 1) = 0;
      }
    }
    if (a2) {
      *uint64_t result = a2 + 3;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for InferedMeasurement()
{
  return &type metadata for InferedMeasurement;
}

uint64_t UnavailableDataProvider.init(failure:)(uint64_t a1)
{
  return a1;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> outlined destroy of UnavailableDataProvider<A>()
{
}

uint64_t UnavailableDataProvider.isQueryAuthorized()()
{
  return (*(uint64_t (**)(void))(v1 + 8))(0);
}

uint64_t UnavailableDataProvider.isLoggingAuthorized()()
{
  return (*(uint64_t (**)(void))(v1 + 8))(0);
}

uint64_t UnavailableDataProvider.query(start:end:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[9] = a5;
  v5[8] = a4;
  v5[7] = a1;
  v5[4] = v5;
  v5[5] = 0;
  v5[6] = 0;
  v5[2] = 0;
  v5[3] = 0;
  v5[5] = a2;
  v5[6] = a3;
  v5[2] = a4;
  v5[3] = a5;
  return MEMORY[0x270FA2498](UnavailableDataProvider.query(start:end:), 0);
}

uint64_t UnavailableDataProvider.query(start:end:)()
{
  unsigned int v4 = *(void (**)(uint64_t))(v0 + 64);
  *(void *)(v0 + 32) = v0;
  uint64_t v1 = swift_retain();
  v4(v1);
  swift_release();
  int v2 = *(uint64_t (**)(void))(*(void *)(v0 + 32) + 8);
  return v2();
}

uint64_t protocol witness for DataProviding.isQueryAuthorized() in conformance UnavailableDataProvider<A>()
{
  uint64_t v3 = v0;
  *(void *)(v0 + 16) = v0;
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v3 + 24) = v1;
  void *v1 = *(void *)(v3 + 16);
  v1[1] = protocol witness for QuantityPersisting.isLoggingAuthorized(for:) in conformance HealthKitPersistor;
  return UnavailableDataProvider.isQueryAuthorized()();
}

uint64_t protocol witness for DataProviding.isLoggingAuthorized() in conformance UnavailableDataProvider<A>()
{
  uint64_t v3 = v0;
  *(void *)(v0 + 16) = v0;
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v3 + 24) = v1;
  void *v1 = *(void *)(v3 + 16);
  v1[1] = protocol witness for QuantityPersisting.isLoggingAuthorized(for:) in conformance HealthKitPersistor;
  return UnavailableDataProvider.isLoggingAuthorized()();
}

uint64_t protocol witness for AmbiguousDistanceProviding.query(start:end:) in conformance <A> UnavailableDataProvider<A>(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = v3;
  *(void *)(v3 + 16) = v3;
  uint64_t v8 = *v2;
  uint64_t v9 = v2[1];
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v6 + 32) = v4;
  type metadata accessor for GetAmbiguousDistanceIntentResponse();
  *uint64_t v4 = *(void *)(v6 + 16);
  v4[1] = protocol witness for AmbiguousDistanceProviding.query(start:end:) in conformance <A> UnavailableDataProvider<A>;
  return UnavailableDataProvider.query(start:end:)(v6 + 24, a1, a2, v8, v9);
}

uint64_t protocol witness for AmbiguousDistanceProviding.query(start:end:) in conformance <A> UnavailableDataProvider<A>()
{
  uint64_t v4 = *v0;
  uint64_t v5 = *v0;
  *(void *)(v5 + 16) = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(void *)(v4 + 24);
  int v2 = *(uint64_t (**)(uint64_t))(*(void *)(v5 + 16) + 8);
  return v2(v1);
}

uint64_t protocol witness for BloodPressureProviding.query(start:end:) in conformance <A> UnavailableDataProvider<A>(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = v3;
  *(void *)(v3 + 16) = v3;
  uint64_t v8 = *v2;
  uint64_t v9 = v2[1];
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v6 + 32) = v4;
  type metadata accessor for GetBloodPressureIntentResponse();
  *uint64_t v4 = *(void *)(v6 + 16);
  v4[1] = protocol witness for AmbiguousDistanceProviding.query(start:end:) in conformance <A> UnavailableDataProvider<A>;
  return UnavailableDataProvider.query(start:end:)(v6 + 24, a1, a2, v8, v9);
}

uint64_t type metadata instantiation function for UnavailableDataProvider()
{
  return swift_allocateGenericValueMetadata();
}

void *initializeBufferWithCopyOfBuffer for UnavailableDataProvider(void *a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  uint64_t v5 = a2[1];
  swift_retain();
  uint64_t result = a1;
  *a1 = v4;
  a1[1] = v5;
  return result;
}

uint64_t destroy for UnavailableDataProvider()
{
  return swift_release();
}

void *assignWithCopy for UnavailableDataProvider(void *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  swift_retain();
  *a1 = v3;
  a1[1] = v4;
  swift_release();
  return a1;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> assignWithTake for UnavailableDataProvider(void *a1, void *a2)
{
  uint64_t v2 = a2[1];
  *a1 = *a2;
  a1[1] = v2;
  swift_release();
}

uint64_t type metadata accessor for UnavailableDataProvider()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t CardioFitnessLevel.init(rawValue:)(uint64_t a1)
{
  switch(a1)
  {
    case 0:
      return 0;
    case 1:
      return 1;
    case 2:
      return 2;
    case 3:
      return 3;
    case 4:
      return 4;
  }
  return 0;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance CardioFitnessLevel()
{
  return == infix<A>(_:_:)() & 1;
}

uint64_t protocol witness for Hashable.hashValue.getter in conformance CardioFitnessLevel()
{
  return RawRepresentable<>.hashValue.getter();
}

uint64_t protocol witness for Hashable.hash(into:) in conformance CardioFitnessLevel()
{
  return RawRepresentable<>.hash(into:)();
}

uint64_t protocol witness for Hashable._rawHashValue(seed:) in conformance CardioFitnessLevel()
{
  return RawRepresentable<>._rawHashValue(seed:)();
}

uint64_t protocol witness for RawRepresentable.init(rawValue:) in conformance CardioFitnessLevel@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = CardioFitnessLevel.init(rawValue:)(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v3 & 1;
  return result;
}

void protocol witness for RawRepresentable.rawValue.getter in conformance CardioFitnessLevel(void *a1@<X8>)
{
  CardioFitnessLevel.rawValue.getter();
  *a1 = v1;
}

id static CardioFitnessLevelResolutionResult.success(with:)()
{
  id ObjCClassFromMetadata = (id)swift_getObjCClassFromMetadata();
  CardioFitnessLevel.rawValue.getter();
  id v1 = objc_msgSend(ObjCClassFromMetadata, sel_successWithResolvedValue_, v0);
  return v1;
}

id static CardioFitnessLevelResolutionResult.confirmationRequired(with:)()
{
  id ObjCClassFromMetadata = (id)swift_getObjCClassFromMetadata();
  CardioFitnessLevel.rawValue.getter();
  id v1 = objc_msgSend(ObjCClassFromMetadata, sel_confirmationRequiredWithValueToConfirm_, v0);
  return v1;
}

id CardioFitnessLevelResolutionResult.__allocating_init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  id v4 = objc_allocWithZone(v2);
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  id v7 = objc_msgSend(v4, sel_initWithJSONDictionary_forIntent_);

  swift_bridgeObjectRelease();
  return v7;
}

id CardioFitnessLevelResolutionResult.init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  id v11 = 0;
  uint64_t v10 = a1;
  uint64_t v9 = a2;
  swift_bridgeObjectRetain();
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  v8.receiver = 0;
  v8.super_class = (Class)type metadata accessor for CardioFitnessLevelResolutionResult();
  id v7 = objc_msgSendSuper2(&v8, sel_initWithJSONDictionary_forIntent_, isa, a2);

  if (v7)
  {
    id v2 = v7;
    id v11 = v7;

    swift_bridgeObjectRelease();
    return v7;
  }
  else
  {

    swift_bridgeObjectRelease();
    return 0;
  }
}

uint64_t type metadata accessor for CardioFitnessLevelResolutionResult()
{
  return self;
}

id CardioFitnessLevelResolutionResult.__deallocating_deinit()
{
  char v3 = v0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CardioFitnessLevelResolutionResult();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t base witness table accessor for Equatable in CardioFitnessLevel()
{
  return lazy protocol witness table accessor for type CardioFitnessLevel and conformance CardioFitnessLevel();
}

unint64_t lazy protocol witness table accessor for type CardioFitnessLevel and conformance CardioFitnessLevel()
{
  uint64_t v2 = lazy protocol witness table cache variable for type CardioFitnessLevel and conformance CardioFitnessLevel;
  if (!lazy protocol witness table cache variable for type CardioFitnessLevel and conformance CardioFitnessLevel)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type CardioFitnessLevel and conformance CardioFitnessLevel);
    return WitnessTable;
  }
  return v2;
}

{
  unint64_t WitnessTable;
  uint64_t v2;

  uint64_t v2 = lazy protocol witness table cache variable for type CardioFitnessLevel and conformance CardioFitnessLevel;
  if (!lazy protocol witness table cache variable for type CardioFitnessLevel and conformance CardioFitnessLevel)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type CardioFitnessLevel and conformance CardioFitnessLevel);
    return WitnessTable;
  }
  return v2;
}

ValueMetadata *type metadata accessor for CardioFitnessLevel()
{
  return &type metadata for CardioFitnessLevel;
}

id GetCardioFitnessIntentHandler.__allocating_init(store:)(void *a1)
{
  id v2 = objc_allocWithZone(v1);
  return GetCardioFitnessIntentHandler.init(store:)(a1);
}

id GetCardioFitnessIntentHandler.init(store:)(void *a1)
{
  ObjectType = (objc_class *)swift_getObjectType();
  __dst[5] = a1;
  id v2 = v1;
  id v13 = v1;
  outlined init with copy of QuantityPersisting?(a1, v11);
  if (v11[3])
  {
    outlined init with take of QuantityPersisting(v11, __dst);
  }
  else
  {
    v3.store.super.Class isa = CycleTrackingFetcher.init()().store.super.isa;
    __dst[3] = &type metadata for CardioFitnessFetcher;
    __dst[4] = &protocol witness table for CardioFitnessFetcher;
    __dst[0] = v3.store.super.isa;
    outlined destroy of QuantityPersisting?((uint64_t)v11);
  }
  outlined init with take of QuantityPersisting(__dst, &v7[OBJC_IVAR____TtC19SiriWellnessIntents29GetCardioFitnessIntentHandler_store]);

  v10.receiver = v13;
  v10.super_class = ObjectType;
  id v6 = objc_msgSendSuper2(&v10, sel_init);
  id v4 = v6;
  id v13 = v6;
  outlined destroy of QuantityPersisting?((uint64_t)a1);

  return v6;
}

uint64_t GetCardioFitnessIntentHandler.handle(intent:)(uint64_t a1)
{
  v2[24] = v1;
  v2[23] = a1;
  v2[15] = v2;
  v2[16] = 0;
  v2[17] = 0;
  uint64_t v3 = type metadata accessor for Logger();
  v2[25] = v3;
  v2[26] = *(void *)(v3 - 8);
  v2[27] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  v2[28] = swift_task_alloc();
  v2[29] = swift_task_alloc();
  uint64_t v4 = type metadata accessor for Date();
  v2[30] = v4;
  v2[31] = *(void *)(v4 - 8);
  v2[32] = swift_task_alloc();
  v2[33] = swift_task_alloc();
  v2[34] = swift_task_alloc();
  v2[16] = a1;
  v2[17] = v1;
  return MEMORY[0x270FA2498](GetCardioFitnessIntentHandler.handle(intent:), 0);
}

{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;

  uint64_t v3 = *v1;
  *(void *)(v3 + 120) = *v1;
  *(void *)(v3 + 296) = a1;
  swift_task_dealloc();
  return MEMORY[0x270FA2498](GetCardioFitnessIntentHandler.handle(intent:), 0);
}

uint64_t GetCardioFitnessIntentHandler.handle(intent:)()
{
  uint64_t v1 = v0[24];
  v0[15] = v0;
  outlined init with copy of QuantityPersisting(v1 + OBJC_IVAR____TtC19SiriWellnessIntents29GetCardioFitnessIntentHandler_store, (uint64_t)(v0 + 2));
  uint64_t v7 = v0[5];
  uint64_t v5 = v0[6];
  __swift_project_boxed_opaque_existential_1(v0 + 2, v7);
  id v6 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(v5 + 8) + **(int **)(v5 + 8));
  id v2 = (void *)swift_task_alloc();
  *(void *)(v4 + 280) = v2;
  *id v2 = *(void *)(v4 + 120);
  v2[1] = GetCardioFitnessIntentHandler.handle(intent:);
  return v6(v7, v5);
}

{
  uint64_t v0;
  unsigned int (**v1)(void, uint64_t, void);
  void (**v2)(uint64_t, uint64_t, uint64_t);
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t (*v8)(char *);
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint8_t *buf;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint32_t size;
  os_log_type_t v21;
  NSObject *oslog;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void (*v35)(uint64_t, uint64_t, uint64_t);
  void *v36;
  id v37;
  unsigned int (*v38)(void, uint64_t, void);
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  char *v44;
  uint64_t v45;
  char v46;
  uint64_t v47;

  uint64_t v46 = *(unsigned char *)(v0 + 308);
  *(void *)(v0 + 120) = v0;
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  if ((v46 & 1) == 0)
  {
    type metadata accessor for GetCardioFitnessIntentResponse();
    uint64_t v44 = GetCardioFitnessIntentResponse.__allocating_init(code:userActivity:)(101, 0);
LABEL_19:
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v8 = *(uint64_t (**)(char *))(*(void *)(v45 + 120) + 8);
    return v8(v44);
  }
  uint64_t v43 = objc_msgSend(*(id *)(v45 + 184), sel_startDate);
  if (v43)
  {
    uint64_t v40 = *(void *)(v45 + 264);
    uint64_t v41 = *(void *)(v45 + 240);
    uint64_t v42 = *(void *)(v45 + 232);
    uint64_t v39 = *(void *)(v45 + 248);
    static Date._unconditionallyBridgeFromObjectiveC(_:)();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v39 + 32))(v42, v40, v41);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v39 + 56))(v42, 0, 1, v41);
  }
  else
  {
    (*(void (**)(void, uint64_t, uint64_t, void))(*(void *)(v45 + 248) + 56))(*(void *)(v45 + 232), 1, 1, *(void *)(v45 + 240));
  }
  uint64_t v1 = (unsigned int (**)(void, uint64_t, void))(*(void *)(v45 + 248) + 48);
  uint64_t v38 = *v1;
  if ((*v1)(*(void *)(v45 + 232), 1, *(void *)(v45 + 240)) == 1)
  {
    outlined destroy of Date?(*(void *)(v45 + 232));
LABEL_16:
    uint64_t v7 = *(void *)(v45 + 216);
    uint64_t v19 = *(void *)(v45 + 200);
    uint64_t v17 = *(void *)(v45 + 208);
    uint64_t v18 = Logger.wellnessIntents.unsafeMutableAddressor();
    swift_beginAccess();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v17 + 16))(v7, v18, v19);
    swift_endAccess();
    oslog = Logger.logObject.getter();
    uint64_t v21 = static os_log_type_t.error.getter();
    *(void *)(v45 + 144) = 2;
    lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    lazy protocol witness table accessor for type Int and conformance Int();
    UnsignedInteger<>.init<A>(_:)();
    uint32_t size = *(_DWORD *)(v45 + 304);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
    uint64_t v23 = _allocateUninitializedArray<A>(_:)();
    if (os_log_type_enabled(oslog, v21))
    {
      buf = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
      uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      uint64_t v14 = createStorage<A>(capacity:type:)(0);
      uint64_t v15 = createStorage<A>(capacity:type:)(0);
      *(void *)(v45 + 152) = buf;
      *(void *)(v45 + 160) = v14;
      *(void *)(v45 + 168) = v15;
      serialize(_:at:)(0, (unsigned char **)(v45 + 152));
      serialize(_:at:)(0, (unsigned char **)(v45 + 152));
      *(void *)(v45 + 176) = v23;
      uint64_t v16 = (void *)swift_task_alloc();
      v16[2] = v45 + 152;
      v16[3] = v45 + 160;
      v16[4] = v45 + 168;
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
      lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
      Sequence.forEach(_:)();
      swift_task_dealloc();
      _os_log_impl(&dword_25DE00000, oslog, v21, "Must provide start and end dates for GetCardioFitnessIntent", buf, size);
      destroyStorage<A>(_:count:)(v14, 0, v12);
      destroyStorage<A>(_:count:)(v15, 0, MEMORY[0x263F8EE58] + 8);
      MEMORY[0x2611C8D90](buf, MEMORY[0x263F8E778]);
    }
    swift_bridgeObjectRelease();
    objc_super v10 = *(void *)(v45 + 216);
    id v11 = *(void *)(v45 + 200);
    uint64_t v9 = *(void *)(v45 + 208);

    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v10, v11);
    type metadata accessor for GetCardioFitnessIntentResponse();
    uint64_t v44 = GetCardioFitnessIntentResponse.__allocating_init(code:userActivity:)(5, 0);
    goto LABEL_19;
  }
  uint64_t v36 = *(void **)(v45 + 184);
  id v2 = (void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v45 + 248) + 32);
  uint64_t v35 = *v2;
  (*v2)(*(void *)(v45 + 272), *(void *)(v45 + 232), *(void *)(v45 + 240));
  uint64_t v37 = objc_msgSend(v36, sel_endDate);
  if (v37)
  {
    uint64_t v31 = *(void *)(v45 + 264);
    uint64_t v33 = *(void *)(v45 + 240);
    uint64_t v34 = *(void *)(v45 + 224);
    unint64_t v32 = *(void *)(v45 + 248);
    static Date._unconditionallyBridgeFromObjectiveC(_:)();
    v35(v34, v31, v33);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v32 + 56))(v34, 0, 1, v33);
  }
  else
  {
    (*(void (**)(void, uint64_t, uint64_t, void))(*(void *)(v45 + 248) + 56))(*(void *)(v45 + 224), 1, 1, *(void *)(v45 + 240));
  }
  if (v38(*(void *)(v45 + 224), 1, *(void *)(v45 + 240)) == 1)
  {
    uint64_t v30 = *(void *)(v45 + 272);
    uint64_t v29 = *(void *)(v45 + 240);
    unint64_t v28 = *(void *)(v45 + 248);
    outlined destroy of Date?(*(void *)(v45 + 224));
    (*(void (**)(uint64_t, uint64_t))(v28 + 8))(v30, v29);
    goto LABEL_16;
  }
  uint64_t v24 = *(void *)(v45 + 192);
  v35(*(void *)(v45 + 256), *(void *)(v45 + 224), *(void *)(v45 + 240));
  outlined init with copy of QuantityPersisting(v24 + OBJC_IVAR____TtC19SiriWellnessIntents29GetCardioFitnessIntentHandler_store, v45 + 56);
  uint64_t v25 = *(void *)(v45 + 80);
  uint64_t v26 = *(void *)(v45 + 88);
  __swift_project_boxed_opaque_existential_1((void *)(v45 + 56), v25);
  unint64_t v27 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v26 + 16) + **(int **)(v26 + 16));
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v45 + 288) = v3;
  *uint64_t v3 = *(void *)(v45 + 120);
  v3[1] = GetCardioFitnessIntentHandler.handle(intent:);
  uint64_t v4 = *(void *)(v45 + 272);
  uint64_t v5 = *(void *)(v45 + 256);
  return v27(v4, v5, v25, v26);
}

{
  void *v0;
  uint64_t (*v1)(uint64_t);
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;

  uint64_t v5 = v0[34];
  uint64_t v4 = v0[32];
  uint64_t v3 = v0[31];
  id v6 = v0[30];
  v0[15] = v0;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 7));
  uint64_t v7 = *(void (**)(uint64_t, uint64_t))(v3 + 8);
  v7(v4, v6);
  v7(v5, v6);
  uint64_t v8 = v0[37];
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(uint64_t))(v0[15] + 8);
  return v1(v8);
}

uint64_t GetCardioFitnessIntentHandler.handle(intent:)(char a1)
{
  uint64_t v3 = *v1;
  *(void *)(v3 + 120) = *v1;
  *(unsigned char *)(v3 + 308) = a1;
  swift_task_dealloc();
  return MEMORY[0x270FA2498](GetCardioFitnessIntentHandler.handle(intent:), 0);
}

uint64_t @objc closure #1 in GetCardioFitnessIntentHandler.handle(intent:)(void *a1, const void *a2, void *a3)
{
  v3[4] = a3;
  v3[3] = a1;
  void v3[2] = v3;
  id v5 = a1;
  v3[5] = _Block_copy(a2);
  id v6 = a3;
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v10 + 48) = v7;
  *uint64_t v7 = *(void *)(v10 + 16);
  v7[1] = @objc closure #1 in LogQuantityIntentHandler.handle(intent:);
  return GetCardioFitnessIntentHandler.handle(intent:)((uint64_t)a1);
}

id GetCardioFitnessIntentHandler.__allocating_init()()
{
  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

uint64_t GetCardioFitnessIntentHandler.init()()
{
  if (!"SiriWellnessIntents.GetCardioFitnessIntentHandler")
  {
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  uint64_t result = closure #1 in _unimplementedInitializer(className:initName:file:line:column:)((uint64_t)"SiriWellnessIntents.GetCardioFitnessIntentHandler", 49, (unint64_t)"init()", 6, 2, (unint64_t)"SiriWellnessIntents/GetCardioFitnessIntentHandler.swift", 55, 2, v1, 0xEuLL, 0x14uLL);
  __break(1u);
  return result;
}

id GetCardioFitnessIntentHandler.__deallocating_deinit()
{
  uint64_t v3 = v0;
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t CardioFitnessFetcher.query(start:end:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[18] = a3;
  v3[17] = a2;
  v3[16] = a1;
  v3[5] = v3;
  v3[6] = 0;
  v3[7] = 0;
  v3[8] = 0;
  v3[14] = 0;
  uint64_t v4 = type metadata accessor for Logger();
  v3[19] = v4;
  v3[20] = *(void *)(v4 - 8);
  v3[21] = swift_task_alloc();
  uint64_t v5 = type metadata accessor for Date();
  v3[22] = v5;
  v3[23] = *(void *)(v5 - 8);
  v3[24] = swift_task_alloc();
  v3[25] = swift_task_alloc();
  v3[6] = a1;
  v3[7] = a2;
  v3[8] = a3;
  return MEMORY[0x270FA2498](CardioFitnessFetcher.query(start:end:), 0);
}

uint64_t CardioFitnessFetcher.query(start:end:)()
{
  *(void *)(v0 + 40) = v0;
  uint64_t v37 = self;
  uint64_t v38 = (void *)*MEMORY[0x263F09F20];
  id v1 = (id)*MEMORY[0x263F09F20];
  id v2 = objc_msgSend(v37, sel_quantityTypeForIdentifier_, v38);
  *(void *)(v0 + 208) = v2;
  id v39 = v2;

  if (v39)
  {
    uint64_t v33 = *(void *)(v36 + 200);
    uint64_t v34 = *(void *)(v36 + 192);
    uint64_t v30 = *(void *)(v36 + 176);
    unint64_t v32 = *(void **)(v36 + 144);
    uint64_t v29 = *(void *)(v36 + 136);
    uint64_t v28 = *(void *)(v36 + 128);
    uint64_t v27 = *(void *)(v36 + 184);
    *(void *)(v36 + 112) = v39;
    Swift::String v3 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("query(start:end:)", 0x11uLL, 1);
    *(void *)(v36 + 216) = v3._object;
    id v4 = v32;
    uint64_t v31 = *(void (**)(uint64_t, uint64_t, uint64_t))(v27 + 16);
    v31(v33, v28, v30);
    v31(v34, v29, v30);
    id v5 = v39;
    uint64_t v35 = (void *)swift_task_alloc();
    *(void *)(v36 + 224) = v35;
    v35[2] = v32;
    v35[3] = v33;
    v35[4] = v34;
    v35[5] = v39;
    id v6 = (void *)swift_task_alloc();
    *(void *)(v36 + 232) = v6;
    uint64_t CardioFitnessIntentResponse = type metadata accessor for GetCardioFitnessIntentResponse();
    void *v6 = *(void *)(v36 + 40);
    v6[1] = CardioFitnessFetcher.query(start:end:);
    return MEMORY[0x270FA2318](v36 + 120, 0, 0, v3._countAndFlagsBits, v3._object, partial apply for closure #1 in CardioFitnessFetcher.query(start:end:), v35, CardioFitnessIntentResponse);
  }
  else
  {
    uint64_t v8 = *(void *)(v36 + 168);
    uint64_t v22 = *(void *)(v36 + 152);
    uint64_t v20 = *(void *)(v36 + 160);
    uint64_t v21 = Logger.wellnessIntents.unsafeMutableAddressor();
    swift_beginAccess();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v20 + 16))(v8, v21, v22);
    swift_endAccess();
    uint64_t v25 = Logger.logObject.getter();
    os_log_type_t v24 = static os_log_type_t.error.getter();
    *(void *)(v36 + 72) = 2;
    lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    lazy protocol witness table accessor for type Int and conformance Int();
    UnsignedInteger<>.init<A>(_:)();
    uint32_t v23 = *(_DWORD *)(v36 + 240);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
    uint64_t v26 = _allocateUninitializedArray<A>(_:)();
    if (os_log_type_enabled(v25, v24))
    {
      buf = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
      uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      uint64_t v17 = createStorage<A>(capacity:type:)(0);
      uint64_t v18 = createStorage<A>(capacity:type:)(0);
      *(void *)(v36 + 80) = buf;
      *(void *)(v36 + 88) = v17;
      *(void *)(v36 + 96) = v18;
      serialize(_:at:)(0, (unsigned char **)(v36 + 80));
      serialize(_:at:)(0, (unsigned char **)(v36 + 80));
      *(void *)(v36 + 104) = v26;
      uint64_t v19 = (void *)swift_task_alloc();
      v19[2] = v36 + 80;
      v19[3] = v36 + 88;
      v19[4] = v36 + 96;
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
      lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
      Sequence.forEach(_:)();
      swift_task_dealloc();
      _os_log_impl(&dword_25DE00000, v25, v24, "Couldn't create HKQuantityType for vo2max.", buf, v23);
      destroyStorage<A>(_:count:)(v17, 0, v15);
      destroyStorage<A>(_:count:)(v18, 0, MEMORY[0x263F8EE58] + 8);
      MEMORY[0x2611C8D90](buf, MEMORY[0x263F8E778]);
    }
    swift_bridgeObjectRelease();
    uint64_t v12 = *(void *)(v36 + 168);
    uint64_t v13 = *(void *)(v36 + 152);
    uint64_t v11 = *(void *)(v36 + 160);

    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v12, v13);
    type metadata accessor for GetCardioFitnessIntentResponse();
    uint64_t v14 = GetCardioFitnessIntentResponse.__allocating_init(code:userActivity:)(5, 0);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v9 = *(uint64_t (**)(char *))(*(void *)(v36 + 40) + 8);
    return v9(v14);
  }
}

{
  uint64_t v0;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t);
  void *v8;
  uint64_t v9;

  uint64_t v8 = *(void **)(*(void *)v0 + 208);
  id v4 = *(void *)(*(void *)v0 + 200);
  id v5 = *(void *)(*(void *)v0 + 192);
  Swift::String v3 = *(void *)(*(void *)v0 + 184);
  id v6 = *(void *)(*(void *)v0 + 176);
  id v2 = *(void **)(*(void *)v0 + 144);
  *(void *)(*(void *)v0 + 40) = *(void *)v0;
  swift_task_dealloc();
  swift_task_dealloc();

  uint64_t v7 = *(void (**)(uint64_t, uint64_t))(v3 + 8);
  v7(v4, v6);
  v7(v5, v6);

  swift_bridgeObjectRelease();
  return MEMORY[0x270FA2498](CardioFitnessFetcher.query(start:end:), 0);
}

{
  void *v0;
  void *v1;
  uint64_t (*v2)(uint64_t);
  uint64_t v4;
  uint64_t v5;

  id v1 = (void *)v0[26];
  v0[5] = v0;
  id v4 = v0[15];

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  id v2 = *(uint64_t (**)(uint64_t))(v0[5] + 8);
  return v2(v4);
}

uint64_t closure #1 in CardioFitnessFetcher.query(start:end:)(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v74 = a1;
  id v100 = a2;
  uint64_t v75 = a3;
  uint64_t v51 = a4;
  id v97 = a5;
  uint64_t v70 = 0;
  uint64_t v95 = partial apply for closure #1 in closure #1 in CardioFitnessFetcher.query(start:end:);
  uint64_t v115 = 0;
  uint64_t v114 = 0;
  uint64_t v113 = 0;
  unint64_t v112 = 0;
  uint64_t v111 = 0;
  uint64_t v110 = 0;
  uint64_t v109 = 0;
  id v107 = 0;
  uint64_t v91 = type metadata accessor for Date();
  uint64_t v87 = *(void *)(v91 - 8);
  uint64_t v88 = v91 - 8;
  uint64_t v80 = v87;
  uint64_t v81 = *(void *)(v87 + 64);
  unint64_t v41 = (v81 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v91);
  uint64_t v90 = (char *)&v41 - v41;
  uint64_t v86 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<GetCardioFitnessIntentResponse, Never>);
  uint64_t v82 = *(void *)(v86 - 8);
  uint64_t v83 = v86 - 8;
  uint64_t v78 = v82;
  uint64_t v79 = *(void *)(v82 + 64);
  unint64_t v42 = (v79 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v86);
  uint64_t v85 = (char *)&v41 - v42;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TimeZone?);
  unint64_t v43 = (*(void *)(*(void *)(v6 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v6);
  uint64_t v60 = (char *)&v41 - v43;
  unint64_t v44 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Calendar?)
                               - 8)
                   + 64)
       + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v70);
  uint64_t v59 = (char *)&v41 - v44;
  uint64_t v105 = type metadata accessor for DateComponents();
  uint64_t v102 = *(void *)(v105 - 8);
  uint64_t v103 = v105 - 8;
  unint64_t v45 = (*(void *)(v102 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v105);
  id v104 = (char *)&v41 - v45;
  uint64_t v115 = (char *)&v41 - v45;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  unint64_t v46 = (*(void *)(*(void *)(v7 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v7);
  uint64_t v54 = (char *)&v41 - v46;
  unint64_t v47 = (v8 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388]((char *)&v41 - v46);
  uint64_t v55 = (uint64_t)&v41 - v47;
  uint64_t v69 = (int *)__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (dateRange: DateInterval?, predicate: NSPredicate?, sortDescriptors: [NSSortDescriptor], limit: Int));
  uint64_t v49 = *(void *)(*((void *)v69 - 1) + 64);
  unint64_t v48 = (v49 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v69);
  char v99 = (char *)&v41 - v48;
  unint64_t v50 = (v49 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v9);
  id v106 = (char *)&v41 - v50;
  uint64_t v114 = (char *)&v41 - v50;
  uint64_t v113 = v10;
  unint64_t v112 = a2;
  uint64_t v111 = v11;
  uint64_t v110 = v12;
  uint64_t v109 = v13;
  uint64_t v56 = v14[12];
  uint64_t v57 = v14[16];
  uint64_t v58 = v14[20];
  id v15 = a2;
  uint64_t v77 = *(void (**)(uint64_t, uint64_t, uint64_t))(v87 + 16);
  uint64_t v76 = v87 + 16;
  v77(v55, v75, v91);
  uint64_t v53 = *(void (**)(uint64_t))(v87 + 56);
  uint64_t v52 = v87 + 56;
  unsigned int v62 = 0;
  unsigned int v61 = 1;
  v53(v55);
  v77((uint64_t)v54, v51, v91);
  ((void (*)(char *, void, void, uint64_t))v53)(v54, v62, v61, v91);
  id v64 = (id)HKHealthStore.queryParameters(start:end:)(v106, v55, v54);
  uint64_t v65 = v16;
  uint64_t v68 = v17;
  outlined destroy of Date?((uint64_t)v54);
  outlined destroy of Date?(v55);

  id v18 = v64;
  *(void *)&v106[v56] = v64;
  swift_bridgeObjectRetain();
  uint64_t v19 = v58;
  uint64_t v20 = v68;
  uint64_t v21 = v106;
  *(void *)&v106[v57] = v65;
  *(void *)&v21[v19] = v20;
  uint64_t v22 = type metadata accessor for Calendar();
  (*(void (**)(char *, void))(*(void *)(v22 - 8) + 56))(v59, v61);
  uint64_t v23 = type metadata accessor for TimeZone();
  (*(void (**)(char *, void))(*(void *)(v23 - 8) + 56))(v60, v61);
  DateComponents.init(calendar:timeZone:era:year:month:day:hour:minute:second:nanosecond:weekday:weekdayOrdinal:quarter:weekOfMonth:weekOfYear:yearForWeekOfYear:)();
  uint64_t v71 = 1;
  DateComponents.day.setter();
  unint64_t v73 = type metadata accessor for HKStatisticsQuery();
  id v24 = v97;
  uint64_t v63 = v69[12];
  uint64_t v66 = v69[16];
  uint64_t v67 = v69[20];
  outlined init with copy of DateInterval?(v106, v99);
  uint64_t v25 = v65;
  uint64_t v26 = v66;
  uint64_t v27 = v67;
  uint64_t v28 = v68;
  uint64_t v29 = v69;
  uint64_t v30 = v99;
  *(void *)&v99[v63] = v64;
  *(void *)&v30[v26] = v25;
  *(void *)&v30[v27] = v28;
  uint64_t v93 = *(void **)&v30[v29[12]];
  uint64_t v98 = *(void *)&v30[v29[16]];
  type metadata accessor for HKStatisticsOptions();
  uint64_t v31 = _allocateUninitializedArray<A>(_:)();
  *unint64_t v32 = 2;
  _finalizeUninitializedArray<A>(_:)();
  uint64_t v72 = v31;
  lazy protocol witness table accessor for type HKStatisticsOptions and conformance HKStatisticsOptions();
  SetAlgebra<>.init(arrayLiteral:)();
  uint64_t v94 = v108;
  (*(void (**)(char *, uint64_t, uint64_t))(v82 + 16))(v85, v74, v86);
  v77((uint64_t)v90, v75, v91);
  id v33 = v100;
  unint64_t v84 = (*(unsigned __int8 *)(v78 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v78 + 80);
  unint64_t v89 = (v84 + v79 + *(unsigned __int8 *)(v80 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v80 + 80);
  unint64_t v92 = (v89 + v81 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v96 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v82 + 32))(v96 + v84, v85, v86);
  (*(void (**)(unint64_t, char *, uint64_t))(v87 + 32))(v96 + v89, v90, v91);
  uint64_t v34 = v93;
  uint64_t v35 = v94;
  uint64_t v36 = (uint64_t)v95;
  uint64_t v37 = v96;
  id v38 = v97;
  *(void *)(v96 + v92) = v100;
  id v101 = HKStatisticsQuery.__allocating_init(quantityType:quantitySamplePredicate:options:completionHandler:)(v38, v34, v35, v36, v37);
  swift_bridgeObjectRelease();
  outlined destroy of DateInterval?((uint64_t)v99);
  id v107 = v101;
  id v39 = v100;
  objc_msgSend(v100, sel_executeQuery_, v101);

  (*(void (**)(char *, uint64_t))(v102 + 8))(v104, v105);
  return outlined destroy of (dateRange: DateInterval?, predicate: NSPredicate?, sortDescriptors: [NSSortDescriptor], limit: Int)((uint64_t)v106);
}

void closure #1 in closure #1 in CardioFitnessFetcher.query(start:end:)(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  uint64_t v218 = a1;
  id v222 = a2;
  uint64_t v235 = a3;
  uint64_t v219 = a4;
  uint64_t v220 = a5;
  id v221 = a6;
  uint64_t v212 = 0;
  uint64_t v203 = partial apply for implicit closure #1 in closure #1 in closure #1 in CardioFitnessFetcher.query(start:end:);
  uint64_t v204 = partial apply for implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:);
  uint64_t v205 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
  uint64_t v206 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
  uint64_t v207 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
  uint64_t v208 = partial apply for closure #1 in osLogInternal(_:log:type:);
  uint64_t v209 = partial apply for closure #1 in osLogInternal(_:log:type:);
  uint64_t v210 = partial apply for closure #1 in osLogInternal(_:log:type:);
  uint64_t v292 = 0;
  uint64_t v291 = 0;
  uint32_t v290 = 0;
  uint64_t v289 = 0;
  uint64_t v288 = 0;
  uint64_t v287 = 0;
  uint64_t v211 = 0;
  id v278 = 0;
  id v277 = 0;
  id v276 = 0;
  id v275 = 0;
  id v274 = 0;
  double v265 = 0.0;
  id v256 = 0;
  id v255 = 0;
  int v254 = 0;
  id v249 = 0;
  uint64_t v213 = type metadata accessor for Date();
  uint64_t v214 = *(void *)(v213 - 8);
  uint64_t v215 = v213 - 8;
  unint64_t v216 = (*(void *)(v214 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](0);
  uint64_t v217 = (char *)v61 - v216;
  uint64_t v223 = type metadata accessor for Logger();
  uint64_t v224 = *(void *)(v223 - 8);
  uint64_t v225 = v223 - 8;
  uint64_t v231 = *(void *)(v224 + 64);
  unint64_t v226 = (v231 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v235);
  uint64_t v227 = (char *)v61 - v226;
  unint64_t v228 = (v231 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v6);
  int v229 = (char *)v61 - v228;
  unint64_t v230 = (v231 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v7);
  uint64_t v232 = (char *)v61 - v230;
  unint64_t v233 = (v231 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v8);
  uint64_t v234 = (char *)v61 - v233;
  uint64_t v292 = v9;
  uint64_t v291 = v10;
  uint32_t v290 = v11;
  uint64_t v289 = v12;
  uint64_t v288 = v13;
  uint64_t v287 = v14;
  id v15 = v11;
  if (v235)
  {
    uint64_t v202 = v235;
    uint64_t v200 = &v237;
    uint64_t v237 = v235;
    uint64_t v199 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Error);
    type metadata accessor for related decl 'e' for HKErrorCode();
    char v16 = swift_dynamicCast();
    if (v16) {
      uint64_t v198 = v236;
    }
    else {
      uint64_t v198 = 0;
    }
    uint64_t v201 = v198;
  }
  else
  {
    uint64_t v201 = 0;
  }
  id v197 = v201;
  if (v201)
  {
    id v196 = v197;
    id v192 = v197;
    id v249 = v197;
    id v18 = v197;
    uint64_t v194 = (id *)v248;
    v248[0] = v192;
    uint64_t v193 = type metadata accessor for related decl 'e' for HKErrorCode();
    lazy protocol witness table accessor for type related decl 'e' for HKErrorCode and conformance related decl 'e' for HKErrorCode();
    _BridgedStoredNSError.code.getter();
    outlined destroy of HealthKitPersistor(v194);
    if (v248[1] == 6)
    {
      uint64_t v190 = 0;
      type metadata accessor for GetCardioFitnessIntentResponse();
      uint64_t v19 = GetCardioFitnessIntentResponse.__allocating_init(code:userActivity:)(103, v190);
      uint64_t v191 = &v238;
      uint64_t v238 = v19;
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<GetCardioFitnessIntentResponse, Never>);
      CheckedContinuation.resume(returning:)();
    }
    else
    {
      uint64_t v20 = v234;
      uint64_t v171 = Logger.wellnessIntents.unsafeMutableAddressor();
      int v172 = &v247;
      uint64_t v178 = 32;
      swift_beginAccess();
      (*(void (**)(char *, uint64_t, uint64_t))(v224 + 16))(v20, v171, v223);
      swift_endAccess();
      id v21 = v192;
      uint64_t v179 = 7;
      uint64_t v180 = swift_allocObject();
      *(void *)(v180 + 16) = v192;
      uint64_t v188 = Logger.logObject.getter();
      int v189 = static os_log_type_t.error.getter();
      unint64_t v175 = &v245;
      uint64_t v245 = 12;
      unint64_t v173 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
      unint64_t v174 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
      lazy protocol witness table accessor for type Int and conformance Int();
      UnsignedInteger<>.init<A>(_:)();
      uint32_t v176 = v246;
      uint64_t v177 = 17;
      uint64_t v182 = swift_allocObject();
      *(unsigned char *)(v182 + 16) = 64;
      uint64_t v183 = swift_allocObject();
      *(unsigned char *)(v183 + 16) = 8;
      uint64_t v22 = swift_allocObject();
      uint64_t v23 = v180;
      uint64_t v181 = v22;
      *(void *)(v22 + 16) = v203;
      *(void *)(v22 + 24) = v23;
      uint64_t v24 = swift_allocObject();
      uint64_t v25 = v181;
      uint64_t v185 = v24;
      *(void *)(v24 + 16) = v204;
      *(void *)(v24 + 24) = v25;
      uint64_t v187 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
      uint64_t v184 = _allocateUninitializedArray<A>(_:)();
      uint32_t v186 = v26;
      swift_retain();
      uint64_t v27 = v182;
      uint64_t v28 = v186;
      char *v186 = v205;
      v28[1] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v27;
      swift_retain();
      uint64_t v29 = v183;
      uint64_t v30 = v186;
      v186[2] = v206;
      v30[3] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v29;
      swift_retain();
      uint64_t v31 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v185;
      unint64_t v32 = v186;
      v186[4] = v207;
      v32[5] = v31;
      _finalizeUninitializedArray<A>(_:)();
      swift_bridgeObjectRelease();
      if (os_log_type_enabled(v188, (os_log_type_t)v189))
      {
        uint64_t v33 = v211;
        uint64_t v164 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
        uint64_t v163 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
        uint64_t v165 = createStorage<A>(capacity:type:)(1);
        uint64_t v166 = createStorage<A>(capacity:type:)(0);
        id v167 = &v243;
        uint64_t v243 = v164;
        uint64_t v168 = &v242;
        uint64_t v242 = v165;
        uint64_t v169 = &v241;
        uint64_t v241 = v166;
        serialize(_:at:)(2, &v243);
        serialize(_:at:)(1, v167);
        uint64_t v239 = v205;
        uint64_t v240 = v182;
        closure #1 in osLogInternal(_:log:type:)(&v239, (uint64_t)v167, (uint64_t)v168, (uint64_t)v169);
        uint64_t v170 = v33;
        if (v33)
        {
          __break(1u);
        }
        else
        {
          uint64_t v239 = v206;
          uint64_t v240 = v183;
          closure #1 in osLogInternal(_:log:type:)(&v239, (uint64_t)&v243, (uint64_t)&v242, (uint64_t)&v241);
          uint64_t v162 = 0;
          uint64_t v239 = v207;
          uint64_t v240 = v185;
          closure #1 in osLogInternal(_:log:type:)(&v239, (uint64_t)&v243, (uint64_t)&v242, (uint64_t)&v241);
          _os_log_impl(&dword_25DE00000, v188, (os_log_type_t)v189, "Error while querying HealthKit for quantity samples: %@", v164, v176);
          destroyStorage<A>(_:count:)(v165, 1, v163);
          destroyStorage<A>(_:count:)(v166, 0, MEMORY[0x263F8EE58] + 8);
          MEMORY[0x2611C8D90](v164, MEMORY[0x263F8E778]);
          swift_release();
          swift_release();
          swift_release();
        }
      }
      else
      {
        swift_release();
        swift_release();
        swift_release();
      }

      (*(void (**)(char *, uint64_t))(v224 + 8))(v234, v223);
      uint64_t v160 = 0;
      type metadata accessor for GetCardioFitnessIntentResponse();
      uint64_t v34 = GetCardioFitnessIntentResponse.__allocating_init(code:userActivity:)(5, v160);
      uint64_t v161 = &v244;
      uint64_t v244 = v34;
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<GetCardioFitnessIntentResponse, Never>);
      CheckedContinuation.resume(returning:)();
    }
  }
  else
  {
    id v17 = v222;
    if (v222)
    {
      id v195 = v222;
      id v149 = v222;
      id v278 = v222;
      unint64_t v142 = 0x263F0A000uLL;
      id v146 = objc_msgSend(self, sel_minuteUnit);
      id v277 = v146;
      id v143 = objc_msgSend(self, sel_gramUnitWithMetricPrefix_, 9);
      id v276 = v143;
      id v144 = objc_msgSend(self, sel_literUnitWithMetricPrefix_, 4);
      id v275 = v144;
      unint64_t v145 = 0x1F7C56000uLL;
      id v147 = objc_msgSend(v144, (SEL)0x1F7C5650ALL, v143);
      id v148 = objc_msgSend(v147, (SEL)(v145 + 1290), v146);

      id v274 = v148;
      id v150 = objc_msgSend(v149, sel_averageQuantity);
      if (v150)
      {
        id v141 = v150;
        id v137 = v150;
        objc_msgSend(v150, sel_doubleValueForUnit_, v148);
        double v138 = v36;

        double v139 = v138;
        int v140 = 0;
      }
      else
      {
        double v139 = 0.0;
        int v140 = 1;
      }
      double v136 = v139;
      if (v140)
      {
        uint64_t v37 = v229;
        uint64_t v126 = Logger.wellnessIntents.unsafeMutableAddressor();
        uint64_t v127 = &v273;
        swift_beginAccess();
        (*(void (**)(char *, uint64_t, uint64_t))(v224 + 16))(v37, v126, v223);
        swift_endAccess();
        unint64_t v133 = Logger.logObject.getter();
        int v132 = static os_log_type_t.error.getter();
        uint64_t v130 = &v271;
        uint64_t v271 = 2;
        unint64_t v128 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
        unint64_t v129 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
        lazy protocol witness table accessor for type Int and conformance Int();
        UnsignedInteger<>.init<A>(_:)();
        uint32_t v131 = v272;
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
        uint64_t v134 = _allocateUninitializedArray<A>(_:)();
        if (os_log_type_enabled(v133, (os_log_type_t)v132))
        {
          uint64_t v51 = v211;
          uint64_t v80 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
          uint64_t v78 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
          uint64_t v79 = 0;
          uint64_t v81 = createStorage<A>(capacity:type:)(0);
          uint64_t v82 = createStorage<A>(capacity:type:)(v79);
          uint64_t v86 = &v269;
          uint64_t v269 = v80;
          uint64_t v87 = &v268;
          uint64_t v268 = v81;
          unint64_t v84 = &v267;
          uint64_t v267 = v82;
          unsigned int v83 = 0;
          serialize(_:at:)(0, &v269);
          serialize(_:at:)(v83, v86);
          uint64_t v266 = v134;
          uint64_t v85 = v61;
          MEMORY[0x270FA5388](v61);
          uint64_t v52 = v87;
          uint64_t v53 = &v61[-6];
          uint64_t v88 = &v61[-6];
          v53[2] = v86;
          v53[3] = v52;
          v53[4] = v54;
          uint64_t v89 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
          lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
          Sequence.forEach(_:)();
          if (v51)
          {
            __break(1u);
          }
          else
          {
            _os_log_impl(&dword_25DE00000, v133, (os_log_type_t)v132, "Unable to create an average value for vo2Max", v80, v131);
            uint64_t v77 = 0;
            destroyStorage<A>(_:count:)(v81, 0, v78);
            destroyStorage<A>(_:count:)(v82, v77, MEMORY[0x263F8EE58] + 8);
            MEMORY[0x2611C8D90](v80, MEMORY[0x263F8E778]);
            swift_bridgeObjectRelease();
          }
        }
        else
        {
          swift_bridgeObjectRelease();
        }

        (*(void (**)(char *, uint64_t))(v224 + 8))(v229, v223);
        uint64_t v75 = 0;
        type metadata accessor for GetCardioFitnessIntentResponse();
        uint64_t v55 = GetCardioFitnessIntentResponse.__allocating_init(code:userActivity:)(5, v75);
        uint64_t v76 = &v270;
        uint64_t v270 = v55;
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<GetCardioFitnessIntentResponse, Never>);
        CheckedContinuation.resume(returning:)();
      }
      else
      {
        double v135 = v136;
        id v38 = v217;
        double v122 = v136;
        double v265 = v136;
        id v123 = self;
        (*(void (**)(char *, uint64_t, uint64_t))(v214 + 16))(v38, v220, v213);
        Class isa = Date._bridgeToObjectiveC()().super.isa;
        (*(void (**)(char *, uint64_t))(v214 + 8))(v217, v213);
        id v39 = v221;
        id v125 = objc_msgSend(v123, sel_cardioFitnessPropertiesForDate_healthStore_, isa, v221);

        if (v125)
        {
          id v121 = v125;
          id v106 = v125;
          id v256 = v125;
          id v108 = self;
          id v107 = objc_msgSend(v106, sel_biologicalSex);
          id v41 = objc_msgSend(v106, sel_age);
          id v110 = objc_msgSend(v108, sel_cardioFitnessLevelForVO2Max_biologicalSex_age_, v107, v41, v122);
          id v255 = v110;
          uint64_t v109 = 0;
          type metadata accessor for GetCardioFitnessIntentResponse();
          uint64_t v111 = GetCardioFitnessIntentResponse.__allocating_init(code:userActivity:)(4, v109);
          int v254 = v111;
          HKMedicationDoseEventStatus.rawValue.getter();
          uint64_t v43 = CardioFitnessLevel.init(rawValue:)(v42);
          uint64_t v251 = v43;
          char v252 = v44 & 1;
          if (v44) {
            uint64_t v253 = 0;
          }
          else {
            uint64_t v253 = v251;
          }
          objc_msgSend(v111, sel_setCardioFitnessLevel_, v253);
          unint64_t v45 = v111;
          uint64_t v105 = &v250;
          uint64_t v250 = v111;
          __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<GetCardioFitnessIntentResponse, Never>);
          CheckedContinuation.resume(returning:)();
        }
        else
        {
          uint64_t v40 = v227;
          uint64_t v112 = Logger.wellnessIntents.unsafeMutableAddressor();
          uint64_t v113 = &v264;
          swift_beginAccess();
          (*(void (**)(char *, uint64_t, uint64_t))(v224 + 16))(v40, v112, v223);
          swift_endAccess();
          unint64_t v119 = Logger.logObject.getter();
          int v118 = static os_log_type_t.error.getter();
          uint64_t v116 = &v262;
          uint64_t v262 = 2;
          unint64_t v114 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
          unint64_t v115 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
          lazy protocol witness table accessor for type Int and conformance Int();
          UnsignedInteger<>.init<A>(_:)();
          uint32_t v117 = v263;
          __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
          uint64_t v120 = _allocateUninitializedArray<A>(_:)();
          if (os_log_type_enabled(v119, (os_log_type_t)v118))
          {
            uint64_t v46 = v211;
            uint64_t v95 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
            uint64_t v93 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
            uint64_t v94 = 0;
            uint64_t v96 = createStorage<A>(capacity:type:)(0);
            uint64_t v97 = createStorage<A>(capacity:type:)(v94);
            id v101 = &v260;
            uint64_t v260 = v95;
            uint64_t v102 = &v259;
            uint64_t v259 = v96;
            char v99 = &v258;
            uint64_t v258 = v97;
            unsigned int v98 = 0;
            serialize(_:at:)(0, &v260);
            serialize(_:at:)(v98, v101);
            uint64_t v257 = v120;
            id v100 = v61;
            MEMORY[0x270FA5388](v61);
            unint64_t v47 = v102;
            unint64_t v48 = &v61[-6];
            uint64_t v103 = &v61[-6];
            void v48[2] = v101;
            v48[3] = v47;
            v48[4] = v49;
            uint64_t v104 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
            lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
            Sequence.forEach(_:)();
            if (v46)
            {
              __break(1u);
            }
            else
            {
              _os_log_impl(&dword_25DE00000, v119, (os_log_type_t)v118, "Unable to find the fitness Level", v95, v117);
              uint64_t v92 = 0;
              destroyStorage<A>(_:count:)(v96, 0, v93);
              destroyStorage<A>(_:count:)(v97, v92, MEMORY[0x263F8EE58] + 8);
              MEMORY[0x2611C8D90](v95, MEMORY[0x263F8E778]);
              swift_bridgeObjectRelease();
            }
          }
          else
          {
            swift_bridgeObjectRelease();
          }

          (*(void (**)(char *, uint64_t))(v224 + 8))(v227, v223);
          uint64_t v90 = 0;
          type metadata accessor for GetCardioFitnessIntentResponse();
          unint64_t v50 = GetCardioFitnessIntentResponse.__allocating_init(code:userActivity:)(5, v90);
          uint64_t v91 = &v261;
          uint64_t v261 = v50;
          __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<GetCardioFitnessIntentResponse, Never>);
          CheckedContinuation.resume(returning:)();
        }
      }
    }
    else
    {
      uint64_t v35 = v232;
      uint64_t v151 = Logger.wellnessIntents.unsafeMutableAddressor();
      uint64_t v152 = &v286;
      swift_beginAccess();
      (*(void (**)(char *, uint64_t, uint64_t))(v224 + 16))(v35, v151, v223);
      swift_endAccess();
      uint64_t v158 = Logger.logObject.getter();
      int v157 = static os_log_type_t.error.getter();
      unint64_t v155 = &v284;
      uint64_t v284 = 2;
      unint64_t v153 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
      unint64_t v154 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
      lazy protocol witness table accessor for type Int and conformance Int();
      UnsignedInteger<>.init<A>(_:)();
      uint32_t v156 = v285;
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
      uint64_t v159 = _allocateUninitializedArray<A>(_:)();
      if (os_log_type_enabled(v158, (os_log_type_t)v157))
      {
        uint64_t v56 = v211;
        uint64_t v65 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
        uint64_t v63 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
        uint64_t v64 = 0;
        uint64_t v66 = createStorage<A>(capacity:type:)(0);
        uint64_t v67 = createStorage<A>(capacity:type:)(v64);
        uint64_t v71 = &v282;
        uint32_t v282 = v65;
        uint64_t v72 = &v281;
        uint64_t v281 = v66;
        uint64_t v69 = &v280;
        uint64_t v280 = v67;
        unsigned int v68 = 0;
        serialize(_:at:)(0, &v282);
        serialize(_:at:)(v68, v71);
        uint64_t v279 = v159;
        uint64_t v70 = v61;
        MEMORY[0x270FA5388](v61);
        uint64_t v57 = v72;
        uint64_t v58 = &v61[-6];
        unint64_t v73 = &v61[-6];
        v58[2] = v71;
        v58[3] = v57;
        v58[4] = v59;
        uint64_t v74 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [(_:_:_:)]);
        lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
        Sequence.forEach(_:)();
        if (v56)
        {
          __break(1u);
        }
        else
        {
          _os_log_impl(&dword_25DE00000, v158, (os_log_type_t)v157, "Expecting to find statistics but didn't find them", v65, v156);
          uint64_t v62 = 0;
          destroyStorage<A>(_:count:)(v66, 0, v63);
          destroyStorage<A>(_:count:)(v67, v62, MEMORY[0x263F8EE58] + 8);
          MEMORY[0x2611C8D90](v65, MEMORY[0x263F8E778]);
          swift_bridgeObjectRelease();
        }
      }
      else
      {
        swift_bridgeObjectRelease();
      }

      (*(void (**)(char *, uint64_t))(v224 + 8))(v232, v223);
      v61[0] = 0;
      type metadata accessor for GetCardioFitnessIntentResponse();
      uint64_t v60 = GetCardioFitnessIntentResponse.__allocating_init(code:userActivity:)(5, v61[0]);
      v61[1] = &v283;
      os_log_type_t v283 = v60;
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<GetCardioFitnessIntentResponse, Never>);
      CheckedContinuation.resume(returning:)();
    }
  }
}

uint64_t implicit closure #1 in closure #1 in closure #1 in CardioFitnessFetcher.query(start:end:)(void *a1)
{
  id v1 = a1;
  id v2 = a1;
  uint64_t v5 = _convertErrorToNSError(_:)();

  return v5;
}

id HKStatisticsQuery.__allocating_init(quantityType:quantitySamplePredicate:options:completionHandler:)(void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v5 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  return @nonobjc HKStatisticsQuery.init(quantityType:quantitySamplePredicate:options:completionHandler:)(a1, a2, a3, a4, a5);
}

uint64_t CardioFitnessFetcher.preferredUnit()(uint64_t a1)
{
  v1[31] = a1;
  v1[21] = v1;
  v1[22] = 0;
  v1[23] = 0;
  v1[26] = 0;
  v1[28] = 0;
  uint64_t v2 = type metadata accessor for Logger();
  v1[32] = v2;
  v1[33] = *(void *)(v2 - 8);
  v1[34] = swift_task_alloc();
  v1[35] = swift_task_alloc();
  v1[22] = a1;
  return MEMORY[0x270FA2498](CardioFitnessFetcher.preferredUnit(), 0);
}

uint64_t CardioFitnessFetcher.preferredUnit()()
{
  uint64_t v44 = v0;
  *(void *)(v0 + 168) = v0;
  double v36 = self;
  uint64_t v37 = (void *)*MEMORY[0x263F09F20];
  id v1 = (id)*MEMORY[0x263F09F20];
  id v2 = objc_msgSend(v36, sel_quantityTypeForIdentifier_, v37);
  *(void *)(v0 + 288) = v2;
  id v38 = v2;

  if (v38)
  {
    uint64_t v3 = *(void *)(v35 + 280);
    uint64_t v25 = *(void *)(v35 + 256);
    uint64_t v23 = *(void *)(v35 + 264);
    *(void *)(v35 + 184) = v38;
    uint64_t v24 = Logger.wellnessIntents.unsafeMutableAddressor();
    swift_beginAccess();
    id v4 = *(void (**)(uint64_t, uint64_t, uint64_t))(v23 + 16);
    *(void *)(v35 + 296) = v4;
    *(void *)(v35 + 304) = (v23 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
    v4(v3, v24, v25);
    swift_endAccess();
    id v5 = v38;
    uint64_t v27 = swift_allocObject();
    *(void *)(v27 + 16) = v38;
    uint64_t v33 = Logger.logObject.getter();
    os_log_type_t v34 = static os_log_type_t.debug.getter();
    *(void *)(v35 + 192) = 12;
    *(void *)(v35 + 312) = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    *(void *)(v35 + 320) = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    *(void *)(v35 + 328) = lazy protocol witness table accessor for type Int and conformance Int();
    UnsignedInteger<>.init<A>(_:)();
    uint32_t size = *(_DWORD *)(v35 + 392);
    uint64_t v29 = swift_allocObject();
    *(unsigned char *)(v29 + 16) = 64;
    uint64_t v30 = swift_allocObject();
    *(unsigned char *)(v30 + 16) = 8;
    uint64_t v28 = swift_allocObject();
    *(void *)(v28 + 16) = partial apply for implicit closure #3 in LogQuantityIntentHandler.handle(intent:);
    *(void *)(v28 + 24) = v27;
    uint64_t v31 = swift_allocObject();
    *(void *)(v31 + 16) = partial apply for implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:);
    *(void *)(v31 + 24) = v28;
    *(void *)(v35 + 336) = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (_:_:_:));
    _allocateUninitializedArray<A>(_:)();
    unint64_t v32 = v6;
    swift_retain();
    *unint64_t v32 = partial apply for closure #1 in OSLogArguments.append(_:);
    v32[1] = v29;
    swift_retain();
    v32[2] = partial apply for closure #1 in OSLogArguments.append(_:);
    v32[3] = v30;
    swift_retain();
    v32[4] = partial apply for closure #1 in OSLogArguments.append(_:);
    v32[5] = v31;
    _finalizeUninitializedArray<A>(_:)();
    swift_bridgeObjectRelease();
    if (os_log_type_enabled(v33, v34))
    {
      buf = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
      uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      uint64_t v21 = createStorage<A>(capacity:type:)(1);
      uint64_t v22 = createStorage<A>(capacity:type:)(0);
      id v39 = buf;
      uint64_t v40 = v21;
      uint64_t v41 = v22;
      serialize(_:at:)(2, &v39);
      serialize(_:at:)(1, &v39);
      uint64_t v42 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
      uint64_t v43 = v29;
      closure #1 in osLogInternal(_:log:type:)(&v42, (uint64_t)&v39, (uint64_t)&v40, (uint64_t)&v41);
      uint64_t v42 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
      uint64_t v43 = v30;
      closure #1 in osLogInternal(_:log:type:)(&v42, (uint64_t)&v39, (uint64_t)&v40, (uint64_t)&v41);
      uint64_t v42 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
      uint64_t v43 = v31;
      closure #1 in osLogInternal(_:log:type:)(&v42, (uint64_t)&v39, (uint64_t)&v40, (uint64_t)&v41);
      _os_log_impl(&dword_25DE00000, v33, v34, "Looking for preferred units for %@", buf, size);
      destroyStorage<A>(_:count:)(v21, 1, v19);
      destroyStorage<A>(_:count:)(v22, 0, MEMORY[0x263F8EE58] + 8);
      MEMORY[0x2611C8D90](buf, MEMORY[0x263F8E778]);
      swift_release();
      swift_release();
      swift_release();
    }
    else
    {
      swift_release();
      swift_release();
      swift_release();
    }
    uint64_t v14 = *(void *)(v35 + 280);
    uint64_t v15 = *(void *)(v35 + 256);
    id v18 = *(id *)(v35 + 248);
    uint64_t v13 = *(void *)(v35 + 264);

    uint64_t v7 = *(void (**)(uint64_t, uint64_t))(v13 + 8);
    *(void *)(v35 + 344) = v7;
    *(void *)(v35 + 352) = (v13 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
    v7(v14, v15);
    id v8 = v18;
    *(void *)(v35 + 360) = type metadata accessor for HKQuantityType();
    _allocateUninitializedArray<A>(_:)();
    char v16 = v9;
    id v10 = v38;
    void *v16 = v38;
    _finalizeUninitializedArray<A>(_:)();
    *(void *)(v35 + 368) = lazy protocol witness table accessor for type HKQuantityType and conformance NSObject();
    Set.init(arrayLiteral:)();
    Class isa = Set._bridgeToObjectiveC()().super.isa;
    *(void *)(v35 + 376) = isa;
    swift_bridgeObjectRelease();
    *(void *)(v35 + 16) = *(void *)(v35 + 168);
    *(void *)(v35 + 56) = v35 + 200;
    *(void *)(v35 + 24) = CardioFitnessFetcher.preferredUnit();
    *(void *)(v35 + 112) = swift_continuation_init();
    *(void *)(v35 + 80) = MEMORY[0x263EF8330];
    *(_DWORD *)(v35 + 88) = 0x40000000;
    *(_DWORD *)(v35 + 92) = 0;
    *(void *)(v35 + 96) = @objc completion handler block implementation for @escaping @callee_unowned @convention(block) (@unowned NSDictionary, @unowned NSError?) -> () with result type [HKQuantityType : HKUnit];
    *(void *)(v35 + 104) = &block_descriptor_8;
    objc_msgSend(v18, sel_preferredUnitsForQuantityTypes_completion_, isa);
    return __swift_continuation_await_point();
  }
  else
  {
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v12 = *(uint64_t (**)(void))(*(void *)(v35 + 168) + 8);
    return v12(0);
  }
}

{
  void *v0;
  uint64_t v1;
  uint64_t (*v2)();
  void *v4;
  uint64_t v5;

  id v4 = (void *)*v0;
  v4[21] = *v0;
  id v1 = v4[6];
  v4[48] = v1;
  if (v1)
  {
    id v2 = CardioFitnessFetcher.preferredUnit();
  }
  else
  {
    id v2 = CardioFitnessFetcher.preferredUnit();
  }
  return MEMORY[0x270FA2498](v2, 0);
}

{
  uint64_t v0;
  void *v1;
  id v2;
  unint64_t v3;
  uint64_t (*v4)(uint64_t);
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;

  uint64_t v6 = *(id *)(v0 + 376);
  id v8 = *(void *)(v0 + 368);
  uint64_t v7 = *(void *)(v0 + 360);
  id v10 = *(id *)(v0 + 288);
  id v1 = *(void **)(v0 + 248);
  *(void *)(v0 + 168) = v0;
  uint64_t v9 = *(void *)(v0 + 200);
  *(void *)(v0 + 224) = v9;

  id v2 = v10;
  *(void *)(v0 + 240) = v10;
  uint64_t v3 = type metadata accessor for HKUnit();
  MEMORY[0x2611C8800](v0 + 240, v9, v7, v3, v8);

  uint64_t v11 = *(void *)(v0 + 232);
  swift_bridgeObjectRelease();

  swift_task_dealloc();
  swift_task_dealloc();
  id v4 = *(uint64_t (**)(uint64_t))(*(void *)(v0 + 168) + 8);
  return v4(v11);
}

{
  uint64_t v0;
  id v1;
  id v2;
  void *v3;
  uint64_t (*v4)(void);
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t);
  id v9;
  id v10;
  uint64_t v11;
  uint8_t *buf;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, uint64_t, uint64_t);
  id v22;
  uint32_t size;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  NSObject *v30;
  os_log_type_t v31;
  uint8_t *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t, uint64_t);
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;

  uint64_t v37 = v0;
  uint64_t v22 = *(id *)(v0 + 384);
  id v18 = *(id *)(v0 + 376);
  uint64_t v21 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 296);
  char v16 = *(void *)(v0 + 272);
  uint64_t v20 = *(void *)(v0 + 256);
  id v17 = *(id *)(v0 + 248);
  *(void *)(v0 + 168) = v0;
  swift_willThrow();

  id v1 = v22;
  *(void *)(v0 + 208) = v22;
  uint64_t v19 = Logger.wellnessIntents.unsafeMutableAddressor();
  swift_beginAccess();
  v21(v16, v19, v20);
  swift_endAccess();
  id v2 = v22;
  uint64_t v24 = swift_allocObject();
  *(void *)(v24 + 16) = v22;
  uint64_t v30 = Logger.logObject.getter();
  uint64_t v31 = static os_log_type_t.error.getter();
  *(void *)(v0 + 216) = 12;
  UnsignedInteger<>.init<A>(_:)();
  uint32_t size = *(_DWORD *)(v0 + 396);
  uint64_t v26 = swift_allocObject();
  *(unsigned char *)(v26 + 16) = 32;
  uint64_t v27 = swift_allocObject();
  *(unsigned char *)(v27 + 16) = 8;
  uint64_t v25 = swift_allocObject();
  *(void *)(v25 + 16) = partial apply for implicit closure #5 in HealthKitPersistor.save(quantityIdentifier:value:units:);
  *(void *)(v25 + 24) = v24;
  uint64_t v28 = swift_allocObject();
  *(void *)(v28 + 16) = partial apply for implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:);
  *(void *)(v28 + 24) = v25;
  _allocateUninitializedArray<A>(_:)();
  uint64_t v29 = v3;
  swift_retain();
  int *v29 = partial apply for closure #1 in OSLogArguments.append(_:);
  v29[1] = v26;
  swift_retain();
  v29[2] = partial apply for closure #1 in OSLogArguments.append(_:);
  v29[3] = v27;
  swift_retain();
  v29[4] = partial apply for closure #1 in OSLogArguments.append(_:);
  v29[5] = v28;
  _finalizeUninitializedArray<A>(_:)();
  swift_bridgeObjectRelease();
  if (os_log_type_enabled(v30, v31))
  {
    buf = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    uint64_t v13 = createStorage<A>(capacity:type:)(0);
    uint64_t v14 = createStorage<A>(capacity:type:)(1);
    unint64_t v32 = buf;
    uint64_t v33 = v13;
    os_log_type_t v34 = v14;
    serialize(_:at:)(2, &v32);
    serialize(_:at:)(1, &v32);
    uint64_t v35 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
    double v36 = v26;
    closure #1 in osLogInternal(_:log:type:)(&v35, (uint64_t)&v32, (uint64_t)&v33, (uint64_t)&v34);
    uint64_t v35 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
    double v36 = v27;
    closure #1 in osLogInternal(_:log:type:)(&v35, (uint64_t)&v32, (uint64_t)&v33, (uint64_t)&v34);
    uint64_t v35 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
    double v36 = v28;
    closure #1 in osLogInternal(_:log:type:)(&v35, (uint64_t)&v32, (uint64_t)&v33, (uint64_t)&v34);
    _os_log_impl(&dword_25DE00000, v30, v31, "Error fetching preferred units: %s", buf, size);
    destroyStorage<A>(_:count:)(v13, 0, v11);
    destroyStorage<A>(_:count:)(v14, 1, MEMORY[0x263F8EE58] + 8);
    MEMORY[0x2611C8D90](buf, MEMORY[0x263F8E778]);
    swift_release();
    swift_release();
    swift_release();
  }
  else
  {
    swift_release();
    swift_release();
    swift_release();
  }
  uint64_t v9 = (id)v15[48];
  id v8 = (void (*)(uint64_t, uint64_t))v15[43];
  uint64_t v6 = v15[34];
  uint64_t v7 = v15[32];
  id v10 = (id)v15[36];

  v8(v6, v7);
  swift_task_dealloc();
  swift_task_dealloc();
  id v4 = *(uint64_t (**)(void))(v15[21] + 8);
  return v4(0);
}

uint64_t protocol witness for CardioFitnessFetching.isReadingAuthorized() in conformance CardioFitnessFetcher()
{
  uint64_t v4 = v1;
  *(void *)(v1 + 16) = v1;
  id v5 = *v0;
  id v2 = (void *)swift_task_alloc();
  *(void *)(v4 + 24) = v2;
  *id v2 = *(void *)(v4 + 16);
  v2[1] = protocol witness for QuantityPersisting.isLoggingAuthorized(for:) in conformance HealthKitPersistor;
  return CycleTrackingFetcher.isReadingAuthorized()(v5);
}

uint64_t protocol witness for CardioFitnessFetching.query(start:end:) in conformance CardioFitnessFetcher(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = v3;
  *(void *)(v3 + 16) = v3;
  uint64_t v8 = *v2;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v6 + 24) = v4;
  *uint64_t v4 = *(void *)(v6 + 16);
  v4[1] = protocol witness for QuantityPersisting.save(quantityIdentifier:value:units:) in conformance HealthKitPersistor;
  return CardioFitnessFetcher.query(start:end:)(a1, a2, v8);
}

id @nonobjc HKStatisticsQuery.init(quantityType:quantitySamplePredicate:options:completionHandler:)(void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v17 = a4;
  uint64_t v18 = a5;
  uint64_t aBlock = MEMORY[0x263EF8330];
  int v13 = 1107296256;
  int v14 = 0;
  uint64_t v15 = thunk for @escaping @callee_guaranteed (@guaranteed HKMCAnalysisQuery, @guaranteed HKMCAnalysis?, @guaranteed Error?) -> ();
  char v16 = &block_descriptor_48;
  uint64_t v8 = _Block_copy(&aBlock);
  id v11 = objc_msgSend(v7, sel_initWithQuantityType_quantitySamplePredicate_options_completionHandler_, a1, a2, a3);
  _Block_release(v8);
  swift_release();

  return v11;
}

uint64_t sub_25DF4B904()
{
  _Block_release(*(const void **)(v0 + 24));
  return swift_deallocObject();
}

uint64_t partial apply for @objc closure #1 in GetCardioFitnessIntentHandler.handle(intent:)()
{
  uint64_t v5 = v1;
  *(void *)(v1 + 16) = v1;
  uint64_t v8 = (void *)v0[2];
  uint64_t v6 = (const void *)v0[3];
  id v7 = (void *)v0[4];
  id v2 = (void *)swift_task_alloc();
  *(void *)(v5 + 24) = v2;
  *id v2 = *(void *)(v5 + 16);
  v2[1] = _sIeghH_IeAgH_TRTQ0_;
  uint64_t v3 = async function pointer to @objc closure #1 in GetCardioFitnessIntentHandler.handle(intent:);
  return ((uint64_t (*)(void *, const void *, void *))((char *)&async function pointer to @objc closure #1 in GetCardioFitnessIntentHandler.handle(intent:)
                                                               + v3))(v8, v6, v7);
}

uint64_t partial apply for closure #1 in CardioFitnessFetcher.query(start:end:)(uint64_t a1)
{
  return closure #1 in CardioFitnessFetcher.query(start:end:)(a1, *(void **)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32), *(void **)(v1 + 40));
}

uint64_t sub_25DF4BA54()
{
  return swift_deallocObject();
}

uint64_t sub_25DF4BA94()
{
  return swift_deallocObject();
}

uint64_t sub_25DF4BAC0()
{
  return swift_deallocObject();
}

uint64_t sub_25DF4BAEC()
{
  return swift_deallocObject();
}

uint64_t sub_25DF4BB2C()
{
  return swift_deallocObject();
}

uint64_t sub_25DF4BB6C()
{
  return swift_deallocObject();
}

uint64_t sub_25DF4BBAC()
{
  return swift_deallocObject();
}

uint64_t sub_25DF4BBD8()
{
  return swift_deallocObject();
}

uint64_t sub_25DF4BC04()
{
  return swift_deallocObject();
}

uint64_t sub_25DF4BC44()
{
  return swift_deallocObject();
}

uint64_t type metadata accessor for GetCardioFitnessIntentHandler()
{
  return self;
}

ValueMetadata *type metadata accessor for CardioFitnessFetcher()
{
  return &type metadata for CardioFitnessFetcher;
}

unint64_t type metadata accessor for HKStatisticsQuery()
{
  uint64_t v2 = lazy cache variable for type metadata for HKStatisticsQuery;
  if (!lazy cache variable for type metadata for HKStatisticsQuery)
  {
    self;
    unint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&lazy cache variable for type metadata for HKStatisticsQuery);
    return ObjCClassMetadata;
  }
  return v2;
}

uint64_t sub_25DF4BD28()
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<GetCardioFitnessIntentResponse, Never>);
  uint64_t v5 = *(void *)(v4 - 8);
  unint64_t v3 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  unint64_t v2 = v3 + *(void *)(v5 + 64);
  uint64_t v8 = type metadata accessor for Date();
  uint64_t v6 = *(void *)(v8 - 8);
  unint64_t v7 = (v2 + *(unsigned __int8 *)(v6 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  unint64_t v9 = (v7 + *(void *)(v6 + 64) + 7) & 0xFFFFFFFFFFFFFFF8;
  (*(void (**)(unint64_t, uint64_t))(v5 + 8))(v0 + v3, v4);
  (*(void (**)(unint64_t, uint64_t))(v6 + 8))(v0 + v7, v8);

  return swift_deallocObject();
}

void partial apply for closure #1 in closure #1 in CardioFitnessFetcher.query(start:end:)(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v7 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<GetCardioFitnessIntentResponse, Never>)
                 - 8);
  unint64_t v10 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  unint64_t v8 = v10 + *(void *)(v7 + 64);
  uint64_t v4 = type metadata accessor for Date();
  unint64_t v5 = (v8 + *(unsigned __int8 *)(*(void *)(v4 - 8) + 80)) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v4 - 8) + 80);
  uint64_t v6 = *(void **)(v3 + ((v5 + *(void *)(*(void *)(v4 - 8) + 64) + 7) & 0xFFFFFFFFFFFFFFF8));
  closure #1 in closure #1 in CardioFitnessFetcher.query(start:end:)(a1, a2, a3, v3 + v10, v3 + v5, v6);
}

uint64_t block_copy_helper_7(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 32);
  uint64_t v5 = *(void *)(a2 + 40);
  swift_retain();
  uint64_t result = a1;
  *(void *)(a1 + 32) = v4;
  *(void *)(a1 + 40) = v5;
  return result;
}

uint64_t block_destroy_helper_7()
{
  return swift_release();
}

uint64_t sub_25DF4C078()
{
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #1 in closure #1 in closure #1 in CardioFitnessFetcher.query(start:end:)()
{
  return implicit closure #1 in closure #1 in closure #1 in CardioFitnessFetcher.query(start:end:)(*(void **)(v0 + 16));
}

uint64_t sub_25DF4C0C0()
{
  return swift_deallocObject();
}

uint64_t sub_25DF4C0EC()
{
  return swift_deallocObject();
}

uint64_t sub_25DF4C118()
{
  return swift_deallocObject();
}

uint64_t sub_25DF4C158()
{
  return swift_deallocObject();
}

NSMeasurement __swiftcall Measurement._bridgeToObjectiveC()()
{
  uint64_t v0 = (objc_class *)MEMORY[0x270EEDF50]();
  result._doubleValue = v2;
  result._unit = v1;
  result.super.Class isa = v0;
  return result;
}

uint64_t Measurement.init(value:unit:)()
{
  return MEMORY[0x270EEDFA8]();
}

NSDateInterval __swiftcall DateInterval._bridgeToObjectiveC()()
{
  return (NSDateInterval)MEMORY[0x270EEE2C8]();
}

uint64_t static DateInterval._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x270EEE2E8]();
}

uint64_t DateInterval.end.getter()
{
  return MEMORY[0x270EEE2F0]();
}

uint64_t DateInterval.init(start:end:)()
{
  return MEMORY[0x270EEE2F8]();
}

uint64_t DateInterval.start.getter()
{
  return MEMORY[0x270EEE308]();
}

uint64_t DateInterval.contains(_:)()
{
  return MEMORY[0x270EEE318]();
}

uint64_t type metadata accessor for DateInterval()
{
  return MEMORY[0x270EEE338]();
}

NSDateComponents __swiftcall DateComponents._bridgeToObjectiveC()()
{
  return (NSDateComponents)MEMORY[0x270EEE738]();
}

uint64_t static DateComponents._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x270EEE760]();
}

uint64_t DateComponents.day.getter()
{
  return MEMORY[0x270EEE768]();
}

uint64_t DateComponents.day.setter()
{
  return MEMORY[0x270EEE780]();
}

uint64_t DateComponents.hour.setter()
{
  return MEMORY[0x270EEE7C8]();
}

uint64_t DateComponents.second.setter()
{
  return MEMORY[0x270EEE850]();
}

uint64_t DateComponents.init(calendar:timeZone:era:year:month:day:hour:minute:second:nanosecond:weekday:weekdayOrdinal:quarter:weekOfMonth:weekOfYear:yearForWeekOfYear:)()
{
  return MEMORY[0x270EEE890]();
}

uint64_t type metadata accessor for DateComponents()
{
  return MEMORY[0x270EEE8E8]();
}

uint64_t dispatch thunk of _BridgedStoredNSError._nsError.getter()
{
  return MEMORY[0x270EEF778]();
}

uint64_t _BridgedStoredNSError._getEmbeddedNSError()()
{
  return MEMORY[0x270EEF788]();
}

uint64_t _BridgedStoredNSError.init(_bridgedNSError:)()
{
  return MEMORY[0x270EEF790]();
}

uint64_t _BridgedStoredNSError.errorUserInfo.getter()
{
  return MEMORY[0x270EEF7A0]();
}

uint64_t static _BridgedStoredNSError.== infix(_:_:)()
{
  return MEMORY[0x270EEF7B8]();
}

uint64_t _BridgedStoredNSError.code.getter()
{
  return MEMORY[0x270EEF7C8]();
}

uint64_t _BridgedStoredNSError.hash(into:)()
{
  return MEMORY[0x270EEF7D0]();
}

uint64_t _BridgedStoredNSError.errorCode.getter()
{
  return MEMORY[0x270EEF7E8]();
}

uint64_t _convertErrorToNSError(_:)()
{
  return MEMORY[0x270EEF830]();
}

uint64_t _convertNSErrorToError(_:)()
{
  return MEMORY[0x270EEF840]();
}

uint64_t Date.timeIntervalSince(_:)()
{
  return MEMORY[0x270EF07E0]();
}

NSDate __swiftcall Date._bridgeToObjectiveC()()
{
  return (NSDate)MEMORY[0x270EF0998]();
}

uint64_t static Date.< infix(_:_:)()
{
  return MEMORY[0x270EF09B8]();
}

uint64_t static Date._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x270EF0BA8]();
}

uint64_t Date.init()()
{
  return MEMORY[0x270EF0C30]();
}

uint64_t type metadata accessor for Date()
{
  return MEMORY[0x270EF0C40]();
}

NSUUID __swiftcall UUID._bridgeToObjectiveC()()
{
  return (NSUUID)MEMORY[0x270EF0C88]();
}

uint64_t static UUID._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x270EF0CB8]();
}

uint64_t type metadata accessor for UUID()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t type metadata accessor for Calendar.Identifier()
{
  return MEMORY[0x270EF10C8]();
}

uint64_t Calendar.init(identifier:)()
{
  return MEMORY[0x270EF10D8]();
}

uint64_t Calendar.startOfDay(for:)()
{
  return MEMORY[0x270EF1100]();
}

uint64_t Calendar.dateComponents(_:from:to:)()
{
  return MEMORY[0x270EF1248]();
}

uint64_t Calendar.dateComponents(_:from:)()
{
  return MEMORY[0x270EF1258]();
}

uint64_t Calendar.numberOfDaysBetween(_:and:)()
{
  return MEMORY[0x270F31B18]();
}

NSCalendar __swiftcall Calendar._bridgeToObjectiveC()()
{
  return (NSCalendar)MEMORY[0x270EF12C8]();
}

uint64_t static Calendar.autoupdatingCurrent.getter()
{
  return MEMORY[0x270EF12E0]();
}

uint64_t Calendar.date(from:)()
{
  return MEMORY[0x270EF1368]();
}

uint64_t Calendar.date(byAdding:to:wrappingComponents:)()
{
  return MEMORY[0x270EF1378]();
}

uint64_t static Calendar.current.getter()
{
  return MEMORY[0x270EF13D8]();
}

uint64_t type metadata accessor for Calendar.Component()
{
  return MEMORY[0x270EF1428]();
}

uint64_t type metadata accessor for Calendar()
{
  return MEMORY[0x270EF1440]();
}

uint64_t type metadata accessor for TimeZone()
{
  return MEMORY[0x270EF1608]();
}

uint64_t _convertBoolToObjCBool(_:)()
{
  return MEMORY[0x270FA1128]();
}

uint64_t OSSignpostID.rawValue.getter()
{
  return MEMORY[0x270FA2CE8]();
}

uint64_t type metadata accessor for OSSignpostID()
{
  return MEMORY[0x270FA2D00]();
}

uint64_t OSSignposter.makeSignpostID()()
{
  return MEMORY[0x270FA2D20]();
}

uint64_t OSSignposter.logHandle.getter()
{
  return MEMORY[0x270FA2D58]();
}

uint64_t OSSignposter.init()()
{
  return MEMORY[0x270FA2D78]();
}

uint64_t type metadata accessor for OSSignposter()
{
  return MEMORY[0x270FA2D88]();
}

uint64_t type metadata accessor for OSSignpostError()
{
  return MEMORY[0x270FA2D90]();
}

uint64_t OSSignpostIntervalState.signpostID.getter()
{
  return MEMORY[0x270FA2DB0]();
}

uint64_t OSSignpostIntervalState.__allocating_init(id:isOpen:)()
{
  return MEMORY[0x270FA2DC0]();
}

uint64_t type metadata accessor for OSSignpostIntervalState()
{
  return MEMORY[0x270FA2DE0]();
}

uint64_t checkForErrorAndConsumeState(state:)()
{
  return MEMORY[0x270FA2DF0]();
}

uint64_t Logger.wellness.unsafeMutableAddressor()
{
  return MEMORY[0x270F31B58]();
}

uint64_t Logger.logObject.getter()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t type metadata accessor for Logger()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t Logger.init(_:)()
{
  return MEMORY[0x270FA2E30]();
}

uint64_t static HKSamplePredicate.quantitySample(type:predicate:)()
{
  return MEMORY[0x270EF3148]();
}

uint64_t HKStatisticsQueryDescriptor.init(predicate:options:)()
{
  return MEMORY[0x270EF3220]();
}

uint64_t type metadata accessor for HKStatisticsQueryDescriptor()
{
  return MEMORY[0x270EF3228]();
}

uint64_t HKStatisticsCollectionQueryDescriptor.init(predicate:options:anchorDate:intervalComponents:)()
{
  return MEMORY[0x270EF32B8]();
}

uint64_t type metadata accessor for HKStatisticsCollectionQueryDescriptor()
{
  return MEMORY[0x270EF32C0]();
}

uint64_t Dictionary.init()()
{
  return MEMORY[0x270F9CFB0]();
}

NSDictionary __swiftcall Dictionary._bridgeToObjectiveC()()
{
  return (NSDictionary)MEMORY[0x270EF1818]();
}

uint64_t static Dictionary._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x270EF1840]();
}

uint64_t Dictionary.makeIterator()()
{
  return MEMORY[0x270F9D080]();
}

uint64_t Dictionary.init(dictionaryLiteral:)()
{
  return MEMORY[0x270F9D0A8]();
}

uint64_t Dictionary.count.getter()
{
  return MEMORY[0x270F9D120]();
}

uint64_t Dictionary.Iterator.next()()
{
  return MEMORY[0x270F9D178]();
}

uint64_t type metadata accessor for Dictionary()
{
  return MEMORY[0x270F9D1D0]();
}

uint64_t Dictionary.subscript.getter()
{
  return MEMORY[0x270F9D208]();
}

uint64_t Dictionary.subscript.setter()
{
  return MEMORY[0x270F9D210]();
}

Swift::Int __swiftcall Hashable._rawHashValue(seed:)(Swift::Int seed)
{
  return MEMORY[0x270F9D330](seed);
}

uint64_t BidirectionalCollection.last.getter()
{
  return MEMORY[0x270F9D428]();
}

uint64_t BidirectionalCollection.reversed()()
{
  return MEMORY[0x270F9D458]();
}

uint64_t dispatch thunk of static Equatable.== infix(_:_:)()
{
  return MEMORY[0x270F9D598]();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)MEMORY[0x270EF19B0]();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t String.init<A>(describing:)()
{
  return MEMORY[0x270F9D5E0]();
}

{
  return MEMORY[0x270F9D5E8]();
}

{
  return MEMORY[0x270F9D5F0]();
}

Swift::String __swiftcall String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)(Builtin::RawPointer _builtinStringLiteral, Builtin::Word utf8CodeUnitCount, Builtin::Int1 isASCII)
{
  uint64_t v3 = MEMORY[0x270F9D6D8](_builtinStringLiteral, utf8CodeUnitCount, isASCII);
  result._object = v4;
  result._uint64_t countAndFlagsBits = v3;
  return result;
}

uint64_t static String.== infix(_:_:)()
{
  return MEMORY[0x270F9D6E8]();
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t String.init(_:)()
{
  return MEMORY[0x270F9D8D0]();
}

uint64_t String.init<A>(_:)()
{
  return MEMORY[0x270F9D8E8]();
}

uint64_t Sequence.allSatisfy(_:)()
{
  return MEMORY[0x270F9D930]();
}

uint64_t Sequence.compactMap<A>(_:)()
{
  return MEMORY[0x270F9D938]();
}

uint64_t Sequence.first(where:)()
{
  return MEMORY[0x270F9D988]();
}

uint64_t Sequence.reduce<A>(_:_:)()
{
  return MEMORY[0x270F9D9A8]();
}

uint64_t Sequence.sorted(by:)()
{
  return MEMORY[0x270F9D9B0]();
}

uint64_t Sequence.forEach(_:)()
{
  return MEMORY[0x270F9D9D0]();
}

uint64_t Sequence<>.max()()
{
  return MEMORY[0x270F9D9F0]();
}

uint64_t Sequence<>.min()()
{
  return MEMORY[0x270F9D9F8]();
}

uint64_t Sequence<>.contains(_:)()
{
  return MEMORY[0x270F9DA18]();
}

uint64_t UnsignedInteger<>.init<A>(_:)()
{
  return MEMORY[0x270F9DA30]();
}

uint64_t dispatch thunk of RawRepresentable.init(rawValue:)()
{
  return MEMORY[0x270F9DA78]();
}

uint64_t RawRepresentable<>.hashValue.getter()
{
  return MEMORY[0x270F9DAE8]();
}

uint64_t RawRepresentable<>._rawHashValue(seed:)()
{
  return MEMORY[0x270F9DAF0]();
}

uint64_t RawRepresentable<>.hash(into:)()
{
  return MEMORY[0x270F9DAF8]();
}

uint64_t SignedInteger<>.init<A>(_:)()
{
  return MEMORY[0x270F9DB98]();
}

NSArray __swiftcall Array._bridgeToObjectiveC()()
{
  return (NSArray)MEMORY[0x270EF1B88]();
}

uint64_t static Array._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t static Array.+ infix(_:_:)()
{
  return MEMORY[0x270F9DC00]();
}

uint64_t static Array._allocateUninitialized(_:)()
{
  return MEMORY[0x270F9DC10]();
}

uint64_t Array.count.getter()
{
  return MEMORY[0x270F9DC60]();
}

uint64_t specialized Array.count.getter()
{
  return MEMORY[0x270FA1428]();
}

{
  return MEMORY[0x270FA1430]();
}

uint64_t Array.append<A>(contentsOf:)()
{
  return MEMORY[0x270F9DC80]();
}

uint64_t Array.append(_:)()
{
  return MEMORY[0x270F9DC88]();
}

uint64_t specialized Array.append(_:)()
{
  return MEMORY[0x270FA1450]();
}

uint64_t type metadata accessor for Array()
{
  return MEMORY[0x270F9DCD8]();
}

uint64_t Array.init<A>(_:)()
{
  return MEMORY[0x270F9DD08]();
}

uint64_t Array.subscript.getter()
{
  return MEMORY[0x270F9DD28]();
}

uint64_t specialized Array.subscript.getter()
{
  return MEMORY[0x270FA14A8]();
}

uint64_t dispatch thunk of Actor.unownedExecutor.getter()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t CheckedContinuation.resume(throwing:)()
{
  return MEMORY[0x270FA1E18]();
}

uint64_t CheckedContinuation.resume(returning:)()
{
  return MEMORY[0x270FA1E20]();
}

uint64_t type metadata accessor for CheckedContinuation()
{
  return MEMORY[0x270FA1E28]();
}

uint64_t TaskPriority.rawValue.getter()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t type metadata accessor for TaskPriority()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t ThrowingTaskGroup.makeAsyncIterator()()
{
  return MEMORY[0x270FA2040]();
}

uint64_t type metadata accessor for ThrowingTaskGroup.Iterator()
{
  return MEMORY[0x270FA2060]();
}

uint64_t type metadata accessor for ThrowingTaskGroup()
{
  return MEMORY[0x270FA2070]();
}

uint64_t Double._roundSlowPath(_:)()
{
  return MEMORY[0x270F9DD68]();
}

uint64_t Double.sign.getter()
{
  return MEMORY[0x270F9DD98]();
}

uint64_t Double.init(_:)()
{
  return MEMORY[0x270F9DDD8]();
}

NSSet __swiftcall Set._bridgeToObjectiveC()()
{
  return (NSSet)MEMORY[0x270EF1C98]();
}

uint64_t static Set._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x270EF1CC0]();
}

uint64_t Set.init(arrayLiteral:)()
{
  return MEMORY[0x270F9DED0]();
}

uint64_t Set.makeIterator()()
{
  return MEMORY[0x270F9DEE8]();
}

uint64_t Set.count.getter()
{
  return MEMORY[0x270F9DF38]();
}

uint64_t Set.insert(_:)()
{
  return MEMORY[0x270F9DF58]();
}

uint64_t Set.Iterator.next()()
{
  return MEMORY[0x270F9DF78]();
}

uint64_t type metadata accessor for Set.Iterator()
{
  return MEMORY[0x270F9DF88]();
}

uint64_t Set.init<A>(_:)()
{
  return MEMORY[0x270F9DFE8]();
}

uint64_t dispatch thunk of Collection.startIndex.getter()
{
  return MEMORY[0x270F9E080]();
}

uint64_t dispatch thunk of Collection.count.getter()
{
  return MEMORY[0x270F9E0A0]();
}

uint64_t dispatch thunk of Collection.formIndex(after:)()
{
  return MEMORY[0x270F9E0E0]();
}

uint64_t Collection.first.getter()
{
  return MEMORY[0x270F9E140]();
}

uint64_t Collection.isEmpty.getter()
{
  return MEMORY[0x270F9E178]();
}

uint64_t Collection<>.makeIterator()()
{
  return MEMORY[0x270F9E1C8]();
}

uint64_t specialized Collection<>.makeIterator()()
{
  return MEMORY[0x270FA14D8]();
}

uint64_t dispatch thunk of Collection.subscript.read()
{
  return MEMORY[0x270F9E1E0]();
}

uint64_t static os_log_type_t.debug.getter()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t static os_log_type_t.error.getter()
{
  return MEMORY[0x270FA2E60]();
}

HKCategoryType __swiftcall HKCategoryType.init(_:)(HKCategoryTypeIdentifier a1)
{
  return (HKCategoryType)MEMORY[0x270EF33E8](a1);
}

HKQuantityType __swiftcall HKQuantityType.init(_:)(HKQuantityTypeIdentifier a1)
{
  return (HKQuantityType)MEMORY[0x270EF33F8](a1);
}

HKCorrelationType __swiftcall HKCorrelationType.init(_:)(HKCorrelationTypeIdentifier a1)
{
  return (HKCorrelationType)MEMORY[0x270EF34B8](a1);
}

uint64_t static os_signpost_type_t.end.getter()
{
  return MEMORY[0x270FA2E90]();
}

uint64_t static os_signpost_type_t.begin.getter()
{
  return MEMORY[0x270FA2EA8]();
}

uint64_t static os_signpost_type_t.event.getter()
{
  return MEMORY[0x270FA2EB8]();
}

NSNumber __swiftcall NSNumber.init(BOOLeanLiteral:)(Swift::Bool BOOLeanLiteral)
{
  return (NSNumber)MEMORY[0x270EF2180](BOOLeanLiteral);
}

NSNumber __swiftcall NSNumber.init(integerLiteral:)(Swift::Int integerLiteral)
{
  return (NSNumber)MEMORY[0x270EF2198](integerLiteral);
}

uint64_t static NSObject.== infix(_:_:)()
{
  return MEMORY[0x270FA1180]();
}

uint64_t NSObject.hashValue.getter()
{
  return MEMORY[0x270FA11A0]();
}

uint64_t OS_os_log.signpostsEnabled.getter()
{
  return MEMORY[0x270FA2EC8]();
}

uint64_t OS_os_log.init(subsystem:category:)()
{
  return MEMORY[0x270FA2F00]();
}

Swift::Void __swiftcall UnsafeMutablePointer.deallocate()()
{
}

uint64_t UnsafeMutablePointer.deinitialize(count:)()
{
  return MEMORY[0x270F9E378]();
}

uint64_t static UnsafeMutablePointer.allocate(capacity:)()
{
  return MEMORY[0x270F9E398]();
}

uint64_t type metadata accessor for Optional()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t UnsafeMutableRawBufferPointer.copyMemory(from:)()
{
  return MEMORY[0x270F9E530]();
}

uint64_t UnsafeMutableRawBufferPointer.subscript.setter()
{
  return MEMORY[0x270F9E560]();
}

uint64_t StringProtocol<>.split(separator:maxSplits:omittingEmptySubsequences:)()
{
  return MEMORY[0x270FA13A0]();
}

uint64_t SetAlgebra<>.init(arrayLiteral:)()
{
  return MEMORY[0x270F9E7A0]();
}

uint64_t SetAlgebra.isDisjoint(with:)()
{
  return MEMORY[0x270F9E7A8]();
}

uint64_t SetAlgebra.isSuperset(of:)()
{
  return MEMORY[0x270F9E7B0]();
}

uint64_t SetAlgebra.subtracting(_:)()
{
  return MEMORY[0x270F9E7B8]();
}

uint64_t SetAlgebra.isEmpty.getter()
{
  return MEMORY[0x270F9E7C0]();
}

uint64_t SetAlgebra.isSubset(of:)()
{
  return MEMORY[0x270F9E7C8]();
}

uint64_t SetAlgebra.subtract(_:)()
{
  return MEMORY[0x270F9E7D0]();
}

uint64_t SetAlgebra.init<A>(_:)()
{
  return MEMORY[0x270F9E7D8]();
}

uint64_t _expectEnd<A>(of:is:)()
{
  return MEMORY[0x270F9E890]();
}

uint64_t _hashValue<A>(for:)()
{
  return MEMORY[0x270F9E898]();
}

uint64_t _StringGuts.copyUTF8(into:)()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t _ArrayProtocol.filter(_:)()
{
  return MEMORY[0x270F9EB80]();
}

Swift::Void __swiftcall ContiguousArray.reserveCapacity(_:)(Swift::Int a1)
{
}

uint64_t ContiguousArray.append(_:)()
{
  return MEMORY[0x270F9EC48]();
}

uint64_t ContiguousArray.init()()
{
  return MEMORY[0x270F9EC88]();
}

uint64_t type metadata accessor for ContiguousArray()
{
  return MEMORY[0x270F9EC90]();
}

uint64_t _arrayForceCast<A, B>(_:)()
{
  return MEMORY[0x270F9ED68]();
}

uint64_t IndexingIterator.next()()
{
  return MEMORY[0x270F9ED88]();
}

uint64_t specialized IndexingIterator.next()()
{
  return MEMORY[0x270FA14E8]();
}

uint64_t dispatch thunk of static FixedWidthInteger.bitWidth.getter()
{
  return MEMORY[0x270F9EE10]();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return MEMORY[0x270F9EFE8]();
}

{
  return MEMORY[0x270F9EFF0]();
}

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t _arrayConditionalCast<A, B>(_:)()
{
  return MEMORY[0x270F9F220]();
}

Swift::Int __swiftcall _findStringSwitchCase(cases:string:)(Swift::OpaquePointer cases, Swift::String string)
{
  return MEMORY[0x270F9F230](cases._rawValue, string._countAndFlagsBits, string._object);
}

uint64_t dispatch thunk of CustomStringConvertible.description.getter()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t type metadata accessor for FloatingPointRoundingRule()
{
  return MEMORY[0x270F9F750]();
}

uint64_t _allocateUninitializedArray<A>(_:)()
{
  return MEMORY[0x270F9F7B8]();
}

uint64_t == infix<A>(_:_:)()
{
  return MEMORY[0x270F9F940]();
}

Swift::Void __swiftcall _diagnoseUnexpectedNilOptional(_filenameStart:_filenameLength:_filenameIsASCII:_line:_isImplicitUnwrap:)(Builtin::RawPointer _filenameStart, Builtin::Word _filenameLength, Builtin::Int1 _filenameIsASCII, Builtin::Word _line, Builtin::Int1 _isImplicitUnwrap)
{
}

uint64_t _diagnoseUnexpectedEnumCaseValue<A, B>(type:rawValue:)()
{
  return MEMORY[0x270F9FA68]();
}

uint64_t abs<A>(_:)()
{
  return MEMORY[0x270F9FA90]();
}

uint64_t max<A>(_:_:)()
{
  return MEMORY[0x270F9FA98]();
}

uint64_t min<A>(_:_:)()
{
  return MEMORY[0x270F9FAA8]();
}

uint64_t Error<>._code.getter()
{
  return MEMORY[0x270EF2668]();
}

uint64_t Error<>._domain.getter()
{
  return MEMORY[0x270EF2670]();
}

uint64_t Error.localizedDescription.getter()
{
  return MEMORY[0x270EF2680]();
}

uint64_t Error._getEmbeddedNSError()()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t Error._code.getter()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t Error._domain.getter()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t Error._userInfo.getter()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t Hasher.combine<A>(_:)()
{
  return MEMORY[0x270F9FC58]();
}

uint64_t OptionSet<>.insert(_:)()
{
  return MEMORY[0x270FA00C8]();
}

uint64_t OptionSet<>.remove(_:)()
{
  return MEMORY[0x270FA00D0]();
}

uint64_t OptionSet<>.update(with:)()
{
  return MEMORY[0x270FA00D8]();
}

uint64_t OptionSet<>.contains(_:)()
{
  return MEMORY[0x270FA00E0]();
}

uint64_t OptionSet.intersection(_:)()
{
  return MEMORY[0x270FA00E8]();
}

uint64_t OptionSet.symmetricDifference(_:)()
{
  return MEMORY[0x270FA00F0]();
}

uint64_t OptionSet.union(_:)()
{
  return MEMORY[0x270FA00F8]();
}

uint64_t OptionSet<>.formIntersection(_:)()
{
  return MEMORY[0x270FA0100]();
}

uint64_t OptionSet<>.formSymmetricDifference(_:)()
{
  return MEMORY[0x270FA0108]();
}

uint64_t OptionSet<>.formUnion(_:)()
{
  return MEMORY[0x270FA0110]();
}

uint64_t OptionSet<>.init()()
{
  return MEMORY[0x270FA0118]();
}

uint64_t HKMCTodayIndex()
{
  return MEMORY[0x270F35D38]();
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

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x270FA0158]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializerInFile()
{
  return MEMORY[0x270FA0168]();
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

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
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

uint64_t swift_allocateGenericValueMetadata()
{
  return MEMORY[0x270FA01A8]();
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

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x270FA0208]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x270FA23F8]();
}

uint64_t swift_continuation_throwingResume()
{
  return MEMORY[0x270FA2408]();
}

uint64_t swift_continuation_throwingResumeWithError()
{
  return MEMORY[0x270FA2410]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x270FA0238]();
}

uint64_t swift_deallocUninitializedObject()
{
  return MEMORY[0x270FA0248]();
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

uint64_t swift_errorRetain()
{
  return MEMORY[0x270FA02D0]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x270FA0300]();
}

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x270FA0310]();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x270FA0340]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x270FA0348]();
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

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x270FA0400]();
}

uint64_t swift_getTupleTypeLayout2()
{
  return MEMORY[0x270FA0410]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x270FA0428]();
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

uint64_t swift_setAtWritableKeyPath()
{
  return MEMORY[0x270FA0548]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x270FA0558]();
}

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x270FA0580]();
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

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
}