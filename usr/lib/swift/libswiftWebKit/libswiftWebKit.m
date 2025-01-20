uint64_t initializeBufferWithCopyOfBuffer for CGRect(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t getEnumTagSinglePayload for CGRect(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 32)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for CGRect(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)__n128 result = (a2 - 1);
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
  *(unsigned char *)(result + 32) = v3;
  return result;
}

void type metadata accessor for CGRect(uint64_t a1)
{
}

uint64_t closure #1 in static ObjCBlockConversion.boxingNilAsAnyForCompatibility(_:)(uint64_t a1, uint64_t a2, void (*a3)(long long *))
{
  if (a2)
  {
    *(void *)&long long v6 = a2;
    char v8 = 1;
    MEMORY[0x21669E8A0](a2);
LABEL_3:
    a3(&v6);
    return outlined destroy of Any?((uint64_t)&v6, &demangling cache variable for type metadata for Result<Any, Error>);
  }
  outlined init with copy of Any?(a1, (uint64_t)&v6);
  if (!v7)
  {
    outlined destroy of Any?((uint64_t)&v6, &demangling cache variable for type metadata for Any?);
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Any?);
    uint64_t v5 = swift_allocObject();
    *(void *)&long long v6 = v5;
    *(_OWORD *)(v5 + 16) = 0u;
    *(_OWORD *)(v5 + 32) = 0u;
    char v8 = 0;
    goto LABEL_3;
  }
  outlined init with take of Any(&v6, v9);
  outlined init with copy of Any((uint64_t)v9, (uint64_t)&v6);
  char v8 = 0;
  a3(&v6);
  outlined destroy of Any?((uint64_t)&v6, &demangling cache variable for type metadata for Result<Any, Error>);
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)v9);
}

