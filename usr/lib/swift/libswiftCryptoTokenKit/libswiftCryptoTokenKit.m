void TKSmartCard.send(ins:p1:p2:data:le:reply:)(unsigned __int8 a1, unsigned __int8 a2, unsigned __int8 a3, uint64_t a4, unint64_t a5, uint64_t a6, char a7, uint64_t a8, uint64_t a9)
{
  void *v9;
  Class isa;
  uint64_t v17;
  id v18;
  void *v19;
  void v20[6];

  if (a5 >> 60 != 15)
  {
    isa = Data._bridgeToObjectiveC()().super.isa;
    v17 = a9;
    if (a7) {
      goto LABEL_3;
    }
LABEL_5:
    v18 = [objc_allocWithZone(NSNumber) initWithInteger:a6];
    goto LABEL_6;
  }
  isa = 0;
  v17 = a9;
  if ((a7 & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  v18 = 0;
LABEL_6:
  v20[4] = a8;
  v20[5] = v17;
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 1107296256;
  v20[2] = thunk for @escaping @callee_guaranteed (@guaranteed Data?, @unowned UInt16, @guaranteed Error?) -> ();
  v20[3] = &block_descriptor;
  v19 = _Block_copy(v20);
  swift_retain();
  swift_release();
  [v9 sel_sendIns_p1_p2_data_le_reply_:a1 a2:a3 isa:v18 v19];

  _Block_release(v19);
}

uint64_t thunk for @escaping @callee_guaranteed (@guaranteed Data?, @unowned UInt16, @guaranteed Error?) -> ()(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  v6 = a2;
  v7 = *(void (**)(void *, unint64_t, uint64_t, void *))(a1 + 32);
  if (a2)
  {
    swift_retain();
    id v8 = v6;
    v6 = (void *)static Data._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v10 = v9;
  }
  else
  {
    swift_retain();
    unint64_t v10 = 0xF000000000000000;
  }
  id v11 = a4;
  v7(v6, v10, a3, a4);

  outlined consume of Data?((uint64_t)v6, v10);

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

uint64_t TKSmartCard.send(ins:p1:p2:data:le:)(unsigned __int8 a1, unsigned __int8 a2, unsigned __int8 a3, uint64_t a4, unint64_t a5, uint64_t a6, char a7)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  unsigned __int16 v20 = 0;
  if (a5 >> 60 == 15)
  {
    Class isa = 0;
    if (a7)
    {
LABEL_3:
      id v14 = 0;
      goto LABEL_6;
    }
  }
  else
  {
    Class isa = Data._bridgeToObjectiveC()().super.isa;
    if (a7) {
      goto LABEL_3;
    }
  }
  id v14 = [objc_allocWithZone(NSNumber) initWithInteger:a6];
LABEL_6:
  id v19 = 0;
  id v15 = [v7 sel_sendIns_p1_p2_data_le_sw_error_:a1, a2, a3, isa, v14, &v20, &v19];

  id v16 = v19;
  if (v15)
  {
    static Data._unconditionallyBridgeFromObjectiveC(_:)();

    return v20;
  }
  else
  {
    v18 = v16;
    _convertNSErrorToError(_:)();

    return swift_willThrow();
  }
}

uint64_t TKSmartCard.withSession<A>(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v21 = a4;
  v5 = v4;
  aBlock[6] = *(id *)MEMORY[0x263EF8340];
  uint64_t v9 = type metadata accessor for Optional();
  uint64_t v22 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388]();
  id v11 = (char *)&v21 - v10;
  uint64_t v12 = swift_allocBox();
  uint64_t v14 = v13;
  uint64_t v15 = *(void *)(a3 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v15 + 56))(v13, 1, 1, a3);
  id v16 = (void *)swift_allocObject();
  v16[2] = a3;
  v16[3] = v12;
  v16[4] = a1;
  v16[5] = a2;
  aBlock[4] = partial apply for closure #1 in TKSmartCard.withSession<A>(_:);
  aBlock[5] = v16;
  aBlock[0] = (id)MEMORY[0x263EF8330];
  aBlock[1] = (id)1107296256;
  aBlock[2] = thunk for @escaping @callee_guaranteed (@unowned AutoreleasingUnsafeMutablePointer<NSError?>?) -> (@unowned Bool);
  aBlock[3] = &block_descriptor_3;
  v17 = _Block_copy(aBlock);
  swift_retain();
  swift_retain();
  swift_release();
  aBlock[0] = 0;
  LODWORD(v5) = [v5 sel_inSessionWithError_executeBlock_:aBlock:v17];
  _Block_release(v17);
  id v18 = aBlock[0];
  if (v5)
  {
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v22 + 16))(v11, v14, v9);
    uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v15 + 48))(v11, 1, a3);
    if (result == 1)
    {
      __break(1u);
    }
    else
    {
      (*(void (**)(uint64_t, char *, uint64_t))(v15 + 32))(v21, v11, a3);
      return swift_release();
    }
  }
  else
  {
    unsigned __int16 v20 = v18;
    _convertNSErrorToError(_:)();

    swift_willThrow();
    return swift_release();
  }
  return result;
}

uint64_t closure #1 in TKSmartCard.withSession<A>(_:)(uint64_t a1, uint64_t a2, void (*a3)(void), uint64_t a4, uint64_t a5)
{
  uint64_t v7 = type metadata accessor for Optional();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v10 = (char *)&v13 - v9;
  uint64_t v11 = swift_projectBox();
  a3();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(a5 - 8) + 56))(v10, 0, 1, a5);
  swift_beginAccess();
  (*(void (**)(uint64_t, char *, uint64_t))(v8 + 40))(v11, v10, v7);
  return 1;
}

uint64_t sub_2120D2A34()
{
  swift_release();
  swift_release();

  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t partial apply for closure #1 in TKSmartCard.withSession<A>(_:)(uint64_t a1)
{
  return closure #1 in TKSmartCard.withSession<A>(_:)(a1, *(void *)(v1 + 24), *(void (**)(void))(v1 + 32), *(void *)(v1 + 40), *(void *)(v1 + 16));
}

uint64_t thunk for @escaping @callee_guaranteed (@unowned AutoreleasingUnsafeMutablePointer<NSError?>?) -> (@unowned Bool)(uint64_t a1, uint64_t a2)
{
  v3 = *(uint64_t (**)(uint64_t))(a1 + 32);
  swift_retain();
  LOBYTE(a2) = v3(a2);
  swift_release();
  return a2 & 1;
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

unint64_t type metadata accessor for NSError()
{
  unint64_t result = lazy cache variable for type metadata for NSError;
  if (!lazy cache variable for type metadata for NSError)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&lazy cache variable for type metadata for NSError);
  }
  return result;
}

uint64_t outlined consume of Data?(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return outlined consume of Data._Representation(a1, a2);
  }
  return a1;
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

uint64_t _convertNSErrorToError(_:)()
{
  return MEMORY[0x270EEF840]();
}

NSData __swiftcall Data._bridgeToObjectiveC()()
{
  return (NSData)MEMORY[0x270EF0120]();
}

uint64_t static Data._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x270EF0178]();
}

uint64_t type metadata accessor for Optional()
{
  return MEMORY[0x270F9E3C0]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_release(const void *aBlock)
{
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x270FA0180]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x270FA01E0]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
}

uint64_t swift_projectBox()
{
  return MEMORY[0x270FA04F8]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}