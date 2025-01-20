uint64_t Version.__allocating_init()()
{
  id v0;
  uint64_t result;

  v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F586A0]), sel_init);
  type metadata accessor for Version();
  result = OUTLINED_FUNCTION_0();
  *(void *)(result + 16) = v0;
  return result;
}

uint64_t type metadata accessor for Version()
{
  return self;
}

uint64_t Version.__allocating_init(major:minor:)(uint64_t a1, uint64_t a2)
{
  id v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F586A0]), sel_initWithMajor_minor_, a1, a2);
  type metadata accessor for Version();
  uint64_t result = OUTLINED_FUNCTION_0();
  *(void *)(result + 16) = v2;
  return result;
}

id sub_259217BA4()
{
  return objc_msgSend(*(id *)(v0 + 16), sel_major);
}

id sub_259217BB4()
{
  return objc_msgSend(*(id *)(v0 + 16), sel_minor);
}

uint64_t static Version.== infix(_:_:)()
{
  return sub_2592190EC() & 1;
}

BOOL static Version.< infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 16), sel_compare_, *(void *)(a2 + 16)) == (id)-1;
}

BOOL sub_259217C48(uint64_t *a1, uint64_t *a2)
{
  return static Version.< infix(_:_:)(*a1, *a2);
}

uint64_t sub_259217C78()
{
  return static Version.== infix(_:_:)() & 1;
}

uint64_t Identifier.__allocating_init(name:)()
{
  sub_259218960(0, &qword_26A37C4C8);
  id v0 = sub_259217CFC();
  type metadata accessor for Identifier();
  uint64_t result = OUTLINED_FUNCTION_0();
  *(void *)(result + 16) = v0;
  return result;
}

id sub_259217CFC()
{
  id v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v1 = (void *)sub_2592190BC();
  swift_bridgeObjectRelease();
  id v2 = objc_msgSend(v0, sel_initWithName_, v1);

  return v2;
}

uint64_t sub_259217D70()
{
  return sub_259217D88((const char **)&selRef_namespace);
}

uint64_t sub_259217D7C()
{
  return sub_259217D88((const char **)&selRef_name);
}

uint64_t sub_259217D88(const char **a1)
{
  id v1 = OUTLINED_FUNCTION_1(a1);
  uint64_t v2 = sub_2592190CC();

  return v2;
}

uint64_t Identifier.deinit()
{
  return v0;
}

uint64_t Identifier.__deallocating_deinit()
{
  return MEMORY[0x270FA0228](v0, 24, 7);
}

BOOL static ChannelType.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t ChannelType.hash(into:)()
{
  return sub_25921917C();
}

uint64_t ChannelType.hashValue.getter()
{
  return sub_25921918C();
}

uint64_t sub_259217EC0()
{
  return sub_25921918C();
}

uint64_t sub_259217F04()
{
  return sub_25921800C((const char **)&selRef_channel, (void (*)(void))type metadata accessor for Channel);
}

uint64_t sub_259217F24()
{
  return sub_259217F04();
}

uint64_t static Channel.primary.getter()
{
  id v0 = objc_msgSend(self, sel_primary);
  type metadata accessor for Channel();
  uint64_t result = OUTLINED_FUNCTION_0();
  *(void *)(result + 16) = v0;
  return result;
}

uint64_t ConcretePipeline.__allocating_init(identifier:)(uint64_t a1)
{
  id v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F586E0]), sel_initWithIdentifier_, *(void *)(a1 + 16));
  swift_release();
  type metadata accessor for ConcretePipeline();
  uint64_t result = OUTLINED_FUNCTION_0();
  *(void *)(result + 16) = v1;
  return result;
}

uint64_t sub_259217FEC()
{
  return sub_25921800C((const char **)&selRef_identifier, (void (*)(void))type metadata accessor for Identifier);
}