uint64_t outlined init with copy of Any?(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Any?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
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

uint64_t sub_21435C440()
{
  if (*(void *)(v0 + 40)) {
    __swift_destroy_boxed_opaque_existential_0(v0 + 16);
  }

  return MEMORY[0x270FA0238](v0, 48, 7);
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

uint64_t outlined destroy of Any?(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

_OWORD *outlined init with take of Any(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t outlined init with copy of Any(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for CGSize(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for CGSize(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)__n128 result = (a2 - 1);
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

void type metadata accessor for CGSize(uint64_t a1)
{
}

void type metadata accessor for CGPoint(uint64_t a1)
{
}

void type metadata accessor for CGRect(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

void specialized closure #1 in static ObjCBlockConversion.exclusive<A>(_:)(uint64_t a1, unint64_t a2, void *a3, void (*a4)(uint64_t *))
{
  if (a2 >> 60 == 15)
  {
    if (a3)
    {
      uint64_t v8 = (uint64_t)a3;
      unint64_t v9 = 0;
      char v10 = 1;
      MEMORY[0x21669E8A0](a3);
      a4(&v8);
    }
    else
    {
      __break(1u);
    }
  }
  else
  {
    uint64_t v8 = a1;
    unint64_t v9 = a2;
    char v10 = 0;
    outlined copy of Data._Representation(a1, a2);
    a4(&v8);
    outlined consume of Data?(a1, a2);
  }
}

id WKPDFConfiguration.rect.getter@<X0>(uint64_t a1@<X8>)
{
  [v1 sel_rect];
  id result = (id)CGRectEqualToRect(v9, *MEMORY[0x263F001A0]);
  char v4 = (char)result;
  uint64_t v5 = 0;
  uint64_t v6 = 0;
  uint64_t v7 = 0;
  uint64_t v8 = 0;
  if ((result & 1) == 0) {
    id result = [v1 sel_rect:0.0, 0.0, 0.0, 0.0];
  }
  *(void *)a1 = v5;
  *(void *)(a1 + 8) = v6;
  *(void *)(a1 + 16) = v7;
  *(void *)(a1 + 24) = v8;
  *(unsigned char *)(a1 + 32) = v4;
  return result;
}

id key path getter for WKPDFConfiguration.rect : WKPDFConfiguration@<X0>(id *a1@<X0>, uint64_t a2@<X8>)
{
  id v3 = *a1;
  [*a1 sel_rect];
  id result = (id)CGRectEqualToRect(v10, *MEMORY[0x263F001A0]);
  char v5 = (char)result;
  uint64_t v6 = 0;
  uint64_t v7 = 0;
  uint64_t v8 = 0;
  uint64_t v9 = 0;
  if ((result & 1) == 0) {
    id result = [v3 performSelector:sel_rect withObject:0.0 withObject:0.0 withObject:0.0 withObject:0.0];
  }
  *(void *)a2 = v6;
  *(void *)(a2 + 8) = v7;
  *(void *)(a2 + 16) = v8;
  *(void *)(a2 + 24) = v9;
  *(unsigned char *)(a2 + 32) = v5;
  return result;
}

id WKPDFConfiguration.rect.setter(uint64_t a1)
{
  outlined init with take of CGRect?(a1, (uint64_t)v8, &demangling cache variable for type metadata for CGRect?);
  double v3 = *(double *)v8;
  double v4 = *(double *)&v8[1];
  double v5 = *(double *)&v8[2];
  double v6 = *(double *)&v8[3];
  outlined init with take of CGRect?(a1, (uint64_t)v9, &demangling cache variable for type metadata for CGRect?);
  if (v9[32] == 1)
  {
    double v3 = *MEMORY[0x263F001A0];
    double v4 = *(double *)(MEMORY[0x263F001A0] + 8);
    double v5 = *(double *)(MEMORY[0x263F001A0] + 16);
    double v6 = *(double *)(MEMORY[0x263F001A0] + 24);
  }
  return [v1 setRect:v3, v4, v5, v6];
}

void (*WKPDFConfiguration.rect.modify(void *a1))(id **a1, char a2)
{
  long long v2 = v1;
  double v4 = malloc(0x50uLL);
  *a1 = v4;
  v4[9] = v2;
  [v2 sel_rect];
  CGRect v12 = *(CGRect *)*(void *)&MEMORY[0x263F001A0];
  v4[5] = *MEMORY[0x263F001A0];
  v4[6] = *(void *)&v12.origin.y;
  v4[7] = *(void *)&v12.size.width;
  v4[8] = *(void *)&v12.size.height;
  BOOL v5 = CGRectEqualToRect(v11, v12);
  uint64_t v6 = 0;
  uint64_t v7 = 0;
  uint64_t v8 = 0;
  uint64_t v9 = 0;
  if (!v5) {
    [v2 sel_rect:0.0, 0.0, 0.0, 0.0];
  }
  *double v4 = v6;
  v4[1] = v7;
  v4[2] = v8;
  v4[3] = v9;
  *((unsigned char *)v4 + 32) = v5;
  return WKPDFConfiguration.rect.modify;
}

void WKPDFConfiguration.rect.modify(id **a1, char a2)
{
  long long v2 = *a1;
  int v3 = *((unsigned __int8 *)*a1 + 32);
  uint64_t v4 = (uint64_t)(*a1 + 3);
  uint64_t v5 = (uint64_t)(*a1 + 2);
  uint64_t v6 = (uint64_t)(*a1 + 1);
  uint64_t v7 = (uint64_t)(*a1 + 5);
  uint64_t v8 = (uint64_t)(*a1 + 6);
  uint64_t v9 = (uint64_t)(*a1 + 7);
  uint64_t v10 = (uint64_t)(*a1 + 8);
  if (*((unsigned char *)*a1 + 32)) {
    uint64_t v11 = (uint64_t)(*a1 + 8);
  }
  else {
    uint64_t v11 = (uint64_t)(*a1 + 3);
  }
  if (*((unsigned char *)*a1 + 32)) {
    uint64_t v12 = (uint64_t)(*a1 + 7);
  }
  else {
    uint64_t v12 = (uint64_t)(*a1 + 2);
  }
  if (*((unsigned char *)*a1 + 32)) {
    uint64_t v13 = (uint64_t)(*a1 + 6);
  }
  else {
    uint64_t v13 = (uint64_t)(*a1 + 1);
  }
  if (v3) {
    v14 = (double *)v7;
  }
  else {
    v14 = (double *)v2;
  }
  BOOL v15 = v3 == 0;
  if (v3) {
    v16 = (double *)v10;
  }
  else {
    v16 = (double *)v4;
  }
  if (v15) {
    v17 = (double *)v5;
  }
  else {
    v17 = (double *)v9;
  }
  if (v15) {
    v18 = (double *)v6;
  }
  else {
    v18 = (double *)v8;
  }
  if (v15) {
    v19 = (double *)v2;
  }
  else {
    v19 = (double *)v7;
  }
  if (a2)
  {
    v16 = (double *)v11;
    v17 = (double *)v12;
    v18 = (double *)v13;
    v19 = v14;
  }
  [v2[9] setRect:*v19 *v18 *v17 *v16];

  free(v2);
}

void WKWebView.callAsyncJavaScript(_:arguments:in:in:completionHandler:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, uint64_t a7)
{
  uint64_t v8 = v7;
  uint64_t v13 = (void *)MEMORY[0x21669E5C0]();
  v14.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
  if (a6)
  {
    uint64_t v15 = swift_allocObject();
    *(void *)(v15 + 16) = a6;
    *(void *)(v15 + 24) = a7;
    uint64_t v16 = swift_allocObject();
    *(void *)(v16 + 16) = partial apply for closure #1 in static ObjCBlockConversion.boxingNilAsAnyForCompatibility(_:);
    *(void *)(v16 + 24) = v15;
    uint64_t v17 = swift_allocObject();
    *(void *)(v17 + 16) = partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed Any?, @guaranteed Error?) -> ();
    *(void *)(v17 + 24) = v16;
    v18[4] = partial apply for thunk for @escaping @callee_guaranteed @Sendable (@in_guaranteed Any?, @in_guaranteed Error?) -> (@out ());
    v18[5] = v17;
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 1107296256;
    v18[2] = thunk for @escaping @callee_guaranteed @Sendable (@in_guaranteed Any?, @guaranteed Error?) -> ();
    v18[3] = &block_descriptor;
    a6 = _Block_copy(v18);
    swift_retain();
    swift_release();
  }
  [v8 callAsyncJavaScript:v13 arguments:v14.super.isa a4, a5, a6];
  _Block_release(a6);
}

uint64_t sub_21435CBC8()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t partial apply for closure #1 in static ObjCBlockConversion.boxingNilAsAnyForCompatibility(_:)(uint64_t a1, uint64_t a2)
{
  return closure #1 in static ObjCBlockConversion.boxingNilAsAnyForCompatibility(_:)(a1, a2, *(void (**)(long long *))(v2 + 16));
}

uint64_t partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed Any?, @guaranteed Error?) -> ()(uint64_t a1, void *a2)
{
  return (*(uint64_t (**)(uint64_t, void))(v2 + 16))(a1, *a2);
}

uint64_t partial apply for thunk for @escaping @callee_guaranteed @Sendable (@in_guaranteed Any?, @in_guaranteed Error?) -> (@out ())(uint64_t a1, uint64_t a2)
{
  int v3 = *(uint64_t (**)(uint64_t, uint64_t *))(v2 + 16);
  uint64_t v5 = a2;
  return v3(a1, &v5);
}

uint64_t thunk for @escaping @callee_guaranteed @Sendable (@in_guaranteed Any?, @guaranteed Error?) -> ()(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void (**)(long long *, void *))(a1 + 32);
  if (a2)
  {
    *((void *)&v9 + 1) = swift_getObjectType();
    *(void *)&long long v8 = a2;
  }
  else
  {
    long long v8 = 0u;
    long long v9 = 0u;
  }
  swift_retain();
  swift_unknownObjectRetain();
  id v6 = a3;
  v5(&v8, a3);
  swift_release();

  return outlined destroy of Any?((uint64_t)&v8);
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

void WKWebView.createPDF(configuration:completionHandler:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = a2;
  *(void *)(v7 + 24) = a3;
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = partial apply for thunk for @escaping @callee_guaranteed (@guaranteed Result<Data, Error>) -> ();
  *(void *)(v8 + 24) = v7;
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = partial apply for specialized closure #1 in static ObjCBlockConversion.exclusive<A>(_:);
  *(void *)(v9 + 24) = v8;
  v11[4] = partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed Data?, @guaranteed Error?) -> ();
  v11[5] = v9;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 1107296256;
  v11[2] = thunk for @escaping @callee_guaranteed @Sendable (@guaranteed Data?, @guaranteed Error?) -> ();
  v11[3] = &block_descriptor_18;
  uint64_t v10 = _Block_copy(v11);
  swift_retain();
  swift_release();
  [v3 createPDFWithConfiguration:a1 completionHandler:v10];
  _Block_release(v10);
}

uint64_t thunk for @escaping @callee_guaranteed @Sendable (@guaranteed Data?, @guaranteed Error?) -> ()(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = a2;
  uint64_t v5 = *(void (**)(void *, unint64_t, void *))(a1 + 32);
  if (a2)
  {
    swift_retain();
    id v6 = v4;
    uint64_t v4 = (void *)static Data._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v8 = v7;
  }
  else
  {
    swift_retain();
    unint64_t v8 = 0xF000000000000000;
  }
  id v9 = a3;
  v5(v4, v8, a3);

  outlined consume of Data?((uint64_t)v4, v8);

  return swift_release();
}

void WKWebView.createWebArchiveData(completionHandler:)(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = a1;
  *(void *)(v5 + 24) = a2;
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = thunk for @escaping @callee_guaranteed (@guaranteed Result<Data, Error>) -> ()partial apply;
  *(void *)(v6 + 24) = v5;
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = closure #1 in static ObjCBlockConversion.exclusive<A>(_:)specialized partial apply;
  *(void *)(v7 + 24) = v6;
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = thunk for @escaping @callee_guaranteed (@in_guaranteed Data?, @guaranteed Error?) -> ()partial apply;
  *(void *)(v8 + 24) = v7;
  v10[4] = partial apply for thunk for @escaping @callee_guaranteed (@guaranteed Data?, @guaranteed Error?) -> ();
  v10[5] = v8;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 1107296256;
  v10[2] = thunk for @escaping @callee_guaranteed @Sendable (@guaranteed Data, @guaranteed Error) -> ();
  v10[3] = &block_descriptor_36;
  id v9 = _Block_copy(v10);
  swift_retain();
  swift_release();
  [v2 sel_createWebArchiveDataWithCompletionHandler_:v9];
  _Block_release(v9);
}

uint64_t thunk for @escaping @callee_guaranteed @Sendable (@guaranteed Data, @guaranteed Error) -> ()(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void (**)(uint64_t, unint64_t, id))(a1 + 32);
  swift_retain();
  id v6 = a2;
  uint64_t v7 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v9 = v8;

  id v10 = a3;
  v5(v7, v9, v10);

  outlined consume of Data._Representation(v7, v9);

  return swift_release();
}

void WKWebView.evaluateJavaScript(_:in:in:completionHandler:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6)
{
  uint64_t v7 = v6;
  uint64_t v12 = (void *)MEMORY[0x21669E5C0]();
  if (a5)
  {
    uint64_t v13 = swift_allocObject();
    *(void *)(v13 + 16) = a5;
    *(void *)(v13 + 24) = a6;
    uint64_t v14 = swift_allocObject();
    *(void *)(v14 + 16) = closure #1 in static ObjCBlockConversion.boxingNilAsAnyForCompatibility(_:)partial apply;
    *(void *)(v14 + 24) = v13;
    uint64_t v15 = swift_allocObject();
    *(void *)(v15 + 16) = thunk for @escaping @callee_guaranteed (@in_guaranteed Any?, @guaranteed Error?) -> ()partial apply;
    *(void *)(v15 + 24) = v14;
    v16[4] = thunk for @escaping @callee_guaranteed @Sendable (@in_guaranteed Any?, @in_guaranteed Error?) -> (@out ())partial apply;
    v16[5] = v15;
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 1107296256;
    v16[2] = thunk for @escaping @callee_guaranteed @Sendable (@in_guaranteed Any?, @guaranteed Error?) -> ();
    v16[3] = &block_descriptor_51;
    a5 = _Block_copy(v16);
    swift_retain();
    swift_release();
  }
  [v7 evaluateJavaScript:v12 inFrame:a3 inContentWorld:a4 completionHandler:a5];
  _Block_release(a5);
}

void WKWebView.find(_:configuration:completionHandler:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  unint64_t v9 = (void *)MEMORY[0x21669E5C0]();
  v11[4] = a4;
  v11[5] = a5;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 1107296256;
  v11[2] = thunk for @escaping @callee_guaranteed @Sendable (@guaranteed WKFindResult) -> ();
  v11[3] = &block_descriptor_54;
  id v10 = _Block_copy(v11);
  swift_retain();
  swift_release();
  [v5 sel_findString_withConfiguration_completionHandler_:v9 a3:v10];
  _Block_release(v10);
}

void thunk for @escaping @callee_guaranteed @Sendable (@guaranteed WKFindResult) -> ()(uint64_t a1, void *a2)
{
  int v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

uint64_t WKWebView.callAsyncJavaScript(_:arguments:in:contentWorld:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v7[24] = a6;
  v7[25] = v6;
  v7[22] = a4;
  v7[23] = a5;
  v7[20] = a2;
  v7[21] = a3;
  v7[19] = a1;
  type metadata accessor for MainActor();
  v7[26] = static MainActor.shared.getter();
  uint64_t v9 = dispatch thunk of Actor.unownedExecutor.getter();
  v7[27] = v9;
  v7[28] = v8;
  return MEMORY[0x270FA2498](WKWebView.callAsyncJavaScript(_:arguments:in:contentWorld:), v9, v8);
}

uint64_t WKWebView.callAsyncJavaScript(_:arguments:in:contentWorld:)()
{
  uint64_t v1 = v0[24];
  uint64_t v2 = (void *)v0[25];
  uint64_t v3 = v0[23];
  uint64_t v4 = MEMORY[0x21669E5C0](v0[20], v0[21]);
  v0[29] = v4;
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  v0[30] = isa;
  v0[2] = v0;
  v0[7] = v0 + 15;
  v0[3] = WKWebView.callAsyncJavaScript(_:arguments:in:contentWorld:);
  uint64_t v6 = swift_continuation_init();
  v0[10] = MEMORY[0x263EF8330];
  v0[11] = 0x40000000;
  v0[12] = @objc completion handler block implementation for @escaping @callee_unowned @convention(block) @Sendable (@unowned Swift.AnyObject?, @unowned NSError?) -> () with result type Any?;
  v0[13] = &block_descriptor_55;
  v0[14] = v6;
  [v2 sel_callAsyncJavaScript_arguments_inFrame_inContentWorld_completionHandler_:v4 isa:v3 v3:v1 v1:v0 + 10];
  return MEMORY[0x270FA23F0](v0 + 2);
}

{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)();
  uint64_t v7;

  uint64_t v1 = *v0;
  uint64_t v2 = *(void *)(*v0 + 48);
  *(void *)(*v0 + 248) = v2;
  uint64_t v3 = *(void *)(v1 + 224);
  uint64_t v4 = *(void *)(v1 + 216);
  if (v2) {
    uint64_t v5 = WKWebView.callAsyncJavaScript(_:arguments:in:contentWorld:);
  }
  else {
    uint64_t v5 = WKWebView.callAsyncJavaScript(_:arguments:in:contentWorld:);
  }
  return MEMORY[0x270FA2498](v5, v4, v3);
}

{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t (*v4)(void);
  uint64_t v6;

  uint64_t v2 = (void *)v0[29];
  uint64_t v1 = (void *)v0[30];
  uint64_t v3 = v0[19];
  swift_release();
  outlined init with take of CGRect?((uint64_t)(v0 + 15), v3, &demangling cache variable for type metadata for Any?);

  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

{
  void *v0;
  void *v1;
  void *v2;
  uint64_t (*v3)(void);
  uint64_t v5;

  uint64_t v1 = (void *)v0[30];
  uint64_t v2 = (void *)v0[29];
  swift_release();
  swift_willThrow();

  uint64_t v3 = (uint64_t (*)(void))v0[1];
  return v3();
}

uint64_t @objc completion handler block implementation for @escaping @callee_unowned @convention(block) @Sendable (@unowned Swift.AnyObject?, @unowned NSError?) -> () with result type Any?(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Error);
    uint64_t v5 = swift_allocError();
    *uint64_t v6 = a3;
    id v7 = a3;
    return MEMORY[0x270FA2410](v3, v5);
  }
  else
  {
    if (a2)
    {
      *((void *)&v12 + 1) = swift_getObjectType();
      *(void *)&long long v11 = a2;
    }
    else
    {
      long long v11 = 0u;
      long long v12 = 0u;
    }
    outlined init with take of CGRect?((uint64_t)&v11, (uint64_t)v13, &demangling cache variable for type metadata for Any?);
    uint64_t v9 = *(void *)(*(void *)(v3 + 64) + 40);
    swift_unknownObjectRetain();
    outlined init with take of CGRect?((uint64_t)v13, v9, &demangling cache variable for type metadata for Any?);
    return swift_continuation_throwingResume();
  }
}

uint64_t WKWebView.pdf(configuration:)(uint64_t a1)
{
  v2[17] = a1;
  v2[18] = v1;
  type metadata accessor for MainActor();
  v2[19] = static MainActor.shared.getter();
  uint64_t v4 = dispatch thunk of Actor.unownedExecutor.getter();
  v2[20] = v4;
  v2[21] = v3;
  return MEMORY[0x270FA2498](WKWebView.pdf(configuration:), v4, v3);
}

uint64_t WKWebView.pdf(configuration:)()
{
  uint64_t v2 = v0[17];
  uint64_t v1 = (void *)v0[18];
  v0[2] = v0;
  v0[7] = v0 + 15;
  v0[3] = WKWebView.pdf(configuration:);
  uint64_t v3 = swift_continuation_init();
  v0[10] = MEMORY[0x263EF8330];
  v0[11] = 0x40000000;
  v0[12] = @objc completion handler block implementation for @escaping @callee_unowned @convention(block) @Sendable (@unowned NSData?, @unowned NSError?) -> () with result type Data;
  v0[13] = &block_descriptor_57;
  v0[14] = v3;
  [v1 createPDFWithConfiguration:v2 completionHandler:v0 + 10];
  return MEMORY[0x270FA23F0](v0 + 2);
}

{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)();
  uint64_t v7;

  uint64_t v1 = *v0;
  uint64_t v2 = *(void *)(*v0 + 48);
  *(void *)(*v0 + 176) = v2;
  uint64_t v3 = *(void *)(v1 + 168);
  uint64_t v4 = *(void *)(v1 + 160);
  if (v2) {
    uint64_t v5 = WKWebView.pdf(configuration:);
  }
  else {
    uint64_t v5 = WKWebView.pdf(configuration:);
  }
  return MEMORY[0x270FA2498](v5, v4, v3);
}

{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t);
  uint64_t v5;

  swift_release();
  uint64_t v1 = v0[15];
  uint64_t v2 = v0[16];
  uint64_t v3 = (uint64_t (*)(uint64_t, uint64_t))v0[1];
  return v3(v1, v2);
}

