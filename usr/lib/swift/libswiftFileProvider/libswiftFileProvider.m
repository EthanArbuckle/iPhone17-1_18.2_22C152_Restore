BOOL static NSFileProviderDomainVersion.< infix(_:_:)(void *a1, uint64_t a2)
{
  return [a1 compare:a2] == (id)-1;
}

BOOL protocol witness for static Comparable.< infix(_:_:) in conformance NSFileProviderDomainVersion(id *a1, void *a2)
{
  return [*a1 sel_compare_:*a2] == (id)-1;
}

uint64_t protocol witness for static Comparable.<= infix(_:_:) in conformance NSFileProviderDomainVersion()
{
  return MEMORY[0x270F9D4B0]();
}

uint64_t protocol witness for static Comparable.>= infix(_:_:) in conformance NSFileProviderDomainVersion()
{
  return MEMORY[0x270F9D4A8]();
}

uint64_t protocol witness for static Comparable.> infix(_:_:) in conformance NSFileProviderDomainVersion()
{
  return MEMORY[0x270F9D4A0]();
}

void NSFileProviderManager.requestDownloadForItem(withIdentifier:requestedRange:completionHandler:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6)
{
  if (a4)
  {
    a2 = NSNotFound.getter();
    a3 = NSNotFound.getter();
  }
  v13[4] = a5;
  v13[5] = a6;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 1107296256;
  v13[2] = thunk for @escaping @callee_guaranteed (@guaranteed Error?) -> ();
  v13[3] = &block_descriptor;
  v12 = _Block_copy(v13);
  swift_retain();
  swift_release();
  [v6 requestDownloadForItemWithIdentifier:a1 requestedRange:a2 completionHandler:a3];
  _Block_release(v12);
}

void thunk for @escaping @callee_guaranteed (@guaranteed Error?) -> ()(uint64_t a1, void *a2)
{
  v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3(a2);
  swift_release();
}

uint64_t NSFileProviderManager.requestDownloadForItem(withIdentifier:requestedRange:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  *(unsigned char *)(v5 + 160) = a4;
  *(void *)(v5 + 136) = a3;
  *(void *)(v5 + 144) = v4;
  *(void *)(v5 + 120) = a1;
  *(void *)(v5 + 128) = a2;
  return MEMORY[0x270FA2498](NSFileProviderManager.requestDownloadForItem(withIdentifier:requestedRange:), 0, 0);
}

uint64_t NSFileProviderManager.requestDownloadForItem(withIdentifier:requestedRange:)()
{
  if (*(unsigned char *)(v0 + 160))
  {
    uint64_t v2 = NSNotFound.getter();
    uint64_t v1 = NSNotFound.getter();
  }
  else
  {
    uint64_t v2 = *(void *)(v0 + 128);
    uint64_t v1 = *(void *)(v0 + 136);
  }
  v3 = *(void **)(v0 + 144);
  uint64_t v4 = *(void *)(v0 + 120);
  *(void *)(v0 + 16) = v0;
  *(void *)(v0 + 24) = NSFileProviderManager.requestDownloadForItem(withIdentifier:requestedRange:);
  uint64_t v5 = swift_continuation_init();
  *(void *)(v0 + 80) = MEMORY[0x263EF8330];
  *(void *)(v0 + 88) = 0x40000000;
  *(void *)(v0 + 96) = @objc completion handler block implementation for @escaping @callee_unowned @convention(block) (@unowned NSError?) -> () with result type ();
  *(void *)(v0 + 104) = &block_descriptor_1;
  *(void *)(v0 + 112) = v5;
  [v3 requestDownloadForItemWithIdentifier:v4 requestedRange:v2 completionHandler:v1 + 80];
  return MEMORY[0x270FA23F0](v0 + 16);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)();
  uint64_t v4;

  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 152) = v1;
  if (v1) {
    uint64_t v2 = NSFileProviderManager.requestDownloadForItem(withIdentifier:requestedRange:);
  }
  else {
    uint64_t v2 = NSFileProviderManager.requestDownloadForItem(withIdentifier:requestedRange:);
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 8))();
}

{
  uint64_t v0;
  uint64_t (*v1)(void);
  uint64_t v3;

  swift_willThrow();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t @objc completion handler block implementation for @escaping @callee_unowned @convention(block) (@unowned NSError?) -> () with result type ()(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (a2)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Error);
    uint64_t v4 = swift_allocError();
    *uint64_t v5 = a2;
    id v6 = a2;
    return MEMORY[0x270FA2410](v2, v4);
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 32);
    return MEMORY[0x270FA2408](v7);
  }
}

BOOL static NSFileProviderManager.EligibilityResult.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  if (*(unsigned char *)(a1 + 8) == 1) {
    return (*(unsigned char *)(a2 + 8) & 1) != 0;
  }
  if (*(unsigned char *)(a2 + 8)) {
    return 0;
  }
  return *(void *)a1 == *(void *)a2;
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance NSFileProviderManager.EligibilityResult(uint64_t a1, uint64_t a2)
{
  if (*(unsigned char *)(a1 + 8) == 1) {
    return (*(unsigned char *)(a2 + 8) & 1) != 0;
  }
  if (*(unsigned char *)(a2 + 8)) {
    return 0;
  }
  return *(void *)a1 == *(void *)a2;
}