uint64_t sub_25921800C(const char **a1, void (*a2)(void))
{
  id v3 = OUTLINED_FUNCTION_1(a1);
  a2();
  uint64_t result = OUTLINED_FUNCTION_0();
  *(void *)(result + 16) = v3;
  return result;
}

uint64_t sub_25921804C()
{
  return sub_259218064((const char **)&selRef_inputChannels);
}

uint64_t sub_259218058()
{
  return sub_259218064((const char **)&selRef_outputChannels);
}

uint64_t sub_259218064(const char **a1)
{
  id v1 = OUTLINED_FUNCTION_1(a1);
  sub_259218960(0, &qword_26A37C4D0);
  unint64_t v2 = sub_2592190DC();

  if (!(v2 >> 62))
  {
    uint64_t v3 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v3) {
      goto LABEL_3;
    }
LABEL_11:
    swift_bridgeObjectRelease();
    return MEMORY[0x263F8EE78];
  }
  swift_bridgeObjectRetain();
  uint64_t v3 = sub_25921915C();
  swift_bridgeObjectRelease();
  if (!v3) {
    goto LABEL_11;
  }
LABEL_3:
  uint64_t v9 = MEMORY[0x263F8EE78];
  uint64_t result = sub_25921912C();
  if ((v3 & 0x8000000000000000) == 0)
  {
    uint64_t v5 = 0;
    do
    {
      if ((v2 & 0xC000000000000001) != 0) {
        id v6 = (id)MEMORY[0x25A2D97C0](v5, v2);
      }
      else {
        id v6 = *(id *)(v2 + 8 * v5 + 32);
      }
      id v7 = v6;
      ++v5;
      type metadata accessor for Channel();
      *(void *)(OUTLINED_FUNCTION_0() + 16) = v7;
      sub_25921910C();
      sub_25921913C();
      sub_25921914C();
      sub_25921911C();
    }
    while (v3 != v5);
    uint64_t v8 = v9;
    swift_bridgeObjectRelease();
    return v8;
  }
  __break(1u);
  return result;
}

void sub_2592181DC(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = v2;
  v23[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t v6 = sub_259217D70();
  uint64_t v8 = v7;
  uint64_t v9 = sub_259217D7C();
  uint64_t v11 = v10;
  id v12 = objc_msgSend(*(id *)(a1 + 16), sel_version);
  id v13 = objc_allocWithZone(MEMORY[0x263F58628]);
  id v14 = sub_259218860(v6, v8, v9, v11, v12);
  v15 = *(void **)(v3 + 16);
  v23[0] = 0;
  id v16 = objc_msgSend(v15, sel_addPipelineWithIdentifier_error_, v14, v23);
  id v17 = v23[0];
  if (v16)
  {
    self;
    uint64_t v18 = swift_dynamicCastObjCClassUnconditional();
    uint64_t v19 = type metadata accessor for ConcretePipeline();
    uint64_t v20 = swift_allocObject();
    *(void *)(v20 + 16) = v18;
    a2[3] = v19;
    a2[4] = (uint64_t)&protocol witness table for ConcretePipeline;
    id v21 = v17;

    *a2 = v20;
  }
  else
  {
    id v22 = v23[0];
    sub_25921907C();

    swift_willThrow();
  }
}

id sub_259218370@<X0>(uint64_t *a1@<X8>)
{
  v12[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t v3 = *(void **)(v1 + 16);
  v4 = (void *)sub_2592190BC();
  v12[0] = 0;
  id v5 = objc_msgSend(v3, sel_addCIFilterPipelineWithName_error_, v4, v12);

  id v6 = v12[0];
  if (v5)
  {
    self;
    uint64_t v7 = swift_dynamicCastObjCClassUnconditional();
    uint64_t v8 = type metadata accessor for ConcretePipeline();
    uint64_t v9 = swift_allocObject();
    *(void *)(v9 + 16) = v7;
    a1[3] = v8;
    a1[4] = (uint64_t)&protocol witness table for ConcretePipeline;
    *a1 = v9;
    return v6;
  }
  else
  {
    id v11 = v12[0];
    sub_25921907C();

    return (id)swift_willThrow();
  }
}

uint64_t sub_259218494@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_2592184AC(a1, (SEL *)&selRef_addInputChannel_, a2);
}

uint64_t sub_2592184A0@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_2592184AC(a1, (SEL *)&selRef_addOutputChannel_, a2);
}