{
  uint64_t v0;
  uint64_t (*v1)(void);
  uint64_t v3;

  swift_release();
  swift_willThrow();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t @objc completion handler block implementation for @escaping @callee_unowned @convention(block) @Sendable (@unowned NSData?, @unowned NSError?) -> () with result type Data(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Error);
    uint64_t v5 = swift_allocError();
    *uint64_t v6 = a3;
    id v7 = a3;
    return MEMORY[0x270FA2410](v3, v5);
  }
  else
  {
    id v8 = a2;
    uint64_t v9 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v11 = v10;

    long long v12 = *(uint64_t **)(*(void *)(v3 + 64) + 40);
    *long long v12 = v9;
    v12[1] = v11;
    return swift_continuation_throwingResume();
  }
}

uint64_t WKWebView.evaluateJavaScript(_:in:contentWorld:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v6[23] = a5;
  v6[24] = v5;
  v6[21] = a3;
  v6[22] = a4;
  v6[19] = a1;
  v6[20] = a2;
  type metadata accessor for MainActor();
  v6[25] = static MainActor.shared.getter();
  uint64_t v8 = dispatch thunk of Actor.unownedExecutor.getter();
  v6[26] = v8;
  v6[27] = v7;
  return MEMORY[0x270FA2498](WKWebView.evaluateJavaScript(_:in:contentWorld:), v8, v7);
}