id static NSFileProviderManager.checkDomainsCanBeStoredOnVolume(at:)@<X0>(uint64_t a1@<X8>)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  char v13 = 0;
  uint64_t v12 = 0;
  uint64_t v2 = self;
  URL._bridgeToObjectiveC()(v3);
  uint64_t v5 = v4;
  id v11 = 0;
  LODWORD(v2) = [v2 sel_checkDomainsCanBeStored_onVolumeAtURL_unsupportedReason_error_:&v13, v4, &v12, &v11];

  id v6 = v11;
  if (v2)
  {
    char v7 = v13;
    uint64_t v8 = v12;
    if (v13) {
      uint64_t v8 = 0;
    }
    *(void *)a1 = v8;
    *(unsigned char *)(a1 + 8) = v7;
    return v6;
  }
  else
  {
    id v10 = v11;
    _convertNSErrorToError(_:)();

    return (id)swift_willThrow();
  }
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

void *protocol witness for RawRepresentable.init(rawValue:) in conformance NSFileProviderVolumeUnsupportedReason@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void protocol witness for RawRepresentable.rawValue.getter in conformance NSFileProviderVolumeUnsupportedReason(void *a1@<X8>)
{
  *a1 = *v1;
}

void protocol witness for SetAlgebra.init() in conformance NSFileProviderVolumeUnsupportedReason(void *a1@<X8>)
{
  *a1 = 0;
}

void *protocol witness for SetAlgebra.union(_:) in conformance NSFileProviderVolumeUnsupportedReason@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 | *result;
  return result;
}

void *protocol witness for SetAlgebra.intersection(_:) in conformance NSFileProviderVolumeUnsupportedReason@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & *result;
  return result;
}

void *protocol witness for SetAlgebra.symmetricDifference(_:) in conformance NSFileProviderVolumeUnsupportedReason@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 ^ *result;
  return result;
}

BOOL protocol witness for SetAlgebra.insert(_:) in conformance NSFileProviderVolumeUnsupportedReason(void *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = *v2 & *a2;
  if (v4 != *a2) {
    *v2 |= v3;
  }
  *a1 = v3;
  return v4 != v3;
}

void *protocol witness for SetAlgebra.remove(_:) in conformance NSFileProviderVolumeUnsupportedReason@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *v2 & *result;
  if (v3) {
    *v2 &= ~*result;
  }
  *(void *)a2 = v3;
  *(unsigned char *)(a2 + 8) = v3 == 0;
  return result;
}

uint64_t *protocol witness for SetAlgebra.update(with:) in conformance NSFileProviderVolumeUnsupportedReason@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *result;
  uint64_t v4 = *v2;
  *v2 |= *result;
  uint64_t v5 = v4 & v3;
  *(void *)a2 = v5;
  *(unsigned char *)(a2 + 8) = v5 == 0;
  return result;
}

void *protocol witness for SetAlgebra.formUnion(_:) in conformance NSFileProviderVolumeUnsupportedReason(void *result)
{
  *v1 |= *result;
  return result;
}

void *protocol witness for SetAlgebra.formIntersection(_:) in conformance NSFileProviderVolumeUnsupportedReason(void *result)
{
  *v1 &= *result;
  return result;
}

void *protocol witness for SetAlgebra.formSymmetricDifference(_:) in conformance NSFileProviderVolumeUnsupportedReason(void *result)
{
  *v1 ^= *result;
  return result;
}

void *protocol witness for SetAlgebra.subtracting(_:) in conformance NSFileProviderVolumeUnsupportedReason@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & ~*result;
  return result;
}

BOOL protocol witness for SetAlgebra.isSubset(of:) in conformance NSFileProviderVolumeUnsupportedReason(void *a1)
{
  return (*v1 & ~*a1) == 0;
}

BOOL protocol witness for SetAlgebra.isDisjoint(with:) in conformance NSFileProviderVolumeUnsupportedReason(void *a1)
{
  return (*v1 & *a1) == 0;
}

BOOL protocol witness for SetAlgebra.isSuperset(of:) in conformance NSFileProviderVolumeUnsupportedReason(void *a1)
{
  return (*a1 & ~*v1) == 0;
}

BOOL protocol witness for SetAlgebra.isEmpty.getter in conformance NSFileProviderVolumeUnsupportedReason()
{
  return *v0 == 0;
}

uint64_t protocol witness for SetAlgebra.init<A>(_:) in conformance NSFileProviderVolumeUnsupportedReason(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x270F9E7D8](a1, a4, a2, a5, a3);
}

void *protocol witness for SetAlgebra.subtract(_:) in conformance NSFileProviderVolumeUnsupportedReason(void *result)
{
  *v1 &= ~*result;
  return result;
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance NSFileProviderVolumeUnsupportedReason(void *a1, void *a2)
{
  return *a1 == *a2;
}

uint64_t protocol witness for ExpressibleByArrayLiteral.init(arrayLiteral:) in conformance NSFileProviderVolumeUnsupportedReason@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = specialized SetAlgebra<>.init(arrayLiteral:)(a1);
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v3;
  return result;
}