uint64_t sub_2592184AC@<X0>(uint64_t a1@<X0>, SEL *a2@<X1>, uint64_t *a3@<X8>)
{
  id v5 = objc_msgSend(*(id *)(v3 + 16), *a2, *(void *)(a1 + 16));
  self;
  uint64_t v6 = swift_dynamicCastObjCClassUnconditional();
  uint64_t v7 = type metadata accessor for ConcreteChannelPort();
  uint64_t result = OUTLINED_FUNCTION_0();
  *(void *)(result + 16) = v6;
  a3[3] = v7;
  a3[4] = (uint64_t)&off_270726580;
  *a3 = result;
  return result;
}

void sub_25921853C(uint64_t a1, uint64_t a2)
{
}

void sub_259218590(uint64_t a1, uint64_t a2)
{
}

void sub_2592185E4(uint64_t a1, uint64_t a2, SEL *a3)
{
  v14[5] = *(id *)MEMORY[0x263EF8340];
  sub_2592189C0(a1, (uint64_t)v14);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A37C4D8);
  uint64_t v6 = type metadata accessor for ConcreteChannelPort();
  OUTLINED_FUNCTION_2(v6);
  id v7 = *(id *)(v13 + 16);
  swift_release();
  uint64_t v8 = sub_2592189C0(a2, (uint64_t)v14);
  OUTLINED_FUNCTION_2(v8);
  id v9 = *(id *)(v13 + 16);
  swift_release();
  uint64_t v10 = *(void **)(v3 + 16);
  v14[0] = 0;
  if (objc_msgSend(v10, *a3, v7, v9, v14))
  {
    id v11 = v14[0];
  }
  else
  {
    id v12 = v14[0];
    sub_25921907C();

    swift_willThrow();
  }
}

void sub_25921871C(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
}

id sub_259218740@<X0>(uint64_t *a1@<X8>)
{
  return sub_259218370(a1);
}

uint64_t sub_259218764@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_259218494(a1, a2);
}

uint64_t sub_259218788@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_2592184A0(a1, a2);
}

void sub_2592187AC(uint64_t a1, uint64_t a2)
{
}

void sub_2592187D0(uint64_t a1, uint64_t a2)
{
}

uint64_t sub_2592187F4()
{
  return sub_259217FEC();
}

uint64_t sub_259218818()
{
  return sub_25921804C();
}

uint64_t sub_25921883C()
{
  return sub_259218058();
}

id sub_259218860(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7 = (void *)sub_2592190BC();
  swift_bridgeObjectRelease();
  uint64_t v8 = (void *)sub_2592190BC();
  swift_bridgeObjectRelease();
  id v9 = objc_msgSend(v5, sel_initWithNamespace_name_version_, v7, v8, a5);

  return v9;
}

uint64_t type metadata accessor for Identifier()
{
  return self;
}

uint64_t type metadata accessor for Channel()
{
  return self;
}

uint64_t type metadata accessor for ConcretePipeline()
{
  return self;
}

uint64_t sub_259218960(uint64_t a1, unint64_t *a2)
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

uint64_t type metadata accessor for ConcreteChannelPort()
{
  return self;
}

uint64_t sub_2592189C0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
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

unint64_t sub_259218A6C()
{
  unint64_t result = qword_26A37C4E0;
  if (!qword_26A37C4E0)
  {
    type metadata accessor for Version();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A37C4E0);
  }
  return result;
}

unint64_t sub_259218ABC()
{
  unint64_t result = qword_26A37C4E8;
  if (!qword_26A37C4E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A37C4E8);
  }
  return result;
}

uint64_t method lookup function for Version(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for Version);
}