uint64_t WKWebView.evaluateJavaScript(_:in:contentWorld:)()
{
  uint64_t v2 = v0[23];
  uint64_t v1 = (void *)v0[24];
  uint64_t v3 = v0[22];
  uint64_t v4 = MEMORY[0x21669E5C0](v0[20], v0[21]);
  v0[28] = v4;
  v0[2] = v0;
  v0[7] = v0 + 15;
  v0[3] = WKWebView.evaluateJavaScript(_:in:contentWorld:);
  uint64_t v5 = swift_continuation_init();
  v0[10] = MEMORY[0x263EF8330];
  v0[11] = 0x40000000;
  v0[12] = @objc completion handler block implementation for @escaping @callee_unowned @convention(block) @Sendable (@unowned Swift.AnyObject?, @unowned NSError?) -> () with result type Any;
  v0[13] = &block_descriptor_59;
  v0[14] = v5;
  [v1 evaluateJavaScript:v4 inFrame:v3 inContentWorld:v2 completionHandler:v0 + 10];
  return MEMORY[0x270FA23F0](v0 + 2);
}

{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)();
  uint64_t v7;

  uint64_t v1 = *v0;
  uint64_t v2 = *(void *)(*v0 + 48);
  *(void *)(*v0 + 232) = v2;
  uint64_t v3 = *(void *)(v1 + 216);
  uint64_t v4 = *(void *)(v1 + 208);
  if (v2) {
    uint64_t v5 = WKWebView.evaluateJavaScript(_:in:contentWorld:);
  }
  else {
    uint64_t v5 = WKWebView.evaluateJavaScript(_:in:contentWorld:);
  }
  return MEMORY[0x270FA2498](v5, v4, v3);
}