void *protocol witness for OptionSet.init(rawValue:) in conformance NSFileProviderVolumeUnsupportedReason@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

uint64_t base witness table accessor for Equatable in NSFileProviderDomainVersion()
{
  return lazy protocol witness table accessor for type NSFileProviderDomainVersion and conformance NSObject(&lazy protocol witness table cache variable for type NSFileProviderDomainVersion and conformance NSObject, (void (*)(uint64_t))type metadata accessor for NSFileProviderDomainVersion);
}

unint64_t type metadata accessor for NSFileProviderDomainVersion()
{
  unint64_t result = lazy cache variable for type metadata for NSFileProviderDomainVersion;
  if (!lazy cache variable for type metadata for NSFileProviderDomainVersion)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&lazy cache variable for type metadata for NSFileProviderDomainVersion);
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

uint64_t getEnumTagSinglePayload for NSFileProviderManager.EligibilityResult(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 9)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for NSFileProviderManager.EligibilityResult(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)unint64_t result = 0;
    *(unsigned char *)(result + 8) = 0;
    *(_DWORD *)unint64_t result = a2 - 1;
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

uint64_t getEnumTag for NSFileProviderManager.EligibilityResult(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 8)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t destructiveInjectEnumTag for NSFileProviderManager.EligibilityResult(uint64_t result, int a2)
{
  if (a2)
  {
    *(void *)unint64_t result = (a2 - 1);
    *(unsigned char *)(result + 8) = 1;
  }
  else
  {
    *(unsigned char *)(result + 8) = 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for NSFileProviderManager.EligibilityResult()
{
  return &type metadata for NSFileProviderManager.EligibilityResult;
}

void type metadata accessor for NSFileProviderVolumeUnsupportedReason()
{
  if (!lazy cache variable for type metadata for NSFileProviderVolumeUnsupportedReason)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&lazy cache variable for type metadata for NSFileProviderVolumeUnsupportedReason);
    }
  }
}

uint64_t base witness table accessor for Equatable in NSFileProviderVolumeUnsupportedReason()
{
  return lazy protocol witness table accessor for type NSFileProviderDomainVersion and conformance NSObject(&lazy protocol witness table cache variable for type NSFileProviderVolumeUnsupportedReason and conformance NSFileProviderVolumeUnsupportedReason, (void (*)(uint64_t))type metadata accessor for NSFileProviderVolumeUnsupportedReason);
}

uint64_t base witness table accessor for ExpressibleByArrayLiteral in NSFileProviderVolumeUnsupportedReason()
{
  return lazy protocol witness table accessor for type NSFileProviderDomainVersion and conformance NSObject(&lazy protocol witness table cache variable for type NSFileProviderVolumeUnsupportedReason and conformance NSFileProviderVolumeUnsupportedReason, (void (*)(uint64_t))type metadata accessor for NSFileProviderVolumeUnsupportedReason);
}

uint64_t base witness table accessor for RawRepresentable in NSFileProviderVolumeUnsupportedReason()
{
  return lazy protocol witness table accessor for type NSFileProviderDomainVersion and conformance NSObject(&lazy protocol witness table cache variable for type NSFileProviderVolumeUnsupportedReason and conformance NSFileProviderVolumeUnsupportedReason, (void (*)(uint64_t))type metadata accessor for NSFileProviderVolumeUnsupportedReason);
}

uint64_t base witness table accessor for SetAlgebra in NSFileProviderVolumeUnsupportedReason()
{
  return lazy protocol witness table accessor for type NSFileProviderDomainVersion and conformance NSObject(&lazy protocol witness table cache variable for type NSFileProviderVolumeUnsupportedReason and conformance NSFileProviderVolumeUnsupportedReason, (void (*)(uint64_t))type metadata accessor for NSFileProviderVolumeUnsupportedReason);
}

uint64_t lazy protocol witness table accessor for type NSFileProviderDomainVersion and conformance NSObject(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t specialized SetAlgebra<>.init(arrayLiteral:)(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return 0;
  }
  uint64_t result = 0;
  uint64_t v4 = (uint64_t *)(a1 + 32);
  do
  {
    uint64_t v6 = *v4++;
    uint64_t v5 = v6;
    if ((v6 & ~result) == 0) {
      uint64_t v5 = 0;
    }
    result |= v5;
    --v1;
  }
  while (v1);
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

uint64_t NSNotFound.getter()
{
  return MEMORY[0x270EEDAC8]();
}

uint64_t _convertNSErrorToError(_:)()
{
  return MEMORY[0x270EEF840]();
}

void __swiftcall URL._bridgeToObjectiveC()(NSURL *__return_ptr retstr)
{
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_release(const void *aBlock)
{
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
}

void objc_release(id a1)
{
}

uint64_t swift_allocError()
{
  return MEMORY[0x270FA0190]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x270FA23F8]();
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

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}