uint64_t dispatch thunk of Version.major.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 96))();
}

uint64_t dispatch thunk of Version.minor.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 104))();
}

uint64_t method lookup function for Identifier(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for Identifier);
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for ChannelType(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for ChannelType(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x259218CE4);
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

uint64_t sub_259218D0C(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_259218D18(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for ChannelType()
{
  return &type metadata for ChannelType;
}

uint64_t dispatch thunk of ChannelPort.channel.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t method lookup function for Channel(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for Channel);
}

uint64_t dispatch thunk of Pipeline.identifier.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of Pipeline.inputChannels.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of Pipeline.outputChannels.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of MutablePipeline.addPipeline(with:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t dispatch thunk of MutablePipeline.addPipeline(with:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 24))();
}

uint64_t dispatch thunk of MutablePipeline.addInputChannel(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 32))();
}

uint64_t dispatch thunk of MutablePipeline.addOutputChannel(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 40))();
}

uint64_t dispatch thunk of MutablePipeline.canConnect(inputPort:to:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 48))();
}

uint64_t dispatch thunk of MutablePipeline.connect(inputPort:to:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 56))();
}

uint64_t method lookup function for ConcretePipeline(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for ConcretePipeline);
}

uint64_t dispatch thunk of ConcretePipeline.identifier.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 96))();
}

uint64_t dispatch thunk of ConcretePipeline.inputChannels.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 104))();
}

uint64_t dispatch thunk of ConcretePipeline.outputChannels.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 112))();
}

uint64_t dispatch thunk of ConcretePipeline.addPipeline(with:)()
{
  OUTLINED_FUNCTION_3();
  return (*(uint64_t (**)(void))(v0 + 120))();
}

{
  uint64_t v0;

  OUTLINED_FUNCTION_3();
  return (*(uint64_t (**)(void))(v0 + 128))();
}

uint64_t dispatch thunk of ConcretePipeline.addInputChannel(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 136))();
}

uint64_t dispatch thunk of ConcretePipeline.addOutputChannel(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 144))();
}

uint64_t dispatch thunk of ConcretePipeline.canConnect(inputPort:to:)()
{
  OUTLINED_FUNCTION_3();
  return (*(uint64_t (**)(void))(v0 + 152))();
}

uint64_t dispatch thunk of ConcretePipeline.connect(inputPort:to:)()
{
  OUTLINED_FUNCTION_3();
  return (*(uint64_t (**)(void))(v0 + 160))();
}

uint64_t OUTLINED_FUNCTION_0()
{
  return swift_allocObject();
}

id OUTLINED_FUNCTION_1(const char **a1)
{
  int v3 = *a1;
  unsigned int v4 = *(void **)(v1 + 16);
  return [v4 v3];
}

uint64_t OUTLINED_FUNCTION_2(uint64_t a1, ...)
{
  va_start(va1, a1);
  va_start(va, a1);
  uint64_t v5 = va_arg(va1, void);
  return MEMORY[0x270FA0260]((uint64_t *)va, va1, v1, v2, 7);
}

uint64_t sub_25921907C()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_25921908C()
{
  return MEMORY[0x270F9D4A0]();
}

uint64_t sub_25921909C()
{
  return MEMORY[0x270F9D4A8]();
}

uint64_t sub_2592190AC()
{
  return MEMORY[0x270F9D4B0]();
}

uint64_t sub_2592190BC()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_2592190CC()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_2592190DC()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_2592190EC()
{
  return MEMORY[0x270FA1180]();
}

uint64_t sub_2592190FC()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_25921910C()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_25921911C()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_25921912C()
{
  return MEMORY[0x270F9EBE0]();
}

uint64_t sub_25921913C()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_25921914C()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_25921915C()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_25921916C()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_25921917C()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_25921918C()
{
  return MEMORY[0x270F9FC90]();
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
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

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_dynamicCastObjCClassUnconditional()
{
  return MEMORY[0x270FA0290]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x270FA03D0]();
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