{
  uint64_t v0;
  void *v1;
  _OWORD *v2;
  uint64_t (*v3)(void);
  uint64_t v5;

  uint64_t v1 = *(void **)(v0 + 224);
  uint64_t v2 = *(_OWORD **)(v0 + 152);
  swift_release();
  outlined init with take of Any((_OWORD *)(v0 + 120), v2);

  uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

{
  uint64_t v0;
  void *v1;
  uint64_t (*v2)(void);
  uint64_t v4;

  uint64_t v1 = *(void **)(v0 + 224);
  swift_release();
  swift_willThrow();

  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t @objc completion handler block implementation for @escaping @callee_unowned @convention(block) @Sendable (@unowned Swift.AnyObject?, @unowned NSError?) -> () with result type Any(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Error);
    uint64_t v5 = swift_allocError();
    *uint64_t v6 = a3;
    id v7 = a3;
    a1 = v3;
    a2 = v5;
  }
  else
  {
    uint64_t v8 = a2;
    if (a2)
    {
      uint64_t ObjectType = swift_getObjectType();
      *(void *)&long long v11 = v8;
      uint64_t v9 = *(_OWORD **)(*(void *)(v3 + 64) + 40);
      swift_unknownObjectRetain();
      outlined init with take of Any(&v11, v9);
      return swift_continuation_throwingResume();
    }
    __break(1u);
  }
  return MEMORY[0x270FA2410](a1, a2);
}

uint64_t WKWebView.find(_:configuration:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[18] = a3;
  v4[19] = v3;
  v4[16] = a1;
  v4[17] = a2;
  type metadata accessor for MainActor();
  v4[20] = static MainActor.shared.getter();
  uint64_t v6 = dispatch thunk of Actor.unownedExecutor.getter();
  v4[21] = v6;
  v4[22] = v5;
  return MEMORY[0x270FA2498](WKWebView.find(_:configuration:), v6, v5);
}

uint64_t WKWebView.find(_:configuration:)()
{
  uint64_t v2 = v0[18];
  uint64_t v1 = (void *)v0[19];
  uint64_t v3 = MEMORY[0x21669E5C0](v0[16], v0[17]);
  v0[23] = v3;
  v0[2] = v0;
  v0[7] = v0 + 15;
  v0[3] = WKWebView.find(_:configuration:);
  uint64_t v4 = swift_continuation_init();
  v0[10] = MEMORY[0x263EF8330];
  v0[11] = 0x40000000;
  v0[12] = @objc completion handler block implementation for @escaping @callee_unowned @convention(block) @Sendable (@unowned WKFindResult) -> () with result type WKFindResult;
  v0[13] = &block_descriptor_61;
  v0[14] = v4;
  [v1 sel_findString_withConfiguration_completionHandler_:v3, v2, v0 + 10];
  return MEMORY[0x270FA23F0](v0 + 2);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;

  uint64_t v1 = *(void *)(*(void *)v0 + 176);
  uint64_t v2 = *(void *)(*(void *)v0 + 168);
  return MEMORY[0x270FA2498](WKWebView.find(_:configuration:), v2, v1);
}

{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t);
  uint64_t v5;

  uint64_t v1 = (void *)v0[23];
  swift_release();
  uint64_t v2 = v0[15];

  uint64_t v3 = (uint64_t (*)(uint64_t))v0[1];
  return v3(v2);
}

uint64_t @objc completion handler block implementation for @escaping @callee_unowned @convention(block) @Sendable (@unowned WKFindResult) -> () with result type WKFindResult(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  **(void **)(*(void *)(v2 + 64) + 40) = a2;
  id v3 = a2;

  return MEMORY[0x270FA2400](v2);
}

void partial apply for specialized closure #1 in static ObjCBlockConversion.exclusive<A>(_:)(uint64_t a1, void *a2)
{
  specialized closure #1 in static ObjCBlockConversion.exclusive<A>(_:)(*(void *)a1, *(void *)(a1 + 8), a2, *(void (**)(uint64_t *))(v2 + 16));
}

uint64_t partial apply for thunk for @escaping @callee_guaranteed (@guaranteed Result<Data, Error>) -> ()(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(v1 + 16))(*(void *)a1, *(void *)(a1 + 8), *(unsigned __int8 *)(a1 + 16));
}

uint64_t partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed Data?, @guaranteed Error?) -> ()(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(uint64_t (**)(void *, uint64_t))(v3 + 16);
  v6[0] = a1;
  v6[1] = a2;
  return v4(v6, a3);
}

uint64_t partial apply for thunk for @escaping @callee_guaranteed (@guaranteed Data?, @guaranteed Error?) -> ()()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t outlined init with take of CGRect?(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

id sub_21435E718(uint64_t a1, id *a2)
{
  if (*(unsigned char *)(a1 + 32)) {
    uint64_t v2 = (double *)MEMORY[0x263F001A0];
  }
  else {
    uint64_t v2 = (double *)a1;
  }
  return [*a2 setRect:*v2 x:v2[1] y:v2[2] width:v2[3]];
}

uint64_t outlined consume of Data._Representation(uint64_t a1, unint64_t a2)
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

uint64_t outlined consume of Data?(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return outlined consume of Data._Representation(a1, a2);
  }
  return a1;
}

uint64_t outlined copy of Data._Representation(uint64_t a1, unint64_t a2)
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

uint64_t outlined destroy of Any?(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Any?);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

size_t WKWebsiteDataStore.proxyConfigurations.getter()
{
  uint64_t v14 = type metadata accessor for ProxyConfiguration();
  uint64_t v1 = *(void *)(v14 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v3 = (char *)&v14 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v4 = [v0 sel_proxyConfigurations];
  uint64_t v5 = MEMORY[0x263F8EE78];
  if (!v4) {
    return v5;
  }
  uint64_t v6 = v4;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for OS_nw_proxy_config);
  unint64_t v7 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  if (!(v7 >> 62))
  {
    uint64_t v8 = *(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v8) {
      goto LABEL_4;
    }
LABEL_14:
    swift_bridgeObjectRelease();
    return v5;
  }
  swift_bridgeObjectRetain();
  uint64_t v8 = _CocoaArrayWrapper.endIndex.getter();
  swift_bridgeObjectRelease();
  if (!v8) {
    goto LABEL_14;
  }
LABEL_4:
  uint64_t v15 = v5;
  size_t result = specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v8 & ~(v8 >> 63), 0);
  if ((v8 & 0x8000000000000000) == 0)
  {
    uint64_t v10 = 0;
    uint64_t v5 = v15;
    do
    {
      if ((v7 & 0xC000000000000001) != 0) {
        uint64_t v11 = MEMORY[0x21669E620](v10, v7);
      }
      else {
        uint64_t v11 = swift_unknownObjectRetain();
      }
      MEMORY[0x21669E5A0](v11);
      uint64_t v15 = v5;
      unint64_t v13 = *(void *)(v5 + 16);
      unint64_t v12 = *(void *)(v5 + 24);
      if (v13 >= v12 >> 1)
      {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v12 > 1, v13 + 1, 1);
        uint64_t v5 = v15;
      }
      ++v10;
      *(void *)(v5 + 16) = v13 + 1;
      (*(void (**)(unint64_t, char *, uint64_t))(v1 + 32))(v5+ ((*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80))+ *(void *)(v1 + 72) * v13, v3, v14);
    }
    while (v8 != v10);
    goto LABEL_14;
  }
  __break(1u);
  return result;
}

void key path setter for WKWebsiteDataStore.proxyConfigurations : WKWebsiteDataStore(uint64_t a1, void **a2)
{
  uint64_t v2 = *a2;
  uint64_t v3 = swift_bridgeObjectRetain();
  _sSlsE3mapySayqd__Gqd__7ElementQzqd_0_YKXEqd_0_YKs5ErrorRd_0_r0_lFSay7Network18ProxyConfigurationVG_So18OS_nw_proxy_config_ps5NeverOTg5067_sSo18WKWebsiteDataStoreC6WebKitE19proxyConfigurationsSay7Network18ef8VGvsSo06g1_h4_F7_J60_pAGcfu_32c1c5f069c8648e3381a339080d8c0633AGSoAI_pTf3nnnpk_nTf1cn_n(v3);
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for OS_nw_proxy_config);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  [v2 setProxyConfigurations:isa];
}

void WKWebsiteDataStore.proxyConfigurations.setter(uint64_t a1)
{
  _sSlsE3mapySayqd__Gqd__7ElementQzqd_0_YKXEqd_0_YKs5ErrorRd_0_r0_lFSay7Network18ProxyConfigurationVG_So18OS_nw_proxy_config_ps5NeverOTg5067_sSo18WKWebsiteDataStoreC6WebKitE19proxyConfigurationsSay7Network18ef8VGvsSo06g1_h4_F7_J60_pAGcfu_32c1c5f069c8648e3381a339080d8c0633AGSoAI_pTf3nnnpk_nTf1cn_n(a1);
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for OS_nw_proxy_config);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  [v1 setProxyConfigurations:isa];
}

uint64_t _sSlsE3mapySayqd__Gqd__7ElementQzqd_0_YKXEqd_0_YKs5ErrorRd_0_r0_lFSay7Network18ProxyConfigurationVG_So18OS_nw_proxy_config_ps5NeverOTg5067_sSo18WKWebsiteDataStoreC6WebKitE19proxyConfigurationsSay7Network18ef8VGvsSo06g1_h4_F7_J60_pAGcfu_32c1c5f069c8648e3381a339080d8c0633AGSoAI_pTf3nnnpk_nTf1cn_n(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t result = MEMORY[0x263F8EE78];
  if (v2)
  {
    uint64_t v7 = MEMORY[0x263F8EE78];
    specialized ContiguousArray.reserveCapacity(_:)();
    uint64_t v4 = *(void *)(type metadata accessor for ProxyConfiguration() - 8);
    uint64_t v5 = a1 + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
    uint64_t v6 = *(void *)(v4 + 72);
    do
    {
      ProxyConfiguration.nw.getter();
      specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
      specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
      specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
      specialized ContiguousArray._endMutation()();
      v5 += v6;
      --v2;
    }
    while (v2);
    return v7;
  }
  return result;
}

void (*WKWebsiteDataStore.proxyConfigurations.modify(size_t *a1))(uint64_t *a1, char a2)
{
  a1[3] = v1;
  *a1 = WKWebsiteDataStore.proxyConfigurations.getter();
  return WKWebsiteDataStore.proxyConfigurations.modify;
}

void WKWebsiteDataStore.proxyConfigurations.modify(uint64_t *a1, char a2)
{
  uint64_t v2 = (void *)a1[3];
  if (a2)
  {
    uint64_t v3 = swift_bridgeObjectRetain();
    _sSlsE3mapySayqd__Gqd__7ElementQzqd_0_YKXEqd_0_YKs5ErrorRd_0_r0_lFSay7Network18ProxyConfigurationVG_So18OS_nw_proxy_config_ps5NeverOTg5067_sSo18WKWebsiteDataStoreC6WebKitE19proxyConfigurationsSay7Network18ef8VGvsSo06g1_h4_F7_J60_pAGcfu_32c1c5f069c8648e3381a339080d8c0633AGSoAI_pTf3nnnpk_nTf1cn_n(v3);
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for OS_nw_proxy_config);
    Class isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    [v2 setProxyConfigurations:isa];

    swift_bridgeObjectRelease();
  }
  else
  {
    _sSlsE3mapySayqd__Gqd__7ElementQzqd_0_YKXEqd_0_YKs5ErrorRd_0_r0_lFSay7Network18ProxyConfigurationVG_So18OS_nw_proxy_config_ps5NeverOTg5067_sSo18WKWebsiteDataStoreC6WebKitE19proxyConfigurationsSay7Network18ef8VGvsSo06g1_h4_F7_J60_pAGcfu_32c1c5f069c8648e3381a339080d8c0633AGSoAI_pTf3nnnpk_nTf1cn_n(*a1);
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for OS_nw_proxy_config);
    Class v5 = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    [v2 setProxyConfigurations:v5];
  }
}

size_t specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(size_t a1, int64_t a2, char a3)
{
  size_t result = specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, a3, (void *)*v3);
  *uint64_t v3 = result;
  return result;
}

size_t sub_21435EEA8@<X0>(size_t *a1@<X8>)
{
  size_t result = WKWebsiteDataStore.proxyConfigurations.getter();
  *a1 = result;
  return result;
}

size_t specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(size_t result, int64_t a2, char a3, void *a4)
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
    unint64_t v13 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<ProxyConfiguration>);
  uint64_t v10 = *(void *)(type metadata accessor for ProxyConfiguration() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  unint64_t v13 = (void *)swift_allocObject();
  size_t result = _swift_stdlib_malloc_size(v13);
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
  uint64_t v15 = *(void *)(type metadata accessor for ProxyConfiguration() - 8);
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
  swift_release();
  return (size_t)v13;
}

uint64_t static Data._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x270EF0178]();
}

uint64_t ProxyConfiguration.nw.getter()
{
  return MEMORY[0x270EF7710]();
}

uint64_t type metadata accessor for ProxyConfiguration()
{
  return MEMORY[0x270EF7718]();
}

uint64_t ProxyConfiguration.init(_:)()
{
  return MEMORY[0x270EF7720]();
}

NSDictionary __swiftcall Dictionary._bridgeToObjectiveC()()
{
  return (NSDictionary)MEMORY[0x270EF1818]();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)MEMORY[0x270EF19B0]();
}

NSArray __swiftcall Array._bridgeToObjectiveC()()
{
  return (NSArray)MEMORY[0x270EF1B88]();
}

uint64_t static Array._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t dispatch thunk of Actor.unownedExecutor.getter()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t static MainActor.shared.getter()
{
  return MEMORY[0x270FA1EA0]();
}

uint64_t type metadata accessor for MainActor()
{
  return MEMORY[0x270FA1EA8]();
}

uint64_t specialized _ArrayBuffer._getElementSlowPath(_:)()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t specialized ContiguousArray._endMutation()()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t specialized ContiguousArray.reserveCapacity(_:)()
{
  return MEMORY[0x270F9EBE0]();
}

uint64_t specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t _CocoaArrayWrapper.endIndex.getter()
{
  return MEMORY[0x270F9F080]();
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x270EE71A0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_release(const void *aBlock)
{
}

void free(void *a1)
{
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x270EDA328](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x270EDA378](ptr);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

void objc_release(id a1)
{
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

uint64_t swift_allocError()
{
  return MEMORY[0x270FA0190]();
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

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x270FA23F8]();
}

uint64_t swift_continuation_throwingResume()
{
  return MEMORY[0x270FA2408]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x270FA02D0]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x270FA03E8]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}